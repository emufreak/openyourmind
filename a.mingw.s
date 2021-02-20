
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
       2:	203c 0000 a3fa 	move.l #41978,d0
       8:	0480 0000 a3fa 	subi.l #41978,d0
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
      22:	41f9 0000 a3fa 	lea a3fa <__fini_array_end>,a0
      28:	2071 8800      	movea.l (0,a1,a0.l),a0
      2c:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      2e:	52af 0004      	addq.l #1,4(sp)
      32:	202f 0004      	move.l 4(sp),d0
      36:	b097           	cmp.l (sp),d0
      38:	65de           	bcs.s 18 <_start+0x18>

	count = __init_array_end - __init_array_start;
      3a:	203c 0000 a3fa 	move.l #41978,d0
      40:	0480 0000 a3fa 	subi.l #41978,d0
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
      5a:	41f9 0000 a3fa 	lea a3fa <__fini_array_end>,a0
      60:	2071 8800      	movea.l (0,a1,a0.l),a0
      64:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      66:	52af 0004      	addq.l #1,4(sp)
      6a:	202f 0004      	move.l 4(sp),d0
      6e:	b097           	cmp.l (sp),d0
      70:	65de           	bcs.s 50 <_start+0x50>

	main();
      72:	4eb9 0000 084a 	jsr 84a <main>

	// call dtors
	count = __fini_array_end - __fini_array_start;
      78:	203c 0000 a3fa 	move.l #41978,d0
      7e:	0480 0000 a3fa 	subi.l #41978,d0
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
      9a:	41f9 0000 a3fa 	lea a3fa <__fini_array_end>,a0
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
      b6:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
      bc:	3f68 0002 0002 	move.w 2(a0),2(sp)
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
      c2:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
      c8:	3028 0002      	move.w 2(a0),d0
      cc:	3000           	move.w d0,d0
      ce:	0280 0000 ffff 	andi.l #65535,d0
      d4:	0280 0000 4000 	andi.l #16384,d0
      da:	66e6           	bne.s c2 <WaitBlt+0xe>
}
      dc:	588f           	addq.l #4,sp
      de:	4e75           	rts

000000e0 <FreeDisplay>:
   0x018A0231,0x018C331,0x018E0332,0x01900741,0x01920443,0x01940553,0x01960552,
   0x01980952,0x019A0665,0x019C0664,0x019E0673,0x01A00C72,0x01A20886,0x01A40885,
   0x01A60883,0x01A80F81,0x01AA0AA7,0x01AC0AA8,0x01AE0AA5,0x01B00BB7,0x01B20CC8,
           0x01B40CC9,0x01B60DDA,0x01B80ED6,0x01BA0EE4,0x01BC0EEA, 0x01BE0FFF };

void FreeDisplay( int clsize, int bplsize) {
      e0:	4fef ffe0      	lea -32(sp),sp
      e4:	2f0e           	move.l a6,-(sp)
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
      e6:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
      ec:	6722           	beq.s 110 <FreeDisplay+0x30>
      ee:	2f79 0016 b834 	move.l 16b834 <Copperlist1>,32(sp)
      f4:	0020 
      f6:	2f6f 0028 001c 	move.l 40(sp),28(sp)
      fc:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
     102:	2c40           	movea.l d0,a6
     104:	226f 0020      	movea.l 32(sp),a1
     108:	202f 001c      	move.l 28(sp),d0
     10c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     110:	2039 0016 b838 	move.l 16b838 <Copperlist2>,d0
     116:	6722           	beq.s 13a <FreeDisplay+0x5a>
     118:	2f79 0016 b838 	move.l 16b838 <Copperlist2>,24(sp)
     11e:	0018 
     120:	2f6f 0028 0014 	move.l 40(sp),20(sp)
     126:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
     12c:	2c40           	movea.l d0,a6
     12e:	226f 0018      	movea.l 24(sp),a1
     132:	202f 0014      	move.l 20(sp),d0
     136:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
     13a:	2039 0016 b82c 	move.l 16b82c <Bitplane1>,d0
     140:	6722           	beq.s 164 <FreeDisplay+0x84>
     142:	2f79 0016 b82c 	move.l 16b82c <Bitplane1>,16(sp)
     148:	0010 
     14a:	2f6f 002c 000c 	move.l 44(sp),12(sp)
     150:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
     156:	2c40           	movea.l d0,a6
     158:	226f 0010      	movea.l 16(sp),a1
     15c:	202f 000c      	move.l 12(sp),d0
     160:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
     164:	2039 0016 b830 	move.l 16b830 <Bitplane2>,d0
     16a:	6722           	beq.s 18e <FreeDisplay+0xae>
     16c:	2f79 0016 b830 	move.l 16b830 <Bitplane2>,8(sp)
     172:	0008 
     174:	2f6f 002c 0004 	move.l 44(sp),4(sp)
     17a:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
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
     19a:	2039 0016 b83c 	move.l 16b83c <DrawBuffer>,d0
     1a0:	4240           	clr.w d0
     1a2:	4840           	swap d0
     1a4:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     1a8:	2039 0016 b83c 	move.l 16b83c <DrawBuffer>,d0
     1ae:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     1b2:	2f79 0016 b844 	move.l 16b844 <DrawCopper>,4(sp)
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
     1d2:	2039 0016 b83c 	move.l 16b83c <DrawBuffer>,d0
     1d8:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     1da:	2039 0016 b840 	move.l 16b840 <ViewBuffer>,d0
     1e0:	23c0 0016 b83c 	move.l d0,16b83c <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     1e6:	2017           	move.l (sp),d0
     1e8:	23c0 0016 b840 	move.l d0,16b840 <ViewBuffer>
}
     1ee:	4fef 000c      	lea 12(sp),sp
     1f2:	4e75           	rts

000001f4 <SwapCl>:

void SwapCl() {
     1f4:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     1f6:	2039 0016 b844 	move.l 16b844 <DrawCopper>,d0
     1fc:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     1fe:	2039 0016 b848 	move.l 16b848 <ViewCopper>,d0
     204:	23c0 0016 b844 	move.l d0,16b844 <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     20a:	2017           	move.l (sp),d0
     20c:	23c0 0016 b848 	move.l d0,16b848 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     212:	2039 0016 b848 	move.l 16b848 <ViewCopper>,d0
     218:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
     21e:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     222:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
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
     2fa:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
     300:	317c 0020 009c 	move.w #32,156(a0)
     306:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
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
     316:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
     31c:	317c 87ff 0096 	move.w #-30721,150(a0)
  //             1001001111100000	; copper,bitplane,blitter DMA

  /*hw->dmacon =   
  0x87e0;*/
	SetInterruptHandler((APTR)interruptHandler);
     322:	487a ffd4      	pea 2f8 <interruptHandler.lto_priv.0>(pc)
     326:	4eba 0278      	jsr 5a0 <SetInterruptHandler>(pc)
     32a:	588f           	addq.l #4,sp
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     32c:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
     332:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     338:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
     33e:	317c 0020 009c 	move.w #32,156(a0)
  c2p();
     344:	4eba 0c62      	jsr fa8 <c2p>(pc)
     348:	6008           	bra.s 352 <RunDemo+0x3c>
  //PrepareDisplay();
  //CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
  
	while(Zoom_Counter < 1000) {
		WaitVbl();
     34a:	4eba 0270      	jsr 5bc <WaitVbl>(pc)
    RunFrame();
     34e:	4eba 0038      	jsr 388 <RunFrame>(pc)
	while(Zoom_Counter < 1000) {
     352:	3039 0016 b88a 	move.w 16b88a <Zoom_Counter>,d0
     358:	0c40 03e7      	cmpi.w #999,d0
     35c:	63ec           	bls.s 34a <RunDemo+0x34>
	}
  Zoom_Dealloc();
     35e:	4eba 1052      	jsr 13b2 <Zoom_Dealloc>(pc)

	//SetInterruptHandler((APTR)interruptHandler);
}
     362:	4e75           	rts

00000364 <SetInterrupt>:

void SetInterrupt() {
  SetInterruptHandler((APTR)interruptHandler);
     364:	487a ff92      	pea 2f8 <interruptHandler.lto_priv.0>(pc)
     368:	4eba 0236      	jsr 5a0 <SetInterruptHandler>(pc)
     36c:	588f           	addq.l #4,sp
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     36e:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
     374:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     37a:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
     380:	317c 0020 009c 	move.w #32,156(a0)
}
     386:	4e75           	rts

00000388 <RunFrame>:
  else
    Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer, (UWORD *)DrawBuffer, Zoom_LevelOfZoom, 5 );

  Zoom_Blit4ZoomFinished = 1;
  while( tmp == Zoom_LevelOfZoom) { }*/
     388:	4e75           	rts

0000038a <Zoom_InsertShift>:
           0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
           0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000,
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

void Zoom_InsertShift( UWORD *copperlist, UWORD *values4shift) {
     38a:	4fef fff4      	lea -12(sp),sp
     38e:	2f02           	move.l d2,-(sp)
  for(int i = 0; i<6;i++) {
     390:	42af 000c      	clr.l 12(sp)
     394:	601e           	bra.s 3b4 <Zoom_InsertShift+0x2a>
    *copperlist = *values4shift++;
     396:	202f 0018      	move.l 24(sp),d0
     39a:	2200           	move.l d0,d1
     39c:	5481           	addq.l #2,d1
     39e:	2f41 0018      	move.l d1,24(sp)
     3a2:	2040           	movea.l d0,a0
     3a4:	3010           	move.w (a0),d0
     3a6:	206f 0014      	movea.l 20(sp),a0
     3aa:	3080           	move.w d0,(a0)
    copperlist += 2;
     3ac:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<6;i++) {
     3b0:	52af 000c      	addq.l #1,12(sp)
     3b4:	7005           	moveq #5,d0
     3b6:	b0af 000c      	cmp.l 12(sp),d0
     3ba:	6cda           	bge.s 396 <Zoom_InsertShift+0xc>
  }
  copperlist--;
     3bc:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     3c0:	222f 0018      	move.l 24(sp),d1
     3c4:	2401           	move.l d1,d2
     3c6:	5482           	addq.l #2,d2
     3c8:	2f42 0018      	move.l d2,24(sp)
     3cc:	202f 0014      	move.l 20(sp),d0
     3d0:	2400           	move.l d0,d2
     3d2:	5482           	addq.l #2,d2
     3d4:	2f42 0014      	move.l d2,20(sp)
     3d8:	2041           	movea.l d1,a0
     3da:	3210           	move.w (a0),d1
     3dc:	2040           	movea.l d0,a0
     3de:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     3e0:	202f 0018      	move.l 24(sp),d0
     3e4:	2200           	move.l d0,d1
     3e6:	5481           	addq.l #2,d1
     3e8:	2f41 0018      	move.l d1,24(sp)
     3ec:	2040           	movea.l d0,a0
     3ee:	3010           	move.w (a0),d0
     3f0:	206f 0014      	movea.l 20(sp),a0
     3f4:	3080           	move.w d0,(a0)
  copperlist += 2;
     3f6:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     3fa:	42af 0008      	clr.l 8(sp)
     3fe:	601e           	bra.s 41e <Zoom_InsertShift+0x94>
    *copperlist = *values4shift++;
     400:	202f 0018      	move.l 24(sp),d0
     404:	2200           	move.l d0,d1
     406:	5481           	addq.l #2,d1
     408:	2f41 0018      	move.l d1,24(sp)
     40c:	2040           	movea.l d0,a0
     40e:	3010           	move.w (a0),d0
     410:	206f 0014      	movea.l 20(sp),a0
     414:	3080           	move.w d0,(a0)
    copperlist += 2;
     416:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     41a:	52af 0008      	addq.l #1,8(sp)
     41e:	7009           	moveq #9,d0
     420:	b0af 0008      	cmp.l 8(sp),d0
     424:	6cda           	bge.s 400 <Zoom_InsertShift+0x76>
  }
  copperlist--;
     426:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     42a:	222f 0018      	move.l 24(sp),d1
     42e:	2401           	move.l d1,d2
     430:	5482           	addq.l #2,d2
     432:	2f42 0018      	move.l d2,24(sp)
     436:	202f 0014      	move.l 20(sp),d0
     43a:	2400           	move.l d0,d2
     43c:	5482           	addq.l #2,d2
     43e:	2f42 0014      	move.l d2,20(sp)
     442:	2041           	movea.l d1,a0
     444:	3210           	move.w (a0),d1
     446:	2040           	movea.l d0,a0
     448:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     44a:	202f 0018      	move.l 24(sp),d0
     44e:	2200           	move.l d0,d1
     450:	5481           	addq.l #2,d1
     452:	2f41 0018      	move.l d1,24(sp)
     456:	2040           	movea.l d0,a0
     458:	3010           	move.w (a0),d0
     45a:	206f 0014      	movea.l 20(sp),a0
     45e:	3080           	move.w d0,(a0)
  copperlist += 2;
     460:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     464:	42af 0004      	clr.l 4(sp)
     468:	601e           	bra.s 488 <Zoom_InsertShift+0xfe>
    *copperlist = *values4shift++;
     46a:	202f 0018      	move.l 24(sp),d0
     46e:	2200           	move.l d0,d1
     470:	5481           	addq.l #2,d1
     472:	2f41 0018      	move.l d1,24(sp)
     476:	2040           	movea.l d0,a0
     478:	3010           	move.w (a0),d0
     47a:	206f 0014      	movea.l 20(sp),a0
     47e:	3080           	move.w d0,(a0)
    copperlist += 2;
     480:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     484:	52af 0004      	addq.l #1,4(sp)
     488:	7006           	moveq #6,d0
     48a:	b0af 0004      	cmp.l 4(sp),d0
     48e:	6cda           	bge.s 46a <Zoom_InsertShift+0xe0>
  }
}
     490:	241f           	move.l (sp)+,d2
     492:	4fef 000c      	lea 12(sp),sp
     496:	4e75           	rts

00000498 <Zoom_Shrink102>:

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {
     498:	518f           	subq.l #8,sp
     49a:	202f 000c      	move.l 12(sp),d0
     49e:	3000           	move.w d0,d0
     4a0:	3f40 0002      	move.w d0,2(sp)

  
  UWORD *values4shift = Values4Shift+levelofshrink*108;
     4a4:	7200           	moveq #0,d1
     4a6:	322f 0002      	move.w 2(sp),d1
     4aa:	2001           	move.l d1,d0
     4ac:	d080           	add.l d0,d0
     4ae:	d081           	add.l d1,d0
     4b0:	2200           	move.l d0,d1
     4b2:	e789           	lsl.l #3,d1
     4b4:	d081           	add.l d1,d0
     4b6:	e788           	lsl.l #3,d0
     4b8:	2200           	move.l d0,d1
     4ba:	0681 0000 a714 	addi.l #42772,d1
     4c0:	2f41 0004      	move.l d1,4(sp)
  //copperlist+=3+73*2;
  Zoom_InsertShift( copperlist+3+73*2, values4shift);
     4c4:	202f 0010      	move.l 16(sp),d0
     4c8:	0680 0000 012a 	addi.l #298,d0
     4ce:	2f2f 0004      	move.l 4(sp),-(sp)
     4d2:	2f00           	move.l d0,-(sp)
     4d4:	4eba feb4      	jsr 38a <Zoom_InsertShift>(pc)
     4d8:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+63+73*2, values4shift+27);
     4da:	7236           	moveq #54,d1
     4dc:	d2af 0004      	add.l 4(sp),d1
     4e0:	202f 0010      	move.l 16(sp),d0
     4e4:	0680 0000 01a2 	addi.l #418,d0
     4ea:	2f01           	move.l d1,-(sp)
     4ec:	2f00           	move.l d0,-(sp)
     4ee:	4eba fe9a      	jsr 38a <Zoom_InsertShift>(pc)
     4f2:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+119+73*2, values4shift+54);
     4f4:	726c           	moveq #108,d1
     4f6:	d2af 0004      	add.l 4(sp),d1
     4fa:	202f 0010      	move.l 16(sp),d0
     4fe:	0680 0000 0212 	addi.l #530,d0
     504:	2f01           	move.l d1,-(sp)
     506:	2f00           	move.l d0,-(sp)
     508:	4eba fe80      	jsr 38a <Zoom_InsertShift>(pc)
     50c:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+175+73*2, values4shift+81);
     50e:	222f 0004      	move.l 4(sp),d1
     512:	0681 0000 00a2 	addi.l #162,d1
     518:	202f 0010      	move.l 16(sp),d0
     51c:	0680 0000 0282 	addi.l #642,d0
     522:	2f01           	move.l d1,-(sp)
     524:	2f00           	move.l d0,-(sp)
     526:	4eba fe62      	jsr 38a <Zoom_InsertShift>(pc)
     52a:	508f           	addq.l #8,sp
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }*/
  
}
     52c:	508f           	addq.l #8,sp
     52e:	4e75           	rts

00000530 <GetVBR>:
volatile static APTR VBR=0;
static APTR SystemIrq;
 
struct View *ActiView;

static APTR GetVBR(void) {
     530:	4fef ffec      	lea -20(sp),sp
     534:	2f0e           	move.l a6,-(sp)
     536:	2f07           	move.l d7,-(sp)
	APTR vbr = 0;
     538:	42af 0018      	clr.l 24(sp)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     53c:	3f7c 4e7a 000a 	move.w #20090,10(sp)
     542:	3f7c 0801 000c 	move.w #2049,12(sp)
     548:	3f7c 4e73 000e 	move.w #20083,14(sp)

	if (SysBase->AttnFlags & AFF_68010) 
     54e:	2079 0016 b850 	movea.l 16b850 <SysBase>,a0
     554:	3028 0128      	move.w 296(a0),d0
     558:	3000           	move.w d0,d0
     55a:	0280 0000 ffff 	andi.l #65535,d0
     560:	7201           	moveq #1,d1
     562:	c081           	and.l d1,d0
     564:	672c           	beq.s 592 <GetVBR+0x62>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     566:	41ef 001c      	lea 28(sp),a0
     56a:	41e8 ffee      	lea -18(a0),a0
     56e:	2f48 0014      	move.l a0,20(sp)
     572:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
     578:	2c40           	movea.l d0,a6
     57a:	2e2f 0014      	move.l 20(sp),d7
     57e:	cf8d           	exg d7,a5
     580:	4eae ffe2      	jsr -30(a6)
     584:	cf8d           	exg d7,a5
     586:	2f40 0010      	move.l d0,16(sp)
     58a:	202f 0010      	move.l 16(sp),d0
     58e:	2f40 0018      	move.l d0,24(sp)

	return vbr;
     592:	202f 0018      	move.l 24(sp),d0
}
     596:	2e1f           	move.l (sp)+,d7
     598:	2c5f           	movea.l (sp)+,a6
     59a:	4fef 0014      	lea 20(sp),sp
     59e:	4e75           	rts

000005a0 <SetInterruptHandler>:

void SetInterruptHandler(APTR interrupt) {
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     5a0:	2079 0016 b866 	movea.l 16b866 <VBR>,a0
     5a6:	41e8 006c      	lea 108(a0),a0
     5aa:	20af 0004      	move.l 4(sp),(a0)
}
     5ae:	4e75           	rts

000005b0 <GetInterruptHandler>:

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     5b0:	2079 0016 b866 	movea.l 16b866 <VBR>,a0
     5b6:	2028 006c      	move.l 108(a0),d0
}
     5ba:	4e75           	rts

000005bc <WaitVbl>:

//vblank begins at vpos 312 hpos 1 and ends at vpos 25 hpos 1
//vsync begins at line 2 hpos 132 and ends at vpos 5 hpos 18 
void WaitVbl() {
     5bc:	518f           	subq.l #8,sp
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     5be:	207c 00df f004 	movea.l #14675972,a0
     5c4:	2010           	move.l (a0),d0
     5c6:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
     5c8:	2017           	move.l (sp),d0
     5ca:	0280 0001 ff00 	andi.l #130816,d0
     5d0:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
     5d2:	2017           	move.l (sp),d0
     5d4:	0c80 0001 3700 	cmpi.l #79616,d0
     5da:	67e2           	beq.s 5be <WaitVbl+0x2>
			break;
	}
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     5dc:	207c 00df f004 	movea.l #14675972,a0
     5e2:	2010           	move.l (a0),d0
     5e4:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
     5e8:	202f 0004      	move.l 4(sp),d0
     5ec:	0280 0001 ff00 	andi.l #130816,d0
     5f2:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
     5f6:	202f 0004      	move.l 4(sp),d0
     5fa:	0c80 0001 3700 	cmpi.l #79616,d0
     600:	66da           	bne.s 5dc <WaitVbl+0x20>
			break;
	}
}
     602:	508f           	addq.l #8,sp
     604:	4e75           	rts

00000606 <TakeSystem>:
	UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
}*/

void TakeSystem() {
     606:	518f           	subq.l #8,sp
     608:	2f0e           	move.l a6,-(sp)
	ActiView=GfxBase->ActiView; //store current view
     60a:	2079 0016 b85c 	movea.l 16b85c <GfxBase>,a0
     610:	2028 0022      	move.l 34(a0),d0
     614:	23c0 0016 b86e 	move.l d0,16b86e <ActiView>
	OwnBlitter();
     61a:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
     620:	2c40           	movea.l d0,a6
     622:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     626:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
     62c:	2c40           	movea.l d0,a6
     62e:	4eae ff1c      	jsr -228(a6)
	//Disable();
	Forbid();
     632:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
     638:	2c40           	movea.l d0,a6
     63a:	4eae ff7c      	jsr -132(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=custom->adkconr;
     63e:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     644:	3028 0010      	move.w 16(a0),d0
     648:	33c0 0016 b864 	move.w d0,16b864 <SystemADKCON>
	SystemInts=custom->intenar;
     64e:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     654:	3028 001c      	move.w 28(a0),d0
     658:	33c0 0016 b860 	move.w d0,16b860 <SystemInts>
	SystemDMA=custom->dmaconr;
     65e:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     664:	3028 0002      	move.w 2(a0),d0
     668:	33c0 0016 b862 	move.w d0,16b862 <SystemDMA>
	custom->intena=0x7fff;//disable all interrupts
     66e:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     674:	317c 7fff 009a 	move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     67a:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     680:	317c 7fff 009c 	move.w #32767,156(a0)
	
	WaitVbl();
     686:	4eba ff34      	jsr 5bc <WaitVbl>(pc)
	WaitVbl();
     68a:	4eba ff30      	jsr 5bc <WaitVbl>(pc)
	custom->dmacon=0x7fff;//Clear all DMA channels
     68e:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     694:	317c 7fff 0096 	move.w #32767,150(a0)

	//set all colors black
	for(int a=0;a<32;a++)
     69a:	42af 0008      	clr.l 8(sp)
     69e:	601c           	bra.s 6bc <TakeSystem+0xb6>
		custom->color[a]=0;
     6a0:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     6a6:	202f 0008      	move.l 8(sp),d0
     6aa:	0680 0000 00c0 	addi.l #192,d0
     6b0:	d080           	add.l d0,d0
     6b2:	31bc 0000 0800 	move.w #0,(0,a0,d0.l)
	for(int a=0;a<32;a++)
     6b8:	52af 0008      	addq.l #1,8(sp)
     6bc:	701f           	moveq #31,d0
     6be:	b0af 0008      	cmp.l 8(sp),d0
     6c2:	6cdc           	bge.s 6a0 <TakeSystem+0x9a>

	LoadView(0);
     6c4:	42af 0004      	clr.l 4(sp)
     6c8:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
     6ce:	2c40           	movea.l d0,a6
     6d0:	226f 0004      	movea.l 4(sp),a1
     6d4:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     6d8:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
     6de:	2c40           	movea.l d0,a6
     6e0:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     6e4:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
     6ea:	2c40           	movea.l d0,a6
     6ec:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     6f0:	4eba feca      	jsr 5bc <WaitVbl>(pc)
	WaitVbl();
     6f4:	4eba fec6      	jsr 5bc <WaitVbl>(pc)

	VBR=GetVBR();
     6f8:	4eba fe36      	jsr 530 <GetVBR>(pc)
     6fc:	23c0 0016 b866 	move.l d0,16b866 <VBR>
	SystemIrq=GetInterruptHandler(); //store interrupt register
     702:	4eba feac      	jsr 5b0 <GetInterruptHandler>(pc)
     706:	23c0 0016 b86a 	move.l d0,16b86a <SystemIrq>
}
     70c:	2c5f           	movea.l (sp)+,a6
     70e:	508f           	addq.l #8,sp
     710:	4e75           	rts

00000712 <FreeSystem>:

void FreeSystem() { 
     712:	598f           	subq.l #4,sp
     714:	2f0e           	move.l a6,-(sp)
	WaitVbl();
     716:	4eba fea4      	jsr 5bc <WaitVbl>(pc)
	WaitBlt();
     71a:	4eba f998      	jsr b4 <WaitBlt>(pc)
	custom->intena=0x7fff;//disable all interrupts
     71e:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     724:	317c 7fff 009a 	move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     72a:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     730:	317c 7fff 009c 	move.w #32767,156(a0)
	custom->dmacon=0x7fff;//Clear all DMA channels
     736:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     73c:	317c 7fff 0096 	move.w #32767,150(a0)

	//restore interrupts
	SetInterruptHandler(SystemIrq);
     742:	2039 0016 b86a 	move.l 16b86a <SystemIrq>,d0
     748:	2f00           	move.l d0,-(sp)
     74a:	4eba fe54      	jsr 5a0 <SetInterruptHandler>(pc)
     74e:	588f           	addq.l #4,sp

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
     750:	2079 0016 b85c 	movea.l 16b85c <GfxBase>,a0
     756:	2028 0026      	move.l 38(a0),d0
     75a:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     760:	2140 0080      	move.l d0,128(a0)
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
     764:	2079 0016 b85c 	movea.l 16b85c <GfxBase>,a0
     76a:	2028 0032      	move.l 50(a0),d0
     76e:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     774:	2140 0084      	move.l d0,132(a0)
	custom->copjmp1=0x7fff; //start coppper
     778:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     77e:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
     784:	3039 0016 b860 	move.w 16b860 <SystemInts>,d0
     78a:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     790:	0040 8000      	ori.w #-32768,d0
     794:	3140 009a      	move.w d0,154(a0)
	custom->dmacon=SystemDMA|0x8000;
     798:	3039 0016 b862 	move.w 16b862 <SystemDMA>,d0
     79e:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     7a4:	0040 8000      	ori.w #-32768,d0
     7a8:	3140 0096      	move.w d0,150(a0)
	custom->adkcon=SystemADKCON|0x8000;
     7ac:	3039 0016 b864 	move.w 16b864 <SystemADKCON>,d0
     7b2:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     7b8:	0040 8000      	ori.w #-32768,d0
     7bc:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     7c0:	2f79 0016 b86e 	move.l 16b86e <ActiView>,4(sp)
     7c6:	0004 
     7c8:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
     7ce:	2c40           	movea.l d0,a6
     7d0:	226f 0004      	movea.l 4(sp),a1
     7d4:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     7d8:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
     7de:	2c40           	movea.l d0,a6
     7e0:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     7e4:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
     7ea:	2c40           	movea.l d0,a6
     7ec:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     7f0:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
     7f6:	2c40           	movea.l d0,a6
     7f8:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     7fc:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
     802:	2c40           	movea.l d0,a6
     804:	4eae fe32      	jsr -462(a6)
	//Enable();
	Permit();
     808:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
     80e:	2c40           	movea.l d0,a6
     810:	4eae ff76      	jsr -138(a6)
}
     814:	2c5f           	movea.l (sp)+,a6
     816:	588f           	addq.l #4,sp
     818:	4e75           	rts

0000081a <interruptHandler.lto_priv.1>:
	*copListCurrent++=offsetof(struct Custom, color[index]);
	*copListCurrent++=color;
	return copListCurrent;
}

static __attribute__((interrupt)) void interruptHandler() {
     81a:	2f08           	move.l a0,-(sp)
     81c:	2f00           	move.l d0,-(sp)
	custom->intreq=(1<<INTB_VERTB); custom->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     81e:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     824:	317c 0020 009c 	move.w #32,156(a0)
     82a:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     830:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	frameCounter++;
     836:	3039 0016 b872 	move.w 16b872 <frameCounter>,d0
     83c:	5240           	addq.w #1,d0
     83e:	33c0 0016 b872 	move.w d0,16b872 <frameCounter>
}
     844:	201f           	move.l (sp)+,d0
     846:	205f           	movea.l (sp)+,a0
     848:	4e73           	rte

0000084a <main>:
	*copListEnd++ = offsetof(struct Custom, diwstop);
	*copListEnd++ = (xstop-256)+((ystop-256)<<8);
	return copListEnd;
}

int main() {
     84a:	4fef ffbc      	lea -68(sp),sp
     84e:	48e7 3002      	movem.l d2-d3/a6,-(sp)
	ULONG tmp = 4;
     852:	7004           	moveq #4,d0
     854:	2f40 004c      	move.l d0,76(sp)
    SysBase = *((struct ExecBase**)tmp);
     858:	206f 004c      	movea.l 76(sp),a0
     85c:	2010           	move.l (a0),d0
     85e:	23c0 0016 b850 	move.l d0,16b850 <SysBase>
	hw = (struct Custom*)0xdff000;
     864:	23fc 00df f000 	move.l #14675968,16b84c <hw>
     86a:	0016 b84c 

	SysBase = *((struct ExecBase**)4UL);
     86e:	307c 0004      	movea.w #4,a0
     872:	2010           	move.l (a0),d0
     874:	23c0 0016 b850 	move.l d0,16b850 <SysBase>
	custom = (struct Custom*)0xdff000;
     87a:	23fc 00df f000 	move.l #14675968,16b854 <custom>
     880:	0016 b854 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
     884:	2f7c 0000 73e6 	move.l #29670,72(sp)
     88a:	0048 
     88c:	42af 0044      	clr.l 68(sp)
     890:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
     896:	2c40           	movea.l d0,a6
     898:	226f 0048      	movea.l 72(sp),a1
     89c:	202f 0044      	move.l 68(sp),d0
     8a0:	4eae fdd8      	jsr -552(a6)
     8a4:	2f40 0040      	move.l d0,64(sp)
     8a8:	202f 0040      	move.l 64(sp),d0
     8ac:	23c0 0016 b85c 	move.l d0,16b85c <GfxBase>
	if (!GfxBase)
     8b2:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
     8b8:	6614           	bne.s 8ce <main+0x84>
		Exit(0);
     8ba:	42af 003c      	clr.l 60(sp)
     8be:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     8c4:	2c40           	movea.l d0,a6
     8c6:	222f 003c      	move.l 60(sp),d1
     8ca:	4eae ff70      	jsr -144(a6)

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     8ce:	2f7c 0000 73f7 	move.l #29687,56(sp)
     8d4:	0038 
     8d6:	42af 0034      	clr.l 52(sp)
     8da:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
     8e0:	2c40           	movea.l d0,a6
     8e2:	226f 0038      	movea.l 56(sp),a1
     8e6:	202f 0034      	move.l 52(sp),d0
     8ea:	4eae fdd8      	jsr -552(a6)
     8ee:	2f40 0030      	move.l d0,48(sp)
     8f2:	202f 0030      	move.l 48(sp),d0
     8f6:	23c0 0016 b858 	move.l d0,16b858 <DOSBase>
	if (!DOSBase)
     8fc:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     902:	6614           	bne.s 918 <main+0xce>
		Exit(0);
     904:	42af 002c      	clr.l 44(sp)
     908:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     90e:	2c40           	movea.l d0,a6
     910:	222f 002c      	move.l 44(sp),d1
     914:	4eae ff70      	jsr -144(a6)

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
     918:	4879 0000 7403 	pea 7403 <c2p1x1_4_c5_gen_pixels+0x21>
     91e:	4eba 653a      	jsr 6e5a <KPrintF>(pc)
     922:	588f           	addq.l #4,sp
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
     924:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     92a:	2c40           	movea.l d0,a6
     92c:	4eae ffc4      	jsr -60(a6)
     930:	2f40 0028      	move.l d0,40(sp)
     934:	202f 0028      	move.l 40(sp),d0
     938:	2f40 0024      	move.l d0,36(sp)
     93c:	2f7c 0000 741f 	move.l #29727,32(sp)
     942:	0020 
     944:	700f           	moveq #15,d0
     946:	2f40 001c      	move.l d0,28(sp)
     94a:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     950:	2c40           	movea.l d0,a6
     952:	222f 0024      	move.l 36(sp),d1
     956:	242f 0020      	move.l 32(sp),d2
     95a:	262f 001c      	move.l 28(sp),d3
     95e:	4eae ffd0      	jsr -48(a6)
     962:	2f40 0018      	move.l d0,24(sp)
	Delay(50);
     966:	7032           	moveq #50,d0
     968:	2f40 0014      	move.l d0,20(sp)
     96c:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     972:	2c40           	movea.l d0,a6
     974:	222f 0014      	move.l 20(sp),d1
     978:	4eae ff3a      	jsr -198(a6)

	warpmode(1);
     97c:	4878 0001      	pea 1 <_start+0x1>
     980:	4eba 6542      	jsr 6ec4 <warpmode>(pc)
     984:	588f           	addq.l #4,sp
	// TODO: precalc stuff here
	warpmode(0);
     986:	42a7           	clr.l -(sp)
     988:	4eba 653a      	jsr 6ec4 <warpmode>(pc)
     98c:	588f           	addq.l #4,sp

	/*TakeSystem();*/
	WaitVbl();
     98e:	4eba fc2c      	jsr 5bc <WaitVbl>(pc)
  
  	Zoom_InitRun();
     992:	4eba 08cc      	jsr 1260 <Zoom_InitRun>(pc)
  	//RunTests();	//warpmode(1);
	// TODO: precalc stuff here
	//warpmode(0);

	TakeSystem();
     996:	4eba fc6e      	jsr 606 <TakeSystem>(pc)
	WaitVbl();
     99a:	4eba fc20      	jsr 5bc <WaitVbl>(pc)

	// DEMO

	RunDemo();
     99e:	4eba f976      	jsr 316 <RunDemo>(pc)

	// DEMO
	SetInterruptHandler((APTR)interruptHandler);
     9a2:	487a fe76      	pea 81a <interruptHandler.lto_priv.1>(pc)
     9a6:	4eba fbf8      	jsr 5a0 <SetInterruptHandler>(pc)
     9aa:	588f           	addq.l #4,sp
	custom->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     9ac:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     9b2:	317c c020 009a 	move.w #-16352,154(a0)
	custom->intreq=1<<INTB_VERTB;//reset vbl req
     9b8:	2079 0016 b854 	movea.l 16b854 <custom>,a0
     9be:	317c 0020 009c 	move.w #32,156(a0)

	// END
	FreeSystem();
     9c4:	4eba fd4c      	jsr 712 <FreeSystem>(pc)

	CloseLibrary((struct Library*)DOSBase);
     9c8:	2f79 0016 b858 	move.l 16b858 <DOSBase>,16(sp)
     9ce:	0010 
     9d0:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
     9d6:	2c40           	movea.l d0,a6
     9d8:	226f 0010      	movea.l 16(sp),a1
     9dc:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     9e0:	2f79 0016 b85c 	move.l 16b85c <GfxBase>,12(sp)
     9e6:	000c 
     9e8:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
     9ee:	2c40           	movea.l d0,a6
     9f0:	226f 000c      	movea.l 12(sp),a1
     9f4:	4eae fe62      	jsr -414(a6)
     9f8:	7000           	moveq #0,d0
}
     9fa:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     9fe:	4fef 0044      	lea 68(sp),sp
     a02:	4e75           	rts

00000a04 <SwScrollerTest>:

char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
     a04:	4fef ff98      	lea -104(sp),sp
     a08:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  PrepareDisplaySW();
     a0c:	4eba 0218      	jsr c26 <PrepareDisplaySW>(pc)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     a10:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
     a16:	4878 0010      	pea 10 <_start+0x10>
     a1a:	4879 0000 a47c 	pea a47c <ClsSprites>
     a20:	42a7           	clr.l -(sp)
     a22:	2f00           	move.l d0,-(sp)
     a24:	4eba 1d56      	jsr 277c <TestCopperlistBatch>(pc)
     a28:	4fef 0010      	lea 16(sp),sp
     a2c:	4a80           	tst.l d0
     a2e:	6642           	bne.s a72 <SwScrollerTest+0x6e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     a30:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     a36:	2c40           	movea.l d0,a6
     a38:	4eae ffc4      	jsr -60(a6)
     a3c:	2f40 0070      	move.l d0,112(sp)
     a40:	202f 0070      	move.l 112(sp),d0
     a44:	2f40 006c      	move.l d0,108(sp)
     a48:	2f7c 0000 7440 	move.l #29760,104(sp)
     a4e:	0068 
     a50:	702c           	moveq #44,d0
     a52:	2f40 0064      	move.l d0,100(sp)
     a56:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     a5c:	2c40           	movea.l d0,a6
     a5e:	222f 006c      	move.l 108(sp),d1
     a62:	242f 0068      	move.l 104(sp),d2
     a66:	262f 0064      	move.l 100(sp),d3
     a6a:	4eae ffd0      	jsr -48(a6)
     a6e:	2f40 0060      	move.l d0,96(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     a72:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
     a78:	4878 000c      	pea c <_start+0xc>
     a7c:	4879 0000 a4bc 	pea a4bc <ClScreen>
     a82:	4878 0010      	pea 10 <_start+0x10>
     a86:	2f00           	move.l d0,-(sp)
     a88:	4eba 1cf2      	jsr 277c <TestCopperlistBatch>(pc)
     a8c:	4fef 0010      	lea 16(sp),sp
     a90:	4a80           	tst.l d0
     a92:	6642           	bne.s ad6 <SwScrollerTest+0xd2>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     a94:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     a9a:	2c40           	movea.l d0,a6
     a9c:	4eae ffc4      	jsr -60(a6)
     aa0:	2f40 005c      	move.l d0,92(sp)
     aa4:	202f 005c      	move.l 92(sp),d0
     aa8:	2f40 0058      	move.l d0,88(sp)
     aac:	2f7c 0000 7476 	move.l #29814,84(sp)
     ab2:	0054 
     ab4:	7036           	moveq #54,d0
     ab6:	2f40 0050      	move.l d0,80(sp)
     aba:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     ac0:	2c40           	movea.l d0,a6
     ac2:	222f 0058      	move.l 88(sp),d1
     ac6:	242f 0054      	move.l 84(sp),d2
     aca:	262f 0050      	move.l 80(sp),d3
     ace:	4eae ffd0      	jsr -48(a6)
     ad2:	2f40 004c      	move.l d0,76(sp)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     ad6:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
     adc:	4878 0002      	pea 2 <_start+0x2>
     ae0:	4879 0000 a3fc 	pea a3fc <ClColor>
     ae6:	4878 001e      	pea 1e <_start+0x1e>
     aea:	2f00           	move.l d0,-(sp)
     aec:	4eba 1c8e      	jsr 277c <TestCopperlistBatch>(pc)
     af0:	4fef 0010      	lea 16(sp),sp
     af4:	4a80           	tst.l d0
     af6:	6642           	bne.s b3a <SwScrollerTest+0x136>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     af8:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     afe:	2c40           	movea.l d0,a6
     b00:	4eae ffc4      	jsr -60(a6)
     b04:	2f40 0048      	move.l d0,72(sp)
     b08:	202f 0048      	move.l 72(sp),d0
     b0c:	2f40 0044      	move.l d0,68(sp)
     b10:	2f7c 0000 74ad 	move.l #29869,64(sp)
     b16:	0040 
     b18:	7021           	moveq #33,d0
     b1a:	2f40 003c      	move.l d0,60(sp)
     b1e:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     b24:	2c40           	movea.l d0,a6
     b26:	222f 0044      	move.l 68(sp),d1
     b2a:	242f 0040      	move.l 64(sp),d2
     b2e:	262f 003c      	move.l 60(sp),d3
     b32:	4eae ffd0      	jsr -48(a6)
     b36:	2f40 0038      	move.l d0,56(sp)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     b3a:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
     b40:	4878 fffe      	pea fffffffe <_end+0xffe9475a>
     b44:	4878 0020      	pea 20 <_start+0x20>
     b48:	2f00           	move.l d0,-(sp)
     b4a:	4eba 1c6e      	jsr 27ba <TestCopperlistPos>(pc)
     b4e:	4fef 000c      	lea 12(sp),sp
     b52:	4a80           	tst.l d0
     b54:	6642           	bne.s b98 <SwScrollerTest+0x194>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     b56:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     b5c:	2c40           	movea.l d0,a6
     b5e:	4eae ffc4      	jsr -60(a6)
     b62:	2f40 0034      	move.l d0,52(sp)
     b66:	202f 0034      	move.l 52(sp),d0
     b6a:	2f40 0030      	move.l d0,48(sp)
     b6e:	2f7c 0000 74cf 	move.l #29903,44(sp)
     b74:	002c 
     b76:	7022           	moveq #34,d0
     b78:	2f40 0028      	move.l d0,40(sp)
     b7c:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     b82:	2c40           	movea.l d0,a6
     b84:	222f 0030      	move.l 48(sp),d1
     b88:	242f 002c      	move.l 44(sp),d2
     b8c:	262f 0028      	move.l 40(sp),d3
     b90:	4eae ffd0      	jsr -48(a6)
     b94:	2f40 0024      	move.l d0,36(sp)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     b98:	2239 0000 b638 	move.l b638 <sw_text>,d1
     b9e:	2039 0016 b83c 	move.l 16b83c <DrawBuffer>,d0
     ba4:	2f01           	move.l d1,-(sp)
     ba6:	2f00           	move.l d0,-(sp)
     ba8:	4879 0000 b63c 	pea b63c <sw_testfont>
     bae:	4eba 0380      	jsr f30 <WriteFont>(pc)
     bb2:	4fef 000c      	lea 12(sp),sp

  UWORD *tstpointer = (UWORD *)DrawBuffer;
     bb6:	2f79 0016 b83c 	move.l 16b83c <DrawBuffer>,32(sp)
     bbc:	0020 
  if( *tstpointer != 0xff00)
     bbe:	206f 0020      	movea.l 32(sp),a0
     bc2:	3010           	move.w (a0),d0
     bc4:	0c40 ff00      	cmpi.w #-256,d0
     bc8:	6742           	beq.s c0c <SwScrollerTest+0x208>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     bca:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     bd0:	2c40           	movea.l d0,a6
     bd2:	4eae ffc4      	jsr -60(a6)
     bd6:	2f40 001c      	move.l d0,28(sp)
     bda:	202f 001c      	move.l 28(sp),d0
     bde:	2f40 0018      	move.l d0,24(sp)
     be2:	2f7c 0000 74f2 	move.l #29938,20(sp)
     be8:	0014 
     bea:	7031           	moveq #49,d0
     bec:	2f40 0010      	move.l d0,16(sp)
     bf0:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     bf6:	2c40           	movea.l d0,a6
     bf8:	222f 0018      	move.l 24(sp),d1
     bfc:	242f 0014      	move.l 20(sp),d2
     c00:	262f 0010      	move.l 16(sp),d3
     c04:	4eae ffd0      	jsr -48(a6)
     c08:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
     c0c:	2f3c 0000 c800 	move.l #51200,-(sp)
     c12:	4878 0084      	pea 84 <_start+0x84>
     c16:	4eba f4c8      	jsr e0 <FreeDisplay>(pc)
     c1a:	508f           	addq.l #8,sp
     c1c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     c20:	4fef 0068      	lea 104(sp),sp
     c24:	4e75           	rts

00000c26 <PrepareDisplaySW>:
 #include "swscroller.h"
 #include "utils.h"
 
 INCBIN(swfont, "raw/ruby16_8_1.raw");

 int PrepareDisplaySW() {
     c26:	4fef ffb8      	lea -72(sp),sp
     c2a:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildSW();
     c2e:	4eba 017e      	jsr dae <ClbuildSW>(pc)
     c32:	23c0 0016 b834 	move.l d0,16b834 <Copperlist1>
  Copperlist2 = ClbuildSW();
     c38:	4eba 0174      	jsr dae <ClbuildSW>(pc)
     c3c:	23c0 0016 b838 	move.l d0,16b838 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     c42:	2f7c 0000 c800 	move.l #51200,80(sp)
     c48:	0050 
     c4a:	7002           	moveq #2,d0
     c4c:	2f40 004c      	move.l d0,76(sp)
     c50:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
     c56:	2c40           	movea.l d0,a6
     c58:	202f 0050      	move.l 80(sp),d0
     c5c:	222f 004c      	move.l 76(sp),d1
     c60:	4eae ff3a      	jsr -198(a6)
     c64:	2f40 0048      	move.l d0,72(sp)
     c68:	202f 0048      	move.l 72(sp),d0
     c6c:	23c0 0016 b82c 	move.l d0,16b82c <Bitplane1>
  if(Bitplane1 == 0) {
     c72:	2039 0016 b82c 	move.l 16b82c <Bitplane1>,d0
     c78:	6658           	bne.s cd2 <PrepareDisplaySW+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     c7a:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     c80:	2c40           	movea.l d0,a6
     c82:	4eae ffc4      	jsr -60(a6)
     c86:	2f40 0044      	move.l d0,68(sp)
     c8a:	202f 0044      	move.l 68(sp),d0
     c8e:	2f40 0040      	move.l d0,64(sp)
     c92:	2f7c 0000 7ad5 	move.l #31445,60(sp)
     c98:	003c 
     c9a:	7026           	moveq #38,d0
     c9c:	2f40 0038      	move.l d0,56(sp)
     ca0:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     ca6:	2c40           	movea.l d0,a6
     ca8:	222f 0040      	move.l 64(sp),d1
     cac:	242f 003c      	move.l 60(sp),d2
     cb0:	262f 0038      	move.l 56(sp),d3
     cb4:	4eae ffd0      	jsr -48(a6)
     cb8:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
     cbc:	7001           	moveq #1,d0
     cbe:	2f40 0030      	move.l d0,48(sp)
     cc2:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     cc8:	2c40           	movea.l d0,a6
     cca:	222f 0030      	move.l 48(sp),d1
     cce:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
     cd2:	2039 0016 b82c 	move.l 16b82c <Bitplane1>,d0
     cd8:	23c0 0016 b83c 	move.l d0,16b83c <DrawBuffer>
  DrawCopper = Copperlist1;
     cde:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
     ce4:	23c0 0016 b844 	move.l d0,16b844 <DrawCopper>
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     cea:	2f7c 0000 c800 	move.l #51200,44(sp)
     cf0:	002c 
     cf2:	7002           	moveq #2,d0
     cf4:	2f40 0028      	move.l d0,40(sp)
     cf8:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
     cfe:	2c40           	movea.l d0,a6
     d00:	202f 002c      	move.l 44(sp),d0
     d04:	222f 0028      	move.l 40(sp),d1
     d08:	4eae ff3a      	jsr -198(a6)
     d0c:	2f40 0024      	move.l d0,36(sp)
     d10:	202f 0024      	move.l 36(sp),d0
     d14:	23c0 0016 b830 	move.l d0,16b830 <Bitplane2>
  if(Bitplane2 == 0) {
     d1a:	2039 0016 b830 	move.l 16b830 <Bitplane2>,d0
     d20:	6658           	bne.s d7a <PrepareDisplaySW+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     d22:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     d28:	2c40           	movea.l d0,a6
     d2a:	4eae ffc4      	jsr -60(a6)
     d2e:	2f40 0020      	move.l d0,32(sp)
     d32:	202f 0020      	move.l 32(sp),d0
     d36:	2f40 001c      	move.l d0,28(sp)
     d3a:	2f7c 0000 7afc 	move.l #31484,24(sp)
     d40:	0018 
     d42:	7026           	moveq #38,d0
     d44:	2f40 0014      	move.l d0,20(sp)
     d48:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     d4e:	2c40           	movea.l d0,a6
     d50:	222f 001c      	move.l 28(sp),d1
     d54:	242f 0018      	move.l 24(sp),d2
     d58:	262f 0014      	move.l 20(sp),d3
     d5c:	4eae ffd0      	jsr -48(a6)
     d60:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     d64:	7001           	moveq #1,d0
     d66:	2f40 000c      	move.l d0,12(sp)
     d6a:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     d70:	2c40           	movea.l d0,a6
     d72:	222f 000c      	move.l 12(sp),d1
     d76:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
     d7a:	2039 0016 b830 	move.l 16b830 <Bitplane2>,d0
     d80:	23c0 0016 b840 	move.l d0,16b840 <ViewBuffer>
  ViewCopper = Copperlist2;
     d86:	2039 0016 b838 	move.l 16b838 <Copperlist2>,d0
     d8c:	23c0 0016 b848 	move.l d0,16b848 <ViewCopper>
  SwapCl();
     d92:	4eba f460      	jsr 1f4 <SwapCl>(pc)
  SetBplPointers();
     d96:	4eba f3fe      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
     d9a:	4eba f458      	jsr 1f4 <SwapCl>(pc)
  SetBplPointers();
     d9e:	4eba f3f6      	jsr 196 <SetBplPointers>(pc)
  return 0;
     da2:	7000           	moveq #0,d0
}
     da4:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     da8:	4fef 0048      	lea 72(sp),sp
     dac:	4e75           	rts

00000dae <ClbuildSW>:

ULONG * ClbuildSW() {
     dae:	4fef ffc4      	lea -60(sp),sp
     db2:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
     db6:	2f7c 0000 0084 	move.l #132,48(sp)
     dbc:	0030 
     dbe:	7002           	moveq #2,d0
     dc0:	2f40 002c      	move.l d0,44(sp)
     dc4:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
     dca:	2c40           	movea.l d0,a6
     dcc:	202f 0030      	move.l 48(sp),d0
     dd0:	222f 002c      	move.l 44(sp),d1
     dd4:	4eae ff3a      	jsr -198(a6)
     dd8:	2f40 0028      	move.l d0,40(sp)
     ddc:	202f 0028      	move.l 40(sp),d0
     de0:	2f40 0024      	move.l d0,36(sp)
  
  if( retval == 0) {
     de4:	6658           	bne.s e3e <ClbuildSW+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     de6:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     dec:	2c40           	movea.l d0,a6
     dee:	4eae ffc4      	jsr -60(a6)
     df2:	2f40 0020      	move.l d0,32(sp)
     df6:	202f 0020      	move.l 32(sp),d0
     dfa:	2f40 001c      	move.l d0,28(sp)
     dfe:	2f7c 0000 7b23 	move.l #31523,24(sp)
     e04:	0018 
     e06:	7228           	moveq #40,d1
     e08:	2f41 0014      	move.l d1,20(sp)
     e0c:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     e12:	2c40           	movea.l d0,a6
     e14:	222f 001c      	move.l 28(sp),d1
     e18:	242f 0018      	move.l 24(sp),d2
     e1c:	262f 0014      	move.l 20(sp),d3
     e20:	4eae ffd0      	jsr -48(a6)
     e24:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     e28:	7401           	moveq #1,d2
     e2a:	2f42 000c      	move.l d2,12(sp)
     e2e:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
     e34:	2c40           	movea.l d0,a6
     e36:	222f 000c      	move.l 12(sp),d1
     e3a:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
     e3e:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
     e44:	2f7c 0000 a47c 	move.l #42108,64(sp)
     e4a:	0040 
  for(int i=0; i<16;i++)
     e4c:	42af 003c      	clr.l 60(sp)
     e50:	6024           	bra.s e76 <ClbuildSW+0xc8>
    *cl++ = *clpartinstruction++;
     e52:	222f 0040      	move.l 64(sp),d1
     e56:	2001           	move.l d1,d0
     e58:	5880           	addq.l #4,d0
     e5a:	2f40 0040      	move.l d0,64(sp)
     e5e:	202f 0044      	move.l 68(sp),d0
     e62:	2400           	move.l d0,d2
     e64:	5882           	addq.l #4,d2
     e66:	2f42 0044      	move.l d2,68(sp)
     e6a:	2041           	movea.l d1,a0
     e6c:	2210           	move.l (a0),d1
     e6e:	2040           	movea.l d0,a0
     e70:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
     e72:	52af 003c      	addq.l #1,60(sp)
     e76:	700f           	moveq #15,d0
     e78:	b0af 003c      	cmp.l 60(sp),d0
     e7c:	6cd4           	bge.s e52 <ClbuildSW+0xa4>
  clpartinstruction = ClScreen;
     e7e:	2f7c 0000 a4bc 	move.l #42172,64(sp)
     e84:	0040 
  for(int i=0; i<12;i++)
     e86:	42af 0038      	clr.l 56(sp)
     e8a:	6024           	bra.s eb0 <ClbuildSW+0x102>
    *cl++ = *clpartinstruction++;
     e8c:	222f 0040      	move.l 64(sp),d1
     e90:	2401           	move.l d1,d2
     e92:	5882           	addq.l #4,d2
     e94:	2f42 0040      	move.l d2,64(sp)
     e98:	202f 0044      	move.l 68(sp),d0
     e9c:	2400           	move.l d0,d2
     e9e:	5882           	addq.l #4,d2
     ea0:	2f42 0044      	move.l d2,68(sp)
     ea4:	2041           	movea.l d1,a0
     ea6:	2210           	move.l (a0),d1
     ea8:	2040           	movea.l d0,a0
     eaa:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
     eac:	52af 0038      	addq.l #1,56(sp)
     eb0:	700b           	moveq #11,d0
     eb2:	b0af 0038      	cmp.l 56(sp),d0
     eb6:	6cd4           	bge.s e8c <ClbuildSW+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
     eb8:	202f 0044      	move.l 68(sp),d0
     ebc:	2200           	move.l d0,d1
     ebe:	5881           	addq.l #4,d1
     ec0:	2f41 0044      	move.l d1,68(sp)
     ec4:	2040           	movea.l d0,a0
     ec6:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
     ecc:	202f 0044      	move.l 68(sp),d0
     ed0:	2200           	move.l d0,d1
     ed2:	5881           	addq.l #4,d1
     ed4:	2f41 0044      	move.l d1,68(sp)
     ed8:	2040           	movea.l d0,a0
     eda:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
     ee0:	2f7c 0000 a3fc 	move.l #41980,64(sp)
     ee6:	0040 
  for(int i=0; i<2;i++)
     ee8:	42af 0034      	clr.l 52(sp)
     eec:	6024           	bra.s f12 <ClbuildSW+0x164>
    *cl++ = *clpartinstruction++;
     eee:	222f 0040      	move.l 64(sp),d1
     ef2:	2001           	move.l d1,d0
     ef4:	5880           	addq.l #4,d0
     ef6:	2f40 0040      	move.l d0,64(sp)
     efa:	202f 0044      	move.l 68(sp),d0
     efe:	2400           	move.l d0,d2
     f00:	5882           	addq.l #4,d2
     f02:	2f42 0044      	move.l d2,68(sp)
     f06:	2041           	movea.l d1,a0
     f08:	2210           	move.l (a0),d1
     f0a:	2040           	movea.l d0,a0
     f0c:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
     f0e:	52af 0034      	addq.l #1,52(sp)
     f12:	7001           	moveq #1,d0
     f14:	b0af 0034      	cmp.l 52(sp),d0
     f18:	6cd4           	bge.s eee <ClbuildSW+0x140>

  *cl = 0xfffffffe;
     f1a:	206f 0044      	movea.l 68(sp),a0
     f1e:	72fe           	moveq #-2,d1
     f20:	2081           	move.l d1,(a0)

  return retval;
     f22:	202f 0024      	move.l 36(sp),d0
}
     f26:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     f2a:	4fef 003c      	lea 60(sp),sp
     f2e:	4e75           	rts

00000f30 <WriteFont>:

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
     f30:	4fef fff0      	lea -16(sp),sp
  UWORD *bmpptr = Destination;
     f34:	2f6f 0018 000c 	move.l 24(sp),12(sp)
  UWORD *fntptr = font;
     f3a:	2f6f 0014 0008 	move.l 20(sp),8(sp)

  char charpos = *text;
     f40:	206f 001c      	movea.l 28(sp),a0
     f44:	1f50 0003      	move.b (a0),3(sp)
  charpos -= 0x20;
     f48:	102f 0003      	move.b 3(sp),d0
     f4c:	0600 ffe0      	addi.b #-32,d0
     f50:	1f40 0003      	move.b d0,3(sp)
  charpos = charpos<<3;
     f54:	102f 0003      	move.b 3(sp),d0
     f58:	4880           	ext.w d0
     f5a:	48c0           	ext.l d0
     f5c:	e788           	lsl.l #3,d0
     f5e:	1f40 0003      	move.b d0,3(sp)
  fntptr += charpos;
     f62:	102f 0003      	move.b 3(sp),d0
     f66:	4880           	ext.w d0
     f68:	3040           	movea.w d0,a0
     f6a:	2008           	move.l a0,d0
     f6c:	d088           	add.l a0,d0
     f6e:	d1af 0008      	add.l d0,8(sp)
  for(int i=1;i<=8;i++) {
     f72:	7001           	moveq #1,d0
     f74:	2f40 0004      	move.l d0,4(sp)
     f78:	6020           	bra.s f9a <WriteFont+0x6a>
    *bmpptr = *fntptr++;
     f7a:	202f 0008      	move.l 8(sp),d0
     f7e:	2200           	move.l d0,d1
     f80:	5481           	addq.l #2,d1
     f82:	2f41 0008      	move.l d1,8(sp)
     f86:	2040           	movea.l d0,a0
     f88:	3010           	move.w (a0),d0
     f8a:	206f 000c      	movea.l 12(sp),a0
     f8e:	3080           	move.w d0,(a0)
    bmpptr += 40;
     f90:	7050           	moveq #80,d0
     f92:	d1af 000c      	add.l d0,12(sp)
  for(int i=1;i<=8;i++) {
     f96:	52af 0004      	addq.l #1,4(sp)
     f9a:	7208           	moveq #8,d1
     f9c:	b2af 0004      	cmp.l 4(sp),d1
     fa0:	6cd8           	bge.s f7a <WriteFont+0x4a>
  }

}
     fa2:	4fef 0010      	lea 16(sp),sp
     fa6:	4e75           	rts

00000fa8 <c2p>:
INCBIN_CHIP(rawzoom11, "raw/zoom_0.raw ");
INCBIN_CHIP(rawzoom12, "raw/zoom_0.raw ");
INCBIN_CHIP(rawzoom13, "raw/zoom_0.raw ");
INCBIN_CHIP(rawzoom14, "raw/zoom_14.raw ");

void c2p() {
     fa8:	4fef fff4      	lea -12(sp),sp
  c2p1x1_4_c5_gen_init( 336, 268, 0, 0, 0, 0);
     fac:	42a7           	clr.l -(sp)
     fae:	42a7           	clr.l -(sp)
     fb0:	42a7           	clr.l -(sp)
     fb2:	42a7           	clr.l -(sp)
     fb4:	4878 010c      	pea 10c <FreeDisplay+0x2c>
     fb8:	4878 0150      	pea 150 <FreeDisplay+0x70>
     fbc:	4eb9 0000 71d0 	jsr 71d0 <c2p1x1_4_c5_gen_init>
     fc2:	4fef 0018      	lea 24(sp),sp
  UWORD *src = rawzoom;
     fc6:	2f79 0000 b694 	move.l b694 <rawzoom>,8(sp)
     fcc:	0008 
  UWORD *dst = framebuffer;
     fce:	2f79 0000 b690 	move.l b690 <framebuffer>,4(sp)
     fd4:	0004 
  for(int i=0;i<=14;i++) {
     fd6:	4297           	clr.l (sp)
     fd8:	6022           	bra.s ffc <c2p+0x54>
    c2p1x1_4_c5_gen( src, dst);
     fda:	2f2f 0004      	move.l 4(sp),-(sp)
     fde:	2f2f 000c      	move.l 12(sp),-(sp)
     fe2:	4eb9 0000 724c 	jsr 724c <c2p1x1_4_c5_gen>
     fe8:	508f           	addq.l #8,sp
    src += 21*268*8;
     fea:	06af 0001 5fc0 	addi.l #90048,8(sp)
     ff0:	0008 
    dst += 28140;
     ff2:	06af 0000 dbd8 	addi.l #56280,4(sp)
     ff8:	0004 
  for(int i=0;i<=14;i++) {
     ffa:	5297           	addq.l #1,(sp)
     ffc:	700e           	moveq #14,d0
     ffe:	b097           	cmp.l (sp),d0
    1000:	6cd8           	bge.s fda <c2p+0x32>
  //Utils_FillLong( framebuffer, 0xaaaaaaaa, 1, 2856, 0); 
  /*Utils_FillLong( framebuffer+2856, 0x0, 1,2856, 0);
  Utils_FillLong( framebuffer+2856*2, 0x0, 1, 2856, 0);
  Utils_FillLong( framebuffer+2856*3, 0x0, 1, 2856, 0);
  Utils_FillLong( framebuffer+2856*4, 0x0, 1, 2856, 0);*/
}
    1002:	4fef 000c      	lea 12(sp),sp
    1006:	4e75           	rts

00001008 <Zoom_VblankHandler>:

void Zoom_VblankHandler() {
  
  Zoom_Counter++;
    1008:	3039 0016 b88a 	move.w 16b88a <Zoom_Counter>,d0
    100e:	5240           	addq.w #1,d0
    1010:	33c0 0016 b88a 	move.w d0,16b88a <Zoom_Counter>
  SwapCl();
    1016:	4eba f1dc      	jsr 1f4 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
    101a:	33fc 0001 0016 	move.w #1,16b890 <Zoom_MouseReleased>
    1020:	b890 
  if( MouseLeft())
    1022:	4eba f292      	jsr 2b6 <MouseLeft>(pc)
    1026:	4a40           	tst.w d0
    1028:	6708           	beq.s 1032 <Zoom_VblankHandler+0x2a>
    Zoom_Mousepressed = 1;
    102a:	33fc 0001 0016 	move.w #1,16b892 <Zoom_Mousepressed>
    1030:	b892 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
    1032:	3039 0016 b892 	move.w 16b892 <Zoom_Mousepressed>,d0
    1038:	0c40 0001      	cmpi.w #1,d0
    103c:	6616           	bne.s 1054 <Zoom_VblankHandler+0x4c>
    103e:	4eba f276      	jsr 2b6 <MouseLeft>(pc)
    1042:	4a40           	tst.w d0
    1044:	660e           	bne.s 1054 <Zoom_VblankHandler+0x4c>
    Zoom_MouseReleased = 1;
    1046:	33fc 0001 0016 	move.w #1,16b890 <Zoom_MouseReleased>
    104c:	b890 
    Zoom_Mousepressed = 0;
    104e:	4279 0016 b892 	clr.w 16b892 <Zoom_Mousepressed>
  }
    if( Zoom_MouseReleased == 1) {
    1054:	3039 0016 b890 	move.w 16b890 <Zoom_MouseReleased>,d0
    105a:	0c40 0001      	cmpi.w #1,d0
    105e:	666e           	bne.s 10ce <Zoom_VblankHandler+0xc6>
      Zoom_MouseReleased = 0;
    1060:	4279 0016 b890 	clr.w 16b890 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 0) {
    1066:	3039 0016 b898 	move.w 16b898 <Zoom_LevelOf102Zoom>,d0
    106c:	6652           	bne.s 10c0 <Zoom_VblankHandler+0xb8>
 
        if( Zoom_LevelOfZoom == 17)
    106e:	3039 0016 b896 	move.w 16b896 <Zoom_LevelOfZoom>,d0
    1074:	0c40 0011      	cmpi.w #17,d0
    1078:	660a           	bne.s 1084 <Zoom_VblankHandler+0x7c>
          Zoom_LevelOfZoom = 0;
    107a:	33fc 0000 0016 	move.w #0,16b896 <Zoom_LevelOfZoom>
    1080:	b896 
    1082:	600e           	bra.s 1092 <Zoom_VblankHandler+0x8a>
        else
          Zoom_LevelOfZoom++;
    1084:	3039 0016 b896 	move.w 16b896 <Zoom_LevelOfZoom>,d0
    108a:	5240           	addq.w #1,d0
    108c:	33c0 0016 b896 	move.w d0,16b896 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = MaxZoom102[Zoom_LevelOfZoom] - 2;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
    1092:	3039 0016 b896 	move.w 16b896 <Zoom_LevelOfZoom>,d0
    1098:	3000           	move.w d0,d0
    109a:	0280 0000 ffff 	andi.l #65535,d0
    10a0:	2240           	movea.l d0,a1
    10a2:	d3c0           	adda.l d0,a1
    10a4:	41f9 0000 b614 	lea b614 <MaxZoom102>,a0
    10aa:	3031 8800      	move.w (0,a1,a0.l),d0
    10ae:	5540           	subq.w #2,d0
    10b0:	33c0 0016 b898 	move.w d0,16b898 <Zoom_LevelOf102Zoom>
        Zoom_SwapBuffers(  0);
    10b6:	42a7           	clr.l -(sp)
    10b8:	4eba 0dc8      	jsr 1e82 <Zoom_SwapBuffers>(pc)
    10bc:	588f           	addq.l #4,sp
    10be:	600e           	bra.s 10ce <Zoom_VblankHandler+0xc6>
      } else 
        Zoom_LevelOf102Zoom--;
    10c0:	3039 0016 b898 	move.w 16b898 <Zoom_LevelOf102Zoom>,d0
    10c6:	5340           	subq.w #1,d0
    10c8:	33c0 0016 b898 	move.w d0,16b898 <Zoom_LevelOf102Zoom>
    }
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
    10ce:	2239 0016 b844 	move.l 16b844 <DrawCopper>,d1
    10d4:	3039 0016 b898 	move.w 16b898 <Zoom_LevelOf102Zoom>,d0
    10da:	3000           	move.w d0,d0
    10dc:	0280 0000 ffff 	andi.l #65535,d0
    10e2:	2f01           	move.l d1,-(sp)
    10e4:	2f00           	move.l d0,-(sp)
    10e6:	4eba f3b0      	jsr 498 <Zoom_Shrink102>(pc)
    10ea:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
    10ec:	2239 0016 b844 	move.l 16b844 <DrawCopper>,d1
    10f2:	2039 0016 b840 	move.l 16b840 <ViewBuffer>,d0
    10f8:	2f01           	move.l d1,-(sp)
    10fa:	2f00           	move.l d0,-(sp)
    10fc:	4eba 0d26      	jsr 1e24 <Zoom_SetBplPointers>(pc)
    1100:	508f           	addq.l #8,sp
 
}
    1102:	4e75           	rts

00001104 <Zoom_LoadImage>:

void Zoom_LoadImage( ULONG *destination) {  
    1104:	4fef fff4      	lea -12(sp),sp
    1108:	2f0e           	move.l a6,-(sp)
  CopyMem( rawzoom, destination, ZMBPLSIZE);
    110a:	2f79 0000 b694 	move.l b694 <rawzoom>,12(sp)
    1110:	000c 
    1112:	2f6f 0014 0008 	move.l 20(sp),8(sp)
    1118:	2f7c 0000 ff00 	move.l #65280,4(sp)
    111e:	0004 
    1120:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    1126:	2c40           	movea.l d0,a6
    1128:	206f 000c      	movea.l 12(sp),a0
    112c:	226f 0008      	movea.l 8(sp),a1
    1130:	202f 0004      	move.l 4(sp),d0
    1134:	4eae fd90      	jsr -624(a6)
}
    1138:	2c5f           	movea.l (sp)+,a6
    113a:	4fef 000c      	lea 12(sp),sp
    113e:	4e75           	rts

00001140 <Zoom_CopyWord>:

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080008, 
                                                       0x010a0000, 0x01001200 };

void  Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height) {  
    1140:	598f           	subq.l #4,sp
    1142:	202f 0010      	move.l 16(sp),d0
    1146:	3000           	move.w d0,d0
    1148:	3f40 0002      	move.w d0,2(sp)

  WaitBlt();
    114c:	4eba ef66      	jsr b4 <WaitBlt>(pc)

  hw->bltapt = (UWORD *) source;
    1150:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1156:	216f 0008 0050 	move.l 8(sp),80(a0)
  hw->bltdpt = (UWORD *) destination;
    115c:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1162:	216f 000c 0054 	move.l 12(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    1168:	302f 0002      	move.w 2(sp),d0
    116c:	ed48           	lsl.w #6,d0
    116e:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1174:	5440           	addq.w #2,d0
    1176:	3140 0058      	move.w d0,88(a0)

}
    117a:	588f           	addq.l #4,sp
    117c:	4e75           	rts

0000117e <Zoom_ZoomBlit>:

void Zoom_ZoomBlit( UWORD *source, UWORD *destination, UWORD height) {
    117e:	518f           	subq.l #8,sp
    1180:	202f 0014      	move.l 20(sp),d0
    1184:	3000           	move.w d0,d0
    1186:	3f40 0002      	move.w d0,2(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B

  UWORD *blta = source + ZoomBlit_Increment4SrcA;
    118a:	3039 0016 b880 	move.w 16b880 <ZoomBlit_Increment4SrcA>,d0
    1190:	3000           	move.w d0,d0
    1192:	0280 0000 ffff 	andi.l #65535,d0
    1198:	d080           	add.l d0,d0
    119a:	222f 000c      	move.l 12(sp),d1
    119e:	d280           	add.l d0,d1
    11a0:	2f41 0004      	move.l d1,4(sp)
  WaitBlt();
    11a4:	4eba ef0e      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  
  hw->bltapt = blta;
    11a8:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    11ae:	216f 0004 0050 	move.l 4(sp),80(a0)
  hw->bltbpt = source;
    11b4:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    11ba:	216f 000c 004c 	move.l 12(sp),76(a0)
  hw->bltdpt = destination;
    11c0:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    11c6:	216f 0010 0054 	move.l 16(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    11cc:	302f 0002      	move.w 2(sp),d0
    11d0:	ed48           	lsl.w #6,d0
    11d2:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    11d8:	5440           	addq.w #2,d0
    11da:	3140 0058      	move.w d0,88(a0)

}
    11de:	508f           	addq.l #8,sp
    11e0:	4e75           	rts

000011e2 <Zoom_ZoomBlit2>:

void Zoom_ZoomBlit2( UWORD *src4a, UWORD *src4b, UWORD *dst, UWORD height,
                                                 UWORD bltamod, UWORD bltbmod
                                                        , UWORD numofwords) {
    11e2:	518f           	subq.l #8,sp
    11e4:	226f 0018      	movea.l 24(sp),a1
    11e8:	206f 001c      	movea.l 28(sp),a0
    11ec:	222f 0020      	move.l 32(sp),d1
    11f0:	202f 0024      	move.l 36(sp),d0
    11f4:	3249           	movea.w a1,a1
    11f6:	3f49 0006      	move.w a1,6(sp)
    11fa:	3048           	movea.w a0,a0
    11fc:	3f48 0004      	move.w a0,4(sp)
    1200:	3201           	move.w d1,d1
    1202:	3f41 0002      	move.w d1,2(sp)
    1206:	3000           	move.w d0,d0
    1208:	3e80           	move.w d0,(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B
  hw->bltamod = bltamod;
    120a:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1210:	316f 0004 0064 	move.w 4(sp),100(a0)
  hw->bltbmod = bltbmod;  
    1216:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    121c:	316f 0002 0062 	move.w 2(sp),98(a0)
  hw->bltapt = src4a;
    1222:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1228:	216f 000c 0050 	move.l 12(sp),80(a0)
  hw->bltbpt = src4b;
    122e:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1234:	216f 0010 004c 	move.l 16(sp),76(a0)
  hw->bltdpt = dst;
    123a:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1240:	216f 0014 0054 	move.l 20(sp),84(a0)
  hw->bltsize = (height<<6)+numofwords;
    1246:	302f 0006      	move.w 6(sp),d0
    124a:	ed48           	lsl.w #6,d0
    124c:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1252:	d057           	add.w (sp),d0
    1254:	3140 0058      	move.w d0,88(a0)
  
  WaitBlt();
    1258:	4eba ee5a      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a  

}
    125c:	508f           	addq.l #8,sp
    125e:	4e75           	rts

00001260 <Zoom_InitRun>:


void Zoom_InitRun() {
    1260:	4fef ffe0      	lea -32(sp),sp
    1264:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    1266:	4279 0016 b88a 	clr.w 16b88a <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    126c:	7004           	moveq #4,d0
    126e:	2f40 0020      	move.l d0,32(sp)
    1272:	7002           	moveq #2,d0
    1274:	2f40 001c      	move.l d0,28(sp)
    1278:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    127e:	2c40           	movea.l d0,a6
    1280:	202f 0020      	move.l 32(sp),d0
    1284:	222f 001c      	move.l 28(sp),d1
    1288:	4eae ff3a      	jsr -198(a6)
    128c:	2f40 0018      	move.l d0,24(sp)
    1290:	202f 0018      	move.l 24(sp),d0
    1294:	23c0 0016 b878 	move.l d0,16b878 <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 15;
    129a:	33fc 000f 0016 	move.w #15,16b898 <Zoom_LevelOf102Zoom>
    12a0:	b898 
  ZoomHorizontal = 16;
    12a2:	33fc 0010 0016 	move.w #16,16b89c <ZoomHorizontal>
    12a8:	b89c 
  Zoom_PrepareDisplay();
    12aa:	4eba 0142      	jsr 13ee <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 15, Copperlist1);
    12ae:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    12b4:	2f00           	move.l d0,-(sp)
    12b6:	4878 000f      	pea f <_start+0xf>
    12ba:	4eba f1dc      	jsr 498 <Zoom_Shrink102>(pc)
    12be:	508f           	addq.l #8,sp
  Zoom_Shrink102( 15, Copperlist2);
    12c0:	2039 0016 b838 	move.l 16b838 <Copperlist2>,d0
    12c6:	2f00           	move.l d0,-(sp)
    12c8:	4878 000f      	pea f <_start+0xf>
    12cc:	4eba f1ca      	jsr 498 <Zoom_Shrink102>(pc)
    12d0:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 1;
    12d2:	33fc 0001 0016 	move.w #1,16b896 <Zoom_LevelOfZoom>
    12d8:	b896 
  Zoom_Direction = 1;                                                  
    12da:	33fc 0001 0016 	move.w #1,16b89a <Zoom_Direction>
    12e0:	b89a 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    12e2:	7016           	moveq #22,d0
    12e4:	2f40 0014      	move.l d0,20(sp)
    12e8:	2f7c 0001 0001 	move.l #65537,16(sp)
    12ee:	0010 
    12f0:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    12f6:	2c40           	movea.l d0,a6
    12f8:	202f 0014      	move.l 20(sp),d0
    12fc:	222f 0010      	move.l 16(sp),d1
    1300:	4eae ff3a      	jsr -198(a6)
    1304:	2f40 000c      	move.l d0,12(sp)
    1308:	202f 000c      	move.l 12(sp),d0
    130c:	23c0 0016 b882 	move.l d0,16b882 <Zoom_vbint>
    1312:	2039 0016 b882 	move.l 16b882 <Zoom_vbint>,d0
    1318:	673e           	beq.s 1358 <Zoom_InitRun+0xf8>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    131a:	2079 0016 b882 	movea.l 16b882 <Zoom_vbint>,a0
    1320:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    1326:	2079 0016 b882 	movea.l 16b882 <Zoom_vbint>,a0
    132c:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    1332:	2079 0016 b882 	movea.l 16b882 <Zoom_vbint>,a0
    1338:	217c 0000 7b49 	move.l #31561,10(a0)
    133e:	000a 
    Zoom_vbint->is_Data = NULL;
    1340:	2079 0016 b882 	movea.l 16b882 <Zoom_vbint>,a0
    1346:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    134a:	2079 0016 b882 	movea.l 16b882 <Zoom_vbint>,a0
    1350:	217c 0000 1008 	move.l #4104,18(a0)
    1356:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    1358:	7005           	moveq #5,d0
    135a:	2f40 0008      	move.l d0,8(sp)
    135e:	2f79 0016 b882 	move.l 16b882 <Zoom_vbint>,4(sp)
    1364:	0004 
    1366:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    136c:	2c40           	movea.l d0,a6
    136e:	202f 0008      	move.l 8(sp),d0
    1372:	226f 0004      	movea.l 4(sp),a1
    1376:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    137a:	2239 0016 b848 	move.l 16b848 <ViewCopper>,d1
    1380:	2039 0016 b840 	move.l 16b840 <ViewBuffer>,d0
    1386:	2f01           	move.l d1,-(sp)
    1388:	2f00           	move.l d0,-(sp)
    138a:	4eba 0a98      	jsr 1e24 <Zoom_SetBplPointers>(pc)
    138e:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    1390:	2239 0016 b844 	move.l 16b844 <DrawCopper>,d1
    1396:	2039 0016 b840 	move.l 16b840 <ViewBuffer>,d0
    139c:	2f01           	move.l d1,-(sp)
    139e:	2f00           	move.l d0,-(sp)
    13a0:	4eba 0a82      	jsr 1e24 <Zoom_SetBplPointers>(pc)
    13a4:	508f           	addq.l #8,sp
  SwapCl();
    13a6:	4eba ee4c      	jsr 1f4 <SwapCl>(pc)
  
}
    13aa:	2c5f           	movea.l (sp)+,a6
    13ac:	4fef 0020      	lea 32(sp),sp
    13b0:	4e75           	rts

000013b2 <Zoom_Dealloc>:

void Zoom_Dealloc() {
    13b2:	518f           	subq.l #8,sp
    13b4:	2f0e           	move.l a6,-(sp)
  RemIntServer(INTB_VERTB, Zoom_vbint);
    13b6:	7005           	moveq #5,d0
    13b8:	2f40 0008      	move.l d0,8(sp)
    13bc:	2f79 0016 b882 	move.l 16b882 <Zoom_vbint>,4(sp)
    13c2:	0004 
    13c4:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    13ca:	2c40           	movea.l d0,a6
    13cc:	202f 0008      	move.l 8(sp),d0
    13d0:	226f 0004      	movea.l 4(sp),a1
    13d4:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    13d8:	2f3c 0000 ff00 	move.l #65280,-(sp)
    13de:	4878 031c      	pea 31c <RunDemo+0x6>
    13e2:	4eba ecfc      	jsr e0 <FreeDisplay>(pc)
    13e6:	508f           	addq.l #8,sp
}
    13e8:	2c5f           	movea.l (sp)+,a6
    13ea:	508f           	addq.l #8,sp
    13ec:	4e75           	rts

000013ee <Zoom_PrepareDisplay>:
  
int Zoom_PrepareDisplay() {
  Zoom_SwapBuffers( 0);
    13ee:	42a7           	clr.l -(sp)
    13f0:	4eba 0a90      	jsr 1e82 <Zoom_SwapBuffers>(pc)
    13f4:	588f           	addq.l #4,sp
  Copperlist1 = ClbuildZoom( );
    13f6:	4eba 007a      	jsr 1472 <ClbuildZoom>(pc)
    13fa:	23c0 0016 b834 	move.l d0,16b834 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    1400:	4eba 0070      	jsr 1472 <ClbuildZoom>(pc)
    1404:	23c0 0016 b838 	move.l d0,16b838 <Copperlist2>
  if(Bitplane2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;*/
  DrawCopper = Copperlist1;
    140a:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    1410:	23c0 0016 b844 	move.l d0,16b844 <DrawCopper>
  ViewCopper = Copperlist2;
    1416:	2039 0016 b838 	move.l 16b838 <Copperlist2>,d0
    141c:	23c0 0016 b848 	move.l d0,16b848 <ViewCopper>
  return 0;
    1422:	7000           	moveq #0,d0
}
    1424:	4e75           	rts

00001426 <Zoom_Init>:

void Zoom_Init() {
    1426:	4fef fff4      	lea -12(sp),sp
    142a:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    142c:	7004           	moveq #4,d0
    142e:	2f40 000c      	move.l d0,12(sp)
    1432:	7002           	moveq #2,d0
    1434:	2f40 0008      	move.l d0,8(sp)
    1438:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    143e:	2c40           	movea.l d0,a6
    1440:	202f 000c      	move.l 12(sp),d0
    1444:	222f 0008      	move.l 8(sp),d1
    1448:	4eae ff3a      	jsr -198(a6)
    144c:	2f40 0004      	move.l d0,4(sp)
    1450:	202f 0004      	move.l 4(sp),d0
    1454:	23c0 0016 b878 	move.l d0,16b878 <Zoom_ZoomBlitMask>
  ZoomHorizontal = 16;
    145a:	33fc 0010 0016 	move.w #16,16b89c <ZoomHorizontal>
    1460:	b89c 
  Zoom_LevelOf102Zoom = 15;
    1462:	33fc 000f 0016 	move.w #15,16b898 <Zoom_LevelOf102Zoom>
    1468:	b898 
}
    146a:	2c5f           	movea.l (sp)+,a6
    146c:	4fef 000c      	lea 12(sp),sp
    1470:	4e75           	rts

00001472 <ClbuildZoom>:


ULONG * ClbuildZoom() {
    1472:	4fef ffac      	lea -84(sp),sp
    1476:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    147a:	2f7c 0000 031c 	move.l #796,68(sp)
    1480:	0044 
    1482:	7002           	moveq #2,d0
    1484:	2f40 0040      	move.l d0,64(sp)
    1488:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    148e:	2c40           	movea.l d0,a6
    1490:	202f 0044      	move.l 68(sp),d0
    1494:	222f 0040      	move.l 64(sp),d1
    1498:	4eae ff3a      	jsr -198(a6)
    149c:	2f40 003c      	move.l d0,60(sp)
    14a0:	202f 003c      	move.l 60(sp),d0
    14a4:	2f40 0038      	move.l d0,56(sp)
  
  if( retval == 0) {
    14a8:	6658           	bne.s 1502 <ClbuildZoom+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    14aa:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    14b0:	2c40           	movea.l d0,a6
    14b2:	4eae ffc4      	jsr -60(a6)
    14b6:	2f40 0034      	move.l d0,52(sp)
    14ba:	202f 0034      	move.l 52(sp),d0
    14be:	2f40 0030      	move.l d0,48(sp)
    14c2:	2f7c 0000 7b23 	move.l #31523,44(sp)
    14c8:	002c 
    14ca:	7228           	moveq #40,d1
    14cc:	2f41 0028      	move.l d1,40(sp)
    14d0:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    14d6:	2c40           	movea.l d0,a6
    14d8:	222f 0030      	move.l 48(sp),d1
    14dc:	242f 002c      	move.l 44(sp),d2
    14e0:	262f 0028      	move.l 40(sp),d3
    14e4:	4eae ffd0      	jsr -48(a6)
    14e8:	2f40 0024      	move.l d0,36(sp)
    Exit(1);
    14ec:	7401           	moveq #1,d2
    14ee:	2f42 0020      	move.l d2,32(sp)
    14f2:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    14f8:	2c40           	movea.l d0,a6
    14fa:	222f 0020      	move.l 32(sp),d1
    14fe:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    1502:	2f6f 0038 005c 	move.l 56(sp),92(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    1508:	2f7c 0000 a47c 	move.l #42108,88(sp)
    150e:	0058 
  for(int i=0; i<16;i++)
    1510:	42af 0054      	clr.l 84(sp)
    1514:	6024           	bra.s 153a <ClbuildZoom+0xc8>
    *cl++ = *clpartinstruction++;
    1516:	222f 0058      	move.l 88(sp),d1
    151a:	2001           	move.l d1,d0
    151c:	5880           	addq.l #4,d0
    151e:	2f40 0058      	move.l d0,88(sp)
    1522:	202f 005c      	move.l 92(sp),d0
    1526:	2400           	move.l d0,d2
    1528:	5882           	addq.l #4,d2
    152a:	2f42 005c      	move.l d2,92(sp)
    152e:	2041           	movea.l d1,a0
    1530:	2210           	move.l (a0),d1
    1532:	2040           	movea.l d0,a0
    1534:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    1536:	52af 0054      	addq.l #1,84(sp)
    153a:	700f           	moveq #15,d0
    153c:	b0af 0054      	cmp.l 84(sp),d0
    1540:	6cd4           	bge.s 1516 <ClbuildZoom+0xa4>
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
    1542:	2f7c 0000 a4bc 	move.l #42172,88(sp)
    1548:	0058 
  for(int i=0; i<12;i++)
    154a:	42af 0050      	clr.l 80(sp)
    154e:	6024           	bra.s 1574 <ClbuildZoom+0x102>
    *cl++ = *clpartinstruction++;
    1550:	222f 0058      	move.l 88(sp),d1
    1554:	2401           	move.l d1,d2
    1556:	5882           	addq.l #4,d2
    1558:	2f42 0058      	move.l d2,88(sp)
    155c:	202f 005c      	move.l 92(sp),d0
    1560:	2400           	move.l d0,d2
    1562:	5882           	addq.l #4,d2
    1564:	2f42 005c      	move.l d2,92(sp)
    1568:	2041           	movea.l d1,a0
    156a:	2210           	move.l (a0),d1
    156c:	2040           	movea.l d0,a0
    156e:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    1570:	52af 0050      	addq.l #1,80(sp)
    1574:	700b           	moveq #11,d0
    1576:	b0af 0050      	cmp.l 80(sp),d0
    157a:	6cd4           	bge.s 1550 <ClbuildZoom+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    157c:	202f 005c      	move.l 92(sp),d0
    1580:	2200           	move.l d0,d1
    1582:	5881           	addq.l #4,d1
    1584:	2f41 005c      	move.l d1,92(sp)
    1588:	2040           	movea.l d0,a0
    158a:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    1590:	202f 005c      	move.l 92(sp),d0
    1594:	2200           	move.l d0,d1
    1596:	5881           	addq.l #4,d1
    1598:	2f41 005c      	move.l d1,92(sp)
    159c:	2040           	movea.l d0,a0
    159e:	20bc 00e2 0000 	move.l #14811136,(a0)
  *cl++ = 0x00e40000;
    15a4:	202f 005c      	move.l 92(sp),d0
    15a8:	2200           	move.l d0,d1
    15aa:	5881           	addq.l #4,d1
    15ac:	2f41 005c      	move.l d1,92(sp)
    15b0:	2040           	movea.l d0,a0
    15b2:	20bc 00e4 0000 	move.l #14942208,(a0)
  *cl++ = 0x00e60000;
    15b8:	202f 005c      	move.l 92(sp),d0
    15bc:	2200           	move.l d0,d1
    15be:	5881           	addq.l #4,d1
    15c0:	2f41 005c      	move.l d1,92(sp)
    15c4:	2040           	movea.l d0,a0
    15c6:	20bc 00e6 0000 	move.l #15073280,(a0)
  *cl++ = 0x00e80000;
    15cc:	202f 005c      	move.l 92(sp),d0
    15d0:	2200           	move.l d0,d1
    15d2:	5881           	addq.l #4,d1
    15d4:	2f41 005c      	move.l d1,92(sp)
    15d8:	2040           	movea.l d0,a0
    15da:	20bc 00e8 0000 	move.l #15204352,(a0)
  *cl++ = 0x00ea0000;
    15e0:	202f 005c      	move.l 92(sp),d0
    15e4:	2200           	move.l d0,d1
    15e6:	5881           	addq.l #4,d1
    15e8:	2f41 005c      	move.l d1,92(sp)
    15ec:	2040           	movea.l d0,a0
    15ee:	20bc 00ea 0000 	move.l #15335424,(a0)
  *cl++ = 0x00ec0000;
    15f4:	202f 005c      	move.l 92(sp),d0
    15f8:	2200           	move.l d0,d1
    15fa:	5881           	addq.l #4,d1
    15fc:	2f41 005c      	move.l d1,92(sp)
    1600:	2040           	movea.l d0,a0
    1602:	20bc 00ec 0000 	move.l #15466496,(a0)
  *cl++ = 0x00ee0000;
    1608:	202f 005c      	move.l 92(sp),d0
    160c:	2200           	move.l d0,d1
    160e:	5881           	addq.l #4,d1
    1610:	2f41 005c      	move.l d1,92(sp)
    1614:	2040           	movea.l d0,a0
    1616:	20bc 00ee 0000 	move.l #15597568,(a0)
  *cl++ = 0x00f00000;
    161c:	202f 005c      	move.l 92(sp),d0
    1620:	2200           	move.l d0,d1
    1622:	5881           	addq.l #4,d1
    1624:	2f41 005c      	move.l d1,92(sp)
    1628:	2040           	movea.l d0,a0
    162a:	20bc 00f0 0000 	move.l #15728640,(a0)
  *cl++ = 0x00f20000;
    1630:	202f 005c      	move.l 92(sp),d0
    1634:	2200           	move.l d0,d1
    1636:	5881           	addq.l #4,d1
    1638:	2f41 005c      	move.l d1,92(sp)
    163c:	2040           	movea.l d0,a0
    163e:	20bc 00f2 0000 	move.l #15859712,(a0)

  clpartinstruction = ClColor;
    1644:	2f7c 0000 a3fc 	move.l #41980,88(sp)
    164a:	0058 
  for(int i=0; i<32;i++)
    164c:	42af 004c      	clr.l 76(sp)
    1650:	6024           	bra.s 1676 <ClbuildZoom+0x204>
    *cl++ = *clpartinstruction++;
    1652:	222f 0058      	move.l 88(sp),d1
    1656:	2001           	move.l d1,d0
    1658:	5880           	addq.l #4,d0
    165a:	2f40 0058      	move.l d0,88(sp)
    165e:	202f 005c      	move.l 92(sp),d0
    1662:	2400           	move.l d0,d2
    1664:	5882           	addq.l #4,d2
    1666:	2f42 005c      	move.l d2,92(sp)
    166a:	2041           	movea.l d1,a0
    166c:	2210           	move.l (a0),d1
    166e:	2040           	movea.l d0,a0
    1670:	2081           	move.l d1,(a0)
  for(int i=0; i<32;i++)
    1672:	52af 004c      	addq.l #1,76(sp)
    1676:	701f           	moveq #31,d0
    1678:	b0af 004c      	cmp.l 76(sp),d0
    167c:	6cd4           	bge.s 1652 <ClbuildZoom+0x1e0>
  
  ULONG cop2 = cl+3;
    167e:	700c           	moveq #12,d0
    1680:	d0af 005c      	add.l 92(sp),d0
    1684:	2f40 001c      	move.l d0,28(sp)
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    1688:	202f 001c      	move.l 28(sp),d0
    168c:	4240           	clr.w d0
    168e:	4840           	swap d0
    1690:	2200           	move.l d0,d1
    1692:	0681 0084 0000 	addi.l #8650752,d1
    1698:	2f41 0018      	move.l d1,24(sp)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    169c:	202f 001c      	move.l 28(sp),d0
    16a0:	0280 0000 ffff 	andi.l #65535,d0
    16a6:	2400           	move.l d0,d2
    16a8:	0682 0086 0000 	addi.l #8781824,d2
    16ae:	2f42 0014      	move.l d2,20(sp)
  clpartinstruction = Cl102ZoomInit;
    16b2:	2f7c 0000 a4ec 	move.l #42220,88(sp)
    16b8:	0058 
  *cl++ = cop2lch;
    16ba:	202f 005c      	move.l 92(sp),d0
    16be:	2200           	move.l d0,d1
    16c0:	5881           	addq.l #4,d1
    16c2:	2f41 005c      	move.l d1,92(sp)
    16c6:	2040           	movea.l d0,a0
    16c8:	20af 0018      	move.l 24(sp),(a0)
  *cl++ = cop2lcl;
    16cc:	202f 005c      	move.l 92(sp),d0
    16d0:	2200           	move.l d0,d1
    16d2:	5881           	addq.l #4,d1
    16d4:	2f41 005c      	move.l d1,92(sp)
    16d8:	2040           	movea.l d0,a0
    16da:	20af 0014      	move.l 20(sp),(a0)
  *cl++ = 0x2c01ff00;
    16de:	202f 005c      	move.l 92(sp),d0
    16e2:	2200           	move.l d0,d1
    16e4:	5881           	addq.l #4,d1
    16e6:	2f41 005c      	move.l d1,92(sp)
    16ea:	2040           	movea.l d0,a0
    16ec:	20bc 2c01 ff00 	move.l #738328320,(a0)

  ULONG cop2br1 = cop2 + ( (30)<<2);
    16f2:	7078           	moveq #120,d0
    16f4:	d0af 001c      	add.l 28(sp),d0
    16f8:	2f40 0010      	move.l d0,16(sp)
  ULONG cop2br2 = cop2 + ( (86)<<2);
    16fc:	222f 001c      	move.l 28(sp),d1
    1700:	0681 0000 0158 	addi.l #344,d1
    1706:	2f41 000c      	move.l d1,12(sp)
  clpartinstruction = Cl102ZoomRepeat;
    170a:	2f7c 0000 a4f8 	move.l #42232,88(sp)
    1710:	0058 
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    1712:	202f 0010      	move.l 16(sp),d0
    1716:	4240           	clr.w d0
    1718:	4840           	swap d0
    171a:	307c 0070      	movea.w #112,a0
    171e:	d1ef 0058      	adda.l 88(sp),a0
    1722:	0680 0084 0000 	addi.l #8650752,d0
    1728:	2080           	move.l d0,(a0)
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    172a:	202f 0010      	move.l 16(sp),d0
    172e:	0280 0000 ffff 	andi.l #65535,d0
    1734:	307c 0074      	movea.w #116,a0
    1738:	d1ef 0058      	adda.l 88(sp),a0
    173c:	0680 0086 0000 	addi.l #8781824,d0
    1742:	2080           	move.l d0,(a0)
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    1744:	202f 000c      	move.l 12(sp),d0
    1748:	4240           	clr.w d0
    174a:	4840           	swap d0
    174c:	206f 0058      	movea.l 88(sp),a0
    1750:	41e8 0150      	lea 336(a0),a0
    1754:	0680 0084 0000 	addi.l #8650752,d0
    175a:	2080           	move.l d0,(a0)
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    175c:	202f 000c      	move.l 12(sp),d0
    1760:	0280 0000 ffff 	andi.l #65535,d0
    1766:	206f 0058      	movea.l 88(sp),a0
    176a:	41e8 0154      	lea 340(a0),a0
    176e:	0680 0086 0000 	addi.l #8781824,d0
    1774:	2080           	move.l d0,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    1776:	42af 0048      	clr.l 72(sp)
    177a:	6024           	bra.s 17a0 <ClbuildZoom+0x32e>
    *cl++ = *clpartinstruction++;
    177c:	222f 0058      	move.l 88(sp),d1
    1780:	2401           	move.l d1,d2
    1782:	5882           	addq.l #4,d2
    1784:	2f42 0058      	move.l d2,88(sp)
    1788:	202f 005c      	move.l 92(sp),d0
    178c:	2400           	move.l d0,d2
    178e:	5882           	addq.l #4,d2
    1790:	2f42 005c      	move.l d2,92(sp)
    1794:	2041           	movea.l d1,a0
    1796:	2210           	move.l (a0),d1
    1798:	2040           	movea.l d0,a0
    179a:	2081           	move.l d1,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    179c:	52af 0048      	addq.l #1,72(sp)
    17a0:	7071           	moveq #113,d0
    17a2:	b0af 0048      	cmp.l 72(sp),d0
    17a6:	6cd4           	bge.s 177c <ClbuildZoom+0x30a>

   *cl++ = 0xfffffffe;
    17a8:	202f 005c      	move.l 92(sp),d0
    17ac:	2200           	move.l d0,d1
    17ae:	5881           	addq.l #4,d1
    17b0:	2f41 005c      	move.l d1,92(sp)
    17b4:	74fe           	moveq #-2,d2
    17b6:	2040           	movea.l d0,a0
    17b8:	2082           	move.l d2,(a0)

  return retval;
    17ba:	202f 0038      	move.l 56(sp),d0
}
    17be:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    17c2:	4fef 0054      	lea 84(sp),sp
    17c6:	4e75           	rts

000017c8 <PrepareDisplayZoom>:

 int PrepareDisplayZoom() {
    17c8:	4fef ffb8      	lea -72(sp),sp
    17cc:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildZoom();
    17d0:	4eba fca0      	jsr 1472 <ClbuildZoom>(pc)
    17d4:	23c0 0016 b834 	move.l d0,16b834 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    17da:	4eba fc96      	jsr 1472 <ClbuildZoom>(pc)
    17de:	23c0 0016 b838 	move.l d0,16b838 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    17e4:	2f7c 0000 ff00 	move.l #65280,80(sp)
    17ea:	0050 
    17ec:	7002           	moveq #2,d0
    17ee:	2f40 004c      	move.l d0,76(sp)
    17f2:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    17f8:	2c40           	movea.l d0,a6
    17fa:	202f 0050      	move.l 80(sp),d0
    17fe:	222f 004c      	move.l 76(sp),d1
    1802:	4eae ff3a      	jsr -198(a6)
    1806:	2f40 0048      	move.l d0,72(sp)
    180a:	202f 0048      	move.l 72(sp),d0
    180e:	23c0 0016 b82c 	move.l d0,16b82c <Bitplane1>
  if(Bitplane1 == 0) {
    1814:	2039 0016 b82c 	move.l 16b82c <Bitplane1>,d0
    181a:	6658           	bne.s 1874 <PrepareDisplayZoom+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    181c:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    1822:	2c40           	movea.l d0,a6
    1824:	4eae ffc4      	jsr -60(a6)
    1828:	2f40 0044      	move.l d0,68(sp)
    182c:	202f 0044      	move.l 68(sp),d0
    1830:	2f40 0040      	move.l d0,64(sp)
    1834:	2f7c 0000 7ad5 	move.l #31445,60(sp)
    183a:	003c 
    183c:	7026           	moveq #38,d0
    183e:	2f40 0038      	move.l d0,56(sp)
    1842:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    1848:	2c40           	movea.l d0,a6
    184a:	222f 0040      	move.l 64(sp),d1
    184e:	242f 003c      	move.l 60(sp),d2
    1852:	262f 0038      	move.l 56(sp),d3
    1856:	4eae ffd0      	jsr -48(a6)
    185a:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    185e:	7001           	moveq #1,d0
    1860:	2f40 0030      	move.l d0,48(sp)
    1864:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    186a:	2c40           	movea.l d0,a6
    186c:	222f 0030      	move.l 48(sp),d1
    1870:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    1874:	2039 0016 b82c 	move.l 16b82c <Bitplane1>,d0
    187a:	23c0 0016 b83c 	move.l d0,16b83c <DrawBuffer>
  DrawCopper = Copperlist1;
    1880:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    1886:	23c0 0016 b844 	move.l d0,16b844 <DrawCopper>
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    188c:	2f7c 0000 ff00 	move.l #65280,44(sp)
    1892:	002c 
    1894:	7002           	moveq #2,d0
    1896:	2f40 0028      	move.l d0,40(sp)
    189a:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    18a0:	2c40           	movea.l d0,a6
    18a2:	202f 002c      	move.l 44(sp),d0
    18a6:	222f 0028      	move.l 40(sp),d1
    18aa:	4eae ff3a      	jsr -198(a6)
    18ae:	2f40 0024      	move.l d0,36(sp)
    18b2:	202f 0024      	move.l 36(sp),d0
    18b6:	23c0 0016 b830 	move.l d0,16b830 <Bitplane2>
  if(Bitplane2 == 0) {
    18bc:	2039 0016 b830 	move.l 16b830 <Bitplane2>,d0
    18c2:	6658           	bne.s 191c <PrepareDisplayZoom+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    18c4:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    18ca:	2c40           	movea.l d0,a6
    18cc:	4eae ffc4      	jsr -60(a6)
    18d0:	2f40 0020      	move.l d0,32(sp)
    18d4:	202f 0020      	move.l 32(sp),d0
    18d8:	2f40 001c      	move.l d0,28(sp)
    18dc:	2f7c 0000 7afc 	move.l #31484,24(sp)
    18e2:	0018 
    18e4:	7026           	moveq #38,d0
    18e6:	2f40 0014      	move.l d0,20(sp)
    18ea:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    18f0:	2c40           	movea.l d0,a6
    18f2:	222f 001c      	move.l 28(sp),d1
    18f6:	242f 0018      	move.l 24(sp),d2
    18fa:	262f 0014      	move.l 20(sp),d3
    18fe:	4eae ffd0      	jsr -48(a6)
    1902:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    1906:	7001           	moveq #1,d0
    1908:	2f40 000c      	move.l d0,12(sp)
    190c:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    1912:	2c40           	movea.l d0,a6
    1914:	222f 000c      	move.l 12(sp),d1
    1918:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    191c:	2039 0016 b830 	move.l 16b830 <Bitplane2>,d0
    1922:	23c0 0016 b840 	move.l d0,16b840 <ViewBuffer>
  ViewCopper = Copperlist2; 
    1928:	2039 0016 b838 	move.l 16b838 <Copperlist2>,d0
    192e:	23c0 0016 b848 	move.l d0,16b848 <ViewCopper>
  return 0;
    1934:	7000           	moveq #0,d0
}
    1936:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    193a:	4fef 0048      	lea 72(sp),sp
    193e:	4e75           	rts

00001940 <Init_Blit>:

void Init_Blit() {
  hw->bltafwm = 0xffff;
    1940:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1946:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    194c:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1952:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1958:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    195e:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1964:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    196a:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1970:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1976:	317c 002c 0066 	move.w #44,102(a0)
}
    197c:	4e75           	rts

0000197e <Init_Blit2>:


void Init_Blit2() {
  hw->bltafwm = 0xffff;
    197e:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1984:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    198a:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1990:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = 36;
    1996:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    199c:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = 76;
    19a2:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    19a8:	317c 004c 0062 	move.w #76,98(a0)
  hw->bltdmod = ZMLINESIZE2 - 4;
    19ae:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    19b4:	317c 0028 0066 	move.w #40,102(a0)
}
    19ba:	4e75           	rts

000019bc <Init_ZoomBlit>:

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
    19bc:	4fef fff4      	lea -12(sp),sp
    19c0:	206f 0010      	movea.l 16(sp),a0
    19c4:	222f 0014      	move.l 20(sp),d1
    19c8:	202f 0018      	move.l 24(sp),d0
    19cc:	3048           	movea.w a0,a0
    19ce:	3f48 0004      	move.w a0,4(sp)
    19d2:	3201           	move.w d1,d1
    19d4:	3f41 0002      	move.w d1,2(sp)
    19d8:	3000           	move.w d0,d0
    19da:	3e80           	move.w d0,(sp)
  ZoomBlit_Increment4SrcA = 0;
    19dc:	4279 0016 b880 	clr.w 16b880 <ZoomBlit_Increment4SrcA>

  UWORD colnr = nextzoom - startofword - 1;                                                                          
    19e2:	302f 0002      	move.w 2(sp),d0
    19e6:	906f 0004      	sub.w 4(sp),d0
    19ea:	3200           	move.w d0,d1
    19ec:	5341           	subq.w #1,d1
    19ee:	3f41 0008      	move.w d1,8(sp)
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
    19f2:	3017           	move.w (sp),d0
    19f4:	720c           	moveq #12,d1
    19f6:	e368           	lsl.w d1,d0
    19f8:	3f40 0006      	move.w d0,6(sp)
  UWORD shifta;
  if( shiftright == 0) {
    19fc:	4a57           	tst.w (sp)
    19fe:	6610           	bne.s 1a10 <Init_ZoomBlit+0x54>
    ZoomBlit_Increment4SrcA = 1;
    1a00:	33fc 0001 0016 	move.w #1,16b880 <ZoomBlit_Increment4SrcA>
    1a06:	b880 
    shifta = 15 << 12;
    1a08:	3f7c f000 000a 	move.w #-4096,10(sp)
    1a0e:	600c           	bra.s 1a1c <Init_ZoomBlit+0x60>
  } else {
    shifta = (shiftright - 1) << 12;
    1a10:	3017           	move.w (sp),d0
    1a12:	5340           	subq.w #1,d0
    1a14:	720c           	moveq #12,d1
    1a16:	e368           	lsl.w d1,d0
    1a18:	3f40 000a      	move.w d0,10(sp)
  }
  WaitBlt(); 
    1a1c:	4eba e696      	jsr b4 <WaitBlt>(pc)
  hw->bltcon1 = shiftb; 
    1a20:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1a26:	316f 0006 0042 	move.w 6(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1a2c:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1a32:	302f 000a      	move.w 10(sp),d0
    1a36:	0640 0de4      	addi.w #3556,d0
    1a3a:	3140 0040      	move.w d0,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1a3e:	7000           	moveq #0,d0
    1a40:	302f 0008      	move.w 8(sp),d0
    1a44:	7210           	moveq #16,d1
    1a46:	9280           	sub.l d0,d1
    1a48:	7000           	moveq #0,d0
    1a4a:	4640           	not.w d0
    1a4c:	e3a8           	lsl.l d1,d0
    1a4e:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1a54:	2000           	move.l d0,d0
    1a56:	3140 0070      	move.w d0,112(a0)
}
    1a5a:	4fef 000c      	lea 12(sp),sp
    1a5e:	4e75           	rts

00001a60 <Init_Copy>:

void Init_Copy( WORD shift) {
    1a60:	598f           	subq.l #4,sp
    1a62:	202f 0008      	move.l 8(sp),d0
    1a66:	3000           	move.w d0,d0
    1a68:	3e80           	move.w d0,(sp)
  UWORD shiftright = shift << 12;
    1a6a:	3017           	move.w (sp),d0
    1a6c:	720c           	moveq #12,d1
    1a6e:	e368           	lsl.w d1,d0
    1a70:	3f40 0002      	move.w d0,2(sp)
  WaitBlt();
    1a74:	4eba e63e      	jsr b4 <WaitBlt>(pc)
  hw->bltcon0 = 0x9f0 + shiftright;
    1a78:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1a7e:	302f 0002      	move.w 2(sp),d0
    1a82:	0640 09f0      	addi.w #2544,d0
    1a86:	3140 0040      	move.w d0,64(a0)
  hw->bltcon1 = 0;
    1a8a:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    1a90:	317c 0000 0042 	move.w #0,66(a0)
}
    1a96:	588f           	addq.l #4,sp
    1a98:	4e75           	rts

00001a9a <Zoom_ZoomIntoPicture>:

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    1a9a:	4fef ffcc      	lea -52(sp),sp
    1a9e:	222f 0040      	move.l 64(sp),d1
    1aa2:	202f 0044      	move.l 68(sp),d0
    1aa6:	3201           	move.w d1,d1
    1aa8:	3f41 0002      	move.w d1,2(sp)
    1aac:	3000           	move.w d0,d0
    1aae:	3e80           	move.w d0,(sp)
  
  WaitBlt();  
    1ab0:	4eba e602      	jsr b4 <WaitBlt>(pc)
  Init_Blit();
    1ab4:	4eba fe8a      	jsr 1940 <Init_Blit>(pc)
  WORD shiftright = 9;
    1ab8:	3f7c 0009 0032 	move.w #9,50(sp)
  UWORD shifthoriz = 7;
    1abe:	3f7c 0007 0030 	move.w #7,48(sp)
  UWORD startofword = 21*16;
    1ac4:	3f7c 0150 002e 	move.w #336,46(sp)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1aca:	322f 0002      	move.w 2(sp),d1
    1ace:	3001           	move.w d1,d0
    1ad0:	d040           	add.w d0,d0
    1ad2:	d040           	add.w d0,d0
    1ad4:	d041           	add.w d1,d0
    1ad6:	d040           	add.w d0,d0
    1ad8:	0640 014c      	addi.w #332,d0
    1adc:	3f40 002c      	move.w d0,44(sp)
    1ae0:	601a           	bra.s 1afc <Zoom_ZoomIntoPicture+0x62>
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    1ae2:	302f 002c      	move.w 44(sp),d0
    1ae6:	906f 0002      	sub.w 2(sp),d0
    1aea:	0640 ffed      	addi.w #-19,d0
    1aee:	3f40 002c      	move.w d0,44(sp)
    shiftright--;
    1af2:	302f 0032      	move.w 50(sp),d0
    1af6:	5340           	subq.w #1,d0
    1af8:	3f40 0032      	move.w d0,50(sp)
  while( nextzoom > 22 * 16) {
    1afc:	0c6f 0160 002c 	cmpi.w #352,44(sp)
    1b02:	6ede           	bgt.s 1ae2 <Zoom_ZoomIntoPicture+0x48>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
    1b04:	426f 002a      	clr.w 42(sp)
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    1b08:	322f 0002      	move.w 2(sp),d1
    1b0c:	3001           	move.w d1,d0
    1b0e:	d040           	add.w d0,d0
    1b10:	d040           	add.w d0,d0
    1b12:	d041           	add.w d1,d0
    1b14:	4440           	neg.w d0
    1b16:	0640 0012      	addi.w #18,d0
    1b1a:	3f40 0028      	move.w d0,40(sp)
    1b1e:	601c           	bra.s 1b3c <Zoom_ZoomIntoPicture+0xa2>
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    1b20:	302f 0028      	move.w 40(sp),d0
    1b24:	d06f 0002      	add.w 2(sp),d0
    1b28:	0640 0013      	addi.w #19,d0
    1b2c:	3f40 0028      	move.w d0,40(sp)
      shifthoriz--;
    1b30:	302f 0030      	move.w 48(sp),d0
    1b34:	3200           	move.w d0,d1
    1b36:	5341           	subq.w #1,d1
    1b38:	3f41 0030      	move.w d1,48(sp)
  while( ZoomHorizontalStart < 0) {
    1b3c:	4a6f 0028      	tst.w 40(sp)
    1b40:	6dde           	blt.s 1b20 <Zoom_ZoomIntoPicture+0x86>
  } 

  for(int i=0;i<22;i++) {
    1b42:	42af 0024      	clr.l 36(sp)
    1b46:	6000 02cc      	bra.w 1e14 <Zoom_ZoomIntoPicture+0x37a>

    ZoomHorizontal = ZoomHorizontalStart;
    1b4a:	33ef 0028 0016 	move.w 40(sp),16b89c <ZoomHorizontal>
    1b50:	b89c 

    WORD linesleft = 272;
    1b52:	3f7c 0110 0022 	move.w #272,34(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1b58:	7000           	moveq #0,d0
    1b5a:	302f 0030      	move.w 48(sp),d0
    1b5e:	7200           	moveq #0,d1
    1b60:	3217           	move.w (sp),d1
    1b62:	2f01           	move.l d1,-(sp)
    1b64:	2f00           	move.l d0,-(sp)
    1b66:	4eb9 0000 70c0 	jsr 70c0 <__mulsi3>
    1b6c:	508f           	addq.l #8,sp
    1b6e:	2200           	move.l d0,d1
    1b70:	2001           	move.l d1,d0
    1b72:	d080           	add.l d0,d0
    1b74:	d081           	add.l d1,d0
    1b76:	e788           	lsl.l #3,d0
    1b78:	2200           	move.l d0,d1
    1b7a:	202f 0024      	move.l 36(sp),d0
    1b7e:	9280           	sub.l d0,d1
    1b80:	2001           	move.l d1,d0
    1b82:	0680 8000 0016 	addi.l #-2147483626,d0
    1b88:	d080           	add.l d0,d0
    1b8a:	222f 0038      	move.l 56(sp),d1
    1b8e:	d280           	add.l d0,d1
    1b90:	2f41 001e      	move.l d1,30(sp)
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1b94:	202f 0024      	move.l 36(sp),d0
    1b98:	7216           	moveq #22,d1
    1b9a:	9280           	sub.l d0,d1
    1b9c:	2001           	move.l d1,d0
    1b9e:	d081           	add.l d1,d0
    1ba0:	222f 003c      	move.l 60(sp),d1
    1ba4:	d280           	add.l d0,d1
    1ba6:	2f41 001a      	move.l d1,26(sp)
    
    UWORD onestep = ZMLINESIZE/2*planes;
    1baa:	3217           	move.w (sp),d1
    1bac:	3001           	move.w d1,d0
    1bae:	d040           	add.w d0,d0
    1bb0:	d041           	add.w d1,d0
    1bb2:	e748           	lsl.w #3,d0
    1bb4:	3f40 0018      	move.w d0,24(sp)
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1bb8:	7000           	moveq #0,d0
    1bba:	302f 002e      	move.w 46(sp),d0
    1bbe:	306f 002c      	movea.w 44(sp),a0
    1bc2:	b1c0           	cmpa.l d0,a0
    1bc4:	6e00 0106      	bgt.w 1ccc <Zoom_ZoomIntoPicture+0x232>
      Init_Copy( shiftright);
    1bc8:	306f 0032      	movea.w 50(sp),a0
    1bcc:	2f08           	move.l a0,-(sp)
    1bce:	4eba fe90      	jsr 1a60 <Init_Copy>(pc)
    1bd2:	588f           	addq.l #4,sp
    1bd4:	6000 00ea      	bra.w 1cc0 <Zoom_ZoomIntoPicture+0x226>
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1bd8:	3039 0016 b89c 	move.w 16b89c <ZoomHorizontal>,d0
    1bde:	b06f 0022      	cmp.w 34(sp),d0
    1be2:	6c12           	bge.s 1bf6 <Zoom_ZoomIntoPicture+0x15c>
          linesleft -= ZoomHorizontal;
    1be4:	322f 0022      	move.w 34(sp),d1
    1be8:	3039 0016 b89c 	move.w 16b89c <ZoomHorizontal>,d0
    1bee:	9240           	sub.w d0,d1
    1bf0:	3f41 0022      	move.w d1,34(sp)
    1bf4:	600c           	bra.s 1c02 <Zoom_ZoomIntoPicture+0x168>
        } else {
          ZoomHorizontal = linesleft;
    1bf6:	33ef 0022 0016 	move.w 34(sp),16b89c <ZoomHorizontal>
    1bfc:	b89c 
          linesleft = 0;
    1bfe:	426f 0022      	clr.w 34(sp)
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
    1c02:	3039 0016 b89c 	move.w 16b89c <ZoomHorizontal>,d0
    1c08:	322f 0018      	move.w 24(sp),d1
    1c0c:	c3c0           	muls.w d0,d1
    1c0e:	3f41 000c      	move.w d1,12(sp)
        //Add aditional line
        if( linesleft>0) {
    1c12:	4a6f 0022      	tst.w 34(sp)
    1c16:	6f4c           	ble.s 1c64 <Zoom_ZoomIntoPicture+0x1ca>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1c18:	7200           	moveq #0,d1
    1c1a:	322f 000c      	move.w 12(sp),d1
    1c1e:	7000           	moveq #0,d0
    1c20:	302f 002a      	move.w 42(sp),d0
    1c24:	d081           	add.l d1,d0
    1c26:	d080           	add.l d0,d0
    1c28:	222f 001e      	move.l 30(sp),d1
    1c2c:	d280           	add.l d0,d1
    1c2e:	2f41 0008      	move.l d1,8(sp)
          UWORD *tmpdest = pos4dest +  size4blit;
    1c32:	7000           	moveq #0,d0
    1c34:	302f 000c      	move.w 12(sp),d0
    1c38:	d080           	add.l d0,d0
    1c3a:	222f 001a      	move.l 26(sp),d1
    1c3e:	d280           	add.l d0,d1
    1c40:	2f41 0004      	move.l d1,4(sp)
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
    1c44:	7000           	moveq #0,d0
    1c46:	3017           	move.w (sp),d0
    1c48:	2f00           	move.l d0,-(sp)
    1c4a:	2f2f 0008      	move.l 8(sp),-(sp)
    1c4e:	2f2f 0010      	move.l 16(sp),-(sp)
    1c52:	4eba f4ec      	jsr 1140 <Zoom_CopyWord>(pc)
    1c56:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1c5a:	302f 0022      	move.w 34(sp),d0
    1c5e:	5340           	subq.w #1,d0
    1c60:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1c64:	3039 0016 b89c 	move.w 16b89c <ZoomHorizontal>,d0
    1c6a:	c1d7           	muls.w (sp),d0
    1c6c:	7200           	moveq #0,d1
    1c6e:	3200           	move.w d0,d1
    1c70:	7000           	moveq #0,d0
    1c72:	302f 002a      	move.w 42(sp),d0
    1c76:	d080           	add.l d0,d0
    1c78:	d0af 001e      	add.l 30(sp),d0
    1c7c:	2f01           	move.l d1,-(sp)
    1c7e:	2f2f 001e      	move.l 30(sp),-(sp)
    1c82:	2f00           	move.l d0,-(sp)
    1c84:	4eba f4ba      	jsr 1140 <Zoom_CopyWord>(pc)
    1c88:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1c8c:	7000           	moveq #0,d0
    1c8e:	302f 000c      	move.w 12(sp),d0
    1c92:	d080           	add.l d0,d0
    1c94:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep; 
    1c98:	7200           	moveq #0,d1
    1c9a:	322f 000c      	move.w 12(sp),d1
    1c9e:	7000           	moveq #0,d0
    1ca0:	302f 0018      	move.w 24(sp),d0
    1ca4:	d081           	add.l d1,d0
    1ca6:	d080           	add.l d0,d0
    1ca8:	d1af 001a      	add.l d0,26(sp)
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1cac:	302f 0002      	move.w 2(sp),d0
    1cb0:	d040           	add.w d0,d0
    1cb2:	906f 0002      	sub.w 2(sp),d0
    1cb6:	0640 0012      	addi.w #18,d0
    1cba:	33c0 0016 b89c 	move.w d0,16b89c <ZoomHorizontal>
      while(linesleft > 0) {
    1cc0:	4a6f 0022      	tst.w 34(sp)
    1cc4:	6e00 ff12      	bgt.w 1bd8 <Zoom_ZoomIntoPicture+0x13e>
    1cc8:	6000 0140      	bra.w 1e0a <Zoom_ZoomIntoPicture+0x370>
      }
    } else {  
      Init_ZoomBlit( startofword, nextzoom, shiftright);   
    1ccc:	326f 0032      	movea.w 50(sp),a1
    1cd0:	306f 002c      	movea.w 44(sp),a0
    1cd4:	7000           	moveq #0,d0
    1cd6:	302f 002e      	move.w 46(sp),d0
    1cda:	2f09           	move.l a1,-(sp)
    1cdc:	2f08           	move.l a0,-(sp)
    1cde:	2f00           	move.l d0,-(sp)
    1ce0:	4eba fcda      	jsr 19bc <Init_ZoomBlit>(pc)
    1ce4:	4fef 000c      	lea 12(sp),sp
      nextzoom -= (19 + zoomnr);
    1ce8:	302f 002c      	move.w 44(sp),d0
    1cec:	906f 0002      	sub.w 2(sp),d0
    1cf0:	0640 ffed      	addi.w #-19,d0
    1cf4:	3f40 002c      	move.w d0,44(sp)
    1cf8:	6000 00ea      	bra.w 1de4 <Zoom_ZoomIntoPicture+0x34a>
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1cfc:	3039 0016 b89c 	move.w 16b89c <ZoomHorizontal>,d0
    1d02:	b06f 0022      	cmp.w 34(sp),d0
    1d06:	6c12           	bge.s 1d1a <Zoom_ZoomIntoPicture+0x280>
          linesleft -= ZoomHorizontal;
    1d08:	322f 0022      	move.w 34(sp),d1
    1d0c:	3039 0016 b89c 	move.w 16b89c <ZoomHorizontal>,d0
    1d12:	9240           	sub.w d0,d1
    1d14:	3f41 0022      	move.w d1,34(sp)
    1d18:	600c           	bra.s 1d26 <Zoom_ZoomIntoPicture+0x28c>
        } else {
          ZoomHorizontal = linesleft;
    1d1a:	33ef 0022 0016 	move.w 34(sp),16b89c <ZoomHorizontal>
    1d20:	b89c 
          linesleft = 0;
    1d22:	426f 0022      	clr.w 34(sp)
        }
        UWORD size4blit = ZoomHorizontal*onestep;
    1d26:	3039 0016 b89c 	move.w 16b89c <ZoomHorizontal>,d0
    1d2c:	322f 0018      	move.w 24(sp),d1
    1d30:	c3c0           	muls.w d0,d1
    1d32:	3f41 0016      	move.w d1,22(sp)
        //Add aditional line
        if( linesleft>0) {
    1d36:	4a6f 0022      	tst.w 34(sp)
    1d3a:	6f4c           	ble.s 1d88 <Zoom_ZoomIntoPicture+0x2ee>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1d3c:	7200           	moveq #0,d1
    1d3e:	322f 0016      	move.w 22(sp),d1
    1d42:	7000           	moveq #0,d0
    1d44:	302f 002a      	move.w 42(sp),d0
    1d48:	d081           	add.l d1,d0
    1d4a:	d080           	add.l d0,d0
    1d4c:	222f 001e      	move.l 30(sp),d1
    1d50:	d280           	add.l d0,d1
    1d52:	2f41 0012      	move.l d1,18(sp)
          UWORD *tmpdest = pos4dest + size4blit;
    1d56:	7000           	moveq #0,d0
    1d58:	302f 0016      	move.w 22(sp),d0
    1d5c:	d080           	add.l d0,d0
    1d5e:	222f 001a      	move.l 26(sp),d1
    1d62:	d280           	add.l d0,d1
    1d64:	2f41 000e      	move.l d1,14(sp)
          
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
    1d68:	7000           	moveq #0,d0
    1d6a:	3017           	move.w (sp),d0
    1d6c:	2f00           	move.l d0,-(sp)
    1d6e:	2f2f 0012      	move.l 18(sp),-(sp)
    1d72:	2f2f 001a      	move.l 26(sp),-(sp)
    1d76:	4eba f406      	jsr 117e <Zoom_ZoomBlit>(pc)
    1d7a:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1d7e:	302f 0022      	move.w 34(sp),d0
    1d82:	5340           	subq.w #1,d0
    1d84:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1d88:	3039 0016 b89c 	move.w 16b89c <ZoomHorizontal>,d0
    1d8e:	c1d7           	muls.w (sp),d0
    1d90:	7200           	moveq #0,d1
    1d92:	3200           	move.w d0,d1
    1d94:	7000           	moveq #0,d0
    1d96:	302f 002a      	move.w 42(sp),d0
    1d9a:	d080           	add.l d0,d0
    1d9c:	d0af 001e      	add.l 30(sp),d0
    1da0:	2f01           	move.l d1,-(sp)
    1da2:	2f2f 001e      	move.l 30(sp),-(sp)
    1da6:	2f00           	move.l d0,-(sp)
    1da8:	4eba f3d4      	jsr 117e <Zoom_ZoomBlit>(pc)
    1dac:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1db0:	7000           	moveq #0,d0
    1db2:	302f 0016      	move.w 22(sp),d0
    1db6:	d080           	add.l d0,d0
    1db8:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep;   
    1dbc:	7200           	moveq #0,d1
    1dbe:	322f 0016      	move.w 22(sp),d1
    1dc2:	7000           	moveq #0,d0
    1dc4:	302f 0018      	move.w 24(sp),d0
    1dc8:	d081           	add.l d1,d0
    1dca:	d080           	add.l d0,d0
    1dcc:	d1af 001a      	add.l d0,26(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1dd0:	302f 0002      	move.w 2(sp),d0
    1dd4:	d040           	add.w d0,d0
    1dd6:	906f 0002      	sub.w 2(sp),d0
    1dda:	0640 0012      	addi.w #18,d0
    1dde:	33c0 0016 b89c 	move.w d0,16b89c <ZoomHorizontal>
      while( linesleft > 0) {
    1de4:	4a6f 0022      	tst.w 34(sp)
    1de8:	6e00 ff12      	bgt.w 1cfc <Zoom_ZoomIntoPicture+0x262>
      }
      shiftright--;  
    1dec:	302f 0032      	move.w 50(sp),d0
    1df0:	5340           	subq.w #1,d0
    1df2:	3f40 0032      	move.w d0,50(sp)
      if(shiftright < 0) {
    1df6:	6a12           	bpl.s 1e0a <Zoom_ZoomIntoPicture+0x370>
        shiftright += 16;
    1df8:	302f 0032      	move.w 50(sp),d0
    1dfc:	0640 0010      	addi.w #16,d0
    1e00:	3f40 0032      	move.w d0,50(sp)
        shifttoleft = 1;
    1e04:	3f7c 0001 002a 	move.w #1,42(sp)
      }
    }
    startofword -= 16;
    1e0a:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    1e10:	52af 0024      	addq.l #1,36(sp)
    1e14:	7015           	moveq #21,d0
    1e16:	b0af 0024      	cmp.l 36(sp),d0
    1e1a:	6c00 fd2e      	bge.w 1b4a <Zoom_ZoomIntoPicture+0xb0>
  }
}
    1e1e:	4fef 0034      	lea 52(sp),sp
    1e22:	4e75           	rts

00001e24 <Zoom_SetBplPointers>:

void Zoom_SetBplPointers( UWORD *buffer, ULONG *copper) {
    1e24:	4fef fff0      	lea -16(sp),sp
  ULONG plane2set = buffer+1;
    1e28:	202f 0014      	move.l 20(sp),d0
    1e2c:	5480           	addq.l #2,d0
    1e2e:	2f40 000c      	move.l d0,12(sp)
  /*ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;*/
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
    1e32:	7072           	moveq #114,d0
    1e34:	d0af 0018      	add.l 24(sp),d0
    1e38:	2f40 0008      	move.l d0,8(sp)
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1e3c:	42af 0004      	clr.l 4(sp)
    1e40:	6032           	bra.s 1e74 <Zoom_SetBplPointers+0x50>
    UWORD highword = (ULONG)plane2set >> 16;
    1e42:	202f 000c      	move.l 12(sp),d0
    1e46:	4240           	clr.w d0
    1e48:	4840           	swap d0
    1e4a:	3f40 0002      	move.w d0,2(sp)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1e4e:	3eaf 000e      	move.w 14(sp),(sp)
    *posofcopper = highword;
    1e52:	206f 0008      	movea.l 8(sp),a0
    1e56:	30af 0002      	move.w 2(sp),(a0)
    posofcopper += 2;
    1e5a:	58af 0008      	addq.l #4,8(sp)
    *posofcopper = lowword;
    1e5e:	206f 0008      	movea.l 8(sp),a0
    1e62:	3097           	move.w (sp),(a0)
    posofcopper += 2;
    1e64:	58af 0008      	addq.l #4,8(sp)
    plane2set += 42*268; //Next plane (interleaved)
    1e68:	06af 0000 2bf8 	addi.l #11256,12(sp)
    1e6e:	000c 
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1e70:	52af 0004      	addq.l #1,4(sp)
    1e74:	7004           	moveq #4,d0
    1e76:	b0af 0004      	cmp.l 4(sp),d0
    1e7a:	6cc6           	bge.s 1e42 <Zoom_SetBplPointers+0x1e>
  }
  
}
    1e7c:	4fef 0010      	lea 16(sp),sp
    1e80:	4e75           	rts

00001e82 <Zoom_SwapBuffers>:

void Zoom_SwapBuffers( UWORD zoomlevel) {
    1e82:	598f           	subq.l #4,sp
    1e84:	202f 0008      	move.l 8(sp),d0
    1e88:	3000           	move.w d0,d0
    1e8a:	3f40 0002      	move.w d0,2(sp)
  ViewBuffer = framebuffer;// + 21*268*5*zoomlevel;
    1e8e:	2039 0000 b690 	move.l b690 <framebuffer>,d0
    1e94:	23c0 0016 b840 	move.l d0,16b840 <ViewBuffer>
  /*ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;*/
}
    1e9a:	588f           	addq.l #4,sp
    1e9c:	4e75           	rts

00001e9e <Test_Zoom2>:
#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
    1e9e:	4fef ff00      	lea -256(sp),sp
    1ea2:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  //Test Zoomlevel 1
  volatile ULONG *srcsmall = AllocMem( 80, MEMF_CHIP);
    1ea6:	7050           	moveq #80,d0
    1ea8:	2f40 00f0      	move.l d0,240(sp)
    1eac:	7002           	moveq #2,d0
    1eae:	2f40 00ec      	move.l d0,236(sp)
    1eb2:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    1eb8:	2c40           	movea.l d0,a6
    1eba:	202f 00f0      	move.l 240(sp),d0
    1ebe:	222f 00ec      	move.l 236(sp),d1
    1ec2:	4eae ff3a      	jsr -198(a6)
    1ec6:	2f40 00e8      	move.l d0,232(sp)
    1eca:	202f 00e8      	move.l 232(sp),d0
    1ece:	2f40 00e4      	move.l d0,228(sp)
  if( srcsmall == 0) {
    1ed2:	6646           	bne.s 1f1a <Test_Zoom2+0x7c>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcsmall\n", 42);
    1ed4:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    1eda:	2c40           	movea.l d0,a6
    1edc:	4eae ffc4      	jsr -60(a6)
    1ee0:	2f40 001c      	move.l d0,28(sp)
    1ee4:	202f 001c      	move.l 28(sp),d0
    1ee8:	2f40 0018      	move.l d0,24(sp)
    1eec:	2f7c 0000 7b57 	move.l #31575,20(sp)
    1ef2:	0014 
    1ef4:	702a           	moveq #42,d0
    1ef6:	2f40 0010      	move.l d0,16(sp)
    1efa:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    1f00:	2c40           	movea.l d0,a6
    1f02:	222f 0018      	move.l 24(sp),d1
    1f06:	242f 0014      	move.l 20(sp),d2
    1f0a:	262f 0010      	move.l 16(sp),d3
    1f0e:	4eae ffd0      	jsr -48(a6)
    1f12:	2f40 000c      	move.l d0,12(sp)
    1f16:	6000 0560      	bra.w 2478 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong(srcsmall, 0xaaaaaaaa, 2, 10, 0);
    1f1a:	42a7           	clr.l -(sp)
    1f1c:	4878 000a      	pea a <_start+0xa>
    1f20:	4878 0002      	pea 2 <_start+0x2>
    1f24:	2f3c aaaa aaaa 	move.l #-1431655766,-(sp)
    1f2a:	2f2f 00f4      	move.l 244(sp),-(sp)
    1f2e:	4eba e340      	jsr 270 <Utils_FillLong>(pc)
    1f32:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *srcbig = AllocMem( 160, MEMF_CHIP);
    1f36:	2f7c 0000 00a0 	move.l #160,224(sp)
    1f3c:	00e0 
    1f3e:	7002           	moveq #2,d0
    1f40:	2f40 00dc      	move.l d0,220(sp)
    1f44:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    1f4a:	2c40           	movea.l d0,a6
    1f4c:	202f 00e0      	move.l 224(sp),d0
    1f50:	222f 00dc      	move.l 220(sp),d1
    1f54:	4eae ff3a      	jsr -198(a6)
    1f58:	2f40 00d8      	move.l d0,216(sp)
    1f5c:	202f 00d8      	move.l 216(sp),d0
    1f60:	2f40 00d4      	move.l d0,212(sp)
    if( srcbig == 0) {
    1f64:	6646           	bne.s 1fac <Test_Zoom2+0x10e>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcbig\n", 40);
    1f66:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    1f6c:	2c40           	movea.l d0,a6
    1f6e:	4eae ffc4      	jsr -60(a6)
    1f72:	2f40 0030      	move.l d0,48(sp)
    1f76:	202f 0030      	move.l 48(sp),d0
    1f7a:	2f40 002c      	move.l d0,44(sp)
    1f7e:	2f7c 0000 7b82 	move.l #31618,40(sp)
    1f84:	0028 
    1f86:	7028           	moveq #40,d0
    1f88:	2f40 0024      	move.l d0,36(sp)
    1f8c:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    1f92:	2c40           	movea.l d0,a6
    1f94:	222f 002c      	move.l 44(sp),d1
    1f98:	242f 0028      	move.l 40(sp),d2
    1f9c:	262f 0024      	move.l 36(sp),d3
    1fa0:	4eae ffd0      	jsr -48(a6)
    1fa4:	2f40 0020      	move.l d0,32(sp)
    1fa8:	6000 04ce      	bra.w 2478 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong( srcbig, 0x55555555, 2, 20, 0);
    1fac:	42a7           	clr.l -(sp)
    1fae:	4878 0014      	pea 14 <_start+0x14>
    1fb2:	4878 0002      	pea 2 <_start+0x2>
    1fb6:	2f3c 5555 5555 	move.l #1431655765,-(sp)
    1fbc:	2f2f 00e4      	move.l 228(sp),-(sp)
    1fc0:	4eba e2ae      	jsr 270 <Utils_FillLong>(pc)
    1fc4:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *target = AllocMem( 168, MEMF_CHIP);
    1fc8:	2f7c 0000 00a8 	move.l #168,208(sp)
    1fce:	00d0 
    1fd0:	7002           	moveq #2,d0
    1fd2:	2f40 00cc      	move.l d0,204(sp)
    1fd6:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    1fdc:	2c40           	movea.l d0,a6
    1fde:	202f 00d0      	move.l 208(sp),d0
    1fe2:	222f 00cc      	move.l 204(sp),d1
    1fe6:	4eae ff3a      	jsr -198(a6)
    1fea:	2f40 00c8      	move.l d0,200(sp)
    1fee:	202f 00c8      	move.l 200(sp),d0
    1ff2:	2f40 00c4      	move.l d0,196(sp)
  if( target == 0) {
    1ff6:	6646           	bne.s 203e <Test_Zoom2+0x1a0>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
    1ff8:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    1ffe:	2c40           	movea.l d0,a6
    2000:	4eae ffc4      	jsr -60(a6)
    2004:	2f40 0044      	move.l d0,68(sp)
    2008:	202f 0044      	move.l 68(sp),d0
    200c:	2f40 0040      	move.l d0,64(sp)
    2010:	2f7c 0000 7bab 	move.l #31659,60(sp)
    2016:	003c 
    2018:	7028           	moveq #40,d0
    201a:	2f40 0038      	move.l d0,56(sp)
    201e:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2024:	2c40           	movea.l d0,a6
    2026:	222f 0040      	move.l 64(sp),d1
    202a:	242f 003c      	move.l 60(sp),d2
    202e:	262f 0038      	move.l 56(sp),d3
    2032:	4eae ffd0      	jsr -48(a6)
    2036:	2f40 0034      	move.l d0,52(sp)
    203a:	6000 043c      	bra.w 2478 <Test_Zoom2+0x5da>
    return;
  }
  WaitBlt();
    203e:	4eba e074      	jsr b4 <WaitBlt>(pc)
  hw->bltafwm = 0xffff;
    2042:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    2048:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    204e:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    2054:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltdmod = 38;
    205a:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    2060:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcon1 = 1 << 12; //Shift src big
    2066:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    206c:	317c 1000 0042 	move.w #4096,66(a0)
  hw->bltcon0 = 0xde4; //Chanell settings and Shift src small
    2072:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    2078:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltcdat = 0x8000; //Show channel small if 1 else channel big
    207e:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    2084:	317c 8000 0070 	move.w #-32768,112(a0)
  //srcbig-shift   0010 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sbbb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    208a:	4878 0001      	pea 1 <_start+0x1>
    208e:	4878 004e      	pea 4e <_start+0x4e>
    2092:	4878 0026      	pea 26 <_start+0x26>
    2096:	4878 0002      	pea 2 <_start+0x2>
    209a:	2f2f 00d4      	move.l 212(sp),-(sp)
    209e:	2f2f 00e8      	move.l 232(sp),-(sp)
    20a2:	2f2f 00fc      	move.l 252(sp),-(sp)
    20a6:	4eba f13a      	jsr 11e2 <Zoom_ZoomBlit2>(pc)
    20aa:	4fef 001c      	lea 28(sp),sp
  UWORD *tmp = (UWORD *)target;
    20ae:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    20b4:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    20ba:	2c40           	movea.l d0,a6
    20bc:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    20c0:	42af 0104      	clr.l 260(sp)
    20c4:	605c           	bra.s 2122 <Test_Zoom2+0x284>
    if( *tmp != 0xaaaa ) {
    20c6:	206f 0108      	movea.l 264(sp),a0
    20ca:	3010           	move.w (a0),d0
    20cc:	0c40 aaaa      	cmpi.w #-21846,d0
    20d0:	6746           	beq.s 2118 <Test_Zoom2+0x27a>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 1 failed\n", 40);
    20d2:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    20d8:	2c40           	movea.l d0,a6
    20da:	4eae ffc4      	jsr -60(a6)
    20de:	2f40 0058      	move.l d0,88(sp)
    20e2:	202f 0058      	move.l 88(sp),d0
    20e6:	2f40 0054      	move.l d0,84(sp)
    20ea:	2f7c 0000 7bd4 	move.l #31700,80(sp)
    20f0:	0050 
    20f2:	7028           	moveq #40,d0
    20f4:	2f40 004c      	move.l d0,76(sp)
    20f8:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    20fe:	2c40           	movea.l d0,a6
    2100:	222f 0054      	move.l 84(sp),d1
    2104:	242f 0050      	move.l 80(sp),d2
    2108:	262f 004c      	move.l 76(sp),d3
    210c:	4eae ffd0      	jsr -48(a6)
    2110:	2f40 0048      	move.l d0,72(sp)
    2114:	6000 0362      	bra.w 2478 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    2118:	7028           	moveq #40,d0
    211a:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    211e:	52af 0104      	addq.l #1,260(sp)
    2122:	7001           	moveq #1,d0
    2124:	b0af 0104      	cmp.l 260(sp),d0
    2128:	6c9c           	bge.s 20c6 <Test_Zoom2+0x228>
  //srcbig-shift   0001 0101 0101 0101
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       ssbb bbbb bbbb bbbb
  //result:        1001 0101 0101 0101

  hw->bltcon1 = 2 << 12; //Shift src big
    212a:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    2130:	317c 2000 0042 	move.w #8192,66(a0)
  hw->bltcdat = 0xc000; //Show channel small if 1 else channel big
    2136:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    213c:	317c c000 0070 	move.w #-16384,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2142:	4878 0001      	pea 1 <_start+0x1>
    2146:	4878 004e      	pea 4e <_start+0x4e>
    214a:	4878 0026      	pea 26 <_start+0x26>
    214e:	4878 0002      	pea 2 <_start+0x2>
    2152:	2f2f 00d4      	move.l 212(sp),-(sp)
    2156:	2f2f 00e8      	move.l 232(sp),-(sp)
    215a:	2f2f 00fc      	move.l 252(sp),-(sp)
    215e:	4eba f082      	jsr 11e2 <Zoom_ZoomBlit2>(pc)
    2162:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2166:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    216c:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    2172:	2c40           	movea.l d0,a6
    2174:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2178:	42af 0100      	clr.l 256(sp)
    217c:	605c           	bra.s 21da <Test_Zoom2+0x33c>
    if( *tmp != 0x9555 ) {
    217e:	206f 0108      	movea.l 264(sp),a0
    2182:	3010           	move.w (a0),d0
    2184:	0c40 9555      	cmpi.w #-27307,d0
    2188:	6746           	beq.s 21d0 <Test_Zoom2+0x332>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 2 failed\n", 40);
    218a:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2190:	2c40           	movea.l d0,a6
    2192:	4eae ffc4      	jsr -60(a6)
    2196:	2f40 006c      	move.l d0,108(sp)
    219a:	202f 006c      	move.l 108(sp),d0
    219e:	2f40 0068      	move.l d0,104(sp)
    21a2:	2f7c 0000 7bfd 	move.l #31741,100(sp)
    21a8:	0064 
    21aa:	7028           	moveq #40,d0
    21ac:	2f40 0060      	move.l d0,96(sp)
    21b0:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    21b6:	2c40           	movea.l d0,a6
    21b8:	222f 0068      	move.l 104(sp),d1
    21bc:	242f 0064      	move.l 100(sp),d2
    21c0:	262f 0060      	move.l 96(sp),d3
    21c4:	4eae ffd0      	jsr -48(a6)
    21c8:	2f40 005c      	move.l d0,92(sp)
    21cc:	6000 02aa      	bra.w 2478 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    21d0:	7028           	moveq #40,d0
    21d2:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    21d6:	52af 0100      	addq.l #1,256(sp)
    21da:	7001           	moveq #1,d0
    21dc:	b0af 0100      	cmp.l 256(sp),d0
    21e0:	6c9c           	bge.s 217e <Test_Zoom2+0x2e0>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    21e2:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    21e8:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    21ee:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    21f4:	317c e000 0070 	move.w #-8192,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    21fa:	4878 0001      	pea 1 <_start+0x1>
    21fe:	4878 004e      	pea 4e <_start+0x4e>
    2202:	4878 0026      	pea 26 <_start+0x26>
    2206:	4878 0002      	pea 2 <_start+0x2>
    220a:	2f2f 00d4      	move.l 212(sp),-(sp)
    220e:	2f2f 00e8      	move.l 232(sp),-(sp)
    2212:	2f2f 00fc      	move.l 252(sp),-(sp)
    2216:	4eba efca      	jsr 11e2 <Zoom_ZoomBlit2>(pc)
    221a:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    221e:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2224:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    222a:	2c40           	movea.l d0,a6
    222c:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2230:	42af 00fc      	clr.l 252(sp)
    2234:	605c           	bra.s 2292 <Test_Zoom2+0x3f4>
    if( *tmp != 0xaaaa ) {
    2236:	206f 0108      	movea.l 264(sp),a0
    223a:	3010           	move.w (a0),d0
    223c:	0c40 aaaa      	cmpi.w #-21846,d0
    2240:	6746           	beq.s 2288 <Test_Zoom2+0x3ea>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    2242:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2248:	2c40           	movea.l d0,a6
    224a:	4eae ffc4      	jsr -60(a6)
    224e:	2f40 0080      	move.l d0,128(sp)
    2252:	202f 0080      	move.l 128(sp),d0
    2256:	2f40 007c      	move.l d0,124(sp)
    225a:	2f7c 0000 7c26 	move.l #31782,120(sp)
    2260:	0078 
    2262:	7028           	moveq #40,d0
    2264:	2f40 0074      	move.l d0,116(sp)
    2268:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    226e:	2c40           	movea.l d0,a6
    2270:	222f 007c      	move.l 124(sp),d1
    2274:	242f 0078      	move.l 120(sp),d2
    2278:	262f 0074      	move.l 116(sp),d3
    227c:	4eae ffd0      	jsr -48(a6)
    2280:	2f40 0070      	move.l d0,112(sp)
    2284:	6000 01f2      	bra.w 2478 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    2288:	7028           	moveq #40,d0
    228a:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    228e:	52af 00fc      	addq.l #1,252(sp)
    2292:	7001           	moveq #1,d0
    2294:	b0af 00fc      	cmp.l 252(sp),d0
    2298:	6c9c           	bge.s 2236 <Test_Zoom2+0x398>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    229a:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    22a0:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    22a6:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    22ac:	317c e000 0070 	move.w #-8192,112(a0)

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    22b2:	4878 0001      	pea 1 <_start+0x1>
    22b6:	4878 004e      	pea 4e <_start+0x4e>
    22ba:	4878 0026      	pea 26 <_start+0x26>
    22be:	4878 0002      	pea 2 <_start+0x2>
    22c2:	2f2f 00d4      	move.l 212(sp),-(sp)
    22c6:	2f2f 00e8      	move.l 232(sp),-(sp)
    22ca:	2f2f 00fc      	move.l 252(sp),-(sp)
    22ce:	4eba ef12      	jsr 11e2 <Zoom_ZoomBlit2>(pc)
    22d2:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    22d6:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    22dc:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    22e2:	2c40           	movea.l d0,a6
    22e4:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    22e8:	42af 00f8      	clr.l 248(sp)
    22ec:	605c           	bra.s 234a <Test_Zoom2+0x4ac>
    if( *tmp != 0xaaaa ) {
    22ee:	206f 0108      	movea.l 264(sp),a0
    22f2:	3010           	move.w (a0),d0
    22f4:	0c40 aaaa      	cmpi.w #-21846,d0
    22f8:	6746           	beq.s 2340 <Test_Zoom2+0x4a2>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    22fa:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2300:	2c40           	movea.l d0,a6
    2302:	4eae ffc4      	jsr -60(a6)
    2306:	2f40 0094      	move.l d0,148(sp)
    230a:	202f 0094      	move.l 148(sp),d0
    230e:	2f40 0090      	move.l d0,144(sp)
    2312:	2f7c 0000 7c26 	move.l #31782,140(sp)
    2318:	008c 
    231a:	7028           	moveq #40,d0
    231c:	2f40 0088      	move.l d0,136(sp)
    2320:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2326:	2c40           	movea.l d0,a6
    2328:	222f 0090      	move.l 144(sp),d1
    232c:	242f 008c      	move.l 140(sp),d2
    2330:	262f 0088      	move.l 136(sp),d3
    2334:	4eae ffd0      	jsr -48(a6)
    2338:	2f40 0084      	move.l d0,132(sp)
    233c:	6000 013a      	bra.w 2478 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    2340:	7028           	moveq #40,d0
    2342:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2346:	52af 00f8      	addq.l #1,248(sp)
    234a:	7001           	moveq #1,d0
    234c:	b0af 00f8      	cmp.l 248(sp),d0
    2350:	6c9c           	bge.s 22ee <Test_Zoom2+0x450>
  //srcsmall:            1010 1010 1010 1010
  //srcsmall-shift:      0101 0101 0101 0101
  //pattern:             sssb bbbb bbbb bbbb
  //result:              0100 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2352:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    2358:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    235e:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    2364:	317c e000 0070 	move.w #-8192,112(a0)
  hw->bltcon0 = 0xde4 + (1 << 12); //Chanell settings and Shift src small
    236a:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    2370:	317c 1de4 0040 	move.w #7652,64(a0)
 
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2376:	4878 0001      	pea 1 <_start+0x1>
    237a:	4878 004e      	pea 4e <_start+0x4e>
    237e:	4878 0026      	pea 26 <_start+0x26>
    2382:	4878 0002      	pea 2 <_start+0x2>
    2386:	2f2f 00d4      	move.l 212(sp),-(sp)
    238a:	2f2f 00e8      	move.l 232(sp),-(sp)
    238e:	2f2f 00fc      	move.l 252(sp),-(sp)
    2392:	4eba ee4e      	jsr 11e2 <Zoom_ZoomBlit2>(pc)
    2396:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    239a:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    23a0:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    23a6:	2c40           	movea.l d0,a6
    23a8:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    23ac:	42af 00f4      	clr.l 244(sp)
    23b0:	605a           	bra.s 240c <Test_Zoom2+0x56e>
    if( *tmp != 0x4aaa ) {
    23b2:	206f 0108      	movea.l 264(sp),a0
    23b6:	3010           	move.w (a0),d0
    23b8:	0c40 4aaa      	cmpi.w #19114,d0
    23bc:	6744           	beq.s 2402 <Test_Zoom2+0x564>
      Write( Output(), "Test_Zoom2: Test for shifting a failed\n", 39);
    23be:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    23c4:	2c40           	movea.l d0,a6
    23c6:	4eae ffc4      	jsr -60(a6)
    23ca:	2f40 00a8      	move.l d0,168(sp)
    23ce:	202f 00a8      	move.l 168(sp),d0
    23d2:	2f40 00a4      	move.l d0,164(sp)
    23d6:	2f7c 0000 7c4f 	move.l #31823,160(sp)
    23dc:	00a0 
    23de:	7027           	moveq #39,d0
    23e0:	2f40 009c      	move.l d0,156(sp)
    23e4:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    23ea:	2c40           	movea.l d0,a6
    23ec:	222f 00a4      	move.l 164(sp),d1
    23f0:	242f 00a0      	move.l 160(sp),d2
    23f4:	262f 009c      	move.l 156(sp),d3
    23f8:	4eae ffd0      	jsr -48(a6)
    23fc:	2f40 0098      	move.l d0,152(sp)
    2400:	6076           	bra.s 2478 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    2402:	7028           	moveq #40,d0
    2404:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2408:	52af 00f4      	addq.l #1,244(sp)
    240c:	7001           	moveq #1,d0
    240e:	b0af 00f4      	cmp.l 244(sp),d0
    2412:	6c9e           	bge.s 23b2 <Test_Zoom2+0x514>

  FreeMem( srcsmall, 80);
    2414:	2f6f 00e4 00c0 	move.l 228(sp),192(sp)
    241a:	7050           	moveq #80,d0
    241c:	2f40 00bc      	move.l d0,188(sp)
    2420:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    2426:	2c40           	movea.l d0,a6
    2428:	226f 00c0      	movea.l 192(sp),a1
    242c:	202f 00bc      	move.l 188(sp),d0
    2430:	4eae ff2e      	jsr -210(a6)
  FreeMem( srcbig, 160);
    2434:	2f6f 00d4 00b8 	move.l 212(sp),184(sp)
    243a:	2f7c 0000 00a0 	move.l #160,180(sp)
    2440:	00b4 
    2442:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    2448:	2c40           	movea.l d0,a6
    244a:	226f 00b8      	movea.l 184(sp),a1
    244e:	202f 00b4      	move.l 180(sp),d0
    2452:	4eae ff2e      	jsr -210(a6)
  FreeMem( target, 168);
    2456:	2f6f 00c4 00b0 	move.l 196(sp),176(sp)
    245c:	2f7c 0000 00a8 	move.l #168,172(sp)
    2462:	00ac 
    2464:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    246a:	2c40           	movea.l d0,a6
    246c:	226f 00b0      	movea.l 176(sp),a1
    2470:	202f 00ac      	move.l 172(sp),d0
    2474:	4eae ff2e      	jsr -210(a6)
    2478:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    247c:	4fef 0100      	lea 256(sp),sp
    2480:	4e75           	rts

00002482 <ClBuild>:
#include "utils.h"




ULONG * ClBuild() {
    2482:	4fef ffc4      	lea -60(sp),sp
    2486:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
    248a:	2f7c 0000 0084 	move.l #132,48(sp)
    2490:	0030 
    2492:	7002           	moveq #2,d0
    2494:	2f40 002c      	move.l d0,44(sp)
    2498:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    249e:	2c40           	movea.l d0,a6
    24a0:	202f 0030      	move.l 48(sp),d0
    24a4:	222f 002c      	move.l 44(sp),d1
    24a8:	4eae ff3a      	jsr -198(a6)
    24ac:	2f40 0028      	move.l d0,40(sp)
    24b0:	202f 0028      	move.l 40(sp),d0
    24b4:	2f40 0024      	move.l d0,36(sp)
  if( retval == 0) {
    24b8:	6658           	bne.s 2512 <ClBuild+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    24ba:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    24c0:	2c40           	movea.l d0,a6
    24c2:	4eae ffc4      	jsr -60(a6)
    24c6:	2f40 0020      	move.l d0,32(sp)
    24ca:	202f 0020      	move.l 32(sp),d0
    24ce:	2f40 001c      	move.l d0,28(sp)
    24d2:	2f7c 0000 7b23 	move.l #31523,24(sp)
    24d8:	0018 
    24da:	7228           	moveq #40,d1
    24dc:	2f41 0014      	move.l d1,20(sp)
    24e0:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    24e6:	2c40           	movea.l d0,a6
    24e8:	222f 001c      	move.l 28(sp),d1
    24ec:	242f 0018      	move.l 24(sp),d2
    24f0:	262f 0014      	move.l 20(sp),d3
    24f4:	4eae ffd0      	jsr -48(a6)
    24f8:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    24fc:	7401           	moveq #1,d2
    24fe:	2f42 000c      	move.l d2,12(sp)
    2502:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2508:	2c40           	movea.l d0,a6
    250a:	222f 000c      	move.l 12(sp),d1
    250e:	4eae ff70      	jsr -144(a6)
  }
    
  ULONG *cl = retval;
    2512:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    2518:	2f7c 0000 a47c 	move.l #42108,64(sp)
    251e:	0040 
  for(int i=0; i<16;i++)
    2520:	42af 003c      	clr.l 60(sp)
    2524:	6024           	bra.s 254a <ClBuild+0xc8>
    *cl++ = *clpartinstruction++;
    2526:	222f 0040      	move.l 64(sp),d1
    252a:	2001           	move.l d1,d0
    252c:	5880           	addq.l #4,d0
    252e:	2f40 0040      	move.l d0,64(sp)
    2532:	202f 0044      	move.l 68(sp),d0
    2536:	2400           	move.l d0,d2
    2538:	5882           	addq.l #4,d2
    253a:	2f42 0044      	move.l d2,68(sp)
    253e:	2041           	movea.l d1,a0
    2540:	2210           	move.l (a0),d1
    2542:	2040           	movea.l d0,a0
    2544:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    2546:	52af 003c      	addq.l #1,60(sp)
    254a:	700f           	moveq #15,d0
    254c:	b0af 003c      	cmp.l 60(sp),d0
    2550:	6cd4           	bge.s 2526 <ClBuild+0xa4>
  clpartinstruction = ClScreen;
    2552:	2f7c 0000 a4bc 	move.l #42172,64(sp)
    2558:	0040 
  for(int i=0; i<12;i++)
    255a:	42af 0038      	clr.l 56(sp)
    255e:	6024           	bra.s 2584 <ClBuild+0x102>
    *cl++ = *clpartinstruction++;
    2560:	222f 0040      	move.l 64(sp),d1
    2564:	2401           	move.l d1,d2
    2566:	5882           	addq.l #4,d2
    2568:	2f42 0040      	move.l d2,64(sp)
    256c:	202f 0044      	move.l 68(sp),d0
    2570:	2400           	move.l d0,d2
    2572:	5882           	addq.l #4,d2
    2574:	2f42 0044      	move.l d2,68(sp)
    2578:	2041           	movea.l d1,a0
    257a:	2210           	move.l (a0),d1
    257c:	2040           	movea.l d0,a0
    257e:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    2580:	52af 0038      	addq.l #1,56(sp)
    2584:	700b           	moveq #11,d0
    2586:	b0af 0038      	cmp.l 56(sp),d0
    258a:	6cd4           	bge.s 2560 <ClBuild+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    258c:	202f 0044      	move.l 68(sp),d0
    2590:	2200           	move.l d0,d1
    2592:	5881           	addq.l #4,d1
    2594:	2f41 0044      	move.l d1,68(sp)
    2598:	2040           	movea.l d0,a0
    259a:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    25a0:	202f 0044      	move.l 68(sp),d0
    25a4:	2200           	move.l d0,d1
    25a6:	5881           	addq.l #4,d1
    25a8:	2f41 0044      	move.l d1,68(sp)
    25ac:	2040           	movea.l d0,a0
    25ae:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
    25b4:	2f7c 0000 a3fc 	move.l #41980,64(sp)
    25ba:	0040 
  for(int i=0; i<2;i++)
    25bc:	42af 0034      	clr.l 52(sp)
    25c0:	6024           	bra.s 25e6 <ClBuild+0x164>
    *cl++ = *clpartinstruction++;
    25c2:	222f 0040      	move.l 64(sp),d1
    25c6:	2001           	move.l d1,d0
    25c8:	5880           	addq.l #4,d0
    25ca:	2f40 0040      	move.l d0,64(sp)
    25ce:	202f 0044      	move.l 68(sp),d0
    25d2:	2400           	move.l d0,d2
    25d4:	5882           	addq.l #4,d2
    25d6:	2f42 0044      	move.l d2,68(sp)
    25da:	2041           	movea.l d1,a0
    25dc:	2210           	move.l (a0),d1
    25de:	2040           	movea.l d0,a0
    25e0:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
    25e2:	52af 0034      	addq.l #1,52(sp)
    25e6:	7001           	moveq #1,d0
    25e8:	b0af 0034      	cmp.l 52(sp),d0
    25ec:	6cd4           	bge.s 25c2 <ClBuild+0x140>
  *cl = 0xfffffffe;
    25ee:	206f 0044      	movea.l 68(sp),a0
    25f2:	72fe           	moveq #-2,d1
    25f4:	2081           	move.l d1,(a0)

  return retval;
    25f6:	202f 0024      	move.l 36(sp),d0
}
    25fa:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    25fe:	4fef 003c      	lea 60(sp),sp
    2602:	4e75           	rts

00002604 <PrepareDisplay>:

int PrepareDisplay() {
    2604:	4fef ffb8      	lea -72(sp),sp
    2608:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClBuild( );
    260c:	4eba fe74      	jsr 2482 <ClBuild>(pc)
    2610:	23c0 0016 b834 	move.l d0,16b834 <Copperlist1>
  Copperlist2 = ClBuild( );
    2616:	4eba fe6a      	jsr 2482 <ClBuild>(pc)
    261a:	23c0 0016 b838 	move.l d0,16b838 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    2620:	2f7c 0000 c800 	move.l #51200,80(sp)
    2626:	0050 
    2628:	7002           	moveq #2,d0
    262a:	2f40 004c      	move.l d0,76(sp)
    262e:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    2634:	2c40           	movea.l d0,a6
    2636:	202f 0050      	move.l 80(sp),d0
    263a:	222f 004c      	move.l 76(sp),d1
    263e:	4eae ff3a      	jsr -198(a6)
    2642:	2f40 0048      	move.l d0,72(sp)
    2646:	202f 0048      	move.l 72(sp),d0
    264a:	23c0 0016 b82c 	move.l d0,16b82c <Bitplane1>
  if(Bitplane1 == 0) {
    2650:	2039 0016 b82c 	move.l 16b82c <Bitplane1>,d0
    2656:	6658           	bne.s 26b0 <PrepareDisplay+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2658:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    265e:	2c40           	movea.l d0,a6
    2660:	4eae ffc4      	jsr -60(a6)
    2664:	2f40 0044      	move.l d0,68(sp)
    2668:	202f 0044      	move.l 68(sp),d0
    266c:	2f40 0040      	move.l d0,64(sp)
    2670:	2f7c 0000 7ad5 	move.l #31445,60(sp)
    2676:	003c 
    2678:	7026           	moveq #38,d0
    267a:	2f40 0038      	move.l d0,56(sp)
    267e:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2684:	2c40           	movea.l d0,a6
    2686:	222f 0040      	move.l 64(sp),d1
    268a:	242f 003c      	move.l 60(sp),d2
    268e:	262f 0038      	move.l 56(sp),d3
    2692:	4eae ffd0      	jsr -48(a6)
    2696:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    269a:	7001           	moveq #1,d0
    269c:	2f40 0030      	move.l d0,48(sp)
    26a0:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    26a6:	2c40           	movea.l d0,a6
    26a8:	222f 0030      	move.l 48(sp),d1
    26ac:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane1;
    26b0:	2039 0016 b82c 	move.l 16b82c <Bitplane1>,d0
    26b6:	23c0 0016 b840 	move.l d0,16b840 <ViewBuffer>
  ViewCopper = Copperlist1;
    26bc:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    26c2:	23c0 0016 b848 	move.l d0,16b848 <ViewCopper>
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    26c8:	2f7c 0000 c800 	move.l #51200,44(sp)
    26ce:	002c 
    26d0:	7002           	moveq #2,d0
    26d2:	2f40 0028      	move.l d0,40(sp)
    26d6:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    26dc:	2c40           	movea.l d0,a6
    26de:	202f 002c      	move.l 44(sp),d0
    26e2:	222f 0028      	move.l 40(sp),d1
    26e6:	4eae ff3a      	jsr -198(a6)
    26ea:	2f40 0024      	move.l d0,36(sp)
    26ee:	202f 0024      	move.l 36(sp),d0
    26f2:	23c0 0016 b830 	move.l d0,16b830 <Bitplane2>
  if(Bitplane2 == 0) {
    26f8:	2039 0016 b830 	move.l 16b830 <Bitplane2>,d0
    26fe:	6658           	bne.s 2758 <PrepareDisplay+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2700:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2706:	2c40           	movea.l d0,a6
    2708:	4eae ffc4      	jsr -60(a6)
    270c:	2f40 0020      	move.l d0,32(sp)
    2710:	202f 0020      	move.l 32(sp),d0
    2714:	2f40 001c      	move.l d0,28(sp)
    2718:	2f7c 0000 7afc 	move.l #31484,24(sp)
    271e:	0018 
    2720:	7026           	moveq #38,d0
    2722:	2f40 0014      	move.l d0,20(sp)
    2726:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    272c:	2c40           	movea.l d0,a6
    272e:	222f 001c      	move.l 28(sp),d1
    2732:	242f 0018      	move.l 24(sp),d2
    2736:	262f 0014      	move.l 20(sp),d3
    273a:	4eae ffd0      	jsr -48(a6)
    273e:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    2742:	7001           	moveq #1,d0
    2744:	2f40 000c      	move.l d0,12(sp)
    2748:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    274e:	2c40           	movea.l d0,a6
    2750:	222f 000c      	move.l 12(sp),d1
    2754:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane2;
    2758:	2039 0016 b830 	move.l 16b830 <Bitplane2>,d0
    275e:	23c0 0016 b83c 	move.l d0,16b83c <DrawBuffer>
  DrawCopper = Copperlist2;
    2764:	2039 0016 b838 	move.l 16b838 <Copperlist2>,d0
    276a:	23c0 0016 b844 	move.l d0,16b844 <DrawCopper>
  /*SwapCl();
  SetBplPointers();
  SwapCl();
  SetBplPointers();*/
  return 0;
    2770:	7000           	moveq #0,d0
}
    2772:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2776:	4fef 0048      	lea 72(sp),sp
    277a:	4e75           	rts

0000277c <TestCopperlistBatch>:

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                  long length) {
    277c:	598f           	subq.l #4,sp
  for( int i=0;i<length;i++)
    277e:	4297           	clr.l (sp)
    2780:	602a           	bra.s 27ac <TestCopperlistBatch+0x30>
    if( instructions[ pos+i] != batch[ i])
    2782:	202f 000c      	move.l 12(sp),d0
    2786:	d097           	add.l (sp),d0
    2788:	d080           	add.l d0,d0
    278a:	d080           	add.l d0,d0
    278c:	206f 0008      	movea.l 8(sp),a0
    2790:	d1c0           	adda.l d0,a0
    2792:	2210           	move.l (a0),d1
    2794:	2017           	move.l (sp),d0
    2796:	d080           	add.l d0,d0
    2798:	d080           	add.l d0,d0
    279a:	206f 0010      	movea.l 16(sp),a0
    279e:	d1c0           	adda.l d0,a0
    27a0:	2010           	move.l (a0),d0
    27a2:	b081           	cmp.l d1,d0
    27a4:	6704           	beq.s 27aa <TestCopperlistBatch+0x2e>
      return 0;
    27a6:	7000           	moveq #0,d0
    27a8:	600c           	bra.s 27b6 <TestCopperlistBatch+0x3a>
  for( int i=0;i<length;i++)
    27aa:	5297           	addq.l #1,(sp)
    27ac:	2017           	move.l (sp),d0
    27ae:	b0af 0014      	cmp.l 20(sp),d0
    27b2:	6dce           	blt.s 2782 <TestCopperlistBatch+0x6>
  return 1;
    27b4:	7001           	moveq #1,d0
}
    27b6:	588f           	addq.l #4,sp
    27b8:	4e75           	rts

000027ba <TestCopperlistPos>:

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    27ba:	202f 0008      	move.l 8(sp),d0
    27be:	d080           	add.l d0,d0
    27c0:	d080           	add.l d0,d0
    27c2:	206f 0004      	movea.l 4(sp),a0
    27c6:	d1c0           	adda.l d0,a0
    27c8:	2010           	move.l (a0),d0
    27ca:	b0af 000c      	cmp.l 12(sp),d0
    27ce:	6604           	bne.s 27d4 <TestCopperlistPos+0x1a>
    return 1;
    27d0:	7001           	moveq #1,d0
    27d2:	6002           	bra.s 27d6 <TestCopperlistPos+0x1c>
  else 
    return 0;
    27d4:	7000           	moveq #0,d0
}
    27d6:	4e75           	rts

000027d8 <TestCopperList>:

void TestCopperList() {
    27d8:	4fef feb8      	lea -328(sp),sp
    27dc:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Write( Output(), "%d", hw->cop1lc);
    27e0:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    27e6:	2c40           	movea.l d0,a6
    27e8:	4eae ffc4      	jsr -60(a6)
    27ec:	2f40 0150      	move.l d0,336(sp)
    27f0:	202f 0150      	move.l 336(sp),d0
    27f4:	2f40 014c      	move.l d0,332(sp)
    27f8:	2f7c 0000 7c77 	move.l #31863,328(sp)
    27fe:	0148 
    2800:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    2806:	2028 0080      	move.l 128(a0),d0
    280a:	2f40 0144      	move.l d0,324(sp)
    280e:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2814:	2c40           	movea.l d0,a6
    2816:	222f 014c      	move.l 332(sp),d1
    281a:	242f 0148      	move.l 328(sp),d2
    281e:	262f 0144      	move.l 324(sp),d3
    2822:	4eae ffd0      	jsr -48(a6)
    2826:	2f40 0140      	move.l d0,320(sp)
  Copperlist1 = ClBuild();
    282a:	4eba fc56      	jsr 2482 <ClBuild>(pc)
    282e:	23c0 0016 b834 	move.l d0,16b834 <Copperlist1>
  DrawCopper = Copperlist1;
    2834:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    283a:	23c0 0016 b844 	move.l d0,16b844 <DrawCopper>
  Copperlist2 = ClBuild();
    2840:	4eba fc40      	jsr 2482 <ClBuild>(pc)
    2844:	23c0 0016 b838 	move.l d0,16b838 <Copperlist2>
  ViewCopper = Copperlist2;
    284a:	2039 0016 b838 	move.l 16b838 <Copperlist2>,d0
    2850:	23c0 0016 b848 	move.l d0,16b848 <ViewCopper>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2856:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    285c:	4878 0010      	pea 10 <_start+0x10>
    2860:	4879 0000 a47c 	pea a47c <ClsSprites>
    2866:	42a7           	clr.l -(sp)
    2868:	2f00           	move.l d0,-(sp)
    286a:	4eba ff10      	jsr 277c <TestCopperlistBatch>(pc)
    286e:	4fef 0010      	lea 16(sp),sp
    2872:	4a80           	tst.l d0
    2874:	6642           	bne.s 28b8 <TestCopperList+0xe0>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    2876:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    287c:	2c40           	movea.l d0,a6
    287e:	4eae ffc4      	jsr -60(a6)
    2882:	2f40 013c      	move.l d0,316(sp)
    2886:	202f 013c      	move.l 316(sp),d0
    288a:	2f40 0138      	move.l d0,312(sp)
    288e:	2f7c 0000 7440 	move.l #29760,308(sp)
    2894:	0134 
    2896:	702c           	moveq #44,d0
    2898:	2f40 0130      	move.l d0,304(sp)
    289c:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    28a2:	2c40           	movea.l d0,a6
    28a4:	222f 0138      	move.l 312(sp),d1
    28a8:	242f 0134      	move.l 308(sp),d2
    28ac:	262f 0130      	move.l 304(sp),d3
    28b0:	4eae ffd0      	jsr -48(a6)
    28b4:	2f40 012c      	move.l d0,300(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    28b8:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    28be:	4878 000c      	pea c <_start+0xc>
    28c2:	4879 0000 a4bc 	pea a4bc <ClScreen>
    28c8:	4878 0010      	pea 10 <_start+0x10>
    28cc:	2f00           	move.l d0,-(sp)
    28ce:	4eba feac      	jsr 277c <TestCopperlistBatch>(pc)
    28d2:	4fef 0010      	lea 16(sp),sp
    28d6:	4a80           	tst.l d0
    28d8:	6642           	bne.s 291c <TestCopperList+0x144>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    28da:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    28e0:	2c40           	movea.l d0,a6
    28e2:	4eae ffc4      	jsr -60(a6)
    28e6:	2f40 0128      	move.l d0,296(sp)
    28ea:	202f 0128      	move.l 296(sp),d0
    28ee:	2f40 0124      	move.l d0,292(sp)
    28f2:	2f7c 0000 7476 	move.l #29814,288(sp)
    28f8:	0120 
    28fa:	7036           	moveq #54,d0
    28fc:	2f40 011c      	move.l d0,284(sp)
    2900:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2906:	2c40           	movea.l d0,a6
    2908:	222f 0124      	move.l 292(sp),d1
    290c:	242f 0120      	move.l 288(sp),d2
    2910:	262f 011c      	move.l 284(sp),d3
    2914:	4eae ffd0      	jsr -48(a6)
    2918:	2f40 0118      	move.l d0,280(sp)
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
    291c:	23fc 0004 0000 	move.l #262144,16b83c <DrawBuffer>
    2922:	0016 b83c 
  ViewBuffer = (ULONG *)0x50000;
    2926:	23fc 0005 0000 	move.l #327680,16b840 <ViewBuffer>
    292c:	0016 b840 
  
  SetBplPointers();
    2930:	4eba d864      	jsr 196 <SetBplPointers>(pc)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    2934:	2039 0016 b83c 	move.l 16b83c <DrawBuffer>,d0
    293a:	0c80 0005 0000 	cmpi.l #327680,d0
    2940:	660e           	bne.s 2950 <TestCopperList+0x178>
    2942:	2039 0016 b840 	move.l 16b840 <ViewBuffer>,d0
    2948:	0c80 0004 0000 	cmpi.l #262144,d0
    294e:	6742           	beq.s 2992 <TestCopperList+0x1ba>
    Write( Output(), 
    2950:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2956:	2c40           	movea.l d0,a6
    2958:	4eae ffc4      	jsr -60(a6)
    295c:	2f40 0114      	move.l d0,276(sp)
    2960:	202f 0114      	move.l 276(sp),d0
    2964:	2f40 0110      	move.l d0,272(sp)
    2968:	2f7c 0000 7c7a 	move.l #31866,268(sp)
    296e:	010c 
    2970:	703b           	moveq #59,d0
    2972:	2f40 0108      	move.l d0,264(sp)
    2976:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    297c:	2c40           	movea.l d0,a6
    297e:	222f 0110      	move.l 272(sp),d1
    2982:	242f 010c      	move.l 268(sp),d2
    2986:	262f 0108      	move.l 264(sp),d3
    298a:	4eae ffd0      	jsr -48(a6)
    298e:	2f40 0104      	move.l d0,260(sp)
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    2992:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    2998:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    299e:	4878 001c      	pea 1c <_start+0x1c>
    29a2:	2f00           	move.l d0,-(sp)
    29a4:	4eba fe14      	jsr 27ba <TestCopperlistPos>(pc)
    29a8:	4fef 000c      	lea 12(sp),sp
    29ac:	4a80           	tst.l d0
    29ae:	6642           	bne.s 29f2 <TestCopperList+0x21a>
    Write(Output(), 
    29b0:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    29b6:	2c40           	movea.l d0,a6
    29b8:	4eae ffc4      	jsr -60(a6)
    29bc:	2f40 0100      	move.l d0,256(sp)
    29c0:	202f 0100      	move.l 256(sp),d0
    29c4:	2f40 00fc      	move.l d0,252(sp)
    29c8:	2f7c 0000 7cb6 	move.l #31926,248(sp)
    29ce:	00f8 
    29d0:	703c           	moveq #60,d0
    29d2:	2f40 00f4      	move.l d0,244(sp)
    29d6:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    29dc:	2c40           	movea.l d0,a6
    29de:	222f 00fc      	move.l 252(sp),d1
    29e2:	242f 00f8      	move.l 248(sp),d2
    29e6:	262f 00f4      	move.l 244(sp),d3
    29ea:	4eae ffd0      	jsr -48(a6)
    29ee:	2f40 00f0      	move.l d0,240(sp)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    29f2:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    29f8:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    29fe:	4878 001d      	pea 1d <_start+0x1d>
    2a02:	2f00           	move.l d0,-(sp)
    2a04:	4eba fdb4      	jsr 27ba <TestCopperlistPos>(pc)
    2a08:	4fef 000c      	lea 12(sp),sp
    2a0c:	4a80           	tst.l d0
    2a0e:	6642           	bne.s 2a52 <TestCopperList+0x27a>
    Write(Output(), 
    2a10:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2a16:	2c40           	movea.l d0,a6
    2a18:	4eae ffc4      	jsr -60(a6)
    2a1c:	2f40 00ec      	move.l d0,236(sp)
    2a20:	202f 00ec      	move.l 236(sp),d0
    2a24:	2f40 00e8      	move.l d0,232(sp)
    2a28:	2f7c 0000 7cf3 	move.l #31987,228(sp)
    2a2e:	00e4 
    2a30:	703c           	moveq #60,d0
    2a32:	2f40 00e0      	move.l d0,224(sp)
    2a36:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2a3c:	2c40           	movea.l d0,a6
    2a3e:	222f 00e8      	move.l 232(sp),d1
    2a42:	242f 00e4      	move.l 228(sp),d2
    2a46:	262f 00e0      	move.l 224(sp),d3
    2a4a:	4eae ffd0      	jsr -48(a6)
    2a4e:	2f40 00dc      	move.l d0,220(sp)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2a52:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    2a58:	4878 0002      	pea 2 <_start+0x2>
    2a5c:	4879 0000 a3fc 	pea a3fc <ClColor>
    2a62:	4878 001e      	pea 1e <_start+0x1e>
    2a66:	2f00           	move.l d0,-(sp)
    2a68:	4eba fd12      	jsr 277c <TestCopperlistBatch>(pc)
    2a6c:	4fef 0010      	lea 16(sp),sp
    2a70:	4a80           	tst.l d0
    2a72:	6642           	bne.s 2ab6 <TestCopperList+0x2de>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2a74:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2a7a:	2c40           	movea.l d0,a6
    2a7c:	4eae ffc4      	jsr -60(a6)
    2a80:	2f40 00d8      	move.l d0,216(sp)
    2a84:	202f 00d8      	move.l 216(sp),d0
    2a88:	2f40 00d4      	move.l d0,212(sp)
    2a8c:	2f7c 0000 74ad 	move.l #29869,208(sp)
    2a92:	00d0 
    2a94:	7021           	moveq #33,d0
    2a96:	2f40 00cc      	move.l d0,204(sp)
    2a9a:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2aa0:	2c40           	movea.l d0,a6
    2aa2:	222f 00d4      	move.l 212(sp),d1
    2aa6:	242f 00d0      	move.l 208(sp),d2
    2aaa:	262f 00cc      	move.l 204(sp),d3
    2aae:	4eae ffd0      	jsr -48(a6)
    2ab2:	2f40 00c8      	move.l d0,200(sp)

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2ab6:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    2abc:	4878 fffe      	pea fffffffe <_end+0xffe9475a>
    2ac0:	4878 0020      	pea 20 <_start+0x20>
    2ac4:	2f00           	move.l d0,-(sp)
    2ac6:	4eba fcf2      	jsr 27ba <TestCopperlistPos>(pc)
    2aca:	4fef 000c      	lea 12(sp),sp
    2ace:	4a80           	tst.l d0
    2ad0:	6642           	bne.s 2b14 <TestCopperList+0x33c>
    Write(Output(), "Copperlist End not correctly set.\n", 34);
    2ad2:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2ad8:	2c40           	movea.l d0,a6
    2ada:	4eae ffc4      	jsr -60(a6)
    2ade:	2f40 00c4      	move.l d0,196(sp)
    2ae2:	202f 00c4      	move.l 196(sp),d0
    2ae6:	2f40 00c0      	move.l d0,192(sp)
    2aea:	2f7c 0000 74cf 	move.l #29903,188(sp)
    2af0:	00bc 
    2af2:	7022           	moveq #34,d0
    2af4:	2f40 00b8      	move.l d0,184(sp)
    2af8:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2afe:	2c40           	movea.l d0,a6
    2b00:	222f 00c0      	move.l 192(sp),d1
    2b04:	242f 00bc      	move.l 188(sp),d2
    2b08:	262f 00b8      	move.l 184(sp),d3
    2b0c:	4eae ffd0      	jsr -48(a6)
    2b10:	2f40 00b4      	move.l d0,180(sp)
  
  SwapCl();
    2b14:	4eba d6de      	jsr 1f4 <SwapCl>(pc)
  
  if( DrawCopper != Copperlist2)
    2b18:	2239 0016 b844 	move.l 16b844 <DrawCopper>,d1
    2b1e:	2039 0016 b838 	move.l 16b838 <Copperlist2>,d0
    2b24:	b081           	cmp.l d1,d0
    2b26:	6742           	beq.s 2b6a <TestCopperList+0x392>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
    2b28:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2b2e:	2c40           	movea.l d0,a6
    2b30:	4eae ffc4      	jsr -60(a6)
    2b34:	2f40 00b0      	move.l d0,176(sp)
    2b38:	202f 00b0      	move.l 176(sp),d0
    2b3c:	2f40 00ac      	move.l d0,172(sp)
    2b40:	2f7c 0000 7d30 	move.l #32048,168(sp)
    2b46:	00a8 
    2b48:	7015           	moveq #21,d0
    2b4a:	2f40 00a4      	move.l d0,164(sp)
    2b4e:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2b54:	2c40           	movea.l d0,a6
    2b56:	222f 00ac      	move.l 172(sp),d1
    2b5a:	242f 00a8      	move.l 168(sp),d2
    2b5e:	262f 00a4      	move.l 164(sp),d3
    2b62:	4eae ffd0      	jsr -48(a6)
    2b66:	2f40 00a0      	move.l d0,160(sp)

  
  PrepareDisplay();
    2b6a:	4eba fa98      	jsr 2604 <PrepareDisplay>(pc)
  if( DrawBuffer != Bitplane2) 
    2b6e:	2239 0016 b83c 	move.l 16b83c <DrawBuffer>,d1
    2b74:	2039 0016 b830 	move.l 16b830 <Bitplane2>,d0
    2b7a:	b081           	cmp.l d1,d0
    2b7c:	6742           	beq.s 2bc0 <TestCopperList+0x3e8>
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
    2b7e:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2b84:	2c40           	movea.l d0,a6
    2b86:	4eae ffc4      	jsr -60(a6)
    2b8a:	2f40 009c      	move.l d0,156(sp)
    2b8e:	202f 009c      	move.l 156(sp),d0
    2b92:	2f40 0098      	move.l d0,152(sp)
    2b96:	2f7c 0000 7d46 	move.l #32070,148(sp)
    2b9c:	0094 
    2b9e:	7037           	moveq #55,d0
    2ba0:	2f40 0090      	move.l d0,144(sp)
    2ba4:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2baa:	2c40           	movea.l d0,a6
    2bac:	222f 0098      	move.l 152(sp),d1
    2bb0:	242f 0094      	move.l 148(sp),d2
    2bb4:	262f 0090      	move.l 144(sp),d3
    2bb8:	4eae ffd0      	jsr -48(a6)
    2bbc:	2f40 008c      	move.l d0,140(sp)
                                                                            55);
  if( DrawCopper != Copperlist2) 
    2bc0:	2239 0016 b844 	move.l 16b844 <DrawCopper>,d1
    2bc6:	2039 0016 b838 	move.l 16b838 <Copperlist2>,d0
    2bcc:	b081           	cmp.l d1,d0
    2bce:	6742           	beq.s 2c12 <TestCopperList+0x43a>
    Write( Output(), 
    2bd0:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2bd6:	2c40           	movea.l d0,a6
    2bd8:	4eae ffc4      	jsr -60(a6)
    2bdc:	2f40 0088      	move.l d0,136(sp)
    2be0:	202f 0088      	move.l 136(sp),d0
    2be4:	2f40 0084      	move.l d0,132(sp)
    2be8:	2f7c 0000 7d7e 	move.l #32126,128(sp)
    2bee:	0080 
    2bf0:	7039           	moveq #57,d0
    2bf2:	2f40 007c      	move.l d0,124(sp)
    2bf6:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2bfc:	2c40           	movea.l d0,a6
    2bfe:	222f 0084      	move.l 132(sp),d1
    2c02:	242f 0080      	move.l 128(sp),d2
    2c06:	262f 007c      	move.l 124(sp),d3
    2c0a:	4eae ffd0      	jsr -48(a6)
    2c0e:	2f40 0078      	move.l d0,120(sp)
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
    2c12:	2239 0016 b840 	move.l 16b840 <ViewBuffer>,d1
    2c18:	2039 0016 b82c 	move.l 16b82c <Bitplane1>,d0
    2c1e:	b081           	cmp.l d1,d0
    2c20:	6742           	beq.s 2c64 <TestCopperList+0x48c>
    Write( Output(), 
    2c22:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2c28:	2c40           	movea.l d0,a6
    2c2a:	4eae ffc4      	jsr -60(a6)
    2c2e:	2f40 0074      	move.l d0,116(sp)
    2c32:	202f 0074      	move.l 116(sp),d0
    2c36:	2f40 0070      	move.l d0,112(sp)
    2c3a:	2f7c 0000 7db8 	move.l #32184,108(sp)
    2c40:	006c 
    2c42:	7038           	moveq #56,d0
    2c44:	2f40 0068      	move.l d0,104(sp)
    2c48:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2c4e:	2c40           	movea.l d0,a6
    2c50:	222f 0070      	move.l 112(sp),d1
    2c54:	242f 006c      	move.l 108(sp),d2
    2c58:	262f 0068      	move.l 104(sp),d3
    2c5c:	4eae ffd0      	jsr -48(a6)
    2c60:	2f40 0064      	move.l d0,100(sp)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
    2c64:	2239 0016 b848 	move.l 16b848 <ViewCopper>,d1
    2c6a:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    2c70:	b081           	cmp.l d1,d0
    2c72:	6742           	beq.s 2cb6 <TestCopperList+0x4de>
    Write( Output(), 
    2c74:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2c7a:	2c40           	movea.l d0,a6
    2c7c:	4eae ffc4      	jsr -60(a6)
    2c80:	2f40 0060      	move.l d0,96(sp)
    2c84:	202f 0060      	move.l 96(sp),d0
    2c88:	2f40 005c      	move.l d0,92(sp)
    2c8c:	2f7c 0000 7df1 	move.l #32241,88(sp)
    2c92:	0058 
    2c94:	703a           	moveq #58,d0
    2c96:	2f40 0054      	move.l d0,84(sp)
    2c9a:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2ca0:	2c40           	movea.l d0,a6
    2ca2:	222f 005c      	move.l 92(sp),d1
    2ca6:	242f 0058      	move.l 88(sp),d2
    2caa:	262f 0054      	move.l 84(sp),d3
    2cae:	4eae ffd0      	jsr -48(a6)
    2cb2:	2f40 0050      	move.l d0,80(sp)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
    2cb6:	4eba d4de      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
    2cba:	4eba d538      	jsr 1f4 <SwapCl>(pc)
  UWORD *copword = ViewCopper;
    2cbe:	2f79 0016 b848 	move.l 16b848 <ViewCopper>,76(sp)
    2cc4:	004c 
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2cc6:	307c 0076      	movea.w #118,a0
    2cca:	d1ef 004c      	adda.l 76(sp),a0
    2cce:	3010           	move.w (a0),d0
    2cd0:	7200           	moveq #0,d1
    2cd2:	3200           	move.w d0,d1
    2cd4:	307c 0072      	movea.w #114,a0
    2cd8:	d1ef 004c      	adda.l 76(sp),a0
    2cdc:	3010           	move.w (a0),d0
    2cde:	3000           	move.w d0,d0
    2ce0:	0280 0000 ffff 	andi.l #65535,d0
    2ce6:	4840           	swap d0
    2ce8:	4240           	clr.w d0
    2cea:	d081           	add.l d1,d0
    2cec:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2cf0:	2039 0016 b830 	move.l 16b830 <Bitplane2>,d0
    2cf6:	b0af 0048      	cmp.l 72(sp),d0
    2cfa:	6742           	beq.s 2d3e <TestCopperList+0x566>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2cfc:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2d02:	2c40           	movea.l d0,a6
    2d04:	4eae ffc4      	jsr -60(a6)
    2d08:	2f40 0044      	move.l d0,68(sp)
    2d0c:	202f 0044      	move.l 68(sp),d0
    2d10:	2f40 0040      	move.l d0,64(sp)
    2d14:	2f7c 0000 7e2c 	move.l #32300,60(sp)
    2d1a:	003c 
    2d1c:	7048           	moveq #72,d0
    2d1e:	2f40 0038      	move.l d0,56(sp)
    2d22:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2d28:	2c40           	movea.l d0,a6
    2d2a:	222f 0040      	move.l 64(sp),d1
    2d2e:	242f 003c      	move.l 60(sp),d2
    2d32:	262f 0038      	move.l 56(sp),d3
    2d36:	4eae ffd0      	jsr -48(a6)
    2d3a:	2f40 0034      	move.l d0,52(sp)
                                                   " after first frame.\n", 72);
  SetBplPointers();
    2d3e:	4eba d456      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
    2d42:	4eba d4b0      	jsr 1f4 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2d46:	2f79 0016 b848 	move.l 16b848 <ViewCopper>,76(sp)
    2d4c:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2d4e:	307c 0076      	movea.w #118,a0
    2d52:	d1ef 004c      	adda.l 76(sp),a0
    2d56:	3010           	move.w (a0),d0
    2d58:	7200           	moveq #0,d1
    2d5a:	3200           	move.w d0,d1
    2d5c:	307c 0072      	movea.w #114,a0
    2d60:	d1ef 004c      	adda.l 76(sp),a0
    2d64:	3010           	move.w (a0),d0
    2d66:	3000           	move.w d0,d0
    2d68:	0280 0000 ffff 	andi.l #65535,d0
    2d6e:	4840           	swap d0
    2d70:	4240           	clr.w d0
    2d72:	d081           	add.l d1,d0
    2d74:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane1) 
    2d78:	2039 0016 b82c 	move.l 16b82c <Bitplane1>,d0
    2d7e:	b0af 0048      	cmp.l 72(sp),d0
    2d82:	6742           	beq.s 2dc6 <TestCopperList+0x5ee>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
    2d84:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2d8a:	2c40           	movea.l d0,a6
    2d8c:	4eae ffc4      	jsr -60(a6)
    2d90:	2f40 0030      	move.l d0,48(sp)
    2d94:	202f 0030      	move.l 48(sp),d0
    2d98:	2f40 002c      	move.l d0,44(sp)
    2d9c:	2f7c 0000 7e75 	move.l #32373,40(sp)
    2da2:	0028 
    2da4:	7049           	moveq #73,d0
    2da6:	2f40 0024      	move.l d0,36(sp)
    2daa:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2db0:	2c40           	movea.l d0,a6
    2db2:	222f 002c      	move.l 44(sp),d1
    2db6:	242f 0028      	move.l 40(sp),d2
    2dba:	262f 0024      	move.l 36(sp),d3
    2dbe:	4eae ffd0      	jsr -48(a6)
    2dc2:	2f40 0020      	move.l d0,32(sp)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
    2dc6:	4eba d3ce      	jsr 196 <SetBplPointers>(pc)
  SwapCl();
    2dca:	4eba d428      	jsr 1f4 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2dce:	2f79 0016 b848 	move.l 16b848 <ViewCopper>,76(sp)
    2dd4:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2dd6:	307c 0076      	movea.w #118,a0
    2dda:	d1ef 004c      	adda.l 76(sp),a0
    2dde:	3010           	move.w (a0),d0
    2de0:	7200           	moveq #0,d1
    2de2:	3200           	move.w d0,d1
    2de4:	307c 0072      	movea.w #114,a0
    2de8:	d1ef 004c      	adda.l 76(sp),a0
    2dec:	3010           	move.w (a0),d0
    2dee:	3000           	move.w d0,d0
    2df0:	0280 0000 ffff 	andi.l #65535,d0
    2df6:	4840           	swap d0
    2df8:	4240           	clr.w d0
    2dfa:	d081           	add.l d1,d0
    2dfc:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2e00:	2039 0016 b830 	move.l 16b830 <Bitplane2>,d0
    2e06:	b0af 0048      	cmp.l 72(sp),d0
    2e0a:	6742           	beq.s 2e4e <TestCopperList+0x676>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2e0c:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2e12:	2c40           	movea.l d0,a6
    2e14:	4eae ffc4      	jsr -60(a6)
    2e18:	2f40 001c      	move.l d0,28(sp)
    2e1c:	202f 001c      	move.l 28(sp),d0
    2e20:	2f40 0018      	move.l d0,24(sp)
    2e24:	2f7c 0000 7ebf 	move.l #32447,20(sp)
    2e2a:	0014 
    2e2c:	7048           	moveq #72,d0
    2e2e:	2f40 0010      	move.l d0,16(sp)
    2e32:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2e38:	2c40           	movea.l d0,a6
    2e3a:	222f 0018      	move.l 24(sp),d1
    2e3e:	242f 0014      	move.l 20(sp),d2
    2e42:	262f 0010      	move.l 16(sp),d3
    2e46:	4eae ffd0      	jsr -48(a6)
    2e4a:	2f40 000c      	move.l d0,12(sp)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
    2e4e:	2f3c 0000 c800 	move.l #51200,-(sp)
    2e54:	4878 0084      	pea 84 <_start+0x84>
    2e58:	4eba d286      	jsr e0 <FreeDisplay>(pc)
    2e5c:	508f           	addq.l #8,sp
    2e5e:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2e62:	4fef 0148      	lea 328(sp),sp
    2e66:	4e75           	rts

00002e68 <RunTests>:
#include "runtests.h"
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    2e68:	4eba f96e      	jsr 27d8 <TestCopperList>(pc)
    ZoomTest();
    2e6c:	4eba 0004      	jsr 2e72 <ZoomTest>(pc)
    //SwScrollerTest();
    2e70:	4e75           	rts

00002e72 <ZoomTest>:
#include "zoomtest2.h"

ULONG Cl102ZoomTest[137];

void ZoomTest() {
  TestZoomSpeed();
    2e72:	4eba 0046      	jsr 2eba <TestZoomSpeed>(pc)
  ZoomTestDisplay();
    2e76:	4eba 00e2      	jsr 2f5a <ZoomTestDisplay>(pc)
  TestBlitleftOfZoom();
    2e7a:	4eba 05a8      	jsr 3424 <TestBlitleftOfZoom>(pc)
  TestCopyWord();
    2e7e:	4eba 0838      	jsr 36b8 <TestCopyWord>(pc)
  TestZoom4Picture();
    2e82:	4eba 0e12      	jsr 3c96 <TestZoom4Picture>(pc)
  TestZoom4PictureOn5Planes();
    2e86:	4eba 0b22      	jsr 39aa <TestZoom4PictureOn5Planes>(pc)
  Test_Zoom2();
    2e8a:	4eba f012      	jsr 1e9e <Test_Zoom2>(pc)
  c2p1x1_4_c5_gen_init( 320, 256, 0, 0, 0, 0);
    2e8e:	42a7           	clr.l -(sp)
    2e90:	42a7           	clr.l -(sp)
    2e92:	42a7           	clr.l -(sp)
    2e94:	42a7           	clr.l -(sp)
    2e96:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2e9a:	4878 0140      	pea 140 <FreeDisplay+0x60>
    2e9e:	4eb9 0000 71d0 	jsr 71d0 <c2p1x1_4_c5_gen_init>
    2ea4:	4fef 0018      	lea 24(sp),sp
  c2p1x1_4_c5_gen( 0x100, 0x200);
    2ea8:	4878 0200      	pea 200 <SwapCl+0xc>
    2eac:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2eb0:	4eb9 0000 724c 	jsr 724c <c2p1x1_4_c5_gen>
    2eb6:	508f           	addq.l #8,sp
}
    2eb8:	4e75           	rts

00002eba <TestZoomSpeed>:

int Counter4Frames;

void TestZoomSpeed() {
    2eba:	4fef ffe8      	lea -24(sp),sp
    2ebe:	48e7 3002      	movem.l d2-d3/a6,-(sp)

 	TakeSystem();
    2ec2:	4eba d742      	jsr 606 <TakeSystem>(pc)
	WaitVbl();
    2ec6:	4eba d6f4      	jsr 5bc <WaitVbl>(pc)
  //             fedcba9876543210
  //hw->dmacon = 0x8def;

  hw->dmacon = DMAF_SETCLR | DMAF_AUDIO | DMAF_BLITTER | DMAF_RASTER 
    2eca:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    2ed0:	317c 87cf 0096 	move.w #-30769,150(a0)
                                    | DMAF_COPPER | DMAF_MASTER | DMAF_BLITHOG;
   //0b1000011111100000;
  
  //hw->dmacon = 0b1000011111111111;
	hw->intena = (1 << INTB_SETCLR) | (1 << INTB_INTEN) | (1 << INTB_VERTB);
    2ed6:	2079 0016 b84c 	movea.l 16b84c <hw>,a0
    2edc:	317c c020 009a 	move.w #-16352,154(a0)
  
  Zoom_InitRun(); 
    2ee2:	4eba e37c      	jsr 1260 <Zoom_InitRun>(pc)

  int success = 1;
    2ee6:	7001           	moveq #1,d0
    2ee8:	2f40 0020      	move.l d0,32(sp)
  RunFrame();
    2eec:	4eba d49a      	jsr 388 <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    2ef0:	3039 0016 b88a 	move.w 16b88a <Zoom_Counter>,d0
    2ef6:	0c40 0008      	cmpi.w #8,d0
    2efa:	6304           	bls.s 2f00 <TestZoomSpeed+0x46>
    2efc:	42af 0020      	clr.l 32(sp)
    
  Zoom_Dealloc();
    2f00:	4eba e4b0      	jsr 13b2 <Zoom_Dealloc>(pc)
  FreeSystem();
    2f04:	4eba d80c      	jsr 712 <FreeSystem>(pc)

  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    2f08:	4aaf 0020      	tst.l 32(sp)
    2f0c:	6642           	bne.s 2f50 <TestZoomSpeed+0x96>
    2f0e:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2f14:	2c40           	movea.l d0,a6
    2f16:	4eae ffc4      	jsr -60(a6)
    2f1a:	2f40 001c      	move.l d0,28(sp)
    2f1e:	202f 001c      	move.l 28(sp),d0
    2f22:	2f40 0018      	move.l d0,24(sp)
    2f26:	2f7c 0000 7f08 	move.l #32520,20(sp)
    2f2c:	0014 
    2f2e:	701c           	moveq #28,d0
    2f30:	2f40 0010      	move.l d0,16(sp)
    2f34:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2f3a:	2c40           	movea.l d0,a6
    2f3c:	222f 0018      	move.l 24(sp),d1
    2f40:	242f 0014      	move.l 20(sp),d2
    2f44:	262f 0010      	move.l 16(sp),d3
    2f48:	4eae ffd0      	jsr -48(a6)
    2f4c:	2f40 000c      	move.l d0,12(sp)

  //AddIntServer(INTB_VERTB, vbint);
  //RemIntServer(INTB_VERTB, vbint);
  
}
    2f50:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2f54:	4fef 0018      	lea 24(sp),sp
    2f58:	4e75           	rts

00002f5a <ZoomTestDisplay>:

void ZoomTestDisplay() {
    2f5a:	4fef ff38      	lea -200(sp),sp
    2f5e:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Zoom_Init();
    2f62:	4eba e4c2      	jsr 1426 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    2f66:	4eba e860      	jsr 17c8 <PrepareDisplayZoom>(pc)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2f6a:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    2f70:	4878 0010      	pea 10 <_start+0x10>
    2f74:	4879 0000 a47c 	pea a47c <ClsSprites>
    2f7a:	42a7           	clr.l -(sp)
    2f7c:	2f00           	move.l d0,-(sp)
    2f7e:	4eba f7fc      	jsr 277c <TestCopperlistBatch>(pc)
    2f82:	4fef 0010      	lea 16(sp),sp
    2f86:	4a80           	tst.l d0
    2f88:	6642           	bne.s 2fcc <ZoomTestDisplay+0x72>
    Write( Output(), 
    2f8a:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2f90:	2c40           	movea.l d0,a6
    2f92:	4eae ffc4      	jsr -60(a6)
    2f96:	2f40 00d0      	move.l d0,208(sp)
    2f9a:	202f 00d0      	move.l 208(sp),d0
    2f9e:	2f40 00cc      	move.l d0,204(sp)
    2fa2:	2f7c 0000 7f27 	move.l #32551,200(sp)
    2fa8:	00c8 
    2faa:	7045           	moveq #69,d0
    2fac:	2f40 00c4      	move.l d0,196(sp)
    2fb0:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2fb6:	2c40           	movea.l d0,a6
    2fb8:	222f 00cc      	move.l 204(sp),d1
    2fbc:	242f 00c8      	move.l 200(sp),d2
    2fc0:	262f 00c4      	move.l 196(sp),d3
    2fc4:	4eae ffd0      	jsr -48(a6)
    2fc8:	2f40 00c0      	move.l d0,192(sp)
       "ZoomCopperlist: Sprite section of copper starting on pos 0 messed up\n", 
                                                                            69);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2fcc:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    2fd2:	4878 000c      	pea c <_start+0xc>
    2fd6:	4879 0000 a4bc 	pea a4bc <ClScreen>
    2fdc:	4878 0010      	pea 10 <_start+0x10>
    2fe0:	2f00           	move.l d0,-(sp)
    2fe2:	4eba f798      	jsr 277c <TestCopperlistBatch>(pc)
    2fe6:	4fef 0010      	lea 16(sp),sp
    2fea:	4a80           	tst.l d0
    2fec:	6642           	bne.s 3030 <ZoomTestDisplay+0xd6>
    Write( Output(), 
    2fee:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    2ff4:	2c40           	movea.l d0,a6
    2ff6:	4eae ffc4      	jsr -60(a6)
    2ffa:	2f40 00bc      	move.l d0,188(sp)
    2ffe:	202f 00bc      	move.l 188(sp),d0
    3002:	2f40 00b8      	move.l d0,184(sp)
    3006:	2f7c 0000 7f6d 	move.l #32621,180(sp)
    300c:	00b4 
    300e:	7046           	moveq #70,d0
    3010:	2f40 00b0      	move.l d0,176(sp)
    3014:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    301a:	2c40           	movea.l d0,a6
    301c:	222f 00b8      	move.l 184(sp),d1
    3020:	242f 00b4      	move.l 180(sp),d2
    3024:	262f 00b0      	move.l 176(sp),d3
    3028:	4eae ffd0      	jsr -48(a6)
    302c:	2f40 00ac      	move.l d0,172(sp)
      "ZoomCopperlist: Screen section of copper starting on pos 16 messed up\n",
                                                                            70);
  DrawBuffer = (ULONG *) 0x40000;
    3030:	23fc 0004 0000 	move.l #262144,16b83c <DrawBuffer>
    3036:	0016 b83c 
  ViewBuffer = (ULONG *) 0x50000;
    303a:	23fc 0005 0000 	move.l #327680,16b840 <ViewBuffer>
    3040:	0016 b840 
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    3044:	2239 0016 b844 	move.l 16b844 <DrawCopper>,d1
    304a:	2039 0016 b83c 	move.l 16b83c <DrawBuffer>,d0
    3050:	2f01           	move.l d1,-(sp)
    3052:	2f00           	move.l d0,-(sp)
    3054:	4eba edce      	jsr 1e24 <Zoom_SetBplPointers>(pc)
    3058:	508f           	addq.l #8,sp
  Zoom_SwapBuffers( 0);
    305a:	42a7           	clr.l -(sp)
    305c:	4eba ee24      	jsr 1e82 <Zoom_SwapBuffers>(pc)
    3060:	588f           	addq.l #4,sp
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    3062:	2039 0016 b83c 	move.l 16b83c <DrawBuffer>,d0
    3068:	0c80 0005 0000 	cmpi.l #327680,d0
    306e:	660e           	bne.s 307e <ZoomTestDisplay+0x124>
    3070:	2039 0016 b840 	move.l 16b840 <ViewBuffer>,d0
    3076:	0c80 0004 0000 	cmpi.l #262144,d0
    307c:	6742           	beq.s 30c0 <ZoomTestDisplay+0x166>
    Write( Output(), 
    307e:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3084:	2c40           	movea.l d0,a6
    3086:	4eae ffc4      	jsr -60(a6)
    308a:	2f40 00a8      	move.l d0,168(sp)
    308e:	202f 00a8      	move.l 168(sp),d0
    3092:	2f40 00a4      	move.l d0,164(sp)
    3096:	2f7c 0000 7fb4 	move.l #32692,160(sp)
    309c:	00a0 
    309e:	703b           	moveq #59,d0
    30a0:	2f40 009c      	move.l d0,156(sp)
    30a4:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    30aa:	2c40           	movea.l d0,a6
    30ac:	222f 00a4      	move.l 164(sp),d1
    30b0:	242f 00a0      	move.l 160(sp),d2
    30b4:	262f 009c      	move.l 156(sp),d3
    30b8:	4eae ffd0      	jsr -48(a6)
    30bc:	2f40 0098      	move.l d0,152(sp)
            "ZoomCopperlist: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    30c0:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    30c6:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    30cc:	4878 001c      	pea 1c <_start+0x1c>
    30d0:	2f00           	move.l d0,-(sp)
    30d2:	4eba f6e6      	jsr 27ba <TestCopperlistPos>(pc)
    30d6:	4fef 000c      	lea 12(sp),sp
    30da:	4a80           	tst.l d0
    30dc:	6642           	bne.s 3120 <ZoomTestDisplay+0x1c6>
    Write(Output(), 
    30de:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    30e4:	2c40           	movea.l d0,a6
    30e6:	4eae ffc4      	jsr -60(a6)
    30ea:	2f40 0094      	move.l d0,148(sp)
    30ee:	202f 0094      	move.l 148(sp),d0
    30f2:	2f40 0090      	move.l d0,144(sp)
    30f6:	2f7c 0000 7ff0 	move.l #32752,140(sp)
    30fc:	008c 
    30fe:	703c           	moveq #60,d0
    3100:	2f40 0088      	move.l d0,136(sp)
    3104:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    310a:	2c40           	movea.l d0,a6
    310c:	222f 0090      	move.l 144(sp),d1
    3110:	242f 008c      	move.l 140(sp),d2
    3114:	262f 0088      	move.l 136(sp),d3
    3118:	4eae ffd0      	jsr -48(a6)
    311c:	2f40 0084      	move.l d0,132(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    3120:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    3126:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    312c:	4878 001d      	pea 1d <_start+0x1d>
    3130:	2f00           	move.l d0,-(sp)
    3132:	4eba f686      	jsr 27ba <TestCopperlistPos>(pc)
    3136:	4fef 000c      	lea 12(sp),sp
    313a:	4a80           	tst.l d0
    313c:	6642           	bne.s 3180 <ZoomTestDisplay+0x226>
    Write(Output(), 
    313e:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3144:	2c40           	movea.l d0,a6
    3146:	4eae ffc4      	jsr -60(a6)
    314a:	2f40 0080      	move.l d0,128(sp)
    314e:	202f 0080      	move.l 128(sp),d0
    3152:	2f40 007c      	move.l d0,124(sp)
    3156:	2f7c 0000 802d 	move.l #32813,120(sp)
    315c:	0078 
    315e:	703c           	moveq #60,d0
    3160:	2f40 0074      	move.l d0,116(sp)
    3164:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    316a:	2c40           	movea.l d0,a6
    316c:	222f 007c      	move.l 124(sp),d1
    3170:	242f 0078      	move.l 120(sp),d2
    3174:	262f 0074      	move.l 116(sp),d3
    3178:	4eae ffd0      	jsr -48(a6)
    317c:	2f40 0070      	move.l d0,112(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1pl should be 00f4\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    3180:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    3186:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    318c:	4878 001e      	pea 1e <_start+0x1e>
    3190:	2f00           	move.l d0,-(sp)
    3192:	4eba f626      	jsr 27ba <TestCopperlistPos>(pc)
    3196:	4fef 000c      	lea 12(sp),sp
    319a:	4a80           	tst.l d0
    319c:	6642           	bne.s 31e0 <ZoomTestDisplay+0x286>
    Write(Output(), 
    319e:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    31a4:	2c40           	movea.l d0,a6
    31a6:	4eae ffc4      	jsr -60(a6)
    31aa:	2f40 006c      	move.l d0,108(sp)
    31ae:	202f 006c      	move.l 108(sp),d0
    31b2:	2f40 0068      	move.l d0,104(sp)
    31b6:	2f7c 0000 806a 	move.l #32874,100(sp)
    31bc:	0064 
    31be:	703c           	moveq #60,d0
    31c0:	2f40 0060      	move.l d0,96(sp)
    31c4:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    31ca:	2c40           	movea.l d0,a6
    31cc:	222f 0068      	move.l 104(sp),d1
    31d0:	242f 0064      	move.l 100(sp),d2
    31d4:	262f 0060      	move.l 96(sp),d3
    31d8:	4eae ffd0      	jsr -48(a6)
    31dc:	2f40 005c      	move.l d0,92(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    31e0:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    31e6:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    31ec:	4878 001f      	pea 1f <_start+0x1f>
    31f0:	2f00           	move.l d0,-(sp)
    31f2:	4eba f5c6      	jsr 27ba <TestCopperlistPos>(pc)
    31f6:	4fef 000c      	lea 12(sp),sp
    31fa:	4a80           	tst.l d0
    31fc:	6642           	bne.s 3240 <ZoomTestDisplay+0x2e6>
    Write(Output(), 
    31fe:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3204:	2c40           	movea.l d0,a6
    3206:	4eae ffc4      	jsr -60(a6)
    320a:	2f40 0058      	move.l d0,88(sp)
    320e:	202f 0058      	move.l 88(sp),d0
    3212:	2f40 0054      	move.l d0,84(sp)
    3216:	2f7c 0000 80a7 	move.l #32935,80(sp)
    321c:	0050 
    321e:	703c           	moveq #60,d0
    3220:	2f40 004c      	move.l d0,76(sp)
    3224:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    322a:	2c40           	movea.l d0,a6
    322c:	222f 0054      	move.l 84(sp),d1
    3230:	242f 0050      	move.l 80(sp),d2
    3234:	262f 004c      	move.l 76(sp),d3
    3238:	4eae ffd0      	jsr -48(a6)
    323c:	2f40 0048      	move.l d0,72(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2pl should be 0034\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    3240:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    3246:	4878 0020      	pea 20 <_start+0x20>
    324a:	4879 0000 a3fc 	pea a3fc <ClColor>
    3250:	4878 0026      	pea 26 <_start+0x26>
    3254:	2f00           	move.l d0,-(sp)
    3256:	4eba f524      	jsr 277c <TestCopperlistBatch>(pc)
    325a:	4fef 0010      	lea 16(sp),sp
    325e:	4a80           	tst.l d0
    3260:	6642           	bne.s 32a4 <ZoomTestDisplay+0x34a>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    3262:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3268:	2c40           	movea.l d0,a6
    326a:	4eae ffc4      	jsr -60(a6)
    326e:	2f40 0044      	move.l d0,68(sp)
    3272:	202f 0044      	move.l 68(sp),d0
    3276:	2f40 0040      	move.l d0,64(sp)
    327a:	2f7c 0000 80e4 	move.l #32996,60(sp)
    3280:	003c 
    3282:	7025           	moveq #37,d0
    3284:	2f40 0038      	move.l d0,56(sp)
    3288:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    328e:	2c40           	movea.l d0,a6
    3290:	222f 0040      	move.l 64(sp),d1
    3294:	242f 003c      	move.l 60(sp),d2
    3298:	262f 0038      	move.l 56(sp),d3
    329c:	4eae ffd0      	jsr -48(a6)
    32a0:	2f40 0034      	move.l d0,52(sp)

  /*if(  TestCopperlistBatch(  Copperlist1, 71, Cl102ZoomRepeat, 21) == 0)
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36); */
  
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    32a4:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    32aa:	2f00           	move.l d0,-(sp)
    32ac:	4878 000f      	pea f <_start+0xf>
    32b0:	4eba d1e6      	jsr 498 <Zoom_Shrink102>(pc)
    32b4:	508f           	addq.l #8,sp
  if( TestCopperListZoom102( Copperlist1, 73, Cl102ZoomTest) == 0)
    32b6:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    32bc:	4879 0000 b6d0 	pea b6d0 <Cl102ZoomTest>
    32c2:	4878 0049      	pea 49 <_start+0x49>
    32c6:	2f00           	move.l d0,-(sp)
    32c8:	4eba 00c4      	jsr 338e <TestCopperListZoom102>(pc)
    32cc:	4fef 000c      	lea 12(sp),sp
    32d0:	4a80           	tst.l d0
    32d2:	6642           	bne.s 3316 <ZoomTestDisplay+0x3bc>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    32d4:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    32da:	2c40           	movea.l d0,a6
    32dc:	4eae ffc4      	jsr -60(a6)
    32e0:	2f40 0030      	move.l d0,48(sp)
    32e4:	202f 0030      	move.l 48(sp),d0
    32e8:	2f40 002c      	move.l d0,44(sp)
    32ec:	2f7c 0000 810a 	move.l #33034,40(sp)
    32f2:	0028 
    32f4:	7025           	moveq #37,d0
    32f6:	2f40 0024      	move.l d0,36(sp)
    32fa:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3300:	2c40           	movea.l d0,a6
    3302:	222f 002c      	move.l 44(sp),d1
    3306:	242f 0028      	move.l 40(sp),d2
    330a:	262f 0024      	move.l 36(sp),d3
    330e:	4eae ffd0      	jsr -48(a6)
    3312:	2f40 0020      	move.l d0,32(sp)

  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    3316:	2039 0016 b834 	move.l 16b834 <Copperlist1>,d0
    331c:	4878 fffe      	pea fffffffe <_end+0xffe9475a>
    3320:	4878 00bb      	pea bb <WaitBlt+0x7>
    3324:	2f00           	move.l d0,-(sp)
    3326:	4eba f492      	jsr 27ba <TestCopperlistPos>(pc)
    332a:	4fef 000c      	lea 12(sp),sp
    332e:	4a80           	tst.l d0
    3330:	6642           	bne.s 3374 <ZoomTestDisplay+0x41a>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    3332:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3338:	2c40           	movea.l d0,a6
    333a:	4eae ffc4      	jsr -60(a6)
    333e:	2f40 001c      	move.l d0,28(sp)
    3342:	202f 001c      	move.l 28(sp),d0
    3346:	2f40 0018      	move.l d0,24(sp)
    334a:	2f7c 0000 812f 	move.l #33071,20(sp)
    3350:	0014 
    3352:	7032           	moveq #50,d0
    3354:	2f40 0010      	move.l d0,16(sp)
    3358:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    335e:	2c40           	movea.l d0,a6
    3360:	222f 0018      	move.l 24(sp),d1
    3364:	242f 0014      	move.l 20(sp),d2
    3368:	262f 0010      	move.l 16(sp),d3
    336c:	4eae ffd0      	jsr -48(a6)
    3370:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    3374:	2f3c 0000 ff00 	move.l #65280,-(sp)
    337a:	4878 031c      	pea 31c <RunDemo+0x6>
    337e:	4eba cd60      	jsr e0 <FreeDisplay>(pc)
    3382:	508f           	addq.l #8,sp

}
    3384:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3388:	4fef 00c8      	lea 200(sp),sp
    338c:	4e75           	rts

0000338e <TestCopperListZoom102>:

int TestCopperListZoom102( ULONG *cl2test, UWORD position, 
                                                           ULONG *template4cl) {
    338e:	598f           	subq.l #4,sp
    3390:	202f 000c      	move.l 12(sp),d0
    3394:	3000           	move.w d0,d0
    3396:	3f40 0002      	move.w d0,2(sp)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    339a:	7000           	moveq #0,d0
    339c:	302f 0002      	move.w 2(sp),d0
    33a0:	4878 001c      	pea 1c <_start+0x1c>
    33a4:	2f2f 0014      	move.l 20(sp),-(sp)
    33a8:	2f00           	move.l d0,-(sp)
    33aa:	2f2f 0014      	move.l 20(sp),-(sp)
    33ae:	4eba f3cc      	jsr 277c <TestCopperlistBatch>(pc)
    33b2:	4fef 0010      	lea 16(sp),sp
    33b6:	4a80           	tst.l d0
    33b8:	6604           	bne.s 33be <TestCopperListZoom102+0x30>
    return 0;
    33ba:	7000           	moveq #0,d0
    33bc:	6062           	bra.s 3420 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    33be:	7078           	moveq #120,d0
    33c0:	d0af 0010      	add.l 16(sp),d0
    33c4:	7200           	moveq #0,d1
    33c6:	322f 0002      	move.w 2(sp),d1
    33ca:	307c 001e      	movea.w #30,a0
    33ce:	d1c1           	adda.l d1,a0
    33d0:	4878 0036      	pea 36 <_start+0x36>
    33d4:	2f00           	move.l d0,-(sp)
    33d6:	2f08           	move.l a0,-(sp)
    33d8:	2f2f 0014      	move.l 20(sp),-(sp)
    33dc:	4eba f39e      	jsr 277c <TestCopperlistBatch>(pc)
    33e0:	4fef 0010      	lea 16(sp),sp
    33e4:	4a80           	tst.l d0
    33e6:	6604           	bne.s 33ec <TestCopperListZoom102+0x5e>
    return 0;
    33e8:	7000           	moveq #0,d0
    33ea:	6034           	bra.s 3420 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    33ec:	202f 0010      	move.l 16(sp),d0
    33f0:	0680 0000 0158 	addi.l #344,d0
    33f6:	7200           	moveq #0,d1
    33f8:	322f 0002      	move.w 2(sp),d1
    33fc:	307c 0056      	movea.w #86,a0
    3400:	d1c1           	adda.l d1,a0
    3402:	4878 001c      	pea 1c <_start+0x1c>
    3406:	2f00           	move.l d0,-(sp)
    3408:	2f08           	move.l a0,-(sp)
    340a:	2f2f 0014      	move.l 20(sp),-(sp)
    340e:	4eba f36c      	jsr 277c <TestCopperlistBatch>(pc)
    3412:	4fef 0010      	lea 16(sp),sp
    3416:	4a80           	tst.l d0
    3418:	6604           	bne.s 341e <TestCopperListZoom102+0x90>
    return 0;
    341a:	7000           	moveq #0,d0
    341c:	6002           	bra.s 3420 <TestCopperListZoom102+0x92>
 
  return 1;
    341e:	7001           	moveq #1,d0
}
    3420:	588f           	addq.l #4,sp
    3422:	4e75           	rts

00003424 <TestBlitleftOfZoom>:

void TestBlitleftOfZoom() {
    3424:	4fef ff94      	lea -108(sp),sp
    3428:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Zoom_Init();
    342c:	4eba dff8      	jsr 1426 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    3430:	4eba e396      	jsr 17c8 <PrepareDisplayZoom>(pc)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    3434:	2f7c 0000 c800 	move.l #51200,116(sp)
    343a:	0074 
    343c:	7002           	moveq #2,d0
    343e:	2f40 0070      	move.l d0,112(sp)
    3442:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    3448:	2c40           	movea.l d0,a6
    344a:	202f 0074      	move.l 116(sp),d0
    344e:	222f 0070      	move.l 112(sp),d1
    3452:	4eae ff3a      	jsr -198(a6)
    3456:	2f40 006c      	move.l d0,108(sp)
    345a:	202f 006c      	move.l 108(sp),d0
    345e:	23c0 0016 b87c 	move.l d0,16b87c <Zoom_Source>
  if( Zoom_Source == 0) {
    3464:	2039 0016 b87c 	move.l 16b87c <Zoom_Source>,d0
    346a:	6646           	bne.s 34b2 <TestBlitleftOfZoom+0x8e>
    Write(  Output(), 
    346c:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3472:	2c40           	movea.l d0,a6
    3474:	4eae ffc4      	jsr -60(a6)
    3478:	2f40 001c      	move.l d0,28(sp)
    347c:	202f 001c      	move.l 28(sp),d0
    3480:	2f40 0018      	move.l d0,24(sp)
    3484:	2f7c 0000 8162 	move.l #33122,20(sp)
    348a:	0014 
    348c:	7236           	moveq #54,d1
    348e:	2f41 0010      	move.l d1,16(sp)
    3492:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3498:	2c40           	movea.l d0,a6
    349a:	222f 0018      	move.l 24(sp),d1
    349e:	242f 0014      	move.l 20(sp),d2
    34a2:	262f 0010      	move.l 16(sp),d3
    34a6:	4eae ffd0      	jsr -48(a6)
    34aa:	2f40 000c      	move.l d0,12(sp)
    34ae:	6000 01fe      	bra.w 36ae <TestBlitleftOfZoom+0x28a>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  
  UWORD *tstsource = Zoom_Source;
    34b2:	2f79 0016 b87c 	move.l 16b87c <Zoom_Source>,104(sp)
    34b8:	0068 
  *tstsource++ = 0x0000;
    34ba:	202f 0068      	move.l 104(sp),d0
    34be:	2200           	move.l d0,d1
    34c0:	5481           	addq.l #2,d1
    34c2:	2f41 0068      	move.l d1,104(sp)
    34c6:	2040           	movea.l d0,a0
    34c8:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    34ca:	206f 0068      	movea.l 104(sp),a0
    34ce:	30bc 0080      	move.w #128,(a0)
  tstsource += ZMLINESIZE/2-1;
    34d2:	702e           	moveq #46,d0
    34d4:	d1af 0068      	add.l d0,104(sp)
  *tstsource = 0x1000;
    34d8:	206f 0068      	movea.l 104(sp),a0
    34dc:	30bc 1000      	move.w #4096,(a0)
  tstsource++;
    34e0:	54af 0068      	addq.l #2,104(sp)
  *tstsource = 0x8e88;
    34e4:	206f 0068      	movea.l 104(sp),a0
    34e8:	30bc 8e88      	move.w #-29048,(a0)
  tstsource += ZMLINESIZE/2-1;
    34ec:	722e           	moveq #46,d1
    34ee:	d3af 0068      	add.l d1,104(sp)

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
    34f2:	2039 0016 b87c 	move.l 16b87c <Zoom_Source>,d0
    34f8:	2200           	move.l d0,d1
    34fa:	0681 0000 17d0 	addi.l #6096,d1
    3500:	2f41 0068      	move.l d1,104(sp)
  *tstsource++ = 0x0000;
    3504:	202f 0068      	move.l 104(sp),d0
    3508:	2200           	move.l d0,d1
    350a:	5481           	addq.l #2,d1
    350c:	2f41 0068      	move.l d1,104(sp)
    3510:	2040           	movea.l d0,a0
    3512:	4250           	clr.w (a0)
  *tstsource = 0x00ff;
    3514:	206f 0068      	movea.l 104(sp),a0
    3518:	30bc 00ff      	move.w #255,(a0)
  WaitBlit();
    351c:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    3522:	2c40           	movea.l d0,a6
    3524:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    3528:	4eba e416      	jsr 1940 <Init_Blit>(pc)
  Init_ZoomBlit( 7, 16, 0);
    352c:	42a7           	clr.l -(sp)
    352e:	4878 0010      	pea 10 <_start+0x10>
    3532:	4878 0007      	pea 7 <_start+0x7>
    3536:	4eba e484      	jsr 19bc <Init_ZoomBlit>(pc)
    353a:	4fef 000c      	lea 12(sp),sp
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    353e:	2239 0016 b83c 	move.l 16b83c <DrawBuffer>,d1
    3544:	2039 0016 b87c 	move.l 16b87c <Zoom_Source>,d0
    354a:	4878 0080      	pea 80 <_start+0x80>
    354e:	2f01           	move.l d1,-(sp)
    3550:	2f00           	move.l d0,-(sp)
    3552:	4eba dc2a      	jsr 117e <Zoom_ZoomBlit>(pc)
    3556:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    355a:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    3560:	2c40           	movea.l d0,a6
    3562:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    3566:	2039 0016 b83c 	move.l 16b83c <DrawBuffer>,d0
    356c:	2200           	move.l d0,d1
    356e:	5481           	addq.l #2,d1
    3570:	2f41 0064      	move.l d1,100(sp)
  if( *destination != 0x0180) {
    3574:	206f 0064      	movea.l 100(sp),a0
    3578:	3010           	move.w (a0),d0
    357a:	0c40 0180      	cmpi.w #384,d0
    357e:	6742           	beq.s 35c2 <TestBlitleftOfZoom+0x19e>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    3580:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3586:	2c40           	movea.l d0,a6
    3588:	4eae ffc4      	jsr -60(a6)
    358c:	2f40 0060      	move.l d0,96(sp)
    3590:	202f 0060      	move.l 96(sp),d0
    3594:	2f40 005c      	move.l d0,92(sp)
    3598:	2f7c 0000 819a 	move.l #33178,88(sp)
    359e:	0058 
    35a0:	701c           	moveq #28,d0
    35a2:	2f40 0054      	move.l d0,84(sp)
    35a6:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    35ac:	2c40           	movea.l d0,a6
    35ae:	222f 005c      	move.l 92(sp),d1
    35b2:	242f 0058      	move.l 88(sp),d2
    35b6:	262f 0054      	move.l 84(sp),d3
    35ba:	4eae ffd0      	jsr -48(a6)
    35be:	2f40 0050      	move.l d0,80(sp)
  }
  destination += ZMLINESIZE/2;
    35c2:	7230           	moveq #48,d1
    35c4:	d3af 0064      	add.l d1,100(sp)
  if( *destination != 0x1d88)
    35c8:	206f 0064      	movea.l 100(sp),a0
    35cc:	3010           	move.w (a0),d0
    35ce:	0c40 1d88      	cmpi.w #7560,d0
    35d2:	6742           	beq.s 3616 <TestBlitleftOfZoom+0x1f2>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    35d4:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    35da:	2c40           	movea.l d0,a6
    35dc:	4eae ffc4      	jsr -60(a6)
    35e0:	2f40 004c      	move.l d0,76(sp)
    35e4:	202f 004c      	move.l 76(sp),d0
    35e8:	2f40 0048      	move.l d0,72(sp)
    35ec:	2f7c 0000 81b7 	move.l #33207,68(sp)
    35f2:	0044 
    35f4:	701c           	moveq #28,d0
    35f6:	2f40 0040      	move.l d0,64(sp)
    35fa:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3600:	2c40           	movea.l d0,a6
    3602:	222f 0048      	move.l 72(sp),d1
    3606:	242f 0044      	move.l 68(sp),d2
    360a:	262f 0040      	move.l 64(sp),d3
    360e:	4eae ffd0      	jsr -48(a6)
    3612:	2f40 003c      	move.l d0,60(sp)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
    3616:	2039 0016 b83c 	move.l 16b83c <DrawBuffer>,d0
    361c:	2200           	move.l d0,d1
    361e:	0681 0000 17d0 	addi.l #6096,d1
    3624:	2f41 0064      	move.l d1,100(sp)
  destination++;
    3628:	54af 0064      	addq.l #2,100(sp)
  if( *destination != 0x01ff) {
    362c:	206f 0064      	movea.l 100(sp),a0
    3630:	3010           	move.w (a0),d0
    3632:	0c40 01ff      	cmpi.w #511,d0
    3636:	6742           	beq.s 367a <TestBlitleftOfZoom+0x256>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    3638:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    363e:	2c40           	movea.l d0,a6
    3640:	4eae ffc4      	jsr -60(a6)
    3644:	2f40 0038      	move.l d0,56(sp)
    3648:	202f 0038      	move.l 56(sp),d0
    364c:	2f40 0034      	move.l d0,52(sp)
    3650:	2f7c 0000 81d4 	move.l #33236,48(sp)
    3656:	0030 
    3658:	701a           	moveq #26,d0
    365a:	2f40 002c      	move.l d0,44(sp)
    365e:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3664:	2c40           	movea.l d0,a6
    3666:	222f 0034      	move.l 52(sp),d1
    366a:	242f 0030      	move.l 48(sp),d2
    366e:	262f 002c      	move.l 44(sp),d3
    3672:	4eae ffd0      	jsr -48(a6)
    3676:	2f40 0028      	move.l d0,40(sp)
  }
  FreeMem( Zoom_Source, 40*256*5);
    367a:	2f79 0016 b87c 	move.l 16b87c <Zoom_Source>,36(sp)
    3680:	0024 
    3682:	2f7c 0000 c800 	move.l #51200,32(sp)
    3688:	0020 
    368a:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    3690:	2c40           	movea.l d0,a6
    3692:	226f 0024      	movea.l 36(sp),a1
    3696:	202f 0020      	move.l 32(sp),d0
    369a:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    369e:	2f3c 0000 ff00 	move.l #65280,-(sp)
    36a4:	4878 031c      	pea 31c <RunDemo+0x6>
    36a8:	4eba ca36      	jsr e0 <FreeDisplay>(pc)
    36ac:	508f           	addq.l #8,sp
}
    36ae:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    36b2:	4fef 006c      	lea 108(sp),sp
    36b6:	4e75           	rts

000036b8 <TestCopyWord>:

void TestCopyWord() {
    36b8:	4fef ff74      	lea -140(sp),sp
    36bc:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    36c0:	2f7c 0000 05a0 	move.l #1440,136(sp)
    36c6:	0088 
    36c8:	7002           	moveq #2,d0
    36ca:	2f40 0084      	move.l d0,132(sp)
    36ce:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    36d4:	2c40           	movea.l d0,a6
    36d6:	202f 0088      	move.l 136(sp),d0
    36da:	222f 0084      	move.l 132(sp),d1
    36de:	4eae ff3a      	jsr -198(a6)
    36e2:	2f40 0080      	move.l d0,128(sp)
    36e6:	202f 0080      	move.l 128(sp),d0
    36ea:	2f40 007c      	move.l d0,124(sp)
  if( source == 0) {
    36ee:	6646           	bne.s 3736 <TestCopyWord+0x7e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    36f0:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    36f6:	2c40           	movea.l d0,a6
    36f8:	4eae ffc4      	jsr -60(a6)
    36fc:	2f40 001c      	move.l d0,28(sp)
    3700:	202f 001c      	move.l 28(sp),d0
    3704:	2f40 0018      	move.l d0,24(sp)
    3708:	2f7c 0000 81ef 	move.l #33263,20(sp)
    370e:	0014 
    3710:	7235           	moveq #53,d1
    3712:	2f41 0010      	move.l d1,16(sp)
    3716:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    371c:	2c40           	movea.l d0,a6
    371e:	222f 0018      	move.l 24(sp),d1
    3722:	242f 0014      	move.l 20(sp),d2
    3726:	262f 0010      	move.l 16(sp),d3
    372a:	4eae ffd0      	jsr -48(a6)
    372e:	2f40 000c      	move.l d0,12(sp)
    3732:	6000 026c      	bra.w 39a0 <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    3736:	2f7c 0000 05a0 	move.l #1440,120(sp)
    373c:	0078 
    373e:	7002           	moveq #2,d0
    3740:	2f40 0074      	move.l d0,116(sp)
    3744:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    374a:	2c40           	movea.l d0,a6
    374c:	202f 0078      	move.l 120(sp),d0
    3750:	222f 0074      	move.l 116(sp),d1
    3754:	4eae ff3a      	jsr -198(a6)
    3758:	2f40 0070      	move.l d0,112(sp)
    375c:	202f 0070      	move.l 112(sp),d0
    3760:	2f40 006c      	move.l d0,108(sp)
  if( destination == 0) {
    3764:	6646           	bne.s 37ac <TestCopyWord+0xf4>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3766:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    376c:	2c40           	movea.l d0,a6
    376e:	4eae ffc4      	jsr -60(a6)
    3772:	2f40 0030      	move.l d0,48(sp)
    3776:	202f 0030      	move.l 48(sp),d0
    377a:	2f40 002c      	move.l d0,44(sp)
    377e:	2f7c 0000 81ef 	move.l #33263,40(sp)
    3784:	0028 
    3786:	7235           	moveq #53,d1
    3788:	2f41 0024      	move.l d1,36(sp)
    378c:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3792:	2c40           	movea.l d0,a6
    3794:	222f 002c      	move.l 44(sp),d1
    3798:	242f 0028      	move.l 40(sp),d2
    379c:	262f 0024      	move.l 36(sp),d3
    37a0:	4eae ffd0      	jsr -48(a6)
    37a4:	2f40 0020      	move.l d0,32(sp)
    37a8:	6000 01f6      	bra.w 39a0 <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
    37ac:	2f6f 007c 0094 	move.l 124(sp),148(sp)
  for( int i=0; i<8;i++) {
    37b2:	42af 0090      	clr.l 144(sp)
    37b6:	6000 0086      	bra.w 383e <TestCopyWord+0x186>
    *tmp++ = 0;
    37ba:	202f 0094      	move.l 148(sp),d0
    37be:	2200           	move.l d0,d1
    37c0:	5481           	addq.l #2,d1
    37c2:	2f41 0094      	move.l d1,148(sp)
    37c6:	2040           	movea.l d0,a0
    37c8:	4250           	clr.w (a0)
    *tmp++ = 0xaaaa;
    37ca:	202f 0094      	move.l 148(sp),d0
    37ce:	2200           	move.l d0,d1
    37d0:	5481           	addq.l #2,d1
    37d2:	2f41 0094      	move.l d1,148(sp)
    37d6:	2040           	movea.l d0,a0
    37d8:	30bc aaaa      	move.w #-21846,(a0)
    *tmp++ = 0xaaaa;
    37dc:	202f 0094      	move.l 148(sp),d0
    37e0:	2200           	move.l d0,d1
    37e2:	5481           	addq.l #2,d1
    37e4:	2f41 0094      	move.l d1,148(sp)
    37e8:	2040           	movea.l d0,a0
    37ea:	30bc aaaa      	move.w #-21846,(a0)
    *tmp = 0;
    37ee:	206f 0094      	movea.l 148(sp),a0
    37f2:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    37f4:	702a           	moveq #42,d0
    37f6:	d1af 0094      	add.l d0,148(sp)
    *tmp++ = 0;
    37fa:	202f 0094      	move.l 148(sp),d0
    37fe:	2200           	move.l d0,d1
    3800:	5481           	addq.l #2,d1
    3802:	2f41 0094      	move.l d1,148(sp)
    3806:	2040           	movea.l d0,a0
    3808:	4250           	clr.w (a0)
    *tmp++ = 0x5555;
    380a:	202f 0094      	move.l 148(sp),d0
    380e:	2200           	move.l d0,d1
    3810:	5481           	addq.l #2,d1
    3812:	2f41 0094      	move.l d1,148(sp)
    3816:	2040           	movea.l d0,a0
    3818:	30bc 5555      	move.w #21845,(a0)
    *tmp++ = 0x5555;
    381c:	202f 0094      	move.l 148(sp),d0
    3820:	2200           	move.l d0,d1
    3822:	5481           	addq.l #2,d1
    3824:	2f41 0094      	move.l d1,148(sp)
    3828:	2040           	movea.l d0,a0
    382a:	30bc 5555      	move.w #21845,(a0)
    *tmp = 0;
    382e:	206f 0094      	movea.l 148(sp),a0
    3832:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    3834:	702a           	moveq #42,d0
    3836:	d1af 0094      	add.l d0,148(sp)
  for( int i=0; i<8;i++) {
    383a:	52af 0090      	addq.l #1,144(sp)
    383e:	7207           	moveq #7,d1
    3840:	b2af 0090      	cmp.l 144(sp),d1
    3844:	6c00 ff74      	bge.w 37ba <TestCopyWord+0x102>
  }
  tmp = destination;
    3848:	2f6f 006c 0094 	move.l 108(sp),148(sp)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    384e:	42af 008c      	clr.l 140(sp)
    3852:	6014           	bra.s 3868 <TestCopyWord+0x1b0>
    *tmp++ = 0;
    3854:	202f 0094      	move.l 148(sp),d0
    3858:	2200           	move.l d0,d1
    385a:	5481           	addq.l #2,d1
    385c:	2f41 0094      	move.l d1,148(sp)
    3860:	2040           	movea.l d0,a0
    3862:	4250           	clr.w (a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3864:	52af 008c      	addq.l #1,140(sp)
    3868:	0caf 0000 02cf 	cmpi.l #719,140(sp)
    386e:	008c 
    3870:	6fe2           	ble.s 3854 <TestCopyWord+0x19c>
  }

  WaitBlit();
    3872:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    3878:	2c40           	movea.l d0,a6
    387a:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
    387e:	4eba dba6      	jsr 1426 <Zoom_Init>(pc)
  Init_Copy( 3);
    3882:	4878 0003      	pea 3 <_start+0x3>
    3886:	4eba e1d8      	jsr 1a60 <Init_Copy>(pc)
    388a:	588f           	addq.l #4,sp
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
    388c:	202f 007c      	move.l 124(sp),d0
    3890:	5480           	addq.l #2,d0
    3892:	4878 0010      	pea 10 <_start+0x10>
    3896:	2f2f 0070      	move.l 112(sp),-(sp)
    389a:	2f00           	move.l d0,-(sp)
    389c:	4eba d8a2      	jsr 1140 <Zoom_CopyWord>(pc)
    38a0:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    38a4:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    38aa:	2c40           	movea.l d0,a6
    38ac:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
    38b0:	202f 006c      	move.l 108(sp),d0
    38b4:	5480           	addq.l #2,d0
    38b6:	2f40 0094      	move.l d0,148(sp)
  if( *tmp != 0x5555) 
    38ba:	206f 0094      	movea.l 148(sp),a0
    38be:	3010           	move.w (a0),d0
    38c0:	0c40 5555      	cmpi.w #21845,d0
    38c4:	6742           	beq.s 3908 <TestCopyWord+0x250>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    38c6:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    38cc:	2c40           	movea.l d0,a6
    38ce:	4eae ffc4      	jsr -60(a6)
    38d2:	2f40 0068      	move.l d0,104(sp)
    38d6:	202f 0068      	move.l 104(sp),d0
    38da:	2f40 0064      	move.l d0,100(sp)
    38de:	2f7c 0000 8225 	move.l #33317,96(sp)
    38e4:	0060 
    38e6:	721f           	moveq #31,d1
    38e8:	2f41 005c      	move.l d1,92(sp)
    38ec:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    38f2:	2c40           	movea.l d0,a6
    38f4:	222f 0064      	move.l 100(sp),d1
    38f8:	242f 0060      	move.l 96(sp),d2
    38fc:	262f 005c      	move.l 92(sp),d3
    3900:	4eae ffd0      	jsr -48(a6)
    3904:	2f40 0058      	move.l d0,88(sp)
  tmp += ZMLINESIZE/2;
    3908:	7030           	moveq #48,d0
    390a:	d1af 0094      	add.l d0,148(sp)
  if( *tmp != 0xaaaa)
    390e:	206f 0094      	movea.l 148(sp),a0
    3912:	3010           	move.w (a0),d0
    3914:	0c40 aaaa      	cmpi.w #-21846,d0
    3918:	6742           	beq.s 395c <TestCopyWord+0x2a4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    391a:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3920:	2c40           	movea.l d0,a6
    3922:	4eae ffc4      	jsr -60(a6)
    3926:	2f40 0054      	move.l d0,84(sp)
    392a:	202f 0054      	move.l 84(sp),d0
    392e:	2f40 0050      	move.l d0,80(sp)
    3932:	2f7c 0000 8245 	move.l #33349,76(sp)
    3938:	004c 
    393a:	7220           	moveq #32,d1
    393c:	2f41 0048      	move.l d1,72(sp)
    3940:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3946:	2c40           	movea.l d0,a6
    3948:	222f 0050      	move.l 80(sp),d1
    394c:	242f 004c      	move.l 76(sp),d2
    3950:	262f 0048      	move.l 72(sp),d3
    3954:	4eae ffd0      	jsr -48(a6)
    3958:	2f40 0044      	move.l d0,68(sp)
  
  FreeMem( source,ZMLINESIZE*30);
    395c:	2f6f 007c 0040 	move.l 124(sp),64(sp)
    3962:	2f7c 0000 05a0 	move.l #1440,60(sp)
    3968:	003c 
    396a:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    3970:	2c40           	movea.l d0,a6
    3972:	226f 0040      	movea.l 64(sp),a1
    3976:	202f 003c      	move.l 60(sp),d0
    397a:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    397e:	2f6f 006c 0038 	move.l 108(sp),56(sp)
    3984:	2f7c 0000 05a0 	move.l #1440,52(sp)
    398a:	0034 
    398c:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    3992:	2c40           	movea.l d0,a6
    3994:	226f 0038      	movea.l 56(sp),a1
    3998:	202f 0034      	move.l 52(sp),d0
    399c:	4eae ff2e      	jsr -210(a6)
}
    39a0:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    39a4:	4fef 008c      	lea 140(sp),sp
    39a8:	4e75           	rts

000039aa <TestZoom4PictureOn5Planes>:
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */


void TestZoom4PictureOn5Planes() {
    39aa:	4fef ff74      	lea -140(sp),sp
    39ae:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    39b2:	2f7c 0001 1440 	move.l #70720,102(sp)
    39b8:	0066 
    39ba:	7002           	moveq #2,d0
    39bc:	2f40 0062      	move.l d0,98(sp)
    39c0:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    39c6:	2c40           	movea.l d0,a6
    39c8:	202f 0066      	move.l 102(sp),d0
    39cc:	222f 0062      	move.l 98(sp),d1
    39d0:	4eae ff3a      	jsr -198(a6)
    39d4:	2f40 005e      	move.l d0,94(sp)
    39d8:	202f 005e      	move.l 94(sp),d0
    39dc:	2f40 005a      	move.l d0,90(sp)
  if( source == 0) {
    39e0:	6646           	bne.s 3a28 <TestZoom4PictureOn5Planes+0x7e>
    Write(  Output(), 
    39e2:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    39e8:	2c40           	movea.l d0,a6
    39ea:	4eae ffc4      	jsr -60(a6)
    39ee:	2f40 001e      	move.l d0,30(sp)
    39f2:	202f 001e      	move.l 30(sp),d0
    39f6:	2f40 001a      	move.l d0,26(sp)
    39fa:	2f7c 0000 8266 	move.l #33382,22(sp)
    3a00:	0016 
    3a02:	7239           	moveq #57,d1
    3a04:	2f41 0012      	move.l d1,18(sp)
    3a08:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3a0e:	2c40           	movea.l d0,a6
    3a10:	222f 001a      	move.l 26(sp),d1
    3a14:	242f 0016      	move.l 22(sp),d2
    3a18:	262f 0012      	move.l 18(sp),d3
    3a1c:	4eae ffd0      	jsr -48(a6)
    3a20:	2f40 000e      	move.l d0,14(sp)
    3a24:	6000 0266      	bra.w 3c8c <TestZoom4PictureOn5Planes+0x2e2>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3a28:	2f7c 0001 1440 	move.l #70720,86(sp)
    3a2e:	0056 
    3a30:	7002           	moveq #2,d0
    3a32:	2f40 0052      	move.l d0,82(sp)
    3a36:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    3a3c:	2c40           	movea.l d0,a6
    3a3e:	202f 0056      	move.l 86(sp),d0
    3a42:	222f 0052      	move.l 82(sp),d1
    3a46:	4eae ff3a      	jsr -198(a6)
    3a4a:	2f40 004e      	move.l d0,78(sp)
    3a4e:	202f 004e      	move.l 78(sp),d0
    3a52:	2f40 004a      	move.l d0,74(sp)
  if( destination == 0) {
    3a56:	6646           	bne.s 3a9e <TestZoom4PictureOn5Planes+0xf4>
    Write(  Output(), 
    3a58:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3a5e:	2c40           	movea.l d0,a6
    3a60:	4eae ffc4      	jsr -60(a6)
    3a64:	2f40 0032      	move.l d0,50(sp)
    3a68:	202f 0032      	move.l 50(sp),d0
    3a6c:	2f40 002e      	move.l d0,46(sp)
    3a70:	2f7c 0000 82a0 	move.l #33440,42(sp)
    3a76:	002a 
    3a78:	723d           	moveq #61,d1
    3a7a:	2f41 0026      	move.l d1,38(sp)
    3a7e:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3a84:	2c40           	movea.l d0,a6
    3a86:	222f 002e      	move.l 46(sp),d1
    3a8a:	242f 002a      	move.l 42(sp),d2
    3a8e:	262f 0026      	move.l 38(sp),d3
    3a92:	4eae ffd0      	jsr -48(a6)
    3a96:	2f40 0022      	move.l d0,34(sp)
    3a9a:	6000 01f0      	bra.w 3c8c <TestZoom4PictureOn5Planes+0x2e2>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3a9e:	2f6f 005a 0094 	move.l 90(sp),148(sp)
  for(int i=0;i<128+8;i++) {
    3aa4:	42af 0090      	clr.l 144(sp)
    3aa8:	6050           	bra.s 3afa <TestZoom4PictureOn5Planes+0x150>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3aaa:	42af 008c      	clr.l 140(sp)
    3aae:	6018           	bra.s 3ac8 <TestZoom4PictureOn5Planes+0x11e>
      *tmp4source++ = 0x55555555;
    3ab0:	202f 0094      	move.l 148(sp),d0
    3ab4:	2200           	move.l d0,d1
    3ab6:	5881           	addq.l #4,d1
    3ab8:	2f41 0094      	move.l d1,148(sp)
    3abc:	2040           	movea.l d0,a0
    3abe:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3ac4:	52af 008c      	addq.l #1,140(sp)
    3ac8:	703b           	moveq #59,d0
    3aca:	b0af 008c      	cmp.l 140(sp),d0
    3ace:	6ce0           	bge.s 3ab0 <TestZoom4PictureOn5Planes+0x106>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3ad0:	42af 0088      	clr.l 136(sp)
    3ad4:	6018           	bra.s 3aee <TestZoom4PictureOn5Planes+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3ad6:	202f 0094      	move.l 148(sp),d0
    3ada:	2200           	move.l d0,d1
    3adc:	5881           	addq.l #4,d1
    3ade:	2f41 0094      	move.l d1,148(sp)
    3ae2:	2040           	movea.l d0,a0
    3ae4:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3aea:	52af 0088      	addq.l #1,136(sp)
    3aee:	703b           	moveq #59,d0
    3af0:	b0af 0088      	cmp.l 136(sp),d0
    3af4:	6ce0           	bge.s 3ad6 <TestZoom4PictureOn5Planes+0x12c>
  for(int i=0;i<128+8;i++) {
    3af6:	52af 0090      	addq.l #1,144(sp)
    3afa:	0caf 0000 0087 	cmpi.l #135,144(sp)
    3b00:	0090 
    3b02:	6fa6           	ble.s 3aaa <TestZoom4PictureOn5Planes+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3b04:	4878 0005      	pea 5 <_start+0x5>
    3b08:	42a7           	clr.l -(sp)
    3b0a:	2f2f 0052      	move.l 82(sp),-(sp)
    3b0e:	2f2f 0066      	move.l 102(sp),-(sp)
    3b12:	4eba df86      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    3b16:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3b1a:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    3b20:	2c40           	movea.l d0,a6
    3b22:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3b26:	222f 004a      	move.l 74(sp),d1
    3b2a:	5881           	addq.l #4,d1
    3b2c:	2f41 0084      	move.l d1,132(sp)
  UWORD *valsupposed = destlinezoom1;
    3b30:	2f7c 0000 b8f4 	move.l #47348,70(sp)
    3b36:	0046 
  UWORD mask = 0xffff;
    3b38:	3f7c ffff 0082 	move.w #-1,130(sp)
  for(int i=0;i<14;i++) {
    3b3e:	42af 007e      	clr.l 126(sp)
    3b42:	6000 00a8      	bra.w 3bec <TestZoom4PictureOn5Planes+0x242>
    for(int i2=0;i2<18;i2++) { 
    3b46:	42af 007a      	clr.l 122(sp)
    3b4a:	604e           	bra.s 3b9a <TestZoom4PictureOn5Planes+0x1f0>
      for( int i3=0;i3<5;i3++) {
    3b4c:	42af 0076      	clr.l 118(sp)
    3b50:	6038           	bra.s 3b8a <TestZoom4PictureOn5Planes+0x1e0>
        TestRow( valsupposed, valactual, mask, i2+i*19);
    3b52:	222f 007e      	move.l 126(sp),d1
    3b56:	2001           	move.l d1,d0
    3b58:	e788           	lsl.l #3,d0
    3b5a:	d081           	add.l d1,d0
    3b5c:	d080           	add.l d0,d0
    3b5e:	d081           	add.l d1,d0
    3b60:	2200           	move.l d0,d1
    3b62:	d2af 007a      	add.l 122(sp),d1
    3b66:	7000           	moveq #0,d0
    3b68:	302f 0082      	move.w 130(sp),d0
    3b6c:	2f01           	move.l d1,-(sp)
    3b6e:	2f00           	move.l d0,-(sp)
    3b70:	2f2f 008c      	move.l 140(sp),-(sp)
    3b74:	2f2f 0052      	move.l 82(sp),-(sp)
    3b78:	4eba 2f7e      	jsr 6af8 <TestRow>(pc)
    3b7c:	4fef 0010      	lea 16(sp),sp
        valactual += ZMLINESIZE/2;
    3b80:	7030           	moveq #48,d0
    3b82:	d1af 0084      	add.l d0,132(sp)
      for( int i3=0;i3<5;i3++) {
    3b86:	52af 0076      	addq.l #1,118(sp)
    3b8a:	7204           	moveq #4,d1
    3b8c:	b2af 0076      	cmp.l 118(sp),d1
    3b90:	6cc0           	bge.s 3b52 <TestZoom4PictureOn5Planes+0x1a8>
      }
      mask = mask ^ 0xffff;
    3b92:	466f 0082      	not.w 130(sp)
    for(int i2=0;i2<18;i2++) { 
    3b96:	52af 007a      	addq.l #1,122(sp)
    3b9a:	7011           	moveq #17,d0
    3b9c:	b0af 007a      	cmp.l 122(sp),d0
    3ba0:	6caa           	bge.s 3b4c <TestZoom4PictureOn5Planes+0x1a2>
    }
    for( int i3=0;i3<5;i3++) {
    3ba2:	42af 0072      	clr.l 114(sp)
    3ba6:	6038           	bra.s 3be0 <TestZoom4PictureOn5Planes+0x236>
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3ba8:	222f 007e      	move.l 126(sp),d1
    3bac:	2001           	move.l d1,d0
    3bae:	e788           	lsl.l #3,d0
    3bb0:	d081           	add.l d1,d0
    3bb2:	d080           	add.l d0,d0
    3bb4:	2040           	movea.l d0,a0
    3bb6:	d1c1           	adda.l d1,a0
    3bb8:	41e8 0012      	lea 18(a0),a0
    3bbc:	7000           	moveq #0,d0
    3bbe:	302f 0082      	move.w 130(sp),d0
    3bc2:	2f08           	move.l a0,-(sp)
    3bc4:	2f00           	move.l d0,-(sp)
    3bc6:	2f2f 008c      	move.l 140(sp),-(sp)
    3bca:	2f2f 0052      	move.l 82(sp),-(sp)
    3bce:	4eba 2f28      	jsr 6af8 <TestRow>(pc)
    3bd2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3bd6:	7230           	moveq #48,d1
    3bd8:	d3af 0084      	add.l d1,132(sp)
    for( int i3=0;i3<5;i3++) {
    3bdc:	52af 0072      	addq.l #1,114(sp)
    3be0:	7004           	moveq #4,d0
    3be2:	b0af 0072      	cmp.l 114(sp),d0
    3be6:	6cc0           	bge.s 3ba8 <TestZoom4PictureOn5Planes+0x1fe>
  for(int i=0;i<14;i++) {
    3be8:	52af 007e      	addq.l #1,126(sp)
    3bec:	720d           	moveq #13,d1
    3bee:	b2af 007e      	cmp.l 126(sp),d1
    3bf2:	6c00 ff52      	bge.w 3b46 <TestZoom4PictureOn5Planes+0x19c>
    }
  }
  for(int i2=0;i2<4;i2++) { 
    3bf6:	42af 006e      	clr.l 110(sp)
    3bfa:	6044           	bra.s 3c40 <TestZoom4PictureOn5Planes+0x296>
    for( int i3=0;i3<5;i3++) {
    3bfc:	42af 006a      	clr.l 106(sp)
    3c00:	602e           	bra.s 3c30 <TestZoom4PictureOn5Planes+0x286>
      TestRow( valsupposed, valactual, mask, i2+265);
    3c02:	222f 006e      	move.l 110(sp),d1
    3c06:	0681 0000 0109 	addi.l #265,d1
    3c0c:	7000           	moveq #0,d0
    3c0e:	302f 0082      	move.w 130(sp),d0
    3c12:	2f01           	move.l d1,-(sp)
    3c14:	2f00           	move.l d0,-(sp)
    3c16:	2f2f 008c      	move.l 140(sp),-(sp)
    3c1a:	2f2f 0052      	move.l 82(sp),-(sp)
    3c1e:	4eba 2ed8      	jsr 6af8 <TestRow>(pc)
    3c22:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3c26:	7030           	moveq #48,d0
    3c28:	d1af 0084      	add.l d0,132(sp)
    for( int i3=0;i3<5;i3++) {
    3c2c:	52af 006a      	addq.l #1,106(sp)
    3c30:	7204           	moveq #4,d1
    3c32:	b2af 006a      	cmp.l 106(sp),d1
    3c36:	6cca           	bge.s 3c02 <TestZoom4PictureOn5Planes+0x258>
    }
    mask = mask ^ 0xffff;
    3c38:	466f 0082      	not.w 130(sp)
  for(int i2=0;i2<4;i2++) { 
    3c3c:	52af 006e      	addq.l #1,110(sp)
    3c40:	7003           	moveq #3,d0
    3c42:	b0af 006e      	cmp.l 110(sp),d0
    3c46:	6cb4           	bge.s 3bfc <TestZoom4PictureOn5Planes+0x252>
  } 
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    3c48:	2f6f 005a 0042 	move.l 90(sp),66(sp)
    3c4e:	2f7c 0001 1440 	move.l #70720,62(sp)
    3c54:	003e 
    3c56:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    3c5c:	2c40           	movea.l d0,a6
    3c5e:	226f 0042      	movea.l 66(sp),a1
    3c62:	202f 003e      	move.l 62(sp),d0
    3c66:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    3c6a:	2f6f 004a 003a 	move.l 74(sp),58(sp)
    3c70:	2f7c 0001 1440 	move.l #70720,54(sp)
    3c76:	0036 
    3c78:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    3c7e:	2c40           	movea.l d0,a6
    3c80:	226f 003a      	movea.l 58(sp),a1
    3c84:	202f 0036      	move.l 54(sp),d0
    3c88:	4eae ff2e      	jsr -210(a6)
}
    3c8c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3c90:	4fef 008c      	lea 140(sp),sp
    3c94:	4e75           	rts

00003c96 <TestZoom4Picture>:

void TestZoom4Picture() {
    3c96:	4fef fe30      	lea -464(sp),sp
    3c9a:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3c9e:	2f7c 0000 3740 	move.l #14144,106(sp)
    3ca4:	006a 
    3ca6:	7002           	moveq #2,d0
    3ca8:	2f40 0066      	move.l d0,102(sp)
    3cac:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    3cb2:	2c40           	movea.l d0,a6
    3cb4:	202f 006a      	move.l 106(sp),d0
    3cb8:	222f 0066      	move.l 102(sp),d1
    3cbc:	4eae ff3a      	jsr -198(a6)
    3cc0:	2f40 0062      	move.l d0,98(sp)
    3cc4:	202f 0062      	move.l 98(sp),d0
    3cc8:	2f40 005e      	move.l d0,94(sp)
  if( source == 0) {
    3ccc:	6646           	bne.s 3d14 <TestZoom4Picture+0x7e>
    Write(  Output(), 
    3cce:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3cd4:	2c40           	movea.l d0,a6
    3cd6:	4eae ffc4      	jsr -60(a6)
    3cda:	2f40 001e      	move.l d0,30(sp)
    3cde:	202f 001e      	move.l 30(sp),d0
    3ce2:	2f40 001a      	move.l d0,26(sp)
    3ce6:	2f7c 0000 8266 	move.l #33382,22(sp)
    3cec:	0016 
    3cee:	7239           	moveq #57,d1
    3cf0:	2f41 0012      	move.l d1,18(sp)
    3cf4:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3cfa:	2c40           	movea.l d0,a6
    3cfc:	222f 001a      	move.l 26(sp),d1
    3d00:	242f 0016      	move.l 22(sp),d2
    3d04:	262f 0012      	move.l 18(sp),d3
    3d08:	4eae ffd0      	jsr -48(a6)
    3d0c:	2f40 000e      	move.l d0,14(sp)
    3d10:	6000 2ddc      	bra.w 6aee <TestZoom4Picture+0x2e58>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3d14:	2f7c 0000 3740 	move.l #14144,90(sp)
    3d1a:	005a 
    3d1c:	7002           	moveq #2,d0
    3d1e:	2f40 0056      	move.l d0,86(sp)
    3d22:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    3d28:	2c40           	movea.l d0,a6
    3d2a:	202f 005a      	move.l 90(sp),d0
    3d2e:	222f 0056      	move.l 86(sp),d1
    3d32:	4eae ff3a      	jsr -198(a6)
    3d36:	2f40 0052      	move.l d0,82(sp)
    3d3a:	202f 0052      	move.l 82(sp),d0
    3d3e:	2f40 004e      	move.l d0,78(sp)
  if( destination == 0) {
    3d42:	6646           	bne.s 3d8a <TestZoom4Picture+0xf4>
    Write(  Output(), 
    3d44:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3d4a:	2c40           	movea.l d0,a6
    3d4c:	4eae ffc4      	jsr -60(a6)
    3d50:	2f40 0032      	move.l d0,50(sp)
    3d54:	202f 0032      	move.l 50(sp),d0
    3d58:	2f40 002e      	move.l d0,46(sp)
    3d5c:	2f7c 0000 82a0 	move.l #33440,42(sp)
    3d62:	002a 
    3d64:	723d           	moveq #61,d1
    3d66:	2f41 0026      	move.l d1,38(sp)
    3d6a:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    3d70:	2c40           	movea.l d0,a6
    3d72:	222f 002e      	move.l 46(sp),d1
    3d76:	242f 002a      	move.l 42(sp),d2
    3d7a:	262f 0026      	move.l 38(sp),d3
    3d7e:	4eae ffd0      	jsr -48(a6)
    3d82:	2f40 0022      	move.l d0,34(sp)
    3d86:	6000 2d66      	bra.w 6aee <TestZoom4Picture+0x2e58>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3d8a:	2f6f 005e 01d8 	move.l 94(sp),472(sp)
  for(int i=0;i<128+8;i++) {
    3d90:	42af 01d4      	clr.l 468(sp)
    3d94:	6050           	bra.s 3de6 <TestZoom4Picture+0x150>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3d96:	42af 01d0      	clr.l 464(sp)
    3d9a:	6018           	bra.s 3db4 <TestZoom4Picture+0x11e>
      *tmp4source++ = 0x55555555;
    3d9c:	202f 01d8      	move.l 472(sp),d0
    3da0:	2200           	move.l d0,d1
    3da2:	5881           	addq.l #4,d1
    3da4:	2f41 01d8      	move.l d1,472(sp)
    3da8:	2040           	movea.l d0,a0
    3daa:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3db0:	52af 01d0      	addq.l #1,464(sp)
    3db4:	700b           	moveq #11,d0
    3db6:	b0af 01d0      	cmp.l 464(sp),d0
    3dba:	6ce0           	bge.s 3d9c <TestZoom4Picture+0x106>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3dbc:	42af 01cc      	clr.l 460(sp)
    3dc0:	6018           	bra.s 3dda <TestZoom4Picture+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3dc2:	202f 01d8      	move.l 472(sp),d0
    3dc6:	2200           	move.l d0,d1
    3dc8:	5881           	addq.l #4,d1
    3dca:	2f41 01d8      	move.l d1,472(sp)
    3dce:	2040           	movea.l d0,a0
    3dd0:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3dd6:	52af 01cc      	addq.l #1,460(sp)
    3dda:	700b           	moveq #11,d0
    3ddc:	b0af 01cc      	cmp.l 460(sp),d0
    3de0:	6ce0           	bge.s 3dc2 <TestZoom4Picture+0x12c>
  for(int i=0;i<128+8;i++) {
    3de2:	52af 01d4      	addq.l #1,468(sp)
    3de6:	0caf 0000 0087 	cmpi.l #135,468(sp)
    3dec:	01d4 
    3dee:	6fa6           	ble.s 3d96 <TestZoom4Picture+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    3df0:	4878 0001      	pea 1 <_start+0x1>
    3df4:	42a7           	clr.l -(sp)
    3df6:	2f2f 0056      	move.l 86(sp),-(sp)
    3dfa:	2f2f 006a      	move.l 106(sp),-(sp)
    3dfe:	4eba dc9a      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    3e02:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3e06:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    3e0c:	2c40           	movea.l d0,a6
    3e0e:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3e12:	222f 004e      	move.l 78(sp),d1
    3e16:	5881           	addq.l #4,d1
    3e18:	2f41 01c8      	move.l d1,456(sp)
  UWORD *valsupposed = destlinezoom1;
    3e1c:	2f7c 0000 b8f4 	move.l #47348,74(sp)
    3e22:	004a 
  UWORD mask = 0xffff;
    3e24:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<14;i++) {
    3e2a:	42af 01c2      	clr.l 450(sp)
    3e2e:	6000 0084      	bra.w 3eb4 <TestZoom4Picture+0x21e>
    for(int i2=0;i2<18;i2++) { 
    3e32:	42af 01be      	clr.l 446(sp)
    3e36:	603c           	bra.s 3e74 <TestZoom4Picture+0x1de>
      TestRow( valsupposed, valactual, mask, i2+i*19);
    3e38:	222f 01c2      	move.l 450(sp),d1
    3e3c:	2001           	move.l d1,d0
    3e3e:	e788           	lsl.l #3,d0
    3e40:	d081           	add.l d1,d0
    3e42:	d080           	add.l d0,d0
    3e44:	d081           	add.l d1,d0
    3e46:	2200           	move.l d0,d1
    3e48:	d2af 01be      	add.l 446(sp),d1
    3e4c:	7000           	moveq #0,d0
    3e4e:	302f 01c6      	move.w 454(sp),d0
    3e52:	2f01           	move.l d1,-(sp)
    3e54:	2f00           	move.l d0,-(sp)
    3e56:	2f2f 01d0      	move.l 464(sp),-(sp)
    3e5a:	2f2f 0056      	move.l 86(sp),-(sp)
    3e5e:	4eba 2c98      	jsr 6af8 <TestRow>(pc)
    3e62:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3e66:	7030           	moveq #48,d0
    3e68:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    3e6c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) { 
    3e70:	52af 01be      	addq.l #1,446(sp)
    3e74:	7211           	moveq #17,d1
    3e76:	b2af 01be      	cmp.l 446(sp),d1
    3e7a:	6cbc           	bge.s 3e38 <TestZoom4Picture+0x1a2>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    3e7c:	222f 01c2      	move.l 450(sp),d1
    3e80:	2001           	move.l d1,d0
    3e82:	e788           	lsl.l #3,d0
    3e84:	d081           	add.l d1,d0
    3e86:	d080           	add.l d0,d0
    3e88:	2040           	movea.l d0,a0
    3e8a:	d1c1           	adda.l d1,a0
    3e8c:	41e8 0012      	lea 18(a0),a0
    3e90:	7000           	moveq #0,d0
    3e92:	302f 01c6      	move.w 454(sp),d0
    3e96:	2f08           	move.l a0,-(sp)
    3e98:	2f00           	move.l d0,-(sp)
    3e9a:	2f2f 01d0      	move.l 464(sp),-(sp)
    3e9e:	2f2f 0056      	move.l 86(sp),-(sp)
    3ea2:	4eba 2c54      	jsr 6af8 <TestRow>(pc)
    3ea6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3eaa:	7030           	moveq #48,d0
    3eac:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<14;i++) {
    3eb0:	52af 01c2      	addq.l #1,450(sp)
    3eb4:	720d           	moveq #13,d1
    3eb6:	b2af 01c2      	cmp.l 450(sp),d1
    3eba:	6c00 ff76      	bge.w 3e32 <TestZoom4Picture+0x19c>
  }

  for(int i2=0;i2<4;i2++) { 
    3ebe:	42af 01ba      	clr.l 442(sp)
    3ec2:	6032           	bra.s 3ef6 <TestZoom4Picture+0x260>
    TestRow( valsupposed, valactual, mask, i2+265);
    3ec4:	222f 01ba      	move.l 442(sp),d1
    3ec8:	0681 0000 0109 	addi.l #265,d1
    3ece:	7000           	moveq #0,d0
    3ed0:	302f 01c6      	move.w 454(sp),d0
    3ed4:	2f01           	move.l d1,-(sp)
    3ed6:	2f00           	move.l d0,-(sp)
    3ed8:	2f2f 01d0      	move.l 464(sp),-(sp)
    3edc:	2f2f 0056      	move.l 86(sp),-(sp)
    3ee0:	4eba 2c16      	jsr 6af8 <TestRow>(pc)
    3ee4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3ee8:	7030           	moveq #48,d0
    3eea:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    3eee:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    3ef2:	52af 01ba      	addq.l #1,442(sp)
    3ef6:	7203           	moveq #3,d1
    3ef8:	b2af 01ba      	cmp.l 442(sp),d1
    3efc:	6cc6           	bge.s 3ec4 <TestZoom4Picture+0x22e>
  }
  
  UWORD *tmp = source;
    3efe:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    3f04:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    3f0a:	2f6f 0046 004e 	move.l 70(sp),78(sp)
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    3f10:	4878 0001      	pea 1 <_start+0x1>
    3f14:	4878 0001      	pea 1 <_start+0x1>
    3f18:	2f2f 0056      	move.l 86(sp),-(sp)
    3f1c:	2f2f 006a      	move.l 106(sp),-(sp)
    3f20:	4eba db78      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    3f24:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3f28:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    3f2e:	2c40           	movea.l d0,a6
    3f30:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    3f34:	202f 004e      	move.l 78(sp),d0
    3f38:	5880           	addq.l #4,d0
    3f3a:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom2;
    3f3e:	2f7c 0000 b920 	move.l #47392,74(sp)
    3f44:	004a 
  mask = 0x0000;
    3f46:	426f 01c6      	clr.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3f4a:	42af 01b6      	clr.l 438(sp)
    3f4e:	602a           	bra.s 3f7a <TestZoom4Picture+0x2e4>
    TestRow( valsupposed, valactual, mask, i2);
    3f50:	7000           	moveq #0,d0
    3f52:	302f 01c6      	move.w 454(sp),d0
    3f56:	2f2f 01b6      	move.l 438(sp),-(sp)
    3f5a:	2f00           	move.l d0,-(sp)
    3f5c:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f60:	2f2f 0056      	move.l 86(sp),-(sp)
    3f64:	4eba 2b92      	jsr 6af8 <TestRow>(pc)
    3f68:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f6c:	7230           	moveq #48,d1
    3f6e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    3f72:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3f76:	52af 01b6      	addq.l #1,438(sp)
    3f7a:	700a           	moveq #10,d0
    3f7c:	b0af 01b6      	cmp.l 438(sp),d0
    3f80:	6cce           	bge.s 3f50 <TestZoom4Picture+0x2ba>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    3f82:	4878 0008      	pea 8 <_start+0x8>
    3f86:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3f8c:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f90:	2f2f 0056      	move.l 86(sp),-(sp)
    3f94:	4eba 2b62      	jsr 6af8 <TestRow>(pc)
    3f98:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3f9c:	7230           	moveq #48,d1
    3f9e:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 9);
    3fa2:	4878 0009      	pea 9 <_start+0x9>
    3fa6:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3fac:	2f2f 01d0      	move.l 464(sp),-(sp)
    3fb0:	2f2f 0056      	move.l 86(sp),-(sp)
    3fb4:	4eba 2b42      	jsr 6af8 <TestRow>(pc)
    3fb8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3fbc:	7030           	moveq #48,d0
    3fbe:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 10);
    3fc2:	4878 000a      	pea a <_start+0xa>
    3fc6:	42a7           	clr.l -(sp)
    3fc8:	2f2f 01d0      	move.l 464(sp),-(sp)
    3fcc:	2f2f 0056      	move.l 86(sp),-(sp)
    3fd0:	4eba 2b26      	jsr 6af8 <TestRow>(pc)
    3fd4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3fd8:	7230           	moveq #48,d1
    3fda:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 11);
    3fde:	4878 000b      	pea b <_start+0xb>
    3fe2:	42a7           	clr.l -(sp)
    3fe4:	2f2f 01d0      	move.l 464(sp),-(sp)
    3fe8:	2f2f 0056      	move.l 86(sp),-(sp)
    3fec:	4eba 2b0a      	jsr 6af8 <TestRow>(pc)
    3ff0:	4fef 0010      	lea 16(sp),sp

  valactual += ZMLINESIZE/2;
    3ff4:	7030           	moveq #48,d0
    3ff6:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<12;i++) {
    3ffa:	42af 01b2      	clr.l 434(sp)
    3ffe:	6000 0118      	bra.w 4118 <TestZoom4Picture+0x482>
    for(int i2=0;i2<16;i2++) {  
    4002:	42af 01ae      	clr.l 430(sp)
    4006:	603c           	bra.s 4044 <TestZoom4Picture+0x3ae>
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    4008:	222f 01b2      	move.l 434(sp),d1
    400c:	2001           	move.l d1,d0
    400e:	e988           	lsl.l #4,d0
    4010:	d081           	add.l d1,d0
    4012:	2040           	movea.l d0,a0
    4014:	d1ef 01ae      	adda.l 430(sp),a0
    4018:	41e8 000b      	lea 11(a0),a0
    401c:	7000           	moveq #0,d0
    401e:	302f 01c6      	move.w 454(sp),d0
    4022:	2f08           	move.l a0,-(sp)
    4024:	2f00           	move.l d0,-(sp)
    4026:	2f2f 01d0      	move.l 464(sp),-(sp)
    402a:	2f2f 0056      	move.l 86(sp),-(sp)
    402e:	4eba 2ac8      	jsr 6af8 <TestRow>(pc)
    4032:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4036:	7230           	moveq #48,d1
    4038:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    403c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {  
    4040:	52af 01ae      	addq.l #1,430(sp)
    4044:	700f           	moveq #15,d0
    4046:	b0af 01ae      	cmp.l 430(sp),d0
    404a:	6cbc           	bge.s 4008 <TestZoom4Picture+0x372>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    404c:	222f 01b2      	move.l 434(sp),d1
    4050:	2001           	move.l d1,d0
    4052:	e988           	lsl.l #4,d0
    4054:	2040           	movea.l d0,a0
    4056:	d1c1           	adda.l d1,a0
    4058:	41e8 0018      	lea 24(a0),a0
    405c:	7000           	moveq #0,d0
    405e:	302f 01c6      	move.w 454(sp),d0
    4062:	2f08           	move.l a0,-(sp)
    4064:	2f00           	move.l d0,-(sp)
    4066:	2f2f 01d0      	move.l 464(sp),-(sp)
    406a:	2f2f 0056      	move.l 86(sp),-(sp)
    406e:	4eba 2a88      	jsr 6af8 <TestRow>(pc)
    4072:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4076:	7230           	moveq #48,d1
    4078:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    407c:	222f 01b2      	move.l 434(sp),d1
    4080:	2001           	move.l d1,d0
    4082:	e988           	lsl.l #4,d0
    4084:	2040           	movea.l d0,a0
    4086:	d1c1           	adda.l d1,a0
    4088:	41e8 0019      	lea 25(a0),a0
    408c:	7000           	moveq #0,d0
    408e:	302f 01c6      	move.w 454(sp),d0
    4092:	2f08           	move.l a0,-(sp)
    4094:	2f00           	move.l d0,-(sp)
    4096:	2f2f 01d0      	move.l 464(sp),-(sp)
    409a:	2f2f 0056      	move.l 86(sp),-(sp)
    409e:	4eba 2a58      	jsr 6af8 <TestRow>(pc)
    40a2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40a6:	7030           	moveq #48,d0
    40a8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    40ac:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    40b0:	222f 01b2      	move.l 434(sp),d1
    40b4:	2001           	move.l d1,d0
    40b6:	e988           	lsl.l #4,d0
    40b8:	2040           	movea.l d0,a0
    40ba:	d1c1           	adda.l d1,a0
    40bc:	41e8 001a      	lea 26(a0),a0
    40c0:	7000           	moveq #0,d0
    40c2:	302f 01c6      	move.w 454(sp),d0
    40c6:	2f08           	move.l a0,-(sp)
    40c8:	2f00           	move.l d0,-(sp)
    40ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    40ce:	2f2f 0056      	move.l 86(sp),-(sp)
    40d2:	4eba 2a24      	jsr 6af8 <TestRow>(pc)
    40d6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40da:	7230           	moveq #48,d1
    40dc:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    40e0:	222f 01b2      	move.l 434(sp),d1
    40e4:	2001           	move.l d1,d0
    40e6:	e988           	lsl.l #4,d0
    40e8:	2040           	movea.l d0,a0
    40ea:	d1c1           	adda.l d1,a0
    40ec:	41e8 001b      	lea 27(a0),a0
    40f0:	7000           	moveq #0,d0
    40f2:	302f 01c6      	move.w 454(sp),d0
    40f6:	2f08           	move.l a0,-(sp)
    40f8:	2f00           	move.l d0,-(sp)
    40fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    40fe:	2f2f 0056      	move.l 86(sp),-(sp)
    4102:	4eba 29f4      	jsr 6af8 <TestRow>(pc)
    4106:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    410a:	7030           	moveq #48,d0
    410c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4110:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    4114:	52af 01b2      	addq.l #1,434(sp)
    4118:	720b           	moveq #11,d1
    411a:	b2af 01b2      	cmp.l 434(sp),d1
    411e:	6c00 fee2      	bge.w 4002 <TestZoom4Picture+0x36c>
    
  }

  for(int i2=0;i2<15;i2++) { 
    4122:	42af 01aa      	clr.l 426(sp)
    4126:	602a           	bra.s 4152 <TestZoom4Picture+0x4bc>
    TestRow( valsupposed, valactual, mask, i2);
    4128:	7000           	moveq #0,d0
    412a:	302f 01c6      	move.w 454(sp),d0
    412e:	2f2f 01aa      	move.l 426(sp),-(sp)
    4132:	2f00           	move.l d0,-(sp)
    4134:	2f2f 01d0      	move.l 464(sp),-(sp)
    4138:	2f2f 0056      	move.l 86(sp),-(sp)
    413c:	4eba 29ba      	jsr 6af8 <TestRow>(pc)
    4140:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4144:	7030           	moveq #48,d0
    4146:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    414a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<15;i2++) { 
    414e:	52af 01aa      	addq.l #1,426(sp)
    4152:	720e           	moveq #14,d1
    4154:	b2af 01aa      	cmp.l 426(sp),d1
    4158:	6cce           	bge.s 4128 <TestZoom4Picture+0x492>
  }

  tmp = source;
    415a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4160:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4166:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    416c:	4878 0001      	pea 1 <_start+0x1>
    4170:	4878 0002      	pea 2 <_start+0x2>
    4174:	2f2f 0056      	move.l 86(sp),-(sp)
    4178:	2f2f 006a      	move.l 106(sp),-(sp)
    417c:	4eba d91c      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    4180:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4184:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    418a:	2c40           	movea.l d0,a6
    418c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4190:	202f 004e      	move.l 78(sp),d0
    4194:	5880           	addq.l #4,d0
    4196:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom3;
    419a:	2f7c 0000 b94c 	move.l #47436,74(sp)
    41a0:	004a 
  mask = 0xffff;
    41a2:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<4;i2++) { 
    41a8:	42af 01a6      	clr.l 422(sp)
    41ac:	602a           	bra.s 41d8 <TestZoom4Picture+0x542>
    TestRow( valsupposed, valactual, mask, i2);
    41ae:	7000           	moveq #0,d0
    41b0:	302f 01c6      	move.w 454(sp),d0
    41b4:	2f2f 01a6      	move.l 422(sp),-(sp)
    41b8:	2f00           	move.l d0,-(sp)
    41ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    41be:	2f2f 0056      	move.l 86(sp),-(sp)
    41c2:	4eba 2934      	jsr 6af8 <TestRow>(pc)
    41c6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    41ca:	7230           	moveq #48,d1
    41cc:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    41d0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    41d4:	52af 01a6      	addq.l #1,422(sp)
    41d8:	7003           	moveq #3,d0
    41da:	b0af 01a6      	cmp.l 422(sp),d0
    41de:	6cce           	bge.s 41ae <TestZoom4Picture+0x518>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    41e0:	4878 0004      	pea 4 <_start+0x4>
    41e4:	2f3c 0000 ffff 	move.l #65535,-(sp)
    41ea:	2f2f 01d0      	move.l 464(sp),-(sp)
    41ee:	2f2f 0056      	move.l 86(sp),-(sp)
    41f2:	4eba 2904      	jsr 6af8 <TestRow>(pc)
    41f6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    41fa:	7230           	moveq #48,d1
    41fc:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    4200:	4878 0005      	pea 5 <_start+0x5>
    4204:	2f3c 0000 ffff 	move.l #65535,-(sp)
    420a:	2f2f 01d0      	move.l 464(sp),-(sp)
    420e:	2f2f 0056      	move.l 86(sp),-(sp)
    4212:	4eba 28e4      	jsr 6af8 <TestRow>(pc)
    4216:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    421a:	7030           	moveq #48,d0
    421c:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    4220:	4878 0006      	pea 6 <_start+0x6>
    4224:	42a7           	clr.l -(sp)
    4226:	2f2f 01d0      	move.l 464(sp),-(sp)
    422a:	2f2f 0056      	move.l 86(sp),-(sp)
    422e:	4eba 28c8      	jsr 6af8 <TestRow>(pc)
    4232:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4236:	7230           	moveq #48,d1
    4238:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    423c:	4878 0007      	pea 7 <_start+0x7>
    4240:	42a7           	clr.l -(sp)
    4242:	2f2f 01d0      	move.l 464(sp),-(sp)
    4246:	2f2f 0056      	move.l 86(sp),-(sp)
    424a:	4eba 28ac      	jsr 6af8 <TestRow>(pc)
    424e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4252:	7030           	moveq #48,d0
    4254:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    4258:	4878 0008      	pea 8 <_start+0x8>
    425c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4262:	2f2f 01d0      	move.l 464(sp),-(sp)
    4266:	2f2f 0056      	move.l 86(sp),-(sp)
    426a:	4eba 288c      	jsr 6af8 <TestRow>(pc)
    426e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4272:	7230           	moveq #48,d1
    4274:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    4278:	4878 0009      	pea 9 <_start+0x9>
    427c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4282:	2f2f 01d0      	move.l 464(sp),-(sp)
    4286:	2f2f 0056      	move.l 86(sp),-(sp)
    428a:	4eba 286c      	jsr 6af8 <TestRow>(pc)
    428e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4292:	7030           	moveq #48,d0
    4294:	d1af 01c8      	add.l d0,456(sp)

  mask = 0x0000;
    4298:	426f 01c6      	clr.w 454(sp)
  for(int i=0;i<12;i++) {
    429c:	42af 01a2      	clr.l 418(sp)
    42a0:	6000 01a6      	bra.w 4448 <TestZoom4Picture+0x7b2>
    for(int i2=0;i2<15;i2++) {  
    42a4:	42af 019e      	clr.l 414(sp)
    42a8:	6042           	bra.s 42ec <TestZoom4Picture+0x656>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    42aa:	222f 01a2      	move.l 418(sp),d1
    42ae:	2001           	move.l d1,d0
    42b0:	d080           	add.l d0,d0
    42b2:	d081           	add.l d1,d0
    42b4:	2200           	move.l d0,d1
    42b6:	e789           	lsl.l #3,d1
    42b8:	9280           	sub.l d0,d1
    42ba:	2041           	movea.l d1,a0
    42bc:	d1ef 019e      	adda.l 414(sp),a0
    42c0:	41e8 0009      	lea 9(a0),a0
    42c4:	7000           	moveq #0,d0
    42c6:	302f 01c6      	move.w 454(sp),d0
    42ca:	2f08           	move.l a0,-(sp)
    42cc:	2f00           	move.l d0,-(sp)
    42ce:	2f2f 01d0      	move.l 464(sp),-(sp)
    42d2:	2f2f 0056      	move.l 86(sp),-(sp)
    42d6:	4eba 2820      	jsr 6af8 <TestRow>(pc)
    42da:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    42de:	7230           	moveq #48,d1
    42e0:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    42e4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {  
    42e8:	52af 019e      	addq.l #1,414(sp)
    42ec:	700e           	moveq #14,d0
    42ee:	b0af 019e      	cmp.l 414(sp),d0
    42f2:	6cb6           	bge.s 42aa <TestZoom4Picture+0x614>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    42f4:	222f 01a2      	move.l 418(sp),d1
    42f8:	2001           	move.l d1,d0
    42fa:	d080           	add.l d0,d0
    42fc:	d081           	add.l d1,d0
    42fe:	2200           	move.l d0,d1
    4300:	e789           	lsl.l #3,d1
    4302:	2041           	movea.l d1,a0
    4304:	91c0           	suba.l d0,a0
    4306:	41e8 0018      	lea 24(a0),a0
    430a:	7000           	moveq #0,d0
    430c:	302f 01c6      	move.w 454(sp),d0
    4310:	2f08           	move.l a0,-(sp)
    4312:	2f00           	move.l d0,-(sp)
    4314:	2f2f 01d0      	move.l 464(sp),-(sp)
    4318:	2f2f 0056      	move.l 86(sp),-(sp)
    431c:	4eba 27da      	jsr 6af8 <TestRow>(pc)
    4320:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4324:	7230           	moveq #48,d1
    4326:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    432a:	222f 01a2      	move.l 418(sp),d1
    432e:	2001           	move.l d1,d0
    4330:	d080           	add.l d0,d0
    4332:	d081           	add.l d1,d0
    4334:	2200           	move.l d0,d1
    4336:	e789           	lsl.l #3,d1
    4338:	2041           	movea.l d1,a0
    433a:	91c0           	suba.l d0,a0
    433c:	41e8 0019      	lea 25(a0),a0
    4340:	7000           	moveq #0,d0
    4342:	302f 01c6      	move.w 454(sp),d0
    4346:	2f08           	move.l a0,-(sp)
    4348:	2f00           	move.l d0,-(sp)
    434a:	2f2f 01d0      	move.l 464(sp),-(sp)
    434e:	2f2f 0056      	move.l 86(sp),-(sp)
    4352:	4eba 27a4      	jsr 6af8 <TestRow>(pc)
    4356:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    435a:	7030           	moveq #48,d0
    435c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4360:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    4364:	222f 01a2      	move.l 418(sp),d1
    4368:	2001           	move.l d1,d0
    436a:	d080           	add.l d0,d0
    436c:	d081           	add.l d1,d0
    436e:	2200           	move.l d0,d1
    4370:	e789           	lsl.l #3,d1
    4372:	2041           	movea.l d1,a0
    4374:	91c0           	suba.l d0,a0
    4376:	41e8 001a      	lea 26(a0),a0
    437a:	7000           	moveq #0,d0
    437c:	302f 01c6      	move.w 454(sp),d0
    4380:	2f08           	move.l a0,-(sp)
    4382:	2f00           	move.l d0,-(sp)
    4384:	2f2f 01d0      	move.l 464(sp),-(sp)
    4388:	2f2f 0056      	move.l 86(sp),-(sp)
    438c:	4eba 276a      	jsr 6af8 <TestRow>(pc)
    4390:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4394:	7230           	moveq #48,d1
    4396:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    439a:	222f 01a2      	move.l 418(sp),d1
    439e:	2001           	move.l d1,d0
    43a0:	d080           	add.l d0,d0
    43a2:	d081           	add.l d1,d0
    43a4:	2200           	move.l d0,d1
    43a6:	e789           	lsl.l #3,d1
    43a8:	2041           	movea.l d1,a0
    43aa:	91c0           	suba.l d0,a0
    43ac:	41e8 001b      	lea 27(a0),a0
    43b0:	7000           	moveq #0,d0
    43b2:	302f 01c6      	move.w 454(sp),d0
    43b6:	2f08           	move.l a0,-(sp)
    43b8:	2f00           	move.l d0,-(sp)
    43ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    43be:	2f2f 0056      	move.l 86(sp),-(sp)
    43c2:	4eba 2734      	jsr 6af8 <TestRow>(pc)
    43c6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43ca:	7030           	moveq #48,d0
    43cc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    43d0:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    43d4:	222f 01a2      	move.l 418(sp),d1
    43d8:	2001           	move.l d1,d0
    43da:	d080           	add.l d0,d0
    43dc:	d081           	add.l d1,d0
    43de:	2200           	move.l d0,d1
    43e0:	e789           	lsl.l #3,d1
    43e2:	2041           	movea.l d1,a0
    43e4:	91c0           	suba.l d0,a0
    43e6:	41e8 001c      	lea 28(a0),a0
    43ea:	7000           	moveq #0,d0
    43ec:	302f 01c6      	move.w 454(sp),d0
    43f0:	2f08           	move.l a0,-(sp)
    43f2:	2f00           	move.l d0,-(sp)
    43f4:	2f2f 01d0      	move.l 464(sp),-(sp)
    43f8:	2f2f 0056      	move.l 86(sp),-(sp)
    43fc:	4eba 26fa      	jsr 6af8 <TestRow>(pc)
    4400:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4404:	7230           	moveq #48,d1
    4406:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    440a:	222f 01a2      	move.l 418(sp),d1
    440e:	2001           	move.l d1,d0
    4410:	d080           	add.l d0,d0
    4412:	d081           	add.l d1,d0
    4414:	2200           	move.l d0,d1
    4416:	e789           	lsl.l #3,d1
    4418:	2041           	movea.l d1,a0
    441a:	91c0           	suba.l d0,a0
    441c:	41e8 001d      	lea 29(a0),a0
    4420:	7000           	moveq #0,d0
    4422:	302f 01c6      	move.w 454(sp),d0
    4426:	2f08           	move.l a0,-(sp)
    4428:	2f00           	move.l d0,-(sp)
    442a:	2f2f 01d0      	move.l 464(sp),-(sp)
    442e:	2f2f 0056      	move.l 86(sp),-(sp)
    4432:	4eba 26c4      	jsr 6af8 <TestRow>(pc)
    4436:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    443a:	7030           	moveq #48,d0
    443c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4440:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    4444:	52af 01a2      	addq.l #1,418(sp)
    4448:	720b           	moveq #11,d1
    444a:	b2af 01a2      	cmp.l 418(sp),d1
    444e:	6c00 fe54      	bge.w 42a4 <TestZoom4Picture+0x60e>
  }

  for(int i2=0;i2<8;i2++) {  
    4452:	42af 019a      	clr.l 410(sp)
    4456:	6032           	bra.s 448a <TestZoom4Picture+0x7f4>
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    4458:	222f 019a      	move.l 410(sp),d1
    445c:	0681 0000 0105 	addi.l #261,d1
    4462:	7000           	moveq #0,d0
    4464:	302f 01c6      	move.w 454(sp),d0
    4468:	2f01           	move.l d1,-(sp)
    446a:	2f00           	move.l d0,-(sp)
    446c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4470:	2f2f 0056      	move.l 86(sp),-(sp)
    4474:	4eba 2682      	jsr 6af8 <TestRow>(pc)
    4478:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    447c:	7030           	moveq #48,d0
    447e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4482:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    4486:	52af 019a      	addq.l #1,410(sp)
    448a:	7207           	moveq #7,d1
    448c:	b2af 019a      	cmp.l 410(sp),d1
    4490:	6cc6           	bge.s 4458 <TestZoom4Picture+0x7c2>
  }

  tmp = source;
    4492:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4498:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    449e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    44a4:	4878 0001      	pea 1 <_start+0x1>
    44a8:	4878 0003      	pea 3 <_start+0x3>
    44ac:	2f2f 0056      	move.l 86(sp),-(sp)
    44b0:	2f2f 006a      	move.l 106(sp),-(sp)
    44b4:	4eba d5e4      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    44b8:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    44bc:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    44c2:	2c40           	movea.l d0,a6
    44c4:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    44c8:	202f 004e      	move.l 78(sp),d0
    44cc:	5880           	addq.l #4,d0
    44ce:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom4;
    44d2:	2f7c 0000 b978 	move.l #47480,74(sp)
    44d8:	004a 
  mask = 0x0000;
    44da:	426f 01c6      	clr.w 454(sp)
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    44de:	4878 0007      	pea 7 <_start+0x7>
    44e2:	42a7           	clr.l -(sp)
    44e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    44e8:	2f2f 0056      	move.l 86(sp),-(sp)
    44ec:	4eba 260a      	jsr 6af8 <TestRow>(pc)
    44f0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44f4:	7230           	moveq #48,d1
    44f6:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    44fa:	4878 0008      	pea 8 <_start+0x8>
    44fe:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4504:	2f2f 01d0      	move.l 464(sp),-(sp)
    4508:	2f2f 0056      	move.l 86(sp),-(sp)
    450c:	4eba 25ea      	jsr 6af8 <TestRow>(pc)
    4510:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4514:	7030           	moveq #48,d0
    4516:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    451a:	4878 0009      	pea 9 <_start+0x9>
    451e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4524:	2f2f 01d0      	move.l 464(sp),-(sp)
    4528:	2f2f 0056      	move.l 86(sp),-(sp)
    452c:	4eba 25ca      	jsr 6af8 <TestRow>(pc)
    4530:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4534:	7230           	moveq #48,d1
    4536:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    453a:	4878 0008      	pea 8 <_start+0x8>
    453e:	42a7           	clr.l -(sp)
    4540:	2f2f 01d0      	move.l 464(sp),-(sp)
    4544:	2f2f 0056      	move.l 86(sp),-(sp)
    4548:	4eba 25ae      	jsr 6af8 <TestRow>(pc)
    454c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4550:	7030           	moveq #48,d0
    4552:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    4556:	4878 0009      	pea 9 <_start+0x9>
    455a:	42a7           	clr.l -(sp)
    455c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4560:	2f2f 0056      	move.l 86(sp),-(sp)
    4564:	4eba 2592      	jsr 6af8 <TestRow>(pc)
    4568:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    456c:	7230           	moveq #48,d1
    456e:	d3af 01c8      	add.l d1,456(sp)

  mask = 0xffff;
    4572:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<12;i++) {
    4578:	42af 0196      	clr.l 406(sp)
    457c:	6000 0216      	bra.w 4794 <TestZoom4Picture+0xafe>
    for(int i2=0;i2<14;i2++) {  
    4580:	42af 0192      	clr.l 402(sp)
    4584:	6042           	bra.s 45c8 <TestZoom4Picture+0x932>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    4586:	222f 0196      	move.l 406(sp),d1
    458a:	2001           	move.l d1,d0
    458c:	d080           	add.l d0,d0
    458e:	d081           	add.l d1,d0
    4590:	2200           	move.l d0,d1
    4592:	e789           	lsl.l #3,d1
    4594:	9280           	sub.l d0,d1
    4596:	2041           	movea.l d1,a0
    4598:	d1ef 0192      	adda.l 402(sp),a0
    459c:	41e8 0009      	lea 9(a0),a0
    45a0:	7000           	moveq #0,d0
    45a2:	302f 01c6      	move.w 454(sp),d0
    45a6:	2f08           	move.l a0,-(sp)
    45a8:	2f00           	move.l d0,-(sp)
    45aa:	2f2f 01d0      	move.l 464(sp),-(sp)
    45ae:	2f2f 0056      	move.l 86(sp),-(sp)
    45b2:	4eba 2544      	jsr 6af8 <TestRow>(pc)
    45b6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    45ba:	7030           	moveq #48,d0
    45bc:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    45c0:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {  
    45c4:	52af 0192      	addq.l #1,402(sp)
    45c8:	720d           	moveq #13,d1
    45ca:	b2af 0192      	cmp.l 402(sp),d1
    45ce:	6cb6           	bge.s 4586 <TestZoom4Picture+0x8f0>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    45d0:	222f 0196      	move.l 406(sp),d1
    45d4:	2001           	move.l d1,d0
    45d6:	d080           	add.l d0,d0
    45d8:	d081           	add.l d1,d0
    45da:	2200           	move.l d0,d1
    45dc:	e789           	lsl.l #3,d1
    45de:	2041           	movea.l d1,a0
    45e0:	91c0           	suba.l d0,a0
    45e2:	41e8 0018      	lea 24(a0),a0
    45e6:	7000           	moveq #0,d0
    45e8:	302f 01c6      	move.w 454(sp),d0
    45ec:	2f08           	move.l a0,-(sp)
    45ee:	2f00           	move.l d0,-(sp)
    45f0:	2f2f 01d0      	move.l 464(sp),-(sp)
    45f4:	2f2f 0056      	move.l 86(sp),-(sp)
    45f8:	4eba 24fe      	jsr 6af8 <TestRow>(pc)
    45fc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4600:	7030           	moveq #48,d0
    4602:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    4606:	222f 0196      	move.l 406(sp),d1
    460a:	2001           	move.l d1,d0
    460c:	d080           	add.l d0,d0
    460e:	d081           	add.l d1,d0
    4610:	2200           	move.l d0,d1
    4612:	e789           	lsl.l #3,d1
    4614:	2041           	movea.l d1,a0
    4616:	91c0           	suba.l d0,a0
    4618:	41e8 0019      	lea 25(a0),a0
    461c:	7000           	moveq #0,d0
    461e:	302f 01c6      	move.w 454(sp),d0
    4622:	2f08           	move.l a0,-(sp)
    4624:	2f00           	move.l d0,-(sp)
    4626:	2f2f 01d0      	move.l 464(sp),-(sp)
    462a:	2f2f 0056      	move.l 86(sp),-(sp)
    462e:	4eba 24c8      	jsr 6af8 <TestRow>(pc)
    4632:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4636:	7230           	moveq #48,d1
    4638:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    463c:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    4640:	222f 0196      	move.l 406(sp),d1
    4644:	2001           	move.l d1,d0
    4646:	d080           	add.l d0,d0
    4648:	d081           	add.l d1,d0
    464a:	2200           	move.l d0,d1
    464c:	e789           	lsl.l #3,d1
    464e:	2041           	movea.l d1,a0
    4650:	91c0           	suba.l d0,a0
    4652:	41e8 001a      	lea 26(a0),a0
    4656:	7000           	moveq #0,d0
    4658:	302f 01c6      	move.w 454(sp),d0
    465c:	2f08           	move.l a0,-(sp)
    465e:	2f00           	move.l d0,-(sp)
    4660:	2f2f 01d0      	move.l 464(sp),-(sp)
    4664:	2f2f 0056      	move.l 86(sp),-(sp)
    4668:	4eba 248e      	jsr 6af8 <TestRow>(pc)
    466c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4670:	7030           	moveq #48,d0
    4672:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    4676:	222f 0196      	move.l 406(sp),d1
    467a:	2001           	move.l d1,d0
    467c:	d080           	add.l d0,d0
    467e:	d081           	add.l d1,d0
    4680:	2200           	move.l d0,d1
    4682:	e789           	lsl.l #3,d1
    4684:	2041           	movea.l d1,a0
    4686:	91c0           	suba.l d0,a0
    4688:	41e8 001b      	lea 27(a0),a0
    468c:	7000           	moveq #0,d0
    468e:	302f 01c6      	move.w 454(sp),d0
    4692:	2f08           	move.l a0,-(sp)
    4694:	2f00           	move.l d0,-(sp)
    4696:	2f2f 01d0      	move.l 464(sp),-(sp)
    469a:	2f2f 0056      	move.l 86(sp),-(sp)
    469e:	4eba 2458      	jsr 6af8 <TestRow>(pc)
    46a2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46a6:	7230           	moveq #48,d1
    46a8:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    46ac:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    46b0:	222f 0196      	move.l 406(sp),d1
    46b4:	2001           	move.l d1,d0
    46b6:	d080           	add.l d0,d0
    46b8:	d081           	add.l d1,d0
    46ba:	2200           	move.l d0,d1
    46bc:	e789           	lsl.l #3,d1
    46be:	2041           	movea.l d1,a0
    46c0:	91c0           	suba.l d0,a0
    46c2:	41e8 001c      	lea 28(a0),a0
    46c6:	7000           	moveq #0,d0
    46c8:	302f 01c6      	move.w 454(sp),d0
    46cc:	2f08           	move.l a0,-(sp)
    46ce:	2f00           	move.l d0,-(sp)
    46d0:	2f2f 01d0      	move.l 464(sp),-(sp)
    46d4:	2f2f 0056      	move.l 86(sp),-(sp)
    46d8:	4eba 241e      	jsr 6af8 <TestRow>(pc)
    46dc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46e0:	7030           	moveq #48,d0
    46e2:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    46e6:	222f 0196      	move.l 406(sp),d1
    46ea:	2001           	move.l d1,d0
    46ec:	d080           	add.l d0,d0
    46ee:	d081           	add.l d1,d0
    46f0:	2200           	move.l d0,d1
    46f2:	e789           	lsl.l #3,d1
    46f4:	2041           	movea.l d1,a0
    46f6:	91c0           	suba.l d0,a0
    46f8:	41e8 001d      	lea 29(a0),a0
    46fc:	7000           	moveq #0,d0
    46fe:	302f 01c6      	move.w 454(sp),d0
    4702:	2f08           	move.l a0,-(sp)
    4704:	2f00           	move.l d0,-(sp)
    4706:	2f2f 01d0      	move.l 464(sp),-(sp)
    470a:	2f2f 0056      	move.l 86(sp),-(sp)
    470e:	4eba 23e8      	jsr 6af8 <TestRow>(pc)
    4712:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4716:	7230           	moveq #48,d1
    4718:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    471c:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4720:	222f 0196      	move.l 406(sp),d1
    4724:	2001           	move.l d1,d0
    4726:	d080           	add.l d0,d0
    4728:	d081           	add.l d1,d0
    472a:	2200           	move.l d0,d1
    472c:	e789           	lsl.l #3,d1
    472e:	2041           	movea.l d1,a0
    4730:	91c0           	suba.l d0,a0
    4732:	41e8 001c      	lea 28(a0),a0
    4736:	7000           	moveq #0,d0
    4738:	302f 01c6      	move.w 454(sp),d0
    473c:	2f08           	move.l a0,-(sp)
    473e:	2f00           	move.l d0,-(sp)
    4740:	2f2f 01d0      	move.l 464(sp),-(sp)
    4744:	2f2f 0056      	move.l 86(sp),-(sp)
    4748:	4eba 23ae      	jsr 6af8 <TestRow>(pc)
    474c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4750:	7030           	moveq #48,d0
    4752:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4756:	222f 0196      	move.l 406(sp),d1
    475a:	2001           	move.l d1,d0
    475c:	d080           	add.l d0,d0
    475e:	d081           	add.l d1,d0
    4760:	2200           	move.l d0,d1
    4762:	e789           	lsl.l #3,d1
    4764:	2041           	movea.l d1,a0
    4766:	91c0           	suba.l d0,a0
    4768:	41e8 001d      	lea 29(a0),a0
    476c:	7000           	moveq #0,d0
    476e:	302f 01c6      	move.w 454(sp),d0
    4772:	2f08           	move.l a0,-(sp)
    4774:	2f00           	move.l d0,-(sp)
    4776:	2f2f 01d0      	move.l 464(sp),-(sp)
    477a:	2f2f 0056      	move.l 86(sp),-(sp)
    477e:	4eba 2378      	jsr 6af8 <TestRow>(pc)
    4782:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4786:	7230           	moveq #48,d1
    4788:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    478c:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    4790:	52af 0196      	addq.l #1,406(sp)
    4794:	700b           	moveq #11,d0
    4796:	b0af 0196      	cmp.l 406(sp),d0
    479a:	6c00 fde4      	bge.w 4580 <TestZoom4Picture+0x8ea>
  }

  TestRow( valsupposed, valactual, mask, 269);
    479e:	7000           	moveq #0,d0
    47a0:	302f 01c6      	move.w 454(sp),d0
    47a4:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    47a8:	2f00           	move.l d0,-(sp)
    47aa:	2f2f 01d0      	move.l 464(sp),-(sp)
    47ae:	2f2f 0056      	move.l 86(sp),-(sp)
    47b2:	4eba 2344      	jsr 6af8 <TestRow>(pc)
    47b6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    47ba:	7230           	moveq #48,d1
    47bc:	d3af 01c8      	add.l d1,456(sp)
  
  tmp = source;
    47c0:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    47c6:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    47cc:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    47d2:	4878 0001      	pea 1 <_start+0x1>
    47d6:	4878 0004      	pea 4 <_start+0x4>
    47da:	2f2f 0056      	move.l 86(sp),-(sp)
    47de:	2f2f 006a      	move.l 106(sp),-(sp)
    47e2:	4eba d2b6      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    47e6:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    47ea:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    47f0:	2c40           	movea.l d0,a6
    47f2:	4eae ff1c      	jsr -228(a6)

  valactual = destination+2; 
    47f6:	202f 004e      	move.l 78(sp),d0
    47fa:	5880           	addq.l #4,d0
    47fc:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom5;
    4800:	2f7c 0000 b9a4 	move.l #47524,74(sp)
    4806:	004a 
  mask = 0x0000;
    4808:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<13;i2++) {  
    480c:	42af 018e      	clr.l 398(sp)
    4810:	602a           	bra.s 483c <TestZoom4Picture+0xba6>
    TestRow( valsupposed, valactual, mask, i2);
    4812:	7000           	moveq #0,d0
    4814:	302f 01c6      	move.w 454(sp),d0
    4818:	2f2f 018e      	move.l 398(sp),-(sp)
    481c:	2f00           	move.l d0,-(sp)
    481e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4822:	2f2f 0056      	move.l 86(sp),-(sp)
    4826:	4eba 22d0      	jsr 6af8 <TestRow>(pc)
    482a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    482e:	7230           	moveq #48,d1
    4830:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4834:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4838:	52af 018e      	addq.l #1,398(sp)
    483c:	700c           	moveq #12,d0
    483e:	b0af 018e      	cmp.l 398(sp),d0
    4842:	6cce           	bge.s 4812 <TestZoom4Picture+0xb7c>
  }

  TestRow( valsupposed, valactual, mask, 12);   
    4844:	7000           	moveq #0,d0
    4846:	302f 01c6      	move.w 454(sp),d0
    484a:	4878 000c      	pea c <_start+0xc>
    484e:	2f00           	move.l d0,-(sp)
    4850:	2f2f 01d0      	move.l 464(sp),-(sp)
    4854:	2f2f 0056      	move.l 86(sp),-(sp)
    4858:	4eba 229e      	jsr 6af8 <TestRow>(pc)
    485c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4860:	7230           	moveq #48,d1
    4862:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 13);
    4866:	7000           	moveq #0,d0
    4868:	302f 01c6      	move.w 454(sp),d0
    486c:	4878 000d      	pea d <_start+0xd>
    4870:	2f00           	move.l d0,-(sp)
    4872:	2f2f 01d0      	move.l 464(sp),-(sp)
    4876:	2f2f 0056      	move.l 86(sp),-(sp)
    487a:	4eba 227c      	jsr 6af8 <TestRow>(pc)
    487e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4882:	7030           	moveq #48,d0
    4884:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4888:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 14);
    488c:	7000           	moveq #0,d0
    488e:	302f 01c6      	move.w 454(sp),d0
    4892:	4878 000e      	pea e <_start+0xe>
    4896:	2f00           	move.l d0,-(sp)
    4898:	2f2f 01d0      	move.l 464(sp),-(sp)
    489c:	2f2f 0056      	move.l 86(sp),-(sp)
    48a0:	4eba 2256      	jsr 6af8 <TestRow>(pc)
    48a4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48a8:	7230           	moveq #48,d1
    48aa:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 15);
    48ae:	7000           	moveq #0,d0
    48b0:	302f 01c6      	move.w 454(sp),d0
    48b4:	4878 000f      	pea f <_start+0xf>
    48b8:	2f00           	move.l d0,-(sp)
    48ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    48be:	2f2f 0056      	move.l 86(sp),-(sp)
    48c2:	4eba 2234      	jsr 6af8 <TestRow>(pc)
    48c6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48ca:	7030           	moveq #48,d0
    48cc:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    48d0:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 16);
    48d4:	7000           	moveq #0,d0
    48d6:	302f 01c6      	move.w 454(sp),d0
    48da:	4878 0010      	pea 10 <_start+0x10>
    48de:	2f00           	move.l d0,-(sp)
    48e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    48e4:	2f2f 0056      	move.l 86(sp),-(sp)
    48e8:	4eba 220e      	jsr 6af8 <TestRow>(pc)
    48ec:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48f0:	7230           	moveq #48,d1
    48f2:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 17);
    48f6:	7000           	moveq #0,d0
    48f8:	302f 01c6      	move.w 454(sp),d0
    48fc:	4878 0011      	pea 11 <_start+0x11>
    4900:	2f00           	move.l d0,-(sp)
    4902:	2f2f 01d0      	move.l 464(sp),-(sp)
    4906:	2f2f 0056      	move.l 86(sp),-(sp)
    490a:	4eba 21ec      	jsr 6af8 <TestRow>(pc)
    490e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4912:	7030           	moveq #48,d0
    4914:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4918:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 18);
    491c:	7000           	moveq #0,d0
    491e:	302f 01c6      	move.w 454(sp),d0
    4922:	4878 0012      	pea 12 <_start+0x12>
    4926:	2f00           	move.l d0,-(sp)
    4928:	2f2f 01d0      	move.l 464(sp),-(sp)
    492c:	2f2f 0056      	move.l 86(sp),-(sp)
    4930:	4eba 21c6      	jsr 6af8 <TestRow>(pc)
    4934:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4938:	7230           	moveq #48,d1
    493a:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 19);
    493e:	7000           	moveq #0,d0
    4940:	302f 01c6      	move.w 454(sp),d0
    4944:	4878 0013      	pea 13 <_start+0x13>
    4948:	2f00           	move.l d0,-(sp)
    494a:	2f2f 01d0      	move.l 464(sp),-(sp)
    494e:	2f2f 0056      	move.l 86(sp),-(sp)
    4952:	4eba 21a4      	jsr 6af8 <TestRow>(pc)
    4956:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    495a:	7030           	moveq #48,d0
    495c:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4960:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 20);
    4964:	7000           	moveq #0,d0
    4966:	302f 01c6      	move.w 454(sp),d0
    496a:	4878 0014      	pea 14 <_start+0x14>
    496e:	2f00           	move.l d0,-(sp)
    4970:	2f2f 01d0      	move.l 464(sp),-(sp)
    4974:	2f2f 0056      	move.l 86(sp),-(sp)
    4978:	4eba 217e      	jsr 6af8 <TestRow>(pc)
    497c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4980:	7230           	moveq #48,d1
    4982:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 21);
    4986:	7000           	moveq #0,d0
    4988:	302f 01c6      	move.w 454(sp),d0
    498c:	4878 0015      	pea 15 <_start+0x15>
    4990:	2f00           	move.l d0,-(sp)
    4992:	2f2f 01d0      	move.l 464(sp),-(sp)
    4996:	2f2f 0056      	move.l 86(sp),-(sp)
    499a:	4eba 215c      	jsr 6af8 <TestRow>(pc)
    499e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49a2:	7030           	moveq #48,d0
    49a4:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    49a8:	466f 01c6      	not.w 454(sp)


  for(int i=0;i<10;i++) {
    49ac:	42af 018a      	clr.l 394(sp)
    49b0:	6000 0286      	bra.w 4c38 <TestZoom4Picture+0xfa2>
    for(int i2=0;i2<13;i2++) {  
    49b4:	42af 0186      	clr.l 390(sp)
    49b8:	6042           	bra.s 49fc <TestZoom4Picture+0xd66>
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    49ba:	222f 018a      	move.l 394(sp),d1
    49be:	2001           	move.l d1,d0
    49c0:	d080           	add.l d0,d0
    49c2:	d081           	add.l d1,d0
    49c4:	2200           	move.l d0,d1
    49c6:	e789           	lsl.l #3,d1
    49c8:	9280           	sub.l d0,d1
    49ca:	2041           	movea.l d1,a0
    49cc:	d1ef 0186      	adda.l 390(sp),a0
    49d0:	41e8 0016      	lea 22(a0),a0
    49d4:	7000           	moveq #0,d0
    49d6:	302f 01c6      	move.w 454(sp),d0
    49da:	2f08           	move.l a0,-(sp)
    49dc:	2f00           	move.l d0,-(sp)
    49de:	2f2f 01d0      	move.l 464(sp),-(sp)
    49e2:	2f2f 0056      	move.l 86(sp),-(sp)
    49e6:	4eba 2110      	jsr 6af8 <TestRow>(pc)
    49ea:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    49ee:	7230           	moveq #48,d1
    49f0:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    49f4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {  
    49f8:	52af 0186      	addq.l #1,390(sp)
    49fc:	700c           	moveq #12,d0
    49fe:	b0af 0186      	cmp.l 390(sp),d0
    4a02:	6cb6           	bge.s 49ba <TestZoom4Picture+0xd24>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    4a04:	222f 018a      	move.l 394(sp),d1
    4a08:	2001           	move.l d1,d0
    4a0a:	d080           	add.l d0,d0
    4a0c:	d081           	add.l d1,d0
    4a0e:	2200           	move.l d0,d1
    4a10:	e789           	lsl.l #3,d1
    4a12:	2041           	movea.l d1,a0
    4a14:	91c0           	suba.l d0,a0
    4a16:	41e8 0023      	lea 35(a0),a0
    4a1a:	7000           	moveq #0,d0
    4a1c:	302f 01c6      	move.w 454(sp),d0
    4a20:	2f08           	move.l a0,-(sp)
    4a22:	2f00           	move.l d0,-(sp)
    4a24:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a28:	2f2f 0056      	move.l 86(sp),-(sp)
    4a2c:	4eba 20ca      	jsr 6af8 <TestRow>(pc)
    4a30:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a34:	7230           	moveq #48,d1
    4a36:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    4a3a:	222f 018a      	move.l 394(sp),d1
    4a3e:	2001           	move.l d1,d0
    4a40:	d080           	add.l d0,d0
    4a42:	d081           	add.l d1,d0
    4a44:	2200           	move.l d0,d1
    4a46:	e789           	lsl.l #3,d1
    4a48:	2041           	movea.l d1,a0
    4a4a:	91c0           	suba.l d0,a0
    4a4c:	41e8 0024      	lea 36(a0),a0
    4a50:	7000           	moveq #0,d0
    4a52:	302f 01c6      	move.w 454(sp),d0
    4a56:	2f08           	move.l a0,-(sp)
    4a58:	2f00           	move.l d0,-(sp)
    4a5a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a5e:	2f2f 0056      	move.l 86(sp),-(sp)
    4a62:	4eba 2094      	jsr 6af8 <TestRow>(pc)
    4a66:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a6a:	7030           	moveq #48,d0
    4a6c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4a70:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    4a74:	222f 018a      	move.l 394(sp),d1
    4a78:	2001           	move.l d1,d0
    4a7a:	d080           	add.l d0,d0
    4a7c:	d081           	add.l d1,d0
    4a7e:	2200           	move.l d0,d1
    4a80:	e789           	lsl.l #3,d1
    4a82:	2041           	movea.l d1,a0
    4a84:	91c0           	suba.l d0,a0
    4a86:	41e8 0025      	lea 37(a0),a0
    4a8a:	7000           	moveq #0,d0
    4a8c:	302f 01c6      	move.w 454(sp),d0
    4a90:	2f08           	move.l a0,-(sp)
    4a92:	2f00           	move.l d0,-(sp)
    4a94:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a98:	2f2f 0056      	move.l 86(sp),-(sp)
    4a9c:	4eba 205a      	jsr 6af8 <TestRow>(pc)
    4aa0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4aa4:	7230           	moveq #48,d1
    4aa6:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    4aaa:	222f 018a      	move.l 394(sp),d1
    4aae:	2001           	move.l d1,d0
    4ab0:	d080           	add.l d0,d0
    4ab2:	d081           	add.l d1,d0
    4ab4:	2200           	move.l d0,d1
    4ab6:	e789           	lsl.l #3,d1
    4ab8:	2041           	movea.l d1,a0
    4aba:	91c0           	suba.l d0,a0
    4abc:	41e8 0026      	lea 38(a0),a0
    4ac0:	7000           	moveq #0,d0
    4ac2:	302f 01c6      	move.w 454(sp),d0
    4ac6:	2f08           	move.l a0,-(sp)
    4ac8:	2f00           	move.l d0,-(sp)
    4aca:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ace:	2f2f 0056      	move.l 86(sp),-(sp)
    4ad2:	4eba 2024      	jsr 6af8 <TestRow>(pc)
    4ad6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ada:	7030           	moveq #48,d0
    4adc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4ae0:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    4ae4:	222f 018a      	move.l 394(sp),d1
    4ae8:	2001           	move.l d1,d0
    4aea:	d080           	add.l d0,d0
    4aec:	d081           	add.l d1,d0
    4aee:	2200           	move.l d0,d1
    4af0:	e789           	lsl.l #3,d1
    4af2:	2041           	movea.l d1,a0
    4af4:	91c0           	suba.l d0,a0
    4af6:	41e8 0027      	lea 39(a0),a0
    4afa:	7000           	moveq #0,d0
    4afc:	302f 01c6      	move.w 454(sp),d0
    4b00:	2f08           	move.l a0,-(sp)
    4b02:	2f00           	move.l d0,-(sp)
    4b04:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b08:	2f2f 0056      	move.l 86(sp),-(sp)
    4b0c:	4eba 1fea      	jsr 6af8 <TestRow>(pc)
    4b10:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b14:	7230           	moveq #48,d1
    4b16:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    4b1a:	222f 018a      	move.l 394(sp),d1
    4b1e:	2001           	move.l d1,d0
    4b20:	d080           	add.l d0,d0
    4b22:	d081           	add.l d1,d0
    4b24:	2200           	move.l d0,d1
    4b26:	e789           	lsl.l #3,d1
    4b28:	2041           	movea.l d1,a0
    4b2a:	91c0           	suba.l d0,a0
    4b2c:	41e8 0028      	lea 40(a0),a0
    4b30:	7000           	moveq #0,d0
    4b32:	302f 01c6      	move.w 454(sp),d0
    4b36:	2f08           	move.l a0,-(sp)
    4b38:	2f00           	move.l d0,-(sp)
    4b3a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b3e:	2f2f 0056      	move.l 86(sp),-(sp)
    4b42:	4eba 1fb4      	jsr 6af8 <TestRow>(pc)
    4b46:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b4a:	7030           	moveq #48,d0
    4b4c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b50:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    4b54:	222f 018a      	move.l 394(sp),d1
    4b58:	2001           	move.l d1,d0
    4b5a:	d080           	add.l d0,d0
    4b5c:	d081           	add.l d1,d0
    4b5e:	2200           	move.l d0,d1
    4b60:	e789           	lsl.l #3,d1
    4b62:	2041           	movea.l d1,a0
    4b64:	91c0           	suba.l d0,a0
    4b66:	41e8 0029      	lea 41(a0),a0
    4b6a:	7000           	moveq #0,d0
    4b6c:	302f 01c6      	move.w 454(sp),d0
    4b70:	2f08           	move.l a0,-(sp)
    4b72:	2f00           	move.l d0,-(sp)
    4b74:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b78:	2f2f 0056      	move.l 86(sp),-(sp)
    4b7c:	4eba 1f7a      	jsr 6af8 <TestRow>(pc)
    4b80:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b84:	7230           	moveq #48,d1
    4b86:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    4b8a:	222f 018a      	move.l 394(sp),d1
    4b8e:	2001           	move.l d1,d0
    4b90:	d080           	add.l d0,d0
    4b92:	d081           	add.l d1,d0
    4b94:	2200           	move.l d0,d1
    4b96:	e789           	lsl.l #3,d1
    4b98:	2041           	movea.l d1,a0
    4b9a:	91c0           	suba.l d0,a0
    4b9c:	41e8 002a      	lea 42(a0),a0
    4ba0:	7000           	moveq #0,d0
    4ba2:	302f 01c6      	move.w 454(sp),d0
    4ba6:	2f08           	move.l a0,-(sp)
    4ba8:	2f00           	move.l d0,-(sp)
    4baa:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bae:	2f2f 0056      	move.l 86(sp),-(sp)
    4bb2:	4eba 1f44      	jsr 6af8 <TestRow>(pc)
    4bb6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4bba:	7030           	moveq #48,d0
    4bbc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4bc0:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    4bc4:	222f 018a      	move.l 394(sp),d1
    4bc8:	2001           	move.l d1,d0
    4bca:	d080           	add.l d0,d0
    4bcc:	d081           	add.l d1,d0
    4bce:	2200           	move.l d0,d1
    4bd0:	e789           	lsl.l #3,d1
    4bd2:	2041           	movea.l d1,a0
    4bd4:	91c0           	suba.l d0,a0
    4bd6:	41e8 002b      	lea 43(a0),a0
    4bda:	7000           	moveq #0,d0
    4bdc:	302f 01c6      	move.w 454(sp),d0
    4be0:	2f08           	move.l a0,-(sp)
    4be2:	2f00           	move.l d0,-(sp)
    4be4:	2f2f 01d0      	move.l 464(sp),-(sp)
    4be8:	2f2f 0056      	move.l 86(sp),-(sp)
    4bec:	4eba 1f0a      	jsr 6af8 <TestRow>(pc)
    4bf0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4bf4:	7230           	moveq #48,d1
    4bf6:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    4bfa:	222f 018a      	move.l 394(sp),d1
    4bfe:	2001           	move.l d1,d0
    4c00:	d080           	add.l d0,d0
    4c02:	d081           	add.l d1,d0
    4c04:	2200           	move.l d0,d1
    4c06:	e789           	lsl.l #3,d1
    4c08:	2041           	movea.l d1,a0
    4c0a:	91c0           	suba.l d0,a0
    4c0c:	41e8 002c      	lea 44(a0),a0
    4c10:	7000           	moveq #0,d0
    4c12:	302f 01c6      	move.w 454(sp),d0
    4c16:	2f08           	move.l a0,-(sp)
    4c18:	2f00           	move.l d0,-(sp)
    4c1a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c1e:	2f2f 0056      	move.l 86(sp),-(sp)
    4c22:	4eba 1ed4      	jsr 6af8 <TestRow>(pc)
    4c26:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c2a:	7030           	moveq #48,d0
    4c2c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c30:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<10;i++) {
    4c34:	52af 018a      	addq.l #1,394(sp)
    4c38:	7209           	moveq #9,d1
    4c3a:	b2af 018a      	cmp.l 394(sp),d1
    4c3e:	6c00 fd74      	bge.w 49b4 <TestZoom4Picture+0xd1e>
  }

  for(int i2=0;i2<13;i2++) {  
    4c42:	42af 0182      	clr.l 386(sp)
    4c46:	6032           	bra.s 4c7a <TestZoom4Picture+0xfe4>
    TestRow( valsupposed, valactual, mask, i2+253);
    4c48:	222f 0182      	move.l 386(sp),d1
    4c4c:	0681 0000 00fd 	addi.l #253,d1
    4c52:	7000           	moveq #0,d0
    4c54:	302f 01c6      	move.w 454(sp),d0
    4c58:	2f01           	move.l d1,-(sp)
    4c5a:	2f00           	move.l d0,-(sp)
    4c5c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c60:	2f2f 0056      	move.l 86(sp),-(sp)
    4c64:	4eba 1e92      	jsr 6af8 <TestRow>(pc)
    4c68:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c6c:	7030           	moveq #48,d0
    4c6e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c72:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4c76:	52af 0182      	addq.l #1,386(sp)
    4c7a:	720c           	moveq #12,d1
    4c7c:	b2af 0182      	cmp.l 386(sp),d1
    4c80:	6cc6           	bge.s 4c48 <TestZoom4Picture+0xfb2>
  }

  TestRow( valsupposed, valactual, mask, 266);
    4c82:	7000           	moveq #0,d0
    4c84:	302f 01c6      	move.w 454(sp),d0
    4c88:	4878 010a      	pea 10a <FreeDisplay+0x2a>
    4c8c:	2f00           	move.l d0,-(sp)
    4c8e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c92:	2f2f 0056      	move.l 86(sp),-(sp)
    4c96:	4eba 1e60      	jsr 6af8 <TestRow>(pc)
    4c9a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4c9e:	7030           	moveq #48,d0
    4ca0:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 267);
    4ca4:	7000           	moveq #0,d0
    4ca6:	302f 01c6      	move.w 454(sp),d0
    4caa:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    4cae:	2f00           	move.l d0,-(sp)
    4cb0:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cb4:	2f2f 0056      	move.l 86(sp),-(sp)
    4cb8:	4eba 1e3e      	jsr 6af8 <TestRow>(pc)
    4cbc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4cc0:	7230           	moveq #48,d1
    4cc2:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4cc6:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 268);
    4cca:	7000           	moveq #0,d0
    4ccc:	302f 01c6      	move.w 454(sp),d0
    4cd0:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    4cd4:	2f00           	move.l d0,-(sp)
    4cd6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cda:	2f2f 0056      	move.l 86(sp),-(sp)
    4cde:	4eba 1e18      	jsr 6af8 <TestRow>(pc)
    4ce2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4ce6:	7030           	moveq #48,d0
    4ce8:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 269);
    4cec:	7000           	moveq #0,d0
    4cee:	302f 01c6      	move.w 454(sp),d0
    4cf2:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4cf6:	2f00           	move.l d0,-(sp)
    4cf8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cfc:	2f2f 0056      	move.l 86(sp),-(sp)
    4d00:	4eba 1df6      	jsr 6af8 <TestRow>(pc)
    4d04:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d08:	7230           	moveq #48,d1
    4d0a:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4d0e:	466f 01c6      	not.w 454(sp)

  tmp = source;
    4d12:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4d18:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4d1e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    4d24:	4878 0001      	pea 1 <_start+0x1>
    4d28:	4878 0005      	pea 5 <_start+0x5>
    4d2c:	2f2f 0056      	move.l 86(sp),-(sp)
    4d30:	2f2f 006a      	move.l 106(sp),-(sp)
    4d34:	4eba cd64      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    4d38:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4d3c:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    4d42:	2c40           	movea.l d0,a6
    4d44:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4d48:	202f 004e      	move.l 78(sp),d0
    4d4c:	5880           	addq.l #4,d0
    4d4e:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom6;
    4d52:	2f7c 0000 b9d0 	move.l #47568,74(sp)
    4d58:	004a 
  mask = 0x0000;
    4d5a:	426f 01c6      	clr.w 454(sp)
 
  for(int i2=0;i2<7;i2++) {  
    4d5e:	42af 017e      	clr.l 382(sp)
    4d62:	602a           	bra.s 4d8e <TestZoom4Picture+0x10f8>
    TestRow( valsupposed, valactual, mask, i2);
    4d64:	7000           	moveq #0,d0
    4d66:	302f 01c6      	move.w 454(sp),d0
    4d6a:	2f2f 017e      	move.l 382(sp),-(sp)
    4d6e:	2f00           	move.l d0,-(sp)
    4d70:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d74:	2f2f 0056      	move.l 86(sp),-(sp)
    4d78:	4eba 1d7e      	jsr 6af8 <TestRow>(pc)
    4d7c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d80:	7230           	moveq #48,d1
    4d82:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4d86:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    4d8a:	52af 017e      	addq.l #1,382(sp)
    4d8e:	7006           	moveq #6,d0
    4d90:	b0af 017e      	cmp.l 382(sp),d0
    4d94:	6cce           	bge.s 4d64 <TestZoom4Picture+0x10ce>
  }

  for(int i=0;i<6;i++) {
    4d96:	42af 017a      	clr.l 378(sp)
    4d9a:	605c           	bra.s 4df8 <TestZoom4Picture+0x1162>
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    4d9c:	202f 017a      	move.l 378(sp),d0
    4da0:	d080           	add.l d0,d0
    4da2:	2200           	move.l d0,d1
    4da4:	5e81           	addq.l #7,d1
    4da6:	7000           	moveq #0,d0
    4da8:	302f 01c6      	move.w 454(sp),d0
    4dac:	2f01           	move.l d1,-(sp)
    4dae:	2f00           	move.l d0,-(sp)
    4db0:	2f2f 01d0      	move.l 464(sp),-(sp)
    4db4:	2f2f 0056      	move.l 86(sp),-(sp)
    4db8:	4eba 1d3e      	jsr 6af8 <TestRow>(pc)
    4dbc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4dc0:	7230           	moveq #48,d1
    4dc2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    4dc6:	202f 017a      	move.l 378(sp),d0
    4dca:	5880           	addq.l #4,d0
    4dcc:	d080           	add.l d0,d0
    4dce:	2200           	move.l d0,d1
    4dd0:	7000           	moveq #0,d0
    4dd2:	302f 01c6      	move.w 454(sp),d0
    4dd6:	2f01           	move.l d1,-(sp)
    4dd8:	2f00           	move.l d0,-(sp)
    4dda:	2f2f 01d0      	move.l 464(sp),-(sp)
    4dde:	2f2f 0056      	move.l 86(sp),-(sp)
    4de2:	4eba 1d14      	jsr 6af8 <TestRow>(pc)
    4de6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4dea:	7030           	moveq #48,d0
    4dec:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4df0:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<6;i++) {
    4df4:	52af 017a      	addq.l #1,378(sp)
    4df8:	7205           	moveq #5,d1
    4dfa:	b2af 017a      	cmp.l 378(sp),d1
    4dfe:	6c9c           	bge.s 4d9c <TestZoom4Picture+0x1106>
  }

  for(int i=0;i<10;i++) {
    4e00:	42af 0176      	clr.l 374(sp)
    4e04:	6000 00ce      	bra.w 4ed4 <TestZoom4Picture+0x123e>
    for(int i2=0;i2<12;i2++) {  
    4e08:	42af 0172      	clr.l 370(sp)
    4e0c:	6040           	bra.s 4e4e <TestZoom4Picture+0x11b8>
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    4e0e:	307c 0013      	movea.w #19,a0
    4e12:	d1ef 0172      	adda.l 370(sp),a0
    4e16:	222f 0176      	move.l 374(sp),d1
    4e1a:	2001           	move.l d1,d0
    4e1c:	d080           	add.l d0,d0
    4e1e:	d081           	add.l d1,d0
    4e20:	e788           	lsl.l #3,d0
    4e22:	2208           	move.l a0,d1
    4e24:	d280           	add.l d0,d1
    4e26:	7000           	moveq #0,d0
    4e28:	302f 01c6      	move.w 454(sp),d0
    4e2c:	2f01           	move.l d1,-(sp)
    4e2e:	2f00           	move.l d0,-(sp)
    4e30:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e34:	2f2f 0056      	move.l 86(sp),-(sp)
    4e38:	4eba 1cbe      	jsr 6af8 <TestRow>(pc)
    4e3c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4e40:	7030           	moveq #48,d0
    4e42:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4e46:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {  
    4e4a:	52af 0172      	addq.l #1,370(sp)
    4e4e:	720b           	moveq #11,d1
    4e50:	b2af 0172      	cmp.l 370(sp),d1
    4e54:	6cb8           	bge.s 4e0e <TestZoom4Picture+0x1178>
    }
    for(int i=0;i<6;i++) {
    4e56:	42af 016e      	clr.l 366(sp)
    4e5a:	606c           	bra.s 4ec8 <TestZoom4Picture+0x1232>
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    4e5c:	222f 016e      	move.l 366(sp),d1
    4e60:	2001           	move.l d1,d0
    4e62:	d080           	add.l d0,d0
    4e64:	d081           	add.l d1,d0
    4e66:	e788           	lsl.l #3,d0
    4e68:	2040           	movea.l d0,a0
    4e6a:	41e8 001f      	lea 31(a0),a0
    4e6e:	7000           	moveq #0,d0
    4e70:	302f 01c6      	move.w 454(sp),d0
    4e74:	2f08           	move.l a0,-(sp)
    4e76:	2f00           	move.l d0,-(sp)
    4e78:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e7c:	2f2f 0056      	move.l 86(sp),-(sp)
    4e80:	4eba 1c76      	jsr 6af8 <TestRow>(pc)
    4e84:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4e88:	7030           	moveq #48,d0
    4e8a:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    4e8e:	222f 016e      	move.l 366(sp),d1
    4e92:	2001           	move.l d1,d0
    4e94:	d080           	add.l d0,d0
    4e96:	d081           	add.l d1,d0
    4e98:	e788           	lsl.l #3,d0
    4e9a:	2040           	movea.l d0,a0
    4e9c:	41e8 0020      	lea 32(a0),a0
    4ea0:	7000           	moveq #0,d0
    4ea2:	302f 01c6      	move.w 454(sp),d0
    4ea6:	2f08           	move.l a0,-(sp)
    4ea8:	2f00           	move.l d0,-(sp)
    4eaa:	2f2f 01d0      	move.l 464(sp),-(sp)
    4eae:	2f2f 0056      	move.l 86(sp),-(sp)
    4eb2:	4eba 1c44      	jsr 6af8 <TestRow>(pc)
    4eb6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4eba:	7230           	moveq #48,d1
    4ebc:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4ec0:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<6;i++) {
    4ec4:	52af 016e      	addq.l #1,366(sp)
    4ec8:	7005           	moveq #5,d0
    4eca:	b0af 016e      	cmp.l 366(sp),d0
    4ece:	6c8c           	bge.s 4e5c <TestZoom4Picture+0x11c6>
  for(int i=0;i<10;i++) {
    4ed0:	52af 0176      	addq.l #1,374(sp)
    4ed4:	7209           	moveq #9,d1
    4ed6:	b2af 0176      	cmp.l 374(sp),d1
    4eda:	6c00 ff2c      	bge.w 4e08 <TestZoom4Picture+0x1172>
    }
  }

  for(int i2=0;i2<11;i2++) {  
    4ede:	42af 016a      	clr.l 362(sp)
    4ee2:	6032           	bra.s 4f16 <TestZoom4Picture+0x1280>
    TestRow( valsupposed, valactual, mask, 258+i2);
    4ee4:	222f 016a      	move.l 362(sp),d1
    4ee8:	0681 0000 0102 	addi.l #258,d1
    4eee:	7000           	moveq #0,d0
    4ef0:	302f 01c6      	move.w 454(sp),d0
    4ef4:	2f01           	move.l d1,-(sp)
    4ef6:	2f00           	move.l d0,-(sp)
    4ef8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4efc:	2f2f 0056      	move.l 86(sp),-(sp)
    4f00:	4eba 1bf6      	jsr 6af8 <TestRow>(pc)
    4f04:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4f08:	7030           	moveq #48,d0
    4f0a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4f0e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {  
    4f12:	52af 016a      	addq.l #1,362(sp)
    4f16:	720a           	moveq #10,d1
    4f18:	b2af 016a      	cmp.l 362(sp),d1
    4f1c:	6cc6           	bge.s 4ee4 <TestZoom4Picture+0x124e>
  }

  tmp = source;
    4f1e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4f24:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4f2a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    4f30:	4878 0001      	pea 1 <_start+0x1>
    4f34:	4878 0006      	pea 6 <_start+0x6>
    4f38:	2f2f 0056      	move.l 86(sp),-(sp)
    4f3c:	2f2f 006a      	move.l 106(sp),-(sp)
    4f40:	4eba cb58      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    4f44:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4f48:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    4f4e:	2c40           	movea.l d0,a6
    4f50:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4f54:	202f 004e      	move.l 78(sp),d0
    4f58:	5880           	addq.l #4,d0
    4f5a:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom7;
    4f5e:	2f7c 0000 b9fc 	move.l #47612,74(sp)
    4f64:	004a 
  mask = 0x0000;
    4f66:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    4f6a:	7000           	moveq #0,d0
    4f6c:	302f 01c6      	move.w 454(sp),d0
    4f70:	42a7           	clr.l -(sp)
    4f72:	2f00           	move.l d0,-(sp)
    4f74:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f78:	2f2f 0056      	move.l 86(sp),-(sp)
    4f7c:	4eba 1b7a      	jsr 6af8 <TestRow>(pc)
    4f80:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4f84:	7230           	moveq #48,d1
    4f86:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4f8a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    4f8e:	42af 0166      	clr.l 358(sp)
    4f92:	605c           	bra.s 4ff0 <TestZoom4Picture+0x135a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    4f94:	202f 0166      	move.l 358(sp),d0
    4f98:	d080           	add.l d0,d0
    4f9a:	2200           	move.l d0,d1
    4f9c:	5281           	addq.l #1,d1
    4f9e:	7000           	moveq #0,d0
    4fa0:	302f 01c6      	move.w 454(sp),d0
    4fa4:	2f01           	move.l d1,-(sp)
    4fa6:	2f00           	move.l d0,-(sp)
    4fa8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4fac:	2f2f 0056      	move.l 86(sp),-(sp)
    4fb0:	4eba 1b46      	jsr 6af8 <TestRow>(pc)
    4fb4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4fb8:	7030           	moveq #48,d0
    4fba:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    4fbe:	202f 0166      	move.l 358(sp),d0
    4fc2:	5280           	addq.l #1,d0
    4fc4:	d080           	add.l d0,d0
    4fc6:	2200           	move.l d0,d1
    4fc8:	7000           	moveq #0,d0
    4fca:	302f 01c6      	move.w 454(sp),d0
    4fce:	2f01           	move.l d1,-(sp)
    4fd0:	2f00           	move.l d0,-(sp)
    4fd2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4fd6:	2f2f 0056      	move.l 86(sp),-(sp)
    4fda:	4eba 1b1c      	jsr 6af8 <TestRow>(pc)
    4fde:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4fe2:	7230           	moveq #48,d1
    4fe4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4fe8:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    4fec:	52af 0166      	addq.l #1,358(sp)
    4ff0:	7006           	moveq #6,d0
    4ff2:	b0af 0166      	cmp.l 358(sp),d0
    4ff6:	6c9c           	bge.s 4f94 <TestZoom4Picture+0x12fe>
  }

  for(int i=0;i<10;i++) {
    4ff8:	42af 0162      	clr.l 354(sp)
    4ffc:	6000 00d4      	bra.w 50d2 <TestZoom4Picture+0x143c>
    for(int i2=0;i2<11;i2++) {  
    5000:	42af 015e      	clr.l 350(sp)
    5004:	6042           	bra.s 5048 <TestZoom4Picture+0x13b2>
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    5006:	307c 000f      	movea.w #15,a0
    500a:	d1ef 015e      	adda.l 350(sp),a0
    500e:	222f 0162      	move.l 354(sp),d1
    5012:	2001           	move.l d1,d0
    5014:	d080           	add.l d0,d0
    5016:	d081           	add.l d1,d0
    5018:	e788           	lsl.l #3,d0
    501a:	d081           	add.l d1,d0
    501c:	2208           	move.l a0,d1
    501e:	d280           	add.l d0,d1
    5020:	7000           	moveq #0,d0
    5022:	302f 01c6      	move.w 454(sp),d0
    5026:	2f01           	move.l d1,-(sp)
    5028:	2f00           	move.l d0,-(sp)
    502a:	2f2f 01d0      	move.l 464(sp),-(sp)
    502e:	2f2f 0056      	move.l 86(sp),-(sp)
    5032:	4eba 1ac4      	jsr 6af8 <TestRow>(pc)
    5036:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    503a:	7230           	moveq #48,d1
    503c:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5040:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {  
    5044:	52af 015e      	addq.l #1,350(sp)
    5048:	700a           	moveq #10,d0
    504a:	b0af 015e      	cmp.l 350(sp),d0
    504e:	6cb6           	bge.s 5006 <TestZoom4Picture+0x1370>
    }
    for(int i=0;i<7;i++) {
    5050:	42af 015a      	clr.l 346(sp)
    5054:	6070           	bra.s 50c6 <TestZoom4Picture+0x1430>
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    5056:	222f 015a      	move.l 346(sp),d1
    505a:	2001           	move.l d1,d0
    505c:	d080           	add.l d0,d0
    505e:	d081           	add.l d1,d0
    5060:	e788           	lsl.l #3,d0
    5062:	2040           	movea.l d0,a0
    5064:	d1c1           	adda.l d1,a0
    5066:	41e8 001a      	lea 26(a0),a0
    506a:	7000           	moveq #0,d0
    506c:	302f 01c6      	move.w 454(sp),d0
    5070:	2f08           	move.l a0,-(sp)
    5072:	2f00           	move.l d0,-(sp)
    5074:	2f2f 01d0      	move.l 464(sp),-(sp)
    5078:	2f2f 0056      	move.l 86(sp),-(sp)
    507c:	4eba 1a7a      	jsr 6af8 <TestRow>(pc)
    5080:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5084:	7230           	moveq #48,d1
    5086:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    508a:	222f 015a      	move.l 346(sp),d1
    508e:	2001           	move.l d1,d0
    5090:	d080           	add.l d0,d0
    5092:	d081           	add.l d1,d0
    5094:	e788           	lsl.l #3,d0
    5096:	2040           	movea.l d0,a0
    5098:	d1c1           	adda.l d1,a0
    509a:	41e8 001a      	lea 26(a0),a0
    509e:	7000           	moveq #0,d0
    50a0:	302f 01c6      	move.w 454(sp),d0
    50a4:	2f08           	move.l a0,-(sp)
    50a6:	2f00           	move.l d0,-(sp)
    50a8:	2f2f 01d0      	move.l 464(sp),-(sp)
    50ac:	2f2f 0056      	move.l 86(sp),-(sp)
    50b0:	4eba 1a46      	jsr 6af8 <TestRow>(pc)
    50b4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    50b8:	7030           	moveq #48,d0
    50ba:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    50be:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<7;i++) {
    50c2:	52af 015a      	addq.l #1,346(sp)
    50c6:	7206           	moveq #6,d1
    50c8:	b2af 015a      	cmp.l 346(sp),d1
    50cc:	6c88           	bge.s 5056 <TestZoom4Picture+0x13c0>
  for(int i=0;i<10;i++) {
    50ce:	52af 0162      	addq.l #1,354(sp)
    50d2:	7009           	moveq #9,d0
    50d4:	b0af 0162      	cmp.l 354(sp),d0
    50d8:	6c00 ff26      	bge.w 5000 <TestZoom4Picture+0x136a>
    }
  }

  for(int i2=0;i2<5;i2++) {  
    50dc:	42af 0156      	clr.l 342(sp)
    50e0:	6032           	bra.s 5114 <TestZoom4Picture+0x147e>
    TestRow( valsupposed, valactual, mask, 256+i2);
    50e2:	222f 0156      	move.l 342(sp),d1
    50e6:	0681 0000 0100 	addi.l #256,d1
    50ec:	7000           	moveq #0,d0
    50ee:	302f 01c6      	move.w 454(sp),d0
    50f2:	2f01           	move.l d1,-(sp)
    50f4:	2f00           	move.l d0,-(sp)
    50f6:	2f2f 01d0      	move.l 464(sp),-(sp)
    50fa:	2f2f 0056      	move.l 86(sp),-(sp)
    50fe:	4eba 19f8      	jsr 6af8 <TestRow>(pc)
    5102:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5106:	7230           	moveq #48,d1
    5108:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    510c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5110:	52af 0156      	addq.l #1,342(sp)
    5114:	7004           	moveq #4,d0
    5116:	b0af 0156      	cmp.l 342(sp),d0
    511a:	6cc6           	bge.s 50e2 <TestZoom4Picture+0x144c>
  }

  tmp = source;
    511c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5122:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5128:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    512e:	4878 0001      	pea 1 <_start+0x1>
    5132:	4878 0007      	pea 7 <_start+0x7>
    5136:	2f2f 0056      	move.l 86(sp),-(sp)
    513a:	2f2f 006a      	move.l 106(sp),-(sp)
    513e:	4eba c95a      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    5142:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5146:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    514c:	2c40           	movea.l d0,a6
    514e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5152:	222f 004e      	move.l 78(sp),d1
    5156:	5881           	addq.l #4,d1
    5158:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom8;
    515c:	2f7c 0000 ba28 	move.l #47656,74(sp)
    5162:	004a 
  mask = 0xffff;
    5164:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    516a:	7000           	moveq #0,d0
    516c:	302f 01c6      	move.w 454(sp),d0
    5170:	42a7           	clr.l -(sp)
    5172:	2f00           	move.l d0,-(sp)
    5174:	2f2f 01d0      	move.l 464(sp),-(sp)
    5178:	2f2f 0056      	move.l 86(sp),-(sp)
    517c:	4eba 197a      	jsr 6af8 <TestRow>(pc)
    5180:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5184:	7030           	moveq #48,d0
    5186:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    518a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    518e:	42af 0152      	clr.l 338(sp)
    5192:	605c           	bra.s 51f0 <TestZoom4Picture+0x155a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    5194:	202f 0152      	move.l 338(sp),d0
    5198:	d080           	add.l d0,d0
    519a:	2200           	move.l d0,d1
    519c:	5281           	addq.l #1,d1
    519e:	7000           	moveq #0,d0
    51a0:	302f 01c6      	move.w 454(sp),d0
    51a4:	2f01           	move.l d1,-(sp)
    51a6:	2f00           	move.l d0,-(sp)
    51a8:	2f2f 01d0      	move.l 464(sp),-(sp)
    51ac:	2f2f 0056      	move.l 86(sp),-(sp)
    51b0:	4eba 1946      	jsr 6af8 <TestRow>(pc)
    51b4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    51b8:	7230           	moveq #48,d1
    51ba:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    51be:	202f 0152      	move.l 338(sp),d0
    51c2:	5280           	addq.l #1,d0
    51c4:	d080           	add.l d0,d0
    51c6:	2200           	move.l d0,d1
    51c8:	7000           	moveq #0,d0
    51ca:	302f 01c6      	move.w 454(sp),d0
    51ce:	2f01           	move.l d1,-(sp)
    51d0:	2f00           	move.l d0,-(sp)
    51d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    51d6:	2f2f 0056      	move.l 86(sp),-(sp)
    51da:	4eba 191c      	jsr 6af8 <TestRow>(pc)
    51de:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    51e2:	7030           	moveq #48,d0
    51e4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    51e8:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    51ec:	52af 0152      	addq.l #1,338(sp)
    51f0:	7204           	moveq #4,d1
    51f2:	b2af 0152      	cmp.l 338(sp),d1
    51f6:	6c9c           	bge.s 5194 <TestZoom4Picture+0x14fe>
  }

  for(int i=0;i<9;i++) {
    51f8:	42af 014e      	clr.l 334(sp)
    51fc:	6000 00f0      	bra.w 52ee <TestZoom4Picture+0x1658>
    for(int i2=0;i2<10;i2++) {  
    5200:	42af 014a      	clr.l 330(sp)
    5204:	6046           	bra.s 524c <TestZoom4Picture+0x15b6>
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    5206:	307c 000b      	movea.w #11,a0
    520a:	d1ef 014a      	adda.l 330(sp),a0
    520e:	222f 014e      	move.l 334(sp),d1
    5212:	2001           	move.l d1,d0
    5214:	d080           	add.l d0,d0
    5216:	d081           	add.l d1,d0
    5218:	d080           	add.l d0,d0
    521a:	d080           	add.l d0,d0
    521c:	d081           	add.l d1,d0
    521e:	d080           	add.l d0,d0
    5220:	2208           	move.l a0,d1
    5222:	d280           	add.l d0,d1
    5224:	7000           	moveq #0,d0
    5226:	302f 01c6      	move.w 454(sp),d0
    522a:	2f01           	move.l d1,-(sp)
    522c:	2f00           	move.l d0,-(sp)
    522e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5232:	2f2f 0056      	move.l 86(sp),-(sp)
    5236:	4eba 18c0      	jsr 6af8 <TestRow>(pc)
    523a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    523e:	7030           	moveq #48,d0
    5240:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5244:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {  
    5248:	52af 014a      	addq.l #1,330(sp)
    524c:	7209           	moveq #9,d1
    524e:	b2af 014a      	cmp.l 330(sp),d1
    5252:	6cb2           	bge.s 5206 <TestZoom4Picture+0x1570>
    }
    for(int i2=0;i2<8;i2++) {
    5254:	42af 0146      	clr.l 326(sp)
    5258:	6000 0086      	bra.w 52e0 <TestZoom4Picture+0x164a>
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    525c:	222f 014e      	move.l 334(sp),d1
    5260:	2001           	move.l d1,d0
    5262:	d080           	add.l d0,d0
    5264:	d081           	add.l d1,d0
    5266:	d080           	add.l d0,d0
    5268:	d080           	add.l d0,d0
    526a:	d081           	add.l d1,d0
    526c:	d080           	add.l d0,d0
    526e:	2040           	movea.l d0,a0
    5270:	41e8 0015      	lea 21(a0),a0
    5274:	2208           	move.l a0,d1
    5276:	d2af 0146      	add.l 326(sp),d1
    527a:	7000           	moveq #0,d0
    527c:	302f 01c6      	move.w 454(sp),d0
    5280:	2f01           	move.l d1,-(sp)
    5282:	2f00           	move.l d0,-(sp)
    5284:	2f2f 01d0      	move.l 464(sp),-(sp)
    5288:	2f2f 0056      	move.l 86(sp),-(sp)
    528c:	4eba 186a      	jsr 6af8 <TestRow>(pc)
    5290:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5294:	7030           	moveq #48,d0
    5296:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    529a:	222f 014e      	move.l 334(sp),d1
    529e:	2001           	move.l d1,d0
    52a0:	d080           	add.l d0,d0
    52a2:	d081           	add.l d1,d0
    52a4:	d080           	add.l d0,d0
    52a6:	d080           	add.l d0,d0
    52a8:	d081           	add.l d1,d0
    52aa:	d080           	add.l d0,d0
    52ac:	2040           	movea.l d0,a0
    52ae:	41e8 0015      	lea 21(a0),a0
    52b2:	2208           	move.l a0,d1
    52b4:	d2af 0146      	add.l 326(sp),d1
    52b8:	7000           	moveq #0,d0
    52ba:	302f 01c6      	move.w 454(sp),d0
    52be:	2f01           	move.l d1,-(sp)
    52c0:	2f00           	move.l d0,-(sp)
    52c2:	2f2f 01d0      	move.l 464(sp),-(sp)
    52c6:	2f2f 0056      	move.l 86(sp),-(sp)
    52ca:	4eba 182c      	jsr 6af8 <TestRow>(pc)
    52ce:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    52d2:	7230           	moveq #48,d1
    52d4:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    52d8:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {
    52dc:	52af 0146      	addq.l #1,326(sp)
    52e0:	7007           	moveq #7,d0
    52e2:	b0af 0146      	cmp.l 326(sp),d0
    52e6:	6c00 ff74      	bge.w 525c <TestZoom4Picture+0x15c6>
  for(int i=0;i<9;i++) {
    52ea:	52af 014e      	addq.l #1,334(sp)
    52ee:	7208           	moveq #8,d1
    52f0:	b2af 014e      	cmp.l 334(sp),d1
    52f4:	6c00 ff0a      	bge.w 5200 <TestZoom4Picture+0x156a>
    }
  }

  for(int i2=0;i2<10;i2++) {  
    52f8:	42af 0142      	clr.l 322(sp)
    52fc:	6032           	bra.s 5330 <TestZoom4Picture+0x169a>
    TestRow( valsupposed, valactual, mask, 245+i2);
    52fe:	222f 0142      	move.l 322(sp),d1
    5302:	0681 0000 00f5 	addi.l #245,d1
    5308:	7000           	moveq #0,d0
    530a:	302f 01c6      	move.w 454(sp),d0
    530e:	2f01           	move.l d1,-(sp)
    5310:	2f00           	move.l d0,-(sp)
    5312:	2f2f 01d0      	move.l 464(sp),-(sp)
    5316:	2f2f 0056      	move.l 86(sp),-(sp)
    531a:	4eba 17dc      	jsr 6af8 <TestRow>(pc)
    531e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5322:	7030           	moveq #48,d0
    5324:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5328:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {  
    532c:	52af 0142      	addq.l #1,322(sp)
    5330:	7209           	moveq #9,d1
    5332:	b2af 0142      	cmp.l 322(sp),d1
    5336:	6cc6           	bge.s 52fe <TestZoom4Picture+0x1668>
  }
  for(int i=0;i<7;i++) {
    5338:	42af 013e      	clr.l 318(sp)
    533c:	6064           	bra.s 53a2 <TestZoom4Picture+0x170c>
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    533e:	202f 013e      	move.l 318(sp),d0
    5342:	d080           	add.l d0,d0
    5344:	2200           	move.l d0,d1
    5346:	0681 0000 00ff 	addi.l #255,d1
    534c:	7000           	moveq #0,d0
    534e:	302f 01c6      	move.w 454(sp),d0
    5352:	2f01           	move.l d1,-(sp)
    5354:	2f00           	move.l d0,-(sp)
    5356:	2f2f 01d0      	move.l 464(sp),-(sp)
    535a:	2f2f 0056      	move.l 86(sp),-(sp)
    535e:	4eba 1798      	jsr 6af8 <TestRow>(pc)
    5362:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5366:	7030           	moveq #48,d0
    5368:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    536c:	202f 013e      	move.l 318(sp),d0
    5370:	0680 0000 0080 	addi.l #128,d0
    5376:	d080           	add.l d0,d0
    5378:	2200           	move.l d0,d1
    537a:	7000           	moveq #0,d0
    537c:	302f 01c6      	move.w 454(sp),d0
    5380:	2f01           	move.l d1,-(sp)
    5382:	2f00           	move.l d0,-(sp)
    5384:	2f2f 01d0      	move.l 464(sp),-(sp)
    5388:	2f2f 0056      	move.l 86(sp),-(sp)
    538c:	4eba 176a      	jsr 6af8 <TestRow>(pc)
    5390:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5394:	7230           	moveq #48,d1
    5396:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    539a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    539e:	52af 013e      	addq.l #1,318(sp)
    53a2:	7006           	moveq #6,d0
    53a4:	b0af 013e      	cmp.l 318(sp),d0
    53a8:	6c94           	bge.s 533e <TestZoom4Picture+0x16a8>
  }
  TestRow( valsupposed, valactual, mask, 269);
    53aa:	7000           	moveq #0,d0
    53ac:	302f 01c6      	move.w 454(sp),d0
    53b0:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    53b4:	2f00           	move.l d0,-(sp)
    53b6:	2f2f 01d0      	move.l 464(sp),-(sp)
    53ba:	2f2f 0056      	move.l 86(sp),-(sp)
    53be:	4eba 1738      	jsr 6af8 <TestRow>(pc)
    53c2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    53c6:	7230           	moveq #48,d1
    53c8:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    53cc:	466f 01c6      	not.w 454(sp)
 
  tmp = source;
    53d0:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    53d6:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    53dc:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    53e2:	4878 0001      	pea 1 <_start+0x1>
    53e6:	4878 0008      	pea 8 <_start+0x8>
    53ea:	2f2f 0056      	move.l 86(sp),-(sp)
    53ee:	2f2f 006a      	move.l 106(sp),-(sp)
    53f2:	4eba c6a6      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    53f6:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    53fa:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    5400:	2c40           	movea.l d0,a6
    5402:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5406:	202f 004e      	move.l 78(sp),d0
    540a:	5880           	addq.l #4,d0
    540c:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom9;
    5410:	2f7c 0000 ba54 	move.l #47700,74(sp)
    5416:	004a 
  mask = 0x0000;
    5418:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    541c:	7000           	moveq #0,d0
    541e:	302f 01c6      	move.w 454(sp),d0
    5422:	42a7           	clr.l -(sp)
    5424:	2f00           	move.l d0,-(sp)
    5426:	2f2f 01d0      	move.l 464(sp),-(sp)
    542a:	2f2f 0056      	move.l 86(sp),-(sp)
    542e:	4eba 16c8      	jsr 6af8 <TestRow>(pc)
    5432:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5436:	7230           	moveq #48,d1
    5438:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    543c:	466f 01c6      	not.w 454(sp)
  
  for(int i=0;i<3;i++) {
    5440:	42af 013a      	clr.l 314(sp)
    5444:	605c           	bra.s 54a2 <TestZoom4Picture+0x180c>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    5446:	202f 013a      	move.l 314(sp),d0
    544a:	d080           	add.l d0,d0
    544c:	2200           	move.l d0,d1
    544e:	5281           	addq.l #1,d1
    5450:	7000           	moveq #0,d0
    5452:	302f 01c6      	move.w 454(sp),d0
    5456:	2f01           	move.l d1,-(sp)
    5458:	2f00           	move.l d0,-(sp)
    545a:	2f2f 01d0      	move.l 464(sp),-(sp)
    545e:	2f2f 0056      	move.l 86(sp),-(sp)
    5462:	4eba 1694      	jsr 6af8 <TestRow>(pc)
    5466:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    546a:	7030           	moveq #48,d0
    546c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    5470:	202f 013a      	move.l 314(sp),d0
    5474:	5280           	addq.l #1,d0
    5476:	d080           	add.l d0,d0
    5478:	2200           	move.l d0,d1
    547a:	7000           	moveq #0,d0
    547c:	302f 01c6      	move.w 454(sp),d0
    5480:	2f01           	move.l d1,-(sp)
    5482:	2f00           	move.l d0,-(sp)
    5484:	2f2f 01d0      	move.l 464(sp),-(sp)
    5488:	2f2f 0056      	move.l 86(sp),-(sp)
    548c:	4eba 166a      	jsr 6af8 <TestRow>(pc)
    5490:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5494:	7230           	moveq #48,d1
    5496:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    549a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    549e:	52af 013a      	addq.l #1,314(sp)
    54a2:	7002           	moveq #2,d0
    54a4:	b0af 013a      	cmp.l 314(sp),d0
    54a8:	6c9c           	bge.s 5446 <TestZoom4Picture+0x17b0>
  }

  for(int i=0;i<9;i++) {
    54aa:	42af 0136      	clr.l 310(sp)
    54ae:	6000 00ea      	bra.w 559a <TestZoom4Picture+0x1904>
    for(int i2=0;i2<9;i2++) {  
    54b2:	42af 0132      	clr.l 306(sp)
    54b6:	6044           	bra.s 54fc <TestZoom4Picture+0x1866>
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    54b8:	307c 000b      	movea.w #11,a0
    54bc:	d1ef 0132      	adda.l 306(sp),a0
    54c0:	222f 0136      	move.l 310(sp),d1
    54c4:	2001           	move.l d1,d0
    54c6:	d080           	add.l d0,d0
    54c8:	d081           	add.l d1,d0
    54ca:	2200           	move.l d0,d1
    54cc:	e789           	lsl.l #3,d1
    54ce:	d081           	add.l d1,d0
    54d0:	2208           	move.l a0,d1
    54d2:	d280           	add.l d0,d1
    54d4:	7000           	moveq #0,d0
    54d6:	302f 01c6      	move.w 454(sp),d0
    54da:	2f01           	move.l d1,-(sp)
    54dc:	2f00           	move.l d0,-(sp)
    54de:	2f2f 01d0      	move.l 464(sp),-(sp)
    54e2:	2f2f 0056      	move.l 86(sp),-(sp)
    54e6:	4eba 1610      	jsr 6af8 <TestRow>(pc)
    54ea:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    54ee:	7230           	moveq #48,d1
    54f0:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    54f4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {  
    54f8:	52af 0132      	addq.l #1,306(sp)
    54fc:	7008           	moveq #8,d0
    54fe:	b0af 0132      	cmp.l 306(sp),d0
    5502:	6cb4           	bge.s 54b8 <TestZoom4Picture+0x1822>
    }
    
    for(int i2=0;i2<9;i2++) {
    5504:	42af 012e      	clr.l 302(sp)
    5508:	6000 0082      	bra.w 558c <TestZoom4Picture+0x18f6>
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    550c:	222f 0136      	move.l 310(sp),d1
    5510:	2001           	move.l d1,d0
    5512:	d080           	add.l d0,d0
    5514:	d081           	add.l d1,d0
    5516:	2200           	move.l d0,d1
    5518:	e789           	lsl.l #3,d1
    551a:	2040           	movea.l d0,a0
    551c:	d1c1           	adda.l d1,a0
    551e:	41e8 0014      	lea 20(a0),a0
    5522:	2208           	move.l a0,d1
    5524:	d2af 012e      	add.l 302(sp),d1
    5528:	7000           	moveq #0,d0
    552a:	302f 01c6      	move.w 454(sp),d0
    552e:	2f01           	move.l d1,-(sp)
    5530:	2f00           	move.l d0,-(sp)
    5532:	2f2f 01d0      	move.l 464(sp),-(sp)
    5536:	2f2f 0056      	move.l 86(sp),-(sp)
    553a:	4eba 15bc      	jsr 6af8 <TestRow>(pc)
    553e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5542:	7230           	moveq #48,d1
    5544:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    5548:	222f 0136      	move.l 310(sp),d1
    554c:	2001           	move.l d1,d0
    554e:	d080           	add.l d0,d0
    5550:	d081           	add.l d1,d0
    5552:	2200           	move.l d0,d1
    5554:	e789           	lsl.l #3,d1
    5556:	2040           	movea.l d0,a0
    5558:	d1c1           	adda.l d1,a0
    555a:	41e8 0015      	lea 21(a0),a0
    555e:	2208           	move.l a0,d1
    5560:	d2af 012e      	add.l 302(sp),d1
    5564:	7000           	moveq #0,d0
    5566:	302f 01c6      	move.w 454(sp),d0
    556a:	2f01           	move.l d1,-(sp)
    556c:	2f00           	move.l d0,-(sp)
    556e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5572:	2f2f 0056      	move.l 86(sp),-(sp)
    5576:	4eba 1580      	jsr 6af8 <TestRow>(pc)
    557a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    557e:	7030           	moveq #48,d0
    5580:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5584:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {
    5588:	52af 012e      	addq.l #1,302(sp)
    558c:	7208           	moveq #8,d1
    558e:	b2af 012e      	cmp.l 302(sp),d1
    5592:	6c00 ff78      	bge.w 550c <TestZoom4Picture+0x1876>
  for(int i=0;i<9;i++) {
    5596:	52af 0136      	addq.l #1,310(sp)
    559a:	7008           	moveq #8,d0
    559c:	b0af 0136      	cmp.l 310(sp),d0
    55a0:	6c00 ff10      	bge.w 54b2 <TestZoom4Picture+0x181c>
    }
  }

  for(int i2=0;i2<9;i2++) {  
    55a4:	42af 012a      	clr.l 298(sp)
    55a8:	6032           	bra.s 55dc <TestZoom4Picture+0x1946>
    TestRow( valsupposed, valactual, mask, 245+i2);
    55aa:	222f 012a      	move.l 298(sp),d1
    55ae:	0681 0000 00f5 	addi.l #245,d1
    55b4:	7000           	moveq #0,d0
    55b6:	302f 01c6      	move.w 454(sp),d0
    55ba:	2f01           	move.l d1,-(sp)
    55bc:	2f00           	move.l d0,-(sp)
    55be:	2f2f 01d0      	move.l 464(sp),-(sp)
    55c2:	2f2f 0056      	move.l 86(sp),-(sp)
    55c6:	4eba 1530      	jsr 6af8 <TestRow>(pc)
    55ca:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    55ce:	7230           	moveq #48,d1
    55d0:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    55d4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {  
    55d8:	52af 012a      	addq.l #1,298(sp)
    55dc:	7008           	moveq #8,d0
    55de:	b0af 012a      	cmp.l 298(sp),d0
    55e2:	6cc6           	bge.s 55aa <TestZoom4Picture+0x1914>
  }
  for(int i=0;i<5;i++) {
    55e4:	42af 0126      	clr.l 294(sp)
    55e8:	6064           	bra.s 564e <TestZoom4Picture+0x19b8>
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    55ea:	202f 0126      	move.l 294(sp),d0
    55ee:	d080           	add.l d0,d0
    55f0:	2200           	move.l d0,d1
    55f2:	0681 0000 0103 	addi.l #259,d1
    55f8:	7000           	moveq #0,d0
    55fa:	302f 01c6      	move.w 454(sp),d0
    55fe:	2f01           	move.l d1,-(sp)
    5600:	2f00           	move.l d0,-(sp)
    5602:	2f2f 01d0      	move.l 464(sp),-(sp)
    5606:	2f2f 0056      	move.l 86(sp),-(sp)
    560a:	4eba 14ec      	jsr 6af8 <TestRow>(pc)
    560e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5612:	7230           	moveq #48,d1
    5614:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    5618:	202f 0126      	move.l 294(sp),d0
    561c:	0680 0000 0082 	addi.l #130,d0
    5622:	d080           	add.l d0,d0
    5624:	2200           	move.l d0,d1
    5626:	7000           	moveq #0,d0
    5628:	302f 01c6      	move.w 454(sp),d0
    562c:	2f01           	move.l d1,-(sp)
    562e:	2f00           	move.l d0,-(sp)
    5630:	2f2f 01d0      	move.l 464(sp),-(sp)
    5634:	2f2f 0056      	move.l 86(sp),-(sp)
    5638:	4eba 14be      	jsr 6af8 <TestRow>(pc)
    563c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5640:	7030           	moveq #48,d0
    5642:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5646:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    564a:	52af 0126      	addq.l #1,294(sp)
    564e:	7204           	moveq #4,d1
    5650:	b2af 0126      	cmp.l 294(sp),d1
    5654:	6c94           	bge.s 55ea <TestZoom4Picture+0x1954>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5656:	7000           	moveq #0,d0
    5658:	302f 01c6      	move.w 454(sp),d0
    565c:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5660:	2f00           	move.l d0,-(sp)
    5662:	2f2f 01d0      	move.l 464(sp),-(sp)
    5666:	2f2f 0056      	move.l 86(sp),-(sp)
    566a:	4eba 148c      	jsr 6af8 <TestRow>(pc)
    566e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5672:	7030           	moveq #48,d0
    5674:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5678:	466f 01c6      	not.w 454(sp)

  tmp = source;
    567c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5682:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5688:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    568e:	4878 0001      	pea 1 <_start+0x1>
    5692:	4878 0009      	pea 9 <_start+0x9>
    5696:	2f2f 0056      	move.l 86(sp),-(sp)
    569a:	2f2f 006a      	move.l 106(sp),-(sp)
    569e:	4eba c3fa      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    56a2:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    56a6:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    56ac:	2c40           	movea.l d0,a6
    56ae:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    56b2:	222f 004e      	move.l 78(sp),d1
    56b6:	5881           	addq.l #4,d1
    56b8:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom10;
    56bc:	2f7c 0000 ba80 	move.l #47744,74(sp)
    56c2:	004a 

  mask = 0xffff;
    56c4:	3f7c ffff 01c6 	move.w #-1,454(sp)
  TestRow( valsupposed, valactual, mask, 0);
    56ca:	7000           	moveq #0,d0
    56cc:	302f 01c6      	move.w 454(sp),d0
    56d0:	42a7           	clr.l -(sp)
    56d2:	2f00           	move.l d0,-(sp)
    56d4:	2f2f 01d0      	move.l 464(sp),-(sp)
    56d8:	2f2f 0056      	move.l 86(sp),-(sp)
    56dc:	4eba 141a      	jsr 6af8 <TestRow>(pc)
    56e0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    56e4:	7030           	moveq #48,d0
    56e6:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    56ea:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 1);   
    56ee:	7000           	moveq #0,d0
    56f0:	302f 01c6      	move.w 454(sp),d0
    56f4:	4878 0001      	pea 1 <_start+0x1>
    56f8:	2f00           	move.l d0,-(sp)
    56fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    56fe:	2f2f 0056      	move.l 86(sp),-(sp)
    5702:	4eba 13f4      	jsr 6af8 <TestRow>(pc)
    5706:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    570a:	7230           	moveq #48,d1
    570c:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 2);
    5710:	7000           	moveq #0,d0
    5712:	302f 01c6      	move.w 454(sp),d0
    5716:	4878 0002      	pea 2 <_start+0x2>
    571a:	2f00           	move.l d0,-(sp)
    571c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5720:	2f2f 0056      	move.l 86(sp),-(sp)
    5724:	4eba 13d2      	jsr 6af8 <TestRow>(pc)
    5728:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    572c:	7030           	moveq #48,d0
    572e:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5732:	466f 01c6      	not.w 454(sp)

  for(int i=0;i<9;i++) {
    5736:	42af 0122      	clr.l 290(sp)
    573a:	6000 00e0      	bra.w 581c <TestZoom4Picture+0x1b86>
    for(int i2=0;i2<8;i2++) {  
    573e:	42af 011e      	clr.l 286(sp)
    5742:	6040           	bra.s 5784 <TestZoom4Picture+0x1aee>
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    5744:	206f 011e      	movea.l 286(sp),a0
    5748:	5688           	addq.l #3,a0
    574a:	222f 0122      	move.l 290(sp),d1
    574e:	2001           	move.l d1,d0
    5750:	e788           	lsl.l #3,d0
    5752:	9081           	sub.l d1,d0
    5754:	d080           	add.l d0,d0
    5756:	d080           	add.l d0,d0
    5758:	2208           	move.l a0,d1
    575a:	d280           	add.l d0,d1
    575c:	7000           	moveq #0,d0
    575e:	302f 01c6      	move.w 454(sp),d0
    5762:	2f01           	move.l d1,-(sp)
    5764:	2f00           	move.l d0,-(sp)
    5766:	2f2f 01d0      	move.l 464(sp),-(sp)
    576a:	2f2f 0056      	move.l 86(sp),-(sp)
    576e:	4eba 1388      	jsr 6af8 <TestRow>(pc)
    5772:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5776:	7230           	moveq #48,d1
    5778:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    577c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {  
    5780:	52af 011e      	addq.l #1,286(sp)
    5784:	7007           	moveq #7,d0
    5786:	b0af 011e      	cmp.l 286(sp),d0
    578a:	6cb8           	bge.s 5744 <TestZoom4Picture+0x1aae>
    }
    
    for(int i2=0;i2<10;i2++) {
    578c:	42af 011a      	clr.l 282(sp)
    5790:	607c           	bra.s 580e <TestZoom4Picture+0x1b78>
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    5792:	222f 0122      	move.l 290(sp),d1
    5796:	2001           	move.l d1,d0
    5798:	e788           	lsl.l #3,d0
    579a:	9081           	sub.l d1,d0
    579c:	d080           	add.l d0,d0
    579e:	d080           	add.l d0,d0
    57a0:	2040           	movea.l d0,a0
    57a2:	41e8 000b      	lea 11(a0),a0
    57a6:	2208           	move.l a0,d1
    57a8:	d2af 011a      	add.l 282(sp),d1
    57ac:	7000           	moveq #0,d0
    57ae:	302f 01c6      	move.w 454(sp),d0
    57b2:	2f01           	move.l d1,-(sp)
    57b4:	2f00           	move.l d0,-(sp)
    57b6:	2f2f 01d0      	move.l 464(sp),-(sp)
    57ba:	2f2f 0056      	move.l 86(sp),-(sp)
    57be:	4eba 1338      	jsr 6af8 <TestRow>(pc)
    57c2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    57c6:	7230           	moveq #48,d1
    57c8:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    57cc:	222f 0122      	move.l 290(sp),d1
    57d0:	2001           	move.l d1,d0
    57d2:	e788           	lsl.l #3,d0
    57d4:	9081           	sub.l d1,d0
    57d6:	d080           	add.l d0,d0
    57d8:	d080           	add.l d0,d0
    57da:	2040           	movea.l d0,a0
    57dc:	41e8 000b      	lea 11(a0),a0
    57e0:	2208           	move.l a0,d1
    57e2:	d2af 011a      	add.l 282(sp),d1
    57e6:	7000           	moveq #0,d0
    57e8:	302f 01c6      	move.w 454(sp),d0
    57ec:	2f01           	move.l d1,-(sp)
    57ee:	2f00           	move.l d0,-(sp)
    57f0:	2f2f 01d0      	move.l 464(sp),-(sp)
    57f4:	2f2f 0056      	move.l 86(sp),-(sp)
    57f8:	4eba 12fe      	jsr 6af8 <TestRow>(pc)
    57fc:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5800:	7030           	moveq #48,d0
    5802:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5806:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {
    580a:	52af 011a      	addq.l #1,282(sp)
    580e:	7209           	moveq #9,d1
    5810:	b2af 011a      	cmp.l 282(sp),d1
    5814:	6c00 ff7c      	bge.w 5792 <TestZoom4Picture+0x1afc>
  for(int i=0;i<9;i++) {
    5818:	52af 0122      	addq.l #1,290(sp)
    581c:	7008           	moveq #8,d0
    581e:	b0af 0122      	cmp.l 290(sp),d0
    5822:	6c00 ff1a      	bge.w 573e <TestZoom4Picture+0x1aa8>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    5826:	42af 0116      	clr.l 278(sp)
    582a:	6032           	bra.s 585e <TestZoom4Picture+0x1bc8>
    TestRow( valsupposed, valactual, mask, 255+i2);
    582c:	222f 0116      	move.l 278(sp),d1
    5830:	0681 0000 00ff 	addi.l #255,d1
    5836:	7000           	moveq #0,d0
    5838:	302f 01c6      	move.w 454(sp),d0
    583c:	2f01           	move.l d1,-(sp)
    583e:	2f00           	move.l d0,-(sp)
    5840:	2f2f 01d0      	move.l 464(sp),-(sp)
    5844:	2f2f 0056      	move.l 86(sp),-(sp)
    5848:	4eba 12ae      	jsr 6af8 <TestRow>(pc)
    584c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5850:	7230           	moveq #48,d1
    5852:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5856:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    585a:	52af 0116      	addq.l #1,278(sp)
    585e:	7007           	moveq #7,d0
    5860:	b0af 0116      	cmp.l 278(sp),d0
    5864:	6cc6           	bge.s 582c <TestZoom4Picture+0x1b96>
  }
  for(int i=0;i<3;i++) {
    5866:	42af 0112      	clr.l 274(sp)
    586a:	6064           	bra.s 58d0 <TestZoom4Picture+0x1c3a>
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    586c:	202f 0112      	move.l 274(sp),d0
    5870:	d080           	add.l d0,d0
    5872:	2200           	move.l d0,d1
    5874:	0681 0000 0107 	addi.l #263,d1
    587a:	7000           	moveq #0,d0
    587c:	302f 01c6      	move.w 454(sp),d0
    5880:	2f01           	move.l d1,-(sp)
    5882:	2f00           	move.l d0,-(sp)
    5884:	2f2f 01d0      	move.l 464(sp),-(sp)
    5888:	2f2f 0056      	move.l 86(sp),-(sp)
    588c:	4eba 126a      	jsr 6af8 <TestRow>(pc)
    5890:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5894:	7230           	moveq #48,d1
    5896:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    589a:	202f 0112      	move.l 274(sp),d0
    589e:	0680 0000 0084 	addi.l #132,d0
    58a4:	d080           	add.l d0,d0
    58a6:	2200           	move.l d0,d1
    58a8:	7000           	moveq #0,d0
    58aa:	302f 01c6      	move.w 454(sp),d0
    58ae:	2f01           	move.l d1,-(sp)
    58b0:	2f00           	move.l d0,-(sp)
    58b2:	2f2f 01d0      	move.l 464(sp),-(sp)
    58b6:	2f2f 0056      	move.l 86(sp),-(sp)
    58ba:	4eba 123c      	jsr 6af8 <TestRow>(pc)
    58be:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    58c2:	7030           	moveq #48,d0
    58c4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    58c8:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    58cc:	52af 0112      	addq.l #1,274(sp)
    58d0:	7202           	moveq #2,d1
    58d2:	b2af 0112      	cmp.l 274(sp),d1
    58d6:	6c94           	bge.s 586c <TestZoom4Picture+0x1bd6>
  }

  tmp = source;
    58d8:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    58de:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    58e4:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    58ea:	4878 0001      	pea 1 <_start+0x1>
    58ee:	4878 000a      	pea a <_start+0xa>
    58f2:	2f2f 0056      	move.l 86(sp),-(sp)
    58f6:	2f2f 006a      	move.l 106(sp),-(sp)
    58fa:	4eba c19e      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    58fe:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5902:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    5908:	2c40           	movea.l d0,a6
    590a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    590e:	202f 004e      	move.l 78(sp),d0
    5912:	5880           	addq.l #4,d0
    5914:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom11;
    5918:	2f7c 0000 baac 	move.l #47788,74(sp)
    591e:	004a 

  mask = 0xffff;
    5920:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  for(int i2=0;i2<6;i2++) {  
    5926:	42af 010e      	clr.l 270(sp)
    592a:	602a           	bra.s 5956 <TestZoom4Picture+0x1cc0>
    TestRow( valsupposed, valactual, mask, i2);
    592c:	7000           	moveq #0,d0
    592e:	302f 01c6      	move.w 454(sp),d0
    5932:	2f2f 010e      	move.l 270(sp),-(sp)
    5936:	2f00           	move.l d0,-(sp)
    5938:	2f2f 01d0      	move.l 464(sp),-(sp)
    593c:	2f2f 0056      	move.l 86(sp),-(sp)
    5940:	4eba 11b6      	jsr 6af8 <TestRow>(pc)
    5944:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5948:	7230           	moveq #48,d1
    594a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    594e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {  
    5952:	52af 010e      	addq.l #1,270(sp)
    5956:	7005           	moveq #5,d0
    5958:	b0af 010e      	cmp.l 270(sp),d0
    595c:	6cce           	bge.s 592c <TestZoom4Picture+0x1c96>
  }

  for(int i2=0;i2<11;i2++) {
    595e:	42af 010a      	clr.l 266(sp)
    5962:	605c           	bra.s 59c0 <TestZoom4Picture+0x1d2a>
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    5964:	202f 010a      	move.l 266(sp),d0
    5968:	5680           	addq.l #3,d0
    596a:	d080           	add.l d0,d0
    596c:	2200           	move.l d0,d1
    596e:	7000           	moveq #0,d0
    5970:	302f 01c6      	move.w 454(sp),d0
    5974:	2f01           	move.l d1,-(sp)
    5976:	2f00           	move.l d0,-(sp)
    5978:	2f2f 01d0      	move.l 464(sp),-(sp)
    597c:	2f2f 0056      	move.l 86(sp),-(sp)
    5980:	4eba 1176      	jsr 6af8 <TestRow>(pc)
    5984:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5988:	7230           	moveq #48,d1
    598a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    598e:	202f 010a      	move.l 266(sp),d0
    5992:	d080           	add.l d0,d0
    5994:	2200           	move.l d0,d1
    5996:	5e81           	addq.l #7,d1
    5998:	7000           	moveq #0,d0
    599a:	302f 01c6      	move.w 454(sp),d0
    599e:	2f01           	move.l d1,-(sp)
    59a0:	2f00           	move.l d0,-(sp)
    59a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    59a6:	2f2f 0056      	move.l 86(sp),-(sp)
    59aa:	4eba 114c      	jsr 6af8 <TestRow>(pc)
    59ae:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    59b2:	7030           	moveq #48,d0
    59b4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    59b8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    59bc:	52af 010a      	addq.l #1,266(sp)
    59c0:	720a           	moveq #10,d1
    59c2:	b2af 010a      	cmp.l 266(sp),d1
    59c6:	6c9c           	bge.s 5964 <TestZoom4Picture+0x1cce>
  }

  for(int i=0;i<8;i++) {
    59c8:	42af 0106      	clr.l 262(sp)
    59cc:	6000 00f2      	bra.w 5ac0 <TestZoom4Picture+0x1e2a>
    for(int i2=0;i2<7;i2++) {  
    59d0:	42af 0102      	clr.l 258(sp)
    59d4:	6044           	bra.s 5a1a <TestZoom4Picture+0x1d84>
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    59d6:	307c 001c      	movea.w #28,a0
    59da:	d1ef 0102      	adda.l 258(sp),a0
    59de:	222f 0106      	move.l 262(sp),d1
    59e2:	2001           	move.l d1,d0
    59e4:	e788           	lsl.l #3,d0
    59e6:	9081           	sub.l d1,d0
    59e8:	d080           	add.l d0,d0
    59ea:	d080           	add.l d0,d0
    59ec:	d081           	add.l d1,d0
    59ee:	2208           	move.l a0,d1
    59f0:	d280           	add.l d0,d1
    59f2:	7000           	moveq #0,d0
    59f4:	302f 01c6      	move.w 454(sp),d0
    59f8:	2f01           	move.l d1,-(sp)
    59fa:	2f00           	move.l d0,-(sp)
    59fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a00:	2f2f 0056      	move.l 86(sp),-(sp)
    5a04:	4eba 10f2      	jsr 6af8 <TestRow>(pc)
    5a08:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a0c:	7030           	moveq #48,d0
    5a0e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5a12:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<7;i2++) {  
    5a16:	52af 0102      	addq.l #1,258(sp)
    5a1a:	7206           	moveq #6,d1
    5a1c:	b2af 0102      	cmp.l 258(sp),d1
    5a20:	6cb4           	bge.s 59d6 <TestZoom4Picture+0x1d40>
    }
    
    for(int i2=0;i2<11;i2++) {
    5a22:	42af 00fe      	clr.l 254(sp)
    5a26:	6000 008a      	bra.w 5ab2 <TestZoom4Picture+0x1e1c>
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    5a2a:	222f 0106      	move.l 262(sp),d1
    5a2e:	2001           	move.l d1,d0
    5a30:	e788           	lsl.l #3,d0
    5a32:	9081           	sub.l d1,d0
    5a34:	d080           	add.l d0,d0
    5a36:	d080           	add.l d0,d0
    5a38:	2040           	movea.l d0,a0
    5a3a:	d1c1           	adda.l d1,a0
    5a3c:	41e8 0023      	lea 35(a0),a0
    5a40:	202f 00fe      	move.l 254(sp),d0
    5a44:	d080           	add.l d0,d0
    5a46:	2208           	move.l a0,d1
    5a48:	d280           	add.l d0,d1
    5a4a:	7000           	moveq #0,d0
    5a4c:	302f 01c6      	move.w 454(sp),d0
    5a50:	2f01           	move.l d1,-(sp)
    5a52:	2f00           	move.l d0,-(sp)
    5a54:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a58:	2f2f 0056      	move.l 86(sp),-(sp)
    5a5c:	4eba 109a      	jsr 6af8 <TestRow>(pc)
    5a60:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a64:	7030           	moveq #48,d0
    5a66:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    5a6a:	222f 0106      	move.l 262(sp),d1
    5a6e:	2001           	move.l d1,d0
    5a70:	e788           	lsl.l #3,d0
    5a72:	9081           	sub.l d1,d0
    5a74:	d080           	add.l d0,d0
    5a76:	d080           	add.l d0,d0
    5a78:	2040           	movea.l d0,a0
    5a7a:	d1c1           	adda.l d1,a0
    5a7c:	41e8 000b      	lea 11(a0),a0
    5a80:	202f 00fe      	move.l 254(sp),d0
    5a84:	d080           	add.l d0,d0
    5a86:	2208           	move.l a0,d1
    5a88:	d280           	add.l d0,d1
    5a8a:	7000           	moveq #0,d0
    5a8c:	302f 01c6      	move.w 454(sp),d0
    5a90:	2f01           	move.l d1,-(sp)
    5a92:	2f00           	move.l d0,-(sp)
    5a94:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a98:	2f2f 0056      	move.l 86(sp),-(sp)
    5a9c:	4eba 105a      	jsr 6af8 <TestRow>(pc)
    5aa0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5aa4:	7230           	moveq #48,d1
    5aa6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5aaa:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {
    5aae:	52af 00fe      	addq.l #1,254(sp)
    5ab2:	700a           	moveq #10,d0
    5ab4:	b0af 00fe      	cmp.l 254(sp),d0
    5ab8:	6c00 ff70      	bge.w 5a2a <TestZoom4Picture+0x1d94>
  for(int i=0;i<8;i++) {
    5abc:	52af 0106      	addq.l #1,262(sp)
    5ac0:	7207           	moveq #7,d1
    5ac2:	b2af 0106      	cmp.l 262(sp),d1
    5ac6:	6c00 ff08      	bge.w 59d0 <TestZoom4Picture+0x1d3a>
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    5aca:	42af 00fa      	clr.l 250(sp)
    5ace:	6032           	bra.s 5b02 <TestZoom4Picture+0x1e6c>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5ad0:	222f 00fa      	move.l 250(sp),d1
    5ad4:	0681 0000 0104 	addi.l #260,d1
    5ada:	7000           	moveq #0,d0
    5adc:	302f 01c6      	move.w 454(sp),d0
    5ae0:	2f01           	move.l d1,-(sp)
    5ae2:	2f00           	move.l d0,-(sp)
    5ae4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ae8:	2f2f 0056      	move.l 86(sp),-(sp)
    5aec:	4eba 100a      	jsr 6af8 <TestRow>(pc)
    5af0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5af4:	7030           	moveq #48,d0
    5af6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5afa:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    5afe:	52af 00fa      	addq.l #1,250(sp)
    5b02:	7206           	moveq #6,d1
    5b04:	b2af 00fa      	cmp.l 250(sp),d1
    5b08:	6cc6           	bge.s 5ad0 <TestZoom4Picture+0x1e3a>
  }
  TestRow( valsupposed, valactual, mask, 267);   
    5b0a:	7000           	moveq #0,d0
    5b0c:	302f 01c6      	move.w 454(sp),d0
    5b10:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    5b14:	2f00           	move.l d0,-(sp)
    5b16:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b1a:	2f2f 0056      	move.l 86(sp),-(sp)
    5b1e:	4eba 0fd8      	jsr 6af8 <TestRow>(pc)
    5b22:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b26:	7030           	moveq #48,d0
    5b28:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 268);
    5b2c:	7000           	moveq #0,d0
    5b2e:	302f 01c6      	move.w 454(sp),d0
    5b32:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    5b36:	2f00           	move.l d0,-(sp)
    5b38:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b3c:	2f2f 0056      	move.l 86(sp),-(sp)
    5b40:	4eba 0fb6      	jsr 6af8 <TestRow>(pc)
    5b44:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b48:	7230           	moveq #48,d1
    5b4a:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5b4e:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 269);
    5b52:	7000           	moveq #0,d0
    5b54:	302f 01c6      	move.w 454(sp),d0
    5b58:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5b5c:	2f00           	move.l d0,-(sp)
    5b5e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b62:	2f2f 0056      	move.l 86(sp),-(sp)
    5b66:	4eba 0f90      	jsr 6af8 <TestRow>(pc)
    5b6a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b6e:	7030           	moveq #48,d0
    5b70:	d1af 01c8      	add.l d0,456(sp)
  
  tmp = source;
    5b74:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5b7a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5b80:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    5b86:	4878 0001      	pea 1 <_start+0x1>
    5b8a:	4878 000b      	pea b <_start+0xb>
    5b8e:	2f2f 0056      	move.l 86(sp),-(sp)
    5b92:	2f2f 006a      	move.l 106(sp),-(sp)
    5b96:	4eba bf02      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    5b9a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5b9e:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    5ba4:	2c40           	movea.l d0,a6
    5ba6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5baa:	222f 004e      	move.l 78(sp),d1
    5bae:	5881           	addq.l #4,d1
    5bb0:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom12;
    5bb4:	2f7c 0000 bad8 	move.l #47832,74(sp)
    5bba:	004a 

  mask = 0x0;
    5bbc:	426f 01c6      	clr.w 454(sp)
   
  TestRow( valsupposed, valactual, mask, 0);
    5bc0:	7000           	moveq #0,d0
    5bc2:	302f 01c6      	move.w 454(sp),d0
    5bc6:	42a7           	clr.l -(sp)
    5bc8:	2f00           	move.l d0,-(sp)
    5bca:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bce:	2f2f 0056      	move.l 86(sp),-(sp)
    5bd2:	4eba 0f24      	jsr 6af8 <TestRow>(pc)
    5bd6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5bda:	7030           	moveq #48,d0
    5bdc:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5be0:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<12;i2++) {
    5be4:	42af 00f6      	clr.l 246(sp)
    5be8:	605c           	bra.s 5c46 <TestZoom4Picture+0x1fb0>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5bea:	202f 00f6      	move.l 246(sp),d0
    5bee:	d080           	add.l d0,d0
    5bf0:	2200           	move.l d0,d1
    5bf2:	5281           	addq.l #1,d1
    5bf4:	7000           	moveq #0,d0
    5bf6:	302f 01c6      	move.w 454(sp),d0
    5bfa:	2f01           	move.l d1,-(sp)
    5bfc:	2f00           	move.l d0,-(sp)
    5bfe:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c02:	2f2f 0056      	move.l 86(sp),-(sp)
    5c06:	4eba 0ef0      	jsr 6af8 <TestRow>(pc)
    5c0a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5c0e:	7230           	moveq #48,d1
    5c10:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5c14:	202f 00f6      	move.l 246(sp),d0
    5c18:	5280           	addq.l #1,d0
    5c1a:	d080           	add.l d0,d0
    5c1c:	2200           	move.l d0,d1
    5c1e:	7000           	moveq #0,d0
    5c20:	302f 01c6      	move.w 454(sp),d0
    5c24:	2f01           	move.l d1,-(sp)
    5c26:	2f00           	move.l d0,-(sp)
    5c28:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c2c:	2f2f 0056      	move.l 86(sp),-(sp)
    5c30:	4eba 0ec6      	jsr 6af8 <TestRow>(pc)
    5c34:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5c38:	7030           	moveq #48,d0
    5c3a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5c3e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    5c42:	52af 00f6      	addq.l #1,246(sp)
    5c46:	720b           	moveq #11,d1
    5c48:	b2af 00f6      	cmp.l 246(sp),d1
    5c4c:	6c9c           	bge.s 5bea <TestZoom4Picture+0x1f54>
  } 

  for(int i=0;i<8;i++) {
    5c4e:	42af 00f2      	clr.l 242(sp)
    5c52:	6000 00e6      	bra.w 5d3a <TestZoom4Picture+0x20a4>
    for(int i2=0;i2<6;i2++) {  
    5c56:	42af 00ee      	clr.l 238(sp)
    5c5a:	6040           	bra.s 5c9c <TestZoom4Picture+0x2006>
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    5c5c:	307c 0019      	movea.w #25,a0
    5c60:	d1ef 00ee      	adda.l 238(sp),a0
    5c64:	222f 00f2      	move.l 242(sp),d1
    5c68:	2001           	move.l d1,d0
    5c6a:	e988           	lsl.l #4,d0
    5c6c:	9081           	sub.l d1,d0
    5c6e:	d080           	add.l d0,d0
    5c70:	2208           	move.l a0,d1
    5c72:	d280           	add.l d0,d1
    5c74:	7000           	moveq #0,d0
    5c76:	302f 01c6      	move.w 454(sp),d0
    5c7a:	2f01           	move.l d1,-(sp)
    5c7c:	2f00           	move.l d0,-(sp)
    5c7e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c82:	2f2f 0056      	move.l 86(sp),-(sp)
    5c86:	4eba 0e70      	jsr 6af8 <TestRow>(pc)
    5c8a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5c8e:	7030           	moveq #48,d0
    5c90:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5c94:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<6;i2++) {  
    5c98:	52af 00ee      	addq.l #1,238(sp)
    5c9c:	7205           	moveq #5,d1
    5c9e:	b2af 00ee      	cmp.l 238(sp),d1
    5ca2:	6cb8           	bge.s 5c5c <TestZoom4Picture+0x1fc6>
    }
    
    for(int i2=0;i2<12;i2++) {
    5ca4:	42af 00ea      	clr.l 234(sp)
    5ca8:	6000 0082      	bra.w 5d2c <TestZoom4Picture+0x2096>
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    5cac:	222f 00f2      	move.l 242(sp),d1
    5cb0:	2001           	move.l d1,d0
    5cb2:	e988           	lsl.l #4,d0
    5cb4:	9081           	sub.l d1,d0
    5cb6:	d080           	add.l d0,d0
    5cb8:	2040           	movea.l d0,a0
    5cba:	41e8 001f      	lea 31(a0),a0
    5cbe:	202f 00ea      	move.l 234(sp),d0
    5cc2:	d080           	add.l d0,d0
    5cc4:	2208           	move.l a0,d1
    5cc6:	d280           	add.l d0,d1
    5cc8:	7000           	moveq #0,d0
    5cca:	302f 01c6      	move.w 454(sp),d0
    5cce:	2f01           	move.l d1,-(sp)
    5cd0:	2f00           	move.l d0,-(sp)
    5cd2:	2f2f 01d0      	move.l 464(sp),-(sp)
    5cd6:	2f2f 0056      	move.l 86(sp),-(sp)
    5cda:	4eba 0e1c      	jsr 6af8 <TestRow>(pc)
    5cde:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5ce2:	7030           	moveq #48,d0
    5ce4:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    5ce8:	222f 00f2      	move.l 242(sp),d1
    5cec:	2001           	move.l d1,d0
    5cee:	e988           	lsl.l #4,d0
    5cf0:	9081           	sub.l d1,d0
    5cf2:	d080           	add.l d0,d0
    5cf4:	2040           	movea.l d0,a0
    5cf6:	41e8 0020      	lea 32(a0),a0
    5cfa:	202f 00ea      	move.l 234(sp),d0
    5cfe:	d080           	add.l d0,d0
    5d00:	2208           	move.l a0,d1
    5d02:	d280           	add.l d0,d1
    5d04:	7000           	moveq #0,d0
    5d06:	302f 01c6      	move.w 454(sp),d0
    5d0a:	2f01           	move.l d1,-(sp)
    5d0c:	2f00           	move.l d0,-(sp)
    5d0e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d12:	2f2f 0056      	move.l 86(sp),-(sp)
    5d16:	4eba 0de0      	jsr 6af8 <TestRow>(pc)
    5d1a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5d1e:	7230           	moveq #48,d1
    5d20:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5d24:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {
    5d28:	52af 00ea      	addq.l #1,234(sp)
    5d2c:	700b           	moveq #11,d0
    5d2e:	b0af 00ea      	cmp.l 234(sp),d0
    5d32:	6c00 ff78      	bge.w 5cac <TestZoom4Picture+0x2016>
  for(int i=0;i<8;i++) {
    5d36:	52af 00f2      	addq.l #1,242(sp)
    5d3a:	7207           	moveq #7,d1
    5d3c:	b2af 00f2      	cmp.l 242(sp),d1
    5d40:	6c00 ff14      	bge.w 5c56 <TestZoom4Picture+0x1fc0>
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    5d44:	42af 00e6      	clr.l 230(sp)
    5d48:	6032           	bra.s 5d7c <TestZoom4Picture+0x20e6>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5d4a:	222f 00e6      	move.l 230(sp),d1
    5d4e:	0681 0000 0104 	addi.l #260,d1
    5d54:	7000           	moveq #0,d0
    5d56:	302f 01c6      	move.w 454(sp),d0
    5d5a:	2f01           	move.l d1,-(sp)
    5d5c:	2f00           	move.l d0,-(sp)
    5d5e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d62:	2f2f 0056      	move.l 86(sp),-(sp)
    5d66:	4eba 0d90      	jsr 6af8 <TestRow>(pc)
    5d6a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5d6e:	7030           	moveq #48,d0
    5d70:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5d74:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5d78:	52af 00e6      	addq.l #1,230(sp)
    5d7c:	7204           	moveq #4,d1
    5d7e:	b2af 00e6      	cmp.l 230(sp),d1
    5d82:	6cc6           	bge.s 5d4a <TestZoom4Picture+0x20b4>
  }

  tmp = source;
    5d84:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5d8a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5d90:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    5d96:	4878 0001      	pea 1 <_start+0x1>
    5d9a:	4878 000c      	pea c <_start+0xc>
    5d9e:	2f2f 0056      	move.l 86(sp),-(sp)
    5da2:	2f2f 006a      	move.l 106(sp),-(sp)
    5da6:	4eba bcf2      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    5daa:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5dae:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    5db4:	2c40           	movea.l d0,a6
    5db6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5dba:	202f 004e      	move.l 78(sp),d0
    5dbe:	5880           	addq.l #4,d0
    5dc0:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom13;
    5dc4:	2f7c 0000 bb04 	move.l #47876,74(sp)
    5dca:	004a 

  mask = 0xffff;
    5dcc:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<11;i2++) {
    5dd2:	42af 00e2      	clr.l 226(sp)
    5dd6:	605a           	bra.s 5e32 <TestZoom4Picture+0x219c>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    5dd8:	202f 00e2      	move.l 226(sp),d0
    5ddc:	d080           	add.l d0,d0
    5dde:	2200           	move.l d0,d1
    5de0:	7000           	moveq #0,d0
    5de2:	302f 01c6      	move.w 454(sp),d0
    5de6:	2f01           	move.l d1,-(sp)
    5de8:	2f00           	move.l d0,-(sp)
    5dea:	2f2f 01d0      	move.l 464(sp),-(sp)
    5dee:	2f2f 0056      	move.l 86(sp),-(sp)
    5df2:	4eba 0d04      	jsr 6af8 <TestRow>(pc)
    5df6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5dfa:	7230           	moveq #48,d1
    5dfc:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    5e00:	202f 00e2      	move.l 226(sp),d0
    5e04:	d080           	add.l d0,d0
    5e06:	2200           	move.l d0,d1
    5e08:	5281           	addq.l #1,d1
    5e0a:	7000           	moveq #0,d0
    5e0c:	302f 01c6      	move.w 454(sp),d0
    5e10:	2f01           	move.l d1,-(sp)
    5e12:	2f00           	move.l d0,-(sp)
    5e14:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e18:	2f2f 0056      	move.l 86(sp),-(sp)
    5e1c:	4eba 0cda      	jsr 6af8 <TestRow>(pc)
    5e20:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5e24:	7030           	moveq #48,d0
    5e26:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5e2a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5e2e:	52af 00e2      	addq.l #1,226(sp)
    5e32:	720a           	moveq #10,d1
    5e34:	b2af 00e2      	cmp.l 226(sp),d1
    5e38:	6c9e           	bge.s 5dd8 <TestZoom4Picture+0x2142>
  } 

  for(int i=0;i<8;i++) {
    5e3a:	42af 00de      	clr.l 222(sp)
    5e3e:	6000 00de      	bra.w 5f1e <TestZoom4Picture+0x2288>
    for(int i2=0;i2<5;i2++) {  
    5e42:	42af 00da      	clr.l 218(sp)
    5e46:	603e           	bra.s 5e86 <TestZoom4Picture+0x21f0>
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    5e48:	307c 0016      	movea.w #22,a0
    5e4c:	d1ef 00da      	adda.l 218(sp),a0
    5e50:	222f 00de      	move.l 222(sp),d1
    5e54:	2001           	move.l d1,d0
    5e56:	eb88           	lsl.l #5,d0
    5e58:	9081           	sub.l d1,d0
    5e5a:	2208           	move.l a0,d1
    5e5c:	d280           	add.l d0,d1
    5e5e:	7000           	moveq #0,d0
    5e60:	302f 01c6      	move.w 454(sp),d0
    5e64:	2f01           	move.l d1,-(sp)
    5e66:	2f00           	move.l d0,-(sp)
    5e68:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e6c:	2f2f 0056      	move.l 86(sp),-(sp)
    5e70:	4eba 0c86      	jsr 6af8 <TestRow>(pc)
    5e74:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5e78:	7030           	moveq #48,d0
    5e7a:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5e7e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<5;i2++) {  
    5e82:	52af 00da      	addq.l #1,218(sp)
    5e86:	7204           	moveq #4,d1
    5e88:	b2af 00da      	cmp.l 218(sp),d1
    5e8c:	6cba           	bge.s 5e48 <TestZoom4Picture+0x21b2>
    }
    
    for(int i2=0;i2<13;i2++) {
    5e8e:	42af 00d6      	clr.l 214(sp)
    5e92:	607c           	bra.s 5f10 <TestZoom4Picture+0x227a>
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    5e94:	222f 00de      	move.l 222(sp),d1
    5e98:	2001           	move.l d1,d0
    5e9a:	eb88           	lsl.l #5,d0
    5e9c:	2040           	movea.l d0,a0
    5e9e:	91c1           	suba.l d1,a0
    5ea0:	41e8 001b      	lea 27(a0),a0
    5ea4:	202f 00d6      	move.l 214(sp),d0
    5ea8:	d080           	add.l d0,d0
    5eaa:	2208           	move.l a0,d1
    5eac:	d280           	add.l d0,d1
    5eae:	7000           	moveq #0,d0
    5eb0:	302f 01c6      	move.w 454(sp),d0
    5eb4:	2f01           	move.l d1,-(sp)
    5eb6:	2f00           	move.l d0,-(sp)
    5eb8:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ebc:	2f2f 0056      	move.l 86(sp),-(sp)
    5ec0:	4eba 0c36      	jsr 6af8 <TestRow>(pc)
    5ec4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5ec8:	7030           	moveq #48,d0
    5eca:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    5ece:	222f 00de      	move.l 222(sp),d1
    5ed2:	2001           	move.l d1,d0
    5ed4:	eb88           	lsl.l #5,d0
    5ed6:	2040           	movea.l d0,a0
    5ed8:	91c1           	suba.l d1,a0
    5eda:	41e8 001c      	lea 28(a0),a0
    5ede:	202f 00d6      	move.l 214(sp),d0
    5ee2:	d080           	add.l d0,d0
    5ee4:	2208           	move.l a0,d1
    5ee6:	d280           	add.l d0,d1
    5ee8:	7000           	moveq #0,d0
    5eea:	302f 01c6      	move.w 454(sp),d0
    5eee:	2f01           	move.l d1,-(sp)
    5ef0:	2f00           	move.l d0,-(sp)
    5ef2:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ef6:	2f2f 0056      	move.l 86(sp),-(sp)
    5efa:	4eba 0bfc      	jsr 6af8 <TestRow>(pc)
    5efe:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f02:	7230           	moveq #48,d1
    5f04:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5f08:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {
    5f0c:	52af 00d6      	addq.l #1,214(sp)
    5f10:	700c           	moveq #12,d0
    5f12:	b0af 00d6      	cmp.l 214(sp),d0
    5f16:	6c00 ff7c      	bge.w 5e94 <TestZoom4Picture+0x21fe>
  for(int i=0;i<8;i++) {
    5f1a:	52af 00de      	addq.l #1,222(sp)
    5f1e:	7207           	moveq #7,d1
    5f20:	b2af 00de      	cmp.l 222(sp),d1
    5f24:	6c00 ff1c      	bge.w 5e42 <TestZoom4Picture+0x21ac>
    }
  } 

  tmp = source;
    5f28:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5f2e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5f34:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    5f3a:	4878 0001      	pea 1 <_start+0x1>
    5f3e:	4878 000d      	pea d <_start+0xd>
    5f42:	2f2f 0056      	move.l 86(sp),-(sp)
    5f46:	2f2f 006a      	move.l 106(sp),-(sp)
    5f4a:	4eba bb4e      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    5f4e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5f52:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    5f58:	2c40           	movea.l d0,a6
    5f5a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5f5e:	202f 004e      	move.l 78(sp),d0
    5f62:	5880           	addq.l #4,d0
    5f64:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom14;
    5f68:	2f7c 0000 bb30 	move.l #47920,74(sp)
    5f6e:	004a 

  mask = 0xffff;
    5f70:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    5f76:	7000           	moveq #0,d0
    5f78:	302f 01c6      	move.w 454(sp),d0
    5f7c:	42a7           	clr.l -(sp)
    5f7e:	2f00           	move.l d0,-(sp)
    5f80:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f84:	2f2f 0056      	move.l 86(sp),-(sp)
    5f88:	4eba 0b6e      	jsr 6af8 <TestRow>(pc)
    5f8c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2; 
    5f90:	7230           	moveq #48,d1
    5f92:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff; 
    5f96:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<9;i2++) {
    5f9a:	42af 00d2      	clr.l 210(sp)
    5f9e:	605c           	bra.s 5ffc <TestZoom4Picture+0x2366>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5fa0:	202f 00d2      	move.l 210(sp),d0
    5fa4:	d080           	add.l d0,d0
    5fa6:	2200           	move.l d0,d1
    5fa8:	5281           	addq.l #1,d1
    5faa:	7000           	moveq #0,d0
    5fac:	302f 01c6      	move.w 454(sp),d0
    5fb0:	2f01           	move.l d1,-(sp)
    5fb2:	2f00           	move.l d0,-(sp)
    5fb4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5fb8:	2f2f 0056      	move.l 86(sp),-(sp)
    5fbc:	4eba 0b3a      	jsr 6af8 <TestRow>(pc)
    5fc0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5fc4:	7030           	moveq #48,d0
    5fc6:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5fca:	202f 00d2      	move.l 210(sp),d0
    5fce:	5280           	addq.l #1,d0
    5fd0:	d080           	add.l d0,d0
    5fd2:	2200           	move.l d0,d1
    5fd4:	7000           	moveq #0,d0
    5fd6:	302f 01c6      	move.w 454(sp),d0
    5fda:	2f01           	move.l d1,-(sp)
    5fdc:	2f00           	move.l d0,-(sp)
    5fde:	2f2f 01d0      	move.l 464(sp),-(sp)
    5fe2:	2f2f 0056      	move.l 86(sp),-(sp)
    5fe6:	4eba 0b10      	jsr 6af8 <TestRow>(pc)
    5fea:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5fee:	7230           	moveq #48,d1
    5ff0:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5ff4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {
    5ff8:	52af 00d2      	addq.l #1,210(sp)
    5ffc:	7008           	moveq #8,d0
    5ffe:	b0af 00d2      	cmp.l 210(sp),d0
    6002:	6c9c           	bge.s 5fa0 <TestZoom4Picture+0x230a>
  } 

  for(int i=0;i<7;i++) {
    6004:	42af 00ce      	clr.l 206(sp)
    6008:	6000 00cc      	bra.w 60d6 <TestZoom4Picture+0x2440>
    for(int i2=0;i2<4;i2++) {  
    600c:	42af 00ca      	clr.l 202(sp)
    6010:	6036           	bra.s 6048 <TestZoom4Picture+0x23b2>
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    6012:	7213           	moveq #19,d1
    6014:	d2af 00ca      	add.l 202(sp),d1
    6018:	202f 00ce      	move.l 206(sp),d0
    601c:	eb88           	lsl.l #5,d0
    601e:	d280           	add.l d0,d1
    6020:	7000           	moveq #0,d0
    6022:	302f 01c6      	move.w 454(sp),d0
    6026:	2f01           	move.l d1,-(sp)
    6028:	2f00           	move.l d0,-(sp)
    602a:	2f2f 01d0      	move.l 464(sp),-(sp)
    602e:	2f2f 0056      	move.l 86(sp),-(sp)
    6032:	4eba 0ac4      	jsr 6af8 <TestRow>(pc)
    6036:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    603a:	7230           	moveq #48,d1
    603c:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6040:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<4;i2++) {  
    6044:	52af 00ca      	addq.l #1,202(sp)
    6048:	7003           	moveq #3,d0
    604a:	b0af 00ca      	cmp.l 202(sp),d0
    604e:	6cc2           	bge.s 6012 <TestZoom4Picture+0x237c>
    }
    
    for(int i2=0;i2<14;i2++) {
    6050:	42af 00c6      	clr.l 198(sp)
    6054:	6074           	bra.s 60ca <TestZoom4Picture+0x2434>
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    6056:	202f 00ce      	move.l 206(sp),d0
    605a:	eb88           	lsl.l #5,d0
    605c:	307c 0017      	movea.w #23,a0
    6060:	d1c0           	adda.l d0,a0
    6062:	202f 00c6      	move.l 198(sp),d0
    6066:	d080           	add.l d0,d0
    6068:	2208           	move.l a0,d1
    606a:	d280           	add.l d0,d1
    606c:	7000           	moveq #0,d0
    606e:	302f 01c6      	move.w 454(sp),d0
    6072:	2f01           	move.l d1,-(sp)
    6074:	2f00           	move.l d0,-(sp)
    6076:	2f2f 01d0      	move.l 464(sp),-(sp)
    607a:	2f2f 0056      	move.l 86(sp),-(sp)
    607e:	4eba 0a78      	jsr 6af8 <TestRow>(pc)
    6082:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6086:	7230           	moveq #48,d1
    6088:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    608c:	202f 00ce      	move.l 206(sp),d0
    6090:	eb88           	lsl.l #5,d0
    6092:	307c 0018      	movea.w #24,a0
    6096:	d1c0           	adda.l d0,a0
    6098:	202f 00c6      	move.l 198(sp),d0
    609c:	d080           	add.l d0,d0
    609e:	2208           	move.l a0,d1
    60a0:	d280           	add.l d0,d1
    60a2:	7000           	moveq #0,d0
    60a4:	302f 01c6      	move.w 454(sp),d0
    60a8:	2f01           	move.l d1,-(sp)
    60aa:	2f00           	move.l d0,-(sp)
    60ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    60b0:	2f2f 0056      	move.l 86(sp),-(sp)
    60b4:	4eba 0a42      	jsr 6af8 <TestRow>(pc)
    60b8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    60bc:	7030           	moveq #48,d0
    60be:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    60c2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {
    60c6:	52af 00c6      	addq.l #1,198(sp)
    60ca:	720d           	moveq #13,d1
    60cc:	b2af 00c6      	cmp.l 198(sp),d1
    60d0:	6c84           	bge.s 6056 <TestZoom4Picture+0x23c0>
  for(int i=0;i<7;i++) {
    60d2:	52af 00ce      	addq.l #1,206(sp)
    60d6:	7006           	moveq #6,d0
    60d8:	b0af 00ce      	cmp.l 206(sp),d0
    60dc:	6c00 ff2e      	bge.w 600c <TestZoom4Picture+0x2376>
    }
  }

  for(int i2=0;i2<4;i2++) {  
    60e0:	42af 00c2      	clr.l 194(sp)
    60e4:	6032           	bra.s 6118 <TestZoom4Picture+0x2482>
    TestRow( valsupposed, valactual, mask, 243+i2);
    60e6:	222f 00c2      	move.l 194(sp),d1
    60ea:	0681 0000 00f3 	addi.l #243,d1
    60f0:	7000           	moveq #0,d0
    60f2:	302f 01c6      	move.w 454(sp),d0
    60f6:	2f01           	move.l d1,-(sp)
    60f8:	2f00           	move.l d0,-(sp)
    60fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    60fe:	2f2f 0056      	move.l 86(sp),-(sp)
    6102:	4eba 09f4      	jsr 6af8 <TestRow>(pc)
    6106:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    610a:	7230           	moveq #48,d1
    610c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6110:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {  
    6114:	52af 00c2      	addq.l #1,194(sp)
    6118:	7003           	moveq #3,d0
    611a:	b0af 00c2      	cmp.l 194(sp),d0
    611e:	6cc6           	bge.s 60e6 <TestZoom4Picture+0x2450>
  }

  for(int i2=0;i2<12;i2++) {
    6120:	42af 00be      	clr.l 190(sp)
    6124:	6060           	bra.s 6186 <TestZoom4Picture+0x24f0>
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    6126:	202f 00be      	move.l 190(sp),d0
    612a:	d080           	add.l d0,d0
    612c:	2200           	move.l d0,d1
    612e:	0681 0000 00f7 	addi.l #247,d1
    6134:	7000           	moveq #0,d0
    6136:	302f 01c6      	move.w 454(sp),d0
    613a:	2f01           	move.l d1,-(sp)
    613c:	2f00           	move.l d0,-(sp)
    613e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6142:	2f2f 0056      	move.l 86(sp),-(sp)
    6146:	4eba 09b0      	jsr 6af8 <TestRow>(pc)
    614a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    614e:	7230           	moveq #48,d1
    6150:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    6154:	707c           	moveq #124,d0
    6156:	d0af 00be      	add.l 190(sp),d0
    615a:	d080           	add.l d0,d0
    615c:	2200           	move.l d0,d1
    615e:	7000           	moveq #0,d0
    6160:	302f 01c6      	move.w 454(sp),d0
    6164:	2f01           	move.l d1,-(sp)
    6166:	2f00           	move.l d0,-(sp)
    6168:	2f2f 01d0      	move.l 464(sp),-(sp)
    616c:	2f2f 0056      	move.l 86(sp),-(sp)
    6170:	4eba 0986      	jsr 6af8 <TestRow>(pc)
    6174:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6178:	7030           	moveq #48,d0
    617a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    617e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    6182:	52af 00be      	addq.l #1,190(sp)
    6186:	720b           	moveq #11,d1
    6188:	b2af 00be      	cmp.l 190(sp),d1
    618c:	6c98           	bge.s 6126 <TestZoom4Picture+0x2490>
  }

  tmp = source;
    618e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6194:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    619a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    61a0:	4878 0001      	pea 1 <_start+0x1>
    61a4:	4878 000e      	pea e <_start+0xe>
    61a8:	2f2f 0056      	move.l 86(sp),-(sp)
    61ac:	2f2f 006a      	move.l 106(sp),-(sp)
    61b0:	4eba b8e8      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    61b4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    61b8:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    61be:	2c40           	movea.l d0,a6
    61c0:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    61c4:	202f 004e      	move.l 78(sp),d0
    61c8:	5880           	addq.l #4,d0
    61ca:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom15;
    61ce:	2f7c 0000 bb5c 	move.l #47964,74(sp)
    61d4:	004a 

  mask = 0x0000;
    61d6:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<8;i2++) {
    61da:	42af 00ba      	clr.l 186(sp)
    61de:	605a           	bra.s 623a <TestZoom4Picture+0x25a4>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    61e0:	202f 00ba      	move.l 186(sp),d0
    61e4:	d080           	add.l d0,d0
    61e6:	2200           	move.l d0,d1
    61e8:	7000           	moveq #0,d0
    61ea:	302f 01c6      	move.w 454(sp),d0
    61ee:	2f01           	move.l d1,-(sp)
    61f0:	2f00           	move.l d0,-(sp)
    61f2:	2f2f 01d0      	move.l 464(sp),-(sp)
    61f6:	2f2f 0056      	move.l 86(sp),-(sp)
    61fa:	4eba 08fc      	jsr 6af8 <TestRow>(pc)
    61fe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6202:	7230           	moveq #48,d1
    6204:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6208:	202f 00ba      	move.l 186(sp),d0
    620c:	d080           	add.l d0,d0
    620e:	2200           	move.l d0,d1
    6210:	5281           	addq.l #1,d1
    6212:	7000           	moveq #0,d0
    6214:	302f 01c6      	move.w 454(sp),d0
    6218:	2f01           	move.l d1,-(sp)
    621a:	2f00           	move.l d0,-(sp)
    621c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6220:	2f2f 0056      	move.l 86(sp),-(sp)
    6224:	4eba 08d2      	jsr 6af8 <TestRow>(pc)
    6228:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    622c:	7030           	moveq #48,d0
    622e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6232:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    6236:	52af 00ba      	addq.l #1,186(sp)
    623a:	7207           	moveq #7,d1
    623c:	b2af 00ba      	cmp.l 186(sp),d1
    6240:	6c9e           	bge.s 61e0 <TestZoom4Picture+0x254a>
  }

  for(int i=0;i<7;i++) {
    6242:	42af 00b6      	clr.l 182(sp)
    6246:	6000 00de      	bra.w 6326 <TestZoom4Picture+0x2690>
    for(int i2=0;i2<3;i2++) {  
    624a:	42af 00b2      	clr.l 178(sp)
    624e:	603e           	bra.s 628e <TestZoom4Picture+0x25f8>
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    6250:	307c 0010      	movea.w #16,a0
    6254:	d1ef 00b2      	adda.l 178(sp),a0
    6258:	222f 00b6      	move.l 182(sp),d1
    625c:	2001           	move.l d1,d0
    625e:	eb88           	lsl.l #5,d0
    6260:	d081           	add.l d1,d0
    6262:	2208           	move.l a0,d1
    6264:	d280           	add.l d0,d1
    6266:	7000           	moveq #0,d0
    6268:	302f 01c6      	move.w 454(sp),d0
    626c:	2f01           	move.l d1,-(sp)
    626e:	2f00           	move.l d0,-(sp)
    6270:	2f2f 01d0      	move.l 464(sp),-(sp)
    6274:	2f2f 0056      	move.l 86(sp),-(sp)
    6278:	4eba 087e      	jsr 6af8 <TestRow>(pc)
    627c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6280:	7030           	moveq #48,d0
    6282:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6286:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<3;i2++) {  
    628a:	52af 00b2      	addq.l #1,178(sp)
    628e:	7202           	moveq #2,d1
    6290:	b2af 00b2      	cmp.l 178(sp),d1
    6294:	6cba           	bge.s 6250 <TestZoom4Picture+0x25ba>
    }
    
    for(int i2=0;i2<15;i2++) {
    6296:	42af 00ae      	clr.l 174(sp)
    629a:	607c           	bra.s 6318 <TestZoom4Picture+0x2682>
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    629c:	222f 00b6      	move.l 182(sp),d1
    62a0:	2001           	move.l d1,d0
    62a2:	eb88           	lsl.l #5,d0
    62a4:	2040           	movea.l d0,a0
    62a6:	d1c1           	adda.l d1,a0
    62a8:	41e8 0013      	lea 19(a0),a0
    62ac:	202f 00ae      	move.l 174(sp),d0
    62b0:	d080           	add.l d0,d0
    62b2:	2208           	move.l a0,d1
    62b4:	d280           	add.l d0,d1
    62b6:	7000           	moveq #0,d0
    62b8:	302f 01c6      	move.w 454(sp),d0
    62bc:	2f01           	move.l d1,-(sp)
    62be:	2f00           	move.l d0,-(sp)
    62c0:	2f2f 01d0      	move.l 464(sp),-(sp)
    62c4:	2f2f 0056      	move.l 86(sp),-(sp)
    62c8:	4eba 082e      	jsr 6af8 <TestRow>(pc)
    62cc:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    62d0:	7030           	moveq #48,d0
    62d2:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    62d6:	222f 00b6      	move.l 182(sp),d1
    62da:	2001           	move.l d1,d0
    62dc:	eb88           	lsl.l #5,d0
    62de:	2040           	movea.l d0,a0
    62e0:	d1c1           	adda.l d1,a0
    62e2:	41e8 0013      	lea 19(a0),a0
    62e6:	202f 00ae      	move.l 174(sp),d0
    62ea:	d080           	add.l d0,d0
    62ec:	2208           	move.l a0,d1
    62ee:	d280           	add.l d0,d1
    62f0:	7000           	moveq #0,d0
    62f2:	302f 01c6      	move.w 454(sp),d0
    62f6:	2f01           	move.l d1,-(sp)
    62f8:	2f00           	move.l d0,-(sp)
    62fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    62fe:	2f2f 0056      	move.l 86(sp),-(sp)
    6302:	4eba 07f4      	jsr 6af8 <TestRow>(pc)
    6306:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    630a:	7230           	moveq #48,d1
    630c:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6310:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {
    6314:	52af 00ae      	addq.l #1,174(sp)
    6318:	700e           	moveq #14,d0
    631a:	b0af 00ae      	cmp.l 174(sp),d0
    631e:	6c00 ff7c      	bge.w 629c <TestZoom4Picture+0x2606>
  for(int i=0;i<7;i++) {
    6322:	52af 00b6      	addq.l #1,182(sp)
    6326:	7206           	moveq #6,d1
    6328:	b2af 00b6      	cmp.l 182(sp),d1
    632c:	6c00 ff1c      	bge.w 624a <TestZoom4Picture+0x25b4>
    }
  }

  for(int i2=0;i2<3;i2++) {  
    6330:	42af 00aa      	clr.l 170(sp)
    6334:	6032           	bra.s 6368 <TestZoom4Picture+0x26d2>
    TestRow( valsupposed, valactual, mask, 247+i2);
    6336:	222f 00aa      	move.l 170(sp),d1
    633a:	0681 0000 00f7 	addi.l #247,d1
    6340:	7000           	moveq #0,d0
    6342:	302f 01c6      	move.w 454(sp),d0
    6346:	2f01           	move.l d1,-(sp)
    6348:	2f00           	move.l d0,-(sp)
    634a:	2f2f 01d0      	move.l 464(sp),-(sp)
    634e:	2f2f 0056      	move.l 86(sp),-(sp)
    6352:	4eba 07a4      	jsr 6af8 <TestRow>(pc)
    6356:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    635a:	7030           	moveq #48,d0
    635c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6360:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<3;i2++) {  
    6364:	52af 00aa      	addq.l #1,170(sp)
    6368:	7202           	moveq #2,d1
    636a:	b2af 00aa      	cmp.l 170(sp),d1
    636e:	6cc6           	bge.s 6336 <TestZoom4Picture+0x26a0>
  }

  for(int i2=0;i2<10;i2++) {
    6370:	42af 00a6      	clr.l 166(sp)
    6374:	6060           	bra.s 63d6 <TestZoom4Picture+0x2740>
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    6376:	707d           	moveq #125,d0
    6378:	d0af 00a6      	add.l 166(sp),d0
    637c:	d080           	add.l d0,d0
    637e:	2200           	move.l d0,d1
    6380:	7000           	moveq #0,d0
    6382:	302f 01c6      	move.w 454(sp),d0
    6386:	2f01           	move.l d1,-(sp)
    6388:	2f00           	move.l d0,-(sp)
    638a:	2f2f 01d0      	move.l 464(sp),-(sp)
    638e:	2f2f 0056      	move.l 86(sp),-(sp)
    6392:	4eba 0764      	jsr 6af8 <TestRow>(pc)
    6396:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    639a:	7030           	moveq #48,d0
    639c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    63a0:	202f 00a6      	move.l 166(sp),d0
    63a4:	d080           	add.l d0,d0
    63a6:	2200           	move.l d0,d1
    63a8:	0681 0000 00fb 	addi.l #251,d1
    63ae:	7000           	moveq #0,d0
    63b0:	302f 01c6      	move.w 454(sp),d0
    63b4:	2f01           	move.l d1,-(sp)
    63b6:	2f00           	move.l d0,-(sp)
    63b8:	2f2f 01d0      	move.l 464(sp),-(sp)
    63bc:	2f2f 0056      	move.l 86(sp),-(sp)
    63c0:	4eba 0736      	jsr 6af8 <TestRow>(pc)
    63c4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    63c8:	7230           	moveq #48,d1
    63ca:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    63ce:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {
    63d2:	52af 00a6      	addq.l #1,166(sp)
    63d6:	7009           	moveq #9,d0
    63d8:	b0af 00a6      	cmp.l 166(sp),d0
    63dc:	6c98           	bge.s 6376 <TestZoom4Picture+0x26e0>
  }

  tmp = source;
    63de:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    63e4:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    63ea:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    63f0:	4878 0001      	pea 1 <_start+0x1>
    63f4:	4878 000f      	pea f <_start+0xf>
    63f8:	2f2f 0056      	move.l 86(sp),-(sp)
    63fc:	2f2f 006a      	move.l 106(sp),-(sp)
    6400:	4eba b698      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    6404:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6408:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    640e:	2c40           	movea.l d0,a6
    6410:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6414:	222f 004e      	move.l 78(sp),d1
    6418:	5881           	addq.l #4,d1
    641a:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom16;
    641e:	2f7c 0000 bb88 	move.l #48008,74(sp)
    6424:	004a 

  mask = 0x0000;
    6426:	426f 01c6      	clr.w 454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    642a:	7000           	moveq #0,d0
    642c:	302f 01c6      	move.w 454(sp),d0
    6430:	42a7           	clr.l -(sp)
    6432:	2f00           	move.l d0,-(sp)
    6434:	2f2f 01d0      	move.l 464(sp),-(sp)
    6438:	2f2f 0056      	move.l 86(sp),-(sp)
    643c:	4eba 06ba      	jsr 6af8 <TestRow>(pc)
    6440:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6444:	7030           	moveq #48,d0
    6446:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    644a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    644e:	42af 00a2      	clr.l 162(sp)
    6452:	605a           	bra.s 64ae <TestZoom4Picture+0x2818>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6454:	202f 00a2      	move.l 162(sp),d0
    6458:	d080           	add.l d0,d0
    645a:	2200           	move.l d0,d1
    645c:	7000           	moveq #0,d0
    645e:	302f 01c6      	move.w 454(sp),d0
    6462:	2f01           	move.l d1,-(sp)
    6464:	2f00           	move.l d0,-(sp)
    6466:	2f2f 01d0      	move.l 464(sp),-(sp)
    646a:	2f2f 0056      	move.l 86(sp),-(sp)
    646e:	4eba 0688      	jsr 6af8 <TestRow>(pc)
    6472:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6476:	7230           	moveq #48,d1
    6478:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    647c:	202f 00a2      	move.l 162(sp),d0
    6480:	d080           	add.l d0,d0
    6482:	2200           	move.l d0,d1
    6484:	5281           	addq.l #1,d1
    6486:	7000           	moveq #0,d0
    6488:	302f 01c6      	move.w 454(sp),d0
    648c:	2f01           	move.l d1,-(sp)
    648e:	2f00           	move.l d0,-(sp)
    6490:	2f2f 01d0      	move.l 464(sp),-(sp)
    6494:	2f2f 0056      	move.l 86(sp),-(sp)
    6498:	4eba 065e      	jsr 6af8 <TestRow>(pc)
    649c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    64a0:	7030           	moveq #48,d0
    64a2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    64a6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    64aa:	52af 00a2      	addq.l #1,162(sp)
    64ae:	7205           	moveq #5,d1
    64b0:	b2af 00a2      	cmp.l 162(sp),d1
    64b4:	6c9e           	bge.s 6454 <TestZoom4Picture+0x27be>
  }

  for(int i=0;i<7;i++) {
    64b6:	42af 009e      	clr.l 158(sp)
    64ba:	6000 00e6      	bra.w 65a2 <TestZoom4Picture+0x290c>
    for(int i2=0;i2<2;i2++) {  
    64be:	42af 009a      	clr.l 154(sp)
    64c2:	6040           	bra.s 6504 <TestZoom4Picture+0x286e>
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    64c4:	307c 000d      	movea.w #13,a0
    64c8:	d1ef 009a      	adda.l 154(sp),a0
    64cc:	222f 009e      	move.l 158(sp),d1
    64d0:	2001           	move.l d1,d0
    64d2:	e988           	lsl.l #4,d0
    64d4:	d081           	add.l d1,d0
    64d6:	d080           	add.l d0,d0
    64d8:	2208           	move.l a0,d1
    64da:	d280           	add.l d0,d1
    64dc:	7000           	moveq #0,d0
    64de:	302f 01c6      	move.w 454(sp),d0
    64e2:	2f01           	move.l d1,-(sp)
    64e4:	2f00           	move.l d0,-(sp)
    64e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    64ea:	2f2f 0056      	move.l 86(sp),-(sp)
    64ee:	4eba 0608      	jsr 6af8 <TestRow>(pc)
    64f2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    64f6:	7030           	moveq #48,d0
    64f8:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    64fc:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<2;i2++) {  
    6500:	52af 009a      	addq.l #1,154(sp)
    6504:	7201           	moveq #1,d1
    6506:	b2af 009a      	cmp.l 154(sp),d1
    650a:	6cb8           	bge.s 64c4 <TestZoom4Picture+0x282e>
    }
    
    for(int i2=0;i2<16;i2++) {
    650c:	42af 0096      	clr.l 150(sp)
    6510:	6000 0082      	bra.w 6594 <TestZoom4Picture+0x28fe>
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    6514:	222f 009e      	move.l 158(sp),d1
    6518:	2001           	move.l d1,d0
    651a:	e988           	lsl.l #4,d0
    651c:	d081           	add.l d1,d0
    651e:	d080           	add.l d0,d0
    6520:	2040           	movea.l d0,a0
    6522:	41e8 0010      	lea 16(a0),a0
    6526:	202f 0096      	move.l 150(sp),d0
    652a:	d080           	add.l d0,d0
    652c:	2208           	move.l a0,d1
    652e:	d280           	add.l d0,d1
    6530:	7000           	moveq #0,d0
    6532:	302f 01c6      	move.w 454(sp),d0
    6536:	2f01           	move.l d1,-(sp)
    6538:	2f00           	move.l d0,-(sp)
    653a:	2f2f 01d0      	move.l 464(sp),-(sp)
    653e:	2f2f 0056      	move.l 86(sp),-(sp)
    6542:	4eba 05b4      	jsr 6af8 <TestRow>(pc)
    6546:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    654a:	7030           	moveq #48,d0
    654c:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    6550:	222f 009e      	move.l 158(sp),d1
    6554:	2001           	move.l d1,d0
    6556:	e988           	lsl.l #4,d0
    6558:	d081           	add.l d1,d0
    655a:	d080           	add.l d0,d0
    655c:	2040           	movea.l d0,a0
    655e:	41e8 0011      	lea 17(a0),a0
    6562:	202f 0096      	move.l 150(sp),d0
    6566:	d080           	add.l d0,d0
    6568:	2208           	move.l a0,d1
    656a:	d280           	add.l d0,d1
    656c:	7000           	moveq #0,d0
    656e:	302f 01c6      	move.w 454(sp),d0
    6572:	2f01           	move.l d1,-(sp)
    6574:	2f00           	move.l d0,-(sp)
    6576:	2f2f 01d0      	move.l 464(sp),-(sp)
    657a:	2f2f 0056      	move.l 86(sp),-(sp)
    657e:	4eba 0578      	jsr 6af8 <TestRow>(pc)
    6582:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6586:	7230           	moveq #48,d1
    6588:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    658c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {
    6590:	52af 0096      	addq.l #1,150(sp)
    6594:	700f           	moveq #15,d0
    6596:	b0af 0096      	cmp.l 150(sp),d0
    659a:	6c00 ff78      	bge.w 6514 <TestZoom4Picture+0x287e>
  for(int i=0;i<7;i++) {
    659e:	52af 009e      	addq.l #1,158(sp)
    65a2:	7206           	moveq #6,d1
    65a4:	b2af 009e      	cmp.l 158(sp),d1
    65a8:	6c00 ff14      	bge.w 64be <TestZoom4Picture+0x2828>
    }
  }

  for(int i2=0;i2<2;i2++) {
    65ac:	42af 0092      	clr.l 146(sp)
    65b0:	6032           	bra.s 65e4 <TestZoom4Picture+0x294e>
    TestRow( valsupposed, valactual, mask, 251+i2);
    65b2:	222f 0092      	move.l 146(sp),d1
    65b6:	0681 0000 00fb 	addi.l #251,d1
    65bc:	7000           	moveq #0,d0
    65be:	302f 01c6      	move.w 454(sp),d0
    65c2:	2f01           	move.l d1,-(sp)
    65c4:	2f00           	move.l d0,-(sp)
    65c6:	2f2f 01d0      	move.l 464(sp),-(sp)
    65ca:	2f2f 0056      	move.l 86(sp),-(sp)
    65ce:	4eba 0528      	jsr 6af8 <TestRow>(pc)
    65d2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    65d6:	7030           	moveq #48,d0
    65d8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    65dc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<2;i2++) {
    65e0:	52af 0092      	addq.l #1,146(sp)
    65e4:	7201           	moveq #1,d1
    65e6:	b2af 0092      	cmp.l 146(sp),d1
    65ea:	6cc6           	bge.s 65b2 <TestZoom4Picture+0x291c>
  }

  for(int i2=0;i2<8;i2++) {
    65ec:	42af 008e      	clr.l 142(sp)
    65f0:	6060           	bra.s 6652 <TestZoom4Picture+0x29bc>
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    65f2:	202f 008e      	move.l 142(sp),d0
    65f6:	d080           	add.l d0,d0
    65f8:	2200           	move.l d0,d1
    65fa:	0681 0000 00fd 	addi.l #253,d1
    6600:	7000           	moveq #0,d0
    6602:	302f 01c6      	move.w 454(sp),d0
    6606:	2f01           	move.l d1,-(sp)
    6608:	2f00           	move.l d0,-(sp)
    660a:	2f2f 01d0      	move.l 464(sp),-(sp)
    660e:	2f2f 0056      	move.l 86(sp),-(sp)
    6612:	4eba 04e4      	jsr 6af8 <TestRow>(pc)
    6616:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    661a:	7030           	moveq #48,d0
    661c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    6620:	707f           	moveq #127,d0
    6622:	d0af 008e      	add.l 142(sp),d0
    6626:	d080           	add.l d0,d0
    6628:	2200           	move.l d0,d1
    662a:	7000           	moveq #0,d0
    662c:	302f 01c6      	move.w 454(sp),d0
    6630:	2f01           	move.l d1,-(sp)
    6632:	2f00           	move.l d0,-(sp)
    6634:	2f2f 01d0      	move.l 464(sp),-(sp)
    6638:	2f2f 0056      	move.l 86(sp),-(sp)
    663c:	4eba 04ba      	jsr 6af8 <TestRow>(pc)
    6640:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6644:	7230           	moveq #48,d1
    6646:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    664a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    664e:	52af 008e      	addq.l #1,142(sp)
    6652:	7007           	moveq #7,d0
    6654:	b0af 008e      	cmp.l 142(sp),d0
    6658:	6c98           	bge.s 65f2 <TestZoom4Picture+0x295c>
  }

  tmp = source;
    665a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6660:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6666:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    666c:	4878 0001      	pea 1 <_start+0x1>
    6670:	4878 0010      	pea 10 <_start+0x10>
    6674:	2f2f 0056      	move.l 86(sp),-(sp)
    6678:	2f2f 006a      	move.l 106(sp),-(sp)
    667c:	4eba b41c      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    6680:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6684:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    668a:	2c40           	movea.l d0,a6
    668c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6690:	222f 004e      	move.l 78(sp),d1
    6694:	5881           	addq.l #4,d1
    6696:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom17;
    669a:	2f7c 0000 bbb4 	move.l #48052,74(sp)
    66a0:	004a 

  mask = 0xffff;
    66a2:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<5;i2++) {
    66a8:	42af 008a      	clr.l 138(sp)
    66ac:	605a           	bra.s 6708 <TestZoom4Picture+0x2a72>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    66ae:	202f 008a      	move.l 138(sp),d0
    66b2:	d080           	add.l d0,d0
    66b4:	2200           	move.l d0,d1
    66b6:	7000           	moveq #0,d0
    66b8:	302f 01c6      	move.w 454(sp),d0
    66bc:	2f01           	move.l d1,-(sp)
    66be:	2f00           	move.l d0,-(sp)
    66c0:	2f2f 01d0      	move.l 464(sp),-(sp)
    66c4:	2f2f 0056      	move.l 86(sp),-(sp)
    66c8:	4eba 042e      	jsr 6af8 <TestRow>(pc)
    66cc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66d0:	7030           	moveq #48,d0
    66d2:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    66d6:	202f 008a      	move.l 138(sp),d0
    66da:	d080           	add.l d0,d0
    66dc:	2200           	move.l d0,d1
    66de:	5281           	addq.l #1,d1
    66e0:	7000           	moveq #0,d0
    66e2:	302f 01c6      	move.w 454(sp),d0
    66e6:	2f01           	move.l d1,-(sp)
    66e8:	2f00           	move.l d0,-(sp)
    66ea:	2f2f 01d0      	move.l 464(sp),-(sp)
    66ee:	2f2f 0056      	move.l 86(sp),-(sp)
    66f2:	4eba 0404      	jsr 6af8 <TestRow>(pc)
    66f6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66fa:	7230           	moveq #48,d1
    66fc:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6700:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {
    6704:	52af 008a      	addq.l #1,138(sp)
    6708:	7004           	moveq #4,d0
    670a:	b0af 008a      	cmp.l 138(sp),d0
    670e:	6c9e           	bge.s 66ae <TestZoom4Picture+0x2a18>
  }

  for(int i=0;i<7;i++) {
    6710:	42af 0086      	clr.l 134(sp)
    6714:	6000 00d4      	bra.w 67ea <TestZoom4Picture+0x2b54>
      TestRow( valsupposed, valactual, mask, 10+i*35);
    6718:	222f 0086      	move.l 134(sp),d1
    671c:	2001           	move.l d1,d0
    671e:	e988           	lsl.l #4,d0
    6720:	d081           	add.l d1,d0
    6722:	d080           	add.l d0,d0
    6724:	2040           	movea.l d0,a0
    6726:	d1c1           	adda.l d1,a0
    6728:	41e8 000a      	lea 10(a0),a0
    672c:	7000           	moveq #0,d0
    672e:	302f 01c6      	move.w 454(sp),d0
    6732:	2f08           	move.l a0,-(sp)
    6734:	2f00           	move.l d0,-(sp)
    6736:	2f2f 01d0      	move.l 464(sp),-(sp)
    673a:	2f2f 0056      	move.l 86(sp),-(sp)
    673e:	4eba 03b8      	jsr 6af8 <TestRow>(pc)
    6742:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6746:	7230           	moveq #48,d1
    6748:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    674c:	466f 01c6      	not.w 454(sp)
    
    for(int i2=0;i2<17;i2++) {
    6750:	42af 0082      	clr.l 130(sp)
    6754:	6000 0086      	bra.w 67dc <TestZoom4Picture+0x2b46>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6758:	222f 0086      	move.l 134(sp),d1
    675c:	2001           	move.l d1,d0
    675e:	e988           	lsl.l #4,d0
    6760:	d081           	add.l d1,d0
    6762:	d080           	add.l d0,d0
    6764:	2040           	movea.l d0,a0
    6766:	d1c1           	adda.l d1,a0
    6768:	41e8 000b      	lea 11(a0),a0
    676c:	202f 0082      	move.l 130(sp),d0
    6770:	d080           	add.l d0,d0
    6772:	2208           	move.l a0,d1
    6774:	d280           	add.l d0,d1
    6776:	7000           	moveq #0,d0
    6778:	302f 01c6      	move.w 454(sp),d0
    677c:	2f01           	move.l d1,-(sp)
    677e:	2f00           	move.l d0,-(sp)
    6780:	2f2f 01d0      	move.l 464(sp),-(sp)
    6784:	2f2f 0056      	move.l 86(sp),-(sp)
    6788:	4eba 036e      	jsr 6af8 <TestRow>(pc)
    678c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6790:	7030           	moveq #48,d0
    6792:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6796:	222f 0086      	move.l 134(sp),d1
    679a:	2001           	move.l d1,d0
    679c:	e988           	lsl.l #4,d0
    679e:	d081           	add.l d1,d0
    67a0:	d080           	add.l d0,d0
    67a2:	2040           	movea.l d0,a0
    67a4:	d1c1           	adda.l d1,a0
    67a6:	41e8 000c      	lea 12(a0),a0
    67aa:	202f 0082      	move.l 130(sp),d0
    67ae:	d080           	add.l d0,d0
    67b0:	2208           	move.l a0,d1
    67b2:	d280           	add.l d0,d1
    67b4:	7000           	moveq #0,d0
    67b6:	302f 01c6      	move.w 454(sp),d0
    67ba:	2f01           	move.l d1,-(sp)
    67bc:	2f00           	move.l d0,-(sp)
    67be:	2f2f 01d0      	move.l 464(sp),-(sp)
    67c2:	2f2f 0056      	move.l 86(sp),-(sp)
    67c6:	4eba 0330      	jsr 6af8 <TestRow>(pc)
    67ca:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    67ce:	7230           	moveq #48,d1
    67d0:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    67d4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<17;i2++) {
    67d8:	52af 0082      	addq.l #1,130(sp)
    67dc:	7010           	moveq #16,d0
    67de:	b0af 0082      	cmp.l 130(sp),d0
    67e2:	6c00 ff74      	bge.w 6758 <TestZoom4Picture+0x2ac2>
  for(int i=0;i<7;i++) {
    67e6:	52af 0086      	addq.l #1,134(sp)
    67ea:	7206           	moveq #6,d1
    67ec:	b2af 0086      	cmp.l 134(sp),d1
    67f0:	6c00 ff26      	bge.w 6718 <TestZoom4Picture+0x2a82>
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    67f4:	7000           	moveq #0,d0
    67f6:	302f 01c6      	move.w 454(sp),d0
    67fa:	4878 00ff      	pea ff <FreeDisplay+0x1f>
    67fe:	2f00           	move.l d0,-(sp)
    6800:	2f2f 01d0      	move.l 464(sp),-(sp)
    6804:	2f2f 0056      	move.l 86(sp),-(sp)
    6808:	4eba 02ee      	jsr 6af8 <TestRow>(pc)
    680c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6810:	7030           	moveq #48,d0
    6812:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6816:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<7;i2++) {
    681a:	42af 007e      	clr.l 126(sp)
    681e:	6064           	bra.s 6884 <TestZoom4Picture+0x2bee>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6820:	202f 007e      	move.l 126(sp),d0
    6824:	0680 0000 0080 	addi.l #128,d0
    682a:	d080           	add.l d0,d0
    682c:	2200           	move.l d0,d1
    682e:	7000           	moveq #0,d0
    6830:	302f 01c6      	move.w 454(sp),d0
    6834:	2f01           	move.l d1,-(sp)
    6836:	2f00           	move.l d0,-(sp)
    6838:	2f2f 01d0      	move.l 464(sp),-(sp)
    683c:	2f2f 0056      	move.l 86(sp),-(sp)
    6840:	4eba 02b6      	jsr 6af8 <TestRow>(pc)
    6844:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6848:	7230           	moveq #48,d1
    684a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    684e:	202f 007e      	move.l 126(sp),d0
    6852:	d080           	add.l d0,d0
    6854:	2200           	move.l d0,d1
    6856:	0681 0000 0101 	addi.l #257,d1
    685c:	7000           	moveq #0,d0
    685e:	302f 01c6      	move.w 454(sp),d0
    6862:	2f01           	move.l d1,-(sp)
    6864:	2f00           	move.l d0,-(sp)
    6866:	2f2f 01d0      	move.l 464(sp),-(sp)
    686a:	2f2f 0056      	move.l 86(sp),-(sp)
    686e:	4eba 0288      	jsr 6af8 <TestRow>(pc)
    6872:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6876:	7030           	moveq #48,d0
    6878:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    687c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {
    6880:	52af 007e      	addq.l #1,126(sp)
    6884:	7206           	moveq #6,d1
    6886:	b2af 007e      	cmp.l 126(sp),d1
    688a:	6c94           	bge.s 6820 <TestZoom4Picture+0x2b8a>
  }   

  tmp = source;
    688c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6892:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6898:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    689e:	4878 0001      	pea 1 <_start+0x1>
    68a2:	4878 0011      	pea 11 <_start+0x11>
    68a6:	2f2f 0056      	move.l 86(sp),-(sp)
    68aa:	2f2f 006a      	move.l 106(sp),-(sp)
    68ae:	4eba b1ea      	jsr 1a9a <Zoom_ZoomIntoPicture>(pc)
    68b2:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    68b6:	2039 0016 b85c 	move.l 16b85c <GfxBase>,d0
    68bc:	2c40           	movea.l d0,a6
    68be:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    68c2:	202f 004e      	move.l 78(sp),d0
    68c6:	5880           	addq.l #4,d0
    68c8:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom18;
    68cc:	2f7c 0000 bbe0 	move.l #48096,74(sp)
    68d2:	004a 

  mask = 0xffff;
    68d4:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);
    68da:	7000           	moveq #0,d0
    68dc:	302f 01c6      	move.w 454(sp),d0
    68e0:	42a7           	clr.l -(sp)
    68e2:	2f00           	move.l d0,-(sp)
    68e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    68e8:	2f2f 0056      	move.l 86(sp),-(sp)
    68ec:	4eba 020a      	jsr 6af8 <TestRow>(pc)
    68f0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    68f4:	7230           	moveq #48,d1
    68f6:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    68fa:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<4;i2++) {
    68fe:	42af 007a      	clr.l 122(sp)
    6902:	605c           	bra.s 6960 <TestZoom4Picture+0x2cca>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    6904:	202f 007a      	move.l 122(sp),d0
    6908:	d080           	add.l d0,d0
    690a:	2200           	move.l d0,d1
    690c:	5281           	addq.l #1,d1
    690e:	7000           	moveq #0,d0
    6910:	302f 01c6      	move.w 454(sp),d0
    6914:	2f01           	move.l d1,-(sp)
    6916:	2f00           	move.l d0,-(sp)
    6918:	2f2f 01d0      	move.l 464(sp),-(sp)
    691c:	2f2f 0056      	move.l 86(sp),-(sp)
    6920:	4eba 01d6      	jsr 6af8 <TestRow>(pc)
    6924:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6928:	7030           	moveq #48,d0
    692a:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    692e:	202f 007a      	move.l 122(sp),d0
    6932:	5280           	addq.l #1,d0
    6934:	d080           	add.l d0,d0
    6936:	2200           	move.l d0,d1
    6938:	7000           	moveq #0,d0
    693a:	302f 01c6      	move.w 454(sp),d0
    693e:	2f01           	move.l d1,-(sp)
    6940:	2f00           	move.l d0,-(sp)
    6942:	2f2f 01d0      	move.l 464(sp),-(sp)
    6946:	2f2f 0056      	move.l 86(sp),-(sp)
    694a:	4eba 01ac      	jsr 6af8 <TestRow>(pc)
    694e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6952:	7230           	moveq #48,d1
    6954:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6958:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    695c:	52af 007a      	addq.l #1,122(sp)
    6960:	7003           	moveq #3,d0
    6962:	b0af 007a      	cmp.l 122(sp),d0
    6966:	6c9c           	bge.s 6904 <TestZoom4Picture+0x2c6e>
  }

  for(int i=0;i<7;i++) {  
    6968:	42af 0076      	clr.l 118(sp)
    696c:	6000 009c      	bra.w 6a0a <TestZoom4Picture+0x2d74>
    for(int i2=0;i2<18;i2++) {
    6970:	42af 0072      	clr.l 114(sp)
    6974:	6000 0086      	bra.w 69fc <TestZoom4Picture+0x2d66>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6978:	222f 0076      	move.l 118(sp),d1
    697c:	2001           	move.l d1,d0
    697e:	e988           	lsl.l #4,d0
    6980:	d081           	add.l d1,d0
    6982:	d080           	add.l d0,d0
    6984:	2040           	movea.l d0,a0
    6986:	d1c1           	adda.l d1,a0
    6988:	41e8 000b      	lea 11(a0),a0
    698c:	202f 0072      	move.l 114(sp),d0
    6990:	d080           	add.l d0,d0
    6992:	2208           	move.l a0,d1
    6994:	d280           	add.l d0,d1
    6996:	7000           	moveq #0,d0
    6998:	302f 01c6      	move.w 454(sp),d0
    699c:	2f01           	move.l d1,-(sp)
    699e:	2f00           	move.l d0,-(sp)
    69a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    69a4:	2f2f 0056      	move.l 86(sp),-(sp)
    69a8:	4eba 014e      	jsr 6af8 <TestRow>(pc)
    69ac:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    69b0:	7230           	moveq #48,d1
    69b2:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    69b6:	222f 0076      	move.l 118(sp),d1
    69ba:	2001           	move.l d1,d0
    69bc:	e988           	lsl.l #4,d0
    69be:	d081           	add.l d1,d0
    69c0:	d080           	add.l d0,d0
    69c2:	2040           	movea.l d0,a0
    69c4:	d1c1           	adda.l d1,a0
    69c6:	41e8 000c      	lea 12(a0),a0
    69ca:	202f 0072      	move.l 114(sp),d0
    69ce:	d080           	add.l d0,d0
    69d0:	2208           	move.l a0,d1
    69d2:	d280           	add.l d0,d1
    69d4:	7000           	moveq #0,d0
    69d6:	302f 01c6      	move.w 454(sp),d0
    69da:	2f01           	move.l d1,-(sp)
    69dc:	2f00           	move.l d0,-(sp)
    69de:	2f2f 01d0      	move.l 464(sp),-(sp)
    69e2:	2f2f 0056      	move.l 86(sp),-(sp)
    69e6:	4eba 0110      	jsr 6af8 <TestRow>(pc)
    69ea:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    69ee:	7030           	moveq #48,d0
    69f0:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    69f4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) {
    69f8:	52af 0072      	addq.l #1,114(sp)
    69fc:	7211           	moveq #17,d1
    69fe:	b2af 0072      	cmp.l 114(sp),d1
    6a02:	6c00 ff74      	bge.w 6978 <TestZoom4Picture+0x2ce2>
  for(int i=0;i<7;i++) {  
    6a06:	52af 0076      	addq.l #1,118(sp)
    6a0a:	7006           	moveq #6,d0
    6a0c:	b0af 0076      	cmp.l 118(sp),d0
    6a10:	6c00 ff5e      	bge.w 6970 <TestZoom4Picture+0x2cda>
    }
  } 

  for(int i2=0;i2<4;i2++) {
    6a14:	42af 006e      	clr.l 110(sp)
    6a18:	6064           	bra.s 6a7e <TestZoom4Picture+0x2de8>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6a1a:	202f 006e      	move.l 110(sp),d0
    6a1e:	0680 0000 0080 	addi.l #128,d0
    6a24:	d080           	add.l d0,d0
    6a26:	2200           	move.l d0,d1
    6a28:	7000           	moveq #0,d0
    6a2a:	302f 01c6      	move.w 454(sp),d0
    6a2e:	2f01           	move.l d1,-(sp)
    6a30:	2f00           	move.l d0,-(sp)
    6a32:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a36:	2f2f 0056      	move.l 86(sp),-(sp)
    6a3a:	4eba 00bc      	jsr 6af8 <TestRow>(pc)
    6a3e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a42:	7230           	moveq #48,d1
    6a44:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6a48:	202f 006e      	move.l 110(sp),d0
    6a4c:	d080           	add.l d0,d0
    6a4e:	2200           	move.l d0,d1
    6a50:	0681 0000 0101 	addi.l #257,d1
    6a56:	7000           	moveq #0,d0
    6a58:	302f 01c6      	move.w 454(sp),d0
    6a5c:	2f01           	move.l d1,-(sp)
    6a5e:	2f00           	move.l d0,-(sp)
    6a60:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a64:	2f2f 0056      	move.l 86(sp),-(sp)
    6a68:	4eba 008e      	jsr 6af8 <TestRow>(pc)
    6a6c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a70:	7030           	moveq #48,d0
    6a72:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6a76:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6a7a:	52af 006e      	addq.l #1,110(sp)
    6a7e:	7203           	moveq #3,d1
    6a80:	b2af 006e      	cmp.l 110(sp),d1
    6a84:	6c94           	bge.s 6a1a <TestZoom4Picture+0x2d84>
  }
  TestRow( valsupposed, valactual, mask, 0);
    6a86:	7000           	moveq #0,d0
    6a88:	302f 01c6      	move.w 454(sp),d0
    6a8c:	42a7           	clr.l -(sp)
    6a8e:	2f00           	move.l d0,-(sp)
    6a90:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a94:	2f2f 0056      	move.l 86(sp),-(sp)
    6a98:	4eba 005e      	jsr 6af8 <TestRow>(pc)
    6a9c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6aa0:	7030           	moveq #48,d0
    6aa2:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6aa6:	466f 01c6      	not.w 454(sp)
  FreeMem( source, (ZMLINESIZE+4)*272);
    6aaa:	2f6f 005e 0042 	move.l 94(sp),66(sp)
    6ab0:	2f7c 0000 3740 	move.l #14144,62(sp)
    6ab6:	003e 
    6ab8:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    6abe:	2c40           	movea.l d0,a6
    6ac0:	226f 0042      	movea.l 66(sp),a1
    6ac4:	202f 003e      	move.l 62(sp),d0
    6ac8:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    6acc:	2f6f 004e 003a 	move.l 78(sp),58(sp)
    6ad2:	2f7c 0000 3740 	move.l #14144,54(sp)
    6ad8:	0036 
    6ada:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    6ae0:	2c40           	movea.l d0,a6
    6ae2:	226f 003a      	movea.l 58(sp),a1
    6ae6:	202f 0036      	move.l 54(sp),d0
    6aea:	4eae ff2e      	jsr -210(a6)
}
    6aee:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    6af2:	4fef 01d0      	lea 464(sp),sp
    6af6:	4e75           	rts

00006af8 <TestRow>:

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    6af8:	4fef ff40      	lea -192(sp),sp
    6afc:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
    6b00:	202f 00e0      	move.l 224(sp),d0
    6b04:	3000           	move.w d0,d0
    6b06:	3f40 0016      	move.w d0,22(sp)
  
  char str[ 100] = { 0 };
    6b0a:	42af 001c      	clr.l 28(sp)
    6b0e:	7020           	moveq #32,d0
    6b10:	d08f           	add.l sp,d0
    6b12:	7260           	moveq #96,d1
    6b14:	2f01           	move.l d1,-(sp)
    6b16:	42a7           	clr.l -(sp)
    6b18:	2f00           	move.l d0,-(sp)
    6b1a:	4eba 020c      	jsr 6d28 <memset>(pc)
    6b1e:	4fef 000c      	lea 12(sp),sp
  UWORD data[2];
  data[1] = numberofline;
    6b22:	202f 00e4      	move.l 228(sp),d0
    6b26:	3f40 001a      	move.w d0,26(sp)

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    6b2a:	42af 00d0      	clr.l 208(sp)
    6b2e:	6000 00d4      	bra.w 6c04 <TestRow+0x10c>
    if( (*testpattern++ ^ xormask) != *destination++) {
    6b32:	202f 00d8      	move.l 216(sp),d0
    6b36:	2200           	move.l d0,d1
    6b38:	5481           	addq.l #2,d1
    6b3a:	2f41 00d8      	move.l d1,216(sp)
    6b3e:	2040           	movea.l d0,a0
    6b40:	3010           	move.w (a0),d0
    6b42:	322f 0016      	move.w 22(sp),d1
    6b46:	b141           	eor.w d0,d1
    6b48:	202f 00dc      	move.l 220(sp),d0
    6b4c:	2400           	move.l d0,d2
    6b4e:	5482           	addq.l #2,d2
    6b50:	2f42 00dc      	move.l d2,220(sp)
    6b54:	2040           	movea.l d0,a0
    6b56:	3010           	move.w (a0),d0
    6b58:	b041           	cmp.w d1,d0
    6b5a:	6700 00a4      	beq.w 6c00 <TestRow+0x108>
      data[0] = i;
    6b5e:	202f 00d0      	move.l 208(sp),d0
    6b62:	3f40 0018      	move.w d0,24(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    6b66:	2f7c 0000 82df 	move.l #33503,164(sp)
    6b6c:	00a4 
    6b6e:	702b           	moveq #43,d0
    6b70:	4600           	not.b d0
    6b72:	d08f           	add.l sp,d0
    6b74:	0680 ffff ff44 	addi.l #-188,d0
    6b7a:	2f40 00a0      	move.l d0,160(sp)
    6b7e:	2f7c 0000 71c8 	move.l #29128,156(sp)
    6b84:	009c 
    6b86:	722b           	moveq #43,d1
    6b88:	4601           	not.b d1
    6b8a:	d28f           	add.l sp,d1
    6b8c:	0681 ffff ff48 	addi.l #-184,d1
    6b92:	2f41 0098      	move.l d1,152(sp)
    6b96:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    6b9c:	2c40           	movea.l d0,a6
    6b9e:	206f 00a4      	movea.l 164(sp),a0
    6ba2:	226f 00a0      	movea.l 160(sp),a1
    6ba6:	246f 009c      	movea.l 156(sp),a2
    6baa:	266f 0098      	movea.l 152(sp),a3
    6bae:	4eae fdf6      	jsr -522(a6)
    6bb2:	2f40 0094      	move.l d0,148(sp)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    6bb6:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    6bbc:	2c40           	movea.l d0,a6
    6bbe:	4eae ffc4      	jsr -60(a6)
    6bc2:	2f40 0090      	move.l d0,144(sp)
    6bc6:	202f 0090      	move.l 144(sp),d0
    6bca:	2f40 008c      	move.l d0,140(sp)
    6bce:	742b           	moveq #43,d2
    6bd0:	4602           	not.b d2
    6bd2:	d48f           	add.l sp,d2
    6bd4:	0682 ffff ff48 	addi.l #-184,d2
    6bda:	2f42 0088      	move.l d2,136(sp)
    6bde:	7064           	moveq #100,d0
    6be0:	2f40 0084      	move.l d0,132(sp)
    6be4:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    6bea:	2c40           	movea.l d0,a6
    6bec:	222f 008c      	move.l 140(sp),d1
    6bf0:	242f 0088      	move.l 136(sp),d2
    6bf4:	262f 0084      	move.l 132(sp),d3
    6bf8:	4eae ffd0      	jsr -48(a6)
    6bfc:	2f40 0080      	move.l d0,128(sp)
  for(int i=0;i<21;i++) {
    6c00:	52af 00d0      	addq.l #1,208(sp)
    6c04:	7214           	moveq #20,d1
    6c06:	b2af 00d0      	cmp.l 208(sp),d1
    6c0a:	6c00 ff26      	bge.w 6b32 <TestRow+0x3a>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    6c0e:	206f 00d8      	movea.l 216(sp),a0
    6c12:	3010           	move.w (a0),d0
    6c14:	322f 0016      	move.w 22(sp),d1
    6c18:	b141           	eor.w d0,d1
    6c1a:	206f 00dc      	movea.l 220(sp),a0
    6c1e:	3010           	move.w (a0),d0
    6c20:	b340           	eor.w d1,d0
    6c22:	3000           	move.w d0,d0
    6c24:	0280 0000 ffff 	andi.l #65535,d0
    6c2a:	0280 0000 ff00 	andi.l #65280,d0
    6c30:	6700 00cc      	beq.w 6cfe <TestRow+0x206>
    data[0] = 21;
    6c34:	3f7c 0015 0018 	move.w #21,24(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    6c3a:	2f7c 0000 82df 	move.l #33503,204(sp)
    6c40:	00cc 
    6c42:	742b           	moveq #43,d2
    6c44:	4602           	not.b d2
    6c46:	d48f           	add.l sp,d2
    6c48:	0682 ffff ff44 	addi.l #-188,d2
    6c4e:	2f42 00c8      	move.l d2,200(sp)
    6c52:	2f7c 0000 71c8 	move.l #29128,196(sp)
    6c58:	00c4 
    6c5a:	702b           	moveq #43,d0
    6c5c:	4600           	not.b d0
    6c5e:	d08f           	add.l sp,d0
    6c60:	0680 ffff ff48 	addi.l #-184,d0
    6c66:	2f40 00c0      	move.l d0,192(sp)
    6c6a:	2039 0016 b850 	move.l 16b850 <SysBase>,d0
    6c70:	2c40           	movea.l d0,a6
    6c72:	206f 00cc      	movea.l 204(sp),a0
    6c76:	226f 00c8      	movea.l 200(sp),a1
    6c7a:	246f 00c4      	movea.l 196(sp),a2
    6c7e:	266f 00c0      	movea.l 192(sp),a3
    6c82:	4eae fdf6      	jsr -522(a6)
    6c86:	2f40 00bc      	move.l d0,188(sp)
                                                                           str);
    Write(  Output(), str, 100);
    6c8a:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    6c90:	2c40           	movea.l d0,a6
    6c92:	4eae ffc4      	jsr -60(a6)
    6c96:	2f40 00b8      	move.l d0,184(sp)
    6c9a:	202f 00b8      	move.l 184(sp),d0
    6c9e:	2f40 00b4      	move.l d0,180(sp)
    6ca2:	722b           	moveq #43,d1
    6ca4:	4601           	not.b d1
    6ca6:	d28f           	add.l sp,d1
    6ca8:	0681 ffff ff48 	addi.l #-184,d1
    6cae:	2f41 00b0      	move.l d1,176(sp)
    6cb2:	7464           	moveq #100,d2
    6cb4:	2f42 00ac      	move.l d2,172(sp)
    6cb8:	2039 0016 b858 	move.l 16b858 <DOSBase>,d0
    6cbe:	2c40           	movea.l d0,a6
    6cc0:	222f 00b4      	move.l 180(sp),d1
    6cc4:	242f 00b0      	move.l 176(sp),d2
    6cc8:	262f 00ac      	move.l 172(sp),d3
    6ccc:	4eae ffd0      	jsr -48(a6)
    6cd0:	2f40 00a8      	move.l d0,168(sp)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
    6cd4:	206f 00dc      	movea.l 220(sp),a0
    6cd8:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6cda:	7200           	moveq #0,d1
    6cdc:	3200           	move.w d0,d1
                                                   *testpattern,*destination);
    6cde:	206f 00d8      	movea.l 216(sp),a0
    6ce2:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6ce4:	3000           	move.w d0,d0
    6ce6:	0280 0000 ffff 	andi.l #65535,d0
    6cec:	2f01           	move.l d1,-(sp)
    6cee:	2f00           	move.l d0,-(sp)
    6cf0:	4879 0000 830f 	pea 830f <incbin_swfont_end+0x83b>
    6cf6:	4eba 0162      	jsr 6e5a <KPrintF>(pc)
    6cfa:	4fef 000c      	lea 12(sp),sp
     
  }
}
    6cfe:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    6d02:	4fef 00c0      	lea 192(sp),sp
    6d06:	4e75           	rts

00006d08 <strlen>:
{
    6d08:	598f           	subq.l #4,sp
	unsigned long t=0;
    6d0a:	4297           	clr.l (sp)
    6d0c:	6002           	bra.s 6d10 <strlen+0x8>
		t++;
    6d0e:	5297           	addq.l #1,(sp)
	while(*s++)
    6d10:	202f 0008      	move.l 8(sp),d0
    6d14:	2200           	move.l d0,d1
    6d16:	5281           	addq.l #1,d1
    6d18:	2f41 0008      	move.l d1,8(sp)
    6d1c:	2040           	movea.l d0,a0
    6d1e:	1010           	move.b (a0),d0
    6d20:	66ec           	bne.s 6d0e <strlen+0x6>
	return t;
    6d22:	2017           	move.l (sp),d0
}
    6d24:	588f           	addq.l #4,sp
    6d26:	4e75           	rts

00006d28 <memset>:
{
    6d28:	4e55 fffc      	link.w a5,#-4
	unsigned char *ptr = (unsigned char *)dest;
    6d2c:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
    6d32:	6014           	bra.s 6d48 <memset+0x20>
		*ptr++ = val;
    6d34:	202d fffc      	move.l -4(a5),d0
    6d38:	2200           	move.l d0,d1
    6d3a:	5281           	addq.l #1,d1
    6d3c:	2b41 fffc      	move.l d1,-4(a5)
    6d40:	222d 000c      	move.l 12(a5),d1
    6d44:	2040           	movea.l d0,a0
    6d46:	1081           	move.b d1,(a0)
	while(len-- > 0)
    6d48:	202d 0010      	move.l 16(a5),d0
    6d4c:	2200           	move.l d0,d1
    6d4e:	5381           	subq.l #1,d1
    6d50:	2b41 0010      	move.l d1,16(a5)
    6d54:	4a80           	tst.l d0
    6d56:	66dc           	bne.s 6d34 <memset+0xc>
	return dest;
    6d58:	202d 0008      	move.l 8(a5),d0
}
    6d5c:	4e5d           	unlk a5
    6d5e:	4e75           	rts

00006d60 <memcpy>:
{
    6d60:	4e55 fff8      	link.w a5,#-8
    6d64:	2f02           	move.l d2,-(sp)
	char *d = (char *)dest;
    6d66:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = (const char *)src;
    6d6c:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
    6d72:	6020           	bra.s 6d94 <memcpy+0x34>
		*d++ = *s++;
    6d74:	222d fff8      	move.l -8(a5),d1
    6d78:	2001           	move.l d1,d0
    6d7a:	5280           	addq.l #1,d0
    6d7c:	2b40 fff8      	move.l d0,-8(a5)
    6d80:	202d fffc      	move.l -4(a5),d0
    6d84:	2400           	move.l d0,d2
    6d86:	5282           	addq.l #1,d2
    6d88:	2b42 fffc      	move.l d2,-4(a5)
    6d8c:	2041           	movea.l d1,a0
    6d8e:	1210           	move.b (a0),d1
    6d90:	2040           	movea.l d0,a0
    6d92:	1081           	move.b d1,(a0)
	while(len--)
    6d94:	202d 0010      	move.l 16(a5),d0
    6d98:	2200           	move.l d0,d1
    6d9a:	5381           	subq.l #1,d1
    6d9c:	2b41 0010      	move.l d1,16(a5)
    6da0:	4a80           	tst.l d0
    6da2:	66d0           	bne.s 6d74 <memcpy+0x14>
	return dest;
    6da4:	202d 0008      	move.l 8(a5),d0
}
    6da8:	241f           	move.l (sp)+,d2
    6daa:	4e5d           	unlk a5
    6dac:	4e75           	rts

00006dae <memmove>:
{
    6dae:	4e55 fff0      	link.w a5,#-16
    6db2:	2f02           	move.l d2,-(sp)
	char *d = dest;
    6db4:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = src;
    6dba:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
	if (d < s) {
    6dc0:	202d fffc      	move.l -4(a5),d0
    6dc4:	b0ad fff8      	cmp.l -8(a5),d0
    6dc8:	6522           	bcs.s 6dec <memmove+0x3e>
    6dca:	6032           	bra.s 6dfe <memmove+0x50>
			*d++ = *s++;
    6dcc:	222d fff8      	move.l -8(a5),d1
    6dd0:	2401           	move.l d1,d2
    6dd2:	5282           	addq.l #1,d2
    6dd4:	2b42 fff8      	move.l d2,-8(a5)
    6dd8:	202d fffc      	move.l -4(a5),d0
    6ddc:	2400           	move.l d0,d2
    6dde:	5282           	addq.l #1,d2
    6de0:	2b42 fffc      	move.l d2,-4(a5)
    6de4:	2041           	movea.l d1,a0
    6de6:	1210           	move.b (a0),d1
    6de8:	2040           	movea.l d0,a0
    6dea:	1081           	move.b d1,(a0)
		while (len--)
    6dec:	202d 0010      	move.l 16(a5),d0
    6df0:	2200           	move.l d0,d1
    6df2:	5381           	subq.l #1,d1
    6df4:	2b41 0010      	move.l d1,16(a5)
    6df8:	4a80           	tst.l d0
    6dfa:	66d0           	bne.s 6dcc <memmove+0x1e>
    6dfc:	6052           	bra.s 6e50 <memmove+0xa2>
		const char *lasts = s + (len - 1);
    6dfe:	202d 0010      	move.l 16(a5),d0
    6e02:	5380           	subq.l #1,d0
    6e04:	242d fff8      	move.l -8(a5),d2
    6e08:	d480           	add.l d0,d2
    6e0a:	2b42 fff4      	move.l d2,-12(a5)
		char *lastd = d + (len - 1);
    6e0e:	202d 0010      	move.l 16(a5),d0
    6e12:	5380           	subq.l #1,d0
    6e14:	222d fffc      	move.l -4(a5),d1
    6e18:	d280           	add.l d0,d1
    6e1a:	2b41 fff0      	move.l d1,-16(a5)
    6e1e:	6020           	bra.s 6e40 <memmove+0x92>
			*lastd-- = *lasts--;
    6e20:	222d fff4      	move.l -12(a5),d1
    6e24:	2401           	move.l d1,d2
    6e26:	5382           	subq.l #1,d2
    6e28:	2b42 fff4      	move.l d2,-12(a5)
    6e2c:	202d fff0      	move.l -16(a5),d0
    6e30:	2400           	move.l d0,d2
    6e32:	5382           	subq.l #1,d2
    6e34:	2b42 fff0      	move.l d2,-16(a5)
    6e38:	2041           	movea.l d1,a0
    6e3a:	1210           	move.b (a0),d1
    6e3c:	2040           	movea.l d0,a0
    6e3e:	1081           	move.b d1,(a0)
		while (len--)
    6e40:	202d 0010      	move.l 16(a5),d0
    6e44:	2200           	move.l d0,d1
    6e46:	5381           	subq.l #1,d1
    6e48:	2b41 0010      	move.l d1,16(a5)
    6e4c:	4a80           	tst.l d0
    6e4e:	66d0           	bne.s 6e20 <memmove+0x72>
	return dest;
    6e50:	202d 0008      	move.l 8(a5),d0
}
    6e54:	241f           	move.l (sp)+,d2
    6e56:	4e5d           	unlk a5
    6e58:	4e75           	rts

00006e5a <KPrintF>:
{
    6e5a:	4fef ff80      	lea -128(sp),sp
    6e5e:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    6e62:	3039 00f0 ff60 	move.w f0ff60 <_end+0xda46bc>,d0
    6e68:	0c40 4eb9      	cmpi.w #20153,d0
    6e6c:	6722           	beq.s 6e90 <KPrintF+0x36>
    6e6e:	0c40 a00e      	cmpi.w #-24562,d0
    6e72:	671c           	beq.s 6e90 <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    6e74:	2c79 0016 b850 	movea.l 16b850 <SysBase>,a6
    6e7a:	206f 0090      	movea.l 144(sp),a0
    6e7e:	43ef 0094      	lea 148(sp),a1
    6e82:	45f9 0000 71ba 	lea 71ba <KPutCharX>,a2
    6e88:	97cb           	suba.l a3,a3
    6e8a:	4eae fdf6      	jsr -522(a6)
    6e8e:	602a           	bra.s 6eba <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    6e90:	2c79 0016 b850 	movea.l 16b850 <SysBase>,a6
    6e96:	206f 0090      	movea.l 144(sp),a0
    6e9a:	43ef 0094      	lea 148(sp),a1
    6e9e:	45f9 0000 71c8 	lea 71c8 <PutChar>,a2
    6ea4:	47ef 000c      	lea 12(sp),a3
    6ea8:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    6eac:	2f0b           	move.l a3,-(sp)
    6eae:	4878 0056      	pea 56 <_start+0x56>
    6eb2:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xda46bc>
    6eb8:	508f           	addq.l #8,sp
}
    6eba:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    6ebe:	4fef 0080      	lea 128(sp),sp
    6ec2:	4e75           	rts

00006ec4 <warpmode>:

void warpmode(int on) // bool
{
    6ec4:	518f           	subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
    6ec6:	2f7c 00f0 ff60 	move.l #15794016,4(sp)
    6ecc:	0004 
    if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
    6ece:	206f 0004      	movea.l 4(sp),a0
    6ed2:	3010           	move.w (a0),d0
    6ed4:	0c40 4eb9      	cmpi.w #20153,d0
    6ed8:	670c           	beq.s 6ee6 <warpmode+0x22>
    6eda:	206f 0004      	movea.l 4(sp),a0
    6ede:	3010           	move.w (a0),d0
    6ee0:	0c40 a00e      	cmpi.w #-24562,d0
    6ee4:	6668           	bne.s 6f4e <warpmode+0x8a>
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    6ee6:	4aaf 000c      	tst.l 12(sp)
    6eea:	6708           	beq.s 6ef4 <warpmode+0x30>
    6eec:	203c 0000 8335 	move.l #33589,d0
    6ef2:	6006           	bra.s 6efa <warpmode+0x36>
    6ef4:	203c 0000 833f 	move.l #33599,d0
    6efa:	4878 0001      	pea 1 <_start+0x1>
    6efe:	220f           	move.l sp,d1
    6f00:	5e81           	addq.l #7,d1
    6f02:	2f01           	move.l d1,-(sp)
    6f04:	42a7           	clr.l -(sp)
    6f06:	2f00           	move.l d0,-(sp)
    6f08:	4878 ffff      	pea ffffffff <_end+0xffe9475b>
    6f0c:	4878 0052      	pea 52 <_start+0x52>
    6f10:	206f 001c      	movea.l 28(sp),a0
    6f14:	4e90           	jsr (a0)
    6f16:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    6f1a:	4aaf 000c      	tst.l 12(sp)
    6f1e:	6708           	beq.s 6f28 <warpmode+0x64>
    6f20:	203c 0000 834a 	move.l #33610,d0
    6f26:	6006           	bra.s 6f2e <warpmode+0x6a>
    6f28:	203c 0000 8364 	move.l #33636,d0
    6f2e:	4878 0001      	pea 1 <_start+0x1>
    6f32:	220f           	move.l sp,d1
    6f34:	5e81           	addq.l #7,d1
    6f36:	2f01           	move.l d1,-(sp)
    6f38:	42a7           	clr.l -(sp)
    6f3a:	2f00           	move.l d0,-(sp)
    6f3c:	4878 ffff      	pea ffffffff <_end+0xffe9475b>
    6f40:	4878 0052      	pea 52 <_start+0x52>
    6f44:	206f 001c      	movea.l 28(sp),a0
    6f48:	4e90           	jsr (a0)
    6f4a:	4fef 0018      	lea 24(sp),sp
	}
}
    6f4e:	508f           	addq.l #8,sp
    6f50:	4e75           	rts

00006f52 <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4)
{
    6f52:	598f           	subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
    6f54:	2ebc 00f0 ff60 	move.l #15794016,(sp)
    if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    6f5a:	2057           	movea.l (sp),a0
    6f5c:	3010           	move.w (a0),d0
    6f5e:	0c40 4eb9      	cmpi.w #20153,d0
    6f62:	670a           	beq.s 6f6e <debug_cmd+0x1c>
    6f64:	2057           	movea.l (sp),a0
    6f66:	3010           	move.w (a0),d0
    6f68:	0c40 a00e      	cmpi.w #-24562,d0
    6f6c:	661e           	bne.s 6f8c <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
    6f6e:	2f2f 0014      	move.l 20(sp),-(sp)
    6f72:	2f2f 0014      	move.l 20(sp),-(sp)
    6f76:	2f2f 0014      	move.l 20(sp),-(sp)
    6f7a:	2f2f 0014      	move.l 20(sp),-(sp)
    6f7e:	4878 0058      	pea 58 <_start+0x58>
    6f82:	206f 0014      	movea.l 20(sp),a0
    6f86:	4e90           	jsr (a0)
    6f88:	4fef 0014      	lea 20(sp),sp
	}
}
    6f8c:	588f           	addq.l #4,sp
    6f8e:	4e75           	rts

00006f90 <debug_clear>:
	barto_cmd_text,
};

void debug_clear()
{
	debug_cmd(barto_cmd_clear, 0, 0, 0);
    6f90:	42a7           	clr.l -(sp)
    6f92:	42a7           	clr.l -(sp)
    6f94:	42a7           	clr.l -(sp)
    6f96:	42a7           	clr.l -(sp)
    6f98:	4eba ffb8      	jsr 6f52 <debug_cmd>(pc)
    6f9c:	4fef 0010      	lea 16(sp),sp
}
    6fa0:	4e75           	rts

00006fa2 <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color)
{
    6fa2:	518f           	subq.l #8,sp
    6fa4:	2f02           	move.l d2,-(sp)
    6fa6:	226f 0010      	movea.l 16(sp),a1
    6faa:	206f 0014      	movea.l 20(sp),a0
    6fae:	222f 0018      	move.l 24(sp),d1
    6fb2:	202f 001c      	move.l 28(sp),d0
    6fb6:	3249           	movea.w a1,a1
    6fb8:	3f49 000a      	move.w a1,10(sp)
    6fbc:	3048           	movea.w a0,a0
    6fbe:	3f48 0008      	move.w a0,8(sp)
    6fc2:	3201           	move.w d1,d1
    6fc4:	3f41 0006      	move.w d1,6(sp)
    6fc8:	3000           	move.w d0,d0
    6fca:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    6fce:	302f 0006      	move.w 6(sp),d0
    6fd2:	48c0           	ext.l d0
    6fd4:	4840           	swap d0
    6fd6:	4240           	clr.w d0
    6fd8:	322f 0004      	move.w 4(sp),d1
    6fdc:	48c1           	ext.l d1
    6fde:	8280           	or.l d0,d1
    6fe0:	302f 000a      	move.w 10(sp),d0
    6fe4:	48c0           	ext.l d0
    6fe6:	4840           	swap d0
    6fe8:	4240           	clr.w d0
    6fea:	306f 0008      	movea.w 8(sp),a0
    6fee:	2408           	move.l a0,d2
    6ff0:	8082           	or.l d2,d0
    6ff2:	2f2f 0020      	move.l 32(sp),-(sp)
    6ff6:	2f01           	move.l d1,-(sp)
    6ff8:	2f00           	move.l d0,-(sp)
    6ffa:	4878 0001      	pea 1 <_start+0x1>
    6ffe:	4eba ff52      	jsr 6f52 <debug_cmd>(pc)
    7002:	4fef 0010      	lea 16(sp),sp
}
    7006:	241f           	move.l (sp)+,d2
    7008:	508f           	addq.l #8,sp
    700a:	4e75           	rts

0000700c <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color)
{
    700c:	518f           	subq.l #8,sp
    700e:	2f02           	move.l d2,-(sp)
    7010:	226f 0010      	movea.l 16(sp),a1
    7014:	206f 0014      	movea.l 20(sp),a0
    7018:	222f 0018      	move.l 24(sp),d1
    701c:	202f 001c      	move.l 28(sp),d0
    7020:	3249           	movea.w a1,a1
    7022:	3f49 000a      	move.w a1,10(sp)
    7026:	3048           	movea.w a0,a0
    7028:	3f48 0008      	move.w a0,8(sp)
    702c:	3201           	move.w d1,d1
    702e:	3f41 0006      	move.w d1,6(sp)
    7032:	3000           	move.w d0,d0
    7034:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    7038:	302f 0006      	move.w 6(sp),d0
    703c:	48c0           	ext.l d0
    703e:	4840           	swap d0
    7040:	4240           	clr.w d0
    7042:	322f 0004      	move.w 4(sp),d1
    7046:	48c1           	ext.l d1
    7048:	8280           	or.l d0,d1
    704a:	302f 000a      	move.w 10(sp),d0
    704e:	48c0           	ext.l d0
    7050:	4840           	swap d0
    7052:	4240           	clr.w d0
    7054:	306f 0008      	movea.w 8(sp),a0
    7058:	2408           	move.l a0,d2
    705a:	8082           	or.l d2,d0
    705c:	2f2f 0020      	move.l 32(sp),-(sp)
    7060:	2f01           	move.l d1,-(sp)
    7062:	2f00           	move.l d0,-(sp)
    7064:	4878 0002      	pea 2 <_start+0x2>
    7068:	4eba fee8      	jsr 6f52 <debug_cmd>(pc)
    706c:	4fef 0010      	lea 16(sp),sp
}
    7070:	241f           	move.l (sp)+,d2
    7072:	508f           	addq.l #8,sp
    7074:	4e75           	rts

00007076 <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color)
{
    7076:	598f           	subq.l #4,sp
    7078:	2f02           	move.l d2,-(sp)
    707a:	222f 000c      	move.l 12(sp),d1
    707e:	202f 0010      	move.l 16(sp),d0
    7082:	3201           	move.w d1,d1
    7084:	3f41 0006      	move.w d1,6(sp)
    7088:	3000           	move.w d0,d0
    708a:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
    708e:	202f 0014      	move.l 20(sp),d0
    7092:	322f 0006      	move.w 6(sp),d1
    7096:	48c1           	ext.l d1
    7098:	4841           	swap d1
    709a:	4241           	clr.w d1
    709c:	306f 0004      	movea.w 4(sp),a0
    70a0:	2408           	move.l a0,d2
    70a2:	8282           	or.l d2,d1
    70a4:	2f2f 0018      	move.l 24(sp),-(sp)
    70a8:	2f00           	move.l d0,-(sp)
    70aa:	2f01           	move.l d1,-(sp)
    70ac:	4878 0003      	pea 3 <_start+0x3>
    70b0:	4eba fea0      	jsr 6f52 <debug_cmd>(pc)
    70b4:	4fef 0010      	lea 16(sp),sp
}
    70b8:	241f           	move.l (sp)+,d2
    70ba:	588f           	addq.l #4,sp
    70bc:	4e75           	rts
    70be:	4e71           	nop

000070c0 <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    70c0:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    70c4:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    70c8:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    70cc:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    70d0:	d041           	add.w d1,d0
	swap	d0
    70d2:	4840           	swap d0
	clrw	d0
    70d4:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    70d6:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    70da:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    70de:	d081           	add.l d1,d0
	rts
    70e0:	4e75           	rts

000070e2 <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    70e2:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    70e4:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    70e8:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    70ec:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    70f2:	6416           	bcc.s 710a <__udivsi3+0x28>
	movel	d0, d2
    70f4:	2400           	move.l d0,d2
	clrw	d2
    70f6:	4242           	clr.w d2
	swap	d2
    70f8:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    70fa:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    70fc:	3002           	move.w d2,d0
	swap	d0
    70fe:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    7100:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    7104:	84c1           	divu.w d1,d2
	movew	d2, d0
    7106:	3002           	move.w d2,d0
	jra	6f
    7108:	6030           	bra.s 713a <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    710a:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    710c:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    710e:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    7110:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    7116:	64f4           	bcc.s 710c <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    7118:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    711a:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    7120:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    7122:	c2c0           	mulu.w d0,d1
	swap	d2
    7124:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    7126:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    7128:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    712a:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    712c:	660a           	bne.s 7138 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    712e:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    7130:	6506           	bcs.s 7138 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    7132:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    7136:	6302           	bls.s 713a <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    7138:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    713a:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    713c:	4e75           	rts

0000713e <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    713e:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    7140:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    7142:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    7146:	6a04           	bpl.s 714c <__divsi3+0xe>
	negl	d1
    7148:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    714a:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    714c:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    7150:	6a04           	bpl.s 7156 <__divsi3+0x18>
	negl	d0
    7152:	4480           	neg.l d0
	negb	d2
    7154:	4402           	neg.b d2

2:	movel	d1, sp@-
    7156:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    7158:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    715a:	6186           	bsr.s 70e2 <__udivsi3>
	addql	IMM (8), sp
    715c:	508f           	addq.l #8,sp

	tstb	d2
    715e:	4a02           	tst.b d2
	jpl	3f
    7160:	6a02           	bpl.s 7164 <__divsi3+0x26>
	negl	d0
    7162:	4480           	neg.l d0

3:	movel	sp@+, d2
    7164:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    7166:	4e75           	rts

00007168 <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    7168:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    716c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    7170:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7172:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    7174:	61c8           	bsr.s 713e <__divsi3>
	addql	IMM (8), sp
    7176:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    7178:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    717c:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    717e:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    7180:	6100 ff3e      	bsr.w 70c0 <__mulsi3>
	addql	IMM (8), sp
    7184:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    7186:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    718a:	9280           	sub.l d0,d1
	movel	d1, d0
    718c:	2001           	move.l d1,d0
	rts
    718e:	4e75           	rts

00007190 <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    7190:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7194:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    7198:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    719a:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    719c:	6100 ff44      	bsr.w 70e2 <__udivsi3>
	addql	IMM (8), sp
    71a0:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    71a2:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    71a6:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    71a8:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    71aa:	6100 ff14      	bsr.w 70c0 <__mulsi3>
	addql	IMM (8), sp
    71ae:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    71b0:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    71b4:	9280           	sub.l d0,d1
	movel	d1, d0
    71b6:	2001           	move.l d1,d0
	rts
    71b8:	4e75           	rts

000071ba <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    71ba:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    71bc:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    71c0:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    71c4:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    71c6:	4e75           	rts

000071c8 <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    71c8:	16c0           	move.b d0,(a3)+
	rts
    71ca:	4e75           	rts

000071cc <Testo>:

    .globl   Testo
	.p2align 2
    .type    Testo,%function
Testo:
    add.w d0,d0
    71cc:	d040           	add.w d0,d0
    rts
    71ce:	4e75           	rts

000071d0 <c2p1x1_4_c5_gen_init>:
	.text
	FUNC(c2p1x1_4_c5_gen_init)
	.globl	SYM (c2p1x1_4_c5_gen_init)

SYM(c2p1x1_4_c5_gen_init):
	movem.l d0-d7/a0-a6, .gi_saveregs	
    71d0:	48f9 7fff 0000 	movem.l d0-a6,7210 <.gi_saveregs>
    71d6:	7210 
	move.l  4(sp),d0
    71d8:	202f 0004      	move.l 4(sp),d0
	move.l	8(sp),d1
    71dc:	222f 0008      	move.l 8(sp),d1
	move.l	12(sp),d2
    71e0:	242f 000c      	move.l 12(sp),d2
	move.l	16(sp),d3
    71e4:	262f 0010      	move.l 16(sp),d3
	move.l  20(sp),d4
    71e8:	282f 0014      	move.l 20(sp),d4
	move.l	24(sp),d5
    71ec:	2a2f 0018      	move.l 24(sp),d5
	andi.l	IMM (0xffff),d0
    71f0:	0280 0000 ffff 	andi.l #65535,d0
	mulu.w	d0,d3
    71f6:	c6c0           	mulu.w d0,d3
	lsr.l	#3,d3
    71f8:	e68b           	lsr.l #3,d3
	move.l	d3,c2p1x1_4_c5_gen_scroffs
    71fa:	23c3 0000 73de 	move.l d3,73de <c2p1x1_4_c5_gen_scroffs>
	mulu.w	d0,d1
    7200:	c2c0           	mulu.w d0,d1
	move.l	d1,c2p1x1_4_c5_gen_pixels
    7202:	23c1 0000 73e2 	move.l d1,73e2 <c2p1x1_4_c5_gen_pixels>
	movem.l	.gi_saveregs,d0-d7/a0-a6
    7208:	4cfa 7fff 0004 	movem.l 7210 <.gi_saveregs>(pc),d0-a6
	rts
    720e:	4e75           	rts

00007210 <.gi_saveregs>:
	...

0000724c <c2p1x1_4_c5_gen>:
	.text
	FUNC(c2p1x1_4_c5_gen)
	.globl	SYM (c2p1x1_4_c5_gen)

SYM(c2p1x1_4_c5_gen):
	movem.l d0-d7/a0-a6,.c2p_saveregs	
    724c:	48f9 7fff 0000 	movem.l d0-a6,73a2 <.c2p_saveregs>
    7252:	73a2 
	movem.l 4(sp),a0
    7254:	4cef 0100 0004 	movem.l 4(sp),a0
	movem.l 8(sp),a1
    725a:	4cef 0200 0008 	movem.l 8(sp),a1
	move.l	IMM (0x33333333),d5
    7260:	2a3c 3333 3333 	move.l #858993459,d5
	move.l	IMM (0x55555555),a5
    7266:	2a7c 5555 5555 	movea.l #1431655765,a5
	move.l	IMM (0x00ff00ff),a6
    726c:	2c7c 00ff 00ff 	movea.l #16711935,a6

	add.w	#BPLSIZE,a1
    7272:	d2fc 2800      	adda.w #10240,a1
	add.l	c2p1x1_4_c5_gen_scroffs,a1
    7276:	d3fa 0166      	adda.l 73de <c2p1x1_4_c5_gen_scroffs>(pc),a1

	move.l	c2p1x1_4_c5_gen_pixels,a2
    727a:	247a 0166      	movea.l 73e2 <c2p1x1_4_c5_gen_pixels>(pc),a2
	add.l	a0,a2
    727e:	d5c8           	adda.l a0,a2
	cmp.l	a0,a2
    7280:	b5c8           	cmpa.l a0,a2
	beq	.quit
    7282:	6700 0116      	beq.w 739a <.quit>

	move.l	(a0)+,d0		// Merge 4x1
    7286:	2018           	move.l (a0)+,d0
	lsl.l	#4,d0
    7288:	e988           	lsl.l #4,d0
	or.l	(a0)+,d0
    728a:	8098           	or.l (a0)+,d0
	move.l	(a0)+,d1
    728c:	2218           	move.l (a0)+,d1
	lsl.l	#4,d1
    728e:	e989           	lsl.l #4,d1
	or.l	(a0)+,d1
    7290:	8298           	or.l (a0)+,d1

	move.l	(a0)+,d2
    7292:	2418           	move.l (a0)+,d2
	lsl.l	#4,d2
    7294:	e98a           	lsl.l #4,d2
	or.l	(a0)+,d2
    7296:	8498           	or.l (a0)+,d2
	move.l	(a0)+,d3
    7298:	2618           	move.l (a0)+,d3
	lsl.l	#4,d3
    729a:	e98b           	lsl.l #4,d3
	or.l	(a0)+,d3
    729c:	8698           	or.l (a0)+,d3

	move.w	d2,d6			//; Swap 16x2
    729e:	3c02           	move.w d2,d6
	move.w	d3,d4
    72a0:	3803           	move.w d3,d4
	move.w	d0,d2
    72a2:	3400           	move.w d0,d2
	move.w	d1,d3
    72a4:	3601           	move.w d1,d3
	swap	d2
    72a6:	4842           	swap d2
	swap	d3
    72a8:	4843           	swap d3
	move.w	d2,d0
    72aa:	3002           	move.w d2,d0
	move.w	d3,d1
    72ac:	3203           	move.w d3,d1
	move.w	d6,d2
    72ae:	3406           	move.w d6,d2
	move.w	d4,d3
    72b0:	3604           	move.w d4,d3

	move.l	d2,d6			//; Swap 2x2
    72b2:	2c02           	move.l d2,d6
	move.l	d3,d7
    72b4:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    72b6:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    72b8:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    72ba:	b186           	eor.l d0,d6
	eor.l	d1,d7
    72bc:	b387           	eor.l d1,d7
	and.l	d5,d6
    72be:	cc85           	and.l d5,d6
	and.l	d5,d7
    72c0:	ce85           	and.l d5,d7
	eor.l	d6,d0
    72c2:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    72c4:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    72c6:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    72c8:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    72ca:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    72cc:	bf83           	eor.l d7,d3

	move.l	a6,d4			//; Swap 8x1
    72ce:	280e           	move.l a6,d4
	move.l	d1,d6
    72d0:	2c01           	move.l d1,d6
	move.l	d3,d7
    72d2:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    72d4:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    72d6:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    72d8:	b186           	eor.l d0,d6
	eor.l	d2,d7
    72da:	b587           	eor.l d2,d7
	and.l	d4,d6
    72dc:	cc84           	and.l d4,d6
	and.l	d4,d7
    72de:	ce84           	and.l d4,d7
	eor.l	d6,d0
    72e0:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    72e2:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    72e4:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    72e6:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    72e8:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    72ea:	bf83           	eor.l d7,d3

	bra.w	.start
    72ec:	6000 0076      	bra.w 7364 <.start>

000072f0 <.x>:
.x:
	move.l	(a0)+,d0		//; Merge 4x1
    72f0:	2018           	move.l (a0)+,d0
	lsl.l	#4,d0
    72f2:	e988           	lsl.l #4,d0
	or.l	(a0)+,d0
    72f4:	8098           	or.l (a0)+,d0
	move.l	(a0)+,d1
    72f6:	2218           	move.l (a0)+,d1
	lsl.l	#4,d1
    72f8:	e989           	lsl.l #4,d1
	or.l	(a0)+,d1
    72fa:	8298           	or.l (a0)+,d1

	move.l	(a0)+,d2
    72fc:	2418           	move.l (a0)+,d2
	lsl.l	#4,d2
    72fe:	e98a           	lsl.l #4,d2
	or.l	(a0)+,d2
    7300:	8498           	or.l (a0)+,d2
	move.l	(a0)+,d3
    7302:	2618           	move.l (a0)+,d3
	lsl.l	#4,d3
    7304:	e98b           	lsl.l #4,d3
	or.l	(a0)+,d3
    7306:	8698           	or.l (a0)+,d3

	move.l	d6,BPLSIZE(a1)
    7308:	2346 2800      	move.l d6,10240(a1)

	move.w	d2,d6			//; Swap 16x2
    730c:	3c02           	move.w d2,d6
	move.w	d3,d4
    730e:	3803           	move.w d3,d4
	move.w	d0,d2
    7310:	3400           	move.w d0,d2
	move.w	d1,d3
    7312:	3601           	move.w d1,d3
	swap	d2
    7314:	4842           	swap d2
	swap	d3
    7316:	4843           	swap d3
	move.w	d2,d0
    7318:	3002           	move.w d2,d0
	move.w	d3,d1
    731a:	3203           	move.w d3,d1
	move.w	d6,d2
    731c:	3406           	move.w d6,d2
	move.w	d4,d3
    731e:	3604           	move.w d4,d3

	move.l	d7,-BPLSIZE(a1)
    7320:	2347 d800      	move.l d7,-10240(a1)

	move.l	d2,d6			//; Swap 2x2
    7324:	2c02           	move.l d2,d6
	move.l	d3,d7
    7326:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    7328:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    732a:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    732c:	b186           	eor.l d0,d6
	eor.l	d1,d7
    732e:	b387           	eor.l d1,d7
	and.l	d5,d6
    7330:	cc85           	and.l d5,d6
	and.l	d5,d7
    7332:	ce85           	and.l d5,d7
	eor.l	d6,d0
    7334:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7336:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    7338:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    733a:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    733c:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    733e:	bf83           	eor.l d7,d3

	move.l	a3,BPLSIZE*2(a1)
    7340:	234b 5000      	move.l a3,20480(a1)

	move.l	a6,d4			//; Swap 8x1
    7344:	280e           	move.l a6,d4
	move.l	d1,d6
    7346:	2c01           	move.l d1,d6
	move.l	d3,d7
    7348:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    734a:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    734c:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    734e:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7350:	b587           	eor.l d2,d7
	and.l	d4,d6
    7352:	cc84           	and.l d4,d6
	and.l	d4,d7
    7354:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7356:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7358:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    735a:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    735c:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    735e:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    7360:	bf83           	eor.l d7,d3

	move.l	a4,(a1)+
    7362:	22cc           	move.l a4,(a1)+

00007364 <.start>:
.start:
	move.l	a5,d4			//; Swap 1x1
    7364:	280d           	move.l a5,d4
	move.l	d1,d6
    7366:	2c01           	move.l d1,d6
	move.l	d3,d7
    7368:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    736a:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    736c:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    736e:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7370:	b587           	eor.l d2,d7
	and.l	d4,d6
    7372:	cc84           	and.l d4,d6
	and.l	d4,d7
    7374:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7376:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7378:	bf82           	eor.l d7,d2
	add.l	d6,d6
    737a:	dc86           	add.l d6,d6
	add.l	d7,d7
    737c:	de87           	add.l d7,d7
	eor.l	d1,d6
    737e:	b386           	eor.l d1,d6
	eor.l	d3,d7
    7380:	b787           	eor.l d3,d7

	move.l	d0,a3
    7382:	2640           	movea.l d0,a3
	move.l	d2,a4
    7384:	2842           	movea.l d2,a4

	cmpa.l	a0,a2
    7386:	b5c8           	cmpa.l a0,a2
	bne	.x
    7388:	6600 ff66      	bne.w 72f0 <.x>

	move.l	d6,BPLSIZE(a1)
    738c:	2346 2800      	move.l d6,10240(a1)
	move.l	d7,-BPLSIZE(a1)
    7390:	2347 d800      	move.l d7,-10240(a1)
	move.l	a3,BPLSIZE*2(a1)
    7394:	234b 5000      	move.l a3,20480(a1)
	move.l	a4,(a1)+
    7398:	22cc           	move.l a4,(a1)+

0000739a <.quit>:
.quit:
	movem.l .c2p_saveregs,d0-d7/a0-a6
    739a:	4cfa 7fff 0004 	movem.l 73a2 <.c2p_saveregs>(pc),d0-a6
	rts
    73a0:	4e75           	rts

000073a2 <.c2p_saveregs>:
	...

000073de <c2p1x1_4_c5_gen_scroffs>:
    73de:	0000 0001      	ori.b #1,d0

000073e2 <c2p1x1_4_c5_gen_pixels>:

.c2p_saveregs: .dcb.b 60


c2p1x1_4_c5_gen_scroffs: dc.l	1
    73e2:	0000 0001      	ori.b #1,d0
