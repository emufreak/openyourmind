
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
      12:	23ce 0001 3964 	move.l a6,13964 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,1393a <hw>
      1e:	0001 393a 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0001 15b1 	lea 115b1 <incbin_startimage_end+0xbd>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0001 3936 	move.l d0,13936 <GfxBase>
	if (!GfxBase)
      34:	6700 03ba      	beq.w 3f0 <main+0x3ea>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0001 3964 	movea.l 13964 <SysBase>,a6
      3e:	43f9 0001 15c2 	lea 115c2 <incbin_startimage_end+0xce>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0001 3960 	move.l d0,13960 <DOSBase>
	if (!DOSBase)
      50:	6700 0392      	beq.w 3e4 <main+0x3de>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0001 15ce 	pea 115ce <incbin_startimage_end+0xda>
      5a:	4eb9 0000 050e 	jsr 50e <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0001 3960 	movea.l 13960 <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0001 3960 	movea.l 13960 <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0001 15ea 	move.l #71146,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      7e:	2c79 0001 3960 	movea.l 13960 <DOSBase>,a6
      84:	7232           	moveq #50,d1
      86:	4eae ff3a      	jsr -198(a6)
  Zoom_InitRun();
      8a:	4eb9 0000 08e6 	jsr 8e6 <Zoom_InitRun>

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
      90:	247c 00f0 ff60 	movea.l #15794016,a2
      96:	588f           	addq.l #4,sp
      98:	4a92           	tst.l (a2)
      9a:	6718           	beq.s b4 <main+0xae>
      9c:	4878 0001      	pea 1 <_start+0x1>
      a0:	47f9 0000 046c 	lea 46c <warpmode.part.0>,a3
      a6:	4e93           	jsr (a3)
      a8:	588f           	addq.l #4,sp
      aa:	4a92           	tst.l (a2)
      ac:	6706           	beq.s b4 <main+0xae>
      ae:	42a7           	clr.l -(sp)
      b0:	4e93           	jsr (a3)
      b2:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
      b4:	2c79 0001 3936 	movea.l 13936 <GfxBase>,a6
      ba:	23ee 0022 0001 	move.l 34(a6),13924 <ActiView>
      c0:	3924 
	OwnBlitter();
      c2:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
      c6:	2c79 0001 3936 	movea.l 13936 <GfxBase>,a6
      cc:	4eae ff1c      	jsr -228(a6)
	Disable();
      d0:	2c79 0001 3964 	movea.l 13964 <SysBase>,a6
      d6:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
      da:	2479 0001 393a 	movea.l 1393a <hw>,a2
      e0:	302a 0010      	move.w 16(a2),d0
      e4:	33c0 0001 3928 	move.w d0,13928 <SystemADKCON>
	SystemInts=hw->intenar;
      ea:	302a 001c      	move.w 28(a2),d0
      ee:	33c0 0001 392c 	move.w d0,1392c <SystemInts>
	SystemDMA=hw->dmaconr;
      f4:	302a 0002      	move.w 2(a2),d0
      f8:	33c0 0001 392a 	move.w d0,1392a <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
      fe:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     104:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
     10a:	47f9 0000 0b68 	lea b68 <WaitVbl>,a3
     110:	4e93           	jsr (a3)
	WaitVbl();
     112:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
     114:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     11a:	2c79 0001 3936 	movea.l 13936 <GfxBase>,a6
     120:	93c9           	suba.l a1,a1
     122:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     126:	2c79 0001 3936 	movea.l 13936 <GfxBase>,a6
     12c:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     130:	2c79 0001 3936 	movea.l 13936 <GfxBase>,a6
     136:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     13a:	4e93           	jsr (a3)
	WaitVbl();
     13c:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     13e:	3f7c 4e7a 001e 	move.w #20090,30(sp)
     144:	3f7c 0801 0020 	move.w #2049,32(sp)
     14a:	3f7c 4e73 0022 	move.w #20083,34(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     150:	2c79 0001 3964 	movea.l 13964 <SysBase>,a6
     156:	082e 0000 0129 	btst #0,297(a6)
     15c:	6700 02bc      	beq.w 41a <main+0x414>
		vbr = (APTR)Supervisor((void*)getvbr);
     160:	7e1e           	moveq #30,d7
     162:	de8f           	add.l sp,d7
     164:	cf8d           	exg d7,a5
     166:	4eae ffe2      	jsr -30(a6)
     16a:	cf8d           	exg d7,a5

	VBR=GetVBR();
     16c:	23c0 0001 392e 	move.l d0,1392e <VBR.lto_priv.1>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     172:	2079 0001 392e 	movea.l 1392e <VBR.lto_priv.1>,a0
     178:	2c68 006c      	movea.l 108(a0),a6
	SystemIrq=GetInterruptHandler(); //store interrupt register
     17c:	23ce 0001 3932 	move.l a6,13932 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
     182:	4e93           	jsr (a3)
	// DEMO - increment frameCounter
	frameCounter++;
}

void RunDemo() {
  hw->dmacon = 0b1001001111100000;
     184:	2479 0001 393a 	movea.l 1393a <hw>,a2
     18a:	357c 93e0 0096 	move.w #-27680,150(a2)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     190:	2079 0001 392e 	movea.l 1392e <VBR.lto_priv.1>,a0
     196:	217c 0000 0b3e 	move.l #2878,108(a0)
     19c:	006c 
	SetInterruptHandler((APTR)interruptHandler);
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     19e:	357c c020 009a 	move.w #-16352,154(a2)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     1a4:	357c 0020 009c 	move.w #32,156(a2)
  for( int i=0;i<size;i++) 
    *destination++ = *source++;  
}

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     1aa:	3039 00df f016 	move.w dff016 <gcc8_c_support.c.e9862530+0xdd742b>,d0
  //PrepareDisplay();

	while(!MouseRight()) {
     1b0:	0800 000a      	btst #10,d0
     1b4:	6700 010c      	beq.w 2c2 <main+0x2bc>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     1b8:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd7419>,d0
     1be:	2f40 001e      	move.l d0,30(sp)
		vpos&=0x1ff00;
     1c2:	202f 001e      	move.l 30(sp),d0
     1c6:	0280 0001 ff00 	andi.l #130816,d0
     1cc:	2f40 001e      	move.l d0,30(sp)
		if (vpos!=(311<<8))
     1d0:	202f 001e      	move.l 30(sp),d0
     1d4:	0c80 0001 3700 	cmpi.l #79616,d0
     1da:	67dc           	beq.s 1b8 <main+0x1b2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     1dc:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd7419>,d0
     1e2:	2f40 001a      	move.l d0,26(sp)
		vpos&=0x1ff00;
     1e6:	202f 001a      	move.l 26(sp),d0
     1ea:	0280 0001 ff00 	andi.l #130816,d0
     1f0:	2f40 001a      	move.l d0,26(sp)
		if (vpos==(311<<8))
     1f4:	202f 001a      	move.l 26(sp),d0
     1f8:	0c80 0001 3700 	cmpi.l #79616,d0
     1fe:	66dc           	bne.s 1dc <main+0x1d6>
  }
  //ZoomHorizontal = 10;
}

void Zoom_SetBplPointers() {
  ULONG plane2set = DrawBuffer;
     200:	2279 0001 3958 	movea.l 13958 <DrawBuffer>,a1
  UWORD *posofcopper = (UWORD *)DrawCopper + ZMCOPBPL1HIGH;
     206:	2079 0001 3946 	movea.l 13946 <DrawCopper>,a0
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    UWORD highword = (ULONG)plane2set >> 16;
     20c:	2009           	move.l a1,d0
     20e:	4240           	clr.w d0
     210:	4840           	swap d0
     212:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     216:	3149 0076      	move.w a1,118(a0)
    *posofcopper = highword;
    posofcopper += 2;
    *posofcopper = lowword;
    posofcopper += 2;
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     21a:	7030           	moveq #48,d0
     21c:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
     21e:	2200           	move.l d0,d1
     220:	4241           	clr.w d1
     222:	4841           	swap d1
     224:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     228:	3140 007e      	move.w d0,126(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     22c:	7060           	moveq #96,d0
     22e:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
     230:	2200           	move.l d0,d1
     232:	4241           	clr.w d1
     234:	4841           	swap d1
     236:	3141 0082      	move.w d1,130(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     23a:	3140 0086      	move.w d0,134(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     23e:	2009           	move.l a1,d0
     240:	0680 0000 0090 	addi.l #144,d0
    UWORD highword = (ULONG)plane2set >> 16;
     246:	2200           	move.l d0,d1
     248:	4241           	clr.w d1
     24a:	4841           	swap d1
     24c:	3141 008a      	move.w d1,138(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     250:	3140 008e      	move.w d0,142(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     254:	2009           	move.l a1,d0
     256:	0680 0000 00c0 	addi.l #192,d0
    UWORD highword = (ULONG)plane2set >> 16;
     25c:	2200           	move.l d0,d1
     25e:	4241           	clr.w d1
     260:	4841           	swap d1
     262:	3141 0092      	move.w d1,146(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     266:	3140 0096      	move.w d0,150(a0)
  }
  
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
     26a:	23f9 0001 395c 	move.l 1395c <ViewBuffer>,13958 <DrawBuffer>
     270:	0001 3958 
  ViewBuffer = (ULONG *) tmp;
     274:	23c9 0001 395c 	move.l a1,1395c <ViewBuffer>
  DrawCopper = ViewCopper;
     27a:	23f9 0001 393e 	move.l 1393e <ViewCopper>,13946 <DrawCopper>
     280:	0001 3946 
  ViewCopper = (ULONG *)tmp;
     284:	23c8 0001 393e 	move.l a0,1393e <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     28a:	2548 0080      	move.l a0,128(a2)
  hw->copjmp1 = tmp;
     28e:	3548 0088      	move.w a0,136(a2)
short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     292:	1039 00bf e001 	move.b bfe001 <gcc8_c_support.c.e9862530+0xbd6416>,d0

void RunFrame() {
  Zoom_SetBplPointers();
  SwapCl();
  //TestZoomSpeed();
  while( !MouseLeft()) {}
     298:	0800 0006      	btst #6,d0
     29c:	66f4           	bne.s 292 <main+0x28c>
  //Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer - 2, (UWORD *)DrawBuffer - 2, Zoom_LevelOfZoom, 5 );
  if( Zoom_LevelOfZoom == 17)
     29e:	3039 0001 3956 	move.w 13956 <Zoom_LevelOfZoom>,d0
     2a4:	0c40 0011      	cmpi.w #17,d0
     2a8:	6700 00fc      	beq.w 3a6 <main+0x3a0>
    Zoom_LevelOfZoom = 0;
  else
    Zoom_LevelOfZoom++;
     2ac:	5240           	addq.w #1,d0
     2ae:	33c0 0001 3956 	move.w d0,13956 <Zoom_LevelOfZoom>
     2b4:	3039 00df f016 	move.w dff016 <gcc8_c_support.c.e9862530+0xdd742b>,d0
	while(!MouseRight()) {
     2ba:	0800 000a      	btst #10,d0
     2be:	6600 fef8      	bne.w 1b8 <main+0x1b2>
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     2c2:	2079 0001 392e 	movea.l 1392e <VBR.lto_priv.1>,a0
     2c8:	217c 0000 0b3e 	move.l #2878,108(a0)
     2ce:	006c 
	WaitVbl();
     2d0:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     2d2:	302a 0002      	move.w 2(a2),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     2d6:	302a 0002      	move.w 2(a2),d0
     2da:	0800 000e      	btst #14,d0
     2de:	66f6           	bne.s 2d6 <main+0x2d0>
	hw->intena=0x7fff;//disable all interrupts
     2e0:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     2e6:	357c 7fff 009c 	move.w #32767,156(a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     2ec:	357c 7fff 0096 	move.w #32767,150(a2)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     2f2:	2079 0001 392e 	movea.l 1392e <VBR.lto_priv.1>,a0
     2f8:	214e 006c      	move.l a6,108(a0)
	hw->cop1lc=(ULONG)GfxBase->copinit;
     2fc:	2c79 0001 3936 	movea.l 13936 <GfxBase>,a6
     302:	256e 0026 0080 	move.l 38(a6),128(a2)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     308:	256e 0032 0084 	move.l 50(a6),132(a2)
	hw->copjmp1=0x7fff; //start coppper
     30e:	357c 7fff 0088 	move.w #32767,136(a2)
	hw->intena=SystemInts|0x8000;
     314:	3039 0001 392c 	move.w 1392c <SystemInts>,d0
     31a:	0040 8000      	ori.w #-32768,d0
     31e:	3540 009a      	move.w d0,154(a2)
	hw->dmacon=SystemDMA|0x8000;
     322:	3039 0001 392a 	move.w 1392a <SystemDMA>,d0
     328:	0040 8000      	ori.w #-32768,d0
     32c:	3540 0096      	move.w d0,150(a2)
	hw->adkcon=SystemADKCON|0x8000;
     330:	3039 0001 3928 	move.w 13928 <SystemADKCON>,d0
     336:	0040 8000      	ori.w #-32768,d0
     33a:	3540 009e      	move.w d0,158(a2)
	LoadView(ActiView);
     33e:	2279 0001 3924 	movea.l 13924 <ActiView>,a1
     344:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     348:	2c79 0001 3936 	movea.l 13936 <GfxBase>,a6
     34e:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     352:	2c79 0001 3936 	movea.l 13936 <GfxBase>,a6
     358:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     35c:	2c79 0001 3936 	movea.l 13936 <GfxBase>,a6
     362:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     366:	2c79 0001 3936 	movea.l 13936 <GfxBase>,a6
     36c:	4eae fe32      	jsr -462(a6)
	Enable();
     370:	2c79 0001 3964 	movea.l 13964 <SysBase>,a6
     376:	4eae ff82      	jsr -126(a6)
	RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     37a:	2c79 0001 3964 	movea.l 13964 <SysBase>,a6
     380:	2279 0001 3960 	movea.l 13960 <DOSBase>,a1
     386:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     38a:	2c79 0001 3964 	movea.l 13964 <SysBase>,a6
     390:	2279 0001 3936 	movea.l 13936 <GfxBase>,a1
     396:	4eae fe62      	jsr -414(a6)
}
     39a:	7000           	moveq #0,d0
     39c:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
     3a0:	4fef 000c      	lea 12(sp),sp
     3a4:	4e75           	rts
    Zoom_LevelOfZoom = 0;
     3a6:	4279 0001 3956 	clr.w 13956 <Zoom_LevelOfZoom>
     3ac:	3039 00df f016 	move.w dff016 <gcc8_c_support.c.e9862530+0xdd742b>,d0
	while(!MouseRight()) {
     3b2:	0800 000a      	btst #10,d0
     3b6:	6700 ff0a      	beq.w 2c2 <main+0x2bc>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     3ba:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd7419>,d0
     3c0:	2f40 001e      	move.l d0,30(sp)
		vpos&=0x1ff00;
     3c4:	202f 001e      	move.l 30(sp),d0
     3c8:	0280 0001 ff00 	andi.l #130816,d0
     3ce:	2f40 001e      	move.l d0,30(sp)
		if (vpos!=(311<<8))
     3d2:	202f 001e      	move.l 30(sp),d0
     3d6:	0c80 0001 3700 	cmpi.l #79616,d0
     3dc:	6700 fdda      	beq.w 1b8 <main+0x1b2>
     3e0:	6000 fdfa      	bra.w 1dc <main+0x1d6>
		Exit(0);
     3e4:	9dce           	suba.l a6,a6
     3e6:	7200           	moveq #0,d1
     3e8:	4eae ff70      	jsr -144(a6)
     3ec:	6000 fc66      	bra.w 54 <main+0x4e>
		Exit(0);
     3f0:	2c79 0001 3960 	movea.l 13960 <DOSBase>,a6
     3f6:	7200           	moveq #0,d1
     3f8:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     3fc:	2c79 0001 3964 	movea.l 13964 <SysBase>,a6
     402:	43f9 0001 15c2 	lea 115c2 <incbin_startimage_end+0xce>,a1
     408:	7000           	moveq #0,d0
     40a:	4eae fdd8      	jsr -552(a6)
     40e:	23c0 0001 3960 	move.l d0,13960 <DOSBase>
	if (!DOSBase)
     414:	6600 fc3e      	bne.w 54 <main+0x4e>
     418:	60ca           	bra.s 3e4 <main+0x3de>
	APTR vbr = 0;
     41a:	7000           	moveq #0,d0
	VBR=GetVBR();
     41c:	23c0 0001 392e 	move.l d0,1392e <VBR.lto_priv.1>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     422:	2079 0001 392e 	movea.l 1392e <VBR.lto_priv.1>,a0
     428:	2c68 006c      	movea.l 108(a0),a6
	SystemIrq=GetInterruptHandler(); //store interrupt register
     42c:	23ce 0001 3932 	move.l a6,13932 <SystemIrq>
	WaitVbl();
     432:	4e93           	jsr (a3)
  hw->dmacon = 0b1001001111100000;
     434:	2479 0001 393a 	movea.l 1393a <hw>,a2
     43a:	357c 93e0 0096 	move.w #-27680,150(a2)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     440:	2079 0001 392e 	movea.l 1392e <VBR.lto_priv.1>,a0
     446:	217c 0000 0b3e 	move.l #2878,108(a0)
     44c:	006c 
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     44e:	357c c020 009a 	move.w #-16352,154(a2)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     454:	357c 0020 009c 	move.w #32,156(a2)
     45a:	3039 00df f016 	move.w dff016 <gcc8_c_support.c.e9862530+0xdd742b>,d0
	while(!MouseRight()) {
     460:	0800 000a      	btst #10,d0
     464:	6600 fd52      	bne.w 1b8 <main+0x1b2>
     468:	6000 fe58      	bra.w 2c2 <main+0x2bc>

0000046c <warpmode.part.0>:
void warpmode(int on) 
     46c:	598f           	subq.l #4,sp
     46e:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     470:	4aaf 000c      	tst.l 12(sp)
     474:	674c           	beq.s 4c2 <warpmode.part.0+0x56>
     476:	4878 0001      	pea 1 <_start+0x1>
     47a:	740b           	moveq #11,d2
     47c:	d48f           	add.l sp,d2
     47e:	2f02           	move.l d2,-(sp)
     480:	42a7           	clr.l -(sp)
     482:	4879 0001 1528 	pea 11528 <incbin_startimage_end+0x34>
     488:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8414>
     48c:	4878 0052      	pea 52 <main+0x4c>
     490:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee8375>
     496:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     49a:	203c 0001 150e 	move.l #70926,d0
     4a0:	4878 0001      	pea 1 <_start+0x1>
     4a4:	2f02           	move.l d2,-(sp)
     4a6:	42a7           	clr.l -(sp)
     4a8:	2f00           	move.l d0,-(sp)
     4aa:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8414>
     4ae:	4878 0052      	pea 52 <main+0x4c>
     4b2:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee8375>
	}
}
     4b8:	4fef 0018      	lea 24(sp),sp
     4bc:	241f           	move.l (sp)+,d2
     4be:	588f           	addq.l #4,sp
     4c0:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     4c2:	4878 0001      	pea 1 <_start+0x1>
     4c6:	740b           	moveq #11,d2
     4c8:	d48f           	add.l sp,d2
     4ca:	2f02           	move.l d2,-(sp)
     4cc:	42a7           	clr.l -(sp)
     4ce:	4879 0001 1532 	pea 11532 <incbin_startimage_end+0x3e>
     4d4:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8414>
     4d8:	4878 0052      	pea 52 <main+0x4c>
     4dc:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee8375>
     4e2:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     4e6:	203c 0001 14f5 	move.l #70901,d0
     4ec:	4878 0001      	pea 1 <_start+0x1>
     4f0:	2f02           	move.l d2,-(sp)
     4f2:	42a7           	clr.l -(sp)
     4f4:	2f00           	move.l d0,-(sp)
     4f6:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8414>
     4fa:	4878 0052      	pea 52 <main+0x4c>
     4fe:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee8375>
}
     504:	4fef 0018      	lea 24(sp),sp
     508:	241f           	move.l (sp)+,d2
     50a:	588f           	addq.l #4,sp
     50c:	4e75           	rts

0000050e <KPrintF>:
{
     50e:	4fef ff80      	lea -128(sp),sp
     512:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
     516:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xee8375>
     51c:	6734           	beq.s 552 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     51e:	2c79 0001 3964 	movea.l 13964 <SysBase>,a6
     524:	206f 0090      	movea.l 144(sp),a0
     528:	43ef 0094      	lea 148(sp),a1
     52c:	45f9 0000 0e2c 	lea e2c <PutChar>,a2
     532:	47ef 000c      	lea 12(sp),a3
     536:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     53a:	2f0b           	move.l a3,-(sp)
     53c:	4878 0056      	pea 56 <main+0x50>
     540:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee8375>
     546:	508f           	addq.l #8,sp
}
     548:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     54c:	4fef 0080      	lea 128(sp),sp
     550:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     552:	2c79 0001 3964 	movea.l 13964 <SysBase>,a6
     558:	206f 0090      	movea.l 144(sp),a0
     55c:	43ef 0094      	lea 148(sp),a1
     560:	45f9 0000 0e1e 	lea e1e <KPutCharX>,a2
     566:	97cb           	suba.l a3,a3
     568:	4eae fdf6      	jsr -522(a6)
}
     56c:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     570:	4fef 0080      	lea 128(sp),sp
     574:	4e75           	rts

00000576 <ClbuildZoom>:
ULONG * ClbuildZoom() {
     576:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
     57a:	2c79 0001 3964 	movea.l 13964 <SysBase>,a6
     580:	203c 0000 591c 	move.l #22812,d0
     586:	7202           	moveq #2,d1
     588:	4eae ff3a      	jsr -198(a6)
     58c:	2440           	movea.l d0,a2
  if( retval == 0) {
     58e:	4a80           	tst.l d0
     590:	6700 01ee      	beq.w 780 <ClbuildZoom+0x20a>
    *cl++ = *clpartinstruction++;
     594:	24b9 0001 38c0 	move.l 138c0 <ClsSprites>,(a2)
     59a:	2579 0001 38c4 	move.l 138c4 <ClsSprites+0x4>,4(a2)
     5a0:	0004 
     5a2:	2579 0001 38c8 	move.l 138c8 <ClsSprites+0x8>,8(a2)
     5a8:	0008 
     5aa:	2579 0001 38cc 	move.l 138cc <ClsSprites+0xc>,12(a2)
     5b0:	000c 
     5b2:	2579 0001 38d0 	move.l 138d0 <ClsSprites+0x10>,16(a2)
     5b8:	0010 
     5ba:	2579 0001 38d4 	move.l 138d4 <ClsSprites+0x14>,20(a2)
     5c0:	0014 
     5c2:	2579 0001 38d8 	move.l 138d8 <ClsSprites+0x18>,24(a2)
     5c8:	0018 
     5ca:	2579 0001 38dc 	move.l 138dc <ClsSprites+0x1c>,28(a2)
     5d0:	001c 
     5d2:	2579 0001 38e0 	move.l 138e0 <ClsSprites+0x20>,32(a2)
     5d8:	0020 
     5da:	2579 0001 38e4 	move.l 138e4 <ClsSprites+0x24>,36(a2)
     5e0:	0024 
     5e2:	2579 0001 38e8 	move.l 138e8 <ClsSprites+0x28>,40(a2)
     5e8:	0028 
     5ea:	2579 0001 38ec 	move.l 138ec <ClsSprites+0x2c>,44(a2)
     5f0:	002c 
     5f2:	2579 0001 38f0 	move.l 138f0 <ClsSprites+0x30>,48(a2)
     5f8:	0030 
     5fa:	2579 0001 38f4 	move.l 138f4 <ClsSprites+0x34>,52(a2)
     600:	0034 
     602:	2579 0001 38f8 	move.l 138f8 <ClsSprites+0x38>,56(a2)
     608:	0038 
     60a:	2579 0001 38fc 	move.l 138fc <ClsSprites+0x3c>,60(a2)
     610:	003c 
    *cl++ = *clpartinstruction++;
     612:	2579 0001 3890 	move.l 13890 <ClScreen>,64(a2)
     618:	0040 
     61a:	2579 0001 3894 	move.l 13894 <ClScreen+0x4>,68(a2)
     620:	0044 
     622:	2579 0001 3898 	move.l 13898 <ClScreen+0x8>,72(a2)
     628:	0048 
     62a:	2579 0001 389c 	move.l 1389c <ClScreen+0xc>,76(a2)
     630:	004c 
     632:	2579 0001 38a0 	move.l 138a0 <ClScreen+0x10>,80(a2)
     638:	0050 
     63a:	2579 0001 38a4 	move.l 138a4 <ClScreen+0x14>,84(a2)
     640:	0054 
     642:	2579 0001 38a8 	move.l 138a8 <ClScreen+0x18>,88(a2)
     648:	0058 
     64a:	2579 0001 38ac 	move.l 138ac <ClScreen+0x1c>,92(a2)
     650:	005c 
     652:	2579 0001 38b0 	move.l 138b0 <ClScreen+0x20>,96(a2)
     658:	0060 
     65a:	2579 0001 38b4 	move.l 138b4 <ClScreen+0x24>,100(a2)
     660:	0064 
     662:	2579 0001 38b8 	move.l 138b8 <ClScreen+0x28>,104(a2)
     668:	0068 
     66a:	2579 0001 38bc 	move.l 138bc <ClScreen+0x2c>,108(a2)
     670:	006c 
  *cl++ = 0x00e00000;
     672:	257c 00e0 0000 	move.l #14680064,112(a2)
     678:	0070 
  *cl++ = 0x00e20000;
     67a:	257c 00e2 0000 	move.l #14811136,116(a2)
     680:	0074 
  *cl++ = 0x00e40000;
     682:	257c 00e4 0000 	move.l #14942208,120(a2)
     688:	0078 
  *cl++ = 0x00e60000;
     68a:	257c 00e6 0000 	move.l #15073280,124(a2)
     690:	007c 
  *cl++ = 0x00e80000;
     692:	257c 00e8 0000 	move.l #15204352,128(a2)
     698:	0080 
  *cl++ = 0x00ea0000;
     69a:	257c 00ea 0000 	move.l #15335424,132(a2)
     6a0:	0084 
  *cl++ = 0x00ec0000;
     6a2:	257c 00ec 0000 	move.l #15466496,136(a2)
     6a8:	0088 
  *cl++ = 0x00ee0000;
     6aa:	257c 00ee 0000 	move.l #15597568,140(a2)
     6b0:	008c 
  *cl++ = 0x00f00000;
     6b2:	257c 00f0 0000 	move.l #15728640,144(a2)
     6b8:	0090 
  *cl++ = 0x00f20000;
     6ba:	257c 00f2 0000 	move.l #15859712,148(a2)
     6c0:	0094 
  for(int i=0; i<32;i++)
     6c2:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
     6c6:	41f9 0001 3810 	lea 13810 <ClColor>,a0
    *cl++ = *clpartinstruction++;
     6cc:	22d8           	move.l (a0)+,(a1)+
  for(int i=0; i<32;i++)
     6ce:	b1fc 0001 3890 	cmpa.l #80016,a0
     6d4:	66f6           	bne.s 6cc <ClbuildZoom+0x156>
  ULONG cop2 = cl+3;
     6d6:	200a           	move.l a2,d0
     6d8:	0680 0000 0124 	addi.l #292,d0
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
     6de:	2200           	move.l d0,d1
     6e0:	4241           	clr.w d1
     6e2:	4841           	swap d1
     6e4:	0681 0084 0000 	addi.l #8650752,d1
     6ea:	2541 0118      	move.l d1,280(a2)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
     6ee:	2200           	move.l d0,d1
     6f0:	0281 0000 ffff 	andi.l #65535,d1
     6f6:	0681 0086 0000 	addi.l #8781824,d1
     6fc:	2541 011c      	move.l d1,284(a2)
  *cl++ = 0x2c01ff00;
     700:	257c 2c01 ff00 	move.l #738328320,288(a2)
     706:	0120 
  ULONG cop2br1 = cop2 + ( (8+27)<<2);
     708:	2200           	move.l d0,d1
     70a:	0681 0000 008c 	addi.l #140,d1
  clpartinstruction[6+27] = 0x00840000 + ( cop2br1 >> 16);
     710:	2401           	move.l d1,d2
     712:	4242           	clr.w d2
     714:	4842           	swap d2
     716:	0682 0084 0000 	addi.l #8650752,d2
     71c:	23c2 0001 3680 	move.l d2,13680 <Cl102ZoomRepeat+0x84>
  clpartinstruction[7+27] = 0x00860000 + ( cop2br1 & 0xffff);
     722:	0281 0000 ffff 	andi.l #65535,d1
     728:	0681 0086 0000 	addi.l #8781824,d1
     72e:	23c1 0001 3684 	move.l d1,13684 <Cl102ZoomRepeat+0x88>
  clpartinstruction[17+27+27+27] = 0x00840000 + ( cop2br2 >> 16);
     734:	220a           	move.l a2,d1
     736:	0681 0000 02b4 	addi.l #692,d1
     73c:	2401           	move.l d1,d2
     73e:	4242           	clr.w d2
     740:	4842           	swap d2
     742:	0682 0084 0000 	addi.l #8650752,d2
     748:	23c2 0001 3784 	move.l d2,13784 <Cl102ZoomRepeat+0x188>
  clpartinstruction[18+27+27+27] = 0x00860000 + ( cop2br2 & 0xffff);
     74e:	0281 0000 ffff 	andi.l #65535,d1
     754:	0681 0086 0000 	addi.l #8781824,d1
     75a:	23c1 0001 3788 	move.l d1,13788 <Cl102ZoomRepeat+0x18c>
  for(int i=0;i<26+27+27+26+27;i++)
     760:	2240           	movea.l d0,a1
  clpartinstruction = Cl102ZoomRepeat;
     762:	41f9 0001 35fc 	lea 135fc <Cl102ZoomRepeat>,a0
    *cl++ = *clpartinstruction++;
     768:	22d8           	move.l (a0)+,(a1)+
  for(int i=0;i<26+27+27+26+27;i++)
     76a:	b1fc 0001 3810 	cmpa.l #79888,a0
     770:	66f6           	bne.s 768 <ClbuildZoom+0x1f2>
   *cl++ = 0xfffffffe;
     772:	70fe           	moveq #-2,d0
     774:	2540 0338      	move.l d0,824(a2)
}
     778:	200a           	move.l a2,d0
     77a:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     77e:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     780:	2c79 0001 3960 	movea.l 13960 <DOSBase>,a6
     786:	4eae ffc4      	jsr -60(a6)
     78a:	2c79 0001 3960 	movea.l 13960 <DOSBase>,a6
     790:	2200           	move.l d0,d1
     792:	243c 0001 153d 	move.l #70973,d2
     798:	7628           	moveq #40,d3
     79a:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     79e:	2c79 0001 3960 	movea.l 13960 <DOSBase>,a6
     7a4:	7201           	moveq #1,d1
     7a6:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     7aa:	24b9 0001 38c0 	move.l 138c0 <ClsSprites>,(a2)
     7b0:	2579 0001 38c4 	move.l 138c4 <ClsSprites+0x4>,4(a2)
     7b6:	0004 
     7b8:	2579 0001 38c8 	move.l 138c8 <ClsSprites+0x8>,8(a2)
     7be:	0008 
     7c0:	2579 0001 38cc 	move.l 138cc <ClsSprites+0xc>,12(a2)
     7c6:	000c 
     7c8:	2579 0001 38d0 	move.l 138d0 <ClsSprites+0x10>,16(a2)
     7ce:	0010 
     7d0:	2579 0001 38d4 	move.l 138d4 <ClsSprites+0x14>,20(a2)
     7d6:	0014 
     7d8:	2579 0001 38d8 	move.l 138d8 <ClsSprites+0x18>,24(a2)
     7de:	0018 
     7e0:	2579 0001 38dc 	move.l 138dc <ClsSprites+0x1c>,28(a2)
     7e6:	001c 
     7e8:	2579 0001 38e0 	move.l 138e0 <ClsSprites+0x20>,32(a2)
     7ee:	0020 
     7f0:	2579 0001 38e4 	move.l 138e4 <ClsSprites+0x24>,36(a2)
     7f6:	0024 
     7f8:	2579 0001 38e8 	move.l 138e8 <ClsSprites+0x28>,40(a2)
     7fe:	0028 
     800:	2579 0001 38ec 	move.l 138ec <ClsSprites+0x2c>,44(a2)
     806:	002c 
     808:	2579 0001 38f0 	move.l 138f0 <ClsSprites+0x30>,48(a2)
     80e:	0030 
     810:	2579 0001 38f4 	move.l 138f4 <ClsSprites+0x34>,52(a2)
     816:	0034 
     818:	2579 0001 38f8 	move.l 138f8 <ClsSprites+0x38>,56(a2)
     81e:	0038 
     820:	2579 0001 38fc 	move.l 138fc <ClsSprites+0x3c>,60(a2)
     826:	003c 
    *cl++ = *clpartinstruction++;
     828:	2579 0001 3890 	move.l 13890 <ClScreen>,64(a2)
     82e:	0040 
     830:	2579 0001 3894 	move.l 13894 <ClScreen+0x4>,68(a2)
     836:	0044 
     838:	2579 0001 3898 	move.l 13898 <ClScreen+0x8>,72(a2)
     83e:	0048 
     840:	2579 0001 389c 	move.l 1389c <ClScreen+0xc>,76(a2)
     846:	004c 
     848:	2579 0001 38a0 	move.l 138a0 <ClScreen+0x10>,80(a2)
     84e:	0050 
     850:	2579 0001 38a4 	move.l 138a4 <ClScreen+0x14>,84(a2)
     856:	0054 
     858:	2579 0001 38a8 	move.l 138a8 <ClScreen+0x18>,88(a2)
     85e:	0058 
     860:	2579 0001 38ac 	move.l 138ac <ClScreen+0x1c>,92(a2)
     866:	005c 
     868:	2579 0001 38b0 	move.l 138b0 <ClScreen+0x20>,96(a2)
     86e:	0060 
     870:	2579 0001 38b4 	move.l 138b4 <ClScreen+0x24>,100(a2)
     876:	0064 
     878:	2579 0001 38b8 	move.l 138b8 <ClScreen+0x28>,104(a2)
     87e:	0068 
     880:	2579 0001 38bc 	move.l 138bc <ClScreen+0x2c>,108(a2)
     886:	006c 
  *cl++ = 0x00e00000;
     888:	257c 00e0 0000 	move.l #14680064,112(a2)
     88e:	0070 
  *cl++ = 0x00e20000;
     890:	257c 00e2 0000 	move.l #14811136,116(a2)
     896:	0074 
  *cl++ = 0x00e40000;
     898:	257c 00e4 0000 	move.l #14942208,120(a2)
     89e:	0078 
  *cl++ = 0x00e60000;
     8a0:	257c 00e6 0000 	move.l #15073280,124(a2)
     8a6:	007c 
  *cl++ = 0x00e80000;
     8a8:	257c 00e8 0000 	move.l #15204352,128(a2)
     8ae:	0080 
  *cl++ = 0x00ea0000;
     8b0:	257c 00ea 0000 	move.l #15335424,132(a2)
     8b6:	0084 
  *cl++ = 0x00ec0000;
     8b8:	257c 00ec 0000 	move.l #15466496,136(a2)
     8be:	0088 
  *cl++ = 0x00ee0000;
     8c0:	257c 00ee 0000 	move.l #15597568,140(a2)
     8c6:	008c 
  *cl++ = 0x00f00000;
     8c8:	257c 00f0 0000 	move.l #15728640,144(a2)
     8ce:	0090 
  *cl++ = 0x00f20000;
     8d0:	257c 00f2 0000 	move.l #15859712,148(a2)
     8d6:	0094 
  for(int i=0; i<32;i++)
     8d8:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
     8dc:	41f9 0001 3810 	lea 13810 <ClColor>,a0
     8e2:	6000 fde8      	bra.w 6cc <ClbuildZoom+0x156>

000008e6 <Zoom_InitRun>:
void Zoom_InitRun() {
     8e6:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     8ea:	2c79 0001 3964 	movea.l 13964 <SysBase>,a6
     8f0:	7004           	moveq #4,d0
     8f2:	7202           	moveq #2,d1
     8f4:	4eae ff3a      	jsr -198(a6)
  Copperlist1 = ClbuildZoom( );
     8f8:	45fa fc7c      	lea 576 <ClbuildZoom>(pc),a2
     8fc:	4e92           	jsr (a2)
     8fe:	23c0 0001 3952 	move.l d0,13952 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
     904:	4e92           	jsr (a2)
     906:	23c0 0001 394e 	move.l d0,1394e <Copperlist2>
  Bitplane1 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
     90c:	2c79 0001 3964 	movea.l 13964 <SysBase>,a6
     912:	203c 0000 ff00 	move.l #65280,d0
     918:	7202           	moveq #2,d1
     91a:	4eae ff3a      	jsr -198(a6)
     91e:	23c0 0001 394a 	move.l d0,1394a <Bitplane1>
  if(Bitplane1 == 0) {
     924:	6700 01b6      	beq.w adc <Zoom_InitRun+0x1f6>
  DrawBuffer = Bitplane1+2;
     928:	5080           	addq.l #8,d0
     92a:	23c0 0001 3958 	move.l d0,13958 <DrawBuffer>
  DrawCopper = Copperlist1;
     930:	23f9 0001 3952 	move.l 13952 <Copperlist1>,13946 <DrawCopper>
     936:	0001 3946 
  Bitplane2 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
     93a:	2c79 0001 3964 	movea.l 13964 <SysBase>,a6
     940:	203c 0000 ff00 	move.l #65280,d0
     946:	7202           	moveq #2,d1
     948:	4eae ff3a      	jsr -198(a6)
     94c:	23c0 0001 3942 	move.l d0,13942 <Bitplane2>
  if(Bitplane2 == 0) {
     952:	6700 0130      	beq.w a84 <Zoom_InitRun+0x19e>
  ViewBuffer = Bitplane2+2;
     956:	2440           	movea.l d0,a2
     958:	508a           	addq.l #8,a2
     95a:	23ca 0001 395c 	move.l a2,1395c <ViewBuffer>
  ViewCopper = Copperlist2;
     960:	23f9 0001 394e 	move.l 1394e <Copperlist2>,1393e <ViewCopper>
     966:	0001 393e 
  for( int i=0;i<256;i++) {
     96a:	2400           	move.l d0,d2
     96c:	0682 0000 f008 	addi.l #61448,d2
     972:	47fa 02cc      	lea c40 <memset>(pc),a3
     976:	763f           	moveq #63,d3
     978:	4603           	not.b d3
      *destination++ = 0xaaaaaaaa;
     97a:	24bc aaaa aaaa 	move.l #-1431655766,(a2)
     980:	257c aaaa aaaa 	move.l #-1431655766,4(a2)
     986:	0004 
     988:	257c aaaa aaaa 	move.l #-1431655766,8(a2)
     98e:	0008 
     990:	257c aaaa aaaa 	move.l #-1431655766,12(a2)
     996:	000c 
     998:	257c aaaa aaaa 	move.l #-1431655766,16(a2)
     99e:	0010 
     9a0:	257c aaaa aaaa 	move.l #-1431655766,20(a2)
     9a6:	0014 
     9a8:	257c aaaa aaaa 	move.l #-1431655766,24(a2)
     9ae:	0018 
     9b0:	257c aaaa aaaa 	move.l #-1431655766,28(a2)
     9b6:	001c 
     9b8:	257c aaaa aaaa 	move.l #-1431655766,32(a2)
     9be:	0020 
     9c0:	257c aaaa aaaa 	move.l #-1431655766,36(a2)
     9c6:	0024 
     9c8:	257c aaaa aaaa 	move.l #-1431655766,40(a2)
     9ce:	0028 
     9d0:	257c aaaa aaaa 	move.l #-1431655766,44(a2)
     9d6:	002c 
     9d8:	2f03           	move.l d3,-(sp)
     9da:	42a7           	clr.l -(sp)
     9dc:	486a 0030      	pea 48(a2)
     9e0:	4e93           	jsr (a3)
     9e2:	45ea 00f0      	lea 240(a2),a2
  for( int i=0;i<256;i++) {
     9e6:	4fef 000c      	lea 12(sp),sp
     9ea:	b5c2           	cmpa.l d2,a2
     9ec:	668c           	bne.s 97a <Zoom_InitRun+0x94>
  Zoom_LoadImage( DrawBuffer);
     9ee:	2479 0001 3958 	movea.l 13958 <DrawBuffer>,a2
     9f4:	260a           	move.l a2,d3
     9f6:	0683 0000 f000 	addi.l #61440,d3
     9fc:	743f           	moveq #63,d2
     9fe:	4602           	not.b d2
      *destination++ = 0xaaaaaaaa;
     a00:	24bc aaaa aaaa 	move.l #-1431655766,(a2)
     a06:	257c aaaa aaaa 	move.l #-1431655766,4(a2)
     a0c:	0004 
     a0e:	257c aaaa aaaa 	move.l #-1431655766,8(a2)
     a14:	0008 
     a16:	257c aaaa aaaa 	move.l #-1431655766,12(a2)
     a1c:	000c 
     a1e:	257c aaaa aaaa 	move.l #-1431655766,16(a2)
     a24:	0010 
     a26:	257c aaaa aaaa 	move.l #-1431655766,20(a2)
     a2c:	0014 
     a2e:	257c aaaa aaaa 	move.l #-1431655766,24(a2)
     a34:	0018 
     a36:	257c aaaa aaaa 	move.l #-1431655766,28(a2)
     a3c:	001c 
     a3e:	257c aaaa aaaa 	move.l #-1431655766,32(a2)
     a44:	0020 
     a46:	257c aaaa aaaa 	move.l #-1431655766,36(a2)
     a4c:	0024 
     a4e:	257c aaaa aaaa 	move.l #-1431655766,40(a2)
     a54:	0028 
     a56:	257c aaaa aaaa 	move.l #-1431655766,44(a2)
     a5c:	002c 
     a5e:	2f02           	move.l d2,-(sp)
     a60:	42a7           	clr.l -(sp)
     a62:	486a 0030      	pea 48(a2)
     a66:	4e93           	jsr (a3)
     a68:	45ea 00f0      	lea 240(a2),a2
  for( int i=0;i<256;i++) {
     a6c:	4fef 000c      	lea 12(sp),sp
     a70:	b5c3           	cmpa.l d3,a2
     a72:	668c           	bne.s a00 <Zoom_InitRun+0x11a>
  *bp = 0;
     a74:	4278 0200      	clr.w 200 <main+0x1fa>
  Zoom_LevelOfZoom = 0;
     a78:	4279 0001 3956 	clr.w 13956 <Zoom_LevelOfZoom>
}
     a7e:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
     a82:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     a84:	2c79 0001 3960 	movea.l 13960 <DOSBase>,a6
     a8a:	4eae ffc4      	jsr -60(a6)
     a8e:	2c79 0001 3960 	movea.l 13960 <DOSBase>,a6
     a94:	2200           	move.l d0,d1
     a96:	243c 0001 158a 	move.l #71050,d2
     a9c:	7626           	moveq #38,d3
     a9e:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     aa2:	2c79 0001 3960 	movea.l 13960 <DOSBase>,a6
     aa8:	7201           	moveq #1,d1
     aaa:	4eae ff70      	jsr -144(a6)
     aae:	2039 0001 3942 	move.l 13942 <Bitplane2>,d0
  ViewBuffer = Bitplane2+2;
     ab4:	2440           	movea.l d0,a2
     ab6:	508a           	addq.l #8,a2
     ab8:	23ca 0001 395c 	move.l a2,1395c <ViewBuffer>
  ViewCopper = Copperlist2;
     abe:	23f9 0001 394e 	move.l 1394e <Copperlist2>,1393e <ViewCopper>
     ac4:	0001 393e 
  for( int i=0;i<256;i++) {
     ac8:	2400           	move.l d0,d2
     aca:	0682 0000 f008 	addi.l #61448,d2
     ad0:	47fa 016e      	lea c40 <memset>(pc),a3
     ad4:	763f           	moveq #63,d3
     ad6:	4603           	not.b d3
     ad8:	6000 fea0      	bra.w 97a <Zoom_InitRun+0x94>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     adc:	2c79 0001 3960 	movea.l 13960 <DOSBase>,a6
     ae2:	4eae ffc4      	jsr -60(a6)
     ae6:	2c79 0001 3960 	movea.l 13960 <DOSBase>,a6
     aec:	2200           	move.l d0,d1
     aee:	243c 0001 1563 	move.l #71011,d2
     af4:	7626           	moveq #38,d3
     af6:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     afa:	2c79 0001 3960 	movea.l 13960 <DOSBase>,a6
     b00:	7201           	moveq #1,d1
     b02:	4eae ff70      	jsr -144(a6)
     b06:	2039 0001 394a 	move.l 1394a <Bitplane1>,d0
  DrawBuffer = Bitplane1+2;
     b0c:	5080           	addq.l #8,d0
     b0e:	23c0 0001 3958 	move.l d0,13958 <DrawBuffer>
  DrawCopper = Copperlist1;
     b14:	23f9 0001 3952 	move.l 13952 <Copperlist1>,13946 <DrawCopper>
     b1a:	0001 3946 
  Bitplane2 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
     b1e:	2c79 0001 3964 	movea.l 13964 <SysBase>,a6
     b24:	203c 0000 ff00 	move.l #65280,d0
     b2a:	7202           	moveq #2,d1
     b2c:	4eae ff3a      	jsr -198(a6)
     b30:	23c0 0001 3942 	move.l d0,13942 <Bitplane2>
  if(Bitplane2 == 0) {
     b36:	6600 fe1e      	bne.w 956 <Zoom_InitRun+0x70>
     b3a:	6000 ff48      	bra.w a84 <Zoom_InitRun+0x19e>

00000b3e <interruptHandler>:
static __attribute__((interrupt)) void interruptHandler() {
     b3e:	2f08           	move.l a0,-(sp)
     b40:	2f00           	move.l d0,-(sp)
	hw->intreq=(1<<INTB_VERTB); hw->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     b42:	2079 0001 393a 	movea.l 1393a <hw>,a0
     b48:	317c 0020 009c 	move.w #32,156(a0)
     b4e:	317c 0020 009c 	move.w #32,156(a0)
	frameCounter++;
     b54:	2039 0001 3920 	move.l 13920 <frameCounter>,d0
     b5a:	5280           	addq.l #1,d0
     b5c:	23c0 0001 3920 	move.l d0,13920 <frameCounter>
}
     b62:	201f           	move.l (sp)+,d0
     b64:	205f           	movea.l (sp)+,a0
     b66:	4e73           	rte

00000b68 <WaitVbl>:
void WaitVbl() {
     b68:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     b6a:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd7419>,d0
     b70:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
     b72:	2017           	move.l (sp),d0
     b74:	0280 0001 ff00 	andi.l #130816,d0
     b7a:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
     b7c:	2017           	move.l (sp),d0
     b7e:	0c80 0001 3700 	cmpi.l #79616,d0
     b84:	67e4           	beq.s b6a <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     b86:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd7419>,d0
     b8c:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
     b90:	202f 0004      	move.l 4(sp),d0
     b94:	0280 0001 ff00 	andi.l #130816,d0
     b9a:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
     b9e:	202f 0004      	move.l 4(sp),d0
     ba2:	0c80 0001 3700 	cmpi.l #79616,d0
     ba8:	66dc           	bne.s b86 <WaitVbl+0x1e>
}
     baa:	508f           	addq.l #8,sp
     bac:	4e75           	rts

00000bae <memcpy>:
{
     bae:	48e7 3820      	movem.l d2-d4/a2,-(sp)
     bb2:	202f 0014      	move.l 20(sp),d0
     bb6:	226f 0018      	movea.l 24(sp),a1
     bba:	222f 001c      	move.l 28(sp),d1
	while(len--)
     bbe:	2601           	move.l d1,d3
     bc0:	5383           	subq.l #1,d3
     bc2:	4a81           	tst.l d1
     bc4:	6762           	beq.s c28 <memcpy+0x7a>
     bc6:	2040           	movea.l d0,a0
     bc8:	5888           	addq.l #4,a0
     bca:	b1c9           	cmpa.l a1,a0
     bcc:	53c2           	sl.s d2
     bce:	4402           	neg.b d2
     bd0:	41e9 0004      	lea 4(a1),a0
     bd4:	b1c0           	cmpa.l d0,a0
     bd6:	53c4           	sl.s d4
     bd8:	4404           	neg.b d4
     bda:	8404           	or.b d4,d2
     bdc:	7808           	moveq #8,d4
     bde:	b883           	cmp.l d3,d4
     be0:	55c4           	sc.s d4
     be2:	4404           	neg.b d4
     be4:	c404           	and.b d4,d2
     be6:	6746           	beq.s c2e <memcpy+0x80>
     be8:	2409           	move.l a1,d2
     bea:	8480           	or.l d0,d2
     bec:	7803           	moveq #3,d4
     bee:	c484           	and.l d4,d2
     bf0:	663c           	bne.s c2e <memcpy+0x80>
     bf2:	2049           	movea.l a1,a0
     bf4:	2440           	movea.l d0,a2
     bf6:	74fc           	moveq #-4,d2
     bf8:	c481           	and.l d1,d2
     bfa:	d489           	add.l a1,d2
		*d++ = *s++;
     bfc:	24d8           	move.l (a0)+,(a2)+
     bfe:	b488           	cmp.l a0,d2
     c00:	66fa           	bne.s bfc <memcpy+0x4e>
     c02:	74fc           	moveq #-4,d2
     c04:	c481           	and.l d1,d2
     c06:	2040           	movea.l d0,a0
     c08:	d1c2           	adda.l d2,a0
     c0a:	d3c2           	adda.l d2,a1
     c0c:	9682           	sub.l d2,d3
     c0e:	b481           	cmp.l d1,d2
     c10:	6716           	beq.s c28 <memcpy+0x7a>
     c12:	1091           	move.b (a1),(a0)
	while(len--)
     c14:	4a83           	tst.l d3
     c16:	6710           	beq.s c28 <memcpy+0x7a>
		*d++ = *s++;
     c18:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
     c1e:	5383           	subq.l #1,d3
     c20:	6706           	beq.s c28 <memcpy+0x7a>
		*d++ = *s++;
     c22:	1169 0002 0002 	move.b 2(a1),2(a0)
}
     c28:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
     c2c:	4e75           	rts
     c2e:	2040           	movea.l d0,a0
     c30:	d289           	add.l a1,d1
		*d++ = *s++;
     c32:	10d9           	move.b (a1)+,(a0)+
	while(len--)
     c34:	b289           	cmp.l a1,d1
     c36:	67f0           	beq.s c28 <memcpy+0x7a>
		*d++ = *s++;
     c38:	10d9           	move.b (a1)+,(a0)+
	while(len--)
     c3a:	b289           	cmp.l a1,d1
     c3c:	66f4           	bne.s c32 <memcpy+0x84>
     c3e:	60e8           	bra.s c28 <memcpy+0x7a>

00000c40 <memset>:
{
     c40:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
     c44:	202f 0024      	move.l 36(sp),d0
     c48:	2a2f 0028      	move.l 40(sp),d5
     c4c:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
     c50:	2809           	move.l a1,d4
     c52:	5384           	subq.l #1,d4
     c54:	b2fc 0000      	cmpa.w #0,a1
     c58:	6f00 00b0      	ble.w d0a <memset+0xca>
     c5c:	1e05           	move.b d5,d7
     c5e:	2200           	move.l d0,d1
     c60:	4481           	neg.l d1
     c62:	7403           	moveq #3,d2
     c64:	c282           	and.l d2,d1
     c66:	7c05           	moveq #5,d6
		*ptr++ = val;
     c68:	2440           	movea.l d0,a2
     c6a:	bc84           	cmp.l d4,d6
     c6c:	646a           	bcc.s cd8 <memset+0x98>
     c6e:	4a81           	tst.l d1
     c70:	6724           	beq.s c96 <memset+0x56>
     c72:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
     c74:	5384           	subq.l #1,d4
     c76:	7401           	moveq #1,d2
     c78:	b481           	cmp.l d1,d2
     c7a:	671a           	beq.s c96 <memset+0x56>
		*ptr++ = val;
     c7c:	2440           	movea.l d0,a2
     c7e:	548a           	addq.l #2,a2
     c80:	2040           	movea.l d0,a0
     c82:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
     c86:	5384           	subq.l #1,d4
     c88:	7403           	moveq #3,d2
     c8a:	b481           	cmp.l d1,d2
     c8c:	6608           	bne.s c96 <memset+0x56>
		*ptr++ = val;
     c8e:	528a           	addq.l #1,a2
     c90:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
     c94:	5384           	subq.l #1,d4
     c96:	2609           	move.l a1,d3
     c98:	9681           	sub.l d1,d3
     c9a:	7c00           	moveq #0,d6
     c9c:	1c05           	move.b d5,d6
     c9e:	2406           	move.l d6,d2
     ca0:	4842           	swap d2
     ca2:	4242           	clr.w d2
     ca4:	2042           	movea.l d2,a0
     ca6:	2406           	move.l d6,d2
     ca8:	e14a           	lsl.w #8,d2
     caa:	4842           	swap d2
     cac:	4242           	clr.w d2
     cae:	e18e           	lsl.l #8,d6
     cb0:	2646           	movea.l d6,a3
     cb2:	2c08           	move.l a0,d6
     cb4:	8486           	or.l d6,d2
     cb6:	2c0b           	move.l a3,d6
     cb8:	8486           	or.l d6,d2
     cba:	1407           	move.b d7,d2
     cbc:	2040           	movea.l d0,a0
     cbe:	d1c1           	adda.l d1,a0
     cc0:	72fc           	moveq #-4,d1
     cc2:	c283           	and.l d3,d1
     cc4:	d288           	add.l a0,d1
		*ptr++ = val;
     cc6:	20c2           	move.l d2,(a0)+
     cc8:	b1c1           	cmpa.l d1,a0
     cca:	66fa           	bne.s cc6 <memset+0x86>
     ccc:	72fc           	moveq #-4,d1
     cce:	c283           	and.l d3,d1
     cd0:	d5c1           	adda.l d1,a2
     cd2:	9881           	sub.l d1,d4
     cd4:	b283           	cmp.l d3,d1
     cd6:	6732           	beq.s d0a <memset+0xca>
     cd8:	1485           	move.b d5,(a2)
	while(len-- > 0)
     cda:	4a84           	tst.l d4
     cdc:	6f2c           	ble.s d0a <memset+0xca>
		*ptr++ = val;
     cde:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
     ce2:	7201           	moveq #1,d1
     ce4:	b284           	cmp.l d4,d1
     ce6:	6c22           	bge.s d0a <memset+0xca>
		*ptr++ = val;
     ce8:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
     cec:	7402           	moveq #2,d2
     cee:	b484           	cmp.l d4,d2
     cf0:	6c18           	bge.s d0a <memset+0xca>
		*ptr++ = val;
     cf2:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
     cf6:	7c03           	moveq #3,d6
     cf8:	bc84           	cmp.l d4,d6
     cfa:	6c0e           	bge.s d0a <memset+0xca>
		*ptr++ = val;
     cfc:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
     d00:	7204           	moveq #4,d1
     d02:	b284           	cmp.l d4,d1
     d04:	6c04           	bge.s d0a <memset+0xca>
		*ptr++ = val;
     d06:	1545 0005      	move.b d5,5(a2)
}
     d0a:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
     d0e:	4e75           	rts

00000d10 <strlen>:
{
     d10:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
     d14:	7000           	moveq #0,d0
	while(*s++)
     d16:	4a10           	tst.b (a0)
     d18:	6708           	beq.s d22 <strlen+0x12>
		t++;
     d1a:	5280           	addq.l #1,d0
	while(*s++)
     d1c:	4a30 0800      	tst.b (0,a0,d0.l)
     d20:	66f8           	bne.s d1a <strlen+0xa>
}
     d22:	4e75           	rts

00000d24 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
     d24:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
     d28:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
     d2c:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
     d30:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
     d34:	d041           	add.w d1,d0
	swap	d0
     d36:	4840           	swap d0
	clrw	d0
     d38:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
     d3a:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
     d3e:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
     d42:	d081           	add.l d1,d0

	rts
     d44:	4e75           	rts

00000d46 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
     d46:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
     d48:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
     d4c:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
     d50:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
     d56:	6416           	bcc.s d6e <__udivsi3+0x28>
	movel	d0, d2
     d58:	2400           	move.l d0,d2
	clrw	d2
     d5a:	4242           	clr.w d2
	swap	d2
     d5c:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
     d5e:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
     d60:	3002           	move.w d2,d0
	swap	d0
     d62:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
     d64:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
     d68:	84c1           	divu.w d1,d2
	movew	d2, d0
     d6a:	3002           	move.w d2,d0
	jra	6f
     d6c:	6030           	bra.s d9e <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
     d6e:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
     d70:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
     d72:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
     d74:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
     d7a:	64f4           	bcc.s d70 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
     d7c:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
     d7e:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
     d84:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
     d86:	c2c0           	mulu.w d0,d1
	swap	d2
     d88:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
     d8a:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
     d8c:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
     d8e:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
     d90:	660a           	bne.s d9c <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
     d92:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
     d94:	6506           	bcs.s d9c <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
     d96:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
     d9a:	6302           	bls.s d9e <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
     d9c:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
     d9e:	241f           	move.l (sp)+,d2
	rts
     da0:	4e75           	rts

00000da2 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
     da2:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
     da4:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
     da6:	222f 000c      	move.l 12(sp),d1
	jpl	1f
     daa:	6a04           	bpl.s db0 <__divsi3+0xe>
	negl	d1
     dac:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
     dae:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
     db0:	202f 0008      	move.l 8(sp),d0
	jpl	2f
     db4:	6a04           	bpl.s dba <__divsi3+0x18>
	negl	d0
     db6:	4480           	neg.l d0
	negb	d2
     db8:	4402           	neg.b d2

2:	movel	d1, sp@-
     dba:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
     dbc:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
     dbe:	6186           	bsr.s d46 <__udivsi3>
	addql	IMM (8), sp
     dc0:	508f           	addq.l #8,sp

	tstb	d2
     dc2:	4a02           	tst.b d2
	jpl	3f
     dc4:	6a02           	bpl.s dc8 <__divsi3+0x26>
	negl	d0
     dc6:	4480           	neg.l d0

3:	movel	sp@+, d2
     dc8:	241f           	move.l (sp)+,d2
	rts
     dca:	4e75           	rts

00000dcc <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
     dcc:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
     dd0:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
     dd4:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
     dd6:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
     dd8:	61c8           	bsr.s da2 <__divsi3>
	addql	IMM (8), sp
     dda:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
     ddc:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
     de0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
     de2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
     de4:	6100 ff3e      	bsr.w d24 <__mulsi3>
	addql	IMM (8), sp
     de8:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
     dea:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
     dee:	9280           	sub.l d0,d1
	movel	d1, d0
     df0:	2001           	move.l d1,d0
	rts
     df2:	4e75           	rts

00000df4 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
     df4:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
     df8:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
     dfc:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
     dfe:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
     e00:	6100 ff44      	bsr.w d46 <__udivsi3>
	addql	IMM (8), sp
     e04:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
     e06:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
     e0a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
     e0c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
     e0e:	6100 ff14      	bsr.w d24 <__mulsi3>
	addql	IMM (8), sp
     e12:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
     e14:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
     e18:	9280           	sub.l d0,d1
	movel	d1, d0
     e1a:	2001           	move.l d1,d0
	rts
     e1c:	4e75           	rts

00000e1e <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
     e1e:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
     e20:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
     e24:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
     e28:	2c5f           	movea.l (sp)+,a6
    rts
     e2a:	4e75           	rts

00000e2c <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
     e2c:	16c0           	move.b d0,(a3)+
	rts
     e2e:	4e75           	rts

00000e30 <saveregs>:
	...

00000e6c <font2distance>:
     e6c:	0505           	btst d2,d5
     e6e:	0505           	btst d2,d5
     e70:	0505           	btst d2,d5
     e72:	0505           	btst d2,d5
     e74:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
     e76:	0505           	btst d2,d5
     e78:	0505           	btst d2,d5
     e7a:	0005 0505      	ori.b #5,d5
     e7e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
     e80:	0505           	btst d2,d5
     e82:	0505           	btst d2,d5
     e84:	0505           	btst d2,d5
     e86:	0505           	btst d2,d5
     e88:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
     e8a:	0505           	btst d2,d5
     e8c:	0505           	btst d2,d5
     e8e:	0505           	btst d2,d5
     e90:	0505           	btst d2,d5
     e92:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
     e94:	0500           	btst d2,d0
     e96:	0505           	btst d2,d5
     e98:	0505           	btst d2,d5
     e9a:	0505           	btst d2,d5
     e9c:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
     e9e:	0505           	btst d2,d5
     ea0:	0505           	btst d2,d5
     ea2:	0505           	btst d2,d5
     ea4:	0505           	btst d2,d5
     ea6:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
     ea8:	0505           	btst d2,d5
     eaa:	0505           	btst d2,d5
     eac:	0503           	btst d2,d3
     eae:	0505           	btst d2,d5
     eb0:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
     eb2:	0505           	btst d2,d5
     eb4:	0500           	btst d2,d0
     eb6:	0505           	btst d2,d5
     eb8:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
     ebc:	0505           	btst d2,d5
     ebe:	0503           	btst d2,d3
     ec0:	0205 0507      	andi.b #7,d5
     ec4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
     ec6:	0505           	btst d2,d5
     ec8:	0505           	btst d2,d5
     eca:	0505           	btst d2,d5
     ecc:	0505           	btst d2,d5
     ece:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     ed0:	0505           	btst d2,d5
     ed2:	0505           	btst d2,d5
     ed4:	0505           	btst d2,d5
     ed6:	0505           	btst d2,d5
     ed8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     eda:	0505           	btst d2,d5
     edc:	0505           	btst d2,d5
     ede:	0505           	btst d2,d5
     ee0:	0505           	btst d2,d5
     ee2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     ee4:	0505           	btst d2,d5
     ee6:	0505           	btst d2,d5
     ee8:	0505           	btst d2,d5
     eea:	0505           	btst d2,d5
     eec:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     eee:	0505           	btst d2,d5
     ef0:	0505           	btst d2,d5
     ef2:	0505           	btst d2,d5
     ef4:	0505           	btst d2,d5
     ef6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     ef8:	0505           	btst d2,d5
     efa:	0505           	btst d2,d5
     efc:	0505           	btst d2,d5
     efe:	0505           	btst d2,d5
     f00:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f02:	0505           	btst d2,d5
     f04:	0505           	btst d2,d5
     f06:	0505           	btst d2,d5
     f08:	0505           	btst d2,d5
     f0a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f0c:	0505           	btst d2,d5
     f0e:	0505           	btst d2,d5
     f10:	0505           	btst d2,d5
     f12:	0505           	btst d2,d5
     f14:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f16:	0505           	btst d2,d5
     f18:	0505           	btst d2,d5
     f1a:	0505           	btst d2,d5
     f1c:	0505           	btst d2,d5
     f1e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f20:	0505           	btst d2,d5
     f22:	0505           	btst d2,d5
     f24:	0505           	btst d2,d5
     f26:	0505           	btst d2,d5
     f28:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f2a:	0505           	btst d2,d5
     f2c:	0505           	btst d2,d5
     f2e:	0505           	btst d2,d5
     f30:	0505           	btst d2,d5
     f32:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f34:	0505           	btst d2,d5
     f36:	0505           	btst d2,d5
     f38:	0505           	btst d2,d5
     f3a:	0505           	btst d2,d5
     f3c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f3e:	0505           	btst d2,d5
     f40:	0505           	btst d2,d5
     f42:	0505           	btst d2,d5
     f44:	0505           	btst d2,d5
     f46:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f48:	0505           	btst d2,d5
     f4a:	0505           	btst d2,d5
     f4c:	0505           	btst d2,d5
     f4e:	0505           	btst d2,d5
     f50:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f52:	0505           	btst d2,d5
     f54:	0505           	btst d2,d5
     f56:	0505           	btst d2,d5
     f58:	0505           	btst d2,d5
     f5a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f5c:	0505           	btst d2,d5
     f5e:	0505           	btst d2,d5
     f60:	0505           	btst d2,d5
     f62:	0505           	btst d2,d5
     f64:	0505           	btst d2,d5

00000f66 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
     f66:	16c0           	move.b d0,(a3)+
  RTS
     f68:	4e75           	rts

00000f6a <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
     f6a:	48f9 7fff 0000 	movem.l d0-a6,e30 <saveregs>
     f70:	0e30 
  lea 0xdff000,a5
     f72:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xdd7415>,a5
  move.l sp@(4),a0  //Fontlocation
     f78:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
     f7c:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
     f80:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
     f84:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
     f86:	082d 0006 0002 	btst #6,2(a5)

00000f8c <st2wblit>:
st2wblit:
	btst	#6,2(a5)
     f8c:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
     f92:	66f8           	bne.s f8c <st2wblit>

00000f94 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
     f94:	7019           	moveq #25,d0
	sub.l d5,d5      
     f96:	9a85           	sub.l d5,d5

00000f98 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
     f98:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
     f9a:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
     f9c:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
     fa0:	9dce           	suba.l a6,a6
	move.l d2, a6
     fa2:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
     fa4:	ddfc 0000 0e6c 	adda.l #3692,a6

	LSL  	#4,d2 	    //Fetch next char
     faa:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
     fac:	2842           	movea.l d2,a4


	move.l  #0,d4
     fae:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
     fb0:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
     fb2:	3814           	move.w (a4),d4
	swap	d4
     fb4:	4844           	swap d4
	lsr.l	d5, d4
     fb6:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
     fb8:	8993           	or.l d4,(a3)
	clr.l	d4
     fba:	4284           	clr.l d4
	move.w  2(a4), d4
     fbc:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
     fc0:	4844           	swap d4
	lsr.l	d5, d4
     fc2:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
     fc4:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
     fc8:	4284           	clr.l d4
	move.w  4(a4), d4
     fca:	382c 0004      	move.w 4(a4),d4
	swap	d4
     fce:	4844           	swap d4
	lsr.l	d5, d4
     fd0:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
     fd2:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
     fd6:	4284           	clr.l d4
	move.w  6(a4), d4
     fd8:	382c 0006      	move.w 6(a4),d4
	swap	d4
     fdc:	4844           	swap d4
	lsr.l	d5, d4
     fde:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
     fe0:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
     fe4:	4284           	clr.l d4
	move.w  8(a4), d4
     fe6:	382c 0008      	move.w 8(a4),d4
	swap	d4
     fea:	4844           	swap d4
	lsr.l	d5, d4
     fec:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
     fee:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
     ff2:	4284           	clr.l d4
	move.w  10(a4), d4
     ff4:	382c 000a      	move.w 10(a4),d4
	swap	d4
     ff8:	4844           	swap d4
	lsr.l	d5, d4
     ffa:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
     ffc:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    1000:	4284           	clr.l d4
	move.w  12(a4), d4
    1002:	382c 000c      	move.w 12(a4),d4
	swap	d4
    1006:	4844           	swap d4
	lsr.l	d5, d4
    1008:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    100a:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    100e:	4284           	clr.l d4
	move.w  14(a4), d4
    1010:	382c 000e      	move.w 14(a4),d4
	swap	d4
    1014:	4844           	swap d4
	lsr.l	d5, d4
    1016:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    1018:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    101c:	4284           	clr.l d4

	add.b   (a6), d5
    101e:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    1020:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    1024:	6500 0006      	bcs.w 102c <noadditionalchar>
	addq.w  #1, a3
    1028:	524b           	addq.w #1,a3
	sub.w   #8,d5
    102a:	5145           	subq.w #8,d5

0000102c <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    102c:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    102e:	51c8 ff68      	dbf d0,f98 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    1032:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    1036:	51cb ff5c      	dbf d3,f94 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    103a:	4cfa 7fff fdf2 	movem.l e30 <saveregs>(pc),d0-a6

	RTS
    1040:	4e75           	rts
