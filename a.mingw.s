
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
       6:	4fef fff0      	lea -16(sp),sp
       a:	48e7 3822      	movem.l d2-d4/a2/a6,-(sp)

  UWORD test = 99;
  /*UWORD *bp = 0x200;
  *bp = test;*/
  ULONG tmp = 4;
  SysBase = *((struct ExecBase**)tmp);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0001 534a 	move.l a6,1534a <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,15352 <hw>
      1e:	0001 5352 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0001 209f 	lea 1209f <incbin_swfont_end+0x83>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
	if (!GfxBase)
      2e:	4a80           	tst.l d0
      30:	6700 01ee      	beq.w 220 <main+0x21a>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      34:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
      3a:	43f9 0001 20b0 	lea 120b0 <incbin_swfont_end+0x94>,a1
      40:	7000           	moveq #0,d0
      42:	4eae fdd8      	jsr -552(a6)
      46:	23c0 0001 5346 	move.l d0,15346 <DOSBase>
	if (!DOSBase)
      4c:	6700 01c0      	beq.w 20e <main+0x208>
		Exit(0);

	//KPrintF("Hello debugger from Amiga!\n");
	//Write(Output(), "Hello console!\n", 15);
	/*Delay(50);*/
  Zoom_InitRun();
      50:	4eb9 0000 13b2 	jsr 13b2 <Zoom_InitRun>

//vblank begins at vpos 312 hpos 1 and ends at vpos 25 hpos 1
//vsync begins at line 2 hpos 132 and ends at vpos 5 hpos 18 
void WaitVbl() {
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
      56:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd70e1>,d0
      5c:	2f40 0018      	move.l d0,24(sp)
		vpos&=0x1ff00;
      60:	202f 0018      	move.l 24(sp),d0
      64:	0280 0001 ff00 	andi.l #130816,d0
      6a:	2f40 0018      	move.l d0,24(sp)
		if (vpos!=(311<<8))
      6e:	202f 0018      	move.l 24(sp),d0
      72:	0c80 0001 3700 	cmpi.l #79616,d0
      78:	67dc           	beq.s 56 <main+0x50>
			break;
	}
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
      7a:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd70e1>,d0
      80:	2f40 0014      	move.l d0,20(sp)
		vpos&=0x1ff00;
      84:	202f 0014      	move.l 20(sp),d0
      88:	0280 0001 ff00 	andi.l #130816,d0
      8e:	2f40 0014      	move.l d0,20(sp)
		if (vpos==(311<<8))
      92:	202f 0014      	move.l 20(sp),d0
      96:	0c80 0001 3700 	cmpi.l #79616,d0
      9c:	66dc           	bne.s 7a <main+0x74>
  //Zoom_VblankHandler();
}

void RunDemo() {
//               5432109876543210
  hw->dmacon = 0b1000011111111111;
      9e:	2079 0001 5352 	movea.l 15352 <hw>,a0
      a4:	317c 87ff 0096 	move.w #-30721,150(a0)
  //             1001001111100000	; copper,bitplane,blitter DMA

  /*hw->dmacon =   
  0x87e0;*/
	//SetInterruptHandler((APTR)interruptHandler);
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
      aa:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
      b0:	317c 0020 009c 	move.w #32,156(a0)
  //PrepareDisplay();

	while(Zoom_Counter < 1000) {
      b6:	3439 0001 5344 	move.w 15344 <Zoom_Counter>,d2
      bc:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
      c2:	0c42 03e7      	cmpi.w #999,d2
      c6:	6200 0096      	bhi.w 15e <main+0x158>
  Zoom_Blit4ZoomFinished = 0;
  UWORD tmp = Zoom_LevelOfZoom;
  if(Zoom_LevelOfZoom == 0)
    CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
  else
    Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer, (UWORD *)DrawBuffer, Zoom_LevelOfZoom, 5 );
      ca:	45f9 0000 024c 	lea 24c <Zoom_ZoomIntoPicture.constprop.0>,a2
    CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
      d0:	263c 0000 ff00 	move.l #65280,d3
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
      d6:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd70e1>,d0
      dc:	2f40 0020      	move.l d0,32(sp)
		vpos&=0x1ff00;
      e0:	202f 0020      	move.l 32(sp),d0
      e4:	0280 0001 ff00 	andi.l #130816,d0
      ea:	2f40 0020      	move.l d0,32(sp)
		if (vpos!=(311<<8))
      ee:	202f 0020      	move.l 32(sp),d0
      f2:	0c80 0001 3700 	cmpi.l #79616,d0
      f8:	67dc           	beq.s d6 <main+0xd0>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
      fa:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd70e1>,d0
     100:	2f40 001c      	move.l d0,28(sp)
		vpos&=0x1ff00;
     104:	202f 001c      	move.l 28(sp),d0
     108:	0280 0001 ff00 	andi.l #130816,d0
     10e:	2f40 001c      	move.l d0,28(sp)
		if (vpos==(311<<8))
     112:	202f 001c      	move.l 28(sp),d0
     116:	0c80 0001 3700 	cmpi.l #79616,d0
     11c:	66dc           	bne.s fa <main+0xf4>
  UWORD tmp = Zoom_LevelOfZoom;
     11e:	3839 0001 532c 	move.w 1532c <Zoom_LevelOfZoom>,d4
  if(Zoom_LevelOfZoom == 0)
     124:	3039 0001 532c 	move.w 1532c <Zoom_LevelOfZoom>,d0
     12a:	2279 0001 5318 	movea.l 15318 <DrawBuffer>,a1
     130:	6600 00b4      	bne.w 1e6 <main+0x1e0>
    CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
     134:	2079 0001 533e 	movea.l 1533e <Zoom_StartImage>,a0
     13a:	2003           	move.l d3,d0
     13c:	4eae fd8a      	jsr -630(a6)
     140:	3439 0001 5344 	move.w 15344 <Zoom_Counter>,d2
     146:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6

  Zoom_Blit4ZoomFinished = 1;
  /*UWORD *bp = 0x200;
  *bp = 0;*/
  while( tmp == Zoom_LevelOfZoom) { }
     14c:	3039 0001 532c 	move.w 1532c <Zoom_LevelOfZoom>,d0
     152:	b044           	cmp.w d4,d0
     154:	67f6           	beq.s 14c <main+0x146>
	while(Zoom_Counter < 1000) {
     156:	0c42 03e7      	cmpi.w #999,d2
     15a:	6300 ff7a      	bls.w d6 <main+0xd0>
  SwapCl();
  
}

void Zoom_Dealloc() {
  RemIntServer(INTB_VERTB, Zoom_vbint);
     15e:	7005           	moveq #5,d0
     160:	2279 0001 5328 	movea.l 15328 <Zoom_vbint>,a1
     166:	4eae ff52      	jsr -174(a6)
   0x01980FBB,0x019A0ECA,0x019C0BE7,0x019E0EDC,0x01A00DDD,0x01A20FDD,0x01A40DE8,
   0x01A60EEA,0x01A80DE9,0x01AA0DFB,0x01AC0FEE,0x01AE0EFC,0x01B00EFF,0x01B20EFC,
           0x01B40EFD,0x01B60FFE,0x01B80FFF,0x01BA0FFF,0x01BC0FFF, 0x01BE0FFF };

void FreeDisplay( int clsize, int bplsize) {
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
     16a:	2279 0001 5332 	movea.l 15332 <Copperlist1>,a1
     170:	b2fc 0000      	cmpa.w #0,a1
     174:	6710           	beq.s 186 <main+0x180>
     176:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
     17c:	203c 0000 031c 	move.l #796,d0
     182:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     186:	2279 0001 532e 	movea.l 1532e <Copperlist2>,a1
     18c:	b2fc 0000      	cmpa.w #0,a1
     190:	6710           	beq.s 1a2 <main+0x19c>
     192:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
     198:	203c 0000 031c 	move.l #796,d0
     19e:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
     1a2:	2279 0001 533a 	movea.l 1533a <Bitplane1>,a1
     1a8:	b2fc 0000      	cmpa.w #0,a1
     1ac:	6710           	beq.s 1be <main+0x1b8>
     1ae:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
     1b4:	203c 0000 ff00 	move.l #65280,d0
     1ba:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
     1be:	2279 0001 5336 	movea.l 15336 <Bitplane2>,a1
     1c4:	b2fc 0000      	cmpa.w #0,a1
     1c8:	6710           	beq.s 1da <main+0x1d4>
     1ca:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
     1d0:	203c 0000 ff00 	move.l #65280,d0
     1d6:	4eae ff2e      	jsr -210(a6)

	//FreeSystem();

	/*CloseLibrary((struct Library*)DOSBase);
	CloseLibrary((struct Library*)GfxBase);*/
}
     1da:	7000           	moveq #0,d0
     1dc:	4cdf 441c      	movem.l (sp)+,d2-d4/a2/a6
     1e0:	4fef 0010      	lea 16(sp),sp
     1e4:	4e75           	rts
    Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer, (UWORD *)DrawBuffer, Zoom_LevelOfZoom, 5 );
     1e6:	3039 0001 532c 	move.w 1532c <Zoom_LevelOfZoom>,d0
     1ec:	3f00           	move.w d0,-(sp)
     1ee:	4267           	clr.w -(sp)
     1f0:	2f09           	move.l a1,-(sp)
     1f2:	2f39 0001 5320 	move.l 15320 <ViewBuffer>,-(sp)
     1f8:	4e92           	jsr (a2)
     1fa:	4fef 000c      	lea 12(sp),sp
  while( tmp == Zoom_LevelOfZoom) { }
     1fe:	3039 0001 532c 	move.w 1532c <Zoom_LevelOfZoom>,d0
     204:	b044           	cmp.w d4,d0
     206:	6700 ff44      	beq.w 14c <main+0x146>
     20a:	6000 ff4a      	bra.w 156 <main+0x150>
		Exit(0);
     20e:	9dce           	suba.l a6,a6
     210:	7200           	moveq #0,d1
     212:	4eae ff70      	jsr -144(a6)
  Zoom_InitRun();
     216:	4eb9 0000 13b2 	jsr 13b2 <Zoom_InitRun>
	WaitVbl();
     21c:	6000 fe38      	bra.w 56 <main+0x50>
		Exit(0);
     220:	2c79 0001 5346 	movea.l 15346 <DOSBase>,a6
     226:	7200           	moveq #0,d1
     228:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     22c:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
     232:	43f9 0001 20b0 	lea 120b0 <incbin_swfont_end+0x94>,a1
     238:	7000           	moveq #0,d0
     23a:	4eae fdd8      	jsr -552(a6)
     23e:	23c0 0001 5346 	move.l d0,15346 <DOSBase>
	if (!DOSBase)
     244:	6600 fe0a      	bne.w 50 <main+0x4a>
     248:	60c4           	bra.s 20e <main+0x208>
     24a:	4e71           	nop

0000024c <Zoom_ZoomIntoPicture.constprop.0>:
  WaitBlt();
  hw->bltcon0 = 0x9f0 + shiftright;
  hw->bltcon1 = 0;
}

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
     24c:	4fef ffec      	lea -20(sp),sp
     250:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
     254:	242f 004c      	move.l 76(sp),d2
     258:	3202           	move.w d2,d1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     25a:	2079 0001 5352 	movea.l 15352 <hw>,a0
     260:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     264:	3028 0002      	move.w 2(a0),d0
     268:	0240 4000      	andi.w #16384,d0
     26c:	66f6           	bne.s 264 <Zoom_ZoomIntoPicture.constprop.0+0x18>
     26e:	3f40 003a      	move.w d0,58(sp)
  hw->bltafwm = 0xffff;
     272:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     278:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     27e:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     284:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     28a:	317c 002c 0066 	move.w #44,102(a0)
  WaitBlt();  
  Init_Blit();
  WORD shiftright = 9;
  UWORD shifthoriz = 7;
  UWORD startofword = 21*16;
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
     290:	3a02           	move.w d2,d5
     292:	da42           	add.w d2,d5
     294:	3245           	movea.w d5,a1
     296:	d2c5           	adda.w d5,a1
     298:	d2c2           	adda.w d2,a1
     29a:	3009           	move.w a1,d0
     29c:	d049           	add.w a1,d0
     29e:	3a40           	movea.w d0,a5
     2a0:	4bed 014c      	lea 332(a5),a5
  while( nextzoom > 22 * 16) {
     2a4:	303c 0160      	move.w #352,d0
  WORD shiftright = 9;
     2a8:	7e09           	moveq #9,d7
  while( nextzoom > 22 * 16) {
     2aa:	b04d           	cmp.w a5,d0
     2ac:	6c12           	bge.s 2c0 <Zoom_ZoomIntoPicture.constprop.0+0x74>
  WORD shiftright = 9;
     2ae:	300d           	move.w a5,d0
     2b0:	0640 ffed      	addi.w #-19,d0
     2b4:	9041           	sub.w d1,d0
     2b6:	5347           	subq.w #1,d7
  while( nextzoom > 22 * 16) {
     2b8:	0c40 0160      	cmpi.w #352,d0
     2bc:	6ef2           	bgt.s 2b0 <Zoom_ZoomIntoPicture.constprop.0+0x64>
     2be:	3a40           	movea.w d0,a5
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
     2c0:	7012           	moveq #18,d0
     2c2:	9049           	sub.w a1,d0
     2c4:	3f40 0038      	move.w d0,56(sp)
  while( ZoomHorizontalStart < 0) {
     2c8:	6c00 034c      	bge.w 616 <Zoom_ZoomIntoPicture.constprop.0+0x3ca>
     2cc:	3600           	move.w d0,d3
  UWORD shifthoriz = 7;
     2ce:	7007           	moveq #7,d0
     2d0:	0643 0013      	addi.w #19,d3
     2d4:	d641           	add.w d1,d3
      ZoomHorizontalStart += 1 + 18 + zoomnr;
      shifthoriz--;
     2d6:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
     2d8:	4a43           	tst.w d3
     2da:	6df4           	blt.s 2d0 <Zoom_ZoomIntoPicture.constprop.0+0x84>
     2dc:	3f43 0038      	move.w d3,56(sp)
     2e0:	c0fc 0078      	mulu.w #120,d0
     2e4:	327c 0016      	movea.w #22,a1
     2e8:	d3c0           	adda.l d0,a1
          linesleft--;
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
        pos4source += size4blit;
        pos4dest += size4blit + onestep;   
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     2ea:	9a42           	sub.w d2,d5
     2ec:	0645 0012      	addi.w #18,d5
     2f0:	d3c9           	adda.l a1,a1
     2f2:	d3ef 0044      	adda.l 68(sp),a1
     2f6:	2f49 0032      	move.l a1,50(sp)
     2fa:	702c           	moveq #44,d0
     2fc:	d0af 0048      	add.l 72(sp),d0
     300:	2f40 002e      	move.l d0,46(sp)
  UWORD startofword = 21*16;
     304:	3c7c 0150      	movea.w #336,a6
      nextzoom -= (19 + zoomnr);
     308:	70ed           	moveq #-19,d0
     30a:	9041           	sub.w d1,d0
     30c:	3f40 003e      	move.w d0,62(sp)
    ZoomHorizontal = ZoomHorizontalStart;
     310:	33ef 0038 0001 	move.w 56(sp),15350 <ZoomHorizontal>
     316:	5350 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
     318:	242f 0032      	move.l 50(sp),d2
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
     31c:	262f 002e      	move.l 46(sp),d3
     320:	3f47 0036      	move.w d7,54(sp)
     324:	3207           	move.w d7,d1
     326:	700c           	moveq #12,d0
     328:	e169           	lsl.w d0,d1
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
     32a:	7000           	moveq #0,d0
     32c:	300e           	move.w a6,d0
     32e:	324d           	movea.w a5,a1
     330:	b3c0           	cmpa.l d0,a1
     332:	6e00 014a      	bgt.w 47e <Zoom_ZoomIntoPicture.constprop.0+0x232>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     336:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     33a:	3028 0002      	move.w 2(a0),d0
     33e:	0800 000e      	btst #14,d0
     342:	66f6           	bne.s 33a <Zoom_ZoomIntoPicture.constprop.0+0xee>
  hw->bltcon0 = 0x9f0 + shiftright;
     344:	0641 09f0      	addi.w #2544,d1
     348:	3141 0040      	move.w d1,64(a0)
  hw->bltcon1 = 0;
     34c:	317c 0000 0042 	move.w #0,66(a0)
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     352:	7200           	moveq #0,d1
     354:	322f 003a      	move.w 58(sp),d1
     358:	2641           	movea.l d1,a3
     35a:	45f3 b800      	lea (0,a3,a3.l),a2
     35e:	322f 0038      	move.w 56(sp),d1
    WORD linesleft = 272;
     362:	383c 0110      	move.w #272,d4
     366:	3c04           	move.w d4,d6
        if( linesleft >= ZoomHorizontal+1) {
     368:	b244           	cmp.w d4,d1
     36a:	6c00 009e      	bge.w 40a <Zoom_ZoomIntoPicture.constprop.0+0x1be>
          linesleft -= ZoomHorizontal;
     36e:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep; 
     370:	3001           	move.w d1,d0
     372:	c1fc 0078      	muls.w #120,d0
     376:	0280 0000 ffff 	andi.l #65535,d0
     37c:	2240           	movea.l d0,a1
     37e:	d3c0           	adda.l d0,a1
        if( linesleft>0) {
     380:	4a44           	tst.w d4
     382:	6f00 00e0      	ble.w 464 <Zoom_ZoomIntoPicture.constprop.0+0x218>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
     386:	220b           	move.l a3,d1
     388:	d280           	add.l d0,d1
     38a:	d281           	add.l d1,d1
     38c:	d282           	add.l d2,d1
          UWORD *tmpdest = pos4dest +  size4blit;
     38e:	49f1 3800      	lea (0,a1,d3.l),a4
  *bp = 0;
     392:	4278 0200      	clr.w 200 <main+0x1fa>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     396:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     39a:	3c28 0002      	move.w 2(a0),d6
     39e:	0806 000e      	btst #14,d6
     3a2:	66f6           	bne.s 39a <Zoom_ZoomIntoPicture.constprop.0+0x14e>
  hw->bltapt = (UWORD *) source;
     3a4:	2141 0050      	move.l d1,80(a0)
  hw->bltdpt = (UWORD *) destination;
     3a8:	214c 0054      	move.l a4,84(a0)
  hw->bltsize = (height<<6)+2;
     3ac:	317c 0142 0058 	move.w #322,88(a0)
          linesleft--;
     3b2:	5344           	subq.w #1,d4
     3b4:	3c39 0001 5350 	move.w 15350 <ZoomHorizontal>,d6
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     3ba:	3206           	move.w d6,d1
     3bc:	d246           	add.w d6,d1
     3be:	d241           	add.w d1,d1
     3c0:	d246           	add.w d6,d1
     3c2:	49f2 2800      	lea (0,a2,d2.l),a4
  *bp = 0;
     3c6:	4278 0200      	clr.w 200 <main+0x1fa>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     3ca:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     3ce:	3c28 0002      	move.w 2(a0),d6
     3d2:	0806 000e      	btst #14,d6
     3d6:	66f6           	bne.s 3ce <Zoom_ZoomIntoPicture.constprop.0+0x182>
  hw->bltapt = (UWORD *) source;
     3d8:	214c 0050      	move.l a4,80(a0)
  hw->bltdpt = (UWORD *) destination;
     3dc:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = (height<<6)+2;
     3e0:	ed49           	lsl.w #6,d1
     3e2:	5441           	addq.w #2,d1
     3e4:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
     3e8:	d489           	add.l a1,d2
        pos4dest += size4blit + onestep; 
     3ea:	327c 0078      	movea.w #120,a1
     3ee:	d3c0           	adda.l d0,a1
     3f0:	2009           	move.l a1,d0
     3f2:	d089           	add.l a1,d0
     3f4:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     3f6:	33c5 0001 5350 	move.w d5,15350 <ZoomHorizontal>
      while(linesleft > 0) {
     3fc:	4a44           	tst.w d4
     3fe:	6f46           	ble.s 446 <Zoom_ZoomIntoPicture.constprop.0+0x1fa>
     400:	3205           	move.w d5,d1
     402:	3c04           	move.w d4,d6
        if( linesleft >= ZoomHorizontal+1) {
     404:	b244           	cmp.w d4,d1
     406:	6d00 ff66      	blt.w 36e <Zoom_ZoomIntoPicture.constprop.0+0x122>
        UWORD size4blit = ZoomHorizontal*onestep; 
     40a:	3004           	move.w d4,d0
     40c:	c1fc 0078      	muls.w #120,d0
     410:	0280 0000 ffff 	andi.l #65535,d0
     416:	2240           	movea.l d0,a1
     418:	d3c0           	adda.l d0,a1
          linesleft = 0;
     41a:	4244           	clr.w d4
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     41c:	3206           	move.w d6,d1
     41e:	d246           	add.w d6,d1
     420:	d241           	add.w d1,d1
     422:	d246           	add.w d6,d1
     424:	49f2 2800      	lea (0,a2,d2.l),a4
  *bp = 0;
     428:	4278 0200      	clr.w 200 <main+0x1fa>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     42c:	3c28 0002      	move.w 2(a0),d6
     430:	609c           	bra.s 3ce <Zoom_ZoomIntoPicture.constprop.0+0x182>
      }
      shiftright--;  
     432:	3e2f 003c      	move.w 60(sp),d7
      if(shiftright < 0) {
     436:	6c0e           	bge.s 446 <Zoom_ZoomIntoPicture.constprop.0+0x1fa>
        shiftright += 16;
     438:	3e2f 0036      	move.w 54(sp),d7
     43c:	0647 000f      	addi.w #15,d7
        shifttoleft = 1;
     440:	3f7c 0001 003a 	move.w #1,58(sp)
      }
    }
    startofword -= 16;
     446:	4dee fff0      	lea -16(a6),a6
     44a:	55af 0032      	subq.l #2,50(sp)
     44e:	55af 002e      	subq.l #2,46(sp)
  for(int i=0;i<22;i++) {
     452:	72f0           	moveq #-16,d1
     454:	b24e           	cmp.w a6,d1
     456:	6600 feb8      	bne.w 310 <Zoom_ZoomIntoPicture.constprop.0+0xc4>
  }
  //ZoomHorizontal = 10;
}
     45a:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     45e:	4fef 0014      	lea 20(sp),sp
     462:	4e75           	rts
        if( linesleft>0) {
     464:	3c01           	move.w d1,d6
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     466:	3206           	move.w d6,d1
     468:	d246           	add.w d6,d1
     46a:	d241           	add.w d1,d1
     46c:	d246           	add.w d6,d1
     46e:	49f2 2800      	lea (0,a2,d2.l),a4
  *bp = 0;
     472:	4278 0200      	clr.w 200 <main+0x1fa>
     476:	3c28 0002      	move.w 2(a0),d6
     47a:	6000 ff52      	bra.w 3ce <Zoom_ZoomIntoPicture.constprop.0+0x182>
     47e:	3007           	move.w d7,d0
  UWORD colnr = nextzoom - startofword - 1;                                                                          
     480:	324d           	movea.w a5,a1
     482:	92ce           	suba.w a6,a1
     484:	5349           	subq.w #1,a1
     486:	5340           	subq.w #1,d0
     488:	3f40 003c      	move.w d0,60(sp)
  if( shiftright == 0) {
     48c:	4a6f 0036      	tst.w 54(sp)
     490:	6600 016c      	bne.w 5fe <Zoom_ZoomIntoPicture.constprop.0+0x3b2>
    ZoomBlit_Increment4SrcA = 1;
     494:	33fc 0001 0001 	move.w #1,1534e <ZoomBlit_Increment4SrcA>
     49a:	534e 
     49c:	383c fde4      	move.w #-540,d4
     4a0:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     4a4:	3028 0002      	move.w 2(a0),d0
     4a8:	0800 000e      	btst #14,d0
     4ac:	66f6           	bne.s 4a4 <Zoom_ZoomIntoPicture.constprop.0+0x258>
  hw->bltcon1 = shiftb; 
     4ae:	3141 0042      	move.w d1,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     4b2:	3144 0040      	move.w d4,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     4b6:	7000           	moveq #0,d0
     4b8:	3009           	move.w a1,d0
     4ba:	7210           	moveq #16,d1
     4bc:	9280           	sub.l d0,d1
     4be:	2001           	move.l d1,d0
     4c0:	7200           	moveq #0,d1
     4c2:	4641           	not.w d1
     4c4:	e1a9           	lsl.l d0,d1
     4c6:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
     4ca:	daef 003e      	adda.w 62(sp),a5
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     4ce:	7000           	moveq #0,d0
     4d0:	302f 003a      	move.w 58(sp),d0
     4d4:	2840           	movea.l d0,a4
     4d6:	47f4 c800      	lea (0,a4,a4.l),a3
     4da:	322f 0038      	move.w 56(sp),d1
    WORD linesleft = 272;
     4de:	383c 0110      	move.w #272,d4
     4e2:	3e04           	move.w d4,d7
     4e4:	7c00           	moveq #0,d6
     4e6:	3c39 0001 534e 	move.w 1534e <ZoomBlit_Increment4SrcA>,d6
     4ec:	dc86           	add.l d6,d6
        if( linesleft >= ZoomHorizontal+1) {
     4ee:	b244           	cmp.w d4,d1
     4f0:	6c00 00c2      	bge.w 5b4 <Zoom_ZoomIntoPicture.constprop.0+0x368>
          linesleft -= ZoomHorizontal;
     4f4:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep;
     4f6:	3001           	move.w d1,d0
     4f8:	c1fc 0078      	muls.w #120,d0
     4fc:	0280 0000 ffff 	andi.l #65535,d0
     502:	2240           	movea.l d0,a1
     504:	d3c0           	adda.l d0,a1
        if( linesleft>0) {
     506:	4a44           	tst.w d4
     508:	6f00 00d6      	ble.w 5e0 <Zoom_ZoomIntoPicture.constprop.0+0x394>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
     50c:	220c           	move.l a4,d1
     50e:	d280           	add.l d0,d1
     510:	d281           	add.l d1,d1
     512:	d282           	add.l d2,d1
          UWORD *tmpdest = pos4dest + size4blit;
     514:	45f1 3800      	lea (0,a1,d3.l),a2
  ULONG blta = source + ZoomBlit_Increment4SrcA;
     518:	dc81           	add.l d1,d6
  *bp = 0;
     51a:	4278 0200      	clr.w 200 <main+0x1fa>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     51e:	3e28 0002      	move.w 2(a0),d7
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     522:	3e28 0002      	move.w 2(a0),d7
     526:	0807 000e      	btst #14,d7
     52a:	66f6           	bne.s 522 <Zoom_ZoomIntoPicture.constprop.0+0x2d6>
  hw->bltapt = blta;
     52c:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
     530:	2141 004c      	move.l d1,76(a0)
  hw->bltdpt = destination;
     534:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = (height<<6)+2;
     538:	317c 0142 0058 	move.w #322,88(a0)
          linesleft--;
     53e:	5344           	subq.w #1,d4
     540:	3e39 0001 5350 	move.w 15350 <ZoomHorizontal>,d7
     546:	7c00           	moveq #0,d6
     548:	3c39 0001 534e 	move.w 1534e <ZoomBlit_Increment4SrcA>,d6
     54e:	dc86           	add.l d6,d6
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     550:	3207           	move.w d7,d1
     552:	d247           	add.w d7,d1
     554:	d241           	add.w d1,d1
     556:	d247           	add.w d7,d1
     558:	2e02           	move.l d2,d7
     55a:	de8b           	add.l a3,d7
  ULONG blta = source + ZoomBlit_Increment4SrcA;
     55c:	2447           	movea.l d7,a2
     55e:	d5c6           	adda.l d6,a2
  *bp = 0;
     560:	4278 0200      	clr.w 200 <main+0x1fa>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     564:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     568:	3c28 0002      	move.w 2(a0),d6
     56c:	0806 000e      	btst #14,d6
     570:	66f6           	bne.s 568 <Zoom_ZoomIntoPicture.constprop.0+0x31c>
  hw->bltapt = blta;
     572:	214a 0050      	move.l a2,80(a0)
  hw->bltbpt = source;
     576:	2147 004c      	move.l d7,76(a0)
  hw->bltdpt = destination;
     57a:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = (height<<6)+2;
     57e:	ed49           	lsl.w #6,d1
     580:	5441           	addq.w #2,d1
     582:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
     586:	d489           	add.l a1,d2
        pos4dest += size4blit + onestep;   
     588:	327c 0078      	movea.w #120,a1
     58c:	d3c0           	adda.l d0,a1
     58e:	2009           	move.l a1,d0
     590:	d089           	add.l a1,d0
     592:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     594:	33c5 0001 5350 	move.w d5,15350 <ZoomHorizontal>
      while( linesleft > 0) {
     59a:	4a44           	tst.w d4
     59c:	6f00 fe94      	ble.w 432 <Zoom_ZoomIntoPicture.constprop.0+0x1e6>
     5a0:	3205           	move.w d5,d1
     5a2:	3e04           	move.w d4,d7
     5a4:	7c00           	moveq #0,d6
     5a6:	3c39 0001 534e 	move.w 1534e <ZoomBlit_Increment4SrcA>,d6
     5ac:	dc86           	add.l d6,d6
        if( linesleft >= ZoomHorizontal+1) {
     5ae:	b244           	cmp.w d4,d1
     5b0:	6d00 ff42      	blt.w 4f4 <Zoom_ZoomIntoPicture.constprop.0+0x2a8>
        UWORD size4blit = ZoomHorizontal*onestep;
     5b4:	3004           	move.w d4,d0
     5b6:	c1fc 0078      	muls.w #120,d0
     5ba:	0280 0000 ffff 	andi.l #65535,d0
     5c0:	2240           	movea.l d0,a1
     5c2:	d3c0           	adda.l d0,a1
          linesleft = 0;
     5c4:	4244           	clr.w d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     5c6:	3207           	move.w d7,d1
     5c8:	d247           	add.w d7,d1
     5ca:	d241           	add.w d1,d1
     5cc:	d247           	add.w d7,d1
     5ce:	2e02           	move.l d2,d7
     5d0:	de8b           	add.l a3,d7
  ULONG blta = source + ZoomBlit_Increment4SrcA;
     5d2:	2447           	movea.l d7,a2
     5d4:	d5c6           	adda.l d6,a2
  *bp = 0;
     5d6:	4278 0200      	clr.w 200 <main+0x1fa>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     5da:	3c28 0002      	move.w 2(a0),d6
     5de:	6088           	bra.s 568 <Zoom_ZoomIntoPicture.constprop.0+0x31c>
        if( linesleft>0) {
     5e0:	3e01           	move.w d1,d7
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     5e2:	3207           	move.w d7,d1
     5e4:	d247           	add.w d7,d1
     5e6:	d241           	add.w d1,d1
     5e8:	d247           	add.w d7,d1
     5ea:	2e02           	move.l d2,d7
     5ec:	de8b           	add.l a3,d7
  ULONG blta = source + ZoomBlit_Increment4SrcA;
     5ee:	2447           	movea.l d7,a2
     5f0:	d5c6           	adda.l d6,a2
  *bp = 0;
     5f2:	4278 0200      	clr.w 200 <main+0x1fa>
     5f6:	3c28 0002      	move.w 2(a0),d6
     5fa:	6000 ff6c      	bra.w 568 <Zoom_ZoomIntoPicture.constprop.0+0x31c>
     5fe:	3800           	move.w d0,d4
  ZoomBlit_Increment4SrcA = 0;
     600:	4279 0001 534e 	clr.w 1534e <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
     606:	700c           	moveq #12,d0
     608:	e16c           	lsl.w d0,d4
     60a:	0644 0de4      	addi.w #3556,d4
     60e:	3028 0002      	move.w 2(a0),d0
     612:	6000 fe90      	bra.w 4a4 <Zoom_ZoomIntoPicture.constprop.0+0x258>
  while( ZoomHorizontalStart < 0) {
     616:	327c 035e      	movea.w #862,a1
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     61a:	9a42           	sub.w d2,d5
     61c:	0645 0012      	addi.w #18,d5
     620:	d3c9           	adda.l a1,a1
     622:	d3ef 0044      	adda.l 68(sp),a1
     626:	2f49 0032      	move.l a1,50(sp)
     62a:	702c           	moveq #44,d0
     62c:	d0af 0048      	add.l 72(sp),d0
     630:	2f40 002e      	move.l d0,46(sp)
  UWORD startofword = 21*16;
     634:	3c7c 0150      	movea.w #336,a6
      nextzoom -= (19 + zoomnr);
     638:	70ed           	moveq #-19,d0
     63a:	9041           	sub.w d1,d0
     63c:	3f40 003e      	move.w d0,62(sp)
     640:	6000 fcce      	bra.w 310 <Zoom_ZoomIntoPicture.constprop.0+0xc4>

00000644 <ClbuildZoom>:
ULONG * ClbuildZoom() {
     644:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
     648:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
     64e:	203c 0000 031c 	move.l #796,d0
     654:	7202           	moveq #2,d1
     656:	4eae ff3a      	jsr -198(a6)
     65a:	2440           	movea.l d0,a2
  if( retval == 0) {
     65c:	4a80           	tst.l d0
     65e:	6700 01ea      	beq.w 84a <ClbuildZoom+0x206>
    *cl++ = *clpartinstruction++;
     662:	24b9 0001 52ac 	move.l 152ac <ClsSprites>,(a2)
     668:	2579 0001 52b0 	move.l 152b0 <ClsSprites+0x4>,4(a2)
     66e:	0004 
     670:	2579 0001 52b4 	move.l 152b4 <ClsSprites+0x8>,8(a2)
     676:	0008 
     678:	2579 0001 52b8 	move.l 152b8 <ClsSprites+0xc>,12(a2)
     67e:	000c 
     680:	2579 0001 52bc 	move.l 152bc <ClsSprites+0x10>,16(a2)
     686:	0010 
     688:	2579 0001 52c0 	move.l 152c0 <ClsSprites+0x14>,20(a2)
     68e:	0014 
     690:	2579 0001 52c4 	move.l 152c4 <ClsSprites+0x18>,24(a2)
     696:	0018 
     698:	2579 0001 52c8 	move.l 152c8 <ClsSprites+0x1c>,28(a2)
     69e:	001c 
     6a0:	2579 0001 52cc 	move.l 152cc <ClsSprites+0x20>,32(a2)
     6a6:	0020 
     6a8:	2579 0001 52d0 	move.l 152d0 <ClsSprites+0x24>,36(a2)
     6ae:	0024 
     6b0:	2579 0001 52d4 	move.l 152d4 <ClsSprites+0x28>,40(a2)
     6b6:	0028 
     6b8:	2579 0001 52d8 	move.l 152d8 <ClsSprites+0x2c>,44(a2)
     6be:	002c 
     6c0:	2579 0001 52dc 	move.l 152dc <ClsSprites+0x30>,48(a2)
     6c6:	0030 
     6c8:	2579 0001 52e0 	move.l 152e0 <ClsSprites+0x34>,52(a2)
     6ce:	0034 
     6d0:	2579 0001 52e4 	move.l 152e4 <ClsSprites+0x38>,56(a2)
     6d6:	0038 
     6d8:	2579 0001 52e8 	move.l 152e8 <ClsSprites+0x3c>,60(a2)
     6de:	003c 
    *cl++ = *clpartinstruction++;
     6e0:	2579 0001 527c 	move.l 1527c <ClScreen>,64(a2)
     6e6:	0040 
     6e8:	2579 0001 5280 	move.l 15280 <ClScreen+0x4>,68(a2)
     6ee:	0044 
     6f0:	2579 0001 5284 	move.l 15284 <ClScreen+0x8>,72(a2)
     6f6:	0048 
     6f8:	2579 0001 5288 	move.l 15288 <ClScreen+0xc>,76(a2)
     6fe:	004c 
     700:	2579 0001 528c 	move.l 1528c <ClScreen+0x10>,80(a2)
     706:	0050 
     708:	2579 0001 5290 	move.l 15290 <ClScreen+0x14>,84(a2)
     70e:	0054 
     710:	2579 0001 5294 	move.l 15294 <ClScreen+0x18>,88(a2)
     716:	0058 
     718:	2579 0001 5298 	move.l 15298 <ClScreen+0x1c>,92(a2)
     71e:	005c 
     720:	2579 0001 529c 	move.l 1529c <ClScreen+0x20>,96(a2)
     726:	0060 
     728:	2579 0001 52a0 	move.l 152a0 <ClScreen+0x24>,100(a2)
     72e:	0064 
     730:	2579 0001 52a4 	move.l 152a4 <ClScreen+0x28>,104(a2)
     736:	0068 
     738:	2579 0001 52a8 	move.l 152a8 <ClScreen+0x2c>,108(a2)
     73e:	006c 
  *cl++ = 0x00e00000;
     740:	257c 00e0 0000 	move.l #14680064,112(a2)
     746:	0070 
  *cl++ = 0x00e20000;
     748:	257c 00e2 0000 	move.l #14811136,116(a2)
     74e:	0074 
  *cl++ = 0x00e40000;
     750:	257c 00e4 0000 	move.l #14942208,120(a2)
     756:	0078 
  *cl++ = 0x00e60000;
     758:	257c 00e6 0000 	move.l #15073280,124(a2)
     75e:	007c 
  *cl++ = 0x00e80000;
     760:	257c 00e8 0000 	move.l #15204352,128(a2)
     766:	0080 
  *cl++ = 0x00ea0000;
     768:	257c 00ea 0000 	move.l #15335424,132(a2)
     76e:	0084 
  *cl++ = 0x00ec0000;
     770:	257c 00ec 0000 	move.l #15466496,136(a2)
     776:	0088 
  *cl++ = 0x00ee0000;
     778:	257c 00ee 0000 	move.l #15597568,140(a2)
     77e:	008c 
  *cl++ = 0x00f00000;
     780:	257c 00f0 0000 	move.l #15728640,144(a2)
     786:	0090 
  *cl++ = 0x00f20000;
     788:	257c 00f2 0000 	move.l #15859712,148(a2)
     78e:	0094 
  for(int i=0; i<32;i++)
     790:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
     794:	41f9 0001 51fc 	lea 151fc <ClColor>,a0
    *cl++ = *clpartinstruction++;
     79a:	22d8           	move.l (a0)+,(a1)+
  for(int i=0; i<32;i++)
     79c:	b1fc 0001 527c 	cmpa.l #86652,a0
     7a2:	66f6           	bne.s 79a <ClbuildZoom+0x156>
  ULONG cop2 = cl+3;
     7a4:	200a           	move.l a2,d0
     7a6:	0680 0000 0124 	addi.l #292,d0
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
     7ac:	2200           	move.l d0,d1
     7ae:	4241           	clr.w d1
     7b0:	4841           	swap d1
     7b2:	0681 0084 0000 	addi.l #8650752,d1
     7b8:	2541 0118      	move.l d1,280(a2)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
     7bc:	2200           	move.l d0,d1
     7be:	0281 0000 ffff 	andi.l #65535,d1
     7c4:	0681 0086 0000 	addi.l #8781824,d1
     7ca:	2541 011c      	move.l d1,284(a2)
  *cl++ = 0x2c01ff00;
     7ce:	257c 2c01 ff00 	move.l #738328320,288(a2)
     7d4:	0120 
  ULONG cop2br1 = cop2 + ( (30)<<2);
     7d6:	7278           	moveq #120,d1
     7d8:	d280           	add.l d0,d1
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
     7da:	2401           	move.l d1,d2
     7dc:	4242           	clr.w d2
     7de:	4842           	swap d2
     7e0:	0682 0084 0000 	addi.l #8650752,d2
     7e6:	23c2 0001 5050 	move.l d2,15050 <Cl102ZoomRepeat+0x70>
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
     7ec:	0281 0000 ffff 	andi.l #65535,d1
     7f2:	0681 0086 0000 	addi.l #8781824,d1
     7f8:	23c1 0001 5054 	move.l d1,15054 <Cl102ZoomRepeat+0x74>
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
     7fe:	220a           	move.l a2,d1
     800:	0681 0000 027c 	addi.l #636,d1
     806:	2401           	move.l d1,d2
     808:	4242           	clr.w d2
     80a:	4842           	swap d2
     80c:	0682 0084 0000 	addi.l #8650752,d2
     812:	23c2 0001 5130 	move.l d2,15130 <Cl102ZoomRepeat+0x150>
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
     818:	0281 0000 ffff 	andi.l #65535,d1
     81e:	0681 0086 0000 	addi.l #8781824,d1
     824:	23c1 0001 5134 	move.l d1,15134 <Cl102ZoomRepeat+0x154>
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
     82a:	2240           	movea.l d0,a1
  clpartinstruction = Cl102ZoomRepeat;
     82c:	41f9 0001 4fe0 	lea 14fe0 <Cl102ZoomRepeat>,a0
    *cl++ = *clpartinstruction++;
     832:	22d8           	move.l (a0)+,(a1)+
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
     834:	b1fc 0001 51a8 	cmpa.l #86440,a0
     83a:	66f6           	bne.s 832 <ClbuildZoom+0x1ee>
   *cl++ = 0xfffffffe;
     83c:	70fe           	moveq #-2,d0
     83e:	2540 02ec      	move.l d0,748(a2)
}
     842:	200a           	move.l a2,d0
     844:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     848:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     84a:	2c79 0001 5346 	movea.l 15346 <DOSBase>,a6
     850:	4eae ffc4      	jsr -60(a6)
     854:	2c79 0001 5346 	movea.l 15346 <DOSBase>,a6
     85a:	2200           	move.l d0,d1
     85c:	243c 0001 201d 	move.l #73757,d2
     862:	7628           	moveq #40,d3
     864:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     868:	2c79 0001 5346 	movea.l 15346 <DOSBase>,a6
     86e:	7201           	moveq #1,d1
     870:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     874:	24b9 0001 52ac 	move.l 152ac <ClsSprites>,(a2)
     87a:	2579 0001 52b0 	move.l 152b0 <ClsSprites+0x4>,4(a2)
     880:	0004 
     882:	2579 0001 52b4 	move.l 152b4 <ClsSprites+0x8>,8(a2)
     888:	0008 
     88a:	2579 0001 52b8 	move.l 152b8 <ClsSprites+0xc>,12(a2)
     890:	000c 
     892:	2579 0001 52bc 	move.l 152bc <ClsSprites+0x10>,16(a2)
     898:	0010 
     89a:	2579 0001 52c0 	move.l 152c0 <ClsSprites+0x14>,20(a2)
     8a0:	0014 
     8a2:	2579 0001 52c4 	move.l 152c4 <ClsSprites+0x18>,24(a2)
     8a8:	0018 
     8aa:	2579 0001 52c8 	move.l 152c8 <ClsSprites+0x1c>,28(a2)
     8b0:	001c 
     8b2:	2579 0001 52cc 	move.l 152cc <ClsSprites+0x20>,32(a2)
     8b8:	0020 
     8ba:	2579 0001 52d0 	move.l 152d0 <ClsSprites+0x24>,36(a2)
     8c0:	0024 
     8c2:	2579 0001 52d4 	move.l 152d4 <ClsSprites+0x28>,40(a2)
     8c8:	0028 
     8ca:	2579 0001 52d8 	move.l 152d8 <ClsSprites+0x2c>,44(a2)
     8d0:	002c 
     8d2:	2579 0001 52dc 	move.l 152dc <ClsSprites+0x30>,48(a2)
     8d8:	0030 
     8da:	2579 0001 52e0 	move.l 152e0 <ClsSprites+0x34>,52(a2)
     8e0:	0034 
     8e2:	2579 0001 52e4 	move.l 152e4 <ClsSprites+0x38>,56(a2)
     8e8:	0038 
     8ea:	2579 0001 52e8 	move.l 152e8 <ClsSprites+0x3c>,60(a2)
     8f0:	003c 
    *cl++ = *clpartinstruction++;
     8f2:	2579 0001 527c 	move.l 1527c <ClScreen>,64(a2)
     8f8:	0040 
     8fa:	2579 0001 5280 	move.l 15280 <ClScreen+0x4>,68(a2)
     900:	0044 
     902:	2579 0001 5284 	move.l 15284 <ClScreen+0x8>,72(a2)
     908:	0048 
     90a:	2579 0001 5288 	move.l 15288 <ClScreen+0xc>,76(a2)
     910:	004c 
     912:	2579 0001 528c 	move.l 1528c <ClScreen+0x10>,80(a2)
     918:	0050 
     91a:	2579 0001 5290 	move.l 15290 <ClScreen+0x14>,84(a2)
     920:	0054 
     922:	2579 0001 5294 	move.l 15294 <ClScreen+0x18>,88(a2)
     928:	0058 
     92a:	2579 0001 5298 	move.l 15298 <ClScreen+0x1c>,92(a2)
     930:	005c 
     932:	2579 0001 529c 	move.l 1529c <ClScreen+0x20>,96(a2)
     938:	0060 
     93a:	2579 0001 52a0 	move.l 152a0 <ClScreen+0x24>,100(a2)
     940:	0064 
     942:	2579 0001 52a4 	move.l 152a4 <ClScreen+0x28>,104(a2)
     948:	0068 
     94a:	2579 0001 52a8 	move.l 152a8 <ClScreen+0x2c>,108(a2)
     950:	006c 
  *cl++ = 0x00e00000;
     952:	257c 00e0 0000 	move.l #14680064,112(a2)
     958:	0070 
  *cl++ = 0x00e20000;
     95a:	257c 00e2 0000 	move.l #14811136,116(a2)
     960:	0074 
  *cl++ = 0x00e40000;
     962:	257c 00e4 0000 	move.l #14942208,120(a2)
     968:	0078 
  *cl++ = 0x00e60000;
     96a:	257c 00e6 0000 	move.l #15073280,124(a2)
     970:	007c 
  *cl++ = 0x00e80000;
     972:	257c 00e8 0000 	move.l #15204352,128(a2)
     978:	0080 
  *cl++ = 0x00ea0000;
     97a:	257c 00ea 0000 	move.l #15335424,132(a2)
     980:	0084 
  *cl++ = 0x00ec0000;
     982:	257c 00ec 0000 	move.l #15466496,136(a2)
     988:	0088 
  *cl++ = 0x00ee0000;
     98a:	257c 00ee 0000 	move.l #15597568,140(a2)
     990:	008c 
  *cl++ = 0x00f00000;
     992:	257c 00f0 0000 	move.l #15728640,144(a2)
     998:	0090 
  *cl++ = 0x00f20000;
     99a:	257c 00f2 0000 	move.l #15859712,148(a2)
     9a0:	0094 
  for(int i=0; i<32;i++)
     9a2:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
     9a6:	41f9 0001 51fc 	lea 151fc <ClColor>,a0
     9ac:	6000 fdec      	bra.w 79a <ClbuildZoom+0x156>

000009b0 <Zoom_VblankHandler>:
void Zoom_VblankHandler() {
     9b0:	2f0a           	move.l a2,-(sp)
  Zoom_Counter++;
     9b2:	5279 0001 5344 	addq.w #1,15344 <Zoom_Counter>
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;
}

void SwapCl() {
  ULONG tmp = (ULONG) DrawCopper;
     9b8:	2039 0001 531c 	move.l 1531c <DrawCopper>,d0
  DrawCopper = ViewCopper;
     9be:	2079 0001 5324 	movea.l 15324 <ViewCopper>,a0
     9c4:	23c8 0001 531c 	move.l a0,1531c <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     9ca:	23c0 0001 5324 	move.l d0,15324 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     9d0:	2279 0001 5352 	movea.l 15352 <hw>,a1
     9d6:	2340 0080      	move.l d0,128(a1)
  hw->copjmp1 = tmp;
     9da:	3340 0088      	move.w d0,136(a1)
  Zoom_MouseReleased = 1;
     9de:	33fc 0001 0001 	move.w #1,15316 <Zoom_MouseReleased>
     9e4:	5316 
void Utils_CopyMem( ULONG *source, ULONG *destination, ULONG size) {
  for( int i=0;i<size;i++) 
    *destination++ = *source++;  
}

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     9e6:	1039 00bf e001 	move.b bfe001 <gcc8_c_support.c.e9862530+0xbd60de>,d0
  if( MouseLeft())
     9ec:	0800 0006      	btst #6,d0
     9f0:	6600 0394      	bne.w d86 <Zoom_VblankHandler+0x3d6>
    Zoom_Mousepressed = 1;
     9f4:	33fc 0001 0001 	move.w #1,15314 <Zoom_Mousepressed>
     9fa:	5314 
     9fc:	1039 00bf e001 	move.b bfe001 <gcc8_c_support.c.e9862530+0xbd60de>,d0
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     a02:	0800 0006      	btst #6,d0
     a06:	6600 06c4      	bne.w 10cc <Zoom_VblankHandler+0x71c>
      Zoom_MouseReleased = 0;
     a0a:	4279 0001 5316 	clr.w 15316 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 0) {
     a10:	3039 0001 5342 	move.w 15342 <Zoom_LevelOf102Zoom>,d0
     a16:	2479 0001 5320 	movea.l 15320 <ViewBuffer>,a2
     a1c:	6600 038a      	bne.w da8 <Zoom_VblankHandler+0x3f8>
        if( Zoom_LevelOfZoom == 17)
     a20:	3039 0001 532c 	move.w 1532c <Zoom_LevelOfZoom>,d0
     a26:	0c40 0011      	cmpi.w #17,d0
     a2a:	6700 06aa      	beq.w 10d6 <Zoom_VblankHandler+0x726>
          Zoom_LevelOfZoom++;
     a2e:	3039 0001 532c 	move.w 1532c <Zoom_LevelOfZoom>,d0
     a34:	5240           	addq.w #1,d0
     a36:	33c0 0001 532c 	move.w d0,1532c <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = MaxZoom102[Zoom_LevelOfZoom] - 2;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     a3c:	3039 0001 532c 	move.w 1532c <Zoom_LevelOfZoom>,d0
     a42:	0280 0000 ffff 	andi.l #65535,d0
     a48:	d080           	add.l d0,d0
     a4a:	43f9 0001 20bc 	lea 120bc <MaxZoom102>,a1
     a50:	3031 0800      	move.w (0,a1,d0.l),d0
     a54:	5540           	subq.w #2,d0
     a56:	33c0 0001 5342 	move.w d0,15342 <Zoom_LevelOf102Zoom>
  }
  
}

void Zoom_SwapBuffers() {
  ULONG tmp = (ULONG) DrawBuffer;
     a5c:	2039 0001 5318 	move.l 15318 <DrawBuffer>,d0
  DrawBuffer = ViewBuffer;
     a62:	23ca 0001 5318 	move.l a2,15318 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     a68:	23c0 0001 5320 	move.l d0,15320 <ViewBuffer>
     a6e:	2440           	movea.l d0,a2
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     a70:	3039 0001 5342 	move.w 15342 <Zoom_LevelOf102Zoom>,d0
}

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {

  
  UWORD *values4shift = Values4Shift+levelofshrink*108;
     a76:	c0fc 00d8      	mulu.w #216,d0
     a7a:	2240           	movea.l d0,a1
     a7c:	d3fc 0001 40e0 	adda.l #82144,a1
    *copperlist = *values4shift++;
     a82:	3151 012a      	move.w (a1),298(a0)
     a86:	3169 0002 012e 	move.w 2(a1),302(a0)
     a8c:	3169 0004 0132 	move.w 4(a1),306(a0)
     a92:	3169 0006 0136 	move.w 6(a1),310(a0)
     a98:	3169 0008 013a 	move.w 8(a1),314(a0)
     a9e:	3169 000a 013e 	move.w 10(a1),318(a0)
  *copperlist++ = *values4shift++;
     aa4:	3169 000c 0140 	move.w 12(a1),320(a0)
  *copperlist = *values4shift++;
     aaa:	3169 000e 0142 	move.w 14(a1),322(a0)
    *copperlist = *values4shift++;
     ab0:	3169 0010 0146 	move.w 16(a1),326(a0)
     ab6:	3169 0012 014a 	move.w 18(a1),330(a0)
     abc:	3169 0014 014e 	move.w 20(a1),334(a0)
     ac2:	3169 0016 0152 	move.w 22(a1),338(a0)
     ac8:	3169 0018 0156 	move.w 24(a1),342(a0)
     ace:	3169 001a 015a 	move.w 26(a1),346(a0)
     ad4:	3169 001c 015e 	move.w 28(a1),350(a0)
     ada:	3169 001e 0162 	move.w 30(a1),354(a0)
     ae0:	3169 0020 0166 	move.w 32(a1),358(a0)
     ae6:	3169 0022 016a 	move.w 34(a1),362(a0)
  *copperlist++ = *values4shift++;
     aec:	3169 0024 016c 	move.w 36(a1),364(a0)
  *copperlist = *values4shift++;
     af2:	3169 0026 016e 	move.w 38(a1),366(a0)
    *copperlist = *values4shift++;
     af8:	3169 0028 0172 	move.w 40(a1),370(a0)
     afe:	3169 002a 0176 	move.w 42(a1),374(a0)
     b04:	3169 002c 017a 	move.w 44(a1),378(a0)
     b0a:	3169 002e 017e 	move.w 46(a1),382(a0)
     b10:	3169 0030 0182 	move.w 48(a1),386(a0)
     b16:	3169 0032 0186 	move.w 50(a1),390(a0)
     b1c:	3169 0034 018a 	move.w 52(a1),394(a0)
    *copperlist = *values4shift++;
     b22:	3169 0036 01a2 	move.w 54(a1),418(a0)
     b28:	3169 0038 01a6 	move.w 56(a1),422(a0)
     b2e:	3169 003a 01aa 	move.w 58(a1),426(a0)
     b34:	3169 003c 01ae 	move.w 60(a1),430(a0)
     b3a:	3169 003e 01b2 	move.w 62(a1),434(a0)
     b40:	3169 0040 01b6 	move.w 64(a1),438(a0)
  *copperlist++ = *values4shift++;
     b46:	3169 0042 01b8 	move.w 66(a1),440(a0)
  *copperlist = *values4shift++;
     b4c:	3169 0044 01ba 	move.w 68(a1),442(a0)
    *copperlist = *values4shift++;
     b52:	3169 0046 01be 	move.w 70(a1),446(a0)
     b58:	3169 0048 01c2 	move.w 72(a1),450(a0)
     b5e:	3169 004a 01c6 	move.w 74(a1),454(a0)
     b64:	3169 004c 01ca 	move.w 76(a1),458(a0)
     b6a:	3169 004e 01ce 	move.w 78(a1),462(a0)
     b70:	3169 0050 01d2 	move.w 80(a1),466(a0)
     b76:	3169 0052 01d6 	move.w 82(a1),470(a0)
     b7c:	3169 0054 01da 	move.w 84(a1),474(a0)
     b82:	3169 0056 01de 	move.w 86(a1),478(a0)
     b88:	3169 0058 01e2 	move.w 88(a1),482(a0)
  *copperlist++ = *values4shift++;
     b8e:	3169 005a 01e4 	move.w 90(a1),484(a0)
  *copperlist = *values4shift++;
     b94:	3169 005c 01e6 	move.w 92(a1),486(a0)
    *copperlist = *values4shift++;
     b9a:	3169 005e 01ea 	move.w 94(a1),490(a0)
     ba0:	3169 0060 01ee 	move.w 96(a1),494(a0)
     ba6:	3169 0062 01f2 	move.w 98(a1),498(a0)
     bac:	3169 0064 01f6 	move.w 100(a1),502(a0)
     bb2:	3169 0066 01fa 	move.w 102(a1),506(a0)
     bb8:	3169 0068 01fe 	move.w 104(a1),510(a0)
     bbe:	3169 006a 0202 	move.w 106(a1),514(a0)
    *copperlist = *values4shift++;
     bc4:	3169 006c 0212 	move.w 108(a1),530(a0)
     bca:	3169 006e 0216 	move.w 110(a1),534(a0)
     bd0:	3169 0070 021a 	move.w 112(a1),538(a0)
     bd6:	3169 0072 021e 	move.w 114(a1),542(a0)
     bdc:	3169 0074 0222 	move.w 116(a1),546(a0)
     be2:	3169 0076 0226 	move.w 118(a1),550(a0)
  *copperlist++ = *values4shift++;
     be8:	3169 0078 0228 	move.w 120(a1),552(a0)
  *copperlist = *values4shift++;
     bee:	3169 007a 022a 	move.w 122(a1),554(a0)
    *copperlist = *values4shift++;
     bf4:	3169 007c 022e 	move.w 124(a1),558(a0)
     bfa:	3169 007e 0232 	move.w 126(a1),562(a0)
     c00:	3169 0080 0236 	move.w 128(a1),566(a0)
     c06:	3169 0082 023a 	move.w 130(a1),570(a0)
     c0c:	3169 0084 023e 	move.w 132(a1),574(a0)
     c12:	3169 0086 0242 	move.w 134(a1),578(a0)
     c18:	3169 0088 0246 	move.w 136(a1),582(a0)
     c1e:	3169 008a 024a 	move.w 138(a1),586(a0)
     c24:	3169 008c 024e 	move.w 140(a1),590(a0)
     c2a:	3169 008e 0252 	move.w 142(a1),594(a0)
  *copperlist++ = *values4shift++;
     c30:	3169 0090 0254 	move.w 144(a1),596(a0)
  *copperlist = *values4shift++;
     c36:	3169 0092 0256 	move.w 146(a1),598(a0)
    *copperlist = *values4shift++;
     c3c:	3169 0094 025a 	move.w 148(a1),602(a0)
     c42:	3169 0096 025e 	move.w 150(a1),606(a0)
     c48:	3169 0098 0262 	move.w 152(a1),610(a0)
     c4e:	3169 009a 0266 	move.w 154(a1),614(a0)
     c54:	3169 009c 026a 	move.w 156(a1),618(a0)
     c5a:	3169 009e 026e 	move.w 158(a1),622(a0)
     c60:	3169 00a0 0272 	move.w 160(a1),626(a0)
    *copperlist = *values4shift++;
     c66:	3169 00a2 0282 	move.w 162(a1),642(a0)
     c6c:	3169 00a4 0286 	move.w 164(a1),646(a0)
     c72:	3169 00a6 028a 	move.w 166(a1),650(a0)
     c78:	3169 00a8 028e 	move.w 168(a1),654(a0)
     c7e:	3169 00aa 0292 	move.w 170(a1),658(a0)
     c84:	3169 00ac 0296 	move.w 172(a1),662(a0)
  *copperlist++ = *values4shift++;
     c8a:	3169 00ae 0298 	move.w 174(a1),664(a0)
  *copperlist = *values4shift++;
     c90:	3169 00b0 029a 	move.w 176(a1),666(a0)
    *copperlist = *values4shift++;
     c96:	3169 00b2 029e 	move.w 178(a1),670(a0)
     c9c:	3169 00b4 02a2 	move.w 180(a1),674(a0)
     ca2:	3169 00b6 02a6 	move.w 182(a1),678(a0)
     ca8:	3169 00b8 02aa 	move.w 184(a1),682(a0)
     cae:	3169 00ba 02ae 	move.w 186(a1),686(a0)
     cb4:	3169 00bc 02b2 	move.w 188(a1),690(a0)
     cba:	3169 00be 02b6 	move.w 190(a1),694(a0)
     cc0:	3169 00c0 02ba 	move.w 192(a1),698(a0)
     cc6:	3169 00c2 02be 	move.w 194(a1),702(a0)
     ccc:	3169 00c4 02c2 	move.w 196(a1),706(a0)
  *copperlist++ = *values4shift++;
     cd2:	3169 00c6 02c4 	move.w 198(a1),708(a0)
  *copperlist = *values4shift++;
     cd8:	3169 00c8 02c6 	move.w 200(a1),710(a0)
    *copperlist = *values4shift++;
     cde:	3169 00ca 02ca 	move.w 202(a1),714(a0)
     ce4:	3169 00cc 02ce 	move.w 204(a1),718(a0)
     cea:	3169 00ce 02d2 	move.w 206(a1),722(a0)
     cf0:	3169 00d0 02d6 	move.w 208(a1),726(a0)
     cf6:	3169 00d2 02da 	move.w 210(a1),730(a0)
     cfc:	3169 00d4 02de 	move.w 212(a1),734(a0)
     d02:	3169 00d6 02e2 	move.w 214(a1),738(a0)
  ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
     d08:	3039 0001 5342 	move.w 15342 <Zoom_LevelOf102Zoom>,d0
     d0e:	e248           	lsr.w #1,d0
     d10:	0280 0000 ffff 	andi.l #65535,d0
     d16:	7208           	moveq #8,d1
     d18:	9280           	sub.l d0,d1
     d1a:	2001           	move.l d1,d0
     d1c:	e989           	lsl.l #4,d1
     d1e:	9280           	sub.l d0,d1
     d20:	2001           	move.l d1,d0
     d22:	e988           	lsl.l #4,d0
     d24:	43f2 0804      	lea (4,a2,d0.l),a1
    UWORD highword = (ULONG)plane2set >> 16;
     d28:	2009           	move.l a1,d0
     d2a:	4240           	clr.w d0
     d2c:	4840           	swap d0
     d2e:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     d32:	3149 0076      	move.w a1,118(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     d36:	7030           	moveq #48,d0
     d38:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
     d3a:	2200           	move.l d0,d1
     d3c:	4241           	clr.w d1
     d3e:	4841           	swap d1
     d40:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     d44:	3140 007e      	move.w d0,126(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     d48:	7060           	moveq #96,d0
     d4a:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
     d4c:	2200           	move.l d0,d1
     d4e:	4241           	clr.w d1
     d50:	4841           	swap d1
     d52:	3141 0082      	move.w d1,130(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     d56:	3140 0086      	move.w d0,134(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     d5a:	2009           	move.l a1,d0
     d5c:	0680 0000 0090 	addi.l #144,d0
    UWORD highword = (ULONG)plane2set >> 16;
     d62:	2200           	move.l d0,d1
     d64:	4241           	clr.w d1
     d66:	4841           	swap d1
     d68:	3141 008a      	move.w d1,138(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     d6c:	3140 008e      	move.w d0,142(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     d70:	43e9 00c0      	lea 192(a1),a1
    UWORD highword = (ULONG)plane2set >> 16;
     d74:	2009           	move.l a1,d0
     d76:	4240           	clr.w d0
     d78:	4840           	swap d0
     d7a:	3140 0092      	move.w d0,146(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     d7e:	3149 0096      	move.w a1,150(a0)
}
     d82:	245f           	movea.l (sp)+,a2
     d84:	4e75           	rts
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     d86:	0c79 0001 0001 	cmpi.w #1,15314 <Zoom_Mousepressed>
     d8c:	5314 
     d8e:	6700 fc6c      	beq.w 9fc <Zoom_VblankHandler+0x4c>
      Zoom_MouseReleased = 0;
     d92:	4279 0001 5316 	clr.w 15316 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 0) {
     d98:	3039 0001 5342 	move.w 15342 <Zoom_LevelOf102Zoom>,d0
     d9e:	2479 0001 5320 	movea.l 15320 <ViewBuffer>,a2
     da4:	6700 fc7a      	beq.w a20 <Zoom_VblankHandler+0x70>
        Zoom_LevelOf102Zoom--;
     da8:	3039 0001 5342 	move.w 15342 <Zoom_LevelOf102Zoom>,d0
     dae:	5340           	subq.w #1,d0
     db0:	33c0 0001 5342 	move.w d0,15342 <Zoom_LevelOf102Zoom>
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     db6:	3039 0001 5342 	move.w 15342 <Zoom_LevelOf102Zoom>,d0
  UWORD *values4shift = Values4Shift+levelofshrink*108;
     dbc:	c0fc 00d8      	mulu.w #216,d0
     dc0:	2240           	movea.l d0,a1
     dc2:	d3fc 0001 40e0 	adda.l #82144,a1
    *copperlist = *values4shift++;
     dc8:	3151 012a      	move.w (a1),298(a0)
     dcc:	3169 0002 012e 	move.w 2(a1),302(a0)
     dd2:	3169 0004 0132 	move.w 4(a1),306(a0)
     dd8:	3169 0006 0136 	move.w 6(a1),310(a0)
     dde:	3169 0008 013a 	move.w 8(a1),314(a0)
     de4:	3169 000a 013e 	move.w 10(a1),318(a0)
  *copperlist++ = *values4shift++;
     dea:	3169 000c 0140 	move.w 12(a1),320(a0)
  *copperlist = *values4shift++;
     df0:	3169 000e 0142 	move.w 14(a1),322(a0)
    *copperlist = *values4shift++;
     df6:	3169 0010 0146 	move.w 16(a1),326(a0)
     dfc:	3169 0012 014a 	move.w 18(a1),330(a0)
     e02:	3169 0014 014e 	move.w 20(a1),334(a0)
     e08:	3169 0016 0152 	move.w 22(a1),338(a0)
     e0e:	3169 0018 0156 	move.w 24(a1),342(a0)
     e14:	3169 001a 015a 	move.w 26(a1),346(a0)
     e1a:	3169 001c 015e 	move.w 28(a1),350(a0)
     e20:	3169 001e 0162 	move.w 30(a1),354(a0)
     e26:	3169 0020 0166 	move.w 32(a1),358(a0)
     e2c:	3169 0022 016a 	move.w 34(a1),362(a0)
  *copperlist++ = *values4shift++;
     e32:	3169 0024 016c 	move.w 36(a1),364(a0)
  *copperlist = *values4shift++;
     e38:	3169 0026 016e 	move.w 38(a1),366(a0)
    *copperlist = *values4shift++;
     e3e:	3169 0028 0172 	move.w 40(a1),370(a0)
     e44:	3169 002a 0176 	move.w 42(a1),374(a0)
     e4a:	3169 002c 017a 	move.w 44(a1),378(a0)
     e50:	3169 002e 017e 	move.w 46(a1),382(a0)
     e56:	3169 0030 0182 	move.w 48(a1),386(a0)
     e5c:	3169 0032 0186 	move.w 50(a1),390(a0)
     e62:	3169 0034 018a 	move.w 52(a1),394(a0)
    *copperlist = *values4shift++;
     e68:	3169 0036 01a2 	move.w 54(a1),418(a0)
     e6e:	3169 0038 01a6 	move.w 56(a1),422(a0)
     e74:	3169 003a 01aa 	move.w 58(a1),426(a0)
     e7a:	3169 003c 01ae 	move.w 60(a1),430(a0)
     e80:	3169 003e 01b2 	move.w 62(a1),434(a0)
     e86:	3169 0040 01b6 	move.w 64(a1),438(a0)
  *copperlist++ = *values4shift++;
     e8c:	3169 0042 01b8 	move.w 66(a1),440(a0)
  *copperlist = *values4shift++;
     e92:	3169 0044 01ba 	move.w 68(a1),442(a0)
    *copperlist = *values4shift++;
     e98:	3169 0046 01be 	move.w 70(a1),446(a0)
     e9e:	3169 0048 01c2 	move.w 72(a1),450(a0)
     ea4:	3169 004a 01c6 	move.w 74(a1),454(a0)
     eaa:	3169 004c 01ca 	move.w 76(a1),458(a0)
     eb0:	3169 004e 01ce 	move.w 78(a1),462(a0)
     eb6:	3169 0050 01d2 	move.w 80(a1),466(a0)
     ebc:	3169 0052 01d6 	move.w 82(a1),470(a0)
     ec2:	3169 0054 01da 	move.w 84(a1),474(a0)
     ec8:	3169 0056 01de 	move.w 86(a1),478(a0)
     ece:	3169 0058 01e2 	move.w 88(a1),482(a0)
  *copperlist++ = *values4shift++;
     ed4:	3169 005a 01e4 	move.w 90(a1),484(a0)
  *copperlist = *values4shift++;
     eda:	3169 005c 01e6 	move.w 92(a1),486(a0)
    *copperlist = *values4shift++;
     ee0:	3169 005e 01ea 	move.w 94(a1),490(a0)
     ee6:	3169 0060 01ee 	move.w 96(a1),494(a0)
     eec:	3169 0062 01f2 	move.w 98(a1),498(a0)
     ef2:	3169 0064 01f6 	move.w 100(a1),502(a0)
     ef8:	3169 0066 01fa 	move.w 102(a1),506(a0)
     efe:	3169 0068 01fe 	move.w 104(a1),510(a0)
     f04:	3169 006a 0202 	move.w 106(a1),514(a0)
    *copperlist = *values4shift++;
     f0a:	3169 006c 0212 	move.w 108(a1),530(a0)
     f10:	3169 006e 0216 	move.w 110(a1),534(a0)
     f16:	3169 0070 021a 	move.w 112(a1),538(a0)
     f1c:	3169 0072 021e 	move.w 114(a1),542(a0)
     f22:	3169 0074 0222 	move.w 116(a1),546(a0)
     f28:	3169 0076 0226 	move.w 118(a1),550(a0)
  *copperlist++ = *values4shift++;
     f2e:	3169 0078 0228 	move.w 120(a1),552(a0)
  *copperlist = *values4shift++;
     f34:	3169 007a 022a 	move.w 122(a1),554(a0)
    *copperlist = *values4shift++;
     f3a:	3169 007c 022e 	move.w 124(a1),558(a0)
     f40:	3169 007e 0232 	move.w 126(a1),562(a0)
     f46:	3169 0080 0236 	move.w 128(a1),566(a0)
     f4c:	3169 0082 023a 	move.w 130(a1),570(a0)
     f52:	3169 0084 023e 	move.w 132(a1),574(a0)
     f58:	3169 0086 0242 	move.w 134(a1),578(a0)
     f5e:	3169 0088 0246 	move.w 136(a1),582(a0)
     f64:	3169 008a 024a 	move.w 138(a1),586(a0)
     f6a:	3169 008c 024e 	move.w 140(a1),590(a0)
     f70:	3169 008e 0252 	move.w 142(a1),594(a0)
  *copperlist++ = *values4shift++;
     f76:	3169 0090 0254 	move.w 144(a1),596(a0)
  *copperlist = *values4shift++;
     f7c:	3169 0092 0256 	move.w 146(a1),598(a0)
    *copperlist = *values4shift++;
     f82:	3169 0094 025a 	move.w 148(a1),602(a0)
     f88:	3169 0096 025e 	move.w 150(a1),606(a0)
     f8e:	3169 0098 0262 	move.w 152(a1),610(a0)
     f94:	3169 009a 0266 	move.w 154(a1),614(a0)
     f9a:	3169 009c 026a 	move.w 156(a1),618(a0)
     fa0:	3169 009e 026e 	move.w 158(a1),622(a0)
     fa6:	3169 00a0 0272 	move.w 160(a1),626(a0)
    *copperlist = *values4shift++;
     fac:	3169 00a2 0282 	move.w 162(a1),642(a0)
     fb2:	3169 00a4 0286 	move.w 164(a1),646(a0)
     fb8:	3169 00a6 028a 	move.w 166(a1),650(a0)
     fbe:	3169 00a8 028e 	move.w 168(a1),654(a0)
     fc4:	3169 00aa 0292 	move.w 170(a1),658(a0)
     fca:	3169 00ac 0296 	move.w 172(a1),662(a0)
  *copperlist++ = *values4shift++;
     fd0:	3169 00ae 0298 	move.w 174(a1),664(a0)
  *copperlist = *values4shift++;
     fd6:	3169 00b0 029a 	move.w 176(a1),666(a0)
    *copperlist = *values4shift++;
     fdc:	3169 00b2 029e 	move.w 178(a1),670(a0)
     fe2:	3169 00b4 02a2 	move.w 180(a1),674(a0)
     fe8:	3169 00b6 02a6 	move.w 182(a1),678(a0)
     fee:	3169 00b8 02aa 	move.w 184(a1),682(a0)
     ff4:	3169 00ba 02ae 	move.w 186(a1),686(a0)
     ffa:	3169 00bc 02b2 	move.w 188(a1),690(a0)
    1000:	3169 00be 02b6 	move.w 190(a1),694(a0)
    1006:	3169 00c0 02ba 	move.w 192(a1),698(a0)
    100c:	3169 00c2 02be 	move.w 194(a1),702(a0)
    1012:	3169 00c4 02c2 	move.w 196(a1),706(a0)
  *copperlist++ = *values4shift++;
    1018:	3169 00c6 02c4 	move.w 198(a1),708(a0)
  *copperlist = *values4shift++;
    101e:	3169 00c8 02c6 	move.w 200(a1),710(a0)
    *copperlist = *values4shift++;
    1024:	3169 00ca 02ca 	move.w 202(a1),714(a0)
    102a:	3169 00cc 02ce 	move.w 204(a1),718(a0)
    1030:	3169 00ce 02d2 	move.w 206(a1),722(a0)
    1036:	3169 00d0 02d6 	move.w 208(a1),726(a0)
    103c:	3169 00d2 02da 	move.w 210(a1),730(a0)
    1042:	3169 00d4 02de 	move.w 212(a1),734(a0)
    1048:	3169 00d6 02e2 	move.w 214(a1),738(a0)
  ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
    104e:	3039 0001 5342 	move.w 15342 <Zoom_LevelOf102Zoom>,d0
    1054:	e248           	lsr.w #1,d0
    1056:	0280 0000 ffff 	andi.l #65535,d0
    105c:	7208           	moveq #8,d1
    105e:	9280           	sub.l d0,d1
    1060:	2001           	move.l d1,d0
    1062:	e989           	lsl.l #4,d1
    1064:	9280           	sub.l d0,d1
    1066:	2001           	move.l d1,d0
    1068:	e988           	lsl.l #4,d0
    106a:	43f2 0804      	lea (4,a2,d0.l),a1
    UWORD highword = (ULONG)plane2set >> 16;
    106e:	2009           	move.l a1,d0
    1070:	4240           	clr.w d0
    1072:	4840           	swap d0
    1074:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1078:	3149 0076      	move.w a1,118(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    107c:	7030           	moveq #48,d0
    107e:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1080:	2200           	move.l d0,d1
    1082:	4241           	clr.w d1
    1084:	4841           	swap d1
    1086:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    108a:	3140 007e      	move.w d0,126(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    108e:	7060           	moveq #96,d0
    1090:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1092:	2200           	move.l d0,d1
    1094:	4241           	clr.w d1
    1096:	4841           	swap d1
    1098:	3141 0082      	move.w d1,130(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    109c:	3140 0086      	move.w d0,134(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    10a0:	2009           	move.l a1,d0
    10a2:	0680 0000 0090 	addi.l #144,d0
    UWORD highword = (ULONG)plane2set >> 16;
    10a8:	2200           	move.l d0,d1
    10aa:	4241           	clr.w d1
    10ac:	4841           	swap d1
    10ae:	3141 008a      	move.w d1,138(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    10b2:	3140 008e      	move.w d0,142(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    10b6:	43e9 00c0      	lea 192(a1),a1
    UWORD highword = (ULONG)plane2set >> 16;
    10ba:	2009           	move.l a1,d0
    10bc:	4240           	clr.w d0
    10be:	4840           	swap d0
    10c0:	3140 0092      	move.w d0,146(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    10c4:	3149 0096      	move.w a1,150(a0)
}
    10c8:	245f           	movea.l (sp)+,a2
    10ca:	4e75           	rts
    Zoom_Mousepressed = 0;
    10cc:	4279 0001 5314 	clr.w 15314 <Zoom_Mousepressed>
    10d2:	6000 f936      	bra.w a0a <Zoom_VblankHandler+0x5a>
          Zoom_LevelOfZoom = 0;
    10d6:	33fc 0000 0001 	move.w #0,1532c <Zoom_LevelOfZoom>
    10dc:	532c 
        Zoom_LevelOf102Zoom = MaxZoom102[Zoom_LevelOfZoom] - 2;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
    10de:	3039 0001 532c 	move.w 1532c <Zoom_LevelOfZoom>,d0
    10e4:	0280 0000 ffff 	andi.l #65535,d0
    10ea:	d080           	add.l d0,d0
    10ec:	43f9 0001 20bc 	lea 120bc <MaxZoom102>,a1
    10f2:	3031 0800      	move.w (0,a1,d0.l),d0
    10f6:	5540           	subq.w #2,d0
    10f8:	33c0 0001 5342 	move.w d0,15342 <Zoom_LevelOf102Zoom>
  ULONG tmp = (ULONG) DrawBuffer;
    10fe:	2039 0001 5318 	move.l 15318 <DrawBuffer>,d0
  DrawBuffer = ViewBuffer;
    1104:	23ca 0001 5318 	move.l a2,15318 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
    110a:	23c0 0001 5320 	move.l d0,15320 <ViewBuffer>
    1110:	2440           	movea.l d0,a2
    1112:	6000 f95c      	bra.w a70 <Zoom_VblankHandler+0xc0>

00001116 <Zoom_Shrink102>:
void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {
    1116:	226f 0008      	movea.l 8(sp),a1
  UWORD *values4shift = Values4Shift+levelofshrink*108;
    111a:	302f 0006      	move.w 6(sp),d0
    111e:	c0fc 00d8      	mulu.w #216,d0
    1122:	2040           	movea.l d0,a0
    1124:	d1fc 0001 40e0 	adda.l #82144,a0
    *copperlist = *values4shift++;
    112a:	3350 012a      	move.w (a0),298(a1)
    112e:	3368 0002 012e 	move.w 2(a0),302(a1)
    1134:	3368 0004 0132 	move.w 4(a0),306(a1)
    113a:	3368 0006 0136 	move.w 6(a0),310(a1)
    1140:	3368 0008 013a 	move.w 8(a0),314(a1)
    1146:	3368 000a 013e 	move.w 10(a0),318(a1)
  *copperlist++ = *values4shift++;
    114c:	3368 000c 0140 	move.w 12(a0),320(a1)
  *copperlist = *values4shift++;
    1152:	3368 000e 0142 	move.w 14(a0),322(a1)
    *copperlist = *values4shift++;
    1158:	3368 0010 0146 	move.w 16(a0),326(a1)
    115e:	3368 0012 014a 	move.w 18(a0),330(a1)
    1164:	3368 0014 014e 	move.w 20(a0),334(a1)
    116a:	3368 0016 0152 	move.w 22(a0),338(a1)
    1170:	3368 0018 0156 	move.w 24(a0),342(a1)
    1176:	3368 001a 015a 	move.w 26(a0),346(a1)
    117c:	3368 001c 015e 	move.w 28(a0),350(a1)
    1182:	3368 001e 0162 	move.w 30(a0),354(a1)
    1188:	3368 0020 0166 	move.w 32(a0),358(a1)
    118e:	3368 0022 016a 	move.w 34(a0),362(a1)
  *copperlist++ = *values4shift++;
    1194:	3368 0024 016c 	move.w 36(a0),364(a1)
  *copperlist = *values4shift++;
    119a:	3368 0026 016e 	move.w 38(a0),366(a1)
    *copperlist = *values4shift++;
    11a0:	3368 0028 0172 	move.w 40(a0),370(a1)
    11a6:	3368 002a 0176 	move.w 42(a0),374(a1)
    11ac:	3368 002c 017a 	move.w 44(a0),378(a1)
    11b2:	3368 002e 017e 	move.w 46(a0),382(a1)
    11b8:	3368 0030 0182 	move.w 48(a0),386(a1)
    11be:	3368 0032 0186 	move.w 50(a0),390(a1)
    11c4:	3368 0034 018a 	move.w 52(a0),394(a1)
    *copperlist = *values4shift++;
    11ca:	3368 0036 01a2 	move.w 54(a0),418(a1)
    11d0:	3368 0038 01a6 	move.w 56(a0),422(a1)
    11d6:	3368 003a 01aa 	move.w 58(a0),426(a1)
    11dc:	3368 003c 01ae 	move.w 60(a0),430(a1)
    11e2:	3368 003e 01b2 	move.w 62(a0),434(a1)
    11e8:	3368 0040 01b6 	move.w 64(a0),438(a1)
  *copperlist++ = *values4shift++;
    11ee:	3368 0042 01b8 	move.w 66(a0),440(a1)
  *copperlist = *values4shift++;
    11f4:	3368 0044 01ba 	move.w 68(a0),442(a1)
    *copperlist = *values4shift++;
    11fa:	3368 0046 01be 	move.w 70(a0),446(a1)
    1200:	3368 0048 01c2 	move.w 72(a0),450(a1)
    1206:	3368 004a 01c6 	move.w 74(a0),454(a1)
    120c:	3368 004c 01ca 	move.w 76(a0),458(a1)
    1212:	3368 004e 01ce 	move.w 78(a0),462(a1)
    1218:	3368 0050 01d2 	move.w 80(a0),466(a1)
    121e:	3368 0052 01d6 	move.w 82(a0),470(a1)
    1224:	3368 0054 01da 	move.w 84(a0),474(a1)
    122a:	3368 0056 01de 	move.w 86(a0),478(a1)
    1230:	3368 0058 01e2 	move.w 88(a0),482(a1)
  *copperlist++ = *values4shift++;
    1236:	3368 005a 01e4 	move.w 90(a0),484(a1)
  *copperlist = *values4shift++;
    123c:	3368 005c 01e6 	move.w 92(a0),486(a1)
    *copperlist = *values4shift++;
    1242:	3368 005e 01ea 	move.w 94(a0),490(a1)
    1248:	3368 0060 01ee 	move.w 96(a0),494(a1)
    124e:	3368 0062 01f2 	move.w 98(a0),498(a1)
    1254:	3368 0064 01f6 	move.w 100(a0),502(a1)
    125a:	3368 0066 01fa 	move.w 102(a0),506(a1)
    1260:	3368 0068 01fe 	move.w 104(a0),510(a1)
    1266:	3368 006a 0202 	move.w 106(a0),514(a1)
    *copperlist = *values4shift++;
    126c:	3368 006c 0212 	move.w 108(a0),530(a1)
    1272:	3368 006e 0216 	move.w 110(a0),534(a1)
    1278:	3368 0070 021a 	move.w 112(a0),538(a1)
    127e:	3368 0072 021e 	move.w 114(a0),542(a1)
    1284:	3368 0074 0222 	move.w 116(a0),546(a1)
    128a:	3368 0076 0226 	move.w 118(a0),550(a1)
  *copperlist++ = *values4shift++;
    1290:	3368 0078 0228 	move.w 120(a0),552(a1)
  *copperlist = *values4shift++;
    1296:	3368 007a 022a 	move.w 122(a0),554(a1)
    *copperlist = *values4shift++;
    129c:	3368 007c 022e 	move.w 124(a0),558(a1)
    12a2:	3368 007e 0232 	move.w 126(a0),562(a1)
    12a8:	3368 0080 0236 	move.w 128(a0),566(a1)
    12ae:	3368 0082 023a 	move.w 130(a0),570(a1)
    12b4:	3368 0084 023e 	move.w 132(a0),574(a1)
    12ba:	3368 0086 0242 	move.w 134(a0),578(a1)
    12c0:	3368 0088 0246 	move.w 136(a0),582(a1)
    12c6:	3368 008a 024a 	move.w 138(a0),586(a1)
    12cc:	3368 008c 024e 	move.w 140(a0),590(a1)
    12d2:	3368 008e 0252 	move.w 142(a0),594(a1)
  *copperlist++ = *values4shift++;
    12d8:	3368 0090 0254 	move.w 144(a0),596(a1)
  *copperlist = *values4shift++;
    12de:	3368 0092 0256 	move.w 146(a0),598(a1)
    *copperlist = *values4shift++;
    12e4:	3368 0094 025a 	move.w 148(a0),602(a1)
    12ea:	3368 0096 025e 	move.w 150(a0),606(a1)
    12f0:	3368 0098 0262 	move.w 152(a0),610(a1)
    12f6:	3368 009a 0266 	move.w 154(a0),614(a1)
    12fc:	3368 009c 026a 	move.w 156(a0),618(a1)
    1302:	3368 009e 026e 	move.w 158(a0),622(a1)
    1308:	3368 00a0 0272 	move.w 160(a0),626(a1)
    *copperlist = *values4shift++;
    130e:	3368 00a2 0282 	move.w 162(a0),642(a1)
    1314:	3368 00a4 0286 	move.w 164(a0),646(a1)
    131a:	3368 00a6 028a 	move.w 166(a0),650(a1)
    1320:	3368 00a8 028e 	move.w 168(a0),654(a1)
    1326:	3368 00aa 0292 	move.w 170(a0),658(a1)
    132c:	3368 00ac 0296 	move.w 172(a0),662(a1)
  *copperlist++ = *values4shift++;
    1332:	3368 00ae 0298 	move.w 174(a0),664(a1)
  *copperlist = *values4shift++;
    1338:	3368 00b0 029a 	move.w 176(a0),666(a1)
    *copperlist = *values4shift++;
    133e:	3368 00b2 029e 	move.w 178(a0),670(a1)
    1344:	3368 00b4 02a2 	move.w 180(a0),674(a1)
    134a:	3368 00b6 02a6 	move.w 182(a0),678(a1)
    1350:	3368 00b8 02aa 	move.w 184(a0),682(a1)
    1356:	3368 00ba 02ae 	move.w 186(a0),686(a1)
    135c:	3368 00bc 02b2 	move.w 188(a0),690(a1)
    1362:	3368 00be 02b6 	move.w 190(a0),694(a1)
    1368:	3368 00c0 02ba 	move.w 192(a0),698(a1)
    136e:	3368 00c2 02be 	move.w 194(a0),702(a1)
    1374:	3368 00c4 02c2 	move.w 196(a0),706(a1)
  *copperlist++ = *values4shift++;
    137a:	3368 00c6 02c4 	move.w 198(a0),708(a1)
  *copperlist = *values4shift++;
    1380:	3368 00c8 02c6 	move.w 200(a0),710(a1)
    *copperlist = *values4shift++;
    1386:	3368 00ca 02ca 	move.w 202(a0),714(a1)
    138c:	3368 00cc 02ce 	move.w 204(a0),718(a1)
    1392:	3368 00ce 02d2 	move.w 206(a0),722(a1)
    1398:	3368 00d0 02d6 	move.w 208(a0),726(a1)
    139e:	3368 00d2 02da 	move.w 210(a0),730(a1)
    13a4:	3368 00d4 02de 	move.w 212(a0),734(a1)
    13aa:	3368 00d6 02e2 	move.w 214(a0),738(a1)
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }*/
  
}
    13b0:	4e75           	rts

000013b2 <Zoom_InitRun>:
void Zoom_InitRun() {
    13b2:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Zoom_Counter = 0;
    13b6:	4279 0001 5344 	clr.w 15344 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    13bc:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
    13c2:	7004           	moveq #4,d0
    13c4:	7202           	moveq #2,d1
    13c6:	4eae ff3a      	jsr -198(a6)
  Zoom_LevelOf102Zoom = 15;
    13ca:	33fc 000f 0001 	move.w #15,15342 <Zoom_LevelOf102Zoom>
    13d0:	5342 
  ZoomHorizontal = 16;
    13d2:	33fc 0010 0001 	move.w #16,15350 <ZoomHorizontal>
    13d8:	5350 
  Copperlist1 = ClbuildZoom( );
    13da:	45fa f268      	lea 644 <ClbuildZoom>(pc),a2
    13de:	4e92           	jsr (a2)
    13e0:	23c0 0001 5332 	move.l d0,15332 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    13e6:	4e92           	jsr (a2)
    13e8:	23c0 0001 532e 	move.l d0,1532e <Copperlist2>
  Bitplane1 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
    13ee:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
    13f4:	203c 0000 ff00 	move.l #65280,d0
    13fa:	7202           	moveq #2,d1
    13fc:	4eae ff3a      	jsr -198(a6)
    1400:	23c0 0001 533a 	move.l d0,1533a <Bitplane1>
  if(Bitplane1 == 0) {
    1406:	6700 026e      	beq.w 1676 <Zoom_InitRun+0x2c4>
  DrawBuffer = Bitplane1;
    140a:	23c0 0001 5318 	move.l d0,15318 <DrawBuffer>
  DrawCopper = Copperlist1;
    1410:	23f9 0001 5332 	move.l 15332 <Copperlist1>,1531c <DrawCopper>
    1416:	0001 531c 
  Bitplane2 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
    141a:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
    1420:	203c 0000 ff00 	move.l #65280,d0
    1426:	7202           	moveq #2,d1
    1428:	4eae ff3a      	jsr -198(a6)
    142c:	23c0 0001 5336 	move.l d0,15336 <Bitplane2>
  if(Bitplane2 == 0) {
    1432:	6700 020e      	beq.w 1642 <Zoom_InitRun+0x290>
  ViewBuffer = Bitplane2;
    1436:	23c0 0001 5320 	move.l d0,15320 <ViewBuffer>
  ViewCopper = Copperlist2;
    143c:	23f9 0001 532e 	move.l 1532e <Copperlist2>,15324 <ViewCopper>
    1442:	0001 5324 
  Zoom_StartImage = startimage;
    1446:	23fc 0000 1b6a 	move.l #7018,1533e <Zoom_StartImage>
    144c:	0001 533e 
  CopyMem( startimage, destination, ZMBPLSIZE);
    1450:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
    1456:	41f9 0000 1b6a 	lea 1b6a <incbin_startimage_start>,a0
    145c:	2279 0001 533a 	movea.l 1533a <Bitplane1>,a1
    1462:	203c 0000 ff00 	move.l #65280,d0
    1468:	4eae fd90      	jsr -624(a6)
  Zoom_ZoomIntoPicture( Bitplane1, Bitplane2, 0, 5);
    146c:	2439 0001 5336 	move.l 15336 <Bitplane2>,d2
    1472:	2479 0001 533a 	movea.l 1533a <Bitplane1>,a2
    1478:	42a7           	clr.l -(sp)
    147a:	2f02           	move.l d2,-(sp)
    147c:	2f0a           	move.l a2,-(sp)
    147e:	4eba edcc      	jsr 24c <Zoom_ZoomIntoPicture.constprop.0>(pc)
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
    1482:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
    1488:	2042           	movea.l d2,a0
    148a:	224a           	movea.l a2,a1
    148c:	203c 0000 ff00 	move.l #65280,d0
    1492:	4eae fd90      	jsr -624(a6)
  CopyMem( Bitplane2, startimage, ZMBPLSIZE);
    1496:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
    149c:	2079 0001 5336 	movea.l 15336 <Bitplane2>,a0
    14a2:	43f9 0000 1b6a 	lea 1b6a <incbin_startimage_start>,a1
    14a8:	203c 0000 ff00 	move.l #65280,d0
    14ae:	4eae fd90      	jsr -624(a6)
  Zoom_Shrink102( 15, Copperlist1);
    14b2:	2f39 0001 5332 	move.l 15332 <Copperlist1>,-(sp)
    14b8:	4878 000f      	pea f <main+0x9>
    14bc:	45fa fc58      	lea 1116 <Zoom_Shrink102>(pc),a2
    14c0:	4e92           	jsr (a2)
  Zoom_Shrink102( 15, Copperlist2);
    14c2:	2f39 0001 532e 	move.l 1532e <Copperlist2>,-(sp)
    14c8:	4878 000f      	pea f <main+0x9>
    14cc:	4e92           	jsr (a2)
  Zoom_LevelOfZoom = 1;
    14ce:	33fc 0001 0001 	move.w #1,1532c <Zoom_LevelOfZoom>
    14d4:	532c 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    14d6:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
    14dc:	7016           	moveq #22,d0
    14de:	223c 0001 0001 	move.l #65537,d1
    14e4:	4eae ff3a      	jsr -198(a6)
    14e8:	2240           	movea.l d0,a1
    14ea:	23c0 0001 5328 	move.l d0,15328 <Zoom_vbint>
    14f0:	4fef 001c      	lea 28(sp),sp
    14f4:	671a           	beq.s 1510 <Zoom_InitRun+0x15e>
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    14f6:	337c 02c4 0008 	move.w #708,8(a1)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    14fc:	237c 0001 2091 	move.l #73873,10(a1)
    1502:	000a 
    Zoom_vbint->is_Data = NULL;
    1504:	42a9 000e      	clr.l 14(a1)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    1508:	237c 0000 09b0 	move.l #2480,18(a1)
    150e:	0012 
  AddIntServer( INTB_VERTB, Zoom_vbint);
    1510:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
    1516:	7005           	moveq #5,d0
    1518:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    151c:	2279 0001 5324 	movea.l 15324 <ViewCopper>,a1
    1522:	2479 0001 5320 	movea.l 15320 <ViewBuffer>,a2
  ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
    1528:	3039 0001 5342 	move.w 15342 <Zoom_LevelOf102Zoom>,d0
    152e:	e248           	lsr.w #1,d0
    1530:	0280 0000 ffff 	andi.l #65535,d0
    1536:	7208           	moveq #8,d1
    1538:	9280           	sub.l d0,d1
    153a:	2001           	move.l d1,d0
    153c:	e989           	lsl.l #4,d1
    153e:	9280           	sub.l d0,d1
    1540:	2001           	move.l d1,d0
    1542:	e988           	lsl.l #4,d0
    1544:	41f2 0804      	lea (4,a2,d0.l),a0
    UWORD highword = (ULONG)plane2set >> 16;
    1548:	2008           	move.l a0,d0
    154a:	4240           	clr.w d0
    154c:	4840           	swap d0
    154e:	3340 0072      	move.w d0,114(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1552:	3348 0076      	move.w a0,118(a1)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1556:	7030           	moveq #48,d0
    1558:	d088           	add.l a0,d0
    UWORD highword = (ULONG)plane2set >> 16;
    155a:	2200           	move.l d0,d1
    155c:	4241           	clr.w d1
    155e:	4841           	swap d1
    1560:	3341 007a      	move.w d1,122(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1564:	3340 007e      	move.w d0,126(a1)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1568:	7060           	moveq #96,d0
    156a:	d088           	add.l a0,d0
    UWORD highword = (ULONG)plane2set >> 16;
    156c:	2200           	move.l d0,d1
    156e:	4241           	clr.w d1
    1570:	4841           	swap d1
    1572:	3341 0082      	move.w d1,130(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1576:	3340 0086      	move.w d0,134(a1)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    157a:	2008           	move.l a0,d0
    157c:	0680 0000 0090 	addi.l #144,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1582:	2200           	move.l d0,d1
    1584:	4241           	clr.w d1
    1586:	4841           	swap d1
    1588:	3341 008a      	move.w d1,138(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    158c:	3340 008e      	move.w d0,142(a1)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1590:	41e8 00c0      	lea 192(a0),a0
    UWORD highword = (ULONG)plane2set >> 16;
    1594:	2008           	move.l a0,d0
    1596:	4240           	clr.w d0
    1598:	4840           	swap d0
    159a:	3340 0092      	move.w d0,146(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    159e:	3348 0096      	move.w a0,150(a1)
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    15a2:	2079 0001 531c 	movea.l 1531c <DrawCopper>,a0
  ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
    15a8:	3039 0001 5342 	move.w 15342 <Zoom_LevelOf102Zoom>,d0
    15ae:	e248           	lsr.w #1,d0
    15b0:	0280 0000 ffff 	andi.l #65535,d0
    15b6:	7208           	moveq #8,d1
    15b8:	9280           	sub.l d0,d1
    15ba:	2001           	move.l d1,d0
    15bc:	e989           	lsl.l #4,d1
    15be:	9280           	sub.l d0,d1
    15c0:	2001           	move.l d1,d0
    15c2:	e988           	lsl.l #4,d0
    15c4:	45f2 0804      	lea (4,a2,d0.l),a2
    UWORD highword = (ULONG)plane2set >> 16;
    15c8:	200a           	move.l a2,d0
    15ca:	4240           	clr.w d0
    15cc:	4840           	swap d0
    15ce:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    15d2:	314a 0076      	move.w a2,118(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    15d6:	7030           	moveq #48,d0
    15d8:	d08a           	add.l a2,d0
    UWORD highword = (ULONG)plane2set >> 16;
    15da:	2200           	move.l d0,d1
    15dc:	4241           	clr.w d1
    15de:	4841           	swap d1
    15e0:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    15e4:	3140 007e      	move.w d0,126(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    15e8:	7060           	moveq #96,d0
    15ea:	d08a           	add.l a2,d0
    UWORD highword = (ULONG)plane2set >> 16;
    15ec:	2200           	move.l d0,d1
    15ee:	4241           	clr.w d1
    15f0:	4841           	swap d1
    15f2:	3141 0082      	move.w d1,130(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    15f6:	3140 0086      	move.w d0,134(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    15fa:	200a           	move.l a2,d0
    15fc:	0680 0000 0090 	addi.l #144,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1602:	2200           	move.l d0,d1
    1604:	4241           	clr.w d1
    1606:	4841           	swap d1
    1608:	3141 008a      	move.w d1,138(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    160c:	3140 008e      	move.w d0,142(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1610:	45ea 00c0      	lea 192(a2),a2
    UWORD highword = (ULONG)plane2set >> 16;
    1614:	200a           	move.l a2,d0
    1616:	4240           	clr.w d0
    1618:	4840           	swap d0
    161a:	3140 0092      	move.w d0,146(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    161e:	314a 0096      	move.w a2,150(a0)
  DrawCopper = ViewCopper;
    1622:	23c9 0001 531c 	move.l a1,1531c <DrawCopper>
  ViewCopper = (ULONG *)tmp;
    1628:	23c8 0001 5324 	move.l a0,15324 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    162e:	2279 0001 5352 	movea.l 15352 <hw>,a1
    1634:	2348 0080      	move.l a0,128(a1)
  hw->copjmp1 = tmp;
    1638:	3348 0088      	move.w a0,136(a1)
}
    163c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1640:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1642:	2c79 0001 5346 	movea.l 15346 <DOSBase>,a6
    1648:	4eae ffc4      	jsr -60(a6)
    164c:	2c79 0001 5346 	movea.l 15346 <DOSBase>,a6
    1652:	2200           	move.l d0,d1
    1654:	243c 0001 206a 	move.l #73834,d2
    165a:	7626           	moveq #38,d3
    165c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1660:	2c79 0001 5346 	movea.l 15346 <DOSBase>,a6
    1666:	7201           	moveq #1,d1
    1668:	4eae ff70      	jsr -144(a6)
    166c:	2039 0001 5336 	move.l 15336 <Bitplane2>,d0
    1672:	6000 fdc2      	bra.w 1436 <Zoom_InitRun+0x84>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1676:	2c79 0001 5346 	movea.l 15346 <DOSBase>,a6
    167c:	4eae ffc4      	jsr -60(a6)
    1680:	2c79 0001 5346 	movea.l 15346 <DOSBase>,a6
    1686:	2200           	move.l d0,d1
    1688:	243c 0001 2043 	move.l #73795,d2
    168e:	7626           	moveq #38,d3
    1690:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1694:	2c79 0001 5346 	movea.l 15346 <DOSBase>,a6
    169a:	7201           	moveq #1,d1
    169c:	4eae ff70      	jsr -144(a6)
    16a0:	2039 0001 533a 	move.l 1533a <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    16a6:	23c0 0001 5318 	move.l d0,15318 <DrawBuffer>
  DrawCopper = Copperlist1;
    16ac:	23f9 0001 5332 	move.l 15332 <Copperlist1>,1531c <DrawCopper>
    16b2:	0001 531c 
  Bitplane2 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
    16b6:	2c79 0001 534a 	movea.l 1534a <SysBase>,a6
    16bc:	203c 0000 ff00 	move.l #65280,d0
    16c2:	7202           	moveq #2,d1
    16c4:	4eae ff3a      	jsr -198(a6)
    16c8:	23c0 0001 5336 	move.l d0,15336 <Bitplane2>
  if(Bitplane2 == 0) {
    16ce:	6600 fd66      	bne.w 1436 <Zoom_InitRun+0x84>
    16d2:	6000 ff6e      	bra.w 1642 <Zoom_InitRun+0x290>

000016d6 <memcpy>:
{
    16d6:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    16da:	202f 0014      	move.l 20(sp),d0
    16de:	226f 0018      	movea.l 24(sp),a1
    16e2:	222f 001c      	move.l 28(sp),d1
	while(len--)
    16e6:	2601           	move.l d1,d3
    16e8:	5383           	subq.l #1,d3
    16ea:	4a81           	tst.l d1
    16ec:	6762           	beq.s 1750 <memcpy+0x7a>
    16ee:	2040           	movea.l d0,a0
    16f0:	5888           	addq.l #4,a0
    16f2:	b1c9           	cmpa.l a1,a0
    16f4:	53c2           	sl.s d2
    16f6:	4402           	neg.b d2
    16f8:	41e9 0004      	lea 4(a1),a0
    16fc:	b1c0           	cmpa.l d0,a0
    16fe:	53c4           	sl.s d4
    1700:	4404           	neg.b d4
    1702:	8404           	or.b d4,d2
    1704:	7808           	moveq #8,d4
    1706:	b883           	cmp.l d3,d4
    1708:	55c4           	sc.s d4
    170a:	4404           	neg.b d4
    170c:	c404           	and.b d4,d2
    170e:	6746           	beq.s 1756 <memcpy+0x80>
    1710:	2409           	move.l a1,d2
    1712:	8480           	or.l d0,d2
    1714:	7803           	moveq #3,d4
    1716:	c484           	and.l d4,d2
    1718:	663c           	bne.s 1756 <memcpy+0x80>
    171a:	2049           	movea.l a1,a0
    171c:	2440           	movea.l d0,a2
    171e:	74fc           	moveq #-4,d2
    1720:	c481           	and.l d1,d2
    1722:	d489           	add.l a1,d2
		*d++ = *s++;
    1724:	24d8           	move.l (a0)+,(a2)+
    1726:	b488           	cmp.l a0,d2
    1728:	66fa           	bne.s 1724 <memcpy+0x4e>
    172a:	74fc           	moveq #-4,d2
    172c:	c481           	and.l d1,d2
    172e:	2040           	movea.l d0,a0
    1730:	d1c2           	adda.l d2,a0
    1732:	d3c2           	adda.l d2,a1
    1734:	9682           	sub.l d2,d3
    1736:	b481           	cmp.l d1,d2
    1738:	6716           	beq.s 1750 <memcpy+0x7a>
    173a:	1091           	move.b (a1),(a0)
	while(len--)
    173c:	4a83           	tst.l d3
    173e:	6710           	beq.s 1750 <memcpy+0x7a>
		*d++ = *s++;
    1740:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    1746:	5383           	subq.l #1,d3
    1748:	6706           	beq.s 1750 <memcpy+0x7a>
		*d++ = *s++;
    174a:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    1750:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    1754:	4e75           	rts
    1756:	2040           	movea.l d0,a0
    1758:	d289           	add.l a1,d1
		*d++ = *s++;
    175a:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    175c:	b289           	cmp.l a1,d1
    175e:	67f0           	beq.s 1750 <memcpy+0x7a>
		*d++ = *s++;
    1760:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    1762:	b289           	cmp.l a1,d1
    1764:	66f4           	bne.s 175a <memcpy+0x84>
    1766:	60e8           	bra.s 1750 <memcpy+0x7a>

00001768 <memset>:
{
    1768:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    176c:	202f 0024      	move.l 36(sp),d0
    1770:	2a2f 0028      	move.l 40(sp),d5
    1774:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    1778:	2809           	move.l a1,d4
    177a:	5384           	subq.l #1,d4
    177c:	b2fc 0000      	cmpa.w #0,a1
    1780:	6f00 00b0      	ble.w 1832 <memset+0xca>
    1784:	1e05           	move.b d5,d7
    1786:	2200           	move.l d0,d1
    1788:	4481           	neg.l d1
    178a:	7403           	moveq #3,d2
    178c:	c282           	and.l d2,d1
    178e:	7c05           	moveq #5,d6
		*ptr++ = val;
    1790:	2440           	movea.l d0,a2
    1792:	bc84           	cmp.l d4,d6
    1794:	646a           	bcc.s 1800 <memset+0x98>
    1796:	4a81           	tst.l d1
    1798:	6724           	beq.s 17be <memset+0x56>
    179a:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    179c:	5384           	subq.l #1,d4
    179e:	7401           	moveq #1,d2
    17a0:	b481           	cmp.l d1,d2
    17a2:	671a           	beq.s 17be <memset+0x56>
		*ptr++ = val;
    17a4:	2440           	movea.l d0,a2
    17a6:	548a           	addq.l #2,a2
    17a8:	2040           	movea.l d0,a0
    17aa:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    17ae:	5384           	subq.l #1,d4
    17b0:	7403           	moveq #3,d2
    17b2:	b481           	cmp.l d1,d2
    17b4:	6608           	bne.s 17be <memset+0x56>
		*ptr++ = val;
    17b6:	528a           	addq.l #1,a2
    17b8:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    17bc:	5384           	subq.l #1,d4
    17be:	2609           	move.l a1,d3
    17c0:	9681           	sub.l d1,d3
    17c2:	7c00           	moveq #0,d6
    17c4:	1c05           	move.b d5,d6
    17c6:	2406           	move.l d6,d2
    17c8:	4842           	swap d2
    17ca:	4242           	clr.w d2
    17cc:	2042           	movea.l d2,a0
    17ce:	2406           	move.l d6,d2
    17d0:	e14a           	lsl.w #8,d2
    17d2:	4842           	swap d2
    17d4:	4242           	clr.w d2
    17d6:	e18e           	lsl.l #8,d6
    17d8:	2646           	movea.l d6,a3
    17da:	2c08           	move.l a0,d6
    17dc:	8486           	or.l d6,d2
    17de:	2c0b           	move.l a3,d6
    17e0:	8486           	or.l d6,d2
    17e2:	1407           	move.b d7,d2
    17e4:	2040           	movea.l d0,a0
    17e6:	d1c1           	adda.l d1,a0
    17e8:	72fc           	moveq #-4,d1
    17ea:	c283           	and.l d3,d1
    17ec:	d288           	add.l a0,d1
		*ptr++ = val;
    17ee:	20c2           	move.l d2,(a0)+
    17f0:	b1c1           	cmpa.l d1,a0
    17f2:	66fa           	bne.s 17ee <memset+0x86>
    17f4:	72fc           	moveq #-4,d1
    17f6:	c283           	and.l d3,d1
    17f8:	d5c1           	adda.l d1,a2
    17fa:	9881           	sub.l d1,d4
    17fc:	b283           	cmp.l d3,d1
    17fe:	6732           	beq.s 1832 <memset+0xca>
    1800:	1485           	move.b d5,(a2)
	while(len-- > 0)
    1802:	4a84           	tst.l d4
    1804:	6f2c           	ble.s 1832 <memset+0xca>
		*ptr++ = val;
    1806:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    180a:	7201           	moveq #1,d1
    180c:	b284           	cmp.l d4,d1
    180e:	6c22           	bge.s 1832 <memset+0xca>
		*ptr++ = val;
    1810:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    1814:	7402           	moveq #2,d2
    1816:	b484           	cmp.l d4,d2
    1818:	6c18           	bge.s 1832 <memset+0xca>
		*ptr++ = val;
    181a:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    181e:	7c03           	moveq #3,d6
    1820:	bc84           	cmp.l d4,d6
    1822:	6c0e           	bge.s 1832 <memset+0xca>
		*ptr++ = val;
    1824:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    1828:	7204           	moveq #4,d1
    182a:	b284           	cmp.l d4,d1
    182c:	6c04           	bge.s 1832 <memset+0xca>
		*ptr++ = val;
    182e:	1545 0005      	move.b d5,5(a2)
}
    1832:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    1836:	4e75           	rts

00001838 <strlen>:
{
    1838:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    183c:	7000           	moveq #0,d0
	while(*s++)
    183e:	4a10           	tst.b (a0)
    1840:	6708           	beq.s 184a <strlen+0x12>
		t++;
    1842:	5280           	addq.l #1,d0
	while(*s++)
    1844:	4a30 0800      	tst.b (0,a0,d0.l)
    1848:	66f8           	bne.s 1842 <strlen+0xa>
}
    184a:	4e75           	rts

0000184c <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    184c:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    1850:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1854:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    1858:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    185c:	d041           	add.w d1,d0
	swap	d0
    185e:	4840           	swap d0
	clrw	d0
    1860:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1862:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    1866:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    186a:	d081           	add.l d1,d0

	rts
    186c:	4e75           	rts

0000186e <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    186e:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    1870:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    1874:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    1878:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    187e:	6416           	bcc.s 1896 <__udivsi3+0x28>
	movel	d0, d2
    1880:	2400           	move.l d0,d2
	clrw	d2
    1882:	4242           	clr.w d2
	swap	d2
    1884:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    1886:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    1888:	3002           	move.w d2,d0
	swap	d0
    188a:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    188c:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    1890:	84c1           	divu.w d1,d2
	movew	d2, d0
    1892:	3002           	move.w d2,d0
	jra	6f
    1894:	6030           	bra.s 18c6 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    1896:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    1898:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    189a:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    189c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    18a2:	64f4           	bcc.s 1898 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    18a4:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    18a6:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    18ac:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    18ae:	c2c0           	mulu.w d0,d1
	swap	d2
    18b0:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    18b2:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    18b4:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    18b6:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    18b8:	660a           	bne.s 18c4 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    18ba:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    18bc:	6506           	bcs.s 18c4 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    18be:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    18c2:	6302           	bls.s 18c6 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    18c4:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    18c6:	241f           	move.l (sp)+,d2
	rts
    18c8:	4e75           	rts

000018ca <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    18ca:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    18cc:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    18ce:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    18d2:	6a04           	bpl.s 18d8 <__divsi3+0xe>
	negl	d1
    18d4:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    18d6:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    18d8:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    18dc:	6a04           	bpl.s 18e2 <__divsi3+0x18>
	negl	d0
    18de:	4480           	neg.l d0
	negb	d2
    18e0:	4402           	neg.b d2

2:	movel	d1, sp@-
    18e2:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    18e4:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    18e6:	6186           	bsr.s 186e <__udivsi3>
	addql	IMM (8), sp
    18e8:	508f           	addq.l #8,sp

	tstb	d2
    18ea:	4a02           	tst.b d2
	jpl	3f
    18ec:	6a02           	bpl.s 18f0 <__divsi3+0x26>
	negl	d0
    18ee:	4480           	neg.l d0

3:	movel	sp@+, d2
    18f0:	241f           	move.l (sp)+,d2
	rts
    18f2:	4e75           	rts

000018f4 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    18f4:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    18f8:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    18fc:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    18fe:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    1900:	61c8           	bsr.s 18ca <__divsi3>
	addql	IMM (8), sp
    1902:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    1904:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1908:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    190a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    190c:	6100 ff3e      	bsr.w 184c <__mulsi3>
	addql	IMM (8), sp
    1910:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    1912:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1916:	9280           	sub.l d0,d1
	movel	d1, d0
    1918:	2001           	move.l d1,d0
	rts
    191a:	4e75           	rts

0000191c <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    191c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1920:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1924:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1926:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    1928:	6100 ff44      	bsr.w 186e <__udivsi3>
	addql	IMM (8), sp
    192c:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    192e:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1932:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1934:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1936:	6100 ff14      	bsr.w 184c <__mulsi3>
	addql	IMM (8), sp
    193a:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    193c:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1940:	9280           	sub.l d0,d1
	movel	d1, d0
    1942:	2001           	move.l d1,d0
	rts
    1944:	4e75           	rts

00001946 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    1946:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    1948:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    194c:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    1950:	2c5f           	movea.l (sp)+,a6
    rts
    1952:	4e75           	rts

00001954 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    1954:	16c0           	move.b d0,(a3)+
	rts
    1956:	4e75           	rts

00001958 <saveregs>:
	...

00001994 <font2distance>:
    1994:	0505           	btst d2,d5
    1996:	0505           	btst d2,d5
    1998:	0505           	btst d2,d5
    199a:	0505           	btst d2,d5
    199c:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    199e:	0505           	btst d2,d5
    19a0:	0505           	btst d2,d5
    19a2:	0005 0505      	ori.b #5,d5
    19a6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    19a8:	0505           	btst d2,d5
    19aa:	0505           	btst d2,d5
    19ac:	0505           	btst d2,d5
    19ae:	0505           	btst d2,d5
    19b0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    19b2:	0505           	btst d2,d5
    19b4:	0505           	btst d2,d5
    19b6:	0505           	btst d2,d5
    19b8:	0505           	btst d2,d5
    19ba:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    19bc:	0500           	btst d2,d0
    19be:	0505           	btst d2,d5
    19c0:	0505           	btst d2,d5
    19c2:	0505           	btst d2,d5
    19c4:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    19c6:	0505           	btst d2,d5
    19c8:	0505           	btst d2,d5
    19ca:	0505           	btst d2,d5
    19cc:	0505           	btst d2,d5
    19ce:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    19d0:	0505           	btst d2,d5
    19d2:	0505           	btst d2,d5
    19d4:	0503           	btst d2,d3
    19d6:	0505           	btst d2,d5
    19d8:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    19da:	0505           	btst d2,d5
    19dc:	0500           	btst d2,d0
    19de:	0505           	btst d2,d5
    19e0:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    19e4:	0505           	btst d2,d5
    19e6:	0503           	btst d2,d3
    19e8:	0205 0507      	andi.b #7,d5
    19ec:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    19ee:	0505           	btst d2,d5
    19f0:	0505           	btst d2,d5
    19f2:	0505           	btst d2,d5
    19f4:	0505           	btst d2,d5
    19f6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    19f8:	0505           	btst d2,d5
    19fa:	0505           	btst d2,d5
    19fc:	0505           	btst d2,d5
    19fe:	0505           	btst d2,d5
    1a00:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a02:	0505           	btst d2,d5
    1a04:	0505           	btst d2,d5
    1a06:	0505           	btst d2,d5
    1a08:	0505           	btst d2,d5
    1a0a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a0c:	0505           	btst d2,d5
    1a0e:	0505           	btst d2,d5
    1a10:	0505           	btst d2,d5
    1a12:	0505           	btst d2,d5
    1a14:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a16:	0505           	btst d2,d5
    1a18:	0505           	btst d2,d5
    1a1a:	0505           	btst d2,d5
    1a1c:	0505           	btst d2,d5
    1a1e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a20:	0505           	btst d2,d5
    1a22:	0505           	btst d2,d5
    1a24:	0505           	btst d2,d5
    1a26:	0505           	btst d2,d5
    1a28:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a2a:	0505           	btst d2,d5
    1a2c:	0505           	btst d2,d5
    1a2e:	0505           	btst d2,d5
    1a30:	0505           	btst d2,d5
    1a32:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a34:	0505           	btst d2,d5
    1a36:	0505           	btst d2,d5
    1a38:	0505           	btst d2,d5
    1a3a:	0505           	btst d2,d5
    1a3c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a3e:	0505           	btst d2,d5
    1a40:	0505           	btst d2,d5
    1a42:	0505           	btst d2,d5
    1a44:	0505           	btst d2,d5
    1a46:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a48:	0505           	btst d2,d5
    1a4a:	0505           	btst d2,d5
    1a4c:	0505           	btst d2,d5
    1a4e:	0505           	btst d2,d5
    1a50:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a52:	0505           	btst d2,d5
    1a54:	0505           	btst d2,d5
    1a56:	0505           	btst d2,d5
    1a58:	0505           	btst d2,d5
    1a5a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a5c:	0505           	btst d2,d5
    1a5e:	0505           	btst d2,d5
    1a60:	0505           	btst d2,d5
    1a62:	0505           	btst d2,d5
    1a64:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a66:	0505           	btst d2,d5
    1a68:	0505           	btst d2,d5
    1a6a:	0505           	btst d2,d5
    1a6c:	0505           	btst d2,d5
    1a6e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a70:	0505           	btst d2,d5
    1a72:	0505           	btst d2,d5
    1a74:	0505           	btst d2,d5
    1a76:	0505           	btst d2,d5
    1a78:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a7a:	0505           	btst d2,d5
    1a7c:	0505           	btst d2,d5
    1a7e:	0505           	btst d2,d5
    1a80:	0505           	btst d2,d5
    1a82:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a84:	0505           	btst d2,d5
    1a86:	0505           	btst d2,d5
    1a88:	0505           	btst d2,d5
    1a8a:	0505           	btst d2,d5
    1a8c:	0505           	btst d2,d5

00001a8e <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    1a8e:	16c0           	move.b d0,(a3)+
  RTS
    1a90:	4e75           	rts

00001a92 <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    1a92:	48f9 7fff 0000 	movem.l d0-a6,1958 <saveregs>
    1a98:	1958 
  lea 0xdff000,a5
    1a9a:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xdd70dd>,a5
  move.l sp@(4),a0  //Fontlocation
    1aa0:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    1aa4:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    1aa8:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    1aac:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    1aae:	082d 0006 0002 	btst #6,2(a5)

00001ab4 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    1ab4:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    1aba:	66f8           	bne.s 1ab4 <st2wblit>

00001abc <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    1abc:	7019           	moveq #25,d0
	sub.l d5,d5      
    1abe:	9a85           	sub.l d5,d5

00001ac0 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    1ac0:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    1ac2:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    1ac4:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    1ac8:	9dce           	suba.l a6,a6
	move.l d2, a6
    1aca:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    1acc:	ddfc 0000 1994 	adda.l #6548,a6

	LSL  	#4,d2 	    //Fetch next char
    1ad2:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    1ad4:	2842           	movea.l d2,a4


	move.l  #0,d4
    1ad6:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    1ad8:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    1ada:	3814           	move.w (a4),d4
	swap	d4
    1adc:	4844           	swap d4
	lsr.l	d5, d4
    1ade:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    1ae0:	8993           	or.l d4,(a3)
	clr.l	d4
    1ae2:	4284           	clr.l d4
	move.w  2(a4), d4
    1ae4:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    1ae8:	4844           	swap d4
	lsr.l	d5, d4
    1aea:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    1aec:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    1af0:	4284           	clr.l d4
	move.w  4(a4), d4
    1af2:	382c 0004      	move.w 4(a4),d4
	swap	d4
    1af6:	4844           	swap d4
	lsr.l	d5, d4
    1af8:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    1afa:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    1afe:	4284           	clr.l d4
	move.w  6(a4), d4
    1b00:	382c 0006      	move.w 6(a4),d4
	swap	d4
    1b04:	4844           	swap d4
	lsr.l	d5, d4
    1b06:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    1b08:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    1b0c:	4284           	clr.l d4
	move.w  8(a4), d4
    1b0e:	382c 0008      	move.w 8(a4),d4
	swap	d4
    1b12:	4844           	swap d4
	lsr.l	d5, d4
    1b14:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    1b16:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    1b1a:	4284           	clr.l d4
	move.w  10(a4), d4
    1b1c:	382c 000a      	move.w 10(a4),d4
	swap	d4
    1b20:	4844           	swap d4
	lsr.l	d5, d4
    1b22:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    1b24:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    1b28:	4284           	clr.l d4
	move.w  12(a4), d4
    1b2a:	382c 000c      	move.w 12(a4),d4
	swap	d4
    1b2e:	4844           	swap d4
	lsr.l	d5, d4
    1b30:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    1b32:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    1b36:	4284           	clr.l d4
	move.w  14(a4), d4
    1b38:	382c 000e      	move.w 14(a4),d4
	swap	d4
    1b3c:	4844           	swap d4
	lsr.l	d5, d4
    1b3e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    1b40:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    1b44:	4284           	clr.l d4

	add.b   (a6), d5
    1b46:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    1b48:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    1b4c:	6500 0006      	bcs.w 1b54 <noadditionalchar>
	addq.w  #1, a3
    1b50:	524b           	addq.w #1,a3
	sub.w   #8,d5
    1b52:	5145           	subq.w #8,d5

00001b54 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    1b54:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    1b56:	51c8 ff68      	dbf d0,1ac0 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    1b5a:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    1b5e:	51cb ff5c      	dbf d3,1abc <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    1b62:	4cfa 7fff fdf2 	movem.l 1958 <saveregs>(pc),d0-a6

	RTS
    1b68:	4e75           	rts
