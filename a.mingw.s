
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
   a:	48e7 313a      	movem.l d2-d3/d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
   e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
  12:	23ce 0001 bcaa 	move.l a6,1bcaa <SysBase>
	hw = (struct Custom*)0xdff000;
  18:	23fc 00df f000 	move.l #14675968,1bca6 <hw>
  1e:	0001 bca6 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
  22:	43f9 0000 0aa1 	lea aa1 <incbin_colors_end+0x49>,a1
  28:	7000           	moveq #0,d0
  2a:	4eae fdd8      	jsr -552(a6)
  2e:	23c0 0001 bca2 	move.l d0,1bca2 <GfxBase>
	if (!GfxBase)
  34:	6700 03a2      	beq.w 3d8 <main+0x3d2>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
  38:	2c79 0001 bcaa 	movea.l 1bcaa <SysBase>,a6
  3e:	43f9 0000 0ab2 	lea ab2 <incbin_colors_end+0x5a>,a1
  44:	7000           	moveq #0,d0
  46:	4eae fdd8      	jsr -552(a6)
  4a:	23c0 0001 bc9e 	move.l d0,1bc9e <DOSBase>
	if (!DOSBase)
  50:	6700 037a      	beq.w 3cc <main+0x3c6>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
  54:	4879 0000 0abe 	pea abe <incbin_colors_end+0x66>
  5a:	4eb9 0000 0572 	jsr 572 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
  60:	2c79 0001 bc9e 	movea.l 1bc9e <DOSBase>,a6
  66:	4eae ffc4      	jsr -60(a6)
  6a:	2c79 0001 bc9e 	movea.l 1bc9e <DOSBase>,a6
  70:	2200           	move.l d0,d1
  72:	243c 0000 0ada 	move.l #2778,d2
  78:	760f           	moveq #15,d3
  7a:	4eae ffd0      	jsr -48(a6)
  //RunTests();
	Delay(50);
  7e:	2c79 0001 bc9e 	movea.l 1bc9e <DOSBase>,a6
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
  9a:	47f9 0000 04d0 	lea 4d0 <warpmode.part.0>,a3
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
  ae:	2c79 0001 bca2 	movea.l 1bca2 <GfxBase>,a6
  b4:	23ee 0022 0001 	move.l 34(a6),1bc8c <ActiView>
  ba:	bc8c 
	OwnBlitter();
  bc:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
  c0:	2c79 0001 bca2 	movea.l 1bca2 <GfxBase>,a6
  c6:	4eae ff1c      	jsr -228(a6)
	Disable();
  ca:	2c79 0001 bcaa 	movea.l 1bcaa <SysBase>,a6
  d0:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
  d4:	2479 0001 bca6 	movea.l 1bca6 <hw>,a2
  da:	302a 0010      	move.w 16(a2),d0
  de:	33c0 0001 bc90 	move.w d0,1bc90 <SystemADKCON>
	SystemInts=hw->intenar;
  e4:	302a 001c      	move.w 28(a2),d0
  e8:	33c0 0001 bc94 	move.w d0,1bc94 <SystemInts>
	SystemDMA=hw->dmaconr;
  ee:	302a 0002      	move.w 2(a2),d0
  f2:	33c0 0001 bc92 	move.w d0,1bc92 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
  f8:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
  fe:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
 104:	47f9 0000 0604 	lea 604 <WaitVbl>,a3
 10a:	4e93           	jsr (a3)
	WaitVbl();
 10c:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
 10e:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
 114:	2c79 0001 bca2 	movea.l 1bca2 <GfxBase>,a6
 11a:	93c9           	suba.l a1,a1
 11c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 120:	2c79 0001 bca2 	movea.l 1bca2 <GfxBase>,a6
 126:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 12a:	2c79 0001 bca2 	movea.l 1bca2 <GfxBase>,a6
 130:	4eae fef2      	jsr -270(a6)

	WaitVbl();
 134:	4e93           	jsr (a3)
	WaitVbl();
 136:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
 138:	3f7c 4e7a 0022 	move.w #20090,34(sp)
 13e:	3f7c 0801 0024 	move.w #2049,36(sp)
 144:	3f7c 4e73 0026 	move.w #20083,38(sp)
	if (SysBase->AttnFlags & AFF_68010) 
 14a:	2c79 0001 bcaa 	movea.l 1bcaa <SysBase>,a6
 150:	082e 0000 0129 	btst #0,297(a6)
 156:	6700 02aa      	beq.w 402 <main+0x3fc>
		vbr = (APTR)Supervisor((void*)getvbr);
 15a:	7e22           	moveq #34,d7
 15c:	de8f           	add.l sp,d7
 15e:	cf8d           	exg d7,a5
 160:	4eae ffe2      	jsr -30(a6)
 164:	cf8d           	exg d7,a5

	VBR=GetVBR();
 166:	23c0 0001 bc96 	move.l d0,1bc96 <VBR.lto_priv.1>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 16c:	2079 0001 bc96 	movea.l 1bc96 <VBR.lto_priv.1>,a0
 172:	2c68 006c      	movea.l 108(a0),a6
	SystemIrq=GetInterruptHandler(); //store interrupt register
 176:	23ce 0001 bc9a 	move.l a6,1bc9a <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
 17c:	4e93           	jsr (a3)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 17e:	2079 0001 bc96 	movea.l 1bc96 <VBR.lto_priv.1>,a0
 184:	217c 0000 05da 	move.l #1498,108(a0)
 18a:	006c 
	frameCounter++;
}

void RunDemo() {
	SetInterruptHandler((APTR)interruptHandler);
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
 18c:	2479 0001 bca6 	movea.l 1bca6 <hw>,a2
 192:	357c c020 009a 	move.w #-16352,154(a2)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
 198:	357c 0020 009c 	move.w #32,156(a2)
  ClBuild( Copperlist1);
 19e:	4879 0001 bbf8 	pea 1bbf8 <Copperlist1>
 1a4:	49f9 0000 064a 	lea 64a <ClBuild>,a4
 1aa:	4e94           	jsr (a4)
  ClBuild( Copperlist2);
 1ac:	4879 0001 bb74 	pea 1bb74 <Copperlist2>
 1b2:	4e94           	jsr (a4)
  ULONG tmp = DrawCopper;
 1b4:	203c 0001 bbf8 	move.l #113656,d0
  hw->cop1lc = ViewCopper;
 1ba:	2540 0080      	move.l d0,128(a2)
  hw->copjmp1 = tmp;
 1be:	3540 0088      	move.w d0,136(a2)
  copword[CopBpl1Low] = lowword;
 1c2:	41f9 0001 bb74 	lea 1bb74 <Copperlist2>,a0
 1c8:	223c 0000 f374 	move.l #62324,d1
 1ce:	33c1 0001 bbea 	move.w d1,1bbea <Copperlist2+0x76>
  UWORD highword = (ULONG)DrawBuffer >> 16;
 1d4:	2401           	move.l d1,d2
 1d6:	4242           	clr.w d2
 1d8:	4842           	swap d2
 1da:	33c2 0001 bbe6 	move.w d2,1bbe6 <Copperlist2+0x72>
  *bp = 0;
 1e0:	4278 0200      	clr.w 200 <main+0x1fa>
  DrawCopper = ViewCopper;
 1e4:	23c0 0001 bc84 	move.l d0,1bc84 <DrawCopper>
  ViewCopper = tmp;
 1ea:	23c8 0001 bc7c 	move.l a0,1bc7c <ViewCopper>
  hw->cop1lc = ViewCopper;
 1f0:	2548 0080      	move.l a0,128(a2)
  hw->copjmp1 = tmp;
 1f4:	3548 0088      	move.w a0,136(a2)
  copword[CopBpl1Low] = lowword;
 1f8:	43f9 0000 2b74 	lea 2b74 <Bitplane2>,a1
 1fe:	33c9 0001 bc6e 	move.w a1,1bc6e <Copperlist1+0x76>
  UWORD highword = (ULONG)DrawBuffer >> 16;
 204:	2609           	move.l a1,d3
 206:	4243           	clr.w d3
 208:	4843           	swap d3
 20a:	33c3 0001 bc6a 	move.w d3,1bc6a <Copperlist1+0x72>
  DrawBuffer = ViewBuffer;
 210:	23c1 0001 bc88 	move.l d1,1bc88 <DrawBuffer>
  ViewBuffer = tmp;
 216:	23c9 0001 bc80 	move.l a1,1bc80 <ViewBuffer>
	WaitBlit();	
	DisownBlitter();
	Enable();
}

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
 21c:	1639 00bf e001 	move.b bfe001 <_end+0xbe2351>,d3
  PrepareDisplay();

	while(!MouseLeft()) {
 222:	508f           	addq.l #8,sp
 224:	0803 0006      	btst #6,d3
 228:	6700 00be      	beq.w 2e8 <main+0x2e2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 22c:	2439 00df f004 	move.l dff004 <_end+0xde3354>,d2
 232:	2f42 0022      	move.l d2,34(sp)
		vpos&=0x1ff00;
 236:	242f 0022      	move.l 34(sp),d2
 23a:	0282 0001 ff00 	andi.l #130816,d2
 240:	2f42 0022      	move.l d2,34(sp)
		if (vpos!=(311<<8))
 244:	242f 0022      	move.l 34(sp),d2
 248:	0c82 0001 3700 	cmpi.l #79616,d2
 24e:	67dc           	beq.s 22c <main+0x226>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 250:	2439 00df f004 	move.l dff004 <_end+0xde3354>,d2
 256:	2f42 001e      	move.l d2,30(sp)
		vpos&=0x1ff00;
 25a:	242f 001e      	move.l 30(sp),d2
 25e:	0282 0001 ff00 	andi.l #130816,d2
 264:	2f42 001e      	move.l d2,30(sp)
		if (vpos==(311<<8))
 268:	242f 001e      	move.l 30(sp),d2
 26c:	0c82 0001 3700 	cmpi.l #79616,d2
 272:	66dc           	bne.s 250 <main+0x24a>
	SetInterruptHandler((APTR)interruptHandler);
}

void RunFrame() {
  UWORD *bp = 0x200;
  *bp = 0;
 274:	4278 0200      	clr.w 200 <main+0x1fa>
  DrawCopper = ViewCopper;
 278:	23c8 0001 bc84 	move.l a0,1bc84 <DrawCopper>
  ViewCopper = tmp;
 27e:	23c0 0001 bc7c 	move.l d0,1bc7c <ViewCopper>
  hw->cop1lc = ViewCopper;
 284:	2540 0080      	move.l d0,128(a2)
  hw->copjmp1 = tmp;
 288:	3540 0088      	move.w d0,136(a2)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
 28c:	3141 0076      	move.w d1,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
 290:	2401           	move.l d1,d2
 292:	4242           	clr.w d2
 294:	4842           	swap d2
 296:	3142 0072      	move.w d2,114(a0)
  DrawBuffer = ViewBuffer;
 29a:	23c9 0001 bc88 	move.l a1,1bc88 <DrawBuffer>
  ViewBuffer = tmp;
 2a0:	23c1 0001 bc80 	move.l d1,1bc80 <ViewBuffer>
short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
 2a6:	1439 00bf e001 	move.b bfe001 <_end+0xbe2351>,d2
 2ac:	2609           	move.l a1,d3
 2ae:	2241           	movea.l d1,a1
 2b0:	2208           	move.l a0,d1
 2b2:	2040           	movea.l d0,a0
	while(!MouseLeft()) {
 2b4:	0802 0006      	btst #6,d2
 2b8:	672e           	beq.s 2e8 <main+0x2e2>
 2ba:	2001           	move.l d1,d0
 2bc:	2203           	move.l d3,d1
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 2be:	2439 00df f004 	move.l dff004 <_end+0xde3354>,d2
 2c4:	2f42 0022      	move.l d2,34(sp)
		vpos&=0x1ff00;
 2c8:	242f 0022      	move.l 34(sp),d2
 2cc:	0282 0001 ff00 	andi.l #130816,d2
 2d2:	2f42 0022      	move.l d2,34(sp)
		if (vpos!=(311<<8))
 2d6:	242f 0022      	move.l 34(sp),d2
 2da:	0c82 0001 3700 	cmpi.l #79616,d2
 2e0:	6700 ff4a      	beq.w 22c <main+0x226>
 2e4:	6000 ff6a      	bra.w 250 <main+0x24a>
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 2e8:	2079 0001 bc96 	movea.l 1bc96 <VBR.lto_priv.1>,a0
 2ee:	217c 0000 05da 	move.l #1498,108(a0)
 2f4:	006c 
	WaitVbl();
 2f6:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 2f8:	302a 0002      	move.w 2(a2),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 2fc:	302a 0002      	move.w 2(a2),d0
 300:	0800 000e      	btst #14,d0
 304:	66f6           	bne.s 2fc <main+0x2f6>
	hw->intena=0x7fff;//disable all interrupts
 306:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 30c:	357c 7fff 009c 	move.w #32767,156(a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
 312:	357c 7fff 0096 	move.w #32767,150(a2)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 318:	2079 0001 bc96 	movea.l 1bc96 <VBR.lto_priv.1>,a0
 31e:	214e 006c      	move.l a6,108(a0)
	hw->cop1lc=(ULONG)GfxBase->copinit;
 322:	2c79 0001 bca2 	movea.l 1bca2 <GfxBase>,a6
 328:	256e 0026 0080 	move.l 38(a6),128(a2)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
 32e:	256e 0032 0084 	move.l 50(a6),132(a2)
	hw->copjmp1=0x7fff; //start coppper
 334:	357c 7fff 0088 	move.w #32767,136(a2)
	hw->intena=SystemInts|0x8000;
 33a:	3039 0001 bc94 	move.w 1bc94 <SystemInts>,d0
 340:	0040 8000      	ori.w #-32768,d0
 344:	3540 009a      	move.w d0,154(a2)
	hw->dmacon=SystemDMA|0x8000;
 348:	3039 0001 bc92 	move.w 1bc92 <SystemDMA>,d0
 34e:	0040 8000      	ori.w #-32768,d0
 352:	3540 0096      	move.w d0,150(a2)
	hw->adkcon=SystemADKCON|0x8000;
 356:	3039 0001 bc90 	move.w 1bc90 <SystemADKCON>,d0
 35c:	0040 8000      	ori.w #-32768,d0
 360:	3540 009e      	move.w d0,158(a2)
	LoadView(ActiView);
 364:	2279 0001 bc8c 	movea.l 1bc8c <ActiView>,a1
 36a:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 36e:	2c79 0001 bca2 	movea.l 1bca2 <GfxBase>,a6
 374:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 378:	2c79 0001 bca2 	movea.l 1bca2 <GfxBase>,a6
 37e:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
 382:	2c79 0001 bca2 	movea.l 1bca2 <GfxBase>,a6
 388:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
 38c:	2c79 0001 bca2 	movea.l 1bca2 <GfxBase>,a6
 392:	4eae fe32      	jsr -462(a6)
	Enable();
 396:	2c79 0001 bcaa 	movea.l 1bcaa <SysBase>,a6
 39c:	4eae ff82      	jsr -126(a6)
	RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
 3a0:	2c79 0001 bcaa 	movea.l 1bcaa <SysBase>,a6
 3a6:	2279 0001 bc9e 	movea.l 1bc9e <DOSBase>,a1
 3ac:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
 3b0:	2c79 0001 bcaa 	movea.l 1bcaa <SysBase>,a6
 3b6:	2279 0001 bca2 	movea.l 1bca2 <GfxBase>,a1
 3bc:	4eae fe62      	jsr -414(a6)
}
 3c0:	7000           	moveq #0,d0
 3c2:	4cdf 5c8c      	movem.l (sp)+,d2-d3/d7/a2-a4/a6
 3c6:	4fef 000c      	lea 12(sp),sp
 3ca:	4e75           	rts
		Exit(0);
 3cc:	9dce           	suba.l a6,a6
 3ce:	7200           	moveq #0,d1
 3d0:	4eae ff70      	jsr -144(a6)
 3d4:	6000 fc7e      	bra.w 54 <main+0x4e>
		Exit(0);
 3d8:	2c79 0001 bc9e 	movea.l 1bc9e <DOSBase>,a6
 3de:	7200           	moveq #0,d1
 3e0:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
 3e4:	2c79 0001 bcaa 	movea.l 1bcaa <SysBase>,a6
 3ea:	43f9 0000 0ab2 	lea ab2 <incbin_colors_end+0x5a>,a1
 3f0:	7000           	moveq #0,d0
 3f2:	4eae fdd8      	jsr -552(a6)
 3f6:	23c0 0001 bc9e 	move.l d0,1bc9e <DOSBase>
	if (!DOSBase)
 3fc:	6600 fc56      	bne.w 54 <main+0x4e>
 400:	60ca           	bra.s 3cc <main+0x3c6>
	APTR vbr = 0;
 402:	7000           	moveq #0,d0
	VBR=GetVBR();
 404:	23c0 0001 bc96 	move.l d0,1bc96 <VBR.lto_priv.1>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 40a:	2079 0001 bc96 	movea.l 1bc96 <VBR.lto_priv.1>,a0
 410:	2c68 006c      	movea.l 108(a0),a6
	SystemIrq=GetInterruptHandler(); //store interrupt register
 414:	23ce 0001 bc9a 	move.l a6,1bc9a <SystemIrq>
	WaitVbl();
 41a:	4e93           	jsr (a3)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 41c:	2079 0001 bc96 	movea.l 1bc96 <VBR.lto_priv.1>,a0
 422:	217c 0000 05da 	move.l #1498,108(a0)
 428:	006c 
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
 42a:	2479 0001 bca6 	movea.l 1bca6 <hw>,a2
 430:	357c c020 009a 	move.w #-16352,154(a2)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
 436:	357c 0020 009c 	move.w #32,156(a2)
  ClBuild( Copperlist1);
 43c:	4879 0001 bbf8 	pea 1bbf8 <Copperlist1>
 442:	49f9 0000 064a 	lea 64a <ClBuild>,a4
 448:	4e94           	jsr (a4)
  ClBuild( Copperlist2);
 44a:	4879 0001 bb74 	pea 1bb74 <Copperlist2>
 450:	4e94           	jsr (a4)
  ULONG tmp = DrawCopper;
 452:	203c 0001 bbf8 	move.l #113656,d0
  hw->cop1lc = ViewCopper;
 458:	2540 0080      	move.l d0,128(a2)
  hw->copjmp1 = tmp;
 45c:	3540 0088      	move.w d0,136(a2)
  copword[CopBpl1Low] = lowword;
 460:	41f9 0001 bb74 	lea 1bb74 <Copperlist2>,a0
 466:	223c 0000 f374 	move.l #62324,d1
 46c:	33c1 0001 bbea 	move.w d1,1bbea <Copperlist2+0x76>
  UWORD highword = (ULONG)DrawBuffer >> 16;
 472:	2401           	move.l d1,d2
 474:	4242           	clr.w d2
 476:	4842           	swap d2
 478:	33c2 0001 bbe6 	move.w d2,1bbe6 <Copperlist2+0x72>
  *bp = 0;
 47e:	4278 0200      	clr.w 200 <main+0x1fa>
  DrawCopper = ViewCopper;
 482:	23c0 0001 bc84 	move.l d0,1bc84 <DrawCopper>
  ViewCopper = tmp;
 488:	23c8 0001 bc7c 	move.l a0,1bc7c <ViewCopper>
  hw->cop1lc = ViewCopper;
 48e:	2548 0080      	move.l a0,128(a2)
  hw->copjmp1 = tmp;
 492:	3548 0088      	move.w a0,136(a2)
  copword[CopBpl1Low] = lowword;
 496:	43f9 0000 2b74 	lea 2b74 <Bitplane2>,a1
 49c:	33c9 0001 bc6e 	move.w a1,1bc6e <Copperlist1+0x76>
  UWORD highword = (ULONG)DrawBuffer >> 16;
 4a2:	2609           	move.l a1,d3
 4a4:	4243           	clr.w d3
 4a6:	4843           	swap d3
 4a8:	33c3 0001 bc6a 	move.w d3,1bc6a <Copperlist1+0x72>
  DrawBuffer = ViewBuffer;
 4ae:	23c1 0001 bc88 	move.l d1,1bc88 <DrawBuffer>
  ViewBuffer = tmp;
 4b4:	23c9 0001 bc80 	move.l a1,1bc80 <ViewBuffer>
short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
 4ba:	1639 00bf e001 	move.b bfe001 <_end+0xbe2351>,d3
	while(!MouseLeft()) {
 4c0:	508f           	addq.l #8,sp
 4c2:	0803 0006      	btst #6,d3
 4c6:	6600 fd64      	bne.w 22c <main+0x226>
 4ca:	6000 fe1c      	bra.w 2e8 <main+0x2e2>
 4ce:	4e71           	nop

000004d0 <warpmode.part.0>:
void warpmode(int on) 
 4d0:	598f           	subq.l #4,sp
 4d2:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 4d4:	4aaf 000c      	tst.l 12(sp)
 4d8:	674c           	beq.s 526 <warpmode.part.0+0x56>
 4da:	4878 0001      	pea 1 <_start+0x1>
 4de:	740b           	moveq #11,d2
 4e0:	d48f           	add.l sp,d2
 4e2:	2f02           	move.l d2,-(sp)
 4e4:	42a7           	clr.l -(sp)
 4e6:	4879 0000 0a8c 	pea a8c <incbin_colors_end+0x34>
 4ec:	4878 ffff      	pea ffffffff <_end+0xfffe434f>
 4f0:	4878 0052      	pea 52 <main+0x4c>
 4f4:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef42b0>
 4fa:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 4fe:	203c 0000 0a72 	move.l #2674,d0
 504:	4878 0001      	pea 1 <_start+0x1>
 508:	2f02           	move.l d2,-(sp)
 50a:	42a7           	clr.l -(sp)
 50c:	2f00           	move.l d0,-(sp)
 50e:	4878 ffff      	pea ffffffff <_end+0xfffe434f>
 512:	4878 0052      	pea 52 <main+0x4c>
 516:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef42b0>
	}
}
 51c:	4fef 0018      	lea 24(sp),sp
 520:	241f           	move.l (sp)+,d2
 522:	588f           	addq.l #4,sp
 524:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 526:	4878 0001      	pea 1 <_start+0x1>
 52a:	740b           	moveq #11,d2
 52c:	d48f           	add.l sp,d2
 52e:	2f02           	move.l d2,-(sp)
 530:	42a7           	clr.l -(sp)
 532:	4879 0000 0a96 	pea a96 <incbin_colors_end+0x3e>
 538:	4878 ffff      	pea ffffffff <_end+0xfffe434f>
 53c:	4878 0052      	pea 52 <main+0x4c>
 540:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef42b0>
 546:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 54a:	203c 0000 0a59 	move.l #2649,d0
 550:	4878 0001      	pea 1 <_start+0x1>
 554:	2f02           	move.l d2,-(sp)
 556:	42a7           	clr.l -(sp)
 558:	2f00           	move.l d0,-(sp)
 55a:	4878 ffff      	pea ffffffff <_end+0xfffe434f>
 55e:	4878 0052      	pea 52 <main+0x4c>
 562:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef42b0>
}
 568:	4fef 0018      	lea 24(sp),sp
 56c:	241f           	move.l (sp)+,d2
 56e:	588f           	addq.l #4,sp
 570:	4e75           	rts

00000572 <KPrintF>:
{
 572:	4fef ff80      	lea -128(sp),sp
 576:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
 57a:	4ab9 00f0 ff60 	tst.l f0ff60 <_end+0xef42b0>
 580:	6734           	beq.s 5b6 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
 582:	2c79 0001 bcaa 	movea.l 1bcaa <SysBase>,a6
 588:	206f 0090      	movea.l 144(sp),a0
 58c:	43ef 0094      	lea 148(sp),a1
 590:	45f9 0000 09d4 	lea 9d4 <PutChar>,a2
 596:	47ef 000c      	lea 12(sp),a3
 59a:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
 59e:	2f0b           	move.l a3,-(sp)
 5a0:	4878 0056      	pea 56 <main+0x50>
 5a4:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef42b0>
 5aa:	508f           	addq.l #8,sp
}
 5ac:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 5b0:	4fef 0080      	lea 128(sp),sp
 5b4:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
 5b6:	2c79 0001 bcaa 	movea.l 1bcaa <SysBase>,a6
 5bc:	206f 0090      	movea.l 144(sp),a0
 5c0:	43ef 0094      	lea 148(sp),a1
 5c4:	45f9 0000 09c6 	lea 9c6 <KPutCharX>,a2
 5ca:	97cb           	suba.l a3,a3
 5cc:	4eae fdf6      	jsr -522(a6)
}
 5d0:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 5d4:	4fef 0080      	lea 128(sp),sp
 5d8:	4e75           	rts

000005da <interruptHandler>:
static __attribute__((interrupt)) void interruptHandler() {
 5da:	2f08           	move.l a0,-(sp)
 5dc:	2f00           	move.l d0,-(sp)
	hw->intreq=(1<<INTB_VERTB); hw->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
 5de:	2079 0001 bca6 	movea.l 1bca6 <hw>,a0
 5e4:	317c 0020 009c 	move.w #32,156(a0)
 5ea:	317c 0020 009c 	move.w #32,156(a0)
	frameCounter++;
 5f0:	2039 0000 2b70 	move.l 2b70 <frameCounter>,d0
 5f6:	5280           	addq.l #1,d0
 5f8:	23c0 0000 2b70 	move.l d0,2b70 <frameCounter>
}
 5fe:	201f           	move.l (sp)+,d0
 600:	205f           	movea.l (sp)+,a0
 602:	4e73           	rte

00000604 <WaitVbl>:
void WaitVbl() {
 604:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 606:	2039 00df f004 	move.l dff004 <_end+0xde3354>,d0
 60c:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
 60e:	2017           	move.l (sp),d0
 610:	0280 0001 ff00 	andi.l #130816,d0
 616:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
 618:	2017           	move.l (sp),d0
 61a:	0c80 0001 3700 	cmpi.l #79616,d0
 620:	67e4           	beq.s 606 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 622:	2039 00df f004 	move.l dff004 <_end+0xde3354>,d0
 628:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
 62c:	202f 0004      	move.l 4(sp),d0
 630:	0280 0001 ff00 	andi.l #130816,d0
 636:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
 63a:	202f 0004      	move.l 4(sp),d0
 63e:	0c80 0001 3700 	cmpi.l #79616,d0
 644:	66dc           	bne.s 622 <WaitVbl+0x1e>
}
 646:	508f           	addq.l #8,sp
 648:	4e75           	rts

0000064a <ClBuild>:
void ClBuild(  ULONG *cl) {
 64a:	206f 0004      	movea.l 4(sp),a0
    *cl++ = *clpartinstruction++;
 64e:	20b9 0000 2b24 	move.l 2b24 <ClsSprites>,(a0)
 654:	2179 0000 2b28 	move.l 2b28 <ClsSprites+0x4>,4(a0)
 65a:	0004 
 65c:	2179 0000 2b2c 	move.l 2b2c <ClsSprites+0x8>,8(a0)
 662:	0008 
 664:	2179 0000 2b30 	move.l 2b30 <ClsSprites+0xc>,12(a0)
 66a:	000c 
 66c:	2179 0000 2b34 	move.l 2b34 <ClsSprites+0x10>,16(a0)
 672:	0010 
 674:	2179 0000 2b38 	move.l 2b38 <ClsSprites+0x14>,20(a0)
 67a:	0014 
 67c:	2179 0000 2b3c 	move.l 2b3c <ClsSprites+0x18>,24(a0)
 682:	0018 
 684:	2179 0000 2b40 	move.l 2b40 <ClsSprites+0x1c>,28(a0)
 68a:	001c 
 68c:	2179 0000 2b44 	move.l 2b44 <ClsSprites+0x20>,32(a0)
 692:	0020 
 694:	2179 0000 2b48 	move.l 2b48 <ClsSprites+0x24>,36(a0)
 69a:	0024 
 69c:	2179 0000 2b4c 	move.l 2b4c <ClsSprites+0x28>,40(a0)
 6a2:	0028 
 6a4:	2179 0000 2b50 	move.l 2b50 <ClsSprites+0x2c>,44(a0)
 6aa:	002c 
 6ac:	2179 0000 2b54 	move.l 2b54 <ClsSprites+0x30>,48(a0)
 6b2:	0030 
 6b4:	2179 0000 2b58 	move.l 2b58 <ClsSprites+0x34>,52(a0)
 6ba:	0034 
 6bc:	2179 0000 2b5c 	move.l 2b5c <ClsSprites+0x38>,56(a0)
 6c2:	0038 
 6c4:	2179 0000 2b60 	move.l 2b60 <ClsSprites+0x3c>,60(a0)
 6ca:	003c 
    *cl++ = *clpartinstruction++;
 6cc:	2179 0000 2af4 	move.l 2af4 <ClScreen>,64(a0)
 6d2:	0040 
 6d4:	2179 0000 2af8 	move.l 2af8 <ClScreen+0x4>,68(a0)
 6da:	0044 
 6dc:	2179 0000 2afc 	move.l 2afc <ClScreen+0x8>,72(a0)
 6e2:	0048 
 6e4:	2179 0000 2b00 	move.l 2b00 <ClScreen+0xc>,76(a0)
 6ea:	004c 
 6ec:	2179 0000 2b04 	move.l 2b04 <ClScreen+0x10>,80(a0)
 6f2:	0050 
 6f4:	2179 0000 2b08 	move.l 2b08 <ClScreen+0x14>,84(a0)
 6fa:	0054 
 6fc:	2179 0000 2b0c 	move.l 2b0c <ClScreen+0x18>,88(a0)
 702:	0058 
 704:	2179 0000 2b10 	move.l 2b10 <ClScreen+0x1c>,92(a0)
 70a:	005c 
 70c:	2179 0000 2b14 	move.l 2b14 <ClScreen+0x20>,96(a0)
 712:	0060 
 714:	2179 0000 2b18 	move.l 2b18 <ClScreen+0x24>,100(a0)
 71a:	0064 
 71c:	2179 0000 2b1c 	move.l 2b1c <ClScreen+0x28>,104(a0)
 722:	0068 
 724:	2179 0000 2b20 	move.l 2b20 <ClScreen+0x2c>,108(a0)
 72a:	006c 
  *cl++ = 0x00e00000;
 72c:	217c 00e0 0000 	move.l #14680064,112(a0)
 732:	0070 
  *cl++ = 0x00e20000;
 734:	217c 00e2 0000 	move.l #14811136,116(a0)
 73a:	0074 
    *cl++ = *clpartinstruction++;
 73c:	2179 0000 2aec 	move.l 2aec <ClColor>,120(a0)
 742:	0078 
 744:	2179 0000 2af0 	move.l 2af0 <ClColor+0x4>,124(a0)
 74a:	007c 
  *cl = 0xfffffffe;
 74c:	70fe           	moveq #-2,d0
 74e:	2140 0080      	move.l d0,128(a0)
}
 752:	4e75           	rts

00000754 <memcpy>:
{
 754:	48e7 3820      	movem.l d2-d4/a2,-(sp)
 758:	202f 0014      	move.l 20(sp),d0
 75c:	226f 0018      	movea.l 24(sp),a1
 760:	222f 001c      	move.l 28(sp),d1
	while(len--)
 764:	2601           	move.l d1,d3
 766:	5383           	subq.l #1,d3
 768:	4a81           	tst.l d1
 76a:	6762           	beq.s 7ce <memcpy+0x7a>
 76c:	2040           	movea.l d0,a0
 76e:	5888           	addq.l #4,a0
 770:	b1c9           	cmpa.l a1,a0
 772:	53c2           	sl.s d2
 774:	4402           	neg.b d2
 776:	41e9 0004      	lea 4(a1),a0
 77a:	b1c0           	cmpa.l d0,a0
 77c:	53c4           	sl.s d4
 77e:	4404           	neg.b d4
 780:	8404           	or.b d4,d2
 782:	7808           	moveq #8,d4
 784:	b883           	cmp.l d3,d4
 786:	55c4           	sc.s d4
 788:	4404           	neg.b d4
 78a:	c404           	and.b d4,d2
 78c:	6746           	beq.s 7d4 <memcpy+0x80>
 78e:	2409           	move.l a1,d2
 790:	8480           	or.l d0,d2
 792:	7803           	moveq #3,d4
 794:	c484           	and.l d4,d2
 796:	663c           	bne.s 7d4 <memcpy+0x80>
 798:	2049           	movea.l a1,a0
 79a:	2440           	movea.l d0,a2
 79c:	74fc           	moveq #-4,d2
 79e:	c481           	and.l d1,d2
 7a0:	d489           	add.l a1,d2
		*d++ = *s++;
 7a2:	24d8           	move.l (a0)+,(a2)+
 7a4:	b488           	cmp.l a0,d2
 7a6:	66fa           	bne.s 7a2 <memcpy+0x4e>
 7a8:	74fc           	moveq #-4,d2
 7aa:	c481           	and.l d1,d2
 7ac:	2040           	movea.l d0,a0
 7ae:	d1c2           	adda.l d2,a0
 7b0:	d3c2           	adda.l d2,a1
 7b2:	9682           	sub.l d2,d3
 7b4:	b481           	cmp.l d1,d2
 7b6:	6716           	beq.s 7ce <memcpy+0x7a>
 7b8:	1091           	move.b (a1),(a0)
	while(len--)
 7ba:	4a83           	tst.l d3
 7bc:	6710           	beq.s 7ce <memcpy+0x7a>
		*d++ = *s++;
 7be:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
 7c4:	5383           	subq.l #1,d3
 7c6:	6706           	beq.s 7ce <memcpy+0x7a>
		*d++ = *s++;
 7c8:	1169 0002 0002 	move.b 2(a1),2(a0)
}
 7ce:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
 7d2:	4e75           	rts
 7d4:	2040           	movea.l d0,a0
 7d6:	d289           	add.l a1,d1
		*d++ = *s++;
 7d8:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 7da:	b289           	cmp.l a1,d1
 7dc:	67f0           	beq.s 7ce <memcpy+0x7a>
		*d++ = *s++;
 7de:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 7e0:	b289           	cmp.l a1,d1
 7e2:	66f4           	bne.s 7d8 <memcpy+0x84>
 7e4:	60e8           	bra.s 7ce <memcpy+0x7a>

000007e6 <memset>:
{
 7e6:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
 7ea:	202f 0024      	move.l 36(sp),d0
 7ee:	2a2f 0028      	move.l 40(sp),d5
 7f2:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
 7f6:	2809           	move.l a1,d4
 7f8:	5384           	subq.l #1,d4
 7fa:	b2fc 0000      	cmpa.w #0,a1
 7fe:	6f00 00b0      	ble.w 8b0 <memset+0xca>
 802:	1e05           	move.b d5,d7
 804:	2200           	move.l d0,d1
 806:	4481           	neg.l d1
 808:	7403           	moveq #3,d2
 80a:	c282           	and.l d2,d1
 80c:	7c05           	moveq #5,d6
		*ptr++ = val;
 80e:	2440           	movea.l d0,a2
 810:	bc84           	cmp.l d4,d6
 812:	646a           	bcc.s 87e <memset+0x98>
 814:	4a81           	tst.l d1
 816:	6724           	beq.s 83c <memset+0x56>
 818:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
 81a:	5384           	subq.l #1,d4
 81c:	7401           	moveq #1,d2
 81e:	b481           	cmp.l d1,d2
 820:	671a           	beq.s 83c <memset+0x56>
		*ptr++ = val;
 822:	2440           	movea.l d0,a2
 824:	548a           	addq.l #2,a2
 826:	2040           	movea.l d0,a0
 828:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
 82c:	5384           	subq.l #1,d4
 82e:	7403           	moveq #3,d2
 830:	b481           	cmp.l d1,d2
 832:	6608           	bne.s 83c <memset+0x56>
		*ptr++ = val;
 834:	528a           	addq.l #1,a2
 836:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
 83a:	5384           	subq.l #1,d4
 83c:	2609           	move.l a1,d3
 83e:	9681           	sub.l d1,d3
 840:	7c00           	moveq #0,d6
 842:	1c05           	move.b d5,d6
 844:	2406           	move.l d6,d2
 846:	4842           	swap d2
 848:	4242           	clr.w d2
 84a:	2042           	movea.l d2,a0
 84c:	2406           	move.l d6,d2
 84e:	e14a           	lsl.w #8,d2
 850:	4842           	swap d2
 852:	4242           	clr.w d2
 854:	e18e           	lsl.l #8,d6
 856:	2646           	movea.l d6,a3
 858:	2c08           	move.l a0,d6
 85a:	8486           	or.l d6,d2
 85c:	2c0b           	move.l a3,d6
 85e:	8486           	or.l d6,d2
 860:	1407           	move.b d7,d2
 862:	2040           	movea.l d0,a0
 864:	d1c1           	adda.l d1,a0
 866:	72fc           	moveq #-4,d1
 868:	c283           	and.l d3,d1
 86a:	d288           	add.l a0,d1
		*ptr++ = val;
 86c:	20c2           	move.l d2,(a0)+
 86e:	b1c1           	cmpa.l d1,a0
 870:	66fa           	bne.s 86c <memset+0x86>
 872:	72fc           	moveq #-4,d1
 874:	c283           	and.l d3,d1
 876:	d5c1           	adda.l d1,a2
 878:	9881           	sub.l d1,d4
 87a:	b283           	cmp.l d3,d1
 87c:	6732           	beq.s 8b0 <memset+0xca>
 87e:	1485           	move.b d5,(a2)
	while(len-- > 0)
 880:	4a84           	tst.l d4
 882:	6f2c           	ble.s 8b0 <memset+0xca>
		*ptr++ = val;
 884:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
 888:	7201           	moveq #1,d1
 88a:	b284           	cmp.l d4,d1
 88c:	6c22           	bge.s 8b0 <memset+0xca>
		*ptr++ = val;
 88e:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
 892:	7402           	moveq #2,d2
 894:	b484           	cmp.l d4,d2
 896:	6c18           	bge.s 8b0 <memset+0xca>
		*ptr++ = val;
 898:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
 89c:	7c03           	moveq #3,d6
 89e:	bc84           	cmp.l d4,d6
 8a0:	6c0e           	bge.s 8b0 <memset+0xca>
		*ptr++ = val;
 8a2:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
 8a6:	7204           	moveq #4,d1
 8a8:	b284           	cmp.l d4,d1
 8aa:	6c04           	bge.s 8b0 <memset+0xca>
		*ptr++ = val;
 8ac:	1545 0005      	move.b d5,5(a2)
}
 8b0:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
 8b4:	4e75           	rts

000008b6 <strlen>:
{
 8b6:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
 8ba:	7000           	moveq #0,d0
	while(*s++)
 8bc:	4a10           	tst.b (a0)
 8be:	6708           	beq.s 8c8 <strlen+0x12>
		t++;
 8c0:	5280           	addq.l #1,d0
	while(*s++)
 8c2:	4a30 0800      	tst.b (0,a0,d0.l)
 8c6:	66f8           	bne.s 8c0 <strlen+0xa>
}
 8c8:	4e75           	rts
 8ca:	4e71           	nop

000008cc <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
 8cc:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
 8d0:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
 8d4:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
 8d8:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
 8dc:	d041           	add.w d1,d0
	swap	d0
 8de:	4840           	swap d0
	clrw	d0
 8e0:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
 8e2:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
 8e6:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
 8ea:	d081           	add.l d1,d0

	rts
 8ec:	4e75           	rts

000008ee <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
 8ee:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
 8f0:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
 8f4:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
 8f8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
 8fe:	6416           	bcc.s 916 <__udivsi3+0x28>
	movel	d0, d2
 900:	2400           	move.l d0,d2
	clrw	d2
 902:	4242           	clr.w d2
	swap	d2
 904:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
 906:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
 908:	3002           	move.w d2,d0
	swap	d0
 90a:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
 90c:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
 910:	84c1           	divu.w d1,d2
	movew	d2, d0
 912:	3002           	move.w d2,d0
	jra	6f
 914:	6030           	bra.s 946 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
 916:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
 918:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
 91a:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
 91c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
 922:	64f4           	bcc.s 918 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
 924:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
 926:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
 92c:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
 92e:	c2c0           	mulu.w d0,d1
	swap	d2
 930:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
 932:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
 934:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
 936:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
 938:	660a           	bne.s 944 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
 93a:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
 93c:	6506           	bcs.s 944 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
 93e:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
 942:	6302           	bls.s 946 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
 944:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
 946:	241f           	move.l (sp)+,d2
	rts
 948:	4e75           	rts

0000094a <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
 94a:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
 94c:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
 94e:	222f 000c      	move.l 12(sp),d1
	jpl	1f
 952:	6a04           	bpl.s 958 <__divsi3+0xe>
	negl	d1
 954:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
 956:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
 958:	202f 0008      	move.l 8(sp),d0
	jpl	2f
 95c:	6a04           	bpl.s 962 <__divsi3+0x18>
	negl	d0
 95e:	4480           	neg.l d0
	negb	d2
 960:	4402           	neg.b d2

2:	movel	d1, sp@-
 962:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 964:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
 966:	6186           	bsr.s 8ee <__udivsi3>
	addql	IMM (8), sp
 968:	508f           	addq.l #8,sp

	tstb	d2
 96a:	4a02           	tst.b d2
	jpl	3f
 96c:	6a02           	bpl.s 970 <__divsi3+0x26>
	negl	d0
 96e:	4480           	neg.l d0

3:	movel	sp@+, d2
 970:	241f           	move.l (sp)+,d2
	rts
 972:	4e75           	rts

00000974 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 974:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 978:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 97c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 97e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
 980:	61c8           	bsr.s 94a <__divsi3>
	addql	IMM (8), sp
 982:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 984:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 988:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 98a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 98c:	6100 ff3e      	bsr.w 8cc <__mulsi3>
	addql	IMM (8), sp
 990:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 992:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 996:	9280           	sub.l d0,d1
	movel	d1, d0
 998:	2001           	move.l d1,d0
	rts
 99a:	4e75           	rts

0000099c <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 99c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 9a0:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 9a4:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 9a6:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
 9a8:	6100 ff44      	bsr.w 8ee <__udivsi3>
	addql	IMM (8), sp
 9ac:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 9ae:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 9b2:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 9b4:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 9b6:	6100 ff14      	bsr.w 8cc <__mulsi3>
	addql	IMM (8), sp
 9ba:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 9bc:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 9c0:	9280           	sub.l d0,d1
	movel	d1, d0
 9c2:	2001           	move.l d1,d0
	rts
 9c4:	4e75           	rts

000009c6 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
 9c6:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
 9c8:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
 9cc:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
 9d0:	2c5f           	movea.l (sp)+,a6
    rts
 9d2:	4e75           	rts

000009d4 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
 9d4:	16c0           	move.b d0,(a3)+
	rts
 9d6:	4e75           	rts
