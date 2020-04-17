
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
      12:	23ce 0001 3d88 	move.l a6,13d88 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,13d5e <hw>
      1e:	0001 3d5e 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0001 15ed 	lea 115ed <incbin_startimage_end+0x75>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0001 3d5a 	move.l d0,13d5a <GfxBase>
	if (!GfxBase)
      34:	6700 0532      	beq.w 568 <main+0x562>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0001 3d88 	movea.l 13d88 <SysBase>,a6
      3e:	43f9 0001 15fe 	lea 115fe <incbin_startimage_end+0x86>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0001 3d84 	move.l d0,13d84 <DOSBase>
	if (!DOSBase)
      50:	6700 03de      	beq.w 430 <main+0x42a>
		Exit(0);

	//KPrintF("Hello debugger from Amiga!\n");
	Write(Output(), "Hello console!\n", 15);
      54:	2c40           	movea.l d0,a6
      56:	4eae ffc4      	jsr -60(a6)
      5a:	2c79 0001 3d84 	movea.l 13d84 <DOSBase>,a6
      60:	2200           	move.l d0,d1
      62:	243c 0001 160a 	move.l #71178,d2
      68:	760f           	moveq #15,d3
      6a:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      6e:	2c79 0001 3d84 	movea.l 13d84 <DOSBase>,a6
      74:	7232           	moveq #50,d1
      76:	4eae ff3a      	jsr -198(a6)
  Zoom_InitRun();
      7a:	4eb9 0000 0a6a 	jsr a6a <Zoom_InitRun>
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
      80:	2c79 0001 3d5a 	movea.l 13d5a <GfxBase>,a6
      86:	23ee 0022 0001 	move.l 34(a6),13d48 <ActiView>
      8c:	3d48 
	OwnBlitter();
      8e:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
      92:	2c79 0001 3d5a 	movea.l 13d5a <GfxBase>,a6
      98:	4eae ff1c      	jsr -228(a6)
	Disable();
      9c:	2c79 0001 3d88 	movea.l 13d88 <SysBase>,a6
      a2:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
      a6:	2479 0001 3d5e 	movea.l 13d5e <hw>,a2
      ac:	302a 0010      	move.w 16(a2),d0
      b0:	33c0 0001 3d4c 	move.w d0,13d4c <SystemADKCON>
	SystemInts=hw->intenar;
      b6:	302a 001c      	move.w 28(a2),d0
      ba:	33c0 0001 3d50 	move.w d0,13d50 <SystemInts>
	SystemDMA=hw->dmaconr;
      c0:	302a 0002      	move.w 2(a2),d0
      c4:	33c0 0001 3d4e 	move.w d0,13d4e <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
      ca:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
      d0:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
      d6:	47f9 0000 0bea 	lea bea <WaitVbl>,a3
      dc:	4e93           	jsr (a3)
	WaitVbl();
      de:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
      e0:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
      e6:	2c79 0001 3d5a 	movea.l 13d5a <GfxBase>,a6
      ec:	93c9           	suba.l a1,a1
      ee:	4eae ff22      	jsr -222(a6)
	WaitTOF();
      f2:	2c79 0001 3d5a 	movea.l 13d5a <GfxBase>,a6
      f8:	4eae fef2      	jsr -270(a6)
	WaitTOF();
      fc:	2c79 0001 3d5a 	movea.l 13d5a <GfxBase>,a6
     102:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     106:	4e93           	jsr (a3)
	WaitVbl();
     108:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     10a:	3f7c 4e7a 001e 	move.w #20090,30(sp)
     110:	3f7c 0801 0020 	move.w #2049,32(sp)
     116:	3f7c 4e73 0022 	move.w #20083,34(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     11c:	2c79 0001 3d88 	movea.l 13d88 <SysBase>,a6
     122:	082e 0000 0129 	btst #0,297(a6)
     128:	6700 03ec      	beq.w 516 <main+0x510>
		vbr = (APTR)Supervisor((void*)getvbr);
     12c:	7e1e           	moveq #30,d7
     12e:	de8f           	add.l sp,d7
     130:	cf8d           	exg d7,a5
     132:	4eae ffe2      	jsr -30(a6)
     136:	cf8d           	exg d7,a5

	VBR=GetVBR();
     138:	23c0 0001 3d52 	move.l d0,13d52 <VBR.lto_priv.1>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     13e:	2079 0001 3d52 	movea.l 13d52 <VBR.lto_priv.1>,a0
     144:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
     148:	23c2 0001 3d56 	move.l d2,13d56 <SystemIrq>
	//warpmode(1);
	// TODO: precalc stuff here
	//warpmode(0);

	TakeSystem();
	WaitVbl();
     14e:	4e93           	jsr (a3)
	// DEMO - increment frameCounter
	frameCounter++;
}

void RunDemo() {
  hw->dmacon = 0b1001001111100000;
     150:	2479 0001 3d5e 	movea.l 13d5e <hw>,a2
     156:	357c 93e0 0096 	move.w #-27680,150(a2)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     15c:	2079 0001 3d52 	movea.l 13d52 <VBR.lto_priv.1>,a0
     162:	217c 0000 0bc0 	move.l #3008,108(a0)
     168:	006c 
	SetInterruptHandler((APTR)interruptHandler);
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     16a:	357c c020 009a 	move.w #-16352,154(a2)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     170:	357c 0020 009c 	move.w #32,156(a2)
  for( int i=0;i<size;i++) 
    *destination++ = *source++;  
}

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     176:	3039 00df f016 	move.w dff016 <gcc8_c_support.c.e9862530+0xdd716c>,d0
  //PrepareDisplay();

	while(!MouseRight()) {
     17c:	0800 000a      	btst #10,d0
     180:	6700 018c      	beq.w 30e <main+0x308>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     184:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd715a>,d0
     18a:	2f40 001e      	move.l d0,30(sp)
		vpos&=0x1ff00;
     18e:	202f 001e      	move.l 30(sp),d0
     192:	0280 0001 ff00 	andi.l #130816,d0
     198:	2f40 001e      	move.l d0,30(sp)
		if (vpos!=(311<<8))
     19c:	202f 001e      	move.l 30(sp),d0
     1a0:	0c80 0001 3700 	cmpi.l #79616,d0
     1a6:	67dc           	beq.s 184 <main+0x17e>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     1a8:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd715a>,d0
     1ae:	2f40 001a      	move.l d0,26(sp)
		vpos&=0x1ff00;
     1b2:	202f 001a      	move.l 26(sp),d0
     1b6:	0280 0001 ff00 	andi.l #130816,d0
     1bc:	2f40 001a      	move.l d0,26(sp)
		if (vpos==(311<<8))
     1c0:	202f 001a      	move.l 26(sp),d0
     1c4:	0c80 0001 3700 	cmpi.l #79616,d0
     1ca:	66dc           	bne.s 1a8 <main+0x1a2>
  }
  //ZoomHorizontal = 10;
}

void Zoom_SetBplPointers() {
  ULONG plane2set = DrawBuffer;
     1cc:	2279 0001 3d6e 	movea.l 13d6e <DrawBuffer>,a1
  UWORD *posofcopper = (UWORD *)DrawCopper + ZMCOPBPL1HIGH;
     1d2:	2079 0001 3d6a 	movea.l 13d6a <DrawCopper>,a0
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    UWORD highword = (ULONG)plane2set >> 16;
     1d8:	2009           	move.l a1,d0
     1da:	4240           	clr.w d0
     1dc:	4840           	swap d0
     1de:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     1e2:	3149 0076      	move.w a1,118(a0)
    *posofcopper = highword;
    posofcopper += 2;
    *posofcopper = lowword;
    posofcopper += 2;
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     1e6:	7030           	moveq #48,d0
     1e8:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
     1ea:	2200           	move.l d0,d1
     1ec:	4241           	clr.w d1
     1ee:	4841           	swap d1
     1f0:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     1f4:	3140 007e      	move.w d0,126(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     1f8:	7060           	moveq #96,d0
     1fa:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
     1fc:	2200           	move.l d0,d1
     1fe:	4241           	clr.w d1
     200:	4841           	swap d1
     202:	3141 0082      	move.w d1,130(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     206:	3140 0086      	move.w d0,134(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     20a:	2009           	move.l a1,d0
     20c:	0680 0000 0090 	addi.l #144,d0
    UWORD highword = (ULONG)plane2set >> 16;
     212:	2200           	move.l d0,d1
     214:	4241           	clr.w d1
     216:	4841           	swap d1
     218:	3141 008a      	move.w d1,138(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     21c:	3140 008e      	move.w d0,142(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     220:	2009           	move.l a1,d0
     222:	0680 0000 00c0 	addi.l #192,d0
    UWORD highword = (ULONG)plane2set >> 16;
     228:	2200           	move.l d0,d1
     22a:	4241           	clr.w d1
     22c:	4841           	swap d1
     22e:	3141 0092      	move.w d1,146(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     232:	3140 0096      	move.w d0,150(a0)
  }
  
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
     236:	23f9 0001 3d66 	move.l 13d66 <ViewBuffer>,13d6e <DrawBuffer>
     23c:	0001 3d6e 
  ViewBuffer = (ULONG *) tmp;
     240:	23c9 0001 3d66 	move.l a1,13d66 <ViewBuffer>
  DrawCopper = ViewCopper;
     246:	2039 0001 3d62 	move.l 13d62 <ViewCopper>,d0
     24c:	23c0 0001 3d6a 	move.l d0,13d6a <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     252:	23c8 0001 3d62 	move.l a0,13d62 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     258:	2548 0080      	move.l a0,128(a2)
  hw->copjmp1 = tmp;
     25c:	3548 0088      	move.w a0,136(a2)
short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     260:	1239 00bf e001 	move.b bfe001 <gcc8_c_support.c.e9862530+0xbd6157>,d1

void RunFrame() {
  Zoom_SetBplPointers();
  SwapCl();
  //TestZoomSpeed();
  while( !MouseLeft()) {}
     266:	0801 0006      	btst #6,d1
     26a:	66f4           	bne.s 260 <main+0x25a>
     26c:	1239 00bf e001 	move.b bfe001 <gcc8_c_support.c.e9862530+0xbd6157>,d1
  while( MouseLeft()) {}
     272:	0801 0006      	btst #6,d1
     276:	67f4           	beq.s 26c <main+0x266>
           0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000,
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {
  UWORD *values4shift = Values4Shift+levelofshrink*30;
     278:	3239 0001 3d82 	move.w 13d82 <Zoom_LevelOf102Zoom>,d1
     27e:	c2fc 003c      	mulu.w #60,d1
     282:	2041           	movea.l d1,a0
     284:	d1fc 0001 361c 	adda.l #79388,a0
  copperlist+=3+73*2;
     28a:	2240           	movea.l d0,a1
     28c:	43e9 012a      	lea 298(a1),a1
  for(int i = 0; i<30;i++) {
     290:	2200           	move.l d0,d1
     292:	0681 0000 01a2 	addi.l #418,d1
  UWORD *values4shift = Values4Shift+levelofshrink*30;
     298:	2c48           	movea.l a0,a6
    *copperlist = *values4shift++;
     29a:	329e           	move.w (a6)+,(a1)
    copperlist += 2;
     29c:	5889           	addq.l #4,a1
  for(int i = 0; i<30;i++) {
     29e:	b3c1           	cmpa.l d1,a1
     2a0:	66f8           	bne.s 29a <main+0x294>
  }
  values4shift -= 30;
  copperlist += 10;
     2a2:	2240           	movea.l d0,a1
     2a4:	43e9 01b6      	lea 438(a1),a1
  for(int i = 0; i<30;i++) {
     2a8:	2200           	move.l d0,d1
     2aa:	0681 0000 022e 	addi.l #558,d1
  values4shift -= 30;
     2b0:	2c48           	movea.l a0,a6
    *copperlist = *values4shift++;
     2b2:	329e           	move.w (a6)+,(a1)
    copperlist += 2;
     2b4:	5889           	addq.l #4,a1
  for(int i = 0; i<30;i++) {
     2b6:	b289           	cmp.l a1,d1
     2b8:	66f8           	bne.s 2b2 <main+0x2ac>
  }
  values4shift -= 30;
  copperlist += 6;
     2ba:	2240           	movea.l d0,a1
     2bc:	43e9 023a      	lea 570(a1),a1
  
  for(int i = 0; i<30;i++) {
     2c0:	2200           	move.l d0,d1
     2c2:	0681 0000 02b2 	addi.l #690,d1
  values4shift -= 30;
     2c8:	2c48           	movea.l a0,a6
    *copperlist = *values4shift++;
     2ca:	329e           	move.w (a6)+,(a1)
    copperlist += 2;
     2cc:	5889           	addq.l #4,a1
  for(int i = 0; i<30;i++) {
     2ce:	b289           	cmp.l a1,d1
     2d0:	66f8           	bne.s 2ca <main+0x2c4>
  }
  values4shift -= 30;
  copperlist += 6;
     2d2:	2240           	movea.l d0,a1
     2d4:	43e9 02be      	lea 702(a1),a1
  for(int i = 0; i<30;i++) {
     2d8:	0680 0000 0336 	addi.l #822,d0
    *copperlist = *values4shift++;
     2de:	3298           	move.w (a0)+,(a1)
    copperlist += 2;
     2e0:	5889           	addq.l #4,a1
  for(int i = 0; i<30;i++) {
     2e2:	b089           	cmp.l a1,d0
     2e4:	66f8           	bne.s 2de <main+0x2d8>
  }
  UWORD *bp = 0x200;
  *bp = 0;
     2e6:	4278 0200      	clr.w 200 <main+0x1fa>
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
  //Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer - 2, (UWORD *)DrawBuffer - 2, Zoom_LevelOfZoom, 5 );
  if( Zoom_LevelOf102Zoom == 15)
     2ea:	3039 0001 3d82 	move.w 13d82 <Zoom_LevelOf102Zoom>,d0
     2f0:	0c40 000f      	cmpi.w #15,d0
     2f4:	6700 00fc      	beq.w 3f2 <main+0x3ec>
    Zoom_LevelOf102Zoom = 0;
  else
    Zoom_LevelOf102Zoom++;
     2f8:	5240           	addq.w #1,d0
     2fa:	33c0 0001 3d82 	move.w d0,13d82 <Zoom_LevelOf102Zoom>
     300:	3039 00df f016 	move.w dff016 <gcc8_c_support.c.e9862530+0xdd716c>,d0
	while(!MouseRight()) {
     306:	0800 000a      	btst #10,d0
     30a:	6600 fe78      	bne.w 184 <main+0x17e>
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     30e:	2079 0001 3d52 	movea.l 13d52 <VBR.lto_priv.1>,a0
     314:	217c 0000 0bc0 	move.l #3008,108(a0)
     31a:	006c 
	WaitVbl();
     31c:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     31e:	302a 0002      	move.w 2(a2),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     322:	302a 0002      	move.w 2(a2),d0
     326:	0800 000e      	btst #14,d0
     32a:	66f6           	bne.s 322 <main+0x31c>
	hw->intena=0x7fff;//disable all interrupts
     32c:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     332:	357c 7fff 009c 	move.w #32767,156(a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     338:	357c 7fff 0096 	move.w #32767,150(a2)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     33e:	2079 0001 3d52 	movea.l 13d52 <VBR.lto_priv.1>,a0
     344:	2142 006c      	move.l d2,108(a0)
	hw->cop1lc=(ULONG)GfxBase->copinit;
     348:	2c79 0001 3d5a 	movea.l 13d5a <GfxBase>,a6
     34e:	256e 0026 0080 	move.l 38(a6),128(a2)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     354:	256e 0032 0084 	move.l 50(a6),132(a2)
	hw->copjmp1=0x7fff; //start coppper
     35a:	357c 7fff 0088 	move.w #32767,136(a2)
	hw->intena=SystemInts|0x8000;
     360:	3039 0001 3d50 	move.w 13d50 <SystemInts>,d0
     366:	0040 8000      	ori.w #-32768,d0
     36a:	3540 009a      	move.w d0,154(a2)
	hw->dmacon=SystemDMA|0x8000;
     36e:	3039 0001 3d4e 	move.w 13d4e <SystemDMA>,d0
     374:	0040 8000      	ori.w #-32768,d0
     378:	3540 0096      	move.w d0,150(a2)
	hw->adkcon=SystemADKCON|0x8000;
     37c:	3039 0001 3d4c 	move.w 13d4c <SystemADKCON>,d0
     382:	0040 8000      	ori.w #-32768,d0
     386:	3540 009e      	move.w d0,158(a2)
	LoadView(ActiView);
     38a:	2279 0001 3d48 	movea.l 13d48 <ActiView>,a1
     390:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     394:	2c79 0001 3d5a 	movea.l 13d5a <GfxBase>,a6
     39a:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     39e:	2c79 0001 3d5a 	movea.l 13d5a <GfxBase>,a6
     3a4:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     3a8:	2c79 0001 3d5a 	movea.l 13d5a <GfxBase>,a6
     3ae:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     3b2:	2c79 0001 3d5a 	movea.l 13d5a <GfxBase>,a6
     3b8:	4eae fe32      	jsr -462(a6)
	Enable();
     3bc:	2c79 0001 3d88 	movea.l 13d88 <SysBase>,a6
     3c2:	4eae ff82      	jsr -126(a6)

	RunDemo();	// END

	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     3c6:	2c79 0001 3d88 	movea.l 13d88 <SysBase>,a6
     3cc:	2279 0001 3d84 	movea.l 13d84 <DOSBase>,a1
     3d2:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     3d6:	2c79 0001 3d88 	movea.l 13d88 <SysBase>,a6
     3dc:	2279 0001 3d5a 	movea.l 13d5a <GfxBase>,a1
     3e2:	4eae fe62      	jsr -414(a6)
}
     3e6:	7000           	moveq #0,d0
     3e8:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
     3ec:	4fef 000c      	lea 12(sp),sp
     3f0:	4e75           	rts
    Zoom_LevelOf102Zoom = 0;
     3f2:	4279 0001 3d82 	clr.w 13d82 <Zoom_LevelOf102Zoom>
     3f8:	3039 00df f016 	move.w dff016 <gcc8_c_support.c.e9862530+0xdd716c>,d0
	while(!MouseRight()) {
     3fe:	0800 000a      	btst #10,d0
     402:	6700 ff0a      	beq.w 30e <main+0x308>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     406:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd715a>,d0
     40c:	2f40 001e      	move.l d0,30(sp)
		vpos&=0x1ff00;
     410:	202f 001e      	move.l 30(sp),d0
     414:	0280 0001 ff00 	andi.l #130816,d0
     41a:	2f40 001e      	move.l d0,30(sp)
		if (vpos!=(311<<8))
     41e:	202f 001e      	move.l 30(sp),d0
     422:	0c80 0001 3700 	cmpi.l #79616,d0
     428:	6700 fd5a      	beq.w 184 <main+0x17e>
     42c:	6000 fd7a      	bra.w 1a8 <main+0x1a2>
		Exit(0);
     430:	9dce           	suba.l a6,a6
     432:	7200           	moveq #0,d1
     434:	4eae ff70      	jsr -144(a6)
     438:	2039 0001 3d84 	move.l 13d84 <DOSBase>,d0
	Write(Output(), "Hello console!\n", 15);
     43e:	2c40           	movea.l d0,a6
     440:	4eae ffc4      	jsr -60(a6)
     444:	2c79 0001 3d84 	movea.l 13d84 <DOSBase>,a6
     44a:	2200           	move.l d0,d1
     44c:	243c 0001 160a 	move.l #71178,d2
     452:	760f           	moveq #15,d3
     454:	4eae ffd0      	jsr -48(a6)
	Delay(50);
     458:	2c79 0001 3d84 	movea.l 13d84 <DOSBase>,a6
     45e:	7232           	moveq #50,d1
     460:	4eae ff3a      	jsr -198(a6)
  Zoom_InitRun();
     464:	4eb9 0000 0a6a 	jsr a6a <Zoom_InitRun>
	ActiView=GfxBase->ActiView; //store current view
     46a:	2c79 0001 3d5a 	movea.l 13d5a <GfxBase>,a6
     470:	23ee 0022 0001 	move.l 34(a6),13d48 <ActiView>
     476:	3d48 
	OwnBlitter();
     478:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     47c:	2c79 0001 3d5a 	movea.l 13d5a <GfxBase>,a6
     482:	4eae ff1c      	jsr -228(a6)
	Disable();
     486:	2c79 0001 3d88 	movea.l 13d88 <SysBase>,a6
     48c:	4eae ff88      	jsr -120(a6)
	SystemADKCON=hw->adkconr;
     490:	2479 0001 3d5e 	movea.l 13d5e <hw>,a2
     496:	302a 0010      	move.w 16(a2),d0
     49a:	33c0 0001 3d4c 	move.w d0,13d4c <SystemADKCON>
	SystemInts=hw->intenar;
     4a0:	302a 001c      	move.w 28(a2),d0
     4a4:	33c0 0001 3d50 	move.w d0,13d50 <SystemInts>
	SystemDMA=hw->dmaconr;
     4aa:	302a 0002      	move.w 2(a2),d0
     4ae:	33c0 0001 3d4e 	move.w d0,13d4e <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     4b4:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     4ba:	357c 7fff 009c 	move.w #32767,156(a2)
	WaitVbl();
     4c0:	47f9 0000 0bea 	lea bea <WaitVbl>,a3
     4c6:	4e93           	jsr (a3)
	WaitVbl();
     4c8:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
     4ca:	357c 7fff 0096 	move.w #32767,150(a2)
	LoadView(0);
     4d0:	2c79 0001 3d5a 	movea.l 13d5a <GfxBase>,a6
     4d6:	93c9           	suba.l a1,a1
     4d8:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     4dc:	2c79 0001 3d5a 	movea.l 13d5a <GfxBase>,a6
     4e2:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     4e6:	2c79 0001 3d5a 	movea.l 13d5a <GfxBase>,a6
     4ec:	4eae fef2      	jsr -270(a6)
	WaitVbl();
     4f0:	4e93           	jsr (a3)
	WaitVbl();
     4f2:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     4f4:	3f7c 4e7a 001e 	move.w #20090,30(sp)
     4fa:	3f7c 0801 0020 	move.w #2049,32(sp)
     500:	3f7c 4e73 0022 	move.w #20083,34(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     506:	2c79 0001 3d88 	movea.l 13d88 <SysBase>,a6
     50c:	082e 0000 0129 	btst #0,297(a6)
     512:	6600 fc18      	bne.w 12c <main+0x126>
	APTR vbr = 0;
     516:	7000           	moveq #0,d0
	VBR=GetVBR();
     518:	23c0 0001 3d52 	move.l d0,13d52 <VBR.lto_priv.1>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     51e:	2079 0001 3d52 	movea.l 13d52 <VBR.lto_priv.1>,a0
     524:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
     528:	23c2 0001 3d56 	move.l d2,13d56 <SystemIrq>
	WaitVbl();
     52e:	4e93           	jsr (a3)
  hw->dmacon = 0b1001001111100000;
     530:	2479 0001 3d5e 	movea.l 13d5e <hw>,a2
     536:	357c 93e0 0096 	move.w #-27680,150(a2)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     53c:	2079 0001 3d52 	movea.l 13d52 <VBR.lto_priv.1>,a0
     542:	217c 0000 0bc0 	move.l #3008,108(a0)
     548:	006c 
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     54a:	357c c020 009a 	move.w #-16352,154(a2)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     550:	357c 0020 009c 	move.w #32,156(a2)
     556:	3039 00df f016 	move.w dff016 <gcc8_c_support.c.e9862530+0xdd716c>,d0
	while(!MouseRight()) {
     55c:	0800 000a      	btst #10,d0
     560:	6600 fc22      	bne.w 184 <main+0x17e>
     564:	6000 fda8      	bra.w 30e <main+0x308>
		Exit(0);
     568:	2c79 0001 3d84 	movea.l 13d84 <DOSBase>,a6
     56e:	7200           	moveq #0,d1
     570:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     574:	2c79 0001 3d88 	movea.l 13d88 <SysBase>,a6
     57a:	43f9 0001 15fe 	lea 115fe <incbin_startimage_end+0x86>,a1
     580:	7000           	moveq #0,d0
     582:	4eae fdd8      	jsr -552(a6)
     586:	23c0 0001 3d84 	move.l d0,13d84 <DOSBase>
	if (!DOSBase)
     58c:	6600 fac6      	bne.w 54 <main+0x4e>
     590:	6000 fe9e      	bra.w 430 <main+0x42a>

00000594 <ClbuildZoom>:
ULONG * ClbuildZoom() {
     594:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
     598:	2c79 0001 3d88 	movea.l 13d88 <SysBase>,a6
     59e:	203c 0000 591c 	move.l #22812,d0
     5a4:	7202           	moveq #2,d1
     5a6:	4eae ff3a      	jsr -198(a6)
     5aa:	2440           	movea.l d0,a2
  if( retval == 0) {
     5ac:	4a80           	tst.l d0
     5ae:	6700 01ee      	beq.w 79e <ClbuildZoom+0x20a>
    *cl++ = *clpartinstruction++;
     5b2:	24b9 0001 3ce4 	move.l 13ce4 <ClsSprites>,(a2)
     5b8:	2579 0001 3ce8 	move.l 13ce8 <ClsSprites+0x4>,4(a2)
     5be:	0004 
     5c0:	2579 0001 3cec 	move.l 13cec <ClsSprites+0x8>,8(a2)
     5c6:	0008 
     5c8:	2579 0001 3cf0 	move.l 13cf0 <ClsSprites+0xc>,12(a2)
     5ce:	000c 
     5d0:	2579 0001 3cf4 	move.l 13cf4 <ClsSprites+0x10>,16(a2)
     5d6:	0010 
     5d8:	2579 0001 3cf8 	move.l 13cf8 <ClsSprites+0x14>,20(a2)
     5de:	0014 
     5e0:	2579 0001 3cfc 	move.l 13cfc <ClsSprites+0x18>,24(a2)
     5e6:	0018 
     5e8:	2579 0001 3d00 	move.l 13d00 <ClsSprites+0x1c>,28(a2)
     5ee:	001c 
     5f0:	2579 0001 3d04 	move.l 13d04 <ClsSprites+0x20>,32(a2)
     5f6:	0020 
     5f8:	2579 0001 3d08 	move.l 13d08 <ClsSprites+0x24>,36(a2)
     5fe:	0024 
     600:	2579 0001 3d0c 	move.l 13d0c <ClsSprites+0x28>,40(a2)
     606:	0028 
     608:	2579 0001 3d10 	move.l 13d10 <ClsSprites+0x2c>,44(a2)
     60e:	002c 
     610:	2579 0001 3d14 	move.l 13d14 <ClsSprites+0x30>,48(a2)
     616:	0030 
     618:	2579 0001 3d18 	move.l 13d18 <ClsSprites+0x34>,52(a2)
     61e:	0034 
     620:	2579 0001 3d1c 	move.l 13d1c <ClsSprites+0x38>,56(a2)
     626:	0038 
     628:	2579 0001 3d20 	move.l 13d20 <ClsSprites+0x3c>,60(a2)
     62e:	003c 
    *cl++ = *clpartinstruction++;
     630:	2579 0001 3cb4 	move.l 13cb4 <ClScreen>,64(a2)
     636:	0040 
     638:	2579 0001 3cb8 	move.l 13cb8 <ClScreen+0x4>,68(a2)
     63e:	0044 
     640:	2579 0001 3cbc 	move.l 13cbc <ClScreen+0x8>,72(a2)
     646:	0048 
     648:	2579 0001 3cc0 	move.l 13cc0 <ClScreen+0xc>,76(a2)
     64e:	004c 
     650:	2579 0001 3cc4 	move.l 13cc4 <ClScreen+0x10>,80(a2)
     656:	0050 
     658:	2579 0001 3cc8 	move.l 13cc8 <ClScreen+0x14>,84(a2)
     65e:	0054 
     660:	2579 0001 3ccc 	move.l 13ccc <ClScreen+0x18>,88(a2)
     666:	0058 
     668:	2579 0001 3cd0 	move.l 13cd0 <ClScreen+0x1c>,92(a2)
     66e:	005c 
     670:	2579 0001 3cd4 	move.l 13cd4 <ClScreen+0x20>,96(a2)
     676:	0060 
     678:	2579 0001 3cd8 	move.l 13cd8 <ClScreen+0x24>,100(a2)
     67e:	0064 
     680:	2579 0001 3cdc 	move.l 13cdc <ClScreen+0x28>,104(a2)
     686:	0068 
     688:	2579 0001 3ce0 	move.l 13ce0 <ClScreen+0x2c>,108(a2)
     68e:	006c 
  *cl++ = 0x00e00000;
     690:	257c 00e0 0000 	move.l #14680064,112(a2)
     696:	0070 
  *cl++ = 0x00e20000;
     698:	257c 00e2 0000 	move.l #14811136,116(a2)
     69e:	0074 
  *cl++ = 0x00e40000;
     6a0:	257c 00e4 0000 	move.l #14942208,120(a2)
     6a6:	0078 
  *cl++ = 0x00e60000;
     6a8:	257c 00e6 0000 	move.l #15073280,124(a2)
     6ae:	007c 
  *cl++ = 0x00e80000;
     6b0:	257c 00e8 0000 	move.l #15204352,128(a2)
     6b6:	0080 
  *cl++ = 0x00ea0000;
     6b8:	257c 00ea 0000 	move.l #15335424,132(a2)
     6be:	0084 
  *cl++ = 0x00ec0000;
     6c0:	257c 00ec 0000 	move.l #15466496,136(a2)
     6c6:	0088 
  *cl++ = 0x00ee0000;
     6c8:	257c 00ee 0000 	move.l #15597568,140(a2)
     6ce:	008c 
  *cl++ = 0x00f00000;
     6d0:	257c 00f0 0000 	move.l #15728640,144(a2)
     6d6:	0090 
  *cl++ = 0x00f20000;
     6d8:	257c 00f2 0000 	move.l #15859712,148(a2)
     6de:	0094 
  for(int i=0; i<32;i++)
     6e0:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
     6e4:	41f9 0001 3c34 	lea 13c34 <ClColor>,a0
    *cl++ = *clpartinstruction++;
     6ea:	22d8           	move.l (a0)+,(a1)+
  for(int i=0; i<32;i++)
     6ec:	b1fc 0001 3cb4 	cmpa.l #81076,a0
     6f2:	66f6           	bne.s 6ea <ClbuildZoom+0x156>
  ULONG cop2 = cl+3;
     6f4:	200a           	move.l a2,d0
     6f6:	0680 0000 0124 	addi.l #292,d0
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
     6fc:	2200           	move.l d0,d1
     6fe:	4241           	clr.w d1
     700:	4841           	swap d1
     702:	0681 0084 0000 	addi.l #8650752,d1
     708:	2541 0118      	move.l d1,280(a2)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
     70c:	2200           	move.l d0,d1
     70e:	0281 0000 ffff 	andi.l #65535,d1
     714:	0681 0086 0000 	addi.l #8781824,d1
     71a:	2541 011c      	move.l d1,284(a2)
  *cl++ = 0x2c01ff00;
     71e:	257c 2c01 ff00 	move.l #738328320,288(a2)
     724:	0120 
  ULONG cop2br1 = cop2 + ( (8+27)<<2);
     726:	2200           	move.l d0,d1
     728:	0681 0000 008c 	addi.l #140,d1
  clpartinstruction[6+27] = 0x00840000 + ( cop2br1 >> 16);
     72e:	2401           	move.l d1,d2
     730:	4242           	clr.w d2
     732:	4842           	swap d2
     734:	0682 0084 0000 	addi.l #8650752,d2
     73a:	23c2 0001 3a9c 	move.l d2,13a9c <Cl102ZoomRepeat+0x84>
  clpartinstruction[7+27] = 0x00860000 + ( cop2br1 & 0xffff);
     740:	0281 0000 ffff 	andi.l #65535,d1
     746:	0681 0086 0000 	addi.l #8781824,d1
     74c:	23c1 0001 3aa0 	move.l d1,13aa0 <Cl102ZoomRepeat+0x88>
  clpartinstruction[17+27+27+27+1] = 0x00840000 + ( cop2br2 >> 16);
     752:	220a           	move.l a2,d1
     754:	0681 0000 02b8 	addi.l #696,d1
     75a:	2401           	move.l d1,d2
     75c:	4242           	clr.w d2
     75e:	4842           	swap d2
     760:	0682 0084 0000 	addi.l #8650752,d2
     766:	23c2 0001 3ba4 	move.l d2,13ba4 <Cl102ZoomRepeat+0x18c>
  clpartinstruction[18+27+27+27+1] = 0x00860000 + ( cop2br2 & 0xffff);
     76c:	0281 0000 ffff 	andi.l #65535,d1
     772:	0681 0086 0000 	addi.l #8781824,d1
     778:	23c1 0001 3ba8 	move.l d1,13ba8 <Cl102ZoomRepeat+0x190>
  for(int i=0;i<26+27+27+26+27+1;i++)
     77e:	2240           	movea.l d0,a1
  clpartinstruction = Cl102ZoomRepeat;
     780:	41f9 0001 3a18 	lea 13a18 <Cl102ZoomRepeat>,a0
    *cl++ = *clpartinstruction++;
     786:	22d8           	move.l (a0)+,(a1)+
  for(int i=0;i<26+27+27+26+27+1;i++)
     788:	b1fc 0001 3c30 	cmpa.l #80944,a0
     78e:	66f6           	bne.s 786 <ClbuildZoom+0x1f2>
   *cl++ = 0xfffffffe;
     790:	70fe           	moveq #-2,d0
     792:	2540 033c      	move.l d0,828(a2)
}
     796:	200a           	move.l a2,d0
     798:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     79c:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     79e:	2c79 0001 3d84 	movea.l 13d84 <DOSBase>,a6
     7a4:	4eae ffc4      	jsr -60(a6)
     7a8:	2c79 0001 3d84 	movea.l 13d84 <DOSBase>,a6
     7ae:	2200           	move.l d0,d1
     7b0:	243c 0001 1579 	move.l #71033,d2
     7b6:	7628           	moveq #40,d3
     7b8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7bc:	2c79 0001 3d84 	movea.l 13d84 <DOSBase>,a6
     7c2:	7201           	moveq #1,d1
     7c4:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     7c8:	24b9 0001 3ce4 	move.l 13ce4 <ClsSprites>,(a2)
     7ce:	2579 0001 3ce8 	move.l 13ce8 <ClsSprites+0x4>,4(a2)
     7d4:	0004 
     7d6:	2579 0001 3cec 	move.l 13cec <ClsSprites+0x8>,8(a2)
     7dc:	0008 
     7de:	2579 0001 3cf0 	move.l 13cf0 <ClsSprites+0xc>,12(a2)
     7e4:	000c 
     7e6:	2579 0001 3cf4 	move.l 13cf4 <ClsSprites+0x10>,16(a2)
     7ec:	0010 
     7ee:	2579 0001 3cf8 	move.l 13cf8 <ClsSprites+0x14>,20(a2)
     7f4:	0014 
     7f6:	2579 0001 3cfc 	move.l 13cfc <ClsSprites+0x18>,24(a2)
     7fc:	0018 
     7fe:	2579 0001 3d00 	move.l 13d00 <ClsSprites+0x1c>,28(a2)
     804:	001c 
     806:	2579 0001 3d04 	move.l 13d04 <ClsSprites+0x20>,32(a2)
     80c:	0020 
     80e:	2579 0001 3d08 	move.l 13d08 <ClsSprites+0x24>,36(a2)
     814:	0024 
     816:	2579 0001 3d0c 	move.l 13d0c <ClsSprites+0x28>,40(a2)
     81c:	0028 
     81e:	2579 0001 3d10 	move.l 13d10 <ClsSprites+0x2c>,44(a2)
     824:	002c 
     826:	2579 0001 3d14 	move.l 13d14 <ClsSprites+0x30>,48(a2)
     82c:	0030 
     82e:	2579 0001 3d18 	move.l 13d18 <ClsSprites+0x34>,52(a2)
     834:	0034 
     836:	2579 0001 3d1c 	move.l 13d1c <ClsSprites+0x38>,56(a2)
     83c:	0038 
     83e:	2579 0001 3d20 	move.l 13d20 <ClsSprites+0x3c>,60(a2)
     844:	003c 
    *cl++ = *clpartinstruction++;
     846:	2579 0001 3cb4 	move.l 13cb4 <ClScreen>,64(a2)
     84c:	0040 
     84e:	2579 0001 3cb8 	move.l 13cb8 <ClScreen+0x4>,68(a2)
     854:	0044 
     856:	2579 0001 3cbc 	move.l 13cbc <ClScreen+0x8>,72(a2)
     85c:	0048 
     85e:	2579 0001 3cc0 	move.l 13cc0 <ClScreen+0xc>,76(a2)
     864:	004c 
     866:	2579 0001 3cc4 	move.l 13cc4 <ClScreen+0x10>,80(a2)
     86c:	0050 
     86e:	2579 0001 3cc8 	move.l 13cc8 <ClScreen+0x14>,84(a2)
     874:	0054 
     876:	2579 0001 3ccc 	move.l 13ccc <ClScreen+0x18>,88(a2)
     87c:	0058 
     87e:	2579 0001 3cd0 	move.l 13cd0 <ClScreen+0x1c>,92(a2)
     884:	005c 
     886:	2579 0001 3cd4 	move.l 13cd4 <ClScreen+0x20>,96(a2)
     88c:	0060 
     88e:	2579 0001 3cd8 	move.l 13cd8 <ClScreen+0x24>,100(a2)
     894:	0064 
     896:	2579 0001 3cdc 	move.l 13cdc <ClScreen+0x28>,104(a2)
     89c:	0068 
     89e:	2579 0001 3ce0 	move.l 13ce0 <ClScreen+0x2c>,108(a2)
     8a4:	006c 
  *cl++ = 0x00e00000;
     8a6:	257c 00e0 0000 	move.l #14680064,112(a2)
     8ac:	0070 
  *cl++ = 0x00e20000;
     8ae:	257c 00e2 0000 	move.l #14811136,116(a2)
     8b4:	0074 
  *cl++ = 0x00e40000;
     8b6:	257c 00e4 0000 	move.l #14942208,120(a2)
     8bc:	0078 
  *cl++ = 0x00e60000;
     8be:	257c 00e6 0000 	move.l #15073280,124(a2)
     8c4:	007c 
  *cl++ = 0x00e80000;
     8c6:	257c 00e8 0000 	move.l #15204352,128(a2)
     8cc:	0080 
  *cl++ = 0x00ea0000;
     8ce:	257c 00ea 0000 	move.l #15335424,132(a2)
     8d4:	0084 
  *cl++ = 0x00ec0000;
     8d6:	257c 00ec 0000 	move.l #15466496,136(a2)
     8dc:	0088 
  *cl++ = 0x00ee0000;
     8de:	257c 00ee 0000 	move.l #15597568,140(a2)
     8e4:	008c 
  *cl++ = 0x00f00000;
     8e6:	257c 00f0 0000 	move.l #15728640,144(a2)
     8ec:	0090 
  *cl++ = 0x00f20000;
     8ee:	257c 00f2 0000 	move.l #15859712,148(a2)
     8f4:	0094 
  for(int i=0; i<32;i++)
     8f6:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
     8fa:	41f9 0001 3c34 	lea 13c34 <ClColor>,a0
     900:	6000 fde8      	bra.w 6ea <ClbuildZoom+0x156>

00000904 <Zoom_LoadImage>:
void Zoom_LoadImage( ULONG *destination) {  
     904:	206f 0004      	movea.l 4(sp),a0
  for( int i=0;i<256;i++) {
     908:	2008           	move.l a0,d0
     90a:	0680 0000 f000 	addi.l #61440,d0
      *destination++ = 0xaaaaaaaa;                 
     910:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
     916:	217c aaaa aaaa 	move.l #-1431655766,4(a0)
     91c:	0004 
     91e:	217c aaaa aaaa 	move.l #-1431655766,8(a0)
     924:	0008 
     926:	217c aaaa aaaa 	move.l #-1431655766,12(a0)
     92c:	000c 
     92e:	217c aaaa aaaa 	move.l #-1431655766,16(a0)
     934:	0010 
     936:	217c aaaa aaaa 	move.l #-1431655766,20(a0)
     93c:	0014 
     93e:	217c aaaa aaaa 	move.l #-1431655766,24(a0)
     944:	0018 
     946:	217c aaaa aaaa 	move.l #-1431655766,28(a0)
     94c:	001c 
     94e:	217c aaaa aaaa 	move.l #-1431655766,32(a0)
     954:	0020 
     956:	217c aaaa aaaa 	move.l #-1431655766,36(a0)
     95c:	0024 
     95e:	217c aaaa aaaa 	move.l #-1431655766,40(a0)
     964:	0028 
     966:	217c aaaa aaaa 	move.l #-1431655766,44(a0)
     96c:	002c 
      *destination++ = 0x33333333;        
     96e:	217c 3333 3333 	move.l #858993459,48(a0)
     974:	0030 
     976:	217c 3333 3333 	move.l #858993459,52(a0)
     97c:	0034 
     97e:	217c 3333 3333 	move.l #858993459,56(a0)
     984:	0038 
     986:	217c 3333 3333 	move.l #858993459,60(a0)
     98c:	003c 
     98e:	217c 3333 3333 	move.l #858993459,64(a0)
     994:	0040 
     996:	217c 3333 3333 	move.l #858993459,68(a0)
     99c:	0044 
     99e:	217c 3333 3333 	move.l #858993459,72(a0)
     9a4:	0048 
     9a6:	217c 3333 3333 	move.l #858993459,76(a0)
     9ac:	004c 
     9ae:	217c 3333 3333 	move.l #858993459,80(a0)
     9b4:	0050 
     9b6:	217c 3333 3333 	move.l #858993459,84(a0)
     9bc:	0054 
     9be:	217c 3333 3333 	move.l #858993459,88(a0)
     9c4:	0058 
     9c6:	217c 3333 3333 	move.l #858993459,92(a0)
     9cc:	005c 
      *destination++ = 0x00000000;
     9ce:	42a8 0060      	clr.l 96(a0)
     9d2:	42a8 0064      	clr.l 100(a0)
     9d6:	42a8 0068      	clr.l 104(a0)
     9da:	42a8 006c      	clr.l 108(a0)
     9de:	42a8 0070      	clr.l 112(a0)
     9e2:	42a8 0074      	clr.l 116(a0)
     9e6:	42a8 0078      	clr.l 120(a0)
     9ea:	42a8 007c      	clr.l 124(a0)
     9ee:	42a8 0080      	clr.l 128(a0)
     9f2:	42a8 0084      	clr.l 132(a0)
     9f6:	42a8 0088      	clr.l 136(a0)
     9fa:	42a8 008c      	clr.l 140(a0)
      *destination++ = 0x00000000;
     9fe:	42a8 0090      	clr.l 144(a0)
     a02:	42a8 0094      	clr.l 148(a0)
     a06:	42a8 0098      	clr.l 152(a0)
     a0a:	42a8 009c      	clr.l 156(a0)
     a0e:	42a8 00a0      	clr.l 160(a0)
     a12:	42a8 00a4      	clr.l 164(a0)
     a16:	42a8 00a8      	clr.l 168(a0)
     a1a:	42a8 00ac      	clr.l 172(a0)
     a1e:	42a8 00b0      	clr.l 176(a0)
     a22:	42a8 00b4      	clr.l 180(a0)
     a26:	42a8 00b8      	clr.l 184(a0)
     a2a:	42a8 00bc      	clr.l 188(a0)
      *destination++ = 0x00000000;
     a2e:	42a8 00c0      	clr.l 192(a0)
     a32:	42a8 00c4      	clr.l 196(a0)
     a36:	42a8 00c8      	clr.l 200(a0)
     a3a:	42a8 00cc      	clr.l 204(a0)
     a3e:	42a8 00d0      	clr.l 208(a0)
     a42:	42a8 00d4      	clr.l 212(a0)
     a46:	42a8 00d8      	clr.l 216(a0)
     a4a:	42a8 00dc      	clr.l 220(a0)
     a4e:	42a8 00e0      	clr.l 224(a0)
     a52:	42a8 00e4      	clr.l 228(a0)
     a56:	42a8 00e8      	clr.l 232(a0)
     a5a:	41e8 00f0      	lea 240(a0),a0
     a5e:	42a8 fffc      	clr.l -4(a0)
  for( int i=0;i<256;i++) {
     a62:	b088           	cmp.l a0,d0
     a64:	6600 feaa      	bne.w 910 <Zoom_LoadImage+0xc>
}
     a68:	4e75           	rts

00000a6a <Zoom_InitRun>:
void Zoom_InitRun() {
     a6a:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     a6e:	2c79 0001 3d88 	movea.l 13d88 <SysBase>,a6
     a74:	7004           	moveq #4,d0
     a76:	7202           	moveq #2,d1
     a78:	4eae ff3a      	jsr -198(a6)
  Zoom_LevelOf102Zoom = 0;
     a7c:	4279 0001 3d82 	clr.w 13d82 <Zoom_LevelOf102Zoom>
  Copperlist1 = ClbuildZoom( );
     a82:	45fa fb10      	lea 594 <ClbuildZoom>(pc),a2
     a86:	4e92           	jsr (a2)
     a88:	23c0 0001 3d76 	move.l d0,13d76 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
     a8e:	4e92           	jsr (a2)
     a90:	23c0 0001 3d72 	move.l d0,13d72 <Copperlist2>
  Bitplane1 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
     a96:	2c79 0001 3d88 	movea.l 13d88 <SysBase>,a6
     a9c:	203c 0000 ff00 	move.l #65280,d0
     aa2:	7202           	moveq #2,d1
     aa4:	4eae ff3a      	jsr -198(a6)
     aa8:	23c0 0001 3d7e 	move.l d0,13d7e <Bitplane1>
  if(Bitplane1 == 0) {
     aae:	6700 00ae      	beq.w b5e <Zoom_InitRun+0xf4>
  DrawBuffer = Bitplane1;
     ab2:	23c0 0001 3d6e 	move.l d0,13d6e <DrawBuffer>
  DrawCopper = Copperlist1;
     ab8:	23f9 0001 3d76 	move.l 13d76 <Copperlist1>,13d6a <DrawCopper>
     abe:	0001 3d6a 
  Bitplane2 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
     ac2:	2c79 0001 3d88 	movea.l 13d88 <SysBase>,a6
     ac8:	203c 0000 ff00 	move.l #65280,d0
     ace:	7202           	moveq #2,d1
     ad0:	4eae ff3a      	jsr -198(a6)
     ad4:	2400           	move.l d0,d2
     ad6:	23c0 0001 3d7a 	move.l d0,13d7a <Bitplane2>
  if(Bitplane2 == 0) {
     adc:	6728           	beq.s b06 <Zoom_InitRun+0x9c>
  ViewBuffer = Bitplane2;
     ade:	23c2 0001 3d66 	move.l d2,13d66 <ViewBuffer>
  ViewCopper = Copperlist2;
     ae4:	23f9 0001 3d72 	move.l 13d72 <Copperlist2>,13d62 <ViewCopper>
     aea:	0001 3d62 
  Zoom_LoadImage( Bitplane1);
     aee:	2f39 0001 3d7e 	move.l 13d7e <Bitplane1>,-(sp)
     af4:	45fa fe0e      	lea 904 <Zoom_LoadImage>(pc),a2
     af8:	4e92           	jsr (a2)
  Zoom_LoadImage( Bitplane2);
     afa:	2f02           	move.l d2,-(sp)
     afc:	4e92           	jsr (a2)
     afe:	508f           	addq.l #8,sp
}
     b00:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     b04:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     b06:	2c79 0001 3d84 	movea.l 13d84 <DOSBase>,a6
     b0c:	4eae ffc4      	jsr -60(a6)
     b10:	2c79 0001 3d84 	movea.l 13d84 <DOSBase>,a6
     b16:	2200           	move.l d0,d1
     b18:	243c 0001 15c6 	move.l #71110,d2
     b1e:	7626           	moveq #38,d3
     b20:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     b24:	2c79 0001 3d84 	movea.l 13d84 <DOSBase>,a6
     b2a:	7201           	moveq #1,d1
     b2c:	4eae ff70      	jsr -144(a6)
     b30:	2439 0001 3d7a 	move.l 13d7a <Bitplane2>,d2
  ViewBuffer = Bitplane2;
     b36:	23c2 0001 3d66 	move.l d2,13d66 <ViewBuffer>
  ViewCopper = Copperlist2;
     b3c:	23f9 0001 3d72 	move.l 13d72 <Copperlist2>,13d62 <ViewCopper>
     b42:	0001 3d62 
  Zoom_LoadImage( Bitplane1);
     b46:	2f39 0001 3d7e 	move.l 13d7e <Bitplane1>,-(sp)
     b4c:	45fa fdb6      	lea 904 <Zoom_LoadImage>(pc),a2
     b50:	4e92           	jsr (a2)
  Zoom_LoadImage( Bitplane2);
     b52:	2f02           	move.l d2,-(sp)
     b54:	4e92           	jsr (a2)
     b56:	508f           	addq.l #8,sp
}
     b58:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     b5c:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     b5e:	2c79 0001 3d84 	movea.l 13d84 <DOSBase>,a6
     b64:	4eae ffc4      	jsr -60(a6)
     b68:	2c79 0001 3d84 	movea.l 13d84 <DOSBase>,a6
     b6e:	2200           	move.l d0,d1
     b70:	243c 0001 159f 	move.l #71071,d2
     b76:	7626           	moveq #38,d3
     b78:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     b7c:	2c79 0001 3d84 	movea.l 13d84 <DOSBase>,a6
     b82:	7201           	moveq #1,d1
     b84:	4eae ff70      	jsr -144(a6)
     b88:	2039 0001 3d7e 	move.l 13d7e <Bitplane1>,d0
  DrawBuffer = Bitplane1;
     b8e:	23c0 0001 3d6e 	move.l d0,13d6e <DrawBuffer>
  DrawCopper = Copperlist1;
     b94:	23f9 0001 3d76 	move.l 13d76 <Copperlist1>,13d6a <DrawCopper>
     b9a:	0001 3d6a 
  Bitplane2 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
     b9e:	2c79 0001 3d88 	movea.l 13d88 <SysBase>,a6
     ba4:	203c 0000 ff00 	move.l #65280,d0
     baa:	7202           	moveq #2,d1
     bac:	4eae ff3a      	jsr -198(a6)
     bb0:	2400           	move.l d0,d2
     bb2:	23c0 0001 3d7a 	move.l d0,13d7a <Bitplane2>
  if(Bitplane2 == 0) {
     bb8:	6600 ff24      	bne.w ade <Zoom_InitRun+0x74>
     bbc:	6000 ff48      	bra.w b06 <Zoom_InitRun+0x9c>

00000bc0 <interruptHandler>:
static __attribute__((interrupt)) void interruptHandler() {
     bc0:	2f08           	move.l a0,-(sp)
     bc2:	2f00           	move.l d0,-(sp)
	hw->intreq=(1<<INTB_VERTB); hw->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     bc4:	2079 0001 3d5e 	movea.l 13d5e <hw>,a0
     bca:	317c 0020 009c 	move.w #32,156(a0)
     bd0:	317c 0020 009c 	move.w #32,156(a0)
	frameCounter++;
     bd6:	2039 0001 3d44 	move.l 13d44 <frameCounter>,d0
     bdc:	5280           	addq.l #1,d0
     bde:	23c0 0001 3d44 	move.l d0,13d44 <frameCounter>
}
     be4:	201f           	move.l (sp)+,d0
     be6:	205f           	movea.l (sp)+,a0
     be8:	4e73           	rte

00000bea <WaitVbl>:
void WaitVbl() {
     bea:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     bec:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd715a>,d0
     bf2:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
     bf4:	2017           	move.l (sp),d0
     bf6:	0280 0001 ff00 	andi.l #130816,d0
     bfc:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
     bfe:	2017           	move.l (sp),d0
     c00:	0c80 0001 3700 	cmpi.l #79616,d0
     c06:	67e4           	beq.s bec <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     c08:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd715a>,d0
     c0e:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
     c12:	202f 0004      	move.l 4(sp),d0
     c16:	0280 0001 ff00 	andi.l #130816,d0
     c1c:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
     c20:	202f 0004      	move.l 4(sp),d0
     c24:	0c80 0001 3700 	cmpi.l #79616,d0
     c2a:	66dc           	bne.s c08 <WaitVbl+0x1e>
}
     c2c:	508f           	addq.l #8,sp
     c2e:	4e75           	rts

00000c30 <memcpy>:
{
     c30:	48e7 3820      	movem.l d2-d4/a2,-(sp)
     c34:	202f 0014      	move.l 20(sp),d0
     c38:	226f 0018      	movea.l 24(sp),a1
     c3c:	222f 001c      	move.l 28(sp),d1
	while(len--)
     c40:	2601           	move.l d1,d3
     c42:	5383           	subq.l #1,d3
     c44:	4a81           	tst.l d1
     c46:	6762           	beq.s caa <memcpy+0x7a>
     c48:	2040           	movea.l d0,a0
     c4a:	5888           	addq.l #4,a0
     c4c:	b1c9           	cmpa.l a1,a0
     c4e:	53c2           	sl.s d2
     c50:	4402           	neg.b d2
     c52:	41e9 0004      	lea 4(a1),a0
     c56:	b1c0           	cmpa.l d0,a0
     c58:	53c4           	sl.s d4
     c5a:	4404           	neg.b d4
     c5c:	8404           	or.b d4,d2
     c5e:	7808           	moveq #8,d4
     c60:	b883           	cmp.l d3,d4
     c62:	55c4           	sc.s d4
     c64:	4404           	neg.b d4
     c66:	c404           	and.b d4,d2
     c68:	6746           	beq.s cb0 <memcpy+0x80>
     c6a:	2409           	move.l a1,d2
     c6c:	8480           	or.l d0,d2
     c6e:	7803           	moveq #3,d4
     c70:	c484           	and.l d4,d2
     c72:	663c           	bne.s cb0 <memcpy+0x80>
     c74:	2049           	movea.l a1,a0
     c76:	2440           	movea.l d0,a2
     c78:	74fc           	moveq #-4,d2
     c7a:	c481           	and.l d1,d2
     c7c:	d489           	add.l a1,d2
		*d++ = *s++;
     c7e:	24d8           	move.l (a0)+,(a2)+
     c80:	b488           	cmp.l a0,d2
     c82:	66fa           	bne.s c7e <memcpy+0x4e>
     c84:	74fc           	moveq #-4,d2
     c86:	c481           	and.l d1,d2
     c88:	2040           	movea.l d0,a0
     c8a:	d1c2           	adda.l d2,a0
     c8c:	d3c2           	adda.l d2,a1
     c8e:	9682           	sub.l d2,d3
     c90:	b481           	cmp.l d1,d2
     c92:	6716           	beq.s caa <memcpy+0x7a>
     c94:	1091           	move.b (a1),(a0)
	while(len--)
     c96:	4a83           	tst.l d3
     c98:	6710           	beq.s caa <memcpy+0x7a>
		*d++ = *s++;
     c9a:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
     ca0:	5383           	subq.l #1,d3
     ca2:	6706           	beq.s caa <memcpy+0x7a>
		*d++ = *s++;
     ca4:	1169 0002 0002 	move.b 2(a1),2(a0)
}
     caa:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
     cae:	4e75           	rts
     cb0:	2040           	movea.l d0,a0
     cb2:	d289           	add.l a1,d1
		*d++ = *s++;
     cb4:	10d9           	move.b (a1)+,(a0)+
	while(len--)
     cb6:	b289           	cmp.l a1,d1
     cb8:	67f0           	beq.s caa <memcpy+0x7a>
		*d++ = *s++;
     cba:	10d9           	move.b (a1)+,(a0)+
	while(len--)
     cbc:	b289           	cmp.l a1,d1
     cbe:	66f4           	bne.s cb4 <memcpy+0x84>
     cc0:	60e8           	bra.s caa <memcpy+0x7a>

00000cc2 <memset>:
{
     cc2:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
     cc6:	202f 0024      	move.l 36(sp),d0
     cca:	2a2f 0028      	move.l 40(sp),d5
     cce:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
     cd2:	2809           	move.l a1,d4
     cd4:	5384           	subq.l #1,d4
     cd6:	b2fc 0000      	cmpa.w #0,a1
     cda:	6f00 00b0      	ble.w d8c <memset+0xca>
     cde:	1e05           	move.b d5,d7
     ce0:	2200           	move.l d0,d1
     ce2:	4481           	neg.l d1
     ce4:	7403           	moveq #3,d2
     ce6:	c282           	and.l d2,d1
     ce8:	7c05           	moveq #5,d6
		*ptr++ = val;
     cea:	2440           	movea.l d0,a2
     cec:	bc84           	cmp.l d4,d6
     cee:	646a           	bcc.s d5a <memset+0x98>
     cf0:	4a81           	tst.l d1
     cf2:	6724           	beq.s d18 <memset+0x56>
     cf4:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
     cf6:	5384           	subq.l #1,d4
     cf8:	7401           	moveq #1,d2
     cfa:	b481           	cmp.l d1,d2
     cfc:	671a           	beq.s d18 <memset+0x56>
		*ptr++ = val;
     cfe:	2440           	movea.l d0,a2
     d00:	548a           	addq.l #2,a2
     d02:	2040           	movea.l d0,a0
     d04:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
     d08:	5384           	subq.l #1,d4
     d0a:	7403           	moveq #3,d2
     d0c:	b481           	cmp.l d1,d2
     d0e:	6608           	bne.s d18 <memset+0x56>
		*ptr++ = val;
     d10:	528a           	addq.l #1,a2
     d12:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
     d16:	5384           	subq.l #1,d4
     d18:	2609           	move.l a1,d3
     d1a:	9681           	sub.l d1,d3
     d1c:	7c00           	moveq #0,d6
     d1e:	1c05           	move.b d5,d6
     d20:	2406           	move.l d6,d2
     d22:	4842           	swap d2
     d24:	4242           	clr.w d2
     d26:	2042           	movea.l d2,a0
     d28:	2406           	move.l d6,d2
     d2a:	e14a           	lsl.w #8,d2
     d2c:	4842           	swap d2
     d2e:	4242           	clr.w d2
     d30:	e18e           	lsl.l #8,d6
     d32:	2646           	movea.l d6,a3
     d34:	2c08           	move.l a0,d6
     d36:	8486           	or.l d6,d2
     d38:	2c0b           	move.l a3,d6
     d3a:	8486           	or.l d6,d2
     d3c:	1407           	move.b d7,d2
     d3e:	2040           	movea.l d0,a0
     d40:	d1c1           	adda.l d1,a0
     d42:	72fc           	moveq #-4,d1
     d44:	c283           	and.l d3,d1
     d46:	d288           	add.l a0,d1
		*ptr++ = val;
     d48:	20c2           	move.l d2,(a0)+
     d4a:	b1c1           	cmpa.l d1,a0
     d4c:	66fa           	bne.s d48 <memset+0x86>
     d4e:	72fc           	moveq #-4,d1
     d50:	c283           	and.l d3,d1
     d52:	d5c1           	adda.l d1,a2
     d54:	9881           	sub.l d1,d4
     d56:	b283           	cmp.l d3,d1
     d58:	6732           	beq.s d8c <memset+0xca>
     d5a:	1485           	move.b d5,(a2)
	while(len-- > 0)
     d5c:	4a84           	tst.l d4
     d5e:	6f2c           	ble.s d8c <memset+0xca>
		*ptr++ = val;
     d60:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
     d64:	7201           	moveq #1,d1
     d66:	b284           	cmp.l d4,d1
     d68:	6c22           	bge.s d8c <memset+0xca>
		*ptr++ = val;
     d6a:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
     d6e:	7402           	moveq #2,d2
     d70:	b484           	cmp.l d4,d2
     d72:	6c18           	bge.s d8c <memset+0xca>
		*ptr++ = val;
     d74:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
     d78:	7c03           	moveq #3,d6
     d7a:	bc84           	cmp.l d4,d6
     d7c:	6c0e           	bge.s d8c <memset+0xca>
		*ptr++ = val;
     d7e:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
     d82:	7204           	moveq #4,d1
     d84:	b284           	cmp.l d4,d1
     d86:	6c04           	bge.s d8c <memset+0xca>
		*ptr++ = val;
     d88:	1545 0005      	move.b d5,5(a2)
}
     d8c:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
     d90:	4e75           	rts

00000d92 <strlen>:
{
     d92:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
     d96:	7000           	moveq #0,d0
	while(*s++)
     d98:	4a10           	tst.b (a0)
     d9a:	6708           	beq.s da4 <strlen+0x12>
		t++;
     d9c:	5280           	addq.l #1,d0
	while(*s++)
     d9e:	4a30 0800      	tst.b (0,a0,d0.l)
     da2:	66f8           	bne.s d9c <strlen+0xa>
}
     da4:	4e75           	rts
     da6:	4e71           	nop

00000da8 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
     da8:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
     dac:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
     db0:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
     db4:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
     db8:	d041           	add.w d1,d0
	swap	d0
     dba:	4840           	swap d0
	clrw	d0
     dbc:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
     dbe:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
     dc2:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
     dc6:	d081           	add.l d1,d0

	rts
     dc8:	4e75           	rts

00000dca <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
     dca:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
     dcc:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
     dd0:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
     dd4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
     dda:	6416           	bcc.s df2 <__udivsi3+0x28>
	movel	d0, d2
     ddc:	2400           	move.l d0,d2
	clrw	d2
     dde:	4242           	clr.w d2
	swap	d2
     de0:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
     de2:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
     de4:	3002           	move.w d2,d0
	swap	d0
     de6:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
     de8:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
     dec:	84c1           	divu.w d1,d2
	movew	d2, d0
     dee:	3002           	move.w d2,d0
	jra	6f
     df0:	6030           	bra.s e22 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
     df2:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
     df4:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
     df6:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
     df8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
     dfe:	64f4           	bcc.s df4 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
     e00:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
     e02:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
     e08:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
     e0a:	c2c0           	mulu.w d0,d1
	swap	d2
     e0c:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
     e0e:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
     e10:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
     e12:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
     e14:	660a           	bne.s e20 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
     e16:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
     e18:	6506           	bcs.s e20 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
     e1a:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
     e1e:	6302           	bls.s e22 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
     e20:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
     e22:	241f           	move.l (sp)+,d2
	rts
     e24:	4e75           	rts

00000e26 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
     e26:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
     e28:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
     e2a:	222f 000c      	move.l 12(sp),d1
	jpl	1f
     e2e:	6a04           	bpl.s e34 <__divsi3+0xe>
	negl	d1
     e30:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
     e32:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
     e34:	202f 0008      	move.l 8(sp),d0
	jpl	2f
     e38:	6a04           	bpl.s e3e <__divsi3+0x18>
	negl	d0
     e3a:	4480           	neg.l d0
	negb	d2
     e3c:	4402           	neg.b d2

2:	movel	d1, sp@-
     e3e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
     e40:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
     e42:	6186           	bsr.s dca <__udivsi3>
	addql	IMM (8), sp
     e44:	508f           	addq.l #8,sp

	tstb	d2
     e46:	4a02           	tst.b d2
	jpl	3f
     e48:	6a02           	bpl.s e4c <__divsi3+0x26>
	negl	d0
     e4a:	4480           	neg.l d0

3:	movel	sp@+, d2
     e4c:	241f           	move.l (sp)+,d2
	rts
     e4e:	4e75           	rts

00000e50 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
     e50:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
     e54:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
     e58:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
     e5a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
     e5c:	61c8           	bsr.s e26 <__divsi3>
	addql	IMM (8), sp
     e5e:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
     e60:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
     e64:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
     e66:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
     e68:	6100 ff3e      	bsr.w da8 <__mulsi3>
	addql	IMM (8), sp
     e6c:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
     e6e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
     e72:	9280           	sub.l d0,d1
	movel	d1, d0
     e74:	2001           	move.l d1,d0
	rts
     e76:	4e75           	rts

00000e78 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
     e78:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
     e7c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
     e80:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
     e82:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
     e84:	6100 ff44      	bsr.w dca <__udivsi3>
	addql	IMM (8), sp
     e88:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
     e8a:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
     e8e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
     e90:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
     e92:	6100 ff14      	bsr.w da8 <__mulsi3>
	addql	IMM (8), sp
     e96:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
     e98:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
     e9c:	9280           	sub.l d0,d1
	movel	d1, d0
     e9e:	2001           	move.l d1,d0
	rts
     ea0:	4e75           	rts

00000ea2 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
     ea2:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
     ea4:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
     ea8:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
     eac:	2c5f           	movea.l (sp)+,a6
    rts
     eae:	4e75           	rts

00000eb0 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
     eb0:	16c0           	move.b d0,(a3)+
	rts
     eb2:	4e75           	rts

00000eb4 <saveregs>:
	...

00000ef0 <font2distance>:
     ef0:	0505           	btst d2,d5
     ef2:	0505           	btst d2,d5
     ef4:	0505           	btst d2,d5
     ef6:	0505           	btst d2,d5
     ef8:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
     efa:	0505           	btst d2,d5
     efc:	0505           	btst d2,d5
     efe:	0005 0505      	ori.b #5,d5
     f02:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
     f04:	0505           	btst d2,d5
     f06:	0505           	btst d2,d5
     f08:	0505           	btst d2,d5
     f0a:	0505           	btst d2,d5
     f0c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
     f0e:	0505           	btst d2,d5
     f10:	0505           	btst d2,d5
     f12:	0505           	btst d2,d5
     f14:	0505           	btst d2,d5
     f16:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
     f18:	0500           	btst d2,d0
     f1a:	0505           	btst d2,d5
     f1c:	0505           	btst d2,d5
     f1e:	0505           	btst d2,d5
     f20:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
     f22:	0505           	btst d2,d5
     f24:	0505           	btst d2,d5
     f26:	0505           	btst d2,d5
     f28:	0505           	btst d2,d5
     f2a:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
     f2c:	0505           	btst d2,d5
     f2e:	0505           	btst d2,d5
     f30:	0503           	btst d2,d3
     f32:	0505           	btst d2,d5
     f34:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
     f36:	0505           	btst d2,d5
     f38:	0500           	btst d2,d0
     f3a:	0505           	btst d2,d5
     f3c:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
     f40:	0505           	btst d2,d5
     f42:	0503           	btst d2,d3
     f44:	0205 0507      	andi.b #7,d5
     f48:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
     f4a:	0505           	btst d2,d5
     f4c:	0505           	btst d2,d5
     f4e:	0505           	btst d2,d5
     f50:	0505           	btst d2,d5
     f52:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f54:	0505           	btst d2,d5
     f56:	0505           	btst d2,d5
     f58:	0505           	btst d2,d5
     f5a:	0505           	btst d2,d5
     f5c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f5e:	0505           	btst d2,d5
     f60:	0505           	btst d2,d5
     f62:	0505           	btst d2,d5
     f64:	0505           	btst d2,d5
     f66:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f68:	0505           	btst d2,d5
     f6a:	0505           	btst d2,d5
     f6c:	0505           	btst d2,d5
     f6e:	0505           	btst d2,d5
     f70:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f72:	0505           	btst d2,d5
     f74:	0505           	btst d2,d5
     f76:	0505           	btst d2,d5
     f78:	0505           	btst d2,d5
     f7a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f7c:	0505           	btst d2,d5
     f7e:	0505           	btst d2,d5
     f80:	0505           	btst d2,d5
     f82:	0505           	btst d2,d5
     f84:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f86:	0505           	btst d2,d5
     f88:	0505           	btst d2,d5
     f8a:	0505           	btst d2,d5
     f8c:	0505           	btst d2,d5
     f8e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f90:	0505           	btst d2,d5
     f92:	0505           	btst d2,d5
     f94:	0505           	btst d2,d5
     f96:	0505           	btst d2,d5
     f98:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     f9a:	0505           	btst d2,d5
     f9c:	0505           	btst d2,d5
     f9e:	0505           	btst d2,d5
     fa0:	0505           	btst d2,d5
     fa2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     fa4:	0505           	btst d2,d5
     fa6:	0505           	btst d2,d5
     fa8:	0505           	btst d2,d5
     faa:	0505           	btst d2,d5
     fac:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     fae:	0505           	btst d2,d5
     fb0:	0505           	btst d2,d5
     fb2:	0505           	btst d2,d5
     fb4:	0505           	btst d2,d5
     fb6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     fb8:	0505           	btst d2,d5
     fba:	0505           	btst d2,d5
     fbc:	0505           	btst d2,d5
     fbe:	0505           	btst d2,d5
     fc0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     fc2:	0505           	btst d2,d5
     fc4:	0505           	btst d2,d5
     fc6:	0505           	btst d2,d5
     fc8:	0505           	btst d2,d5
     fca:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     fcc:	0505           	btst d2,d5
     fce:	0505           	btst d2,d5
     fd0:	0505           	btst d2,d5
     fd2:	0505           	btst d2,d5
     fd4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     fd6:	0505           	btst d2,d5
     fd8:	0505           	btst d2,d5
     fda:	0505           	btst d2,d5
     fdc:	0505           	btst d2,d5
     fde:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
     fe0:	0505           	btst d2,d5
     fe2:	0505           	btst d2,d5
     fe4:	0505           	btst d2,d5
     fe6:	0505           	btst d2,d5
     fe8:	0505           	btst d2,d5

00000fea <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
     fea:	16c0           	move.b d0,(a3)+
  RTS
     fec:	4e75           	rts

00000fee <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
     fee:	48f9 7fff 0000 	movem.l d0-a6,eb4 <saveregs>
     ff4:	0eb4 
  lea 0xdff000,a5
     ff6:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xdd7156>,a5
  move.l sp@(4),a0  //Fontlocation
     ffc:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    1000:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    1004:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    1008:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    100a:	082d 0006 0002 	btst #6,2(a5)

00001010 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    1010:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    1016:	66f8           	bne.s 1010 <st2wblit>

00001018 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    1018:	7019           	moveq #25,d0
	sub.l d5,d5      
    101a:	9a85           	sub.l d5,d5

0000101c <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    101c:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    101e:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    1020:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    1024:	9dce           	suba.l a6,a6
	move.l d2, a6
    1026:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    1028:	ddfc 0000 0ef0 	adda.l #3824,a6

	LSL  	#4,d2 	    //Fetch next char
    102e:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    1030:	2842           	movea.l d2,a4


	move.l  #0,d4
    1032:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    1034:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    1036:	3814           	move.w (a4),d4
	swap	d4
    1038:	4844           	swap d4
	lsr.l	d5, d4
    103a:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    103c:	8993           	or.l d4,(a3)
	clr.l	d4
    103e:	4284           	clr.l d4
	move.w  2(a4), d4
    1040:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    1044:	4844           	swap d4
	lsr.l	d5, d4
    1046:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    1048:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    104c:	4284           	clr.l d4
	move.w  4(a4), d4
    104e:	382c 0004      	move.w 4(a4),d4
	swap	d4
    1052:	4844           	swap d4
	lsr.l	d5, d4
    1054:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    1056:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    105a:	4284           	clr.l d4
	move.w  6(a4), d4
    105c:	382c 0006      	move.w 6(a4),d4
	swap	d4
    1060:	4844           	swap d4
	lsr.l	d5, d4
    1062:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    1064:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    1068:	4284           	clr.l d4
	move.w  8(a4), d4
    106a:	382c 0008      	move.w 8(a4),d4
	swap	d4
    106e:	4844           	swap d4
	lsr.l	d5, d4
    1070:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    1072:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    1076:	4284           	clr.l d4
	move.w  10(a4), d4
    1078:	382c 000a      	move.w 10(a4),d4
	swap	d4
    107c:	4844           	swap d4
	lsr.l	d5, d4
    107e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    1080:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    1084:	4284           	clr.l d4
	move.w  12(a4), d4
    1086:	382c 000c      	move.w 12(a4),d4
	swap	d4
    108a:	4844           	swap d4
	lsr.l	d5, d4
    108c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    108e:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    1092:	4284           	clr.l d4
	move.w  14(a4), d4
    1094:	382c 000e      	move.w 14(a4),d4
	swap	d4
    1098:	4844           	swap d4
	lsr.l	d5, d4
    109a:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    109c:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    10a0:	4284           	clr.l d4

	add.b   (a6), d5
    10a2:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    10a4:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    10a8:	6500 0006      	bcs.w 10b0 <noadditionalchar>
	addq.w  #1, a3
    10ac:	524b           	addq.w #1,a3
	sub.w   #8,d5
    10ae:	5145           	subq.w #8,d5

000010b0 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    10b0:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    10b2:	51c8 ff68      	dbf d0,101c <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    10b6:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    10ba:	51cb ff5c      	dbf d3,1018 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    10be:	4cfa 7fff fdf2 	movem.l eb4 <saveregs>(pc),d0-a6

	RTS
    10c4:	4e75           	rts
