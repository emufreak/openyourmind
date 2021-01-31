
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
       2:	203c 0001 a51e 	move.l #107806,d0
       8:	0480 0001 a51e 	subi.l #107806,d0
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
      22:	41f9 0001 a51e 	lea 1a51e <__fini_array_end>,a0
      28:	2071 8800      	movea.l (0,a1,a0.l),a0
      2c:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      2e:	52af 0004      	addq.l #1,4(sp)
      32:	202f 0004      	move.l 4(sp),d0
      36:	b097           	cmp.l (sp),d0
      38:	65de           	bcs.s 18 <_start+0x18>

	count = __init_array_end - __init_array_start;
      3a:	203c 0001 a51e 	move.l #107806,d0
      40:	0480 0001 a51e 	subi.l #107806,d0
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
      5a:	41f9 0001 a51e 	lea 1a51e <__fini_array_end>,a0
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
      78:	203c 0001 a51e 	move.l #107806,d0
      7e:	0480 0001 a51e 	subi.l #107806,d0
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
      9a:	41f9 0001 a51e 	lea 1a51e <__fini_array_end>,a0
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
		if (vpos==(311<<8))
			break;
	}
}*/

inline void WaitBlt() {
      b4:	598f           	subq.l #4,sp
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
      b6:	2079 0002 8520 	movea.l 28520 <hw>,a0
      bc:	3f68 0002 0002 	move.w 2(a0),2(sp)
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
      c2:	2079 0002 8520 	movea.l 28520 <hw>,a0
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
      e6:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
      ec:	6722           	beq.s 110 <FreeDisplay+0x30>
      ee:	2f79 0002 8508 	move.l 28508 <Copperlist1>,32(sp)
      f4:	0020 
      f6:	2f6f 0028 001c 	move.l 40(sp),28(sp)
      fc:	2039 0002 8524 	move.l 28524 <SysBase>,d0
     102:	2c40           	movea.l d0,a6
     104:	226f 0020      	movea.l 32(sp),a1
     108:	202f 001c      	move.l 28(sp),d0
     10c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     110:	2039 0002 850c 	move.l 2850c <Copperlist2>,d0
     116:	6722           	beq.s 13a <FreeDisplay+0x5a>
     118:	2f79 0002 850c 	move.l 2850c <Copperlist2>,24(sp)
     11e:	0018 
     120:	2f6f 0028 0014 	move.l 40(sp),20(sp)
     126:	2039 0002 8524 	move.l 28524 <SysBase>,d0
     12c:	2c40           	movea.l d0,a6
     12e:	226f 0018      	movea.l 24(sp),a1
     132:	202f 0014      	move.l 20(sp),d0
     136:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
     13a:	2039 0002 8500 	move.l 28500 <Bitplane1>,d0
     140:	6722           	beq.s 164 <FreeDisplay+0x84>
     142:	2f79 0002 8500 	move.l 28500 <Bitplane1>,16(sp)
     148:	0010 
     14a:	2f6f 002c 000c 	move.l 44(sp),12(sp)
     150:	2039 0002 8524 	move.l 28524 <SysBase>,d0
     156:	2c40           	movea.l d0,a6
     158:	226f 0010      	movea.l 16(sp),a1
     15c:	202f 000c      	move.l 12(sp),d0
     160:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
     164:	2039 0002 8504 	move.l 28504 <Bitplane2>,d0
     16a:	6722           	beq.s 18e <FreeDisplay+0xae>
     16c:	2f79 0002 8504 	move.l 28504 <Bitplane2>,8(sp)
     172:	0008 
     174:	2f6f 002c 0004 	move.l 44(sp),4(sp)
     17a:	2039 0002 8524 	move.l 28524 <SysBase>,d0
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
     19a:	2039 0002 8510 	move.l 28510 <DrawBuffer>,d0
     1a0:	4240           	clr.w d0
     1a2:	4840           	swap d0
     1a4:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     1a8:	2039 0002 8510 	move.l 28510 <DrawBuffer>,d0
     1ae:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     1b2:	2f79 0002 8518 	move.l 28518 <DrawCopper>,4(sp)
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
     1d2:	2039 0002 8510 	move.l 28510 <DrawBuffer>,d0
     1d8:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     1da:	2039 0002 8514 	move.l 28514 <ViewBuffer>,d0
     1e0:	23c0 0002 8510 	move.l d0,28510 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     1e6:	2017           	move.l (sp),d0
     1e8:	23c0 0002 8514 	move.l d0,28514 <ViewBuffer>
}
     1ee:	4fef 000c      	lea 12(sp),sp
     1f2:	4e75           	rts

000001f4 <SwapCl>:

void SwapCl() {
     1f4:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     1f6:	2039 0002 8518 	move.l 28518 <DrawCopper>,d0
     1fc:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     1fe:	2039 0002 851c 	move.l 2851c <ViewCopper>,d0
     204:	23c0 0002 8518 	move.l d0,28518 <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     20a:	2017           	move.l (sp),d0
     20c:	23c0 0002 851c 	move.l d0,2851c <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     212:	2039 0002 851c 	move.l 2851c <ViewCopper>,d0
     218:	2079 0002 8520 	movea.l 28520 <hw>,a0
     21e:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     222:	2079 0002 8520 	movea.l 28520 <hw>,a0
     228:	2017           	move.l (sp),d0
     22a:	3140 0088      	move.w d0,136(a0)
}
     22e:	588f           	addq.l #4,sp
     230:	4e75           	rts

00000232 <Utils_CopyMem>:
	DisownBlitter();
  Permit();
	//Enable();
}*/

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
     2fa:	2079 0002 8520 	movea.l 28520 <hw>,a0
     300:	317c 0020 009c 	move.w #32,156(a0)
     306:	2079 0002 8520 	movea.l 28520 <hw>,a0
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
     31c:	2079 0002 8520 	movea.l 28520 <hw>,a0
     322:	317c 87ff 0096 	move.w #-30721,150(a0)
  //             1001001111100000	; copper,bitplane,blitter DMA

  /*hw->dmacon =   
  0x87e0;*/
	//SetInterruptHandler((APTR)interruptHandler);
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     328:	2079 0002 8520 	movea.l 28520 <hw>,a0
     32e:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     334:	2079 0002 8520 	movea.l 28520 <hw>,a0
     33a:	317c 0020 009c 	move.w #32,156(a0)
  //PrepareDisplay();

  CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
     340:	2f79 0002 8560 	move.l 28560 <Zoom_StartImage>,12(sp)
     346:	000c 
     348:	2f79 0002 8510 	move.l 28510 <DrawBuffer>,8(sp)
     34e:	0008 
     350:	2f7c 0000 ff00 	move.l #65280,4(sp)
     356:	0004 
     358:	2039 0002 8524 	move.l 28524 <SysBase>,d0
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
     37a:	3039 0002 855e 	move.w 2855e <Zoom_Counter>,d0
     380:	0c40 03e7      	cmpi.w #999,d0
     384:	63ec           	bls.s 372 <RunDemo+0x5c>
	}
  Zoom_Dealloc();
     386:	4eba 1128      	jsr 14b0 <Zoom_Dealloc>(pc)

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
     39c:	2079 0002 8520 	movea.l 28520 <hw>,a0
     3a2:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     3a8:	2079 0002 8520 	movea.l 28520 <hw>,a0
     3ae:	317c 0020 009c 	move.w #32,156(a0)
}
     3b4:	4e75           	rts

000003b6 <RunFrame>:

void RunFrame() {
     3b6:	4fef fff0      	lea -16(sp),sp
     3ba:	2f0e           	move.l a6,-(sp)
  Zoom_Blit4ZoomFinished = 0;
     3bc:	4279 0002 8568 	clr.w 28568 <Zoom_Blit4ZoomFinished>
  UWORD tmp = Zoom_LevelOfZoom;  
     3c2:	3f79 0002 856a 	move.w 2856a <Zoom_LevelOfZoom>,18(sp)
     3c8:	0012 
  if(Zoom_LevelOfZoom == 0)
     3ca:	3039 0002 856a 	move.w 2856a <Zoom_LevelOfZoom>,d0
     3d0:	6632           	bne.s 404 <RunFrame+0x4e>
    CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
     3d2:	2f79 0002 8560 	move.l 28560 <Zoom_StartImage>,14(sp)
     3d8:	000e 
     3da:	2f79 0002 8510 	move.l 28510 <DrawBuffer>,10(sp)
     3e0:	000a 
     3e2:	2f7c 0000 ff00 	move.l #65280,6(sp)
     3e8:	0006 
     3ea:	2039 0002 8524 	move.l 28524 <SysBase>,d0
     3f0:	2c40           	movea.l d0,a6
     3f2:	206f 000e      	movea.l 14(sp),a0
     3f6:	226f 000a      	movea.l 10(sp),a1
     3fa:	202f 0006      	move.l 6(sp),d0
     3fe:	4eae fd8a      	jsr -630(a6)
     402:	602c           	bra.s 430 <RunFrame+0x7a>
  else
    Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer, (UWORD *)DrawBuffer, Zoom_LevelOfZoom, 5 );
     404:	3039 0002 856a 	move.w 2856a <Zoom_LevelOfZoom>,d0
     40a:	3000           	move.w d0,d0
     40c:	0280 0000 ffff 	andi.l #65535,d0
     412:	2079 0002 8510 	movea.l 28510 <DrawBuffer>,a0
     418:	2239 0002 8514 	move.l 28514 <ViewBuffer>,d1
     41e:	4878 0005      	pea 5 <_start+0x5>
     422:	2f00           	move.l d0,-(sp)
     424:	2f08           	move.l a0,-(sp)
     426:	2f01           	move.l d1,-(sp)
     428:	4eba 18ae      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
     42c:	4fef 0010      	lea 16(sp),sp

  Zoom_Blit4ZoomFinished = 1;
     430:	33fc 0001 0002 	move.w #1,28568 <Zoom_Blit4ZoomFinished>
     436:	8568 
  while( tmp == Zoom_LevelOfZoom) { }
     438:	3039 0002 856a 	move.w 2856a <Zoom_LevelOfZoom>,d0
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
     57c:	0681 0001 a838 	addi.l #108600,d1
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
     610:	2079 0002 8524 	movea.l 28524 <SysBase>,a0
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
     634:	2039 0002 8524 	move.l 28524 <SysBase>,d0
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
     662:	2079 0002 853a 	movea.l 2853a <VBR>,a0
     668:	41e8 006c      	lea 108(a0),a0
     66c:	20af 0004      	move.l 4(sp),(a0)
}
     670:	4e75           	rts

00000672 <GetInterruptHandler>:

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     672:	2079 0002 853a 	movea.l 2853a <VBR>,a0
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
     6cc:	2079 0002 8530 	movea.l 28530 <GfxBase>,a0
     6d2:	2028 0022      	move.l 34(a0),d0
     6d6:	23c0 0002 8542 	move.l d0,28542 <ActiView>
	OwnBlitter();
     6dc:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
     6e2:	2c40           	movea.l d0,a6
     6e4:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     6e8:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
     6ee:	2c40           	movea.l d0,a6
     6f0:	4eae ff1c      	jsr -228(a6)
	//Disable();
	Forbid();
     6f4:	2039 0002 8524 	move.l 28524 <SysBase>,d0
     6fa:	2c40           	movea.l d0,a6
     6fc:	4eae ff7c      	jsr -132(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=custom->adkconr;
     700:	2079 0002 8528 	movea.l 28528 <custom>,a0
     706:	3028 0010      	move.w 16(a0),d0
     70a:	33c0 0002 8538 	move.w d0,28538 <SystemADKCON>
	SystemInts=custom->intenar;
     710:	2079 0002 8528 	movea.l 28528 <custom>,a0
     716:	3028 001c      	move.w 28(a0),d0
     71a:	33c0 0002 8534 	move.w d0,28534 <SystemInts>
	SystemDMA=custom->dmaconr;
     720:	2079 0002 8528 	movea.l 28528 <custom>,a0
     726:	3028 0002      	move.w 2(a0),d0
     72a:	33c0 0002 8536 	move.w d0,28536 <SystemDMA>
	custom->intena=0x7fff;//disable all interrupts
     730:	2079 0002 8528 	movea.l 28528 <custom>,a0
     736:	317c 7fff 009a 	move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     73c:	2079 0002 8528 	movea.l 28528 <custom>,a0
     742:	317c 7fff 009c 	move.w #32767,156(a0)
	
	WaitVbl();
     748:	4eba ff34      	jsr 67e <WaitVbl>(pc)
	WaitVbl();
     74c:	4eba ff30      	jsr 67e <WaitVbl>(pc)
	custom->dmacon=0x7fff;//Clear all DMA channels
     750:	2079 0002 8528 	movea.l 28528 <custom>,a0
     756:	317c 7fff 0096 	move.w #32767,150(a0)

	//set all colors black
	for(int a=0;a<32;a++)
     75c:	42af 0008      	clr.l 8(sp)
     760:	601c           	bra.s 77e <TakeSystem+0xb6>
		custom->color[a]=0;
     762:	2079 0002 8528 	movea.l 28528 <custom>,a0
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
     78a:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
     790:	2c40           	movea.l d0,a6
     792:	226f 0004      	movea.l 4(sp),a1
     796:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     79a:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
     7a0:	2c40           	movea.l d0,a6
     7a2:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     7a6:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
     7ac:	2c40           	movea.l d0,a6
     7ae:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     7b2:	4eba feca      	jsr 67e <WaitVbl>(pc)
	WaitVbl();
     7b6:	4eba fec6      	jsr 67e <WaitVbl>(pc)

	VBR=GetVBR();
     7ba:	4eba fe36      	jsr 5f2 <GetVBR>(pc)
     7be:	23c0 0002 853a 	move.l d0,2853a <VBR>
	SystemIrq=GetInterruptHandler(); //store interrupt register
     7c4:	4eba feac      	jsr 672 <GetInterruptHandler>(pc)
     7c8:	23c0 0002 853e 	move.l d0,2853e <SystemIrq>
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
     7e0:	2079 0002 8528 	movea.l 28528 <custom>,a0
     7e6:	317c 7fff 009a 	move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     7ec:	2079 0002 8528 	movea.l 28528 <custom>,a0
     7f2:	317c 7fff 009c 	move.w #32767,156(a0)
	custom->dmacon=0x7fff;//Clear all DMA channels
     7f8:	2079 0002 8528 	movea.l 28528 <custom>,a0
     7fe:	317c 7fff 0096 	move.w #32767,150(a0)

	//restore interrupts
	SetInterruptHandler(SystemIrq);
     804:	2039 0002 853e 	move.l 2853e <SystemIrq>,d0
     80a:	2f00           	move.l d0,-(sp)
     80c:	4eba fe54      	jsr 662 <SetInterruptHandler>(pc)
     810:	588f           	addq.l #4,sp

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
     812:	2079 0002 8530 	movea.l 28530 <GfxBase>,a0
     818:	2028 0026      	move.l 38(a0),d0
     81c:	2079 0002 8528 	movea.l 28528 <custom>,a0
     822:	2140 0080      	move.l d0,128(a0)
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
     826:	2079 0002 8530 	movea.l 28530 <GfxBase>,a0
     82c:	2028 0032      	move.l 50(a0),d0
     830:	2079 0002 8528 	movea.l 28528 <custom>,a0
     836:	2140 0084      	move.l d0,132(a0)
	custom->copjmp1=0x7fff; //start coppper
     83a:	2079 0002 8528 	movea.l 28528 <custom>,a0
     840:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
     846:	3039 0002 8534 	move.w 28534 <SystemInts>,d0
     84c:	2079 0002 8528 	movea.l 28528 <custom>,a0
     852:	0040 8000      	ori.w #-32768,d0
     856:	3140 009a      	move.w d0,154(a0)
	custom->dmacon=SystemDMA|0x8000;
     85a:	3039 0002 8536 	move.w 28536 <SystemDMA>,d0
     860:	2079 0002 8528 	movea.l 28528 <custom>,a0
     866:	0040 8000      	ori.w #-32768,d0
     86a:	3140 0096      	move.w d0,150(a0)
	custom->adkcon=SystemADKCON|0x8000;
     86e:	3039 0002 8538 	move.w 28538 <SystemADKCON>,d0
     874:	2079 0002 8528 	movea.l 28528 <custom>,a0
     87a:	0040 8000      	ori.w #-32768,d0
     87e:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     882:	2f79 0002 8542 	move.l 28542 <ActiView>,4(sp)
     888:	0004 
     88a:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
     890:	2c40           	movea.l d0,a6
     892:	226f 0004      	movea.l 4(sp),a1
     896:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     89a:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
     8a0:	2c40           	movea.l d0,a6
     8a2:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     8a6:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
     8ac:	2c40           	movea.l d0,a6
     8ae:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     8b2:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
     8b8:	2c40           	movea.l d0,a6
     8ba:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     8be:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
     8c4:	2c40           	movea.l d0,a6
     8c6:	4eae fe32      	jsr -462(a6)
	//Enable();
	Permit();
     8ca:	2039 0002 8524 	move.l 28524 <SysBase>,d0
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
     8e0:	2079 0002 8528 	movea.l 28528 <custom>,a0
     8e6:	317c 0020 009c 	move.w #32,156(a0)
     8ec:	2079 0002 8528 	movea.l 28528 <custom>,a0
     8f2:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	frameCounter++;
     8f8:	3039 0002 8546 	move.w 28546 <frameCounter>,d0
     8fe:	5240           	addq.w #1,d0
     900:	33c0 0002 8546 	move.w d0,28546 <frameCounter>
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
     920:	23c0 0002 8524 	move.l d0,28524 <SysBase>
	hw = (struct Custom*)0xdff000;
     926:	23fc 00df f000 	move.l #14675968,28520 <hw>
     92c:	0002 8520 

	SysBase = *((struct ExecBase**)4UL);
     930:	307c 0004      	movea.w #4,a0
     934:	2010           	move.l (a0),d0
     936:	23c0 0002 8524 	move.l d0,28524 <SysBase>
	custom = (struct Custom*)0xdff000;
     93c:	23fc 00df f000 	move.l #14675968,28528 <custom>
     942:	0002 8528 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
     946:	2f7c 0000 7639 	move.l #30265,72(sp)
     94c:	0048 
     94e:	42af 0044      	clr.l 68(sp)
     952:	2039 0002 8524 	move.l 28524 <SysBase>,d0
     958:	2c40           	movea.l d0,a6
     95a:	226f 0048      	movea.l 72(sp),a1
     95e:	202f 0044      	move.l 68(sp),d0
     962:	4eae fdd8      	jsr -552(a6)
     966:	2f40 0040      	move.l d0,64(sp)
     96a:	202f 0040      	move.l 64(sp),d0
     96e:	23c0 0002 8530 	move.l d0,28530 <GfxBase>
	if (!GfxBase)
     974:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
     97a:	6614           	bne.s 990 <main+0x84>
		Exit(0);
     97c:	42af 003c      	clr.l 60(sp)
     980:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     986:	2c40           	movea.l d0,a6
     988:	222f 003c      	move.l 60(sp),d1
     98c:	4eae ff70      	jsr -144(a6)

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     990:	2f7c 0000 764a 	move.l #30282,56(sp)
     996:	0038 
     998:	42af 0034      	clr.l 52(sp)
     99c:	2039 0002 8524 	move.l 28524 <SysBase>,d0
     9a2:	2c40           	movea.l d0,a6
     9a4:	226f 0038      	movea.l 56(sp),a1
     9a8:	202f 0034      	move.l 52(sp),d0
     9ac:	4eae fdd8      	jsr -552(a6)
     9b0:	2f40 0030      	move.l d0,48(sp)
     9b4:	202f 0030      	move.l 48(sp),d0
     9b8:	23c0 0002 852c 	move.l d0,2852c <DOSBase>
	if (!DOSBase)
     9be:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     9c4:	6614           	bne.s 9da <main+0xce>
		Exit(0);
     9c6:	42af 002c      	clr.l 44(sp)
     9ca:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     9d0:	2c40           	movea.l d0,a6
     9d2:	222f 002c      	move.l 44(sp),d1
     9d6:	4eae ff70      	jsr -144(a6)

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
     9da:	4879 0000 7656 	pea 7656 <incbin_colors_end+0x1e>
     9e0:	4eba 68a6      	jsr 7288 <KPrintF>(pc)
     9e4:	588f           	addq.l #4,sp
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
     9e6:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     9ec:	2c40           	movea.l d0,a6
     9ee:	4eae ffc4      	jsr -60(a6)
     9f2:	2f40 0028      	move.l d0,40(sp)
     9f6:	202f 0028      	move.l 40(sp),d0
     9fa:	2f40 0024      	move.l d0,36(sp)
     9fe:	2f7c 0000 7672 	move.l #30322,32(sp)
     a04:	0020 
     a06:	700f           	moveq #15,d0
     a08:	2f40 001c      	move.l d0,28(sp)
     a0c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     a12:	2c40           	movea.l d0,a6
     a14:	222f 0024      	move.l 36(sp),d1
     a18:	242f 0020      	move.l 32(sp),d2
     a1c:	262f 001c      	move.l 28(sp),d3
     a20:	4eae ffd0      	jsr -48(a6)
     a24:	2f40 0018      	move.l d0,24(sp)
	Delay(50);
     a28:	7032           	moveq #50,d0
     a2a:	2f40 0014      	move.l d0,20(sp)
     a2e:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     a34:	2c40           	movea.l d0,a6
     a36:	222f 0014      	move.l 20(sp),d1
     a3a:	4eae ff3a      	jsr -198(a6)

	warpmode(1);
     a3e:	4878 0001      	pea 1 <_start+0x1>
     a42:	4eba 68ae      	jsr 72f2 <warpmode>(pc)
     a46:	588f           	addq.l #4,sp
	// TODO: precalc stuff here
	warpmode(0);
     a48:	42a7           	clr.l -(sp)
     a4a:	4eba 68a6      	jsr 72f2 <warpmode>(pc)
     a4e:	588f           	addq.l #4,sp

	/*TakeSystem();*/
	WaitVbl();
     a50:	4eba fc2c      	jsr 67e <WaitVbl>(pc)
  
  	//Zoom_InitRun();
  	RunTests();	//warpmode(1);
     a54:	4eba 286e      	jsr 32c4 <RunTests>(pc)
	// DEMO

	//RunDemo();

	// DEMO
	SetInterruptHandler((APTR)interruptHandler);
     a58:	487a fe82      	pea 8dc <interruptHandler.lto_priv.1>(pc)
     a5c:	4eba fc04      	jsr 662 <SetInterruptHandler>(pc)
     a60:	588f           	addq.l #4,sp
	custom->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     a62:	2079 0002 8528 	movea.l 28528 <custom>,a0
     a68:	317c c020 009a 	move.w #-16352,154(a0)
	custom->intreq=1<<INTB_VERTB;//reset vbl req
     a6e:	2079 0002 8528 	movea.l 28528 <custom>,a0
     a74:	317c 0020 009c 	move.w #32,156(a0)

	// END
	FreeSystem();
     a7a:	4eba fd58      	jsr 7d4 <FreeSystem>(pc)

	CloseLibrary((struct Library*)DOSBase);
     a7e:	2f79 0002 852c 	move.l 2852c <DOSBase>,16(sp)
     a84:	0010 
     a86:	2039 0002 8524 	move.l 28524 <SysBase>,d0
     a8c:	2c40           	movea.l d0,a6
     a8e:	226f 0010      	movea.l 16(sp),a1
     a92:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     a96:	2f79 0002 8530 	move.l 28530 <GfxBase>,12(sp)
     a9c:	000c 
     a9e:	2039 0002 8524 	move.l 28524 <SysBase>,d0
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
     ac6:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
     acc:	4878 0010      	pea 10 <_start+0x10>
     ad0:	4879 0001 a5a0 	pea 1a5a0 <ClsSprites>
     ad6:	42a7           	clr.l -(sp)
     ad8:	2f00           	move.l d0,-(sp)
     ada:	4eba 20fc      	jsr 2bd8 <TestCopperlistBatch>(pc)
     ade:	4fef 0010      	lea 16(sp),sp
     ae2:	4a80           	tst.l d0
     ae4:	6642           	bne.s b28 <SwScrollerTest+0x6e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     ae6:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     aec:	2c40           	movea.l d0,a6
     aee:	4eae ffc4      	jsr -60(a6)
     af2:	2f40 0070      	move.l d0,112(sp)
     af6:	202f 0070      	move.l 112(sp),d0
     afa:	2f40 006c      	move.l d0,108(sp)
     afe:	2f7c 0000 7693 	move.l #30355,104(sp)
     b04:	0068 
     b06:	702c           	moveq #44,d0
     b08:	2f40 0064      	move.l d0,100(sp)
     b0c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     b12:	2c40           	movea.l d0,a6
     b14:	222f 006c      	move.l 108(sp),d1
     b18:	242f 0068      	move.l 104(sp),d2
     b1c:	262f 0064      	move.l 100(sp),d3
     b20:	4eae ffd0      	jsr -48(a6)
     b24:	2f40 0060      	move.l d0,96(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     b28:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
     b2e:	4878 000c      	pea c <_start+0xc>
     b32:	4879 0001 a5e0 	pea 1a5e0 <ClScreen>
     b38:	4878 0010      	pea 10 <_start+0x10>
     b3c:	2f00           	move.l d0,-(sp)
     b3e:	4eba 2098      	jsr 2bd8 <TestCopperlistBatch>(pc)
     b42:	4fef 0010      	lea 16(sp),sp
     b46:	4a80           	tst.l d0
     b48:	6642           	bne.s b8c <SwScrollerTest+0xd2>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     b4a:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     b50:	2c40           	movea.l d0,a6
     b52:	4eae ffc4      	jsr -60(a6)
     b56:	2f40 005c      	move.l d0,92(sp)
     b5a:	202f 005c      	move.l 92(sp),d0
     b5e:	2f40 0058      	move.l d0,88(sp)
     b62:	2f7c 0000 76c9 	move.l #30409,84(sp)
     b68:	0054 
     b6a:	7036           	moveq #54,d0
     b6c:	2f40 0050      	move.l d0,80(sp)
     b70:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     b76:	2c40           	movea.l d0,a6
     b78:	222f 0058      	move.l 88(sp),d1
     b7c:	242f 0054      	move.l 84(sp),d2
     b80:	262f 0050      	move.l 80(sp),d3
     b84:	4eae ffd0      	jsr -48(a6)
     b88:	2f40 004c      	move.l d0,76(sp)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     b8c:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
     b92:	4878 0002      	pea 2 <_start+0x2>
     b96:	4879 0001 a520 	pea 1a520 <ClColor>
     b9c:	4878 001e      	pea 1e <_start+0x1e>
     ba0:	2f00           	move.l d0,-(sp)
     ba2:	4eba 2034      	jsr 2bd8 <TestCopperlistBatch>(pc)
     ba6:	4fef 0010      	lea 16(sp),sp
     baa:	4a80           	tst.l d0
     bac:	6642           	bne.s bf0 <SwScrollerTest+0x136>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     bae:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     bb4:	2c40           	movea.l d0,a6
     bb6:	4eae ffc4      	jsr -60(a6)
     bba:	2f40 0048      	move.l d0,72(sp)
     bbe:	202f 0048      	move.l 72(sp),d0
     bc2:	2f40 0044      	move.l d0,68(sp)
     bc6:	2f7c 0000 7700 	move.l #30464,64(sp)
     bcc:	0040 
     bce:	7021           	moveq #33,d0
     bd0:	2f40 003c      	move.l d0,60(sp)
     bd4:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     bda:	2c40           	movea.l d0,a6
     bdc:	222f 0044      	move.l 68(sp),d1
     be0:	242f 0040      	move.l 64(sp),d2
     be4:	262f 003c      	move.l 60(sp),d3
     be8:	4eae ffd0      	jsr -48(a6)
     bec:	2f40 0038      	move.l d0,56(sp)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     bf0:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
     bf6:	4878 fffe      	pea fffffffe <_end+0xfffd7a86>
     bfa:	4878 0020      	pea 20 <_start+0x20>
     bfe:	2f00           	move.l d0,-(sp)
     c00:	4eba 2014      	jsr 2c16 <TestCopperlistPos>(pc)
     c04:	4fef 000c      	lea 12(sp),sp
     c08:	4a80           	tst.l d0
     c0a:	6642           	bne.s c4e <SwScrollerTest+0x194>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     c0c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     c12:	2c40           	movea.l d0,a6
     c14:	4eae ffc4      	jsr -60(a6)
     c18:	2f40 0034      	move.l d0,52(sp)
     c1c:	202f 0034      	move.l 52(sp),d0
     c20:	2f40 0030      	move.l d0,48(sp)
     c24:	2f7c 0000 7722 	move.l #30498,44(sp)
     c2a:	002c 
     c2c:	7022           	moveq #34,d0
     c2e:	2f40 0028      	move.l d0,40(sp)
     c32:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     c38:	2c40           	movea.l d0,a6
     c3a:	222f 0030      	move.l 48(sp),d1
     c3e:	242f 002c      	move.l 44(sp),d2
     c42:	262f 0028      	move.l 40(sp),d3
     c46:	4eae ffd0      	jsr -48(a6)
     c4a:	2f40 0024      	move.l d0,36(sp)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     c4e:	2239 0001 b764 	move.l 1b764 <sw_text>,d1
     c54:	2039 0002 8510 	move.l 28510 <DrawBuffer>,d0
     c5a:	2f01           	move.l d1,-(sp)
     c5c:	2f00           	move.l d0,-(sp)
     c5e:	4879 0001 b768 	pea 1b768 <sw_testfont>
     c64:	4eba 0380      	jsr fe6 <WriteFont>(pc)
     c68:	4fef 000c      	lea 12(sp),sp

  UWORD *tstpointer = (UWORD *)DrawBuffer;
     c6c:	2f79 0002 8510 	move.l 28510 <DrawBuffer>,32(sp)
     c72:	0020 
  if( *tstpointer != 0xff00)
     c74:	206f 0020      	movea.l 32(sp),a0
     c78:	3010           	move.w (a0),d0
     c7a:	0c40 ff00      	cmpi.w #-256,d0
     c7e:	6742           	beq.s cc2 <SwScrollerTest+0x208>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     c80:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     c86:	2c40           	movea.l d0,a6
     c88:	4eae ffc4      	jsr -60(a6)
     c8c:	2f40 001c      	move.l d0,28(sp)
     c90:	202f 001c      	move.l 28(sp),d0
     c94:	2f40 0018      	move.l d0,24(sp)
     c98:	2f7c 0000 7745 	move.l #30533,20(sp)
     c9e:	0014 
     ca0:	7031           	moveq #49,d0
     ca2:	2f40 0010      	move.l d0,16(sp)
     ca6:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
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
     ce8:	23c0 0002 8508 	move.l d0,28508 <Copperlist1>
  Copperlist2 = ClbuildSW();
     cee:	4eba 0174      	jsr e64 <ClbuildSW>(pc)
     cf2:	23c0 0002 850c 	move.l d0,2850c <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     cf8:	2f7c 0000 c800 	move.l #51200,80(sp)
     cfe:	0050 
     d00:	7002           	moveq #2,d0
     d02:	2f40 004c      	move.l d0,76(sp)
     d06:	2039 0002 8524 	move.l 28524 <SysBase>,d0
     d0c:	2c40           	movea.l d0,a6
     d0e:	202f 0050      	move.l 80(sp),d0
     d12:	222f 004c      	move.l 76(sp),d1
     d16:	4eae ff3a      	jsr -198(a6)
     d1a:	2f40 0048      	move.l d0,72(sp)
     d1e:	202f 0048      	move.l 72(sp),d0
     d22:	23c0 0002 8500 	move.l d0,28500 <Bitplane1>
  if(Bitplane1 == 0) {
     d28:	2039 0002 8500 	move.l 28500 <Bitplane1>,d0
     d2e:	6658           	bne.s d88 <PrepareDisplaySW+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     d30:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     d36:	2c40           	movea.l d0,a6
     d38:	4eae ffc4      	jsr -60(a6)
     d3c:	2f40 0044      	move.l d0,68(sp)
     d40:	202f 0044      	move.l 68(sp),d0
     d44:	2f40 0040      	move.l d0,64(sp)
     d48:	2f7c 0000 7d29 	move.l #32041,60(sp)
     d4e:	003c 
     d50:	7026           	moveq #38,d0
     d52:	2f40 0038      	move.l d0,56(sp)
     d56:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     d5c:	2c40           	movea.l d0,a6
     d5e:	222f 0040      	move.l 64(sp),d1
     d62:	242f 003c      	move.l 60(sp),d2
     d66:	262f 0038      	move.l 56(sp),d3
     d6a:	4eae ffd0      	jsr -48(a6)
     d6e:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
     d72:	7001           	moveq #1,d0
     d74:	2f40 0030      	move.l d0,48(sp)
     d78:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     d7e:	2c40           	movea.l d0,a6
     d80:	222f 0030      	move.l 48(sp),d1
     d84:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
     d88:	2039 0002 8500 	move.l 28500 <Bitplane1>,d0
     d8e:	23c0 0002 8510 	move.l d0,28510 <DrawBuffer>
  DrawCopper = Copperlist1;
     d94:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
     d9a:	23c0 0002 8518 	move.l d0,28518 <DrawCopper>
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     da0:	2f7c 0000 c800 	move.l #51200,44(sp)
     da6:	002c 
     da8:	7002           	moveq #2,d0
     daa:	2f40 0028      	move.l d0,40(sp)
     dae:	2039 0002 8524 	move.l 28524 <SysBase>,d0
     db4:	2c40           	movea.l d0,a6
     db6:	202f 002c      	move.l 44(sp),d0
     dba:	222f 0028      	move.l 40(sp),d1
     dbe:	4eae ff3a      	jsr -198(a6)
     dc2:	2f40 0024      	move.l d0,36(sp)
     dc6:	202f 0024      	move.l 36(sp),d0
     dca:	23c0 0002 8504 	move.l d0,28504 <Bitplane2>
  if(Bitplane2 == 0) {
     dd0:	2039 0002 8504 	move.l 28504 <Bitplane2>,d0
     dd6:	6658           	bne.s e30 <PrepareDisplaySW+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     dd8:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     dde:	2c40           	movea.l d0,a6
     de0:	4eae ffc4      	jsr -60(a6)
     de4:	2f40 0020      	move.l d0,32(sp)
     de8:	202f 0020      	move.l 32(sp),d0
     dec:	2f40 001c      	move.l d0,28(sp)
     df0:	2f7c 0000 7d50 	move.l #32080,24(sp)
     df6:	0018 
     df8:	7026           	moveq #38,d0
     dfa:	2f40 0014      	move.l d0,20(sp)
     dfe:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     e04:	2c40           	movea.l d0,a6
     e06:	222f 001c      	move.l 28(sp),d1
     e0a:	242f 0018      	move.l 24(sp),d2
     e0e:	262f 0014      	move.l 20(sp),d3
     e12:	4eae ffd0      	jsr -48(a6)
     e16:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     e1a:	7001           	moveq #1,d0
     e1c:	2f40 000c      	move.l d0,12(sp)
     e20:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     e26:	2c40           	movea.l d0,a6
     e28:	222f 000c      	move.l 12(sp),d1
     e2c:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
     e30:	2039 0002 8504 	move.l 28504 <Bitplane2>,d0
     e36:	23c0 0002 8514 	move.l d0,28514 <ViewBuffer>
  ViewCopper = Copperlist2;
     e3c:	2039 0002 850c 	move.l 2850c <Copperlist2>,d0
     e42:	23c0 0002 851c 	move.l d0,2851c <ViewCopper>
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
     e7a:	2039 0002 8524 	move.l 28524 <SysBase>,d0
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
     e9c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     ea2:	2c40           	movea.l d0,a6
     ea4:	4eae ffc4      	jsr -60(a6)
     ea8:	2f40 0020      	move.l d0,32(sp)
     eac:	202f 0020      	move.l 32(sp),d0
     eb0:	2f40 001c      	move.l d0,28(sp)
     eb4:	2f7c 0000 7d77 	move.l #32119,24(sp)
     eba:	0018 
     ebc:	7228           	moveq #40,d1
     ebe:	2f41 0014      	move.l d1,20(sp)
     ec2:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     ec8:	2c40           	movea.l d0,a6
     eca:	222f 001c      	move.l 28(sp),d1
     ece:	242f 0018      	move.l 24(sp),d2
     ed2:	262f 0014      	move.l 20(sp),d3
     ed6:	4eae ffd0      	jsr -48(a6)
     eda:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     ede:	7401           	moveq #1,d2
     ee0:	2f42 000c      	move.l d2,12(sp)
     ee4:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
     eea:	2c40           	movea.l d0,a6
     eec:	222f 000c      	move.l 12(sp),d1
     ef0:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
     ef4:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
     efa:	2f7c 0001 a5a0 	move.l #107936,64(sp)
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
     f34:	2f7c 0001 a5e0 	move.l #108000,64(sp)
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
     f96:	2f7c 0001 a520 	move.l #107808,64(sp)
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
    105e:	3039 0002 855e 	move.w 2855e <Zoom_Counter>,d0
    1064:	5240           	addq.w #1,d0
    1066:	33c0 0002 855e 	move.w d0,2855e <Zoom_Counter>
  SwapCl();
    106c:	4eba f186      	jsr 1f4 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
    1070:	33fc 0001 0002 	move.w #1,28564 <Zoom_MouseReleased>
    1076:	8564 
  if( MouseLeft())
    1078:	4eba f23c      	jsr 2b6 <MouseLeft>(pc)
    107c:	4a40           	tst.w d0
    107e:	6708           	beq.s 1088 <Zoom_VblankHandler+0x2a>
    Zoom_Mousepressed = 1;
    1080:	33fc 0001 0002 	move.w #1,28566 <Zoom_Mousepressed>
    1086:	8566 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
    1088:	3039 0002 8566 	move.w 28566 <Zoom_Mousepressed>,d0
    108e:	0c40 0001      	cmpi.w #1,d0
    1092:	6616           	bne.s 10aa <Zoom_VblankHandler+0x4c>
    1094:	4eba f220      	jsr 2b6 <MouseLeft>(pc)
    1098:	4a40           	tst.w d0
    109a:	660e           	bne.s 10aa <Zoom_VblankHandler+0x4c>
    Zoom_MouseReleased = 1;
    109c:	33fc 0001 0002 	move.w #1,28564 <Zoom_MouseReleased>
    10a2:	8564 
    Zoom_Mousepressed = 0;
    10a4:	4279 0002 8566 	clr.w 28566 <Zoom_Mousepressed>
  }
    if( Zoom_MouseReleased == 1) {
    10aa:	3039 0002 8564 	move.w 28564 <Zoom_MouseReleased>,d0
    10b0:	0c40 0001      	cmpi.w #1,d0
    10b4:	666a           	bne.s 1120 <Zoom_VblankHandler+0xc2>
      Zoom_MouseReleased = 0;
    10b6:	4279 0002 8564 	clr.w 28564 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 0) {
    10bc:	3039 0002 856c 	move.w 2856c <Zoom_LevelOf102Zoom>,d0
    10c2:	664e           	bne.s 1112 <Zoom_VblankHandler+0xb4>
 
        if( Zoom_LevelOfZoom == 17)
    10c4:	3039 0002 856a 	move.w 2856a <Zoom_LevelOfZoom>,d0
    10ca:	0c40 0011      	cmpi.w #17,d0
    10ce:	660a           	bne.s 10da <Zoom_VblankHandler+0x7c>
          Zoom_LevelOfZoom = 0;
    10d0:	33fc 0000 0002 	move.w #0,2856a <Zoom_LevelOfZoom>
    10d6:	856a 
    10d8:	600e           	bra.s 10e8 <Zoom_VblankHandler+0x8a>
        else
          Zoom_LevelOfZoom++;
    10da:	3039 0002 856a 	move.w 2856a <Zoom_LevelOfZoom>,d0
    10e0:	5240           	addq.w #1,d0
    10e2:	33c0 0002 856a 	move.w d0,2856a <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = MaxZoom102[Zoom_LevelOfZoom] - 2;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
    10e8:	3039 0002 856a 	move.w 2856a <Zoom_LevelOfZoom>,d0
    10ee:	3000           	move.w d0,d0
    10f0:	0280 0000 ffff 	andi.l #65535,d0
    10f6:	2240           	movea.l d0,a1
    10f8:	d3c0           	adda.l d0,a1
    10fa:	41f9 0001 b738 	lea 1b738 <MaxZoom102>,a0
    1100:	3031 8800      	move.w (0,a1,a0.l),d0
    1104:	5540           	subq.w #2,d0
    1106:	33c0 0002 856c 	move.w d0,2856c <Zoom_LevelOf102Zoom>
        Zoom_SwapBuffers();
    110c:	4eba 0fd2      	jsr 20e0 <Zoom_SwapBuffers>(pc)
    1110:	600e           	bra.s 1120 <Zoom_VblankHandler+0xc2>
      } else 
        Zoom_LevelOf102Zoom--;
    1112:	3039 0002 856c 	move.w 2856c <Zoom_LevelOf102Zoom>,d0
    1118:	5340           	subq.w #1,d0
    111a:	33c0 0002 856c 	move.w d0,2856c <Zoom_LevelOf102Zoom>
    }
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
    1120:	2239 0002 8518 	move.l 28518 <DrawCopper>,d1
    1126:	3039 0002 856c 	move.w 2856c <Zoom_LevelOf102Zoom>,d0
    112c:	3000           	move.w d0,d0
    112e:	0280 0000 ffff 	andi.l #65535,d0
    1134:	2f01           	move.l d1,-(sp)
    1136:	2f00           	move.l d0,-(sp)
    1138:	4eba f420      	jsr 55a <Zoom_Shrink102>(pc)
    113c:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
    113e:	2239 0002 8518 	move.l 28518 <DrawCopper>,d1
    1144:	2039 0002 8514 	move.l 28514 <ViewBuffer>,d0
    114a:	2f01           	move.l d1,-(sp)
    114c:	2f00           	move.l d0,-(sp)
    114e:	4eba 0f12      	jsr 2062 <Zoom_SetBplPointers>(pc)
    1152:	508f           	addq.l #8,sp
 
}
    1154:	4e75           	rts

00001156 <Zoom_LoadImage>:

void Zoom_LoadImage( ULONG *destination) {  
    1156:	4fef fff4      	lea -12(sp),sp
    115a:	2f0e           	move.l a6,-(sp)
  CopyMem( startimage, destination, ZMBPLSIZE);
    115c:	2f79 0001 b7bc 	move.l 1b7bc <startimage>,12(sp)
    1162:	000c 
    1164:	2f6f 0014 0008 	move.l 20(sp),8(sp)
    116a:	2f7c 0000 ff00 	move.l #65280,4(sp)
    1170:	0004 
    1172:	2039 0002 8524 	move.l 28524 <SysBase>,d0
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
    11a2:	2079 0002 8520 	movea.l 28520 <hw>,a0
    11a8:	216f 0008 0050 	move.l 8(sp),80(a0)
  hw->bltdpt = (UWORD *) destination;
    11ae:	2079 0002 8520 	movea.l 28520 <hw>,a0
    11b4:	216f 000c 0054 	move.l 12(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    11ba:	302f 0002      	move.w 2(sp),d0
    11be:	ed48           	lsl.w #6,d0
    11c0:	2079 0002 8520 	movea.l 28520 <hw>,a0
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
    11dc:	3039 0002 8554 	move.w 28554 <ZoomBlit_Increment4SrcA>,d0
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
    11fa:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1200:	216f 0004 0050 	move.l 4(sp),80(a0)
  hw->bltbpt = source;
    1206:	2079 0002 8520 	movea.l 28520 <hw>,a0
    120c:	216f 000c 004c 	move.l 12(sp),76(a0)
  hw->bltdpt = destination;
    1212:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1218:	216f 0010 0054 	move.l 16(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    121e:	302f 0002      	move.w 2(sp),d0
    1222:	ed48           	lsl.w #6,d0
    1224:	2079 0002 8520 	movea.l 28520 <hw>,a0
    122a:	5440           	addq.w #2,d0
    122c:	3140 0058      	move.w d0,88(a0)

}
    1230:	508f           	addq.l #8,sp
    1232:	4e75           	rts

00001234 <Zoom_ZoomBlit2>:

void Zoom_ZoomBlit2( UWORD *src4a, UWORD *src4b, UWORD *dst, UWORD height,
                                                 UWORD bltamod, UWORD bltbmod) {
    1234:	4fef fff4      	lea -12(sp),sp
    1238:	206f 001c      	movea.l 28(sp),a0
    123c:	222f 0020      	move.l 32(sp),d1
    1240:	202f 0024      	move.l 36(sp),d0
    1244:	3048           	movea.w a0,a0
    1246:	3f48 0004      	move.w a0,4(sp)
    124a:	3201           	move.w d1,d1
    124c:	3f41 0002      	move.w d1,2(sp)
    1250:	3000           	move.w d0,d0
    1252:	3e80           	move.w d0,(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B
  UWORD *bp = 0x200;
    1254:	2f7c 0000 0200 	move.l #512,8(sp)
    125a:	0008 
  *bp = 0;
    125c:	206f 0008      	movea.l 8(sp),a0
    1260:	4250           	clr.w (a0)
  UWORD bltsize = (height << 6) + 2;
    1262:	302f 0004      	move.w 4(sp),d0
    1266:	ed48           	lsl.w #6,d0
    1268:	3200           	move.w d0,d1
    126a:	5441           	addq.w #2,d1
    126c:	3f41 0006      	move.w d1,6(sp)
  
  WaitBlt();
    1270:	4eba ee42      	jsr b4 <WaitBlt>(pc)
  1101
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  hw->bltamod = bltamod;
    1274:	2079 0002 8520 	movea.l 28520 <hw>,a0
    127a:	316f 0002 0064 	move.w 2(sp),100(a0)
  hw->bltbmod = bltbmod;  
    1280:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1286:	3157 0062      	move.w (sp),98(a0)
  hw->bltapt = src4a;
    128a:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1290:	216f 0010 0050 	move.l 16(sp),80(a0)
  hw->bltbpt = src4b;
    1296:	2079 0002 8520 	movea.l 28520 <hw>,a0
    129c:	216f 0014 004c 	move.l 20(sp),76(a0)
  hw->bltdpt = dst;
    12a2:	2079 0002 8520 	movea.l 28520 <hw>,a0
    12a8:	216f 0018 0054 	move.l 24(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    12ae:	302f 0004      	move.w 4(sp),d0
    12b2:	ed48           	lsl.w #6,d0
    12b4:	2079 0002 8520 	movea.l 28520 <hw>,a0
    12ba:	5440           	addq.w #2,d0
    12bc:	3140 0058      	move.w d0,88(a0)

}
    12c0:	4fef 000c      	lea 12(sp),sp
    12c4:	4e75           	rts

000012c6 <Zoom_InitRun>:


void Zoom_InitRun() {
    12c6:	4fef ffc8      	lea -56(sp),sp
    12ca:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    12cc:	4279 0002 855e 	clr.w 2855e <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    12d2:	7004           	moveq #4,d0
    12d4:	2f40 0038      	move.l d0,56(sp)
    12d8:	7002           	moveq #2,d0
    12da:	2f40 0034      	move.l d0,52(sp)
    12de:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    12e4:	2c40           	movea.l d0,a6
    12e6:	202f 0038      	move.l 56(sp),d0
    12ea:	222f 0034      	move.l 52(sp),d1
    12ee:	4eae ff3a      	jsr -198(a6)
    12f2:	2f40 0030      	move.l d0,48(sp)
    12f6:	202f 0030      	move.l 48(sp),d0
    12fa:	23c0 0002 854c 	move.l d0,2854c <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 15;
    1300:	33fc 000f 0002 	move.w #15,2856c <Zoom_LevelOf102Zoom>
    1306:	856c 
  ZoomHorizontal = 16;
    1308:	33fc 0010 0002 	move.w #16,28570 <ZoomHorizontal>
    130e:	8570 
  Zoom_PrepareDisplay();
    1310:	4eba 01da      	jsr 14ec <Zoom_PrepareDisplay>(pc)
  Zoom_StartImage = startimage;
    1314:	2039 0001 b7bc 	move.l 1b7bc <startimage>,d0
    131a:	23c0 0002 8560 	move.l d0,28560 <Zoom_StartImage>
  Zoom_LoadImage( Bitplane1);
    1320:	2039 0002 8500 	move.l 28500 <Bitplane1>,d0
    1326:	2f00           	move.l d0,-(sp)
    1328:	4eba fe2c      	jsr 1156 <Zoom_LoadImage>(pc)
    132c:	588f           	addq.l #4,sp
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
    132e:	2239 0002 8504 	move.l 28504 <Bitplane2>,d1
    1334:	2039 0002 8500 	move.l 28500 <Bitplane1>,d0
    133a:	4878 0005      	pea 5 <_start+0x5>
    133e:	42a7           	clr.l -(sp)
    1340:	2f01           	move.l d1,-(sp)
    1342:	2f00           	move.l d0,-(sp)
    1344:	4eba 0992      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    1348:	4fef 0010      	lea 16(sp),sp
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
    134c:	2f79 0002 8504 	move.l 28504 <Bitplane2>,44(sp)
    1352:	002c 
    1354:	2f79 0002 8500 	move.l 28500 <Bitplane1>,40(sp)
    135a:	0028 
    135c:	2f7c 0000 ff00 	move.l #65280,36(sp)
    1362:	0024 
    1364:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    136a:	2c40           	movea.l d0,a6
    136c:	206f 002c      	movea.l 44(sp),a0
    1370:	226f 0028      	movea.l 40(sp),a1
    1374:	202f 0024      	move.l 36(sp),d0
    1378:	4eae fd90      	jsr -624(a6)
  CopyMem( Bitplane2, startimage, ZMBPLSIZE);
    137c:	2f79 0002 8504 	move.l 28504 <Bitplane2>,32(sp)
    1382:	0020 
    1384:	2f79 0001 b7bc 	move.l 1b7bc <startimage>,28(sp)
    138a:	001c 
    138c:	2f7c 0000 ff00 	move.l #65280,24(sp)
    1392:	0018 
    1394:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    139a:	2c40           	movea.l d0,a6
    139c:	206f 0020      	movea.l 32(sp),a0
    13a0:	226f 001c      	movea.l 28(sp),a1
    13a4:	202f 0018      	move.l 24(sp),d0
    13a8:	4eae fd90      	jsr -624(a6)
  
  Zoom_Shrink102( 15, Copperlist1);
    13ac:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    13b2:	2f00           	move.l d0,-(sp)
    13b4:	4878 000f      	pea f <_start+0xf>
    13b8:	4eba f1a0      	jsr 55a <Zoom_Shrink102>(pc)
    13bc:	508f           	addq.l #8,sp
  Zoom_Shrink102( 15, Copperlist2);
    13be:	2039 0002 850c 	move.l 2850c <Copperlist2>,d0
    13c4:	2f00           	move.l d0,-(sp)
    13c6:	4878 000f      	pea f <_start+0xf>
    13ca:	4eba f18e      	jsr 55a <Zoom_Shrink102>(pc)
    13ce:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 1;
    13d0:	33fc 0001 0002 	move.w #1,2856a <Zoom_LevelOfZoom>
    13d6:	856a 
  Zoom_Direction = 1;                                                  
    13d8:	33fc 0001 0002 	move.w #1,2856e <Zoom_Direction>
    13de:	856e 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    13e0:	7016           	moveq #22,d0
    13e2:	2f40 0014      	move.l d0,20(sp)
    13e6:	2f7c 0001 0001 	move.l #65537,16(sp)
    13ec:	0010 
    13ee:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    13f4:	2c40           	movea.l d0,a6
    13f6:	202f 0014      	move.l 20(sp),d0
    13fa:	222f 0010      	move.l 16(sp),d1
    13fe:	4eae ff3a      	jsr -198(a6)
    1402:	2f40 000c      	move.l d0,12(sp)
    1406:	202f 000c      	move.l 12(sp),d0
    140a:	23c0 0002 8556 	move.l d0,28556 <Zoom_vbint>
    1410:	2039 0002 8556 	move.l 28556 <Zoom_vbint>,d0
    1416:	673e           	beq.s 1456 <Zoom_InitRun+0x190>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1418:	2079 0002 8556 	movea.l 28556 <Zoom_vbint>,a0
    141e:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    1424:	2079 0002 8556 	movea.l 28556 <Zoom_vbint>,a0
    142a:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    1430:	2079 0002 8556 	movea.l 28556 <Zoom_vbint>,a0
    1436:	217c 0001 7c9f 	move.l #97439,10(a0)
    143c:	000a 
    Zoom_vbint->is_Data = NULL;
    143e:	2079 0002 8556 	movea.l 28556 <Zoom_vbint>,a0
    1444:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    1448:	2079 0002 8556 	movea.l 28556 <Zoom_vbint>,a0
    144e:	217c 0000 105e 	move.l #4190,18(a0)
    1454:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    1456:	7005           	moveq #5,d0
    1458:	2f40 0008      	move.l d0,8(sp)
    145c:	2f79 0002 8556 	move.l 28556 <Zoom_vbint>,4(sp)
    1462:	0004 
    1464:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    146a:	2c40           	movea.l d0,a6
    146c:	202f 0008      	move.l 8(sp),d0
    1470:	226f 0004      	movea.l 4(sp),a1
    1474:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    1478:	2239 0002 851c 	move.l 2851c <ViewCopper>,d1
    147e:	2039 0002 8514 	move.l 28514 <ViewBuffer>,d0
    1484:	2f01           	move.l d1,-(sp)
    1486:	2f00           	move.l d0,-(sp)
    1488:	4eba 0bd8      	jsr 2062 <Zoom_SetBplPointers>(pc)
    148c:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    148e:	2239 0002 8518 	move.l 28518 <DrawCopper>,d1
    1494:	2039 0002 8514 	move.l 28514 <ViewBuffer>,d0
    149a:	2f01           	move.l d1,-(sp)
    149c:	2f00           	move.l d0,-(sp)
    149e:	4eba 0bc2      	jsr 2062 <Zoom_SetBplPointers>(pc)
    14a2:	508f           	addq.l #8,sp
  SwapCl();
    14a4:	4eba ed4e      	jsr 1f4 <SwapCl>(pc)
  
}
    14a8:	2c5f           	movea.l (sp)+,a6
    14aa:	4fef 0038      	lea 56(sp),sp
    14ae:	4e75           	rts

000014b0 <Zoom_Dealloc>:

void Zoom_Dealloc() {
    14b0:	518f           	subq.l #8,sp
    14b2:	2f0e           	move.l a6,-(sp)
  RemIntServer(INTB_VERTB, Zoom_vbint);
    14b4:	7005           	moveq #5,d0
    14b6:	2f40 0008      	move.l d0,8(sp)
    14ba:	2f79 0002 8556 	move.l 28556 <Zoom_vbint>,4(sp)
    14c0:	0004 
    14c2:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    14c8:	2c40           	movea.l d0,a6
    14ca:	202f 0008      	move.l 8(sp),d0
    14ce:	226f 0004      	movea.l 4(sp),a1
    14d2:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    14d6:	2f3c 0000 ff00 	move.l #65280,-(sp)
    14dc:	4878 031c      	pea 31c <RunDemo+0x6>
    14e0:	4eba ebfe      	jsr e0 <FreeDisplay>(pc)
    14e4:	508f           	addq.l #8,sp
}
    14e6:	2c5f           	movea.l (sp)+,a6
    14e8:	508f           	addq.l #8,sp
    14ea:	4e75           	rts

000014ec <Zoom_PrepareDisplay>:
  
int Zoom_PrepareDisplay() {
    14ec:	4fef ffb8      	lea -72(sp),sp
    14f0:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClbuildZoom( );
    14f4:	4eba 01ba      	jsr 16b0 <ClbuildZoom>(pc)
    14f8:	23c0 0002 8508 	move.l d0,28508 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    14fe:	4eba 01b0      	jsr 16b0 <ClbuildZoom>(pc)
    1502:	23c0 0002 850c 	move.l d0,2850c <Copperlist2>
  Bitplane1 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
    1508:	2f7c 0000 ff00 	move.l #65280,80(sp)
    150e:	0050 
    1510:	7002           	moveq #2,d0
    1512:	2f40 004c      	move.l d0,76(sp)
    1516:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    151c:	2c40           	movea.l d0,a6
    151e:	202f 0050      	move.l 80(sp),d0
    1522:	222f 004c      	move.l 76(sp),d1
    1526:	4eae ff3a      	jsr -198(a6)
    152a:	2f40 0048      	move.l d0,72(sp)
    152e:	202f 0048      	move.l 72(sp),d0
    1532:	23c0 0002 8500 	move.l d0,28500 <Bitplane1>
  if(Bitplane1 == 0) {
    1538:	2039 0002 8500 	move.l 28500 <Bitplane1>,d0
    153e:	6658           	bne.s 1598 <Zoom_PrepareDisplay+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1540:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    1546:	2c40           	movea.l d0,a6
    1548:	4eae ffc4      	jsr -60(a6)
    154c:	2f40 0044      	move.l d0,68(sp)
    1550:	202f 0044      	move.l 68(sp),d0
    1554:	2f40 0040      	move.l d0,64(sp)
    1558:	2f7c 0000 7d29 	move.l #32041,60(sp)
    155e:	003c 
    1560:	7026           	moveq #38,d0
    1562:	2f40 0038      	move.l d0,56(sp)
    1566:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    156c:	2c40           	movea.l d0,a6
    156e:	222f 0040      	move.l 64(sp),d1
    1572:	242f 003c      	move.l 60(sp),d2
    1576:	262f 0038      	move.l 56(sp),d3
    157a:	4eae ffd0      	jsr -48(a6)
    157e:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    1582:	7001           	moveq #1,d0
    1584:	2f40 0030      	move.l d0,48(sp)
    1588:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    158e:	2c40           	movea.l d0,a6
    1590:	222f 0030      	move.l 48(sp),d1
    1594:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    1598:	2039 0002 8500 	move.l 28500 <Bitplane1>,d0
    159e:	23c0 0002 8510 	move.l d0,28510 <DrawBuffer>
  DrawCopper = Copperlist1;
    15a4:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    15aa:	23c0 0002 8518 	move.l d0,28518 <DrawCopper>
  Bitplane2 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
    15b0:	2f7c 0000 ff00 	move.l #65280,44(sp)
    15b6:	002c 
    15b8:	7002           	moveq #2,d0
    15ba:	2f40 0028      	move.l d0,40(sp)
    15be:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    15c4:	2c40           	movea.l d0,a6
    15c6:	202f 002c      	move.l 44(sp),d0
    15ca:	222f 0028      	move.l 40(sp),d1
    15ce:	4eae ff3a      	jsr -198(a6)
    15d2:	2f40 0024      	move.l d0,36(sp)
    15d6:	202f 0024      	move.l 36(sp),d0
    15da:	23c0 0002 8504 	move.l d0,28504 <Bitplane2>
  if(Bitplane2 == 0) {
    15e0:	2039 0002 8504 	move.l 28504 <Bitplane2>,d0
    15e6:	6658           	bne.s 1640 <Zoom_PrepareDisplay+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    15e8:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    15ee:	2c40           	movea.l d0,a6
    15f0:	4eae ffc4      	jsr -60(a6)
    15f4:	2f40 0020      	move.l d0,32(sp)
    15f8:	202f 0020      	move.l 32(sp),d0
    15fc:	2f40 001c      	move.l d0,28(sp)
    1600:	2f7c 0000 7d50 	move.l #32080,24(sp)
    1606:	0018 
    1608:	7026           	moveq #38,d0
    160a:	2f40 0014      	move.l d0,20(sp)
    160e:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    1614:	2c40           	movea.l d0,a6
    1616:	222f 001c      	move.l 28(sp),d1
    161a:	242f 0018      	move.l 24(sp),d2
    161e:	262f 0014      	move.l 20(sp),d3
    1622:	4eae ffd0      	jsr -48(a6)
    1626:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    162a:	7001           	moveq #1,d0
    162c:	2f40 000c      	move.l d0,12(sp)
    1630:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    1636:	2c40           	movea.l d0,a6
    1638:	222f 000c      	move.l 12(sp),d1
    163c:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    1640:	2039 0002 8504 	move.l 28504 <Bitplane2>,d0
    1646:	23c0 0002 8514 	move.l d0,28514 <ViewBuffer>
  ViewCopper = Copperlist2;
    164c:	2039 0002 850c 	move.l 2850c <Copperlist2>,d0
    1652:	23c0 0002 851c 	move.l d0,2851c <ViewCopper>
  return 0;
    1658:	7000           	moveq #0,d0
}
    165a:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    165e:	4fef 0048      	lea 72(sp),sp
    1662:	4e75           	rts

00001664 <Zoom_Init>:

void Zoom_Init() {
    1664:	4fef fff4      	lea -12(sp),sp
    1668:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    166a:	7004           	moveq #4,d0
    166c:	2f40 000c      	move.l d0,12(sp)
    1670:	7002           	moveq #2,d0
    1672:	2f40 0008      	move.l d0,8(sp)
    1676:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    167c:	2c40           	movea.l d0,a6
    167e:	202f 000c      	move.l 12(sp),d0
    1682:	222f 0008      	move.l 8(sp),d1
    1686:	4eae ff3a      	jsr -198(a6)
    168a:	2f40 0004      	move.l d0,4(sp)
    168e:	202f 0004      	move.l 4(sp),d0
    1692:	23c0 0002 854c 	move.l d0,2854c <Zoom_ZoomBlitMask>
  ZoomHorizontal = 16;
    1698:	33fc 0010 0002 	move.w #16,28570 <ZoomHorizontal>
    169e:	8570 
  Zoom_LevelOf102Zoom = 15;
    16a0:	33fc 000f 0002 	move.w #15,2856c <Zoom_LevelOf102Zoom>
    16a6:	856c 
}
    16a8:	2c5f           	movea.l (sp)+,a6
    16aa:	4fef 000c      	lea 12(sp),sp
    16ae:	4e75           	rts

000016b0 <ClbuildZoom>:


ULONG * ClbuildZoom() {
    16b0:	4fef ffac      	lea -84(sp),sp
    16b4:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    16b8:	2f7c 0000 031c 	move.l #796,68(sp)
    16be:	0044 
    16c0:	7002           	moveq #2,d0
    16c2:	2f40 0040      	move.l d0,64(sp)
    16c6:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    16cc:	2c40           	movea.l d0,a6
    16ce:	202f 0044      	move.l 68(sp),d0
    16d2:	222f 0040      	move.l 64(sp),d1
    16d6:	4eae ff3a      	jsr -198(a6)
    16da:	2f40 003c      	move.l d0,60(sp)
    16de:	202f 003c      	move.l 60(sp),d0
    16e2:	2f40 0038      	move.l d0,56(sp)
  
  if( retval == 0) {
    16e6:	6658           	bne.s 1740 <ClbuildZoom+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    16e8:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    16ee:	2c40           	movea.l d0,a6
    16f0:	4eae ffc4      	jsr -60(a6)
    16f4:	2f40 0034      	move.l d0,52(sp)
    16f8:	202f 0034      	move.l 52(sp),d0
    16fc:	2f40 0030      	move.l d0,48(sp)
    1700:	2f7c 0000 7d77 	move.l #32119,44(sp)
    1706:	002c 
    1708:	7228           	moveq #40,d1
    170a:	2f41 0028      	move.l d1,40(sp)
    170e:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    1714:	2c40           	movea.l d0,a6
    1716:	222f 0030      	move.l 48(sp),d1
    171a:	242f 002c      	move.l 44(sp),d2
    171e:	262f 0028      	move.l 40(sp),d3
    1722:	4eae ffd0      	jsr -48(a6)
    1726:	2f40 0024      	move.l d0,36(sp)
    Exit(1);
    172a:	7401           	moveq #1,d2
    172c:	2f42 0020      	move.l d2,32(sp)
    1730:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    1736:	2c40           	movea.l d0,a6
    1738:	222f 0020      	move.l 32(sp),d1
    173c:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    1740:	2f6f 0038 005c 	move.l 56(sp),92(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    1746:	2f7c 0001 a5a0 	move.l #107936,88(sp)
    174c:	0058 
  for(int i=0; i<16;i++)
    174e:	42af 0054      	clr.l 84(sp)
    1752:	6024           	bra.s 1778 <ClbuildZoom+0xc8>
    *cl++ = *clpartinstruction++;
    1754:	222f 0058      	move.l 88(sp),d1
    1758:	2001           	move.l d1,d0
    175a:	5880           	addq.l #4,d0
    175c:	2f40 0058      	move.l d0,88(sp)
    1760:	202f 005c      	move.l 92(sp),d0
    1764:	2400           	move.l d0,d2
    1766:	5882           	addq.l #4,d2
    1768:	2f42 005c      	move.l d2,92(sp)
    176c:	2041           	movea.l d1,a0
    176e:	2210           	move.l (a0),d1
    1770:	2040           	movea.l d0,a0
    1772:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    1774:	52af 0054      	addq.l #1,84(sp)
    1778:	700f           	moveq #15,d0
    177a:	b0af 0054      	cmp.l 84(sp),d0
    177e:	6cd4           	bge.s 1754 <ClbuildZoom+0xa4>
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
    1780:	2f7c 0001 a5e0 	move.l #108000,88(sp)
    1786:	0058 
  for(int i=0; i<12;i++)
    1788:	42af 0050      	clr.l 80(sp)
    178c:	6024           	bra.s 17b2 <ClbuildZoom+0x102>
    *cl++ = *clpartinstruction++;
    178e:	222f 0058      	move.l 88(sp),d1
    1792:	2401           	move.l d1,d2
    1794:	5882           	addq.l #4,d2
    1796:	2f42 0058      	move.l d2,88(sp)
    179a:	202f 005c      	move.l 92(sp),d0
    179e:	2400           	move.l d0,d2
    17a0:	5882           	addq.l #4,d2
    17a2:	2f42 005c      	move.l d2,92(sp)
    17a6:	2041           	movea.l d1,a0
    17a8:	2210           	move.l (a0),d1
    17aa:	2040           	movea.l d0,a0
    17ac:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    17ae:	52af 0050      	addq.l #1,80(sp)
    17b2:	700b           	moveq #11,d0
    17b4:	b0af 0050      	cmp.l 80(sp),d0
    17b8:	6cd4           	bge.s 178e <ClbuildZoom+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    17ba:	202f 005c      	move.l 92(sp),d0
    17be:	2200           	move.l d0,d1
    17c0:	5881           	addq.l #4,d1
    17c2:	2f41 005c      	move.l d1,92(sp)
    17c6:	2040           	movea.l d0,a0
    17c8:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    17ce:	202f 005c      	move.l 92(sp),d0
    17d2:	2200           	move.l d0,d1
    17d4:	5881           	addq.l #4,d1
    17d6:	2f41 005c      	move.l d1,92(sp)
    17da:	2040           	movea.l d0,a0
    17dc:	20bc 00e2 0000 	move.l #14811136,(a0)
  *cl++ = 0x00e40000;
    17e2:	202f 005c      	move.l 92(sp),d0
    17e6:	2200           	move.l d0,d1
    17e8:	5881           	addq.l #4,d1
    17ea:	2f41 005c      	move.l d1,92(sp)
    17ee:	2040           	movea.l d0,a0
    17f0:	20bc 00e4 0000 	move.l #14942208,(a0)
  *cl++ = 0x00e60000;
    17f6:	202f 005c      	move.l 92(sp),d0
    17fa:	2200           	move.l d0,d1
    17fc:	5881           	addq.l #4,d1
    17fe:	2f41 005c      	move.l d1,92(sp)
    1802:	2040           	movea.l d0,a0
    1804:	20bc 00e6 0000 	move.l #15073280,(a0)
  *cl++ = 0x00e80000;
    180a:	202f 005c      	move.l 92(sp),d0
    180e:	2200           	move.l d0,d1
    1810:	5881           	addq.l #4,d1
    1812:	2f41 005c      	move.l d1,92(sp)
    1816:	2040           	movea.l d0,a0
    1818:	20bc 00e8 0000 	move.l #15204352,(a0)
  *cl++ = 0x00ea0000;
    181e:	202f 005c      	move.l 92(sp),d0
    1822:	2200           	move.l d0,d1
    1824:	5881           	addq.l #4,d1
    1826:	2f41 005c      	move.l d1,92(sp)
    182a:	2040           	movea.l d0,a0
    182c:	20bc 00ea 0000 	move.l #15335424,(a0)
  *cl++ = 0x00ec0000;
    1832:	202f 005c      	move.l 92(sp),d0
    1836:	2200           	move.l d0,d1
    1838:	5881           	addq.l #4,d1
    183a:	2f41 005c      	move.l d1,92(sp)
    183e:	2040           	movea.l d0,a0
    1840:	20bc 00ec 0000 	move.l #15466496,(a0)
  *cl++ = 0x00ee0000;
    1846:	202f 005c      	move.l 92(sp),d0
    184a:	2200           	move.l d0,d1
    184c:	5881           	addq.l #4,d1
    184e:	2f41 005c      	move.l d1,92(sp)
    1852:	2040           	movea.l d0,a0
    1854:	20bc 00ee 0000 	move.l #15597568,(a0)
  *cl++ = 0x00f00000;
    185a:	202f 005c      	move.l 92(sp),d0
    185e:	2200           	move.l d0,d1
    1860:	5881           	addq.l #4,d1
    1862:	2f41 005c      	move.l d1,92(sp)
    1866:	2040           	movea.l d0,a0
    1868:	20bc 00f0 0000 	move.l #15728640,(a0)
  *cl++ = 0x00f20000;
    186e:	202f 005c      	move.l 92(sp),d0
    1872:	2200           	move.l d0,d1
    1874:	5881           	addq.l #4,d1
    1876:	2f41 005c      	move.l d1,92(sp)
    187a:	2040           	movea.l d0,a0
    187c:	20bc 00f2 0000 	move.l #15859712,(a0)

  clpartinstruction = ClColor;
    1882:	2f7c 0001 a520 	move.l #107808,88(sp)
    1888:	0058 
  for(int i=0; i<32;i++)
    188a:	42af 004c      	clr.l 76(sp)
    188e:	6024           	bra.s 18b4 <ClbuildZoom+0x204>
    *cl++ = *clpartinstruction++;
    1890:	222f 0058      	move.l 88(sp),d1
    1894:	2001           	move.l d1,d0
    1896:	5880           	addq.l #4,d0
    1898:	2f40 0058      	move.l d0,88(sp)
    189c:	202f 005c      	move.l 92(sp),d0
    18a0:	2400           	move.l d0,d2
    18a2:	5882           	addq.l #4,d2
    18a4:	2f42 005c      	move.l d2,92(sp)
    18a8:	2041           	movea.l d1,a0
    18aa:	2210           	move.l (a0),d1
    18ac:	2040           	movea.l d0,a0
    18ae:	2081           	move.l d1,(a0)
  for(int i=0; i<32;i++)
    18b0:	52af 004c      	addq.l #1,76(sp)
    18b4:	701f           	moveq #31,d0
    18b6:	b0af 004c      	cmp.l 76(sp),d0
    18ba:	6cd4           	bge.s 1890 <ClbuildZoom+0x1e0>
  
  ULONG cop2 = cl+3;
    18bc:	700c           	moveq #12,d0
    18be:	d0af 005c      	add.l 92(sp),d0
    18c2:	2f40 001c      	move.l d0,28(sp)
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    18c6:	202f 001c      	move.l 28(sp),d0
    18ca:	4240           	clr.w d0
    18cc:	4840           	swap d0
    18ce:	2200           	move.l d0,d1
    18d0:	0681 0084 0000 	addi.l #8650752,d1
    18d6:	2f41 0018      	move.l d1,24(sp)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    18da:	202f 001c      	move.l 28(sp),d0
    18de:	0280 0000 ffff 	andi.l #65535,d0
    18e4:	2400           	move.l d0,d2
    18e6:	0682 0086 0000 	addi.l #8781824,d2
    18ec:	2f42 0014      	move.l d2,20(sp)
  clpartinstruction = Cl102ZoomInit;
    18f0:	2f7c 0001 a610 	move.l #108048,88(sp)
    18f6:	0058 
  *cl++ = cop2lch;
    18f8:	202f 005c      	move.l 92(sp),d0
    18fc:	2200           	move.l d0,d1
    18fe:	5881           	addq.l #4,d1
    1900:	2f41 005c      	move.l d1,92(sp)
    1904:	2040           	movea.l d0,a0
    1906:	20af 0018      	move.l 24(sp),(a0)
  *cl++ = cop2lcl;
    190a:	202f 005c      	move.l 92(sp),d0
    190e:	2200           	move.l d0,d1
    1910:	5881           	addq.l #4,d1
    1912:	2f41 005c      	move.l d1,92(sp)
    1916:	2040           	movea.l d0,a0
    1918:	20af 0014      	move.l 20(sp),(a0)
  *cl++ = 0x2c01ff00;
    191c:	202f 005c      	move.l 92(sp),d0
    1920:	2200           	move.l d0,d1
    1922:	5881           	addq.l #4,d1
    1924:	2f41 005c      	move.l d1,92(sp)
    1928:	2040           	movea.l d0,a0
    192a:	20bc 2c01 ff00 	move.l #738328320,(a0)

  ULONG cop2br1 = cop2 + ( (30)<<2);
    1930:	7078           	moveq #120,d0
    1932:	d0af 001c      	add.l 28(sp),d0
    1936:	2f40 0010      	move.l d0,16(sp)
  ULONG cop2br2 = cop2 + ( (86)<<2);
    193a:	222f 001c      	move.l 28(sp),d1
    193e:	0681 0000 0158 	addi.l #344,d1
    1944:	2f41 000c      	move.l d1,12(sp)
  clpartinstruction = Cl102ZoomRepeat;
    1948:	2f7c 0001 a61c 	move.l #108060,88(sp)
    194e:	0058 
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    1950:	202f 0010      	move.l 16(sp),d0
    1954:	4240           	clr.w d0
    1956:	4840           	swap d0
    1958:	307c 0070      	movea.w #112,a0
    195c:	d1ef 0058      	adda.l 88(sp),a0
    1960:	0680 0084 0000 	addi.l #8650752,d0
    1966:	2080           	move.l d0,(a0)
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    1968:	202f 0010      	move.l 16(sp),d0
    196c:	0280 0000 ffff 	andi.l #65535,d0
    1972:	307c 0074      	movea.w #116,a0
    1976:	d1ef 0058      	adda.l 88(sp),a0
    197a:	0680 0086 0000 	addi.l #8781824,d0
    1980:	2080           	move.l d0,(a0)
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    1982:	202f 000c      	move.l 12(sp),d0
    1986:	4240           	clr.w d0
    1988:	4840           	swap d0
    198a:	206f 0058      	movea.l 88(sp),a0
    198e:	41e8 0150      	lea 336(a0),a0
    1992:	0680 0084 0000 	addi.l #8650752,d0
    1998:	2080           	move.l d0,(a0)
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    199a:	202f 000c      	move.l 12(sp),d0
    199e:	0280 0000 ffff 	andi.l #65535,d0
    19a4:	206f 0058      	movea.l 88(sp),a0
    19a8:	41e8 0154      	lea 340(a0),a0
    19ac:	0680 0086 0000 	addi.l #8781824,d0
    19b2:	2080           	move.l d0,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    19b4:	42af 0048      	clr.l 72(sp)
    19b8:	6024           	bra.s 19de <ClbuildZoom+0x32e>
    *cl++ = *clpartinstruction++;
    19ba:	222f 0058      	move.l 88(sp),d1
    19be:	2401           	move.l d1,d2
    19c0:	5882           	addq.l #4,d2
    19c2:	2f42 0058      	move.l d2,88(sp)
    19c6:	202f 005c      	move.l 92(sp),d0
    19ca:	2400           	move.l d0,d2
    19cc:	5882           	addq.l #4,d2
    19ce:	2f42 005c      	move.l d2,92(sp)
    19d2:	2041           	movea.l d1,a0
    19d4:	2210           	move.l (a0),d1
    19d6:	2040           	movea.l d0,a0
    19d8:	2081           	move.l d1,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    19da:	52af 0048      	addq.l #1,72(sp)
    19de:	7071           	moveq #113,d0
    19e0:	b0af 0048      	cmp.l 72(sp),d0
    19e4:	6cd4           	bge.s 19ba <ClbuildZoom+0x30a>

   *cl++ = 0xfffffffe;
    19e6:	202f 005c      	move.l 92(sp),d0
    19ea:	2200           	move.l d0,d1
    19ec:	5881           	addq.l #4,d1
    19ee:	2f41 005c      	move.l d1,92(sp)
    19f2:	74fe           	moveq #-2,d2
    19f4:	2040           	movea.l d0,a0
    19f6:	2082           	move.l d2,(a0)

  return retval;
    19f8:	202f 0038      	move.l 56(sp),d0
}
    19fc:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1a00:	4fef 0054      	lea 84(sp),sp
    1a04:	4e75           	rts

00001a06 <PrepareDisplayZoom>:

 int PrepareDisplayZoom() {
    1a06:	4fef ffb8      	lea -72(sp),sp
    1a0a:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildZoom();
    1a0e:	4eba fca0      	jsr 16b0 <ClbuildZoom>(pc)
    1a12:	23c0 0002 8508 	move.l d0,28508 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1a18:	4eba fc96      	jsr 16b0 <ClbuildZoom>(pc)
    1a1c:	23c0 0002 850c 	move.l d0,2850c <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1a22:	2f7c 0000 ff00 	move.l #65280,80(sp)
    1a28:	0050 
    1a2a:	7002           	moveq #2,d0
    1a2c:	2f40 004c      	move.l d0,76(sp)
    1a30:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    1a36:	2c40           	movea.l d0,a6
    1a38:	202f 0050      	move.l 80(sp),d0
    1a3c:	222f 004c      	move.l 76(sp),d1
    1a40:	4eae ff3a      	jsr -198(a6)
    1a44:	2f40 0048      	move.l d0,72(sp)
    1a48:	202f 0048      	move.l 72(sp),d0
    1a4c:	23c0 0002 8500 	move.l d0,28500 <Bitplane1>
  if(Bitplane1 == 0) {
    1a52:	2039 0002 8500 	move.l 28500 <Bitplane1>,d0
    1a58:	6658           	bne.s 1ab2 <PrepareDisplayZoom+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1a5a:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    1a60:	2c40           	movea.l d0,a6
    1a62:	4eae ffc4      	jsr -60(a6)
    1a66:	2f40 0044      	move.l d0,68(sp)
    1a6a:	202f 0044      	move.l 68(sp),d0
    1a6e:	2f40 0040      	move.l d0,64(sp)
    1a72:	2f7c 0000 7d29 	move.l #32041,60(sp)
    1a78:	003c 
    1a7a:	7026           	moveq #38,d0
    1a7c:	2f40 0038      	move.l d0,56(sp)
    1a80:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    1a86:	2c40           	movea.l d0,a6
    1a88:	222f 0040      	move.l 64(sp),d1
    1a8c:	242f 003c      	move.l 60(sp),d2
    1a90:	262f 0038      	move.l 56(sp),d3
    1a94:	4eae ffd0      	jsr -48(a6)
    1a98:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    1a9c:	7001           	moveq #1,d0
    1a9e:	2f40 0030      	move.l d0,48(sp)
    1aa2:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    1aa8:	2c40           	movea.l d0,a6
    1aaa:	222f 0030      	move.l 48(sp),d1
    1aae:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    1ab2:	2039 0002 8500 	move.l 28500 <Bitplane1>,d0
    1ab8:	23c0 0002 8510 	move.l d0,28510 <DrawBuffer>
  DrawCopper = Copperlist1;
    1abe:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    1ac4:	23c0 0002 8518 	move.l d0,28518 <DrawCopper>
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1aca:	2f7c 0000 ff00 	move.l #65280,44(sp)
    1ad0:	002c 
    1ad2:	7002           	moveq #2,d0
    1ad4:	2f40 0028      	move.l d0,40(sp)
    1ad8:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    1ade:	2c40           	movea.l d0,a6
    1ae0:	202f 002c      	move.l 44(sp),d0
    1ae4:	222f 0028      	move.l 40(sp),d1
    1ae8:	4eae ff3a      	jsr -198(a6)
    1aec:	2f40 0024      	move.l d0,36(sp)
    1af0:	202f 0024      	move.l 36(sp),d0
    1af4:	23c0 0002 8504 	move.l d0,28504 <Bitplane2>
  if(Bitplane2 == 0) {
    1afa:	2039 0002 8504 	move.l 28504 <Bitplane2>,d0
    1b00:	6658           	bne.s 1b5a <PrepareDisplayZoom+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1b02:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    1b08:	2c40           	movea.l d0,a6
    1b0a:	4eae ffc4      	jsr -60(a6)
    1b0e:	2f40 0020      	move.l d0,32(sp)
    1b12:	202f 0020      	move.l 32(sp),d0
    1b16:	2f40 001c      	move.l d0,28(sp)
    1b1a:	2f7c 0000 7d50 	move.l #32080,24(sp)
    1b20:	0018 
    1b22:	7026           	moveq #38,d0
    1b24:	2f40 0014      	move.l d0,20(sp)
    1b28:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    1b2e:	2c40           	movea.l d0,a6
    1b30:	222f 001c      	move.l 28(sp),d1
    1b34:	242f 0018      	move.l 24(sp),d2
    1b38:	262f 0014      	move.l 20(sp),d3
    1b3c:	4eae ffd0      	jsr -48(a6)
    1b40:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    1b44:	7001           	moveq #1,d0
    1b46:	2f40 000c      	move.l d0,12(sp)
    1b4a:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    1b50:	2c40           	movea.l d0,a6
    1b52:	222f 000c      	move.l 12(sp),d1
    1b56:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    1b5a:	2039 0002 8504 	move.l 28504 <Bitplane2>,d0
    1b60:	23c0 0002 8514 	move.l d0,28514 <ViewBuffer>
  ViewCopper = Copperlist2; 
    1b66:	2039 0002 850c 	move.l 2850c <Copperlist2>,d0
    1b6c:	23c0 0002 851c 	move.l d0,2851c <ViewCopper>
  return 0;
    1b72:	7000           	moveq #0,d0
}
    1b74:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1b78:	4fef 0048      	lea 72(sp),sp
    1b7c:	4e75           	rts

00001b7e <Init_Blit>:

void Init_Blit() {
  hw->bltafwm = 0xffff;
    1b7e:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1b84:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1b8a:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1b90:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1b96:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1b9c:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1ba2:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1ba8:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1bae:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1bb4:	317c 002c 0066 	move.w #44,102(a0)
}
    1bba:	4e75           	rts

00001bbc <Init_Blit2>:


void Init_Blit2() {
  hw->bltafwm = 0xffff;
    1bbc:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1bc2:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1bc8:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1bce:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = 36;
    1bd4:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1bda:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = 76;
    1be0:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1be6:	317c 004c 0062 	move.w #76,98(a0)
  hw->bltdmod = ZMLINESIZE2 - 4;
    1bec:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1bf2:	317c 0028 0066 	move.w #40,102(a0)
}
    1bf8:	4e75           	rts

00001bfa <Init_ZoomBlit>:

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
    1bfa:	4fef fff4      	lea -12(sp),sp
    1bfe:	206f 0010      	movea.l 16(sp),a0
    1c02:	222f 0014      	move.l 20(sp),d1
    1c06:	202f 0018      	move.l 24(sp),d0
    1c0a:	3048           	movea.w a0,a0
    1c0c:	3f48 0004      	move.w a0,4(sp)
    1c10:	3201           	move.w d1,d1
    1c12:	3f41 0002      	move.w d1,2(sp)
    1c16:	3000           	move.w d0,d0
    1c18:	3e80           	move.w d0,(sp)
  ZoomBlit_Increment4SrcA = 0;
    1c1a:	4279 0002 8554 	clr.w 28554 <ZoomBlit_Increment4SrcA>

  UWORD colnr = nextzoom - startofword - 1;                                                                          
    1c20:	302f 0002      	move.w 2(sp),d0
    1c24:	906f 0004      	sub.w 4(sp),d0
    1c28:	3200           	move.w d0,d1
    1c2a:	5341           	subq.w #1,d1
    1c2c:	3f41 0008      	move.w d1,8(sp)
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
    1c30:	3017           	move.w (sp),d0
    1c32:	720c           	moveq #12,d1
    1c34:	e368           	lsl.w d1,d0
    1c36:	3f40 0006      	move.w d0,6(sp)
  UWORD shifta;
  if( shiftright == 0) {
    1c3a:	4a57           	tst.w (sp)
    1c3c:	6610           	bne.s 1c4e <Init_ZoomBlit+0x54>
    ZoomBlit_Increment4SrcA = 1;
    1c3e:	33fc 0001 0002 	move.w #1,28554 <ZoomBlit_Increment4SrcA>
    1c44:	8554 
    shifta = 15 << 12;
    1c46:	3f7c f000 000a 	move.w #-4096,10(sp)
    1c4c:	600c           	bra.s 1c5a <Init_ZoomBlit+0x60>
  } else {
    shifta = (shiftright - 1) << 12;
    1c4e:	3017           	move.w (sp),d0
    1c50:	5340           	subq.w #1,d0
    1c52:	720c           	moveq #12,d1
    1c54:	e368           	lsl.w d1,d0
    1c56:	3f40 000a      	move.w d0,10(sp)
  }
  WaitBlt(); 
    1c5a:	4eba e458      	jsr b4 <WaitBlt>(pc)
  hw->bltcon1 = shiftb; 
    1c5e:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1c64:	316f 0006 0042 	move.w 6(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1c6a:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1c70:	302f 000a      	move.w 10(sp),d0
    1c74:	0640 0de4      	addi.w #3556,d0
    1c78:	3140 0040      	move.w d0,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1c7c:	7000           	moveq #0,d0
    1c7e:	302f 0008      	move.w 8(sp),d0
    1c82:	7210           	moveq #16,d1
    1c84:	9280           	sub.l d0,d1
    1c86:	7000           	moveq #0,d0
    1c88:	4640           	not.w d0
    1c8a:	e3a8           	lsl.l d1,d0
    1c8c:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1c92:	2000           	move.l d0,d0
    1c94:	3140 0070      	move.w d0,112(a0)
}
    1c98:	4fef 000c      	lea 12(sp),sp
    1c9c:	4e75           	rts

00001c9e <Init_Copy>:

void Init_Copy( WORD shift) {
    1c9e:	598f           	subq.l #4,sp
    1ca0:	202f 0008      	move.l 8(sp),d0
    1ca4:	3000           	move.w d0,d0
    1ca6:	3e80           	move.w d0,(sp)
  UWORD shiftright = shift << 12;
    1ca8:	3017           	move.w (sp),d0
    1caa:	720c           	moveq #12,d1
    1cac:	e368           	lsl.w d1,d0
    1cae:	3f40 0002      	move.w d0,2(sp)
  WaitBlt();
    1cb2:	4eba e400      	jsr b4 <WaitBlt>(pc)
  hw->bltcon0 = 0x9f0 + shiftright;
    1cb6:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1cbc:	302f 0002      	move.w 2(sp),d0
    1cc0:	0640 09f0      	addi.w #2544,d0
    1cc4:	3140 0040      	move.w d0,64(a0)
  hw->bltcon1 = 0;
    1cc8:	2079 0002 8520 	movea.l 28520 <hw>,a0
    1cce:	317c 0000 0042 	move.w #0,66(a0)
}
    1cd4:	588f           	addq.l #4,sp
    1cd6:	4e75           	rts

00001cd8 <Zoom_ZoomIntoPicture>:

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    1cd8:	4fef ffcc      	lea -52(sp),sp
    1cdc:	222f 0040      	move.l 64(sp),d1
    1ce0:	202f 0044      	move.l 68(sp),d0
    1ce4:	3201           	move.w d1,d1
    1ce6:	3f41 0002      	move.w d1,2(sp)
    1cea:	3000           	move.w d0,d0
    1cec:	3e80           	move.w d0,(sp)
  
  WaitBlt();  
    1cee:	4eba e3c4      	jsr b4 <WaitBlt>(pc)
  Init_Blit();
    1cf2:	4eba fe8a      	jsr 1b7e <Init_Blit>(pc)
  WORD shiftright = 9;
    1cf6:	3f7c 0009 0032 	move.w #9,50(sp)
  UWORD shifthoriz = 7;
    1cfc:	3f7c 0007 0030 	move.w #7,48(sp)
  UWORD startofword = 21*16;
    1d02:	3f7c 0150 002e 	move.w #336,46(sp)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1d08:	322f 0002      	move.w 2(sp),d1
    1d0c:	3001           	move.w d1,d0
    1d0e:	d040           	add.w d0,d0
    1d10:	d040           	add.w d0,d0
    1d12:	d041           	add.w d1,d0
    1d14:	d040           	add.w d0,d0
    1d16:	0640 014c      	addi.w #332,d0
    1d1a:	3f40 002c      	move.w d0,44(sp)
    1d1e:	601a           	bra.s 1d3a <Zoom_ZoomIntoPicture+0x62>
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    1d20:	302f 002c      	move.w 44(sp),d0
    1d24:	906f 0002      	sub.w 2(sp),d0
    1d28:	0640 ffed      	addi.w #-19,d0
    1d2c:	3f40 002c      	move.w d0,44(sp)
    shiftright--;
    1d30:	302f 0032      	move.w 50(sp),d0
    1d34:	5340           	subq.w #1,d0
    1d36:	3f40 0032      	move.w d0,50(sp)
  while( nextzoom > 22 * 16) {
    1d3a:	0c6f 0160 002c 	cmpi.w #352,44(sp)
    1d40:	6ede           	bgt.s 1d20 <Zoom_ZoomIntoPicture+0x48>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
    1d42:	426f 002a      	clr.w 42(sp)
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    1d46:	322f 0002      	move.w 2(sp),d1
    1d4a:	3001           	move.w d1,d0
    1d4c:	d040           	add.w d0,d0
    1d4e:	d040           	add.w d0,d0
    1d50:	d041           	add.w d1,d0
    1d52:	4440           	neg.w d0
    1d54:	0640 0012      	addi.w #18,d0
    1d58:	3f40 0028      	move.w d0,40(sp)
    1d5c:	601c           	bra.s 1d7a <Zoom_ZoomIntoPicture+0xa2>
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    1d5e:	302f 0028      	move.w 40(sp),d0
    1d62:	d06f 0002      	add.w 2(sp),d0
    1d66:	0640 0013      	addi.w #19,d0
    1d6a:	3f40 0028      	move.w d0,40(sp)
      shifthoriz--;
    1d6e:	302f 0030      	move.w 48(sp),d0
    1d72:	3200           	move.w d0,d1
    1d74:	5341           	subq.w #1,d1
    1d76:	3f41 0030      	move.w d1,48(sp)
  while( ZoomHorizontalStart < 0) {
    1d7a:	4a6f 0028      	tst.w 40(sp)
    1d7e:	6dde           	blt.s 1d5e <Zoom_ZoomIntoPicture+0x86>
  } 

  for(int i=0;i<22;i++) {
    1d80:	42af 0024      	clr.l 36(sp)
    1d84:	6000 02cc      	bra.w 2052 <Zoom_ZoomIntoPicture+0x37a>

    ZoomHorizontal = ZoomHorizontalStart;
    1d88:	33ef 0028 0002 	move.w 40(sp),28570 <ZoomHorizontal>
    1d8e:	8570 

    WORD linesleft = 272;
    1d90:	3f7c 0110 0022 	move.w #272,34(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1d96:	7000           	moveq #0,d0
    1d98:	302f 0030      	move.w 48(sp),d0
    1d9c:	7200           	moveq #0,d1
    1d9e:	3217           	move.w (sp),d1
    1da0:	2f01           	move.l d1,-(sp)
    1da2:	2f00           	move.l d0,-(sp)
    1da4:	4eb9 0000 74ec 	jsr 74ec <__mulsi3>
    1daa:	508f           	addq.l #8,sp
    1dac:	2200           	move.l d0,d1
    1dae:	2001           	move.l d1,d0
    1db0:	d080           	add.l d0,d0
    1db2:	d081           	add.l d1,d0
    1db4:	e788           	lsl.l #3,d0
    1db6:	2200           	move.l d0,d1
    1db8:	202f 0024      	move.l 36(sp),d0
    1dbc:	9280           	sub.l d0,d1
    1dbe:	2001           	move.l d1,d0
    1dc0:	0680 8000 0016 	addi.l #-2147483626,d0
    1dc6:	d080           	add.l d0,d0
    1dc8:	222f 0038      	move.l 56(sp),d1
    1dcc:	d280           	add.l d0,d1
    1dce:	2f41 001e      	move.l d1,30(sp)
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1dd2:	202f 0024      	move.l 36(sp),d0
    1dd6:	7216           	moveq #22,d1
    1dd8:	9280           	sub.l d0,d1
    1dda:	2001           	move.l d1,d0
    1ddc:	d081           	add.l d1,d0
    1dde:	222f 003c      	move.l 60(sp),d1
    1de2:	d280           	add.l d0,d1
    1de4:	2f41 001a      	move.l d1,26(sp)
    
    UWORD onestep = ZMLINESIZE/2*planes;
    1de8:	3217           	move.w (sp),d1
    1dea:	3001           	move.w d1,d0
    1dec:	d040           	add.w d0,d0
    1dee:	d041           	add.w d1,d0
    1df0:	e748           	lsl.w #3,d0
    1df2:	3f40 0018      	move.w d0,24(sp)
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1df6:	7000           	moveq #0,d0
    1df8:	302f 002e      	move.w 46(sp),d0
    1dfc:	306f 002c      	movea.w 44(sp),a0
    1e00:	b1c0           	cmpa.l d0,a0
    1e02:	6e00 0106      	bgt.w 1f0a <Zoom_ZoomIntoPicture+0x232>
      Init_Copy( shiftright);
    1e06:	306f 0032      	movea.w 50(sp),a0
    1e0a:	2f08           	move.l a0,-(sp)
    1e0c:	4eba fe90      	jsr 1c9e <Init_Copy>(pc)
    1e10:	588f           	addq.l #4,sp
    1e12:	6000 00ea      	bra.w 1efe <Zoom_ZoomIntoPicture+0x226>
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1e16:	3039 0002 8570 	move.w 28570 <ZoomHorizontal>,d0
    1e1c:	b06f 0022      	cmp.w 34(sp),d0
    1e20:	6c12           	bge.s 1e34 <Zoom_ZoomIntoPicture+0x15c>
          linesleft -= ZoomHorizontal;
    1e22:	322f 0022      	move.w 34(sp),d1
    1e26:	3039 0002 8570 	move.w 28570 <ZoomHorizontal>,d0
    1e2c:	9240           	sub.w d0,d1
    1e2e:	3f41 0022      	move.w d1,34(sp)
    1e32:	600c           	bra.s 1e40 <Zoom_ZoomIntoPicture+0x168>
        } else {
          ZoomHorizontal = linesleft;
    1e34:	33ef 0022 0002 	move.w 34(sp),28570 <ZoomHorizontal>
    1e3a:	8570 
          linesleft = 0;
    1e3c:	426f 0022      	clr.w 34(sp)
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
    1e40:	3039 0002 8570 	move.w 28570 <ZoomHorizontal>,d0
    1e46:	322f 0018      	move.w 24(sp),d1
    1e4a:	c3c0           	muls.w d0,d1
    1e4c:	3f41 000c      	move.w d1,12(sp)
        //Add aditional line
        if( linesleft>0) {
    1e50:	4a6f 0022      	tst.w 34(sp)
    1e54:	6f4c           	ble.s 1ea2 <Zoom_ZoomIntoPicture+0x1ca>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1e56:	7200           	moveq #0,d1
    1e58:	322f 000c      	move.w 12(sp),d1
    1e5c:	7000           	moveq #0,d0
    1e5e:	302f 002a      	move.w 42(sp),d0
    1e62:	d081           	add.l d1,d0
    1e64:	d080           	add.l d0,d0
    1e66:	222f 001e      	move.l 30(sp),d1
    1e6a:	d280           	add.l d0,d1
    1e6c:	2f41 0008      	move.l d1,8(sp)
          UWORD *tmpdest = pos4dest +  size4blit;
    1e70:	7000           	moveq #0,d0
    1e72:	302f 000c      	move.w 12(sp),d0
    1e76:	d080           	add.l d0,d0
    1e78:	222f 001a      	move.l 26(sp),d1
    1e7c:	d280           	add.l d0,d1
    1e7e:	2f41 0004      	move.l d1,4(sp)
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
    1e82:	7000           	moveq #0,d0
    1e84:	3017           	move.w (sp),d0
    1e86:	2f00           	move.l d0,-(sp)
    1e88:	2f2f 0008      	move.l 8(sp),-(sp)
    1e8c:	2f2f 0010      	move.l 16(sp),-(sp)
    1e90:	4eba f300      	jsr 1192 <Zoom_CopyWord>(pc)
    1e94:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1e98:	302f 0022      	move.w 34(sp),d0
    1e9c:	5340           	subq.w #1,d0
    1e9e:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1ea2:	3039 0002 8570 	move.w 28570 <ZoomHorizontal>,d0
    1ea8:	c1d7           	muls.w (sp),d0
    1eaa:	7200           	moveq #0,d1
    1eac:	3200           	move.w d0,d1
    1eae:	7000           	moveq #0,d0
    1eb0:	302f 002a      	move.w 42(sp),d0
    1eb4:	d080           	add.l d0,d0
    1eb6:	d0af 001e      	add.l 30(sp),d0
    1eba:	2f01           	move.l d1,-(sp)
    1ebc:	2f2f 001e      	move.l 30(sp),-(sp)
    1ec0:	2f00           	move.l d0,-(sp)
    1ec2:	4eba f2ce      	jsr 1192 <Zoom_CopyWord>(pc)
    1ec6:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1eca:	7000           	moveq #0,d0
    1ecc:	302f 000c      	move.w 12(sp),d0
    1ed0:	d080           	add.l d0,d0
    1ed2:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep; 
    1ed6:	7200           	moveq #0,d1
    1ed8:	322f 000c      	move.w 12(sp),d1
    1edc:	7000           	moveq #0,d0
    1ede:	302f 0018      	move.w 24(sp),d0
    1ee2:	d081           	add.l d1,d0
    1ee4:	d080           	add.l d0,d0
    1ee6:	d1af 001a      	add.l d0,26(sp)
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1eea:	302f 0002      	move.w 2(sp),d0
    1eee:	d040           	add.w d0,d0
    1ef0:	906f 0002      	sub.w 2(sp),d0
    1ef4:	0640 0012      	addi.w #18,d0
    1ef8:	33c0 0002 8570 	move.w d0,28570 <ZoomHorizontal>
      while(linesleft > 0) {
    1efe:	4a6f 0022      	tst.w 34(sp)
    1f02:	6e00 ff12      	bgt.w 1e16 <Zoom_ZoomIntoPicture+0x13e>
    1f06:	6000 0140      	bra.w 2048 <Zoom_ZoomIntoPicture+0x370>
      }
    } else {  
      Init_ZoomBlit( startofword, nextzoom, shiftright);   
    1f0a:	326f 0032      	movea.w 50(sp),a1
    1f0e:	306f 002c      	movea.w 44(sp),a0
    1f12:	7000           	moveq #0,d0
    1f14:	302f 002e      	move.w 46(sp),d0
    1f18:	2f09           	move.l a1,-(sp)
    1f1a:	2f08           	move.l a0,-(sp)
    1f1c:	2f00           	move.l d0,-(sp)
    1f1e:	4eba fcda      	jsr 1bfa <Init_ZoomBlit>(pc)
    1f22:	4fef 000c      	lea 12(sp),sp
      nextzoom -= (19 + zoomnr);
    1f26:	302f 002c      	move.w 44(sp),d0
    1f2a:	906f 0002      	sub.w 2(sp),d0
    1f2e:	0640 ffed      	addi.w #-19,d0
    1f32:	3f40 002c      	move.w d0,44(sp)
    1f36:	6000 00ea      	bra.w 2022 <Zoom_ZoomIntoPicture+0x34a>
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1f3a:	3039 0002 8570 	move.w 28570 <ZoomHorizontal>,d0
    1f40:	b06f 0022      	cmp.w 34(sp),d0
    1f44:	6c12           	bge.s 1f58 <Zoom_ZoomIntoPicture+0x280>
          linesleft -= ZoomHorizontal;
    1f46:	322f 0022      	move.w 34(sp),d1
    1f4a:	3039 0002 8570 	move.w 28570 <ZoomHorizontal>,d0
    1f50:	9240           	sub.w d0,d1
    1f52:	3f41 0022      	move.w d1,34(sp)
    1f56:	600c           	bra.s 1f64 <Zoom_ZoomIntoPicture+0x28c>
        } else {
          ZoomHorizontal = linesleft;
    1f58:	33ef 0022 0002 	move.w 34(sp),28570 <ZoomHorizontal>
    1f5e:	8570 
          linesleft = 0;
    1f60:	426f 0022      	clr.w 34(sp)
        }
        UWORD size4blit = ZoomHorizontal*onestep;
    1f64:	3039 0002 8570 	move.w 28570 <ZoomHorizontal>,d0
    1f6a:	322f 0018      	move.w 24(sp),d1
    1f6e:	c3c0           	muls.w d0,d1
    1f70:	3f41 0016      	move.w d1,22(sp)
        //Add aditional line
        if( linesleft>0) {
    1f74:	4a6f 0022      	tst.w 34(sp)
    1f78:	6f4c           	ble.s 1fc6 <Zoom_ZoomIntoPicture+0x2ee>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1f7a:	7200           	moveq #0,d1
    1f7c:	322f 0016      	move.w 22(sp),d1
    1f80:	7000           	moveq #0,d0
    1f82:	302f 002a      	move.w 42(sp),d0
    1f86:	d081           	add.l d1,d0
    1f88:	d080           	add.l d0,d0
    1f8a:	222f 001e      	move.l 30(sp),d1
    1f8e:	d280           	add.l d0,d1
    1f90:	2f41 0012      	move.l d1,18(sp)
          UWORD *tmpdest = pos4dest + size4blit;
    1f94:	7000           	moveq #0,d0
    1f96:	302f 0016      	move.w 22(sp),d0
    1f9a:	d080           	add.l d0,d0
    1f9c:	222f 001a      	move.l 26(sp),d1
    1fa0:	d280           	add.l d0,d1
    1fa2:	2f41 000e      	move.l d1,14(sp)
          
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
    1fa6:	7000           	moveq #0,d0
    1fa8:	3017           	move.w (sp),d0
    1faa:	2f00           	move.l d0,-(sp)
    1fac:	2f2f 0012      	move.l 18(sp),-(sp)
    1fb0:	2f2f 001a      	move.l 26(sp),-(sp)
    1fb4:	4eba f21a      	jsr 11d0 <Zoom_ZoomBlit>(pc)
    1fb8:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1fbc:	302f 0022      	move.w 34(sp),d0
    1fc0:	5340           	subq.w #1,d0
    1fc2:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1fc6:	3039 0002 8570 	move.w 28570 <ZoomHorizontal>,d0
    1fcc:	c1d7           	muls.w (sp),d0
    1fce:	7200           	moveq #0,d1
    1fd0:	3200           	move.w d0,d1
    1fd2:	7000           	moveq #0,d0
    1fd4:	302f 002a      	move.w 42(sp),d0
    1fd8:	d080           	add.l d0,d0
    1fda:	d0af 001e      	add.l 30(sp),d0
    1fde:	2f01           	move.l d1,-(sp)
    1fe0:	2f2f 001e      	move.l 30(sp),-(sp)
    1fe4:	2f00           	move.l d0,-(sp)
    1fe6:	4eba f1e8      	jsr 11d0 <Zoom_ZoomBlit>(pc)
    1fea:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1fee:	7000           	moveq #0,d0
    1ff0:	302f 0016      	move.w 22(sp),d0
    1ff4:	d080           	add.l d0,d0
    1ff6:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep;   
    1ffa:	7200           	moveq #0,d1
    1ffc:	322f 0016      	move.w 22(sp),d1
    2000:	7000           	moveq #0,d0
    2002:	302f 0018      	move.w 24(sp),d0
    2006:	d081           	add.l d1,d0
    2008:	d080           	add.l d0,d0
    200a:	d1af 001a      	add.l d0,26(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    200e:	302f 0002      	move.w 2(sp),d0
    2012:	d040           	add.w d0,d0
    2014:	906f 0002      	sub.w 2(sp),d0
    2018:	0640 0012      	addi.w #18,d0
    201c:	33c0 0002 8570 	move.w d0,28570 <ZoomHorizontal>
      while( linesleft > 0) {
    2022:	4a6f 0022      	tst.w 34(sp)
    2026:	6e00 ff12      	bgt.w 1f3a <Zoom_ZoomIntoPicture+0x262>
      }
      shiftright--;  
    202a:	302f 0032      	move.w 50(sp),d0
    202e:	5340           	subq.w #1,d0
    2030:	3f40 0032      	move.w d0,50(sp)
      if(shiftright < 0) {
    2034:	6a12           	bpl.s 2048 <Zoom_ZoomIntoPicture+0x370>
        shiftright += 16;
    2036:	302f 0032      	move.w 50(sp),d0
    203a:	0640 0010      	addi.w #16,d0
    203e:	3f40 0032      	move.w d0,50(sp)
        shifttoleft = 1;
    2042:	3f7c 0001 002a 	move.w #1,42(sp)
      }
    }
    startofword -= 16;
    2048:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    204e:	52af 0024      	addq.l #1,36(sp)
    2052:	7015           	moveq #21,d0
    2054:	b0af 0024      	cmp.l 36(sp),d0
    2058:	6c00 fd2e      	bge.w 1d88 <Zoom_ZoomIntoPicture+0xb0>
  }
}
    205c:	4fef 0034      	lea 52(sp),sp
    2060:	4e75           	rts

00002062 <Zoom_SetBplPointers>:

void Zoom_SetBplPointers( ULONG *buffer, ULONG *copper) {
    2062:	4fef fff0      	lea -16(sp),sp
  ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
    2066:	3039 0002 856c 	move.w 2856c <Zoom_LevelOf102Zoom>,d0
    206c:	e248           	lsr.w #1,d0
    206e:	3000           	move.w d0,d0
    2070:	0280 0000 ffff 	andi.l #65535,d0
    2076:	7208           	moveq #8,d1
    2078:	9280           	sub.l d0,d1
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;
    207a:	2001           	move.l d1,d0
    207c:	e988           	lsl.l #4,d0
    207e:	9081           	sub.l d1,d0
    2080:	d080           	add.l d0,d0
    2082:	d080           	add.l d0,d0
  ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
    2084:	5280           	addq.l #1,d0
    2086:	d080           	add.l d0,d0
    2088:	d080           	add.l d0,d0
    208a:	d0af 0014      	add.l 20(sp),d0
    208e:	2f40 000c      	move.l d0,12(sp)
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
    2092:	7072           	moveq #114,d0
    2094:	d0af 0018      	add.l 24(sp),d0
    2098:	2f40 0008      	move.l d0,8(sp)
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    209c:	42af 0004      	clr.l 4(sp)
    20a0:	6030           	bra.s 20d2 <Zoom_SetBplPointers+0x70>
    UWORD highword = (ULONG)plane2set >> 16;
    20a2:	202f 000c      	move.l 12(sp),d0
    20a6:	4240           	clr.w d0
    20a8:	4840           	swap d0
    20aa:	3f40 0002      	move.w d0,2(sp)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    20ae:	3eaf 000e      	move.w 14(sp),(sp)
    *posofcopper = highword;
    20b2:	206f 0008      	movea.l 8(sp),a0
    20b6:	30af 0002      	move.w 2(sp),(a0)
    posofcopper += 2;
    20ba:	58af 0008      	addq.l #4,8(sp)
    *posofcopper = lowword;
    20be:	206f 0008      	movea.l 8(sp),a0
    20c2:	3097           	move.w (sp),(a0)
    posofcopper += 2;
    20c4:	58af 0008      	addq.l #4,8(sp)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    20c8:	7030           	moveq #48,d0
    20ca:	d1af 000c      	add.l d0,12(sp)
  for(int i=0;i<ZMBPLDEPTH;i++) {
    20ce:	52af 0004      	addq.l #1,4(sp)
    20d2:	7004           	moveq #4,d0
    20d4:	b0af 0004      	cmp.l 4(sp),d0
    20d8:	6cc8           	bge.s 20a2 <Zoom_SetBplPointers+0x40>
  }
  
}
    20da:	4fef 0010      	lea 16(sp),sp
    20de:	4e75           	rts

000020e0 <Zoom_SwapBuffers>:

void Zoom_SwapBuffers() {
    20e0:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawBuffer;
    20e2:	2039 0002 8510 	move.l 28510 <DrawBuffer>,d0
    20e8:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
    20ea:	2039 0002 8514 	move.l 28514 <ViewBuffer>,d0
    20f0:	23c0 0002 8510 	move.l d0,28510 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
    20f6:	2017           	move.l (sp),d0
    20f8:	23c0 0002 8514 	move.l d0,28514 <ViewBuffer>
}
    20fe:	588f           	addq.l #4,sp
    2100:	4e75           	rts

00002102 <Zoom_ZoomIntoPicture2>:

void Zoom_ZoomIntoPicture2( UWORD *source1, UWORD *source2, UWORD *target, 
  UWORD levelofzoom, UWORD nrofplanes) {
    2102:	4fef ffcc      	lea -52(sp),sp
    2106:	2f02           	move.l d2,-(sp)
    2108:	222f 0048      	move.l 72(sp),d1
    210c:	202f 004c      	move.l 76(sp),d0
    2110:	3201           	move.w d1,d1
    2112:	3f41 0008      	move.w d1,8(sp)
    2116:	3000           	move.w d0,d0
    2118:	3f40 0006      	move.w d0,6(sp)

  
  UWORD posx4a = 320-7*(levelofzoom-1);
    211c:	302f 0008      	move.w 8(sp),d0
    2120:	3200           	move.w d0,d1
    2122:	e748           	lsl.w #3,d0
    2124:	9240           	sub.w d0,d1
    2126:	3001           	move.w d1,d0
    2128:	0640 0147      	addi.w #327,d0
    212c:	3f40 0036      	move.w d0,54(sp)
  UWORD posx4b = 640-14*( levelofzoom-1);
    2130:	322f 0008      	move.w 8(sp),d1
    2134:	3001           	move.w d1,d0
    2136:	e749           	lsl.w #3,d1
    2138:	9041           	sub.w d1,d0
    213a:	d040           	add.w d0,d0
    213c:	3200           	move.w d0,d1
    213e:	0641 028e      	addi.w #654,d1
    2142:	3f41 0034      	move.w d1,52(sp)
  UWORD ystart = 8*levelofzoom;
    2146:	302f 0008      	move.w 8(sp),d0
    214a:	e748           	lsl.w #3,d0
    214c:	3f40 001c      	move.w d0,28(sp)
  target = target + 21;
    2150:	742a           	moveq #42,d2
    2152:	d5af 0044      	add.l d2,68(sp)
  ULONG pos4astart = ( ULONG)source1 + ystart * 40;
    2156:	7200           	moveq #0,d1
    2158:	322f 001c      	move.w 28(sp),d1
    215c:	2001           	move.l d1,d0
    215e:	d080           	add.l d0,d0
    2160:	d080           	add.l d0,d0
    2162:	d081           	add.l d1,d0
    2164:	e788           	lsl.l #3,d0
    2166:	2200           	move.l d0,d1
    2168:	202f 003c      	move.l 60(sp),d0
    216c:	2401           	move.l d1,d2
    216e:	d480           	add.l d0,d2
    2170:	2f42 0018      	move.l d2,24(sp)
  ULONG pos4bstart = ( ULONG)source2 + ystart * 80;
    2174:	7200           	moveq #0,d1
    2176:	322f 001c      	move.w 28(sp),d1
    217a:	2001           	move.l d1,d0
    217c:	d080           	add.l d0,d0
    217e:	d080           	add.l d0,d0
    2180:	d081           	add.l d1,d0
    2182:	e988           	lsl.l #4,d0
    2184:	2200           	move.l d0,d1
    2186:	202f 0040      	move.l 64(sp),d0
    218a:	2401           	move.l d1,d2
    218c:	d480           	add.l d0,d2
    218e:	2f42 0014      	move.l d2,20(sp)
  UWORD *zl4word = Zoom_Zl4Words + 21 * (levelofzoom) - 1;
    2192:	2079 0002 8548 	movea.l 28548 <Zoom_Zl4Words>,a0
    2198:	7200           	moveq #0,d1
    219a:	322f 0008      	move.w 8(sp),d1
    219e:	2001           	move.l d1,d0
    21a0:	d080           	add.l d0,d0
    21a2:	d081           	add.l d1,d0
    21a4:	2200           	move.l d0,d1
    21a6:	e789           	lsl.l #3,d1
    21a8:	9280           	sub.l d0,d1
    21aa:	2001           	move.l d1,d0
    21ac:	d081           	add.l d1,d0
    21ae:	2200           	move.l d0,d1
    21b0:	2001           	move.l d1,d0
    21b2:	5580           	subq.l #2,d0
    21b4:	d1c0           	adda.l d0,a0
    21b6:	2f48 0030      	move.l a0,48(sp)
  WaitBlt();
    21ba:	4eba def8      	jsr b4 <WaitBlt>(pc)
  hw->bltafwm = 0xffff;
    21be:	2079 0002 8520 	movea.l 28520 <hw>,a0
    21c4:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    21ca:	2079 0002 8520 	movea.l 28520 <hw>,a0
    21d0:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltdmod = ZMLINESIZE2 - 2;
    21d6:	2079 0002 8520 	movea.l 28520 <hw>,a0
    21dc:	317c 002a 0066 	move.w #42,102(a0)
  for(int i=1;i<=21;i++) {
    21e2:	7001           	moveq #1,d0
    21e4:	2f40 002c      	move.l d0,44(sp)
    21e8:	6000 01f6      	bra.w 23e0 <Zoom_ZoomIntoPicture2+0x2de>
    UWORD *targetpos = target - i;
    21ec:	202f 002c      	move.l 44(sp),d0
    21f0:	d080           	add.l d0,d0
    21f2:	4480           	neg.l d0
    21f4:	222f 0044      	move.l 68(sp),d1
    21f8:	d280           	add.l d0,d1
    21fa:	2f41 0028      	move.l d1,40(sp)
    UWORD nrofpixels = 16 - *zl4word;
    21fe:	206f 0030      	movea.l 48(sp),a0
    2202:	3010           	move.w (a0),d0
    2204:	7410           	moveq #16,d2
    2206:	9440           	sub.w d0,d2
    2208:	3f42 0012      	move.w d2,18(sp)
    posx4a -= nrofpixels;
    220c:	302f 0012      	move.w 18(sp),d0
    2210:	916f 0036      	sub.w d0,54(sp)
    posx4b -= nrofpixels*2;
    2214:	302f 0012      	move.w 18(sp),d0
    2218:	d040           	add.w d0,d0
    221a:	916f 0034      	sub.w d0,52(sp)
    ULONG pos4a = pos4astart + ( ( posx4a - 1) >> 4) * 2;
    221e:	7000           	moveq #0,d0
    2220:	302f 0036      	move.w 54(sp),d0
    2224:	5380           	subq.l #1,d0
    2226:	e880           	asr.l #4,d0
    2228:	d080           	add.l d0,d0
    222a:	222f 0018      	move.l 24(sp),d1
    222e:	d280           	add.l d0,d1
    2230:	2f41 0024      	move.l d1,36(sp)
    ULONG pos4b = pos4bstart + ( ( posx4b - 1) >> 4) * 2;
    2234:	7000           	moveq #0,d0
    2236:	302f 0034      	move.w 52(sp),d0
    223a:	5380           	subq.l #1,d0
    223c:	e880           	asr.l #4,d0
    223e:	d080           	add.l d0,d0
    2240:	242f 0014      	move.l 20(sp),d2
    2244:	d480           	add.l d0,d2
    2246:	2f42 0020      	move.l d2,32(sp)
    //shift channel a = R of (17 + zl - pos)/16
    UWORD shifta = ( ( 16 + *zl4word - ( posx4a & 0xf)) & 0xf) << 12;
    224a:	206f 0030      	movea.l 48(sp),a0
    224e:	3010           	move.w (a0),d0
    2250:	906f 0036      	sub.w 54(sp),d0
    2254:	3000           	move.w d0,d0
    2256:	0280 0000 ffff 	andi.l #65535,d0
    225c:	720c           	moveq #12,d1
    225e:	e3a8           	lsl.l d1,d0
    2260:	3f40 0010      	move.w d0,16(sp)
    //shift channel b = R of (17 - pos)/16 
    UWORD shiftb = ( (16  - ( posx4b & 0xf)) & 0xf) << 12;
    2264:	7000           	moveq #0,d0
    2266:	302f 0034      	move.w 52(sp),d0
    226a:	4480           	neg.l d0
    226c:	740c           	moveq #12,d2
    226e:	e5a8           	lsl.l d2,d0
    2270:	3f40 000e      	move.w d0,14(sp)
    UWORD bltcon0 = 0xde4 + shifta;
    2274:	306f 0010      	movea.w 16(sp),a0
    2278:	41e8 0de4      	lea 3556(a0),a0
    227c:	3f48 000c      	move.w a0,12(sp)
    UWORD linesleft = 271;
    2280:	3f7c 010f 001e 	move.w #271,30(sp)
    UWORD lines2write;
    WaitBlt();
    2286:	4eba de2c      	jsr b4 <WaitBlt>(pc)
    hw->bltcon1 = shiftb; 
    228a:	2079 0002 8520 	movea.l 28520 <hw>,a0
    2290:	316f 000e 0042 	move.w 14(sp),66(a0)
    hw->bltcon0 = bltcon0;
    2296:	2079 0002 8520 	movea.l 28520 <hw>,a0
    229c:	316f 000c 0040 	move.w 12(sp),64(a0)
    hw->bltcdat = 0xffff >> (*zl4word--*2);
    22a2:	202f 0030      	move.l 48(sp),d0
    22a6:	2200           	move.l d0,d1
    22a8:	5581           	subq.l #2,d1
    22aa:	2f41 0030      	move.l d1,48(sp)
    22ae:	2040           	movea.l d0,a0
    22b0:	3010           	move.w (a0),d0
    22b2:	3000           	move.w d0,d0
    22b4:	0280 0000 ffff 	andi.l #65535,d0
    22ba:	d080           	add.l d0,d0
    22bc:	2200           	move.l d0,d1
    22be:	7000           	moveq #0,d0
    22c0:	4640           	not.w d0
    22c2:	e2a0           	asr.l d1,d0
    22c4:	2079 0002 8520 	movea.l 28520 <hw>,a0
    22ca:	2000           	move.l d0,d0
    22cc:	3140 0070      	move.w d0,112(a0)
    22d0:	6000 0102      	bra.w 23d4 <Zoom_ZoomIntoPicture2+0x2d2>
    while (linesleft > 0) {
      lines2write = 2*levelofzoom;
    22d4:	302f 0008      	move.w 8(sp),d0
    22d8:	d040           	add.w d0,d0
    22da:	3f40 000a      	move.w d0,10(sp)
      lines2write = linesleft > lines2write ? lines2write : linesleft;
    22de:	322f 000a      	move.w 10(sp),d1
    22e2:	302f 001e      	move.w 30(sp),d0
    22e6:	b240           	cmp.w d0,d1
    22e8:	6402           	bcc.s 22ec <Zoom_ZoomIntoPicture2+0x1ea>
    22ea:	3001           	move.w d1,d0
    22ec:	3f40 000a      	move.w d0,10(sp)
      Zoom_ZoomBlit2( pos4a, pos4b, targetpos, lines2write, 36, 76);
    22f0:	7000           	moveq #0,d0
    22f2:	302f 000a      	move.w 10(sp),d0
    22f6:	206f 0020      	movea.l 32(sp),a0
    22fa:	222f 0024      	move.l 36(sp),d1
    22fe:	4878 004c      	pea 4c <_start+0x4c>
    2302:	4878 0024      	pea 24 <_start+0x24>
    2306:	2f00           	move.l d0,-(sp)
    2308:	2f2f 0034      	move.l 52(sp),-(sp)
    230c:	2f08           	move.l a0,-(sp)
    230e:	2f01           	move.l d1,-(sp)
    2310:	4eba ef22      	jsr 1234 <Zoom_ZoomBlit2>(pc)
    2314:	4fef 0018      	lea 24(sp),sp
      pos4a += 40 * lines2write;
    2318:	7200           	moveq #0,d1
    231a:	322f 000a      	move.w 10(sp),d1
    231e:	2001           	move.l d1,d0
    2320:	d080           	add.l d0,d0
    2322:	d080           	add.l d0,d0
    2324:	d081           	add.l d1,d0
    2326:	e788           	lsl.l #3,d0
    2328:	d1af 0024      	add.l d0,36(sp)
      pos4b += 80 * lines2write;
    232c:	7200           	moveq #0,d1
    232e:	322f 000a      	move.w 10(sp),d1
    2332:	2001           	move.l d1,d0
    2334:	d080           	add.l d0,d0
    2336:	d080           	add.l d0,d0
    2338:	d081           	add.l d1,d0
    233a:	e988           	lsl.l #4,d0
    233c:	d1af 0020      	add.l d0,32(sp)
      targetpos += lines2write * ZMLINESIZE2/2;
    2340:	7200           	moveq #0,d1
    2342:	322f 000a      	move.w 10(sp),d1
    2346:	2001           	move.l d1,d0
    2348:	d080           	add.l d0,d0
    234a:	d081           	add.l d1,d0
    234c:	d080           	add.l d0,d0
    234e:	d080           	add.l d0,d0
    2350:	9081           	sub.l d1,d0
    2352:	d080           	add.l d0,d0
    2354:	d080           	add.l d0,d0
    2356:	d1af 0028      	add.l d0,40(sp)
      linesleft -= lines2write;
    235a:	302f 000a      	move.w 10(sp),d0
    235e:	916f 001e      	sub.w d0,30(sp)
      if( linesleft == 0) break;
    2362:	6778           	beq.s 23dc <Zoom_ZoomIntoPicture2+0x2da>
      lines2write = 16 - levelofzoom * 2;
    2364:	7000           	moveq #0,d0
    2366:	302f 0008      	move.w 8(sp),d0
    236a:	7208           	moveq #8,d1
    236c:	9280           	sub.l d0,d1
    236e:	2001           	move.l d1,d0
    2370:	d040           	add.w d0,d0
    2372:	3f40 000a      	move.w d0,10(sp)
      lines2write = linesleft > lines2write ? lines2write : linesleft;
    2376:	322f 000a      	move.w 10(sp),d1
    237a:	302f 001e      	move.w 30(sp),d0
    237e:	b240           	cmp.w d0,d1
    2380:	6402           	bcc.s 2384 <Zoom_ZoomIntoPicture2+0x282>
    2382:	3001           	move.w d1,d0
    2384:	3f40 000a      	move.w d0,10(sp)
      if( lines2write > 0) {
    2388:	674a           	beq.s 23d4 <Zoom_ZoomIntoPicture2+0x2d2>
        Zoom_ZoomBlit2( pos4a, pos4b, targetpos, lines2write, 76, 156);
    238a:	7000           	moveq #0,d0
    238c:	302f 000a      	move.w 10(sp),d0
    2390:	206f 0020      	movea.l 32(sp),a0
    2394:	222f 0024      	move.l 36(sp),d1
    2398:	4878 009c      	pea 9c <_start+0x9c>
    239c:	4878 004c      	pea 4c <_start+0x4c>
    23a0:	2f00           	move.l d0,-(sp)
    23a2:	2f2f 0034      	move.l 52(sp),-(sp)
    23a6:	2f08           	move.l a0,-(sp)
    23a8:	2f01           	move.l d1,-(sp)
    23aa:	4eba ee88      	jsr 1234 <Zoom_ZoomBlit2>(pc)
    23ae:	4fef 0018      	lea 24(sp),sp
        targetpos += lines2write * ZMLINESIZE2/2;
    23b2:	7200           	moveq #0,d1
    23b4:	322f 000a      	move.w 10(sp),d1
    23b8:	2001           	move.l d1,d0
    23ba:	d080           	add.l d0,d0
    23bc:	d081           	add.l d1,d0
    23be:	d080           	add.l d0,d0
    23c0:	d080           	add.l d0,d0
    23c2:	9081           	sub.l d1,d0
    23c4:	d080           	add.l d0,d0
    23c6:	d080           	add.l d0,d0
    23c8:	d1af 0028      	add.l d0,40(sp)
        linesleft -= lines2write;
    23cc:	322f 000a      	move.w 10(sp),d1
    23d0:	936f 001e      	sub.w d1,30(sp)
    while (linesleft > 0) {
    23d4:	4a6f 001e      	tst.w 30(sp)
    23d8:	6600 fefa      	bne.w 22d4 <Zoom_ZoomIntoPicture2+0x1d2>
  for(int i=1;i<=21;i++) {
    23dc:	52af 002c      	addq.l #1,44(sp)
    23e0:	7415           	moveq #21,d2
    23e2:	b4af 002c      	cmp.l 44(sp),d2
    23e6:	6c00 fe04      	bge.w 21ec <Zoom_ZoomIntoPicture2+0xea>
      }
    }
  }
}
    23ea:	241f           	move.l (sp)+,d2
    23ec:	4fef 0034      	lea 52(sp),sp
    23f0:	4e75           	rts

000023f2 <Test_Zoom2>:
#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
    23f2:	4fef fea0      	lea -352(sp),sp
    23f6:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  UWORD size4buffer = 40*544*ZMBPLDEPTH;
    23fa:	3f7c a900 0156 	move.w #-22272,342(sp)
  UWORD size4target = 44*272*ZMBPLDEPTH;
    2400:	3f7c e9c0 0154 	move.w #-5696,340(sp)
  ULONG *pic1 = AllocMem( size4buffer, MEMF_CHIP);
    2406:	7000           	moveq #0,d0
    2408:	302f 0156      	move.w 342(sp),d0
    240c:	2f40 0150      	move.l d0,336(sp)
    2410:	7002           	moveq #2,d0
    2412:	2f40 014c      	move.l d0,332(sp)
    2416:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    241c:	2c40           	movea.l d0,a6
    241e:	202f 0150      	move.l 336(sp),d0
    2422:	222f 014c      	move.l 332(sp),d1
    2426:	4eae ff3a      	jsr -198(a6)
    242a:	2f40 0148      	move.l d0,328(sp)
    242e:	202f 0148      	move.l 328(sp),d0
    2432:	2f40 0144      	move.l d0,324(sp)
  if( pic1 == 0) {
    2436:	6646           	bne.s 247e <Test_Zoom2+0x8c>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for pic1\n", 38);
    2438:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    243e:	2c40           	movea.l d0,a6
    2440:	4eae ffc4      	jsr -60(a6)
    2444:	2f40 0094      	move.l d0,148(sp)
    2448:	202f 0094      	move.l 148(sp),d0
    244c:	2f40 0090      	move.l d0,144(sp)
    2450:	2f7c 0001 7cad 	move.l #97453,140(sp)
    2456:	008c 
    2458:	7226           	moveq #38,d1
    245a:	2f41 0088      	move.l d1,136(sp)
    245e:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2464:	2c40           	movea.l d0,a6
    2466:	222f 0090      	move.l 144(sp),d1
    246a:	242f 008c      	move.l 140(sp),d2
    246e:	262f 0088      	move.l 136(sp),d3
    2472:	4eae ffd0      	jsr -48(a6)
    2476:	2f40 0084      	move.l d0,132(sp)
    247a:	6000 0458      	bra.w 28d4 <Test_Zoom2+0x4e2>
    return;
  }
  ULONG *pic2 = AllocMem( size4buffer*2,MEMF_CHIP);
    247e:	7000           	moveq #0,d0
    2480:	302f 0156      	move.w 342(sp),d0
    2484:	d080           	add.l d0,d0
    2486:	2f40 0140      	move.l d0,320(sp)
    248a:	7002           	moveq #2,d0
    248c:	2f40 013c      	move.l d0,316(sp)
    2490:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    2496:	2c40           	movea.l d0,a6
    2498:	202f 0140      	move.l 320(sp),d0
    249c:	222f 013c      	move.l 316(sp),d1
    24a0:	4eae ff3a      	jsr -198(a6)
    24a4:	2f40 0138      	move.l d0,312(sp)
    24a8:	202f 0138      	move.l 312(sp),d0
    24ac:	2f40 0134      	move.l d0,308(sp)
  if( pic2 == 0) {
    24b0:	6646           	bne.s 24f8 <Test_Zoom2+0x106>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for pic2\n", 38);
    24b2:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    24b8:	2c40           	movea.l d0,a6
    24ba:	4eae ffc4      	jsr -60(a6)
    24be:	2f40 00a8      	move.l d0,168(sp)
    24c2:	202f 00a8      	move.l 168(sp),d0
    24c6:	2f40 00a4      	move.l d0,164(sp)
    24ca:	2f7c 0001 7cd4 	move.l #97492,160(sp)
    24d0:	00a0 
    24d2:	7226           	moveq #38,d1
    24d4:	2f41 009c      	move.l d1,156(sp)
    24d8:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    24de:	2c40           	movea.l d0,a6
    24e0:	222f 00a4      	move.l 164(sp),d1
    24e4:	242f 00a0      	move.l 160(sp),d2
    24e8:	262f 009c      	move.l 156(sp),d3
    24ec:	4eae ffd0      	jsr -48(a6)
    24f0:	2f40 0098      	move.l d0,152(sp)
    24f4:	6000 03de      	bra.w 28d4 <Test_Zoom2+0x4e2>
    return;
  }
  ULONG *target = AllocMem( size4target, MEMF_CHIP);
    24f8:	7000           	moveq #0,d0
    24fa:	302f 0154      	move.w 340(sp),d0
    24fe:	2f40 0130      	move.l d0,304(sp)
    2502:	7002           	moveq #2,d0
    2504:	2f40 012c      	move.l d0,300(sp)
    2508:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    250e:	2c40           	movea.l d0,a6
    2510:	202f 0130      	move.l 304(sp),d0
    2514:	222f 012c      	move.l 300(sp),d1
    2518:	4eae ff3a      	jsr -198(a6)
    251c:	2f40 0128      	move.l d0,296(sp)
    2520:	202f 0128      	move.l 296(sp),d0
    2524:	2f40 0124      	move.l d0,292(sp)
  UWORD *bp = 0x200;
    2528:	2f7c 0000 0200 	move.l #512,288(sp)
    252e:	0120 
  *bp = 0;
    2530:	206f 0120      	movea.l 288(sp),a0
    2534:	4250           	clr.w (a0)
  if( target == 0) {
    2536:	4aaf 0124      	tst.l 292(sp)
    253a:	6646           	bne.s 2582 <Test_Zoom2+0x190>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
    253c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2542:	2c40           	movea.l d0,a6
    2544:	4eae ffc4      	jsr -60(a6)
    2548:	2f40 00bc      	move.l d0,188(sp)
    254c:	202f 00bc      	move.l 188(sp),d0
    2550:	2f40 00b8      	move.l d0,184(sp)
    2554:	2f7c 0001 7cfb 	move.l #97531,180(sp)
    255a:	00b4 
    255c:	7228           	moveq #40,d1
    255e:	2f41 00b0      	move.l d1,176(sp)
    2562:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2568:	2c40           	movea.l d0,a6
    256a:	222f 00b8      	move.l 184(sp),d1
    256e:	242f 00b4      	move.l 180(sp),d2
    2572:	262f 00b0      	move.l 176(sp),d3
    2576:	4eae ffd0      	jsr -48(a6)
    257a:	2f40 00ac      	move.l d0,172(sp)
    257e:	6000 0354      	bra.w 28d4 <Test_Zoom2+0x4e2>
    return;
  }
  Zoom_Zl4Words = AllocMem( 21*8, MEMF_ANY);
    2582:	2f7c 0000 00a8 	move.l #168,284(sp)
    2588:	011c 
    258a:	42af 0118      	clr.l 280(sp)
    258e:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    2594:	2c40           	movea.l d0,a6
    2596:	202f 011c      	move.l 284(sp),d0
    259a:	222f 0118      	move.l 280(sp),d1
    259e:	4eae ff3a      	jsr -198(a6)
    25a2:	2f40 0114      	move.l d0,276(sp)
    25a6:	202f 0114      	move.l 276(sp),d0
    25aa:	23c0 0002 8548 	move.l d0,28548 <Zoom_Zl4Words>
  if( Zoom_Zl4Words == 0) {
    25b0:	2039 0002 8548 	move.l 28548 <Zoom_Zl4Words>,d0
    25b6:	6646           	bne.s 25fe <Test_Zoom2+0x20c>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for Zoom_Zl4Words\n", 40);
    25b8:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    25be:	2c40           	movea.l d0,a6
    25c0:	4eae ffc4      	jsr -60(a6)
    25c4:	2f40 00d0      	move.l d0,208(sp)
    25c8:	202f 00d0      	move.l 208(sp),d0
    25cc:	2f40 00cc      	move.l d0,204(sp)
    25d0:	2f7c 0001 7d24 	move.l #97572,200(sp)
    25d6:	00c8 
    25d8:	7028           	moveq #40,d0
    25da:	2f40 00c4      	move.l d0,196(sp)
    25de:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    25e4:	2c40           	movea.l d0,a6
    25e6:	222f 00cc      	move.l 204(sp),d1
    25ea:	242f 00c8      	move.l 200(sp),d2
    25ee:	262f 00c4      	move.l 196(sp),d3
    25f2:	4eae ffd0      	jsr -48(a6)
    25f6:	2f40 00c0      	move.l d0,192(sp)
    25fa:	6000 02d8      	bra.w 28d4 <Test_Zoom2+0x4e2>
    return;
  }
  
  UWORD *pos2write = Zoom_Zl4Words;
    25fe:	2f79 0002 8548 	move.l 28548 <Zoom_Zl4Words>,368(sp)
    2604:	0170 
  for( int i=0;i<14;i++) {
    2606:	42af 016c      	clr.l 364(sp)
    260a:	603a           	bra.s 2646 <Test_Zoom2+0x254>
    *pos2write++ = 4;
    260c:	202f 0170      	move.l 368(sp),d0
    2610:	2200           	move.l d0,d1
    2612:	5481           	addq.l #2,d1
    2614:	2f41 0170      	move.l d1,368(sp)
    2618:	2040           	movea.l d0,a0
    261a:	30bc 0004      	move.w #4,(a0)
    *pos2write++ = 4;
    261e:	202f 0170      	move.l 368(sp),d0
    2622:	2200           	move.l d0,d1
    2624:	5481           	addq.l #2,d1
    2626:	2f41 0170      	move.l d1,368(sp)
    262a:	2040           	movea.l d0,a0
    262c:	30bc 0004      	move.w #4,(a0)
    *pos2write++ = 8;
    2630:	202f 0170      	move.l 368(sp),d0
    2634:	2200           	move.l d0,d1
    2636:	5481           	addq.l #2,d1
    2638:	2f41 0170      	move.l d1,368(sp)
    263c:	2040           	movea.l d0,a0
    263e:	30bc 0008      	move.w #8,(a0)
  for( int i=0;i<14;i++) {
    2642:	52af 016c      	addq.l #1,364(sp)
    2646:	700d           	moveq #13,d0
    2648:	b0af 016c      	cmp.l 364(sp),d0
    264c:	6cbe           	bge.s 260c <Test_Zoom2+0x21a>
  }
  //16   16 ffff
  //8+16 40 ff00
  //8+16 64 0000
  Utils_FillLong( pic1, 0xfff00f00, 272, 10, 0 );
    264e:	42a7           	clr.l -(sp)
    2650:	4878 000a      	pea a <_start+0xa>
    2654:	4878 0110      	pea 110 <FreeDisplay+0x30>
    2658:	2f3c fff0 0f00 	move.l #-1044736,-(sp)
    265e:	2f2f 0154      	move.l 340(sp),-(sp)
    2662:	4eba dc0c      	jsr 270 <Utils_FillLong>(pc)
    2666:	4fef 0014      	lea 20(sp),sp
  Utils_FillLong( pic1+10*272, 0xfff00f00, 272, 10, 0 );
    266a:	202f 0144      	move.l 324(sp),d0
    266e:	0680 0000 2a80 	addi.l #10880,d0
    2674:	42a7           	clr.l -(sp)
    2676:	4878 000a      	pea a <_start+0xa>
    267a:	4878 0110      	pea 110 <FreeDisplay+0x30>
    267e:	2f3c fff0 0f00 	move.l #-1044736,-(sp)
    2684:	2f00           	move.l d0,-(sp)
    2686:	4eba dbe8      	jsr 270 <Utils_FillLong>(pc)
    268a:	4fef 0014      	lea 20(sp),sp
  Utils_FillLong( pic2, 0x0000ffff, 272, 20, 0);
    268e:	42a7           	clr.l -(sp)
    2690:	4878 0014      	pea 14 <_start+0x14>
    2694:	4878 0110      	pea 110 <FreeDisplay+0x30>
    2698:	2f3c 0000 ffff 	move.l #65535,-(sp)
    269e:	2f2f 0144      	move.l 324(sp),-(sp)
    26a2:	4eba dbcc      	jsr 270 <Utils_FillLong>(pc)
    26a6:	4fef 0014      	lea 20(sp),sp
  Utils_FillLong( pic2+20*272, 0x0000ffff, 272, 20, 0);
    26aa:	202f 0134      	move.l 308(sp),d0
    26ae:	0680 0000 5500 	addi.l #21760,d0
    26b4:	42a7           	clr.l -(sp)
    26b6:	4878 0014      	pea 14 <_start+0x14>
    26ba:	4878 0110      	pea 110 <FreeDisplay+0x30>
    26be:	2f3c 0000 ffff 	move.l #65535,-(sp)
    26c4:	2f00           	move.l d0,-(sp)
    26c6:	4eba dba8      	jsr 270 <Utils_FillLong>(pc)
    26ca:	4fef 0014      	lea 20(sp),sp
  //Utils_FillLong( pic2, 0x0000ffff, size4buffer*2);

  
  for( int i=1;i<=1;i++) {
    26ce:	7201           	moveq #1,d1
    26d0:	2f41 0168      	move.l d1,360(sp)
    26d4:	6000 0186      	bra.w 285c <Test_Zoom2+0x46a>
    Zoom_ZoomIntoPicture2( (UWORD *)pic1, (UWORD *) pic2,(UWORD *) target, i, 
    26d8:	202f 0168      	move.l 360(sp),d0
    26dc:	3000           	move.w d0,d0
    26de:	0280 0000 ffff 	andi.l #65535,d0
    26e4:	4878 0005      	pea 5 <_start+0x5>
    26e8:	2f00           	move.l d0,-(sp)
    26ea:	2f2f 012c      	move.l 300(sp),-(sp)
    26ee:	2f2f 0140      	move.l 320(sp),-(sp)
    26f2:	2f2f 0154      	move.l 340(sp),-(sp)
    26f6:	4eba fa0a      	jsr 2102 <Zoom_ZoomIntoPicture2>(pc)
    26fa:	4fef 0014      	lea 20(sp),sp
                                                                             5);
    UWORD *pos = (UWORD *) target + 1;
    26fe:	202f 0124      	move.l 292(sp),d0
    2702:	5480           	addq.l #2,d0
    2704:	2f40 0164      	move.l d0,356(sp)
    //ULONG pattern = 0xffff << (16 - i*2);
    UWORD pattern[3] = { 0x00ff, 0xff0f, 0xffff };
    2708:	3f7c 00ff 007e 	move.w #255,126(sp)
    270e:	3f7c ff0f 0080 	move.w #-241,128(sp)
    2714:	3f7c ffff 0082 	move.w #-1,130(sp)
    for( int i2=0;i2<2;i2++) {
    271a:	42af 0160      	clr.l 352(sp)
    271e:	6000 012e      	bra.w 284e <Test_Zoom2+0x45c>
      for( int i3=0;i3<7;i3++) {
    2722:	42af 015c      	clr.l 348(sp)
    2726:	6000 0114      	bra.w 283c <Test_Zoom2+0x44a>
        for( int i4=0; i4<3;i4++) {
    272a:	42af 0158      	clr.l 344(sp)
    272e:	6000 00fe      	bra.w 282e <Test_Zoom2+0x43c>
          if(*pos++ != pattern[i4])  {
    2732:	202f 0164      	move.l 356(sp),d0
    2736:	2200           	move.l d0,d1
    2738:	5481           	addq.l #2,d1
    273a:	2f41 0164      	move.l d1,356(sp)
    273e:	2040           	movea.l d0,a0
    2740:	3210           	move.w (a0),d1
    2742:	202f 0158      	move.l 344(sp),d0
    2746:	d080           	add.l d0,d0
    2748:	41ef 0174      	lea 372(sp),a0
    274c:	d088           	add.l a0,d0
    274e:	2040           	movea.l d0,a0
    2750:	41e8 ff0a      	lea -246(a0),a0
    2754:	3010           	move.w (a0),d0
    2756:	b041           	cmp.w d1,d0
    2758:	6700 00d0      	beq.w 282a <Test_Zoom2+0x438>
            pos--;
    275c:	55af 0164      	subq.l #2,356(sp)
            UWORD data[3];
            char str[100];
            data[0] = i;
    2760:	202f 0168      	move.l 360(sp),d0
    2764:	3f40 0078      	move.w d0,120(sp)
            data[1] = i3*3+i4;
    2768:	222f 015c      	move.l 348(sp),d1
    276c:	3001           	move.w d1,d0
    276e:	d040           	add.w d0,d0
    2770:	d240           	add.w d0,d1
    2772:	202f 0158      	move.l 344(sp),d0
    2776:	d041           	add.w d1,d0
    2778:	3f40 007a      	move.w d0,122(sp)
            data[2] = *pos;
    277c:	206f 0164      	movea.l 356(sp),a0
    2780:	3010           	move.w (a0),d0
    2782:	3f40 007c      	move.w d0,124(sp)
            pos++;
    2786:	54af 0164      	addq.l #2,356(sp)
            
            RawDoFmt( "Test_Zoom2: Pattern for zoomlevel %d, byte %d messed up."
    278a:	2f7c 0001 7d54 	move.l #97620,248(sp)
    2790:	00f8 
    2792:	203c 0000 0174 	move.l #372,d0
    2798:	d08f           	add.l sp,d0
    279a:	0680 ffff ff04 	addi.l #-252,d0
    27a0:	2f40 00f4      	move.l d0,244(sp)
    27a4:	2f7c 0000 75f4 	move.l #30196,240(sp)
    27aa:	00f0 
    27ac:	223c 0000 0174 	move.l #372,d1
    27b2:	d28f           	add.l sp,d1
    27b4:	0681 ffff fea0 	addi.l #-352,d1
    27ba:	2f41 00ec      	move.l d1,236(sp)
    27be:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    27c4:	2c40           	movea.l d0,a6
    27c6:	206f 00f8      	movea.l 248(sp),a0
    27ca:	226f 00f4      	movea.l 244(sp),a1
    27ce:	246f 00f0      	movea.l 240(sp),a2
    27d2:	266f 00ec      	movea.l 236(sp),a3
    27d6:	4eae fdf6      	jsr -522(a6)
    27da:	2f40 00e8      	move.l d0,232(sp)
                                        "Result was %x.\n", data, PutChar, str);
            Write( Output(), str, 66);
    27de:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    27e4:	2c40           	movea.l d0,a6
    27e6:	4eae ffc4      	jsr -60(a6)
    27ea:	2f40 00e4      	move.l d0,228(sp)
    27ee:	202f 00e4      	move.l 228(sp),d0
    27f2:	2f40 00e0      	move.l d0,224(sp)
    27f6:	203c 0000 0174 	move.l #372,d0
    27fc:	d08f           	add.l sp,d0
    27fe:	0680 ffff fea0 	addi.l #-352,d0
    2804:	2f40 00dc      	move.l d0,220(sp)
    2808:	7242           	moveq #66,d1
    280a:	2f41 00d8      	move.l d1,216(sp)
    280e:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2814:	2c40           	movea.l d0,a6
    2816:	222f 00e0      	move.l 224(sp),d1
    281a:	242f 00dc      	move.l 220(sp),d2
    281e:	262f 00d8      	move.l 216(sp),d3
    2822:	4eae ffd0      	jsr -48(a6)
    2826:	2f40 00d4      	move.l d0,212(sp)
        for( int i4=0; i4<3;i4++) {
    282a:	52af 0158      	addq.l #1,344(sp)
    282e:	7002           	moveq #2,d0
    2830:	b0af 0158      	cmp.l 344(sp),d0
    2834:	6c00 fefc      	bge.w 2732 <Test_Zoom2+0x340>
      for( int i3=0;i3<7;i3++) {
    2838:	52af 015c      	addq.l #1,348(sp)
    283c:	7206           	moveq #6,d1
    283e:	b2af 015c      	cmp.l 348(sp),d1
    2842:	6c00 fee6      	bge.w 272a <Test_Zoom2+0x338>
          }
        }
      } 
      pos+=2;
    2846:	58af 0164      	addq.l #4,356(sp)
    for( int i2=0;i2<2;i2++) {
    284a:	52af 0160      	addq.l #1,352(sp)
    284e:	7001           	moveq #1,d0
    2850:	b0af 0160      	cmp.l 352(sp),d0
    2854:	6c00 fecc      	bge.w 2722 <Test_Zoom2+0x330>
  for( int i=1;i<=1;i++) {
    2858:	52af 0168      	addq.l #1,360(sp)
    285c:	7201           	moveq #1,d1
    285e:	b2af 0168      	cmp.l 360(sp),d1
    2862:	6c00 fe74      	bge.w 26d8 <Test_Zoom2+0x2e6>
    }
  }
  FreeMem( pic1, size4buffer);
    2866:	2f6f 0144 0110 	move.l 324(sp),272(sp)
    286c:	7000           	moveq #0,d0
    286e:	302f 0156      	move.w 342(sp),d0
    2872:	2f40 010c      	move.l d0,268(sp)
    2876:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    287c:	2c40           	movea.l d0,a6
    287e:	226f 0110      	movea.l 272(sp),a1
    2882:	202f 010c      	move.l 268(sp),d0
    2886:	4eae ff2e      	jsr -210(a6)
  FreeMem( pic2, size4buffer*2);
    288a:	2f6f 0134 0108 	move.l 308(sp),264(sp)
    2890:	7000           	moveq #0,d0
    2892:	302f 0156      	move.w 342(sp),d0
    2896:	d080           	add.l d0,d0
    2898:	2f40 0104      	move.l d0,260(sp)
    289c:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    28a2:	2c40           	movea.l d0,a6
    28a4:	226f 0108      	movea.l 264(sp),a1
    28a8:	202f 0104      	move.l 260(sp),d0
    28ac:	4eae ff2e      	jsr -210(a6)
  FreeMem( target, size4target);
    28b0:	2f6f 0124 0100 	move.l 292(sp),256(sp)
    28b6:	7000           	moveq #0,d0
    28b8:	302f 0154      	move.w 340(sp),d0
    28bc:	2f40 00fc      	move.l d0,252(sp)
    28c0:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    28c6:	2c40           	movea.l d0,a6
    28c8:	226f 0100      	movea.l 256(sp),a1
    28cc:	202f 00fc      	move.l 252(sp),d0
    28d0:	4eae ff2e      	jsr -210(a6)
    28d4:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    28d8:	4fef 0160      	lea 352(sp),sp
    28dc:	4e75           	rts

000028de <ClBuild>:
#include "utils.h"




ULONG * ClBuild() {
    28de:	4fef ffc4      	lea -60(sp),sp
    28e2:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
    28e6:	2f7c 0000 0084 	move.l #132,48(sp)
    28ec:	0030 
    28ee:	7002           	moveq #2,d0
    28f0:	2f40 002c      	move.l d0,44(sp)
    28f4:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    28fa:	2c40           	movea.l d0,a6
    28fc:	202f 0030      	move.l 48(sp),d0
    2900:	222f 002c      	move.l 44(sp),d1
    2904:	4eae ff3a      	jsr -198(a6)
    2908:	2f40 0028      	move.l d0,40(sp)
    290c:	202f 0028      	move.l 40(sp),d0
    2910:	2f40 0024      	move.l d0,36(sp)
  if( retval == 0) {
    2914:	6658           	bne.s 296e <ClBuild+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2916:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    291c:	2c40           	movea.l d0,a6
    291e:	4eae ffc4      	jsr -60(a6)
    2922:	2f40 0020      	move.l d0,32(sp)
    2926:	202f 0020      	move.l 32(sp),d0
    292a:	2f40 001c      	move.l d0,28(sp)
    292e:	2f7c 0000 7d77 	move.l #32119,24(sp)
    2934:	0018 
    2936:	7228           	moveq #40,d1
    2938:	2f41 0014      	move.l d1,20(sp)
    293c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2942:	2c40           	movea.l d0,a6
    2944:	222f 001c      	move.l 28(sp),d1
    2948:	242f 0018      	move.l 24(sp),d2
    294c:	262f 0014      	move.l 20(sp),d3
    2950:	4eae ffd0      	jsr -48(a6)
    2954:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    2958:	7401           	moveq #1,d2
    295a:	2f42 000c      	move.l d2,12(sp)
    295e:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2964:	2c40           	movea.l d0,a6
    2966:	222f 000c      	move.l 12(sp),d1
    296a:	4eae ff70      	jsr -144(a6)
  }
    
  ULONG *cl = retval;
    296e:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    2974:	2f7c 0001 a5a0 	move.l #107936,64(sp)
    297a:	0040 
  for(int i=0; i<16;i++)
    297c:	42af 003c      	clr.l 60(sp)
    2980:	6024           	bra.s 29a6 <ClBuild+0xc8>
    *cl++ = *clpartinstruction++;
    2982:	222f 0040      	move.l 64(sp),d1
    2986:	2001           	move.l d1,d0
    2988:	5880           	addq.l #4,d0
    298a:	2f40 0040      	move.l d0,64(sp)
    298e:	202f 0044      	move.l 68(sp),d0
    2992:	2400           	move.l d0,d2
    2994:	5882           	addq.l #4,d2
    2996:	2f42 0044      	move.l d2,68(sp)
    299a:	2041           	movea.l d1,a0
    299c:	2210           	move.l (a0),d1
    299e:	2040           	movea.l d0,a0
    29a0:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    29a2:	52af 003c      	addq.l #1,60(sp)
    29a6:	700f           	moveq #15,d0
    29a8:	b0af 003c      	cmp.l 60(sp),d0
    29ac:	6cd4           	bge.s 2982 <ClBuild+0xa4>
  clpartinstruction = ClScreen;
    29ae:	2f7c 0001 a5e0 	move.l #108000,64(sp)
    29b4:	0040 
  for(int i=0; i<12;i++)
    29b6:	42af 0038      	clr.l 56(sp)
    29ba:	6024           	bra.s 29e0 <ClBuild+0x102>
    *cl++ = *clpartinstruction++;
    29bc:	222f 0040      	move.l 64(sp),d1
    29c0:	2401           	move.l d1,d2
    29c2:	5882           	addq.l #4,d2
    29c4:	2f42 0040      	move.l d2,64(sp)
    29c8:	202f 0044      	move.l 68(sp),d0
    29cc:	2400           	move.l d0,d2
    29ce:	5882           	addq.l #4,d2
    29d0:	2f42 0044      	move.l d2,68(sp)
    29d4:	2041           	movea.l d1,a0
    29d6:	2210           	move.l (a0),d1
    29d8:	2040           	movea.l d0,a0
    29da:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    29dc:	52af 0038      	addq.l #1,56(sp)
    29e0:	700b           	moveq #11,d0
    29e2:	b0af 0038      	cmp.l 56(sp),d0
    29e6:	6cd4           	bge.s 29bc <ClBuild+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    29e8:	202f 0044      	move.l 68(sp),d0
    29ec:	2200           	move.l d0,d1
    29ee:	5881           	addq.l #4,d1
    29f0:	2f41 0044      	move.l d1,68(sp)
    29f4:	2040           	movea.l d0,a0
    29f6:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    29fc:	202f 0044      	move.l 68(sp),d0
    2a00:	2200           	move.l d0,d1
    2a02:	5881           	addq.l #4,d1
    2a04:	2f41 0044      	move.l d1,68(sp)
    2a08:	2040           	movea.l d0,a0
    2a0a:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
    2a10:	2f7c 0001 a520 	move.l #107808,64(sp)
    2a16:	0040 
  for(int i=0; i<2;i++)
    2a18:	42af 0034      	clr.l 52(sp)
    2a1c:	6024           	bra.s 2a42 <ClBuild+0x164>
    *cl++ = *clpartinstruction++;
    2a1e:	222f 0040      	move.l 64(sp),d1
    2a22:	2001           	move.l d1,d0
    2a24:	5880           	addq.l #4,d0
    2a26:	2f40 0040      	move.l d0,64(sp)
    2a2a:	202f 0044      	move.l 68(sp),d0
    2a2e:	2400           	move.l d0,d2
    2a30:	5882           	addq.l #4,d2
    2a32:	2f42 0044      	move.l d2,68(sp)
    2a36:	2041           	movea.l d1,a0
    2a38:	2210           	move.l (a0),d1
    2a3a:	2040           	movea.l d0,a0
    2a3c:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
    2a3e:	52af 0034      	addq.l #1,52(sp)
    2a42:	7001           	moveq #1,d0
    2a44:	b0af 0034      	cmp.l 52(sp),d0
    2a48:	6cd4           	bge.s 2a1e <ClBuild+0x140>
  *cl = 0xfffffffe;
    2a4a:	206f 0044      	movea.l 68(sp),a0
    2a4e:	72fe           	moveq #-2,d1
    2a50:	2081           	move.l d1,(a0)

  return retval;
    2a52:	202f 0024      	move.l 36(sp),d0
}
    2a56:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2a5a:	4fef 003c      	lea 60(sp),sp
    2a5e:	4e75           	rts

00002a60 <PrepareDisplay>:

int PrepareDisplay() {
    2a60:	4fef ffb8      	lea -72(sp),sp
    2a64:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClBuild( );
    2a68:	4eba fe74      	jsr 28de <ClBuild>(pc)
    2a6c:	23c0 0002 8508 	move.l d0,28508 <Copperlist1>
  Copperlist2 = ClBuild( );
    2a72:	4eba fe6a      	jsr 28de <ClBuild>(pc)
    2a76:	23c0 0002 850c 	move.l d0,2850c <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    2a7c:	2f7c 0000 c800 	move.l #51200,80(sp)
    2a82:	0050 
    2a84:	7002           	moveq #2,d0
    2a86:	2f40 004c      	move.l d0,76(sp)
    2a8a:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    2a90:	2c40           	movea.l d0,a6
    2a92:	202f 0050      	move.l 80(sp),d0
    2a96:	222f 004c      	move.l 76(sp),d1
    2a9a:	4eae ff3a      	jsr -198(a6)
    2a9e:	2f40 0048      	move.l d0,72(sp)
    2aa2:	202f 0048      	move.l 72(sp),d0
    2aa6:	23c0 0002 8500 	move.l d0,28500 <Bitplane1>
  if(Bitplane1 == 0) {
    2aac:	2039 0002 8500 	move.l 28500 <Bitplane1>,d0
    2ab2:	6658           	bne.s 2b0c <PrepareDisplay+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2ab4:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2aba:	2c40           	movea.l d0,a6
    2abc:	4eae ffc4      	jsr -60(a6)
    2ac0:	2f40 0044      	move.l d0,68(sp)
    2ac4:	202f 0044      	move.l 68(sp),d0
    2ac8:	2f40 0040      	move.l d0,64(sp)
    2acc:	2f7c 0000 7d29 	move.l #32041,60(sp)
    2ad2:	003c 
    2ad4:	7026           	moveq #38,d0
    2ad6:	2f40 0038      	move.l d0,56(sp)
    2ada:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2ae0:	2c40           	movea.l d0,a6
    2ae2:	222f 0040      	move.l 64(sp),d1
    2ae6:	242f 003c      	move.l 60(sp),d2
    2aea:	262f 0038      	move.l 56(sp),d3
    2aee:	4eae ffd0      	jsr -48(a6)
    2af2:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    2af6:	7001           	moveq #1,d0
    2af8:	2f40 0030      	move.l d0,48(sp)
    2afc:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2b02:	2c40           	movea.l d0,a6
    2b04:	222f 0030      	move.l 48(sp),d1
    2b08:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane1;
    2b0c:	2039 0002 8500 	move.l 28500 <Bitplane1>,d0
    2b12:	23c0 0002 8514 	move.l d0,28514 <ViewBuffer>
  ViewCopper = Copperlist1;
    2b18:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    2b1e:	23c0 0002 851c 	move.l d0,2851c <ViewCopper>
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    2b24:	2f7c 0000 c800 	move.l #51200,44(sp)
    2b2a:	002c 
    2b2c:	7002           	moveq #2,d0
    2b2e:	2f40 0028      	move.l d0,40(sp)
    2b32:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    2b38:	2c40           	movea.l d0,a6
    2b3a:	202f 002c      	move.l 44(sp),d0
    2b3e:	222f 0028      	move.l 40(sp),d1
    2b42:	4eae ff3a      	jsr -198(a6)
    2b46:	2f40 0024      	move.l d0,36(sp)
    2b4a:	202f 0024      	move.l 36(sp),d0
    2b4e:	23c0 0002 8504 	move.l d0,28504 <Bitplane2>
  if(Bitplane2 == 0) {
    2b54:	2039 0002 8504 	move.l 28504 <Bitplane2>,d0
    2b5a:	6658           	bne.s 2bb4 <PrepareDisplay+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2b5c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2b62:	2c40           	movea.l d0,a6
    2b64:	4eae ffc4      	jsr -60(a6)
    2b68:	2f40 0020      	move.l d0,32(sp)
    2b6c:	202f 0020      	move.l 32(sp),d0
    2b70:	2f40 001c      	move.l d0,28(sp)
    2b74:	2f7c 0000 7d50 	move.l #32080,24(sp)
    2b7a:	0018 
    2b7c:	7026           	moveq #38,d0
    2b7e:	2f40 0014      	move.l d0,20(sp)
    2b82:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2b88:	2c40           	movea.l d0,a6
    2b8a:	222f 001c      	move.l 28(sp),d1
    2b8e:	242f 0018      	move.l 24(sp),d2
    2b92:	262f 0014      	move.l 20(sp),d3
    2b96:	4eae ffd0      	jsr -48(a6)
    2b9a:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    2b9e:	7001           	moveq #1,d0
    2ba0:	2f40 000c      	move.l d0,12(sp)
    2ba4:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2baa:	2c40           	movea.l d0,a6
    2bac:	222f 000c      	move.l 12(sp),d1
    2bb0:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane2;
    2bb4:	2039 0002 8504 	move.l 28504 <Bitplane2>,d0
    2bba:	23c0 0002 8510 	move.l d0,28510 <DrawBuffer>
  DrawCopper = Copperlist2;
    2bc0:	2039 0002 850c 	move.l 2850c <Copperlist2>,d0
    2bc6:	23c0 0002 8518 	move.l d0,28518 <DrawCopper>
  /*SwapCl();
  SetBplPointers();
  SwapCl();
  SetBplPointers();*/
  return 0;
    2bcc:	7000           	moveq #0,d0
}
    2bce:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2bd2:	4fef 0048      	lea 72(sp),sp
    2bd6:	4e75           	rts

00002bd8 <TestCopperlistBatch>:

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                  long length) {
    2bd8:	598f           	subq.l #4,sp
  for( int i=0;i<length;i++)
    2bda:	4297           	clr.l (sp)
    2bdc:	602a           	bra.s 2c08 <TestCopperlistBatch+0x30>
    if( instructions[ pos+i] != batch[ i])
    2bde:	202f 000c      	move.l 12(sp),d0
    2be2:	d097           	add.l (sp),d0
    2be4:	d080           	add.l d0,d0
    2be6:	d080           	add.l d0,d0
    2be8:	206f 0008      	movea.l 8(sp),a0
    2bec:	d1c0           	adda.l d0,a0
    2bee:	2210           	move.l (a0),d1
    2bf0:	2017           	move.l (sp),d0
    2bf2:	d080           	add.l d0,d0
    2bf4:	d080           	add.l d0,d0
    2bf6:	206f 0010      	movea.l 16(sp),a0
    2bfa:	d1c0           	adda.l d0,a0
    2bfc:	2010           	move.l (a0),d0
    2bfe:	b081           	cmp.l d1,d0
    2c00:	6704           	beq.s 2c06 <TestCopperlistBatch+0x2e>
      return 0;
    2c02:	7000           	moveq #0,d0
    2c04:	600c           	bra.s 2c12 <TestCopperlistBatch+0x3a>
  for( int i=0;i<length;i++)
    2c06:	5297           	addq.l #1,(sp)
    2c08:	2017           	move.l (sp),d0
    2c0a:	b0af 0014      	cmp.l 20(sp),d0
    2c0e:	6dce           	blt.s 2bde <TestCopperlistBatch+0x6>
  return 1;
    2c10:	7001           	moveq #1,d0
}
    2c12:	588f           	addq.l #4,sp
    2c14:	4e75           	rts

00002c16 <TestCopperlistPos>:

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    2c16:	202f 0008      	move.l 8(sp),d0
    2c1a:	d080           	add.l d0,d0
    2c1c:	d080           	add.l d0,d0
    2c1e:	206f 0004      	movea.l 4(sp),a0
    2c22:	d1c0           	adda.l d0,a0
    2c24:	2010           	move.l (a0),d0
    2c26:	b0af 000c      	cmp.l 12(sp),d0
    2c2a:	6604           	bne.s 2c30 <TestCopperlistPos+0x1a>
    return 1;
    2c2c:	7001           	moveq #1,d0
    2c2e:	6002           	bra.s 2c32 <TestCopperlistPos+0x1c>
  else 
    return 0;
    2c30:	7000           	moveq #0,d0
}
    2c32:	4e75           	rts

00002c34 <TestCopperList>:

void TestCopperList() {
    2c34:	4fef feb8      	lea -328(sp),sp
    2c38:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Write( Output(), "%d", hw->cop1lc);
    2c3c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2c42:	2c40           	movea.l d0,a6
    2c44:	4eae ffc4      	jsr -60(a6)
    2c48:	2f40 0150      	move.l d0,336(sp)
    2c4c:	202f 0150      	move.l 336(sp),d0
    2c50:	2f40 014c      	move.l d0,332(sp)
    2c54:	2f7c 0001 7d9c 	move.l #97692,328(sp)
    2c5a:	0148 
    2c5c:	2079 0002 8520 	movea.l 28520 <hw>,a0
    2c62:	2028 0080      	move.l 128(a0),d0
    2c66:	2f40 0144      	move.l d0,324(sp)
    2c6a:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2c70:	2c40           	movea.l d0,a6
    2c72:	222f 014c      	move.l 332(sp),d1
    2c76:	242f 0148      	move.l 328(sp),d2
    2c7a:	262f 0144      	move.l 324(sp),d3
    2c7e:	4eae ffd0      	jsr -48(a6)
    2c82:	2f40 0140      	move.l d0,320(sp)
  Copperlist1 = ClBuild();
    2c86:	4eba fc56      	jsr 28de <ClBuild>(pc)
    2c8a:	23c0 0002 8508 	move.l d0,28508 <Copperlist1>
  DrawCopper = Copperlist1;
    2c90:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    2c96:	23c0 0002 8518 	move.l d0,28518 <DrawCopper>
  Copperlist2 = ClBuild();
    2c9c:	4eba fc40      	jsr 28de <ClBuild>(pc)
    2ca0:	23c0 0002 850c 	move.l d0,2850c <Copperlist2>
  ViewCopper = Copperlist2;
    2ca6:	2039 0002 850c 	move.l 2850c <Copperlist2>,d0
    2cac:	23c0 0002 851c 	move.l d0,2851c <ViewCopper>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2cb2:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    2cb8:	4878 0010      	pea 10 <_start+0x10>
    2cbc:	4879 0001 a5a0 	pea 1a5a0 <ClsSprites>
    2cc2:	42a7           	clr.l -(sp)
    2cc4:	2f00           	move.l d0,-(sp)
    2cc6:	4eba ff10      	jsr 2bd8 <TestCopperlistBatch>(pc)
    2cca:	4fef 0010      	lea 16(sp),sp
    2cce:	4a80           	tst.l d0
    2cd0:	6642           	bne.s 2d14 <TestCopperList+0xe0>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    2cd2:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2cd8:	2c40           	movea.l d0,a6
    2cda:	4eae ffc4      	jsr -60(a6)
    2cde:	2f40 013c      	move.l d0,316(sp)
    2ce2:	202f 013c      	move.l 316(sp),d0
    2ce6:	2f40 0138      	move.l d0,312(sp)
    2cea:	2f7c 0000 7693 	move.l #30355,308(sp)
    2cf0:	0134 
    2cf2:	702c           	moveq #44,d0
    2cf4:	2f40 0130      	move.l d0,304(sp)
    2cf8:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2cfe:	2c40           	movea.l d0,a6
    2d00:	222f 0138      	move.l 312(sp),d1
    2d04:	242f 0134      	move.l 308(sp),d2
    2d08:	262f 0130      	move.l 304(sp),d3
    2d0c:	4eae ffd0      	jsr -48(a6)
    2d10:	2f40 012c      	move.l d0,300(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2d14:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    2d1a:	4878 000c      	pea c <_start+0xc>
    2d1e:	4879 0001 a5e0 	pea 1a5e0 <ClScreen>
    2d24:	4878 0010      	pea 10 <_start+0x10>
    2d28:	2f00           	move.l d0,-(sp)
    2d2a:	4eba feac      	jsr 2bd8 <TestCopperlistBatch>(pc)
    2d2e:	4fef 0010      	lea 16(sp),sp
    2d32:	4a80           	tst.l d0
    2d34:	6642           	bne.s 2d78 <TestCopperList+0x144>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    2d36:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2d3c:	2c40           	movea.l d0,a6
    2d3e:	4eae ffc4      	jsr -60(a6)
    2d42:	2f40 0128      	move.l d0,296(sp)
    2d46:	202f 0128      	move.l 296(sp),d0
    2d4a:	2f40 0124      	move.l d0,292(sp)
    2d4e:	2f7c 0000 76c9 	move.l #30409,288(sp)
    2d54:	0120 
    2d56:	7036           	moveq #54,d0
    2d58:	2f40 011c      	move.l d0,284(sp)
    2d5c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2d62:	2c40           	movea.l d0,a6
    2d64:	222f 0124      	move.l 292(sp),d1
    2d68:	242f 0120      	move.l 288(sp),d2
    2d6c:	262f 011c      	move.l 284(sp),d3
    2d70:	4eae ffd0      	jsr -48(a6)
    2d74:	2f40 0118      	move.l d0,280(sp)
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
    2d78:	23fc 0004 0000 	move.l #262144,28510 <DrawBuffer>
    2d7e:	0002 8510 
  ViewBuffer = (ULONG *)0x50000;
    2d82:	23fc 0005 0000 	move.l #327680,28514 <ViewBuffer>
    2d88:	0002 8514 
  
  SetBplPointers();
    2d8c:	4eba d408      	jsr 196 <SetBplPointers>(pc)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    2d90:	2039 0002 8510 	move.l 28510 <DrawBuffer>,d0
    2d96:	0c80 0005 0000 	cmpi.l #327680,d0
    2d9c:	660e           	bne.s 2dac <TestCopperList+0x178>
    2d9e:	2039 0002 8514 	move.l 28514 <ViewBuffer>,d0
    2da4:	0c80 0004 0000 	cmpi.l #262144,d0
    2daa:	6742           	beq.s 2dee <TestCopperList+0x1ba>
    Write( Output(), 
    2dac:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2db2:	2c40           	movea.l d0,a6
    2db4:	4eae ffc4      	jsr -60(a6)
    2db8:	2f40 0114      	move.l d0,276(sp)
    2dbc:	202f 0114      	move.l 276(sp),d0
    2dc0:	2f40 0110      	move.l d0,272(sp)
    2dc4:	2f7c 0001 7d9f 	move.l #97695,268(sp)
    2dca:	010c 
    2dcc:	703b           	moveq #59,d0
    2dce:	2f40 0108      	move.l d0,264(sp)
    2dd2:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2dd8:	2c40           	movea.l d0,a6
    2dda:	222f 0110      	move.l 272(sp),d1
    2dde:	242f 010c      	move.l 268(sp),d2
    2de2:	262f 0108      	move.l 264(sp),d3
    2de6:	4eae ffd0      	jsr -48(a6)
    2dea:	2f40 0104      	move.l d0,260(sp)
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    2dee:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    2df4:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    2dfa:	4878 001c      	pea 1c <_start+0x1c>
    2dfe:	2f00           	move.l d0,-(sp)
    2e00:	4eba fe14      	jsr 2c16 <TestCopperlistPos>(pc)
    2e04:	4fef 000c      	lea 12(sp),sp
    2e08:	4a80           	tst.l d0
    2e0a:	6642           	bne.s 2e4e <TestCopperList+0x21a>
    Write(Output(), 
    2e0c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2e12:	2c40           	movea.l d0,a6
    2e14:	4eae ffc4      	jsr -60(a6)
    2e18:	2f40 0100      	move.l d0,256(sp)
    2e1c:	202f 0100      	move.l 256(sp),d0
    2e20:	2f40 00fc      	move.l d0,252(sp)
    2e24:	2f7c 0001 7ddb 	move.l #97755,248(sp)
    2e2a:	00f8 
    2e2c:	703c           	moveq #60,d0
    2e2e:	2f40 00f4      	move.l d0,244(sp)
    2e32:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2e38:	2c40           	movea.l d0,a6
    2e3a:	222f 00fc      	move.l 252(sp),d1
    2e3e:	242f 00f8      	move.l 248(sp),d2
    2e42:	262f 00f4      	move.l 244(sp),d3
    2e46:	4eae ffd0      	jsr -48(a6)
    2e4a:	2f40 00f0      	move.l d0,240(sp)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    2e4e:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    2e54:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    2e5a:	4878 001d      	pea 1d <_start+0x1d>
    2e5e:	2f00           	move.l d0,-(sp)
    2e60:	4eba fdb4      	jsr 2c16 <TestCopperlistPos>(pc)
    2e64:	4fef 000c      	lea 12(sp),sp
    2e68:	4a80           	tst.l d0
    2e6a:	6642           	bne.s 2eae <TestCopperList+0x27a>
    Write(Output(), 
    2e6c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2e72:	2c40           	movea.l d0,a6
    2e74:	4eae ffc4      	jsr -60(a6)
    2e78:	2f40 00ec      	move.l d0,236(sp)
    2e7c:	202f 00ec      	move.l 236(sp),d0
    2e80:	2f40 00e8      	move.l d0,232(sp)
    2e84:	2f7c 0001 7e18 	move.l #97816,228(sp)
    2e8a:	00e4 
    2e8c:	703c           	moveq #60,d0
    2e8e:	2f40 00e0      	move.l d0,224(sp)
    2e92:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2e98:	2c40           	movea.l d0,a6
    2e9a:	222f 00e8      	move.l 232(sp),d1
    2e9e:	242f 00e4      	move.l 228(sp),d2
    2ea2:	262f 00e0      	move.l 224(sp),d3
    2ea6:	4eae ffd0      	jsr -48(a6)
    2eaa:	2f40 00dc      	move.l d0,220(sp)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2eae:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    2eb4:	4878 0002      	pea 2 <_start+0x2>
    2eb8:	4879 0001 a520 	pea 1a520 <ClColor>
    2ebe:	4878 001e      	pea 1e <_start+0x1e>
    2ec2:	2f00           	move.l d0,-(sp)
    2ec4:	4eba fd12      	jsr 2bd8 <TestCopperlistBatch>(pc)
    2ec8:	4fef 0010      	lea 16(sp),sp
    2ecc:	4a80           	tst.l d0
    2ece:	6642           	bne.s 2f12 <TestCopperList+0x2de>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2ed0:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2ed6:	2c40           	movea.l d0,a6
    2ed8:	4eae ffc4      	jsr -60(a6)
    2edc:	2f40 00d8      	move.l d0,216(sp)
    2ee0:	202f 00d8      	move.l 216(sp),d0
    2ee4:	2f40 00d4      	move.l d0,212(sp)
    2ee8:	2f7c 0000 7700 	move.l #30464,208(sp)
    2eee:	00d0 
    2ef0:	7021           	moveq #33,d0
    2ef2:	2f40 00cc      	move.l d0,204(sp)
    2ef6:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2efc:	2c40           	movea.l d0,a6
    2efe:	222f 00d4      	move.l 212(sp),d1
    2f02:	242f 00d0      	move.l 208(sp),d2
    2f06:	262f 00cc      	move.l 204(sp),d3
    2f0a:	4eae ffd0      	jsr -48(a6)
    2f0e:	2f40 00c8      	move.l d0,200(sp)

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2f12:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    2f18:	4878 fffe      	pea fffffffe <_end+0xfffd7a86>
    2f1c:	4878 0020      	pea 20 <_start+0x20>
    2f20:	2f00           	move.l d0,-(sp)
    2f22:	4eba fcf2      	jsr 2c16 <TestCopperlistPos>(pc)
    2f26:	4fef 000c      	lea 12(sp),sp
    2f2a:	4a80           	tst.l d0
    2f2c:	6642           	bne.s 2f70 <TestCopperList+0x33c>
    Write(Output(), "Copperlist End not correctly set.\n", 34);
    2f2e:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2f34:	2c40           	movea.l d0,a6
    2f36:	4eae ffc4      	jsr -60(a6)
    2f3a:	2f40 00c4      	move.l d0,196(sp)
    2f3e:	202f 00c4      	move.l 196(sp),d0
    2f42:	2f40 00c0      	move.l d0,192(sp)
    2f46:	2f7c 0000 7722 	move.l #30498,188(sp)
    2f4c:	00bc 
    2f4e:	7022           	moveq #34,d0
    2f50:	2f40 00b8      	move.l d0,184(sp)
    2f54:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2f5a:	2c40           	movea.l d0,a6
    2f5c:	222f 00c0      	move.l 192(sp),d1
    2f60:	242f 00bc      	move.l 188(sp),d2
    2f64:	262f 00b8      	move.l 184(sp),d3
    2f68:	4eae ffd0      	jsr -48(a6)
    2f6c:	2f40 00b4      	move.l d0,180(sp)
  
  SwapCl();
    2f70:	4eba d282      	jsr 1f4 <SwapCl>(pc)
  
  if( DrawCopper != Copperlist2)
    2f74:	2239 0002 8518 	move.l 28518 <DrawCopper>,d1
    2f7a:	2039 0002 850c 	move.l 2850c <Copperlist2>,d0
    2f80:	b081           	cmp.l d1,d0
    2f82:	6742           	beq.s 2fc6 <TestCopperList+0x392>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
    2f84:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2f8a:	2c40           	movea.l d0,a6
    2f8c:	4eae ffc4      	jsr -60(a6)
    2f90:	2f40 00b0      	move.l d0,176(sp)
    2f94:	202f 00b0      	move.l 176(sp),d0
    2f98:	2f40 00ac      	move.l d0,172(sp)
    2f9c:	2f7c 0001 7e55 	move.l #97877,168(sp)
    2fa2:	00a8 
    2fa4:	7015           	moveq #21,d0
    2fa6:	2f40 00a4      	move.l d0,164(sp)
    2faa:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2fb0:	2c40           	movea.l d0,a6
    2fb2:	222f 00ac      	move.l 172(sp),d1
    2fb6:	242f 00a8      	move.l 168(sp),d2
    2fba:	262f 00a4      	move.l 164(sp),d3
    2fbe:	4eae ffd0      	jsr -48(a6)
    2fc2:	2f40 00a0      	move.l d0,160(sp)

  
  PrepareDisplay();
    2fc6:	4eba fa98      	jsr 2a60 <PrepareDisplay>(pc)
  if( DrawBuffer != Bitplane2) 
    2fca:	2239 0002 8510 	move.l 28510 <DrawBuffer>,d1
    2fd0:	2039 0002 8504 	move.l 28504 <Bitplane2>,d0
    2fd6:	b081           	cmp.l d1,d0
    2fd8:	6742           	beq.s 301c <TestCopperList+0x3e8>
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
    2fda:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    2fe0:	2c40           	movea.l d0,a6
    2fe2:	4eae ffc4      	jsr -60(a6)
    2fe6:	2f40 009c      	move.l d0,156(sp)
    2fea:	202f 009c      	move.l 156(sp),d0
    2fee:	2f40 0098      	move.l d0,152(sp)
    2ff2:	2f7c 0001 7e6b 	move.l #97899,148(sp)
    2ff8:	0094 
    2ffa:	7037           	moveq #55,d0
    2ffc:	2f40 0090      	move.l d0,144(sp)
    3000:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3006:	2c40           	movea.l d0,a6
    3008:	222f 0098      	move.l 152(sp),d1
    300c:	242f 0094      	move.l 148(sp),d2
    3010:	262f 0090      	move.l 144(sp),d3
    3014:	4eae ffd0      	jsr -48(a6)
    3018:	2f40 008c      	move.l d0,140(sp)
                                                                            55);
  if( DrawCopper != Copperlist2) 
    301c:	2239 0002 8518 	move.l 28518 <DrawCopper>,d1
    3022:	2039 0002 850c 	move.l 2850c <Copperlist2>,d0
    3028:	b081           	cmp.l d1,d0
    302a:	6742           	beq.s 306e <TestCopperList+0x43a>
    Write( Output(), 
    302c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3032:	2c40           	movea.l d0,a6
    3034:	4eae ffc4      	jsr -60(a6)
    3038:	2f40 0088      	move.l d0,136(sp)
    303c:	202f 0088      	move.l 136(sp),d0
    3040:	2f40 0084      	move.l d0,132(sp)
    3044:	2f7c 0001 7ea3 	move.l #97955,128(sp)
    304a:	0080 
    304c:	7039           	moveq #57,d0
    304e:	2f40 007c      	move.l d0,124(sp)
    3052:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3058:	2c40           	movea.l d0,a6
    305a:	222f 0084      	move.l 132(sp),d1
    305e:	242f 0080      	move.l 128(sp),d2
    3062:	262f 007c      	move.l 124(sp),d3
    3066:	4eae ffd0      	jsr -48(a6)
    306a:	2f40 0078      	move.l d0,120(sp)
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
    306e:	2239 0002 8514 	move.l 28514 <ViewBuffer>,d1
    3074:	2039 0002 8500 	move.l 28500 <Bitplane1>,d0
    307a:	b081           	cmp.l d1,d0
    307c:	6742           	beq.s 30c0 <TestCopperList+0x48c>
    Write( Output(), 
    307e:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3084:	2c40           	movea.l d0,a6
    3086:	4eae ffc4      	jsr -60(a6)
    308a:	2f40 0074      	move.l d0,116(sp)
    308e:	202f 0074      	move.l 116(sp),d0
    3092:	2f40 0070      	move.l d0,112(sp)
    3096:	2f7c 0001 7edd 	move.l #98013,108(sp)
    309c:	006c 
    309e:	7038           	moveq #56,d0
    30a0:	2f40 0068      	move.l d0,104(sp)
    30a4:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    30aa:	2c40           	movea.l d0,a6
    30ac:	222f 0070      	move.l 112(sp),d1
    30b0:	242f 006c      	move.l 108(sp),d2
    30b4:	262f 0068      	move.l 104(sp),d3
    30b8:	4eae ffd0      	jsr -48(a6)
    30bc:	2f40 0064      	move.l d0,100(sp)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
    30c0:	2239 0002 851c 	move.l 2851c <ViewCopper>,d1
    30c6:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    30cc:	b081           	cmp.l d1,d0
    30ce:	6742           	beq.s 3112 <TestCopperList+0x4de>
    Write( Output(), 
    30d0:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    30d6:	2c40           	movea.l d0,a6
    30d8:	4eae ffc4      	jsr -60(a6)
    30dc:	2f40 0060      	move.l d0,96(sp)
    30e0:	202f 0060      	move.l 96(sp),d0
    30e4:	2f40 005c      	move.l d0,92(sp)
    30e8:	2f7c 0001 7f16 	move.l #98070,88(sp)
    30ee:	0058 
    30f0:	703a           	moveq #58,d0
    30f2:	2f40 0054      	move.l d0,84(sp)
    30f6:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    30fc:	2c40           	movea.l d0,a6
    30fe:	222f 005c      	move.l 92(sp),d1
    3102:	242f 0058      	move.l 88(sp),d2
    3106:	262f 0054      	move.l 84(sp),d3
    310a:	4eae ffd0      	jsr -48(a6)
    310e:	2f40 0050      	move.l d0,80(sp)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
    3112:	4eba d082      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
    3116:	4eba d0dc      	jsr 1f4 <SwapCl>(pc)
  UWORD *copword = ViewCopper;
    311a:	2f79 0002 851c 	move.l 2851c <ViewCopper>,76(sp)
    3120:	004c 
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    3122:	307c 0076      	movea.w #118,a0
    3126:	d1ef 004c      	adda.l 76(sp),a0
    312a:	3010           	move.w (a0),d0
    312c:	7200           	moveq #0,d1
    312e:	3200           	move.w d0,d1
    3130:	307c 0072      	movea.w #114,a0
    3134:	d1ef 004c      	adda.l 76(sp),a0
    3138:	3010           	move.w (a0),d0
    313a:	3000           	move.w d0,d0
    313c:	0280 0000 ffff 	andi.l #65535,d0
    3142:	4840           	swap d0
    3144:	4240           	clr.w d0
    3146:	d081           	add.l d1,d0
    3148:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    314c:	2039 0002 8504 	move.l 28504 <Bitplane2>,d0
    3152:	b0af 0048      	cmp.l 72(sp),d0
    3156:	6742           	beq.s 319a <TestCopperList+0x566>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    3158:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    315e:	2c40           	movea.l d0,a6
    3160:	4eae ffc4      	jsr -60(a6)
    3164:	2f40 0044      	move.l d0,68(sp)
    3168:	202f 0044      	move.l 68(sp),d0
    316c:	2f40 0040      	move.l d0,64(sp)
    3170:	2f7c 0001 7f51 	move.l #98129,60(sp)
    3176:	003c 
    3178:	7048           	moveq #72,d0
    317a:	2f40 0038      	move.l d0,56(sp)
    317e:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3184:	2c40           	movea.l d0,a6
    3186:	222f 0040      	move.l 64(sp),d1
    318a:	242f 003c      	move.l 60(sp),d2
    318e:	262f 0038      	move.l 56(sp),d3
    3192:	4eae ffd0      	jsr -48(a6)
    3196:	2f40 0034      	move.l d0,52(sp)
                                                   " after first frame.\n", 72);
  SetBplPointers();
    319a:	4eba cffa      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
    319e:	4eba d054      	jsr 1f4 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    31a2:	2f79 0002 851c 	move.l 2851c <ViewCopper>,76(sp)
    31a8:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    31aa:	307c 0076      	movea.w #118,a0
    31ae:	d1ef 004c      	adda.l 76(sp),a0
    31b2:	3010           	move.w (a0),d0
    31b4:	7200           	moveq #0,d1
    31b6:	3200           	move.w d0,d1
    31b8:	307c 0072      	movea.w #114,a0
    31bc:	d1ef 004c      	adda.l 76(sp),a0
    31c0:	3010           	move.w (a0),d0
    31c2:	3000           	move.w d0,d0
    31c4:	0280 0000 ffff 	andi.l #65535,d0
    31ca:	4840           	swap d0
    31cc:	4240           	clr.w d0
    31ce:	d081           	add.l d1,d0
    31d0:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane1) 
    31d4:	2039 0002 8500 	move.l 28500 <Bitplane1>,d0
    31da:	b0af 0048      	cmp.l 72(sp),d0
    31de:	6742           	beq.s 3222 <TestCopperList+0x5ee>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
    31e0:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    31e6:	2c40           	movea.l d0,a6
    31e8:	4eae ffc4      	jsr -60(a6)
    31ec:	2f40 0030      	move.l d0,48(sp)
    31f0:	202f 0030      	move.l 48(sp),d0
    31f4:	2f40 002c      	move.l d0,44(sp)
    31f8:	2f7c 0001 7f9a 	move.l #98202,40(sp)
    31fe:	0028 
    3200:	7049           	moveq #73,d0
    3202:	2f40 0024      	move.l d0,36(sp)
    3206:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    320c:	2c40           	movea.l d0,a6
    320e:	222f 002c      	move.l 44(sp),d1
    3212:	242f 0028      	move.l 40(sp),d2
    3216:	262f 0024      	move.l 36(sp),d3
    321a:	4eae ffd0      	jsr -48(a6)
    321e:	2f40 0020      	move.l d0,32(sp)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
    3222:	4eba cf72      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
    3226:	4eba cfcc      	jsr 1f4 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    322a:	2f79 0002 851c 	move.l 2851c <ViewCopper>,76(sp)
    3230:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    3232:	307c 0076      	movea.w #118,a0
    3236:	d1ef 004c      	adda.l 76(sp),a0
    323a:	3010           	move.w (a0),d0
    323c:	7200           	moveq #0,d1
    323e:	3200           	move.w d0,d1
    3240:	307c 0072      	movea.w #114,a0
    3244:	d1ef 004c      	adda.l 76(sp),a0
    3248:	3010           	move.w (a0),d0
    324a:	3000           	move.w d0,d0
    324c:	0280 0000 ffff 	andi.l #65535,d0
    3252:	4840           	swap d0
    3254:	4240           	clr.w d0
    3256:	d081           	add.l d1,d0
    3258:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    325c:	2039 0002 8504 	move.l 28504 <Bitplane2>,d0
    3262:	b0af 0048      	cmp.l 72(sp),d0
    3266:	6742           	beq.s 32aa <TestCopperList+0x676>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    3268:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    326e:	2c40           	movea.l d0,a6
    3270:	4eae ffc4      	jsr -60(a6)
    3274:	2f40 001c      	move.l d0,28(sp)
    3278:	202f 001c      	move.l 28(sp),d0
    327c:	2f40 0018      	move.l d0,24(sp)
    3280:	2f7c 0001 7fe4 	move.l #98276,20(sp)
    3286:	0014 
    3288:	7048           	moveq #72,d0
    328a:	2f40 0010      	move.l d0,16(sp)
    328e:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3294:	2c40           	movea.l d0,a6
    3296:	222f 0018      	move.l 24(sp),d1
    329a:	242f 0014      	move.l 20(sp),d2
    329e:	262f 0010      	move.l 16(sp),d3
    32a2:	4eae ffd0      	jsr -48(a6)
    32a6:	2f40 000c      	move.l d0,12(sp)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
    32aa:	2f3c 0000 c800 	move.l #51200,-(sp)
    32b0:	4878 0084      	pea 84 <_start+0x84>
    32b4:	4eba ce2a      	jsr e0 <FreeDisplay>(pc)
    32b8:	508f           	addq.l #8,sp
    32ba:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    32be:	4fef 0148      	lea 328(sp),sp
    32c2:	4e75           	rts

000032c4 <RunTests>:
#include "runtests.h"
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    32c4:	4eba f96e      	jsr 2c34 <TestCopperList>(pc)
    ZoomTest();
    32c8:	4eba 0004      	jsr 32ce <ZoomTest>(pc)
    //SwScrollerTest();
    32cc:	4e75           	rts

000032ce <ZoomTest>:
#include "zoomtest2.h"

ULONG Cl102ZoomTest[137];

void ZoomTest() {
  TestZoomSpeed();
    32ce:	4eba 001c      	jsr 32ec <TestZoomSpeed>(pc)
  ZoomTestDisplay();
    32d2:	4eba 00b8      	jsr 338c <ZoomTestDisplay>(pc)
  TestBlitleftOfZoom();
    32d6:	4eba 057a      	jsr 3852 <TestBlitleftOfZoom>(pc)
  TestCopyWord();
    32da:	4eba 080a      	jsr 3ae6 <TestCopyWord>(pc)
  TestZoom4Picture();
    32de:	4eba 0de4      	jsr 40c4 <TestZoom4Picture>(pc)
  TestZoom4PictureOn5Planes();
    32e2:	4eba 0af4      	jsr 3dd8 <TestZoom4PictureOn5Planes>(pc)
  Test_Zoom2();
    32e6:	4eba f10a      	jsr 23f2 <Test_Zoom2>(pc)
}
    32ea:	4e75           	rts

000032ec <TestZoomSpeed>:

int Counter4Frames;

void TestZoomSpeed() {
    32ec:	4fef ffe8      	lea -24(sp),sp
    32f0:	48e7 3002      	movem.l d2-d3/a6,-(sp)

 	TakeSystem();
    32f4:	4eba d3d2      	jsr 6c8 <TakeSystem>(pc)
	WaitVbl();
    32f8:	4eba d384      	jsr 67e <WaitVbl>(pc)
  //             fedcba9876543210
  //hw->dmacon = 0x8def;

  hw->dmacon = DMAF_SETCLR | DMAF_AUDIO | DMAF_BLITTER | DMAF_RASTER 
    32fc:	2079 0002 8520 	movea.l 28520 <hw>,a0
    3302:	317c 87cf 0096 	move.w #-30769,150(a0)
                                    | DMAF_COPPER | DMAF_MASTER | DMAF_BLITHOG;
   //0b1000011111100000;
  
  //hw->dmacon = 0b1000011111111111;
	hw->intena = (1 << INTB_SETCLR) | (1 << INTB_INTEN) | (1 << INTB_VERTB);
    3308:	2079 0002 8520 	movea.l 28520 <hw>,a0
    330e:	317c c020 009a 	move.w #-16352,154(a0)
  
  Zoom_InitRun(); 
    3314:	4eba dfb0      	jsr 12c6 <Zoom_InitRun>(pc)

  int success = 1;
    3318:	7001           	moveq #1,d0
    331a:	2f40 0020      	move.l d0,32(sp)
  RunFrame();
    331e:	4eba d096      	jsr 3b6 <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    3322:	3039 0002 855e 	move.w 2855e <Zoom_Counter>,d0
    3328:	0c40 0008      	cmpi.w #8,d0
    332c:	6304           	bls.s 3332 <TestZoomSpeed+0x46>
    332e:	42af 0020      	clr.l 32(sp)
    
  Zoom_Dealloc();
    3332:	4eba e17c      	jsr 14b0 <Zoom_Dealloc>(pc)
  FreeSystem();
    3336:	4eba d49c      	jsr 7d4 <FreeSystem>(pc)

  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    333a:	4aaf 0020      	tst.l 32(sp)
    333e:	6642           	bne.s 3382 <TestZoomSpeed+0x96>
    3340:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3346:	2c40           	movea.l d0,a6
    3348:	4eae ffc4      	jsr -60(a6)
    334c:	2f40 001c      	move.l d0,28(sp)
    3350:	202f 001c      	move.l 28(sp),d0
    3354:	2f40 0018      	move.l d0,24(sp)
    3358:	2f7c 0001 802d 	move.l #98349,20(sp)
    335e:	0014 
    3360:	701c           	moveq #28,d0
    3362:	2f40 0010      	move.l d0,16(sp)
    3366:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    336c:	2c40           	movea.l d0,a6
    336e:	222f 0018      	move.l 24(sp),d1
    3372:	242f 0014      	move.l 20(sp),d2
    3376:	262f 0010      	move.l 16(sp),d3
    337a:	4eae ffd0      	jsr -48(a6)
    337e:	2f40 000c      	move.l d0,12(sp)

  //AddIntServer(INTB_VERTB, vbint);
  //RemIntServer(INTB_VERTB, vbint);
  
}
    3382:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3386:	4fef 0018      	lea 24(sp),sp
    338a:	4e75           	rts

0000338c <ZoomTestDisplay>:

void ZoomTestDisplay() {
    338c:	4fef ff38      	lea -200(sp),sp
    3390:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Zoom_Init();
    3394:	4eba e2ce      	jsr 1664 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    3398:	4eba e66c      	jsr 1a06 <PrepareDisplayZoom>(pc)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    339c:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    33a2:	4878 0010      	pea 10 <_start+0x10>
    33a6:	4879 0001 a5a0 	pea 1a5a0 <ClsSprites>
    33ac:	42a7           	clr.l -(sp)
    33ae:	2f00           	move.l d0,-(sp)
    33b0:	4eba f826      	jsr 2bd8 <TestCopperlistBatch>(pc)
    33b4:	4fef 0010      	lea 16(sp),sp
    33b8:	4a80           	tst.l d0
    33ba:	6642           	bne.s 33fe <ZoomTestDisplay+0x72>
    Write( Output(), 
    33bc:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    33c2:	2c40           	movea.l d0,a6
    33c4:	4eae ffc4      	jsr -60(a6)
    33c8:	2f40 00d0      	move.l d0,208(sp)
    33cc:	202f 00d0      	move.l 208(sp),d0
    33d0:	2f40 00cc      	move.l d0,204(sp)
    33d4:	2f7c 0001 804c 	move.l #98380,200(sp)
    33da:	00c8 
    33dc:	7045           	moveq #69,d0
    33de:	2f40 00c4      	move.l d0,196(sp)
    33e2:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    33e8:	2c40           	movea.l d0,a6
    33ea:	222f 00cc      	move.l 204(sp),d1
    33ee:	242f 00c8      	move.l 200(sp),d2
    33f2:	262f 00c4      	move.l 196(sp),d3
    33f6:	4eae ffd0      	jsr -48(a6)
    33fa:	2f40 00c0      	move.l d0,192(sp)
       "ZoomCopperlist: Sprite section of copper starting on pos 0 messed up\n", 
                                                                            69);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    33fe:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    3404:	4878 000c      	pea c <_start+0xc>
    3408:	4879 0001 a5e0 	pea 1a5e0 <ClScreen>
    340e:	4878 0010      	pea 10 <_start+0x10>
    3412:	2f00           	move.l d0,-(sp)
    3414:	4eba f7c2      	jsr 2bd8 <TestCopperlistBatch>(pc)
    3418:	4fef 0010      	lea 16(sp),sp
    341c:	4a80           	tst.l d0
    341e:	6642           	bne.s 3462 <ZoomTestDisplay+0xd6>
    Write( Output(), 
    3420:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3426:	2c40           	movea.l d0,a6
    3428:	4eae ffc4      	jsr -60(a6)
    342c:	2f40 00bc      	move.l d0,188(sp)
    3430:	202f 00bc      	move.l 188(sp),d0
    3434:	2f40 00b8      	move.l d0,184(sp)
    3438:	2f7c 0001 8092 	move.l #98450,180(sp)
    343e:	00b4 
    3440:	7046           	moveq #70,d0
    3442:	2f40 00b0      	move.l d0,176(sp)
    3446:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    344c:	2c40           	movea.l d0,a6
    344e:	222f 00b8      	move.l 184(sp),d1
    3452:	242f 00b4      	move.l 180(sp),d2
    3456:	262f 00b0      	move.l 176(sp),d3
    345a:	4eae ffd0      	jsr -48(a6)
    345e:	2f40 00ac      	move.l d0,172(sp)
      "ZoomCopperlist: Screen section of copper starting on pos 16 messed up\n",
                                                                            70);
  DrawBuffer = (ULONG *) 0x40000;
    3462:	23fc 0004 0000 	move.l #262144,28510 <DrawBuffer>
    3468:	0002 8510 
  ViewBuffer = (ULONG *) 0x50000;
    346c:	23fc 0005 0000 	move.l #327680,28514 <ViewBuffer>
    3472:	0002 8514 
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    3476:	2239 0002 8518 	move.l 28518 <DrawCopper>,d1
    347c:	2039 0002 8510 	move.l 28510 <DrawBuffer>,d0
    3482:	2f01           	move.l d1,-(sp)
    3484:	2f00           	move.l d0,-(sp)
    3486:	4eba ebda      	jsr 2062 <Zoom_SetBplPointers>(pc)
    348a:	508f           	addq.l #8,sp
  Zoom_SwapBuffers();
    348c:	4eba ec52      	jsr 20e0 <Zoom_SwapBuffers>(pc)
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    3490:	2039 0002 8510 	move.l 28510 <DrawBuffer>,d0
    3496:	0c80 0005 0000 	cmpi.l #327680,d0
    349c:	660e           	bne.s 34ac <ZoomTestDisplay+0x120>
    349e:	2039 0002 8514 	move.l 28514 <ViewBuffer>,d0
    34a4:	0c80 0004 0000 	cmpi.l #262144,d0
    34aa:	6742           	beq.s 34ee <ZoomTestDisplay+0x162>
    Write( Output(), 
    34ac:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    34b2:	2c40           	movea.l d0,a6
    34b4:	4eae ffc4      	jsr -60(a6)
    34b8:	2f40 00a8      	move.l d0,168(sp)
    34bc:	202f 00a8      	move.l 168(sp),d0
    34c0:	2f40 00a4      	move.l d0,164(sp)
    34c4:	2f7c 0001 80d9 	move.l #98521,160(sp)
    34ca:	00a0 
    34cc:	703b           	moveq #59,d0
    34ce:	2f40 009c      	move.l d0,156(sp)
    34d2:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    34d8:	2c40           	movea.l d0,a6
    34da:	222f 00a4      	move.l 164(sp),d1
    34de:	242f 00a0      	move.l 160(sp),d2
    34e2:	262f 009c      	move.l 156(sp),d3
    34e6:	4eae ffd0      	jsr -48(a6)
    34ea:	2f40 0098      	move.l d0,152(sp)
            "ZoomCopperlist: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    34ee:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    34f4:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    34fa:	4878 001c      	pea 1c <_start+0x1c>
    34fe:	2f00           	move.l d0,-(sp)
    3500:	4eba f714      	jsr 2c16 <TestCopperlistPos>(pc)
    3504:	4fef 000c      	lea 12(sp),sp
    3508:	4a80           	tst.l d0
    350a:	6642           	bne.s 354e <ZoomTestDisplay+0x1c2>
    Write(Output(), 
    350c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3512:	2c40           	movea.l d0,a6
    3514:	4eae ffc4      	jsr -60(a6)
    3518:	2f40 0094      	move.l d0,148(sp)
    351c:	202f 0094      	move.l 148(sp),d0
    3520:	2f40 0090      	move.l d0,144(sp)
    3524:	2f7c 0001 8115 	move.l #98581,140(sp)
    352a:	008c 
    352c:	703c           	moveq #60,d0
    352e:	2f40 0088      	move.l d0,136(sp)
    3532:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3538:	2c40           	movea.l d0,a6
    353a:	222f 0090      	move.l 144(sp),d1
    353e:	242f 008c      	move.l 140(sp),d2
    3542:	262f 0088      	move.l 136(sp),d3
    3546:	4eae ffd0      	jsr -48(a6)
    354a:	2f40 0084      	move.l d0,132(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    354e:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    3554:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    355a:	4878 001d      	pea 1d <_start+0x1d>
    355e:	2f00           	move.l d0,-(sp)
    3560:	4eba f6b4      	jsr 2c16 <TestCopperlistPos>(pc)
    3564:	4fef 000c      	lea 12(sp),sp
    3568:	4a80           	tst.l d0
    356a:	6642           	bne.s 35ae <ZoomTestDisplay+0x222>
    Write(Output(), 
    356c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3572:	2c40           	movea.l d0,a6
    3574:	4eae ffc4      	jsr -60(a6)
    3578:	2f40 0080      	move.l d0,128(sp)
    357c:	202f 0080      	move.l 128(sp),d0
    3580:	2f40 007c      	move.l d0,124(sp)
    3584:	2f7c 0001 8152 	move.l #98642,120(sp)
    358a:	0078 
    358c:	703c           	moveq #60,d0
    358e:	2f40 0074      	move.l d0,116(sp)
    3592:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3598:	2c40           	movea.l d0,a6
    359a:	222f 007c      	move.l 124(sp),d1
    359e:	242f 0078      	move.l 120(sp),d2
    35a2:	262f 0074      	move.l 116(sp),d3
    35a6:	4eae ffd0      	jsr -48(a6)
    35aa:	2f40 0070      	move.l d0,112(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1pl should be 00f4\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    35ae:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    35b4:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    35ba:	4878 001e      	pea 1e <_start+0x1e>
    35be:	2f00           	move.l d0,-(sp)
    35c0:	4eba f654      	jsr 2c16 <TestCopperlistPos>(pc)
    35c4:	4fef 000c      	lea 12(sp),sp
    35c8:	4a80           	tst.l d0
    35ca:	6642           	bne.s 360e <ZoomTestDisplay+0x282>
    Write(Output(), 
    35cc:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    35d2:	2c40           	movea.l d0,a6
    35d4:	4eae ffc4      	jsr -60(a6)
    35d8:	2f40 006c      	move.l d0,108(sp)
    35dc:	202f 006c      	move.l 108(sp),d0
    35e0:	2f40 0068      	move.l d0,104(sp)
    35e4:	2f7c 0001 818f 	move.l #98703,100(sp)
    35ea:	0064 
    35ec:	703c           	moveq #60,d0
    35ee:	2f40 0060      	move.l d0,96(sp)
    35f2:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    35f8:	2c40           	movea.l d0,a6
    35fa:	222f 0068      	move.l 104(sp),d1
    35fe:	242f 0064      	move.l 100(sp),d2
    3602:	262f 0060      	move.l 96(sp),d3
    3606:	4eae ffd0      	jsr -48(a6)
    360a:	2f40 005c      	move.l d0,92(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    360e:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    3614:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    361a:	4878 001f      	pea 1f <_start+0x1f>
    361e:	2f00           	move.l d0,-(sp)
    3620:	4eba f5f4      	jsr 2c16 <TestCopperlistPos>(pc)
    3624:	4fef 000c      	lea 12(sp),sp
    3628:	4a80           	tst.l d0
    362a:	6642           	bne.s 366e <ZoomTestDisplay+0x2e2>
    Write(Output(), 
    362c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3632:	2c40           	movea.l d0,a6
    3634:	4eae ffc4      	jsr -60(a6)
    3638:	2f40 0058      	move.l d0,88(sp)
    363c:	202f 0058      	move.l 88(sp),d0
    3640:	2f40 0054      	move.l d0,84(sp)
    3644:	2f7c 0001 81cc 	move.l #98764,80(sp)
    364a:	0050 
    364c:	703c           	moveq #60,d0
    364e:	2f40 004c      	move.l d0,76(sp)
    3652:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3658:	2c40           	movea.l d0,a6
    365a:	222f 0054      	move.l 84(sp),d1
    365e:	242f 0050      	move.l 80(sp),d2
    3662:	262f 004c      	move.l 76(sp),d3
    3666:	4eae ffd0      	jsr -48(a6)
    366a:	2f40 0048      	move.l d0,72(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2pl should be 0034\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    366e:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    3674:	4878 0020      	pea 20 <_start+0x20>
    3678:	4879 0001 a520 	pea 1a520 <ClColor>
    367e:	4878 0026      	pea 26 <_start+0x26>
    3682:	2f00           	move.l d0,-(sp)
    3684:	4eba f552      	jsr 2bd8 <TestCopperlistBatch>(pc)
    3688:	4fef 0010      	lea 16(sp),sp
    368c:	4a80           	tst.l d0
    368e:	6642           	bne.s 36d2 <ZoomTestDisplay+0x346>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    3690:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3696:	2c40           	movea.l d0,a6
    3698:	4eae ffc4      	jsr -60(a6)
    369c:	2f40 0044      	move.l d0,68(sp)
    36a0:	202f 0044      	move.l 68(sp),d0
    36a4:	2f40 0040      	move.l d0,64(sp)
    36a8:	2f7c 0001 8209 	move.l #98825,60(sp)
    36ae:	003c 
    36b0:	7025           	moveq #37,d0
    36b2:	2f40 0038      	move.l d0,56(sp)
    36b6:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    36bc:	2c40           	movea.l d0,a6
    36be:	222f 0040      	move.l 64(sp),d1
    36c2:	242f 003c      	move.l 60(sp),d2
    36c6:	262f 0038      	move.l 56(sp),d3
    36ca:	4eae ffd0      	jsr -48(a6)
    36ce:	2f40 0034      	move.l d0,52(sp)

  /*if(  TestCopperlistBatch(  Copperlist1, 71, Cl102ZoomRepeat, 21) == 0)
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36); */
  
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    36d2:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    36d8:	2f00           	move.l d0,-(sp)
    36da:	4878 000f      	pea f <_start+0xf>
    36de:	4eba ce7a      	jsr 55a <Zoom_Shrink102>(pc)
    36e2:	508f           	addq.l #8,sp
  if( TestCopperListZoom102( Copperlist1, 73, Cl102ZoomTest) == 0)
    36e4:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    36ea:	4879 0001 b7c0 	pea 1b7c0 <Cl102ZoomTest>
    36f0:	4878 0049      	pea 49 <_start+0x49>
    36f4:	2f00           	move.l d0,-(sp)
    36f6:	4eba 00c4      	jsr 37bc <TestCopperListZoom102>(pc)
    36fa:	4fef 000c      	lea 12(sp),sp
    36fe:	4a80           	tst.l d0
    3700:	6642           	bne.s 3744 <ZoomTestDisplay+0x3b8>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    3702:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3708:	2c40           	movea.l d0,a6
    370a:	4eae ffc4      	jsr -60(a6)
    370e:	2f40 0030      	move.l d0,48(sp)
    3712:	202f 0030      	move.l 48(sp),d0
    3716:	2f40 002c      	move.l d0,44(sp)
    371a:	2f7c 0001 822f 	move.l #98863,40(sp)
    3720:	0028 
    3722:	7025           	moveq #37,d0
    3724:	2f40 0024      	move.l d0,36(sp)
    3728:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    372e:	2c40           	movea.l d0,a6
    3730:	222f 002c      	move.l 44(sp),d1
    3734:	242f 0028      	move.l 40(sp),d2
    3738:	262f 0024      	move.l 36(sp),d3
    373c:	4eae ffd0      	jsr -48(a6)
    3740:	2f40 0020      	move.l d0,32(sp)

  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    3744:	2039 0002 8508 	move.l 28508 <Copperlist1>,d0
    374a:	4878 fffe      	pea fffffffe <_end+0xfffd7a86>
    374e:	4878 00bb      	pea bb <WaitBlt+0x7>
    3752:	2f00           	move.l d0,-(sp)
    3754:	4eba f4c0      	jsr 2c16 <TestCopperlistPos>(pc)
    3758:	4fef 000c      	lea 12(sp),sp
    375c:	4a80           	tst.l d0
    375e:	6642           	bne.s 37a2 <ZoomTestDisplay+0x416>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    3760:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3766:	2c40           	movea.l d0,a6
    3768:	4eae ffc4      	jsr -60(a6)
    376c:	2f40 001c      	move.l d0,28(sp)
    3770:	202f 001c      	move.l 28(sp),d0
    3774:	2f40 0018      	move.l d0,24(sp)
    3778:	2f7c 0001 8254 	move.l #98900,20(sp)
    377e:	0014 
    3780:	7032           	moveq #50,d0
    3782:	2f40 0010      	move.l d0,16(sp)
    3786:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    378c:	2c40           	movea.l d0,a6
    378e:	222f 0018      	move.l 24(sp),d1
    3792:	242f 0014      	move.l 20(sp),d2
    3796:	262f 0010      	move.l 16(sp),d3
    379a:	4eae ffd0      	jsr -48(a6)
    379e:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    37a2:	2f3c 0000 ff00 	move.l #65280,-(sp)
    37a8:	4878 031c      	pea 31c <RunDemo+0x6>
    37ac:	4eba c932      	jsr e0 <FreeDisplay>(pc)
    37b0:	508f           	addq.l #8,sp

}
    37b2:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    37b6:	4fef 00c8      	lea 200(sp),sp
    37ba:	4e75           	rts

000037bc <TestCopperListZoom102>:

int TestCopperListZoom102( ULONG *cl2test, UWORD position, 
                                                           ULONG *template4cl) {
    37bc:	598f           	subq.l #4,sp
    37be:	202f 000c      	move.l 12(sp),d0
    37c2:	3000           	move.w d0,d0
    37c4:	3f40 0002      	move.w d0,2(sp)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    37c8:	7000           	moveq #0,d0
    37ca:	302f 0002      	move.w 2(sp),d0
    37ce:	4878 001c      	pea 1c <_start+0x1c>
    37d2:	2f2f 0014      	move.l 20(sp),-(sp)
    37d6:	2f00           	move.l d0,-(sp)
    37d8:	2f2f 0014      	move.l 20(sp),-(sp)
    37dc:	4eba f3fa      	jsr 2bd8 <TestCopperlistBatch>(pc)
    37e0:	4fef 0010      	lea 16(sp),sp
    37e4:	4a80           	tst.l d0
    37e6:	6604           	bne.s 37ec <TestCopperListZoom102+0x30>
    return 0;
    37e8:	7000           	moveq #0,d0
    37ea:	6062           	bra.s 384e <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    37ec:	7078           	moveq #120,d0
    37ee:	d0af 0010      	add.l 16(sp),d0
    37f2:	7200           	moveq #0,d1
    37f4:	322f 0002      	move.w 2(sp),d1
    37f8:	307c 001e      	movea.w #30,a0
    37fc:	d1c1           	adda.l d1,a0
    37fe:	4878 0036      	pea 36 <_start+0x36>
    3802:	2f00           	move.l d0,-(sp)
    3804:	2f08           	move.l a0,-(sp)
    3806:	2f2f 0014      	move.l 20(sp),-(sp)
    380a:	4eba f3cc      	jsr 2bd8 <TestCopperlistBatch>(pc)
    380e:	4fef 0010      	lea 16(sp),sp
    3812:	4a80           	tst.l d0
    3814:	6604           	bne.s 381a <TestCopperListZoom102+0x5e>
    return 0;
    3816:	7000           	moveq #0,d0
    3818:	6034           	bra.s 384e <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    381a:	202f 0010      	move.l 16(sp),d0
    381e:	0680 0000 0158 	addi.l #344,d0
    3824:	7200           	moveq #0,d1
    3826:	322f 0002      	move.w 2(sp),d1
    382a:	307c 0056      	movea.w #86,a0
    382e:	d1c1           	adda.l d1,a0
    3830:	4878 001c      	pea 1c <_start+0x1c>
    3834:	2f00           	move.l d0,-(sp)
    3836:	2f08           	move.l a0,-(sp)
    3838:	2f2f 0014      	move.l 20(sp),-(sp)
    383c:	4eba f39a      	jsr 2bd8 <TestCopperlistBatch>(pc)
    3840:	4fef 0010      	lea 16(sp),sp
    3844:	4a80           	tst.l d0
    3846:	6604           	bne.s 384c <TestCopperListZoom102+0x90>
    return 0;
    3848:	7000           	moveq #0,d0
    384a:	6002           	bra.s 384e <TestCopperListZoom102+0x92>
 
  return 1;
    384c:	7001           	moveq #1,d0
}
    384e:	588f           	addq.l #4,sp
    3850:	4e75           	rts

00003852 <TestBlitleftOfZoom>:

void TestBlitleftOfZoom() {
    3852:	4fef ff94      	lea -108(sp),sp
    3856:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Zoom_Init();
    385a:	4eba de08      	jsr 1664 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    385e:	4eba e1a6      	jsr 1a06 <PrepareDisplayZoom>(pc)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    3862:	2f7c 0000 c800 	move.l #51200,116(sp)
    3868:	0074 
    386a:	7002           	moveq #2,d0
    386c:	2f40 0070      	move.l d0,112(sp)
    3870:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    3876:	2c40           	movea.l d0,a6
    3878:	202f 0074      	move.l 116(sp),d0
    387c:	222f 0070      	move.l 112(sp),d1
    3880:	4eae ff3a      	jsr -198(a6)
    3884:	2f40 006c      	move.l d0,108(sp)
    3888:	202f 006c      	move.l 108(sp),d0
    388c:	23c0 0002 8550 	move.l d0,28550 <Zoom_Source>
  if( Zoom_Source == 0) {
    3892:	2039 0002 8550 	move.l 28550 <Zoom_Source>,d0
    3898:	6646           	bne.s 38e0 <TestBlitleftOfZoom+0x8e>
    Write(  Output(), 
    389a:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    38a0:	2c40           	movea.l d0,a6
    38a2:	4eae ffc4      	jsr -60(a6)
    38a6:	2f40 001c      	move.l d0,28(sp)
    38aa:	202f 001c      	move.l 28(sp),d0
    38ae:	2f40 0018      	move.l d0,24(sp)
    38b2:	2f7c 0001 8287 	move.l #98951,20(sp)
    38b8:	0014 
    38ba:	7236           	moveq #54,d1
    38bc:	2f41 0010      	move.l d1,16(sp)
    38c0:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    38c6:	2c40           	movea.l d0,a6
    38c8:	222f 0018      	move.l 24(sp),d1
    38cc:	242f 0014      	move.l 20(sp),d2
    38d0:	262f 0010      	move.l 16(sp),d3
    38d4:	4eae ffd0      	jsr -48(a6)
    38d8:	2f40 000c      	move.l d0,12(sp)
    38dc:	6000 01fe      	bra.w 3adc <TestBlitleftOfZoom+0x28a>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  
  UWORD *tstsource = Zoom_Source;
    38e0:	2f79 0002 8550 	move.l 28550 <Zoom_Source>,104(sp)
    38e6:	0068 
  *tstsource++ = 0x0000;
    38e8:	202f 0068      	move.l 104(sp),d0
    38ec:	2200           	move.l d0,d1
    38ee:	5481           	addq.l #2,d1
    38f0:	2f41 0068      	move.l d1,104(sp)
    38f4:	2040           	movea.l d0,a0
    38f6:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    38f8:	206f 0068      	movea.l 104(sp),a0
    38fc:	30bc 0080      	move.w #128,(a0)
  tstsource += ZMLINESIZE/2-1;
    3900:	702e           	moveq #46,d0
    3902:	d1af 0068      	add.l d0,104(sp)
  *tstsource = 0x1000;
    3906:	206f 0068      	movea.l 104(sp),a0
    390a:	30bc 1000      	move.w #4096,(a0)
  tstsource++;
    390e:	54af 0068      	addq.l #2,104(sp)
  *tstsource = 0x8e88;
    3912:	206f 0068      	movea.l 104(sp),a0
    3916:	30bc 8e88      	move.w #-29048,(a0)
  tstsource += ZMLINESIZE/2-1;
    391a:	722e           	moveq #46,d1
    391c:	d3af 0068      	add.l d1,104(sp)

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
    3920:	2039 0002 8550 	move.l 28550 <Zoom_Source>,d0
    3926:	2200           	move.l d0,d1
    3928:	0681 0000 17d0 	addi.l #6096,d1
    392e:	2f41 0068      	move.l d1,104(sp)
  *tstsource++ = 0x0000;
    3932:	202f 0068      	move.l 104(sp),d0
    3936:	2200           	move.l d0,d1
    3938:	5481           	addq.l #2,d1
    393a:	2f41 0068      	move.l d1,104(sp)
    393e:	2040           	movea.l d0,a0
    3940:	4250           	clr.w (a0)
  *tstsource = 0x00ff;
    3942:	206f 0068      	movea.l 104(sp),a0
    3946:	30bc 00ff      	move.w #255,(a0)
  WaitBlit();
    394a:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    3950:	2c40           	movea.l d0,a6
    3952:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    3956:	4eba e226      	jsr 1b7e <Init_Blit>(pc)
  Init_ZoomBlit( 7, 16, 0);
    395a:	42a7           	clr.l -(sp)
    395c:	4878 0010      	pea 10 <_start+0x10>
    3960:	4878 0007      	pea 7 <_start+0x7>
    3964:	4eba e294      	jsr 1bfa <Init_ZoomBlit>(pc)
    3968:	4fef 000c      	lea 12(sp),sp
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    396c:	2239 0002 8510 	move.l 28510 <DrawBuffer>,d1
    3972:	2039 0002 8550 	move.l 28550 <Zoom_Source>,d0
    3978:	4878 0080      	pea 80 <_start+0x80>
    397c:	2f01           	move.l d1,-(sp)
    397e:	2f00           	move.l d0,-(sp)
    3980:	4eba d84e      	jsr 11d0 <Zoom_ZoomBlit>(pc)
    3984:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    3988:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    398e:	2c40           	movea.l d0,a6
    3990:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    3994:	2039 0002 8510 	move.l 28510 <DrawBuffer>,d0
    399a:	2200           	move.l d0,d1
    399c:	5481           	addq.l #2,d1
    399e:	2f41 0064      	move.l d1,100(sp)
  if( *destination != 0x0180) {
    39a2:	206f 0064      	movea.l 100(sp),a0
    39a6:	3010           	move.w (a0),d0
    39a8:	0c40 0180      	cmpi.w #384,d0
    39ac:	6742           	beq.s 39f0 <TestBlitleftOfZoom+0x19e>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    39ae:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    39b4:	2c40           	movea.l d0,a6
    39b6:	4eae ffc4      	jsr -60(a6)
    39ba:	2f40 0060      	move.l d0,96(sp)
    39be:	202f 0060      	move.l 96(sp),d0
    39c2:	2f40 005c      	move.l d0,92(sp)
    39c6:	2f7c 0001 82bf 	move.l #99007,88(sp)
    39cc:	0058 
    39ce:	701c           	moveq #28,d0
    39d0:	2f40 0054      	move.l d0,84(sp)
    39d4:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    39da:	2c40           	movea.l d0,a6
    39dc:	222f 005c      	move.l 92(sp),d1
    39e0:	242f 0058      	move.l 88(sp),d2
    39e4:	262f 0054      	move.l 84(sp),d3
    39e8:	4eae ffd0      	jsr -48(a6)
    39ec:	2f40 0050      	move.l d0,80(sp)
  }
  destination += ZMLINESIZE/2;
    39f0:	7230           	moveq #48,d1
    39f2:	d3af 0064      	add.l d1,100(sp)
  if( *destination != 0x1d88)
    39f6:	206f 0064      	movea.l 100(sp),a0
    39fa:	3010           	move.w (a0),d0
    39fc:	0c40 1d88      	cmpi.w #7560,d0
    3a00:	6742           	beq.s 3a44 <TestBlitleftOfZoom+0x1f2>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    3a02:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3a08:	2c40           	movea.l d0,a6
    3a0a:	4eae ffc4      	jsr -60(a6)
    3a0e:	2f40 004c      	move.l d0,76(sp)
    3a12:	202f 004c      	move.l 76(sp),d0
    3a16:	2f40 0048      	move.l d0,72(sp)
    3a1a:	2f7c 0001 82dc 	move.l #99036,68(sp)
    3a20:	0044 
    3a22:	701c           	moveq #28,d0
    3a24:	2f40 0040      	move.l d0,64(sp)
    3a28:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3a2e:	2c40           	movea.l d0,a6
    3a30:	222f 0048      	move.l 72(sp),d1
    3a34:	242f 0044      	move.l 68(sp),d2
    3a38:	262f 0040      	move.l 64(sp),d3
    3a3c:	4eae ffd0      	jsr -48(a6)
    3a40:	2f40 003c      	move.l d0,60(sp)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
    3a44:	2039 0002 8510 	move.l 28510 <DrawBuffer>,d0
    3a4a:	2200           	move.l d0,d1
    3a4c:	0681 0000 17d0 	addi.l #6096,d1
    3a52:	2f41 0064      	move.l d1,100(sp)
  destination++;
    3a56:	54af 0064      	addq.l #2,100(sp)
  if( *destination != 0x01ff) {
    3a5a:	206f 0064      	movea.l 100(sp),a0
    3a5e:	3010           	move.w (a0),d0
    3a60:	0c40 01ff      	cmpi.w #511,d0
    3a64:	6742           	beq.s 3aa8 <TestBlitleftOfZoom+0x256>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    3a66:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3a6c:	2c40           	movea.l d0,a6
    3a6e:	4eae ffc4      	jsr -60(a6)
    3a72:	2f40 0038      	move.l d0,56(sp)
    3a76:	202f 0038      	move.l 56(sp),d0
    3a7a:	2f40 0034      	move.l d0,52(sp)
    3a7e:	2f7c 0001 82f9 	move.l #99065,48(sp)
    3a84:	0030 
    3a86:	701a           	moveq #26,d0
    3a88:	2f40 002c      	move.l d0,44(sp)
    3a8c:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3a92:	2c40           	movea.l d0,a6
    3a94:	222f 0034      	move.l 52(sp),d1
    3a98:	242f 0030      	move.l 48(sp),d2
    3a9c:	262f 002c      	move.l 44(sp),d3
    3aa0:	4eae ffd0      	jsr -48(a6)
    3aa4:	2f40 0028      	move.l d0,40(sp)
  }
  FreeMem( Zoom_Source, 40*256*5);
    3aa8:	2f79 0002 8550 	move.l 28550 <Zoom_Source>,36(sp)
    3aae:	0024 
    3ab0:	2f7c 0000 c800 	move.l #51200,32(sp)
    3ab6:	0020 
    3ab8:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    3abe:	2c40           	movea.l d0,a6
    3ac0:	226f 0024      	movea.l 36(sp),a1
    3ac4:	202f 0020      	move.l 32(sp),d0
    3ac8:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    3acc:	2f3c 0000 ff00 	move.l #65280,-(sp)
    3ad2:	4878 031c      	pea 31c <RunDemo+0x6>
    3ad6:	4eba c608      	jsr e0 <FreeDisplay>(pc)
    3ada:	508f           	addq.l #8,sp
}
    3adc:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3ae0:	4fef 006c      	lea 108(sp),sp
    3ae4:	4e75           	rts

00003ae6 <TestCopyWord>:

void TestCopyWord() {
    3ae6:	4fef ff74      	lea -140(sp),sp
    3aea:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    3aee:	2f7c 0000 05a0 	move.l #1440,136(sp)
    3af4:	0088 
    3af6:	7002           	moveq #2,d0
    3af8:	2f40 0084      	move.l d0,132(sp)
    3afc:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    3b02:	2c40           	movea.l d0,a6
    3b04:	202f 0088      	move.l 136(sp),d0
    3b08:	222f 0084      	move.l 132(sp),d1
    3b0c:	4eae ff3a      	jsr -198(a6)
    3b10:	2f40 0080      	move.l d0,128(sp)
    3b14:	202f 0080      	move.l 128(sp),d0
    3b18:	2f40 007c      	move.l d0,124(sp)
  if( source == 0) {
    3b1c:	6646           	bne.s 3b64 <TestCopyWord+0x7e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3b1e:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3b24:	2c40           	movea.l d0,a6
    3b26:	4eae ffc4      	jsr -60(a6)
    3b2a:	2f40 001c      	move.l d0,28(sp)
    3b2e:	202f 001c      	move.l 28(sp),d0
    3b32:	2f40 0018      	move.l d0,24(sp)
    3b36:	2f7c 0001 8314 	move.l #99092,20(sp)
    3b3c:	0014 
    3b3e:	7235           	moveq #53,d1
    3b40:	2f41 0010      	move.l d1,16(sp)
    3b44:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3b4a:	2c40           	movea.l d0,a6
    3b4c:	222f 0018      	move.l 24(sp),d1
    3b50:	242f 0014      	move.l 20(sp),d2
    3b54:	262f 0010      	move.l 16(sp),d3
    3b58:	4eae ffd0      	jsr -48(a6)
    3b5c:	2f40 000c      	move.l d0,12(sp)
    3b60:	6000 026c      	bra.w 3dce <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    3b64:	2f7c 0000 05a0 	move.l #1440,120(sp)
    3b6a:	0078 
    3b6c:	7002           	moveq #2,d0
    3b6e:	2f40 0074      	move.l d0,116(sp)
    3b72:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    3b78:	2c40           	movea.l d0,a6
    3b7a:	202f 0078      	move.l 120(sp),d0
    3b7e:	222f 0074      	move.l 116(sp),d1
    3b82:	4eae ff3a      	jsr -198(a6)
    3b86:	2f40 0070      	move.l d0,112(sp)
    3b8a:	202f 0070      	move.l 112(sp),d0
    3b8e:	2f40 006c      	move.l d0,108(sp)
  if( destination == 0) {
    3b92:	6646           	bne.s 3bda <TestCopyWord+0xf4>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3b94:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3b9a:	2c40           	movea.l d0,a6
    3b9c:	4eae ffc4      	jsr -60(a6)
    3ba0:	2f40 0030      	move.l d0,48(sp)
    3ba4:	202f 0030      	move.l 48(sp),d0
    3ba8:	2f40 002c      	move.l d0,44(sp)
    3bac:	2f7c 0001 8314 	move.l #99092,40(sp)
    3bb2:	0028 
    3bb4:	7235           	moveq #53,d1
    3bb6:	2f41 0024      	move.l d1,36(sp)
    3bba:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3bc0:	2c40           	movea.l d0,a6
    3bc2:	222f 002c      	move.l 44(sp),d1
    3bc6:	242f 0028      	move.l 40(sp),d2
    3bca:	262f 0024      	move.l 36(sp),d3
    3bce:	4eae ffd0      	jsr -48(a6)
    3bd2:	2f40 0020      	move.l d0,32(sp)
    3bd6:	6000 01f6      	bra.w 3dce <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
    3bda:	2f6f 007c 0094 	move.l 124(sp),148(sp)
  for( int i=0; i<8;i++) {
    3be0:	42af 0090      	clr.l 144(sp)
    3be4:	6000 0086      	bra.w 3c6c <TestCopyWord+0x186>
    *tmp++ = 0;
    3be8:	202f 0094      	move.l 148(sp),d0
    3bec:	2200           	move.l d0,d1
    3bee:	5481           	addq.l #2,d1
    3bf0:	2f41 0094      	move.l d1,148(sp)
    3bf4:	2040           	movea.l d0,a0
    3bf6:	4250           	clr.w (a0)
    *tmp++ = 0xaaaa;
    3bf8:	202f 0094      	move.l 148(sp),d0
    3bfc:	2200           	move.l d0,d1
    3bfe:	5481           	addq.l #2,d1
    3c00:	2f41 0094      	move.l d1,148(sp)
    3c04:	2040           	movea.l d0,a0
    3c06:	30bc aaaa      	move.w #-21846,(a0)
    *tmp++ = 0xaaaa;
    3c0a:	202f 0094      	move.l 148(sp),d0
    3c0e:	2200           	move.l d0,d1
    3c10:	5481           	addq.l #2,d1
    3c12:	2f41 0094      	move.l d1,148(sp)
    3c16:	2040           	movea.l d0,a0
    3c18:	30bc aaaa      	move.w #-21846,(a0)
    *tmp = 0;
    3c1c:	206f 0094      	movea.l 148(sp),a0
    3c20:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    3c22:	702a           	moveq #42,d0
    3c24:	d1af 0094      	add.l d0,148(sp)
    *tmp++ = 0;
    3c28:	202f 0094      	move.l 148(sp),d0
    3c2c:	2200           	move.l d0,d1
    3c2e:	5481           	addq.l #2,d1
    3c30:	2f41 0094      	move.l d1,148(sp)
    3c34:	2040           	movea.l d0,a0
    3c36:	4250           	clr.w (a0)
    *tmp++ = 0x5555;
    3c38:	202f 0094      	move.l 148(sp),d0
    3c3c:	2200           	move.l d0,d1
    3c3e:	5481           	addq.l #2,d1
    3c40:	2f41 0094      	move.l d1,148(sp)
    3c44:	2040           	movea.l d0,a0
    3c46:	30bc 5555      	move.w #21845,(a0)
    *tmp++ = 0x5555;
    3c4a:	202f 0094      	move.l 148(sp),d0
    3c4e:	2200           	move.l d0,d1
    3c50:	5481           	addq.l #2,d1
    3c52:	2f41 0094      	move.l d1,148(sp)
    3c56:	2040           	movea.l d0,a0
    3c58:	30bc 5555      	move.w #21845,(a0)
    *tmp = 0;
    3c5c:	206f 0094      	movea.l 148(sp),a0
    3c60:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    3c62:	702a           	moveq #42,d0
    3c64:	d1af 0094      	add.l d0,148(sp)
  for( int i=0; i<8;i++) {
    3c68:	52af 0090      	addq.l #1,144(sp)
    3c6c:	7207           	moveq #7,d1
    3c6e:	b2af 0090      	cmp.l 144(sp),d1
    3c72:	6c00 ff74      	bge.w 3be8 <TestCopyWord+0x102>
  }
  tmp = destination;
    3c76:	2f6f 006c 0094 	move.l 108(sp),148(sp)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3c7c:	42af 008c      	clr.l 140(sp)
    3c80:	6014           	bra.s 3c96 <TestCopyWord+0x1b0>
    *tmp++ = 0;
    3c82:	202f 0094      	move.l 148(sp),d0
    3c86:	2200           	move.l d0,d1
    3c88:	5481           	addq.l #2,d1
    3c8a:	2f41 0094      	move.l d1,148(sp)
    3c8e:	2040           	movea.l d0,a0
    3c90:	4250           	clr.w (a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3c92:	52af 008c      	addq.l #1,140(sp)
    3c96:	0caf 0000 02cf 	cmpi.l #719,140(sp)
    3c9c:	008c 
    3c9e:	6fe2           	ble.s 3c82 <TestCopyWord+0x19c>
  }

  WaitBlit();
    3ca0:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    3ca6:	2c40           	movea.l d0,a6
    3ca8:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
    3cac:	4eba d9b6      	jsr 1664 <Zoom_Init>(pc)
  Init_Copy( 3);
    3cb0:	4878 0003      	pea 3 <_start+0x3>
    3cb4:	4eba dfe8      	jsr 1c9e <Init_Copy>(pc)
    3cb8:	588f           	addq.l #4,sp
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
    3cba:	202f 007c      	move.l 124(sp),d0
    3cbe:	5480           	addq.l #2,d0
    3cc0:	4878 0010      	pea 10 <_start+0x10>
    3cc4:	2f2f 0070      	move.l 112(sp),-(sp)
    3cc8:	2f00           	move.l d0,-(sp)
    3cca:	4eba d4c6      	jsr 1192 <Zoom_CopyWord>(pc)
    3cce:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    3cd2:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    3cd8:	2c40           	movea.l d0,a6
    3cda:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
    3cde:	202f 006c      	move.l 108(sp),d0
    3ce2:	5480           	addq.l #2,d0
    3ce4:	2f40 0094      	move.l d0,148(sp)
  if( *tmp != 0x5555) 
    3ce8:	206f 0094      	movea.l 148(sp),a0
    3cec:	3010           	move.w (a0),d0
    3cee:	0c40 5555      	cmpi.w #21845,d0
    3cf2:	6742           	beq.s 3d36 <TestCopyWord+0x250>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    3cf4:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3cfa:	2c40           	movea.l d0,a6
    3cfc:	4eae ffc4      	jsr -60(a6)
    3d00:	2f40 0068      	move.l d0,104(sp)
    3d04:	202f 0068      	move.l 104(sp),d0
    3d08:	2f40 0064      	move.l d0,100(sp)
    3d0c:	2f7c 0001 834a 	move.l #99146,96(sp)
    3d12:	0060 
    3d14:	721f           	moveq #31,d1
    3d16:	2f41 005c      	move.l d1,92(sp)
    3d1a:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3d20:	2c40           	movea.l d0,a6
    3d22:	222f 0064      	move.l 100(sp),d1
    3d26:	242f 0060      	move.l 96(sp),d2
    3d2a:	262f 005c      	move.l 92(sp),d3
    3d2e:	4eae ffd0      	jsr -48(a6)
    3d32:	2f40 0058      	move.l d0,88(sp)
  tmp += ZMLINESIZE/2;
    3d36:	7030           	moveq #48,d0
    3d38:	d1af 0094      	add.l d0,148(sp)
  if( *tmp != 0xaaaa)
    3d3c:	206f 0094      	movea.l 148(sp),a0
    3d40:	3010           	move.w (a0),d0
    3d42:	0c40 aaaa      	cmpi.w #-21846,d0
    3d46:	6742           	beq.s 3d8a <TestCopyWord+0x2a4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    3d48:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3d4e:	2c40           	movea.l d0,a6
    3d50:	4eae ffc4      	jsr -60(a6)
    3d54:	2f40 0054      	move.l d0,84(sp)
    3d58:	202f 0054      	move.l 84(sp),d0
    3d5c:	2f40 0050      	move.l d0,80(sp)
    3d60:	2f7c 0001 836a 	move.l #99178,76(sp)
    3d66:	004c 
    3d68:	7220           	moveq #32,d1
    3d6a:	2f41 0048      	move.l d1,72(sp)
    3d6e:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3d74:	2c40           	movea.l d0,a6
    3d76:	222f 0050      	move.l 80(sp),d1
    3d7a:	242f 004c      	move.l 76(sp),d2
    3d7e:	262f 0048      	move.l 72(sp),d3
    3d82:	4eae ffd0      	jsr -48(a6)
    3d86:	2f40 0044      	move.l d0,68(sp)
  
  FreeMem( source,ZMLINESIZE*30);
    3d8a:	2f6f 007c 0040 	move.l 124(sp),64(sp)
    3d90:	2f7c 0000 05a0 	move.l #1440,60(sp)
    3d96:	003c 
    3d98:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    3d9e:	2c40           	movea.l d0,a6
    3da0:	226f 0040      	movea.l 64(sp),a1
    3da4:	202f 003c      	move.l 60(sp),d0
    3da8:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    3dac:	2f6f 006c 0038 	move.l 108(sp),56(sp)
    3db2:	2f7c 0000 05a0 	move.l #1440,52(sp)
    3db8:	0034 
    3dba:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    3dc0:	2c40           	movea.l d0,a6
    3dc2:	226f 0038      	movea.l 56(sp),a1
    3dc6:	202f 0034      	move.l 52(sp),d0
    3dca:	4eae ff2e      	jsr -210(a6)
}
    3dce:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3dd2:	4fef 008c      	lea 140(sp),sp
    3dd6:	4e75           	rts

00003dd8 <TestZoom4PictureOn5Planes>:
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */


void TestZoom4PictureOn5Planes() {
    3dd8:	4fef ff74      	lea -140(sp),sp
    3ddc:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3de0:	2f7c 0001 1440 	move.l #70720,102(sp)
    3de6:	0066 
    3de8:	7002           	moveq #2,d0
    3dea:	2f40 0062      	move.l d0,98(sp)
    3dee:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    3df4:	2c40           	movea.l d0,a6
    3df6:	202f 0066      	move.l 102(sp),d0
    3dfa:	222f 0062      	move.l 98(sp),d1
    3dfe:	4eae ff3a      	jsr -198(a6)
    3e02:	2f40 005e      	move.l d0,94(sp)
    3e06:	202f 005e      	move.l 94(sp),d0
    3e0a:	2f40 005a      	move.l d0,90(sp)
  if( source == 0) {
    3e0e:	6646           	bne.s 3e56 <TestZoom4PictureOn5Planes+0x7e>
    Write(  Output(), 
    3e10:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3e16:	2c40           	movea.l d0,a6
    3e18:	4eae ffc4      	jsr -60(a6)
    3e1c:	2f40 001e      	move.l d0,30(sp)
    3e20:	202f 001e      	move.l 30(sp),d0
    3e24:	2f40 001a      	move.l d0,26(sp)
    3e28:	2f7c 0001 838b 	move.l #99211,22(sp)
    3e2e:	0016 
    3e30:	7239           	moveq #57,d1
    3e32:	2f41 0012      	move.l d1,18(sp)
    3e36:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3e3c:	2c40           	movea.l d0,a6
    3e3e:	222f 001a      	move.l 26(sp),d1
    3e42:	242f 0016      	move.l 22(sp),d2
    3e46:	262f 0012      	move.l 18(sp),d3
    3e4a:	4eae ffd0      	jsr -48(a6)
    3e4e:	2f40 000e      	move.l d0,14(sp)
    3e52:	6000 0266      	bra.w 40ba <TestZoom4PictureOn5Planes+0x2e2>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3e56:	2f7c 0001 1440 	move.l #70720,86(sp)
    3e5c:	0056 
    3e5e:	7002           	moveq #2,d0
    3e60:	2f40 0052      	move.l d0,82(sp)
    3e64:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    3e6a:	2c40           	movea.l d0,a6
    3e6c:	202f 0056      	move.l 86(sp),d0
    3e70:	222f 0052      	move.l 82(sp),d1
    3e74:	4eae ff3a      	jsr -198(a6)
    3e78:	2f40 004e      	move.l d0,78(sp)
    3e7c:	202f 004e      	move.l 78(sp),d0
    3e80:	2f40 004a      	move.l d0,74(sp)
  if( destination == 0) {
    3e84:	6646           	bne.s 3ecc <TestZoom4PictureOn5Planes+0xf4>
    Write(  Output(), 
    3e86:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3e8c:	2c40           	movea.l d0,a6
    3e8e:	4eae ffc4      	jsr -60(a6)
    3e92:	2f40 0032      	move.l d0,50(sp)
    3e96:	202f 0032      	move.l 50(sp),d0
    3e9a:	2f40 002e      	move.l d0,46(sp)
    3e9e:	2f7c 0001 83c5 	move.l #99269,42(sp)
    3ea4:	002a 
    3ea6:	723d           	moveq #61,d1
    3ea8:	2f41 0026      	move.l d1,38(sp)
    3eac:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    3eb2:	2c40           	movea.l d0,a6
    3eb4:	222f 002e      	move.l 46(sp),d1
    3eb8:	242f 002a      	move.l 42(sp),d2
    3ebc:	262f 0026      	move.l 38(sp),d3
    3ec0:	4eae ffd0      	jsr -48(a6)
    3ec4:	2f40 0022      	move.l d0,34(sp)
    3ec8:	6000 01f0      	bra.w 40ba <TestZoom4PictureOn5Planes+0x2e2>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3ecc:	2f6f 005a 0094 	move.l 90(sp),148(sp)
  for(int i=0;i<128+8;i++) {
    3ed2:	42af 0090      	clr.l 144(sp)
    3ed6:	6050           	bra.s 3f28 <TestZoom4PictureOn5Planes+0x150>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3ed8:	42af 008c      	clr.l 140(sp)
    3edc:	6018           	bra.s 3ef6 <TestZoom4PictureOn5Planes+0x11e>
      *tmp4source++ = 0x55555555;
    3ede:	202f 0094      	move.l 148(sp),d0
    3ee2:	2200           	move.l d0,d1
    3ee4:	5881           	addq.l #4,d1
    3ee6:	2f41 0094      	move.l d1,148(sp)
    3eea:	2040           	movea.l d0,a0
    3eec:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3ef2:	52af 008c      	addq.l #1,140(sp)
    3ef6:	703b           	moveq #59,d0
    3ef8:	b0af 008c      	cmp.l 140(sp),d0
    3efc:	6ce0           	bge.s 3ede <TestZoom4PictureOn5Planes+0x106>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3efe:	42af 0088      	clr.l 136(sp)
    3f02:	6018           	bra.s 3f1c <TestZoom4PictureOn5Planes+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3f04:	202f 0094      	move.l 148(sp),d0
    3f08:	2200           	move.l d0,d1
    3f0a:	5881           	addq.l #4,d1
    3f0c:	2f41 0094      	move.l d1,148(sp)
    3f10:	2040           	movea.l d0,a0
    3f12:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3f18:	52af 0088      	addq.l #1,136(sp)
    3f1c:	703b           	moveq #59,d0
    3f1e:	b0af 0088      	cmp.l 136(sp),d0
    3f22:	6ce0           	bge.s 3f04 <TestZoom4PictureOn5Planes+0x12c>
  for(int i=0;i<128+8;i++) {
    3f24:	52af 0090      	addq.l #1,144(sp)
    3f28:	0caf 0000 0087 	cmpi.l #135,144(sp)
    3f2e:	0090 
    3f30:	6fa6           	ble.s 3ed8 <TestZoom4PictureOn5Planes+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3f32:	4878 0005      	pea 5 <_start+0x5>
    3f36:	42a7           	clr.l -(sp)
    3f38:	2f2f 0052      	move.l 82(sp),-(sp)
    3f3c:	2f2f 0066      	move.l 102(sp),-(sp)
    3f40:	4eba dd96      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    3f44:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3f48:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    3f4e:	2c40           	movea.l d0,a6
    3f50:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3f54:	222f 004a      	move.l 74(sp),d1
    3f58:	5881           	addq.l #4,d1
    3f5a:	2f41 0084      	move.l d1,132(sp)
  UWORD *valsupposed = destlinezoom1;
    3f5e:	2f7c 0001 b9e4 	move.l #113124,70(sp)
    3f64:	0046 
  UWORD mask = 0xffff;
    3f66:	3f7c ffff 0082 	move.w #-1,130(sp)
  for(int i=0;i<14;i++) {
    3f6c:	42af 007e      	clr.l 126(sp)
    3f70:	6000 00a8      	bra.w 401a <TestZoom4PictureOn5Planes+0x242>
    for(int i2=0;i2<18;i2++) { 
    3f74:	42af 007a      	clr.l 122(sp)
    3f78:	604e           	bra.s 3fc8 <TestZoom4PictureOn5Planes+0x1f0>
      for( int i3=0;i3<5;i3++) {
    3f7a:	42af 0076      	clr.l 118(sp)
    3f7e:	6038           	bra.s 3fb8 <TestZoom4PictureOn5Planes+0x1e0>
        TestRow( valsupposed, valactual, mask, i2+i*19);
    3f80:	222f 007e      	move.l 126(sp),d1
    3f84:	2001           	move.l d1,d0
    3f86:	e788           	lsl.l #3,d0
    3f88:	d081           	add.l d1,d0
    3f8a:	d080           	add.l d0,d0
    3f8c:	d081           	add.l d1,d0
    3f8e:	2200           	move.l d0,d1
    3f90:	d2af 007a      	add.l 122(sp),d1
    3f94:	7000           	moveq #0,d0
    3f96:	302f 0082      	move.w 130(sp),d0
    3f9a:	2f01           	move.l d1,-(sp)
    3f9c:	2f00           	move.l d0,-(sp)
    3f9e:	2f2f 008c      	move.l 140(sp),-(sp)
    3fa2:	2f2f 0052      	move.l 82(sp),-(sp)
    3fa6:	4eba 2f7e      	jsr 6f26 <TestRow>(pc)
    3faa:	4fef 0010      	lea 16(sp),sp
        valactual += ZMLINESIZE/2;
    3fae:	7030           	moveq #48,d0
    3fb0:	d1af 0084      	add.l d0,132(sp)
      for( int i3=0;i3<5;i3++) {
    3fb4:	52af 0076      	addq.l #1,118(sp)
    3fb8:	7204           	moveq #4,d1
    3fba:	b2af 0076      	cmp.l 118(sp),d1
    3fbe:	6cc0           	bge.s 3f80 <TestZoom4PictureOn5Planes+0x1a8>
      }
      mask = mask ^ 0xffff;
    3fc0:	466f 0082      	not.w 130(sp)
    for(int i2=0;i2<18;i2++) { 
    3fc4:	52af 007a      	addq.l #1,122(sp)
    3fc8:	7011           	moveq #17,d0
    3fca:	b0af 007a      	cmp.l 122(sp),d0
    3fce:	6caa           	bge.s 3f7a <TestZoom4PictureOn5Planes+0x1a2>
    }
    for( int i3=0;i3<5;i3++) {
    3fd0:	42af 0072      	clr.l 114(sp)
    3fd4:	6038           	bra.s 400e <TestZoom4PictureOn5Planes+0x236>
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3fd6:	222f 007e      	move.l 126(sp),d1
    3fda:	2001           	move.l d1,d0
    3fdc:	e788           	lsl.l #3,d0
    3fde:	d081           	add.l d1,d0
    3fe0:	d080           	add.l d0,d0
    3fe2:	2040           	movea.l d0,a0
    3fe4:	d1c1           	adda.l d1,a0
    3fe6:	41e8 0012      	lea 18(a0),a0
    3fea:	7000           	moveq #0,d0
    3fec:	302f 0082      	move.w 130(sp),d0
    3ff0:	2f08           	move.l a0,-(sp)
    3ff2:	2f00           	move.l d0,-(sp)
    3ff4:	2f2f 008c      	move.l 140(sp),-(sp)
    3ff8:	2f2f 0052      	move.l 82(sp),-(sp)
    3ffc:	4eba 2f28      	jsr 6f26 <TestRow>(pc)
    4000:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4004:	7230           	moveq #48,d1
    4006:	d3af 0084      	add.l d1,132(sp)
    for( int i3=0;i3<5;i3++) {
    400a:	52af 0072      	addq.l #1,114(sp)
    400e:	7004           	moveq #4,d0
    4010:	b0af 0072      	cmp.l 114(sp),d0
    4014:	6cc0           	bge.s 3fd6 <TestZoom4PictureOn5Planes+0x1fe>
  for(int i=0;i<14;i++) {
    4016:	52af 007e      	addq.l #1,126(sp)
    401a:	720d           	moveq #13,d1
    401c:	b2af 007e      	cmp.l 126(sp),d1
    4020:	6c00 ff52      	bge.w 3f74 <TestZoom4PictureOn5Planes+0x19c>
    }
  }
  for(int i2=0;i2<4;i2++) { 
    4024:	42af 006e      	clr.l 110(sp)
    4028:	6044           	bra.s 406e <TestZoom4PictureOn5Planes+0x296>
    for( int i3=0;i3<5;i3++) {
    402a:	42af 006a      	clr.l 106(sp)
    402e:	602e           	bra.s 405e <TestZoom4PictureOn5Planes+0x286>
      TestRow( valsupposed, valactual, mask, i2+265);
    4030:	222f 006e      	move.l 110(sp),d1
    4034:	0681 0000 0109 	addi.l #265,d1
    403a:	7000           	moveq #0,d0
    403c:	302f 0082      	move.w 130(sp),d0
    4040:	2f01           	move.l d1,-(sp)
    4042:	2f00           	move.l d0,-(sp)
    4044:	2f2f 008c      	move.l 140(sp),-(sp)
    4048:	2f2f 0052      	move.l 82(sp),-(sp)
    404c:	4eba 2ed8      	jsr 6f26 <TestRow>(pc)
    4050:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4054:	7030           	moveq #48,d0
    4056:	d1af 0084      	add.l d0,132(sp)
    for( int i3=0;i3<5;i3++) {
    405a:	52af 006a      	addq.l #1,106(sp)
    405e:	7204           	moveq #4,d1
    4060:	b2af 006a      	cmp.l 106(sp),d1
    4064:	6cca           	bge.s 4030 <TestZoom4PictureOn5Planes+0x258>
    }
    mask = mask ^ 0xffff;
    4066:	466f 0082      	not.w 130(sp)
  for(int i2=0;i2<4;i2++) { 
    406a:	52af 006e      	addq.l #1,110(sp)
    406e:	7003           	moveq #3,d0
    4070:	b0af 006e      	cmp.l 110(sp),d0
    4074:	6cb4           	bge.s 402a <TestZoom4PictureOn5Planes+0x252>
  } 
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    4076:	2f6f 005a 0042 	move.l 90(sp),66(sp)
    407c:	2f7c 0001 1440 	move.l #70720,62(sp)
    4082:	003e 
    4084:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    408a:	2c40           	movea.l d0,a6
    408c:	226f 0042      	movea.l 66(sp),a1
    4090:	202f 003e      	move.l 62(sp),d0
    4094:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    4098:	2f6f 004a 003a 	move.l 74(sp),58(sp)
    409e:	2f7c 0001 1440 	move.l #70720,54(sp)
    40a4:	0036 
    40a6:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    40ac:	2c40           	movea.l d0,a6
    40ae:	226f 003a      	movea.l 58(sp),a1
    40b2:	202f 0036      	move.l 54(sp),d0
    40b6:	4eae ff2e      	jsr -210(a6)
}
    40ba:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    40be:	4fef 008c      	lea 140(sp),sp
    40c2:	4e75           	rts

000040c4 <TestZoom4Picture>:

void TestZoom4Picture() {
    40c4:	4fef fe30      	lea -464(sp),sp
    40c8:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    40cc:	2f7c 0000 3740 	move.l #14144,106(sp)
    40d2:	006a 
    40d4:	7002           	moveq #2,d0
    40d6:	2f40 0066      	move.l d0,102(sp)
    40da:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    40e0:	2c40           	movea.l d0,a6
    40e2:	202f 006a      	move.l 106(sp),d0
    40e6:	222f 0066      	move.l 102(sp),d1
    40ea:	4eae ff3a      	jsr -198(a6)
    40ee:	2f40 0062      	move.l d0,98(sp)
    40f2:	202f 0062      	move.l 98(sp),d0
    40f6:	2f40 005e      	move.l d0,94(sp)
  if( source == 0) {
    40fa:	6646           	bne.s 4142 <TestZoom4Picture+0x7e>
    Write(  Output(), 
    40fc:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    4102:	2c40           	movea.l d0,a6
    4104:	4eae ffc4      	jsr -60(a6)
    4108:	2f40 001e      	move.l d0,30(sp)
    410c:	202f 001e      	move.l 30(sp),d0
    4110:	2f40 001a      	move.l d0,26(sp)
    4114:	2f7c 0001 838b 	move.l #99211,22(sp)
    411a:	0016 
    411c:	7239           	moveq #57,d1
    411e:	2f41 0012      	move.l d1,18(sp)
    4122:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    4128:	2c40           	movea.l d0,a6
    412a:	222f 001a      	move.l 26(sp),d1
    412e:	242f 0016      	move.l 22(sp),d2
    4132:	262f 0012      	move.l 18(sp),d3
    4136:	4eae ffd0      	jsr -48(a6)
    413a:	2f40 000e      	move.l d0,14(sp)
    413e:	6000 2ddc      	bra.w 6f1c <TestZoom4Picture+0x2e58>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    4142:	2f7c 0000 3740 	move.l #14144,90(sp)
    4148:	005a 
    414a:	7002           	moveq #2,d0
    414c:	2f40 0056      	move.l d0,86(sp)
    4150:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    4156:	2c40           	movea.l d0,a6
    4158:	202f 005a      	move.l 90(sp),d0
    415c:	222f 0056      	move.l 86(sp),d1
    4160:	4eae ff3a      	jsr -198(a6)
    4164:	2f40 0052      	move.l d0,82(sp)
    4168:	202f 0052      	move.l 82(sp),d0
    416c:	2f40 004e      	move.l d0,78(sp)
  if( destination == 0) {
    4170:	6646           	bne.s 41b8 <TestZoom4Picture+0xf4>
    Write(  Output(), 
    4172:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    4178:	2c40           	movea.l d0,a6
    417a:	4eae ffc4      	jsr -60(a6)
    417e:	2f40 0032      	move.l d0,50(sp)
    4182:	202f 0032      	move.l 50(sp),d0
    4186:	2f40 002e      	move.l d0,46(sp)
    418a:	2f7c 0001 83c5 	move.l #99269,42(sp)
    4190:	002a 
    4192:	723d           	moveq #61,d1
    4194:	2f41 0026      	move.l d1,38(sp)
    4198:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    419e:	2c40           	movea.l d0,a6
    41a0:	222f 002e      	move.l 46(sp),d1
    41a4:	242f 002a      	move.l 42(sp),d2
    41a8:	262f 0026      	move.l 38(sp),d3
    41ac:	4eae ffd0      	jsr -48(a6)
    41b0:	2f40 0022      	move.l d0,34(sp)
    41b4:	6000 2d66      	bra.w 6f1c <TestZoom4Picture+0x2e58>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    41b8:	2f6f 005e 01d8 	move.l 94(sp),472(sp)
  for(int i=0;i<128+8;i++) {
    41be:	42af 01d4      	clr.l 468(sp)
    41c2:	6050           	bra.s 4214 <TestZoom4Picture+0x150>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    41c4:	42af 01d0      	clr.l 464(sp)
    41c8:	6018           	bra.s 41e2 <TestZoom4Picture+0x11e>
      *tmp4source++ = 0x55555555;
    41ca:	202f 01d8      	move.l 472(sp),d0
    41ce:	2200           	move.l d0,d1
    41d0:	5881           	addq.l #4,d1
    41d2:	2f41 01d8      	move.l d1,472(sp)
    41d6:	2040           	movea.l d0,a0
    41d8:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    41de:	52af 01d0      	addq.l #1,464(sp)
    41e2:	700b           	moveq #11,d0
    41e4:	b0af 01d0      	cmp.l 464(sp),d0
    41e8:	6ce0           	bge.s 41ca <TestZoom4Picture+0x106>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    41ea:	42af 01cc      	clr.l 460(sp)
    41ee:	6018           	bra.s 4208 <TestZoom4Picture+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    41f0:	202f 01d8      	move.l 472(sp),d0
    41f4:	2200           	move.l d0,d1
    41f6:	5881           	addq.l #4,d1
    41f8:	2f41 01d8      	move.l d1,472(sp)
    41fc:	2040           	movea.l d0,a0
    41fe:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    4204:	52af 01cc      	addq.l #1,460(sp)
    4208:	700b           	moveq #11,d0
    420a:	b0af 01cc      	cmp.l 460(sp),d0
    420e:	6ce0           	bge.s 41f0 <TestZoom4Picture+0x12c>
  for(int i=0;i<128+8;i++) {
    4210:	52af 01d4      	addq.l #1,468(sp)
    4214:	0caf 0000 0087 	cmpi.l #135,468(sp)
    421a:	01d4 
    421c:	6fa6           	ble.s 41c4 <TestZoom4Picture+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    421e:	4878 0001      	pea 1 <_start+0x1>
    4222:	42a7           	clr.l -(sp)
    4224:	2f2f 0056      	move.l 86(sp),-(sp)
    4228:	2f2f 006a      	move.l 106(sp),-(sp)
    422c:	4eba daaa      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    4230:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4234:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    423a:	2c40           	movea.l d0,a6
    423c:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    4240:	222f 004e      	move.l 78(sp),d1
    4244:	5881           	addq.l #4,d1
    4246:	2f41 01c8      	move.l d1,456(sp)
  UWORD *valsupposed = destlinezoom1;
    424a:	2f7c 0001 b9e4 	move.l #113124,74(sp)
    4250:	004a 
  UWORD mask = 0xffff;
    4252:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<14;i++) {
    4258:	42af 01c2      	clr.l 450(sp)
    425c:	6000 0084      	bra.w 42e2 <TestZoom4Picture+0x21e>
    for(int i2=0;i2<18;i2++) { 
    4260:	42af 01be      	clr.l 446(sp)
    4264:	603c           	bra.s 42a2 <TestZoom4Picture+0x1de>
      TestRow( valsupposed, valactual, mask, i2+i*19);
    4266:	222f 01c2      	move.l 450(sp),d1
    426a:	2001           	move.l d1,d0
    426c:	e788           	lsl.l #3,d0
    426e:	d081           	add.l d1,d0
    4270:	d080           	add.l d0,d0
    4272:	d081           	add.l d1,d0
    4274:	2200           	move.l d0,d1
    4276:	d2af 01be      	add.l 446(sp),d1
    427a:	7000           	moveq #0,d0
    427c:	302f 01c6      	move.w 454(sp),d0
    4280:	2f01           	move.l d1,-(sp)
    4282:	2f00           	move.l d0,-(sp)
    4284:	2f2f 01d0      	move.l 464(sp),-(sp)
    4288:	2f2f 0056      	move.l 86(sp),-(sp)
    428c:	4eba 2c98      	jsr 6f26 <TestRow>(pc)
    4290:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4294:	7030           	moveq #48,d0
    4296:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    429a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) { 
    429e:	52af 01be      	addq.l #1,446(sp)
    42a2:	7211           	moveq #17,d1
    42a4:	b2af 01be      	cmp.l 446(sp),d1
    42a8:	6cbc           	bge.s 4266 <TestZoom4Picture+0x1a2>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    42aa:	222f 01c2      	move.l 450(sp),d1
    42ae:	2001           	move.l d1,d0
    42b0:	e788           	lsl.l #3,d0
    42b2:	d081           	add.l d1,d0
    42b4:	d080           	add.l d0,d0
    42b6:	2040           	movea.l d0,a0
    42b8:	d1c1           	adda.l d1,a0
    42ba:	41e8 0012      	lea 18(a0),a0
    42be:	7000           	moveq #0,d0
    42c0:	302f 01c6      	move.w 454(sp),d0
    42c4:	2f08           	move.l a0,-(sp)
    42c6:	2f00           	move.l d0,-(sp)
    42c8:	2f2f 01d0      	move.l 464(sp),-(sp)
    42cc:	2f2f 0056      	move.l 86(sp),-(sp)
    42d0:	4eba 2c54      	jsr 6f26 <TestRow>(pc)
    42d4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    42d8:	7030           	moveq #48,d0
    42da:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<14;i++) {
    42de:	52af 01c2      	addq.l #1,450(sp)
    42e2:	720d           	moveq #13,d1
    42e4:	b2af 01c2      	cmp.l 450(sp),d1
    42e8:	6c00 ff76      	bge.w 4260 <TestZoom4Picture+0x19c>
  }

  for(int i2=0;i2<4;i2++) { 
    42ec:	42af 01ba      	clr.l 442(sp)
    42f0:	6032           	bra.s 4324 <TestZoom4Picture+0x260>
    TestRow( valsupposed, valactual, mask, i2+265);
    42f2:	222f 01ba      	move.l 442(sp),d1
    42f6:	0681 0000 0109 	addi.l #265,d1
    42fc:	7000           	moveq #0,d0
    42fe:	302f 01c6      	move.w 454(sp),d0
    4302:	2f01           	move.l d1,-(sp)
    4304:	2f00           	move.l d0,-(sp)
    4306:	2f2f 01d0      	move.l 464(sp),-(sp)
    430a:	2f2f 0056      	move.l 86(sp),-(sp)
    430e:	4eba 2c16      	jsr 6f26 <TestRow>(pc)
    4312:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4316:	7030           	moveq #48,d0
    4318:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    431c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    4320:	52af 01ba      	addq.l #1,442(sp)
    4324:	7203           	moveq #3,d1
    4326:	b2af 01ba      	cmp.l 442(sp),d1
    432a:	6cc6           	bge.s 42f2 <TestZoom4Picture+0x22e>
  }
  
  UWORD *tmp = source;
    432c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4332:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4338:	2f6f 0046 004e 	move.l 70(sp),78(sp)
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    433e:	4878 0001      	pea 1 <_start+0x1>
    4342:	4878 0001      	pea 1 <_start+0x1>
    4346:	2f2f 0056      	move.l 86(sp),-(sp)
    434a:	2f2f 006a      	move.l 106(sp),-(sp)
    434e:	4eba d988      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    4352:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4356:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    435c:	2c40           	movea.l d0,a6
    435e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4362:	202f 004e      	move.l 78(sp),d0
    4366:	5880           	addq.l #4,d0
    4368:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom2;
    436c:	2f7c 0001 ba10 	move.l #113168,74(sp)
    4372:	004a 
  mask = 0x0000;
    4374:	426f 01c6      	clr.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    4378:	42af 01b6      	clr.l 438(sp)
    437c:	602a           	bra.s 43a8 <TestZoom4Picture+0x2e4>
    TestRow( valsupposed, valactual, mask, i2);
    437e:	7000           	moveq #0,d0
    4380:	302f 01c6      	move.w 454(sp),d0
    4384:	2f2f 01b6      	move.l 438(sp),-(sp)
    4388:	2f00           	move.l d0,-(sp)
    438a:	2f2f 01d0      	move.l 464(sp),-(sp)
    438e:	2f2f 0056      	move.l 86(sp),-(sp)
    4392:	4eba 2b92      	jsr 6f26 <TestRow>(pc)
    4396:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    439a:	7230           	moveq #48,d1
    439c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    43a0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    43a4:	52af 01b6      	addq.l #1,438(sp)
    43a8:	700a           	moveq #10,d0
    43aa:	b0af 01b6      	cmp.l 438(sp),d0
    43ae:	6cce           	bge.s 437e <TestZoom4Picture+0x2ba>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    43b0:	4878 0008      	pea 8 <_start+0x8>
    43b4:	2f3c 0000 ffff 	move.l #65535,-(sp)
    43ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    43be:	2f2f 0056      	move.l 86(sp),-(sp)
    43c2:	4eba 2b62      	jsr 6f26 <TestRow>(pc)
    43c6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    43ca:	7230           	moveq #48,d1
    43cc:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 9);
    43d0:	4878 0009      	pea 9 <_start+0x9>
    43d4:	2f3c 0000 ffff 	move.l #65535,-(sp)
    43da:	2f2f 01d0      	move.l 464(sp),-(sp)
    43de:	2f2f 0056      	move.l 86(sp),-(sp)
    43e2:	4eba 2b42      	jsr 6f26 <TestRow>(pc)
    43e6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    43ea:	7030           	moveq #48,d0
    43ec:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 10);
    43f0:	4878 000a      	pea a <_start+0xa>
    43f4:	42a7           	clr.l -(sp)
    43f6:	2f2f 01d0      	move.l 464(sp),-(sp)
    43fa:	2f2f 0056      	move.l 86(sp),-(sp)
    43fe:	4eba 2b26      	jsr 6f26 <TestRow>(pc)
    4402:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4406:	7230           	moveq #48,d1
    4408:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 11);
    440c:	4878 000b      	pea b <_start+0xb>
    4410:	42a7           	clr.l -(sp)
    4412:	2f2f 01d0      	move.l 464(sp),-(sp)
    4416:	2f2f 0056      	move.l 86(sp),-(sp)
    441a:	4eba 2b0a      	jsr 6f26 <TestRow>(pc)
    441e:	4fef 0010      	lea 16(sp),sp

  valactual += ZMLINESIZE/2;
    4422:	7030           	moveq #48,d0
    4424:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<12;i++) {
    4428:	42af 01b2      	clr.l 434(sp)
    442c:	6000 0118      	bra.w 4546 <TestZoom4Picture+0x482>
    for(int i2=0;i2<16;i2++) {  
    4430:	42af 01ae      	clr.l 430(sp)
    4434:	603c           	bra.s 4472 <TestZoom4Picture+0x3ae>
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    4436:	222f 01b2      	move.l 434(sp),d1
    443a:	2001           	move.l d1,d0
    443c:	e988           	lsl.l #4,d0
    443e:	d081           	add.l d1,d0
    4440:	2040           	movea.l d0,a0
    4442:	d1ef 01ae      	adda.l 430(sp),a0
    4446:	41e8 000b      	lea 11(a0),a0
    444a:	7000           	moveq #0,d0
    444c:	302f 01c6      	move.w 454(sp),d0
    4450:	2f08           	move.l a0,-(sp)
    4452:	2f00           	move.l d0,-(sp)
    4454:	2f2f 01d0      	move.l 464(sp),-(sp)
    4458:	2f2f 0056      	move.l 86(sp),-(sp)
    445c:	4eba 2ac8      	jsr 6f26 <TestRow>(pc)
    4460:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4464:	7230           	moveq #48,d1
    4466:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    446a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {  
    446e:	52af 01ae      	addq.l #1,430(sp)
    4472:	700f           	moveq #15,d0
    4474:	b0af 01ae      	cmp.l 430(sp),d0
    4478:	6cbc           	bge.s 4436 <TestZoom4Picture+0x372>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    447a:	222f 01b2      	move.l 434(sp),d1
    447e:	2001           	move.l d1,d0
    4480:	e988           	lsl.l #4,d0
    4482:	2040           	movea.l d0,a0
    4484:	d1c1           	adda.l d1,a0
    4486:	41e8 0018      	lea 24(a0),a0
    448a:	7000           	moveq #0,d0
    448c:	302f 01c6      	move.w 454(sp),d0
    4490:	2f08           	move.l a0,-(sp)
    4492:	2f00           	move.l d0,-(sp)
    4494:	2f2f 01d0      	move.l 464(sp),-(sp)
    4498:	2f2f 0056      	move.l 86(sp),-(sp)
    449c:	4eba 2a88      	jsr 6f26 <TestRow>(pc)
    44a0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    44a4:	7230           	moveq #48,d1
    44a6:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    44aa:	222f 01b2      	move.l 434(sp),d1
    44ae:	2001           	move.l d1,d0
    44b0:	e988           	lsl.l #4,d0
    44b2:	2040           	movea.l d0,a0
    44b4:	d1c1           	adda.l d1,a0
    44b6:	41e8 0019      	lea 25(a0),a0
    44ba:	7000           	moveq #0,d0
    44bc:	302f 01c6      	move.w 454(sp),d0
    44c0:	2f08           	move.l a0,-(sp)
    44c2:	2f00           	move.l d0,-(sp)
    44c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    44c8:	2f2f 0056      	move.l 86(sp),-(sp)
    44cc:	4eba 2a58      	jsr 6f26 <TestRow>(pc)
    44d0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    44d4:	7030           	moveq #48,d0
    44d6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    44da:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    44de:	222f 01b2      	move.l 434(sp),d1
    44e2:	2001           	move.l d1,d0
    44e4:	e988           	lsl.l #4,d0
    44e6:	2040           	movea.l d0,a0
    44e8:	d1c1           	adda.l d1,a0
    44ea:	41e8 001a      	lea 26(a0),a0
    44ee:	7000           	moveq #0,d0
    44f0:	302f 01c6      	move.w 454(sp),d0
    44f4:	2f08           	move.l a0,-(sp)
    44f6:	2f00           	move.l d0,-(sp)
    44f8:	2f2f 01d0      	move.l 464(sp),-(sp)
    44fc:	2f2f 0056      	move.l 86(sp),-(sp)
    4500:	4eba 2a24      	jsr 6f26 <TestRow>(pc)
    4504:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4508:	7230           	moveq #48,d1
    450a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    450e:	222f 01b2      	move.l 434(sp),d1
    4512:	2001           	move.l d1,d0
    4514:	e988           	lsl.l #4,d0
    4516:	2040           	movea.l d0,a0
    4518:	d1c1           	adda.l d1,a0
    451a:	41e8 001b      	lea 27(a0),a0
    451e:	7000           	moveq #0,d0
    4520:	302f 01c6      	move.w 454(sp),d0
    4524:	2f08           	move.l a0,-(sp)
    4526:	2f00           	move.l d0,-(sp)
    4528:	2f2f 01d0      	move.l 464(sp),-(sp)
    452c:	2f2f 0056      	move.l 86(sp),-(sp)
    4530:	4eba 29f4      	jsr 6f26 <TestRow>(pc)
    4534:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4538:	7030           	moveq #48,d0
    453a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    453e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    4542:	52af 01b2      	addq.l #1,434(sp)
    4546:	720b           	moveq #11,d1
    4548:	b2af 01b2      	cmp.l 434(sp),d1
    454c:	6c00 fee2      	bge.w 4430 <TestZoom4Picture+0x36c>
    
  }

  for(int i2=0;i2<15;i2++) { 
    4550:	42af 01aa      	clr.l 426(sp)
    4554:	602a           	bra.s 4580 <TestZoom4Picture+0x4bc>
    TestRow( valsupposed, valactual, mask, i2);
    4556:	7000           	moveq #0,d0
    4558:	302f 01c6      	move.w 454(sp),d0
    455c:	2f2f 01aa      	move.l 426(sp),-(sp)
    4560:	2f00           	move.l d0,-(sp)
    4562:	2f2f 01d0      	move.l 464(sp),-(sp)
    4566:	2f2f 0056      	move.l 86(sp),-(sp)
    456a:	4eba 29ba      	jsr 6f26 <TestRow>(pc)
    456e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4572:	7030           	moveq #48,d0
    4574:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4578:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<15;i2++) { 
    457c:	52af 01aa      	addq.l #1,426(sp)
    4580:	720e           	moveq #14,d1
    4582:	b2af 01aa      	cmp.l 426(sp),d1
    4586:	6cce           	bge.s 4556 <TestZoom4Picture+0x492>
  }

  tmp = source;
    4588:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    458e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4594:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    459a:	4878 0001      	pea 1 <_start+0x1>
    459e:	4878 0002      	pea 2 <_start+0x2>
    45a2:	2f2f 0056      	move.l 86(sp),-(sp)
    45a6:	2f2f 006a      	move.l 106(sp),-(sp)
    45aa:	4eba d72c      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    45ae:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    45b2:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    45b8:	2c40           	movea.l d0,a6
    45ba:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    45be:	202f 004e      	move.l 78(sp),d0
    45c2:	5880           	addq.l #4,d0
    45c4:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom3;
    45c8:	2f7c 0001 ba3c 	move.l #113212,74(sp)
    45ce:	004a 
  mask = 0xffff;
    45d0:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<4;i2++) { 
    45d6:	42af 01a6      	clr.l 422(sp)
    45da:	602a           	bra.s 4606 <TestZoom4Picture+0x542>
    TestRow( valsupposed, valactual, mask, i2);
    45dc:	7000           	moveq #0,d0
    45de:	302f 01c6      	move.w 454(sp),d0
    45e2:	2f2f 01a6      	move.l 422(sp),-(sp)
    45e6:	2f00           	move.l d0,-(sp)
    45e8:	2f2f 01d0      	move.l 464(sp),-(sp)
    45ec:	2f2f 0056      	move.l 86(sp),-(sp)
    45f0:	4eba 2934      	jsr 6f26 <TestRow>(pc)
    45f4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    45f8:	7230           	moveq #48,d1
    45fa:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    45fe:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    4602:	52af 01a6      	addq.l #1,422(sp)
    4606:	7003           	moveq #3,d0
    4608:	b0af 01a6      	cmp.l 422(sp),d0
    460c:	6cce           	bge.s 45dc <TestZoom4Picture+0x518>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    460e:	4878 0004      	pea 4 <_start+0x4>
    4612:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4618:	2f2f 01d0      	move.l 464(sp),-(sp)
    461c:	2f2f 0056      	move.l 86(sp),-(sp)
    4620:	4eba 2904      	jsr 6f26 <TestRow>(pc)
    4624:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4628:	7230           	moveq #48,d1
    462a:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    462e:	4878 0005      	pea 5 <_start+0x5>
    4632:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4638:	2f2f 01d0      	move.l 464(sp),-(sp)
    463c:	2f2f 0056      	move.l 86(sp),-(sp)
    4640:	4eba 28e4      	jsr 6f26 <TestRow>(pc)
    4644:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4648:	7030           	moveq #48,d0
    464a:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    464e:	4878 0006      	pea 6 <_start+0x6>
    4652:	42a7           	clr.l -(sp)
    4654:	2f2f 01d0      	move.l 464(sp),-(sp)
    4658:	2f2f 0056      	move.l 86(sp),-(sp)
    465c:	4eba 28c8      	jsr 6f26 <TestRow>(pc)
    4660:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4664:	7230           	moveq #48,d1
    4666:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    466a:	4878 0007      	pea 7 <_start+0x7>
    466e:	42a7           	clr.l -(sp)
    4670:	2f2f 01d0      	move.l 464(sp),-(sp)
    4674:	2f2f 0056      	move.l 86(sp),-(sp)
    4678:	4eba 28ac      	jsr 6f26 <TestRow>(pc)
    467c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4680:	7030           	moveq #48,d0
    4682:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    4686:	4878 0008      	pea 8 <_start+0x8>
    468a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4690:	2f2f 01d0      	move.l 464(sp),-(sp)
    4694:	2f2f 0056      	move.l 86(sp),-(sp)
    4698:	4eba 288c      	jsr 6f26 <TestRow>(pc)
    469c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    46a0:	7230           	moveq #48,d1
    46a2:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    46a6:	4878 0009      	pea 9 <_start+0x9>
    46aa:	2f3c 0000 ffff 	move.l #65535,-(sp)
    46b0:	2f2f 01d0      	move.l 464(sp),-(sp)
    46b4:	2f2f 0056      	move.l 86(sp),-(sp)
    46b8:	4eba 286c      	jsr 6f26 <TestRow>(pc)
    46bc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    46c0:	7030           	moveq #48,d0
    46c2:	d1af 01c8      	add.l d0,456(sp)

  mask = 0x0000;
    46c6:	426f 01c6      	clr.w 454(sp)
  for(int i=0;i<12;i++) {
    46ca:	42af 01a2      	clr.l 418(sp)
    46ce:	6000 01a6      	bra.w 4876 <TestZoom4Picture+0x7b2>
    for(int i2=0;i2<15;i2++) {  
    46d2:	42af 019e      	clr.l 414(sp)
    46d6:	6042           	bra.s 471a <TestZoom4Picture+0x656>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    46d8:	222f 01a2      	move.l 418(sp),d1
    46dc:	2001           	move.l d1,d0
    46de:	d080           	add.l d0,d0
    46e0:	d081           	add.l d1,d0
    46e2:	2200           	move.l d0,d1
    46e4:	e789           	lsl.l #3,d1
    46e6:	9280           	sub.l d0,d1
    46e8:	2041           	movea.l d1,a0
    46ea:	d1ef 019e      	adda.l 414(sp),a0
    46ee:	41e8 0009      	lea 9(a0),a0
    46f2:	7000           	moveq #0,d0
    46f4:	302f 01c6      	move.w 454(sp),d0
    46f8:	2f08           	move.l a0,-(sp)
    46fa:	2f00           	move.l d0,-(sp)
    46fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4700:	2f2f 0056      	move.l 86(sp),-(sp)
    4704:	4eba 2820      	jsr 6f26 <TestRow>(pc)
    4708:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    470c:	7230           	moveq #48,d1
    470e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4712:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {  
    4716:	52af 019e      	addq.l #1,414(sp)
    471a:	700e           	moveq #14,d0
    471c:	b0af 019e      	cmp.l 414(sp),d0
    4720:	6cb6           	bge.s 46d8 <TestZoom4Picture+0x614>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    4722:	222f 01a2      	move.l 418(sp),d1
    4726:	2001           	move.l d1,d0
    4728:	d080           	add.l d0,d0
    472a:	d081           	add.l d1,d0
    472c:	2200           	move.l d0,d1
    472e:	e789           	lsl.l #3,d1
    4730:	2041           	movea.l d1,a0
    4732:	91c0           	suba.l d0,a0
    4734:	41e8 0018      	lea 24(a0),a0
    4738:	7000           	moveq #0,d0
    473a:	302f 01c6      	move.w 454(sp),d0
    473e:	2f08           	move.l a0,-(sp)
    4740:	2f00           	move.l d0,-(sp)
    4742:	2f2f 01d0      	move.l 464(sp),-(sp)
    4746:	2f2f 0056      	move.l 86(sp),-(sp)
    474a:	4eba 27da      	jsr 6f26 <TestRow>(pc)
    474e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4752:	7230           	moveq #48,d1
    4754:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    4758:	222f 01a2      	move.l 418(sp),d1
    475c:	2001           	move.l d1,d0
    475e:	d080           	add.l d0,d0
    4760:	d081           	add.l d1,d0
    4762:	2200           	move.l d0,d1
    4764:	e789           	lsl.l #3,d1
    4766:	2041           	movea.l d1,a0
    4768:	91c0           	suba.l d0,a0
    476a:	41e8 0019      	lea 25(a0),a0
    476e:	7000           	moveq #0,d0
    4770:	302f 01c6      	move.w 454(sp),d0
    4774:	2f08           	move.l a0,-(sp)
    4776:	2f00           	move.l d0,-(sp)
    4778:	2f2f 01d0      	move.l 464(sp),-(sp)
    477c:	2f2f 0056      	move.l 86(sp),-(sp)
    4780:	4eba 27a4      	jsr 6f26 <TestRow>(pc)
    4784:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4788:	7030           	moveq #48,d0
    478a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    478e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    4792:	222f 01a2      	move.l 418(sp),d1
    4796:	2001           	move.l d1,d0
    4798:	d080           	add.l d0,d0
    479a:	d081           	add.l d1,d0
    479c:	2200           	move.l d0,d1
    479e:	e789           	lsl.l #3,d1
    47a0:	2041           	movea.l d1,a0
    47a2:	91c0           	suba.l d0,a0
    47a4:	41e8 001a      	lea 26(a0),a0
    47a8:	7000           	moveq #0,d0
    47aa:	302f 01c6      	move.w 454(sp),d0
    47ae:	2f08           	move.l a0,-(sp)
    47b0:	2f00           	move.l d0,-(sp)
    47b2:	2f2f 01d0      	move.l 464(sp),-(sp)
    47b6:	2f2f 0056      	move.l 86(sp),-(sp)
    47ba:	4eba 276a      	jsr 6f26 <TestRow>(pc)
    47be:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    47c2:	7230           	moveq #48,d1
    47c4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    47c8:	222f 01a2      	move.l 418(sp),d1
    47cc:	2001           	move.l d1,d0
    47ce:	d080           	add.l d0,d0
    47d0:	d081           	add.l d1,d0
    47d2:	2200           	move.l d0,d1
    47d4:	e789           	lsl.l #3,d1
    47d6:	2041           	movea.l d1,a0
    47d8:	91c0           	suba.l d0,a0
    47da:	41e8 001b      	lea 27(a0),a0
    47de:	7000           	moveq #0,d0
    47e0:	302f 01c6      	move.w 454(sp),d0
    47e4:	2f08           	move.l a0,-(sp)
    47e6:	2f00           	move.l d0,-(sp)
    47e8:	2f2f 01d0      	move.l 464(sp),-(sp)
    47ec:	2f2f 0056      	move.l 86(sp),-(sp)
    47f0:	4eba 2734      	jsr 6f26 <TestRow>(pc)
    47f4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    47f8:	7030           	moveq #48,d0
    47fa:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    47fe:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4802:	222f 01a2      	move.l 418(sp),d1
    4806:	2001           	move.l d1,d0
    4808:	d080           	add.l d0,d0
    480a:	d081           	add.l d1,d0
    480c:	2200           	move.l d0,d1
    480e:	e789           	lsl.l #3,d1
    4810:	2041           	movea.l d1,a0
    4812:	91c0           	suba.l d0,a0
    4814:	41e8 001c      	lea 28(a0),a0
    4818:	7000           	moveq #0,d0
    481a:	302f 01c6      	move.w 454(sp),d0
    481e:	2f08           	move.l a0,-(sp)
    4820:	2f00           	move.l d0,-(sp)
    4822:	2f2f 01d0      	move.l 464(sp),-(sp)
    4826:	2f2f 0056      	move.l 86(sp),-(sp)
    482a:	4eba 26fa      	jsr 6f26 <TestRow>(pc)
    482e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4832:	7230           	moveq #48,d1
    4834:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4838:	222f 01a2      	move.l 418(sp),d1
    483c:	2001           	move.l d1,d0
    483e:	d080           	add.l d0,d0
    4840:	d081           	add.l d1,d0
    4842:	2200           	move.l d0,d1
    4844:	e789           	lsl.l #3,d1
    4846:	2041           	movea.l d1,a0
    4848:	91c0           	suba.l d0,a0
    484a:	41e8 001d      	lea 29(a0),a0
    484e:	7000           	moveq #0,d0
    4850:	302f 01c6      	move.w 454(sp),d0
    4854:	2f08           	move.l a0,-(sp)
    4856:	2f00           	move.l d0,-(sp)
    4858:	2f2f 01d0      	move.l 464(sp),-(sp)
    485c:	2f2f 0056      	move.l 86(sp),-(sp)
    4860:	4eba 26c4      	jsr 6f26 <TestRow>(pc)
    4864:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4868:	7030           	moveq #48,d0
    486a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    486e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    4872:	52af 01a2      	addq.l #1,418(sp)
    4876:	720b           	moveq #11,d1
    4878:	b2af 01a2      	cmp.l 418(sp),d1
    487c:	6c00 fe54      	bge.w 46d2 <TestZoom4Picture+0x60e>
  }

  for(int i2=0;i2<8;i2++) {  
    4880:	42af 019a      	clr.l 410(sp)
    4884:	6032           	bra.s 48b8 <TestZoom4Picture+0x7f4>
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    4886:	222f 019a      	move.l 410(sp),d1
    488a:	0681 0000 0105 	addi.l #261,d1
    4890:	7000           	moveq #0,d0
    4892:	302f 01c6      	move.w 454(sp),d0
    4896:	2f01           	move.l d1,-(sp)
    4898:	2f00           	move.l d0,-(sp)
    489a:	2f2f 01d0      	move.l 464(sp),-(sp)
    489e:	2f2f 0056      	move.l 86(sp),-(sp)
    48a2:	4eba 2682      	jsr 6f26 <TestRow>(pc)
    48a6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    48aa:	7030           	moveq #48,d0
    48ac:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    48b0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    48b4:	52af 019a      	addq.l #1,410(sp)
    48b8:	7207           	moveq #7,d1
    48ba:	b2af 019a      	cmp.l 410(sp),d1
    48be:	6cc6           	bge.s 4886 <TestZoom4Picture+0x7c2>
  }

  tmp = source;
    48c0:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    48c6:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    48cc:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    48d2:	4878 0001      	pea 1 <_start+0x1>
    48d6:	4878 0003      	pea 3 <_start+0x3>
    48da:	2f2f 0056      	move.l 86(sp),-(sp)
    48de:	2f2f 006a      	move.l 106(sp),-(sp)
    48e2:	4eba d3f4      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    48e6:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    48ea:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    48f0:	2c40           	movea.l d0,a6
    48f2:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    48f6:	202f 004e      	move.l 78(sp),d0
    48fa:	5880           	addq.l #4,d0
    48fc:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom4;
    4900:	2f7c 0001 ba68 	move.l #113256,74(sp)
    4906:	004a 
  mask = 0x0000;
    4908:	426f 01c6      	clr.w 454(sp)
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    490c:	4878 0007      	pea 7 <_start+0x7>
    4910:	42a7           	clr.l -(sp)
    4912:	2f2f 01d0      	move.l 464(sp),-(sp)
    4916:	2f2f 0056      	move.l 86(sp),-(sp)
    491a:	4eba 260a      	jsr 6f26 <TestRow>(pc)
    491e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4922:	7230           	moveq #48,d1
    4924:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    4928:	4878 0008      	pea 8 <_start+0x8>
    492c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4932:	2f2f 01d0      	move.l 464(sp),-(sp)
    4936:	2f2f 0056      	move.l 86(sp),-(sp)
    493a:	4eba 25ea      	jsr 6f26 <TestRow>(pc)
    493e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4942:	7030           	moveq #48,d0
    4944:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    4948:	4878 0009      	pea 9 <_start+0x9>
    494c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4952:	2f2f 01d0      	move.l 464(sp),-(sp)
    4956:	2f2f 0056      	move.l 86(sp),-(sp)
    495a:	4eba 25ca      	jsr 6f26 <TestRow>(pc)
    495e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4962:	7230           	moveq #48,d1
    4964:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    4968:	4878 0008      	pea 8 <_start+0x8>
    496c:	42a7           	clr.l -(sp)
    496e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4972:	2f2f 0056      	move.l 86(sp),-(sp)
    4976:	4eba 25ae      	jsr 6f26 <TestRow>(pc)
    497a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    497e:	7030           	moveq #48,d0
    4980:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    4984:	4878 0009      	pea 9 <_start+0x9>
    4988:	42a7           	clr.l -(sp)
    498a:	2f2f 01d0      	move.l 464(sp),-(sp)
    498e:	2f2f 0056      	move.l 86(sp),-(sp)
    4992:	4eba 2592      	jsr 6f26 <TestRow>(pc)
    4996:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    499a:	7230           	moveq #48,d1
    499c:	d3af 01c8      	add.l d1,456(sp)

  mask = 0xffff;
    49a0:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<12;i++) {
    49a6:	42af 0196      	clr.l 406(sp)
    49aa:	6000 0216      	bra.w 4bc2 <TestZoom4Picture+0xafe>
    for(int i2=0;i2<14;i2++) {  
    49ae:	42af 0192      	clr.l 402(sp)
    49b2:	6042           	bra.s 49f6 <TestZoom4Picture+0x932>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    49b4:	222f 0196      	move.l 406(sp),d1
    49b8:	2001           	move.l d1,d0
    49ba:	d080           	add.l d0,d0
    49bc:	d081           	add.l d1,d0
    49be:	2200           	move.l d0,d1
    49c0:	e789           	lsl.l #3,d1
    49c2:	9280           	sub.l d0,d1
    49c4:	2041           	movea.l d1,a0
    49c6:	d1ef 0192      	adda.l 402(sp),a0
    49ca:	41e8 0009      	lea 9(a0),a0
    49ce:	7000           	moveq #0,d0
    49d0:	302f 01c6      	move.w 454(sp),d0
    49d4:	2f08           	move.l a0,-(sp)
    49d6:	2f00           	move.l d0,-(sp)
    49d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    49dc:	2f2f 0056      	move.l 86(sp),-(sp)
    49e0:	4eba 2544      	jsr 6f26 <TestRow>(pc)
    49e4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    49e8:	7030           	moveq #48,d0
    49ea:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    49ee:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {  
    49f2:	52af 0192      	addq.l #1,402(sp)
    49f6:	720d           	moveq #13,d1
    49f8:	b2af 0192      	cmp.l 402(sp),d1
    49fc:	6cb6           	bge.s 49b4 <TestZoom4Picture+0x8f0>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    49fe:	222f 0196      	move.l 406(sp),d1
    4a02:	2001           	move.l d1,d0
    4a04:	d080           	add.l d0,d0
    4a06:	d081           	add.l d1,d0
    4a08:	2200           	move.l d0,d1
    4a0a:	e789           	lsl.l #3,d1
    4a0c:	2041           	movea.l d1,a0
    4a0e:	91c0           	suba.l d0,a0
    4a10:	41e8 0018      	lea 24(a0),a0
    4a14:	7000           	moveq #0,d0
    4a16:	302f 01c6      	move.w 454(sp),d0
    4a1a:	2f08           	move.l a0,-(sp)
    4a1c:	2f00           	move.l d0,-(sp)
    4a1e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a22:	2f2f 0056      	move.l 86(sp),-(sp)
    4a26:	4eba 24fe      	jsr 6f26 <TestRow>(pc)
    4a2a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a2e:	7030           	moveq #48,d0
    4a30:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    4a34:	222f 0196      	move.l 406(sp),d1
    4a38:	2001           	move.l d1,d0
    4a3a:	d080           	add.l d0,d0
    4a3c:	d081           	add.l d1,d0
    4a3e:	2200           	move.l d0,d1
    4a40:	e789           	lsl.l #3,d1
    4a42:	2041           	movea.l d1,a0
    4a44:	91c0           	suba.l d0,a0
    4a46:	41e8 0019      	lea 25(a0),a0
    4a4a:	7000           	moveq #0,d0
    4a4c:	302f 01c6      	move.w 454(sp),d0
    4a50:	2f08           	move.l a0,-(sp)
    4a52:	2f00           	move.l d0,-(sp)
    4a54:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a58:	2f2f 0056      	move.l 86(sp),-(sp)
    4a5c:	4eba 24c8      	jsr 6f26 <TestRow>(pc)
    4a60:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a64:	7230           	moveq #48,d1
    4a66:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4a6a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    4a6e:	222f 0196      	move.l 406(sp),d1
    4a72:	2001           	move.l d1,d0
    4a74:	d080           	add.l d0,d0
    4a76:	d081           	add.l d1,d0
    4a78:	2200           	move.l d0,d1
    4a7a:	e789           	lsl.l #3,d1
    4a7c:	2041           	movea.l d1,a0
    4a7e:	91c0           	suba.l d0,a0
    4a80:	41e8 001a      	lea 26(a0),a0
    4a84:	7000           	moveq #0,d0
    4a86:	302f 01c6      	move.w 454(sp),d0
    4a8a:	2f08           	move.l a0,-(sp)
    4a8c:	2f00           	move.l d0,-(sp)
    4a8e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a92:	2f2f 0056      	move.l 86(sp),-(sp)
    4a96:	4eba 248e      	jsr 6f26 <TestRow>(pc)
    4a9a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a9e:	7030           	moveq #48,d0
    4aa0:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    4aa4:	222f 0196      	move.l 406(sp),d1
    4aa8:	2001           	move.l d1,d0
    4aaa:	d080           	add.l d0,d0
    4aac:	d081           	add.l d1,d0
    4aae:	2200           	move.l d0,d1
    4ab0:	e789           	lsl.l #3,d1
    4ab2:	2041           	movea.l d1,a0
    4ab4:	91c0           	suba.l d0,a0
    4ab6:	41e8 001b      	lea 27(a0),a0
    4aba:	7000           	moveq #0,d0
    4abc:	302f 01c6      	move.w 454(sp),d0
    4ac0:	2f08           	move.l a0,-(sp)
    4ac2:	2f00           	move.l d0,-(sp)
    4ac4:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ac8:	2f2f 0056      	move.l 86(sp),-(sp)
    4acc:	4eba 2458      	jsr 6f26 <TestRow>(pc)
    4ad0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ad4:	7230           	moveq #48,d1
    4ad6:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4ada:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4ade:	222f 0196      	move.l 406(sp),d1
    4ae2:	2001           	move.l d1,d0
    4ae4:	d080           	add.l d0,d0
    4ae6:	d081           	add.l d1,d0
    4ae8:	2200           	move.l d0,d1
    4aea:	e789           	lsl.l #3,d1
    4aec:	2041           	movea.l d1,a0
    4aee:	91c0           	suba.l d0,a0
    4af0:	41e8 001c      	lea 28(a0),a0
    4af4:	7000           	moveq #0,d0
    4af6:	302f 01c6      	move.w 454(sp),d0
    4afa:	2f08           	move.l a0,-(sp)
    4afc:	2f00           	move.l d0,-(sp)
    4afe:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b02:	2f2f 0056      	move.l 86(sp),-(sp)
    4b06:	4eba 241e      	jsr 6f26 <TestRow>(pc)
    4b0a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b0e:	7030           	moveq #48,d0
    4b10:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4b14:	222f 0196      	move.l 406(sp),d1
    4b18:	2001           	move.l d1,d0
    4b1a:	d080           	add.l d0,d0
    4b1c:	d081           	add.l d1,d0
    4b1e:	2200           	move.l d0,d1
    4b20:	e789           	lsl.l #3,d1
    4b22:	2041           	movea.l d1,a0
    4b24:	91c0           	suba.l d0,a0
    4b26:	41e8 001d      	lea 29(a0),a0
    4b2a:	7000           	moveq #0,d0
    4b2c:	302f 01c6      	move.w 454(sp),d0
    4b30:	2f08           	move.l a0,-(sp)
    4b32:	2f00           	move.l d0,-(sp)
    4b34:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b38:	2f2f 0056      	move.l 86(sp),-(sp)
    4b3c:	4eba 23e8      	jsr 6f26 <TestRow>(pc)
    4b40:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b44:	7230           	moveq #48,d1
    4b46:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4b4a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4b4e:	222f 0196      	move.l 406(sp),d1
    4b52:	2001           	move.l d1,d0
    4b54:	d080           	add.l d0,d0
    4b56:	d081           	add.l d1,d0
    4b58:	2200           	move.l d0,d1
    4b5a:	e789           	lsl.l #3,d1
    4b5c:	2041           	movea.l d1,a0
    4b5e:	91c0           	suba.l d0,a0
    4b60:	41e8 001c      	lea 28(a0),a0
    4b64:	7000           	moveq #0,d0
    4b66:	302f 01c6      	move.w 454(sp),d0
    4b6a:	2f08           	move.l a0,-(sp)
    4b6c:	2f00           	move.l d0,-(sp)
    4b6e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b72:	2f2f 0056      	move.l 86(sp),-(sp)
    4b76:	4eba 23ae      	jsr 6f26 <TestRow>(pc)
    4b7a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b7e:	7030           	moveq #48,d0
    4b80:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4b84:	222f 0196      	move.l 406(sp),d1
    4b88:	2001           	move.l d1,d0
    4b8a:	d080           	add.l d0,d0
    4b8c:	d081           	add.l d1,d0
    4b8e:	2200           	move.l d0,d1
    4b90:	e789           	lsl.l #3,d1
    4b92:	2041           	movea.l d1,a0
    4b94:	91c0           	suba.l d0,a0
    4b96:	41e8 001d      	lea 29(a0),a0
    4b9a:	7000           	moveq #0,d0
    4b9c:	302f 01c6      	move.w 454(sp),d0
    4ba0:	2f08           	move.l a0,-(sp)
    4ba2:	2f00           	move.l d0,-(sp)
    4ba4:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ba8:	2f2f 0056      	move.l 86(sp),-(sp)
    4bac:	4eba 2378      	jsr 6f26 <TestRow>(pc)
    4bb0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4bb4:	7230           	moveq #48,d1
    4bb6:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4bba:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    4bbe:	52af 0196      	addq.l #1,406(sp)
    4bc2:	700b           	moveq #11,d0
    4bc4:	b0af 0196      	cmp.l 406(sp),d0
    4bc8:	6c00 fde4      	bge.w 49ae <TestZoom4Picture+0x8ea>
  }

  TestRow( valsupposed, valactual, mask, 269);
    4bcc:	7000           	moveq #0,d0
    4bce:	302f 01c6      	move.w 454(sp),d0
    4bd2:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4bd6:	2f00           	move.l d0,-(sp)
    4bd8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bdc:	2f2f 0056      	move.l 86(sp),-(sp)
    4be0:	4eba 2344      	jsr 6f26 <TestRow>(pc)
    4be4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4be8:	7230           	moveq #48,d1
    4bea:	d3af 01c8      	add.l d1,456(sp)
  
  tmp = source;
    4bee:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4bf4:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4bfa:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    4c00:	4878 0001      	pea 1 <_start+0x1>
    4c04:	4878 0004      	pea 4 <_start+0x4>
    4c08:	2f2f 0056      	move.l 86(sp),-(sp)
    4c0c:	2f2f 006a      	move.l 106(sp),-(sp)
    4c10:	4eba d0c6      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    4c14:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4c18:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    4c1e:	2c40           	movea.l d0,a6
    4c20:	4eae ff1c      	jsr -228(a6)

  valactual = destination+2; 
    4c24:	202f 004e      	move.l 78(sp),d0
    4c28:	5880           	addq.l #4,d0
    4c2a:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom5;
    4c2e:	2f7c 0001 ba94 	move.l #113300,74(sp)
    4c34:	004a 
  mask = 0x0000;
    4c36:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<13;i2++) {  
    4c3a:	42af 018e      	clr.l 398(sp)
    4c3e:	602a           	bra.s 4c6a <TestZoom4Picture+0xba6>
    TestRow( valsupposed, valactual, mask, i2);
    4c40:	7000           	moveq #0,d0
    4c42:	302f 01c6      	move.w 454(sp),d0
    4c46:	2f2f 018e      	move.l 398(sp),-(sp)
    4c4a:	2f00           	move.l d0,-(sp)
    4c4c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c50:	2f2f 0056      	move.l 86(sp),-(sp)
    4c54:	4eba 22d0      	jsr 6f26 <TestRow>(pc)
    4c58:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c5c:	7230           	moveq #48,d1
    4c5e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4c62:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4c66:	52af 018e      	addq.l #1,398(sp)
    4c6a:	700c           	moveq #12,d0
    4c6c:	b0af 018e      	cmp.l 398(sp),d0
    4c70:	6cce           	bge.s 4c40 <TestZoom4Picture+0xb7c>
  }

  TestRow( valsupposed, valactual, mask, 12);   
    4c72:	7000           	moveq #0,d0
    4c74:	302f 01c6      	move.w 454(sp),d0
    4c78:	4878 000c      	pea c <_start+0xc>
    4c7c:	2f00           	move.l d0,-(sp)
    4c7e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c82:	2f2f 0056      	move.l 86(sp),-(sp)
    4c86:	4eba 229e      	jsr 6f26 <TestRow>(pc)
    4c8a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4c8e:	7230           	moveq #48,d1
    4c90:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 13);
    4c94:	7000           	moveq #0,d0
    4c96:	302f 01c6      	move.w 454(sp),d0
    4c9a:	4878 000d      	pea d <_start+0xd>
    4c9e:	2f00           	move.l d0,-(sp)
    4ca0:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ca4:	2f2f 0056      	move.l 86(sp),-(sp)
    4ca8:	4eba 227c      	jsr 6f26 <TestRow>(pc)
    4cac:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4cb0:	7030           	moveq #48,d0
    4cb2:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4cb6:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 14);
    4cba:	7000           	moveq #0,d0
    4cbc:	302f 01c6      	move.w 454(sp),d0
    4cc0:	4878 000e      	pea e <_start+0xe>
    4cc4:	2f00           	move.l d0,-(sp)
    4cc6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cca:	2f2f 0056      	move.l 86(sp),-(sp)
    4cce:	4eba 2256      	jsr 6f26 <TestRow>(pc)
    4cd2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4cd6:	7230           	moveq #48,d1
    4cd8:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 15);
    4cdc:	7000           	moveq #0,d0
    4cde:	302f 01c6      	move.w 454(sp),d0
    4ce2:	4878 000f      	pea f <_start+0xf>
    4ce6:	2f00           	move.l d0,-(sp)
    4ce8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cec:	2f2f 0056      	move.l 86(sp),-(sp)
    4cf0:	4eba 2234      	jsr 6f26 <TestRow>(pc)
    4cf4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4cf8:	7030           	moveq #48,d0
    4cfa:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4cfe:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 16);
    4d02:	7000           	moveq #0,d0
    4d04:	302f 01c6      	move.w 454(sp),d0
    4d08:	4878 0010      	pea 10 <_start+0x10>
    4d0c:	2f00           	move.l d0,-(sp)
    4d0e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d12:	2f2f 0056      	move.l 86(sp),-(sp)
    4d16:	4eba 220e      	jsr 6f26 <TestRow>(pc)
    4d1a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d1e:	7230           	moveq #48,d1
    4d20:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 17);
    4d24:	7000           	moveq #0,d0
    4d26:	302f 01c6      	move.w 454(sp),d0
    4d2a:	4878 0011      	pea 11 <_start+0x11>
    4d2e:	2f00           	move.l d0,-(sp)
    4d30:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d34:	2f2f 0056      	move.l 86(sp),-(sp)
    4d38:	4eba 21ec      	jsr 6f26 <TestRow>(pc)
    4d3c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d40:	7030           	moveq #48,d0
    4d42:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4d46:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 18);
    4d4a:	7000           	moveq #0,d0
    4d4c:	302f 01c6      	move.w 454(sp),d0
    4d50:	4878 0012      	pea 12 <_start+0x12>
    4d54:	2f00           	move.l d0,-(sp)
    4d56:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d5a:	2f2f 0056      	move.l 86(sp),-(sp)
    4d5e:	4eba 21c6      	jsr 6f26 <TestRow>(pc)
    4d62:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d66:	7230           	moveq #48,d1
    4d68:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 19);
    4d6c:	7000           	moveq #0,d0
    4d6e:	302f 01c6      	move.w 454(sp),d0
    4d72:	4878 0013      	pea 13 <_start+0x13>
    4d76:	2f00           	move.l d0,-(sp)
    4d78:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d7c:	2f2f 0056      	move.l 86(sp),-(sp)
    4d80:	4eba 21a4      	jsr 6f26 <TestRow>(pc)
    4d84:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d88:	7030           	moveq #48,d0
    4d8a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4d8e:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 20);
    4d92:	7000           	moveq #0,d0
    4d94:	302f 01c6      	move.w 454(sp),d0
    4d98:	4878 0014      	pea 14 <_start+0x14>
    4d9c:	2f00           	move.l d0,-(sp)
    4d9e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4da2:	2f2f 0056      	move.l 86(sp),-(sp)
    4da6:	4eba 217e      	jsr 6f26 <TestRow>(pc)
    4daa:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4dae:	7230           	moveq #48,d1
    4db0:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 21);
    4db4:	7000           	moveq #0,d0
    4db6:	302f 01c6      	move.w 454(sp),d0
    4dba:	4878 0015      	pea 15 <_start+0x15>
    4dbe:	2f00           	move.l d0,-(sp)
    4dc0:	2f2f 01d0      	move.l 464(sp),-(sp)
    4dc4:	2f2f 0056      	move.l 86(sp),-(sp)
    4dc8:	4eba 215c      	jsr 6f26 <TestRow>(pc)
    4dcc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4dd0:	7030           	moveq #48,d0
    4dd2:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4dd6:	466f 01c6      	not.w 454(sp)


  for(int i=0;i<10;i++) {
    4dda:	42af 018a      	clr.l 394(sp)
    4dde:	6000 0286      	bra.w 5066 <TestZoom4Picture+0xfa2>
    for(int i2=0;i2<13;i2++) {  
    4de2:	42af 0186      	clr.l 390(sp)
    4de6:	6042           	bra.s 4e2a <TestZoom4Picture+0xd66>
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    4de8:	222f 018a      	move.l 394(sp),d1
    4dec:	2001           	move.l d1,d0
    4dee:	d080           	add.l d0,d0
    4df0:	d081           	add.l d1,d0
    4df2:	2200           	move.l d0,d1
    4df4:	e789           	lsl.l #3,d1
    4df6:	9280           	sub.l d0,d1
    4df8:	2041           	movea.l d1,a0
    4dfa:	d1ef 0186      	adda.l 390(sp),a0
    4dfe:	41e8 0016      	lea 22(a0),a0
    4e02:	7000           	moveq #0,d0
    4e04:	302f 01c6      	move.w 454(sp),d0
    4e08:	2f08           	move.l a0,-(sp)
    4e0a:	2f00           	move.l d0,-(sp)
    4e0c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e10:	2f2f 0056      	move.l 86(sp),-(sp)
    4e14:	4eba 2110      	jsr 6f26 <TestRow>(pc)
    4e18:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4e1c:	7230           	moveq #48,d1
    4e1e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4e22:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {  
    4e26:	52af 0186      	addq.l #1,390(sp)
    4e2a:	700c           	moveq #12,d0
    4e2c:	b0af 0186      	cmp.l 390(sp),d0
    4e30:	6cb6           	bge.s 4de8 <TestZoom4Picture+0xd24>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    4e32:	222f 018a      	move.l 394(sp),d1
    4e36:	2001           	move.l d1,d0
    4e38:	d080           	add.l d0,d0
    4e3a:	d081           	add.l d1,d0
    4e3c:	2200           	move.l d0,d1
    4e3e:	e789           	lsl.l #3,d1
    4e40:	2041           	movea.l d1,a0
    4e42:	91c0           	suba.l d0,a0
    4e44:	41e8 0023      	lea 35(a0),a0
    4e48:	7000           	moveq #0,d0
    4e4a:	302f 01c6      	move.w 454(sp),d0
    4e4e:	2f08           	move.l a0,-(sp)
    4e50:	2f00           	move.l d0,-(sp)
    4e52:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e56:	2f2f 0056      	move.l 86(sp),-(sp)
    4e5a:	4eba 20ca      	jsr 6f26 <TestRow>(pc)
    4e5e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e62:	7230           	moveq #48,d1
    4e64:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    4e68:	222f 018a      	move.l 394(sp),d1
    4e6c:	2001           	move.l d1,d0
    4e6e:	d080           	add.l d0,d0
    4e70:	d081           	add.l d1,d0
    4e72:	2200           	move.l d0,d1
    4e74:	e789           	lsl.l #3,d1
    4e76:	2041           	movea.l d1,a0
    4e78:	91c0           	suba.l d0,a0
    4e7a:	41e8 0024      	lea 36(a0),a0
    4e7e:	7000           	moveq #0,d0
    4e80:	302f 01c6      	move.w 454(sp),d0
    4e84:	2f08           	move.l a0,-(sp)
    4e86:	2f00           	move.l d0,-(sp)
    4e88:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e8c:	2f2f 0056      	move.l 86(sp),-(sp)
    4e90:	4eba 2094      	jsr 6f26 <TestRow>(pc)
    4e94:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e98:	7030           	moveq #48,d0
    4e9a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4e9e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    4ea2:	222f 018a      	move.l 394(sp),d1
    4ea6:	2001           	move.l d1,d0
    4ea8:	d080           	add.l d0,d0
    4eaa:	d081           	add.l d1,d0
    4eac:	2200           	move.l d0,d1
    4eae:	e789           	lsl.l #3,d1
    4eb0:	2041           	movea.l d1,a0
    4eb2:	91c0           	suba.l d0,a0
    4eb4:	41e8 0025      	lea 37(a0),a0
    4eb8:	7000           	moveq #0,d0
    4eba:	302f 01c6      	move.w 454(sp),d0
    4ebe:	2f08           	move.l a0,-(sp)
    4ec0:	2f00           	move.l d0,-(sp)
    4ec2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ec6:	2f2f 0056      	move.l 86(sp),-(sp)
    4eca:	4eba 205a      	jsr 6f26 <TestRow>(pc)
    4ece:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ed2:	7230           	moveq #48,d1
    4ed4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    4ed8:	222f 018a      	move.l 394(sp),d1
    4edc:	2001           	move.l d1,d0
    4ede:	d080           	add.l d0,d0
    4ee0:	d081           	add.l d1,d0
    4ee2:	2200           	move.l d0,d1
    4ee4:	e789           	lsl.l #3,d1
    4ee6:	2041           	movea.l d1,a0
    4ee8:	91c0           	suba.l d0,a0
    4eea:	41e8 0026      	lea 38(a0),a0
    4eee:	7000           	moveq #0,d0
    4ef0:	302f 01c6      	move.w 454(sp),d0
    4ef4:	2f08           	move.l a0,-(sp)
    4ef6:	2f00           	move.l d0,-(sp)
    4ef8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4efc:	2f2f 0056      	move.l 86(sp),-(sp)
    4f00:	4eba 2024      	jsr 6f26 <TestRow>(pc)
    4f04:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4f08:	7030           	moveq #48,d0
    4f0a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4f0e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    4f12:	222f 018a      	move.l 394(sp),d1
    4f16:	2001           	move.l d1,d0
    4f18:	d080           	add.l d0,d0
    4f1a:	d081           	add.l d1,d0
    4f1c:	2200           	move.l d0,d1
    4f1e:	e789           	lsl.l #3,d1
    4f20:	2041           	movea.l d1,a0
    4f22:	91c0           	suba.l d0,a0
    4f24:	41e8 0027      	lea 39(a0),a0
    4f28:	7000           	moveq #0,d0
    4f2a:	302f 01c6      	move.w 454(sp),d0
    4f2e:	2f08           	move.l a0,-(sp)
    4f30:	2f00           	move.l d0,-(sp)
    4f32:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f36:	2f2f 0056      	move.l 86(sp),-(sp)
    4f3a:	4eba 1fea      	jsr 6f26 <TestRow>(pc)
    4f3e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4f42:	7230           	moveq #48,d1
    4f44:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    4f48:	222f 018a      	move.l 394(sp),d1
    4f4c:	2001           	move.l d1,d0
    4f4e:	d080           	add.l d0,d0
    4f50:	d081           	add.l d1,d0
    4f52:	2200           	move.l d0,d1
    4f54:	e789           	lsl.l #3,d1
    4f56:	2041           	movea.l d1,a0
    4f58:	91c0           	suba.l d0,a0
    4f5a:	41e8 0028      	lea 40(a0),a0
    4f5e:	7000           	moveq #0,d0
    4f60:	302f 01c6      	move.w 454(sp),d0
    4f64:	2f08           	move.l a0,-(sp)
    4f66:	2f00           	move.l d0,-(sp)
    4f68:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f6c:	2f2f 0056      	move.l 86(sp),-(sp)
    4f70:	4eba 1fb4      	jsr 6f26 <TestRow>(pc)
    4f74:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4f78:	7030           	moveq #48,d0
    4f7a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4f7e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    4f82:	222f 018a      	move.l 394(sp),d1
    4f86:	2001           	move.l d1,d0
    4f88:	d080           	add.l d0,d0
    4f8a:	d081           	add.l d1,d0
    4f8c:	2200           	move.l d0,d1
    4f8e:	e789           	lsl.l #3,d1
    4f90:	2041           	movea.l d1,a0
    4f92:	91c0           	suba.l d0,a0
    4f94:	41e8 0029      	lea 41(a0),a0
    4f98:	7000           	moveq #0,d0
    4f9a:	302f 01c6      	move.w 454(sp),d0
    4f9e:	2f08           	move.l a0,-(sp)
    4fa0:	2f00           	move.l d0,-(sp)
    4fa2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4fa6:	2f2f 0056      	move.l 86(sp),-(sp)
    4faa:	4eba 1f7a      	jsr 6f26 <TestRow>(pc)
    4fae:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4fb2:	7230           	moveq #48,d1
    4fb4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    4fb8:	222f 018a      	move.l 394(sp),d1
    4fbc:	2001           	move.l d1,d0
    4fbe:	d080           	add.l d0,d0
    4fc0:	d081           	add.l d1,d0
    4fc2:	2200           	move.l d0,d1
    4fc4:	e789           	lsl.l #3,d1
    4fc6:	2041           	movea.l d1,a0
    4fc8:	91c0           	suba.l d0,a0
    4fca:	41e8 002a      	lea 42(a0),a0
    4fce:	7000           	moveq #0,d0
    4fd0:	302f 01c6      	move.w 454(sp),d0
    4fd4:	2f08           	move.l a0,-(sp)
    4fd6:	2f00           	move.l d0,-(sp)
    4fd8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4fdc:	2f2f 0056      	move.l 86(sp),-(sp)
    4fe0:	4eba 1f44      	jsr 6f26 <TestRow>(pc)
    4fe4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4fe8:	7030           	moveq #48,d0
    4fea:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4fee:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    4ff2:	222f 018a      	move.l 394(sp),d1
    4ff6:	2001           	move.l d1,d0
    4ff8:	d080           	add.l d0,d0
    4ffa:	d081           	add.l d1,d0
    4ffc:	2200           	move.l d0,d1
    4ffe:	e789           	lsl.l #3,d1
    5000:	2041           	movea.l d1,a0
    5002:	91c0           	suba.l d0,a0
    5004:	41e8 002b      	lea 43(a0),a0
    5008:	7000           	moveq #0,d0
    500a:	302f 01c6      	move.w 454(sp),d0
    500e:	2f08           	move.l a0,-(sp)
    5010:	2f00           	move.l d0,-(sp)
    5012:	2f2f 01d0      	move.l 464(sp),-(sp)
    5016:	2f2f 0056      	move.l 86(sp),-(sp)
    501a:	4eba 1f0a      	jsr 6f26 <TestRow>(pc)
    501e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5022:	7230           	moveq #48,d1
    5024:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    5028:	222f 018a      	move.l 394(sp),d1
    502c:	2001           	move.l d1,d0
    502e:	d080           	add.l d0,d0
    5030:	d081           	add.l d1,d0
    5032:	2200           	move.l d0,d1
    5034:	e789           	lsl.l #3,d1
    5036:	2041           	movea.l d1,a0
    5038:	91c0           	suba.l d0,a0
    503a:	41e8 002c      	lea 44(a0),a0
    503e:	7000           	moveq #0,d0
    5040:	302f 01c6      	move.w 454(sp),d0
    5044:	2f08           	move.l a0,-(sp)
    5046:	2f00           	move.l d0,-(sp)
    5048:	2f2f 01d0      	move.l 464(sp),-(sp)
    504c:	2f2f 0056      	move.l 86(sp),-(sp)
    5050:	4eba 1ed4      	jsr 6f26 <TestRow>(pc)
    5054:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5058:	7030           	moveq #48,d0
    505a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    505e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<10;i++) {
    5062:	52af 018a      	addq.l #1,394(sp)
    5066:	7209           	moveq #9,d1
    5068:	b2af 018a      	cmp.l 394(sp),d1
    506c:	6c00 fd74      	bge.w 4de2 <TestZoom4Picture+0xd1e>
  }

  for(int i2=0;i2<13;i2++) {  
    5070:	42af 0182      	clr.l 386(sp)
    5074:	6032           	bra.s 50a8 <TestZoom4Picture+0xfe4>
    TestRow( valsupposed, valactual, mask, i2+253);
    5076:	222f 0182      	move.l 386(sp),d1
    507a:	0681 0000 00fd 	addi.l #253,d1
    5080:	7000           	moveq #0,d0
    5082:	302f 01c6      	move.w 454(sp),d0
    5086:	2f01           	move.l d1,-(sp)
    5088:	2f00           	move.l d0,-(sp)
    508a:	2f2f 01d0      	move.l 464(sp),-(sp)
    508e:	2f2f 0056      	move.l 86(sp),-(sp)
    5092:	4eba 1e92      	jsr 6f26 <TestRow>(pc)
    5096:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    509a:	7030           	moveq #48,d0
    509c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    50a0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    50a4:	52af 0182      	addq.l #1,386(sp)
    50a8:	720c           	moveq #12,d1
    50aa:	b2af 0182      	cmp.l 386(sp),d1
    50ae:	6cc6           	bge.s 5076 <TestZoom4Picture+0xfb2>
  }

  TestRow( valsupposed, valactual, mask, 266);
    50b0:	7000           	moveq #0,d0
    50b2:	302f 01c6      	move.w 454(sp),d0
    50b6:	4878 010a      	pea 10a <FreeDisplay+0x2a>
    50ba:	2f00           	move.l d0,-(sp)
    50bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    50c0:	2f2f 0056      	move.l 86(sp),-(sp)
    50c4:	4eba 1e60      	jsr 6f26 <TestRow>(pc)
    50c8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    50cc:	7030           	moveq #48,d0
    50ce:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 267);
    50d2:	7000           	moveq #0,d0
    50d4:	302f 01c6      	move.w 454(sp),d0
    50d8:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    50dc:	2f00           	move.l d0,-(sp)
    50de:	2f2f 01d0      	move.l 464(sp),-(sp)
    50e2:	2f2f 0056      	move.l 86(sp),-(sp)
    50e6:	4eba 1e3e      	jsr 6f26 <TestRow>(pc)
    50ea:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    50ee:	7230           	moveq #48,d1
    50f0:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    50f4:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 268);
    50f8:	7000           	moveq #0,d0
    50fa:	302f 01c6      	move.w 454(sp),d0
    50fe:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    5102:	2f00           	move.l d0,-(sp)
    5104:	2f2f 01d0      	move.l 464(sp),-(sp)
    5108:	2f2f 0056      	move.l 86(sp),-(sp)
    510c:	4eba 1e18      	jsr 6f26 <TestRow>(pc)
    5110:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5114:	7030           	moveq #48,d0
    5116:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 269);
    511a:	7000           	moveq #0,d0
    511c:	302f 01c6      	move.w 454(sp),d0
    5120:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5124:	2f00           	move.l d0,-(sp)
    5126:	2f2f 01d0      	move.l 464(sp),-(sp)
    512a:	2f2f 0056      	move.l 86(sp),-(sp)
    512e:	4eba 1df6      	jsr 6f26 <TestRow>(pc)
    5132:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5136:	7230           	moveq #48,d1
    5138:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    513c:	466f 01c6      	not.w 454(sp)

  tmp = source;
    5140:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5146:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    514c:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    5152:	4878 0001      	pea 1 <_start+0x1>
    5156:	4878 0005      	pea 5 <_start+0x5>
    515a:	2f2f 0056      	move.l 86(sp),-(sp)
    515e:	2f2f 006a      	move.l 106(sp),-(sp)
    5162:	4eba cb74      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    5166:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    516a:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    5170:	2c40           	movea.l d0,a6
    5172:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5176:	202f 004e      	move.l 78(sp),d0
    517a:	5880           	addq.l #4,d0
    517c:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom6;
    5180:	2f7c 0001 bac0 	move.l #113344,74(sp)
    5186:	004a 
  mask = 0x0000;
    5188:	426f 01c6      	clr.w 454(sp)
 
  for(int i2=0;i2<7;i2++) {  
    518c:	42af 017e      	clr.l 382(sp)
    5190:	602a           	bra.s 51bc <TestZoom4Picture+0x10f8>
    TestRow( valsupposed, valactual, mask, i2);
    5192:	7000           	moveq #0,d0
    5194:	302f 01c6      	move.w 454(sp),d0
    5198:	2f2f 017e      	move.l 382(sp),-(sp)
    519c:	2f00           	move.l d0,-(sp)
    519e:	2f2f 01d0      	move.l 464(sp),-(sp)
    51a2:	2f2f 0056      	move.l 86(sp),-(sp)
    51a6:	4eba 1d7e      	jsr 6f26 <TestRow>(pc)
    51aa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    51ae:	7230           	moveq #48,d1
    51b0:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    51b4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    51b8:	52af 017e      	addq.l #1,382(sp)
    51bc:	7006           	moveq #6,d0
    51be:	b0af 017e      	cmp.l 382(sp),d0
    51c2:	6cce           	bge.s 5192 <TestZoom4Picture+0x10ce>
  }

  for(int i=0;i<6;i++) {
    51c4:	42af 017a      	clr.l 378(sp)
    51c8:	605c           	bra.s 5226 <TestZoom4Picture+0x1162>
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    51ca:	202f 017a      	move.l 378(sp),d0
    51ce:	d080           	add.l d0,d0
    51d0:	2200           	move.l d0,d1
    51d2:	5e81           	addq.l #7,d1
    51d4:	7000           	moveq #0,d0
    51d6:	302f 01c6      	move.w 454(sp),d0
    51da:	2f01           	move.l d1,-(sp)
    51dc:	2f00           	move.l d0,-(sp)
    51de:	2f2f 01d0      	move.l 464(sp),-(sp)
    51e2:	2f2f 0056      	move.l 86(sp),-(sp)
    51e6:	4eba 1d3e      	jsr 6f26 <TestRow>(pc)
    51ea:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    51ee:	7230           	moveq #48,d1
    51f0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    51f4:	202f 017a      	move.l 378(sp),d0
    51f8:	5880           	addq.l #4,d0
    51fa:	d080           	add.l d0,d0
    51fc:	2200           	move.l d0,d1
    51fe:	7000           	moveq #0,d0
    5200:	302f 01c6      	move.w 454(sp),d0
    5204:	2f01           	move.l d1,-(sp)
    5206:	2f00           	move.l d0,-(sp)
    5208:	2f2f 01d0      	move.l 464(sp),-(sp)
    520c:	2f2f 0056      	move.l 86(sp),-(sp)
    5210:	4eba 1d14      	jsr 6f26 <TestRow>(pc)
    5214:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5218:	7030           	moveq #48,d0
    521a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    521e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<6;i++) {
    5222:	52af 017a      	addq.l #1,378(sp)
    5226:	7205           	moveq #5,d1
    5228:	b2af 017a      	cmp.l 378(sp),d1
    522c:	6c9c           	bge.s 51ca <TestZoom4Picture+0x1106>
  }

  for(int i=0;i<10;i++) {
    522e:	42af 0176      	clr.l 374(sp)
    5232:	6000 00ce      	bra.w 5302 <TestZoom4Picture+0x123e>
    for(int i2=0;i2<12;i2++) {  
    5236:	42af 0172      	clr.l 370(sp)
    523a:	6040           	bra.s 527c <TestZoom4Picture+0x11b8>
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    523c:	307c 0013      	movea.w #19,a0
    5240:	d1ef 0172      	adda.l 370(sp),a0
    5244:	222f 0176      	move.l 374(sp),d1
    5248:	2001           	move.l d1,d0
    524a:	d080           	add.l d0,d0
    524c:	d081           	add.l d1,d0
    524e:	e788           	lsl.l #3,d0
    5250:	2208           	move.l a0,d1
    5252:	d280           	add.l d0,d1
    5254:	7000           	moveq #0,d0
    5256:	302f 01c6      	move.w 454(sp),d0
    525a:	2f01           	move.l d1,-(sp)
    525c:	2f00           	move.l d0,-(sp)
    525e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5262:	2f2f 0056      	move.l 86(sp),-(sp)
    5266:	4eba 1cbe      	jsr 6f26 <TestRow>(pc)
    526a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    526e:	7030           	moveq #48,d0
    5270:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5274:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {  
    5278:	52af 0172      	addq.l #1,370(sp)
    527c:	720b           	moveq #11,d1
    527e:	b2af 0172      	cmp.l 370(sp),d1
    5282:	6cb8           	bge.s 523c <TestZoom4Picture+0x1178>
    }
    for(int i=0;i<6;i++) {
    5284:	42af 016e      	clr.l 366(sp)
    5288:	606c           	bra.s 52f6 <TestZoom4Picture+0x1232>
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    528a:	222f 016e      	move.l 366(sp),d1
    528e:	2001           	move.l d1,d0
    5290:	d080           	add.l d0,d0
    5292:	d081           	add.l d1,d0
    5294:	e788           	lsl.l #3,d0
    5296:	2040           	movea.l d0,a0
    5298:	41e8 001f      	lea 31(a0),a0
    529c:	7000           	moveq #0,d0
    529e:	302f 01c6      	move.w 454(sp),d0
    52a2:	2f08           	move.l a0,-(sp)
    52a4:	2f00           	move.l d0,-(sp)
    52a6:	2f2f 01d0      	move.l 464(sp),-(sp)
    52aa:	2f2f 0056      	move.l 86(sp),-(sp)
    52ae:	4eba 1c76      	jsr 6f26 <TestRow>(pc)
    52b2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    52b6:	7030           	moveq #48,d0
    52b8:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    52bc:	222f 016e      	move.l 366(sp),d1
    52c0:	2001           	move.l d1,d0
    52c2:	d080           	add.l d0,d0
    52c4:	d081           	add.l d1,d0
    52c6:	e788           	lsl.l #3,d0
    52c8:	2040           	movea.l d0,a0
    52ca:	41e8 0020      	lea 32(a0),a0
    52ce:	7000           	moveq #0,d0
    52d0:	302f 01c6      	move.w 454(sp),d0
    52d4:	2f08           	move.l a0,-(sp)
    52d6:	2f00           	move.l d0,-(sp)
    52d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    52dc:	2f2f 0056      	move.l 86(sp),-(sp)
    52e0:	4eba 1c44      	jsr 6f26 <TestRow>(pc)
    52e4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    52e8:	7230           	moveq #48,d1
    52ea:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    52ee:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<6;i++) {
    52f2:	52af 016e      	addq.l #1,366(sp)
    52f6:	7005           	moveq #5,d0
    52f8:	b0af 016e      	cmp.l 366(sp),d0
    52fc:	6c8c           	bge.s 528a <TestZoom4Picture+0x11c6>
  for(int i=0;i<10;i++) {
    52fe:	52af 0176      	addq.l #1,374(sp)
    5302:	7209           	moveq #9,d1
    5304:	b2af 0176      	cmp.l 374(sp),d1
    5308:	6c00 ff2c      	bge.w 5236 <TestZoom4Picture+0x1172>
    }
  }

  for(int i2=0;i2<11;i2++) {  
    530c:	42af 016a      	clr.l 362(sp)
    5310:	6032           	bra.s 5344 <TestZoom4Picture+0x1280>
    TestRow( valsupposed, valactual, mask, 258+i2);
    5312:	222f 016a      	move.l 362(sp),d1
    5316:	0681 0000 0102 	addi.l #258,d1
    531c:	7000           	moveq #0,d0
    531e:	302f 01c6      	move.w 454(sp),d0
    5322:	2f01           	move.l d1,-(sp)
    5324:	2f00           	move.l d0,-(sp)
    5326:	2f2f 01d0      	move.l 464(sp),-(sp)
    532a:	2f2f 0056      	move.l 86(sp),-(sp)
    532e:	4eba 1bf6      	jsr 6f26 <TestRow>(pc)
    5332:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5336:	7030           	moveq #48,d0
    5338:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    533c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {  
    5340:	52af 016a      	addq.l #1,362(sp)
    5344:	720a           	moveq #10,d1
    5346:	b2af 016a      	cmp.l 362(sp),d1
    534a:	6cc6           	bge.s 5312 <TestZoom4Picture+0x124e>
  }

  tmp = source;
    534c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5352:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5358:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    535e:	4878 0001      	pea 1 <_start+0x1>
    5362:	4878 0006      	pea 6 <_start+0x6>
    5366:	2f2f 0056      	move.l 86(sp),-(sp)
    536a:	2f2f 006a      	move.l 106(sp),-(sp)
    536e:	4eba c968      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    5372:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5376:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    537c:	2c40           	movea.l d0,a6
    537e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5382:	202f 004e      	move.l 78(sp),d0
    5386:	5880           	addq.l #4,d0
    5388:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom7;
    538c:	2f7c 0001 baec 	move.l #113388,74(sp)
    5392:	004a 
  mask = 0x0000;
    5394:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5398:	7000           	moveq #0,d0
    539a:	302f 01c6      	move.w 454(sp),d0
    539e:	42a7           	clr.l -(sp)
    53a0:	2f00           	move.l d0,-(sp)
    53a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    53a6:	2f2f 0056      	move.l 86(sp),-(sp)
    53aa:	4eba 1b7a      	jsr 6f26 <TestRow>(pc)
    53ae:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    53b2:	7230           	moveq #48,d1
    53b4:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    53b8:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    53bc:	42af 0166      	clr.l 358(sp)
    53c0:	605c           	bra.s 541e <TestZoom4Picture+0x135a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    53c2:	202f 0166      	move.l 358(sp),d0
    53c6:	d080           	add.l d0,d0
    53c8:	2200           	move.l d0,d1
    53ca:	5281           	addq.l #1,d1
    53cc:	7000           	moveq #0,d0
    53ce:	302f 01c6      	move.w 454(sp),d0
    53d2:	2f01           	move.l d1,-(sp)
    53d4:	2f00           	move.l d0,-(sp)
    53d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    53da:	2f2f 0056      	move.l 86(sp),-(sp)
    53de:	4eba 1b46      	jsr 6f26 <TestRow>(pc)
    53e2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    53e6:	7030           	moveq #48,d0
    53e8:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    53ec:	202f 0166      	move.l 358(sp),d0
    53f0:	5280           	addq.l #1,d0
    53f2:	d080           	add.l d0,d0
    53f4:	2200           	move.l d0,d1
    53f6:	7000           	moveq #0,d0
    53f8:	302f 01c6      	move.w 454(sp),d0
    53fc:	2f01           	move.l d1,-(sp)
    53fe:	2f00           	move.l d0,-(sp)
    5400:	2f2f 01d0      	move.l 464(sp),-(sp)
    5404:	2f2f 0056      	move.l 86(sp),-(sp)
    5408:	4eba 1b1c      	jsr 6f26 <TestRow>(pc)
    540c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5410:	7230           	moveq #48,d1
    5412:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5416:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    541a:	52af 0166      	addq.l #1,358(sp)
    541e:	7006           	moveq #6,d0
    5420:	b0af 0166      	cmp.l 358(sp),d0
    5424:	6c9c           	bge.s 53c2 <TestZoom4Picture+0x12fe>
  }

  for(int i=0;i<10;i++) {
    5426:	42af 0162      	clr.l 354(sp)
    542a:	6000 00d4      	bra.w 5500 <TestZoom4Picture+0x143c>
    for(int i2=0;i2<11;i2++) {  
    542e:	42af 015e      	clr.l 350(sp)
    5432:	6042           	bra.s 5476 <TestZoom4Picture+0x13b2>
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    5434:	307c 000f      	movea.w #15,a0
    5438:	d1ef 015e      	adda.l 350(sp),a0
    543c:	222f 0162      	move.l 354(sp),d1
    5440:	2001           	move.l d1,d0
    5442:	d080           	add.l d0,d0
    5444:	d081           	add.l d1,d0
    5446:	e788           	lsl.l #3,d0
    5448:	d081           	add.l d1,d0
    544a:	2208           	move.l a0,d1
    544c:	d280           	add.l d0,d1
    544e:	7000           	moveq #0,d0
    5450:	302f 01c6      	move.w 454(sp),d0
    5454:	2f01           	move.l d1,-(sp)
    5456:	2f00           	move.l d0,-(sp)
    5458:	2f2f 01d0      	move.l 464(sp),-(sp)
    545c:	2f2f 0056      	move.l 86(sp),-(sp)
    5460:	4eba 1ac4      	jsr 6f26 <TestRow>(pc)
    5464:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5468:	7230           	moveq #48,d1
    546a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    546e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {  
    5472:	52af 015e      	addq.l #1,350(sp)
    5476:	700a           	moveq #10,d0
    5478:	b0af 015e      	cmp.l 350(sp),d0
    547c:	6cb6           	bge.s 5434 <TestZoom4Picture+0x1370>
    }
    for(int i=0;i<7;i++) {
    547e:	42af 015a      	clr.l 346(sp)
    5482:	6070           	bra.s 54f4 <TestZoom4Picture+0x1430>
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    5484:	222f 015a      	move.l 346(sp),d1
    5488:	2001           	move.l d1,d0
    548a:	d080           	add.l d0,d0
    548c:	d081           	add.l d1,d0
    548e:	e788           	lsl.l #3,d0
    5490:	2040           	movea.l d0,a0
    5492:	d1c1           	adda.l d1,a0
    5494:	41e8 001a      	lea 26(a0),a0
    5498:	7000           	moveq #0,d0
    549a:	302f 01c6      	move.w 454(sp),d0
    549e:	2f08           	move.l a0,-(sp)
    54a0:	2f00           	move.l d0,-(sp)
    54a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    54a6:	2f2f 0056      	move.l 86(sp),-(sp)
    54aa:	4eba 1a7a      	jsr 6f26 <TestRow>(pc)
    54ae:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    54b2:	7230           	moveq #48,d1
    54b4:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    54b8:	222f 015a      	move.l 346(sp),d1
    54bc:	2001           	move.l d1,d0
    54be:	d080           	add.l d0,d0
    54c0:	d081           	add.l d1,d0
    54c2:	e788           	lsl.l #3,d0
    54c4:	2040           	movea.l d0,a0
    54c6:	d1c1           	adda.l d1,a0
    54c8:	41e8 001a      	lea 26(a0),a0
    54cc:	7000           	moveq #0,d0
    54ce:	302f 01c6      	move.w 454(sp),d0
    54d2:	2f08           	move.l a0,-(sp)
    54d4:	2f00           	move.l d0,-(sp)
    54d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    54da:	2f2f 0056      	move.l 86(sp),-(sp)
    54de:	4eba 1a46      	jsr 6f26 <TestRow>(pc)
    54e2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    54e6:	7030           	moveq #48,d0
    54e8:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    54ec:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<7;i++) {
    54f0:	52af 015a      	addq.l #1,346(sp)
    54f4:	7206           	moveq #6,d1
    54f6:	b2af 015a      	cmp.l 346(sp),d1
    54fa:	6c88           	bge.s 5484 <TestZoom4Picture+0x13c0>
  for(int i=0;i<10;i++) {
    54fc:	52af 0162      	addq.l #1,354(sp)
    5500:	7009           	moveq #9,d0
    5502:	b0af 0162      	cmp.l 354(sp),d0
    5506:	6c00 ff26      	bge.w 542e <TestZoom4Picture+0x136a>
    }
  }

  for(int i2=0;i2<5;i2++) {  
    550a:	42af 0156      	clr.l 342(sp)
    550e:	6032           	bra.s 5542 <TestZoom4Picture+0x147e>
    TestRow( valsupposed, valactual, mask, 256+i2);
    5510:	222f 0156      	move.l 342(sp),d1
    5514:	0681 0000 0100 	addi.l #256,d1
    551a:	7000           	moveq #0,d0
    551c:	302f 01c6      	move.w 454(sp),d0
    5520:	2f01           	move.l d1,-(sp)
    5522:	2f00           	move.l d0,-(sp)
    5524:	2f2f 01d0      	move.l 464(sp),-(sp)
    5528:	2f2f 0056      	move.l 86(sp),-(sp)
    552c:	4eba 19f8      	jsr 6f26 <TestRow>(pc)
    5530:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5534:	7230           	moveq #48,d1
    5536:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    553a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    553e:	52af 0156      	addq.l #1,342(sp)
    5542:	7004           	moveq #4,d0
    5544:	b0af 0156      	cmp.l 342(sp),d0
    5548:	6cc6           	bge.s 5510 <TestZoom4Picture+0x144c>
  }

  tmp = source;
    554a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5550:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5556:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    555c:	4878 0001      	pea 1 <_start+0x1>
    5560:	4878 0007      	pea 7 <_start+0x7>
    5564:	2f2f 0056      	move.l 86(sp),-(sp)
    5568:	2f2f 006a      	move.l 106(sp),-(sp)
    556c:	4eba c76a      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    5570:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5574:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    557a:	2c40           	movea.l d0,a6
    557c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5580:	222f 004e      	move.l 78(sp),d1
    5584:	5881           	addq.l #4,d1
    5586:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom8;
    558a:	2f7c 0001 bb18 	move.l #113432,74(sp)
    5590:	004a 
  mask = 0xffff;
    5592:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5598:	7000           	moveq #0,d0
    559a:	302f 01c6      	move.w 454(sp),d0
    559e:	42a7           	clr.l -(sp)
    55a0:	2f00           	move.l d0,-(sp)
    55a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    55a6:	2f2f 0056      	move.l 86(sp),-(sp)
    55aa:	4eba 197a      	jsr 6f26 <TestRow>(pc)
    55ae:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    55b2:	7030           	moveq #48,d0
    55b4:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    55b8:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    55bc:	42af 0152      	clr.l 338(sp)
    55c0:	605c           	bra.s 561e <TestZoom4Picture+0x155a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    55c2:	202f 0152      	move.l 338(sp),d0
    55c6:	d080           	add.l d0,d0
    55c8:	2200           	move.l d0,d1
    55ca:	5281           	addq.l #1,d1
    55cc:	7000           	moveq #0,d0
    55ce:	302f 01c6      	move.w 454(sp),d0
    55d2:	2f01           	move.l d1,-(sp)
    55d4:	2f00           	move.l d0,-(sp)
    55d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    55da:	2f2f 0056      	move.l 86(sp),-(sp)
    55de:	4eba 1946      	jsr 6f26 <TestRow>(pc)
    55e2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    55e6:	7230           	moveq #48,d1
    55e8:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    55ec:	202f 0152      	move.l 338(sp),d0
    55f0:	5280           	addq.l #1,d0
    55f2:	d080           	add.l d0,d0
    55f4:	2200           	move.l d0,d1
    55f6:	7000           	moveq #0,d0
    55f8:	302f 01c6      	move.w 454(sp),d0
    55fc:	2f01           	move.l d1,-(sp)
    55fe:	2f00           	move.l d0,-(sp)
    5600:	2f2f 01d0      	move.l 464(sp),-(sp)
    5604:	2f2f 0056      	move.l 86(sp),-(sp)
    5608:	4eba 191c      	jsr 6f26 <TestRow>(pc)
    560c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5610:	7030           	moveq #48,d0
    5612:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5616:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    561a:	52af 0152      	addq.l #1,338(sp)
    561e:	7204           	moveq #4,d1
    5620:	b2af 0152      	cmp.l 338(sp),d1
    5624:	6c9c           	bge.s 55c2 <TestZoom4Picture+0x14fe>
  }

  for(int i=0;i<9;i++) {
    5626:	42af 014e      	clr.l 334(sp)
    562a:	6000 00f0      	bra.w 571c <TestZoom4Picture+0x1658>
    for(int i2=0;i2<10;i2++) {  
    562e:	42af 014a      	clr.l 330(sp)
    5632:	6046           	bra.s 567a <TestZoom4Picture+0x15b6>
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    5634:	307c 000b      	movea.w #11,a0
    5638:	d1ef 014a      	adda.l 330(sp),a0
    563c:	222f 014e      	move.l 334(sp),d1
    5640:	2001           	move.l d1,d0
    5642:	d080           	add.l d0,d0
    5644:	d081           	add.l d1,d0
    5646:	d080           	add.l d0,d0
    5648:	d080           	add.l d0,d0
    564a:	d081           	add.l d1,d0
    564c:	d080           	add.l d0,d0
    564e:	2208           	move.l a0,d1
    5650:	d280           	add.l d0,d1
    5652:	7000           	moveq #0,d0
    5654:	302f 01c6      	move.w 454(sp),d0
    5658:	2f01           	move.l d1,-(sp)
    565a:	2f00           	move.l d0,-(sp)
    565c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5660:	2f2f 0056      	move.l 86(sp),-(sp)
    5664:	4eba 18c0      	jsr 6f26 <TestRow>(pc)
    5668:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    566c:	7030           	moveq #48,d0
    566e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5672:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {  
    5676:	52af 014a      	addq.l #1,330(sp)
    567a:	7209           	moveq #9,d1
    567c:	b2af 014a      	cmp.l 330(sp),d1
    5680:	6cb2           	bge.s 5634 <TestZoom4Picture+0x1570>
    }
    for(int i2=0;i2<8;i2++) {
    5682:	42af 0146      	clr.l 326(sp)
    5686:	6000 0086      	bra.w 570e <TestZoom4Picture+0x164a>
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    568a:	222f 014e      	move.l 334(sp),d1
    568e:	2001           	move.l d1,d0
    5690:	d080           	add.l d0,d0
    5692:	d081           	add.l d1,d0
    5694:	d080           	add.l d0,d0
    5696:	d080           	add.l d0,d0
    5698:	d081           	add.l d1,d0
    569a:	d080           	add.l d0,d0
    569c:	2040           	movea.l d0,a0
    569e:	41e8 0015      	lea 21(a0),a0
    56a2:	2208           	move.l a0,d1
    56a4:	d2af 0146      	add.l 326(sp),d1
    56a8:	7000           	moveq #0,d0
    56aa:	302f 01c6      	move.w 454(sp),d0
    56ae:	2f01           	move.l d1,-(sp)
    56b0:	2f00           	move.l d0,-(sp)
    56b2:	2f2f 01d0      	move.l 464(sp),-(sp)
    56b6:	2f2f 0056      	move.l 86(sp),-(sp)
    56ba:	4eba 186a      	jsr 6f26 <TestRow>(pc)
    56be:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    56c2:	7030           	moveq #48,d0
    56c4:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    56c8:	222f 014e      	move.l 334(sp),d1
    56cc:	2001           	move.l d1,d0
    56ce:	d080           	add.l d0,d0
    56d0:	d081           	add.l d1,d0
    56d2:	d080           	add.l d0,d0
    56d4:	d080           	add.l d0,d0
    56d6:	d081           	add.l d1,d0
    56d8:	d080           	add.l d0,d0
    56da:	2040           	movea.l d0,a0
    56dc:	41e8 0015      	lea 21(a0),a0
    56e0:	2208           	move.l a0,d1
    56e2:	d2af 0146      	add.l 326(sp),d1
    56e6:	7000           	moveq #0,d0
    56e8:	302f 01c6      	move.w 454(sp),d0
    56ec:	2f01           	move.l d1,-(sp)
    56ee:	2f00           	move.l d0,-(sp)
    56f0:	2f2f 01d0      	move.l 464(sp),-(sp)
    56f4:	2f2f 0056      	move.l 86(sp),-(sp)
    56f8:	4eba 182c      	jsr 6f26 <TestRow>(pc)
    56fc:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5700:	7230           	moveq #48,d1
    5702:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5706:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {
    570a:	52af 0146      	addq.l #1,326(sp)
    570e:	7007           	moveq #7,d0
    5710:	b0af 0146      	cmp.l 326(sp),d0
    5714:	6c00 ff74      	bge.w 568a <TestZoom4Picture+0x15c6>
  for(int i=0;i<9;i++) {
    5718:	52af 014e      	addq.l #1,334(sp)
    571c:	7208           	moveq #8,d1
    571e:	b2af 014e      	cmp.l 334(sp),d1
    5722:	6c00 ff0a      	bge.w 562e <TestZoom4Picture+0x156a>
    }
  }

  for(int i2=0;i2<10;i2++) {  
    5726:	42af 0142      	clr.l 322(sp)
    572a:	6032           	bra.s 575e <TestZoom4Picture+0x169a>
    TestRow( valsupposed, valactual, mask, 245+i2);
    572c:	222f 0142      	move.l 322(sp),d1
    5730:	0681 0000 00f5 	addi.l #245,d1
    5736:	7000           	moveq #0,d0
    5738:	302f 01c6      	move.w 454(sp),d0
    573c:	2f01           	move.l d1,-(sp)
    573e:	2f00           	move.l d0,-(sp)
    5740:	2f2f 01d0      	move.l 464(sp),-(sp)
    5744:	2f2f 0056      	move.l 86(sp),-(sp)
    5748:	4eba 17dc      	jsr 6f26 <TestRow>(pc)
    574c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5750:	7030           	moveq #48,d0
    5752:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5756:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {  
    575a:	52af 0142      	addq.l #1,322(sp)
    575e:	7209           	moveq #9,d1
    5760:	b2af 0142      	cmp.l 322(sp),d1
    5764:	6cc6           	bge.s 572c <TestZoom4Picture+0x1668>
  }
  for(int i=0;i<7;i++) {
    5766:	42af 013e      	clr.l 318(sp)
    576a:	6064           	bra.s 57d0 <TestZoom4Picture+0x170c>
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    576c:	202f 013e      	move.l 318(sp),d0
    5770:	d080           	add.l d0,d0
    5772:	2200           	move.l d0,d1
    5774:	0681 0000 00ff 	addi.l #255,d1
    577a:	7000           	moveq #0,d0
    577c:	302f 01c6      	move.w 454(sp),d0
    5780:	2f01           	move.l d1,-(sp)
    5782:	2f00           	move.l d0,-(sp)
    5784:	2f2f 01d0      	move.l 464(sp),-(sp)
    5788:	2f2f 0056      	move.l 86(sp),-(sp)
    578c:	4eba 1798      	jsr 6f26 <TestRow>(pc)
    5790:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5794:	7030           	moveq #48,d0
    5796:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    579a:	202f 013e      	move.l 318(sp),d0
    579e:	0680 0000 0080 	addi.l #128,d0
    57a4:	d080           	add.l d0,d0
    57a6:	2200           	move.l d0,d1
    57a8:	7000           	moveq #0,d0
    57aa:	302f 01c6      	move.w 454(sp),d0
    57ae:	2f01           	move.l d1,-(sp)
    57b0:	2f00           	move.l d0,-(sp)
    57b2:	2f2f 01d0      	move.l 464(sp),-(sp)
    57b6:	2f2f 0056      	move.l 86(sp),-(sp)
    57ba:	4eba 176a      	jsr 6f26 <TestRow>(pc)
    57be:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    57c2:	7230           	moveq #48,d1
    57c4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    57c8:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    57cc:	52af 013e      	addq.l #1,318(sp)
    57d0:	7006           	moveq #6,d0
    57d2:	b0af 013e      	cmp.l 318(sp),d0
    57d6:	6c94           	bge.s 576c <TestZoom4Picture+0x16a8>
  }
  TestRow( valsupposed, valactual, mask, 269);
    57d8:	7000           	moveq #0,d0
    57da:	302f 01c6      	move.w 454(sp),d0
    57de:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    57e2:	2f00           	move.l d0,-(sp)
    57e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    57e8:	2f2f 0056      	move.l 86(sp),-(sp)
    57ec:	4eba 1738      	jsr 6f26 <TestRow>(pc)
    57f0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    57f4:	7230           	moveq #48,d1
    57f6:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    57fa:	466f 01c6      	not.w 454(sp)
 
  tmp = source;
    57fe:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5804:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    580a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    5810:	4878 0001      	pea 1 <_start+0x1>
    5814:	4878 0008      	pea 8 <_start+0x8>
    5818:	2f2f 0056      	move.l 86(sp),-(sp)
    581c:	2f2f 006a      	move.l 106(sp),-(sp)
    5820:	4eba c4b6      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    5824:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5828:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    582e:	2c40           	movea.l d0,a6
    5830:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5834:	202f 004e      	move.l 78(sp),d0
    5838:	5880           	addq.l #4,d0
    583a:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom9;
    583e:	2f7c 0001 bb44 	move.l #113476,74(sp)
    5844:	004a 
  mask = 0x0000;
    5846:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    584a:	7000           	moveq #0,d0
    584c:	302f 01c6      	move.w 454(sp),d0
    5850:	42a7           	clr.l -(sp)
    5852:	2f00           	move.l d0,-(sp)
    5854:	2f2f 01d0      	move.l 464(sp),-(sp)
    5858:	2f2f 0056      	move.l 86(sp),-(sp)
    585c:	4eba 16c8      	jsr 6f26 <TestRow>(pc)
    5860:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5864:	7230           	moveq #48,d1
    5866:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    586a:	466f 01c6      	not.w 454(sp)
  
  for(int i=0;i<3;i++) {
    586e:	42af 013a      	clr.l 314(sp)
    5872:	605c           	bra.s 58d0 <TestZoom4Picture+0x180c>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    5874:	202f 013a      	move.l 314(sp),d0
    5878:	d080           	add.l d0,d0
    587a:	2200           	move.l d0,d1
    587c:	5281           	addq.l #1,d1
    587e:	7000           	moveq #0,d0
    5880:	302f 01c6      	move.w 454(sp),d0
    5884:	2f01           	move.l d1,-(sp)
    5886:	2f00           	move.l d0,-(sp)
    5888:	2f2f 01d0      	move.l 464(sp),-(sp)
    588c:	2f2f 0056      	move.l 86(sp),-(sp)
    5890:	4eba 1694      	jsr 6f26 <TestRow>(pc)
    5894:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5898:	7030           	moveq #48,d0
    589a:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    589e:	202f 013a      	move.l 314(sp),d0
    58a2:	5280           	addq.l #1,d0
    58a4:	d080           	add.l d0,d0
    58a6:	2200           	move.l d0,d1
    58a8:	7000           	moveq #0,d0
    58aa:	302f 01c6      	move.w 454(sp),d0
    58ae:	2f01           	move.l d1,-(sp)
    58b0:	2f00           	move.l d0,-(sp)
    58b2:	2f2f 01d0      	move.l 464(sp),-(sp)
    58b6:	2f2f 0056      	move.l 86(sp),-(sp)
    58ba:	4eba 166a      	jsr 6f26 <TestRow>(pc)
    58be:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    58c2:	7230           	moveq #48,d1
    58c4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    58c8:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    58cc:	52af 013a      	addq.l #1,314(sp)
    58d0:	7002           	moveq #2,d0
    58d2:	b0af 013a      	cmp.l 314(sp),d0
    58d6:	6c9c           	bge.s 5874 <TestZoom4Picture+0x17b0>
  }

  for(int i=0;i<9;i++) {
    58d8:	42af 0136      	clr.l 310(sp)
    58dc:	6000 00ea      	bra.w 59c8 <TestZoom4Picture+0x1904>
    for(int i2=0;i2<9;i2++) {  
    58e0:	42af 0132      	clr.l 306(sp)
    58e4:	6044           	bra.s 592a <TestZoom4Picture+0x1866>
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    58e6:	307c 000b      	movea.w #11,a0
    58ea:	d1ef 0132      	adda.l 306(sp),a0
    58ee:	222f 0136      	move.l 310(sp),d1
    58f2:	2001           	move.l d1,d0
    58f4:	d080           	add.l d0,d0
    58f6:	d081           	add.l d1,d0
    58f8:	2200           	move.l d0,d1
    58fa:	e789           	lsl.l #3,d1
    58fc:	d081           	add.l d1,d0
    58fe:	2208           	move.l a0,d1
    5900:	d280           	add.l d0,d1
    5902:	7000           	moveq #0,d0
    5904:	302f 01c6      	move.w 454(sp),d0
    5908:	2f01           	move.l d1,-(sp)
    590a:	2f00           	move.l d0,-(sp)
    590c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5910:	2f2f 0056      	move.l 86(sp),-(sp)
    5914:	4eba 1610      	jsr 6f26 <TestRow>(pc)
    5918:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    591c:	7230           	moveq #48,d1
    591e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5922:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {  
    5926:	52af 0132      	addq.l #1,306(sp)
    592a:	7008           	moveq #8,d0
    592c:	b0af 0132      	cmp.l 306(sp),d0
    5930:	6cb4           	bge.s 58e6 <TestZoom4Picture+0x1822>
    }
    
    for(int i2=0;i2<9;i2++) {
    5932:	42af 012e      	clr.l 302(sp)
    5936:	6000 0082      	bra.w 59ba <TestZoom4Picture+0x18f6>
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    593a:	222f 0136      	move.l 310(sp),d1
    593e:	2001           	move.l d1,d0
    5940:	d080           	add.l d0,d0
    5942:	d081           	add.l d1,d0
    5944:	2200           	move.l d0,d1
    5946:	e789           	lsl.l #3,d1
    5948:	2040           	movea.l d0,a0
    594a:	d1c1           	adda.l d1,a0
    594c:	41e8 0014      	lea 20(a0),a0
    5950:	2208           	move.l a0,d1
    5952:	d2af 012e      	add.l 302(sp),d1
    5956:	7000           	moveq #0,d0
    5958:	302f 01c6      	move.w 454(sp),d0
    595c:	2f01           	move.l d1,-(sp)
    595e:	2f00           	move.l d0,-(sp)
    5960:	2f2f 01d0      	move.l 464(sp),-(sp)
    5964:	2f2f 0056      	move.l 86(sp),-(sp)
    5968:	4eba 15bc      	jsr 6f26 <TestRow>(pc)
    596c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5970:	7230           	moveq #48,d1
    5972:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    5976:	222f 0136      	move.l 310(sp),d1
    597a:	2001           	move.l d1,d0
    597c:	d080           	add.l d0,d0
    597e:	d081           	add.l d1,d0
    5980:	2200           	move.l d0,d1
    5982:	e789           	lsl.l #3,d1
    5984:	2040           	movea.l d0,a0
    5986:	d1c1           	adda.l d1,a0
    5988:	41e8 0015      	lea 21(a0),a0
    598c:	2208           	move.l a0,d1
    598e:	d2af 012e      	add.l 302(sp),d1
    5992:	7000           	moveq #0,d0
    5994:	302f 01c6      	move.w 454(sp),d0
    5998:	2f01           	move.l d1,-(sp)
    599a:	2f00           	move.l d0,-(sp)
    599c:	2f2f 01d0      	move.l 464(sp),-(sp)
    59a0:	2f2f 0056      	move.l 86(sp),-(sp)
    59a4:	4eba 1580      	jsr 6f26 <TestRow>(pc)
    59a8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    59ac:	7030           	moveq #48,d0
    59ae:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    59b2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {
    59b6:	52af 012e      	addq.l #1,302(sp)
    59ba:	7208           	moveq #8,d1
    59bc:	b2af 012e      	cmp.l 302(sp),d1
    59c0:	6c00 ff78      	bge.w 593a <TestZoom4Picture+0x1876>
  for(int i=0;i<9;i++) {
    59c4:	52af 0136      	addq.l #1,310(sp)
    59c8:	7008           	moveq #8,d0
    59ca:	b0af 0136      	cmp.l 310(sp),d0
    59ce:	6c00 ff10      	bge.w 58e0 <TestZoom4Picture+0x181c>
    }
  }

  for(int i2=0;i2<9;i2++) {  
    59d2:	42af 012a      	clr.l 298(sp)
    59d6:	6032           	bra.s 5a0a <TestZoom4Picture+0x1946>
    TestRow( valsupposed, valactual, mask, 245+i2);
    59d8:	222f 012a      	move.l 298(sp),d1
    59dc:	0681 0000 00f5 	addi.l #245,d1
    59e2:	7000           	moveq #0,d0
    59e4:	302f 01c6      	move.w 454(sp),d0
    59e8:	2f01           	move.l d1,-(sp)
    59ea:	2f00           	move.l d0,-(sp)
    59ec:	2f2f 01d0      	move.l 464(sp),-(sp)
    59f0:	2f2f 0056      	move.l 86(sp),-(sp)
    59f4:	4eba 1530      	jsr 6f26 <TestRow>(pc)
    59f8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    59fc:	7230           	moveq #48,d1
    59fe:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5a02:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {  
    5a06:	52af 012a      	addq.l #1,298(sp)
    5a0a:	7008           	moveq #8,d0
    5a0c:	b0af 012a      	cmp.l 298(sp),d0
    5a10:	6cc6           	bge.s 59d8 <TestZoom4Picture+0x1914>
  }
  for(int i=0;i<5;i++) {
    5a12:	42af 0126      	clr.l 294(sp)
    5a16:	6064           	bra.s 5a7c <TestZoom4Picture+0x19b8>
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    5a18:	202f 0126      	move.l 294(sp),d0
    5a1c:	d080           	add.l d0,d0
    5a1e:	2200           	move.l d0,d1
    5a20:	0681 0000 0103 	addi.l #259,d1
    5a26:	7000           	moveq #0,d0
    5a28:	302f 01c6      	move.w 454(sp),d0
    5a2c:	2f01           	move.l d1,-(sp)
    5a2e:	2f00           	move.l d0,-(sp)
    5a30:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a34:	2f2f 0056      	move.l 86(sp),-(sp)
    5a38:	4eba 14ec      	jsr 6f26 <TestRow>(pc)
    5a3c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a40:	7230           	moveq #48,d1
    5a42:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    5a46:	202f 0126      	move.l 294(sp),d0
    5a4a:	0680 0000 0082 	addi.l #130,d0
    5a50:	d080           	add.l d0,d0
    5a52:	2200           	move.l d0,d1
    5a54:	7000           	moveq #0,d0
    5a56:	302f 01c6      	move.w 454(sp),d0
    5a5a:	2f01           	move.l d1,-(sp)
    5a5c:	2f00           	move.l d0,-(sp)
    5a5e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a62:	2f2f 0056      	move.l 86(sp),-(sp)
    5a66:	4eba 14be      	jsr 6f26 <TestRow>(pc)
    5a6a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a6e:	7030           	moveq #48,d0
    5a70:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5a74:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5a78:	52af 0126      	addq.l #1,294(sp)
    5a7c:	7204           	moveq #4,d1
    5a7e:	b2af 0126      	cmp.l 294(sp),d1
    5a82:	6c94           	bge.s 5a18 <TestZoom4Picture+0x1954>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5a84:	7000           	moveq #0,d0
    5a86:	302f 01c6      	move.w 454(sp),d0
    5a8a:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5a8e:	2f00           	move.l d0,-(sp)
    5a90:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a94:	2f2f 0056      	move.l 86(sp),-(sp)
    5a98:	4eba 148c      	jsr 6f26 <TestRow>(pc)
    5a9c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5aa0:	7030           	moveq #48,d0
    5aa2:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5aa6:	466f 01c6      	not.w 454(sp)

  tmp = source;
    5aaa:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5ab0:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5ab6:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    5abc:	4878 0001      	pea 1 <_start+0x1>
    5ac0:	4878 0009      	pea 9 <_start+0x9>
    5ac4:	2f2f 0056      	move.l 86(sp),-(sp)
    5ac8:	2f2f 006a      	move.l 106(sp),-(sp)
    5acc:	4eba c20a      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    5ad0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5ad4:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    5ada:	2c40           	movea.l d0,a6
    5adc:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5ae0:	222f 004e      	move.l 78(sp),d1
    5ae4:	5881           	addq.l #4,d1
    5ae6:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom10;
    5aea:	2f7c 0001 bb70 	move.l #113520,74(sp)
    5af0:	004a 

  mask = 0xffff;
    5af2:	3f7c ffff 01c6 	move.w #-1,454(sp)
  TestRow( valsupposed, valactual, mask, 0);
    5af8:	7000           	moveq #0,d0
    5afa:	302f 01c6      	move.w 454(sp),d0
    5afe:	42a7           	clr.l -(sp)
    5b00:	2f00           	move.l d0,-(sp)
    5b02:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b06:	2f2f 0056      	move.l 86(sp),-(sp)
    5b0a:	4eba 141a      	jsr 6f26 <TestRow>(pc)
    5b0e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b12:	7030           	moveq #48,d0
    5b14:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5b18:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 1);   
    5b1c:	7000           	moveq #0,d0
    5b1e:	302f 01c6      	move.w 454(sp),d0
    5b22:	4878 0001      	pea 1 <_start+0x1>
    5b26:	2f00           	move.l d0,-(sp)
    5b28:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b2c:	2f2f 0056      	move.l 86(sp),-(sp)
    5b30:	4eba 13f4      	jsr 6f26 <TestRow>(pc)
    5b34:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b38:	7230           	moveq #48,d1
    5b3a:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 2);
    5b3e:	7000           	moveq #0,d0
    5b40:	302f 01c6      	move.w 454(sp),d0
    5b44:	4878 0002      	pea 2 <_start+0x2>
    5b48:	2f00           	move.l d0,-(sp)
    5b4a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b4e:	2f2f 0056      	move.l 86(sp),-(sp)
    5b52:	4eba 13d2      	jsr 6f26 <TestRow>(pc)
    5b56:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b5a:	7030           	moveq #48,d0
    5b5c:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5b60:	466f 01c6      	not.w 454(sp)

  for(int i=0;i<9;i++) {
    5b64:	42af 0122      	clr.l 290(sp)
    5b68:	6000 00e0      	bra.w 5c4a <TestZoom4Picture+0x1b86>
    for(int i2=0;i2<8;i2++) {  
    5b6c:	42af 011e      	clr.l 286(sp)
    5b70:	6040           	bra.s 5bb2 <TestZoom4Picture+0x1aee>
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    5b72:	206f 011e      	movea.l 286(sp),a0
    5b76:	5688           	addq.l #3,a0
    5b78:	222f 0122      	move.l 290(sp),d1
    5b7c:	2001           	move.l d1,d0
    5b7e:	e788           	lsl.l #3,d0
    5b80:	9081           	sub.l d1,d0
    5b82:	d080           	add.l d0,d0
    5b84:	d080           	add.l d0,d0
    5b86:	2208           	move.l a0,d1
    5b88:	d280           	add.l d0,d1
    5b8a:	7000           	moveq #0,d0
    5b8c:	302f 01c6      	move.w 454(sp),d0
    5b90:	2f01           	move.l d1,-(sp)
    5b92:	2f00           	move.l d0,-(sp)
    5b94:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b98:	2f2f 0056      	move.l 86(sp),-(sp)
    5b9c:	4eba 1388      	jsr 6f26 <TestRow>(pc)
    5ba0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5ba4:	7230           	moveq #48,d1
    5ba6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5baa:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {  
    5bae:	52af 011e      	addq.l #1,286(sp)
    5bb2:	7007           	moveq #7,d0
    5bb4:	b0af 011e      	cmp.l 286(sp),d0
    5bb8:	6cb8           	bge.s 5b72 <TestZoom4Picture+0x1aae>
    }
    
    for(int i2=0;i2<10;i2++) {
    5bba:	42af 011a      	clr.l 282(sp)
    5bbe:	607c           	bra.s 5c3c <TestZoom4Picture+0x1b78>
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    5bc0:	222f 0122      	move.l 290(sp),d1
    5bc4:	2001           	move.l d1,d0
    5bc6:	e788           	lsl.l #3,d0
    5bc8:	9081           	sub.l d1,d0
    5bca:	d080           	add.l d0,d0
    5bcc:	d080           	add.l d0,d0
    5bce:	2040           	movea.l d0,a0
    5bd0:	41e8 000b      	lea 11(a0),a0
    5bd4:	2208           	move.l a0,d1
    5bd6:	d2af 011a      	add.l 282(sp),d1
    5bda:	7000           	moveq #0,d0
    5bdc:	302f 01c6      	move.w 454(sp),d0
    5be0:	2f01           	move.l d1,-(sp)
    5be2:	2f00           	move.l d0,-(sp)
    5be4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5be8:	2f2f 0056      	move.l 86(sp),-(sp)
    5bec:	4eba 1338      	jsr 6f26 <TestRow>(pc)
    5bf0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5bf4:	7230           	moveq #48,d1
    5bf6:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    5bfa:	222f 0122      	move.l 290(sp),d1
    5bfe:	2001           	move.l d1,d0
    5c00:	e788           	lsl.l #3,d0
    5c02:	9081           	sub.l d1,d0
    5c04:	d080           	add.l d0,d0
    5c06:	d080           	add.l d0,d0
    5c08:	2040           	movea.l d0,a0
    5c0a:	41e8 000b      	lea 11(a0),a0
    5c0e:	2208           	move.l a0,d1
    5c10:	d2af 011a      	add.l 282(sp),d1
    5c14:	7000           	moveq #0,d0
    5c16:	302f 01c6      	move.w 454(sp),d0
    5c1a:	2f01           	move.l d1,-(sp)
    5c1c:	2f00           	move.l d0,-(sp)
    5c1e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c22:	2f2f 0056      	move.l 86(sp),-(sp)
    5c26:	4eba 12fe      	jsr 6f26 <TestRow>(pc)
    5c2a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5c2e:	7030           	moveq #48,d0
    5c30:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5c34:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {
    5c38:	52af 011a      	addq.l #1,282(sp)
    5c3c:	7209           	moveq #9,d1
    5c3e:	b2af 011a      	cmp.l 282(sp),d1
    5c42:	6c00 ff7c      	bge.w 5bc0 <TestZoom4Picture+0x1afc>
  for(int i=0;i<9;i++) {
    5c46:	52af 0122      	addq.l #1,290(sp)
    5c4a:	7008           	moveq #8,d0
    5c4c:	b0af 0122      	cmp.l 290(sp),d0
    5c50:	6c00 ff1a      	bge.w 5b6c <TestZoom4Picture+0x1aa8>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    5c54:	42af 0116      	clr.l 278(sp)
    5c58:	6032           	bra.s 5c8c <TestZoom4Picture+0x1bc8>
    TestRow( valsupposed, valactual, mask, 255+i2);
    5c5a:	222f 0116      	move.l 278(sp),d1
    5c5e:	0681 0000 00ff 	addi.l #255,d1
    5c64:	7000           	moveq #0,d0
    5c66:	302f 01c6      	move.w 454(sp),d0
    5c6a:	2f01           	move.l d1,-(sp)
    5c6c:	2f00           	move.l d0,-(sp)
    5c6e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c72:	2f2f 0056      	move.l 86(sp),-(sp)
    5c76:	4eba 12ae      	jsr 6f26 <TestRow>(pc)
    5c7a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5c7e:	7230           	moveq #48,d1
    5c80:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5c84:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    5c88:	52af 0116      	addq.l #1,278(sp)
    5c8c:	7007           	moveq #7,d0
    5c8e:	b0af 0116      	cmp.l 278(sp),d0
    5c92:	6cc6           	bge.s 5c5a <TestZoom4Picture+0x1b96>
  }
  for(int i=0;i<3;i++) {
    5c94:	42af 0112      	clr.l 274(sp)
    5c98:	6064           	bra.s 5cfe <TestZoom4Picture+0x1c3a>
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    5c9a:	202f 0112      	move.l 274(sp),d0
    5c9e:	d080           	add.l d0,d0
    5ca0:	2200           	move.l d0,d1
    5ca2:	0681 0000 0107 	addi.l #263,d1
    5ca8:	7000           	moveq #0,d0
    5caa:	302f 01c6      	move.w 454(sp),d0
    5cae:	2f01           	move.l d1,-(sp)
    5cb0:	2f00           	move.l d0,-(sp)
    5cb2:	2f2f 01d0      	move.l 464(sp),-(sp)
    5cb6:	2f2f 0056      	move.l 86(sp),-(sp)
    5cba:	4eba 126a      	jsr 6f26 <TestRow>(pc)
    5cbe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5cc2:	7230           	moveq #48,d1
    5cc4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    5cc8:	202f 0112      	move.l 274(sp),d0
    5ccc:	0680 0000 0084 	addi.l #132,d0
    5cd2:	d080           	add.l d0,d0
    5cd4:	2200           	move.l d0,d1
    5cd6:	7000           	moveq #0,d0
    5cd8:	302f 01c6      	move.w 454(sp),d0
    5cdc:	2f01           	move.l d1,-(sp)
    5cde:	2f00           	move.l d0,-(sp)
    5ce0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ce4:	2f2f 0056      	move.l 86(sp),-(sp)
    5ce8:	4eba 123c      	jsr 6f26 <TestRow>(pc)
    5cec:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5cf0:	7030           	moveq #48,d0
    5cf2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5cf6:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    5cfa:	52af 0112      	addq.l #1,274(sp)
    5cfe:	7202           	moveq #2,d1
    5d00:	b2af 0112      	cmp.l 274(sp),d1
    5d04:	6c94           	bge.s 5c9a <TestZoom4Picture+0x1bd6>
  }

  tmp = source;
    5d06:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5d0c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5d12:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    5d18:	4878 0001      	pea 1 <_start+0x1>
    5d1c:	4878 000a      	pea a <_start+0xa>
    5d20:	2f2f 0056      	move.l 86(sp),-(sp)
    5d24:	2f2f 006a      	move.l 106(sp),-(sp)
    5d28:	4eba bfae      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    5d2c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5d30:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    5d36:	2c40           	movea.l d0,a6
    5d38:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5d3c:	202f 004e      	move.l 78(sp),d0
    5d40:	5880           	addq.l #4,d0
    5d42:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom11;
    5d46:	2f7c 0001 bb9c 	move.l #113564,74(sp)
    5d4c:	004a 

  mask = 0xffff;
    5d4e:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  for(int i2=0;i2<6;i2++) {  
    5d54:	42af 010e      	clr.l 270(sp)
    5d58:	602a           	bra.s 5d84 <TestZoom4Picture+0x1cc0>
    TestRow( valsupposed, valactual, mask, i2);
    5d5a:	7000           	moveq #0,d0
    5d5c:	302f 01c6      	move.w 454(sp),d0
    5d60:	2f2f 010e      	move.l 270(sp),-(sp)
    5d64:	2f00           	move.l d0,-(sp)
    5d66:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d6a:	2f2f 0056      	move.l 86(sp),-(sp)
    5d6e:	4eba 11b6      	jsr 6f26 <TestRow>(pc)
    5d72:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5d76:	7230           	moveq #48,d1
    5d78:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5d7c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {  
    5d80:	52af 010e      	addq.l #1,270(sp)
    5d84:	7005           	moveq #5,d0
    5d86:	b0af 010e      	cmp.l 270(sp),d0
    5d8a:	6cce           	bge.s 5d5a <TestZoom4Picture+0x1c96>
  }

  for(int i2=0;i2<11;i2++) {
    5d8c:	42af 010a      	clr.l 266(sp)
    5d90:	605c           	bra.s 5dee <TestZoom4Picture+0x1d2a>
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    5d92:	202f 010a      	move.l 266(sp),d0
    5d96:	5680           	addq.l #3,d0
    5d98:	d080           	add.l d0,d0
    5d9a:	2200           	move.l d0,d1
    5d9c:	7000           	moveq #0,d0
    5d9e:	302f 01c6      	move.w 454(sp),d0
    5da2:	2f01           	move.l d1,-(sp)
    5da4:	2f00           	move.l d0,-(sp)
    5da6:	2f2f 01d0      	move.l 464(sp),-(sp)
    5daa:	2f2f 0056      	move.l 86(sp),-(sp)
    5dae:	4eba 1176      	jsr 6f26 <TestRow>(pc)
    5db2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5db6:	7230           	moveq #48,d1
    5db8:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    5dbc:	202f 010a      	move.l 266(sp),d0
    5dc0:	d080           	add.l d0,d0
    5dc2:	2200           	move.l d0,d1
    5dc4:	5e81           	addq.l #7,d1
    5dc6:	7000           	moveq #0,d0
    5dc8:	302f 01c6      	move.w 454(sp),d0
    5dcc:	2f01           	move.l d1,-(sp)
    5dce:	2f00           	move.l d0,-(sp)
    5dd0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5dd4:	2f2f 0056      	move.l 86(sp),-(sp)
    5dd8:	4eba 114c      	jsr 6f26 <TestRow>(pc)
    5ddc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5de0:	7030           	moveq #48,d0
    5de2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5de6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5dea:	52af 010a      	addq.l #1,266(sp)
    5dee:	720a           	moveq #10,d1
    5df0:	b2af 010a      	cmp.l 266(sp),d1
    5df4:	6c9c           	bge.s 5d92 <TestZoom4Picture+0x1cce>
  }

  for(int i=0;i<8;i++) {
    5df6:	42af 0106      	clr.l 262(sp)
    5dfa:	6000 00f2      	bra.w 5eee <TestZoom4Picture+0x1e2a>
    for(int i2=0;i2<7;i2++) {  
    5dfe:	42af 0102      	clr.l 258(sp)
    5e02:	6044           	bra.s 5e48 <TestZoom4Picture+0x1d84>
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    5e04:	307c 001c      	movea.w #28,a0
    5e08:	d1ef 0102      	adda.l 258(sp),a0
    5e0c:	222f 0106      	move.l 262(sp),d1
    5e10:	2001           	move.l d1,d0
    5e12:	e788           	lsl.l #3,d0
    5e14:	9081           	sub.l d1,d0
    5e16:	d080           	add.l d0,d0
    5e18:	d080           	add.l d0,d0
    5e1a:	d081           	add.l d1,d0
    5e1c:	2208           	move.l a0,d1
    5e1e:	d280           	add.l d0,d1
    5e20:	7000           	moveq #0,d0
    5e22:	302f 01c6      	move.w 454(sp),d0
    5e26:	2f01           	move.l d1,-(sp)
    5e28:	2f00           	move.l d0,-(sp)
    5e2a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e2e:	2f2f 0056      	move.l 86(sp),-(sp)
    5e32:	4eba 10f2      	jsr 6f26 <TestRow>(pc)
    5e36:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5e3a:	7030           	moveq #48,d0
    5e3c:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5e40:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<7;i2++) {  
    5e44:	52af 0102      	addq.l #1,258(sp)
    5e48:	7206           	moveq #6,d1
    5e4a:	b2af 0102      	cmp.l 258(sp),d1
    5e4e:	6cb4           	bge.s 5e04 <TestZoom4Picture+0x1d40>
    }
    
    for(int i2=0;i2<11;i2++) {
    5e50:	42af 00fe      	clr.l 254(sp)
    5e54:	6000 008a      	bra.w 5ee0 <TestZoom4Picture+0x1e1c>
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    5e58:	222f 0106      	move.l 262(sp),d1
    5e5c:	2001           	move.l d1,d0
    5e5e:	e788           	lsl.l #3,d0
    5e60:	9081           	sub.l d1,d0
    5e62:	d080           	add.l d0,d0
    5e64:	d080           	add.l d0,d0
    5e66:	2040           	movea.l d0,a0
    5e68:	d1c1           	adda.l d1,a0
    5e6a:	41e8 0023      	lea 35(a0),a0
    5e6e:	202f 00fe      	move.l 254(sp),d0
    5e72:	d080           	add.l d0,d0
    5e74:	2208           	move.l a0,d1
    5e76:	d280           	add.l d0,d1
    5e78:	7000           	moveq #0,d0
    5e7a:	302f 01c6      	move.w 454(sp),d0
    5e7e:	2f01           	move.l d1,-(sp)
    5e80:	2f00           	move.l d0,-(sp)
    5e82:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e86:	2f2f 0056      	move.l 86(sp),-(sp)
    5e8a:	4eba 109a      	jsr 6f26 <TestRow>(pc)
    5e8e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5e92:	7030           	moveq #48,d0
    5e94:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    5e98:	222f 0106      	move.l 262(sp),d1
    5e9c:	2001           	move.l d1,d0
    5e9e:	e788           	lsl.l #3,d0
    5ea0:	9081           	sub.l d1,d0
    5ea2:	d080           	add.l d0,d0
    5ea4:	d080           	add.l d0,d0
    5ea6:	2040           	movea.l d0,a0
    5ea8:	d1c1           	adda.l d1,a0
    5eaa:	41e8 000b      	lea 11(a0),a0
    5eae:	202f 00fe      	move.l 254(sp),d0
    5eb2:	d080           	add.l d0,d0
    5eb4:	2208           	move.l a0,d1
    5eb6:	d280           	add.l d0,d1
    5eb8:	7000           	moveq #0,d0
    5eba:	302f 01c6      	move.w 454(sp),d0
    5ebe:	2f01           	move.l d1,-(sp)
    5ec0:	2f00           	move.l d0,-(sp)
    5ec2:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ec6:	2f2f 0056      	move.l 86(sp),-(sp)
    5eca:	4eba 105a      	jsr 6f26 <TestRow>(pc)
    5ece:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5ed2:	7230           	moveq #48,d1
    5ed4:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5ed8:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {
    5edc:	52af 00fe      	addq.l #1,254(sp)
    5ee0:	700a           	moveq #10,d0
    5ee2:	b0af 00fe      	cmp.l 254(sp),d0
    5ee6:	6c00 ff70      	bge.w 5e58 <TestZoom4Picture+0x1d94>
  for(int i=0;i<8;i++) {
    5eea:	52af 0106      	addq.l #1,262(sp)
    5eee:	7207           	moveq #7,d1
    5ef0:	b2af 0106      	cmp.l 262(sp),d1
    5ef4:	6c00 ff08      	bge.w 5dfe <TestZoom4Picture+0x1d3a>
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    5ef8:	42af 00fa      	clr.l 250(sp)
    5efc:	6032           	bra.s 5f30 <TestZoom4Picture+0x1e6c>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5efe:	222f 00fa      	move.l 250(sp),d1
    5f02:	0681 0000 0104 	addi.l #260,d1
    5f08:	7000           	moveq #0,d0
    5f0a:	302f 01c6      	move.w 454(sp),d0
    5f0e:	2f01           	move.l d1,-(sp)
    5f10:	2f00           	move.l d0,-(sp)
    5f12:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f16:	2f2f 0056      	move.l 86(sp),-(sp)
    5f1a:	4eba 100a      	jsr 6f26 <TestRow>(pc)
    5f1e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5f22:	7030           	moveq #48,d0
    5f24:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5f28:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    5f2c:	52af 00fa      	addq.l #1,250(sp)
    5f30:	7206           	moveq #6,d1
    5f32:	b2af 00fa      	cmp.l 250(sp),d1
    5f36:	6cc6           	bge.s 5efe <TestZoom4Picture+0x1e3a>
  }
  TestRow( valsupposed, valactual, mask, 267);   
    5f38:	7000           	moveq #0,d0
    5f3a:	302f 01c6      	move.w 454(sp),d0
    5f3e:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    5f42:	2f00           	move.l d0,-(sp)
    5f44:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f48:	2f2f 0056      	move.l 86(sp),-(sp)
    5f4c:	4eba 0fd8      	jsr 6f26 <TestRow>(pc)
    5f50:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5f54:	7030           	moveq #48,d0
    5f56:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 268);
    5f5a:	7000           	moveq #0,d0
    5f5c:	302f 01c6      	move.w 454(sp),d0
    5f60:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    5f64:	2f00           	move.l d0,-(sp)
    5f66:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f6a:	2f2f 0056      	move.l 86(sp),-(sp)
    5f6e:	4eba 0fb6      	jsr 6f26 <TestRow>(pc)
    5f72:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5f76:	7230           	moveq #48,d1
    5f78:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5f7c:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 269);
    5f80:	7000           	moveq #0,d0
    5f82:	302f 01c6      	move.w 454(sp),d0
    5f86:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5f8a:	2f00           	move.l d0,-(sp)
    5f8c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f90:	2f2f 0056      	move.l 86(sp),-(sp)
    5f94:	4eba 0f90      	jsr 6f26 <TestRow>(pc)
    5f98:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5f9c:	7030           	moveq #48,d0
    5f9e:	d1af 01c8      	add.l d0,456(sp)
  
  tmp = source;
    5fa2:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5fa8:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5fae:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    5fb4:	4878 0001      	pea 1 <_start+0x1>
    5fb8:	4878 000b      	pea b <_start+0xb>
    5fbc:	2f2f 0056      	move.l 86(sp),-(sp)
    5fc0:	2f2f 006a      	move.l 106(sp),-(sp)
    5fc4:	4eba bd12      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    5fc8:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5fcc:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    5fd2:	2c40           	movea.l d0,a6
    5fd4:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5fd8:	222f 004e      	move.l 78(sp),d1
    5fdc:	5881           	addq.l #4,d1
    5fde:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom12;
    5fe2:	2f7c 0001 bbc8 	move.l #113608,74(sp)
    5fe8:	004a 

  mask = 0x0;
    5fea:	426f 01c6      	clr.w 454(sp)
   
  TestRow( valsupposed, valactual, mask, 0);
    5fee:	7000           	moveq #0,d0
    5ff0:	302f 01c6      	move.w 454(sp),d0
    5ff4:	42a7           	clr.l -(sp)
    5ff6:	2f00           	move.l d0,-(sp)
    5ff8:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ffc:	2f2f 0056      	move.l 86(sp),-(sp)
    6000:	4eba 0f24      	jsr 6f26 <TestRow>(pc)
    6004:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6008:	7030           	moveq #48,d0
    600a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    600e:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<12;i2++) {
    6012:	42af 00f6      	clr.l 246(sp)
    6016:	605c           	bra.s 6074 <TestZoom4Picture+0x1fb0>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    6018:	202f 00f6      	move.l 246(sp),d0
    601c:	d080           	add.l d0,d0
    601e:	2200           	move.l d0,d1
    6020:	5281           	addq.l #1,d1
    6022:	7000           	moveq #0,d0
    6024:	302f 01c6      	move.w 454(sp),d0
    6028:	2f01           	move.l d1,-(sp)
    602a:	2f00           	move.l d0,-(sp)
    602c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6030:	2f2f 0056      	move.l 86(sp),-(sp)
    6034:	4eba 0ef0      	jsr 6f26 <TestRow>(pc)
    6038:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    603c:	7230           	moveq #48,d1
    603e:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    6042:	202f 00f6      	move.l 246(sp),d0
    6046:	5280           	addq.l #1,d0
    6048:	d080           	add.l d0,d0
    604a:	2200           	move.l d0,d1
    604c:	7000           	moveq #0,d0
    604e:	302f 01c6      	move.w 454(sp),d0
    6052:	2f01           	move.l d1,-(sp)
    6054:	2f00           	move.l d0,-(sp)
    6056:	2f2f 01d0      	move.l 464(sp),-(sp)
    605a:	2f2f 0056      	move.l 86(sp),-(sp)
    605e:	4eba 0ec6      	jsr 6f26 <TestRow>(pc)
    6062:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6066:	7030           	moveq #48,d0
    6068:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    606c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    6070:	52af 00f6      	addq.l #1,246(sp)
    6074:	720b           	moveq #11,d1
    6076:	b2af 00f6      	cmp.l 246(sp),d1
    607a:	6c9c           	bge.s 6018 <TestZoom4Picture+0x1f54>
  } 

  for(int i=0;i<8;i++) {
    607c:	42af 00f2      	clr.l 242(sp)
    6080:	6000 00e6      	bra.w 6168 <TestZoom4Picture+0x20a4>
    for(int i2=0;i2<6;i2++) {  
    6084:	42af 00ee      	clr.l 238(sp)
    6088:	6040           	bra.s 60ca <TestZoom4Picture+0x2006>
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    608a:	307c 0019      	movea.w #25,a0
    608e:	d1ef 00ee      	adda.l 238(sp),a0
    6092:	222f 00f2      	move.l 242(sp),d1
    6096:	2001           	move.l d1,d0
    6098:	e988           	lsl.l #4,d0
    609a:	9081           	sub.l d1,d0
    609c:	d080           	add.l d0,d0
    609e:	2208           	move.l a0,d1
    60a0:	d280           	add.l d0,d1
    60a2:	7000           	moveq #0,d0
    60a4:	302f 01c6      	move.w 454(sp),d0
    60a8:	2f01           	move.l d1,-(sp)
    60aa:	2f00           	move.l d0,-(sp)
    60ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    60b0:	2f2f 0056      	move.l 86(sp),-(sp)
    60b4:	4eba 0e70      	jsr 6f26 <TestRow>(pc)
    60b8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    60bc:	7030           	moveq #48,d0
    60be:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    60c2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<6;i2++) {  
    60c6:	52af 00ee      	addq.l #1,238(sp)
    60ca:	7205           	moveq #5,d1
    60cc:	b2af 00ee      	cmp.l 238(sp),d1
    60d0:	6cb8           	bge.s 608a <TestZoom4Picture+0x1fc6>
    }
    
    for(int i2=0;i2<12;i2++) {
    60d2:	42af 00ea      	clr.l 234(sp)
    60d6:	6000 0082      	bra.w 615a <TestZoom4Picture+0x2096>
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    60da:	222f 00f2      	move.l 242(sp),d1
    60de:	2001           	move.l d1,d0
    60e0:	e988           	lsl.l #4,d0
    60e2:	9081           	sub.l d1,d0
    60e4:	d080           	add.l d0,d0
    60e6:	2040           	movea.l d0,a0
    60e8:	41e8 001f      	lea 31(a0),a0
    60ec:	202f 00ea      	move.l 234(sp),d0
    60f0:	d080           	add.l d0,d0
    60f2:	2208           	move.l a0,d1
    60f4:	d280           	add.l d0,d1
    60f6:	7000           	moveq #0,d0
    60f8:	302f 01c6      	move.w 454(sp),d0
    60fc:	2f01           	move.l d1,-(sp)
    60fe:	2f00           	move.l d0,-(sp)
    6100:	2f2f 01d0      	move.l 464(sp),-(sp)
    6104:	2f2f 0056      	move.l 86(sp),-(sp)
    6108:	4eba 0e1c      	jsr 6f26 <TestRow>(pc)
    610c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6110:	7030           	moveq #48,d0
    6112:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    6116:	222f 00f2      	move.l 242(sp),d1
    611a:	2001           	move.l d1,d0
    611c:	e988           	lsl.l #4,d0
    611e:	9081           	sub.l d1,d0
    6120:	d080           	add.l d0,d0
    6122:	2040           	movea.l d0,a0
    6124:	41e8 0020      	lea 32(a0),a0
    6128:	202f 00ea      	move.l 234(sp),d0
    612c:	d080           	add.l d0,d0
    612e:	2208           	move.l a0,d1
    6130:	d280           	add.l d0,d1
    6132:	7000           	moveq #0,d0
    6134:	302f 01c6      	move.w 454(sp),d0
    6138:	2f01           	move.l d1,-(sp)
    613a:	2f00           	move.l d0,-(sp)
    613c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6140:	2f2f 0056      	move.l 86(sp),-(sp)
    6144:	4eba 0de0      	jsr 6f26 <TestRow>(pc)
    6148:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    614c:	7230           	moveq #48,d1
    614e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6152:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {
    6156:	52af 00ea      	addq.l #1,234(sp)
    615a:	700b           	moveq #11,d0
    615c:	b0af 00ea      	cmp.l 234(sp),d0
    6160:	6c00 ff78      	bge.w 60da <TestZoom4Picture+0x2016>
  for(int i=0;i<8;i++) {
    6164:	52af 00f2      	addq.l #1,242(sp)
    6168:	7207           	moveq #7,d1
    616a:	b2af 00f2      	cmp.l 242(sp),d1
    616e:	6c00 ff14      	bge.w 6084 <TestZoom4Picture+0x1fc0>
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    6172:	42af 00e6      	clr.l 230(sp)
    6176:	6032           	bra.s 61aa <TestZoom4Picture+0x20e6>
    TestRow( valsupposed, valactual, mask, 260+i2);
    6178:	222f 00e6      	move.l 230(sp),d1
    617c:	0681 0000 0104 	addi.l #260,d1
    6182:	7000           	moveq #0,d0
    6184:	302f 01c6      	move.w 454(sp),d0
    6188:	2f01           	move.l d1,-(sp)
    618a:	2f00           	move.l d0,-(sp)
    618c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6190:	2f2f 0056      	move.l 86(sp),-(sp)
    6194:	4eba 0d90      	jsr 6f26 <TestRow>(pc)
    6198:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    619c:	7030           	moveq #48,d0
    619e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    61a2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    61a6:	52af 00e6      	addq.l #1,230(sp)
    61aa:	7204           	moveq #4,d1
    61ac:	b2af 00e6      	cmp.l 230(sp),d1
    61b0:	6cc6           	bge.s 6178 <TestZoom4Picture+0x20b4>
  }

  tmp = source;
    61b2:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    61b8:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    61be:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    61c4:	4878 0001      	pea 1 <_start+0x1>
    61c8:	4878 000c      	pea c <_start+0xc>
    61cc:	2f2f 0056      	move.l 86(sp),-(sp)
    61d0:	2f2f 006a      	move.l 106(sp),-(sp)
    61d4:	4eba bb02      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    61d8:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    61dc:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    61e2:	2c40           	movea.l d0,a6
    61e4:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    61e8:	202f 004e      	move.l 78(sp),d0
    61ec:	5880           	addq.l #4,d0
    61ee:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom13;
    61f2:	2f7c 0001 bbf4 	move.l #113652,74(sp)
    61f8:	004a 

  mask = 0xffff;
    61fa:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<11;i2++) {
    6200:	42af 00e2      	clr.l 226(sp)
    6204:	605a           	bra.s 6260 <TestZoom4Picture+0x219c>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6206:	202f 00e2      	move.l 226(sp),d0
    620a:	d080           	add.l d0,d0
    620c:	2200           	move.l d0,d1
    620e:	7000           	moveq #0,d0
    6210:	302f 01c6      	move.w 454(sp),d0
    6214:	2f01           	move.l d1,-(sp)
    6216:	2f00           	move.l d0,-(sp)
    6218:	2f2f 01d0      	move.l 464(sp),-(sp)
    621c:	2f2f 0056      	move.l 86(sp),-(sp)
    6220:	4eba 0d04      	jsr 6f26 <TestRow>(pc)
    6224:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6228:	7230           	moveq #48,d1
    622a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    622e:	202f 00e2      	move.l 226(sp),d0
    6232:	d080           	add.l d0,d0
    6234:	2200           	move.l d0,d1
    6236:	5281           	addq.l #1,d1
    6238:	7000           	moveq #0,d0
    623a:	302f 01c6      	move.w 454(sp),d0
    623e:	2f01           	move.l d1,-(sp)
    6240:	2f00           	move.l d0,-(sp)
    6242:	2f2f 01d0      	move.l 464(sp),-(sp)
    6246:	2f2f 0056      	move.l 86(sp),-(sp)
    624a:	4eba 0cda      	jsr 6f26 <TestRow>(pc)
    624e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6252:	7030           	moveq #48,d0
    6254:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6258:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    625c:	52af 00e2      	addq.l #1,226(sp)
    6260:	720a           	moveq #10,d1
    6262:	b2af 00e2      	cmp.l 226(sp),d1
    6266:	6c9e           	bge.s 6206 <TestZoom4Picture+0x2142>
  } 

  for(int i=0;i<8;i++) {
    6268:	42af 00de      	clr.l 222(sp)
    626c:	6000 00de      	bra.w 634c <TestZoom4Picture+0x2288>
    for(int i2=0;i2<5;i2++) {  
    6270:	42af 00da      	clr.l 218(sp)
    6274:	603e           	bra.s 62b4 <TestZoom4Picture+0x21f0>
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    6276:	307c 0016      	movea.w #22,a0
    627a:	d1ef 00da      	adda.l 218(sp),a0
    627e:	222f 00de      	move.l 222(sp),d1
    6282:	2001           	move.l d1,d0
    6284:	eb88           	lsl.l #5,d0
    6286:	9081           	sub.l d1,d0
    6288:	2208           	move.l a0,d1
    628a:	d280           	add.l d0,d1
    628c:	7000           	moveq #0,d0
    628e:	302f 01c6      	move.w 454(sp),d0
    6292:	2f01           	move.l d1,-(sp)
    6294:	2f00           	move.l d0,-(sp)
    6296:	2f2f 01d0      	move.l 464(sp),-(sp)
    629a:	2f2f 0056      	move.l 86(sp),-(sp)
    629e:	4eba 0c86      	jsr 6f26 <TestRow>(pc)
    62a2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    62a6:	7030           	moveq #48,d0
    62a8:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    62ac:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<5;i2++) {  
    62b0:	52af 00da      	addq.l #1,218(sp)
    62b4:	7204           	moveq #4,d1
    62b6:	b2af 00da      	cmp.l 218(sp),d1
    62ba:	6cba           	bge.s 6276 <TestZoom4Picture+0x21b2>
    }
    
    for(int i2=0;i2<13;i2++) {
    62bc:	42af 00d6      	clr.l 214(sp)
    62c0:	607c           	bra.s 633e <TestZoom4Picture+0x227a>
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    62c2:	222f 00de      	move.l 222(sp),d1
    62c6:	2001           	move.l d1,d0
    62c8:	eb88           	lsl.l #5,d0
    62ca:	2040           	movea.l d0,a0
    62cc:	91c1           	suba.l d1,a0
    62ce:	41e8 001b      	lea 27(a0),a0
    62d2:	202f 00d6      	move.l 214(sp),d0
    62d6:	d080           	add.l d0,d0
    62d8:	2208           	move.l a0,d1
    62da:	d280           	add.l d0,d1
    62dc:	7000           	moveq #0,d0
    62de:	302f 01c6      	move.w 454(sp),d0
    62e2:	2f01           	move.l d1,-(sp)
    62e4:	2f00           	move.l d0,-(sp)
    62e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    62ea:	2f2f 0056      	move.l 86(sp),-(sp)
    62ee:	4eba 0c36      	jsr 6f26 <TestRow>(pc)
    62f2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    62f6:	7030           	moveq #48,d0
    62f8:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    62fc:	222f 00de      	move.l 222(sp),d1
    6300:	2001           	move.l d1,d0
    6302:	eb88           	lsl.l #5,d0
    6304:	2040           	movea.l d0,a0
    6306:	91c1           	suba.l d1,a0
    6308:	41e8 001c      	lea 28(a0),a0
    630c:	202f 00d6      	move.l 214(sp),d0
    6310:	d080           	add.l d0,d0
    6312:	2208           	move.l a0,d1
    6314:	d280           	add.l d0,d1
    6316:	7000           	moveq #0,d0
    6318:	302f 01c6      	move.w 454(sp),d0
    631c:	2f01           	move.l d1,-(sp)
    631e:	2f00           	move.l d0,-(sp)
    6320:	2f2f 01d0      	move.l 464(sp),-(sp)
    6324:	2f2f 0056      	move.l 86(sp),-(sp)
    6328:	4eba 0bfc      	jsr 6f26 <TestRow>(pc)
    632c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6330:	7230           	moveq #48,d1
    6332:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6336:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {
    633a:	52af 00d6      	addq.l #1,214(sp)
    633e:	700c           	moveq #12,d0
    6340:	b0af 00d6      	cmp.l 214(sp),d0
    6344:	6c00 ff7c      	bge.w 62c2 <TestZoom4Picture+0x21fe>
  for(int i=0;i<8;i++) {
    6348:	52af 00de      	addq.l #1,222(sp)
    634c:	7207           	moveq #7,d1
    634e:	b2af 00de      	cmp.l 222(sp),d1
    6352:	6c00 ff1c      	bge.w 6270 <TestZoom4Picture+0x21ac>
    }
  } 

  tmp = source;
    6356:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    635c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6362:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    6368:	4878 0001      	pea 1 <_start+0x1>
    636c:	4878 000d      	pea d <_start+0xd>
    6370:	2f2f 0056      	move.l 86(sp),-(sp)
    6374:	2f2f 006a      	move.l 106(sp),-(sp)
    6378:	4eba b95e      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    637c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6380:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    6386:	2c40           	movea.l d0,a6
    6388:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    638c:	202f 004e      	move.l 78(sp),d0
    6390:	5880           	addq.l #4,d0
    6392:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom14;
    6396:	2f7c 0001 bc20 	move.l #113696,74(sp)
    639c:	004a 

  mask = 0xffff;
    639e:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    63a4:	7000           	moveq #0,d0
    63a6:	302f 01c6      	move.w 454(sp),d0
    63aa:	42a7           	clr.l -(sp)
    63ac:	2f00           	move.l d0,-(sp)
    63ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    63b2:	2f2f 0056      	move.l 86(sp),-(sp)
    63b6:	4eba 0b6e      	jsr 6f26 <TestRow>(pc)
    63ba:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2; 
    63be:	7230           	moveq #48,d1
    63c0:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff; 
    63c4:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<9;i2++) {
    63c8:	42af 00d2      	clr.l 210(sp)
    63cc:	605c           	bra.s 642a <TestZoom4Picture+0x2366>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    63ce:	202f 00d2      	move.l 210(sp),d0
    63d2:	d080           	add.l d0,d0
    63d4:	2200           	move.l d0,d1
    63d6:	5281           	addq.l #1,d1
    63d8:	7000           	moveq #0,d0
    63da:	302f 01c6      	move.w 454(sp),d0
    63de:	2f01           	move.l d1,-(sp)
    63e0:	2f00           	move.l d0,-(sp)
    63e2:	2f2f 01d0      	move.l 464(sp),-(sp)
    63e6:	2f2f 0056      	move.l 86(sp),-(sp)
    63ea:	4eba 0b3a      	jsr 6f26 <TestRow>(pc)
    63ee:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    63f2:	7030           	moveq #48,d0
    63f4:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    63f8:	202f 00d2      	move.l 210(sp),d0
    63fc:	5280           	addq.l #1,d0
    63fe:	d080           	add.l d0,d0
    6400:	2200           	move.l d0,d1
    6402:	7000           	moveq #0,d0
    6404:	302f 01c6      	move.w 454(sp),d0
    6408:	2f01           	move.l d1,-(sp)
    640a:	2f00           	move.l d0,-(sp)
    640c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6410:	2f2f 0056      	move.l 86(sp),-(sp)
    6414:	4eba 0b10      	jsr 6f26 <TestRow>(pc)
    6418:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    641c:	7230           	moveq #48,d1
    641e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6422:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {
    6426:	52af 00d2      	addq.l #1,210(sp)
    642a:	7008           	moveq #8,d0
    642c:	b0af 00d2      	cmp.l 210(sp),d0
    6430:	6c9c           	bge.s 63ce <TestZoom4Picture+0x230a>
  } 

  for(int i=0;i<7;i++) {
    6432:	42af 00ce      	clr.l 206(sp)
    6436:	6000 00cc      	bra.w 6504 <TestZoom4Picture+0x2440>
    for(int i2=0;i2<4;i2++) {  
    643a:	42af 00ca      	clr.l 202(sp)
    643e:	6036           	bra.s 6476 <TestZoom4Picture+0x23b2>
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    6440:	7213           	moveq #19,d1
    6442:	d2af 00ca      	add.l 202(sp),d1
    6446:	202f 00ce      	move.l 206(sp),d0
    644a:	eb88           	lsl.l #5,d0
    644c:	d280           	add.l d0,d1
    644e:	7000           	moveq #0,d0
    6450:	302f 01c6      	move.w 454(sp),d0
    6454:	2f01           	move.l d1,-(sp)
    6456:	2f00           	move.l d0,-(sp)
    6458:	2f2f 01d0      	move.l 464(sp),-(sp)
    645c:	2f2f 0056      	move.l 86(sp),-(sp)
    6460:	4eba 0ac4      	jsr 6f26 <TestRow>(pc)
    6464:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6468:	7230           	moveq #48,d1
    646a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    646e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<4;i2++) {  
    6472:	52af 00ca      	addq.l #1,202(sp)
    6476:	7003           	moveq #3,d0
    6478:	b0af 00ca      	cmp.l 202(sp),d0
    647c:	6cc2           	bge.s 6440 <TestZoom4Picture+0x237c>
    }
    
    for(int i2=0;i2<14;i2++) {
    647e:	42af 00c6      	clr.l 198(sp)
    6482:	6074           	bra.s 64f8 <TestZoom4Picture+0x2434>
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    6484:	202f 00ce      	move.l 206(sp),d0
    6488:	eb88           	lsl.l #5,d0
    648a:	307c 0017      	movea.w #23,a0
    648e:	d1c0           	adda.l d0,a0
    6490:	202f 00c6      	move.l 198(sp),d0
    6494:	d080           	add.l d0,d0
    6496:	2208           	move.l a0,d1
    6498:	d280           	add.l d0,d1
    649a:	7000           	moveq #0,d0
    649c:	302f 01c6      	move.w 454(sp),d0
    64a0:	2f01           	move.l d1,-(sp)
    64a2:	2f00           	move.l d0,-(sp)
    64a4:	2f2f 01d0      	move.l 464(sp),-(sp)
    64a8:	2f2f 0056      	move.l 86(sp),-(sp)
    64ac:	4eba 0a78      	jsr 6f26 <TestRow>(pc)
    64b0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    64b4:	7230           	moveq #48,d1
    64b6:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    64ba:	202f 00ce      	move.l 206(sp),d0
    64be:	eb88           	lsl.l #5,d0
    64c0:	307c 0018      	movea.w #24,a0
    64c4:	d1c0           	adda.l d0,a0
    64c6:	202f 00c6      	move.l 198(sp),d0
    64ca:	d080           	add.l d0,d0
    64cc:	2208           	move.l a0,d1
    64ce:	d280           	add.l d0,d1
    64d0:	7000           	moveq #0,d0
    64d2:	302f 01c6      	move.w 454(sp),d0
    64d6:	2f01           	move.l d1,-(sp)
    64d8:	2f00           	move.l d0,-(sp)
    64da:	2f2f 01d0      	move.l 464(sp),-(sp)
    64de:	2f2f 0056      	move.l 86(sp),-(sp)
    64e2:	4eba 0a42      	jsr 6f26 <TestRow>(pc)
    64e6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    64ea:	7030           	moveq #48,d0
    64ec:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    64f0:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {
    64f4:	52af 00c6      	addq.l #1,198(sp)
    64f8:	720d           	moveq #13,d1
    64fa:	b2af 00c6      	cmp.l 198(sp),d1
    64fe:	6c84           	bge.s 6484 <TestZoom4Picture+0x23c0>
  for(int i=0;i<7;i++) {
    6500:	52af 00ce      	addq.l #1,206(sp)
    6504:	7006           	moveq #6,d0
    6506:	b0af 00ce      	cmp.l 206(sp),d0
    650a:	6c00 ff2e      	bge.w 643a <TestZoom4Picture+0x2376>
    }
  }

  for(int i2=0;i2<4;i2++) {  
    650e:	42af 00c2      	clr.l 194(sp)
    6512:	6032           	bra.s 6546 <TestZoom4Picture+0x2482>
    TestRow( valsupposed, valactual, mask, 243+i2);
    6514:	222f 00c2      	move.l 194(sp),d1
    6518:	0681 0000 00f3 	addi.l #243,d1
    651e:	7000           	moveq #0,d0
    6520:	302f 01c6      	move.w 454(sp),d0
    6524:	2f01           	move.l d1,-(sp)
    6526:	2f00           	move.l d0,-(sp)
    6528:	2f2f 01d0      	move.l 464(sp),-(sp)
    652c:	2f2f 0056      	move.l 86(sp),-(sp)
    6530:	4eba 09f4      	jsr 6f26 <TestRow>(pc)
    6534:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6538:	7230           	moveq #48,d1
    653a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    653e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {  
    6542:	52af 00c2      	addq.l #1,194(sp)
    6546:	7003           	moveq #3,d0
    6548:	b0af 00c2      	cmp.l 194(sp),d0
    654c:	6cc6           	bge.s 6514 <TestZoom4Picture+0x2450>
  }

  for(int i2=0;i2<12;i2++) {
    654e:	42af 00be      	clr.l 190(sp)
    6552:	6060           	bra.s 65b4 <TestZoom4Picture+0x24f0>
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    6554:	202f 00be      	move.l 190(sp),d0
    6558:	d080           	add.l d0,d0
    655a:	2200           	move.l d0,d1
    655c:	0681 0000 00f7 	addi.l #247,d1
    6562:	7000           	moveq #0,d0
    6564:	302f 01c6      	move.w 454(sp),d0
    6568:	2f01           	move.l d1,-(sp)
    656a:	2f00           	move.l d0,-(sp)
    656c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6570:	2f2f 0056      	move.l 86(sp),-(sp)
    6574:	4eba 09b0      	jsr 6f26 <TestRow>(pc)
    6578:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    657c:	7230           	moveq #48,d1
    657e:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    6582:	707c           	moveq #124,d0
    6584:	d0af 00be      	add.l 190(sp),d0
    6588:	d080           	add.l d0,d0
    658a:	2200           	move.l d0,d1
    658c:	7000           	moveq #0,d0
    658e:	302f 01c6      	move.w 454(sp),d0
    6592:	2f01           	move.l d1,-(sp)
    6594:	2f00           	move.l d0,-(sp)
    6596:	2f2f 01d0      	move.l 464(sp),-(sp)
    659a:	2f2f 0056      	move.l 86(sp),-(sp)
    659e:	4eba 0986      	jsr 6f26 <TestRow>(pc)
    65a2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    65a6:	7030           	moveq #48,d0
    65a8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    65ac:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    65b0:	52af 00be      	addq.l #1,190(sp)
    65b4:	720b           	moveq #11,d1
    65b6:	b2af 00be      	cmp.l 190(sp),d1
    65ba:	6c98           	bge.s 6554 <TestZoom4Picture+0x2490>
  }

  tmp = source;
    65bc:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    65c2:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    65c8:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    65ce:	4878 0001      	pea 1 <_start+0x1>
    65d2:	4878 000e      	pea e <_start+0xe>
    65d6:	2f2f 0056      	move.l 86(sp),-(sp)
    65da:	2f2f 006a      	move.l 106(sp),-(sp)
    65de:	4eba b6f8      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    65e2:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    65e6:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    65ec:	2c40           	movea.l d0,a6
    65ee:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    65f2:	202f 004e      	move.l 78(sp),d0
    65f6:	5880           	addq.l #4,d0
    65f8:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom15;
    65fc:	2f7c 0001 bc4c 	move.l #113740,74(sp)
    6602:	004a 

  mask = 0x0000;
    6604:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<8;i2++) {
    6608:	42af 00ba      	clr.l 186(sp)
    660c:	605a           	bra.s 6668 <TestZoom4Picture+0x25a4>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    660e:	202f 00ba      	move.l 186(sp),d0
    6612:	d080           	add.l d0,d0
    6614:	2200           	move.l d0,d1
    6616:	7000           	moveq #0,d0
    6618:	302f 01c6      	move.w 454(sp),d0
    661c:	2f01           	move.l d1,-(sp)
    661e:	2f00           	move.l d0,-(sp)
    6620:	2f2f 01d0      	move.l 464(sp),-(sp)
    6624:	2f2f 0056      	move.l 86(sp),-(sp)
    6628:	4eba 08fc      	jsr 6f26 <TestRow>(pc)
    662c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6630:	7230           	moveq #48,d1
    6632:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6636:	202f 00ba      	move.l 186(sp),d0
    663a:	d080           	add.l d0,d0
    663c:	2200           	move.l d0,d1
    663e:	5281           	addq.l #1,d1
    6640:	7000           	moveq #0,d0
    6642:	302f 01c6      	move.w 454(sp),d0
    6646:	2f01           	move.l d1,-(sp)
    6648:	2f00           	move.l d0,-(sp)
    664a:	2f2f 01d0      	move.l 464(sp),-(sp)
    664e:	2f2f 0056      	move.l 86(sp),-(sp)
    6652:	4eba 08d2      	jsr 6f26 <TestRow>(pc)
    6656:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    665a:	7030           	moveq #48,d0
    665c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6660:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    6664:	52af 00ba      	addq.l #1,186(sp)
    6668:	7207           	moveq #7,d1
    666a:	b2af 00ba      	cmp.l 186(sp),d1
    666e:	6c9e           	bge.s 660e <TestZoom4Picture+0x254a>
  }

  for(int i=0;i<7;i++) {
    6670:	42af 00b6      	clr.l 182(sp)
    6674:	6000 00de      	bra.w 6754 <TestZoom4Picture+0x2690>
    for(int i2=0;i2<3;i2++) {  
    6678:	42af 00b2      	clr.l 178(sp)
    667c:	603e           	bra.s 66bc <TestZoom4Picture+0x25f8>
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    667e:	307c 0010      	movea.w #16,a0
    6682:	d1ef 00b2      	adda.l 178(sp),a0
    6686:	222f 00b6      	move.l 182(sp),d1
    668a:	2001           	move.l d1,d0
    668c:	eb88           	lsl.l #5,d0
    668e:	d081           	add.l d1,d0
    6690:	2208           	move.l a0,d1
    6692:	d280           	add.l d0,d1
    6694:	7000           	moveq #0,d0
    6696:	302f 01c6      	move.w 454(sp),d0
    669a:	2f01           	move.l d1,-(sp)
    669c:	2f00           	move.l d0,-(sp)
    669e:	2f2f 01d0      	move.l 464(sp),-(sp)
    66a2:	2f2f 0056      	move.l 86(sp),-(sp)
    66a6:	4eba 087e      	jsr 6f26 <TestRow>(pc)
    66aa:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    66ae:	7030           	moveq #48,d0
    66b0:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    66b4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<3;i2++) {  
    66b8:	52af 00b2      	addq.l #1,178(sp)
    66bc:	7202           	moveq #2,d1
    66be:	b2af 00b2      	cmp.l 178(sp),d1
    66c2:	6cba           	bge.s 667e <TestZoom4Picture+0x25ba>
    }
    
    for(int i2=0;i2<15;i2++) {
    66c4:	42af 00ae      	clr.l 174(sp)
    66c8:	607c           	bra.s 6746 <TestZoom4Picture+0x2682>
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    66ca:	222f 00b6      	move.l 182(sp),d1
    66ce:	2001           	move.l d1,d0
    66d0:	eb88           	lsl.l #5,d0
    66d2:	2040           	movea.l d0,a0
    66d4:	d1c1           	adda.l d1,a0
    66d6:	41e8 0013      	lea 19(a0),a0
    66da:	202f 00ae      	move.l 174(sp),d0
    66de:	d080           	add.l d0,d0
    66e0:	2208           	move.l a0,d1
    66e2:	d280           	add.l d0,d1
    66e4:	7000           	moveq #0,d0
    66e6:	302f 01c6      	move.w 454(sp),d0
    66ea:	2f01           	move.l d1,-(sp)
    66ec:	2f00           	move.l d0,-(sp)
    66ee:	2f2f 01d0      	move.l 464(sp),-(sp)
    66f2:	2f2f 0056      	move.l 86(sp),-(sp)
    66f6:	4eba 082e      	jsr 6f26 <TestRow>(pc)
    66fa:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    66fe:	7030           	moveq #48,d0
    6700:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    6704:	222f 00b6      	move.l 182(sp),d1
    6708:	2001           	move.l d1,d0
    670a:	eb88           	lsl.l #5,d0
    670c:	2040           	movea.l d0,a0
    670e:	d1c1           	adda.l d1,a0
    6710:	41e8 0013      	lea 19(a0),a0
    6714:	202f 00ae      	move.l 174(sp),d0
    6718:	d080           	add.l d0,d0
    671a:	2208           	move.l a0,d1
    671c:	d280           	add.l d0,d1
    671e:	7000           	moveq #0,d0
    6720:	302f 01c6      	move.w 454(sp),d0
    6724:	2f01           	move.l d1,-(sp)
    6726:	2f00           	move.l d0,-(sp)
    6728:	2f2f 01d0      	move.l 464(sp),-(sp)
    672c:	2f2f 0056      	move.l 86(sp),-(sp)
    6730:	4eba 07f4      	jsr 6f26 <TestRow>(pc)
    6734:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6738:	7230           	moveq #48,d1
    673a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    673e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {
    6742:	52af 00ae      	addq.l #1,174(sp)
    6746:	700e           	moveq #14,d0
    6748:	b0af 00ae      	cmp.l 174(sp),d0
    674c:	6c00 ff7c      	bge.w 66ca <TestZoom4Picture+0x2606>
  for(int i=0;i<7;i++) {
    6750:	52af 00b6      	addq.l #1,182(sp)
    6754:	7206           	moveq #6,d1
    6756:	b2af 00b6      	cmp.l 182(sp),d1
    675a:	6c00 ff1c      	bge.w 6678 <TestZoom4Picture+0x25b4>
    }
  }

  for(int i2=0;i2<3;i2++) {  
    675e:	42af 00aa      	clr.l 170(sp)
    6762:	6032           	bra.s 6796 <TestZoom4Picture+0x26d2>
    TestRow( valsupposed, valactual, mask, 247+i2);
    6764:	222f 00aa      	move.l 170(sp),d1
    6768:	0681 0000 00f7 	addi.l #247,d1
    676e:	7000           	moveq #0,d0
    6770:	302f 01c6      	move.w 454(sp),d0
    6774:	2f01           	move.l d1,-(sp)
    6776:	2f00           	move.l d0,-(sp)
    6778:	2f2f 01d0      	move.l 464(sp),-(sp)
    677c:	2f2f 0056      	move.l 86(sp),-(sp)
    6780:	4eba 07a4      	jsr 6f26 <TestRow>(pc)
    6784:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6788:	7030           	moveq #48,d0
    678a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    678e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<3;i2++) {  
    6792:	52af 00aa      	addq.l #1,170(sp)
    6796:	7202           	moveq #2,d1
    6798:	b2af 00aa      	cmp.l 170(sp),d1
    679c:	6cc6           	bge.s 6764 <TestZoom4Picture+0x26a0>
  }

  for(int i2=0;i2<10;i2++) {
    679e:	42af 00a6      	clr.l 166(sp)
    67a2:	6060           	bra.s 6804 <TestZoom4Picture+0x2740>
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    67a4:	707d           	moveq #125,d0
    67a6:	d0af 00a6      	add.l 166(sp),d0
    67aa:	d080           	add.l d0,d0
    67ac:	2200           	move.l d0,d1
    67ae:	7000           	moveq #0,d0
    67b0:	302f 01c6      	move.w 454(sp),d0
    67b4:	2f01           	move.l d1,-(sp)
    67b6:	2f00           	move.l d0,-(sp)
    67b8:	2f2f 01d0      	move.l 464(sp),-(sp)
    67bc:	2f2f 0056      	move.l 86(sp),-(sp)
    67c0:	4eba 0764      	jsr 6f26 <TestRow>(pc)
    67c4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    67c8:	7030           	moveq #48,d0
    67ca:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    67ce:	202f 00a6      	move.l 166(sp),d0
    67d2:	d080           	add.l d0,d0
    67d4:	2200           	move.l d0,d1
    67d6:	0681 0000 00fb 	addi.l #251,d1
    67dc:	7000           	moveq #0,d0
    67de:	302f 01c6      	move.w 454(sp),d0
    67e2:	2f01           	move.l d1,-(sp)
    67e4:	2f00           	move.l d0,-(sp)
    67e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    67ea:	2f2f 0056      	move.l 86(sp),-(sp)
    67ee:	4eba 0736      	jsr 6f26 <TestRow>(pc)
    67f2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    67f6:	7230           	moveq #48,d1
    67f8:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    67fc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {
    6800:	52af 00a6      	addq.l #1,166(sp)
    6804:	7009           	moveq #9,d0
    6806:	b0af 00a6      	cmp.l 166(sp),d0
    680a:	6c98           	bge.s 67a4 <TestZoom4Picture+0x26e0>
  }

  tmp = source;
    680c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6812:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6818:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    681e:	4878 0001      	pea 1 <_start+0x1>
    6822:	4878 000f      	pea f <_start+0xf>
    6826:	2f2f 0056      	move.l 86(sp),-(sp)
    682a:	2f2f 006a      	move.l 106(sp),-(sp)
    682e:	4eba b4a8      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    6832:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6836:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    683c:	2c40           	movea.l d0,a6
    683e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6842:	222f 004e      	move.l 78(sp),d1
    6846:	5881           	addq.l #4,d1
    6848:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom16;
    684c:	2f7c 0001 bc78 	move.l #113784,74(sp)
    6852:	004a 

  mask = 0x0000;
    6854:	426f 01c6      	clr.w 454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    6858:	7000           	moveq #0,d0
    685a:	302f 01c6      	move.w 454(sp),d0
    685e:	42a7           	clr.l -(sp)
    6860:	2f00           	move.l d0,-(sp)
    6862:	2f2f 01d0      	move.l 464(sp),-(sp)
    6866:	2f2f 0056      	move.l 86(sp),-(sp)
    686a:	4eba 06ba      	jsr 6f26 <TestRow>(pc)
    686e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6872:	7030           	moveq #48,d0
    6874:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6878:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    687c:	42af 00a2      	clr.l 162(sp)
    6880:	605a           	bra.s 68dc <TestZoom4Picture+0x2818>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6882:	202f 00a2      	move.l 162(sp),d0
    6886:	d080           	add.l d0,d0
    6888:	2200           	move.l d0,d1
    688a:	7000           	moveq #0,d0
    688c:	302f 01c6      	move.w 454(sp),d0
    6890:	2f01           	move.l d1,-(sp)
    6892:	2f00           	move.l d0,-(sp)
    6894:	2f2f 01d0      	move.l 464(sp),-(sp)
    6898:	2f2f 0056      	move.l 86(sp),-(sp)
    689c:	4eba 0688      	jsr 6f26 <TestRow>(pc)
    68a0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    68a4:	7230           	moveq #48,d1
    68a6:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    68aa:	202f 00a2      	move.l 162(sp),d0
    68ae:	d080           	add.l d0,d0
    68b0:	2200           	move.l d0,d1
    68b2:	5281           	addq.l #1,d1
    68b4:	7000           	moveq #0,d0
    68b6:	302f 01c6      	move.w 454(sp),d0
    68ba:	2f01           	move.l d1,-(sp)
    68bc:	2f00           	move.l d0,-(sp)
    68be:	2f2f 01d0      	move.l 464(sp),-(sp)
    68c2:	2f2f 0056      	move.l 86(sp),-(sp)
    68c6:	4eba 065e      	jsr 6f26 <TestRow>(pc)
    68ca:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    68ce:	7030           	moveq #48,d0
    68d0:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    68d4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    68d8:	52af 00a2      	addq.l #1,162(sp)
    68dc:	7205           	moveq #5,d1
    68de:	b2af 00a2      	cmp.l 162(sp),d1
    68e2:	6c9e           	bge.s 6882 <TestZoom4Picture+0x27be>
  }

  for(int i=0;i<7;i++) {
    68e4:	42af 009e      	clr.l 158(sp)
    68e8:	6000 00e6      	bra.w 69d0 <TestZoom4Picture+0x290c>
    for(int i2=0;i2<2;i2++) {  
    68ec:	42af 009a      	clr.l 154(sp)
    68f0:	6040           	bra.s 6932 <TestZoom4Picture+0x286e>
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    68f2:	307c 000d      	movea.w #13,a0
    68f6:	d1ef 009a      	adda.l 154(sp),a0
    68fa:	222f 009e      	move.l 158(sp),d1
    68fe:	2001           	move.l d1,d0
    6900:	e988           	lsl.l #4,d0
    6902:	d081           	add.l d1,d0
    6904:	d080           	add.l d0,d0
    6906:	2208           	move.l a0,d1
    6908:	d280           	add.l d0,d1
    690a:	7000           	moveq #0,d0
    690c:	302f 01c6      	move.w 454(sp),d0
    6910:	2f01           	move.l d1,-(sp)
    6912:	2f00           	move.l d0,-(sp)
    6914:	2f2f 01d0      	move.l 464(sp),-(sp)
    6918:	2f2f 0056      	move.l 86(sp),-(sp)
    691c:	4eba 0608      	jsr 6f26 <TestRow>(pc)
    6920:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6924:	7030           	moveq #48,d0
    6926:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    692a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<2;i2++) {  
    692e:	52af 009a      	addq.l #1,154(sp)
    6932:	7201           	moveq #1,d1
    6934:	b2af 009a      	cmp.l 154(sp),d1
    6938:	6cb8           	bge.s 68f2 <TestZoom4Picture+0x282e>
    }
    
    for(int i2=0;i2<16;i2++) {
    693a:	42af 0096      	clr.l 150(sp)
    693e:	6000 0082      	bra.w 69c2 <TestZoom4Picture+0x28fe>
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    6942:	222f 009e      	move.l 158(sp),d1
    6946:	2001           	move.l d1,d0
    6948:	e988           	lsl.l #4,d0
    694a:	d081           	add.l d1,d0
    694c:	d080           	add.l d0,d0
    694e:	2040           	movea.l d0,a0
    6950:	41e8 0010      	lea 16(a0),a0
    6954:	202f 0096      	move.l 150(sp),d0
    6958:	d080           	add.l d0,d0
    695a:	2208           	move.l a0,d1
    695c:	d280           	add.l d0,d1
    695e:	7000           	moveq #0,d0
    6960:	302f 01c6      	move.w 454(sp),d0
    6964:	2f01           	move.l d1,-(sp)
    6966:	2f00           	move.l d0,-(sp)
    6968:	2f2f 01d0      	move.l 464(sp),-(sp)
    696c:	2f2f 0056      	move.l 86(sp),-(sp)
    6970:	4eba 05b4      	jsr 6f26 <TestRow>(pc)
    6974:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6978:	7030           	moveq #48,d0
    697a:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    697e:	222f 009e      	move.l 158(sp),d1
    6982:	2001           	move.l d1,d0
    6984:	e988           	lsl.l #4,d0
    6986:	d081           	add.l d1,d0
    6988:	d080           	add.l d0,d0
    698a:	2040           	movea.l d0,a0
    698c:	41e8 0011      	lea 17(a0),a0
    6990:	202f 0096      	move.l 150(sp),d0
    6994:	d080           	add.l d0,d0
    6996:	2208           	move.l a0,d1
    6998:	d280           	add.l d0,d1
    699a:	7000           	moveq #0,d0
    699c:	302f 01c6      	move.w 454(sp),d0
    69a0:	2f01           	move.l d1,-(sp)
    69a2:	2f00           	move.l d0,-(sp)
    69a4:	2f2f 01d0      	move.l 464(sp),-(sp)
    69a8:	2f2f 0056      	move.l 86(sp),-(sp)
    69ac:	4eba 0578      	jsr 6f26 <TestRow>(pc)
    69b0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    69b4:	7230           	moveq #48,d1
    69b6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    69ba:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {
    69be:	52af 0096      	addq.l #1,150(sp)
    69c2:	700f           	moveq #15,d0
    69c4:	b0af 0096      	cmp.l 150(sp),d0
    69c8:	6c00 ff78      	bge.w 6942 <TestZoom4Picture+0x287e>
  for(int i=0;i<7;i++) {
    69cc:	52af 009e      	addq.l #1,158(sp)
    69d0:	7206           	moveq #6,d1
    69d2:	b2af 009e      	cmp.l 158(sp),d1
    69d6:	6c00 ff14      	bge.w 68ec <TestZoom4Picture+0x2828>
    }
  }

  for(int i2=0;i2<2;i2++) {
    69da:	42af 0092      	clr.l 146(sp)
    69de:	6032           	bra.s 6a12 <TestZoom4Picture+0x294e>
    TestRow( valsupposed, valactual, mask, 251+i2);
    69e0:	222f 0092      	move.l 146(sp),d1
    69e4:	0681 0000 00fb 	addi.l #251,d1
    69ea:	7000           	moveq #0,d0
    69ec:	302f 01c6      	move.w 454(sp),d0
    69f0:	2f01           	move.l d1,-(sp)
    69f2:	2f00           	move.l d0,-(sp)
    69f4:	2f2f 01d0      	move.l 464(sp),-(sp)
    69f8:	2f2f 0056      	move.l 86(sp),-(sp)
    69fc:	4eba 0528      	jsr 6f26 <TestRow>(pc)
    6a00:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a04:	7030           	moveq #48,d0
    6a06:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6a0a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<2;i2++) {
    6a0e:	52af 0092      	addq.l #1,146(sp)
    6a12:	7201           	moveq #1,d1
    6a14:	b2af 0092      	cmp.l 146(sp),d1
    6a18:	6cc6           	bge.s 69e0 <TestZoom4Picture+0x291c>
  }

  for(int i2=0;i2<8;i2++) {
    6a1a:	42af 008e      	clr.l 142(sp)
    6a1e:	6060           	bra.s 6a80 <TestZoom4Picture+0x29bc>
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    6a20:	202f 008e      	move.l 142(sp),d0
    6a24:	d080           	add.l d0,d0
    6a26:	2200           	move.l d0,d1
    6a28:	0681 0000 00fd 	addi.l #253,d1
    6a2e:	7000           	moveq #0,d0
    6a30:	302f 01c6      	move.w 454(sp),d0
    6a34:	2f01           	move.l d1,-(sp)
    6a36:	2f00           	move.l d0,-(sp)
    6a38:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a3c:	2f2f 0056      	move.l 86(sp),-(sp)
    6a40:	4eba 04e4      	jsr 6f26 <TestRow>(pc)
    6a44:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a48:	7030           	moveq #48,d0
    6a4a:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    6a4e:	707f           	moveq #127,d0
    6a50:	d0af 008e      	add.l 142(sp),d0
    6a54:	d080           	add.l d0,d0
    6a56:	2200           	move.l d0,d1
    6a58:	7000           	moveq #0,d0
    6a5a:	302f 01c6      	move.w 454(sp),d0
    6a5e:	2f01           	move.l d1,-(sp)
    6a60:	2f00           	move.l d0,-(sp)
    6a62:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a66:	2f2f 0056      	move.l 86(sp),-(sp)
    6a6a:	4eba 04ba      	jsr 6f26 <TestRow>(pc)
    6a6e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a72:	7230           	moveq #48,d1
    6a74:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6a78:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    6a7c:	52af 008e      	addq.l #1,142(sp)
    6a80:	7007           	moveq #7,d0
    6a82:	b0af 008e      	cmp.l 142(sp),d0
    6a86:	6c98           	bge.s 6a20 <TestZoom4Picture+0x295c>
  }

  tmp = source;
    6a88:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6a8e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6a94:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    6a9a:	4878 0001      	pea 1 <_start+0x1>
    6a9e:	4878 0010      	pea 10 <_start+0x10>
    6aa2:	2f2f 0056      	move.l 86(sp),-(sp)
    6aa6:	2f2f 006a      	move.l 106(sp),-(sp)
    6aaa:	4eba b22c      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    6aae:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6ab2:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    6ab8:	2c40           	movea.l d0,a6
    6aba:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6abe:	222f 004e      	move.l 78(sp),d1
    6ac2:	5881           	addq.l #4,d1
    6ac4:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom17;
    6ac8:	2f7c 0001 bca4 	move.l #113828,74(sp)
    6ace:	004a 

  mask = 0xffff;
    6ad0:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<5;i2++) {
    6ad6:	42af 008a      	clr.l 138(sp)
    6ada:	605a           	bra.s 6b36 <TestZoom4Picture+0x2a72>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6adc:	202f 008a      	move.l 138(sp),d0
    6ae0:	d080           	add.l d0,d0
    6ae2:	2200           	move.l d0,d1
    6ae4:	7000           	moveq #0,d0
    6ae6:	302f 01c6      	move.w 454(sp),d0
    6aea:	2f01           	move.l d1,-(sp)
    6aec:	2f00           	move.l d0,-(sp)
    6aee:	2f2f 01d0      	move.l 464(sp),-(sp)
    6af2:	2f2f 0056      	move.l 86(sp),-(sp)
    6af6:	4eba 042e      	jsr 6f26 <TestRow>(pc)
    6afa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6afe:	7030           	moveq #48,d0
    6b00:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6b04:	202f 008a      	move.l 138(sp),d0
    6b08:	d080           	add.l d0,d0
    6b0a:	2200           	move.l d0,d1
    6b0c:	5281           	addq.l #1,d1
    6b0e:	7000           	moveq #0,d0
    6b10:	302f 01c6      	move.w 454(sp),d0
    6b14:	2f01           	move.l d1,-(sp)
    6b16:	2f00           	move.l d0,-(sp)
    6b18:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b1c:	2f2f 0056      	move.l 86(sp),-(sp)
    6b20:	4eba 0404      	jsr 6f26 <TestRow>(pc)
    6b24:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6b28:	7230           	moveq #48,d1
    6b2a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6b2e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {
    6b32:	52af 008a      	addq.l #1,138(sp)
    6b36:	7004           	moveq #4,d0
    6b38:	b0af 008a      	cmp.l 138(sp),d0
    6b3c:	6c9e           	bge.s 6adc <TestZoom4Picture+0x2a18>
  }

  for(int i=0;i<7;i++) {
    6b3e:	42af 0086      	clr.l 134(sp)
    6b42:	6000 00d4      	bra.w 6c18 <TestZoom4Picture+0x2b54>
      TestRow( valsupposed, valactual, mask, 10+i*35);
    6b46:	222f 0086      	move.l 134(sp),d1
    6b4a:	2001           	move.l d1,d0
    6b4c:	e988           	lsl.l #4,d0
    6b4e:	d081           	add.l d1,d0
    6b50:	d080           	add.l d0,d0
    6b52:	2040           	movea.l d0,a0
    6b54:	d1c1           	adda.l d1,a0
    6b56:	41e8 000a      	lea 10(a0),a0
    6b5a:	7000           	moveq #0,d0
    6b5c:	302f 01c6      	move.w 454(sp),d0
    6b60:	2f08           	move.l a0,-(sp)
    6b62:	2f00           	move.l d0,-(sp)
    6b64:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b68:	2f2f 0056      	move.l 86(sp),-(sp)
    6b6c:	4eba 03b8      	jsr 6f26 <TestRow>(pc)
    6b70:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6b74:	7230           	moveq #48,d1
    6b76:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6b7a:	466f 01c6      	not.w 454(sp)
    
    for(int i2=0;i2<17;i2++) {
    6b7e:	42af 0082      	clr.l 130(sp)
    6b82:	6000 0086      	bra.w 6c0a <TestZoom4Picture+0x2b46>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6b86:	222f 0086      	move.l 134(sp),d1
    6b8a:	2001           	move.l d1,d0
    6b8c:	e988           	lsl.l #4,d0
    6b8e:	d081           	add.l d1,d0
    6b90:	d080           	add.l d0,d0
    6b92:	2040           	movea.l d0,a0
    6b94:	d1c1           	adda.l d1,a0
    6b96:	41e8 000b      	lea 11(a0),a0
    6b9a:	202f 0082      	move.l 130(sp),d0
    6b9e:	d080           	add.l d0,d0
    6ba0:	2208           	move.l a0,d1
    6ba2:	d280           	add.l d0,d1
    6ba4:	7000           	moveq #0,d0
    6ba6:	302f 01c6      	move.w 454(sp),d0
    6baa:	2f01           	move.l d1,-(sp)
    6bac:	2f00           	move.l d0,-(sp)
    6bae:	2f2f 01d0      	move.l 464(sp),-(sp)
    6bb2:	2f2f 0056      	move.l 86(sp),-(sp)
    6bb6:	4eba 036e      	jsr 6f26 <TestRow>(pc)
    6bba:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6bbe:	7030           	moveq #48,d0
    6bc0:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6bc4:	222f 0086      	move.l 134(sp),d1
    6bc8:	2001           	move.l d1,d0
    6bca:	e988           	lsl.l #4,d0
    6bcc:	d081           	add.l d1,d0
    6bce:	d080           	add.l d0,d0
    6bd0:	2040           	movea.l d0,a0
    6bd2:	d1c1           	adda.l d1,a0
    6bd4:	41e8 000c      	lea 12(a0),a0
    6bd8:	202f 0082      	move.l 130(sp),d0
    6bdc:	d080           	add.l d0,d0
    6bde:	2208           	move.l a0,d1
    6be0:	d280           	add.l d0,d1
    6be2:	7000           	moveq #0,d0
    6be4:	302f 01c6      	move.w 454(sp),d0
    6be8:	2f01           	move.l d1,-(sp)
    6bea:	2f00           	move.l d0,-(sp)
    6bec:	2f2f 01d0      	move.l 464(sp),-(sp)
    6bf0:	2f2f 0056      	move.l 86(sp),-(sp)
    6bf4:	4eba 0330      	jsr 6f26 <TestRow>(pc)
    6bf8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6bfc:	7230           	moveq #48,d1
    6bfe:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6c02:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<17;i2++) {
    6c06:	52af 0082      	addq.l #1,130(sp)
    6c0a:	7010           	moveq #16,d0
    6c0c:	b0af 0082      	cmp.l 130(sp),d0
    6c10:	6c00 ff74      	bge.w 6b86 <TestZoom4Picture+0x2ac2>
  for(int i=0;i<7;i++) {
    6c14:	52af 0086      	addq.l #1,134(sp)
    6c18:	7206           	moveq #6,d1
    6c1a:	b2af 0086      	cmp.l 134(sp),d1
    6c1e:	6c00 ff26      	bge.w 6b46 <TestZoom4Picture+0x2a82>
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    6c22:	7000           	moveq #0,d0
    6c24:	302f 01c6      	move.w 454(sp),d0
    6c28:	4878 00ff      	pea ff <FreeDisplay+0x1f>
    6c2c:	2f00           	move.l d0,-(sp)
    6c2e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6c32:	2f2f 0056      	move.l 86(sp),-(sp)
    6c36:	4eba 02ee      	jsr 6f26 <TestRow>(pc)
    6c3a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6c3e:	7030           	moveq #48,d0
    6c40:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6c44:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<7;i2++) {
    6c48:	42af 007e      	clr.l 126(sp)
    6c4c:	6064           	bra.s 6cb2 <TestZoom4Picture+0x2bee>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6c4e:	202f 007e      	move.l 126(sp),d0
    6c52:	0680 0000 0080 	addi.l #128,d0
    6c58:	d080           	add.l d0,d0
    6c5a:	2200           	move.l d0,d1
    6c5c:	7000           	moveq #0,d0
    6c5e:	302f 01c6      	move.w 454(sp),d0
    6c62:	2f01           	move.l d1,-(sp)
    6c64:	2f00           	move.l d0,-(sp)
    6c66:	2f2f 01d0      	move.l 464(sp),-(sp)
    6c6a:	2f2f 0056      	move.l 86(sp),-(sp)
    6c6e:	4eba 02b6      	jsr 6f26 <TestRow>(pc)
    6c72:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6c76:	7230           	moveq #48,d1
    6c78:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6c7c:	202f 007e      	move.l 126(sp),d0
    6c80:	d080           	add.l d0,d0
    6c82:	2200           	move.l d0,d1
    6c84:	0681 0000 0101 	addi.l #257,d1
    6c8a:	7000           	moveq #0,d0
    6c8c:	302f 01c6      	move.w 454(sp),d0
    6c90:	2f01           	move.l d1,-(sp)
    6c92:	2f00           	move.l d0,-(sp)
    6c94:	2f2f 01d0      	move.l 464(sp),-(sp)
    6c98:	2f2f 0056      	move.l 86(sp),-(sp)
    6c9c:	4eba 0288      	jsr 6f26 <TestRow>(pc)
    6ca0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6ca4:	7030           	moveq #48,d0
    6ca6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6caa:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {
    6cae:	52af 007e      	addq.l #1,126(sp)
    6cb2:	7206           	moveq #6,d1
    6cb4:	b2af 007e      	cmp.l 126(sp),d1
    6cb8:	6c94           	bge.s 6c4e <TestZoom4Picture+0x2b8a>
  }   

  tmp = source;
    6cba:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6cc0:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6cc6:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    6ccc:	4878 0001      	pea 1 <_start+0x1>
    6cd0:	4878 0011      	pea 11 <_start+0x11>
    6cd4:	2f2f 0056      	move.l 86(sp),-(sp)
    6cd8:	2f2f 006a      	move.l 106(sp),-(sp)
    6cdc:	4eba affa      	jsr 1cd8 <Zoom_ZoomIntoPicture>(pc)
    6ce0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6ce4:	2039 0002 8530 	move.l 28530 <GfxBase>,d0
    6cea:	2c40           	movea.l d0,a6
    6cec:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6cf0:	202f 004e      	move.l 78(sp),d0
    6cf4:	5880           	addq.l #4,d0
    6cf6:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom18;
    6cfa:	2f7c 0001 bcd0 	move.l #113872,74(sp)
    6d00:	004a 

  mask = 0xffff;
    6d02:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);
    6d08:	7000           	moveq #0,d0
    6d0a:	302f 01c6      	move.w 454(sp),d0
    6d0e:	42a7           	clr.l -(sp)
    6d10:	2f00           	move.l d0,-(sp)
    6d12:	2f2f 01d0      	move.l 464(sp),-(sp)
    6d16:	2f2f 0056      	move.l 86(sp),-(sp)
    6d1a:	4eba 020a      	jsr 6f26 <TestRow>(pc)
    6d1e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6d22:	7230           	moveq #48,d1
    6d24:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    6d28:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<4;i2++) {
    6d2c:	42af 007a      	clr.l 122(sp)
    6d30:	605c           	bra.s 6d8e <TestZoom4Picture+0x2cca>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    6d32:	202f 007a      	move.l 122(sp),d0
    6d36:	d080           	add.l d0,d0
    6d38:	2200           	move.l d0,d1
    6d3a:	5281           	addq.l #1,d1
    6d3c:	7000           	moveq #0,d0
    6d3e:	302f 01c6      	move.w 454(sp),d0
    6d42:	2f01           	move.l d1,-(sp)
    6d44:	2f00           	move.l d0,-(sp)
    6d46:	2f2f 01d0      	move.l 464(sp),-(sp)
    6d4a:	2f2f 0056      	move.l 86(sp),-(sp)
    6d4e:	4eba 01d6      	jsr 6f26 <TestRow>(pc)
    6d52:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6d56:	7030           	moveq #48,d0
    6d58:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    6d5c:	202f 007a      	move.l 122(sp),d0
    6d60:	5280           	addq.l #1,d0
    6d62:	d080           	add.l d0,d0
    6d64:	2200           	move.l d0,d1
    6d66:	7000           	moveq #0,d0
    6d68:	302f 01c6      	move.w 454(sp),d0
    6d6c:	2f01           	move.l d1,-(sp)
    6d6e:	2f00           	move.l d0,-(sp)
    6d70:	2f2f 01d0      	move.l 464(sp),-(sp)
    6d74:	2f2f 0056      	move.l 86(sp),-(sp)
    6d78:	4eba 01ac      	jsr 6f26 <TestRow>(pc)
    6d7c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6d80:	7230           	moveq #48,d1
    6d82:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6d86:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6d8a:	52af 007a      	addq.l #1,122(sp)
    6d8e:	7003           	moveq #3,d0
    6d90:	b0af 007a      	cmp.l 122(sp),d0
    6d94:	6c9c           	bge.s 6d32 <TestZoom4Picture+0x2c6e>
  }

  for(int i=0;i<7;i++) {  
    6d96:	42af 0076      	clr.l 118(sp)
    6d9a:	6000 009c      	bra.w 6e38 <TestZoom4Picture+0x2d74>
    for(int i2=0;i2<18;i2++) {
    6d9e:	42af 0072      	clr.l 114(sp)
    6da2:	6000 0086      	bra.w 6e2a <TestZoom4Picture+0x2d66>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6da6:	222f 0076      	move.l 118(sp),d1
    6daa:	2001           	move.l d1,d0
    6dac:	e988           	lsl.l #4,d0
    6dae:	d081           	add.l d1,d0
    6db0:	d080           	add.l d0,d0
    6db2:	2040           	movea.l d0,a0
    6db4:	d1c1           	adda.l d1,a0
    6db6:	41e8 000b      	lea 11(a0),a0
    6dba:	202f 0072      	move.l 114(sp),d0
    6dbe:	d080           	add.l d0,d0
    6dc0:	2208           	move.l a0,d1
    6dc2:	d280           	add.l d0,d1
    6dc4:	7000           	moveq #0,d0
    6dc6:	302f 01c6      	move.w 454(sp),d0
    6dca:	2f01           	move.l d1,-(sp)
    6dcc:	2f00           	move.l d0,-(sp)
    6dce:	2f2f 01d0      	move.l 464(sp),-(sp)
    6dd2:	2f2f 0056      	move.l 86(sp),-(sp)
    6dd6:	4eba 014e      	jsr 6f26 <TestRow>(pc)
    6dda:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6dde:	7230           	moveq #48,d1
    6de0:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6de4:	222f 0076      	move.l 118(sp),d1
    6de8:	2001           	move.l d1,d0
    6dea:	e988           	lsl.l #4,d0
    6dec:	d081           	add.l d1,d0
    6dee:	d080           	add.l d0,d0
    6df0:	2040           	movea.l d0,a0
    6df2:	d1c1           	adda.l d1,a0
    6df4:	41e8 000c      	lea 12(a0),a0
    6df8:	202f 0072      	move.l 114(sp),d0
    6dfc:	d080           	add.l d0,d0
    6dfe:	2208           	move.l a0,d1
    6e00:	d280           	add.l d0,d1
    6e02:	7000           	moveq #0,d0
    6e04:	302f 01c6      	move.w 454(sp),d0
    6e08:	2f01           	move.l d1,-(sp)
    6e0a:	2f00           	move.l d0,-(sp)
    6e0c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6e10:	2f2f 0056      	move.l 86(sp),-(sp)
    6e14:	4eba 0110      	jsr 6f26 <TestRow>(pc)
    6e18:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6e1c:	7030           	moveq #48,d0
    6e1e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6e22:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) {
    6e26:	52af 0072      	addq.l #1,114(sp)
    6e2a:	7211           	moveq #17,d1
    6e2c:	b2af 0072      	cmp.l 114(sp),d1
    6e30:	6c00 ff74      	bge.w 6da6 <TestZoom4Picture+0x2ce2>
  for(int i=0;i<7;i++) {  
    6e34:	52af 0076      	addq.l #1,118(sp)
    6e38:	7006           	moveq #6,d0
    6e3a:	b0af 0076      	cmp.l 118(sp),d0
    6e3e:	6c00 ff5e      	bge.w 6d9e <TestZoom4Picture+0x2cda>
    }
  } 

  for(int i2=0;i2<4;i2++) {
    6e42:	42af 006e      	clr.l 110(sp)
    6e46:	6064           	bra.s 6eac <TestZoom4Picture+0x2de8>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6e48:	202f 006e      	move.l 110(sp),d0
    6e4c:	0680 0000 0080 	addi.l #128,d0
    6e52:	d080           	add.l d0,d0
    6e54:	2200           	move.l d0,d1
    6e56:	7000           	moveq #0,d0
    6e58:	302f 01c6      	move.w 454(sp),d0
    6e5c:	2f01           	move.l d1,-(sp)
    6e5e:	2f00           	move.l d0,-(sp)
    6e60:	2f2f 01d0      	move.l 464(sp),-(sp)
    6e64:	2f2f 0056      	move.l 86(sp),-(sp)
    6e68:	4eba 00bc      	jsr 6f26 <TestRow>(pc)
    6e6c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6e70:	7230           	moveq #48,d1
    6e72:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6e76:	202f 006e      	move.l 110(sp),d0
    6e7a:	d080           	add.l d0,d0
    6e7c:	2200           	move.l d0,d1
    6e7e:	0681 0000 0101 	addi.l #257,d1
    6e84:	7000           	moveq #0,d0
    6e86:	302f 01c6      	move.w 454(sp),d0
    6e8a:	2f01           	move.l d1,-(sp)
    6e8c:	2f00           	move.l d0,-(sp)
    6e8e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6e92:	2f2f 0056      	move.l 86(sp),-(sp)
    6e96:	4eba 008e      	jsr 6f26 <TestRow>(pc)
    6e9a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6e9e:	7030           	moveq #48,d0
    6ea0:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6ea4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6ea8:	52af 006e      	addq.l #1,110(sp)
    6eac:	7203           	moveq #3,d1
    6eae:	b2af 006e      	cmp.l 110(sp),d1
    6eb2:	6c94           	bge.s 6e48 <TestZoom4Picture+0x2d84>
  }
  TestRow( valsupposed, valactual, mask, 0);
    6eb4:	7000           	moveq #0,d0
    6eb6:	302f 01c6      	move.w 454(sp),d0
    6eba:	42a7           	clr.l -(sp)
    6ebc:	2f00           	move.l d0,-(sp)
    6ebe:	2f2f 01d0      	move.l 464(sp),-(sp)
    6ec2:	2f2f 0056      	move.l 86(sp),-(sp)
    6ec6:	4eba 005e      	jsr 6f26 <TestRow>(pc)
    6eca:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6ece:	7030           	moveq #48,d0
    6ed0:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6ed4:	466f 01c6      	not.w 454(sp)
  FreeMem( source, (ZMLINESIZE+4)*272);
    6ed8:	2f6f 005e 0042 	move.l 94(sp),66(sp)
    6ede:	2f7c 0000 3740 	move.l #14144,62(sp)
    6ee4:	003e 
    6ee6:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    6eec:	2c40           	movea.l d0,a6
    6eee:	226f 0042      	movea.l 66(sp),a1
    6ef2:	202f 003e      	move.l 62(sp),d0
    6ef6:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    6efa:	2f6f 004e 003a 	move.l 78(sp),58(sp)
    6f00:	2f7c 0000 3740 	move.l #14144,54(sp)
    6f06:	0036 
    6f08:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    6f0e:	2c40           	movea.l d0,a6
    6f10:	226f 003a      	movea.l 58(sp),a1
    6f14:	202f 0036      	move.l 54(sp),d0
    6f18:	4eae ff2e      	jsr -210(a6)
}
    6f1c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    6f20:	4fef 01d0      	lea 464(sp),sp
    6f24:	4e75           	rts

00006f26 <TestRow>:

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    6f26:	4fef ff40      	lea -192(sp),sp
    6f2a:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
    6f2e:	202f 00e0      	move.l 224(sp),d0
    6f32:	3000           	move.w d0,d0
    6f34:	3f40 0016      	move.w d0,22(sp)
  
  char str[ 100] = { 0 };
    6f38:	42af 001c      	clr.l 28(sp)
    6f3c:	7020           	moveq #32,d0
    6f3e:	d08f           	add.l sp,d0
    6f40:	7260           	moveq #96,d1
    6f42:	2f01           	move.l d1,-(sp)
    6f44:	42a7           	clr.l -(sp)
    6f46:	2f00           	move.l d0,-(sp)
    6f48:	4eba 020c      	jsr 7156 <memset>(pc)
    6f4c:	4fef 000c      	lea 12(sp),sp
  UWORD data[2];
  data[1] = numberofline;
    6f50:	202f 00e4      	move.l 228(sp),d0
    6f54:	3f40 001a      	move.w d0,26(sp)

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    6f58:	42af 00d0      	clr.l 208(sp)
    6f5c:	6000 00d4      	bra.w 7032 <TestRow+0x10c>
    if( (*testpattern++ ^ xormask) != *destination++) {
    6f60:	202f 00d8      	move.l 216(sp),d0
    6f64:	2200           	move.l d0,d1
    6f66:	5481           	addq.l #2,d1
    6f68:	2f41 00d8      	move.l d1,216(sp)
    6f6c:	2040           	movea.l d0,a0
    6f6e:	3010           	move.w (a0),d0
    6f70:	322f 0016      	move.w 22(sp),d1
    6f74:	b141           	eor.w d0,d1
    6f76:	202f 00dc      	move.l 220(sp),d0
    6f7a:	2400           	move.l d0,d2
    6f7c:	5482           	addq.l #2,d2
    6f7e:	2f42 00dc      	move.l d2,220(sp)
    6f82:	2040           	movea.l d0,a0
    6f84:	3010           	move.w (a0),d0
    6f86:	b041           	cmp.w d1,d0
    6f88:	6700 00a4      	beq.w 702e <TestRow+0x108>
      data[0] = i;
    6f8c:	202f 00d0      	move.l 208(sp),d0
    6f90:	3f40 0018      	move.w d0,24(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    6f94:	2f7c 0001 8404 	move.l #99332,164(sp)
    6f9a:	00a4 
    6f9c:	702b           	moveq #43,d0
    6f9e:	4600           	not.b d0
    6fa0:	d08f           	add.l sp,d0
    6fa2:	0680 ffff ff44 	addi.l #-188,d0
    6fa8:	2f40 00a0      	move.l d0,160(sp)
    6fac:	2f7c 0000 75f4 	move.l #30196,156(sp)
    6fb2:	009c 
    6fb4:	722b           	moveq #43,d1
    6fb6:	4601           	not.b d1
    6fb8:	d28f           	add.l sp,d1
    6fba:	0681 ffff ff48 	addi.l #-184,d1
    6fc0:	2f41 0098      	move.l d1,152(sp)
    6fc4:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    6fca:	2c40           	movea.l d0,a6
    6fcc:	206f 00a4      	movea.l 164(sp),a0
    6fd0:	226f 00a0      	movea.l 160(sp),a1
    6fd4:	246f 009c      	movea.l 156(sp),a2
    6fd8:	266f 0098      	movea.l 152(sp),a3
    6fdc:	4eae fdf6      	jsr -522(a6)
    6fe0:	2f40 0094      	move.l d0,148(sp)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    6fe4:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    6fea:	2c40           	movea.l d0,a6
    6fec:	4eae ffc4      	jsr -60(a6)
    6ff0:	2f40 0090      	move.l d0,144(sp)
    6ff4:	202f 0090      	move.l 144(sp),d0
    6ff8:	2f40 008c      	move.l d0,140(sp)
    6ffc:	742b           	moveq #43,d2
    6ffe:	4602           	not.b d2
    7000:	d48f           	add.l sp,d2
    7002:	0682 ffff ff48 	addi.l #-184,d2
    7008:	2f42 0088      	move.l d2,136(sp)
    700c:	7064           	moveq #100,d0
    700e:	2f40 0084      	move.l d0,132(sp)
    7012:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    7018:	2c40           	movea.l d0,a6
    701a:	222f 008c      	move.l 140(sp),d1
    701e:	242f 0088      	move.l 136(sp),d2
    7022:	262f 0084      	move.l 132(sp),d3
    7026:	4eae ffd0      	jsr -48(a6)
    702a:	2f40 0080      	move.l d0,128(sp)
  for(int i=0;i<21;i++) {
    702e:	52af 00d0      	addq.l #1,208(sp)
    7032:	7214           	moveq #20,d1
    7034:	b2af 00d0      	cmp.l 208(sp),d1
    7038:	6c00 ff26      	bge.w 6f60 <TestRow+0x3a>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    703c:	206f 00d8      	movea.l 216(sp),a0
    7040:	3010           	move.w (a0),d0
    7042:	322f 0016      	move.w 22(sp),d1
    7046:	b141           	eor.w d0,d1
    7048:	206f 00dc      	movea.l 220(sp),a0
    704c:	3010           	move.w (a0),d0
    704e:	b340           	eor.w d1,d0
    7050:	3000           	move.w d0,d0
    7052:	0280 0000 ffff 	andi.l #65535,d0
    7058:	0280 0000 ff00 	andi.l #65280,d0
    705e:	6700 00cc      	beq.w 712c <TestRow+0x206>
    data[0] = 21;
    7062:	3f7c 0015 0018 	move.w #21,24(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    7068:	2f7c 0001 8404 	move.l #99332,204(sp)
    706e:	00cc 
    7070:	742b           	moveq #43,d2
    7072:	4602           	not.b d2
    7074:	d48f           	add.l sp,d2
    7076:	0682 ffff ff44 	addi.l #-188,d2
    707c:	2f42 00c8      	move.l d2,200(sp)
    7080:	2f7c 0000 75f4 	move.l #30196,196(sp)
    7086:	00c4 
    7088:	702b           	moveq #43,d0
    708a:	4600           	not.b d0
    708c:	d08f           	add.l sp,d0
    708e:	0680 ffff ff48 	addi.l #-184,d0
    7094:	2f40 00c0      	move.l d0,192(sp)
    7098:	2039 0002 8524 	move.l 28524 <SysBase>,d0
    709e:	2c40           	movea.l d0,a6
    70a0:	206f 00cc      	movea.l 204(sp),a0
    70a4:	226f 00c8      	movea.l 200(sp),a1
    70a8:	246f 00c4      	movea.l 196(sp),a2
    70ac:	266f 00c0      	movea.l 192(sp),a3
    70b0:	4eae fdf6      	jsr -522(a6)
    70b4:	2f40 00bc      	move.l d0,188(sp)
                                                                           str);
    Write(  Output(), str, 100);
    70b8:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    70be:	2c40           	movea.l d0,a6
    70c0:	4eae ffc4      	jsr -60(a6)
    70c4:	2f40 00b8      	move.l d0,184(sp)
    70c8:	202f 00b8      	move.l 184(sp),d0
    70cc:	2f40 00b4      	move.l d0,180(sp)
    70d0:	722b           	moveq #43,d1
    70d2:	4601           	not.b d1
    70d4:	d28f           	add.l sp,d1
    70d6:	0681 ffff ff48 	addi.l #-184,d1
    70dc:	2f41 00b0      	move.l d1,176(sp)
    70e0:	7464           	moveq #100,d2
    70e2:	2f42 00ac      	move.l d2,172(sp)
    70e6:	2039 0002 852c 	move.l 2852c <DOSBase>,d0
    70ec:	2c40           	movea.l d0,a6
    70ee:	222f 00b4      	move.l 180(sp),d1
    70f2:	242f 00b0      	move.l 176(sp),d2
    70f6:	262f 00ac      	move.l 172(sp),d3
    70fa:	4eae ffd0      	jsr -48(a6)
    70fe:	2f40 00a8      	move.l d0,168(sp)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
    7102:	206f 00dc      	movea.l 220(sp),a0
    7106:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    7108:	7200           	moveq #0,d1
    710a:	3200           	move.w d0,d1
                                                   *testpattern,*destination);
    710c:	206f 00d8      	movea.l 216(sp),a0
    7110:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    7112:	3000           	move.w d0,d0
    7114:	0280 0000 ffff 	andi.l #65535,d0
    711a:	2f01           	move.l d1,-(sp)
    711c:	2f00           	move.l d0,-(sp)
    711e:	4879 0001 8434 	pea 18434 <incbin_startimage_end+0x796>
    7124:	4eba 0162      	jsr 7288 <KPrintF>(pc)
    7128:	4fef 000c      	lea 12(sp),sp
     
  }
}
    712c:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    7130:	4fef 00c0      	lea 192(sp),sp
    7134:	4e75           	rts

00007136 <strlen>:
{
    7136:	598f           	subq.l #4,sp
	unsigned long t=0;
    7138:	4297           	clr.l (sp)
    713a:	6002           	bra.s 713e <strlen+0x8>
		t++;
    713c:	5297           	addq.l #1,(sp)
	while(*s++)
    713e:	202f 0008      	move.l 8(sp),d0
    7142:	2200           	move.l d0,d1
    7144:	5281           	addq.l #1,d1
    7146:	2f41 0008      	move.l d1,8(sp)
    714a:	2040           	movea.l d0,a0
    714c:	1010           	move.b (a0),d0
    714e:	66ec           	bne.s 713c <strlen+0x6>
	return t;
    7150:	2017           	move.l (sp),d0
}
    7152:	588f           	addq.l #4,sp
    7154:	4e75           	rts

00007156 <memset>:
{
    7156:	4e55 fffc      	link.w a5,#-4
	unsigned char *ptr = (unsigned char *)dest;
    715a:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
    7160:	6014           	bra.s 7176 <memset+0x20>
		*ptr++ = val;
    7162:	202d fffc      	move.l -4(a5),d0
    7166:	2200           	move.l d0,d1
    7168:	5281           	addq.l #1,d1
    716a:	2b41 fffc      	move.l d1,-4(a5)
    716e:	222d 000c      	move.l 12(a5),d1
    7172:	2040           	movea.l d0,a0
    7174:	1081           	move.b d1,(a0)
	while(len-- > 0)
    7176:	202d 0010      	move.l 16(a5),d0
    717a:	2200           	move.l d0,d1
    717c:	5381           	subq.l #1,d1
    717e:	2b41 0010      	move.l d1,16(a5)
    7182:	4a80           	tst.l d0
    7184:	66dc           	bne.s 7162 <memset+0xc>
	return dest;
    7186:	202d 0008      	move.l 8(a5),d0
}
    718a:	4e5d           	unlk a5
    718c:	4e75           	rts

0000718e <memcpy>:
{
    718e:	4e55 fff8      	link.w a5,#-8
    7192:	2f02           	move.l d2,-(sp)
	char *d = (char *)dest;
    7194:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = (const char *)src;
    719a:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
    71a0:	6020           	bra.s 71c2 <memcpy+0x34>
		*d++ = *s++;
    71a2:	222d fff8      	move.l -8(a5),d1
    71a6:	2001           	move.l d1,d0
    71a8:	5280           	addq.l #1,d0
    71aa:	2b40 fff8      	move.l d0,-8(a5)
    71ae:	202d fffc      	move.l -4(a5),d0
    71b2:	2400           	move.l d0,d2
    71b4:	5282           	addq.l #1,d2
    71b6:	2b42 fffc      	move.l d2,-4(a5)
    71ba:	2041           	movea.l d1,a0
    71bc:	1210           	move.b (a0),d1
    71be:	2040           	movea.l d0,a0
    71c0:	1081           	move.b d1,(a0)
	while(len--)
    71c2:	202d 0010      	move.l 16(a5),d0
    71c6:	2200           	move.l d0,d1
    71c8:	5381           	subq.l #1,d1
    71ca:	2b41 0010      	move.l d1,16(a5)
    71ce:	4a80           	tst.l d0
    71d0:	66d0           	bne.s 71a2 <memcpy+0x14>
	return dest;
    71d2:	202d 0008      	move.l 8(a5),d0
}
    71d6:	241f           	move.l (sp)+,d2
    71d8:	4e5d           	unlk a5
    71da:	4e75           	rts

000071dc <memmove>:
{
    71dc:	4e55 fff0      	link.w a5,#-16
    71e0:	2f02           	move.l d2,-(sp)
	char *d = dest;
    71e2:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = src;
    71e8:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
	if (d < s) {
    71ee:	202d fffc      	move.l -4(a5),d0
    71f2:	b0ad fff8      	cmp.l -8(a5),d0
    71f6:	6522           	bcs.s 721a <memmove+0x3e>
    71f8:	6032           	bra.s 722c <memmove+0x50>
			*d++ = *s++;
    71fa:	222d fff8      	move.l -8(a5),d1
    71fe:	2401           	move.l d1,d2
    7200:	5282           	addq.l #1,d2
    7202:	2b42 fff8      	move.l d2,-8(a5)
    7206:	202d fffc      	move.l -4(a5),d0
    720a:	2400           	move.l d0,d2
    720c:	5282           	addq.l #1,d2
    720e:	2b42 fffc      	move.l d2,-4(a5)
    7212:	2041           	movea.l d1,a0
    7214:	1210           	move.b (a0),d1
    7216:	2040           	movea.l d0,a0
    7218:	1081           	move.b d1,(a0)
		while (len--)
    721a:	202d 0010      	move.l 16(a5),d0
    721e:	2200           	move.l d0,d1
    7220:	5381           	subq.l #1,d1
    7222:	2b41 0010      	move.l d1,16(a5)
    7226:	4a80           	tst.l d0
    7228:	66d0           	bne.s 71fa <memmove+0x1e>
    722a:	6052           	bra.s 727e <memmove+0xa2>
		const char *lasts = s + (len - 1);
    722c:	202d 0010      	move.l 16(a5),d0
    7230:	5380           	subq.l #1,d0
    7232:	242d fff8      	move.l -8(a5),d2
    7236:	d480           	add.l d0,d2
    7238:	2b42 fff4      	move.l d2,-12(a5)
		char *lastd = d + (len - 1);
    723c:	202d 0010      	move.l 16(a5),d0
    7240:	5380           	subq.l #1,d0
    7242:	222d fffc      	move.l -4(a5),d1
    7246:	d280           	add.l d0,d1
    7248:	2b41 fff0      	move.l d1,-16(a5)
    724c:	6020           	bra.s 726e <memmove+0x92>
			*lastd-- = *lasts--;
    724e:	222d fff4      	move.l -12(a5),d1
    7252:	2401           	move.l d1,d2
    7254:	5382           	subq.l #1,d2
    7256:	2b42 fff4      	move.l d2,-12(a5)
    725a:	202d fff0      	move.l -16(a5),d0
    725e:	2400           	move.l d0,d2
    7260:	5382           	subq.l #1,d2
    7262:	2b42 fff0      	move.l d2,-16(a5)
    7266:	2041           	movea.l d1,a0
    7268:	1210           	move.b (a0),d1
    726a:	2040           	movea.l d0,a0
    726c:	1081           	move.b d1,(a0)
		while (len--)
    726e:	202d 0010      	move.l 16(a5),d0
    7272:	2200           	move.l d0,d1
    7274:	5381           	subq.l #1,d1
    7276:	2b41 0010      	move.l d1,16(a5)
    727a:	4a80           	tst.l d0
    727c:	66d0           	bne.s 724e <memmove+0x72>
	return dest;
    727e:	202d 0008      	move.l 8(a5),d0
}
    7282:	241f           	move.l (sp)+,d2
    7284:	4e5d           	unlk a5
    7286:	4e75           	rts

00007288 <KPrintF>:
{
    7288:	4fef ff80      	lea -128(sp),sp
    728c:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    7290:	3039 00f0 ff60 	move.w f0ff60 <_end+0xee79e8>,d0
    7296:	0c40 4eb9      	cmpi.w #20153,d0
    729a:	6722           	beq.s 72be <KPrintF+0x36>
    729c:	0c40 a00e      	cmpi.w #-24562,d0
    72a0:	671c           	beq.s 72be <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    72a2:	2c79 0002 8524 	movea.l 28524 <SysBase>,a6
    72a8:	206f 0090      	movea.l 144(sp),a0
    72ac:	43ef 0094      	lea 148(sp),a1
    72b0:	45f9 0000 75e6 	lea 75e6 <KPutCharX>,a2
    72b6:	97cb           	suba.l a3,a3
    72b8:	4eae fdf6      	jsr -522(a6)
    72bc:	602a           	bra.s 72e8 <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    72be:	2c79 0002 8524 	movea.l 28524 <SysBase>,a6
    72c4:	206f 0090      	movea.l 144(sp),a0
    72c8:	43ef 0094      	lea 148(sp),a1
    72cc:	45f9 0000 75f4 	lea 75f4 <PutChar>,a2
    72d2:	47ef 000c      	lea 12(sp),a3
    72d6:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    72da:	2f0b           	move.l a3,-(sp)
    72dc:	4878 0056      	pea 56 <_start+0x56>
    72e0:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xee79e8>
    72e6:	508f           	addq.l #8,sp
}
    72e8:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    72ec:	4fef 0080      	lea 128(sp),sp
    72f0:	4e75           	rts

000072f2 <warpmode>:

void warpmode(int on) // bool
{
    72f2:	518f           	subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
    72f4:	2f7c 00f0 ff60 	move.l #15794016,4(sp)
    72fa:	0004 
    if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
    72fc:	206f 0004      	movea.l 4(sp),a0
    7300:	3010           	move.w (a0),d0
    7302:	0c40 4eb9      	cmpi.w #20153,d0
    7306:	670c           	beq.s 7314 <warpmode+0x22>
    7308:	206f 0004      	movea.l 4(sp),a0
    730c:	3010           	move.w (a0),d0
    730e:	0c40 a00e      	cmpi.w #-24562,d0
    7312:	6668           	bne.s 737c <warpmode+0x8a>
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    7314:	4aaf 000c      	tst.l 12(sp)
    7318:	6708           	beq.s 7322 <warpmode+0x30>
    731a:	203c 0001 845a 	move.l #99418,d0
    7320:	6006           	bra.s 7328 <warpmode+0x36>
    7322:	203c 0001 8464 	move.l #99428,d0
    7328:	4878 0001      	pea 1 <_start+0x1>
    732c:	220f           	move.l sp,d1
    732e:	5e81           	addq.l #7,d1
    7330:	2f01           	move.l d1,-(sp)
    7332:	42a7           	clr.l -(sp)
    7334:	2f00           	move.l d0,-(sp)
    7336:	4878 ffff      	pea ffffffff <_end+0xfffd7a87>
    733a:	4878 0052      	pea 52 <_start+0x52>
    733e:	206f 001c      	movea.l 28(sp),a0
    7342:	4e90           	jsr (a0)
    7344:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    7348:	4aaf 000c      	tst.l 12(sp)
    734c:	6708           	beq.s 7356 <warpmode+0x64>
    734e:	203c 0001 846f 	move.l #99439,d0
    7354:	6006           	bra.s 735c <warpmode+0x6a>
    7356:	203c 0001 8489 	move.l #99465,d0
    735c:	4878 0001      	pea 1 <_start+0x1>
    7360:	220f           	move.l sp,d1
    7362:	5e81           	addq.l #7,d1
    7364:	2f01           	move.l d1,-(sp)
    7366:	42a7           	clr.l -(sp)
    7368:	2f00           	move.l d0,-(sp)
    736a:	4878 ffff      	pea ffffffff <_end+0xfffd7a87>
    736e:	4878 0052      	pea 52 <_start+0x52>
    7372:	206f 001c      	movea.l 28(sp),a0
    7376:	4e90           	jsr (a0)
    7378:	4fef 0018      	lea 24(sp),sp
	}
}
    737c:	508f           	addq.l #8,sp
    737e:	4e75           	rts

00007380 <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4)
{
    7380:	598f           	subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
    7382:	2ebc 00f0 ff60 	move.l #15794016,(sp)
    if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    7388:	2057           	movea.l (sp),a0
    738a:	3010           	move.w (a0),d0
    738c:	0c40 4eb9      	cmpi.w #20153,d0
    7390:	670a           	beq.s 739c <debug_cmd+0x1c>
    7392:	2057           	movea.l (sp),a0
    7394:	3010           	move.w (a0),d0
    7396:	0c40 a00e      	cmpi.w #-24562,d0
    739a:	661e           	bne.s 73ba <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
    739c:	2f2f 0014      	move.l 20(sp),-(sp)
    73a0:	2f2f 0014      	move.l 20(sp),-(sp)
    73a4:	2f2f 0014      	move.l 20(sp),-(sp)
    73a8:	2f2f 0014      	move.l 20(sp),-(sp)
    73ac:	4878 0058      	pea 58 <_start+0x58>
    73b0:	206f 0014      	movea.l 20(sp),a0
    73b4:	4e90           	jsr (a0)
    73b6:	4fef 0014      	lea 20(sp),sp
	}
}
    73ba:	588f           	addq.l #4,sp
    73bc:	4e75           	rts

000073be <debug_clear>:
	barto_cmd_text,
};

void debug_clear()
{
	debug_cmd(barto_cmd_clear, 0, 0, 0);
    73be:	42a7           	clr.l -(sp)
    73c0:	42a7           	clr.l -(sp)
    73c2:	42a7           	clr.l -(sp)
    73c4:	42a7           	clr.l -(sp)
    73c6:	4eba ffb8      	jsr 7380 <debug_cmd>(pc)
    73ca:	4fef 0010      	lea 16(sp),sp
}
    73ce:	4e75           	rts

000073d0 <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color)
{
    73d0:	518f           	subq.l #8,sp
    73d2:	2f02           	move.l d2,-(sp)
    73d4:	226f 0010      	movea.l 16(sp),a1
    73d8:	206f 0014      	movea.l 20(sp),a0
    73dc:	222f 0018      	move.l 24(sp),d1
    73e0:	202f 001c      	move.l 28(sp),d0
    73e4:	3249           	movea.w a1,a1
    73e6:	3f49 000a      	move.w a1,10(sp)
    73ea:	3048           	movea.w a0,a0
    73ec:	3f48 0008      	move.w a0,8(sp)
    73f0:	3201           	move.w d1,d1
    73f2:	3f41 0006      	move.w d1,6(sp)
    73f6:	3000           	move.w d0,d0
    73f8:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    73fc:	302f 0006      	move.w 6(sp),d0
    7400:	48c0           	ext.l d0
    7402:	4840           	swap d0
    7404:	4240           	clr.w d0
    7406:	322f 0004      	move.w 4(sp),d1
    740a:	48c1           	ext.l d1
    740c:	8280           	or.l d0,d1
    740e:	302f 000a      	move.w 10(sp),d0
    7412:	48c0           	ext.l d0
    7414:	4840           	swap d0
    7416:	4240           	clr.w d0
    7418:	306f 0008      	movea.w 8(sp),a0
    741c:	2408           	move.l a0,d2
    741e:	8082           	or.l d2,d0
    7420:	2f2f 0020      	move.l 32(sp),-(sp)
    7424:	2f01           	move.l d1,-(sp)
    7426:	2f00           	move.l d0,-(sp)
    7428:	4878 0001      	pea 1 <_start+0x1>
    742c:	4eba ff52      	jsr 7380 <debug_cmd>(pc)
    7430:	4fef 0010      	lea 16(sp),sp
}
    7434:	241f           	move.l (sp)+,d2
    7436:	508f           	addq.l #8,sp
    7438:	4e75           	rts

0000743a <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color)
{
    743a:	518f           	subq.l #8,sp
    743c:	2f02           	move.l d2,-(sp)
    743e:	226f 0010      	movea.l 16(sp),a1
    7442:	206f 0014      	movea.l 20(sp),a0
    7446:	222f 0018      	move.l 24(sp),d1
    744a:	202f 001c      	move.l 28(sp),d0
    744e:	3249           	movea.w a1,a1
    7450:	3f49 000a      	move.w a1,10(sp)
    7454:	3048           	movea.w a0,a0
    7456:	3f48 0008      	move.w a0,8(sp)
    745a:	3201           	move.w d1,d1
    745c:	3f41 0006      	move.w d1,6(sp)
    7460:	3000           	move.w d0,d0
    7462:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    7466:	302f 0006      	move.w 6(sp),d0
    746a:	48c0           	ext.l d0
    746c:	4840           	swap d0
    746e:	4240           	clr.w d0
    7470:	322f 0004      	move.w 4(sp),d1
    7474:	48c1           	ext.l d1
    7476:	8280           	or.l d0,d1
    7478:	302f 000a      	move.w 10(sp),d0
    747c:	48c0           	ext.l d0
    747e:	4840           	swap d0
    7480:	4240           	clr.w d0
    7482:	306f 0008      	movea.w 8(sp),a0
    7486:	2408           	move.l a0,d2
    7488:	8082           	or.l d2,d0
    748a:	2f2f 0020      	move.l 32(sp),-(sp)
    748e:	2f01           	move.l d1,-(sp)
    7490:	2f00           	move.l d0,-(sp)
    7492:	4878 0002      	pea 2 <_start+0x2>
    7496:	4eba fee8      	jsr 7380 <debug_cmd>(pc)
    749a:	4fef 0010      	lea 16(sp),sp
}
    749e:	241f           	move.l (sp)+,d2
    74a0:	508f           	addq.l #8,sp
    74a2:	4e75           	rts

000074a4 <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color)
{
    74a4:	598f           	subq.l #4,sp
    74a6:	2f02           	move.l d2,-(sp)
    74a8:	222f 000c      	move.l 12(sp),d1
    74ac:	202f 0010      	move.l 16(sp),d0
    74b0:	3201           	move.w d1,d1
    74b2:	3f41 0006      	move.w d1,6(sp)
    74b6:	3000           	move.w d0,d0
    74b8:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
    74bc:	202f 0014      	move.l 20(sp),d0
    74c0:	322f 0006      	move.w 6(sp),d1
    74c4:	48c1           	ext.l d1
    74c6:	4841           	swap d1
    74c8:	4241           	clr.w d1
    74ca:	306f 0004      	movea.w 4(sp),a0
    74ce:	2408           	move.l a0,d2
    74d0:	8282           	or.l d2,d1
    74d2:	2f2f 0018      	move.l 24(sp),-(sp)
    74d6:	2f00           	move.l d0,-(sp)
    74d8:	2f01           	move.l d1,-(sp)
    74da:	4878 0003      	pea 3 <_start+0x3>
    74de:	4eba fea0      	jsr 7380 <debug_cmd>(pc)
    74e2:	4fef 0010      	lea 16(sp),sp
}
    74e6:	241f           	move.l (sp)+,d2
    74e8:	588f           	addq.l #4,sp
    74ea:	4e75           	rts

000074ec <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    74ec:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    74f0:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    74f4:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    74f8:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    74fc:	d041           	add.w d1,d0
	swap	d0
    74fe:	4840           	swap d0
	clrw	d0
    7500:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    7502:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    7506:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    750a:	d081           	add.l d1,d0
	rts
    750c:	4e75           	rts

0000750e <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    750e:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    7510:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    7514:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    7518:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    751e:	6416           	bcc.s 7536 <__udivsi3+0x28>
	movel	d0, d2
    7520:	2400           	move.l d0,d2
	clrw	d2
    7522:	4242           	clr.w d2
	swap	d2
    7524:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    7526:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    7528:	3002           	move.w d2,d0
	swap	d0
    752a:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    752c:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    7530:	84c1           	divu.w d1,d2
	movew	d2, d0
    7532:	3002           	move.w d2,d0
	jra	6f
    7534:	6030           	bra.s 7566 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    7536:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    7538:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    753a:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    753c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    7542:	64f4           	bcc.s 7538 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    7544:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    7546:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    754c:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    754e:	c2c0           	mulu.w d0,d1
	swap	d2
    7550:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    7552:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    7554:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    7556:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    7558:	660a           	bne.s 7564 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    755a:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    755c:	6506           	bcs.s 7564 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    755e:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    7562:	6302           	bls.s 7566 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    7564:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    7566:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    7568:	4e75           	rts

0000756a <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    756a:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    756c:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    756e:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    7572:	6a04           	bpl.s 7578 <__divsi3+0xe>
	negl	d1
    7574:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    7576:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    7578:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    757c:	6a04           	bpl.s 7582 <__divsi3+0x18>
	negl	d0
    757e:	4480           	neg.l d0
	negb	d2
    7580:	4402           	neg.b d2

2:	movel	d1, sp@-
    7582:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    7584:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    7586:	6186           	bsr.s 750e <__udivsi3>
	addql	IMM (8), sp
    7588:	508f           	addq.l #8,sp

	tstb	d2
    758a:	4a02           	tst.b d2
	jpl	3f
    758c:	6a02           	bpl.s 7590 <__divsi3+0x26>
	negl	d0
    758e:	4480           	neg.l d0

3:	movel	sp@+, d2
    7590:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    7592:	4e75           	rts

00007594 <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    7594:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7598:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    759c:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    759e:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    75a0:	61c8           	bsr.s 756a <__divsi3>
	addql	IMM (8), sp
    75a2:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    75a4:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    75a8:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    75aa:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    75ac:	6100 ff3e      	bsr.w 74ec <__mulsi3>
	addql	IMM (8), sp
    75b0:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    75b2:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    75b6:	9280           	sub.l d0,d1
	movel	d1, d0
    75b8:	2001           	move.l d1,d0
	rts
    75ba:	4e75           	rts

000075bc <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    75bc:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    75c0:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    75c4:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    75c6:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    75c8:	6100 ff44      	bsr.w 750e <__udivsi3>
	addql	IMM (8), sp
    75cc:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    75ce:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    75d2:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    75d4:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    75d6:	6100 ff14      	bsr.w 74ec <__mulsi3>
	addql	IMM (8), sp
    75da:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    75dc:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    75e0:	9280           	sub.l d0,d1
	movel	d1, d0
    75e2:	2001           	move.l d1,d0
	rts
    75e4:	4e75           	rts

000075e6 <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    75e6:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    75e8:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    75ec:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    75f0:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    75f2:	4e75           	rts

000075f4 <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    75f4:	16c0           	move.b d0,(a3)+
	rts
    75f6:	4e75           	rts
