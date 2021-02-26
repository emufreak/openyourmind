
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
       2:	203c 0000 a7e6 	move.l #42982,d0
       8:	0480 0000 a7e6 	subi.l #42982,d0
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
      22:	41f9 0000 a7e6 	lea a7e6 <__fini_array_end>,a0
      28:	2071 8800      	movea.l (0,a1,a0.l),a0
      2c:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      2e:	52af 0004      	addq.l #1,4(sp)
      32:	202f 0004      	move.l 4(sp),d0
      36:	b097           	cmp.l (sp),d0
      38:	65de           	bcs.s 18 <_start+0x18>

	count = __init_array_end - __init_array_start;
      3a:	203c 0000 a7e6 	move.l #42982,d0
      40:	0480 0000 a7e6 	subi.l #42982,d0
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
      5a:	41f9 0000 a7e6 	lea a7e6 <__fini_array_end>,a0
      60:	2071 8800      	movea.l (0,a1,a0.l),a0
      64:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      66:	52af 0004      	addq.l #1,4(sp)
      6a:	202f 0004      	move.l 4(sp),d0
      6e:	b097           	cmp.l (sp),d0
      70:	65de           	bcs.s 50 <_start+0x50>

	main();
      72:	4eb9 0000 0812 	jsr 812 <main>

	// call dtors
	count = __fini_array_end - __fini_array_start;
      78:	203c 0000 a7e6 	move.l #42982,d0
      7e:	0480 0000 a7e6 	subi.l #42982,d0
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
      9a:	41f9 0000 a7e6 	lea a7e6 <__fini_array_end>,a0
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
      b6:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
      bc:	3f68 0002 0002 	move.w 2(a0),2(sp)
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
      c2:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
      c8:	3028 0002      	move.w 2(a0),d0
      cc:	3000           	move.w d0,d0
      ce:	0280 0000 ffff 	andi.l #65535,d0
      d4:	0280 0000 4000 	andi.l #16384,d0
      da:	66e6           	bne.s c2 <WaitBlt+0xe>
}
      dc:	588f           	addq.l #4,sp
      de:	4e75           	rts

000000e0 <FreeDisplay>:
   0x018A0221,0x018C0330,0x018E0332,0x01900731,0x01920443,0x01940442,0x01960451,
   0x01980951,0x019A0664,0x019C0664,0x019E0662,0x01A00C62,0x01A20886,0x01A40885,
   0x01A60883,0x01A80F81,0x01AA0AA7,0x01AC0AA8,0x01AE0AA5,0x01B00BB7,0x01B20CC8,
           0x01B40CC9,0x01B60DDA,0x01B80ED6,0x01BA0EEC,0x01BC0EEA, 0x01BE0FFF };

void FreeDisplay( int clsize, int bplsize) {
      e0:	4fef ffe0      	lea -32(sp),sp
      e4:	2f0e           	move.l a6,-(sp)
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
      e6:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
      ec:	6722           	beq.s 110 <FreeDisplay+0x30>
      ee:	2f79 001a db74 	move.l 1adb74 <Copperlist1>,32(sp)
      f4:	0020 
      f6:	2f6f 0028 001c 	move.l 40(sp),28(sp)
      fc:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
     102:	2c40           	movea.l d0,a6
     104:	226f 0020      	movea.l 32(sp),a1
     108:	202f 001c      	move.l 28(sp),d0
     10c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     110:	2039 001a db78 	move.l 1adb78 <Copperlist2>,d0
     116:	6722           	beq.s 13a <FreeDisplay+0x5a>
     118:	2f79 001a db78 	move.l 1adb78 <Copperlist2>,24(sp)
     11e:	0018 
     120:	2f6f 0028 0014 	move.l 40(sp),20(sp)
     126:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
     12c:	2c40           	movea.l d0,a6
     12e:	226f 0018      	movea.l 24(sp),a1
     132:	202f 0014      	move.l 20(sp),d0
     136:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
     13a:	2039 001a db6c 	move.l 1adb6c <Bitplane1>,d0
     140:	6722           	beq.s 164 <FreeDisplay+0x84>
     142:	2f79 001a db6c 	move.l 1adb6c <Bitplane1>,16(sp)
     148:	0010 
     14a:	2f6f 002c 000c 	move.l 44(sp),12(sp)
     150:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
     156:	2c40           	movea.l d0,a6
     158:	226f 0010      	movea.l 16(sp),a1
     15c:	202f 000c      	move.l 12(sp),d0
     160:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
     164:	2039 001a db70 	move.l 1adb70 <Bitplane2>,d0
     16a:	6722           	beq.s 18e <FreeDisplay+0xae>
     16c:	2f79 001a db70 	move.l 1adb70 <Bitplane2>,8(sp)
     172:	0008 
     174:	2f6f 002c 0004 	move.l 44(sp),4(sp)
     17a:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
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
     19a:	2039 001a db7c 	move.l 1adb7c <DrawBuffer>,d0
     1a0:	4240           	clr.w d0
     1a2:	4840           	swap d0
     1a4:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     1a8:	2039 001a db7c 	move.l 1adb7c <DrawBuffer>,d0
     1ae:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     1b2:	2f79 001a db84 	move.l 1adb84 <DrawCopper>,4(sp)
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
     1d2:	2039 001a db7c 	move.l 1adb7c <DrawBuffer>,d0
     1d8:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     1da:	2039 001a db80 	move.l 1adb80 <ViewBuffer>,d0
     1e0:	23c0 001a db7c 	move.l d0,1adb7c <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     1e6:	2017           	move.l (sp),d0
     1e8:	23c0 001a db80 	move.l d0,1adb80 <ViewBuffer>
}
     1ee:	4fef 000c      	lea 12(sp),sp
     1f2:	4e75           	rts

000001f4 <SwapCl>:

void SwapCl() {
     1f4:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     1f6:	2039 001a db84 	move.l 1adb84 <DrawCopper>,d0
     1fc:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     1fe:	2039 001a db88 	move.l 1adb88 <ViewCopper>,d0
     204:	23c0 001a db84 	move.l d0,1adb84 <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     20a:	2017           	move.l (sp),d0
     20c:	23c0 001a db88 	move.l d0,1adb88 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     212:	2039 001a db88 	move.l 1adb88 <ViewCopper>,d0
     218:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
     21e:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     222:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
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
     2fa:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
     300:	317c 0020 009c 	move.w #32,156(a0)
     306:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
     30c:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	//frameCounter++;
  //Zoom_VblankHandler();
}
     312:	205f           	movea.l (sp)+,a0
     314:	4e73           	rte

00000316 <RunDemo>:

void RunDemo() {
//               5432109876543210
  hw->dmacon = 0b1000011111111111;
     316:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
     31c:	317c 87ff 0096 	move.w #-30721,150(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req*/
  //PrepareDisplay();
  //CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
  
	while(1) {
		WaitVbl();
     322:	4eba 0260      	jsr 584 <WaitVbl>(pc)
    RunFrame();
     326:	4eba 0028      	jsr 350 <RunFrame>(pc)
     32a:	60f6           	bra.s 322 <RunDemo+0xc>

0000032c <SetInterrupt>:

	//SetInterruptHandler((APTR)interruptHandler);
}

void SetInterrupt() {
  SetInterruptHandler((APTR)interruptHandler);
     32c:	487a ffca      	pea 2f8 <interruptHandler.lto_priv.0>(pc)
     330:	4eba 0236      	jsr 568 <SetInterruptHandler>(pc)
     334:	588f           	addq.l #4,sp
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     336:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
     33c:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     342:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
     348:	317c 0020 009c 	move.w #32,156(a0)
}
     34e:	4e75           	rts

00000350 <RunFrame>:
  else
    Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer, (UWORD *)DrawBuffer, Zoom_LevelOfZoom, 5 );

  Zoom_Blit4ZoomFinished = 1;
  while( tmp == Zoom_LevelOfZoom) { }*/
     350:	4e75           	rts

00000352 <Zoom_InsertShift>:
           0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
           0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000,
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

void Zoom_InsertShift( UWORD *copperlist, UWORD *values4shift) {
     352:	4fef fff4      	lea -12(sp),sp
     356:	2f02           	move.l d2,-(sp)
  for(int i = 0; i<6;i++) {
     358:	42af 000c      	clr.l 12(sp)
     35c:	601e           	bra.s 37c <Zoom_InsertShift+0x2a>
    *copperlist = *values4shift++;
     35e:	202f 0018      	move.l 24(sp),d0
     362:	2200           	move.l d0,d1
     364:	5481           	addq.l #2,d1
     366:	2f41 0018      	move.l d1,24(sp)
     36a:	2040           	movea.l d0,a0
     36c:	3010           	move.w (a0),d0
     36e:	206f 0014      	movea.l 20(sp),a0
     372:	3080           	move.w d0,(a0)
    copperlist += 2;
     374:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<6;i++) {
     378:	52af 000c      	addq.l #1,12(sp)
     37c:	7005           	moveq #5,d0
     37e:	b0af 000c      	cmp.l 12(sp),d0
     382:	6cda           	bge.s 35e <Zoom_InsertShift+0xc>
  }
  copperlist--;
     384:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     388:	222f 0018      	move.l 24(sp),d1
     38c:	2401           	move.l d1,d2
     38e:	5482           	addq.l #2,d2
     390:	2f42 0018      	move.l d2,24(sp)
     394:	202f 0014      	move.l 20(sp),d0
     398:	2400           	move.l d0,d2
     39a:	5482           	addq.l #2,d2
     39c:	2f42 0014      	move.l d2,20(sp)
     3a0:	2041           	movea.l d1,a0
     3a2:	3210           	move.w (a0),d1
     3a4:	2040           	movea.l d0,a0
     3a6:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     3a8:	202f 0018      	move.l 24(sp),d0
     3ac:	2200           	move.l d0,d1
     3ae:	5481           	addq.l #2,d1
     3b0:	2f41 0018      	move.l d1,24(sp)
     3b4:	2040           	movea.l d0,a0
     3b6:	3010           	move.w (a0),d0
     3b8:	206f 0014      	movea.l 20(sp),a0
     3bc:	3080           	move.w d0,(a0)
  copperlist += 2;
     3be:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     3c2:	42af 0008      	clr.l 8(sp)
     3c6:	601e           	bra.s 3e6 <Zoom_InsertShift+0x94>
    *copperlist = *values4shift++;
     3c8:	202f 0018      	move.l 24(sp),d0
     3cc:	2200           	move.l d0,d1
     3ce:	5481           	addq.l #2,d1
     3d0:	2f41 0018      	move.l d1,24(sp)
     3d4:	2040           	movea.l d0,a0
     3d6:	3010           	move.w (a0),d0
     3d8:	206f 0014      	movea.l 20(sp),a0
     3dc:	3080           	move.w d0,(a0)
    copperlist += 2;
     3de:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     3e2:	52af 0008      	addq.l #1,8(sp)
     3e6:	7009           	moveq #9,d0
     3e8:	b0af 0008      	cmp.l 8(sp),d0
     3ec:	6cda           	bge.s 3c8 <Zoom_InsertShift+0x76>
  }
  copperlist--;
     3ee:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     3f2:	222f 0018      	move.l 24(sp),d1
     3f6:	2401           	move.l d1,d2
     3f8:	5482           	addq.l #2,d2
     3fa:	2f42 0018      	move.l d2,24(sp)
     3fe:	202f 0014      	move.l 20(sp),d0
     402:	2400           	move.l d0,d2
     404:	5482           	addq.l #2,d2
     406:	2f42 0014      	move.l d2,20(sp)
     40a:	2041           	movea.l d1,a0
     40c:	3210           	move.w (a0),d1
     40e:	2040           	movea.l d0,a0
     410:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     412:	202f 0018      	move.l 24(sp),d0
     416:	2200           	move.l d0,d1
     418:	5481           	addq.l #2,d1
     41a:	2f41 0018      	move.l d1,24(sp)
     41e:	2040           	movea.l d0,a0
     420:	3010           	move.w (a0),d0
     422:	206f 0014      	movea.l 20(sp),a0
     426:	3080           	move.w d0,(a0)
  copperlist += 2;
     428:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     42c:	42af 0004      	clr.l 4(sp)
     430:	601e           	bra.s 450 <Zoom_InsertShift+0xfe>
    *copperlist = *values4shift++;
     432:	202f 0018      	move.l 24(sp),d0
     436:	2200           	move.l d0,d1
     438:	5481           	addq.l #2,d1
     43a:	2f41 0018      	move.l d1,24(sp)
     43e:	2040           	movea.l d0,a0
     440:	3010           	move.w (a0),d0
     442:	206f 0014      	movea.l 20(sp),a0
     446:	3080           	move.w d0,(a0)
    copperlist += 2;
     448:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     44c:	52af 0004      	addq.l #1,4(sp)
     450:	7006           	moveq #6,d0
     452:	b0af 0004      	cmp.l 4(sp),d0
     456:	6cda           	bge.s 432 <Zoom_InsertShift+0xe0>
  }
}
     458:	241f           	move.l (sp)+,d2
     45a:	4fef 000c      	lea 12(sp),sp
     45e:	4e75           	rts

00000460 <Zoom_Shrink102>:

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {
     460:	518f           	subq.l #8,sp
     462:	202f 000c      	move.l 12(sp),d0
     466:	3000           	move.w d0,d0
     468:	3f40 0002      	move.w d0,2(sp)

  
  UWORD *values4shift = Values4Shift+levelofshrink*108;
     46c:	7200           	moveq #0,d1
     46e:	322f 0002      	move.w 2(sp),d1
     472:	2001           	move.l d1,d0
     474:	d080           	add.l d0,d0
     476:	d081           	add.l d1,d0
     478:	2200           	move.l d0,d1
     47a:	e789           	lsl.l #3,d1
     47c:	d081           	add.l d1,d0
     47e:	e788           	lsl.l #3,d0
     480:	2200           	move.l d0,d1
     482:	0681 0000 ab00 	addi.l #43776,d1
     488:	2f41 0004      	move.l d1,4(sp)
  //copperlist+=3+73*2;
  Zoom_InsertShift( copperlist+3+73*2, values4shift);
     48c:	202f 0010      	move.l 16(sp),d0
     490:	0680 0000 012a 	addi.l #298,d0
     496:	2f2f 0004      	move.l 4(sp),-(sp)
     49a:	2f00           	move.l d0,-(sp)
     49c:	4eba feb4      	jsr 352 <Zoom_InsertShift>(pc)
     4a0:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+63+73*2, values4shift+27);
     4a2:	7236           	moveq #54,d1
     4a4:	d2af 0004      	add.l 4(sp),d1
     4a8:	202f 0010      	move.l 16(sp),d0
     4ac:	0680 0000 01a2 	addi.l #418,d0
     4b2:	2f01           	move.l d1,-(sp)
     4b4:	2f00           	move.l d0,-(sp)
     4b6:	4eba fe9a      	jsr 352 <Zoom_InsertShift>(pc)
     4ba:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+119+73*2, values4shift+54);
     4bc:	726c           	moveq #108,d1
     4be:	d2af 0004      	add.l 4(sp),d1
     4c2:	202f 0010      	move.l 16(sp),d0
     4c6:	0680 0000 0212 	addi.l #530,d0
     4cc:	2f01           	move.l d1,-(sp)
     4ce:	2f00           	move.l d0,-(sp)
     4d0:	4eba fe80      	jsr 352 <Zoom_InsertShift>(pc)
     4d4:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+175+73*2, values4shift+81);
     4d6:	222f 0004      	move.l 4(sp),d1
     4da:	0681 0000 00a2 	addi.l #162,d1
     4e0:	202f 0010      	move.l 16(sp),d0
     4e4:	0680 0000 0282 	addi.l #642,d0
     4ea:	2f01           	move.l d1,-(sp)
     4ec:	2f00           	move.l d0,-(sp)
     4ee:	4eba fe62      	jsr 352 <Zoom_InsertShift>(pc)
     4f2:	508f           	addq.l #8,sp
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }*/
  
}
     4f4:	508f           	addq.l #8,sp
     4f6:	4e75           	rts

000004f8 <GetVBR>:
volatile static APTR VBR=0;
static APTR SystemIrq;
 
struct View *ActiView;

static APTR GetVBR(void) {
     4f8:	4fef ffec      	lea -20(sp),sp
     4fc:	2f0e           	move.l a6,-(sp)
     4fe:	2f07           	move.l d7,-(sp)
	APTR vbr = 0;
     500:	42af 0018      	clr.l 24(sp)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     504:	3f7c 4e7a 000a 	move.w #20090,10(sp)
     50a:	3f7c 0801 000c 	move.w #2049,12(sp)
     510:	3f7c 4e73 000e 	move.w #20083,14(sp)

	if (SysBase->AttnFlags & AFF_68010) 
     516:	2079 001a db90 	movea.l 1adb90 <SysBase>,a0
     51c:	3028 0128      	move.w 296(a0),d0
     520:	3000           	move.w d0,d0
     522:	0280 0000 ffff 	andi.l #65535,d0
     528:	7201           	moveq #1,d1
     52a:	c081           	and.l d1,d0
     52c:	672c           	beq.s 55a <GetVBR+0x62>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     52e:	41ef 001c      	lea 28(sp),a0
     532:	41e8 ffee      	lea -18(a0),a0
     536:	2f48 0014      	move.l a0,20(sp)
     53a:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
     540:	2c40           	movea.l d0,a6
     542:	2e2f 0014      	move.l 20(sp),d7
     546:	cf8d           	exg d7,a5
     548:	4eae ffe2      	jsr -30(a6)
     54c:	cf8d           	exg d7,a5
     54e:	2f40 0010      	move.l d0,16(sp)
     552:	202f 0010      	move.l 16(sp),d0
     556:	2f40 0018      	move.l d0,24(sp)

	return vbr;
     55a:	202f 0018      	move.l 24(sp),d0
}
     55e:	2e1f           	move.l (sp)+,d7
     560:	2c5f           	movea.l (sp)+,a6
     562:	4fef 0014      	lea 20(sp),sp
     566:	4e75           	rts

00000568 <SetInterruptHandler>:

void SetInterruptHandler(APTR interrupt) {
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     568:	2079 001a dba6 	movea.l 1adba6 <VBR>,a0
     56e:	41e8 006c      	lea 108(a0),a0
     572:	20af 0004      	move.l 4(sp),(a0)
}
     576:	4e75           	rts

00000578 <GetInterruptHandler>:

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     578:	2079 001a dba6 	movea.l 1adba6 <VBR>,a0
     57e:	2028 006c      	move.l 108(a0),d0
}
     582:	4e75           	rts

00000584 <WaitVbl>:

//vblank begins at vpos 312 hpos 1 and ends at vpos 25 hpos 1
//vsync begins at line 2 hpos 132 and ends at vpos 5 hpos 18 
void WaitVbl() {
     584:	518f           	subq.l #8,sp
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     586:	207c 00df f004 	movea.l #14675972,a0
     58c:	2010           	move.l (a0),d0
     58e:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
     590:	2017           	move.l (sp),d0
     592:	0280 0001 ff00 	andi.l #130816,d0
     598:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
     59a:	2017           	move.l (sp),d0
     59c:	0c80 0001 3700 	cmpi.l #79616,d0
     5a2:	67e2           	beq.s 586 <WaitVbl+0x2>
			break;
	}
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     5a4:	207c 00df f004 	movea.l #14675972,a0
     5aa:	2010           	move.l (a0),d0
     5ac:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
     5b0:	202f 0004      	move.l 4(sp),d0
     5b4:	0280 0001 ff00 	andi.l #130816,d0
     5ba:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
     5be:	202f 0004      	move.l 4(sp),d0
     5c2:	0c80 0001 3700 	cmpi.l #79616,d0
     5c8:	66da           	bne.s 5a4 <WaitVbl+0x20>
			break;
	}
}
     5ca:	508f           	addq.l #8,sp
     5cc:	4e75           	rts

000005ce <TakeSystem>:
	UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
}*/

void TakeSystem() {
     5ce:	518f           	subq.l #8,sp
     5d0:	2f0e           	move.l a6,-(sp)
	ActiView=GfxBase->ActiView; //store current view
     5d2:	2079 001a db9c 	movea.l 1adb9c <GfxBase>,a0
     5d8:	2028 0022      	move.l 34(a0),d0
     5dc:	23c0 001a dbae 	move.l d0,1adbae <ActiView>
	OwnBlitter();
     5e2:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
     5e8:	2c40           	movea.l d0,a6
     5ea:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     5ee:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
     5f4:	2c40           	movea.l d0,a6
     5f6:	4eae ff1c      	jsr -228(a6)
	//Disable();
	Forbid();
     5fa:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
     600:	2c40           	movea.l d0,a6
     602:	4eae ff7c      	jsr -132(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=custom->adkconr;
     606:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     60c:	3028 0010      	move.w 16(a0),d0
     610:	33c0 001a dba4 	move.w d0,1adba4 <SystemADKCON>
	SystemInts=custom->intenar;
     616:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     61c:	3028 001c      	move.w 28(a0),d0
     620:	33c0 001a dba0 	move.w d0,1adba0 <SystemInts>
	SystemDMA=custom->dmaconr;
     626:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     62c:	3028 0002      	move.w 2(a0),d0
     630:	33c0 001a dba2 	move.w d0,1adba2 <SystemDMA>
	custom->intena=0x7fff;//disable all interrupts
     636:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     63c:	317c 7fff 009a 	move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     642:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     648:	317c 7fff 009c 	move.w #32767,156(a0)
	
	WaitVbl();
     64e:	4eba ff34      	jsr 584 <WaitVbl>(pc)
	WaitVbl();
     652:	4eba ff30      	jsr 584 <WaitVbl>(pc)
	custom->dmacon=0x7fff;//Clear all DMA channels
     656:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     65c:	317c 7fff 0096 	move.w #32767,150(a0)

	//set all colors black
	for(int a=0;a<32;a++)
     662:	42af 0008      	clr.l 8(sp)
     666:	601c           	bra.s 684 <TakeSystem+0xb6>
		custom->color[a]=0;
     668:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     66e:	202f 0008      	move.l 8(sp),d0
     672:	0680 0000 00c0 	addi.l #192,d0
     678:	d080           	add.l d0,d0
     67a:	31bc 0000 0800 	move.w #0,(0,a0,d0.l)
	for(int a=0;a<32;a++)
     680:	52af 0008      	addq.l #1,8(sp)
     684:	701f           	moveq #31,d0
     686:	b0af 0008      	cmp.l 8(sp),d0
     68a:	6cdc           	bge.s 668 <TakeSystem+0x9a>

	LoadView(0);
     68c:	42af 0004      	clr.l 4(sp)
     690:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
     696:	2c40           	movea.l d0,a6
     698:	226f 0004      	movea.l 4(sp),a1
     69c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     6a0:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
     6a6:	2c40           	movea.l d0,a6
     6a8:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     6ac:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
     6b2:	2c40           	movea.l d0,a6
     6b4:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     6b8:	4eba feca      	jsr 584 <WaitVbl>(pc)
	WaitVbl();
     6bc:	4eba fec6      	jsr 584 <WaitVbl>(pc)

	VBR=GetVBR();
     6c0:	4eba fe36      	jsr 4f8 <GetVBR>(pc)
     6c4:	23c0 001a dba6 	move.l d0,1adba6 <VBR>
	SystemIrq=GetInterruptHandler(); //store interrupt register
     6ca:	4eba feac      	jsr 578 <GetInterruptHandler>(pc)
     6ce:	23c0 001a dbaa 	move.l d0,1adbaa <SystemIrq>
}
     6d4:	2c5f           	movea.l (sp)+,a6
     6d6:	508f           	addq.l #8,sp
     6d8:	4e75           	rts

000006da <FreeSystem>:

void FreeSystem() { 
     6da:	598f           	subq.l #4,sp
     6dc:	2f0e           	move.l a6,-(sp)
	WaitVbl();
     6de:	4eba fea4      	jsr 584 <WaitVbl>(pc)
	WaitBlt();
     6e2:	4eba f9d0      	jsr b4 <WaitBlt>(pc)
	custom->intena=0x7fff;//disable all interrupts
     6e6:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     6ec:	317c 7fff 009a 	move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     6f2:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     6f8:	317c 7fff 009c 	move.w #32767,156(a0)
	custom->dmacon=0x7fff;//Clear all DMA channels
     6fe:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     704:	317c 7fff 0096 	move.w #32767,150(a0)

	//restore interrupts
	SetInterruptHandler(SystemIrq);
     70a:	2039 001a dbaa 	move.l 1adbaa <SystemIrq>,d0
     710:	2f00           	move.l d0,-(sp)
     712:	4eba fe54      	jsr 568 <SetInterruptHandler>(pc)
     716:	588f           	addq.l #4,sp

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
     718:	2079 001a db9c 	movea.l 1adb9c <GfxBase>,a0
     71e:	2028 0026      	move.l 38(a0),d0
     722:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     728:	2140 0080      	move.l d0,128(a0)
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
     72c:	2079 001a db9c 	movea.l 1adb9c <GfxBase>,a0
     732:	2028 0032      	move.l 50(a0),d0
     736:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     73c:	2140 0084      	move.l d0,132(a0)
	custom->copjmp1=0x7fff; //start coppper
     740:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     746:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
     74c:	3039 001a dba0 	move.w 1adba0 <SystemInts>,d0
     752:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     758:	0040 8000      	ori.w #-32768,d0
     75c:	3140 009a      	move.w d0,154(a0)
	custom->dmacon=SystemDMA|0x8000;
     760:	3039 001a dba2 	move.w 1adba2 <SystemDMA>,d0
     766:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     76c:	0040 8000      	ori.w #-32768,d0
     770:	3140 0096      	move.w d0,150(a0)
	custom->adkcon=SystemADKCON|0x8000;
     774:	3039 001a dba4 	move.w 1adba4 <SystemADKCON>,d0
     77a:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     780:	0040 8000      	ori.w #-32768,d0
     784:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     788:	2f79 001a dbae 	move.l 1adbae <ActiView>,4(sp)
     78e:	0004 
     790:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
     796:	2c40           	movea.l d0,a6
     798:	226f 0004      	movea.l 4(sp),a1
     79c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     7a0:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
     7a6:	2c40           	movea.l d0,a6
     7a8:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     7ac:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
     7b2:	2c40           	movea.l d0,a6
     7b4:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     7b8:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
     7be:	2c40           	movea.l d0,a6
     7c0:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     7c4:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
     7ca:	2c40           	movea.l d0,a6
     7cc:	4eae fe32      	jsr -462(a6)
	//Enable();
	Permit();
     7d0:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
     7d6:	2c40           	movea.l d0,a6
     7d8:	4eae ff76      	jsr -138(a6)
}
     7dc:	2c5f           	movea.l (sp)+,a6
     7de:	588f           	addq.l #4,sp
     7e0:	4e75           	rts

000007e2 <interruptHandler.lto_priv.1>:
	*copListCurrent++=offsetof(struct Custom, color[index]);
	*copListCurrent++=color;
	return copListCurrent;
}

static __attribute__((interrupt)) void interruptHandler() {
     7e2:	2f08           	move.l a0,-(sp)
     7e4:	2f00           	move.l d0,-(sp)
	custom->intreq=(1<<INTB_VERTB); custom->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     7e6:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     7ec:	317c 0020 009c 	move.w #32,156(a0)
     7f2:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     7f8:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	frameCounter++;
     7fe:	3039 001a dbb2 	move.w 1adbb2 <frameCounter>,d0
     804:	5240           	addq.w #1,d0
     806:	33c0 001a dbb2 	move.w d0,1adbb2 <frameCounter>
}
     80c:	201f           	move.l (sp)+,d0
     80e:	205f           	movea.l (sp)+,a0
     810:	4e73           	rte

00000812 <main>:
	*copListEnd++ = offsetof(struct Custom, diwstop);
	*copListEnd++ = (xstop-256)+((ystop-256)<<8);
	return copListEnd;
}

int main() {
     812:	4fef ffbc      	lea -68(sp),sp
     816:	48e7 3002      	movem.l d2-d3/a6,-(sp)
	ULONG tmp = 4;
     81a:	7004           	moveq #4,d0
     81c:	2f40 004c      	move.l d0,76(sp)
    SysBase = *((struct ExecBase**)tmp);
     820:	206f 004c      	movea.l 76(sp),a0
     824:	2010           	move.l (a0),d0
     826:	23c0 001a db90 	move.l d0,1adb90 <SysBase>
	hw = (struct Custom*)0xdff000;
     82c:	23fc 00df f000 	move.l #14675968,1adb8c <hw>
     832:	001a db8c 

	SysBase = *((struct ExecBase**)4UL);
     836:	307c 0004      	movea.w #4,a0
     83a:	2010           	move.l (a0),d0
     83c:	23c0 001a db90 	move.l d0,1adb90 <SysBase>
	custom = (struct Custom*)0xdff000;
     842:	23fc 00df f000 	move.l #14675968,1adb94 <custom>
     848:	001a db94 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
     84c:	2f7c 0000 7792 	move.l #30610,72(sp)
     852:	0048 
     854:	42af 0044      	clr.l 68(sp)
     858:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
     85e:	2c40           	movea.l d0,a6
     860:	226f 0048      	movea.l 72(sp),a1
     864:	202f 0044      	move.l 68(sp),d0
     868:	4eae fdd8      	jsr -552(a6)
     86c:	2f40 0040      	move.l d0,64(sp)
     870:	202f 0040      	move.l 64(sp),d0
     874:	23c0 001a db9c 	move.l d0,1adb9c <GfxBase>
	if (!GfxBase)
     87a:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
     880:	6614           	bne.s 896 <main+0x84>
		Exit(0);
     882:	42af 003c      	clr.l 60(sp)
     886:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     88c:	2c40           	movea.l d0,a6
     88e:	222f 003c      	move.l 60(sp),d1
     892:	4eae ff70      	jsr -144(a6)

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     896:	2f7c 0000 77a3 	move.l #30627,56(sp)
     89c:	0038 
     89e:	42af 0034      	clr.l 52(sp)
     8a2:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
     8a8:	2c40           	movea.l d0,a6
     8aa:	226f 0038      	movea.l 56(sp),a1
     8ae:	202f 0034      	move.l 52(sp),d0
     8b2:	4eae fdd8      	jsr -552(a6)
     8b6:	2f40 0030      	move.l d0,48(sp)
     8ba:	202f 0030      	move.l 48(sp),d0
     8be:	23c0 001a db98 	move.l d0,1adb98 <DOSBase>
	if (!DOSBase)
     8c4:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     8ca:	6614           	bne.s 8e0 <main+0xce>
		Exit(0);
     8cc:	42af 002c      	clr.l 44(sp)
     8d0:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     8d6:	2c40           	movea.l d0,a6
     8d8:	222f 002c      	move.l 44(sp),d1
     8dc:	4eae ff70      	jsr -144(a6)

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
     8e0:	4879 0000 77af 	pea 77af <c2p1x1_8_c5_gen_pixels+0x21>
     8e6:	4eba 679c      	jsr 7084 <KPrintF>(pc)
     8ea:	588f           	addq.l #4,sp
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
     8ec:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     8f2:	2c40           	movea.l d0,a6
     8f4:	4eae ffc4      	jsr -60(a6)
     8f8:	2f40 0028      	move.l d0,40(sp)
     8fc:	202f 0028      	move.l 40(sp),d0
     900:	2f40 0024      	move.l d0,36(sp)
     904:	2f7c 0000 77cb 	move.l #30667,32(sp)
     90a:	0020 
     90c:	700f           	moveq #15,d0
     90e:	2f40 001c      	move.l d0,28(sp)
     912:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     918:	2c40           	movea.l d0,a6
     91a:	222f 0024      	move.l 36(sp),d1
     91e:	242f 0020      	move.l 32(sp),d2
     922:	262f 001c      	move.l 28(sp),d3
     926:	4eae ffd0      	jsr -48(a6)
     92a:	2f40 0018      	move.l d0,24(sp)
	Delay(50);
     92e:	7032           	moveq #50,d0
     930:	2f40 0014      	move.l d0,20(sp)
     934:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     93a:	2c40           	movea.l d0,a6
     93c:	222f 0014      	move.l 20(sp),d1
     940:	4eae ff3a      	jsr -198(a6)

	warpmode(1);
     944:	4878 0001      	pea 1 <_start+0x1>
     948:	4eba 67a4      	jsr 70ee <warpmode>(pc)
     94c:	588f           	addq.l #4,sp
	// TODO: precalc stuff here
	warpmode(0);
     94e:	42a7           	clr.l -(sp)
     950:	4eba 679c      	jsr 70ee <warpmode>(pc)
     954:	588f           	addq.l #4,sp

	//TakeSystem();
	WaitVbl();
     956:	4eba fc2c      	jsr 584 <WaitVbl>(pc)
  
	c2p();
     95a:	4eba 0618      	jsr f74 <c2p>(pc)
  	Zoom_InitRunReverse();
     95e:	4eba 0aea      	jsr 144a <Zoom_InitRunReverse>(pc)
	TakeSystem();
     962:	4eba fc6a      	jsr 5ce <TakeSystem>(pc)
  	//RunTests();	//warpmode(1);
	// TODO: precalc stuff here
	//warpmode(0);

	WaitVbl();
     966:	4eba fc1c      	jsr 584 <WaitVbl>(pc)

	// DEMO

	RunDemo();
     96a:	4eba f9aa      	jsr 316 <RunDemo>(pc)

	// DEMO
	SetInterruptHandler((APTR)interruptHandler);
     96e:	487a fe72      	pea 7e2 <interruptHandler.lto_priv.1>(pc)
     972:	4eba fbf4      	jsr 568 <SetInterruptHandler>(pc)
     976:	588f           	addq.l #4,sp
	custom->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     978:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     97e:	317c c020 009a 	move.w #-16352,154(a0)
	custom->intreq=1<<INTB_VERTB;//reset vbl req
     984:	2079 001a db94 	movea.l 1adb94 <custom>,a0
     98a:	317c 0020 009c 	move.w #32,156(a0)

	// END
	FreeSystem();
     990:	4eba fd48      	jsr 6da <FreeSystem>(pc)

	CloseLibrary((struct Library*)DOSBase);
     994:	2f79 001a db98 	move.l 1adb98 <DOSBase>,16(sp)
     99a:	0010 
     99c:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
     9a2:	2c40           	movea.l d0,a6
     9a4:	226f 0010      	movea.l 16(sp),a1
     9a8:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     9ac:	2f79 001a db9c 	move.l 1adb9c <GfxBase>,12(sp)
     9b2:	000c 
     9b4:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
     9ba:	2c40           	movea.l d0,a6
     9bc:	226f 000c      	movea.l 12(sp),a1
     9c0:	4eae fe62      	jsr -414(a6)
     9c4:	7000           	moveq #0,d0
}
     9c6:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     9ca:	4fef 0044      	lea 68(sp),sp
     9ce:	4e75           	rts

000009d0 <SwScrollerTest>:

char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
     9d0:	4fef ff98      	lea -104(sp),sp
     9d4:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  PrepareDisplaySW();
     9d8:	4eba 0218      	jsr bf2 <PrepareDisplaySW>(pc)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     9dc:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
     9e2:	4878 0010      	pea 10 <_start+0x10>
     9e6:	4879 0000 a868 	pea a868 <ClsSprites>
     9ec:	42a7           	clr.l -(sp)
     9ee:	2f00           	move.l d0,-(sp)
     9f0:	4eba 1fb4      	jsr 29a6 <TestCopperlistBatch>(pc)
     9f4:	4fef 0010      	lea 16(sp),sp
     9f8:	4a80           	tst.l d0
     9fa:	6642           	bne.s a3e <SwScrollerTest+0x6e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     9fc:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     a02:	2c40           	movea.l d0,a6
     a04:	4eae ffc4      	jsr -60(a6)
     a08:	2f40 0070      	move.l d0,112(sp)
     a0c:	202f 0070      	move.l 112(sp),d0
     a10:	2f40 006c      	move.l d0,108(sp)
     a14:	2f7c 0000 77ec 	move.l #30700,104(sp)
     a1a:	0068 
     a1c:	702c           	moveq #44,d0
     a1e:	2f40 0064      	move.l d0,100(sp)
     a22:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     a28:	2c40           	movea.l d0,a6
     a2a:	222f 006c      	move.l 108(sp),d1
     a2e:	242f 0068      	move.l 104(sp),d2
     a32:	262f 0064      	move.l 100(sp),d3
     a36:	4eae ffd0      	jsr -48(a6)
     a3a:	2f40 0060      	move.l d0,96(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     a3e:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
     a44:	4878 000c      	pea c <_start+0xc>
     a48:	4879 0000 a8a8 	pea a8a8 <ClScreen>
     a4e:	4878 0010      	pea 10 <_start+0x10>
     a52:	2f00           	move.l d0,-(sp)
     a54:	4eba 1f50      	jsr 29a6 <TestCopperlistBatch>(pc)
     a58:	4fef 0010      	lea 16(sp),sp
     a5c:	4a80           	tst.l d0
     a5e:	6642           	bne.s aa2 <SwScrollerTest+0xd2>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     a60:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     a66:	2c40           	movea.l d0,a6
     a68:	4eae ffc4      	jsr -60(a6)
     a6c:	2f40 005c      	move.l d0,92(sp)
     a70:	202f 005c      	move.l 92(sp),d0
     a74:	2f40 0058      	move.l d0,88(sp)
     a78:	2f7c 0000 7822 	move.l #30754,84(sp)
     a7e:	0054 
     a80:	7036           	moveq #54,d0
     a82:	2f40 0050      	move.l d0,80(sp)
     a86:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     a8c:	2c40           	movea.l d0,a6
     a8e:	222f 0058      	move.l 88(sp),d1
     a92:	242f 0054      	move.l 84(sp),d2
     a96:	262f 0050      	move.l 80(sp),d3
     a9a:	4eae ffd0      	jsr -48(a6)
     a9e:	2f40 004c      	move.l d0,76(sp)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     aa2:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
     aa8:	4878 0002      	pea 2 <_start+0x2>
     aac:	4879 0000 a7e8 	pea a7e8 <ClColor>
     ab2:	4878 001e      	pea 1e <_start+0x1e>
     ab6:	2f00           	move.l d0,-(sp)
     ab8:	4eba 1eec      	jsr 29a6 <TestCopperlistBatch>(pc)
     abc:	4fef 0010      	lea 16(sp),sp
     ac0:	4a80           	tst.l d0
     ac2:	6642           	bne.s b06 <SwScrollerTest+0x136>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     ac4:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     aca:	2c40           	movea.l d0,a6
     acc:	4eae ffc4      	jsr -60(a6)
     ad0:	2f40 0048      	move.l d0,72(sp)
     ad4:	202f 0048      	move.l 72(sp),d0
     ad8:	2f40 0044      	move.l d0,68(sp)
     adc:	2f7c 0000 7859 	move.l #30809,64(sp)
     ae2:	0040 
     ae4:	7021           	moveq #33,d0
     ae6:	2f40 003c      	move.l d0,60(sp)
     aea:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     af0:	2c40           	movea.l d0,a6
     af2:	222f 0044      	move.l 68(sp),d1
     af6:	242f 0040      	move.l 64(sp),d2
     afa:	262f 003c      	move.l 60(sp),d3
     afe:	4eae ffd0      	jsr -48(a6)
     b02:	2f40 0038      	move.l d0,56(sp)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     b06:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
     b0c:	4878 fffe      	pea fffffffe <_end+0xffe5241a>
     b10:	4878 0020      	pea 20 <_start+0x20>
     b14:	2f00           	move.l d0,-(sp)
     b16:	4eba 1ecc      	jsr 29e4 <TestCopperlistPos>(pc)
     b1a:	4fef 000c      	lea 12(sp),sp
     b1e:	4a80           	tst.l d0
     b20:	6642           	bne.s b64 <SwScrollerTest+0x194>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     b22:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     b28:	2c40           	movea.l d0,a6
     b2a:	4eae ffc4      	jsr -60(a6)
     b2e:	2f40 0034      	move.l d0,52(sp)
     b32:	202f 0034      	move.l 52(sp),d0
     b36:	2f40 0030      	move.l d0,48(sp)
     b3a:	2f7c 0000 787b 	move.l #30843,44(sp)
     b40:	002c 
     b42:	7022           	moveq #34,d0
     b44:	2f40 0028      	move.l d0,40(sp)
     b48:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     b4e:	2c40           	movea.l d0,a6
     b50:	222f 0030      	move.l 48(sp),d1
     b54:	242f 002c      	move.l 44(sp),d2
     b58:	262f 0028      	move.l 40(sp),d3
     b5c:	4eae ffd0      	jsr -48(a6)
     b60:	2f40 0024      	move.l d0,36(sp)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     b64:	2239 0000 ba24 	move.l ba24 <sw_text>,d1
     b6a:	2039 001a db7c 	move.l 1adb7c <DrawBuffer>,d0
     b70:	2f01           	move.l d1,-(sp)
     b72:	2f00           	move.l d0,-(sp)
     b74:	4879 0000 ba28 	pea ba28 <sw_testfont>
     b7a:	4eba 0380      	jsr efc <WriteFont>(pc)
     b7e:	4fef 000c      	lea 12(sp),sp

  UWORD *tstpointer = (UWORD *)DrawBuffer;
     b82:	2f79 001a db7c 	move.l 1adb7c <DrawBuffer>,32(sp)
     b88:	0020 
  if( *tstpointer != 0xff00)
     b8a:	206f 0020      	movea.l 32(sp),a0
     b8e:	3010           	move.w (a0),d0
     b90:	0c40 ff00      	cmpi.w #-256,d0
     b94:	6742           	beq.s bd8 <SwScrollerTest+0x208>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     b96:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     b9c:	2c40           	movea.l d0,a6
     b9e:	4eae ffc4      	jsr -60(a6)
     ba2:	2f40 001c      	move.l d0,28(sp)
     ba6:	202f 001c      	move.l 28(sp),d0
     baa:	2f40 0018      	move.l d0,24(sp)
     bae:	2f7c 0000 789e 	move.l #30878,20(sp)
     bb4:	0014 
     bb6:	7031           	moveq #49,d0
     bb8:	2f40 0010      	move.l d0,16(sp)
     bbc:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     bc2:	2c40           	movea.l d0,a6
     bc4:	222f 0018      	move.l 24(sp),d1
     bc8:	242f 0014      	move.l 20(sp),d2
     bcc:	262f 0010      	move.l 16(sp),d3
     bd0:	4eae ffd0      	jsr -48(a6)
     bd4:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
     bd8:	2f3c 0000 c800 	move.l #51200,-(sp)
     bde:	4878 0084      	pea 84 <_start+0x84>
     be2:	4eba f4fc      	jsr e0 <FreeDisplay>(pc)
     be6:	508f           	addq.l #8,sp
     be8:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     bec:	4fef 0068      	lea 104(sp),sp
     bf0:	4e75           	rts

00000bf2 <PrepareDisplaySW>:
 #include "swscroller.h"
 #include "utils.h"
 
 INCBIN(swfont, "raw/ruby16_8_1.raw");

 int PrepareDisplaySW() {
     bf2:	4fef ffb8      	lea -72(sp),sp
     bf6:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildSW();
     bfa:	4eba 017e      	jsr d7a <ClbuildSW>(pc)
     bfe:	23c0 001a db74 	move.l d0,1adb74 <Copperlist1>
  Copperlist2 = ClbuildSW();
     c04:	4eba 0174      	jsr d7a <ClbuildSW>(pc)
     c08:	23c0 001a db78 	move.l d0,1adb78 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     c0e:	2f7c 0000 c800 	move.l #51200,80(sp)
     c14:	0050 
     c16:	7002           	moveq #2,d0
     c18:	2f40 004c      	move.l d0,76(sp)
     c1c:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
     c22:	2c40           	movea.l d0,a6
     c24:	202f 0050      	move.l 80(sp),d0
     c28:	222f 004c      	move.l 76(sp),d1
     c2c:	4eae ff3a      	jsr -198(a6)
     c30:	2f40 0048      	move.l d0,72(sp)
     c34:	202f 0048      	move.l 72(sp),d0
     c38:	23c0 001a db6c 	move.l d0,1adb6c <Bitplane1>
  if(Bitplane1 == 0) {
     c3e:	2039 001a db6c 	move.l 1adb6c <Bitplane1>,d0
     c44:	6658           	bne.s c9e <PrepareDisplaySW+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     c46:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     c4c:	2c40           	movea.l d0,a6
     c4e:	4eae ffc4      	jsr -60(a6)
     c52:	2f40 0044      	move.l d0,68(sp)
     c56:	202f 0044      	move.l 68(sp),d0
     c5a:	2f40 0040      	move.l d0,64(sp)
     c5e:	2f7c 0000 7e81 	move.l #32385,60(sp)
     c64:	003c 
     c66:	7026           	moveq #38,d0
     c68:	2f40 0038      	move.l d0,56(sp)
     c6c:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     c72:	2c40           	movea.l d0,a6
     c74:	222f 0040      	move.l 64(sp),d1
     c78:	242f 003c      	move.l 60(sp),d2
     c7c:	262f 0038      	move.l 56(sp),d3
     c80:	4eae ffd0      	jsr -48(a6)
     c84:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
     c88:	7001           	moveq #1,d0
     c8a:	2f40 0030      	move.l d0,48(sp)
     c8e:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     c94:	2c40           	movea.l d0,a6
     c96:	222f 0030      	move.l 48(sp),d1
     c9a:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
     c9e:	2039 001a db6c 	move.l 1adb6c <Bitplane1>,d0
     ca4:	23c0 001a db7c 	move.l d0,1adb7c <DrawBuffer>
  DrawCopper = Copperlist1;
     caa:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
     cb0:	23c0 001a db84 	move.l d0,1adb84 <DrawCopper>
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     cb6:	2f7c 0000 c800 	move.l #51200,44(sp)
     cbc:	002c 
     cbe:	7002           	moveq #2,d0
     cc0:	2f40 0028      	move.l d0,40(sp)
     cc4:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
     cca:	2c40           	movea.l d0,a6
     ccc:	202f 002c      	move.l 44(sp),d0
     cd0:	222f 0028      	move.l 40(sp),d1
     cd4:	4eae ff3a      	jsr -198(a6)
     cd8:	2f40 0024      	move.l d0,36(sp)
     cdc:	202f 0024      	move.l 36(sp),d0
     ce0:	23c0 001a db70 	move.l d0,1adb70 <Bitplane2>
  if(Bitplane2 == 0) {
     ce6:	2039 001a db70 	move.l 1adb70 <Bitplane2>,d0
     cec:	6658           	bne.s d46 <PrepareDisplaySW+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     cee:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     cf4:	2c40           	movea.l d0,a6
     cf6:	4eae ffc4      	jsr -60(a6)
     cfa:	2f40 0020      	move.l d0,32(sp)
     cfe:	202f 0020      	move.l 32(sp),d0
     d02:	2f40 001c      	move.l d0,28(sp)
     d06:	2f7c 0000 7ea8 	move.l #32424,24(sp)
     d0c:	0018 
     d0e:	7026           	moveq #38,d0
     d10:	2f40 0014      	move.l d0,20(sp)
     d14:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     d1a:	2c40           	movea.l d0,a6
     d1c:	222f 001c      	move.l 28(sp),d1
     d20:	242f 0018      	move.l 24(sp),d2
     d24:	262f 0014      	move.l 20(sp),d3
     d28:	4eae ffd0      	jsr -48(a6)
     d2c:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     d30:	7001           	moveq #1,d0
     d32:	2f40 000c      	move.l d0,12(sp)
     d36:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     d3c:	2c40           	movea.l d0,a6
     d3e:	222f 000c      	move.l 12(sp),d1
     d42:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
     d46:	2039 001a db70 	move.l 1adb70 <Bitplane2>,d0
     d4c:	23c0 001a db80 	move.l d0,1adb80 <ViewBuffer>
  ViewCopper = Copperlist2;
     d52:	2039 001a db78 	move.l 1adb78 <Copperlist2>,d0
     d58:	23c0 001a db88 	move.l d0,1adb88 <ViewCopper>
  SwapCl();
     d5e:	4eba f494      	jsr 1f4 <SwapCl>(pc)
  SetBplPointers();
     d62:	4eba f432      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
     d66:	4eba f48c      	jsr 1f4 <SwapCl>(pc)
  SetBplPointers();
     d6a:	4eba f42a      	jsr 196 <SetBplPointers>(pc)
  return 0;
     d6e:	7000           	moveq #0,d0
}
     d70:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     d74:	4fef 0048      	lea 72(sp),sp
     d78:	4e75           	rts

00000d7a <ClbuildSW>:

ULONG * ClbuildSW() {
     d7a:	4fef ffc4      	lea -60(sp),sp
     d7e:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
     d82:	2f7c 0000 0084 	move.l #132,48(sp)
     d88:	0030 
     d8a:	7002           	moveq #2,d0
     d8c:	2f40 002c      	move.l d0,44(sp)
     d90:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
     d96:	2c40           	movea.l d0,a6
     d98:	202f 0030      	move.l 48(sp),d0
     d9c:	222f 002c      	move.l 44(sp),d1
     da0:	4eae ff3a      	jsr -198(a6)
     da4:	2f40 0028      	move.l d0,40(sp)
     da8:	202f 0028      	move.l 40(sp),d0
     dac:	2f40 0024      	move.l d0,36(sp)
  
  if( retval == 0) {
     db0:	6658           	bne.s e0a <ClbuildSW+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     db2:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     db8:	2c40           	movea.l d0,a6
     dba:	4eae ffc4      	jsr -60(a6)
     dbe:	2f40 0020      	move.l d0,32(sp)
     dc2:	202f 0020      	move.l 32(sp),d0
     dc6:	2f40 001c      	move.l d0,28(sp)
     dca:	2f7c 0000 7ecf 	move.l #32463,24(sp)
     dd0:	0018 
     dd2:	7228           	moveq #40,d1
     dd4:	2f41 0014      	move.l d1,20(sp)
     dd8:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     dde:	2c40           	movea.l d0,a6
     de0:	222f 001c      	move.l 28(sp),d1
     de4:	242f 0018      	move.l 24(sp),d2
     de8:	262f 0014      	move.l 20(sp),d3
     dec:	4eae ffd0      	jsr -48(a6)
     df0:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     df4:	7401           	moveq #1,d2
     df6:	2f42 000c      	move.l d2,12(sp)
     dfa:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
     e00:	2c40           	movea.l d0,a6
     e02:	222f 000c      	move.l 12(sp),d1
     e06:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
     e0a:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
     e10:	2f7c 0000 a868 	move.l #43112,64(sp)
     e16:	0040 
  for(int i=0; i<16;i++)
     e18:	42af 003c      	clr.l 60(sp)
     e1c:	6024           	bra.s e42 <ClbuildSW+0xc8>
    *cl++ = *clpartinstruction++;
     e1e:	222f 0040      	move.l 64(sp),d1
     e22:	2001           	move.l d1,d0
     e24:	5880           	addq.l #4,d0
     e26:	2f40 0040      	move.l d0,64(sp)
     e2a:	202f 0044      	move.l 68(sp),d0
     e2e:	2400           	move.l d0,d2
     e30:	5882           	addq.l #4,d2
     e32:	2f42 0044      	move.l d2,68(sp)
     e36:	2041           	movea.l d1,a0
     e38:	2210           	move.l (a0),d1
     e3a:	2040           	movea.l d0,a0
     e3c:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
     e3e:	52af 003c      	addq.l #1,60(sp)
     e42:	700f           	moveq #15,d0
     e44:	b0af 003c      	cmp.l 60(sp),d0
     e48:	6cd4           	bge.s e1e <ClbuildSW+0xa4>
  clpartinstruction = ClScreen;
     e4a:	2f7c 0000 a8a8 	move.l #43176,64(sp)
     e50:	0040 
  for(int i=0; i<12;i++)
     e52:	42af 0038      	clr.l 56(sp)
     e56:	6024           	bra.s e7c <ClbuildSW+0x102>
    *cl++ = *clpartinstruction++;
     e58:	222f 0040      	move.l 64(sp),d1
     e5c:	2401           	move.l d1,d2
     e5e:	5882           	addq.l #4,d2
     e60:	2f42 0040      	move.l d2,64(sp)
     e64:	202f 0044      	move.l 68(sp),d0
     e68:	2400           	move.l d0,d2
     e6a:	5882           	addq.l #4,d2
     e6c:	2f42 0044      	move.l d2,68(sp)
     e70:	2041           	movea.l d1,a0
     e72:	2210           	move.l (a0),d1
     e74:	2040           	movea.l d0,a0
     e76:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
     e78:	52af 0038      	addq.l #1,56(sp)
     e7c:	700b           	moveq #11,d0
     e7e:	b0af 0038      	cmp.l 56(sp),d0
     e82:	6cd4           	bge.s e58 <ClbuildSW+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
     e84:	202f 0044      	move.l 68(sp),d0
     e88:	2200           	move.l d0,d1
     e8a:	5881           	addq.l #4,d1
     e8c:	2f41 0044      	move.l d1,68(sp)
     e90:	2040           	movea.l d0,a0
     e92:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
     e98:	202f 0044      	move.l 68(sp),d0
     e9c:	2200           	move.l d0,d1
     e9e:	5881           	addq.l #4,d1
     ea0:	2f41 0044      	move.l d1,68(sp)
     ea4:	2040           	movea.l d0,a0
     ea6:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
     eac:	2f7c 0000 a7e8 	move.l #42984,64(sp)
     eb2:	0040 
  for(int i=0; i<2;i++)
     eb4:	42af 0034      	clr.l 52(sp)
     eb8:	6024           	bra.s ede <ClbuildSW+0x164>
    *cl++ = *clpartinstruction++;
     eba:	222f 0040      	move.l 64(sp),d1
     ebe:	2001           	move.l d1,d0
     ec0:	5880           	addq.l #4,d0
     ec2:	2f40 0040      	move.l d0,64(sp)
     ec6:	202f 0044      	move.l 68(sp),d0
     eca:	2400           	move.l d0,d2
     ecc:	5882           	addq.l #4,d2
     ece:	2f42 0044      	move.l d2,68(sp)
     ed2:	2041           	movea.l d1,a0
     ed4:	2210           	move.l (a0),d1
     ed6:	2040           	movea.l d0,a0
     ed8:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
     eda:	52af 0034      	addq.l #1,52(sp)
     ede:	7001           	moveq #1,d0
     ee0:	b0af 0034      	cmp.l 52(sp),d0
     ee4:	6cd4           	bge.s eba <ClbuildSW+0x140>

  *cl = 0xfffffffe;
     ee6:	206f 0044      	movea.l 68(sp),a0
     eea:	72fe           	moveq #-2,d1
     eec:	2081           	move.l d1,(a0)

  return retval;
     eee:	202f 0024      	move.l 36(sp),d0
}
     ef2:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     ef6:	4fef 003c      	lea 60(sp),sp
     efa:	4e75           	rts

00000efc <WriteFont>:

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
     efc:	4fef fff0      	lea -16(sp),sp
  UWORD *bmpptr = Destination;
     f00:	2f6f 0018 000c 	move.l 24(sp),12(sp)
  UWORD *fntptr = font;
     f06:	2f6f 0014 0008 	move.l 20(sp),8(sp)

  char charpos = *text;
     f0c:	206f 001c      	movea.l 28(sp),a0
     f10:	1f50 0003      	move.b (a0),3(sp)
  charpos -= 0x20;
     f14:	102f 0003      	move.b 3(sp),d0
     f18:	0600 ffe0      	addi.b #-32,d0
     f1c:	1f40 0003      	move.b d0,3(sp)
  charpos = charpos<<3;
     f20:	102f 0003      	move.b 3(sp),d0
     f24:	4880           	ext.w d0
     f26:	48c0           	ext.l d0
     f28:	e788           	lsl.l #3,d0
     f2a:	1f40 0003      	move.b d0,3(sp)
  fntptr += charpos;
     f2e:	102f 0003      	move.b 3(sp),d0
     f32:	4880           	ext.w d0
     f34:	3040           	movea.w d0,a0
     f36:	2008           	move.l a0,d0
     f38:	d088           	add.l a0,d0
     f3a:	d1af 0008      	add.l d0,8(sp)
  for(int i=1;i<=8;i++) {
     f3e:	7001           	moveq #1,d0
     f40:	2f40 0004      	move.l d0,4(sp)
     f44:	6020           	bra.s f66 <WriteFont+0x6a>
    *bmpptr = *fntptr++;
     f46:	202f 0008      	move.l 8(sp),d0
     f4a:	2200           	move.l d0,d1
     f4c:	5481           	addq.l #2,d1
     f4e:	2f41 0008      	move.l d1,8(sp)
     f52:	2040           	movea.l d0,a0
     f54:	3010           	move.w (a0),d0
     f56:	206f 000c      	movea.l 12(sp),a0
     f5a:	3080           	move.w d0,(a0)
    bmpptr += 40;
     f5c:	7050           	moveq #80,d0
     f5e:	d1af 000c      	add.l d0,12(sp)
  for(int i=1;i<=8;i++) {
     f62:	52af 0004      	addq.l #1,4(sp)
     f66:	7208           	moveq #8,d1
     f68:	b2af 0004      	cmp.l 4(sp),d1
     f6c:	6cd8           	bge.s f46 <WriteFont+0x4a>
  }

}
     f6e:	4fef 0010      	lea 16(sp),sp
     f72:	4e75           	rts

00000f74 <c2p>:
INCBIN_CHIP(rawzoom16, "raw/zoom_16.raw");
INCBIN_CHIP(rawzoom17, "raw/zoom_17.raw");



void c2p() {
     f74:	4fef fff4      	lea -12(sp),sp
  c2p1x1_8_c5_gen_init( 336, 268, 0, 0, 0, 0);
     f78:	42a7           	clr.l -(sp)
     f7a:	42a7           	clr.l -(sp)
     f7c:	42a7           	clr.l -(sp)
     f7e:	42a7           	clr.l -(sp)
     f80:	4878 010c      	pea 10c <FreeDisplay+0x2c>
     f84:	4878 0150      	pea 150 <FreeDisplay+0x70>
     f88:	4eb9 0000 73f4 	jsr 73f4 <c2p1x1_8_c5_gen_init>
     f8e:	4fef 0018      	lea 24(sp),sp
  UWORD *src = rawzoom;
     f92:	2f79 0000 ba80 	move.l ba80 <rawzoom>,8(sp)
     f98:	0008 
  UWORD *dst = framebuffer;
     f9a:	2f79 0000 ba7c 	move.l ba7c <framebuffer>,4(sp)
     fa0:	0004 
  for(int i=0;i<=17;i++) {
     fa2:	4297           	clr.l (sp)
     fa4:	6022           	bra.s fc8 <c2p+0x54>
    c2p1x1_8_c5_gen( src, dst);
     fa6:	2f2f 0004      	move.l 4(sp),-(sp)
     faa:	2f2f 000c      	move.l 12(sp),-(sp)
     fae:	4eb9 0000 7470 	jsr 7470 <c2p1x1_8_c5_gen>
     fb4:	508f           	addq.l #8,sp
    src += 45025;
     fb6:	06af 0001 5fc2 	addi.l #90050,8(sp)
     fbc:	0008 
    dst += 28140;
     fbe:	06af 0000 dbd8 	addi.l #56280,4(sp)
     fc4:	0004 
  for(int i=0;i<=17;i++) {
     fc6:	5297           	addq.l #1,(sp)
     fc8:	7011           	moveq #17,d0
     fca:	b097           	cmp.l (sp),d0
     fcc:	6cd8           	bge.s fa6 <c2p+0x32>
  //Utils_FillLong( framebuffer, 0xaaaaaaaa, 1, 2856, 0); 
  /*Utils_FillLong( framebuffer+2856, 0x0, 1,2856, 0);
  Utils_FillLong( framebuffer+2856*2, 0x0, 1, 2856, 0);
  Utils_FillLong( framebuffer+2856*3, 0x0, 1, 2856, 0);
  Utils_FillLong( framebuffer+2856*4, 0x0, 1, 2856, 0);*/
}
     fce:	4fef 000c      	lea 12(sp),sp
     fd2:	4e75           	rts

00000fd4 <Zoom_VblankHandler>:

void Zoom_VblankHandler() {
  
  Zoom_Counter++;
     fd4:	3039 001a dbca 	move.w 1adbca <Zoom_Counter>,d0
     fda:	5240           	addq.w #1,d0
     fdc:	33c0 001a dbca 	move.w d0,1adbca <Zoom_Counter>
  SwapCl();
     fe2:	4eba f210      	jsr 1f4 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     fe6:	33fc 0001 001a 	move.w #1,1adbd0 <Zoom_MouseReleased>
     fec:	dbd0 
  if( MouseLeft())
     fee:	4eba f2c6      	jsr 2b6 <MouseLeft>(pc)
     ff2:	4a40           	tst.w d0
     ff4:	6708           	beq.s ffe <Zoom_VblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     ff6:	33fc 0001 001a 	move.w #1,1adbd2 <Zoom_Mousepressed>
     ffc:	dbd2 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     ffe:	3039 001a dbd2 	move.w 1adbd2 <Zoom_Mousepressed>,d0
    1004:	0c40 0001      	cmpi.w #1,d0
    1008:	6616           	bne.s 1020 <Zoom_VblankHandler+0x4c>
    100a:	4eba f2aa      	jsr 2b6 <MouseLeft>(pc)
    100e:	4a40           	tst.w d0
    1010:	660e           	bne.s 1020 <Zoom_VblankHandler+0x4c>
    Zoom_MouseReleased = 1;
    1012:	33fc 0001 001a 	move.w #1,1adbd0 <Zoom_MouseReleased>
    1018:	dbd0 
    Zoom_Mousepressed = 0;
    101a:	4279 001a dbd2 	clr.w 1adbd2 <Zoom_Mousepressed>
    /*if( MouseLeft()) {
      while (MouseLeft())
      {
      }*/
      
      Zoom_MouseReleased = 0;
    1020:	4279 001a dbd0 	clr.w 1adbd0 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom <= 2) {
    1026:	3039 001a dbd8 	move.w 1adbd8 <Zoom_LevelOf102Zoom>,d0
    102c:	0c40 0002      	cmpi.w #2,d0
    1030:	6244           	bhi.s 1076 <Zoom_VblankHandler+0xa2>
 
        if( Zoom_LevelOfZoom == 17)
    1032:	3039 001a dbd6 	move.w 1adbd6 <Zoom_LevelOfZoom>,d0
    1038:	0c40 0011      	cmpi.w #17,d0
    103c:	660a           	bne.s 1048 <Zoom_VblankHandler+0x74>
          Zoom_LevelOfZoom = 0;
    103e:	33fc 0000 001a 	move.w #0,1adbd6 <Zoom_LevelOfZoom>
    1044:	dbd6 
    1046:	600e           	bra.s 1056 <Zoom_VblankHandler+0x82>
        else
          Zoom_LevelOfZoom++;
    1048:	3039 001a dbd6 	move.w 1adbd6 <Zoom_LevelOfZoom>,d0
    104e:	5240           	addq.w #1,d0
    1050:	33c0 001a dbd6 	move.w d0,1adbd6 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
    1056:	33fc 000f 001a 	move.w #15,1adbd8 <Zoom_LevelOf102Zoom>
    105c:	dbd8 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
    105e:	3039 001a dbd6 	move.w 1adbd6 <Zoom_LevelOfZoom>,d0
    1064:	3000           	move.w d0,d0
    1066:	0280 0000 ffff 	andi.l #65535,d0
    106c:	2f00           	move.l d0,-(sp)
    106e:	4eba 1020      	jsr 2090 <Zoom_SwapBuffers>(pc)
    1072:	588f           	addq.l #4,sp
    1074:	600e           	bra.s 1084 <Zoom_VblankHandler+0xb0>
      } else 
        Zoom_LevelOf102Zoom--;
    1076:	3039 001a dbd8 	move.w 1adbd8 <Zoom_LevelOf102Zoom>,d0
    107c:	5340           	subq.w #1,d0
    107e:	33c0 001a dbd8 	move.w d0,1adbd8 <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
    1084:	2239 001a db84 	move.l 1adb84 <DrawCopper>,d1
    108a:	3039 001a dbd8 	move.w 1adbd8 <Zoom_LevelOf102Zoom>,d0
    1090:	3000           	move.w d0,d0
    1092:	0280 0000 ffff 	andi.l #65535,d0
    1098:	2f01           	move.l d1,-(sp)
    109a:	2f00           	move.l d0,-(sp)
    109c:	4eba f3c2      	jsr 460 <Zoom_Shrink102>(pc)
    10a0:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
    10a2:	2239 001a db84 	move.l 1adb84 <DrawCopper>,d1
    10a8:	2039 001a db80 	move.l 1adb80 <ViewBuffer>,d0
    10ae:	2f01           	move.l d1,-(sp)
    10b0:	2f00           	move.l d0,-(sp)
    10b2:	4eba 0f44      	jsr 1ff8 <Zoom_SetBplPointers>(pc)
    10b6:	508f           	addq.l #8,sp
 
}
    10b8:	4e75           	rts

000010ba <Zoom_ReverseVblankHandler>:


void Zoom_ReverseVblankHandler() {
  
  Zoom_Counter++;
    10ba:	3039 001a dbca 	move.w 1adbca <Zoom_Counter>,d0
    10c0:	5240           	addq.w #1,d0
    10c2:	33c0 001a dbca 	move.w d0,1adbca <Zoom_Counter>
  SwapCl();
    10c8:	4eba f12a      	jsr 1f4 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
    10cc:	33fc 0001 001a 	move.w #1,1adbd0 <Zoom_MouseReleased>
    10d2:	dbd0 
  if( MouseLeft())
    10d4:	4eba f1e0      	jsr 2b6 <MouseLeft>(pc)
    10d8:	4a40           	tst.w d0
    10da:	6708           	beq.s 10e4 <Zoom_ReverseVblankHandler+0x2a>
    Zoom_Mousepressed = 1;
    10dc:	33fc 0001 001a 	move.w #1,1adbd2 <Zoom_Mousepressed>
    10e2:	dbd2 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
    10e4:	3039 001a dbd2 	move.w 1adbd2 <Zoom_Mousepressed>,d0
    10ea:	0c40 0001      	cmpi.w #1,d0
    10ee:	6616           	bne.s 1106 <Zoom_ReverseVblankHandler+0x4c>
    10f0:	4eba f1c4      	jsr 2b6 <MouseLeft>(pc)
    10f4:	4a40           	tst.w d0
    10f6:	660e           	bne.s 1106 <Zoom_ReverseVblankHandler+0x4c>
    Zoom_MouseReleased = 1;
    10f8:	33fc 0001 001a 	move.w #1,1adbd0 <Zoom_MouseReleased>
    10fe:	dbd0 
    Zoom_Mousepressed = 0;
    1100:	4279 001a dbd2 	clr.w 1adbd2 <Zoom_Mousepressed>
    /*if( MouseLeft()) {
      while (MouseLeft())
      {
      }*/
      
      Zoom_MouseReleased = 0;
    1106:	4279 001a dbd0 	clr.w 1adbd0 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 15) {
    110c:	3039 001a dbd8 	move.w 1adbd8 <Zoom_LevelOf102Zoom>,d0
    1112:	0c40 000f      	cmpi.w #15,d0
    1116:	6640           	bne.s 1158 <Zoom_ReverseVblankHandler+0x9e>
 
        if( Zoom_LevelOfZoom == 0)
    1118:	3039 001a dbd6 	move.w 1adbd6 <Zoom_LevelOfZoom>,d0
    111e:	660a           	bne.s 112a <Zoom_ReverseVblankHandler+0x70>
          Zoom_LevelOfZoom = 17;
    1120:	33fc 0011 001a 	move.w #17,1adbd6 <Zoom_LevelOfZoom>
    1126:	dbd6 
    1128:	600e           	bra.s 1138 <Zoom_ReverseVblankHandler+0x7e>
        else
          Zoom_LevelOfZoom--;
    112a:	3039 001a dbd6 	move.w 1adbd6 <Zoom_LevelOfZoom>,d0
    1130:	5340           	subq.w #1,d0
    1132:	33c0 001a dbd6 	move.w d0,1adbd6 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 0;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
    1138:	33fc 0000 001a 	move.w #0,1adbd8 <Zoom_LevelOf102Zoom>
    113e:	dbd8 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
    1140:	3039 001a dbd6 	move.w 1adbd6 <Zoom_LevelOfZoom>,d0
    1146:	3000           	move.w d0,d0
    1148:	0280 0000 ffff 	andi.l #65535,d0
    114e:	2f00           	move.l d0,-(sp)
    1150:	4eba 0f3e      	jsr 2090 <Zoom_SwapBuffers>(pc)
    1154:	588f           	addq.l #4,sp
    1156:	600e           	bra.s 1166 <Zoom_ReverseVblankHandler+0xac>
      } else 
        Zoom_LevelOf102Zoom++;
    1158:	3039 001a dbd8 	move.w 1adbd8 <Zoom_LevelOf102Zoom>,d0
    115e:	5240           	addq.w #1,d0
    1160:	33c0 001a dbd8 	move.w d0,1adbd8 <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
    1166:	2239 001a db84 	move.l 1adb84 <DrawCopper>,d1
    116c:	3039 001a dbd8 	move.w 1adbd8 <Zoom_LevelOf102Zoom>,d0
    1172:	3000           	move.w d0,d0
    1174:	0280 0000 ffff 	andi.l #65535,d0
    117a:	2f01           	move.l d1,-(sp)
    117c:	2f00           	move.l d0,-(sp)
    117e:	4eba f2e0      	jsr 460 <Zoom_Shrink102>(pc)
    1182:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
    1184:	2239 001a db84 	move.l 1adb84 <DrawCopper>,d1
    118a:	2039 001a db80 	move.l 1adb80 <ViewBuffer>,d0
    1190:	2f01           	move.l d1,-(sp)
    1192:	2f00           	move.l d0,-(sp)
    1194:	4eba 0e62      	jsr 1ff8 <Zoom_SetBplPointers>(pc)
    1198:	508f           	addq.l #8,sp
 
}
    119a:	4e75           	rts

0000119c <Zoom_LoadImage>:

void Zoom_LoadImage( ULONG *destination) {  
    119c:	4fef fff4      	lea -12(sp),sp
    11a0:	2f0e           	move.l a6,-(sp)
  CopyMem( rawzoom, destination, ZMBPLSIZE);
    11a2:	2f79 0000 ba80 	move.l ba80 <rawzoom>,12(sp)
    11a8:	000c 
    11aa:	2f6f 0014 0008 	move.l 20(sp),8(sp)
    11b0:	2f7c 0000 df20 	move.l #57120,4(sp)
    11b6:	0004 
    11b8:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    11be:	2c40           	movea.l d0,a6
    11c0:	206f 000c      	movea.l 12(sp),a0
    11c4:	226f 0008      	movea.l 8(sp),a1
    11c8:	202f 0004      	move.l 4(sp),d0
    11cc:	4eae fd90      	jsr -624(a6)
}
    11d0:	2c5f           	movea.l (sp)+,a6
    11d2:	4fef 000c      	lea 12(sp),sp
    11d6:	4e75           	rts

000011d8 <Zoom_CopyWord>:

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080008, 
                                                       0x010a0000, 0x01001200 };

void  Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height) {  
    11d8:	598f           	subq.l #4,sp
    11da:	202f 0010      	move.l 16(sp),d0
    11de:	3000           	move.w d0,d0
    11e0:	3f40 0002      	move.w d0,2(sp)

  WaitBlt();
    11e4:	4eba eece      	jsr b4 <WaitBlt>(pc)

  hw->bltapt = (UWORD *) source;
    11e8:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    11ee:	216f 0008 0050 	move.l 8(sp),80(a0)
  hw->bltdpt = (UWORD *) destination;
    11f4:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    11fa:	216f 000c 0054 	move.l 12(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    1200:	302f 0002      	move.w 2(sp),d0
    1204:	ed48           	lsl.w #6,d0
    1206:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    120c:	5440           	addq.w #2,d0
    120e:	3140 0058      	move.w d0,88(a0)

}
    1212:	588f           	addq.l #4,sp
    1214:	4e75           	rts

00001216 <Zoom_ZoomBlit>:

void Zoom_ZoomBlit( UWORD *source, UWORD *destination, UWORD height) {
    1216:	518f           	subq.l #8,sp
    1218:	202f 0014      	move.l 20(sp),d0
    121c:	3000           	move.w d0,d0
    121e:	3f40 0002      	move.w d0,2(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B

  UWORD *blta = source + ZoomBlit_Increment4SrcA;
    1222:	3039 001a dbc0 	move.w 1adbc0 <ZoomBlit_Increment4SrcA>,d0
    1228:	3000           	move.w d0,d0
    122a:	0280 0000 ffff 	andi.l #65535,d0
    1230:	d080           	add.l d0,d0
    1232:	222f 000c      	move.l 12(sp),d1
    1236:	d280           	add.l d0,d1
    1238:	2f41 0004      	move.l d1,4(sp)
  WaitBlt();
    123c:	4eba ee76      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  
  hw->bltapt = blta;
    1240:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1246:	216f 0004 0050 	move.l 4(sp),80(a0)
  hw->bltbpt = source;
    124c:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1252:	216f 000c 004c 	move.l 12(sp),76(a0)
  hw->bltdpt = destination;
    1258:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    125e:	216f 0010 0054 	move.l 16(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    1264:	302f 0002      	move.w 2(sp),d0
    1268:	ed48           	lsl.w #6,d0
    126a:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1270:	5440           	addq.w #2,d0
    1272:	3140 0058      	move.w d0,88(a0)

}
    1276:	508f           	addq.l #8,sp
    1278:	4e75           	rts

0000127a <Zoom_ZoomBlit2>:

void Zoom_ZoomBlit2( UWORD *src4a, UWORD *src4b, UWORD *dst, UWORD height,
                                                 UWORD bltamod, UWORD bltbmod
                                                        , UWORD numofwords) {
    127a:	518f           	subq.l #8,sp
    127c:	226f 0018      	movea.l 24(sp),a1
    1280:	206f 001c      	movea.l 28(sp),a0
    1284:	222f 0020      	move.l 32(sp),d1
    1288:	202f 0024      	move.l 36(sp),d0
    128c:	3249           	movea.w a1,a1
    128e:	3f49 0006      	move.w a1,6(sp)
    1292:	3048           	movea.w a0,a0
    1294:	3f48 0004      	move.w a0,4(sp)
    1298:	3201           	move.w d1,d1
    129a:	3f41 0002      	move.w d1,2(sp)
    129e:	3000           	move.w d0,d0
    12a0:	3e80           	move.w d0,(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B
  hw->bltamod = bltamod;
    12a2:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    12a8:	316f 0004 0064 	move.w 4(sp),100(a0)
  hw->bltbmod = bltbmod;  
    12ae:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    12b4:	316f 0002 0062 	move.w 2(sp),98(a0)
  hw->bltapt = src4a;
    12ba:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    12c0:	216f 000c 0050 	move.l 12(sp),80(a0)
  hw->bltbpt = src4b;
    12c6:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    12cc:	216f 0010 004c 	move.l 16(sp),76(a0)
  hw->bltdpt = dst;
    12d2:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    12d8:	216f 0014 0054 	move.l 20(sp),84(a0)
  hw->bltsize = (height<<6)+numofwords;
    12de:	302f 0006      	move.w 6(sp),d0
    12e2:	ed48           	lsl.w #6,d0
    12e4:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    12ea:	d057           	add.w (sp),d0
    12ec:	3140 0058      	move.w d0,88(a0)
  
  WaitBlt();
    12f0:	4eba edc2      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a  

}
    12f4:	508f           	addq.l #8,sp
    12f6:	4e75           	rts

000012f8 <Zoom_InitRun>:


void Zoom_InitRun() {
    12f8:	4fef ffe0      	lea -32(sp),sp
    12fc:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    12fe:	4279 001a dbca 	clr.w 1adbca <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    1304:	7004           	moveq #4,d0
    1306:	2f40 0020      	move.l d0,32(sp)
    130a:	7002           	moveq #2,d0
    130c:	2f40 001c      	move.l d0,28(sp)
    1310:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    1316:	2c40           	movea.l d0,a6
    1318:	202f 0020      	move.l 32(sp),d0
    131c:	222f 001c      	move.l 28(sp),d1
    1320:	4eae ff3a      	jsr -198(a6)
    1324:	2f40 0018      	move.l d0,24(sp)
    1328:	202f 0018      	move.l 24(sp),d0
    132c:	23c0 001a dbb8 	move.l d0,1adbb8 <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 15;
    1332:	33fc 000f 001a 	move.w #15,1adbd8 <Zoom_LevelOf102Zoom>
    1338:	dbd8 
  ZoomHorizontal = 16;
    133a:	33fc 0010 001a 	move.w #16,1adbdc <ZoomHorizontal>
    1340:	dbdc 
  Zoom_PrepareDisplay();
    1342:	4eba 0288      	jsr 15cc <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 15, Copperlist1);
    1346:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    134c:	2f00           	move.l d0,-(sp)
    134e:	4878 000f      	pea f <_start+0xf>
    1352:	4eba f10c      	jsr 460 <Zoom_Shrink102>(pc)
    1356:	508f           	addq.l #8,sp
  Zoom_Shrink102( 15, Copperlist2);
    1358:	2039 001a db78 	move.l 1adb78 <Copperlist2>,d0
    135e:	2f00           	move.l d0,-(sp)
    1360:	4878 000f      	pea f <_start+0xf>
    1364:	4eba f0fa      	jsr 460 <Zoom_Shrink102>(pc)
    1368:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 1;
    136a:	33fc 0001 001a 	move.w #1,1adbd6 <Zoom_LevelOfZoom>
    1370:	dbd6 
  Zoom_Direction = 1;                                                  
    1372:	33fc 0001 001a 	move.w #1,1adbda <Zoom_Direction>
    1378:	dbda 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    137a:	7016           	moveq #22,d0
    137c:	2f40 0014      	move.l d0,20(sp)
    1380:	2f7c 0001 0001 	move.l #65537,16(sp)
    1386:	0010 
    1388:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    138e:	2c40           	movea.l d0,a6
    1390:	202f 0014      	move.l 20(sp),d0
    1394:	222f 0010      	move.l 16(sp),d1
    1398:	4eae ff3a      	jsr -198(a6)
    139c:	2f40 000c      	move.l d0,12(sp)
    13a0:	202f 000c      	move.l 12(sp),d0
    13a4:	23c0 001a dbc2 	move.l d0,1adbc2 <Zoom_vbint>
    13aa:	2039 001a dbc2 	move.l 1adbc2 <Zoom_vbint>,d0
    13b0:	673e           	beq.s 13f0 <Zoom_InitRun+0xf8>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    13b2:	2079 001a dbc2 	movea.l 1adbc2 <Zoom_vbint>,a0
    13b8:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    13be:	2079 001a dbc2 	movea.l 1adbc2 <Zoom_vbint>,a0
    13c4:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    13ca:	2079 001a dbc2 	movea.l 1adbc2 <Zoom_vbint>,a0
    13d0:	217c 0000 7ef5 	move.l #32501,10(a0)
    13d6:	000a 
    Zoom_vbint->is_Data = NULL;
    13d8:	2079 001a dbc2 	movea.l 1adbc2 <Zoom_vbint>,a0
    13de:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    13e2:	2079 001a dbc2 	movea.l 1adbc2 <Zoom_vbint>,a0
    13e8:	217c 0000 0fd4 	move.l #4052,18(a0)
    13ee:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    13f0:	7005           	moveq #5,d0
    13f2:	2f40 0008      	move.l d0,8(sp)
    13f6:	2f79 001a dbc2 	move.l 1adbc2 <Zoom_vbint>,4(sp)
    13fc:	0004 
    13fe:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    1404:	2c40           	movea.l d0,a6
    1406:	202f 0008      	move.l 8(sp),d0
    140a:	226f 0004      	movea.l 4(sp),a1
    140e:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    1412:	2239 001a db88 	move.l 1adb88 <ViewCopper>,d1
    1418:	2039 001a db80 	move.l 1adb80 <ViewBuffer>,d0
    141e:	2f01           	move.l d1,-(sp)
    1420:	2f00           	move.l d0,-(sp)
    1422:	4eba 0bd4      	jsr 1ff8 <Zoom_SetBplPointers>(pc)
    1426:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    1428:	2239 001a db84 	move.l 1adb84 <DrawCopper>,d1
    142e:	2039 001a db80 	move.l 1adb80 <ViewBuffer>,d0
    1434:	2f01           	move.l d1,-(sp)
    1436:	2f00           	move.l d0,-(sp)
    1438:	4eba 0bbe      	jsr 1ff8 <Zoom_SetBplPointers>(pc)
    143c:	508f           	addq.l #8,sp
  SwapCl();
    143e:	4eba edb4      	jsr 1f4 <SwapCl>(pc)
  
}
    1442:	2c5f           	movea.l (sp)+,a6
    1444:	4fef 0020      	lea 32(sp),sp
    1448:	4e75           	rts

0000144a <Zoom_InitRunReverse>:

void Zoom_InitRunReverse() {
    144a:	4fef ffe0      	lea -32(sp),sp
    144e:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    1450:	4279 001a dbca 	clr.w 1adbca <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    1456:	7004           	moveq #4,d0
    1458:	2f40 0020      	move.l d0,32(sp)
    145c:	7002           	moveq #2,d0
    145e:	2f40 001c      	move.l d0,28(sp)
    1462:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    1468:	2c40           	movea.l d0,a6
    146a:	202f 0020      	move.l 32(sp),d0
    146e:	222f 001c      	move.l 28(sp),d1
    1472:	4eae ff3a      	jsr -198(a6)
    1476:	2f40 0018      	move.l d0,24(sp)
    147a:	202f 0018      	move.l 24(sp),d0
    147e:	23c0 001a dbb8 	move.l d0,1adbb8 <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 0;
    1484:	33fc 0000 001a 	move.w #0,1adbd8 <Zoom_LevelOf102Zoom>
    148a:	dbd8 
  ZoomHorizontal = 16;
    148c:	33fc 0010 001a 	move.w #16,1adbdc <ZoomHorizontal>
    1492:	dbdc 
  Zoom_PrepareDisplay();
    1494:	4eba 0136      	jsr 15cc <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 0, Copperlist1);
    1498:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    149e:	2f00           	move.l d0,-(sp)
    14a0:	42a7           	clr.l -(sp)
    14a2:	4eba efbc      	jsr 460 <Zoom_Shrink102>(pc)
    14a6:	508f           	addq.l #8,sp
  Zoom_Shrink102( 0, Copperlist2);
    14a8:	2039 001a db78 	move.l 1adb78 <Copperlist2>,d0
    14ae:	2f00           	move.l d0,-(sp)
    14b0:	42a7           	clr.l -(sp)
    14b2:	4eba efac      	jsr 460 <Zoom_Shrink102>(pc)
    14b6:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 17;
    14b8:	33fc 0011 001a 	move.w #17,1adbd6 <Zoom_LevelOfZoom>
    14be:	dbd6 
                                                  
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    14c0:	7016           	moveq #22,d0
    14c2:	2f40 0014      	move.l d0,20(sp)
    14c6:	2f7c 0001 0001 	move.l #65537,16(sp)
    14cc:	0010 
    14ce:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    14d4:	2c40           	movea.l d0,a6
    14d6:	202f 0014      	move.l 20(sp),d0
    14da:	222f 0010      	move.l 16(sp),d1
    14de:	4eae ff3a      	jsr -198(a6)
    14e2:	2f40 000c      	move.l d0,12(sp)
    14e6:	202f 000c      	move.l 12(sp),d0
    14ea:	23c0 001a dbc2 	move.l d0,1adbc2 <Zoom_vbint>
    14f0:	2039 001a dbc2 	move.l 1adbc2 <Zoom_vbint>,d0
    14f6:	673e           	beq.s 1536 <Zoom_InitRunReverse+0xec>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    14f8:	2079 001a dbc2 	movea.l 1adbc2 <Zoom_vbint>,a0
    14fe:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    1504:	2079 001a dbc2 	movea.l 1adbc2 <Zoom_vbint>,a0
    150a:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    1510:	2079 001a dbc2 	movea.l 1adbc2 <Zoom_vbint>,a0
    1516:	217c 0000 7ef5 	move.l #32501,10(a0)
    151c:	000a 
    Zoom_vbint->is_Data = NULL;
    151e:	2079 001a dbc2 	movea.l 1adbc2 <Zoom_vbint>,a0
    1524:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_ReverseVblankHandler;
    1528:	2079 001a dbc2 	movea.l 1adbc2 <Zoom_vbint>,a0
    152e:	217c 0000 10ba 	move.l #4282,18(a0)
    1534:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    1536:	7005           	moveq #5,d0
    1538:	2f40 0008      	move.l d0,8(sp)
    153c:	2f79 001a dbc2 	move.l 1adbc2 <Zoom_vbint>,4(sp)
    1542:	0004 
    1544:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    154a:	2c40           	movea.l d0,a6
    154c:	202f 0008      	move.l 8(sp),d0
    1550:	226f 0004      	movea.l 4(sp),a1
    1554:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    1558:	2239 001a db88 	move.l 1adb88 <ViewCopper>,d1
    155e:	2039 001a db80 	move.l 1adb80 <ViewBuffer>,d0
    1564:	2f01           	move.l d1,-(sp)
    1566:	2f00           	move.l d0,-(sp)
    1568:	4eba 0a8e      	jsr 1ff8 <Zoom_SetBplPointers>(pc)
    156c:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    156e:	2239 001a db84 	move.l 1adb84 <DrawCopper>,d1
    1574:	2039 001a db80 	move.l 1adb80 <ViewBuffer>,d0
    157a:	2f01           	move.l d1,-(sp)
    157c:	2f00           	move.l d0,-(sp)
    157e:	4eba 0a78      	jsr 1ff8 <Zoom_SetBplPointers>(pc)
    1582:	508f           	addq.l #8,sp
  SwapCl();
    1584:	4eba ec6e      	jsr 1f4 <SwapCl>(pc)
  
}
    1588:	2c5f           	movea.l (sp)+,a6
    158a:	4fef 0020      	lea 32(sp),sp
    158e:	4e75           	rts

00001590 <Zoom_Dealloc>:

void Zoom_Dealloc() {
    1590:	518f           	subq.l #8,sp
    1592:	2f0e           	move.l a6,-(sp)
  RemIntServer(INTB_VERTB, Zoom_vbint);
    1594:	7005           	moveq #5,d0
    1596:	2f40 0008      	move.l d0,8(sp)
    159a:	2f79 001a dbc2 	move.l 1adbc2 <Zoom_vbint>,4(sp)
    15a0:	0004 
    15a2:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    15a8:	2c40           	movea.l d0,a6
    15aa:	202f 0008      	move.l 8(sp),d0
    15ae:	226f 0004      	movea.l 4(sp),a1
    15b2:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    15b6:	2f3c 0000 df20 	move.l #57120,-(sp)
    15bc:	4878 031c      	pea 31c <RunDemo+0x6>
    15c0:	4eba eb1e      	jsr e0 <FreeDisplay>(pc)
    15c4:	508f           	addq.l #8,sp
}
    15c6:	2c5f           	movea.l (sp)+,a6
    15c8:	508f           	addq.l #8,sp
    15ca:	4e75           	rts

000015cc <Zoom_PrepareDisplay>:
  
int Zoom_PrepareDisplay() {
  Zoom_SwapBuffers( 0);
    15cc:	42a7           	clr.l -(sp)
    15ce:	4eba 0ac0      	jsr 2090 <Zoom_SwapBuffers>(pc)
    15d2:	588f           	addq.l #4,sp
  Copperlist1 = ClbuildZoom( );
    15d4:	4eba 007a      	jsr 1650 <ClbuildZoom>(pc)
    15d8:	23c0 001a db74 	move.l d0,1adb74 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    15de:	4eba 0070      	jsr 1650 <ClbuildZoom>(pc)
    15e2:	23c0 001a db78 	move.l d0,1adb78 <Copperlist2>
  if(Bitplane2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;*/
  DrawCopper = Copperlist1;
    15e8:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    15ee:	23c0 001a db84 	move.l d0,1adb84 <DrawCopper>
  ViewCopper = Copperlist2;
    15f4:	2039 001a db78 	move.l 1adb78 <Copperlist2>,d0
    15fa:	23c0 001a db88 	move.l d0,1adb88 <ViewCopper>
  return 0;
    1600:	7000           	moveq #0,d0
}
    1602:	4e75           	rts

00001604 <Zoom_Init>:

void Zoom_Init() {
    1604:	4fef fff4      	lea -12(sp),sp
    1608:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    160a:	7004           	moveq #4,d0
    160c:	2f40 000c      	move.l d0,12(sp)
    1610:	7002           	moveq #2,d0
    1612:	2f40 0008      	move.l d0,8(sp)
    1616:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    161c:	2c40           	movea.l d0,a6
    161e:	202f 000c      	move.l 12(sp),d0
    1622:	222f 0008      	move.l 8(sp),d1
    1626:	4eae ff3a      	jsr -198(a6)
    162a:	2f40 0004      	move.l d0,4(sp)
    162e:	202f 0004      	move.l 4(sp),d0
    1632:	23c0 001a dbb8 	move.l d0,1adbb8 <Zoom_ZoomBlitMask>
  ZoomHorizontal = 16;
    1638:	33fc 0010 001a 	move.w #16,1adbdc <ZoomHorizontal>
    163e:	dbdc 
  Zoom_LevelOf102Zoom = 15;
    1640:	33fc 000f 001a 	move.w #15,1adbd8 <Zoom_LevelOf102Zoom>
    1646:	dbd8 
}
    1648:	2c5f           	movea.l (sp)+,a6
    164a:	4fef 000c      	lea 12(sp),sp
    164e:	4e75           	rts

00001650 <ClbuildZoom>:


ULONG * ClbuildZoom() {
    1650:	4fef ffac      	lea -84(sp),sp
    1654:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1658:	2f7c 0000 031c 	move.l #796,68(sp)
    165e:	0044 
    1660:	7002           	moveq #2,d0
    1662:	2f40 0040      	move.l d0,64(sp)
    1666:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    166c:	2c40           	movea.l d0,a6
    166e:	202f 0044      	move.l 68(sp),d0
    1672:	222f 0040      	move.l 64(sp),d1
    1676:	4eae ff3a      	jsr -198(a6)
    167a:	2f40 003c      	move.l d0,60(sp)
    167e:	202f 003c      	move.l 60(sp),d0
    1682:	2f40 0038      	move.l d0,56(sp)
  
  if( retval == 0) {
    1686:	6658           	bne.s 16e0 <ClbuildZoom+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1688:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    168e:	2c40           	movea.l d0,a6
    1690:	4eae ffc4      	jsr -60(a6)
    1694:	2f40 0034      	move.l d0,52(sp)
    1698:	202f 0034      	move.l 52(sp),d0
    169c:	2f40 0030      	move.l d0,48(sp)
    16a0:	2f7c 0000 7ecf 	move.l #32463,44(sp)
    16a6:	002c 
    16a8:	7228           	moveq #40,d1
    16aa:	2f41 0028      	move.l d1,40(sp)
    16ae:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    16b4:	2c40           	movea.l d0,a6
    16b6:	222f 0030      	move.l 48(sp),d1
    16ba:	242f 002c      	move.l 44(sp),d2
    16be:	262f 0028      	move.l 40(sp),d3
    16c2:	4eae ffd0      	jsr -48(a6)
    16c6:	2f40 0024      	move.l d0,36(sp)
    Exit(1);
    16ca:	7401           	moveq #1,d2
    16cc:	2f42 0020      	move.l d2,32(sp)
    16d0:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    16d6:	2c40           	movea.l d0,a6
    16d8:	222f 0020      	move.l 32(sp),d1
    16dc:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    16e0:	2f6f 0038 005c 	move.l 56(sp),92(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    16e6:	2f7c 0000 a868 	move.l #43112,88(sp)
    16ec:	0058 
  for(int i=0; i<16;i++)
    16ee:	42af 0054      	clr.l 84(sp)
    16f2:	6024           	bra.s 1718 <ClbuildZoom+0xc8>
    *cl++ = *clpartinstruction++;
    16f4:	222f 0058      	move.l 88(sp),d1
    16f8:	2001           	move.l d1,d0
    16fa:	5880           	addq.l #4,d0
    16fc:	2f40 0058      	move.l d0,88(sp)
    1700:	202f 005c      	move.l 92(sp),d0
    1704:	2400           	move.l d0,d2
    1706:	5882           	addq.l #4,d2
    1708:	2f42 005c      	move.l d2,92(sp)
    170c:	2041           	movea.l d1,a0
    170e:	2210           	move.l (a0),d1
    1710:	2040           	movea.l d0,a0
    1712:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    1714:	52af 0054      	addq.l #1,84(sp)
    1718:	700f           	moveq #15,d0
    171a:	b0af 0054      	cmp.l 84(sp),d0
    171e:	6cd4           	bge.s 16f4 <ClbuildZoom+0xa4>
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
    1720:	2f7c 0000 a8a8 	move.l #43176,88(sp)
    1726:	0058 
  for(int i=0; i<12;i++)
    1728:	42af 0050      	clr.l 80(sp)
    172c:	6024           	bra.s 1752 <ClbuildZoom+0x102>
    *cl++ = *clpartinstruction++;
    172e:	222f 0058      	move.l 88(sp),d1
    1732:	2401           	move.l d1,d2
    1734:	5882           	addq.l #4,d2
    1736:	2f42 0058      	move.l d2,88(sp)
    173a:	202f 005c      	move.l 92(sp),d0
    173e:	2400           	move.l d0,d2
    1740:	5882           	addq.l #4,d2
    1742:	2f42 005c      	move.l d2,92(sp)
    1746:	2041           	movea.l d1,a0
    1748:	2210           	move.l (a0),d1
    174a:	2040           	movea.l d0,a0
    174c:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    174e:	52af 0050      	addq.l #1,80(sp)
    1752:	700b           	moveq #11,d0
    1754:	b0af 0050      	cmp.l 80(sp),d0
    1758:	6cd4           	bge.s 172e <ClbuildZoom+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    175a:	202f 005c      	move.l 92(sp),d0
    175e:	2200           	move.l d0,d1
    1760:	5881           	addq.l #4,d1
    1762:	2f41 005c      	move.l d1,92(sp)
    1766:	2040           	movea.l d0,a0
    1768:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    176e:	202f 005c      	move.l 92(sp),d0
    1772:	2200           	move.l d0,d1
    1774:	5881           	addq.l #4,d1
    1776:	2f41 005c      	move.l d1,92(sp)
    177a:	2040           	movea.l d0,a0
    177c:	20bc 00e2 0000 	move.l #14811136,(a0)
  *cl++ = 0x00e40000;
    1782:	202f 005c      	move.l 92(sp),d0
    1786:	2200           	move.l d0,d1
    1788:	5881           	addq.l #4,d1
    178a:	2f41 005c      	move.l d1,92(sp)
    178e:	2040           	movea.l d0,a0
    1790:	20bc 00e4 0000 	move.l #14942208,(a0)
  *cl++ = 0x00e60000;
    1796:	202f 005c      	move.l 92(sp),d0
    179a:	2200           	move.l d0,d1
    179c:	5881           	addq.l #4,d1
    179e:	2f41 005c      	move.l d1,92(sp)
    17a2:	2040           	movea.l d0,a0
    17a4:	20bc 00e6 0000 	move.l #15073280,(a0)
  *cl++ = 0x00e80000;
    17aa:	202f 005c      	move.l 92(sp),d0
    17ae:	2200           	move.l d0,d1
    17b0:	5881           	addq.l #4,d1
    17b2:	2f41 005c      	move.l d1,92(sp)
    17b6:	2040           	movea.l d0,a0
    17b8:	20bc 00e8 0000 	move.l #15204352,(a0)
  *cl++ = 0x00ea0000;
    17be:	202f 005c      	move.l 92(sp),d0
    17c2:	2200           	move.l d0,d1
    17c4:	5881           	addq.l #4,d1
    17c6:	2f41 005c      	move.l d1,92(sp)
    17ca:	2040           	movea.l d0,a0
    17cc:	20bc 00ea 0000 	move.l #15335424,(a0)
  *cl++ = 0x00ec0000;
    17d2:	202f 005c      	move.l 92(sp),d0
    17d6:	2200           	move.l d0,d1
    17d8:	5881           	addq.l #4,d1
    17da:	2f41 005c      	move.l d1,92(sp)
    17de:	2040           	movea.l d0,a0
    17e0:	20bc 00ec 0000 	move.l #15466496,(a0)
  *cl++ = 0x00ee0000;
    17e6:	202f 005c      	move.l 92(sp),d0
    17ea:	2200           	move.l d0,d1
    17ec:	5881           	addq.l #4,d1
    17ee:	2f41 005c      	move.l d1,92(sp)
    17f2:	2040           	movea.l d0,a0
    17f4:	20bc 00ee 0000 	move.l #15597568,(a0)
  *cl++ = 0x00f00000;
    17fa:	202f 005c      	move.l 92(sp),d0
    17fe:	2200           	move.l d0,d1
    1800:	5881           	addq.l #4,d1
    1802:	2f41 005c      	move.l d1,92(sp)
    1806:	2040           	movea.l d0,a0
    1808:	20bc 00f0 0000 	move.l #15728640,(a0)
  *cl++ = 0x00f20000;
    180e:	202f 005c      	move.l 92(sp),d0
    1812:	2200           	move.l d0,d1
    1814:	5881           	addq.l #4,d1
    1816:	2f41 005c      	move.l d1,92(sp)
    181a:	2040           	movea.l d0,a0
    181c:	20bc 00f2 0000 	move.l #15859712,(a0)

  clpartinstruction = ClColor;
    1822:	2f7c 0000 a7e8 	move.l #42984,88(sp)
    1828:	0058 
  for(int i=0; i<32;i++)
    182a:	42af 004c      	clr.l 76(sp)
    182e:	6024           	bra.s 1854 <ClbuildZoom+0x204>
    *cl++ = *clpartinstruction++;
    1830:	222f 0058      	move.l 88(sp),d1
    1834:	2001           	move.l d1,d0
    1836:	5880           	addq.l #4,d0
    1838:	2f40 0058      	move.l d0,88(sp)
    183c:	202f 005c      	move.l 92(sp),d0
    1840:	2400           	move.l d0,d2
    1842:	5882           	addq.l #4,d2
    1844:	2f42 005c      	move.l d2,92(sp)
    1848:	2041           	movea.l d1,a0
    184a:	2210           	move.l (a0),d1
    184c:	2040           	movea.l d0,a0
    184e:	2081           	move.l d1,(a0)
  for(int i=0; i<32;i++)
    1850:	52af 004c      	addq.l #1,76(sp)
    1854:	701f           	moveq #31,d0
    1856:	b0af 004c      	cmp.l 76(sp),d0
    185a:	6cd4           	bge.s 1830 <ClbuildZoom+0x1e0>
  
  ULONG cop2 = cl+3;
    185c:	700c           	moveq #12,d0
    185e:	d0af 005c      	add.l 92(sp),d0
    1862:	2f40 001c      	move.l d0,28(sp)
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    1866:	202f 001c      	move.l 28(sp),d0
    186a:	4240           	clr.w d0
    186c:	4840           	swap d0
    186e:	2200           	move.l d0,d1
    1870:	0681 0084 0000 	addi.l #8650752,d1
    1876:	2f41 0018      	move.l d1,24(sp)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    187a:	202f 001c      	move.l 28(sp),d0
    187e:	0280 0000 ffff 	andi.l #65535,d0
    1884:	2400           	move.l d0,d2
    1886:	0682 0086 0000 	addi.l #8781824,d2
    188c:	2f42 0014      	move.l d2,20(sp)
  //clpartinstruction = Cl102ZoomInit;
  *cl++ = cop2lch;
    1890:	202f 005c      	move.l 92(sp),d0
    1894:	2200           	move.l d0,d1
    1896:	5881           	addq.l #4,d1
    1898:	2f41 005c      	move.l d1,92(sp)
    189c:	2040           	movea.l d0,a0
    189e:	20af 0018      	move.l 24(sp),(a0)
  *cl++ = cop2lcl;
    18a2:	202f 005c      	move.l 92(sp),d0
    18a6:	2200           	move.l d0,d1
    18a8:	5881           	addq.l #4,d1
    18aa:	2f41 005c      	move.l d1,92(sp)
    18ae:	2040           	movea.l d0,a0
    18b0:	20af 0014      	move.l 20(sp),(a0)
  *cl++ = 0x2c01ff00;
    18b4:	202f 005c      	move.l 92(sp),d0
    18b8:	2200           	move.l d0,d1
    18ba:	5881           	addq.l #4,d1
    18bc:	2f41 005c      	move.l d1,92(sp)
    18c0:	2040           	movea.l d0,a0
    18c2:	20bc 2c01 ff00 	move.l #738328320,(a0)

  ULONG cop2br1 = cop2 + ( (30)<<2);
    18c8:	7078           	moveq #120,d0
    18ca:	d0af 001c      	add.l 28(sp),d0
    18ce:	2f40 0010      	move.l d0,16(sp)
  ULONG cop2br2 = cop2 + ( (86)<<2);
    18d2:	222f 001c      	move.l 28(sp),d1
    18d6:	0681 0000 0158 	addi.l #344,d1
    18dc:	2f41 000c      	move.l d1,12(sp)
  clpartinstruction = Cl102ZoomRepeat;
    18e0:	2f7c 0000 a8e4 	move.l #43236,88(sp)
    18e6:	0058 
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    18e8:	202f 0010      	move.l 16(sp),d0
    18ec:	4240           	clr.w d0
    18ee:	4840           	swap d0
    18f0:	307c 0070      	movea.w #112,a0
    18f4:	d1ef 0058      	adda.l 88(sp),a0
    18f8:	0680 0084 0000 	addi.l #8650752,d0
    18fe:	2080           	move.l d0,(a0)
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    1900:	202f 0010      	move.l 16(sp),d0
    1904:	0280 0000 ffff 	andi.l #65535,d0
    190a:	307c 0074      	movea.w #116,a0
    190e:	d1ef 0058      	adda.l 88(sp),a0
    1912:	0680 0086 0000 	addi.l #8781824,d0
    1918:	2080           	move.l d0,(a0)
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    191a:	202f 000c      	move.l 12(sp),d0
    191e:	4240           	clr.w d0
    1920:	4840           	swap d0
    1922:	206f 0058      	movea.l 88(sp),a0
    1926:	41e8 0150      	lea 336(a0),a0
    192a:	0680 0084 0000 	addi.l #8650752,d0
    1930:	2080           	move.l d0,(a0)
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    1932:	202f 000c      	move.l 12(sp),d0
    1936:	0280 0000 ffff 	andi.l #65535,d0
    193c:	206f 0058      	movea.l 88(sp),a0
    1940:	41e8 0154      	lea 340(a0),a0
    1944:	0680 0086 0000 	addi.l #8781824,d0
    194a:	2080           	move.l d0,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    194c:	42af 0048      	clr.l 72(sp)
    1950:	6024           	bra.s 1976 <ClbuildZoom+0x326>
    *cl++ = *clpartinstruction++;
    1952:	222f 0058      	move.l 88(sp),d1
    1956:	2401           	move.l d1,d2
    1958:	5882           	addq.l #4,d2
    195a:	2f42 0058      	move.l d2,88(sp)
    195e:	202f 005c      	move.l 92(sp),d0
    1962:	2400           	move.l d0,d2
    1964:	5882           	addq.l #4,d2
    1966:	2f42 005c      	move.l d2,92(sp)
    196a:	2041           	movea.l d1,a0
    196c:	2210           	move.l (a0),d1
    196e:	2040           	movea.l d0,a0
    1970:	2081           	move.l d1,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    1972:	52af 0048      	addq.l #1,72(sp)
    1976:	7071           	moveq #113,d0
    1978:	b0af 0048      	cmp.l 72(sp),d0
    197c:	6cd4           	bge.s 1952 <ClbuildZoom+0x302>

   *cl++ = 0xfffffffe;
    197e:	202f 005c      	move.l 92(sp),d0
    1982:	2200           	move.l d0,d1
    1984:	5881           	addq.l #4,d1
    1986:	2f41 005c      	move.l d1,92(sp)
    198a:	74fe           	moveq #-2,d2
    198c:	2040           	movea.l d0,a0
    198e:	2082           	move.l d2,(a0)

  return retval;
    1990:	202f 0038      	move.l 56(sp),d0
}
    1994:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1998:	4fef 0054      	lea 84(sp),sp
    199c:	4e75           	rts

0000199e <PrepareDisplayZoom>:

 int PrepareDisplayZoom() {
    199e:	4fef ffb8      	lea -72(sp),sp
    19a2:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildZoom();
    19a6:	4eba fca8      	jsr 1650 <ClbuildZoom>(pc)
    19aa:	23c0 001a db74 	move.l d0,1adb74 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    19b0:	4eba fc9e      	jsr 1650 <ClbuildZoom>(pc)
    19b4:	23c0 001a db78 	move.l d0,1adb78 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    19ba:	2f7c 0000 df20 	move.l #57120,80(sp)
    19c0:	0050 
    19c2:	7002           	moveq #2,d0
    19c4:	2f40 004c      	move.l d0,76(sp)
    19c8:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    19ce:	2c40           	movea.l d0,a6
    19d0:	202f 0050      	move.l 80(sp),d0
    19d4:	222f 004c      	move.l 76(sp),d1
    19d8:	4eae ff3a      	jsr -198(a6)
    19dc:	2f40 0048      	move.l d0,72(sp)
    19e0:	202f 0048      	move.l 72(sp),d0
    19e4:	23c0 001a db6c 	move.l d0,1adb6c <Bitplane1>
  if(Bitplane1 == 0) {
    19ea:	2039 001a db6c 	move.l 1adb6c <Bitplane1>,d0
    19f0:	6658           	bne.s 1a4a <PrepareDisplayZoom+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    19f2:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    19f8:	2c40           	movea.l d0,a6
    19fa:	4eae ffc4      	jsr -60(a6)
    19fe:	2f40 0044      	move.l d0,68(sp)
    1a02:	202f 0044      	move.l 68(sp),d0
    1a06:	2f40 0040      	move.l d0,64(sp)
    1a0a:	2f7c 0000 7e81 	move.l #32385,60(sp)
    1a10:	003c 
    1a12:	7026           	moveq #38,d0
    1a14:	2f40 0038      	move.l d0,56(sp)
    1a18:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    1a1e:	2c40           	movea.l d0,a6
    1a20:	222f 0040      	move.l 64(sp),d1
    1a24:	242f 003c      	move.l 60(sp),d2
    1a28:	262f 0038      	move.l 56(sp),d3
    1a2c:	4eae ffd0      	jsr -48(a6)
    1a30:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    1a34:	7001           	moveq #1,d0
    1a36:	2f40 0030      	move.l d0,48(sp)
    1a3a:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    1a40:	2c40           	movea.l d0,a6
    1a42:	222f 0030      	move.l 48(sp),d1
    1a46:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    1a4a:	2039 001a db6c 	move.l 1adb6c <Bitplane1>,d0
    1a50:	23c0 001a db7c 	move.l d0,1adb7c <DrawBuffer>
  DrawCopper = Copperlist1;
    1a56:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    1a5c:	23c0 001a db84 	move.l d0,1adb84 <DrawCopper>
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1a62:	2f7c 0000 df20 	move.l #57120,44(sp)
    1a68:	002c 
    1a6a:	7002           	moveq #2,d0
    1a6c:	2f40 0028      	move.l d0,40(sp)
    1a70:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    1a76:	2c40           	movea.l d0,a6
    1a78:	202f 002c      	move.l 44(sp),d0
    1a7c:	222f 0028      	move.l 40(sp),d1
    1a80:	4eae ff3a      	jsr -198(a6)
    1a84:	2f40 0024      	move.l d0,36(sp)
    1a88:	202f 0024      	move.l 36(sp),d0
    1a8c:	23c0 001a db70 	move.l d0,1adb70 <Bitplane2>
  if(Bitplane2 == 0) {
    1a92:	2039 001a db70 	move.l 1adb70 <Bitplane2>,d0
    1a98:	6658           	bne.s 1af2 <PrepareDisplayZoom+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1a9a:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    1aa0:	2c40           	movea.l d0,a6
    1aa2:	4eae ffc4      	jsr -60(a6)
    1aa6:	2f40 0020      	move.l d0,32(sp)
    1aaa:	202f 0020      	move.l 32(sp),d0
    1aae:	2f40 001c      	move.l d0,28(sp)
    1ab2:	2f7c 0000 7ea8 	move.l #32424,24(sp)
    1ab8:	0018 
    1aba:	7026           	moveq #38,d0
    1abc:	2f40 0014      	move.l d0,20(sp)
    1ac0:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    1ac6:	2c40           	movea.l d0,a6
    1ac8:	222f 001c      	move.l 28(sp),d1
    1acc:	242f 0018      	move.l 24(sp),d2
    1ad0:	262f 0014      	move.l 20(sp),d3
    1ad4:	4eae ffd0      	jsr -48(a6)
    1ad8:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    1adc:	7001           	moveq #1,d0
    1ade:	2f40 000c      	move.l d0,12(sp)
    1ae2:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    1ae8:	2c40           	movea.l d0,a6
    1aea:	222f 000c      	move.l 12(sp),d1
    1aee:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    1af2:	2039 001a db70 	move.l 1adb70 <Bitplane2>,d0
    1af8:	23c0 001a db80 	move.l d0,1adb80 <ViewBuffer>
  ViewCopper = Copperlist2; 
    1afe:	2039 001a db78 	move.l 1adb78 <Copperlist2>,d0
    1b04:	23c0 001a db88 	move.l d0,1adb88 <ViewCopper>
  return 0;
    1b0a:	7000           	moveq #0,d0
}
    1b0c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1b10:	4fef 0048      	lea 72(sp),sp
    1b14:	4e75           	rts

00001b16 <Init_Blit>:

void Init_Blit() {
  hw->bltafwm = 0xffff;
    1b16:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1b1c:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1b22:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1b28:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1b2e:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1b34:	317c 0026 0064 	move.w #38,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1b3a:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1b40:	317c 0026 0062 	move.w #38,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1b46:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1b4c:	317c 0026 0066 	move.w #38,102(a0)
}
    1b52:	4e75           	rts

00001b54 <Init_Blit2>:


void Init_Blit2() {
  hw->bltafwm = 0xffff;
    1b54:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1b5a:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1b60:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1b66:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = 36;
    1b6c:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1b72:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = 76;
    1b78:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1b7e:	317c 004c 0062 	move.w #76,98(a0)
  hw->bltdmod = ZMLINESIZE2 - 4;
    1b84:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1b8a:	317c 0028 0066 	move.w #40,102(a0)
}
    1b90:	4e75           	rts

00001b92 <Init_ZoomBlit>:

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
    1b92:	4fef fff4      	lea -12(sp),sp
    1b96:	206f 0010      	movea.l 16(sp),a0
    1b9a:	222f 0014      	move.l 20(sp),d1
    1b9e:	202f 0018      	move.l 24(sp),d0
    1ba2:	3048           	movea.w a0,a0
    1ba4:	3f48 0004      	move.w a0,4(sp)
    1ba8:	3201           	move.w d1,d1
    1baa:	3f41 0002      	move.w d1,2(sp)
    1bae:	3000           	move.w d0,d0
    1bb0:	3e80           	move.w d0,(sp)
  ZoomBlit_Increment4SrcA = 0;
    1bb2:	4279 001a dbc0 	clr.w 1adbc0 <ZoomBlit_Increment4SrcA>

  UWORD colnr = nextzoom - startofword - 1;                                                                          
    1bb8:	302f 0002      	move.w 2(sp),d0
    1bbc:	906f 0004      	sub.w 4(sp),d0
    1bc0:	3200           	move.w d0,d1
    1bc2:	5341           	subq.w #1,d1
    1bc4:	3f41 0008      	move.w d1,8(sp)
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
    1bc8:	3017           	move.w (sp),d0
    1bca:	720c           	moveq #12,d1
    1bcc:	e368           	lsl.w d1,d0
    1bce:	3f40 0006      	move.w d0,6(sp)
  UWORD shifta;
  if( shiftright == 0) {
    1bd2:	4a57           	tst.w (sp)
    1bd4:	6610           	bne.s 1be6 <Init_ZoomBlit+0x54>
    ZoomBlit_Increment4SrcA = 1;
    1bd6:	33fc 0001 001a 	move.w #1,1adbc0 <ZoomBlit_Increment4SrcA>
    1bdc:	dbc0 
    shifta = 15 << 12;
    1bde:	3f7c f000 000a 	move.w #-4096,10(sp)
    1be4:	600c           	bra.s 1bf2 <Init_ZoomBlit+0x60>
  } else {
    shifta = (shiftright - 1) << 12;
    1be6:	3017           	move.w (sp),d0
    1be8:	5340           	subq.w #1,d0
    1bea:	720c           	moveq #12,d1
    1bec:	e368           	lsl.w d1,d0
    1bee:	3f40 000a      	move.w d0,10(sp)
  }
  WaitBlt(); 
    1bf2:	4eba e4c0      	jsr b4 <WaitBlt>(pc)
  hw->bltcon1 = shiftb; 
    1bf6:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1bfc:	316f 0006 0042 	move.w 6(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1c02:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1c08:	302f 000a      	move.w 10(sp),d0
    1c0c:	0640 0de4      	addi.w #3556,d0
    1c10:	3140 0040      	move.w d0,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1c14:	7000           	moveq #0,d0
    1c16:	302f 0008      	move.w 8(sp),d0
    1c1a:	7210           	moveq #16,d1
    1c1c:	9280           	sub.l d0,d1
    1c1e:	7000           	moveq #0,d0
    1c20:	4640           	not.w d0
    1c22:	e3a8           	lsl.l d1,d0
    1c24:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1c2a:	2000           	move.l d0,d0
    1c2c:	3140 0070      	move.w d0,112(a0)
}
    1c30:	4fef 000c      	lea 12(sp),sp
    1c34:	4e75           	rts

00001c36 <Init_Copy>:

void Init_Copy( WORD shift) {
    1c36:	598f           	subq.l #4,sp
    1c38:	202f 0008      	move.l 8(sp),d0
    1c3c:	3000           	move.w d0,d0
    1c3e:	3e80           	move.w d0,(sp)
  UWORD shiftright = shift << 12;
    1c40:	3017           	move.w (sp),d0
    1c42:	720c           	moveq #12,d1
    1c44:	e368           	lsl.w d1,d0
    1c46:	3f40 0002      	move.w d0,2(sp)
  WaitBlt();
    1c4a:	4eba e468      	jsr b4 <WaitBlt>(pc)
  hw->bltcon0 = 0x9f0 + shiftright;
    1c4e:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1c54:	302f 0002      	move.w 2(sp),d0
    1c58:	0640 09f0      	addi.w #2544,d0
    1c5c:	3140 0040      	move.w d0,64(a0)
  hw->bltcon1 = 0;
    1c60:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    1c66:	317c 0000 0042 	move.w #0,66(a0)
}
    1c6c:	588f           	addq.l #4,sp
    1c6e:	4e75           	rts

00001c70 <Zoom_ZoomIntoPicture>:

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    1c70:	4fef ffcc      	lea -52(sp),sp
    1c74:	222f 0040      	move.l 64(sp),d1
    1c78:	202f 0044      	move.l 68(sp),d0
    1c7c:	3201           	move.w d1,d1
    1c7e:	3f41 0002      	move.w d1,2(sp)
    1c82:	3000           	move.w d0,d0
    1c84:	3e80           	move.w d0,(sp)
  
  WaitBlt();  
    1c86:	4eba e42c      	jsr b4 <WaitBlt>(pc)
  Init_Blit();
    1c8a:	4eba fe8a      	jsr 1b16 <Init_Blit>(pc)
  WORD shiftright = 9;
    1c8e:	3f7c 0009 0032 	move.w #9,50(sp)
  UWORD shifthoriz = 7;
    1c94:	3f7c 0007 0030 	move.w #7,48(sp)
  UWORD startofword = 21*16;
    1c9a:	3f7c 0150 002e 	move.w #336,46(sp)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1ca0:	322f 0002      	move.w 2(sp),d1
    1ca4:	3001           	move.w d1,d0
    1ca6:	d040           	add.w d0,d0
    1ca8:	d040           	add.w d0,d0
    1caa:	d041           	add.w d1,d0
    1cac:	d040           	add.w d0,d0
    1cae:	0640 014c      	addi.w #332,d0
    1cb2:	3f40 002c      	move.w d0,44(sp)
    1cb6:	601a           	bra.s 1cd2 <Zoom_ZoomIntoPicture+0x62>
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    1cb8:	302f 002c      	move.w 44(sp),d0
    1cbc:	906f 0002      	sub.w 2(sp),d0
    1cc0:	0640 ffed      	addi.w #-19,d0
    1cc4:	3f40 002c      	move.w d0,44(sp)
    shiftright--;
    1cc8:	302f 0032      	move.w 50(sp),d0
    1ccc:	5340           	subq.w #1,d0
    1cce:	3f40 0032      	move.w d0,50(sp)
  while( nextzoom > 22 * 16) {
    1cd2:	0c6f 0160 002c 	cmpi.w #352,44(sp)
    1cd8:	6ede           	bgt.s 1cb8 <Zoom_ZoomIntoPicture+0x48>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
    1cda:	426f 002a      	clr.w 42(sp)
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    1cde:	322f 0002      	move.w 2(sp),d1
    1ce2:	3001           	move.w d1,d0
    1ce4:	d040           	add.w d0,d0
    1ce6:	d040           	add.w d0,d0
    1ce8:	d041           	add.w d1,d0
    1cea:	4440           	neg.w d0
    1cec:	0640 0012      	addi.w #18,d0
    1cf0:	3f40 0028      	move.w d0,40(sp)
    1cf4:	601c           	bra.s 1d12 <Zoom_ZoomIntoPicture+0xa2>
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    1cf6:	302f 0028      	move.w 40(sp),d0
    1cfa:	d06f 0002      	add.w 2(sp),d0
    1cfe:	0640 0013      	addi.w #19,d0
    1d02:	3f40 0028      	move.w d0,40(sp)
      shifthoriz--;
    1d06:	302f 0030      	move.w 48(sp),d0
    1d0a:	3200           	move.w d0,d1
    1d0c:	5341           	subq.w #1,d1
    1d0e:	3f41 0030      	move.w d1,48(sp)
  while( ZoomHorizontalStart < 0) {
    1d12:	4a6f 0028      	tst.w 40(sp)
    1d16:	6dde           	blt.s 1cf6 <Zoom_ZoomIntoPicture+0x86>
  } 

  for(int i=0;i<22;i++) {
    1d18:	42af 0024      	clr.l 36(sp)
    1d1c:	6000 02ca      	bra.w 1fe8 <Zoom_ZoomIntoPicture+0x378>

    ZoomHorizontal = ZoomHorizontalStart;
    1d20:	33ef 0028 001a 	move.w 40(sp),1adbdc <ZoomHorizontal>
    1d26:	dbdc 

    WORD linesleft = 272;
    1d28:	3f7c 0110 0022 	move.w #272,34(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1d2e:	7000           	moveq #0,d0
    1d30:	302f 0030      	move.w 48(sp),d0
    1d34:	7200           	moveq #0,d1
    1d36:	3217           	move.w (sp),d1
    1d38:	2f01           	move.l d1,-(sp)
    1d3a:	2f00           	move.l d0,-(sp)
    1d3c:	4eb9 0000 72e8 	jsr 72e8 <__mulsi3>
    1d42:	508f           	addq.l #8,sp
    1d44:	2200           	move.l d0,d1
    1d46:	2001           	move.l d1,d0
    1d48:	d080           	add.l d0,d0
    1d4a:	d081           	add.l d1,d0
    1d4c:	2200           	move.l d0,d1
    1d4e:	e789           	lsl.l #3,d1
    1d50:	9280           	sub.l d0,d1
    1d52:	202f 0024      	move.l 36(sp),d0
    1d56:	9280           	sub.l d0,d1
    1d58:	2001           	move.l d1,d0
    1d5a:	0680 8000 0013 	addi.l #-2147483629,d0
    1d60:	d080           	add.l d0,d0
    1d62:	222f 0038      	move.l 56(sp),d1
    1d66:	d280           	add.l d0,d1
    1d68:	2f41 001e      	move.l d1,30(sp)
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1d6c:	202f 0024      	move.l 36(sp),d0
    1d70:	7213           	moveq #19,d1
    1d72:	9280           	sub.l d0,d1
    1d74:	2001           	move.l d1,d0
    1d76:	d081           	add.l d1,d0
    1d78:	222f 003c      	move.l 60(sp),d1
    1d7c:	d280           	add.l d0,d1
    1d7e:	2f41 001a      	move.l d1,26(sp)
    
    UWORD onestep = ZMLINESIZE/2*planes;
    1d82:	3017           	move.w (sp),d0
    1d84:	c1fc 0015      	muls.w #21,d0
    1d88:	3f40 0018      	move.w d0,24(sp)
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1d8c:	7000           	moveq #0,d0
    1d8e:	302f 002e      	move.w 46(sp),d0
    1d92:	306f 002c      	movea.w 44(sp),a0
    1d96:	b1c0           	cmpa.l d0,a0
    1d98:	6e00 0106      	bgt.w 1ea0 <Zoom_ZoomIntoPicture+0x230>
      Init_Copy( shiftright);
    1d9c:	306f 0032      	movea.w 50(sp),a0
    1da0:	2f08           	move.l a0,-(sp)
    1da2:	4eba fe92      	jsr 1c36 <Init_Copy>(pc)
    1da6:	588f           	addq.l #4,sp
    1da8:	6000 00ea      	bra.w 1e94 <Zoom_ZoomIntoPicture+0x224>
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1dac:	3039 001a dbdc 	move.w 1adbdc <ZoomHorizontal>,d0
    1db2:	b06f 0022      	cmp.w 34(sp),d0
    1db6:	6c12           	bge.s 1dca <Zoom_ZoomIntoPicture+0x15a>
          linesleft -= ZoomHorizontal;
    1db8:	322f 0022      	move.w 34(sp),d1
    1dbc:	3039 001a dbdc 	move.w 1adbdc <ZoomHorizontal>,d0
    1dc2:	9240           	sub.w d0,d1
    1dc4:	3f41 0022      	move.w d1,34(sp)
    1dc8:	600c           	bra.s 1dd6 <Zoom_ZoomIntoPicture+0x166>
        } else {
          ZoomHorizontal = linesleft;
    1dca:	33ef 0022 001a 	move.w 34(sp),1adbdc <ZoomHorizontal>
    1dd0:	dbdc 
          linesleft = 0;
    1dd2:	426f 0022      	clr.w 34(sp)
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
    1dd6:	3039 001a dbdc 	move.w 1adbdc <ZoomHorizontal>,d0
    1ddc:	322f 0018      	move.w 24(sp),d1
    1de0:	c3c0           	muls.w d0,d1
    1de2:	3f41 000c      	move.w d1,12(sp)
        //Add aditional line
        if( linesleft>0) {
    1de6:	4a6f 0022      	tst.w 34(sp)
    1dea:	6f4c           	ble.s 1e38 <Zoom_ZoomIntoPicture+0x1c8>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1dec:	7200           	moveq #0,d1
    1dee:	322f 000c      	move.w 12(sp),d1
    1df2:	7000           	moveq #0,d0
    1df4:	302f 002a      	move.w 42(sp),d0
    1df8:	d081           	add.l d1,d0
    1dfa:	d080           	add.l d0,d0
    1dfc:	222f 001e      	move.l 30(sp),d1
    1e00:	d280           	add.l d0,d1
    1e02:	2f41 0008      	move.l d1,8(sp)
          UWORD *tmpdest = pos4dest +  size4blit;
    1e06:	7000           	moveq #0,d0
    1e08:	302f 000c      	move.w 12(sp),d0
    1e0c:	d080           	add.l d0,d0
    1e0e:	222f 001a      	move.l 26(sp),d1
    1e12:	d280           	add.l d0,d1
    1e14:	2f41 0004      	move.l d1,4(sp)
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
    1e18:	7000           	moveq #0,d0
    1e1a:	3017           	move.w (sp),d0
    1e1c:	2f00           	move.l d0,-(sp)
    1e1e:	2f2f 0008      	move.l 8(sp),-(sp)
    1e22:	2f2f 0010      	move.l 16(sp),-(sp)
    1e26:	4eba f3b0      	jsr 11d8 <Zoom_CopyWord>(pc)
    1e2a:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1e2e:	302f 0022      	move.w 34(sp),d0
    1e32:	5340           	subq.w #1,d0
    1e34:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1e38:	3039 001a dbdc 	move.w 1adbdc <ZoomHorizontal>,d0
    1e3e:	c1d7           	muls.w (sp),d0
    1e40:	7200           	moveq #0,d1
    1e42:	3200           	move.w d0,d1
    1e44:	7000           	moveq #0,d0
    1e46:	302f 002a      	move.w 42(sp),d0
    1e4a:	d080           	add.l d0,d0
    1e4c:	d0af 001e      	add.l 30(sp),d0
    1e50:	2f01           	move.l d1,-(sp)
    1e52:	2f2f 001e      	move.l 30(sp),-(sp)
    1e56:	2f00           	move.l d0,-(sp)
    1e58:	4eba f37e      	jsr 11d8 <Zoom_CopyWord>(pc)
    1e5c:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1e60:	7000           	moveq #0,d0
    1e62:	302f 000c      	move.w 12(sp),d0
    1e66:	d080           	add.l d0,d0
    1e68:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep; 
    1e6c:	7200           	moveq #0,d1
    1e6e:	322f 000c      	move.w 12(sp),d1
    1e72:	7000           	moveq #0,d0
    1e74:	302f 0018      	move.w 24(sp),d0
    1e78:	d081           	add.l d1,d0
    1e7a:	d080           	add.l d0,d0
    1e7c:	d1af 001a      	add.l d0,26(sp)
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1e80:	302f 0002      	move.w 2(sp),d0
    1e84:	d040           	add.w d0,d0
    1e86:	906f 0002      	sub.w 2(sp),d0
    1e8a:	0640 0012      	addi.w #18,d0
    1e8e:	33c0 001a dbdc 	move.w d0,1adbdc <ZoomHorizontal>
      while(linesleft > 0) {
    1e94:	4a6f 0022      	tst.w 34(sp)
    1e98:	6e00 ff12      	bgt.w 1dac <Zoom_ZoomIntoPicture+0x13c>
    1e9c:	6000 0140      	bra.w 1fde <Zoom_ZoomIntoPicture+0x36e>
      }
    } else {  
      Init_ZoomBlit( startofword, nextzoom, shiftright);   
    1ea0:	326f 0032      	movea.w 50(sp),a1
    1ea4:	306f 002c      	movea.w 44(sp),a0
    1ea8:	7000           	moveq #0,d0
    1eaa:	302f 002e      	move.w 46(sp),d0
    1eae:	2f09           	move.l a1,-(sp)
    1eb0:	2f08           	move.l a0,-(sp)
    1eb2:	2f00           	move.l d0,-(sp)
    1eb4:	4eba fcdc      	jsr 1b92 <Init_ZoomBlit>(pc)
    1eb8:	4fef 000c      	lea 12(sp),sp
      nextzoom -= (19 + zoomnr);
    1ebc:	302f 002c      	move.w 44(sp),d0
    1ec0:	906f 0002      	sub.w 2(sp),d0
    1ec4:	0640 ffed      	addi.w #-19,d0
    1ec8:	3f40 002c      	move.w d0,44(sp)
    1ecc:	6000 00ea      	bra.w 1fb8 <Zoom_ZoomIntoPicture+0x348>
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1ed0:	3039 001a dbdc 	move.w 1adbdc <ZoomHorizontal>,d0
    1ed6:	b06f 0022      	cmp.w 34(sp),d0
    1eda:	6c12           	bge.s 1eee <Zoom_ZoomIntoPicture+0x27e>
          linesleft -= ZoomHorizontal;
    1edc:	322f 0022      	move.w 34(sp),d1
    1ee0:	3039 001a dbdc 	move.w 1adbdc <ZoomHorizontal>,d0
    1ee6:	9240           	sub.w d0,d1
    1ee8:	3f41 0022      	move.w d1,34(sp)
    1eec:	600c           	bra.s 1efa <Zoom_ZoomIntoPicture+0x28a>
        } else {
          ZoomHorizontal = linesleft;
    1eee:	33ef 0022 001a 	move.w 34(sp),1adbdc <ZoomHorizontal>
    1ef4:	dbdc 
          linesleft = 0;
    1ef6:	426f 0022      	clr.w 34(sp)
        }
        UWORD size4blit = ZoomHorizontal*onestep;
    1efa:	3039 001a dbdc 	move.w 1adbdc <ZoomHorizontal>,d0
    1f00:	322f 0018      	move.w 24(sp),d1
    1f04:	c3c0           	muls.w d0,d1
    1f06:	3f41 0016      	move.w d1,22(sp)
        //Add aditional line
        if( linesleft>0) {
    1f0a:	4a6f 0022      	tst.w 34(sp)
    1f0e:	6f4c           	ble.s 1f5c <Zoom_ZoomIntoPicture+0x2ec>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1f10:	7200           	moveq #0,d1
    1f12:	322f 0016      	move.w 22(sp),d1
    1f16:	7000           	moveq #0,d0
    1f18:	302f 002a      	move.w 42(sp),d0
    1f1c:	d081           	add.l d1,d0
    1f1e:	d080           	add.l d0,d0
    1f20:	222f 001e      	move.l 30(sp),d1
    1f24:	d280           	add.l d0,d1
    1f26:	2f41 0012      	move.l d1,18(sp)
          UWORD *tmpdest = pos4dest + size4blit;
    1f2a:	7000           	moveq #0,d0
    1f2c:	302f 0016      	move.w 22(sp),d0
    1f30:	d080           	add.l d0,d0
    1f32:	222f 001a      	move.l 26(sp),d1
    1f36:	d280           	add.l d0,d1
    1f38:	2f41 000e      	move.l d1,14(sp)
          
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
    1f3c:	7000           	moveq #0,d0
    1f3e:	3017           	move.w (sp),d0
    1f40:	2f00           	move.l d0,-(sp)
    1f42:	2f2f 0012      	move.l 18(sp),-(sp)
    1f46:	2f2f 001a      	move.l 26(sp),-(sp)
    1f4a:	4eba f2ca      	jsr 1216 <Zoom_ZoomBlit>(pc)
    1f4e:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1f52:	302f 0022      	move.w 34(sp),d0
    1f56:	5340           	subq.w #1,d0
    1f58:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1f5c:	3039 001a dbdc 	move.w 1adbdc <ZoomHorizontal>,d0
    1f62:	c1d7           	muls.w (sp),d0
    1f64:	7200           	moveq #0,d1
    1f66:	3200           	move.w d0,d1
    1f68:	7000           	moveq #0,d0
    1f6a:	302f 002a      	move.w 42(sp),d0
    1f6e:	d080           	add.l d0,d0
    1f70:	d0af 001e      	add.l 30(sp),d0
    1f74:	2f01           	move.l d1,-(sp)
    1f76:	2f2f 001e      	move.l 30(sp),-(sp)
    1f7a:	2f00           	move.l d0,-(sp)
    1f7c:	4eba f298      	jsr 1216 <Zoom_ZoomBlit>(pc)
    1f80:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1f84:	7000           	moveq #0,d0
    1f86:	302f 0016      	move.w 22(sp),d0
    1f8a:	d080           	add.l d0,d0
    1f8c:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep;   
    1f90:	7200           	moveq #0,d1
    1f92:	322f 0016      	move.w 22(sp),d1
    1f96:	7000           	moveq #0,d0
    1f98:	302f 0018      	move.w 24(sp),d0
    1f9c:	d081           	add.l d1,d0
    1f9e:	d080           	add.l d0,d0
    1fa0:	d1af 001a      	add.l d0,26(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1fa4:	302f 0002      	move.w 2(sp),d0
    1fa8:	d040           	add.w d0,d0
    1faa:	906f 0002      	sub.w 2(sp),d0
    1fae:	0640 0012      	addi.w #18,d0
    1fb2:	33c0 001a dbdc 	move.w d0,1adbdc <ZoomHorizontal>
      while( linesleft > 0) {
    1fb8:	4a6f 0022      	tst.w 34(sp)
    1fbc:	6e00 ff12      	bgt.w 1ed0 <Zoom_ZoomIntoPicture+0x260>
      }
      shiftright--;  
    1fc0:	302f 0032      	move.w 50(sp),d0
    1fc4:	5340           	subq.w #1,d0
    1fc6:	3f40 0032      	move.w d0,50(sp)
      if(shiftright < 0) {
    1fca:	6a12           	bpl.s 1fde <Zoom_ZoomIntoPicture+0x36e>
        shiftright += 16;
    1fcc:	302f 0032      	move.w 50(sp),d0
    1fd0:	0640 0010      	addi.w #16,d0
    1fd4:	3f40 0032      	move.w d0,50(sp)
        shifttoleft = 1;
    1fd8:	3f7c 0001 002a 	move.w #1,42(sp)
      }
    }
    startofword -= 16;
    1fde:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    1fe4:	52af 0024      	addq.l #1,36(sp)
    1fe8:	7015           	moveq #21,d0
    1fea:	b0af 0024      	cmp.l 36(sp),d0
    1fee:	6c00 fd30      	bge.w 1d20 <Zoom_ZoomIntoPicture+0xb0>
  }
}
    1ff2:	4fef 0034      	lea 52(sp),sp
    1ff6:	4e75           	rts

00001ff8 <Zoom_SetBplPointers>:

void Zoom_SetBplPointers( UWORD *buffer, ULONG *copper) {
    1ff8:	4fef ffb0      	lea -80(sp),sp
  //                   0  1  1   1   1   0   1   1    1    1    0    1    1    0    1    1
  //int zoomoffset[] = { 0, 0, 42, 42, 84, 84, 84, 126, 126, 168, 168, 168, 210, 210, 210, 332};
  //int zoomoffset[] = { 252, 210, 210, 210, 168, 168, 168, 126, 126, 84, 84, 84, 42, 42, 0, 0 };
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
    1ffc:	204f           	movea.l sp,a0
    1ffe:	223c 0000 7f04 	move.l #32516,d1
    2004:	7040           	moveq #64,d0
    2006:	2f00           	move.l d0,-(sp)
    2008:	2f01           	move.l d1,-(sp)
    200a:	2f08           	move.l a0,-(sp)
    200c:	4eba 4f7c      	jsr 6f8a <memcpy>(pc)
    2010:	4fef 000c      	lea 12(sp),sp

  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
    2014:	3039 001a dbd8 	move.w 1adbd8 <Zoom_LevelOf102Zoom>,d0
    201a:	3000           	move.w d0,d0
    201c:	0280 0000 ffff 	andi.l #65535,d0
    2022:	d080           	add.l d0,d0
    2024:	d080           	add.l d0,d0
    2026:	41ef 0050      	lea 80(sp),a0
    202a:	d1c0           	adda.l d0,a0
    202c:	41e8 ffb0      	lea -80(a0),a0
    2030:	2010           	move.l (a0),d0
    2032:	d080           	add.l d0,d0
    2034:	d0af 0054      	add.l 84(sp),d0
    2038:	2f40 004c      	move.l d0,76(sp)
  /*ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;*/
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
    203c:	7072           	moveq #114,d0
    203e:	d0af 0058      	add.l 88(sp),d0
    2042:	2f40 0048      	move.l d0,72(sp)
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    2046:	42af 0044      	clr.l 68(sp)
    204a:	6036           	bra.s 2082 <Zoom_SetBplPointers+0x8a>
    UWORD highword = (ULONG)plane2set >> 16;
    204c:	202f 004c      	move.l 76(sp),d0
    2050:	4240           	clr.w d0
    2052:	4840           	swap d0
    2054:	3f40 0042      	move.w d0,66(sp)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    2058:	3f6f 004e 0040 	move.w 78(sp),64(sp)
    *posofcopper = highword;
    205e:	206f 0048      	movea.l 72(sp),a0
    2062:	30af 0042      	move.w 66(sp),(a0)
    posofcopper += 2;
    2066:	58af 0048      	addq.l #4,72(sp)
    *posofcopper = lowword;
    206a:	206f 0048      	movea.l 72(sp),a0
    206e:	30af 0040      	move.w 64(sp),(a0)
    posofcopper += 2;
    2072:	58af 0048      	addq.l #4,72(sp)
    plane2set += 42*268; //Next plane
    2076:	06af 0000 2bf8 	addi.l #11256,76(sp)
    207c:	004c 
  for(int i=0;i<ZMBPLDEPTH;i++) {
    207e:	52af 0044      	addq.l #1,68(sp)
    2082:	7004           	moveq #4,d0
    2084:	b0af 0044      	cmp.l 68(sp),d0
    2088:	6cc2           	bge.s 204c <Zoom_SetBplPointers+0x54>
  }
  
}
    208a:	4fef 0050      	lea 80(sp),sp
    208e:	4e75           	rts

00002090 <Zoom_SwapBuffers>:

void Zoom_SwapBuffers( UWORD zoomlevel) {
    2090:	598f           	subq.l #4,sp
    2092:	2f02           	move.l d2,-(sp)
    2094:	202f 000c      	move.l 12(sp),d0
    2098:	3000           	move.w d0,d0
    209a:	3f40 0006      	move.w d0,6(sp)
  ViewBuffer = framebuffer + (42*268*5*zoomlevel);
    209e:	2439 0000 ba7c 	move.l ba7c <framebuffer>,d2
    20a4:	7000           	moveq #0,d0
    20a6:	302f 0006      	move.w 6(sp),d0
    20aa:	2f3c 0000 dbd8 	move.l #56280,-(sp)
    20b0:	2f00           	move.l d0,-(sp)
    20b2:	4eb9 0000 72e8 	jsr 72e8 <__mulsi3>
    20b8:	508f           	addq.l #8,sp
    20ba:	d082           	add.l d2,d0
    20bc:	23c0 001a db80 	move.l d0,1adb80 <ViewBuffer>
  /*ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;*/
}
    20c2:	241f           	move.l (sp)+,d2
    20c4:	588f           	addq.l #4,sp
    20c6:	4e75           	rts

000020c8 <Test_Zoom2>:
#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
    20c8:	4fef ff00      	lea -256(sp),sp
    20cc:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  //Test Zoomlevel 1
  volatile ULONG *srcsmall = AllocMem( 80, MEMF_CHIP);
    20d0:	7050           	moveq #80,d0
    20d2:	2f40 00f0      	move.l d0,240(sp)
    20d6:	7002           	moveq #2,d0
    20d8:	2f40 00ec      	move.l d0,236(sp)
    20dc:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    20e2:	2c40           	movea.l d0,a6
    20e4:	202f 00f0      	move.l 240(sp),d0
    20e8:	222f 00ec      	move.l 236(sp),d1
    20ec:	4eae ff3a      	jsr -198(a6)
    20f0:	2f40 00e8      	move.l d0,232(sp)
    20f4:	202f 00e8      	move.l 232(sp),d0
    20f8:	2f40 00e4      	move.l d0,228(sp)
  if( srcsmall == 0) {
    20fc:	6646           	bne.s 2144 <Test_Zoom2+0x7c>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcsmall\n", 42);
    20fe:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2104:	2c40           	movea.l d0,a6
    2106:	4eae ffc4      	jsr -60(a6)
    210a:	2f40 001c      	move.l d0,28(sp)
    210e:	202f 001c      	move.l 28(sp),d0
    2112:	2f40 0018      	move.l d0,24(sp)
    2116:	2f7c 0000 7f44 	move.l #32580,20(sp)
    211c:	0014 
    211e:	702a           	moveq #42,d0
    2120:	2f40 0010      	move.l d0,16(sp)
    2124:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    212a:	2c40           	movea.l d0,a6
    212c:	222f 0018      	move.l 24(sp),d1
    2130:	242f 0014      	move.l 20(sp),d2
    2134:	262f 0010      	move.l 16(sp),d3
    2138:	4eae ffd0      	jsr -48(a6)
    213c:	2f40 000c      	move.l d0,12(sp)
    2140:	6000 0560      	bra.w 26a2 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong(srcsmall, 0xaaaaaaaa, 2, 10, 0);
    2144:	42a7           	clr.l -(sp)
    2146:	4878 000a      	pea a <_start+0xa>
    214a:	4878 0002      	pea 2 <_start+0x2>
    214e:	2f3c aaaa aaaa 	move.l #-1431655766,-(sp)
    2154:	2f2f 00f4      	move.l 244(sp),-(sp)
    2158:	4eba e116      	jsr 270 <Utils_FillLong>(pc)
    215c:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *srcbig = AllocMem( 160, MEMF_CHIP);
    2160:	2f7c 0000 00a0 	move.l #160,224(sp)
    2166:	00e0 
    2168:	7002           	moveq #2,d0
    216a:	2f40 00dc      	move.l d0,220(sp)
    216e:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    2174:	2c40           	movea.l d0,a6
    2176:	202f 00e0      	move.l 224(sp),d0
    217a:	222f 00dc      	move.l 220(sp),d1
    217e:	4eae ff3a      	jsr -198(a6)
    2182:	2f40 00d8      	move.l d0,216(sp)
    2186:	202f 00d8      	move.l 216(sp),d0
    218a:	2f40 00d4      	move.l d0,212(sp)
    if( srcbig == 0) {
    218e:	6646           	bne.s 21d6 <Test_Zoom2+0x10e>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcbig\n", 40);
    2190:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2196:	2c40           	movea.l d0,a6
    2198:	4eae ffc4      	jsr -60(a6)
    219c:	2f40 0030      	move.l d0,48(sp)
    21a0:	202f 0030      	move.l 48(sp),d0
    21a4:	2f40 002c      	move.l d0,44(sp)
    21a8:	2f7c 0000 7f6f 	move.l #32623,40(sp)
    21ae:	0028 
    21b0:	7028           	moveq #40,d0
    21b2:	2f40 0024      	move.l d0,36(sp)
    21b6:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    21bc:	2c40           	movea.l d0,a6
    21be:	222f 002c      	move.l 44(sp),d1
    21c2:	242f 0028      	move.l 40(sp),d2
    21c6:	262f 0024      	move.l 36(sp),d3
    21ca:	4eae ffd0      	jsr -48(a6)
    21ce:	2f40 0020      	move.l d0,32(sp)
    21d2:	6000 04ce      	bra.w 26a2 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong( srcbig, 0x55555555, 2, 20, 0);
    21d6:	42a7           	clr.l -(sp)
    21d8:	4878 0014      	pea 14 <_start+0x14>
    21dc:	4878 0002      	pea 2 <_start+0x2>
    21e0:	2f3c 5555 5555 	move.l #1431655765,-(sp)
    21e6:	2f2f 00e4      	move.l 228(sp),-(sp)
    21ea:	4eba e084      	jsr 270 <Utils_FillLong>(pc)
    21ee:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *target = AllocMem( 168, MEMF_CHIP);
    21f2:	2f7c 0000 00a8 	move.l #168,208(sp)
    21f8:	00d0 
    21fa:	7002           	moveq #2,d0
    21fc:	2f40 00cc      	move.l d0,204(sp)
    2200:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    2206:	2c40           	movea.l d0,a6
    2208:	202f 00d0      	move.l 208(sp),d0
    220c:	222f 00cc      	move.l 204(sp),d1
    2210:	4eae ff3a      	jsr -198(a6)
    2214:	2f40 00c8      	move.l d0,200(sp)
    2218:	202f 00c8      	move.l 200(sp),d0
    221c:	2f40 00c4      	move.l d0,196(sp)
  if( target == 0) {
    2220:	6646           	bne.s 2268 <Test_Zoom2+0x1a0>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
    2222:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2228:	2c40           	movea.l d0,a6
    222a:	4eae ffc4      	jsr -60(a6)
    222e:	2f40 0044      	move.l d0,68(sp)
    2232:	202f 0044      	move.l 68(sp),d0
    2236:	2f40 0040      	move.l d0,64(sp)
    223a:	2f7c 0000 7f98 	move.l #32664,60(sp)
    2240:	003c 
    2242:	7028           	moveq #40,d0
    2244:	2f40 0038      	move.l d0,56(sp)
    2248:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    224e:	2c40           	movea.l d0,a6
    2250:	222f 0040      	move.l 64(sp),d1
    2254:	242f 003c      	move.l 60(sp),d2
    2258:	262f 0038      	move.l 56(sp),d3
    225c:	4eae ffd0      	jsr -48(a6)
    2260:	2f40 0034      	move.l d0,52(sp)
    2264:	6000 043c      	bra.w 26a2 <Test_Zoom2+0x5da>
    return;
  }
  WaitBlt();
    2268:	4eba de4a      	jsr b4 <WaitBlt>(pc)
  hw->bltafwm = 0xffff;
    226c:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    2272:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2278:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    227e:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltdmod = 38;
    2284:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    228a:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcon1 = 1 << 12; //Shift src big
    2290:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    2296:	317c 1000 0042 	move.w #4096,66(a0)
  hw->bltcon0 = 0xde4; //Chanell settings and Shift src small
    229c:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    22a2:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltcdat = 0x8000; //Show channel small if 1 else channel big
    22a8:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    22ae:	317c 8000 0070 	move.w #-32768,112(a0)
  //srcbig-shift   0010 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sbbb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    22b4:	4878 0001      	pea 1 <_start+0x1>
    22b8:	4878 004e      	pea 4e <_start+0x4e>
    22bc:	4878 0026      	pea 26 <_start+0x26>
    22c0:	4878 0002      	pea 2 <_start+0x2>
    22c4:	2f2f 00d4      	move.l 212(sp),-(sp)
    22c8:	2f2f 00e8      	move.l 232(sp),-(sp)
    22cc:	2f2f 00fc      	move.l 252(sp),-(sp)
    22d0:	4eba efa8      	jsr 127a <Zoom_ZoomBlit2>(pc)
    22d4:	4fef 001c      	lea 28(sp),sp
  UWORD *tmp = (UWORD *)target;
    22d8:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    22de:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    22e4:	2c40           	movea.l d0,a6
    22e6:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    22ea:	42af 0104      	clr.l 260(sp)
    22ee:	605c           	bra.s 234c <Test_Zoom2+0x284>
    if( *tmp != 0xaaaa ) {
    22f0:	206f 0108      	movea.l 264(sp),a0
    22f4:	3010           	move.w (a0),d0
    22f6:	0c40 aaaa      	cmpi.w #-21846,d0
    22fa:	6746           	beq.s 2342 <Test_Zoom2+0x27a>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 1 failed\n", 40);
    22fc:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2302:	2c40           	movea.l d0,a6
    2304:	4eae ffc4      	jsr -60(a6)
    2308:	2f40 0058      	move.l d0,88(sp)
    230c:	202f 0058      	move.l 88(sp),d0
    2310:	2f40 0054      	move.l d0,84(sp)
    2314:	2f7c 0000 7fc1 	move.l #32705,80(sp)
    231a:	0050 
    231c:	7028           	moveq #40,d0
    231e:	2f40 004c      	move.l d0,76(sp)
    2322:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2328:	2c40           	movea.l d0,a6
    232a:	222f 0054      	move.l 84(sp),d1
    232e:	242f 0050      	move.l 80(sp),d2
    2332:	262f 004c      	move.l 76(sp),d3
    2336:	4eae ffd0      	jsr -48(a6)
    233a:	2f40 0048      	move.l d0,72(sp)
    233e:	6000 0362      	bra.w 26a2 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    2342:	7028           	moveq #40,d0
    2344:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2348:	52af 0104      	addq.l #1,260(sp)
    234c:	7001           	moveq #1,d0
    234e:	b0af 0104      	cmp.l 260(sp),d0
    2352:	6c9c           	bge.s 22f0 <Test_Zoom2+0x228>
  //srcbig-shift   0001 0101 0101 0101
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       ssbb bbbb bbbb bbbb
  //result:        1001 0101 0101 0101

  hw->bltcon1 = 2 << 12; //Shift src big
    2354:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    235a:	317c 2000 0042 	move.w #8192,66(a0)
  hw->bltcdat = 0xc000; //Show channel small if 1 else channel big
    2360:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    2366:	317c c000 0070 	move.w #-16384,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    236c:	4878 0001      	pea 1 <_start+0x1>
    2370:	4878 004e      	pea 4e <_start+0x4e>
    2374:	4878 0026      	pea 26 <_start+0x26>
    2378:	4878 0002      	pea 2 <_start+0x2>
    237c:	2f2f 00d4      	move.l 212(sp),-(sp)
    2380:	2f2f 00e8      	move.l 232(sp),-(sp)
    2384:	2f2f 00fc      	move.l 252(sp),-(sp)
    2388:	4eba eef0      	jsr 127a <Zoom_ZoomBlit2>(pc)
    238c:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2390:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2396:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    239c:	2c40           	movea.l d0,a6
    239e:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    23a2:	42af 0100      	clr.l 256(sp)
    23a6:	605c           	bra.s 2404 <Test_Zoom2+0x33c>
    if( *tmp != 0x9555 ) {
    23a8:	206f 0108      	movea.l 264(sp),a0
    23ac:	3010           	move.w (a0),d0
    23ae:	0c40 9555      	cmpi.w #-27307,d0
    23b2:	6746           	beq.s 23fa <Test_Zoom2+0x332>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 2 failed\n", 40);
    23b4:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    23ba:	2c40           	movea.l d0,a6
    23bc:	4eae ffc4      	jsr -60(a6)
    23c0:	2f40 006c      	move.l d0,108(sp)
    23c4:	202f 006c      	move.l 108(sp),d0
    23c8:	2f40 0068      	move.l d0,104(sp)
    23cc:	2f7c 0000 7fea 	move.l #32746,100(sp)
    23d2:	0064 
    23d4:	7028           	moveq #40,d0
    23d6:	2f40 0060      	move.l d0,96(sp)
    23da:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    23e0:	2c40           	movea.l d0,a6
    23e2:	222f 0068      	move.l 104(sp),d1
    23e6:	242f 0064      	move.l 100(sp),d2
    23ea:	262f 0060      	move.l 96(sp),d3
    23ee:	4eae ffd0      	jsr -48(a6)
    23f2:	2f40 005c      	move.l d0,92(sp)
    23f6:	6000 02aa      	bra.w 26a2 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    23fa:	7028           	moveq #40,d0
    23fc:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2400:	52af 0100      	addq.l #1,256(sp)
    2404:	7001           	moveq #1,d0
    2406:	b0af 0100      	cmp.l 256(sp),d0
    240a:	6c9c           	bge.s 23a8 <Test_Zoom2+0x2e0>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    240c:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    2412:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    2418:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    241e:	317c e000 0070 	move.w #-8192,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2424:	4878 0001      	pea 1 <_start+0x1>
    2428:	4878 004e      	pea 4e <_start+0x4e>
    242c:	4878 0026      	pea 26 <_start+0x26>
    2430:	4878 0002      	pea 2 <_start+0x2>
    2434:	2f2f 00d4      	move.l 212(sp),-(sp)
    2438:	2f2f 00e8      	move.l 232(sp),-(sp)
    243c:	2f2f 00fc      	move.l 252(sp),-(sp)
    2440:	4eba ee38      	jsr 127a <Zoom_ZoomBlit2>(pc)
    2444:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2448:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    244e:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    2454:	2c40           	movea.l d0,a6
    2456:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    245a:	42af 00fc      	clr.l 252(sp)
    245e:	605c           	bra.s 24bc <Test_Zoom2+0x3f4>
    if( *tmp != 0xaaaa ) {
    2460:	206f 0108      	movea.l 264(sp),a0
    2464:	3010           	move.w (a0),d0
    2466:	0c40 aaaa      	cmpi.w #-21846,d0
    246a:	6746           	beq.s 24b2 <Test_Zoom2+0x3ea>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    246c:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2472:	2c40           	movea.l d0,a6
    2474:	4eae ffc4      	jsr -60(a6)
    2478:	2f40 0080      	move.l d0,128(sp)
    247c:	202f 0080      	move.l 128(sp),d0
    2480:	2f40 007c      	move.l d0,124(sp)
    2484:	2f7c 0000 8013 	move.l #32787,120(sp)
    248a:	0078 
    248c:	7028           	moveq #40,d0
    248e:	2f40 0074      	move.l d0,116(sp)
    2492:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2498:	2c40           	movea.l d0,a6
    249a:	222f 007c      	move.l 124(sp),d1
    249e:	242f 0078      	move.l 120(sp),d2
    24a2:	262f 0074      	move.l 116(sp),d3
    24a6:	4eae ffd0      	jsr -48(a6)
    24aa:	2f40 0070      	move.l d0,112(sp)
    24ae:	6000 01f2      	bra.w 26a2 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    24b2:	7028           	moveq #40,d0
    24b4:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    24b8:	52af 00fc      	addq.l #1,252(sp)
    24bc:	7001           	moveq #1,d0
    24be:	b0af 00fc      	cmp.l 252(sp),d0
    24c2:	6c9c           	bge.s 2460 <Test_Zoom2+0x398>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    24c4:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    24ca:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    24d0:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    24d6:	317c e000 0070 	move.w #-8192,112(a0)

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    24dc:	4878 0001      	pea 1 <_start+0x1>
    24e0:	4878 004e      	pea 4e <_start+0x4e>
    24e4:	4878 0026      	pea 26 <_start+0x26>
    24e8:	4878 0002      	pea 2 <_start+0x2>
    24ec:	2f2f 00d4      	move.l 212(sp),-(sp)
    24f0:	2f2f 00e8      	move.l 232(sp),-(sp)
    24f4:	2f2f 00fc      	move.l 252(sp),-(sp)
    24f8:	4eba ed80      	jsr 127a <Zoom_ZoomBlit2>(pc)
    24fc:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2500:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2506:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    250c:	2c40           	movea.l d0,a6
    250e:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2512:	42af 00f8      	clr.l 248(sp)
    2516:	605c           	bra.s 2574 <Test_Zoom2+0x4ac>
    if( *tmp != 0xaaaa ) {
    2518:	206f 0108      	movea.l 264(sp),a0
    251c:	3010           	move.w (a0),d0
    251e:	0c40 aaaa      	cmpi.w #-21846,d0
    2522:	6746           	beq.s 256a <Test_Zoom2+0x4a2>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    2524:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    252a:	2c40           	movea.l d0,a6
    252c:	4eae ffc4      	jsr -60(a6)
    2530:	2f40 0094      	move.l d0,148(sp)
    2534:	202f 0094      	move.l 148(sp),d0
    2538:	2f40 0090      	move.l d0,144(sp)
    253c:	2f7c 0000 8013 	move.l #32787,140(sp)
    2542:	008c 
    2544:	7028           	moveq #40,d0
    2546:	2f40 0088      	move.l d0,136(sp)
    254a:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2550:	2c40           	movea.l d0,a6
    2552:	222f 0090      	move.l 144(sp),d1
    2556:	242f 008c      	move.l 140(sp),d2
    255a:	262f 0088      	move.l 136(sp),d3
    255e:	4eae ffd0      	jsr -48(a6)
    2562:	2f40 0084      	move.l d0,132(sp)
    2566:	6000 013a      	bra.w 26a2 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    256a:	7028           	moveq #40,d0
    256c:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2570:	52af 00f8      	addq.l #1,248(sp)
    2574:	7001           	moveq #1,d0
    2576:	b0af 00f8      	cmp.l 248(sp),d0
    257a:	6c9c           	bge.s 2518 <Test_Zoom2+0x450>
  //srcsmall:            1010 1010 1010 1010
  //srcsmall-shift:      0101 0101 0101 0101
  //pattern:             sssb bbbb bbbb bbbb
  //result:              0100 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    257c:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    2582:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    2588:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    258e:	317c e000 0070 	move.w #-8192,112(a0)
  hw->bltcon0 = 0xde4 + (1 << 12); //Chanell settings and Shift src small
    2594:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    259a:	317c 1de4 0040 	move.w #7652,64(a0)
 
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    25a0:	4878 0001      	pea 1 <_start+0x1>
    25a4:	4878 004e      	pea 4e <_start+0x4e>
    25a8:	4878 0026      	pea 26 <_start+0x26>
    25ac:	4878 0002      	pea 2 <_start+0x2>
    25b0:	2f2f 00d4      	move.l 212(sp),-(sp)
    25b4:	2f2f 00e8      	move.l 232(sp),-(sp)
    25b8:	2f2f 00fc      	move.l 252(sp),-(sp)
    25bc:	4eba ecbc      	jsr 127a <Zoom_ZoomBlit2>(pc)
    25c0:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    25c4:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    25ca:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    25d0:	2c40           	movea.l d0,a6
    25d2:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    25d6:	42af 00f4      	clr.l 244(sp)
    25da:	605a           	bra.s 2636 <Test_Zoom2+0x56e>
    if( *tmp != 0x4aaa ) {
    25dc:	206f 0108      	movea.l 264(sp),a0
    25e0:	3010           	move.w (a0),d0
    25e2:	0c40 4aaa      	cmpi.w #19114,d0
    25e6:	6744           	beq.s 262c <Test_Zoom2+0x564>
      Write( Output(), "Test_Zoom2: Test for shifting a failed\n", 39);
    25e8:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    25ee:	2c40           	movea.l d0,a6
    25f0:	4eae ffc4      	jsr -60(a6)
    25f4:	2f40 00a8      	move.l d0,168(sp)
    25f8:	202f 00a8      	move.l 168(sp),d0
    25fc:	2f40 00a4      	move.l d0,164(sp)
    2600:	2f7c 0000 803c 	move.l #32828,160(sp)
    2606:	00a0 
    2608:	7027           	moveq #39,d0
    260a:	2f40 009c      	move.l d0,156(sp)
    260e:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2614:	2c40           	movea.l d0,a6
    2616:	222f 00a4      	move.l 164(sp),d1
    261a:	242f 00a0      	move.l 160(sp),d2
    261e:	262f 009c      	move.l 156(sp),d3
    2622:	4eae ffd0      	jsr -48(a6)
    2626:	2f40 0098      	move.l d0,152(sp)
    262a:	6076           	bra.s 26a2 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    262c:	7028           	moveq #40,d0
    262e:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2632:	52af 00f4      	addq.l #1,244(sp)
    2636:	7001           	moveq #1,d0
    2638:	b0af 00f4      	cmp.l 244(sp),d0
    263c:	6c9e           	bge.s 25dc <Test_Zoom2+0x514>

  FreeMem( srcsmall, 80);
    263e:	2f6f 00e4 00c0 	move.l 228(sp),192(sp)
    2644:	7050           	moveq #80,d0
    2646:	2f40 00bc      	move.l d0,188(sp)
    264a:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    2650:	2c40           	movea.l d0,a6
    2652:	226f 00c0      	movea.l 192(sp),a1
    2656:	202f 00bc      	move.l 188(sp),d0
    265a:	4eae ff2e      	jsr -210(a6)
  FreeMem( srcbig, 160);
    265e:	2f6f 00d4 00b8 	move.l 212(sp),184(sp)
    2664:	2f7c 0000 00a0 	move.l #160,180(sp)
    266a:	00b4 
    266c:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    2672:	2c40           	movea.l d0,a6
    2674:	226f 00b8      	movea.l 184(sp),a1
    2678:	202f 00b4      	move.l 180(sp),d0
    267c:	4eae ff2e      	jsr -210(a6)
  FreeMem( target, 168);
    2680:	2f6f 00c4 00b0 	move.l 196(sp),176(sp)
    2686:	2f7c 0000 00a8 	move.l #168,172(sp)
    268c:	00ac 
    268e:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    2694:	2c40           	movea.l d0,a6
    2696:	226f 00b0      	movea.l 176(sp),a1
    269a:	202f 00ac      	move.l 172(sp),d0
    269e:	4eae ff2e      	jsr -210(a6)
    26a2:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    26a6:	4fef 0100      	lea 256(sp),sp
    26aa:	4e75           	rts

000026ac <ClBuild>:
#include "utils.h"




ULONG * ClBuild() {
    26ac:	4fef ffc4      	lea -60(sp),sp
    26b0:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
    26b4:	2f7c 0000 0084 	move.l #132,48(sp)
    26ba:	0030 
    26bc:	7002           	moveq #2,d0
    26be:	2f40 002c      	move.l d0,44(sp)
    26c2:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    26c8:	2c40           	movea.l d0,a6
    26ca:	202f 0030      	move.l 48(sp),d0
    26ce:	222f 002c      	move.l 44(sp),d1
    26d2:	4eae ff3a      	jsr -198(a6)
    26d6:	2f40 0028      	move.l d0,40(sp)
    26da:	202f 0028      	move.l 40(sp),d0
    26de:	2f40 0024      	move.l d0,36(sp)
  if( retval == 0) {
    26e2:	6658           	bne.s 273c <ClBuild+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    26e4:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    26ea:	2c40           	movea.l d0,a6
    26ec:	4eae ffc4      	jsr -60(a6)
    26f0:	2f40 0020      	move.l d0,32(sp)
    26f4:	202f 0020      	move.l 32(sp),d0
    26f8:	2f40 001c      	move.l d0,28(sp)
    26fc:	2f7c 0000 7ecf 	move.l #32463,24(sp)
    2702:	0018 
    2704:	7228           	moveq #40,d1
    2706:	2f41 0014      	move.l d1,20(sp)
    270a:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2710:	2c40           	movea.l d0,a6
    2712:	222f 001c      	move.l 28(sp),d1
    2716:	242f 0018      	move.l 24(sp),d2
    271a:	262f 0014      	move.l 20(sp),d3
    271e:	4eae ffd0      	jsr -48(a6)
    2722:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    2726:	7401           	moveq #1,d2
    2728:	2f42 000c      	move.l d2,12(sp)
    272c:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2732:	2c40           	movea.l d0,a6
    2734:	222f 000c      	move.l 12(sp),d1
    2738:	4eae ff70      	jsr -144(a6)
  }
    
  ULONG *cl = retval;
    273c:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    2742:	2f7c 0000 a868 	move.l #43112,64(sp)
    2748:	0040 
  for(int i=0; i<16;i++)
    274a:	42af 003c      	clr.l 60(sp)
    274e:	6024           	bra.s 2774 <ClBuild+0xc8>
    *cl++ = *clpartinstruction++;
    2750:	222f 0040      	move.l 64(sp),d1
    2754:	2001           	move.l d1,d0
    2756:	5880           	addq.l #4,d0
    2758:	2f40 0040      	move.l d0,64(sp)
    275c:	202f 0044      	move.l 68(sp),d0
    2760:	2400           	move.l d0,d2
    2762:	5882           	addq.l #4,d2
    2764:	2f42 0044      	move.l d2,68(sp)
    2768:	2041           	movea.l d1,a0
    276a:	2210           	move.l (a0),d1
    276c:	2040           	movea.l d0,a0
    276e:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    2770:	52af 003c      	addq.l #1,60(sp)
    2774:	700f           	moveq #15,d0
    2776:	b0af 003c      	cmp.l 60(sp),d0
    277a:	6cd4           	bge.s 2750 <ClBuild+0xa4>
  clpartinstruction = ClScreen;
    277c:	2f7c 0000 a8a8 	move.l #43176,64(sp)
    2782:	0040 
  for(int i=0; i<12;i++)
    2784:	42af 0038      	clr.l 56(sp)
    2788:	6024           	bra.s 27ae <ClBuild+0x102>
    *cl++ = *clpartinstruction++;
    278a:	222f 0040      	move.l 64(sp),d1
    278e:	2401           	move.l d1,d2
    2790:	5882           	addq.l #4,d2
    2792:	2f42 0040      	move.l d2,64(sp)
    2796:	202f 0044      	move.l 68(sp),d0
    279a:	2400           	move.l d0,d2
    279c:	5882           	addq.l #4,d2
    279e:	2f42 0044      	move.l d2,68(sp)
    27a2:	2041           	movea.l d1,a0
    27a4:	2210           	move.l (a0),d1
    27a6:	2040           	movea.l d0,a0
    27a8:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    27aa:	52af 0038      	addq.l #1,56(sp)
    27ae:	700b           	moveq #11,d0
    27b0:	b0af 0038      	cmp.l 56(sp),d0
    27b4:	6cd4           	bge.s 278a <ClBuild+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    27b6:	202f 0044      	move.l 68(sp),d0
    27ba:	2200           	move.l d0,d1
    27bc:	5881           	addq.l #4,d1
    27be:	2f41 0044      	move.l d1,68(sp)
    27c2:	2040           	movea.l d0,a0
    27c4:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    27ca:	202f 0044      	move.l 68(sp),d0
    27ce:	2200           	move.l d0,d1
    27d0:	5881           	addq.l #4,d1
    27d2:	2f41 0044      	move.l d1,68(sp)
    27d6:	2040           	movea.l d0,a0
    27d8:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
    27de:	2f7c 0000 a7e8 	move.l #42984,64(sp)
    27e4:	0040 
  for(int i=0; i<2;i++)
    27e6:	42af 0034      	clr.l 52(sp)
    27ea:	6024           	bra.s 2810 <ClBuild+0x164>
    *cl++ = *clpartinstruction++;
    27ec:	222f 0040      	move.l 64(sp),d1
    27f0:	2001           	move.l d1,d0
    27f2:	5880           	addq.l #4,d0
    27f4:	2f40 0040      	move.l d0,64(sp)
    27f8:	202f 0044      	move.l 68(sp),d0
    27fc:	2400           	move.l d0,d2
    27fe:	5882           	addq.l #4,d2
    2800:	2f42 0044      	move.l d2,68(sp)
    2804:	2041           	movea.l d1,a0
    2806:	2210           	move.l (a0),d1
    2808:	2040           	movea.l d0,a0
    280a:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
    280c:	52af 0034      	addq.l #1,52(sp)
    2810:	7001           	moveq #1,d0
    2812:	b0af 0034      	cmp.l 52(sp),d0
    2816:	6cd4           	bge.s 27ec <ClBuild+0x140>
  *cl = 0xfffffffe;
    2818:	206f 0044      	movea.l 68(sp),a0
    281c:	72fe           	moveq #-2,d1
    281e:	2081           	move.l d1,(a0)

  return retval;
    2820:	202f 0024      	move.l 36(sp),d0
}
    2824:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2828:	4fef 003c      	lea 60(sp),sp
    282c:	4e75           	rts

0000282e <PrepareDisplay>:

int PrepareDisplay() {
    282e:	4fef ffb8      	lea -72(sp),sp
    2832:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClBuild( );
    2836:	4eba fe74      	jsr 26ac <ClBuild>(pc)
    283a:	23c0 001a db74 	move.l d0,1adb74 <Copperlist1>
  Copperlist2 = ClBuild( );
    2840:	4eba fe6a      	jsr 26ac <ClBuild>(pc)
    2844:	23c0 001a db78 	move.l d0,1adb78 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    284a:	2f7c 0000 c800 	move.l #51200,80(sp)
    2850:	0050 
    2852:	7002           	moveq #2,d0
    2854:	2f40 004c      	move.l d0,76(sp)
    2858:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    285e:	2c40           	movea.l d0,a6
    2860:	202f 0050      	move.l 80(sp),d0
    2864:	222f 004c      	move.l 76(sp),d1
    2868:	4eae ff3a      	jsr -198(a6)
    286c:	2f40 0048      	move.l d0,72(sp)
    2870:	202f 0048      	move.l 72(sp),d0
    2874:	23c0 001a db6c 	move.l d0,1adb6c <Bitplane1>
  if(Bitplane1 == 0) {
    287a:	2039 001a db6c 	move.l 1adb6c <Bitplane1>,d0
    2880:	6658           	bne.s 28da <PrepareDisplay+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2882:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2888:	2c40           	movea.l d0,a6
    288a:	4eae ffc4      	jsr -60(a6)
    288e:	2f40 0044      	move.l d0,68(sp)
    2892:	202f 0044      	move.l 68(sp),d0
    2896:	2f40 0040      	move.l d0,64(sp)
    289a:	2f7c 0000 7e81 	move.l #32385,60(sp)
    28a0:	003c 
    28a2:	7026           	moveq #38,d0
    28a4:	2f40 0038      	move.l d0,56(sp)
    28a8:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    28ae:	2c40           	movea.l d0,a6
    28b0:	222f 0040      	move.l 64(sp),d1
    28b4:	242f 003c      	move.l 60(sp),d2
    28b8:	262f 0038      	move.l 56(sp),d3
    28bc:	4eae ffd0      	jsr -48(a6)
    28c0:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    28c4:	7001           	moveq #1,d0
    28c6:	2f40 0030      	move.l d0,48(sp)
    28ca:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    28d0:	2c40           	movea.l d0,a6
    28d2:	222f 0030      	move.l 48(sp),d1
    28d6:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane1;
    28da:	2039 001a db6c 	move.l 1adb6c <Bitplane1>,d0
    28e0:	23c0 001a db80 	move.l d0,1adb80 <ViewBuffer>
  ViewCopper = Copperlist1;
    28e6:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    28ec:	23c0 001a db88 	move.l d0,1adb88 <ViewCopper>
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    28f2:	2f7c 0000 c800 	move.l #51200,44(sp)
    28f8:	002c 
    28fa:	7002           	moveq #2,d0
    28fc:	2f40 0028      	move.l d0,40(sp)
    2900:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    2906:	2c40           	movea.l d0,a6
    2908:	202f 002c      	move.l 44(sp),d0
    290c:	222f 0028      	move.l 40(sp),d1
    2910:	4eae ff3a      	jsr -198(a6)
    2914:	2f40 0024      	move.l d0,36(sp)
    2918:	202f 0024      	move.l 36(sp),d0
    291c:	23c0 001a db70 	move.l d0,1adb70 <Bitplane2>
  if(Bitplane2 == 0) {
    2922:	2039 001a db70 	move.l 1adb70 <Bitplane2>,d0
    2928:	6658           	bne.s 2982 <PrepareDisplay+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    292a:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2930:	2c40           	movea.l d0,a6
    2932:	4eae ffc4      	jsr -60(a6)
    2936:	2f40 0020      	move.l d0,32(sp)
    293a:	202f 0020      	move.l 32(sp),d0
    293e:	2f40 001c      	move.l d0,28(sp)
    2942:	2f7c 0000 7ea8 	move.l #32424,24(sp)
    2948:	0018 
    294a:	7026           	moveq #38,d0
    294c:	2f40 0014      	move.l d0,20(sp)
    2950:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2956:	2c40           	movea.l d0,a6
    2958:	222f 001c      	move.l 28(sp),d1
    295c:	242f 0018      	move.l 24(sp),d2
    2960:	262f 0014      	move.l 20(sp),d3
    2964:	4eae ffd0      	jsr -48(a6)
    2968:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    296c:	7001           	moveq #1,d0
    296e:	2f40 000c      	move.l d0,12(sp)
    2972:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2978:	2c40           	movea.l d0,a6
    297a:	222f 000c      	move.l 12(sp),d1
    297e:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane2;
    2982:	2039 001a db70 	move.l 1adb70 <Bitplane2>,d0
    2988:	23c0 001a db7c 	move.l d0,1adb7c <DrawBuffer>
  DrawCopper = Copperlist2;
    298e:	2039 001a db78 	move.l 1adb78 <Copperlist2>,d0
    2994:	23c0 001a db84 	move.l d0,1adb84 <DrawCopper>
  /*SwapCl();
  SetBplPointers();
  SwapCl();
  SetBplPointers();*/
  return 0;
    299a:	7000           	moveq #0,d0
}
    299c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    29a0:	4fef 0048      	lea 72(sp),sp
    29a4:	4e75           	rts

000029a6 <TestCopperlistBatch>:

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                  long length) {
    29a6:	598f           	subq.l #4,sp
  for( int i=0;i<length;i++)
    29a8:	4297           	clr.l (sp)
    29aa:	602a           	bra.s 29d6 <TestCopperlistBatch+0x30>
    if( instructions[ pos+i] != batch[ i])
    29ac:	202f 000c      	move.l 12(sp),d0
    29b0:	d097           	add.l (sp),d0
    29b2:	d080           	add.l d0,d0
    29b4:	d080           	add.l d0,d0
    29b6:	206f 0008      	movea.l 8(sp),a0
    29ba:	d1c0           	adda.l d0,a0
    29bc:	2210           	move.l (a0),d1
    29be:	2017           	move.l (sp),d0
    29c0:	d080           	add.l d0,d0
    29c2:	d080           	add.l d0,d0
    29c4:	206f 0010      	movea.l 16(sp),a0
    29c8:	d1c0           	adda.l d0,a0
    29ca:	2010           	move.l (a0),d0
    29cc:	b081           	cmp.l d1,d0
    29ce:	6704           	beq.s 29d4 <TestCopperlistBatch+0x2e>
      return 0;
    29d0:	7000           	moveq #0,d0
    29d2:	600c           	bra.s 29e0 <TestCopperlistBatch+0x3a>
  for( int i=0;i<length;i++)
    29d4:	5297           	addq.l #1,(sp)
    29d6:	2017           	move.l (sp),d0
    29d8:	b0af 0014      	cmp.l 20(sp),d0
    29dc:	6dce           	blt.s 29ac <TestCopperlistBatch+0x6>
  return 1;
    29de:	7001           	moveq #1,d0
}
    29e0:	588f           	addq.l #4,sp
    29e2:	4e75           	rts

000029e4 <TestCopperlistPos>:

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    29e4:	202f 0008      	move.l 8(sp),d0
    29e8:	d080           	add.l d0,d0
    29ea:	d080           	add.l d0,d0
    29ec:	206f 0004      	movea.l 4(sp),a0
    29f0:	d1c0           	adda.l d0,a0
    29f2:	2010           	move.l (a0),d0
    29f4:	b0af 000c      	cmp.l 12(sp),d0
    29f8:	6604           	bne.s 29fe <TestCopperlistPos+0x1a>
    return 1;
    29fa:	7001           	moveq #1,d0
    29fc:	6002           	bra.s 2a00 <TestCopperlistPos+0x1c>
  else 
    return 0;
    29fe:	7000           	moveq #0,d0
}
    2a00:	4e75           	rts

00002a02 <TestCopperList>:

void TestCopperList() {
    2a02:	4fef feb8      	lea -328(sp),sp
    2a06:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Write( Output(), "%d", hw->cop1lc);
    2a0a:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2a10:	2c40           	movea.l d0,a6
    2a12:	4eae ffc4      	jsr -60(a6)
    2a16:	2f40 0150      	move.l d0,336(sp)
    2a1a:	202f 0150      	move.l 336(sp),d0
    2a1e:	2f40 014c      	move.l d0,332(sp)
    2a22:	2f7c 0000 8064 	move.l #32868,328(sp)
    2a28:	0148 
    2a2a:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    2a30:	2028 0080      	move.l 128(a0),d0
    2a34:	2f40 0144      	move.l d0,324(sp)
    2a38:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2a3e:	2c40           	movea.l d0,a6
    2a40:	222f 014c      	move.l 332(sp),d1
    2a44:	242f 0148      	move.l 328(sp),d2
    2a48:	262f 0144      	move.l 324(sp),d3
    2a4c:	4eae ffd0      	jsr -48(a6)
    2a50:	2f40 0140      	move.l d0,320(sp)
  Copperlist1 = ClBuild();
    2a54:	4eba fc56      	jsr 26ac <ClBuild>(pc)
    2a58:	23c0 001a db74 	move.l d0,1adb74 <Copperlist1>
  DrawCopper = Copperlist1;
    2a5e:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    2a64:	23c0 001a db84 	move.l d0,1adb84 <DrawCopper>
  Copperlist2 = ClBuild();
    2a6a:	4eba fc40      	jsr 26ac <ClBuild>(pc)
    2a6e:	23c0 001a db78 	move.l d0,1adb78 <Copperlist2>
  ViewCopper = Copperlist2;
    2a74:	2039 001a db78 	move.l 1adb78 <Copperlist2>,d0
    2a7a:	23c0 001a db88 	move.l d0,1adb88 <ViewCopper>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2a80:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    2a86:	4878 0010      	pea 10 <_start+0x10>
    2a8a:	4879 0000 a868 	pea a868 <ClsSprites>
    2a90:	42a7           	clr.l -(sp)
    2a92:	2f00           	move.l d0,-(sp)
    2a94:	4eba ff10      	jsr 29a6 <TestCopperlistBatch>(pc)
    2a98:	4fef 0010      	lea 16(sp),sp
    2a9c:	4a80           	tst.l d0
    2a9e:	6642           	bne.s 2ae2 <TestCopperList+0xe0>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    2aa0:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2aa6:	2c40           	movea.l d0,a6
    2aa8:	4eae ffc4      	jsr -60(a6)
    2aac:	2f40 013c      	move.l d0,316(sp)
    2ab0:	202f 013c      	move.l 316(sp),d0
    2ab4:	2f40 0138      	move.l d0,312(sp)
    2ab8:	2f7c 0000 77ec 	move.l #30700,308(sp)
    2abe:	0134 
    2ac0:	702c           	moveq #44,d0
    2ac2:	2f40 0130      	move.l d0,304(sp)
    2ac6:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2acc:	2c40           	movea.l d0,a6
    2ace:	222f 0138      	move.l 312(sp),d1
    2ad2:	242f 0134      	move.l 308(sp),d2
    2ad6:	262f 0130      	move.l 304(sp),d3
    2ada:	4eae ffd0      	jsr -48(a6)
    2ade:	2f40 012c      	move.l d0,300(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2ae2:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    2ae8:	4878 000c      	pea c <_start+0xc>
    2aec:	4879 0000 a8a8 	pea a8a8 <ClScreen>
    2af2:	4878 0010      	pea 10 <_start+0x10>
    2af6:	2f00           	move.l d0,-(sp)
    2af8:	4eba feac      	jsr 29a6 <TestCopperlistBatch>(pc)
    2afc:	4fef 0010      	lea 16(sp),sp
    2b00:	4a80           	tst.l d0
    2b02:	6642           	bne.s 2b46 <TestCopperList+0x144>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    2b04:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2b0a:	2c40           	movea.l d0,a6
    2b0c:	4eae ffc4      	jsr -60(a6)
    2b10:	2f40 0128      	move.l d0,296(sp)
    2b14:	202f 0128      	move.l 296(sp),d0
    2b18:	2f40 0124      	move.l d0,292(sp)
    2b1c:	2f7c 0000 7822 	move.l #30754,288(sp)
    2b22:	0120 
    2b24:	7036           	moveq #54,d0
    2b26:	2f40 011c      	move.l d0,284(sp)
    2b2a:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2b30:	2c40           	movea.l d0,a6
    2b32:	222f 0124      	move.l 292(sp),d1
    2b36:	242f 0120      	move.l 288(sp),d2
    2b3a:	262f 011c      	move.l 284(sp),d3
    2b3e:	4eae ffd0      	jsr -48(a6)
    2b42:	2f40 0118      	move.l d0,280(sp)
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
    2b46:	23fc 0004 0000 	move.l #262144,1adb7c <DrawBuffer>
    2b4c:	001a db7c 
  ViewBuffer = (ULONG *)0x50000;
    2b50:	23fc 0005 0000 	move.l #327680,1adb80 <ViewBuffer>
    2b56:	001a db80 
  
  SetBplPointers();
    2b5a:	4eba d63a      	jsr 196 <SetBplPointers>(pc)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    2b5e:	2039 001a db7c 	move.l 1adb7c <DrawBuffer>,d0
    2b64:	0c80 0005 0000 	cmpi.l #327680,d0
    2b6a:	660e           	bne.s 2b7a <TestCopperList+0x178>
    2b6c:	2039 001a db80 	move.l 1adb80 <ViewBuffer>,d0
    2b72:	0c80 0004 0000 	cmpi.l #262144,d0
    2b78:	6742           	beq.s 2bbc <TestCopperList+0x1ba>
    Write( Output(), 
    2b7a:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2b80:	2c40           	movea.l d0,a6
    2b82:	4eae ffc4      	jsr -60(a6)
    2b86:	2f40 0114      	move.l d0,276(sp)
    2b8a:	202f 0114      	move.l 276(sp),d0
    2b8e:	2f40 0110      	move.l d0,272(sp)
    2b92:	2f7c 0000 8067 	move.l #32871,268(sp)
    2b98:	010c 
    2b9a:	703b           	moveq #59,d0
    2b9c:	2f40 0108      	move.l d0,264(sp)
    2ba0:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2ba6:	2c40           	movea.l d0,a6
    2ba8:	222f 0110      	move.l 272(sp),d1
    2bac:	242f 010c      	move.l 268(sp),d2
    2bb0:	262f 0108      	move.l 264(sp),d3
    2bb4:	4eae ffd0      	jsr -48(a6)
    2bb8:	2f40 0104      	move.l d0,260(sp)
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    2bbc:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    2bc2:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    2bc8:	4878 001c      	pea 1c <_start+0x1c>
    2bcc:	2f00           	move.l d0,-(sp)
    2bce:	4eba fe14      	jsr 29e4 <TestCopperlistPos>(pc)
    2bd2:	4fef 000c      	lea 12(sp),sp
    2bd6:	4a80           	tst.l d0
    2bd8:	6642           	bne.s 2c1c <TestCopperList+0x21a>
    Write(Output(), 
    2bda:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2be0:	2c40           	movea.l d0,a6
    2be2:	4eae ffc4      	jsr -60(a6)
    2be6:	2f40 0100      	move.l d0,256(sp)
    2bea:	202f 0100      	move.l 256(sp),d0
    2bee:	2f40 00fc      	move.l d0,252(sp)
    2bf2:	2f7c 0000 80a3 	move.l #32931,248(sp)
    2bf8:	00f8 
    2bfa:	703c           	moveq #60,d0
    2bfc:	2f40 00f4      	move.l d0,244(sp)
    2c00:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2c06:	2c40           	movea.l d0,a6
    2c08:	222f 00fc      	move.l 252(sp),d1
    2c0c:	242f 00f8      	move.l 248(sp),d2
    2c10:	262f 00f4      	move.l 244(sp),d3
    2c14:	4eae ffd0      	jsr -48(a6)
    2c18:	2f40 00f0      	move.l d0,240(sp)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    2c1c:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    2c22:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    2c28:	4878 001d      	pea 1d <_start+0x1d>
    2c2c:	2f00           	move.l d0,-(sp)
    2c2e:	4eba fdb4      	jsr 29e4 <TestCopperlistPos>(pc)
    2c32:	4fef 000c      	lea 12(sp),sp
    2c36:	4a80           	tst.l d0
    2c38:	6642           	bne.s 2c7c <TestCopperList+0x27a>
    Write(Output(), 
    2c3a:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2c40:	2c40           	movea.l d0,a6
    2c42:	4eae ffc4      	jsr -60(a6)
    2c46:	2f40 00ec      	move.l d0,236(sp)
    2c4a:	202f 00ec      	move.l 236(sp),d0
    2c4e:	2f40 00e8      	move.l d0,232(sp)
    2c52:	2f7c 0000 80e0 	move.l #32992,228(sp)
    2c58:	00e4 
    2c5a:	703c           	moveq #60,d0
    2c5c:	2f40 00e0      	move.l d0,224(sp)
    2c60:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2c66:	2c40           	movea.l d0,a6
    2c68:	222f 00e8      	move.l 232(sp),d1
    2c6c:	242f 00e4      	move.l 228(sp),d2
    2c70:	262f 00e0      	move.l 224(sp),d3
    2c74:	4eae ffd0      	jsr -48(a6)
    2c78:	2f40 00dc      	move.l d0,220(sp)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2c7c:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    2c82:	4878 0002      	pea 2 <_start+0x2>
    2c86:	4879 0000 a7e8 	pea a7e8 <ClColor>
    2c8c:	4878 001e      	pea 1e <_start+0x1e>
    2c90:	2f00           	move.l d0,-(sp)
    2c92:	4eba fd12      	jsr 29a6 <TestCopperlistBatch>(pc)
    2c96:	4fef 0010      	lea 16(sp),sp
    2c9a:	4a80           	tst.l d0
    2c9c:	6642           	bne.s 2ce0 <TestCopperList+0x2de>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2c9e:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2ca4:	2c40           	movea.l d0,a6
    2ca6:	4eae ffc4      	jsr -60(a6)
    2caa:	2f40 00d8      	move.l d0,216(sp)
    2cae:	202f 00d8      	move.l 216(sp),d0
    2cb2:	2f40 00d4      	move.l d0,212(sp)
    2cb6:	2f7c 0000 7859 	move.l #30809,208(sp)
    2cbc:	00d0 
    2cbe:	7021           	moveq #33,d0
    2cc0:	2f40 00cc      	move.l d0,204(sp)
    2cc4:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2cca:	2c40           	movea.l d0,a6
    2ccc:	222f 00d4      	move.l 212(sp),d1
    2cd0:	242f 00d0      	move.l 208(sp),d2
    2cd4:	262f 00cc      	move.l 204(sp),d3
    2cd8:	4eae ffd0      	jsr -48(a6)
    2cdc:	2f40 00c8      	move.l d0,200(sp)

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2ce0:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    2ce6:	4878 fffe      	pea fffffffe <_end+0xffe5241a>
    2cea:	4878 0020      	pea 20 <_start+0x20>
    2cee:	2f00           	move.l d0,-(sp)
    2cf0:	4eba fcf2      	jsr 29e4 <TestCopperlistPos>(pc)
    2cf4:	4fef 000c      	lea 12(sp),sp
    2cf8:	4a80           	tst.l d0
    2cfa:	6642           	bne.s 2d3e <TestCopperList+0x33c>
    Write(Output(), "Copperlist End not correctly set.\n", 34);
    2cfc:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2d02:	2c40           	movea.l d0,a6
    2d04:	4eae ffc4      	jsr -60(a6)
    2d08:	2f40 00c4      	move.l d0,196(sp)
    2d0c:	202f 00c4      	move.l 196(sp),d0
    2d10:	2f40 00c0      	move.l d0,192(sp)
    2d14:	2f7c 0000 787b 	move.l #30843,188(sp)
    2d1a:	00bc 
    2d1c:	7022           	moveq #34,d0
    2d1e:	2f40 00b8      	move.l d0,184(sp)
    2d22:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2d28:	2c40           	movea.l d0,a6
    2d2a:	222f 00c0      	move.l 192(sp),d1
    2d2e:	242f 00bc      	move.l 188(sp),d2
    2d32:	262f 00b8      	move.l 184(sp),d3
    2d36:	4eae ffd0      	jsr -48(a6)
    2d3a:	2f40 00b4      	move.l d0,180(sp)
  
  SwapCl();
    2d3e:	4eba d4b4      	jsr 1f4 <SwapCl>(pc)
  
  if( DrawCopper != Copperlist2)
    2d42:	2239 001a db84 	move.l 1adb84 <DrawCopper>,d1
    2d48:	2039 001a db78 	move.l 1adb78 <Copperlist2>,d0
    2d4e:	b081           	cmp.l d1,d0
    2d50:	6742           	beq.s 2d94 <TestCopperList+0x392>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
    2d52:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2d58:	2c40           	movea.l d0,a6
    2d5a:	4eae ffc4      	jsr -60(a6)
    2d5e:	2f40 00b0      	move.l d0,176(sp)
    2d62:	202f 00b0      	move.l 176(sp),d0
    2d66:	2f40 00ac      	move.l d0,172(sp)
    2d6a:	2f7c 0000 811d 	move.l #33053,168(sp)
    2d70:	00a8 
    2d72:	7015           	moveq #21,d0
    2d74:	2f40 00a4      	move.l d0,164(sp)
    2d78:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2d7e:	2c40           	movea.l d0,a6
    2d80:	222f 00ac      	move.l 172(sp),d1
    2d84:	242f 00a8      	move.l 168(sp),d2
    2d88:	262f 00a4      	move.l 164(sp),d3
    2d8c:	4eae ffd0      	jsr -48(a6)
    2d90:	2f40 00a0      	move.l d0,160(sp)

  
  PrepareDisplay();
    2d94:	4eba fa98      	jsr 282e <PrepareDisplay>(pc)
  if( DrawBuffer != Bitplane2) 
    2d98:	2239 001a db7c 	move.l 1adb7c <DrawBuffer>,d1
    2d9e:	2039 001a db70 	move.l 1adb70 <Bitplane2>,d0
    2da4:	b081           	cmp.l d1,d0
    2da6:	6742           	beq.s 2dea <TestCopperList+0x3e8>
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
    2da8:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2dae:	2c40           	movea.l d0,a6
    2db0:	4eae ffc4      	jsr -60(a6)
    2db4:	2f40 009c      	move.l d0,156(sp)
    2db8:	202f 009c      	move.l 156(sp),d0
    2dbc:	2f40 0098      	move.l d0,152(sp)
    2dc0:	2f7c 0000 8133 	move.l #33075,148(sp)
    2dc6:	0094 
    2dc8:	7037           	moveq #55,d0
    2dca:	2f40 0090      	move.l d0,144(sp)
    2dce:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2dd4:	2c40           	movea.l d0,a6
    2dd6:	222f 0098      	move.l 152(sp),d1
    2dda:	242f 0094      	move.l 148(sp),d2
    2dde:	262f 0090      	move.l 144(sp),d3
    2de2:	4eae ffd0      	jsr -48(a6)
    2de6:	2f40 008c      	move.l d0,140(sp)
                                                                            55);
  if( DrawCopper != Copperlist2) 
    2dea:	2239 001a db84 	move.l 1adb84 <DrawCopper>,d1
    2df0:	2039 001a db78 	move.l 1adb78 <Copperlist2>,d0
    2df6:	b081           	cmp.l d1,d0
    2df8:	6742           	beq.s 2e3c <TestCopperList+0x43a>
    Write( Output(), 
    2dfa:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2e00:	2c40           	movea.l d0,a6
    2e02:	4eae ffc4      	jsr -60(a6)
    2e06:	2f40 0088      	move.l d0,136(sp)
    2e0a:	202f 0088      	move.l 136(sp),d0
    2e0e:	2f40 0084      	move.l d0,132(sp)
    2e12:	2f7c 0000 816b 	move.l #33131,128(sp)
    2e18:	0080 
    2e1a:	7039           	moveq #57,d0
    2e1c:	2f40 007c      	move.l d0,124(sp)
    2e20:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2e26:	2c40           	movea.l d0,a6
    2e28:	222f 0084      	move.l 132(sp),d1
    2e2c:	242f 0080      	move.l 128(sp),d2
    2e30:	262f 007c      	move.l 124(sp),d3
    2e34:	4eae ffd0      	jsr -48(a6)
    2e38:	2f40 0078      	move.l d0,120(sp)
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
    2e3c:	2239 001a db80 	move.l 1adb80 <ViewBuffer>,d1
    2e42:	2039 001a db6c 	move.l 1adb6c <Bitplane1>,d0
    2e48:	b081           	cmp.l d1,d0
    2e4a:	6742           	beq.s 2e8e <TestCopperList+0x48c>
    Write( Output(), 
    2e4c:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2e52:	2c40           	movea.l d0,a6
    2e54:	4eae ffc4      	jsr -60(a6)
    2e58:	2f40 0074      	move.l d0,116(sp)
    2e5c:	202f 0074      	move.l 116(sp),d0
    2e60:	2f40 0070      	move.l d0,112(sp)
    2e64:	2f7c 0000 81a5 	move.l #33189,108(sp)
    2e6a:	006c 
    2e6c:	7038           	moveq #56,d0
    2e6e:	2f40 0068      	move.l d0,104(sp)
    2e72:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2e78:	2c40           	movea.l d0,a6
    2e7a:	222f 0070      	move.l 112(sp),d1
    2e7e:	242f 006c      	move.l 108(sp),d2
    2e82:	262f 0068      	move.l 104(sp),d3
    2e86:	4eae ffd0      	jsr -48(a6)
    2e8a:	2f40 0064      	move.l d0,100(sp)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
    2e8e:	2239 001a db88 	move.l 1adb88 <ViewCopper>,d1
    2e94:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    2e9a:	b081           	cmp.l d1,d0
    2e9c:	6742           	beq.s 2ee0 <TestCopperList+0x4de>
    Write( Output(), 
    2e9e:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2ea4:	2c40           	movea.l d0,a6
    2ea6:	4eae ffc4      	jsr -60(a6)
    2eaa:	2f40 0060      	move.l d0,96(sp)
    2eae:	202f 0060      	move.l 96(sp),d0
    2eb2:	2f40 005c      	move.l d0,92(sp)
    2eb6:	2f7c 0000 81de 	move.l #33246,88(sp)
    2ebc:	0058 
    2ebe:	703a           	moveq #58,d0
    2ec0:	2f40 0054      	move.l d0,84(sp)
    2ec4:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2eca:	2c40           	movea.l d0,a6
    2ecc:	222f 005c      	move.l 92(sp),d1
    2ed0:	242f 0058      	move.l 88(sp),d2
    2ed4:	262f 0054      	move.l 84(sp),d3
    2ed8:	4eae ffd0      	jsr -48(a6)
    2edc:	2f40 0050      	move.l d0,80(sp)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
    2ee0:	4eba d2b4      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
    2ee4:	4eba d30e      	jsr 1f4 <SwapCl>(pc)
  UWORD *copword = ViewCopper;
    2ee8:	2f79 001a db88 	move.l 1adb88 <ViewCopper>,76(sp)
    2eee:	004c 
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2ef0:	307c 0076      	movea.w #118,a0
    2ef4:	d1ef 004c      	adda.l 76(sp),a0
    2ef8:	3010           	move.w (a0),d0
    2efa:	7200           	moveq #0,d1
    2efc:	3200           	move.w d0,d1
    2efe:	307c 0072      	movea.w #114,a0
    2f02:	d1ef 004c      	adda.l 76(sp),a0
    2f06:	3010           	move.w (a0),d0
    2f08:	3000           	move.w d0,d0
    2f0a:	0280 0000 ffff 	andi.l #65535,d0
    2f10:	4840           	swap d0
    2f12:	4240           	clr.w d0
    2f14:	d081           	add.l d1,d0
    2f16:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2f1a:	2039 001a db70 	move.l 1adb70 <Bitplane2>,d0
    2f20:	b0af 0048      	cmp.l 72(sp),d0
    2f24:	6742           	beq.s 2f68 <TestCopperList+0x566>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2f26:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2f2c:	2c40           	movea.l d0,a6
    2f2e:	4eae ffc4      	jsr -60(a6)
    2f32:	2f40 0044      	move.l d0,68(sp)
    2f36:	202f 0044      	move.l 68(sp),d0
    2f3a:	2f40 0040      	move.l d0,64(sp)
    2f3e:	2f7c 0000 8219 	move.l #33305,60(sp)
    2f44:	003c 
    2f46:	7048           	moveq #72,d0
    2f48:	2f40 0038      	move.l d0,56(sp)
    2f4c:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2f52:	2c40           	movea.l d0,a6
    2f54:	222f 0040      	move.l 64(sp),d1
    2f58:	242f 003c      	move.l 60(sp),d2
    2f5c:	262f 0038      	move.l 56(sp),d3
    2f60:	4eae ffd0      	jsr -48(a6)
    2f64:	2f40 0034      	move.l d0,52(sp)
                                                   " after first frame.\n", 72);
  SetBplPointers();
    2f68:	4eba d22c      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
    2f6c:	4eba d286      	jsr 1f4 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2f70:	2f79 001a db88 	move.l 1adb88 <ViewCopper>,76(sp)
    2f76:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2f78:	307c 0076      	movea.w #118,a0
    2f7c:	d1ef 004c      	adda.l 76(sp),a0
    2f80:	3010           	move.w (a0),d0
    2f82:	7200           	moveq #0,d1
    2f84:	3200           	move.w d0,d1
    2f86:	307c 0072      	movea.w #114,a0
    2f8a:	d1ef 004c      	adda.l 76(sp),a0
    2f8e:	3010           	move.w (a0),d0
    2f90:	3000           	move.w d0,d0
    2f92:	0280 0000 ffff 	andi.l #65535,d0
    2f98:	4840           	swap d0
    2f9a:	4240           	clr.w d0
    2f9c:	d081           	add.l d1,d0
    2f9e:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane1) 
    2fa2:	2039 001a db6c 	move.l 1adb6c <Bitplane1>,d0
    2fa8:	b0af 0048      	cmp.l 72(sp),d0
    2fac:	6742           	beq.s 2ff0 <TestCopperList+0x5ee>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
    2fae:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2fb4:	2c40           	movea.l d0,a6
    2fb6:	4eae ffc4      	jsr -60(a6)
    2fba:	2f40 0030      	move.l d0,48(sp)
    2fbe:	202f 0030      	move.l 48(sp),d0
    2fc2:	2f40 002c      	move.l d0,44(sp)
    2fc6:	2f7c 0000 8262 	move.l #33378,40(sp)
    2fcc:	0028 
    2fce:	7049           	moveq #73,d0
    2fd0:	2f40 0024      	move.l d0,36(sp)
    2fd4:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    2fda:	2c40           	movea.l d0,a6
    2fdc:	222f 002c      	move.l 44(sp),d1
    2fe0:	242f 0028      	move.l 40(sp),d2
    2fe4:	262f 0024      	move.l 36(sp),d3
    2fe8:	4eae ffd0      	jsr -48(a6)
    2fec:	2f40 0020      	move.l d0,32(sp)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
    2ff0:	4eba d1a4      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
    2ff4:	4eba d1fe      	jsr 1f4 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2ff8:	2f79 001a db88 	move.l 1adb88 <ViewCopper>,76(sp)
    2ffe:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    3000:	307c 0076      	movea.w #118,a0
    3004:	d1ef 004c      	adda.l 76(sp),a0
    3008:	3010           	move.w (a0),d0
    300a:	7200           	moveq #0,d1
    300c:	3200           	move.w d0,d1
    300e:	307c 0072      	movea.w #114,a0
    3012:	d1ef 004c      	adda.l 76(sp),a0
    3016:	3010           	move.w (a0),d0
    3018:	3000           	move.w d0,d0
    301a:	0280 0000 ffff 	andi.l #65535,d0
    3020:	4840           	swap d0
    3022:	4240           	clr.w d0
    3024:	d081           	add.l d1,d0
    3026:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    302a:	2039 001a db70 	move.l 1adb70 <Bitplane2>,d0
    3030:	b0af 0048      	cmp.l 72(sp),d0
    3034:	6742           	beq.s 3078 <TestCopperList+0x676>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    3036:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    303c:	2c40           	movea.l d0,a6
    303e:	4eae ffc4      	jsr -60(a6)
    3042:	2f40 001c      	move.l d0,28(sp)
    3046:	202f 001c      	move.l 28(sp),d0
    304a:	2f40 0018      	move.l d0,24(sp)
    304e:	2f7c 0000 82ac 	move.l #33452,20(sp)
    3054:	0014 
    3056:	7048           	moveq #72,d0
    3058:	2f40 0010      	move.l d0,16(sp)
    305c:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3062:	2c40           	movea.l d0,a6
    3064:	222f 0018      	move.l 24(sp),d1
    3068:	242f 0014      	move.l 20(sp),d2
    306c:	262f 0010      	move.l 16(sp),d3
    3070:	4eae ffd0      	jsr -48(a6)
    3074:	2f40 000c      	move.l d0,12(sp)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
    3078:	2f3c 0000 c800 	move.l #51200,-(sp)
    307e:	4878 0084      	pea 84 <_start+0x84>
    3082:	4eba d05c      	jsr e0 <FreeDisplay>(pc)
    3086:	508f           	addq.l #8,sp
    3088:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    308c:	4fef 0148      	lea 328(sp),sp
    3090:	4e75           	rts

00003092 <RunTests>:
#include "runtests.h"
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    3092:	4eba f96e      	jsr 2a02 <TestCopperList>(pc)
    ZoomTest();
    3096:	4eba 0004      	jsr 309c <ZoomTest>(pc)
    //SwScrollerTest();
    309a:	4e75           	rts

0000309c <ZoomTest>:
#include "zoomtest2.h"

ULONG Cl102ZoomTest[137];

void ZoomTest() {
  TestZoomSpeed();
    309c:	4eba 0046      	jsr 30e4 <TestZoomSpeed>(pc)
  ZoomTestDisplay();
    30a0:	4eba 00e2      	jsr 3184 <ZoomTestDisplay>(pc)
  TestBlitleftOfZoom();
    30a4:	4eba 05a8      	jsr 364e <TestBlitleftOfZoom>(pc)
  TestCopyWord();
    30a8:	4eba 0838      	jsr 38e2 <TestCopyWord>(pc)
  TestZoom4Picture();
    30ac:	4eba 0e12      	jsr 3ec0 <TestZoom4Picture>(pc)
  TestZoom4PictureOn5Planes();
    30b0:	4eba 0b22      	jsr 3bd4 <TestZoom4PictureOn5Planes>(pc)
  Test_Zoom2();
    30b4:	4eba f012      	jsr 20c8 <Test_Zoom2>(pc)
  c2p1x1_8_c5_gen_init( 320, 256, 0, 0, 0, 0);
    30b8:	42a7           	clr.l -(sp)
    30ba:	42a7           	clr.l -(sp)
    30bc:	42a7           	clr.l -(sp)
    30be:	42a7           	clr.l -(sp)
    30c0:	4878 0100      	pea 100 <FreeDisplay+0x20>
    30c4:	4878 0140      	pea 140 <FreeDisplay+0x60>
    30c8:	4eb9 0000 73f4 	jsr 73f4 <c2p1x1_8_c5_gen_init>
    30ce:	4fef 0018      	lea 24(sp),sp
  c2p1x1_8_c5_gen( 0x100, 0x200);
    30d2:	4878 0200      	pea 200 <SwapCl+0xc>
    30d6:	4878 0100      	pea 100 <FreeDisplay+0x20>
    30da:	4eb9 0000 7470 	jsr 7470 <c2p1x1_8_c5_gen>
    30e0:	508f           	addq.l #8,sp
}
    30e2:	4e75           	rts

000030e4 <TestZoomSpeed>:

int Counter4Frames;

void TestZoomSpeed() {
    30e4:	4fef ffe8      	lea -24(sp),sp
    30e8:	48e7 3002      	movem.l d2-d3/a6,-(sp)

 	TakeSystem();
    30ec:	4eba d4e0      	jsr 5ce <TakeSystem>(pc)
	WaitVbl();
    30f0:	4eba d492      	jsr 584 <WaitVbl>(pc)
  //             fedcba9876543210
  //hw->dmacon = 0x8def;

  hw->dmacon = DMAF_SETCLR | DMAF_AUDIO | DMAF_BLITTER | DMAF_RASTER 
    30f4:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    30fa:	317c 87cf 0096 	move.w #-30769,150(a0)
                                    | DMAF_COPPER | DMAF_MASTER | DMAF_BLITHOG;
   //0b1000011111100000;
  
  //hw->dmacon = 0b1000011111111111;
	hw->intena = (1 << INTB_SETCLR) | (1 << INTB_INTEN) | (1 << INTB_VERTB);
    3100:	2079 001a db8c 	movea.l 1adb8c <hw>,a0
    3106:	317c c020 009a 	move.w #-16352,154(a0)
  
  Zoom_InitRun(); 
    310c:	4eba e1ea      	jsr 12f8 <Zoom_InitRun>(pc)

  int success = 1;
    3110:	7001           	moveq #1,d0
    3112:	2f40 0020      	move.l d0,32(sp)
  RunFrame();
    3116:	4eba d238      	jsr 350 <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    311a:	3039 001a dbca 	move.w 1adbca <Zoom_Counter>,d0
    3120:	0c40 0008      	cmpi.w #8,d0
    3124:	6304           	bls.s 312a <TestZoomSpeed+0x46>
    3126:	42af 0020      	clr.l 32(sp)
    
  Zoom_Dealloc();
    312a:	4eba e464      	jsr 1590 <Zoom_Dealloc>(pc)
  FreeSystem();
    312e:	4eba d5aa      	jsr 6da <FreeSystem>(pc)

  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    3132:	4aaf 0020      	tst.l 32(sp)
    3136:	6642           	bne.s 317a <TestZoomSpeed+0x96>
    3138:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    313e:	2c40           	movea.l d0,a6
    3140:	4eae ffc4      	jsr -60(a6)
    3144:	2f40 001c      	move.l d0,28(sp)
    3148:	202f 001c      	move.l 28(sp),d0
    314c:	2f40 0018      	move.l d0,24(sp)
    3150:	2f7c 0000 82f5 	move.l #33525,20(sp)
    3156:	0014 
    3158:	701c           	moveq #28,d0
    315a:	2f40 0010      	move.l d0,16(sp)
    315e:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3164:	2c40           	movea.l d0,a6
    3166:	222f 0018      	move.l 24(sp),d1
    316a:	242f 0014      	move.l 20(sp),d2
    316e:	262f 0010      	move.l 16(sp),d3
    3172:	4eae ffd0      	jsr -48(a6)
    3176:	2f40 000c      	move.l d0,12(sp)

  //AddIntServer(INTB_VERTB, vbint);
  //RemIntServer(INTB_VERTB, vbint);
  
}
    317a:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    317e:	4fef 0018      	lea 24(sp),sp
    3182:	4e75           	rts

00003184 <ZoomTestDisplay>:

void ZoomTestDisplay() {
    3184:	4fef ff38      	lea -200(sp),sp
    3188:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Zoom_Init();
    318c:	4eba e476      	jsr 1604 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    3190:	4eba e80c      	jsr 199e <PrepareDisplayZoom>(pc)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    3194:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    319a:	4878 0010      	pea 10 <_start+0x10>
    319e:	4879 0000 a868 	pea a868 <ClsSprites>
    31a4:	42a7           	clr.l -(sp)
    31a6:	2f00           	move.l d0,-(sp)
    31a8:	4eba f7fc      	jsr 29a6 <TestCopperlistBatch>(pc)
    31ac:	4fef 0010      	lea 16(sp),sp
    31b0:	4a80           	tst.l d0
    31b2:	6642           	bne.s 31f6 <ZoomTestDisplay+0x72>
    Write( Output(), 
    31b4:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    31ba:	2c40           	movea.l d0,a6
    31bc:	4eae ffc4      	jsr -60(a6)
    31c0:	2f40 00d0      	move.l d0,208(sp)
    31c4:	202f 00d0      	move.l 208(sp),d0
    31c8:	2f40 00cc      	move.l d0,204(sp)
    31cc:	2f7c 0000 8314 	move.l #33556,200(sp)
    31d2:	00c8 
    31d4:	7045           	moveq #69,d0
    31d6:	2f40 00c4      	move.l d0,196(sp)
    31da:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    31e0:	2c40           	movea.l d0,a6
    31e2:	222f 00cc      	move.l 204(sp),d1
    31e6:	242f 00c8      	move.l 200(sp),d2
    31ea:	262f 00c4      	move.l 196(sp),d3
    31ee:	4eae ffd0      	jsr -48(a6)
    31f2:	2f40 00c0      	move.l d0,192(sp)
       "ZoomCopperlist: Sprite section of copper starting on pos 0 messed up\n", 
                                                                            69);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    31f6:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    31fc:	4878 000c      	pea c <_start+0xc>
    3200:	4879 0000 a8a8 	pea a8a8 <ClScreen>
    3206:	4878 0010      	pea 10 <_start+0x10>
    320a:	2f00           	move.l d0,-(sp)
    320c:	4eba f798      	jsr 29a6 <TestCopperlistBatch>(pc)
    3210:	4fef 0010      	lea 16(sp),sp
    3214:	4a80           	tst.l d0
    3216:	6642           	bne.s 325a <ZoomTestDisplay+0xd6>
    Write( Output(), 
    3218:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    321e:	2c40           	movea.l d0,a6
    3220:	4eae ffc4      	jsr -60(a6)
    3224:	2f40 00bc      	move.l d0,188(sp)
    3228:	202f 00bc      	move.l 188(sp),d0
    322c:	2f40 00b8      	move.l d0,184(sp)
    3230:	2f7c 0000 835a 	move.l #33626,180(sp)
    3236:	00b4 
    3238:	7046           	moveq #70,d0
    323a:	2f40 00b0      	move.l d0,176(sp)
    323e:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3244:	2c40           	movea.l d0,a6
    3246:	222f 00b8      	move.l 184(sp),d1
    324a:	242f 00b4      	move.l 180(sp),d2
    324e:	262f 00b0      	move.l 176(sp),d3
    3252:	4eae ffd0      	jsr -48(a6)
    3256:	2f40 00ac      	move.l d0,172(sp)
      "ZoomCopperlist: Screen section of copper starting on pos 16 messed up\n",
                                                                            70);
  DrawBuffer = (ULONG *) 0x40000;
    325a:	23fc 0004 0000 	move.l #262144,1adb7c <DrawBuffer>
    3260:	001a db7c 
  ViewBuffer = (ULONG *) 0x50000;
    3264:	23fc 0005 0000 	move.l #327680,1adb80 <ViewBuffer>
    326a:	001a db80 
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    326e:	2239 001a db84 	move.l 1adb84 <DrawCopper>,d1
    3274:	2039 001a db7c 	move.l 1adb7c <DrawBuffer>,d0
    327a:	2f01           	move.l d1,-(sp)
    327c:	2f00           	move.l d0,-(sp)
    327e:	4eba ed78      	jsr 1ff8 <Zoom_SetBplPointers>(pc)
    3282:	508f           	addq.l #8,sp
  Zoom_SwapBuffers( 0);
    3284:	42a7           	clr.l -(sp)
    3286:	4eba ee08      	jsr 2090 <Zoom_SwapBuffers>(pc)
    328a:	588f           	addq.l #4,sp
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    328c:	2039 001a db7c 	move.l 1adb7c <DrawBuffer>,d0
    3292:	0c80 0005 0000 	cmpi.l #327680,d0
    3298:	660e           	bne.s 32a8 <ZoomTestDisplay+0x124>
    329a:	2039 001a db80 	move.l 1adb80 <ViewBuffer>,d0
    32a0:	0c80 0004 0000 	cmpi.l #262144,d0
    32a6:	6742           	beq.s 32ea <ZoomTestDisplay+0x166>
    Write( Output(), 
    32a8:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    32ae:	2c40           	movea.l d0,a6
    32b0:	4eae ffc4      	jsr -60(a6)
    32b4:	2f40 00a8      	move.l d0,168(sp)
    32b8:	202f 00a8      	move.l 168(sp),d0
    32bc:	2f40 00a4      	move.l d0,164(sp)
    32c0:	2f7c 0000 83a1 	move.l #33697,160(sp)
    32c6:	00a0 
    32c8:	703b           	moveq #59,d0
    32ca:	2f40 009c      	move.l d0,156(sp)
    32ce:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    32d4:	2c40           	movea.l d0,a6
    32d6:	222f 00a4      	move.l 164(sp),d1
    32da:	242f 00a0      	move.l 160(sp),d2
    32de:	262f 009c      	move.l 156(sp),d3
    32e2:	4eae ffd0      	jsr -48(a6)
    32e6:	2f40 0098      	move.l d0,152(sp)
            "ZoomCopperlist: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    32ea:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    32f0:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    32f6:	4878 001c      	pea 1c <_start+0x1c>
    32fa:	2f00           	move.l d0,-(sp)
    32fc:	4eba f6e6      	jsr 29e4 <TestCopperlistPos>(pc)
    3300:	4fef 000c      	lea 12(sp),sp
    3304:	4a80           	tst.l d0
    3306:	6642           	bne.s 334a <ZoomTestDisplay+0x1c6>
    Write(Output(), 
    3308:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    330e:	2c40           	movea.l d0,a6
    3310:	4eae ffc4      	jsr -60(a6)
    3314:	2f40 0094      	move.l d0,148(sp)
    3318:	202f 0094      	move.l 148(sp),d0
    331c:	2f40 0090      	move.l d0,144(sp)
    3320:	2f7c 0000 83dd 	move.l #33757,140(sp)
    3326:	008c 
    3328:	703c           	moveq #60,d0
    332a:	2f40 0088      	move.l d0,136(sp)
    332e:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3334:	2c40           	movea.l d0,a6
    3336:	222f 0090      	move.l 144(sp),d1
    333a:	242f 008c      	move.l 140(sp),d2
    333e:	262f 0088      	move.l 136(sp),d3
    3342:	4eae ffd0      	jsr -48(a6)
    3346:	2f40 0084      	move.l d0,132(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    334a:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    3350:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    3356:	4878 001d      	pea 1d <_start+0x1d>
    335a:	2f00           	move.l d0,-(sp)
    335c:	4eba f686      	jsr 29e4 <TestCopperlistPos>(pc)
    3360:	4fef 000c      	lea 12(sp),sp
    3364:	4a80           	tst.l d0
    3366:	6642           	bne.s 33aa <ZoomTestDisplay+0x226>
    Write(Output(), 
    3368:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    336e:	2c40           	movea.l d0,a6
    3370:	4eae ffc4      	jsr -60(a6)
    3374:	2f40 0080      	move.l d0,128(sp)
    3378:	202f 0080      	move.l 128(sp),d0
    337c:	2f40 007c      	move.l d0,124(sp)
    3380:	2f7c 0000 841a 	move.l #33818,120(sp)
    3386:	0078 
    3388:	703c           	moveq #60,d0
    338a:	2f40 0074      	move.l d0,116(sp)
    338e:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3394:	2c40           	movea.l d0,a6
    3396:	222f 007c      	move.l 124(sp),d1
    339a:	242f 0078      	move.l 120(sp),d2
    339e:	262f 0074      	move.l 116(sp),d3
    33a2:	4eae ffd0      	jsr -48(a6)
    33a6:	2f40 0070      	move.l d0,112(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1pl should be 00f4\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    33aa:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    33b0:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    33b6:	4878 001e      	pea 1e <_start+0x1e>
    33ba:	2f00           	move.l d0,-(sp)
    33bc:	4eba f626      	jsr 29e4 <TestCopperlistPos>(pc)
    33c0:	4fef 000c      	lea 12(sp),sp
    33c4:	4a80           	tst.l d0
    33c6:	6642           	bne.s 340a <ZoomTestDisplay+0x286>
    Write(Output(), 
    33c8:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    33ce:	2c40           	movea.l d0,a6
    33d0:	4eae ffc4      	jsr -60(a6)
    33d4:	2f40 006c      	move.l d0,108(sp)
    33d8:	202f 006c      	move.l 108(sp),d0
    33dc:	2f40 0068      	move.l d0,104(sp)
    33e0:	2f7c 0000 8457 	move.l #33879,100(sp)
    33e6:	0064 
    33e8:	703c           	moveq #60,d0
    33ea:	2f40 0060      	move.l d0,96(sp)
    33ee:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    33f4:	2c40           	movea.l d0,a6
    33f6:	222f 0068      	move.l 104(sp),d1
    33fa:	242f 0064      	move.l 100(sp),d2
    33fe:	262f 0060      	move.l 96(sp),d3
    3402:	4eae ffd0      	jsr -48(a6)
    3406:	2f40 005c      	move.l d0,92(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    340a:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    3410:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    3416:	4878 001f      	pea 1f <_start+0x1f>
    341a:	2f00           	move.l d0,-(sp)
    341c:	4eba f5c6      	jsr 29e4 <TestCopperlistPos>(pc)
    3420:	4fef 000c      	lea 12(sp),sp
    3424:	4a80           	tst.l d0
    3426:	6642           	bne.s 346a <ZoomTestDisplay+0x2e6>
    Write(Output(), 
    3428:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    342e:	2c40           	movea.l d0,a6
    3430:	4eae ffc4      	jsr -60(a6)
    3434:	2f40 0058      	move.l d0,88(sp)
    3438:	202f 0058      	move.l 88(sp),d0
    343c:	2f40 0054      	move.l d0,84(sp)
    3440:	2f7c 0000 8494 	move.l #33940,80(sp)
    3446:	0050 
    3448:	703c           	moveq #60,d0
    344a:	2f40 004c      	move.l d0,76(sp)
    344e:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3454:	2c40           	movea.l d0,a6
    3456:	222f 0054      	move.l 84(sp),d1
    345a:	242f 0050      	move.l 80(sp),d2
    345e:	262f 004c      	move.l 76(sp),d3
    3462:	4eae ffd0      	jsr -48(a6)
    3466:	2f40 0048      	move.l d0,72(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2pl should be 0034\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    346a:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    3470:	4878 0020      	pea 20 <_start+0x20>
    3474:	4879 0000 a7e8 	pea a7e8 <ClColor>
    347a:	4878 0026      	pea 26 <_start+0x26>
    347e:	2f00           	move.l d0,-(sp)
    3480:	4eba f524      	jsr 29a6 <TestCopperlistBatch>(pc)
    3484:	4fef 0010      	lea 16(sp),sp
    3488:	4a80           	tst.l d0
    348a:	6642           	bne.s 34ce <ZoomTestDisplay+0x34a>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    348c:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3492:	2c40           	movea.l d0,a6
    3494:	4eae ffc4      	jsr -60(a6)
    3498:	2f40 0044      	move.l d0,68(sp)
    349c:	202f 0044      	move.l 68(sp),d0
    34a0:	2f40 0040      	move.l d0,64(sp)
    34a4:	2f7c 0000 84d1 	move.l #34001,60(sp)
    34aa:	003c 
    34ac:	7025           	moveq #37,d0
    34ae:	2f40 0038      	move.l d0,56(sp)
    34b2:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    34b8:	2c40           	movea.l d0,a6
    34ba:	222f 0040      	move.l 64(sp),d1
    34be:	242f 003c      	move.l 60(sp),d2
    34c2:	262f 0038      	move.l 56(sp),d3
    34c6:	4eae ffd0      	jsr -48(a6)
    34ca:	2f40 0034      	move.l d0,52(sp)

  /*if(  TestCopperlistBatch(  Copperlist1, 71, Cl102ZoomRepeat, 21) == 0)
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36); */
  
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    34ce:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    34d4:	2f00           	move.l d0,-(sp)
    34d6:	4878 000f      	pea f <_start+0xf>
    34da:	4eba cf84      	jsr 460 <Zoom_Shrink102>(pc)
    34de:	508f           	addq.l #8,sp
  if( TestCopperListZoom102( Copperlist1, 73, Cl102ZoomTest) == 0)
    34e0:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    34e6:	4879 0000 bac8 	pea bac8 <Cl102ZoomTest>
    34ec:	4878 0049      	pea 49 <_start+0x49>
    34f0:	2f00           	move.l d0,-(sp)
    34f2:	4eba 00c4      	jsr 35b8 <TestCopperListZoom102>(pc)
    34f6:	4fef 000c      	lea 12(sp),sp
    34fa:	4a80           	tst.l d0
    34fc:	6642           	bne.s 3540 <ZoomTestDisplay+0x3bc>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    34fe:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3504:	2c40           	movea.l d0,a6
    3506:	4eae ffc4      	jsr -60(a6)
    350a:	2f40 0030      	move.l d0,48(sp)
    350e:	202f 0030      	move.l 48(sp),d0
    3512:	2f40 002c      	move.l d0,44(sp)
    3516:	2f7c 0000 84f7 	move.l #34039,40(sp)
    351c:	0028 
    351e:	7025           	moveq #37,d0
    3520:	2f40 0024      	move.l d0,36(sp)
    3524:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    352a:	2c40           	movea.l d0,a6
    352c:	222f 002c      	move.l 44(sp),d1
    3530:	242f 0028      	move.l 40(sp),d2
    3534:	262f 0024      	move.l 36(sp),d3
    3538:	4eae ffd0      	jsr -48(a6)
    353c:	2f40 0020      	move.l d0,32(sp)

  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    3540:	2039 001a db74 	move.l 1adb74 <Copperlist1>,d0
    3546:	4878 fffe      	pea fffffffe <_end+0xffe5241a>
    354a:	4878 00bb      	pea bb <WaitBlt+0x7>
    354e:	2f00           	move.l d0,-(sp)
    3550:	4eba f492      	jsr 29e4 <TestCopperlistPos>(pc)
    3554:	4fef 000c      	lea 12(sp),sp
    3558:	4a80           	tst.l d0
    355a:	6642           	bne.s 359e <ZoomTestDisplay+0x41a>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    355c:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3562:	2c40           	movea.l d0,a6
    3564:	4eae ffc4      	jsr -60(a6)
    3568:	2f40 001c      	move.l d0,28(sp)
    356c:	202f 001c      	move.l 28(sp),d0
    3570:	2f40 0018      	move.l d0,24(sp)
    3574:	2f7c 0000 851c 	move.l #34076,20(sp)
    357a:	0014 
    357c:	7032           	moveq #50,d0
    357e:	2f40 0010      	move.l d0,16(sp)
    3582:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3588:	2c40           	movea.l d0,a6
    358a:	222f 0018      	move.l 24(sp),d1
    358e:	242f 0014      	move.l 20(sp),d2
    3592:	262f 0010      	move.l 16(sp),d3
    3596:	4eae ffd0      	jsr -48(a6)
    359a:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    359e:	2f3c 0000 df20 	move.l #57120,-(sp)
    35a4:	4878 031c      	pea 31c <RunDemo+0x6>
    35a8:	4eba cb36      	jsr e0 <FreeDisplay>(pc)
    35ac:	508f           	addq.l #8,sp

}
    35ae:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    35b2:	4fef 00c8      	lea 200(sp),sp
    35b6:	4e75           	rts

000035b8 <TestCopperListZoom102>:

int TestCopperListZoom102( ULONG *cl2test, UWORD position, 
                                                           ULONG *template4cl) {
    35b8:	598f           	subq.l #4,sp
    35ba:	202f 000c      	move.l 12(sp),d0
    35be:	3000           	move.w d0,d0
    35c0:	3f40 0002      	move.w d0,2(sp)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    35c4:	7000           	moveq #0,d0
    35c6:	302f 0002      	move.w 2(sp),d0
    35ca:	4878 001c      	pea 1c <_start+0x1c>
    35ce:	2f2f 0014      	move.l 20(sp),-(sp)
    35d2:	2f00           	move.l d0,-(sp)
    35d4:	2f2f 0014      	move.l 20(sp),-(sp)
    35d8:	4eba f3cc      	jsr 29a6 <TestCopperlistBatch>(pc)
    35dc:	4fef 0010      	lea 16(sp),sp
    35e0:	4a80           	tst.l d0
    35e2:	6604           	bne.s 35e8 <TestCopperListZoom102+0x30>
    return 0;
    35e4:	7000           	moveq #0,d0
    35e6:	6062           	bra.s 364a <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    35e8:	7078           	moveq #120,d0
    35ea:	d0af 0010      	add.l 16(sp),d0
    35ee:	7200           	moveq #0,d1
    35f0:	322f 0002      	move.w 2(sp),d1
    35f4:	307c 001e      	movea.w #30,a0
    35f8:	d1c1           	adda.l d1,a0
    35fa:	4878 0036      	pea 36 <_start+0x36>
    35fe:	2f00           	move.l d0,-(sp)
    3600:	2f08           	move.l a0,-(sp)
    3602:	2f2f 0014      	move.l 20(sp),-(sp)
    3606:	4eba f39e      	jsr 29a6 <TestCopperlistBatch>(pc)
    360a:	4fef 0010      	lea 16(sp),sp
    360e:	4a80           	tst.l d0
    3610:	6604           	bne.s 3616 <TestCopperListZoom102+0x5e>
    return 0;
    3612:	7000           	moveq #0,d0
    3614:	6034           	bra.s 364a <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    3616:	202f 0010      	move.l 16(sp),d0
    361a:	0680 0000 0158 	addi.l #344,d0
    3620:	7200           	moveq #0,d1
    3622:	322f 0002      	move.w 2(sp),d1
    3626:	307c 0056      	movea.w #86,a0
    362a:	d1c1           	adda.l d1,a0
    362c:	4878 001c      	pea 1c <_start+0x1c>
    3630:	2f00           	move.l d0,-(sp)
    3632:	2f08           	move.l a0,-(sp)
    3634:	2f2f 0014      	move.l 20(sp),-(sp)
    3638:	4eba f36c      	jsr 29a6 <TestCopperlistBatch>(pc)
    363c:	4fef 0010      	lea 16(sp),sp
    3640:	4a80           	tst.l d0
    3642:	6604           	bne.s 3648 <TestCopperListZoom102+0x90>
    return 0;
    3644:	7000           	moveq #0,d0
    3646:	6002           	bra.s 364a <TestCopperListZoom102+0x92>
 
  return 1;
    3648:	7001           	moveq #1,d0
}
    364a:	588f           	addq.l #4,sp
    364c:	4e75           	rts

0000364e <TestBlitleftOfZoom>:

void TestBlitleftOfZoom() {
    364e:	4fef ff94      	lea -108(sp),sp
    3652:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Zoom_Init();
    3656:	4eba dfac      	jsr 1604 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    365a:	4eba e342      	jsr 199e <PrepareDisplayZoom>(pc)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    365e:	2f7c 0000 c800 	move.l #51200,116(sp)
    3664:	0074 
    3666:	7002           	moveq #2,d0
    3668:	2f40 0070      	move.l d0,112(sp)
    366c:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    3672:	2c40           	movea.l d0,a6
    3674:	202f 0074      	move.l 116(sp),d0
    3678:	222f 0070      	move.l 112(sp),d1
    367c:	4eae ff3a      	jsr -198(a6)
    3680:	2f40 006c      	move.l d0,108(sp)
    3684:	202f 006c      	move.l 108(sp),d0
    3688:	23c0 001a dbbc 	move.l d0,1adbbc <Zoom_Source>
  if( Zoom_Source == 0) {
    368e:	2039 001a dbbc 	move.l 1adbbc <Zoom_Source>,d0
    3694:	6646           	bne.s 36dc <TestBlitleftOfZoom+0x8e>
    Write(  Output(), 
    3696:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    369c:	2c40           	movea.l d0,a6
    369e:	4eae ffc4      	jsr -60(a6)
    36a2:	2f40 001c      	move.l d0,28(sp)
    36a6:	202f 001c      	move.l 28(sp),d0
    36aa:	2f40 0018      	move.l d0,24(sp)
    36ae:	2f7c 0000 854f 	move.l #34127,20(sp)
    36b4:	0014 
    36b6:	7236           	moveq #54,d1
    36b8:	2f41 0010      	move.l d1,16(sp)
    36bc:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    36c2:	2c40           	movea.l d0,a6
    36c4:	222f 0018      	move.l 24(sp),d1
    36c8:	242f 0014      	move.l 20(sp),d2
    36cc:	262f 0010      	move.l 16(sp),d3
    36d0:	4eae ffd0      	jsr -48(a6)
    36d4:	2f40 000c      	move.l d0,12(sp)
    36d8:	6000 01fe      	bra.w 38d8 <TestBlitleftOfZoom+0x28a>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  
  UWORD *tstsource = Zoom_Source;
    36dc:	2f79 001a dbbc 	move.l 1adbbc <Zoom_Source>,104(sp)
    36e2:	0068 
  *tstsource++ = 0x0000;
    36e4:	202f 0068      	move.l 104(sp),d0
    36e8:	2200           	move.l d0,d1
    36ea:	5481           	addq.l #2,d1
    36ec:	2f41 0068      	move.l d1,104(sp)
    36f0:	2040           	movea.l d0,a0
    36f2:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    36f4:	206f 0068      	movea.l 104(sp),a0
    36f8:	30bc 0080      	move.w #128,(a0)
  tstsource += ZMLINESIZE/2-1;
    36fc:	7028           	moveq #40,d0
    36fe:	d1af 0068      	add.l d0,104(sp)
  *tstsource = 0x1000;
    3702:	206f 0068      	movea.l 104(sp),a0
    3706:	30bc 1000      	move.w #4096,(a0)
  tstsource++;
    370a:	54af 0068      	addq.l #2,104(sp)
  *tstsource = 0x8e88;
    370e:	206f 0068      	movea.l 104(sp),a0
    3712:	30bc 8e88      	move.w #-29048,(a0)
  tstsource += ZMLINESIZE/2-1;
    3716:	7228           	moveq #40,d1
    3718:	d3af 0068      	add.l d1,104(sp)

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
    371c:	2039 001a dbbc 	move.l 1adbbc <Zoom_Source>,d0
    3722:	2200           	move.l d0,d1
    3724:	0681 0000 14d6 	addi.l #5334,d1
    372a:	2f41 0068      	move.l d1,104(sp)
  *tstsource++ = 0x0000;
    372e:	202f 0068      	move.l 104(sp),d0
    3732:	2200           	move.l d0,d1
    3734:	5481           	addq.l #2,d1
    3736:	2f41 0068      	move.l d1,104(sp)
    373a:	2040           	movea.l d0,a0
    373c:	4250           	clr.w (a0)
  *tstsource = 0x00ff;
    373e:	206f 0068      	movea.l 104(sp),a0
    3742:	30bc 00ff      	move.w #255,(a0)
  WaitBlit();
    3746:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    374c:	2c40           	movea.l d0,a6
    374e:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    3752:	4eba e3c2      	jsr 1b16 <Init_Blit>(pc)
  Init_ZoomBlit( 7, 16, 0);
    3756:	42a7           	clr.l -(sp)
    3758:	4878 0010      	pea 10 <_start+0x10>
    375c:	4878 0007      	pea 7 <_start+0x7>
    3760:	4eba e430      	jsr 1b92 <Init_ZoomBlit>(pc)
    3764:	4fef 000c      	lea 12(sp),sp
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    3768:	2239 001a db7c 	move.l 1adb7c <DrawBuffer>,d1
    376e:	2039 001a dbbc 	move.l 1adbbc <Zoom_Source>,d0
    3774:	4878 0080      	pea 80 <_start+0x80>
    3778:	2f01           	move.l d1,-(sp)
    377a:	2f00           	move.l d0,-(sp)
    377c:	4eba da98      	jsr 1216 <Zoom_ZoomBlit>(pc)
    3780:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    3784:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    378a:	2c40           	movea.l d0,a6
    378c:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    3790:	2039 001a db7c 	move.l 1adb7c <DrawBuffer>,d0
    3796:	2200           	move.l d0,d1
    3798:	5481           	addq.l #2,d1
    379a:	2f41 0064      	move.l d1,100(sp)
  if( *destination != 0x0180) {
    379e:	206f 0064      	movea.l 100(sp),a0
    37a2:	3010           	move.w (a0),d0
    37a4:	0c40 0180      	cmpi.w #384,d0
    37a8:	6742           	beq.s 37ec <TestBlitleftOfZoom+0x19e>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    37aa:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    37b0:	2c40           	movea.l d0,a6
    37b2:	4eae ffc4      	jsr -60(a6)
    37b6:	2f40 0060      	move.l d0,96(sp)
    37ba:	202f 0060      	move.l 96(sp),d0
    37be:	2f40 005c      	move.l d0,92(sp)
    37c2:	2f7c 0000 8587 	move.l #34183,88(sp)
    37c8:	0058 
    37ca:	701c           	moveq #28,d0
    37cc:	2f40 0054      	move.l d0,84(sp)
    37d0:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    37d6:	2c40           	movea.l d0,a6
    37d8:	222f 005c      	move.l 92(sp),d1
    37dc:	242f 0058      	move.l 88(sp),d2
    37e0:	262f 0054      	move.l 84(sp),d3
    37e4:	4eae ffd0      	jsr -48(a6)
    37e8:	2f40 0050      	move.l d0,80(sp)
  }
  destination += ZMLINESIZE/2;
    37ec:	722a           	moveq #42,d1
    37ee:	d3af 0064      	add.l d1,100(sp)
  if( *destination != 0x1d88)
    37f2:	206f 0064      	movea.l 100(sp),a0
    37f6:	3010           	move.w (a0),d0
    37f8:	0c40 1d88      	cmpi.w #7560,d0
    37fc:	6742           	beq.s 3840 <TestBlitleftOfZoom+0x1f2>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    37fe:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3804:	2c40           	movea.l d0,a6
    3806:	4eae ffc4      	jsr -60(a6)
    380a:	2f40 004c      	move.l d0,76(sp)
    380e:	202f 004c      	move.l 76(sp),d0
    3812:	2f40 0048      	move.l d0,72(sp)
    3816:	2f7c 0000 85a4 	move.l #34212,68(sp)
    381c:	0044 
    381e:	701c           	moveq #28,d0
    3820:	2f40 0040      	move.l d0,64(sp)
    3824:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    382a:	2c40           	movea.l d0,a6
    382c:	222f 0048      	move.l 72(sp),d1
    3830:	242f 0044      	move.l 68(sp),d2
    3834:	262f 0040      	move.l 64(sp),d3
    3838:	4eae ffd0      	jsr -48(a6)
    383c:	2f40 003c      	move.l d0,60(sp)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
    3840:	2039 001a db7c 	move.l 1adb7c <DrawBuffer>,d0
    3846:	2200           	move.l d0,d1
    3848:	0681 0000 14d6 	addi.l #5334,d1
    384e:	2f41 0064      	move.l d1,100(sp)
  destination++;
    3852:	54af 0064      	addq.l #2,100(sp)
  if( *destination != 0x01ff) {
    3856:	206f 0064      	movea.l 100(sp),a0
    385a:	3010           	move.w (a0),d0
    385c:	0c40 01ff      	cmpi.w #511,d0
    3860:	6742           	beq.s 38a4 <TestBlitleftOfZoom+0x256>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    3862:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3868:	2c40           	movea.l d0,a6
    386a:	4eae ffc4      	jsr -60(a6)
    386e:	2f40 0038      	move.l d0,56(sp)
    3872:	202f 0038      	move.l 56(sp),d0
    3876:	2f40 0034      	move.l d0,52(sp)
    387a:	2f7c 0000 85c1 	move.l #34241,48(sp)
    3880:	0030 
    3882:	701a           	moveq #26,d0
    3884:	2f40 002c      	move.l d0,44(sp)
    3888:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    388e:	2c40           	movea.l d0,a6
    3890:	222f 0034      	move.l 52(sp),d1
    3894:	242f 0030      	move.l 48(sp),d2
    3898:	262f 002c      	move.l 44(sp),d3
    389c:	4eae ffd0      	jsr -48(a6)
    38a0:	2f40 0028      	move.l d0,40(sp)
  }
  FreeMem( Zoom_Source, 40*256*5);
    38a4:	2f79 001a dbbc 	move.l 1adbbc <Zoom_Source>,36(sp)
    38aa:	0024 
    38ac:	2f7c 0000 c800 	move.l #51200,32(sp)
    38b2:	0020 
    38b4:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    38ba:	2c40           	movea.l d0,a6
    38bc:	226f 0024      	movea.l 36(sp),a1
    38c0:	202f 0020      	move.l 32(sp),d0
    38c4:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    38c8:	2f3c 0000 df20 	move.l #57120,-(sp)
    38ce:	4878 031c      	pea 31c <RunDemo+0x6>
    38d2:	4eba c80c      	jsr e0 <FreeDisplay>(pc)
    38d6:	508f           	addq.l #8,sp
}
    38d8:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    38dc:	4fef 006c      	lea 108(sp),sp
    38e0:	4e75           	rts

000038e2 <TestCopyWord>:

void TestCopyWord() {
    38e2:	4fef ff74      	lea -140(sp),sp
    38e6:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    38ea:	2f7c 0000 04ec 	move.l #1260,136(sp)
    38f0:	0088 
    38f2:	7002           	moveq #2,d0
    38f4:	2f40 0084      	move.l d0,132(sp)
    38f8:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    38fe:	2c40           	movea.l d0,a6
    3900:	202f 0088      	move.l 136(sp),d0
    3904:	222f 0084      	move.l 132(sp),d1
    3908:	4eae ff3a      	jsr -198(a6)
    390c:	2f40 0080      	move.l d0,128(sp)
    3910:	202f 0080      	move.l 128(sp),d0
    3914:	2f40 007c      	move.l d0,124(sp)
  if( source == 0) {
    3918:	6646           	bne.s 3960 <TestCopyWord+0x7e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    391a:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3920:	2c40           	movea.l d0,a6
    3922:	4eae ffc4      	jsr -60(a6)
    3926:	2f40 001c      	move.l d0,28(sp)
    392a:	202f 001c      	move.l 28(sp),d0
    392e:	2f40 0018      	move.l d0,24(sp)
    3932:	2f7c 0000 85dc 	move.l #34268,20(sp)
    3938:	0014 
    393a:	7235           	moveq #53,d1
    393c:	2f41 0010      	move.l d1,16(sp)
    3940:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3946:	2c40           	movea.l d0,a6
    3948:	222f 0018      	move.l 24(sp),d1
    394c:	242f 0014      	move.l 20(sp),d2
    3950:	262f 0010      	move.l 16(sp),d3
    3954:	4eae ffd0      	jsr -48(a6)
    3958:	2f40 000c      	move.l d0,12(sp)
    395c:	6000 026c      	bra.w 3bca <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    3960:	2f7c 0000 04ec 	move.l #1260,120(sp)
    3966:	0078 
    3968:	7002           	moveq #2,d0
    396a:	2f40 0074      	move.l d0,116(sp)
    396e:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    3974:	2c40           	movea.l d0,a6
    3976:	202f 0078      	move.l 120(sp),d0
    397a:	222f 0074      	move.l 116(sp),d1
    397e:	4eae ff3a      	jsr -198(a6)
    3982:	2f40 0070      	move.l d0,112(sp)
    3986:	202f 0070      	move.l 112(sp),d0
    398a:	2f40 006c      	move.l d0,108(sp)
  if( destination == 0) {
    398e:	6646           	bne.s 39d6 <TestCopyWord+0xf4>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3990:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3996:	2c40           	movea.l d0,a6
    3998:	4eae ffc4      	jsr -60(a6)
    399c:	2f40 0030      	move.l d0,48(sp)
    39a0:	202f 0030      	move.l 48(sp),d0
    39a4:	2f40 002c      	move.l d0,44(sp)
    39a8:	2f7c 0000 85dc 	move.l #34268,40(sp)
    39ae:	0028 
    39b0:	7235           	moveq #53,d1
    39b2:	2f41 0024      	move.l d1,36(sp)
    39b6:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    39bc:	2c40           	movea.l d0,a6
    39be:	222f 002c      	move.l 44(sp),d1
    39c2:	242f 0028      	move.l 40(sp),d2
    39c6:	262f 0024      	move.l 36(sp),d3
    39ca:	4eae ffd0      	jsr -48(a6)
    39ce:	2f40 0020      	move.l d0,32(sp)
    39d2:	6000 01f6      	bra.w 3bca <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
    39d6:	2f6f 007c 0094 	move.l 124(sp),148(sp)
  for( int i=0; i<8;i++) {
    39dc:	42af 0090      	clr.l 144(sp)
    39e0:	6000 0086      	bra.w 3a68 <TestCopyWord+0x186>
    *tmp++ = 0;
    39e4:	202f 0094      	move.l 148(sp),d0
    39e8:	2200           	move.l d0,d1
    39ea:	5481           	addq.l #2,d1
    39ec:	2f41 0094      	move.l d1,148(sp)
    39f0:	2040           	movea.l d0,a0
    39f2:	4250           	clr.w (a0)
    *tmp++ = 0xaaaa;
    39f4:	202f 0094      	move.l 148(sp),d0
    39f8:	2200           	move.l d0,d1
    39fa:	5481           	addq.l #2,d1
    39fc:	2f41 0094      	move.l d1,148(sp)
    3a00:	2040           	movea.l d0,a0
    3a02:	30bc aaaa      	move.w #-21846,(a0)
    *tmp++ = 0xaaaa;
    3a06:	202f 0094      	move.l 148(sp),d0
    3a0a:	2200           	move.l d0,d1
    3a0c:	5481           	addq.l #2,d1
    3a0e:	2f41 0094      	move.l d1,148(sp)
    3a12:	2040           	movea.l d0,a0
    3a14:	30bc aaaa      	move.w #-21846,(a0)
    *tmp = 0;
    3a18:	206f 0094      	movea.l 148(sp),a0
    3a1c:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    3a1e:	7024           	moveq #36,d0
    3a20:	d1af 0094      	add.l d0,148(sp)
    *tmp++ = 0;
    3a24:	202f 0094      	move.l 148(sp),d0
    3a28:	2200           	move.l d0,d1
    3a2a:	5481           	addq.l #2,d1
    3a2c:	2f41 0094      	move.l d1,148(sp)
    3a30:	2040           	movea.l d0,a0
    3a32:	4250           	clr.w (a0)
    *tmp++ = 0x5555;
    3a34:	202f 0094      	move.l 148(sp),d0
    3a38:	2200           	move.l d0,d1
    3a3a:	5481           	addq.l #2,d1
    3a3c:	2f41 0094      	move.l d1,148(sp)
    3a40:	2040           	movea.l d0,a0
    3a42:	30bc 5555      	move.w #21845,(a0)
    *tmp++ = 0x5555;
    3a46:	202f 0094      	move.l 148(sp),d0
    3a4a:	2200           	move.l d0,d1
    3a4c:	5481           	addq.l #2,d1
    3a4e:	2f41 0094      	move.l d1,148(sp)
    3a52:	2040           	movea.l d0,a0
    3a54:	30bc 5555      	move.w #21845,(a0)
    *tmp = 0;
    3a58:	206f 0094      	movea.l 148(sp),a0
    3a5c:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    3a5e:	7024           	moveq #36,d0
    3a60:	d1af 0094      	add.l d0,148(sp)
  for( int i=0; i<8;i++) {
    3a64:	52af 0090      	addq.l #1,144(sp)
    3a68:	7207           	moveq #7,d1
    3a6a:	b2af 0090      	cmp.l 144(sp),d1
    3a6e:	6c00 ff74      	bge.w 39e4 <TestCopyWord+0x102>
  }
  tmp = destination;
    3a72:	2f6f 006c 0094 	move.l 108(sp),148(sp)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3a78:	42af 008c      	clr.l 140(sp)
    3a7c:	6014           	bra.s 3a92 <TestCopyWord+0x1b0>
    *tmp++ = 0;
    3a7e:	202f 0094      	move.l 148(sp),d0
    3a82:	2200           	move.l d0,d1
    3a84:	5481           	addq.l #2,d1
    3a86:	2f41 0094      	move.l d1,148(sp)
    3a8a:	2040           	movea.l d0,a0
    3a8c:	4250           	clr.w (a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3a8e:	52af 008c      	addq.l #1,140(sp)
    3a92:	0caf 0000 0275 	cmpi.l #629,140(sp)
    3a98:	008c 
    3a9a:	6fe2           	ble.s 3a7e <TestCopyWord+0x19c>
  }

  WaitBlit();
    3a9c:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    3aa2:	2c40           	movea.l d0,a6
    3aa4:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
    3aa8:	4eba db5a      	jsr 1604 <Zoom_Init>(pc)
  Init_Copy( 3);
    3aac:	4878 0003      	pea 3 <_start+0x3>
    3ab0:	4eba e184      	jsr 1c36 <Init_Copy>(pc)
    3ab4:	588f           	addq.l #4,sp
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
    3ab6:	202f 007c      	move.l 124(sp),d0
    3aba:	5480           	addq.l #2,d0
    3abc:	4878 0010      	pea 10 <_start+0x10>
    3ac0:	2f2f 0070      	move.l 112(sp),-(sp)
    3ac4:	2f00           	move.l d0,-(sp)
    3ac6:	4eba d710      	jsr 11d8 <Zoom_CopyWord>(pc)
    3aca:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    3ace:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    3ad4:	2c40           	movea.l d0,a6
    3ad6:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
    3ada:	202f 006c      	move.l 108(sp),d0
    3ade:	5480           	addq.l #2,d0
    3ae0:	2f40 0094      	move.l d0,148(sp)
  if( *tmp != 0x5555) 
    3ae4:	206f 0094      	movea.l 148(sp),a0
    3ae8:	3010           	move.w (a0),d0
    3aea:	0c40 5555      	cmpi.w #21845,d0
    3aee:	6742           	beq.s 3b32 <TestCopyWord+0x250>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    3af0:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3af6:	2c40           	movea.l d0,a6
    3af8:	4eae ffc4      	jsr -60(a6)
    3afc:	2f40 0068      	move.l d0,104(sp)
    3b00:	202f 0068      	move.l 104(sp),d0
    3b04:	2f40 0064      	move.l d0,100(sp)
    3b08:	2f7c 0000 8612 	move.l #34322,96(sp)
    3b0e:	0060 
    3b10:	721f           	moveq #31,d1
    3b12:	2f41 005c      	move.l d1,92(sp)
    3b16:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3b1c:	2c40           	movea.l d0,a6
    3b1e:	222f 0064      	move.l 100(sp),d1
    3b22:	242f 0060      	move.l 96(sp),d2
    3b26:	262f 005c      	move.l 92(sp),d3
    3b2a:	4eae ffd0      	jsr -48(a6)
    3b2e:	2f40 0058      	move.l d0,88(sp)
  tmp += ZMLINESIZE/2;
    3b32:	702a           	moveq #42,d0
    3b34:	d1af 0094      	add.l d0,148(sp)
  if( *tmp != 0xaaaa)
    3b38:	206f 0094      	movea.l 148(sp),a0
    3b3c:	3010           	move.w (a0),d0
    3b3e:	0c40 aaaa      	cmpi.w #-21846,d0
    3b42:	6742           	beq.s 3b86 <TestCopyWord+0x2a4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    3b44:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3b4a:	2c40           	movea.l d0,a6
    3b4c:	4eae ffc4      	jsr -60(a6)
    3b50:	2f40 0054      	move.l d0,84(sp)
    3b54:	202f 0054      	move.l 84(sp),d0
    3b58:	2f40 0050      	move.l d0,80(sp)
    3b5c:	2f7c 0000 8632 	move.l #34354,76(sp)
    3b62:	004c 
    3b64:	7220           	moveq #32,d1
    3b66:	2f41 0048      	move.l d1,72(sp)
    3b6a:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3b70:	2c40           	movea.l d0,a6
    3b72:	222f 0050      	move.l 80(sp),d1
    3b76:	242f 004c      	move.l 76(sp),d2
    3b7a:	262f 0048      	move.l 72(sp),d3
    3b7e:	4eae ffd0      	jsr -48(a6)
    3b82:	2f40 0044      	move.l d0,68(sp)
  
  FreeMem( source,ZMLINESIZE*30);
    3b86:	2f6f 007c 0040 	move.l 124(sp),64(sp)
    3b8c:	2f7c 0000 04ec 	move.l #1260,60(sp)
    3b92:	003c 
    3b94:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    3b9a:	2c40           	movea.l d0,a6
    3b9c:	226f 0040      	movea.l 64(sp),a1
    3ba0:	202f 003c      	move.l 60(sp),d0
    3ba4:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    3ba8:	2f6f 006c 0038 	move.l 108(sp),56(sp)
    3bae:	2f7c 0000 04ec 	move.l #1260,52(sp)
    3bb4:	0034 
    3bb6:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    3bbc:	2c40           	movea.l d0,a6
    3bbe:	226f 0038      	movea.l 56(sp),a1
    3bc2:	202f 0034      	move.l 52(sp),d0
    3bc6:	4eae ff2e      	jsr -210(a6)
}
    3bca:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3bce:	4fef 008c      	lea 140(sp),sp
    3bd2:	4e75           	rts

00003bd4 <TestZoom4PictureOn5Planes>:
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */


void TestZoom4PictureOn5Planes() {
    3bd4:	4fef ff74      	lea -140(sp),sp
    3bd8:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3bdc:	2f7c 0000 f460 	move.l #62560,102(sp)
    3be2:	0066 
    3be4:	7002           	moveq #2,d0
    3be6:	2f40 0062      	move.l d0,98(sp)
    3bea:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    3bf0:	2c40           	movea.l d0,a6
    3bf2:	202f 0066      	move.l 102(sp),d0
    3bf6:	222f 0062      	move.l 98(sp),d1
    3bfa:	4eae ff3a      	jsr -198(a6)
    3bfe:	2f40 005e      	move.l d0,94(sp)
    3c02:	202f 005e      	move.l 94(sp),d0
    3c06:	2f40 005a      	move.l d0,90(sp)
  if( source == 0) {
    3c0a:	6646           	bne.s 3c52 <TestZoom4PictureOn5Planes+0x7e>
    Write(  Output(), 
    3c0c:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3c12:	2c40           	movea.l d0,a6
    3c14:	4eae ffc4      	jsr -60(a6)
    3c18:	2f40 001e      	move.l d0,30(sp)
    3c1c:	202f 001e      	move.l 30(sp),d0
    3c20:	2f40 001a      	move.l d0,26(sp)
    3c24:	2f7c 0000 8653 	move.l #34387,22(sp)
    3c2a:	0016 
    3c2c:	7239           	moveq #57,d1
    3c2e:	2f41 0012      	move.l d1,18(sp)
    3c32:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3c38:	2c40           	movea.l d0,a6
    3c3a:	222f 001a      	move.l 26(sp),d1
    3c3e:	242f 0016      	move.l 22(sp),d2
    3c42:	262f 0012      	move.l 18(sp),d3
    3c46:	4eae ffd0      	jsr -48(a6)
    3c4a:	2f40 000e      	move.l d0,14(sp)
    3c4e:	6000 0266      	bra.w 3eb6 <TestZoom4PictureOn5Planes+0x2e2>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3c52:	2f7c 0000 f460 	move.l #62560,86(sp)
    3c58:	0056 
    3c5a:	7002           	moveq #2,d0
    3c5c:	2f40 0052      	move.l d0,82(sp)
    3c60:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    3c66:	2c40           	movea.l d0,a6
    3c68:	202f 0056      	move.l 86(sp),d0
    3c6c:	222f 0052      	move.l 82(sp),d1
    3c70:	4eae ff3a      	jsr -198(a6)
    3c74:	2f40 004e      	move.l d0,78(sp)
    3c78:	202f 004e      	move.l 78(sp),d0
    3c7c:	2f40 004a      	move.l d0,74(sp)
  if( destination == 0) {
    3c80:	6646           	bne.s 3cc8 <TestZoom4PictureOn5Planes+0xf4>
    Write(  Output(), 
    3c82:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3c88:	2c40           	movea.l d0,a6
    3c8a:	4eae ffc4      	jsr -60(a6)
    3c8e:	2f40 0032      	move.l d0,50(sp)
    3c92:	202f 0032      	move.l 50(sp),d0
    3c96:	2f40 002e      	move.l d0,46(sp)
    3c9a:	2f7c 0000 868d 	move.l #34445,42(sp)
    3ca0:	002a 
    3ca2:	723d           	moveq #61,d1
    3ca4:	2f41 0026      	move.l d1,38(sp)
    3ca8:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3cae:	2c40           	movea.l d0,a6
    3cb0:	222f 002e      	move.l 46(sp),d1
    3cb4:	242f 002a      	move.l 42(sp),d2
    3cb8:	262f 0026      	move.l 38(sp),d3
    3cbc:	4eae ffd0      	jsr -48(a6)
    3cc0:	2f40 0022      	move.l d0,34(sp)
    3cc4:	6000 01f0      	bra.w 3eb6 <TestZoom4PictureOn5Planes+0x2e2>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3cc8:	2f6f 005a 0094 	move.l 90(sp),148(sp)
  for(int i=0;i<128+8;i++) {
    3cce:	42af 0090      	clr.l 144(sp)
    3cd2:	6050           	bra.s 3d24 <TestZoom4PictureOn5Planes+0x150>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3cd4:	42af 008c      	clr.l 140(sp)
    3cd8:	6018           	bra.s 3cf2 <TestZoom4PictureOn5Planes+0x11e>
      *tmp4source++ = 0x55555555;
    3cda:	202f 0094      	move.l 148(sp),d0
    3cde:	2200           	move.l d0,d1
    3ce0:	5881           	addq.l #4,d1
    3ce2:	2f41 0094      	move.l d1,148(sp)
    3ce6:	2040           	movea.l d0,a0
    3ce8:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3cee:	52af 008c      	addq.l #1,140(sp)
    3cf2:	7031           	moveq #49,d0
    3cf4:	b0af 008c      	cmp.l 140(sp),d0
    3cf8:	6ce0           	bge.s 3cda <TestZoom4PictureOn5Planes+0x106>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3cfa:	42af 0088      	clr.l 136(sp)
    3cfe:	6018           	bra.s 3d18 <TestZoom4PictureOn5Planes+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3d00:	202f 0094      	move.l 148(sp),d0
    3d04:	2200           	move.l d0,d1
    3d06:	5881           	addq.l #4,d1
    3d08:	2f41 0094      	move.l d1,148(sp)
    3d0c:	2040           	movea.l d0,a0
    3d0e:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3d14:	52af 0088      	addq.l #1,136(sp)
    3d18:	7031           	moveq #49,d0
    3d1a:	b0af 0088      	cmp.l 136(sp),d0
    3d1e:	6ce0           	bge.s 3d00 <TestZoom4PictureOn5Planes+0x12c>
  for(int i=0;i<128+8;i++) {
    3d20:	52af 0090      	addq.l #1,144(sp)
    3d24:	0caf 0000 0087 	cmpi.l #135,144(sp)
    3d2a:	0090 
    3d2c:	6fa6           	ble.s 3cd4 <TestZoom4PictureOn5Planes+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3d2e:	4878 0005      	pea 5 <_start+0x5>
    3d32:	42a7           	clr.l -(sp)
    3d34:	2f2f 0052      	move.l 82(sp),-(sp)
    3d38:	2f2f 0066      	move.l 102(sp),-(sp)
    3d3c:	4eba df32      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    3d40:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3d44:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    3d4a:	2c40           	movea.l d0,a6
    3d4c:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3d50:	222f 004a      	move.l 74(sp),d1
    3d54:	5881           	addq.l #4,d1
    3d56:	2f41 0084      	move.l d1,132(sp)
  UWORD *valsupposed = destlinezoom1;
    3d5a:	2f7c 0000 bcec 	move.l #48364,70(sp)
    3d60:	0046 
  UWORD mask = 0xffff;
    3d62:	3f7c ffff 0082 	move.w #-1,130(sp)
  for(int i=0;i<14;i++) {
    3d68:	42af 007e      	clr.l 126(sp)
    3d6c:	6000 00a8      	bra.w 3e16 <TestZoom4PictureOn5Planes+0x242>
    for(int i2=0;i2<18;i2++) { 
    3d70:	42af 007a      	clr.l 122(sp)
    3d74:	604e           	bra.s 3dc4 <TestZoom4PictureOn5Planes+0x1f0>
      for( int i3=0;i3<5;i3++) {
    3d76:	42af 0076      	clr.l 118(sp)
    3d7a:	6038           	bra.s 3db4 <TestZoom4PictureOn5Planes+0x1e0>
        TestRow( valsupposed, valactual, mask, i2+i*19);
    3d7c:	222f 007e      	move.l 126(sp),d1
    3d80:	2001           	move.l d1,d0
    3d82:	e788           	lsl.l #3,d0
    3d84:	d081           	add.l d1,d0
    3d86:	d080           	add.l d0,d0
    3d88:	d081           	add.l d1,d0
    3d8a:	2200           	move.l d0,d1
    3d8c:	d2af 007a      	add.l 122(sp),d1
    3d90:	7000           	moveq #0,d0
    3d92:	302f 0082      	move.w 130(sp),d0
    3d96:	2f01           	move.l d1,-(sp)
    3d98:	2f00           	move.l d0,-(sp)
    3d9a:	2f2f 008c      	move.l 140(sp),-(sp)
    3d9e:	2f2f 0052      	move.l 82(sp),-(sp)
    3da2:	4eba 2f7e      	jsr 6d22 <TestRow>(pc)
    3da6:	4fef 0010      	lea 16(sp),sp
        valactual += ZMLINESIZE/2;
    3daa:	702a           	moveq #42,d0
    3dac:	d1af 0084      	add.l d0,132(sp)
      for( int i3=0;i3<5;i3++) {
    3db0:	52af 0076      	addq.l #1,118(sp)
    3db4:	7204           	moveq #4,d1
    3db6:	b2af 0076      	cmp.l 118(sp),d1
    3dba:	6cc0           	bge.s 3d7c <TestZoom4PictureOn5Planes+0x1a8>
      }
      mask = mask ^ 0xffff;
    3dbc:	466f 0082      	not.w 130(sp)
    for(int i2=0;i2<18;i2++) { 
    3dc0:	52af 007a      	addq.l #1,122(sp)
    3dc4:	7011           	moveq #17,d0
    3dc6:	b0af 007a      	cmp.l 122(sp),d0
    3dca:	6caa           	bge.s 3d76 <TestZoom4PictureOn5Planes+0x1a2>
    }
    for( int i3=0;i3<5;i3++) {
    3dcc:	42af 0072      	clr.l 114(sp)
    3dd0:	6038           	bra.s 3e0a <TestZoom4PictureOn5Planes+0x236>
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3dd2:	222f 007e      	move.l 126(sp),d1
    3dd6:	2001           	move.l d1,d0
    3dd8:	e788           	lsl.l #3,d0
    3dda:	d081           	add.l d1,d0
    3ddc:	d080           	add.l d0,d0
    3dde:	2040           	movea.l d0,a0
    3de0:	d1c1           	adda.l d1,a0
    3de2:	41e8 0012      	lea 18(a0),a0
    3de6:	7000           	moveq #0,d0
    3de8:	302f 0082      	move.w 130(sp),d0
    3dec:	2f08           	move.l a0,-(sp)
    3dee:	2f00           	move.l d0,-(sp)
    3df0:	2f2f 008c      	move.l 140(sp),-(sp)
    3df4:	2f2f 0052      	move.l 82(sp),-(sp)
    3df8:	4eba 2f28      	jsr 6d22 <TestRow>(pc)
    3dfc:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3e00:	722a           	moveq #42,d1
    3e02:	d3af 0084      	add.l d1,132(sp)
    for( int i3=0;i3<5;i3++) {
    3e06:	52af 0072      	addq.l #1,114(sp)
    3e0a:	7004           	moveq #4,d0
    3e0c:	b0af 0072      	cmp.l 114(sp),d0
    3e10:	6cc0           	bge.s 3dd2 <TestZoom4PictureOn5Planes+0x1fe>
  for(int i=0;i<14;i++) {
    3e12:	52af 007e      	addq.l #1,126(sp)
    3e16:	720d           	moveq #13,d1
    3e18:	b2af 007e      	cmp.l 126(sp),d1
    3e1c:	6c00 ff52      	bge.w 3d70 <TestZoom4PictureOn5Planes+0x19c>
    }
  }
  for(int i2=0;i2<4;i2++) { 
    3e20:	42af 006e      	clr.l 110(sp)
    3e24:	6044           	bra.s 3e6a <TestZoom4PictureOn5Planes+0x296>
    for( int i3=0;i3<5;i3++) {
    3e26:	42af 006a      	clr.l 106(sp)
    3e2a:	602e           	bra.s 3e5a <TestZoom4PictureOn5Planes+0x286>
      TestRow( valsupposed, valactual, mask, i2+265);
    3e2c:	222f 006e      	move.l 110(sp),d1
    3e30:	0681 0000 0109 	addi.l #265,d1
    3e36:	7000           	moveq #0,d0
    3e38:	302f 0082      	move.w 130(sp),d0
    3e3c:	2f01           	move.l d1,-(sp)
    3e3e:	2f00           	move.l d0,-(sp)
    3e40:	2f2f 008c      	move.l 140(sp),-(sp)
    3e44:	2f2f 0052      	move.l 82(sp),-(sp)
    3e48:	4eba 2ed8      	jsr 6d22 <TestRow>(pc)
    3e4c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3e50:	702a           	moveq #42,d0
    3e52:	d1af 0084      	add.l d0,132(sp)
    for( int i3=0;i3<5;i3++) {
    3e56:	52af 006a      	addq.l #1,106(sp)
    3e5a:	7204           	moveq #4,d1
    3e5c:	b2af 006a      	cmp.l 106(sp),d1
    3e60:	6cca           	bge.s 3e2c <TestZoom4PictureOn5Planes+0x258>
    }
    mask = mask ^ 0xffff;
    3e62:	466f 0082      	not.w 130(sp)
  for(int i2=0;i2<4;i2++) { 
    3e66:	52af 006e      	addq.l #1,110(sp)
    3e6a:	7003           	moveq #3,d0
    3e6c:	b0af 006e      	cmp.l 110(sp),d0
    3e70:	6cb4           	bge.s 3e26 <TestZoom4PictureOn5Planes+0x252>
  } 
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    3e72:	2f6f 005a 0042 	move.l 90(sp),66(sp)
    3e78:	2f7c 0000 f460 	move.l #62560,62(sp)
    3e7e:	003e 
    3e80:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    3e86:	2c40           	movea.l d0,a6
    3e88:	226f 0042      	movea.l 66(sp),a1
    3e8c:	202f 003e      	move.l 62(sp),d0
    3e90:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    3e94:	2f6f 004a 003a 	move.l 74(sp),58(sp)
    3e9a:	2f7c 0000 f460 	move.l #62560,54(sp)
    3ea0:	0036 
    3ea2:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    3ea8:	2c40           	movea.l d0,a6
    3eaa:	226f 003a      	movea.l 58(sp),a1
    3eae:	202f 0036      	move.l 54(sp),d0
    3eb2:	4eae ff2e      	jsr -210(a6)
}
    3eb6:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3eba:	4fef 008c      	lea 140(sp),sp
    3ebe:	4e75           	rts

00003ec0 <TestZoom4Picture>:

void TestZoom4Picture() {
    3ec0:	4fef fe30      	lea -464(sp),sp
    3ec4:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3ec8:	2f7c 0000 30e0 	move.l #12512,106(sp)
    3ece:	006a 
    3ed0:	7002           	moveq #2,d0
    3ed2:	2f40 0066      	move.l d0,102(sp)
    3ed6:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    3edc:	2c40           	movea.l d0,a6
    3ede:	202f 006a      	move.l 106(sp),d0
    3ee2:	222f 0066      	move.l 102(sp),d1
    3ee6:	4eae ff3a      	jsr -198(a6)
    3eea:	2f40 0062      	move.l d0,98(sp)
    3eee:	202f 0062      	move.l 98(sp),d0
    3ef2:	2f40 005e      	move.l d0,94(sp)
  if( source == 0) {
    3ef6:	6646           	bne.s 3f3e <TestZoom4Picture+0x7e>
    Write(  Output(), 
    3ef8:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3efe:	2c40           	movea.l d0,a6
    3f00:	4eae ffc4      	jsr -60(a6)
    3f04:	2f40 001e      	move.l d0,30(sp)
    3f08:	202f 001e      	move.l 30(sp),d0
    3f0c:	2f40 001a      	move.l d0,26(sp)
    3f10:	2f7c 0000 8653 	move.l #34387,22(sp)
    3f16:	0016 
    3f18:	7239           	moveq #57,d1
    3f1a:	2f41 0012      	move.l d1,18(sp)
    3f1e:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3f24:	2c40           	movea.l d0,a6
    3f26:	222f 001a      	move.l 26(sp),d1
    3f2a:	242f 0016      	move.l 22(sp),d2
    3f2e:	262f 0012      	move.l 18(sp),d3
    3f32:	4eae ffd0      	jsr -48(a6)
    3f36:	2f40 000e      	move.l d0,14(sp)
    3f3a:	6000 2ddc      	bra.w 6d18 <TestZoom4Picture+0x2e58>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3f3e:	2f7c 0000 30e0 	move.l #12512,90(sp)
    3f44:	005a 
    3f46:	7002           	moveq #2,d0
    3f48:	2f40 0056      	move.l d0,86(sp)
    3f4c:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    3f52:	2c40           	movea.l d0,a6
    3f54:	202f 005a      	move.l 90(sp),d0
    3f58:	222f 0056      	move.l 86(sp),d1
    3f5c:	4eae ff3a      	jsr -198(a6)
    3f60:	2f40 0052      	move.l d0,82(sp)
    3f64:	202f 0052      	move.l 82(sp),d0
    3f68:	2f40 004e      	move.l d0,78(sp)
  if( destination == 0) {
    3f6c:	6646           	bne.s 3fb4 <TestZoom4Picture+0xf4>
    Write(  Output(), 
    3f6e:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3f74:	2c40           	movea.l d0,a6
    3f76:	4eae ffc4      	jsr -60(a6)
    3f7a:	2f40 0032      	move.l d0,50(sp)
    3f7e:	202f 0032      	move.l 50(sp),d0
    3f82:	2f40 002e      	move.l d0,46(sp)
    3f86:	2f7c 0000 868d 	move.l #34445,42(sp)
    3f8c:	002a 
    3f8e:	723d           	moveq #61,d1
    3f90:	2f41 0026      	move.l d1,38(sp)
    3f94:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    3f9a:	2c40           	movea.l d0,a6
    3f9c:	222f 002e      	move.l 46(sp),d1
    3fa0:	242f 002a      	move.l 42(sp),d2
    3fa4:	262f 0026      	move.l 38(sp),d3
    3fa8:	4eae ffd0      	jsr -48(a6)
    3fac:	2f40 0022      	move.l d0,34(sp)
    3fb0:	6000 2d66      	bra.w 6d18 <TestZoom4Picture+0x2e58>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3fb4:	2f6f 005e 01d8 	move.l 94(sp),472(sp)
  for(int i=0;i<128+8;i++) {
    3fba:	42af 01d4      	clr.l 468(sp)
    3fbe:	6050           	bra.s 4010 <TestZoom4Picture+0x150>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3fc0:	42af 01d0      	clr.l 464(sp)
    3fc4:	6018           	bra.s 3fde <TestZoom4Picture+0x11e>
      *tmp4source++ = 0x55555555;
    3fc6:	202f 01d8      	move.l 472(sp),d0
    3fca:	2200           	move.l d0,d1
    3fcc:	5881           	addq.l #4,d1
    3fce:	2f41 01d8      	move.l d1,472(sp)
    3fd2:	2040           	movea.l d0,a0
    3fd4:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3fda:	52af 01d0      	addq.l #1,464(sp)
    3fde:	7009           	moveq #9,d0
    3fe0:	b0af 01d0      	cmp.l 464(sp),d0
    3fe4:	6ce0           	bge.s 3fc6 <TestZoom4Picture+0x106>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3fe6:	42af 01cc      	clr.l 460(sp)
    3fea:	6018           	bra.s 4004 <TestZoom4Picture+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3fec:	202f 01d8      	move.l 472(sp),d0
    3ff0:	2200           	move.l d0,d1
    3ff2:	5881           	addq.l #4,d1
    3ff4:	2f41 01d8      	move.l d1,472(sp)
    3ff8:	2040           	movea.l d0,a0
    3ffa:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    4000:	52af 01cc      	addq.l #1,460(sp)
    4004:	7009           	moveq #9,d0
    4006:	b0af 01cc      	cmp.l 460(sp),d0
    400a:	6ce0           	bge.s 3fec <TestZoom4Picture+0x12c>
  for(int i=0;i<128+8;i++) {
    400c:	52af 01d4      	addq.l #1,468(sp)
    4010:	0caf 0000 0087 	cmpi.l #135,468(sp)
    4016:	01d4 
    4018:	6fa6           	ble.s 3fc0 <TestZoom4Picture+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    401a:	4878 0001      	pea 1 <_start+0x1>
    401e:	42a7           	clr.l -(sp)
    4020:	2f2f 0056      	move.l 86(sp),-(sp)
    4024:	2f2f 006a      	move.l 106(sp),-(sp)
    4028:	4eba dc46      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    402c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4030:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    4036:	2c40           	movea.l d0,a6
    4038:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    403c:	222f 004e      	move.l 78(sp),d1
    4040:	5881           	addq.l #4,d1
    4042:	2f41 01c8      	move.l d1,456(sp)
  UWORD *valsupposed = destlinezoom1;
    4046:	2f7c 0000 bcec 	move.l #48364,74(sp)
    404c:	004a 
  UWORD mask = 0xffff;
    404e:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<14;i++) {
    4054:	42af 01c2      	clr.l 450(sp)
    4058:	6000 0084      	bra.w 40de <TestZoom4Picture+0x21e>
    for(int i2=0;i2<18;i2++) { 
    405c:	42af 01be      	clr.l 446(sp)
    4060:	603c           	bra.s 409e <TestZoom4Picture+0x1de>
      TestRow( valsupposed, valactual, mask, i2+i*19);
    4062:	222f 01c2      	move.l 450(sp),d1
    4066:	2001           	move.l d1,d0
    4068:	e788           	lsl.l #3,d0
    406a:	d081           	add.l d1,d0
    406c:	d080           	add.l d0,d0
    406e:	d081           	add.l d1,d0
    4070:	2200           	move.l d0,d1
    4072:	d2af 01be      	add.l 446(sp),d1
    4076:	7000           	moveq #0,d0
    4078:	302f 01c6      	move.w 454(sp),d0
    407c:	2f01           	move.l d1,-(sp)
    407e:	2f00           	move.l d0,-(sp)
    4080:	2f2f 01d0      	move.l 464(sp),-(sp)
    4084:	2f2f 0056      	move.l 86(sp),-(sp)
    4088:	4eba 2c98      	jsr 6d22 <TestRow>(pc)
    408c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4090:	702a           	moveq #42,d0
    4092:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4096:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) { 
    409a:	52af 01be      	addq.l #1,446(sp)
    409e:	7211           	moveq #17,d1
    40a0:	b2af 01be      	cmp.l 446(sp),d1
    40a4:	6cbc           	bge.s 4062 <TestZoom4Picture+0x1a2>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    40a6:	222f 01c2      	move.l 450(sp),d1
    40aa:	2001           	move.l d1,d0
    40ac:	e788           	lsl.l #3,d0
    40ae:	d081           	add.l d1,d0
    40b0:	d080           	add.l d0,d0
    40b2:	2040           	movea.l d0,a0
    40b4:	d1c1           	adda.l d1,a0
    40b6:	41e8 0012      	lea 18(a0),a0
    40ba:	7000           	moveq #0,d0
    40bc:	302f 01c6      	move.w 454(sp),d0
    40c0:	2f08           	move.l a0,-(sp)
    40c2:	2f00           	move.l d0,-(sp)
    40c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    40c8:	2f2f 0056      	move.l 86(sp),-(sp)
    40cc:	4eba 2c54      	jsr 6d22 <TestRow>(pc)
    40d0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40d4:	702a           	moveq #42,d0
    40d6:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<14;i++) {
    40da:	52af 01c2      	addq.l #1,450(sp)
    40de:	720d           	moveq #13,d1
    40e0:	b2af 01c2      	cmp.l 450(sp),d1
    40e4:	6c00 ff76      	bge.w 405c <TestZoom4Picture+0x19c>
  }

  for(int i2=0;i2<4;i2++) { 
    40e8:	42af 01ba      	clr.l 442(sp)
    40ec:	6032           	bra.s 4120 <TestZoom4Picture+0x260>
    TestRow( valsupposed, valactual, mask, i2+265);
    40ee:	222f 01ba      	move.l 442(sp),d1
    40f2:	0681 0000 0109 	addi.l #265,d1
    40f8:	7000           	moveq #0,d0
    40fa:	302f 01c6      	move.w 454(sp),d0
    40fe:	2f01           	move.l d1,-(sp)
    4100:	2f00           	move.l d0,-(sp)
    4102:	2f2f 01d0      	move.l 464(sp),-(sp)
    4106:	2f2f 0056      	move.l 86(sp),-(sp)
    410a:	4eba 2c16      	jsr 6d22 <TestRow>(pc)
    410e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4112:	702a           	moveq #42,d0
    4114:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4118:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    411c:	52af 01ba      	addq.l #1,442(sp)
    4120:	7203           	moveq #3,d1
    4122:	b2af 01ba      	cmp.l 442(sp),d1
    4126:	6cc6           	bge.s 40ee <TestZoom4Picture+0x22e>
  }
  
  UWORD *tmp = source;
    4128:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    412e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4134:	2f6f 0046 004e 	move.l 70(sp),78(sp)
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    413a:	4878 0001      	pea 1 <_start+0x1>
    413e:	4878 0001      	pea 1 <_start+0x1>
    4142:	2f2f 0056      	move.l 86(sp),-(sp)
    4146:	2f2f 006a      	move.l 106(sp),-(sp)
    414a:	4eba db24      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    414e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4152:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    4158:	2c40           	movea.l d0,a6
    415a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    415e:	202f 004e      	move.l 78(sp),d0
    4162:	5880           	addq.l #4,d0
    4164:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom2;
    4168:	2f7c 0000 bd18 	move.l #48408,74(sp)
    416e:	004a 
  mask = 0x0000;
    4170:	426f 01c6      	clr.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    4174:	42af 01b6      	clr.l 438(sp)
    4178:	602a           	bra.s 41a4 <TestZoom4Picture+0x2e4>
    TestRow( valsupposed, valactual, mask, i2);
    417a:	7000           	moveq #0,d0
    417c:	302f 01c6      	move.w 454(sp),d0
    4180:	2f2f 01b6      	move.l 438(sp),-(sp)
    4184:	2f00           	move.l d0,-(sp)
    4186:	2f2f 01d0      	move.l 464(sp),-(sp)
    418a:	2f2f 0056      	move.l 86(sp),-(sp)
    418e:	4eba 2b92      	jsr 6d22 <TestRow>(pc)
    4192:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4196:	722a           	moveq #42,d1
    4198:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    419c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    41a0:	52af 01b6      	addq.l #1,438(sp)
    41a4:	700a           	moveq #10,d0
    41a6:	b0af 01b6      	cmp.l 438(sp),d0
    41aa:	6cce           	bge.s 417a <TestZoom4Picture+0x2ba>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    41ac:	4878 0008      	pea 8 <_start+0x8>
    41b0:	2f3c 0000 ffff 	move.l #65535,-(sp)
    41b6:	2f2f 01d0      	move.l 464(sp),-(sp)
    41ba:	2f2f 0056      	move.l 86(sp),-(sp)
    41be:	4eba 2b62      	jsr 6d22 <TestRow>(pc)
    41c2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    41c6:	722a           	moveq #42,d1
    41c8:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 9);
    41cc:	4878 0009      	pea 9 <_start+0x9>
    41d0:	2f3c 0000 ffff 	move.l #65535,-(sp)
    41d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    41da:	2f2f 0056      	move.l 86(sp),-(sp)
    41de:	4eba 2b42      	jsr 6d22 <TestRow>(pc)
    41e2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    41e6:	702a           	moveq #42,d0
    41e8:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 10);
    41ec:	4878 000a      	pea a <_start+0xa>
    41f0:	42a7           	clr.l -(sp)
    41f2:	2f2f 01d0      	move.l 464(sp),-(sp)
    41f6:	2f2f 0056      	move.l 86(sp),-(sp)
    41fa:	4eba 2b26      	jsr 6d22 <TestRow>(pc)
    41fe:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4202:	722a           	moveq #42,d1
    4204:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 11);
    4208:	4878 000b      	pea b <_start+0xb>
    420c:	42a7           	clr.l -(sp)
    420e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4212:	2f2f 0056      	move.l 86(sp),-(sp)
    4216:	4eba 2b0a      	jsr 6d22 <TestRow>(pc)
    421a:	4fef 0010      	lea 16(sp),sp

  valactual += ZMLINESIZE/2;
    421e:	702a           	moveq #42,d0
    4220:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<12;i++) {
    4224:	42af 01b2      	clr.l 434(sp)
    4228:	6000 0118      	bra.w 4342 <TestZoom4Picture+0x482>
    for(int i2=0;i2<16;i2++) {  
    422c:	42af 01ae      	clr.l 430(sp)
    4230:	603c           	bra.s 426e <TestZoom4Picture+0x3ae>
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    4232:	222f 01b2      	move.l 434(sp),d1
    4236:	2001           	move.l d1,d0
    4238:	e988           	lsl.l #4,d0
    423a:	d081           	add.l d1,d0
    423c:	2040           	movea.l d0,a0
    423e:	d1ef 01ae      	adda.l 430(sp),a0
    4242:	41e8 000b      	lea 11(a0),a0
    4246:	7000           	moveq #0,d0
    4248:	302f 01c6      	move.w 454(sp),d0
    424c:	2f08           	move.l a0,-(sp)
    424e:	2f00           	move.l d0,-(sp)
    4250:	2f2f 01d0      	move.l 464(sp),-(sp)
    4254:	2f2f 0056      	move.l 86(sp),-(sp)
    4258:	4eba 2ac8      	jsr 6d22 <TestRow>(pc)
    425c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4260:	722a           	moveq #42,d1
    4262:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4266:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {  
    426a:	52af 01ae      	addq.l #1,430(sp)
    426e:	700f           	moveq #15,d0
    4270:	b0af 01ae      	cmp.l 430(sp),d0
    4274:	6cbc           	bge.s 4232 <TestZoom4Picture+0x372>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    4276:	222f 01b2      	move.l 434(sp),d1
    427a:	2001           	move.l d1,d0
    427c:	e988           	lsl.l #4,d0
    427e:	2040           	movea.l d0,a0
    4280:	d1c1           	adda.l d1,a0
    4282:	41e8 0018      	lea 24(a0),a0
    4286:	7000           	moveq #0,d0
    4288:	302f 01c6      	move.w 454(sp),d0
    428c:	2f08           	move.l a0,-(sp)
    428e:	2f00           	move.l d0,-(sp)
    4290:	2f2f 01d0      	move.l 464(sp),-(sp)
    4294:	2f2f 0056      	move.l 86(sp),-(sp)
    4298:	4eba 2a88      	jsr 6d22 <TestRow>(pc)
    429c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    42a0:	722a           	moveq #42,d1
    42a2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    42a6:	222f 01b2      	move.l 434(sp),d1
    42aa:	2001           	move.l d1,d0
    42ac:	e988           	lsl.l #4,d0
    42ae:	2040           	movea.l d0,a0
    42b0:	d1c1           	adda.l d1,a0
    42b2:	41e8 0019      	lea 25(a0),a0
    42b6:	7000           	moveq #0,d0
    42b8:	302f 01c6      	move.w 454(sp),d0
    42bc:	2f08           	move.l a0,-(sp)
    42be:	2f00           	move.l d0,-(sp)
    42c0:	2f2f 01d0      	move.l 464(sp),-(sp)
    42c4:	2f2f 0056      	move.l 86(sp),-(sp)
    42c8:	4eba 2a58      	jsr 6d22 <TestRow>(pc)
    42cc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    42d0:	702a           	moveq #42,d0
    42d2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    42d6:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    42da:	222f 01b2      	move.l 434(sp),d1
    42de:	2001           	move.l d1,d0
    42e0:	e988           	lsl.l #4,d0
    42e2:	2040           	movea.l d0,a0
    42e4:	d1c1           	adda.l d1,a0
    42e6:	41e8 001a      	lea 26(a0),a0
    42ea:	7000           	moveq #0,d0
    42ec:	302f 01c6      	move.w 454(sp),d0
    42f0:	2f08           	move.l a0,-(sp)
    42f2:	2f00           	move.l d0,-(sp)
    42f4:	2f2f 01d0      	move.l 464(sp),-(sp)
    42f8:	2f2f 0056      	move.l 86(sp),-(sp)
    42fc:	4eba 2a24      	jsr 6d22 <TestRow>(pc)
    4300:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4304:	722a           	moveq #42,d1
    4306:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    430a:	222f 01b2      	move.l 434(sp),d1
    430e:	2001           	move.l d1,d0
    4310:	e988           	lsl.l #4,d0
    4312:	2040           	movea.l d0,a0
    4314:	d1c1           	adda.l d1,a0
    4316:	41e8 001b      	lea 27(a0),a0
    431a:	7000           	moveq #0,d0
    431c:	302f 01c6      	move.w 454(sp),d0
    4320:	2f08           	move.l a0,-(sp)
    4322:	2f00           	move.l d0,-(sp)
    4324:	2f2f 01d0      	move.l 464(sp),-(sp)
    4328:	2f2f 0056      	move.l 86(sp),-(sp)
    432c:	4eba 29f4      	jsr 6d22 <TestRow>(pc)
    4330:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4334:	702a           	moveq #42,d0
    4336:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    433a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    433e:	52af 01b2      	addq.l #1,434(sp)
    4342:	720b           	moveq #11,d1
    4344:	b2af 01b2      	cmp.l 434(sp),d1
    4348:	6c00 fee2      	bge.w 422c <TestZoom4Picture+0x36c>
    
  }

  for(int i2=0;i2<15;i2++) { 
    434c:	42af 01aa      	clr.l 426(sp)
    4350:	602a           	bra.s 437c <TestZoom4Picture+0x4bc>
    TestRow( valsupposed, valactual, mask, i2);
    4352:	7000           	moveq #0,d0
    4354:	302f 01c6      	move.w 454(sp),d0
    4358:	2f2f 01aa      	move.l 426(sp),-(sp)
    435c:	2f00           	move.l d0,-(sp)
    435e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4362:	2f2f 0056      	move.l 86(sp),-(sp)
    4366:	4eba 29ba      	jsr 6d22 <TestRow>(pc)
    436a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    436e:	702a           	moveq #42,d0
    4370:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4374:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<15;i2++) { 
    4378:	52af 01aa      	addq.l #1,426(sp)
    437c:	720e           	moveq #14,d1
    437e:	b2af 01aa      	cmp.l 426(sp),d1
    4382:	6cce           	bge.s 4352 <TestZoom4Picture+0x492>
  }

  tmp = source;
    4384:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    438a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4390:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    4396:	4878 0001      	pea 1 <_start+0x1>
    439a:	4878 0002      	pea 2 <_start+0x2>
    439e:	2f2f 0056      	move.l 86(sp),-(sp)
    43a2:	2f2f 006a      	move.l 106(sp),-(sp)
    43a6:	4eba d8c8      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    43aa:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    43ae:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    43b4:	2c40           	movea.l d0,a6
    43b6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    43ba:	202f 004e      	move.l 78(sp),d0
    43be:	5880           	addq.l #4,d0
    43c0:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom3;
    43c4:	2f7c 0000 bd44 	move.l #48452,74(sp)
    43ca:	004a 
  mask = 0xffff;
    43cc:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<4;i2++) { 
    43d2:	42af 01a6      	clr.l 422(sp)
    43d6:	602a           	bra.s 4402 <TestZoom4Picture+0x542>
    TestRow( valsupposed, valactual, mask, i2);
    43d8:	7000           	moveq #0,d0
    43da:	302f 01c6      	move.w 454(sp),d0
    43de:	2f2f 01a6      	move.l 422(sp),-(sp)
    43e2:	2f00           	move.l d0,-(sp)
    43e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    43e8:	2f2f 0056      	move.l 86(sp),-(sp)
    43ec:	4eba 2934      	jsr 6d22 <TestRow>(pc)
    43f0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43f4:	722a           	moveq #42,d1
    43f6:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    43fa:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    43fe:	52af 01a6      	addq.l #1,422(sp)
    4402:	7003           	moveq #3,d0
    4404:	b0af 01a6      	cmp.l 422(sp),d0
    4408:	6cce           	bge.s 43d8 <TestZoom4Picture+0x518>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    440a:	4878 0004      	pea 4 <_start+0x4>
    440e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4414:	2f2f 01d0      	move.l 464(sp),-(sp)
    4418:	2f2f 0056      	move.l 86(sp),-(sp)
    441c:	4eba 2904      	jsr 6d22 <TestRow>(pc)
    4420:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4424:	722a           	moveq #42,d1
    4426:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    442a:	4878 0005      	pea 5 <_start+0x5>
    442e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4434:	2f2f 01d0      	move.l 464(sp),-(sp)
    4438:	2f2f 0056      	move.l 86(sp),-(sp)
    443c:	4eba 28e4      	jsr 6d22 <TestRow>(pc)
    4440:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4444:	702a           	moveq #42,d0
    4446:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    444a:	4878 0006      	pea 6 <_start+0x6>
    444e:	42a7           	clr.l -(sp)
    4450:	2f2f 01d0      	move.l 464(sp),-(sp)
    4454:	2f2f 0056      	move.l 86(sp),-(sp)
    4458:	4eba 28c8      	jsr 6d22 <TestRow>(pc)
    445c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4460:	722a           	moveq #42,d1
    4462:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    4466:	4878 0007      	pea 7 <_start+0x7>
    446a:	42a7           	clr.l -(sp)
    446c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4470:	2f2f 0056      	move.l 86(sp),-(sp)
    4474:	4eba 28ac      	jsr 6d22 <TestRow>(pc)
    4478:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    447c:	702a           	moveq #42,d0
    447e:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    4482:	4878 0008      	pea 8 <_start+0x8>
    4486:	2f3c 0000 ffff 	move.l #65535,-(sp)
    448c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4490:	2f2f 0056      	move.l 86(sp),-(sp)
    4494:	4eba 288c      	jsr 6d22 <TestRow>(pc)
    4498:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    449c:	722a           	moveq #42,d1
    449e:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    44a2:	4878 0009      	pea 9 <_start+0x9>
    44a6:	2f3c 0000 ffff 	move.l #65535,-(sp)
    44ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    44b0:	2f2f 0056      	move.l 86(sp),-(sp)
    44b4:	4eba 286c      	jsr 6d22 <TestRow>(pc)
    44b8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44bc:	702a           	moveq #42,d0
    44be:	d1af 01c8      	add.l d0,456(sp)

  mask = 0x0000;
    44c2:	426f 01c6      	clr.w 454(sp)
  for(int i=0;i<12;i++) {
    44c6:	42af 01a2      	clr.l 418(sp)
    44ca:	6000 01a6      	bra.w 4672 <TestZoom4Picture+0x7b2>
    for(int i2=0;i2<15;i2++) {  
    44ce:	42af 019e      	clr.l 414(sp)
    44d2:	6042           	bra.s 4516 <TestZoom4Picture+0x656>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    44d4:	222f 01a2      	move.l 418(sp),d1
    44d8:	2001           	move.l d1,d0
    44da:	d080           	add.l d0,d0
    44dc:	d081           	add.l d1,d0
    44de:	2200           	move.l d0,d1
    44e0:	e789           	lsl.l #3,d1
    44e2:	9280           	sub.l d0,d1
    44e4:	2041           	movea.l d1,a0
    44e6:	d1ef 019e      	adda.l 414(sp),a0
    44ea:	41e8 0009      	lea 9(a0),a0
    44ee:	7000           	moveq #0,d0
    44f0:	302f 01c6      	move.w 454(sp),d0
    44f4:	2f08           	move.l a0,-(sp)
    44f6:	2f00           	move.l d0,-(sp)
    44f8:	2f2f 01d0      	move.l 464(sp),-(sp)
    44fc:	2f2f 0056      	move.l 86(sp),-(sp)
    4500:	4eba 2820      	jsr 6d22 <TestRow>(pc)
    4504:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4508:	722a           	moveq #42,d1
    450a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    450e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {  
    4512:	52af 019e      	addq.l #1,414(sp)
    4516:	700e           	moveq #14,d0
    4518:	b0af 019e      	cmp.l 414(sp),d0
    451c:	6cb6           	bge.s 44d4 <TestZoom4Picture+0x614>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    451e:	222f 01a2      	move.l 418(sp),d1
    4522:	2001           	move.l d1,d0
    4524:	d080           	add.l d0,d0
    4526:	d081           	add.l d1,d0
    4528:	2200           	move.l d0,d1
    452a:	e789           	lsl.l #3,d1
    452c:	2041           	movea.l d1,a0
    452e:	91c0           	suba.l d0,a0
    4530:	41e8 0018      	lea 24(a0),a0
    4534:	7000           	moveq #0,d0
    4536:	302f 01c6      	move.w 454(sp),d0
    453a:	2f08           	move.l a0,-(sp)
    453c:	2f00           	move.l d0,-(sp)
    453e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4542:	2f2f 0056      	move.l 86(sp),-(sp)
    4546:	4eba 27da      	jsr 6d22 <TestRow>(pc)
    454a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    454e:	722a           	moveq #42,d1
    4550:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    4554:	222f 01a2      	move.l 418(sp),d1
    4558:	2001           	move.l d1,d0
    455a:	d080           	add.l d0,d0
    455c:	d081           	add.l d1,d0
    455e:	2200           	move.l d0,d1
    4560:	e789           	lsl.l #3,d1
    4562:	2041           	movea.l d1,a0
    4564:	91c0           	suba.l d0,a0
    4566:	41e8 0019      	lea 25(a0),a0
    456a:	7000           	moveq #0,d0
    456c:	302f 01c6      	move.w 454(sp),d0
    4570:	2f08           	move.l a0,-(sp)
    4572:	2f00           	move.l d0,-(sp)
    4574:	2f2f 01d0      	move.l 464(sp),-(sp)
    4578:	2f2f 0056      	move.l 86(sp),-(sp)
    457c:	4eba 27a4      	jsr 6d22 <TestRow>(pc)
    4580:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4584:	702a           	moveq #42,d0
    4586:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    458a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    458e:	222f 01a2      	move.l 418(sp),d1
    4592:	2001           	move.l d1,d0
    4594:	d080           	add.l d0,d0
    4596:	d081           	add.l d1,d0
    4598:	2200           	move.l d0,d1
    459a:	e789           	lsl.l #3,d1
    459c:	2041           	movea.l d1,a0
    459e:	91c0           	suba.l d0,a0
    45a0:	41e8 001a      	lea 26(a0),a0
    45a4:	7000           	moveq #0,d0
    45a6:	302f 01c6      	move.w 454(sp),d0
    45aa:	2f08           	move.l a0,-(sp)
    45ac:	2f00           	move.l d0,-(sp)
    45ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    45b2:	2f2f 0056      	move.l 86(sp),-(sp)
    45b6:	4eba 276a      	jsr 6d22 <TestRow>(pc)
    45ba:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    45be:	722a           	moveq #42,d1
    45c0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    45c4:	222f 01a2      	move.l 418(sp),d1
    45c8:	2001           	move.l d1,d0
    45ca:	d080           	add.l d0,d0
    45cc:	d081           	add.l d1,d0
    45ce:	2200           	move.l d0,d1
    45d0:	e789           	lsl.l #3,d1
    45d2:	2041           	movea.l d1,a0
    45d4:	91c0           	suba.l d0,a0
    45d6:	41e8 001b      	lea 27(a0),a0
    45da:	7000           	moveq #0,d0
    45dc:	302f 01c6      	move.w 454(sp),d0
    45e0:	2f08           	move.l a0,-(sp)
    45e2:	2f00           	move.l d0,-(sp)
    45e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    45e8:	2f2f 0056      	move.l 86(sp),-(sp)
    45ec:	4eba 2734      	jsr 6d22 <TestRow>(pc)
    45f0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    45f4:	702a           	moveq #42,d0
    45f6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    45fa:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    45fe:	222f 01a2      	move.l 418(sp),d1
    4602:	2001           	move.l d1,d0
    4604:	d080           	add.l d0,d0
    4606:	d081           	add.l d1,d0
    4608:	2200           	move.l d0,d1
    460a:	e789           	lsl.l #3,d1
    460c:	2041           	movea.l d1,a0
    460e:	91c0           	suba.l d0,a0
    4610:	41e8 001c      	lea 28(a0),a0
    4614:	7000           	moveq #0,d0
    4616:	302f 01c6      	move.w 454(sp),d0
    461a:	2f08           	move.l a0,-(sp)
    461c:	2f00           	move.l d0,-(sp)
    461e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4622:	2f2f 0056      	move.l 86(sp),-(sp)
    4626:	4eba 26fa      	jsr 6d22 <TestRow>(pc)
    462a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    462e:	722a           	moveq #42,d1
    4630:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4634:	222f 01a2      	move.l 418(sp),d1
    4638:	2001           	move.l d1,d0
    463a:	d080           	add.l d0,d0
    463c:	d081           	add.l d1,d0
    463e:	2200           	move.l d0,d1
    4640:	e789           	lsl.l #3,d1
    4642:	2041           	movea.l d1,a0
    4644:	91c0           	suba.l d0,a0
    4646:	41e8 001d      	lea 29(a0),a0
    464a:	7000           	moveq #0,d0
    464c:	302f 01c6      	move.w 454(sp),d0
    4650:	2f08           	move.l a0,-(sp)
    4652:	2f00           	move.l d0,-(sp)
    4654:	2f2f 01d0      	move.l 464(sp),-(sp)
    4658:	2f2f 0056      	move.l 86(sp),-(sp)
    465c:	4eba 26c4      	jsr 6d22 <TestRow>(pc)
    4660:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4664:	702a           	moveq #42,d0
    4666:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    466a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    466e:	52af 01a2      	addq.l #1,418(sp)
    4672:	720b           	moveq #11,d1
    4674:	b2af 01a2      	cmp.l 418(sp),d1
    4678:	6c00 fe54      	bge.w 44ce <TestZoom4Picture+0x60e>
  }

  for(int i2=0;i2<8;i2++) {  
    467c:	42af 019a      	clr.l 410(sp)
    4680:	6032           	bra.s 46b4 <TestZoom4Picture+0x7f4>
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    4682:	222f 019a      	move.l 410(sp),d1
    4686:	0681 0000 0105 	addi.l #261,d1
    468c:	7000           	moveq #0,d0
    468e:	302f 01c6      	move.w 454(sp),d0
    4692:	2f01           	move.l d1,-(sp)
    4694:	2f00           	move.l d0,-(sp)
    4696:	2f2f 01d0      	move.l 464(sp),-(sp)
    469a:	2f2f 0056      	move.l 86(sp),-(sp)
    469e:	4eba 2682      	jsr 6d22 <TestRow>(pc)
    46a2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46a6:	702a           	moveq #42,d0
    46a8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    46ac:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    46b0:	52af 019a      	addq.l #1,410(sp)
    46b4:	7207           	moveq #7,d1
    46b6:	b2af 019a      	cmp.l 410(sp),d1
    46ba:	6cc6           	bge.s 4682 <TestZoom4Picture+0x7c2>
  }

  tmp = source;
    46bc:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    46c2:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    46c8:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    46ce:	4878 0001      	pea 1 <_start+0x1>
    46d2:	4878 0003      	pea 3 <_start+0x3>
    46d6:	2f2f 0056      	move.l 86(sp),-(sp)
    46da:	2f2f 006a      	move.l 106(sp),-(sp)
    46de:	4eba d590      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    46e2:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    46e6:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    46ec:	2c40           	movea.l d0,a6
    46ee:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    46f2:	202f 004e      	move.l 78(sp),d0
    46f6:	5880           	addq.l #4,d0
    46f8:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom4;
    46fc:	2f7c 0000 bd70 	move.l #48496,74(sp)
    4702:	004a 
  mask = 0x0000;
    4704:	426f 01c6      	clr.w 454(sp)
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    4708:	4878 0007      	pea 7 <_start+0x7>
    470c:	42a7           	clr.l -(sp)
    470e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4712:	2f2f 0056      	move.l 86(sp),-(sp)
    4716:	4eba 260a      	jsr 6d22 <TestRow>(pc)
    471a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    471e:	722a           	moveq #42,d1
    4720:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    4724:	4878 0008      	pea 8 <_start+0x8>
    4728:	2f3c 0000 ffff 	move.l #65535,-(sp)
    472e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4732:	2f2f 0056      	move.l 86(sp),-(sp)
    4736:	4eba 25ea      	jsr 6d22 <TestRow>(pc)
    473a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    473e:	702a           	moveq #42,d0
    4740:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    4744:	4878 0009      	pea 9 <_start+0x9>
    4748:	2f3c 0000 ffff 	move.l #65535,-(sp)
    474e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4752:	2f2f 0056      	move.l 86(sp),-(sp)
    4756:	4eba 25ca      	jsr 6d22 <TestRow>(pc)
    475a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    475e:	722a           	moveq #42,d1
    4760:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    4764:	4878 0008      	pea 8 <_start+0x8>
    4768:	42a7           	clr.l -(sp)
    476a:	2f2f 01d0      	move.l 464(sp),-(sp)
    476e:	2f2f 0056      	move.l 86(sp),-(sp)
    4772:	4eba 25ae      	jsr 6d22 <TestRow>(pc)
    4776:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    477a:	702a           	moveq #42,d0
    477c:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    4780:	4878 0009      	pea 9 <_start+0x9>
    4784:	42a7           	clr.l -(sp)
    4786:	2f2f 01d0      	move.l 464(sp),-(sp)
    478a:	2f2f 0056      	move.l 86(sp),-(sp)
    478e:	4eba 2592      	jsr 6d22 <TestRow>(pc)
    4792:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4796:	722a           	moveq #42,d1
    4798:	d3af 01c8      	add.l d1,456(sp)

  mask = 0xffff;
    479c:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<12;i++) {
    47a2:	42af 0196      	clr.l 406(sp)
    47a6:	6000 0216      	bra.w 49be <TestZoom4Picture+0xafe>
    for(int i2=0;i2<14;i2++) {  
    47aa:	42af 0192      	clr.l 402(sp)
    47ae:	6042           	bra.s 47f2 <TestZoom4Picture+0x932>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    47b0:	222f 0196      	move.l 406(sp),d1
    47b4:	2001           	move.l d1,d0
    47b6:	d080           	add.l d0,d0
    47b8:	d081           	add.l d1,d0
    47ba:	2200           	move.l d0,d1
    47bc:	e789           	lsl.l #3,d1
    47be:	9280           	sub.l d0,d1
    47c0:	2041           	movea.l d1,a0
    47c2:	d1ef 0192      	adda.l 402(sp),a0
    47c6:	41e8 0009      	lea 9(a0),a0
    47ca:	7000           	moveq #0,d0
    47cc:	302f 01c6      	move.w 454(sp),d0
    47d0:	2f08           	move.l a0,-(sp)
    47d2:	2f00           	move.l d0,-(sp)
    47d4:	2f2f 01d0      	move.l 464(sp),-(sp)
    47d8:	2f2f 0056      	move.l 86(sp),-(sp)
    47dc:	4eba 2544      	jsr 6d22 <TestRow>(pc)
    47e0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    47e4:	702a           	moveq #42,d0
    47e6:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    47ea:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {  
    47ee:	52af 0192      	addq.l #1,402(sp)
    47f2:	720d           	moveq #13,d1
    47f4:	b2af 0192      	cmp.l 402(sp),d1
    47f8:	6cb6           	bge.s 47b0 <TestZoom4Picture+0x8f0>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    47fa:	222f 0196      	move.l 406(sp),d1
    47fe:	2001           	move.l d1,d0
    4800:	d080           	add.l d0,d0
    4802:	d081           	add.l d1,d0
    4804:	2200           	move.l d0,d1
    4806:	e789           	lsl.l #3,d1
    4808:	2041           	movea.l d1,a0
    480a:	91c0           	suba.l d0,a0
    480c:	41e8 0018      	lea 24(a0),a0
    4810:	7000           	moveq #0,d0
    4812:	302f 01c6      	move.w 454(sp),d0
    4816:	2f08           	move.l a0,-(sp)
    4818:	2f00           	move.l d0,-(sp)
    481a:	2f2f 01d0      	move.l 464(sp),-(sp)
    481e:	2f2f 0056      	move.l 86(sp),-(sp)
    4822:	4eba 24fe      	jsr 6d22 <TestRow>(pc)
    4826:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    482a:	702a           	moveq #42,d0
    482c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    4830:	222f 0196      	move.l 406(sp),d1
    4834:	2001           	move.l d1,d0
    4836:	d080           	add.l d0,d0
    4838:	d081           	add.l d1,d0
    483a:	2200           	move.l d0,d1
    483c:	e789           	lsl.l #3,d1
    483e:	2041           	movea.l d1,a0
    4840:	91c0           	suba.l d0,a0
    4842:	41e8 0019      	lea 25(a0),a0
    4846:	7000           	moveq #0,d0
    4848:	302f 01c6      	move.w 454(sp),d0
    484c:	2f08           	move.l a0,-(sp)
    484e:	2f00           	move.l d0,-(sp)
    4850:	2f2f 01d0      	move.l 464(sp),-(sp)
    4854:	2f2f 0056      	move.l 86(sp),-(sp)
    4858:	4eba 24c8      	jsr 6d22 <TestRow>(pc)
    485c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4860:	722a           	moveq #42,d1
    4862:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4866:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    486a:	222f 0196      	move.l 406(sp),d1
    486e:	2001           	move.l d1,d0
    4870:	d080           	add.l d0,d0
    4872:	d081           	add.l d1,d0
    4874:	2200           	move.l d0,d1
    4876:	e789           	lsl.l #3,d1
    4878:	2041           	movea.l d1,a0
    487a:	91c0           	suba.l d0,a0
    487c:	41e8 001a      	lea 26(a0),a0
    4880:	7000           	moveq #0,d0
    4882:	302f 01c6      	move.w 454(sp),d0
    4886:	2f08           	move.l a0,-(sp)
    4888:	2f00           	move.l d0,-(sp)
    488a:	2f2f 01d0      	move.l 464(sp),-(sp)
    488e:	2f2f 0056      	move.l 86(sp),-(sp)
    4892:	4eba 248e      	jsr 6d22 <TestRow>(pc)
    4896:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    489a:	702a           	moveq #42,d0
    489c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    48a0:	222f 0196      	move.l 406(sp),d1
    48a4:	2001           	move.l d1,d0
    48a6:	d080           	add.l d0,d0
    48a8:	d081           	add.l d1,d0
    48aa:	2200           	move.l d0,d1
    48ac:	e789           	lsl.l #3,d1
    48ae:	2041           	movea.l d1,a0
    48b0:	91c0           	suba.l d0,a0
    48b2:	41e8 001b      	lea 27(a0),a0
    48b6:	7000           	moveq #0,d0
    48b8:	302f 01c6      	move.w 454(sp),d0
    48bc:	2f08           	move.l a0,-(sp)
    48be:	2f00           	move.l d0,-(sp)
    48c0:	2f2f 01d0      	move.l 464(sp),-(sp)
    48c4:	2f2f 0056      	move.l 86(sp),-(sp)
    48c8:	4eba 2458      	jsr 6d22 <TestRow>(pc)
    48cc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    48d0:	722a           	moveq #42,d1
    48d2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    48d6:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    48da:	222f 0196      	move.l 406(sp),d1
    48de:	2001           	move.l d1,d0
    48e0:	d080           	add.l d0,d0
    48e2:	d081           	add.l d1,d0
    48e4:	2200           	move.l d0,d1
    48e6:	e789           	lsl.l #3,d1
    48e8:	2041           	movea.l d1,a0
    48ea:	91c0           	suba.l d0,a0
    48ec:	41e8 001c      	lea 28(a0),a0
    48f0:	7000           	moveq #0,d0
    48f2:	302f 01c6      	move.w 454(sp),d0
    48f6:	2f08           	move.l a0,-(sp)
    48f8:	2f00           	move.l d0,-(sp)
    48fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    48fe:	2f2f 0056      	move.l 86(sp),-(sp)
    4902:	4eba 241e      	jsr 6d22 <TestRow>(pc)
    4906:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    490a:	702a           	moveq #42,d0
    490c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4910:	222f 0196      	move.l 406(sp),d1
    4914:	2001           	move.l d1,d0
    4916:	d080           	add.l d0,d0
    4918:	d081           	add.l d1,d0
    491a:	2200           	move.l d0,d1
    491c:	e789           	lsl.l #3,d1
    491e:	2041           	movea.l d1,a0
    4920:	91c0           	suba.l d0,a0
    4922:	41e8 001d      	lea 29(a0),a0
    4926:	7000           	moveq #0,d0
    4928:	302f 01c6      	move.w 454(sp),d0
    492c:	2f08           	move.l a0,-(sp)
    492e:	2f00           	move.l d0,-(sp)
    4930:	2f2f 01d0      	move.l 464(sp),-(sp)
    4934:	2f2f 0056      	move.l 86(sp),-(sp)
    4938:	4eba 23e8      	jsr 6d22 <TestRow>(pc)
    493c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4940:	722a           	moveq #42,d1
    4942:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4946:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    494a:	222f 0196      	move.l 406(sp),d1
    494e:	2001           	move.l d1,d0
    4950:	d080           	add.l d0,d0
    4952:	d081           	add.l d1,d0
    4954:	2200           	move.l d0,d1
    4956:	e789           	lsl.l #3,d1
    4958:	2041           	movea.l d1,a0
    495a:	91c0           	suba.l d0,a0
    495c:	41e8 001c      	lea 28(a0),a0
    4960:	7000           	moveq #0,d0
    4962:	302f 01c6      	move.w 454(sp),d0
    4966:	2f08           	move.l a0,-(sp)
    4968:	2f00           	move.l d0,-(sp)
    496a:	2f2f 01d0      	move.l 464(sp),-(sp)
    496e:	2f2f 0056      	move.l 86(sp),-(sp)
    4972:	4eba 23ae      	jsr 6d22 <TestRow>(pc)
    4976:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    497a:	702a           	moveq #42,d0
    497c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4980:	222f 0196      	move.l 406(sp),d1
    4984:	2001           	move.l d1,d0
    4986:	d080           	add.l d0,d0
    4988:	d081           	add.l d1,d0
    498a:	2200           	move.l d0,d1
    498c:	e789           	lsl.l #3,d1
    498e:	2041           	movea.l d1,a0
    4990:	91c0           	suba.l d0,a0
    4992:	41e8 001d      	lea 29(a0),a0
    4996:	7000           	moveq #0,d0
    4998:	302f 01c6      	move.w 454(sp),d0
    499c:	2f08           	move.l a0,-(sp)
    499e:	2f00           	move.l d0,-(sp)
    49a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    49a4:	2f2f 0056      	move.l 86(sp),-(sp)
    49a8:	4eba 2378      	jsr 6d22 <TestRow>(pc)
    49ac:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    49b0:	722a           	moveq #42,d1
    49b2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    49b6:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    49ba:	52af 0196      	addq.l #1,406(sp)
    49be:	700b           	moveq #11,d0
    49c0:	b0af 0196      	cmp.l 406(sp),d0
    49c4:	6c00 fde4      	bge.w 47aa <TestZoom4Picture+0x8ea>
  }

  TestRow( valsupposed, valactual, mask, 269);
    49c8:	7000           	moveq #0,d0
    49ca:	302f 01c6      	move.w 454(sp),d0
    49ce:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    49d2:	2f00           	move.l d0,-(sp)
    49d4:	2f2f 01d0      	move.l 464(sp),-(sp)
    49d8:	2f2f 0056      	move.l 86(sp),-(sp)
    49dc:	4eba 2344      	jsr 6d22 <TestRow>(pc)
    49e0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49e4:	722a           	moveq #42,d1
    49e6:	d3af 01c8      	add.l d1,456(sp)
  
  tmp = source;
    49ea:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    49f0:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    49f6:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    49fc:	4878 0001      	pea 1 <_start+0x1>
    4a00:	4878 0004      	pea 4 <_start+0x4>
    4a04:	2f2f 0056      	move.l 86(sp),-(sp)
    4a08:	2f2f 006a      	move.l 106(sp),-(sp)
    4a0c:	4eba d262      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    4a10:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4a14:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    4a1a:	2c40           	movea.l d0,a6
    4a1c:	4eae ff1c      	jsr -228(a6)

  valactual = destination+2; 
    4a20:	202f 004e      	move.l 78(sp),d0
    4a24:	5880           	addq.l #4,d0
    4a26:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom5;
    4a2a:	2f7c 0000 bd9c 	move.l #48540,74(sp)
    4a30:	004a 
  mask = 0x0000;
    4a32:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<13;i2++) {  
    4a36:	42af 018e      	clr.l 398(sp)
    4a3a:	602a           	bra.s 4a66 <TestZoom4Picture+0xba6>
    TestRow( valsupposed, valactual, mask, i2);
    4a3c:	7000           	moveq #0,d0
    4a3e:	302f 01c6      	move.w 454(sp),d0
    4a42:	2f2f 018e      	move.l 398(sp),-(sp)
    4a46:	2f00           	move.l d0,-(sp)
    4a48:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a4c:	2f2f 0056      	move.l 86(sp),-(sp)
    4a50:	4eba 22d0      	jsr 6d22 <TestRow>(pc)
    4a54:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a58:	722a           	moveq #42,d1
    4a5a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4a5e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4a62:	52af 018e      	addq.l #1,398(sp)
    4a66:	700c           	moveq #12,d0
    4a68:	b0af 018e      	cmp.l 398(sp),d0
    4a6c:	6cce           	bge.s 4a3c <TestZoom4Picture+0xb7c>
  }

  TestRow( valsupposed, valactual, mask, 12);   
    4a6e:	7000           	moveq #0,d0
    4a70:	302f 01c6      	move.w 454(sp),d0
    4a74:	4878 000c      	pea c <_start+0xc>
    4a78:	2f00           	move.l d0,-(sp)
    4a7a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a7e:	2f2f 0056      	move.l 86(sp),-(sp)
    4a82:	4eba 229e      	jsr 6d22 <TestRow>(pc)
    4a86:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a8a:	722a           	moveq #42,d1
    4a8c:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 13);
    4a90:	7000           	moveq #0,d0
    4a92:	302f 01c6      	move.w 454(sp),d0
    4a96:	4878 000d      	pea d <_start+0xd>
    4a9a:	2f00           	move.l d0,-(sp)
    4a9c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4aa0:	2f2f 0056      	move.l 86(sp),-(sp)
    4aa4:	4eba 227c      	jsr 6d22 <TestRow>(pc)
    4aa8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4aac:	702a           	moveq #42,d0
    4aae:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4ab2:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 14);
    4ab6:	7000           	moveq #0,d0
    4ab8:	302f 01c6      	move.w 454(sp),d0
    4abc:	4878 000e      	pea e <_start+0xe>
    4ac0:	2f00           	move.l d0,-(sp)
    4ac2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ac6:	2f2f 0056      	move.l 86(sp),-(sp)
    4aca:	4eba 2256      	jsr 6d22 <TestRow>(pc)
    4ace:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4ad2:	722a           	moveq #42,d1
    4ad4:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 15);
    4ad8:	7000           	moveq #0,d0
    4ada:	302f 01c6      	move.w 454(sp),d0
    4ade:	4878 000f      	pea f <_start+0xf>
    4ae2:	2f00           	move.l d0,-(sp)
    4ae4:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ae8:	2f2f 0056      	move.l 86(sp),-(sp)
    4aec:	4eba 2234      	jsr 6d22 <TestRow>(pc)
    4af0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4af4:	702a           	moveq #42,d0
    4af6:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4afa:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 16);
    4afe:	7000           	moveq #0,d0
    4b00:	302f 01c6      	move.w 454(sp),d0
    4b04:	4878 0010      	pea 10 <_start+0x10>
    4b08:	2f00           	move.l d0,-(sp)
    4b0a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b0e:	2f2f 0056      	move.l 86(sp),-(sp)
    4b12:	4eba 220e      	jsr 6d22 <TestRow>(pc)
    4b16:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4b1a:	722a           	moveq #42,d1
    4b1c:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 17);
    4b20:	7000           	moveq #0,d0
    4b22:	302f 01c6      	move.w 454(sp),d0
    4b26:	4878 0011      	pea 11 <_start+0x11>
    4b2a:	2f00           	move.l d0,-(sp)
    4b2c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b30:	2f2f 0056      	move.l 86(sp),-(sp)
    4b34:	4eba 21ec      	jsr 6d22 <TestRow>(pc)
    4b38:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4b3c:	702a           	moveq #42,d0
    4b3e:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4b42:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 18);
    4b46:	7000           	moveq #0,d0
    4b48:	302f 01c6      	move.w 454(sp),d0
    4b4c:	4878 0012      	pea 12 <_start+0x12>
    4b50:	2f00           	move.l d0,-(sp)
    4b52:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b56:	2f2f 0056      	move.l 86(sp),-(sp)
    4b5a:	4eba 21c6      	jsr 6d22 <TestRow>(pc)
    4b5e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4b62:	722a           	moveq #42,d1
    4b64:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 19);
    4b68:	7000           	moveq #0,d0
    4b6a:	302f 01c6      	move.w 454(sp),d0
    4b6e:	4878 0013      	pea 13 <_start+0x13>
    4b72:	2f00           	move.l d0,-(sp)
    4b74:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b78:	2f2f 0056      	move.l 86(sp),-(sp)
    4b7c:	4eba 21a4      	jsr 6d22 <TestRow>(pc)
    4b80:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4b84:	702a           	moveq #42,d0
    4b86:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4b8a:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 20);
    4b8e:	7000           	moveq #0,d0
    4b90:	302f 01c6      	move.w 454(sp),d0
    4b94:	4878 0014      	pea 14 <_start+0x14>
    4b98:	2f00           	move.l d0,-(sp)
    4b9a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b9e:	2f2f 0056      	move.l 86(sp),-(sp)
    4ba2:	4eba 217e      	jsr 6d22 <TestRow>(pc)
    4ba6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4baa:	722a           	moveq #42,d1
    4bac:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 21);
    4bb0:	7000           	moveq #0,d0
    4bb2:	302f 01c6      	move.w 454(sp),d0
    4bb6:	4878 0015      	pea 15 <_start+0x15>
    4bba:	2f00           	move.l d0,-(sp)
    4bbc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bc0:	2f2f 0056      	move.l 86(sp),-(sp)
    4bc4:	4eba 215c      	jsr 6d22 <TestRow>(pc)
    4bc8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4bcc:	702a           	moveq #42,d0
    4bce:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4bd2:	466f 01c6      	not.w 454(sp)


  for(int i=0;i<10;i++) {
    4bd6:	42af 018a      	clr.l 394(sp)
    4bda:	6000 0286      	bra.w 4e62 <TestZoom4Picture+0xfa2>
    for(int i2=0;i2<13;i2++) {  
    4bde:	42af 0186      	clr.l 390(sp)
    4be2:	6042           	bra.s 4c26 <TestZoom4Picture+0xd66>
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    4be4:	222f 018a      	move.l 394(sp),d1
    4be8:	2001           	move.l d1,d0
    4bea:	d080           	add.l d0,d0
    4bec:	d081           	add.l d1,d0
    4bee:	2200           	move.l d0,d1
    4bf0:	e789           	lsl.l #3,d1
    4bf2:	9280           	sub.l d0,d1
    4bf4:	2041           	movea.l d1,a0
    4bf6:	d1ef 0186      	adda.l 390(sp),a0
    4bfa:	41e8 0016      	lea 22(a0),a0
    4bfe:	7000           	moveq #0,d0
    4c00:	302f 01c6      	move.w 454(sp),d0
    4c04:	2f08           	move.l a0,-(sp)
    4c06:	2f00           	move.l d0,-(sp)
    4c08:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c0c:	2f2f 0056      	move.l 86(sp),-(sp)
    4c10:	4eba 2110      	jsr 6d22 <TestRow>(pc)
    4c14:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4c18:	722a           	moveq #42,d1
    4c1a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4c1e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {  
    4c22:	52af 0186      	addq.l #1,390(sp)
    4c26:	700c           	moveq #12,d0
    4c28:	b0af 0186      	cmp.l 390(sp),d0
    4c2c:	6cb6           	bge.s 4be4 <TestZoom4Picture+0xd24>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    4c2e:	222f 018a      	move.l 394(sp),d1
    4c32:	2001           	move.l d1,d0
    4c34:	d080           	add.l d0,d0
    4c36:	d081           	add.l d1,d0
    4c38:	2200           	move.l d0,d1
    4c3a:	e789           	lsl.l #3,d1
    4c3c:	2041           	movea.l d1,a0
    4c3e:	91c0           	suba.l d0,a0
    4c40:	41e8 0023      	lea 35(a0),a0
    4c44:	7000           	moveq #0,d0
    4c46:	302f 01c6      	move.w 454(sp),d0
    4c4a:	2f08           	move.l a0,-(sp)
    4c4c:	2f00           	move.l d0,-(sp)
    4c4e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c52:	2f2f 0056      	move.l 86(sp),-(sp)
    4c56:	4eba 20ca      	jsr 6d22 <TestRow>(pc)
    4c5a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c5e:	722a           	moveq #42,d1
    4c60:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    4c64:	222f 018a      	move.l 394(sp),d1
    4c68:	2001           	move.l d1,d0
    4c6a:	d080           	add.l d0,d0
    4c6c:	d081           	add.l d1,d0
    4c6e:	2200           	move.l d0,d1
    4c70:	e789           	lsl.l #3,d1
    4c72:	2041           	movea.l d1,a0
    4c74:	91c0           	suba.l d0,a0
    4c76:	41e8 0024      	lea 36(a0),a0
    4c7a:	7000           	moveq #0,d0
    4c7c:	302f 01c6      	move.w 454(sp),d0
    4c80:	2f08           	move.l a0,-(sp)
    4c82:	2f00           	move.l d0,-(sp)
    4c84:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c88:	2f2f 0056      	move.l 86(sp),-(sp)
    4c8c:	4eba 2094      	jsr 6d22 <TestRow>(pc)
    4c90:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c94:	702a           	moveq #42,d0
    4c96:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c9a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    4c9e:	222f 018a      	move.l 394(sp),d1
    4ca2:	2001           	move.l d1,d0
    4ca4:	d080           	add.l d0,d0
    4ca6:	d081           	add.l d1,d0
    4ca8:	2200           	move.l d0,d1
    4caa:	e789           	lsl.l #3,d1
    4cac:	2041           	movea.l d1,a0
    4cae:	91c0           	suba.l d0,a0
    4cb0:	41e8 0025      	lea 37(a0),a0
    4cb4:	7000           	moveq #0,d0
    4cb6:	302f 01c6      	move.w 454(sp),d0
    4cba:	2f08           	move.l a0,-(sp)
    4cbc:	2f00           	move.l d0,-(sp)
    4cbe:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cc2:	2f2f 0056      	move.l 86(sp),-(sp)
    4cc6:	4eba 205a      	jsr 6d22 <TestRow>(pc)
    4cca:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4cce:	722a           	moveq #42,d1
    4cd0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    4cd4:	222f 018a      	move.l 394(sp),d1
    4cd8:	2001           	move.l d1,d0
    4cda:	d080           	add.l d0,d0
    4cdc:	d081           	add.l d1,d0
    4cde:	2200           	move.l d0,d1
    4ce0:	e789           	lsl.l #3,d1
    4ce2:	2041           	movea.l d1,a0
    4ce4:	91c0           	suba.l d0,a0
    4ce6:	41e8 0026      	lea 38(a0),a0
    4cea:	7000           	moveq #0,d0
    4cec:	302f 01c6      	move.w 454(sp),d0
    4cf0:	2f08           	move.l a0,-(sp)
    4cf2:	2f00           	move.l d0,-(sp)
    4cf4:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cf8:	2f2f 0056      	move.l 86(sp),-(sp)
    4cfc:	4eba 2024      	jsr 6d22 <TestRow>(pc)
    4d00:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d04:	702a           	moveq #42,d0
    4d06:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4d0a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    4d0e:	222f 018a      	move.l 394(sp),d1
    4d12:	2001           	move.l d1,d0
    4d14:	d080           	add.l d0,d0
    4d16:	d081           	add.l d1,d0
    4d18:	2200           	move.l d0,d1
    4d1a:	e789           	lsl.l #3,d1
    4d1c:	2041           	movea.l d1,a0
    4d1e:	91c0           	suba.l d0,a0
    4d20:	41e8 0027      	lea 39(a0),a0
    4d24:	7000           	moveq #0,d0
    4d26:	302f 01c6      	move.w 454(sp),d0
    4d2a:	2f08           	move.l a0,-(sp)
    4d2c:	2f00           	move.l d0,-(sp)
    4d2e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d32:	2f2f 0056      	move.l 86(sp),-(sp)
    4d36:	4eba 1fea      	jsr 6d22 <TestRow>(pc)
    4d3a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d3e:	722a           	moveq #42,d1
    4d40:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    4d44:	222f 018a      	move.l 394(sp),d1
    4d48:	2001           	move.l d1,d0
    4d4a:	d080           	add.l d0,d0
    4d4c:	d081           	add.l d1,d0
    4d4e:	2200           	move.l d0,d1
    4d50:	e789           	lsl.l #3,d1
    4d52:	2041           	movea.l d1,a0
    4d54:	91c0           	suba.l d0,a0
    4d56:	41e8 0028      	lea 40(a0),a0
    4d5a:	7000           	moveq #0,d0
    4d5c:	302f 01c6      	move.w 454(sp),d0
    4d60:	2f08           	move.l a0,-(sp)
    4d62:	2f00           	move.l d0,-(sp)
    4d64:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d68:	2f2f 0056      	move.l 86(sp),-(sp)
    4d6c:	4eba 1fb4      	jsr 6d22 <TestRow>(pc)
    4d70:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d74:	702a           	moveq #42,d0
    4d76:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4d7a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    4d7e:	222f 018a      	move.l 394(sp),d1
    4d82:	2001           	move.l d1,d0
    4d84:	d080           	add.l d0,d0
    4d86:	d081           	add.l d1,d0
    4d88:	2200           	move.l d0,d1
    4d8a:	e789           	lsl.l #3,d1
    4d8c:	2041           	movea.l d1,a0
    4d8e:	91c0           	suba.l d0,a0
    4d90:	41e8 0029      	lea 41(a0),a0
    4d94:	7000           	moveq #0,d0
    4d96:	302f 01c6      	move.w 454(sp),d0
    4d9a:	2f08           	move.l a0,-(sp)
    4d9c:	2f00           	move.l d0,-(sp)
    4d9e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4da2:	2f2f 0056      	move.l 86(sp),-(sp)
    4da6:	4eba 1f7a      	jsr 6d22 <TestRow>(pc)
    4daa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4dae:	722a           	moveq #42,d1
    4db0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    4db4:	222f 018a      	move.l 394(sp),d1
    4db8:	2001           	move.l d1,d0
    4dba:	d080           	add.l d0,d0
    4dbc:	d081           	add.l d1,d0
    4dbe:	2200           	move.l d0,d1
    4dc0:	e789           	lsl.l #3,d1
    4dc2:	2041           	movea.l d1,a0
    4dc4:	91c0           	suba.l d0,a0
    4dc6:	41e8 002a      	lea 42(a0),a0
    4dca:	7000           	moveq #0,d0
    4dcc:	302f 01c6      	move.w 454(sp),d0
    4dd0:	2f08           	move.l a0,-(sp)
    4dd2:	2f00           	move.l d0,-(sp)
    4dd4:	2f2f 01d0      	move.l 464(sp),-(sp)
    4dd8:	2f2f 0056      	move.l 86(sp),-(sp)
    4ddc:	4eba 1f44      	jsr 6d22 <TestRow>(pc)
    4de0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4de4:	702a           	moveq #42,d0
    4de6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4dea:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    4dee:	222f 018a      	move.l 394(sp),d1
    4df2:	2001           	move.l d1,d0
    4df4:	d080           	add.l d0,d0
    4df6:	d081           	add.l d1,d0
    4df8:	2200           	move.l d0,d1
    4dfa:	e789           	lsl.l #3,d1
    4dfc:	2041           	movea.l d1,a0
    4dfe:	91c0           	suba.l d0,a0
    4e00:	41e8 002b      	lea 43(a0),a0
    4e04:	7000           	moveq #0,d0
    4e06:	302f 01c6      	move.w 454(sp),d0
    4e0a:	2f08           	move.l a0,-(sp)
    4e0c:	2f00           	move.l d0,-(sp)
    4e0e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e12:	2f2f 0056      	move.l 86(sp),-(sp)
    4e16:	4eba 1f0a      	jsr 6d22 <TestRow>(pc)
    4e1a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e1e:	722a           	moveq #42,d1
    4e20:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    4e24:	222f 018a      	move.l 394(sp),d1
    4e28:	2001           	move.l d1,d0
    4e2a:	d080           	add.l d0,d0
    4e2c:	d081           	add.l d1,d0
    4e2e:	2200           	move.l d0,d1
    4e30:	e789           	lsl.l #3,d1
    4e32:	2041           	movea.l d1,a0
    4e34:	91c0           	suba.l d0,a0
    4e36:	41e8 002c      	lea 44(a0),a0
    4e3a:	7000           	moveq #0,d0
    4e3c:	302f 01c6      	move.w 454(sp),d0
    4e40:	2f08           	move.l a0,-(sp)
    4e42:	2f00           	move.l d0,-(sp)
    4e44:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e48:	2f2f 0056      	move.l 86(sp),-(sp)
    4e4c:	4eba 1ed4      	jsr 6d22 <TestRow>(pc)
    4e50:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e54:	702a           	moveq #42,d0
    4e56:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4e5a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<10;i++) {
    4e5e:	52af 018a      	addq.l #1,394(sp)
    4e62:	7209           	moveq #9,d1
    4e64:	b2af 018a      	cmp.l 394(sp),d1
    4e68:	6c00 fd74      	bge.w 4bde <TestZoom4Picture+0xd1e>
  }

  for(int i2=0;i2<13;i2++) {  
    4e6c:	42af 0182      	clr.l 386(sp)
    4e70:	6032           	bra.s 4ea4 <TestZoom4Picture+0xfe4>
    TestRow( valsupposed, valactual, mask, i2+253);
    4e72:	222f 0182      	move.l 386(sp),d1
    4e76:	0681 0000 00fd 	addi.l #253,d1
    4e7c:	7000           	moveq #0,d0
    4e7e:	302f 01c6      	move.w 454(sp),d0
    4e82:	2f01           	move.l d1,-(sp)
    4e84:	2f00           	move.l d0,-(sp)
    4e86:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e8a:	2f2f 0056      	move.l 86(sp),-(sp)
    4e8e:	4eba 1e92      	jsr 6d22 <TestRow>(pc)
    4e92:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e96:	702a           	moveq #42,d0
    4e98:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4e9c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4ea0:	52af 0182      	addq.l #1,386(sp)
    4ea4:	720c           	moveq #12,d1
    4ea6:	b2af 0182      	cmp.l 386(sp),d1
    4eaa:	6cc6           	bge.s 4e72 <TestZoom4Picture+0xfb2>
  }

  TestRow( valsupposed, valactual, mask, 266);
    4eac:	7000           	moveq #0,d0
    4eae:	302f 01c6      	move.w 454(sp),d0
    4eb2:	4878 010a      	pea 10a <FreeDisplay+0x2a>
    4eb6:	2f00           	move.l d0,-(sp)
    4eb8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ebc:	2f2f 0056      	move.l 86(sp),-(sp)
    4ec0:	4eba 1e60      	jsr 6d22 <TestRow>(pc)
    4ec4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4ec8:	702a           	moveq #42,d0
    4eca:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 267);
    4ece:	7000           	moveq #0,d0
    4ed0:	302f 01c6      	move.w 454(sp),d0
    4ed4:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    4ed8:	2f00           	move.l d0,-(sp)
    4eda:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ede:	2f2f 0056      	move.l 86(sp),-(sp)
    4ee2:	4eba 1e3e      	jsr 6d22 <TestRow>(pc)
    4ee6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4eea:	722a           	moveq #42,d1
    4eec:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4ef0:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 268);
    4ef4:	7000           	moveq #0,d0
    4ef6:	302f 01c6      	move.w 454(sp),d0
    4efa:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    4efe:	2f00           	move.l d0,-(sp)
    4f00:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f04:	2f2f 0056      	move.l 86(sp),-(sp)
    4f08:	4eba 1e18      	jsr 6d22 <TestRow>(pc)
    4f0c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4f10:	702a           	moveq #42,d0
    4f12:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 269);
    4f16:	7000           	moveq #0,d0
    4f18:	302f 01c6      	move.w 454(sp),d0
    4f1c:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4f20:	2f00           	move.l d0,-(sp)
    4f22:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f26:	2f2f 0056      	move.l 86(sp),-(sp)
    4f2a:	4eba 1df6      	jsr 6d22 <TestRow>(pc)
    4f2e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4f32:	722a           	moveq #42,d1
    4f34:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4f38:	466f 01c6      	not.w 454(sp)

  tmp = source;
    4f3c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4f42:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4f48:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    4f4e:	4878 0001      	pea 1 <_start+0x1>
    4f52:	4878 0005      	pea 5 <_start+0x5>
    4f56:	2f2f 0056      	move.l 86(sp),-(sp)
    4f5a:	2f2f 006a      	move.l 106(sp),-(sp)
    4f5e:	4eba cd10      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    4f62:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4f66:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    4f6c:	2c40           	movea.l d0,a6
    4f6e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4f72:	202f 004e      	move.l 78(sp),d0
    4f76:	5880           	addq.l #4,d0
    4f78:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom6;
    4f7c:	2f7c 0000 bdc8 	move.l #48584,74(sp)
    4f82:	004a 
  mask = 0x0000;
    4f84:	426f 01c6      	clr.w 454(sp)
 
  for(int i2=0;i2<7;i2++) {  
    4f88:	42af 017e      	clr.l 382(sp)
    4f8c:	602a           	bra.s 4fb8 <TestZoom4Picture+0x10f8>
    TestRow( valsupposed, valactual, mask, i2);
    4f8e:	7000           	moveq #0,d0
    4f90:	302f 01c6      	move.w 454(sp),d0
    4f94:	2f2f 017e      	move.l 382(sp),-(sp)
    4f98:	2f00           	move.l d0,-(sp)
    4f9a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f9e:	2f2f 0056      	move.l 86(sp),-(sp)
    4fa2:	4eba 1d7e      	jsr 6d22 <TestRow>(pc)
    4fa6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4faa:	722a           	moveq #42,d1
    4fac:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4fb0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    4fb4:	52af 017e      	addq.l #1,382(sp)
    4fb8:	7006           	moveq #6,d0
    4fba:	b0af 017e      	cmp.l 382(sp),d0
    4fbe:	6cce           	bge.s 4f8e <TestZoom4Picture+0x10ce>
  }

  for(int i=0;i<6;i++) {
    4fc0:	42af 017a      	clr.l 378(sp)
    4fc4:	605c           	bra.s 5022 <TestZoom4Picture+0x1162>
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    4fc6:	202f 017a      	move.l 378(sp),d0
    4fca:	d080           	add.l d0,d0
    4fcc:	2200           	move.l d0,d1
    4fce:	5e81           	addq.l #7,d1
    4fd0:	7000           	moveq #0,d0
    4fd2:	302f 01c6      	move.w 454(sp),d0
    4fd6:	2f01           	move.l d1,-(sp)
    4fd8:	2f00           	move.l d0,-(sp)
    4fda:	2f2f 01d0      	move.l 464(sp),-(sp)
    4fde:	2f2f 0056      	move.l 86(sp),-(sp)
    4fe2:	4eba 1d3e      	jsr 6d22 <TestRow>(pc)
    4fe6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4fea:	722a           	moveq #42,d1
    4fec:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    4ff0:	202f 017a      	move.l 378(sp),d0
    4ff4:	5880           	addq.l #4,d0
    4ff6:	d080           	add.l d0,d0
    4ff8:	2200           	move.l d0,d1
    4ffa:	7000           	moveq #0,d0
    4ffc:	302f 01c6      	move.w 454(sp),d0
    5000:	2f01           	move.l d1,-(sp)
    5002:	2f00           	move.l d0,-(sp)
    5004:	2f2f 01d0      	move.l 464(sp),-(sp)
    5008:	2f2f 0056      	move.l 86(sp),-(sp)
    500c:	4eba 1d14      	jsr 6d22 <TestRow>(pc)
    5010:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5014:	702a           	moveq #42,d0
    5016:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    501a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<6;i++) {
    501e:	52af 017a      	addq.l #1,378(sp)
    5022:	7205           	moveq #5,d1
    5024:	b2af 017a      	cmp.l 378(sp),d1
    5028:	6c9c           	bge.s 4fc6 <TestZoom4Picture+0x1106>
  }

  for(int i=0;i<10;i++) {
    502a:	42af 0176      	clr.l 374(sp)
    502e:	6000 00ce      	bra.w 50fe <TestZoom4Picture+0x123e>
    for(int i2=0;i2<12;i2++) {  
    5032:	42af 0172      	clr.l 370(sp)
    5036:	6040           	bra.s 5078 <TestZoom4Picture+0x11b8>
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    5038:	307c 0013      	movea.w #19,a0
    503c:	d1ef 0172      	adda.l 370(sp),a0
    5040:	222f 0176      	move.l 374(sp),d1
    5044:	2001           	move.l d1,d0
    5046:	d080           	add.l d0,d0
    5048:	d081           	add.l d1,d0
    504a:	e788           	lsl.l #3,d0
    504c:	2208           	move.l a0,d1
    504e:	d280           	add.l d0,d1
    5050:	7000           	moveq #0,d0
    5052:	302f 01c6      	move.w 454(sp),d0
    5056:	2f01           	move.l d1,-(sp)
    5058:	2f00           	move.l d0,-(sp)
    505a:	2f2f 01d0      	move.l 464(sp),-(sp)
    505e:	2f2f 0056      	move.l 86(sp),-(sp)
    5062:	4eba 1cbe      	jsr 6d22 <TestRow>(pc)
    5066:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    506a:	702a           	moveq #42,d0
    506c:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5070:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {  
    5074:	52af 0172      	addq.l #1,370(sp)
    5078:	720b           	moveq #11,d1
    507a:	b2af 0172      	cmp.l 370(sp),d1
    507e:	6cb8           	bge.s 5038 <TestZoom4Picture+0x1178>
    }
    for(int i=0;i<6;i++) {
    5080:	42af 016e      	clr.l 366(sp)
    5084:	606c           	bra.s 50f2 <TestZoom4Picture+0x1232>
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    5086:	222f 016e      	move.l 366(sp),d1
    508a:	2001           	move.l d1,d0
    508c:	d080           	add.l d0,d0
    508e:	d081           	add.l d1,d0
    5090:	e788           	lsl.l #3,d0
    5092:	2040           	movea.l d0,a0
    5094:	41e8 001f      	lea 31(a0),a0
    5098:	7000           	moveq #0,d0
    509a:	302f 01c6      	move.w 454(sp),d0
    509e:	2f08           	move.l a0,-(sp)
    50a0:	2f00           	move.l d0,-(sp)
    50a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    50a6:	2f2f 0056      	move.l 86(sp),-(sp)
    50aa:	4eba 1c76      	jsr 6d22 <TestRow>(pc)
    50ae:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    50b2:	702a           	moveq #42,d0
    50b4:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    50b8:	222f 016e      	move.l 366(sp),d1
    50bc:	2001           	move.l d1,d0
    50be:	d080           	add.l d0,d0
    50c0:	d081           	add.l d1,d0
    50c2:	e788           	lsl.l #3,d0
    50c4:	2040           	movea.l d0,a0
    50c6:	41e8 0020      	lea 32(a0),a0
    50ca:	7000           	moveq #0,d0
    50cc:	302f 01c6      	move.w 454(sp),d0
    50d0:	2f08           	move.l a0,-(sp)
    50d2:	2f00           	move.l d0,-(sp)
    50d4:	2f2f 01d0      	move.l 464(sp),-(sp)
    50d8:	2f2f 0056      	move.l 86(sp),-(sp)
    50dc:	4eba 1c44      	jsr 6d22 <TestRow>(pc)
    50e0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    50e4:	722a           	moveq #42,d1
    50e6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    50ea:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<6;i++) {
    50ee:	52af 016e      	addq.l #1,366(sp)
    50f2:	7005           	moveq #5,d0
    50f4:	b0af 016e      	cmp.l 366(sp),d0
    50f8:	6c8c           	bge.s 5086 <TestZoom4Picture+0x11c6>
  for(int i=0;i<10;i++) {
    50fa:	52af 0176      	addq.l #1,374(sp)
    50fe:	7209           	moveq #9,d1
    5100:	b2af 0176      	cmp.l 374(sp),d1
    5104:	6c00 ff2c      	bge.w 5032 <TestZoom4Picture+0x1172>
    }
  }

  for(int i2=0;i2<11;i2++) {  
    5108:	42af 016a      	clr.l 362(sp)
    510c:	6032           	bra.s 5140 <TestZoom4Picture+0x1280>
    TestRow( valsupposed, valactual, mask, 258+i2);
    510e:	222f 016a      	move.l 362(sp),d1
    5112:	0681 0000 0102 	addi.l #258,d1
    5118:	7000           	moveq #0,d0
    511a:	302f 01c6      	move.w 454(sp),d0
    511e:	2f01           	move.l d1,-(sp)
    5120:	2f00           	move.l d0,-(sp)
    5122:	2f2f 01d0      	move.l 464(sp),-(sp)
    5126:	2f2f 0056      	move.l 86(sp),-(sp)
    512a:	4eba 1bf6      	jsr 6d22 <TestRow>(pc)
    512e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5132:	702a           	moveq #42,d0
    5134:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5138:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {  
    513c:	52af 016a      	addq.l #1,362(sp)
    5140:	720a           	moveq #10,d1
    5142:	b2af 016a      	cmp.l 362(sp),d1
    5146:	6cc6           	bge.s 510e <TestZoom4Picture+0x124e>
  }

  tmp = source;
    5148:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    514e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5154:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    515a:	4878 0001      	pea 1 <_start+0x1>
    515e:	4878 0006      	pea 6 <_start+0x6>
    5162:	2f2f 0056      	move.l 86(sp),-(sp)
    5166:	2f2f 006a      	move.l 106(sp),-(sp)
    516a:	4eba cb04      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    516e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5172:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    5178:	2c40           	movea.l d0,a6
    517a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    517e:	202f 004e      	move.l 78(sp),d0
    5182:	5880           	addq.l #4,d0
    5184:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom7;
    5188:	2f7c 0000 bdf4 	move.l #48628,74(sp)
    518e:	004a 
  mask = 0x0000;
    5190:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5194:	7000           	moveq #0,d0
    5196:	302f 01c6      	move.w 454(sp),d0
    519a:	42a7           	clr.l -(sp)
    519c:	2f00           	move.l d0,-(sp)
    519e:	2f2f 01d0      	move.l 464(sp),-(sp)
    51a2:	2f2f 0056      	move.l 86(sp),-(sp)
    51a6:	4eba 1b7a      	jsr 6d22 <TestRow>(pc)
    51aa:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    51ae:	722a           	moveq #42,d1
    51b0:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    51b4:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    51b8:	42af 0166      	clr.l 358(sp)
    51bc:	605c           	bra.s 521a <TestZoom4Picture+0x135a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    51be:	202f 0166      	move.l 358(sp),d0
    51c2:	d080           	add.l d0,d0
    51c4:	2200           	move.l d0,d1
    51c6:	5281           	addq.l #1,d1
    51c8:	7000           	moveq #0,d0
    51ca:	302f 01c6      	move.w 454(sp),d0
    51ce:	2f01           	move.l d1,-(sp)
    51d0:	2f00           	move.l d0,-(sp)
    51d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    51d6:	2f2f 0056      	move.l 86(sp),-(sp)
    51da:	4eba 1b46      	jsr 6d22 <TestRow>(pc)
    51de:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    51e2:	702a           	moveq #42,d0
    51e4:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    51e8:	202f 0166      	move.l 358(sp),d0
    51ec:	5280           	addq.l #1,d0
    51ee:	d080           	add.l d0,d0
    51f0:	2200           	move.l d0,d1
    51f2:	7000           	moveq #0,d0
    51f4:	302f 01c6      	move.w 454(sp),d0
    51f8:	2f01           	move.l d1,-(sp)
    51fa:	2f00           	move.l d0,-(sp)
    51fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    5200:	2f2f 0056      	move.l 86(sp),-(sp)
    5204:	4eba 1b1c      	jsr 6d22 <TestRow>(pc)
    5208:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    520c:	722a           	moveq #42,d1
    520e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5212:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    5216:	52af 0166      	addq.l #1,358(sp)
    521a:	7006           	moveq #6,d0
    521c:	b0af 0166      	cmp.l 358(sp),d0
    5220:	6c9c           	bge.s 51be <TestZoom4Picture+0x12fe>
  }

  for(int i=0;i<10;i++) {
    5222:	42af 0162      	clr.l 354(sp)
    5226:	6000 00d4      	bra.w 52fc <TestZoom4Picture+0x143c>
    for(int i2=0;i2<11;i2++) {  
    522a:	42af 015e      	clr.l 350(sp)
    522e:	6042           	bra.s 5272 <TestZoom4Picture+0x13b2>
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    5230:	307c 000f      	movea.w #15,a0
    5234:	d1ef 015e      	adda.l 350(sp),a0
    5238:	222f 0162      	move.l 354(sp),d1
    523c:	2001           	move.l d1,d0
    523e:	d080           	add.l d0,d0
    5240:	d081           	add.l d1,d0
    5242:	e788           	lsl.l #3,d0
    5244:	d081           	add.l d1,d0
    5246:	2208           	move.l a0,d1
    5248:	d280           	add.l d0,d1
    524a:	7000           	moveq #0,d0
    524c:	302f 01c6      	move.w 454(sp),d0
    5250:	2f01           	move.l d1,-(sp)
    5252:	2f00           	move.l d0,-(sp)
    5254:	2f2f 01d0      	move.l 464(sp),-(sp)
    5258:	2f2f 0056      	move.l 86(sp),-(sp)
    525c:	4eba 1ac4      	jsr 6d22 <TestRow>(pc)
    5260:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5264:	722a           	moveq #42,d1
    5266:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    526a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {  
    526e:	52af 015e      	addq.l #1,350(sp)
    5272:	700a           	moveq #10,d0
    5274:	b0af 015e      	cmp.l 350(sp),d0
    5278:	6cb6           	bge.s 5230 <TestZoom4Picture+0x1370>
    }
    for(int i=0;i<7;i++) {
    527a:	42af 015a      	clr.l 346(sp)
    527e:	6070           	bra.s 52f0 <TestZoom4Picture+0x1430>
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    5280:	222f 015a      	move.l 346(sp),d1
    5284:	2001           	move.l d1,d0
    5286:	d080           	add.l d0,d0
    5288:	d081           	add.l d1,d0
    528a:	e788           	lsl.l #3,d0
    528c:	2040           	movea.l d0,a0
    528e:	d1c1           	adda.l d1,a0
    5290:	41e8 001a      	lea 26(a0),a0
    5294:	7000           	moveq #0,d0
    5296:	302f 01c6      	move.w 454(sp),d0
    529a:	2f08           	move.l a0,-(sp)
    529c:	2f00           	move.l d0,-(sp)
    529e:	2f2f 01d0      	move.l 464(sp),-(sp)
    52a2:	2f2f 0056      	move.l 86(sp),-(sp)
    52a6:	4eba 1a7a      	jsr 6d22 <TestRow>(pc)
    52aa:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    52ae:	722a           	moveq #42,d1
    52b0:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    52b4:	222f 015a      	move.l 346(sp),d1
    52b8:	2001           	move.l d1,d0
    52ba:	d080           	add.l d0,d0
    52bc:	d081           	add.l d1,d0
    52be:	e788           	lsl.l #3,d0
    52c0:	2040           	movea.l d0,a0
    52c2:	d1c1           	adda.l d1,a0
    52c4:	41e8 001a      	lea 26(a0),a0
    52c8:	7000           	moveq #0,d0
    52ca:	302f 01c6      	move.w 454(sp),d0
    52ce:	2f08           	move.l a0,-(sp)
    52d0:	2f00           	move.l d0,-(sp)
    52d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    52d6:	2f2f 0056      	move.l 86(sp),-(sp)
    52da:	4eba 1a46      	jsr 6d22 <TestRow>(pc)
    52de:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    52e2:	702a           	moveq #42,d0
    52e4:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    52e8:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<7;i++) {
    52ec:	52af 015a      	addq.l #1,346(sp)
    52f0:	7206           	moveq #6,d1
    52f2:	b2af 015a      	cmp.l 346(sp),d1
    52f6:	6c88           	bge.s 5280 <TestZoom4Picture+0x13c0>
  for(int i=0;i<10;i++) {
    52f8:	52af 0162      	addq.l #1,354(sp)
    52fc:	7009           	moveq #9,d0
    52fe:	b0af 0162      	cmp.l 354(sp),d0
    5302:	6c00 ff26      	bge.w 522a <TestZoom4Picture+0x136a>
    }
  }

  for(int i2=0;i2<5;i2++) {  
    5306:	42af 0156      	clr.l 342(sp)
    530a:	6032           	bra.s 533e <TestZoom4Picture+0x147e>
    TestRow( valsupposed, valactual, mask, 256+i2);
    530c:	222f 0156      	move.l 342(sp),d1
    5310:	0681 0000 0100 	addi.l #256,d1
    5316:	7000           	moveq #0,d0
    5318:	302f 01c6      	move.w 454(sp),d0
    531c:	2f01           	move.l d1,-(sp)
    531e:	2f00           	move.l d0,-(sp)
    5320:	2f2f 01d0      	move.l 464(sp),-(sp)
    5324:	2f2f 0056      	move.l 86(sp),-(sp)
    5328:	4eba 19f8      	jsr 6d22 <TestRow>(pc)
    532c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5330:	722a           	moveq #42,d1
    5332:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5336:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    533a:	52af 0156      	addq.l #1,342(sp)
    533e:	7004           	moveq #4,d0
    5340:	b0af 0156      	cmp.l 342(sp),d0
    5344:	6cc6           	bge.s 530c <TestZoom4Picture+0x144c>
  }

  tmp = source;
    5346:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    534c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5352:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    5358:	4878 0001      	pea 1 <_start+0x1>
    535c:	4878 0007      	pea 7 <_start+0x7>
    5360:	2f2f 0056      	move.l 86(sp),-(sp)
    5364:	2f2f 006a      	move.l 106(sp),-(sp)
    5368:	4eba c906      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    536c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5370:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    5376:	2c40           	movea.l d0,a6
    5378:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    537c:	222f 004e      	move.l 78(sp),d1
    5380:	5881           	addq.l #4,d1
    5382:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom8;
    5386:	2f7c 0000 be20 	move.l #48672,74(sp)
    538c:	004a 
  mask = 0xffff;
    538e:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5394:	7000           	moveq #0,d0
    5396:	302f 01c6      	move.w 454(sp),d0
    539a:	42a7           	clr.l -(sp)
    539c:	2f00           	move.l d0,-(sp)
    539e:	2f2f 01d0      	move.l 464(sp),-(sp)
    53a2:	2f2f 0056      	move.l 86(sp),-(sp)
    53a6:	4eba 197a      	jsr 6d22 <TestRow>(pc)
    53aa:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    53ae:	702a           	moveq #42,d0
    53b0:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    53b4:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    53b8:	42af 0152      	clr.l 338(sp)
    53bc:	605c           	bra.s 541a <TestZoom4Picture+0x155a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    53be:	202f 0152      	move.l 338(sp),d0
    53c2:	d080           	add.l d0,d0
    53c4:	2200           	move.l d0,d1
    53c6:	5281           	addq.l #1,d1
    53c8:	7000           	moveq #0,d0
    53ca:	302f 01c6      	move.w 454(sp),d0
    53ce:	2f01           	move.l d1,-(sp)
    53d0:	2f00           	move.l d0,-(sp)
    53d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    53d6:	2f2f 0056      	move.l 86(sp),-(sp)
    53da:	4eba 1946      	jsr 6d22 <TestRow>(pc)
    53de:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    53e2:	722a           	moveq #42,d1
    53e4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    53e8:	202f 0152      	move.l 338(sp),d0
    53ec:	5280           	addq.l #1,d0
    53ee:	d080           	add.l d0,d0
    53f0:	2200           	move.l d0,d1
    53f2:	7000           	moveq #0,d0
    53f4:	302f 01c6      	move.w 454(sp),d0
    53f8:	2f01           	move.l d1,-(sp)
    53fa:	2f00           	move.l d0,-(sp)
    53fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    5400:	2f2f 0056      	move.l 86(sp),-(sp)
    5404:	4eba 191c      	jsr 6d22 <TestRow>(pc)
    5408:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    540c:	702a           	moveq #42,d0
    540e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5412:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5416:	52af 0152      	addq.l #1,338(sp)
    541a:	7204           	moveq #4,d1
    541c:	b2af 0152      	cmp.l 338(sp),d1
    5420:	6c9c           	bge.s 53be <TestZoom4Picture+0x14fe>
  }

  for(int i=0;i<9;i++) {
    5422:	42af 014e      	clr.l 334(sp)
    5426:	6000 00f0      	bra.w 5518 <TestZoom4Picture+0x1658>
    for(int i2=0;i2<10;i2++) {  
    542a:	42af 014a      	clr.l 330(sp)
    542e:	6046           	bra.s 5476 <TestZoom4Picture+0x15b6>
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    5430:	307c 000b      	movea.w #11,a0
    5434:	d1ef 014a      	adda.l 330(sp),a0
    5438:	222f 014e      	move.l 334(sp),d1
    543c:	2001           	move.l d1,d0
    543e:	d080           	add.l d0,d0
    5440:	d081           	add.l d1,d0
    5442:	d080           	add.l d0,d0
    5444:	d080           	add.l d0,d0
    5446:	d081           	add.l d1,d0
    5448:	d080           	add.l d0,d0
    544a:	2208           	move.l a0,d1
    544c:	d280           	add.l d0,d1
    544e:	7000           	moveq #0,d0
    5450:	302f 01c6      	move.w 454(sp),d0
    5454:	2f01           	move.l d1,-(sp)
    5456:	2f00           	move.l d0,-(sp)
    5458:	2f2f 01d0      	move.l 464(sp),-(sp)
    545c:	2f2f 0056      	move.l 86(sp),-(sp)
    5460:	4eba 18c0      	jsr 6d22 <TestRow>(pc)
    5464:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5468:	702a           	moveq #42,d0
    546a:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    546e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {  
    5472:	52af 014a      	addq.l #1,330(sp)
    5476:	7209           	moveq #9,d1
    5478:	b2af 014a      	cmp.l 330(sp),d1
    547c:	6cb2           	bge.s 5430 <TestZoom4Picture+0x1570>
    }
    for(int i2=0;i2<8;i2++) {
    547e:	42af 0146      	clr.l 326(sp)
    5482:	6000 0086      	bra.w 550a <TestZoom4Picture+0x164a>
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    5486:	222f 014e      	move.l 334(sp),d1
    548a:	2001           	move.l d1,d0
    548c:	d080           	add.l d0,d0
    548e:	d081           	add.l d1,d0
    5490:	d080           	add.l d0,d0
    5492:	d080           	add.l d0,d0
    5494:	d081           	add.l d1,d0
    5496:	d080           	add.l d0,d0
    5498:	2040           	movea.l d0,a0
    549a:	41e8 0015      	lea 21(a0),a0
    549e:	2208           	move.l a0,d1
    54a0:	d2af 0146      	add.l 326(sp),d1
    54a4:	7000           	moveq #0,d0
    54a6:	302f 01c6      	move.w 454(sp),d0
    54aa:	2f01           	move.l d1,-(sp)
    54ac:	2f00           	move.l d0,-(sp)
    54ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    54b2:	2f2f 0056      	move.l 86(sp),-(sp)
    54b6:	4eba 186a      	jsr 6d22 <TestRow>(pc)
    54ba:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    54be:	702a           	moveq #42,d0
    54c0:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    54c4:	222f 014e      	move.l 334(sp),d1
    54c8:	2001           	move.l d1,d0
    54ca:	d080           	add.l d0,d0
    54cc:	d081           	add.l d1,d0
    54ce:	d080           	add.l d0,d0
    54d0:	d080           	add.l d0,d0
    54d2:	d081           	add.l d1,d0
    54d4:	d080           	add.l d0,d0
    54d6:	2040           	movea.l d0,a0
    54d8:	41e8 0015      	lea 21(a0),a0
    54dc:	2208           	move.l a0,d1
    54de:	d2af 0146      	add.l 326(sp),d1
    54e2:	7000           	moveq #0,d0
    54e4:	302f 01c6      	move.w 454(sp),d0
    54e8:	2f01           	move.l d1,-(sp)
    54ea:	2f00           	move.l d0,-(sp)
    54ec:	2f2f 01d0      	move.l 464(sp),-(sp)
    54f0:	2f2f 0056      	move.l 86(sp),-(sp)
    54f4:	4eba 182c      	jsr 6d22 <TestRow>(pc)
    54f8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    54fc:	722a           	moveq #42,d1
    54fe:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5502:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {
    5506:	52af 0146      	addq.l #1,326(sp)
    550a:	7007           	moveq #7,d0
    550c:	b0af 0146      	cmp.l 326(sp),d0
    5510:	6c00 ff74      	bge.w 5486 <TestZoom4Picture+0x15c6>
  for(int i=0;i<9;i++) {
    5514:	52af 014e      	addq.l #1,334(sp)
    5518:	7208           	moveq #8,d1
    551a:	b2af 014e      	cmp.l 334(sp),d1
    551e:	6c00 ff0a      	bge.w 542a <TestZoom4Picture+0x156a>
    }
  }

  for(int i2=0;i2<10;i2++) {  
    5522:	42af 0142      	clr.l 322(sp)
    5526:	6032           	bra.s 555a <TestZoom4Picture+0x169a>
    TestRow( valsupposed, valactual, mask, 245+i2);
    5528:	222f 0142      	move.l 322(sp),d1
    552c:	0681 0000 00f5 	addi.l #245,d1
    5532:	7000           	moveq #0,d0
    5534:	302f 01c6      	move.w 454(sp),d0
    5538:	2f01           	move.l d1,-(sp)
    553a:	2f00           	move.l d0,-(sp)
    553c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5540:	2f2f 0056      	move.l 86(sp),-(sp)
    5544:	4eba 17dc      	jsr 6d22 <TestRow>(pc)
    5548:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    554c:	702a           	moveq #42,d0
    554e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5552:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {  
    5556:	52af 0142      	addq.l #1,322(sp)
    555a:	7209           	moveq #9,d1
    555c:	b2af 0142      	cmp.l 322(sp),d1
    5560:	6cc6           	bge.s 5528 <TestZoom4Picture+0x1668>
  }
  for(int i=0;i<7;i++) {
    5562:	42af 013e      	clr.l 318(sp)
    5566:	6064           	bra.s 55cc <TestZoom4Picture+0x170c>
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    5568:	202f 013e      	move.l 318(sp),d0
    556c:	d080           	add.l d0,d0
    556e:	2200           	move.l d0,d1
    5570:	0681 0000 00ff 	addi.l #255,d1
    5576:	7000           	moveq #0,d0
    5578:	302f 01c6      	move.w 454(sp),d0
    557c:	2f01           	move.l d1,-(sp)
    557e:	2f00           	move.l d0,-(sp)
    5580:	2f2f 01d0      	move.l 464(sp),-(sp)
    5584:	2f2f 0056      	move.l 86(sp),-(sp)
    5588:	4eba 1798      	jsr 6d22 <TestRow>(pc)
    558c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5590:	702a           	moveq #42,d0
    5592:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    5596:	202f 013e      	move.l 318(sp),d0
    559a:	0680 0000 0080 	addi.l #128,d0
    55a0:	d080           	add.l d0,d0
    55a2:	2200           	move.l d0,d1
    55a4:	7000           	moveq #0,d0
    55a6:	302f 01c6      	move.w 454(sp),d0
    55aa:	2f01           	move.l d1,-(sp)
    55ac:	2f00           	move.l d0,-(sp)
    55ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    55b2:	2f2f 0056      	move.l 86(sp),-(sp)
    55b6:	4eba 176a      	jsr 6d22 <TestRow>(pc)
    55ba:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    55be:	722a           	moveq #42,d1
    55c0:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    55c4:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    55c8:	52af 013e      	addq.l #1,318(sp)
    55cc:	7006           	moveq #6,d0
    55ce:	b0af 013e      	cmp.l 318(sp),d0
    55d2:	6c94           	bge.s 5568 <TestZoom4Picture+0x16a8>
  }
  TestRow( valsupposed, valactual, mask, 269);
    55d4:	7000           	moveq #0,d0
    55d6:	302f 01c6      	move.w 454(sp),d0
    55da:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    55de:	2f00           	move.l d0,-(sp)
    55e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    55e4:	2f2f 0056      	move.l 86(sp),-(sp)
    55e8:	4eba 1738      	jsr 6d22 <TestRow>(pc)
    55ec:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    55f0:	722a           	moveq #42,d1
    55f2:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    55f6:	466f 01c6      	not.w 454(sp)
 
  tmp = source;
    55fa:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5600:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5606:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    560c:	4878 0001      	pea 1 <_start+0x1>
    5610:	4878 0008      	pea 8 <_start+0x8>
    5614:	2f2f 0056      	move.l 86(sp),-(sp)
    5618:	2f2f 006a      	move.l 106(sp),-(sp)
    561c:	4eba c652      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    5620:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5624:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    562a:	2c40           	movea.l d0,a6
    562c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5630:	202f 004e      	move.l 78(sp),d0
    5634:	5880           	addq.l #4,d0
    5636:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom9;
    563a:	2f7c 0000 be4c 	move.l #48716,74(sp)
    5640:	004a 
  mask = 0x0000;
    5642:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5646:	7000           	moveq #0,d0
    5648:	302f 01c6      	move.w 454(sp),d0
    564c:	42a7           	clr.l -(sp)
    564e:	2f00           	move.l d0,-(sp)
    5650:	2f2f 01d0      	move.l 464(sp),-(sp)
    5654:	2f2f 0056      	move.l 86(sp),-(sp)
    5658:	4eba 16c8      	jsr 6d22 <TestRow>(pc)
    565c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5660:	722a           	moveq #42,d1
    5662:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5666:	466f 01c6      	not.w 454(sp)
  
  for(int i=0;i<3;i++) {
    566a:	42af 013a      	clr.l 314(sp)
    566e:	605c           	bra.s 56cc <TestZoom4Picture+0x180c>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    5670:	202f 013a      	move.l 314(sp),d0
    5674:	d080           	add.l d0,d0
    5676:	2200           	move.l d0,d1
    5678:	5281           	addq.l #1,d1
    567a:	7000           	moveq #0,d0
    567c:	302f 01c6      	move.w 454(sp),d0
    5680:	2f01           	move.l d1,-(sp)
    5682:	2f00           	move.l d0,-(sp)
    5684:	2f2f 01d0      	move.l 464(sp),-(sp)
    5688:	2f2f 0056      	move.l 86(sp),-(sp)
    568c:	4eba 1694      	jsr 6d22 <TestRow>(pc)
    5690:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5694:	702a           	moveq #42,d0
    5696:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    569a:	202f 013a      	move.l 314(sp),d0
    569e:	5280           	addq.l #1,d0
    56a0:	d080           	add.l d0,d0
    56a2:	2200           	move.l d0,d1
    56a4:	7000           	moveq #0,d0
    56a6:	302f 01c6      	move.w 454(sp),d0
    56aa:	2f01           	move.l d1,-(sp)
    56ac:	2f00           	move.l d0,-(sp)
    56ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    56b2:	2f2f 0056      	move.l 86(sp),-(sp)
    56b6:	4eba 166a      	jsr 6d22 <TestRow>(pc)
    56ba:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    56be:	722a           	moveq #42,d1
    56c0:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    56c4:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    56c8:	52af 013a      	addq.l #1,314(sp)
    56cc:	7002           	moveq #2,d0
    56ce:	b0af 013a      	cmp.l 314(sp),d0
    56d2:	6c9c           	bge.s 5670 <TestZoom4Picture+0x17b0>
  }

  for(int i=0;i<9;i++) {
    56d4:	42af 0136      	clr.l 310(sp)
    56d8:	6000 00ea      	bra.w 57c4 <TestZoom4Picture+0x1904>
    for(int i2=0;i2<9;i2++) {  
    56dc:	42af 0132      	clr.l 306(sp)
    56e0:	6044           	bra.s 5726 <TestZoom4Picture+0x1866>
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    56e2:	307c 000b      	movea.w #11,a0
    56e6:	d1ef 0132      	adda.l 306(sp),a0
    56ea:	222f 0136      	move.l 310(sp),d1
    56ee:	2001           	move.l d1,d0
    56f0:	d080           	add.l d0,d0
    56f2:	d081           	add.l d1,d0
    56f4:	2200           	move.l d0,d1
    56f6:	e789           	lsl.l #3,d1
    56f8:	d081           	add.l d1,d0
    56fa:	2208           	move.l a0,d1
    56fc:	d280           	add.l d0,d1
    56fe:	7000           	moveq #0,d0
    5700:	302f 01c6      	move.w 454(sp),d0
    5704:	2f01           	move.l d1,-(sp)
    5706:	2f00           	move.l d0,-(sp)
    5708:	2f2f 01d0      	move.l 464(sp),-(sp)
    570c:	2f2f 0056      	move.l 86(sp),-(sp)
    5710:	4eba 1610      	jsr 6d22 <TestRow>(pc)
    5714:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5718:	722a           	moveq #42,d1
    571a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    571e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {  
    5722:	52af 0132      	addq.l #1,306(sp)
    5726:	7008           	moveq #8,d0
    5728:	b0af 0132      	cmp.l 306(sp),d0
    572c:	6cb4           	bge.s 56e2 <TestZoom4Picture+0x1822>
    }
    
    for(int i2=0;i2<9;i2++) {
    572e:	42af 012e      	clr.l 302(sp)
    5732:	6000 0082      	bra.w 57b6 <TestZoom4Picture+0x18f6>
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    5736:	222f 0136      	move.l 310(sp),d1
    573a:	2001           	move.l d1,d0
    573c:	d080           	add.l d0,d0
    573e:	d081           	add.l d1,d0
    5740:	2200           	move.l d0,d1
    5742:	e789           	lsl.l #3,d1
    5744:	2040           	movea.l d0,a0
    5746:	d1c1           	adda.l d1,a0
    5748:	41e8 0014      	lea 20(a0),a0
    574c:	2208           	move.l a0,d1
    574e:	d2af 012e      	add.l 302(sp),d1
    5752:	7000           	moveq #0,d0
    5754:	302f 01c6      	move.w 454(sp),d0
    5758:	2f01           	move.l d1,-(sp)
    575a:	2f00           	move.l d0,-(sp)
    575c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5760:	2f2f 0056      	move.l 86(sp),-(sp)
    5764:	4eba 15bc      	jsr 6d22 <TestRow>(pc)
    5768:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    576c:	722a           	moveq #42,d1
    576e:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    5772:	222f 0136      	move.l 310(sp),d1
    5776:	2001           	move.l d1,d0
    5778:	d080           	add.l d0,d0
    577a:	d081           	add.l d1,d0
    577c:	2200           	move.l d0,d1
    577e:	e789           	lsl.l #3,d1
    5780:	2040           	movea.l d0,a0
    5782:	d1c1           	adda.l d1,a0
    5784:	41e8 0015      	lea 21(a0),a0
    5788:	2208           	move.l a0,d1
    578a:	d2af 012e      	add.l 302(sp),d1
    578e:	7000           	moveq #0,d0
    5790:	302f 01c6      	move.w 454(sp),d0
    5794:	2f01           	move.l d1,-(sp)
    5796:	2f00           	move.l d0,-(sp)
    5798:	2f2f 01d0      	move.l 464(sp),-(sp)
    579c:	2f2f 0056      	move.l 86(sp),-(sp)
    57a0:	4eba 1580      	jsr 6d22 <TestRow>(pc)
    57a4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    57a8:	702a           	moveq #42,d0
    57aa:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    57ae:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {
    57b2:	52af 012e      	addq.l #1,302(sp)
    57b6:	7208           	moveq #8,d1
    57b8:	b2af 012e      	cmp.l 302(sp),d1
    57bc:	6c00 ff78      	bge.w 5736 <TestZoom4Picture+0x1876>
  for(int i=0;i<9;i++) {
    57c0:	52af 0136      	addq.l #1,310(sp)
    57c4:	7008           	moveq #8,d0
    57c6:	b0af 0136      	cmp.l 310(sp),d0
    57ca:	6c00 ff10      	bge.w 56dc <TestZoom4Picture+0x181c>
    }
  }

  for(int i2=0;i2<9;i2++) {  
    57ce:	42af 012a      	clr.l 298(sp)
    57d2:	6032           	bra.s 5806 <TestZoom4Picture+0x1946>
    TestRow( valsupposed, valactual, mask, 245+i2);
    57d4:	222f 012a      	move.l 298(sp),d1
    57d8:	0681 0000 00f5 	addi.l #245,d1
    57de:	7000           	moveq #0,d0
    57e0:	302f 01c6      	move.w 454(sp),d0
    57e4:	2f01           	move.l d1,-(sp)
    57e6:	2f00           	move.l d0,-(sp)
    57e8:	2f2f 01d0      	move.l 464(sp),-(sp)
    57ec:	2f2f 0056      	move.l 86(sp),-(sp)
    57f0:	4eba 1530      	jsr 6d22 <TestRow>(pc)
    57f4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    57f8:	722a           	moveq #42,d1
    57fa:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    57fe:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {  
    5802:	52af 012a      	addq.l #1,298(sp)
    5806:	7008           	moveq #8,d0
    5808:	b0af 012a      	cmp.l 298(sp),d0
    580c:	6cc6           	bge.s 57d4 <TestZoom4Picture+0x1914>
  }
  for(int i=0;i<5;i++) {
    580e:	42af 0126      	clr.l 294(sp)
    5812:	6064           	bra.s 5878 <TestZoom4Picture+0x19b8>
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    5814:	202f 0126      	move.l 294(sp),d0
    5818:	d080           	add.l d0,d0
    581a:	2200           	move.l d0,d1
    581c:	0681 0000 0103 	addi.l #259,d1
    5822:	7000           	moveq #0,d0
    5824:	302f 01c6      	move.w 454(sp),d0
    5828:	2f01           	move.l d1,-(sp)
    582a:	2f00           	move.l d0,-(sp)
    582c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5830:	2f2f 0056      	move.l 86(sp),-(sp)
    5834:	4eba 14ec      	jsr 6d22 <TestRow>(pc)
    5838:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    583c:	722a           	moveq #42,d1
    583e:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    5842:	202f 0126      	move.l 294(sp),d0
    5846:	0680 0000 0082 	addi.l #130,d0
    584c:	d080           	add.l d0,d0
    584e:	2200           	move.l d0,d1
    5850:	7000           	moveq #0,d0
    5852:	302f 01c6      	move.w 454(sp),d0
    5856:	2f01           	move.l d1,-(sp)
    5858:	2f00           	move.l d0,-(sp)
    585a:	2f2f 01d0      	move.l 464(sp),-(sp)
    585e:	2f2f 0056      	move.l 86(sp),-(sp)
    5862:	4eba 14be      	jsr 6d22 <TestRow>(pc)
    5866:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    586a:	702a           	moveq #42,d0
    586c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5870:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5874:	52af 0126      	addq.l #1,294(sp)
    5878:	7204           	moveq #4,d1
    587a:	b2af 0126      	cmp.l 294(sp),d1
    587e:	6c94           	bge.s 5814 <TestZoom4Picture+0x1954>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5880:	7000           	moveq #0,d0
    5882:	302f 01c6      	move.w 454(sp),d0
    5886:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    588a:	2f00           	move.l d0,-(sp)
    588c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5890:	2f2f 0056      	move.l 86(sp),-(sp)
    5894:	4eba 148c      	jsr 6d22 <TestRow>(pc)
    5898:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    589c:	702a           	moveq #42,d0
    589e:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    58a2:	466f 01c6      	not.w 454(sp)

  tmp = source;
    58a6:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    58ac:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    58b2:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    58b8:	4878 0001      	pea 1 <_start+0x1>
    58bc:	4878 0009      	pea 9 <_start+0x9>
    58c0:	2f2f 0056      	move.l 86(sp),-(sp)
    58c4:	2f2f 006a      	move.l 106(sp),-(sp)
    58c8:	4eba c3a6      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    58cc:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    58d0:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    58d6:	2c40           	movea.l d0,a6
    58d8:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    58dc:	222f 004e      	move.l 78(sp),d1
    58e0:	5881           	addq.l #4,d1
    58e2:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom10;
    58e6:	2f7c 0000 be78 	move.l #48760,74(sp)
    58ec:	004a 

  mask = 0xffff;
    58ee:	3f7c ffff 01c6 	move.w #-1,454(sp)
  TestRow( valsupposed, valactual, mask, 0);
    58f4:	7000           	moveq #0,d0
    58f6:	302f 01c6      	move.w 454(sp),d0
    58fa:	42a7           	clr.l -(sp)
    58fc:	2f00           	move.l d0,-(sp)
    58fe:	2f2f 01d0      	move.l 464(sp),-(sp)
    5902:	2f2f 0056      	move.l 86(sp),-(sp)
    5906:	4eba 141a      	jsr 6d22 <TestRow>(pc)
    590a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    590e:	702a           	moveq #42,d0
    5910:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5914:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 1);   
    5918:	7000           	moveq #0,d0
    591a:	302f 01c6      	move.w 454(sp),d0
    591e:	4878 0001      	pea 1 <_start+0x1>
    5922:	2f00           	move.l d0,-(sp)
    5924:	2f2f 01d0      	move.l 464(sp),-(sp)
    5928:	2f2f 0056      	move.l 86(sp),-(sp)
    592c:	4eba 13f4      	jsr 6d22 <TestRow>(pc)
    5930:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5934:	722a           	moveq #42,d1
    5936:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 2);
    593a:	7000           	moveq #0,d0
    593c:	302f 01c6      	move.w 454(sp),d0
    5940:	4878 0002      	pea 2 <_start+0x2>
    5944:	2f00           	move.l d0,-(sp)
    5946:	2f2f 01d0      	move.l 464(sp),-(sp)
    594a:	2f2f 0056      	move.l 86(sp),-(sp)
    594e:	4eba 13d2      	jsr 6d22 <TestRow>(pc)
    5952:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5956:	702a           	moveq #42,d0
    5958:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    595c:	466f 01c6      	not.w 454(sp)

  for(int i=0;i<9;i++) {
    5960:	42af 0122      	clr.l 290(sp)
    5964:	6000 00e0      	bra.w 5a46 <TestZoom4Picture+0x1b86>
    for(int i2=0;i2<8;i2++) {  
    5968:	42af 011e      	clr.l 286(sp)
    596c:	6040           	bra.s 59ae <TestZoom4Picture+0x1aee>
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    596e:	206f 011e      	movea.l 286(sp),a0
    5972:	5688           	addq.l #3,a0
    5974:	222f 0122      	move.l 290(sp),d1
    5978:	2001           	move.l d1,d0
    597a:	e788           	lsl.l #3,d0
    597c:	9081           	sub.l d1,d0
    597e:	d080           	add.l d0,d0
    5980:	d080           	add.l d0,d0
    5982:	2208           	move.l a0,d1
    5984:	d280           	add.l d0,d1
    5986:	7000           	moveq #0,d0
    5988:	302f 01c6      	move.w 454(sp),d0
    598c:	2f01           	move.l d1,-(sp)
    598e:	2f00           	move.l d0,-(sp)
    5990:	2f2f 01d0      	move.l 464(sp),-(sp)
    5994:	2f2f 0056      	move.l 86(sp),-(sp)
    5998:	4eba 1388      	jsr 6d22 <TestRow>(pc)
    599c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    59a0:	722a           	moveq #42,d1
    59a2:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    59a6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {  
    59aa:	52af 011e      	addq.l #1,286(sp)
    59ae:	7007           	moveq #7,d0
    59b0:	b0af 011e      	cmp.l 286(sp),d0
    59b4:	6cb8           	bge.s 596e <TestZoom4Picture+0x1aae>
    }
    
    for(int i2=0;i2<10;i2++) {
    59b6:	42af 011a      	clr.l 282(sp)
    59ba:	607c           	bra.s 5a38 <TestZoom4Picture+0x1b78>
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    59bc:	222f 0122      	move.l 290(sp),d1
    59c0:	2001           	move.l d1,d0
    59c2:	e788           	lsl.l #3,d0
    59c4:	9081           	sub.l d1,d0
    59c6:	d080           	add.l d0,d0
    59c8:	d080           	add.l d0,d0
    59ca:	2040           	movea.l d0,a0
    59cc:	41e8 000b      	lea 11(a0),a0
    59d0:	2208           	move.l a0,d1
    59d2:	d2af 011a      	add.l 282(sp),d1
    59d6:	7000           	moveq #0,d0
    59d8:	302f 01c6      	move.w 454(sp),d0
    59dc:	2f01           	move.l d1,-(sp)
    59de:	2f00           	move.l d0,-(sp)
    59e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    59e4:	2f2f 0056      	move.l 86(sp),-(sp)
    59e8:	4eba 1338      	jsr 6d22 <TestRow>(pc)
    59ec:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    59f0:	722a           	moveq #42,d1
    59f2:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    59f6:	222f 0122      	move.l 290(sp),d1
    59fa:	2001           	move.l d1,d0
    59fc:	e788           	lsl.l #3,d0
    59fe:	9081           	sub.l d1,d0
    5a00:	d080           	add.l d0,d0
    5a02:	d080           	add.l d0,d0
    5a04:	2040           	movea.l d0,a0
    5a06:	41e8 000b      	lea 11(a0),a0
    5a0a:	2208           	move.l a0,d1
    5a0c:	d2af 011a      	add.l 282(sp),d1
    5a10:	7000           	moveq #0,d0
    5a12:	302f 01c6      	move.w 454(sp),d0
    5a16:	2f01           	move.l d1,-(sp)
    5a18:	2f00           	move.l d0,-(sp)
    5a1a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a1e:	2f2f 0056      	move.l 86(sp),-(sp)
    5a22:	4eba 12fe      	jsr 6d22 <TestRow>(pc)
    5a26:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a2a:	702a           	moveq #42,d0
    5a2c:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5a30:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {
    5a34:	52af 011a      	addq.l #1,282(sp)
    5a38:	7209           	moveq #9,d1
    5a3a:	b2af 011a      	cmp.l 282(sp),d1
    5a3e:	6c00 ff7c      	bge.w 59bc <TestZoom4Picture+0x1afc>
  for(int i=0;i<9;i++) {
    5a42:	52af 0122      	addq.l #1,290(sp)
    5a46:	7008           	moveq #8,d0
    5a48:	b0af 0122      	cmp.l 290(sp),d0
    5a4c:	6c00 ff1a      	bge.w 5968 <TestZoom4Picture+0x1aa8>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    5a50:	42af 0116      	clr.l 278(sp)
    5a54:	6032           	bra.s 5a88 <TestZoom4Picture+0x1bc8>
    TestRow( valsupposed, valactual, mask, 255+i2);
    5a56:	222f 0116      	move.l 278(sp),d1
    5a5a:	0681 0000 00ff 	addi.l #255,d1
    5a60:	7000           	moveq #0,d0
    5a62:	302f 01c6      	move.w 454(sp),d0
    5a66:	2f01           	move.l d1,-(sp)
    5a68:	2f00           	move.l d0,-(sp)
    5a6a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a6e:	2f2f 0056      	move.l 86(sp),-(sp)
    5a72:	4eba 12ae      	jsr 6d22 <TestRow>(pc)
    5a76:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a7a:	722a           	moveq #42,d1
    5a7c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5a80:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    5a84:	52af 0116      	addq.l #1,278(sp)
    5a88:	7007           	moveq #7,d0
    5a8a:	b0af 0116      	cmp.l 278(sp),d0
    5a8e:	6cc6           	bge.s 5a56 <TestZoom4Picture+0x1b96>
  }
  for(int i=0;i<3;i++) {
    5a90:	42af 0112      	clr.l 274(sp)
    5a94:	6064           	bra.s 5afa <TestZoom4Picture+0x1c3a>
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    5a96:	202f 0112      	move.l 274(sp),d0
    5a9a:	d080           	add.l d0,d0
    5a9c:	2200           	move.l d0,d1
    5a9e:	0681 0000 0107 	addi.l #263,d1
    5aa4:	7000           	moveq #0,d0
    5aa6:	302f 01c6      	move.w 454(sp),d0
    5aaa:	2f01           	move.l d1,-(sp)
    5aac:	2f00           	move.l d0,-(sp)
    5aae:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ab2:	2f2f 0056      	move.l 86(sp),-(sp)
    5ab6:	4eba 126a      	jsr 6d22 <TestRow>(pc)
    5aba:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5abe:	722a           	moveq #42,d1
    5ac0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    5ac4:	202f 0112      	move.l 274(sp),d0
    5ac8:	0680 0000 0084 	addi.l #132,d0
    5ace:	d080           	add.l d0,d0
    5ad0:	2200           	move.l d0,d1
    5ad2:	7000           	moveq #0,d0
    5ad4:	302f 01c6      	move.w 454(sp),d0
    5ad8:	2f01           	move.l d1,-(sp)
    5ada:	2f00           	move.l d0,-(sp)
    5adc:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ae0:	2f2f 0056      	move.l 86(sp),-(sp)
    5ae4:	4eba 123c      	jsr 6d22 <TestRow>(pc)
    5ae8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5aec:	702a           	moveq #42,d0
    5aee:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5af2:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    5af6:	52af 0112      	addq.l #1,274(sp)
    5afa:	7202           	moveq #2,d1
    5afc:	b2af 0112      	cmp.l 274(sp),d1
    5b00:	6c94           	bge.s 5a96 <TestZoom4Picture+0x1bd6>
  }

  tmp = source;
    5b02:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5b08:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5b0e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    5b14:	4878 0001      	pea 1 <_start+0x1>
    5b18:	4878 000a      	pea a <_start+0xa>
    5b1c:	2f2f 0056      	move.l 86(sp),-(sp)
    5b20:	2f2f 006a      	move.l 106(sp),-(sp)
    5b24:	4eba c14a      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    5b28:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5b2c:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    5b32:	2c40           	movea.l d0,a6
    5b34:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5b38:	202f 004e      	move.l 78(sp),d0
    5b3c:	5880           	addq.l #4,d0
    5b3e:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom11;
    5b42:	2f7c 0000 bea4 	move.l #48804,74(sp)
    5b48:	004a 

  mask = 0xffff;
    5b4a:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  for(int i2=0;i2<6;i2++) {  
    5b50:	42af 010e      	clr.l 270(sp)
    5b54:	602a           	bra.s 5b80 <TestZoom4Picture+0x1cc0>
    TestRow( valsupposed, valactual, mask, i2);
    5b56:	7000           	moveq #0,d0
    5b58:	302f 01c6      	move.w 454(sp),d0
    5b5c:	2f2f 010e      	move.l 270(sp),-(sp)
    5b60:	2f00           	move.l d0,-(sp)
    5b62:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b66:	2f2f 0056      	move.l 86(sp),-(sp)
    5b6a:	4eba 11b6      	jsr 6d22 <TestRow>(pc)
    5b6e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5b72:	722a           	moveq #42,d1
    5b74:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5b78:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {  
    5b7c:	52af 010e      	addq.l #1,270(sp)
    5b80:	7005           	moveq #5,d0
    5b82:	b0af 010e      	cmp.l 270(sp),d0
    5b86:	6cce           	bge.s 5b56 <TestZoom4Picture+0x1c96>
  }

  for(int i2=0;i2<11;i2++) {
    5b88:	42af 010a      	clr.l 266(sp)
    5b8c:	605c           	bra.s 5bea <TestZoom4Picture+0x1d2a>
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    5b8e:	202f 010a      	move.l 266(sp),d0
    5b92:	5680           	addq.l #3,d0
    5b94:	d080           	add.l d0,d0
    5b96:	2200           	move.l d0,d1
    5b98:	7000           	moveq #0,d0
    5b9a:	302f 01c6      	move.w 454(sp),d0
    5b9e:	2f01           	move.l d1,-(sp)
    5ba0:	2f00           	move.l d0,-(sp)
    5ba2:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ba6:	2f2f 0056      	move.l 86(sp),-(sp)
    5baa:	4eba 1176      	jsr 6d22 <TestRow>(pc)
    5bae:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5bb2:	722a           	moveq #42,d1
    5bb4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    5bb8:	202f 010a      	move.l 266(sp),d0
    5bbc:	d080           	add.l d0,d0
    5bbe:	2200           	move.l d0,d1
    5bc0:	5e81           	addq.l #7,d1
    5bc2:	7000           	moveq #0,d0
    5bc4:	302f 01c6      	move.w 454(sp),d0
    5bc8:	2f01           	move.l d1,-(sp)
    5bca:	2f00           	move.l d0,-(sp)
    5bcc:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bd0:	2f2f 0056      	move.l 86(sp),-(sp)
    5bd4:	4eba 114c      	jsr 6d22 <TestRow>(pc)
    5bd8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5bdc:	702a           	moveq #42,d0
    5bde:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5be2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5be6:	52af 010a      	addq.l #1,266(sp)
    5bea:	720a           	moveq #10,d1
    5bec:	b2af 010a      	cmp.l 266(sp),d1
    5bf0:	6c9c           	bge.s 5b8e <TestZoom4Picture+0x1cce>
  }

  for(int i=0;i<8;i++) {
    5bf2:	42af 0106      	clr.l 262(sp)
    5bf6:	6000 00f2      	bra.w 5cea <TestZoom4Picture+0x1e2a>
    for(int i2=0;i2<7;i2++) {  
    5bfa:	42af 0102      	clr.l 258(sp)
    5bfe:	6044           	bra.s 5c44 <TestZoom4Picture+0x1d84>
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    5c00:	307c 001c      	movea.w #28,a0
    5c04:	d1ef 0102      	adda.l 258(sp),a0
    5c08:	222f 0106      	move.l 262(sp),d1
    5c0c:	2001           	move.l d1,d0
    5c0e:	e788           	lsl.l #3,d0
    5c10:	9081           	sub.l d1,d0
    5c12:	d080           	add.l d0,d0
    5c14:	d080           	add.l d0,d0
    5c16:	d081           	add.l d1,d0
    5c18:	2208           	move.l a0,d1
    5c1a:	d280           	add.l d0,d1
    5c1c:	7000           	moveq #0,d0
    5c1e:	302f 01c6      	move.w 454(sp),d0
    5c22:	2f01           	move.l d1,-(sp)
    5c24:	2f00           	move.l d0,-(sp)
    5c26:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c2a:	2f2f 0056      	move.l 86(sp),-(sp)
    5c2e:	4eba 10f2      	jsr 6d22 <TestRow>(pc)
    5c32:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5c36:	702a           	moveq #42,d0
    5c38:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5c3c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<7;i2++) {  
    5c40:	52af 0102      	addq.l #1,258(sp)
    5c44:	7206           	moveq #6,d1
    5c46:	b2af 0102      	cmp.l 258(sp),d1
    5c4a:	6cb4           	bge.s 5c00 <TestZoom4Picture+0x1d40>
    }
    
    for(int i2=0;i2<11;i2++) {
    5c4c:	42af 00fe      	clr.l 254(sp)
    5c50:	6000 008a      	bra.w 5cdc <TestZoom4Picture+0x1e1c>
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    5c54:	222f 0106      	move.l 262(sp),d1
    5c58:	2001           	move.l d1,d0
    5c5a:	e788           	lsl.l #3,d0
    5c5c:	9081           	sub.l d1,d0
    5c5e:	d080           	add.l d0,d0
    5c60:	d080           	add.l d0,d0
    5c62:	2040           	movea.l d0,a0
    5c64:	d1c1           	adda.l d1,a0
    5c66:	41e8 0023      	lea 35(a0),a0
    5c6a:	202f 00fe      	move.l 254(sp),d0
    5c6e:	d080           	add.l d0,d0
    5c70:	2208           	move.l a0,d1
    5c72:	d280           	add.l d0,d1
    5c74:	7000           	moveq #0,d0
    5c76:	302f 01c6      	move.w 454(sp),d0
    5c7a:	2f01           	move.l d1,-(sp)
    5c7c:	2f00           	move.l d0,-(sp)
    5c7e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c82:	2f2f 0056      	move.l 86(sp),-(sp)
    5c86:	4eba 109a      	jsr 6d22 <TestRow>(pc)
    5c8a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5c8e:	702a           	moveq #42,d0
    5c90:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    5c94:	222f 0106      	move.l 262(sp),d1
    5c98:	2001           	move.l d1,d0
    5c9a:	e788           	lsl.l #3,d0
    5c9c:	9081           	sub.l d1,d0
    5c9e:	d080           	add.l d0,d0
    5ca0:	d080           	add.l d0,d0
    5ca2:	2040           	movea.l d0,a0
    5ca4:	d1c1           	adda.l d1,a0
    5ca6:	41e8 000b      	lea 11(a0),a0
    5caa:	202f 00fe      	move.l 254(sp),d0
    5cae:	d080           	add.l d0,d0
    5cb0:	2208           	move.l a0,d1
    5cb2:	d280           	add.l d0,d1
    5cb4:	7000           	moveq #0,d0
    5cb6:	302f 01c6      	move.w 454(sp),d0
    5cba:	2f01           	move.l d1,-(sp)
    5cbc:	2f00           	move.l d0,-(sp)
    5cbe:	2f2f 01d0      	move.l 464(sp),-(sp)
    5cc2:	2f2f 0056      	move.l 86(sp),-(sp)
    5cc6:	4eba 105a      	jsr 6d22 <TestRow>(pc)
    5cca:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5cce:	722a           	moveq #42,d1
    5cd0:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5cd4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {
    5cd8:	52af 00fe      	addq.l #1,254(sp)
    5cdc:	700a           	moveq #10,d0
    5cde:	b0af 00fe      	cmp.l 254(sp),d0
    5ce2:	6c00 ff70      	bge.w 5c54 <TestZoom4Picture+0x1d94>
  for(int i=0;i<8;i++) {
    5ce6:	52af 0106      	addq.l #1,262(sp)
    5cea:	7207           	moveq #7,d1
    5cec:	b2af 0106      	cmp.l 262(sp),d1
    5cf0:	6c00 ff08      	bge.w 5bfa <TestZoom4Picture+0x1d3a>
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    5cf4:	42af 00fa      	clr.l 250(sp)
    5cf8:	6032           	bra.s 5d2c <TestZoom4Picture+0x1e6c>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5cfa:	222f 00fa      	move.l 250(sp),d1
    5cfe:	0681 0000 0104 	addi.l #260,d1
    5d04:	7000           	moveq #0,d0
    5d06:	302f 01c6      	move.w 454(sp),d0
    5d0a:	2f01           	move.l d1,-(sp)
    5d0c:	2f00           	move.l d0,-(sp)
    5d0e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d12:	2f2f 0056      	move.l 86(sp),-(sp)
    5d16:	4eba 100a      	jsr 6d22 <TestRow>(pc)
    5d1a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5d1e:	702a           	moveq #42,d0
    5d20:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5d24:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    5d28:	52af 00fa      	addq.l #1,250(sp)
    5d2c:	7206           	moveq #6,d1
    5d2e:	b2af 00fa      	cmp.l 250(sp),d1
    5d32:	6cc6           	bge.s 5cfa <TestZoom4Picture+0x1e3a>
  }
  TestRow( valsupposed, valactual, mask, 267);   
    5d34:	7000           	moveq #0,d0
    5d36:	302f 01c6      	move.w 454(sp),d0
    5d3a:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    5d3e:	2f00           	move.l d0,-(sp)
    5d40:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d44:	2f2f 0056      	move.l 86(sp),-(sp)
    5d48:	4eba 0fd8      	jsr 6d22 <TestRow>(pc)
    5d4c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5d50:	702a           	moveq #42,d0
    5d52:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 268);
    5d56:	7000           	moveq #0,d0
    5d58:	302f 01c6      	move.w 454(sp),d0
    5d5c:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    5d60:	2f00           	move.l d0,-(sp)
    5d62:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d66:	2f2f 0056      	move.l 86(sp),-(sp)
    5d6a:	4eba 0fb6      	jsr 6d22 <TestRow>(pc)
    5d6e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5d72:	722a           	moveq #42,d1
    5d74:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5d78:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 269);
    5d7c:	7000           	moveq #0,d0
    5d7e:	302f 01c6      	move.w 454(sp),d0
    5d82:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5d86:	2f00           	move.l d0,-(sp)
    5d88:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d8c:	2f2f 0056      	move.l 86(sp),-(sp)
    5d90:	4eba 0f90      	jsr 6d22 <TestRow>(pc)
    5d94:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5d98:	702a           	moveq #42,d0
    5d9a:	d1af 01c8      	add.l d0,456(sp)
  
  tmp = source;
    5d9e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5da4:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5daa:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    5db0:	4878 0001      	pea 1 <_start+0x1>
    5db4:	4878 000b      	pea b <_start+0xb>
    5db8:	2f2f 0056      	move.l 86(sp),-(sp)
    5dbc:	2f2f 006a      	move.l 106(sp),-(sp)
    5dc0:	4eba beae      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    5dc4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5dc8:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    5dce:	2c40           	movea.l d0,a6
    5dd0:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5dd4:	222f 004e      	move.l 78(sp),d1
    5dd8:	5881           	addq.l #4,d1
    5dda:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom12;
    5dde:	2f7c 0000 bed0 	move.l #48848,74(sp)
    5de4:	004a 

  mask = 0x0;
    5de6:	426f 01c6      	clr.w 454(sp)
   
  TestRow( valsupposed, valactual, mask, 0);
    5dea:	7000           	moveq #0,d0
    5dec:	302f 01c6      	move.w 454(sp),d0
    5df0:	42a7           	clr.l -(sp)
    5df2:	2f00           	move.l d0,-(sp)
    5df4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5df8:	2f2f 0056      	move.l 86(sp),-(sp)
    5dfc:	4eba 0f24      	jsr 6d22 <TestRow>(pc)
    5e00:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5e04:	702a           	moveq #42,d0
    5e06:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5e0a:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<12;i2++) {
    5e0e:	42af 00f6      	clr.l 246(sp)
    5e12:	605c           	bra.s 5e70 <TestZoom4Picture+0x1fb0>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5e14:	202f 00f6      	move.l 246(sp),d0
    5e18:	d080           	add.l d0,d0
    5e1a:	2200           	move.l d0,d1
    5e1c:	5281           	addq.l #1,d1
    5e1e:	7000           	moveq #0,d0
    5e20:	302f 01c6      	move.w 454(sp),d0
    5e24:	2f01           	move.l d1,-(sp)
    5e26:	2f00           	move.l d0,-(sp)
    5e28:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e2c:	2f2f 0056      	move.l 86(sp),-(sp)
    5e30:	4eba 0ef0      	jsr 6d22 <TestRow>(pc)
    5e34:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5e38:	722a           	moveq #42,d1
    5e3a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5e3e:	202f 00f6      	move.l 246(sp),d0
    5e42:	5280           	addq.l #1,d0
    5e44:	d080           	add.l d0,d0
    5e46:	2200           	move.l d0,d1
    5e48:	7000           	moveq #0,d0
    5e4a:	302f 01c6      	move.w 454(sp),d0
    5e4e:	2f01           	move.l d1,-(sp)
    5e50:	2f00           	move.l d0,-(sp)
    5e52:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e56:	2f2f 0056      	move.l 86(sp),-(sp)
    5e5a:	4eba 0ec6      	jsr 6d22 <TestRow>(pc)
    5e5e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5e62:	702a           	moveq #42,d0
    5e64:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5e68:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    5e6c:	52af 00f6      	addq.l #1,246(sp)
    5e70:	720b           	moveq #11,d1
    5e72:	b2af 00f6      	cmp.l 246(sp),d1
    5e76:	6c9c           	bge.s 5e14 <TestZoom4Picture+0x1f54>
  } 

  for(int i=0;i<8;i++) {
    5e78:	42af 00f2      	clr.l 242(sp)
    5e7c:	6000 00e6      	bra.w 5f64 <TestZoom4Picture+0x20a4>
    for(int i2=0;i2<6;i2++) {  
    5e80:	42af 00ee      	clr.l 238(sp)
    5e84:	6040           	bra.s 5ec6 <TestZoom4Picture+0x2006>
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    5e86:	307c 0019      	movea.w #25,a0
    5e8a:	d1ef 00ee      	adda.l 238(sp),a0
    5e8e:	222f 00f2      	move.l 242(sp),d1
    5e92:	2001           	move.l d1,d0
    5e94:	e988           	lsl.l #4,d0
    5e96:	9081           	sub.l d1,d0
    5e98:	d080           	add.l d0,d0
    5e9a:	2208           	move.l a0,d1
    5e9c:	d280           	add.l d0,d1
    5e9e:	7000           	moveq #0,d0
    5ea0:	302f 01c6      	move.w 454(sp),d0
    5ea4:	2f01           	move.l d1,-(sp)
    5ea6:	2f00           	move.l d0,-(sp)
    5ea8:	2f2f 01d0      	move.l 464(sp),-(sp)
    5eac:	2f2f 0056      	move.l 86(sp),-(sp)
    5eb0:	4eba 0e70      	jsr 6d22 <TestRow>(pc)
    5eb4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5eb8:	702a           	moveq #42,d0
    5eba:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5ebe:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<6;i2++) {  
    5ec2:	52af 00ee      	addq.l #1,238(sp)
    5ec6:	7205           	moveq #5,d1
    5ec8:	b2af 00ee      	cmp.l 238(sp),d1
    5ecc:	6cb8           	bge.s 5e86 <TestZoom4Picture+0x1fc6>
    }
    
    for(int i2=0;i2<12;i2++) {
    5ece:	42af 00ea      	clr.l 234(sp)
    5ed2:	6000 0082      	bra.w 5f56 <TestZoom4Picture+0x2096>
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    5ed6:	222f 00f2      	move.l 242(sp),d1
    5eda:	2001           	move.l d1,d0
    5edc:	e988           	lsl.l #4,d0
    5ede:	9081           	sub.l d1,d0
    5ee0:	d080           	add.l d0,d0
    5ee2:	2040           	movea.l d0,a0
    5ee4:	41e8 001f      	lea 31(a0),a0
    5ee8:	202f 00ea      	move.l 234(sp),d0
    5eec:	d080           	add.l d0,d0
    5eee:	2208           	move.l a0,d1
    5ef0:	d280           	add.l d0,d1
    5ef2:	7000           	moveq #0,d0
    5ef4:	302f 01c6      	move.w 454(sp),d0
    5ef8:	2f01           	move.l d1,-(sp)
    5efa:	2f00           	move.l d0,-(sp)
    5efc:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f00:	2f2f 0056      	move.l 86(sp),-(sp)
    5f04:	4eba 0e1c      	jsr 6d22 <TestRow>(pc)
    5f08:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f0c:	702a           	moveq #42,d0
    5f0e:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    5f12:	222f 00f2      	move.l 242(sp),d1
    5f16:	2001           	move.l d1,d0
    5f18:	e988           	lsl.l #4,d0
    5f1a:	9081           	sub.l d1,d0
    5f1c:	d080           	add.l d0,d0
    5f1e:	2040           	movea.l d0,a0
    5f20:	41e8 0020      	lea 32(a0),a0
    5f24:	202f 00ea      	move.l 234(sp),d0
    5f28:	d080           	add.l d0,d0
    5f2a:	2208           	move.l a0,d1
    5f2c:	d280           	add.l d0,d1
    5f2e:	7000           	moveq #0,d0
    5f30:	302f 01c6      	move.w 454(sp),d0
    5f34:	2f01           	move.l d1,-(sp)
    5f36:	2f00           	move.l d0,-(sp)
    5f38:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f3c:	2f2f 0056      	move.l 86(sp),-(sp)
    5f40:	4eba 0de0      	jsr 6d22 <TestRow>(pc)
    5f44:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f48:	722a           	moveq #42,d1
    5f4a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5f4e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {
    5f52:	52af 00ea      	addq.l #1,234(sp)
    5f56:	700b           	moveq #11,d0
    5f58:	b0af 00ea      	cmp.l 234(sp),d0
    5f5c:	6c00 ff78      	bge.w 5ed6 <TestZoom4Picture+0x2016>
  for(int i=0;i<8;i++) {
    5f60:	52af 00f2      	addq.l #1,242(sp)
    5f64:	7207           	moveq #7,d1
    5f66:	b2af 00f2      	cmp.l 242(sp),d1
    5f6a:	6c00 ff14      	bge.w 5e80 <TestZoom4Picture+0x1fc0>
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    5f6e:	42af 00e6      	clr.l 230(sp)
    5f72:	6032           	bra.s 5fa6 <TestZoom4Picture+0x20e6>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5f74:	222f 00e6      	move.l 230(sp),d1
    5f78:	0681 0000 0104 	addi.l #260,d1
    5f7e:	7000           	moveq #0,d0
    5f80:	302f 01c6      	move.w 454(sp),d0
    5f84:	2f01           	move.l d1,-(sp)
    5f86:	2f00           	move.l d0,-(sp)
    5f88:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f8c:	2f2f 0056      	move.l 86(sp),-(sp)
    5f90:	4eba 0d90      	jsr 6d22 <TestRow>(pc)
    5f94:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5f98:	702a           	moveq #42,d0
    5f9a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5f9e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5fa2:	52af 00e6      	addq.l #1,230(sp)
    5fa6:	7204           	moveq #4,d1
    5fa8:	b2af 00e6      	cmp.l 230(sp),d1
    5fac:	6cc6           	bge.s 5f74 <TestZoom4Picture+0x20b4>
  }

  tmp = source;
    5fae:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5fb4:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5fba:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    5fc0:	4878 0001      	pea 1 <_start+0x1>
    5fc4:	4878 000c      	pea c <_start+0xc>
    5fc8:	2f2f 0056      	move.l 86(sp),-(sp)
    5fcc:	2f2f 006a      	move.l 106(sp),-(sp)
    5fd0:	4eba bc9e      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    5fd4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5fd8:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    5fde:	2c40           	movea.l d0,a6
    5fe0:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5fe4:	202f 004e      	move.l 78(sp),d0
    5fe8:	5880           	addq.l #4,d0
    5fea:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom13;
    5fee:	2f7c 0000 befc 	move.l #48892,74(sp)
    5ff4:	004a 

  mask = 0xffff;
    5ff6:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<11;i2++) {
    5ffc:	42af 00e2      	clr.l 226(sp)
    6000:	605a           	bra.s 605c <TestZoom4Picture+0x219c>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6002:	202f 00e2      	move.l 226(sp),d0
    6006:	d080           	add.l d0,d0
    6008:	2200           	move.l d0,d1
    600a:	7000           	moveq #0,d0
    600c:	302f 01c6      	move.w 454(sp),d0
    6010:	2f01           	move.l d1,-(sp)
    6012:	2f00           	move.l d0,-(sp)
    6014:	2f2f 01d0      	move.l 464(sp),-(sp)
    6018:	2f2f 0056      	move.l 86(sp),-(sp)
    601c:	4eba 0d04      	jsr 6d22 <TestRow>(pc)
    6020:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6024:	722a           	moveq #42,d1
    6026:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    602a:	202f 00e2      	move.l 226(sp),d0
    602e:	d080           	add.l d0,d0
    6030:	2200           	move.l d0,d1
    6032:	5281           	addq.l #1,d1
    6034:	7000           	moveq #0,d0
    6036:	302f 01c6      	move.w 454(sp),d0
    603a:	2f01           	move.l d1,-(sp)
    603c:	2f00           	move.l d0,-(sp)
    603e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6042:	2f2f 0056      	move.l 86(sp),-(sp)
    6046:	4eba 0cda      	jsr 6d22 <TestRow>(pc)
    604a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    604e:	702a           	moveq #42,d0
    6050:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6054:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    6058:	52af 00e2      	addq.l #1,226(sp)
    605c:	720a           	moveq #10,d1
    605e:	b2af 00e2      	cmp.l 226(sp),d1
    6062:	6c9e           	bge.s 6002 <TestZoom4Picture+0x2142>
  } 

  for(int i=0;i<8;i++) {
    6064:	42af 00de      	clr.l 222(sp)
    6068:	6000 00de      	bra.w 6148 <TestZoom4Picture+0x2288>
    for(int i2=0;i2<5;i2++) {  
    606c:	42af 00da      	clr.l 218(sp)
    6070:	603e           	bra.s 60b0 <TestZoom4Picture+0x21f0>
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    6072:	307c 0016      	movea.w #22,a0
    6076:	d1ef 00da      	adda.l 218(sp),a0
    607a:	222f 00de      	move.l 222(sp),d1
    607e:	2001           	move.l d1,d0
    6080:	eb88           	lsl.l #5,d0
    6082:	9081           	sub.l d1,d0
    6084:	2208           	move.l a0,d1
    6086:	d280           	add.l d0,d1
    6088:	7000           	moveq #0,d0
    608a:	302f 01c6      	move.w 454(sp),d0
    608e:	2f01           	move.l d1,-(sp)
    6090:	2f00           	move.l d0,-(sp)
    6092:	2f2f 01d0      	move.l 464(sp),-(sp)
    6096:	2f2f 0056      	move.l 86(sp),-(sp)
    609a:	4eba 0c86      	jsr 6d22 <TestRow>(pc)
    609e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    60a2:	702a           	moveq #42,d0
    60a4:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    60a8:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<5;i2++) {  
    60ac:	52af 00da      	addq.l #1,218(sp)
    60b0:	7204           	moveq #4,d1
    60b2:	b2af 00da      	cmp.l 218(sp),d1
    60b6:	6cba           	bge.s 6072 <TestZoom4Picture+0x21b2>
    }
    
    for(int i2=0;i2<13;i2++) {
    60b8:	42af 00d6      	clr.l 214(sp)
    60bc:	607c           	bra.s 613a <TestZoom4Picture+0x227a>
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    60be:	222f 00de      	move.l 222(sp),d1
    60c2:	2001           	move.l d1,d0
    60c4:	eb88           	lsl.l #5,d0
    60c6:	2040           	movea.l d0,a0
    60c8:	91c1           	suba.l d1,a0
    60ca:	41e8 001b      	lea 27(a0),a0
    60ce:	202f 00d6      	move.l 214(sp),d0
    60d2:	d080           	add.l d0,d0
    60d4:	2208           	move.l a0,d1
    60d6:	d280           	add.l d0,d1
    60d8:	7000           	moveq #0,d0
    60da:	302f 01c6      	move.w 454(sp),d0
    60de:	2f01           	move.l d1,-(sp)
    60e0:	2f00           	move.l d0,-(sp)
    60e2:	2f2f 01d0      	move.l 464(sp),-(sp)
    60e6:	2f2f 0056      	move.l 86(sp),-(sp)
    60ea:	4eba 0c36      	jsr 6d22 <TestRow>(pc)
    60ee:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    60f2:	702a           	moveq #42,d0
    60f4:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    60f8:	222f 00de      	move.l 222(sp),d1
    60fc:	2001           	move.l d1,d0
    60fe:	eb88           	lsl.l #5,d0
    6100:	2040           	movea.l d0,a0
    6102:	91c1           	suba.l d1,a0
    6104:	41e8 001c      	lea 28(a0),a0
    6108:	202f 00d6      	move.l 214(sp),d0
    610c:	d080           	add.l d0,d0
    610e:	2208           	move.l a0,d1
    6110:	d280           	add.l d0,d1
    6112:	7000           	moveq #0,d0
    6114:	302f 01c6      	move.w 454(sp),d0
    6118:	2f01           	move.l d1,-(sp)
    611a:	2f00           	move.l d0,-(sp)
    611c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6120:	2f2f 0056      	move.l 86(sp),-(sp)
    6124:	4eba 0bfc      	jsr 6d22 <TestRow>(pc)
    6128:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    612c:	722a           	moveq #42,d1
    612e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6132:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {
    6136:	52af 00d6      	addq.l #1,214(sp)
    613a:	700c           	moveq #12,d0
    613c:	b0af 00d6      	cmp.l 214(sp),d0
    6140:	6c00 ff7c      	bge.w 60be <TestZoom4Picture+0x21fe>
  for(int i=0;i<8;i++) {
    6144:	52af 00de      	addq.l #1,222(sp)
    6148:	7207           	moveq #7,d1
    614a:	b2af 00de      	cmp.l 222(sp),d1
    614e:	6c00 ff1c      	bge.w 606c <TestZoom4Picture+0x21ac>
    }
  } 

  tmp = source;
    6152:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6158:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    615e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    6164:	4878 0001      	pea 1 <_start+0x1>
    6168:	4878 000d      	pea d <_start+0xd>
    616c:	2f2f 0056      	move.l 86(sp),-(sp)
    6170:	2f2f 006a      	move.l 106(sp),-(sp)
    6174:	4eba bafa      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    6178:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    617c:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    6182:	2c40           	movea.l d0,a6
    6184:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6188:	202f 004e      	move.l 78(sp),d0
    618c:	5880           	addq.l #4,d0
    618e:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom14;
    6192:	2f7c 0000 bf28 	move.l #48936,74(sp)
    6198:	004a 

  mask = 0xffff;
    619a:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    61a0:	7000           	moveq #0,d0
    61a2:	302f 01c6      	move.w 454(sp),d0
    61a6:	42a7           	clr.l -(sp)
    61a8:	2f00           	move.l d0,-(sp)
    61aa:	2f2f 01d0      	move.l 464(sp),-(sp)
    61ae:	2f2f 0056      	move.l 86(sp),-(sp)
    61b2:	4eba 0b6e      	jsr 6d22 <TestRow>(pc)
    61b6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2; 
    61ba:	722a           	moveq #42,d1
    61bc:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff; 
    61c0:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<9;i2++) {
    61c4:	42af 00d2      	clr.l 210(sp)
    61c8:	605c           	bra.s 6226 <TestZoom4Picture+0x2366>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    61ca:	202f 00d2      	move.l 210(sp),d0
    61ce:	d080           	add.l d0,d0
    61d0:	2200           	move.l d0,d1
    61d2:	5281           	addq.l #1,d1
    61d4:	7000           	moveq #0,d0
    61d6:	302f 01c6      	move.w 454(sp),d0
    61da:	2f01           	move.l d1,-(sp)
    61dc:	2f00           	move.l d0,-(sp)
    61de:	2f2f 01d0      	move.l 464(sp),-(sp)
    61e2:	2f2f 0056      	move.l 86(sp),-(sp)
    61e6:	4eba 0b3a      	jsr 6d22 <TestRow>(pc)
    61ea:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61ee:	702a           	moveq #42,d0
    61f0:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    61f4:	202f 00d2      	move.l 210(sp),d0
    61f8:	5280           	addq.l #1,d0
    61fa:	d080           	add.l d0,d0
    61fc:	2200           	move.l d0,d1
    61fe:	7000           	moveq #0,d0
    6200:	302f 01c6      	move.w 454(sp),d0
    6204:	2f01           	move.l d1,-(sp)
    6206:	2f00           	move.l d0,-(sp)
    6208:	2f2f 01d0      	move.l 464(sp),-(sp)
    620c:	2f2f 0056      	move.l 86(sp),-(sp)
    6210:	4eba 0b10      	jsr 6d22 <TestRow>(pc)
    6214:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6218:	722a           	moveq #42,d1
    621a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    621e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {
    6222:	52af 00d2      	addq.l #1,210(sp)
    6226:	7008           	moveq #8,d0
    6228:	b0af 00d2      	cmp.l 210(sp),d0
    622c:	6c9c           	bge.s 61ca <TestZoom4Picture+0x230a>
  } 

  for(int i=0;i<7;i++) {
    622e:	42af 00ce      	clr.l 206(sp)
    6232:	6000 00cc      	bra.w 6300 <TestZoom4Picture+0x2440>
    for(int i2=0;i2<4;i2++) {  
    6236:	42af 00ca      	clr.l 202(sp)
    623a:	6036           	bra.s 6272 <TestZoom4Picture+0x23b2>
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    623c:	7213           	moveq #19,d1
    623e:	d2af 00ca      	add.l 202(sp),d1
    6242:	202f 00ce      	move.l 206(sp),d0
    6246:	eb88           	lsl.l #5,d0
    6248:	d280           	add.l d0,d1
    624a:	7000           	moveq #0,d0
    624c:	302f 01c6      	move.w 454(sp),d0
    6250:	2f01           	move.l d1,-(sp)
    6252:	2f00           	move.l d0,-(sp)
    6254:	2f2f 01d0      	move.l 464(sp),-(sp)
    6258:	2f2f 0056      	move.l 86(sp),-(sp)
    625c:	4eba 0ac4      	jsr 6d22 <TestRow>(pc)
    6260:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6264:	722a           	moveq #42,d1
    6266:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    626a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<4;i2++) {  
    626e:	52af 00ca      	addq.l #1,202(sp)
    6272:	7003           	moveq #3,d0
    6274:	b0af 00ca      	cmp.l 202(sp),d0
    6278:	6cc2           	bge.s 623c <TestZoom4Picture+0x237c>
    }
    
    for(int i2=0;i2<14;i2++) {
    627a:	42af 00c6      	clr.l 198(sp)
    627e:	6074           	bra.s 62f4 <TestZoom4Picture+0x2434>
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    6280:	202f 00ce      	move.l 206(sp),d0
    6284:	eb88           	lsl.l #5,d0
    6286:	307c 0017      	movea.w #23,a0
    628a:	d1c0           	adda.l d0,a0
    628c:	202f 00c6      	move.l 198(sp),d0
    6290:	d080           	add.l d0,d0
    6292:	2208           	move.l a0,d1
    6294:	d280           	add.l d0,d1
    6296:	7000           	moveq #0,d0
    6298:	302f 01c6      	move.w 454(sp),d0
    629c:	2f01           	move.l d1,-(sp)
    629e:	2f00           	move.l d0,-(sp)
    62a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    62a4:	2f2f 0056      	move.l 86(sp),-(sp)
    62a8:	4eba 0a78      	jsr 6d22 <TestRow>(pc)
    62ac:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    62b0:	722a           	moveq #42,d1
    62b2:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    62b6:	202f 00ce      	move.l 206(sp),d0
    62ba:	eb88           	lsl.l #5,d0
    62bc:	307c 0018      	movea.w #24,a0
    62c0:	d1c0           	adda.l d0,a0
    62c2:	202f 00c6      	move.l 198(sp),d0
    62c6:	d080           	add.l d0,d0
    62c8:	2208           	move.l a0,d1
    62ca:	d280           	add.l d0,d1
    62cc:	7000           	moveq #0,d0
    62ce:	302f 01c6      	move.w 454(sp),d0
    62d2:	2f01           	move.l d1,-(sp)
    62d4:	2f00           	move.l d0,-(sp)
    62d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    62da:	2f2f 0056      	move.l 86(sp),-(sp)
    62de:	4eba 0a42      	jsr 6d22 <TestRow>(pc)
    62e2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    62e6:	702a           	moveq #42,d0
    62e8:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    62ec:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {
    62f0:	52af 00c6      	addq.l #1,198(sp)
    62f4:	720d           	moveq #13,d1
    62f6:	b2af 00c6      	cmp.l 198(sp),d1
    62fa:	6c84           	bge.s 6280 <TestZoom4Picture+0x23c0>
  for(int i=0;i<7;i++) {
    62fc:	52af 00ce      	addq.l #1,206(sp)
    6300:	7006           	moveq #6,d0
    6302:	b0af 00ce      	cmp.l 206(sp),d0
    6306:	6c00 ff2e      	bge.w 6236 <TestZoom4Picture+0x2376>
    }
  }

  for(int i2=0;i2<4;i2++) {  
    630a:	42af 00c2      	clr.l 194(sp)
    630e:	6032           	bra.s 6342 <TestZoom4Picture+0x2482>
    TestRow( valsupposed, valactual, mask, 243+i2);
    6310:	222f 00c2      	move.l 194(sp),d1
    6314:	0681 0000 00f3 	addi.l #243,d1
    631a:	7000           	moveq #0,d0
    631c:	302f 01c6      	move.w 454(sp),d0
    6320:	2f01           	move.l d1,-(sp)
    6322:	2f00           	move.l d0,-(sp)
    6324:	2f2f 01d0      	move.l 464(sp),-(sp)
    6328:	2f2f 0056      	move.l 86(sp),-(sp)
    632c:	4eba 09f4      	jsr 6d22 <TestRow>(pc)
    6330:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6334:	722a           	moveq #42,d1
    6336:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    633a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {  
    633e:	52af 00c2      	addq.l #1,194(sp)
    6342:	7003           	moveq #3,d0
    6344:	b0af 00c2      	cmp.l 194(sp),d0
    6348:	6cc6           	bge.s 6310 <TestZoom4Picture+0x2450>
  }

  for(int i2=0;i2<12;i2++) {
    634a:	42af 00be      	clr.l 190(sp)
    634e:	6060           	bra.s 63b0 <TestZoom4Picture+0x24f0>
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    6350:	202f 00be      	move.l 190(sp),d0
    6354:	d080           	add.l d0,d0
    6356:	2200           	move.l d0,d1
    6358:	0681 0000 00f7 	addi.l #247,d1
    635e:	7000           	moveq #0,d0
    6360:	302f 01c6      	move.w 454(sp),d0
    6364:	2f01           	move.l d1,-(sp)
    6366:	2f00           	move.l d0,-(sp)
    6368:	2f2f 01d0      	move.l 464(sp),-(sp)
    636c:	2f2f 0056      	move.l 86(sp),-(sp)
    6370:	4eba 09b0      	jsr 6d22 <TestRow>(pc)
    6374:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6378:	722a           	moveq #42,d1
    637a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    637e:	707c           	moveq #124,d0
    6380:	d0af 00be      	add.l 190(sp),d0
    6384:	d080           	add.l d0,d0
    6386:	2200           	move.l d0,d1
    6388:	7000           	moveq #0,d0
    638a:	302f 01c6      	move.w 454(sp),d0
    638e:	2f01           	move.l d1,-(sp)
    6390:	2f00           	move.l d0,-(sp)
    6392:	2f2f 01d0      	move.l 464(sp),-(sp)
    6396:	2f2f 0056      	move.l 86(sp),-(sp)
    639a:	4eba 0986      	jsr 6d22 <TestRow>(pc)
    639e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    63a2:	702a           	moveq #42,d0
    63a4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    63a8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    63ac:	52af 00be      	addq.l #1,190(sp)
    63b0:	720b           	moveq #11,d1
    63b2:	b2af 00be      	cmp.l 190(sp),d1
    63b6:	6c98           	bge.s 6350 <TestZoom4Picture+0x2490>
  }

  tmp = source;
    63b8:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    63be:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    63c4:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    63ca:	4878 0001      	pea 1 <_start+0x1>
    63ce:	4878 000e      	pea e <_start+0xe>
    63d2:	2f2f 0056      	move.l 86(sp),-(sp)
    63d6:	2f2f 006a      	move.l 106(sp),-(sp)
    63da:	4eba b894      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    63de:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    63e2:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    63e8:	2c40           	movea.l d0,a6
    63ea:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    63ee:	202f 004e      	move.l 78(sp),d0
    63f2:	5880           	addq.l #4,d0
    63f4:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom15;
    63f8:	2f7c 0000 bf54 	move.l #48980,74(sp)
    63fe:	004a 

  mask = 0x0000;
    6400:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<8;i2++) {
    6404:	42af 00ba      	clr.l 186(sp)
    6408:	605a           	bra.s 6464 <TestZoom4Picture+0x25a4>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    640a:	202f 00ba      	move.l 186(sp),d0
    640e:	d080           	add.l d0,d0
    6410:	2200           	move.l d0,d1
    6412:	7000           	moveq #0,d0
    6414:	302f 01c6      	move.w 454(sp),d0
    6418:	2f01           	move.l d1,-(sp)
    641a:	2f00           	move.l d0,-(sp)
    641c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6420:	2f2f 0056      	move.l 86(sp),-(sp)
    6424:	4eba 08fc      	jsr 6d22 <TestRow>(pc)
    6428:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    642c:	722a           	moveq #42,d1
    642e:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6432:	202f 00ba      	move.l 186(sp),d0
    6436:	d080           	add.l d0,d0
    6438:	2200           	move.l d0,d1
    643a:	5281           	addq.l #1,d1
    643c:	7000           	moveq #0,d0
    643e:	302f 01c6      	move.w 454(sp),d0
    6442:	2f01           	move.l d1,-(sp)
    6444:	2f00           	move.l d0,-(sp)
    6446:	2f2f 01d0      	move.l 464(sp),-(sp)
    644a:	2f2f 0056      	move.l 86(sp),-(sp)
    644e:	4eba 08d2      	jsr 6d22 <TestRow>(pc)
    6452:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6456:	702a           	moveq #42,d0
    6458:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    645c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    6460:	52af 00ba      	addq.l #1,186(sp)
    6464:	7207           	moveq #7,d1
    6466:	b2af 00ba      	cmp.l 186(sp),d1
    646a:	6c9e           	bge.s 640a <TestZoom4Picture+0x254a>
  }

  for(int i=0;i<7;i++) {
    646c:	42af 00b6      	clr.l 182(sp)
    6470:	6000 00de      	bra.w 6550 <TestZoom4Picture+0x2690>
    for(int i2=0;i2<3;i2++) {  
    6474:	42af 00b2      	clr.l 178(sp)
    6478:	603e           	bra.s 64b8 <TestZoom4Picture+0x25f8>
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    647a:	307c 0010      	movea.w #16,a0
    647e:	d1ef 00b2      	adda.l 178(sp),a0
    6482:	222f 00b6      	move.l 182(sp),d1
    6486:	2001           	move.l d1,d0
    6488:	eb88           	lsl.l #5,d0
    648a:	d081           	add.l d1,d0
    648c:	2208           	move.l a0,d1
    648e:	d280           	add.l d0,d1
    6490:	7000           	moveq #0,d0
    6492:	302f 01c6      	move.w 454(sp),d0
    6496:	2f01           	move.l d1,-(sp)
    6498:	2f00           	move.l d0,-(sp)
    649a:	2f2f 01d0      	move.l 464(sp),-(sp)
    649e:	2f2f 0056      	move.l 86(sp),-(sp)
    64a2:	4eba 087e      	jsr 6d22 <TestRow>(pc)
    64a6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    64aa:	702a           	moveq #42,d0
    64ac:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    64b0:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<3;i2++) {  
    64b4:	52af 00b2      	addq.l #1,178(sp)
    64b8:	7202           	moveq #2,d1
    64ba:	b2af 00b2      	cmp.l 178(sp),d1
    64be:	6cba           	bge.s 647a <TestZoom4Picture+0x25ba>
    }
    
    for(int i2=0;i2<15;i2++) {
    64c0:	42af 00ae      	clr.l 174(sp)
    64c4:	607c           	bra.s 6542 <TestZoom4Picture+0x2682>
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    64c6:	222f 00b6      	move.l 182(sp),d1
    64ca:	2001           	move.l d1,d0
    64cc:	eb88           	lsl.l #5,d0
    64ce:	2040           	movea.l d0,a0
    64d0:	d1c1           	adda.l d1,a0
    64d2:	41e8 0013      	lea 19(a0),a0
    64d6:	202f 00ae      	move.l 174(sp),d0
    64da:	d080           	add.l d0,d0
    64dc:	2208           	move.l a0,d1
    64de:	d280           	add.l d0,d1
    64e0:	7000           	moveq #0,d0
    64e2:	302f 01c6      	move.w 454(sp),d0
    64e6:	2f01           	move.l d1,-(sp)
    64e8:	2f00           	move.l d0,-(sp)
    64ea:	2f2f 01d0      	move.l 464(sp),-(sp)
    64ee:	2f2f 0056      	move.l 86(sp),-(sp)
    64f2:	4eba 082e      	jsr 6d22 <TestRow>(pc)
    64f6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    64fa:	702a           	moveq #42,d0
    64fc:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    6500:	222f 00b6      	move.l 182(sp),d1
    6504:	2001           	move.l d1,d0
    6506:	eb88           	lsl.l #5,d0
    6508:	2040           	movea.l d0,a0
    650a:	d1c1           	adda.l d1,a0
    650c:	41e8 0013      	lea 19(a0),a0
    6510:	202f 00ae      	move.l 174(sp),d0
    6514:	d080           	add.l d0,d0
    6516:	2208           	move.l a0,d1
    6518:	d280           	add.l d0,d1
    651a:	7000           	moveq #0,d0
    651c:	302f 01c6      	move.w 454(sp),d0
    6520:	2f01           	move.l d1,-(sp)
    6522:	2f00           	move.l d0,-(sp)
    6524:	2f2f 01d0      	move.l 464(sp),-(sp)
    6528:	2f2f 0056      	move.l 86(sp),-(sp)
    652c:	4eba 07f4      	jsr 6d22 <TestRow>(pc)
    6530:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6534:	722a           	moveq #42,d1
    6536:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    653a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {
    653e:	52af 00ae      	addq.l #1,174(sp)
    6542:	700e           	moveq #14,d0
    6544:	b0af 00ae      	cmp.l 174(sp),d0
    6548:	6c00 ff7c      	bge.w 64c6 <TestZoom4Picture+0x2606>
  for(int i=0;i<7;i++) {
    654c:	52af 00b6      	addq.l #1,182(sp)
    6550:	7206           	moveq #6,d1
    6552:	b2af 00b6      	cmp.l 182(sp),d1
    6556:	6c00 ff1c      	bge.w 6474 <TestZoom4Picture+0x25b4>
    }
  }

  for(int i2=0;i2<3;i2++) {  
    655a:	42af 00aa      	clr.l 170(sp)
    655e:	6032           	bra.s 6592 <TestZoom4Picture+0x26d2>
    TestRow( valsupposed, valactual, mask, 247+i2);
    6560:	222f 00aa      	move.l 170(sp),d1
    6564:	0681 0000 00f7 	addi.l #247,d1
    656a:	7000           	moveq #0,d0
    656c:	302f 01c6      	move.w 454(sp),d0
    6570:	2f01           	move.l d1,-(sp)
    6572:	2f00           	move.l d0,-(sp)
    6574:	2f2f 01d0      	move.l 464(sp),-(sp)
    6578:	2f2f 0056      	move.l 86(sp),-(sp)
    657c:	4eba 07a4      	jsr 6d22 <TestRow>(pc)
    6580:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6584:	702a           	moveq #42,d0
    6586:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    658a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<3;i2++) {  
    658e:	52af 00aa      	addq.l #1,170(sp)
    6592:	7202           	moveq #2,d1
    6594:	b2af 00aa      	cmp.l 170(sp),d1
    6598:	6cc6           	bge.s 6560 <TestZoom4Picture+0x26a0>
  }

  for(int i2=0;i2<10;i2++) {
    659a:	42af 00a6      	clr.l 166(sp)
    659e:	6060           	bra.s 6600 <TestZoom4Picture+0x2740>
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    65a0:	707d           	moveq #125,d0
    65a2:	d0af 00a6      	add.l 166(sp),d0
    65a6:	d080           	add.l d0,d0
    65a8:	2200           	move.l d0,d1
    65aa:	7000           	moveq #0,d0
    65ac:	302f 01c6      	move.w 454(sp),d0
    65b0:	2f01           	move.l d1,-(sp)
    65b2:	2f00           	move.l d0,-(sp)
    65b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    65b8:	2f2f 0056      	move.l 86(sp),-(sp)
    65bc:	4eba 0764      	jsr 6d22 <TestRow>(pc)
    65c0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    65c4:	702a           	moveq #42,d0
    65c6:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    65ca:	202f 00a6      	move.l 166(sp),d0
    65ce:	d080           	add.l d0,d0
    65d0:	2200           	move.l d0,d1
    65d2:	0681 0000 00fb 	addi.l #251,d1
    65d8:	7000           	moveq #0,d0
    65da:	302f 01c6      	move.w 454(sp),d0
    65de:	2f01           	move.l d1,-(sp)
    65e0:	2f00           	move.l d0,-(sp)
    65e2:	2f2f 01d0      	move.l 464(sp),-(sp)
    65e6:	2f2f 0056      	move.l 86(sp),-(sp)
    65ea:	4eba 0736      	jsr 6d22 <TestRow>(pc)
    65ee:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    65f2:	722a           	moveq #42,d1
    65f4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    65f8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {
    65fc:	52af 00a6      	addq.l #1,166(sp)
    6600:	7009           	moveq #9,d0
    6602:	b0af 00a6      	cmp.l 166(sp),d0
    6606:	6c98           	bge.s 65a0 <TestZoom4Picture+0x26e0>
  }

  tmp = source;
    6608:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    660e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6614:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    661a:	4878 0001      	pea 1 <_start+0x1>
    661e:	4878 000f      	pea f <_start+0xf>
    6622:	2f2f 0056      	move.l 86(sp),-(sp)
    6626:	2f2f 006a      	move.l 106(sp),-(sp)
    662a:	4eba b644      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    662e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6632:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    6638:	2c40           	movea.l d0,a6
    663a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    663e:	222f 004e      	move.l 78(sp),d1
    6642:	5881           	addq.l #4,d1
    6644:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom16;
    6648:	2f7c 0000 bf80 	move.l #49024,74(sp)
    664e:	004a 

  mask = 0x0000;
    6650:	426f 01c6      	clr.w 454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    6654:	7000           	moveq #0,d0
    6656:	302f 01c6      	move.w 454(sp),d0
    665a:	42a7           	clr.l -(sp)
    665c:	2f00           	move.l d0,-(sp)
    665e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6662:	2f2f 0056      	move.l 86(sp),-(sp)
    6666:	4eba 06ba      	jsr 6d22 <TestRow>(pc)
    666a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    666e:	702a           	moveq #42,d0
    6670:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6674:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    6678:	42af 00a2      	clr.l 162(sp)
    667c:	605a           	bra.s 66d8 <TestZoom4Picture+0x2818>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    667e:	202f 00a2      	move.l 162(sp),d0
    6682:	d080           	add.l d0,d0
    6684:	2200           	move.l d0,d1
    6686:	7000           	moveq #0,d0
    6688:	302f 01c6      	move.w 454(sp),d0
    668c:	2f01           	move.l d1,-(sp)
    668e:	2f00           	move.l d0,-(sp)
    6690:	2f2f 01d0      	move.l 464(sp),-(sp)
    6694:	2f2f 0056      	move.l 86(sp),-(sp)
    6698:	4eba 0688      	jsr 6d22 <TestRow>(pc)
    669c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66a0:	722a           	moveq #42,d1
    66a2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    66a6:	202f 00a2      	move.l 162(sp),d0
    66aa:	d080           	add.l d0,d0
    66ac:	2200           	move.l d0,d1
    66ae:	5281           	addq.l #1,d1
    66b0:	7000           	moveq #0,d0
    66b2:	302f 01c6      	move.w 454(sp),d0
    66b6:	2f01           	move.l d1,-(sp)
    66b8:	2f00           	move.l d0,-(sp)
    66ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    66be:	2f2f 0056      	move.l 86(sp),-(sp)
    66c2:	4eba 065e      	jsr 6d22 <TestRow>(pc)
    66c6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66ca:	702a           	moveq #42,d0
    66cc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    66d0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    66d4:	52af 00a2      	addq.l #1,162(sp)
    66d8:	7205           	moveq #5,d1
    66da:	b2af 00a2      	cmp.l 162(sp),d1
    66de:	6c9e           	bge.s 667e <TestZoom4Picture+0x27be>
  }

  for(int i=0;i<7;i++) {
    66e0:	42af 009e      	clr.l 158(sp)
    66e4:	6000 00e6      	bra.w 67cc <TestZoom4Picture+0x290c>
    for(int i2=0;i2<2;i2++) {  
    66e8:	42af 009a      	clr.l 154(sp)
    66ec:	6040           	bra.s 672e <TestZoom4Picture+0x286e>
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    66ee:	307c 000d      	movea.w #13,a0
    66f2:	d1ef 009a      	adda.l 154(sp),a0
    66f6:	222f 009e      	move.l 158(sp),d1
    66fa:	2001           	move.l d1,d0
    66fc:	e988           	lsl.l #4,d0
    66fe:	d081           	add.l d1,d0
    6700:	d080           	add.l d0,d0
    6702:	2208           	move.l a0,d1
    6704:	d280           	add.l d0,d1
    6706:	7000           	moveq #0,d0
    6708:	302f 01c6      	move.w 454(sp),d0
    670c:	2f01           	move.l d1,-(sp)
    670e:	2f00           	move.l d0,-(sp)
    6710:	2f2f 01d0      	move.l 464(sp),-(sp)
    6714:	2f2f 0056      	move.l 86(sp),-(sp)
    6718:	4eba 0608      	jsr 6d22 <TestRow>(pc)
    671c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6720:	702a           	moveq #42,d0
    6722:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6726:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<2;i2++) {  
    672a:	52af 009a      	addq.l #1,154(sp)
    672e:	7201           	moveq #1,d1
    6730:	b2af 009a      	cmp.l 154(sp),d1
    6734:	6cb8           	bge.s 66ee <TestZoom4Picture+0x282e>
    }
    
    for(int i2=0;i2<16;i2++) {
    6736:	42af 0096      	clr.l 150(sp)
    673a:	6000 0082      	bra.w 67be <TestZoom4Picture+0x28fe>
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    673e:	222f 009e      	move.l 158(sp),d1
    6742:	2001           	move.l d1,d0
    6744:	e988           	lsl.l #4,d0
    6746:	d081           	add.l d1,d0
    6748:	d080           	add.l d0,d0
    674a:	2040           	movea.l d0,a0
    674c:	41e8 0010      	lea 16(a0),a0
    6750:	202f 0096      	move.l 150(sp),d0
    6754:	d080           	add.l d0,d0
    6756:	2208           	move.l a0,d1
    6758:	d280           	add.l d0,d1
    675a:	7000           	moveq #0,d0
    675c:	302f 01c6      	move.w 454(sp),d0
    6760:	2f01           	move.l d1,-(sp)
    6762:	2f00           	move.l d0,-(sp)
    6764:	2f2f 01d0      	move.l 464(sp),-(sp)
    6768:	2f2f 0056      	move.l 86(sp),-(sp)
    676c:	4eba 05b4      	jsr 6d22 <TestRow>(pc)
    6770:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6774:	702a           	moveq #42,d0
    6776:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    677a:	222f 009e      	move.l 158(sp),d1
    677e:	2001           	move.l d1,d0
    6780:	e988           	lsl.l #4,d0
    6782:	d081           	add.l d1,d0
    6784:	d080           	add.l d0,d0
    6786:	2040           	movea.l d0,a0
    6788:	41e8 0011      	lea 17(a0),a0
    678c:	202f 0096      	move.l 150(sp),d0
    6790:	d080           	add.l d0,d0
    6792:	2208           	move.l a0,d1
    6794:	d280           	add.l d0,d1
    6796:	7000           	moveq #0,d0
    6798:	302f 01c6      	move.w 454(sp),d0
    679c:	2f01           	move.l d1,-(sp)
    679e:	2f00           	move.l d0,-(sp)
    67a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    67a4:	2f2f 0056      	move.l 86(sp),-(sp)
    67a8:	4eba 0578      	jsr 6d22 <TestRow>(pc)
    67ac:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    67b0:	722a           	moveq #42,d1
    67b2:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    67b6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {
    67ba:	52af 0096      	addq.l #1,150(sp)
    67be:	700f           	moveq #15,d0
    67c0:	b0af 0096      	cmp.l 150(sp),d0
    67c4:	6c00 ff78      	bge.w 673e <TestZoom4Picture+0x287e>
  for(int i=0;i<7;i++) {
    67c8:	52af 009e      	addq.l #1,158(sp)
    67cc:	7206           	moveq #6,d1
    67ce:	b2af 009e      	cmp.l 158(sp),d1
    67d2:	6c00 ff14      	bge.w 66e8 <TestZoom4Picture+0x2828>
    }
  }

  for(int i2=0;i2<2;i2++) {
    67d6:	42af 0092      	clr.l 146(sp)
    67da:	6032           	bra.s 680e <TestZoom4Picture+0x294e>
    TestRow( valsupposed, valactual, mask, 251+i2);
    67dc:	222f 0092      	move.l 146(sp),d1
    67e0:	0681 0000 00fb 	addi.l #251,d1
    67e6:	7000           	moveq #0,d0
    67e8:	302f 01c6      	move.w 454(sp),d0
    67ec:	2f01           	move.l d1,-(sp)
    67ee:	2f00           	move.l d0,-(sp)
    67f0:	2f2f 01d0      	move.l 464(sp),-(sp)
    67f4:	2f2f 0056      	move.l 86(sp),-(sp)
    67f8:	4eba 0528      	jsr 6d22 <TestRow>(pc)
    67fc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6800:	702a           	moveq #42,d0
    6802:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6806:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<2;i2++) {
    680a:	52af 0092      	addq.l #1,146(sp)
    680e:	7201           	moveq #1,d1
    6810:	b2af 0092      	cmp.l 146(sp),d1
    6814:	6cc6           	bge.s 67dc <TestZoom4Picture+0x291c>
  }

  for(int i2=0;i2<8;i2++) {
    6816:	42af 008e      	clr.l 142(sp)
    681a:	6060           	bra.s 687c <TestZoom4Picture+0x29bc>
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    681c:	202f 008e      	move.l 142(sp),d0
    6820:	d080           	add.l d0,d0
    6822:	2200           	move.l d0,d1
    6824:	0681 0000 00fd 	addi.l #253,d1
    682a:	7000           	moveq #0,d0
    682c:	302f 01c6      	move.w 454(sp),d0
    6830:	2f01           	move.l d1,-(sp)
    6832:	2f00           	move.l d0,-(sp)
    6834:	2f2f 01d0      	move.l 464(sp),-(sp)
    6838:	2f2f 0056      	move.l 86(sp),-(sp)
    683c:	4eba 04e4      	jsr 6d22 <TestRow>(pc)
    6840:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6844:	702a           	moveq #42,d0
    6846:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    684a:	707f           	moveq #127,d0
    684c:	d0af 008e      	add.l 142(sp),d0
    6850:	d080           	add.l d0,d0
    6852:	2200           	move.l d0,d1
    6854:	7000           	moveq #0,d0
    6856:	302f 01c6      	move.w 454(sp),d0
    685a:	2f01           	move.l d1,-(sp)
    685c:	2f00           	move.l d0,-(sp)
    685e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6862:	2f2f 0056      	move.l 86(sp),-(sp)
    6866:	4eba 04ba      	jsr 6d22 <TestRow>(pc)
    686a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    686e:	722a           	moveq #42,d1
    6870:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6874:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    6878:	52af 008e      	addq.l #1,142(sp)
    687c:	7007           	moveq #7,d0
    687e:	b0af 008e      	cmp.l 142(sp),d0
    6882:	6c98           	bge.s 681c <TestZoom4Picture+0x295c>
  }

  tmp = source;
    6884:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    688a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6890:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    6896:	4878 0001      	pea 1 <_start+0x1>
    689a:	4878 0010      	pea 10 <_start+0x10>
    689e:	2f2f 0056      	move.l 86(sp),-(sp)
    68a2:	2f2f 006a      	move.l 106(sp),-(sp)
    68a6:	4eba b3c8      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    68aa:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    68ae:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    68b4:	2c40           	movea.l d0,a6
    68b6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    68ba:	222f 004e      	move.l 78(sp),d1
    68be:	5881           	addq.l #4,d1
    68c0:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom17;
    68c4:	2f7c 0000 bfac 	move.l #49068,74(sp)
    68ca:	004a 

  mask = 0xffff;
    68cc:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<5;i2++) {
    68d2:	42af 008a      	clr.l 138(sp)
    68d6:	605a           	bra.s 6932 <TestZoom4Picture+0x2a72>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    68d8:	202f 008a      	move.l 138(sp),d0
    68dc:	d080           	add.l d0,d0
    68de:	2200           	move.l d0,d1
    68e0:	7000           	moveq #0,d0
    68e2:	302f 01c6      	move.w 454(sp),d0
    68e6:	2f01           	move.l d1,-(sp)
    68e8:	2f00           	move.l d0,-(sp)
    68ea:	2f2f 01d0      	move.l 464(sp),-(sp)
    68ee:	2f2f 0056      	move.l 86(sp),-(sp)
    68f2:	4eba 042e      	jsr 6d22 <TestRow>(pc)
    68f6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    68fa:	702a           	moveq #42,d0
    68fc:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6900:	202f 008a      	move.l 138(sp),d0
    6904:	d080           	add.l d0,d0
    6906:	2200           	move.l d0,d1
    6908:	5281           	addq.l #1,d1
    690a:	7000           	moveq #0,d0
    690c:	302f 01c6      	move.w 454(sp),d0
    6910:	2f01           	move.l d1,-(sp)
    6912:	2f00           	move.l d0,-(sp)
    6914:	2f2f 01d0      	move.l 464(sp),-(sp)
    6918:	2f2f 0056      	move.l 86(sp),-(sp)
    691c:	4eba 0404      	jsr 6d22 <TestRow>(pc)
    6920:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6924:	722a           	moveq #42,d1
    6926:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    692a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {
    692e:	52af 008a      	addq.l #1,138(sp)
    6932:	7004           	moveq #4,d0
    6934:	b0af 008a      	cmp.l 138(sp),d0
    6938:	6c9e           	bge.s 68d8 <TestZoom4Picture+0x2a18>
  }

  for(int i=0;i<7;i++) {
    693a:	42af 0086      	clr.l 134(sp)
    693e:	6000 00d4      	bra.w 6a14 <TestZoom4Picture+0x2b54>
      TestRow( valsupposed, valactual, mask, 10+i*35);
    6942:	222f 0086      	move.l 134(sp),d1
    6946:	2001           	move.l d1,d0
    6948:	e988           	lsl.l #4,d0
    694a:	d081           	add.l d1,d0
    694c:	d080           	add.l d0,d0
    694e:	2040           	movea.l d0,a0
    6950:	d1c1           	adda.l d1,a0
    6952:	41e8 000a      	lea 10(a0),a0
    6956:	7000           	moveq #0,d0
    6958:	302f 01c6      	move.w 454(sp),d0
    695c:	2f08           	move.l a0,-(sp)
    695e:	2f00           	move.l d0,-(sp)
    6960:	2f2f 01d0      	move.l 464(sp),-(sp)
    6964:	2f2f 0056      	move.l 86(sp),-(sp)
    6968:	4eba 03b8      	jsr 6d22 <TestRow>(pc)
    696c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6970:	722a           	moveq #42,d1
    6972:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6976:	466f 01c6      	not.w 454(sp)
    
    for(int i2=0;i2<17;i2++) {
    697a:	42af 0082      	clr.l 130(sp)
    697e:	6000 0086      	bra.w 6a06 <TestZoom4Picture+0x2b46>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6982:	222f 0086      	move.l 134(sp),d1
    6986:	2001           	move.l d1,d0
    6988:	e988           	lsl.l #4,d0
    698a:	d081           	add.l d1,d0
    698c:	d080           	add.l d0,d0
    698e:	2040           	movea.l d0,a0
    6990:	d1c1           	adda.l d1,a0
    6992:	41e8 000b      	lea 11(a0),a0
    6996:	202f 0082      	move.l 130(sp),d0
    699a:	d080           	add.l d0,d0
    699c:	2208           	move.l a0,d1
    699e:	d280           	add.l d0,d1
    69a0:	7000           	moveq #0,d0
    69a2:	302f 01c6      	move.w 454(sp),d0
    69a6:	2f01           	move.l d1,-(sp)
    69a8:	2f00           	move.l d0,-(sp)
    69aa:	2f2f 01d0      	move.l 464(sp),-(sp)
    69ae:	2f2f 0056      	move.l 86(sp),-(sp)
    69b2:	4eba 036e      	jsr 6d22 <TestRow>(pc)
    69b6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    69ba:	702a           	moveq #42,d0
    69bc:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    69c0:	222f 0086      	move.l 134(sp),d1
    69c4:	2001           	move.l d1,d0
    69c6:	e988           	lsl.l #4,d0
    69c8:	d081           	add.l d1,d0
    69ca:	d080           	add.l d0,d0
    69cc:	2040           	movea.l d0,a0
    69ce:	d1c1           	adda.l d1,a0
    69d0:	41e8 000c      	lea 12(a0),a0
    69d4:	202f 0082      	move.l 130(sp),d0
    69d8:	d080           	add.l d0,d0
    69da:	2208           	move.l a0,d1
    69dc:	d280           	add.l d0,d1
    69de:	7000           	moveq #0,d0
    69e0:	302f 01c6      	move.w 454(sp),d0
    69e4:	2f01           	move.l d1,-(sp)
    69e6:	2f00           	move.l d0,-(sp)
    69e8:	2f2f 01d0      	move.l 464(sp),-(sp)
    69ec:	2f2f 0056      	move.l 86(sp),-(sp)
    69f0:	4eba 0330      	jsr 6d22 <TestRow>(pc)
    69f4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    69f8:	722a           	moveq #42,d1
    69fa:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    69fe:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<17;i2++) {
    6a02:	52af 0082      	addq.l #1,130(sp)
    6a06:	7010           	moveq #16,d0
    6a08:	b0af 0082      	cmp.l 130(sp),d0
    6a0c:	6c00 ff74      	bge.w 6982 <TestZoom4Picture+0x2ac2>
  for(int i=0;i<7;i++) {
    6a10:	52af 0086      	addq.l #1,134(sp)
    6a14:	7206           	moveq #6,d1
    6a16:	b2af 0086      	cmp.l 134(sp),d1
    6a1a:	6c00 ff26      	bge.w 6942 <TestZoom4Picture+0x2a82>
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    6a1e:	7000           	moveq #0,d0
    6a20:	302f 01c6      	move.w 454(sp),d0
    6a24:	4878 00ff      	pea ff <FreeDisplay+0x1f>
    6a28:	2f00           	move.l d0,-(sp)
    6a2a:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a2e:	2f2f 0056      	move.l 86(sp),-(sp)
    6a32:	4eba 02ee      	jsr 6d22 <TestRow>(pc)
    6a36:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6a3a:	702a           	moveq #42,d0
    6a3c:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6a40:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<7;i2++) {
    6a44:	42af 007e      	clr.l 126(sp)
    6a48:	6064           	bra.s 6aae <TestZoom4Picture+0x2bee>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6a4a:	202f 007e      	move.l 126(sp),d0
    6a4e:	0680 0000 0080 	addi.l #128,d0
    6a54:	d080           	add.l d0,d0
    6a56:	2200           	move.l d0,d1
    6a58:	7000           	moveq #0,d0
    6a5a:	302f 01c6      	move.w 454(sp),d0
    6a5e:	2f01           	move.l d1,-(sp)
    6a60:	2f00           	move.l d0,-(sp)
    6a62:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a66:	2f2f 0056      	move.l 86(sp),-(sp)
    6a6a:	4eba 02b6      	jsr 6d22 <TestRow>(pc)
    6a6e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a72:	722a           	moveq #42,d1
    6a74:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6a78:	202f 007e      	move.l 126(sp),d0
    6a7c:	d080           	add.l d0,d0
    6a7e:	2200           	move.l d0,d1
    6a80:	0681 0000 0101 	addi.l #257,d1
    6a86:	7000           	moveq #0,d0
    6a88:	302f 01c6      	move.w 454(sp),d0
    6a8c:	2f01           	move.l d1,-(sp)
    6a8e:	2f00           	move.l d0,-(sp)
    6a90:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a94:	2f2f 0056      	move.l 86(sp),-(sp)
    6a98:	4eba 0288      	jsr 6d22 <TestRow>(pc)
    6a9c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6aa0:	702a           	moveq #42,d0
    6aa2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6aa6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {
    6aaa:	52af 007e      	addq.l #1,126(sp)
    6aae:	7206           	moveq #6,d1
    6ab0:	b2af 007e      	cmp.l 126(sp),d1
    6ab4:	6c94           	bge.s 6a4a <TestZoom4Picture+0x2b8a>
  }   

  tmp = source;
    6ab6:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6abc:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6ac2:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    6ac8:	4878 0001      	pea 1 <_start+0x1>
    6acc:	4878 0011      	pea 11 <_start+0x11>
    6ad0:	2f2f 0056      	move.l 86(sp),-(sp)
    6ad4:	2f2f 006a      	move.l 106(sp),-(sp)
    6ad8:	4eba b196      	jsr 1c70 <Zoom_ZoomIntoPicture>(pc)
    6adc:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6ae0:	2039 001a db9c 	move.l 1adb9c <GfxBase>,d0
    6ae6:	2c40           	movea.l d0,a6
    6ae8:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6aec:	202f 004e      	move.l 78(sp),d0
    6af0:	5880           	addq.l #4,d0
    6af2:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom18;
    6af6:	2f7c 0000 bfd8 	move.l #49112,74(sp)
    6afc:	004a 

  mask = 0xffff;
    6afe:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);
    6b04:	7000           	moveq #0,d0
    6b06:	302f 01c6      	move.w 454(sp),d0
    6b0a:	42a7           	clr.l -(sp)
    6b0c:	2f00           	move.l d0,-(sp)
    6b0e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b12:	2f2f 0056      	move.l 86(sp),-(sp)
    6b16:	4eba 020a      	jsr 6d22 <TestRow>(pc)
    6b1a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6b1e:	722a           	moveq #42,d1
    6b20:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    6b24:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<4;i2++) {
    6b28:	42af 007a      	clr.l 122(sp)
    6b2c:	605c           	bra.s 6b8a <TestZoom4Picture+0x2cca>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    6b2e:	202f 007a      	move.l 122(sp),d0
    6b32:	d080           	add.l d0,d0
    6b34:	2200           	move.l d0,d1
    6b36:	5281           	addq.l #1,d1
    6b38:	7000           	moveq #0,d0
    6b3a:	302f 01c6      	move.w 454(sp),d0
    6b3e:	2f01           	move.l d1,-(sp)
    6b40:	2f00           	move.l d0,-(sp)
    6b42:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b46:	2f2f 0056      	move.l 86(sp),-(sp)
    6b4a:	4eba 01d6      	jsr 6d22 <TestRow>(pc)
    6b4e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6b52:	702a           	moveq #42,d0
    6b54:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    6b58:	202f 007a      	move.l 122(sp),d0
    6b5c:	5280           	addq.l #1,d0
    6b5e:	d080           	add.l d0,d0
    6b60:	2200           	move.l d0,d1
    6b62:	7000           	moveq #0,d0
    6b64:	302f 01c6      	move.w 454(sp),d0
    6b68:	2f01           	move.l d1,-(sp)
    6b6a:	2f00           	move.l d0,-(sp)
    6b6c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b70:	2f2f 0056      	move.l 86(sp),-(sp)
    6b74:	4eba 01ac      	jsr 6d22 <TestRow>(pc)
    6b78:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6b7c:	722a           	moveq #42,d1
    6b7e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6b82:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6b86:	52af 007a      	addq.l #1,122(sp)
    6b8a:	7003           	moveq #3,d0
    6b8c:	b0af 007a      	cmp.l 122(sp),d0
    6b90:	6c9c           	bge.s 6b2e <TestZoom4Picture+0x2c6e>
  }

  for(int i=0;i<7;i++) {  
    6b92:	42af 0076      	clr.l 118(sp)
    6b96:	6000 009c      	bra.w 6c34 <TestZoom4Picture+0x2d74>
    for(int i2=0;i2<18;i2++) {
    6b9a:	42af 0072      	clr.l 114(sp)
    6b9e:	6000 0086      	bra.w 6c26 <TestZoom4Picture+0x2d66>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6ba2:	222f 0076      	move.l 118(sp),d1
    6ba6:	2001           	move.l d1,d0
    6ba8:	e988           	lsl.l #4,d0
    6baa:	d081           	add.l d1,d0
    6bac:	d080           	add.l d0,d0
    6bae:	2040           	movea.l d0,a0
    6bb0:	d1c1           	adda.l d1,a0
    6bb2:	41e8 000b      	lea 11(a0),a0
    6bb6:	202f 0072      	move.l 114(sp),d0
    6bba:	d080           	add.l d0,d0
    6bbc:	2208           	move.l a0,d1
    6bbe:	d280           	add.l d0,d1
    6bc0:	7000           	moveq #0,d0
    6bc2:	302f 01c6      	move.w 454(sp),d0
    6bc6:	2f01           	move.l d1,-(sp)
    6bc8:	2f00           	move.l d0,-(sp)
    6bca:	2f2f 01d0      	move.l 464(sp),-(sp)
    6bce:	2f2f 0056      	move.l 86(sp),-(sp)
    6bd2:	4eba 014e      	jsr 6d22 <TestRow>(pc)
    6bd6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6bda:	722a           	moveq #42,d1
    6bdc:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6be0:	222f 0076      	move.l 118(sp),d1
    6be4:	2001           	move.l d1,d0
    6be6:	e988           	lsl.l #4,d0
    6be8:	d081           	add.l d1,d0
    6bea:	d080           	add.l d0,d0
    6bec:	2040           	movea.l d0,a0
    6bee:	d1c1           	adda.l d1,a0
    6bf0:	41e8 000c      	lea 12(a0),a0
    6bf4:	202f 0072      	move.l 114(sp),d0
    6bf8:	d080           	add.l d0,d0
    6bfa:	2208           	move.l a0,d1
    6bfc:	d280           	add.l d0,d1
    6bfe:	7000           	moveq #0,d0
    6c00:	302f 01c6      	move.w 454(sp),d0
    6c04:	2f01           	move.l d1,-(sp)
    6c06:	2f00           	move.l d0,-(sp)
    6c08:	2f2f 01d0      	move.l 464(sp),-(sp)
    6c0c:	2f2f 0056      	move.l 86(sp),-(sp)
    6c10:	4eba 0110      	jsr 6d22 <TestRow>(pc)
    6c14:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6c18:	702a           	moveq #42,d0
    6c1a:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6c1e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) {
    6c22:	52af 0072      	addq.l #1,114(sp)
    6c26:	7211           	moveq #17,d1
    6c28:	b2af 0072      	cmp.l 114(sp),d1
    6c2c:	6c00 ff74      	bge.w 6ba2 <TestZoom4Picture+0x2ce2>
  for(int i=0;i<7;i++) {  
    6c30:	52af 0076      	addq.l #1,118(sp)
    6c34:	7006           	moveq #6,d0
    6c36:	b0af 0076      	cmp.l 118(sp),d0
    6c3a:	6c00 ff5e      	bge.w 6b9a <TestZoom4Picture+0x2cda>
    }
  } 

  for(int i2=0;i2<4;i2++) {
    6c3e:	42af 006e      	clr.l 110(sp)
    6c42:	6064           	bra.s 6ca8 <TestZoom4Picture+0x2de8>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6c44:	202f 006e      	move.l 110(sp),d0
    6c48:	0680 0000 0080 	addi.l #128,d0
    6c4e:	d080           	add.l d0,d0
    6c50:	2200           	move.l d0,d1
    6c52:	7000           	moveq #0,d0
    6c54:	302f 01c6      	move.w 454(sp),d0
    6c58:	2f01           	move.l d1,-(sp)
    6c5a:	2f00           	move.l d0,-(sp)
    6c5c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6c60:	2f2f 0056      	move.l 86(sp),-(sp)
    6c64:	4eba 00bc      	jsr 6d22 <TestRow>(pc)
    6c68:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6c6c:	722a           	moveq #42,d1
    6c6e:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6c72:	202f 006e      	move.l 110(sp),d0
    6c76:	d080           	add.l d0,d0
    6c78:	2200           	move.l d0,d1
    6c7a:	0681 0000 0101 	addi.l #257,d1
    6c80:	7000           	moveq #0,d0
    6c82:	302f 01c6      	move.w 454(sp),d0
    6c86:	2f01           	move.l d1,-(sp)
    6c88:	2f00           	move.l d0,-(sp)
    6c8a:	2f2f 01d0      	move.l 464(sp),-(sp)
    6c8e:	2f2f 0056      	move.l 86(sp),-(sp)
    6c92:	4eba 008e      	jsr 6d22 <TestRow>(pc)
    6c96:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6c9a:	702a           	moveq #42,d0
    6c9c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6ca0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6ca4:	52af 006e      	addq.l #1,110(sp)
    6ca8:	7203           	moveq #3,d1
    6caa:	b2af 006e      	cmp.l 110(sp),d1
    6cae:	6c94           	bge.s 6c44 <TestZoom4Picture+0x2d84>
  }
  TestRow( valsupposed, valactual, mask, 0);
    6cb0:	7000           	moveq #0,d0
    6cb2:	302f 01c6      	move.w 454(sp),d0
    6cb6:	42a7           	clr.l -(sp)
    6cb8:	2f00           	move.l d0,-(sp)
    6cba:	2f2f 01d0      	move.l 464(sp),-(sp)
    6cbe:	2f2f 0056      	move.l 86(sp),-(sp)
    6cc2:	4eba 005e      	jsr 6d22 <TestRow>(pc)
    6cc6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6cca:	702a           	moveq #42,d0
    6ccc:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6cd0:	466f 01c6      	not.w 454(sp)
  FreeMem( source, (ZMLINESIZE+4)*272);
    6cd4:	2f6f 005e 0042 	move.l 94(sp),66(sp)
    6cda:	2f7c 0000 30e0 	move.l #12512,62(sp)
    6ce0:	003e 
    6ce2:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    6ce8:	2c40           	movea.l d0,a6
    6cea:	226f 0042      	movea.l 66(sp),a1
    6cee:	202f 003e      	move.l 62(sp),d0
    6cf2:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    6cf6:	2f6f 004e 003a 	move.l 78(sp),58(sp)
    6cfc:	2f7c 0000 30e0 	move.l #12512,54(sp)
    6d02:	0036 
    6d04:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    6d0a:	2c40           	movea.l d0,a6
    6d0c:	226f 003a      	movea.l 58(sp),a1
    6d10:	202f 0036      	move.l 54(sp),d0
    6d14:	4eae ff2e      	jsr -210(a6)
}
    6d18:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    6d1c:	4fef 01d0      	lea 464(sp),sp
    6d20:	4e75           	rts

00006d22 <TestRow>:

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    6d22:	4fef ff40      	lea -192(sp),sp
    6d26:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
    6d2a:	202f 00e0      	move.l 224(sp),d0
    6d2e:	3000           	move.w d0,d0
    6d30:	3f40 0016      	move.w d0,22(sp)
  
  char str[ 100] = { 0 };
    6d34:	42af 001c      	clr.l 28(sp)
    6d38:	7020           	moveq #32,d0
    6d3a:	d08f           	add.l sp,d0
    6d3c:	7260           	moveq #96,d1
    6d3e:	2f01           	move.l d1,-(sp)
    6d40:	42a7           	clr.l -(sp)
    6d42:	2f00           	move.l d0,-(sp)
    6d44:	4eba 020c      	jsr 6f52 <memset>(pc)
    6d48:	4fef 000c      	lea 12(sp),sp
  UWORD data[2];
  data[1] = numberofline;
    6d4c:	202f 00e4      	move.l 228(sp),d0
    6d50:	3f40 001a      	move.w d0,26(sp)

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    6d54:	42af 00d0      	clr.l 208(sp)
    6d58:	6000 00d4      	bra.w 6e2e <TestRow+0x10c>
    if( (*testpattern++ ^ xormask) != *destination++) {
    6d5c:	202f 00d8      	move.l 216(sp),d0
    6d60:	2200           	move.l d0,d1
    6d62:	5481           	addq.l #2,d1
    6d64:	2f41 00d8      	move.l d1,216(sp)
    6d68:	2040           	movea.l d0,a0
    6d6a:	3010           	move.w (a0),d0
    6d6c:	322f 0016      	move.w 22(sp),d1
    6d70:	b141           	eor.w d0,d1
    6d72:	202f 00dc      	move.l 220(sp),d0
    6d76:	2400           	move.l d0,d2
    6d78:	5482           	addq.l #2,d2
    6d7a:	2f42 00dc      	move.l d2,220(sp)
    6d7e:	2040           	movea.l d0,a0
    6d80:	3010           	move.w (a0),d0
    6d82:	b041           	cmp.w d1,d0
    6d84:	6700 00a4      	beq.w 6e2a <TestRow+0x108>
      data[0] = i;
    6d88:	202f 00d0      	move.l 208(sp),d0
    6d8c:	3f40 0018      	move.w d0,24(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    6d90:	2f7c 0000 86cc 	move.l #34508,164(sp)
    6d96:	00a4 
    6d98:	702b           	moveq #43,d0
    6d9a:	4600           	not.b d0
    6d9c:	d08f           	add.l sp,d0
    6d9e:	0680 ffff ff44 	addi.l #-188,d0
    6da4:	2f40 00a0      	move.l d0,160(sp)
    6da8:	2f7c 0000 73f0 	move.l #29680,156(sp)
    6dae:	009c 
    6db0:	722b           	moveq #43,d1
    6db2:	4601           	not.b d1
    6db4:	d28f           	add.l sp,d1
    6db6:	0681 ffff ff48 	addi.l #-184,d1
    6dbc:	2f41 0098      	move.l d1,152(sp)
    6dc0:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    6dc6:	2c40           	movea.l d0,a6
    6dc8:	206f 00a4      	movea.l 164(sp),a0
    6dcc:	226f 00a0      	movea.l 160(sp),a1
    6dd0:	246f 009c      	movea.l 156(sp),a2
    6dd4:	266f 0098      	movea.l 152(sp),a3
    6dd8:	4eae fdf6      	jsr -522(a6)
    6ddc:	2f40 0094      	move.l d0,148(sp)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    6de0:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    6de6:	2c40           	movea.l d0,a6
    6de8:	4eae ffc4      	jsr -60(a6)
    6dec:	2f40 0090      	move.l d0,144(sp)
    6df0:	202f 0090      	move.l 144(sp),d0
    6df4:	2f40 008c      	move.l d0,140(sp)
    6df8:	742b           	moveq #43,d2
    6dfa:	4602           	not.b d2
    6dfc:	d48f           	add.l sp,d2
    6dfe:	0682 ffff ff48 	addi.l #-184,d2
    6e04:	2f42 0088      	move.l d2,136(sp)
    6e08:	7064           	moveq #100,d0
    6e0a:	2f40 0084      	move.l d0,132(sp)
    6e0e:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    6e14:	2c40           	movea.l d0,a6
    6e16:	222f 008c      	move.l 140(sp),d1
    6e1a:	242f 0088      	move.l 136(sp),d2
    6e1e:	262f 0084      	move.l 132(sp),d3
    6e22:	4eae ffd0      	jsr -48(a6)
    6e26:	2f40 0080      	move.l d0,128(sp)
  for(int i=0;i<21;i++) {
    6e2a:	52af 00d0      	addq.l #1,208(sp)
    6e2e:	7214           	moveq #20,d1
    6e30:	b2af 00d0      	cmp.l 208(sp),d1
    6e34:	6c00 ff26      	bge.w 6d5c <TestRow+0x3a>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    6e38:	206f 00d8      	movea.l 216(sp),a0
    6e3c:	3010           	move.w (a0),d0
    6e3e:	322f 0016      	move.w 22(sp),d1
    6e42:	b141           	eor.w d0,d1
    6e44:	206f 00dc      	movea.l 220(sp),a0
    6e48:	3010           	move.w (a0),d0
    6e4a:	b340           	eor.w d1,d0
    6e4c:	3000           	move.w d0,d0
    6e4e:	0280 0000 ffff 	andi.l #65535,d0
    6e54:	0280 0000 ff00 	andi.l #65280,d0
    6e5a:	6700 00cc      	beq.w 6f28 <TestRow+0x206>
    data[0] = 21;
    6e5e:	3f7c 0015 0018 	move.w #21,24(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    6e64:	2f7c 0000 86cc 	move.l #34508,204(sp)
    6e6a:	00cc 
    6e6c:	742b           	moveq #43,d2
    6e6e:	4602           	not.b d2
    6e70:	d48f           	add.l sp,d2
    6e72:	0682 ffff ff44 	addi.l #-188,d2
    6e78:	2f42 00c8      	move.l d2,200(sp)
    6e7c:	2f7c 0000 73f0 	move.l #29680,196(sp)
    6e82:	00c4 
    6e84:	702b           	moveq #43,d0
    6e86:	4600           	not.b d0
    6e88:	d08f           	add.l sp,d0
    6e8a:	0680 ffff ff48 	addi.l #-184,d0
    6e90:	2f40 00c0      	move.l d0,192(sp)
    6e94:	2039 001a db90 	move.l 1adb90 <SysBase>,d0
    6e9a:	2c40           	movea.l d0,a6
    6e9c:	206f 00cc      	movea.l 204(sp),a0
    6ea0:	226f 00c8      	movea.l 200(sp),a1
    6ea4:	246f 00c4      	movea.l 196(sp),a2
    6ea8:	266f 00c0      	movea.l 192(sp),a3
    6eac:	4eae fdf6      	jsr -522(a6)
    6eb0:	2f40 00bc      	move.l d0,188(sp)
                                                                           str);
    Write(  Output(), str, 100);
    6eb4:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    6eba:	2c40           	movea.l d0,a6
    6ebc:	4eae ffc4      	jsr -60(a6)
    6ec0:	2f40 00b8      	move.l d0,184(sp)
    6ec4:	202f 00b8      	move.l 184(sp),d0
    6ec8:	2f40 00b4      	move.l d0,180(sp)
    6ecc:	722b           	moveq #43,d1
    6ece:	4601           	not.b d1
    6ed0:	d28f           	add.l sp,d1
    6ed2:	0681 ffff ff48 	addi.l #-184,d1
    6ed8:	2f41 00b0      	move.l d1,176(sp)
    6edc:	7464           	moveq #100,d2
    6ede:	2f42 00ac      	move.l d2,172(sp)
    6ee2:	2039 001a db98 	move.l 1adb98 <DOSBase>,d0
    6ee8:	2c40           	movea.l d0,a6
    6eea:	222f 00b4      	move.l 180(sp),d1
    6eee:	242f 00b0      	move.l 176(sp),d2
    6ef2:	262f 00ac      	move.l 172(sp),d3
    6ef6:	4eae ffd0      	jsr -48(a6)
    6efa:	2f40 00a8      	move.l d0,168(sp)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
    6efe:	206f 00dc      	movea.l 220(sp),a0
    6f02:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6f04:	7200           	moveq #0,d1
    6f06:	3200           	move.w d0,d1
                                                   *testpattern,*destination);
    6f08:	206f 00d8      	movea.l 216(sp),a0
    6f0c:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6f0e:	3000           	move.w d0,d0
    6f10:	0280 0000 ffff 	andi.l #65535,d0
    6f16:	2f01           	move.l d1,-(sp)
    6f18:	2f00           	move.l d0,-(sp)
    6f1a:	4879 0000 86fc 	pea 86fc <incbin_swfont_end+0x87c>
    6f20:	4eba 0162      	jsr 7084 <KPrintF>(pc)
    6f24:	4fef 000c      	lea 12(sp),sp
     
  }
}
    6f28:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    6f2c:	4fef 00c0      	lea 192(sp),sp
    6f30:	4e75           	rts

00006f32 <strlen>:
{
    6f32:	598f           	subq.l #4,sp
	unsigned long t=0;
    6f34:	4297           	clr.l (sp)
    6f36:	6002           	bra.s 6f3a <strlen+0x8>
		t++;
    6f38:	5297           	addq.l #1,(sp)
	while(*s++)
    6f3a:	202f 0008      	move.l 8(sp),d0
    6f3e:	2200           	move.l d0,d1
    6f40:	5281           	addq.l #1,d1
    6f42:	2f41 0008      	move.l d1,8(sp)
    6f46:	2040           	movea.l d0,a0
    6f48:	1010           	move.b (a0),d0
    6f4a:	66ec           	bne.s 6f38 <strlen+0x6>
	return t;
    6f4c:	2017           	move.l (sp),d0
}
    6f4e:	588f           	addq.l #4,sp
    6f50:	4e75           	rts

00006f52 <memset>:
{
    6f52:	4e55 fffc      	link.w a5,#-4
	unsigned char *ptr = (unsigned char *)dest;
    6f56:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
    6f5c:	6014           	bra.s 6f72 <memset+0x20>
		*ptr++ = val;
    6f5e:	202d fffc      	move.l -4(a5),d0
    6f62:	2200           	move.l d0,d1
    6f64:	5281           	addq.l #1,d1
    6f66:	2b41 fffc      	move.l d1,-4(a5)
    6f6a:	222d 000c      	move.l 12(a5),d1
    6f6e:	2040           	movea.l d0,a0
    6f70:	1081           	move.b d1,(a0)
	while(len-- > 0)
    6f72:	202d 0010      	move.l 16(a5),d0
    6f76:	2200           	move.l d0,d1
    6f78:	5381           	subq.l #1,d1
    6f7a:	2b41 0010      	move.l d1,16(a5)
    6f7e:	4a80           	tst.l d0
    6f80:	66dc           	bne.s 6f5e <memset+0xc>
	return dest;
    6f82:	202d 0008      	move.l 8(a5),d0
}
    6f86:	4e5d           	unlk a5
    6f88:	4e75           	rts

00006f8a <memcpy>:
{
    6f8a:	4e55 fff8      	link.w a5,#-8
    6f8e:	2f02           	move.l d2,-(sp)
	char *d = (char *)dest;
    6f90:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = (const char *)src;
    6f96:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
    6f9c:	6020           	bra.s 6fbe <memcpy+0x34>
		*d++ = *s++;
    6f9e:	222d fff8      	move.l -8(a5),d1
    6fa2:	2001           	move.l d1,d0
    6fa4:	5280           	addq.l #1,d0
    6fa6:	2b40 fff8      	move.l d0,-8(a5)
    6faa:	202d fffc      	move.l -4(a5),d0
    6fae:	2400           	move.l d0,d2
    6fb0:	5282           	addq.l #1,d2
    6fb2:	2b42 fffc      	move.l d2,-4(a5)
    6fb6:	2041           	movea.l d1,a0
    6fb8:	1210           	move.b (a0),d1
    6fba:	2040           	movea.l d0,a0
    6fbc:	1081           	move.b d1,(a0)
	while(len--)
    6fbe:	202d 0010      	move.l 16(a5),d0
    6fc2:	2200           	move.l d0,d1
    6fc4:	5381           	subq.l #1,d1
    6fc6:	2b41 0010      	move.l d1,16(a5)
    6fca:	4a80           	tst.l d0
    6fcc:	66d0           	bne.s 6f9e <memcpy+0x14>
	return dest;
    6fce:	202d 0008      	move.l 8(a5),d0
}
    6fd2:	241f           	move.l (sp)+,d2
    6fd4:	4e5d           	unlk a5
    6fd6:	4e75           	rts

00006fd8 <memmove>:
{
    6fd8:	4e55 fff0      	link.w a5,#-16
    6fdc:	2f02           	move.l d2,-(sp)
	char *d = dest;
    6fde:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = src;
    6fe4:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
	if (d < s) {
    6fea:	202d fffc      	move.l -4(a5),d0
    6fee:	b0ad fff8      	cmp.l -8(a5),d0
    6ff2:	6522           	bcs.s 7016 <memmove+0x3e>
    6ff4:	6032           	bra.s 7028 <memmove+0x50>
			*d++ = *s++;
    6ff6:	222d fff8      	move.l -8(a5),d1
    6ffa:	2401           	move.l d1,d2
    6ffc:	5282           	addq.l #1,d2
    6ffe:	2b42 fff8      	move.l d2,-8(a5)
    7002:	202d fffc      	move.l -4(a5),d0
    7006:	2400           	move.l d0,d2
    7008:	5282           	addq.l #1,d2
    700a:	2b42 fffc      	move.l d2,-4(a5)
    700e:	2041           	movea.l d1,a0
    7010:	1210           	move.b (a0),d1
    7012:	2040           	movea.l d0,a0
    7014:	1081           	move.b d1,(a0)
		while (len--)
    7016:	202d 0010      	move.l 16(a5),d0
    701a:	2200           	move.l d0,d1
    701c:	5381           	subq.l #1,d1
    701e:	2b41 0010      	move.l d1,16(a5)
    7022:	4a80           	tst.l d0
    7024:	66d0           	bne.s 6ff6 <memmove+0x1e>
    7026:	6052           	bra.s 707a <memmove+0xa2>
		const char *lasts = s + (len - 1);
    7028:	202d 0010      	move.l 16(a5),d0
    702c:	5380           	subq.l #1,d0
    702e:	242d fff8      	move.l -8(a5),d2
    7032:	d480           	add.l d0,d2
    7034:	2b42 fff4      	move.l d2,-12(a5)
		char *lastd = d + (len - 1);
    7038:	202d 0010      	move.l 16(a5),d0
    703c:	5380           	subq.l #1,d0
    703e:	222d fffc      	move.l -4(a5),d1
    7042:	d280           	add.l d0,d1
    7044:	2b41 fff0      	move.l d1,-16(a5)
    7048:	6020           	bra.s 706a <memmove+0x92>
			*lastd-- = *lasts--;
    704a:	222d fff4      	move.l -12(a5),d1
    704e:	2401           	move.l d1,d2
    7050:	5382           	subq.l #1,d2
    7052:	2b42 fff4      	move.l d2,-12(a5)
    7056:	202d fff0      	move.l -16(a5),d0
    705a:	2400           	move.l d0,d2
    705c:	5382           	subq.l #1,d2
    705e:	2b42 fff0      	move.l d2,-16(a5)
    7062:	2041           	movea.l d1,a0
    7064:	1210           	move.b (a0),d1
    7066:	2040           	movea.l d0,a0
    7068:	1081           	move.b d1,(a0)
		while (len--)
    706a:	202d 0010      	move.l 16(a5),d0
    706e:	2200           	move.l d0,d1
    7070:	5381           	subq.l #1,d1
    7072:	2b41 0010      	move.l d1,16(a5)
    7076:	4a80           	tst.l d0
    7078:	66d0           	bne.s 704a <memmove+0x72>
	return dest;
    707a:	202d 0008      	move.l 8(a5),d0
}
    707e:	241f           	move.l (sp)+,d2
    7080:	4e5d           	unlk a5
    7082:	4e75           	rts

00007084 <KPrintF>:
{
    7084:	4fef ff80      	lea -128(sp),sp
    7088:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    708c:	3039 00f0 ff60 	move.w f0ff60 <_end+0xd6237c>,d0
    7092:	0c40 4eb9      	cmpi.w #20153,d0
    7096:	6722           	beq.s 70ba <KPrintF+0x36>
    7098:	0c40 a00e      	cmpi.w #-24562,d0
    709c:	671c           	beq.s 70ba <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    709e:	2c79 001a db90 	movea.l 1adb90 <SysBase>,a6
    70a4:	206f 0090      	movea.l 144(sp),a0
    70a8:	43ef 0094      	lea 148(sp),a1
    70ac:	45f9 0000 73e2 	lea 73e2 <KPutCharX>,a2
    70b2:	97cb           	suba.l a3,a3
    70b4:	4eae fdf6      	jsr -522(a6)
    70b8:	602a           	bra.s 70e4 <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    70ba:	2c79 001a db90 	movea.l 1adb90 <SysBase>,a6
    70c0:	206f 0090      	movea.l 144(sp),a0
    70c4:	43ef 0094      	lea 148(sp),a1
    70c8:	45f9 0000 73f0 	lea 73f0 <PutChar>,a2
    70ce:	47ef 000c      	lea 12(sp),a3
    70d2:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    70d6:	2f0b           	move.l a3,-(sp)
    70d8:	4878 0056      	pea 56 <_start+0x56>
    70dc:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xd6237c>
    70e2:	508f           	addq.l #8,sp
}
    70e4:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    70e8:	4fef 0080      	lea 128(sp),sp
    70ec:	4e75           	rts

000070ee <warpmode>:

void warpmode(int on) // bool
{
    70ee:	518f           	subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
    70f0:	2f7c 00f0 ff60 	move.l #15794016,4(sp)
    70f6:	0004 
    if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
    70f8:	206f 0004      	movea.l 4(sp),a0
    70fc:	3010           	move.w (a0),d0
    70fe:	0c40 4eb9      	cmpi.w #20153,d0
    7102:	670c           	beq.s 7110 <warpmode+0x22>
    7104:	206f 0004      	movea.l 4(sp),a0
    7108:	3010           	move.w (a0),d0
    710a:	0c40 a00e      	cmpi.w #-24562,d0
    710e:	6668           	bne.s 7178 <warpmode+0x8a>
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    7110:	4aaf 000c      	tst.l 12(sp)
    7114:	6708           	beq.s 711e <warpmode+0x30>
    7116:	203c 0000 8722 	move.l #34594,d0
    711c:	6006           	bra.s 7124 <warpmode+0x36>
    711e:	203c 0000 872c 	move.l #34604,d0
    7124:	4878 0001      	pea 1 <_start+0x1>
    7128:	220f           	move.l sp,d1
    712a:	5e81           	addq.l #7,d1
    712c:	2f01           	move.l d1,-(sp)
    712e:	42a7           	clr.l -(sp)
    7130:	2f00           	move.l d0,-(sp)
    7132:	4878 ffff      	pea ffffffff <_end+0xffe5241b>
    7136:	4878 0052      	pea 52 <_start+0x52>
    713a:	206f 001c      	movea.l 28(sp),a0
    713e:	4e90           	jsr (a0)
    7140:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    7144:	4aaf 000c      	tst.l 12(sp)
    7148:	6708           	beq.s 7152 <warpmode+0x64>
    714a:	203c 0000 8737 	move.l #34615,d0
    7150:	6006           	bra.s 7158 <warpmode+0x6a>
    7152:	203c 0000 8751 	move.l #34641,d0
    7158:	4878 0001      	pea 1 <_start+0x1>
    715c:	220f           	move.l sp,d1
    715e:	5e81           	addq.l #7,d1
    7160:	2f01           	move.l d1,-(sp)
    7162:	42a7           	clr.l -(sp)
    7164:	2f00           	move.l d0,-(sp)
    7166:	4878 ffff      	pea ffffffff <_end+0xffe5241b>
    716a:	4878 0052      	pea 52 <_start+0x52>
    716e:	206f 001c      	movea.l 28(sp),a0
    7172:	4e90           	jsr (a0)
    7174:	4fef 0018      	lea 24(sp),sp
	}
}
    7178:	508f           	addq.l #8,sp
    717a:	4e75           	rts

0000717c <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4)
{
    717c:	598f           	subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
    717e:	2ebc 00f0 ff60 	move.l #15794016,(sp)
    if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    7184:	2057           	movea.l (sp),a0
    7186:	3010           	move.w (a0),d0
    7188:	0c40 4eb9      	cmpi.w #20153,d0
    718c:	670a           	beq.s 7198 <debug_cmd+0x1c>
    718e:	2057           	movea.l (sp),a0
    7190:	3010           	move.w (a0),d0
    7192:	0c40 a00e      	cmpi.w #-24562,d0
    7196:	661e           	bne.s 71b6 <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
    7198:	2f2f 0014      	move.l 20(sp),-(sp)
    719c:	2f2f 0014      	move.l 20(sp),-(sp)
    71a0:	2f2f 0014      	move.l 20(sp),-(sp)
    71a4:	2f2f 0014      	move.l 20(sp),-(sp)
    71a8:	4878 0058      	pea 58 <_start+0x58>
    71ac:	206f 0014      	movea.l 20(sp),a0
    71b0:	4e90           	jsr (a0)
    71b2:	4fef 0014      	lea 20(sp),sp
	}
}
    71b6:	588f           	addq.l #4,sp
    71b8:	4e75           	rts

000071ba <debug_clear>:
	barto_cmd_text,
};

void debug_clear()
{
	debug_cmd(barto_cmd_clear, 0, 0, 0);
    71ba:	42a7           	clr.l -(sp)
    71bc:	42a7           	clr.l -(sp)
    71be:	42a7           	clr.l -(sp)
    71c0:	42a7           	clr.l -(sp)
    71c2:	4eba ffb8      	jsr 717c <debug_cmd>(pc)
    71c6:	4fef 0010      	lea 16(sp),sp
}
    71ca:	4e75           	rts

000071cc <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color)
{
    71cc:	518f           	subq.l #8,sp
    71ce:	2f02           	move.l d2,-(sp)
    71d0:	226f 0010      	movea.l 16(sp),a1
    71d4:	206f 0014      	movea.l 20(sp),a0
    71d8:	222f 0018      	move.l 24(sp),d1
    71dc:	202f 001c      	move.l 28(sp),d0
    71e0:	3249           	movea.w a1,a1
    71e2:	3f49 000a      	move.w a1,10(sp)
    71e6:	3048           	movea.w a0,a0
    71e8:	3f48 0008      	move.w a0,8(sp)
    71ec:	3201           	move.w d1,d1
    71ee:	3f41 0006      	move.w d1,6(sp)
    71f2:	3000           	move.w d0,d0
    71f4:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    71f8:	302f 0006      	move.w 6(sp),d0
    71fc:	48c0           	ext.l d0
    71fe:	4840           	swap d0
    7200:	4240           	clr.w d0
    7202:	322f 0004      	move.w 4(sp),d1
    7206:	48c1           	ext.l d1
    7208:	8280           	or.l d0,d1
    720a:	302f 000a      	move.w 10(sp),d0
    720e:	48c0           	ext.l d0
    7210:	4840           	swap d0
    7212:	4240           	clr.w d0
    7214:	306f 0008      	movea.w 8(sp),a0
    7218:	2408           	move.l a0,d2
    721a:	8082           	or.l d2,d0
    721c:	2f2f 0020      	move.l 32(sp),-(sp)
    7220:	2f01           	move.l d1,-(sp)
    7222:	2f00           	move.l d0,-(sp)
    7224:	4878 0001      	pea 1 <_start+0x1>
    7228:	4eba ff52      	jsr 717c <debug_cmd>(pc)
    722c:	4fef 0010      	lea 16(sp),sp
}
    7230:	241f           	move.l (sp)+,d2
    7232:	508f           	addq.l #8,sp
    7234:	4e75           	rts

00007236 <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color)
{
    7236:	518f           	subq.l #8,sp
    7238:	2f02           	move.l d2,-(sp)
    723a:	226f 0010      	movea.l 16(sp),a1
    723e:	206f 0014      	movea.l 20(sp),a0
    7242:	222f 0018      	move.l 24(sp),d1
    7246:	202f 001c      	move.l 28(sp),d0
    724a:	3249           	movea.w a1,a1
    724c:	3f49 000a      	move.w a1,10(sp)
    7250:	3048           	movea.w a0,a0
    7252:	3f48 0008      	move.w a0,8(sp)
    7256:	3201           	move.w d1,d1
    7258:	3f41 0006      	move.w d1,6(sp)
    725c:	3000           	move.w d0,d0
    725e:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    7262:	302f 0006      	move.w 6(sp),d0
    7266:	48c0           	ext.l d0
    7268:	4840           	swap d0
    726a:	4240           	clr.w d0
    726c:	322f 0004      	move.w 4(sp),d1
    7270:	48c1           	ext.l d1
    7272:	8280           	or.l d0,d1
    7274:	302f 000a      	move.w 10(sp),d0
    7278:	48c0           	ext.l d0
    727a:	4840           	swap d0
    727c:	4240           	clr.w d0
    727e:	306f 0008      	movea.w 8(sp),a0
    7282:	2408           	move.l a0,d2
    7284:	8082           	or.l d2,d0
    7286:	2f2f 0020      	move.l 32(sp),-(sp)
    728a:	2f01           	move.l d1,-(sp)
    728c:	2f00           	move.l d0,-(sp)
    728e:	4878 0002      	pea 2 <_start+0x2>
    7292:	4eba fee8      	jsr 717c <debug_cmd>(pc)
    7296:	4fef 0010      	lea 16(sp),sp
}
    729a:	241f           	move.l (sp)+,d2
    729c:	508f           	addq.l #8,sp
    729e:	4e75           	rts

000072a0 <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color)
{
    72a0:	598f           	subq.l #4,sp
    72a2:	2f02           	move.l d2,-(sp)
    72a4:	222f 000c      	move.l 12(sp),d1
    72a8:	202f 0010      	move.l 16(sp),d0
    72ac:	3201           	move.w d1,d1
    72ae:	3f41 0006      	move.w d1,6(sp)
    72b2:	3000           	move.w d0,d0
    72b4:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
    72b8:	202f 0014      	move.l 20(sp),d0
    72bc:	322f 0006      	move.w 6(sp),d1
    72c0:	48c1           	ext.l d1
    72c2:	4841           	swap d1
    72c4:	4241           	clr.w d1
    72c6:	306f 0004      	movea.w 4(sp),a0
    72ca:	2408           	move.l a0,d2
    72cc:	8282           	or.l d2,d1
    72ce:	2f2f 0018      	move.l 24(sp),-(sp)
    72d2:	2f00           	move.l d0,-(sp)
    72d4:	2f01           	move.l d1,-(sp)
    72d6:	4878 0003      	pea 3 <_start+0x3>
    72da:	4eba fea0      	jsr 717c <debug_cmd>(pc)
    72de:	4fef 0010      	lea 16(sp),sp
}
    72e2:	241f           	move.l (sp)+,d2
    72e4:	588f           	addq.l #4,sp
    72e6:	4e75           	rts

000072e8 <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    72e8:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    72ec:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    72f0:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    72f4:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    72f8:	d041           	add.w d1,d0
	swap	d0
    72fa:	4840           	swap d0
	clrw	d0
    72fc:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    72fe:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    7302:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    7306:	d081           	add.l d1,d0
	rts
    7308:	4e75           	rts

0000730a <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    730a:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    730c:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    7310:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    7314:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    731a:	6416           	bcc.s 7332 <__udivsi3+0x28>
	movel	d0, d2
    731c:	2400           	move.l d0,d2
	clrw	d2
    731e:	4242           	clr.w d2
	swap	d2
    7320:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    7322:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    7324:	3002           	move.w d2,d0
	swap	d0
    7326:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    7328:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    732c:	84c1           	divu.w d1,d2
	movew	d2, d0
    732e:	3002           	move.w d2,d0
	jra	6f
    7330:	6030           	bra.s 7362 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    7332:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    7334:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    7336:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    7338:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    733e:	64f4           	bcc.s 7334 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    7340:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    7342:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    7348:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    734a:	c2c0           	mulu.w d0,d1
	swap	d2
    734c:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    734e:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    7350:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    7352:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    7354:	660a           	bne.s 7360 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    7356:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    7358:	6506           	bcs.s 7360 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    735a:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    735e:	6302           	bls.s 7362 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    7360:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    7362:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    7364:	4e75           	rts

00007366 <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    7366:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    7368:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    736a:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    736e:	6a04           	bpl.s 7374 <__divsi3+0xe>
	negl	d1
    7370:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    7372:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    7374:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    7378:	6a04           	bpl.s 737e <__divsi3+0x18>
	negl	d0
    737a:	4480           	neg.l d0
	negb	d2
    737c:	4402           	neg.b d2

2:	movel	d1, sp@-
    737e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    7380:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    7382:	6186           	bsr.s 730a <__udivsi3>
	addql	IMM (8), sp
    7384:	508f           	addq.l #8,sp

	tstb	d2
    7386:	4a02           	tst.b d2
	jpl	3f
    7388:	6a02           	bpl.s 738c <__divsi3+0x26>
	negl	d0
    738a:	4480           	neg.l d0

3:	movel	sp@+, d2
    738c:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    738e:	4e75           	rts

00007390 <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    7390:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7394:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    7398:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    739a:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    739c:	61c8           	bsr.s 7366 <__divsi3>
	addql	IMM (8), sp
    739e:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    73a0:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    73a4:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    73a6:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    73a8:	6100 ff3e      	bsr.w 72e8 <__mulsi3>
	addql	IMM (8), sp
    73ac:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    73ae:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    73b2:	9280           	sub.l d0,d1
	movel	d1, d0
    73b4:	2001           	move.l d1,d0
	rts
    73b6:	4e75           	rts

000073b8 <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    73b8:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    73bc:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    73c0:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    73c2:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    73c4:	6100 ff44      	bsr.w 730a <__udivsi3>
	addql	IMM (8), sp
    73c8:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    73ca:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    73ce:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    73d0:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    73d2:	6100 ff14      	bsr.w 72e8 <__mulsi3>
	addql	IMM (8), sp
    73d6:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    73d8:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    73dc:	9280           	sub.l d0,d1
	movel	d1, d0
    73de:	2001           	move.l d1,d0
	rts
    73e0:	4e75           	rts

000073e2 <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    73e2:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    73e4:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    73e8:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    73ec:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    73ee:	4e75           	rts

000073f0 <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    73f0:	16c0           	move.b d0,(a3)+
	rts
    73f2:	4e75           	rts

000073f4 <c2p1x1_8_c5_gen_init>:
	.text
	FUNC(c2p1x1_8_c5_gen_init)
	.globl	SYM (c2p1x1_8_c5_gen_init)

SYM(c2p1x1_8_c5_gen_init):
	movem.l d0-d7/a0-a6, .gi_saveregs	
    73f4:	48f9 7fff 0000 	movem.l d0-a6,7434 <.gi_saveregs>
    73fa:	7434 
	move.l  4(sp),d0
    73fc:	202f 0004      	move.l 4(sp),d0
	move.l	8(sp),d1
    7400:	222f 0008      	move.l 8(sp),d1
	move.l	12(sp),d2
    7404:	242f 000c      	move.l 12(sp),d2
	move.l	16(sp),d3
    7408:	262f 0010      	move.l 16(sp),d3
	move.l  20(sp),d4
    740c:	282f 0014      	move.l 20(sp),d4
	move.l	24(sp),d5
    7410:	2a2f 0018      	move.l 24(sp),d5
	andi.l	IMM (0xffff),d0
    7414:	0280 0000 ffff 	andi.l #65535,d0
	mulu.w	d0,d3
    741a:	c6c0           	mulu.w d0,d3
	lsr.l	#3,d3
    741c:	e68b           	lsr.l #3,d3
	move.l	d3,c2p1x1_8_c5_gen_scroffs
    741e:	23c3 0000 778a 	move.l d3,778a <c2p1x1_8_c5_gen_scroffs>
	mulu.w	d0,d1
    7424:	c2c0           	mulu.w d0,d1
	move.l	d1,c2p1x1_8_c5_gen_pixels
    7426:	23c1 0000 778e 	move.l d1,778e <c2p1x1_8_c5_gen_pixels>
	movem.l	.gi_saveregs,d0-d7/a0-a6
    742c:	4cfa 7fff 0004 	movem.l 7434 <.gi_saveregs>(pc),d0-a6
	rts
    7432:	4e75           	rts

00007434 <.gi_saveregs>:
	...

00007470 <c2p1x1_8_c5_gen>:
	.text
	FUNC(c2p1x1_8_c5_gen)
	.globl	SYM (c2p1x1_8_c5_gen)

SYM(c2p1x1_8_c5_gen):
	movem.l d0-d7/a0-a6,.c2p_saveregs	
    7470:	48f9 7fff 0000 	movem.l d0-a6,774e <.c2p_saveregs>
    7476:	774e 
	movem.l 4(sp),a0
    7478:	4cef 0100 0004 	movem.l 4(sp),a0
	movem.l 8(sp),a1
    747e:	4cef 0200 0008 	movem.l 8(sp),a1
    move.l	IMM (0x33333333),d5
    7484:	2a3c 3333 3333 	move.l #858993459,d5
	move.l	IMM (0x55555555),a6
    748a:	2c7c 5555 5555 	movea.l #1431655765,a6

	add.w	#BPLSIZE,a1
    7490:	d2fc 2bf8      	adda.w #11256,a1
	add.l	c2p1x1_8_c5_gen_scroffs,a1
    7494:	d3fa 02f4      	adda.l 778a <c2p1x1_8_c5_gen_scroffs>(pc),a1

	move.l	c2p1x1_8_c5_gen_pixels,a2
    7498:	247a 02f4      	movea.l 778e <c2p1x1_8_c5_gen_pixels>(pc),a2
	add.l	a0,a2
    749c:	d5c8           	adda.l a0,a2
	cmp.l	a0,a2
    749e:	b5c8           	cmpa.l a0,a2
	beq	.none
    74a0:	6700 02a4      	beq.w 7746 <.none>

	movem.l	a0-a1,-(sp)
    74a4:	48e7 00c0      	movem.l a0-a1,-(sp)

	move.l	(a0)+,d0
    74a8:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    74aa:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    74ac:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    74ae:	2618           	move.l (a0)+,d3

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    74b0:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    74b6:	c084           	and.l d4,d0
	and.l	d4,d1
    74b8:	c284           	and.l d4,d1
	and.l	d4,d2
    74ba:	c484           	and.l d4,d2
	and.l	d4,d3
    74bc:	c684           	and.l d4,d3
	lsl.l	#4,d0
    74be:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    74c0:	e989           	lsl.l #4,d1
	or.l	d2,d0
    74c2:	8082           	or.l d2,d0
	or.l	d3,d1
    74c4:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    74c6:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    74c8:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    74ca:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    74cc:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    74ce:	c484           	and.l d4,d2
	and.l	d4,d6
    74d0:	cc84           	and.l d4,d6
	and.l	d4,d3
    74d2:	c684           	and.l d4,d3
	and.l	d4,d7
    74d4:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    74d6:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    74d8:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    74da:	8486           	or.l d6,d2
	or.l	d7,d3
    74dc:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    74de:	3c02           	move.w d2,d6
	move.w	d3,d7
    74e0:	3e03           	move.w d3,d7
	move.w	d0,d2
    74e2:	3400           	move.w d0,d2
	move.w	d1,d3
    74e4:	3601           	move.w d1,d3
	swap	d2
    74e6:	4842           	swap d2
	swap	d3
    74e8:	4843           	swap d3
	move.w	d2,d0
    74ea:	3002           	move.w d2,d0
	move.w	d3,d1
    74ec:	3203           	move.w d3,d1
	move.w	d6,d2
    74ee:	3406           	move.w d6,d2
	move.w	d7,d3
    74f0:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    74f2:	2c02           	move.l d2,d6
	move.l	d3,d7
    74f4:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    74f6:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    74f8:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    74fa:	b186           	eor.l d0,d6
	eor.l	d1,d7
    74fc:	b387           	eor.l d1,d7
	and.l	d5,d6
    74fe:	cc85           	and.l d5,d6
	and.l	d5,d7
    7500:	ce85           	and.l d5,d7
	eor.l	d6,d0
    7502:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7504:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    7506:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7508:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    750a:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    750c:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    750e:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7514:	2c01           	move.l d1,d6
	move.l	d3,d7
    7516:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7518:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    751a:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    751c:	b186           	eor.l d0,d6
	eor.l	d2,d7
    751e:	b587           	eor.l d2,d7
	bra	.start1
    7520:	6000 0088      	bra.w 75aa <.start1>

00007524 <.x1>:
.x1:
	move.l	(a0)+,d0
    7524:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    7526:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7528:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    752a:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    752c:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    7530:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    7536:	c084           	and.l d4,d0
	and.l	d4,d1
    7538:	c284           	and.l d4,d1
	and.l	d4,d2
    753a:	c484           	and.l d4,d2
	and.l	d4,d3
    753c:	c684           	and.l d4,d3
	lsl.l	#4,d0
    753e:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    7540:	e989           	lsl.l #4,d1
	or.l	d2,d0
    7542:	8082           	or.l d2,d0
	or.l	d3,d1
    7544:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    7546:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7548:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    754a:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    754c:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    754e:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    7552:	c484           	and.l d4,d2
	and.l	d4,d6
    7554:	cc84           	and.l d4,d6
	and.l	d4,d3
    7556:	c684           	and.l d4,d3
	and.l	d4,d7
    7558:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    755a:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    755c:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    755e:	8486           	or.l d6,d2
	or.l	d7,d3
    7560:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    7562:	3c02           	move.w d2,d6
	move.w	d3,d7
    7564:	3e03           	move.w d3,d7
	move.w	d0,d2
    7566:	3400           	move.w d0,d2
	move.w	d1,d3
    7568:	3601           	move.w d1,d3
	swap	d2
    756a:	4842           	swap d2
	swap	d3
    756c:	4843           	swap d3
	move.w	d2,d0
    756e:	3002           	move.w d2,d0
	move.w	d3,d1
    7570:	3203           	move.w d3,d1
	move.w	d6,d2
    7572:	3406           	move.w d6,d2
	move.w	d7,d3
    7574:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    7576:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    757a:	2c02           	move.l d2,d6
	move.l	d3,d7
    757c:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    757e:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7580:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    7582:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7584:	b387           	eor.l d1,d7
	and.l	d5,d6
    7586:	cc85           	and.l d5,d6
	and.l	d5,d7
    7588:	ce85           	and.l d5,d7
	eor.l	d6,d0
    758a:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    758c:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    758e:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7590:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    7592:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7594:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    7596:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    759c:	2c01           	move.l d1,d6
	move.l	d3,d7
    759e:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    75a0:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    75a2:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    75a4:	b186           	eor.l d0,d6
	eor.l	d2,d7
    75a6:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    75a8:	22cd           	move.l a5,(a1)+

000075aa <.start1>:
.start1:
	and.l	d4,d6
    75aa:	cc84           	and.l d4,d6
	and.l	d4,d7
    75ac:	ce84           	and.l d4,d7
	eor.l	d6,d0
    75ae:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    75b0:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    75b2:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    75b4:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    75b6:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    75b8:	bf83           	eor.l d7,d3

	move.l	a6,d4
    75ba:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    75bc:	2c01           	move.l d1,d6
	move.l	d3,d7
    75be:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    75c0:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    75c2:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    75c4:	b186           	eor.l d0,d6
	eor.l	d2,d7
    75c6:	b587           	eor.l d2,d7
	and.l	d4,d6
    75c8:	cc84           	and.l d4,d6
	and.l	d4,d7
    75ca:	ce84           	and.l d4,d7
	eor.l	d6,d0
    75cc:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    75ce:	bf82           	eor.l d7,d2
	add.l	d6,d6
    75d0:	dc86           	add.l d6,d6
	add.l	d7,d7
    75d2:	de87           	add.l d7,d7
	eor.l	d1,d6
    75d4:	b386           	eor.l d1,d6
	eor.l	d3,d7
    75d6:	b787           	eor.l d3,d7

	move.l	d0,a4
    75d8:	2840           	movea.l d0,a4
	move.l	d2,a5
    75da:	2a42           	movea.l d2,a5
	move.l	d6,a3
    75dc:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    75de:	b5c8           	cmpa.l a0,a2
	bne	.x1
    75e0:	6600 ff42      	bne.w 7524 <.x1>
	move.l	d7,-BPLSIZE(a1)
    75e4:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    75e8:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    75ec:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    75f0:	22cd           	move.l a5,(a1)+

	movem.l	(sp)+,a0-a1
    75f2:	4cdf 0300      	movem.l (sp)+,a0-a1
	add.l	#BPLSIZE*4,a1
    75f6:	d3fc 0000 afe0 	adda.l #45024,a1

	move.l	(a0)+,d0
    75fc:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    75fe:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7600:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    7602:	2618           	move.l (a0)+,d3

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    7604:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    760a:	c084           	and.l d4,d0
	and.l	d4,d1
    760c:	c284           	and.l d4,d1
	and.l	d4,d2
    760e:	c484           	and.l d4,d2
	and.l	d4,d3
    7610:	c684           	and.l d4,d3
	lsr.l	#4,d2
    7612:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    7614:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    7616:	8082           	or.l d2,d0
	or.l	d3,d1
    7618:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    761a:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    761c:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    761e:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7620:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    7622:	c484           	and.l d4,d2
	and.l	d4,d6
    7624:	cc84           	and.l d4,d6
	and.l	d4,d3
    7626:	c684           	and.l d4,d3
	and.l	d4,d7
    7628:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    762a:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    762c:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    762e:	8486           	or.l d6,d2
	or.l	d7,d3
    7630:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    7632:	3c02           	move.w d2,d6
	move.w	d3,d7
    7634:	3e03           	move.w d3,d7
	move.w	d0,d2
    7636:	3400           	move.w d0,d2
	move.w	d1,d3
    7638:	3601           	move.w d1,d3
	swap	d2
    763a:	4842           	swap d2
	swap	d3
    763c:	4843           	swap d3
	move.w	d2,d0
    763e:	3002           	move.w d2,d0
	move.w	d3,d1
    7640:	3203           	move.w d3,d1
	move.w	d6,d2
    7642:	3406           	move.w d6,d2
	move.w	d7,d3
    7644:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    7646:	2c02           	move.l d2,d6
	move.l	d3,d7
    7648:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    764a:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    764c:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    764e:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7650:	b387           	eor.l d1,d7
	and.l	d5,d6
    7652:	cc85           	and.l d5,d6
	and.l	d5,d7
    7654:	ce85           	and.l d5,d7
	eor.l	d6,d0
    7656:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7658:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    765a:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    765c:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    765e:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7660:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    7662:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7668:	2c01           	move.l d1,d6
	move.l	d3,d7
    766a:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    766c:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    766e:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7670:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7672:	b587           	eor.l d2,d7
	bra	.start2
    7674:	6000 0088      	bra.w 76fe <.start2>

00007678 <.x2>:
.x2:
	move.l	(a0)+,d0
    7678:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    767a:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    767c:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    767e:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    7680:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    7684:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    768a:	c084           	and.l d4,d0
	and.l	d4,d1
    768c:	c284           	and.l d4,d1
	and.l	d4,d2
    768e:	c484           	and.l d4,d2
	and.l	d4,d3
    7690:	c684           	and.l d4,d3
	lsr.l	#4,d2
    7692:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    7694:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    7696:	8082           	or.l d2,d0
	or.l	d3,d1
    7698:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    769a:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    769c:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    769e:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    76a0:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    76a2:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    76a6:	c484           	and.l d4,d2
	and.l	d4,d6
    76a8:	cc84           	and.l d4,d6
	and.l	d4,d3
    76aa:	c684           	and.l d4,d3
	and.l	d4,d7
    76ac:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    76ae:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    76b0:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    76b2:	8486           	or.l d6,d2
	or.l	d7,d3
    76b4:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    76b6:	3c02           	move.w d2,d6
	move.w	d3,d7
    76b8:	3e03           	move.w d3,d7
	move.w	d0,d2
    76ba:	3400           	move.w d0,d2
	move.w	d1,d3
    76bc:	3601           	move.w d1,d3
	swap	d2
    76be:	4842           	swap d2
	swap	d3
    76c0:	4843           	swap d3
	move.w	d2,d0
    76c2:	3002           	move.w d2,d0
	move.w	d3,d1
    76c4:	3203           	move.w d3,d1
	move.w	d6,d2
    76c6:	3406           	move.w d6,d2
	move.w	d7,d3
    76c8:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    76ca:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    76ce:	2c02           	move.l d2,d6
	move.l	d3,d7
    76d0:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    76d2:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    76d4:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    76d6:	b186           	eor.l d0,d6
	eor.l	d1,d7
    76d8:	b387           	eor.l d1,d7
	and.l	d5,d6
    76da:	cc85           	and.l d5,d6
	and.l	d5,d7
    76dc:	ce85           	and.l d5,d7
	eor.l	d6,d0
    76de:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    76e0:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    76e2:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    76e4:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    76e6:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    76e8:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    76ea:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    76f0:	2c01           	move.l d1,d6
	move.l	d3,d7
    76f2:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    76f4:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    76f6:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    76f8:	b186           	eor.l d0,d6
	eor.l	d2,d7
    76fa:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    76fc:	22cd           	move.l a5,(a1)+

000076fe <.start2>:
.start2:
	and.l	d4,d6
    76fe:	cc84           	and.l d4,d6
	and.l	d4,d7
    7700:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7702:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7704:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    7706:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    7708:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    770a:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    770c:	bf83           	eor.l d7,d3

	move.l	a6,d4
    770e:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    7710:	2c01           	move.l d1,d6
	move.l	d3,d7
    7712:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    7714:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    7716:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    7718:	b186           	eor.l d0,d6
	eor.l	d2,d7
    771a:	b587           	eor.l d2,d7
	and.l	d4,d6
    771c:	cc84           	and.l d4,d6
	and.l	d4,d7
    771e:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7720:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7722:	bf82           	eor.l d7,d2
	add.l	d6,d6
    7724:	dc86           	add.l d6,d6
	add.l	d7,d7
    7726:	de87           	add.l d7,d7
	eor.l	d1,d6
    7728:	b386           	eor.l d1,d6
	eor.l	d3,d7
    772a:	b787           	eor.l d3,d7

	move.l	d0,a4
    772c:	2840           	movea.l d0,a4
	move.l	d2,a5
    772e:	2a42           	movea.l d2,a5
	move.l	d6,a3
    7730:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    7732:	b5c8           	cmpa.l a0,a2
	bne	.x2
    7734:	6600 ff42      	bne.w 7678 <.x2>
	move.l	d7,-BPLSIZE(a1)
    7738:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    773c:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    7740:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    7744:	22cd           	move.l a5,(a1)+

00007746 <.none>:
.none:
	movem.l .c2p_saveregs,d0-d7/a0-a6
    7746:	4cfa 7fff 0004 	movem.l 774e <.c2p_saveregs>(pc),d0-a6
	rts
    774c:	4e75           	rts

0000774e <.c2p_saveregs>:
	...

0000778a <c2p1x1_8_c5_gen_scroffs>:
    778a:	0000 0001      	ori.b #1,d0

0000778e <c2p1x1_8_c5_gen_pixels>:

.c2p_saveregs: .dcb.b 60


c2p1x1_8_c5_gen_scroffs: dc.l	1
    778e:	0000 0001      	ori.b #1,d0
