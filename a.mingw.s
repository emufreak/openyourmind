
a.mingw.elf:     file format elf32-m68k


Disassembly of section .text:

00000000 <_start>:
extern void (*__init_array_start[])() __attribute__((weak));
extern void (*__init_array_end[])() __attribute__((weak));
extern void (*__fini_array_start[])() __attribute__((weak));
extern void (*__fini_array_end[])() __attribute__((weak));

__attribute__((used)) __attribute__((section(".text.unlikely"))) void _start() {
       0:	518f           	subq.l #8,sp
	// initialize globals, ctors etc.
	unsigned long count;
	unsigned long i;

	count = __preinit_array_end - __preinit_array_start;
       2:	203c 0001 a344 	move.l #107332,d0
       8:	0480 0001 a344 	subi.l #107332,d0
       e:	e480           	asr.l #2,d0
      10:	2e80           	move.l d0,(sp)
	for (i = 0; i < count; i++)
      12:	42af 0004      	clr.l 4(sp)
      16:	601a           	bra.s 32 <_start+0x32>
		__preinit_array_start[i]();
      18:	202f 0004      	move.l 4(sp),d0
      1c:	d080           	add.l d0,d0
      1e:	2240           	movea.l d0,a1
      20:	d3c0           	adda.l d0,a1
      22:	41f9 0001 a344 	lea 1a344 <ClColor>,a0
      28:	2071 8800      	movea.l (0,a1,a0.l),a0
      2c:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      2e:	52af 0004      	addq.l #1,4(sp)
      32:	202f 0004      	move.l 4(sp),d0
      36:	b097           	cmp.l (sp),d0
      38:	65de           	bcs.s 18 <_start+0x18>

	count = __init_array_end - __init_array_start;
      3a:	203c 0001 a344 	move.l #107332,d0
      40:	0480 0001 a344 	subi.l #107332,d0
      46:	e480           	asr.l #2,d0
      48:	2e80           	move.l d0,(sp)
	for (i = 0; i < count; i++)
      4a:	42af 0004      	clr.l 4(sp)
      4e:	601a           	bra.s 6a <_start+0x6a>
		__init_array_start[i]();
      50:	202f 0004      	move.l 4(sp),d0
      54:	d080           	add.l d0,d0
      56:	2240           	movea.l d0,a1
      58:	d3c0           	adda.l d0,a1
      5a:	41f9 0001 a344 	lea 1a344 <ClColor>,a0
      60:	2071 8800      	movea.l (0,a1,a0.l),a0
      64:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      66:	52af 0004      	addq.l #1,4(sp)
      6a:	202f 0004      	move.l 4(sp),d0
      6e:	b097           	cmp.l (sp),d0
      70:	65de           	bcs.s 50 <_start+0x50>

	main();
      72:	4eb9 0000 090c 	jsr 90c <main>

	// call dtors
	count = __fini_array_end - __fini_array_start;
      78:	203c 0001 a344 	move.l #107332,d0
      7e:	0480 0001 a344 	subi.l #107332,d0
      84:	e480           	asr.l #2,d0
      86:	2e80           	move.l d0,(sp)
	for (i = count; i > 0; i--)
      88:	2f57 0004      	move.l (sp),4(sp)
      8c:	601c           	bra.s aa <_start+0xaa>
		__fini_array_start[i - 1]();
      8e:	202f 0004      	move.l 4(sp),d0
      92:	5380           	subq.l #1,d0
      94:	d080           	add.l d0,d0
      96:	2240           	movea.l d0,a1
      98:	d3c0           	adda.l d0,a1
      9a:	41f9 0001 a344 	lea 1a344 <ClColor>,a0
      a0:	2071 8800      	movea.l (0,a1,a0.l),a0
      a4:	4e90           	jsr (a0)
	for (i = count; i > 0; i--)
      a6:	53af 0004      	subq.l #1,4(sp)
      aa:	4aaf 0004      	tst.l 4(sp)
      ae:	66de           	bne.s 8e <_start+0x8e>
}
      b0:	508f           	addq.l #8,sp
      b2:	4e75           	rts

000000b4 <WaitBlt>:
ULONG volatile *DrawCopper;
ULONG volatile *ViewCopper;

volatile struct Custom *hw;

inline void WaitBlt() {
      b4:	598f           	subq.l #4,sp
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
      b6:	2079 0002 8344 	movea.l 28344 <hw>,a0
      bc:	3f68 0002 0002 	move.w 2(a0),2(sp)
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
      c2:	2079 0002 8344 	movea.l 28344 <hw>,a0
      c8:	3028 0002      	move.w 2(a0),d0
      cc:	3000           	move.w d0,d0
      ce:	0280 0000 ffff 	andi.l #65535,d0
      d4:	0280 0000 4000 	andi.l #16384,d0
      da:	66e6           	bne.s c2 <WaitBlt+0xe>
}
      dc:	588f           	addq.l #4,sp
      de:	4e75           	rts

000000e0 <FreeDisplay>:
   0x018A0D97,0x018C0AAA,0x018E0E99,0x01900CB6,0x01920EA9,0x01940DB8,0x01960CCC,
   0x01980FBB,0x019A0ECA,0x019C0BE7,0x019E0EDC,0x01A00DDD,0x01A20FDD,0x01A40DE8,
   0x01A60EEA,0x01A80DE9,0x01AA0DFB,0x01AC0FEE,0x01AE0EFC,0x01B00EFF,0x01B20EFC,
           0x01B40EFD,0x01B60FFE,0x01B80FFF,0x01BA0FFF,0x01BC0FFF, 0x01BE0FFF };

void FreeDisplay( int clsize, int bplsize) {
      e0:	4fef ffe0      	lea -32(sp),sp
      e4:	2f0e           	move.l a6,-(sp)
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
      e6:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
      ec:	6722           	beq.s 110 <FreeDisplay+0x30>
      ee:	2f79 0002 832c 	move.l 2832c <Copperlist1>,32(sp)
      f4:	0020 
      f6:	2f6f 0028 001c 	move.l 40(sp),28(sp)
      fc:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     102:	2c40           	movea.l d0,a6
     104:	226f 0020      	movea.l 32(sp),a1
     108:	202f 001c      	move.l 28(sp),d0
     10c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     110:	2039 0002 8330 	move.l 28330 <Copperlist2>,d0
     116:	6722           	beq.s 13a <FreeDisplay+0x5a>
     118:	2f79 0002 8330 	move.l 28330 <Copperlist2>,24(sp)
     11e:	0018 
     120:	2f6f 0028 0014 	move.l 40(sp),20(sp)
     126:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     12c:	2c40           	movea.l d0,a6
     12e:	226f 0018      	movea.l 24(sp),a1
     132:	202f 0014      	move.l 20(sp),d0
     136:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
     13a:	2039 0002 8324 	move.l 28324 <Bitplane1>,d0
     140:	6722           	beq.s 164 <FreeDisplay+0x84>
     142:	2f79 0002 8324 	move.l 28324 <Bitplane1>,16(sp)
     148:	0010 
     14a:	2f6f 002c 000c 	move.l 44(sp),12(sp)
     150:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     156:	2c40           	movea.l d0,a6
     158:	226f 0010      	movea.l 16(sp),a1
     15c:	202f 000c      	move.l 12(sp),d0
     160:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
     164:	2039 0002 8328 	move.l 28328 <Bitplane2>,d0
     16a:	6722           	beq.s 18e <FreeDisplay+0xae>
     16c:	2f79 0002 8328 	move.l 28328 <Bitplane2>,8(sp)
     172:	0008 
     174:	2f6f 002c 0004 	move.l 44(sp),4(sp)
     17a:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     180:	2c40           	movea.l d0,a6
     182:	226f 0008      	movea.l 8(sp),a1
     186:	202f 0004      	move.l 4(sp),d0
     18a:	4eae ff2e      	jsr -210(a6)
}
     18e:	2c5f           	movea.l (sp)+,a6
     190:	4fef 0020      	lea 32(sp),sp
     194:	4e75           	rts

00000196 <SetBplPointers>:

void SetBplPointers() {
     196:	4fef fff4      	lea -12(sp),sp
  UWORD highword = (ULONG)DrawBuffer >> 16;
     19a:	2039 0002 8334 	move.l 28334 <DrawBuffer>,d0
     1a0:	4240           	clr.w d0
     1a2:	4840           	swap d0
     1a4:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     1a8:	2039 0002 8334 	move.l 28334 <DrawBuffer>,d0
     1ae:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     1b2:	2f79 0002 833c 	move.l 2833c <DrawCopper>,4(sp)
     1b8:	0004 
  copword[COPBPL1LOW] = lowword;
     1ba:	307c 0076      	movea.w #118,a0
     1be:	d1ef 0004      	adda.l 4(sp),a0
     1c2:	30af 0008      	move.w 8(sp),(a0)
  copword[COPBPL1HIGH] = highword;
     1c6:	307c 0072      	movea.w #114,a0
     1ca:	d1ef 0004      	adda.l 4(sp),a0
     1ce:	30af 000a      	move.w 10(sp),(a0)
  
  ULONG tmp = (ULONG) DrawBuffer;
     1d2:	2039 0002 8334 	move.l 28334 <DrawBuffer>,d0
     1d8:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     1da:	2039 0002 8338 	move.l 28338 <ViewBuffer>,d0
     1e0:	23c0 0002 8334 	move.l d0,28334 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     1e6:	2017           	move.l (sp),d0
     1e8:	23c0 0002 8338 	move.l d0,28338 <ViewBuffer>
}
     1ee:	4fef 000c      	lea 12(sp),sp
     1f2:	4e75           	rts

000001f4 <SwapCl>:

void SwapCl() {
     1f4:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     1f6:	2039 0002 833c 	move.l 2833c <DrawCopper>,d0
     1fc:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     1fe:	2039 0002 8340 	move.l 28340 <ViewCopper>,d0
     204:	23c0 0002 833c 	move.l d0,2833c <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     20a:	2017           	move.l (sp),d0
     20c:	23c0 0002 8340 	move.l d0,28340 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     212:	2039 0002 8340 	move.l 28340 <ViewCopper>,d0
     218:	2079 0002 8344 	movea.l 28344 <hw>,a0
     21e:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     222:	2079 0002 8344 	movea.l 28344 <hw>,a0
     228:	2017           	move.l (sp),d0
     22a:	3140 0088      	move.w d0,136(a0)
}
     22e:	588f           	addq.l #4,sp
     230:	4e75           	rts

00000232 <Utils_CopyMem>:

void Utils_CopyMem( ULONG *source, ULONG *destination, ULONG size) {
     232:	598f           	subq.l #4,sp
     234:	2f02           	move.l d2,-(sp)
  for( int i=0;i<size;i++) 
     236:	42af 0004      	clr.l 4(sp)
     23a:	6024           	bra.s 260 <Utils_CopyMem+0x2e>
    *destination++ = *source++;  
     23c:	222f 000c      	move.l 12(sp),d1
     240:	2001           	move.l d1,d0
     242:	5880           	addq.l #4,d0
     244:	2f40 000c      	move.l d0,12(sp)
     248:	202f 0010      	move.l 16(sp),d0
     24c:	2400           	move.l d0,d2
     24e:	5882           	addq.l #4,d2
     250:	2f42 0010      	move.l d2,16(sp)
     254:	2041           	movea.l d1,a0
     256:	2210           	move.l (a0),d1
     258:	2040           	movea.l d0,a0
     25a:	2081           	move.l d1,(a0)
  for( int i=0;i<size;i++) 
     25c:	52af 0004      	addq.l #1,4(sp)
     260:	202f 0004      	move.l 4(sp),d0
     264:	b0af 0014      	cmp.l 20(sp),d0
     268:	65d2           	bcs.s 23c <Utils_CopyMem+0xa>
}
     26a:	241f           	move.l (sp)+,d2
     26c:	588f           	addq.l #4,sp
     26e:	4e75           	rts

00000270 <Utils_FillLong>:

void Utils_FillLong( ULONG *target, ULONG pattern, ULONG lines, 
                                            ULONG linelength, ULONG mod ) {
     270:	518f           	subq.l #8,sp
  for( int i=0;i<lines; i++) {
     272:	42af 0004      	clr.l 4(sp)
     276:	6030           	bra.s 2a8 <Utils_FillLong+0x38>
    for( int i2=0;i2<linelength;i2++) 
     278:	4297           	clr.l (sp)
     27a:	6014           	bra.s 290 <Utils_FillLong+0x20>
      *target++ = pattern;
     27c:	202f 000c      	move.l 12(sp),d0
     280:	2200           	move.l d0,d1
     282:	5881           	addq.l #4,d1
     284:	2f41 000c      	move.l d1,12(sp)
     288:	2040           	movea.l d0,a0
     28a:	20af 0010      	move.l 16(sp),(a0)
    for( int i2=0;i2<linelength;i2++) 
     28e:	5297           	addq.l #1,(sp)
     290:	2017           	move.l (sp),d0
     292:	b0af 0018      	cmp.l 24(sp),d0
     296:	65e4           	bcs.s 27c <Utils_FillLong+0xc>
    target += mod;
     298:	202f 001c      	move.l 28(sp),d0
     29c:	d080           	add.l d0,d0
     29e:	d080           	add.l d0,d0
     2a0:	d1af 000c      	add.l d0,12(sp)
  for( int i=0;i<lines; i++) {
     2a4:	52af 0004      	addq.l #1,4(sp)
     2a8:	202f 0004      	move.l 4(sp),d0
     2ac:	b0af 0014      	cmp.l 20(sp),d0
     2b0:	65c6           	bcs.s 278 <Utils_FillLong+0x8>
  }
}
     2b2:	508f           	addq.l #8,sp
     2b4:	4e75           	rts

000002b6 <MouseLeft>:

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     2b6:	207c 00bf e001 	movea.l #12574721,a0
     2bc:	1010           	move.b (a0),d0
     2be:	1000           	move.b d0,d0
     2c0:	0280 0000 00ff 	andi.l #255,d0
     2c6:	7240           	moveq #64,d1
     2c8:	c081           	and.l d1,d0
     2ca:	57c0           	seq d0
     2cc:	4400           	neg.b d0
     2ce:	1000           	move.b d0,d0
     2d0:	0240 00ff      	andi.w #255,d0
     2d4:	4e75           	rts

000002d6 <MouseRight>:
     2d6:	207c 00df f016 	movea.l #14675990,a0
     2dc:	3010           	move.w (a0),d0
     2de:	3000           	move.w d0,d0
     2e0:	0280 0000 ffff 	andi.l #65535,d0
     2e6:	0280 0000 0400 	andi.l #1024,d0
     2ec:	57c0           	seq d0
     2ee:	4400           	neg.b d0
     2f0:	1000           	move.b d0,d0
     2f2:	0240 00ff      	andi.w #255,d0
     2f6:	4e75           	rts

000002f8 <interruptHandler.lto_priv.0>:
#include "zoom.h"
#include "zoom102.h"

//volatile int frameCounter = 0;

static __attribute__((interrupt)) void interruptHandler() {
     2f8:	2f08           	move.l a0,-(sp)
	hw->intreq=(1<<INTB_VERTB); hw->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     2fa:	2079 0002 8344 	movea.l 28344 <hw>,a0
     300:	317c 0020 009c 	move.w #32,156(a0)
     306:	2079 0002 8344 	movea.l 28344 <hw>,a0
     30c:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	//frameCounter++;
  //Zoom_VblankHandler();
}
     312:	205f           	movea.l (sp)+,a0
     314:	4e73           	rte

00000316 <RunDemo>:

void RunDemo() {
     316:	4fef fff4      	lea -12(sp),sp
     31a:	2f0e           	move.l a6,-(sp)
//               5432109876543210
  hw->dmacon = 0b1000011111111111;
     31c:	2079 0002 8344 	movea.l 28344 <hw>,a0
     322:	317c 87ff 0096 	move.w #-30721,150(a0)
  //             1001001111100000	; copper,bitplane,blitter DMA

  /*hw->dmacon =   
  0x87e0;*/
	//SetInterruptHandler((APTR)interruptHandler);
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     328:	2079 0002 8344 	movea.l 28344 <hw>,a0
     32e:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     334:	2079 0002 8344 	movea.l 28344 <hw>,a0
     33a:	317c 0020 009c 	move.w #32,156(a0)
  //PrepareDisplay();

  CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
     340:	2f79 0002 8384 	move.l 28384 <Zoom_StartImage>,12(sp)
     346:	000c 
     348:	2f79 0002 8334 	move.l 28334 <DrawBuffer>,8(sp)
     34e:	0008 
     350:	2f7c 0000 ff00 	move.l #65280,4(sp)
     356:	0004 
     358:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     35e:	2c40           	movea.l d0,a6
     360:	206f 000c      	movea.l 12(sp),a0
     364:	226f 0008      	movea.l 8(sp),a1
     368:	202f 0004      	move.l 4(sp),d0
     36c:	4eae fd8a      	jsr -630(a6)
     370:	6008           	bra.s 37a <RunDemo+0x64>
  
	while(Zoom_Counter < 1000) {
		WaitVbl();
     372:	4eba 030a      	jsr 67e <WaitVbl>(pc)
    RunFrame();
     376:	4eba 003e      	jsr 3b6 <RunFrame>(pc)
	while(Zoom_Counter < 1000) {
     37a:	3039 0002 8382 	move.w 28382 <Zoom_Counter>,d0
     380:	0c40 03e7      	cmpi.w #999,d0
     384:	63ec           	bls.s 372 <RunDemo+0x5c>
	}
  Zoom_Dealloc();
     386:	4eba 1114      	jsr 149c <Zoom_Dealloc>(pc)

	//SetInterruptHandler((APTR)interruptHandler);
}
     38a:	2c5f           	movea.l (sp)+,a6
     38c:	4fef 000c      	lea 12(sp),sp
     390:	4e75           	rts

00000392 <SetInterrupt>:

void SetInterrupt() {
  SetInterruptHandler((APTR)interruptHandler);
     392:	487a ff64      	pea 2f8 <interruptHandler.lto_priv.0>(pc)
     396:	4eba 02ca      	jsr 662 <SetInterruptHandler>(pc)
     39a:	588f           	addq.l #4,sp
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     39c:	2079 0002 8344 	movea.l 28344 <hw>,a0
     3a2:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     3a8:	2079 0002 8344 	movea.l 28344 <hw>,a0
     3ae:	317c 0020 009c 	move.w #32,156(a0)
}
     3b4:	4e75           	rts

000003b6 <RunFrame>:

void RunFrame() {
     3b6:	4fef fff0      	lea -16(sp),sp
     3ba:	2f0e           	move.l a6,-(sp)
  Zoom_Blit4ZoomFinished = 0;
     3bc:	4279 0002 838c 	clr.w 2838c <Zoom_Blit4ZoomFinished>
  UWORD tmp = Zoom_LevelOfZoom;  
     3c2:	3f79 0002 838e 	move.w 2838e <Zoom_LevelOfZoom>,18(sp)
     3c8:	0012 
  if(Zoom_LevelOfZoom == 0)
     3ca:	3039 0002 838e 	move.w 2838e <Zoom_LevelOfZoom>,d0
     3d0:	6632           	bne.s 404 <RunFrame+0x4e>
    CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
     3d2:	2f79 0002 8384 	move.l 28384 <Zoom_StartImage>,14(sp)
     3d8:	000e 
     3da:	2f79 0002 8334 	move.l 28334 <DrawBuffer>,10(sp)
     3e0:	000a 
     3e2:	2f7c 0000 ff00 	move.l #65280,6(sp)
     3e8:	0006 
     3ea:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     3f0:	2c40           	movea.l d0,a6
     3f2:	206f 000e      	movea.l 14(sp),a0
     3f6:	226f 000a      	movea.l 10(sp),a1
     3fa:	202f 0006      	move.l 6(sp),d0
     3fe:	4eae fd8a      	jsr -630(a6)
     402:	602c           	bra.s 430 <RunFrame+0x7a>
  else
    Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer, (UWORD *)DrawBuffer, Zoom_LevelOfZoom, 5 );
     404:	3039 0002 838e 	move.w 2838e <Zoom_LevelOfZoom>,d0
     40a:	3000           	move.w d0,d0
     40c:	0280 0000 ffff 	andi.l #65535,d0
     412:	2079 0002 8334 	movea.l 28334 <DrawBuffer>,a0
     418:	2239 0002 8338 	move.l 28338 <ViewBuffer>,d1
     41e:	4878 0005      	pea 5 <_start+0x5>
     422:	2f00           	move.l d0,-(sp)
     424:	2f08           	move.l a0,-(sp)
     426:	2f01           	move.l d1,-(sp)
     428:	4eba 189a      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
     42c:	4fef 0010      	lea 16(sp),sp

  Zoom_Blit4ZoomFinished = 1;
     430:	33fc 0001 0002 	move.w #1,2838c <Zoom_Blit4ZoomFinished>
     436:	838c 
  while( tmp == Zoom_LevelOfZoom) { }
     438:	3039 0002 838e 	move.w 2838e <Zoom_LevelOfZoom>,d0
     43e:	b06f 0012      	cmp.w 18(sp),d0
     442:	67f4           	beq.s 438 <RunFrame+0x82>
     444:	2c5f           	movea.l (sp)+,a6
     446:	4fef 0010      	lea 16(sp),sp
     44a:	4e75           	rts

0000044c <Zoom_InsertShift>:
           0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
           0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000,
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

void Zoom_InsertShift( UWORD *copperlist, UWORD *values4shift) {
     44c:	4fef fff4      	lea -12(sp),sp
     450:	2f02           	move.l d2,-(sp)
  for(int i = 0; i<6;i++) {
     452:	42af 000c      	clr.l 12(sp)
     456:	601e           	bra.s 476 <Zoom_InsertShift+0x2a>
    *copperlist = *values4shift++;
     458:	202f 0018      	move.l 24(sp),d0
     45c:	2200           	move.l d0,d1
     45e:	5481           	addq.l #2,d1
     460:	2f41 0018      	move.l d1,24(sp)
     464:	2040           	movea.l d0,a0
     466:	3010           	move.w (a0),d0
     468:	206f 0014      	movea.l 20(sp),a0
     46c:	3080           	move.w d0,(a0)
    copperlist += 2;
     46e:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<6;i++) {
     472:	52af 000c      	addq.l #1,12(sp)
     476:	7005           	moveq #5,d0
     478:	b0af 000c      	cmp.l 12(sp),d0
     47c:	6cda           	bge.s 458 <Zoom_InsertShift+0xc>
  }
  copperlist--;
     47e:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     482:	222f 0018      	move.l 24(sp),d1
     486:	2401           	move.l d1,d2
     488:	5482           	addq.l #2,d2
     48a:	2f42 0018      	move.l d2,24(sp)
     48e:	202f 0014      	move.l 20(sp),d0
     492:	2400           	move.l d0,d2
     494:	5482           	addq.l #2,d2
     496:	2f42 0014      	move.l d2,20(sp)
     49a:	2041           	movea.l d1,a0
     49c:	3210           	move.w (a0),d1
     49e:	2040           	movea.l d0,a0
     4a0:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     4a2:	202f 0018      	move.l 24(sp),d0
     4a6:	2200           	move.l d0,d1
     4a8:	5481           	addq.l #2,d1
     4aa:	2f41 0018      	move.l d1,24(sp)
     4ae:	2040           	movea.l d0,a0
     4b0:	3010           	move.w (a0),d0
     4b2:	206f 0014      	movea.l 20(sp),a0
     4b6:	3080           	move.w d0,(a0)
  copperlist += 2;
     4b8:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     4bc:	42af 0008      	clr.l 8(sp)
     4c0:	601e           	bra.s 4e0 <Zoom_InsertShift+0x94>
    *copperlist = *values4shift++;
     4c2:	202f 0018      	move.l 24(sp),d0
     4c6:	2200           	move.l d0,d1
     4c8:	5481           	addq.l #2,d1
     4ca:	2f41 0018      	move.l d1,24(sp)
     4ce:	2040           	movea.l d0,a0
     4d0:	3010           	move.w (a0),d0
     4d2:	206f 0014      	movea.l 20(sp),a0
     4d6:	3080           	move.w d0,(a0)
    copperlist += 2;
     4d8:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     4dc:	52af 0008      	addq.l #1,8(sp)
     4e0:	7009           	moveq #9,d0
     4e2:	b0af 0008      	cmp.l 8(sp),d0
     4e6:	6cda           	bge.s 4c2 <Zoom_InsertShift+0x76>
  }
  copperlist--;
     4e8:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     4ec:	222f 0018      	move.l 24(sp),d1
     4f0:	2401           	move.l d1,d2
     4f2:	5482           	addq.l #2,d2
     4f4:	2f42 0018      	move.l d2,24(sp)
     4f8:	202f 0014      	move.l 20(sp),d0
     4fc:	2400           	move.l d0,d2
     4fe:	5482           	addq.l #2,d2
     500:	2f42 0014      	move.l d2,20(sp)
     504:	2041           	movea.l d1,a0
     506:	3210           	move.w (a0),d1
     508:	2040           	movea.l d0,a0
     50a:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     50c:	202f 0018      	move.l 24(sp),d0
     510:	2200           	move.l d0,d1
     512:	5481           	addq.l #2,d1
     514:	2f41 0018      	move.l d1,24(sp)
     518:	2040           	movea.l d0,a0
     51a:	3010           	move.w (a0),d0
     51c:	206f 0014      	movea.l 20(sp),a0
     520:	3080           	move.w d0,(a0)
  copperlist += 2;
     522:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     526:	42af 0004      	clr.l 4(sp)
     52a:	601e           	bra.s 54a <Zoom_InsertShift+0xfe>
    *copperlist = *values4shift++;
     52c:	202f 0018      	move.l 24(sp),d0
     530:	2200           	move.l d0,d1
     532:	5481           	addq.l #2,d1
     534:	2f41 0018      	move.l d1,24(sp)
     538:	2040           	movea.l d0,a0
     53a:	3010           	move.w (a0),d0
     53c:	206f 0014      	movea.l 20(sp),a0
     540:	3080           	move.w d0,(a0)
    copperlist += 2;
     542:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     546:	52af 0004      	addq.l #1,4(sp)
     54a:	7006           	moveq #6,d0
     54c:	b0af 0004      	cmp.l 4(sp),d0
     550:	6cda           	bge.s 52c <Zoom_InsertShift+0xe0>
  }
}
     552:	241f           	move.l (sp)+,d2
     554:	4fef 000c      	lea 12(sp),sp
     558:	4e75           	rts

0000055a <Zoom_Shrink102>:

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {
     55a:	518f           	subq.l #8,sp
     55c:	202f 000c      	move.l 12(sp),d0
     560:	3000           	move.w d0,d0
     562:	3f40 0002      	move.w d0,2(sp)

  
  UWORD *values4shift = Values4Shift+levelofshrink*108;
     566:	7200           	moveq #0,d1
     568:	322f 0002      	move.w 2(sp),d1
     56c:	2001           	move.l d1,d0
     56e:	d080           	add.l d0,d0
     570:	d081           	add.l d1,d0
     572:	2200           	move.l d0,d1
     574:	e789           	lsl.l #3,d1
     576:	d081           	add.l d1,d0
     578:	e788           	lsl.l #3,d0
     57a:	2200           	move.l d0,d1
     57c:	0681 0001 a65c 	addi.l #108124,d1
     582:	2f41 0004      	move.l d1,4(sp)
  //copperlist+=3+73*2;
  Zoom_InsertShift( copperlist+3+73*2, values4shift);
     586:	202f 0010      	move.l 16(sp),d0
     58a:	0680 0000 012a 	addi.l #298,d0
     590:	2f2f 0004      	move.l 4(sp),-(sp)
     594:	2f00           	move.l d0,-(sp)
     596:	4eba feb4      	jsr 44c <Zoom_InsertShift>(pc)
     59a:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+63+73*2, values4shift+27);
     59c:	7236           	moveq #54,d1
     59e:	d2af 0004      	add.l 4(sp),d1
     5a2:	202f 0010      	move.l 16(sp),d0
     5a6:	0680 0000 01a2 	addi.l #418,d0
     5ac:	2f01           	move.l d1,-(sp)
     5ae:	2f00           	move.l d0,-(sp)
     5b0:	4eba fe9a      	jsr 44c <Zoom_InsertShift>(pc)
     5b4:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+119+73*2, values4shift+54);
     5b6:	726c           	moveq #108,d1
     5b8:	d2af 0004      	add.l 4(sp),d1
     5bc:	202f 0010      	move.l 16(sp),d0
     5c0:	0680 0000 0212 	addi.l #530,d0
     5c6:	2f01           	move.l d1,-(sp)
     5c8:	2f00           	move.l d0,-(sp)
     5ca:	4eba fe80      	jsr 44c <Zoom_InsertShift>(pc)
     5ce:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+175+73*2, values4shift+81);
     5d0:	222f 0004      	move.l 4(sp),d1
     5d4:	0681 0000 00a2 	addi.l #162,d1
     5da:	202f 0010      	move.l 16(sp),d0
     5de:	0680 0000 0282 	addi.l #642,d0
     5e4:	2f01           	move.l d1,-(sp)
     5e6:	2f00           	move.l d0,-(sp)
     5e8:	4eba fe62      	jsr 44c <Zoom_InsertShift>(pc)
     5ec:	508f           	addq.l #8,sp
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }*/
  
}
     5ee:	508f           	addq.l #8,sp
     5f0:	4e75           	rts

000005f2 <GetVBR>:
volatile static APTR VBR=0;
static APTR SystemIrq;
 
struct View *ActiView;

static APTR GetVBR(void) {
     5f2:	4fef ffec      	lea -20(sp),sp
     5f6:	2f0e           	move.l a6,-(sp)
     5f8:	2f07           	move.l d7,-(sp)
	APTR vbr = 0;
     5fa:	42af 0018      	clr.l 24(sp)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     5fe:	3f7c 4e7a 000a 	move.w #20090,10(sp)
     604:	3f7c 0801 000c 	move.w #2049,12(sp)
     60a:	3f7c 4e73 000e 	move.w #20083,14(sp)

	if (SysBase->AttnFlags & AFF_68010) 
     610:	2079 0002 8348 	movea.l 28348 <SysBase>,a0
     616:	3028 0128      	move.w 296(a0),d0
     61a:	3000           	move.w d0,d0
     61c:	0280 0000 ffff 	andi.l #65535,d0
     622:	7201           	moveq #1,d1
     624:	c081           	and.l d1,d0
     626:	672c           	beq.s 654 <GetVBR+0x62>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     628:	41ef 001c      	lea 28(sp),a0
     62c:	41e8 ffee      	lea -18(a0),a0
     630:	2f48 0014      	move.l a0,20(sp)
     634:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     63a:	2c40           	movea.l d0,a6
     63c:	2e2f 0014      	move.l 20(sp),d7
     640:	cf8d           	exg d7,a5
     642:	4eae ffe2      	jsr -30(a6)
     646:	cf8d           	exg d7,a5
     648:	2f40 0010      	move.l d0,16(sp)
     64c:	202f 0010      	move.l 16(sp),d0
     650:	2f40 0018      	move.l d0,24(sp)

	return vbr;
     654:	202f 0018      	move.l 24(sp),d0
}
     658:	2e1f           	move.l (sp)+,d7
     65a:	2c5f           	movea.l (sp)+,a6
     65c:	4fef 0014      	lea 20(sp),sp
     660:	4e75           	rts

00000662 <SetInterruptHandler>:

void SetInterruptHandler(APTR interrupt) {
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     662:	2079 0002 835e 	movea.l 2835e <VBR>,a0
     668:	41e8 006c      	lea 108(a0),a0
     66c:	20af 0004      	move.l 4(sp),(a0)
}
     670:	4e75           	rts

00000672 <GetInterruptHandler>:

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     672:	2079 0002 835e 	movea.l 2835e <VBR>,a0
     678:	2028 006c      	move.l 108(a0),d0
}
     67c:	4e75           	rts

0000067e <WaitVbl>:

//vblank begins at vpos 312 hpos 1 and ends at vpos 25 hpos 1
//vsync begins at line 2 hpos 132 and ends at vpos 5 hpos 18 
void WaitVbl() {
     67e:	518f           	subq.l #8,sp
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     680:	207c 00df f004 	movea.l #14675972,a0
     686:	2010           	move.l (a0),d0
     688:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
     68a:	2017           	move.l (sp),d0
     68c:	0280 0001 ff00 	andi.l #130816,d0
     692:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
     694:	2017           	move.l (sp),d0
     696:	0c80 0001 3700 	cmpi.l #79616,d0
     69c:	67e2           	beq.s 680 <WaitVbl+0x2>
			break;
	}
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     69e:	207c 00df f004 	movea.l #14675972,a0
     6a4:	2010           	move.l (a0),d0
     6a6:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
     6aa:	202f 0004      	move.l 4(sp),d0
     6ae:	0280 0001 ff00 	andi.l #130816,d0
     6b4:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
     6b8:	202f 0004      	move.l 4(sp),d0
     6bc:	0c80 0001 3700 	cmpi.l #79616,d0
     6c2:	66da           	bne.s 69e <WaitVbl+0x20>
			break;
	}
}
     6c4:	508f           	addq.l #8,sp
     6c6:	4e75           	rts

000006c8 <TakeSystem>:
	UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
}*/

void TakeSystem() {
     6c8:	518f           	subq.l #8,sp
     6ca:	2f0e           	move.l a6,-(sp)
	ActiView=GfxBase->ActiView; //store current view
     6cc:	2079 0002 8354 	movea.l 28354 <GfxBase>,a0
     6d2:	2028 0022      	move.l 34(a0),d0
     6d6:	23c0 0002 8366 	move.l d0,28366 <ActiView>
	OwnBlitter();
     6dc:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
     6e2:	2c40           	movea.l d0,a6
     6e4:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     6e8:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
     6ee:	2c40           	movea.l d0,a6
     6f0:	4eae ff1c      	jsr -228(a6)
	//Disable();
	Forbid();
     6f4:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     6fa:	2c40           	movea.l d0,a6
     6fc:	4eae ff7c      	jsr -132(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=custom->adkconr;
     700:	2079 0002 834c 	movea.l 2834c <custom>,a0
     706:	3028 0010      	move.w 16(a0),d0
     70a:	33c0 0002 835c 	move.w d0,2835c <SystemADKCON>
	SystemInts=custom->intenar;
     710:	2079 0002 834c 	movea.l 2834c <custom>,a0
     716:	3028 001c      	move.w 28(a0),d0
     71a:	33c0 0002 8358 	move.w d0,28358 <SystemInts>
	SystemDMA=custom->dmaconr;
     720:	2079 0002 834c 	movea.l 2834c <custom>,a0
     726:	3028 0002      	move.w 2(a0),d0
     72a:	33c0 0002 835a 	move.w d0,2835a <SystemDMA>
	custom->intena=0x7fff;//disable all interrupts
     730:	2079 0002 834c 	movea.l 2834c <custom>,a0
     736:	317c 7fff 009a 	move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     73c:	2079 0002 834c 	movea.l 2834c <custom>,a0
     742:	317c 7fff 009c 	move.w #32767,156(a0)
	
	WaitVbl();
     748:	4eba ff34      	jsr 67e <WaitVbl>(pc)
	WaitVbl();
     74c:	4eba ff30      	jsr 67e <WaitVbl>(pc)
	custom->dmacon=0x7fff;//Clear all DMA channels
     750:	2079 0002 834c 	movea.l 2834c <custom>,a0
     756:	317c 7fff 0096 	move.w #32767,150(a0)

	//set all colors black
	for(int a=0;a<32;a++)
     75c:	42af 0008      	clr.l 8(sp)
     760:	601c           	bra.s 77e <TakeSystem+0xb6>
		custom->color[a]=0;
     762:	2079 0002 834c 	movea.l 2834c <custom>,a0
     768:	202f 0008      	move.l 8(sp),d0
     76c:	0680 0000 00c0 	addi.l #192,d0
     772:	d080           	add.l d0,d0
     774:	31bc 0000 0800 	move.w #0,(0,a0,d0.l)
	for(int a=0;a<32;a++)
     77a:	52af 0008      	addq.l #1,8(sp)
     77e:	701f           	moveq #31,d0
     780:	b0af 0008      	cmp.l 8(sp),d0
     784:	6cdc           	bge.s 762 <TakeSystem+0x9a>

	LoadView(0);
     786:	42af 0004      	clr.l 4(sp)
     78a:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
     790:	2c40           	movea.l d0,a6
     792:	226f 0004      	movea.l 4(sp),a1
     796:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     79a:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
     7a0:	2c40           	movea.l d0,a6
     7a2:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     7a6:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
     7ac:	2c40           	movea.l d0,a6
     7ae:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     7b2:	4eba feca      	jsr 67e <WaitVbl>(pc)
	WaitVbl();
     7b6:	4eba fec6      	jsr 67e <WaitVbl>(pc)

	VBR=GetVBR();
     7ba:	4eba fe36      	jsr 5f2 <GetVBR>(pc)
     7be:	23c0 0002 835e 	move.l d0,2835e <VBR>
	SystemIrq=GetInterruptHandler(); //store interrupt register
     7c4:	4eba feac      	jsr 672 <GetInterruptHandler>(pc)
     7c8:	23c0 0002 8362 	move.l d0,28362 <SystemIrq>
}
     7ce:	2c5f           	movea.l (sp)+,a6
     7d0:	508f           	addq.l #8,sp
     7d2:	4e75           	rts

000007d4 <FreeSystem>:

void FreeSystem() { 
     7d4:	598f           	subq.l #4,sp
     7d6:	2f0e           	move.l a6,-(sp)
	WaitVbl();
     7d8:	4eba fea4      	jsr 67e <WaitVbl>(pc)
	WaitBlt();
     7dc:	4eba f8d6      	jsr b4 <WaitBlt>(pc)
	custom->intena=0x7fff;//disable all interrupts
     7e0:	2079 0002 834c 	movea.l 2834c <custom>,a0
     7e6:	317c 7fff 009a 	move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     7ec:	2079 0002 834c 	movea.l 2834c <custom>,a0
     7f2:	317c 7fff 009c 	move.w #32767,156(a0)
	custom->dmacon=0x7fff;//Clear all DMA channels
     7f8:	2079 0002 834c 	movea.l 2834c <custom>,a0
     7fe:	317c 7fff 0096 	move.w #32767,150(a0)

	//restore interrupts
	SetInterruptHandler(SystemIrq);
     804:	2039 0002 8362 	move.l 28362 <SystemIrq>,d0
     80a:	2f00           	move.l d0,-(sp)
     80c:	4eba fe54      	jsr 662 <SetInterruptHandler>(pc)
     810:	588f           	addq.l #4,sp

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
     812:	2079 0002 8354 	movea.l 28354 <GfxBase>,a0
     818:	2028 0026      	move.l 38(a0),d0
     81c:	2079 0002 834c 	movea.l 2834c <custom>,a0
     822:	2140 0080      	move.l d0,128(a0)
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
     826:	2079 0002 8354 	movea.l 28354 <GfxBase>,a0
     82c:	2028 0032      	move.l 50(a0),d0
     830:	2079 0002 834c 	movea.l 2834c <custom>,a0
     836:	2140 0084      	move.l d0,132(a0)
	custom->copjmp1=0x7fff; //start coppper
     83a:	2079 0002 834c 	movea.l 2834c <custom>,a0
     840:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
     846:	3039 0002 8358 	move.w 28358 <SystemInts>,d0
     84c:	2079 0002 834c 	movea.l 2834c <custom>,a0
     852:	0040 8000      	ori.w #-32768,d0
     856:	3140 009a      	move.w d0,154(a0)
	custom->dmacon=SystemDMA|0x8000;
     85a:	3039 0002 835a 	move.w 2835a <SystemDMA>,d0
     860:	2079 0002 834c 	movea.l 2834c <custom>,a0
     866:	0040 8000      	ori.w #-32768,d0
     86a:	3140 0096      	move.w d0,150(a0)
	custom->adkcon=SystemADKCON|0x8000;
     86e:	3039 0002 835c 	move.w 2835c <SystemADKCON>,d0
     874:	2079 0002 834c 	movea.l 2834c <custom>,a0
     87a:	0040 8000      	ori.w #-32768,d0
     87e:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     882:	2f79 0002 8366 	move.l 28366 <ActiView>,4(sp)
     888:	0004 
     88a:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
     890:	2c40           	movea.l d0,a6
     892:	226f 0004      	movea.l 4(sp),a1
     896:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     89a:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
     8a0:	2c40           	movea.l d0,a6
     8a2:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     8a6:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
     8ac:	2c40           	movea.l d0,a6
     8ae:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     8b2:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
     8b8:	2c40           	movea.l d0,a6
     8ba:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     8be:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
     8c4:	2c40           	movea.l d0,a6
     8c6:	4eae fe32      	jsr -462(a6)
	//Enable();
	Permit();
     8ca:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     8d0:	2c40           	movea.l d0,a6
     8d2:	4eae ff76      	jsr -138(a6)
}
     8d6:	2c5f           	movea.l (sp)+,a6
     8d8:	588f           	addq.l #4,sp
     8da:	4e75           	rts

000008dc <interruptHandler.lto_priv.1>:
	*copListCurrent++=offsetof(struct Custom, color[index]);
	*copListCurrent++=color;
	return copListCurrent;
}

static __attribute__((interrupt)) void interruptHandler() {
     8dc:	2f08           	move.l a0,-(sp)
     8de:	2f00           	move.l d0,-(sp)
	custom->intreq=(1<<INTB_VERTB); custom->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     8e0:	2079 0002 834c 	movea.l 2834c <custom>,a0
     8e6:	317c 0020 009c 	move.w #32,156(a0)
     8ec:	2079 0002 834c 	movea.l 2834c <custom>,a0
     8f2:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	frameCounter++;
     8f8:	3039 0002 836a 	move.w 2836a <frameCounter>,d0
     8fe:	5240           	addq.w #1,d0
     900:	33c0 0002 836a 	move.w d0,2836a <frameCounter>
}
     906:	201f           	move.l (sp)+,d0
     908:	205f           	movea.l (sp)+,a0
     90a:	4e73           	rte

0000090c <main>:
	*copListEnd++ = offsetof(struct Custom, diwstop);
	*copListEnd++ = (xstop-256)+((ystop-256)<<8);
	return copListEnd;
}

int main() {
     90c:	4fef ffbc      	lea -68(sp),sp
     910:	48e7 3002      	movem.l d2-d3/a6,-(sp)
	ULONG tmp = 4;
     914:	7004           	moveq #4,d0
     916:	2f40 004c      	move.l d0,76(sp)
    SysBase = *((struct ExecBase**)tmp);
     91a:	206f 004c      	movea.l 76(sp),a0
     91e:	2010           	move.l (a0),d0
     920:	23c0 0002 8348 	move.l d0,28348 <SysBase>
	hw = (struct Custom*)0xdff000;
     926:	23fc 00df f000 	move.l #14675968,28344 <hw>
     92c:	0002 8344 

	SysBase = *((struct ExecBase**)4UL);
     930:	307c 0004      	movea.w #4,a0
     934:	2010           	move.l (a0),d0
     936:	23c0 0002 8348 	move.l d0,28348 <SysBase>
	custom = (struct Custom*)0xdff000;
     93c:	23fc 00df f000 	move.l #14675968,2834c <custom>
     942:	0002 834c 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
     946:	2f7c 0000 742d 	move.l #29741,72(sp)
     94c:	0048 
     94e:	42af 0044      	clr.l 68(sp)
     952:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     958:	2c40           	movea.l d0,a6
     95a:	226f 0048      	movea.l 72(sp),a1
     95e:	202f 0044      	move.l 68(sp),d0
     962:	4eae fdd8      	jsr -552(a6)
     966:	2f40 0040      	move.l d0,64(sp)
     96a:	202f 0040      	move.l 64(sp),d0
     96e:	23c0 0002 8354 	move.l d0,28354 <GfxBase>
	if (!GfxBase)
     974:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
     97a:	6614           	bne.s 990 <main+0x84>
		Exit(0);
     97c:	42af 003c      	clr.l 60(sp)
     980:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     986:	2c40           	movea.l d0,a6
     988:	222f 003c      	move.l 60(sp),d1
     98c:	4eae ff70      	jsr -144(a6)

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     990:	2f7c 0000 743e 	move.l #29758,56(sp)
     996:	0038 
     998:	42af 0034      	clr.l 52(sp)
     99c:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     9a2:	2c40           	movea.l d0,a6
     9a4:	226f 0038      	movea.l 56(sp),a1
     9a8:	202f 0034      	move.l 52(sp),d0
     9ac:	4eae fdd8      	jsr -552(a6)
     9b0:	2f40 0030      	move.l d0,48(sp)
     9b4:	202f 0030      	move.l 48(sp),d0
     9b8:	23c0 0002 8350 	move.l d0,28350 <DOSBase>
	if (!DOSBase)
     9be:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     9c4:	6614           	bne.s 9da <main+0xce>
		Exit(0);
     9c6:	42af 002c      	clr.l 44(sp)
     9ca:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     9d0:	2c40           	movea.l d0,a6
     9d2:	222f 002c      	move.l 44(sp),d1
     9d6:	4eae ff70      	jsr -144(a6)

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
     9da:	4879 0000 744a 	pea 744a <incbin_colors_end+0x1e>
     9e0:	4eba 669a      	jsr 707c <KPrintF>(pc)
     9e4:	588f           	addq.l #4,sp
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
     9e6:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     9ec:	2c40           	movea.l d0,a6
     9ee:	4eae ffc4      	jsr -60(a6)
     9f2:	2f40 0028      	move.l d0,40(sp)
     9f6:	202f 0028      	move.l 40(sp),d0
     9fa:	2f40 0024      	move.l d0,36(sp)
     9fe:	2f7c 0000 7466 	move.l #29798,32(sp)
     a04:	0020 
     a06:	700f           	moveq #15,d0
     a08:	2f40 001c      	move.l d0,28(sp)
     a0c:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     a12:	2c40           	movea.l d0,a6
     a14:	222f 0024      	move.l 36(sp),d1
     a18:	242f 0020      	move.l 32(sp),d2
     a1c:	262f 001c      	move.l 28(sp),d3
     a20:	4eae ffd0      	jsr -48(a6)
     a24:	2f40 0018      	move.l d0,24(sp)
	Delay(50);
     a28:	7032           	moveq #50,d0
     a2a:	2f40 0014      	move.l d0,20(sp)
     a2e:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     a34:	2c40           	movea.l d0,a6
     a36:	222f 0014      	move.l 20(sp),d1
     a3a:	4eae ff3a      	jsr -198(a6)

	warpmode(1);
     a3e:	4878 0001      	pea 1 <_start+0x1>
     a42:	4eba 66a2      	jsr 70e6 <warpmode>(pc)
     a46:	588f           	addq.l #4,sp
	// TODO: precalc stuff here
	warpmode(0);
     a48:	42a7           	clr.l -(sp)
     a4a:	4eba 669a      	jsr 70e6 <warpmode>(pc)
     a4e:	588f           	addq.l #4,sp

	/*TakeSystem();*/
	WaitVbl();
     a50:	4eba fc2c      	jsr 67e <WaitVbl>(pc)
  
  	//Zoom_InitRun();
  	RunTests();	//warpmode(1);
     a54:	4eba 2662      	jsr 30b8 <RunTests>(pc)
	// DEMO

	//RunDemo();

	// DEMO
	SetInterruptHandler((APTR)interruptHandler);
     a58:	487a fe82      	pea 8dc <interruptHandler.lto_priv.1>(pc)
     a5c:	4eba fc04      	jsr 662 <SetInterruptHandler>(pc)
     a60:	588f           	addq.l #4,sp
	custom->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     a62:	2079 0002 834c 	movea.l 2834c <custom>,a0
     a68:	317c c020 009a 	move.w #-16352,154(a0)
	custom->intreq=1<<INTB_VERTB;//reset vbl req
     a6e:	2079 0002 834c 	movea.l 2834c <custom>,a0
     a74:	317c 0020 009c 	move.w #32,156(a0)

	// END
	FreeSystem();
     a7a:	4eba fd58      	jsr 7d4 <FreeSystem>(pc)

	CloseLibrary((struct Library*)DOSBase);
     a7e:	2f79 0002 8350 	move.l 28350 <DOSBase>,16(sp)
     a84:	0010 
     a86:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     a8c:	2c40           	movea.l d0,a6
     a8e:	226f 0010      	movea.l 16(sp),a1
     a92:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     a96:	2f79 0002 8354 	move.l 28354 <GfxBase>,12(sp)
     a9c:	000c 
     a9e:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     aa4:	2c40           	movea.l d0,a6
     aa6:	226f 000c      	movea.l 12(sp),a1
     aaa:	4eae fe62      	jsr -414(a6)
     aae:	7000           	moveq #0,d0
}
     ab0:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     ab4:	4fef 0044      	lea 68(sp),sp
     ab8:	4e75           	rts

00000aba <SwScrollerTest>:

char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
     aba:	4fef ff98      	lea -104(sp),sp
     abe:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  PrepareDisplaySW();
     ac2:	4eba 0218      	jsr cdc <PrepareDisplaySW>(pc)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     ac6:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
     acc:	4878 0010      	pea 10 <_start+0x10>
     ad0:	4879 0001 a3c4 	pea 1a3c4 <ClsSprites>
     ad6:	42a7           	clr.l -(sp)
     ad8:	2f00           	move.l d0,-(sp)
     ada:	4eba 1ef0      	jsr 29cc <TestCopperlistBatch>(pc)
     ade:	4fef 0010      	lea 16(sp),sp
     ae2:	4a80           	tst.l d0
     ae4:	6642           	bne.s b28 <SwScrollerTest+0x6e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     ae6:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     aec:	2c40           	movea.l d0,a6
     aee:	4eae ffc4      	jsr -60(a6)
     af2:	2f40 0070      	move.l d0,112(sp)
     af6:	202f 0070      	move.l 112(sp),d0
     afa:	2f40 006c      	move.l d0,108(sp)
     afe:	2f7c 0000 7487 	move.l #29831,104(sp)
     b04:	0068 
     b06:	702c           	moveq #44,d0
     b08:	2f40 0064      	move.l d0,100(sp)
     b0c:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     b12:	2c40           	movea.l d0,a6
     b14:	222f 006c      	move.l 108(sp),d1
     b18:	242f 0068      	move.l 104(sp),d2
     b1c:	262f 0064      	move.l 100(sp),d3
     b20:	4eae ffd0      	jsr -48(a6)
     b24:	2f40 0060      	move.l d0,96(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     b28:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
     b2e:	4878 000c      	pea c <_start+0xc>
     b32:	4879 0001 a404 	pea 1a404 <ClScreen>
     b38:	4878 0010      	pea 10 <_start+0x10>
     b3c:	2f00           	move.l d0,-(sp)
     b3e:	4eba 1e8c      	jsr 29cc <TestCopperlistBatch>(pc)
     b42:	4fef 0010      	lea 16(sp),sp
     b46:	4a80           	tst.l d0
     b48:	6642           	bne.s b8c <SwScrollerTest+0xd2>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     b4a:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     b50:	2c40           	movea.l d0,a6
     b52:	4eae ffc4      	jsr -60(a6)
     b56:	2f40 005c      	move.l d0,92(sp)
     b5a:	202f 005c      	move.l 92(sp),d0
     b5e:	2f40 0058      	move.l d0,88(sp)
     b62:	2f7c 0000 74bd 	move.l #29885,84(sp)
     b68:	0054 
     b6a:	7036           	moveq #54,d0
     b6c:	2f40 0050      	move.l d0,80(sp)
     b70:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     b76:	2c40           	movea.l d0,a6
     b78:	222f 0058      	move.l 88(sp),d1
     b7c:	242f 0054      	move.l 84(sp),d2
     b80:	262f 0050      	move.l 80(sp),d3
     b84:	4eae ffd0      	jsr -48(a6)
     b88:	2f40 004c      	move.l d0,76(sp)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     b8c:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
     b92:	4878 0002      	pea 2 <_start+0x2>
     b96:	4879 0001 a344 	pea 1a344 <ClColor>
     b9c:	4878 001e      	pea 1e <_start+0x1e>
     ba0:	2f00           	move.l d0,-(sp)
     ba2:	4eba 1e28      	jsr 29cc <TestCopperlistBatch>(pc)
     ba6:	4fef 0010      	lea 16(sp),sp
     baa:	4a80           	tst.l d0
     bac:	6642           	bne.s bf0 <SwScrollerTest+0x136>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     bae:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     bb4:	2c40           	movea.l d0,a6
     bb6:	4eae ffc4      	jsr -60(a6)
     bba:	2f40 0048      	move.l d0,72(sp)
     bbe:	202f 0048      	move.l 72(sp),d0
     bc2:	2f40 0044      	move.l d0,68(sp)
     bc6:	2f7c 0000 74f4 	move.l #29940,64(sp)
     bcc:	0040 
     bce:	7021           	moveq #33,d0
     bd0:	2f40 003c      	move.l d0,60(sp)
     bd4:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     bda:	2c40           	movea.l d0,a6
     bdc:	222f 0044      	move.l 68(sp),d1
     be0:	242f 0040      	move.l 64(sp),d2
     be4:	262f 003c      	move.l 60(sp),d3
     be8:	4eae ffd0      	jsr -48(a6)
     bec:	2f40 0038      	move.l d0,56(sp)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     bf0:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
     bf6:	4878 fffe      	pea fffffffe <_end+0xfffd7c62>
     bfa:	4878 0020      	pea 20 <_start+0x20>
     bfe:	2f00           	move.l d0,-(sp)
     c00:	4eba 1e08      	jsr 2a0a <TestCopperlistPos>(pc)
     c04:	4fef 000c      	lea 12(sp),sp
     c08:	4a80           	tst.l d0
     c0a:	6642           	bne.s c4e <SwScrollerTest+0x194>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     c0c:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     c12:	2c40           	movea.l d0,a6
     c14:	4eae ffc4      	jsr -60(a6)
     c18:	2f40 0034      	move.l d0,52(sp)
     c1c:	202f 0034      	move.l 52(sp),d0
     c20:	2f40 0030      	move.l d0,48(sp)
     c24:	2f7c 0000 7516 	move.l #29974,44(sp)
     c2a:	002c 
     c2c:	7022           	moveq #34,d0
     c2e:	2f40 0028      	move.l d0,40(sp)
     c32:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     c38:	2c40           	movea.l d0,a6
     c3a:	222f 0030      	move.l 48(sp),d1
     c3e:	242f 002c      	move.l 44(sp),d2
     c42:	262f 0028      	move.l 40(sp),d3
     c46:	4eae ffd0      	jsr -48(a6)
     c4a:	2f40 0024      	move.l d0,36(sp)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     c4e:	2239 0001 b588 	move.l 1b588 <sw_text>,d1
     c54:	2039 0002 8334 	move.l 28334 <DrawBuffer>,d0
     c5a:	2f01           	move.l d1,-(sp)
     c5c:	2f00           	move.l d0,-(sp)
     c5e:	4879 0001 b58c 	pea 1b58c <sw_testfont>
     c64:	4eba 0380      	jsr fe6 <WriteFont>(pc)
     c68:	4fef 000c      	lea 12(sp),sp

  UWORD *tstpointer = (UWORD *)DrawBuffer;
     c6c:	2f79 0002 8334 	move.l 28334 <DrawBuffer>,32(sp)
     c72:	0020 
  if( *tstpointer != 0xff00)
     c74:	206f 0020      	movea.l 32(sp),a0
     c78:	3010           	move.w (a0),d0
     c7a:	0c40 ff00      	cmpi.w #-256,d0
     c7e:	6742           	beq.s cc2 <SwScrollerTest+0x208>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     c80:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     c86:	2c40           	movea.l d0,a6
     c88:	4eae ffc4      	jsr -60(a6)
     c8c:	2f40 001c      	move.l d0,28(sp)
     c90:	202f 001c      	move.l 28(sp),d0
     c94:	2f40 0018      	move.l d0,24(sp)
     c98:	2f7c 0000 7539 	move.l #30009,20(sp)
     c9e:	0014 
     ca0:	7031           	moveq #49,d0
     ca2:	2f40 0010      	move.l d0,16(sp)
     ca6:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     cac:	2c40           	movea.l d0,a6
     cae:	222f 0018      	move.l 24(sp),d1
     cb2:	242f 0014      	move.l 20(sp),d2
     cb6:	262f 0010      	move.l 16(sp),d3
     cba:	4eae ffd0      	jsr -48(a6)
     cbe:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
     cc2:	2f3c 0000 c800 	move.l #51200,-(sp)
     cc8:	4878 0084      	pea 84 <_start+0x84>
     ccc:	4eba f412      	jsr e0 <FreeDisplay>(pc)
     cd0:	508f           	addq.l #8,sp
     cd2:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     cd6:	4fef 0068      	lea 104(sp),sp
     cda:	4e75           	rts

00000cdc <PrepareDisplaySW>:
 #include "swscroller.h"
 #include "utils.h"
 
 INCBIN(swfont, "raw/ruby16_8_1.raw");

 int PrepareDisplaySW() {
     cdc:	4fef ffb8      	lea -72(sp),sp
     ce0:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildSW();
     ce4:	4eba 017e      	jsr e64 <ClbuildSW>(pc)
     ce8:	23c0 0002 832c 	move.l d0,2832c <Copperlist1>
  Copperlist2 = ClbuildSW();
     cee:	4eba 0174      	jsr e64 <ClbuildSW>(pc)
     cf2:	23c0 0002 8330 	move.l d0,28330 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     cf8:	2f7c 0000 c800 	move.l #51200,80(sp)
     cfe:	0050 
     d00:	7002           	moveq #2,d0
     d02:	2f40 004c      	move.l d0,76(sp)
     d06:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     d0c:	2c40           	movea.l d0,a6
     d0e:	202f 0050      	move.l 80(sp),d0
     d12:	222f 004c      	move.l 76(sp),d1
     d16:	4eae ff3a      	jsr -198(a6)
     d1a:	2f40 0048      	move.l d0,72(sp)
     d1e:	202f 0048      	move.l 72(sp),d0
     d22:	23c0 0002 8324 	move.l d0,28324 <Bitplane1>
  if(Bitplane1 == 0) {
     d28:	2039 0002 8324 	move.l 28324 <Bitplane1>,d0
     d2e:	6658           	bne.s d88 <PrepareDisplaySW+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     d30:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     d36:	2c40           	movea.l d0,a6
     d38:	4eae ffc4      	jsr -60(a6)
     d3c:	2f40 0044      	move.l d0,68(sp)
     d40:	202f 0044      	move.l 68(sp),d0
     d44:	2f40 0040      	move.l d0,64(sp)
     d48:	2f7c 0000 7b1d 	move.l #31517,60(sp)
     d4e:	003c 
     d50:	7026           	moveq #38,d0
     d52:	2f40 0038      	move.l d0,56(sp)
     d56:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     d5c:	2c40           	movea.l d0,a6
     d5e:	222f 0040      	move.l 64(sp),d1
     d62:	242f 003c      	move.l 60(sp),d2
     d66:	262f 0038      	move.l 56(sp),d3
     d6a:	4eae ffd0      	jsr -48(a6)
     d6e:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
     d72:	7001           	moveq #1,d0
     d74:	2f40 0030      	move.l d0,48(sp)
     d78:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     d7e:	2c40           	movea.l d0,a6
     d80:	222f 0030      	move.l 48(sp),d1
     d84:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
     d88:	2039 0002 8324 	move.l 28324 <Bitplane1>,d0
     d8e:	23c0 0002 8334 	move.l d0,28334 <DrawBuffer>
  DrawCopper = Copperlist1;
     d94:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
     d9a:	23c0 0002 833c 	move.l d0,2833c <DrawCopper>
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     da0:	2f7c 0000 c800 	move.l #51200,44(sp)
     da6:	002c 
     da8:	7002           	moveq #2,d0
     daa:	2f40 0028      	move.l d0,40(sp)
     dae:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     db4:	2c40           	movea.l d0,a6
     db6:	202f 002c      	move.l 44(sp),d0
     dba:	222f 0028      	move.l 40(sp),d1
     dbe:	4eae ff3a      	jsr -198(a6)
     dc2:	2f40 0024      	move.l d0,36(sp)
     dc6:	202f 0024      	move.l 36(sp),d0
     dca:	23c0 0002 8328 	move.l d0,28328 <Bitplane2>
  if(Bitplane2 == 0) {
     dd0:	2039 0002 8328 	move.l 28328 <Bitplane2>,d0
     dd6:	6658           	bne.s e30 <PrepareDisplaySW+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     dd8:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     dde:	2c40           	movea.l d0,a6
     de0:	4eae ffc4      	jsr -60(a6)
     de4:	2f40 0020      	move.l d0,32(sp)
     de8:	202f 0020      	move.l 32(sp),d0
     dec:	2f40 001c      	move.l d0,28(sp)
     df0:	2f7c 0000 7b44 	move.l #31556,24(sp)
     df6:	0018 
     df8:	7026           	moveq #38,d0
     dfa:	2f40 0014      	move.l d0,20(sp)
     dfe:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     e04:	2c40           	movea.l d0,a6
     e06:	222f 001c      	move.l 28(sp),d1
     e0a:	242f 0018      	move.l 24(sp),d2
     e0e:	262f 0014      	move.l 20(sp),d3
     e12:	4eae ffd0      	jsr -48(a6)
     e16:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     e1a:	7001           	moveq #1,d0
     e1c:	2f40 000c      	move.l d0,12(sp)
     e20:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     e26:	2c40           	movea.l d0,a6
     e28:	222f 000c      	move.l 12(sp),d1
     e2c:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
     e30:	2039 0002 8328 	move.l 28328 <Bitplane2>,d0
     e36:	23c0 0002 8338 	move.l d0,28338 <ViewBuffer>
  ViewCopper = Copperlist2;
     e3c:	2039 0002 8330 	move.l 28330 <Copperlist2>,d0
     e42:	23c0 0002 8340 	move.l d0,28340 <ViewCopper>
  SwapCl();
     e48:	4eba f3aa      	jsr 1f4 <SwapCl>(pc)
  SetBplPointers();
     e4c:	4eba f348      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
     e50:	4eba f3a2      	jsr 1f4 <SwapCl>(pc)
  SetBplPointers();
     e54:	4eba f340      	jsr 196 <SetBplPointers>(pc)
  return 0;
     e58:	7000           	moveq #0,d0
}
     e5a:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     e5e:	4fef 0048      	lea 72(sp),sp
     e62:	4e75           	rts

00000e64 <ClbuildSW>:

ULONG * ClbuildSW() {
     e64:	4fef ffc4      	lea -60(sp),sp
     e68:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
     e6c:	2f7c 0000 0084 	move.l #132,48(sp)
     e72:	0030 
     e74:	7002           	moveq #2,d0
     e76:	2f40 002c      	move.l d0,44(sp)
     e7a:	2039 0002 8348 	move.l 28348 <SysBase>,d0
     e80:	2c40           	movea.l d0,a6
     e82:	202f 0030      	move.l 48(sp),d0
     e86:	222f 002c      	move.l 44(sp),d1
     e8a:	4eae ff3a      	jsr -198(a6)
     e8e:	2f40 0028      	move.l d0,40(sp)
     e92:	202f 0028      	move.l 40(sp),d0
     e96:	2f40 0024      	move.l d0,36(sp)
  
  if( retval == 0) {
     e9a:	6658           	bne.s ef4 <ClbuildSW+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     e9c:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     ea2:	2c40           	movea.l d0,a6
     ea4:	4eae ffc4      	jsr -60(a6)
     ea8:	2f40 0020      	move.l d0,32(sp)
     eac:	202f 0020      	move.l 32(sp),d0
     eb0:	2f40 001c      	move.l d0,28(sp)
     eb4:	2f7c 0000 7b6b 	move.l #31595,24(sp)
     eba:	0018 
     ebc:	7228           	moveq #40,d1
     ebe:	2f41 0014      	move.l d1,20(sp)
     ec2:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     ec8:	2c40           	movea.l d0,a6
     eca:	222f 001c      	move.l 28(sp),d1
     ece:	242f 0018      	move.l 24(sp),d2
     ed2:	262f 0014      	move.l 20(sp),d3
     ed6:	4eae ffd0      	jsr -48(a6)
     eda:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     ede:	7401           	moveq #1,d2
     ee0:	2f42 000c      	move.l d2,12(sp)
     ee4:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
     eea:	2c40           	movea.l d0,a6
     eec:	222f 000c      	move.l 12(sp),d1
     ef0:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
     ef4:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
     efa:	2f7c 0001 a3c4 	move.l #107460,64(sp)
     f00:	0040 
  for(int i=0; i<16;i++)
     f02:	42af 003c      	clr.l 60(sp)
     f06:	6024           	bra.s f2c <ClbuildSW+0xc8>
    *cl++ = *clpartinstruction++;
     f08:	222f 0040      	move.l 64(sp),d1
     f0c:	2001           	move.l d1,d0
     f0e:	5880           	addq.l #4,d0
     f10:	2f40 0040      	move.l d0,64(sp)
     f14:	202f 0044      	move.l 68(sp),d0
     f18:	2400           	move.l d0,d2
     f1a:	5882           	addq.l #4,d2
     f1c:	2f42 0044      	move.l d2,68(sp)
     f20:	2041           	movea.l d1,a0
     f22:	2210           	move.l (a0),d1
     f24:	2040           	movea.l d0,a0
     f26:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
     f28:	52af 003c      	addq.l #1,60(sp)
     f2c:	700f           	moveq #15,d0
     f2e:	b0af 003c      	cmp.l 60(sp),d0
     f32:	6cd4           	bge.s f08 <ClbuildSW+0xa4>
  clpartinstruction = ClScreen;
     f34:	2f7c 0001 a404 	move.l #107524,64(sp)
     f3a:	0040 
  for(int i=0; i<12;i++)
     f3c:	42af 0038      	clr.l 56(sp)
     f40:	6024           	bra.s f66 <ClbuildSW+0x102>
    *cl++ = *clpartinstruction++;
     f42:	222f 0040      	move.l 64(sp),d1
     f46:	2401           	move.l d1,d2
     f48:	5882           	addq.l #4,d2
     f4a:	2f42 0040      	move.l d2,64(sp)
     f4e:	202f 0044      	move.l 68(sp),d0
     f52:	2400           	move.l d0,d2
     f54:	5882           	addq.l #4,d2
     f56:	2f42 0044      	move.l d2,68(sp)
     f5a:	2041           	movea.l d1,a0
     f5c:	2210           	move.l (a0),d1
     f5e:	2040           	movea.l d0,a0
     f60:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
     f62:	52af 0038      	addq.l #1,56(sp)
     f66:	700b           	moveq #11,d0
     f68:	b0af 0038      	cmp.l 56(sp),d0
     f6c:	6cd4           	bge.s f42 <ClbuildSW+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
     f6e:	202f 0044      	move.l 68(sp),d0
     f72:	2200           	move.l d0,d1
     f74:	5881           	addq.l #4,d1
     f76:	2f41 0044      	move.l d1,68(sp)
     f7a:	2040           	movea.l d0,a0
     f7c:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
     f82:	202f 0044      	move.l 68(sp),d0
     f86:	2200           	move.l d0,d1
     f88:	5881           	addq.l #4,d1
     f8a:	2f41 0044      	move.l d1,68(sp)
     f8e:	2040           	movea.l d0,a0
     f90:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
     f96:	2f7c 0001 a344 	move.l #107332,64(sp)
     f9c:	0040 
  for(int i=0; i<2;i++)
     f9e:	42af 0034      	clr.l 52(sp)
     fa2:	6024           	bra.s fc8 <ClbuildSW+0x164>
    *cl++ = *clpartinstruction++;
     fa4:	222f 0040      	move.l 64(sp),d1
     fa8:	2001           	move.l d1,d0
     faa:	5880           	addq.l #4,d0
     fac:	2f40 0040      	move.l d0,64(sp)
     fb0:	202f 0044      	move.l 68(sp),d0
     fb4:	2400           	move.l d0,d2
     fb6:	5882           	addq.l #4,d2
     fb8:	2f42 0044      	move.l d2,68(sp)
     fbc:	2041           	movea.l d1,a0
     fbe:	2210           	move.l (a0),d1
     fc0:	2040           	movea.l d0,a0
     fc2:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
     fc4:	52af 0034      	addq.l #1,52(sp)
     fc8:	7001           	moveq #1,d0
     fca:	b0af 0034      	cmp.l 52(sp),d0
     fce:	6cd4           	bge.s fa4 <ClbuildSW+0x140>

  *cl = 0xfffffffe;
     fd0:	206f 0044      	movea.l 68(sp),a0
     fd4:	72fe           	moveq #-2,d1
     fd6:	2081           	move.l d1,(a0)

  return retval;
     fd8:	202f 0024      	move.l 36(sp),d0
}
     fdc:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     fe0:	4fef 003c      	lea 60(sp),sp
     fe4:	4e75           	rts

00000fe6 <WriteFont>:

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
     fe6:	4fef fff0      	lea -16(sp),sp
  UWORD *bmpptr = Destination;
     fea:	2f6f 0018 000c 	move.l 24(sp),12(sp)
  UWORD *fntptr = font;
     ff0:	2f6f 0014 0008 	move.l 20(sp),8(sp)

  char charpos = *text;
     ff6:	206f 001c      	movea.l 28(sp),a0
     ffa:	1f50 0003      	move.b (a0),3(sp)
  charpos -= 0x20;
     ffe:	102f 0003      	move.b 3(sp),d0
    1002:	0600 ffe0      	addi.b #-32,d0
    1006:	1f40 0003      	move.b d0,3(sp)
  charpos = charpos<<3;
    100a:	102f 0003      	move.b 3(sp),d0
    100e:	4880           	ext.w d0
    1010:	48c0           	ext.l d0
    1012:	e788           	lsl.l #3,d0
    1014:	1f40 0003      	move.b d0,3(sp)
  fntptr += charpos;
    1018:	102f 0003      	move.b 3(sp),d0
    101c:	4880           	ext.w d0
    101e:	3040           	movea.w d0,a0
    1020:	2008           	move.l a0,d0
    1022:	d088           	add.l a0,d0
    1024:	d1af 0008      	add.l d0,8(sp)
  for(int i=1;i<=8;i++) {
    1028:	7001           	moveq #1,d0
    102a:	2f40 0004      	move.l d0,4(sp)
    102e:	6020           	bra.s 1050 <WriteFont+0x6a>
    *bmpptr = *fntptr++;
    1030:	202f 0008      	move.l 8(sp),d0
    1034:	2200           	move.l d0,d1
    1036:	5481           	addq.l #2,d1
    1038:	2f41 0008      	move.l d1,8(sp)
    103c:	2040           	movea.l d0,a0
    103e:	3010           	move.w (a0),d0
    1040:	206f 000c      	movea.l 12(sp),a0
    1044:	3080           	move.w d0,(a0)
    bmpptr += 40;
    1046:	7050           	moveq #80,d0
    1048:	d1af 000c      	add.l d0,12(sp)
  for(int i=1;i<=8;i++) {
    104c:	52af 0004      	addq.l #1,4(sp)
    1050:	7208           	moveq #8,d1
    1052:	b2af 0004      	cmp.l 4(sp),d1
    1056:	6cd8           	bge.s 1030 <WriteFont+0x4a>
  }

}
    1058:	4fef 0010      	lea 16(sp),sp
    105c:	4e75           	rts

0000105e <Zoom_VblankHandler>:

INCBIN(startimage, "raw/zoom.raw")

void Zoom_VblankHandler() {
  
  Zoom_Counter++;
    105e:	3039 0002 8382 	move.w 28382 <Zoom_Counter>,d0
    1064:	5240           	addq.w #1,d0
    1066:	33c0 0002 8382 	move.w d0,28382 <Zoom_Counter>
  SwapCl();
    106c:	4eba f186      	jsr 1f4 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
    1070:	33fc 0001 0002 	move.w #1,28388 <Zoom_MouseReleased>
    1076:	8388 
  if( MouseLeft())
    1078:	4eba f23c      	jsr 2b6 <MouseLeft>(pc)
    107c:	4a40           	tst.w d0
    107e:	6708           	beq.s 1088 <Zoom_VblankHandler+0x2a>
    Zoom_Mousepressed = 1;
    1080:	33fc 0001 0002 	move.w #1,2838a <Zoom_Mousepressed>
    1086:	838a 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
    1088:	3039 0002 838a 	move.w 2838a <Zoom_Mousepressed>,d0
    108e:	0c40 0001      	cmpi.w #1,d0
    1092:	6616           	bne.s 10aa <Zoom_VblankHandler+0x4c>
    1094:	4eba f220      	jsr 2b6 <MouseLeft>(pc)
    1098:	4a40           	tst.w d0
    109a:	660e           	bne.s 10aa <Zoom_VblankHandler+0x4c>
    Zoom_MouseReleased = 1;
    109c:	33fc 0001 0002 	move.w #1,28388 <Zoom_MouseReleased>
    10a2:	8388 
    Zoom_Mousepressed = 0;
    10a4:	4279 0002 838a 	clr.w 2838a <Zoom_Mousepressed>
  }
    if( Zoom_MouseReleased == 1) {
    10aa:	3039 0002 8388 	move.w 28388 <Zoom_MouseReleased>,d0
    10b0:	0c40 0001      	cmpi.w #1,d0
    10b4:	666a           	bne.s 1120 <Zoom_VblankHandler+0xc2>
      Zoom_MouseReleased = 0;
    10b6:	4279 0002 8388 	clr.w 28388 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 0) {
    10bc:	3039 0002 8390 	move.w 28390 <Zoom_LevelOf102Zoom>,d0
    10c2:	664e           	bne.s 1112 <Zoom_VblankHandler+0xb4>
 
        if( Zoom_LevelOfZoom == 17)
    10c4:	3039 0002 838e 	move.w 2838e <Zoom_LevelOfZoom>,d0
    10ca:	0c40 0011      	cmpi.w #17,d0
    10ce:	660a           	bne.s 10da <Zoom_VblankHandler+0x7c>
          Zoom_LevelOfZoom = 0;
    10d0:	33fc 0000 0002 	move.w #0,2838e <Zoom_LevelOfZoom>
    10d6:	838e 
    10d8:	600e           	bra.s 10e8 <Zoom_VblankHandler+0x8a>
        else
          Zoom_LevelOfZoom++;
    10da:	3039 0002 838e 	move.w 2838e <Zoom_LevelOfZoom>,d0
    10e0:	5240           	addq.w #1,d0
    10e2:	33c0 0002 838e 	move.w d0,2838e <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = MaxZoom102[Zoom_LevelOfZoom] - 2;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
    10e8:	3039 0002 838e 	move.w 2838e <Zoom_LevelOfZoom>,d0
    10ee:	3000           	move.w d0,d0
    10f0:	0280 0000 ffff 	andi.l #65535,d0
    10f6:	2240           	movea.l d0,a1
    10f8:	d3c0           	adda.l d0,a1
    10fa:	41f9 0001 b55c 	lea 1b55c <MaxZoom102>,a0
    1100:	3031 8800      	move.w (0,a1,a0.l),d0
    1104:	5540           	subq.w #2,d0
    1106:	33c0 0002 8390 	move.w d0,28390 <Zoom_LevelOf102Zoom>
        Zoom_SwapBuffers();
    110c:	4eba 0fbe      	jsr 20cc <Zoom_SwapBuffers>(pc)
    1110:	600e           	bra.s 1120 <Zoom_VblankHandler+0xc2>
      } else 
        Zoom_LevelOf102Zoom--;
    1112:	3039 0002 8390 	move.w 28390 <Zoom_LevelOf102Zoom>,d0
    1118:	5340           	subq.w #1,d0
    111a:	33c0 0002 8390 	move.w d0,28390 <Zoom_LevelOf102Zoom>
    }
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
    1120:	2239 0002 833c 	move.l 2833c <DrawCopper>,d1
    1126:	3039 0002 8390 	move.w 28390 <Zoom_LevelOf102Zoom>,d0
    112c:	3000           	move.w d0,d0
    112e:	0280 0000 ffff 	andi.l #65535,d0
    1134:	2f01           	move.l d1,-(sp)
    1136:	2f00           	move.l d0,-(sp)
    1138:	4eba f420      	jsr 55a <Zoom_Shrink102>(pc)
    113c:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
    113e:	2239 0002 833c 	move.l 2833c <DrawCopper>,d1
    1144:	2039 0002 8338 	move.l 28338 <ViewBuffer>,d0
    114a:	2f01           	move.l d1,-(sp)
    114c:	2f00           	move.l d0,-(sp)
    114e:	4eba 0efe      	jsr 204e <Zoom_SetBplPointers>(pc)
    1152:	508f           	addq.l #8,sp
 
}
    1154:	4e75           	rts

00001156 <Zoom_LoadImage>:

void Zoom_LoadImage( ULONG *destination) {  
    1156:	4fef fff4      	lea -12(sp),sp
    115a:	2f0e           	move.l a6,-(sp)
  CopyMem( startimage, destination, ZMBPLSIZE);
    115c:	2f79 0001 b5e0 	move.l 1b5e0 <startimage>,12(sp)
    1162:	000c 
    1164:	2f6f 0014 0008 	move.l 20(sp),8(sp)
    116a:	2f7c 0000 ff00 	move.l #65280,4(sp)
    1170:	0004 
    1172:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    1178:	2c40           	movea.l d0,a6
    117a:	206f 000c      	movea.l 12(sp),a0
    117e:	226f 0008      	movea.l 8(sp),a1
    1182:	202f 0004      	move.l 4(sp),d0
    1186:	4eae fd90      	jsr -624(a6)
}
    118a:	2c5f           	movea.l (sp)+,a6
    118c:	4fef 000c      	lea 12(sp),sp
    1190:	4e75           	rts

00001192 <Zoom_CopyWord>:

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080008, 
                                                       0x010a0000, 0x01001200 };

void  Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height) {  
    1192:	598f           	subq.l #4,sp
    1194:	202f 0010      	move.l 16(sp),d0
    1198:	3000           	move.w d0,d0
    119a:	3f40 0002      	move.w d0,2(sp)

  WaitBlt();
    119e:	4eba ef14      	jsr b4 <WaitBlt>(pc)

  hw->bltapt = (UWORD *) source;
    11a2:	2079 0002 8344 	movea.l 28344 <hw>,a0
    11a8:	216f 0008 0050 	move.l 8(sp),80(a0)
  hw->bltdpt = (UWORD *) destination;
    11ae:	2079 0002 8344 	movea.l 28344 <hw>,a0
    11b4:	216f 000c 0054 	move.l 12(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    11ba:	302f 0002      	move.w 2(sp),d0
    11be:	ed48           	lsl.w #6,d0
    11c0:	2079 0002 8344 	movea.l 28344 <hw>,a0
    11c6:	5440           	addq.w #2,d0
    11c8:	3140 0058      	move.w d0,88(a0)

}
    11cc:	588f           	addq.l #4,sp
    11ce:	4e75           	rts

000011d0 <Zoom_ZoomBlit>:

void Zoom_ZoomBlit( UWORD *source, UWORD *destination, UWORD height) {
    11d0:	518f           	subq.l #8,sp
    11d2:	202f 0014      	move.l 20(sp),d0
    11d6:	3000           	move.w d0,d0
    11d8:	3f40 0002      	move.w d0,2(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B

  UWORD *blta = source + ZoomBlit_Increment4SrcA;
    11dc:	3039 0002 8378 	move.w 28378 <ZoomBlit_Increment4SrcA>,d0
    11e2:	3000           	move.w d0,d0
    11e4:	0280 0000 ffff 	andi.l #65535,d0
    11ea:	d080           	add.l d0,d0
    11ec:	222f 000c      	move.l 12(sp),d1
    11f0:	d280           	add.l d0,d1
    11f2:	2f41 0004      	move.l d1,4(sp)
  WaitBlt();
    11f6:	4eba eebc      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  
  hw->bltapt = blta;
    11fa:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1200:	216f 0004 0050 	move.l 4(sp),80(a0)
  hw->bltbpt = source;
    1206:	2079 0002 8344 	movea.l 28344 <hw>,a0
    120c:	216f 000c 004c 	move.l 12(sp),76(a0)
  hw->bltdpt = destination;
    1212:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1218:	216f 0010 0054 	move.l 16(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    121e:	302f 0002      	move.w 2(sp),d0
    1222:	ed48           	lsl.w #6,d0
    1224:	2079 0002 8344 	movea.l 28344 <hw>,a0
    122a:	5440           	addq.w #2,d0
    122c:	3140 0058      	move.w d0,88(a0)

}
    1230:	508f           	addq.l #8,sp
    1232:	4e75           	rts

00001234 <Zoom_ZoomBlit2>:

void Zoom_ZoomBlit2( UWORD *src4a, UWORD *src4b, UWORD *dst, UWORD height,
                                                 UWORD bltamod, UWORD bltbmod
                                                        , UWORD numofwords) {
    1234:	518f           	subq.l #8,sp
    1236:	226f 0018      	movea.l 24(sp),a1
    123a:	206f 001c      	movea.l 28(sp),a0
    123e:	222f 0020      	move.l 32(sp),d1
    1242:	202f 0024      	move.l 36(sp),d0
    1246:	3249           	movea.w a1,a1
    1248:	3f49 0006      	move.w a1,6(sp)
    124c:	3048           	movea.w a0,a0
    124e:	3f48 0004      	move.w a0,4(sp)
    1252:	3201           	move.w d1,d1
    1254:	3f41 0002      	move.w d1,2(sp)
    1258:	3000           	move.w d0,d0
    125a:	3e80           	move.w d0,(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B
  hw->bltamod = bltamod;
    125c:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1262:	316f 0004 0064 	move.w 4(sp),100(a0)
  hw->bltbmod = bltbmod;  
    1268:	2079 0002 8344 	movea.l 28344 <hw>,a0
    126e:	316f 0002 0062 	move.w 2(sp),98(a0)
  hw->bltapt = src4a;
    1274:	2079 0002 8344 	movea.l 28344 <hw>,a0
    127a:	216f 000c 0050 	move.l 12(sp),80(a0)
  hw->bltbpt = src4b;
    1280:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1286:	216f 0010 004c 	move.l 16(sp),76(a0)
  hw->bltdpt = dst;
    128c:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1292:	216f 0014 0054 	move.l 20(sp),84(a0)
  hw->bltsize = (height<<6)+numofwords;
    1298:	302f 0006      	move.w 6(sp),d0
    129c:	ed48           	lsl.w #6,d0
    129e:	2079 0002 8344 	movea.l 28344 <hw>,a0
    12a4:	d057           	add.w (sp),d0
    12a6:	3140 0058      	move.w d0,88(a0)
  
  WaitBlt();
    12aa:	4eba ee08      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a  

}
    12ae:	508f           	addq.l #8,sp
    12b0:	4e75           	rts

000012b2 <Zoom_InitRun>:


void Zoom_InitRun() {
    12b2:	4fef ffc8      	lea -56(sp),sp
    12b6:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    12b8:	4279 0002 8382 	clr.w 28382 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    12be:	7004           	moveq #4,d0
    12c0:	2f40 0038      	move.l d0,56(sp)
    12c4:	7002           	moveq #2,d0
    12c6:	2f40 0034      	move.l d0,52(sp)
    12ca:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    12d0:	2c40           	movea.l d0,a6
    12d2:	202f 0038      	move.l 56(sp),d0
    12d6:	222f 0034      	move.l 52(sp),d1
    12da:	4eae ff3a      	jsr -198(a6)
    12de:	2f40 0030      	move.l d0,48(sp)
    12e2:	202f 0030      	move.l 48(sp),d0
    12e6:	23c0 0002 8370 	move.l d0,28370 <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 15;
    12ec:	33fc 000f 0002 	move.w #15,28390 <Zoom_LevelOf102Zoom>
    12f2:	8390 
  ZoomHorizontal = 16;
    12f4:	33fc 0010 0002 	move.w #16,28394 <ZoomHorizontal>
    12fa:	8394 
  Zoom_PrepareDisplay();
    12fc:	4eba 01da      	jsr 14d8 <Zoom_PrepareDisplay>(pc)
  Zoom_StartImage = startimage;
    1300:	2039 0001 b5e0 	move.l 1b5e0 <startimage>,d0
    1306:	23c0 0002 8384 	move.l d0,28384 <Zoom_StartImage>
  Zoom_LoadImage( Bitplane1);
    130c:	2039 0002 8324 	move.l 28324 <Bitplane1>,d0
    1312:	2f00           	move.l d0,-(sp)
    1314:	4eba fe40      	jsr 1156 <Zoom_LoadImage>(pc)
    1318:	588f           	addq.l #4,sp
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
    131a:	2239 0002 8328 	move.l 28328 <Bitplane2>,d1
    1320:	2039 0002 8324 	move.l 28324 <Bitplane1>,d0
    1326:	4878 0005      	pea 5 <_start+0x5>
    132a:	42a7           	clr.l -(sp)
    132c:	2f01           	move.l d1,-(sp)
    132e:	2f00           	move.l d0,-(sp)
    1330:	4eba 0992      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    1334:	4fef 0010      	lea 16(sp),sp
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
    1338:	2f79 0002 8328 	move.l 28328 <Bitplane2>,44(sp)
    133e:	002c 
    1340:	2f79 0002 8324 	move.l 28324 <Bitplane1>,40(sp)
    1346:	0028 
    1348:	2f7c 0000 ff00 	move.l #65280,36(sp)
    134e:	0024 
    1350:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    1356:	2c40           	movea.l d0,a6
    1358:	206f 002c      	movea.l 44(sp),a0
    135c:	226f 0028      	movea.l 40(sp),a1
    1360:	202f 0024      	move.l 36(sp),d0
    1364:	4eae fd90      	jsr -624(a6)
  CopyMem( Bitplane2, startimage, ZMBPLSIZE);
    1368:	2f79 0002 8328 	move.l 28328 <Bitplane2>,32(sp)
    136e:	0020 
    1370:	2f79 0001 b5e0 	move.l 1b5e0 <startimage>,28(sp)
    1376:	001c 
    1378:	2f7c 0000 ff00 	move.l #65280,24(sp)
    137e:	0018 
    1380:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    1386:	2c40           	movea.l d0,a6
    1388:	206f 0020      	movea.l 32(sp),a0
    138c:	226f 001c      	movea.l 28(sp),a1
    1390:	202f 0018      	move.l 24(sp),d0
    1394:	4eae fd90      	jsr -624(a6)
  
  Zoom_Shrink102( 15, Copperlist1);
    1398:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    139e:	2f00           	move.l d0,-(sp)
    13a0:	4878 000f      	pea f <_start+0xf>
    13a4:	4eba f1b4      	jsr 55a <Zoom_Shrink102>(pc)
    13a8:	508f           	addq.l #8,sp
  Zoom_Shrink102( 15, Copperlist2);
    13aa:	2039 0002 8330 	move.l 28330 <Copperlist2>,d0
    13b0:	2f00           	move.l d0,-(sp)
    13b2:	4878 000f      	pea f <_start+0xf>
    13b6:	4eba f1a2      	jsr 55a <Zoom_Shrink102>(pc)
    13ba:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 1;
    13bc:	33fc 0001 0002 	move.w #1,2838e <Zoom_LevelOfZoom>
    13c2:	838e 
  Zoom_Direction = 1;                                                  
    13c4:	33fc 0001 0002 	move.w #1,28392 <Zoom_Direction>
    13ca:	8392 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    13cc:	7016           	moveq #22,d0
    13ce:	2f40 0014      	move.l d0,20(sp)
    13d2:	2f7c 0001 0001 	move.l #65537,16(sp)
    13d8:	0010 
    13da:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    13e0:	2c40           	movea.l d0,a6
    13e2:	202f 0014      	move.l 20(sp),d0
    13e6:	222f 0010      	move.l 16(sp),d1
    13ea:	4eae ff3a      	jsr -198(a6)
    13ee:	2f40 000c      	move.l d0,12(sp)
    13f2:	202f 000c      	move.l 12(sp),d0
    13f6:	23c0 0002 837a 	move.l d0,2837a <Zoom_vbint>
    13fc:	2039 0002 837a 	move.l 2837a <Zoom_vbint>,d0
    1402:	673e           	beq.s 1442 <Zoom_InitRun+0x190>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1404:	2079 0002 837a 	movea.l 2837a <Zoom_vbint>,a0
    140a:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    1410:	2079 0002 837a 	movea.l 2837a <Zoom_vbint>,a0
    1416:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    141c:	2079 0002 837a 	movea.l 2837a <Zoom_vbint>,a0
    1422:	217c 0001 7a93 	move.l #96915,10(a0)
    1428:	000a 
    Zoom_vbint->is_Data = NULL;
    142a:	2079 0002 837a 	movea.l 2837a <Zoom_vbint>,a0
    1430:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    1434:	2079 0002 837a 	movea.l 2837a <Zoom_vbint>,a0
    143a:	217c 0000 105e 	move.l #4190,18(a0)
    1440:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    1442:	7005           	moveq #5,d0
    1444:	2f40 0008      	move.l d0,8(sp)
    1448:	2f79 0002 837a 	move.l 2837a <Zoom_vbint>,4(sp)
    144e:	0004 
    1450:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    1456:	2c40           	movea.l d0,a6
    1458:	202f 0008      	move.l 8(sp),d0
    145c:	226f 0004      	movea.l 4(sp),a1
    1460:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    1464:	2239 0002 8340 	move.l 28340 <ViewCopper>,d1
    146a:	2039 0002 8338 	move.l 28338 <ViewBuffer>,d0
    1470:	2f01           	move.l d1,-(sp)
    1472:	2f00           	move.l d0,-(sp)
    1474:	4eba 0bd8      	jsr 204e <Zoom_SetBplPointers>(pc)
    1478:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    147a:	2239 0002 833c 	move.l 2833c <DrawCopper>,d1
    1480:	2039 0002 8338 	move.l 28338 <ViewBuffer>,d0
    1486:	2f01           	move.l d1,-(sp)
    1488:	2f00           	move.l d0,-(sp)
    148a:	4eba 0bc2      	jsr 204e <Zoom_SetBplPointers>(pc)
    148e:	508f           	addq.l #8,sp
  SwapCl();
    1490:	4eba ed62      	jsr 1f4 <SwapCl>(pc)
  
}
    1494:	2c5f           	movea.l (sp)+,a6
    1496:	4fef 0038      	lea 56(sp),sp
    149a:	4e75           	rts

0000149c <Zoom_Dealloc>:

void Zoom_Dealloc() {
    149c:	518f           	subq.l #8,sp
    149e:	2f0e           	move.l a6,-(sp)
  RemIntServer(INTB_VERTB, Zoom_vbint);
    14a0:	7005           	moveq #5,d0
    14a2:	2f40 0008      	move.l d0,8(sp)
    14a6:	2f79 0002 837a 	move.l 2837a <Zoom_vbint>,4(sp)
    14ac:	0004 
    14ae:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    14b4:	2c40           	movea.l d0,a6
    14b6:	202f 0008      	move.l 8(sp),d0
    14ba:	226f 0004      	movea.l 4(sp),a1
    14be:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    14c2:	2f3c 0000 ff00 	move.l #65280,-(sp)
    14c8:	4878 031c      	pea 31c <RunDemo+0x6>
    14cc:	4eba ec12      	jsr e0 <FreeDisplay>(pc)
    14d0:	508f           	addq.l #8,sp
}
    14d2:	2c5f           	movea.l (sp)+,a6
    14d4:	508f           	addq.l #8,sp
    14d6:	4e75           	rts

000014d8 <Zoom_PrepareDisplay>:
  
int Zoom_PrepareDisplay() {
    14d8:	4fef ffb8      	lea -72(sp),sp
    14dc:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClbuildZoom( );
    14e0:	4eba 01ba      	jsr 169c <ClbuildZoom>(pc)
    14e4:	23c0 0002 832c 	move.l d0,2832c <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    14ea:	4eba 01b0      	jsr 169c <ClbuildZoom>(pc)
    14ee:	23c0 0002 8330 	move.l d0,28330 <Copperlist2>
  Bitplane1 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
    14f4:	2f7c 0000 ff00 	move.l #65280,80(sp)
    14fa:	0050 
    14fc:	7002           	moveq #2,d0
    14fe:	2f40 004c      	move.l d0,76(sp)
    1502:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    1508:	2c40           	movea.l d0,a6
    150a:	202f 0050      	move.l 80(sp),d0
    150e:	222f 004c      	move.l 76(sp),d1
    1512:	4eae ff3a      	jsr -198(a6)
    1516:	2f40 0048      	move.l d0,72(sp)
    151a:	202f 0048      	move.l 72(sp),d0
    151e:	23c0 0002 8324 	move.l d0,28324 <Bitplane1>
  if(Bitplane1 == 0) {
    1524:	2039 0002 8324 	move.l 28324 <Bitplane1>,d0
    152a:	6658           	bne.s 1584 <Zoom_PrepareDisplay+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    152c:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    1532:	2c40           	movea.l d0,a6
    1534:	4eae ffc4      	jsr -60(a6)
    1538:	2f40 0044      	move.l d0,68(sp)
    153c:	202f 0044      	move.l 68(sp),d0
    1540:	2f40 0040      	move.l d0,64(sp)
    1544:	2f7c 0000 7b1d 	move.l #31517,60(sp)
    154a:	003c 
    154c:	7026           	moveq #38,d0
    154e:	2f40 0038      	move.l d0,56(sp)
    1552:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    1558:	2c40           	movea.l d0,a6
    155a:	222f 0040      	move.l 64(sp),d1
    155e:	242f 003c      	move.l 60(sp),d2
    1562:	262f 0038      	move.l 56(sp),d3
    1566:	4eae ffd0      	jsr -48(a6)
    156a:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    156e:	7001           	moveq #1,d0
    1570:	2f40 0030      	move.l d0,48(sp)
    1574:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    157a:	2c40           	movea.l d0,a6
    157c:	222f 0030      	move.l 48(sp),d1
    1580:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    1584:	2039 0002 8324 	move.l 28324 <Bitplane1>,d0
    158a:	23c0 0002 8334 	move.l d0,28334 <DrawBuffer>
  DrawCopper = Copperlist1;
    1590:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    1596:	23c0 0002 833c 	move.l d0,2833c <DrawCopper>
  Bitplane2 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
    159c:	2f7c 0000 ff00 	move.l #65280,44(sp)
    15a2:	002c 
    15a4:	7002           	moveq #2,d0
    15a6:	2f40 0028      	move.l d0,40(sp)
    15aa:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    15b0:	2c40           	movea.l d0,a6
    15b2:	202f 002c      	move.l 44(sp),d0
    15b6:	222f 0028      	move.l 40(sp),d1
    15ba:	4eae ff3a      	jsr -198(a6)
    15be:	2f40 0024      	move.l d0,36(sp)
    15c2:	202f 0024      	move.l 36(sp),d0
    15c6:	23c0 0002 8328 	move.l d0,28328 <Bitplane2>
  if(Bitplane2 == 0) {
    15cc:	2039 0002 8328 	move.l 28328 <Bitplane2>,d0
    15d2:	6658           	bne.s 162c <Zoom_PrepareDisplay+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    15d4:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    15da:	2c40           	movea.l d0,a6
    15dc:	4eae ffc4      	jsr -60(a6)
    15e0:	2f40 0020      	move.l d0,32(sp)
    15e4:	202f 0020      	move.l 32(sp),d0
    15e8:	2f40 001c      	move.l d0,28(sp)
    15ec:	2f7c 0000 7b44 	move.l #31556,24(sp)
    15f2:	0018 
    15f4:	7026           	moveq #38,d0
    15f6:	2f40 0014      	move.l d0,20(sp)
    15fa:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    1600:	2c40           	movea.l d0,a6
    1602:	222f 001c      	move.l 28(sp),d1
    1606:	242f 0018      	move.l 24(sp),d2
    160a:	262f 0014      	move.l 20(sp),d3
    160e:	4eae ffd0      	jsr -48(a6)
    1612:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    1616:	7001           	moveq #1,d0
    1618:	2f40 000c      	move.l d0,12(sp)
    161c:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    1622:	2c40           	movea.l d0,a6
    1624:	222f 000c      	move.l 12(sp),d1
    1628:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    162c:	2039 0002 8328 	move.l 28328 <Bitplane2>,d0
    1632:	23c0 0002 8338 	move.l d0,28338 <ViewBuffer>
  ViewCopper = Copperlist2;
    1638:	2039 0002 8330 	move.l 28330 <Copperlist2>,d0
    163e:	23c0 0002 8340 	move.l d0,28340 <ViewCopper>
  return 0;
    1644:	7000           	moveq #0,d0
}
    1646:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    164a:	4fef 0048      	lea 72(sp),sp
    164e:	4e75           	rts

00001650 <Zoom_Init>:

void Zoom_Init() {
    1650:	4fef fff4      	lea -12(sp),sp
    1654:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    1656:	7004           	moveq #4,d0
    1658:	2f40 000c      	move.l d0,12(sp)
    165c:	7002           	moveq #2,d0
    165e:	2f40 0008      	move.l d0,8(sp)
    1662:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    1668:	2c40           	movea.l d0,a6
    166a:	202f 000c      	move.l 12(sp),d0
    166e:	222f 0008      	move.l 8(sp),d1
    1672:	4eae ff3a      	jsr -198(a6)
    1676:	2f40 0004      	move.l d0,4(sp)
    167a:	202f 0004      	move.l 4(sp),d0
    167e:	23c0 0002 8370 	move.l d0,28370 <Zoom_ZoomBlitMask>
  ZoomHorizontal = 16;
    1684:	33fc 0010 0002 	move.w #16,28394 <ZoomHorizontal>
    168a:	8394 
  Zoom_LevelOf102Zoom = 15;
    168c:	33fc 000f 0002 	move.w #15,28390 <Zoom_LevelOf102Zoom>
    1692:	8390 
}
    1694:	2c5f           	movea.l (sp)+,a6
    1696:	4fef 000c      	lea 12(sp),sp
    169a:	4e75           	rts

0000169c <ClbuildZoom>:


ULONG * ClbuildZoom() {
    169c:	4fef ffac      	lea -84(sp),sp
    16a0:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    16a4:	2f7c 0000 031c 	move.l #796,68(sp)
    16aa:	0044 
    16ac:	7002           	moveq #2,d0
    16ae:	2f40 0040      	move.l d0,64(sp)
    16b2:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    16b8:	2c40           	movea.l d0,a6
    16ba:	202f 0044      	move.l 68(sp),d0
    16be:	222f 0040      	move.l 64(sp),d1
    16c2:	4eae ff3a      	jsr -198(a6)
    16c6:	2f40 003c      	move.l d0,60(sp)
    16ca:	202f 003c      	move.l 60(sp),d0
    16ce:	2f40 0038      	move.l d0,56(sp)
  
  if( retval == 0) {
    16d2:	6658           	bne.s 172c <ClbuildZoom+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    16d4:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    16da:	2c40           	movea.l d0,a6
    16dc:	4eae ffc4      	jsr -60(a6)
    16e0:	2f40 0034      	move.l d0,52(sp)
    16e4:	202f 0034      	move.l 52(sp),d0
    16e8:	2f40 0030      	move.l d0,48(sp)
    16ec:	2f7c 0000 7b6b 	move.l #31595,44(sp)
    16f2:	002c 
    16f4:	7228           	moveq #40,d1
    16f6:	2f41 0028      	move.l d1,40(sp)
    16fa:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    1700:	2c40           	movea.l d0,a6
    1702:	222f 0030      	move.l 48(sp),d1
    1706:	242f 002c      	move.l 44(sp),d2
    170a:	262f 0028      	move.l 40(sp),d3
    170e:	4eae ffd0      	jsr -48(a6)
    1712:	2f40 0024      	move.l d0,36(sp)
    Exit(1);
    1716:	7401           	moveq #1,d2
    1718:	2f42 0020      	move.l d2,32(sp)
    171c:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    1722:	2c40           	movea.l d0,a6
    1724:	222f 0020      	move.l 32(sp),d1
    1728:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    172c:	2f6f 0038 005c 	move.l 56(sp),92(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    1732:	2f7c 0001 a3c4 	move.l #107460,88(sp)
    1738:	0058 
  for(int i=0; i<16;i++)
    173a:	42af 0054      	clr.l 84(sp)
    173e:	6024           	bra.s 1764 <ClbuildZoom+0xc8>
    *cl++ = *clpartinstruction++;
    1740:	222f 0058      	move.l 88(sp),d1
    1744:	2001           	move.l d1,d0
    1746:	5880           	addq.l #4,d0
    1748:	2f40 0058      	move.l d0,88(sp)
    174c:	202f 005c      	move.l 92(sp),d0
    1750:	2400           	move.l d0,d2
    1752:	5882           	addq.l #4,d2
    1754:	2f42 005c      	move.l d2,92(sp)
    1758:	2041           	movea.l d1,a0
    175a:	2210           	move.l (a0),d1
    175c:	2040           	movea.l d0,a0
    175e:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    1760:	52af 0054      	addq.l #1,84(sp)
    1764:	700f           	moveq #15,d0
    1766:	b0af 0054      	cmp.l 84(sp),d0
    176a:	6cd4           	bge.s 1740 <ClbuildZoom+0xa4>
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
    176c:	2f7c 0001 a404 	move.l #107524,88(sp)
    1772:	0058 
  for(int i=0; i<12;i++)
    1774:	42af 0050      	clr.l 80(sp)
    1778:	6024           	bra.s 179e <ClbuildZoom+0x102>
    *cl++ = *clpartinstruction++;
    177a:	222f 0058      	move.l 88(sp),d1
    177e:	2401           	move.l d1,d2
    1780:	5882           	addq.l #4,d2
    1782:	2f42 0058      	move.l d2,88(sp)
    1786:	202f 005c      	move.l 92(sp),d0
    178a:	2400           	move.l d0,d2
    178c:	5882           	addq.l #4,d2
    178e:	2f42 005c      	move.l d2,92(sp)
    1792:	2041           	movea.l d1,a0
    1794:	2210           	move.l (a0),d1
    1796:	2040           	movea.l d0,a0
    1798:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    179a:	52af 0050      	addq.l #1,80(sp)
    179e:	700b           	moveq #11,d0
    17a0:	b0af 0050      	cmp.l 80(sp),d0
    17a4:	6cd4           	bge.s 177a <ClbuildZoom+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    17a6:	202f 005c      	move.l 92(sp),d0
    17aa:	2200           	move.l d0,d1
    17ac:	5881           	addq.l #4,d1
    17ae:	2f41 005c      	move.l d1,92(sp)
    17b2:	2040           	movea.l d0,a0
    17b4:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    17ba:	202f 005c      	move.l 92(sp),d0
    17be:	2200           	move.l d0,d1
    17c0:	5881           	addq.l #4,d1
    17c2:	2f41 005c      	move.l d1,92(sp)
    17c6:	2040           	movea.l d0,a0
    17c8:	20bc 00e2 0000 	move.l #14811136,(a0)
  *cl++ = 0x00e40000;
    17ce:	202f 005c      	move.l 92(sp),d0
    17d2:	2200           	move.l d0,d1
    17d4:	5881           	addq.l #4,d1
    17d6:	2f41 005c      	move.l d1,92(sp)
    17da:	2040           	movea.l d0,a0
    17dc:	20bc 00e4 0000 	move.l #14942208,(a0)
  *cl++ = 0x00e60000;
    17e2:	202f 005c      	move.l 92(sp),d0
    17e6:	2200           	move.l d0,d1
    17e8:	5881           	addq.l #4,d1
    17ea:	2f41 005c      	move.l d1,92(sp)
    17ee:	2040           	movea.l d0,a0
    17f0:	20bc 00e6 0000 	move.l #15073280,(a0)
  *cl++ = 0x00e80000;
    17f6:	202f 005c      	move.l 92(sp),d0
    17fa:	2200           	move.l d0,d1
    17fc:	5881           	addq.l #4,d1
    17fe:	2f41 005c      	move.l d1,92(sp)
    1802:	2040           	movea.l d0,a0
    1804:	20bc 00e8 0000 	move.l #15204352,(a0)
  *cl++ = 0x00ea0000;
    180a:	202f 005c      	move.l 92(sp),d0
    180e:	2200           	move.l d0,d1
    1810:	5881           	addq.l #4,d1
    1812:	2f41 005c      	move.l d1,92(sp)
    1816:	2040           	movea.l d0,a0
    1818:	20bc 00ea 0000 	move.l #15335424,(a0)
  *cl++ = 0x00ec0000;
    181e:	202f 005c      	move.l 92(sp),d0
    1822:	2200           	move.l d0,d1
    1824:	5881           	addq.l #4,d1
    1826:	2f41 005c      	move.l d1,92(sp)
    182a:	2040           	movea.l d0,a0
    182c:	20bc 00ec 0000 	move.l #15466496,(a0)
  *cl++ = 0x00ee0000;
    1832:	202f 005c      	move.l 92(sp),d0
    1836:	2200           	move.l d0,d1
    1838:	5881           	addq.l #4,d1
    183a:	2f41 005c      	move.l d1,92(sp)
    183e:	2040           	movea.l d0,a0
    1840:	20bc 00ee 0000 	move.l #15597568,(a0)
  *cl++ = 0x00f00000;
    1846:	202f 005c      	move.l 92(sp),d0
    184a:	2200           	move.l d0,d1
    184c:	5881           	addq.l #4,d1
    184e:	2f41 005c      	move.l d1,92(sp)
    1852:	2040           	movea.l d0,a0
    1854:	20bc 00f0 0000 	move.l #15728640,(a0)
  *cl++ = 0x00f20000;
    185a:	202f 005c      	move.l 92(sp),d0
    185e:	2200           	move.l d0,d1
    1860:	5881           	addq.l #4,d1
    1862:	2f41 005c      	move.l d1,92(sp)
    1866:	2040           	movea.l d0,a0
    1868:	20bc 00f2 0000 	move.l #15859712,(a0)

  clpartinstruction = ClColor;
    186e:	2f7c 0001 a344 	move.l #107332,88(sp)
    1874:	0058 
  for(int i=0; i<32;i++)
    1876:	42af 004c      	clr.l 76(sp)
    187a:	6024           	bra.s 18a0 <ClbuildZoom+0x204>
    *cl++ = *clpartinstruction++;
    187c:	222f 0058      	move.l 88(sp),d1
    1880:	2001           	move.l d1,d0
    1882:	5880           	addq.l #4,d0
    1884:	2f40 0058      	move.l d0,88(sp)
    1888:	202f 005c      	move.l 92(sp),d0
    188c:	2400           	move.l d0,d2
    188e:	5882           	addq.l #4,d2
    1890:	2f42 005c      	move.l d2,92(sp)
    1894:	2041           	movea.l d1,a0
    1896:	2210           	move.l (a0),d1
    1898:	2040           	movea.l d0,a0
    189a:	2081           	move.l d1,(a0)
  for(int i=0; i<32;i++)
    189c:	52af 004c      	addq.l #1,76(sp)
    18a0:	701f           	moveq #31,d0
    18a2:	b0af 004c      	cmp.l 76(sp),d0
    18a6:	6cd4           	bge.s 187c <ClbuildZoom+0x1e0>
  
  ULONG cop2 = cl+3;
    18a8:	700c           	moveq #12,d0
    18aa:	d0af 005c      	add.l 92(sp),d0
    18ae:	2f40 001c      	move.l d0,28(sp)
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    18b2:	202f 001c      	move.l 28(sp),d0
    18b6:	4240           	clr.w d0
    18b8:	4840           	swap d0
    18ba:	2200           	move.l d0,d1
    18bc:	0681 0084 0000 	addi.l #8650752,d1
    18c2:	2f41 0018      	move.l d1,24(sp)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    18c6:	202f 001c      	move.l 28(sp),d0
    18ca:	0280 0000 ffff 	andi.l #65535,d0
    18d0:	2400           	move.l d0,d2
    18d2:	0682 0086 0000 	addi.l #8781824,d2
    18d8:	2f42 0014      	move.l d2,20(sp)
  clpartinstruction = Cl102ZoomInit;
    18dc:	2f7c 0001 a434 	move.l #107572,88(sp)
    18e2:	0058 
  *cl++ = cop2lch;
    18e4:	202f 005c      	move.l 92(sp),d0
    18e8:	2200           	move.l d0,d1
    18ea:	5881           	addq.l #4,d1
    18ec:	2f41 005c      	move.l d1,92(sp)
    18f0:	2040           	movea.l d0,a0
    18f2:	20af 0018      	move.l 24(sp),(a0)
  *cl++ = cop2lcl;
    18f6:	202f 005c      	move.l 92(sp),d0
    18fa:	2200           	move.l d0,d1
    18fc:	5881           	addq.l #4,d1
    18fe:	2f41 005c      	move.l d1,92(sp)
    1902:	2040           	movea.l d0,a0
    1904:	20af 0014      	move.l 20(sp),(a0)
  *cl++ = 0x2c01ff00;
    1908:	202f 005c      	move.l 92(sp),d0
    190c:	2200           	move.l d0,d1
    190e:	5881           	addq.l #4,d1
    1910:	2f41 005c      	move.l d1,92(sp)
    1914:	2040           	movea.l d0,a0
    1916:	20bc 2c01 ff00 	move.l #738328320,(a0)

  ULONG cop2br1 = cop2 + ( (30)<<2);
    191c:	7078           	moveq #120,d0
    191e:	d0af 001c      	add.l 28(sp),d0
    1922:	2f40 0010      	move.l d0,16(sp)
  ULONG cop2br2 = cop2 + ( (86)<<2);
    1926:	222f 001c      	move.l 28(sp),d1
    192a:	0681 0000 0158 	addi.l #344,d1
    1930:	2f41 000c      	move.l d1,12(sp)
  clpartinstruction = Cl102ZoomRepeat;
    1934:	2f7c 0001 a440 	move.l #107584,88(sp)
    193a:	0058 
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    193c:	202f 0010      	move.l 16(sp),d0
    1940:	4240           	clr.w d0
    1942:	4840           	swap d0
    1944:	307c 0070      	movea.w #112,a0
    1948:	d1ef 0058      	adda.l 88(sp),a0
    194c:	0680 0084 0000 	addi.l #8650752,d0
    1952:	2080           	move.l d0,(a0)
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    1954:	202f 0010      	move.l 16(sp),d0
    1958:	0280 0000 ffff 	andi.l #65535,d0
    195e:	307c 0074      	movea.w #116,a0
    1962:	d1ef 0058      	adda.l 88(sp),a0
    1966:	0680 0086 0000 	addi.l #8781824,d0
    196c:	2080           	move.l d0,(a0)
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    196e:	202f 000c      	move.l 12(sp),d0
    1972:	4240           	clr.w d0
    1974:	4840           	swap d0
    1976:	206f 0058      	movea.l 88(sp),a0
    197a:	41e8 0150      	lea 336(a0),a0
    197e:	0680 0084 0000 	addi.l #8650752,d0
    1984:	2080           	move.l d0,(a0)
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    1986:	202f 000c      	move.l 12(sp),d0
    198a:	0280 0000 ffff 	andi.l #65535,d0
    1990:	206f 0058      	movea.l 88(sp),a0
    1994:	41e8 0154      	lea 340(a0),a0
    1998:	0680 0086 0000 	addi.l #8781824,d0
    199e:	2080           	move.l d0,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    19a0:	42af 0048      	clr.l 72(sp)
    19a4:	6024           	bra.s 19ca <ClbuildZoom+0x32e>
    *cl++ = *clpartinstruction++;
    19a6:	222f 0058      	move.l 88(sp),d1
    19aa:	2401           	move.l d1,d2
    19ac:	5882           	addq.l #4,d2
    19ae:	2f42 0058      	move.l d2,88(sp)
    19b2:	202f 005c      	move.l 92(sp),d0
    19b6:	2400           	move.l d0,d2
    19b8:	5882           	addq.l #4,d2
    19ba:	2f42 005c      	move.l d2,92(sp)
    19be:	2041           	movea.l d1,a0
    19c0:	2210           	move.l (a0),d1
    19c2:	2040           	movea.l d0,a0
    19c4:	2081           	move.l d1,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    19c6:	52af 0048      	addq.l #1,72(sp)
    19ca:	7071           	moveq #113,d0
    19cc:	b0af 0048      	cmp.l 72(sp),d0
    19d0:	6cd4           	bge.s 19a6 <ClbuildZoom+0x30a>

   *cl++ = 0xfffffffe;
    19d2:	202f 005c      	move.l 92(sp),d0
    19d6:	2200           	move.l d0,d1
    19d8:	5881           	addq.l #4,d1
    19da:	2f41 005c      	move.l d1,92(sp)
    19de:	74fe           	moveq #-2,d2
    19e0:	2040           	movea.l d0,a0
    19e2:	2082           	move.l d2,(a0)

  return retval;
    19e4:	202f 0038      	move.l 56(sp),d0
}
    19e8:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    19ec:	4fef 0054      	lea 84(sp),sp
    19f0:	4e75           	rts

000019f2 <PrepareDisplayZoom>:

 int PrepareDisplayZoom() {
    19f2:	4fef ffb8      	lea -72(sp),sp
    19f6:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildZoom();
    19fa:	4eba fca0      	jsr 169c <ClbuildZoom>(pc)
    19fe:	23c0 0002 832c 	move.l d0,2832c <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1a04:	4eba fc96      	jsr 169c <ClbuildZoom>(pc)
    1a08:	23c0 0002 8330 	move.l d0,28330 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1a0e:	2f7c 0000 ff00 	move.l #65280,80(sp)
    1a14:	0050 
    1a16:	7002           	moveq #2,d0
    1a18:	2f40 004c      	move.l d0,76(sp)
    1a1c:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    1a22:	2c40           	movea.l d0,a6
    1a24:	202f 0050      	move.l 80(sp),d0
    1a28:	222f 004c      	move.l 76(sp),d1
    1a2c:	4eae ff3a      	jsr -198(a6)
    1a30:	2f40 0048      	move.l d0,72(sp)
    1a34:	202f 0048      	move.l 72(sp),d0
    1a38:	23c0 0002 8324 	move.l d0,28324 <Bitplane1>
  if(Bitplane1 == 0) {
    1a3e:	2039 0002 8324 	move.l 28324 <Bitplane1>,d0
    1a44:	6658           	bne.s 1a9e <PrepareDisplayZoom+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1a46:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    1a4c:	2c40           	movea.l d0,a6
    1a4e:	4eae ffc4      	jsr -60(a6)
    1a52:	2f40 0044      	move.l d0,68(sp)
    1a56:	202f 0044      	move.l 68(sp),d0
    1a5a:	2f40 0040      	move.l d0,64(sp)
    1a5e:	2f7c 0000 7b1d 	move.l #31517,60(sp)
    1a64:	003c 
    1a66:	7026           	moveq #38,d0
    1a68:	2f40 0038      	move.l d0,56(sp)
    1a6c:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    1a72:	2c40           	movea.l d0,a6
    1a74:	222f 0040      	move.l 64(sp),d1
    1a78:	242f 003c      	move.l 60(sp),d2
    1a7c:	262f 0038      	move.l 56(sp),d3
    1a80:	4eae ffd0      	jsr -48(a6)
    1a84:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    1a88:	7001           	moveq #1,d0
    1a8a:	2f40 0030      	move.l d0,48(sp)
    1a8e:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    1a94:	2c40           	movea.l d0,a6
    1a96:	222f 0030      	move.l 48(sp),d1
    1a9a:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    1a9e:	2039 0002 8324 	move.l 28324 <Bitplane1>,d0
    1aa4:	23c0 0002 8334 	move.l d0,28334 <DrawBuffer>
  DrawCopper = Copperlist1;
    1aaa:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    1ab0:	23c0 0002 833c 	move.l d0,2833c <DrawCopper>
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1ab6:	2f7c 0000 ff00 	move.l #65280,44(sp)
    1abc:	002c 
    1abe:	7002           	moveq #2,d0
    1ac0:	2f40 0028      	move.l d0,40(sp)
    1ac4:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    1aca:	2c40           	movea.l d0,a6
    1acc:	202f 002c      	move.l 44(sp),d0
    1ad0:	222f 0028      	move.l 40(sp),d1
    1ad4:	4eae ff3a      	jsr -198(a6)
    1ad8:	2f40 0024      	move.l d0,36(sp)
    1adc:	202f 0024      	move.l 36(sp),d0
    1ae0:	23c0 0002 8328 	move.l d0,28328 <Bitplane2>
  if(Bitplane2 == 0) {
    1ae6:	2039 0002 8328 	move.l 28328 <Bitplane2>,d0
    1aec:	6658           	bne.s 1b46 <PrepareDisplayZoom+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1aee:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    1af4:	2c40           	movea.l d0,a6
    1af6:	4eae ffc4      	jsr -60(a6)
    1afa:	2f40 0020      	move.l d0,32(sp)
    1afe:	202f 0020      	move.l 32(sp),d0
    1b02:	2f40 001c      	move.l d0,28(sp)
    1b06:	2f7c 0000 7b44 	move.l #31556,24(sp)
    1b0c:	0018 
    1b0e:	7026           	moveq #38,d0
    1b10:	2f40 0014      	move.l d0,20(sp)
    1b14:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    1b1a:	2c40           	movea.l d0,a6
    1b1c:	222f 001c      	move.l 28(sp),d1
    1b20:	242f 0018      	move.l 24(sp),d2
    1b24:	262f 0014      	move.l 20(sp),d3
    1b28:	4eae ffd0      	jsr -48(a6)
    1b2c:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    1b30:	7001           	moveq #1,d0
    1b32:	2f40 000c      	move.l d0,12(sp)
    1b36:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    1b3c:	2c40           	movea.l d0,a6
    1b3e:	222f 000c      	move.l 12(sp),d1
    1b42:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    1b46:	2039 0002 8328 	move.l 28328 <Bitplane2>,d0
    1b4c:	23c0 0002 8338 	move.l d0,28338 <ViewBuffer>
  ViewCopper = Copperlist2; 
    1b52:	2039 0002 8330 	move.l 28330 <Copperlist2>,d0
    1b58:	23c0 0002 8340 	move.l d0,28340 <ViewCopper>
  return 0;
    1b5e:	7000           	moveq #0,d0
}
    1b60:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1b64:	4fef 0048      	lea 72(sp),sp
    1b68:	4e75           	rts

00001b6a <Init_Blit>:

void Init_Blit() {
  hw->bltafwm = 0xffff;
    1b6a:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1b70:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1b76:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1b7c:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1b82:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1b88:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1b8e:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1b94:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1b9a:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1ba0:	317c 002c 0066 	move.w #44,102(a0)
}
    1ba6:	4e75           	rts

00001ba8 <Init_Blit2>:


void Init_Blit2() {
  hw->bltafwm = 0xffff;
    1ba8:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1bae:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1bb4:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1bba:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = 36;
    1bc0:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1bc6:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = 76;
    1bcc:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1bd2:	317c 004c 0062 	move.w #76,98(a0)
  hw->bltdmod = ZMLINESIZE2 - 4;
    1bd8:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1bde:	317c 0028 0066 	move.w #40,102(a0)
}
    1be4:	4e75           	rts

00001be6 <Init_ZoomBlit>:

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
    1be6:	4fef fff4      	lea -12(sp),sp
    1bea:	206f 0010      	movea.l 16(sp),a0
    1bee:	222f 0014      	move.l 20(sp),d1
    1bf2:	202f 0018      	move.l 24(sp),d0
    1bf6:	3048           	movea.w a0,a0
    1bf8:	3f48 0004      	move.w a0,4(sp)
    1bfc:	3201           	move.w d1,d1
    1bfe:	3f41 0002      	move.w d1,2(sp)
    1c02:	3000           	move.w d0,d0
    1c04:	3e80           	move.w d0,(sp)
  ZoomBlit_Increment4SrcA = 0;
    1c06:	4279 0002 8378 	clr.w 28378 <ZoomBlit_Increment4SrcA>

  UWORD colnr = nextzoom - startofword - 1;                                                                          
    1c0c:	302f 0002      	move.w 2(sp),d0
    1c10:	906f 0004      	sub.w 4(sp),d0
    1c14:	3200           	move.w d0,d1
    1c16:	5341           	subq.w #1,d1
    1c18:	3f41 0008      	move.w d1,8(sp)
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
    1c1c:	3017           	move.w (sp),d0
    1c1e:	720c           	moveq #12,d1
    1c20:	e368           	lsl.w d1,d0
    1c22:	3f40 0006      	move.w d0,6(sp)
  UWORD shifta;
  if( shiftright == 0) {
    1c26:	4a57           	tst.w (sp)
    1c28:	6610           	bne.s 1c3a <Init_ZoomBlit+0x54>
    ZoomBlit_Increment4SrcA = 1;
    1c2a:	33fc 0001 0002 	move.w #1,28378 <ZoomBlit_Increment4SrcA>
    1c30:	8378 
    shifta = 15 << 12;
    1c32:	3f7c f000 000a 	move.w #-4096,10(sp)
    1c38:	600c           	bra.s 1c46 <Init_ZoomBlit+0x60>
  } else {
    shifta = (shiftright - 1) << 12;
    1c3a:	3017           	move.w (sp),d0
    1c3c:	5340           	subq.w #1,d0
    1c3e:	720c           	moveq #12,d1
    1c40:	e368           	lsl.w d1,d0
    1c42:	3f40 000a      	move.w d0,10(sp)
  }
  WaitBlt(); 
    1c46:	4eba e46c      	jsr b4 <WaitBlt>(pc)
  hw->bltcon1 = shiftb; 
    1c4a:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1c50:	316f 0006 0042 	move.w 6(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1c56:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1c5c:	302f 000a      	move.w 10(sp),d0
    1c60:	0640 0de4      	addi.w #3556,d0
    1c64:	3140 0040      	move.w d0,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1c68:	7000           	moveq #0,d0
    1c6a:	302f 0008      	move.w 8(sp),d0
    1c6e:	7210           	moveq #16,d1
    1c70:	9280           	sub.l d0,d1
    1c72:	7000           	moveq #0,d0
    1c74:	4640           	not.w d0
    1c76:	e3a8           	lsl.l d1,d0
    1c78:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1c7e:	2000           	move.l d0,d0
    1c80:	3140 0070      	move.w d0,112(a0)
}
    1c84:	4fef 000c      	lea 12(sp),sp
    1c88:	4e75           	rts

00001c8a <Init_Copy>:

void Init_Copy( WORD shift) {
    1c8a:	598f           	subq.l #4,sp
    1c8c:	202f 0008      	move.l 8(sp),d0
    1c90:	3000           	move.w d0,d0
    1c92:	3e80           	move.w d0,(sp)
  UWORD shiftright = shift << 12;
    1c94:	3017           	move.w (sp),d0
    1c96:	720c           	moveq #12,d1
    1c98:	e368           	lsl.w d1,d0
    1c9a:	3f40 0002      	move.w d0,2(sp)
  WaitBlt();
    1c9e:	4eba e414      	jsr b4 <WaitBlt>(pc)
  hw->bltcon0 = 0x9f0 + shiftright;
    1ca2:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1ca8:	302f 0002      	move.w 2(sp),d0
    1cac:	0640 09f0      	addi.w #2544,d0
    1cb0:	3140 0040      	move.w d0,64(a0)
  hw->bltcon1 = 0;
    1cb4:	2079 0002 8344 	movea.l 28344 <hw>,a0
    1cba:	317c 0000 0042 	move.w #0,66(a0)
}
    1cc0:	588f           	addq.l #4,sp
    1cc2:	4e75           	rts

00001cc4 <Zoom_ZoomIntoPicture>:

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    1cc4:	4fef ffcc      	lea -52(sp),sp
    1cc8:	222f 0040      	move.l 64(sp),d1
    1ccc:	202f 0044      	move.l 68(sp),d0
    1cd0:	3201           	move.w d1,d1
    1cd2:	3f41 0002      	move.w d1,2(sp)
    1cd6:	3000           	move.w d0,d0
    1cd8:	3e80           	move.w d0,(sp)
  
  WaitBlt();  
    1cda:	4eba e3d8      	jsr b4 <WaitBlt>(pc)
  Init_Blit();
    1cde:	4eba fe8a      	jsr 1b6a <Init_Blit>(pc)
  WORD shiftright = 9;
    1ce2:	3f7c 0009 0032 	move.w #9,50(sp)
  UWORD shifthoriz = 7;
    1ce8:	3f7c 0007 0030 	move.w #7,48(sp)
  UWORD startofword = 21*16;
    1cee:	3f7c 0150 002e 	move.w #336,46(sp)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1cf4:	322f 0002      	move.w 2(sp),d1
    1cf8:	3001           	move.w d1,d0
    1cfa:	d040           	add.w d0,d0
    1cfc:	d040           	add.w d0,d0
    1cfe:	d041           	add.w d1,d0
    1d00:	d040           	add.w d0,d0
    1d02:	0640 014c      	addi.w #332,d0
    1d06:	3f40 002c      	move.w d0,44(sp)
    1d0a:	601a           	bra.s 1d26 <Zoom_ZoomIntoPicture+0x62>
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    1d0c:	302f 002c      	move.w 44(sp),d0
    1d10:	906f 0002      	sub.w 2(sp),d0
    1d14:	0640 ffed      	addi.w #-19,d0
    1d18:	3f40 002c      	move.w d0,44(sp)
    shiftright--;
    1d1c:	302f 0032      	move.w 50(sp),d0
    1d20:	5340           	subq.w #1,d0
    1d22:	3f40 0032      	move.w d0,50(sp)
  while( nextzoom > 22 * 16) {
    1d26:	0c6f 0160 002c 	cmpi.w #352,44(sp)
    1d2c:	6ede           	bgt.s 1d0c <Zoom_ZoomIntoPicture+0x48>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
    1d2e:	426f 002a      	clr.w 42(sp)
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    1d32:	322f 0002      	move.w 2(sp),d1
    1d36:	3001           	move.w d1,d0
    1d38:	d040           	add.w d0,d0
    1d3a:	d040           	add.w d0,d0
    1d3c:	d041           	add.w d1,d0
    1d3e:	4440           	neg.w d0
    1d40:	0640 0012      	addi.w #18,d0
    1d44:	3f40 0028      	move.w d0,40(sp)
    1d48:	601c           	bra.s 1d66 <Zoom_ZoomIntoPicture+0xa2>
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    1d4a:	302f 0028      	move.w 40(sp),d0
    1d4e:	d06f 0002      	add.w 2(sp),d0
    1d52:	0640 0013      	addi.w #19,d0
    1d56:	3f40 0028      	move.w d0,40(sp)
      shifthoriz--;
    1d5a:	302f 0030      	move.w 48(sp),d0
    1d5e:	3200           	move.w d0,d1
    1d60:	5341           	subq.w #1,d1
    1d62:	3f41 0030      	move.w d1,48(sp)
  while( ZoomHorizontalStart < 0) {
    1d66:	4a6f 0028      	tst.w 40(sp)
    1d6a:	6dde           	blt.s 1d4a <Zoom_ZoomIntoPicture+0x86>
  } 

  for(int i=0;i<22;i++) {
    1d6c:	42af 0024      	clr.l 36(sp)
    1d70:	6000 02cc      	bra.w 203e <Zoom_ZoomIntoPicture+0x37a>

    ZoomHorizontal = ZoomHorizontalStart;
    1d74:	33ef 0028 0002 	move.w 40(sp),28394 <ZoomHorizontal>
    1d7a:	8394 

    WORD linesleft = 272;
    1d7c:	3f7c 0110 0022 	move.w #272,34(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1d82:	7000           	moveq #0,d0
    1d84:	302f 0030      	move.w 48(sp),d0
    1d88:	7200           	moveq #0,d1
    1d8a:	3217           	move.w (sp),d1
    1d8c:	2f01           	move.l d1,-(sp)
    1d8e:	2f00           	move.l d0,-(sp)
    1d90:	4eb9 0000 72e0 	jsr 72e0 <__mulsi3>
    1d96:	508f           	addq.l #8,sp
    1d98:	2200           	move.l d0,d1
    1d9a:	2001           	move.l d1,d0
    1d9c:	d080           	add.l d0,d0
    1d9e:	d081           	add.l d1,d0
    1da0:	e788           	lsl.l #3,d0
    1da2:	2200           	move.l d0,d1
    1da4:	202f 0024      	move.l 36(sp),d0
    1da8:	9280           	sub.l d0,d1
    1daa:	2001           	move.l d1,d0
    1dac:	0680 8000 0016 	addi.l #-2147483626,d0
    1db2:	d080           	add.l d0,d0
    1db4:	222f 0038      	move.l 56(sp),d1
    1db8:	d280           	add.l d0,d1
    1dba:	2f41 001e      	move.l d1,30(sp)
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1dbe:	202f 0024      	move.l 36(sp),d0
    1dc2:	7216           	moveq #22,d1
    1dc4:	9280           	sub.l d0,d1
    1dc6:	2001           	move.l d1,d0
    1dc8:	d081           	add.l d1,d0
    1dca:	222f 003c      	move.l 60(sp),d1
    1dce:	d280           	add.l d0,d1
    1dd0:	2f41 001a      	move.l d1,26(sp)
    
    UWORD onestep = ZMLINESIZE/2*planes;
    1dd4:	3217           	move.w (sp),d1
    1dd6:	3001           	move.w d1,d0
    1dd8:	d040           	add.w d0,d0
    1dda:	d041           	add.w d1,d0
    1ddc:	e748           	lsl.w #3,d0
    1dde:	3f40 0018      	move.w d0,24(sp)
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1de2:	7000           	moveq #0,d0
    1de4:	302f 002e      	move.w 46(sp),d0
    1de8:	306f 002c      	movea.w 44(sp),a0
    1dec:	b1c0           	cmpa.l d0,a0
    1dee:	6e00 0106      	bgt.w 1ef6 <Zoom_ZoomIntoPicture+0x232>
      Init_Copy( shiftright);
    1df2:	306f 0032      	movea.w 50(sp),a0
    1df6:	2f08           	move.l a0,-(sp)
    1df8:	4eba fe90      	jsr 1c8a <Init_Copy>(pc)
    1dfc:	588f           	addq.l #4,sp
    1dfe:	6000 00ea      	bra.w 1eea <Zoom_ZoomIntoPicture+0x226>
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1e02:	3039 0002 8394 	move.w 28394 <ZoomHorizontal>,d0
    1e08:	b06f 0022      	cmp.w 34(sp),d0
    1e0c:	6c12           	bge.s 1e20 <Zoom_ZoomIntoPicture+0x15c>
          linesleft -= ZoomHorizontal;
    1e0e:	322f 0022      	move.w 34(sp),d1
    1e12:	3039 0002 8394 	move.w 28394 <ZoomHorizontal>,d0
    1e18:	9240           	sub.w d0,d1
    1e1a:	3f41 0022      	move.w d1,34(sp)
    1e1e:	600c           	bra.s 1e2c <Zoom_ZoomIntoPicture+0x168>
        } else {
          ZoomHorizontal = linesleft;
    1e20:	33ef 0022 0002 	move.w 34(sp),28394 <ZoomHorizontal>
    1e26:	8394 
          linesleft = 0;
    1e28:	426f 0022      	clr.w 34(sp)
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
    1e2c:	3039 0002 8394 	move.w 28394 <ZoomHorizontal>,d0
    1e32:	322f 0018      	move.w 24(sp),d1
    1e36:	c3c0           	muls.w d0,d1
    1e38:	3f41 000c      	move.w d1,12(sp)
        //Add aditional line
        if( linesleft>0) {
    1e3c:	4a6f 0022      	tst.w 34(sp)
    1e40:	6f4c           	ble.s 1e8e <Zoom_ZoomIntoPicture+0x1ca>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1e42:	7200           	moveq #0,d1
    1e44:	322f 000c      	move.w 12(sp),d1
    1e48:	7000           	moveq #0,d0
    1e4a:	302f 002a      	move.w 42(sp),d0
    1e4e:	d081           	add.l d1,d0
    1e50:	d080           	add.l d0,d0
    1e52:	222f 001e      	move.l 30(sp),d1
    1e56:	d280           	add.l d0,d1
    1e58:	2f41 0008      	move.l d1,8(sp)
          UWORD *tmpdest = pos4dest +  size4blit;
    1e5c:	7000           	moveq #0,d0
    1e5e:	302f 000c      	move.w 12(sp),d0
    1e62:	d080           	add.l d0,d0
    1e64:	222f 001a      	move.l 26(sp),d1
    1e68:	d280           	add.l d0,d1
    1e6a:	2f41 0004      	move.l d1,4(sp)
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
    1e6e:	7000           	moveq #0,d0
    1e70:	3017           	move.w (sp),d0
    1e72:	2f00           	move.l d0,-(sp)
    1e74:	2f2f 0008      	move.l 8(sp),-(sp)
    1e78:	2f2f 0010      	move.l 16(sp),-(sp)
    1e7c:	4eba f314      	jsr 1192 <Zoom_CopyWord>(pc)
    1e80:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1e84:	302f 0022      	move.w 34(sp),d0
    1e88:	5340           	subq.w #1,d0
    1e8a:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1e8e:	3039 0002 8394 	move.w 28394 <ZoomHorizontal>,d0
    1e94:	c1d7           	muls.w (sp),d0
    1e96:	7200           	moveq #0,d1
    1e98:	3200           	move.w d0,d1
    1e9a:	7000           	moveq #0,d0
    1e9c:	302f 002a      	move.w 42(sp),d0
    1ea0:	d080           	add.l d0,d0
    1ea2:	d0af 001e      	add.l 30(sp),d0
    1ea6:	2f01           	move.l d1,-(sp)
    1ea8:	2f2f 001e      	move.l 30(sp),-(sp)
    1eac:	2f00           	move.l d0,-(sp)
    1eae:	4eba f2e2      	jsr 1192 <Zoom_CopyWord>(pc)
    1eb2:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1eb6:	7000           	moveq #0,d0
    1eb8:	302f 000c      	move.w 12(sp),d0
    1ebc:	d080           	add.l d0,d0
    1ebe:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep; 
    1ec2:	7200           	moveq #0,d1
    1ec4:	322f 000c      	move.w 12(sp),d1
    1ec8:	7000           	moveq #0,d0
    1eca:	302f 0018      	move.w 24(sp),d0
    1ece:	d081           	add.l d1,d0
    1ed0:	d080           	add.l d0,d0
    1ed2:	d1af 001a      	add.l d0,26(sp)
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1ed6:	302f 0002      	move.w 2(sp),d0
    1eda:	d040           	add.w d0,d0
    1edc:	906f 0002      	sub.w 2(sp),d0
    1ee0:	0640 0012      	addi.w #18,d0
    1ee4:	33c0 0002 8394 	move.w d0,28394 <ZoomHorizontal>
      while(linesleft > 0) {
    1eea:	4a6f 0022      	tst.w 34(sp)
    1eee:	6e00 ff12      	bgt.w 1e02 <Zoom_ZoomIntoPicture+0x13e>
    1ef2:	6000 0140      	bra.w 2034 <Zoom_ZoomIntoPicture+0x370>
      }
    } else {  
      Init_ZoomBlit( startofword, nextzoom, shiftright);   
    1ef6:	326f 0032      	movea.w 50(sp),a1
    1efa:	306f 002c      	movea.w 44(sp),a0
    1efe:	7000           	moveq #0,d0
    1f00:	302f 002e      	move.w 46(sp),d0
    1f04:	2f09           	move.l a1,-(sp)
    1f06:	2f08           	move.l a0,-(sp)
    1f08:	2f00           	move.l d0,-(sp)
    1f0a:	4eba fcda      	jsr 1be6 <Init_ZoomBlit>(pc)
    1f0e:	4fef 000c      	lea 12(sp),sp
      nextzoom -= (19 + zoomnr);
    1f12:	302f 002c      	move.w 44(sp),d0
    1f16:	906f 0002      	sub.w 2(sp),d0
    1f1a:	0640 ffed      	addi.w #-19,d0
    1f1e:	3f40 002c      	move.w d0,44(sp)
    1f22:	6000 00ea      	bra.w 200e <Zoom_ZoomIntoPicture+0x34a>
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1f26:	3039 0002 8394 	move.w 28394 <ZoomHorizontal>,d0
    1f2c:	b06f 0022      	cmp.w 34(sp),d0
    1f30:	6c12           	bge.s 1f44 <Zoom_ZoomIntoPicture+0x280>
          linesleft -= ZoomHorizontal;
    1f32:	322f 0022      	move.w 34(sp),d1
    1f36:	3039 0002 8394 	move.w 28394 <ZoomHorizontal>,d0
    1f3c:	9240           	sub.w d0,d1
    1f3e:	3f41 0022      	move.w d1,34(sp)
    1f42:	600c           	bra.s 1f50 <Zoom_ZoomIntoPicture+0x28c>
        } else {
          ZoomHorizontal = linesleft;
    1f44:	33ef 0022 0002 	move.w 34(sp),28394 <ZoomHorizontal>
    1f4a:	8394 
          linesleft = 0;
    1f4c:	426f 0022      	clr.w 34(sp)
        }
        UWORD size4blit = ZoomHorizontal*onestep;
    1f50:	3039 0002 8394 	move.w 28394 <ZoomHorizontal>,d0
    1f56:	322f 0018      	move.w 24(sp),d1
    1f5a:	c3c0           	muls.w d0,d1
    1f5c:	3f41 0016      	move.w d1,22(sp)
        //Add aditional line
        if( linesleft>0) {
    1f60:	4a6f 0022      	tst.w 34(sp)
    1f64:	6f4c           	ble.s 1fb2 <Zoom_ZoomIntoPicture+0x2ee>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1f66:	7200           	moveq #0,d1
    1f68:	322f 0016      	move.w 22(sp),d1
    1f6c:	7000           	moveq #0,d0
    1f6e:	302f 002a      	move.w 42(sp),d0
    1f72:	d081           	add.l d1,d0
    1f74:	d080           	add.l d0,d0
    1f76:	222f 001e      	move.l 30(sp),d1
    1f7a:	d280           	add.l d0,d1
    1f7c:	2f41 0012      	move.l d1,18(sp)
          UWORD *tmpdest = pos4dest + size4blit;
    1f80:	7000           	moveq #0,d0
    1f82:	302f 0016      	move.w 22(sp),d0
    1f86:	d080           	add.l d0,d0
    1f88:	222f 001a      	move.l 26(sp),d1
    1f8c:	d280           	add.l d0,d1
    1f8e:	2f41 000e      	move.l d1,14(sp)
          
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
    1f92:	7000           	moveq #0,d0
    1f94:	3017           	move.w (sp),d0
    1f96:	2f00           	move.l d0,-(sp)
    1f98:	2f2f 0012      	move.l 18(sp),-(sp)
    1f9c:	2f2f 001a      	move.l 26(sp),-(sp)
    1fa0:	4eba f22e      	jsr 11d0 <Zoom_ZoomBlit>(pc)
    1fa4:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1fa8:	302f 0022      	move.w 34(sp),d0
    1fac:	5340           	subq.w #1,d0
    1fae:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1fb2:	3039 0002 8394 	move.w 28394 <ZoomHorizontal>,d0
    1fb8:	c1d7           	muls.w (sp),d0
    1fba:	7200           	moveq #0,d1
    1fbc:	3200           	move.w d0,d1
    1fbe:	7000           	moveq #0,d0
    1fc0:	302f 002a      	move.w 42(sp),d0
    1fc4:	d080           	add.l d0,d0
    1fc6:	d0af 001e      	add.l 30(sp),d0
    1fca:	2f01           	move.l d1,-(sp)
    1fcc:	2f2f 001e      	move.l 30(sp),-(sp)
    1fd0:	2f00           	move.l d0,-(sp)
    1fd2:	4eba f1fc      	jsr 11d0 <Zoom_ZoomBlit>(pc)
    1fd6:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1fda:	7000           	moveq #0,d0
    1fdc:	302f 0016      	move.w 22(sp),d0
    1fe0:	d080           	add.l d0,d0
    1fe2:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep;   
    1fe6:	7200           	moveq #0,d1
    1fe8:	322f 0016      	move.w 22(sp),d1
    1fec:	7000           	moveq #0,d0
    1fee:	302f 0018      	move.w 24(sp),d0
    1ff2:	d081           	add.l d1,d0
    1ff4:	d080           	add.l d0,d0
    1ff6:	d1af 001a      	add.l d0,26(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1ffa:	302f 0002      	move.w 2(sp),d0
    1ffe:	d040           	add.w d0,d0
    2000:	906f 0002      	sub.w 2(sp),d0
    2004:	0640 0012      	addi.w #18,d0
    2008:	33c0 0002 8394 	move.w d0,28394 <ZoomHorizontal>
      while( linesleft > 0) {
    200e:	4a6f 0022      	tst.w 34(sp)
    2012:	6e00 ff12      	bgt.w 1f26 <Zoom_ZoomIntoPicture+0x262>
      }
      shiftright--;  
    2016:	302f 0032      	move.w 50(sp),d0
    201a:	5340           	subq.w #1,d0
    201c:	3f40 0032      	move.w d0,50(sp)
      if(shiftright < 0) {
    2020:	6a12           	bpl.s 2034 <Zoom_ZoomIntoPicture+0x370>
        shiftright += 16;
    2022:	302f 0032      	move.w 50(sp),d0
    2026:	0640 0010      	addi.w #16,d0
    202a:	3f40 0032      	move.w d0,50(sp)
        shifttoleft = 1;
    202e:	3f7c 0001 002a 	move.w #1,42(sp)
      }
    }
    startofword -= 16;
    2034:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    203a:	52af 0024      	addq.l #1,36(sp)
    203e:	7015           	moveq #21,d0
    2040:	b0af 0024      	cmp.l 36(sp),d0
    2044:	6c00 fd2e      	bge.w 1d74 <Zoom_ZoomIntoPicture+0xb0>
  }
}
    2048:	4fef 0034      	lea 52(sp),sp
    204c:	4e75           	rts

0000204e <Zoom_SetBplPointers>:

void Zoom_SetBplPointers( ULONG *buffer, ULONG *copper) {
    204e:	4fef fff0      	lea -16(sp),sp
  ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
    2052:	3039 0002 8390 	move.w 28390 <Zoom_LevelOf102Zoom>,d0
    2058:	e248           	lsr.w #1,d0
    205a:	3000           	move.w d0,d0
    205c:	0280 0000 ffff 	andi.l #65535,d0
    2062:	7208           	moveq #8,d1
    2064:	9280           	sub.l d0,d1
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;
    2066:	2001           	move.l d1,d0
    2068:	e988           	lsl.l #4,d0
    206a:	9081           	sub.l d1,d0
    206c:	d080           	add.l d0,d0
    206e:	d080           	add.l d0,d0
  ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
    2070:	5280           	addq.l #1,d0
    2072:	d080           	add.l d0,d0
    2074:	d080           	add.l d0,d0
    2076:	d0af 0014      	add.l 20(sp),d0
    207a:	2f40 000c      	move.l d0,12(sp)
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
    207e:	7072           	moveq #114,d0
    2080:	d0af 0018      	add.l 24(sp),d0
    2084:	2f40 0008      	move.l d0,8(sp)
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    2088:	42af 0004      	clr.l 4(sp)
    208c:	6030           	bra.s 20be <Zoom_SetBplPointers+0x70>
    UWORD highword = (ULONG)plane2set >> 16;
    208e:	202f 000c      	move.l 12(sp),d0
    2092:	4240           	clr.w d0
    2094:	4840           	swap d0
    2096:	3f40 0002      	move.w d0,2(sp)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    209a:	3eaf 000e      	move.w 14(sp),(sp)
    *posofcopper = highword;
    209e:	206f 0008      	movea.l 8(sp),a0
    20a2:	30af 0002      	move.w 2(sp),(a0)
    posofcopper += 2;
    20a6:	58af 0008      	addq.l #4,8(sp)
    *posofcopper = lowword;
    20aa:	206f 0008      	movea.l 8(sp),a0
    20ae:	3097           	move.w (sp),(a0)
    posofcopper += 2;
    20b0:	58af 0008      	addq.l #4,8(sp)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    20b4:	7030           	moveq #48,d0
    20b6:	d1af 000c      	add.l d0,12(sp)
  for(int i=0;i<ZMBPLDEPTH;i++) {
    20ba:	52af 0004      	addq.l #1,4(sp)
    20be:	7004           	moveq #4,d0
    20c0:	b0af 0004      	cmp.l 4(sp),d0
    20c4:	6cc8           	bge.s 208e <Zoom_SetBplPointers+0x40>
  }
  
}
    20c6:	4fef 0010      	lea 16(sp),sp
    20ca:	4e75           	rts

000020cc <Zoom_SwapBuffers>:

void Zoom_SwapBuffers() {
    20cc:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawBuffer;
    20ce:	2039 0002 8334 	move.l 28334 <DrawBuffer>,d0
    20d4:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
    20d6:	2039 0002 8338 	move.l 28338 <ViewBuffer>,d0
    20dc:	23c0 0002 8334 	move.l d0,28334 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
    20e2:	2017           	move.l (sp),d0
    20e4:	23c0 0002 8338 	move.l d0,28338 <ViewBuffer>
}
    20ea:	588f           	addq.l #4,sp
    20ec:	4e75           	rts

000020ee <Test_Zoom2>:
#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
    20ee:	4fef ff00      	lea -256(sp),sp
    20f2:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  //Test Zoomlevel 1
  volatile ULONG *srcsmall = AllocMem( 80, MEMF_CHIP);
    20f6:	7050           	moveq #80,d0
    20f8:	2f40 00f0      	move.l d0,240(sp)
    20fc:	7002           	moveq #2,d0
    20fe:	2f40 00ec      	move.l d0,236(sp)
    2102:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    2108:	2c40           	movea.l d0,a6
    210a:	202f 00f0      	move.l 240(sp),d0
    210e:	222f 00ec      	move.l 236(sp),d1
    2112:	4eae ff3a      	jsr -198(a6)
    2116:	2f40 00e8      	move.l d0,232(sp)
    211a:	202f 00e8      	move.l 232(sp),d0
    211e:	2f40 00e4      	move.l d0,228(sp)
  if( srcsmall == 0) {
    2122:	6646           	bne.s 216a <Test_Zoom2+0x7c>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcsmall\n", 42);
    2124:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    212a:	2c40           	movea.l d0,a6
    212c:	4eae ffc4      	jsr -60(a6)
    2130:	2f40 001c      	move.l d0,28(sp)
    2134:	202f 001c      	move.l 28(sp),d0
    2138:	2f40 0018      	move.l d0,24(sp)
    213c:	2f7c 0001 7aa1 	move.l #96929,20(sp)
    2142:	0014 
    2144:	702a           	moveq #42,d0
    2146:	2f40 0010      	move.l d0,16(sp)
    214a:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2150:	2c40           	movea.l d0,a6
    2152:	222f 0018      	move.l 24(sp),d1
    2156:	242f 0014      	move.l 20(sp),d2
    215a:	262f 0010      	move.l 16(sp),d3
    215e:	4eae ffd0      	jsr -48(a6)
    2162:	2f40 000c      	move.l d0,12(sp)
    2166:	6000 0560      	bra.w 26c8 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong(srcsmall, 0xaaaaaaaa, 2, 10, 0);
    216a:	42a7           	clr.l -(sp)
    216c:	4878 000a      	pea a <_start+0xa>
    2170:	4878 0002      	pea 2 <_start+0x2>
    2174:	2f3c aaaa aaaa 	move.l #-1431655766,-(sp)
    217a:	2f2f 00f4      	move.l 244(sp),-(sp)
    217e:	4eba e0f0      	jsr 270 <Utils_FillLong>(pc)
    2182:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *srcbig = AllocMem( 160, MEMF_CHIP);
    2186:	2f7c 0000 00a0 	move.l #160,224(sp)
    218c:	00e0 
    218e:	7002           	moveq #2,d0
    2190:	2f40 00dc      	move.l d0,220(sp)
    2194:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    219a:	2c40           	movea.l d0,a6
    219c:	202f 00e0      	move.l 224(sp),d0
    21a0:	222f 00dc      	move.l 220(sp),d1
    21a4:	4eae ff3a      	jsr -198(a6)
    21a8:	2f40 00d8      	move.l d0,216(sp)
    21ac:	202f 00d8      	move.l 216(sp),d0
    21b0:	2f40 00d4      	move.l d0,212(sp)
    if( srcbig == 0) {
    21b4:	6646           	bne.s 21fc <Test_Zoom2+0x10e>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcbig\n", 40);
    21b6:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    21bc:	2c40           	movea.l d0,a6
    21be:	4eae ffc4      	jsr -60(a6)
    21c2:	2f40 0030      	move.l d0,48(sp)
    21c6:	202f 0030      	move.l 48(sp),d0
    21ca:	2f40 002c      	move.l d0,44(sp)
    21ce:	2f7c 0001 7acc 	move.l #96972,40(sp)
    21d4:	0028 
    21d6:	7028           	moveq #40,d0
    21d8:	2f40 0024      	move.l d0,36(sp)
    21dc:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    21e2:	2c40           	movea.l d0,a6
    21e4:	222f 002c      	move.l 44(sp),d1
    21e8:	242f 0028      	move.l 40(sp),d2
    21ec:	262f 0024      	move.l 36(sp),d3
    21f0:	4eae ffd0      	jsr -48(a6)
    21f4:	2f40 0020      	move.l d0,32(sp)
    21f8:	6000 04ce      	bra.w 26c8 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong( srcbig, 0x55555555, 2, 20, 0);
    21fc:	42a7           	clr.l -(sp)
    21fe:	4878 0014      	pea 14 <_start+0x14>
    2202:	4878 0002      	pea 2 <_start+0x2>
    2206:	2f3c 5555 5555 	move.l #1431655765,-(sp)
    220c:	2f2f 00e4      	move.l 228(sp),-(sp)
    2210:	4eba e05e      	jsr 270 <Utils_FillLong>(pc)
    2214:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *target = AllocMem( 168, MEMF_CHIP);
    2218:	2f7c 0000 00a8 	move.l #168,208(sp)
    221e:	00d0 
    2220:	7002           	moveq #2,d0
    2222:	2f40 00cc      	move.l d0,204(sp)
    2226:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    222c:	2c40           	movea.l d0,a6
    222e:	202f 00d0      	move.l 208(sp),d0
    2232:	222f 00cc      	move.l 204(sp),d1
    2236:	4eae ff3a      	jsr -198(a6)
    223a:	2f40 00c8      	move.l d0,200(sp)
    223e:	202f 00c8      	move.l 200(sp),d0
    2242:	2f40 00c4      	move.l d0,196(sp)
  if( target == 0) {
    2246:	6646           	bne.s 228e <Test_Zoom2+0x1a0>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
    2248:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    224e:	2c40           	movea.l d0,a6
    2250:	4eae ffc4      	jsr -60(a6)
    2254:	2f40 0044      	move.l d0,68(sp)
    2258:	202f 0044      	move.l 68(sp),d0
    225c:	2f40 0040      	move.l d0,64(sp)
    2260:	2f7c 0001 7af5 	move.l #97013,60(sp)
    2266:	003c 
    2268:	7028           	moveq #40,d0
    226a:	2f40 0038      	move.l d0,56(sp)
    226e:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2274:	2c40           	movea.l d0,a6
    2276:	222f 0040      	move.l 64(sp),d1
    227a:	242f 003c      	move.l 60(sp),d2
    227e:	262f 0038      	move.l 56(sp),d3
    2282:	4eae ffd0      	jsr -48(a6)
    2286:	2f40 0034      	move.l d0,52(sp)
    228a:	6000 043c      	bra.w 26c8 <Test_Zoom2+0x5da>
    return;
  }
  WaitBlt();
    228e:	4eba de24      	jsr b4 <WaitBlt>(pc)
  hw->bltafwm = 0xffff;
    2292:	2079 0002 8344 	movea.l 28344 <hw>,a0
    2298:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    229e:	2079 0002 8344 	movea.l 28344 <hw>,a0
    22a4:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltdmod = 38;
    22aa:	2079 0002 8344 	movea.l 28344 <hw>,a0
    22b0:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcon1 = 1 << 12; //Shift src big
    22b6:	2079 0002 8344 	movea.l 28344 <hw>,a0
    22bc:	317c 1000 0042 	move.w #4096,66(a0)
  hw->bltcon0 = 0xde4; //Chanell settings and Shift src small
    22c2:	2079 0002 8344 	movea.l 28344 <hw>,a0
    22c8:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltcdat = 0x8000; //Show channel small if 1 else channel big
    22ce:	2079 0002 8344 	movea.l 28344 <hw>,a0
    22d4:	317c 8000 0070 	move.w #-32768,112(a0)
  //srcbig-shift   0010 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sbbb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    22da:	4878 0001      	pea 1 <_start+0x1>
    22de:	4878 004e      	pea 4e <_start+0x4e>
    22e2:	4878 0026      	pea 26 <_start+0x26>
    22e6:	4878 0002      	pea 2 <_start+0x2>
    22ea:	2f2f 00d4      	move.l 212(sp),-(sp)
    22ee:	2f2f 00e8      	move.l 232(sp),-(sp)
    22f2:	2f2f 00fc      	move.l 252(sp),-(sp)
    22f6:	4eba ef3c      	jsr 1234 <Zoom_ZoomBlit2>(pc)
    22fa:	4fef 001c      	lea 28(sp),sp
  UWORD *tmp = (UWORD *)target;
    22fe:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2304:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    230a:	2c40           	movea.l d0,a6
    230c:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2310:	42af 0104      	clr.l 260(sp)
    2314:	605c           	bra.s 2372 <Test_Zoom2+0x284>
    if( *tmp != 0xaaaa ) {
    2316:	206f 0108      	movea.l 264(sp),a0
    231a:	3010           	move.w (a0),d0
    231c:	0c40 aaaa      	cmpi.w #-21846,d0
    2320:	6746           	beq.s 2368 <Test_Zoom2+0x27a>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 1 failed\n", 40);
    2322:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2328:	2c40           	movea.l d0,a6
    232a:	4eae ffc4      	jsr -60(a6)
    232e:	2f40 0058      	move.l d0,88(sp)
    2332:	202f 0058      	move.l 88(sp),d0
    2336:	2f40 0054      	move.l d0,84(sp)
    233a:	2f7c 0001 7b1e 	move.l #97054,80(sp)
    2340:	0050 
    2342:	7028           	moveq #40,d0
    2344:	2f40 004c      	move.l d0,76(sp)
    2348:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    234e:	2c40           	movea.l d0,a6
    2350:	222f 0054      	move.l 84(sp),d1
    2354:	242f 0050      	move.l 80(sp),d2
    2358:	262f 004c      	move.l 76(sp),d3
    235c:	4eae ffd0      	jsr -48(a6)
    2360:	2f40 0048      	move.l d0,72(sp)
    2364:	6000 0362      	bra.w 26c8 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    2368:	7028           	moveq #40,d0
    236a:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    236e:	52af 0104      	addq.l #1,260(sp)
    2372:	7001           	moveq #1,d0
    2374:	b0af 0104      	cmp.l 260(sp),d0
    2378:	6c9c           	bge.s 2316 <Test_Zoom2+0x228>
  //srcbig-shift   0001 0101 0101 0101
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       ssbb bbbb bbbb bbbb
  //result:        1001 0101 0101 0101

  hw->bltcon1 = 2 << 12; //Shift src big
    237a:	2079 0002 8344 	movea.l 28344 <hw>,a0
    2380:	317c 2000 0042 	move.w #8192,66(a0)
  hw->bltcdat = 0xc000; //Show channel small if 1 else channel big
    2386:	2079 0002 8344 	movea.l 28344 <hw>,a0
    238c:	317c c000 0070 	move.w #-16384,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2392:	4878 0001      	pea 1 <_start+0x1>
    2396:	4878 004e      	pea 4e <_start+0x4e>
    239a:	4878 0026      	pea 26 <_start+0x26>
    239e:	4878 0002      	pea 2 <_start+0x2>
    23a2:	2f2f 00d4      	move.l 212(sp),-(sp)
    23a6:	2f2f 00e8      	move.l 232(sp),-(sp)
    23aa:	2f2f 00fc      	move.l 252(sp),-(sp)
    23ae:	4eba ee84      	jsr 1234 <Zoom_ZoomBlit2>(pc)
    23b2:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    23b6:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    23bc:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    23c2:	2c40           	movea.l d0,a6
    23c4:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    23c8:	42af 0100      	clr.l 256(sp)
    23cc:	605c           	bra.s 242a <Test_Zoom2+0x33c>
    if( *tmp != 0x9555 ) {
    23ce:	206f 0108      	movea.l 264(sp),a0
    23d2:	3010           	move.w (a0),d0
    23d4:	0c40 9555      	cmpi.w #-27307,d0
    23d8:	6746           	beq.s 2420 <Test_Zoom2+0x332>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 2 failed\n", 40);
    23da:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    23e0:	2c40           	movea.l d0,a6
    23e2:	4eae ffc4      	jsr -60(a6)
    23e6:	2f40 006c      	move.l d0,108(sp)
    23ea:	202f 006c      	move.l 108(sp),d0
    23ee:	2f40 0068      	move.l d0,104(sp)
    23f2:	2f7c 0001 7b47 	move.l #97095,100(sp)
    23f8:	0064 
    23fa:	7028           	moveq #40,d0
    23fc:	2f40 0060      	move.l d0,96(sp)
    2400:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2406:	2c40           	movea.l d0,a6
    2408:	222f 0068      	move.l 104(sp),d1
    240c:	242f 0064      	move.l 100(sp),d2
    2410:	262f 0060      	move.l 96(sp),d3
    2414:	4eae ffd0      	jsr -48(a6)
    2418:	2f40 005c      	move.l d0,92(sp)
    241c:	6000 02aa      	bra.w 26c8 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    2420:	7028           	moveq #40,d0
    2422:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2426:	52af 0100      	addq.l #1,256(sp)
    242a:	7001           	moveq #1,d0
    242c:	b0af 0100      	cmp.l 256(sp),d0
    2430:	6c9c           	bge.s 23ce <Test_Zoom2+0x2e0>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2432:	2079 0002 8344 	movea.l 28344 <hw>,a0
    2438:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    243e:	2079 0002 8344 	movea.l 28344 <hw>,a0
    2444:	317c e000 0070 	move.w #-8192,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    244a:	4878 0001      	pea 1 <_start+0x1>
    244e:	4878 004e      	pea 4e <_start+0x4e>
    2452:	4878 0026      	pea 26 <_start+0x26>
    2456:	4878 0002      	pea 2 <_start+0x2>
    245a:	2f2f 00d4      	move.l 212(sp),-(sp)
    245e:	2f2f 00e8      	move.l 232(sp),-(sp)
    2462:	2f2f 00fc      	move.l 252(sp),-(sp)
    2466:	4eba edcc      	jsr 1234 <Zoom_ZoomBlit2>(pc)
    246a:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    246e:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2474:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    247a:	2c40           	movea.l d0,a6
    247c:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2480:	42af 00fc      	clr.l 252(sp)
    2484:	605c           	bra.s 24e2 <Test_Zoom2+0x3f4>
    if( *tmp != 0xaaaa ) {
    2486:	206f 0108      	movea.l 264(sp),a0
    248a:	3010           	move.w (a0),d0
    248c:	0c40 aaaa      	cmpi.w #-21846,d0
    2490:	6746           	beq.s 24d8 <Test_Zoom2+0x3ea>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    2492:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2498:	2c40           	movea.l d0,a6
    249a:	4eae ffc4      	jsr -60(a6)
    249e:	2f40 0080      	move.l d0,128(sp)
    24a2:	202f 0080      	move.l 128(sp),d0
    24a6:	2f40 007c      	move.l d0,124(sp)
    24aa:	2f7c 0001 7b70 	move.l #97136,120(sp)
    24b0:	0078 
    24b2:	7028           	moveq #40,d0
    24b4:	2f40 0074      	move.l d0,116(sp)
    24b8:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    24be:	2c40           	movea.l d0,a6
    24c0:	222f 007c      	move.l 124(sp),d1
    24c4:	242f 0078      	move.l 120(sp),d2
    24c8:	262f 0074      	move.l 116(sp),d3
    24cc:	4eae ffd0      	jsr -48(a6)
    24d0:	2f40 0070      	move.l d0,112(sp)
    24d4:	6000 01f2      	bra.w 26c8 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    24d8:	7028           	moveq #40,d0
    24da:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    24de:	52af 00fc      	addq.l #1,252(sp)
    24e2:	7001           	moveq #1,d0
    24e4:	b0af 00fc      	cmp.l 252(sp),d0
    24e8:	6c9c           	bge.s 2486 <Test_Zoom2+0x398>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    24ea:	2079 0002 8344 	movea.l 28344 <hw>,a0
    24f0:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    24f6:	2079 0002 8344 	movea.l 28344 <hw>,a0
    24fc:	317c e000 0070 	move.w #-8192,112(a0)

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2502:	4878 0001      	pea 1 <_start+0x1>
    2506:	4878 004e      	pea 4e <_start+0x4e>
    250a:	4878 0026      	pea 26 <_start+0x26>
    250e:	4878 0002      	pea 2 <_start+0x2>
    2512:	2f2f 00d4      	move.l 212(sp),-(sp)
    2516:	2f2f 00e8      	move.l 232(sp),-(sp)
    251a:	2f2f 00fc      	move.l 252(sp),-(sp)
    251e:	4eba ed14      	jsr 1234 <Zoom_ZoomBlit2>(pc)
    2522:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2526:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    252c:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    2532:	2c40           	movea.l d0,a6
    2534:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2538:	42af 00f8      	clr.l 248(sp)
    253c:	605c           	bra.s 259a <Test_Zoom2+0x4ac>
    if( *tmp != 0xaaaa ) {
    253e:	206f 0108      	movea.l 264(sp),a0
    2542:	3010           	move.w (a0),d0
    2544:	0c40 aaaa      	cmpi.w #-21846,d0
    2548:	6746           	beq.s 2590 <Test_Zoom2+0x4a2>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    254a:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2550:	2c40           	movea.l d0,a6
    2552:	4eae ffc4      	jsr -60(a6)
    2556:	2f40 0094      	move.l d0,148(sp)
    255a:	202f 0094      	move.l 148(sp),d0
    255e:	2f40 0090      	move.l d0,144(sp)
    2562:	2f7c 0001 7b70 	move.l #97136,140(sp)
    2568:	008c 
    256a:	7028           	moveq #40,d0
    256c:	2f40 0088      	move.l d0,136(sp)
    2570:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2576:	2c40           	movea.l d0,a6
    2578:	222f 0090      	move.l 144(sp),d1
    257c:	242f 008c      	move.l 140(sp),d2
    2580:	262f 0088      	move.l 136(sp),d3
    2584:	4eae ffd0      	jsr -48(a6)
    2588:	2f40 0084      	move.l d0,132(sp)
    258c:	6000 013a      	bra.w 26c8 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    2590:	7028           	moveq #40,d0
    2592:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2596:	52af 00f8      	addq.l #1,248(sp)
    259a:	7001           	moveq #1,d0
    259c:	b0af 00f8      	cmp.l 248(sp),d0
    25a0:	6c9c           	bge.s 253e <Test_Zoom2+0x450>
  //srcsmall:            1010 1010 1010 1010
  //srcsmall-shift:      0101 0101 0101 0101
  //pattern:             sssb bbbb bbbb bbbb
  //result:              0100 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    25a2:	2079 0002 8344 	movea.l 28344 <hw>,a0
    25a8:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    25ae:	2079 0002 8344 	movea.l 28344 <hw>,a0
    25b4:	317c e000 0070 	move.w #-8192,112(a0)
  hw->bltcon0 = 0xde4 + (1 << 12); //Chanell settings and Shift src small
    25ba:	2079 0002 8344 	movea.l 28344 <hw>,a0
    25c0:	317c 1de4 0040 	move.w #7652,64(a0)
 
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    25c6:	4878 0001      	pea 1 <_start+0x1>
    25ca:	4878 004e      	pea 4e <_start+0x4e>
    25ce:	4878 0026      	pea 26 <_start+0x26>
    25d2:	4878 0002      	pea 2 <_start+0x2>
    25d6:	2f2f 00d4      	move.l 212(sp),-(sp)
    25da:	2f2f 00e8      	move.l 232(sp),-(sp)
    25de:	2f2f 00fc      	move.l 252(sp),-(sp)
    25e2:	4eba ec50      	jsr 1234 <Zoom_ZoomBlit2>(pc)
    25e6:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    25ea:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    25f0:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    25f6:	2c40           	movea.l d0,a6
    25f8:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    25fc:	42af 00f4      	clr.l 244(sp)
    2600:	605a           	bra.s 265c <Test_Zoom2+0x56e>
    if( *tmp != 0x4aaa ) {
    2602:	206f 0108      	movea.l 264(sp),a0
    2606:	3010           	move.w (a0),d0
    2608:	0c40 4aaa      	cmpi.w #19114,d0
    260c:	6744           	beq.s 2652 <Test_Zoom2+0x564>
      Write( Output(), "Test_Zoom2: Test for shifting a failed\n", 39);
    260e:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2614:	2c40           	movea.l d0,a6
    2616:	4eae ffc4      	jsr -60(a6)
    261a:	2f40 00a8      	move.l d0,168(sp)
    261e:	202f 00a8      	move.l 168(sp),d0
    2622:	2f40 00a4      	move.l d0,164(sp)
    2626:	2f7c 0001 7b99 	move.l #97177,160(sp)
    262c:	00a0 
    262e:	7027           	moveq #39,d0
    2630:	2f40 009c      	move.l d0,156(sp)
    2634:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    263a:	2c40           	movea.l d0,a6
    263c:	222f 00a4      	move.l 164(sp),d1
    2640:	242f 00a0      	move.l 160(sp),d2
    2644:	262f 009c      	move.l 156(sp),d3
    2648:	4eae ffd0      	jsr -48(a6)
    264c:	2f40 0098      	move.l d0,152(sp)
    2650:	6076           	bra.s 26c8 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    2652:	7028           	moveq #40,d0
    2654:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2658:	52af 00f4      	addq.l #1,244(sp)
    265c:	7001           	moveq #1,d0
    265e:	b0af 00f4      	cmp.l 244(sp),d0
    2662:	6c9e           	bge.s 2602 <Test_Zoom2+0x514>

  FreeMem( srcsmall, 80);
    2664:	2f6f 00e4 00c0 	move.l 228(sp),192(sp)
    266a:	7050           	moveq #80,d0
    266c:	2f40 00bc      	move.l d0,188(sp)
    2670:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    2676:	2c40           	movea.l d0,a6
    2678:	226f 00c0      	movea.l 192(sp),a1
    267c:	202f 00bc      	move.l 188(sp),d0
    2680:	4eae ff2e      	jsr -210(a6)
  FreeMem( srcbig, 160);
    2684:	2f6f 00d4 00b8 	move.l 212(sp),184(sp)
    268a:	2f7c 0000 00a0 	move.l #160,180(sp)
    2690:	00b4 
    2692:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    2698:	2c40           	movea.l d0,a6
    269a:	226f 00b8      	movea.l 184(sp),a1
    269e:	202f 00b4      	move.l 180(sp),d0
    26a2:	4eae ff2e      	jsr -210(a6)
  FreeMem( target, 168);
    26a6:	2f6f 00c4 00b0 	move.l 196(sp),176(sp)
    26ac:	2f7c 0000 00a8 	move.l #168,172(sp)
    26b2:	00ac 
    26b4:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    26ba:	2c40           	movea.l d0,a6
    26bc:	226f 00b0      	movea.l 176(sp),a1
    26c0:	202f 00ac      	move.l 172(sp),d0
    26c4:	4eae ff2e      	jsr -210(a6)
    26c8:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    26cc:	4fef 0100      	lea 256(sp),sp
    26d0:	4e75           	rts

000026d2 <ClBuild>:
#include "utils.h"




ULONG * ClBuild() {
    26d2:	4fef ffc4      	lea -60(sp),sp
    26d6:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
    26da:	2f7c 0000 0084 	move.l #132,48(sp)
    26e0:	0030 
    26e2:	7002           	moveq #2,d0
    26e4:	2f40 002c      	move.l d0,44(sp)
    26e8:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    26ee:	2c40           	movea.l d0,a6
    26f0:	202f 0030      	move.l 48(sp),d0
    26f4:	222f 002c      	move.l 44(sp),d1
    26f8:	4eae ff3a      	jsr -198(a6)
    26fc:	2f40 0028      	move.l d0,40(sp)
    2700:	202f 0028      	move.l 40(sp),d0
    2704:	2f40 0024      	move.l d0,36(sp)
  if( retval == 0) {
    2708:	6658           	bne.s 2762 <ClBuild+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    270a:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2710:	2c40           	movea.l d0,a6
    2712:	4eae ffc4      	jsr -60(a6)
    2716:	2f40 0020      	move.l d0,32(sp)
    271a:	202f 0020      	move.l 32(sp),d0
    271e:	2f40 001c      	move.l d0,28(sp)
    2722:	2f7c 0000 7b6b 	move.l #31595,24(sp)
    2728:	0018 
    272a:	7228           	moveq #40,d1
    272c:	2f41 0014      	move.l d1,20(sp)
    2730:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2736:	2c40           	movea.l d0,a6
    2738:	222f 001c      	move.l 28(sp),d1
    273c:	242f 0018      	move.l 24(sp),d2
    2740:	262f 0014      	move.l 20(sp),d3
    2744:	4eae ffd0      	jsr -48(a6)
    2748:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    274c:	7401           	moveq #1,d2
    274e:	2f42 000c      	move.l d2,12(sp)
    2752:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2758:	2c40           	movea.l d0,a6
    275a:	222f 000c      	move.l 12(sp),d1
    275e:	4eae ff70      	jsr -144(a6)
  }
    
  ULONG *cl = retval;
    2762:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    2768:	2f7c 0001 a3c4 	move.l #107460,64(sp)
    276e:	0040 
  for(int i=0; i<16;i++)
    2770:	42af 003c      	clr.l 60(sp)
    2774:	6024           	bra.s 279a <ClBuild+0xc8>
    *cl++ = *clpartinstruction++;
    2776:	222f 0040      	move.l 64(sp),d1
    277a:	2001           	move.l d1,d0
    277c:	5880           	addq.l #4,d0
    277e:	2f40 0040      	move.l d0,64(sp)
    2782:	202f 0044      	move.l 68(sp),d0
    2786:	2400           	move.l d0,d2
    2788:	5882           	addq.l #4,d2
    278a:	2f42 0044      	move.l d2,68(sp)
    278e:	2041           	movea.l d1,a0
    2790:	2210           	move.l (a0),d1
    2792:	2040           	movea.l d0,a0
    2794:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    2796:	52af 003c      	addq.l #1,60(sp)
    279a:	700f           	moveq #15,d0
    279c:	b0af 003c      	cmp.l 60(sp),d0
    27a0:	6cd4           	bge.s 2776 <ClBuild+0xa4>
  clpartinstruction = ClScreen;
    27a2:	2f7c 0001 a404 	move.l #107524,64(sp)
    27a8:	0040 
  for(int i=0; i<12;i++)
    27aa:	42af 0038      	clr.l 56(sp)
    27ae:	6024           	bra.s 27d4 <ClBuild+0x102>
    *cl++ = *clpartinstruction++;
    27b0:	222f 0040      	move.l 64(sp),d1
    27b4:	2401           	move.l d1,d2
    27b6:	5882           	addq.l #4,d2
    27b8:	2f42 0040      	move.l d2,64(sp)
    27bc:	202f 0044      	move.l 68(sp),d0
    27c0:	2400           	move.l d0,d2
    27c2:	5882           	addq.l #4,d2
    27c4:	2f42 0044      	move.l d2,68(sp)
    27c8:	2041           	movea.l d1,a0
    27ca:	2210           	move.l (a0),d1
    27cc:	2040           	movea.l d0,a0
    27ce:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    27d0:	52af 0038      	addq.l #1,56(sp)
    27d4:	700b           	moveq #11,d0
    27d6:	b0af 0038      	cmp.l 56(sp),d0
    27da:	6cd4           	bge.s 27b0 <ClBuild+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    27dc:	202f 0044      	move.l 68(sp),d0
    27e0:	2200           	move.l d0,d1
    27e2:	5881           	addq.l #4,d1
    27e4:	2f41 0044      	move.l d1,68(sp)
    27e8:	2040           	movea.l d0,a0
    27ea:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    27f0:	202f 0044      	move.l 68(sp),d0
    27f4:	2200           	move.l d0,d1
    27f6:	5881           	addq.l #4,d1
    27f8:	2f41 0044      	move.l d1,68(sp)
    27fc:	2040           	movea.l d0,a0
    27fe:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
    2804:	2f7c 0001 a344 	move.l #107332,64(sp)
    280a:	0040 
  for(int i=0; i<2;i++)
    280c:	42af 0034      	clr.l 52(sp)
    2810:	6024           	bra.s 2836 <ClBuild+0x164>
    *cl++ = *clpartinstruction++;
    2812:	222f 0040      	move.l 64(sp),d1
    2816:	2001           	move.l d1,d0
    2818:	5880           	addq.l #4,d0
    281a:	2f40 0040      	move.l d0,64(sp)
    281e:	202f 0044      	move.l 68(sp),d0
    2822:	2400           	move.l d0,d2
    2824:	5882           	addq.l #4,d2
    2826:	2f42 0044      	move.l d2,68(sp)
    282a:	2041           	movea.l d1,a0
    282c:	2210           	move.l (a0),d1
    282e:	2040           	movea.l d0,a0
    2830:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
    2832:	52af 0034      	addq.l #1,52(sp)
    2836:	7001           	moveq #1,d0
    2838:	b0af 0034      	cmp.l 52(sp),d0
    283c:	6cd4           	bge.s 2812 <ClBuild+0x140>
  *cl = 0xfffffffe;
    283e:	206f 0044      	movea.l 68(sp),a0
    2842:	72fe           	moveq #-2,d1
    2844:	2081           	move.l d1,(a0)

  return retval;
    2846:	202f 0024      	move.l 36(sp),d0
}
    284a:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    284e:	4fef 003c      	lea 60(sp),sp
    2852:	4e75           	rts

00002854 <PrepareDisplay>:

int PrepareDisplay() {
    2854:	4fef ffb8      	lea -72(sp),sp
    2858:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClBuild( );
    285c:	4eba fe74      	jsr 26d2 <ClBuild>(pc)
    2860:	23c0 0002 832c 	move.l d0,2832c <Copperlist1>
  Copperlist2 = ClBuild( );
    2866:	4eba fe6a      	jsr 26d2 <ClBuild>(pc)
    286a:	23c0 0002 8330 	move.l d0,28330 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    2870:	2f7c 0000 c800 	move.l #51200,80(sp)
    2876:	0050 
    2878:	7002           	moveq #2,d0
    287a:	2f40 004c      	move.l d0,76(sp)
    287e:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    2884:	2c40           	movea.l d0,a6
    2886:	202f 0050      	move.l 80(sp),d0
    288a:	222f 004c      	move.l 76(sp),d1
    288e:	4eae ff3a      	jsr -198(a6)
    2892:	2f40 0048      	move.l d0,72(sp)
    2896:	202f 0048      	move.l 72(sp),d0
    289a:	23c0 0002 8324 	move.l d0,28324 <Bitplane1>
  if(Bitplane1 == 0) {
    28a0:	2039 0002 8324 	move.l 28324 <Bitplane1>,d0
    28a6:	6658           	bne.s 2900 <PrepareDisplay+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    28a8:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    28ae:	2c40           	movea.l d0,a6
    28b0:	4eae ffc4      	jsr -60(a6)
    28b4:	2f40 0044      	move.l d0,68(sp)
    28b8:	202f 0044      	move.l 68(sp),d0
    28bc:	2f40 0040      	move.l d0,64(sp)
    28c0:	2f7c 0000 7b1d 	move.l #31517,60(sp)
    28c6:	003c 
    28c8:	7026           	moveq #38,d0
    28ca:	2f40 0038      	move.l d0,56(sp)
    28ce:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    28d4:	2c40           	movea.l d0,a6
    28d6:	222f 0040      	move.l 64(sp),d1
    28da:	242f 003c      	move.l 60(sp),d2
    28de:	262f 0038      	move.l 56(sp),d3
    28e2:	4eae ffd0      	jsr -48(a6)
    28e6:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    28ea:	7001           	moveq #1,d0
    28ec:	2f40 0030      	move.l d0,48(sp)
    28f0:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    28f6:	2c40           	movea.l d0,a6
    28f8:	222f 0030      	move.l 48(sp),d1
    28fc:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane1;
    2900:	2039 0002 8324 	move.l 28324 <Bitplane1>,d0
    2906:	23c0 0002 8338 	move.l d0,28338 <ViewBuffer>
  ViewCopper = Copperlist1;
    290c:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    2912:	23c0 0002 8340 	move.l d0,28340 <ViewCopper>
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    2918:	2f7c 0000 c800 	move.l #51200,44(sp)
    291e:	002c 
    2920:	7002           	moveq #2,d0
    2922:	2f40 0028      	move.l d0,40(sp)
    2926:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    292c:	2c40           	movea.l d0,a6
    292e:	202f 002c      	move.l 44(sp),d0
    2932:	222f 0028      	move.l 40(sp),d1
    2936:	4eae ff3a      	jsr -198(a6)
    293a:	2f40 0024      	move.l d0,36(sp)
    293e:	202f 0024      	move.l 36(sp),d0
    2942:	23c0 0002 8328 	move.l d0,28328 <Bitplane2>
  if(Bitplane2 == 0) {
    2948:	2039 0002 8328 	move.l 28328 <Bitplane2>,d0
    294e:	6658           	bne.s 29a8 <PrepareDisplay+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2950:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2956:	2c40           	movea.l d0,a6
    2958:	4eae ffc4      	jsr -60(a6)
    295c:	2f40 0020      	move.l d0,32(sp)
    2960:	202f 0020      	move.l 32(sp),d0
    2964:	2f40 001c      	move.l d0,28(sp)
    2968:	2f7c 0000 7b44 	move.l #31556,24(sp)
    296e:	0018 
    2970:	7026           	moveq #38,d0
    2972:	2f40 0014      	move.l d0,20(sp)
    2976:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    297c:	2c40           	movea.l d0,a6
    297e:	222f 001c      	move.l 28(sp),d1
    2982:	242f 0018      	move.l 24(sp),d2
    2986:	262f 0014      	move.l 20(sp),d3
    298a:	4eae ffd0      	jsr -48(a6)
    298e:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    2992:	7001           	moveq #1,d0
    2994:	2f40 000c      	move.l d0,12(sp)
    2998:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    299e:	2c40           	movea.l d0,a6
    29a0:	222f 000c      	move.l 12(sp),d1
    29a4:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane2;
    29a8:	2039 0002 8328 	move.l 28328 <Bitplane2>,d0
    29ae:	23c0 0002 8334 	move.l d0,28334 <DrawBuffer>
  DrawCopper = Copperlist2;
    29b4:	2039 0002 8330 	move.l 28330 <Copperlist2>,d0
    29ba:	23c0 0002 833c 	move.l d0,2833c <DrawCopper>
  /*SwapCl();
  SetBplPointers();
  SwapCl();
  SetBplPointers();*/
  return 0;
    29c0:	7000           	moveq #0,d0
}
    29c2:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    29c6:	4fef 0048      	lea 72(sp),sp
    29ca:	4e75           	rts

000029cc <TestCopperlistBatch>:

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                  long length) {
    29cc:	598f           	subq.l #4,sp
  for( int i=0;i<length;i++)
    29ce:	4297           	clr.l (sp)
    29d0:	602a           	bra.s 29fc <TestCopperlistBatch+0x30>
    if( instructions[ pos+i] != batch[ i])
    29d2:	202f 000c      	move.l 12(sp),d0
    29d6:	d097           	add.l (sp),d0
    29d8:	d080           	add.l d0,d0
    29da:	d080           	add.l d0,d0
    29dc:	206f 0008      	movea.l 8(sp),a0
    29e0:	d1c0           	adda.l d0,a0
    29e2:	2210           	move.l (a0),d1
    29e4:	2017           	move.l (sp),d0
    29e6:	d080           	add.l d0,d0
    29e8:	d080           	add.l d0,d0
    29ea:	206f 0010      	movea.l 16(sp),a0
    29ee:	d1c0           	adda.l d0,a0
    29f0:	2010           	move.l (a0),d0
    29f2:	b081           	cmp.l d1,d0
    29f4:	6704           	beq.s 29fa <TestCopperlistBatch+0x2e>
      return 0;
    29f6:	7000           	moveq #0,d0
    29f8:	600c           	bra.s 2a06 <TestCopperlistBatch+0x3a>
  for( int i=0;i<length;i++)
    29fa:	5297           	addq.l #1,(sp)
    29fc:	2017           	move.l (sp),d0
    29fe:	b0af 0014      	cmp.l 20(sp),d0
    2a02:	6dce           	blt.s 29d2 <TestCopperlistBatch+0x6>
  return 1;
    2a04:	7001           	moveq #1,d0
}
    2a06:	588f           	addq.l #4,sp
    2a08:	4e75           	rts

00002a0a <TestCopperlistPos>:

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    2a0a:	202f 0008      	move.l 8(sp),d0
    2a0e:	d080           	add.l d0,d0
    2a10:	d080           	add.l d0,d0
    2a12:	206f 0004      	movea.l 4(sp),a0
    2a16:	d1c0           	adda.l d0,a0
    2a18:	2010           	move.l (a0),d0
    2a1a:	b0af 000c      	cmp.l 12(sp),d0
    2a1e:	6604           	bne.s 2a24 <TestCopperlistPos+0x1a>
    return 1;
    2a20:	7001           	moveq #1,d0
    2a22:	6002           	bra.s 2a26 <TestCopperlistPos+0x1c>
  else 
    return 0;
    2a24:	7000           	moveq #0,d0
}
    2a26:	4e75           	rts

00002a28 <TestCopperList>:

void TestCopperList() {
    2a28:	4fef feb8      	lea -328(sp),sp
    2a2c:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Write( Output(), "%d", hw->cop1lc);
    2a30:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2a36:	2c40           	movea.l d0,a6
    2a38:	4eae ffc4      	jsr -60(a6)
    2a3c:	2f40 0150      	move.l d0,336(sp)
    2a40:	202f 0150      	move.l 336(sp),d0
    2a44:	2f40 014c      	move.l d0,332(sp)
    2a48:	2f7c 0001 7bc1 	move.l #97217,328(sp)
    2a4e:	0148 
    2a50:	2079 0002 8344 	movea.l 28344 <hw>,a0
    2a56:	2028 0080      	move.l 128(a0),d0
    2a5a:	2f40 0144      	move.l d0,324(sp)
    2a5e:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2a64:	2c40           	movea.l d0,a6
    2a66:	222f 014c      	move.l 332(sp),d1
    2a6a:	242f 0148      	move.l 328(sp),d2
    2a6e:	262f 0144      	move.l 324(sp),d3
    2a72:	4eae ffd0      	jsr -48(a6)
    2a76:	2f40 0140      	move.l d0,320(sp)
  Copperlist1 = ClBuild();
    2a7a:	4eba fc56      	jsr 26d2 <ClBuild>(pc)
    2a7e:	23c0 0002 832c 	move.l d0,2832c <Copperlist1>
  DrawCopper = Copperlist1;
    2a84:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    2a8a:	23c0 0002 833c 	move.l d0,2833c <DrawCopper>
  Copperlist2 = ClBuild();
    2a90:	4eba fc40      	jsr 26d2 <ClBuild>(pc)
    2a94:	23c0 0002 8330 	move.l d0,28330 <Copperlist2>
  ViewCopper = Copperlist2;
    2a9a:	2039 0002 8330 	move.l 28330 <Copperlist2>,d0
    2aa0:	23c0 0002 8340 	move.l d0,28340 <ViewCopper>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2aa6:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    2aac:	4878 0010      	pea 10 <_start+0x10>
    2ab0:	4879 0001 a3c4 	pea 1a3c4 <ClsSprites>
    2ab6:	42a7           	clr.l -(sp)
    2ab8:	2f00           	move.l d0,-(sp)
    2aba:	4eba ff10      	jsr 29cc <TestCopperlistBatch>(pc)
    2abe:	4fef 0010      	lea 16(sp),sp
    2ac2:	4a80           	tst.l d0
    2ac4:	6642           	bne.s 2b08 <TestCopperList+0xe0>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    2ac6:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2acc:	2c40           	movea.l d0,a6
    2ace:	4eae ffc4      	jsr -60(a6)
    2ad2:	2f40 013c      	move.l d0,316(sp)
    2ad6:	202f 013c      	move.l 316(sp),d0
    2ada:	2f40 0138      	move.l d0,312(sp)
    2ade:	2f7c 0000 7487 	move.l #29831,308(sp)
    2ae4:	0134 
    2ae6:	702c           	moveq #44,d0
    2ae8:	2f40 0130      	move.l d0,304(sp)
    2aec:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2af2:	2c40           	movea.l d0,a6
    2af4:	222f 0138      	move.l 312(sp),d1
    2af8:	242f 0134      	move.l 308(sp),d2
    2afc:	262f 0130      	move.l 304(sp),d3
    2b00:	4eae ffd0      	jsr -48(a6)
    2b04:	2f40 012c      	move.l d0,300(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2b08:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    2b0e:	4878 000c      	pea c <_start+0xc>
    2b12:	4879 0001 a404 	pea 1a404 <ClScreen>
    2b18:	4878 0010      	pea 10 <_start+0x10>
    2b1c:	2f00           	move.l d0,-(sp)
    2b1e:	4eba feac      	jsr 29cc <TestCopperlistBatch>(pc)
    2b22:	4fef 0010      	lea 16(sp),sp
    2b26:	4a80           	tst.l d0
    2b28:	6642           	bne.s 2b6c <TestCopperList+0x144>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    2b2a:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2b30:	2c40           	movea.l d0,a6
    2b32:	4eae ffc4      	jsr -60(a6)
    2b36:	2f40 0128      	move.l d0,296(sp)
    2b3a:	202f 0128      	move.l 296(sp),d0
    2b3e:	2f40 0124      	move.l d0,292(sp)
    2b42:	2f7c 0000 74bd 	move.l #29885,288(sp)
    2b48:	0120 
    2b4a:	7036           	moveq #54,d0
    2b4c:	2f40 011c      	move.l d0,284(sp)
    2b50:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2b56:	2c40           	movea.l d0,a6
    2b58:	222f 0124      	move.l 292(sp),d1
    2b5c:	242f 0120      	move.l 288(sp),d2
    2b60:	262f 011c      	move.l 284(sp),d3
    2b64:	4eae ffd0      	jsr -48(a6)
    2b68:	2f40 0118      	move.l d0,280(sp)
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
    2b6c:	23fc 0004 0000 	move.l #262144,28334 <DrawBuffer>
    2b72:	0002 8334 
  ViewBuffer = (ULONG *)0x50000;
    2b76:	23fc 0005 0000 	move.l #327680,28338 <ViewBuffer>
    2b7c:	0002 8338 
  
  SetBplPointers();
    2b80:	4eba d614      	jsr 196 <SetBplPointers>(pc)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    2b84:	2039 0002 8334 	move.l 28334 <DrawBuffer>,d0
    2b8a:	0c80 0005 0000 	cmpi.l #327680,d0
    2b90:	660e           	bne.s 2ba0 <TestCopperList+0x178>
    2b92:	2039 0002 8338 	move.l 28338 <ViewBuffer>,d0
    2b98:	0c80 0004 0000 	cmpi.l #262144,d0
    2b9e:	6742           	beq.s 2be2 <TestCopperList+0x1ba>
    Write( Output(), 
    2ba0:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2ba6:	2c40           	movea.l d0,a6
    2ba8:	4eae ffc4      	jsr -60(a6)
    2bac:	2f40 0114      	move.l d0,276(sp)
    2bb0:	202f 0114      	move.l 276(sp),d0
    2bb4:	2f40 0110      	move.l d0,272(sp)
    2bb8:	2f7c 0001 7bc4 	move.l #97220,268(sp)
    2bbe:	010c 
    2bc0:	703b           	moveq #59,d0
    2bc2:	2f40 0108      	move.l d0,264(sp)
    2bc6:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2bcc:	2c40           	movea.l d0,a6
    2bce:	222f 0110      	move.l 272(sp),d1
    2bd2:	242f 010c      	move.l 268(sp),d2
    2bd6:	262f 0108      	move.l 264(sp),d3
    2bda:	4eae ffd0      	jsr -48(a6)
    2bde:	2f40 0104      	move.l d0,260(sp)
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    2be2:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    2be8:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    2bee:	4878 001c      	pea 1c <_start+0x1c>
    2bf2:	2f00           	move.l d0,-(sp)
    2bf4:	4eba fe14      	jsr 2a0a <TestCopperlistPos>(pc)
    2bf8:	4fef 000c      	lea 12(sp),sp
    2bfc:	4a80           	tst.l d0
    2bfe:	6642           	bne.s 2c42 <TestCopperList+0x21a>
    Write(Output(), 
    2c00:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2c06:	2c40           	movea.l d0,a6
    2c08:	4eae ffc4      	jsr -60(a6)
    2c0c:	2f40 0100      	move.l d0,256(sp)
    2c10:	202f 0100      	move.l 256(sp),d0
    2c14:	2f40 00fc      	move.l d0,252(sp)
    2c18:	2f7c 0001 7c00 	move.l #97280,248(sp)
    2c1e:	00f8 
    2c20:	703c           	moveq #60,d0
    2c22:	2f40 00f4      	move.l d0,244(sp)
    2c26:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2c2c:	2c40           	movea.l d0,a6
    2c2e:	222f 00fc      	move.l 252(sp),d1
    2c32:	242f 00f8      	move.l 248(sp),d2
    2c36:	262f 00f4      	move.l 244(sp),d3
    2c3a:	4eae ffd0      	jsr -48(a6)
    2c3e:	2f40 00f0      	move.l d0,240(sp)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    2c42:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    2c48:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    2c4e:	4878 001d      	pea 1d <_start+0x1d>
    2c52:	2f00           	move.l d0,-(sp)
    2c54:	4eba fdb4      	jsr 2a0a <TestCopperlistPos>(pc)
    2c58:	4fef 000c      	lea 12(sp),sp
    2c5c:	4a80           	tst.l d0
    2c5e:	6642           	bne.s 2ca2 <TestCopperList+0x27a>
    Write(Output(), 
    2c60:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2c66:	2c40           	movea.l d0,a6
    2c68:	4eae ffc4      	jsr -60(a6)
    2c6c:	2f40 00ec      	move.l d0,236(sp)
    2c70:	202f 00ec      	move.l 236(sp),d0
    2c74:	2f40 00e8      	move.l d0,232(sp)
    2c78:	2f7c 0001 7c3d 	move.l #97341,228(sp)
    2c7e:	00e4 
    2c80:	703c           	moveq #60,d0
    2c82:	2f40 00e0      	move.l d0,224(sp)
    2c86:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2c8c:	2c40           	movea.l d0,a6
    2c8e:	222f 00e8      	move.l 232(sp),d1
    2c92:	242f 00e4      	move.l 228(sp),d2
    2c96:	262f 00e0      	move.l 224(sp),d3
    2c9a:	4eae ffd0      	jsr -48(a6)
    2c9e:	2f40 00dc      	move.l d0,220(sp)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2ca2:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    2ca8:	4878 0002      	pea 2 <_start+0x2>
    2cac:	4879 0001 a344 	pea 1a344 <ClColor>
    2cb2:	4878 001e      	pea 1e <_start+0x1e>
    2cb6:	2f00           	move.l d0,-(sp)
    2cb8:	4eba fd12      	jsr 29cc <TestCopperlistBatch>(pc)
    2cbc:	4fef 0010      	lea 16(sp),sp
    2cc0:	4a80           	tst.l d0
    2cc2:	6642           	bne.s 2d06 <TestCopperList+0x2de>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2cc4:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2cca:	2c40           	movea.l d0,a6
    2ccc:	4eae ffc4      	jsr -60(a6)
    2cd0:	2f40 00d8      	move.l d0,216(sp)
    2cd4:	202f 00d8      	move.l 216(sp),d0
    2cd8:	2f40 00d4      	move.l d0,212(sp)
    2cdc:	2f7c 0000 74f4 	move.l #29940,208(sp)
    2ce2:	00d0 
    2ce4:	7021           	moveq #33,d0
    2ce6:	2f40 00cc      	move.l d0,204(sp)
    2cea:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2cf0:	2c40           	movea.l d0,a6
    2cf2:	222f 00d4      	move.l 212(sp),d1
    2cf6:	242f 00d0      	move.l 208(sp),d2
    2cfa:	262f 00cc      	move.l 204(sp),d3
    2cfe:	4eae ffd0      	jsr -48(a6)
    2d02:	2f40 00c8      	move.l d0,200(sp)

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2d06:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    2d0c:	4878 fffe      	pea fffffffe <_end+0xfffd7c62>
    2d10:	4878 0020      	pea 20 <_start+0x20>
    2d14:	2f00           	move.l d0,-(sp)
    2d16:	4eba fcf2      	jsr 2a0a <TestCopperlistPos>(pc)
    2d1a:	4fef 000c      	lea 12(sp),sp
    2d1e:	4a80           	tst.l d0
    2d20:	6642           	bne.s 2d64 <TestCopperList+0x33c>
    Write(Output(), "Copperlist End not correctly set.\n", 34);
    2d22:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2d28:	2c40           	movea.l d0,a6
    2d2a:	4eae ffc4      	jsr -60(a6)
    2d2e:	2f40 00c4      	move.l d0,196(sp)
    2d32:	202f 00c4      	move.l 196(sp),d0
    2d36:	2f40 00c0      	move.l d0,192(sp)
    2d3a:	2f7c 0000 7516 	move.l #29974,188(sp)
    2d40:	00bc 
    2d42:	7022           	moveq #34,d0
    2d44:	2f40 00b8      	move.l d0,184(sp)
    2d48:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2d4e:	2c40           	movea.l d0,a6
    2d50:	222f 00c0      	move.l 192(sp),d1
    2d54:	242f 00bc      	move.l 188(sp),d2
    2d58:	262f 00b8      	move.l 184(sp),d3
    2d5c:	4eae ffd0      	jsr -48(a6)
    2d60:	2f40 00b4      	move.l d0,180(sp)
  
  SwapCl();
    2d64:	4eba d48e      	jsr 1f4 <SwapCl>(pc)
  
  if( DrawCopper != Copperlist2)
    2d68:	2239 0002 833c 	move.l 2833c <DrawCopper>,d1
    2d6e:	2039 0002 8330 	move.l 28330 <Copperlist2>,d0
    2d74:	b081           	cmp.l d1,d0
    2d76:	6742           	beq.s 2dba <TestCopperList+0x392>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
    2d78:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2d7e:	2c40           	movea.l d0,a6
    2d80:	4eae ffc4      	jsr -60(a6)
    2d84:	2f40 00b0      	move.l d0,176(sp)
    2d88:	202f 00b0      	move.l 176(sp),d0
    2d8c:	2f40 00ac      	move.l d0,172(sp)
    2d90:	2f7c 0001 7c7a 	move.l #97402,168(sp)
    2d96:	00a8 
    2d98:	7015           	moveq #21,d0
    2d9a:	2f40 00a4      	move.l d0,164(sp)
    2d9e:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2da4:	2c40           	movea.l d0,a6
    2da6:	222f 00ac      	move.l 172(sp),d1
    2daa:	242f 00a8      	move.l 168(sp),d2
    2dae:	262f 00a4      	move.l 164(sp),d3
    2db2:	4eae ffd0      	jsr -48(a6)
    2db6:	2f40 00a0      	move.l d0,160(sp)

  
  PrepareDisplay();
    2dba:	4eba fa98      	jsr 2854 <PrepareDisplay>(pc)
  if( DrawBuffer != Bitplane2) 
    2dbe:	2239 0002 8334 	move.l 28334 <DrawBuffer>,d1
    2dc4:	2039 0002 8328 	move.l 28328 <Bitplane2>,d0
    2dca:	b081           	cmp.l d1,d0
    2dcc:	6742           	beq.s 2e10 <TestCopperList+0x3e8>
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
    2dce:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2dd4:	2c40           	movea.l d0,a6
    2dd6:	4eae ffc4      	jsr -60(a6)
    2dda:	2f40 009c      	move.l d0,156(sp)
    2dde:	202f 009c      	move.l 156(sp),d0
    2de2:	2f40 0098      	move.l d0,152(sp)
    2de6:	2f7c 0001 7c90 	move.l #97424,148(sp)
    2dec:	0094 
    2dee:	7037           	moveq #55,d0
    2df0:	2f40 0090      	move.l d0,144(sp)
    2df4:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2dfa:	2c40           	movea.l d0,a6
    2dfc:	222f 0098      	move.l 152(sp),d1
    2e00:	242f 0094      	move.l 148(sp),d2
    2e04:	262f 0090      	move.l 144(sp),d3
    2e08:	4eae ffd0      	jsr -48(a6)
    2e0c:	2f40 008c      	move.l d0,140(sp)
                                                                            55);
  if( DrawCopper != Copperlist2) 
    2e10:	2239 0002 833c 	move.l 2833c <DrawCopper>,d1
    2e16:	2039 0002 8330 	move.l 28330 <Copperlist2>,d0
    2e1c:	b081           	cmp.l d1,d0
    2e1e:	6742           	beq.s 2e62 <TestCopperList+0x43a>
    Write( Output(), 
    2e20:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2e26:	2c40           	movea.l d0,a6
    2e28:	4eae ffc4      	jsr -60(a6)
    2e2c:	2f40 0088      	move.l d0,136(sp)
    2e30:	202f 0088      	move.l 136(sp),d0
    2e34:	2f40 0084      	move.l d0,132(sp)
    2e38:	2f7c 0001 7cc8 	move.l #97480,128(sp)
    2e3e:	0080 
    2e40:	7039           	moveq #57,d0
    2e42:	2f40 007c      	move.l d0,124(sp)
    2e46:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2e4c:	2c40           	movea.l d0,a6
    2e4e:	222f 0084      	move.l 132(sp),d1
    2e52:	242f 0080      	move.l 128(sp),d2
    2e56:	262f 007c      	move.l 124(sp),d3
    2e5a:	4eae ffd0      	jsr -48(a6)
    2e5e:	2f40 0078      	move.l d0,120(sp)
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
    2e62:	2239 0002 8338 	move.l 28338 <ViewBuffer>,d1
    2e68:	2039 0002 8324 	move.l 28324 <Bitplane1>,d0
    2e6e:	b081           	cmp.l d1,d0
    2e70:	6742           	beq.s 2eb4 <TestCopperList+0x48c>
    Write( Output(), 
    2e72:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2e78:	2c40           	movea.l d0,a6
    2e7a:	4eae ffc4      	jsr -60(a6)
    2e7e:	2f40 0074      	move.l d0,116(sp)
    2e82:	202f 0074      	move.l 116(sp),d0
    2e86:	2f40 0070      	move.l d0,112(sp)
    2e8a:	2f7c 0001 7d02 	move.l #97538,108(sp)
    2e90:	006c 
    2e92:	7038           	moveq #56,d0
    2e94:	2f40 0068      	move.l d0,104(sp)
    2e98:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2e9e:	2c40           	movea.l d0,a6
    2ea0:	222f 0070      	move.l 112(sp),d1
    2ea4:	242f 006c      	move.l 108(sp),d2
    2ea8:	262f 0068      	move.l 104(sp),d3
    2eac:	4eae ffd0      	jsr -48(a6)
    2eb0:	2f40 0064      	move.l d0,100(sp)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
    2eb4:	2239 0002 8340 	move.l 28340 <ViewCopper>,d1
    2eba:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    2ec0:	b081           	cmp.l d1,d0
    2ec2:	6742           	beq.s 2f06 <TestCopperList+0x4de>
    Write( Output(), 
    2ec4:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2eca:	2c40           	movea.l d0,a6
    2ecc:	4eae ffc4      	jsr -60(a6)
    2ed0:	2f40 0060      	move.l d0,96(sp)
    2ed4:	202f 0060      	move.l 96(sp),d0
    2ed8:	2f40 005c      	move.l d0,92(sp)
    2edc:	2f7c 0001 7d3b 	move.l #97595,88(sp)
    2ee2:	0058 
    2ee4:	703a           	moveq #58,d0
    2ee6:	2f40 0054      	move.l d0,84(sp)
    2eea:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2ef0:	2c40           	movea.l d0,a6
    2ef2:	222f 005c      	move.l 92(sp),d1
    2ef6:	242f 0058      	move.l 88(sp),d2
    2efa:	262f 0054      	move.l 84(sp),d3
    2efe:	4eae ffd0      	jsr -48(a6)
    2f02:	2f40 0050      	move.l d0,80(sp)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
    2f06:	4eba d28e      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
    2f0a:	4eba d2e8      	jsr 1f4 <SwapCl>(pc)
  UWORD *copword = ViewCopper;
    2f0e:	2f79 0002 8340 	move.l 28340 <ViewCopper>,76(sp)
    2f14:	004c 
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2f16:	307c 0076      	movea.w #118,a0
    2f1a:	d1ef 004c      	adda.l 76(sp),a0
    2f1e:	3010           	move.w (a0),d0
    2f20:	7200           	moveq #0,d1
    2f22:	3200           	move.w d0,d1
    2f24:	307c 0072      	movea.w #114,a0
    2f28:	d1ef 004c      	adda.l 76(sp),a0
    2f2c:	3010           	move.w (a0),d0
    2f2e:	3000           	move.w d0,d0
    2f30:	0280 0000 ffff 	andi.l #65535,d0
    2f36:	4840           	swap d0
    2f38:	4240           	clr.w d0
    2f3a:	d081           	add.l d1,d0
    2f3c:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2f40:	2039 0002 8328 	move.l 28328 <Bitplane2>,d0
    2f46:	b0af 0048      	cmp.l 72(sp),d0
    2f4a:	6742           	beq.s 2f8e <TestCopperList+0x566>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2f4c:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2f52:	2c40           	movea.l d0,a6
    2f54:	4eae ffc4      	jsr -60(a6)
    2f58:	2f40 0044      	move.l d0,68(sp)
    2f5c:	202f 0044      	move.l 68(sp),d0
    2f60:	2f40 0040      	move.l d0,64(sp)
    2f64:	2f7c 0001 7d76 	move.l #97654,60(sp)
    2f6a:	003c 
    2f6c:	7048           	moveq #72,d0
    2f6e:	2f40 0038      	move.l d0,56(sp)
    2f72:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2f78:	2c40           	movea.l d0,a6
    2f7a:	222f 0040      	move.l 64(sp),d1
    2f7e:	242f 003c      	move.l 60(sp),d2
    2f82:	262f 0038      	move.l 56(sp),d3
    2f86:	4eae ffd0      	jsr -48(a6)
    2f8a:	2f40 0034      	move.l d0,52(sp)
                                                   " after first frame.\n", 72);
  SetBplPointers();
    2f8e:	4eba d206      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
    2f92:	4eba d260      	jsr 1f4 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2f96:	2f79 0002 8340 	move.l 28340 <ViewCopper>,76(sp)
    2f9c:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2f9e:	307c 0076      	movea.w #118,a0
    2fa2:	d1ef 004c      	adda.l 76(sp),a0
    2fa6:	3010           	move.w (a0),d0
    2fa8:	7200           	moveq #0,d1
    2faa:	3200           	move.w d0,d1
    2fac:	307c 0072      	movea.w #114,a0
    2fb0:	d1ef 004c      	adda.l 76(sp),a0
    2fb4:	3010           	move.w (a0),d0
    2fb6:	3000           	move.w d0,d0
    2fb8:	0280 0000 ffff 	andi.l #65535,d0
    2fbe:	4840           	swap d0
    2fc0:	4240           	clr.w d0
    2fc2:	d081           	add.l d1,d0
    2fc4:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane1) 
    2fc8:	2039 0002 8324 	move.l 28324 <Bitplane1>,d0
    2fce:	b0af 0048      	cmp.l 72(sp),d0
    2fd2:	6742           	beq.s 3016 <TestCopperList+0x5ee>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
    2fd4:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    2fda:	2c40           	movea.l d0,a6
    2fdc:	4eae ffc4      	jsr -60(a6)
    2fe0:	2f40 0030      	move.l d0,48(sp)
    2fe4:	202f 0030      	move.l 48(sp),d0
    2fe8:	2f40 002c      	move.l d0,44(sp)
    2fec:	2f7c 0001 7dbf 	move.l #97727,40(sp)
    2ff2:	0028 
    2ff4:	7049           	moveq #73,d0
    2ff6:	2f40 0024      	move.l d0,36(sp)
    2ffa:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3000:	2c40           	movea.l d0,a6
    3002:	222f 002c      	move.l 44(sp),d1
    3006:	242f 0028      	move.l 40(sp),d2
    300a:	262f 0024      	move.l 36(sp),d3
    300e:	4eae ffd0      	jsr -48(a6)
    3012:	2f40 0020      	move.l d0,32(sp)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
    3016:	4eba d17e      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
    301a:	4eba d1d8      	jsr 1f4 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    301e:	2f79 0002 8340 	move.l 28340 <ViewCopper>,76(sp)
    3024:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    3026:	307c 0076      	movea.w #118,a0
    302a:	d1ef 004c      	adda.l 76(sp),a0
    302e:	3010           	move.w (a0),d0
    3030:	7200           	moveq #0,d1
    3032:	3200           	move.w d0,d1
    3034:	307c 0072      	movea.w #114,a0
    3038:	d1ef 004c      	adda.l 76(sp),a0
    303c:	3010           	move.w (a0),d0
    303e:	3000           	move.w d0,d0
    3040:	0280 0000 ffff 	andi.l #65535,d0
    3046:	4840           	swap d0
    3048:	4240           	clr.w d0
    304a:	d081           	add.l d1,d0
    304c:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    3050:	2039 0002 8328 	move.l 28328 <Bitplane2>,d0
    3056:	b0af 0048      	cmp.l 72(sp),d0
    305a:	6742           	beq.s 309e <TestCopperList+0x676>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    305c:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3062:	2c40           	movea.l d0,a6
    3064:	4eae ffc4      	jsr -60(a6)
    3068:	2f40 001c      	move.l d0,28(sp)
    306c:	202f 001c      	move.l 28(sp),d0
    3070:	2f40 0018      	move.l d0,24(sp)
    3074:	2f7c 0001 7e09 	move.l #97801,20(sp)
    307a:	0014 
    307c:	7048           	moveq #72,d0
    307e:	2f40 0010      	move.l d0,16(sp)
    3082:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3088:	2c40           	movea.l d0,a6
    308a:	222f 0018      	move.l 24(sp),d1
    308e:	242f 0014      	move.l 20(sp),d2
    3092:	262f 0010      	move.l 16(sp),d3
    3096:	4eae ffd0      	jsr -48(a6)
    309a:	2f40 000c      	move.l d0,12(sp)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
    309e:	2f3c 0000 c800 	move.l #51200,-(sp)
    30a4:	4878 0084      	pea 84 <_start+0x84>
    30a8:	4eba d036      	jsr e0 <FreeDisplay>(pc)
    30ac:	508f           	addq.l #8,sp
    30ae:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    30b2:	4fef 0148      	lea 328(sp),sp
    30b6:	4e75           	rts

000030b8 <RunTests>:
#include "runtests.h"
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    30b8:	4eba f96e      	jsr 2a28 <TestCopperList>(pc)
    ZoomTest();
    30bc:	4eba 0004      	jsr 30c2 <ZoomTest>(pc)
    //SwScrollerTest();
    30c0:	4e75           	rts

000030c2 <ZoomTest>:
#include "zoomtest2.h"

ULONG Cl102ZoomTest[137];

void ZoomTest() {
  TestZoomSpeed();
    30c2:	4eba 001c      	jsr 30e0 <TestZoomSpeed>(pc)
  ZoomTestDisplay();
    30c6:	4eba 00b8      	jsr 3180 <ZoomTestDisplay>(pc)
  TestBlitleftOfZoom();
    30ca:	4eba 057a      	jsr 3646 <TestBlitleftOfZoom>(pc)
  TestCopyWord();
    30ce:	4eba 080a      	jsr 38da <TestCopyWord>(pc)
  TestZoom4Picture();
    30d2:	4eba 0de4      	jsr 3eb8 <TestZoom4Picture>(pc)
  TestZoom4PictureOn5Planes();
    30d6:	4eba 0af4      	jsr 3bcc <TestZoom4PictureOn5Planes>(pc)
  Test_Zoom2();
    30da:	4eba f012      	jsr 20ee <Test_Zoom2>(pc)
}
    30de:	4e75           	rts

000030e0 <TestZoomSpeed>:

int Counter4Frames;

void TestZoomSpeed() {
    30e0:	4fef ffe8      	lea -24(sp),sp
    30e4:	48e7 3002      	movem.l d2-d3/a6,-(sp)

 	TakeSystem();
    30e8:	4eba d5de      	jsr 6c8 <TakeSystem>(pc)
	WaitVbl();
    30ec:	4eba d590      	jsr 67e <WaitVbl>(pc)
  //             fedcba9876543210
  //hw->dmacon = 0x8def;

  hw->dmacon = DMAF_SETCLR | DMAF_AUDIO | DMAF_BLITTER | DMAF_RASTER 
    30f0:	2079 0002 8344 	movea.l 28344 <hw>,a0
    30f6:	317c 87cf 0096 	move.w #-30769,150(a0)
                                    | DMAF_COPPER | DMAF_MASTER | DMAF_BLITHOG;
   //0b1000011111100000;
  
  //hw->dmacon = 0b1000011111111111;
	hw->intena = (1 << INTB_SETCLR) | (1 << INTB_INTEN) | (1 << INTB_VERTB);
    30fc:	2079 0002 8344 	movea.l 28344 <hw>,a0
    3102:	317c c020 009a 	move.w #-16352,154(a0)
  
  Zoom_InitRun(); 
    3108:	4eba e1a8      	jsr 12b2 <Zoom_InitRun>(pc)

  int success = 1;
    310c:	7001           	moveq #1,d0
    310e:	2f40 0020      	move.l d0,32(sp)
  RunFrame();
    3112:	4eba d2a2      	jsr 3b6 <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    3116:	3039 0002 8382 	move.w 28382 <Zoom_Counter>,d0
    311c:	0c40 0008      	cmpi.w #8,d0
    3120:	6304           	bls.s 3126 <TestZoomSpeed+0x46>
    3122:	42af 0020      	clr.l 32(sp)
    
  Zoom_Dealloc();
    3126:	4eba e374      	jsr 149c <Zoom_Dealloc>(pc)
  FreeSystem();
    312a:	4eba d6a8      	jsr 7d4 <FreeSystem>(pc)

  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    312e:	4aaf 0020      	tst.l 32(sp)
    3132:	6642           	bne.s 3176 <TestZoomSpeed+0x96>
    3134:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    313a:	2c40           	movea.l d0,a6
    313c:	4eae ffc4      	jsr -60(a6)
    3140:	2f40 001c      	move.l d0,28(sp)
    3144:	202f 001c      	move.l 28(sp),d0
    3148:	2f40 0018      	move.l d0,24(sp)
    314c:	2f7c 0001 7e52 	move.l #97874,20(sp)
    3152:	0014 
    3154:	701c           	moveq #28,d0
    3156:	2f40 0010      	move.l d0,16(sp)
    315a:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3160:	2c40           	movea.l d0,a6
    3162:	222f 0018      	move.l 24(sp),d1
    3166:	242f 0014      	move.l 20(sp),d2
    316a:	262f 0010      	move.l 16(sp),d3
    316e:	4eae ffd0      	jsr -48(a6)
    3172:	2f40 000c      	move.l d0,12(sp)

  //AddIntServer(INTB_VERTB, vbint);
  //RemIntServer(INTB_VERTB, vbint);
  
}
    3176:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    317a:	4fef 0018      	lea 24(sp),sp
    317e:	4e75           	rts

00003180 <ZoomTestDisplay>:

void ZoomTestDisplay() {
    3180:	4fef ff38      	lea -200(sp),sp
    3184:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Zoom_Init();
    3188:	4eba e4c6      	jsr 1650 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    318c:	4eba e864      	jsr 19f2 <PrepareDisplayZoom>(pc)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    3190:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    3196:	4878 0010      	pea 10 <_start+0x10>
    319a:	4879 0001 a3c4 	pea 1a3c4 <ClsSprites>
    31a0:	42a7           	clr.l -(sp)
    31a2:	2f00           	move.l d0,-(sp)
    31a4:	4eba f826      	jsr 29cc <TestCopperlistBatch>(pc)
    31a8:	4fef 0010      	lea 16(sp),sp
    31ac:	4a80           	tst.l d0
    31ae:	6642           	bne.s 31f2 <ZoomTestDisplay+0x72>
    Write( Output(), 
    31b0:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    31b6:	2c40           	movea.l d0,a6
    31b8:	4eae ffc4      	jsr -60(a6)
    31bc:	2f40 00d0      	move.l d0,208(sp)
    31c0:	202f 00d0      	move.l 208(sp),d0
    31c4:	2f40 00cc      	move.l d0,204(sp)
    31c8:	2f7c 0001 7e71 	move.l #97905,200(sp)
    31ce:	00c8 
    31d0:	7045           	moveq #69,d0
    31d2:	2f40 00c4      	move.l d0,196(sp)
    31d6:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    31dc:	2c40           	movea.l d0,a6
    31de:	222f 00cc      	move.l 204(sp),d1
    31e2:	242f 00c8      	move.l 200(sp),d2
    31e6:	262f 00c4      	move.l 196(sp),d3
    31ea:	4eae ffd0      	jsr -48(a6)
    31ee:	2f40 00c0      	move.l d0,192(sp)
       "ZoomCopperlist: Sprite section of copper starting on pos 0 messed up\n", 
                                                                            69);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    31f2:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    31f8:	4878 000c      	pea c <_start+0xc>
    31fc:	4879 0001 a404 	pea 1a404 <ClScreen>
    3202:	4878 0010      	pea 10 <_start+0x10>
    3206:	2f00           	move.l d0,-(sp)
    3208:	4eba f7c2      	jsr 29cc <TestCopperlistBatch>(pc)
    320c:	4fef 0010      	lea 16(sp),sp
    3210:	4a80           	tst.l d0
    3212:	6642           	bne.s 3256 <ZoomTestDisplay+0xd6>
    Write( Output(), 
    3214:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    321a:	2c40           	movea.l d0,a6
    321c:	4eae ffc4      	jsr -60(a6)
    3220:	2f40 00bc      	move.l d0,188(sp)
    3224:	202f 00bc      	move.l 188(sp),d0
    3228:	2f40 00b8      	move.l d0,184(sp)
    322c:	2f7c 0001 7eb7 	move.l #97975,180(sp)
    3232:	00b4 
    3234:	7046           	moveq #70,d0
    3236:	2f40 00b0      	move.l d0,176(sp)
    323a:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3240:	2c40           	movea.l d0,a6
    3242:	222f 00b8      	move.l 184(sp),d1
    3246:	242f 00b4      	move.l 180(sp),d2
    324a:	262f 00b0      	move.l 176(sp),d3
    324e:	4eae ffd0      	jsr -48(a6)
    3252:	2f40 00ac      	move.l d0,172(sp)
      "ZoomCopperlist: Screen section of copper starting on pos 16 messed up\n",
                                                                            70);
  DrawBuffer = (ULONG *) 0x40000;
    3256:	23fc 0004 0000 	move.l #262144,28334 <DrawBuffer>
    325c:	0002 8334 
  ViewBuffer = (ULONG *) 0x50000;
    3260:	23fc 0005 0000 	move.l #327680,28338 <ViewBuffer>
    3266:	0002 8338 
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    326a:	2239 0002 833c 	move.l 2833c <DrawCopper>,d1
    3270:	2039 0002 8334 	move.l 28334 <DrawBuffer>,d0
    3276:	2f01           	move.l d1,-(sp)
    3278:	2f00           	move.l d0,-(sp)
    327a:	4eba edd2      	jsr 204e <Zoom_SetBplPointers>(pc)
    327e:	508f           	addq.l #8,sp
  Zoom_SwapBuffers();
    3280:	4eba ee4a      	jsr 20cc <Zoom_SwapBuffers>(pc)
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    3284:	2039 0002 8334 	move.l 28334 <DrawBuffer>,d0
    328a:	0c80 0005 0000 	cmpi.l #327680,d0
    3290:	660e           	bne.s 32a0 <ZoomTestDisplay+0x120>
    3292:	2039 0002 8338 	move.l 28338 <ViewBuffer>,d0
    3298:	0c80 0004 0000 	cmpi.l #262144,d0
    329e:	6742           	beq.s 32e2 <ZoomTestDisplay+0x162>
    Write( Output(), 
    32a0:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    32a6:	2c40           	movea.l d0,a6
    32a8:	4eae ffc4      	jsr -60(a6)
    32ac:	2f40 00a8      	move.l d0,168(sp)
    32b0:	202f 00a8      	move.l 168(sp),d0
    32b4:	2f40 00a4      	move.l d0,164(sp)
    32b8:	2f7c 0001 7efe 	move.l #98046,160(sp)
    32be:	00a0 
    32c0:	703b           	moveq #59,d0
    32c2:	2f40 009c      	move.l d0,156(sp)
    32c6:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    32cc:	2c40           	movea.l d0,a6
    32ce:	222f 00a4      	move.l 164(sp),d1
    32d2:	242f 00a0      	move.l 160(sp),d2
    32d6:	262f 009c      	move.l 156(sp),d3
    32da:	4eae ffd0      	jsr -48(a6)
    32de:	2f40 0098      	move.l d0,152(sp)
            "ZoomCopperlist: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    32e2:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    32e8:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    32ee:	4878 001c      	pea 1c <_start+0x1c>
    32f2:	2f00           	move.l d0,-(sp)
    32f4:	4eba f714      	jsr 2a0a <TestCopperlistPos>(pc)
    32f8:	4fef 000c      	lea 12(sp),sp
    32fc:	4a80           	tst.l d0
    32fe:	6642           	bne.s 3342 <ZoomTestDisplay+0x1c2>
    Write(Output(), 
    3300:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3306:	2c40           	movea.l d0,a6
    3308:	4eae ffc4      	jsr -60(a6)
    330c:	2f40 0094      	move.l d0,148(sp)
    3310:	202f 0094      	move.l 148(sp),d0
    3314:	2f40 0090      	move.l d0,144(sp)
    3318:	2f7c 0001 7f3a 	move.l #98106,140(sp)
    331e:	008c 
    3320:	703c           	moveq #60,d0
    3322:	2f40 0088      	move.l d0,136(sp)
    3326:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    332c:	2c40           	movea.l d0,a6
    332e:	222f 0090      	move.l 144(sp),d1
    3332:	242f 008c      	move.l 140(sp),d2
    3336:	262f 0088      	move.l 136(sp),d3
    333a:	4eae ffd0      	jsr -48(a6)
    333e:	2f40 0084      	move.l d0,132(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    3342:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    3348:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    334e:	4878 001d      	pea 1d <_start+0x1d>
    3352:	2f00           	move.l d0,-(sp)
    3354:	4eba f6b4      	jsr 2a0a <TestCopperlistPos>(pc)
    3358:	4fef 000c      	lea 12(sp),sp
    335c:	4a80           	tst.l d0
    335e:	6642           	bne.s 33a2 <ZoomTestDisplay+0x222>
    Write(Output(), 
    3360:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3366:	2c40           	movea.l d0,a6
    3368:	4eae ffc4      	jsr -60(a6)
    336c:	2f40 0080      	move.l d0,128(sp)
    3370:	202f 0080      	move.l 128(sp),d0
    3374:	2f40 007c      	move.l d0,124(sp)
    3378:	2f7c 0001 7f77 	move.l #98167,120(sp)
    337e:	0078 
    3380:	703c           	moveq #60,d0
    3382:	2f40 0074      	move.l d0,116(sp)
    3386:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    338c:	2c40           	movea.l d0,a6
    338e:	222f 007c      	move.l 124(sp),d1
    3392:	242f 0078      	move.l 120(sp),d2
    3396:	262f 0074      	move.l 116(sp),d3
    339a:	4eae ffd0      	jsr -48(a6)
    339e:	2f40 0070      	move.l d0,112(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1pl should be 00f4\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    33a2:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    33a8:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    33ae:	4878 001e      	pea 1e <_start+0x1e>
    33b2:	2f00           	move.l d0,-(sp)
    33b4:	4eba f654      	jsr 2a0a <TestCopperlistPos>(pc)
    33b8:	4fef 000c      	lea 12(sp),sp
    33bc:	4a80           	tst.l d0
    33be:	6642           	bne.s 3402 <ZoomTestDisplay+0x282>
    Write(Output(), 
    33c0:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    33c6:	2c40           	movea.l d0,a6
    33c8:	4eae ffc4      	jsr -60(a6)
    33cc:	2f40 006c      	move.l d0,108(sp)
    33d0:	202f 006c      	move.l 108(sp),d0
    33d4:	2f40 0068      	move.l d0,104(sp)
    33d8:	2f7c 0001 7fb4 	move.l #98228,100(sp)
    33de:	0064 
    33e0:	703c           	moveq #60,d0
    33e2:	2f40 0060      	move.l d0,96(sp)
    33e6:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    33ec:	2c40           	movea.l d0,a6
    33ee:	222f 0068      	move.l 104(sp),d1
    33f2:	242f 0064      	move.l 100(sp),d2
    33f6:	262f 0060      	move.l 96(sp),d3
    33fa:	4eae ffd0      	jsr -48(a6)
    33fe:	2f40 005c      	move.l d0,92(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    3402:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    3408:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    340e:	4878 001f      	pea 1f <_start+0x1f>
    3412:	2f00           	move.l d0,-(sp)
    3414:	4eba f5f4      	jsr 2a0a <TestCopperlistPos>(pc)
    3418:	4fef 000c      	lea 12(sp),sp
    341c:	4a80           	tst.l d0
    341e:	6642           	bne.s 3462 <ZoomTestDisplay+0x2e2>
    Write(Output(), 
    3420:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3426:	2c40           	movea.l d0,a6
    3428:	4eae ffc4      	jsr -60(a6)
    342c:	2f40 0058      	move.l d0,88(sp)
    3430:	202f 0058      	move.l 88(sp),d0
    3434:	2f40 0054      	move.l d0,84(sp)
    3438:	2f7c 0001 7ff1 	move.l #98289,80(sp)
    343e:	0050 
    3440:	703c           	moveq #60,d0
    3442:	2f40 004c      	move.l d0,76(sp)
    3446:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    344c:	2c40           	movea.l d0,a6
    344e:	222f 0054      	move.l 84(sp),d1
    3452:	242f 0050      	move.l 80(sp),d2
    3456:	262f 004c      	move.l 76(sp),d3
    345a:	4eae ffd0      	jsr -48(a6)
    345e:	2f40 0048      	move.l d0,72(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2pl should be 0034\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    3462:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    3468:	4878 0020      	pea 20 <_start+0x20>
    346c:	4879 0001 a344 	pea 1a344 <ClColor>
    3472:	4878 0026      	pea 26 <_start+0x26>
    3476:	2f00           	move.l d0,-(sp)
    3478:	4eba f552      	jsr 29cc <TestCopperlistBatch>(pc)
    347c:	4fef 0010      	lea 16(sp),sp
    3480:	4a80           	tst.l d0
    3482:	6642           	bne.s 34c6 <ZoomTestDisplay+0x346>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    3484:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    348a:	2c40           	movea.l d0,a6
    348c:	4eae ffc4      	jsr -60(a6)
    3490:	2f40 0044      	move.l d0,68(sp)
    3494:	202f 0044      	move.l 68(sp),d0
    3498:	2f40 0040      	move.l d0,64(sp)
    349c:	2f7c 0001 802e 	move.l #98350,60(sp)
    34a2:	003c 
    34a4:	7025           	moveq #37,d0
    34a6:	2f40 0038      	move.l d0,56(sp)
    34aa:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    34b0:	2c40           	movea.l d0,a6
    34b2:	222f 0040      	move.l 64(sp),d1
    34b6:	242f 003c      	move.l 60(sp),d2
    34ba:	262f 0038      	move.l 56(sp),d3
    34be:	4eae ffd0      	jsr -48(a6)
    34c2:	2f40 0034      	move.l d0,52(sp)

  /*if(  TestCopperlistBatch(  Copperlist1, 71, Cl102ZoomRepeat, 21) == 0)
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36); */
  
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    34c6:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    34cc:	2f00           	move.l d0,-(sp)
    34ce:	4878 000f      	pea f <_start+0xf>
    34d2:	4eba d086      	jsr 55a <Zoom_Shrink102>(pc)
    34d6:	508f           	addq.l #8,sp
  if( TestCopperListZoom102( Copperlist1, 73, Cl102ZoomTest) == 0)
    34d8:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    34de:	4879 0001 b5e4 	pea 1b5e4 <Cl102ZoomTest>
    34e4:	4878 0049      	pea 49 <_start+0x49>
    34e8:	2f00           	move.l d0,-(sp)
    34ea:	4eba 00c4      	jsr 35b0 <TestCopperListZoom102>(pc)
    34ee:	4fef 000c      	lea 12(sp),sp
    34f2:	4a80           	tst.l d0
    34f4:	6642           	bne.s 3538 <ZoomTestDisplay+0x3b8>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    34f6:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    34fc:	2c40           	movea.l d0,a6
    34fe:	4eae ffc4      	jsr -60(a6)
    3502:	2f40 0030      	move.l d0,48(sp)
    3506:	202f 0030      	move.l 48(sp),d0
    350a:	2f40 002c      	move.l d0,44(sp)
    350e:	2f7c 0001 8054 	move.l #98388,40(sp)
    3514:	0028 
    3516:	7025           	moveq #37,d0
    3518:	2f40 0024      	move.l d0,36(sp)
    351c:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3522:	2c40           	movea.l d0,a6
    3524:	222f 002c      	move.l 44(sp),d1
    3528:	242f 0028      	move.l 40(sp),d2
    352c:	262f 0024      	move.l 36(sp),d3
    3530:	4eae ffd0      	jsr -48(a6)
    3534:	2f40 0020      	move.l d0,32(sp)

  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    3538:	2039 0002 832c 	move.l 2832c <Copperlist1>,d0
    353e:	4878 fffe      	pea fffffffe <_end+0xfffd7c62>
    3542:	4878 00bb      	pea bb <WaitBlt+0x7>
    3546:	2f00           	move.l d0,-(sp)
    3548:	4eba f4c0      	jsr 2a0a <TestCopperlistPos>(pc)
    354c:	4fef 000c      	lea 12(sp),sp
    3550:	4a80           	tst.l d0
    3552:	6642           	bne.s 3596 <ZoomTestDisplay+0x416>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    3554:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    355a:	2c40           	movea.l d0,a6
    355c:	4eae ffc4      	jsr -60(a6)
    3560:	2f40 001c      	move.l d0,28(sp)
    3564:	202f 001c      	move.l 28(sp),d0
    3568:	2f40 0018      	move.l d0,24(sp)
    356c:	2f7c 0001 8079 	move.l #98425,20(sp)
    3572:	0014 
    3574:	7032           	moveq #50,d0
    3576:	2f40 0010      	move.l d0,16(sp)
    357a:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3580:	2c40           	movea.l d0,a6
    3582:	222f 0018      	move.l 24(sp),d1
    3586:	242f 0014      	move.l 20(sp),d2
    358a:	262f 0010      	move.l 16(sp),d3
    358e:	4eae ffd0      	jsr -48(a6)
    3592:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    3596:	2f3c 0000 ff00 	move.l #65280,-(sp)
    359c:	4878 031c      	pea 31c <RunDemo+0x6>
    35a0:	4eba cb3e      	jsr e0 <FreeDisplay>(pc)
    35a4:	508f           	addq.l #8,sp

}
    35a6:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    35aa:	4fef 00c8      	lea 200(sp),sp
    35ae:	4e75           	rts

000035b0 <TestCopperListZoom102>:

int TestCopperListZoom102( ULONG *cl2test, UWORD position, 
                                                           ULONG *template4cl) {
    35b0:	598f           	subq.l #4,sp
    35b2:	202f 000c      	move.l 12(sp),d0
    35b6:	3000           	move.w d0,d0
    35b8:	3f40 0002      	move.w d0,2(sp)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    35bc:	7000           	moveq #0,d0
    35be:	302f 0002      	move.w 2(sp),d0
    35c2:	4878 001c      	pea 1c <_start+0x1c>
    35c6:	2f2f 0014      	move.l 20(sp),-(sp)
    35ca:	2f00           	move.l d0,-(sp)
    35cc:	2f2f 0014      	move.l 20(sp),-(sp)
    35d0:	4eba f3fa      	jsr 29cc <TestCopperlistBatch>(pc)
    35d4:	4fef 0010      	lea 16(sp),sp
    35d8:	4a80           	tst.l d0
    35da:	6604           	bne.s 35e0 <TestCopperListZoom102+0x30>
    return 0;
    35dc:	7000           	moveq #0,d0
    35de:	6062           	bra.s 3642 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    35e0:	7078           	moveq #120,d0
    35e2:	d0af 0010      	add.l 16(sp),d0
    35e6:	7200           	moveq #0,d1
    35e8:	322f 0002      	move.w 2(sp),d1
    35ec:	307c 001e      	movea.w #30,a0
    35f0:	d1c1           	adda.l d1,a0
    35f2:	4878 0036      	pea 36 <_start+0x36>
    35f6:	2f00           	move.l d0,-(sp)
    35f8:	2f08           	move.l a0,-(sp)
    35fa:	2f2f 0014      	move.l 20(sp),-(sp)
    35fe:	4eba f3cc      	jsr 29cc <TestCopperlistBatch>(pc)
    3602:	4fef 0010      	lea 16(sp),sp
    3606:	4a80           	tst.l d0
    3608:	6604           	bne.s 360e <TestCopperListZoom102+0x5e>
    return 0;
    360a:	7000           	moveq #0,d0
    360c:	6034           	bra.s 3642 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    360e:	202f 0010      	move.l 16(sp),d0
    3612:	0680 0000 0158 	addi.l #344,d0
    3618:	7200           	moveq #0,d1
    361a:	322f 0002      	move.w 2(sp),d1
    361e:	307c 0056      	movea.w #86,a0
    3622:	d1c1           	adda.l d1,a0
    3624:	4878 001c      	pea 1c <_start+0x1c>
    3628:	2f00           	move.l d0,-(sp)
    362a:	2f08           	move.l a0,-(sp)
    362c:	2f2f 0014      	move.l 20(sp),-(sp)
    3630:	4eba f39a      	jsr 29cc <TestCopperlistBatch>(pc)
    3634:	4fef 0010      	lea 16(sp),sp
    3638:	4a80           	tst.l d0
    363a:	6604           	bne.s 3640 <TestCopperListZoom102+0x90>
    return 0;
    363c:	7000           	moveq #0,d0
    363e:	6002           	bra.s 3642 <TestCopperListZoom102+0x92>
 
  return 1;
    3640:	7001           	moveq #1,d0
}
    3642:	588f           	addq.l #4,sp
    3644:	4e75           	rts

00003646 <TestBlitleftOfZoom>:

void TestBlitleftOfZoom() {
    3646:	4fef ff94      	lea -108(sp),sp
    364a:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Zoom_Init();
    364e:	4eba e000      	jsr 1650 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    3652:	4eba e39e      	jsr 19f2 <PrepareDisplayZoom>(pc)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    3656:	2f7c 0000 c800 	move.l #51200,116(sp)
    365c:	0074 
    365e:	7002           	moveq #2,d0
    3660:	2f40 0070      	move.l d0,112(sp)
    3664:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    366a:	2c40           	movea.l d0,a6
    366c:	202f 0074      	move.l 116(sp),d0
    3670:	222f 0070      	move.l 112(sp),d1
    3674:	4eae ff3a      	jsr -198(a6)
    3678:	2f40 006c      	move.l d0,108(sp)
    367c:	202f 006c      	move.l 108(sp),d0
    3680:	23c0 0002 8374 	move.l d0,28374 <Zoom_Source>
  if( Zoom_Source == 0) {
    3686:	2039 0002 8374 	move.l 28374 <Zoom_Source>,d0
    368c:	6646           	bne.s 36d4 <TestBlitleftOfZoom+0x8e>
    Write(  Output(), 
    368e:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3694:	2c40           	movea.l d0,a6
    3696:	4eae ffc4      	jsr -60(a6)
    369a:	2f40 001c      	move.l d0,28(sp)
    369e:	202f 001c      	move.l 28(sp),d0
    36a2:	2f40 0018      	move.l d0,24(sp)
    36a6:	2f7c 0001 80ac 	move.l #98476,20(sp)
    36ac:	0014 
    36ae:	7236           	moveq #54,d1
    36b0:	2f41 0010      	move.l d1,16(sp)
    36b4:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    36ba:	2c40           	movea.l d0,a6
    36bc:	222f 0018      	move.l 24(sp),d1
    36c0:	242f 0014      	move.l 20(sp),d2
    36c4:	262f 0010      	move.l 16(sp),d3
    36c8:	4eae ffd0      	jsr -48(a6)
    36cc:	2f40 000c      	move.l d0,12(sp)
    36d0:	6000 01fe      	bra.w 38d0 <TestBlitleftOfZoom+0x28a>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  
  UWORD *tstsource = Zoom_Source;
    36d4:	2f79 0002 8374 	move.l 28374 <Zoom_Source>,104(sp)
    36da:	0068 
  *tstsource++ = 0x0000;
    36dc:	202f 0068      	move.l 104(sp),d0
    36e0:	2200           	move.l d0,d1
    36e2:	5481           	addq.l #2,d1
    36e4:	2f41 0068      	move.l d1,104(sp)
    36e8:	2040           	movea.l d0,a0
    36ea:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    36ec:	206f 0068      	movea.l 104(sp),a0
    36f0:	30bc 0080      	move.w #128,(a0)
  tstsource += ZMLINESIZE/2-1;
    36f4:	702e           	moveq #46,d0
    36f6:	d1af 0068      	add.l d0,104(sp)
  *tstsource = 0x1000;
    36fa:	206f 0068      	movea.l 104(sp),a0
    36fe:	30bc 1000      	move.w #4096,(a0)
  tstsource++;
    3702:	54af 0068      	addq.l #2,104(sp)
  *tstsource = 0x8e88;
    3706:	206f 0068      	movea.l 104(sp),a0
    370a:	30bc 8e88      	move.w #-29048,(a0)
  tstsource += ZMLINESIZE/2-1;
    370e:	722e           	moveq #46,d1
    3710:	d3af 0068      	add.l d1,104(sp)

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
    3714:	2039 0002 8374 	move.l 28374 <Zoom_Source>,d0
    371a:	2200           	move.l d0,d1
    371c:	0681 0000 17d0 	addi.l #6096,d1
    3722:	2f41 0068      	move.l d1,104(sp)
  *tstsource++ = 0x0000;
    3726:	202f 0068      	move.l 104(sp),d0
    372a:	2200           	move.l d0,d1
    372c:	5481           	addq.l #2,d1
    372e:	2f41 0068      	move.l d1,104(sp)
    3732:	2040           	movea.l d0,a0
    3734:	4250           	clr.w (a0)
  *tstsource = 0x00ff;
    3736:	206f 0068      	movea.l 104(sp),a0
    373a:	30bc 00ff      	move.w #255,(a0)
  WaitBlit();
    373e:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    3744:	2c40           	movea.l d0,a6
    3746:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    374a:	4eba e41e      	jsr 1b6a <Init_Blit>(pc)
  Init_ZoomBlit( 7, 16, 0);
    374e:	42a7           	clr.l -(sp)
    3750:	4878 0010      	pea 10 <_start+0x10>
    3754:	4878 0007      	pea 7 <_start+0x7>
    3758:	4eba e48c      	jsr 1be6 <Init_ZoomBlit>(pc)
    375c:	4fef 000c      	lea 12(sp),sp
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    3760:	2239 0002 8334 	move.l 28334 <DrawBuffer>,d1
    3766:	2039 0002 8374 	move.l 28374 <Zoom_Source>,d0
    376c:	4878 0080      	pea 80 <_start+0x80>
    3770:	2f01           	move.l d1,-(sp)
    3772:	2f00           	move.l d0,-(sp)
    3774:	4eba da5a      	jsr 11d0 <Zoom_ZoomBlit>(pc)
    3778:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    377c:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    3782:	2c40           	movea.l d0,a6
    3784:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    3788:	2039 0002 8334 	move.l 28334 <DrawBuffer>,d0
    378e:	2200           	move.l d0,d1
    3790:	5481           	addq.l #2,d1
    3792:	2f41 0064      	move.l d1,100(sp)
  if( *destination != 0x0180) {
    3796:	206f 0064      	movea.l 100(sp),a0
    379a:	3010           	move.w (a0),d0
    379c:	0c40 0180      	cmpi.w #384,d0
    37a0:	6742           	beq.s 37e4 <TestBlitleftOfZoom+0x19e>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    37a2:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    37a8:	2c40           	movea.l d0,a6
    37aa:	4eae ffc4      	jsr -60(a6)
    37ae:	2f40 0060      	move.l d0,96(sp)
    37b2:	202f 0060      	move.l 96(sp),d0
    37b6:	2f40 005c      	move.l d0,92(sp)
    37ba:	2f7c 0001 80e4 	move.l #98532,88(sp)
    37c0:	0058 
    37c2:	701c           	moveq #28,d0
    37c4:	2f40 0054      	move.l d0,84(sp)
    37c8:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    37ce:	2c40           	movea.l d0,a6
    37d0:	222f 005c      	move.l 92(sp),d1
    37d4:	242f 0058      	move.l 88(sp),d2
    37d8:	262f 0054      	move.l 84(sp),d3
    37dc:	4eae ffd0      	jsr -48(a6)
    37e0:	2f40 0050      	move.l d0,80(sp)
  }
  destination += ZMLINESIZE/2;
    37e4:	7230           	moveq #48,d1
    37e6:	d3af 0064      	add.l d1,100(sp)
  if( *destination != 0x1d88)
    37ea:	206f 0064      	movea.l 100(sp),a0
    37ee:	3010           	move.w (a0),d0
    37f0:	0c40 1d88      	cmpi.w #7560,d0
    37f4:	6742           	beq.s 3838 <TestBlitleftOfZoom+0x1f2>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    37f6:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    37fc:	2c40           	movea.l d0,a6
    37fe:	4eae ffc4      	jsr -60(a6)
    3802:	2f40 004c      	move.l d0,76(sp)
    3806:	202f 004c      	move.l 76(sp),d0
    380a:	2f40 0048      	move.l d0,72(sp)
    380e:	2f7c 0001 8101 	move.l #98561,68(sp)
    3814:	0044 
    3816:	701c           	moveq #28,d0
    3818:	2f40 0040      	move.l d0,64(sp)
    381c:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3822:	2c40           	movea.l d0,a6
    3824:	222f 0048      	move.l 72(sp),d1
    3828:	242f 0044      	move.l 68(sp),d2
    382c:	262f 0040      	move.l 64(sp),d3
    3830:	4eae ffd0      	jsr -48(a6)
    3834:	2f40 003c      	move.l d0,60(sp)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
    3838:	2039 0002 8334 	move.l 28334 <DrawBuffer>,d0
    383e:	2200           	move.l d0,d1
    3840:	0681 0000 17d0 	addi.l #6096,d1
    3846:	2f41 0064      	move.l d1,100(sp)
  destination++;
    384a:	54af 0064      	addq.l #2,100(sp)
  if( *destination != 0x01ff) {
    384e:	206f 0064      	movea.l 100(sp),a0
    3852:	3010           	move.w (a0),d0
    3854:	0c40 01ff      	cmpi.w #511,d0
    3858:	6742           	beq.s 389c <TestBlitleftOfZoom+0x256>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    385a:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3860:	2c40           	movea.l d0,a6
    3862:	4eae ffc4      	jsr -60(a6)
    3866:	2f40 0038      	move.l d0,56(sp)
    386a:	202f 0038      	move.l 56(sp),d0
    386e:	2f40 0034      	move.l d0,52(sp)
    3872:	2f7c 0001 811e 	move.l #98590,48(sp)
    3878:	0030 
    387a:	701a           	moveq #26,d0
    387c:	2f40 002c      	move.l d0,44(sp)
    3880:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3886:	2c40           	movea.l d0,a6
    3888:	222f 0034      	move.l 52(sp),d1
    388c:	242f 0030      	move.l 48(sp),d2
    3890:	262f 002c      	move.l 44(sp),d3
    3894:	4eae ffd0      	jsr -48(a6)
    3898:	2f40 0028      	move.l d0,40(sp)
  }
  FreeMem( Zoom_Source, 40*256*5);
    389c:	2f79 0002 8374 	move.l 28374 <Zoom_Source>,36(sp)
    38a2:	0024 
    38a4:	2f7c 0000 c800 	move.l #51200,32(sp)
    38aa:	0020 
    38ac:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    38b2:	2c40           	movea.l d0,a6
    38b4:	226f 0024      	movea.l 36(sp),a1
    38b8:	202f 0020      	move.l 32(sp),d0
    38bc:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    38c0:	2f3c 0000 ff00 	move.l #65280,-(sp)
    38c6:	4878 031c      	pea 31c <RunDemo+0x6>
    38ca:	4eba c814      	jsr e0 <FreeDisplay>(pc)
    38ce:	508f           	addq.l #8,sp
}
    38d0:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    38d4:	4fef 006c      	lea 108(sp),sp
    38d8:	4e75           	rts

000038da <TestCopyWord>:

void TestCopyWord() {
    38da:	4fef ff74      	lea -140(sp),sp
    38de:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    38e2:	2f7c 0000 05a0 	move.l #1440,136(sp)
    38e8:	0088 
    38ea:	7002           	moveq #2,d0
    38ec:	2f40 0084      	move.l d0,132(sp)
    38f0:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    38f6:	2c40           	movea.l d0,a6
    38f8:	202f 0088      	move.l 136(sp),d0
    38fc:	222f 0084      	move.l 132(sp),d1
    3900:	4eae ff3a      	jsr -198(a6)
    3904:	2f40 0080      	move.l d0,128(sp)
    3908:	202f 0080      	move.l 128(sp),d0
    390c:	2f40 007c      	move.l d0,124(sp)
  if( source == 0) {
    3910:	6646           	bne.s 3958 <TestCopyWord+0x7e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3912:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3918:	2c40           	movea.l d0,a6
    391a:	4eae ffc4      	jsr -60(a6)
    391e:	2f40 001c      	move.l d0,28(sp)
    3922:	202f 001c      	move.l 28(sp),d0
    3926:	2f40 0018      	move.l d0,24(sp)
    392a:	2f7c 0001 8139 	move.l #98617,20(sp)
    3930:	0014 
    3932:	7235           	moveq #53,d1
    3934:	2f41 0010      	move.l d1,16(sp)
    3938:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    393e:	2c40           	movea.l d0,a6
    3940:	222f 0018      	move.l 24(sp),d1
    3944:	242f 0014      	move.l 20(sp),d2
    3948:	262f 0010      	move.l 16(sp),d3
    394c:	4eae ffd0      	jsr -48(a6)
    3950:	2f40 000c      	move.l d0,12(sp)
    3954:	6000 026c      	bra.w 3bc2 <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    3958:	2f7c 0000 05a0 	move.l #1440,120(sp)
    395e:	0078 
    3960:	7002           	moveq #2,d0
    3962:	2f40 0074      	move.l d0,116(sp)
    3966:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    396c:	2c40           	movea.l d0,a6
    396e:	202f 0078      	move.l 120(sp),d0
    3972:	222f 0074      	move.l 116(sp),d1
    3976:	4eae ff3a      	jsr -198(a6)
    397a:	2f40 0070      	move.l d0,112(sp)
    397e:	202f 0070      	move.l 112(sp),d0
    3982:	2f40 006c      	move.l d0,108(sp)
  if( destination == 0) {
    3986:	6646           	bne.s 39ce <TestCopyWord+0xf4>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3988:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    398e:	2c40           	movea.l d0,a6
    3990:	4eae ffc4      	jsr -60(a6)
    3994:	2f40 0030      	move.l d0,48(sp)
    3998:	202f 0030      	move.l 48(sp),d0
    399c:	2f40 002c      	move.l d0,44(sp)
    39a0:	2f7c 0001 8139 	move.l #98617,40(sp)
    39a6:	0028 
    39a8:	7235           	moveq #53,d1
    39aa:	2f41 0024      	move.l d1,36(sp)
    39ae:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    39b4:	2c40           	movea.l d0,a6
    39b6:	222f 002c      	move.l 44(sp),d1
    39ba:	242f 0028      	move.l 40(sp),d2
    39be:	262f 0024      	move.l 36(sp),d3
    39c2:	4eae ffd0      	jsr -48(a6)
    39c6:	2f40 0020      	move.l d0,32(sp)
    39ca:	6000 01f6      	bra.w 3bc2 <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
    39ce:	2f6f 007c 0094 	move.l 124(sp),148(sp)
  for( int i=0; i<8;i++) {
    39d4:	42af 0090      	clr.l 144(sp)
    39d8:	6000 0086      	bra.w 3a60 <TestCopyWord+0x186>
    *tmp++ = 0;
    39dc:	202f 0094      	move.l 148(sp),d0
    39e0:	2200           	move.l d0,d1
    39e2:	5481           	addq.l #2,d1
    39e4:	2f41 0094      	move.l d1,148(sp)
    39e8:	2040           	movea.l d0,a0
    39ea:	4250           	clr.w (a0)
    *tmp++ = 0xaaaa;
    39ec:	202f 0094      	move.l 148(sp),d0
    39f0:	2200           	move.l d0,d1
    39f2:	5481           	addq.l #2,d1
    39f4:	2f41 0094      	move.l d1,148(sp)
    39f8:	2040           	movea.l d0,a0
    39fa:	30bc aaaa      	move.w #-21846,(a0)
    *tmp++ = 0xaaaa;
    39fe:	202f 0094      	move.l 148(sp),d0
    3a02:	2200           	move.l d0,d1
    3a04:	5481           	addq.l #2,d1
    3a06:	2f41 0094      	move.l d1,148(sp)
    3a0a:	2040           	movea.l d0,a0
    3a0c:	30bc aaaa      	move.w #-21846,(a0)
    *tmp = 0;
    3a10:	206f 0094      	movea.l 148(sp),a0
    3a14:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    3a16:	702a           	moveq #42,d0
    3a18:	d1af 0094      	add.l d0,148(sp)
    *tmp++ = 0;
    3a1c:	202f 0094      	move.l 148(sp),d0
    3a20:	2200           	move.l d0,d1
    3a22:	5481           	addq.l #2,d1
    3a24:	2f41 0094      	move.l d1,148(sp)
    3a28:	2040           	movea.l d0,a0
    3a2a:	4250           	clr.w (a0)
    *tmp++ = 0x5555;
    3a2c:	202f 0094      	move.l 148(sp),d0
    3a30:	2200           	move.l d0,d1
    3a32:	5481           	addq.l #2,d1
    3a34:	2f41 0094      	move.l d1,148(sp)
    3a38:	2040           	movea.l d0,a0
    3a3a:	30bc 5555      	move.w #21845,(a0)
    *tmp++ = 0x5555;
    3a3e:	202f 0094      	move.l 148(sp),d0
    3a42:	2200           	move.l d0,d1
    3a44:	5481           	addq.l #2,d1
    3a46:	2f41 0094      	move.l d1,148(sp)
    3a4a:	2040           	movea.l d0,a0
    3a4c:	30bc 5555      	move.w #21845,(a0)
    *tmp = 0;
    3a50:	206f 0094      	movea.l 148(sp),a0
    3a54:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    3a56:	702a           	moveq #42,d0
    3a58:	d1af 0094      	add.l d0,148(sp)
  for( int i=0; i<8;i++) {
    3a5c:	52af 0090      	addq.l #1,144(sp)
    3a60:	7207           	moveq #7,d1
    3a62:	b2af 0090      	cmp.l 144(sp),d1
    3a66:	6c00 ff74      	bge.w 39dc <TestCopyWord+0x102>
  }
  tmp = destination;
    3a6a:	2f6f 006c 0094 	move.l 108(sp),148(sp)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3a70:	42af 008c      	clr.l 140(sp)
    3a74:	6014           	bra.s 3a8a <TestCopyWord+0x1b0>
    *tmp++ = 0;
    3a76:	202f 0094      	move.l 148(sp),d0
    3a7a:	2200           	move.l d0,d1
    3a7c:	5481           	addq.l #2,d1
    3a7e:	2f41 0094      	move.l d1,148(sp)
    3a82:	2040           	movea.l d0,a0
    3a84:	4250           	clr.w (a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3a86:	52af 008c      	addq.l #1,140(sp)
    3a8a:	0caf 0000 02cf 	cmpi.l #719,140(sp)
    3a90:	008c 
    3a92:	6fe2           	ble.s 3a76 <TestCopyWord+0x19c>
  }

  WaitBlit();
    3a94:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    3a9a:	2c40           	movea.l d0,a6
    3a9c:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
    3aa0:	4eba dbae      	jsr 1650 <Zoom_Init>(pc)
  Init_Copy( 3);
    3aa4:	4878 0003      	pea 3 <_start+0x3>
    3aa8:	4eba e1e0      	jsr 1c8a <Init_Copy>(pc)
    3aac:	588f           	addq.l #4,sp
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
    3aae:	202f 007c      	move.l 124(sp),d0
    3ab2:	5480           	addq.l #2,d0
    3ab4:	4878 0010      	pea 10 <_start+0x10>
    3ab8:	2f2f 0070      	move.l 112(sp),-(sp)
    3abc:	2f00           	move.l d0,-(sp)
    3abe:	4eba d6d2      	jsr 1192 <Zoom_CopyWord>(pc)
    3ac2:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    3ac6:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    3acc:	2c40           	movea.l d0,a6
    3ace:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
    3ad2:	202f 006c      	move.l 108(sp),d0
    3ad6:	5480           	addq.l #2,d0
    3ad8:	2f40 0094      	move.l d0,148(sp)
  if( *tmp != 0x5555) 
    3adc:	206f 0094      	movea.l 148(sp),a0
    3ae0:	3010           	move.w (a0),d0
    3ae2:	0c40 5555      	cmpi.w #21845,d0
    3ae6:	6742           	beq.s 3b2a <TestCopyWord+0x250>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    3ae8:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3aee:	2c40           	movea.l d0,a6
    3af0:	4eae ffc4      	jsr -60(a6)
    3af4:	2f40 0068      	move.l d0,104(sp)
    3af8:	202f 0068      	move.l 104(sp),d0
    3afc:	2f40 0064      	move.l d0,100(sp)
    3b00:	2f7c 0001 816f 	move.l #98671,96(sp)
    3b06:	0060 
    3b08:	721f           	moveq #31,d1
    3b0a:	2f41 005c      	move.l d1,92(sp)
    3b0e:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3b14:	2c40           	movea.l d0,a6
    3b16:	222f 0064      	move.l 100(sp),d1
    3b1a:	242f 0060      	move.l 96(sp),d2
    3b1e:	262f 005c      	move.l 92(sp),d3
    3b22:	4eae ffd0      	jsr -48(a6)
    3b26:	2f40 0058      	move.l d0,88(sp)
  tmp += ZMLINESIZE/2;
    3b2a:	7030           	moveq #48,d0
    3b2c:	d1af 0094      	add.l d0,148(sp)
  if( *tmp != 0xaaaa)
    3b30:	206f 0094      	movea.l 148(sp),a0
    3b34:	3010           	move.w (a0),d0
    3b36:	0c40 aaaa      	cmpi.w #-21846,d0
    3b3a:	6742           	beq.s 3b7e <TestCopyWord+0x2a4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    3b3c:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3b42:	2c40           	movea.l d0,a6
    3b44:	4eae ffc4      	jsr -60(a6)
    3b48:	2f40 0054      	move.l d0,84(sp)
    3b4c:	202f 0054      	move.l 84(sp),d0
    3b50:	2f40 0050      	move.l d0,80(sp)
    3b54:	2f7c 0001 818f 	move.l #98703,76(sp)
    3b5a:	004c 
    3b5c:	7220           	moveq #32,d1
    3b5e:	2f41 0048      	move.l d1,72(sp)
    3b62:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3b68:	2c40           	movea.l d0,a6
    3b6a:	222f 0050      	move.l 80(sp),d1
    3b6e:	242f 004c      	move.l 76(sp),d2
    3b72:	262f 0048      	move.l 72(sp),d3
    3b76:	4eae ffd0      	jsr -48(a6)
    3b7a:	2f40 0044      	move.l d0,68(sp)
  
  FreeMem( source,ZMLINESIZE*30);
    3b7e:	2f6f 007c 0040 	move.l 124(sp),64(sp)
    3b84:	2f7c 0000 05a0 	move.l #1440,60(sp)
    3b8a:	003c 
    3b8c:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    3b92:	2c40           	movea.l d0,a6
    3b94:	226f 0040      	movea.l 64(sp),a1
    3b98:	202f 003c      	move.l 60(sp),d0
    3b9c:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    3ba0:	2f6f 006c 0038 	move.l 108(sp),56(sp)
    3ba6:	2f7c 0000 05a0 	move.l #1440,52(sp)
    3bac:	0034 
    3bae:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    3bb4:	2c40           	movea.l d0,a6
    3bb6:	226f 0038      	movea.l 56(sp),a1
    3bba:	202f 0034      	move.l 52(sp),d0
    3bbe:	4eae ff2e      	jsr -210(a6)
}
    3bc2:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3bc6:	4fef 008c      	lea 140(sp),sp
    3bca:	4e75           	rts

00003bcc <TestZoom4PictureOn5Planes>:
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */


void TestZoom4PictureOn5Planes() {
    3bcc:	4fef ff74      	lea -140(sp),sp
    3bd0:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3bd4:	2f7c 0001 1440 	move.l #70720,102(sp)
    3bda:	0066 
    3bdc:	7002           	moveq #2,d0
    3bde:	2f40 0062      	move.l d0,98(sp)
    3be2:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    3be8:	2c40           	movea.l d0,a6
    3bea:	202f 0066      	move.l 102(sp),d0
    3bee:	222f 0062      	move.l 98(sp),d1
    3bf2:	4eae ff3a      	jsr -198(a6)
    3bf6:	2f40 005e      	move.l d0,94(sp)
    3bfa:	202f 005e      	move.l 94(sp),d0
    3bfe:	2f40 005a      	move.l d0,90(sp)
  if( source == 0) {
    3c02:	6646           	bne.s 3c4a <TestZoom4PictureOn5Planes+0x7e>
    Write(  Output(), 
    3c04:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3c0a:	2c40           	movea.l d0,a6
    3c0c:	4eae ffc4      	jsr -60(a6)
    3c10:	2f40 001e      	move.l d0,30(sp)
    3c14:	202f 001e      	move.l 30(sp),d0
    3c18:	2f40 001a      	move.l d0,26(sp)
    3c1c:	2f7c 0001 81b0 	move.l #98736,22(sp)
    3c22:	0016 
    3c24:	7239           	moveq #57,d1
    3c26:	2f41 0012      	move.l d1,18(sp)
    3c2a:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3c30:	2c40           	movea.l d0,a6
    3c32:	222f 001a      	move.l 26(sp),d1
    3c36:	242f 0016      	move.l 22(sp),d2
    3c3a:	262f 0012      	move.l 18(sp),d3
    3c3e:	4eae ffd0      	jsr -48(a6)
    3c42:	2f40 000e      	move.l d0,14(sp)
    3c46:	6000 0266      	bra.w 3eae <TestZoom4PictureOn5Planes+0x2e2>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3c4a:	2f7c 0001 1440 	move.l #70720,86(sp)
    3c50:	0056 
    3c52:	7002           	moveq #2,d0
    3c54:	2f40 0052      	move.l d0,82(sp)
    3c58:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    3c5e:	2c40           	movea.l d0,a6
    3c60:	202f 0056      	move.l 86(sp),d0
    3c64:	222f 0052      	move.l 82(sp),d1
    3c68:	4eae ff3a      	jsr -198(a6)
    3c6c:	2f40 004e      	move.l d0,78(sp)
    3c70:	202f 004e      	move.l 78(sp),d0
    3c74:	2f40 004a      	move.l d0,74(sp)
  if( destination == 0) {
    3c78:	6646           	bne.s 3cc0 <TestZoom4PictureOn5Planes+0xf4>
    Write(  Output(), 
    3c7a:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3c80:	2c40           	movea.l d0,a6
    3c82:	4eae ffc4      	jsr -60(a6)
    3c86:	2f40 0032      	move.l d0,50(sp)
    3c8a:	202f 0032      	move.l 50(sp),d0
    3c8e:	2f40 002e      	move.l d0,46(sp)
    3c92:	2f7c 0001 81ea 	move.l #98794,42(sp)
    3c98:	002a 
    3c9a:	723d           	moveq #61,d1
    3c9c:	2f41 0026      	move.l d1,38(sp)
    3ca0:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3ca6:	2c40           	movea.l d0,a6
    3ca8:	222f 002e      	move.l 46(sp),d1
    3cac:	242f 002a      	move.l 42(sp),d2
    3cb0:	262f 0026      	move.l 38(sp),d3
    3cb4:	4eae ffd0      	jsr -48(a6)
    3cb8:	2f40 0022      	move.l d0,34(sp)
    3cbc:	6000 01f0      	bra.w 3eae <TestZoom4PictureOn5Planes+0x2e2>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3cc0:	2f6f 005a 0094 	move.l 90(sp),148(sp)
  for(int i=0;i<128+8;i++) {
    3cc6:	42af 0090      	clr.l 144(sp)
    3cca:	6050           	bra.s 3d1c <TestZoom4PictureOn5Planes+0x150>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3ccc:	42af 008c      	clr.l 140(sp)
    3cd0:	6018           	bra.s 3cea <TestZoom4PictureOn5Planes+0x11e>
      *tmp4source++ = 0x55555555;
    3cd2:	202f 0094      	move.l 148(sp),d0
    3cd6:	2200           	move.l d0,d1
    3cd8:	5881           	addq.l #4,d1
    3cda:	2f41 0094      	move.l d1,148(sp)
    3cde:	2040           	movea.l d0,a0
    3ce0:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3ce6:	52af 008c      	addq.l #1,140(sp)
    3cea:	703b           	moveq #59,d0
    3cec:	b0af 008c      	cmp.l 140(sp),d0
    3cf0:	6ce0           	bge.s 3cd2 <TestZoom4PictureOn5Planes+0x106>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3cf2:	42af 0088      	clr.l 136(sp)
    3cf6:	6018           	bra.s 3d10 <TestZoom4PictureOn5Planes+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3cf8:	202f 0094      	move.l 148(sp),d0
    3cfc:	2200           	move.l d0,d1
    3cfe:	5881           	addq.l #4,d1
    3d00:	2f41 0094      	move.l d1,148(sp)
    3d04:	2040           	movea.l d0,a0
    3d06:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3d0c:	52af 0088      	addq.l #1,136(sp)
    3d10:	703b           	moveq #59,d0
    3d12:	b0af 0088      	cmp.l 136(sp),d0
    3d16:	6ce0           	bge.s 3cf8 <TestZoom4PictureOn5Planes+0x12c>
  for(int i=0;i<128+8;i++) {
    3d18:	52af 0090      	addq.l #1,144(sp)
    3d1c:	0caf 0000 0087 	cmpi.l #135,144(sp)
    3d22:	0090 
    3d24:	6fa6           	ble.s 3ccc <TestZoom4PictureOn5Planes+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3d26:	4878 0005      	pea 5 <_start+0x5>
    3d2a:	42a7           	clr.l -(sp)
    3d2c:	2f2f 0052      	move.l 82(sp),-(sp)
    3d30:	2f2f 0066      	move.l 102(sp),-(sp)
    3d34:	4eba df8e      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    3d38:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3d3c:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    3d42:	2c40           	movea.l d0,a6
    3d44:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3d48:	222f 004a      	move.l 74(sp),d1
    3d4c:	5881           	addq.l #4,d1
    3d4e:	2f41 0084      	move.l d1,132(sp)
  UWORD *valsupposed = destlinezoom1;
    3d52:	2f7c 0001 b808 	move.l #112648,70(sp)
    3d58:	0046 
  UWORD mask = 0xffff;
    3d5a:	3f7c ffff 0082 	move.w #-1,130(sp)
  for(int i=0;i<14;i++) {
    3d60:	42af 007e      	clr.l 126(sp)
    3d64:	6000 00a8      	bra.w 3e0e <TestZoom4PictureOn5Planes+0x242>
    for(int i2=0;i2<18;i2++) { 
    3d68:	42af 007a      	clr.l 122(sp)
    3d6c:	604e           	bra.s 3dbc <TestZoom4PictureOn5Planes+0x1f0>
      for( int i3=0;i3<5;i3++) {
    3d6e:	42af 0076      	clr.l 118(sp)
    3d72:	6038           	bra.s 3dac <TestZoom4PictureOn5Planes+0x1e0>
        TestRow( valsupposed, valactual, mask, i2+i*19);
    3d74:	222f 007e      	move.l 126(sp),d1
    3d78:	2001           	move.l d1,d0
    3d7a:	e788           	lsl.l #3,d0
    3d7c:	d081           	add.l d1,d0
    3d7e:	d080           	add.l d0,d0
    3d80:	d081           	add.l d1,d0
    3d82:	2200           	move.l d0,d1
    3d84:	d2af 007a      	add.l 122(sp),d1
    3d88:	7000           	moveq #0,d0
    3d8a:	302f 0082      	move.w 130(sp),d0
    3d8e:	2f01           	move.l d1,-(sp)
    3d90:	2f00           	move.l d0,-(sp)
    3d92:	2f2f 008c      	move.l 140(sp),-(sp)
    3d96:	2f2f 0052      	move.l 82(sp),-(sp)
    3d9a:	4eba 2f7e      	jsr 6d1a <TestRow>(pc)
    3d9e:	4fef 0010      	lea 16(sp),sp
        valactual += ZMLINESIZE/2;
    3da2:	7030           	moveq #48,d0
    3da4:	d1af 0084      	add.l d0,132(sp)
      for( int i3=0;i3<5;i3++) {
    3da8:	52af 0076      	addq.l #1,118(sp)
    3dac:	7204           	moveq #4,d1
    3dae:	b2af 0076      	cmp.l 118(sp),d1
    3db2:	6cc0           	bge.s 3d74 <TestZoom4PictureOn5Planes+0x1a8>
      }
      mask = mask ^ 0xffff;
    3db4:	466f 0082      	not.w 130(sp)
    for(int i2=0;i2<18;i2++) { 
    3db8:	52af 007a      	addq.l #1,122(sp)
    3dbc:	7011           	moveq #17,d0
    3dbe:	b0af 007a      	cmp.l 122(sp),d0
    3dc2:	6caa           	bge.s 3d6e <TestZoom4PictureOn5Planes+0x1a2>
    }
    for( int i3=0;i3<5;i3++) {
    3dc4:	42af 0072      	clr.l 114(sp)
    3dc8:	6038           	bra.s 3e02 <TestZoom4PictureOn5Planes+0x236>
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3dca:	222f 007e      	move.l 126(sp),d1
    3dce:	2001           	move.l d1,d0
    3dd0:	e788           	lsl.l #3,d0
    3dd2:	d081           	add.l d1,d0
    3dd4:	d080           	add.l d0,d0
    3dd6:	2040           	movea.l d0,a0
    3dd8:	d1c1           	adda.l d1,a0
    3dda:	41e8 0012      	lea 18(a0),a0
    3dde:	7000           	moveq #0,d0
    3de0:	302f 0082      	move.w 130(sp),d0
    3de4:	2f08           	move.l a0,-(sp)
    3de6:	2f00           	move.l d0,-(sp)
    3de8:	2f2f 008c      	move.l 140(sp),-(sp)
    3dec:	2f2f 0052      	move.l 82(sp),-(sp)
    3df0:	4eba 2f28      	jsr 6d1a <TestRow>(pc)
    3df4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3df8:	7230           	moveq #48,d1
    3dfa:	d3af 0084      	add.l d1,132(sp)
    for( int i3=0;i3<5;i3++) {
    3dfe:	52af 0072      	addq.l #1,114(sp)
    3e02:	7004           	moveq #4,d0
    3e04:	b0af 0072      	cmp.l 114(sp),d0
    3e08:	6cc0           	bge.s 3dca <TestZoom4PictureOn5Planes+0x1fe>
  for(int i=0;i<14;i++) {
    3e0a:	52af 007e      	addq.l #1,126(sp)
    3e0e:	720d           	moveq #13,d1
    3e10:	b2af 007e      	cmp.l 126(sp),d1
    3e14:	6c00 ff52      	bge.w 3d68 <TestZoom4PictureOn5Planes+0x19c>
    }
  }
  for(int i2=0;i2<4;i2++) { 
    3e18:	42af 006e      	clr.l 110(sp)
    3e1c:	6044           	bra.s 3e62 <TestZoom4PictureOn5Planes+0x296>
    for( int i3=0;i3<5;i3++) {
    3e1e:	42af 006a      	clr.l 106(sp)
    3e22:	602e           	bra.s 3e52 <TestZoom4PictureOn5Planes+0x286>
      TestRow( valsupposed, valactual, mask, i2+265);
    3e24:	222f 006e      	move.l 110(sp),d1
    3e28:	0681 0000 0109 	addi.l #265,d1
    3e2e:	7000           	moveq #0,d0
    3e30:	302f 0082      	move.w 130(sp),d0
    3e34:	2f01           	move.l d1,-(sp)
    3e36:	2f00           	move.l d0,-(sp)
    3e38:	2f2f 008c      	move.l 140(sp),-(sp)
    3e3c:	2f2f 0052      	move.l 82(sp),-(sp)
    3e40:	4eba 2ed8      	jsr 6d1a <TestRow>(pc)
    3e44:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3e48:	7030           	moveq #48,d0
    3e4a:	d1af 0084      	add.l d0,132(sp)
    for( int i3=0;i3<5;i3++) {
    3e4e:	52af 006a      	addq.l #1,106(sp)
    3e52:	7204           	moveq #4,d1
    3e54:	b2af 006a      	cmp.l 106(sp),d1
    3e58:	6cca           	bge.s 3e24 <TestZoom4PictureOn5Planes+0x258>
    }
    mask = mask ^ 0xffff;
    3e5a:	466f 0082      	not.w 130(sp)
  for(int i2=0;i2<4;i2++) { 
    3e5e:	52af 006e      	addq.l #1,110(sp)
    3e62:	7003           	moveq #3,d0
    3e64:	b0af 006e      	cmp.l 110(sp),d0
    3e68:	6cb4           	bge.s 3e1e <TestZoom4PictureOn5Planes+0x252>
  } 
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    3e6a:	2f6f 005a 0042 	move.l 90(sp),66(sp)
    3e70:	2f7c 0001 1440 	move.l #70720,62(sp)
    3e76:	003e 
    3e78:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    3e7e:	2c40           	movea.l d0,a6
    3e80:	226f 0042      	movea.l 66(sp),a1
    3e84:	202f 003e      	move.l 62(sp),d0
    3e88:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    3e8c:	2f6f 004a 003a 	move.l 74(sp),58(sp)
    3e92:	2f7c 0001 1440 	move.l #70720,54(sp)
    3e98:	0036 
    3e9a:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    3ea0:	2c40           	movea.l d0,a6
    3ea2:	226f 003a      	movea.l 58(sp),a1
    3ea6:	202f 0036      	move.l 54(sp),d0
    3eaa:	4eae ff2e      	jsr -210(a6)
}
    3eae:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3eb2:	4fef 008c      	lea 140(sp),sp
    3eb6:	4e75           	rts

00003eb8 <TestZoom4Picture>:

void TestZoom4Picture() {
    3eb8:	4fef fe30      	lea -464(sp),sp
    3ebc:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3ec0:	2f7c 0000 3740 	move.l #14144,106(sp)
    3ec6:	006a 
    3ec8:	7002           	moveq #2,d0
    3eca:	2f40 0066      	move.l d0,102(sp)
    3ece:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    3ed4:	2c40           	movea.l d0,a6
    3ed6:	202f 006a      	move.l 106(sp),d0
    3eda:	222f 0066      	move.l 102(sp),d1
    3ede:	4eae ff3a      	jsr -198(a6)
    3ee2:	2f40 0062      	move.l d0,98(sp)
    3ee6:	202f 0062      	move.l 98(sp),d0
    3eea:	2f40 005e      	move.l d0,94(sp)
  if( source == 0) {
    3eee:	6646           	bne.s 3f36 <TestZoom4Picture+0x7e>
    Write(  Output(), 
    3ef0:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3ef6:	2c40           	movea.l d0,a6
    3ef8:	4eae ffc4      	jsr -60(a6)
    3efc:	2f40 001e      	move.l d0,30(sp)
    3f00:	202f 001e      	move.l 30(sp),d0
    3f04:	2f40 001a      	move.l d0,26(sp)
    3f08:	2f7c 0001 81b0 	move.l #98736,22(sp)
    3f0e:	0016 
    3f10:	7239           	moveq #57,d1
    3f12:	2f41 0012      	move.l d1,18(sp)
    3f16:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3f1c:	2c40           	movea.l d0,a6
    3f1e:	222f 001a      	move.l 26(sp),d1
    3f22:	242f 0016      	move.l 22(sp),d2
    3f26:	262f 0012      	move.l 18(sp),d3
    3f2a:	4eae ffd0      	jsr -48(a6)
    3f2e:	2f40 000e      	move.l d0,14(sp)
    3f32:	6000 2ddc      	bra.w 6d10 <TestZoom4Picture+0x2e58>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3f36:	2f7c 0000 3740 	move.l #14144,90(sp)
    3f3c:	005a 
    3f3e:	7002           	moveq #2,d0
    3f40:	2f40 0056      	move.l d0,86(sp)
    3f44:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    3f4a:	2c40           	movea.l d0,a6
    3f4c:	202f 005a      	move.l 90(sp),d0
    3f50:	222f 0056      	move.l 86(sp),d1
    3f54:	4eae ff3a      	jsr -198(a6)
    3f58:	2f40 0052      	move.l d0,82(sp)
    3f5c:	202f 0052      	move.l 82(sp),d0
    3f60:	2f40 004e      	move.l d0,78(sp)
  if( destination == 0) {
    3f64:	6646           	bne.s 3fac <TestZoom4Picture+0xf4>
    Write(  Output(), 
    3f66:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3f6c:	2c40           	movea.l d0,a6
    3f6e:	4eae ffc4      	jsr -60(a6)
    3f72:	2f40 0032      	move.l d0,50(sp)
    3f76:	202f 0032      	move.l 50(sp),d0
    3f7a:	2f40 002e      	move.l d0,46(sp)
    3f7e:	2f7c 0001 81ea 	move.l #98794,42(sp)
    3f84:	002a 
    3f86:	723d           	moveq #61,d1
    3f88:	2f41 0026      	move.l d1,38(sp)
    3f8c:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    3f92:	2c40           	movea.l d0,a6
    3f94:	222f 002e      	move.l 46(sp),d1
    3f98:	242f 002a      	move.l 42(sp),d2
    3f9c:	262f 0026      	move.l 38(sp),d3
    3fa0:	4eae ffd0      	jsr -48(a6)
    3fa4:	2f40 0022      	move.l d0,34(sp)
    3fa8:	6000 2d66      	bra.w 6d10 <TestZoom4Picture+0x2e58>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3fac:	2f6f 005e 01d8 	move.l 94(sp),472(sp)
  for(int i=0;i<128+8;i++) {
    3fb2:	42af 01d4      	clr.l 468(sp)
    3fb6:	6050           	bra.s 4008 <TestZoom4Picture+0x150>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3fb8:	42af 01d0      	clr.l 464(sp)
    3fbc:	6018           	bra.s 3fd6 <TestZoom4Picture+0x11e>
      *tmp4source++ = 0x55555555;
    3fbe:	202f 01d8      	move.l 472(sp),d0
    3fc2:	2200           	move.l d0,d1
    3fc4:	5881           	addq.l #4,d1
    3fc6:	2f41 01d8      	move.l d1,472(sp)
    3fca:	2040           	movea.l d0,a0
    3fcc:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3fd2:	52af 01d0      	addq.l #1,464(sp)
    3fd6:	700b           	moveq #11,d0
    3fd8:	b0af 01d0      	cmp.l 464(sp),d0
    3fdc:	6ce0           	bge.s 3fbe <TestZoom4Picture+0x106>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3fde:	42af 01cc      	clr.l 460(sp)
    3fe2:	6018           	bra.s 3ffc <TestZoom4Picture+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3fe4:	202f 01d8      	move.l 472(sp),d0
    3fe8:	2200           	move.l d0,d1
    3fea:	5881           	addq.l #4,d1
    3fec:	2f41 01d8      	move.l d1,472(sp)
    3ff0:	2040           	movea.l d0,a0
    3ff2:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3ff8:	52af 01cc      	addq.l #1,460(sp)
    3ffc:	700b           	moveq #11,d0
    3ffe:	b0af 01cc      	cmp.l 460(sp),d0
    4002:	6ce0           	bge.s 3fe4 <TestZoom4Picture+0x12c>
  for(int i=0;i<128+8;i++) {
    4004:	52af 01d4      	addq.l #1,468(sp)
    4008:	0caf 0000 0087 	cmpi.l #135,468(sp)
    400e:	01d4 
    4010:	6fa6           	ble.s 3fb8 <TestZoom4Picture+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    4012:	4878 0001      	pea 1 <_start+0x1>
    4016:	42a7           	clr.l -(sp)
    4018:	2f2f 0056      	move.l 86(sp),-(sp)
    401c:	2f2f 006a      	move.l 106(sp),-(sp)
    4020:	4eba dca2      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    4024:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4028:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    402e:	2c40           	movea.l d0,a6
    4030:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    4034:	222f 004e      	move.l 78(sp),d1
    4038:	5881           	addq.l #4,d1
    403a:	2f41 01c8      	move.l d1,456(sp)
  UWORD *valsupposed = destlinezoom1;
    403e:	2f7c 0001 b808 	move.l #112648,74(sp)
    4044:	004a 
  UWORD mask = 0xffff;
    4046:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<14;i++) {
    404c:	42af 01c2      	clr.l 450(sp)
    4050:	6000 0084      	bra.w 40d6 <TestZoom4Picture+0x21e>
    for(int i2=0;i2<18;i2++) { 
    4054:	42af 01be      	clr.l 446(sp)
    4058:	603c           	bra.s 4096 <TestZoom4Picture+0x1de>
      TestRow( valsupposed, valactual, mask, i2+i*19);
    405a:	222f 01c2      	move.l 450(sp),d1
    405e:	2001           	move.l d1,d0
    4060:	e788           	lsl.l #3,d0
    4062:	d081           	add.l d1,d0
    4064:	d080           	add.l d0,d0
    4066:	d081           	add.l d1,d0
    4068:	2200           	move.l d0,d1
    406a:	d2af 01be      	add.l 446(sp),d1
    406e:	7000           	moveq #0,d0
    4070:	302f 01c6      	move.w 454(sp),d0
    4074:	2f01           	move.l d1,-(sp)
    4076:	2f00           	move.l d0,-(sp)
    4078:	2f2f 01d0      	move.l 464(sp),-(sp)
    407c:	2f2f 0056      	move.l 86(sp),-(sp)
    4080:	4eba 2c98      	jsr 6d1a <TestRow>(pc)
    4084:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4088:	7030           	moveq #48,d0
    408a:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    408e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) { 
    4092:	52af 01be      	addq.l #1,446(sp)
    4096:	7211           	moveq #17,d1
    4098:	b2af 01be      	cmp.l 446(sp),d1
    409c:	6cbc           	bge.s 405a <TestZoom4Picture+0x1a2>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    409e:	222f 01c2      	move.l 450(sp),d1
    40a2:	2001           	move.l d1,d0
    40a4:	e788           	lsl.l #3,d0
    40a6:	d081           	add.l d1,d0
    40a8:	d080           	add.l d0,d0
    40aa:	2040           	movea.l d0,a0
    40ac:	d1c1           	adda.l d1,a0
    40ae:	41e8 0012      	lea 18(a0),a0
    40b2:	7000           	moveq #0,d0
    40b4:	302f 01c6      	move.w 454(sp),d0
    40b8:	2f08           	move.l a0,-(sp)
    40ba:	2f00           	move.l d0,-(sp)
    40bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    40c0:	2f2f 0056      	move.l 86(sp),-(sp)
    40c4:	4eba 2c54      	jsr 6d1a <TestRow>(pc)
    40c8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40cc:	7030           	moveq #48,d0
    40ce:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<14;i++) {
    40d2:	52af 01c2      	addq.l #1,450(sp)
    40d6:	720d           	moveq #13,d1
    40d8:	b2af 01c2      	cmp.l 450(sp),d1
    40dc:	6c00 ff76      	bge.w 4054 <TestZoom4Picture+0x19c>
  }

  for(int i2=0;i2<4;i2++) { 
    40e0:	42af 01ba      	clr.l 442(sp)
    40e4:	6032           	bra.s 4118 <TestZoom4Picture+0x260>
    TestRow( valsupposed, valactual, mask, i2+265);
    40e6:	222f 01ba      	move.l 442(sp),d1
    40ea:	0681 0000 0109 	addi.l #265,d1
    40f0:	7000           	moveq #0,d0
    40f2:	302f 01c6      	move.w 454(sp),d0
    40f6:	2f01           	move.l d1,-(sp)
    40f8:	2f00           	move.l d0,-(sp)
    40fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    40fe:	2f2f 0056      	move.l 86(sp),-(sp)
    4102:	4eba 2c16      	jsr 6d1a <TestRow>(pc)
    4106:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    410a:	7030           	moveq #48,d0
    410c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4110:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    4114:	52af 01ba      	addq.l #1,442(sp)
    4118:	7203           	moveq #3,d1
    411a:	b2af 01ba      	cmp.l 442(sp),d1
    411e:	6cc6           	bge.s 40e6 <TestZoom4Picture+0x22e>
  }
  
  UWORD *tmp = source;
    4120:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4126:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    412c:	2f6f 0046 004e 	move.l 70(sp),78(sp)
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    4132:	4878 0001      	pea 1 <_start+0x1>
    4136:	4878 0001      	pea 1 <_start+0x1>
    413a:	2f2f 0056      	move.l 86(sp),-(sp)
    413e:	2f2f 006a      	move.l 106(sp),-(sp)
    4142:	4eba db80      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    4146:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    414a:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    4150:	2c40           	movea.l d0,a6
    4152:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4156:	202f 004e      	move.l 78(sp),d0
    415a:	5880           	addq.l #4,d0
    415c:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom2;
    4160:	2f7c 0001 b834 	move.l #112692,74(sp)
    4166:	004a 
  mask = 0x0000;
    4168:	426f 01c6      	clr.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    416c:	42af 01b6      	clr.l 438(sp)
    4170:	602a           	bra.s 419c <TestZoom4Picture+0x2e4>
    TestRow( valsupposed, valactual, mask, i2);
    4172:	7000           	moveq #0,d0
    4174:	302f 01c6      	move.w 454(sp),d0
    4178:	2f2f 01b6      	move.l 438(sp),-(sp)
    417c:	2f00           	move.l d0,-(sp)
    417e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4182:	2f2f 0056      	move.l 86(sp),-(sp)
    4186:	4eba 2b92      	jsr 6d1a <TestRow>(pc)
    418a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    418e:	7230           	moveq #48,d1
    4190:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4194:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    4198:	52af 01b6      	addq.l #1,438(sp)
    419c:	700a           	moveq #10,d0
    419e:	b0af 01b6      	cmp.l 438(sp),d0
    41a2:	6cce           	bge.s 4172 <TestZoom4Picture+0x2ba>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    41a4:	4878 0008      	pea 8 <_start+0x8>
    41a8:	2f3c 0000 ffff 	move.l #65535,-(sp)
    41ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    41b2:	2f2f 0056      	move.l 86(sp),-(sp)
    41b6:	4eba 2b62      	jsr 6d1a <TestRow>(pc)
    41ba:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    41be:	7230           	moveq #48,d1
    41c0:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 9);
    41c4:	4878 0009      	pea 9 <_start+0x9>
    41c8:	2f3c 0000 ffff 	move.l #65535,-(sp)
    41ce:	2f2f 01d0      	move.l 464(sp),-(sp)
    41d2:	2f2f 0056      	move.l 86(sp),-(sp)
    41d6:	4eba 2b42      	jsr 6d1a <TestRow>(pc)
    41da:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    41de:	7030           	moveq #48,d0
    41e0:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 10);
    41e4:	4878 000a      	pea a <_start+0xa>
    41e8:	42a7           	clr.l -(sp)
    41ea:	2f2f 01d0      	move.l 464(sp),-(sp)
    41ee:	2f2f 0056      	move.l 86(sp),-(sp)
    41f2:	4eba 2b26      	jsr 6d1a <TestRow>(pc)
    41f6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    41fa:	7230           	moveq #48,d1
    41fc:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 11);
    4200:	4878 000b      	pea b <_start+0xb>
    4204:	42a7           	clr.l -(sp)
    4206:	2f2f 01d0      	move.l 464(sp),-(sp)
    420a:	2f2f 0056      	move.l 86(sp),-(sp)
    420e:	4eba 2b0a      	jsr 6d1a <TestRow>(pc)
    4212:	4fef 0010      	lea 16(sp),sp

  valactual += ZMLINESIZE/2;
    4216:	7030           	moveq #48,d0
    4218:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<12;i++) {
    421c:	42af 01b2      	clr.l 434(sp)
    4220:	6000 0118      	bra.w 433a <TestZoom4Picture+0x482>
    for(int i2=0;i2<16;i2++) {  
    4224:	42af 01ae      	clr.l 430(sp)
    4228:	603c           	bra.s 4266 <TestZoom4Picture+0x3ae>
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    422a:	222f 01b2      	move.l 434(sp),d1
    422e:	2001           	move.l d1,d0
    4230:	e988           	lsl.l #4,d0
    4232:	d081           	add.l d1,d0
    4234:	2040           	movea.l d0,a0
    4236:	d1ef 01ae      	adda.l 430(sp),a0
    423a:	41e8 000b      	lea 11(a0),a0
    423e:	7000           	moveq #0,d0
    4240:	302f 01c6      	move.w 454(sp),d0
    4244:	2f08           	move.l a0,-(sp)
    4246:	2f00           	move.l d0,-(sp)
    4248:	2f2f 01d0      	move.l 464(sp),-(sp)
    424c:	2f2f 0056      	move.l 86(sp),-(sp)
    4250:	4eba 2ac8      	jsr 6d1a <TestRow>(pc)
    4254:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4258:	7230           	moveq #48,d1
    425a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    425e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {  
    4262:	52af 01ae      	addq.l #1,430(sp)
    4266:	700f           	moveq #15,d0
    4268:	b0af 01ae      	cmp.l 430(sp),d0
    426c:	6cbc           	bge.s 422a <TestZoom4Picture+0x372>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    426e:	222f 01b2      	move.l 434(sp),d1
    4272:	2001           	move.l d1,d0
    4274:	e988           	lsl.l #4,d0
    4276:	2040           	movea.l d0,a0
    4278:	d1c1           	adda.l d1,a0
    427a:	41e8 0018      	lea 24(a0),a0
    427e:	7000           	moveq #0,d0
    4280:	302f 01c6      	move.w 454(sp),d0
    4284:	2f08           	move.l a0,-(sp)
    4286:	2f00           	move.l d0,-(sp)
    4288:	2f2f 01d0      	move.l 464(sp),-(sp)
    428c:	2f2f 0056      	move.l 86(sp),-(sp)
    4290:	4eba 2a88      	jsr 6d1a <TestRow>(pc)
    4294:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4298:	7230           	moveq #48,d1
    429a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    429e:	222f 01b2      	move.l 434(sp),d1
    42a2:	2001           	move.l d1,d0
    42a4:	e988           	lsl.l #4,d0
    42a6:	2040           	movea.l d0,a0
    42a8:	d1c1           	adda.l d1,a0
    42aa:	41e8 0019      	lea 25(a0),a0
    42ae:	7000           	moveq #0,d0
    42b0:	302f 01c6      	move.w 454(sp),d0
    42b4:	2f08           	move.l a0,-(sp)
    42b6:	2f00           	move.l d0,-(sp)
    42b8:	2f2f 01d0      	move.l 464(sp),-(sp)
    42bc:	2f2f 0056      	move.l 86(sp),-(sp)
    42c0:	4eba 2a58      	jsr 6d1a <TestRow>(pc)
    42c4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    42c8:	7030           	moveq #48,d0
    42ca:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    42ce:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    42d2:	222f 01b2      	move.l 434(sp),d1
    42d6:	2001           	move.l d1,d0
    42d8:	e988           	lsl.l #4,d0
    42da:	2040           	movea.l d0,a0
    42dc:	d1c1           	adda.l d1,a0
    42de:	41e8 001a      	lea 26(a0),a0
    42e2:	7000           	moveq #0,d0
    42e4:	302f 01c6      	move.w 454(sp),d0
    42e8:	2f08           	move.l a0,-(sp)
    42ea:	2f00           	move.l d0,-(sp)
    42ec:	2f2f 01d0      	move.l 464(sp),-(sp)
    42f0:	2f2f 0056      	move.l 86(sp),-(sp)
    42f4:	4eba 2a24      	jsr 6d1a <TestRow>(pc)
    42f8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    42fc:	7230           	moveq #48,d1
    42fe:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    4302:	222f 01b2      	move.l 434(sp),d1
    4306:	2001           	move.l d1,d0
    4308:	e988           	lsl.l #4,d0
    430a:	2040           	movea.l d0,a0
    430c:	d1c1           	adda.l d1,a0
    430e:	41e8 001b      	lea 27(a0),a0
    4312:	7000           	moveq #0,d0
    4314:	302f 01c6      	move.w 454(sp),d0
    4318:	2f08           	move.l a0,-(sp)
    431a:	2f00           	move.l d0,-(sp)
    431c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4320:	2f2f 0056      	move.l 86(sp),-(sp)
    4324:	4eba 29f4      	jsr 6d1a <TestRow>(pc)
    4328:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    432c:	7030           	moveq #48,d0
    432e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4332:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    4336:	52af 01b2      	addq.l #1,434(sp)
    433a:	720b           	moveq #11,d1
    433c:	b2af 01b2      	cmp.l 434(sp),d1
    4340:	6c00 fee2      	bge.w 4224 <TestZoom4Picture+0x36c>
    
  }

  for(int i2=0;i2<15;i2++) { 
    4344:	42af 01aa      	clr.l 426(sp)
    4348:	602a           	bra.s 4374 <TestZoom4Picture+0x4bc>
    TestRow( valsupposed, valactual, mask, i2);
    434a:	7000           	moveq #0,d0
    434c:	302f 01c6      	move.w 454(sp),d0
    4350:	2f2f 01aa      	move.l 426(sp),-(sp)
    4354:	2f00           	move.l d0,-(sp)
    4356:	2f2f 01d0      	move.l 464(sp),-(sp)
    435a:	2f2f 0056      	move.l 86(sp),-(sp)
    435e:	4eba 29ba      	jsr 6d1a <TestRow>(pc)
    4362:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4366:	7030           	moveq #48,d0
    4368:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    436c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<15;i2++) { 
    4370:	52af 01aa      	addq.l #1,426(sp)
    4374:	720e           	moveq #14,d1
    4376:	b2af 01aa      	cmp.l 426(sp),d1
    437a:	6cce           	bge.s 434a <TestZoom4Picture+0x492>
  }

  tmp = source;
    437c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4382:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4388:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    438e:	4878 0001      	pea 1 <_start+0x1>
    4392:	4878 0002      	pea 2 <_start+0x2>
    4396:	2f2f 0056      	move.l 86(sp),-(sp)
    439a:	2f2f 006a      	move.l 106(sp),-(sp)
    439e:	4eba d924      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    43a2:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    43a6:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    43ac:	2c40           	movea.l d0,a6
    43ae:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    43b2:	202f 004e      	move.l 78(sp),d0
    43b6:	5880           	addq.l #4,d0
    43b8:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom3;
    43bc:	2f7c 0001 b860 	move.l #112736,74(sp)
    43c2:	004a 
  mask = 0xffff;
    43c4:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<4;i2++) { 
    43ca:	42af 01a6      	clr.l 422(sp)
    43ce:	602a           	bra.s 43fa <TestZoom4Picture+0x542>
    TestRow( valsupposed, valactual, mask, i2);
    43d0:	7000           	moveq #0,d0
    43d2:	302f 01c6      	move.w 454(sp),d0
    43d6:	2f2f 01a6      	move.l 422(sp),-(sp)
    43da:	2f00           	move.l d0,-(sp)
    43dc:	2f2f 01d0      	move.l 464(sp),-(sp)
    43e0:	2f2f 0056      	move.l 86(sp),-(sp)
    43e4:	4eba 2934      	jsr 6d1a <TestRow>(pc)
    43e8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43ec:	7230           	moveq #48,d1
    43ee:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    43f2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    43f6:	52af 01a6      	addq.l #1,422(sp)
    43fa:	7003           	moveq #3,d0
    43fc:	b0af 01a6      	cmp.l 422(sp),d0
    4400:	6cce           	bge.s 43d0 <TestZoom4Picture+0x518>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    4402:	4878 0004      	pea 4 <_start+0x4>
    4406:	2f3c 0000 ffff 	move.l #65535,-(sp)
    440c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4410:	2f2f 0056      	move.l 86(sp),-(sp)
    4414:	4eba 2904      	jsr 6d1a <TestRow>(pc)
    4418:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    441c:	7230           	moveq #48,d1
    441e:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    4422:	4878 0005      	pea 5 <_start+0x5>
    4426:	2f3c 0000 ffff 	move.l #65535,-(sp)
    442c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4430:	2f2f 0056      	move.l 86(sp),-(sp)
    4434:	4eba 28e4      	jsr 6d1a <TestRow>(pc)
    4438:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    443c:	7030           	moveq #48,d0
    443e:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    4442:	4878 0006      	pea 6 <_start+0x6>
    4446:	42a7           	clr.l -(sp)
    4448:	2f2f 01d0      	move.l 464(sp),-(sp)
    444c:	2f2f 0056      	move.l 86(sp),-(sp)
    4450:	4eba 28c8      	jsr 6d1a <TestRow>(pc)
    4454:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4458:	7230           	moveq #48,d1
    445a:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    445e:	4878 0007      	pea 7 <_start+0x7>
    4462:	42a7           	clr.l -(sp)
    4464:	2f2f 01d0      	move.l 464(sp),-(sp)
    4468:	2f2f 0056      	move.l 86(sp),-(sp)
    446c:	4eba 28ac      	jsr 6d1a <TestRow>(pc)
    4470:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4474:	7030           	moveq #48,d0
    4476:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    447a:	4878 0008      	pea 8 <_start+0x8>
    447e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4484:	2f2f 01d0      	move.l 464(sp),-(sp)
    4488:	2f2f 0056      	move.l 86(sp),-(sp)
    448c:	4eba 288c      	jsr 6d1a <TestRow>(pc)
    4490:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4494:	7230           	moveq #48,d1
    4496:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    449a:	4878 0009      	pea 9 <_start+0x9>
    449e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    44a4:	2f2f 01d0      	move.l 464(sp),-(sp)
    44a8:	2f2f 0056      	move.l 86(sp),-(sp)
    44ac:	4eba 286c      	jsr 6d1a <TestRow>(pc)
    44b0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44b4:	7030           	moveq #48,d0
    44b6:	d1af 01c8      	add.l d0,456(sp)

  mask = 0x0000;
    44ba:	426f 01c6      	clr.w 454(sp)
  for(int i=0;i<12;i++) {
    44be:	42af 01a2      	clr.l 418(sp)
    44c2:	6000 01a6      	bra.w 466a <TestZoom4Picture+0x7b2>
    for(int i2=0;i2<15;i2++) {  
    44c6:	42af 019e      	clr.l 414(sp)
    44ca:	6042           	bra.s 450e <TestZoom4Picture+0x656>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    44cc:	222f 01a2      	move.l 418(sp),d1
    44d0:	2001           	move.l d1,d0
    44d2:	d080           	add.l d0,d0
    44d4:	d081           	add.l d1,d0
    44d6:	2200           	move.l d0,d1
    44d8:	e789           	lsl.l #3,d1
    44da:	9280           	sub.l d0,d1
    44dc:	2041           	movea.l d1,a0
    44de:	d1ef 019e      	adda.l 414(sp),a0
    44e2:	41e8 0009      	lea 9(a0),a0
    44e6:	7000           	moveq #0,d0
    44e8:	302f 01c6      	move.w 454(sp),d0
    44ec:	2f08           	move.l a0,-(sp)
    44ee:	2f00           	move.l d0,-(sp)
    44f0:	2f2f 01d0      	move.l 464(sp),-(sp)
    44f4:	2f2f 0056      	move.l 86(sp),-(sp)
    44f8:	4eba 2820      	jsr 6d1a <TestRow>(pc)
    44fc:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4500:	7230           	moveq #48,d1
    4502:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4506:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {  
    450a:	52af 019e      	addq.l #1,414(sp)
    450e:	700e           	moveq #14,d0
    4510:	b0af 019e      	cmp.l 414(sp),d0
    4514:	6cb6           	bge.s 44cc <TestZoom4Picture+0x614>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    4516:	222f 01a2      	move.l 418(sp),d1
    451a:	2001           	move.l d1,d0
    451c:	d080           	add.l d0,d0
    451e:	d081           	add.l d1,d0
    4520:	2200           	move.l d0,d1
    4522:	e789           	lsl.l #3,d1
    4524:	2041           	movea.l d1,a0
    4526:	91c0           	suba.l d0,a0
    4528:	41e8 0018      	lea 24(a0),a0
    452c:	7000           	moveq #0,d0
    452e:	302f 01c6      	move.w 454(sp),d0
    4532:	2f08           	move.l a0,-(sp)
    4534:	2f00           	move.l d0,-(sp)
    4536:	2f2f 01d0      	move.l 464(sp),-(sp)
    453a:	2f2f 0056      	move.l 86(sp),-(sp)
    453e:	4eba 27da      	jsr 6d1a <TestRow>(pc)
    4542:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4546:	7230           	moveq #48,d1
    4548:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    454c:	222f 01a2      	move.l 418(sp),d1
    4550:	2001           	move.l d1,d0
    4552:	d080           	add.l d0,d0
    4554:	d081           	add.l d1,d0
    4556:	2200           	move.l d0,d1
    4558:	e789           	lsl.l #3,d1
    455a:	2041           	movea.l d1,a0
    455c:	91c0           	suba.l d0,a0
    455e:	41e8 0019      	lea 25(a0),a0
    4562:	7000           	moveq #0,d0
    4564:	302f 01c6      	move.w 454(sp),d0
    4568:	2f08           	move.l a0,-(sp)
    456a:	2f00           	move.l d0,-(sp)
    456c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4570:	2f2f 0056      	move.l 86(sp),-(sp)
    4574:	4eba 27a4      	jsr 6d1a <TestRow>(pc)
    4578:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    457c:	7030           	moveq #48,d0
    457e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4582:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    4586:	222f 01a2      	move.l 418(sp),d1
    458a:	2001           	move.l d1,d0
    458c:	d080           	add.l d0,d0
    458e:	d081           	add.l d1,d0
    4590:	2200           	move.l d0,d1
    4592:	e789           	lsl.l #3,d1
    4594:	2041           	movea.l d1,a0
    4596:	91c0           	suba.l d0,a0
    4598:	41e8 001a      	lea 26(a0),a0
    459c:	7000           	moveq #0,d0
    459e:	302f 01c6      	move.w 454(sp),d0
    45a2:	2f08           	move.l a0,-(sp)
    45a4:	2f00           	move.l d0,-(sp)
    45a6:	2f2f 01d0      	move.l 464(sp),-(sp)
    45aa:	2f2f 0056      	move.l 86(sp),-(sp)
    45ae:	4eba 276a      	jsr 6d1a <TestRow>(pc)
    45b2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    45b6:	7230           	moveq #48,d1
    45b8:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    45bc:	222f 01a2      	move.l 418(sp),d1
    45c0:	2001           	move.l d1,d0
    45c2:	d080           	add.l d0,d0
    45c4:	d081           	add.l d1,d0
    45c6:	2200           	move.l d0,d1
    45c8:	e789           	lsl.l #3,d1
    45ca:	2041           	movea.l d1,a0
    45cc:	91c0           	suba.l d0,a0
    45ce:	41e8 001b      	lea 27(a0),a0
    45d2:	7000           	moveq #0,d0
    45d4:	302f 01c6      	move.w 454(sp),d0
    45d8:	2f08           	move.l a0,-(sp)
    45da:	2f00           	move.l d0,-(sp)
    45dc:	2f2f 01d0      	move.l 464(sp),-(sp)
    45e0:	2f2f 0056      	move.l 86(sp),-(sp)
    45e4:	4eba 2734      	jsr 6d1a <TestRow>(pc)
    45e8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    45ec:	7030           	moveq #48,d0
    45ee:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    45f2:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    45f6:	222f 01a2      	move.l 418(sp),d1
    45fa:	2001           	move.l d1,d0
    45fc:	d080           	add.l d0,d0
    45fe:	d081           	add.l d1,d0
    4600:	2200           	move.l d0,d1
    4602:	e789           	lsl.l #3,d1
    4604:	2041           	movea.l d1,a0
    4606:	91c0           	suba.l d0,a0
    4608:	41e8 001c      	lea 28(a0),a0
    460c:	7000           	moveq #0,d0
    460e:	302f 01c6      	move.w 454(sp),d0
    4612:	2f08           	move.l a0,-(sp)
    4614:	2f00           	move.l d0,-(sp)
    4616:	2f2f 01d0      	move.l 464(sp),-(sp)
    461a:	2f2f 0056      	move.l 86(sp),-(sp)
    461e:	4eba 26fa      	jsr 6d1a <TestRow>(pc)
    4622:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4626:	7230           	moveq #48,d1
    4628:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    462c:	222f 01a2      	move.l 418(sp),d1
    4630:	2001           	move.l d1,d0
    4632:	d080           	add.l d0,d0
    4634:	d081           	add.l d1,d0
    4636:	2200           	move.l d0,d1
    4638:	e789           	lsl.l #3,d1
    463a:	2041           	movea.l d1,a0
    463c:	91c0           	suba.l d0,a0
    463e:	41e8 001d      	lea 29(a0),a0
    4642:	7000           	moveq #0,d0
    4644:	302f 01c6      	move.w 454(sp),d0
    4648:	2f08           	move.l a0,-(sp)
    464a:	2f00           	move.l d0,-(sp)
    464c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4650:	2f2f 0056      	move.l 86(sp),-(sp)
    4654:	4eba 26c4      	jsr 6d1a <TestRow>(pc)
    4658:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    465c:	7030           	moveq #48,d0
    465e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4662:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    4666:	52af 01a2      	addq.l #1,418(sp)
    466a:	720b           	moveq #11,d1
    466c:	b2af 01a2      	cmp.l 418(sp),d1
    4670:	6c00 fe54      	bge.w 44c6 <TestZoom4Picture+0x60e>
  }

  for(int i2=0;i2<8;i2++) {  
    4674:	42af 019a      	clr.l 410(sp)
    4678:	6032           	bra.s 46ac <TestZoom4Picture+0x7f4>
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    467a:	222f 019a      	move.l 410(sp),d1
    467e:	0681 0000 0105 	addi.l #261,d1
    4684:	7000           	moveq #0,d0
    4686:	302f 01c6      	move.w 454(sp),d0
    468a:	2f01           	move.l d1,-(sp)
    468c:	2f00           	move.l d0,-(sp)
    468e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4692:	2f2f 0056      	move.l 86(sp),-(sp)
    4696:	4eba 2682      	jsr 6d1a <TestRow>(pc)
    469a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    469e:	7030           	moveq #48,d0
    46a0:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    46a4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    46a8:	52af 019a      	addq.l #1,410(sp)
    46ac:	7207           	moveq #7,d1
    46ae:	b2af 019a      	cmp.l 410(sp),d1
    46b2:	6cc6           	bge.s 467a <TestZoom4Picture+0x7c2>
  }

  tmp = source;
    46b4:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    46ba:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    46c0:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    46c6:	4878 0001      	pea 1 <_start+0x1>
    46ca:	4878 0003      	pea 3 <_start+0x3>
    46ce:	2f2f 0056      	move.l 86(sp),-(sp)
    46d2:	2f2f 006a      	move.l 106(sp),-(sp)
    46d6:	4eba d5ec      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    46da:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    46de:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    46e4:	2c40           	movea.l d0,a6
    46e6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    46ea:	202f 004e      	move.l 78(sp),d0
    46ee:	5880           	addq.l #4,d0
    46f0:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom4;
    46f4:	2f7c 0001 b88c 	move.l #112780,74(sp)
    46fa:	004a 
  mask = 0x0000;
    46fc:	426f 01c6      	clr.w 454(sp)
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    4700:	4878 0007      	pea 7 <_start+0x7>
    4704:	42a7           	clr.l -(sp)
    4706:	2f2f 01d0      	move.l 464(sp),-(sp)
    470a:	2f2f 0056      	move.l 86(sp),-(sp)
    470e:	4eba 260a      	jsr 6d1a <TestRow>(pc)
    4712:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4716:	7230           	moveq #48,d1
    4718:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    471c:	4878 0008      	pea 8 <_start+0x8>
    4720:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4726:	2f2f 01d0      	move.l 464(sp),-(sp)
    472a:	2f2f 0056      	move.l 86(sp),-(sp)
    472e:	4eba 25ea      	jsr 6d1a <TestRow>(pc)
    4732:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4736:	7030           	moveq #48,d0
    4738:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    473c:	4878 0009      	pea 9 <_start+0x9>
    4740:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4746:	2f2f 01d0      	move.l 464(sp),-(sp)
    474a:	2f2f 0056      	move.l 86(sp),-(sp)
    474e:	4eba 25ca      	jsr 6d1a <TestRow>(pc)
    4752:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4756:	7230           	moveq #48,d1
    4758:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    475c:	4878 0008      	pea 8 <_start+0x8>
    4760:	42a7           	clr.l -(sp)
    4762:	2f2f 01d0      	move.l 464(sp),-(sp)
    4766:	2f2f 0056      	move.l 86(sp),-(sp)
    476a:	4eba 25ae      	jsr 6d1a <TestRow>(pc)
    476e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4772:	7030           	moveq #48,d0
    4774:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    4778:	4878 0009      	pea 9 <_start+0x9>
    477c:	42a7           	clr.l -(sp)
    477e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4782:	2f2f 0056      	move.l 86(sp),-(sp)
    4786:	4eba 2592      	jsr 6d1a <TestRow>(pc)
    478a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    478e:	7230           	moveq #48,d1
    4790:	d3af 01c8      	add.l d1,456(sp)

  mask = 0xffff;
    4794:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<12;i++) {
    479a:	42af 0196      	clr.l 406(sp)
    479e:	6000 0216      	bra.w 49b6 <TestZoom4Picture+0xafe>
    for(int i2=0;i2<14;i2++) {  
    47a2:	42af 0192      	clr.l 402(sp)
    47a6:	6042           	bra.s 47ea <TestZoom4Picture+0x932>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    47a8:	222f 0196      	move.l 406(sp),d1
    47ac:	2001           	move.l d1,d0
    47ae:	d080           	add.l d0,d0
    47b0:	d081           	add.l d1,d0
    47b2:	2200           	move.l d0,d1
    47b4:	e789           	lsl.l #3,d1
    47b6:	9280           	sub.l d0,d1
    47b8:	2041           	movea.l d1,a0
    47ba:	d1ef 0192      	adda.l 402(sp),a0
    47be:	41e8 0009      	lea 9(a0),a0
    47c2:	7000           	moveq #0,d0
    47c4:	302f 01c6      	move.w 454(sp),d0
    47c8:	2f08           	move.l a0,-(sp)
    47ca:	2f00           	move.l d0,-(sp)
    47cc:	2f2f 01d0      	move.l 464(sp),-(sp)
    47d0:	2f2f 0056      	move.l 86(sp),-(sp)
    47d4:	4eba 2544      	jsr 6d1a <TestRow>(pc)
    47d8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    47dc:	7030           	moveq #48,d0
    47de:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    47e2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {  
    47e6:	52af 0192      	addq.l #1,402(sp)
    47ea:	720d           	moveq #13,d1
    47ec:	b2af 0192      	cmp.l 402(sp),d1
    47f0:	6cb6           	bge.s 47a8 <TestZoom4Picture+0x8f0>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    47f2:	222f 0196      	move.l 406(sp),d1
    47f6:	2001           	move.l d1,d0
    47f8:	d080           	add.l d0,d0
    47fa:	d081           	add.l d1,d0
    47fc:	2200           	move.l d0,d1
    47fe:	e789           	lsl.l #3,d1
    4800:	2041           	movea.l d1,a0
    4802:	91c0           	suba.l d0,a0
    4804:	41e8 0018      	lea 24(a0),a0
    4808:	7000           	moveq #0,d0
    480a:	302f 01c6      	move.w 454(sp),d0
    480e:	2f08           	move.l a0,-(sp)
    4810:	2f00           	move.l d0,-(sp)
    4812:	2f2f 01d0      	move.l 464(sp),-(sp)
    4816:	2f2f 0056      	move.l 86(sp),-(sp)
    481a:	4eba 24fe      	jsr 6d1a <TestRow>(pc)
    481e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4822:	7030           	moveq #48,d0
    4824:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    4828:	222f 0196      	move.l 406(sp),d1
    482c:	2001           	move.l d1,d0
    482e:	d080           	add.l d0,d0
    4830:	d081           	add.l d1,d0
    4832:	2200           	move.l d0,d1
    4834:	e789           	lsl.l #3,d1
    4836:	2041           	movea.l d1,a0
    4838:	91c0           	suba.l d0,a0
    483a:	41e8 0019      	lea 25(a0),a0
    483e:	7000           	moveq #0,d0
    4840:	302f 01c6      	move.w 454(sp),d0
    4844:	2f08           	move.l a0,-(sp)
    4846:	2f00           	move.l d0,-(sp)
    4848:	2f2f 01d0      	move.l 464(sp),-(sp)
    484c:	2f2f 0056      	move.l 86(sp),-(sp)
    4850:	4eba 24c8      	jsr 6d1a <TestRow>(pc)
    4854:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4858:	7230           	moveq #48,d1
    485a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    485e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    4862:	222f 0196      	move.l 406(sp),d1
    4866:	2001           	move.l d1,d0
    4868:	d080           	add.l d0,d0
    486a:	d081           	add.l d1,d0
    486c:	2200           	move.l d0,d1
    486e:	e789           	lsl.l #3,d1
    4870:	2041           	movea.l d1,a0
    4872:	91c0           	suba.l d0,a0
    4874:	41e8 001a      	lea 26(a0),a0
    4878:	7000           	moveq #0,d0
    487a:	302f 01c6      	move.w 454(sp),d0
    487e:	2f08           	move.l a0,-(sp)
    4880:	2f00           	move.l d0,-(sp)
    4882:	2f2f 01d0      	move.l 464(sp),-(sp)
    4886:	2f2f 0056      	move.l 86(sp),-(sp)
    488a:	4eba 248e      	jsr 6d1a <TestRow>(pc)
    488e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4892:	7030           	moveq #48,d0
    4894:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    4898:	222f 0196      	move.l 406(sp),d1
    489c:	2001           	move.l d1,d0
    489e:	d080           	add.l d0,d0
    48a0:	d081           	add.l d1,d0
    48a2:	2200           	move.l d0,d1
    48a4:	e789           	lsl.l #3,d1
    48a6:	2041           	movea.l d1,a0
    48a8:	91c0           	suba.l d0,a0
    48aa:	41e8 001b      	lea 27(a0),a0
    48ae:	7000           	moveq #0,d0
    48b0:	302f 01c6      	move.w 454(sp),d0
    48b4:	2f08           	move.l a0,-(sp)
    48b6:	2f00           	move.l d0,-(sp)
    48b8:	2f2f 01d0      	move.l 464(sp),-(sp)
    48bc:	2f2f 0056      	move.l 86(sp),-(sp)
    48c0:	4eba 2458      	jsr 6d1a <TestRow>(pc)
    48c4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    48c8:	7230           	moveq #48,d1
    48ca:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    48ce:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    48d2:	222f 0196      	move.l 406(sp),d1
    48d6:	2001           	move.l d1,d0
    48d8:	d080           	add.l d0,d0
    48da:	d081           	add.l d1,d0
    48dc:	2200           	move.l d0,d1
    48de:	e789           	lsl.l #3,d1
    48e0:	2041           	movea.l d1,a0
    48e2:	91c0           	suba.l d0,a0
    48e4:	41e8 001c      	lea 28(a0),a0
    48e8:	7000           	moveq #0,d0
    48ea:	302f 01c6      	move.w 454(sp),d0
    48ee:	2f08           	move.l a0,-(sp)
    48f0:	2f00           	move.l d0,-(sp)
    48f2:	2f2f 01d0      	move.l 464(sp),-(sp)
    48f6:	2f2f 0056      	move.l 86(sp),-(sp)
    48fa:	4eba 241e      	jsr 6d1a <TestRow>(pc)
    48fe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4902:	7030           	moveq #48,d0
    4904:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4908:	222f 0196      	move.l 406(sp),d1
    490c:	2001           	move.l d1,d0
    490e:	d080           	add.l d0,d0
    4910:	d081           	add.l d1,d0
    4912:	2200           	move.l d0,d1
    4914:	e789           	lsl.l #3,d1
    4916:	2041           	movea.l d1,a0
    4918:	91c0           	suba.l d0,a0
    491a:	41e8 001d      	lea 29(a0),a0
    491e:	7000           	moveq #0,d0
    4920:	302f 01c6      	move.w 454(sp),d0
    4924:	2f08           	move.l a0,-(sp)
    4926:	2f00           	move.l d0,-(sp)
    4928:	2f2f 01d0      	move.l 464(sp),-(sp)
    492c:	2f2f 0056      	move.l 86(sp),-(sp)
    4930:	4eba 23e8      	jsr 6d1a <TestRow>(pc)
    4934:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4938:	7230           	moveq #48,d1
    493a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    493e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4942:	222f 0196      	move.l 406(sp),d1
    4946:	2001           	move.l d1,d0
    4948:	d080           	add.l d0,d0
    494a:	d081           	add.l d1,d0
    494c:	2200           	move.l d0,d1
    494e:	e789           	lsl.l #3,d1
    4950:	2041           	movea.l d1,a0
    4952:	91c0           	suba.l d0,a0
    4954:	41e8 001c      	lea 28(a0),a0
    4958:	7000           	moveq #0,d0
    495a:	302f 01c6      	move.w 454(sp),d0
    495e:	2f08           	move.l a0,-(sp)
    4960:	2f00           	move.l d0,-(sp)
    4962:	2f2f 01d0      	move.l 464(sp),-(sp)
    4966:	2f2f 0056      	move.l 86(sp),-(sp)
    496a:	4eba 23ae      	jsr 6d1a <TestRow>(pc)
    496e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4972:	7030           	moveq #48,d0
    4974:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4978:	222f 0196      	move.l 406(sp),d1
    497c:	2001           	move.l d1,d0
    497e:	d080           	add.l d0,d0
    4980:	d081           	add.l d1,d0
    4982:	2200           	move.l d0,d1
    4984:	e789           	lsl.l #3,d1
    4986:	2041           	movea.l d1,a0
    4988:	91c0           	suba.l d0,a0
    498a:	41e8 001d      	lea 29(a0),a0
    498e:	7000           	moveq #0,d0
    4990:	302f 01c6      	move.w 454(sp),d0
    4994:	2f08           	move.l a0,-(sp)
    4996:	2f00           	move.l d0,-(sp)
    4998:	2f2f 01d0      	move.l 464(sp),-(sp)
    499c:	2f2f 0056      	move.l 86(sp),-(sp)
    49a0:	4eba 2378      	jsr 6d1a <TestRow>(pc)
    49a4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    49a8:	7230           	moveq #48,d1
    49aa:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    49ae:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    49b2:	52af 0196      	addq.l #1,406(sp)
    49b6:	700b           	moveq #11,d0
    49b8:	b0af 0196      	cmp.l 406(sp),d0
    49bc:	6c00 fde4      	bge.w 47a2 <TestZoom4Picture+0x8ea>
  }

  TestRow( valsupposed, valactual, mask, 269);
    49c0:	7000           	moveq #0,d0
    49c2:	302f 01c6      	move.w 454(sp),d0
    49c6:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    49ca:	2f00           	move.l d0,-(sp)
    49cc:	2f2f 01d0      	move.l 464(sp),-(sp)
    49d0:	2f2f 0056      	move.l 86(sp),-(sp)
    49d4:	4eba 2344      	jsr 6d1a <TestRow>(pc)
    49d8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49dc:	7230           	moveq #48,d1
    49de:	d3af 01c8      	add.l d1,456(sp)
  
  tmp = source;
    49e2:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    49e8:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    49ee:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    49f4:	4878 0001      	pea 1 <_start+0x1>
    49f8:	4878 0004      	pea 4 <_start+0x4>
    49fc:	2f2f 0056      	move.l 86(sp),-(sp)
    4a00:	2f2f 006a      	move.l 106(sp),-(sp)
    4a04:	4eba d2be      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    4a08:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4a0c:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    4a12:	2c40           	movea.l d0,a6
    4a14:	4eae ff1c      	jsr -228(a6)

  valactual = destination+2; 
    4a18:	202f 004e      	move.l 78(sp),d0
    4a1c:	5880           	addq.l #4,d0
    4a1e:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom5;
    4a22:	2f7c 0001 b8b8 	move.l #112824,74(sp)
    4a28:	004a 
  mask = 0x0000;
    4a2a:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<13;i2++) {  
    4a2e:	42af 018e      	clr.l 398(sp)
    4a32:	602a           	bra.s 4a5e <TestZoom4Picture+0xba6>
    TestRow( valsupposed, valactual, mask, i2);
    4a34:	7000           	moveq #0,d0
    4a36:	302f 01c6      	move.w 454(sp),d0
    4a3a:	2f2f 018e      	move.l 398(sp),-(sp)
    4a3e:	2f00           	move.l d0,-(sp)
    4a40:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a44:	2f2f 0056      	move.l 86(sp),-(sp)
    4a48:	4eba 22d0      	jsr 6d1a <TestRow>(pc)
    4a4c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a50:	7230           	moveq #48,d1
    4a52:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4a56:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4a5a:	52af 018e      	addq.l #1,398(sp)
    4a5e:	700c           	moveq #12,d0
    4a60:	b0af 018e      	cmp.l 398(sp),d0
    4a64:	6cce           	bge.s 4a34 <TestZoom4Picture+0xb7c>
  }

  TestRow( valsupposed, valactual, mask, 12);   
    4a66:	7000           	moveq #0,d0
    4a68:	302f 01c6      	move.w 454(sp),d0
    4a6c:	4878 000c      	pea c <_start+0xc>
    4a70:	2f00           	move.l d0,-(sp)
    4a72:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a76:	2f2f 0056      	move.l 86(sp),-(sp)
    4a7a:	4eba 229e      	jsr 6d1a <TestRow>(pc)
    4a7e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a82:	7230           	moveq #48,d1
    4a84:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 13);
    4a88:	7000           	moveq #0,d0
    4a8a:	302f 01c6      	move.w 454(sp),d0
    4a8e:	4878 000d      	pea d <_start+0xd>
    4a92:	2f00           	move.l d0,-(sp)
    4a94:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a98:	2f2f 0056      	move.l 86(sp),-(sp)
    4a9c:	4eba 227c      	jsr 6d1a <TestRow>(pc)
    4aa0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4aa4:	7030           	moveq #48,d0
    4aa6:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4aaa:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 14);
    4aae:	7000           	moveq #0,d0
    4ab0:	302f 01c6      	move.w 454(sp),d0
    4ab4:	4878 000e      	pea e <_start+0xe>
    4ab8:	2f00           	move.l d0,-(sp)
    4aba:	2f2f 01d0      	move.l 464(sp),-(sp)
    4abe:	2f2f 0056      	move.l 86(sp),-(sp)
    4ac2:	4eba 2256      	jsr 6d1a <TestRow>(pc)
    4ac6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4aca:	7230           	moveq #48,d1
    4acc:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 15);
    4ad0:	7000           	moveq #0,d0
    4ad2:	302f 01c6      	move.w 454(sp),d0
    4ad6:	4878 000f      	pea f <_start+0xf>
    4ada:	2f00           	move.l d0,-(sp)
    4adc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ae0:	2f2f 0056      	move.l 86(sp),-(sp)
    4ae4:	4eba 2234      	jsr 6d1a <TestRow>(pc)
    4ae8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4aec:	7030           	moveq #48,d0
    4aee:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4af2:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 16);
    4af6:	7000           	moveq #0,d0
    4af8:	302f 01c6      	move.w 454(sp),d0
    4afc:	4878 0010      	pea 10 <_start+0x10>
    4b00:	2f00           	move.l d0,-(sp)
    4b02:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b06:	2f2f 0056      	move.l 86(sp),-(sp)
    4b0a:	4eba 220e      	jsr 6d1a <TestRow>(pc)
    4b0e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4b12:	7230           	moveq #48,d1
    4b14:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 17);
    4b18:	7000           	moveq #0,d0
    4b1a:	302f 01c6      	move.w 454(sp),d0
    4b1e:	4878 0011      	pea 11 <_start+0x11>
    4b22:	2f00           	move.l d0,-(sp)
    4b24:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b28:	2f2f 0056      	move.l 86(sp),-(sp)
    4b2c:	4eba 21ec      	jsr 6d1a <TestRow>(pc)
    4b30:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4b34:	7030           	moveq #48,d0
    4b36:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4b3a:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 18);
    4b3e:	7000           	moveq #0,d0
    4b40:	302f 01c6      	move.w 454(sp),d0
    4b44:	4878 0012      	pea 12 <_start+0x12>
    4b48:	2f00           	move.l d0,-(sp)
    4b4a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b4e:	2f2f 0056      	move.l 86(sp),-(sp)
    4b52:	4eba 21c6      	jsr 6d1a <TestRow>(pc)
    4b56:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4b5a:	7230           	moveq #48,d1
    4b5c:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 19);
    4b60:	7000           	moveq #0,d0
    4b62:	302f 01c6      	move.w 454(sp),d0
    4b66:	4878 0013      	pea 13 <_start+0x13>
    4b6a:	2f00           	move.l d0,-(sp)
    4b6c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b70:	2f2f 0056      	move.l 86(sp),-(sp)
    4b74:	4eba 21a4      	jsr 6d1a <TestRow>(pc)
    4b78:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4b7c:	7030           	moveq #48,d0
    4b7e:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4b82:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 20);
    4b86:	7000           	moveq #0,d0
    4b88:	302f 01c6      	move.w 454(sp),d0
    4b8c:	4878 0014      	pea 14 <_start+0x14>
    4b90:	2f00           	move.l d0,-(sp)
    4b92:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b96:	2f2f 0056      	move.l 86(sp),-(sp)
    4b9a:	4eba 217e      	jsr 6d1a <TestRow>(pc)
    4b9e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4ba2:	7230           	moveq #48,d1
    4ba4:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 21);
    4ba8:	7000           	moveq #0,d0
    4baa:	302f 01c6      	move.w 454(sp),d0
    4bae:	4878 0015      	pea 15 <_start+0x15>
    4bb2:	2f00           	move.l d0,-(sp)
    4bb4:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bb8:	2f2f 0056      	move.l 86(sp),-(sp)
    4bbc:	4eba 215c      	jsr 6d1a <TestRow>(pc)
    4bc0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4bc4:	7030           	moveq #48,d0
    4bc6:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4bca:	466f 01c6      	not.w 454(sp)


  for(int i=0;i<10;i++) {
    4bce:	42af 018a      	clr.l 394(sp)
    4bd2:	6000 0286      	bra.w 4e5a <TestZoom4Picture+0xfa2>
    for(int i2=0;i2<13;i2++) {  
    4bd6:	42af 0186      	clr.l 390(sp)
    4bda:	6042           	bra.s 4c1e <TestZoom4Picture+0xd66>
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    4bdc:	222f 018a      	move.l 394(sp),d1
    4be0:	2001           	move.l d1,d0
    4be2:	d080           	add.l d0,d0
    4be4:	d081           	add.l d1,d0
    4be6:	2200           	move.l d0,d1
    4be8:	e789           	lsl.l #3,d1
    4bea:	9280           	sub.l d0,d1
    4bec:	2041           	movea.l d1,a0
    4bee:	d1ef 0186      	adda.l 390(sp),a0
    4bf2:	41e8 0016      	lea 22(a0),a0
    4bf6:	7000           	moveq #0,d0
    4bf8:	302f 01c6      	move.w 454(sp),d0
    4bfc:	2f08           	move.l a0,-(sp)
    4bfe:	2f00           	move.l d0,-(sp)
    4c00:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c04:	2f2f 0056      	move.l 86(sp),-(sp)
    4c08:	4eba 2110      	jsr 6d1a <TestRow>(pc)
    4c0c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4c10:	7230           	moveq #48,d1
    4c12:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4c16:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {  
    4c1a:	52af 0186      	addq.l #1,390(sp)
    4c1e:	700c           	moveq #12,d0
    4c20:	b0af 0186      	cmp.l 390(sp),d0
    4c24:	6cb6           	bge.s 4bdc <TestZoom4Picture+0xd24>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    4c26:	222f 018a      	move.l 394(sp),d1
    4c2a:	2001           	move.l d1,d0
    4c2c:	d080           	add.l d0,d0
    4c2e:	d081           	add.l d1,d0
    4c30:	2200           	move.l d0,d1
    4c32:	e789           	lsl.l #3,d1
    4c34:	2041           	movea.l d1,a0
    4c36:	91c0           	suba.l d0,a0
    4c38:	41e8 0023      	lea 35(a0),a0
    4c3c:	7000           	moveq #0,d0
    4c3e:	302f 01c6      	move.w 454(sp),d0
    4c42:	2f08           	move.l a0,-(sp)
    4c44:	2f00           	move.l d0,-(sp)
    4c46:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c4a:	2f2f 0056      	move.l 86(sp),-(sp)
    4c4e:	4eba 20ca      	jsr 6d1a <TestRow>(pc)
    4c52:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c56:	7230           	moveq #48,d1
    4c58:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    4c5c:	222f 018a      	move.l 394(sp),d1
    4c60:	2001           	move.l d1,d0
    4c62:	d080           	add.l d0,d0
    4c64:	d081           	add.l d1,d0
    4c66:	2200           	move.l d0,d1
    4c68:	e789           	lsl.l #3,d1
    4c6a:	2041           	movea.l d1,a0
    4c6c:	91c0           	suba.l d0,a0
    4c6e:	41e8 0024      	lea 36(a0),a0
    4c72:	7000           	moveq #0,d0
    4c74:	302f 01c6      	move.w 454(sp),d0
    4c78:	2f08           	move.l a0,-(sp)
    4c7a:	2f00           	move.l d0,-(sp)
    4c7c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c80:	2f2f 0056      	move.l 86(sp),-(sp)
    4c84:	4eba 2094      	jsr 6d1a <TestRow>(pc)
    4c88:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c8c:	7030           	moveq #48,d0
    4c8e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c92:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    4c96:	222f 018a      	move.l 394(sp),d1
    4c9a:	2001           	move.l d1,d0
    4c9c:	d080           	add.l d0,d0
    4c9e:	d081           	add.l d1,d0
    4ca0:	2200           	move.l d0,d1
    4ca2:	e789           	lsl.l #3,d1
    4ca4:	2041           	movea.l d1,a0
    4ca6:	91c0           	suba.l d0,a0
    4ca8:	41e8 0025      	lea 37(a0),a0
    4cac:	7000           	moveq #0,d0
    4cae:	302f 01c6      	move.w 454(sp),d0
    4cb2:	2f08           	move.l a0,-(sp)
    4cb4:	2f00           	move.l d0,-(sp)
    4cb6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cba:	2f2f 0056      	move.l 86(sp),-(sp)
    4cbe:	4eba 205a      	jsr 6d1a <TestRow>(pc)
    4cc2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4cc6:	7230           	moveq #48,d1
    4cc8:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    4ccc:	222f 018a      	move.l 394(sp),d1
    4cd0:	2001           	move.l d1,d0
    4cd2:	d080           	add.l d0,d0
    4cd4:	d081           	add.l d1,d0
    4cd6:	2200           	move.l d0,d1
    4cd8:	e789           	lsl.l #3,d1
    4cda:	2041           	movea.l d1,a0
    4cdc:	91c0           	suba.l d0,a0
    4cde:	41e8 0026      	lea 38(a0),a0
    4ce2:	7000           	moveq #0,d0
    4ce4:	302f 01c6      	move.w 454(sp),d0
    4ce8:	2f08           	move.l a0,-(sp)
    4cea:	2f00           	move.l d0,-(sp)
    4cec:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cf0:	2f2f 0056      	move.l 86(sp),-(sp)
    4cf4:	4eba 2024      	jsr 6d1a <TestRow>(pc)
    4cf8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4cfc:	7030           	moveq #48,d0
    4cfe:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4d02:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    4d06:	222f 018a      	move.l 394(sp),d1
    4d0a:	2001           	move.l d1,d0
    4d0c:	d080           	add.l d0,d0
    4d0e:	d081           	add.l d1,d0
    4d10:	2200           	move.l d0,d1
    4d12:	e789           	lsl.l #3,d1
    4d14:	2041           	movea.l d1,a0
    4d16:	91c0           	suba.l d0,a0
    4d18:	41e8 0027      	lea 39(a0),a0
    4d1c:	7000           	moveq #0,d0
    4d1e:	302f 01c6      	move.w 454(sp),d0
    4d22:	2f08           	move.l a0,-(sp)
    4d24:	2f00           	move.l d0,-(sp)
    4d26:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d2a:	2f2f 0056      	move.l 86(sp),-(sp)
    4d2e:	4eba 1fea      	jsr 6d1a <TestRow>(pc)
    4d32:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d36:	7230           	moveq #48,d1
    4d38:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    4d3c:	222f 018a      	move.l 394(sp),d1
    4d40:	2001           	move.l d1,d0
    4d42:	d080           	add.l d0,d0
    4d44:	d081           	add.l d1,d0
    4d46:	2200           	move.l d0,d1
    4d48:	e789           	lsl.l #3,d1
    4d4a:	2041           	movea.l d1,a0
    4d4c:	91c0           	suba.l d0,a0
    4d4e:	41e8 0028      	lea 40(a0),a0
    4d52:	7000           	moveq #0,d0
    4d54:	302f 01c6      	move.w 454(sp),d0
    4d58:	2f08           	move.l a0,-(sp)
    4d5a:	2f00           	move.l d0,-(sp)
    4d5c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d60:	2f2f 0056      	move.l 86(sp),-(sp)
    4d64:	4eba 1fb4      	jsr 6d1a <TestRow>(pc)
    4d68:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d6c:	7030           	moveq #48,d0
    4d6e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4d72:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    4d76:	222f 018a      	move.l 394(sp),d1
    4d7a:	2001           	move.l d1,d0
    4d7c:	d080           	add.l d0,d0
    4d7e:	d081           	add.l d1,d0
    4d80:	2200           	move.l d0,d1
    4d82:	e789           	lsl.l #3,d1
    4d84:	2041           	movea.l d1,a0
    4d86:	91c0           	suba.l d0,a0
    4d88:	41e8 0029      	lea 41(a0),a0
    4d8c:	7000           	moveq #0,d0
    4d8e:	302f 01c6      	move.w 454(sp),d0
    4d92:	2f08           	move.l a0,-(sp)
    4d94:	2f00           	move.l d0,-(sp)
    4d96:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d9a:	2f2f 0056      	move.l 86(sp),-(sp)
    4d9e:	4eba 1f7a      	jsr 6d1a <TestRow>(pc)
    4da2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4da6:	7230           	moveq #48,d1
    4da8:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    4dac:	222f 018a      	move.l 394(sp),d1
    4db0:	2001           	move.l d1,d0
    4db2:	d080           	add.l d0,d0
    4db4:	d081           	add.l d1,d0
    4db6:	2200           	move.l d0,d1
    4db8:	e789           	lsl.l #3,d1
    4dba:	2041           	movea.l d1,a0
    4dbc:	91c0           	suba.l d0,a0
    4dbe:	41e8 002a      	lea 42(a0),a0
    4dc2:	7000           	moveq #0,d0
    4dc4:	302f 01c6      	move.w 454(sp),d0
    4dc8:	2f08           	move.l a0,-(sp)
    4dca:	2f00           	move.l d0,-(sp)
    4dcc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4dd0:	2f2f 0056      	move.l 86(sp),-(sp)
    4dd4:	4eba 1f44      	jsr 6d1a <TestRow>(pc)
    4dd8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ddc:	7030           	moveq #48,d0
    4dde:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4de2:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    4de6:	222f 018a      	move.l 394(sp),d1
    4dea:	2001           	move.l d1,d0
    4dec:	d080           	add.l d0,d0
    4dee:	d081           	add.l d1,d0
    4df0:	2200           	move.l d0,d1
    4df2:	e789           	lsl.l #3,d1
    4df4:	2041           	movea.l d1,a0
    4df6:	91c0           	suba.l d0,a0
    4df8:	41e8 002b      	lea 43(a0),a0
    4dfc:	7000           	moveq #0,d0
    4dfe:	302f 01c6      	move.w 454(sp),d0
    4e02:	2f08           	move.l a0,-(sp)
    4e04:	2f00           	move.l d0,-(sp)
    4e06:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e0a:	2f2f 0056      	move.l 86(sp),-(sp)
    4e0e:	4eba 1f0a      	jsr 6d1a <TestRow>(pc)
    4e12:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e16:	7230           	moveq #48,d1
    4e18:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    4e1c:	222f 018a      	move.l 394(sp),d1
    4e20:	2001           	move.l d1,d0
    4e22:	d080           	add.l d0,d0
    4e24:	d081           	add.l d1,d0
    4e26:	2200           	move.l d0,d1
    4e28:	e789           	lsl.l #3,d1
    4e2a:	2041           	movea.l d1,a0
    4e2c:	91c0           	suba.l d0,a0
    4e2e:	41e8 002c      	lea 44(a0),a0
    4e32:	7000           	moveq #0,d0
    4e34:	302f 01c6      	move.w 454(sp),d0
    4e38:	2f08           	move.l a0,-(sp)
    4e3a:	2f00           	move.l d0,-(sp)
    4e3c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e40:	2f2f 0056      	move.l 86(sp),-(sp)
    4e44:	4eba 1ed4      	jsr 6d1a <TestRow>(pc)
    4e48:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e4c:	7030           	moveq #48,d0
    4e4e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4e52:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<10;i++) {
    4e56:	52af 018a      	addq.l #1,394(sp)
    4e5a:	7209           	moveq #9,d1
    4e5c:	b2af 018a      	cmp.l 394(sp),d1
    4e60:	6c00 fd74      	bge.w 4bd6 <TestZoom4Picture+0xd1e>
  }

  for(int i2=0;i2<13;i2++) {  
    4e64:	42af 0182      	clr.l 386(sp)
    4e68:	6032           	bra.s 4e9c <TestZoom4Picture+0xfe4>
    TestRow( valsupposed, valactual, mask, i2+253);
    4e6a:	222f 0182      	move.l 386(sp),d1
    4e6e:	0681 0000 00fd 	addi.l #253,d1
    4e74:	7000           	moveq #0,d0
    4e76:	302f 01c6      	move.w 454(sp),d0
    4e7a:	2f01           	move.l d1,-(sp)
    4e7c:	2f00           	move.l d0,-(sp)
    4e7e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e82:	2f2f 0056      	move.l 86(sp),-(sp)
    4e86:	4eba 1e92      	jsr 6d1a <TestRow>(pc)
    4e8a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e8e:	7030           	moveq #48,d0
    4e90:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4e94:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4e98:	52af 0182      	addq.l #1,386(sp)
    4e9c:	720c           	moveq #12,d1
    4e9e:	b2af 0182      	cmp.l 386(sp),d1
    4ea2:	6cc6           	bge.s 4e6a <TestZoom4Picture+0xfb2>
  }

  TestRow( valsupposed, valactual, mask, 266);
    4ea4:	7000           	moveq #0,d0
    4ea6:	302f 01c6      	move.w 454(sp),d0
    4eaa:	4878 010a      	pea 10a <FreeDisplay+0x2a>
    4eae:	2f00           	move.l d0,-(sp)
    4eb0:	2f2f 01d0      	move.l 464(sp),-(sp)
    4eb4:	2f2f 0056      	move.l 86(sp),-(sp)
    4eb8:	4eba 1e60      	jsr 6d1a <TestRow>(pc)
    4ebc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4ec0:	7030           	moveq #48,d0
    4ec2:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 267);
    4ec6:	7000           	moveq #0,d0
    4ec8:	302f 01c6      	move.w 454(sp),d0
    4ecc:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    4ed0:	2f00           	move.l d0,-(sp)
    4ed2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ed6:	2f2f 0056      	move.l 86(sp),-(sp)
    4eda:	4eba 1e3e      	jsr 6d1a <TestRow>(pc)
    4ede:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4ee2:	7230           	moveq #48,d1
    4ee4:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4ee8:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 268);
    4eec:	7000           	moveq #0,d0
    4eee:	302f 01c6      	move.w 454(sp),d0
    4ef2:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    4ef6:	2f00           	move.l d0,-(sp)
    4ef8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4efc:	2f2f 0056      	move.l 86(sp),-(sp)
    4f00:	4eba 1e18      	jsr 6d1a <TestRow>(pc)
    4f04:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4f08:	7030           	moveq #48,d0
    4f0a:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 269);
    4f0e:	7000           	moveq #0,d0
    4f10:	302f 01c6      	move.w 454(sp),d0
    4f14:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4f18:	2f00           	move.l d0,-(sp)
    4f1a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f1e:	2f2f 0056      	move.l 86(sp),-(sp)
    4f22:	4eba 1df6      	jsr 6d1a <TestRow>(pc)
    4f26:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4f2a:	7230           	moveq #48,d1
    4f2c:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4f30:	466f 01c6      	not.w 454(sp)

  tmp = source;
    4f34:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4f3a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4f40:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    4f46:	4878 0001      	pea 1 <_start+0x1>
    4f4a:	4878 0005      	pea 5 <_start+0x5>
    4f4e:	2f2f 0056      	move.l 86(sp),-(sp)
    4f52:	2f2f 006a      	move.l 106(sp),-(sp)
    4f56:	4eba cd6c      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    4f5a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4f5e:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    4f64:	2c40           	movea.l d0,a6
    4f66:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4f6a:	202f 004e      	move.l 78(sp),d0
    4f6e:	5880           	addq.l #4,d0
    4f70:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom6;
    4f74:	2f7c 0001 b8e4 	move.l #112868,74(sp)
    4f7a:	004a 
  mask = 0x0000;
    4f7c:	426f 01c6      	clr.w 454(sp)
 
  for(int i2=0;i2<7;i2++) {  
    4f80:	42af 017e      	clr.l 382(sp)
    4f84:	602a           	bra.s 4fb0 <TestZoom4Picture+0x10f8>
    TestRow( valsupposed, valactual, mask, i2);
    4f86:	7000           	moveq #0,d0
    4f88:	302f 01c6      	move.w 454(sp),d0
    4f8c:	2f2f 017e      	move.l 382(sp),-(sp)
    4f90:	2f00           	move.l d0,-(sp)
    4f92:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f96:	2f2f 0056      	move.l 86(sp),-(sp)
    4f9a:	4eba 1d7e      	jsr 6d1a <TestRow>(pc)
    4f9e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4fa2:	7230           	moveq #48,d1
    4fa4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4fa8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    4fac:	52af 017e      	addq.l #1,382(sp)
    4fb0:	7006           	moveq #6,d0
    4fb2:	b0af 017e      	cmp.l 382(sp),d0
    4fb6:	6cce           	bge.s 4f86 <TestZoom4Picture+0x10ce>
  }

  for(int i=0;i<6;i++) {
    4fb8:	42af 017a      	clr.l 378(sp)
    4fbc:	605c           	bra.s 501a <TestZoom4Picture+0x1162>
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    4fbe:	202f 017a      	move.l 378(sp),d0
    4fc2:	d080           	add.l d0,d0
    4fc4:	2200           	move.l d0,d1
    4fc6:	5e81           	addq.l #7,d1
    4fc8:	7000           	moveq #0,d0
    4fca:	302f 01c6      	move.w 454(sp),d0
    4fce:	2f01           	move.l d1,-(sp)
    4fd0:	2f00           	move.l d0,-(sp)
    4fd2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4fd6:	2f2f 0056      	move.l 86(sp),-(sp)
    4fda:	4eba 1d3e      	jsr 6d1a <TestRow>(pc)
    4fde:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4fe2:	7230           	moveq #48,d1
    4fe4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    4fe8:	202f 017a      	move.l 378(sp),d0
    4fec:	5880           	addq.l #4,d0
    4fee:	d080           	add.l d0,d0
    4ff0:	2200           	move.l d0,d1
    4ff2:	7000           	moveq #0,d0
    4ff4:	302f 01c6      	move.w 454(sp),d0
    4ff8:	2f01           	move.l d1,-(sp)
    4ffa:	2f00           	move.l d0,-(sp)
    4ffc:	2f2f 01d0      	move.l 464(sp),-(sp)
    5000:	2f2f 0056      	move.l 86(sp),-(sp)
    5004:	4eba 1d14      	jsr 6d1a <TestRow>(pc)
    5008:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    500c:	7030           	moveq #48,d0
    500e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5012:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<6;i++) {
    5016:	52af 017a      	addq.l #1,378(sp)
    501a:	7205           	moveq #5,d1
    501c:	b2af 017a      	cmp.l 378(sp),d1
    5020:	6c9c           	bge.s 4fbe <TestZoom4Picture+0x1106>
  }

  for(int i=0;i<10;i++) {
    5022:	42af 0176      	clr.l 374(sp)
    5026:	6000 00ce      	bra.w 50f6 <TestZoom4Picture+0x123e>
    for(int i2=0;i2<12;i2++) {  
    502a:	42af 0172      	clr.l 370(sp)
    502e:	6040           	bra.s 5070 <TestZoom4Picture+0x11b8>
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    5030:	307c 0013      	movea.w #19,a0
    5034:	d1ef 0172      	adda.l 370(sp),a0
    5038:	222f 0176      	move.l 374(sp),d1
    503c:	2001           	move.l d1,d0
    503e:	d080           	add.l d0,d0
    5040:	d081           	add.l d1,d0
    5042:	e788           	lsl.l #3,d0
    5044:	2208           	move.l a0,d1
    5046:	d280           	add.l d0,d1
    5048:	7000           	moveq #0,d0
    504a:	302f 01c6      	move.w 454(sp),d0
    504e:	2f01           	move.l d1,-(sp)
    5050:	2f00           	move.l d0,-(sp)
    5052:	2f2f 01d0      	move.l 464(sp),-(sp)
    5056:	2f2f 0056      	move.l 86(sp),-(sp)
    505a:	4eba 1cbe      	jsr 6d1a <TestRow>(pc)
    505e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5062:	7030           	moveq #48,d0
    5064:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5068:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {  
    506c:	52af 0172      	addq.l #1,370(sp)
    5070:	720b           	moveq #11,d1
    5072:	b2af 0172      	cmp.l 370(sp),d1
    5076:	6cb8           	bge.s 5030 <TestZoom4Picture+0x1178>
    }
    for(int i=0;i<6;i++) {
    5078:	42af 016e      	clr.l 366(sp)
    507c:	606c           	bra.s 50ea <TestZoom4Picture+0x1232>
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    507e:	222f 016e      	move.l 366(sp),d1
    5082:	2001           	move.l d1,d0
    5084:	d080           	add.l d0,d0
    5086:	d081           	add.l d1,d0
    5088:	e788           	lsl.l #3,d0
    508a:	2040           	movea.l d0,a0
    508c:	41e8 001f      	lea 31(a0),a0
    5090:	7000           	moveq #0,d0
    5092:	302f 01c6      	move.w 454(sp),d0
    5096:	2f08           	move.l a0,-(sp)
    5098:	2f00           	move.l d0,-(sp)
    509a:	2f2f 01d0      	move.l 464(sp),-(sp)
    509e:	2f2f 0056      	move.l 86(sp),-(sp)
    50a2:	4eba 1c76      	jsr 6d1a <TestRow>(pc)
    50a6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    50aa:	7030           	moveq #48,d0
    50ac:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    50b0:	222f 016e      	move.l 366(sp),d1
    50b4:	2001           	move.l d1,d0
    50b6:	d080           	add.l d0,d0
    50b8:	d081           	add.l d1,d0
    50ba:	e788           	lsl.l #3,d0
    50bc:	2040           	movea.l d0,a0
    50be:	41e8 0020      	lea 32(a0),a0
    50c2:	7000           	moveq #0,d0
    50c4:	302f 01c6      	move.w 454(sp),d0
    50c8:	2f08           	move.l a0,-(sp)
    50ca:	2f00           	move.l d0,-(sp)
    50cc:	2f2f 01d0      	move.l 464(sp),-(sp)
    50d0:	2f2f 0056      	move.l 86(sp),-(sp)
    50d4:	4eba 1c44      	jsr 6d1a <TestRow>(pc)
    50d8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    50dc:	7230           	moveq #48,d1
    50de:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    50e2:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<6;i++) {
    50e6:	52af 016e      	addq.l #1,366(sp)
    50ea:	7005           	moveq #5,d0
    50ec:	b0af 016e      	cmp.l 366(sp),d0
    50f0:	6c8c           	bge.s 507e <TestZoom4Picture+0x11c6>
  for(int i=0;i<10;i++) {
    50f2:	52af 0176      	addq.l #1,374(sp)
    50f6:	7209           	moveq #9,d1
    50f8:	b2af 0176      	cmp.l 374(sp),d1
    50fc:	6c00 ff2c      	bge.w 502a <TestZoom4Picture+0x1172>
    }
  }

  for(int i2=0;i2<11;i2++) {  
    5100:	42af 016a      	clr.l 362(sp)
    5104:	6032           	bra.s 5138 <TestZoom4Picture+0x1280>
    TestRow( valsupposed, valactual, mask, 258+i2);
    5106:	222f 016a      	move.l 362(sp),d1
    510a:	0681 0000 0102 	addi.l #258,d1
    5110:	7000           	moveq #0,d0
    5112:	302f 01c6      	move.w 454(sp),d0
    5116:	2f01           	move.l d1,-(sp)
    5118:	2f00           	move.l d0,-(sp)
    511a:	2f2f 01d0      	move.l 464(sp),-(sp)
    511e:	2f2f 0056      	move.l 86(sp),-(sp)
    5122:	4eba 1bf6      	jsr 6d1a <TestRow>(pc)
    5126:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    512a:	7030           	moveq #48,d0
    512c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5130:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {  
    5134:	52af 016a      	addq.l #1,362(sp)
    5138:	720a           	moveq #10,d1
    513a:	b2af 016a      	cmp.l 362(sp),d1
    513e:	6cc6           	bge.s 5106 <TestZoom4Picture+0x124e>
  }

  tmp = source;
    5140:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5146:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    514c:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    5152:	4878 0001      	pea 1 <_start+0x1>
    5156:	4878 0006      	pea 6 <_start+0x6>
    515a:	2f2f 0056      	move.l 86(sp),-(sp)
    515e:	2f2f 006a      	move.l 106(sp),-(sp)
    5162:	4eba cb60      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    5166:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    516a:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    5170:	2c40           	movea.l d0,a6
    5172:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5176:	202f 004e      	move.l 78(sp),d0
    517a:	5880           	addq.l #4,d0
    517c:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom7;
    5180:	2f7c 0001 b910 	move.l #112912,74(sp)
    5186:	004a 
  mask = 0x0000;
    5188:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    518c:	7000           	moveq #0,d0
    518e:	302f 01c6      	move.w 454(sp),d0
    5192:	42a7           	clr.l -(sp)
    5194:	2f00           	move.l d0,-(sp)
    5196:	2f2f 01d0      	move.l 464(sp),-(sp)
    519a:	2f2f 0056      	move.l 86(sp),-(sp)
    519e:	4eba 1b7a      	jsr 6d1a <TestRow>(pc)
    51a2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    51a6:	7230           	moveq #48,d1
    51a8:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    51ac:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    51b0:	42af 0166      	clr.l 358(sp)
    51b4:	605c           	bra.s 5212 <TestZoom4Picture+0x135a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    51b6:	202f 0166      	move.l 358(sp),d0
    51ba:	d080           	add.l d0,d0
    51bc:	2200           	move.l d0,d1
    51be:	5281           	addq.l #1,d1
    51c0:	7000           	moveq #0,d0
    51c2:	302f 01c6      	move.w 454(sp),d0
    51c6:	2f01           	move.l d1,-(sp)
    51c8:	2f00           	move.l d0,-(sp)
    51ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    51ce:	2f2f 0056      	move.l 86(sp),-(sp)
    51d2:	4eba 1b46      	jsr 6d1a <TestRow>(pc)
    51d6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    51da:	7030           	moveq #48,d0
    51dc:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    51e0:	202f 0166      	move.l 358(sp),d0
    51e4:	5280           	addq.l #1,d0
    51e6:	d080           	add.l d0,d0
    51e8:	2200           	move.l d0,d1
    51ea:	7000           	moveq #0,d0
    51ec:	302f 01c6      	move.w 454(sp),d0
    51f0:	2f01           	move.l d1,-(sp)
    51f2:	2f00           	move.l d0,-(sp)
    51f4:	2f2f 01d0      	move.l 464(sp),-(sp)
    51f8:	2f2f 0056      	move.l 86(sp),-(sp)
    51fc:	4eba 1b1c      	jsr 6d1a <TestRow>(pc)
    5200:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5204:	7230           	moveq #48,d1
    5206:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    520a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    520e:	52af 0166      	addq.l #1,358(sp)
    5212:	7006           	moveq #6,d0
    5214:	b0af 0166      	cmp.l 358(sp),d0
    5218:	6c9c           	bge.s 51b6 <TestZoom4Picture+0x12fe>
  }

  for(int i=0;i<10;i++) {
    521a:	42af 0162      	clr.l 354(sp)
    521e:	6000 00d4      	bra.w 52f4 <TestZoom4Picture+0x143c>
    for(int i2=0;i2<11;i2++) {  
    5222:	42af 015e      	clr.l 350(sp)
    5226:	6042           	bra.s 526a <TestZoom4Picture+0x13b2>
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    5228:	307c 000f      	movea.w #15,a0
    522c:	d1ef 015e      	adda.l 350(sp),a0
    5230:	222f 0162      	move.l 354(sp),d1
    5234:	2001           	move.l d1,d0
    5236:	d080           	add.l d0,d0
    5238:	d081           	add.l d1,d0
    523a:	e788           	lsl.l #3,d0
    523c:	d081           	add.l d1,d0
    523e:	2208           	move.l a0,d1
    5240:	d280           	add.l d0,d1
    5242:	7000           	moveq #0,d0
    5244:	302f 01c6      	move.w 454(sp),d0
    5248:	2f01           	move.l d1,-(sp)
    524a:	2f00           	move.l d0,-(sp)
    524c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5250:	2f2f 0056      	move.l 86(sp),-(sp)
    5254:	4eba 1ac4      	jsr 6d1a <TestRow>(pc)
    5258:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    525c:	7230           	moveq #48,d1
    525e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5262:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {  
    5266:	52af 015e      	addq.l #1,350(sp)
    526a:	700a           	moveq #10,d0
    526c:	b0af 015e      	cmp.l 350(sp),d0
    5270:	6cb6           	bge.s 5228 <TestZoom4Picture+0x1370>
    }
    for(int i=0;i<7;i++) {
    5272:	42af 015a      	clr.l 346(sp)
    5276:	6070           	bra.s 52e8 <TestZoom4Picture+0x1430>
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    5278:	222f 015a      	move.l 346(sp),d1
    527c:	2001           	move.l d1,d0
    527e:	d080           	add.l d0,d0
    5280:	d081           	add.l d1,d0
    5282:	e788           	lsl.l #3,d0
    5284:	2040           	movea.l d0,a0
    5286:	d1c1           	adda.l d1,a0
    5288:	41e8 001a      	lea 26(a0),a0
    528c:	7000           	moveq #0,d0
    528e:	302f 01c6      	move.w 454(sp),d0
    5292:	2f08           	move.l a0,-(sp)
    5294:	2f00           	move.l d0,-(sp)
    5296:	2f2f 01d0      	move.l 464(sp),-(sp)
    529a:	2f2f 0056      	move.l 86(sp),-(sp)
    529e:	4eba 1a7a      	jsr 6d1a <TestRow>(pc)
    52a2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    52a6:	7230           	moveq #48,d1
    52a8:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    52ac:	222f 015a      	move.l 346(sp),d1
    52b0:	2001           	move.l d1,d0
    52b2:	d080           	add.l d0,d0
    52b4:	d081           	add.l d1,d0
    52b6:	e788           	lsl.l #3,d0
    52b8:	2040           	movea.l d0,a0
    52ba:	d1c1           	adda.l d1,a0
    52bc:	41e8 001a      	lea 26(a0),a0
    52c0:	7000           	moveq #0,d0
    52c2:	302f 01c6      	move.w 454(sp),d0
    52c6:	2f08           	move.l a0,-(sp)
    52c8:	2f00           	move.l d0,-(sp)
    52ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    52ce:	2f2f 0056      	move.l 86(sp),-(sp)
    52d2:	4eba 1a46      	jsr 6d1a <TestRow>(pc)
    52d6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    52da:	7030           	moveq #48,d0
    52dc:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    52e0:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<7;i++) {
    52e4:	52af 015a      	addq.l #1,346(sp)
    52e8:	7206           	moveq #6,d1
    52ea:	b2af 015a      	cmp.l 346(sp),d1
    52ee:	6c88           	bge.s 5278 <TestZoom4Picture+0x13c0>
  for(int i=0;i<10;i++) {
    52f0:	52af 0162      	addq.l #1,354(sp)
    52f4:	7009           	moveq #9,d0
    52f6:	b0af 0162      	cmp.l 354(sp),d0
    52fa:	6c00 ff26      	bge.w 5222 <TestZoom4Picture+0x136a>
    }
  }

  for(int i2=0;i2<5;i2++) {  
    52fe:	42af 0156      	clr.l 342(sp)
    5302:	6032           	bra.s 5336 <TestZoom4Picture+0x147e>
    TestRow( valsupposed, valactual, mask, 256+i2);
    5304:	222f 0156      	move.l 342(sp),d1
    5308:	0681 0000 0100 	addi.l #256,d1
    530e:	7000           	moveq #0,d0
    5310:	302f 01c6      	move.w 454(sp),d0
    5314:	2f01           	move.l d1,-(sp)
    5316:	2f00           	move.l d0,-(sp)
    5318:	2f2f 01d0      	move.l 464(sp),-(sp)
    531c:	2f2f 0056      	move.l 86(sp),-(sp)
    5320:	4eba 19f8      	jsr 6d1a <TestRow>(pc)
    5324:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5328:	7230           	moveq #48,d1
    532a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    532e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5332:	52af 0156      	addq.l #1,342(sp)
    5336:	7004           	moveq #4,d0
    5338:	b0af 0156      	cmp.l 342(sp),d0
    533c:	6cc6           	bge.s 5304 <TestZoom4Picture+0x144c>
  }

  tmp = source;
    533e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5344:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    534a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    5350:	4878 0001      	pea 1 <_start+0x1>
    5354:	4878 0007      	pea 7 <_start+0x7>
    5358:	2f2f 0056      	move.l 86(sp),-(sp)
    535c:	2f2f 006a      	move.l 106(sp),-(sp)
    5360:	4eba c962      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    5364:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5368:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    536e:	2c40           	movea.l d0,a6
    5370:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5374:	222f 004e      	move.l 78(sp),d1
    5378:	5881           	addq.l #4,d1
    537a:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom8;
    537e:	2f7c 0001 b93c 	move.l #112956,74(sp)
    5384:	004a 
  mask = 0xffff;
    5386:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    538c:	7000           	moveq #0,d0
    538e:	302f 01c6      	move.w 454(sp),d0
    5392:	42a7           	clr.l -(sp)
    5394:	2f00           	move.l d0,-(sp)
    5396:	2f2f 01d0      	move.l 464(sp),-(sp)
    539a:	2f2f 0056      	move.l 86(sp),-(sp)
    539e:	4eba 197a      	jsr 6d1a <TestRow>(pc)
    53a2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    53a6:	7030           	moveq #48,d0
    53a8:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    53ac:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    53b0:	42af 0152      	clr.l 338(sp)
    53b4:	605c           	bra.s 5412 <TestZoom4Picture+0x155a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    53b6:	202f 0152      	move.l 338(sp),d0
    53ba:	d080           	add.l d0,d0
    53bc:	2200           	move.l d0,d1
    53be:	5281           	addq.l #1,d1
    53c0:	7000           	moveq #0,d0
    53c2:	302f 01c6      	move.w 454(sp),d0
    53c6:	2f01           	move.l d1,-(sp)
    53c8:	2f00           	move.l d0,-(sp)
    53ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    53ce:	2f2f 0056      	move.l 86(sp),-(sp)
    53d2:	4eba 1946      	jsr 6d1a <TestRow>(pc)
    53d6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    53da:	7230           	moveq #48,d1
    53dc:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    53e0:	202f 0152      	move.l 338(sp),d0
    53e4:	5280           	addq.l #1,d0
    53e6:	d080           	add.l d0,d0
    53e8:	2200           	move.l d0,d1
    53ea:	7000           	moveq #0,d0
    53ec:	302f 01c6      	move.w 454(sp),d0
    53f0:	2f01           	move.l d1,-(sp)
    53f2:	2f00           	move.l d0,-(sp)
    53f4:	2f2f 01d0      	move.l 464(sp),-(sp)
    53f8:	2f2f 0056      	move.l 86(sp),-(sp)
    53fc:	4eba 191c      	jsr 6d1a <TestRow>(pc)
    5400:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5404:	7030           	moveq #48,d0
    5406:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    540a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    540e:	52af 0152      	addq.l #1,338(sp)
    5412:	7204           	moveq #4,d1
    5414:	b2af 0152      	cmp.l 338(sp),d1
    5418:	6c9c           	bge.s 53b6 <TestZoom4Picture+0x14fe>
  }

  for(int i=0;i<9;i++) {
    541a:	42af 014e      	clr.l 334(sp)
    541e:	6000 00f0      	bra.w 5510 <TestZoom4Picture+0x1658>
    for(int i2=0;i2<10;i2++) {  
    5422:	42af 014a      	clr.l 330(sp)
    5426:	6046           	bra.s 546e <TestZoom4Picture+0x15b6>
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    5428:	307c 000b      	movea.w #11,a0
    542c:	d1ef 014a      	adda.l 330(sp),a0
    5430:	222f 014e      	move.l 334(sp),d1
    5434:	2001           	move.l d1,d0
    5436:	d080           	add.l d0,d0
    5438:	d081           	add.l d1,d0
    543a:	d080           	add.l d0,d0
    543c:	d080           	add.l d0,d0
    543e:	d081           	add.l d1,d0
    5440:	d080           	add.l d0,d0
    5442:	2208           	move.l a0,d1
    5444:	d280           	add.l d0,d1
    5446:	7000           	moveq #0,d0
    5448:	302f 01c6      	move.w 454(sp),d0
    544c:	2f01           	move.l d1,-(sp)
    544e:	2f00           	move.l d0,-(sp)
    5450:	2f2f 01d0      	move.l 464(sp),-(sp)
    5454:	2f2f 0056      	move.l 86(sp),-(sp)
    5458:	4eba 18c0      	jsr 6d1a <TestRow>(pc)
    545c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5460:	7030           	moveq #48,d0
    5462:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5466:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {  
    546a:	52af 014a      	addq.l #1,330(sp)
    546e:	7209           	moveq #9,d1
    5470:	b2af 014a      	cmp.l 330(sp),d1
    5474:	6cb2           	bge.s 5428 <TestZoom4Picture+0x1570>
    }
    for(int i2=0;i2<8;i2++) {
    5476:	42af 0146      	clr.l 326(sp)
    547a:	6000 0086      	bra.w 5502 <TestZoom4Picture+0x164a>
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    547e:	222f 014e      	move.l 334(sp),d1
    5482:	2001           	move.l d1,d0
    5484:	d080           	add.l d0,d0
    5486:	d081           	add.l d1,d0
    5488:	d080           	add.l d0,d0
    548a:	d080           	add.l d0,d0
    548c:	d081           	add.l d1,d0
    548e:	d080           	add.l d0,d0
    5490:	2040           	movea.l d0,a0
    5492:	41e8 0015      	lea 21(a0),a0
    5496:	2208           	move.l a0,d1
    5498:	d2af 0146      	add.l 326(sp),d1
    549c:	7000           	moveq #0,d0
    549e:	302f 01c6      	move.w 454(sp),d0
    54a2:	2f01           	move.l d1,-(sp)
    54a4:	2f00           	move.l d0,-(sp)
    54a6:	2f2f 01d0      	move.l 464(sp),-(sp)
    54aa:	2f2f 0056      	move.l 86(sp),-(sp)
    54ae:	4eba 186a      	jsr 6d1a <TestRow>(pc)
    54b2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    54b6:	7030           	moveq #48,d0
    54b8:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    54bc:	222f 014e      	move.l 334(sp),d1
    54c0:	2001           	move.l d1,d0
    54c2:	d080           	add.l d0,d0
    54c4:	d081           	add.l d1,d0
    54c6:	d080           	add.l d0,d0
    54c8:	d080           	add.l d0,d0
    54ca:	d081           	add.l d1,d0
    54cc:	d080           	add.l d0,d0
    54ce:	2040           	movea.l d0,a0
    54d0:	41e8 0015      	lea 21(a0),a0
    54d4:	2208           	move.l a0,d1
    54d6:	d2af 0146      	add.l 326(sp),d1
    54da:	7000           	moveq #0,d0
    54dc:	302f 01c6      	move.w 454(sp),d0
    54e0:	2f01           	move.l d1,-(sp)
    54e2:	2f00           	move.l d0,-(sp)
    54e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    54e8:	2f2f 0056      	move.l 86(sp),-(sp)
    54ec:	4eba 182c      	jsr 6d1a <TestRow>(pc)
    54f0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    54f4:	7230           	moveq #48,d1
    54f6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    54fa:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {
    54fe:	52af 0146      	addq.l #1,326(sp)
    5502:	7007           	moveq #7,d0
    5504:	b0af 0146      	cmp.l 326(sp),d0
    5508:	6c00 ff74      	bge.w 547e <TestZoom4Picture+0x15c6>
  for(int i=0;i<9;i++) {
    550c:	52af 014e      	addq.l #1,334(sp)
    5510:	7208           	moveq #8,d1
    5512:	b2af 014e      	cmp.l 334(sp),d1
    5516:	6c00 ff0a      	bge.w 5422 <TestZoom4Picture+0x156a>
    }
  }

  for(int i2=0;i2<10;i2++) {  
    551a:	42af 0142      	clr.l 322(sp)
    551e:	6032           	bra.s 5552 <TestZoom4Picture+0x169a>
    TestRow( valsupposed, valactual, mask, 245+i2);
    5520:	222f 0142      	move.l 322(sp),d1
    5524:	0681 0000 00f5 	addi.l #245,d1
    552a:	7000           	moveq #0,d0
    552c:	302f 01c6      	move.w 454(sp),d0
    5530:	2f01           	move.l d1,-(sp)
    5532:	2f00           	move.l d0,-(sp)
    5534:	2f2f 01d0      	move.l 464(sp),-(sp)
    5538:	2f2f 0056      	move.l 86(sp),-(sp)
    553c:	4eba 17dc      	jsr 6d1a <TestRow>(pc)
    5540:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5544:	7030           	moveq #48,d0
    5546:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    554a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {  
    554e:	52af 0142      	addq.l #1,322(sp)
    5552:	7209           	moveq #9,d1
    5554:	b2af 0142      	cmp.l 322(sp),d1
    5558:	6cc6           	bge.s 5520 <TestZoom4Picture+0x1668>
  }
  for(int i=0;i<7;i++) {
    555a:	42af 013e      	clr.l 318(sp)
    555e:	6064           	bra.s 55c4 <TestZoom4Picture+0x170c>
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    5560:	202f 013e      	move.l 318(sp),d0
    5564:	d080           	add.l d0,d0
    5566:	2200           	move.l d0,d1
    5568:	0681 0000 00ff 	addi.l #255,d1
    556e:	7000           	moveq #0,d0
    5570:	302f 01c6      	move.w 454(sp),d0
    5574:	2f01           	move.l d1,-(sp)
    5576:	2f00           	move.l d0,-(sp)
    5578:	2f2f 01d0      	move.l 464(sp),-(sp)
    557c:	2f2f 0056      	move.l 86(sp),-(sp)
    5580:	4eba 1798      	jsr 6d1a <TestRow>(pc)
    5584:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5588:	7030           	moveq #48,d0
    558a:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    558e:	202f 013e      	move.l 318(sp),d0
    5592:	0680 0000 0080 	addi.l #128,d0
    5598:	d080           	add.l d0,d0
    559a:	2200           	move.l d0,d1
    559c:	7000           	moveq #0,d0
    559e:	302f 01c6      	move.w 454(sp),d0
    55a2:	2f01           	move.l d1,-(sp)
    55a4:	2f00           	move.l d0,-(sp)
    55a6:	2f2f 01d0      	move.l 464(sp),-(sp)
    55aa:	2f2f 0056      	move.l 86(sp),-(sp)
    55ae:	4eba 176a      	jsr 6d1a <TestRow>(pc)
    55b2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    55b6:	7230           	moveq #48,d1
    55b8:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    55bc:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    55c0:	52af 013e      	addq.l #1,318(sp)
    55c4:	7006           	moveq #6,d0
    55c6:	b0af 013e      	cmp.l 318(sp),d0
    55ca:	6c94           	bge.s 5560 <TestZoom4Picture+0x16a8>
  }
  TestRow( valsupposed, valactual, mask, 269);
    55cc:	7000           	moveq #0,d0
    55ce:	302f 01c6      	move.w 454(sp),d0
    55d2:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    55d6:	2f00           	move.l d0,-(sp)
    55d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    55dc:	2f2f 0056      	move.l 86(sp),-(sp)
    55e0:	4eba 1738      	jsr 6d1a <TestRow>(pc)
    55e4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    55e8:	7230           	moveq #48,d1
    55ea:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    55ee:	466f 01c6      	not.w 454(sp)
 
  tmp = source;
    55f2:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    55f8:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    55fe:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    5604:	4878 0001      	pea 1 <_start+0x1>
    5608:	4878 0008      	pea 8 <_start+0x8>
    560c:	2f2f 0056      	move.l 86(sp),-(sp)
    5610:	2f2f 006a      	move.l 106(sp),-(sp)
    5614:	4eba c6ae      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    5618:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    561c:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    5622:	2c40           	movea.l d0,a6
    5624:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5628:	202f 004e      	move.l 78(sp),d0
    562c:	5880           	addq.l #4,d0
    562e:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom9;
    5632:	2f7c 0001 b968 	move.l #113000,74(sp)
    5638:	004a 
  mask = 0x0000;
    563a:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    563e:	7000           	moveq #0,d0
    5640:	302f 01c6      	move.w 454(sp),d0
    5644:	42a7           	clr.l -(sp)
    5646:	2f00           	move.l d0,-(sp)
    5648:	2f2f 01d0      	move.l 464(sp),-(sp)
    564c:	2f2f 0056      	move.l 86(sp),-(sp)
    5650:	4eba 16c8      	jsr 6d1a <TestRow>(pc)
    5654:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5658:	7230           	moveq #48,d1
    565a:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    565e:	466f 01c6      	not.w 454(sp)
  
  for(int i=0;i<3;i++) {
    5662:	42af 013a      	clr.l 314(sp)
    5666:	605c           	bra.s 56c4 <TestZoom4Picture+0x180c>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    5668:	202f 013a      	move.l 314(sp),d0
    566c:	d080           	add.l d0,d0
    566e:	2200           	move.l d0,d1
    5670:	5281           	addq.l #1,d1
    5672:	7000           	moveq #0,d0
    5674:	302f 01c6      	move.w 454(sp),d0
    5678:	2f01           	move.l d1,-(sp)
    567a:	2f00           	move.l d0,-(sp)
    567c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5680:	2f2f 0056      	move.l 86(sp),-(sp)
    5684:	4eba 1694      	jsr 6d1a <TestRow>(pc)
    5688:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    568c:	7030           	moveq #48,d0
    568e:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    5692:	202f 013a      	move.l 314(sp),d0
    5696:	5280           	addq.l #1,d0
    5698:	d080           	add.l d0,d0
    569a:	2200           	move.l d0,d1
    569c:	7000           	moveq #0,d0
    569e:	302f 01c6      	move.w 454(sp),d0
    56a2:	2f01           	move.l d1,-(sp)
    56a4:	2f00           	move.l d0,-(sp)
    56a6:	2f2f 01d0      	move.l 464(sp),-(sp)
    56aa:	2f2f 0056      	move.l 86(sp),-(sp)
    56ae:	4eba 166a      	jsr 6d1a <TestRow>(pc)
    56b2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    56b6:	7230           	moveq #48,d1
    56b8:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    56bc:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    56c0:	52af 013a      	addq.l #1,314(sp)
    56c4:	7002           	moveq #2,d0
    56c6:	b0af 013a      	cmp.l 314(sp),d0
    56ca:	6c9c           	bge.s 5668 <TestZoom4Picture+0x17b0>
  }

  for(int i=0;i<9;i++) {
    56cc:	42af 0136      	clr.l 310(sp)
    56d0:	6000 00ea      	bra.w 57bc <TestZoom4Picture+0x1904>
    for(int i2=0;i2<9;i2++) {  
    56d4:	42af 0132      	clr.l 306(sp)
    56d8:	6044           	bra.s 571e <TestZoom4Picture+0x1866>
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    56da:	307c 000b      	movea.w #11,a0
    56de:	d1ef 0132      	adda.l 306(sp),a0
    56e2:	222f 0136      	move.l 310(sp),d1
    56e6:	2001           	move.l d1,d0
    56e8:	d080           	add.l d0,d0
    56ea:	d081           	add.l d1,d0
    56ec:	2200           	move.l d0,d1
    56ee:	e789           	lsl.l #3,d1
    56f0:	d081           	add.l d1,d0
    56f2:	2208           	move.l a0,d1
    56f4:	d280           	add.l d0,d1
    56f6:	7000           	moveq #0,d0
    56f8:	302f 01c6      	move.w 454(sp),d0
    56fc:	2f01           	move.l d1,-(sp)
    56fe:	2f00           	move.l d0,-(sp)
    5700:	2f2f 01d0      	move.l 464(sp),-(sp)
    5704:	2f2f 0056      	move.l 86(sp),-(sp)
    5708:	4eba 1610      	jsr 6d1a <TestRow>(pc)
    570c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5710:	7230           	moveq #48,d1
    5712:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5716:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {  
    571a:	52af 0132      	addq.l #1,306(sp)
    571e:	7008           	moveq #8,d0
    5720:	b0af 0132      	cmp.l 306(sp),d0
    5724:	6cb4           	bge.s 56da <TestZoom4Picture+0x1822>
    }
    
    for(int i2=0;i2<9;i2++) {
    5726:	42af 012e      	clr.l 302(sp)
    572a:	6000 0082      	bra.w 57ae <TestZoom4Picture+0x18f6>
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    572e:	222f 0136      	move.l 310(sp),d1
    5732:	2001           	move.l d1,d0
    5734:	d080           	add.l d0,d0
    5736:	d081           	add.l d1,d0
    5738:	2200           	move.l d0,d1
    573a:	e789           	lsl.l #3,d1
    573c:	2040           	movea.l d0,a0
    573e:	d1c1           	adda.l d1,a0
    5740:	41e8 0014      	lea 20(a0),a0
    5744:	2208           	move.l a0,d1
    5746:	d2af 012e      	add.l 302(sp),d1
    574a:	7000           	moveq #0,d0
    574c:	302f 01c6      	move.w 454(sp),d0
    5750:	2f01           	move.l d1,-(sp)
    5752:	2f00           	move.l d0,-(sp)
    5754:	2f2f 01d0      	move.l 464(sp),-(sp)
    5758:	2f2f 0056      	move.l 86(sp),-(sp)
    575c:	4eba 15bc      	jsr 6d1a <TestRow>(pc)
    5760:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5764:	7230           	moveq #48,d1
    5766:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    576a:	222f 0136      	move.l 310(sp),d1
    576e:	2001           	move.l d1,d0
    5770:	d080           	add.l d0,d0
    5772:	d081           	add.l d1,d0
    5774:	2200           	move.l d0,d1
    5776:	e789           	lsl.l #3,d1
    5778:	2040           	movea.l d0,a0
    577a:	d1c1           	adda.l d1,a0
    577c:	41e8 0015      	lea 21(a0),a0
    5780:	2208           	move.l a0,d1
    5782:	d2af 012e      	add.l 302(sp),d1
    5786:	7000           	moveq #0,d0
    5788:	302f 01c6      	move.w 454(sp),d0
    578c:	2f01           	move.l d1,-(sp)
    578e:	2f00           	move.l d0,-(sp)
    5790:	2f2f 01d0      	move.l 464(sp),-(sp)
    5794:	2f2f 0056      	move.l 86(sp),-(sp)
    5798:	4eba 1580      	jsr 6d1a <TestRow>(pc)
    579c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    57a0:	7030           	moveq #48,d0
    57a2:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    57a6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {
    57aa:	52af 012e      	addq.l #1,302(sp)
    57ae:	7208           	moveq #8,d1
    57b0:	b2af 012e      	cmp.l 302(sp),d1
    57b4:	6c00 ff78      	bge.w 572e <TestZoom4Picture+0x1876>
  for(int i=0;i<9;i++) {
    57b8:	52af 0136      	addq.l #1,310(sp)
    57bc:	7008           	moveq #8,d0
    57be:	b0af 0136      	cmp.l 310(sp),d0
    57c2:	6c00 ff10      	bge.w 56d4 <TestZoom4Picture+0x181c>
    }
  }

  for(int i2=0;i2<9;i2++) {  
    57c6:	42af 012a      	clr.l 298(sp)
    57ca:	6032           	bra.s 57fe <TestZoom4Picture+0x1946>
    TestRow( valsupposed, valactual, mask, 245+i2);
    57cc:	222f 012a      	move.l 298(sp),d1
    57d0:	0681 0000 00f5 	addi.l #245,d1
    57d6:	7000           	moveq #0,d0
    57d8:	302f 01c6      	move.w 454(sp),d0
    57dc:	2f01           	move.l d1,-(sp)
    57de:	2f00           	move.l d0,-(sp)
    57e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    57e4:	2f2f 0056      	move.l 86(sp),-(sp)
    57e8:	4eba 1530      	jsr 6d1a <TestRow>(pc)
    57ec:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    57f0:	7230           	moveq #48,d1
    57f2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    57f6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {  
    57fa:	52af 012a      	addq.l #1,298(sp)
    57fe:	7008           	moveq #8,d0
    5800:	b0af 012a      	cmp.l 298(sp),d0
    5804:	6cc6           	bge.s 57cc <TestZoom4Picture+0x1914>
  }
  for(int i=0;i<5;i++) {
    5806:	42af 0126      	clr.l 294(sp)
    580a:	6064           	bra.s 5870 <TestZoom4Picture+0x19b8>
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    580c:	202f 0126      	move.l 294(sp),d0
    5810:	d080           	add.l d0,d0
    5812:	2200           	move.l d0,d1
    5814:	0681 0000 0103 	addi.l #259,d1
    581a:	7000           	moveq #0,d0
    581c:	302f 01c6      	move.w 454(sp),d0
    5820:	2f01           	move.l d1,-(sp)
    5822:	2f00           	move.l d0,-(sp)
    5824:	2f2f 01d0      	move.l 464(sp),-(sp)
    5828:	2f2f 0056      	move.l 86(sp),-(sp)
    582c:	4eba 14ec      	jsr 6d1a <TestRow>(pc)
    5830:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5834:	7230           	moveq #48,d1
    5836:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    583a:	202f 0126      	move.l 294(sp),d0
    583e:	0680 0000 0082 	addi.l #130,d0
    5844:	d080           	add.l d0,d0
    5846:	2200           	move.l d0,d1
    5848:	7000           	moveq #0,d0
    584a:	302f 01c6      	move.w 454(sp),d0
    584e:	2f01           	move.l d1,-(sp)
    5850:	2f00           	move.l d0,-(sp)
    5852:	2f2f 01d0      	move.l 464(sp),-(sp)
    5856:	2f2f 0056      	move.l 86(sp),-(sp)
    585a:	4eba 14be      	jsr 6d1a <TestRow>(pc)
    585e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5862:	7030           	moveq #48,d0
    5864:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5868:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    586c:	52af 0126      	addq.l #1,294(sp)
    5870:	7204           	moveq #4,d1
    5872:	b2af 0126      	cmp.l 294(sp),d1
    5876:	6c94           	bge.s 580c <TestZoom4Picture+0x1954>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5878:	7000           	moveq #0,d0
    587a:	302f 01c6      	move.w 454(sp),d0
    587e:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5882:	2f00           	move.l d0,-(sp)
    5884:	2f2f 01d0      	move.l 464(sp),-(sp)
    5888:	2f2f 0056      	move.l 86(sp),-(sp)
    588c:	4eba 148c      	jsr 6d1a <TestRow>(pc)
    5890:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5894:	7030           	moveq #48,d0
    5896:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    589a:	466f 01c6      	not.w 454(sp)

  tmp = source;
    589e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    58a4:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    58aa:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    58b0:	4878 0001      	pea 1 <_start+0x1>
    58b4:	4878 0009      	pea 9 <_start+0x9>
    58b8:	2f2f 0056      	move.l 86(sp),-(sp)
    58bc:	2f2f 006a      	move.l 106(sp),-(sp)
    58c0:	4eba c402      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    58c4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    58c8:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    58ce:	2c40           	movea.l d0,a6
    58d0:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    58d4:	222f 004e      	move.l 78(sp),d1
    58d8:	5881           	addq.l #4,d1
    58da:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom10;
    58de:	2f7c 0001 b994 	move.l #113044,74(sp)
    58e4:	004a 

  mask = 0xffff;
    58e6:	3f7c ffff 01c6 	move.w #-1,454(sp)
  TestRow( valsupposed, valactual, mask, 0);
    58ec:	7000           	moveq #0,d0
    58ee:	302f 01c6      	move.w 454(sp),d0
    58f2:	42a7           	clr.l -(sp)
    58f4:	2f00           	move.l d0,-(sp)
    58f6:	2f2f 01d0      	move.l 464(sp),-(sp)
    58fa:	2f2f 0056      	move.l 86(sp),-(sp)
    58fe:	4eba 141a      	jsr 6d1a <TestRow>(pc)
    5902:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5906:	7030           	moveq #48,d0
    5908:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    590c:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 1);   
    5910:	7000           	moveq #0,d0
    5912:	302f 01c6      	move.w 454(sp),d0
    5916:	4878 0001      	pea 1 <_start+0x1>
    591a:	2f00           	move.l d0,-(sp)
    591c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5920:	2f2f 0056      	move.l 86(sp),-(sp)
    5924:	4eba 13f4      	jsr 6d1a <TestRow>(pc)
    5928:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    592c:	7230           	moveq #48,d1
    592e:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 2);
    5932:	7000           	moveq #0,d0
    5934:	302f 01c6      	move.w 454(sp),d0
    5938:	4878 0002      	pea 2 <_start+0x2>
    593c:	2f00           	move.l d0,-(sp)
    593e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5942:	2f2f 0056      	move.l 86(sp),-(sp)
    5946:	4eba 13d2      	jsr 6d1a <TestRow>(pc)
    594a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    594e:	7030           	moveq #48,d0
    5950:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5954:	466f 01c6      	not.w 454(sp)

  for(int i=0;i<9;i++) {
    5958:	42af 0122      	clr.l 290(sp)
    595c:	6000 00e0      	bra.w 5a3e <TestZoom4Picture+0x1b86>
    for(int i2=0;i2<8;i2++) {  
    5960:	42af 011e      	clr.l 286(sp)
    5964:	6040           	bra.s 59a6 <TestZoom4Picture+0x1aee>
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    5966:	206f 011e      	movea.l 286(sp),a0
    596a:	5688           	addq.l #3,a0
    596c:	222f 0122      	move.l 290(sp),d1
    5970:	2001           	move.l d1,d0
    5972:	e788           	lsl.l #3,d0
    5974:	9081           	sub.l d1,d0
    5976:	d080           	add.l d0,d0
    5978:	d080           	add.l d0,d0
    597a:	2208           	move.l a0,d1
    597c:	d280           	add.l d0,d1
    597e:	7000           	moveq #0,d0
    5980:	302f 01c6      	move.w 454(sp),d0
    5984:	2f01           	move.l d1,-(sp)
    5986:	2f00           	move.l d0,-(sp)
    5988:	2f2f 01d0      	move.l 464(sp),-(sp)
    598c:	2f2f 0056      	move.l 86(sp),-(sp)
    5990:	4eba 1388      	jsr 6d1a <TestRow>(pc)
    5994:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5998:	7230           	moveq #48,d1
    599a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    599e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {  
    59a2:	52af 011e      	addq.l #1,286(sp)
    59a6:	7007           	moveq #7,d0
    59a8:	b0af 011e      	cmp.l 286(sp),d0
    59ac:	6cb8           	bge.s 5966 <TestZoom4Picture+0x1aae>
    }
    
    for(int i2=0;i2<10;i2++) {
    59ae:	42af 011a      	clr.l 282(sp)
    59b2:	607c           	bra.s 5a30 <TestZoom4Picture+0x1b78>
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    59b4:	222f 0122      	move.l 290(sp),d1
    59b8:	2001           	move.l d1,d0
    59ba:	e788           	lsl.l #3,d0
    59bc:	9081           	sub.l d1,d0
    59be:	d080           	add.l d0,d0
    59c0:	d080           	add.l d0,d0
    59c2:	2040           	movea.l d0,a0
    59c4:	41e8 000b      	lea 11(a0),a0
    59c8:	2208           	move.l a0,d1
    59ca:	d2af 011a      	add.l 282(sp),d1
    59ce:	7000           	moveq #0,d0
    59d0:	302f 01c6      	move.w 454(sp),d0
    59d4:	2f01           	move.l d1,-(sp)
    59d6:	2f00           	move.l d0,-(sp)
    59d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    59dc:	2f2f 0056      	move.l 86(sp),-(sp)
    59e0:	4eba 1338      	jsr 6d1a <TestRow>(pc)
    59e4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    59e8:	7230           	moveq #48,d1
    59ea:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    59ee:	222f 0122      	move.l 290(sp),d1
    59f2:	2001           	move.l d1,d0
    59f4:	e788           	lsl.l #3,d0
    59f6:	9081           	sub.l d1,d0
    59f8:	d080           	add.l d0,d0
    59fa:	d080           	add.l d0,d0
    59fc:	2040           	movea.l d0,a0
    59fe:	41e8 000b      	lea 11(a0),a0
    5a02:	2208           	move.l a0,d1
    5a04:	d2af 011a      	add.l 282(sp),d1
    5a08:	7000           	moveq #0,d0
    5a0a:	302f 01c6      	move.w 454(sp),d0
    5a0e:	2f01           	move.l d1,-(sp)
    5a10:	2f00           	move.l d0,-(sp)
    5a12:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a16:	2f2f 0056      	move.l 86(sp),-(sp)
    5a1a:	4eba 12fe      	jsr 6d1a <TestRow>(pc)
    5a1e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a22:	7030           	moveq #48,d0
    5a24:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5a28:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {
    5a2c:	52af 011a      	addq.l #1,282(sp)
    5a30:	7209           	moveq #9,d1
    5a32:	b2af 011a      	cmp.l 282(sp),d1
    5a36:	6c00 ff7c      	bge.w 59b4 <TestZoom4Picture+0x1afc>
  for(int i=0;i<9;i++) {
    5a3a:	52af 0122      	addq.l #1,290(sp)
    5a3e:	7008           	moveq #8,d0
    5a40:	b0af 0122      	cmp.l 290(sp),d0
    5a44:	6c00 ff1a      	bge.w 5960 <TestZoom4Picture+0x1aa8>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    5a48:	42af 0116      	clr.l 278(sp)
    5a4c:	6032           	bra.s 5a80 <TestZoom4Picture+0x1bc8>
    TestRow( valsupposed, valactual, mask, 255+i2);
    5a4e:	222f 0116      	move.l 278(sp),d1
    5a52:	0681 0000 00ff 	addi.l #255,d1
    5a58:	7000           	moveq #0,d0
    5a5a:	302f 01c6      	move.w 454(sp),d0
    5a5e:	2f01           	move.l d1,-(sp)
    5a60:	2f00           	move.l d0,-(sp)
    5a62:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a66:	2f2f 0056      	move.l 86(sp),-(sp)
    5a6a:	4eba 12ae      	jsr 6d1a <TestRow>(pc)
    5a6e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a72:	7230           	moveq #48,d1
    5a74:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5a78:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    5a7c:	52af 0116      	addq.l #1,278(sp)
    5a80:	7007           	moveq #7,d0
    5a82:	b0af 0116      	cmp.l 278(sp),d0
    5a86:	6cc6           	bge.s 5a4e <TestZoom4Picture+0x1b96>
  }
  for(int i=0;i<3;i++) {
    5a88:	42af 0112      	clr.l 274(sp)
    5a8c:	6064           	bra.s 5af2 <TestZoom4Picture+0x1c3a>
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    5a8e:	202f 0112      	move.l 274(sp),d0
    5a92:	d080           	add.l d0,d0
    5a94:	2200           	move.l d0,d1
    5a96:	0681 0000 0107 	addi.l #263,d1
    5a9c:	7000           	moveq #0,d0
    5a9e:	302f 01c6      	move.w 454(sp),d0
    5aa2:	2f01           	move.l d1,-(sp)
    5aa4:	2f00           	move.l d0,-(sp)
    5aa6:	2f2f 01d0      	move.l 464(sp),-(sp)
    5aaa:	2f2f 0056      	move.l 86(sp),-(sp)
    5aae:	4eba 126a      	jsr 6d1a <TestRow>(pc)
    5ab2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5ab6:	7230           	moveq #48,d1
    5ab8:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    5abc:	202f 0112      	move.l 274(sp),d0
    5ac0:	0680 0000 0084 	addi.l #132,d0
    5ac6:	d080           	add.l d0,d0
    5ac8:	2200           	move.l d0,d1
    5aca:	7000           	moveq #0,d0
    5acc:	302f 01c6      	move.w 454(sp),d0
    5ad0:	2f01           	move.l d1,-(sp)
    5ad2:	2f00           	move.l d0,-(sp)
    5ad4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ad8:	2f2f 0056      	move.l 86(sp),-(sp)
    5adc:	4eba 123c      	jsr 6d1a <TestRow>(pc)
    5ae0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5ae4:	7030           	moveq #48,d0
    5ae6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5aea:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    5aee:	52af 0112      	addq.l #1,274(sp)
    5af2:	7202           	moveq #2,d1
    5af4:	b2af 0112      	cmp.l 274(sp),d1
    5af8:	6c94           	bge.s 5a8e <TestZoom4Picture+0x1bd6>
  }

  tmp = source;
    5afa:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5b00:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5b06:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    5b0c:	4878 0001      	pea 1 <_start+0x1>
    5b10:	4878 000a      	pea a <_start+0xa>
    5b14:	2f2f 0056      	move.l 86(sp),-(sp)
    5b18:	2f2f 006a      	move.l 106(sp),-(sp)
    5b1c:	4eba c1a6      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    5b20:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5b24:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    5b2a:	2c40           	movea.l d0,a6
    5b2c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5b30:	202f 004e      	move.l 78(sp),d0
    5b34:	5880           	addq.l #4,d0
    5b36:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom11;
    5b3a:	2f7c 0001 b9c0 	move.l #113088,74(sp)
    5b40:	004a 

  mask = 0xffff;
    5b42:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  for(int i2=0;i2<6;i2++) {  
    5b48:	42af 010e      	clr.l 270(sp)
    5b4c:	602a           	bra.s 5b78 <TestZoom4Picture+0x1cc0>
    TestRow( valsupposed, valactual, mask, i2);
    5b4e:	7000           	moveq #0,d0
    5b50:	302f 01c6      	move.w 454(sp),d0
    5b54:	2f2f 010e      	move.l 270(sp),-(sp)
    5b58:	2f00           	move.l d0,-(sp)
    5b5a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b5e:	2f2f 0056      	move.l 86(sp),-(sp)
    5b62:	4eba 11b6      	jsr 6d1a <TestRow>(pc)
    5b66:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5b6a:	7230           	moveq #48,d1
    5b6c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5b70:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {  
    5b74:	52af 010e      	addq.l #1,270(sp)
    5b78:	7005           	moveq #5,d0
    5b7a:	b0af 010e      	cmp.l 270(sp),d0
    5b7e:	6cce           	bge.s 5b4e <TestZoom4Picture+0x1c96>
  }

  for(int i2=0;i2<11;i2++) {
    5b80:	42af 010a      	clr.l 266(sp)
    5b84:	605c           	bra.s 5be2 <TestZoom4Picture+0x1d2a>
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    5b86:	202f 010a      	move.l 266(sp),d0
    5b8a:	5680           	addq.l #3,d0
    5b8c:	d080           	add.l d0,d0
    5b8e:	2200           	move.l d0,d1
    5b90:	7000           	moveq #0,d0
    5b92:	302f 01c6      	move.w 454(sp),d0
    5b96:	2f01           	move.l d1,-(sp)
    5b98:	2f00           	move.l d0,-(sp)
    5b9a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b9e:	2f2f 0056      	move.l 86(sp),-(sp)
    5ba2:	4eba 1176      	jsr 6d1a <TestRow>(pc)
    5ba6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5baa:	7230           	moveq #48,d1
    5bac:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    5bb0:	202f 010a      	move.l 266(sp),d0
    5bb4:	d080           	add.l d0,d0
    5bb6:	2200           	move.l d0,d1
    5bb8:	5e81           	addq.l #7,d1
    5bba:	7000           	moveq #0,d0
    5bbc:	302f 01c6      	move.w 454(sp),d0
    5bc0:	2f01           	move.l d1,-(sp)
    5bc2:	2f00           	move.l d0,-(sp)
    5bc4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bc8:	2f2f 0056      	move.l 86(sp),-(sp)
    5bcc:	4eba 114c      	jsr 6d1a <TestRow>(pc)
    5bd0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5bd4:	7030           	moveq #48,d0
    5bd6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5bda:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5bde:	52af 010a      	addq.l #1,266(sp)
    5be2:	720a           	moveq #10,d1
    5be4:	b2af 010a      	cmp.l 266(sp),d1
    5be8:	6c9c           	bge.s 5b86 <TestZoom4Picture+0x1cce>
  }

  for(int i=0;i<8;i++) {
    5bea:	42af 0106      	clr.l 262(sp)
    5bee:	6000 00f2      	bra.w 5ce2 <TestZoom4Picture+0x1e2a>
    for(int i2=0;i2<7;i2++) {  
    5bf2:	42af 0102      	clr.l 258(sp)
    5bf6:	6044           	bra.s 5c3c <TestZoom4Picture+0x1d84>
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    5bf8:	307c 001c      	movea.w #28,a0
    5bfc:	d1ef 0102      	adda.l 258(sp),a0
    5c00:	222f 0106      	move.l 262(sp),d1
    5c04:	2001           	move.l d1,d0
    5c06:	e788           	lsl.l #3,d0
    5c08:	9081           	sub.l d1,d0
    5c0a:	d080           	add.l d0,d0
    5c0c:	d080           	add.l d0,d0
    5c0e:	d081           	add.l d1,d0
    5c10:	2208           	move.l a0,d1
    5c12:	d280           	add.l d0,d1
    5c14:	7000           	moveq #0,d0
    5c16:	302f 01c6      	move.w 454(sp),d0
    5c1a:	2f01           	move.l d1,-(sp)
    5c1c:	2f00           	move.l d0,-(sp)
    5c1e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c22:	2f2f 0056      	move.l 86(sp),-(sp)
    5c26:	4eba 10f2      	jsr 6d1a <TestRow>(pc)
    5c2a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5c2e:	7030           	moveq #48,d0
    5c30:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5c34:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<7;i2++) {  
    5c38:	52af 0102      	addq.l #1,258(sp)
    5c3c:	7206           	moveq #6,d1
    5c3e:	b2af 0102      	cmp.l 258(sp),d1
    5c42:	6cb4           	bge.s 5bf8 <TestZoom4Picture+0x1d40>
    }
    
    for(int i2=0;i2<11;i2++) {
    5c44:	42af 00fe      	clr.l 254(sp)
    5c48:	6000 008a      	bra.w 5cd4 <TestZoom4Picture+0x1e1c>
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    5c4c:	222f 0106      	move.l 262(sp),d1
    5c50:	2001           	move.l d1,d0
    5c52:	e788           	lsl.l #3,d0
    5c54:	9081           	sub.l d1,d0
    5c56:	d080           	add.l d0,d0
    5c58:	d080           	add.l d0,d0
    5c5a:	2040           	movea.l d0,a0
    5c5c:	d1c1           	adda.l d1,a0
    5c5e:	41e8 0023      	lea 35(a0),a0
    5c62:	202f 00fe      	move.l 254(sp),d0
    5c66:	d080           	add.l d0,d0
    5c68:	2208           	move.l a0,d1
    5c6a:	d280           	add.l d0,d1
    5c6c:	7000           	moveq #0,d0
    5c6e:	302f 01c6      	move.w 454(sp),d0
    5c72:	2f01           	move.l d1,-(sp)
    5c74:	2f00           	move.l d0,-(sp)
    5c76:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c7a:	2f2f 0056      	move.l 86(sp),-(sp)
    5c7e:	4eba 109a      	jsr 6d1a <TestRow>(pc)
    5c82:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5c86:	7030           	moveq #48,d0
    5c88:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    5c8c:	222f 0106      	move.l 262(sp),d1
    5c90:	2001           	move.l d1,d0
    5c92:	e788           	lsl.l #3,d0
    5c94:	9081           	sub.l d1,d0
    5c96:	d080           	add.l d0,d0
    5c98:	d080           	add.l d0,d0
    5c9a:	2040           	movea.l d0,a0
    5c9c:	d1c1           	adda.l d1,a0
    5c9e:	41e8 000b      	lea 11(a0),a0
    5ca2:	202f 00fe      	move.l 254(sp),d0
    5ca6:	d080           	add.l d0,d0
    5ca8:	2208           	move.l a0,d1
    5caa:	d280           	add.l d0,d1
    5cac:	7000           	moveq #0,d0
    5cae:	302f 01c6      	move.w 454(sp),d0
    5cb2:	2f01           	move.l d1,-(sp)
    5cb4:	2f00           	move.l d0,-(sp)
    5cb6:	2f2f 01d0      	move.l 464(sp),-(sp)
    5cba:	2f2f 0056      	move.l 86(sp),-(sp)
    5cbe:	4eba 105a      	jsr 6d1a <TestRow>(pc)
    5cc2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5cc6:	7230           	moveq #48,d1
    5cc8:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5ccc:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {
    5cd0:	52af 00fe      	addq.l #1,254(sp)
    5cd4:	700a           	moveq #10,d0
    5cd6:	b0af 00fe      	cmp.l 254(sp),d0
    5cda:	6c00 ff70      	bge.w 5c4c <TestZoom4Picture+0x1d94>
  for(int i=0;i<8;i++) {
    5cde:	52af 0106      	addq.l #1,262(sp)
    5ce2:	7207           	moveq #7,d1
    5ce4:	b2af 0106      	cmp.l 262(sp),d1
    5ce8:	6c00 ff08      	bge.w 5bf2 <TestZoom4Picture+0x1d3a>
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    5cec:	42af 00fa      	clr.l 250(sp)
    5cf0:	6032           	bra.s 5d24 <TestZoom4Picture+0x1e6c>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5cf2:	222f 00fa      	move.l 250(sp),d1
    5cf6:	0681 0000 0104 	addi.l #260,d1
    5cfc:	7000           	moveq #0,d0
    5cfe:	302f 01c6      	move.w 454(sp),d0
    5d02:	2f01           	move.l d1,-(sp)
    5d04:	2f00           	move.l d0,-(sp)
    5d06:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d0a:	2f2f 0056      	move.l 86(sp),-(sp)
    5d0e:	4eba 100a      	jsr 6d1a <TestRow>(pc)
    5d12:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5d16:	7030           	moveq #48,d0
    5d18:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5d1c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    5d20:	52af 00fa      	addq.l #1,250(sp)
    5d24:	7206           	moveq #6,d1
    5d26:	b2af 00fa      	cmp.l 250(sp),d1
    5d2a:	6cc6           	bge.s 5cf2 <TestZoom4Picture+0x1e3a>
  }
  TestRow( valsupposed, valactual, mask, 267);   
    5d2c:	7000           	moveq #0,d0
    5d2e:	302f 01c6      	move.w 454(sp),d0
    5d32:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    5d36:	2f00           	move.l d0,-(sp)
    5d38:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d3c:	2f2f 0056      	move.l 86(sp),-(sp)
    5d40:	4eba 0fd8      	jsr 6d1a <TestRow>(pc)
    5d44:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5d48:	7030           	moveq #48,d0
    5d4a:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 268);
    5d4e:	7000           	moveq #0,d0
    5d50:	302f 01c6      	move.w 454(sp),d0
    5d54:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    5d58:	2f00           	move.l d0,-(sp)
    5d5a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d5e:	2f2f 0056      	move.l 86(sp),-(sp)
    5d62:	4eba 0fb6      	jsr 6d1a <TestRow>(pc)
    5d66:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5d6a:	7230           	moveq #48,d1
    5d6c:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5d70:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 269);
    5d74:	7000           	moveq #0,d0
    5d76:	302f 01c6      	move.w 454(sp),d0
    5d7a:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5d7e:	2f00           	move.l d0,-(sp)
    5d80:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d84:	2f2f 0056      	move.l 86(sp),-(sp)
    5d88:	4eba 0f90      	jsr 6d1a <TestRow>(pc)
    5d8c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5d90:	7030           	moveq #48,d0
    5d92:	d1af 01c8      	add.l d0,456(sp)
  
  tmp = source;
    5d96:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5d9c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5da2:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    5da8:	4878 0001      	pea 1 <_start+0x1>
    5dac:	4878 000b      	pea b <_start+0xb>
    5db0:	2f2f 0056      	move.l 86(sp),-(sp)
    5db4:	2f2f 006a      	move.l 106(sp),-(sp)
    5db8:	4eba bf0a      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    5dbc:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5dc0:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    5dc6:	2c40           	movea.l d0,a6
    5dc8:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5dcc:	222f 004e      	move.l 78(sp),d1
    5dd0:	5881           	addq.l #4,d1
    5dd2:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom12;
    5dd6:	2f7c 0001 b9ec 	move.l #113132,74(sp)
    5ddc:	004a 

  mask = 0x0;
    5dde:	426f 01c6      	clr.w 454(sp)
   
  TestRow( valsupposed, valactual, mask, 0);
    5de2:	7000           	moveq #0,d0
    5de4:	302f 01c6      	move.w 454(sp),d0
    5de8:	42a7           	clr.l -(sp)
    5dea:	2f00           	move.l d0,-(sp)
    5dec:	2f2f 01d0      	move.l 464(sp),-(sp)
    5df0:	2f2f 0056      	move.l 86(sp),-(sp)
    5df4:	4eba 0f24      	jsr 6d1a <TestRow>(pc)
    5df8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5dfc:	7030           	moveq #48,d0
    5dfe:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5e02:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<12;i2++) {
    5e06:	42af 00f6      	clr.l 246(sp)
    5e0a:	605c           	bra.s 5e68 <TestZoom4Picture+0x1fb0>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5e0c:	202f 00f6      	move.l 246(sp),d0
    5e10:	d080           	add.l d0,d0
    5e12:	2200           	move.l d0,d1
    5e14:	5281           	addq.l #1,d1
    5e16:	7000           	moveq #0,d0
    5e18:	302f 01c6      	move.w 454(sp),d0
    5e1c:	2f01           	move.l d1,-(sp)
    5e1e:	2f00           	move.l d0,-(sp)
    5e20:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e24:	2f2f 0056      	move.l 86(sp),-(sp)
    5e28:	4eba 0ef0      	jsr 6d1a <TestRow>(pc)
    5e2c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5e30:	7230           	moveq #48,d1
    5e32:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5e36:	202f 00f6      	move.l 246(sp),d0
    5e3a:	5280           	addq.l #1,d0
    5e3c:	d080           	add.l d0,d0
    5e3e:	2200           	move.l d0,d1
    5e40:	7000           	moveq #0,d0
    5e42:	302f 01c6      	move.w 454(sp),d0
    5e46:	2f01           	move.l d1,-(sp)
    5e48:	2f00           	move.l d0,-(sp)
    5e4a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e4e:	2f2f 0056      	move.l 86(sp),-(sp)
    5e52:	4eba 0ec6      	jsr 6d1a <TestRow>(pc)
    5e56:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5e5a:	7030           	moveq #48,d0
    5e5c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5e60:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    5e64:	52af 00f6      	addq.l #1,246(sp)
    5e68:	720b           	moveq #11,d1
    5e6a:	b2af 00f6      	cmp.l 246(sp),d1
    5e6e:	6c9c           	bge.s 5e0c <TestZoom4Picture+0x1f54>
  } 

  for(int i=0;i<8;i++) {
    5e70:	42af 00f2      	clr.l 242(sp)
    5e74:	6000 00e6      	bra.w 5f5c <TestZoom4Picture+0x20a4>
    for(int i2=0;i2<6;i2++) {  
    5e78:	42af 00ee      	clr.l 238(sp)
    5e7c:	6040           	bra.s 5ebe <TestZoom4Picture+0x2006>
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    5e7e:	307c 0019      	movea.w #25,a0
    5e82:	d1ef 00ee      	adda.l 238(sp),a0
    5e86:	222f 00f2      	move.l 242(sp),d1
    5e8a:	2001           	move.l d1,d0
    5e8c:	e988           	lsl.l #4,d0
    5e8e:	9081           	sub.l d1,d0
    5e90:	d080           	add.l d0,d0
    5e92:	2208           	move.l a0,d1
    5e94:	d280           	add.l d0,d1
    5e96:	7000           	moveq #0,d0
    5e98:	302f 01c6      	move.w 454(sp),d0
    5e9c:	2f01           	move.l d1,-(sp)
    5e9e:	2f00           	move.l d0,-(sp)
    5ea0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ea4:	2f2f 0056      	move.l 86(sp),-(sp)
    5ea8:	4eba 0e70      	jsr 6d1a <TestRow>(pc)
    5eac:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5eb0:	7030           	moveq #48,d0
    5eb2:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5eb6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<6;i2++) {  
    5eba:	52af 00ee      	addq.l #1,238(sp)
    5ebe:	7205           	moveq #5,d1
    5ec0:	b2af 00ee      	cmp.l 238(sp),d1
    5ec4:	6cb8           	bge.s 5e7e <TestZoom4Picture+0x1fc6>
    }
    
    for(int i2=0;i2<12;i2++) {
    5ec6:	42af 00ea      	clr.l 234(sp)
    5eca:	6000 0082      	bra.w 5f4e <TestZoom4Picture+0x2096>
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    5ece:	222f 00f2      	move.l 242(sp),d1
    5ed2:	2001           	move.l d1,d0
    5ed4:	e988           	lsl.l #4,d0
    5ed6:	9081           	sub.l d1,d0
    5ed8:	d080           	add.l d0,d0
    5eda:	2040           	movea.l d0,a0
    5edc:	41e8 001f      	lea 31(a0),a0
    5ee0:	202f 00ea      	move.l 234(sp),d0
    5ee4:	d080           	add.l d0,d0
    5ee6:	2208           	move.l a0,d1
    5ee8:	d280           	add.l d0,d1
    5eea:	7000           	moveq #0,d0
    5eec:	302f 01c6      	move.w 454(sp),d0
    5ef0:	2f01           	move.l d1,-(sp)
    5ef2:	2f00           	move.l d0,-(sp)
    5ef4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ef8:	2f2f 0056      	move.l 86(sp),-(sp)
    5efc:	4eba 0e1c      	jsr 6d1a <TestRow>(pc)
    5f00:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f04:	7030           	moveq #48,d0
    5f06:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    5f0a:	222f 00f2      	move.l 242(sp),d1
    5f0e:	2001           	move.l d1,d0
    5f10:	e988           	lsl.l #4,d0
    5f12:	9081           	sub.l d1,d0
    5f14:	d080           	add.l d0,d0
    5f16:	2040           	movea.l d0,a0
    5f18:	41e8 0020      	lea 32(a0),a0
    5f1c:	202f 00ea      	move.l 234(sp),d0
    5f20:	d080           	add.l d0,d0
    5f22:	2208           	move.l a0,d1
    5f24:	d280           	add.l d0,d1
    5f26:	7000           	moveq #0,d0
    5f28:	302f 01c6      	move.w 454(sp),d0
    5f2c:	2f01           	move.l d1,-(sp)
    5f2e:	2f00           	move.l d0,-(sp)
    5f30:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f34:	2f2f 0056      	move.l 86(sp),-(sp)
    5f38:	4eba 0de0      	jsr 6d1a <TestRow>(pc)
    5f3c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f40:	7230           	moveq #48,d1
    5f42:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5f46:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {
    5f4a:	52af 00ea      	addq.l #1,234(sp)
    5f4e:	700b           	moveq #11,d0
    5f50:	b0af 00ea      	cmp.l 234(sp),d0
    5f54:	6c00 ff78      	bge.w 5ece <TestZoom4Picture+0x2016>
  for(int i=0;i<8;i++) {
    5f58:	52af 00f2      	addq.l #1,242(sp)
    5f5c:	7207           	moveq #7,d1
    5f5e:	b2af 00f2      	cmp.l 242(sp),d1
    5f62:	6c00 ff14      	bge.w 5e78 <TestZoom4Picture+0x1fc0>
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    5f66:	42af 00e6      	clr.l 230(sp)
    5f6a:	6032           	bra.s 5f9e <TestZoom4Picture+0x20e6>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5f6c:	222f 00e6      	move.l 230(sp),d1
    5f70:	0681 0000 0104 	addi.l #260,d1
    5f76:	7000           	moveq #0,d0
    5f78:	302f 01c6      	move.w 454(sp),d0
    5f7c:	2f01           	move.l d1,-(sp)
    5f7e:	2f00           	move.l d0,-(sp)
    5f80:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f84:	2f2f 0056      	move.l 86(sp),-(sp)
    5f88:	4eba 0d90      	jsr 6d1a <TestRow>(pc)
    5f8c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5f90:	7030           	moveq #48,d0
    5f92:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5f96:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5f9a:	52af 00e6      	addq.l #1,230(sp)
    5f9e:	7204           	moveq #4,d1
    5fa0:	b2af 00e6      	cmp.l 230(sp),d1
    5fa4:	6cc6           	bge.s 5f6c <TestZoom4Picture+0x20b4>
  }

  tmp = source;
    5fa6:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5fac:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5fb2:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    5fb8:	4878 0001      	pea 1 <_start+0x1>
    5fbc:	4878 000c      	pea c <_start+0xc>
    5fc0:	2f2f 0056      	move.l 86(sp),-(sp)
    5fc4:	2f2f 006a      	move.l 106(sp),-(sp)
    5fc8:	4eba bcfa      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    5fcc:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5fd0:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    5fd6:	2c40           	movea.l d0,a6
    5fd8:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5fdc:	202f 004e      	move.l 78(sp),d0
    5fe0:	5880           	addq.l #4,d0
    5fe2:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom13;
    5fe6:	2f7c 0001 ba18 	move.l #113176,74(sp)
    5fec:	004a 

  mask = 0xffff;
    5fee:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<11;i2++) {
    5ff4:	42af 00e2      	clr.l 226(sp)
    5ff8:	605a           	bra.s 6054 <TestZoom4Picture+0x219c>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    5ffa:	202f 00e2      	move.l 226(sp),d0
    5ffe:	d080           	add.l d0,d0
    6000:	2200           	move.l d0,d1
    6002:	7000           	moveq #0,d0
    6004:	302f 01c6      	move.w 454(sp),d0
    6008:	2f01           	move.l d1,-(sp)
    600a:	2f00           	move.l d0,-(sp)
    600c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6010:	2f2f 0056      	move.l 86(sp),-(sp)
    6014:	4eba 0d04      	jsr 6d1a <TestRow>(pc)
    6018:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    601c:	7230           	moveq #48,d1
    601e:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6022:	202f 00e2      	move.l 226(sp),d0
    6026:	d080           	add.l d0,d0
    6028:	2200           	move.l d0,d1
    602a:	5281           	addq.l #1,d1
    602c:	7000           	moveq #0,d0
    602e:	302f 01c6      	move.w 454(sp),d0
    6032:	2f01           	move.l d1,-(sp)
    6034:	2f00           	move.l d0,-(sp)
    6036:	2f2f 01d0      	move.l 464(sp),-(sp)
    603a:	2f2f 0056      	move.l 86(sp),-(sp)
    603e:	4eba 0cda      	jsr 6d1a <TestRow>(pc)
    6042:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6046:	7030           	moveq #48,d0
    6048:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    604c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    6050:	52af 00e2      	addq.l #1,226(sp)
    6054:	720a           	moveq #10,d1
    6056:	b2af 00e2      	cmp.l 226(sp),d1
    605a:	6c9e           	bge.s 5ffa <TestZoom4Picture+0x2142>
  } 

  for(int i=0;i<8;i++) {
    605c:	42af 00de      	clr.l 222(sp)
    6060:	6000 00de      	bra.w 6140 <TestZoom4Picture+0x2288>
    for(int i2=0;i2<5;i2++) {  
    6064:	42af 00da      	clr.l 218(sp)
    6068:	603e           	bra.s 60a8 <TestZoom4Picture+0x21f0>
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    606a:	307c 0016      	movea.w #22,a0
    606e:	d1ef 00da      	adda.l 218(sp),a0
    6072:	222f 00de      	move.l 222(sp),d1
    6076:	2001           	move.l d1,d0
    6078:	eb88           	lsl.l #5,d0
    607a:	9081           	sub.l d1,d0
    607c:	2208           	move.l a0,d1
    607e:	d280           	add.l d0,d1
    6080:	7000           	moveq #0,d0
    6082:	302f 01c6      	move.w 454(sp),d0
    6086:	2f01           	move.l d1,-(sp)
    6088:	2f00           	move.l d0,-(sp)
    608a:	2f2f 01d0      	move.l 464(sp),-(sp)
    608e:	2f2f 0056      	move.l 86(sp),-(sp)
    6092:	4eba 0c86      	jsr 6d1a <TestRow>(pc)
    6096:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    609a:	7030           	moveq #48,d0
    609c:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    60a0:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<5;i2++) {  
    60a4:	52af 00da      	addq.l #1,218(sp)
    60a8:	7204           	moveq #4,d1
    60aa:	b2af 00da      	cmp.l 218(sp),d1
    60ae:	6cba           	bge.s 606a <TestZoom4Picture+0x21b2>
    }
    
    for(int i2=0;i2<13;i2++) {
    60b0:	42af 00d6      	clr.l 214(sp)
    60b4:	607c           	bra.s 6132 <TestZoom4Picture+0x227a>
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    60b6:	222f 00de      	move.l 222(sp),d1
    60ba:	2001           	move.l d1,d0
    60bc:	eb88           	lsl.l #5,d0
    60be:	2040           	movea.l d0,a0
    60c0:	91c1           	suba.l d1,a0
    60c2:	41e8 001b      	lea 27(a0),a0
    60c6:	202f 00d6      	move.l 214(sp),d0
    60ca:	d080           	add.l d0,d0
    60cc:	2208           	move.l a0,d1
    60ce:	d280           	add.l d0,d1
    60d0:	7000           	moveq #0,d0
    60d2:	302f 01c6      	move.w 454(sp),d0
    60d6:	2f01           	move.l d1,-(sp)
    60d8:	2f00           	move.l d0,-(sp)
    60da:	2f2f 01d0      	move.l 464(sp),-(sp)
    60de:	2f2f 0056      	move.l 86(sp),-(sp)
    60e2:	4eba 0c36      	jsr 6d1a <TestRow>(pc)
    60e6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    60ea:	7030           	moveq #48,d0
    60ec:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    60f0:	222f 00de      	move.l 222(sp),d1
    60f4:	2001           	move.l d1,d0
    60f6:	eb88           	lsl.l #5,d0
    60f8:	2040           	movea.l d0,a0
    60fa:	91c1           	suba.l d1,a0
    60fc:	41e8 001c      	lea 28(a0),a0
    6100:	202f 00d6      	move.l 214(sp),d0
    6104:	d080           	add.l d0,d0
    6106:	2208           	move.l a0,d1
    6108:	d280           	add.l d0,d1
    610a:	7000           	moveq #0,d0
    610c:	302f 01c6      	move.w 454(sp),d0
    6110:	2f01           	move.l d1,-(sp)
    6112:	2f00           	move.l d0,-(sp)
    6114:	2f2f 01d0      	move.l 464(sp),-(sp)
    6118:	2f2f 0056      	move.l 86(sp),-(sp)
    611c:	4eba 0bfc      	jsr 6d1a <TestRow>(pc)
    6120:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6124:	7230           	moveq #48,d1
    6126:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    612a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {
    612e:	52af 00d6      	addq.l #1,214(sp)
    6132:	700c           	moveq #12,d0
    6134:	b0af 00d6      	cmp.l 214(sp),d0
    6138:	6c00 ff7c      	bge.w 60b6 <TestZoom4Picture+0x21fe>
  for(int i=0;i<8;i++) {
    613c:	52af 00de      	addq.l #1,222(sp)
    6140:	7207           	moveq #7,d1
    6142:	b2af 00de      	cmp.l 222(sp),d1
    6146:	6c00 ff1c      	bge.w 6064 <TestZoom4Picture+0x21ac>
    }
  } 

  tmp = source;
    614a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6150:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6156:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    615c:	4878 0001      	pea 1 <_start+0x1>
    6160:	4878 000d      	pea d <_start+0xd>
    6164:	2f2f 0056      	move.l 86(sp),-(sp)
    6168:	2f2f 006a      	move.l 106(sp),-(sp)
    616c:	4eba bb56      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    6170:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6174:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    617a:	2c40           	movea.l d0,a6
    617c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6180:	202f 004e      	move.l 78(sp),d0
    6184:	5880           	addq.l #4,d0
    6186:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom14;
    618a:	2f7c 0001 ba44 	move.l #113220,74(sp)
    6190:	004a 

  mask = 0xffff;
    6192:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    6198:	7000           	moveq #0,d0
    619a:	302f 01c6      	move.w 454(sp),d0
    619e:	42a7           	clr.l -(sp)
    61a0:	2f00           	move.l d0,-(sp)
    61a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    61a6:	2f2f 0056      	move.l 86(sp),-(sp)
    61aa:	4eba 0b6e      	jsr 6d1a <TestRow>(pc)
    61ae:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2; 
    61b2:	7230           	moveq #48,d1
    61b4:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff; 
    61b8:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<9;i2++) {
    61bc:	42af 00d2      	clr.l 210(sp)
    61c0:	605c           	bra.s 621e <TestZoom4Picture+0x2366>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    61c2:	202f 00d2      	move.l 210(sp),d0
    61c6:	d080           	add.l d0,d0
    61c8:	2200           	move.l d0,d1
    61ca:	5281           	addq.l #1,d1
    61cc:	7000           	moveq #0,d0
    61ce:	302f 01c6      	move.w 454(sp),d0
    61d2:	2f01           	move.l d1,-(sp)
    61d4:	2f00           	move.l d0,-(sp)
    61d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    61da:	2f2f 0056      	move.l 86(sp),-(sp)
    61de:	4eba 0b3a      	jsr 6d1a <TestRow>(pc)
    61e2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61e6:	7030           	moveq #48,d0
    61e8:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    61ec:	202f 00d2      	move.l 210(sp),d0
    61f0:	5280           	addq.l #1,d0
    61f2:	d080           	add.l d0,d0
    61f4:	2200           	move.l d0,d1
    61f6:	7000           	moveq #0,d0
    61f8:	302f 01c6      	move.w 454(sp),d0
    61fc:	2f01           	move.l d1,-(sp)
    61fe:	2f00           	move.l d0,-(sp)
    6200:	2f2f 01d0      	move.l 464(sp),-(sp)
    6204:	2f2f 0056      	move.l 86(sp),-(sp)
    6208:	4eba 0b10      	jsr 6d1a <TestRow>(pc)
    620c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6210:	7230           	moveq #48,d1
    6212:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6216:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {
    621a:	52af 00d2      	addq.l #1,210(sp)
    621e:	7008           	moveq #8,d0
    6220:	b0af 00d2      	cmp.l 210(sp),d0
    6224:	6c9c           	bge.s 61c2 <TestZoom4Picture+0x230a>
  } 

  for(int i=0;i<7;i++) {
    6226:	42af 00ce      	clr.l 206(sp)
    622a:	6000 00cc      	bra.w 62f8 <TestZoom4Picture+0x2440>
    for(int i2=0;i2<4;i2++) {  
    622e:	42af 00ca      	clr.l 202(sp)
    6232:	6036           	bra.s 626a <TestZoom4Picture+0x23b2>
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    6234:	7213           	moveq #19,d1
    6236:	d2af 00ca      	add.l 202(sp),d1
    623a:	202f 00ce      	move.l 206(sp),d0
    623e:	eb88           	lsl.l #5,d0
    6240:	d280           	add.l d0,d1
    6242:	7000           	moveq #0,d0
    6244:	302f 01c6      	move.w 454(sp),d0
    6248:	2f01           	move.l d1,-(sp)
    624a:	2f00           	move.l d0,-(sp)
    624c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6250:	2f2f 0056      	move.l 86(sp),-(sp)
    6254:	4eba 0ac4      	jsr 6d1a <TestRow>(pc)
    6258:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    625c:	7230           	moveq #48,d1
    625e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6262:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<4;i2++) {  
    6266:	52af 00ca      	addq.l #1,202(sp)
    626a:	7003           	moveq #3,d0
    626c:	b0af 00ca      	cmp.l 202(sp),d0
    6270:	6cc2           	bge.s 6234 <TestZoom4Picture+0x237c>
    }
    
    for(int i2=0;i2<14;i2++) {
    6272:	42af 00c6      	clr.l 198(sp)
    6276:	6074           	bra.s 62ec <TestZoom4Picture+0x2434>
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    6278:	202f 00ce      	move.l 206(sp),d0
    627c:	eb88           	lsl.l #5,d0
    627e:	307c 0017      	movea.w #23,a0
    6282:	d1c0           	adda.l d0,a0
    6284:	202f 00c6      	move.l 198(sp),d0
    6288:	d080           	add.l d0,d0
    628a:	2208           	move.l a0,d1
    628c:	d280           	add.l d0,d1
    628e:	7000           	moveq #0,d0
    6290:	302f 01c6      	move.w 454(sp),d0
    6294:	2f01           	move.l d1,-(sp)
    6296:	2f00           	move.l d0,-(sp)
    6298:	2f2f 01d0      	move.l 464(sp),-(sp)
    629c:	2f2f 0056      	move.l 86(sp),-(sp)
    62a0:	4eba 0a78      	jsr 6d1a <TestRow>(pc)
    62a4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    62a8:	7230           	moveq #48,d1
    62aa:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    62ae:	202f 00ce      	move.l 206(sp),d0
    62b2:	eb88           	lsl.l #5,d0
    62b4:	307c 0018      	movea.w #24,a0
    62b8:	d1c0           	adda.l d0,a0
    62ba:	202f 00c6      	move.l 198(sp),d0
    62be:	d080           	add.l d0,d0
    62c0:	2208           	move.l a0,d1
    62c2:	d280           	add.l d0,d1
    62c4:	7000           	moveq #0,d0
    62c6:	302f 01c6      	move.w 454(sp),d0
    62ca:	2f01           	move.l d1,-(sp)
    62cc:	2f00           	move.l d0,-(sp)
    62ce:	2f2f 01d0      	move.l 464(sp),-(sp)
    62d2:	2f2f 0056      	move.l 86(sp),-(sp)
    62d6:	4eba 0a42      	jsr 6d1a <TestRow>(pc)
    62da:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    62de:	7030           	moveq #48,d0
    62e0:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    62e4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {
    62e8:	52af 00c6      	addq.l #1,198(sp)
    62ec:	720d           	moveq #13,d1
    62ee:	b2af 00c6      	cmp.l 198(sp),d1
    62f2:	6c84           	bge.s 6278 <TestZoom4Picture+0x23c0>
  for(int i=0;i<7;i++) {
    62f4:	52af 00ce      	addq.l #1,206(sp)
    62f8:	7006           	moveq #6,d0
    62fa:	b0af 00ce      	cmp.l 206(sp),d0
    62fe:	6c00 ff2e      	bge.w 622e <TestZoom4Picture+0x2376>
    }
  }

  for(int i2=0;i2<4;i2++) {  
    6302:	42af 00c2      	clr.l 194(sp)
    6306:	6032           	bra.s 633a <TestZoom4Picture+0x2482>
    TestRow( valsupposed, valactual, mask, 243+i2);
    6308:	222f 00c2      	move.l 194(sp),d1
    630c:	0681 0000 00f3 	addi.l #243,d1
    6312:	7000           	moveq #0,d0
    6314:	302f 01c6      	move.w 454(sp),d0
    6318:	2f01           	move.l d1,-(sp)
    631a:	2f00           	move.l d0,-(sp)
    631c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6320:	2f2f 0056      	move.l 86(sp),-(sp)
    6324:	4eba 09f4      	jsr 6d1a <TestRow>(pc)
    6328:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    632c:	7230           	moveq #48,d1
    632e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6332:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {  
    6336:	52af 00c2      	addq.l #1,194(sp)
    633a:	7003           	moveq #3,d0
    633c:	b0af 00c2      	cmp.l 194(sp),d0
    6340:	6cc6           	bge.s 6308 <TestZoom4Picture+0x2450>
  }

  for(int i2=0;i2<12;i2++) {
    6342:	42af 00be      	clr.l 190(sp)
    6346:	6060           	bra.s 63a8 <TestZoom4Picture+0x24f0>
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    6348:	202f 00be      	move.l 190(sp),d0
    634c:	d080           	add.l d0,d0
    634e:	2200           	move.l d0,d1
    6350:	0681 0000 00f7 	addi.l #247,d1
    6356:	7000           	moveq #0,d0
    6358:	302f 01c6      	move.w 454(sp),d0
    635c:	2f01           	move.l d1,-(sp)
    635e:	2f00           	move.l d0,-(sp)
    6360:	2f2f 01d0      	move.l 464(sp),-(sp)
    6364:	2f2f 0056      	move.l 86(sp),-(sp)
    6368:	4eba 09b0      	jsr 6d1a <TestRow>(pc)
    636c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6370:	7230           	moveq #48,d1
    6372:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    6376:	707c           	moveq #124,d0
    6378:	d0af 00be      	add.l 190(sp),d0
    637c:	d080           	add.l d0,d0
    637e:	2200           	move.l d0,d1
    6380:	7000           	moveq #0,d0
    6382:	302f 01c6      	move.w 454(sp),d0
    6386:	2f01           	move.l d1,-(sp)
    6388:	2f00           	move.l d0,-(sp)
    638a:	2f2f 01d0      	move.l 464(sp),-(sp)
    638e:	2f2f 0056      	move.l 86(sp),-(sp)
    6392:	4eba 0986      	jsr 6d1a <TestRow>(pc)
    6396:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    639a:	7030           	moveq #48,d0
    639c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    63a0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    63a4:	52af 00be      	addq.l #1,190(sp)
    63a8:	720b           	moveq #11,d1
    63aa:	b2af 00be      	cmp.l 190(sp),d1
    63ae:	6c98           	bge.s 6348 <TestZoom4Picture+0x2490>
  }

  tmp = source;
    63b0:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    63b6:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    63bc:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    63c2:	4878 0001      	pea 1 <_start+0x1>
    63c6:	4878 000e      	pea e <_start+0xe>
    63ca:	2f2f 0056      	move.l 86(sp),-(sp)
    63ce:	2f2f 006a      	move.l 106(sp),-(sp)
    63d2:	4eba b8f0      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    63d6:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    63da:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    63e0:	2c40           	movea.l d0,a6
    63e2:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    63e6:	202f 004e      	move.l 78(sp),d0
    63ea:	5880           	addq.l #4,d0
    63ec:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom15;
    63f0:	2f7c 0001 ba70 	move.l #113264,74(sp)
    63f6:	004a 

  mask = 0x0000;
    63f8:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<8;i2++) {
    63fc:	42af 00ba      	clr.l 186(sp)
    6400:	605a           	bra.s 645c <TestZoom4Picture+0x25a4>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6402:	202f 00ba      	move.l 186(sp),d0
    6406:	d080           	add.l d0,d0
    6408:	2200           	move.l d0,d1
    640a:	7000           	moveq #0,d0
    640c:	302f 01c6      	move.w 454(sp),d0
    6410:	2f01           	move.l d1,-(sp)
    6412:	2f00           	move.l d0,-(sp)
    6414:	2f2f 01d0      	move.l 464(sp),-(sp)
    6418:	2f2f 0056      	move.l 86(sp),-(sp)
    641c:	4eba 08fc      	jsr 6d1a <TestRow>(pc)
    6420:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6424:	7230           	moveq #48,d1
    6426:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    642a:	202f 00ba      	move.l 186(sp),d0
    642e:	d080           	add.l d0,d0
    6430:	2200           	move.l d0,d1
    6432:	5281           	addq.l #1,d1
    6434:	7000           	moveq #0,d0
    6436:	302f 01c6      	move.w 454(sp),d0
    643a:	2f01           	move.l d1,-(sp)
    643c:	2f00           	move.l d0,-(sp)
    643e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6442:	2f2f 0056      	move.l 86(sp),-(sp)
    6446:	4eba 08d2      	jsr 6d1a <TestRow>(pc)
    644a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    644e:	7030           	moveq #48,d0
    6450:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6454:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    6458:	52af 00ba      	addq.l #1,186(sp)
    645c:	7207           	moveq #7,d1
    645e:	b2af 00ba      	cmp.l 186(sp),d1
    6462:	6c9e           	bge.s 6402 <TestZoom4Picture+0x254a>
  }

  for(int i=0;i<7;i++) {
    6464:	42af 00b6      	clr.l 182(sp)
    6468:	6000 00de      	bra.w 6548 <TestZoom4Picture+0x2690>
    for(int i2=0;i2<3;i2++) {  
    646c:	42af 00b2      	clr.l 178(sp)
    6470:	603e           	bra.s 64b0 <TestZoom4Picture+0x25f8>
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    6472:	307c 0010      	movea.w #16,a0
    6476:	d1ef 00b2      	adda.l 178(sp),a0
    647a:	222f 00b6      	move.l 182(sp),d1
    647e:	2001           	move.l d1,d0
    6480:	eb88           	lsl.l #5,d0
    6482:	d081           	add.l d1,d0
    6484:	2208           	move.l a0,d1
    6486:	d280           	add.l d0,d1
    6488:	7000           	moveq #0,d0
    648a:	302f 01c6      	move.w 454(sp),d0
    648e:	2f01           	move.l d1,-(sp)
    6490:	2f00           	move.l d0,-(sp)
    6492:	2f2f 01d0      	move.l 464(sp),-(sp)
    6496:	2f2f 0056      	move.l 86(sp),-(sp)
    649a:	4eba 087e      	jsr 6d1a <TestRow>(pc)
    649e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    64a2:	7030           	moveq #48,d0
    64a4:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    64a8:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<3;i2++) {  
    64ac:	52af 00b2      	addq.l #1,178(sp)
    64b0:	7202           	moveq #2,d1
    64b2:	b2af 00b2      	cmp.l 178(sp),d1
    64b6:	6cba           	bge.s 6472 <TestZoom4Picture+0x25ba>
    }
    
    for(int i2=0;i2<15;i2++) {
    64b8:	42af 00ae      	clr.l 174(sp)
    64bc:	607c           	bra.s 653a <TestZoom4Picture+0x2682>
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    64be:	222f 00b6      	move.l 182(sp),d1
    64c2:	2001           	move.l d1,d0
    64c4:	eb88           	lsl.l #5,d0
    64c6:	2040           	movea.l d0,a0
    64c8:	d1c1           	adda.l d1,a0
    64ca:	41e8 0013      	lea 19(a0),a0
    64ce:	202f 00ae      	move.l 174(sp),d0
    64d2:	d080           	add.l d0,d0
    64d4:	2208           	move.l a0,d1
    64d6:	d280           	add.l d0,d1
    64d8:	7000           	moveq #0,d0
    64da:	302f 01c6      	move.w 454(sp),d0
    64de:	2f01           	move.l d1,-(sp)
    64e0:	2f00           	move.l d0,-(sp)
    64e2:	2f2f 01d0      	move.l 464(sp),-(sp)
    64e6:	2f2f 0056      	move.l 86(sp),-(sp)
    64ea:	4eba 082e      	jsr 6d1a <TestRow>(pc)
    64ee:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    64f2:	7030           	moveq #48,d0
    64f4:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    64f8:	222f 00b6      	move.l 182(sp),d1
    64fc:	2001           	move.l d1,d0
    64fe:	eb88           	lsl.l #5,d0
    6500:	2040           	movea.l d0,a0
    6502:	d1c1           	adda.l d1,a0
    6504:	41e8 0013      	lea 19(a0),a0
    6508:	202f 00ae      	move.l 174(sp),d0
    650c:	d080           	add.l d0,d0
    650e:	2208           	move.l a0,d1
    6510:	d280           	add.l d0,d1
    6512:	7000           	moveq #0,d0
    6514:	302f 01c6      	move.w 454(sp),d0
    6518:	2f01           	move.l d1,-(sp)
    651a:	2f00           	move.l d0,-(sp)
    651c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6520:	2f2f 0056      	move.l 86(sp),-(sp)
    6524:	4eba 07f4      	jsr 6d1a <TestRow>(pc)
    6528:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    652c:	7230           	moveq #48,d1
    652e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6532:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {
    6536:	52af 00ae      	addq.l #1,174(sp)
    653a:	700e           	moveq #14,d0
    653c:	b0af 00ae      	cmp.l 174(sp),d0
    6540:	6c00 ff7c      	bge.w 64be <TestZoom4Picture+0x2606>
  for(int i=0;i<7;i++) {
    6544:	52af 00b6      	addq.l #1,182(sp)
    6548:	7206           	moveq #6,d1
    654a:	b2af 00b6      	cmp.l 182(sp),d1
    654e:	6c00 ff1c      	bge.w 646c <TestZoom4Picture+0x25b4>
    }
  }

  for(int i2=0;i2<3;i2++) {  
    6552:	42af 00aa      	clr.l 170(sp)
    6556:	6032           	bra.s 658a <TestZoom4Picture+0x26d2>
    TestRow( valsupposed, valactual, mask, 247+i2);
    6558:	222f 00aa      	move.l 170(sp),d1
    655c:	0681 0000 00f7 	addi.l #247,d1
    6562:	7000           	moveq #0,d0
    6564:	302f 01c6      	move.w 454(sp),d0
    6568:	2f01           	move.l d1,-(sp)
    656a:	2f00           	move.l d0,-(sp)
    656c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6570:	2f2f 0056      	move.l 86(sp),-(sp)
    6574:	4eba 07a4      	jsr 6d1a <TestRow>(pc)
    6578:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    657c:	7030           	moveq #48,d0
    657e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6582:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<3;i2++) {  
    6586:	52af 00aa      	addq.l #1,170(sp)
    658a:	7202           	moveq #2,d1
    658c:	b2af 00aa      	cmp.l 170(sp),d1
    6590:	6cc6           	bge.s 6558 <TestZoom4Picture+0x26a0>
  }

  for(int i2=0;i2<10;i2++) {
    6592:	42af 00a6      	clr.l 166(sp)
    6596:	6060           	bra.s 65f8 <TestZoom4Picture+0x2740>
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    6598:	707d           	moveq #125,d0
    659a:	d0af 00a6      	add.l 166(sp),d0
    659e:	d080           	add.l d0,d0
    65a0:	2200           	move.l d0,d1
    65a2:	7000           	moveq #0,d0
    65a4:	302f 01c6      	move.w 454(sp),d0
    65a8:	2f01           	move.l d1,-(sp)
    65aa:	2f00           	move.l d0,-(sp)
    65ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    65b0:	2f2f 0056      	move.l 86(sp),-(sp)
    65b4:	4eba 0764      	jsr 6d1a <TestRow>(pc)
    65b8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    65bc:	7030           	moveq #48,d0
    65be:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    65c2:	202f 00a6      	move.l 166(sp),d0
    65c6:	d080           	add.l d0,d0
    65c8:	2200           	move.l d0,d1
    65ca:	0681 0000 00fb 	addi.l #251,d1
    65d0:	7000           	moveq #0,d0
    65d2:	302f 01c6      	move.w 454(sp),d0
    65d6:	2f01           	move.l d1,-(sp)
    65d8:	2f00           	move.l d0,-(sp)
    65da:	2f2f 01d0      	move.l 464(sp),-(sp)
    65de:	2f2f 0056      	move.l 86(sp),-(sp)
    65e2:	4eba 0736      	jsr 6d1a <TestRow>(pc)
    65e6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    65ea:	7230           	moveq #48,d1
    65ec:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    65f0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {
    65f4:	52af 00a6      	addq.l #1,166(sp)
    65f8:	7009           	moveq #9,d0
    65fa:	b0af 00a6      	cmp.l 166(sp),d0
    65fe:	6c98           	bge.s 6598 <TestZoom4Picture+0x26e0>
  }

  tmp = source;
    6600:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6606:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    660c:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    6612:	4878 0001      	pea 1 <_start+0x1>
    6616:	4878 000f      	pea f <_start+0xf>
    661a:	2f2f 0056      	move.l 86(sp),-(sp)
    661e:	2f2f 006a      	move.l 106(sp),-(sp)
    6622:	4eba b6a0      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    6626:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    662a:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    6630:	2c40           	movea.l d0,a6
    6632:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6636:	222f 004e      	move.l 78(sp),d1
    663a:	5881           	addq.l #4,d1
    663c:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom16;
    6640:	2f7c 0001 ba9c 	move.l #113308,74(sp)
    6646:	004a 

  mask = 0x0000;
    6648:	426f 01c6      	clr.w 454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    664c:	7000           	moveq #0,d0
    664e:	302f 01c6      	move.w 454(sp),d0
    6652:	42a7           	clr.l -(sp)
    6654:	2f00           	move.l d0,-(sp)
    6656:	2f2f 01d0      	move.l 464(sp),-(sp)
    665a:	2f2f 0056      	move.l 86(sp),-(sp)
    665e:	4eba 06ba      	jsr 6d1a <TestRow>(pc)
    6662:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6666:	7030           	moveq #48,d0
    6668:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    666c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    6670:	42af 00a2      	clr.l 162(sp)
    6674:	605a           	bra.s 66d0 <TestZoom4Picture+0x2818>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6676:	202f 00a2      	move.l 162(sp),d0
    667a:	d080           	add.l d0,d0
    667c:	2200           	move.l d0,d1
    667e:	7000           	moveq #0,d0
    6680:	302f 01c6      	move.w 454(sp),d0
    6684:	2f01           	move.l d1,-(sp)
    6686:	2f00           	move.l d0,-(sp)
    6688:	2f2f 01d0      	move.l 464(sp),-(sp)
    668c:	2f2f 0056      	move.l 86(sp),-(sp)
    6690:	4eba 0688      	jsr 6d1a <TestRow>(pc)
    6694:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6698:	7230           	moveq #48,d1
    669a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    669e:	202f 00a2      	move.l 162(sp),d0
    66a2:	d080           	add.l d0,d0
    66a4:	2200           	move.l d0,d1
    66a6:	5281           	addq.l #1,d1
    66a8:	7000           	moveq #0,d0
    66aa:	302f 01c6      	move.w 454(sp),d0
    66ae:	2f01           	move.l d1,-(sp)
    66b0:	2f00           	move.l d0,-(sp)
    66b2:	2f2f 01d0      	move.l 464(sp),-(sp)
    66b6:	2f2f 0056      	move.l 86(sp),-(sp)
    66ba:	4eba 065e      	jsr 6d1a <TestRow>(pc)
    66be:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66c2:	7030           	moveq #48,d0
    66c4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    66c8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    66cc:	52af 00a2      	addq.l #1,162(sp)
    66d0:	7205           	moveq #5,d1
    66d2:	b2af 00a2      	cmp.l 162(sp),d1
    66d6:	6c9e           	bge.s 6676 <TestZoom4Picture+0x27be>
  }

  for(int i=0;i<7;i++) {
    66d8:	42af 009e      	clr.l 158(sp)
    66dc:	6000 00e6      	bra.w 67c4 <TestZoom4Picture+0x290c>
    for(int i2=0;i2<2;i2++) {  
    66e0:	42af 009a      	clr.l 154(sp)
    66e4:	6040           	bra.s 6726 <TestZoom4Picture+0x286e>
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    66e6:	307c 000d      	movea.w #13,a0
    66ea:	d1ef 009a      	adda.l 154(sp),a0
    66ee:	222f 009e      	move.l 158(sp),d1
    66f2:	2001           	move.l d1,d0
    66f4:	e988           	lsl.l #4,d0
    66f6:	d081           	add.l d1,d0
    66f8:	d080           	add.l d0,d0
    66fa:	2208           	move.l a0,d1
    66fc:	d280           	add.l d0,d1
    66fe:	7000           	moveq #0,d0
    6700:	302f 01c6      	move.w 454(sp),d0
    6704:	2f01           	move.l d1,-(sp)
    6706:	2f00           	move.l d0,-(sp)
    6708:	2f2f 01d0      	move.l 464(sp),-(sp)
    670c:	2f2f 0056      	move.l 86(sp),-(sp)
    6710:	4eba 0608      	jsr 6d1a <TestRow>(pc)
    6714:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6718:	7030           	moveq #48,d0
    671a:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    671e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<2;i2++) {  
    6722:	52af 009a      	addq.l #1,154(sp)
    6726:	7201           	moveq #1,d1
    6728:	b2af 009a      	cmp.l 154(sp),d1
    672c:	6cb8           	bge.s 66e6 <TestZoom4Picture+0x282e>
    }
    
    for(int i2=0;i2<16;i2++) {
    672e:	42af 0096      	clr.l 150(sp)
    6732:	6000 0082      	bra.w 67b6 <TestZoom4Picture+0x28fe>
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    6736:	222f 009e      	move.l 158(sp),d1
    673a:	2001           	move.l d1,d0
    673c:	e988           	lsl.l #4,d0
    673e:	d081           	add.l d1,d0
    6740:	d080           	add.l d0,d0
    6742:	2040           	movea.l d0,a0
    6744:	41e8 0010      	lea 16(a0),a0
    6748:	202f 0096      	move.l 150(sp),d0
    674c:	d080           	add.l d0,d0
    674e:	2208           	move.l a0,d1
    6750:	d280           	add.l d0,d1
    6752:	7000           	moveq #0,d0
    6754:	302f 01c6      	move.w 454(sp),d0
    6758:	2f01           	move.l d1,-(sp)
    675a:	2f00           	move.l d0,-(sp)
    675c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6760:	2f2f 0056      	move.l 86(sp),-(sp)
    6764:	4eba 05b4      	jsr 6d1a <TestRow>(pc)
    6768:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    676c:	7030           	moveq #48,d0
    676e:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    6772:	222f 009e      	move.l 158(sp),d1
    6776:	2001           	move.l d1,d0
    6778:	e988           	lsl.l #4,d0
    677a:	d081           	add.l d1,d0
    677c:	d080           	add.l d0,d0
    677e:	2040           	movea.l d0,a0
    6780:	41e8 0011      	lea 17(a0),a0
    6784:	202f 0096      	move.l 150(sp),d0
    6788:	d080           	add.l d0,d0
    678a:	2208           	move.l a0,d1
    678c:	d280           	add.l d0,d1
    678e:	7000           	moveq #0,d0
    6790:	302f 01c6      	move.w 454(sp),d0
    6794:	2f01           	move.l d1,-(sp)
    6796:	2f00           	move.l d0,-(sp)
    6798:	2f2f 01d0      	move.l 464(sp),-(sp)
    679c:	2f2f 0056      	move.l 86(sp),-(sp)
    67a0:	4eba 0578      	jsr 6d1a <TestRow>(pc)
    67a4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    67a8:	7230           	moveq #48,d1
    67aa:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    67ae:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {
    67b2:	52af 0096      	addq.l #1,150(sp)
    67b6:	700f           	moveq #15,d0
    67b8:	b0af 0096      	cmp.l 150(sp),d0
    67bc:	6c00 ff78      	bge.w 6736 <TestZoom4Picture+0x287e>
  for(int i=0;i<7;i++) {
    67c0:	52af 009e      	addq.l #1,158(sp)
    67c4:	7206           	moveq #6,d1
    67c6:	b2af 009e      	cmp.l 158(sp),d1
    67ca:	6c00 ff14      	bge.w 66e0 <TestZoom4Picture+0x2828>
    }
  }

  for(int i2=0;i2<2;i2++) {
    67ce:	42af 0092      	clr.l 146(sp)
    67d2:	6032           	bra.s 6806 <TestZoom4Picture+0x294e>
    TestRow( valsupposed, valactual, mask, 251+i2);
    67d4:	222f 0092      	move.l 146(sp),d1
    67d8:	0681 0000 00fb 	addi.l #251,d1
    67de:	7000           	moveq #0,d0
    67e0:	302f 01c6      	move.w 454(sp),d0
    67e4:	2f01           	move.l d1,-(sp)
    67e6:	2f00           	move.l d0,-(sp)
    67e8:	2f2f 01d0      	move.l 464(sp),-(sp)
    67ec:	2f2f 0056      	move.l 86(sp),-(sp)
    67f0:	4eba 0528      	jsr 6d1a <TestRow>(pc)
    67f4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    67f8:	7030           	moveq #48,d0
    67fa:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    67fe:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<2;i2++) {
    6802:	52af 0092      	addq.l #1,146(sp)
    6806:	7201           	moveq #1,d1
    6808:	b2af 0092      	cmp.l 146(sp),d1
    680c:	6cc6           	bge.s 67d4 <TestZoom4Picture+0x291c>
  }

  for(int i2=0;i2<8;i2++) {
    680e:	42af 008e      	clr.l 142(sp)
    6812:	6060           	bra.s 6874 <TestZoom4Picture+0x29bc>
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    6814:	202f 008e      	move.l 142(sp),d0
    6818:	d080           	add.l d0,d0
    681a:	2200           	move.l d0,d1
    681c:	0681 0000 00fd 	addi.l #253,d1
    6822:	7000           	moveq #0,d0
    6824:	302f 01c6      	move.w 454(sp),d0
    6828:	2f01           	move.l d1,-(sp)
    682a:	2f00           	move.l d0,-(sp)
    682c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6830:	2f2f 0056      	move.l 86(sp),-(sp)
    6834:	4eba 04e4      	jsr 6d1a <TestRow>(pc)
    6838:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    683c:	7030           	moveq #48,d0
    683e:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    6842:	707f           	moveq #127,d0
    6844:	d0af 008e      	add.l 142(sp),d0
    6848:	d080           	add.l d0,d0
    684a:	2200           	move.l d0,d1
    684c:	7000           	moveq #0,d0
    684e:	302f 01c6      	move.w 454(sp),d0
    6852:	2f01           	move.l d1,-(sp)
    6854:	2f00           	move.l d0,-(sp)
    6856:	2f2f 01d0      	move.l 464(sp),-(sp)
    685a:	2f2f 0056      	move.l 86(sp),-(sp)
    685e:	4eba 04ba      	jsr 6d1a <TestRow>(pc)
    6862:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6866:	7230           	moveq #48,d1
    6868:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    686c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    6870:	52af 008e      	addq.l #1,142(sp)
    6874:	7007           	moveq #7,d0
    6876:	b0af 008e      	cmp.l 142(sp),d0
    687a:	6c98           	bge.s 6814 <TestZoom4Picture+0x295c>
  }

  tmp = source;
    687c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6882:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6888:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    688e:	4878 0001      	pea 1 <_start+0x1>
    6892:	4878 0010      	pea 10 <_start+0x10>
    6896:	2f2f 0056      	move.l 86(sp),-(sp)
    689a:	2f2f 006a      	move.l 106(sp),-(sp)
    689e:	4eba b424      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    68a2:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    68a6:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    68ac:	2c40           	movea.l d0,a6
    68ae:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    68b2:	222f 004e      	move.l 78(sp),d1
    68b6:	5881           	addq.l #4,d1
    68b8:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom17;
    68bc:	2f7c 0001 bac8 	move.l #113352,74(sp)
    68c2:	004a 

  mask = 0xffff;
    68c4:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<5;i2++) {
    68ca:	42af 008a      	clr.l 138(sp)
    68ce:	605a           	bra.s 692a <TestZoom4Picture+0x2a72>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    68d0:	202f 008a      	move.l 138(sp),d0
    68d4:	d080           	add.l d0,d0
    68d6:	2200           	move.l d0,d1
    68d8:	7000           	moveq #0,d0
    68da:	302f 01c6      	move.w 454(sp),d0
    68de:	2f01           	move.l d1,-(sp)
    68e0:	2f00           	move.l d0,-(sp)
    68e2:	2f2f 01d0      	move.l 464(sp),-(sp)
    68e6:	2f2f 0056      	move.l 86(sp),-(sp)
    68ea:	4eba 042e      	jsr 6d1a <TestRow>(pc)
    68ee:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    68f2:	7030           	moveq #48,d0
    68f4:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    68f8:	202f 008a      	move.l 138(sp),d0
    68fc:	d080           	add.l d0,d0
    68fe:	2200           	move.l d0,d1
    6900:	5281           	addq.l #1,d1
    6902:	7000           	moveq #0,d0
    6904:	302f 01c6      	move.w 454(sp),d0
    6908:	2f01           	move.l d1,-(sp)
    690a:	2f00           	move.l d0,-(sp)
    690c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6910:	2f2f 0056      	move.l 86(sp),-(sp)
    6914:	4eba 0404      	jsr 6d1a <TestRow>(pc)
    6918:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    691c:	7230           	moveq #48,d1
    691e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6922:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {
    6926:	52af 008a      	addq.l #1,138(sp)
    692a:	7004           	moveq #4,d0
    692c:	b0af 008a      	cmp.l 138(sp),d0
    6930:	6c9e           	bge.s 68d0 <TestZoom4Picture+0x2a18>
  }

  for(int i=0;i<7;i++) {
    6932:	42af 0086      	clr.l 134(sp)
    6936:	6000 00d4      	bra.w 6a0c <TestZoom4Picture+0x2b54>
      TestRow( valsupposed, valactual, mask, 10+i*35);
    693a:	222f 0086      	move.l 134(sp),d1
    693e:	2001           	move.l d1,d0
    6940:	e988           	lsl.l #4,d0
    6942:	d081           	add.l d1,d0
    6944:	d080           	add.l d0,d0
    6946:	2040           	movea.l d0,a0
    6948:	d1c1           	adda.l d1,a0
    694a:	41e8 000a      	lea 10(a0),a0
    694e:	7000           	moveq #0,d0
    6950:	302f 01c6      	move.w 454(sp),d0
    6954:	2f08           	move.l a0,-(sp)
    6956:	2f00           	move.l d0,-(sp)
    6958:	2f2f 01d0      	move.l 464(sp),-(sp)
    695c:	2f2f 0056      	move.l 86(sp),-(sp)
    6960:	4eba 03b8      	jsr 6d1a <TestRow>(pc)
    6964:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6968:	7230           	moveq #48,d1
    696a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    696e:	466f 01c6      	not.w 454(sp)
    
    for(int i2=0;i2<17;i2++) {
    6972:	42af 0082      	clr.l 130(sp)
    6976:	6000 0086      	bra.w 69fe <TestZoom4Picture+0x2b46>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    697a:	222f 0086      	move.l 134(sp),d1
    697e:	2001           	move.l d1,d0
    6980:	e988           	lsl.l #4,d0
    6982:	d081           	add.l d1,d0
    6984:	d080           	add.l d0,d0
    6986:	2040           	movea.l d0,a0
    6988:	d1c1           	adda.l d1,a0
    698a:	41e8 000b      	lea 11(a0),a0
    698e:	202f 0082      	move.l 130(sp),d0
    6992:	d080           	add.l d0,d0
    6994:	2208           	move.l a0,d1
    6996:	d280           	add.l d0,d1
    6998:	7000           	moveq #0,d0
    699a:	302f 01c6      	move.w 454(sp),d0
    699e:	2f01           	move.l d1,-(sp)
    69a0:	2f00           	move.l d0,-(sp)
    69a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    69a6:	2f2f 0056      	move.l 86(sp),-(sp)
    69aa:	4eba 036e      	jsr 6d1a <TestRow>(pc)
    69ae:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    69b2:	7030           	moveq #48,d0
    69b4:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    69b8:	222f 0086      	move.l 134(sp),d1
    69bc:	2001           	move.l d1,d0
    69be:	e988           	lsl.l #4,d0
    69c0:	d081           	add.l d1,d0
    69c2:	d080           	add.l d0,d0
    69c4:	2040           	movea.l d0,a0
    69c6:	d1c1           	adda.l d1,a0
    69c8:	41e8 000c      	lea 12(a0),a0
    69cc:	202f 0082      	move.l 130(sp),d0
    69d0:	d080           	add.l d0,d0
    69d2:	2208           	move.l a0,d1
    69d4:	d280           	add.l d0,d1
    69d6:	7000           	moveq #0,d0
    69d8:	302f 01c6      	move.w 454(sp),d0
    69dc:	2f01           	move.l d1,-(sp)
    69de:	2f00           	move.l d0,-(sp)
    69e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    69e4:	2f2f 0056      	move.l 86(sp),-(sp)
    69e8:	4eba 0330      	jsr 6d1a <TestRow>(pc)
    69ec:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    69f0:	7230           	moveq #48,d1
    69f2:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    69f6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<17;i2++) {
    69fa:	52af 0082      	addq.l #1,130(sp)
    69fe:	7010           	moveq #16,d0
    6a00:	b0af 0082      	cmp.l 130(sp),d0
    6a04:	6c00 ff74      	bge.w 697a <TestZoom4Picture+0x2ac2>
  for(int i=0;i<7;i++) {
    6a08:	52af 0086      	addq.l #1,134(sp)
    6a0c:	7206           	moveq #6,d1
    6a0e:	b2af 0086      	cmp.l 134(sp),d1
    6a12:	6c00 ff26      	bge.w 693a <TestZoom4Picture+0x2a82>
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    6a16:	7000           	moveq #0,d0
    6a18:	302f 01c6      	move.w 454(sp),d0
    6a1c:	4878 00ff      	pea ff <FreeDisplay+0x1f>
    6a20:	2f00           	move.l d0,-(sp)
    6a22:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a26:	2f2f 0056      	move.l 86(sp),-(sp)
    6a2a:	4eba 02ee      	jsr 6d1a <TestRow>(pc)
    6a2e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6a32:	7030           	moveq #48,d0
    6a34:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6a38:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<7;i2++) {
    6a3c:	42af 007e      	clr.l 126(sp)
    6a40:	6064           	bra.s 6aa6 <TestZoom4Picture+0x2bee>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6a42:	202f 007e      	move.l 126(sp),d0
    6a46:	0680 0000 0080 	addi.l #128,d0
    6a4c:	d080           	add.l d0,d0
    6a4e:	2200           	move.l d0,d1
    6a50:	7000           	moveq #0,d0
    6a52:	302f 01c6      	move.w 454(sp),d0
    6a56:	2f01           	move.l d1,-(sp)
    6a58:	2f00           	move.l d0,-(sp)
    6a5a:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a5e:	2f2f 0056      	move.l 86(sp),-(sp)
    6a62:	4eba 02b6      	jsr 6d1a <TestRow>(pc)
    6a66:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a6a:	7230           	moveq #48,d1
    6a6c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6a70:	202f 007e      	move.l 126(sp),d0
    6a74:	d080           	add.l d0,d0
    6a76:	2200           	move.l d0,d1
    6a78:	0681 0000 0101 	addi.l #257,d1
    6a7e:	7000           	moveq #0,d0
    6a80:	302f 01c6      	move.w 454(sp),d0
    6a84:	2f01           	move.l d1,-(sp)
    6a86:	2f00           	move.l d0,-(sp)
    6a88:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a8c:	2f2f 0056      	move.l 86(sp),-(sp)
    6a90:	4eba 0288      	jsr 6d1a <TestRow>(pc)
    6a94:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a98:	7030           	moveq #48,d0
    6a9a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6a9e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {
    6aa2:	52af 007e      	addq.l #1,126(sp)
    6aa6:	7206           	moveq #6,d1
    6aa8:	b2af 007e      	cmp.l 126(sp),d1
    6aac:	6c94           	bge.s 6a42 <TestZoom4Picture+0x2b8a>
  }   

  tmp = source;
    6aae:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6ab4:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6aba:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    6ac0:	4878 0001      	pea 1 <_start+0x1>
    6ac4:	4878 0011      	pea 11 <_start+0x11>
    6ac8:	2f2f 0056      	move.l 86(sp),-(sp)
    6acc:	2f2f 006a      	move.l 106(sp),-(sp)
    6ad0:	4eba b1f2      	jsr 1cc4 <Zoom_ZoomIntoPicture>(pc)
    6ad4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6ad8:	2039 0002 8354 	move.l 28354 <GfxBase>,d0
    6ade:	2c40           	movea.l d0,a6
    6ae0:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6ae4:	202f 004e      	move.l 78(sp),d0
    6ae8:	5880           	addq.l #4,d0
    6aea:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom18;
    6aee:	2f7c 0001 baf4 	move.l #113396,74(sp)
    6af4:	004a 

  mask = 0xffff;
    6af6:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);
    6afc:	7000           	moveq #0,d0
    6afe:	302f 01c6      	move.w 454(sp),d0
    6b02:	42a7           	clr.l -(sp)
    6b04:	2f00           	move.l d0,-(sp)
    6b06:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b0a:	2f2f 0056      	move.l 86(sp),-(sp)
    6b0e:	4eba 020a      	jsr 6d1a <TestRow>(pc)
    6b12:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6b16:	7230           	moveq #48,d1
    6b18:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    6b1c:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<4;i2++) {
    6b20:	42af 007a      	clr.l 122(sp)
    6b24:	605c           	bra.s 6b82 <TestZoom4Picture+0x2cca>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    6b26:	202f 007a      	move.l 122(sp),d0
    6b2a:	d080           	add.l d0,d0
    6b2c:	2200           	move.l d0,d1
    6b2e:	5281           	addq.l #1,d1
    6b30:	7000           	moveq #0,d0
    6b32:	302f 01c6      	move.w 454(sp),d0
    6b36:	2f01           	move.l d1,-(sp)
    6b38:	2f00           	move.l d0,-(sp)
    6b3a:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b3e:	2f2f 0056      	move.l 86(sp),-(sp)
    6b42:	4eba 01d6      	jsr 6d1a <TestRow>(pc)
    6b46:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6b4a:	7030           	moveq #48,d0
    6b4c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    6b50:	202f 007a      	move.l 122(sp),d0
    6b54:	5280           	addq.l #1,d0
    6b56:	d080           	add.l d0,d0
    6b58:	2200           	move.l d0,d1
    6b5a:	7000           	moveq #0,d0
    6b5c:	302f 01c6      	move.w 454(sp),d0
    6b60:	2f01           	move.l d1,-(sp)
    6b62:	2f00           	move.l d0,-(sp)
    6b64:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b68:	2f2f 0056      	move.l 86(sp),-(sp)
    6b6c:	4eba 01ac      	jsr 6d1a <TestRow>(pc)
    6b70:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6b74:	7230           	moveq #48,d1
    6b76:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6b7a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6b7e:	52af 007a      	addq.l #1,122(sp)
    6b82:	7003           	moveq #3,d0
    6b84:	b0af 007a      	cmp.l 122(sp),d0
    6b88:	6c9c           	bge.s 6b26 <TestZoom4Picture+0x2c6e>
  }

  for(int i=0;i<7;i++) {  
    6b8a:	42af 0076      	clr.l 118(sp)
    6b8e:	6000 009c      	bra.w 6c2c <TestZoom4Picture+0x2d74>
    for(int i2=0;i2<18;i2++) {
    6b92:	42af 0072      	clr.l 114(sp)
    6b96:	6000 0086      	bra.w 6c1e <TestZoom4Picture+0x2d66>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6b9a:	222f 0076      	move.l 118(sp),d1
    6b9e:	2001           	move.l d1,d0
    6ba0:	e988           	lsl.l #4,d0
    6ba2:	d081           	add.l d1,d0
    6ba4:	d080           	add.l d0,d0
    6ba6:	2040           	movea.l d0,a0
    6ba8:	d1c1           	adda.l d1,a0
    6baa:	41e8 000b      	lea 11(a0),a0
    6bae:	202f 0072      	move.l 114(sp),d0
    6bb2:	d080           	add.l d0,d0
    6bb4:	2208           	move.l a0,d1
    6bb6:	d280           	add.l d0,d1
    6bb8:	7000           	moveq #0,d0
    6bba:	302f 01c6      	move.w 454(sp),d0
    6bbe:	2f01           	move.l d1,-(sp)
    6bc0:	2f00           	move.l d0,-(sp)
    6bc2:	2f2f 01d0      	move.l 464(sp),-(sp)
    6bc6:	2f2f 0056      	move.l 86(sp),-(sp)
    6bca:	4eba 014e      	jsr 6d1a <TestRow>(pc)
    6bce:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6bd2:	7230           	moveq #48,d1
    6bd4:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6bd8:	222f 0076      	move.l 118(sp),d1
    6bdc:	2001           	move.l d1,d0
    6bde:	e988           	lsl.l #4,d0
    6be0:	d081           	add.l d1,d0
    6be2:	d080           	add.l d0,d0
    6be4:	2040           	movea.l d0,a0
    6be6:	d1c1           	adda.l d1,a0
    6be8:	41e8 000c      	lea 12(a0),a0
    6bec:	202f 0072      	move.l 114(sp),d0
    6bf0:	d080           	add.l d0,d0
    6bf2:	2208           	move.l a0,d1
    6bf4:	d280           	add.l d0,d1
    6bf6:	7000           	moveq #0,d0
    6bf8:	302f 01c6      	move.w 454(sp),d0
    6bfc:	2f01           	move.l d1,-(sp)
    6bfe:	2f00           	move.l d0,-(sp)
    6c00:	2f2f 01d0      	move.l 464(sp),-(sp)
    6c04:	2f2f 0056      	move.l 86(sp),-(sp)
    6c08:	4eba 0110      	jsr 6d1a <TestRow>(pc)
    6c0c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6c10:	7030           	moveq #48,d0
    6c12:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6c16:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) {
    6c1a:	52af 0072      	addq.l #1,114(sp)
    6c1e:	7211           	moveq #17,d1
    6c20:	b2af 0072      	cmp.l 114(sp),d1
    6c24:	6c00 ff74      	bge.w 6b9a <TestZoom4Picture+0x2ce2>
  for(int i=0;i<7;i++) {  
    6c28:	52af 0076      	addq.l #1,118(sp)
    6c2c:	7006           	moveq #6,d0
    6c2e:	b0af 0076      	cmp.l 118(sp),d0
    6c32:	6c00 ff5e      	bge.w 6b92 <TestZoom4Picture+0x2cda>
    }
  } 

  for(int i2=0;i2<4;i2++) {
    6c36:	42af 006e      	clr.l 110(sp)
    6c3a:	6064           	bra.s 6ca0 <TestZoom4Picture+0x2de8>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6c3c:	202f 006e      	move.l 110(sp),d0
    6c40:	0680 0000 0080 	addi.l #128,d0
    6c46:	d080           	add.l d0,d0
    6c48:	2200           	move.l d0,d1
    6c4a:	7000           	moveq #0,d0
    6c4c:	302f 01c6      	move.w 454(sp),d0
    6c50:	2f01           	move.l d1,-(sp)
    6c52:	2f00           	move.l d0,-(sp)
    6c54:	2f2f 01d0      	move.l 464(sp),-(sp)
    6c58:	2f2f 0056      	move.l 86(sp),-(sp)
    6c5c:	4eba 00bc      	jsr 6d1a <TestRow>(pc)
    6c60:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6c64:	7230           	moveq #48,d1
    6c66:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6c6a:	202f 006e      	move.l 110(sp),d0
    6c6e:	d080           	add.l d0,d0
    6c70:	2200           	move.l d0,d1
    6c72:	0681 0000 0101 	addi.l #257,d1
    6c78:	7000           	moveq #0,d0
    6c7a:	302f 01c6      	move.w 454(sp),d0
    6c7e:	2f01           	move.l d1,-(sp)
    6c80:	2f00           	move.l d0,-(sp)
    6c82:	2f2f 01d0      	move.l 464(sp),-(sp)
    6c86:	2f2f 0056      	move.l 86(sp),-(sp)
    6c8a:	4eba 008e      	jsr 6d1a <TestRow>(pc)
    6c8e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6c92:	7030           	moveq #48,d0
    6c94:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6c98:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6c9c:	52af 006e      	addq.l #1,110(sp)
    6ca0:	7203           	moveq #3,d1
    6ca2:	b2af 006e      	cmp.l 110(sp),d1
    6ca6:	6c94           	bge.s 6c3c <TestZoom4Picture+0x2d84>
  }
  TestRow( valsupposed, valactual, mask, 0);
    6ca8:	7000           	moveq #0,d0
    6caa:	302f 01c6      	move.w 454(sp),d0
    6cae:	42a7           	clr.l -(sp)
    6cb0:	2f00           	move.l d0,-(sp)
    6cb2:	2f2f 01d0      	move.l 464(sp),-(sp)
    6cb6:	2f2f 0056      	move.l 86(sp),-(sp)
    6cba:	4eba 005e      	jsr 6d1a <TestRow>(pc)
    6cbe:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6cc2:	7030           	moveq #48,d0
    6cc4:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6cc8:	466f 01c6      	not.w 454(sp)
  FreeMem( source, (ZMLINESIZE+4)*272);
    6ccc:	2f6f 005e 0042 	move.l 94(sp),66(sp)
    6cd2:	2f7c 0000 3740 	move.l #14144,62(sp)
    6cd8:	003e 
    6cda:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    6ce0:	2c40           	movea.l d0,a6
    6ce2:	226f 0042      	movea.l 66(sp),a1
    6ce6:	202f 003e      	move.l 62(sp),d0
    6cea:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    6cee:	2f6f 004e 003a 	move.l 78(sp),58(sp)
    6cf4:	2f7c 0000 3740 	move.l #14144,54(sp)
    6cfa:	0036 
    6cfc:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    6d02:	2c40           	movea.l d0,a6
    6d04:	226f 003a      	movea.l 58(sp),a1
    6d08:	202f 0036      	move.l 54(sp),d0
    6d0c:	4eae ff2e      	jsr -210(a6)
}
    6d10:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    6d14:	4fef 01d0      	lea 464(sp),sp
    6d18:	4e75           	rts

00006d1a <TestRow>:

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    6d1a:	4fef ff40      	lea -192(sp),sp
    6d1e:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
    6d22:	202f 00e0      	move.l 224(sp),d0
    6d26:	3000           	move.w d0,d0
    6d28:	3f40 0016      	move.w d0,22(sp)
  
  char str[ 100] = { 0 };
    6d2c:	42af 001c      	clr.l 28(sp)
    6d30:	7020           	moveq #32,d0
    6d32:	d08f           	add.l sp,d0
    6d34:	7260           	moveq #96,d1
    6d36:	2f01           	move.l d1,-(sp)
    6d38:	42a7           	clr.l -(sp)
    6d3a:	2f00           	move.l d0,-(sp)
    6d3c:	4eba 020c      	jsr 6f4a <memset>(pc)
    6d40:	4fef 000c      	lea 12(sp),sp
  UWORD data[2];
  data[1] = numberofline;
    6d44:	202f 00e4      	move.l 228(sp),d0
    6d48:	3f40 001a      	move.w d0,26(sp)

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    6d4c:	42af 00d0      	clr.l 208(sp)
    6d50:	6000 00d4      	bra.w 6e26 <TestRow+0x10c>
    if( (*testpattern++ ^ xormask) != *destination++) {
    6d54:	202f 00d8      	move.l 216(sp),d0
    6d58:	2200           	move.l d0,d1
    6d5a:	5481           	addq.l #2,d1
    6d5c:	2f41 00d8      	move.l d1,216(sp)
    6d60:	2040           	movea.l d0,a0
    6d62:	3010           	move.w (a0),d0
    6d64:	322f 0016      	move.w 22(sp),d1
    6d68:	b141           	eor.w d0,d1
    6d6a:	202f 00dc      	move.l 220(sp),d0
    6d6e:	2400           	move.l d0,d2
    6d70:	5482           	addq.l #2,d2
    6d72:	2f42 00dc      	move.l d2,220(sp)
    6d76:	2040           	movea.l d0,a0
    6d78:	3010           	move.w (a0),d0
    6d7a:	b041           	cmp.w d1,d0
    6d7c:	6700 00a4      	beq.w 6e22 <TestRow+0x108>
      data[0] = i;
    6d80:	202f 00d0      	move.l 208(sp),d0
    6d84:	3f40 0018      	move.w d0,24(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    6d88:	2f7c 0001 8229 	move.l #98857,164(sp)
    6d8e:	00a4 
    6d90:	702b           	moveq #43,d0
    6d92:	4600           	not.b d0
    6d94:	d08f           	add.l sp,d0
    6d96:	0680 ffff ff44 	addi.l #-188,d0
    6d9c:	2f40 00a0      	move.l d0,160(sp)
    6da0:	2f7c 0000 73e8 	move.l #29672,156(sp)
    6da6:	009c 
    6da8:	722b           	moveq #43,d1
    6daa:	4601           	not.b d1
    6dac:	d28f           	add.l sp,d1
    6dae:	0681 ffff ff48 	addi.l #-184,d1
    6db4:	2f41 0098      	move.l d1,152(sp)
    6db8:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    6dbe:	2c40           	movea.l d0,a6
    6dc0:	206f 00a4      	movea.l 164(sp),a0
    6dc4:	226f 00a0      	movea.l 160(sp),a1
    6dc8:	246f 009c      	movea.l 156(sp),a2
    6dcc:	266f 0098      	movea.l 152(sp),a3
    6dd0:	4eae fdf6      	jsr -522(a6)
    6dd4:	2f40 0094      	move.l d0,148(sp)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    6dd8:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    6dde:	2c40           	movea.l d0,a6
    6de0:	4eae ffc4      	jsr -60(a6)
    6de4:	2f40 0090      	move.l d0,144(sp)
    6de8:	202f 0090      	move.l 144(sp),d0
    6dec:	2f40 008c      	move.l d0,140(sp)
    6df0:	742b           	moveq #43,d2
    6df2:	4602           	not.b d2
    6df4:	d48f           	add.l sp,d2
    6df6:	0682 ffff ff48 	addi.l #-184,d2
    6dfc:	2f42 0088      	move.l d2,136(sp)
    6e00:	7064           	moveq #100,d0
    6e02:	2f40 0084      	move.l d0,132(sp)
    6e06:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    6e0c:	2c40           	movea.l d0,a6
    6e0e:	222f 008c      	move.l 140(sp),d1
    6e12:	242f 0088      	move.l 136(sp),d2
    6e16:	262f 0084      	move.l 132(sp),d3
    6e1a:	4eae ffd0      	jsr -48(a6)
    6e1e:	2f40 0080      	move.l d0,128(sp)
  for(int i=0;i<21;i++) {
    6e22:	52af 00d0      	addq.l #1,208(sp)
    6e26:	7214           	moveq #20,d1
    6e28:	b2af 00d0      	cmp.l 208(sp),d1
    6e2c:	6c00 ff26      	bge.w 6d54 <TestRow+0x3a>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    6e30:	206f 00d8      	movea.l 216(sp),a0
    6e34:	3010           	move.w (a0),d0
    6e36:	322f 0016      	move.w 22(sp),d1
    6e3a:	b141           	eor.w d0,d1
    6e3c:	206f 00dc      	movea.l 220(sp),a0
    6e40:	3010           	move.w (a0),d0
    6e42:	b340           	eor.w d1,d0
    6e44:	3000           	move.w d0,d0
    6e46:	0280 0000 ffff 	andi.l #65535,d0
    6e4c:	0280 0000 ff00 	andi.l #65280,d0
    6e52:	6700 00cc      	beq.w 6f20 <TestRow+0x206>
    data[0] = 21;
    6e56:	3f7c 0015 0018 	move.w #21,24(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    6e5c:	2f7c 0001 8229 	move.l #98857,204(sp)
    6e62:	00cc 
    6e64:	742b           	moveq #43,d2
    6e66:	4602           	not.b d2
    6e68:	d48f           	add.l sp,d2
    6e6a:	0682 ffff ff44 	addi.l #-188,d2
    6e70:	2f42 00c8      	move.l d2,200(sp)
    6e74:	2f7c 0000 73e8 	move.l #29672,196(sp)
    6e7a:	00c4 
    6e7c:	702b           	moveq #43,d0
    6e7e:	4600           	not.b d0
    6e80:	d08f           	add.l sp,d0
    6e82:	0680 ffff ff48 	addi.l #-184,d0
    6e88:	2f40 00c0      	move.l d0,192(sp)
    6e8c:	2039 0002 8348 	move.l 28348 <SysBase>,d0
    6e92:	2c40           	movea.l d0,a6
    6e94:	206f 00cc      	movea.l 204(sp),a0
    6e98:	226f 00c8      	movea.l 200(sp),a1
    6e9c:	246f 00c4      	movea.l 196(sp),a2
    6ea0:	266f 00c0      	movea.l 192(sp),a3
    6ea4:	4eae fdf6      	jsr -522(a6)
    6ea8:	2f40 00bc      	move.l d0,188(sp)
                                                                           str);
    Write(  Output(), str, 100);
    6eac:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    6eb2:	2c40           	movea.l d0,a6
    6eb4:	4eae ffc4      	jsr -60(a6)
    6eb8:	2f40 00b8      	move.l d0,184(sp)
    6ebc:	202f 00b8      	move.l 184(sp),d0
    6ec0:	2f40 00b4      	move.l d0,180(sp)
    6ec4:	722b           	moveq #43,d1
    6ec6:	4601           	not.b d1
    6ec8:	d28f           	add.l sp,d1
    6eca:	0681 ffff ff48 	addi.l #-184,d1
    6ed0:	2f41 00b0      	move.l d1,176(sp)
    6ed4:	7464           	moveq #100,d2
    6ed6:	2f42 00ac      	move.l d2,172(sp)
    6eda:	2039 0002 8350 	move.l 28350 <DOSBase>,d0
    6ee0:	2c40           	movea.l d0,a6
    6ee2:	222f 00b4      	move.l 180(sp),d1
    6ee6:	242f 00b0      	move.l 176(sp),d2
    6eea:	262f 00ac      	move.l 172(sp),d3
    6eee:	4eae ffd0      	jsr -48(a6)
    6ef2:	2f40 00a8      	move.l d0,168(sp)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
    6ef6:	206f 00dc      	movea.l 220(sp),a0
    6efa:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6efc:	7200           	moveq #0,d1
    6efe:	3200           	move.w d0,d1
                                                   *testpattern,*destination);
    6f00:	206f 00d8      	movea.l 216(sp),a0
    6f04:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6f06:	3000           	move.w d0,d0
    6f08:	0280 0000 ffff 	andi.l #65535,d0
    6f0e:	2f01           	move.l d1,-(sp)
    6f10:	2f00           	move.l d0,-(sp)
    6f12:	4879 0001 8259 	pea 18259 <incbin_startimage_end+0x7c7>
    6f18:	4eba 0162      	jsr 707c <KPrintF>(pc)
    6f1c:	4fef 000c      	lea 12(sp),sp
     
  }
}
    6f20:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    6f24:	4fef 00c0      	lea 192(sp),sp
    6f28:	4e75           	rts

00006f2a <strlen>:
{
    6f2a:	598f           	subq.l #4,sp
	unsigned long t=0;
    6f2c:	4297           	clr.l (sp)
    6f2e:	6002           	bra.s 6f32 <strlen+0x8>
		t++;
    6f30:	5297           	addq.l #1,(sp)
	while(*s++)
    6f32:	202f 0008      	move.l 8(sp),d0
    6f36:	2200           	move.l d0,d1
    6f38:	5281           	addq.l #1,d1
    6f3a:	2f41 0008      	move.l d1,8(sp)
    6f3e:	2040           	movea.l d0,a0
    6f40:	1010           	move.b (a0),d0
    6f42:	66ec           	bne.s 6f30 <strlen+0x6>
	return t;
    6f44:	2017           	move.l (sp),d0
}
    6f46:	588f           	addq.l #4,sp
    6f48:	4e75           	rts

00006f4a <memset>:
{
    6f4a:	4e55 fffc      	link.w a5,#-4
	unsigned char *ptr = (unsigned char *)dest;
    6f4e:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
    6f54:	6014           	bra.s 6f6a <memset+0x20>
		*ptr++ = val;
    6f56:	202d fffc      	move.l -4(a5),d0
    6f5a:	2200           	move.l d0,d1
    6f5c:	5281           	addq.l #1,d1
    6f5e:	2b41 fffc      	move.l d1,-4(a5)
    6f62:	222d 000c      	move.l 12(a5),d1
    6f66:	2040           	movea.l d0,a0
    6f68:	1081           	move.b d1,(a0)
	while(len-- > 0)
    6f6a:	202d 0010      	move.l 16(a5),d0
    6f6e:	2200           	move.l d0,d1
    6f70:	5381           	subq.l #1,d1
    6f72:	2b41 0010      	move.l d1,16(a5)
    6f76:	4a80           	tst.l d0
    6f78:	66dc           	bne.s 6f56 <memset+0xc>
	return dest;
    6f7a:	202d 0008      	move.l 8(a5),d0
}
    6f7e:	4e5d           	unlk a5
    6f80:	4e75           	rts

00006f82 <memcpy>:
{
    6f82:	4e55 fff8      	link.w a5,#-8
    6f86:	2f02           	move.l d2,-(sp)
	char *d = (char *)dest;
    6f88:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = (const char *)src;
    6f8e:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
    6f94:	6020           	bra.s 6fb6 <memcpy+0x34>
		*d++ = *s++;
    6f96:	222d fff8      	move.l -8(a5),d1
    6f9a:	2001           	move.l d1,d0
    6f9c:	5280           	addq.l #1,d0
    6f9e:	2b40 fff8      	move.l d0,-8(a5)
    6fa2:	202d fffc      	move.l -4(a5),d0
    6fa6:	2400           	move.l d0,d2
    6fa8:	5282           	addq.l #1,d2
    6faa:	2b42 fffc      	move.l d2,-4(a5)
    6fae:	2041           	movea.l d1,a0
    6fb0:	1210           	move.b (a0),d1
    6fb2:	2040           	movea.l d0,a0
    6fb4:	1081           	move.b d1,(a0)
	while(len--)
    6fb6:	202d 0010      	move.l 16(a5),d0
    6fba:	2200           	move.l d0,d1
    6fbc:	5381           	subq.l #1,d1
    6fbe:	2b41 0010      	move.l d1,16(a5)
    6fc2:	4a80           	tst.l d0
    6fc4:	66d0           	bne.s 6f96 <memcpy+0x14>
	return dest;
    6fc6:	202d 0008      	move.l 8(a5),d0
}
    6fca:	241f           	move.l (sp)+,d2
    6fcc:	4e5d           	unlk a5
    6fce:	4e75           	rts

00006fd0 <memmove>:
{
    6fd0:	4e55 fff0      	link.w a5,#-16
    6fd4:	2f02           	move.l d2,-(sp)
	char *d = dest;
    6fd6:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = src;
    6fdc:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
	if (d < s) {
    6fe2:	202d fffc      	move.l -4(a5),d0
    6fe6:	b0ad fff8      	cmp.l -8(a5),d0
    6fea:	6522           	bcs.s 700e <memmove+0x3e>
    6fec:	6032           	bra.s 7020 <memmove+0x50>
			*d++ = *s++;
    6fee:	222d fff8      	move.l -8(a5),d1
    6ff2:	2401           	move.l d1,d2
    6ff4:	5282           	addq.l #1,d2
    6ff6:	2b42 fff8      	move.l d2,-8(a5)
    6ffa:	202d fffc      	move.l -4(a5),d0
    6ffe:	2400           	move.l d0,d2
    7000:	5282           	addq.l #1,d2
    7002:	2b42 fffc      	move.l d2,-4(a5)
    7006:	2041           	movea.l d1,a0
    7008:	1210           	move.b (a0),d1
    700a:	2040           	movea.l d0,a0
    700c:	1081           	move.b d1,(a0)
		while (len--)
    700e:	202d 0010      	move.l 16(a5),d0
    7012:	2200           	move.l d0,d1
    7014:	5381           	subq.l #1,d1
    7016:	2b41 0010      	move.l d1,16(a5)
    701a:	4a80           	tst.l d0
    701c:	66d0           	bne.s 6fee <memmove+0x1e>
    701e:	6052           	bra.s 7072 <memmove+0xa2>
		const char *lasts = s + (len - 1);
    7020:	202d 0010      	move.l 16(a5),d0
    7024:	5380           	subq.l #1,d0
    7026:	242d fff8      	move.l -8(a5),d2
    702a:	d480           	add.l d0,d2
    702c:	2b42 fff4      	move.l d2,-12(a5)
		char *lastd = d + (len - 1);
    7030:	202d 0010      	move.l 16(a5),d0
    7034:	5380           	subq.l #1,d0
    7036:	222d fffc      	move.l -4(a5),d1
    703a:	d280           	add.l d0,d1
    703c:	2b41 fff0      	move.l d1,-16(a5)
    7040:	6020           	bra.s 7062 <memmove+0x92>
			*lastd-- = *lasts--;
    7042:	222d fff4      	move.l -12(a5),d1
    7046:	2401           	move.l d1,d2
    7048:	5382           	subq.l #1,d2
    704a:	2b42 fff4      	move.l d2,-12(a5)
    704e:	202d fff0      	move.l -16(a5),d0
    7052:	2400           	move.l d0,d2
    7054:	5382           	subq.l #1,d2
    7056:	2b42 fff0      	move.l d2,-16(a5)
    705a:	2041           	movea.l d1,a0
    705c:	1210           	move.b (a0),d1
    705e:	2040           	movea.l d0,a0
    7060:	1081           	move.b d1,(a0)
		while (len--)
    7062:	202d 0010      	move.l 16(a5),d0
    7066:	2200           	move.l d0,d1
    7068:	5381           	subq.l #1,d1
    706a:	2b41 0010      	move.l d1,16(a5)
    706e:	4a80           	tst.l d0
    7070:	66d0           	bne.s 7042 <memmove+0x72>
	return dest;
    7072:	202d 0008      	move.l 8(a5),d0
}
    7076:	241f           	move.l (sp)+,d2
    7078:	4e5d           	unlk a5
    707a:	4e75           	rts

0000707c <KPrintF>:
{
    707c:	4fef ff80      	lea -128(sp),sp
    7080:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    7084:	3039 00f0 ff60 	move.w f0ff60 <_end+0xee7bc4>,d0
    708a:	0c40 4eb9      	cmpi.w #20153,d0
    708e:	6722           	beq.s 70b2 <KPrintF+0x36>
    7090:	0c40 a00e      	cmpi.w #-24562,d0
    7094:	671c           	beq.s 70b2 <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    7096:	2c79 0002 8348 	movea.l 28348 <SysBase>,a6
    709c:	206f 0090      	movea.l 144(sp),a0
    70a0:	43ef 0094      	lea 148(sp),a1
    70a4:	45f9 0000 73da 	lea 73da <KPutCharX>,a2
    70aa:	97cb           	suba.l a3,a3
    70ac:	4eae fdf6      	jsr -522(a6)
    70b0:	602a           	bra.s 70dc <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    70b2:	2c79 0002 8348 	movea.l 28348 <SysBase>,a6
    70b8:	206f 0090      	movea.l 144(sp),a0
    70bc:	43ef 0094      	lea 148(sp),a1
    70c0:	45f9 0000 73e8 	lea 73e8 <PutChar>,a2
    70c6:	47ef 000c      	lea 12(sp),a3
    70ca:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    70ce:	2f0b           	move.l a3,-(sp)
    70d0:	4878 0056      	pea 56 <_start+0x56>
    70d4:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xee7bc4>
    70da:	508f           	addq.l #8,sp
}
    70dc:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    70e0:	4fef 0080      	lea 128(sp),sp
    70e4:	4e75           	rts

000070e6 <warpmode>:

void warpmode(int on) // bool
{
    70e6:	518f           	subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
    70e8:	2f7c 00f0 ff60 	move.l #15794016,4(sp)
    70ee:	0004 
    if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
    70f0:	206f 0004      	movea.l 4(sp),a0
    70f4:	3010           	move.w (a0),d0
    70f6:	0c40 4eb9      	cmpi.w #20153,d0
    70fa:	670c           	beq.s 7108 <warpmode+0x22>
    70fc:	206f 0004      	movea.l 4(sp),a0
    7100:	3010           	move.w (a0),d0
    7102:	0c40 a00e      	cmpi.w #-24562,d0
    7106:	6668           	bne.s 7170 <warpmode+0x8a>
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    7108:	4aaf 000c      	tst.l 12(sp)
    710c:	6708           	beq.s 7116 <warpmode+0x30>
    710e:	203c 0001 827f 	move.l #98943,d0
    7114:	6006           	bra.s 711c <warpmode+0x36>
    7116:	203c 0001 8289 	move.l #98953,d0
    711c:	4878 0001      	pea 1 <_start+0x1>
    7120:	220f           	move.l sp,d1
    7122:	5e81           	addq.l #7,d1
    7124:	2f01           	move.l d1,-(sp)
    7126:	42a7           	clr.l -(sp)
    7128:	2f00           	move.l d0,-(sp)
    712a:	4878 ffff      	pea ffffffff <_end+0xfffd7c63>
    712e:	4878 0052      	pea 52 <_start+0x52>
    7132:	206f 001c      	movea.l 28(sp),a0
    7136:	4e90           	jsr (a0)
    7138:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    713c:	4aaf 000c      	tst.l 12(sp)
    7140:	6708           	beq.s 714a <warpmode+0x64>
    7142:	203c 0001 8294 	move.l #98964,d0
    7148:	6006           	bra.s 7150 <warpmode+0x6a>
    714a:	203c 0001 82ae 	move.l #98990,d0
    7150:	4878 0001      	pea 1 <_start+0x1>
    7154:	220f           	move.l sp,d1
    7156:	5e81           	addq.l #7,d1
    7158:	2f01           	move.l d1,-(sp)
    715a:	42a7           	clr.l -(sp)
    715c:	2f00           	move.l d0,-(sp)
    715e:	4878 ffff      	pea ffffffff <_end+0xfffd7c63>
    7162:	4878 0052      	pea 52 <_start+0x52>
    7166:	206f 001c      	movea.l 28(sp),a0
    716a:	4e90           	jsr (a0)
    716c:	4fef 0018      	lea 24(sp),sp
	}
}
    7170:	508f           	addq.l #8,sp
    7172:	4e75           	rts

00007174 <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4)
{
    7174:	598f           	subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
    7176:	2ebc 00f0 ff60 	move.l #15794016,(sp)
    if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    717c:	2057           	movea.l (sp),a0
    717e:	3010           	move.w (a0),d0
    7180:	0c40 4eb9      	cmpi.w #20153,d0
    7184:	670a           	beq.s 7190 <debug_cmd+0x1c>
    7186:	2057           	movea.l (sp),a0
    7188:	3010           	move.w (a0),d0
    718a:	0c40 a00e      	cmpi.w #-24562,d0
    718e:	661e           	bne.s 71ae <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
    7190:	2f2f 0014      	move.l 20(sp),-(sp)
    7194:	2f2f 0014      	move.l 20(sp),-(sp)
    7198:	2f2f 0014      	move.l 20(sp),-(sp)
    719c:	2f2f 0014      	move.l 20(sp),-(sp)
    71a0:	4878 0058      	pea 58 <_start+0x58>
    71a4:	206f 0014      	movea.l 20(sp),a0
    71a8:	4e90           	jsr (a0)
    71aa:	4fef 0014      	lea 20(sp),sp
	}
}
    71ae:	588f           	addq.l #4,sp
    71b0:	4e75           	rts

000071b2 <debug_clear>:
	barto_cmd_text,
};

void debug_clear()
{
	debug_cmd(barto_cmd_clear, 0, 0, 0);
    71b2:	42a7           	clr.l -(sp)
    71b4:	42a7           	clr.l -(sp)
    71b6:	42a7           	clr.l -(sp)
    71b8:	42a7           	clr.l -(sp)
    71ba:	4eba ffb8      	jsr 7174 <debug_cmd>(pc)
    71be:	4fef 0010      	lea 16(sp),sp
}
    71c2:	4e75           	rts

000071c4 <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color)
{
    71c4:	518f           	subq.l #8,sp
    71c6:	2f02           	move.l d2,-(sp)
    71c8:	226f 0010      	movea.l 16(sp),a1
    71cc:	206f 0014      	movea.l 20(sp),a0
    71d0:	222f 0018      	move.l 24(sp),d1
    71d4:	202f 001c      	move.l 28(sp),d0
    71d8:	3249           	movea.w a1,a1
    71da:	3f49 000a      	move.w a1,10(sp)
    71de:	3048           	movea.w a0,a0
    71e0:	3f48 0008      	move.w a0,8(sp)
    71e4:	3201           	move.w d1,d1
    71e6:	3f41 0006      	move.w d1,6(sp)
    71ea:	3000           	move.w d0,d0
    71ec:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    71f0:	302f 0006      	move.w 6(sp),d0
    71f4:	48c0           	ext.l d0
    71f6:	4840           	swap d0
    71f8:	4240           	clr.w d0
    71fa:	322f 0004      	move.w 4(sp),d1
    71fe:	48c1           	ext.l d1
    7200:	8280           	or.l d0,d1
    7202:	302f 000a      	move.w 10(sp),d0
    7206:	48c0           	ext.l d0
    7208:	4840           	swap d0
    720a:	4240           	clr.w d0
    720c:	306f 0008      	movea.w 8(sp),a0
    7210:	2408           	move.l a0,d2
    7212:	8082           	or.l d2,d0
    7214:	2f2f 0020      	move.l 32(sp),-(sp)
    7218:	2f01           	move.l d1,-(sp)
    721a:	2f00           	move.l d0,-(sp)
    721c:	4878 0001      	pea 1 <_start+0x1>
    7220:	4eba ff52      	jsr 7174 <debug_cmd>(pc)
    7224:	4fef 0010      	lea 16(sp),sp
}
    7228:	241f           	move.l (sp)+,d2
    722a:	508f           	addq.l #8,sp
    722c:	4e75           	rts

0000722e <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color)
{
    722e:	518f           	subq.l #8,sp
    7230:	2f02           	move.l d2,-(sp)
    7232:	226f 0010      	movea.l 16(sp),a1
    7236:	206f 0014      	movea.l 20(sp),a0
    723a:	222f 0018      	move.l 24(sp),d1
    723e:	202f 001c      	move.l 28(sp),d0
    7242:	3249           	movea.w a1,a1
    7244:	3f49 000a      	move.w a1,10(sp)
    7248:	3048           	movea.w a0,a0
    724a:	3f48 0008      	move.w a0,8(sp)
    724e:	3201           	move.w d1,d1
    7250:	3f41 0006      	move.w d1,6(sp)
    7254:	3000           	move.w d0,d0
    7256:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    725a:	302f 0006      	move.w 6(sp),d0
    725e:	48c0           	ext.l d0
    7260:	4840           	swap d0
    7262:	4240           	clr.w d0
    7264:	322f 0004      	move.w 4(sp),d1
    7268:	48c1           	ext.l d1
    726a:	8280           	or.l d0,d1
    726c:	302f 000a      	move.w 10(sp),d0
    7270:	48c0           	ext.l d0
    7272:	4840           	swap d0
    7274:	4240           	clr.w d0
    7276:	306f 0008      	movea.w 8(sp),a0
    727a:	2408           	move.l a0,d2
    727c:	8082           	or.l d2,d0
    727e:	2f2f 0020      	move.l 32(sp),-(sp)
    7282:	2f01           	move.l d1,-(sp)
    7284:	2f00           	move.l d0,-(sp)
    7286:	4878 0002      	pea 2 <_start+0x2>
    728a:	4eba fee8      	jsr 7174 <debug_cmd>(pc)
    728e:	4fef 0010      	lea 16(sp),sp
}
    7292:	241f           	move.l (sp)+,d2
    7294:	508f           	addq.l #8,sp
    7296:	4e75           	rts

00007298 <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color)
{
    7298:	598f           	subq.l #4,sp
    729a:	2f02           	move.l d2,-(sp)
    729c:	222f 000c      	move.l 12(sp),d1
    72a0:	202f 0010      	move.l 16(sp),d0
    72a4:	3201           	move.w d1,d1
    72a6:	3f41 0006      	move.w d1,6(sp)
    72aa:	3000           	move.w d0,d0
    72ac:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
    72b0:	202f 0014      	move.l 20(sp),d0
    72b4:	322f 0006      	move.w 6(sp),d1
    72b8:	48c1           	ext.l d1
    72ba:	4841           	swap d1
    72bc:	4241           	clr.w d1
    72be:	306f 0004      	movea.w 4(sp),a0
    72c2:	2408           	move.l a0,d2
    72c4:	8282           	or.l d2,d1
    72c6:	2f2f 0018      	move.l 24(sp),-(sp)
    72ca:	2f00           	move.l d0,-(sp)
    72cc:	2f01           	move.l d1,-(sp)
    72ce:	4878 0003      	pea 3 <_start+0x3>
    72d2:	4eba fea0      	jsr 7174 <debug_cmd>(pc)
    72d6:	4fef 0010      	lea 16(sp),sp
}
    72da:	241f           	move.l (sp)+,d2
    72dc:	588f           	addq.l #4,sp
    72de:	4e75           	rts

000072e0 <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    72e0:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    72e4:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    72e8:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    72ec:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    72f0:	d041           	add.w d1,d0
	swap	d0
    72f2:	4840           	swap d0
	clrw	d0
    72f4:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    72f6:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    72fa:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    72fe:	d081           	add.l d1,d0
	rts
    7300:	4e75           	rts

00007302 <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    7302:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    7304:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    7308:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    730c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    7312:	6416           	bcc.s 732a <__udivsi3+0x28>
	movel	d0, d2
    7314:	2400           	move.l d0,d2
	clrw	d2
    7316:	4242           	clr.w d2
	swap	d2
    7318:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    731a:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    731c:	3002           	move.w d2,d0
	swap	d0
    731e:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    7320:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    7324:	84c1           	divu.w d1,d2
	movew	d2, d0
    7326:	3002           	move.w d2,d0
	jra	6f
    7328:	6030           	bra.s 735a <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    732a:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    732c:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    732e:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    7330:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    7336:	64f4           	bcc.s 732c <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    7338:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    733a:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    7340:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    7342:	c2c0           	mulu.w d0,d1
	swap	d2
    7344:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    7346:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    7348:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    734a:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    734c:	660a           	bne.s 7358 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    734e:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    7350:	6506           	bcs.s 7358 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    7352:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    7356:	6302           	bls.s 735a <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    7358:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    735a:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    735c:	4e75           	rts

0000735e <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    735e:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    7360:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    7362:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    7366:	6a04           	bpl.s 736c <__divsi3+0xe>
	negl	d1
    7368:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    736a:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    736c:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    7370:	6a04           	bpl.s 7376 <__divsi3+0x18>
	negl	d0
    7372:	4480           	neg.l d0
	negb	d2
    7374:	4402           	neg.b d2

2:	movel	d1, sp@-
    7376:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    7378:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    737a:	6186           	bsr.s 7302 <__udivsi3>
	addql	IMM (8), sp
    737c:	508f           	addq.l #8,sp

	tstb	d2
    737e:	4a02           	tst.b d2
	jpl	3f
    7380:	6a02           	bpl.s 7384 <__divsi3+0x26>
	negl	d0
    7382:	4480           	neg.l d0

3:	movel	sp@+, d2
    7384:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    7386:	4e75           	rts

00007388 <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    7388:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    738c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    7390:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7392:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    7394:	61c8           	bsr.s 735e <__divsi3>
	addql	IMM (8), sp
    7396:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    7398:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    739c:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    739e:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    73a0:	6100 ff3e      	bsr.w 72e0 <__mulsi3>
	addql	IMM (8), sp
    73a4:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    73a6:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    73aa:	9280           	sub.l d0,d1
	movel	d1, d0
    73ac:	2001           	move.l d1,d0
	rts
    73ae:	4e75           	rts

000073b0 <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    73b0:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    73b4:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    73b8:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    73ba:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    73bc:	6100 ff44      	bsr.w 7302 <__udivsi3>
	addql	IMM (8), sp
    73c0:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    73c2:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    73c6:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    73c8:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    73ca:	6100 ff14      	bsr.w 72e0 <__mulsi3>
	addql	IMM (8), sp
    73ce:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    73d0:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    73d4:	9280           	sub.l d0,d1
	movel	d1, d0
    73d6:	2001           	move.l d1,d0
	rts
    73d8:	4e75           	rts

000073da <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    73da:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    73dc:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    73e0:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    73e4:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    73e6:	4e75           	rts

000073e8 <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    73e8:	16c0           	move.b d0,(a3)+
	rts
    73ea:	4e75           	rts
