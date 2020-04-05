
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
       6:	4fef ffd8      	lea -40(sp),sp
       a:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 3b68 	move.l a6,3b68 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,3b3c <hw>
      1e:	0000 3b3c 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 1a43 	lea 1a43 <incbin_swfont_end+0xbd>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 3b38 	move.l d0,3b38 <GfxBase>
	if (!GfxBase)
      34:	6700 0796      	beq.w 7cc <main+0x7c6>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 3b68 	movea.l 3b68 <SysBase>,a6
      3e:	43f9 0000 1a54 	lea 1a54 <incbin_swfont_end+0xce>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 3b64 	move.l d0,3b64 <DOSBase>
	if (!DOSBase)
      50:	6700 076e      	beq.w 7c0 <main+0x7ba>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 1a60 	pea 1a60 <incbin_swfont_end+0xda>
      5a:	4eb9 0000 08ea 	jsr 8ea <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 3b64 	movea.l 3b64 <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 3b64 	movea.l 3b64 <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 1a7c 	move.l #6780,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      7e:	2c79 0000 3b64 	movea.l 3b64 <DOSBase>,a6
      84:	7232           	moveq #50,d1
      86:	4eae ff3a      	jsr -198(a6)
  Zoom_InitRun();
      8a:	4eb9 0000 0bd2 	jsr bd2 <Zoom_InitRun>

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
      a0:	47f9 0000 0848 	lea 848 <warpmode.part.0>,a3
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
      b4:	2c79 0000 3b38 	movea.l 3b38 <GfxBase>,a6
      ba:	23ee 0022 0000 	move.l 34(a6),3b26 <ActiView>
      c0:	3b26 
	OwnBlitter();
      c2:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
      c6:	2c79 0000 3b38 	movea.l 3b38 <GfxBase>,a6
      cc:	4eae ff1c      	jsr -228(a6)
	Disable();
      d0:	2c79 0000 3b68 	movea.l 3b68 <SysBase>,a6
      d6:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
      da:	2479 0000 3b3c 	movea.l 3b3c <hw>,a2
      e0:	302a 0010      	move.w 16(a2),d0
      e4:	33c0 0000 3b2a 	move.w d0,3b2a <SystemADKCON>
	SystemInts=hw->intenar;
      ea:	302a 001c      	move.w 28(a2),d0
      ee:	33c0 0000 3b2e 	move.w d0,3b2e <SystemInts>
	SystemDMA=hw->dmaconr;
      f4:	302a 0002      	move.w 2(a2),d0
      f8:	33c0 0000 3b2c 	move.w d0,3b2c <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
      fe:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     104:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
     10a:	49f9 0000 0efa 	lea efa <WaitVbl>,a4
     110:	4e94           	jsr (a4)
	WaitVbl();
     112:	4e94           	jsr (a4)
	hw->dmacon=0x7fff;//Clear all DMA channels
     114:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     11a:	2c79 0000 3b38 	movea.l 3b38 <GfxBase>,a6
     120:	93c9           	suba.l a1,a1
     122:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     126:	2c79 0000 3b38 	movea.l 3b38 <GfxBase>,a6
     12c:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     130:	2c79 0000 3b38 	movea.l 3b38 <GfxBase>,a6
     136:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     13a:	4e94           	jsr (a4)
	WaitVbl();
     13c:	4e94           	jsr (a4)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     13e:	3f7c 4e7a 004e 	move.w #20090,78(sp)
     144:	3f7c 0801 0050 	move.w #2049,80(sp)
     14a:	3f7c 4e73 0052 	move.w #20083,82(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     150:	2c79 0000 3b68 	movea.l 3b68 <SysBase>,a6
     156:	082e 0000 0129 	btst #0,297(a6)
     15c:	6700 0698      	beq.w 7f6 <main+0x7f0>
		vbr = (APTR)Supervisor((void*)getvbr);
     160:	7e4e           	moveq #78,d7
     162:	de8f           	add.l sp,d7
     164:	cf8d           	exg d7,a5
     166:	4eae ffe2      	jsr -30(a6)
     16a:	cf8d           	exg d7,a5

	VBR=GetVBR();
     16c:	23c0 0000 3b30 	move.l d0,3b30 <VBR.lto_priv.2>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     172:	2079 0000 3b30 	movea.l 3b30 <VBR.lto_priv.2>,a0
     178:	2028 006c      	move.l 108(a0),d0
	SystemIrq=GetInterruptHandler(); //store interrupt register
     17c:	23c0 0000 3b34 	move.l d0,3b34 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
     182:	4e94           	jsr (a4)
	// DEMO - increment frameCounter
	frameCounter++;
}

void RunDemo() {
  hw->dmacon = 0b1001001111100000;
     184:	2679 0000 3b3c 	movea.l 3b3c <hw>,a3
     18a:	377c 93e0 0096 	move.w #-27680,150(a3)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     190:	2079 0000 3b30 	movea.l 3b30 <VBR.lto_priv.2>,a0
     196:	217c 0000 0ed0 	move.l #3792,108(a0)
     19c:	006c 
	SetInterruptHandler((APTR)interruptHandler);
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     19e:	377c c020 009a 	move.w #-16352,154(a3)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     1a4:	377c 0020 009c 	move.w #32,156(a3)
	DisownBlitter();
	Enable();
}

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     1aa:	3039 00df f016 	move.w dff016 <gcc8_c_support.c.e9862530+0xddafc0>,d0
  //PrepareDisplay();

	while(!MouseRight()) {
     1b0:	0800 000a      	btst #10,d0
     1b4:	6700 029c      	beq.w 452 <main+0x44c>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     1b8:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddafae>,d0
     1be:	2f40 004e      	move.l d0,78(sp)
		vpos&=0x1ff00;
     1c2:	202f 004e      	move.l 78(sp),d0
     1c6:	0280 0001 ff00 	andi.l #130816,d0
     1cc:	2f40 004e      	move.l d0,78(sp)
		if (vpos!=(311<<8))
     1d0:	202f 004e      	move.l 78(sp),d0
     1d4:	0c80 0001 3700 	cmpi.l #79616,d0
     1da:	67dc           	beq.s 1b8 <main+0x1b2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     1dc:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddafae>,d0
     1e2:	2f40 004a      	move.l d0,74(sp)
		vpos&=0x1ff00;
     1e6:	202f 004a      	move.l 74(sp),d0
     1ea:	0280 0001 ff00 	andi.l #130816,d0
     1f0:	2f40 004a      	move.l d0,74(sp)
		if (vpos==(311<<8))
     1f4:	202f 004a      	move.l 74(sp),d0
     1f8:	0c80 0001 3700 	cmpi.l #79616,d0
     1fe:	66dc           	bne.s 1dc <main+0x1d6>
  UWORD highword = (ULONG)DrawBuffer >> 16;
     200:	2839 0000 3b5a 	move.l 3b5a <DrawBuffer>,d4
  UWORD *copword = (UWORD *) DrawCopper;
     206:	2079 0000 3b48 	movea.l 3b48 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     20c:	3144 0076      	move.w d4,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
     210:	2004           	move.l d4,d0
     212:	4240           	clr.w d0
     214:	4840           	swap d0
     216:	3140 0072      	move.w d0,114(a0)
  DrawBuffer = ViewBuffer;
     21a:	2479 0000 3b5e 	movea.l 3b5e <ViewBuffer>,a2
     220:	23ca 0000 3b5a 	move.l a2,3b5a <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     226:	23c4 0000 3b5e 	move.l d4,3b5e <ViewBuffer>
  DrawCopper = ViewCopper;
     22c:	23f9 0000 3b40 	move.l 3b40 <ViewCopper>,3b48 <DrawCopper>
     232:	0000 3b48 
  ViewCopper = (ULONG *)tmp;
     236:	23c8 0000 3b40 	move.l a0,3b40 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     23c:	2748 0080      	move.l a0,128(a3)
  hw->copjmp1 = tmp;
     240:	3748 0088      	move.w a0,136(a3)
short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     244:	1039 00bf e001 	move.b bfe001 <gcc8_c_support.c.e9862530+0xbd9fab>,d0

void RunFrame() {
  //TestZoomSpeed();
  SetBplPointers();
  SwapCl();
  while( !MouseLeft()) {}
     24a:	0800 0006      	btst #6,d0
     24e:	66f4           	bne.s 244 <main+0x23e>
  Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer - 2, (UWORD *)DrawBuffer - 2, Zoom_LevelOfZoom, 1 );
     250:	3639 0000 3b58 	move.w 3b58 <Zoom_LevelOfZoom>,d3
  hw->bltcon1 = 0;
}

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
  WaitBlit();
     256:	2c79 0000 3b38 	movea.l 3b38 <GfxBase>,a6
     25c:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
     260:	2079 0000 3b3c 	movea.l 3b3c <hw>,a0
     266:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     26c:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     272:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     278:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     27e:	317c 002c 0066 	move.w #44,102(a0)
  Init_Blit();
  WORD shiftright = 9;
  UWORD shifthoriz = 7;
  UWORD startofword = 21*16;
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
     284:	3043           	movea.w d3,a0
     286:	d0c3           	adda.w d3,a0
     288:	3008           	move.w a0,d0
     28a:	d048           	add.w a0,d0
     28c:	d043           	add.w d3,d0
     28e:	3200           	move.w d0,d1
     290:	d240           	add.w d0,d1
     292:	3c01           	move.w d1,d6
     294:	0646 014c      	addi.w #332,d6
  WORD shiftright = 9;
     298:	7409           	moveq #9,d2
  while( nextzoom > 22 * 16) {
     29a:	0c46 0160      	cmpi.w #352,d6
     29e:	6f0e           	ble.s 2ae <main+0x2a8>
     2a0:	0646 ffed      	addi.w #-19,d6
     2a4:	9c43           	sub.w d3,d6
     2a6:	5342           	subq.w #1,d2
     2a8:	0c46 0160      	cmpi.w #352,d6
     2ac:	6ef2           	bgt.s 2a0 <main+0x29a>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
     2ae:	7a12           	moveq #18,d5
     2b0:	9a40           	sub.w d0,d5
     2b2:	3f45 0032      	move.w d5,50(sp)
  while( ZoomHorizontalStart < 0) {
     2b6:	6c00 04ce      	bge.w 786 <main+0x780>
  UWORD shifthoriz = 7;
     2ba:	7007           	moveq #7,d0
     2bc:	3205           	move.w d5,d1
     2be:	d243           	add.w d3,d1
     2c0:	0641 0013      	addi.w #19,d1
      ZoomHorizontalStart += 1 + 18 + zoomnr;
      shifthoriz--;
     2c4:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
     2c6:	4a41           	tst.w d1
     2c8:	6df4           	blt.s 2be <main+0x2b8>
     2ca:	3f41 0032      	move.w d1,50(sp)
     2ce:	0280 0000 ffff 	andi.l #65535,d0
     2d4:	2200           	move.l d0,d1
     2d6:	5281           	addq.l #1,d1
     2d8:	2001           	move.l d1,d0
     2da:	d081           	add.l d1,d0
     2dc:	d081           	add.l d1,d0
     2de:	e788           	lsl.l #3,d0
     2e0:	0680 7fff fffe 	addi.l #2147483646,d0
          linesleft--;
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
        pos4source += size4blit;
        pos4dest += size4blit + onestep;   
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     2e6:	90c3           	suba.w d3,a0
     2e8:	41e8 0012      	lea 18(a0),a0
     2ec:	3f48 0034      	move.w a0,52(sp)
     2f0:	0680 7fff fffe 	addi.l #2147483646,d0
     2f6:	d080           	add.l d0,d0
     2f8:	d880           	add.l d0,d4
     2fa:	2f44 003a      	move.l d4,58(sp)
     2fe:	45ea 0028      	lea 40(a2),a2
     302:	2f4a 003e      	move.l a2,62(sp)
  UWORD shifttoleft = 0;
     306:	426f 0042      	clr.w 66(sp)
  UWORD startofword = 21*16;
     30a:	347c 0150      	movea.w #336,a2
      nextzoom -= (19 + zoomnr);
     30e:	7aed           	moveq #-19,d5
     310:	9a43           	sub.w d3,d5
     312:	3f45 0048      	move.w d5,72(sp)
    ZoomHorizontal = ZoomHorizontalStart;
     316:	33ef 0032 0000 	move.w 50(sp),3b62 <ZoomHorizontal>
     31c:	3b62 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
     31e:	262f 003a      	move.l 58(sp),d3
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
     322:	282f 003e      	move.l 62(sp),d4
     326:	3e02           	move.w d2,d7
     328:	3002           	move.w d2,d0
     32a:	720c           	moveq #12,d1
     32c:	e368           	lsl.w d1,d0
     32e:	3a40           	movea.w d0,a5
     330:	7a00           	moveq #0,d5
     332:	3a2f 0042      	move.w 66(sp),d5
     336:	2f45 0036      	move.l d5,54(sp)
     33a:	da85           	add.l d5,d5
     33c:	2f45 0044      	move.l d5,68(sp)
     340:	2c79 0000 3b38 	movea.l 3b38 <GfxBase>,a6
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
     346:	7000           	moveq #0,d0
     348:	300a           	move.w a2,d0
     34a:	3046           	movea.w d6,a0
     34c:	b1c0           	cmpa.l d0,a0
     34e:	6e00 025c      	bgt.w 5ac <main+0x5a6>
  WaitBlit();
     352:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
     356:	2079 0000 3b3c 	movea.l 3b3c <hw>,a0
     35c:	4bed 09f0      	lea 2544(a5),a5
     360:	314d 0040      	move.w a5,64(a0)
  hw->bltcon1 = 0;
     364:	317c 0000 0042 	move.w #0,66(a0)
     36a:	3239 0000 3b62 	move.w 3b62 <ZoomHorizontal>,d1
    WORD linesleft = 272;
     370:	3a3c 0110      	move.w #272,d5
        if( linesleft >= ZoomHorizontal+1) {
     374:	b245           	cmp.w d5,d1
     376:	6c00 01cc      	bge.w 544 <main+0x53e>
          linesleft -= ZoomHorizontal;
     37a:	9a41           	sub.w d1,d5
        UWORD size4blit = ZoomHorizontal*onestep; 
     37c:	3001           	move.w d1,d0
     37e:	d041           	add.w d1,d0
     380:	d041           	add.w d1,d0
     382:	e748           	lsl.w #3,d0
     384:	7e00           	moveq #0,d7
     386:	3e00           	move.w d0,d7
     388:	2247           	movea.l d7,a1
     38a:	d3c7           	adda.l d7,a1
        if( linesleft>0) {
     38c:	4a45           	tst.w d5
     38e:	6f3a           	ble.s 3ca <main+0x3c4>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
     390:	deaf 0036      	add.l 54(sp),d7
     394:	de87           	add.l d7,d7
     396:	de83           	add.l d3,d7
          UWORD *tmpdest = pos4dest +  size4blit;
     398:	2204           	move.l d4,d1
     39a:	d289           	add.l a1,d1
          *bp = 0;
     39c:	4278 0200      	clr.w 200 <main+0x1fa>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     3a0:	3668 0002      	movea.w 2(a0),a3
     3a4:	3c40           	movea.w d0,a6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     3a6:	3668 0002      	movea.w 2(a0),a3
     3aa:	200b           	move.l a3,d0
     3ac:	0800 000e      	btst #14,d0
     3b0:	66f4           	bne.s 3a6 <main+0x3a0>
     3b2:	300e           	move.w a6,d0
  hw->bltapt = (UWORD *) source;
     3b4:	2147 0050      	move.l d7,80(a0)
  hw->bltdpt = (UWORD *) destination;
     3b8:	2141 0054      	move.l d1,84(a0)
  hw->bltsize = height*64+2;
     3bc:	317c 0042 0058 	move.w #66,88(a0)
          linesleft--;
     3c2:	5345           	subq.w #1,d5
     3c4:	3239 0000 3b62 	move.w 3b62 <ZoomHorizontal>,d1
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     3ca:	2e2f 0044      	move.l 68(sp),d7
     3ce:	de83           	add.l d3,d7
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     3d0:	3668 0002      	movea.w 2(a0),a3
     3d4:	3c40           	movea.w d0,a6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     3d6:	3668 0002      	movea.w 2(a0),a3
     3da:	200b           	move.l a3,d0
     3dc:	0800 000e      	btst #14,d0
     3e0:	66f4           	bne.s 3d6 <main+0x3d0>
     3e2:	300e           	move.w a6,d0
  hw->bltapt = (UWORD *) source;
     3e4:	2147 0050      	move.l d7,80(a0)
  hw->bltdpt = (UWORD *) destination;
     3e8:	2144 0054      	move.l d4,84(a0)
  hw->bltsize = height*64+2;
     3ec:	ed49           	lsl.w #6,d1
     3ee:	5441           	addq.w #2,d1
     3f0:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
     3f4:	d689           	add.l a1,d3
        pos4dest += size4blit + onestep; 
     3f6:	0280 0000 ffff 	andi.l #65535,d0
     3fc:	327c 0018      	movea.w #24,a1
     400:	d3c0           	adda.l d0,a1
     402:	d3c9           	adda.l a1,a1
     404:	d889           	add.l a1,d4
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     406:	33ef 0034 0000 	move.w 52(sp),3b62 <ZoomHorizontal>
     40c:	3b62 
      while(linesleft > 0) {
     40e:	4a45           	tst.w d5
     410:	6e00 0128      	bgt.w 53a <main+0x534>
      if(shiftright < 0) {
        shiftright += 16;
        shifttoleft = 1;
      }
    }
    startofword -= 16;
     414:	45ea fff0      	lea -16(a2),a2
     418:	55af 003a      	subq.l #2,58(sp)
     41c:	55af 003e      	subq.l #2,62(sp)
  for(int i=0;i<22;i++) {
     420:	72f0           	moveq #-16,d1
     422:	b24a           	cmp.w a2,d1
     424:	6600 fef0      	bne.w 316 <main+0x310>
  if( Zoom_LevelOfZoom == 17)
     428:	3039 0000 3b58 	move.w 3b58 <Zoom_LevelOfZoom>,d0
     42e:	0c40 0011      	cmpi.w #17,d0
     432:	6700 0134      	beq.w 568 <main+0x562>
    Zoom_LevelOfZoom = 0;
  else
    Zoom_LevelOfZoom++;
     436:	5240           	addq.w #1,d0
     438:	33c0 0000 3b58 	move.w d0,3b58 <Zoom_LevelOfZoom>
     43e:	2679 0000 3b3c 	movea.l 3b3c <hw>,a3
     444:	3039 00df f016 	move.w dff016 <gcc8_c_support.c.e9862530+0xddafc0>,d0
	while(!MouseRight()) {
     44a:	0800 000a      	btst #10,d0
     44e:	6600 fd68      	bne.w 1b8 <main+0x1b2>
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     452:	2079 0000 3b30 	movea.l 3b30 <VBR.lto_priv.2>,a0
     458:	217c 0000 0ed0 	move.l #3792,108(a0)
     45e:	006c 
	WaitVbl();
     460:	4e94           	jsr (a4)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     462:	302b 0002      	move.w 2(a3),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     466:	302b 0002      	move.w 2(a3),d0
     46a:	0800 000e      	btst #14,d0
     46e:	66f6           	bne.s 466 <main+0x460>
	hw->intena=0x7fff;//disable all interrupts
     470:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     476:	377c 7fff 009c 	move.w #32767,156(a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
     47c:	377c 7fff 0096 	move.w #32767,150(a3)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     482:	2079 0000 3b30 	movea.l 3b30 <VBR.lto_priv.2>,a0
     488:	2179 0000 3b34 	move.l 3b34 <SystemIrq>,108(a0)
     48e:	006c 
	hw->cop1lc=(ULONG)GfxBase->copinit;
     490:	2c79 0000 3b38 	movea.l 3b38 <GfxBase>,a6
     496:	276e 0026 0080 	move.l 38(a6),128(a3)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     49c:	276e 0032 0084 	move.l 50(a6),132(a3)
	hw->copjmp1=0x7fff; //start coppper
     4a2:	377c 7fff 0088 	move.w #32767,136(a3)
	hw->intena=SystemInts|0x8000;
     4a8:	3039 0000 3b2e 	move.w 3b2e <SystemInts>,d0
     4ae:	0040 8000      	ori.w #-32768,d0
     4b2:	3740 009a      	move.w d0,154(a3)
	hw->dmacon=SystemDMA|0x8000;
     4b6:	3039 0000 3b2c 	move.w 3b2c <SystemDMA>,d0
     4bc:	0040 8000      	ori.w #-32768,d0
     4c0:	3740 0096      	move.w d0,150(a3)
	hw->adkcon=SystemADKCON|0x8000;
     4c4:	3039 0000 3b2a 	move.w 3b2a <SystemADKCON>,d0
     4ca:	0040 8000      	ori.w #-32768,d0
     4ce:	3740 009e      	move.w d0,158(a3)
	LoadView(ActiView);
     4d2:	2279 0000 3b26 	movea.l 3b26 <ActiView>,a1
     4d8:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     4dc:	2c79 0000 3b38 	movea.l 3b38 <GfxBase>,a6
     4e2:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     4e6:	2c79 0000 3b38 	movea.l 3b38 <GfxBase>,a6
     4ec:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     4f0:	2c79 0000 3b38 	movea.l 3b38 <GfxBase>,a6
     4f6:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     4fa:	2c79 0000 3b38 	movea.l 3b38 <GfxBase>,a6
     500:	4eae fe32      	jsr -462(a6)
	Enable();
     504:	2c79 0000 3b68 	movea.l 3b68 <SysBase>,a6
     50a:	4eae ff82      	jsr -126(a6)
	RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     50e:	2c79 0000 3b68 	movea.l 3b68 <SysBase>,a6
     514:	2279 0000 3b64 	movea.l 3b64 <DOSBase>,a1
     51a:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     51e:	2c79 0000 3b68 	movea.l 3b68 <SysBase>,a6
     524:	2279 0000 3b38 	movea.l 3b38 <GfxBase>,a1
     52a:	4eae fe62      	jsr -414(a6)
}
     52e:	7000           	moveq #0,d0
     530:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     534:	4fef 0028      	lea 40(sp),sp
     538:	4e75           	rts
      while(linesleft > 0) {
     53a:	322f 0034      	move.w 52(sp),d1
        if( linesleft >= ZoomHorizontal+1) {
     53e:	b245           	cmp.w d5,d1
     540:	6d00 fe38      	blt.w 37a <main+0x374>
        UWORD size4blit = ZoomHorizontal*onestep; 
     544:	3005           	move.w d5,d0
     546:	d045           	add.w d5,d0
     548:	d045           	add.w d5,d0
     54a:	e748           	lsl.w #3,d0
     54c:	7200           	moveq #0,d1
     54e:	3200           	move.w d0,d1
     550:	2241           	movea.l d1,a1
     552:	d3c1           	adda.l d1,a1
     554:	3205           	move.w d5,d1
          linesleft = 0;
     556:	4245           	clr.w d5
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     558:	2e2f 0044      	move.l 68(sp),d7
     55c:	de83           	add.l d3,d7
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     55e:	3668 0002      	movea.w 2(a0),a3
     562:	3c40           	movea.w d0,a6
     564:	6000 fe70      	bra.w 3d6 <main+0x3d0>
    Zoom_LevelOfZoom = 0;
     568:	4279 0000 3b58 	clr.w 3b58 <Zoom_LevelOfZoom>
     56e:	2679 0000 3b3c 	movea.l 3b3c <hw>,a3
     574:	3039 00df f016 	move.w dff016 <gcc8_c_support.c.e9862530+0xddafc0>,d0
	while(!MouseRight()) {
     57a:	0800 000a      	btst #10,d0
     57e:	6700 fed2      	beq.w 452 <main+0x44c>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     582:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddafae>,d0
     588:	2f40 004e      	move.l d0,78(sp)
		vpos&=0x1ff00;
     58c:	202f 004e      	move.l 78(sp),d0
     590:	0280 0001 ff00 	andi.l #130816,d0
     596:	2f40 004e      	move.l d0,78(sp)
		if (vpos!=(311<<8))
     59a:	202f 004e      	move.l 78(sp),d0
     59e:	0c80 0001 3700 	cmpi.l #79616,d0
     5a4:	6700 fc12      	beq.w 1b8 <main+0x1b2>
     5a8:	6000 fc32      	bra.w 1dc <main+0x1d6>
  UWORD colnr = nextzoom - startofword - 1;                                                                          
     5ac:	3a06           	move.w d6,d5
     5ae:	9a4a           	sub.w a2,d5
     5b0:	5345           	subq.w #1,d5
  if( shiftright == 0) {
     5b2:	5342           	subq.w #1,d2
     5b4:	4a47           	tst.w d7
     5b6:	6600 014c      	bne.w 704 <main+0x6fe>
    ZoomBlit_Increment4SrcA = 1;
     5ba:	33fc 0001 0000 	move.w #1,3b24 <ZoomBlit_Increment4SrcA>
     5c0:	3b24 
     5c2:	367c fde4      	movea.w #-540,a3
  WaitBlit(); 
     5c6:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     5ca:	2079 0000 3b3c 	movea.l 3b3c <hw>,a0
     5d0:	314d 0042      	move.w a5,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     5d4:	314b 0040      	move.w a3,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     5d8:	0285 0000 ffff 	andi.l #65535,d5
     5de:	7010           	moveq #16,d0
     5e0:	9085           	sub.l d5,d0
     5e2:	2a00           	move.l d0,d5
     5e4:	7000           	moveq #0,d0
     5e6:	4640           	not.w d0
     5e8:	eba8           	lsl.l d5,d0
     5ea:	3140 0070      	move.w d0,112(a0)
      nextzoom -= (19 + zoomnr);
     5ee:	dc6f 0048      	add.w 72(sp),d6
     5f2:	3a79 0000 3b62 	movea.w 3b62 <ZoomHorizontal>,a5
    WORD linesleft = 272;
     5f8:	303c 0110      	move.w #272,d0
     5fc:	3a00           	move.w d0,d5
        if( linesleft >= ZoomHorizontal+1) {
     5fe:	b04d           	cmp.w a5,d0
     600:	6f00 014e      	ble.w 750 <main+0x74a>
          linesleft -= ZoomHorizontal;
     604:	904d           	sub.w a5,d0
        UWORD size4blit = ZoomHorizontal*onestep;
     606:	320d           	move.w a5,d1
     608:	d24d           	add.w a5,d1
     60a:	d24d           	add.w a5,d1
     60c:	e749           	lsl.w #3,d1
     60e:	7a00           	moveq #0,d5
     610:	3a01           	move.w d1,d5
     612:	2645           	movea.l d5,a3
     614:	d7c5           	adda.l d5,a3
        if( linesleft>0) {
     616:	4a40           	tst.w d0
     618:	6f00 00cc      	ble.w 6e6 <main+0x6e0>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
     61c:	daaf 0036      	add.l 54(sp),d5
     620:	da85           	add.l d5,d5
     622:	da83           	add.l d3,d5
     624:	2f45 002e      	move.l d5,46(sp)
          UWORD *tmpdest = pos4dest + size4blit;
     628:	4bf3 4800      	lea (0,a3,d4.l),a5
          *bp = 0;
     62c:	4278 0200      	clr.w 200 <main+0x1fa>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     630:	3268 0002      	movea.w 2(a0),a1
     634:	2a2f 002e      	move.l 46(sp),d5
     638:	3c40           	movea.w d0,a6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     63a:	3268 0002      	movea.w 2(a0),a1
     63e:	2009           	move.l a1,d0
     640:	0800 000e      	btst #14,d0
     644:	66f4           	bne.s 63a <main+0x634>
     646:	2f45 002e      	move.l d5,46(sp)
     64a:	300e           	move.w a6,d0
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
     64c:	7a00           	moveq #0,d5
     64e:	3a39 0000 3b24 	move.w 3b24 <ZoomBlit_Increment4SrcA>,d5
     654:	2245           	movea.l d5,a1
     656:	d3c9           	adda.l a1,a1
     658:	2c6f 002e      	movea.l 46(sp),a6
     65c:	ddc9           	adda.l a1,a6
     65e:	214e 0050      	move.l a6,80(a0)
  hw->bltbpt = source;
     662:	216f 002e 004c 	move.l 46(sp),76(a0)
  hw->bltdpt = destination;
     668:	214d 0054      	move.l a5,84(a0)
  hw->bltsize = height*64+2;
     66c:	317c 0042 0058 	move.w #66,88(a0)
          linesleft--;
     672:	5340           	subq.w #1,d0
     674:	3a39 0000 3b62 	move.w 3b62 <ZoomHorizontal>,d5
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     67a:	2a6f 0044      	movea.l 68(sp),a5
     67e:	dbc3           	adda.l d3,a5
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     680:	3c68 0002      	movea.w 2(a0),a6
     684:	3f40 002e      	move.w d0,46(sp)
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     688:	3c68 0002      	movea.w 2(a0),a6
     68c:	200e           	move.l a6,d0
     68e:	0800 000e      	btst #14,d0
     692:	66f4           	bne.s 688 <main+0x682>
     694:	302f 002e      	move.w 46(sp),d0
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
     698:	43f5 9800      	lea (0,a5,a1.l),a1
     69c:	2149 0050      	move.l a1,80(a0)
  hw->bltbpt = source;
     6a0:	214d 004c      	move.l a5,76(a0)
  hw->bltdpt = destination;
     6a4:	2144 0054      	move.l d4,84(a0)
  hw->bltsize = height*64+2;
     6a8:	ed4d           	lsl.w #6,d5
     6aa:	5445           	addq.w #2,d5
     6ac:	3145 0058      	move.w d5,88(a0)
        pos4source += size4blit;
     6b0:	d68b           	add.l a3,d3
        pos4dest += size4blit + onestep;   
     6b2:	0281 0000 ffff 	andi.l #65535,d1
     6b8:	2241           	movea.l d1,a1
     6ba:	43e9 0018      	lea 24(a1),a1
     6be:	d3c9           	adda.l a1,a1
     6c0:	d889           	add.l a1,d4
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     6c2:	33ef 0034 0000 	move.w 52(sp),3b62 <ZoomHorizontal>
     6c8:	3b62 
      while( linesleft > 0) {
     6ca:	4a40           	tst.w d0
     6cc:	6e00 00b0      	bgt.w 77e <main+0x778>
      if(shiftright < 0) {
     6d0:	4a42           	tst.w d2
     6d2:	6c00 fd40      	bge.w 414 <main+0x40e>
        shiftright += 16;
     6d6:	3407           	move.w d7,d2
     6d8:	0642 000f      	addi.w #15,d2
        shifttoleft = 1;
     6dc:	3f7c 0001 0042 	move.w #1,66(sp)
     6e2:	6000 fd30      	bra.w 414 <main+0x40e>
     6e6:	7a00           	moveq #0,d5
     6e8:	3a39 0000 3b24 	move.w 3b24 <ZoomBlit_Increment4SrcA>,d5
     6ee:	2245           	movea.l d5,a1
     6f0:	d3c5           	adda.l d5,a1
        if( linesleft>0) {
     6f2:	3a0d           	move.w a5,d5
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     6f4:	2a6f 0044      	movea.l 68(sp),a5
     6f8:	dbc3           	adda.l d3,a5
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     6fa:	3c68 0002      	movea.w 2(a0),a6
     6fe:	3f40 002e      	move.w d0,46(sp)
     702:	6084           	bra.s 688 <main+0x682>
  ZoomBlit_Increment4SrcA = 0;
     704:	4279 0000 3b24 	clr.w 3b24 <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
     70a:	3002           	move.w d2,d0
     70c:	720c           	moveq #12,d1
     70e:	e368           	lsl.w d1,d0
     710:	3640           	movea.w d0,a3
     712:	47eb 0de4      	lea 3556(a3),a3
  WaitBlit(); 
     716:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     71a:	2079 0000 3b3c 	movea.l 3b3c <hw>,a0
     720:	314d 0042      	move.w a5,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     724:	314b 0040      	move.w a3,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     728:	0285 0000 ffff 	andi.l #65535,d5
     72e:	7010           	moveq #16,d0
     730:	9085           	sub.l d5,d0
     732:	2a00           	move.l d0,d5
     734:	7000           	moveq #0,d0
     736:	4640           	not.w d0
     738:	eba8           	lsl.l d5,d0
     73a:	3140 0070      	move.w d0,112(a0)
      nextzoom -= (19 + zoomnr);
     73e:	dc6f 0048      	add.w 72(sp),d6
     742:	3a79 0000 3b62 	movea.w 3b62 <ZoomHorizontal>,a5
    WORD linesleft = 272;
     748:	303c 0110      	move.w #272,d0
     74c:	6000 feae      	bra.w 5fc <main+0x5f6>
        UWORD size4blit = ZoomHorizontal*onestep;
     750:	3200           	move.w d0,d1
     752:	d240           	add.w d0,d1
     754:	d240           	add.w d0,d1
     756:	e749           	lsl.w #3,d1
     758:	7000           	moveq #0,d0
     75a:	3039 0000 3b24 	move.w 3b24 <ZoomBlit_Increment4SrcA>,d0
     760:	2240           	movea.l d0,a1
     762:	d3c0           	adda.l d0,a1
     764:	3001           	move.w d1,d0
     766:	2640           	movea.l d0,a3
     768:	d7c0           	adda.l d0,a3
          linesleft = 0;
     76a:	4240           	clr.w d0
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     76c:	2a6f 0044      	movea.l 68(sp),a5
     770:	dbc3           	adda.l d3,a5
     772:	3c68 0002      	movea.w 2(a0),a6
     776:	3f40 002e      	move.w d0,46(sp)
     77a:	6000 ff0c      	bra.w 688 <main+0x682>
      while( linesleft > 0) {
     77e:	3a6f 0034      	movea.w 52(sp),a5
     782:	6000 fe78      	bra.w 5fc <main+0x5f6>
  while( ZoomHorizontalStart < 0) {
     786:	203c 8000 00be 	move.l #-2147483458,d0
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     78c:	90c3           	suba.w d3,a0
     78e:	41e8 0012      	lea 18(a0),a0
     792:	3f48 0034      	move.w a0,52(sp)
     796:	0680 7fff fffe 	addi.l #2147483646,d0
     79c:	d080           	add.l d0,d0
     79e:	d880           	add.l d0,d4
     7a0:	2f44 003a      	move.l d4,58(sp)
     7a4:	45ea 0028      	lea 40(a2),a2
     7a8:	2f4a 003e      	move.l a2,62(sp)
  UWORD shifttoleft = 0;
     7ac:	426f 0042      	clr.w 66(sp)
  UWORD startofword = 21*16;
     7b0:	347c 0150      	movea.w #336,a2
      nextzoom -= (19 + zoomnr);
     7b4:	7aed           	moveq #-19,d5
     7b6:	9a43           	sub.w d3,d5
     7b8:	3f45 0048      	move.w d5,72(sp)
     7bc:	6000 fb58      	bra.w 316 <main+0x310>
		Exit(0);
     7c0:	9dce           	suba.l a6,a6
     7c2:	7200           	moveq #0,d1
     7c4:	4eae ff70      	jsr -144(a6)
     7c8:	6000 f88a      	bra.w 54 <main+0x4e>
		Exit(0);
     7cc:	2c79 0000 3b64 	movea.l 3b64 <DOSBase>,a6
     7d2:	7200           	moveq #0,d1
     7d4:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     7d8:	2c79 0000 3b68 	movea.l 3b68 <SysBase>,a6
     7de:	43f9 0000 1a54 	lea 1a54 <incbin_swfont_end+0xce>,a1
     7e4:	7000           	moveq #0,d0
     7e6:	4eae fdd8      	jsr -552(a6)
     7ea:	23c0 0000 3b64 	move.l d0,3b64 <DOSBase>
	if (!DOSBase)
     7f0:	6600 f862      	bne.w 54 <main+0x4e>
     7f4:	60ca           	bra.s 7c0 <main+0x7ba>
	APTR vbr = 0;
     7f6:	7000           	moveq #0,d0
	VBR=GetVBR();
     7f8:	23c0 0000 3b30 	move.l d0,3b30 <VBR.lto_priv.2>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     7fe:	2079 0000 3b30 	movea.l 3b30 <VBR.lto_priv.2>,a0
     804:	2028 006c      	move.l 108(a0),d0
	SystemIrq=GetInterruptHandler(); //store interrupt register
     808:	23c0 0000 3b34 	move.l d0,3b34 <SystemIrq>
	WaitVbl();
     80e:	4e94           	jsr (a4)
  hw->dmacon = 0b1001001111100000;
     810:	2679 0000 3b3c 	movea.l 3b3c <hw>,a3
     816:	377c 93e0 0096 	move.w #-27680,150(a3)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     81c:	2079 0000 3b30 	movea.l 3b30 <VBR.lto_priv.2>,a0
     822:	217c 0000 0ed0 	move.l #3792,108(a0)
     828:	006c 
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     82a:	377c c020 009a 	move.w #-16352,154(a3)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     830:	377c 0020 009c 	move.w #32,156(a3)
     836:	3039 00df f016 	move.w dff016 <gcc8_c_support.c.e9862530+0xddafc0>,d0
	while(!MouseRight()) {
     83c:	0800 000a      	btst #10,d0
     840:	6600 f976      	bne.w 1b8 <main+0x1b2>
     844:	6000 fc0c      	bra.w 452 <main+0x44c>

00000848 <warpmode.part.0>:
void warpmode(int on) 
     848:	598f           	subq.l #4,sp
     84a:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     84c:	4aaf 000c      	tst.l 12(sp)
     850:	674c           	beq.s 89e <warpmode.part.0+0x56>
     852:	4878 0001      	pea 1 <_start+0x1>
     856:	740b           	moveq #11,d2
     858:	d48f           	add.l sp,d2
     85a:	2f02           	move.l d2,-(sp)
     85c:	42a7           	clr.l -(sp)
     85e:	4879 0000 19ba 	pea 19ba <incbin_swfont_end+0x34>
     864:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdbfa9>
     868:	4878 0052      	pea 52 <main+0x4c>
     86c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeebf0a>
     872:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     876:	203c 0000 19a0 	move.l #6560,d0
     87c:	4878 0001      	pea 1 <_start+0x1>
     880:	2f02           	move.l d2,-(sp)
     882:	42a7           	clr.l -(sp)
     884:	2f00           	move.l d0,-(sp)
     886:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdbfa9>
     88a:	4878 0052      	pea 52 <main+0x4c>
     88e:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeebf0a>
	}
}
     894:	4fef 0018      	lea 24(sp),sp
     898:	241f           	move.l (sp)+,d2
     89a:	588f           	addq.l #4,sp
     89c:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     89e:	4878 0001      	pea 1 <_start+0x1>
     8a2:	740b           	moveq #11,d2
     8a4:	d48f           	add.l sp,d2
     8a6:	2f02           	move.l d2,-(sp)
     8a8:	42a7           	clr.l -(sp)
     8aa:	4879 0000 19c4 	pea 19c4 <incbin_swfont_end+0x3e>
     8b0:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdbfa9>
     8b4:	4878 0052      	pea 52 <main+0x4c>
     8b8:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeebf0a>
     8be:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     8c2:	203c 0000 1987 	move.l #6535,d0
     8c8:	4878 0001      	pea 1 <_start+0x1>
     8cc:	2f02           	move.l d2,-(sp)
     8ce:	42a7           	clr.l -(sp)
     8d0:	2f00           	move.l d0,-(sp)
     8d2:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdbfa9>
     8d6:	4878 0052      	pea 52 <main+0x4c>
     8da:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeebf0a>
}
     8e0:	4fef 0018      	lea 24(sp),sp
     8e4:	241f           	move.l (sp)+,d2
     8e6:	588f           	addq.l #4,sp
     8e8:	4e75           	rts

000008ea <KPrintF>:
{
     8ea:	4fef ff80      	lea -128(sp),sp
     8ee:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
     8f2:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeebf0a>
     8f8:	6734           	beq.s 92e <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     8fa:	2c79 0000 3b68 	movea.l 3b68 <SysBase>,a6
     900:	206f 0090      	movea.l 144(sp),a0
     904:	43ef 0094      	lea 148(sp),a1
     908:	45f9 0000 11c0 	lea 11c0 <PutChar>,a2
     90e:	47ef 000c      	lea 12(sp),a3
     912:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     916:	2f0b           	move.l a3,-(sp)
     918:	4878 0056      	pea 56 <main+0x50>
     91c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeebf0a>
     922:	508f           	addq.l #8,sp
}
     924:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     928:	4fef 0080      	lea 128(sp),sp
     92c:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     92e:	2c79 0000 3b68 	movea.l 3b68 <SysBase>,a6
     934:	206f 0090      	movea.l 144(sp),a0
     938:	43ef 0094      	lea 148(sp),a1
     93c:	45f9 0000 11b2 	lea 11b2 <KPutCharX>,a2
     942:	97cb           	suba.l a3,a3
     944:	4eae fdf6      	jsr -522(a6)
}
     948:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     94c:	4fef 0080      	lea 128(sp),sp
     950:	4e75           	rts

00000952 <ClbuildZoom>:
ULONG * ClbuildZoom() {
     952:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
     956:	2c79 0000 3b68 	movea.l 3b68 <SysBase>,a6
     95c:	203c 0000 a48c 	move.l #42124,d0
     962:	7202           	moveq #2,d1
     964:	4eae ff3a      	jsr -198(a6)
     968:	2440           	movea.l d0,a2
  if( retval == 0) {
     96a:	4a80           	tst.l d0
     96c:	6700 011e      	beq.w a8c <ClbuildZoom+0x13a>
    *cl++ = *clpartinstruction++;
     970:	24b9 0000 3ac4 	move.l 3ac4 <ClsSprites>,(a2)
     976:	2579 0000 3ac8 	move.l 3ac8 <ClsSprites+0x4>,4(a2)
     97c:	0004 
     97e:	2579 0000 3acc 	move.l 3acc <ClsSprites+0x8>,8(a2)
     984:	0008 
     986:	2579 0000 3ad0 	move.l 3ad0 <ClsSprites+0xc>,12(a2)
     98c:	000c 
     98e:	2579 0000 3ad4 	move.l 3ad4 <ClsSprites+0x10>,16(a2)
     994:	0010 
     996:	2579 0000 3ad8 	move.l 3ad8 <ClsSprites+0x14>,20(a2)
     99c:	0014 
     99e:	2579 0000 3adc 	move.l 3adc <ClsSprites+0x18>,24(a2)
     9a4:	0018 
     9a6:	2579 0000 3ae0 	move.l 3ae0 <ClsSprites+0x1c>,28(a2)
     9ac:	001c 
     9ae:	2579 0000 3ae4 	move.l 3ae4 <ClsSprites+0x20>,32(a2)
     9b4:	0020 
     9b6:	2579 0000 3ae8 	move.l 3ae8 <ClsSprites+0x24>,36(a2)
     9bc:	0024 
     9be:	2579 0000 3aec 	move.l 3aec <ClsSprites+0x28>,40(a2)
     9c4:	0028 
     9c6:	2579 0000 3af0 	move.l 3af0 <ClsSprites+0x2c>,44(a2)
     9cc:	002c 
     9ce:	2579 0000 3af4 	move.l 3af4 <ClsSprites+0x30>,48(a2)
     9d4:	0030 
     9d6:	2579 0000 3af8 	move.l 3af8 <ClsSprites+0x34>,52(a2)
     9dc:	0034 
     9de:	2579 0000 3afc 	move.l 3afc <ClsSprites+0x38>,56(a2)
     9e4:	0038 
     9e6:	2579 0000 3b00 	move.l 3b00 <ClsSprites+0x3c>,60(a2)
     9ec:	003c 
    *cl++ = *clpartinstruction++;
     9ee:	2579 0000 3a94 	move.l 3a94 <ClScreen>,64(a2)
     9f4:	0040 
     9f6:	2579 0000 3a98 	move.l 3a98 <ClScreen+0x4>,68(a2)
     9fc:	0044 
     9fe:	2579 0000 3a9c 	move.l 3a9c <ClScreen+0x8>,72(a2)
     a04:	0048 
     a06:	2579 0000 3aa0 	move.l 3aa0 <ClScreen+0xc>,76(a2)
     a0c:	004c 
     a0e:	2579 0000 3aa4 	move.l 3aa4 <ClScreen+0x10>,80(a2)
     a14:	0050 
     a16:	2579 0000 3aa8 	move.l 3aa8 <ClScreen+0x14>,84(a2)
     a1c:	0054 
     a1e:	2579 0000 3aac 	move.l 3aac <ClScreen+0x18>,88(a2)
     a24:	0058 
     a26:	2579 0000 3ab0 	move.l 3ab0 <ClScreen+0x1c>,92(a2)
     a2c:	005c 
     a2e:	2579 0000 3ab4 	move.l 3ab4 <ClScreen+0x20>,96(a2)
     a34:	0060 
     a36:	2579 0000 3ab8 	move.l 3ab8 <ClScreen+0x24>,100(a2)
     a3c:	0064 
     a3e:	2579 0000 3abc 	move.l 3abc <ClScreen+0x28>,104(a2)
     a44:	0068 
     a46:	2579 0000 3ac0 	move.l 3ac0 <ClScreen+0x2c>,108(a2)
     a4c:	006c 
  *cl++ = 0x00e00000;
     a4e:	257c 00e0 0000 	move.l #14680064,112(a2)
     a54:	0070 
  *cl++ = 0x00e20000;
     a56:	257c 00e2 0000 	move.l #14811136,116(a2)
     a5c:	0074 
  *cl++ = 0x00e40000;
     a5e:	257c 00e4 0000 	move.l #14942208,120(a2)
     a64:	0078 
  *cl++ = 0x00e60000;
     a66:	257c 00e6 0000 	move.l #15073280,124(a2)
     a6c:	007c 
    *cl++ = *clpartinstruction++;
     a6e:	2579 0000 3a8c 	move.l 3a8c <ClColor>,128(a2)
     a74:	0080 
     a76:	2579 0000 3a90 	move.l 3a90 <ClColor+0x4>,132(a2)
     a7c:	0084 
   *cl = 0xfffffffe;
     a7e:	70fe           	moveq #-2,d0
     a80:	2540 0088      	move.l d0,136(a2)
}
     a84:	200a           	move.l a2,d0
     a86:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     a8a:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     a8c:	2c79 0000 3b64 	movea.l 3b64 <DOSBase>,a6
     a92:	4eae ffc4      	jsr -60(a6)
     a96:	2c79 0000 3b64 	movea.l 3b64 <DOSBase>,a6
     a9c:	2200           	move.l d0,d1
     a9e:	243c 0000 19cf 	move.l #6607,d2
     aa4:	7628           	moveq #40,d3
     aa6:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     aaa:	2c79 0000 3b64 	movea.l 3b64 <DOSBase>,a6
     ab0:	7201           	moveq #1,d1
     ab2:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     ab6:	24b9 0000 3ac4 	move.l 3ac4 <ClsSprites>,(a2)
     abc:	2579 0000 3ac8 	move.l 3ac8 <ClsSprites+0x4>,4(a2)
     ac2:	0004 
     ac4:	2579 0000 3acc 	move.l 3acc <ClsSprites+0x8>,8(a2)
     aca:	0008 
     acc:	2579 0000 3ad0 	move.l 3ad0 <ClsSprites+0xc>,12(a2)
     ad2:	000c 
     ad4:	2579 0000 3ad4 	move.l 3ad4 <ClsSprites+0x10>,16(a2)
     ada:	0010 
     adc:	2579 0000 3ad8 	move.l 3ad8 <ClsSprites+0x14>,20(a2)
     ae2:	0014 
     ae4:	2579 0000 3adc 	move.l 3adc <ClsSprites+0x18>,24(a2)
     aea:	0018 
     aec:	2579 0000 3ae0 	move.l 3ae0 <ClsSprites+0x1c>,28(a2)
     af2:	001c 
     af4:	2579 0000 3ae4 	move.l 3ae4 <ClsSprites+0x20>,32(a2)
     afa:	0020 
     afc:	2579 0000 3ae8 	move.l 3ae8 <ClsSprites+0x24>,36(a2)
     b02:	0024 
     b04:	2579 0000 3aec 	move.l 3aec <ClsSprites+0x28>,40(a2)
     b0a:	0028 
     b0c:	2579 0000 3af0 	move.l 3af0 <ClsSprites+0x2c>,44(a2)
     b12:	002c 
     b14:	2579 0000 3af4 	move.l 3af4 <ClsSprites+0x30>,48(a2)
     b1a:	0030 
     b1c:	2579 0000 3af8 	move.l 3af8 <ClsSprites+0x34>,52(a2)
     b22:	0034 
     b24:	2579 0000 3afc 	move.l 3afc <ClsSprites+0x38>,56(a2)
     b2a:	0038 
     b2c:	2579 0000 3b00 	move.l 3b00 <ClsSprites+0x3c>,60(a2)
     b32:	003c 
    *cl++ = *clpartinstruction++;
     b34:	2579 0000 3a94 	move.l 3a94 <ClScreen>,64(a2)
     b3a:	0040 
     b3c:	2579 0000 3a98 	move.l 3a98 <ClScreen+0x4>,68(a2)
     b42:	0044 
     b44:	2579 0000 3a9c 	move.l 3a9c <ClScreen+0x8>,72(a2)
     b4a:	0048 
     b4c:	2579 0000 3aa0 	move.l 3aa0 <ClScreen+0xc>,76(a2)
     b52:	004c 
     b54:	2579 0000 3aa4 	move.l 3aa4 <ClScreen+0x10>,80(a2)
     b5a:	0050 
     b5c:	2579 0000 3aa8 	move.l 3aa8 <ClScreen+0x14>,84(a2)
     b62:	0054 
     b64:	2579 0000 3aac 	move.l 3aac <ClScreen+0x18>,88(a2)
     b6a:	0058 
     b6c:	2579 0000 3ab0 	move.l 3ab0 <ClScreen+0x1c>,92(a2)
     b72:	005c 
     b74:	2579 0000 3ab4 	move.l 3ab4 <ClScreen+0x20>,96(a2)
     b7a:	0060 
     b7c:	2579 0000 3ab8 	move.l 3ab8 <ClScreen+0x24>,100(a2)
     b82:	0064 
     b84:	2579 0000 3abc 	move.l 3abc <ClScreen+0x28>,104(a2)
     b8a:	0068 
     b8c:	2579 0000 3ac0 	move.l 3ac0 <ClScreen+0x2c>,108(a2)
     b92:	006c 
  *cl++ = 0x00e00000;
     b94:	257c 00e0 0000 	move.l #14680064,112(a2)
     b9a:	0070 
  *cl++ = 0x00e20000;
     b9c:	257c 00e2 0000 	move.l #14811136,116(a2)
     ba2:	0074 
  *cl++ = 0x00e40000;
     ba4:	257c 00e4 0000 	move.l #14942208,120(a2)
     baa:	0078 
  *cl++ = 0x00e60000;
     bac:	257c 00e6 0000 	move.l #15073280,124(a2)
     bb2:	007c 
    *cl++ = *clpartinstruction++;
     bb4:	2579 0000 3a8c 	move.l 3a8c <ClColor>,128(a2)
     bba:	0080 
     bbc:	2579 0000 3a90 	move.l 3a90 <ClColor+0x4>,132(a2)
     bc2:	0084 
   *cl = 0xfffffffe;
     bc4:	70fe           	moveq #-2,d0
     bc6:	2540 0088      	move.l d0,136(a2)
}
     bca:	200a           	move.l a2,d0
     bcc:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     bd0:	4e75           	rts

00000bd2 <Zoom_InitRun>:
void Zoom_InitRun() {
     bd2:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     bd6:	2c79 0000 3b68 	movea.l 3b68 <SysBase>,a6
     bdc:	7004           	moveq #4,d0
     bde:	7202           	moveq #2,d1
     be0:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
     be4:	33fc 0010 0000 	move.w #16,3b62 <ZoomHorizontal>
     bea:	3b62 
  Copperlist1 = ClbuildZoom( );
     bec:	45fa fd64      	lea 952 <ClbuildZoom>(pc),a2
     bf0:	4e92           	jsr (a2)
     bf2:	23c0 0000 3b54 	move.l d0,3b54 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
     bf8:	4e92           	jsr (a2)
     bfa:	23c0 0000 3b50 	move.l d0,3b50 <Copperlist2>
  Bitplane1 = AllocMem(ZMLINESIZE*270, MEMF_CHIP);
     c00:	2c79 0000 3b68 	movea.l 3b68 <SysBase>,a6
     c06:	203c 0000 32a0 	move.l #12960,d0
     c0c:	7202           	moveq #2,d1
     c0e:	4eae ff3a      	jsr -198(a6)
     c12:	23c0 0000 3b4c 	move.l d0,3b4c <Bitplane1>
  if(Bitplane1 == 0) {
     c18:	6700 0254      	beq.w e6e <Zoom_InitRun+0x29c>
  DrawBuffer = Bitplane1+2;
     c1c:	5080           	addq.l #8,d0
     c1e:	23c0 0000 3b5a 	move.l d0,3b5a <DrawBuffer>
  DrawCopper = Copperlist1;
     c24:	23f9 0000 3b54 	move.l 3b54 <Copperlist1>,3b48 <DrawCopper>
     c2a:	0000 3b48 
  Bitplane2 = AllocMem(ZMLINESIZE*270, MEMF_CHIP);
     c2e:	2c79 0000 3b68 	movea.l 3b68 <SysBase>,a6
     c34:	203c 0000 32a0 	move.l #12960,d0
     c3a:	7202           	moveq #2,d1
     c3c:	4eae ff3a      	jsr -198(a6)
     c40:	23c0 0000 3b44 	move.l d0,3b44 <Bitplane2>
  if(Bitplane2 == 0) {
     c46:	6700 01d2      	beq.w e1a <Zoom_InitRun+0x248>
  ViewBuffer = Bitplane2+2;
     c4a:	2040           	movea.l d0,a0
     c4c:	5088           	addq.l #8,a0
     c4e:	23c8 0000 3b5e 	move.l a0,3b5e <ViewBuffer>
  ViewCopper = Copperlist2;
     c54:	23f9 0000 3b50 	move.l 3b50 <Copperlist2>,3b40 <ViewCopper>
     c5a:	0000 3b40 
  *bp = 0;
     c5e:	31fc 0000 0200 	move.w #0,200 <main+0x1fa>
  for(int i=0;i<128+8;i++) {
     c64:	0680 0000 3308 	addi.l #13064,d0
      *destination++ = 0x55555555;
     c6a:	20bc 5555 5555 	move.l #1431655765,(a0)
     c70:	217c 5555 5555 	move.l #1431655765,4(a0)
     c76:	0004 
     c78:	217c 5555 5555 	move.l #1431655765,8(a0)
     c7e:	0008 
     c80:	217c 5555 5555 	move.l #1431655765,12(a0)
     c86:	000c 
     c88:	217c 5555 5555 	move.l #1431655765,16(a0)
     c8e:	0010 
     c90:	217c 5555 5555 	move.l #1431655765,20(a0)
     c96:	0014 
     c98:	217c 5555 5555 	move.l #1431655765,24(a0)
     c9e:	0018 
     ca0:	217c 5555 5555 	move.l #1431655765,28(a0)
     ca6:	001c 
     ca8:	217c 5555 5555 	move.l #1431655765,32(a0)
     cae:	0020 
     cb0:	217c 5555 5555 	move.l #1431655765,36(a0)
     cb6:	0024 
     cb8:	217c 5555 5555 	move.l #1431655765,40(a0)
     cbe:	0028 
     cc0:	217c 5555 5555 	move.l #1431655765,44(a0)
     cc6:	002c 
      *destination++ = 0xaaaaaaaa;
     cc8:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     cce:	0030 
     cd0:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     cd6:	0034 
     cd8:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     cde:	0038 
     ce0:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     ce6:	003c 
     ce8:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     cee:	0040 
     cf0:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     cf6:	0044 
     cf8:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     cfe:	0048 
     d00:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     d06:	004c 
     d08:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     d0e:	0050 
     d10:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
     d16:	0054 
     d18:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
     d1e:	0058 
     d20:	41e8 0060      	lea 96(a0),a0
     d24:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     d2a:	fffc 
  for(int i=0;i<128+8;i++) {
     d2c:	b088           	cmp.l a0,d0
     d2e:	6600 ff3a      	bne.w c6a <Zoom_InitRun+0x98>
  *bp = 1;
     d32:	31fc 0001 0200 	move.w #1,200 <main+0x1fa>
  Zoom_LoadImage( DrawBuffer);
     d38:	2079 0000 3b5a 	movea.l 3b5a <DrawBuffer>,a0
     d3e:	2008           	move.l a0,d0
     d40:	0680 0000 3300 	addi.l #13056,d0
      *destination++ = 0x55555555;
     d46:	20bc 5555 5555 	move.l #1431655765,(a0)
     d4c:	217c 5555 5555 	move.l #1431655765,4(a0)
     d52:	0004 
     d54:	217c 5555 5555 	move.l #1431655765,8(a0)
     d5a:	0008 
     d5c:	217c 5555 5555 	move.l #1431655765,12(a0)
     d62:	000c 
     d64:	217c 5555 5555 	move.l #1431655765,16(a0)
     d6a:	0010 
     d6c:	217c 5555 5555 	move.l #1431655765,20(a0)
     d72:	0014 
     d74:	217c 5555 5555 	move.l #1431655765,24(a0)
     d7a:	0018 
     d7c:	217c 5555 5555 	move.l #1431655765,28(a0)
     d82:	001c 
     d84:	217c 5555 5555 	move.l #1431655765,32(a0)
     d8a:	0020 
     d8c:	217c 5555 5555 	move.l #1431655765,36(a0)
     d92:	0024 
     d94:	217c 5555 5555 	move.l #1431655765,40(a0)
     d9a:	0028 
     d9c:	217c 5555 5555 	move.l #1431655765,44(a0)
     da2:	002c 
      *destination++ = 0xaaaaaaaa;
     da4:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     daa:	0030 
     dac:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     db2:	0034 
     db4:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     dba:	0038 
     dbc:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     dc2:	003c 
     dc4:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     dca:	0040 
     dcc:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     dd2:	0044 
     dd4:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     dda:	0048 
     ddc:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     de2:	004c 
     de4:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     dea:	0050 
     dec:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
     df2:	0054 
     df4:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
     dfa:	0058 
     dfc:	41e8 0060      	lea 96(a0),a0
     e00:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     e06:	fffc 
  for(int i=0;i<128+8;i++) {
     e08:	b088           	cmp.l a0,d0
     e0a:	6600 ff3a      	bne.w d46 <Zoom_InitRun+0x174>
  Zoom_LevelOfZoom = 0;
     e0e:	4279 0000 3b58 	clr.w 3b58 <Zoom_LevelOfZoom>
}
     e14:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     e18:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     e1a:	2c79 0000 3b64 	movea.l 3b64 <DOSBase>,a6
     e20:	4eae ffc4      	jsr -60(a6)
     e24:	2c79 0000 3b64 	movea.l 3b64 <DOSBase>,a6
     e2a:	2200           	move.l d0,d1
     e2c:	243c 0000 1a1c 	move.l #6684,d2
     e32:	7626           	moveq #38,d3
     e34:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     e38:	2c79 0000 3b64 	movea.l 3b64 <DOSBase>,a6
     e3e:	7201           	moveq #1,d1
     e40:	4eae ff70      	jsr -144(a6)
     e44:	2039 0000 3b44 	move.l 3b44 <Bitplane2>,d0
  ViewBuffer = Bitplane2+2;
     e4a:	2040           	movea.l d0,a0
     e4c:	5088           	addq.l #8,a0
     e4e:	23c8 0000 3b5e 	move.l a0,3b5e <ViewBuffer>
  ViewCopper = Copperlist2;
     e54:	23f9 0000 3b50 	move.l 3b50 <Copperlist2>,3b40 <ViewCopper>
     e5a:	0000 3b40 
  *bp = 0;
     e5e:	31fc 0000 0200 	move.w #0,200 <main+0x1fa>
  for(int i=0;i<128+8;i++) {
     e64:	0680 0000 3308 	addi.l #13064,d0
     e6a:	6000 fdfe      	bra.w c6a <Zoom_InitRun+0x98>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     e6e:	2c79 0000 3b64 	movea.l 3b64 <DOSBase>,a6
     e74:	4eae ffc4      	jsr -60(a6)
     e78:	2c79 0000 3b64 	movea.l 3b64 <DOSBase>,a6
     e7e:	2200           	move.l d0,d1
     e80:	243c 0000 19f5 	move.l #6645,d2
     e86:	7626           	moveq #38,d3
     e88:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     e8c:	2c79 0000 3b64 	movea.l 3b64 <DOSBase>,a6
     e92:	7201           	moveq #1,d1
     e94:	4eae ff70      	jsr -144(a6)
     e98:	2039 0000 3b4c 	move.l 3b4c <Bitplane1>,d0
  DrawBuffer = Bitplane1+2;
     e9e:	5080           	addq.l #8,d0
     ea0:	23c0 0000 3b5a 	move.l d0,3b5a <DrawBuffer>
  DrawCopper = Copperlist1;
     ea6:	23f9 0000 3b54 	move.l 3b54 <Copperlist1>,3b48 <DrawCopper>
     eac:	0000 3b48 
  Bitplane2 = AllocMem(ZMLINESIZE*270, MEMF_CHIP);
     eb0:	2c79 0000 3b68 	movea.l 3b68 <SysBase>,a6
     eb6:	203c 0000 32a0 	move.l #12960,d0
     ebc:	7202           	moveq #2,d1
     ebe:	4eae ff3a      	jsr -198(a6)
     ec2:	23c0 0000 3b44 	move.l d0,3b44 <Bitplane2>
  if(Bitplane2 == 0) {
     ec8:	6600 fd80      	bne.w c4a <Zoom_InitRun+0x78>
     ecc:	6000 ff4c      	bra.w e1a <Zoom_InitRun+0x248>

00000ed0 <interruptHandler>:
static __attribute__((interrupt)) void interruptHandler() {
     ed0:	2f08           	move.l a0,-(sp)
     ed2:	2f00           	move.l d0,-(sp)
	hw->intreq=(1<<INTB_VERTB); hw->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     ed4:	2079 0000 3b3c 	movea.l 3b3c <hw>,a0
     eda:	317c 0020 009c 	move.w #32,156(a0)
     ee0:	317c 0020 009c 	move.w #32,156(a0)
	frameCounter++;
     ee6:	2039 0000 3b20 	move.l 3b20 <frameCounter>,d0
     eec:	5280           	addq.l #1,d0
     eee:	23c0 0000 3b20 	move.l d0,3b20 <frameCounter>
}
     ef4:	201f           	move.l (sp)+,d0
     ef6:	205f           	movea.l (sp)+,a0
     ef8:	4e73           	rte

00000efa <WaitVbl>:
void WaitVbl() {
     efa:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     efc:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddafae>,d0
     f02:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
     f04:	2017           	move.l (sp),d0
     f06:	0280 0001 ff00 	andi.l #130816,d0
     f0c:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
     f0e:	2017           	move.l (sp),d0
     f10:	0c80 0001 3700 	cmpi.l #79616,d0
     f16:	67e4           	beq.s efc <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     f18:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddafae>,d0
     f1e:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
     f22:	202f 0004      	move.l 4(sp),d0
     f26:	0280 0001 ff00 	andi.l #130816,d0
     f2c:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
     f30:	202f 0004      	move.l 4(sp),d0
     f34:	0c80 0001 3700 	cmpi.l #79616,d0
     f3a:	66dc           	bne.s f18 <WaitVbl+0x1e>
}
     f3c:	508f           	addq.l #8,sp
     f3e:	4e75           	rts

00000f40 <memcpy>:
{
     f40:	48e7 3820      	movem.l d2-d4/a2,-(sp)
     f44:	202f 0014      	move.l 20(sp),d0
     f48:	226f 0018      	movea.l 24(sp),a1
     f4c:	222f 001c      	move.l 28(sp),d1
	while(len--)
     f50:	2601           	move.l d1,d3
     f52:	5383           	subq.l #1,d3
     f54:	4a81           	tst.l d1
     f56:	6762           	beq.s fba <memcpy+0x7a>
     f58:	2040           	movea.l d0,a0
     f5a:	5888           	addq.l #4,a0
     f5c:	b1c9           	cmpa.l a1,a0
     f5e:	53c2           	sl.s d2
     f60:	4402           	neg.b d2
     f62:	41e9 0004      	lea 4(a1),a0
     f66:	b1c0           	cmpa.l d0,a0
     f68:	53c4           	sl.s d4
     f6a:	4404           	neg.b d4
     f6c:	8404           	or.b d4,d2
     f6e:	7808           	moveq #8,d4
     f70:	b883           	cmp.l d3,d4
     f72:	55c4           	sc.s d4
     f74:	4404           	neg.b d4
     f76:	c404           	and.b d4,d2
     f78:	6746           	beq.s fc0 <memcpy+0x80>
     f7a:	2409           	move.l a1,d2
     f7c:	8480           	or.l d0,d2
     f7e:	7803           	moveq #3,d4
     f80:	c484           	and.l d4,d2
     f82:	663c           	bne.s fc0 <memcpy+0x80>
     f84:	2049           	movea.l a1,a0
     f86:	2440           	movea.l d0,a2
     f88:	74fc           	moveq #-4,d2
     f8a:	c481           	and.l d1,d2
     f8c:	d489           	add.l a1,d2
		*d++ = *s++;
     f8e:	24d8           	move.l (a0)+,(a2)+
     f90:	b488           	cmp.l a0,d2
     f92:	66fa           	bne.s f8e <memcpy+0x4e>
     f94:	74fc           	moveq #-4,d2
     f96:	c481           	and.l d1,d2
     f98:	2040           	movea.l d0,a0
     f9a:	d1c2           	adda.l d2,a0
     f9c:	d3c2           	adda.l d2,a1
     f9e:	9682           	sub.l d2,d3
     fa0:	b481           	cmp.l d1,d2
     fa2:	6716           	beq.s fba <memcpy+0x7a>
     fa4:	1091           	move.b (a1),(a0)
	while(len--)
     fa6:	4a83           	tst.l d3
     fa8:	6710           	beq.s fba <memcpy+0x7a>
		*d++ = *s++;
     faa:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
     fb0:	5383           	subq.l #1,d3
     fb2:	6706           	beq.s fba <memcpy+0x7a>
		*d++ = *s++;
     fb4:	1169 0002 0002 	move.b 2(a1),2(a0)
}
     fba:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
     fbe:	4e75           	rts
     fc0:	2040           	movea.l d0,a0
     fc2:	d289           	add.l a1,d1
		*d++ = *s++;
     fc4:	10d9           	move.b (a1)+,(a0)+
	while(len--)
     fc6:	b289           	cmp.l a1,d1
     fc8:	67f0           	beq.s fba <memcpy+0x7a>
		*d++ = *s++;
     fca:	10d9           	move.b (a1)+,(a0)+
	while(len--)
     fcc:	b289           	cmp.l a1,d1
     fce:	66f4           	bne.s fc4 <memcpy+0x84>
     fd0:	60e8           	bra.s fba <memcpy+0x7a>

00000fd2 <memset>:
{
     fd2:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
     fd6:	202f 0024      	move.l 36(sp),d0
     fda:	2a2f 0028      	move.l 40(sp),d5
     fde:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
     fe2:	2809           	move.l a1,d4
     fe4:	5384           	subq.l #1,d4
     fe6:	b2fc 0000      	cmpa.w #0,a1
     fea:	6f00 00b0      	ble.w 109c <memset+0xca>
     fee:	1e05           	move.b d5,d7
     ff0:	2200           	move.l d0,d1
     ff2:	4481           	neg.l d1
     ff4:	7403           	moveq #3,d2
     ff6:	c282           	and.l d2,d1
     ff8:	7c05           	moveq #5,d6
		*ptr++ = val;
     ffa:	2440           	movea.l d0,a2
     ffc:	bc84           	cmp.l d4,d6
     ffe:	646a           	bcc.s 106a <memset+0x98>
    1000:	4a81           	tst.l d1
    1002:	6724           	beq.s 1028 <memset+0x56>
    1004:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    1006:	5384           	subq.l #1,d4
    1008:	7401           	moveq #1,d2
    100a:	b481           	cmp.l d1,d2
    100c:	671a           	beq.s 1028 <memset+0x56>
		*ptr++ = val;
    100e:	2440           	movea.l d0,a2
    1010:	548a           	addq.l #2,a2
    1012:	2040           	movea.l d0,a0
    1014:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    1018:	5384           	subq.l #1,d4
    101a:	7403           	moveq #3,d2
    101c:	b481           	cmp.l d1,d2
    101e:	6608           	bne.s 1028 <memset+0x56>
		*ptr++ = val;
    1020:	528a           	addq.l #1,a2
    1022:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    1026:	5384           	subq.l #1,d4
    1028:	2609           	move.l a1,d3
    102a:	9681           	sub.l d1,d3
    102c:	7c00           	moveq #0,d6
    102e:	1c05           	move.b d5,d6
    1030:	2406           	move.l d6,d2
    1032:	4842           	swap d2
    1034:	4242           	clr.w d2
    1036:	2042           	movea.l d2,a0
    1038:	2406           	move.l d6,d2
    103a:	e14a           	lsl.w #8,d2
    103c:	4842           	swap d2
    103e:	4242           	clr.w d2
    1040:	e18e           	lsl.l #8,d6
    1042:	2646           	movea.l d6,a3
    1044:	2c08           	move.l a0,d6
    1046:	8486           	or.l d6,d2
    1048:	2c0b           	move.l a3,d6
    104a:	8486           	or.l d6,d2
    104c:	1407           	move.b d7,d2
    104e:	2040           	movea.l d0,a0
    1050:	d1c1           	adda.l d1,a0
    1052:	72fc           	moveq #-4,d1
    1054:	c283           	and.l d3,d1
    1056:	d288           	add.l a0,d1
		*ptr++ = val;
    1058:	20c2           	move.l d2,(a0)+
    105a:	b1c1           	cmpa.l d1,a0
    105c:	66fa           	bne.s 1058 <memset+0x86>
    105e:	72fc           	moveq #-4,d1
    1060:	c283           	and.l d3,d1
    1062:	d5c1           	adda.l d1,a2
    1064:	9881           	sub.l d1,d4
    1066:	b283           	cmp.l d3,d1
    1068:	6732           	beq.s 109c <memset+0xca>
    106a:	1485           	move.b d5,(a2)
	while(len-- > 0)
    106c:	4a84           	tst.l d4
    106e:	6f2c           	ble.s 109c <memset+0xca>
		*ptr++ = val;
    1070:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    1074:	7201           	moveq #1,d1
    1076:	b284           	cmp.l d4,d1
    1078:	6c22           	bge.s 109c <memset+0xca>
		*ptr++ = val;
    107a:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    107e:	7402           	moveq #2,d2
    1080:	b484           	cmp.l d4,d2
    1082:	6c18           	bge.s 109c <memset+0xca>
		*ptr++ = val;
    1084:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    1088:	7c03           	moveq #3,d6
    108a:	bc84           	cmp.l d4,d6
    108c:	6c0e           	bge.s 109c <memset+0xca>
		*ptr++ = val;
    108e:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    1092:	7204           	moveq #4,d1
    1094:	b284           	cmp.l d4,d1
    1096:	6c04           	bge.s 109c <memset+0xca>
		*ptr++ = val;
    1098:	1545 0005      	move.b d5,5(a2)
}
    109c:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    10a0:	4e75           	rts

000010a2 <strlen>:
{
    10a2:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    10a6:	7000           	moveq #0,d0
	while(*s++)
    10a8:	4a10           	tst.b (a0)
    10aa:	6708           	beq.s 10b4 <strlen+0x12>
		t++;
    10ac:	5280           	addq.l #1,d0
	while(*s++)
    10ae:	4a30 0800      	tst.b (0,a0,d0.l)
    10b2:	66f8           	bne.s 10ac <strlen+0xa>
}
    10b4:	4e75           	rts
    10b6:	4e71           	nop

000010b8 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    10b8:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    10bc:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    10c0:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    10c4:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    10c8:	d041           	add.w d1,d0
	swap	d0
    10ca:	4840           	swap d0
	clrw	d0
    10cc:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    10ce:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    10d2:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    10d6:	d081           	add.l d1,d0

	rts
    10d8:	4e75           	rts

000010da <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    10da:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    10dc:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    10e0:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    10e4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    10ea:	6416           	bcc.s 1102 <__udivsi3+0x28>
	movel	d0, d2
    10ec:	2400           	move.l d0,d2
	clrw	d2
    10ee:	4242           	clr.w d2
	swap	d2
    10f0:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    10f2:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    10f4:	3002           	move.w d2,d0
	swap	d0
    10f6:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    10f8:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    10fc:	84c1           	divu.w d1,d2
	movew	d2, d0
    10fe:	3002           	move.w d2,d0
	jra	6f
    1100:	6030           	bra.s 1132 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    1102:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    1104:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    1106:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    1108:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    110e:	64f4           	bcc.s 1104 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    1110:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    1112:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    1118:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    111a:	c2c0           	mulu.w d0,d1
	swap	d2
    111c:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    111e:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    1120:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    1122:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    1124:	660a           	bne.s 1130 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    1126:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    1128:	6506           	bcs.s 1130 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    112a:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    112e:	6302           	bls.s 1132 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    1130:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    1132:	241f           	move.l (sp)+,d2
	rts
    1134:	4e75           	rts

00001136 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    1136:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    1138:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    113a:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    113e:	6a04           	bpl.s 1144 <__divsi3+0xe>
	negl	d1
    1140:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    1142:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    1144:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    1148:	6a04           	bpl.s 114e <__divsi3+0x18>
	negl	d0
    114a:	4480           	neg.l d0
	negb	d2
    114c:	4402           	neg.b d2

2:	movel	d1, sp@-
    114e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1150:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    1152:	6186           	bsr.s 10da <__udivsi3>
	addql	IMM (8), sp
    1154:	508f           	addq.l #8,sp

	tstb	d2
    1156:	4a02           	tst.b d2
	jpl	3f
    1158:	6a02           	bpl.s 115c <__divsi3+0x26>
	negl	d0
    115a:	4480           	neg.l d0

3:	movel	sp@+, d2
    115c:	241f           	move.l (sp)+,d2
	rts
    115e:	4e75           	rts

00001160 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    1160:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1164:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1168:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    116a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    116c:	61c8           	bsr.s 1136 <__divsi3>
	addql	IMM (8), sp
    116e:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    1170:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1174:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1176:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1178:	6100 ff3e      	bsr.w 10b8 <__mulsi3>
	addql	IMM (8), sp
    117c:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    117e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1182:	9280           	sub.l d0,d1
	movel	d1, d0
    1184:	2001           	move.l d1,d0
	rts
    1186:	4e75           	rts

00001188 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    1188:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    118c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1190:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1192:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    1194:	6100 ff44      	bsr.w 10da <__udivsi3>
	addql	IMM (8), sp
    1198:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    119a:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    119e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    11a0:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    11a2:	6100 ff14      	bsr.w 10b8 <__mulsi3>
	addql	IMM (8), sp
    11a6:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    11a8:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    11ac:	9280           	sub.l d0,d1
	movel	d1, d0
    11ae:	2001           	move.l d1,d0
	rts
    11b0:	4e75           	rts

000011b2 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    11b2:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    11b4:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    11b8:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    11bc:	2c5f           	movea.l (sp)+,a6
    rts
    11be:	4e75           	rts

000011c0 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    11c0:	16c0           	move.b d0,(a3)+
	rts
    11c2:	4e75           	rts

000011c4 <saveregs>:
	...

00001200 <font2distance>:
    1200:	0505           	btst d2,d5
    1202:	0505           	btst d2,d5
    1204:	0505           	btst d2,d5
    1206:	0505           	btst d2,d5
    1208:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    120a:	0505           	btst d2,d5
    120c:	0505           	btst d2,d5
    120e:	0005 0505      	ori.b #5,d5
    1212:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    1214:	0505           	btst d2,d5
    1216:	0505           	btst d2,d5
    1218:	0505           	btst d2,d5
    121a:	0505           	btst d2,d5
    121c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    121e:	0505           	btst d2,d5
    1220:	0505           	btst d2,d5
    1222:	0505           	btst d2,d5
    1224:	0505           	btst d2,d5
    1226:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    1228:	0500           	btst d2,d0
    122a:	0505           	btst d2,d5
    122c:	0505           	btst d2,d5
    122e:	0505           	btst d2,d5
    1230:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    1232:	0505           	btst d2,d5
    1234:	0505           	btst d2,d5
    1236:	0505           	btst d2,d5
    1238:	0505           	btst d2,d5
    123a:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    123c:	0505           	btst d2,d5
    123e:	0505           	btst d2,d5
    1240:	0503           	btst d2,d3
    1242:	0505           	btst d2,d5
    1244:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    1246:	0505           	btst d2,d5
    1248:	0500           	btst d2,d0
    124a:	0505           	btst d2,d5
    124c:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    1250:	0505           	btst d2,d5
    1252:	0503           	btst d2,d3
    1254:	0205 0507      	andi.b #7,d5
    1258:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    125a:	0505           	btst d2,d5
    125c:	0505           	btst d2,d5
    125e:	0505           	btst d2,d5
    1260:	0505           	btst d2,d5
    1262:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1264:	0505           	btst d2,d5
    1266:	0505           	btst d2,d5
    1268:	0505           	btst d2,d5
    126a:	0505           	btst d2,d5
    126c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    126e:	0505           	btst d2,d5
    1270:	0505           	btst d2,d5
    1272:	0505           	btst d2,d5
    1274:	0505           	btst d2,d5
    1276:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1278:	0505           	btst d2,d5
    127a:	0505           	btst d2,d5
    127c:	0505           	btst d2,d5
    127e:	0505           	btst d2,d5
    1280:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1282:	0505           	btst d2,d5
    1284:	0505           	btst d2,d5
    1286:	0505           	btst d2,d5
    1288:	0505           	btst d2,d5
    128a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    128c:	0505           	btst d2,d5
    128e:	0505           	btst d2,d5
    1290:	0505           	btst d2,d5
    1292:	0505           	btst d2,d5
    1294:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1296:	0505           	btst d2,d5
    1298:	0505           	btst d2,d5
    129a:	0505           	btst d2,d5
    129c:	0505           	btst d2,d5
    129e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    12a0:	0505           	btst d2,d5
    12a2:	0505           	btst d2,d5
    12a4:	0505           	btst d2,d5
    12a6:	0505           	btst d2,d5
    12a8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    12aa:	0505           	btst d2,d5
    12ac:	0505           	btst d2,d5
    12ae:	0505           	btst d2,d5
    12b0:	0505           	btst d2,d5
    12b2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    12b4:	0505           	btst d2,d5
    12b6:	0505           	btst d2,d5
    12b8:	0505           	btst d2,d5
    12ba:	0505           	btst d2,d5
    12bc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    12be:	0505           	btst d2,d5
    12c0:	0505           	btst d2,d5
    12c2:	0505           	btst d2,d5
    12c4:	0505           	btst d2,d5
    12c6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    12c8:	0505           	btst d2,d5
    12ca:	0505           	btst d2,d5
    12cc:	0505           	btst d2,d5
    12ce:	0505           	btst d2,d5
    12d0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    12d2:	0505           	btst d2,d5
    12d4:	0505           	btst d2,d5
    12d6:	0505           	btst d2,d5
    12d8:	0505           	btst d2,d5
    12da:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    12dc:	0505           	btst d2,d5
    12de:	0505           	btst d2,d5
    12e0:	0505           	btst d2,d5
    12e2:	0505           	btst d2,d5
    12e4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    12e6:	0505           	btst d2,d5
    12e8:	0505           	btst d2,d5
    12ea:	0505           	btst d2,d5
    12ec:	0505           	btst d2,d5
    12ee:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    12f0:	0505           	btst d2,d5
    12f2:	0505           	btst d2,d5
    12f4:	0505           	btst d2,d5
    12f6:	0505           	btst d2,d5
    12f8:	0505           	btst d2,d5

000012fa <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    12fa:	16c0           	move.b d0,(a3)+
  RTS
    12fc:	4e75           	rts

000012fe <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    12fe:	48f9 7fff 0000 	movem.l d0-a6,11c4 <saveregs>
    1304:	11c4 
  lea 0xdff000,a5
    1306:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddafaa>,a5
  move.l sp@(4),a0  //Fontlocation
    130c:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    1310:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    1314:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    1318:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    131a:	082d 0006 0002 	btst #6,2(a5)

00001320 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    1320:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    1326:	66f8           	bne.s 1320 <st2wblit>

00001328 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    1328:	7019           	moveq #25,d0
	sub.l d5,d5      
    132a:	9a85           	sub.l d5,d5

0000132c <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    132c:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    132e:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    1330:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    1334:	9dce           	suba.l a6,a6
	move.l d2, a6
    1336:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    1338:	ddfc 0000 1200 	adda.l #4608,a6

	LSL  	#4,d2 	    //Fetch next char
    133e:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    1340:	2842           	movea.l d2,a4


	move.l  #0,d4
    1342:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    1344:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    1346:	3814           	move.w (a4),d4
	swap	d4
    1348:	4844           	swap d4
	lsr.l	d5, d4
    134a:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    134c:	8993           	or.l d4,(a3)
	clr.l	d4
    134e:	4284           	clr.l d4
	move.w  2(a4), d4
    1350:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    1354:	4844           	swap d4
	lsr.l	d5, d4
    1356:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    1358:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    135c:	4284           	clr.l d4
	move.w  4(a4), d4
    135e:	382c 0004      	move.w 4(a4),d4
	swap	d4
    1362:	4844           	swap d4
	lsr.l	d5, d4
    1364:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    1366:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    136a:	4284           	clr.l d4
	move.w  6(a4), d4
    136c:	382c 0006      	move.w 6(a4),d4
	swap	d4
    1370:	4844           	swap d4
	lsr.l	d5, d4
    1372:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    1374:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    1378:	4284           	clr.l d4
	move.w  8(a4), d4
    137a:	382c 0008      	move.w 8(a4),d4
	swap	d4
    137e:	4844           	swap d4
	lsr.l	d5, d4
    1380:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    1382:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    1386:	4284           	clr.l d4
	move.w  10(a4), d4
    1388:	382c 000a      	move.w 10(a4),d4
	swap	d4
    138c:	4844           	swap d4
	lsr.l	d5, d4
    138e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    1390:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    1394:	4284           	clr.l d4
	move.w  12(a4), d4
    1396:	382c 000c      	move.w 12(a4),d4
	swap	d4
    139a:	4844           	swap d4
	lsr.l	d5, d4
    139c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    139e:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    13a2:	4284           	clr.l d4
	move.w  14(a4), d4
    13a4:	382c 000e      	move.w 14(a4),d4
	swap	d4
    13a8:	4844           	swap d4
	lsr.l	d5, d4
    13aa:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    13ac:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    13b0:	4284           	clr.l d4

	add.b   (a6), d5
    13b2:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    13b4:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    13b8:	6500 0006      	bcs.w 13c0 <noadditionalchar>
	addq.w  #1, a3
    13bc:	524b           	addq.w #1,a3
	sub.w   #8,d5
    13be:	5145           	subq.w #8,d5

000013c0 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    13c0:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    13c2:	51c8 ff68      	dbf d0,132c <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    13c6:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    13ca:	51cb ff5c      	dbf d3,1328 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    13ce:	4cfa 7fff fdf2 	movem.l 11c4 <saveregs>(pc),d0-a6

	RTS
    13d4:	4e75           	rts
