
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
       2:	203c 0000 a55a 	move.l #42330,d0
       8:	0480 0000 a55a 	subi.l #42330,d0
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
      22:	41f9 0000 a55a 	lea a55a <__fini_array_end>,a0
      28:	2071 8800      	movea.l (0,a1,a0.l),a0
      2c:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      2e:	52af 0004      	addq.l #1,4(sp)
      32:	202f 0004      	move.l 4(sp),d0
      36:	b097           	cmp.l (sp),d0
      38:	65de           	bcs.s 18 <_start+0x18>

	count = __init_array_end - __init_array_start;
      3a:	203c 0000 a55a 	move.l #42330,d0
      40:	0480 0000 a55a 	subi.l #42330,d0
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
      5a:	41f9 0000 a55a 	lea a55a <__fini_array_end>,a0
      60:	2071 8800      	movea.l (0,a1,a0.l),a0
      64:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      66:	52af 0004      	addq.l #1,4(sp)
      6a:	202f 0004      	move.l 4(sp),d0
      6e:	b097           	cmp.l (sp),d0
      70:	65de           	bcs.s 50 <_start+0x50>

	main();
      72:	4eb9 0000 0824 	jsr 824 <main>

	// call dtors
	count = __fini_array_end - __fini_array_start;
      78:	203c 0000 a55a 	move.l #42330,d0
      7e:	0480 0000 a55a 	subi.l #42330,d0
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
      9a:	41f9 0000 a55a 	lea a55a <__fini_array_end>,a0
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
      b6:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
      bc:	3f68 0002 0002 	move.w 2(a0),2(sp)
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
      c2:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
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
      e6:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
      ec:	6722           	beq.s 110 <FreeDisplay+0x30>
      ee:	2f79 0016 b994 	move.l 16b994 <Copperlist1>,32(sp)
      f4:	0020 
      f6:	2f6f 0028 001c 	move.l 40(sp),28(sp)
      fc:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
     102:	2c40           	movea.l d0,a6
     104:	226f 0020      	movea.l 32(sp),a1
     108:	202f 001c      	move.l 28(sp),d0
     10c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     110:	2039 0016 b998 	move.l 16b998 <Copperlist2>,d0
     116:	6722           	beq.s 13a <FreeDisplay+0x5a>
     118:	2f79 0016 b998 	move.l 16b998 <Copperlist2>,24(sp)
     11e:	0018 
     120:	2f6f 0028 0014 	move.l 40(sp),20(sp)
     126:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
     12c:	2c40           	movea.l d0,a6
     12e:	226f 0018      	movea.l 24(sp),a1
     132:	202f 0014      	move.l 20(sp),d0
     136:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
     13a:	2039 0016 b98c 	move.l 16b98c <Bitplane1>,d0
     140:	6722           	beq.s 164 <FreeDisplay+0x84>
     142:	2f79 0016 b98c 	move.l 16b98c <Bitplane1>,16(sp)
     148:	0010 
     14a:	2f6f 002c 000c 	move.l 44(sp),12(sp)
     150:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
     156:	2c40           	movea.l d0,a6
     158:	226f 0010      	movea.l 16(sp),a1
     15c:	202f 000c      	move.l 12(sp),d0
     160:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
     164:	2039 0016 b990 	move.l 16b990 <Bitplane2>,d0
     16a:	6722           	beq.s 18e <FreeDisplay+0xae>
     16c:	2f79 0016 b990 	move.l 16b990 <Bitplane2>,8(sp)
     172:	0008 
     174:	2f6f 002c 0004 	move.l 44(sp),4(sp)
     17a:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
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
     19a:	2039 0016 b99c 	move.l 16b99c <DrawBuffer>,d0
     1a0:	4240           	clr.w d0
     1a2:	4840           	swap d0
     1a4:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     1a8:	2039 0016 b99c 	move.l 16b99c <DrawBuffer>,d0
     1ae:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     1b2:	2f79 0016 b9a4 	move.l 16b9a4 <DrawCopper>,4(sp)
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
     1d2:	2039 0016 b99c 	move.l 16b99c <DrawBuffer>,d0
     1d8:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     1da:	2039 0016 b9a0 	move.l 16b9a0 <ViewBuffer>,d0
     1e0:	23c0 0016 b99c 	move.l d0,16b99c <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     1e6:	2017           	move.l (sp),d0
     1e8:	23c0 0016 b9a0 	move.l d0,16b9a0 <ViewBuffer>
}
     1ee:	4fef 000c      	lea 12(sp),sp
     1f2:	4e75           	rts

000001f4 <SwapCl>:

void SwapCl() {
     1f4:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     1f6:	2039 0016 b9a4 	move.l 16b9a4 <DrawCopper>,d0
     1fc:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     1fe:	2039 0016 b9a8 	move.l 16b9a8 <ViewCopper>,d0
     204:	23c0 0016 b9a4 	move.l d0,16b9a4 <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     20a:	2017           	move.l (sp),d0
     20c:	23c0 0016 b9a8 	move.l d0,16b9a8 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     212:	2039 0016 b9a8 	move.l 16b9a8 <ViewCopper>,d0
     218:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
     21e:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     222:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
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
     2fa:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
     300:	317c 0020 009c 	move.w #32,156(a0)
     306:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
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
     316:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
     31c:	317c 87ff 0096 	move.w #-30721,150(a0)
     322:	6008           	bra.s 32c <RunDemo+0x16>
	hw->intreq=1<<INTB_VERTB;//reset vbl req*/
  //PrepareDisplay();
  //CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
  
	while(Zoom_Counter < 1000) {
		WaitVbl();
     324:	4eba 0270      	jsr 596 <WaitVbl>(pc)
    RunFrame();
     328:	4eba 0038      	jsr 362 <RunFrame>(pc)
	while(Zoom_Counter < 1000) {
     32c:	3039 0016 b9ea 	move.w 16b9ea <Zoom_Counter>,d0
     332:	0c40 03e7      	cmpi.w #999,d0
     336:	63ec           	bls.s 324 <RunDemo+0xe>
	}
  Zoom_Dealloc();
     338:	4eba 1048      	jsr 1382 <Zoom_Dealloc>(pc)

	//SetInterruptHandler((APTR)interruptHandler);
}
     33c:	4e75           	rts

0000033e <SetInterrupt>:

void SetInterrupt() {
  SetInterruptHandler((APTR)interruptHandler);
     33e:	487a ffb8      	pea 2f8 <interruptHandler.lto_priv.0>(pc)
     342:	4eba 0236      	jsr 57a <SetInterruptHandler>(pc)
     346:	588f           	addq.l #4,sp
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     348:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
     34e:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     354:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
     35a:	317c 0020 009c 	move.w #32,156(a0)
}
     360:	4e75           	rts

00000362 <RunFrame>:
  else
    Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer, (UWORD *)DrawBuffer, Zoom_LevelOfZoom, 5 );

  Zoom_Blit4ZoomFinished = 1;
  while( tmp == Zoom_LevelOfZoom) { }*/
     362:	4e75           	rts

00000364 <Zoom_InsertShift>:
           0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
           0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000,
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

void Zoom_InsertShift( UWORD *copperlist, UWORD *values4shift) {
     364:	4fef fff4      	lea -12(sp),sp
     368:	2f02           	move.l d2,-(sp)
  for(int i = 0; i<6;i++) {
     36a:	42af 000c      	clr.l 12(sp)
     36e:	601e           	bra.s 38e <Zoom_InsertShift+0x2a>
    *copperlist = *values4shift++;
     370:	202f 0018      	move.l 24(sp),d0
     374:	2200           	move.l d0,d1
     376:	5481           	addq.l #2,d1
     378:	2f41 0018      	move.l d1,24(sp)
     37c:	2040           	movea.l d0,a0
     37e:	3010           	move.w (a0),d0
     380:	206f 0014      	movea.l 20(sp),a0
     384:	3080           	move.w d0,(a0)
    copperlist += 2;
     386:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<6;i++) {
     38a:	52af 000c      	addq.l #1,12(sp)
     38e:	7005           	moveq #5,d0
     390:	b0af 000c      	cmp.l 12(sp),d0
     394:	6cda           	bge.s 370 <Zoom_InsertShift+0xc>
  }
  copperlist--;
     396:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     39a:	222f 0018      	move.l 24(sp),d1
     39e:	2401           	move.l d1,d2
     3a0:	5482           	addq.l #2,d2
     3a2:	2f42 0018      	move.l d2,24(sp)
     3a6:	202f 0014      	move.l 20(sp),d0
     3aa:	2400           	move.l d0,d2
     3ac:	5482           	addq.l #2,d2
     3ae:	2f42 0014      	move.l d2,20(sp)
     3b2:	2041           	movea.l d1,a0
     3b4:	3210           	move.w (a0),d1
     3b6:	2040           	movea.l d0,a0
     3b8:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     3ba:	202f 0018      	move.l 24(sp),d0
     3be:	2200           	move.l d0,d1
     3c0:	5481           	addq.l #2,d1
     3c2:	2f41 0018      	move.l d1,24(sp)
     3c6:	2040           	movea.l d0,a0
     3c8:	3010           	move.w (a0),d0
     3ca:	206f 0014      	movea.l 20(sp),a0
     3ce:	3080           	move.w d0,(a0)
  copperlist += 2;
     3d0:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     3d4:	42af 0008      	clr.l 8(sp)
     3d8:	601e           	bra.s 3f8 <Zoom_InsertShift+0x94>
    *copperlist = *values4shift++;
     3da:	202f 0018      	move.l 24(sp),d0
     3de:	2200           	move.l d0,d1
     3e0:	5481           	addq.l #2,d1
     3e2:	2f41 0018      	move.l d1,24(sp)
     3e6:	2040           	movea.l d0,a0
     3e8:	3010           	move.w (a0),d0
     3ea:	206f 0014      	movea.l 20(sp),a0
     3ee:	3080           	move.w d0,(a0)
    copperlist += 2;
     3f0:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     3f4:	52af 0008      	addq.l #1,8(sp)
     3f8:	7009           	moveq #9,d0
     3fa:	b0af 0008      	cmp.l 8(sp),d0
     3fe:	6cda           	bge.s 3da <Zoom_InsertShift+0x76>
  }
  copperlist--;
     400:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     404:	222f 0018      	move.l 24(sp),d1
     408:	2401           	move.l d1,d2
     40a:	5482           	addq.l #2,d2
     40c:	2f42 0018      	move.l d2,24(sp)
     410:	202f 0014      	move.l 20(sp),d0
     414:	2400           	move.l d0,d2
     416:	5482           	addq.l #2,d2
     418:	2f42 0014      	move.l d2,20(sp)
     41c:	2041           	movea.l d1,a0
     41e:	3210           	move.w (a0),d1
     420:	2040           	movea.l d0,a0
     422:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     424:	202f 0018      	move.l 24(sp),d0
     428:	2200           	move.l d0,d1
     42a:	5481           	addq.l #2,d1
     42c:	2f41 0018      	move.l d1,24(sp)
     430:	2040           	movea.l d0,a0
     432:	3010           	move.w (a0),d0
     434:	206f 0014      	movea.l 20(sp),a0
     438:	3080           	move.w d0,(a0)
  copperlist += 2;
     43a:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     43e:	42af 0004      	clr.l 4(sp)
     442:	601e           	bra.s 462 <Zoom_InsertShift+0xfe>
    *copperlist = *values4shift++;
     444:	202f 0018      	move.l 24(sp),d0
     448:	2200           	move.l d0,d1
     44a:	5481           	addq.l #2,d1
     44c:	2f41 0018      	move.l d1,24(sp)
     450:	2040           	movea.l d0,a0
     452:	3010           	move.w (a0),d0
     454:	206f 0014      	movea.l 20(sp),a0
     458:	3080           	move.w d0,(a0)
    copperlist += 2;
     45a:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     45e:	52af 0004      	addq.l #1,4(sp)
     462:	7006           	moveq #6,d0
     464:	b0af 0004      	cmp.l 4(sp),d0
     468:	6cda           	bge.s 444 <Zoom_InsertShift+0xe0>
  }
}
     46a:	241f           	move.l (sp)+,d2
     46c:	4fef 000c      	lea 12(sp),sp
     470:	4e75           	rts

00000472 <Zoom_Shrink102>:

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {
     472:	518f           	subq.l #8,sp
     474:	202f 000c      	move.l 12(sp),d0
     478:	3000           	move.w d0,d0
     47a:	3f40 0002      	move.w d0,2(sp)

  
  UWORD *values4shift = Values4Shift+levelofshrink*108;
     47e:	7200           	moveq #0,d1
     480:	322f 0002      	move.w 2(sp),d1
     484:	2001           	move.l d1,d0
     486:	d080           	add.l d0,d0
     488:	d081           	add.l d1,d0
     48a:	2200           	move.l d0,d1
     48c:	e789           	lsl.l #3,d1
     48e:	d081           	add.l d1,d0
     490:	e788           	lsl.l #3,d0
     492:	2200           	move.l d0,d1
     494:	0681 0000 a874 	addi.l #43124,d1
     49a:	2f41 0004      	move.l d1,4(sp)
  //copperlist+=3+73*2;
  Zoom_InsertShift( copperlist+3+73*2, values4shift);
     49e:	202f 0010      	move.l 16(sp),d0
     4a2:	0680 0000 012a 	addi.l #298,d0
     4a8:	2f2f 0004      	move.l 4(sp),-(sp)
     4ac:	2f00           	move.l d0,-(sp)
     4ae:	4eba feb4      	jsr 364 <Zoom_InsertShift>(pc)
     4b2:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+63+73*2, values4shift+27);
     4b4:	7236           	moveq #54,d1
     4b6:	d2af 0004      	add.l 4(sp),d1
     4ba:	202f 0010      	move.l 16(sp),d0
     4be:	0680 0000 01a2 	addi.l #418,d0
     4c4:	2f01           	move.l d1,-(sp)
     4c6:	2f00           	move.l d0,-(sp)
     4c8:	4eba fe9a      	jsr 364 <Zoom_InsertShift>(pc)
     4cc:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+119+73*2, values4shift+54);
     4ce:	726c           	moveq #108,d1
     4d0:	d2af 0004      	add.l 4(sp),d1
     4d4:	202f 0010      	move.l 16(sp),d0
     4d8:	0680 0000 0212 	addi.l #530,d0
     4de:	2f01           	move.l d1,-(sp)
     4e0:	2f00           	move.l d0,-(sp)
     4e2:	4eba fe80      	jsr 364 <Zoom_InsertShift>(pc)
     4e6:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+175+73*2, values4shift+81);
     4e8:	222f 0004      	move.l 4(sp),d1
     4ec:	0681 0000 00a2 	addi.l #162,d1
     4f2:	202f 0010      	move.l 16(sp),d0
     4f6:	0680 0000 0282 	addi.l #642,d0
     4fc:	2f01           	move.l d1,-(sp)
     4fe:	2f00           	move.l d0,-(sp)
     500:	4eba fe62      	jsr 364 <Zoom_InsertShift>(pc)
     504:	508f           	addq.l #8,sp
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }*/
  
}
     506:	508f           	addq.l #8,sp
     508:	4e75           	rts

0000050a <GetVBR>:
volatile static APTR VBR=0;
static APTR SystemIrq;
 
struct View *ActiView;

static APTR GetVBR(void) {
     50a:	4fef ffec      	lea -20(sp),sp
     50e:	2f0e           	move.l a6,-(sp)
     510:	2f07           	move.l d7,-(sp)
	APTR vbr = 0;
     512:	42af 0018      	clr.l 24(sp)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     516:	3f7c 4e7a 000a 	move.w #20090,10(sp)
     51c:	3f7c 0801 000c 	move.w #2049,12(sp)
     522:	3f7c 4e73 000e 	move.w #20083,14(sp)

	if (SysBase->AttnFlags & AFF_68010) 
     528:	2079 0016 b9b0 	movea.l 16b9b0 <SysBase>,a0
     52e:	3028 0128      	move.w 296(a0),d0
     532:	3000           	move.w d0,d0
     534:	0280 0000 ffff 	andi.l #65535,d0
     53a:	7201           	moveq #1,d1
     53c:	c081           	and.l d1,d0
     53e:	672c           	beq.s 56c <GetVBR+0x62>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     540:	41ef 001c      	lea 28(sp),a0
     544:	41e8 ffee      	lea -18(a0),a0
     548:	2f48 0014      	move.l a0,20(sp)
     54c:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
     552:	2c40           	movea.l d0,a6
     554:	2e2f 0014      	move.l 20(sp),d7
     558:	cf8d           	exg d7,a5
     55a:	4eae ffe2      	jsr -30(a6)
     55e:	cf8d           	exg d7,a5
     560:	2f40 0010      	move.l d0,16(sp)
     564:	202f 0010      	move.l 16(sp),d0
     568:	2f40 0018      	move.l d0,24(sp)

	return vbr;
     56c:	202f 0018      	move.l 24(sp),d0
}
     570:	2e1f           	move.l (sp)+,d7
     572:	2c5f           	movea.l (sp)+,a6
     574:	4fef 0014      	lea 20(sp),sp
     578:	4e75           	rts

0000057a <SetInterruptHandler>:

void SetInterruptHandler(APTR interrupt) {
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     57a:	2079 0016 b9c6 	movea.l 16b9c6 <VBR>,a0
     580:	41e8 006c      	lea 108(a0),a0
     584:	20af 0004      	move.l 4(sp),(a0)
}
     588:	4e75           	rts

0000058a <GetInterruptHandler>:

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     58a:	2079 0016 b9c6 	movea.l 16b9c6 <VBR>,a0
     590:	2028 006c      	move.l 108(a0),d0
}
     594:	4e75           	rts

00000596 <WaitVbl>:

//vblank begins at vpos 312 hpos 1 and ends at vpos 25 hpos 1
//vsync begins at line 2 hpos 132 and ends at vpos 5 hpos 18 
void WaitVbl() {
     596:	518f           	subq.l #8,sp
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     598:	207c 00df f004 	movea.l #14675972,a0
     59e:	2010           	move.l (a0),d0
     5a0:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
     5a2:	2017           	move.l (sp),d0
     5a4:	0280 0001 ff00 	andi.l #130816,d0
     5aa:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
     5ac:	2017           	move.l (sp),d0
     5ae:	0c80 0001 3700 	cmpi.l #79616,d0
     5b4:	67e2           	beq.s 598 <WaitVbl+0x2>
			break;
	}
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     5b6:	207c 00df f004 	movea.l #14675972,a0
     5bc:	2010           	move.l (a0),d0
     5be:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
     5c2:	202f 0004      	move.l 4(sp),d0
     5c6:	0280 0001 ff00 	andi.l #130816,d0
     5cc:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
     5d0:	202f 0004      	move.l 4(sp),d0
     5d4:	0c80 0001 3700 	cmpi.l #79616,d0
     5da:	66da           	bne.s 5b6 <WaitVbl+0x20>
			break;
	}
}
     5dc:	508f           	addq.l #8,sp
     5de:	4e75           	rts

000005e0 <TakeSystem>:
	UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
}*/

void TakeSystem() {
     5e0:	518f           	subq.l #8,sp
     5e2:	2f0e           	move.l a6,-(sp)
	ActiView=GfxBase->ActiView; //store current view
     5e4:	2079 0016 b9bc 	movea.l 16b9bc <GfxBase>,a0
     5ea:	2028 0022      	move.l 34(a0),d0
     5ee:	23c0 0016 b9ce 	move.l d0,16b9ce <ActiView>
	OwnBlitter();
     5f4:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
     5fa:	2c40           	movea.l d0,a6
     5fc:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     600:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
     606:	2c40           	movea.l d0,a6
     608:	4eae ff1c      	jsr -228(a6)
	//Disable();
	Forbid();
     60c:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
     612:	2c40           	movea.l d0,a6
     614:	4eae ff7c      	jsr -132(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=custom->adkconr;
     618:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     61e:	3028 0010      	move.w 16(a0),d0
     622:	33c0 0016 b9c4 	move.w d0,16b9c4 <SystemADKCON>
	SystemInts=custom->intenar;
     628:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     62e:	3028 001c      	move.w 28(a0),d0
     632:	33c0 0016 b9c0 	move.w d0,16b9c0 <SystemInts>
	SystemDMA=custom->dmaconr;
     638:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     63e:	3028 0002      	move.w 2(a0),d0
     642:	33c0 0016 b9c2 	move.w d0,16b9c2 <SystemDMA>
	custom->intena=0x7fff;//disable all interrupts
     648:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     64e:	317c 7fff 009a 	move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     654:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     65a:	317c 7fff 009c 	move.w #32767,156(a0)
	
	WaitVbl();
     660:	4eba ff34      	jsr 596 <WaitVbl>(pc)
	WaitVbl();
     664:	4eba ff30      	jsr 596 <WaitVbl>(pc)
	custom->dmacon=0x7fff;//Clear all DMA channels
     668:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     66e:	317c 7fff 0096 	move.w #32767,150(a0)

	//set all colors black
	for(int a=0;a<32;a++)
     674:	42af 0008      	clr.l 8(sp)
     678:	601c           	bra.s 696 <TakeSystem+0xb6>
		custom->color[a]=0;
     67a:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     680:	202f 0008      	move.l 8(sp),d0
     684:	0680 0000 00c0 	addi.l #192,d0
     68a:	d080           	add.l d0,d0
     68c:	31bc 0000 0800 	move.w #0,(0,a0,d0.l)
	for(int a=0;a<32;a++)
     692:	52af 0008      	addq.l #1,8(sp)
     696:	701f           	moveq #31,d0
     698:	b0af 0008      	cmp.l 8(sp),d0
     69c:	6cdc           	bge.s 67a <TakeSystem+0x9a>

	LoadView(0);
     69e:	42af 0004      	clr.l 4(sp)
     6a2:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
     6a8:	2c40           	movea.l d0,a6
     6aa:	226f 0004      	movea.l 4(sp),a1
     6ae:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     6b2:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
     6b8:	2c40           	movea.l d0,a6
     6ba:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     6be:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
     6c4:	2c40           	movea.l d0,a6
     6c6:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     6ca:	4eba feca      	jsr 596 <WaitVbl>(pc)
	WaitVbl();
     6ce:	4eba fec6      	jsr 596 <WaitVbl>(pc)

	VBR=GetVBR();
     6d2:	4eba fe36      	jsr 50a <GetVBR>(pc)
     6d6:	23c0 0016 b9c6 	move.l d0,16b9c6 <VBR>
	SystemIrq=GetInterruptHandler(); //store interrupt register
     6dc:	4eba feac      	jsr 58a <GetInterruptHandler>(pc)
     6e0:	23c0 0016 b9ca 	move.l d0,16b9ca <SystemIrq>
}
     6e6:	2c5f           	movea.l (sp)+,a6
     6e8:	508f           	addq.l #8,sp
     6ea:	4e75           	rts

000006ec <FreeSystem>:

void FreeSystem() { 
     6ec:	598f           	subq.l #4,sp
     6ee:	2f0e           	move.l a6,-(sp)
	WaitVbl();
     6f0:	4eba fea4      	jsr 596 <WaitVbl>(pc)
	WaitBlt();
     6f4:	4eba f9be      	jsr b4 <WaitBlt>(pc)
	custom->intena=0x7fff;//disable all interrupts
     6f8:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     6fe:	317c 7fff 009a 	move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     704:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     70a:	317c 7fff 009c 	move.w #32767,156(a0)
	custom->dmacon=0x7fff;//Clear all DMA channels
     710:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     716:	317c 7fff 0096 	move.w #32767,150(a0)

	//restore interrupts
	SetInterruptHandler(SystemIrq);
     71c:	2039 0016 b9ca 	move.l 16b9ca <SystemIrq>,d0
     722:	2f00           	move.l d0,-(sp)
     724:	4eba fe54      	jsr 57a <SetInterruptHandler>(pc)
     728:	588f           	addq.l #4,sp

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
     72a:	2079 0016 b9bc 	movea.l 16b9bc <GfxBase>,a0
     730:	2028 0026      	move.l 38(a0),d0
     734:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     73a:	2140 0080      	move.l d0,128(a0)
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
     73e:	2079 0016 b9bc 	movea.l 16b9bc <GfxBase>,a0
     744:	2028 0032      	move.l 50(a0),d0
     748:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     74e:	2140 0084      	move.l d0,132(a0)
	custom->copjmp1=0x7fff; //start coppper
     752:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     758:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
     75e:	3039 0016 b9c0 	move.w 16b9c0 <SystemInts>,d0
     764:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     76a:	0040 8000      	ori.w #-32768,d0
     76e:	3140 009a      	move.w d0,154(a0)
	custom->dmacon=SystemDMA|0x8000;
     772:	3039 0016 b9c2 	move.w 16b9c2 <SystemDMA>,d0
     778:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     77e:	0040 8000      	ori.w #-32768,d0
     782:	3140 0096      	move.w d0,150(a0)
	custom->adkcon=SystemADKCON|0x8000;
     786:	3039 0016 b9c4 	move.w 16b9c4 <SystemADKCON>,d0
     78c:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     792:	0040 8000      	ori.w #-32768,d0
     796:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     79a:	2f79 0016 b9ce 	move.l 16b9ce <ActiView>,4(sp)
     7a0:	0004 
     7a2:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
     7a8:	2c40           	movea.l d0,a6
     7aa:	226f 0004      	movea.l 4(sp),a1
     7ae:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     7b2:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
     7b8:	2c40           	movea.l d0,a6
     7ba:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     7be:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
     7c4:	2c40           	movea.l d0,a6
     7c6:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     7ca:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
     7d0:	2c40           	movea.l d0,a6
     7d2:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     7d6:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
     7dc:	2c40           	movea.l d0,a6
     7de:	4eae fe32      	jsr -462(a6)
	//Enable();
	Permit();
     7e2:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
     7e8:	2c40           	movea.l d0,a6
     7ea:	4eae ff76      	jsr -138(a6)
}
     7ee:	2c5f           	movea.l (sp)+,a6
     7f0:	588f           	addq.l #4,sp
     7f2:	4e75           	rts

000007f4 <interruptHandler.lto_priv.1>:
	*copListCurrent++=offsetof(struct Custom, color[index]);
	*copListCurrent++=color;
	return copListCurrent;
}

static __attribute__((interrupt)) void interruptHandler() {
     7f4:	2f08           	move.l a0,-(sp)
     7f6:	2f00           	move.l d0,-(sp)
	custom->intreq=(1<<INTB_VERTB); custom->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     7f8:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     7fe:	317c 0020 009c 	move.w #32,156(a0)
     804:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     80a:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	frameCounter++;
     810:	3039 0016 b9d2 	move.w 16b9d2 <frameCounter>,d0
     816:	5240           	addq.w #1,d0
     818:	33c0 0016 b9d2 	move.w d0,16b9d2 <frameCounter>
}
     81e:	201f           	move.l (sp)+,d0
     820:	205f           	movea.l (sp)+,a0
     822:	4e73           	rte

00000824 <main>:
	*copListEnd++ = offsetof(struct Custom, diwstop);
	*copListEnd++ = (xstop-256)+((ystop-256)<<8);
	return copListEnd;
}

int main() {
     824:	4fef ffbc      	lea -68(sp),sp
     828:	48e7 3002      	movem.l d2-d3/a6,-(sp)
	ULONG tmp = 4;
     82c:	7004           	moveq #4,d0
     82e:	2f40 004c      	move.l d0,76(sp)
    SysBase = *((struct ExecBase**)tmp);
     832:	206f 004c      	movea.l 76(sp),a0
     836:	2010           	move.l (a0),d0
     838:	23c0 0016 b9b0 	move.l d0,16b9b0 <SysBase>
	hw = (struct Custom*)0xdff000;
     83e:	23fc 00df f000 	move.l #14675968,16b9ac <hw>
     844:	0016 b9ac 

	SysBase = *((struct ExecBase**)4UL);
     848:	307c 0004      	movea.w #4,a0
     84c:	2010           	move.l (a0),d0
     84e:	23c0 0016 b9b0 	move.l d0,16b9b0 <SysBase>
	custom = (struct Custom*)0xdff000;
     854:	23fc 00df f000 	move.l #14675968,16b9b4 <custom>
     85a:	0016 b9b4 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
     85e:	2f7c 0000 7546 	move.l #30022,72(sp)
     864:	0048 
     866:	42af 0044      	clr.l 68(sp)
     86a:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
     870:	2c40           	movea.l d0,a6
     872:	226f 0048      	movea.l 72(sp),a1
     876:	202f 0044      	move.l 68(sp),d0
     87a:	4eae fdd8      	jsr -552(a6)
     87e:	2f40 0040      	move.l d0,64(sp)
     882:	202f 0040      	move.l 64(sp),d0
     886:	23c0 0016 b9bc 	move.l d0,16b9bc <GfxBase>
	if (!GfxBase)
     88c:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
     892:	6614           	bne.s 8a8 <main+0x84>
		Exit(0);
     894:	42af 003c      	clr.l 60(sp)
     898:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     89e:	2c40           	movea.l d0,a6
     8a0:	222f 003c      	move.l 60(sp),d1
     8a4:	4eae ff70      	jsr -144(a6)

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     8a8:	2f7c 0000 7557 	move.l #30039,56(sp)
     8ae:	0038 
     8b0:	42af 0034      	clr.l 52(sp)
     8b4:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
     8ba:	2c40           	movea.l d0,a6
     8bc:	226f 0038      	movea.l 56(sp),a1
     8c0:	202f 0034      	move.l 52(sp),d0
     8c4:	4eae fdd8      	jsr -552(a6)
     8c8:	2f40 0030      	move.l d0,48(sp)
     8cc:	202f 0030      	move.l 48(sp),d0
     8d0:	23c0 0016 b9b8 	move.l d0,16b9b8 <DOSBase>
	if (!DOSBase)
     8d6:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     8dc:	6614           	bne.s 8f2 <main+0xce>
		Exit(0);
     8de:	42af 002c      	clr.l 44(sp)
     8e2:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     8e8:	2c40           	movea.l d0,a6
     8ea:	222f 002c      	move.l 44(sp),d1
     8ee:	4eae ff70      	jsr -144(a6)

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
     8f2:	4879 0000 7563 	pea 7563 <c2p1x1_8_c5_gen_pixels+0x21>
     8f8:	4eba 653e      	jsr 6e38 <KPrintF>(pc)
     8fc:	588f           	addq.l #4,sp
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
     8fe:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     904:	2c40           	movea.l d0,a6
     906:	4eae ffc4      	jsr -60(a6)
     90a:	2f40 0028      	move.l d0,40(sp)
     90e:	202f 0028      	move.l 40(sp),d0
     912:	2f40 0024      	move.l d0,36(sp)
     916:	2f7c 0000 757f 	move.l #30079,32(sp)
     91c:	0020 
     91e:	700f           	moveq #15,d0
     920:	2f40 001c      	move.l d0,28(sp)
     924:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     92a:	2c40           	movea.l d0,a6
     92c:	222f 0024      	move.l 36(sp),d1
     930:	242f 0020      	move.l 32(sp),d2
     934:	262f 001c      	move.l 28(sp),d3
     938:	4eae ffd0      	jsr -48(a6)
     93c:	2f40 0018      	move.l d0,24(sp)
	Delay(50);
     940:	7032           	moveq #50,d0
     942:	2f40 0014      	move.l d0,20(sp)
     946:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     94c:	2c40           	movea.l d0,a6
     94e:	222f 0014      	move.l 20(sp),d1
     952:	4eae ff3a      	jsr -198(a6)

	warpmode(1);
     956:	4878 0001      	pea 1 <_start+0x1>
     95a:	4eba 6546      	jsr 6ea2 <warpmode>(pc)
     95e:	588f           	addq.l #4,sp
	// TODO: precalc stuff here
	warpmode(0);
     960:	42a7           	clr.l -(sp)
     962:	4eba 653e      	jsr 6ea2 <warpmode>(pc)
     966:	588f           	addq.l #4,sp

	//TakeSystem();
	WaitVbl();
     968:	4eba fc2c      	jsr 596 <WaitVbl>(pc)
  
	c2p();
     96c:	4eba 0618      	jsr f86 <c2p>(pc)
  	Zoom_InitRun();
     970:	4eba 08be      	jsr 1230 <Zoom_InitRun>(pc)
	TakeSystem();
     974:	4eba fc6a      	jsr 5e0 <TakeSystem>(pc)
  	//RunTests();	//warpmode(1);
	// TODO: precalc stuff here
	//warpmode(0);

	WaitVbl();
     978:	4eba fc1c      	jsr 596 <WaitVbl>(pc)

	// DEMO

	RunDemo();
     97c:	4eba f998      	jsr 316 <RunDemo>(pc)

	// DEMO
	SetInterruptHandler((APTR)interruptHandler);
     980:	487a fe72      	pea 7f4 <interruptHandler.lto_priv.1>(pc)
     984:	4eba fbf4      	jsr 57a <SetInterruptHandler>(pc)
     988:	588f           	addq.l #4,sp
	custom->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     98a:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     990:	317c c020 009a 	move.w #-16352,154(a0)
	custom->intreq=1<<INTB_VERTB;//reset vbl req
     996:	2079 0016 b9b4 	movea.l 16b9b4 <custom>,a0
     99c:	317c 0020 009c 	move.w #32,156(a0)

	// END
	FreeSystem();
     9a2:	4eba fd48      	jsr 6ec <FreeSystem>(pc)

	CloseLibrary((struct Library*)DOSBase);
     9a6:	2f79 0016 b9b8 	move.l 16b9b8 <DOSBase>,16(sp)
     9ac:	0010 
     9ae:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
     9b4:	2c40           	movea.l d0,a6
     9b6:	226f 0010      	movea.l 16(sp),a1
     9ba:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     9be:	2f79 0016 b9bc 	move.l 16b9bc <GfxBase>,12(sp)
     9c4:	000c 
     9c6:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
     9cc:	2c40           	movea.l d0,a6
     9ce:	226f 000c      	movea.l 12(sp),a1
     9d2:	4eae fe62      	jsr -414(a6)
     9d6:	7000           	moveq #0,d0
}
     9d8:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     9dc:	4fef 0044      	lea 68(sp),sp
     9e0:	4e75           	rts

000009e2 <SwScrollerTest>:

char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
     9e2:	4fef ff98      	lea -104(sp),sp
     9e6:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  PrepareDisplaySW();
     9ea:	4eba 0218      	jsr c04 <PrepareDisplaySW>(pc)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     9ee:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
     9f4:	4878 0010      	pea 10 <_start+0x10>
     9f8:	4879 0000 a5dc 	pea a5dc <ClsSprites>
     9fe:	42a7           	clr.l -(sp)
     a00:	2f00           	move.l d0,-(sp)
     a02:	4eba 1d56      	jsr 275a <TestCopperlistBatch>(pc)
     a06:	4fef 0010      	lea 16(sp),sp
     a0a:	4a80           	tst.l d0
     a0c:	6642           	bne.s a50 <SwScrollerTest+0x6e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     a0e:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     a14:	2c40           	movea.l d0,a6
     a16:	4eae ffc4      	jsr -60(a6)
     a1a:	2f40 0070      	move.l d0,112(sp)
     a1e:	202f 0070      	move.l 112(sp),d0
     a22:	2f40 006c      	move.l d0,108(sp)
     a26:	2f7c 0000 75a0 	move.l #30112,104(sp)
     a2c:	0068 
     a2e:	702c           	moveq #44,d0
     a30:	2f40 0064      	move.l d0,100(sp)
     a34:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     a3a:	2c40           	movea.l d0,a6
     a3c:	222f 006c      	move.l 108(sp),d1
     a40:	242f 0068      	move.l 104(sp),d2
     a44:	262f 0064      	move.l 100(sp),d3
     a48:	4eae ffd0      	jsr -48(a6)
     a4c:	2f40 0060      	move.l d0,96(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     a50:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
     a56:	4878 000c      	pea c <_start+0xc>
     a5a:	4879 0000 a61c 	pea a61c <ClScreen>
     a60:	4878 0010      	pea 10 <_start+0x10>
     a64:	2f00           	move.l d0,-(sp)
     a66:	4eba 1cf2      	jsr 275a <TestCopperlistBatch>(pc)
     a6a:	4fef 0010      	lea 16(sp),sp
     a6e:	4a80           	tst.l d0
     a70:	6642           	bne.s ab4 <SwScrollerTest+0xd2>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     a72:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     a78:	2c40           	movea.l d0,a6
     a7a:	4eae ffc4      	jsr -60(a6)
     a7e:	2f40 005c      	move.l d0,92(sp)
     a82:	202f 005c      	move.l 92(sp),d0
     a86:	2f40 0058      	move.l d0,88(sp)
     a8a:	2f7c 0000 75d6 	move.l #30166,84(sp)
     a90:	0054 
     a92:	7036           	moveq #54,d0
     a94:	2f40 0050      	move.l d0,80(sp)
     a98:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     a9e:	2c40           	movea.l d0,a6
     aa0:	222f 0058      	move.l 88(sp),d1
     aa4:	242f 0054      	move.l 84(sp),d2
     aa8:	262f 0050      	move.l 80(sp),d3
     aac:	4eae ffd0      	jsr -48(a6)
     ab0:	2f40 004c      	move.l d0,76(sp)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     ab4:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
     aba:	4878 0002      	pea 2 <_start+0x2>
     abe:	4879 0000 a55c 	pea a55c <ClColor>
     ac4:	4878 001e      	pea 1e <_start+0x1e>
     ac8:	2f00           	move.l d0,-(sp)
     aca:	4eba 1c8e      	jsr 275a <TestCopperlistBatch>(pc)
     ace:	4fef 0010      	lea 16(sp),sp
     ad2:	4a80           	tst.l d0
     ad4:	6642           	bne.s b18 <SwScrollerTest+0x136>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     ad6:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     adc:	2c40           	movea.l d0,a6
     ade:	4eae ffc4      	jsr -60(a6)
     ae2:	2f40 0048      	move.l d0,72(sp)
     ae6:	202f 0048      	move.l 72(sp),d0
     aea:	2f40 0044      	move.l d0,68(sp)
     aee:	2f7c 0000 760d 	move.l #30221,64(sp)
     af4:	0040 
     af6:	7021           	moveq #33,d0
     af8:	2f40 003c      	move.l d0,60(sp)
     afc:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     b02:	2c40           	movea.l d0,a6
     b04:	222f 0044      	move.l 68(sp),d1
     b08:	242f 0040      	move.l 64(sp),d2
     b0c:	262f 003c      	move.l 60(sp),d3
     b10:	4eae ffd0      	jsr -48(a6)
     b14:	2f40 0038      	move.l d0,56(sp)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     b18:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
     b1e:	4878 fffe      	pea fffffffe <_end+0xffe945fa>
     b22:	4878 0020      	pea 20 <_start+0x20>
     b26:	2f00           	move.l d0,-(sp)
     b28:	4eba 1c6e      	jsr 2798 <TestCopperlistPos>(pc)
     b2c:	4fef 000c      	lea 12(sp),sp
     b30:	4a80           	tst.l d0
     b32:	6642           	bne.s b76 <SwScrollerTest+0x194>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     b34:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     b3a:	2c40           	movea.l d0,a6
     b3c:	4eae ffc4      	jsr -60(a6)
     b40:	2f40 0034      	move.l d0,52(sp)
     b44:	202f 0034      	move.l 52(sp),d0
     b48:	2f40 0030      	move.l d0,48(sp)
     b4c:	2f7c 0000 762f 	move.l #30255,44(sp)
     b52:	002c 
     b54:	7022           	moveq #34,d0
     b56:	2f40 0028      	move.l d0,40(sp)
     b5a:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     b60:	2c40           	movea.l d0,a6
     b62:	222f 0030      	move.l 48(sp),d1
     b66:	242f 002c      	move.l 44(sp),d2
     b6a:	262f 0028      	move.l 40(sp),d3
     b6e:	4eae ffd0      	jsr -48(a6)
     b72:	2f40 0024      	move.l d0,36(sp)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     b76:	2239 0000 b798 	move.l b798 <sw_text>,d1
     b7c:	2039 0016 b99c 	move.l 16b99c <DrawBuffer>,d0
     b82:	2f01           	move.l d1,-(sp)
     b84:	2f00           	move.l d0,-(sp)
     b86:	4879 0000 b79c 	pea b79c <sw_testfont>
     b8c:	4eba 0380      	jsr f0e <WriteFont>(pc)
     b90:	4fef 000c      	lea 12(sp),sp

  UWORD *tstpointer = (UWORD *)DrawBuffer;
     b94:	2f79 0016 b99c 	move.l 16b99c <DrawBuffer>,32(sp)
     b9a:	0020 
  if( *tstpointer != 0xff00)
     b9c:	206f 0020      	movea.l 32(sp),a0
     ba0:	3010           	move.w (a0),d0
     ba2:	0c40 ff00      	cmpi.w #-256,d0
     ba6:	6742           	beq.s bea <SwScrollerTest+0x208>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     ba8:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     bae:	2c40           	movea.l d0,a6
     bb0:	4eae ffc4      	jsr -60(a6)
     bb4:	2f40 001c      	move.l d0,28(sp)
     bb8:	202f 001c      	move.l 28(sp),d0
     bbc:	2f40 0018      	move.l d0,24(sp)
     bc0:	2f7c 0000 7652 	move.l #30290,20(sp)
     bc6:	0014 
     bc8:	7031           	moveq #49,d0
     bca:	2f40 0010      	move.l d0,16(sp)
     bce:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     bd4:	2c40           	movea.l d0,a6
     bd6:	222f 0018      	move.l 24(sp),d1
     bda:	242f 0014      	move.l 20(sp),d2
     bde:	262f 0010      	move.l 16(sp),d3
     be2:	4eae ffd0      	jsr -48(a6)
     be6:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
     bea:	2f3c 0000 c800 	move.l #51200,-(sp)
     bf0:	4878 0084      	pea 84 <_start+0x84>
     bf4:	4eba f4ea      	jsr e0 <FreeDisplay>(pc)
     bf8:	508f           	addq.l #8,sp
     bfa:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     bfe:	4fef 0068      	lea 104(sp),sp
     c02:	4e75           	rts

00000c04 <PrepareDisplaySW>:
 #include "swscroller.h"
 #include "utils.h"
 
 INCBIN(swfont, "raw/ruby16_8_1.raw");

 int PrepareDisplaySW() {
     c04:	4fef ffb8      	lea -72(sp),sp
     c08:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildSW();
     c0c:	4eba 017e      	jsr d8c <ClbuildSW>(pc)
     c10:	23c0 0016 b994 	move.l d0,16b994 <Copperlist1>
  Copperlist2 = ClbuildSW();
     c16:	4eba 0174      	jsr d8c <ClbuildSW>(pc)
     c1a:	23c0 0016 b998 	move.l d0,16b998 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     c20:	2f7c 0000 c800 	move.l #51200,80(sp)
     c26:	0050 
     c28:	7002           	moveq #2,d0
     c2a:	2f40 004c      	move.l d0,76(sp)
     c2e:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
     c34:	2c40           	movea.l d0,a6
     c36:	202f 0050      	move.l 80(sp),d0
     c3a:	222f 004c      	move.l 76(sp),d1
     c3e:	4eae ff3a      	jsr -198(a6)
     c42:	2f40 0048      	move.l d0,72(sp)
     c46:	202f 0048      	move.l 72(sp),d0
     c4a:	23c0 0016 b98c 	move.l d0,16b98c <Bitplane1>
  if(Bitplane1 == 0) {
     c50:	2039 0016 b98c 	move.l 16b98c <Bitplane1>,d0
     c56:	6658           	bne.s cb0 <PrepareDisplaySW+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     c58:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     c5e:	2c40           	movea.l d0,a6
     c60:	4eae ffc4      	jsr -60(a6)
     c64:	2f40 0044      	move.l d0,68(sp)
     c68:	202f 0044      	move.l 68(sp),d0
     c6c:	2f40 0040      	move.l d0,64(sp)
     c70:	2f7c 0000 7c35 	move.l #31797,60(sp)
     c76:	003c 
     c78:	7026           	moveq #38,d0
     c7a:	2f40 0038      	move.l d0,56(sp)
     c7e:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     c84:	2c40           	movea.l d0,a6
     c86:	222f 0040      	move.l 64(sp),d1
     c8a:	242f 003c      	move.l 60(sp),d2
     c8e:	262f 0038      	move.l 56(sp),d3
     c92:	4eae ffd0      	jsr -48(a6)
     c96:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
     c9a:	7001           	moveq #1,d0
     c9c:	2f40 0030      	move.l d0,48(sp)
     ca0:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     ca6:	2c40           	movea.l d0,a6
     ca8:	222f 0030      	move.l 48(sp),d1
     cac:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
     cb0:	2039 0016 b98c 	move.l 16b98c <Bitplane1>,d0
     cb6:	23c0 0016 b99c 	move.l d0,16b99c <DrawBuffer>
  DrawCopper = Copperlist1;
     cbc:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
     cc2:	23c0 0016 b9a4 	move.l d0,16b9a4 <DrawCopper>
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     cc8:	2f7c 0000 c800 	move.l #51200,44(sp)
     cce:	002c 
     cd0:	7002           	moveq #2,d0
     cd2:	2f40 0028      	move.l d0,40(sp)
     cd6:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
     cdc:	2c40           	movea.l d0,a6
     cde:	202f 002c      	move.l 44(sp),d0
     ce2:	222f 0028      	move.l 40(sp),d1
     ce6:	4eae ff3a      	jsr -198(a6)
     cea:	2f40 0024      	move.l d0,36(sp)
     cee:	202f 0024      	move.l 36(sp),d0
     cf2:	23c0 0016 b990 	move.l d0,16b990 <Bitplane2>
  if(Bitplane2 == 0) {
     cf8:	2039 0016 b990 	move.l 16b990 <Bitplane2>,d0
     cfe:	6658           	bne.s d58 <PrepareDisplaySW+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     d00:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     d06:	2c40           	movea.l d0,a6
     d08:	4eae ffc4      	jsr -60(a6)
     d0c:	2f40 0020      	move.l d0,32(sp)
     d10:	202f 0020      	move.l 32(sp),d0
     d14:	2f40 001c      	move.l d0,28(sp)
     d18:	2f7c 0000 7c5c 	move.l #31836,24(sp)
     d1e:	0018 
     d20:	7026           	moveq #38,d0
     d22:	2f40 0014      	move.l d0,20(sp)
     d26:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     d2c:	2c40           	movea.l d0,a6
     d2e:	222f 001c      	move.l 28(sp),d1
     d32:	242f 0018      	move.l 24(sp),d2
     d36:	262f 0014      	move.l 20(sp),d3
     d3a:	4eae ffd0      	jsr -48(a6)
     d3e:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     d42:	7001           	moveq #1,d0
     d44:	2f40 000c      	move.l d0,12(sp)
     d48:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     d4e:	2c40           	movea.l d0,a6
     d50:	222f 000c      	move.l 12(sp),d1
     d54:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
     d58:	2039 0016 b990 	move.l 16b990 <Bitplane2>,d0
     d5e:	23c0 0016 b9a0 	move.l d0,16b9a0 <ViewBuffer>
  ViewCopper = Copperlist2;
     d64:	2039 0016 b998 	move.l 16b998 <Copperlist2>,d0
     d6a:	23c0 0016 b9a8 	move.l d0,16b9a8 <ViewCopper>
  SwapCl();
     d70:	4eba f482      	jsr 1f4 <SwapCl>(pc)
  SetBplPointers();
     d74:	4eba f420      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
     d78:	4eba f47a      	jsr 1f4 <SwapCl>(pc)
  SetBplPointers();
     d7c:	4eba f418      	jsr 196 <SetBplPointers>(pc)
  return 0;
     d80:	7000           	moveq #0,d0
}
     d82:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     d86:	4fef 0048      	lea 72(sp),sp
     d8a:	4e75           	rts

00000d8c <ClbuildSW>:

ULONG * ClbuildSW() {
     d8c:	4fef ffc4      	lea -60(sp),sp
     d90:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
     d94:	2f7c 0000 0084 	move.l #132,48(sp)
     d9a:	0030 
     d9c:	7002           	moveq #2,d0
     d9e:	2f40 002c      	move.l d0,44(sp)
     da2:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
     da8:	2c40           	movea.l d0,a6
     daa:	202f 0030      	move.l 48(sp),d0
     dae:	222f 002c      	move.l 44(sp),d1
     db2:	4eae ff3a      	jsr -198(a6)
     db6:	2f40 0028      	move.l d0,40(sp)
     dba:	202f 0028      	move.l 40(sp),d0
     dbe:	2f40 0024      	move.l d0,36(sp)
  
  if( retval == 0) {
     dc2:	6658           	bne.s e1c <ClbuildSW+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     dc4:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     dca:	2c40           	movea.l d0,a6
     dcc:	4eae ffc4      	jsr -60(a6)
     dd0:	2f40 0020      	move.l d0,32(sp)
     dd4:	202f 0020      	move.l 32(sp),d0
     dd8:	2f40 001c      	move.l d0,28(sp)
     ddc:	2f7c 0000 7c83 	move.l #31875,24(sp)
     de2:	0018 
     de4:	7228           	moveq #40,d1
     de6:	2f41 0014      	move.l d1,20(sp)
     dea:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     df0:	2c40           	movea.l d0,a6
     df2:	222f 001c      	move.l 28(sp),d1
     df6:	242f 0018      	move.l 24(sp),d2
     dfa:	262f 0014      	move.l 20(sp),d3
     dfe:	4eae ffd0      	jsr -48(a6)
     e02:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     e06:	7401           	moveq #1,d2
     e08:	2f42 000c      	move.l d2,12(sp)
     e0c:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
     e12:	2c40           	movea.l d0,a6
     e14:	222f 000c      	move.l 12(sp),d1
     e18:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
     e1c:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
     e22:	2f7c 0000 a5dc 	move.l #42460,64(sp)
     e28:	0040 
  for(int i=0; i<16;i++)
     e2a:	42af 003c      	clr.l 60(sp)
     e2e:	6024           	bra.s e54 <ClbuildSW+0xc8>
    *cl++ = *clpartinstruction++;
     e30:	222f 0040      	move.l 64(sp),d1
     e34:	2001           	move.l d1,d0
     e36:	5880           	addq.l #4,d0
     e38:	2f40 0040      	move.l d0,64(sp)
     e3c:	202f 0044      	move.l 68(sp),d0
     e40:	2400           	move.l d0,d2
     e42:	5882           	addq.l #4,d2
     e44:	2f42 0044      	move.l d2,68(sp)
     e48:	2041           	movea.l d1,a0
     e4a:	2210           	move.l (a0),d1
     e4c:	2040           	movea.l d0,a0
     e4e:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
     e50:	52af 003c      	addq.l #1,60(sp)
     e54:	700f           	moveq #15,d0
     e56:	b0af 003c      	cmp.l 60(sp),d0
     e5a:	6cd4           	bge.s e30 <ClbuildSW+0xa4>
  clpartinstruction = ClScreen;
     e5c:	2f7c 0000 a61c 	move.l #42524,64(sp)
     e62:	0040 
  for(int i=0; i<12;i++)
     e64:	42af 0038      	clr.l 56(sp)
     e68:	6024           	bra.s e8e <ClbuildSW+0x102>
    *cl++ = *clpartinstruction++;
     e6a:	222f 0040      	move.l 64(sp),d1
     e6e:	2401           	move.l d1,d2
     e70:	5882           	addq.l #4,d2
     e72:	2f42 0040      	move.l d2,64(sp)
     e76:	202f 0044      	move.l 68(sp),d0
     e7a:	2400           	move.l d0,d2
     e7c:	5882           	addq.l #4,d2
     e7e:	2f42 0044      	move.l d2,68(sp)
     e82:	2041           	movea.l d1,a0
     e84:	2210           	move.l (a0),d1
     e86:	2040           	movea.l d0,a0
     e88:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
     e8a:	52af 0038      	addq.l #1,56(sp)
     e8e:	700b           	moveq #11,d0
     e90:	b0af 0038      	cmp.l 56(sp),d0
     e94:	6cd4           	bge.s e6a <ClbuildSW+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
     e96:	202f 0044      	move.l 68(sp),d0
     e9a:	2200           	move.l d0,d1
     e9c:	5881           	addq.l #4,d1
     e9e:	2f41 0044      	move.l d1,68(sp)
     ea2:	2040           	movea.l d0,a0
     ea4:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
     eaa:	202f 0044      	move.l 68(sp),d0
     eae:	2200           	move.l d0,d1
     eb0:	5881           	addq.l #4,d1
     eb2:	2f41 0044      	move.l d1,68(sp)
     eb6:	2040           	movea.l d0,a0
     eb8:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
     ebe:	2f7c 0000 a55c 	move.l #42332,64(sp)
     ec4:	0040 
  for(int i=0; i<2;i++)
     ec6:	42af 0034      	clr.l 52(sp)
     eca:	6024           	bra.s ef0 <ClbuildSW+0x164>
    *cl++ = *clpartinstruction++;
     ecc:	222f 0040      	move.l 64(sp),d1
     ed0:	2001           	move.l d1,d0
     ed2:	5880           	addq.l #4,d0
     ed4:	2f40 0040      	move.l d0,64(sp)
     ed8:	202f 0044      	move.l 68(sp),d0
     edc:	2400           	move.l d0,d2
     ede:	5882           	addq.l #4,d2
     ee0:	2f42 0044      	move.l d2,68(sp)
     ee4:	2041           	movea.l d1,a0
     ee6:	2210           	move.l (a0),d1
     ee8:	2040           	movea.l d0,a0
     eea:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
     eec:	52af 0034      	addq.l #1,52(sp)
     ef0:	7001           	moveq #1,d0
     ef2:	b0af 0034      	cmp.l 52(sp),d0
     ef6:	6cd4           	bge.s ecc <ClbuildSW+0x140>

  *cl = 0xfffffffe;
     ef8:	206f 0044      	movea.l 68(sp),a0
     efc:	72fe           	moveq #-2,d1
     efe:	2081           	move.l d1,(a0)

  return retval;
     f00:	202f 0024      	move.l 36(sp),d0
}
     f04:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     f08:	4fef 003c      	lea 60(sp),sp
     f0c:	4e75           	rts

00000f0e <WriteFont>:

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
     f0e:	4fef fff0      	lea -16(sp),sp
  UWORD *bmpptr = Destination;
     f12:	2f6f 0018 000c 	move.l 24(sp),12(sp)
  UWORD *fntptr = font;
     f18:	2f6f 0014 0008 	move.l 20(sp),8(sp)

  char charpos = *text;
     f1e:	206f 001c      	movea.l 28(sp),a0
     f22:	1f50 0003      	move.b (a0),3(sp)
  charpos -= 0x20;
     f26:	102f 0003      	move.b 3(sp),d0
     f2a:	0600 ffe0      	addi.b #-32,d0
     f2e:	1f40 0003      	move.b d0,3(sp)
  charpos = charpos<<3;
     f32:	102f 0003      	move.b 3(sp),d0
     f36:	4880           	ext.w d0
     f38:	48c0           	ext.l d0
     f3a:	e788           	lsl.l #3,d0
     f3c:	1f40 0003      	move.b d0,3(sp)
  fntptr += charpos;
     f40:	102f 0003      	move.b 3(sp),d0
     f44:	4880           	ext.w d0
     f46:	3040           	movea.w d0,a0
     f48:	2008           	move.l a0,d0
     f4a:	d088           	add.l a0,d0
     f4c:	d1af 0008      	add.l d0,8(sp)
  for(int i=1;i<=8;i++) {
     f50:	7001           	moveq #1,d0
     f52:	2f40 0004      	move.l d0,4(sp)
     f56:	6020           	bra.s f78 <WriteFont+0x6a>
    *bmpptr = *fntptr++;
     f58:	202f 0008      	move.l 8(sp),d0
     f5c:	2200           	move.l d0,d1
     f5e:	5481           	addq.l #2,d1
     f60:	2f41 0008      	move.l d1,8(sp)
     f64:	2040           	movea.l d0,a0
     f66:	3010           	move.w (a0),d0
     f68:	206f 000c      	movea.l 12(sp),a0
     f6c:	3080           	move.w d0,(a0)
    bmpptr += 40;
     f6e:	7050           	moveq #80,d0
     f70:	d1af 000c      	add.l d0,12(sp)
  for(int i=1;i<=8;i++) {
     f74:	52af 0004      	addq.l #1,4(sp)
     f78:	7208           	moveq #8,d1
     f7a:	b2af 0004      	cmp.l 4(sp),d1
     f7e:	6cd8           	bge.s f58 <WriteFont+0x4a>
  }

}
     f80:	4fef 0010      	lea 16(sp),sp
     f84:	4e75           	rts

00000f86 <c2p>:
INCBIN_CHIP(rawzoom11, "raw/zoom_11.raw ");
INCBIN_CHIP(rawzoom12, "raw/zoom_12.raw ");
INCBIN_CHIP(rawzoom13, "raw/zoom_13.raw ");
INCBIN_CHIP(rawzoom14, "raw/zoom_14.raw ");

void c2p() {
     f86:	4fef fff4      	lea -12(sp),sp
  c2p1x1_8_c5_gen_init( 336, 268, 0, 0, 0, 0);
     f8a:	42a7           	clr.l -(sp)
     f8c:	42a7           	clr.l -(sp)
     f8e:	42a7           	clr.l -(sp)
     f90:	42a7           	clr.l -(sp)
     f92:	4878 010c      	pea 10c <FreeDisplay+0x2c>
     f96:	4878 0150      	pea 150 <FreeDisplay+0x70>
     f9a:	4eb9 0000 71a8 	jsr 71a8 <c2p1x1_8_c5_gen_init>
     fa0:	4fef 0018      	lea 24(sp),sp
  UWORD *src = rawzoom;
     fa4:	2f79 0000 b7f4 	move.l b7f4 <rawzoom>,8(sp)
     faa:	0008 
  UWORD *dst = framebuffer;
     fac:	2f79 0000 b7f0 	move.l b7f0 <framebuffer>,4(sp)
     fb2:	0004 
  for(int i=0;i<=14;i++) {
     fb4:	4297           	clr.l (sp)
     fb6:	6022           	bra.s fda <c2p+0x54>
    c2p1x1_8_c5_gen( src, dst);
     fb8:	2f2f 0004      	move.l 4(sp),-(sp)
     fbc:	2f2f 000c      	move.l 12(sp),-(sp)
     fc0:	4eb9 0000 7224 	jsr 7224 <c2p1x1_8_c5_gen>
     fc6:	508f           	addq.l #8,sp
    src += 45025;
     fc8:	06af 0001 5fc2 	addi.l #90050,8(sp)
     fce:	0008 
    dst += 28140;
     fd0:	06af 0000 dbd8 	addi.l #56280,4(sp)
     fd6:	0004 
  for(int i=0;i<=14;i++) {
     fd8:	5297           	addq.l #1,(sp)
     fda:	700e           	moveq #14,d0
     fdc:	b097           	cmp.l (sp),d0
     fde:	6cd8           	bge.s fb8 <c2p+0x32>
  //Utils_FillLong( framebuffer, 0xaaaaaaaa, 1, 2856, 0); 
  /*Utils_FillLong( framebuffer+2856, 0x0, 1,2856, 0);
  Utils_FillLong( framebuffer+2856*2, 0x0, 1, 2856, 0);
  Utils_FillLong( framebuffer+2856*3, 0x0, 1, 2856, 0);
  Utils_FillLong( framebuffer+2856*4, 0x0, 1, 2856, 0);*/
}
     fe0:	4fef 000c      	lea 12(sp),sp
     fe4:	4e75           	rts

00000fe6 <Zoom_VblankHandler>:

void Zoom_VblankHandler() {
  
  Zoom_Counter++;
     fe6:	3039 0016 b9ea 	move.w 16b9ea <Zoom_Counter>,d0
     fec:	5240           	addq.w #1,d0
     fee:	33c0 0016 b9ea 	move.w d0,16b9ea <Zoom_Counter>
  SwapCl();
     ff4:	4eba f1fe      	jsr 1f4 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     ff8:	33fc 0001 0016 	move.w #1,16b9f0 <Zoom_MouseReleased>
     ffe:	b9f0 
  if( MouseLeft())
    1000:	4eba f2b4      	jsr 2b6 <MouseLeft>(pc)
    1004:	4a40           	tst.w d0
    1006:	6708           	beq.s 1010 <Zoom_VblankHandler+0x2a>
    Zoom_Mousepressed = 1;
    1008:	33fc 0001 0016 	move.w #1,16b9f2 <Zoom_Mousepressed>
    100e:	b9f2 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
    1010:	3039 0016 b9f2 	move.w 16b9f2 <Zoom_Mousepressed>,d0
    1016:	0c40 0001      	cmpi.w #1,d0
    101a:	6616           	bne.s 1032 <Zoom_VblankHandler+0x4c>
    101c:	4eba f298      	jsr 2b6 <MouseLeft>(pc)
    1020:	4a40           	tst.w d0
    1022:	660e           	bne.s 1032 <Zoom_VblankHandler+0x4c>
    Zoom_MouseReleased = 1;
    1024:	33fc 0001 0016 	move.w #1,16b9f0 <Zoom_MouseReleased>
    102a:	b9f0 
    Zoom_Mousepressed = 0;
    102c:	4279 0016 b9f2 	clr.w 16b9f2 <Zoom_Mousepressed>
  }
    if( Zoom_MouseReleased == 1) {
    1032:	3039 0016 b9f0 	move.w 16b9f0 <Zoom_MouseReleased>,d0
    1038:	0c40 0001      	cmpi.w #1,d0
    103c:	6660           	bne.s 109e <Zoom_VblankHandler+0xb8>
      Zoom_MouseReleased = 0;
    103e:	4279 0016 b9f0 	clr.w 16b9f0 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 0) {
    1044:	3039 0016 b9f8 	move.w 16b9f8 <Zoom_LevelOf102Zoom>,d0
    104a:	6644           	bne.s 1090 <Zoom_VblankHandler+0xaa>
 
        if( Zoom_LevelOfZoom == 14)
    104c:	3039 0016 b9f6 	move.w 16b9f6 <Zoom_LevelOfZoom>,d0
    1052:	0c40 000e      	cmpi.w #14,d0
    1056:	660a           	bne.s 1062 <Zoom_VblankHandler+0x7c>
          Zoom_LevelOfZoom = 0;
    1058:	33fc 0000 0016 	move.w #0,16b9f6 <Zoom_LevelOfZoom>
    105e:	b9f6 
    1060:	600e           	bra.s 1070 <Zoom_VblankHandler+0x8a>
        else
          Zoom_LevelOfZoom++;
    1062:	3039 0016 b9f6 	move.w 16b9f6 <Zoom_LevelOfZoom>,d0
    1068:	5240           	addq.w #1,d0
    106a:	33c0 0016 b9f6 	move.w d0,16b9f6 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
    1070:	33fc 000f 0016 	move.w #15,16b9f8 <Zoom_LevelOf102Zoom>
    1076:	b9f8 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
    1078:	3039 0016 b9f6 	move.w 16b9f6 <Zoom_LevelOfZoom>,d0
    107e:	3000           	move.w d0,d0
    1080:	0280 0000 ffff 	andi.l #65535,d0
    1086:	2f00           	move.l d0,-(sp)
    1088:	4eba 0dba      	jsr 1e44 <Zoom_SwapBuffers>(pc)
    108c:	588f           	addq.l #4,sp
    108e:	600e           	bra.s 109e <Zoom_VblankHandler+0xb8>
      } else 
        Zoom_LevelOf102Zoom--;
    1090:	3039 0016 b9f8 	move.w 16b9f8 <Zoom_LevelOf102Zoom>,d0
    1096:	5340           	subq.w #1,d0
    1098:	33c0 0016 b9f8 	move.w d0,16b9f8 <Zoom_LevelOf102Zoom>
    }
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
    109e:	2239 0016 b9a4 	move.l 16b9a4 <DrawCopper>,d1
    10a4:	3039 0016 b9f8 	move.w 16b9f8 <Zoom_LevelOf102Zoom>,d0
    10aa:	3000           	move.w d0,d0
    10ac:	0280 0000 ffff 	andi.l #65535,d0
    10b2:	2f01           	move.l d1,-(sp)
    10b4:	2f00           	move.l d0,-(sp)
    10b6:	4eba f3ba      	jsr 472 <Zoom_Shrink102>(pc)
    10ba:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
    10bc:	2239 0016 b9a4 	move.l 16b9a4 <DrawCopper>,d1
    10c2:	2039 0016 b9a0 	move.l 16b9a0 <ViewBuffer>,d0
    10c8:	2f01           	move.l d1,-(sp)
    10ca:	2f00           	move.l d0,-(sp)
    10cc:	4eba 0d1c      	jsr 1dea <Zoom_SetBplPointers>(pc)
    10d0:	508f           	addq.l #8,sp
 
}
    10d2:	4e75           	rts

000010d4 <Zoom_LoadImage>:

void Zoom_LoadImage( ULONG *destination) {  
    10d4:	4fef fff4      	lea -12(sp),sp
    10d8:	2f0e           	move.l a6,-(sp)
  CopyMem( rawzoom, destination, ZMBPLSIZE);
    10da:	2f79 0000 b7f4 	move.l b7f4 <rawzoom>,12(sp)
    10e0:	000c 
    10e2:	2f6f 0014 0008 	move.l 20(sp),8(sp)
    10e8:	2f7c 0000 df20 	move.l #57120,4(sp)
    10ee:	0004 
    10f0:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    10f6:	2c40           	movea.l d0,a6
    10f8:	206f 000c      	movea.l 12(sp),a0
    10fc:	226f 0008      	movea.l 8(sp),a1
    1100:	202f 0004      	move.l 4(sp),d0
    1104:	4eae fd90      	jsr -624(a6)
}
    1108:	2c5f           	movea.l (sp)+,a6
    110a:	4fef 000c      	lea 12(sp),sp
    110e:	4e75           	rts

00001110 <Zoom_CopyWord>:

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080008, 
                                                       0x010a0000, 0x01001200 };

void  Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height) {  
    1110:	598f           	subq.l #4,sp
    1112:	202f 0010      	move.l 16(sp),d0
    1116:	3000           	move.w d0,d0
    1118:	3f40 0002      	move.w d0,2(sp)

  WaitBlt();
    111c:	4eba ef96      	jsr b4 <WaitBlt>(pc)

  hw->bltapt = (UWORD *) source;
    1120:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    1126:	216f 0008 0050 	move.l 8(sp),80(a0)
  hw->bltdpt = (UWORD *) destination;
    112c:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    1132:	216f 000c 0054 	move.l 12(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    1138:	302f 0002      	move.w 2(sp),d0
    113c:	ed48           	lsl.w #6,d0
    113e:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    1144:	5440           	addq.w #2,d0
    1146:	3140 0058      	move.w d0,88(a0)

}
    114a:	588f           	addq.l #4,sp
    114c:	4e75           	rts

0000114e <Zoom_ZoomBlit>:

void Zoom_ZoomBlit( UWORD *source, UWORD *destination, UWORD height) {
    114e:	518f           	subq.l #8,sp
    1150:	202f 0014      	move.l 20(sp),d0
    1154:	3000           	move.w d0,d0
    1156:	3f40 0002      	move.w d0,2(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B

  UWORD *blta = source + ZoomBlit_Increment4SrcA;
    115a:	3039 0016 b9e0 	move.w 16b9e0 <ZoomBlit_Increment4SrcA>,d0
    1160:	3000           	move.w d0,d0
    1162:	0280 0000 ffff 	andi.l #65535,d0
    1168:	d080           	add.l d0,d0
    116a:	222f 000c      	move.l 12(sp),d1
    116e:	d280           	add.l d0,d1
    1170:	2f41 0004      	move.l d1,4(sp)
  WaitBlt();
    1174:	4eba ef3e      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  
  hw->bltapt = blta;
    1178:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    117e:	216f 0004 0050 	move.l 4(sp),80(a0)
  hw->bltbpt = source;
    1184:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    118a:	216f 000c 004c 	move.l 12(sp),76(a0)
  hw->bltdpt = destination;
    1190:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    1196:	216f 0010 0054 	move.l 16(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    119c:	302f 0002      	move.w 2(sp),d0
    11a0:	ed48           	lsl.w #6,d0
    11a2:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    11a8:	5440           	addq.w #2,d0
    11aa:	3140 0058      	move.w d0,88(a0)

}
    11ae:	508f           	addq.l #8,sp
    11b0:	4e75           	rts

000011b2 <Zoom_ZoomBlit2>:

void Zoom_ZoomBlit2( UWORD *src4a, UWORD *src4b, UWORD *dst, UWORD height,
                                                 UWORD bltamod, UWORD bltbmod
                                                        , UWORD numofwords) {
    11b2:	518f           	subq.l #8,sp
    11b4:	226f 0018      	movea.l 24(sp),a1
    11b8:	206f 001c      	movea.l 28(sp),a0
    11bc:	222f 0020      	move.l 32(sp),d1
    11c0:	202f 0024      	move.l 36(sp),d0
    11c4:	3249           	movea.w a1,a1
    11c6:	3f49 0006      	move.w a1,6(sp)
    11ca:	3048           	movea.w a0,a0
    11cc:	3f48 0004      	move.w a0,4(sp)
    11d0:	3201           	move.w d1,d1
    11d2:	3f41 0002      	move.w d1,2(sp)
    11d6:	3000           	move.w d0,d0
    11d8:	3e80           	move.w d0,(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B
  hw->bltamod = bltamod;
    11da:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    11e0:	316f 0004 0064 	move.w 4(sp),100(a0)
  hw->bltbmod = bltbmod;  
    11e6:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    11ec:	316f 0002 0062 	move.w 2(sp),98(a0)
  hw->bltapt = src4a;
    11f2:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    11f8:	216f 000c 0050 	move.l 12(sp),80(a0)
  hw->bltbpt = src4b;
    11fe:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    1204:	216f 0010 004c 	move.l 16(sp),76(a0)
  hw->bltdpt = dst;
    120a:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    1210:	216f 0014 0054 	move.l 20(sp),84(a0)
  hw->bltsize = (height<<6)+numofwords;
    1216:	302f 0006      	move.w 6(sp),d0
    121a:	ed48           	lsl.w #6,d0
    121c:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    1222:	d057           	add.w (sp),d0
    1224:	3140 0058      	move.w d0,88(a0)
  
  WaitBlt();
    1228:	4eba ee8a      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a  

}
    122c:	508f           	addq.l #8,sp
    122e:	4e75           	rts

00001230 <Zoom_InitRun>:


void Zoom_InitRun() {
    1230:	4fef ffe0      	lea -32(sp),sp
    1234:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    1236:	4279 0016 b9ea 	clr.w 16b9ea <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    123c:	7004           	moveq #4,d0
    123e:	2f40 0020      	move.l d0,32(sp)
    1242:	7002           	moveq #2,d0
    1244:	2f40 001c      	move.l d0,28(sp)
    1248:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    124e:	2c40           	movea.l d0,a6
    1250:	202f 0020      	move.l 32(sp),d0
    1254:	222f 001c      	move.l 28(sp),d1
    1258:	4eae ff3a      	jsr -198(a6)
    125c:	2f40 0018      	move.l d0,24(sp)
    1260:	202f 0018      	move.l 24(sp),d0
    1264:	23c0 0016 b9d8 	move.l d0,16b9d8 <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 15;
    126a:	33fc 000f 0016 	move.w #15,16b9f8 <Zoom_LevelOf102Zoom>
    1270:	b9f8 
  ZoomHorizontal = 16;
    1272:	33fc 0010 0016 	move.w #16,16b9fc <ZoomHorizontal>
    1278:	b9fc 
  Zoom_PrepareDisplay();
    127a:	4eba 0142      	jsr 13be <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 15, Copperlist1);
    127e:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    1284:	2f00           	move.l d0,-(sp)
    1286:	4878 000f      	pea f <_start+0xf>
    128a:	4eba f1e6      	jsr 472 <Zoom_Shrink102>(pc)
    128e:	508f           	addq.l #8,sp
  Zoom_Shrink102( 15, Copperlist2);
    1290:	2039 0016 b998 	move.l 16b998 <Copperlist2>,d0
    1296:	2f00           	move.l d0,-(sp)
    1298:	4878 000f      	pea f <_start+0xf>
    129c:	4eba f1d4      	jsr 472 <Zoom_Shrink102>(pc)
    12a0:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 1;
    12a2:	33fc 0001 0016 	move.w #1,16b9f6 <Zoom_LevelOfZoom>
    12a8:	b9f6 
  Zoom_Direction = 1;                                                  
    12aa:	33fc 0001 0016 	move.w #1,16b9fa <Zoom_Direction>
    12b0:	b9fa 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    12b2:	7016           	moveq #22,d0
    12b4:	2f40 0014      	move.l d0,20(sp)
    12b8:	2f7c 0001 0001 	move.l #65537,16(sp)
    12be:	0010 
    12c0:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    12c6:	2c40           	movea.l d0,a6
    12c8:	202f 0014      	move.l 20(sp),d0
    12cc:	222f 0010      	move.l 16(sp),d1
    12d0:	4eae ff3a      	jsr -198(a6)
    12d4:	2f40 000c      	move.l d0,12(sp)
    12d8:	202f 000c      	move.l 12(sp),d0
    12dc:	23c0 0016 b9e2 	move.l d0,16b9e2 <Zoom_vbint>
    12e2:	2039 0016 b9e2 	move.l 16b9e2 <Zoom_vbint>,d0
    12e8:	673e           	beq.s 1328 <Zoom_InitRun+0xf8>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    12ea:	2079 0016 b9e2 	movea.l 16b9e2 <Zoom_vbint>,a0
    12f0:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    12f6:	2079 0016 b9e2 	movea.l 16b9e2 <Zoom_vbint>,a0
    12fc:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    1302:	2079 0016 b9e2 	movea.l 16b9e2 <Zoom_vbint>,a0
    1308:	217c 0000 7ca9 	move.l #31913,10(a0)
    130e:	000a 
    Zoom_vbint->is_Data = NULL;
    1310:	2079 0016 b9e2 	movea.l 16b9e2 <Zoom_vbint>,a0
    1316:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    131a:	2079 0016 b9e2 	movea.l 16b9e2 <Zoom_vbint>,a0
    1320:	217c 0000 0fe6 	move.l #4070,18(a0)
    1326:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    1328:	7005           	moveq #5,d0
    132a:	2f40 0008      	move.l d0,8(sp)
    132e:	2f79 0016 b9e2 	move.l 16b9e2 <Zoom_vbint>,4(sp)
    1334:	0004 
    1336:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    133c:	2c40           	movea.l d0,a6
    133e:	202f 0008      	move.l 8(sp),d0
    1342:	226f 0004      	movea.l 4(sp),a1
    1346:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    134a:	2239 0016 b9a8 	move.l 16b9a8 <ViewCopper>,d1
    1350:	2039 0016 b9a0 	move.l 16b9a0 <ViewBuffer>,d0
    1356:	2f01           	move.l d1,-(sp)
    1358:	2f00           	move.l d0,-(sp)
    135a:	4eba 0a8e      	jsr 1dea <Zoom_SetBplPointers>(pc)
    135e:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    1360:	2239 0016 b9a4 	move.l 16b9a4 <DrawCopper>,d1
    1366:	2039 0016 b9a0 	move.l 16b9a0 <ViewBuffer>,d0
    136c:	2f01           	move.l d1,-(sp)
    136e:	2f00           	move.l d0,-(sp)
    1370:	4eba 0a78      	jsr 1dea <Zoom_SetBplPointers>(pc)
    1374:	508f           	addq.l #8,sp
  SwapCl();
    1376:	4eba ee7c      	jsr 1f4 <SwapCl>(pc)
  
}
    137a:	2c5f           	movea.l (sp)+,a6
    137c:	4fef 0020      	lea 32(sp),sp
    1380:	4e75           	rts

00001382 <Zoom_Dealloc>:

void Zoom_Dealloc() {
    1382:	518f           	subq.l #8,sp
    1384:	2f0e           	move.l a6,-(sp)
  RemIntServer(INTB_VERTB, Zoom_vbint);
    1386:	7005           	moveq #5,d0
    1388:	2f40 0008      	move.l d0,8(sp)
    138c:	2f79 0016 b9e2 	move.l 16b9e2 <Zoom_vbint>,4(sp)
    1392:	0004 
    1394:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    139a:	2c40           	movea.l d0,a6
    139c:	202f 0008      	move.l 8(sp),d0
    13a0:	226f 0004      	movea.l 4(sp),a1
    13a4:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    13a8:	2f3c 0000 df20 	move.l #57120,-(sp)
    13ae:	4878 031c      	pea 31c <RunDemo+0x6>
    13b2:	4eba ed2c      	jsr e0 <FreeDisplay>(pc)
    13b6:	508f           	addq.l #8,sp
}
    13b8:	2c5f           	movea.l (sp)+,a6
    13ba:	508f           	addq.l #8,sp
    13bc:	4e75           	rts

000013be <Zoom_PrepareDisplay>:
  
int Zoom_PrepareDisplay() {
  Zoom_SwapBuffers( 0);
    13be:	42a7           	clr.l -(sp)
    13c0:	4eba 0a82      	jsr 1e44 <Zoom_SwapBuffers>(pc)
    13c4:	588f           	addq.l #4,sp
  Copperlist1 = ClbuildZoom( );
    13c6:	4eba 007a      	jsr 1442 <ClbuildZoom>(pc)
    13ca:	23c0 0016 b994 	move.l d0,16b994 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    13d0:	4eba 0070      	jsr 1442 <ClbuildZoom>(pc)
    13d4:	23c0 0016 b998 	move.l d0,16b998 <Copperlist2>
  if(Bitplane2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;*/
  DrawCopper = Copperlist1;
    13da:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    13e0:	23c0 0016 b9a4 	move.l d0,16b9a4 <DrawCopper>
  ViewCopper = Copperlist2;
    13e6:	2039 0016 b998 	move.l 16b998 <Copperlist2>,d0
    13ec:	23c0 0016 b9a8 	move.l d0,16b9a8 <ViewCopper>
  return 0;
    13f2:	7000           	moveq #0,d0
}
    13f4:	4e75           	rts

000013f6 <Zoom_Init>:

void Zoom_Init() {
    13f6:	4fef fff4      	lea -12(sp),sp
    13fa:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    13fc:	7004           	moveq #4,d0
    13fe:	2f40 000c      	move.l d0,12(sp)
    1402:	7002           	moveq #2,d0
    1404:	2f40 0008      	move.l d0,8(sp)
    1408:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    140e:	2c40           	movea.l d0,a6
    1410:	202f 000c      	move.l 12(sp),d0
    1414:	222f 0008      	move.l 8(sp),d1
    1418:	4eae ff3a      	jsr -198(a6)
    141c:	2f40 0004      	move.l d0,4(sp)
    1420:	202f 0004      	move.l 4(sp),d0
    1424:	23c0 0016 b9d8 	move.l d0,16b9d8 <Zoom_ZoomBlitMask>
  ZoomHorizontal = 16;
    142a:	33fc 0010 0016 	move.w #16,16b9fc <ZoomHorizontal>
    1430:	b9fc 
  Zoom_LevelOf102Zoom = 15;
    1432:	33fc 000f 0016 	move.w #15,16b9f8 <Zoom_LevelOf102Zoom>
    1438:	b9f8 
}
    143a:	2c5f           	movea.l (sp)+,a6
    143c:	4fef 000c      	lea 12(sp),sp
    1440:	4e75           	rts

00001442 <ClbuildZoom>:


ULONG * ClbuildZoom() {
    1442:	4fef ffac      	lea -84(sp),sp
    1446:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    144a:	2f7c 0000 031c 	move.l #796,68(sp)
    1450:	0044 
    1452:	7002           	moveq #2,d0
    1454:	2f40 0040      	move.l d0,64(sp)
    1458:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    145e:	2c40           	movea.l d0,a6
    1460:	202f 0044      	move.l 68(sp),d0
    1464:	222f 0040      	move.l 64(sp),d1
    1468:	4eae ff3a      	jsr -198(a6)
    146c:	2f40 003c      	move.l d0,60(sp)
    1470:	202f 003c      	move.l 60(sp),d0
    1474:	2f40 0038      	move.l d0,56(sp)
  
  if( retval == 0) {
    1478:	6658           	bne.s 14d2 <ClbuildZoom+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    147a:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    1480:	2c40           	movea.l d0,a6
    1482:	4eae ffc4      	jsr -60(a6)
    1486:	2f40 0034      	move.l d0,52(sp)
    148a:	202f 0034      	move.l 52(sp),d0
    148e:	2f40 0030      	move.l d0,48(sp)
    1492:	2f7c 0000 7c83 	move.l #31875,44(sp)
    1498:	002c 
    149a:	7228           	moveq #40,d1
    149c:	2f41 0028      	move.l d1,40(sp)
    14a0:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    14a6:	2c40           	movea.l d0,a6
    14a8:	222f 0030      	move.l 48(sp),d1
    14ac:	242f 002c      	move.l 44(sp),d2
    14b0:	262f 0028      	move.l 40(sp),d3
    14b4:	4eae ffd0      	jsr -48(a6)
    14b8:	2f40 0024      	move.l d0,36(sp)
    Exit(1);
    14bc:	7401           	moveq #1,d2
    14be:	2f42 0020      	move.l d2,32(sp)
    14c2:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    14c8:	2c40           	movea.l d0,a6
    14ca:	222f 0020      	move.l 32(sp),d1
    14ce:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    14d2:	2f6f 0038 005c 	move.l 56(sp),92(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    14d8:	2f7c 0000 a5dc 	move.l #42460,88(sp)
    14de:	0058 
  for(int i=0; i<16;i++)
    14e0:	42af 0054      	clr.l 84(sp)
    14e4:	6024           	bra.s 150a <ClbuildZoom+0xc8>
    *cl++ = *clpartinstruction++;
    14e6:	222f 0058      	move.l 88(sp),d1
    14ea:	2001           	move.l d1,d0
    14ec:	5880           	addq.l #4,d0
    14ee:	2f40 0058      	move.l d0,88(sp)
    14f2:	202f 005c      	move.l 92(sp),d0
    14f6:	2400           	move.l d0,d2
    14f8:	5882           	addq.l #4,d2
    14fa:	2f42 005c      	move.l d2,92(sp)
    14fe:	2041           	movea.l d1,a0
    1500:	2210           	move.l (a0),d1
    1502:	2040           	movea.l d0,a0
    1504:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    1506:	52af 0054      	addq.l #1,84(sp)
    150a:	700f           	moveq #15,d0
    150c:	b0af 0054      	cmp.l 84(sp),d0
    1510:	6cd4           	bge.s 14e6 <ClbuildZoom+0xa4>
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
    1512:	2f7c 0000 a61c 	move.l #42524,88(sp)
    1518:	0058 
  for(int i=0; i<12;i++)
    151a:	42af 0050      	clr.l 80(sp)
    151e:	6024           	bra.s 1544 <ClbuildZoom+0x102>
    *cl++ = *clpartinstruction++;
    1520:	222f 0058      	move.l 88(sp),d1
    1524:	2401           	move.l d1,d2
    1526:	5882           	addq.l #4,d2
    1528:	2f42 0058      	move.l d2,88(sp)
    152c:	202f 005c      	move.l 92(sp),d0
    1530:	2400           	move.l d0,d2
    1532:	5882           	addq.l #4,d2
    1534:	2f42 005c      	move.l d2,92(sp)
    1538:	2041           	movea.l d1,a0
    153a:	2210           	move.l (a0),d1
    153c:	2040           	movea.l d0,a0
    153e:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    1540:	52af 0050      	addq.l #1,80(sp)
    1544:	700b           	moveq #11,d0
    1546:	b0af 0050      	cmp.l 80(sp),d0
    154a:	6cd4           	bge.s 1520 <ClbuildZoom+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    154c:	202f 005c      	move.l 92(sp),d0
    1550:	2200           	move.l d0,d1
    1552:	5881           	addq.l #4,d1
    1554:	2f41 005c      	move.l d1,92(sp)
    1558:	2040           	movea.l d0,a0
    155a:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    1560:	202f 005c      	move.l 92(sp),d0
    1564:	2200           	move.l d0,d1
    1566:	5881           	addq.l #4,d1
    1568:	2f41 005c      	move.l d1,92(sp)
    156c:	2040           	movea.l d0,a0
    156e:	20bc 00e2 0000 	move.l #14811136,(a0)
  *cl++ = 0x00e40000;
    1574:	202f 005c      	move.l 92(sp),d0
    1578:	2200           	move.l d0,d1
    157a:	5881           	addq.l #4,d1
    157c:	2f41 005c      	move.l d1,92(sp)
    1580:	2040           	movea.l d0,a0
    1582:	20bc 00e4 0000 	move.l #14942208,(a0)
  *cl++ = 0x00e60000;
    1588:	202f 005c      	move.l 92(sp),d0
    158c:	2200           	move.l d0,d1
    158e:	5881           	addq.l #4,d1
    1590:	2f41 005c      	move.l d1,92(sp)
    1594:	2040           	movea.l d0,a0
    1596:	20bc 00e6 0000 	move.l #15073280,(a0)
  *cl++ = 0x00e80000;
    159c:	202f 005c      	move.l 92(sp),d0
    15a0:	2200           	move.l d0,d1
    15a2:	5881           	addq.l #4,d1
    15a4:	2f41 005c      	move.l d1,92(sp)
    15a8:	2040           	movea.l d0,a0
    15aa:	20bc 00e8 0000 	move.l #15204352,(a0)
  *cl++ = 0x00ea0000;
    15b0:	202f 005c      	move.l 92(sp),d0
    15b4:	2200           	move.l d0,d1
    15b6:	5881           	addq.l #4,d1
    15b8:	2f41 005c      	move.l d1,92(sp)
    15bc:	2040           	movea.l d0,a0
    15be:	20bc 00ea 0000 	move.l #15335424,(a0)
  *cl++ = 0x00ec0000;
    15c4:	202f 005c      	move.l 92(sp),d0
    15c8:	2200           	move.l d0,d1
    15ca:	5881           	addq.l #4,d1
    15cc:	2f41 005c      	move.l d1,92(sp)
    15d0:	2040           	movea.l d0,a0
    15d2:	20bc 00ec 0000 	move.l #15466496,(a0)
  *cl++ = 0x00ee0000;
    15d8:	202f 005c      	move.l 92(sp),d0
    15dc:	2200           	move.l d0,d1
    15de:	5881           	addq.l #4,d1
    15e0:	2f41 005c      	move.l d1,92(sp)
    15e4:	2040           	movea.l d0,a0
    15e6:	20bc 00ee 0000 	move.l #15597568,(a0)
  *cl++ = 0x00f00000;
    15ec:	202f 005c      	move.l 92(sp),d0
    15f0:	2200           	move.l d0,d1
    15f2:	5881           	addq.l #4,d1
    15f4:	2f41 005c      	move.l d1,92(sp)
    15f8:	2040           	movea.l d0,a0
    15fa:	20bc 00f0 0000 	move.l #15728640,(a0)
  *cl++ = 0x00f20000;
    1600:	202f 005c      	move.l 92(sp),d0
    1604:	2200           	move.l d0,d1
    1606:	5881           	addq.l #4,d1
    1608:	2f41 005c      	move.l d1,92(sp)
    160c:	2040           	movea.l d0,a0
    160e:	20bc 00f2 0000 	move.l #15859712,(a0)

  clpartinstruction = ClColor;
    1614:	2f7c 0000 a55c 	move.l #42332,88(sp)
    161a:	0058 
  for(int i=0; i<32;i++)
    161c:	42af 004c      	clr.l 76(sp)
    1620:	6024           	bra.s 1646 <ClbuildZoom+0x204>
    *cl++ = *clpartinstruction++;
    1622:	222f 0058      	move.l 88(sp),d1
    1626:	2001           	move.l d1,d0
    1628:	5880           	addq.l #4,d0
    162a:	2f40 0058      	move.l d0,88(sp)
    162e:	202f 005c      	move.l 92(sp),d0
    1632:	2400           	move.l d0,d2
    1634:	5882           	addq.l #4,d2
    1636:	2f42 005c      	move.l d2,92(sp)
    163a:	2041           	movea.l d1,a0
    163c:	2210           	move.l (a0),d1
    163e:	2040           	movea.l d0,a0
    1640:	2081           	move.l d1,(a0)
  for(int i=0; i<32;i++)
    1642:	52af 004c      	addq.l #1,76(sp)
    1646:	701f           	moveq #31,d0
    1648:	b0af 004c      	cmp.l 76(sp),d0
    164c:	6cd4           	bge.s 1622 <ClbuildZoom+0x1e0>
  
  ULONG cop2 = cl+3;
    164e:	700c           	moveq #12,d0
    1650:	d0af 005c      	add.l 92(sp),d0
    1654:	2f40 001c      	move.l d0,28(sp)
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    1658:	202f 001c      	move.l 28(sp),d0
    165c:	4240           	clr.w d0
    165e:	4840           	swap d0
    1660:	2200           	move.l d0,d1
    1662:	0681 0084 0000 	addi.l #8650752,d1
    1668:	2f41 0018      	move.l d1,24(sp)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    166c:	202f 001c      	move.l 28(sp),d0
    1670:	0280 0000 ffff 	andi.l #65535,d0
    1676:	2400           	move.l d0,d2
    1678:	0682 0086 0000 	addi.l #8781824,d2
    167e:	2f42 0014      	move.l d2,20(sp)
  //clpartinstruction = Cl102ZoomInit;
  *cl++ = cop2lch;
    1682:	202f 005c      	move.l 92(sp),d0
    1686:	2200           	move.l d0,d1
    1688:	5881           	addq.l #4,d1
    168a:	2f41 005c      	move.l d1,92(sp)
    168e:	2040           	movea.l d0,a0
    1690:	20af 0018      	move.l 24(sp),(a0)
  *cl++ = cop2lcl;
    1694:	202f 005c      	move.l 92(sp),d0
    1698:	2200           	move.l d0,d1
    169a:	5881           	addq.l #4,d1
    169c:	2f41 005c      	move.l d1,92(sp)
    16a0:	2040           	movea.l d0,a0
    16a2:	20af 0014      	move.l 20(sp),(a0)
  *cl++ = 0x2c01ff00;
    16a6:	202f 005c      	move.l 92(sp),d0
    16aa:	2200           	move.l d0,d1
    16ac:	5881           	addq.l #4,d1
    16ae:	2f41 005c      	move.l d1,92(sp)
    16b2:	2040           	movea.l d0,a0
    16b4:	20bc 2c01 ff00 	move.l #738328320,(a0)

  ULONG cop2br1 = cop2 + ( (30)<<2);
    16ba:	7078           	moveq #120,d0
    16bc:	d0af 001c      	add.l 28(sp),d0
    16c0:	2f40 0010      	move.l d0,16(sp)
  ULONG cop2br2 = cop2 + ( (86)<<2);
    16c4:	222f 001c      	move.l 28(sp),d1
    16c8:	0681 0000 0158 	addi.l #344,d1
    16ce:	2f41 000c      	move.l d1,12(sp)
  clpartinstruction = Cl102ZoomRepeat;
    16d2:	2f7c 0000 a658 	move.l #42584,88(sp)
    16d8:	0058 
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    16da:	202f 0010      	move.l 16(sp),d0
    16de:	4240           	clr.w d0
    16e0:	4840           	swap d0
    16e2:	307c 0070      	movea.w #112,a0
    16e6:	d1ef 0058      	adda.l 88(sp),a0
    16ea:	0680 0084 0000 	addi.l #8650752,d0
    16f0:	2080           	move.l d0,(a0)
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    16f2:	202f 0010      	move.l 16(sp),d0
    16f6:	0280 0000 ffff 	andi.l #65535,d0
    16fc:	307c 0074      	movea.w #116,a0
    1700:	d1ef 0058      	adda.l 88(sp),a0
    1704:	0680 0086 0000 	addi.l #8781824,d0
    170a:	2080           	move.l d0,(a0)
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    170c:	202f 000c      	move.l 12(sp),d0
    1710:	4240           	clr.w d0
    1712:	4840           	swap d0
    1714:	206f 0058      	movea.l 88(sp),a0
    1718:	41e8 0150      	lea 336(a0),a0
    171c:	0680 0084 0000 	addi.l #8650752,d0
    1722:	2080           	move.l d0,(a0)
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    1724:	202f 000c      	move.l 12(sp),d0
    1728:	0280 0000 ffff 	andi.l #65535,d0
    172e:	206f 0058      	movea.l 88(sp),a0
    1732:	41e8 0154      	lea 340(a0),a0
    1736:	0680 0086 0000 	addi.l #8781824,d0
    173c:	2080           	move.l d0,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    173e:	42af 0048      	clr.l 72(sp)
    1742:	6024           	bra.s 1768 <ClbuildZoom+0x326>
    *cl++ = *clpartinstruction++;
    1744:	222f 0058      	move.l 88(sp),d1
    1748:	2401           	move.l d1,d2
    174a:	5882           	addq.l #4,d2
    174c:	2f42 0058      	move.l d2,88(sp)
    1750:	202f 005c      	move.l 92(sp),d0
    1754:	2400           	move.l d0,d2
    1756:	5882           	addq.l #4,d2
    1758:	2f42 005c      	move.l d2,92(sp)
    175c:	2041           	movea.l d1,a0
    175e:	2210           	move.l (a0),d1
    1760:	2040           	movea.l d0,a0
    1762:	2081           	move.l d1,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    1764:	52af 0048      	addq.l #1,72(sp)
    1768:	7071           	moveq #113,d0
    176a:	b0af 0048      	cmp.l 72(sp),d0
    176e:	6cd4           	bge.s 1744 <ClbuildZoom+0x302>

   *cl++ = 0xfffffffe;
    1770:	202f 005c      	move.l 92(sp),d0
    1774:	2200           	move.l d0,d1
    1776:	5881           	addq.l #4,d1
    1778:	2f41 005c      	move.l d1,92(sp)
    177c:	74fe           	moveq #-2,d2
    177e:	2040           	movea.l d0,a0
    1780:	2082           	move.l d2,(a0)

  return retval;
    1782:	202f 0038      	move.l 56(sp),d0
}
    1786:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    178a:	4fef 0054      	lea 84(sp),sp
    178e:	4e75           	rts

00001790 <PrepareDisplayZoom>:

 int PrepareDisplayZoom() {
    1790:	4fef ffb8      	lea -72(sp),sp
    1794:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildZoom();
    1798:	4eba fca8      	jsr 1442 <ClbuildZoom>(pc)
    179c:	23c0 0016 b994 	move.l d0,16b994 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    17a2:	4eba fc9e      	jsr 1442 <ClbuildZoom>(pc)
    17a6:	23c0 0016 b998 	move.l d0,16b998 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    17ac:	2f7c 0000 df20 	move.l #57120,80(sp)
    17b2:	0050 
    17b4:	7002           	moveq #2,d0
    17b6:	2f40 004c      	move.l d0,76(sp)
    17ba:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    17c0:	2c40           	movea.l d0,a6
    17c2:	202f 0050      	move.l 80(sp),d0
    17c6:	222f 004c      	move.l 76(sp),d1
    17ca:	4eae ff3a      	jsr -198(a6)
    17ce:	2f40 0048      	move.l d0,72(sp)
    17d2:	202f 0048      	move.l 72(sp),d0
    17d6:	23c0 0016 b98c 	move.l d0,16b98c <Bitplane1>
  if(Bitplane1 == 0) {
    17dc:	2039 0016 b98c 	move.l 16b98c <Bitplane1>,d0
    17e2:	6658           	bne.s 183c <PrepareDisplayZoom+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    17e4:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    17ea:	2c40           	movea.l d0,a6
    17ec:	4eae ffc4      	jsr -60(a6)
    17f0:	2f40 0044      	move.l d0,68(sp)
    17f4:	202f 0044      	move.l 68(sp),d0
    17f8:	2f40 0040      	move.l d0,64(sp)
    17fc:	2f7c 0000 7c35 	move.l #31797,60(sp)
    1802:	003c 
    1804:	7026           	moveq #38,d0
    1806:	2f40 0038      	move.l d0,56(sp)
    180a:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    1810:	2c40           	movea.l d0,a6
    1812:	222f 0040      	move.l 64(sp),d1
    1816:	242f 003c      	move.l 60(sp),d2
    181a:	262f 0038      	move.l 56(sp),d3
    181e:	4eae ffd0      	jsr -48(a6)
    1822:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    1826:	7001           	moveq #1,d0
    1828:	2f40 0030      	move.l d0,48(sp)
    182c:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    1832:	2c40           	movea.l d0,a6
    1834:	222f 0030      	move.l 48(sp),d1
    1838:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    183c:	2039 0016 b98c 	move.l 16b98c <Bitplane1>,d0
    1842:	23c0 0016 b99c 	move.l d0,16b99c <DrawBuffer>
  DrawCopper = Copperlist1;
    1848:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    184e:	23c0 0016 b9a4 	move.l d0,16b9a4 <DrawCopper>
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1854:	2f7c 0000 df20 	move.l #57120,44(sp)
    185a:	002c 
    185c:	7002           	moveq #2,d0
    185e:	2f40 0028      	move.l d0,40(sp)
    1862:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    1868:	2c40           	movea.l d0,a6
    186a:	202f 002c      	move.l 44(sp),d0
    186e:	222f 0028      	move.l 40(sp),d1
    1872:	4eae ff3a      	jsr -198(a6)
    1876:	2f40 0024      	move.l d0,36(sp)
    187a:	202f 0024      	move.l 36(sp),d0
    187e:	23c0 0016 b990 	move.l d0,16b990 <Bitplane2>
  if(Bitplane2 == 0) {
    1884:	2039 0016 b990 	move.l 16b990 <Bitplane2>,d0
    188a:	6658           	bne.s 18e4 <PrepareDisplayZoom+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    188c:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    1892:	2c40           	movea.l d0,a6
    1894:	4eae ffc4      	jsr -60(a6)
    1898:	2f40 0020      	move.l d0,32(sp)
    189c:	202f 0020      	move.l 32(sp),d0
    18a0:	2f40 001c      	move.l d0,28(sp)
    18a4:	2f7c 0000 7c5c 	move.l #31836,24(sp)
    18aa:	0018 
    18ac:	7026           	moveq #38,d0
    18ae:	2f40 0014      	move.l d0,20(sp)
    18b2:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    18b8:	2c40           	movea.l d0,a6
    18ba:	222f 001c      	move.l 28(sp),d1
    18be:	242f 0018      	move.l 24(sp),d2
    18c2:	262f 0014      	move.l 20(sp),d3
    18c6:	4eae ffd0      	jsr -48(a6)
    18ca:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    18ce:	7001           	moveq #1,d0
    18d0:	2f40 000c      	move.l d0,12(sp)
    18d4:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    18da:	2c40           	movea.l d0,a6
    18dc:	222f 000c      	move.l 12(sp),d1
    18e0:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    18e4:	2039 0016 b990 	move.l 16b990 <Bitplane2>,d0
    18ea:	23c0 0016 b9a0 	move.l d0,16b9a0 <ViewBuffer>
  ViewCopper = Copperlist2; 
    18f0:	2039 0016 b998 	move.l 16b998 <Copperlist2>,d0
    18f6:	23c0 0016 b9a8 	move.l d0,16b9a8 <ViewCopper>
  return 0;
    18fc:	7000           	moveq #0,d0
}
    18fe:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1902:	4fef 0048      	lea 72(sp),sp
    1906:	4e75           	rts

00001908 <Init_Blit>:

void Init_Blit() {
  hw->bltafwm = 0xffff;
    1908:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    190e:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1914:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    191a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1920:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    1926:	317c 0026 0064 	move.w #38,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    192c:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    1932:	317c 0026 0062 	move.w #38,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1938:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    193e:	317c 0026 0066 	move.w #38,102(a0)
}
    1944:	4e75           	rts

00001946 <Init_Blit2>:


void Init_Blit2() {
  hw->bltafwm = 0xffff;
    1946:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    194c:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1952:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    1958:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = 36;
    195e:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    1964:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = 76;
    196a:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    1970:	317c 004c 0062 	move.w #76,98(a0)
  hw->bltdmod = ZMLINESIZE2 - 4;
    1976:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    197c:	317c 0028 0066 	move.w #40,102(a0)
}
    1982:	4e75           	rts

00001984 <Init_ZoomBlit>:

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
    1984:	4fef fff4      	lea -12(sp),sp
    1988:	206f 0010      	movea.l 16(sp),a0
    198c:	222f 0014      	move.l 20(sp),d1
    1990:	202f 0018      	move.l 24(sp),d0
    1994:	3048           	movea.w a0,a0
    1996:	3f48 0004      	move.w a0,4(sp)
    199a:	3201           	move.w d1,d1
    199c:	3f41 0002      	move.w d1,2(sp)
    19a0:	3000           	move.w d0,d0
    19a2:	3e80           	move.w d0,(sp)
  ZoomBlit_Increment4SrcA = 0;
    19a4:	4279 0016 b9e0 	clr.w 16b9e0 <ZoomBlit_Increment4SrcA>

  UWORD colnr = nextzoom - startofword - 1;                                                                          
    19aa:	302f 0002      	move.w 2(sp),d0
    19ae:	906f 0004      	sub.w 4(sp),d0
    19b2:	3200           	move.w d0,d1
    19b4:	5341           	subq.w #1,d1
    19b6:	3f41 0008      	move.w d1,8(sp)
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
    19ba:	3017           	move.w (sp),d0
    19bc:	720c           	moveq #12,d1
    19be:	e368           	lsl.w d1,d0
    19c0:	3f40 0006      	move.w d0,6(sp)
  UWORD shifta;
  if( shiftright == 0) {
    19c4:	4a57           	tst.w (sp)
    19c6:	6610           	bne.s 19d8 <Init_ZoomBlit+0x54>
    ZoomBlit_Increment4SrcA = 1;
    19c8:	33fc 0001 0016 	move.w #1,16b9e0 <ZoomBlit_Increment4SrcA>
    19ce:	b9e0 
    shifta = 15 << 12;
    19d0:	3f7c f000 000a 	move.w #-4096,10(sp)
    19d6:	600c           	bra.s 19e4 <Init_ZoomBlit+0x60>
  } else {
    shifta = (shiftright - 1) << 12;
    19d8:	3017           	move.w (sp),d0
    19da:	5340           	subq.w #1,d0
    19dc:	720c           	moveq #12,d1
    19de:	e368           	lsl.w d1,d0
    19e0:	3f40 000a      	move.w d0,10(sp)
  }
  WaitBlt(); 
    19e4:	4eba e6ce      	jsr b4 <WaitBlt>(pc)
  hw->bltcon1 = shiftb; 
    19e8:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    19ee:	316f 0006 0042 	move.w 6(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    19f4:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    19fa:	302f 000a      	move.w 10(sp),d0
    19fe:	0640 0de4      	addi.w #3556,d0
    1a02:	3140 0040      	move.w d0,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1a06:	7000           	moveq #0,d0
    1a08:	302f 0008      	move.w 8(sp),d0
    1a0c:	7210           	moveq #16,d1
    1a0e:	9280           	sub.l d0,d1
    1a10:	7000           	moveq #0,d0
    1a12:	4640           	not.w d0
    1a14:	e3a8           	lsl.l d1,d0
    1a16:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    1a1c:	2000           	move.l d0,d0
    1a1e:	3140 0070      	move.w d0,112(a0)
}
    1a22:	4fef 000c      	lea 12(sp),sp
    1a26:	4e75           	rts

00001a28 <Init_Copy>:

void Init_Copy( WORD shift) {
    1a28:	598f           	subq.l #4,sp
    1a2a:	202f 0008      	move.l 8(sp),d0
    1a2e:	3000           	move.w d0,d0
    1a30:	3e80           	move.w d0,(sp)
  UWORD shiftright = shift << 12;
    1a32:	3017           	move.w (sp),d0
    1a34:	720c           	moveq #12,d1
    1a36:	e368           	lsl.w d1,d0
    1a38:	3f40 0002      	move.w d0,2(sp)
  WaitBlt();
    1a3c:	4eba e676      	jsr b4 <WaitBlt>(pc)
  hw->bltcon0 = 0x9f0 + shiftright;
    1a40:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    1a46:	302f 0002      	move.w 2(sp),d0
    1a4a:	0640 09f0      	addi.w #2544,d0
    1a4e:	3140 0040      	move.w d0,64(a0)
  hw->bltcon1 = 0;
    1a52:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    1a58:	317c 0000 0042 	move.w #0,66(a0)
}
    1a5e:	588f           	addq.l #4,sp
    1a60:	4e75           	rts

00001a62 <Zoom_ZoomIntoPicture>:

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    1a62:	4fef ffcc      	lea -52(sp),sp
    1a66:	222f 0040      	move.l 64(sp),d1
    1a6a:	202f 0044      	move.l 68(sp),d0
    1a6e:	3201           	move.w d1,d1
    1a70:	3f41 0002      	move.w d1,2(sp)
    1a74:	3000           	move.w d0,d0
    1a76:	3e80           	move.w d0,(sp)
  
  WaitBlt();  
    1a78:	4eba e63a      	jsr b4 <WaitBlt>(pc)
  Init_Blit();
    1a7c:	4eba fe8a      	jsr 1908 <Init_Blit>(pc)
  WORD shiftright = 9;
    1a80:	3f7c 0009 0032 	move.w #9,50(sp)
  UWORD shifthoriz = 7;
    1a86:	3f7c 0007 0030 	move.w #7,48(sp)
  UWORD startofword = 21*16;
    1a8c:	3f7c 0150 002e 	move.w #336,46(sp)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1a92:	322f 0002      	move.w 2(sp),d1
    1a96:	3001           	move.w d1,d0
    1a98:	d040           	add.w d0,d0
    1a9a:	d040           	add.w d0,d0
    1a9c:	d041           	add.w d1,d0
    1a9e:	d040           	add.w d0,d0
    1aa0:	0640 014c      	addi.w #332,d0
    1aa4:	3f40 002c      	move.w d0,44(sp)
    1aa8:	601a           	bra.s 1ac4 <Zoom_ZoomIntoPicture+0x62>
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    1aaa:	302f 002c      	move.w 44(sp),d0
    1aae:	906f 0002      	sub.w 2(sp),d0
    1ab2:	0640 ffed      	addi.w #-19,d0
    1ab6:	3f40 002c      	move.w d0,44(sp)
    shiftright--;
    1aba:	302f 0032      	move.w 50(sp),d0
    1abe:	5340           	subq.w #1,d0
    1ac0:	3f40 0032      	move.w d0,50(sp)
  while( nextzoom > 22 * 16) {
    1ac4:	0c6f 0160 002c 	cmpi.w #352,44(sp)
    1aca:	6ede           	bgt.s 1aaa <Zoom_ZoomIntoPicture+0x48>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
    1acc:	426f 002a      	clr.w 42(sp)
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    1ad0:	322f 0002      	move.w 2(sp),d1
    1ad4:	3001           	move.w d1,d0
    1ad6:	d040           	add.w d0,d0
    1ad8:	d040           	add.w d0,d0
    1ada:	d041           	add.w d1,d0
    1adc:	4440           	neg.w d0
    1ade:	0640 0012      	addi.w #18,d0
    1ae2:	3f40 0028      	move.w d0,40(sp)
    1ae6:	601c           	bra.s 1b04 <Zoom_ZoomIntoPicture+0xa2>
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    1ae8:	302f 0028      	move.w 40(sp),d0
    1aec:	d06f 0002      	add.w 2(sp),d0
    1af0:	0640 0013      	addi.w #19,d0
    1af4:	3f40 0028      	move.w d0,40(sp)
      shifthoriz--;
    1af8:	302f 0030      	move.w 48(sp),d0
    1afc:	3200           	move.w d0,d1
    1afe:	5341           	subq.w #1,d1
    1b00:	3f41 0030      	move.w d1,48(sp)
  while( ZoomHorizontalStart < 0) {
    1b04:	4a6f 0028      	tst.w 40(sp)
    1b08:	6dde           	blt.s 1ae8 <Zoom_ZoomIntoPicture+0x86>
  } 

  for(int i=0;i<22;i++) {
    1b0a:	42af 0024      	clr.l 36(sp)
    1b0e:	6000 02ca      	bra.w 1dda <Zoom_ZoomIntoPicture+0x378>

    ZoomHorizontal = ZoomHorizontalStart;
    1b12:	33ef 0028 0016 	move.w 40(sp),16b9fc <ZoomHorizontal>
    1b18:	b9fc 

    WORD linesleft = 272;
    1b1a:	3f7c 0110 0022 	move.w #272,34(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1b20:	7000           	moveq #0,d0
    1b22:	302f 0030      	move.w 48(sp),d0
    1b26:	7200           	moveq #0,d1
    1b28:	3217           	move.w (sp),d1
    1b2a:	2f01           	move.l d1,-(sp)
    1b2c:	2f00           	move.l d0,-(sp)
    1b2e:	4eb9 0000 709c 	jsr 709c <__mulsi3>
    1b34:	508f           	addq.l #8,sp
    1b36:	2200           	move.l d0,d1
    1b38:	2001           	move.l d1,d0
    1b3a:	d080           	add.l d0,d0
    1b3c:	d081           	add.l d1,d0
    1b3e:	2200           	move.l d0,d1
    1b40:	e789           	lsl.l #3,d1
    1b42:	9280           	sub.l d0,d1
    1b44:	202f 0024      	move.l 36(sp),d0
    1b48:	9280           	sub.l d0,d1
    1b4a:	2001           	move.l d1,d0
    1b4c:	0680 8000 0013 	addi.l #-2147483629,d0
    1b52:	d080           	add.l d0,d0
    1b54:	222f 0038      	move.l 56(sp),d1
    1b58:	d280           	add.l d0,d1
    1b5a:	2f41 001e      	move.l d1,30(sp)
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1b5e:	202f 0024      	move.l 36(sp),d0
    1b62:	7213           	moveq #19,d1
    1b64:	9280           	sub.l d0,d1
    1b66:	2001           	move.l d1,d0
    1b68:	d081           	add.l d1,d0
    1b6a:	222f 003c      	move.l 60(sp),d1
    1b6e:	d280           	add.l d0,d1
    1b70:	2f41 001a      	move.l d1,26(sp)
    
    UWORD onestep = ZMLINESIZE/2*planes;
    1b74:	3017           	move.w (sp),d0
    1b76:	c1fc 0015      	muls.w #21,d0
    1b7a:	3f40 0018      	move.w d0,24(sp)
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1b7e:	7000           	moveq #0,d0
    1b80:	302f 002e      	move.w 46(sp),d0
    1b84:	306f 002c      	movea.w 44(sp),a0
    1b88:	b1c0           	cmpa.l d0,a0
    1b8a:	6e00 0106      	bgt.w 1c92 <Zoom_ZoomIntoPicture+0x230>
      Init_Copy( shiftright);
    1b8e:	306f 0032      	movea.w 50(sp),a0
    1b92:	2f08           	move.l a0,-(sp)
    1b94:	4eba fe92      	jsr 1a28 <Init_Copy>(pc)
    1b98:	588f           	addq.l #4,sp
    1b9a:	6000 00ea      	bra.w 1c86 <Zoom_ZoomIntoPicture+0x224>
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1b9e:	3039 0016 b9fc 	move.w 16b9fc <ZoomHorizontal>,d0
    1ba4:	b06f 0022      	cmp.w 34(sp),d0
    1ba8:	6c12           	bge.s 1bbc <Zoom_ZoomIntoPicture+0x15a>
          linesleft -= ZoomHorizontal;
    1baa:	322f 0022      	move.w 34(sp),d1
    1bae:	3039 0016 b9fc 	move.w 16b9fc <ZoomHorizontal>,d0
    1bb4:	9240           	sub.w d0,d1
    1bb6:	3f41 0022      	move.w d1,34(sp)
    1bba:	600c           	bra.s 1bc8 <Zoom_ZoomIntoPicture+0x166>
        } else {
          ZoomHorizontal = linesleft;
    1bbc:	33ef 0022 0016 	move.w 34(sp),16b9fc <ZoomHorizontal>
    1bc2:	b9fc 
          linesleft = 0;
    1bc4:	426f 0022      	clr.w 34(sp)
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
    1bc8:	3039 0016 b9fc 	move.w 16b9fc <ZoomHorizontal>,d0
    1bce:	322f 0018      	move.w 24(sp),d1
    1bd2:	c3c0           	muls.w d0,d1
    1bd4:	3f41 000c      	move.w d1,12(sp)
        //Add aditional line
        if( linesleft>0) {
    1bd8:	4a6f 0022      	tst.w 34(sp)
    1bdc:	6f4c           	ble.s 1c2a <Zoom_ZoomIntoPicture+0x1c8>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1bde:	7200           	moveq #0,d1
    1be0:	322f 000c      	move.w 12(sp),d1
    1be4:	7000           	moveq #0,d0
    1be6:	302f 002a      	move.w 42(sp),d0
    1bea:	d081           	add.l d1,d0
    1bec:	d080           	add.l d0,d0
    1bee:	222f 001e      	move.l 30(sp),d1
    1bf2:	d280           	add.l d0,d1
    1bf4:	2f41 0008      	move.l d1,8(sp)
          UWORD *tmpdest = pos4dest +  size4blit;
    1bf8:	7000           	moveq #0,d0
    1bfa:	302f 000c      	move.w 12(sp),d0
    1bfe:	d080           	add.l d0,d0
    1c00:	222f 001a      	move.l 26(sp),d1
    1c04:	d280           	add.l d0,d1
    1c06:	2f41 0004      	move.l d1,4(sp)
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
    1c0a:	7000           	moveq #0,d0
    1c0c:	3017           	move.w (sp),d0
    1c0e:	2f00           	move.l d0,-(sp)
    1c10:	2f2f 0008      	move.l 8(sp),-(sp)
    1c14:	2f2f 0010      	move.l 16(sp),-(sp)
    1c18:	4eba f4f6      	jsr 1110 <Zoom_CopyWord>(pc)
    1c1c:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1c20:	302f 0022      	move.w 34(sp),d0
    1c24:	5340           	subq.w #1,d0
    1c26:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1c2a:	3039 0016 b9fc 	move.w 16b9fc <ZoomHorizontal>,d0
    1c30:	c1d7           	muls.w (sp),d0
    1c32:	7200           	moveq #0,d1
    1c34:	3200           	move.w d0,d1
    1c36:	7000           	moveq #0,d0
    1c38:	302f 002a      	move.w 42(sp),d0
    1c3c:	d080           	add.l d0,d0
    1c3e:	d0af 001e      	add.l 30(sp),d0
    1c42:	2f01           	move.l d1,-(sp)
    1c44:	2f2f 001e      	move.l 30(sp),-(sp)
    1c48:	2f00           	move.l d0,-(sp)
    1c4a:	4eba f4c4      	jsr 1110 <Zoom_CopyWord>(pc)
    1c4e:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1c52:	7000           	moveq #0,d0
    1c54:	302f 000c      	move.w 12(sp),d0
    1c58:	d080           	add.l d0,d0
    1c5a:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep; 
    1c5e:	7200           	moveq #0,d1
    1c60:	322f 000c      	move.w 12(sp),d1
    1c64:	7000           	moveq #0,d0
    1c66:	302f 0018      	move.w 24(sp),d0
    1c6a:	d081           	add.l d1,d0
    1c6c:	d080           	add.l d0,d0
    1c6e:	d1af 001a      	add.l d0,26(sp)
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1c72:	302f 0002      	move.w 2(sp),d0
    1c76:	d040           	add.w d0,d0
    1c78:	906f 0002      	sub.w 2(sp),d0
    1c7c:	0640 0012      	addi.w #18,d0
    1c80:	33c0 0016 b9fc 	move.w d0,16b9fc <ZoomHorizontal>
      while(linesleft > 0) {
    1c86:	4a6f 0022      	tst.w 34(sp)
    1c8a:	6e00 ff12      	bgt.w 1b9e <Zoom_ZoomIntoPicture+0x13c>
    1c8e:	6000 0140      	bra.w 1dd0 <Zoom_ZoomIntoPicture+0x36e>
      }
    } else {  
      Init_ZoomBlit( startofword, nextzoom, shiftright);   
    1c92:	326f 0032      	movea.w 50(sp),a1
    1c96:	306f 002c      	movea.w 44(sp),a0
    1c9a:	7000           	moveq #0,d0
    1c9c:	302f 002e      	move.w 46(sp),d0
    1ca0:	2f09           	move.l a1,-(sp)
    1ca2:	2f08           	move.l a0,-(sp)
    1ca4:	2f00           	move.l d0,-(sp)
    1ca6:	4eba fcdc      	jsr 1984 <Init_ZoomBlit>(pc)
    1caa:	4fef 000c      	lea 12(sp),sp
      nextzoom -= (19 + zoomnr);
    1cae:	302f 002c      	move.w 44(sp),d0
    1cb2:	906f 0002      	sub.w 2(sp),d0
    1cb6:	0640 ffed      	addi.w #-19,d0
    1cba:	3f40 002c      	move.w d0,44(sp)
    1cbe:	6000 00ea      	bra.w 1daa <Zoom_ZoomIntoPicture+0x348>
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1cc2:	3039 0016 b9fc 	move.w 16b9fc <ZoomHorizontal>,d0
    1cc8:	b06f 0022      	cmp.w 34(sp),d0
    1ccc:	6c12           	bge.s 1ce0 <Zoom_ZoomIntoPicture+0x27e>
          linesleft -= ZoomHorizontal;
    1cce:	322f 0022      	move.w 34(sp),d1
    1cd2:	3039 0016 b9fc 	move.w 16b9fc <ZoomHorizontal>,d0
    1cd8:	9240           	sub.w d0,d1
    1cda:	3f41 0022      	move.w d1,34(sp)
    1cde:	600c           	bra.s 1cec <Zoom_ZoomIntoPicture+0x28a>
        } else {
          ZoomHorizontal = linesleft;
    1ce0:	33ef 0022 0016 	move.w 34(sp),16b9fc <ZoomHorizontal>
    1ce6:	b9fc 
          linesleft = 0;
    1ce8:	426f 0022      	clr.w 34(sp)
        }
        UWORD size4blit = ZoomHorizontal*onestep;
    1cec:	3039 0016 b9fc 	move.w 16b9fc <ZoomHorizontal>,d0
    1cf2:	322f 0018      	move.w 24(sp),d1
    1cf6:	c3c0           	muls.w d0,d1
    1cf8:	3f41 0016      	move.w d1,22(sp)
        //Add aditional line
        if( linesleft>0) {
    1cfc:	4a6f 0022      	tst.w 34(sp)
    1d00:	6f4c           	ble.s 1d4e <Zoom_ZoomIntoPicture+0x2ec>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1d02:	7200           	moveq #0,d1
    1d04:	322f 0016      	move.w 22(sp),d1
    1d08:	7000           	moveq #0,d0
    1d0a:	302f 002a      	move.w 42(sp),d0
    1d0e:	d081           	add.l d1,d0
    1d10:	d080           	add.l d0,d0
    1d12:	222f 001e      	move.l 30(sp),d1
    1d16:	d280           	add.l d0,d1
    1d18:	2f41 0012      	move.l d1,18(sp)
          UWORD *tmpdest = pos4dest + size4blit;
    1d1c:	7000           	moveq #0,d0
    1d1e:	302f 0016      	move.w 22(sp),d0
    1d22:	d080           	add.l d0,d0
    1d24:	222f 001a      	move.l 26(sp),d1
    1d28:	d280           	add.l d0,d1
    1d2a:	2f41 000e      	move.l d1,14(sp)
          
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
    1d2e:	7000           	moveq #0,d0
    1d30:	3017           	move.w (sp),d0
    1d32:	2f00           	move.l d0,-(sp)
    1d34:	2f2f 0012      	move.l 18(sp),-(sp)
    1d38:	2f2f 001a      	move.l 26(sp),-(sp)
    1d3c:	4eba f410      	jsr 114e <Zoom_ZoomBlit>(pc)
    1d40:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1d44:	302f 0022      	move.w 34(sp),d0
    1d48:	5340           	subq.w #1,d0
    1d4a:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1d4e:	3039 0016 b9fc 	move.w 16b9fc <ZoomHorizontal>,d0
    1d54:	c1d7           	muls.w (sp),d0
    1d56:	7200           	moveq #0,d1
    1d58:	3200           	move.w d0,d1
    1d5a:	7000           	moveq #0,d0
    1d5c:	302f 002a      	move.w 42(sp),d0
    1d60:	d080           	add.l d0,d0
    1d62:	d0af 001e      	add.l 30(sp),d0
    1d66:	2f01           	move.l d1,-(sp)
    1d68:	2f2f 001e      	move.l 30(sp),-(sp)
    1d6c:	2f00           	move.l d0,-(sp)
    1d6e:	4eba f3de      	jsr 114e <Zoom_ZoomBlit>(pc)
    1d72:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1d76:	7000           	moveq #0,d0
    1d78:	302f 0016      	move.w 22(sp),d0
    1d7c:	d080           	add.l d0,d0
    1d7e:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep;   
    1d82:	7200           	moveq #0,d1
    1d84:	322f 0016      	move.w 22(sp),d1
    1d88:	7000           	moveq #0,d0
    1d8a:	302f 0018      	move.w 24(sp),d0
    1d8e:	d081           	add.l d1,d0
    1d90:	d080           	add.l d0,d0
    1d92:	d1af 001a      	add.l d0,26(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1d96:	302f 0002      	move.w 2(sp),d0
    1d9a:	d040           	add.w d0,d0
    1d9c:	906f 0002      	sub.w 2(sp),d0
    1da0:	0640 0012      	addi.w #18,d0
    1da4:	33c0 0016 b9fc 	move.w d0,16b9fc <ZoomHorizontal>
      while( linesleft > 0) {
    1daa:	4a6f 0022      	tst.w 34(sp)
    1dae:	6e00 ff12      	bgt.w 1cc2 <Zoom_ZoomIntoPicture+0x260>
      }
      shiftright--;  
    1db2:	302f 0032      	move.w 50(sp),d0
    1db6:	5340           	subq.w #1,d0
    1db8:	3f40 0032      	move.w d0,50(sp)
      if(shiftright < 0) {
    1dbc:	6a12           	bpl.s 1dd0 <Zoom_ZoomIntoPicture+0x36e>
        shiftright += 16;
    1dbe:	302f 0032      	move.w 50(sp),d0
    1dc2:	0640 0010      	addi.w #16,d0
    1dc6:	3f40 0032      	move.w d0,50(sp)
        shifttoleft = 1;
    1dca:	3f7c 0001 002a 	move.w #1,42(sp)
      }
    }
    startofword -= 16;
    1dd0:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    1dd6:	52af 0024      	addq.l #1,36(sp)
    1dda:	7015           	moveq #21,d0
    1ddc:	b0af 0024      	cmp.l 36(sp),d0
    1de0:	6c00 fd30      	bge.w 1b12 <Zoom_ZoomIntoPicture+0xb0>
  }
}
    1de4:	4fef 0034      	lea 52(sp),sp
    1de8:	4e75           	rts

00001dea <Zoom_SetBplPointers>:

void Zoom_SetBplPointers( UWORD *buffer, ULONG *copper) {
    1dea:	4fef fff0      	lea -16(sp),sp
  ULONG plane2set = buffer;//+1;
    1dee:	2f6f 0014 000c 	move.l 20(sp),12(sp)
  /*ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;*/
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
    1df4:	7072           	moveq #114,d0
    1df6:	d0af 0018      	add.l 24(sp),d0
    1dfa:	2f40 0008      	move.l d0,8(sp)
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1dfe:	42af 0004      	clr.l 4(sp)
    1e02:	6032           	bra.s 1e36 <Zoom_SetBplPointers+0x4c>
    UWORD highword = (ULONG)plane2set >> 16;
    1e04:	202f 000c      	move.l 12(sp),d0
    1e08:	4240           	clr.w d0
    1e0a:	4840           	swap d0
    1e0c:	3f40 0002      	move.w d0,2(sp)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1e10:	3eaf 000e      	move.w 14(sp),(sp)
    *posofcopper = highword;
    1e14:	206f 0008      	movea.l 8(sp),a0
    1e18:	30af 0002      	move.w 2(sp),(a0)
    posofcopper += 2;
    1e1c:	58af 0008      	addq.l #4,8(sp)
    *posofcopper = lowword;
    1e20:	206f 0008      	movea.l 8(sp),a0
    1e24:	3097           	move.w (sp),(a0)
    posofcopper += 2;
    1e26:	58af 0008      	addq.l #4,8(sp)
    plane2set += 42*268; //Next plane
    1e2a:	06af 0000 2bf8 	addi.l #11256,12(sp)
    1e30:	000c 
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1e32:	52af 0004      	addq.l #1,4(sp)
    1e36:	7004           	moveq #4,d0
    1e38:	b0af 0004      	cmp.l 4(sp),d0
    1e3c:	6cc6           	bge.s 1e04 <Zoom_SetBplPointers+0x1a>
  }
  
}
    1e3e:	4fef 0010      	lea 16(sp),sp
    1e42:	4e75           	rts

00001e44 <Zoom_SwapBuffers>:

void Zoom_SwapBuffers( UWORD zoomlevel) {
    1e44:	598f           	subq.l #4,sp
    1e46:	2f02           	move.l d2,-(sp)
    1e48:	202f 000c      	move.l 12(sp),d0
    1e4c:	3000           	move.w d0,d0
    1e4e:	3f40 0006      	move.w d0,6(sp)
  ViewBuffer = framebuffer + (42*268*5*zoomlevel);
    1e52:	2439 0000 b7f0 	move.l b7f0 <framebuffer>,d2
    1e58:	7000           	moveq #0,d0
    1e5a:	302f 0006      	move.w 6(sp),d0
    1e5e:	2f3c 0000 dbd8 	move.l #56280,-(sp)
    1e64:	2f00           	move.l d0,-(sp)
    1e66:	4eb9 0000 709c 	jsr 709c <__mulsi3>
    1e6c:	508f           	addq.l #8,sp
    1e6e:	d082           	add.l d2,d0
    1e70:	23c0 0016 b9a0 	move.l d0,16b9a0 <ViewBuffer>
  /*ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;*/
}
    1e76:	241f           	move.l (sp)+,d2
    1e78:	588f           	addq.l #4,sp
    1e7a:	4e75           	rts

00001e7c <Test_Zoom2>:
#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
    1e7c:	4fef ff00      	lea -256(sp),sp
    1e80:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  //Test Zoomlevel 1
  volatile ULONG *srcsmall = AllocMem( 80, MEMF_CHIP);
    1e84:	7050           	moveq #80,d0
    1e86:	2f40 00f0      	move.l d0,240(sp)
    1e8a:	7002           	moveq #2,d0
    1e8c:	2f40 00ec      	move.l d0,236(sp)
    1e90:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    1e96:	2c40           	movea.l d0,a6
    1e98:	202f 00f0      	move.l 240(sp),d0
    1e9c:	222f 00ec      	move.l 236(sp),d1
    1ea0:	4eae ff3a      	jsr -198(a6)
    1ea4:	2f40 00e8      	move.l d0,232(sp)
    1ea8:	202f 00e8      	move.l 232(sp),d0
    1eac:	2f40 00e4      	move.l d0,228(sp)
  if( srcsmall == 0) {
    1eb0:	6646           	bne.s 1ef8 <Test_Zoom2+0x7c>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcsmall\n", 42);
    1eb2:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    1eb8:	2c40           	movea.l d0,a6
    1eba:	4eae ffc4      	jsr -60(a6)
    1ebe:	2f40 001c      	move.l d0,28(sp)
    1ec2:	202f 001c      	move.l 28(sp),d0
    1ec6:	2f40 0018      	move.l d0,24(sp)
    1eca:	2f7c 0000 7cb7 	move.l #31927,20(sp)
    1ed0:	0014 
    1ed2:	702a           	moveq #42,d0
    1ed4:	2f40 0010      	move.l d0,16(sp)
    1ed8:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    1ede:	2c40           	movea.l d0,a6
    1ee0:	222f 0018      	move.l 24(sp),d1
    1ee4:	242f 0014      	move.l 20(sp),d2
    1ee8:	262f 0010      	move.l 16(sp),d3
    1eec:	4eae ffd0      	jsr -48(a6)
    1ef0:	2f40 000c      	move.l d0,12(sp)
    1ef4:	6000 0560      	bra.w 2456 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong(srcsmall, 0xaaaaaaaa, 2, 10, 0);
    1ef8:	42a7           	clr.l -(sp)
    1efa:	4878 000a      	pea a <_start+0xa>
    1efe:	4878 0002      	pea 2 <_start+0x2>
    1f02:	2f3c aaaa aaaa 	move.l #-1431655766,-(sp)
    1f08:	2f2f 00f4      	move.l 244(sp),-(sp)
    1f0c:	4eba e362      	jsr 270 <Utils_FillLong>(pc)
    1f10:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *srcbig = AllocMem( 160, MEMF_CHIP);
    1f14:	2f7c 0000 00a0 	move.l #160,224(sp)
    1f1a:	00e0 
    1f1c:	7002           	moveq #2,d0
    1f1e:	2f40 00dc      	move.l d0,220(sp)
    1f22:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    1f28:	2c40           	movea.l d0,a6
    1f2a:	202f 00e0      	move.l 224(sp),d0
    1f2e:	222f 00dc      	move.l 220(sp),d1
    1f32:	4eae ff3a      	jsr -198(a6)
    1f36:	2f40 00d8      	move.l d0,216(sp)
    1f3a:	202f 00d8      	move.l 216(sp),d0
    1f3e:	2f40 00d4      	move.l d0,212(sp)
    if( srcbig == 0) {
    1f42:	6646           	bne.s 1f8a <Test_Zoom2+0x10e>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcbig\n", 40);
    1f44:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    1f4a:	2c40           	movea.l d0,a6
    1f4c:	4eae ffc4      	jsr -60(a6)
    1f50:	2f40 0030      	move.l d0,48(sp)
    1f54:	202f 0030      	move.l 48(sp),d0
    1f58:	2f40 002c      	move.l d0,44(sp)
    1f5c:	2f7c 0000 7ce2 	move.l #31970,40(sp)
    1f62:	0028 
    1f64:	7028           	moveq #40,d0
    1f66:	2f40 0024      	move.l d0,36(sp)
    1f6a:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    1f70:	2c40           	movea.l d0,a6
    1f72:	222f 002c      	move.l 44(sp),d1
    1f76:	242f 0028      	move.l 40(sp),d2
    1f7a:	262f 0024      	move.l 36(sp),d3
    1f7e:	4eae ffd0      	jsr -48(a6)
    1f82:	2f40 0020      	move.l d0,32(sp)
    1f86:	6000 04ce      	bra.w 2456 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong( srcbig, 0x55555555, 2, 20, 0);
    1f8a:	42a7           	clr.l -(sp)
    1f8c:	4878 0014      	pea 14 <_start+0x14>
    1f90:	4878 0002      	pea 2 <_start+0x2>
    1f94:	2f3c 5555 5555 	move.l #1431655765,-(sp)
    1f9a:	2f2f 00e4      	move.l 228(sp),-(sp)
    1f9e:	4eba e2d0      	jsr 270 <Utils_FillLong>(pc)
    1fa2:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *target = AllocMem( 168, MEMF_CHIP);
    1fa6:	2f7c 0000 00a8 	move.l #168,208(sp)
    1fac:	00d0 
    1fae:	7002           	moveq #2,d0
    1fb0:	2f40 00cc      	move.l d0,204(sp)
    1fb4:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    1fba:	2c40           	movea.l d0,a6
    1fbc:	202f 00d0      	move.l 208(sp),d0
    1fc0:	222f 00cc      	move.l 204(sp),d1
    1fc4:	4eae ff3a      	jsr -198(a6)
    1fc8:	2f40 00c8      	move.l d0,200(sp)
    1fcc:	202f 00c8      	move.l 200(sp),d0
    1fd0:	2f40 00c4      	move.l d0,196(sp)
  if( target == 0) {
    1fd4:	6646           	bne.s 201c <Test_Zoom2+0x1a0>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
    1fd6:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    1fdc:	2c40           	movea.l d0,a6
    1fde:	4eae ffc4      	jsr -60(a6)
    1fe2:	2f40 0044      	move.l d0,68(sp)
    1fe6:	202f 0044      	move.l 68(sp),d0
    1fea:	2f40 0040      	move.l d0,64(sp)
    1fee:	2f7c 0000 7d0b 	move.l #32011,60(sp)
    1ff4:	003c 
    1ff6:	7028           	moveq #40,d0
    1ff8:	2f40 0038      	move.l d0,56(sp)
    1ffc:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2002:	2c40           	movea.l d0,a6
    2004:	222f 0040      	move.l 64(sp),d1
    2008:	242f 003c      	move.l 60(sp),d2
    200c:	262f 0038      	move.l 56(sp),d3
    2010:	4eae ffd0      	jsr -48(a6)
    2014:	2f40 0034      	move.l d0,52(sp)
    2018:	6000 043c      	bra.w 2456 <Test_Zoom2+0x5da>
    return;
  }
  WaitBlt();
    201c:	4eba e096      	jsr b4 <WaitBlt>(pc)
  hw->bltafwm = 0xffff;
    2020:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    2026:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    202c:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    2032:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltdmod = 38;
    2038:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    203e:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcon1 = 1 << 12; //Shift src big
    2044:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    204a:	317c 1000 0042 	move.w #4096,66(a0)
  hw->bltcon0 = 0xde4; //Chanell settings and Shift src small
    2050:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    2056:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltcdat = 0x8000; //Show channel small if 1 else channel big
    205c:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    2062:	317c 8000 0070 	move.w #-32768,112(a0)
  //srcbig-shift   0010 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sbbb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2068:	4878 0001      	pea 1 <_start+0x1>
    206c:	4878 004e      	pea 4e <_start+0x4e>
    2070:	4878 0026      	pea 26 <_start+0x26>
    2074:	4878 0002      	pea 2 <_start+0x2>
    2078:	2f2f 00d4      	move.l 212(sp),-(sp)
    207c:	2f2f 00e8      	move.l 232(sp),-(sp)
    2080:	2f2f 00fc      	move.l 252(sp),-(sp)
    2084:	4eba f12c      	jsr 11b2 <Zoom_ZoomBlit2>(pc)
    2088:	4fef 001c      	lea 28(sp),sp
  UWORD *tmp = (UWORD *)target;
    208c:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2092:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    2098:	2c40           	movea.l d0,a6
    209a:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    209e:	42af 0104      	clr.l 260(sp)
    20a2:	605c           	bra.s 2100 <Test_Zoom2+0x284>
    if( *tmp != 0xaaaa ) {
    20a4:	206f 0108      	movea.l 264(sp),a0
    20a8:	3010           	move.w (a0),d0
    20aa:	0c40 aaaa      	cmpi.w #-21846,d0
    20ae:	6746           	beq.s 20f6 <Test_Zoom2+0x27a>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 1 failed\n", 40);
    20b0:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    20b6:	2c40           	movea.l d0,a6
    20b8:	4eae ffc4      	jsr -60(a6)
    20bc:	2f40 0058      	move.l d0,88(sp)
    20c0:	202f 0058      	move.l 88(sp),d0
    20c4:	2f40 0054      	move.l d0,84(sp)
    20c8:	2f7c 0000 7d34 	move.l #32052,80(sp)
    20ce:	0050 
    20d0:	7028           	moveq #40,d0
    20d2:	2f40 004c      	move.l d0,76(sp)
    20d6:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    20dc:	2c40           	movea.l d0,a6
    20de:	222f 0054      	move.l 84(sp),d1
    20e2:	242f 0050      	move.l 80(sp),d2
    20e6:	262f 004c      	move.l 76(sp),d3
    20ea:	4eae ffd0      	jsr -48(a6)
    20ee:	2f40 0048      	move.l d0,72(sp)
    20f2:	6000 0362      	bra.w 2456 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    20f6:	7028           	moveq #40,d0
    20f8:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    20fc:	52af 0104      	addq.l #1,260(sp)
    2100:	7001           	moveq #1,d0
    2102:	b0af 0104      	cmp.l 260(sp),d0
    2106:	6c9c           	bge.s 20a4 <Test_Zoom2+0x228>
  //srcbig-shift   0001 0101 0101 0101
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       ssbb bbbb bbbb bbbb
  //result:        1001 0101 0101 0101

  hw->bltcon1 = 2 << 12; //Shift src big
    2108:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    210e:	317c 2000 0042 	move.w #8192,66(a0)
  hw->bltcdat = 0xc000; //Show channel small if 1 else channel big
    2114:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    211a:	317c c000 0070 	move.w #-16384,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2120:	4878 0001      	pea 1 <_start+0x1>
    2124:	4878 004e      	pea 4e <_start+0x4e>
    2128:	4878 0026      	pea 26 <_start+0x26>
    212c:	4878 0002      	pea 2 <_start+0x2>
    2130:	2f2f 00d4      	move.l 212(sp),-(sp)
    2134:	2f2f 00e8      	move.l 232(sp),-(sp)
    2138:	2f2f 00fc      	move.l 252(sp),-(sp)
    213c:	4eba f074      	jsr 11b2 <Zoom_ZoomBlit2>(pc)
    2140:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2144:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    214a:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    2150:	2c40           	movea.l d0,a6
    2152:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2156:	42af 0100      	clr.l 256(sp)
    215a:	605c           	bra.s 21b8 <Test_Zoom2+0x33c>
    if( *tmp != 0x9555 ) {
    215c:	206f 0108      	movea.l 264(sp),a0
    2160:	3010           	move.w (a0),d0
    2162:	0c40 9555      	cmpi.w #-27307,d0
    2166:	6746           	beq.s 21ae <Test_Zoom2+0x332>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 2 failed\n", 40);
    2168:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    216e:	2c40           	movea.l d0,a6
    2170:	4eae ffc4      	jsr -60(a6)
    2174:	2f40 006c      	move.l d0,108(sp)
    2178:	202f 006c      	move.l 108(sp),d0
    217c:	2f40 0068      	move.l d0,104(sp)
    2180:	2f7c 0000 7d5d 	move.l #32093,100(sp)
    2186:	0064 
    2188:	7028           	moveq #40,d0
    218a:	2f40 0060      	move.l d0,96(sp)
    218e:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2194:	2c40           	movea.l d0,a6
    2196:	222f 0068      	move.l 104(sp),d1
    219a:	242f 0064      	move.l 100(sp),d2
    219e:	262f 0060      	move.l 96(sp),d3
    21a2:	4eae ffd0      	jsr -48(a6)
    21a6:	2f40 005c      	move.l d0,92(sp)
    21aa:	6000 02aa      	bra.w 2456 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    21ae:	7028           	moveq #40,d0
    21b0:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    21b4:	52af 0100      	addq.l #1,256(sp)
    21b8:	7001           	moveq #1,d0
    21ba:	b0af 0100      	cmp.l 256(sp),d0
    21be:	6c9c           	bge.s 215c <Test_Zoom2+0x2e0>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    21c0:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    21c6:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    21cc:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    21d2:	317c e000 0070 	move.w #-8192,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    21d8:	4878 0001      	pea 1 <_start+0x1>
    21dc:	4878 004e      	pea 4e <_start+0x4e>
    21e0:	4878 0026      	pea 26 <_start+0x26>
    21e4:	4878 0002      	pea 2 <_start+0x2>
    21e8:	2f2f 00d4      	move.l 212(sp),-(sp)
    21ec:	2f2f 00e8      	move.l 232(sp),-(sp)
    21f0:	2f2f 00fc      	move.l 252(sp),-(sp)
    21f4:	4eba efbc      	jsr 11b2 <Zoom_ZoomBlit2>(pc)
    21f8:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    21fc:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2202:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    2208:	2c40           	movea.l d0,a6
    220a:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    220e:	42af 00fc      	clr.l 252(sp)
    2212:	605c           	bra.s 2270 <Test_Zoom2+0x3f4>
    if( *tmp != 0xaaaa ) {
    2214:	206f 0108      	movea.l 264(sp),a0
    2218:	3010           	move.w (a0),d0
    221a:	0c40 aaaa      	cmpi.w #-21846,d0
    221e:	6746           	beq.s 2266 <Test_Zoom2+0x3ea>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    2220:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2226:	2c40           	movea.l d0,a6
    2228:	4eae ffc4      	jsr -60(a6)
    222c:	2f40 0080      	move.l d0,128(sp)
    2230:	202f 0080      	move.l 128(sp),d0
    2234:	2f40 007c      	move.l d0,124(sp)
    2238:	2f7c 0000 7d86 	move.l #32134,120(sp)
    223e:	0078 
    2240:	7028           	moveq #40,d0
    2242:	2f40 0074      	move.l d0,116(sp)
    2246:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    224c:	2c40           	movea.l d0,a6
    224e:	222f 007c      	move.l 124(sp),d1
    2252:	242f 0078      	move.l 120(sp),d2
    2256:	262f 0074      	move.l 116(sp),d3
    225a:	4eae ffd0      	jsr -48(a6)
    225e:	2f40 0070      	move.l d0,112(sp)
    2262:	6000 01f2      	bra.w 2456 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    2266:	7028           	moveq #40,d0
    2268:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    226c:	52af 00fc      	addq.l #1,252(sp)
    2270:	7001           	moveq #1,d0
    2272:	b0af 00fc      	cmp.l 252(sp),d0
    2276:	6c9c           	bge.s 2214 <Test_Zoom2+0x398>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2278:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    227e:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    2284:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    228a:	317c e000 0070 	move.w #-8192,112(a0)

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2290:	4878 0001      	pea 1 <_start+0x1>
    2294:	4878 004e      	pea 4e <_start+0x4e>
    2298:	4878 0026      	pea 26 <_start+0x26>
    229c:	4878 0002      	pea 2 <_start+0x2>
    22a0:	2f2f 00d4      	move.l 212(sp),-(sp)
    22a4:	2f2f 00e8      	move.l 232(sp),-(sp)
    22a8:	2f2f 00fc      	move.l 252(sp),-(sp)
    22ac:	4eba ef04      	jsr 11b2 <Zoom_ZoomBlit2>(pc)
    22b0:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    22b4:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    22ba:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    22c0:	2c40           	movea.l d0,a6
    22c2:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    22c6:	42af 00f8      	clr.l 248(sp)
    22ca:	605c           	bra.s 2328 <Test_Zoom2+0x4ac>
    if( *tmp != 0xaaaa ) {
    22cc:	206f 0108      	movea.l 264(sp),a0
    22d0:	3010           	move.w (a0),d0
    22d2:	0c40 aaaa      	cmpi.w #-21846,d0
    22d6:	6746           	beq.s 231e <Test_Zoom2+0x4a2>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    22d8:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    22de:	2c40           	movea.l d0,a6
    22e0:	4eae ffc4      	jsr -60(a6)
    22e4:	2f40 0094      	move.l d0,148(sp)
    22e8:	202f 0094      	move.l 148(sp),d0
    22ec:	2f40 0090      	move.l d0,144(sp)
    22f0:	2f7c 0000 7d86 	move.l #32134,140(sp)
    22f6:	008c 
    22f8:	7028           	moveq #40,d0
    22fa:	2f40 0088      	move.l d0,136(sp)
    22fe:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2304:	2c40           	movea.l d0,a6
    2306:	222f 0090      	move.l 144(sp),d1
    230a:	242f 008c      	move.l 140(sp),d2
    230e:	262f 0088      	move.l 136(sp),d3
    2312:	4eae ffd0      	jsr -48(a6)
    2316:	2f40 0084      	move.l d0,132(sp)
    231a:	6000 013a      	bra.w 2456 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    231e:	7028           	moveq #40,d0
    2320:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2324:	52af 00f8      	addq.l #1,248(sp)
    2328:	7001           	moveq #1,d0
    232a:	b0af 00f8      	cmp.l 248(sp),d0
    232e:	6c9c           	bge.s 22cc <Test_Zoom2+0x450>
  //srcsmall:            1010 1010 1010 1010
  //srcsmall-shift:      0101 0101 0101 0101
  //pattern:             sssb bbbb bbbb bbbb
  //result:              0100 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2330:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    2336:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    233c:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    2342:	317c e000 0070 	move.w #-8192,112(a0)
  hw->bltcon0 = 0xde4 + (1 << 12); //Chanell settings and Shift src small
    2348:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    234e:	317c 1de4 0040 	move.w #7652,64(a0)
 
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2354:	4878 0001      	pea 1 <_start+0x1>
    2358:	4878 004e      	pea 4e <_start+0x4e>
    235c:	4878 0026      	pea 26 <_start+0x26>
    2360:	4878 0002      	pea 2 <_start+0x2>
    2364:	2f2f 00d4      	move.l 212(sp),-(sp)
    2368:	2f2f 00e8      	move.l 232(sp),-(sp)
    236c:	2f2f 00fc      	move.l 252(sp),-(sp)
    2370:	4eba ee40      	jsr 11b2 <Zoom_ZoomBlit2>(pc)
    2374:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2378:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    237e:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    2384:	2c40           	movea.l d0,a6
    2386:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    238a:	42af 00f4      	clr.l 244(sp)
    238e:	605a           	bra.s 23ea <Test_Zoom2+0x56e>
    if( *tmp != 0x4aaa ) {
    2390:	206f 0108      	movea.l 264(sp),a0
    2394:	3010           	move.w (a0),d0
    2396:	0c40 4aaa      	cmpi.w #19114,d0
    239a:	6744           	beq.s 23e0 <Test_Zoom2+0x564>
      Write( Output(), "Test_Zoom2: Test for shifting a failed\n", 39);
    239c:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    23a2:	2c40           	movea.l d0,a6
    23a4:	4eae ffc4      	jsr -60(a6)
    23a8:	2f40 00a8      	move.l d0,168(sp)
    23ac:	202f 00a8      	move.l 168(sp),d0
    23b0:	2f40 00a4      	move.l d0,164(sp)
    23b4:	2f7c 0000 7daf 	move.l #32175,160(sp)
    23ba:	00a0 
    23bc:	7027           	moveq #39,d0
    23be:	2f40 009c      	move.l d0,156(sp)
    23c2:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    23c8:	2c40           	movea.l d0,a6
    23ca:	222f 00a4      	move.l 164(sp),d1
    23ce:	242f 00a0      	move.l 160(sp),d2
    23d2:	262f 009c      	move.l 156(sp),d3
    23d6:	4eae ffd0      	jsr -48(a6)
    23da:	2f40 0098      	move.l d0,152(sp)
    23de:	6076           	bra.s 2456 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    23e0:	7028           	moveq #40,d0
    23e2:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    23e6:	52af 00f4      	addq.l #1,244(sp)
    23ea:	7001           	moveq #1,d0
    23ec:	b0af 00f4      	cmp.l 244(sp),d0
    23f0:	6c9e           	bge.s 2390 <Test_Zoom2+0x514>

  FreeMem( srcsmall, 80);
    23f2:	2f6f 00e4 00c0 	move.l 228(sp),192(sp)
    23f8:	7050           	moveq #80,d0
    23fa:	2f40 00bc      	move.l d0,188(sp)
    23fe:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    2404:	2c40           	movea.l d0,a6
    2406:	226f 00c0      	movea.l 192(sp),a1
    240a:	202f 00bc      	move.l 188(sp),d0
    240e:	4eae ff2e      	jsr -210(a6)
  FreeMem( srcbig, 160);
    2412:	2f6f 00d4 00b8 	move.l 212(sp),184(sp)
    2418:	2f7c 0000 00a0 	move.l #160,180(sp)
    241e:	00b4 
    2420:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    2426:	2c40           	movea.l d0,a6
    2428:	226f 00b8      	movea.l 184(sp),a1
    242c:	202f 00b4      	move.l 180(sp),d0
    2430:	4eae ff2e      	jsr -210(a6)
  FreeMem( target, 168);
    2434:	2f6f 00c4 00b0 	move.l 196(sp),176(sp)
    243a:	2f7c 0000 00a8 	move.l #168,172(sp)
    2440:	00ac 
    2442:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    2448:	2c40           	movea.l d0,a6
    244a:	226f 00b0      	movea.l 176(sp),a1
    244e:	202f 00ac      	move.l 172(sp),d0
    2452:	4eae ff2e      	jsr -210(a6)
    2456:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    245a:	4fef 0100      	lea 256(sp),sp
    245e:	4e75           	rts

00002460 <ClBuild>:
#include "utils.h"




ULONG * ClBuild() {
    2460:	4fef ffc4      	lea -60(sp),sp
    2464:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
    2468:	2f7c 0000 0084 	move.l #132,48(sp)
    246e:	0030 
    2470:	7002           	moveq #2,d0
    2472:	2f40 002c      	move.l d0,44(sp)
    2476:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    247c:	2c40           	movea.l d0,a6
    247e:	202f 0030      	move.l 48(sp),d0
    2482:	222f 002c      	move.l 44(sp),d1
    2486:	4eae ff3a      	jsr -198(a6)
    248a:	2f40 0028      	move.l d0,40(sp)
    248e:	202f 0028      	move.l 40(sp),d0
    2492:	2f40 0024      	move.l d0,36(sp)
  if( retval == 0) {
    2496:	6658           	bne.s 24f0 <ClBuild+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2498:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    249e:	2c40           	movea.l d0,a6
    24a0:	4eae ffc4      	jsr -60(a6)
    24a4:	2f40 0020      	move.l d0,32(sp)
    24a8:	202f 0020      	move.l 32(sp),d0
    24ac:	2f40 001c      	move.l d0,28(sp)
    24b0:	2f7c 0000 7c83 	move.l #31875,24(sp)
    24b6:	0018 
    24b8:	7228           	moveq #40,d1
    24ba:	2f41 0014      	move.l d1,20(sp)
    24be:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    24c4:	2c40           	movea.l d0,a6
    24c6:	222f 001c      	move.l 28(sp),d1
    24ca:	242f 0018      	move.l 24(sp),d2
    24ce:	262f 0014      	move.l 20(sp),d3
    24d2:	4eae ffd0      	jsr -48(a6)
    24d6:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    24da:	7401           	moveq #1,d2
    24dc:	2f42 000c      	move.l d2,12(sp)
    24e0:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    24e6:	2c40           	movea.l d0,a6
    24e8:	222f 000c      	move.l 12(sp),d1
    24ec:	4eae ff70      	jsr -144(a6)
  }
    
  ULONG *cl = retval;
    24f0:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    24f6:	2f7c 0000 a5dc 	move.l #42460,64(sp)
    24fc:	0040 
  for(int i=0; i<16;i++)
    24fe:	42af 003c      	clr.l 60(sp)
    2502:	6024           	bra.s 2528 <ClBuild+0xc8>
    *cl++ = *clpartinstruction++;
    2504:	222f 0040      	move.l 64(sp),d1
    2508:	2001           	move.l d1,d0
    250a:	5880           	addq.l #4,d0
    250c:	2f40 0040      	move.l d0,64(sp)
    2510:	202f 0044      	move.l 68(sp),d0
    2514:	2400           	move.l d0,d2
    2516:	5882           	addq.l #4,d2
    2518:	2f42 0044      	move.l d2,68(sp)
    251c:	2041           	movea.l d1,a0
    251e:	2210           	move.l (a0),d1
    2520:	2040           	movea.l d0,a0
    2522:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    2524:	52af 003c      	addq.l #1,60(sp)
    2528:	700f           	moveq #15,d0
    252a:	b0af 003c      	cmp.l 60(sp),d0
    252e:	6cd4           	bge.s 2504 <ClBuild+0xa4>
  clpartinstruction = ClScreen;
    2530:	2f7c 0000 a61c 	move.l #42524,64(sp)
    2536:	0040 
  for(int i=0; i<12;i++)
    2538:	42af 0038      	clr.l 56(sp)
    253c:	6024           	bra.s 2562 <ClBuild+0x102>
    *cl++ = *clpartinstruction++;
    253e:	222f 0040      	move.l 64(sp),d1
    2542:	2401           	move.l d1,d2
    2544:	5882           	addq.l #4,d2
    2546:	2f42 0040      	move.l d2,64(sp)
    254a:	202f 0044      	move.l 68(sp),d0
    254e:	2400           	move.l d0,d2
    2550:	5882           	addq.l #4,d2
    2552:	2f42 0044      	move.l d2,68(sp)
    2556:	2041           	movea.l d1,a0
    2558:	2210           	move.l (a0),d1
    255a:	2040           	movea.l d0,a0
    255c:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    255e:	52af 0038      	addq.l #1,56(sp)
    2562:	700b           	moveq #11,d0
    2564:	b0af 0038      	cmp.l 56(sp),d0
    2568:	6cd4           	bge.s 253e <ClBuild+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    256a:	202f 0044      	move.l 68(sp),d0
    256e:	2200           	move.l d0,d1
    2570:	5881           	addq.l #4,d1
    2572:	2f41 0044      	move.l d1,68(sp)
    2576:	2040           	movea.l d0,a0
    2578:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    257e:	202f 0044      	move.l 68(sp),d0
    2582:	2200           	move.l d0,d1
    2584:	5881           	addq.l #4,d1
    2586:	2f41 0044      	move.l d1,68(sp)
    258a:	2040           	movea.l d0,a0
    258c:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
    2592:	2f7c 0000 a55c 	move.l #42332,64(sp)
    2598:	0040 
  for(int i=0; i<2;i++)
    259a:	42af 0034      	clr.l 52(sp)
    259e:	6024           	bra.s 25c4 <ClBuild+0x164>
    *cl++ = *clpartinstruction++;
    25a0:	222f 0040      	move.l 64(sp),d1
    25a4:	2001           	move.l d1,d0
    25a6:	5880           	addq.l #4,d0
    25a8:	2f40 0040      	move.l d0,64(sp)
    25ac:	202f 0044      	move.l 68(sp),d0
    25b0:	2400           	move.l d0,d2
    25b2:	5882           	addq.l #4,d2
    25b4:	2f42 0044      	move.l d2,68(sp)
    25b8:	2041           	movea.l d1,a0
    25ba:	2210           	move.l (a0),d1
    25bc:	2040           	movea.l d0,a0
    25be:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
    25c0:	52af 0034      	addq.l #1,52(sp)
    25c4:	7001           	moveq #1,d0
    25c6:	b0af 0034      	cmp.l 52(sp),d0
    25ca:	6cd4           	bge.s 25a0 <ClBuild+0x140>
  *cl = 0xfffffffe;
    25cc:	206f 0044      	movea.l 68(sp),a0
    25d0:	72fe           	moveq #-2,d1
    25d2:	2081           	move.l d1,(a0)

  return retval;
    25d4:	202f 0024      	move.l 36(sp),d0
}
    25d8:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    25dc:	4fef 003c      	lea 60(sp),sp
    25e0:	4e75           	rts

000025e2 <PrepareDisplay>:

int PrepareDisplay() {
    25e2:	4fef ffb8      	lea -72(sp),sp
    25e6:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClBuild( );
    25ea:	4eba fe74      	jsr 2460 <ClBuild>(pc)
    25ee:	23c0 0016 b994 	move.l d0,16b994 <Copperlist1>
  Copperlist2 = ClBuild( );
    25f4:	4eba fe6a      	jsr 2460 <ClBuild>(pc)
    25f8:	23c0 0016 b998 	move.l d0,16b998 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    25fe:	2f7c 0000 c800 	move.l #51200,80(sp)
    2604:	0050 
    2606:	7002           	moveq #2,d0
    2608:	2f40 004c      	move.l d0,76(sp)
    260c:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    2612:	2c40           	movea.l d0,a6
    2614:	202f 0050      	move.l 80(sp),d0
    2618:	222f 004c      	move.l 76(sp),d1
    261c:	4eae ff3a      	jsr -198(a6)
    2620:	2f40 0048      	move.l d0,72(sp)
    2624:	202f 0048      	move.l 72(sp),d0
    2628:	23c0 0016 b98c 	move.l d0,16b98c <Bitplane1>
  if(Bitplane1 == 0) {
    262e:	2039 0016 b98c 	move.l 16b98c <Bitplane1>,d0
    2634:	6658           	bne.s 268e <PrepareDisplay+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2636:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    263c:	2c40           	movea.l d0,a6
    263e:	4eae ffc4      	jsr -60(a6)
    2642:	2f40 0044      	move.l d0,68(sp)
    2646:	202f 0044      	move.l 68(sp),d0
    264a:	2f40 0040      	move.l d0,64(sp)
    264e:	2f7c 0000 7c35 	move.l #31797,60(sp)
    2654:	003c 
    2656:	7026           	moveq #38,d0
    2658:	2f40 0038      	move.l d0,56(sp)
    265c:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2662:	2c40           	movea.l d0,a6
    2664:	222f 0040      	move.l 64(sp),d1
    2668:	242f 003c      	move.l 60(sp),d2
    266c:	262f 0038      	move.l 56(sp),d3
    2670:	4eae ffd0      	jsr -48(a6)
    2674:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    2678:	7001           	moveq #1,d0
    267a:	2f40 0030      	move.l d0,48(sp)
    267e:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2684:	2c40           	movea.l d0,a6
    2686:	222f 0030      	move.l 48(sp),d1
    268a:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane1;
    268e:	2039 0016 b98c 	move.l 16b98c <Bitplane1>,d0
    2694:	23c0 0016 b9a0 	move.l d0,16b9a0 <ViewBuffer>
  ViewCopper = Copperlist1;
    269a:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    26a0:	23c0 0016 b9a8 	move.l d0,16b9a8 <ViewCopper>
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    26a6:	2f7c 0000 c800 	move.l #51200,44(sp)
    26ac:	002c 
    26ae:	7002           	moveq #2,d0
    26b0:	2f40 0028      	move.l d0,40(sp)
    26b4:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    26ba:	2c40           	movea.l d0,a6
    26bc:	202f 002c      	move.l 44(sp),d0
    26c0:	222f 0028      	move.l 40(sp),d1
    26c4:	4eae ff3a      	jsr -198(a6)
    26c8:	2f40 0024      	move.l d0,36(sp)
    26cc:	202f 0024      	move.l 36(sp),d0
    26d0:	23c0 0016 b990 	move.l d0,16b990 <Bitplane2>
  if(Bitplane2 == 0) {
    26d6:	2039 0016 b990 	move.l 16b990 <Bitplane2>,d0
    26dc:	6658           	bne.s 2736 <PrepareDisplay+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    26de:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    26e4:	2c40           	movea.l d0,a6
    26e6:	4eae ffc4      	jsr -60(a6)
    26ea:	2f40 0020      	move.l d0,32(sp)
    26ee:	202f 0020      	move.l 32(sp),d0
    26f2:	2f40 001c      	move.l d0,28(sp)
    26f6:	2f7c 0000 7c5c 	move.l #31836,24(sp)
    26fc:	0018 
    26fe:	7026           	moveq #38,d0
    2700:	2f40 0014      	move.l d0,20(sp)
    2704:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    270a:	2c40           	movea.l d0,a6
    270c:	222f 001c      	move.l 28(sp),d1
    2710:	242f 0018      	move.l 24(sp),d2
    2714:	262f 0014      	move.l 20(sp),d3
    2718:	4eae ffd0      	jsr -48(a6)
    271c:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    2720:	7001           	moveq #1,d0
    2722:	2f40 000c      	move.l d0,12(sp)
    2726:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    272c:	2c40           	movea.l d0,a6
    272e:	222f 000c      	move.l 12(sp),d1
    2732:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane2;
    2736:	2039 0016 b990 	move.l 16b990 <Bitplane2>,d0
    273c:	23c0 0016 b99c 	move.l d0,16b99c <DrawBuffer>
  DrawCopper = Copperlist2;
    2742:	2039 0016 b998 	move.l 16b998 <Copperlist2>,d0
    2748:	23c0 0016 b9a4 	move.l d0,16b9a4 <DrawCopper>
  /*SwapCl();
  SetBplPointers();
  SwapCl();
  SetBplPointers();*/
  return 0;
    274e:	7000           	moveq #0,d0
}
    2750:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2754:	4fef 0048      	lea 72(sp),sp
    2758:	4e75           	rts

0000275a <TestCopperlistBatch>:

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                  long length) {
    275a:	598f           	subq.l #4,sp
  for( int i=0;i<length;i++)
    275c:	4297           	clr.l (sp)
    275e:	602a           	bra.s 278a <TestCopperlistBatch+0x30>
    if( instructions[ pos+i] != batch[ i])
    2760:	202f 000c      	move.l 12(sp),d0
    2764:	d097           	add.l (sp),d0
    2766:	d080           	add.l d0,d0
    2768:	d080           	add.l d0,d0
    276a:	206f 0008      	movea.l 8(sp),a0
    276e:	d1c0           	adda.l d0,a0
    2770:	2210           	move.l (a0),d1
    2772:	2017           	move.l (sp),d0
    2774:	d080           	add.l d0,d0
    2776:	d080           	add.l d0,d0
    2778:	206f 0010      	movea.l 16(sp),a0
    277c:	d1c0           	adda.l d0,a0
    277e:	2010           	move.l (a0),d0
    2780:	b081           	cmp.l d1,d0
    2782:	6704           	beq.s 2788 <TestCopperlistBatch+0x2e>
      return 0;
    2784:	7000           	moveq #0,d0
    2786:	600c           	bra.s 2794 <TestCopperlistBatch+0x3a>
  for( int i=0;i<length;i++)
    2788:	5297           	addq.l #1,(sp)
    278a:	2017           	move.l (sp),d0
    278c:	b0af 0014      	cmp.l 20(sp),d0
    2790:	6dce           	blt.s 2760 <TestCopperlistBatch+0x6>
  return 1;
    2792:	7001           	moveq #1,d0
}
    2794:	588f           	addq.l #4,sp
    2796:	4e75           	rts

00002798 <TestCopperlistPos>:

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    2798:	202f 0008      	move.l 8(sp),d0
    279c:	d080           	add.l d0,d0
    279e:	d080           	add.l d0,d0
    27a0:	206f 0004      	movea.l 4(sp),a0
    27a4:	d1c0           	adda.l d0,a0
    27a6:	2010           	move.l (a0),d0
    27a8:	b0af 000c      	cmp.l 12(sp),d0
    27ac:	6604           	bne.s 27b2 <TestCopperlistPos+0x1a>
    return 1;
    27ae:	7001           	moveq #1,d0
    27b0:	6002           	bra.s 27b4 <TestCopperlistPos+0x1c>
  else 
    return 0;
    27b2:	7000           	moveq #0,d0
}
    27b4:	4e75           	rts

000027b6 <TestCopperList>:

void TestCopperList() {
    27b6:	4fef feb8      	lea -328(sp),sp
    27ba:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Write( Output(), "%d", hw->cop1lc);
    27be:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    27c4:	2c40           	movea.l d0,a6
    27c6:	4eae ffc4      	jsr -60(a6)
    27ca:	2f40 0150      	move.l d0,336(sp)
    27ce:	202f 0150      	move.l 336(sp),d0
    27d2:	2f40 014c      	move.l d0,332(sp)
    27d6:	2f7c 0000 7dd7 	move.l #32215,328(sp)
    27dc:	0148 
    27de:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    27e4:	2028 0080      	move.l 128(a0),d0
    27e8:	2f40 0144      	move.l d0,324(sp)
    27ec:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    27f2:	2c40           	movea.l d0,a6
    27f4:	222f 014c      	move.l 332(sp),d1
    27f8:	242f 0148      	move.l 328(sp),d2
    27fc:	262f 0144      	move.l 324(sp),d3
    2800:	4eae ffd0      	jsr -48(a6)
    2804:	2f40 0140      	move.l d0,320(sp)
  Copperlist1 = ClBuild();
    2808:	4eba fc56      	jsr 2460 <ClBuild>(pc)
    280c:	23c0 0016 b994 	move.l d0,16b994 <Copperlist1>
  DrawCopper = Copperlist1;
    2812:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    2818:	23c0 0016 b9a4 	move.l d0,16b9a4 <DrawCopper>
  Copperlist2 = ClBuild();
    281e:	4eba fc40      	jsr 2460 <ClBuild>(pc)
    2822:	23c0 0016 b998 	move.l d0,16b998 <Copperlist2>
  ViewCopper = Copperlist2;
    2828:	2039 0016 b998 	move.l 16b998 <Copperlist2>,d0
    282e:	23c0 0016 b9a8 	move.l d0,16b9a8 <ViewCopper>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2834:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    283a:	4878 0010      	pea 10 <_start+0x10>
    283e:	4879 0000 a5dc 	pea a5dc <ClsSprites>
    2844:	42a7           	clr.l -(sp)
    2846:	2f00           	move.l d0,-(sp)
    2848:	4eba ff10      	jsr 275a <TestCopperlistBatch>(pc)
    284c:	4fef 0010      	lea 16(sp),sp
    2850:	4a80           	tst.l d0
    2852:	6642           	bne.s 2896 <TestCopperList+0xe0>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    2854:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    285a:	2c40           	movea.l d0,a6
    285c:	4eae ffc4      	jsr -60(a6)
    2860:	2f40 013c      	move.l d0,316(sp)
    2864:	202f 013c      	move.l 316(sp),d0
    2868:	2f40 0138      	move.l d0,312(sp)
    286c:	2f7c 0000 75a0 	move.l #30112,308(sp)
    2872:	0134 
    2874:	702c           	moveq #44,d0
    2876:	2f40 0130      	move.l d0,304(sp)
    287a:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2880:	2c40           	movea.l d0,a6
    2882:	222f 0138      	move.l 312(sp),d1
    2886:	242f 0134      	move.l 308(sp),d2
    288a:	262f 0130      	move.l 304(sp),d3
    288e:	4eae ffd0      	jsr -48(a6)
    2892:	2f40 012c      	move.l d0,300(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2896:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    289c:	4878 000c      	pea c <_start+0xc>
    28a0:	4879 0000 a61c 	pea a61c <ClScreen>
    28a6:	4878 0010      	pea 10 <_start+0x10>
    28aa:	2f00           	move.l d0,-(sp)
    28ac:	4eba feac      	jsr 275a <TestCopperlistBatch>(pc)
    28b0:	4fef 0010      	lea 16(sp),sp
    28b4:	4a80           	tst.l d0
    28b6:	6642           	bne.s 28fa <TestCopperList+0x144>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    28b8:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    28be:	2c40           	movea.l d0,a6
    28c0:	4eae ffc4      	jsr -60(a6)
    28c4:	2f40 0128      	move.l d0,296(sp)
    28c8:	202f 0128      	move.l 296(sp),d0
    28cc:	2f40 0124      	move.l d0,292(sp)
    28d0:	2f7c 0000 75d6 	move.l #30166,288(sp)
    28d6:	0120 
    28d8:	7036           	moveq #54,d0
    28da:	2f40 011c      	move.l d0,284(sp)
    28de:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    28e4:	2c40           	movea.l d0,a6
    28e6:	222f 0124      	move.l 292(sp),d1
    28ea:	242f 0120      	move.l 288(sp),d2
    28ee:	262f 011c      	move.l 284(sp),d3
    28f2:	4eae ffd0      	jsr -48(a6)
    28f6:	2f40 0118      	move.l d0,280(sp)
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
    28fa:	23fc 0004 0000 	move.l #262144,16b99c <DrawBuffer>
    2900:	0016 b99c 
  ViewBuffer = (ULONG *)0x50000;
    2904:	23fc 0005 0000 	move.l #327680,16b9a0 <ViewBuffer>
    290a:	0016 b9a0 
  
  SetBplPointers();
    290e:	4eba d886      	jsr 196 <SetBplPointers>(pc)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    2912:	2039 0016 b99c 	move.l 16b99c <DrawBuffer>,d0
    2918:	0c80 0005 0000 	cmpi.l #327680,d0
    291e:	660e           	bne.s 292e <TestCopperList+0x178>
    2920:	2039 0016 b9a0 	move.l 16b9a0 <ViewBuffer>,d0
    2926:	0c80 0004 0000 	cmpi.l #262144,d0
    292c:	6742           	beq.s 2970 <TestCopperList+0x1ba>
    Write( Output(), 
    292e:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2934:	2c40           	movea.l d0,a6
    2936:	4eae ffc4      	jsr -60(a6)
    293a:	2f40 0114      	move.l d0,276(sp)
    293e:	202f 0114      	move.l 276(sp),d0
    2942:	2f40 0110      	move.l d0,272(sp)
    2946:	2f7c 0000 7dda 	move.l #32218,268(sp)
    294c:	010c 
    294e:	703b           	moveq #59,d0
    2950:	2f40 0108      	move.l d0,264(sp)
    2954:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    295a:	2c40           	movea.l d0,a6
    295c:	222f 0110      	move.l 272(sp),d1
    2960:	242f 010c      	move.l 268(sp),d2
    2964:	262f 0108      	move.l 264(sp),d3
    2968:	4eae ffd0      	jsr -48(a6)
    296c:	2f40 0104      	move.l d0,260(sp)
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    2970:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    2976:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    297c:	4878 001c      	pea 1c <_start+0x1c>
    2980:	2f00           	move.l d0,-(sp)
    2982:	4eba fe14      	jsr 2798 <TestCopperlistPos>(pc)
    2986:	4fef 000c      	lea 12(sp),sp
    298a:	4a80           	tst.l d0
    298c:	6642           	bne.s 29d0 <TestCopperList+0x21a>
    Write(Output(), 
    298e:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2994:	2c40           	movea.l d0,a6
    2996:	4eae ffc4      	jsr -60(a6)
    299a:	2f40 0100      	move.l d0,256(sp)
    299e:	202f 0100      	move.l 256(sp),d0
    29a2:	2f40 00fc      	move.l d0,252(sp)
    29a6:	2f7c 0000 7e16 	move.l #32278,248(sp)
    29ac:	00f8 
    29ae:	703c           	moveq #60,d0
    29b0:	2f40 00f4      	move.l d0,244(sp)
    29b4:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    29ba:	2c40           	movea.l d0,a6
    29bc:	222f 00fc      	move.l 252(sp),d1
    29c0:	242f 00f8      	move.l 248(sp),d2
    29c4:	262f 00f4      	move.l 244(sp),d3
    29c8:	4eae ffd0      	jsr -48(a6)
    29cc:	2f40 00f0      	move.l d0,240(sp)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    29d0:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    29d6:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    29dc:	4878 001d      	pea 1d <_start+0x1d>
    29e0:	2f00           	move.l d0,-(sp)
    29e2:	4eba fdb4      	jsr 2798 <TestCopperlistPos>(pc)
    29e6:	4fef 000c      	lea 12(sp),sp
    29ea:	4a80           	tst.l d0
    29ec:	6642           	bne.s 2a30 <TestCopperList+0x27a>
    Write(Output(), 
    29ee:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    29f4:	2c40           	movea.l d0,a6
    29f6:	4eae ffc4      	jsr -60(a6)
    29fa:	2f40 00ec      	move.l d0,236(sp)
    29fe:	202f 00ec      	move.l 236(sp),d0
    2a02:	2f40 00e8      	move.l d0,232(sp)
    2a06:	2f7c 0000 7e53 	move.l #32339,228(sp)
    2a0c:	00e4 
    2a0e:	703c           	moveq #60,d0
    2a10:	2f40 00e0      	move.l d0,224(sp)
    2a14:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2a1a:	2c40           	movea.l d0,a6
    2a1c:	222f 00e8      	move.l 232(sp),d1
    2a20:	242f 00e4      	move.l 228(sp),d2
    2a24:	262f 00e0      	move.l 224(sp),d3
    2a28:	4eae ffd0      	jsr -48(a6)
    2a2c:	2f40 00dc      	move.l d0,220(sp)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2a30:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    2a36:	4878 0002      	pea 2 <_start+0x2>
    2a3a:	4879 0000 a55c 	pea a55c <ClColor>
    2a40:	4878 001e      	pea 1e <_start+0x1e>
    2a44:	2f00           	move.l d0,-(sp)
    2a46:	4eba fd12      	jsr 275a <TestCopperlistBatch>(pc)
    2a4a:	4fef 0010      	lea 16(sp),sp
    2a4e:	4a80           	tst.l d0
    2a50:	6642           	bne.s 2a94 <TestCopperList+0x2de>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2a52:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2a58:	2c40           	movea.l d0,a6
    2a5a:	4eae ffc4      	jsr -60(a6)
    2a5e:	2f40 00d8      	move.l d0,216(sp)
    2a62:	202f 00d8      	move.l 216(sp),d0
    2a66:	2f40 00d4      	move.l d0,212(sp)
    2a6a:	2f7c 0000 760d 	move.l #30221,208(sp)
    2a70:	00d0 
    2a72:	7021           	moveq #33,d0
    2a74:	2f40 00cc      	move.l d0,204(sp)
    2a78:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2a7e:	2c40           	movea.l d0,a6
    2a80:	222f 00d4      	move.l 212(sp),d1
    2a84:	242f 00d0      	move.l 208(sp),d2
    2a88:	262f 00cc      	move.l 204(sp),d3
    2a8c:	4eae ffd0      	jsr -48(a6)
    2a90:	2f40 00c8      	move.l d0,200(sp)

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2a94:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    2a9a:	4878 fffe      	pea fffffffe <_end+0xffe945fa>
    2a9e:	4878 0020      	pea 20 <_start+0x20>
    2aa2:	2f00           	move.l d0,-(sp)
    2aa4:	4eba fcf2      	jsr 2798 <TestCopperlistPos>(pc)
    2aa8:	4fef 000c      	lea 12(sp),sp
    2aac:	4a80           	tst.l d0
    2aae:	6642           	bne.s 2af2 <TestCopperList+0x33c>
    Write(Output(), "Copperlist End not correctly set.\n", 34);
    2ab0:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2ab6:	2c40           	movea.l d0,a6
    2ab8:	4eae ffc4      	jsr -60(a6)
    2abc:	2f40 00c4      	move.l d0,196(sp)
    2ac0:	202f 00c4      	move.l 196(sp),d0
    2ac4:	2f40 00c0      	move.l d0,192(sp)
    2ac8:	2f7c 0000 762f 	move.l #30255,188(sp)
    2ace:	00bc 
    2ad0:	7022           	moveq #34,d0
    2ad2:	2f40 00b8      	move.l d0,184(sp)
    2ad6:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2adc:	2c40           	movea.l d0,a6
    2ade:	222f 00c0      	move.l 192(sp),d1
    2ae2:	242f 00bc      	move.l 188(sp),d2
    2ae6:	262f 00b8      	move.l 184(sp),d3
    2aea:	4eae ffd0      	jsr -48(a6)
    2aee:	2f40 00b4      	move.l d0,180(sp)
  
  SwapCl();
    2af2:	4eba d700      	jsr 1f4 <SwapCl>(pc)
  
  if( DrawCopper != Copperlist2)
    2af6:	2239 0016 b9a4 	move.l 16b9a4 <DrawCopper>,d1
    2afc:	2039 0016 b998 	move.l 16b998 <Copperlist2>,d0
    2b02:	b081           	cmp.l d1,d0
    2b04:	6742           	beq.s 2b48 <TestCopperList+0x392>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
    2b06:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2b0c:	2c40           	movea.l d0,a6
    2b0e:	4eae ffc4      	jsr -60(a6)
    2b12:	2f40 00b0      	move.l d0,176(sp)
    2b16:	202f 00b0      	move.l 176(sp),d0
    2b1a:	2f40 00ac      	move.l d0,172(sp)
    2b1e:	2f7c 0000 7e90 	move.l #32400,168(sp)
    2b24:	00a8 
    2b26:	7015           	moveq #21,d0
    2b28:	2f40 00a4      	move.l d0,164(sp)
    2b2c:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2b32:	2c40           	movea.l d0,a6
    2b34:	222f 00ac      	move.l 172(sp),d1
    2b38:	242f 00a8      	move.l 168(sp),d2
    2b3c:	262f 00a4      	move.l 164(sp),d3
    2b40:	4eae ffd0      	jsr -48(a6)
    2b44:	2f40 00a0      	move.l d0,160(sp)

  
  PrepareDisplay();
    2b48:	4eba fa98      	jsr 25e2 <PrepareDisplay>(pc)
  if( DrawBuffer != Bitplane2) 
    2b4c:	2239 0016 b99c 	move.l 16b99c <DrawBuffer>,d1
    2b52:	2039 0016 b990 	move.l 16b990 <Bitplane2>,d0
    2b58:	b081           	cmp.l d1,d0
    2b5a:	6742           	beq.s 2b9e <TestCopperList+0x3e8>
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
    2b5c:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2b62:	2c40           	movea.l d0,a6
    2b64:	4eae ffc4      	jsr -60(a6)
    2b68:	2f40 009c      	move.l d0,156(sp)
    2b6c:	202f 009c      	move.l 156(sp),d0
    2b70:	2f40 0098      	move.l d0,152(sp)
    2b74:	2f7c 0000 7ea6 	move.l #32422,148(sp)
    2b7a:	0094 
    2b7c:	7037           	moveq #55,d0
    2b7e:	2f40 0090      	move.l d0,144(sp)
    2b82:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2b88:	2c40           	movea.l d0,a6
    2b8a:	222f 0098      	move.l 152(sp),d1
    2b8e:	242f 0094      	move.l 148(sp),d2
    2b92:	262f 0090      	move.l 144(sp),d3
    2b96:	4eae ffd0      	jsr -48(a6)
    2b9a:	2f40 008c      	move.l d0,140(sp)
                                                                            55);
  if( DrawCopper != Copperlist2) 
    2b9e:	2239 0016 b9a4 	move.l 16b9a4 <DrawCopper>,d1
    2ba4:	2039 0016 b998 	move.l 16b998 <Copperlist2>,d0
    2baa:	b081           	cmp.l d1,d0
    2bac:	6742           	beq.s 2bf0 <TestCopperList+0x43a>
    Write( Output(), 
    2bae:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2bb4:	2c40           	movea.l d0,a6
    2bb6:	4eae ffc4      	jsr -60(a6)
    2bba:	2f40 0088      	move.l d0,136(sp)
    2bbe:	202f 0088      	move.l 136(sp),d0
    2bc2:	2f40 0084      	move.l d0,132(sp)
    2bc6:	2f7c 0000 7ede 	move.l #32478,128(sp)
    2bcc:	0080 
    2bce:	7039           	moveq #57,d0
    2bd0:	2f40 007c      	move.l d0,124(sp)
    2bd4:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2bda:	2c40           	movea.l d0,a6
    2bdc:	222f 0084      	move.l 132(sp),d1
    2be0:	242f 0080      	move.l 128(sp),d2
    2be4:	262f 007c      	move.l 124(sp),d3
    2be8:	4eae ffd0      	jsr -48(a6)
    2bec:	2f40 0078      	move.l d0,120(sp)
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
    2bf0:	2239 0016 b9a0 	move.l 16b9a0 <ViewBuffer>,d1
    2bf6:	2039 0016 b98c 	move.l 16b98c <Bitplane1>,d0
    2bfc:	b081           	cmp.l d1,d0
    2bfe:	6742           	beq.s 2c42 <TestCopperList+0x48c>
    Write( Output(), 
    2c00:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2c06:	2c40           	movea.l d0,a6
    2c08:	4eae ffc4      	jsr -60(a6)
    2c0c:	2f40 0074      	move.l d0,116(sp)
    2c10:	202f 0074      	move.l 116(sp),d0
    2c14:	2f40 0070      	move.l d0,112(sp)
    2c18:	2f7c 0000 7f18 	move.l #32536,108(sp)
    2c1e:	006c 
    2c20:	7038           	moveq #56,d0
    2c22:	2f40 0068      	move.l d0,104(sp)
    2c26:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2c2c:	2c40           	movea.l d0,a6
    2c2e:	222f 0070      	move.l 112(sp),d1
    2c32:	242f 006c      	move.l 108(sp),d2
    2c36:	262f 0068      	move.l 104(sp),d3
    2c3a:	4eae ffd0      	jsr -48(a6)
    2c3e:	2f40 0064      	move.l d0,100(sp)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
    2c42:	2239 0016 b9a8 	move.l 16b9a8 <ViewCopper>,d1
    2c48:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    2c4e:	b081           	cmp.l d1,d0
    2c50:	6742           	beq.s 2c94 <TestCopperList+0x4de>
    Write( Output(), 
    2c52:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2c58:	2c40           	movea.l d0,a6
    2c5a:	4eae ffc4      	jsr -60(a6)
    2c5e:	2f40 0060      	move.l d0,96(sp)
    2c62:	202f 0060      	move.l 96(sp),d0
    2c66:	2f40 005c      	move.l d0,92(sp)
    2c6a:	2f7c 0000 7f51 	move.l #32593,88(sp)
    2c70:	0058 
    2c72:	703a           	moveq #58,d0
    2c74:	2f40 0054      	move.l d0,84(sp)
    2c78:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2c7e:	2c40           	movea.l d0,a6
    2c80:	222f 005c      	move.l 92(sp),d1
    2c84:	242f 0058      	move.l 88(sp),d2
    2c88:	262f 0054      	move.l 84(sp),d3
    2c8c:	4eae ffd0      	jsr -48(a6)
    2c90:	2f40 0050      	move.l d0,80(sp)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
    2c94:	4eba d500      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
    2c98:	4eba d55a      	jsr 1f4 <SwapCl>(pc)
  UWORD *copword = ViewCopper;
    2c9c:	2f79 0016 b9a8 	move.l 16b9a8 <ViewCopper>,76(sp)
    2ca2:	004c 
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2ca4:	307c 0076      	movea.w #118,a0
    2ca8:	d1ef 004c      	adda.l 76(sp),a0
    2cac:	3010           	move.w (a0),d0
    2cae:	7200           	moveq #0,d1
    2cb0:	3200           	move.w d0,d1
    2cb2:	307c 0072      	movea.w #114,a0
    2cb6:	d1ef 004c      	adda.l 76(sp),a0
    2cba:	3010           	move.w (a0),d0
    2cbc:	3000           	move.w d0,d0
    2cbe:	0280 0000 ffff 	andi.l #65535,d0
    2cc4:	4840           	swap d0
    2cc6:	4240           	clr.w d0
    2cc8:	d081           	add.l d1,d0
    2cca:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2cce:	2039 0016 b990 	move.l 16b990 <Bitplane2>,d0
    2cd4:	b0af 0048      	cmp.l 72(sp),d0
    2cd8:	6742           	beq.s 2d1c <TestCopperList+0x566>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2cda:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2ce0:	2c40           	movea.l d0,a6
    2ce2:	4eae ffc4      	jsr -60(a6)
    2ce6:	2f40 0044      	move.l d0,68(sp)
    2cea:	202f 0044      	move.l 68(sp),d0
    2cee:	2f40 0040      	move.l d0,64(sp)
    2cf2:	2f7c 0000 7f8c 	move.l #32652,60(sp)
    2cf8:	003c 
    2cfa:	7048           	moveq #72,d0
    2cfc:	2f40 0038      	move.l d0,56(sp)
    2d00:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2d06:	2c40           	movea.l d0,a6
    2d08:	222f 0040      	move.l 64(sp),d1
    2d0c:	242f 003c      	move.l 60(sp),d2
    2d10:	262f 0038      	move.l 56(sp),d3
    2d14:	4eae ffd0      	jsr -48(a6)
    2d18:	2f40 0034      	move.l d0,52(sp)
                                                   " after first frame.\n", 72);
  SetBplPointers();
    2d1c:	4eba d478      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
    2d20:	4eba d4d2      	jsr 1f4 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2d24:	2f79 0016 b9a8 	move.l 16b9a8 <ViewCopper>,76(sp)
    2d2a:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2d2c:	307c 0076      	movea.w #118,a0
    2d30:	d1ef 004c      	adda.l 76(sp),a0
    2d34:	3010           	move.w (a0),d0
    2d36:	7200           	moveq #0,d1
    2d38:	3200           	move.w d0,d1
    2d3a:	307c 0072      	movea.w #114,a0
    2d3e:	d1ef 004c      	adda.l 76(sp),a0
    2d42:	3010           	move.w (a0),d0
    2d44:	3000           	move.w d0,d0
    2d46:	0280 0000 ffff 	andi.l #65535,d0
    2d4c:	4840           	swap d0
    2d4e:	4240           	clr.w d0
    2d50:	d081           	add.l d1,d0
    2d52:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane1) 
    2d56:	2039 0016 b98c 	move.l 16b98c <Bitplane1>,d0
    2d5c:	b0af 0048      	cmp.l 72(sp),d0
    2d60:	6742           	beq.s 2da4 <TestCopperList+0x5ee>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
    2d62:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2d68:	2c40           	movea.l d0,a6
    2d6a:	4eae ffc4      	jsr -60(a6)
    2d6e:	2f40 0030      	move.l d0,48(sp)
    2d72:	202f 0030      	move.l 48(sp),d0
    2d76:	2f40 002c      	move.l d0,44(sp)
    2d7a:	2f7c 0000 7fd5 	move.l #32725,40(sp)
    2d80:	0028 
    2d82:	7049           	moveq #73,d0
    2d84:	2f40 0024      	move.l d0,36(sp)
    2d88:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2d8e:	2c40           	movea.l d0,a6
    2d90:	222f 002c      	move.l 44(sp),d1
    2d94:	242f 0028      	move.l 40(sp),d2
    2d98:	262f 0024      	move.l 36(sp),d3
    2d9c:	4eae ffd0      	jsr -48(a6)
    2da0:	2f40 0020      	move.l d0,32(sp)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
    2da4:	4eba d3f0      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
    2da8:	4eba d44a      	jsr 1f4 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2dac:	2f79 0016 b9a8 	move.l 16b9a8 <ViewCopper>,76(sp)
    2db2:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2db4:	307c 0076      	movea.w #118,a0
    2db8:	d1ef 004c      	adda.l 76(sp),a0
    2dbc:	3010           	move.w (a0),d0
    2dbe:	7200           	moveq #0,d1
    2dc0:	3200           	move.w d0,d1
    2dc2:	307c 0072      	movea.w #114,a0
    2dc6:	d1ef 004c      	adda.l 76(sp),a0
    2dca:	3010           	move.w (a0),d0
    2dcc:	3000           	move.w d0,d0
    2dce:	0280 0000 ffff 	andi.l #65535,d0
    2dd4:	4840           	swap d0
    2dd6:	4240           	clr.w d0
    2dd8:	d081           	add.l d1,d0
    2dda:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2dde:	2039 0016 b990 	move.l 16b990 <Bitplane2>,d0
    2de4:	b0af 0048      	cmp.l 72(sp),d0
    2de8:	6742           	beq.s 2e2c <TestCopperList+0x676>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2dea:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2df0:	2c40           	movea.l d0,a6
    2df2:	4eae ffc4      	jsr -60(a6)
    2df6:	2f40 001c      	move.l d0,28(sp)
    2dfa:	202f 001c      	move.l 28(sp),d0
    2dfe:	2f40 0018      	move.l d0,24(sp)
    2e02:	2f7c 0000 801f 	move.l #32799,20(sp)
    2e08:	0014 
    2e0a:	7048           	moveq #72,d0
    2e0c:	2f40 0010      	move.l d0,16(sp)
    2e10:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2e16:	2c40           	movea.l d0,a6
    2e18:	222f 0018      	move.l 24(sp),d1
    2e1c:	242f 0014      	move.l 20(sp),d2
    2e20:	262f 0010      	move.l 16(sp),d3
    2e24:	4eae ffd0      	jsr -48(a6)
    2e28:	2f40 000c      	move.l d0,12(sp)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
    2e2c:	2f3c 0000 c800 	move.l #51200,-(sp)
    2e32:	4878 0084      	pea 84 <_start+0x84>
    2e36:	4eba d2a8      	jsr e0 <FreeDisplay>(pc)
    2e3a:	508f           	addq.l #8,sp
    2e3c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2e40:	4fef 0148      	lea 328(sp),sp
    2e44:	4e75           	rts

00002e46 <RunTests>:
#include "runtests.h"
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    2e46:	4eba f96e      	jsr 27b6 <TestCopperList>(pc)
    ZoomTest();
    2e4a:	4eba 0004      	jsr 2e50 <ZoomTest>(pc)
    //SwScrollerTest();
    2e4e:	4e75           	rts

00002e50 <ZoomTest>:
#include "zoomtest2.h"

ULONG Cl102ZoomTest[137];

void ZoomTest() {
  TestZoomSpeed();
    2e50:	4eba 0046      	jsr 2e98 <TestZoomSpeed>(pc)
  ZoomTestDisplay();
    2e54:	4eba 00e2      	jsr 2f38 <ZoomTestDisplay>(pc)
  TestBlitleftOfZoom();
    2e58:	4eba 05a8      	jsr 3402 <TestBlitleftOfZoom>(pc)
  TestCopyWord();
    2e5c:	4eba 0838      	jsr 3696 <TestCopyWord>(pc)
  TestZoom4Picture();
    2e60:	4eba 0e12      	jsr 3c74 <TestZoom4Picture>(pc)
  TestZoom4PictureOn5Planes();
    2e64:	4eba 0b22      	jsr 3988 <TestZoom4PictureOn5Planes>(pc)
  Test_Zoom2();
    2e68:	4eba f012      	jsr 1e7c <Test_Zoom2>(pc)
  c2p1x1_8_c5_gen_init( 320, 256, 0, 0, 0, 0);
    2e6c:	42a7           	clr.l -(sp)
    2e6e:	42a7           	clr.l -(sp)
    2e70:	42a7           	clr.l -(sp)
    2e72:	42a7           	clr.l -(sp)
    2e74:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2e78:	4878 0140      	pea 140 <FreeDisplay+0x60>
    2e7c:	4eb9 0000 71a8 	jsr 71a8 <c2p1x1_8_c5_gen_init>
    2e82:	4fef 0018      	lea 24(sp),sp
  c2p1x1_8_c5_gen( 0x100, 0x200);
    2e86:	4878 0200      	pea 200 <SwapCl+0xc>
    2e8a:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2e8e:	4eb9 0000 7224 	jsr 7224 <c2p1x1_8_c5_gen>
    2e94:	508f           	addq.l #8,sp
}
    2e96:	4e75           	rts

00002e98 <TestZoomSpeed>:

int Counter4Frames;

void TestZoomSpeed() {
    2e98:	4fef ffe8      	lea -24(sp),sp
    2e9c:	48e7 3002      	movem.l d2-d3/a6,-(sp)

 	TakeSystem();
    2ea0:	4eba d73e      	jsr 5e0 <TakeSystem>(pc)
	WaitVbl();
    2ea4:	4eba d6f0      	jsr 596 <WaitVbl>(pc)
  //             fedcba9876543210
  //hw->dmacon = 0x8def;

  hw->dmacon = DMAF_SETCLR | DMAF_AUDIO | DMAF_BLITTER | DMAF_RASTER 
    2ea8:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    2eae:	317c 87cf 0096 	move.w #-30769,150(a0)
                                    | DMAF_COPPER | DMAF_MASTER | DMAF_BLITHOG;
   //0b1000011111100000;
  
  //hw->dmacon = 0b1000011111111111;
	hw->intena = (1 << INTB_SETCLR) | (1 << INTB_INTEN) | (1 << INTB_VERTB);
    2eb4:	2079 0016 b9ac 	movea.l 16b9ac <hw>,a0
    2eba:	317c c020 009a 	move.w #-16352,154(a0)
  
  Zoom_InitRun(); 
    2ec0:	4eba e36e      	jsr 1230 <Zoom_InitRun>(pc)

  int success = 1;
    2ec4:	7001           	moveq #1,d0
    2ec6:	2f40 0020      	move.l d0,32(sp)
  RunFrame();
    2eca:	4eba d496      	jsr 362 <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    2ece:	3039 0016 b9ea 	move.w 16b9ea <Zoom_Counter>,d0
    2ed4:	0c40 0008      	cmpi.w #8,d0
    2ed8:	6304           	bls.s 2ede <TestZoomSpeed+0x46>
    2eda:	42af 0020      	clr.l 32(sp)
    
  Zoom_Dealloc();
    2ede:	4eba e4a2      	jsr 1382 <Zoom_Dealloc>(pc)
  FreeSystem();
    2ee2:	4eba d808      	jsr 6ec <FreeSystem>(pc)

  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    2ee6:	4aaf 0020      	tst.l 32(sp)
    2eea:	6642           	bne.s 2f2e <TestZoomSpeed+0x96>
    2eec:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2ef2:	2c40           	movea.l d0,a6
    2ef4:	4eae ffc4      	jsr -60(a6)
    2ef8:	2f40 001c      	move.l d0,28(sp)
    2efc:	202f 001c      	move.l 28(sp),d0
    2f00:	2f40 0018      	move.l d0,24(sp)
    2f04:	2f7c 0000 8068 	move.l #32872,20(sp)
    2f0a:	0014 
    2f0c:	701c           	moveq #28,d0
    2f0e:	2f40 0010      	move.l d0,16(sp)
    2f12:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2f18:	2c40           	movea.l d0,a6
    2f1a:	222f 0018      	move.l 24(sp),d1
    2f1e:	242f 0014      	move.l 20(sp),d2
    2f22:	262f 0010      	move.l 16(sp),d3
    2f26:	4eae ffd0      	jsr -48(a6)
    2f2a:	2f40 000c      	move.l d0,12(sp)

  //AddIntServer(INTB_VERTB, vbint);
  //RemIntServer(INTB_VERTB, vbint);
  
}
    2f2e:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2f32:	4fef 0018      	lea 24(sp),sp
    2f36:	4e75           	rts

00002f38 <ZoomTestDisplay>:

void ZoomTestDisplay() {
    2f38:	4fef ff38      	lea -200(sp),sp
    2f3c:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Zoom_Init();
    2f40:	4eba e4b4      	jsr 13f6 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    2f44:	4eba e84a      	jsr 1790 <PrepareDisplayZoom>(pc)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2f48:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    2f4e:	4878 0010      	pea 10 <_start+0x10>
    2f52:	4879 0000 a5dc 	pea a5dc <ClsSprites>
    2f58:	42a7           	clr.l -(sp)
    2f5a:	2f00           	move.l d0,-(sp)
    2f5c:	4eba f7fc      	jsr 275a <TestCopperlistBatch>(pc)
    2f60:	4fef 0010      	lea 16(sp),sp
    2f64:	4a80           	tst.l d0
    2f66:	6642           	bne.s 2faa <ZoomTestDisplay+0x72>
    Write( Output(), 
    2f68:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2f6e:	2c40           	movea.l d0,a6
    2f70:	4eae ffc4      	jsr -60(a6)
    2f74:	2f40 00d0      	move.l d0,208(sp)
    2f78:	202f 00d0      	move.l 208(sp),d0
    2f7c:	2f40 00cc      	move.l d0,204(sp)
    2f80:	2f7c 0000 8087 	move.l #32903,200(sp)
    2f86:	00c8 
    2f88:	7045           	moveq #69,d0
    2f8a:	2f40 00c4      	move.l d0,196(sp)
    2f8e:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2f94:	2c40           	movea.l d0,a6
    2f96:	222f 00cc      	move.l 204(sp),d1
    2f9a:	242f 00c8      	move.l 200(sp),d2
    2f9e:	262f 00c4      	move.l 196(sp),d3
    2fa2:	4eae ffd0      	jsr -48(a6)
    2fa6:	2f40 00c0      	move.l d0,192(sp)
       "ZoomCopperlist: Sprite section of copper starting on pos 0 messed up\n", 
                                                                            69);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2faa:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    2fb0:	4878 000c      	pea c <_start+0xc>
    2fb4:	4879 0000 a61c 	pea a61c <ClScreen>
    2fba:	4878 0010      	pea 10 <_start+0x10>
    2fbe:	2f00           	move.l d0,-(sp)
    2fc0:	4eba f798      	jsr 275a <TestCopperlistBatch>(pc)
    2fc4:	4fef 0010      	lea 16(sp),sp
    2fc8:	4a80           	tst.l d0
    2fca:	6642           	bne.s 300e <ZoomTestDisplay+0xd6>
    Write( Output(), 
    2fcc:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2fd2:	2c40           	movea.l d0,a6
    2fd4:	4eae ffc4      	jsr -60(a6)
    2fd8:	2f40 00bc      	move.l d0,188(sp)
    2fdc:	202f 00bc      	move.l 188(sp),d0
    2fe0:	2f40 00b8      	move.l d0,184(sp)
    2fe4:	2f7c 0000 80cd 	move.l #32973,180(sp)
    2fea:	00b4 
    2fec:	7046           	moveq #70,d0
    2fee:	2f40 00b0      	move.l d0,176(sp)
    2ff2:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    2ff8:	2c40           	movea.l d0,a6
    2ffa:	222f 00b8      	move.l 184(sp),d1
    2ffe:	242f 00b4      	move.l 180(sp),d2
    3002:	262f 00b0      	move.l 176(sp),d3
    3006:	4eae ffd0      	jsr -48(a6)
    300a:	2f40 00ac      	move.l d0,172(sp)
      "ZoomCopperlist: Screen section of copper starting on pos 16 messed up\n",
                                                                            70);
  DrawBuffer = (ULONG *) 0x40000;
    300e:	23fc 0004 0000 	move.l #262144,16b99c <DrawBuffer>
    3014:	0016 b99c 
  ViewBuffer = (ULONG *) 0x50000;
    3018:	23fc 0005 0000 	move.l #327680,16b9a0 <ViewBuffer>
    301e:	0016 b9a0 
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    3022:	2239 0016 b9a4 	move.l 16b9a4 <DrawCopper>,d1
    3028:	2039 0016 b99c 	move.l 16b99c <DrawBuffer>,d0
    302e:	2f01           	move.l d1,-(sp)
    3030:	2f00           	move.l d0,-(sp)
    3032:	4eba edb6      	jsr 1dea <Zoom_SetBplPointers>(pc)
    3036:	508f           	addq.l #8,sp
  Zoom_SwapBuffers( 0);
    3038:	42a7           	clr.l -(sp)
    303a:	4eba ee08      	jsr 1e44 <Zoom_SwapBuffers>(pc)
    303e:	588f           	addq.l #4,sp
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    3040:	2039 0016 b99c 	move.l 16b99c <DrawBuffer>,d0
    3046:	0c80 0005 0000 	cmpi.l #327680,d0
    304c:	660e           	bne.s 305c <ZoomTestDisplay+0x124>
    304e:	2039 0016 b9a0 	move.l 16b9a0 <ViewBuffer>,d0
    3054:	0c80 0004 0000 	cmpi.l #262144,d0
    305a:	6742           	beq.s 309e <ZoomTestDisplay+0x166>
    Write( Output(), 
    305c:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3062:	2c40           	movea.l d0,a6
    3064:	4eae ffc4      	jsr -60(a6)
    3068:	2f40 00a8      	move.l d0,168(sp)
    306c:	202f 00a8      	move.l 168(sp),d0
    3070:	2f40 00a4      	move.l d0,164(sp)
    3074:	2f7c 0000 8114 	move.l #33044,160(sp)
    307a:	00a0 
    307c:	703b           	moveq #59,d0
    307e:	2f40 009c      	move.l d0,156(sp)
    3082:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3088:	2c40           	movea.l d0,a6
    308a:	222f 00a4      	move.l 164(sp),d1
    308e:	242f 00a0      	move.l 160(sp),d2
    3092:	262f 009c      	move.l 156(sp),d3
    3096:	4eae ffd0      	jsr -48(a6)
    309a:	2f40 0098      	move.l d0,152(sp)
            "ZoomCopperlist: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    309e:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    30a4:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    30aa:	4878 001c      	pea 1c <_start+0x1c>
    30ae:	2f00           	move.l d0,-(sp)
    30b0:	4eba f6e6      	jsr 2798 <TestCopperlistPos>(pc)
    30b4:	4fef 000c      	lea 12(sp),sp
    30b8:	4a80           	tst.l d0
    30ba:	6642           	bne.s 30fe <ZoomTestDisplay+0x1c6>
    Write(Output(), 
    30bc:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    30c2:	2c40           	movea.l d0,a6
    30c4:	4eae ffc4      	jsr -60(a6)
    30c8:	2f40 0094      	move.l d0,148(sp)
    30cc:	202f 0094      	move.l 148(sp),d0
    30d0:	2f40 0090      	move.l d0,144(sp)
    30d4:	2f7c 0000 8150 	move.l #33104,140(sp)
    30da:	008c 
    30dc:	703c           	moveq #60,d0
    30de:	2f40 0088      	move.l d0,136(sp)
    30e2:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    30e8:	2c40           	movea.l d0,a6
    30ea:	222f 0090      	move.l 144(sp),d1
    30ee:	242f 008c      	move.l 140(sp),d2
    30f2:	262f 0088      	move.l 136(sp),d3
    30f6:	4eae ffd0      	jsr -48(a6)
    30fa:	2f40 0084      	move.l d0,132(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    30fe:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    3104:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    310a:	4878 001d      	pea 1d <_start+0x1d>
    310e:	2f00           	move.l d0,-(sp)
    3110:	4eba f686      	jsr 2798 <TestCopperlistPos>(pc)
    3114:	4fef 000c      	lea 12(sp),sp
    3118:	4a80           	tst.l d0
    311a:	6642           	bne.s 315e <ZoomTestDisplay+0x226>
    Write(Output(), 
    311c:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3122:	2c40           	movea.l d0,a6
    3124:	4eae ffc4      	jsr -60(a6)
    3128:	2f40 0080      	move.l d0,128(sp)
    312c:	202f 0080      	move.l 128(sp),d0
    3130:	2f40 007c      	move.l d0,124(sp)
    3134:	2f7c 0000 818d 	move.l #33165,120(sp)
    313a:	0078 
    313c:	703c           	moveq #60,d0
    313e:	2f40 0074      	move.l d0,116(sp)
    3142:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3148:	2c40           	movea.l d0,a6
    314a:	222f 007c      	move.l 124(sp),d1
    314e:	242f 0078      	move.l 120(sp),d2
    3152:	262f 0074      	move.l 116(sp),d3
    3156:	4eae ffd0      	jsr -48(a6)
    315a:	2f40 0070      	move.l d0,112(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1pl should be 00f4\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    315e:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    3164:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    316a:	4878 001e      	pea 1e <_start+0x1e>
    316e:	2f00           	move.l d0,-(sp)
    3170:	4eba f626      	jsr 2798 <TestCopperlistPos>(pc)
    3174:	4fef 000c      	lea 12(sp),sp
    3178:	4a80           	tst.l d0
    317a:	6642           	bne.s 31be <ZoomTestDisplay+0x286>
    Write(Output(), 
    317c:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3182:	2c40           	movea.l d0,a6
    3184:	4eae ffc4      	jsr -60(a6)
    3188:	2f40 006c      	move.l d0,108(sp)
    318c:	202f 006c      	move.l 108(sp),d0
    3190:	2f40 0068      	move.l d0,104(sp)
    3194:	2f7c 0000 81ca 	move.l #33226,100(sp)
    319a:	0064 
    319c:	703c           	moveq #60,d0
    319e:	2f40 0060      	move.l d0,96(sp)
    31a2:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    31a8:	2c40           	movea.l d0,a6
    31aa:	222f 0068      	move.l 104(sp),d1
    31ae:	242f 0064      	move.l 100(sp),d2
    31b2:	262f 0060      	move.l 96(sp),d3
    31b6:	4eae ffd0      	jsr -48(a6)
    31ba:	2f40 005c      	move.l d0,92(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    31be:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    31c4:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    31ca:	4878 001f      	pea 1f <_start+0x1f>
    31ce:	2f00           	move.l d0,-(sp)
    31d0:	4eba f5c6      	jsr 2798 <TestCopperlistPos>(pc)
    31d4:	4fef 000c      	lea 12(sp),sp
    31d8:	4a80           	tst.l d0
    31da:	6642           	bne.s 321e <ZoomTestDisplay+0x2e6>
    Write(Output(), 
    31dc:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    31e2:	2c40           	movea.l d0,a6
    31e4:	4eae ffc4      	jsr -60(a6)
    31e8:	2f40 0058      	move.l d0,88(sp)
    31ec:	202f 0058      	move.l 88(sp),d0
    31f0:	2f40 0054      	move.l d0,84(sp)
    31f4:	2f7c 0000 8207 	move.l #33287,80(sp)
    31fa:	0050 
    31fc:	703c           	moveq #60,d0
    31fe:	2f40 004c      	move.l d0,76(sp)
    3202:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3208:	2c40           	movea.l d0,a6
    320a:	222f 0054      	move.l 84(sp),d1
    320e:	242f 0050      	move.l 80(sp),d2
    3212:	262f 004c      	move.l 76(sp),d3
    3216:	4eae ffd0      	jsr -48(a6)
    321a:	2f40 0048      	move.l d0,72(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2pl should be 0034\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    321e:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    3224:	4878 0020      	pea 20 <_start+0x20>
    3228:	4879 0000 a55c 	pea a55c <ClColor>
    322e:	4878 0026      	pea 26 <_start+0x26>
    3232:	2f00           	move.l d0,-(sp)
    3234:	4eba f524      	jsr 275a <TestCopperlistBatch>(pc)
    3238:	4fef 0010      	lea 16(sp),sp
    323c:	4a80           	tst.l d0
    323e:	6642           	bne.s 3282 <ZoomTestDisplay+0x34a>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    3240:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3246:	2c40           	movea.l d0,a6
    3248:	4eae ffc4      	jsr -60(a6)
    324c:	2f40 0044      	move.l d0,68(sp)
    3250:	202f 0044      	move.l 68(sp),d0
    3254:	2f40 0040      	move.l d0,64(sp)
    3258:	2f7c 0000 8244 	move.l #33348,60(sp)
    325e:	003c 
    3260:	7025           	moveq #37,d0
    3262:	2f40 0038      	move.l d0,56(sp)
    3266:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    326c:	2c40           	movea.l d0,a6
    326e:	222f 0040      	move.l 64(sp),d1
    3272:	242f 003c      	move.l 60(sp),d2
    3276:	262f 0038      	move.l 56(sp),d3
    327a:	4eae ffd0      	jsr -48(a6)
    327e:	2f40 0034      	move.l d0,52(sp)

  /*if(  TestCopperlistBatch(  Copperlist1, 71, Cl102ZoomRepeat, 21) == 0)
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36); */
  
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    3282:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    3288:	2f00           	move.l d0,-(sp)
    328a:	4878 000f      	pea f <_start+0xf>
    328e:	4eba d1e2      	jsr 472 <Zoom_Shrink102>(pc)
    3292:	508f           	addq.l #8,sp
  if( TestCopperListZoom102( Copperlist1, 73, Cl102ZoomTest) == 0)
    3294:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    329a:	4879 0000 b830 	pea b830 <Cl102ZoomTest>
    32a0:	4878 0049      	pea 49 <_start+0x49>
    32a4:	2f00           	move.l d0,-(sp)
    32a6:	4eba 00c4      	jsr 336c <TestCopperListZoom102>(pc)
    32aa:	4fef 000c      	lea 12(sp),sp
    32ae:	4a80           	tst.l d0
    32b0:	6642           	bne.s 32f4 <ZoomTestDisplay+0x3bc>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    32b2:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    32b8:	2c40           	movea.l d0,a6
    32ba:	4eae ffc4      	jsr -60(a6)
    32be:	2f40 0030      	move.l d0,48(sp)
    32c2:	202f 0030      	move.l 48(sp),d0
    32c6:	2f40 002c      	move.l d0,44(sp)
    32ca:	2f7c 0000 826a 	move.l #33386,40(sp)
    32d0:	0028 
    32d2:	7025           	moveq #37,d0
    32d4:	2f40 0024      	move.l d0,36(sp)
    32d8:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    32de:	2c40           	movea.l d0,a6
    32e0:	222f 002c      	move.l 44(sp),d1
    32e4:	242f 0028      	move.l 40(sp),d2
    32e8:	262f 0024      	move.l 36(sp),d3
    32ec:	4eae ffd0      	jsr -48(a6)
    32f0:	2f40 0020      	move.l d0,32(sp)

  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    32f4:	2039 0016 b994 	move.l 16b994 <Copperlist1>,d0
    32fa:	4878 fffe      	pea fffffffe <_end+0xffe945fa>
    32fe:	4878 00bb      	pea bb <WaitBlt+0x7>
    3302:	2f00           	move.l d0,-(sp)
    3304:	4eba f492      	jsr 2798 <TestCopperlistPos>(pc)
    3308:	4fef 000c      	lea 12(sp),sp
    330c:	4a80           	tst.l d0
    330e:	6642           	bne.s 3352 <ZoomTestDisplay+0x41a>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    3310:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3316:	2c40           	movea.l d0,a6
    3318:	4eae ffc4      	jsr -60(a6)
    331c:	2f40 001c      	move.l d0,28(sp)
    3320:	202f 001c      	move.l 28(sp),d0
    3324:	2f40 0018      	move.l d0,24(sp)
    3328:	2f7c 0000 828f 	move.l #33423,20(sp)
    332e:	0014 
    3330:	7032           	moveq #50,d0
    3332:	2f40 0010      	move.l d0,16(sp)
    3336:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    333c:	2c40           	movea.l d0,a6
    333e:	222f 0018      	move.l 24(sp),d1
    3342:	242f 0014      	move.l 20(sp),d2
    3346:	262f 0010      	move.l 16(sp),d3
    334a:	4eae ffd0      	jsr -48(a6)
    334e:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    3352:	2f3c 0000 df20 	move.l #57120,-(sp)
    3358:	4878 031c      	pea 31c <RunDemo+0x6>
    335c:	4eba cd82      	jsr e0 <FreeDisplay>(pc)
    3360:	508f           	addq.l #8,sp

}
    3362:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3366:	4fef 00c8      	lea 200(sp),sp
    336a:	4e75           	rts

0000336c <TestCopperListZoom102>:

int TestCopperListZoom102( ULONG *cl2test, UWORD position, 
                                                           ULONG *template4cl) {
    336c:	598f           	subq.l #4,sp
    336e:	202f 000c      	move.l 12(sp),d0
    3372:	3000           	move.w d0,d0
    3374:	3f40 0002      	move.w d0,2(sp)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    3378:	7000           	moveq #0,d0
    337a:	302f 0002      	move.w 2(sp),d0
    337e:	4878 001c      	pea 1c <_start+0x1c>
    3382:	2f2f 0014      	move.l 20(sp),-(sp)
    3386:	2f00           	move.l d0,-(sp)
    3388:	2f2f 0014      	move.l 20(sp),-(sp)
    338c:	4eba f3cc      	jsr 275a <TestCopperlistBatch>(pc)
    3390:	4fef 0010      	lea 16(sp),sp
    3394:	4a80           	tst.l d0
    3396:	6604           	bne.s 339c <TestCopperListZoom102+0x30>
    return 0;
    3398:	7000           	moveq #0,d0
    339a:	6062           	bra.s 33fe <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    339c:	7078           	moveq #120,d0
    339e:	d0af 0010      	add.l 16(sp),d0
    33a2:	7200           	moveq #0,d1
    33a4:	322f 0002      	move.w 2(sp),d1
    33a8:	307c 001e      	movea.w #30,a0
    33ac:	d1c1           	adda.l d1,a0
    33ae:	4878 0036      	pea 36 <_start+0x36>
    33b2:	2f00           	move.l d0,-(sp)
    33b4:	2f08           	move.l a0,-(sp)
    33b6:	2f2f 0014      	move.l 20(sp),-(sp)
    33ba:	4eba f39e      	jsr 275a <TestCopperlistBatch>(pc)
    33be:	4fef 0010      	lea 16(sp),sp
    33c2:	4a80           	tst.l d0
    33c4:	6604           	bne.s 33ca <TestCopperListZoom102+0x5e>
    return 0;
    33c6:	7000           	moveq #0,d0
    33c8:	6034           	bra.s 33fe <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    33ca:	202f 0010      	move.l 16(sp),d0
    33ce:	0680 0000 0158 	addi.l #344,d0
    33d4:	7200           	moveq #0,d1
    33d6:	322f 0002      	move.w 2(sp),d1
    33da:	307c 0056      	movea.w #86,a0
    33de:	d1c1           	adda.l d1,a0
    33e0:	4878 001c      	pea 1c <_start+0x1c>
    33e4:	2f00           	move.l d0,-(sp)
    33e6:	2f08           	move.l a0,-(sp)
    33e8:	2f2f 0014      	move.l 20(sp),-(sp)
    33ec:	4eba f36c      	jsr 275a <TestCopperlistBatch>(pc)
    33f0:	4fef 0010      	lea 16(sp),sp
    33f4:	4a80           	tst.l d0
    33f6:	6604           	bne.s 33fc <TestCopperListZoom102+0x90>
    return 0;
    33f8:	7000           	moveq #0,d0
    33fa:	6002           	bra.s 33fe <TestCopperListZoom102+0x92>
 
  return 1;
    33fc:	7001           	moveq #1,d0
}
    33fe:	588f           	addq.l #4,sp
    3400:	4e75           	rts

00003402 <TestBlitleftOfZoom>:

void TestBlitleftOfZoom() {
    3402:	4fef ff94      	lea -108(sp),sp
    3406:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Zoom_Init();
    340a:	4eba dfea      	jsr 13f6 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    340e:	4eba e380      	jsr 1790 <PrepareDisplayZoom>(pc)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    3412:	2f7c 0000 c800 	move.l #51200,116(sp)
    3418:	0074 
    341a:	7002           	moveq #2,d0
    341c:	2f40 0070      	move.l d0,112(sp)
    3420:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    3426:	2c40           	movea.l d0,a6
    3428:	202f 0074      	move.l 116(sp),d0
    342c:	222f 0070      	move.l 112(sp),d1
    3430:	4eae ff3a      	jsr -198(a6)
    3434:	2f40 006c      	move.l d0,108(sp)
    3438:	202f 006c      	move.l 108(sp),d0
    343c:	23c0 0016 b9dc 	move.l d0,16b9dc <Zoom_Source>
  if( Zoom_Source == 0) {
    3442:	2039 0016 b9dc 	move.l 16b9dc <Zoom_Source>,d0
    3448:	6646           	bne.s 3490 <TestBlitleftOfZoom+0x8e>
    Write(  Output(), 
    344a:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3450:	2c40           	movea.l d0,a6
    3452:	4eae ffc4      	jsr -60(a6)
    3456:	2f40 001c      	move.l d0,28(sp)
    345a:	202f 001c      	move.l 28(sp),d0
    345e:	2f40 0018      	move.l d0,24(sp)
    3462:	2f7c 0000 82c2 	move.l #33474,20(sp)
    3468:	0014 
    346a:	7236           	moveq #54,d1
    346c:	2f41 0010      	move.l d1,16(sp)
    3470:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3476:	2c40           	movea.l d0,a6
    3478:	222f 0018      	move.l 24(sp),d1
    347c:	242f 0014      	move.l 20(sp),d2
    3480:	262f 0010      	move.l 16(sp),d3
    3484:	4eae ffd0      	jsr -48(a6)
    3488:	2f40 000c      	move.l d0,12(sp)
    348c:	6000 01fe      	bra.w 368c <TestBlitleftOfZoom+0x28a>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  
  UWORD *tstsource = Zoom_Source;
    3490:	2f79 0016 b9dc 	move.l 16b9dc <Zoom_Source>,104(sp)
    3496:	0068 
  *tstsource++ = 0x0000;
    3498:	202f 0068      	move.l 104(sp),d0
    349c:	2200           	move.l d0,d1
    349e:	5481           	addq.l #2,d1
    34a0:	2f41 0068      	move.l d1,104(sp)
    34a4:	2040           	movea.l d0,a0
    34a6:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    34a8:	206f 0068      	movea.l 104(sp),a0
    34ac:	30bc 0080      	move.w #128,(a0)
  tstsource += ZMLINESIZE/2-1;
    34b0:	7028           	moveq #40,d0
    34b2:	d1af 0068      	add.l d0,104(sp)
  *tstsource = 0x1000;
    34b6:	206f 0068      	movea.l 104(sp),a0
    34ba:	30bc 1000      	move.w #4096,(a0)
  tstsource++;
    34be:	54af 0068      	addq.l #2,104(sp)
  *tstsource = 0x8e88;
    34c2:	206f 0068      	movea.l 104(sp),a0
    34c6:	30bc 8e88      	move.w #-29048,(a0)
  tstsource += ZMLINESIZE/2-1;
    34ca:	7228           	moveq #40,d1
    34cc:	d3af 0068      	add.l d1,104(sp)

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
    34d0:	2039 0016 b9dc 	move.l 16b9dc <Zoom_Source>,d0
    34d6:	2200           	move.l d0,d1
    34d8:	0681 0000 14d6 	addi.l #5334,d1
    34de:	2f41 0068      	move.l d1,104(sp)
  *tstsource++ = 0x0000;
    34e2:	202f 0068      	move.l 104(sp),d0
    34e6:	2200           	move.l d0,d1
    34e8:	5481           	addq.l #2,d1
    34ea:	2f41 0068      	move.l d1,104(sp)
    34ee:	2040           	movea.l d0,a0
    34f0:	4250           	clr.w (a0)
  *tstsource = 0x00ff;
    34f2:	206f 0068      	movea.l 104(sp),a0
    34f6:	30bc 00ff      	move.w #255,(a0)
  WaitBlit();
    34fa:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    3500:	2c40           	movea.l d0,a6
    3502:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    3506:	4eba e400      	jsr 1908 <Init_Blit>(pc)
  Init_ZoomBlit( 7, 16, 0);
    350a:	42a7           	clr.l -(sp)
    350c:	4878 0010      	pea 10 <_start+0x10>
    3510:	4878 0007      	pea 7 <_start+0x7>
    3514:	4eba e46e      	jsr 1984 <Init_ZoomBlit>(pc)
    3518:	4fef 000c      	lea 12(sp),sp
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    351c:	2239 0016 b99c 	move.l 16b99c <DrawBuffer>,d1
    3522:	2039 0016 b9dc 	move.l 16b9dc <Zoom_Source>,d0
    3528:	4878 0080      	pea 80 <_start+0x80>
    352c:	2f01           	move.l d1,-(sp)
    352e:	2f00           	move.l d0,-(sp)
    3530:	4eba dc1c      	jsr 114e <Zoom_ZoomBlit>(pc)
    3534:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    3538:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    353e:	2c40           	movea.l d0,a6
    3540:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    3544:	2039 0016 b99c 	move.l 16b99c <DrawBuffer>,d0
    354a:	2200           	move.l d0,d1
    354c:	5481           	addq.l #2,d1
    354e:	2f41 0064      	move.l d1,100(sp)
  if( *destination != 0x0180) {
    3552:	206f 0064      	movea.l 100(sp),a0
    3556:	3010           	move.w (a0),d0
    3558:	0c40 0180      	cmpi.w #384,d0
    355c:	6742           	beq.s 35a0 <TestBlitleftOfZoom+0x19e>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    355e:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3564:	2c40           	movea.l d0,a6
    3566:	4eae ffc4      	jsr -60(a6)
    356a:	2f40 0060      	move.l d0,96(sp)
    356e:	202f 0060      	move.l 96(sp),d0
    3572:	2f40 005c      	move.l d0,92(sp)
    3576:	2f7c 0000 82fa 	move.l #33530,88(sp)
    357c:	0058 
    357e:	701c           	moveq #28,d0
    3580:	2f40 0054      	move.l d0,84(sp)
    3584:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    358a:	2c40           	movea.l d0,a6
    358c:	222f 005c      	move.l 92(sp),d1
    3590:	242f 0058      	move.l 88(sp),d2
    3594:	262f 0054      	move.l 84(sp),d3
    3598:	4eae ffd0      	jsr -48(a6)
    359c:	2f40 0050      	move.l d0,80(sp)
  }
  destination += ZMLINESIZE/2;
    35a0:	722a           	moveq #42,d1
    35a2:	d3af 0064      	add.l d1,100(sp)
  if( *destination != 0x1d88)
    35a6:	206f 0064      	movea.l 100(sp),a0
    35aa:	3010           	move.w (a0),d0
    35ac:	0c40 1d88      	cmpi.w #7560,d0
    35b0:	6742           	beq.s 35f4 <TestBlitleftOfZoom+0x1f2>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    35b2:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    35b8:	2c40           	movea.l d0,a6
    35ba:	4eae ffc4      	jsr -60(a6)
    35be:	2f40 004c      	move.l d0,76(sp)
    35c2:	202f 004c      	move.l 76(sp),d0
    35c6:	2f40 0048      	move.l d0,72(sp)
    35ca:	2f7c 0000 8317 	move.l #33559,68(sp)
    35d0:	0044 
    35d2:	701c           	moveq #28,d0
    35d4:	2f40 0040      	move.l d0,64(sp)
    35d8:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    35de:	2c40           	movea.l d0,a6
    35e0:	222f 0048      	move.l 72(sp),d1
    35e4:	242f 0044      	move.l 68(sp),d2
    35e8:	262f 0040      	move.l 64(sp),d3
    35ec:	4eae ffd0      	jsr -48(a6)
    35f0:	2f40 003c      	move.l d0,60(sp)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
    35f4:	2039 0016 b99c 	move.l 16b99c <DrawBuffer>,d0
    35fa:	2200           	move.l d0,d1
    35fc:	0681 0000 14d6 	addi.l #5334,d1
    3602:	2f41 0064      	move.l d1,100(sp)
  destination++;
    3606:	54af 0064      	addq.l #2,100(sp)
  if( *destination != 0x01ff) {
    360a:	206f 0064      	movea.l 100(sp),a0
    360e:	3010           	move.w (a0),d0
    3610:	0c40 01ff      	cmpi.w #511,d0
    3614:	6742           	beq.s 3658 <TestBlitleftOfZoom+0x256>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    3616:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    361c:	2c40           	movea.l d0,a6
    361e:	4eae ffc4      	jsr -60(a6)
    3622:	2f40 0038      	move.l d0,56(sp)
    3626:	202f 0038      	move.l 56(sp),d0
    362a:	2f40 0034      	move.l d0,52(sp)
    362e:	2f7c 0000 8334 	move.l #33588,48(sp)
    3634:	0030 
    3636:	701a           	moveq #26,d0
    3638:	2f40 002c      	move.l d0,44(sp)
    363c:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3642:	2c40           	movea.l d0,a6
    3644:	222f 0034      	move.l 52(sp),d1
    3648:	242f 0030      	move.l 48(sp),d2
    364c:	262f 002c      	move.l 44(sp),d3
    3650:	4eae ffd0      	jsr -48(a6)
    3654:	2f40 0028      	move.l d0,40(sp)
  }
  FreeMem( Zoom_Source, 40*256*5);
    3658:	2f79 0016 b9dc 	move.l 16b9dc <Zoom_Source>,36(sp)
    365e:	0024 
    3660:	2f7c 0000 c800 	move.l #51200,32(sp)
    3666:	0020 
    3668:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    366e:	2c40           	movea.l d0,a6
    3670:	226f 0024      	movea.l 36(sp),a1
    3674:	202f 0020      	move.l 32(sp),d0
    3678:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    367c:	2f3c 0000 df20 	move.l #57120,-(sp)
    3682:	4878 031c      	pea 31c <RunDemo+0x6>
    3686:	4eba ca58      	jsr e0 <FreeDisplay>(pc)
    368a:	508f           	addq.l #8,sp
}
    368c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3690:	4fef 006c      	lea 108(sp),sp
    3694:	4e75           	rts

00003696 <TestCopyWord>:

void TestCopyWord() {
    3696:	4fef ff74      	lea -140(sp),sp
    369a:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    369e:	2f7c 0000 04ec 	move.l #1260,136(sp)
    36a4:	0088 
    36a6:	7002           	moveq #2,d0
    36a8:	2f40 0084      	move.l d0,132(sp)
    36ac:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    36b2:	2c40           	movea.l d0,a6
    36b4:	202f 0088      	move.l 136(sp),d0
    36b8:	222f 0084      	move.l 132(sp),d1
    36bc:	4eae ff3a      	jsr -198(a6)
    36c0:	2f40 0080      	move.l d0,128(sp)
    36c4:	202f 0080      	move.l 128(sp),d0
    36c8:	2f40 007c      	move.l d0,124(sp)
  if( source == 0) {
    36cc:	6646           	bne.s 3714 <TestCopyWord+0x7e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    36ce:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    36d4:	2c40           	movea.l d0,a6
    36d6:	4eae ffc4      	jsr -60(a6)
    36da:	2f40 001c      	move.l d0,28(sp)
    36de:	202f 001c      	move.l 28(sp),d0
    36e2:	2f40 0018      	move.l d0,24(sp)
    36e6:	2f7c 0000 834f 	move.l #33615,20(sp)
    36ec:	0014 
    36ee:	7235           	moveq #53,d1
    36f0:	2f41 0010      	move.l d1,16(sp)
    36f4:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    36fa:	2c40           	movea.l d0,a6
    36fc:	222f 0018      	move.l 24(sp),d1
    3700:	242f 0014      	move.l 20(sp),d2
    3704:	262f 0010      	move.l 16(sp),d3
    3708:	4eae ffd0      	jsr -48(a6)
    370c:	2f40 000c      	move.l d0,12(sp)
    3710:	6000 026c      	bra.w 397e <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    3714:	2f7c 0000 04ec 	move.l #1260,120(sp)
    371a:	0078 
    371c:	7002           	moveq #2,d0
    371e:	2f40 0074      	move.l d0,116(sp)
    3722:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    3728:	2c40           	movea.l d0,a6
    372a:	202f 0078      	move.l 120(sp),d0
    372e:	222f 0074      	move.l 116(sp),d1
    3732:	4eae ff3a      	jsr -198(a6)
    3736:	2f40 0070      	move.l d0,112(sp)
    373a:	202f 0070      	move.l 112(sp),d0
    373e:	2f40 006c      	move.l d0,108(sp)
  if( destination == 0) {
    3742:	6646           	bne.s 378a <TestCopyWord+0xf4>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3744:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    374a:	2c40           	movea.l d0,a6
    374c:	4eae ffc4      	jsr -60(a6)
    3750:	2f40 0030      	move.l d0,48(sp)
    3754:	202f 0030      	move.l 48(sp),d0
    3758:	2f40 002c      	move.l d0,44(sp)
    375c:	2f7c 0000 834f 	move.l #33615,40(sp)
    3762:	0028 
    3764:	7235           	moveq #53,d1
    3766:	2f41 0024      	move.l d1,36(sp)
    376a:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3770:	2c40           	movea.l d0,a6
    3772:	222f 002c      	move.l 44(sp),d1
    3776:	242f 0028      	move.l 40(sp),d2
    377a:	262f 0024      	move.l 36(sp),d3
    377e:	4eae ffd0      	jsr -48(a6)
    3782:	2f40 0020      	move.l d0,32(sp)
    3786:	6000 01f6      	bra.w 397e <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
    378a:	2f6f 007c 0094 	move.l 124(sp),148(sp)
  for( int i=0; i<8;i++) {
    3790:	42af 0090      	clr.l 144(sp)
    3794:	6000 0086      	bra.w 381c <TestCopyWord+0x186>
    *tmp++ = 0;
    3798:	202f 0094      	move.l 148(sp),d0
    379c:	2200           	move.l d0,d1
    379e:	5481           	addq.l #2,d1
    37a0:	2f41 0094      	move.l d1,148(sp)
    37a4:	2040           	movea.l d0,a0
    37a6:	4250           	clr.w (a0)
    *tmp++ = 0xaaaa;
    37a8:	202f 0094      	move.l 148(sp),d0
    37ac:	2200           	move.l d0,d1
    37ae:	5481           	addq.l #2,d1
    37b0:	2f41 0094      	move.l d1,148(sp)
    37b4:	2040           	movea.l d0,a0
    37b6:	30bc aaaa      	move.w #-21846,(a0)
    *tmp++ = 0xaaaa;
    37ba:	202f 0094      	move.l 148(sp),d0
    37be:	2200           	move.l d0,d1
    37c0:	5481           	addq.l #2,d1
    37c2:	2f41 0094      	move.l d1,148(sp)
    37c6:	2040           	movea.l d0,a0
    37c8:	30bc aaaa      	move.w #-21846,(a0)
    *tmp = 0;
    37cc:	206f 0094      	movea.l 148(sp),a0
    37d0:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    37d2:	7024           	moveq #36,d0
    37d4:	d1af 0094      	add.l d0,148(sp)
    *tmp++ = 0;
    37d8:	202f 0094      	move.l 148(sp),d0
    37dc:	2200           	move.l d0,d1
    37de:	5481           	addq.l #2,d1
    37e0:	2f41 0094      	move.l d1,148(sp)
    37e4:	2040           	movea.l d0,a0
    37e6:	4250           	clr.w (a0)
    *tmp++ = 0x5555;
    37e8:	202f 0094      	move.l 148(sp),d0
    37ec:	2200           	move.l d0,d1
    37ee:	5481           	addq.l #2,d1
    37f0:	2f41 0094      	move.l d1,148(sp)
    37f4:	2040           	movea.l d0,a0
    37f6:	30bc 5555      	move.w #21845,(a0)
    *tmp++ = 0x5555;
    37fa:	202f 0094      	move.l 148(sp),d0
    37fe:	2200           	move.l d0,d1
    3800:	5481           	addq.l #2,d1
    3802:	2f41 0094      	move.l d1,148(sp)
    3806:	2040           	movea.l d0,a0
    3808:	30bc 5555      	move.w #21845,(a0)
    *tmp = 0;
    380c:	206f 0094      	movea.l 148(sp),a0
    3810:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    3812:	7024           	moveq #36,d0
    3814:	d1af 0094      	add.l d0,148(sp)
  for( int i=0; i<8;i++) {
    3818:	52af 0090      	addq.l #1,144(sp)
    381c:	7207           	moveq #7,d1
    381e:	b2af 0090      	cmp.l 144(sp),d1
    3822:	6c00 ff74      	bge.w 3798 <TestCopyWord+0x102>
  }
  tmp = destination;
    3826:	2f6f 006c 0094 	move.l 108(sp),148(sp)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    382c:	42af 008c      	clr.l 140(sp)
    3830:	6014           	bra.s 3846 <TestCopyWord+0x1b0>
    *tmp++ = 0;
    3832:	202f 0094      	move.l 148(sp),d0
    3836:	2200           	move.l d0,d1
    3838:	5481           	addq.l #2,d1
    383a:	2f41 0094      	move.l d1,148(sp)
    383e:	2040           	movea.l d0,a0
    3840:	4250           	clr.w (a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3842:	52af 008c      	addq.l #1,140(sp)
    3846:	0caf 0000 0275 	cmpi.l #629,140(sp)
    384c:	008c 
    384e:	6fe2           	ble.s 3832 <TestCopyWord+0x19c>
  }

  WaitBlit();
    3850:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    3856:	2c40           	movea.l d0,a6
    3858:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
    385c:	4eba db98      	jsr 13f6 <Zoom_Init>(pc)
  Init_Copy( 3);
    3860:	4878 0003      	pea 3 <_start+0x3>
    3864:	4eba e1c2      	jsr 1a28 <Init_Copy>(pc)
    3868:	588f           	addq.l #4,sp
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
    386a:	202f 007c      	move.l 124(sp),d0
    386e:	5480           	addq.l #2,d0
    3870:	4878 0010      	pea 10 <_start+0x10>
    3874:	2f2f 0070      	move.l 112(sp),-(sp)
    3878:	2f00           	move.l d0,-(sp)
    387a:	4eba d894      	jsr 1110 <Zoom_CopyWord>(pc)
    387e:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    3882:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    3888:	2c40           	movea.l d0,a6
    388a:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
    388e:	202f 006c      	move.l 108(sp),d0
    3892:	5480           	addq.l #2,d0
    3894:	2f40 0094      	move.l d0,148(sp)
  if( *tmp != 0x5555) 
    3898:	206f 0094      	movea.l 148(sp),a0
    389c:	3010           	move.w (a0),d0
    389e:	0c40 5555      	cmpi.w #21845,d0
    38a2:	6742           	beq.s 38e6 <TestCopyWord+0x250>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    38a4:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    38aa:	2c40           	movea.l d0,a6
    38ac:	4eae ffc4      	jsr -60(a6)
    38b0:	2f40 0068      	move.l d0,104(sp)
    38b4:	202f 0068      	move.l 104(sp),d0
    38b8:	2f40 0064      	move.l d0,100(sp)
    38bc:	2f7c 0000 8385 	move.l #33669,96(sp)
    38c2:	0060 
    38c4:	721f           	moveq #31,d1
    38c6:	2f41 005c      	move.l d1,92(sp)
    38ca:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    38d0:	2c40           	movea.l d0,a6
    38d2:	222f 0064      	move.l 100(sp),d1
    38d6:	242f 0060      	move.l 96(sp),d2
    38da:	262f 005c      	move.l 92(sp),d3
    38de:	4eae ffd0      	jsr -48(a6)
    38e2:	2f40 0058      	move.l d0,88(sp)
  tmp += ZMLINESIZE/2;
    38e6:	702a           	moveq #42,d0
    38e8:	d1af 0094      	add.l d0,148(sp)
  if( *tmp != 0xaaaa)
    38ec:	206f 0094      	movea.l 148(sp),a0
    38f0:	3010           	move.w (a0),d0
    38f2:	0c40 aaaa      	cmpi.w #-21846,d0
    38f6:	6742           	beq.s 393a <TestCopyWord+0x2a4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    38f8:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    38fe:	2c40           	movea.l d0,a6
    3900:	4eae ffc4      	jsr -60(a6)
    3904:	2f40 0054      	move.l d0,84(sp)
    3908:	202f 0054      	move.l 84(sp),d0
    390c:	2f40 0050      	move.l d0,80(sp)
    3910:	2f7c 0000 83a5 	move.l #33701,76(sp)
    3916:	004c 
    3918:	7220           	moveq #32,d1
    391a:	2f41 0048      	move.l d1,72(sp)
    391e:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3924:	2c40           	movea.l d0,a6
    3926:	222f 0050      	move.l 80(sp),d1
    392a:	242f 004c      	move.l 76(sp),d2
    392e:	262f 0048      	move.l 72(sp),d3
    3932:	4eae ffd0      	jsr -48(a6)
    3936:	2f40 0044      	move.l d0,68(sp)
  
  FreeMem( source,ZMLINESIZE*30);
    393a:	2f6f 007c 0040 	move.l 124(sp),64(sp)
    3940:	2f7c 0000 04ec 	move.l #1260,60(sp)
    3946:	003c 
    3948:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    394e:	2c40           	movea.l d0,a6
    3950:	226f 0040      	movea.l 64(sp),a1
    3954:	202f 003c      	move.l 60(sp),d0
    3958:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    395c:	2f6f 006c 0038 	move.l 108(sp),56(sp)
    3962:	2f7c 0000 04ec 	move.l #1260,52(sp)
    3968:	0034 
    396a:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    3970:	2c40           	movea.l d0,a6
    3972:	226f 0038      	movea.l 56(sp),a1
    3976:	202f 0034      	move.l 52(sp),d0
    397a:	4eae ff2e      	jsr -210(a6)
}
    397e:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3982:	4fef 008c      	lea 140(sp),sp
    3986:	4e75           	rts

00003988 <TestZoom4PictureOn5Planes>:
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */


void TestZoom4PictureOn5Planes() {
    3988:	4fef ff74      	lea -140(sp),sp
    398c:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3990:	2f7c 0000 f460 	move.l #62560,102(sp)
    3996:	0066 
    3998:	7002           	moveq #2,d0
    399a:	2f40 0062      	move.l d0,98(sp)
    399e:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    39a4:	2c40           	movea.l d0,a6
    39a6:	202f 0066      	move.l 102(sp),d0
    39aa:	222f 0062      	move.l 98(sp),d1
    39ae:	4eae ff3a      	jsr -198(a6)
    39b2:	2f40 005e      	move.l d0,94(sp)
    39b6:	202f 005e      	move.l 94(sp),d0
    39ba:	2f40 005a      	move.l d0,90(sp)
  if( source == 0) {
    39be:	6646           	bne.s 3a06 <TestZoom4PictureOn5Planes+0x7e>
    Write(  Output(), 
    39c0:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    39c6:	2c40           	movea.l d0,a6
    39c8:	4eae ffc4      	jsr -60(a6)
    39cc:	2f40 001e      	move.l d0,30(sp)
    39d0:	202f 001e      	move.l 30(sp),d0
    39d4:	2f40 001a      	move.l d0,26(sp)
    39d8:	2f7c 0000 83c6 	move.l #33734,22(sp)
    39de:	0016 
    39e0:	7239           	moveq #57,d1
    39e2:	2f41 0012      	move.l d1,18(sp)
    39e6:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    39ec:	2c40           	movea.l d0,a6
    39ee:	222f 001a      	move.l 26(sp),d1
    39f2:	242f 0016      	move.l 22(sp),d2
    39f6:	262f 0012      	move.l 18(sp),d3
    39fa:	4eae ffd0      	jsr -48(a6)
    39fe:	2f40 000e      	move.l d0,14(sp)
    3a02:	6000 0266      	bra.w 3c6a <TestZoom4PictureOn5Planes+0x2e2>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3a06:	2f7c 0000 f460 	move.l #62560,86(sp)
    3a0c:	0056 
    3a0e:	7002           	moveq #2,d0
    3a10:	2f40 0052      	move.l d0,82(sp)
    3a14:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    3a1a:	2c40           	movea.l d0,a6
    3a1c:	202f 0056      	move.l 86(sp),d0
    3a20:	222f 0052      	move.l 82(sp),d1
    3a24:	4eae ff3a      	jsr -198(a6)
    3a28:	2f40 004e      	move.l d0,78(sp)
    3a2c:	202f 004e      	move.l 78(sp),d0
    3a30:	2f40 004a      	move.l d0,74(sp)
  if( destination == 0) {
    3a34:	6646           	bne.s 3a7c <TestZoom4PictureOn5Planes+0xf4>
    Write(  Output(), 
    3a36:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3a3c:	2c40           	movea.l d0,a6
    3a3e:	4eae ffc4      	jsr -60(a6)
    3a42:	2f40 0032      	move.l d0,50(sp)
    3a46:	202f 0032      	move.l 50(sp),d0
    3a4a:	2f40 002e      	move.l d0,46(sp)
    3a4e:	2f7c 0000 8400 	move.l #33792,42(sp)
    3a54:	002a 
    3a56:	723d           	moveq #61,d1
    3a58:	2f41 0026      	move.l d1,38(sp)
    3a5c:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3a62:	2c40           	movea.l d0,a6
    3a64:	222f 002e      	move.l 46(sp),d1
    3a68:	242f 002a      	move.l 42(sp),d2
    3a6c:	262f 0026      	move.l 38(sp),d3
    3a70:	4eae ffd0      	jsr -48(a6)
    3a74:	2f40 0022      	move.l d0,34(sp)
    3a78:	6000 01f0      	bra.w 3c6a <TestZoom4PictureOn5Planes+0x2e2>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3a7c:	2f6f 005a 0094 	move.l 90(sp),148(sp)
  for(int i=0;i<128+8;i++) {
    3a82:	42af 0090      	clr.l 144(sp)
    3a86:	6050           	bra.s 3ad8 <TestZoom4PictureOn5Planes+0x150>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3a88:	42af 008c      	clr.l 140(sp)
    3a8c:	6018           	bra.s 3aa6 <TestZoom4PictureOn5Planes+0x11e>
      *tmp4source++ = 0x55555555;
    3a8e:	202f 0094      	move.l 148(sp),d0
    3a92:	2200           	move.l d0,d1
    3a94:	5881           	addq.l #4,d1
    3a96:	2f41 0094      	move.l d1,148(sp)
    3a9a:	2040           	movea.l d0,a0
    3a9c:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3aa2:	52af 008c      	addq.l #1,140(sp)
    3aa6:	7031           	moveq #49,d0
    3aa8:	b0af 008c      	cmp.l 140(sp),d0
    3aac:	6ce0           	bge.s 3a8e <TestZoom4PictureOn5Planes+0x106>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3aae:	42af 0088      	clr.l 136(sp)
    3ab2:	6018           	bra.s 3acc <TestZoom4PictureOn5Planes+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3ab4:	202f 0094      	move.l 148(sp),d0
    3ab8:	2200           	move.l d0,d1
    3aba:	5881           	addq.l #4,d1
    3abc:	2f41 0094      	move.l d1,148(sp)
    3ac0:	2040           	movea.l d0,a0
    3ac2:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3ac8:	52af 0088      	addq.l #1,136(sp)
    3acc:	7031           	moveq #49,d0
    3ace:	b0af 0088      	cmp.l 136(sp),d0
    3ad2:	6ce0           	bge.s 3ab4 <TestZoom4PictureOn5Planes+0x12c>
  for(int i=0;i<128+8;i++) {
    3ad4:	52af 0090      	addq.l #1,144(sp)
    3ad8:	0caf 0000 0087 	cmpi.l #135,144(sp)
    3ade:	0090 
    3ae0:	6fa6           	ble.s 3a88 <TestZoom4PictureOn5Planes+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3ae2:	4878 0005      	pea 5 <_start+0x5>
    3ae6:	42a7           	clr.l -(sp)
    3ae8:	2f2f 0052      	move.l 82(sp),-(sp)
    3aec:	2f2f 0066      	move.l 102(sp),-(sp)
    3af0:	4eba df70      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    3af4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3af8:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    3afe:	2c40           	movea.l d0,a6
    3b00:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3b04:	222f 004a      	move.l 74(sp),d1
    3b08:	5881           	addq.l #4,d1
    3b0a:	2f41 0084      	move.l d1,132(sp)
  UWORD *valsupposed = destlinezoom1;
    3b0e:	2f7c 0000 ba54 	move.l #47700,70(sp)
    3b14:	0046 
  UWORD mask = 0xffff;
    3b16:	3f7c ffff 0082 	move.w #-1,130(sp)
  for(int i=0;i<14;i++) {
    3b1c:	42af 007e      	clr.l 126(sp)
    3b20:	6000 00a8      	bra.w 3bca <TestZoom4PictureOn5Planes+0x242>
    for(int i2=0;i2<18;i2++) { 
    3b24:	42af 007a      	clr.l 122(sp)
    3b28:	604e           	bra.s 3b78 <TestZoom4PictureOn5Planes+0x1f0>
      for( int i3=0;i3<5;i3++) {
    3b2a:	42af 0076      	clr.l 118(sp)
    3b2e:	6038           	bra.s 3b68 <TestZoom4PictureOn5Planes+0x1e0>
        TestRow( valsupposed, valactual, mask, i2+i*19);
    3b30:	222f 007e      	move.l 126(sp),d1
    3b34:	2001           	move.l d1,d0
    3b36:	e788           	lsl.l #3,d0
    3b38:	d081           	add.l d1,d0
    3b3a:	d080           	add.l d0,d0
    3b3c:	d081           	add.l d1,d0
    3b3e:	2200           	move.l d0,d1
    3b40:	d2af 007a      	add.l 122(sp),d1
    3b44:	7000           	moveq #0,d0
    3b46:	302f 0082      	move.w 130(sp),d0
    3b4a:	2f01           	move.l d1,-(sp)
    3b4c:	2f00           	move.l d0,-(sp)
    3b4e:	2f2f 008c      	move.l 140(sp),-(sp)
    3b52:	2f2f 0052      	move.l 82(sp),-(sp)
    3b56:	4eba 2f7e      	jsr 6ad6 <TestRow>(pc)
    3b5a:	4fef 0010      	lea 16(sp),sp
        valactual += ZMLINESIZE/2;
    3b5e:	702a           	moveq #42,d0
    3b60:	d1af 0084      	add.l d0,132(sp)
      for( int i3=0;i3<5;i3++) {
    3b64:	52af 0076      	addq.l #1,118(sp)
    3b68:	7204           	moveq #4,d1
    3b6a:	b2af 0076      	cmp.l 118(sp),d1
    3b6e:	6cc0           	bge.s 3b30 <TestZoom4PictureOn5Planes+0x1a8>
      }
      mask = mask ^ 0xffff;
    3b70:	466f 0082      	not.w 130(sp)
    for(int i2=0;i2<18;i2++) { 
    3b74:	52af 007a      	addq.l #1,122(sp)
    3b78:	7011           	moveq #17,d0
    3b7a:	b0af 007a      	cmp.l 122(sp),d0
    3b7e:	6caa           	bge.s 3b2a <TestZoom4PictureOn5Planes+0x1a2>
    }
    for( int i3=0;i3<5;i3++) {
    3b80:	42af 0072      	clr.l 114(sp)
    3b84:	6038           	bra.s 3bbe <TestZoom4PictureOn5Planes+0x236>
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3b86:	222f 007e      	move.l 126(sp),d1
    3b8a:	2001           	move.l d1,d0
    3b8c:	e788           	lsl.l #3,d0
    3b8e:	d081           	add.l d1,d0
    3b90:	d080           	add.l d0,d0
    3b92:	2040           	movea.l d0,a0
    3b94:	d1c1           	adda.l d1,a0
    3b96:	41e8 0012      	lea 18(a0),a0
    3b9a:	7000           	moveq #0,d0
    3b9c:	302f 0082      	move.w 130(sp),d0
    3ba0:	2f08           	move.l a0,-(sp)
    3ba2:	2f00           	move.l d0,-(sp)
    3ba4:	2f2f 008c      	move.l 140(sp),-(sp)
    3ba8:	2f2f 0052      	move.l 82(sp),-(sp)
    3bac:	4eba 2f28      	jsr 6ad6 <TestRow>(pc)
    3bb0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3bb4:	722a           	moveq #42,d1
    3bb6:	d3af 0084      	add.l d1,132(sp)
    for( int i3=0;i3<5;i3++) {
    3bba:	52af 0072      	addq.l #1,114(sp)
    3bbe:	7004           	moveq #4,d0
    3bc0:	b0af 0072      	cmp.l 114(sp),d0
    3bc4:	6cc0           	bge.s 3b86 <TestZoom4PictureOn5Planes+0x1fe>
  for(int i=0;i<14;i++) {
    3bc6:	52af 007e      	addq.l #1,126(sp)
    3bca:	720d           	moveq #13,d1
    3bcc:	b2af 007e      	cmp.l 126(sp),d1
    3bd0:	6c00 ff52      	bge.w 3b24 <TestZoom4PictureOn5Planes+0x19c>
    }
  }
  for(int i2=0;i2<4;i2++) { 
    3bd4:	42af 006e      	clr.l 110(sp)
    3bd8:	6044           	bra.s 3c1e <TestZoom4PictureOn5Planes+0x296>
    for( int i3=0;i3<5;i3++) {
    3bda:	42af 006a      	clr.l 106(sp)
    3bde:	602e           	bra.s 3c0e <TestZoom4PictureOn5Planes+0x286>
      TestRow( valsupposed, valactual, mask, i2+265);
    3be0:	222f 006e      	move.l 110(sp),d1
    3be4:	0681 0000 0109 	addi.l #265,d1
    3bea:	7000           	moveq #0,d0
    3bec:	302f 0082      	move.w 130(sp),d0
    3bf0:	2f01           	move.l d1,-(sp)
    3bf2:	2f00           	move.l d0,-(sp)
    3bf4:	2f2f 008c      	move.l 140(sp),-(sp)
    3bf8:	2f2f 0052      	move.l 82(sp),-(sp)
    3bfc:	4eba 2ed8      	jsr 6ad6 <TestRow>(pc)
    3c00:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3c04:	702a           	moveq #42,d0
    3c06:	d1af 0084      	add.l d0,132(sp)
    for( int i3=0;i3<5;i3++) {
    3c0a:	52af 006a      	addq.l #1,106(sp)
    3c0e:	7204           	moveq #4,d1
    3c10:	b2af 006a      	cmp.l 106(sp),d1
    3c14:	6cca           	bge.s 3be0 <TestZoom4PictureOn5Planes+0x258>
    }
    mask = mask ^ 0xffff;
    3c16:	466f 0082      	not.w 130(sp)
  for(int i2=0;i2<4;i2++) { 
    3c1a:	52af 006e      	addq.l #1,110(sp)
    3c1e:	7003           	moveq #3,d0
    3c20:	b0af 006e      	cmp.l 110(sp),d0
    3c24:	6cb4           	bge.s 3bda <TestZoom4PictureOn5Planes+0x252>
  } 
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    3c26:	2f6f 005a 0042 	move.l 90(sp),66(sp)
    3c2c:	2f7c 0000 f460 	move.l #62560,62(sp)
    3c32:	003e 
    3c34:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    3c3a:	2c40           	movea.l d0,a6
    3c3c:	226f 0042      	movea.l 66(sp),a1
    3c40:	202f 003e      	move.l 62(sp),d0
    3c44:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    3c48:	2f6f 004a 003a 	move.l 74(sp),58(sp)
    3c4e:	2f7c 0000 f460 	move.l #62560,54(sp)
    3c54:	0036 
    3c56:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    3c5c:	2c40           	movea.l d0,a6
    3c5e:	226f 003a      	movea.l 58(sp),a1
    3c62:	202f 0036      	move.l 54(sp),d0
    3c66:	4eae ff2e      	jsr -210(a6)
}
    3c6a:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3c6e:	4fef 008c      	lea 140(sp),sp
    3c72:	4e75           	rts

00003c74 <TestZoom4Picture>:

void TestZoom4Picture() {
    3c74:	4fef fe30      	lea -464(sp),sp
    3c78:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3c7c:	2f7c 0000 30e0 	move.l #12512,106(sp)
    3c82:	006a 
    3c84:	7002           	moveq #2,d0
    3c86:	2f40 0066      	move.l d0,102(sp)
    3c8a:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    3c90:	2c40           	movea.l d0,a6
    3c92:	202f 006a      	move.l 106(sp),d0
    3c96:	222f 0066      	move.l 102(sp),d1
    3c9a:	4eae ff3a      	jsr -198(a6)
    3c9e:	2f40 0062      	move.l d0,98(sp)
    3ca2:	202f 0062      	move.l 98(sp),d0
    3ca6:	2f40 005e      	move.l d0,94(sp)
  if( source == 0) {
    3caa:	6646           	bne.s 3cf2 <TestZoom4Picture+0x7e>
    Write(  Output(), 
    3cac:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3cb2:	2c40           	movea.l d0,a6
    3cb4:	4eae ffc4      	jsr -60(a6)
    3cb8:	2f40 001e      	move.l d0,30(sp)
    3cbc:	202f 001e      	move.l 30(sp),d0
    3cc0:	2f40 001a      	move.l d0,26(sp)
    3cc4:	2f7c 0000 83c6 	move.l #33734,22(sp)
    3cca:	0016 
    3ccc:	7239           	moveq #57,d1
    3cce:	2f41 0012      	move.l d1,18(sp)
    3cd2:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3cd8:	2c40           	movea.l d0,a6
    3cda:	222f 001a      	move.l 26(sp),d1
    3cde:	242f 0016      	move.l 22(sp),d2
    3ce2:	262f 0012      	move.l 18(sp),d3
    3ce6:	4eae ffd0      	jsr -48(a6)
    3cea:	2f40 000e      	move.l d0,14(sp)
    3cee:	6000 2ddc      	bra.w 6acc <TestZoom4Picture+0x2e58>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3cf2:	2f7c 0000 30e0 	move.l #12512,90(sp)
    3cf8:	005a 
    3cfa:	7002           	moveq #2,d0
    3cfc:	2f40 0056      	move.l d0,86(sp)
    3d00:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    3d06:	2c40           	movea.l d0,a6
    3d08:	202f 005a      	move.l 90(sp),d0
    3d0c:	222f 0056      	move.l 86(sp),d1
    3d10:	4eae ff3a      	jsr -198(a6)
    3d14:	2f40 0052      	move.l d0,82(sp)
    3d18:	202f 0052      	move.l 82(sp),d0
    3d1c:	2f40 004e      	move.l d0,78(sp)
  if( destination == 0) {
    3d20:	6646           	bne.s 3d68 <TestZoom4Picture+0xf4>
    Write(  Output(), 
    3d22:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3d28:	2c40           	movea.l d0,a6
    3d2a:	4eae ffc4      	jsr -60(a6)
    3d2e:	2f40 0032      	move.l d0,50(sp)
    3d32:	202f 0032      	move.l 50(sp),d0
    3d36:	2f40 002e      	move.l d0,46(sp)
    3d3a:	2f7c 0000 8400 	move.l #33792,42(sp)
    3d40:	002a 
    3d42:	723d           	moveq #61,d1
    3d44:	2f41 0026      	move.l d1,38(sp)
    3d48:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    3d4e:	2c40           	movea.l d0,a6
    3d50:	222f 002e      	move.l 46(sp),d1
    3d54:	242f 002a      	move.l 42(sp),d2
    3d58:	262f 0026      	move.l 38(sp),d3
    3d5c:	4eae ffd0      	jsr -48(a6)
    3d60:	2f40 0022      	move.l d0,34(sp)
    3d64:	6000 2d66      	bra.w 6acc <TestZoom4Picture+0x2e58>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3d68:	2f6f 005e 01d8 	move.l 94(sp),472(sp)
  for(int i=0;i<128+8;i++) {
    3d6e:	42af 01d4      	clr.l 468(sp)
    3d72:	6050           	bra.s 3dc4 <TestZoom4Picture+0x150>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3d74:	42af 01d0      	clr.l 464(sp)
    3d78:	6018           	bra.s 3d92 <TestZoom4Picture+0x11e>
      *tmp4source++ = 0x55555555;
    3d7a:	202f 01d8      	move.l 472(sp),d0
    3d7e:	2200           	move.l d0,d1
    3d80:	5881           	addq.l #4,d1
    3d82:	2f41 01d8      	move.l d1,472(sp)
    3d86:	2040           	movea.l d0,a0
    3d88:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3d8e:	52af 01d0      	addq.l #1,464(sp)
    3d92:	7009           	moveq #9,d0
    3d94:	b0af 01d0      	cmp.l 464(sp),d0
    3d98:	6ce0           	bge.s 3d7a <TestZoom4Picture+0x106>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3d9a:	42af 01cc      	clr.l 460(sp)
    3d9e:	6018           	bra.s 3db8 <TestZoom4Picture+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3da0:	202f 01d8      	move.l 472(sp),d0
    3da4:	2200           	move.l d0,d1
    3da6:	5881           	addq.l #4,d1
    3da8:	2f41 01d8      	move.l d1,472(sp)
    3dac:	2040           	movea.l d0,a0
    3dae:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3db4:	52af 01cc      	addq.l #1,460(sp)
    3db8:	7009           	moveq #9,d0
    3dba:	b0af 01cc      	cmp.l 460(sp),d0
    3dbe:	6ce0           	bge.s 3da0 <TestZoom4Picture+0x12c>
  for(int i=0;i<128+8;i++) {
    3dc0:	52af 01d4      	addq.l #1,468(sp)
    3dc4:	0caf 0000 0087 	cmpi.l #135,468(sp)
    3dca:	01d4 
    3dcc:	6fa6           	ble.s 3d74 <TestZoom4Picture+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    3dce:	4878 0001      	pea 1 <_start+0x1>
    3dd2:	42a7           	clr.l -(sp)
    3dd4:	2f2f 0056      	move.l 86(sp),-(sp)
    3dd8:	2f2f 006a      	move.l 106(sp),-(sp)
    3ddc:	4eba dc84      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    3de0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3de4:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    3dea:	2c40           	movea.l d0,a6
    3dec:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3df0:	222f 004e      	move.l 78(sp),d1
    3df4:	5881           	addq.l #4,d1
    3df6:	2f41 01c8      	move.l d1,456(sp)
  UWORD *valsupposed = destlinezoom1;
    3dfa:	2f7c 0000 ba54 	move.l #47700,74(sp)
    3e00:	004a 
  UWORD mask = 0xffff;
    3e02:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<14;i++) {
    3e08:	42af 01c2      	clr.l 450(sp)
    3e0c:	6000 0084      	bra.w 3e92 <TestZoom4Picture+0x21e>
    for(int i2=0;i2<18;i2++) { 
    3e10:	42af 01be      	clr.l 446(sp)
    3e14:	603c           	bra.s 3e52 <TestZoom4Picture+0x1de>
      TestRow( valsupposed, valactual, mask, i2+i*19);
    3e16:	222f 01c2      	move.l 450(sp),d1
    3e1a:	2001           	move.l d1,d0
    3e1c:	e788           	lsl.l #3,d0
    3e1e:	d081           	add.l d1,d0
    3e20:	d080           	add.l d0,d0
    3e22:	d081           	add.l d1,d0
    3e24:	2200           	move.l d0,d1
    3e26:	d2af 01be      	add.l 446(sp),d1
    3e2a:	7000           	moveq #0,d0
    3e2c:	302f 01c6      	move.w 454(sp),d0
    3e30:	2f01           	move.l d1,-(sp)
    3e32:	2f00           	move.l d0,-(sp)
    3e34:	2f2f 01d0      	move.l 464(sp),-(sp)
    3e38:	2f2f 0056      	move.l 86(sp),-(sp)
    3e3c:	4eba 2c98      	jsr 6ad6 <TestRow>(pc)
    3e40:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3e44:	702a           	moveq #42,d0
    3e46:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    3e4a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) { 
    3e4e:	52af 01be      	addq.l #1,446(sp)
    3e52:	7211           	moveq #17,d1
    3e54:	b2af 01be      	cmp.l 446(sp),d1
    3e58:	6cbc           	bge.s 3e16 <TestZoom4Picture+0x1a2>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    3e5a:	222f 01c2      	move.l 450(sp),d1
    3e5e:	2001           	move.l d1,d0
    3e60:	e788           	lsl.l #3,d0
    3e62:	d081           	add.l d1,d0
    3e64:	d080           	add.l d0,d0
    3e66:	2040           	movea.l d0,a0
    3e68:	d1c1           	adda.l d1,a0
    3e6a:	41e8 0012      	lea 18(a0),a0
    3e6e:	7000           	moveq #0,d0
    3e70:	302f 01c6      	move.w 454(sp),d0
    3e74:	2f08           	move.l a0,-(sp)
    3e76:	2f00           	move.l d0,-(sp)
    3e78:	2f2f 01d0      	move.l 464(sp),-(sp)
    3e7c:	2f2f 0056      	move.l 86(sp),-(sp)
    3e80:	4eba 2c54      	jsr 6ad6 <TestRow>(pc)
    3e84:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3e88:	702a           	moveq #42,d0
    3e8a:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<14;i++) {
    3e8e:	52af 01c2      	addq.l #1,450(sp)
    3e92:	720d           	moveq #13,d1
    3e94:	b2af 01c2      	cmp.l 450(sp),d1
    3e98:	6c00 ff76      	bge.w 3e10 <TestZoom4Picture+0x19c>
  }

  for(int i2=0;i2<4;i2++) { 
    3e9c:	42af 01ba      	clr.l 442(sp)
    3ea0:	6032           	bra.s 3ed4 <TestZoom4Picture+0x260>
    TestRow( valsupposed, valactual, mask, i2+265);
    3ea2:	222f 01ba      	move.l 442(sp),d1
    3ea6:	0681 0000 0109 	addi.l #265,d1
    3eac:	7000           	moveq #0,d0
    3eae:	302f 01c6      	move.w 454(sp),d0
    3eb2:	2f01           	move.l d1,-(sp)
    3eb4:	2f00           	move.l d0,-(sp)
    3eb6:	2f2f 01d0      	move.l 464(sp),-(sp)
    3eba:	2f2f 0056      	move.l 86(sp),-(sp)
    3ebe:	4eba 2c16      	jsr 6ad6 <TestRow>(pc)
    3ec2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3ec6:	702a           	moveq #42,d0
    3ec8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    3ecc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    3ed0:	52af 01ba      	addq.l #1,442(sp)
    3ed4:	7203           	moveq #3,d1
    3ed6:	b2af 01ba      	cmp.l 442(sp),d1
    3eda:	6cc6           	bge.s 3ea2 <TestZoom4Picture+0x22e>
  }
  
  UWORD *tmp = source;
    3edc:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    3ee2:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    3ee8:	2f6f 0046 004e 	move.l 70(sp),78(sp)
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    3eee:	4878 0001      	pea 1 <_start+0x1>
    3ef2:	4878 0001      	pea 1 <_start+0x1>
    3ef6:	2f2f 0056      	move.l 86(sp),-(sp)
    3efa:	2f2f 006a      	move.l 106(sp),-(sp)
    3efe:	4eba db62      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    3f02:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3f06:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    3f0c:	2c40           	movea.l d0,a6
    3f0e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    3f12:	202f 004e      	move.l 78(sp),d0
    3f16:	5880           	addq.l #4,d0
    3f18:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom2;
    3f1c:	2f7c 0000 ba80 	move.l #47744,74(sp)
    3f22:	004a 
  mask = 0x0000;
    3f24:	426f 01c6      	clr.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3f28:	42af 01b6      	clr.l 438(sp)
    3f2c:	602a           	bra.s 3f58 <TestZoom4Picture+0x2e4>
    TestRow( valsupposed, valactual, mask, i2);
    3f2e:	7000           	moveq #0,d0
    3f30:	302f 01c6      	move.w 454(sp),d0
    3f34:	2f2f 01b6      	move.l 438(sp),-(sp)
    3f38:	2f00           	move.l d0,-(sp)
    3f3a:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f3e:	2f2f 0056      	move.l 86(sp),-(sp)
    3f42:	4eba 2b92      	jsr 6ad6 <TestRow>(pc)
    3f46:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f4a:	722a           	moveq #42,d1
    3f4c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    3f50:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3f54:	52af 01b6      	addq.l #1,438(sp)
    3f58:	700a           	moveq #10,d0
    3f5a:	b0af 01b6      	cmp.l 438(sp),d0
    3f5e:	6cce           	bge.s 3f2e <TestZoom4Picture+0x2ba>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    3f60:	4878 0008      	pea 8 <_start+0x8>
    3f64:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3f6a:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f6e:	2f2f 0056      	move.l 86(sp),-(sp)
    3f72:	4eba 2b62      	jsr 6ad6 <TestRow>(pc)
    3f76:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3f7a:	722a           	moveq #42,d1
    3f7c:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 9);
    3f80:	4878 0009      	pea 9 <_start+0x9>
    3f84:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3f8a:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f8e:	2f2f 0056      	move.l 86(sp),-(sp)
    3f92:	4eba 2b42      	jsr 6ad6 <TestRow>(pc)
    3f96:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3f9a:	702a           	moveq #42,d0
    3f9c:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 10);
    3fa0:	4878 000a      	pea a <_start+0xa>
    3fa4:	42a7           	clr.l -(sp)
    3fa6:	2f2f 01d0      	move.l 464(sp),-(sp)
    3faa:	2f2f 0056      	move.l 86(sp),-(sp)
    3fae:	4eba 2b26      	jsr 6ad6 <TestRow>(pc)
    3fb2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3fb6:	722a           	moveq #42,d1
    3fb8:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 11);
    3fbc:	4878 000b      	pea b <_start+0xb>
    3fc0:	42a7           	clr.l -(sp)
    3fc2:	2f2f 01d0      	move.l 464(sp),-(sp)
    3fc6:	2f2f 0056      	move.l 86(sp),-(sp)
    3fca:	4eba 2b0a      	jsr 6ad6 <TestRow>(pc)
    3fce:	4fef 0010      	lea 16(sp),sp

  valactual += ZMLINESIZE/2;
    3fd2:	702a           	moveq #42,d0
    3fd4:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<12;i++) {
    3fd8:	42af 01b2      	clr.l 434(sp)
    3fdc:	6000 0118      	bra.w 40f6 <TestZoom4Picture+0x482>
    for(int i2=0;i2<16;i2++) {  
    3fe0:	42af 01ae      	clr.l 430(sp)
    3fe4:	603c           	bra.s 4022 <TestZoom4Picture+0x3ae>
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    3fe6:	222f 01b2      	move.l 434(sp),d1
    3fea:	2001           	move.l d1,d0
    3fec:	e988           	lsl.l #4,d0
    3fee:	d081           	add.l d1,d0
    3ff0:	2040           	movea.l d0,a0
    3ff2:	d1ef 01ae      	adda.l 430(sp),a0
    3ff6:	41e8 000b      	lea 11(a0),a0
    3ffa:	7000           	moveq #0,d0
    3ffc:	302f 01c6      	move.w 454(sp),d0
    4000:	2f08           	move.l a0,-(sp)
    4002:	2f00           	move.l d0,-(sp)
    4004:	2f2f 01d0      	move.l 464(sp),-(sp)
    4008:	2f2f 0056      	move.l 86(sp),-(sp)
    400c:	4eba 2ac8      	jsr 6ad6 <TestRow>(pc)
    4010:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4014:	722a           	moveq #42,d1
    4016:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    401a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {  
    401e:	52af 01ae      	addq.l #1,430(sp)
    4022:	700f           	moveq #15,d0
    4024:	b0af 01ae      	cmp.l 430(sp),d0
    4028:	6cbc           	bge.s 3fe6 <TestZoom4Picture+0x372>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    402a:	222f 01b2      	move.l 434(sp),d1
    402e:	2001           	move.l d1,d0
    4030:	e988           	lsl.l #4,d0
    4032:	2040           	movea.l d0,a0
    4034:	d1c1           	adda.l d1,a0
    4036:	41e8 0018      	lea 24(a0),a0
    403a:	7000           	moveq #0,d0
    403c:	302f 01c6      	move.w 454(sp),d0
    4040:	2f08           	move.l a0,-(sp)
    4042:	2f00           	move.l d0,-(sp)
    4044:	2f2f 01d0      	move.l 464(sp),-(sp)
    4048:	2f2f 0056      	move.l 86(sp),-(sp)
    404c:	4eba 2a88      	jsr 6ad6 <TestRow>(pc)
    4050:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4054:	722a           	moveq #42,d1
    4056:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    405a:	222f 01b2      	move.l 434(sp),d1
    405e:	2001           	move.l d1,d0
    4060:	e988           	lsl.l #4,d0
    4062:	2040           	movea.l d0,a0
    4064:	d1c1           	adda.l d1,a0
    4066:	41e8 0019      	lea 25(a0),a0
    406a:	7000           	moveq #0,d0
    406c:	302f 01c6      	move.w 454(sp),d0
    4070:	2f08           	move.l a0,-(sp)
    4072:	2f00           	move.l d0,-(sp)
    4074:	2f2f 01d0      	move.l 464(sp),-(sp)
    4078:	2f2f 0056      	move.l 86(sp),-(sp)
    407c:	4eba 2a58      	jsr 6ad6 <TestRow>(pc)
    4080:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4084:	702a           	moveq #42,d0
    4086:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    408a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    408e:	222f 01b2      	move.l 434(sp),d1
    4092:	2001           	move.l d1,d0
    4094:	e988           	lsl.l #4,d0
    4096:	2040           	movea.l d0,a0
    4098:	d1c1           	adda.l d1,a0
    409a:	41e8 001a      	lea 26(a0),a0
    409e:	7000           	moveq #0,d0
    40a0:	302f 01c6      	move.w 454(sp),d0
    40a4:	2f08           	move.l a0,-(sp)
    40a6:	2f00           	move.l d0,-(sp)
    40a8:	2f2f 01d0      	move.l 464(sp),-(sp)
    40ac:	2f2f 0056      	move.l 86(sp),-(sp)
    40b0:	4eba 2a24      	jsr 6ad6 <TestRow>(pc)
    40b4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40b8:	722a           	moveq #42,d1
    40ba:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    40be:	222f 01b2      	move.l 434(sp),d1
    40c2:	2001           	move.l d1,d0
    40c4:	e988           	lsl.l #4,d0
    40c6:	2040           	movea.l d0,a0
    40c8:	d1c1           	adda.l d1,a0
    40ca:	41e8 001b      	lea 27(a0),a0
    40ce:	7000           	moveq #0,d0
    40d0:	302f 01c6      	move.w 454(sp),d0
    40d4:	2f08           	move.l a0,-(sp)
    40d6:	2f00           	move.l d0,-(sp)
    40d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    40dc:	2f2f 0056      	move.l 86(sp),-(sp)
    40e0:	4eba 29f4      	jsr 6ad6 <TestRow>(pc)
    40e4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40e8:	702a           	moveq #42,d0
    40ea:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    40ee:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    40f2:	52af 01b2      	addq.l #1,434(sp)
    40f6:	720b           	moveq #11,d1
    40f8:	b2af 01b2      	cmp.l 434(sp),d1
    40fc:	6c00 fee2      	bge.w 3fe0 <TestZoom4Picture+0x36c>
    
  }

  for(int i2=0;i2<15;i2++) { 
    4100:	42af 01aa      	clr.l 426(sp)
    4104:	602a           	bra.s 4130 <TestZoom4Picture+0x4bc>
    TestRow( valsupposed, valactual, mask, i2);
    4106:	7000           	moveq #0,d0
    4108:	302f 01c6      	move.w 454(sp),d0
    410c:	2f2f 01aa      	move.l 426(sp),-(sp)
    4110:	2f00           	move.l d0,-(sp)
    4112:	2f2f 01d0      	move.l 464(sp),-(sp)
    4116:	2f2f 0056      	move.l 86(sp),-(sp)
    411a:	4eba 29ba      	jsr 6ad6 <TestRow>(pc)
    411e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4122:	702a           	moveq #42,d0
    4124:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4128:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<15;i2++) { 
    412c:	52af 01aa      	addq.l #1,426(sp)
    4130:	720e           	moveq #14,d1
    4132:	b2af 01aa      	cmp.l 426(sp),d1
    4136:	6cce           	bge.s 4106 <TestZoom4Picture+0x492>
  }

  tmp = source;
    4138:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    413e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4144:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    414a:	4878 0001      	pea 1 <_start+0x1>
    414e:	4878 0002      	pea 2 <_start+0x2>
    4152:	2f2f 0056      	move.l 86(sp),-(sp)
    4156:	2f2f 006a      	move.l 106(sp),-(sp)
    415a:	4eba d906      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    415e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4162:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    4168:	2c40           	movea.l d0,a6
    416a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    416e:	202f 004e      	move.l 78(sp),d0
    4172:	5880           	addq.l #4,d0
    4174:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom3;
    4178:	2f7c 0000 baac 	move.l #47788,74(sp)
    417e:	004a 
  mask = 0xffff;
    4180:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<4;i2++) { 
    4186:	42af 01a6      	clr.l 422(sp)
    418a:	602a           	bra.s 41b6 <TestZoom4Picture+0x542>
    TestRow( valsupposed, valactual, mask, i2);
    418c:	7000           	moveq #0,d0
    418e:	302f 01c6      	move.w 454(sp),d0
    4192:	2f2f 01a6      	move.l 422(sp),-(sp)
    4196:	2f00           	move.l d0,-(sp)
    4198:	2f2f 01d0      	move.l 464(sp),-(sp)
    419c:	2f2f 0056      	move.l 86(sp),-(sp)
    41a0:	4eba 2934      	jsr 6ad6 <TestRow>(pc)
    41a4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    41a8:	722a           	moveq #42,d1
    41aa:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    41ae:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    41b2:	52af 01a6      	addq.l #1,422(sp)
    41b6:	7003           	moveq #3,d0
    41b8:	b0af 01a6      	cmp.l 422(sp),d0
    41bc:	6cce           	bge.s 418c <TestZoom4Picture+0x518>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    41be:	4878 0004      	pea 4 <_start+0x4>
    41c2:	2f3c 0000 ffff 	move.l #65535,-(sp)
    41c8:	2f2f 01d0      	move.l 464(sp),-(sp)
    41cc:	2f2f 0056      	move.l 86(sp),-(sp)
    41d0:	4eba 2904      	jsr 6ad6 <TestRow>(pc)
    41d4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    41d8:	722a           	moveq #42,d1
    41da:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    41de:	4878 0005      	pea 5 <_start+0x5>
    41e2:	2f3c 0000 ffff 	move.l #65535,-(sp)
    41e8:	2f2f 01d0      	move.l 464(sp),-(sp)
    41ec:	2f2f 0056      	move.l 86(sp),-(sp)
    41f0:	4eba 28e4      	jsr 6ad6 <TestRow>(pc)
    41f4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    41f8:	702a           	moveq #42,d0
    41fa:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    41fe:	4878 0006      	pea 6 <_start+0x6>
    4202:	42a7           	clr.l -(sp)
    4204:	2f2f 01d0      	move.l 464(sp),-(sp)
    4208:	2f2f 0056      	move.l 86(sp),-(sp)
    420c:	4eba 28c8      	jsr 6ad6 <TestRow>(pc)
    4210:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4214:	722a           	moveq #42,d1
    4216:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    421a:	4878 0007      	pea 7 <_start+0x7>
    421e:	42a7           	clr.l -(sp)
    4220:	2f2f 01d0      	move.l 464(sp),-(sp)
    4224:	2f2f 0056      	move.l 86(sp),-(sp)
    4228:	4eba 28ac      	jsr 6ad6 <TestRow>(pc)
    422c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4230:	702a           	moveq #42,d0
    4232:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    4236:	4878 0008      	pea 8 <_start+0x8>
    423a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4240:	2f2f 01d0      	move.l 464(sp),-(sp)
    4244:	2f2f 0056      	move.l 86(sp),-(sp)
    4248:	4eba 288c      	jsr 6ad6 <TestRow>(pc)
    424c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4250:	722a           	moveq #42,d1
    4252:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    4256:	4878 0009      	pea 9 <_start+0x9>
    425a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4260:	2f2f 01d0      	move.l 464(sp),-(sp)
    4264:	2f2f 0056      	move.l 86(sp),-(sp)
    4268:	4eba 286c      	jsr 6ad6 <TestRow>(pc)
    426c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4270:	702a           	moveq #42,d0
    4272:	d1af 01c8      	add.l d0,456(sp)

  mask = 0x0000;
    4276:	426f 01c6      	clr.w 454(sp)
  for(int i=0;i<12;i++) {
    427a:	42af 01a2      	clr.l 418(sp)
    427e:	6000 01a6      	bra.w 4426 <TestZoom4Picture+0x7b2>
    for(int i2=0;i2<15;i2++) {  
    4282:	42af 019e      	clr.l 414(sp)
    4286:	6042           	bra.s 42ca <TestZoom4Picture+0x656>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    4288:	222f 01a2      	move.l 418(sp),d1
    428c:	2001           	move.l d1,d0
    428e:	d080           	add.l d0,d0
    4290:	d081           	add.l d1,d0
    4292:	2200           	move.l d0,d1
    4294:	e789           	lsl.l #3,d1
    4296:	9280           	sub.l d0,d1
    4298:	2041           	movea.l d1,a0
    429a:	d1ef 019e      	adda.l 414(sp),a0
    429e:	41e8 0009      	lea 9(a0),a0
    42a2:	7000           	moveq #0,d0
    42a4:	302f 01c6      	move.w 454(sp),d0
    42a8:	2f08           	move.l a0,-(sp)
    42aa:	2f00           	move.l d0,-(sp)
    42ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    42b0:	2f2f 0056      	move.l 86(sp),-(sp)
    42b4:	4eba 2820      	jsr 6ad6 <TestRow>(pc)
    42b8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    42bc:	722a           	moveq #42,d1
    42be:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    42c2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {  
    42c6:	52af 019e      	addq.l #1,414(sp)
    42ca:	700e           	moveq #14,d0
    42cc:	b0af 019e      	cmp.l 414(sp),d0
    42d0:	6cb6           	bge.s 4288 <TestZoom4Picture+0x614>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    42d2:	222f 01a2      	move.l 418(sp),d1
    42d6:	2001           	move.l d1,d0
    42d8:	d080           	add.l d0,d0
    42da:	d081           	add.l d1,d0
    42dc:	2200           	move.l d0,d1
    42de:	e789           	lsl.l #3,d1
    42e0:	2041           	movea.l d1,a0
    42e2:	91c0           	suba.l d0,a0
    42e4:	41e8 0018      	lea 24(a0),a0
    42e8:	7000           	moveq #0,d0
    42ea:	302f 01c6      	move.w 454(sp),d0
    42ee:	2f08           	move.l a0,-(sp)
    42f0:	2f00           	move.l d0,-(sp)
    42f2:	2f2f 01d0      	move.l 464(sp),-(sp)
    42f6:	2f2f 0056      	move.l 86(sp),-(sp)
    42fa:	4eba 27da      	jsr 6ad6 <TestRow>(pc)
    42fe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4302:	722a           	moveq #42,d1
    4304:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    4308:	222f 01a2      	move.l 418(sp),d1
    430c:	2001           	move.l d1,d0
    430e:	d080           	add.l d0,d0
    4310:	d081           	add.l d1,d0
    4312:	2200           	move.l d0,d1
    4314:	e789           	lsl.l #3,d1
    4316:	2041           	movea.l d1,a0
    4318:	91c0           	suba.l d0,a0
    431a:	41e8 0019      	lea 25(a0),a0
    431e:	7000           	moveq #0,d0
    4320:	302f 01c6      	move.w 454(sp),d0
    4324:	2f08           	move.l a0,-(sp)
    4326:	2f00           	move.l d0,-(sp)
    4328:	2f2f 01d0      	move.l 464(sp),-(sp)
    432c:	2f2f 0056      	move.l 86(sp),-(sp)
    4330:	4eba 27a4      	jsr 6ad6 <TestRow>(pc)
    4334:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4338:	702a           	moveq #42,d0
    433a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    433e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    4342:	222f 01a2      	move.l 418(sp),d1
    4346:	2001           	move.l d1,d0
    4348:	d080           	add.l d0,d0
    434a:	d081           	add.l d1,d0
    434c:	2200           	move.l d0,d1
    434e:	e789           	lsl.l #3,d1
    4350:	2041           	movea.l d1,a0
    4352:	91c0           	suba.l d0,a0
    4354:	41e8 001a      	lea 26(a0),a0
    4358:	7000           	moveq #0,d0
    435a:	302f 01c6      	move.w 454(sp),d0
    435e:	2f08           	move.l a0,-(sp)
    4360:	2f00           	move.l d0,-(sp)
    4362:	2f2f 01d0      	move.l 464(sp),-(sp)
    4366:	2f2f 0056      	move.l 86(sp),-(sp)
    436a:	4eba 276a      	jsr 6ad6 <TestRow>(pc)
    436e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4372:	722a           	moveq #42,d1
    4374:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    4378:	222f 01a2      	move.l 418(sp),d1
    437c:	2001           	move.l d1,d0
    437e:	d080           	add.l d0,d0
    4380:	d081           	add.l d1,d0
    4382:	2200           	move.l d0,d1
    4384:	e789           	lsl.l #3,d1
    4386:	2041           	movea.l d1,a0
    4388:	91c0           	suba.l d0,a0
    438a:	41e8 001b      	lea 27(a0),a0
    438e:	7000           	moveq #0,d0
    4390:	302f 01c6      	move.w 454(sp),d0
    4394:	2f08           	move.l a0,-(sp)
    4396:	2f00           	move.l d0,-(sp)
    4398:	2f2f 01d0      	move.l 464(sp),-(sp)
    439c:	2f2f 0056      	move.l 86(sp),-(sp)
    43a0:	4eba 2734      	jsr 6ad6 <TestRow>(pc)
    43a4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43a8:	702a           	moveq #42,d0
    43aa:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    43ae:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    43b2:	222f 01a2      	move.l 418(sp),d1
    43b6:	2001           	move.l d1,d0
    43b8:	d080           	add.l d0,d0
    43ba:	d081           	add.l d1,d0
    43bc:	2200           	move.l d0,d1
    43be:	e789           	lsl.l #3,d1
    43c0:	2041           	movea.l d1,a0
    43c2:	91c0           	suba.l d0,a0
    43c4:	41e8 001c      	lea 28(a0),a0
    43c8:	7000           	moveq #0,d0
    43ca:	302f 01c6      	move.w 454(sp),d0
    43ce:	2f08           	move.l a0,-(sp)
    43d0:	2f00           	move.l d0,-(sp)
    43d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    43d6:	2f2f 0056      	move.l 86(sp),-(sp)
    43da:	4eba 26fa      	jsr 6ad6 <TestRow>(pc)
    43de:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43e2:	722a           	moveq #42,d1
    43e4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    43e8:	222f 01a2      	move.l 418(sp),d1
    43ec:	2001           	move.l d1,d0
    43ee:	d080           	add.l d0,d0
    43f0:	d081           	add.l d1,d0
    43f2:	2200           	move.l d0,d1
    43f4:	e789           	lsl.l #3,d1
    43f6:	2041           	movea.l d1,a0
    43f8:	91c0           	suba.l d0,a0
    43fa:	41e8 001d      	lea 29(a0),a0
    43fe:	7000           	moveq #0,d0
    4400:	302f 01c6      	move.w 454(sp),d0
    4404:	2f08           	move.l a0,-(sp)
    4406:	2f00           	move.l d0,-(sp)
    4408:	2f2f 01d0      	move.l 464(sp),-(sp)
    440c:	2f2f 0056      	move.l 86(sp),-(sp)
    4410:	4eba 26c4      	jsr 6ad6 <TestRow>(pc)
    4414:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4418:	702a           	moveq #42,d0
    441a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    441e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    4422:	52af 01a2      	addq.l #1,418(sp)
    4426:	720b           	moveq #11,d1
    4428:	b2af 01a2      	cmp.l 418(sp),d1
    442c:	6c00 fe54      	bge.w 4282 <TestZoom4Picture+0x60e>
  }

  for(int i2=0;i2<8;i2++) {  
    4430:	42af 019a      	clr.l 410(sp)
    4434:	6032           	bra.s 4468 <TestZoom4Picture+0x7f4>
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    4436:	222f 019a      	move.l 410(sp),d1
    443a:	0681 0000 0105 	addi.l #261,d1
    4440:	7000           	moveq #0,d0
    4442:	302f 01c6      	move.w 454(sp),d0
    4446:	2f01           	move.l d1,-(sp)
    4448:	2f00           	move.l d0,-(sp)
    444a:	2f2f 01d0      	move.l 464(sp),-(sp)
    444e:	2f2f 0056      	move.l 86(sp),-(sp)
    4452:	4eba 2682      	jsr 6ad6 <TestRow>(pc)
    4456:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    445a:	702a           	moveq #42,d0
    445c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4460:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    4464:	52af 019a      	addq.l #1,410(sp)
    4468:	7207           	moveq #7,d1
    446a:	b2af 019a      	cmp.l 410(sp),d1
    446e:	6cc6           	bge.s 4436 <TestZoom4Picture+0x7c2>
  }

  tmp = source;
    4470:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4476:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    447c:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    4482:	4878 0001      	pea 1 <_start+0x1>
    4486:	4878 0003      	pea 3 <_start+0x3>
    448a:	2f2f 0056      	move.l 86(sp),-(sp)
    448e:	2f2f 006a      	move.l 106(sp),-(sp)
    4492:	4eba d5ce      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    4496:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    449a:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    44a0:	2c40           	movea.l d0,a6
    44a2:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    44a6:	202f 004e      	move.l 78(sp),d0
    44aa:	5880           	addq.l #4,d0
    44ac:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom4;
    44b0:	2f7c 0000 bad8 	move.l #47832,74(sp)
    44b6:	004a 
  mask = 0x0000;
    44b8:	426f 01c6      	clr.w 454(sp)
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    44bc:	4878 0007      	pea 7 <_start+0x7>
    44c0:	42a7           	clr.l -(sp)
    44c2:	2f2f 01d0      	move.l 464(sp),-(sp)
    44c6:	2f2f 0056      	move.l 86(sp),-(sp)
    44ca:	4eba 260a      	jsr 6ad6 <TestRow>(pc)
    44ce:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44d2:	722a           	moveq #42,d1
    44d4:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    44d8:	4878 0008      	pea 8 <_start+0x8>
    44dc:	2f3c 0000 ffff 	move.l #65535,-(sp)
    44e2:	2f2f 01d0      	move.l 464(sp),-(sp)
    44e6:	2f2f 0056      	move.l 86(sp),-(sp)
    44ea:	4eba 25ea      	jsr 6ad6 <TestRow>(pc)
    44ee:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44f2:	702a           	moveq #42,d0
    44f4:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    44f8:	4878 0009      	pea 9 <_start+0x9>
    44fc:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4502:	2f2f 01d0      	move.l 464(sp),-(sp)
    4506:	2f2f 0056      	move.l 86(sp),-(sp)
    450a:	4eba 25ca      	jsr 6ad6 <TestRow>(pc)
    450e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4512:	722a           	moveq #42,d1
    4514:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    4518:	4878 0008      	pea 8 <_start+0x8>
    451c:	42a7           	clr.l -(sp)
    451e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4522:	2f2f 0056      	move.l 86(sp),-(sp)
    4526:	4eba 25ae      	jsr 6ad6 <TestRow>(pc)
    452a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    452e:	702a           	moveq #42,d0
    4530:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    4534:	4878 0009      	pea 9 <_start+0x9>
    4538:	42a7           	clr.l -(sp)
    453a:	2f2f 01d0      	move.l 464(sp),-(sp)
    453e:	2f2f 0056      	move.l 86(sp),-(sp)
    4542:	4eba 2592      	jsr 6ad6 <TestRow>(pc)
    4546:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    454a:	722a           	moveq #42,d1
    454c:	d3af 01c8      	add.l d1,456(sp)

  mask = 0xffff;
    4550:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<12;i++) {
    4556:	42af 0196      	clr.l 406(sp)
    455a:	6000 0216      	bra.w 4772 <TestZoom4Picture+0xafe>
    for(int i2=0;i2<14;i2++) {  
    455e:	42af 0192      	clr.l 402(sp)
    4562:	6042           	bra.s 45a6 <TestZoom4Picture+0x932>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    4564:	222f 0196      	move.l 406(sp),d1
    4568:	2001           	move.l d1,d0
    456a:	d080           	add.l d0,d0
    456c:	d081           	add.l d1,d0
    456e:	2200           	move.l d0,d1
    4570:	e789           	lsl.l #3,d1
    4572:	9280           	sub.l d0,d1
    4574:	2041           	movea.l d1,a0
    4576:	d1ef 0192      	adda.l 402(sp),a0
    457a:	41e8 0009      	lea 9(a0),a0
    457e:	7000           	moveq #0,d0
    4580:	302f 01c6      	move.w 454(sp),d0
    4584:	2f08           	move.l a0,-(sp)
    4586:	2f00           	move.l d0,-(sp)
    4588:	2f2f 01d0      	move.l 464(sp),-(sp)
    458c:	2f2f 0056      	move.l 86(sp),-(sp)
    4590:	4eba 2544      	jsr 6ad6 <TestRow>(pc)
    4594:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4598:	702a           	moveq #42,d0
    459a:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    459e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {  
    45a2:	52af 0192      	addq.l #1,402(sp)
    45a6:	720d           	moveq #13,d1
    45a8:	b2af 0192      	cmp.l 402(sp),d1
    45ac:	6cb6           	bge.s 4564 <TestZoom4Picture+0x8f0>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    45ae:	222f 0196      	move.l 406(sp),d1
    45b2:	2001           	move.l d1,d0
    45b4:	d080           	add.l d0,d0
    45b6:	d081           	add.l d1,d0
    45b8:	2200           	move.l d0,d1
    45ba:	e789           	lsl.l #3,d1
    45bc:	2041           	movea.l d1,a0
    45be:	91c0           	suba.l d0,a0
    45c0:	41e8 0018      	lea 24(a0),a0
    45c4:	7000           	moveq #0,d0
    45c6:	302f 01c6      	move.w 454(sp),d0
    45ca:	2f08           	move.l a0,-(sp)
    45cc:	2f00           	move.l d0,-(sp)
    45ce:	2f2f 01d0      	move.l 464(sp),-(sp)
    45d2:	2f2f 0056      	move.l 86(sp),-(sp)
    45d6:	4eba 24fe      	jsr 6ad6 <TestRow>(pc)
    45da:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    45de:	702a           	moveq #42,d0
    45e0:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    45e4:	222f 0196      	move.l 406(sp),d1
    45e8:	2001           	move.l d1,d0
    45ea:	d080           	add.l d0,d0
    45ec:	d081           	add.l d1,d0
    45ee:	2200           	move.l d0,d1
    45f0:	e789           	lsl.l #3,d1
    45f2:	2041           	movea.l d1,a0
    45f4:	91c0           	suba.l d0,a0
    45f6:	41e8 0019      	lea 25(a0),a0
    45fa:	7000           	moveq #0,d0
    45fc:	302f 01c6      	move.w 454(sp),d0
    4600:	2f08           	move.l a0,-(sp)
    4602:	2f00           	move.l d0,-(sp)
    4604:	2f2f 01d0      	move.l 464(sp),-(sp)
    4608:	2f2f 0056      	move.l 86(sp),-(sp)
    460c:	4eba 24c8      	jsr 6ad6 <TestRow>(pc)
    4610:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4614:	722a           	moveq #42,d1
    4616:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    461a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    461e:	222f 0196      	move.l 406(sp),d1
    4622:	2001           	move.l d1,d0
    4624:	d080           	add.l d0,d0
    4626:	d081           	add.l d1,d0
    4628:	2200           	move.l d0,d1
    462a:	e789           	lsl.l #3,d1
    462c:	2041           	movea.l d1,a0
    462e:	91c0           	suba.l d0,a0
    4630:	41e8 001a      	lea 26(a0),a0
    4634:	7000           	moveq #0,d0
    4636:	302f 01c6      	move.w 454(sp),d0
    463a:	2f08           	move.l a0,-(sp)
    463c:	2f00           	move.l d0,-(sp)
    463e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4642:	2f2f 0056      	move.l 86(sp),-(sp)
    4646:	4eba 248e      	jsr 6ad6 <TestRow>(pc)
    464a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    464e:	702a           	moveq #42,d0
    4650:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    4654:	222f 0196      	move.l 406(sp),d1
    4658:	2001           	move.l d1,d0
    465a:	d080           	add.l d0,d0
    465c:	d081           	add.l d1,d0
    465e:	2200           	move.l d0,d1
    4660:	e789           	lsl.l #3,d1
    4662:	2041           	movea.l d1,a0
    4664:	91c0           	suba.l d0,a0
    4666:	41e8 001b      	lea 27(a0),a0
    466a:	7000           	moveq #0,d0
    466c:	302f 01c6      	move.w 454(sp),d0
    4670:	2f08           	move.l a0,-(sp)
    4672:	2f00           	move.l d0,-(sp)
    4674:	2f2f 01d0      	move.l 464(sp),-(sp)
    4678:	2f2f 0056      	move.l 86(sp),-(sp)
    467c:	4eba 2458      	jsr 6ad6 <TestRow>(pc)
    4680:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4684:	722a           	moveq #42,d1
    4686:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    468a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    468e:	222f 0196      	move.l 406(sp),d1
    4692:	2001           	move.l d1,d0
    4694:	d080           	add.l d0,d0
    4696:	d081           	add.l d1,d0
    4698:	2200           	move.l d0,d1
    469a:	e789           	lsl.l #3,d1
    469c:	2041           	movea.l d1,a0
    469e:	91c0           	suba.l d0,a0
    46a0:	41e8 001c      	lea 28(a0),a0
    46a4:	7000           	moveq #0,d0
    46a6:	302f 01c6      	move.w 454(sp),d0
    46aa:	2f08           	move.l a0,-(sp)
    46ac:	2f00           	move.l d0,-(sp)
    46ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    46b2:	2f2f 0056      	move.l 86(sp),-(sp)
    46b6:	4eba 241e      	jsr 6ad6 <TestRow>(pc)
    46ba:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46be:	702a           	moveq #42,d0
    46c0:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    46c4:	222f 0196      	move.l 406(sp),d1
    46c8:	2001           	move.l d1,d0
    46ca:	d080           	add.l d0,d0
    46cc:	d081           	add.l d1,d0
    46ce:	2200           	move.l d0,d1
    46d0:	e789           	lsl.l #3,d1
    46d2:	2041           	movea.l d1,a0
    46d4:	91c0           	suba.l d0,a0
    46d6:	41e8 001d      	lea 29(a0),a0
    46da:	7000           	moveq #0,d0
    46dc:	302f 01c6      	move.w 454(sp),d0
    46e0:	2f08           	move.l a0,-(sp)
    46e2:	2f00           	move.l d0,-(sp)
    46e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    46e8:	2f2f 0056      	move.l 86(sp),-(sp)
    46ec:	4eba 23e8      	jsr 6ad6 <TestRow>(pc)
    46f0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46f4:	722a           	moveq #42,d1
    46f6:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    46fa:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    46fe:	222f 0196      	move.l 406(sp),d1
    4702:	2001           	move.l d1,d0
    4704:	d080           	add.l d0,d0
    4706:	d081           	add.l d1,d0
    4708:	2200           	move.l d0,d1
    470a:	e789           	lsl.l #3,d1
    470c:	2041           	movea.l d1,a0
    470e:	91c0           	suba.l d0,a0
    4710:	41e8 001c      	lea 28(a0),a0
    4714:	7000           	moveq #0,d0
    4716:	302f 01c6      	move.w 454(sp),d0
    471a:	2f08           	move.l a0,-(sp)
    471c:	2f00           	move.l d0,-(sp)
    471e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4722:	2f2f 0056      	move.l 86(sp),-(sp)
    4726:	4eba 23ae      	jsr 6ad6 <TestRow>(pc)
    472a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    472e:	702a           	moveq #42,d0
    4730:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4734:	222f 0196      	move.l 406(sp),d1
    4738:	2001           	move.l d1,d0
    473a:	d080           	add.l d0,d0
    473c:	d081           	add.l d1,d0
    473e:	2200           	move.l d0,d1
    4740:	e789           	lsl.l #3,d1
    4742:	2041           	movea.l d1,a0
    4744:	91c0           	suba.l d0,a0
    4746:	41e8 001d      	lea 29(a0),a0
    474a:	7000           	moveq #0,d0
    474c:	302f 01c6      	move.w 454(sp),d0
    4750:	2f08           	move.l a0,-(sp)
    4752:	2f00           	move.l d0,-(sp)
    4754:	2f2f 01d0      	move.l 464(sp),-(sp)
    4758:	2f2f 0056      	move.l 86(sp),-(sp)
    475c:	4eba 2378      	jsr 6ad6 <TestRow>(pc)
    4760:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4764:	722a           	moveq #42,d1
    4766:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    476a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    476e:	52af 0196      	addq.l #1,406(sp)
    4772:	700b           	moveq #11,d0
    4774:	b0af 0196      	cmp.l 406(sp),d0
    4778:	6c00 fde4      	bge.w 455e <TestZoom4Picture+0x8ea>
  }

  TestRow( valsupposed, valactual, mask, 269);
    477c:	7000           	moveq #0,d0
    477e:	302f 01c6      	move.w 454(sp),d0
    4782:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4786:	2f00           	move.l d0,-(sp)
    4788:	2f2f 01d0      	move.l 464(sp),-(sp)
    478c:	2f2f 0056      	move.l 86(sp),-(sp)
    4790:	4eba 2344      	jsr 6ad6 <TestRow>(pc)
    4794:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4798:	722a           	moveq #42,d1
    479a:	d3af 01c8      	add.l d1,456(sp)
  
  tmp = source;
    479e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    47a4:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    47aa:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    47b0:	4878 0001      	pea 1 <_start+0x1>
    47b4:	4878 0004      	pea 4 <_start+0x4>
    47b8:	2f2f 0056      	move.l 86(sp),-(sp)
    47bc:	2f2f 006a      	move.l 106(sp),-(sp)
    47c0:	4eba d2a0      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    47c4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    47c8:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    47ce:	2c40           	movea.l d0,a6
    47d0:	4eae ff1c      	jsr -228(a6)

  valactual = destination+2; 
    47d4:	202f 004e      	move.l 78(sp),d0
    47d8:	5880           	addq.l #4,d0
    47da:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom5;
    47de:	2f7c 0000 bb04 	move.l #47876,74(sp)
    47e4:	004a 
  mask = 0x0000;
    47e6:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<13;i2++) {  
    47ea:	42af 018e      	clr.l 398(sp)
    47ee:	602a           	bra.s 481a <TestZoom4Picture+0xba6>
    TestRow( valsupposed, valactual, mask, i2);
    47f0:	7000           	moveq #0,d0
    47f2:	302f 01c6      	move.w 454(sp),d0
    47f6:	2f2f 018e      	move.l 398(sp),-(sp)
    47fa:	2f00           	move.l d0,-(sp)
    47fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4800:	2f2f 0056      	move.l 86(sp),-(sp)
    4804:	4eba 22d0      	jsr 6ad6 <TestRow>(pc)
    4808:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    480c:	722a           	moveq #42,d1
    480e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4812:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4816:	52af 018e      	addq.l #1,398(sp)
    481a:	700c           	moveq #12,d0
    481c:	b0af 018e      	cmp.l 398(sp),d0
    4820:	6cce           	bge.s 47f0 <TestZoom4Picture+0xb7c>
  }

  TestRow( valsupposed, valactual, mask, 12);   
    4822:	7000           	moveq #0,d0
    4824:	302f 01c6      	move.w 454(sp),d0
    4828:	4878 000c      	pea c <_start+0xc>
    482c:	2f00           	move.l d0,-(sp)
    482e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4832:	2f2f 0056      	move.l 86(sp),-(sp)
    4836:	4eba 229e      	jsr 6ad6 <TestRow>(pc)
    483a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    483e:	722a           	moveq #42,d1
    4840:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 13);
    4844:	7000           	moveq #0,d0
    4846:	302f 01c6      	move.w 454(sp),d0
    484a:	4878 000d      	pea d <_start+0xd>
    484e:	2f00           	move.l d0,-(sp)
    4850:	2f2f 01d0      	move.l 464(sp),-(sp)
    4854:	2f2f 0056      	move.l 86(sp),-(sp)
    4858:	4eba 227c      	jsr 6ad6 <TestRow>(pc)
    485c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4860:	702a           	moveq #42,d0
    4862:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4866:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 14);
    486a:	7000           	moveq #0,d0
    486c:	302f 01c6      	move.w 454(sp),d0
    4870:	4878 000e      	pea e <_start+0xe>
    4874:	2f00           	move.l d0,-(sp)
    4876:	2f2f 01d0      	move.l 464(sp),-(sp)
    487a:	2f2f 0056      	move.l 86(sp),-(sp)
    487e:	4eba 2256      	jsr 6ad6 <TestRow>(pc)
    4882:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4886:	722a           	moveq #42,d1
    4888:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 15);
    488c:	7000           	moveq #0,d0
    488e:	302f 01c6      	move.w 454(sp),d0
    4892:	4878 000f      	pea f <_start+0xf>
    4896:	2f00           	move.l d0,-(sp)
    4898:	2f2f 01d0      	move.l 464(sp),-(sp)
    489c:	2f2f 0056      	move.l 86(sp),-(sp)
    48a0:	4eba 2234      	jsr 6ad6 <TestRow>(pc)
    48a4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48a8:	702a           	moveq #42,d0
    48aa:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    48ae:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 16);
    48b2:	7000           	moveq #0,d0
    48b4:	302f 01c6      	move.w 454(sp),d0
    48b8:	4878 0010      	pea 10 <_start+0x10>
    48bc:	2f00           	move.l d0,-(sp)
    48be:	2f2f 01d0      	move.l 464(sp),-(sp)
    48c2:	2f2f 0056      	move.l 86(sp),-(sp)
    48c6:	4eba 220e      	jsr 6ad6 <TestRow>(pc)
    48ca:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48ce:	722a           	moveq #42,d1
    48d0:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 17);
    48d4:	7000           	moveq #0,d0
    48d6:	302f 01c6      	move.w 454(sp),d0
    48da:	4878 0011      	pea 11 <_start+0x11>
    48de:	2f00           	move.l d0,-(sp)
    48e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    48e4:	2f2f 0056      	move.l 86(sp),-(sp)
    48e8:	4eba 21ec      	jsr 6ad6 <TestRow>(pc)
    48ec:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48f0:	702a           	moveq #42,d0
    48f2:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    48f6:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 18);
    48fa:	7000           	moveq #0,d0
    48fc:	302f 01c6      	move.w 454(sp),d0
    4900:	4878 0012      	pea 12 <_start+0x12>
    4904:	2f00           	move.l d0,-(sp)
    4906:	2f2f 01d0      	move.l 464(sp),-(sp)
    490a:	2f2f 0056      	move.l 86(sp),-(sp)
    490e:	4eba 21c6      	jsr 6ad6 <TestRow>(pc)
    4912:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4916:	722a           	moveq #42,d1
    4918:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 19);
    491c:	7000           	moveq #0,d0
    491e:	302f 01c6      	move.w 454(sp),d0
    4922:	4878 0013      	pea 13 <_start+0x13>
    4926:	2f00           	move.l d0,-(sp)
    4928:	2f2f 01d0      	move.l 464(sp),-(sp)
    492c:	2f2f 0056      	move.l 86(sp),-(sp)
    4930:	4eba 21a4      	jsr 6ad6 <TestRow>(pc)
    4934:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4938:	702a           	moveq #42,d0
    493a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    493e:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 20);
    4942:	7000           	moveq #0,d0
    4944:	302f 01c6      	move.w 454(sp),d0
    4948:	4878 0014      	pea 14 <_start+0x14>
    494c:	2f00           	move.l d0,-(sp)
    494e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4952:	2f2f 0056      	move.l 86(sp),-(sp)
    4956:	4eba 217e      	jsr 6ad6 <TestRow>(pc)
    495a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    495e:	722a           	moveq #42,d1
    4960:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 21);
    4964:	7000           	moveq #0,d0
    4966:	302f 01c6      	move.w 454(sp),d0
    496a:	4878 0015      	pea 15 <_start+0x15>
    496e:	2f00           	move.l d0,-(sp)
    4970:	2f2f 01d0      	move.l 464(sp),-(sp)
    4974:	2f2f 0056      	move.l 86(sp),-(sp)
    4978:	4eba 215c      	jsr 6ad6 <TestRow>(pc)
    497c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4980:	702a           	moveq #42,d0
    4982:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4986:	466f 01c6      	not.w 454(sp)


  for(int i=0;i<10;i++) {
    498a:	42af 018a      	clr.l 394(sp)
    498e:	6000 0286      	bra.w 4c16 <TestZoom4Picture+0xfa2>
    for(int i2=0;i2<13;i2++) {  
    4992:	42af 0186      	clr.l 390(sp)
    4996:	6042           	bra.s 49da <TestZoom4Picture+0xd66>
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    4998:	222f 018a      	move.l 394(sp),d1
    499c:	2001           	move.l d1,d0
    499e:	d080           	add.l d0,d0
    49a0:	d081           	add.l d1,d0
    49a2:	2200           	move.l d0,d1
    49a4:	e789           	lsl.l #3,d1
    49a6:	9280           	sub.l d0,d1
    49a8:	2041           	movea.l d1,a0
    49aa:	d1ef 0186      	adda.l 390(sp),a0
    49ae:	41e8 0016      	lea 22(a0),a0
    49b2:	7000           	moveq #0,d0
    49b4:	302f 01c6      	move.w 454(sp),d0
    49b8:	2f08           	move.l a0,-(sp)
    49ba:	2f00           	move.l d0,-(sp)
    49bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    49c0:	2f2f 0056      	move.l 86(sp),-(sp)
    49c4:	4eba 2110      	jsr 6ad6 <TestRow>(pc)
    49c8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    49cc:	722a           	moveq #42,d1
    49ce:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    49d2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {  
    49d6:	52af 0186      	addq.l #1,390(sp)
    49da:	700c           	moveq #12,d0
    49dc:	b0af 0186      	cmp.l 390(sp),d0
    49e0:	6cb6           	bge.s 4998 <TestZoom4Picture+0xd24>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    49e2:	222f 018a      	move.l 394(sp),d1
    49e6:	2001           	move.l d1,d0
    49e8:	d080           	add.l d0,d0
    49ea:	d081           	add.l d1,d0
    49ec:	2200           	move.l d0,d1
    49ee:	e789           	lsl.l #3,d1
    49f0:	2041           	movea.l d1,a0
    49f2:	91c0           	suba.l d0,a0
    49f4:	41e8 0023      	lea 35(a0),a0
    49f8:	7000           	moveq #0,d0
    49fa:	302f 01c6      	move.w 454(sp),d0
    49fe:	2f08           	move.l a0,-(sp)
    4a00:	2f00           	move.l d0,-(sp)
    4a02:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a06:	2f2f 0056      	move.l 86(sp),-(sp)
    4a0a:	4eba 20ca      	jsr 6ad6 <TestRow>(pc)
    4a0e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a12:	722a           	moveq #42,d1
    4a14:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    4a18:	222f 018a      	move.l 394(sp),d1
    4a1c:	2001           	move.l d1,d0
    4a1e:	d080           	add.l d0,d0
    4a20:	d081           	add.l d1,d0
    4a22:	2200           	move.l d0,d1
    4a24:	e789           	lsl.l #3,d1
    4a26:	2041           	movea.l d1,a0
    4a28:	91c0           	suba.l d0,a0
    4a2a:	41e8 0024      	lea 36(a0),a0
    4a2e:	7000           	moveq #0,d0
    4a30:	302f 01c6      	move.w 454(sp),d0
    4a34:	2f08           	move.l a0,-(sp)
    4a36:	2f00           	move.l d0,-(sp)
    4a38:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a3c:	2f2f 0056      	move.l 86(sp),-(sp)
    4a40:	4eba 2094      	jsr 6ad6 <TestRow>(pc)
    4a44:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a48:	702a           	moveq #42,d0
    4a4a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4a4e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    4a52:	222f 018a      	move.l 394(sp),d1
    4a56:	2001           	move.l d1,d0
    4a58:	d080           	add.l d0,d0
    4a5a:	d081           	add.l d1,d0
    4a5c:	2200           	move.l d0,d1
    4a5e:	e789           	lsl.l #3,d1
    4a60:	2041           	movea.l d1,a0
    4a62:	91c0           	suba.l d0,a0
    4a64:	41e8 0025      	lea 37(a0),a0
    4a68:	7000           	moveq #0,d0
    4a6a:	302f 01c6      	move.w 454(sp),d0
    4a6e:	2f08           	move.l a0,-(sp)
    4a70:	2f00           	move.l d0,-(sp)
    4a72:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a76:	2f2f 0056      	move.l 86(sp),-(sp)
    4a7a:	4eba 205a      	jsr 6ad6 <TestRow>(pc)
    4a7e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a82:	722a           	moveq #42,d1
    4a84:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    4a88:	222f 018a      	move.l 394(sp),d1
    4a8c:	2001           	move.l d1,d0
    4a8e:	d080           	add.l d0,d0
    4a90:	d081           	add.l d1,d0
    4a92:	2200           	move.l d0,d1
    4a94:	e789           	lsl.l #3,d1
    4a96:	2041           	movea.l d1,a0
    4a98:	91c0           	suba.l d0,a0
    4a9a:	41e8 0026      	lea 38(a0),a0
    4a9e:	7000           	moveq #0,d0
    4aa0:	302f 01c6      	move.w 454(sp),d0
    4aa4:	2f08           	move.l a0,-(sp)
    4aa6:	2f00           	move.l d0,-(sp)
    4aa8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4aac:	2f2f 0056      	move.l 86(sp),-(sp)
    4ab0:	4eba 2024      	jsr 6ad6 <TestRow>(pc)
    4ab4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ab8:	702a           	moveq #42,d0
    4aba:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4abe:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    4ac2:	222f 018a      	move.l 394(sp),d1
    4ac6:	2001           	move.l d1,d0
    4ac8:	d080           	add.l d0,d0
    4aca:	d081           	add.l d1,d0
    4acc:	2200           	move.l d0,d1
    4ace:	e789           	lsl.l #3,d1
    4ad0:	2041           	movea.l d1,a0
    4ad2:	91c0           	suba.l d0,a0
    4ad4:	41e8 0027      	lea 39(a0),a0
    4ad8:	7000           	moveq #0,d0
    4ada:	302f 01c6      	move.w 454(sp),d0
    4ade:	2f08           	move.l a0,-(sp)
    4ae0:	2f00           	move.l d0,-(sp)
    4ae2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ae6:	2f2f 0056      	move.l 86(sp),-(sp)
    4aea:	4eba 1fea      	jsr 6ad6 <TestRow>(pc)
    4aee:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4af2:	722a           	moveq #42,d1
    4af4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    4af8:	222f 018a      	move.l 394(sp),d1
    4afc:	2001           	move.l d1,d0
    4afe:	d080           	add.l d0,d0
    4b00:	d081           	add.l d1,d0
    4b02:	2200           	move.l d0,d1
    4b04:	e789           	lsl.l #3,d1
    4b06:	2041           	movea.l d1,a0
    4b08:	91c0           	suba.l d0,a0
    4b0a:	41e8 0028      	lea 40(a0),a0
    4b0e:	7000           	moveq #0,d0
    4b10:	302f 01c6      	move.w 454(sp),d0
    4b14:	2f08           	move.l a0,-(sp)
    4b16:	2f00           	move.l d0,-(sp)
    4b18:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b1c:	2f2f 0056      	move.l 86(sp),-(sp)
    4b20:	4eba 1fb4      	jsr 6ad6 <TestRow>(pc)
    4b24:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b28:	702a           	moveq #42,d0
    4b2a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b2e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    4b32:	222f 018a      	move.l 394(sp),d1
    4b36:	2001           	move.l d1,d0
    4b38:	d080           	add.l d0,d0
    4b3a:	d081           	add.l d1,d0
    4b3c:	2200           	move.l d0,d1
    4b3e:	e789           	lsl.l #3,d1
    4b40:	2041           	movea.l d1,a0
    4b42:	91c0           	suba.l d0,a0
    4b44:	41e8 0029      	lea 41(a0),a0
    4b48:	7000           	moveq #0,d0
    4b4a:	302f 01c6      	move.w 454(sp),d0
    4b4e:	2f08           	move.l a0,-(sp)
    4b50:	2f00           	move.l d0,-(sp)
    4b52:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b56:	2f2f 0056      	move.l 86(sp),-(sp)
    4b5a:	4eba 1f7a      	jsr 6ad6 <TestRow>(pc)
    4b5e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b62:	722a           	moveq #42,d1
    4b64:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    4b68:	222f 018a      	move.l 394(sp),d1
    4b6c:	2001           	move.l d1,d0
    4b6e:	d080           	add.l d0,d0
    4b70:	d081           	add.l d1,d0
    4b72:	2200           	move.l d0,d1
    4b74:	e789           	lsl.l #3,d1
    4b76:	2041           	movea.l d1,a0
    4b78:	91c0           	suba.l d0,a0
    4b7a:	41e8 002a      	lea 42(a0),a0
    4b7e:	7000           	moveq #0,d0
    4b80:	302f 01c6      	move.w 454(sp),d0
    4b84:	2f08           	move.l a0,-(sp)
    4b86:	2f00           	move.l d0,-(sp)
    4b88:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b8c:	2f2f 0056      	move.l 86(sp),-(sp)
    4b90:	4eba 1f44      	jsr 6ad6 <TestRow>(pc)
    4b94:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b98:	702a           	moveq #42,d0
    4b9a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b9e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    4ba2:	222f 018a      	move.l 394(sp),d1
    4ba6:	2001           	move.l d1,d0
    4ba8:	d080           	add.l d0,d0
    4baa:	d081           	add.l d1,d0
    4bac:	2200           	move.l d0,d1
    4bae:	e789           	lsl.l #3,d1
    4bb0:	2041           	movea.l d1,a0
    4bb2:	91c0           	suba.l d0,a0
    4bb4:	41e8 002b      	lea 43(a0),a0
    4bb8:	7000           	moveq #0,d0
    4bba:	302f 01c6      	move.w 454(sp),d0
    4bbe:	2f08           	move.l a0,-(sp)
    4bc0:	2f00           	move.l d0,-(sp)
    4bc2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bc6:	2f2f 0056      	move.l 86(sp),-(sp)
    4bca:	4eba 1f0a      	jsr 6ad6 <TestRow>(pc)
    4bce:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4bd2:	722a           	moveq #42,d1
    4bd4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    4bd8:	222f 018a      	move.l 394(sp),d1
    4bdc:	2001           	move.l d1,d0
    4bde:	d080           	add.l d0,d0
    4be0:	d081           	add.l d1,d0
    4be2:	2200           	move.l d0,d1
    4be4:	e789           	lsl.l #3,d1
    4be6:	2041           	movea.l d1,a0
    4be8:	91c0           	suba.l d0,a0
    4bea:	41e8 002c      	lea 44(a0),a0
    4bee:	7000           	moveq #0,d0
    4bf0:	302f 01c6      	move.w 454(sp),d0
    4bf4:	2f08           	move.l a0,-(sp)
    4bf6:	2f00           	move.l d0,-(sp)
    4bf8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bfc:	2f2f 0056      	move.l 86(sp),-(sp)
    4c00:	4eba 1ed4      	jsr 6ad6 <TestRow>(pc)
    4c04:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c08:	702a           	moveq #42,d0
    4c0a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c0e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<10;i++) {
    4c12:	52af 018a      	addq.l #1,394(sp)
    4c16:	7209           	moveq #9,d1
    4c18:	b2af 018a      	cmp.l 394(sp),d1
    4c1c:	6c00 fd74      	bge.w 4992 <TestZoom4Picture+0xd1e>
  }

  for(int i2=0;i2<13;i2++) {  
    4c20:	42af 0182      	clr.l 386(sp)
    4c24:	6032           	bra.s 4c58 <TestZoom4Picture+0xfe4>
    TestRow( valsupposed, valactual, mask, i2+253);
    4c26:	222f 0182      	move.l 386(sp),d1
    4c2a:	0681 0000 00fd 	addi.l #253,d1
    4c30:	7000           	moveq #0,d0
    4c32:	302f 01c6      	move.w 454(sp),d0
    4c36:	2f01           	move.l d1,-(sp)
    4c38:	2f00           	move.l d0,-(sp)
    4c3a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c3e:	2f2f 0056      	move.l 86(sp),-(sp)
    4c42:	4eba 1e92      	jsr 6ad6 <TestRow>(pc)
    4c46:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c4a:	702a           	moveq #42,d0
    4c4c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c50:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4c54:	52af 0182      	addq.l #1,386(sp)
    4c58:	720c           	moveq #12,d1
    4c5a:	b2af 0182      	cmp.l 386(sp),d1
    4c5e:	6cc6           	bge.s 4c26 <TestZoom4Picture+0xfb2>
  }

  TestRow( valsupposed, valactual, mask, 266);
    4c60:	7000           	moveq #0,d0
    4c62:	302f 01c6      	move.w 454(sp),d0
    4c66:	4878 010a      	pea 10a <FreeDisplay+0x2a>
    4c6a:	2f00           	move.l d0,-(sp)
    4c6c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c70:	2f2f 0056      	move.l 86(sp),-(sp)
    4c74:	4eba 1e60      	jsr 6ad6 <TestRow>(pc)
    4c78:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4c7c:	702a           	moveq #42,d0
    4c7e:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 267);
    4c82:	7000           	moveq #0,d0
    4c84:	302f 01c6      	move.w 454(sp),d0
    4c88:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    4c8c:	2f00           	move.l d0,-(sp)
    4c8e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c92:	2f2f 0056      	move.l 86(sp),-(sp)
    4c96:	4eba 1e3e      	jsr 6ad6 <TestRow>(pc)
    4c9a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4c9e:	722a           	moveq #42,d1
    4ca0:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4ca4:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 268);
    4ca8:	7000           	moveq #0,d0
    4caa:	302f 01c6      	move.w 454(sp),d0
    4cae:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    4cb2:	2f00           	move.l d0,-(sp)
    4cb4:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cb8:	2f2f 0056      	move.l 86(sp),-(sp)
    4cbc:	4eba 1e18      	jsr 6ad6 <TestRow>(pc)
    4cc0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4cc4:	702a           	moveq #42,d0
    4cc6:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 269);
    4cca:	7000           	moveq #0,d0
    4ccc:	302f 01c6      	move.w 454(sp),d0
    4cd0:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4cd4:	2f00           	move.l d0,-(sp)
    4cd6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cda:	2f2f 0056      	move.l 86(sp),-(sp)
    4cde:	4eba 1df6      	jsr 6ad6 <TestRow>(pc)
    4ce2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4ce6:	722a           	moveq #42,d1
    4ce8:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4cec:	466f 01c6      	not.w 454(sp)

  tmp = source;
    4cf0:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4cf6:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4cfc:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    4d02:	4878 0001      	pea 1 <_start+0x1>
    4d06:	4878 0005      	pea 5 <_start+0x5>
    4d0a:	2f2f 0056      	move.l 86(sp),-(sp)
    4d0e:	2f2f 006a      	move.l 106(sp),-(sp)
    4d12:	4eba cd4e      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    4d16:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4d1a:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    4d20:	2c40           	movea.l d0,a6
    4d22:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4d26:	202f 004e      	move.l 78(sp),d0
    4d2a:	5880           	addq.l #4,d0
    4d2c:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom6;
    4d30:	2f7c 0000 bb30 	move.l #47920,74(sp)
    4d36:	004a 
  mask = 0x0000;
    4d38:	426f 01c6      	clr.w 454(sp)
 
  for(int i2=0;i2<7;i2++) {  
    4d3c:	42af 017e      	clr.l 382(sp)
    4d40:	602a           	bra.s 4d6c <TestZoom4Picture+0x10f8>
    TestRow( valsupposed, valactual, mask, i2);
    4d42:	7000           	moveq #0,d0
    4d44:	302f 01c6      	move.w 454(sp),d0
    4d48:	2f2f 017e      	move.l 382(sp),-(sp)
    4d4c:	2f00           	move.l d0,-(sp)
    4d4e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d52:	2f2f 0056      	move.l 86(sp),-(sp)
    4d56:	4eba 1d7e      	jsr 6ad6 <TestRow>(pc)
    4d5a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d5e:	722a           	moveq #42,d1
    4d60:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4d64:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    4d68:	52af 017e      	addq.l #1,382(sp)
    4d6c:	7006           	moveq #6,d0
    4d6e:	b0af 017e      	cmp.l 382(sp),d0
    4d72:	6cce           	bge.s 4d42 <TestZoom4Picture+0x10ce>
  }

  for(int i=0;i<6;i++) {
    4d74:	42af 017a      	clr.l 378(sp)
    4d78:	605c           	bra.s 4dd6 <TestZoom4Picture+0x1162>
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    4d7a:	202f 017a      	move.l 378(sp),d0
    4d7e:	d080           	add.l d0,d0
    4d80:	2200           	move.l d0,d1
    4d82:	5e81           	addq.l #7,d1
    4d84:	7000           	moveq #0,d0
    4d86:	302f 01c6      	move.w 454(sp),d0
    4d8a:	2f01           	move.l d1,-(sp)
    4d8c:	2f00           	move.l d0,-(sp)
    4d8e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d92:	2f2f 0056      	move.l 86(sp),-(sp)
    4d96:	4eba 1d3e      	jsr 6ad6 <TestRow>(pc)
    4d9a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d9e:	722a           	moveq #42,d1
    4da0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    4da4:	202f 017a      	move.l 378(sp),d0
    4da8:	5880           	addq.l #4,d0
    4daa:	d080           	add.l d0,d0
    4dac:	2200           	move.l d0,d1
    4dae:	7000           	moveq #0,d0
    4db0:	302f 01c6      	move.w 454(sp),d0
    4db4:	2f01           	move.l d1,-(sp)
    4db6:	2f00           	move.l d0,-(sp)
    4db8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4dbc:	2f2f 0056      	move.l 86(sp),-(sp)
    4dc0:	4eba 1d14      	jsr 6ad6 <TestRow>(pc)
    4dc4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4dc8:	702a           	moveq #42,d0
    4dca:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4dce:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<6;i++) {
    4dd2:	52af 017a      	addq.l #1,378(sp)
    4dd6:	7205           	moveq #5,d1
    4dd8:	b2af 017a      	cmp.l 378(sp),d1
    4ddc:	6c9c           	bge.s 4d7a <TestZoom4Picture+0x1106>
  }

  for(int i=0;i<10;i++) {
    4dde:	42af 0176      	clr.l 374(sp)
    4de2:	6000 00ce      	bra.w 4eb2 <TestZoom4Picture+0x123e>
    for(int i2=0;i2<12;i2++) {  
    4de6:	42af 0172      	clr.l 370(sp)
    4dea:	6040           	bra.s 4e2c <TestZoom4Picture+0x11b8>
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    4dec:	307c 0013      	movea.w #19,a0
    4df0:	d1ef 0172      	adda.l 370(sp),a0
    4df4:	222f 0176      	move.l 374(sp),d1
    4df8:	2001           	move.l d1,d0
    4dfa:	d080           	add.l d0,d0
    4dfc:	d081           	add.l d1,d0
    4dfe:	e788           	lsl.l #3,d0
    4e00:	2208           	move.l a0,d1
    4e02:	d280           	add.l d0,d1
    4e04:	7000           	moveq #0,d0
    4e06:	302f 01c6      	move.w 454(sp),d0
    4e0a:	2f01           	move.l d1,-(sp)
    4e0c:	2f00           	move.l d0,-(sp)
    4e0e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e12:	2f2f 0056      	move.l 86(sp),-(sp)
    4e16:	4eba 1cbe      	jsr 6ad6 <TestRow>(pc)
    4e1a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4e1e:	702a           	moveq #42,d0
    4e20:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4e24:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {  
    4e28:	52af 0172      	addq.l #1,370(sp)
    4e2c:	720b           	moveq #11,d1
    4e2e:	b2af 0172      	cmp.l 370(sp),d1
    4e32:	6cb8           	bge.s 4dec <TestZoom4Picture+0x1178>
    }
    for(int i=0;i<6;i++) {
    4e34:	42af 016e      	clr.l 366(sp)
    4e38:	606c           	bra.s 4ea6 <TestZoom4Picture+0x1232>
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    4e3a:	222f 016e      	move.l 366(sp),d1
    4e3e:	2001           	move.l d1,d0
    4e40:	d080           	add.l d0,d0
    4e42:	d081           	add.l d1,d0
    4e44:	e788           	lsl.l #3,d0
    4e46:	2040           	movea.l d0,a0
    4e48:	41e8 001f      	lea 31(a0),a0
    4e4c:	7000           	moveq #0,d0
    4e4e:	302f 01c6      	move.w 454(sp),d0
    4e52:	2f08           	move.l a0,-(sp)
    4e54:	2f00           	move.l d0,-(sp)
    4e56:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e5a:	2f2f 0056      	move.l 86(sp),-(sp)
    4e5e:	4eba 1c76      	jsr 6ad6 <TestRow>(pc)
    4e62:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4e66:	702a           	moveq #42,d0
    4e68:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    4e6c:	222f 016e      	move.l 366(sp),d1
    4e70:	2001           	move.l d1,d0
    4e72:	d080           	add.l d0,d0
    4e74:	d081           	add.l d1,d0
    4e76:	e788           	lsl.l #3,d0
    4e78:	2040           	movea.l d0,a0
    4e7a:	41e8 0020      	lea 32(a0),a0
    4e7e:	7000           	moveq #0,d0
    4e80:	302f 01c6      	move.w 454(sp),d0
    4e84:	2f08           	move.l a0,-(sp)
    4e86:	2f00           	move.l d0,-(sp)
    4e88:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e8c:	2f2f 0056      	move.l 86(sp),-(sp)
    4e90:	4eba 1c44      	jsr 6ad6 <TestRow>(pc)
    4e94:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4e98:	722a           	moveq #42,d1
    4e9a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4e9e:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<6;i++) {
    4ea2:	52af 016e      	addq.l #1,366(sp)
    4ea6:	7005           	moveq #5,d0
    4ea8:	b0af 016e      	cmp.l 366(sp),d0
    4eac:	6c8c           	bge.s 4e3a <TestZoom4Picture+0x11c6>
  for(int i=0;i<10;i++) {
    4eae:	52af 0176      	addq.l #1,374(sp)
    4eb2:	7209           	moveq #9,d1
    4eb4:	b2af 0176      	cmp.l 374(sp),d1
    4eb8:	6c00 ff2c      	bge.w 4de6 <TestZoom4Picture+0x1172>
    }
  }

  for(int i2=0;i2<11;i2++) {  
    4ebc:	42af 016a      	clr.l 362(sp)
    4ec0:	6032           	bra.s 4ef4 <TestZoom4Picture+0x1280>
    TestRow( valsupposed, valactual, mask, 258+i2);
    4ec2:	222f 016a      	move.l 362(sp),d1
    4ec6:	0681 0000 0102 	addi.l #258,d1
    4ecc:	7000           	moveq #0,d0
    4ece:	302f 01c6      	move.w 454(sp),d0
    4ed2:	2f01           	move.l d1,-(sp)
    4ed4:	2f00           	move.l d0,-(sp)
    4ed6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4eda:	2f2f 0056      	move.l 86(sp),-(sp)
    4ede:	4eba 1bf6      	jsr 6ad6 <TestRow>(pc)
    4ee2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ee6:	702a           	moveq #42,d0
    4ee8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4eec:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {  
    4ef0:	52af 016a      	addq.l #1,362(sp)
    4ef4:	720a           	moveq #10,d1
    4ef6:	b2af 016a      	cmp.l 362(sp),d1
    4efa:	6cc6           	bge.s 4ec2 <TestZoom4Picture+0x124e>
  }

  tmp = source;
    4efc:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4f02:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4f08:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    4f0e:	4878 0001      	pea 1 <_start+0x1>
    4f12:	4878 0006      	pea 6 <_start+0x6>
    4f16:	2f2f 0056      	move.l 86(sp),-(sp)
    4f1a:	2f2f 006a      	move.l 106(sp),-(sp)
    4f1e:	4eba cb42      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    4f22:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4f26:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    4f2c:	2c40           	movea.l d0,a6
    4f2e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4f32:	202f 004e      	move.l 78(sp),d0
    4f36:	5880           	addq.l #4,d0
    4f38:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom7;
    4f3c:	2f7c 0000 bb5c 	move.l #47964,74(sp)
    4f42:	004a 
  mask = 0x0000;
    4f44:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    4f48:	7000           	moveq #0,d0
    4f4a:	302f 01c6      	move.w 454(sp),d0
    4f4e:	42a7           	clr.l -(sp)
    4f50:	2f00           	move.l d0,-(sp)
    4f52:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f56:	2f2f 0056      	move.l 86(sp),-(sp)
    4f5a:	4eba 1b7a      	jsr 6ad6 <TestRow>(pc)
    4f5e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4f62:	722a           	moveq #42,d1
    4f64:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4f68:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    4f6c:	42af 0166      	clr.l 358(sp)
    4f70:	605c           	bra.s 4fce <TestZoom4Picture+0x135a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    4f72:	202f 0166      	move.l 358(sp),d0
    4f76:	d080           	add.l d0,d0
    4f78:	2200           	move.l d0,d1
    4f7a:	5281           	addq.l #1,d1
    4f7c:	7000           	moveq #0,d0
    4f7e:	302f 01c6      	move.w 454(sp),d0
    4f82:	2f01           	move.l d1,-(sp)
    4f84:	2f00           	move.l d0,-(sp)
    4f86:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f8a:	2f2f 0056      	move.l 86(sp),-(sp)
    4f8e:	4eba 1b46      	jsr 6ad6 <TestRow>(pc)
    4f92:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4f96:	702a           	moveq #42,d0
    4f98:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    4f9c:	202f 0166      	move.l 358(sp),d0
    4fa0:	5280           	addq.l #1,d0
    4fa2:	d080           	add.l d0,d0
    4fa4:	2200           	move.l d0,d1
    4fa6:	7000           	moveq #0,d0
    4fa8:	302f 01c6      	move.w 454(sp),d0
    4fac:	2f01           	move.l d1,-(sp)
    4fae:	2f00           	move.l d0,-(sp)
    4fb0:	2f2f 01d0      	move.l 464(sp),-(sp)
    4fb4:	2f2f 0056      	move.l 86(sp),-(sp)
    4fb8:	4eba 1b1c      	jsr 6ad6 <TestRow>(pc)
    4fbc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4fc0:	722a           	moveq #42,d1
    4fc2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4fc6:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    4fca:	52af 0166      	addq.l #1,358(sp)
    4fce:	7006           	moveq #6,d0
    4fd0:	b0af 0166      	cmp.l 358(sp),d0
    4fd4:	6c9c           	bge.s 4f72 <TestZoom4Picture+0x12fe>
  }

  for(int i=0;i<10;i++) {
    4fd6:	42af 0162      	clr.l 354(sp)
    4fda:	6000 00d4      	bra.w 50b0 <TestZoom4Picture+0x143c>
    for(int i2=0;i2<11;i2++) {  
    4fde:	42af 015e      	clr.l 350(sp)
    4fe2:	6042           	bra.s 5026 <TestZoom4Picture+0x13b2>
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    4fe4:	307c 000f      	movea.w #15,a0
    4fe8:	d1ef 015e      	adda.l 350(sp),a0
    4fec:	222f 0162      	move.l 354(sp),d1
    4ff0:	2001           	move.l d1,d0
    4ff2:	d080           	add.l d0,d0
    4ff4:	d081           	add.l d1,d0
    4ff6:	e788           	lsl.l #3,d0
    4ff8:	d081           	add.l d1,d0
    4ffa:	2208           	move.l a0,d1
    4ffc:	d280           	add.l d0,d1
    4ffe:	7000           	moveq #0,d0
    5000:	302f 01c6      	move.w 454(sp),d0
    5004:	2f01           	move.l d1,-(sp)
    5006:	2f00           	move.l d0,-(sp)
    5008:	2f2f 01d0      	move.l 464(sp),-(sp)
    500c:	2f2f 0056      	move.l 86(sp),-(sp)
    5010:	4eba 1ac4      	jsr 6ad6 <TestRow>(pc)
    5014:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5018:	722a           	moveq #42,d1
    501a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    501e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {  
    5022:	52af 015e      	addq.l #1,350(sp)
    5026:	700a           	moveq #10,d0
    5028:	b0af 015e      	cmp.l 350(sp),d0
    502c:	6cb6           	bge.s 4fe4 <TestZoom4Picture+0x1370>
    }
    for(int i=0;i<7;i++) {
    502e:	42af 015a      	clr.l 346(sp)
    5032:	6070           	bra.s 50a4 <TestZoom4Picture+0x1430>
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    5034:	222f 015a      	move.l 346(sp),d1
    5038:	2001           	move.l d1,d0
    503a:	d080           	add.l d0,d0
    503c:	d081           	add.l d1,d0
    503e:	e788           	lsl.l #3,d0
    5040:	2040           	movea.l d0,a0
    5042:	d1c1           	adda.l d1,a0
    5044:	41e8 001a      	lea 26(a0),a0
    5048:	7000           	moveq #0,d0
    504a:	302f 01c6      	move.w 454(sp),d0
    504e:	2f08           	move.l a0,-(sp)
    5050:	2f00           	move.l d0,-(sp)
    5052:	2f2f 01d0      	move.l 464(sp),-(sp)
    5056:	2f2f 0056      	move.l 86(sp),-(sp)
    505a:	4eba 1a7a      	jsr 6ad6 <TestRow>(pc)
    505e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5062:	722a           	moveq #42,d1
    5064:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    5068:	222f 015a      	move.l 346(sp),d1
    506c:	2001           	move.l d1,d0
    506e:	d080           	add.l d0,d0
    5070:	d081           	add.l d1,d0
    5072:	e788           	lsl.l #3,d0
    5074:	2040           	movea.l d0,a0
    5076:	d1c1           	adda.l d1,a0
    5078:	41e8 001a      	lea 26(a0),a0
    507c:	7000           	moveq #0,d0
    507e:	302f 01c6      	move.w 454(sp),d0
    5082:	2f08           	move.l a0,-(sp)
    5084:	2f00           	move.l d0,-(sp)
    5086:	2f2f 01d0      	move.l 464(sp),-(sp)
    508a:	2f2f 0056      	move.l 86(sp),-(sp)
    508e:	4eba 1a46      	jsr 6ad6 <TestRow>(pc)
    5092:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5096:	702a           	moveq #42,d0
    5098:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    509c:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<7;i++) {
    50a0:	52af 015a      	addq.l #1,346(sp)
    50a4:	7206           	moveq #6,d1
    50a6:	b2af 015a      	cmp.l 346(sp),d1
    50aa:	6c88           	bge.s 5034 <TestZoom4Picture+0x13c0>
  for(int i=0;i<10;i++) {
    50ac:	52af 0162      	addq.l #1,354(sp)
    50b0:	7009           	moveq #9,d0
    50b2:	b0af 0162      	cmp.l 354(sp),d0
    50b6:	6c00 ff26      	bge.w 4fde <TestZoom4Picture+0x136a>
    }
  }

  for(int i2=0;i2<5;i2++) {  
    50ba:	42af 0156      	clr.l 342(sp)
    50be:	6032           	bra.s 50f2 <TestZoom4Picture+0x147e>
    TestRow( valsupposed, valactual, mask, 256+i2);
    50c0:	222f 0156      	move.l 342(sp),d1
    50c4:	0681 0000 0100 	addi.l #256,d1
    50ca:	7000           	moveq #0,d0
    50cc:	302f 01c6      	move.w 454(sp),d0
    50d0:	2f01           	move.l d1,-(sp)
    50d2:	2f00           	move.l d0,-(sp)
    50d4:	2f2f 01d0      	move.l 464(sp),-(sp)
    50d8:	2f2f 0056      	move.l 86(sp),-(sp)
    50dc:	4eba 19f8      	jsr 6ad6 <TestRow>(pc)
    50e0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    50e4:	722a           	moveq #42,d1
    50e6:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    50ea:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    50ee:	52af 0156      	addq.l #1,342(sp)
    50f2:	7004           	moveq #4,d0
    50f4:	b0af 0156      	cmp.l 342(sp),d0
    50f8:	6cc6           	bge.s 50c0 <TestZoom4Picture+0x144c>
  }

  tmp = source;
    50fa:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5100:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5106:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    510c:	4878 0001      	pea 1 <_start+0x1>
    5110:	4878 0007      	pea 7 <_start+0x7>
    5114:	2f2f 0056      	move.l 86(sp),-(sp)
    5118:	2f2f 006a      	move.l 106(sp),-(sp)
    511c:	4eba c944      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    5120:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5124:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    512a:	2c40           	movea.l d0,a6
    512c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5130:	222f 004e      	move.l 78(sp),d1
    5134:	5881           	addq.l #4,d1
    5136:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom8;
    513a:	2f7c 0000 bb88 	move.l #48008,74(sp)
    5140:	004a 
  mask = 0xffff;
    5142:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5148:	7000           	moveq #0,d0
    514a:	302f 01c6      	move.w 454(sp),d0
    514e:	42a7           	clr.l -(sp)
    5150:	2f00           	move.l d0,-(sp)
    5152:	2f2f 01d0      	move.l 464(sp),-(sp)
    5156:	2f2f 0056      	move.l 86(sp),-(sp)
    515a:	4eba 197a      	jsr 6ad6 <TestRow>(pc)
    515e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5162:	702a           	moveq #42,d0
    5164:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5168:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    516c:	42af 0152      	clr.l 338(sp)
    5170:	605c           	bra.s 51ce <TestZoom4Picture+0x155a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    5172:	202f 0152      	move.l 338(sp),d0
    5176:	d080           	add.l d0,d0
    5178:	2200           	move.l d0,d1
    517a:	5281           	addq.l #1,d1
    517c:	7000           	moveq #0,d0
    517e:	302f 01c6      	move.w 454(sp),d0
    5182:	2f01           	move.l d1,-(sp)
    5184:	2f00           	move.l d0,-(sp)
    5186:	2f2f 01d0      	move.l 464(sp),-(sp)
    518a:	2f2f 0056      	move.l 86(sp),-(sp)
    518e:	4eba 1946      	jsr 6ad6 <TestRow>(pc)
    5192:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5196:	722a           	moveq #42,d1
    5198:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    519c:	202f 0152      	move.l 338(sp),d0
    51a0:	5280           	addq.l #1,d0
    51a2:	d080           	add.l d0,d0
    51a4:	2200           	move.l d0,d1
    51a6:	7000           	moveq #0,d0
    51a8:	302f 01c6      	move.w 454(sp),d0
    51ac:	2f01           	move.l d1,-(sp)
    51ae:	2f00           	move.l d0,-(sp)
    51b0:	2f2f 01d0      	move.l 464(sp),-(sp)
    51b4:	2f2f 0056      	move.l 86(sp),-(sp)
    51b8:	4eba 191c      	jsr 6ad6 <TestRow>(pc)
    51bc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    51c0:	702a           	moveq #42,d0
    51c2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    51c6:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    51ca:	52af 0152      	addq.l #1,338(sp)
    51ce:	7204           	moveq #4,d1
    51d0:	b2af 0152      	cmp.l 338(sp),d1
    51d4:	6c9c           	bge.s 5172 <TestZoom4Picture+0x14fe>
  }

  for(int i=0;i<9;i++) {
    51d6:	42af 014e      	clr.l 334(sp)
    51da:	6000 00f0      	bra.w 52cc <TestZoom4Picture+0x1658>
    for(int i2=0;i2<10;i2++) {  
    51de:	42af 014a      	clr.l 330(sp)
    51e2:	6046           	bra.s 522a <TestZoom4Picture+0x15b6>
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    51e4:	307c 000b      	movea.w #11,a0
    51e8:	d1ef 014a      	adda.l 330(sp),a0
    51ec:	222f 014e      	move.l 334(sp),d1
    51f0:	2001           	move.l d1,d0
    51f2:	d080           	add.l d0,d0
    51f4:	d081           	add.l d1,d0
    51f6:	d080           	add.l d0,d0
    51f8:	d080           	add.l d0,d0
    51fa:	d081           	add.l d1,d0
    51fc:	d080           	add.l d0,d0
    51fe:	2208           	move.l a0,d1
    5200:	d280           	add.l d0,d1
    5202:	7000           	moveq #0,d0
    5204:	302f 01c6      	move.w 454(sp),d0
    5208:	2f01           	move.l d1,-(sp)
    520a:	2f00           	move.l d0,-(sp)
    520c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5210:	2f2f 0056      	move.l 86(sp),-(sp)
    5214:	4eba 18c0      	jsr 6ad6 <TestRow>(pc)
    5218:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    521c:	702a           	moveq #42,d0
    521e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5222:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {  
    5226:	52af 014a      	addq.l #1,330(sp)
    522a:	7209           	moveq #9,d1
    522c:	b2af 014a      	cmp.l 330(sp),d1
    5230:	6cb2           	bge.s 51e4 <TestZoom4Picture+0x1570>
    }
    for(int i2=0;i2<8;i2++) {
    5232:	42af 0146      	clr.l 326(sp)
    5236:	6000 0086      	bra.w 52be <TestZoom4Picture+0x164a>
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    523a:	222f 014e      	move.l 334(sp),d1
    523e:	2001           	move.l d1,d0
    5240:	d080           	add.l d0,d0
    5242:	d081           	add.l d1,d0
    5244:	d080           	add.l d0,d0
    5246:	d080           	add.l d0,d0
    5248:	d081           	add.l d1,d0
    524a:	d080           	add.l d0,d0
    524c:	2040           	movea.l d0,a0
    524e:	41e8 0015      	lea 21(a0),a0
    5252:	2208           	move.l a0,d1
    5254:	d2af 0146      	add.l 326(sp),d1
    5258:	7000           	moveq #0,d0
    525a:	302f 01c6      	move.w 454(sp),d0
    525e:	2f01           	move.l d1,-(sp)
    5260:	2f00           	move.l d0,-(sp)
    5262:	2f2f 01d0      	move.l 464(sp),-(sp)
    5266:	2f2f 0056      	move.l 86(sp),-(sp)
    526a:	4eba 186a      	jsr 6ad6 <TestRow>(pc)
    526e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5272:	702a           	moveq #42,d0
    5274:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    5278:	222f 014e      	move.l 334(sp),d1
    527c:	2001           	move.l d1,d0
    527e:	d080           	add.l d0,d0
    5280:	d081           	add.l d1,d0
    5282:	d080           	add.l d0,d0
    5284:	d080           	add.l d0,d0
    5286:	d081           	add.l d1,d0
    5288:	d080           	add.l d0,d0
    528a:	2040           	movea.l d0,a0
    528c:	41e8 0015      	lea 21(a0),a0
    5290:	2208           	move.l a0,d1
    5292:	d2af 0146      	add.l 326(sp),d1
    5296:	7000           	moveq #0,d0
    5298:	302f 01c6      	move.w 454(sp),d0
    529c:	2f01           	move.l d1,-(sp)
    529e:	2f00           	move.l d0,-(sp)
    52a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    52a4:	2f2f 0056      	move.l 86(sp),-(sp)
    52a8:	4eba 182c      	jsr 6ad6 <TestRow>(pc)
    52ac:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    52b0:	722a           	moveq #42,d1
    52b2:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    52b6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {
    52ba:	52af 0146      	addq.l #1,326(sp)
    52be:	7007           	moveq #7,d0
    52c0:	b0af 0146      	cmp.l 326(sp),d0
    52c4:	6c00 ff74      	bge.w 523a <TestZoom4Picture+0x15c6>
  for(int i=0;i<9;i++) {
    52c8:	52af 014e      	addq.l #1,334(sp)
    52cc:	7208           	moveq #8,d1
    52ce:	b2af 014e      	cmp.l 334(sp),d1
    52d2:	6c00 ff0a      	bge.w 51de <TestZoom4Picture+0x156a>
    }
  }

  for(int i2=0;i2<10;i2++) {  
    52d6:	42af 0142      	clr.l 322(sp)
    52da:	6032           	bra.s 530e <TestZoom4Picture+0x169a>
    TestRow( valsupposed, valactual, mask, 245+i2);
    52dc:	222f 0142      	move.l 322(sp),d1
    52e0:	0681 0000 00f5 	addi.l #245,d1
    52e6:	7000           	moveq #0,d0
    52e8:	302f 01c6      	move.w 454(sp),d0
    52ec:	2f01           	move.l d1,-(sp)
    52ee:	2f00           	move.l d0,-(sp)
    52f0:	2f2f 01d0      	move.l 464(sp),-(sp)
    52f4:	2f2f 0056      	move.l 86(sp),-(sp)
    52f8:	4eba 17dc      	jsr 6ad6 <TestRow>(pc)
    52fc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5300:	702a           	moveq #42,d0
    5302:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5306:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {  
    530a:	52af 0142      	addq.l #1,322(sp)
    530e:	7209           	moveq #9,d1
    5310:	b2af 0142      	cmp.l 322(sp),d1
    5314:	6cc6           	bge.s 52dc <TestZoom4Picture+0x1668>
  }
  for(int i=0;i<7;i++) {
    5316:	42af 013e      	clr.l 318(sp)
    531a:	6064           	bra.s 5380 <TestZoom4Picture+0x170c>
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    531c:	202f 013e      	move.l 318(sp),d0
    5320:	d080           	add.l d0,d0
    5322:	2200           	move.l d0,d1
    5324:	0681 0000 00ff 	addi.l #255,d1
    532a:	7000           	moveq #0,d0
    532c:	302f 01c6      	move.w 454(sp),d0
    5330:	2f01           	move.l d1,-(sp)
    5332:	2f00           	move.l d0,-(sp)
    5334:	2f2f 01d0      	move.l 464(sp),-(sp)
    5338:	2f2f 0056      	move.l 86(sp),-(sp)
    533c:	4eba 1798      	jsr 6ad6 <TestRow>(pc)
    5340:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5344:	702a           	moveq #42,d0
    5346:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    534a:	202f 013e      	move.l 318(sp),d0
    534e:	0680 0000 0080 	addi.l #128,d0
    5354:	d080           	add.l d0,d0
    5356:	2200           	move.l d0,d1
    5358:	7000           	moveq #0,d0
    535a:	302f 01c6      	move.w 454(sp),d0
    535e:	2f01           	move.l d1,-(sp)
    5360:	2f00           	move.l d0,-(sp)
    5362:	2f2f 01d0      	move.l 464(sp),-(sp)
    5366:	2f2f 0056      	move.l 86(sp),-(sp)
    536a:	4eba 176a      	jsr 6ad6 <TestRow>(pc)
    536e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5372:	722a           	moveq #42,d1
    5374:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5378:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    537c:	52af 013e      	addq.l #1,318(sp)
    5380:	7006           	moveq #6,d0
    5382:	b0af 013e      	cmp.l 318(sp),d0
    5386:	6c94           	bge.s 531c <TestZoom4Picture+0x16a8>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5388:	7000           	moveq #0,d0
    538a:	302f 01c6      	move.w 454(sp),d0
    538e:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5392:	2f00           	move.l d0,-(sp)
    5394:	2f2f 01d0      	move.l 464(sp),-(sp)
    5398:	2f2f 0056      	move.l 86(sp),-(sp)
    539c:	4eba 1738      	jsr 6ad6 <TestRow>(pc)
    53a0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    53a4:	722a           	moveq #42,d1
    53a6:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    53aa:	466f 01c6      	not.w 454(sp)
 
  tmp = source;
    53ae:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    53b4:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    53ba:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    53c0:	4878 0001      	pea 1 <_start+0x1>
    53c4:	4878 0008      	pea 8 <_start+0x8>
    53c8:	2f2f 0056      	move.l 86(sp),-(sp)
    53cc:	2f2f 006a      	move.l 106(sp),-(sp)
    53d0:	4eba c690      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    53d4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    53d8:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    53de:	2c40           	movea.l d0,a6
    53e0:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    53e4:	202f 004e      	move.l 78(sp),d0
    53e8:	5880           	addq.l #4,d0
    53ea:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom9;
    53ee:	2f7c 0000 bbb4 	move.l #48052,74(sp)
    53f4:	004a 
  mask = 0x0000;
    53f6:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    53fa:	7000           	moveq #0,d0
    53fc:	302f 01c6      	move.w 454(sp),d0
    5400:	42a7           	clr.l -(sp)
    5402:	2f00           	move.l d0,-(sp)
    5404:	2f2f 01d0      	move.l 464(sp),-(sp)
    5408:	2f2f 0056      	move.l 86(sp),-(sp)
    540c:	4eba 16c8      	jsr 6ad6 <TestRow>(pc)
    5410:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5414:	722a           	moveq #42,d1
    5416:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    541a:	466f 01c6      	not.w 454(sp)
  
  for(int i=0;i<3;i++) {
    541e:	42af 013a      	clr.l 314(sp)
    5422:	605c           	bra.s 5480 <TestZoom4Picture+0x180c>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    5424:	202f 013a      	move.l 314(sp),d0
    5428:	d080           	add.l d0,d0
    542a:	2200           	move.l d0,d1
    542c:	5281           	addq.l #1,d1
    542e:	7000           	moveq #0,d0
    5430:	302f 01c6      	move.w 454(sp),d0
    5434:	2f01           	move.l d1,-(sp)
    5436:	2f00           	move.l d0,-(sp)
    5438:	2f2f 01d0      	move.l 464(sp),-(sp)
    543c:	2f2f 0056      	move.l 86(sp),-(sp)
    5440:	4eba 1694      	jsr 6ad6 <TestRow>(pc)
    5444:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5448:	702a           	moveq #42,d0
    544a:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    544e:	202f 013a      	move.l 314(sp),d0
    5452:	5280           	addq.l #1,d0
    5454:	d080           	add.l d0,d0
    5456:	2200           	move.l d0,d1
    5458:	7000           	moveq #0,d0
    545a:	302f 01c6      	move.w 454(sp),d0
    545e:	2f01           	move.l d1,-(sp)
    5460:	2f00           	move.l d0,-(sp)
    5462:	2f2f 01d0      	move.l 464(sp),-(sp)
    5466:	2f2f 0056      	move.l 86(sp),-(sp)
    546a:	4eba 166a      	jsr 6ad6 <TestRow>(pc)
    546e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5472:	722a           	moveq #42,d1
    5474:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5478:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    547c:	52af 013a      	addq.l #1,314(sp)
    5480:	7002           	moveq #2,d0
    5482:	b0af 013a      	cmp.l 314(sp),d0
    5486:	6c9c           	bge.s 5424 <TestZoom4Picture+0x17b0>
  }

  for(int i=0;i<9;i++) {
    5488:	42af 0136      	clr.l 310(sp)
    548c:	6000 00ea      	bra.w 5578 <TestZoom4Picture+0x1904>
    for(int i2=0;i2<9;i2++) {  
    5490:	42af 0132      	clr.l 306(sp)
    5494:	6044           	bra.s 54da <TestZoom4Picture+0x1866>
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    5496:	307c 000b      	movea.w #11,a0
    549a:	d1ef 0132      	adda.l 306(sp),a0
    549e:	222f 0136      	move.l 310(sp),d1
    54a2:	2001           	move.l d1,d0
    54a4:	d080           	add.l d0,d0
    54a6:	d081           	add.l d1,d0
    54a8:	2200           	move.l d0,d1
    54aa:	e789           	lsl.l #3,d1
    54ac:	d081           	add.l d1,d0
    54ae:	2208           	move.l a0,d1
    54b0:	d280           	add.l d0,d1
    54b2:	7000           	moveq #0,d0
    54b4:	302f 01c6      	move.w 454(sp),d0
    54b8:	2f01           	move.l d1,-(sp)
    54ba:	2f00           	move.l d0,-(sp)
    54bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    54c0:	2f2f 0056      	move.l 86(sp),-(sp)
    54c4:	4eba 1610      	jsr 6ad6 <TestRow>(pc)
    54c8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    54cc:	722a           	moveq #42,d1
    54ce:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    54d2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {  
    54d6:	52af 0132      	addq.l #1,306(sp)
    54da:	7008           	moveq #8,d0
    54dc:	b0af 0132      	cmp.l 306(sp),d0
    54e0:	6cb4           	bge.s 5496 <TestZoom4Picture+0x1822>
    }
    
    for(int i2=0;i2<9;i2++) {
    54e2:	42af 012e      	clr.l 302(sp)
    54e6:	6000 0082      	bra.w 556a <TestZoom4Picture+0x18f6>
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    54ea:	222f 0136      	move.l 310(sp),d1
    54ee:	2001           	move.l d1,d0
    54f0:	d080           	add.l d0,d0
    54f2:	d081           	add.l d1,d0
    54f4:	2200           	move.l d0,d1
    54f6:	e789           	lsl.l #3,d1
    54f8:	2040           	movea.l d0,a0
    54fa:	d1c1           	adda.l d1,a0
    54fc:	41e8 0014      	lea 20(a0),a0
    5500:	2208           	move.l a0,d1
    5502:	d2af 012e      	add.l 302(sp),d1
    5506:	7000           	moveq #0,d0
    5508:	302f 01c6      	move.w 454(sp),d0
    550c:	2f01           	move.l d1,-(sp)
    550e:	2f00           	move.l d0,-(sp)
    5510:	2f2f 01d0      	move.l 464(sp),-(sp)
    5514:	2f2f 0056      	move.l 86(sp),-(sp)
    5518:	4eba 15bc      	jsr 6ad6 <TestRow>(pc)
    551c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5520:	722a           	moveq #42,d1
    5522:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    5526:	222f 0136      	move.l 310(sp),d1
    552a:	2001           	move.l d1,d0
    552c:	d080           	add.l d0,d0
    552e:	d081           	add.l d1,d0
    5530:	2200           	move.l d0,d1
    5532:	e789           	lsl.l #3,d1
    5534:	2040           	movea.l d0,a0
    5536:	d1c1           	adda.l d1,a0
    5538:	41e8 0015      	lea 21(a0),a0
    553c:	2208           	move.l a0,d1
    553e:	d2af 012e      	add.l 302(sp),d1
    5542:	7000           	moveq #0,d0
    5544:	302f 01c6      	move.w 454(sp),d0
    5548:	2f01           	move.l d1,-(sp)
    554a:	2f00           	move.l d0,-(sp)
    554c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5550:	2f2f 0056      	move.l 86(sp),-(sp)
    5554:	4eba 1580      	jsr 6ad6 <TestRow>(pc)
    5558:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    555c:	702a           	moveq #42,d0
    555e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5562:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {
    5566:	52af 012e      	addq.l #1,302(sp)
    556a:	7208           	moveq #8,d1
    556c:	b2af 012e      	cmp.l 302(sp),d1
    5570:	6c00 ff78      	bge.w 54ea <TestZoom4Picture+0x1876>
  for(int i=0;i<9;i++) {
    5574:	52af 0136      	addq.l #1,310(sp)
    5578:	7008           	moveq #8,d0
    557a:	b0af 0136      	cmp.l 310(sp),d0
    557e:	6c00 ff10      	bge.w 5490 <TestZoom4Picture+0x181c>
    }
  }

  for(int i2=0;i2<9;i2++) {  
    5582:	42af 012a      	clr.l 298(sp)
    5586:	6032           	bra.s 55ba <TestZoom4Picture+0x1946>
    TestRow( valsupposed, valactual, mask, 245+i2);
    5588:	222f 012a      	move.l 298(sp),d1
    558c:	0681 0000 00f5 	addi.l #245,d1
    5592:	7000           	moveq #0,d0
    5594:	302f 01c6      	move.w 454(sp),d0
    5598:	2f01           	move.l d1,-(sp)
    559a:	2f00           	move.l d0,-(sp)
    559c:	2f2f 01d0      	move.l 464(sp),-(sp)
    55a0:	2f2f 0056      	move.l 86(sp),-(sp)
    55a4:	4eba 1530      	jsr 6ad6 <TestRow>(pc)
    55a8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    55ac:	722a           	moveq #42,d1
    55ae:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    55b2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {  
    55b6:	52af 012a      	addq.l #1,298(sp)
    55ba:	7008           	moveq #8,d0
    55bc:	b0af 012a      	cmp.l 298(sp),d0
    55c0:	6cc6           	bge.s 5588 <TestZoom4Picture+0x1914>
  }
  for(int i=0;i<5;i++) {
    55c2:	42af 0126      	clr.l 294(sp)
    55c6:	6064           	bra.s 562c <TestZoom4Picture+0x19b8>
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    55c8:	202f 0126      	move.l 294(sp),d0
    55cc:	d080           	add.l d0,d0
    55ce:	2200           	move.l d0,d1
    55d0:	0681 0000 0103 	addi.l #259,d1
    55d6:	7000           	moveq #0,d0
    55d8:	302f 01c6      	move.w 454(sp),d0
    55dc:	2f01           	move.l d1,-(sp)
    55de:	2f00           	move.l d0,-(sp)
    55e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    55e4:	2f2f 0056      	move.l 86(sp),-(sp)
    55e8:	4eba 14ec      	jsr 6ad6 <TestRow>(pc)
    55ec:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    55f0:	722a           	moveq #42,d1
    55f2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    55f6:	202f 0126      	move.l 294(sp),d0
    55fa:	0680 0000 0082 	addi.l #130,d0
    5600:	d080           	add.l d0,d0
    5602:	2200           	move.l d0,d1
    5604:	7000           	moveq #0,d0
    5606:	302f 01c6      	move.w 454(sp),d0
    560a:	2f01           	move.l d1,-(sp)
    560c:	2f00           	move.l d0,-(sp)
    560e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5612:	2f2f 0056      	move.l 86(sp),-(sp)
    5616:	4eba 14be      	jsr 6ad6 <TestRow>(pc)
    561a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    561e:	702a           	moveq #42,d0
    5620:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5624:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5628:	52af 0126      	addq.l #1,294(sp)
    562c:	7204           	moveq #4,d1
    562e:	b2af 0126      	cmp.l 294(sp),d1
    5632:	6c94           	bge.s 55c8 <TestZoom4Picture+0x1954>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5634:	7000           	moveq #0,d0
    5636:	302f 01c6      	move.w 454(sp),d0
    563a:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    563e:	2f00           	move.l d0,-(sp)
    5640:	2f2f 01d0      	move.l 464(sp),-(sp)
    5644:	2f2f 0056      	move.l 86(sp),-(sp)
    5648:	4eba 148c      	jsr 6ad6 <TestRow>(pc)
    564c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5650:	702a           	moveq #42,d0
    5652:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5656:	466f 01c6      	not.w 454(sp)

  tmp = source;
    565a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5660:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5666:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    566c:	4878 0001      	pea 1 <_start+0x1>
    5670:	4878 0009      	pea 9 <_start+0x9>
    5674:	2f2f 0056      	move.l 86(sp),-(sp)
    5678:	2f2f 006a      	move.l 106(sp),-(sp)
    567c:	4eba c3e4      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    5680:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5684:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    568a:	2c40           	movea.l d0,a6
    568c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5690:	222f 004e      	move.l 78(sp),d1
    5694:	5881           	addq.l #4,d1
    5696:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom10;
    569a:	2f7c 0000 bbe0 	move.l #48096,74(sp)
    56a0:	004a 

  mask = 0xffff;
    56a2:	3f7c ffff 01c6 	move.w #-1,454(sp)
  TestRow( valsupposed, valactual, mask, 0);
    56a8:	7000           	moveq #0,d0
    56aa:	302f 01c6      	move.w 454(sp),d0
    56ae:	42a7           	clr.l -(sp)
    56b0:	2f00           	move.l d0,-(sp)
    56b2:	2f2f 01d0      	move.l 464(sp),-(sp)
    56b6:	2f2f 0056      	move.l 86(sp),-(sp)
    56ba:	4eba 141a      	jsr 6ad6 <TestRow>(pc)
    56be:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    56c2:	702a           	moveq #42,d0
    56c4:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    56c8:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 1);   
    56cc:	7000           	moveq #0,d0
    56ce:	302f 01c6      	move.w 454(sp),d0
    56d2:	4878 0001      	pea 1 <_start+0x1>
    56d6:	2f00           	move.l d0,-(sp)
    56d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    56dc:	2f2f 0056      	move.l 86(sp),-(sp)
    56e0:	4eba 13f4      	jsr 6ad6 <TestRow>(pc)
    56e4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    56e8:	722a           	moveq #42,d1
    56ea:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 2);
    56ee:	7000           	moveq #0,d0
    56f0:	302f 01c6      	move.w 454(sp),d0
    56f4:	4878 0002      	pea 2 <_start+0x2>
    56f8:	2f00           	move.l d0,-(sp)
    56fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    56fe:	2f2f 0056      	move.l 86(sp),-(sp)
    5702:	4eba 13d2      	jsr 6ad6 <TestRow>(pc)
    5706:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    570a:	702a           	moveq #42,d0
    570c:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5710:	466f 01c6      	not.w 454(sp)

  for(int i=0;i<9;i++) {
    5714:	42af 0122      	clr.l 290(sp)
    5718:	6000 00e0      	bra.w 57fa <TestZoom4Picture+0x1b86>
    for(int i2=0;i2<8;i2++) {  
    571c:	42af 011e      	clr.l 286(sp)
    5720:	6040           	bra.s 5762 <TestZoom4Picture+0x1aee>
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    5722:	206f 011e      	movea.l 286(sp),a0
    5726:	5688           	addq.l #3,a0
    5728:	222f 0122      	move.l 290(sp),d1
    572c:	2001           	move.l d1,d0
    572e:	e788           	lsl.l #3,d0
    5730:	9081           	sub.l d1,d0
    5732:	d080           	add.l d0,d0
    5734:	d080           	add.l d0,d0
    5736:	2208           	move.l a0,d1
    5738:	d280           	add.l d0,d1
    573a:	7000           	moveq #0,d0
    573c:	302f 01c6      	move.w 454(sp),d0
    5740:	2f01           	move.l d1,-(sp)
    5742:	2f00           	move.l d0,-(sp)
    5744:	2f2f 01d0      	move.l 464(sp),-(sp)
    5748:	2f2f 0056      	move.l 86(sp),-(sp)
    574c:	4eba 1388      	jsr 6ad6 <TestRow>(pc)
    5750:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5754:	722a           	moveq #42,d1
    5756:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    575a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {  
    575e:	52af 011e      	addq.l #1,286(sp)
    5762:	7007           	moveq #7,d0
    5764:	b0af 011e      	cmp.l 286(sp),d0
    5768:	6cb8           	bge.s 5722 <TestZoom4Picture+0x1aae>
    }
    
    for(int i2=0;i2<10;i2++) {
    576a:	42af 011a      	clr.l 282(sp)
    576e:	607c           	bra.s 57ec <TestZoom4Picture+0x1b78>
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    5770:	222f 0122      	move.l 290(sp),d1
    5774:	2001           	move.l d1,d0
    5776:	e788           	lsl.l #3,d0
    5778:	9081           	sub.l d1,d0
    577a:	d080           	add.l d0,d0
    577c:	d080           	add.l d0,d0
    577e:	2040           	movea.l d0,a0
    5780:	41e8 000b      	lea 11(a0),a0
    5784:	2208           	move.l a0,d1
    5786:	d2af 011a      	add.l 282(sp),d1
    578a:	7000           	moveq #0,d0
    578c:	302f 01c6      	move.w 454(sp),d0
    5790:	2f01           	move.l d1,-(sp)
    5792:	2f00           	move.l d0,-(sp)
    5794:	2f2f 01d0      	move.l 464(sp),-(sp)
    5798:	2f2f 0056      	move.l 86(sp),-(sp)
    579c:	4eba 1338      	jsr 6ad6 <TestRow>(pc)
    57a0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    57a4:	722a           	moveq #42,d1
    57a6:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    57aa:	222f 0122      	move.l 290(sp),d1
    57ae:	2001           	move.l d1,d0
    57b0:	e788           	lsl.l #3,d0
    57b2:	9081           	sub.l d1,d0
    57b4:	d080           	add.l d0,d0
    57b6:	d080           	add.l d0,d0
    57b8:	2040           	movea.l d0,a0
    57ba:	41e8 000b      	lea 11(a0),a0
    57be:	2208           	move.l a0,d1
    57c0:	d2af 011a      	add.l 282(sp),d1
    57c4:	7000           	moveq #0,d0
    57c6:	302f 01c6      	move.w 454(sp),d0
    57ca:	2f01           	move.l d1,-(sp)
    57cc:	2f00           	move.l d0,-(sp)
    57ce:	2f2f 01d0      	move.l 464(sp),-(sp)
    57d2:	2f2f 0056      	move.l 86(sp),-(sp)
    57d6:	4eba 12fe      	jsr 6ad6 <TestRow>(pc)
    57da:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    57de:	702a           	moveq #42,d0
    57e0:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    57e4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {
    57e8:	52af 011a      	addq.l #1,282(sp)
    57ec:	7209           	moveq #9,d1
    57ee:	b2af 011a      	cmp.l 282(sp),d1
    57f2:	6c00 ff7c      	bge.w 5770 <TestZoom4Picture+0x1afc>
  for(int i=0;i<9;i++) {
    57f6:	52af 0122      	addq.l #1,290(sp)
    57fa:	7008           	moveq #8,d0
    57fc:	b0af 0122      	cmp.l 290(sp),d0
    5800:	6c00 ff1a      	bge.w 571c <TestZoom4Picture+0x1aa8>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    5804:	42af 0116      	clr.l 278(sp)
    5808:	6032           	bra.s 583c <TestZoom4Picture+0x1bc8>
    TestRow( valsupposed, valactual, mask, 255+i2);
    580a:	222f 0116      	move.l 278(sp),d1
    580e:	0681 0000 00ff 	addi.l #255,d1
    5814:	7000           	moveq #0,d0
    5816:	302f 01c6      	move.w 454(sp),d0
    581a:	2f01           	move.l d1,-(sp)
    581c:	2f00           	move.l d0,-(sp)
    581e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5822:	2f2f 0056      	move.l 86(sp),-(sp)
    5826:	4eba 12ae      	jsr 6ad6 <TestRow>(pc)
    582a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    582e:	722a           	moveq #42,d1
    5830:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5834:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    5838:	52af 0116      	addq.l #1,278(sp)
    583c:	7007           	moveq #7,d0
    583e:	b0af 0116      	cmp.l 278(sp),d0
    5842:	6cc6           	bge.s 580a <TestZoom4Picture+0x1b96>
  }
  for(int i=0;i<3;i++) {
    5844:	42af 0112      	clr.l 274(sp)
    5848:	6064           	bra.s 58ae <TestZoom4Picture+0x1c3a>
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    584a:	202f 0112      	move.l 274(sp),d0
    584e:	d080           	add.l d0,d0
    5850:	2200           	move.l d0,d1
    5852:	0681 0000 0107 	addi.l #263,d1
    5858:	7000           	moveq #0,d0
    585a:	302f 01c6      	move.w 454(sp),d0
    585e:	2f01           	move.l d1,-(sp)
    5860:	2f00           	move.l d0,-(sp)
    5862:	2f2f 01d0      	move.l 464(sp),-(sp)
    5866:	2f2f 0056      	move.l 86(sp),-(sp)
    586a:	4eba 126a      	jsr 6ad6 <TestRow>(pc)
    586e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5872:	722a           	moveq #42,d1
    5874:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    5878:	202f 0112      	move.l 274(sp),d0
    587c:	0680 0000 0084 	addi.l #132,d0
    5882:	d080           	add.l d0,d0
    5884:	2200           	move.l d0,d1
    5886:	7000           	moveq #0,d0
    5888:	302f 01c6      	move.w 454(sp),d0
    588c:	2f01           	move.l d1,-(sp)
    588e:	2f00           	move.l d0,-(sp)
    5890:	2f2f 01d0      	move.l 464(sp),-(sp)
    5894:	2f2f 0056      	move.l 86(sp),-(sp)
    5898:	4eba 123c      	jsr 6ad6 <TestRow>(pc)
    589c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    58a0:	702a           	moveq #42,d0
    58a2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    58a6:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    58aa:	52af 0112      	addq.l #1,274(sp)
    58ae:	7202           	moveq #2,d1
    58b0:	b2af 0112      	cmp.l 274(sp),d1
    58b4:	6c94           	bge.s 584a <TestZoom4Picture+0x1bd6>
  }

  tmp = source;
    58b6:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    58bc:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    58c2:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    58c8:	4878 0001      	pea 1 <_start+0x1>
    58cc:	4878 000a      	pea a <_start+0xa>
    58d0:	2f2f 0056      	move.l 86(sp),-(sp)
    58d4:	2f2f 006a      	move.l 106(sp),-(sp)
    58d8:	4eba c188      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    58dc:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    58e0:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    58e6:	2c40           	movea.l d0,a6
    58e8:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    58ec:	202f 004e      	move.l 78(sp),d0
    58f0:	5880           	addq.l #4,d0
    58f2:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom11;
    58f6:	2f7c 0000 bc0c 	move.l #48140,74(sp)
    58fc:	004a 

  mask = 0xffff;
    58fe:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  for(int i2=0;i2<6;i2++) {  
    5904:	42af 010e      	clr.l 270(sp)
    5908:	602a           	bra.s 5934 <TestZoom4Picture+0x1cc0>
    TestRow( valsupposed, valactual, mask, i2);
    590a:	7000           	moveq #0,d0
    590c:	302f 01c6      	move.w 454(sp),d0
    5910:	2f2f 010e      	move.l 270(sp),-(sp)
    5914:	2f00           	move.l d0,-(sp)
    5916:	2f2f 01d0      	move.l 464(sp),-(sp)
    591a:	2f2f 0056      	move.l 86(sp),-(sp)
    591e:	4eba 11b6      	jsr 6ad6 <TestRow>(pc)
    5922:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5926:	722a           	moveq #42,d1
    5928:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    592c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {  
    5930:	52af 010e      	addq.l #1,270(sp)
    5934:	7005           	moveq #5,d0
    5936:	b0af 010e      	cmp.l 270(sp),d0
    593a:	6cce           	bge.s 590a <TestZoom4Picture+0x1c96>
  }

  for(int i2=0;i2<11;i2++) {
    593c:	42af 010a      	clr.l 266(sp)
    5940:	605c           	bra.s 599e <TestZoom4Picture+0x1d2a>
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    5942:	202f 010a      	move.l 266(sp),d0
    5946:	5680           	addq.l #3,d0
    5948:	d080           	add.l d0,d0
    594a:	2200           	move.l d0,d1
    594c:	7000           	moveq #0,d0
    594e:	302f 01c6      	move.w 454(sp),d0
    5952:	2f01           	move.l d1,-(sp)
    5954:	2f00           	move.l d0,-(sp)
    5956:	2f2f 01d0      	move.l 464(sp),-(sp)
    595a:	2f2f 0056      	move.l 86(sp),-(sp)
    595e:	4eba 1176      	jsr 6ad6 <TestRow>(pc)
    5962:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5966:	722a           	moveq #42,d1
    5968:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    596c:	202f 010a      	move.l 266(sp),d0
    5970:	d080           	add.l d0,d0
    5972:	2200           	move.l d0,d1
    5974:	5e81           	addq.l #7,d1
    5976:	7000           	moveq #0,d0
    5978:	302f 01c6      	move.w 454(sp),d0
    597c:	2f01           	move.l d1,-(sp)
    597e:	2f00           	move.l d0,-(sp)
    5980:	2f2f 01d0      	move.l 464(sp),-(sp)
    5984:	2f2f 0056      	move.l 86(sp),-(sp)
    5988:	4eba 114c      	jsr 6ad6 <TestRow>(pc)
    598c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5990:	702a           	moveq #42,d0
    5992:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5996:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    599a:	52af 010a      	addq.l #1,266(sp)
    599e:	720a           	moveq #10,d1
    59a0:	b2af 010a      	cmp.l 266(sp),d1
    59a4:	6c9c           	bge.s 5942 <TestZoom4Picture+0x1cce>
  }

  for(int i=0;i<8;i++) {
    59a6:	42af 0106      	clr.l 262(sp)
    59aa:	6000 00f2      	bra.w 5a9e <TestZoom4Picture+0x1e2a>
    for(int i2=0;i2<7;i2++) {  
    59ae:	42af 0102      	clr.l 258(sp)
    59b2:	6044           	bra.s 59f8 <TestZoom4Picture+0x1d84>
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    59b4:	307c 001c      	movea.w #28,a0
    59b8:	d1ef 0102      	adda.l 258(sp),a0
    59bc:	222f 0106      	move.l 262(sp),d1
    59c0:	2001           	move.l d1,d0
    59c2:	e788           	lsl.l #3,d0
    59c4:	9081           	sub.l d1,d0
    59c6:	d080           	add.l d0,d0
    59c8:	d080           	add.l d0,d0
    59ca:	d081           	add.l d1,d0
    59cc:	2208           	move.l a0,d1
    59ce:	d280           	add.l d0,d1
    59d0:	7000           	moveq #0,d0
    59d2:	302f 01c6      	move.w 454(sp),d0
    59d6:	2f01           	move.l d1,-(sp)
    59d8:	2f00           	move.l d0,-(sp)
    59da:	2f2f 01d0      	move.l 464(sp),-(sp)
    59de:	2f2f 0056      	move.l 86(sp),-(sp)
    59e2:	4eba 10f2      	jsr 6ad6 <TestRow>(pc)
    59e6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    59ea:	702a           	moveq #42,d0
    59ec:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    59f0:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<7;i2++) {  
    59f4:	52af 0102      	addq.l #1,258(sp)
    59f8:	7206           	moveq #6,d1
    59fa:	b2af 0102      	cmp.l 258(sp),d1
    59fe:	6cb4           	bge.s 59b4 <TestZoom4Picture+0x1d40>
    }
    
    for(int i2=0;i2<11;i2++) {
    5a00:	42af 00fe      	clr.l 254(sp)
    5a04:	6000 008a      	bra.w 5a90 <TestZoom4Picture+0x1e1c>
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    5a08:	222f 0106      	move.l 262(sp),d1
    5a0c:	2001           	move.l d1,d0
    5a0e:	e788           	lsl.l #3,d0
    5a10:	9081           	sub.l d1,d0
    5a12:	d080           	add.l d0,d0
    5a14:	d080           	add.l d0,d0
    5a16:	2040           	movea.l d0,a0
    5a18:	d1c1           	adda.l d1,a0
    5a1a:	41e8 0023      	lea 35(a0),a0
    5a1e:	202f 00fe      	move.l 254(sp),d0
    5a22:	d080           	add.l d0,d0
    5a24:	2208           	move.l a0,d1
    5a26:	d280           	add.l d0,d1
    5a28:	7000           	moveq #0,d0
    5a2a:	302f 01c6      	move.w 454(sp),d0
    5a2e:	2f01           	move.l d1,-(sp)
    5a30:	2f00           	move.l d0,-(sp)
    5a32:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a36:	2f2f 0056      	move.l 86(sp),-(sp)
    5a3a:	4eba 109a      	jsr 6ad6 <TestRow>(pc)
    5a3e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a42:	702a           	moveq #42,d0
    5a44:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    5a48:	222f 0106      	move.l 262(sp),d1
    5a4c:	2001           	move.l d1,d0
    5a4e:	e788           	lsl.l #3,d0
    5a50:	9081           	sub.l d1,d0
    5a52:	d080           	add.l d0,d0
    5a54:	d080           	add.l d0,d0
    5a56:	2040           	movea.l d0,a0
    5a58:	d1c1           	adda.l d1,a0
    5a5a:	41e8 000b      	lea 11(a0),a0
    5a5e:	202f 00fe      	move.l 254(sp),d0
    5a62:	d080           	add.l d0,d0
    5a64:	2208           	move.l a0,d1
    5a66:	d280           	add.l d0,d1
    5a68:	7000           	moveq #0,d0
    5a6a:	302f 01c6      	move.w 454(sp),d0
    5a6e:	2f01           	move.l d1,-(sp)
    5a70:	2f00           	move.l d0,-(sp)
    5a72:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a76:	2f2f 0056      	move.l 86(sp),-(sp)
    5a7a:	4eba 105a      	jsr 6ad6 <TestRow>(pc)
    5a7e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a82:	722a           	moveq #42,d1
    5a84:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5a88:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {
    5a8c:	52af 00fe      	addq.l #1,254(sp)
    5a90:	700a           	moveq #10,d0
    5a92:	b0af 00fe      	cmp.l 254(sp),d0
    5a96:	6c00 ff70      	bge.w 5a08 <TestZoom4Picture+0x1d94>
  for(int i=0;i<8;i++) {
    5a9a:	52af 0106      	addq.l #1,262(sp)
    5a9e:	7207           	moveq #7,d1
    5aa0:	b2af 0106      	cmp.l 262(sp),d1
    5aa4:	6c00 ff08      	bge.w 59ae <TestZoom4Picture+0x1d3a>
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    5aa8:	42af 00fa      	clr.l 250(sp)
    5aac:	6032           	bra.s 5ae0 <TestZoom4Picture+0x1e6c>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5aae:	222f 00fa      	move.l 250(sp),d1
    5ab2:	0681 0000 0104 	addi.l #260,d1
    5ab8:	7000           	moveq #0,d0
    5aba:	302f 01c6      	move.w 454(sp),d0
    5abe:	2f01           	move.l d1,-(sp)
    5ac0:	2f00           	move.l d0,-(sp)
    5ac2:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ac6:	2f2f 0056      	move.l 86(sp),-(sp)
    5aca:	4eba 100a      	jsr 6ad6 <TestRow>(pc)
    5ace:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5ad2:	702a           	moveq #42,d0
    5ad4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5ad8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    5adc:	52af 00fa      	addq.l #1,250(sp)
    5ae0:	7206           	moveq #6,d1
    5ae2:	b2af 00fa      	cmp.l 250(sp),d1
    5ae6:	6cc6           	bge.s 5aae <TestZoom4Picture+0x1e3a>
  }
  TestRow( valsupposed, valactual, mask, 267);   
    5ae8:	7000           	moveq #0,d0
    5aea:	302f 01c6      	move.w 454(sp),d0
    5aee:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    5af2:	2f00           	move.l d0,-(sp)
    5af4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5af8:	2f2f 0056      	move.l 86(sp),-(sp)
    5afc:	4eba 0fd8      	jsr 6ad6 <TestRow>(pc)
    5b00:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b04:	702a           	moveq #42,d0
    5b06:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 268);
    5b0a:	7000           	moveq #0,d0
    5b0c:	302f 01c6      	move.w 454(sp),d0
    5b10:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    5b14:	2f00           	move.l d0,-(sp)
    5b16:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b1a:	2f2f 0056      	move.l 86(sp),-(sp)
    5b1e:	4eba 0fb6      	jsr 6ad6 <TestRow>(pc)
    5b22:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b26:	722a           	moveq #42,d1
    5b28:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5b2c:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 269);
    5b30:	7000           	moveq #0,d0
    5b32:	302f 01c6      	move.w 454(sp),d0
    5b36:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5b3a:	2f00           	move.l d0,-(sp)
    5b3c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b40:	2f2f 0056      	move.l 86(sp),-(sp)
    5b44:	4eba 0f90      	jsr 6ad6 <TestRow>(pc)
    5b48:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b4c:	702a           	moveq #42,d0
    5b4e:	d1af 01c8      	add.l d0,456(sp)
  
  tmp = source;
    5b52:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5b58:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5b5e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    5b64:	4878 0001      	pea 1 <_start+0x1>
    5b68:	4878 000b      	pea b <_start+0xb>
    5b6c:	2f2f 0056      	move.l 86(sp),-(sp)
    5b70:	2f2f 006a      	move.l 106(sp),-(sp)
    5b74:	4eba beec      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    5b78:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5b7c:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    5b82:	2c40           	movea.l d0,a6
    5b84:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5b88:	222f 004e      	move.l 78(sp),d1
    5b8c:	5881           	addq.l #4,d1
    5b8e:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom12;
    5b92:	2f7c 0000 bc38 	move.l #48184,74(sp)
    5b98:	004a 

  mask = 0x0;
    5b9a:	426f 01c6      	clr.w 454(sp)
   
  TestRow( valsupposed, valactual, mask, 0);
    5b9e:	7000           	moveq #0,d0
    5ba0:	302f 01c6      	move.w 454(sp),d0
    5ba4:	42a7           	clr.l -(sp)
    5ba6:	2f00           	move.l d0,-(sp)
    5ba8:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bac:	2f2f 0056      	move.l 86(sp),-(sp)
    5bb0:	4eba 0f24      	jsr 6ad6 <TestRow>(pc)
    5bb4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5bb8:	702a           	moveq #42,d0
    5bba:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5bbe:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<12;i2++) {
    5bc2:	42af 00f6      	clr.l 246(sp)
    5bc6:	605c           	bra.s 5c24 <TestZoom4Picture+0x1fb0>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5bc8:	202f 00f6      	move.l 246(sp),d0
    5bcc:	d080           	add.l d0,d0
    5bce:	2200           	move.l d0,d1
    5bd0:	5281           	addq.l #1,d1
    5bd2:	7000           	moveq #0,d0
    5bd4:	302f 01c6      	move.w 454(sp),d0
    5bd8:	2f01           	move.l d1,-(sp)
    5bda:	2f00           	move.l d0,-(sp)
    5bdc:	2f2f 01d0      	move.l 464(sp),-(sp)
    5be0:	2f2f 0056      	move.l 86(sp),-(sp)
    5be4:	4eba 0ef0      	jsr 6ad6 <TestRow>(pc)
    5be8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5bec:	722a           	moveq #42,d1
    5bee:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5bf2:	202f 00f6      	move.l 246(sp),d0
    5bf6:	5280           	addq.l #1,d0
    5bf8:	d080           	add.l d0,d0
    5bfa:	2200           	move.l d0,d1
    5bfc:	7000           	moveq #0,d0
    5bfe:	302f 01c6      	move.w 454(sp),d0
    5c02:	2f01           	move.l d1,-(sp)
    5c04:	2f00           	move.l d0,-(sp)
    5c06:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c0a:	2f2f 0056      	move.l 86(sp),-(sp)
    5c0e:	4eba 0ec6      	jsr 6ad6 <TestRow>(pc)
    5c12:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5c16:	702a           	moveq #42,d0
    5c18:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5c1c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    5c20:	52af 00f6      	addq.l #1,246(sp)
    5c24:	720b           	moveq #11,d1
    5c26:	b2af 00f6      	cmp.l 246(sp),d1
    5c2a:	6c9c           	bge.s 5bc8 <TestZoom4Picture+0x1f54>
  } 

  for(int i=0;i<8;i++) {
    5c2c:	42af 00f2      	clr.l 242(sp)
    5c30:	6000 00e6      	bra.w 5d18 <TestZoom4Picture+0x20a4>
    for(int i2=0;i2<6;i2++) {  
    5c34:	42af 00ee      	clr.l 238(sp)
    5c38:	6040           	bra.s 5c7a <TestZoom4Picture+0x2006>
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    5c3a:	307c 0019      	movea.w #25,a0
    5c3e:	d1ef 00ee      	adda.l 238(sp),a0
    5c42:	222f 00f2      	move.l 242(sp),d1
    5c46:	2001           	move.l d1,d0
    5c48:	e988           	lsl.l #4,d0
    5c4a:	9081           	sub.l d1,d0
    5c4c:	d080           	add.l d0,d0
    5c4e:	2208           	move.l a0,d1
    5c50:	d280           	add.l d0,d1
    5c52:	7000           	moveq #0,d0
    5c54:	302f 01c6      	move.w 454(sp),d0
    5c58:	2f01           	move.l d1,-(sp)
    5c5a:	2f00           	move.l d0,-(sp)
    5c5c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c60:	2f2f 0056      	move.l 86(sp),-(sp)
    5c64:	4eba 0e70      	jsr 6ad6 <TestRow>(pc)
    5c68:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5c6c:	702a           	moveq #42,d0
    5c6e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5c72:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<6;i2++) {  
    5c76:	52af 00ee      	addq.l #1,238(sp)
    5c7a:	7205           	moveq #5,d1
    5c7c:	b2af 00ee      	cmp.l 238(sp),d1
    5c80:	6cb8           	bge.s 5c3a <TestZoom4Picture+0x1fc6>
    }
    
    for(int i2=0;i2<12;i2++) {
    5c82:	42af 00ea      	clr.l 234(sp)
    5c86:	6000 0082      	bra.w 5d0a <TestZoom4Picture+0x2096>
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    5c8a:	222f 00f2      	move.l 242(sp),d1
    5c8e:	2001           	move.l d1,d0
    5c90:	e988           	lsl.l #4,d0
    5c92:	9081           	sub.l d1,d0
    5c94:	d080           	add.l d0,d0
    5c96:	2040           	movea.l d0,a0
    5c98:	41e8 001f      	lea 31(a0),a0
    5c9c:	202f 00ea      	move.l 234(sp),d0
    5ca0:	d080           	add.l d0,d0
    5ca2:	2208           	move.l a0,d1
    5ca4:	d280           	add.l d0,d1
    5ca6:	7000           	moveq #0,d0
    5ca8:	302f 01c6      	move.w 454(sp),d0
    5cac:	2f01           	move.l d1,-(sp)
    5cae:	2f00           	move.l d0,-(sp)
    5cb0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5cb4:	2f2f 0056      	move.l 86(sp),-(sp)
    5cb8:	4eba 0e1c      	jsr 6ad6 <TestRow>(pc)
    5cbc:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5cc0:	702a           	moveq #42,d0
    5cc2:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    5cc6:	222f 00f2      	move.l 242(sp),d1
    5cca:	2001           	move.l d1,d0
    5ccc:	e988           	lsl.l #4,d0
    5cce:	9081           	sub.l d1,d0
    5cd0:	d080           	add.l d0,d0
    5cd2:	2040           	movea.l d0,a0
    5cd4:	41e8 0020      	lea 32(a0),a0
    5cd8:	202f 00ea      	move.l 234(sp),d0
    5cdc:	d080           	add.l d0,d0
    5cde:	2208           	move.l a0,d1
    5ce0:	d280           	add.l d0,d1
    5ce2:	7000           	moveq #0,d0
    5ce4:	302f 01c6      	move.w 454(sp),d0
    5ce8:	2f01           	move.l d1,-(sp)
    5cea:	2f00           	move.l d0,-(sp)
    5cec:	2f2f 01d0      	move.l 464(sp),-(sp)
    5cf0:	2f2f 0056      	move.l 86(sp),-(sp)
    5cf4:	4eba 0de0      	jsr 6ad6 <TestRow>(pc)
    5cf8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5cfc:	722a           	moveq #42,d1
    5cfe:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5d02:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {
    5d06:	52af 00ea      	addq.l #1,234(sp)
    5d0a:	700b           	moveq #11,d0
    5d0c:	b0af 00ea      	cmp.l 234(sp),d0
    5d10:	6c00 ff78      	bge.w 5c8a <TestZoom4Picture+0x2016>
  for(int i=0;i<8;i++) {
    5d14:	52af 00f2      	addq.l #1,242(sp)
    5d18:	7207           	moveq #7,d1
    5d1a:	b2af 00f2      	cmp.l 242(sp),d1
    5d1e:	6c00 ff14      	bge.w 5c34 <TestZoom4Picture+0x1fc0>
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    5d22:	42af 00e6      	clr.l 230(sp)
    5d26:	6032           	bra.s 5d5a <TestZoom4Picture+0x20e6>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5d28:	222f 00e6      	move.l 230(sp),d1
    5d2c:	0681 0000 0104 	addi.l #260,d1
    5d32:	7000           	moveq #0,d0
    5d34:	302f 01c6      	move.w 454(sp),d0
    5d38:	2f01           	move.l d1,-(sp)
    5d3a:	2f00           	move.l d0,-(sp)
    5d3c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d40:	2f2f 0056      	move.l 86(sp),-(sp)
    5d44:	4eba 0d90      	jsr 6ad6 <TestRow>(pc)
    5d48:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5d4c:	702a           	moveq #42,d0
    5d4e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5d52:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5d56:	52af 00e6      	addq.l #1,230(sp)
    5d5a:	7204           	moveq #4,d1
    5d5c:	b2af 00e6      	cmp.l 230(sp),d1
    5d60:	6cc6           	bge.s 5d28 <TestZoom4Picture+0x20b4>
  }

  tmp = source;
    5d62:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5d68:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5d6e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    5d74:	4878 0001      	pea 1 <_start+0x1>
    5d78:	4878 000c      	pea c <_start+0xc>
    5d7c:	2f2f 0056      	move.l 86(sp),-(sp)
    5d80:	2f2f 006a      	move.l 106(sp),-(sp)
    5d84:	4eba bcdc      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    5d88:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5d8c:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    5d92:	2c40           	movea.l d0,a6
    5d94:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5d98:	202f 004e      	move.l 78(sp),d0
    5d9c:	5880           	addq.l #4,d0
    5d9e:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom13;
    5da2:	2f7c 0000 bc64 	move.l #48228,74(sp)
    5da8:	004a 

  mask = 0xffff;
    5daa:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<11;i2++) {
    5db0:	42af 00e2      	clr.l 226(sp)
    5db4:	605a           	bra.s 5e10 <TestZoom4Picture+0x219c>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    5db6:	202f 00e2      	move.l 226(sp),d0
    5dba:	d080           	add.l d0,d0
    5dbc:	2200           	move.l d0,d1
    5dbe:	7000           	moveq #0,d0
    5dc0:	302f 01c6      	move.w 454(sp),d0
    5dc4:	2f01           	move.l d1,-(sp)
    5dc6:	2f00           	move.l d0,-(sp)
    5dc8:	2f2f 01d0      	move.l 464(sp),-(sp)
    5dcc:	2f2f 0056      	move.l 86(sp),-(sp)
    5dd0:	4eba 0d04      	jsr 6ad6 <TestRow>(pc)
    5dd4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5dd8:	722a           	moveq #42,d1
    5dda:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    5dde:	202f 00e2      	move.l 226(sp),d0
    5de2:	d080           	add.l d0,d0
    5de4:	2200           	move.l d0,d1
    5de6:	5281           	addq.l #1,d1
    5de8:	7000           	moveq #0,d0
    5dea:	302f 01c6      	move.w 454(sp),d0
    5dee:	2f01           	move.l d1,-(sp)
    5df0:	2f00           	move.l d0,-(sp)
    5df2:	2f2f 01d0      	move.l 464(sp),-(sp)
    5df6:	2f2f 0056      	move.l 86(sp),-(sp)
    5dfa:	4eba 0cda      	jsr 6ad6 <TestRow>(pc)
    5dfe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5e02:	702a           	moveq #42,d0
    5e04:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5e08:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5e0c:	52af 00e2      	addq.l #1,226(sp)
    5e10:	720a           	moveq #10,d1
    5e12:	b2af 00e2      	cmp.l 226(sp),d1
    5e16:	6c9e           	bge.s 5db6 <TestZoom4Picture+0x2142>
  } 

  for(int i=0;i<8;i++) {
    5e18:	42af 00de      	clr.l 222(sp)
    5e1c:	6000 00de      	bra.w 5efc <TestZoom4Picture+0x2288>
    for(int i2=0;i2<5;i2++) {  
    5e20:	42af 00da      	clr.l 218(sp)
    5e24:	603e           	bra.s 5e64 <TestZoom4Picture+0x21f0>
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    5e26:	307c 0016      	movea.w #22,a0
    5e2a:	d1ef 00da      	adda.l 218(sp),a0
    5e2e:	222f 00de      	move.l 222(sp),d1
    5e32:	2001           	move.l d1,d0
    5e34:	eb88           	lsl.l #5,d0
    5e36:	9081           	sub.l d1,d0
    5e38:	2208           	move.l a0,d1
    5e3a:	d280           	add.l d0,d1
    5e3c:	7000           	moveq #0,d0
    5e3e:	302f 01c6      	move.w 454(sp),d0
    5e42:	2f01           	move.l d1,-(sp)
    5e44:	2f00           	move.l d0,-(sp)
    5e46:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e4a:	2f2f 0056      	move.l 86(sp),-(sp)
    5e4e:	4eba 0c86      	jsr 6ad6 <TestRow>(pc)
    5e52:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5e56:	702a           	moveq #42,d0
    5e58:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5e5c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<5;i2++) {  
    5e60:	52af 00da      	addq.l #1,218(sp)
    5e64:	7204           	moveq #4,d1
    5e66:	b2af 00da      	cmp.l 218(sp),d1
    5e6a:	6cba           	bge.s 5e26 <TestZoom4Picture+0x21b2>
    }
    
    for(int i2=0;i2<13;i2++) {
    5e6c:	42af 00d6      	clr.l 214(sp)
    5e70:	607c           	bra.s 5eee <TestZoom4Picture+0x227a>
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    5e72:	222f 00de      	move.l 222(sp),d1
    5e76:	2001           	move.l d1,d0
    5e78:	eb88           	lsl.l #5,d0
    5e7a:	2040           	movea.l d0,a0
    5e7c:	91c1           	suba.l d1,a0
    5e7e:	41e8 001b      	lea 27(a0),a0
    5e82:	202f 00d6      	move.l 214(sp),d0
    5e86:	d080           	add.l d0,d0
    5e88:	2208           	move.l a0,d1
    5e8a:	d280           	add.l d0,d1
    5e8c:	7000           	moveq #0,d0
    5e8e:	302f 01c6      	move.w 454(sp),d0
    5e92:	2f01           	move.l d1,-(sp)
    5e94:	2f00           	move.l d0,-(sp)
    5e96:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e9a:	2f2f 0056      	move.l 86(sp),-(sp)
    5e9e:	4eba 0c36      	jsr 6ad6 <TestRow>(pc)
    5ea2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5ea6:	702a           	moveq #42,d0
    5ea8:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    5eac:	222f 00de      	move.l 222(sp),d1
    5eb0:	2001           	move.l d1,d0
    5eb2:	eb88           	lsl.l #5,d0
    5eb4:	2040           	movea.l d0,a0
    5eb6:	91c1           	suba.l d1,a0
    5eb8:	41e8 001c      	lea 28(a0),a0
    5ebc:	202f 00d6      	move.l 214(sp),d0
    5ec0:	d080           	add.l d0,d0
    5ec2:	2208           	move.l a0,d1
    5ec4:	d280           	add.l d0,d1
    5ec6:	7000           	moveq #0,d0
    5ec8:	302f 01c6      	move.w 454(sp),d0
    5ecc:	2f01           	move.l d1,-(sp)
    5ece:	2f00           	move.l d0,-(sp)
    5ed0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ed4:	2f2f 0056      	move.l 86(sp),-(sp)
    5ed8:	4eba 0bfc      	jsr 6ad6 <TestRow>(pc)
    5edc:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5ee0:	722a           	moveq #42,d1
    5ee2:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5ee6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {
    5eea:	52af 00d6      	addq.l #1,214(sp)
    5eee:	700c           	moveq #12,d0
    5ef0:	b0af 00d6      	cmp.l 214(sp),d0
    5ef4:	6c00 ff7c      	bge.w 5e72 <TestZoom4Picture+0x21fe>
  for(int i=0;i<8;i++) {
    5ef8:	52af 00de      	addq.l #1,222(sp)
    5efc:	7207           	moveq #7,d1
    5efe:	b2af 00de      	cmp.l 222(sp),d1
    5f02:	6c00 ff1c      	bge.w 5e20 <TestZoom4Picture+0x21ac>
    }
  } 

  tmp = source;
    5f06:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5f0c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5f12:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    5f18:	4878 0001      	pea 1 <_start+0x1>
    5f1c:	4878 000d      	pea d <_start+0xd>
    5f20:	2f2f 0056      	move.l 86(sp),-(sp)
    5f24:	2f2f 006a      	move.l 106(sp),-(sp)
    5f28:	4eba bb38      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    5f2c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5f30:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    5f36:	2c40           	movea.l d0,a6
    5f38:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5f3c:	202f 004e      	move.l 78(sp),d0
    5f40:	5880           	addq.l #4,d0
    5f42:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom14;
    5f46:	2f7c 0000 bc90 	move.l #48272,74(sp)
    5f4c:	004a 

  mask = 0xffff;
    5f4e:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    5f54:	7000           	moveq #0,d0
    5f56:	302f 01c6      	move.w 454(sp),d0
    5f5a:	42a7           	clr.l -(sp)
    5f5c:	2f00           	move.l d0,-(sp)
    5f5e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f62:	2f2f 0056      	move.l 86(sp),-(sp)
    5f66:	4eba 0b6e      	jsr 6ad6 <TestRow>(pc)
    5f6a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2; 
    5f6e:	722a           	moveq #42,d1
    5f70:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff; 
    5f74:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<9;i2++) {
    5f78:	42af 00d2      	clr.l 210(sp)
    5f7c:	605c           	bra.s 5fda <TestZoom4Picture+0x2366>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5f7e:	202f 00d2      	move.l 210(sp),d0
    5f82:	d080           	add.l d0,d0
    5f84:	2200           	move.l d0,d1
    5f86:	5281           	addq.l #1,d1
    5f88:	7000           	moveq #0,d0
    5f8a:	302f 01c6      	move.w 454(sp),d0
    5f8e:	2f01           	move.l d1,-(sp)
    5f90:	2f00           	move.l d0,-(sp)
    5f92:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f96:	2f2f 0056      	move.l 86(sp),-(sp)
    5f9a:	4eba 0b3a      	jsr 6ad6 <TestRow>(pc)
    5f9e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5fa2:	702a           	moveq #42,d0
    5fa4:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5fa8:	202f 00d2      	move.l 210(sp),d0
    5fac:	5280           	addq.l #1,d0
    5fae:	d080           	add.l d0,d0
    5fb0:	2200           	move.l d0,d1
    5fb2:	7000           	moveq #0,d0
    5fb4:	302f 01c6      	move.w 454(sp),d0
    5fb8:	2f01           	move.l d1,-(sp)
    5fba:	2f00           	move.l d0,-(sp)
    5fbc:	2f2f 01d0      	move.l 464(sp),-(sp)
    5fc0:	2f2f 0056      	move.l 86(sp),-(sp)
    5fc4:	4eba 0b10      	jsr 6ad6 <TestRow>(pc)
    5fc8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5fcc:	722a           	moveq #42,d1
    5fce:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5fd2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {
    5fd6:	52af 00d2      	addq.l #1,210(sp)
    5fda:	7008           	moveq #8,d0
    5fdc:	b0af 00d2      	cmp.l 210(sp),d0
    5fe0:	6c9c           	bge.s 5f7e <TestZoom4Picture+0x230a>
  } 

  for(int i=0;i<7;i++) {
    5fe2:	42af 00ce      	clr.l 206(sp)
    5fe6:	6000 00cc      	bra.w 60b4 <TestZoom4Picture+0x2440>
    for(int i2=0;i2<4;i2++) {  
    5fea:	42af 00ca      	clr.l 202(sp)
    5fee:	6036           	bra.s 6026 <TestZoom4Picture+0x23b2>
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    5ff0:	7213           	moveq #19,d1
    5ff2:	d2af 00ca      	add.l 202(sp),d1
    5ff6:	202f 00ce      	move.l 206(sp),d0
    5ffa:	eb88           	lsl.l #5,d0
    5ffc:	d280           	add.l d0,d1
    5ffe:	7000           	moveq #0,d0
    6000:	302f 01c6      	move.w 454(sp),d0
    6004:	2f01           	move.l d1,-(sp)
    6006:	2f00           	move.l d0,-(sp)
    6008:	2f2f 01d0      	move.l 464(sp),-(sp)
    600c:	2f2f 0056      	move.l 86(sp),-(sp)
    6010:	4eba 0ac4      	jsr 6ad6 <TestRow>(pc)
    6014:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6018:	722a           	moveq #42,d1
    601a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    601e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<4;i2++) {  
    6022:	52af 00ca      	addq.l #1,202(sp)
    6026:	7003           	moveq #3,d0
    6028:	b0af 00ca      	cmp.l 202(sp),d0
    602c:	6cc2           	bge.s 5ff0 <TestZoom4Picture+0x237c>
    }
    
    for(int i2=0;i2<14;i2++) {
    602e:	42af 00c6      	clr.l 198(sp)
    6032:	6074           	bra.s 60a8 <TestZoom4Picture+0x2434>
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    6034:	202f 00ce      	move.l 206(sp),d0
    6038:	eb88           	lsl.l #5,d0
    603a:	307c 0017      	movea.w #23,a0
    603e:	d1c0           	adda.l d0,a0
    6040:	202f 00c6      	move.l 198(sp),d0
    6044:	d080           	add.l d0,d0
    6046:	2208           	move.l a0,d1
    6048:	d280           	add.l d0,d1
    604a:	7000           	moveq #0,d0
    604c:	302f 01c6      	move.w 454(sp),d0
    6050:	2f01           	move.l d1,-(sp)
    6052:	2f00           	move.l d0,-(sp)
    6054:	2f2f 01d0      	move.l 464(sp),-(sp)
    6058:	2f2f 0056      	move.l 86(sp),-(sp)
    605c:	4eba 0a78      	jsr 6ad6 <TestRow>(pc)
    6060:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6064:	722a           	moveq #42,d1
    6066:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    606a:	202f 00ce      	move.l 206(sp),d0
    606e:	eb88           	lsl.l #5,d0
    6070:	307c 0018      	movea.w #24,a0
    6074:	d1c0           	adda.l d0,a0
    6076:	202f 00c6      	move.l 198(sp),d0
    607a:	d080           	add.l d0,d0
    607c:	2208           	move.l a0,d1
    607e:	d280           	add.l d0,d1
    6080:	7000           	moveq #0,d0
    6082:	302f 01c6      	move.w 454(sp),d0
    6086:	2f01           	move.l d1,-(sp)
    6088:	2f00           	move.l d0,-(sp)
    608a:	2f2f 01d0      	move.l 464(sp),-(sp)
    608e:	2f2f 0056      	move.l 86(sp),-(sp)
    6092:	4eba 0a42      	jsr 6ad6 <TestRow>(pc)
    6096:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    609a:	702a           	moveq #42,d0
    609c:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    60a0:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {
    60a4:	52af 00c6      	addq.l #1,198(sp)
    60a8:	720d           	moveq #13,d1
    60aa:	b2af 00c6      	cmp.l 198(sp),d1
    60ae:	6c84           	bge.s 6034 <TestZoom4Picture+0x23c0>
  for(int i=0;i<7;i++) {
    60b0:	52af 00ce      	addq.l #1,206(sp)
    60b4:	7006           	moveq #6,d0
    60b6:	b0af 00ce      	cmp.l 206(sp),d0
    60ba:	6c00 ff2e      	bge.w 5fea <TestZoom4Picture+0x2376>
    }
  }

  for(int i2=0;i2<4;i2++) {  
    60be:	42af 00c2      	clr.l 194(sp)
    60c2:	6032           	bra.s 60f6 <TestZoom4Picture+0x2482>
    TestRow( valsupposed, valactual, mask, 243+i2);
    60c4:	222f 00c2      	move.l 194(sp),d1
    60c8:	0681 0000 00f3 	addi.l #243,d1
    60ce:	7000           	moveq #0,d0
    60d0:	302f 01c6      	move.w 454(sp),d0
    60d4:	2f01           	move.l d1,-(sp)
    60d6:	2f00           	move.l d0,-(sp)
    60d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    60dc:	2f2f 0056      	move.l 86(sp),-(sp)
    60e0:	4eba 09f4      	jsr 6ad6 <TestRow>(pc)
    60e4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    60e8:	722a           	moveq #42,d1
    60ea:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    60ee:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {  
    60f2:	52af 00c2      	addq.l #1,194(sp)
    60f6:	7003           	moveq #3,d0
    60f8:	b0af 00c2      	cmp.l 194(sp),d0
    60fc:	6cc6           	bge.s 60c4 <TestZoom4Picture+0x2450>
  }

  for(int i2=0;i2<12;i2++) {
    60fe:	42af 00be      	clr.l 190(sp)
    6102:	6060           	bra.s 6164 <TestZoom4Picture+0x24f0>
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    6104:	202f 00be      	move.l 190(sp),d0
    6108:	d080           	add.l d0,d0
    610a:	2200           	move.l d0,d1
    610c:	0681 0000 00f7 	addi.l #247,d1
    6112:	7000           	moveq #0,d0
    6114:	302f 01c6      	move.w 454(sp),d0
    6118:	2f01           	move.l d1,-(sp)
    611a:	2f00           	move.l d0,-(sp)
    611c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6120:	2f2f 0056      	move.l 86(sp),-(sp)
    6124:	4eba 09b0      	jsr 6ad6 <TestRow>(pc)
    6128:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    612c:	722a           	moveq #42,d1
    612e:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    6132:	707c           	moveq #124,d0
    6134:	d0af 00be      	add.l 190(sp),d0
    6138:	d080           	add.l d0,d0
    613a:	2200           	move.l d0,d1
    613c:	7000           	moveq #0,d0
    613e:	302f 01c6      	move.w 454(sp),d0
    6142:	2f01           	move.l d1,-(sp)
    6144:	2f00           	move.l d0,-(sp)
    6146:	2f2f 01d0      	move.l 464(sp),-(sp)
    614a:	2f2f 0056      	move.l 86(sp),-(sp)
    614e:	4eba 0986      	jsr 6ad6 <TestRow>(pc)
    6152:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6156:	702a           	moveq #42,d0
    6158:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    615c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    6160:	52af 00be      	addq.l #1,190(sp)
    6164:	720b           	moveq #11,d1
    6166:	b2af 00be      	cmp.l 190(sp),d1
    616a:	6c98           	bge.s 6104 <TestZoom4Picture+0x2490>
  }

  tmp = source;
    616c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6172:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6178:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    617e:	4878 0001      	pea 1 <_start+0x1>
    6182:	4878 000e      	pea e <_start+0xe>
    6186:	2f2f 0056      	move.l 86(sp),-(sp)
    618a:	2f2f 006a      	move.l 106(sp),-(sp)
    618e:	4eba b8d2      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    6192:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6196:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    619c:	2c40           	movea.l d0,a6
    619e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    61a2:	202f 004e      	move.l 78(sp),d0
    61a6:	5880           	addq.l #4,d0
    61a8:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom15;
    61ac:	2f7c 0000 bcbc 	move.l #48316,74(sp)
    61b2:	004a 

  mask = 0x0000;
    61b4:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<8;i2++) {
    61b8:	42af 00ba      	clr.l 186(sp)
    61bc:	605a           	bra.s 6218 <TestZoom4Picture+0x25a4>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    61be:	202f 00ba      	move.l 186(sp),d0
    61c2:	d080           	add.l d0,d0
    61c4:	2200           	move.l d0,d1
    61c6:	7000           	moveq #0,d0
    61c8:	302f 01c6      	move.w 454(sp),d0
    61cc:	2f01           	move.l d1,-(sp)
    61ce:	2f00           	move.l d0,-(sp)
    61d0:	2f2f 01d0      	move.l 464(sp),-(sp)
    61d4:	2f2f 0056      	move.l 86(sp),-(sp)
    61d8:	4eba 08fc      	jsr 6ad6 <TestRow>(pc)
    61dc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61e0:	722a           	moveq #42,d1
    61e2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    61e6:	202f 00ba      	move.l 186(sp),d0
    61ea:	d080           	add.l d0,d0
    61ec:	2200           	move.l d0,d1
    61ee:	5281           	addq.l #1,d1
    61f0:	7000           	moveq #0,d0
    61f2:	302f 01c6      	move.w 454(sp),d0
    61f6:	2f01           	move.l d1,-(sp)
    61f8:	2f00           	move.l d0,-(sp)
    61fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    61fe:	2f2f 0056      	move.l 86(sp),-(sp)
    6202:	4eba 08d2      	jsr 6ad6 <TestRow>(pc)
    6206:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    620a:	702a           	moveq #42,d0
    620c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6210:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    6214:	52af 00ba      	addq.l #1,186(sp)
    6218:	7207           	moveq #7,d1
    621a:	b2af 00ba      	cmp.l 186(sp),d1
    621e:	6c9e           	bge.s 61be <TestZoom4Picture+0x254a>
  }

  for(int i=0;i<7;i++) {
    6220:	42af 00b6      	clr.l 182(sp)
    6224:	6000 00de      	bra.w 6304 <TestZoom4Picture+0x2690>
    for(int i2=0;i2<3;i2++) {  
    6228:	42af 00b2      	clr.l 178(sp)
    622c:	603e           	bra.s 626c <TestZoom4Picture+0x25f8>
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    622e:	307c 0010      	movea.w #16,a0
    6232:	d1ef 00b2      	adda.l 178(sp),a0
    6236:	222f 00b6      	move.l 182(sp),d1
    623a:	2001           	move.l d1,d0
    623c:	eb88           	lsl.l #5,d0
    623e:	d081           	add.l d1,d0
    6240:	2208           	move.l a0,d1
    6242:	d280           	add.l d0,d1
    6244:	7000           	moveq #0,d0
    6246:	302f 01c6      	move.w 454(sp),d0
    624a:	2f01           	move.l d1,-(sp)
    624c:	2f00           	move.l d0,-(sp)
    624e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6252:	2f2f 0056      	move.l 86(sp),-(sp)
    6256:	4eba 087e      	jsr 6ad6 <TestRow>(pc)
    625a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    625e:	702a           	moveq #42,d0
    6260:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6264:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<3;i2++) {  
    6268:	52af 00b2      	addq.l #1,178(sp)
    626c:	7202           	moveq #2,d1
    626e:	b2af 00b2      	cmp.l 178(sp),d1
    6272:	6cba           	bge.s 622e <TestZoom4Picture+0x25ba>
    }
    
    for(int i2=0;i2<15;i2++) {
    6274:	42af 00ae      	clr.l 174(sp)
    6278:	607c           	bra.s 62f6 <TestZoom4Picture+0x2682>
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    627a:	222f 00b6      	move.l 182(sp),d1
    627e:	2001           	move.l d1,d0
    6280:	eb88           	lsl.l #5,d0
    6282:	2040           	movea.l d0,a0
    6284:	d1c1           	adda.l d1,a0
    6286:	41e8 0013      	lea 19(a0),a0
    628a:	202f 00ae      	move.l 174(sp),d0
    628e:	d080           	add.l d0,d0
    6290:	2208           	move.l a0,d1
    6292:	d280           	add.l d0,d1
    6294:	7000           	moveq #0,d0
    6296:	302f 01c6      	move.w 454(sp),d0
    629a:	2f01           	move.l d1,-(sp)
    629c:	2f00           	move.l d0,-(sp)
    629e:	2f2f 01d0      	move.l 464(sp),-(sp)
    62a2:	2f2f 0056      	move.l 86(sp),-(sp)
    62a6:	4eba 082e      	jsr 6ad6 <TestRow>(pc)
    62aa:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    62ae:	702a           	moveq #42,d0
    62b0:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    62b4:	222f 00b6      	move.l 182(sp),d1
    62b8:	2001           	move.l d1,d0
    62ba:	eb88           	lsl.l #5,d0
    62bc:	2040           	movea.l d0,a0
    62be:	d1c1           	adda.l d1,a0
    62c0:	41e8 0013      	lea 19(a0),a0
    62c4:	202f 00ae      	move.l 174(sp),d0
    62c8:	d080           	add.l d0,d0
    62ca:	2208           	move.l a0,d1
    62cc:	d280           	add.l d0,d1
    62ce:	7000           	moveq #0,d0
    62d0:	302f 01c6      	move.w 454(sp),d0
    62d4:	2f01           	move.l d1,-(sp)
    62d6:	2f00           	move.l d0,-(sp)
    62d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    62dc:	2f2f 0056      	move.l 86(sp),-(sp)
    62e0:	4eba 07f4      	jsr 6ad6 <TestRow>(pc)
    62e4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    62e8:	722a           	moveq #42,d1
    62ea:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    62ee:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {
    62f2:	52af 00ae      	addq.l #1,174(sp)
    62f6:	700e           	moveq #14,d0
    62f8:	b0af 00ae      	cmp.l 174(sp),d0
    62fc:	6c00 ff7c      	bge.w 627a <TestZoom4Picture+0x2606>
  for(int i=0;i<7;i++) {
    6300:	52af 00b6      	addq.l #1,182(sp)
    6304:	7206           	moveq #6,d1
    6306:	b2af 00b6      	cmp.l 182(sp),d1
    630a:	6c00 ff1c      	bge.w 6228 <TestZoom4Picture+0x25b4>
    }
  }

  for(int i2=0;i2<3;i2++) {  
    630e:	42af 00aa      	clr.l 170(sp)
    6312:	6032           	bra.s 6346 <TestZoom4Picture+0x26d2>
    TestRow( valsupposed, valactual, mask, 247+i2);
    6314:	222f 00aa      	move.l 170(sp),d1
    6318:	0681 0000 00f7 	addi.l #247,d1
    631e:	7000           	moveq #0,d0
    6320:	302f 01c6      	move.w 454(sp),d0
    6324:	2f01           	move.l d1,-(sp)
    6326:	2f00           	move.l d0,-(sp)
    6328:	2f2f 01d0      	move.l 464(sp),-(sp)
    632c:	2f2f 0056      	move.l 86(sp),-(sp)
    6330:	4eba 07a4      	jsr 6ad6 <TestRow>(pc)
    6334:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6338:	702a           	moveq #42,d0
    633a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    633e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<3;i2++) {  
    6342:	52af 00aa      	addq.l #1,170(sp)
    6346:	7202           	moveq #2,d1
    6348:	b2af 00aa      	cmp.l 170(sp),d1
    634c:	6cc6           	bge.s 6314 <TestZoom4Picture+0x26a0>
  }

  for(int i2=0;i2<10;i2++) {
    634e:	42af 00a6      	clr.l 166(sp)
    6352:	6060           	bra.s 63b4 <TestZoom4Picture+0x2740>
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    6354:	707d           	moveq #125,d0
    6356:	d0af 00a6      	add.l 166(sp),d0
    635a:	d080           	add.l d0,d0
    635c:	2200           	move.l d0,d1
    635e:	7000           	moveq #0,d0
    6360:	302f 01c6      	move.w 454(sp),d0
    6364:	2f01           	move.l d1,-(sp)
    6366:	2f00           	move.l d0,-(sp)
    6368:	2f2f 01d0      	move.l 464(sp),-(sp)
    636c:	2f2f 0056      	move.l 86(sp),-(sp)
    6370:	4eba 0764      	jsr 6ad6 <TestRow>(pc)
    6374:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6378:	702a           	moveq #42,d0
    637a:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    637e:	202f 00a6      	move.l 166(sp),d0
    6382:	d080           	add.l d0,d0
    6384:	2200           	move.l d0,d1
    6386:	0681 0000 00fb 	addi.l #251,d1
    638c:	7000           	moveq #0,d0
    638e:	302f 01c6      	move.w 454(sp),d0
    6392:	2f01           	move.l d1,-(sp)
    6394:	2f00           	move.l d0,-(sp)
    6396:	2f2f 01d0      	move.l 464(sp),-(sp)
    639a:	2f2f 0056      	move.l 86(sp),-(sp)
    639e:	4eba 0736      	jsr 6ad6 <TestRow>(pc)
    63a2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    63a6:	722a           	moveq #42,d1
    63a8:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    63ac:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {
    63b0:	52af 00a6      	addq.l #1,166(sp)
    63b4:	7009           	moveq #9,d0
    63b6:	b0af 00a6      	cmp.l 166(sp),d0
    63ba:	6c98           	bge.s 6354 <TestZoom4Picture+0x26e0>
  }

  tmp = source;
    63bc:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    63c2:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    63c8:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    63ce:	4878 0001      	pea 1 <_start+0x1>
    63d2:	4878 000f      	pea f <_start+0xf>
    63d6:	2f2f 0056      	move.l 86(sp),-(sp)
    63da:	2f2f 006a      	move.l 106(sp),-(sp)
    63de:	4eba b682      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    63e2:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    63e6:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    63ec:	2c40           	movea.l d0,a6
    63ee:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    63f2:	222f 004e      	move.l 78(sp),d1
    63f6:	5881           	addq.l #4,d1
    63f8:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom16;
    63fc:	2f7c 0000 bce8 	move.l #48360,74(sp)
    6402:	004a 

  mask = 0x0000;
    6404:	426f 01c6      	clr.w 454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    6408:	7000           	moveq #0,d0
    640a:	302f 01c6      	move.w 454(sp),d0
    640e:	42a7           	clr.l -(sp)
    6410:	2f00           	move.l d0,-(sp)
    6412:	2f2f 01d0      	move.l 464(sp),-(sp)
    6416:	2f2f 0056      	move.l 86(sp),-(sp)
    641a:	4eba 06ba      	jsr 6ad6 <TestRow>(pc)
    641e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6422:	702a           	moveq #42,d0
    6424:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6428:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    642c:	42af 00a2      	clr.l 162(sp)
    6430:	605a           	bra.s 648c <TestZoom4Picture+0x2818>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6432:	202f 00a2      	move.l 162(sp),d0
    6436:	d080           	add.l d0,d0
    6438:	2200           	move.l d0,d1
    643a:	7000           	moveq #0,d0
    643c:	302f 01c6      	move.w 454(sp),d0
    6440:	2f01           	move.l d1,-(sp)
    6442:	2f00           	move.l d0,-(sp)
    6444:	2f2f 01d0      	move.l 464(sp),-(sp)
    6448:	2f2f 0056      	move.l 86(sp),-(sp)
    644c:	4eba 0688      	jsr 6ad6 <TestRow>(pc)
    6450:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6454:	722a           	moveq #42,d1
    6456:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    645a:	202f 00a2      	move.l 162(sp),d0
    645e:	d080           	add.l d0,d0
    6460:	2200           	move.l d0,d1
    6462:	5281           	addq.l #1,d1
    6464:	7000           	moveq #0,d0
    6466:	302f 01c6      	move.w 454(sp),d0
    646a:	2f01           	move.l d1,-(sp)
    646c:	2f00           	move.l d0,-(sp)
    646e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6472:	2f2f 0056      	move.l 86(sp),-(sp)
    6476:	4eba 065e      	jsr 6ad6 <TestRow>(pc)
    647a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    647e:	702a           	moveq #42,d0
    6480:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6484:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    6488:	52af 00a2      	addq.l #1,162(sp)
    648c:	7205           	moveq #5,d1
    648e:	b2af 00a2      	cmp.l 162(sp),d1
    6492:	6c9e           	bge.s 6432 <TestZoom4Picture+0x27be>
  }

  for(int i=0;i<7;i++) {
    6494:	42af 009e      	clr.l 158(sp)
    6498:	6000 00e6      	bra.w 6580 <TestZoom4Picture+0x290c>
    for(int i2=0;i2<2;i2++) {  
    649c:	42af 009a      	clr.l 154(sp)
    64a0:	6040           	bra.s 64e2 <TestZoom4Picture+0x286e>
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    64a2:	307c 000d      	movea.w #13,a0
    64a6:	d1ef 009a      	adda.l 154(sp),a0
    64aa:	222f 009e      	move.l 158(sp),d1
    64ae:	2001           	move.l d1,d0
    64b0:	e988           	lsl.l #4,d0
    64b2:	d081           	add.l d1,d0
    64b4:	d080           	add.l d0,d0
    64b6:	2208           	move.l a0,d1
    64b8:	d280           	add.l d0,d1
    64ba:	7000           	moveq #0,d0
    64bc:	302f 01c6      	move.w 454(sp),d0
    64c0:	2f01           	move.l d1,-(sp)
    64c2:	2f00           	move.l d0,-(sp)
    64c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    64c8:	2f2f 0056      	move.l 86(sp),-(sp)
    64cc:	4eba 0608      	jsr 6ad6 <TestRow>(pc)
    64d0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    64d4:	702a           	moveq #42,d0
    64d6:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    64da:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<2;i2++) {  
    64de:	52af 009a      	addq.l #1,154(sp)
    64e2:	7201           	moveq #1,d1
    64e4:	b2af 009a      	cmp.l 154(sp),d1
    64e8:	6cb8           	bge.s 64a2 <TestZoom4Picture+0x282e>
    }
    
    for(int i2=0;i2<16;i2++) {
    64ea:	42af 0096      	clr.l 150(sp)
    64ee:	6000 0082      	bra.w 6572 <TestZoom4Picture+0x28fe>
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    64f2:	222f 009e      	move.l 158(sp),d1
    64f6:	2001           	move.l d1,d0
    64f8:	e988           	lsl.l #4,d0
    64fa:	d081           	add.l d1,d0
    64fc:	d080           	add.l d0,d0
    64fe:	2040           	movea.l d0,a0
    6500:	41e8 0010      	lea 16(a0),a0
    6504:	202f 0096      	move.l 150(sp),d0
    6508:	d080           	add.l d0,d0
    650a:	2208           	move.l a0,d1
    650c:	d280           	add.l d0,d1
    650e:	7000           	moveq #0,d0
    6510:	302f 01c6      	move.w 454(sp),d0
    6514:	2f01           	move.l d1,-(sp)
    6516:	2f00           	move.l d0,-(sp)
    6518:	2f2f 01d0      	move.l 464(sp),-(sp)
    651c:	2f2f 0056      	move.l 86(sp),-(sp)
    6520:	4eba 05b4      	jsr 6ad6 <TestRow>(pc)
    6524:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6528:	702a           	moveq #42,d0
    652a:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    652e:	222f 009e      	move.l 158(sp),d1
    6532:	2001           	move.l d1,d0
    6534:	e988           	lsl.l #4,d0
    6536:	d081           	add.l d1,d0
    6538:	d080           	add.l d0,d0
    653a:	2040           	movea.l d0,a0
    653c:	41e8 0011      	lea 17(a0),a0
    6540:	202f 0096      	move.l 150(sp),d0
    6544:	d080           	add.l d0,d0
    6546:	2208           	move.l a0,d1
    6548:	d280           	add.l d0,d1
    654a:	7000           	moveq #0,d0
    654c:	302f 01c6      	move.w 454(sp),d0
    6550:	2f01           	move.l d1,-(sp)
    6552:	2f00           	move.l d0,-(sp)
    6554:	2f2f 01d0      	move.l 464(sp),-(sp)
    6558:	2f2f 0056      	move.l 86(sp),-(sp)
    655c:	4eba 0578      	jsr 6ad6 <TestRow>(pc)
    6560:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6564:	722a           	moveq #42,d1
    6566:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    656a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {
    656e:	52af 0096      	addq.l #1,150(sp)
    6572:	700f           	moveq #15,d0
    6574:	b0af 0096      	cmp.l 150(sp),d0
    6578:	6c00 ff78      	bge.w 64f2 <TestZoom4Picture+0x287e>
  for(int i=0;i<7;i++) {
    657c:	52af 009e      	addq.l #1,158(sp)
    6580:	7206           	moveq #6,d1
    6582:	b2af 009e      	cmp.l 158(sp),d1
    6586:	6c00 ff14      	bge.w 649c <TestZoom4Picture+0x2828>
    }
  }

  for(int i2=0;i2<2;i2++) {
    658a:	42af 0092      	clr.l 146(sp)
    658e:	6032           	bra.s 65c2 <TestZoom4Picture+0x294e>
    TestRow( valsupposed, valactual, mask, 251+i2);
    6590:	222f 0092      	move.l 146(sp),d1
    6594:	0681 0000 00fb 	addi.l #251,d1
    659a:	7000           	moveq #0,d0
    659c:	302f 01c6      	move.w 454(sp),d0
    65a0:	2f01           	move.l d1,-(sp)
    65a2:	2f00           	move.l d0,-(sp)
    65a4:	2f2f 01d0      	move.l 464(sp),-(sp)
    65a8:	2f2f 0056      	move.l 86(sp),-(sp)
    65ac:	4eba 0528      	jsr 6ad6 <TestRow>(pc)
    65b0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    65b4:	702a           	moveq #42,d0
    65b6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    65ba:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<2;i2++) {
    65be:	52af 0092      	addq.l #1,146(sp)
    65c2:	7201           	moveq #1,d1
    65c4:	b2af 0092      	cmp.l 146(sp),d1
    65c8:	6cc6           	bge.s 6590 <TestZoom4Picture+0x291c>
  }

  for(int i2=0;i2<8;i2++) {
    65ca:	42af 008e      	clr.l 142(sp)
    65ce:	6060           	bra.s 6630 <TestZoom4Picture+0x29bc>
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    65d0:	202f 008e      	move.l 142(sp),d0
    65d4:	d080           	add.l d0,d0
    65d6:	2200           	move.l d0,d1
    65d8:	0681 0000 00fd 	addi.l #253,d1
    65de:	7000           	moveq #0,d0
    65e0:	302f 01c6      	move.w 454(sp),d0
    65e4:	2f01           	move.l d1,-(sp)
    65e6:	2f00           	move.l d0,-(sp)
    65e8:	2f2f 01d0      	move.l 464(sp),-(sp)
    65ec:	2f2f 0056      	move.l 86(sp),-(sp)
    65f0:	4eba 04e4      	jsr 6ad6 <TestRow>(pc)
    65f4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    65f8:	702a           	moveq #42,d0
    65fa:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    65fe:	707f           	moveq #127,d0
    6600:	d0af 008e      	add.l 142(sp),d0
    6604:	d080           	add.l d0,d0
    6606:	2200           	move.l d0,d1
    6608:	7000           	moveq #0,d0
    660a:	302f 01c6      	move.w 454(sp),d0
    660e:	2f01           	move.l d1,-(sp)
    6610:	2f00           	move.l d0,-(sp)
    6612:	2f2f 01d0      	move.l 464(sp),-(sp)
    6616:	2f2f 0056      	move.l 86(sp),-(sp)
    661a:	4eba 04ba      	jsr 6ad6 <TestRow>(pc)
    661e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6622:	722a           	moveq #42,d1
    6624:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6628:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    662c:	52af 008e      	addq.l #1,142(sp)
    6630:	7007           	moveq #7,d0
    6632:	b0af 008e      	cmp.l 142(sp),d0
    6636:	6c98           	bge.s 65d0 <TestZoom4Picture+0x295c>
  }

  tmp = source;
    6638:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    663e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6644:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    664a:	4878 0001      	pea 1 <_start+0x1>
    664e:	4878 0010      	pea 10 <_start+0x10>
    6652:	2f2f 0056      	move.l 86(sp),-(sp)
    6656:	2f2f 006a      	move.l 106(sp),-(sp)
    665a:	4eba b406      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    665e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6662:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    6668:	2c40           	movea.l d0,a6
    666a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    666e:	222f 004e      	move.l 78(sp),d1
    6672:	5881           	addq.l #4,d1
    6674:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom17;
    6678:	2f7c 0000 bd14 	move.l #48404,74(sp)
    667e:	004a 

  mask = 0xffff;
    6680:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<5;i2++) {
    6686:	42af 008a      	clr.l 138(sp)
    668a:	605a           	bra.s 66e6 <TestZoom4Picture+0x2a72>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    668c:	202f 008a      	move.l 138(sp),d0
    6690:	d080           	add.l d0,d0
    6692:	2200           	move.l d0,d1
    6694:	7000           	moveq #0,d0
    6696:	302f 01c6      	move.w 454(sp),d0
    669a:	2f01           	move.l d1,-(sp)
    669c:	2f00           	move.l d0,-(sp)
    669e:	2f2f 01d0      	move.l 464(sp),-(sp)
    66a2:	2f2f 0056      	move.l 86(sp),-(sp)
    66a6:	4eba 042e      	jsr 6ad6 <TestRow>(pc)
    66aa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66ae:	702a           	moveq #42,d0
    66b0:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    66b4:	202f 008a      	move.l 138(sp),d0
    66b8:	d080           	add.l d0,d0
    66ba:	2200           	move.l d0,d1
    66bc:	5281           	addq.l #1,d1
    66be:	7000           	moveq #0,d0
    66c0:	302f 01c6      	move.w 454(sp),d0
    66c4:	2f01           	move.l d1,-(sp)
    66c6:	2f00           	move.l d0,-(sp)
    66c8:	2f2f 01d0      	move.l 464(sp),-(sp)
    66cc:	2f2f 0056      	move.l 86(sp),-(sp)
    66d0:	4eba 0404      	jsr 6ad6 <TestRow>(pc)
    66d4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66d8:	722a           	moveq #42,d1
    66da:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    66de:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {
    66e2:	52af 008a      	addq.l #1,138(sp)
    66e6:	7004           	moveq #4,d0
    66e8:	b0af 008a      	cmp.l 138(sp),d0
    66ec:	6c9e           	bge.s 668c <TestZoom4Picture+0x2a18>
  }

  for(int i=0;i<7;i++) {
    66ee:	42af 0086      	clr.l 134(sp)
    66f2:	6000 00d4      	bra.w 67c8 <TestZoom4Picture+0x2b54>
      TestRow( valsupposed, valactual, mask, 10+i*35);
    66f6:	222f 0086      	move.l 134(sp),d1
    66fa:	2001           	move.l d1,d0
    66fc:	e988           	lsl.l #4,d0
    66fe:	d081           	add.l d1,d0
    6700:	d080           	add.l d0,d0
    6702:	2040           	movea.l d0,a0
    6704:	d1c1           	adda.l d1,a0
    6706:	41e8 000a      	lea 10(a0),a0
    670a:	7000           	moveq #0,d0
    670c:	302f 01c6      	move.w 454(sp),d0
    6710:	2f08           	move.l a0,-(sp)
    6712:	2f00           	move.l d0,-(sp)
    6714:	2f2f 01d0      	move.l 464(sp),-(sp)
    6718:	2f2f 0056      	move.l 86(sp),-(sp)
    671c:	4eba 03b8      	jsr 6ad6 <TestRow>(pc)
    6720:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6724:	722a           	moveq #42,d1
    6726:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    672a:	466f 01c6      	not.w 454(sp)
    
    for(int i2=0;i2<17;i2++) {
    672e:	42af 0082      	clr.l 130(sp)
    6732:	6000 0086      	bra.w 67ba <TestZoom4Picture+0x2b46>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6736:	222f 0086      	move.l 134(sp),d1
    673a:	2001           	move.l d1,d0
    673c:	e988           	lsl.l #4,d0
    673e:	d081           	add.l d1,d0
    6740:	d080           	add.l d0,d0
    6742:	2040           	movea.l d0,a0
    6744:	d1c1           	adda.l d1,a0
    6746:	41e8 000b      	lea 11(a0),a0
    674a:	202f 0082      	move.l 130(sp),d0
    674e:	d080           	add.l d0,d0
    6750:	2208           	move.l a0,d1
    6752:	d280           	add.l d0,d1
    6754:	7000           	moveq #0,d0
    6756:	302f 01c6      	move.w 454(sp),d0
    675a:	2f01           	move.l d1,-(sp)
    675c:	2f00           	move.l d0,-(sp)
    675e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6762:	2f2f 0056      	move.l 86(sp),-(sp)
    6766:	4eba 036e      	jsr 6ad6 <TestRow>(pc)
    676a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    676e:	702a           	moveq #42,d0
    6770:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6774:	222f 0086      	move.l 134(sp),d1
    6778:	2001           	move.l d1,d0
    677a:	e988           	lsl.l #4,d0
    677c:	d081           	add.l d1,d0
    677e:	d080           	add.l d0,d0
    6780:	2040           	movea.l d0,a0
    6782:	d1c1           	adda.l d1,a0
    6784:	41e8 000c      	lea 12(a0),a0
    6788:	202f 0082      	move.l 130(sp),d0
    678c:	d080           	add.l d0,d0
    678e:	2208           	move.l a0,d1
    6790:	d280           	add.l d0,d1
    6792:	7000           	moveq #0,d0
    6794:	302f 01c6      	move.w 454(sp),d0
    6798:	2f01           	move.l d1,-(sp)
    679a:	2f00           	move.l d0,-(sp)
    679c:	2f2f 01d0      	move.l 464(sp),-(sp)
    67a0:	2f2f 0056      	move.l 86(sp),-(sp)
    67a4:	4eba 0330      	jsr 6ad6 <TestRow>(pc)
    67a8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    67ac:	722a           	moveq #42,d1
    67ae:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    67b2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<17;i2++) {
    67b6:	52af 0082      	addq.l #1,130(sp)
    67ba:	7010           	moveq #16,d0
    67bc:	b0af 0082      	cmp.l 130(sp),d0
    67c0:	6c00 ff74      	bge.w 6736 <TestZoom4Picture+0x2ac2>
  for(int i=0;i<7;i++) {
    67c4:	52af 0086      	addq.l #1,134(sp)
    67c8:	7206           	moveq #6,d1
    67ca:	b2af 0086      	cmp.l 134(sp),d1
    67ce:	6c00 ff26      	bge.w 66f6 <TestZoom4Picture+0x2a82>
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    67d2:	7000           	moveq #0,d0
    67d4:	302f 01c6      	move.w 454(sp),d0
    67d8:	4878 00ff      	pea ff <FreeDisplay+0x1f>
    67dc:	2f00           	move.l d0,-(sp)
    67de:	2f2f 01d0      	move.l 464(sp),-(sp)
    67e2:	2f2f 0056      	move.l 86(sp),-(sp)
    67e6:	4eba 02ee      	jsr 6ad6 <TestRow>(pc)
    67ea:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    67ee:	702a           	moveq #42,d0
    67f0:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    67f4:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<7;i2++) {
    67f8:	42af 007e      	clr.l 126(sp)
    67fc:	6064           	bra.s 6862 <TestZoom4Picture+0x2bee>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    67fe:	202f 007e      	move.l 126(sp),d0
    6802:	0680 0000 0080 	addi.l #128,d0
    6808:	d080           	add.l d0,d0
    680a:	2200           	move.l d0,d1
    680c:	7000           	moveq #0,d0
    680e:	302f 01c6      	move.w 454(sp),d0
    6812:	2f01           	move.l d1,-(sp)
    6814:	2f00           	move.l d0,-(sp)
    6816:	2f2f 01d0      	move.l 464(sp),-(sp)
    681a:	2f2f 0056      	move.l 86(sp),-(sp)
    681e:	4eba 02b6      	jsr 6ad6 <TestRow>(pc)
    6822:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6826:	722a           	moveq #42,d1
    6828:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    682c:	202f 007e      	move.l 126(sp),d0
    6830:	d080           	add.l d0,d0
    6832:	2200           	move.l d0,d1
    6834:	0681 0000 0101 	addi.l #257,d1
    683a:	7000           	moveq #0,d0
    683c:	302f 01c6      	move.w 454(sp),d0
    6840:	2f01           	move.l d1,-(sp)
    6842:	2f00           	move.l d0,-(sp)
    6844:	2f2f 01d0      	move.l 464(sp),-(sp)
    6848:	2f2f 0056      	move.l 86(sp),-(sp)
    684c:	4eba 0288      	jsr 6ad6 <TestRow>(pc)
    6850:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6854:	702a           	moveq #42,d0
    6856:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    685a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {
    685e:	52af 007e      	addq.l #1,126(sp)
    6862:	7206           	moveq #6,d1
    6864:	b2af 007e      	cmp.l 126(sp),d1
    6868:	6c94           	bge.s 67fe <TestZoom4Picture+0x2b8a>
  }   

  tmp = source;
    686a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6870:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6876:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    687c:	4878 0001      	pea 1 <_start+0x1>
    6880:	4878 0011      	pea 11 <_start+0x11>
    6884:	2f2f 0056      	move.l 86(sp),-(sp)
    6888:	2f2f 006a      	move.l 106(sp),-(sp)
    688c:	4eba b1d4      	jsr 1a62 <Zoom_ZoomIntoPicture>(pc)
    6890:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6894:	2039 0016 b9bc 	move.l 16b9bc <GfxBase>,d0
    689a:	2c40           	movea.l d0,a6
    689c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    68a0:	202f 004e      	move.l 78(sp),d0
    68a4:	5880           	addq.l #4,d0
    68a6:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom18;
    68aa:	2f7c 0000 bd40 	move.l #48448,74(sp)
    68b0:	004a 

  mask = 0xffff;
    68b2:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);
    68b8:	7000           	moveq #0,d0
    68ba:	302f 01c6      	move.w 454(sp),d0
    68be:	42a7           	clr.l -(sp)
    68c0:	2f00           	move.l d0,-(sp)
    68c2:	2f2f 01d0      	move.l 464(sp),-(sp)
    68c6:	2f2f 0056      	move.l 86(sp),-(sp)
    68ca:	4eba 020a      	jsr 6ad6 <TestRow>(pc)
    68ce:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    68d2:	722a           	moveq #42,d1
    68d4:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    68d8:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<4;i2++) {
    68dc:	42af 007a      	clr.l 122(sp)
    68e0:	605c           	bra.s 693e <TestZoom4Picture+0x2cca>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    68e2:	202f 007a      	move.l 122(sp),d0
    68e6:	d080           	add.l d0,d0
    68e8:	2200           	move.l d0,d1
    68ea:	5281           	addq.l #1,d1
    68ec:	7000           	moveq #0,d0
    68ee:	302f 01c6      	move.w 454(sp),d0
    68f2:	2f01           	move.l d1,-(sp)
    68f4:	2f00           	move.l d0,-(sp)
    68f6:	2f2f 01d0      	move.l 464(sp),-(sp)
    68fa:	2f2f 0056      	move.l 86(sp),-(sp)
    68fe:	4eba 01d6      	jsr 6ad6 <TestRow>(pc)
    6902:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6906:	702a           	moveq #42,d0
    6908:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    690c:	202f 007a      	move.l 122(sp),d0
    6910:	5280           	addq.l #1,d0
    6912:	d080           	add.l d0,d0
    6914:	2200           	move.l d0,d1
    6916:	7000           	moveq #0,d0
    6918:	302f 01c6      	move.w 454(sp),d0
    691c:	2f01           	move.l d1,-(sp)
    691e:	2f00           	move.l d0,-(sp)
    6920:	2f2f 01d0      	move.l 464(sp),-(sp)
    6924:	2f2f 0056      	move.l 86(sp),-(sp)
    6928:	4eba 01ac      	jsr 6ad6 <TestRow>(pc)
    692c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6930:	722a           	moveq #42,d1
    6932:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6936:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    693a:	52af 007a      	addq.l #1,122(sp)
    693e:	7003           	moveq #3,d0
    6940:	b0af 007a      	cmp.l 122(sp),d0
    6944:	6c9c           	bge.s 68e2 <TestZoom4Picture+0x2c6e>
  }

  for(int i=0;i<7;i++) {  
    6946:	42af 0076      	clr.l 118(sp)
    694a:	6000 009c      	bra.w 69e8 <TestZoom4Picture+0x2d74>
    for(int i2=0;i2<18;i2++) {
    694e:	42af 0072      	clr.l 114(sp)
    6952:	6000 0086      	bra.w 69da <TestZoom4Picture+0x2d66>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6956:	222f 0076      	move.l 118(sp),d1
    695a:	2001           	move.l d1,d0
    695c:	e988           	lsl.l #4,d0
    695e:	d081           	add.l d1,d0
    6960:	d080           	add.l d0,d0
    6962:	2040           	movea.l d0,a0
    6964:	d1c1           	adda.l d1,a0
    6966:	41e8 000b      	lea 11(a0),a0
    696a:	202f 0072      	move.l 114(sp),d0
    696e:	d080           	add.l d0,d0
    6970:	2208           	move.l a0,d1
    6972:	d280           	add.l d0,d1
    6974:	7000           	moveq #0,d0
    6976:	302f 01c6      	move.w 454(sp),d0
    697a:	2f01           	move.l d1,-(sp)
    697c:	2f00           	move.l d0,-(sp)
    697e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6982:	2f2f 0056      	move.l 86(sp),-(sp)
    6986:	4eba 014e      	jsr 6ad6 <TestRow>(pc)
    698a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    698e:	722a           	moveq #42,d1
    6990:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6994:	222f 0076      	move.l 118(sp),d1
    6998:	2001           	move.l d1,d0
    699a:	e988           	lsl.l #4,d0
    699c:	d081           	add.l d1,d0
    699e:	d080           	add.l d0,d0
    69a0:	2040           	movea.l d0,a0
    69a2:	d1c1           	adda.l d1,a0
    69a4:	41e8 000c      	lea 12(a0),a0
    69a8:	202f 0072      	move.l 114(sp),d0
    69ac:	d080           	add.l d0,d0
    69ae:	2208           	move.l a0,d1
    69b0:	d280           	add.l d0,d1
    69b2:	7000           	moveq #0,d0
    69b4:	302f 01c6      	move.w 454(sp),d0
    69b8:	2f01           	move.l d1,-(sp)
    69ba:	2f00           	move.l d0,-(sp)
    69bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    69c0:	2f2f 0056      	move.l 86(sp),-(sp)
    69c4:	4eba 0110      	jsr 6ad6 <TestRow>(pc)
    69c8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    69cc:	702a           	moveq #42,d0
    69ce:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    69d2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) {
    69d6:	52af 0072      	addq.l #1,114(sp)
    69da:	7211           	moveq #17,d1
    69dc:	b2af 0072      	cmp.l 114(sp),d1
    69e0:	6c00 ff74      	bge.w 6956 <TestZoom4Picture+0x2ce2>
  for(int i=0;i<7;i++) {  
    69e4:	52af 0076      	addq.l #1,118(sp)
    69e8:	7006           	moveq #6,d0
    69ea:	b0af 0076      	cmp.l 118(sp),d0
    69ee:	6c00 ff5e      	bge.w 694e <TestZoom4Picture+0x2cda>
    }
  } 

  for(int i2=0;i2<4;i2++) {
    69f2:	42af 006e      	clr.l 110(sp)
    69f6:	6064           	bra.s 6a5c <TestZoom4Picture+0x2de8>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    69f8:	202f 006e      	move.l 110(sp),d0
    69fc:	0680 0000 0080 	addi.l #128,d0
    6a02:	d080           	add.l d0,d0
    6a04:	2200           	move.l d0,d1
    6a06:	7000           	moveq #0,d0
    6a08:	302f 01c6      	move.w 454(sp),d0
    6a0c:	2f01           	move.l d1,-(sp)
    6a0e:	2f00           	move.l d0,-(sp)
    6a10:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a14:	2f2f 0056      	move.l 86(sp),-(sp)
    6a18:	4eba 00bc      	jsr 6ad6 <TestRow>(pc)
    6a1c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a20:	722a           	moveq #42,d1
    6a22:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6a26:	202f 006e      	move.l 110(sp),d0
    6a2a:	d080           	add.l d0,d0
    6a2c:	2200           	move.l d0,d1
    6a2e:	0681 0000 0101 	addi.l #257,d1
    6a34:	7000           	moveq #0,d0
    6a36:	302f 01c6      	move.w 454(sp),d0
    6a3a:	2f01           	move.l d1,-(sp)
    6a3c:	2f00           	move.l d0,-(sp)
    6a3e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a42:	2f2f 0056      	move.l 86(sp),-(sp)
    6a46:	4eba 008e      	jsr 6ad6 <TestRow>(pc)
    6a4a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a4e:	702a           	moveq #42,d0
    6a50:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6a54:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6a58:	52af 006e      	addq.l #1,110(sp)
    6a5c:	7203           	moveq #3,d1
    6a5e:	b2af 006e      	cmp.l 110(sp),d1
    6a62:	6c94           	bge.s 69f8 <TestZoom4Picture+0x2d84>
  }
  TestRow( valsupposed, valactual, mask, 0);
    6a64:	7000           	moveq #0,d0
    6a66:	302f 01c6      	move.w 454(sp),d0
    6a6a:	42a7           	clr.l -(sp)
    6a6c:	2f00           	move.l d0,-(sp)
    6a6e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a72:	2f2f 0056      	move.l 86(sp),-(sp)
    6a76:	4eba 005e      	jsr 6ad6 <TestRow>(pc)
    6a7a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6a7e:	702a           	moveq #42,d0
    6a80:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6a84:	466f 01c6      	not.w 454(sp)
  FreeMem( source, (ZMLINESIZE+4)*272);
    6a88:	2f6f 005e 0042 	move.l 94(sp),66(sp)
    6a8e:	2f7c 0000 30e0 	move.l #12512,62(sp)
    6a94:	003e 
    6a96:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    6a9c:	2c40           	movea.l d0,a6
    6a9e:	226f 0042      	movea.l 66(sp),a1
    6aa2:	202f 003e      	move.l 62(sp),d0
    6aa6:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    6aaa:	2f6f 004e 003a 	move.l 78(sp),58(sp)
    6ab0:	2f7c 0000 30e0 	move.l #12512,54(sp)
    6ab6:	0036 
    6ab8:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    6abe:	2c40           	movea.l d0,a6
    6ac0:	226f 003a      	movea.l 58(sp),a1
    6ac4:	202f 0036      	move.l 54(sp),d0
    6ac8:	4eae ff2e      	jsr -210(a6)
}
    6acc:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    6ad0:	4fef 01d0      	lea 464(sp),sp
    6ad4:	4e75           	rts

00006ad6 <TestRow>:

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    6ad6:	4fef ff40      	lea -192(sp),sp
    6ada:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
    6ade:	202f 00e0      	move.l 224(sp),d0
    6ae2:	3000           	move.w d0,d0
    6ae4:	3f40 0016      	move.w d0,22(sp)
  
  char str[ 100] = { 0 };
    6ae8:	42af 001c      	clr.l 28(sp)
    6aec:	7020           	moveq #32,d0
    6aee:	d08f           	add.l sp,d0
    6af0:	7260           	moveq #96,d1
    6af2:	2f01           	move.l d1,-(sp)
    6af4:	42a7           	clr.l -(sp)
    6af6:	2f00           	move.l d0,-(sp)
    6af8:	4eba 020c      	jsr 6d06 <memset>(pc)
    6afc:	4fef 000c      	lea 12(sp),sp
  UWORD data[2];
  data[1] = numberofline;
    6b00:	202f 00e4      	move.l 228(sp),d0
    6b04:	3f40 001a      	move.w d0,26(sp)

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    6b08:	42af 00d0      	clr.l 208(sp)
    6b0c:	6000 00d4      	bra.w 6be2 <TestRow+0x10c>
    if( (*testpattern++ ^ xormask) != *destination++) {
    6b10:	202f 00d8      	move.l 216(sp),d0
    6b14:	2200           	move.l d0,d1
    6b16:	5481           	addq.l #2,d1
    6b18:	2f41 00d8      	move.l d1,216(sp)
    6b1c:	2040           	movea.l d0,a0
    6b1e:	3010           	move.w (a0),d0
    6b20:	322f 0016      	move.w 22(sp),d1
    6b24:	b141           	eor.w d0,d1
    6b26:	202f 00dc      	move.l 220(sp),d0
    6b2a:	2400           	move.l d0,d2
    6b2c:	5482           	addq.l #2,d2
    6b2e:	2f42 00dc      	move.l d2,220(sp)
    6b32:	2040           	movea.l d0,a0
    6b34:	3010           	move.w (a0),d0
    6b36:	b041           	cmp.w d1,d0
    6b38:	6700 00a4      	beq.w 6bde <TestRow+0x108>
      data[0] = i;
    6b3c:	202f 00d0      	move.l 208(sp),d0
    6b40:	3f40 0018      	move.w d0,24(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    6b44:	2f7c 0000 843f 	move.l #33855,164(sp)
    6b4a:	00a4 
    6b4c:	702b           	moveq #43,d0
    6b4e:	4600           	not.b d0
    6b50:	d08f           	add.l sp,d0
    6b52:	0680 ffff ff44 	addi.l #-188,d0
    6b58:	2f40 00a0      	move.l d0,160(sp)
    6b5c:	2f7c 0000 71a4 	move.l #29092,156(sp)
    6b62:	009c 
    6b64:	722b           	moveq #43,d1
    6b66:	4601           	not.b d1
    6b68:	d28f           	add.l sp,d1
    6b6a:	0681 ffff ff48 	addi.l #-184,d1
    6b70:	2f41 0098      	move.l d1,152(sp)
    6b74:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    6b7a:	2c40           	movea.l d0,a6
    6b7c:	206f 00a4      	movea.l 164(sp),a0
    6b80:	226f 00a0      	movea.l 160(sp),a1
    6b84:	246f 009c      	movea.l 156(sp),a2
    6b88:	266f 0098      	movea.l 152(sp),a3
    6b8c:	4eae fdf6      	jsr -522(a6)
    6b90:	2f40 0094      	move.l d0,148(sp)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    6b94:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    6b9a:	2c40           	movea.l d0,a6
    6b9c:	4eae ffc4      	jsr -60(a6)
    6ba0:	2f40 0090      	move.l d0,144(sp)
    6ba4:	202f 0090      	move.l 144(sp),d0
    6ba8:	2f40 008c      	move.l d0,140(sp)
    6bac:	742b           	moveq #43,d2
    6bae:	4602           	not.b d2
    6bb0:	d48f           	add.l sp,d2
    6bb2:	0682 ffff ff48 	addi.l #-184,d2
    6bb8:	2f42 0088      	move.l d2,136(sp)
    6bbc:	7064           	moveq #100,d0
    6bbe:	2f40 0084      	move.l d0,132(sp)
    6bc2:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    6bc8:	2c40           	movea.l d0,a6
    6bca:	222f 008c      	move.l 140(sp),d1
    6bce:	242f 0088      	move.l 136(sp),d2
    6bd2:	262f 0084      	move.l 132(sp),d3
    6bd6:	4eae ffd0      	jsr -48(a6)
    6bda:	2f40 0080      	move.l d0,128(sp)
  for(int i=0;i<21;i++) {
    6bde:	52af 00d0      	addq.l #1,208(sp)
    6be2:	7214           	moveq #20,d1
    6be4:	b2af 00d0      	cmp.l 208(sp),d1
    6be8:	6c00 ff26      	bge.w 6b10 <TestRow+0x3a>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    6bec:	206f 00d8      	movea.l 216(sp),a0
    6bf0:	3010           	move.w (a0),d0
    6bf2:	322f 0016      	move.w 22(sp),d1
    6bf6:	b141           	eor.w d0,d1
    6bf8:	206f 00dc      	movea.l 220(sp),a0
    6bfc:	3010           	move.w (a0),d0
    6bfe:	b340           	eor.w d1,d0
    6c00:	3000           	move.w d0,d0
    6c02:	0280 0000 ffff 	andi.l #65535,d0
    6c08:	0280 0000 ff00 	andi.l #65280,d0
    6c0e:	6700 00cc      	beq.w 6cdc <TestRow+0x206>
    data[0] = 21;
    6c12:	3f7c 0015 0018 	move.w #21,24(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    6c18:	2f7c 0000 843f 	move.l #33855,204(sp)
    6c1e:	00cc 
    6c20:	742b           	moveq #43,d2
    6c22:	4602           	not.b d2
    6c24:	d48f           	add.l sp,d2
    6c26:	0682 ffff ff44 	addi.l #-188,d2
    6c2c:	2f42 00c8      	move.l d2,200(sp)
    6c30:	2f7c 0000 71a4 	move.l #29092,196(sp)
    6c36:	00c4 
    6c38:	702b           	moveq #43,d0
    6c3a:	4600           	not.b d0
    6c3c:	d08f           	add.l sp,d0
    6c3e:	0680 ffff ff48 	addi.l #-184,d0
    6c44:	2f40 00c0      	move.l d0,192(sp)
    6c48:	2039 0016 b9b0 	move.l 16b9b0 <SysBase>,d0
    6c4e:	2c40           	movea.l d0,a6
    6c50:	206f 00cc      	movea.l 204(sp),a0
    6c54:	226f 00c8      	movea.l 200(sp),a1
    6c58:	246f 00c4      	movea.l 196(sp),a2
    6c5c:	266f 00c0      	movea.l 192(sp),a3
    6c60:	4eae fdf6      	jsr -522(a6)
    6c64:	2f40 00bc      	move.l d0,188(sp)
                                                                           str);
    Write(  Output(), str, 100);
    6c68:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    6c6e:	2c40           	movea.l d0,a6
    6c70:	4eae ffc4      	jsr -60(a6)
    6c74:	2f40 00b8      	move.l d0,184(sp)
    6c78:	202f 00b8      	move.l 184(sp),d0
    6c7c:	2f40 00b4      	move.l d0,180(sp)
    6c80:	722b           	moveq #43,d1
    6c82:	4601           	not.b d1
    6c84:	d28f           	add.l sp,d1
    6c86:	0681 ffff ff48 	addi.l #-184,d1
    6c8c:	2f41 00b0      	move.l d1,176(sp)
    6c90:	7464           	moveq #100,d2
    6c92:	2f42 00ac      	move.l d2,172(sp)
    6c96:	2039 0016 b9b8 	move.l 16b9b8 <DOSBase>,d0
    6c9c:	2c40           	movea.l d0,a6
    6c9e:	222f 00b4      	move.l 180(sp),d1
    6ca2:	242f 00b0      	move.l 176(sp),d2
    6ca6:	262f 00ac      	move.l 172(sp),d3
    6caa:	4eae ffd0      	jsr -48(a6)
    6cae:	2f40 00a8      	move.l d0,168(sp)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
    6cb2:	206f 00dc      	movea.l 220(sp),a0
    6cb6:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6cb8:	7200           	moveq #0,d1
    6cba:	3200           	move.w d0,d1
                                                   *testpattern,*destination);
    6cbc:	206f 00d8      	movea.l 216(sp),a0
    6cc0:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6cc2:	3000           	move.w d0,d0
    6cc4:	0280 0000 ffff 	andi.l #65535,d0
    6cca:	2f01           	move.l d1,-(sp)
    6ccc:	2f00           	move.l d0,-(sp)
    6cce:	4879 0000 846f 	pea 846f <incbin_swfont_end+0x83b>
    6cd4:	4eba 0162      	jsr 6e38 <KPrintF>(pc)
    6cd8:	4fef 000c      	lea 12(sp),sp
     
  }
}
    6cdc:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    6ce0:	4fef 00c0      	lea 192(sp),sp
    6ce4:	4e75           	rts

00006ce6 <strlen>:
{
    6ce6:	598f           	subq.l #4,sp
	unsigned long t=0;
    6ce8:	4297           	clr.l (sp)
    6cea:	6002           	bra.s 6cee <strlen+0x8>
		t++;
    6cec:	5297           	addq.l #1,(sp)
	while(*s++)
    6cee:	202f 0008      	move.l 8(sp),d0
    6cf2:	2200           	move.l d0,d1
    6cf4:	5281           	addq.l #1,d1
    6cf6:	2f41 0008      	move.l d1,8(sp)
    6cfa:	2040           	movea.l d0,a0
    6cfc:	1010           	move.b (a0),d0
    6cfe:	66ec           	bne.s 6cec <strlen+0x6>
	return t;
    6d00:	2017           	move.l (sp),d0
}
    6d02:	588f           	addq.l #4,sp
    6d04:	4e75           	rts

00006d06 <memset>:
{
    6d06:	4e55 fffc      	link.w a5,#-4
	unsigned char *ptr = (unsigned char *)dest;
    6d0a:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
    6d10:	6014           	bra.s 6d26 <memset+0x20>
		*ptr++ = val;
    6d12:	202d fffc      	move.l -4(a5),d0
    6d16:	2200           	move.l d0,d1
    6d18:	5281           	addq.l #1,d1
    6d1a:	2b41 fffc      	move.l d1,-4(a5)
    6d1e:	222d 000c      	move.l 12(a5),d1
    6d22:	2040           	movea.l d0,a0
    6d24:	1081           	move.b d1,(a0)
	while(len-- > 0)
    6d26:	202d 0010      	move.l 16(a5),d0
    6d2a:	2200           	move.l d0,d1
    6d2c:	5381           	subq.l #1,d1
    6d2e:	2b41 0010      	move.l d1,16(a5)
    6d32:	4a80           	tst.l d0
    6d34:	66dc           	bne.s 6d12 <memset+0xc>
	return dest;
    6d36:	202d 0008      	move.l 8(a5),d0
}
    6d3a:	4e5d           	unlk a5
    6d3c:	4e75           	rts

00006d3e <memcpy>:
{
    6d3e:	4e55 fff8      	link.w a5,#-8
    6d42:	2f02           	move.l d2,-(sp)
	char *d = (char *)dest;
    6d44:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = (const char *)src;
    6d4a:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
    6d50:	6020           	bra.s 6d72 <memcpy+0x34>
		*d++ = *s++;
    6d52:	222d fff8      	move.l -8(a5),d1
    6d56:	2001           	move.l d1,d0
    6d58:	5280           	addq.l #1,d0
    6d5a:	2b40 fff8      	move.l d0,-8(a5)
    6d5e:	202d fffc      	move.l -4(a5),d0
    6d62:	2400           	move.l d0,d2
    6d64:	5282           	addq.l #1,d2
    6d66:	2b42 fffc      	move.l d2,-4(a5)
    6d6a:	2041           	movea.l d1,a0
    6d6c:	1210           	move.b (a0),d1
    6d6e:	2040           	movea.l d0,a0
    6d70:	1081           	move.b d1,(a0)
	while(len--)
    6d72:	202d 0010      	move.l 16(a5),d0
    6d76:	2200           	move.l d0,d1
    6d78:	5381           	subq.l #1,d1
    6d7a:	2b41 0010      	move.l d1,16(a5)
    6d7e:	4a80           	tst.l d0
    6d80:	66d0           	bne.s 6d52 <memcpy+0x14>
	return dest;
    6d82:	202d 0008      	move.l 8(a5),d0
}
    6d86:	241f           	move.l (sp)+,d2
    6d88:	4e5d           	unlk a5
    6d8a:	4e75           	rts

00006d8c <memmove>:
{
    6d8c:	4e55 fff0      	link.w a5,#-16
    6d90:	2f02           	move.l d2,-(sp)
	char *d = dest;
    6d92:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = src;
    6d98:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
	if (d < s) {
    6d9e:	202d fffc      	move.l -4(a5),d0
    6da2:	b0ad fff8      	cmp.l -8(a5),d0
    6da6:	6522           	bcs.s 6dca <memmove+0x3e>
    6da8:	6032           	bra.s 6ddc <memmove+0x50>
			*d++ = *s++;
    6daa:	222d fff8      	move.l -8(a5),d1
    6dae:	2401           	move.l d1,d2
    6db0:	5282           	addq.l #1,d2
    6db2:	2b42 fff8      	move.l d2,-8(a5)
    6db6:	202d fffc      	move.l -4(a5),d0
    6dba:	2400           	move.l d0,d2
    6dbc:	5282           	addq.l #1,d2
    6dbe:	2b42 fffc      	move.l d2,-4(a5)
    6dc2:	2041           	movea.l d1,a0
    6dc4:	1210           	move.b (a0),d1
    6dc6:	2040           	movea.l d0,a0
    6dc8:	1081           	move.b d1,(a0)
		while (len--)
    6dca:	202d 0010      	move.l 16(a5),d0
    6dce:	2200           	move.l d0,d1
    6dd0:	5381           	subq.l #1,d1
    6dd2:	2b41 0010      	move.l d1,16(a5)
    6dd6:	4a80           	tst.l d0
    6dd8:	66d0           	bne.s 6daa <memmove+0x1e>
    6dda:	6052           	bra.s 6e2e <memmove+0xa2>
		const char *lasts = s + (len - 1);
    6ddc:	202d 0010      	move.l 16(a5),d0
    6de0:	5380           	subq.l #1,d0
    6de2:	242d fff8      	move.l -8(a5),d2
    6de6:	d480           	add.l d0,d2
    6de8:	2b42 fff4      	move.l d2,-12(a5)
		char *lastd = d + (len - 1);
    6dec:	202d 0010      	move.l 16(a5),d0
    6df0:	5380           	subq.l #1,d0
    6df2:	222d fffc      	move.l -4(a5),d1
    6df6:	d280           	add.l d0,d1
    6df8:	2b41 fff0      	move.l d1,-16(a5)
    6dfc:	6020           	bra.s 6e1e <memmove+0x92>
			*lastd-- = *lasts--;
    6dfe:	222d fff4      	move.l -12(a5),d1
    6e02:	2401           	move.l d1,d2
    6e04:	5382           	subq.l #1,d2
    6e06:	2b42 fff4      	move.l d2,-12(a5)
    6e0a:	202d fff0      	move.l -16(a5),d0
    6e0e:	2400           	move.l d0,d2
    6e10:	5382           	subq.l #1,d2
    6e12:	2b42 fff0      	move.l d2,-16(a5)
    6e16:	2041           	movea.l d1,a0
    6e18:	1210           	move.b (a0),d1
    6e1a:	2040           	movea.l d0,a0
    6e1c:	1081           	move.b d1,(a0)
		while (len--)
    6e1e:	202d 0010      	move.l 16(a5),d0
    6e22:	2200           	move.l d0,d1
    6e24:	5381           	subq.l #1,d1
    6e26:	2b41 0010      	move.l d1,16(a5)
    6e2a:	4a80           	tst.l d0
    6e2c:	66d0           	bne.s 6dfe <memmove+0x72>
	return dest;
    6e2e:	202d 0008      	move.l 8(a5),d0
}
    6e32:	241f           	move.l (sp)+,d2
    6e34:	4e5d           	unlk a5
    6e36:	4e75           	rts

00006e38 <KPrintF>:
{
    6e38:	4fef ff80      	lea -128(sp),sp
    6e3c:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    6e40:	3039 00f0 ff60 	move.w f0ff60 <_end+0xda455c>,d0
    6e46:	0c40 4eb9      	cmpi.w #20153,d0
    6e4a:	6722           	beq.s 6e6e <KPrintF+0x36>
    6e4c:	0c40 a00e      	cmpi.w #-24562,d0
    6e50:	671c           	beq.s 6e6e <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    6e52:	2c79 0016 b9b0 	movea.l 16b9b0 <SysBase>,a6
    6e58:	206f 0090      	movea.l 144(sp),a0
    6e5c:	43ef 0094      	lea 148(sp),a1
    6e60:	45f9 0000 7196 	lea 7196 <KPutCharX>,a2
    6e66:	97cb           	suba.l a3,a3
    6e68:	4eae fdf6      	jsr -522(a6)
    6e6c:	602a           	bra.s 6e98 <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    6e6e:	2c79 0016 b9b0 	movea.l 16b9b0 <SysBase>,a6
    6e74:	206f 0090      	movea.l 144(sp),a0
    6e78:	43ef 0094      	lea 148(sp),a1
    6e7c:	45f9 0000 71a4 	lea 71a4 <PutChar>,a2
    6e82:	47ef 000c      	lea 12(sp),a3
    6e86:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    6e8a:	2f0b           	move.l a3,-(sp)
    6e8c:	4878 0056      	pea 56 <_start+0x56>
    6e90:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xda455c>
    6e96:	508f           	addq.l #8,sp
}
    6e98:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    6e9c:	4fef 0080      	lea 128(sp),sp
    6ea0:	4e75           	rts

00006ea2 <warpmode>:

void warpmode(int on) // bool
{
    6ea2:	518f           	subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
    6ea4:	2f7c 00f0 ff60 	move.l #15794016,4(sp)
    6eaa:	0004 
    if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
    6eac:	206f 0004      	movea.l 4(sp),a0
    6eb0:	3010           	move.w (a0),d0
    6eb2:	0c40 4eb9      	cmpi.w #20153,d0
    6eb6:	670c           	beq.s 6ec4 <warpmode+0x22>
    6eb8:	206f 0004      	movea.l 4(sp),a0
    6ebc:	3010           	move.w (a0),d0
    6ebe:	0c40 a00e      	cmpi.w #-24562,d0
    6ec2:	6668           	bne.s 6f2c <warpmode+0x8a>
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    6ec4:	4aaf 000c      	tst.l 12(sp)
    6ec8:	6708           	beq.s 6ed2 <warpmode+0x30>
    6eca:	203c 0000 8495 	move.l #33941,d0
    6ed0:	6006           	bra.s 6ed8 <warpmode+0x36>
    6ed2:	203c 0000 849f 	move.l #33951,d0
    6ed8:	4878 0001      	pea 1 <_start+0x1>
    6edc:	220f           	move.l sp,d1
    6ede:	5e81           	addq.l #7,d1
    6ee0:	2f01           	move.l d1,-(sp)
    6ee2:	42a7           	clr.l -(sp)
    6ee4:	2f00           	move.l d0,-(sp)
    6ee6:	4878 ffff      	pea ffffffff <_end+0xffe945fb>
    6eea:	4878 0052      	pea 52 <_start+0x52>
    6eee:	206f 001c      	movea.l 28(sp),a0
    6ef2:	4e90           	jsr (a0)
    6ef4:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    6ef8:	4aaf 000c      	tst.l 12(sp)
    6efc:	6708           	beq.s 6f06 <warpmode+0x64>
    6efe:	203c 0000 84aa 	move.l #33962,d0
    6f04:	6006           	bra.s 6f0c <warpmode+0x6a>
    6f06:	203c 0000 84c4 	move.l #33988,d0
    6f0c:	4878 0001      	pea 1 <_start+0x1>
    6f10:	220f           	move.l sp,d1
    6f12:	5e81           	addq.l #7,d1
    6f14:	2f01           	move.l d1,-(sp)
    6f16:	42a7           	clr.l -(sp)
    6f18:	2f00           	move.l d0,-(sp)
    6f1a:	4878 ffff      	pea ffffffff <_end+0xffe945fb>
    6f1e:	4878 0052      	pea 52 <_start+0x52>
    6f22:	206f 001c      	movea.l 28(sp),a0
    6f26:	4e90           	jsr (a0)
    6f28:	4fef 0018      	lea 24(sp),sp
	}
}
    6f2c:	508f           	addq.l #8,sp
    6f2e:	4e75           	rts

00006f30 <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4)
{
    6f30:	598f           	subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
    6f32:	2ebc 00f0 ff60 	move.l #15794016,(sp)
    if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    6f38:	2057           	movea.l (sp),a0
    6f3a:	3010           	move.w (a0),d0
    6f3c:	0c40 4eb9      	cmpi.w #20153,d0
    6f40:	670a           	beq.s 6f4c <debug_cmd+0x1c>
    6f42:	2057           	movea.l (sp),a0
    6f44:	3010           	move.w (a0),d0
    6f46:	0c40 a00e      	cmpi.w #-24562,d0
    6f4a:	661e           	bne.s 6f6a <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
    6f4c:	2f2f 0014      	move.l 20(sp),-(sp)
    6f50:	2f2f 0014      	move.l 20(sp),-(sp)
    6f54:	2f2f 0014      	move.l 20(sp),-(sp)
    6f58:	2f2f 0014      	move.l 20(sp),-(sp)
    6f5c:	4878 0058      	pea 58 <_start+0x58>
    6f60:	206f 0014      	movea.l 20(sp),a0
    6f64:	4e90           	jsr (a0)
    6f66:	4fef 0014      	lea 20(sp),sp
	}
}
    6f6a:	588f           	addq.l #4,sp
    6f6c:	4e75           	rts

00006f6e <debug_clear>:
	barto_cmd_text,
};

void debug_clear()
{
	debug_cmd(barto_cmd_clear, 0, 0, 0);
    6f6e:	42a7           	clr.l -(sp)
    6f70:	42a7           	clr.l -(sp)
    6f72:	42a7           	clr.l -(sp)
    6f74:	42a7           	clr.l -(sp)
    6f76:	4eba ffb8      	jsr 6f30 <debug_cmd>(pc)
    6f7a:	4fef 0010      	lea 16(sp),sp
}
    6f7e:	4e75           	rts

00006f80 <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color)
{
    6f80:	518f           	subq.l #8,sp
    6f82:	2f02           	move.l d2,-(sp)
    6f84:	226f 0010      	movea.l 16(sp),a1
    6f88:	206f 0014      	movea.l 20(sp),a0
    6f8c:	222f 0018      	move.l 24(sp),d1
    6f90:	202f 001c      	move.l 28(sp),d0
    6f94:	3249           	movea.w a1,a1
    6f96:	3f49 000a      	move.w a1,10(sp)
    6f9a:	3048           	movea.w a0,a0
    6f9c:	3f48 0008      	move.w a0,8(sp)
    6fa0:	3201           	move.w d1,d1
    6fa2:	3f41 0006      	move.w d1,6(sp)
    6fa6:	3000           	move.w d0,d0
    6fa8:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    6fac:	302f 0006      	move.w 6(sp),d0
    6fb0:	48c0           	ext.l d0
    6fb2:	4840           	swap d0
    6fb4:	4240           	clr.w d0
    6fb6:	322f 0004      	move.w 4(sp),d1
    6fba:	48c1           	ext.l d1
    6fbc:	8280           	or.l d0,d1
    6fbe:	302f 000a      	move.w 10(sp),d0
    6fc2:	48c0           	ext.l d0
    6fc4:	4840           	swap d0
    6fc6:	4240           	clr.w d0
    6fc8:	306f 0008      	movea.w 8(sp),a0
    6fcc:	2408           	move.l a0,d2
    6fce:	8082           	or.l d2,d0
    6fd0:	2f2f 0020      	move.l 32(sp),-(sp)
    6fd4:	2f01           	move.l d1,-(sp)
    6fd6:	2f00           	move.l d0,-(sp)
    6fd8:	4878 0001      	pea 1 <_start+0x1>
    6fdc:	4eba ff52      	jsr 6f30 <debug_cmd>(pc)
    6fe0:	4fef 0010      	lea 16(sp),sp
}
    6fe4:	241f           	move.l (sp)+,d2
    6fe6:	508f           	addq.l #8,sp
    6fe8:	4e75           	rts

00006fea <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color)
{
    6fea:	518f           	subq.l #8,sp
    6fec:	2f02           	move.l d2,-(sp)
    6fee:	226f 0010      	movea.l 16(sp),a1
    6ff2:	206f 0014      	movea.l 20(sp),a0
    6ff6:	222f 0018      	move.l 24(sp),d1
    6ffa:	202f 001c      	move.l 28(sp),d0
    6ffe:	3249           	movea.w a1,a1
    7000:	3f49 000a      	move.w a1,10(sp)
    7004:	3048           	movea.w a0,a0
    7006:	3f48 0008      	move.w a0,8(sp)
    700a:	3201           	move.w d1,d1
    700c:	3f41 0006      	move.w d1,6(sp)
    7010:	3000           	move.w d0,d0
    7012:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    7016:	302f 0006      	move.w 6(sp),d0
    701a:	48c0           	ext.l d0
    701c:	4840           	swap d0
    701e:	4240           	clr.w d0
    7020:	322f 0004      	move.w 4(sp),d1
    7024:	48c1           	ext.l d1
    7026:	8280           	or.l d0,d1
    7028:	302f 000a      	move.w 10(sp),d0
    702c:	48c0           	ext.l d0
    702e:	4840           	swap d0
    7030:	4240           	clr.w d0
    7032:	306f 0008      	movea.w 8(sp),a0
    7036:	2408           	move.l a0,d2
    7038:	8082           	or.l d2,d0
    703a:	2f2f 0020      	move.l 32(sp),-(sp)
    703e:	2f01           	move.l d1,-(sp)
    7040:	2f00           	move.l d0,-(sp)
    7042:	4878 0002      	pea 2 <_start+0x2>
    7046:	4eba fee8      	jsr 6f30 <debug_cmd>(pc)
    704a:	4fef 0010      	lea 16(sp),sp
}
    704e:	241f           	move.l (sp)+,d2
    7050:	508f           	addq.l #8,sp
    7052:	4e75           	rts

00007054 <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color)
{
    7054:	598f           	subq.l #4,sp
    7056:	2f02           	move.l d2,-(sp)
    7058:	222f 000c      	move.l 12(sp),d1
    705c:	202f 0010      	move.l 16(sp),d0
    7060:	3201           	move.w d1,d1
    7062:	3f41 0006      	move.w d1,6(sp)
    7066:	3000           	move.w d0,d0
    7068:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
    706c:	202f 0014      	move.l 20(sp),d0
    7070:	322f 0006      	move.w 6(sp),d1
    7074:	48c1           	ext.l d1
    7076:	4841           	swap d1
    7078:	4241           	clr.w d1
    707a:	306f 0004      	movea.w 4(sp),a0
    707e:	2408           	move.l a0,d2
    7080:	8282           	or.l d2,d1
    7082:	2f2f 0018      	move.l 24(sp),-(sp)
    7086:	2f00           	move.l d0,-(sp)
    7088:	2f01           	move.l d1,-(sp)
    708a:	4878 0003      	pea 3 <_start+0x3>
    708e:	4eba fea0      	jsr 6f30 <debug_cmd>(pc)
    7092:	4fef 0010      	lea 16(sp),sp
}
    7096:	241f           	move.l (sp)+,d2
    7098:	588f           	addq.l #4,sp
    709a:	4e75           	rts

0000709c <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    709c:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    70a0:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    70a4:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    70a8:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    70ac:	d041           	add.w d1,d0
	swap	d0
    70ae:	4840           	swap d0
	clrw	d0
    70b0:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    70b2:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    70b6:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    70ba:	d081           	add.l d1,d0
	rts
    70bc:	4e75           	rts

000070be <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    70be:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    70c0:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    70c4:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    70c8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    70ce:	6416           	bcc.s 70e6 <__udivsi3+0x28>
	movel	d0, d2
    70d0:	2400           	move.l d0,d2
	clrw	d2
    70d2:	4242           	clr.w d2
	swap	d2
    70d4:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    70d6:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    70d8:	3002           	move.w d2,d0
	swap	d0
    70da:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    70dc:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    70e0:	84c1           	divu.w d1,d2
	movew	d2, d0
    70e2:	3002           	move.w d2,d0
	jra	6f
    70e4:	6030           	bra.s 7116 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    70e6:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    70e8:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    70ea:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    70ec:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    70f2:	64f4           	bcc.s 70e8 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    70f4:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    70f6:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    70fc:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    70fe:	c2c0           	mulu.w d0,d1
	swap	d2
    7100:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    7102:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    7104:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    7106:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    7108:	660a           	bne.s 7114 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    710a:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    710c:	6506           	bcs.s 7114 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    710e:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    7112:	6302           	bls.s 7116 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    7114:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    7116:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    7118:	4e75           	rts

0000711a <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    711a:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    711c:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    711e:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    7122:	6a04           	bpl.s 7128 <__divsi3+0xe>
	negl	d1
    7124:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    7126:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    7128:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    712c:	6a04           	bpl.s 7132 <__divsi3+0x18>
	negl	d0
    712e:	4480           	neg.l d0
	negb	d2
    7130:	4402           	neg.b d2

2:	movel	d1, sp@-
    7132:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    7134:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    7136:	6186           	bsr.s 70be <__udivsi3>
	addql	IMM (8), sp
    7138:	508f           	addq.l #8,sp

	tstb	d2
    713a:	4a02           	tst.b d2
	jpl	3f
    713c:	6a02           	bpl.s 7140 <__divsi3+0x26>
	negl	d0
    713e:	4480           	neg.l d0

3:	movel	sp@+, d2
    7140:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    7142:	4e75           	rts

00007144 <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    7144:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7148:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    714c:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    714e:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    7150:	61c8           	bsr.s 711a <__divsi3>
	addql	IMM (8), sp
    7152:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    7154:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    7158:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    715a:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    715c:	6100 ff3e      	bsr.w 709c <__mulsi3>
	addql	IMM (8), sp
    7160:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    7162:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    7166:	9280           	sub.l d0,d1
	movel	d1, d0
    7168:	2001           	move.l d1,d0
	rts
    716a:	4e75           	rts

0000716c <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    716c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7170:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    7174:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7176:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    7178:	6100 ff44      	bsr.w 70be <__udivsi3>
	addql	IMM (8), sp
    717c:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    717e:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    7182:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7184:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    7186:	6100 ff14      	bsr.w 709c <__mulsi3>
	addql	IMM (8), sp
    718a:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    718c:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    7190:	9280           	sub.l d0,d1
	movel	d1, d0
    7192:	2001           	move.l d1,d0
	rts
    7194:	4e75           	rts

00007196 <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    7196:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    7198:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    719c:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    71a0:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    71a2:	4e75           	rts

000071a4 <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    71a4:	16c0           	move.b d0,(a3)+
	rts
    71a6:	4e75           	rts

000071a8 <c2p1x1_8_c5_gen_init>:
	.text
	FUNC(c2p1x1_8_c5_gen_init)
	.globl	SYM (c2p1x1_8_c5_gen_init)

SYM(c2p1x1_8_c5_gen_init):
	movem.l d0-d7/a0-a6, .gi_saveregs	
    71a8:	48f9 7fff 0000 	movem.l d0-a6,71e8 <.gi_saveregs>
    71ae:	71e8 
	move.l  4(sp),d0
    71b0:	202f 0004      	move.l 4(sp),d0
	move.l	8(sp),d1
    71b4:	222f 0008      	move.l 8(sp),d1
	move.l	12(sp),d2
    71b8:	242f 000c      	move.l 12(sp),d2
	move.l	16(sp),d3
    71bc:	262f 0010      	move.l 16(sp),d3
	move.l  20(sp),d4
    71c0:	282f 0014      	move.l 20(sp),d4
	move.l	24(sp),d5
    71c4:	2a2f 0018      	move.l 24(sp),d5
	andi.l	IMM (0xffff),d0
    71c8:	0280 0000 ffff 	andi.l #65535,d0
	mulu.w	d0,d3
    71ce:	c6c0           	mulu.w d0,d3
	lsr.l	#3,d3
    71d0:	e68b           	lsr.l #3,d3
	move.l	d3,c2p1x1_8_c5_gen_scroffs
    71d2:	23c3 0000 753e 	move.l d3,753e <c2p1x1_8_c5_gen_scroffs>
	mulu.w	d0,d1
    71d8:	c2c0           	mulu.w d0,d1
	move.l	d1,c2p1x1_8_c5_gen_pixels
    71da:	23c1 0000 7542 	move.l d1,7542 <c2p1x1_8_c5_gen_pixels>
	movem.l	.gi_saveregs,d0-d7/a0-a6
    71e0:	4cfa 7fff 0004 	movem.l 71e8 <.gi_saveregs>(pc),d0-a6
	rts
    71e6:	4e75           	rts

000071e8 <.gi_saveregs>:
	...

00007224 <c2p1x1_8_c5_gen>:
	.text
	FUNC(c2p1x1_8_c5_gen)
	.globl	SYM (c2p1x1_8_c5_gen)

SYM(c2p1x1_8_c5_gen):
	movem.l d0-d7/a0-a6,.c2p_saveregs	
    7224:	48f9 7fff 0000 	movem.l d0-a6,7502 <.c2p_saveregs>
    722a:	7502 
	movem.l 4(sp),a0
    722c:	4cef 0100 0004 	movem.l 4(sp),a0
	movem.l 8(sp),a1
    7232:	4cef 0200 0008 	movem.l 8(sp),a1
    move.l	IMM (0x33333333),d5
    7238:	2a3c 3333 3333 	move.l #858993459,d5
	move.l	IMM (0x55555555),a6
    723e:	2c7c 5555 5555 	movea.l #1431655765,a6

	add.w	#BPLSIZE,a1
    7244:	d2fc 2bf8      	adda.w #11256,a1
	add.l	c2p1x1_8_c5_gen_scroffs,a1
    7248:	d3fa 02f4      	adda.l 753e <c2p1x1_8_c5_gen_scroffs>(pc),a1

	move.l	c2p1x1_8_c5_gen_pixels,a2
    724c:	247a 02f4      	movea.l 7542 <c2p1x1_8_c5_gen_pixels>(pc),a2
	add.l	a0,a2
    7250:	d5c8           	adda.l a0,a2
	cmp.l	a0,a2
    7252:	b5c8           	cmpa.l a0,a2
	beq	.none
    7254:	6700 02a4      	beq.w 74fa <.none>

	movem.l	a0-a1,-(sp)
    7258:	48e7 00c0      	movem.l a0-a1,-(sp)

	move.l	(a0)+,d0
    725c:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    725e:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7260:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    7262:	2618           	move.l (a0)+,d3

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    7264:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    726a:	c084           	and.l d4,d0
	and.l	d4,d1
    726c:	c284           	and.l d4,d1
	and.l	d4,d2
    726e:	c484           	and.l d4,d2
	and.l	d4,d3
    7270:	c684           	and.l d4,d3
	lsl.l	#4,d0
    7272:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    7274:	e989           	lsl.l #4,d1
	or.l	d2,d0
    7276:	8082           	or.l d2,d0
	or.l	d3,d1
    7278:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    727a:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    727c:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    727e:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7280:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    7282:	c484           	and.l d4,d2
	and.l	d4,d6
    7284:	cc84           	and.l d4,d6
	and.l	d4,d3
    7286:	c684           	and.l d4,d3
	and.l	d4,d7
    7288:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    728a:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    728c:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    728e:	8486           	or.l d6,d2
	or.l	d7,d3
    7290:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    7292:	3c02           	move.w d2,d6
	move.w	d3,d7
    7294:	3e03           	move.w d3,d7
	move.w	d0,d2
    7296:	3400           	move.w d0,d2
	move.w	d1,d3
    7298:	3601           	move.w d1,d3
	swap	d2
    729a:	4842           	swap d2
	swap	d3
    729c:	4843           	swap d3
	move.w	d2,d0
    729e:	3002           	move.w d2,d0
	move.w	d3,d1
    72a0:	3203           	move.w d3,d1
	move.w	d6,d2
    72a2:	3406           	move.w d6,d2
	move.w	d7,d3
    72a4:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    72a6:	2c02           	move.l d2,d6
	move.l	d3,d7
    72a8:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    72aa:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    72ac:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    72ae:	b186           	eor.l d0,d6
	eor.l	d1,d7
    72b0:	b387           	eor.l d1,d7
	and.l	d5,d6
    72b2:	cc85           	and.l d5,d6
	and.l	d5,d7
    72b4:	ce85           	and.l d5,d7
	eor.l	d6,d0
    72b6:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    72b8:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    72ba:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    72bc:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    72be:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    72c0:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    72c2:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    72c8:	2c01           	move.l d1,d6
	move.l	d3,d7
    72ca:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    72cc:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    72ce:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    72d0:	b186           	eor.l d0,d6
	eor.l	d2,d7
    72d2:	b587           	eor.l d2,d7
	bra	.start1
    72d4:	6000 0088      	bra.w 735e <.start1>

000072d8 <.x1>:
.x1:
	move.l	(a0)+,d0
    72d8:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    72da:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    72dc:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    72de:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    72e0:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    72e4:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    72ea:	c084           	and.l d4,d0
	and.l	d4,d1
    72ec:	c284           	and.l d4,d1
	and.l	d4,d2
    72ee:	c484           	and.l d4,d2
	and.l	d4,d3
    72f0:	c684           	and.l d4,d3
	lsl.l	#4,d0
    72f2:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    72f4:	e989           	lsl.l #4,d1
	or.l	d2,d0
    72f6:	8082           	or.l d2,d0
	or.l	d3,d1
    72f8:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    72fa:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    72fc:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    72fe:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7300:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    7302:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    7306:	c484           	and.l d4,d2
	and.l	d4,d6
    7308:	cc84           	and.l d4,d6
	and.l	d4,d3
    730a:	c684           	and.l d4,d3
	and.l	d4,d7
    730c:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    730e:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    7310:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    7312:	8486           	or.l d6,d2
	or.l	d7,d3
    7314:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    7316:	3c02           	move.w d2,d6
	move.w	d3,d7
    7318:	3e03           	move.w d3,d7
	move.w	d0,d2
    731a:	3400           	move.w d0,d2
	move.w	d1,d3
    731c:	3601           	move.w d1,d3
	swap	d2
    731e:	4842           	swap d2
	swap	d3
    7320:	4843           	swap d3
	move.w	d2,d0
    7322:	3002           	move.w d2,d0
	move.w	d3,d1
    7324:	3203           	move.w d3,d1
	move.w	d6,d2
    7326:	3406           	move.w d6,d2
	move.w	d7,d3
    7328:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    732a:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    732e:	2c02           	move.l d2,d6
	move.l	d3,d7
    7330:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    7332:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7334:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    7336:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7338:	b387           	eor.l d1,d7
	and.l	d5,d6
    733a:	cc85           	and.l d5,d6
	and.l	d5,d7
    733c:	ce85           	and.l d5,d7
	eor.l	d6,d0
    733e:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7340:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    7342:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7344:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    7346:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7348:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    734a:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7350:	2c01           	move.l d1,d6
	move.l	d3,d7
    7352:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7354:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    7356:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7358:	b186           	eor.l d0,d6
	eor.l	d2,d7
    735a:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    735c:	22cd           	move.l a5,(a1)+

0000735e <.start1>:
.start1:
	and.l	d4,d6
    735e:	cc84           	and.l d4,d6
	and.l	d4,d7
    7360:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7362:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7364:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    7366:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    7368:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    736a:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    736c:	bf83           	eor.l d7,d3

	move.l	a6,d4
    736e:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    7370:	2c01           	move.l d1,d6
	move.l	d3,d7
    7372:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    7374:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    7376:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    7378:	b186           	eor.l d0,d6
	eor.l	d2,d7
    737a:	b587           	eor.l d2,d7
	and.l	d4,d6
    737c:	cc84           	and.l d4,d6
	and.l	d4,d7
    737e:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7380:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7382:	bf82           	eor.l d7,d2
	add.l	d6,d6
    7384:	dc86           	add.l d6,d6
	add.l	d7,d7
    7386:	de87           	add.l d7,d7
	eor.l	d1,d6
    7388:	b386           	eor.l d1,d6
	eor.l	d3,d7
    738a:	b787           	eor.l d3,d7

	move.l	d0,a4
    738c:	2840           	movea.l d0,a4
	move.l	d2,a5
    738e:	2a42           	movea.l d2,a5
	move.l	d6,a3
    7390:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    7392:	b5c8           	cmpa.l a0,a2
	bne	.x1
    7394:	6600 ff42      	bne.w 72d8 <.x1>
	move.l	d7,-BPLSIZE(a1)
    7398:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    739c:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    73a0:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    73a4:	22cd           	move.l a5,(a1)+

	movem.l	(sp)+,a0-a1
    73a6:	4cdf 0300      	movem.l (sp)+,a0-a1
	add.l	#BPLSIZE*4,a1
    73aa:	d3fc 0000 afe0 	adda.l #45024,a1

	move.l	(a0)+,d0
    73b0:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    73b2:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    73b4:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    73b6:	2618           	move.l (a0)+,d3

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    73b8:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    73be:	c084           	and.l d4,d0
	and.l	d4,d1
    73c0:	c284           	and.l d4,d1
	and.l	d4,d2
    73c2:	c484           	and.l d4,d2
	and.l	d4,d3
    73c4:	c684           	and.l d4,d3
	lsr.l	#4,d2
    73c6:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    73c8:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    73ca:	8082           	or.l d2,d0
	or.l	d3,d1
    73cc:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    73ce:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    73d0:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    73d2:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    73d4:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    73d6:	c484           	and.l d4,d2
	and.l	d4,d6
    73d8:	cc84           	and.l d4,d6
	and.l	d4,d3
    73da:	c684           	and.l d4,d3
	and.l	d4,d7
    73dc:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    73de:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    73e0:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    73e2:	8486           	or.l d6,d2
	or.l	d7,d3
    73e4:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    73e6:	3c02           	move.w d2,d6
	move.w	d3,d7
    73e8:	3e03           	move.w d3,d7
	move.w	d0,d2
    73ea:	3400           	move.w d0,d2
	move.w	d1,d3
    73ec:	3601           	move.w d1,d3
	swap	d2
    73ee:	4842           	swap d2
	swap	d3
    73f0:	4843           	swap d3
	move.w	d2,d0
    73f2:	3002           	move.w d2,d0
	move.w	d3,d1
    73f4:	3203           	move.w d3,d1
	move.w	d6,d2
    73f6:	3406           	move.w d6,d2
	move.w	d7,d3
    73f8:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    73fa:	2c02           	move.l d2,d6
	move.l	d3,d7
    73fc:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    73fe:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7400:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    7402:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7404:	b387           	eor.l d1,d7
	and.l	d5,d6
    7406:	cc85           	and.l d5,d6
	and.l	d5,d7
    7408:	ce85           	and.l d5,d7
	eor.l	d6,d0
    740a:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    740c:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    740e:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7410:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    7412:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7414:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    7416:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    741c:	2c01           	move.l d1,d6
	move.l	d3,d7
    741e:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7420:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    7422:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7424:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7426:	b587           	eor.l d2,d7
	bra	.start2
    7428:	6000 0088      	bra.w 74b2 <.start2>

0000742c <.x2>:
.x2:
	move.l	(a0)+,d0
    742c:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    742e:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7430:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    7432:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    7434:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    7438:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    743e:	c084           	and.l d4,d0
	and.l	d4,d1
    7440:	c284           	and.l d4,d1
	and.l	d4,d2
    7442:	c484           	and.l d4,d2
	and.l	d4,d3
    7444:	c684           	and.l d4,d3
	lsr.l	#4,d2
    7446:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    7448:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    744a:	8082           	or.l d2,d0
	or.l	d3,d1
    744c:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    744e:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7450:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    7452:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7454:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    7456:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    745a:	c484           	and.l d4,d2
	and.l	d4,d6
    745c:	cc84           	and.l d4,d6
	and.l	d4,d3
    745e:	c684           	and.l d4,d3
	and.l	d4,d7
    7460:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    7462:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    7464:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    7466:	8486           	or.l d6,d2
	or.l	d7,d3
    7468:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    746a:	3c02           	move.w d2,d6
	move.w	d3,d7
    746c:	3e03           	move.w d3,d7
	move.w	d0,d2
    746e:	3400           	move.w d0,d2
	move.w	d1,d3
    7470:	3601           	move.w d1,d3
	swap	d2
    7472:	4842           	swap d2
	swap	d3
    7474:	4843           	swap d3
	move.w	d2,d0
    7476:	3002           	move.w d2,d0
	move.w	d3,d1
    7478:	3203           	move.w d3,d1
	move.w	d6,d2
    747a:	3406           	move.w d6,d2
	move.w	d7,d3
    747c:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    747e:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    7482:	2c02           	move.l d2,d6
	move.l	d3,d7
    7484:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    7486:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7488:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    748a:	b186           	eor.l d0,d6
	eor.l	d1,d7
    748c:	b387           	eor.l d1,d7
	and.l	d5,d6
    748e:	cc85           	and.l d5,d6
	and.l	d5,d7
    7490:	ce85           	and.l d5,d7
	eor.l	d6,d0
    7492:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7494:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    7496:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7498:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    749a:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    749c:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    749e:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    74a4:	2c01           	move.l d1,d6
	move.l	d3,d7
    74a6:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    74a8:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    74aa:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    74ac:	b186           	eor.l d0,d6
	eor.l	d2,d7
    74ae:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    74b0:	22cd           	move.l a5,(a1)+

000074b2 <.start2>:
.start2:
	and.l	d4,d6
    74b2:	cc84           	and.l d4,d6
	and.l	d4,d7
    74b4:	ce84           	and.l d4,d7
	eor.l	d6,d0
    74b6:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    74b8:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    74ba:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    74bc:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    74be:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    74c0:	bf83           	eor.l d7,d3

	move.l	a6,d4
    74c2:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    74c4:	2c01           	move.l d1,d6
	move.l	d3,d7
    74c6:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    74c8:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    74ca:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    74cc:	b186           	eor.l d0,d6
	eor.l	d2,d7
    74ce:	b587           	eor.l d2,d7
	and.l	d4,d6
    74d0:	cc84           	and.l d4,d6
	and.l	d4,d7
    74d2:	ce84           	and.l d4,d7
	eor.l	d6,d0
    74d4:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    74d6:	bf82           	eor.l d7,d2
	add.l	d6,d6
    74d8:	dc86           	add.l d6,d6
	add.l	d7,d7
    74da:	de87           	add.l d7,d7
	eor.l	d1,d6
    74dc:	b386           	eor.l d1,d6
	eor.l	d3,d7
    74de:	b787           	eor.l d3,d7

	move.l	d0,a4
    74e0:	2840           	movea.l d0,a4
	move.l	d2,a5
    74e2:	2a42           	movea.l d2,a5
	move.l	d6,a3
    74e4:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    74e6:	b5c8           	cmpa.l a0,a2
	bne	.x2
    74e8:	6600 ff42      	bne.w 742c <.x2>
	move.l	d7,-BPLSIZE(a1)
    74ec:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    74f0:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    74f4:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    74f8:	22cd           	move.l a5,(a1)+

000074fa <.none>:
.none:
	movem.l .c2p_saveregs,d0-d7/a0-a6
    74fa:	4cfa 7fff 0004 	movem.l 7502 <.c2p_saveregs>(pc),d0-a6
	rts
    7500:	4e75           	rts

00007502 <.c2p_saveregs>:
	...

0000753e <c2p1x1_8_c5_gen_scroffs>:
    753e:	0000 0001      	ori.b #1,d0

00007542 <c2p1x1_8_c5_gen_pixels>:

.c2p_saveregs: .dcb.b 60


c2p1x1_8_c5_gen_scroffs: dc.l	1
    7542:	0000 0001      	ori.b #1,d0
