#include "utils.h"

APTR GetVBR(void) {
	APTR vbr = 0;
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE

	if (SysBase->AttnFlags & AFF_68010) 
		vbr = (APTR)Supervisor((void*)getvbr);

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

inline void WaitBlt() {
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
}

ULONG ClsSprites[] = { 0x01200000, 0x01220000,0x01240000,0x01260000, 0x01280000, 
        0x012a0000, 0x012c0000, 0x012e0000, 0x01300000, 0x01320000, 0x01340000,
                 0x01360000, 0x01380000, 0x013a0000, 0x013c0000, 0x013e0000  };

ULONG ClScreen[] = { 0x01fc0000, 0x01060c00, 0x0968020, 0x08e2c81, 0x0902cc1,
          0x0920038, 0x09400d0, 0x01020000, 0x01040000, 0x01080000, 0x010a0000, 
                                                                  0x01001200 };

void ClBuild() {
  ULONG *clinstruction;
  clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
  for(int i=0; i<16;i++)
    *clinstruction++ = *clpartinstruction++;
  clpartinstruction = ClScreen;
  for(int i=0; i<12;i++)
    *clinstruction++ = *clpartinstruction++;
  CopBpl1High = (long) clinstruction + 2;
  *clinstruction++ = 0x00e00000;
  CopBpl1Low = (long) clinstruction + 2;
  *clinstruction++ = 0x00e20000;
  *clinstruction = 0xfffffffe;
}

void SetBplPointers() {
  UWORD highword = DrawBuffer >> 16;
  UWORD lowword = DrawBuffer & 0xffff;
  
  *CopBpl1Low = lowword;
  *CopBpl1High = highword;
  
  ULONG tmp = DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = tmp;
}

void SwapCl() {
  ULONG tmp = DrawCopper;
  DrawCopper = ViewCopper;
  ViewCopper = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
	OwnBlitter();
	WaitBlit();	
	Disable();
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
	SystemInts=hw->intenar;
	SystemDMA=hw->dmaconr;
	hw->intena=0x7fff;//disable all interrupts
	hw->intreq=0x7fff;//Clear any interrupts that were pending
	
	WaitVbl();
	WaitVbl();
	hw->dmacon=0x7fff;//Clear all DMA channels

	//set all colors black
	for(int a=0;a<32;a++)
		hw->color[a]=0;

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
	hw->intena=0x7fff;//disable all interrupts
	hw->intreq=0x7fff;//Clear any interrupts that were pending
	hw->dmacon=0x7fff;//Clear all DMA channels

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
	hw->copjmp1=0x7fff; //start coppper

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
	hw->dmacon=SystemDMA|0x8000;
	hw->adkcon=SystemADKCON|0x8000;

	LoadView(ActiView);
	WaitTOF();
	WaitTOF();
	WaitBlit();	
	DisownBlitter();
	Enable();
}

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
short MouseRight(){return !((*(volatile UWORD*)0xdff016)&(1<<10));}