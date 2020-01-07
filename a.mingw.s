
a.mingw.elf:     file format elf32-m68k


Disassembly of section .text:

00000000 <_start>:


int main();

__attribute__((used)) __attribute__((section(".text.unlikely"))) void _start() {
	main();
   0:	4ef9 0000 0006 	jmp 6 <main>

00000006 <main>:
#include "utils.h"
#include "runtests.h"
#include "rundemo.h"

int main() {
   6:	4fef fff4      	lea -12(sp),sp
   a:	48e7 3132      	movem.l d2-d3/d7/a2-a3/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
   e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
  12:	23ce 0000 2e4a 	move.l a6,2e4a <SysBase>
	hw = (struct Custom*)0xdff000;
  18:	23fc 00df f000 	move.l #14675968,2e46 <hw>
  1e:	0000 2e46 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
  22:	43f9 0000 0ceb 	lea ceb <incbin_colors_end+0x6f>,a1
  28:	7000           	moveq #0,d0
  2a:	4eae fdd8      	jsr -552(a6)
  2e:	23c0 0000 2e42 	move.l d0,2e42 <GfxBase>
	if (!GfxBase)
  34:	6700 04c8      	beq.w 4fe <main+0x4f8>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
  38:	2c79 0000 2e4a 	movea.l 2e4a <SysBase>,a6
  3e:	43f9 0000 0cfc 	lea cfc <incbin_colors_end+0x80>,a1
  44:	7000           	moveq #0,d0
  46:	4eae fdd8      	jsr -552(a6)
  4a:	23c0 0000 2e3e 	move.l d0,2e3e <DOSBase>
	if (!DOSBase)
  50:	6700 04a0      	beq.w 4f2 <main+0x4ec>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
  54:	4879 0000 0d08 	pea d08 <incbin_colors_end+0x8c>
  5a:	4eb9 0000 0642 	jsr 642 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
  60:	2c79 0000 2e3e 	movea.l 2e3e <DOSBase>,a6
  66:	4eae ffc4      	jsr -60(a6)
  6a:	2c79 0000 2e3e 	movea.l 2e3e <DOSBase>,a6
  70:	2200           	move.l d0,d1
  72:	243c 0000 0d24 	move.l #3364,d2
  78:	760f           	moveq #15,d3
  7a:	4eae ffd0      	jsr -48(a6)
  //RunTests();
	Delay(50);
  7e:	2c79 0000 2e3e 	movea.l 2e3e <DOSBase>,a6
  84:	7232           	moveq #50,d1
  86:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
  8a:	247c 00f0 ff60 	movea.l #15794016,a2
  90:	588f           	addq.l #4,sp
  92:	4a92           	tst.l (a2)
  94:	6718           	beq.s ae <main+0xa8>
  96:	4878 0001      	pea 1 <_start+0x1>
  9a:	47f9 0000 05a0 	lea 5a0 <warpmode.part.0>,a3
  a0:	4e93           	jsr (a3)
  a2:	588f           	addq.l #4,sp
  a4:	4a92           	tst.l (a2)
  a6:	6706           	beq.s ae <main+0xa8>
  a8:	42a7           	clr.l -(sp)
  aa:	4e93           	jsr (a3)
  ac:	588f           	addq.l #4,sp
  ViewCopper = tmp;
  hw->cop1lc = ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
  ae:	2c79 0000 2e42 	movea.l 2e42 <GfxBase>,a6
  b4:	23ee 0022 0000 	move.l 34(a6),2e2c <ActiView>
  ba:	2e2c 
	OwnBlitter();
  bc:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
  c0:	2c79 0000 2e42 	movea.l 2e42 <GfxBase>,a6
  c6:	4eae ff1c      	jsr -228(a6)
	Disable();
  ca:	2c79 0000 2e4a 	movea.l 2e4a <SysBase>,a6
  d0:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
  d4:	2479 0000 2e46 	movea.l 2e46 <hw>,a2
  da:	302a 0010      	move.w 16(a2),d0
  de:	33c0 0000 2e30 	move.w d0,2e30 <SystemADKCON>
	SystemInts=hw->intenar;
  e4:	302a 001c      	move.w 28(a2),d0
  e8:	33c0 0000 2e34 	move.w d0,2e34 <SystemInts>
	SystemDMA=hw->dmaconr;
  ee:	302a 0002      	move.w 2(a2),d0
  f2:	33c0 0000 2e32 	move.w d0,2e32 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
  f8:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
  fe:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
 104:	47f9 0000 06d4 	lea 6d4 <WaitVbl>,a3
 10a:	4e93           	jsr (a3)
	WaitVbl();
 10c:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
 10e:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
 114:	2c79 0000 2e42 	movea.l 2e42 <GfxBase>,a6
 11a:	93c9           	suba.l a1,a1
 11c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 120:	2c79 0000 2e42 	movea.l 2e42 <GfxBase>,a6
 126:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 12a:	2c79 0000 2e42 	movea.l 2e42 <GfxBase>,a6
 130:	4eae fef2      	jsr -270(a6)

	WaitVbl();
 134:	4e93           	jsr (a3)
	WaitVbl();
 136:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
 138:	3f7c 4e7a 001e 	move.w #20090,30(sp)
 13e:	3f7c 0801 0020 	move.w #2049,32(sp)
 144:	3f7c 4e73 0022 	move.w #20083,34(sp)
	if (SysBase->AttnFlags & AFF_68010) 
 14a:	2c79 0000 2e4a 	movea.l 2e4a <SysBase>,a6
 150:	082e 0000 0129 	btst #0,297(a6)
 156:	6700 03d0      	beq.w 528 <main+0x522>
		vbr = (APTR)Supervisor((void*)getvbr);
 15a:	7e1e           	moveq #30,d7
 15c:	de8f           	add.l sp,d7
 15e:	cf8d           	exg d7,a5
 160:	4eae ffe2      	jsr -30(a6)
 164:	cf8d           	exg d7,a5

	VBR=GetVBR();
 166:	23c0 0000 2e36 	move.l d0,2e36 <VBR.lto_priv.1>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 16c:	2079 0000 2e36 	movea.l 2e36 <VBR.lto_priv.1>,a0
 172:	2028 006c      	move.l 108(a0),d0
	SystemIrq=GetInterruptHandler(); //store interrupt register
 176:	23c0 0000 2e3a 	move.l d0,2e3a <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
 17c:	4e93           	jsr (a3)
	// DEMO - increment frameCounter
	frameCounter++;
}

void RunDemo() {
  hw->dmacon = 0b1001001111100000;
 17e:	2079 0000 2e46 	movea.l 2e46 <hw>,a0
 184:	317c 93e0 0096 	move.w #-27680,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 18a:	2279 0000 2e36 	movea.l 2e36 <VBR.lto_priv.1>,a1
 190:	237c 0000 06aa 	move.l #1706,108(a1)
 196:	006c 
	SetInterruptHandler((APTR)interruptHandler);
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
 198:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
 19e:	317c 0020 009c 	move.w #32,156(a0)
  Copperlist1 = ClBuild( );
 1a4:	45f9 0000 071a 	lea 71a <ClBuild>,a2
 1aa:	4e92           	jsr (a2)
 1ac:	23c0 0000 2e18 	move.l d0,2e18 <Copperlist1>
  Copperlist2 = ClBuild( );
 1b2:	4e92           	jsr (a2)
 1b4:	23c0 0000 2e14 	move.l d0,2e14 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
 1ba:	2c79 0000 2e4a 	movea.l 2e4a <SysBase>,a6
 1c0:	203c 0000 c800 	move.l #51200,d0
 1c6:	7202           	moveq #2,d1
 1c8:	4eae ff3a      	jsr -198(a6)
 1cc:	23c0 0000 2e10 	move.l d0,2e10 <Bitplane1>
  if(Bitplane1 == 0) {
 1d2:	6700 02be      	beq.w 492 <main+0x48c>
  DrawBuffer = Bitplane1;
 1d6:	23c0 0000 2e28 	move.l d0,2e28 <DrawBuffer>
  DrawCopper = Copperlist1;
 1dc:	23f9 0000 2e18 	move.l 2e18 <Copperlist1>,2e24 <DrawCopper>
 1e2:	0000 2e24 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
 1e6:	2c79 0000 2e4a 	movea.l 2e4a <SysBase>,a6
 1ec:	203c 0000 c800 	move.l #51200,d0
 1f2:	7202           	moveq #2,d1
 1f4:	4eae ff3a      	jsr -198(a6)
 1f8:	23c0 0000 2e0c 	move.l d0,2e0c <Bitplane2>
  if(Bitplane2 == 0) {
 1fe:	6700 0200      	beq.w 400 <main+0x3fa>
  ViewCopper = Copperlist2;
 202:	2079 0000 2e14 	movea.l 2e14 <Copperlist2>,a0
  ULONG tmp = DrawCopper;
 208:	2279 0000 2e24 	movea.l 2e24 <DrawCopper>,a1
  hw->cop1lc = ViewCopper;
 20e:	2479 0000 2e46 	movea.l 2e46 <hw>,a2
 214:	2549 0080      	move.l a1,128(a2)
  hw->copjmp1 = tmp;
 218:	3549 0088      	move.w a1,136(a2)
  UWORD highword = (ULONG)DrawBuffer >> 16;
 21c:	2239 0000 2e28 	move.l 2e28 <DrawBuffer>,d1
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
 222:	3141 0076      	move.w d1,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
 226:	2401           	move.l d1,d2
 228:	4242           	clr.w d2
 22a:	4842           	swap d2
 22c:	3142 0072      	move.w d2,114(a0)
  ViewCopper = tmp;
 230:	23c8 0000 2e1c 	move.l a0,2e1c <ViewCopper>
  hw->cop1lc = ViewCopper;
 236:	2548 0080      	move.l a0,128(a2)
  hw->copjmp1 = tmp;
 23a:	3548 0088      	move.w a0,136(a2)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
 23e:	3340 0076      	move.w d0,118(a1)
  UWORD highword = (ULONG)DrawBuffer >> 16;
 242:	2600           	move.l d0,d3
 244:	4243           	clr.w d3
 246:	4843           	swap d3
 248:	3343 0072      	move.w d3,114(a1)
  ViewBuffer = tmp;
 24c:	23c0 0000 2e20 	move.l d0,2e20 <ViewBuffer>
	WaitBlit();	
	DisownBlitter();
	Enable();
}

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
 252:	1639 00bf e001 	move.b bfe001 <gcc8_c_support.c.e9862530+0xbeeb39>,d3
  PrepareDisplay();

	while(!MouseLeft()) {
 258:	0803 0006      	btst #6,d3
 25c:	6700 00ba      	beq.w 318 <main+0x312>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 260:	2639 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdefb3c>,d3
 266:	2f43 001e      	move.l d3,30(sp)
		vpos&=0x1ff00;
 26a:	262f 001e      	move.l 30(sp),d3
 26e:	0283 0001 ff00 	andi.l #130816,d3
 274:	2f43 001e      	move.l d3,30(sp)
		if (vpos!=(311<<8))
 278:	262f 001e      	move.l 30(sp),d3
 27c:	0c83 0001 3700 	cmpi.l #79616,d3
 282:	67dc           	beq.s 260 <main+0x25a>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 284:	2639 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdefb3c>,d3
 28a:	2f43 001a      	move.l d3,26(sp)
		vpos&=0x1ff00;
 28e:	262f 001a      	move.l 26(sp),d3
 292:	0283 0001 ff00 	andi.l #130816,d3
 298:	2f43 001a      	move.l d3,26(sp)
		if (vpos==(311<<8))
 29c:	262f 001a      	move.l 26(sp),d3
 2a0:	0c83 0001 3700 	cmpi.l #79616,d3
 2a6:	66dc           	bne.s 284 <main+0x27e>
  DrawCopper = ViewCopper;
 2a8:	23c8 0000 2e24 	move.l a0,2e24 <DrawCopper>
  ViewCopper = tmp;
 2ae:	23c9 0000 2e1c 	move.l a1,2e1c <ViewCopper>
  hw->cop1lc = ViewCopper;
 2b4:	2549 0080      	move.l a1,128(a2)
  hw->copjmp1 = tmp;
 2b8:	3549 0088      	move.w a1,136(a2)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
 2bc:	3141 0076      	move.w d1,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
 2c0:	3142 0072      	move.w d2,114(a0)
  DrawBuffer = ViewBuffer;
 2c4:	23c0 0000 2e28 	move.l d0,2e28 <DrawBuffer>
  ViewBuffer = tmp;
 2ca:	23c1 0000 2e20 	move.l d1,2e20 <ViewBuffer>
short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
 2d0:	1439 00bf e001 	move.b bfe001 <gcc8_c_support.c.e9862530+0xbeeb39>,d2
 2d6:	2600           	move.l d0,d3
 2d8:	2001           	move.l d1,d0
 2da:	2208           	move.l a0,d1
 2dc:	2049           	movea.l a1,a0
 2de:	0802 0006      	btst #6,d2
 2e2:	6734           	beq.s 318 <main+0x312>
 2e4:	2241           	movea.l d1,a1
 2e6:	2203           	move.l d3,d1
 2e8:	2403           	move.l d3,d2
 2ea:	4242           	clr.w d2
 2ec:	4842           	swap d2
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 2ee:	2639 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdefb3c>,d3
 2f4:	2f43 001e      	move.l d3,30(sp)
		vpos&=0x1ff00;
 2f8:	262f 001e      	move.l 30(sp),d3
 2fc:	0283 0001 ff00 	andi.l #130816,d3
 302:	2f43 001e      	move.l d3,30(sp)
		if (vpos!=(311<<8))
 306:	262f 001e      	move.l 30(sp),d3
 30a:	0c83 0001 3700 	cmpi.l #79616,d3
 310:	6700 ff4e      	beq.w 260 <main+0x25a>
 314:	6000 ff6e      	bra.w 284 <main+0x27e>
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 318:	2079 0000 2e36 	movea.l 2e36 <VBR.lto_priv.1>,a0
 31e:	217c 0000 06aa 	move.l #1706,108(a0)
 324:	006c 
	WaitVbl();
 326:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 328:	302a 0002      	move.w 2(a2),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 32c:	302a 0002      	move.w 2(a2),d0
 330:	0800 000e      	btst #14,d0
 334:	66f6           	bne.s 32c <main+0x326>
	hw->intena=0x7fff;//disable all interrupts
 336:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 33c:	357c 7fff 009c 	move.w #32767,156(a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
 342:	357c 7fff 0096 	move.w #32767,150(a2)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 348:	2079 0000 2e36 	movea.l 2e36 <VBR.lto_priv.1>,a0
 34e:	2179 0000 2e3a 	move.l 2e3a <SystemIrq>,108(a0)
 354:	006c 
	hw->cop1lc=(ULONG)GfxBase->copinit;
 356:	2c79 0000 2e42 	movea.l 2e42 <GfxBase>,a6
 35c:	256e 0026 0080 	move.l 38(a6),128(a2)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
 362:	256e 0032 0084 	move.l 50(a6),132(a2)
	hw->copjmp1=0x7fff; //start coppper
 368:	357c 7fff 0088 	move.w #32767,136(a2)
	hw->intena=SystemInts|0x8000;
 36e:	3039 0000 2e34 	move.w 2e34 <SystemInts>,d0
 374:	0040 8000      	ori.w #-32768,d0
 378:	3540 009a      	move.w d0,154(a2)
	hw->dmacon=SystemDMA|0x8000;
 37c:	3039 0000 2e32 	move.w 2e32 <SystemDMA>,d0
 382:	0040 8000      	ori.w #-32768,d0
 386:	3540 0096      	move.w d0,150(a2)
	hw->adkcon=SystemADKCON|0x8000;
 38a:	3039 0000 2e30 	move.w 2e30 <SystemADKCON>,d0
 390:	0040 8000      	ori.w #-32768,d0
 394:	3540 009e      	move.w d0,158(a2)
	LoadView(ActiView);
 398:	2279 0000 2e2c 	movea.l 2e2c <ActiView>,a1
 39e:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 3a2:	2c79 0000 2e42 	movea.l 2e42 <GfxBase>,a6
 3a8:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 3ac:	2c79 0000 2e42 	movea.l 2e42 <GfxBase>,a6
 3b2:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
 3b6:	2c79 0000 2e42 	movea.l 2e42 <GfxBase>,a6
 3bc:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
 3c0:	2c79 0000 2e42 	movea.l 2e42 <GfxBase>,a6
 3c6:	4eae fe32      	jsr -462(a6)
	Enable();
 3ca:	2c79 0000 2e4a 	movea.l 2e4a <SysBase>,a6
 3d0:	4eae ff82      	jsr -126(a6)
	RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
 3d4:	2c79 0000 2e4a 	movea.l 2e4a <SysBase>,a6
 3da:	2279 0000 2e3e 	movea.l 2e3e <DOSBase>,a1
 3e0:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
 3e4:	2c79 0000 2e4a 	movea.l 2e4a <SysBase>,a6
 3ea:	2279 0000 2e42 	movea.l 2e42 <GfxBase>,a1
 3f0:	4eae fe62      	jsr -414(a6)
}
 3f4:	7000           	moveq #0,d0
 3f6:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
 3fa:	4fef 000c      	lea 12(sp),sp
 3fe:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
 400:	2c79 0000 2e3e 	movea.l 2e3e <DOSBase>,a6
 406:	4eae ffc4      	jsr -60(a6)
 40a:	2c79 0000 2e3e 	movea.l 2e3e <DOSBase>,a6
 410:	2200           	move.l d0,d1
 412:	243c 0000 0d5b 	move.l #3419,d2
 418:	7626           	moveq #38,d3
 41a:	4eae ffd0      	jsr -48(a6)
    Exit(1);
 41e:	2c79 0000 2e3e 	movea.l 2e3e <DOSBase>,a6
 424:	7201           	moveq #1,d1
 426:	4eae ff70      	jsr -144(a6)
 42a:	2039 0000 2e0c 	move.l 2e0c <Bitplane2>,d0
  ViewCopper = Copperlist2;
 430:	2079 0000 2e14 	movea.l 2e14 <Copperlist2>,a0
  ULONG tmp = DrawCopper;
 436:	2279 0000 2e24 	movea.l 2e24 <DrawCopper>,a1
  hw->cop1lc = ViewCopper;
 43c:	2479 0000 2e46 	movea.l 2e46 <hw>,a2
 442:	2549 0080      	move.l a1,128(a2)
  hw->copjmp1 = tmp;
 446:	3549 0088      	move.w a1,136(a2)
  UWORD highword = (ULONG)DrawBuffer >> 16;
 44a:	2239 0000 2e28 	move.l 2e28 <DrawBuffer>,d1
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
 450:	3141 0076      	move.w d1,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
 454:	2401           	move.l d1,d2
 456:	4242           	clr.w d2
 458:	4842           	swap d2
 45a:	3142 0072      	move.w d2,114(a0)
  ViewCopper = tmp;
 45e:	23c8 0000 2e1c 	move.l a0,2e1c <ViewCopper>
  hw->cop1lc = ViewCopper;
 464:	2548 0080      	move.l a0,128(a2)
  hw->copjmp1 = tmp;
 468:	3548 0088      	move.w a0,136(a2)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
 46c:	3340 0076      	move.w d0,118(a1)
  UWORD highword = (ULONG)DrawBuffer >> 16;
 470:	2600           	move.l d0,d3
 472:	4243           	clr.w d3
 474:	4843           	swap d3
 476:	3343 0072      	move.w d3,114(a1)
  ViewBuffer = tmp;
 47a:	23c0 0000 2e20 	move.l d0,2e20 <ViewBuffer>
short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
 480:	1639 00bf e001 	move.b bfe001 <gcc8_c_support.c.e9862530+0xbeeb39>,d3
 486:	0803 0006      	btst #6,d3
 48a:	6600 fdd4      	bne.w 260 <main+0x25a>
 48e:	6000 fe88      	bra.w 318 <main+0x312>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
 492:	2c79 0000 2e3e 	movea.l 2e3e <DOSBase>,a6
 498:	4eae ffc4      	jsr -60(a6)
 49c:	2c79 0000 2e3e 	movea.l 2e3e <DOSBase>,a6
 4a2:	2200           	move.l d0,d1
 4a4:	243c 0000 0d34 	move.l #3380,d2
 4aa:	7626           	moveq #38,d3
 4ac:	4eae ffd0      	jsr -48(a6)
    Exit(1);
 4b0:	2c79 0000 2e3e 	movea.l 2e3e <DOSBase>,a6
 4b6:	7201           	moveq #1,d1
 4b8:	4eae ff70      	jsr -144(a6)
 4bc:	2039 0000 2e10 	move.l 2e10 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
 4c2:	23c0 0000 2e28 	move.l d0,2e28 <DrawBuffer>
  DrawCopper = Copperlist1;
 4c8:	23f9 0000 2e18 	move.l 2e18 <Copperlist1>,2e24 <DrawCopper>
 4ce:	0000 2e24 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
 4d2:	2c79 0000 2e4a 	movea.l 2e4a <SysBase>,a6
 4d8:	203c 0000 c800 	move.l #51200,d0
 4de:	7202           	moveq #2,d1
 4e0:	4eae ff3a      	jsr -198(a6)
 4e4:	23c0 0000 2e0c 	move.l d0,2e0c <Bitplane2>
  if(Bitplane2 == 0) {
 4ea:	6600 fd16      	bne.w 202 <main+0x1fc>
 4ee:	6000 ff10      	bra.w 400 <main+0x3fa>
		Exit(0);
 4f2:	9dce           	suba.l a6,a6
 4f4:	7200           	moveq #0,d1
 4f6:	4eae ff70      	jsr -144(a6)
 4fa:	6000 fb58      	bra.w 54 <main+0x4e>
		Exit(0);
 4fe:	2c79 0000 2e3e 	movea.l 2e3e <DOSBase>,a6
 504:	7200           	moveq #0,d1
 506:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
 50a:	2c79 0000 2e4a 	movea.l 2e4a <SysBase>,a6
 510:	43f9 0000 0cfc 	lea cfc <incbin_colors_end+0x80>,a1
 516:	7000           	moveq #0,d0
 518:	4eae fdd8      	jsr -552(a6)
 51c:	23c0 0000 2e3e 	move.l d0,2e3e <DOSBase>
	if (!DOSBase)
 522:	6600 fb30      	bne.w 54 <main+0x4e>
 526:	60ca           	bra.s 4f2 <main+0x4ec>
	APTR vbr = 0;
 528:	7000           	moveq #0,d0
	VBR=GetVBR();
 52a:	23c0 0000 2e36 	move.l d0,2e36 <VBR.lto_priv.1>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 530:	2079 0000 2e36 	movea.l 2e36 <VBR.lto_priv.1>,a0
 536:	2028 006c      	move.l 108(a0),d0
	SystemIrq=GetInterruptHandler(); //store interrupt register
 53a:	23c0 0000 2e3a 	move.l d0,2e3a <SystemIrq>
	WaitVbl();
 540:	4e93           	jsr (a3)
  hw->dmacon = 0b1001001111100000;
 542:	2079 0000 2e46 	movea.l 2e46 <hw>,a0
 548:	317c 93e0 0096 	move.w #-27680,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 54e:	2279 0000 2e36 	movea.l 2e36 <VBR.lto_priv.1>,a1
 554:	237c 0000 06aa 	move.l #1706,108(a1)
 55a:	006c 
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
 55c:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
 562:	317c 0020 009c 	move.w #32,156(a0)
  Copperlist1 = ClBuild( );
 568:	45f9 0000 071a 	lea 71a <ClBuild>,a2
 56e:	4e92           	jsr (a2)
 570:	23c0 0000 2e18 	move.l d0,2e18 <Copperlist1>
  Copperlist2 = ClBuild( );
 576:	4e92           	jsr (a2)
 578:	23c0 0000 2e14 	move.l d0,2e14 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
 57e:	2c79 0000 2e4a 	movea.l 2e4a <SysBase>,a6
 584:	203c 0000 c800 	move.l #51200,d0
 58a:	7202           	moveq #2,d1
 58c:	4eae ff3a      	jsr -198(a6)
 590:	23c0 0000 2e10 	move.l d0,2e10 <Bitplane1>
  if(Bitplane1 == 0) {
 596:	6600 fc3e      	bne.w 1d6 <main+0x1d0>
 59a:	6000 fef6      	bra.w 492 <main+0x48c>
 59e:	4e71           	nop

000005a0 <warpmode.part.0>:
void warpmode(int on) 
 5a0:	598f           	subq.l #4,sp
 5a2:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 5a4:	4aaf 000c      	tst.l 12(sp)
 5a8:	674c           	beq.s 5f6 <warpmode.part.0+0x56>
 5aa:	4878 0001      	pea 1 <_start+0x1>
 5ae:	740b           	moveq #11,d2
 5b0:	d48f           	add.l sp,d2
 5b2:	2f02           	move.l d2,-(sp)
 5b4:	42a7           	clr.l -(sp)
 5b6:	4879 0000 0cb0 	pea cb0 <incbin_colors_end+0x34>
 5bc:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff0b37>
 5c0:	4878 0052      	pea 52 <main+0x4c>
 5c4:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf00a98>
 5ca:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 5ce:	203c 0000 0c96 	move.l #3222,d0
 5d4:	4878 0001      	pea 1 <_start+0x1>
 5d8:	2f02           	move.l d2,-(sp)
 5da:	42a7           	clr.l -(sp)
 5dc:	2f00           	move.l d0,-(sp)
 5de:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff0b37>
 5e2:	4878 0052      	pea 52 <main+0x4c>
 5e6:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf00a98>
	}
}
 5ec:	4fef 0018      	lea 24(sp),sp
 5f0:	241f           	move.l (sp)+,d2
 5f2:	588f           	addq.l #4,sp
 5f4:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 5f6:	4878 0001      	pea 1 <_start+0x1>
 5fa:	740b           	moveq #11,d2
 5fc:	d48f           	add.l sp,d2
 5fe:	2f02           	move.l d2,-(sp)
 600:	42a7           	clr.l -(sp)
 602:	4879 0000 0cba 	pea cba <incbin_colors_end+0x3e>
 608:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff0b37>
 60c:	4878 0052      	pea 52 <main+0x4c>
 610:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf00a98>
 616:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 61a:	203c 0000 0c7d 	move.l #3197,d0
 620:	4878 0001      	pea 1 <_start+0x1>
 624:	2f02           	move.l d2,-(sp)
 626:	42a7           	clr.l -(sp)
 628:	2f00           	move.l d0,-(sp)
 62a:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff0b37>
 62e:	4878 0052      	pea 52 <main+0x4c>
 632:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf00a98>
}
 638:	4fef 0018      	lea 24(sp),sp
 63c:	241f           	move.l (sp)+,d2
 63e:	588f           	addq.l #4,sp
 640:	4e75           	rts

00000642 <KPrintF>:
{
 642:	4fef ff80      	lea -128(sp),sp
 646:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
 64a:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xf00a98>
 650:	6734           	beq.s 686 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
 652:	2c79 0000 2e4a 	movea.l 2e4a <SysBase>,a6
 658:	206f 0090      	movea.l 144(sp),a0
 65c:	43ef 0094      	lea 148(sp),a1
 660:	45f9 0000 0bf8 	lea bf8 <PutChar>,a2
 666:	47ef 000c      	lea 12(sp),a3
 66a:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
 66e:	2f0b           	move.l a3,-(sp)
 670:	4878 0056      	pea 56 <main+0x50>
 674:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf00a98>
 67a:	508f           	addq.l #8,sp
}
 67c:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 680:	4fef 0080      	lea 128(sp),sp
 684:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
 686:	2c79 0000 2e4a 	movea.l 2e4a <SysBase>,a6
 68c:	206f 0090      	movea.l 144(sp),a0
 690:	43ef 0094      	lea 148(sp),a1
 694:	45f9 0000 0bea 	lea bea <KPutCharX>,a2
 69a:	97cb           	suba.l a3,a3
 69c:	4eae fdf6      	jsr -522(a6)
}
 6a0:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 6a4:	4fef 0080      	lea 128(sp),sp
 6a8:	4e75           	rts

000006aa <interruptHandler>:
static __attribute__((interrupt)) void interruptHandler() {
 6aa:	2f08           	move.l a0,-(sp)
 6ac:	2f00           	move.l d0,-(sp)
	hw->intreq=(1<<INTB_VERTB); hw->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
 6ae:	2079 0000 2e46 	movea.l 2e46 <hw>,a0
 6b4:	317c 0020 009c 	move.w #32,156(a0)
 6ba:	317c 0020 009c 	move.w #32,156(a0)
	frameCounter++;
 6c0:	2039 0000 2e08 	move.l 2e08 <frameCounter>,d0
 6c6:	5280           	addq.l #1,d0
 6c8:	23c0 0000 2e08 	move.l d0,2e08 <frameCounter>
}
 6ce:	201f           	move.l (sp)+,d0
 6d0:	205f           	movea.l (sp)+,a0
 6d2:	4e73           	rte

000006d4 <WaitVbl>:
void WaitVbl() {
 6d4:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 6d6:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdefb3c>,d0
 6dc:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
 6de:	2017           	move.l (sp),d0
 6e0:	0280 0001 ff00 	andi.l #130816,d0
 6e6:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
 6e8:	2017           	move.l (sp),d0
 6ea:	0c80 0001 3700 	cmpi.l #79616,d0
 6f0:	67e4           	beq.s 6d6 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 6f2:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdefb3c>,d0
 6f8:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
 6fc:	202f 0004      	move.l 4(sp),d0
 700:	0280 0001 ff00 	andi.l #130816,d0
 706:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
 70a:	202f 0004      	move.l 4(sp),d0
 70e:	0c80 0001 3700 	cmpi.l #79616,d0
 714:	66dc           	bne.s 6f2 <WaitVbl+0x1e>
}
 716:	508f           	addq.l #8,sp
 718:	4e75           	rts

0000071a <ClBuild>:
ULONG * ClBuild() {
 71a:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
 71e:	2c79 0000 2e4a 	movea.l 2e4a <SysBase>,a6
 724:	707b           	moveq #123,d0
 726:	4600           	not.b d0
 728:	7202           	moveq #2,d1
 72a:	4eae ff3a      	jsr -198(a6)
 72e:	2440           	movea.l d0,a2
  if( retval == 0) {
 730:	4a80           	tst.l d0
 732:	6700 010e      	beq.w 842 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
 736:	24b9 0000 2dbc 	move.l 2dbc <ClsSprites>,(a2)
 73c:	2579 0000 2dc0 	move.l 2dc0 <ClsSprites+0x4>,4(a2)
 742:	0004 
 744:	2579 0000 2dc4 	move.l 2dc4 <ClsSprites+0x8>,8(a2)
 74a:	0008 
 74c:	2579 0000 2dc8 	move.l 2dc8 <ClsSprites+0xc>,12(a2)
 752:	000c 
 754:	2579 0000 2dcc 	move.l 2dcc <ClsSprites+0x10>,16(a2)
 75a:	0010 
 75c:	2579 0000 2dd0 	move.l 2dd0 <ClsSprites+0x14>,20(a2)
 762:	0014 
 764:	2579 0000 2dd4 	move.l 2dd4 <ClsSprites+0x18>,24(a2)
 76a:	0018 
 76c:	2579 0000 2dd8 	move.l 2dd8 <ClsSprites+0x1c>,28(a2)
 772:	001c 
 774:	2579 0000 2ddc 	move.l 2ddc <ClsSprites+0x20>,32(a2)
 77a:	0020 
 77c:	2579 0000 2de0 	move.l 2de0 <ClsSprites+0x24>,36(a2)
 782:	0024 
 784:	2579 0000 2de4 	move.l 2de4 <ClsSprites+0x28>,40(a2)
 78a:	0028 
 78c:	2579 0000 2de8 	move.l 2de8 <ClsSprites+0x2c>,44(a2)
 792:	002c 
 794:	2579 0000 2dec 	move.l 2dec <ClsSprites+0x30>,48(a2)
 79a:	0030 
 79c:	2579 0000 2df0 	move.l 2df0 <ClsSprites+0x34>,52(a2)
 7a2:	0034 
 7a4:	2579 0000 2df4 	move.l 2df4 <ClsSprites+0x38>,56(a2)
 7aa:	0038 
 7ac:	2579 0000 2df8 	move.l 2df8 <ClsSprites+0x3c>,60(a2)
 7b2:	003c 
    *cl++ = *clpartinstruction++;
 7b4:	2579 0000 2d8c 	move.l 2d8c <ClScreen>,64(a2)
 7ba:	0040 
 7bc:	2579 0000 2d90 	move.l 2d90 <ClScreen+0x4>,68(a2)
 7c2:	0044 
 7c4:	2579 0000 2d94 	move.l 2d94 <ClScreen+0x8>,72(a2)
 7ca:	0048 
 7cc:	2579 0000 2d98 	move.l 2d98 <ClScreen+0xc>,76(a2)
 7d2:	004c 
 7d4:	2579 0000 2d9c 	move.l 2d9c <ClScreen+0x10>,80(a2)
 7da:	0050 
 7dc:	2579 0000 2da0 	move.l 2da0 <ClScreen+0x14>,84(a2)
 7e2:	0054 
 7e4:	2579 0000 2da4 	move.l 2da4 <ClScreen+0x18>,88(a2)
 7ea:	0058 
 7ec:	2579 0000 2da8 	move.l 2da8 <ClScreen+0x1c>,92(a2)
 7f2:	005c 
 7f4:	2579 0000 2dac 	move.l 2dac <ClScreen+0x20>,96(a2)
 7fa:	0060 
 7fc:	2579 0000 2db0 	move.l 2db0 <ClScreen+0x24>,100(a2)
 802:	0064 
 804:	2579 0000 2db4 	move.l 2db4 <ClScreen+0x28>,104(a2)
 80a:	0068 
 80c:	2579 0000 2db8 	move.l 2db8 <ClScreen+0x2c>,108(a2)
 812:	006c 
  *cl++ = 0x00e00000;
 814:	257c 00e0 0000 	move.l #14680064,112(a2)
 81a:	0070 
  *cl++ = 0x00e20000;
 81c:	257c 00e2 0000 	move.l #14811136,116(a2)
 822:	0074 
    *cl++ = *clpartinstruction++;
 824:	2579 0000 2d84 	move.l 2d84 <ClColor>,120(a2)
 82a:	0078 
 82c:	2579 0000 2d88 	move.l 2d88 <ClColor+0x4>,124(a2)
 832:	007c 
  *cl = 0xfffffffe;
 834:	70fe           	moveq #-2,d0
 836:	2540 0080      	move.l d0,128(a2)
}
 83a:	200a           	move.l a2,d0
 83c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
 840:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
 842:	2c79 0000 2e3e 	movea.l 2e3e <DOSBase>,a6
 848:	4eae ffc4      	jsr -60(a6)
 84c:	2c79 0000 2e3e 	movea.l 2e3e <DOSBase>,a6
 852:	2200           	move.l d0,d1
 854:	243c 0000 0cc5 	move.l #3269,d2
 85a:	7628           	moveq #40,d3
 85c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
 860:	2c79 0000 2e3e 	movea.l 2e3e <DOSBase>,a6
 866:	7201           	moveq #1,d1
 868:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
 86c:	24b9 0000 2dbc 	move.l 2dbc <ClsSprites>,(a2)
 872:	2579 0000 2dc0 	move.l 2dc0 <ClsSprites+0x4>,4(a2)
 878:	0004 
 87a:	2579 0000 2dc4 	move.l 2dc4 <ClsSprites+0x8>,8(a2)
 880:	0008 
 882:	2579 0000 2dc8 	move.l 2dc8 <ClsSprites+0xc>,12(a2)
 888:	000c 
 88a:	2579 0000 2dcc 	move.l 2dcc <ClsSprites+0x10>,16(a2)
 890:	0010 
 892:	2579 0000 2dd0 	move.l 2dd0 <ClsSprites+0x14>,20(a2)
 898:	0014 
 89a:	2579 0000 2dd4 	move.l 2dd4 <ClsSprites+0x18>,24(a2)
 8a0:	0018 
 8a2:	2579 0000 2dd8 	move.l 2dd8 <ClsSprites+0x1c>,28(a2)
 8a8:	001c 
 8aa:	2579 0000 2ddc 	move.l 2ddc <ClsSprites+0x20>,32(a2)
 8b0:	0020 
 8b2:	2579 0000 2de0 	move.l 2de0 <ClsSprites+0x24>,36(a2)
 8b8:	0024 
 8ba:	2579 0000 2de4 	move.l 2de4 <ClsSprites+0x28>,40(a2)
 8c0:	0028 
 8c2:	2579 0000 2de8 	move.l 2de8 <ClsSprites+0x2c>,44(a2)
 8c8:	002c 
 8ca:	2579 0000 2dec 	move.l 2dec <ClsSprites+0x30>,48(a2)
 8d0:	0030 
 8d2:	2579 0000 2df0 	move.l 2df0 <ClsSprites+0x34>,52(a2)
 8d8:	0034 
 8da:	2579 0000 2df4 	move.l 2df4 <ClsSprites+0x38>,56(a2)
 8e0:	0038 
 8e2:	2579 0000 2df8 	move.l 2df8 <ClsSprites+0x3c>,60(a2)
 8e8:	003c 
    *cl++ = *clpartinstruction++;
 8ea:	2579 0000 2d8c 	move.l 2d8c <ClScreen>,64(a2)
 8f0:	0040 
 8f2:	2579 0000 2d90 	move.l 2d90 <ClScreen+0x4>,68(a2)
 8f8:	0044 
 8fa:	2579 0000 2d94 	move.l 2d94 <ClScreen+0x8>,72(a2)
 900:	0048 
 902:	2579 0000 2d98 	move.l 2d98 <ClScreen+0xc>,76(a2)
 908:	004c 
 90a:	2579 0000 2d9c 	move.l 2d9c <ClScreen+0x10>,80(a2)
 910:	0050 
 912:	2579 0000 2da0 	move.l 2da0 <ClScreen+0x14>,84(a2)
 918:	0054 
 91a:	2579 0000 2da4 	move.l 2da4 <ClScreen+0x18>,88(a2)
 920:	0058 
 922:	2579 0000 2da8 	move.l 2da8 <ClScreen+0x1c>,92(a2)
 928:	005c 
 92a:	2579 0000 2dac 	move.l 2dac <ClScreen+0x20>,96(a2)
 930:	0060 
 932:	2579 0000 2db0 	move.l 2db0 <ClScreen+0x24>,100(a2)
 938:	0064 
 93a:	2579 0000 2db4 	move.l 2db4 <ClScreen+0x28>,104(a2)
 940:	0068 
 942:	2579 0000 2db8 	move.l 2db8 <ClScreen+0x2c>,108(a2)
 948:	006c 
  *cl++ = 0x00e00000;
 94a:	257c 00e0 0000 	move.l #14680064,112(a2)
 950:	0070 
  *cl++ = 0x00e20000;
 952:	257c 00e2 0000 	move.l #14811136,116(a2)
 958:	0074 
    *cl++ = *clpartinstruction++;
 95a:	2579 0000 2d84 	move.l 2d84 <ClColor>,120(a2)
 960:	0078 
 962:	2579 0000 2d88 	move.l 2d88 <ClColor+0x4>,124(a2)
 968:	007c 
  *cl = 0xfffffffe;
 96a:	70fe           	moveq #-2,d0
 96c:	2540 0080      	move.l d0,128(a2)
}
 970:	200a           	move.l a2,d0
 972:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
 976:	4e75           	rts

00000978 <memcpy>:
{
 978:	48e7 3820      	movem.l d2-d4/a2,-(sp)
 97c:	202f 0014      	move.l 20(sp),d0
 980:	226f 0018      	movea.l 24(sp),a1
 984:	222f 001c      	move.l 28(sp),d1
	while(len--)
 988:	2601           	move.l d1,d3
 98a:	5383           	subq.l #1,d3
 98c:	4a81           	tst.l d1
 98e:	6762           	beq.s 9f2 <memcpy+0x7a>
 990:	2040           	movea.l d0,a0
 992:	5888           	addq.l #4,a0
 994:	b1c9           	cmpa.l a1,a0
 996:	53c2           	sl.s d2
 998:	4402           	neg.b d2
 99a:	41e9 0004      	lea 4(a1),a0
 99e:	b1c0           	cmpa.l d0,a0
 9a0:	53c4           	sl.s d4
 9a2:	4404           	neg.b d4
 9a4:	8404           	or.b d4,d2
 9a6:	7808           	moveq #8,d4
 9a8:	b883           	cmp.l d3,d4
 9aa:	55c4           	sc.s d4
 9ac:	4404           	neg.b d4
 9ae:	c404           	and.b d4,d2
 9b0:	6746           	beq.s 9f8 <memcpy+0x80>
 9b2:	2409           	move.l a1,d2
 9b4:	8480           	or.l d0,d2
 9b6:	7803           	moveq #3,d4
 9b8:	c484           	and.l d4,d2
 9ba:	663c           	bne.s 9f8 <memcpy+0x80>
 9bc:	2049           	movea.l a1,a0
 9be:	2440           	movea.l d0,a2
 9c0:	74fc           	moveq #-4,d2
 9c2:	c481           	and.l d1,d2
 9c4:	d489           	add.l a1,d2
		*d++ = *s++;
 9c6:	24d8           	move.l (a0)+,(a2)+
 9c8:	b488           	cmp.l a0,d2
 9ca:	66fa           	bne.s 9c6 <memcpy+0x4e>
 9cc:	74fc           	moveq #-4,d2
 9ce:	c481           	and.l d1,d2
 9d0:	2040           	movea.l d0,a0
 9d2:	d1c2           	adda.l d2,a0
 9d4:	d3c2           	adda.l d2,a1
 9d6:	9682           	sub.l d2,d3
 9d8:	b481           	cmp.l d1,d2
 9da:	6716           	beq.s 9f2 <memcpy+0x7a>
 9dc:	1091           	move.b (a1),(a0)
	while(len--)
 9de:	4a83           	tst.l d3
 9e0:	6710           	beq.s 9f2 <memcpy+0x7a>
		*d++ = *s++;
 9e2:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
 9e8:	5383           	subq.l #1,d3
 9ea:	6706           	beq.s 9f2 <memcpy+0x7a>
		*d++ = *s++;
 9ec:	1169 0002 0002 	move.b 2(a1),2(a0)
}
 9f2:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
 9f6:	4e75           	rts
 9f8:	2040           	movea.l d0,a0
 9fa:	d289           	add.l a1,d1
		*d++ = *s++;
 9fc:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 9fe:	b289           	cmp.l a1,d1
 a00:	67f0           	beq.s 9f2 <memcpy+0x7a>
		*d++ = *s++;
 a02:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 a04:	b289           	cmp.l a1,d1
 a06:	66f4           	bne.s 9fc <memcpy+0x84>
 a08:	60e8           	bra.s 9f2 <memcpy+0x7a>

00000a0a <memset>:
{
 a0a:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
 a0e:	202f 0024      	move.l 36(sp),d0
 a12:	2a2f 0028      	move.l 40(sp),d5
 a16:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
 a1a:	2809           	move.l a1,d4
 a1c:	5384           	subq.l #1,d4
 a1e:	b2fc 0000      	cmpa.w #0,a1
 a22:	6f00 00b0      	ble.w ad4 <memset+0xca>
 a26:	1e05           	move.b d5,d7
 a28:	2200           	move.l d0,d1
 a2a:	4481           	neg.l d1
 a2c:	7403           	moveq #3,d2
 a2e:	c282           	and.l d2,d1
 a30:	7c05           	moveq #5,d6
		*ptr++ = val;
 a32:	2440           	movea.l d0,a2
 a34:	bc84           	cmp.l d4,d6
 a36:	646a           	bcc.s aa2 <memset+0x98>
 a38:	4a81           	tst.l d1
 a3a:	6724           	beq.s a60 <memset+0x56>
 a3c:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
 a3e:	5384           	subq.l #1,d4
 a40:	7401           	moveq #1,d2
 a42:	b481           	cmp.l d1,d2
 a44:	671a           	beq.s a60 <memset+0x56>
		*ptr++ = val;
 a46:	2440           	movea.l d0,a2
 a48:	548a           	addq.l #2,a2
 a4a:	2040           	movea.l d0,a0
 a4c:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
 a50:	5384           	subq.l #1,d4
 a52:	7403           	moveq #3,d2
 a54:	b481           	cmp.l d1,d2
 a56:	6608           	bne.s a60 <memset+0x56>
		*ptr++ = val;
 a58:	528a           	addq.l #1,a2
 a5a:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
 a5e:	5384           	subq.l #1,d4
 a60:	2609           	move.l a1,d3
 a62:	9681           	sub.l d1,d3
 a64:	7c00           	moveq #0,d6
 a66:	1c05           	move.b d5,d6
 a68:	2406           	move.l d6,d2
 a6a:	4842           	swap d2
 a6c:	4242           	clr.w d2
 a6e:	2042           	movea.l d2,a0
 a70:	2406           	move.l d6,d2
 a72:	e14a           	lsl.w #8,d2
 a74:	4842           	swap d2
 a76:	4242           	clr.w d2
 a78:	e18e           	lsl.l #8,d6
 a7a:	2646           	movea.l d6,a3
 a7c:	2c08           	move.l a0,d6
 a7e:	8486           	or.l d6,d2
 a80:	2c0b           	move.l a3,d6
 a82:	8486           	or.l d6,d2
 a84:	1407           	move.b d7,d2
 a86:	2040           	movea.l d0,a0
 a88:	d1c1           	adda.l d1,a0
 a8a:	72fc           	moveq #-4,d1
 a8c:	c283           	and.l d3,d1
 a8e:	d288           	add.l a0,d1
		*ptr++ = val;
 a90:	20c2           	move.l d2,(a0)+
 a92:	b1c1           	cmpa.l d1,a0
 a94:	66fa           	bne.s a90 <memset+0x86>
 a96:	72fc           	moveq #-4,d1
 a98:	c283           	and.l d3,d1
 a9a:	d5c1           	adda.l d1,a2
 a9c:	9881           	sub.l d1,d4
 a9e:	b283           	cmp.l d3,d1
 aa0:	6732           	beq.s ad4 <memset+0xca>
 aa2:	1485           	move.b d5,(a2)
	while(len-- > 0)
 aa4:	4a84           	tst.l d4
 aa6:	6f2c           	ble.s ad4 <memset+0xca>
		*ptr++ = val;
 aa8:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
 aac:	7201           	moveq #1,d1
 aae:	b284           	cmp.l d4,d1
 ab0:	6c22           	bge.s ad4 <memset+0xca>
		*ptr++ = val;
 ab2:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
 ab6:	7402           	moveq #2,d2
 ab8:	b484           	cmp.l d4,d2
 aba:	6c18           	bge.s ad4 <memset+0xca>
		*ptr++ = val;
 abc:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
 ac0:	7c03           	moveq #3,d6
 ac2:	bc84           	cmp.l d4,d6
 ac4:	6c0e           	bge.s ad4 <memset+0xca>
		*ptr++ = val;
 ac6:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
 aca:	7204           	moveq #4,d1
 acc:	b284           	cmp.l d4,d1
 ace:	6c04           	bge.s ad4 <memset+0xca>
		*ptr++ = val;
 ad0:	1545 0005      	move.b d5,5(a2)
}
 ad4:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
 ad8:	4e75           	rts

00000ada <strlen>:
{
 ada:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
 ade:	7000           	moveq #0,d0
	while(*s++)
 ae0:	4a10           	tst.b (a0)
 ae2:	6708           	beq.s aec <strlen+0x12>
		t++;
 ae4:	5280           	addq.l #1,d0
	while(*s++)
 ae6:	4a30 0800      	tst.b (0,a0,d0.l)
 aea:	66f8           	bne.s ae4 <strlen+0xa>
}
 aec:	4e75           	rts
 aee:	4e71           	nop

00000af0 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
 af0:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
 af4:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
 af8:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
 afc:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
 b00:	d041           	add.w d1,d0
	swap	d0
 b02:	4840           	swap d0
	clrw	d0
 b04:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
 b06:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
 b0a:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
 b0e:	d081           	add.l d1,d0

	rts
 b10:	4e75           	rts

00000b12 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
 b12:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
 b14:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
 b18:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
 b1c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
 b22:	6416           	bcc.s b3a <__udivsi3+0x28>
	movel	d0, d2
 b24:	2400           	move.l d0,d2
	clrw	d2
 b26:	4242           	clr.w d2
	swap	d2
 b28:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
 b2a:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
 b2c:	3002           	move.w d2,d0
	swap	d0
 b2e:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
 b30:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
 b34:	84c1           	divu.w d1,d2
	movew	d2, d0
 b36:	3002           	move.w d2,d0
	jra	6f
 b38:	6030           	bra.s b6a <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
 b3a:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
 b3c:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
 b3e:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
 b40:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
 b46:	64f4           	bcc.s b3c <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
 b48:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
 b4a:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
 b50:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
 b52:	c2c0           	mulu.w d0,d1
	swap	d2
 b54:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
 b56:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
 b58:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
 b5a:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
 b5c:	660a           	bne.s b68 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
 b5e:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
 b60:	6506           	bcs.s b68 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
 b62:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
 b66:	6302           	bls.s b6a <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
 b68:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
 b6a:	241f           	move.l (sp)+,d2
	rts
 b6c:	4e75           	rts

00000b6e <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
 b6e:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
 b70:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
 b72:	222f 000c      	move.l 12(sp),d1
	jpl	1f
 b76:	6a04           	bpl.s b7c <__divsi3+0xe>
	negl	d1
 b78:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
 b7a:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
 b7c:	202f 0008      	move.l 8(sp),d0
	jpl	2f
 b80:	6a04           	bpl.s b86 <__divsi3+0x18>
	negl	d0
 b82:	4480           	neg.l d0
	negb	d2
 b84:	4402           	neg.b d2

2:	movel	d1, sp@-
 b86:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 b88:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
 b8a:	6186           	bsr.s b12 <__udivsi3>
	addql	IMM (8), sp
 b8c:	508f           	addq.l #8,sp

	tstb	d2
 b8e:	4a02           	tst.b d2
	jpl	3f
 b90:	6a02           	bpl.s b94 <__divsi3+0x26>
	negl	d0
 b92:	4480           	neg.l d0

3:	movel	sp@+, d2
 b94:	241f           	move.l (sp)+,d2
	rts
 b96:	4e75           	rts

00000b98 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 b98:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 b9c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 ba0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 ba2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
 ba4:	61c8           	bsr.s b6e <__divsi3>
	addql	IMM (8), sp
 ba6:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 ba8:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 bac:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 bae:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 bb0:	6100 ff3e      	bsr.w af0 <__mulsi3>
	addql	IMM (8), sp
 bb4:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 bb6:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 bba:	9280           	sub.l d0,d1
	movel	d1, d0
 bbc:	2001           	move.l d1,d0
	rts
 bbe:	4e75           	rts

00000bc0 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 bc0:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 bc4:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 bc8:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 bca:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
 bcc:	6100 ff44      	bsr.w b12 <__udivsi3>
	addql	IMM (8), sp
 bd0:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 bd2:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 bd6:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 bd8:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 bda:	6100 ff14      	bsr.w af0 <__mulsi3>
	addql	IMM (8), sp
 bde:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 be0:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 be4:	9280           	sub.l d0,d1
	movel	d1, d0
 be6:	2001           	move.l d1,d0
	rts
 be8:	4e75           	rts

00000bea <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
 bea:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
 bec:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
 bf0:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
 bf4:	2c5f           	movea.l (sp)+,a6
    rts
 bf6:	4e75           	rts

00000bf8 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
 bf8:	16c0           	move.b d0,(a3)+
	rts
 bfa:	4e75           	rts
