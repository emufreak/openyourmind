#include <proto/exec.h>
#include <proto/dos.h>
#include <proto/graphics.h>
#include <graphics/gfxbase.h>
#include <graphics/view.h>
#include <exec/execbase.h>
#include <graphics/gfxmacros.h>
#include <hardware/custom.h>
#include <hardware/dmabits.h>
#include <hardware/intbits.h>
#include "utils.h"
#include "zoom.h"
#include "support/gcc8_c_support.h"

struct ExecBase *SysBase;
volatile struct Custom *custom;
struct DosLibrary *DOSBase;
struct GfxBase *GfxBase;

//backup
static UWORD SystemInts;
static UWORD SystemDMA;
static UWORD SystemADKCON;
volatile static APTR VBR=0;
static APTR SystemIrq;
 
struct View *ActiView;

static APTR GetVBR(void) {
	APTR vbr = 0;
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE

	if (SysBase->AttnFlags & AFF_68010) 
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);

	return vbr;
}

void SetInterruptHandler(APTR interrupt) {
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
}

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
}

//vblank begins at vpos 312 hpos 1 and ends at vpos 25 hpos 1
//vsync begins at line 2 hpos 132 and ends at vpos 5 hpos 18 
void WaitVbl() {
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
		vpos&=0x1ff00;
		if (vpos!=(311<<8))
			break;
	}
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
		vpos&=0x1ff00;
		if (vpos==(311<<8))
			break;
	}
}

/*inline void WaitBlt() {
	UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
}*/

void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
	OwnBlitter();
	WaitBlit();	
	//Disable();
	Forbid();
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=custom->adkconr;
	SystemInts=custom->intenar;
	SystemDMA=custom->dmaconr;
	custom->intena=0x7fff;//disable all interrupts
	custom->intreq=0x7fff;//Clear any interrupts that were pending
	
	WaitVbl();
	WaitVbl();
	custom->dmacon=0x7fff;//Clear all DMA channels

	//set all colors black
	for(int a=0;a<32;a++)
		custom->color[a]=0;

	LoadView(0);
	WaitTOF();
	WaitTOF();

	WaitVbl();
	WaitVbl();

	VBR=GetVBR();
	SystemIrq=GetInterruptHandler(); //store interrupt register
}

void FreeSystem() { 
	WaitVbl();
	WaitBlt();
	custom->intena=0x7fff;//disable all interrupts
	custom->intreq=0x7fff;//Clear any interrupts that were pending
	custom->dmacon=0x7fff;//Clear all DMA channels

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
	custom->copjmp1=0x7fff; //start coppper

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
	custom->dmacon=SystemDMA|0x8000;
	custom->adkcon=SystemADKCON|0x8000;

	LoadView(ActiView);
	WaitTOF();
	WaitTOF();
	WaitBlit();	
	DisownBlitter();
	//Enable();
	Permit();
}

/*inline short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
inline short MouseRight(){return !((*(volatile UWORD*)0xdff016)&(1<<10));}*/

// DEMO - INCBIN
volatile short frameCounter = 0;
//INCBIN(colors, "image.pal")
//INCBIN_CHIP(image, "image.bpl") // load image into chipmem so we can use it without copying

// put copperlist into chip mem so we can use it without copying
const UWORD copper2[] __attribute__((section (".MEMF_CHIP"))) = {
	0xe001, 0xff00, offsetof(struct Custom, color[29]), 0x0eee, // line 0xe0
	0xe101, 0xff00, offsetof(struct Custom, color[29]), 0x0ddd, // line 0xe1
	0xe201, 0xff00, offsetof(struct Custom, color[29]), 0x0ccc, // line 0xe2
	0xe301, 0xff00, offsetof(struct Custom, color[29]), 0x0bbb, // line 0xe3
	0xe401, 0xff00, offsetof(struct Custom, color[29]), 0x0aaa, // line 0xe4
	0xe501, 0xff00, offsetof(struct Custom, color[29]), 0x0999, // line 0xe5
	0xe601, 0xff00, offsetof(struct Custom, color[29]), 0x0888, // line 0xe6
	0xe701, 0xff00, offsetof(struct Custom, color[29]), 0x0777, // line 0xe7
	0xe801, 0xff00, offsetof(struct Custom, color[29]), 0x0666, // line 0xe8
	0xe901, 0xff00, offsetof(struct Custom, color[29]), 0x0555, // line 0xe9
	0xea01, 0xff00, offsetof(struct Custom, color[29]), 0x0444, // line 0xea
	0xeb01, 0xff00, offsetof(struct Custom, color[29]), 0x0333, // line 0xeb
	0xec01, 0xff00, offsetof(struct Custom, color[29]), 0x0222, // line 0xec
	0xed01, 0xff00, offsetof(struct Custom, color[29]), 0x0111, // line 0xed
	0xee01, 0xff00, offsetof(struct Custom, color[29]), 0x0000, // line 0xee
	0xffff, 0xfffe // end copper list
};

inline USHORT* copSetPlanes(UBYTE bplPtrStart,USHORT* copListEnd,const UBYTE **planes,int numPlanes) {
	for (USHORT i=0;i<numPlanes;i++) {
		ULONG addr=(ULONG)planes[i];
		*copListEnd++=offsetof(struct Custom, bplpt[i + bplPtrStart]);
		*copListEnd++=(UWORD)(addr>>16);
		*copListEnd++=offsetof(struct Custom, bplpt[i + bplPtrStart])+2;
		*copListEnd++=(UWORD)addr;
	}
	return copListEnd;
}

inline USHORT* copWaitXY(USHORT *copListEnd,USHORT x,USHORT i) {
	*copListEnd++=(i<<8)|(x<<1)|1;	//bit 1 means wait. waits for vertical position x<<8, first raster stop position outside the left 
	*copListEnd++=0xfffe;
	return copListEnd;
}

inline USHORT* copWaitY(USHORT* copListEnd,USHORT i) {
	*copListEnd++=(i<<8)|4|1;	//bit 1 means wait. waits for vertical position x<<8, first raster stop position outside the left 
	*copListEnd++=0xfffe;
	return copListEnd;
}

inline USHORT* copSetColor(USHORT* copListCurrent,USHORT index,USHORT color) {
	*copListCurrent++=offsetof(struct Custom, color[index]);
	*copListCurrent++=color;
	return copListCurrent;
}

static __attribute__((interrupt)) void interruptHandler() {
	custom->intreq=(1<<INTB_VERTB); custom->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
	// DEMO - increment frameCounter
	frameCounter++;
}

#ifdef __cplusplus
	class TestClass {
	public:
		TestClass(int y) {
			static int x = 7;
			i = y + x;
		}

		int i;
	};

	TestClass staticClass(4);
#endif

// set up a 320x256 lowres display
inline USHORT* screenScanDefault(USHORT* copListEnd) {
	const USHORT x=129;
	const USHORT width=320;
	const USHORT height=256;
	const USHORT y=44;
	const USHORT RES=8; //8=lowres,4=hires
	USHORT xstop = x+width;
	USHORT ystop = y+height;
	USHORT fw=(x>>1)-RES;

	*copListEnd++ = offsetof(struct Custom, ddfstrt);
	*copListEnd++ = fw;
	*copListEnd++ = offsetof(struct Custom, ddfstop);
	*copListEnd++ = fw+(((width>>4)-1)<<3);
	*copListEnd++ = offsetof(struct Custom, diwstrt);
	*copListEnd++ = x+(y<<8);
	*copListEnd++ = offsetof(struct Custom, diwstop);
	*copListEnd++ = (xstop-256)+((ystop-256)<<8);
	return copListEnd;
}

int main() {
	ULONG tmp = 4;
    SysBase = *((struct ExecBase**)tmp);
	hw = (struct Custom*)0xdff000;

	SysBase = *((struct ExecBase**)4UL);
	custom = (struct Custom*)0xdff000;

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
	if (!GfxBase)
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
	if (!DOSBase)
		Exit(0);

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
	Delay(50);

	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	/*TakeSystem();*/
	WaitVbl();
  
  	Zoom_InitRun();
  	//RunTests();	//warpmode(1);
	// TODO: precalc stuff here
	//warpmode(0);

	TakeSystem();
	WaitVbl();

	// DEMO

	RunDemo();

	// DEMO
	SetInterruptHandler((APTR)interruptHandler);
	custom->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
	custom->intreq=1<<INTB_VERTB;//reset vbl req

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
	CloseLibrary((struct Library*)GfxBase);
}
