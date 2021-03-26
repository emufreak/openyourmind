
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
       2:	203c 0000 a56a 	move.l #42346,d0
       8:	0480 0000 a56a 	subi.l #42346,d0
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
      22:	41f9 0000 a56a 	lea a56a <__fini_array_end>,a0
      28:	2071 8800      	movea.l (0,a1,a0.l),a0
      2c:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      2e:	52af 0004      	addq.l #1,4(sp)
      32:	202f 0004      	move.l 4(sp),d0
      36:	b097           	cmp.l (sp),d0
      38:	65de           	bcs.s 18 <_start+0x18>

	count = __init_array_end - __init_array_start;
      3a:	203c 0000 a56a 	move.l #42346,d0
      40:	0480 0000 a56a 	subi.l #42346,d0
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
      5a:	41f9 0000 a56a 	lea a56a <__fini_array_end>,a0
      60:	2071 8800      	movea.l (0,a1,a0.l),a0
      64:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      66:	52af 0004      	addq.l #1,4(sp)
      6a:	202f 0004      	move.l 4(sp),d0
      6e:	b097           	cmp.l (sp),d0
      70:	65de           	bcs.s 50 <_start+0x50>

	main();
      72:	4eb9 0000 0632 	jsr 632 <main>

	// call dtors
	count = __fini_array_end - __fini_array_start;
      78:	203c 0000 a56a 	move.l #42346,d0
      7e:	0480 0000 a56a 	subi.l #42346,d0
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
      9a:	41f9 0000 a56a 	lea a56a <__fini_array_end>,a0
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
      b6:	2079 0010 3294 	movea.l 103294 <hw>,a0
      bc:	3f68 0002 0002 	move.w 2(a0),2(sp)
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
      c2:	2079 0010 3294 	movea.l 103294 <hw>,a0
      c8:	3028 0002      	move.w 2(a0),d0
      cc:	3000           	move.w d0,d0
      ce:	0280 0000 ffff 	andi.l #65535,d0
      d4:	0280 0000 4000 	andi.l #16384,d0
      da:	66e6           	bne.s c2 <WaitBlt+0xe>
}
      dc:	588f           	addq.l #4,sp
      de:	4e75           	rts

000000e0 <FreeDisplay>:


ULONG ClColor[] = { 0x1800000,0x1820024,0x1840134,0x1860135,0x1880146,0x18a0147,0x18c0158,0x18e0257,0x1900257,0x1920268,0x1940269,0x1960368,0x198037a,0x19a027a,0x19c0379,0x19e038b,0x1a0048b,
0x1a2048a,0x1a4049c,0x1a6059c,0x1a805ad,0x1aa06ac,0x1ac07ac,0x1ae06be,0x1b007bd,0x1b208bd,0x1b408be,0x1b609bd,0x1b809ce,0x1ba0ace,0x1bc0ade,0x1be0bde };

void FreeDisplay( int clsize, int bplsize) {
      e0:	4fef fff0      	lea -16(sp),sp
      e4:	2f0e           	move.l a6,-(sp)
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
      e6:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
      ec:	6722           	beq.s 110 <FreeDisplay+0x30>
      ee:	2f79 0010 327c 	move.l 10327c <Copperlist1>,16(sp)
      f4:	0010 
      f6:	2f6f 0018 000c 	move.l 24(sp),12(sp)
      fc:	2039 0010 3298 	move.l 103298 <SysBase>,d0
     102:	2c40           	movea.l d0,a6
     104:	226f 0010      	movea.l 16(sp),a1
     108:	202f 000c      	move.l 12(sp),d0
     10c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     110:	2039 0010 3280 	move.l 103280 <Copperlist2>,d0
     116:	6722           	beq.s 13a <FreeDisplay+0x5a>
     118:	2f79 0010 3280 	move.l 103280 <Copperlist2>,8(sp)
     11e:	0008 
     120:	2f6f 0018 0004 	move.l 24(sp),4(sp)
     126:	2039 0010 3298 	move.l 103298 <SysBase>,d0
     12c:	2c40           	movea.l d0,a6
     12e:	226f 0008      	movea.l 8(sp),a1
     132:	202f 0004      	move.l 4(sp),d0
     136:	4eae ff2e      	jsr -210(a6)
  /*if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);*/
}
     13a:	2c5f           	movea.l (sp)+,a6
     13c:	4fef 0010      	lea 16(sp),sp
     140:	4e75           	rts

00000142 <SetBplPointers>:

void SetBplPointers() {
     142:	4fef fff4      	lea -12(sp),sp
  UWORD highword = (ULONG)DrawBuffer >> 16;
     146:	2039 0010 3284 	move.l 103284 <DrawBuffer>,d0
     14c:	4240           	clr.w d0
     14e:	4840           	swap d0
     150:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     154:	2039 0010 3284 	move.l 103284 <DrawBuffer>,d0
     15a:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     15e:	2f79 0010 328c 	move.l 10328c <DrawCopper>,4(sp)
     164:	0004 
  copword[COPBPL1LOW] = lowword;
     166:	307c 0076      	movea.w #118,a0
     16a:	d1ef 0004      	adda.l 4(sp),a0
     16e:	30af 0008      	move.w 8(sp),(a0)
  copword[COPBPL1HIGH] = highword;
     172:	307c 0072      	movea.w #114,a0
     176:	d1ef 0004      	adda.l 4(sp),a0
     17a:	30af 000a      	move.w 10(sp),(a0)
  
  ULONG tmp = (ULONG) DrawBuffer;
     17e:	2039 0010 3284 	move.l 103284 <DrawBuffer>,d0
     184:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     186:	2039 0010 3288 	move.l 103288 <ViewBuffer>,d0
     18c:	23c0 0010 3284 	move.l d0,103284 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     192:	2017           	move.l (sp),d0
     194:	23c0 0010 3288 	move.l d0,103288 <ViewBuffer>
}
     19a:	4fef 000c      	lea 12(sp),sp
     19e:	4e75           	rts

000001a0 <SwapCl>:

void SwapCl() {
     1a0:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     1a2:	2039 0010 328c 	move.l 10328c <DrawCopper>,d0
     1a8:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     1aa:	2039 0010 3290 	move.l 103290 <ViewCopper>,d0
     1b0:	23c0 0010 328c 	move.l d0,10328c <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     1b6:	2017           	move.l (sp),d0
     1b8:	23c0 0010 3290 	move.l d0,103290 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     1be:	2039 0010 3290 	move.l 103290 <ViewCopper>,d0
     1c4:	2079 0010 3294 	movea.l 103294 <hw>,a0
     1ca:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     1ce:	2079 0010 3294 	movea.l 103294 <hw>,a0
     1d4:	2017           	move.l (sp),d0
     1d6:	3140 0088      	move.w d0,136(a0)
}
     1da:	588f           	addq.l #4,sp
     1dc:	4e75           	rts

000001de <Utils_CopyMem>:

void Utils_CopyMem( ULONG *source, ULONG *destination, ULONG size) {
     1de:	598f           	subq.l #4,sp
     1e0:	2f02           	move.l d2,-(sp)
  for( int i=0;i<size;i++) 
     1e2:	42af 0004      	clr.l 4(sp)
     1e6:	6024           	bra.s 20c <Utils_CopyMem+0x2e>
    *destination++ = *source++;  
     1e8:	222f 000c      	move.l 12(sp),d1
     1ec:	2001           	move.l d1,d0
     1ee:	5880           	addq.l #4,d0
     1f0:	2f40 000c      	move.l d0,12(sp)
     1f4:	202f 0010      	move.l 16(sp),d0
     1f8:	2400           	move.l d0,d2
     1fa:	5882           	addq.l #4,d2
     1fc:	2f42 0010      	move.l d2,16(sp)
     200:	2041           	movea.l d1,a0
     202:	2210           	move.l (a0),d1
     204:	2040           	movea.l d0,a0
     206:	2081           	move.l d1,(a0)
  for( int i=0;i<size;i++) 
     208:	52af 0004      	addq.l #1,4(sp)
     20c:	202f 0004      	move.l 4(sp),d0
     210:	b0af 0014      	cmp.l 20(sp),d0
     214:	65d2           	bcs.s 1e8 <Utils_CopyMem+0xa>
}
     216:	241f           	move.l (sp)+,d2
     218:	588f           	addq.l #4,sp
     21a:	4e75           	rts

0000021c <Utils_FillLong>:

void Utils_FillLong( ULONG *target, ULONG pattern, ULONG lines, 
                                            ULONG linelength, ULONG mod ) {
     21c:	518f           	subq.l #8,sp
  for( int i=0;i<lines; i++) {
     21e:	42af 0004      	clr.l 4(sp)
     222:	6030           	bra.s 254 <Utils_FillLong+0x38>
    for( int i2=0;i2<linelength;i2++) 
     224:	4297           	clr.l (sp)
     226:	6014           	bra.s 23c <Utils_FillLong+0x20>
      *target++ = pattern;
     228:	202f 000c      	move.l 12(sp),d0
     22c:	2200           	move.l d0,d1
     22e:	5881           	addq.l #4,d1
     230:	2f41 000c      	move.l d1,12(sp)
     234:	2040           	movea.l d0,a0
     236:	20af 0010      	move.l 16(sp),(a0)
    for( int i2=0;i2<linelength;i2++) 
     23a:	5297           	addq.l #1,(sp)
     23c:	2017           	move.l (sp),d0
     23e:	b0af 0018      	cmp.l 24(sp),d0
     242:	65e4           	bcs.s 228 <Utils_FillLong+0xc>
    target += mod;
     244:	202f 001c      	move.l 28(sp),d0
     248:	d080           	add.l d0,d0
     24a:	d080           	add.l d0,d0
     24c:	d1af 000c      	add.l d0,12(sp)
  for( int i=0;i<lines; i++) {
     250:	52af 0004      	addq.l #1,4(sp)
     254:	202f 0004      	move.l 4(sp),d0
     258:	b0af 0014      	cmp.l 20(sp),d0
     25c:	65c6           	bcs.s 224 <Utils_FillLong+0x8>
  }
}
     25e:	508f           	addq.l #8,sp
     260:	4e75           	rts

00000262 <MouseLeft>:

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     262:	207c 00bf e001 	movea.l #12574721,a0
     268:	1010           	move.b (a0),d0
     26a:	1000           	move.b d0,d0
     26c:	0280 0000 00ff 	andi.l #255,d0
     272:	7240           	moveq #64,d1
     274:	c081           	and.l d1,d0
     276:	57c0           	seq d0
     278:	4400           	neg.b d0
     27a:	1000           	move.b d0,d0
     27c:	0240 00ff      	andi.w #255,d0
     280:	4e75           	rts

00000282 <MouseRight>:
     282:	207c 00df f016 	movea.l #14675990,a0
     288:	3010           	move.w (a0),d0
     28a:	3000           	move.w d0,d0
     28c:	0280 0000 ffff 	andi.l #65535,d0
     292:	0280 0000 0400 	andi.l #1024,d0
     298:	57c0           	seq d0
     29a:	4400           	neg.b d0
     29c:	1000           	move.b d0,d0
     29e:	0240 00ff      	andi.w #255,d0
     2a2:	4e75           	rts

000002a4 <interruptHandler.lto_priv.0>:
#include "zoom.h"
#include "zoom102.h"

//volatile int frameCounter = 0;

static __attribute__((interrupt)) void interruptHandler() {
     2a4:	2f08           	move.l a0,-(sp)
	hw->intreq=(1<<INTB_VERTB); hw->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     2a6:	2079 0010 3294 	movea.l 103294 <hw>,a0
     2ac:	317c 0020 009c 	move.w #32,156(a0)
     2b2:	2079 0010 3294 	movea.l 103294 <hw>,a0
     2b8:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	//frameCounter++;
  //Zoom_VblankHandler();
}
     2be:	205f           	movea.l (sp)+,a0
     2c0:	4e73           	rte

000002c2 <RunDemo>:

void RunDemo() {
//               5432109876543210
  hw->dmacon = 0b1000011111111111;
     2c2:	2079 0010 3294 	movea.l 103294 <hw>,a0
     2c8:	317c 87ff 0096 	move.w #-30721,150(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req*/
  //PrepareDisplay();
  //CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
  
	while(1) {
		WaitVbl();
     2ce:	4eba 0260      	jsr 530 <WaitVbl>(pc)
    RunFrame();
     2d2:	4eba 0028      	jsr 2fc <RunFrame>(pc)
     2d6:	60f6           	bra.s 2ce <RunDemo+0xc>

000002d8 <SetInterrupt>:
  
	//SetInterruptHandler((APTR)interruptHandler);
}

void SetInterrupt() {
  SetInterruptHandler((APTR)interruptHandler);
     2d8:	487a ffca      	pea 2a4 <interruptHandler.lto_priv.0>(pc)
     2dc:	4eba 0236      	jsr 514 <SetInterruptHandler>(pc)
     2e0:	588f           	addq.l #4,sp
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     2e2:	2079 0010 3294 	movea.l 103294 <hw>,a0
     2e8:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     2ee:	2079 0010 3294 	movea.l 103294 <hw>,a0
     2f4:	317c 0020 009c 	move.w #32,156(a0)
}
     2fa:	4e75           	rts

000002fc <RunFrame>:
  else
    Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer, (UWORD *)DrawBuffer, Zoom_LevelOfZoom, 5 );

  Zoom_Blit4ZoomFinished = 1;
  while( tmp == Zoom_LevelOfZoom) { }*/
     2fc:	4e75           	rts

000002fe <Zoom_InsertShift>:
           0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
           0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000,
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

void Zoom_InsertShift( UWORD *copperlist, UWORD *values4shift) {
     2fe:	4fef fff4      	lea -12(sp),sp
     302:	2f02           	move.l d2,-(sp)
  for(int i = 0; i<6;i++) {
     304:	42af 000c      	clr.l 12(sp)
     308:	601e           	bra.s 328 <Zoom_InsertShift+0x2a>
    *copperlist = *values4shift++;
     30a:	202f 0018      	move.l 24(sp),d0
     30e:	2200           	move.l d0,d1
     310:	5481           	addq.l #2,d1
     312:	2f41 0018      	move.l d1,24(sp)
     316:	2040           	movea.l d0,a0
     318:	3010           	move.w (a0),d0
     31a:	206f 0014      	movea.l 20(sp),a0
     31e:	3080           	move.w d0,(a0)
    copperlist += 2;
     320:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<6;i++) {
     324:	52af 000c      	addq.l #1,12(sp)
     328:	7005           	moveq #5,d0
     32a:	b0af 000c      	cmp.l 12(sp),d0
     32e:	6cda           	bge.s 30a <Zoom_InsertShift+0xc>
  }
  copperlist--;
     330:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     334:	222f 0018      	move.l 24(sp),d1
     338:	2401           	move.l d1,d2
     33a:	5482           	addq.l #2,d2
     33c:	2f42 0018      	move.l d2,24(sp)
     340:	202f 0014      	move.l 20(sp),d0
     344:	2400           	move.l d0,d2
     346:	5482           	addq.l #2,d2
     348:	2f42 0014      	move.l d2,20(sp)
     34c:	2041           	movea.l d1,a0
     34e:	3210           	move.w (a0),d1
     350:	2040           	movea.l d0,a0
     352:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     354:	202f 0018      	move.l 24(sp),d0
     358:	2200           	move.l d0,d1
     35a:	5481           	addq.l #2,d1
     35c:	2f41 0018      	move.l d1,24(sp)
     360:	2040           	movea.l d0,a0
     362:	3010           	move.w (a0),d0
     364:	206f 0014      	movea.l 20(sp),a0
     368:	3080           	move.w d0,(a0)
  copperlist += 2;
     36a:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     36e:	42af 0008      	clr.l 8(sp)
     372:	601e           	bra.s 392 <Zoom_InsertShift+0x94>
    *copperlist = *values4shift++;
     374:	202f 0018      	move.l 24(sp),d0
     378:	2200           	move.l d0,d1
     37a:	5481           	addq.l #2,d1
     37c:	2f41 0018      	move.l d1,24(sp)
     380:	2040           	movea.l d0,a0
     382:	3010           	move.w (a0),d0
     384:	206f 0014      	movea.l 20(sp),a0
     388:	3080           	move.w d0,(a0)
    copperlist += 2;
     38a:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     38e:	52af 0008      	addq.l #1,8(sp)
     392:	7009           	moveq #9,d0
     394:	b0af 0008      	cmp.l 8(sp),d0
     398:	6cda           	bge.s 374 <Zoom_InsertShift+0x76>
  }
  copperlist--;
     39a:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     39e:	222f 0018      	move.l 24(sp),d1
     3a2:	2401           	move.l d1,d2
     3a4:	5482           	addq.l #2,d2
     3a6:	2f42 0018      	move.l d2,24(sp)
     3aa:	202f 0014      	move.l 20(sp),d0
     3ae:	2400           	move.l d0,d2
     3b0:	5482           	addq.l #2,d2
     3b2:	2f42 0014      	move.l d2,20(sp)
     3b6:	2041           	movea.l d1,a0
     3b8:	3210           	move.w (a0),d1
     3ba:	2040           	movea.l d0,a0
     3bc:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     3be:	202f 0018      	move.l 24(sp),d0
     3c2:	2200           	move.l d0,d1
     3c4:	5481           	addq.l #2,d1
     3c6:	2f41 0018      	move.l d1,24(sp)
     3ca:	2040           	movea.l d0,a0
     3cc:	3010           	move.w (a0),d0
     3ce:	206f 0014      	movea.l 20(sp),a0
     3d2:	3080           	move.w d0,(a0)
  copperlist += 2;
     3d4:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     3d8:	42af 0004      	clr.l 4(sp)
     3dc:	601e           	bra.s 3fc <Zoom_InsertShift+0xfe>
    *copperlist = *values4shift++;
     3de:	202f 0018      	move.l 24(sp),d0
     3e2:	2200           	move.l d0,d1
     3e4:	5481           	addq.l #2,d1
     3e6:	2f41 0018      	move.l d1,24(sp)
     3ea:	2040           	movea.l d0,a0
     3ec:	3010           	move.w (a0),d0
     3ee:	206f 0014      	movea.l 20(sp),a0
     3f2:	3080           	move.w d0,(a0)
    copperlist += 2;
     3f4:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     3f8:	52af 0004      	addq.l #1,4(sp)
     3fc:	7006           	moveq #6,d0
     3fe:	b0af 0004      	cmp.l 4(sp),d0
     402:	6cda           	bge.s 3de <Zoom_InsertShift+0xe0>
  }
}
     404:	241f           	move.l (sp)+,d2
     406:	4fef 000c      	lea 12(sp),sp
     40a:	4e75           	rts

0000040c <Zoom_Shrink102>:

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {
     40c:	518f           	subq.l #8,sp
     40e:	202f 000c      	move.l 12(sp),d0
     412:	3000           	move.w d0,d0
     414:	3f40 0002      	move.w d0,2(sp)

  
  UWORD *values4shift = Values4Shift+levelofshrink*108;
     418:	7200           	moveq #0,d1
     41a:	322f 0002      	move.w 2(sp),d1
     41e:	2001           	move.l d1,d0
     420:	d080           	add.l d0,d0
     422:	d081           	add.l d1,d0
     424:	2200           	move.l d0,d1
     426:	e789           	lsl.l #3,d1
     428:	d081           	add.l d1,d0
     42a:	e788           	lsl.l #3,d0
     42c:	2200           	move.l d0,d1
     42e:	0681 0000 a884 	addi.l #43140,d1
     434:	2f41 0004      	move.l d1,4(sp)
  //copperlist+=3+73*2;
  Zoom_InsertShift( copperlist+3+73*2, values4shift);
     438:	202f 0010      	move.l 16(sp),d0
     43c:	0680 0000 012a 	addi.l #298,d0
     442:	2f2f 0004      	move.l 4(sp),-(sp)
     446:	2f00           	move.l d0,-(sp)
     448:	4eba feb4      	jsr 2fe <Zoom_InsertShift>(pc)
     44c:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+63+73*2, values4shift+27);
     44e:	7236           	moveq #54,d1
     450:	d2af 0004      	add.l 4(sp),d1
     454:	202f 0010      	move.l 16(sp),d0
     458:	0680 0000 01a2 	addi.l #418,d0
     45e:	2f01           	move.l d1,-(sp)
     460:	2f00           	move.l d0,-(sp)
     462:	4eba fe9a      	jsr 2fe <Zoom_InsertShift>(pc)
     466:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+119+73*2, values4shift+54);
     468:	726c           	moveq #108,d1
     46a:	d2af 0004      	add.l 4(sp),d1
     46e:	202f 0010      	move.l 16(sp),d0
     472:	0680 0000 0212 	addi.l #530,d0
     478:	2f01           	move.l d1,-(sp)
     47a:	2f00           	move.l d0,-(sp)
     47c:	4eba fe80      	jsr 2fe <Zoom_InsertShift>(pc)
     480:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+175+73*2, values4shift+81);
     482:	222f 0004      	move.l 4(sp),d1
     486:	0681 0000 00a2 	addi.l #162,d1
     48c:	202f 0010      	move.l 16(sp),d0
     490:	0680 0000 0282 	addi.l #642,d0
     496:	2f01           	move.l d1,-(sp)
     498:	2f00           	move.l d0,-(sp)
     49a:	4eba fe62      	jsr 2fe <Zoom_InsertShift>(pc)
     49e:	508f           	addq.l #8,sp
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }*/
  
}
     4a0:	508f           	addq.l #8,sp
     4a2:	4e75           	rts

000004a4 <GetVBR>:
volatile static APTR VBR=0;
static APTR SystemIrq;
 
struct View *ActiView;

static APTR GetVBR(void) {
     4a4:	4fef ffec      	lea -20(sp),sp
     4a8:	2f0e           	move.l a6,-(sp)
     4aa:	2f07           	move.l d7,-(sp)
	APTR vbr = 0;
     4ac:	42af 0018      	clr.l 24(sp)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     4b0:	3f7c 4e7a 000a 	move.w #20090,10(sp)
     4b6:	3f7c 0801 000c 	move.w #2049,12(sp)
     4bc:	3f7c 4e73 000e 	move.w #20083,14(sp)

	if (SysBase->AttnFlags & AFF_68010) 
     4c2:	2079 0010 3298 	movea.l 103298 <SysBase>,a0
     4c8:	3028 0128      	move.w 296(a0),d0
     4cc:	3000           	move.w d0,d0
     4ce:	0280 0000 ffff 	andi.l #65535,d0
     4d4:	7201           	moveq #1,d1
     4d6:	c081           	and.l d1,d0
     4d8:	672c           	beq.s 506 <GetVBR+0x62>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     4da:	41ef 001c      	lea 28(sp),a0
     4de:	41e8 ffee      	lea -18(a0),a0
     4e2:	2f48 0014      	move.l a0,20(sp)
     4e6:	2039 0010 3298 	move.l 103298 <SysBase>,d0
     4ec:	2c40           	movea.l d0,a6
     4ee:	2e2f 0014      	move.l 20(sp),d7
     4f2:	cf8d           	exg d7,a5
     4f4:	4eae ffe2      	jsr -30(a6)
     4f8:	cf8d           	exg d7,a5
     4fa:	2f40 0010      	move.l d0,16(sp)
     4fe:	202f 0010      	move.l 16(sp),d0
     502:	2f40 0018      	move.l d0,24(sp)

	return vbr;
     506:	202f 0018      	move.l 24(sp),d0
}
     50a:	2e1f           	move.l (sp)+,d7
     50c:	2c5f           	movea.l (sp)+,a6
     50e:	4fef 0014      	lea 20(sp),sp
     512:	4e75           	rts

00000514 <SetInterruptHandler>:

void SetInterruptHandler(APTR interrupt) {
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     514:	2079 0010 32b0 	movea.l 1032b0 <VBR>,a0
     51a:	41e8 006c      	lea 108(a0),a0
     51e:	20af 0004      	move.l 4(sp),(a0)
}
     522:	4e75           	rts

00000524 <GetInterruptHandler>:

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     524:	2079 0010 32b0 	movea.l 1032b0 <VBR>,a0
     52a:	2028 006c      	move.l 108(a0),d0
}
     52e:	4e75           	rts

00000530 <WaitVbl>:

//vblank begins at vpos 312 hpos 1 and ends at vpos 25 hpos 1
//vsync begins at line 2 hpos 132 and ends at vpos 5 hpos 18 
void WaitVbl() {
     530:	518f           	subq.l #8,sp
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     532:	207c 00df f004 	movea.l #14675972,a0
     538:	2010           	move.l (a0),d0
     53a:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
     53c:	2017           	move.l (sp),d0
     53e:	0280 0001 ff00 	andi.l #130816,d0
     544:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
     546:	2017           	move.l (sp),d0
     548:	0c80 0001 3700 	cmpi.l #79616,d0
     54e:	67e2           	beq.s 532 <WaitVbl+0x2>
			break;
	}
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     550:	207c 00df f004 	movea.l #14675972,a0
     556:	2010           	move.l (a0),d0
     558:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
     55c:	202f 0004      	move.l 4(sp),d0
     560:	0280 0001 ff00 	andi.l #130816,d0
     566:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
     56a:	202f 0004      	move.l 4(sp),d0
     56e:	0c80 0001 3700 	cmpi.l #79616,d0
     574:	66da           	bne.s 550 <WaitVbl+0x20>
			break;
	}
}
     576:	508f           	addq.l #8,sp
     578:	4e75           	rts

0000057a <TakeSystem>:

	WaitVbl();
	WaitVbl();*/


	VBR=GetVBR();
     57a:	4eba ff28      	jsr 4a4 <GetVBR>(pc)
     57e:	23c0 0010 32b0 	move.l d0,1032b0 <VBR>
	SystemIrq=GetInterruptHandler(); //store interrupt register
     584:	4eba ff9e      	jsr 524 <GetInterruptHandler>(pc)
     588:	23c0 0010 32b4 	move.l d0,1032b4 <SystemIrq>
}
     58e:	4e75           	rts

00000590 <FreeSystem>:

	//restore interrupts
	//SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
     590:	2079 0010 32a4 	movea.l 1032a4 <GfxBase>,a0
     596:	2028 0026      	move.l 38(a0),d0
     59a:	2079 0010 329c 	movea.l 10329c <custom>,a0
     5a0:	2140 0080      	move.l d0,128(a0)
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
     5a4:	2079 0010 32a4 	movea.l 1032a4 <GfxBase>,a0
     5aa:	2028 0032      	move.l 50(a0),d0
     5ae:	2079 0010 329c 	movea.l 10329c <custom>,a0
     5b4:	2140 0084      	move.l d0,132(a0)
	custom->copjmp1=0x7fff; //start coppper
     5b8:	2079 0010 329c 	movea.l 10329c <custom>,a0
     5be:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
     5c4:	3039 0010 32aa 	move.w 1032aa <SystemInts>,d0
     5ca:	2079 0010 329c 	movea.l 10329c <custom>,a0
     5d0:	0040 8000      	ori.w #-32768,d0
     5d4:	3140 009a      	move.w d0,154(a0)
	custom->dmacon=SystemDMA|0x8000;
     5d8:	3039 0010 32ac 	move.w 1032ac <SystemDMA>,d0
     5de:	2079 0010 329c 	movea.l 10329c <custom>,a0
     5e4:	0040 8000      	ori.w #-32768,d0
     5e8:	3140 0096      	move.w d0,150(a0)
	custom->adkcon=SystemADKCON|0x8000;
     5ec:	3039 0010 32ae 	move.w 1032ae <SystemADKCON>,d0
     5f2:	2079 0010 329c 	movea.l 10329c <custom>,a0
     5f8:	0040 8000      	ori.w #-32768,d0
     5fc:	3140 009e      	move.w d0,158(a0)
	WaitTOF();
	WaitBlit();	*()
	//DisownBlitter();
	//Enable();
	//Permit();*/
}
     600:	4e75           	rts

00000602 <interruptHandler.lto_priv.1>:
	*copListCurrent++=offsetof(struct Custom, color[index]);
	*copListCurrent++=color;
	return copListCurrent;
}

static __attribute__((interrupt)) void interruptHandler() {
     602:	2f08           	move.l a0,-(sp)
     604:	2f00           	move.l d0,-(sp)
	custom->intreq=(1<<INTB_VERTB); custom->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     606:	2079 0010 329c 	movea.l 10329c <custom>,a0
     60c:	317c 0020 009c 	move.w #32,156(a0)
     612:	2079 0010 329c 	movea.l 10329c <custom>,a0
     618:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	frameCounter++;
     61e:	3039 0010 32bc 	move.w 1032bc <frameCounter>,d0
     624:	5240           	addq.w #1,d0
     626:	33c0 0010 32bc 	move.w d0,1032bc <frameCounter>
}
     62c:	201f           	move.l (sp)+,d0
     62e:	205f           	movea.l (sp)+,a0
     630:	4e73           	rte

00000632 <main>:
	*copListEnd++ = offsetof(struct Custom, diwstop);
	*copListEnd++ = (xstop-256)+((ystop-256)<<8);
	return copListEnd;
}

int main() {
     632:	4fef ffbc      	lea -68(sp),sp
     636:	48e7 3002      	movem.l d2-d3/a6,-(sp)
	ULONG tmp = 4;
     63a:	7004           	moveq #4,d0
     63c:	2f40 0048      	move.l d0,72(sp)
    SysBase = *((struct ExecBase**)tmp);
     640:	206f 0048      	movea.l 72(sp),a0
     644:	2010           	move.l (a0),d0
     646:	23c0 0010 3298 	move.l d0,103298 <SysBase>
	hw = (struct Custom*)0xdff000;
     64c:	23fc 00df f000 	move.l #14675968,103294 <hw>
     652:	0010 3294 

	SysBase = *((struct ExecBase**)4UL);
     656:	307c 0004      	movea.w #4,a0
     65a:	2010           	move.l (a0),d0
     65c:	23c0 0010 3298 	move.l d0,103298 <SysBase>
	custom = (struct Custom*)0xdff000;
     662:	23fc 00df f000 	move.l #14675968,10329c <custom>
     668:	0010 329c 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
     66c:	2f7c 0000 7516 	move.l #29974,68(sp)
     672:	0044 
     674:	42af 0040      	clr.l 64(sp)
     678:	2039 0010 3298 	move.l 103298 <SysBase>,d0
     67e:	2c40           	movea.l d0,a6
     680:	226f 0044      	movea.l 68(sp),a1
     684:	202f 0040      	move.l 64(sp),d0
     688:	4eae fdd8      	jsr -552(a6)
     68c:	2f40 003c      	move.l d0,60(sp)
     690:	202f 003c      	move.l 60(sp),d0
     694:	23c0 0010 32a4 	move.l d0,1032a4 <GfxBase>
	if (!GfxBase)
     69a:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
     6a0:	6614           	bne.s 6b6 <main+0x84>
		Exit(0);
     6a2:	42af 0038      	clr.l 56(sp)
     6a6:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     6ac:	2c40           	movea.l d0,a6
     6ae:	222f 0038      	move.l 56(sp),d1
     6b2:	4eae ff70      	jsr -144(a6)

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     6b6:	2f7c 0000 7527 	move.l #29991,52(sp)
     6bc:	0034 
     6be:	42af 0030      	clr.l 48(sp)
     6c2:	2039 0010 3298 	move.l 103298 <SysBase>,d0
     6c8:	2c40           	movea.l d0,a6
     6ca:	226f 0034      	movea.l 52(sp),a1
     6ce:	202f 0030      	move.l 48(sp),d0
     6d2:	4eae fdd8      	jsr -552(a6)
     6d6:	2f40 002c      	move.l d0,44(sp)
     6da:	202f 002c      	move.l 44(sp),d0
     6de:	23c0 0010 32a0 	move.l d0,1032a0 <DOSBase>
	if (!DOSBase)
     6e4:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     6ea:	6614           	bne.s 700 <main+0xce>
		Exit(0);
     6ec:	42af 0028      	clr.l 40(sp)
     6f0:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     6f6:	2c40           	movea.l d0,a6
     6f8:	222f 0028      	move.l 40(sp),d1
     6fc:	4eae ff70      	jsr -144(a6)

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
     700:	4879 0000 7533 	pea 7533 <c2p1x1_8_c5_gen_pixels+0x21>
     706:	4eba 6700      	jsr 6e08 <KPrintF>(pc)
     70a:	588f           	addq.l #4,sp
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
     70c:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     712:	2c40           	movea.l d0,a6
     714:	4eae ffc4      	jsr -60(a6)
     718:	2f40 0024      	move.l d0,36(sp)
     71c:	202f 0024      	move.l 36(sp),d0
     720:	2f40 0020      	move.l d0,32(sp)
     724:	2f7c 0000 754f 	move.l #30031,28(sp)
     72a:	001c 
     72c:	700f           	moveq #15,d0
     72e:	2f40 0018      	move.l d0,24(sp)
     732:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     738:	2c40           	movea.l d0,a6
     73a:	222f 0020      	move.l 32(sp),d1
     73e:	242f 001c      	move.l 28(sp),d2
     742:	262f 0018      	move.l 24(sp),d3
     746:	4eae ffd0      	jsr -48(a6)
     74a:	2f40 0014      	move.l d0,20(sp)
	Delay(50);
     74e:	7032           	moveq #50,d0
     750:	2f40 0010      	move.l d0,16(sp)
     754:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     75a:	2c40           	movea.l d0,a6
     75c:	222f 0010      	move.l 16(sp),d1
     760:	4eae ff3a      	jsr -198(a6)
	//warpmode(0);

	//TakeSystem();


	WaitVbl();
     764:	4eba fdca      	jsr 530 <WaitVbl>(pc)
	
    hw->dmacon = 0b1000011111111111;
     768:	2079 0010 3294 	movea.l 103294 <hw>,a0
     76e:	317c 87ff 0096 	move.w #-30721,150(a0)
	//c2p();
  	Zoom_InitRun();
     774:	4eba 0906      	jsr 107c <Zoom_InitRun>(pc)

	for(int i=0;i<500;i++) {
     778:	42af 004c      	clr.l 76(sp)
     77c:	6008           	bra.s 786 <main+0x154>
		WaitVbl();
     77e:	4eba fdb0      	jsr 530 <WaitVbl>(pc)
	for(int i=0;i<500;i++) {
     782:	52af 004c      	addq.l #1,76(sp)
     786:	0caf 0000 01f3 	cmpi.l #499,76(sp)
     78c:	004c 
     78e:	6fee           	ble.s 77e <main+0x14c>
	}
	ULONG *bp = 0x100;
     790:	2f7c 0000 0100 	move.l #256,12(sp)
     796:	000c 
  	*bp = 0;
     798:	206f 000c      	movea.l 12(sp),a0
     79c:	4290           	clr.l (a0)
	Zoom_Dealloc();
     79e:	4eba 0b74      	jsr 1314 <Zoom_Dealloc>(pc)
	*bp = 0;
     7a2:	206f 000c      	movea.l 12(sp),a0
     7a6:	4290           	clr.l (a0)
     7a8:	7000           	moveq #0,d0
	// END
	FreeSystem();

	/*CloseLibrary((struct Library*)DOSBase);
	CloseLibrary((struct Library*)GfxBase);*/
}
     7aa:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     7ae:	4fef 0044      	lea 68(sp),sp
     7b2:	4e75           	rts

000007b4 <SwScrollerTest>:

char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
     7b4:	4fef ff98      	lea -104(sp),sp
     7b8:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  PrepareDisplaySW();
     7bc:	4eba 0218      	jsr 9d6 <PrepareDisplaySW>(pc)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     7c0:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
     7c6:	4878 0010      	pea 10 <_start+0x10>
     7ca:	4879 0000 a5ec 	pea a5ec <ClsSprites>
     7d0:	42a7           	clr.l -(sp)
     7d2:	2f00           	move.l d0,-(sp)
     7d4:	4eba 1f54      	jsr 272a <TestCopperlistBatch>(pc)
     7d8:	4fef 0010      	lea 16(sp),sp
     7dc:	4a80           	tst.l d0
     7de:	6642           	bne.s 822 <SwScrollerTest+0x6e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     7e0:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     7e6:	2c40           	movea.l d0,a6
     7e8:	4eae ffc4      	jsr -60(a6)
     7ec:	2f40 0070      	move.l d0,112(sp)
     7f0:	202f 0070      	move.l 112(sp),d0
     7f4:	2f40 006c      	move.l d0,108(sp)
     7f8:	2f7c 0000 7570 	move.l #30064,104(sp)
     7fe:	0068 
     800:	702c           	moveq #44,d0
     802:	2f40 0064      	move.l d0,100(sp)
     806:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     80c:	2c40           	movea.l d0,a6
     80e:	222f 006c      	move.l 108(sp),d1
     812:	242f 0068      	move.l 104(sp),d2
     816:	262f 0064      	move.l 100(sp),d3
     81a:	4eae ffd0      	jsr -48(a6)
     81e:	2f40 0060      	move.l d0,96(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     822:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
     828:	4878 000c      	pea c <_start+0xc>
     82c:	4879 0000 a62c 	pea a62c <ClScreen>
     832:	4878 0010      	pea 10 <_start+0x10>
     836:	2f00           	move.l d0,-(sp)
     838:	4eba 1ef0      	jsr 272a <TestCopperlistBatch>(pc)
     83c:	4fef 0010      	lea 16(sp),sp
     840:	4a80           	tst.l d0
     842:	6642           	bne.s 886 <SwScrollerTest+0xd2>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     844:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     84a:	2c40           	movea.l d0,a6
     84c:	4eae ffc4      	jsr -60(a6)
     850:	2f40 005c      	move.l d0,92(sp)
     854:	202f 005c      	move.l 92(sp),d0
     858:	2f40 0058      	move.l d0,88(sp)
     85c:	2f7c 0000 75a6 	move.l #30118,84(sp)
     862:	0054 
     864:	7036           	moveq #54,d0
     866:	2f40 0050      	move.l d0,80(sp)
     86a:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     870:	2c40           	movea.l d0,a6
     872:	222f 0058      	move.l 88(sp),d1
     876:	242f 0054      	move.l 84(sp),d2
     87a:	262f 0050      	move.l 80(sp),d3
     87e:	4eae ffd0      	jsr -48(a6)
     882:	2f40 004c      	move.l d0,76(sp)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     886:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
     88c:	4878 0002      	pea 2 <_start+0x2>
     890:	4879 0000 a56c 	pea a56c <ClColor>
     896:	4878 001e      	pea 1e <_start+0x1e>
     89a:	2f00           	move.l d0,-(sp)
     89c:	4eba 1e8c      	jsr 272a <TestCopperlistBatch>(pc)
     8a0:	4fef 0010      	lea 16(sp),sp
     8a4:	4a80           	tst.l d0
     8a6:	6642           	bne.s 8ea <SwScrollerTest+0x136>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     8a8:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     8ae:	2c40           	movea.l d0,a6
     8b0:	4eae ffc4      	jsr -60(a6)
     8b4:	2f40 0048      	move.l d0,72(sp)
     8b8:	202f 0048      	move.l 72(sp),d0
     8bc:	2f40 0044      	move.l d0,68(sp)
     8c0:	2f7c 0000 75dd 	move.l #30173,64(sp)
     8c6:	0040 
     8c8:	7021           	moveq #33,d0
     8ca:	2f40 003c      	move.l d0,60(sp)
     8ce:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     8d4:	2c40           	movea.l d0,a6
     8d6:	222f 0044      	move.l 68(sp),d1
     8da:	242f 0040      	move.l 64(sp),d2
     8de:	262f 003c      	move.l 60(sp),d3
     8e2:	4eae ffd0      	jsr -48(a6)
     8e6:	2f40 0038      	move.l d0,56(sp)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     8ea:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
     8f0:	4878 fffe      	pea fffffffe <_end+0xffefcd12>
     8f4:	4878 0020      	pea 20 <_start+0x20>
     8f8:	2f00           	move.l d0,-(sp)
     8fa:	4eba 1e6c      	jsr 2768 <TestCopperlistPos>(pc)
     8fe:	4fef 000c      	lea 12(sp),sp
     902:	4a80           	tst.l d0
     904:	6642           	bne.s 948 <SwScrollerTest+0x194>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     906:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     90c:	2c40           	movea.l d0,a6
     90e:	4eae ffc4      	jsr -60(a6)
     912:	2f40 0034      	move.l d0,52(sp)
     916:	202f 0034      	move.l 52(sp),d0
     91a:	2f40 0030      	move.l d0,48(sp)
     91e:	2f7c 0000 75ff 	move.l #30207,44(sp)
     924:	002c 
     926:	7022           	moveq #34,d0
     928:	2f40 0028      	move.l d0,40(sp)
     92c:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     932:	2c40           	movea.l d0,a6
     934:	222f 0030      	move.l 48(sp),d1
     938:	242f 002c      	move.l 44(sp),d2
     93c:	262f 0028      	move.l 40(sp),d3
     940:	4eae ffd0      	jsr -48(a6)
     944:	2f40 0024      	move.l d0,36(sp)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     948:	2239 0000 b7a8 	move.l b7a8 <sw_text>,d1
     94e:	2039 0010 3284 	move.l 103284 <DrawBuffer>,d0
     954:	2f01           	move.l d1,-(sp)
     956:	2f00           	move.l d0,-(sp)
     958:	4879 0000 b7ac 	pea b7ac <sw_testfont>
     95e:	4eba 0380      	jsr ce0 <WriteFont>(pc)
     962:	4fef 000c      	lea 12(sp),sp

  UWORD *tstpointer = (UWORD *)DrawBuffer;
     966:	2f79 0010 3284 	move.l 103284 <DrawBuffer>,32(sp)
     96c:	0020 
  if( *tstpointer != 0xff00)
     96e:	206f 0020      	movea.l 32(sp),a0
     972:	3010           	move.w (a0),d0
     974:	0c40 ff00      	cmpi.w #-256,d0
     978:	6742           	beq.s 9bc <SwScrollerTest+0x208>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     97a:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     980:	2c40           	movea.l d0,a6
     982:	4eae ffc4      	jsr -60(a6)
     986:	2f40 001c      	move.l d0,28(sp)
     98a:	202f 001c      	move.l 28(sp),d0
     98e:	2f40 0018      	move.l d0,24(sp)
     992:	2f7c 0000 7622 	move.l #30242,20(sp)
     998:	0014 
     99a:	7031           	moveq #49,d0
     99c:	2f40 0010      	move.l d0,16(sp)
     9a0:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     9a6:	2c40           	movea.l d0,a6
     9a8:	222f 0018      	move.l 24(sp),d1
     9ac:	242f 0014      	move.l 20(sp),d2
     9b0:	262f 0010      	move.l 16(sp),d3
     9b4:	4eae ffd0      	jsr -48(a6)
     9b8:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
     9bc:	2f3c 0000 c800 	move.l #51200,-(sp)
     9c2:	4878 0084      	pea 84 <_start+0x84>
     9c6:	4eba f718      	jsr e0 <FreeDisplay>(pc)
     9ca:	508f           	addq.l #8,sp
     9cc:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     9d0:	4fef 0068      	lea 104(sp),sp
     9d4:	4e75           	rts

000009d6 <PrepareDisplaySW>:
 #include "swscroller.h"
 #include "utils.h"
 
 INCBIN(swfont, "raw/ruby16_8_1.raw");

 int PrepareDisplaySW() {
     9d6:	4fef ffb8      	lea -72(sp),sp
     9da:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildSW();
     9de:	4eba 017e      	jsr b5e <ClbuildSW>(pc)
     9e2:	23c0 0010 327c 	move.l d0,10327c <Copperlist1>
  Copperlist2 = ClbuildSW();
     9e8:	4eba 0174      	jsr b5e <ClbuildSW>(pc)
     9ec:	23c0 0010 3280 	move.l d0,103280 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     9f2:	2f7c 0000 c800 	move.l #51200,80(sp)
     9f8:	0050 
     9fa:	7002           	moveq #2,d0
     9fc:	2f40 004c      	move.l d0,76(sp)
     a00:	2039 0010 3298 	move.l 103298 <SysBase>,d0
     a06:	2c40           	movea.l d0,a6
     a08:	202f 0050      	move.l 80(sp),d0
     a0c:	222f 004c      	move.l 76(sp),d1
     a10:	4eae ff3a      	jsr -198(a6)
     a14:	2f40 0048      	move.l d0,72(sp)
     a18:	202f 0048      	move.l 72(sp),d0
     a1c:	23c0 0010 3274 	move.l d0,103274 <Bitplane1>
  if(Bitplane1 == 0) {
     a22:	2039 0010 3274 	move.l 103274 <Bitplane1>,d0
     a28:	6658           	bne.s a82 <PrepareDisplaySW+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     a2a:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     a30:	2c40           	movea.l d0,a6
     a32:	4eae ffc4      	jsr -60(a6)
     a36:	2f40 0044      	move.l d0,68(sp)
     a3a:	202f 0044      	move.l 68(sp),d0
     a3e:	2f40 0040      	move.l d0,64(sp)
     a42:	2f7c 0000 7c05 	move.l #31749,60(sp)
     a48:	003c 
     a4a:	7026           	moveq #38,d0
     a4c:	2f40 0038      	move.l d0,56(sp)
     a50:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     a56:	2c40           	movea.l d0,a6
     a58:	222f 0040      	move.l 64(sp),d1
     a5c:	242f 003c      	move.l 60(sp),d2
     a60:	262f 0038      	move.l 56(sp),d3
     a64:	4eae ffd0      	jsr -48(a6)
     a68:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
     a6c:	7001           	moveq #1,d0
     a6e:	2f40 0030      	move.l d0,48(sp)
     a72:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     a78:	2c40           	movea.l d0,a6
     a7a:	222f 0030      	move.l 48(sp),d1
     a7e:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
     a82:	2039 0010 3274 	move.l 103274 <Bitplane1>,d0
     a88:	23c0 0010 3284 	move.l d0,103284 <DrawBuffer>
  DrawCopper = Copperlist1;
     a8e:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
     a94:	23c0 0010 328c 	move.l d0,10328c <DrawCopper>
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     a9a:	2f7c 0000 c800 	move.l #51200,44(sp)
     aa0:	002c 
     aa2:	7002           	moveq #2,d0
     aa4:	2f40 0028      	move.l d0,40(sp)
     aa8:	2039 0010 3298 	move.l 103298 <SysBase>,d0
     aae:	2c40           	movea.l d0,a6
     ab0:	202f 002c      	move.l 44(sp),d0
     ab4:	222f 0028      	move.l 40(sp),d1
     ab8:	4eae ff3a      	jsr -198(a6)
     abc:	2f40 0024      	move.l d0,36(sp)
     ac0:	202f 0024      	move.l 36(sp),d0
     ac4:	23c0 0010 3278 	move.l d0,103278 <Bitplane2>
  if(Bitplane2 == 0) {
     aca:	2039 0010 3278 	move.l 103278 <Bitplane2>,d0
     ad0:	6658           	bne.s b2a <PrepareDisplaySW+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     ad2:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     ad8:	2c40           	movea.l d0,a6
     ada:	4eae ffc4      	jsr -60(a6)
     ade:	2f40 0020      	move.l d0,32(sp)
     ae2:	202f 0020      	move.l 32(sp),d0
     ae6:	2f40 001c      	move.l d0,28(sp)
     aea:	2f7c 0000 7c2c 	move.l #31788,24(sp)
     af0:	0018 
     af2:	7026           	moveq #38,d0
     af4:	2f40 0014      	move.l d0,20(sp)
     af8:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     afe:	2c40           	movea.l d0,a6
     b00:	222f 001c      	move.l 28(sp),d1
     b04:	242f 0018      	move.l 24(sp),d2
     b08:	262f 0014      	move.l 20(sp),d3
     b0c:	4eae ffd0      	jsr -48(a6)
     b10:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     b14:	7001           	moveq #1,d0
     b16:	2f40 000c      	move.l d0,12(sp)
     b1a:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     b20:	2c40           	movea.l d0,a6
     b22:	222f 000c      	move.l 12(sp),d1
     b26:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
     b2a:	2039 0010 3278 	move.l 103278 <Bitplane2>,d0
     b30:	23c0 0010 3288 	move.l d0,103288 <ViewBuffer>
  ViewCopper = Copperlist2;
     b36:	2039 0010 3280 	move.l 103280 <Copperlist2>,d0
     b3c:	23c0 0010 3290 	move.l d0,103290 <ViewCopper>
  SwapCl();
     b42:	4eba f65c      	jsr 1a0 <SwapCl>(pc)
  SetBplPointers();
     b46:	4eba f5fa      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
     b4a:	4eba f654      	jsr 1a0 <SwapCl>(pc)
  SetBplPointers();
     b4e:	4eba f5f2      	jsr 142 <SetBplPointers>(pc)
  return 0;
     b52:	7000           	moveq #0,d0
}
     b54:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     b58:	4fef 0048      	lea 72(sp),sp
     b5c:	4e75           	rts

00000b5e <ClbuildSW>:

ULONG * ClbuildSW() {
     b5e:	4fef ffc4      	lea -60(sp),sp
     b62:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
     b66:	2f7c 0000 0084 	move.l #132,48(sp)
     b6c:	0030 
     b6e:	7002           	moveq #2,d0
     b70:	2f40 002c      	move.l d0,44(sp)
     b74:	2039 0010 3298 	move.l 103298 <SysBase>,d0
     b7a:	2c40           	movea.l d0,a6
     b7c:	202f 0030      	move.l 48(sp),d0
     b80:	222f 002c      	move.l 44(sp),d1
     b84:	4eae ff3a      	jsr -198(a6)
     b88:	2f40 0028      	move.l d0,40(sp)
     b8c:	202f 0028      	move.l 40(sp),d0
     b90:	2f40 0024      	move.l d0,36(sp)
  
  if( retval == 0) {
     b94:	6658           	bne.s bee <ClbuildSW+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     b96:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     b9c:	2c40           	movea.l d0,a6
     b9e:	4eae ffc4      	jsr -60(a6)
     ba2:	2f40 0020      	move.l d0,32(sp)
     ba6:	202f 0020      	move.l 32(sp),d0
     baa:	2f40 001c      	move.l d0,28(sp)
     bae:	2f7c 0000 7c53 	move.l #31827,24(sp)
     bb4:	0018 
     bb6:	7228           	moveq #40,d1
     bb8:	2f41 0014      	move.l d1,20(sp)
     bbc:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     bc2:	2c40           	movea.l d0,a6
     bc4:	222f 001c      	move.l 28(sp),d1
     bc8:	242f 0018      	move.l 24(sp),d2
     bcc:	262f 0014      	move.l 20(sp),d3
     bd0:	4eae ffd0      	jsr -48(a6)
     bd4:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     bd8:	7401           	moveq #1,d2
     bda:	2f42 000c      	move.l d2,12(sp)
     bde:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
     be4:	2c40           	movea.l d0,a6
     be6:	222f 000c      	move.l 12(sp),d1
     bea:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
     bee:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
     bf4:	2f7c 0000 a5ec 	move.l #42476,64(sp)
     bfa:	0040 
  for(int i=0; i<16;i++)
     bfc:	42af 003c      	clr.l 60(sp)
     c00:	6024           	bra.s c26 <ClbuildSW+0xc8>
    *cl++ = *clpartinstruction++;
     c02:	222f 0040      	move.l 64(sp),d1
     c06:	2001           	move.l d1,d0
     c08:	5880           	addq.l #4,d0
     c0a:	2f40 0040      	move.l d0,64(sp)
     c0e:	202f 0044      	move.l 68(sp),d0
     c12:	2400           	move.l d0,d2
     c14:	5882           	addq.l #4,d2
     c16:	2f42 0044      	move.l d2,68(sp)
     c1a:	2041           	movea.l d1,a0
     c1c:	2210           	move.l (a0),d1
     c1e:	2040           	movea.l d0,a0
     c20:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
     c22:	52af 003c      	addq.l #1,60(sp)
     c26:	700f           	moveq #15,d0
     c28:	b0af 003c      	cmp.l 60(sp),d0
     c2c:	6cd4           	bge.s c02 <ClbuildSW+0xa4>
  clpartinstruction = ClScreen;
     c2e:	2f7c 0000 a62c 	move.l #42540,64(sp)
     c34:	0040 
  for(int i=0; i<12;i++)
     c36:	42af 0038      	clr.l 56(sp)
     c3a:	6024           	bra.s c60 <ClbuildSW+0x102>
    *cl++ = *clpartinstruction++;
     c3c:	222f 0040      	move.l 64(sp),d1
     c40:	2401           	move.l d1,d2
     c42:	5882           	addq.l #4,d2
     c44:	2f42 0040      	move.l d2,64(sp)
     c48:	202f 0044      	move.l 68(sp),d0
     c4c:	2400           	move.l d0,d2
     c4e:	5882           	addq.l #4,d2
     c50:	2f42 0044      	move.l d2,68(sp)
     c54:	2041           	movea.l d1,a0
     c56:	2210           	move.l (a0),d1
     c58:	2040           	movea.l d0,a0
     c5a:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
     c5c:	52af 0038      	addq.l #1,56(sp)
     c60:	700b           	moveq #11,d0
     c62:	b0af 0038      	cmp.l 56(sp),d0
     c66:	6cd4           	bge.s c3c <ClbuildSW+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
     c68:	202f 0044      	move.l 68(sp),d0
     c6c:	2200           	move.l d0,d1
     c6e:	5881           	addq.l #4,d1
     c70:	2f41 0044      	move.l d1,68(sp)
     c74:	2040           	movea.l d0,a0
     c76:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
     c7c:	202f 0044      	move.l 68(sp),d0
     c80:	2200           	move.l d0,d1
     c82:	5881           	addq.l #4,d1
     c84:	2f41 0044      	move.l d1,68(sp)
     c88:	2040           	movea.l d0,a0
     c8a:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
     c90:	2f7c 0000 a56c 	move.l #42348,64(sp)
     c96:	0040 
  for(int i=0; i<2;i++)
     c98:	42af 0034      	clr.l 52(sp)
     c9c:	6024           	bra.s cc2 <ClbuildSW+0x164>
    *cl++ = *clpartinstruction++;
     c9e:	222f 0040      	move.l 64(sp),d1
     ca2:	2001           	move.l d1,d0
     ca4:	5880           	addq.l #4,d0
     ca6:	2f40 0040      	move.l d0,64(sp)
     caa:	202f 0044      	move.l 68(sp),d0
     cae:	2400           	move.l d0,d2
     cb0:	5882           	addq.l #4,d2
     cb2:	2f42 0044      	move.l d2,68(sp)
     cb6:	2041           	movea.l d1,a0
     cb8:	2210           	move.l (a0),d1
     cba:	2040           	movea.l d0,a0
     cbc:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
     cbe:	52af 0034      	addq.l #1,52(sp)
     cc2:	7001           	moveq #1,d0
     cc4:	b0af 0034      	cmp.l 52(sp),d0
     cc8:	6cd4           	bge.s c9e <ClbuildSW+0x140>

  *cl = 0xfffffffe;
     cca:	206f 0044      	movea.l 68(sp),a0
     cce:	72fe           	moveq #-2,d1
     cd0:	2081           	move.l d1,(a0)

  return retval;
     cd2:	202f 0024      	move.l 36(sp),d0
}
     cd6:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     cda:	4fef 003c      	lea 60(sp),sp
     cde:	4e75           	rts

00000ce0 <WriteFont>:

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
     ce0:	4fef fff0      	lea -16(sp),sp
  UWORD *bmpptr = Destination;
     ce4:	2f6f 0018 000c 	move.l 24(sp),12(sp)
  UWORD *fntptr = font;
     cea:	2f6f 0014 0008 	move.l 20(sp),8(sp)

  char charpos = *text;
     cf0:	206f 001c      	movea.l 28(sp),a0
     cf4:	1f50 0003      	move.b (a0),3(sp)
  charpos -= 0x20;
     cf8:	102f 0003      	move.b 3(sp),d0
     cfc:	0600 ffe0      	addi.b #-32,d0
     d00:	1f40 0003      	move.b d0,3(sp)
  charpos = charpos<<3;
     d04:	102f 0003      	move.b 3(sp),d0
     d08:	4880           	ext.w d0
     d0a:	48c0           	ext.l d0
     d0c:	e788           	lsl.l #3,d0
     d0e:	1f40 0003      	move.b d0,3(sp)
  fntptr += charpos;
     d12:	102f 0003      	move.b 3(sp),d0
     d16:	4880           	ext.w d0
     d18:	3040           	movea.w d0,a0
     d1a:	2008           	move.l a0,d0
     d1c:	d088           	add.l a0,d0
     d1e:	d1af 0008      	add.l d0,8(sp)
  for(int i=1;i<=8;i++) {
     d22:	7001           	moveq #1,d0
     d24:	2f40 0004      	move.l d0,4(sp)
     d28:	6020           	bra.s d4a <WriteFont+0x6a>
    *bmpptr = *fntptr++;
     d2a:	202f 0008      	move.l 8(sp),d0
     d2e:	2200           	move.l d0,d1
     d30:	5481           	addq.l #2,d1
     d32:	2f41 0008      	move.l d1,8(sp)
     d36:	2040           	movea.l d0,a0
     d38:	3010           	move.w (a0),d0
     d3a:	206f 000c      	movea.l 12(sp),a0
     d3e:	3080           	move.w d0,(a0)
    bmpptr += 40;
     d40:	7050           	moveq #80,d0
     d42:	d1af 000c      	add.l d0,12(sp)
  for(int i=1;i<=8;i++) {
     d46:	52af 0004      	addq.l #1,4(sp)
     d4a:	7208           	moveq #8,d1
     d4c:	b2af 0004      	cmp.l 4(sp),d1
     d50:	6cd8           	bge.s d2a <WriteFont+0x4a>
  }

}
     d52:	4fef 0010      	lea 16(sp),sp
     d56:	4e75           	rts

00000d58 <Zoom_VblankHandler>:
  }
}*/

void Zoom_VblankHandler() {

  Zoom_Counter++;
     d58:	3039 0010 32d4 	move.w 1032d4 <Zoom_Counter>,d0
     d5e:	5240           	addq.w #1,d0
     d60:	33c0 0010 32d4 	move.w d0,1032d4 <Zoom_Counter>
  SwapCl();
     d66:	4eba f438      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     d6a:	33fc 0001 0010 	move.w #1,1032da <Zoom_MouseReleased>
     d70:	32da 
  if( MouseLeft())
     d72:	4eba f4ee      	jsr 262 <MouseLeft>(pc)
     d76:	4a40           	tst.w d0
     d78:	6708           	beq.s d82 <Zoom_VblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     d7a:	33fc 0001 0010 	move.w #1,1032dc <Zoom_Mousepressed>
     d80:	32dc 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     d82:	3039 0010 32dc 	move.w 1032dc <Zoom_Mousepressed>,d0
     d88:	0c40 0001      	cmpi.w #1,d0
     d8c:	6616           	bne.s da4 <Zoom_VblankHandler+0x4c>
     d8e:	4eba f4d2      	jsr 262 <MouseLeft>(pc)
     d92:	4a40           	tst.w d0
     d94:	660e           	bne.s da4 <Zoom_VblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     d96:	33fc 0001 0010 	move.w #1,1032da <Zoom_MouseReleased>
     d9c:	32da 
    Zoom_Mousepressed = 0;
     d9e:	4279 0010 32dc 	clr.w 1032dc <Zoom_Mousepressed>
  }
      
      Zoom_MouseReleased = 0;
     da4:	4279 0010 32da 	clr.w 1032da <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom <= 2) {
     daa:	3039 0010 32e2 	move.w 1032e2 <Zoom_LevelOf102Zoom>,d0
     db0:	0c40 0002      	cmpi.w #2,d0
     db4:	6244           	bhi.s dfa <Zoom_VblankHandler+0xa2>
 
        if( Zoom_LevelOfZoom == 17)
     db6:	3039 0010 32e0 	move.w 1032e0 <Zoom_LevelOfZoom>,d0
     dbc:	0c40 0011      	cmpi.w #17,d0
     dc0:	660a           	bne.s dcc <Zoom_VblankHandler+0x74>
          Zoom_LevelOfZoom = 0;
     dc2:	33fc 0000 0010 	move.w #0,1032e0 <Zoom_LevelOfZoom>
     dc8:	32e0 
     dca:	600e           	bra.s dda <Zoom_VblankHandler+0x82>
        else
          Zoom_LevelOfZoom++;
     dcc:	3039 0010 32e0 	move.w 1032e0 <Zoom_LevelOfZoom>,d0
     dd2:	5240           	addq.w #1,d0
     dd4:	33c0 0010 32e0 	move.w d0,1032e0 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     dda:	33fc 000f 0010 	move.w #15,1032e2 <Zoom_LevelOf102Zoom>
     de0:	32e2 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     de2:	3039 0010 32e0 	move.w 1032e0 <Zoom_LevelOfZoom>,d0
     de8:	3000           	move.w d0,d0
     dea:	0280 0000 ffff 	andi.l #65535,d0
     df0:	2f00           	move.l d0,-(sp)
     df2:	4eba 1020      	jsr 1e14 <Zoom_SwapBuffers>(pc)
     df6:	588f           	addq.l #4,sp
     df8:	600e           	bra.s e08 <Zoom_VblankHandler+0xb0>
      } else 
        Zoom_LevelOf102Zoom-=2;
     dfa:	3039 0010 32e2 	move.w 1032e2 <Zoom_LevelOf102Zoom>,d0
     e00:	5540           	subq.w #2,d0
     e02:	33c0 0010 32e2 	move.w d0,1032e2 <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     e08:	2239 0010 328c 	move.l 10328c <DrawCopper>,d1
     e0e:	3039 0010 32e2 	move.w 1032e2 <Zoom_LevelOf102Zoom>,d0
     e14:	3000           	move.w d0,d0
     e16:	0280 0000 ffff 	andi.l #65535,d0
     e1c:	2f01           	move.l d1,-(sp)
     e1e:	2f00           	move.l d0,-(sp)
     e20:	4eba f5ea      	jsr 40c <Zoom_Shrink102>(pc)
     e24:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     e26:	2239 0010 328c 	move.l 10328c <DrawCopper>,d1
     e2c:	2039 0010 3288 	move.l 103288 <ViewBuffer>,d0
     e32:	2f01           	move.l d1,-(sp)
     e34:	2f00           	move.l d0,-(sp)
     e36:	4eba 0f44      	jsr 1d7c <Zoom_SetBplPointers>(pc)
     e3a:	508f           	addq.l #8,sp
 
}
     e3c:	4e75           	rts

00000e3e <Zoom_ReverseVblankHandler>:


void Zoom_ReverseVblankHandler() {
  
  Zoom_Counter++;
     e3e:	3039 0010 32d4 	move.w 1032d4 <Zoom_Counter>,d0
     e44:	5240           	addq.w #1,d0
     e46:	33c0 0010 32d4 	move.w d0,1032d4 <Zoom_Counter>
  SwapCl();
     e4c:	4eba f352      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     e50:	33fc 0001 0010 	move.w #1,1032da <Zoom_MouseReleased>
     e56:	32da 
  if( MouseLeft())
     e58:	4eba f408      	jsr 262 <MouseLeft>(pc)
     e5c:	4a40           	tst.w d0
     e5e:	6708           	beq.s e68 <Zoom_ReverseVblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     e60:	33fc 0001 0010 	move.w #1,1032dc <Zoom_Mousepressed>
     e66:	32dc 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     e68:	3039 0010 32dc 	move.w 1032dc <Zoom_Mousepressed>,d0
     e6e:	0c40 0001      	cmpi.w #1,d0
     e72:	6616           	bne.s e8a <Zoom_ReverseVblankHandler+0x4c>
     e74:	4eba f3ec      	jsr 262 <MouseLeft>(pc)
     e78:	4a40           	tst.w d0
     e7a:	660e           	bne.s e8a <Zoom_ReverseVblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     e7c:	33fc 0001 0010 	move.w #1,1032da <Zoom_MouseReleased>
     e82:	32da 
    Zoom_Mousepressed = 0;
     e84:	4279 0010 32dc 	clr.w 1032dc <Zoom_Mousepressed>
    /*if( MouseLeft()) {
      while (MouseLeft())
      {
      }*/
      
      Zoom_MouseReleased = 0;
     e8a:	4279 0010 32da 	clr.w 1032da <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 15) {
     e90:	3039 0010 32e2 	move.w 1032e2 <Zoom_LevelOf102Zoom>,d0
     e96:	0c40 000f      	cmpi.w #15,d0
     e9a:	6640           	bne.s edc <Zoom_ReverseVblankHandler+0x9e>
 
        if( Zoom_LevelOfZoom == 0)
     e9c:	3039 0010 32e0 	move.w 1032e0 <Zoom_LevelOfZoom>,d0
     ea2:	660a           	bne.s eae <Zoom_ReverseVblankHandler+0x70>
          Zoom_LevelOfZoom = 17;
     ea4:	33fc 0011 0010 	move.w #17,1032e0 <Zoom_LevelOfZoom>
     eaa:	32e0 
     eac:	600e           	bra.s ebc <Zoom_ReverseVblankHandler+0x7e>
        else
          Zoom_LevelOfZoom--;
     eae:	3039 0010 32e0 	move.w 1032e0 <Zoom_LevelOfZoom>,d0
     eb4:	5340           	subq.w #1,d0
     eb6:	33c0 0010 32e0 	move.w d0,1032e0 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 0;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     ebc:	33fc 0000 0010 	move.w #0,1032e2 <Zoom_LevelOf102Zoom>
     ec2:	32e2 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     ec4:	3039 0010 32e0 	move.w 1032e0 <Zoom_LevelOfZoom>,d0
     eca:	3000           	move.w d0,d0
     ecc:	0280 0000 ffff 	andi.l #65535,d0
     ed2:	2f00           	move.l d0,-(sp)
     ed4:	4eba 0f3e      	jsr 1e14 <Zoom_SwapBuffers>(pc)
     ed8:	588f           	addq.l #4,sp
     eda:	600e           	bra.s eea <Zoom_ReverseVblankHandler+0xac>
      } else 
        Zoom_LevelOf102Zoom++;
     edc:	3039 0010 32e2 	move.w 1032e2 <Zoom_LevelOf102Zoom>,d0
     ee2:	5240           	addq.w #1,d0
     ee4:	33c0 0010 32e2 	move.w d0,1032e2 <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     eea:	2239 0010 328c 	move.l 10328c <DrawCopper>,d1
     ef0:	3039 0010 32e2 	move.w 1032e2 <Zoom_LevelOf102Zoom>,d0
     ef6:	3000           	move.w d0,d0
     ef8:	0280 0000 ffff 	andi.l #65535,d0
     efe:	2f01           	move.l d1,-(sp)
     f00:	2f00           	move.l d0,-(sp)
     f02:	4eba f508      	jsr 40c <Zoom_Shrink102>(pc)
     f06:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     f08:	2239 0010 328c 	move.l 10328c <DrawCopper>,d1
     f0e:	2039 0010 3288 	move.l 103288 <ViewBuffer>,d0
     f14:	2f01           	move.l d1,-(sp)
     f16:	2f00           	move.l d0,-(sp)
     f18:	4eba 0e62      	jsr 1d7c <Zoom_SetBplPointers>(pc)
     f1c:	508f           	addq.l #8,sp
 
}
     f1e:	4e75           	rts

00000f20 <Zoom_LoadImage>:

void Zoom_LoadImage( ULONG *destination) {  
     f20:	4fef fff4      	lea -12(sp),sp
     f24:	2f0e           	move.l a6,-(sp)
  CopyMem( rawzoom, destination, ZMBPLSIZE);
     f26:	2f79 0000 b800 	move.l b800 <rawzoom>,12(sp)
     f2c:	000c 
     f2e:	2f6f 0014 0008 	move.l 20(sp),8(sp)
     f34:	2f7c 0000 df20 	move.l #57120,4(sp)
     f3a:	0004 
     f3c:	2039 0010 3298 	move.l 103298 <SysBase>,d0
     f42:	2c40           	movea.l d0,a6
     f44:	206f 000c      	movea.l 12(sp),a0
     f48:	226f 0008      	movea.l 8(sp),a1
     f4c:	202f 0004      	move.l 4(sp),d0
     f50:	4eae fd90      	jsr -624(a6)
}
     f54:	2c5f           	movea.l (sp)+,a6
     f56:	4fef 000c      	lea 12(sp),sp
     f5a:	4e75           	rts

00000f5c <Zoom_CopyWord>:

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080008, 
                                                       0x010a0000, 0x01001200 };

void  Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height) {  
     f5c:	598f           	subq.l #4,sp
     f5e:	202f 0010      	move.l 16(sp),d0
     f62:	3000           	move.w d0,d0
     f64:	3f40 0002      	move.w d0,2(sp)

  WaitBlt();
     f68:	4eba f14a      	jsr b4 <WaitBlt>(pc)

  hw->bltapt = (UWORD *) source;
     f6c:	2079 0010 3294 	movea.l 103294 <hw>,a0
     f72:	216f 0008 0050 	move.l 8(sp),80(a0)
  hw->bltdpt = (UWORD *) destination;
     f78:	2079 0010 3294 	movea.l 103294 <hw>,a0
     f7e:	216f 000c 0054 	move.l 12(sp),84(a0)
  hw->bltsize = (height<<6)+2;
     f84:	302f 0002      	move.w 2(sp),d0
     f88:	ed48           	lsl.w #6,d0
     f8a:	2079 0010 3294 	movea.l 103294 <hw>,a0
     f90:	5440           	addq.w #2,d0
     f92:	3140 0058      	move.w d0,88(a0)

}
     f96:	588f           	addq.l #4,sp
     f98:	4e75           	rts

00000f9a <Zoom_ZoomBlit>:

void Zoom_ZoomBlit( UWORD *source, UWORD *destination, UWORD height) {
     f9a:	518f           	subq.l #8,sp
     f9c:	202f 0014      	move.l 20(sp),d0
     fa0:	3000           	move.w d0,d0
     fa2:	3f40 0002      	move.w d0,2(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B

  UWORD *blta = source + ZoomBlit_Increment4SrcA;
     fa6:	3039 0010 32ca 	move.w 1032ca <ZoomBlit_Increment4SrcA>,d0
     fac:	3000           	move.w d0,d0
     fae:	0280 0000 ffff 	andi.l #65535,d0
     fb4:	d080           	add.l d0,d0
     fb6:	222f 000c      	move.l 12(sp),d1
     fba:	d280           	add.l d0,d1
     fbc:	2f41 0004      	move.l d1,4(sp)
  WaitBlt();
     fc0:	4eba f0f2      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  
  hw->bltapt = blta;
     fc4:	2079 0010 3294 	movea.l 103294 <hw>,a0
     fca:	216f 0004 0050 	move.l 4(sp),80(a0)
  hw->bltbpt = source;
     fd0:	2079 0010 3294 	movea.l 103294 <hw>,a0
     fd6:	216f 000c 004c 	move.l 12(sp),76(a0)
  hw->bltdpt = destination;
     fdc:	2079 0010 3294 	movea.l 103294 <hw>,a0
     fe2:	216f 0010 0054 	move.l 16(sp),84(a0)
  hw->bltsize = (height<<6)+2;
     fe8:	302f 0002      	move.w 2(sp),d0
     fec:	ed48           	lsl.w #6,d0
     fee:	2079 0010 3294 	movea.l 103294 <hw>,a0
     ff4:	5440           	addq.w #2,d0
     ff6:	3140 0058      	move.w d0,88(a0)

}
     ffa:	508f           	addq.l #8,sp
     ffc:	4e75           	rts

00000ffe <Zoom_ZoomBlit2>:

void Zoom_ZoomBlit2( UWORD *src4a, UWORD *src4b, UWORD *dst, UWORD height,
                                                 UWORD bltamod, UWORD bltbmod
                                                        , UWORD numofwords) {
     ffe:	518f           	subq.l #8,sp
    1000:	226f 0018      	movea.l 24(sp),a1
    1004:	206f 001c      	movea.l 28(sp),a0
    1008:	222f 0020      	move.l 32(sp),d1
    100c:	202f 0024      	move.l 36(sp),d0
    1010:	3249           	movea.w a1,a1
    1012:	3f49 0006      	move.w a1,6(sp)
    1016:	3048           	movea.w a0,a0
    1018:	3f48 0004      	move.w a0,4(sp)
    101c:	3201           	move.w d1,d1
    101e:	3f41 0002      	move.w d1,2(sp)
    1022:	3000           	move.w d0,d0
    1024:	3e80           	move.w d0,(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B
  hw->bltamod = bltamod;
    1026:	2079 0010 3294 	movea.l 103294 <hw>,a0
    102c:	316f 0004 0064 	move.w 4(sp),100(a0)
  hw->bltbmod = bltbmod;  
    1032:	2079 0010 3294 	movea.l 103294 <hw>,a0
    1038:	316f 0002 0062 	move.w 2(sp),98(a0)
  hw->bltapt = src4a;
    103e:	2079 0010 3294 	movea.l 103294 <hw>,a0
    1044:	216f 000c 0050 	move.l 12(sp),80(a0)
  hw->bltbpt = src4b;
    104a:	2079 0010 3294 	movea.l 103294 <hw>,a0
    1050:	216f 0010 004c 	move.l 16(sp),76(a0)
  hw->bltdpt = dst;
    1056:	2079 0010 3294 	movea.l 103294 <hw>,a0
    105c:	216f 0014 0054 	move.l 20(sp),84(a0)
  hw->bltsize = (height<<6)+numofwords;
    1062:	302f 0006      	move.w 6(sp),d0
    1066:	ed48           	lsl.w #6,d0
    1068:	2079 0010 3294 	movea.l 103294 <hw>,a0
    106e:	d057           	add.w (sp),d0
    1070:	3140 0058      	move.w d0,88(a0)
  
  WaitBlt();
    1074:	4eba f03e      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a  

}
    1078:	508f           	addq.l #8,sp
    107a:	4e75           	rts

0000107c <Zoom_InitRun>:


void Zoom_InitRun() {
    107c:	4fef ffe0      	lea -32(sp),sp
    1080:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    1082:	4279 0010 32d4 	clr.w 1032d4 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    1088:	7004           	moveq #4,d0
    108a:	2f40 0020      	move.l d0,32(sp)
    108e:	7002           	moveq #2,d0
    1090:	2f40 001c      	move.l d0,28(sp)
    1094:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    109a:	2c40           	movea.l d0,a6
    109c:	202f 0020      	move.l 32(sp),d0
    10a0:	222f 001c      	move.l 28(sp),d1
    10a4:	4eae ff3a      	jsr -198(a6)
    10a8:	2f40 0018      	move.l d0,24(sp)
    10ac:	202f 0018      	move.l 24(sp),d0
    10b0:	23c0 0010 32c2 	move.l d0,1032c2 <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 15;
    10b6:	33fc 000f 0010 	move.w #15,1032e2 <Zoom_LevelOf102Zoom>
    10bc:	32e2 
  ZoomHorizontal = 16;
    10be:	33fc 0010 0010 	move.w #16,1032e6 <ZoomHorizontal>
    10c4:	32e6 
  Zoom_PrepareDisplay();
    10c6:	4eba 0288      	jsr 1350 <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 15, Copperlist1);
    10ca:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    10d0:	2f00           	move.l d0,-(sp)
    10d2:	4878 000f      	pea f <_start+0xf>
    10d6:	4eba f334      	jsr 40c <Zoom_Shrink102>(pc)
    10da:	508f           	addq.l #8,sp
  Zoom_Shrink102( 15, Copperlist2);
    10dc:	2039 0010 3280 	move.l 103280 <Copperlist2>,d0
    10e2:	2f00           	move.l d0,-(sp)
    10e4:	4878 000f      	pea f <_start+0xf>
    10e8:	4eba f322      	jsr 40c <Zoom_Shrink102>(pc)
    10ec:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 1;
    10ee:	33fc 0001 0010 	move.w #1,1032e0 <Zoom_LevelOfZoom>
    10f4:	32e0 
  Zoom_Direction = 1;                                                  
    10f6:	33fc 0001 0010 	move.w #1,1032e4 <Zoom_Direction>
    10fc:	32e4 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    10fe:	7016           	moveq #22,d0
    1100:	2f40 0014      	move.l d0,20(sp)
    1104:	2f7c 0001 0001 	move.l #65537,16(sp)
    110a:	0010 
    110c:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    1112:	2c40           	movea.l d0,a6
    1114:	202f 0014      	move.l 20(sp),d0
    1118:	222f 0010      	move.l 16(sp),d1
    111c:	4eae ff3a      	jsr -198(a6)
    1120:	2f40 000c      	move.l d0,12(sp)
    1124:	202f 000c      	move.l 12(sp),d0
    1128:	23c0 0010 32cc 	move.l d0,1032cc <Zoom_vbint>
    112e:	2039 0010 32cc 	move.l 1032cc <Zoom_vbint>,d0
    1134:	673e           	beq.s 1174 <Zoom_InitRun+0xf8>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1136:	2079 0010 32cc 	movea.l 1032cc <Zoom_vbint>,a0
    113c:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    1142:	2079 0010 32cc 	movea.l 1032cc <Zoom_vbint>,a0
    1148:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    114e:	2079 0010 32cc 	movea.l 1032cc <Zoom_vbint>,a0
    1154:	217c 0000 7c79 	move.l #31865,10(a0)
    115a:	000a 
    Zoom_vbint->is_Data = NULL;
    115c:	2079 0010 32cc 	movea.l 1032cc <Zoom_vbint>,a0
    1162:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    1166:	2079 0010 32cc 	movea.l 1032cc <Zoom_vbint>,a0
    116c:	217c 0000 0d58 	move.l #3416,18(a0)
    1172:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    1174:	7005           	moveq #5,d0
    1176:	2f40 0008      	move.l d0,8(sp)
    117a:	2f79 0010 32cc 	move.l 1032cc <Zoom_vbint>,4(sp)
    1180:	0004 
    1182:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    1188:	2c40           	movea.l d0,a6
    118a:	202f 0008      	move.l 8(sp),d0
    118e:	226f 0004      	movea.l 4(sp),a1
    1192:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    1196:	2239 0010 3290 	move.l 103290 <ViewCopper>,d1
    119c:	2039 0010 3288 	move.l 103288 <ViewBuffer>,d0
    11a2:	2f01           	move.l d1,-(sp)
    11a4:	2f00           	move.l d0,-(sp)
    11a6:	4eba 0bd4      	jsr 1d7c <Zoom_SetBplPointers>(pc)
    11aa:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    11ac:	2239 0010 328c 	move.l 10328c <DrawCopper>,d1
    11b2:	2039 0010 3288 	move.l 103288 <ViewBuffer>,d0
    11b8:	2f01           	move.l d1,-(sp)
    11ba:	2f00           	move.l d0,-(sp)
    11bc:	4eba 0bbe      	jsr 1d7c <Zoom_SetBplPointers>(pc)
    11c0:	508f           	addq.l #8,sp
  SwapCl();
    11c2:	4eba efdc      	jsr 1a0 <SwapCl>(pc)
  
}
    11c6:	2c5f           	movea.l (sp)+,a6
    11c8:	4fef 0020      	lea 32(sp),sp
    11cc:	4e75           	rts

000011ce <Zoom_InitRunReverse>:

void Zoom_InitRunReverse() {
    11ce:	4fef ffe0      	lea -32(sp),sp
    11d2:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    11d4:	4279 0010 32d4 	clr.w 1032d4 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    11da:	7004           	moveq #4,d0
    11dc:	2f40 0020      	move.l d0,32(sp)
    11e0:	7002           	moveq #2,d0
    11e2:	2f40 001c      	move.l d0,28(sp)
    11e6:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    11ec:	2c40           	movea.l d0,a6
    11ee:	202f 0020      	move.l 32(sp),d0
    11f2:	222f 001c      	move.l 28(sp),d1
    11f6:	4eae ff3a      	jsr -198(a6)
    11fa:	2f40 0018      	move.l d0,24(sp)
    11fe:	202f 0018      	move.l 24(sp),d0
    1202:	23c0 0010 32c2 	move.l d0,1032c2 <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 0;
    1208:	33fc 0000 0010 	move.w #0,1032e2 <Zoom_LevelOf102Zoom>
    120e:	32e2 
  ZoomHorizontal = 16;
    1210:	33fc 0010 0010 	move.w #16,1032e6 <ZoomHorizontal>
    1216:	32e6 
  Zoom_PrepareDisplay();
    1218:	4eba 0136      	jsr 1350 <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 0, Copperlist1);
    121c:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    1222:	2f00           	move.l d0,-(sp)
    1224:	42a7           	clr.l -(sp)
    1226:	4eba f1e4      	jsr 40c <Zoom_Shrink102>(pc)
    122a:	508f           	addq.l #8,sp
  Zoom_Shrink102( 0, Copperlist2);
    122c:	2039 0010 3280 	move.l 103280 <Copperlist2>,d0
    1232:	2f00           	move.l d0,-(sp)
    1234:	42a7           	clr.l -(sp)
    1236:	4eba f1d4      	jsr 40c <Zoom_Shrink102>(pc)
    123a:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 17;
    123c:	33fc 0011 0010 	move.w #17,1032e0 <Zoom_LevelOfZoom>
    1242:	32e0 
                                                  
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    1244:	7016           	moveq #22,d0
    1246:	2f40 0014      	move.l d0,20(sp)
    124a:	2f7c 0001 0001 	move.l #65537,16(sp)
    1250:	0010 
    1252:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    1258:	2c40           	movea.l d0,a6
    125a:	202f 0014      	move.l 20(sp),d0
    125e:	222f 0010      	move.l 16(sp),d1
    1262:	4eae ff3a      	jsr -198(a6)
    1266:	2f40 000c      	move.l d0,12(sp)
    126a:	202f 000c      	move.l 12(sp),d0
    126e:	23c0 0010 32cc 	move.l d0,1032cc <Zoom_vbint>
    1274:	2039 0010 32cc 	move.l 1032cc <Zoom_vbint>,d0
    127a:	673e           	beq.s 12ba <Zoom_InitRunReverse+0xec>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    127c:	2079 0010 32cc 	movea.l 1032cc <Zoom_vbint>,a0
    1282:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    1288:	2079 0010 32cc 	movea.l 1032cc <Zoom_vbint>,a0
    128e:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    1294:	2079 0010 32cc 	movea.l 1032cc <Zoom_vbint>,a0
    129a:	217c 0000 7c79 	move.l #31865,10(a0)
    12a0:	000a 
    Zoom_vbint->is_Data = NULL;
    12a2:	2079 0010 32cc 	movea.l 1032cc <Zoom_vbint>,a0
    12a8:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_ReverseVblankHandler;
    12ac:	2079 0010 32cc 	movea.l 1032cc <Zoom_vbint>,a0
    12b2:	217c 0000 0e3e 	move.l #3646,18(a0)
    12b8:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    12ba:	7005           	moveq #5,d0
    12bc:	2f40 0008      	move.l d0,8(sp)
    12c0:	2f79 0010 32cc 	move.l 1032cc <Zoom_vbint>,4(sp)
    12c6:	0004 
    12c8:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    12ce:	2c40           	movea.l d0,a6
    12d0:	202f 0008      	move.l 8(sp),d0
    12d4:	226f 0004      	movea.l 4(sp),a1
    12d8:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    12dc:	2239 0010 3290 	move.l 103290 <ViewCopper>,d1
    12e2:	2039 0010 3288 	move.l 103288 <ViewBuffer>,d0
    12e8:	2f01           	move.l d1,-(sp)
    12ea:	2f00           	move.l d0,-(sp)
    12ec:	4eba 0a8e      	jsr 1d7c <Zoom_SetBplPointers>(pc)
    12f0:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    12f2:	2239 0010 328c 	move.l 10328c <DrawCopper>,d1
    12f8:	2039 0010 3288 	move.l 103288 <ViewBuffer>,d0
    12fe:	2f01           	move.l d1,-(sp)
    1300:	2f00           	move.l d0,-(sp)
    1302:	4eba 0a78      	jsr 1d7c <Zoom_SetBplPointers>(pc)
    1306:	508f           	addq.l #8,sp
  SwapCl();
    1308:	4eba ee96      	jsr 1a0 <SwapCl>(pc)
  
}
    130c:	2c5f           	movea.l (sp)+,a6
    130e:	4fef 0020      	lea 32(sp),sp
    1312:	4e75           	rts

00001314 <Zoom_Dealloc>:

void Zoom_Dealloc() {
    1314:	518f           	subq.l #8,sp
    1316:	2f0e           	move.l a6,-(sp)
  RemIntServer(INTB_VERTB, Zoom_vbint);
    1318:	7005           	moveq #5,d0
    131a:	2f40 0008      	move.l d0,8(sp)
    131e:	2f79 0010 32cc 	move.l 1032cc <Zoom_vbint>,4(sp)
    1324:	0004 
    1326:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    132c:	2c40           	movea.l d0,a6
    132e:	202f 0008      	move.l 8(sp),d0
    1332:	226f 0004      	movea.l 4(sp),a1
    1336:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    133a:	2f3c 0000 df20 	move.l #57120,-(sp)
    1340:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    1344:	4eba ed9a      	jsr e0 <FreeDisplay>(pc)
    1348:	508f           	addq.l #8,sp
}
    134a:	2c5f           	movea.l (sp)+,a6
    134c:	508f           	addq.l #8,sp
    134e:	4e75           	rts

00001350 <Zoom_PrepareDisplay>:
  
int Zoom_PrepareDisplay() {
  Zoom_SwapBuffers( 0);
    1350:	42a7           	clr.l -(sp)
    1352:	4eba 0ac0      	jsr 1e14 <Zoom_SwapBuffers>(pc)
    1356:	588f           	addq.l #4,sp
  Copperlist1 = ClbuildZoom( );
    1358:	4eba 007a      	jsr 13d4 <ClbuildZoom>(pc)
    135c:	23c0 0010 327c 	move.l d0,10327c <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    1362:	4eba 0070      	jsr 13d4 <ClbuildZoom>(pc)
    1366:	23c0 0010 3280 	move.l d0,103280 <Copperlist2>
  if(Bitplane2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;*/
  DrawCopper = Copperlist1;
    136c:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    1372:	23c0 0010 328c 	move.l d0,10328c <DrawCopper>
  ViewCopper = Copperlist2;
    1378:	2039 0010 3280 	move.l 103280 <Copperlist2>,d0
    137e:	23c0 0010 3290 	move.l d0,103290 <ViewCopper>
  return 0;
    1384:	7000           	moveq #0,d0
}
    1386:	4e75           	rts

00001388 <Zoom_Init>:

void Zoom_Init() {
    1388:	4fef fff4      	lea -12(sp),sp
    138c:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    138e:	7004           	moveq #4,d0
    1390:	2f40 000c      	move.l d0,12(sp)
    1394:	7002           	moveq #2,d0
    1396:	2f40 0008      	move.l d0,8(sp)
    139a:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    13a0:	2c40           	movea.l d0,a6
    13a2:	202f 000c      	move.l 12(sp),d0
    13a6:	222f 0008      	move.l 8(sp),d1
    13aa:	4eae ff3a      	jsr -198(a6)
    13ae:	2f40 0004      	move.l d0,4(sp)
    13b2:	202f 0004      	move.l 4(sp),d0
    13b6:	23c0 0010 32c2 	move.l d0,1032c2 <Zoom_ZoomBlitMask>
  ZoomHorizontal = 16;
    13bc:	33fc 0010 0010 	move.w #16,1032e6 <ZoomHorizontal>
    13c2:	32e6 
  Zoom_LevelOf102Zoom = 15;
    13c4:	33fc 000f 0010 	move.w #15,1032e2 <Zoom_LevelOf102Zoom>
    13ca:	32e2 
}
    13cc:	2c5f           	movea.l (sp)+,a6
    13ce:	4fef 000c      	lea 12(sp),sp
    13d2:	4e75           	rts

000013d4 <ClbuildZoom>:


ULONG * ClbuildZoom() {
    13d4:	4fef ffac      	lea -84(sp),sp
    13d8:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    13dc:	2f7c 0000 031c 	move.l #796,68(sp)
    13e2:	0044 
    13e4:	7002           	moveq #2,d0
    13e6:	2f40 0040      	move.l d0,64(sp)
    13ea:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    13f0:	2c40           	movea.l d0,a6
    13f2:	202f 0044      	move.l 68(sp),d0
    13f6:	222f 0040      	move.l 64(sp),d1
    13fa:	4eae ff3a      	jsr -198(a6)
    13fe:	2f40 003c      	move.l d0,60(sp)
    1402:	202f 003c      	move.l 60(sp),d0
    1406:	2f40 0038      	move.l d0,56(sp)
  
  if( retval == 0) {
    140a:	6658           	bne.s 1464 <ClbuildZoom+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    140c:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    1412:	2c40           	movea.l d0,a6
    1414:	4eae ffc4      	jsr -60(a6)
    1418:	2f40 0034      	move.l d0,52(sp)
    141c:	202f 0034      	move.l 52(sp),d0
    1420:	2f40 0030      	move.l d0,48(sp)
    1424:	2f7c 0000 7c53 	move.l #31827,44(sp)
    142a:	002c 
    142c:	7228           	moveq #40,d1
    142e:	2f41 0028      	move.l d1,40(sp)
    1432:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    1438:	2c40           	movea.l d0,a6
    143a:	222f 0030      	move.l 48(sp),d1
    143e:	242f 002c      	move.l 44(sp),d2
    1442:	262f 0028      	move.l 40(sp),d3
    1446:	4eae ffd0      	jsr -48(a6)
    144a:	2f40 0024      	move.l d0,36(sp)
    Exit(1);
    144e:	7401           	moveq #1,d2
    1450:	2f42 0020      	move.l d2,32(sp)
    1454:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    145a:	2c40           	movea.l d0,a6
    145c:	222f 0020      	move.l 32(sp),d1
    1460:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    1464:	2f6f 0038 005c 	move.l 56(sp),92(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    146a:	2f7c 0000 a5ec 	move.l #42476,88(sp)
    1470:	0058 
  for(int i=0; i<16;i++)
    1472:	42af 0054      	clr.l 84(sp)
    1476:	6024           	bra.s 149c <ClbuildZoom+0xc8>
    *cl++ = *clpartinstruction++;
    1478:	222f 0058      	move.l 88(sp),d1
    147c:	2001           	move.l d1,d0
    147e:	5880           	addq.l #4,d0
    1480:	2f40 0058      	move.l d0,88(sp)
    1484:	202f 005c      	move.l 92(sp),d0
    1488:	2400           	move.l d0,d2
    148a:	5882           	addq.l #4,d2
    148c:	2f42 005c      	move.l d2,92(sp)
    1490:	2041           	movea.l d1,a0
    1492:	2210           	move.l (a0),d1
    1494:	2040           	movea.l d0,a0
    1496:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    1498:	52af 0054      	addq.l #1,84(sp)
    149c:	700f           	moveq #15,d0
    149e:	b0af 0054      	cmp.l 84(sp),d0
    14a2:	6cd4           	bge.s 1478 <ClbuildZoom+0xa4>
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
    14a4:	2f7c 0000 a62c 	move.l #42540,88(sp)
    14aa:	0058 
  for(int i=0; i<12;i++)
    14ac:	42af 0050      	clr.l 80(sp)
    14b0:	6024           	bra.s 14d6 <ClbuildZoom+0x102>
    *cl++ = *clpartinstruction++;
    14b2:	222f 0058      	move.l 88(sp),d1
    14b6:	2401           	move.l d1,d2
    14b8:	5882           	addq.l #4,d2
    14ba:	2f42 0058      	move.l d2,88(sp)
    14be:	202f 005c      	move.l 92(sp),d0
    14c2:	2400           	move.l d0,d2
    14c4:	5882           	addq.l #4,d2
    14c6:	2f42 005c      	move.l d2,92(sp)
    14ca:	2041           	movea.l d1,a0
    14cc:	2210           	move.l (a0),d1
    14ce:	2040           	movea.l d0,a0
    14d0:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    14d2:	52af 0050      	addq.l #1,80(sp)
    14d6:	700b           	moveq #11,d0
    14d8:	b0af 0050      	cmp.l 80(sp),d0
    14dc:	6cd4           	bge.s 14b2 <ClbuildZoom+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    14de:	202f 005c      	move.l 92(sp),d0
    14e2:	2200           	move.l d0,d1
    14e4:	5881           	addq.l #4,d1
    14e6:	2f41 005c      	move.l d1,92(sp)
    14ea:	2040           	movea.l d0,a0
    14ec:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    14f2:	202f 005c      	move.l 92(sp),d0
    14f6:	2200           	move.l d0,d1
    14f8:	5881           	addq.l #4,d1
    14fa:	2f41 005c      	move.l d1,92(sp)
    14fe:	2040           	movea.l d0,a0
    1500:	20bc 00e2 0000 	move.l #14811136,(a0)
  *cl++ = 0x00e40000;
    1506:	202f 005c      	move.l 92(sp),d0
    150a:	2200           	move.l d0,d1
    150c:	5881           	addq.l #4,d1
    150e:	2f41 005c      	move.l d1,92(sp)
    1512:	2040           	movea.l d0,a0
    1514:	20bc 00e4 0000 	move.l #14942208,(a0)
  *cl++ = 0x00e60000;
    151a:	202f 005c      	move.l 92(sp),d0
    151e:	2200           	move.l d0,d1
    1520:	5881           	addq.l #4,d1
    1522:	2f41 005c      	move.l d1,92(sp)
    1526:	2040           	movea.l d0,a0
    1528:	20bc 00e6 0000 	move.l #15073280,(a0)
  *cl++ = 0x00e80000;
    152e:	202f 005c      	move.l 92(sp),d0
    1532:	2200           	move.l d0,d1
    1534:	5881           	addq.l #4,d1
    1536:	2f41 005c      	move.l d1,92(sp)
    153a:	2040           	movea.l d0,a0
    153c:	20bc 00e8 0000 	move.l #15204352,(a0)
  *cl++ = 0x00ea0000;
    1542:	202f 005c      	move.l 92(sp),d0
    1546:	2200           	move.l d0,d1
    1548:	5881           	addq.l #4,d1
    154a:	2f41 005c      	move.l d1,92(sp)
    154e:	2040           	movea.l d0,a0
    1550:	20bc 00ea 0000 	move.l #15335424,(a0)
  *cl++ = 0x00ec0000;
    1556:	202f 005c      	move.l 92(sp),d0
    155a:	2200           	move.l d0,d1
    155c:	5881           	addq.l #4,d1
    155e:	2f41 005c      	move.l d1,92(sp)
    1562:	2040           	movea.l d0,a0
    1564:	20bc 00ec 0000 	move.l #15466496,(a0)
  *cl++ = 0x00ee0000;
    156a:	202f 005c      	move.l 92(sp),d0
    156e:	2200           	move.l d0,d1
    1570:	5881           	addq.l #4,d1
    1572:	2f41 005c      	move.l d1,92(sp)
    1576:	2040           	movea.l d0,a0
    1578:	20bc 00ee 0000 	move.l #15597568,(a0)
  *cl++ = 0x00f00000;
    157e:	202f 005c      	move.l 92(sp),d0
    1582:	2200           	move.l d0,d1
    1584:	5881           	addq.l #4,d1
    1586:	2f41 005c      	move.l d1,92(sp)
    158a:	2040           	movea.l d0,a0
    158c:	20bc 00f0 0000 	move.l #15728640,(a0)
  *cl++ = 0x00f20000;
    1592:	202f 005c      	move.l 92(sp),d0
    1596:	2200           	move.l d0,d1
    1598:	5881           	addq.l #4,d1
    159a:	2f41 005c      	move.l d1,92(sp)
    159e:	2040           	movea.l d0,a0
    15a0:	20bc 00f2 0000 	move.l #15859712,(a0)

  clpartinstruction = ClColor;
    15a6:	2f7c 0000 a56c 	move.l #42348,88(sp)
    15ac:	0058 
  for(int i=0; i<32;i++)
    15ae:	42af 004c      	clr.l 76(sp)
    15b2:	6024           	bra.s 15d8 <ClbuildZoom+0x204>
    *cl++ = *clpartinstruction++;
    15b4:	222f 0058      	move.l 88(sp),d1
    15b8:	2001           	move.l d1,d0
    15ba:	5880           	addq.l #4,d0
    15bc:	2f40 0058      	move.l d0,88(sp)
    15c0:	202f 005c      	move.l 92(sp),d0
    15c4:	2400           	move.l d0,d2
    15c6:	5882           	addq.l #4,d2
    15c8:	2f42 005c      	move.l d2,92(sp)
    15cc:	2041           	movea.l d1,a0
    15ce:	2210           	move.l (a0),d1
    15d0:	2040           	movea.l d0,a0
    15d2:	2081           	move.l d1,(a0)
  for(int i=0; i<32;i++)
    15d4:	52af 004c      	addq.l #1,76(sp)
    15d8:	701f           	moveq #31,d0
    15da:	b0af 004c      	cmp.l 76(sp),d0
    15de:	6cd4           	bge.s 15b4 <ClbuildZoom+0x1e0>
  
  ULONG cop2 = cl+3;
    15e0:	700c           	moveq #12,d0
    15e2:	d0af 005c      	add.l 92(sp),d0
    15e6:	2f40 001c      	move.l d0,28(sp)
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    15ea:	202f 001c      	move.l 28(sp),d0
    15ee:	4240           	clr.w d0
    15f0:	4840           	swap d0
    15f2:	2200           	move.l d0,d1
    15f4:	0681 0084 0000 	addi.l #8650752,d1
    15fa:	2f41 0018      	move.l d1,24(sp)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    15fe:	202f 001c      	move.l 28(sp),d0
    1602:	0280 0000 ffff 	andi.l #65535,d0
    1608:	2400           	move.l d0,d2
    160a:	0682 0086 0000 	addi.l #8781824,d2
    1610:	2f42 0014      	move.l d2,20(sp)
  //clpartinstruction = Cl102ZoomInit;
  *cl++ = cop2lch;
    1614:	202f 005c      	move.l 92(sp),d0
    1618:	2200           	move.l d0,d1
    161a:	5881           	addq.l #4,d1
    161c:	2f41 005c      	move.l d1,92(sp)
    1620:	2040           	movea.l d0,a0
    1622:	20af 0018      	move.l 24(sp),(a0)
  *cl++ = cop2lcl;
    1626:	202f 005c      	move.l 92(sp),d0
    162a:	2200           	move.l d0,d1
    162c:	5881           	addq.l #4,d1
    162e:	2f41 005c      	move.l d1,92(sp)
    1632:	2040           	movea.l d0,a0
    1634:	20af 0014      	move.l 20(sp),(a0)
  *cl++ = 0x2c01ff00;
    1638:	202f 005c      	move.l 92(sp),d0
    163c:	2200           	move.l d0,d1
    163e:	5881           	addq.l #4,d1
    1640:	2f41 005c      	move.l d1,92(sp)
    1644:	2040           	movea.l d0,a0
    1646:	20bc 2c01 ff00 	move.l #738328320,(a0)

  ULONG cop2br1 = cop2 + ( (30)<<2);
    164c:	7078           	moveq #120,d0
    164e:	d0af 001c      	add.l 28(sp),d0
    1652:	2f40 0010      	move.l d0,16(sp)
  ULONG cop2br2 = cop2 + ( (86)<<2);
    1656:	222f 001c      	move.l 28(sp),d1
    165a:	0681 0000 0158 	addi.l #344,d1
    1660:	2f41 000c      	move.l d1,12(sp)
  clpartinstruction = Cl102ZoomRepeat;
    1664:	2f7c 0000 a668 	move.l #42600,88(sp)
    166a:	0058 
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    166c:	202f 0010      	move.l 16(sp),d0
    1670:	4240           	clr.w d0
    1672:	4840           	swap d0
    1674:	307c 0070      	movea.w #112,a0
    1678:	d1ef 0058      	adda.l 88(sp),a0
    167c:	0680 0084 0000 	addi.l #8650752,d0
    1682:	2080           	move.l d0,(a0)
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    1684:	202f 0010      	move.l 16(sp),d0
    1688:	0280 0000 ffff 	andi.l #65535,d0
    168e:	307c 0074      	movea.w #116,a0
    1692:	d1ef 0058      	adda.l 88(sp),a0
    1696:	0680 0086 0000 	addi.l #8781824,d0
    169c:	2080           	move.l d0,(a0)
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    169e:	202f 000c      	move.l 12(sp),d0
    16a2:	4240           	clr.w d0
    16a4:	4840           	swap d0
    16a6:	206f 0058      	movea.l 88(sp),a0
    16aa:	41e8 0150      	lea 336(a0),a0
    16ae:	0680 0084 0000 	addi.l #8650752,d0
    16b4:	2080           	move.l d0,(a0)
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    16b6:	202f 000c      	move.l 12(sp),d0
    16ba:	0280 0000 ffff 	andi.l #65535,d0
    16c0:	206f 0058      	movea.l 88(sp),a0
    16c4:	41e8 0154      	lea 340(a0),a0
    16c8:	0680 0086 0000 	addi.l #8781824,d0
    16ce:	2080           	move.l d0,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    16d0:	42af 0048      	clr.l 72(sp)
    16d4:	6024           	bra.s 16fa <ClbuildZoom+0x326>
    *cl++ = *clpartinstruction++;
    16d6:	222f 0058      	move.l 88(sp),d1
    16da:	2401           	move.l d1,d2
    16dc:	5882           	addq.l #4,d2
    16de:	2f42 0058      	move.l d2,88(sp)
    16e2:	202f 005c      	move.l 92(sp),d0
    16e6:	2400           	move.l d0,d2
    16e8:	5882           	addq.l #4,d2
    16ea:	2f42 005c      	move.l d2,92(sp)
    16ee:	2041           	movea.l d1,a0
    16f0:	2210           	move.l (a0),d1
    16f2:	2040           	movea.l d0,a0
    16f4:	2081           	move.l d1,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    16f6:	52af 0048      	addq.l #1,72(sp)
    16fa:	7071           	moveq #113,d0
    16fc:	b0af 0048      	cmp.l 72(sp),d0
    1700:	6cd4           	bge.s 16d6 <ClbuildZoom+0x302>

   *cl++ = 0xfffffffe;
    1702:	202f 005c      	move.l 92(sp),d0
    1706:	2200           	move.l d0,d1
    1708:	5881           	addq.l #4,d1
    170a:	2f41 005c      	move.l d1,92(sp)
    170e:	74fe           	moveq #-2,d2
    1710:	2040           	movea.l d0,a0
    1712:	2082           	move.l d2,(a0)

  return retval;
    1714:	202f 0038      	move.l 56(sp),d0
}
    1718:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    171c:	4fef 0054      	lea 84(sp),sp
    1720:	4e75           	rts

00001722 <PrepareDisplayZoom>:

 int PrepareDisplayZoom() {
    1722:	4fef ffb8      	lea -72(sp),sp
    1726:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildZoom();
    172a:	4eba fca8      	jsr 13d4 <ClbuildZoom>(pc)
    172e:	23c0 0010 327c 	move.l d0,10327c <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1734:	4eba fc9e      	jsr 13d4 <ClbuildZoom>(pc)
    1738:	23c0 0010 3280 	move.l d0,103280 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    173e:	2f7c 0000 df20 	move.l #57120,80(sp)
    1744:	0050 
    1746:	7002           	moveq #2,d0
    1748:	2f40 004c      	move.l d0,76(sp)
    174c:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    1752:	2c40           	movea.l d0,a6
    1754:	202f 0050      	move.l 80(sp),d0
    1758:	222f 004c      	move.l 76(sp),d1
    175c:	4eae ff3a      	jsr -198(a6)
    1760:	2f40 0048      	move.l d0,72(sp)
    1764:	202f 0048      	move.l 72(sp),d0
    1768:	23c0 0010 3274 	move.l d0,103274 <Bitplane1>
  if(Bitplane1 == 0) {
    176e:	2039 0010 3274 	move.l 103274 <Bitplane1>,d0
    1774:	6658           	bne.s 17ce <PrepareDisplayZoom+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1776:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    177c:	2c40           	movea.l d0,a6
    177e:	4eae ffc4      	jsr -60(a6)
    1782:	2f40 0044      	move.l d0,68(sp)
    1786:	202f 0044      	move.l 68(sp),d0
    178a:	2f40 0040      	move.l d0,64(sp)
    178e:	2f7c 0000 7c05 	move.l #31749,60(sp)
    1794:	003c 
    1796:	7026           	moveq #38,d0
    1798:	2f40 0038      	move.l d0,56(sp)
    179c:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    17a2:	2c40           	movea.l d0,a6
    17a4:	222f 0040      	move.l 64(sp),d1
    17a8:	242f 003c      	move.l 60(sp),d2
    17ac:	262f 0038      	move.l 56(sp),d3
    17b0:	4eae ffd0      	jsr -48(a6)
    17b4:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    17b8:	7001           	moveq #1,d0
    17ba:	2f40 0030      	move.l d0,48(sp)
    17be:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    17c4:	2c40           	movea.l d0,a6
    17c6:	222f 0030      	move.l 48(sp),d1
    17ca:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    17ce:	2039 0010 3274 	move.l 103274 <Bitplane1>,d0
    17d4:	23c0 0010 3284 	move.l d0,103284 <DrawBuffer>
  DrawCopper = Copperlist1;
    17da:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    17e0:	23c0 0010 328c 	move.l d0,10328c <DrawCopper>
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    17e6:	2f7c 0000 df20 	move.l #57120,44(sp)
    17ec:	002c 
    17ee:	7002           	moveq #2,d0
    17f0:	2f40 0028      	move.l d0,40(sp)
    17f4:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    17fa:	2c40           	movea.l d0,a6
    17fc:	202f 002c      	move.l 44(sp),d0
    1800:	222f 0028      	move.l 40(sp),d1
    1804:	4eae ff3a      	jsr -198(a6)
    1808:	2f40 0024      	move.l d0,36(sp)
    180c:	202f 0024      	move.l 36(sp),d0
    1810:	23c0 0010 3278 	move.l d0,103278 <Bitplane2>
  if(Bitplane2 == 0) {
    1816:	2039 0010 3278 	move.l 103278 <Bitplane2>,d0
    181c:	6658           	bne.s 1876 <PrepareDisplayZoom+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    181e:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    1824:	2c40           	movea.l d0,a6
    1826:	4eae ffc4      	jsr -60(a6)
    182a:	2f40 0020      	move.l d0,32(sp)
    182e:	202f 0020      	move.l 32(sp),d0
    1832:	2f40 001c      	move.l d0,28(sp)
    1836:	2f7c 0000 7c2c 	move.l #31788,24(sp)
    183c:	0018 
    183e:	7026           	moveq #38,d0
    1840:	2f40 0014      	move.l d0,20(sp)
    1844:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    184a:	2c40           	movea.l d0,a6
    184c:	222f 001c      	move.l 28(sp),d1
    1850:	242f 0018      	move.l 24(sp),d2
    1854:	262f 0014      	move.l 20(sp),d3
    1858:	4eae ffd0      	jsr -48(a6)
    185c:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    1860:	7001           	moveq #1,d0
    1862:	2f40 000c      	move.l d0,12(sp)
    1866:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    186c:	2c40           	movea.l d0,a6
    186e:	222f 000c      	move.l 12(sp),d1
    1872:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    1876:	2039 0010 3278 	move.l 103278 <Bitplane2>,d0
    187c:	23c0 0010 3288 	move.l d0,103288 <ViewBuffer>
  ViewCopper = Copperlist2; 
    1882:	2039 0010 3280 	move.l 103280 <Copperlist2>,d0
    1888:	23c0 0010 3290 	move.l d0,103290 <ViewCopper>
  return 0;
    188e:	7000           	moveq #0,d0
}
    1890:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1894:	4fef 0048      	lea 72(sp),sp
    1898:	4e75           	rts

0000189a <Init_Blit>:

void Init_Blit() {
  hw->bltafwm = 0xffff;
    189a:	2079 0010 3294 	movea.l 103294 <hw>,a0
    18a0:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    18a6:	2079 0010 3294 	movea.l 103294 <hw>,a0
    18ac:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    18b2:	2079 0010 3294 	movea.l 103294 <hw>,a0
    18b8:	317c 0026 0064 	move.w #38,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    18be:	2079 0010 3294 	movea.l 103294 <hw>,a0
    18c4:	317c 0026 0062 	move.w #38,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    18ca:	2079 0010 3294 	movea.l 103294 <hw>,a0
    18d0:	317c 0026 0066 	move.w #38,102(a0)
}
    18d6:	4e75           	rts

000018d8 <Init_Blit2>:


void Init_Blit2() {
  hw->bltafwm = 0xffff;
    18d8:	2079 0010 3294 	movea.l 103294 <hw>,a0
    18de:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    18e4:	2079 0010 3294 	movea.l 103294 <hw>,a0
    18ea:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = 36;
    18f0:	2079 0010 3294 	movea.l 103294 <hw>,a0
    18f6:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = 76;
    18fc:	2079 0010 3294 	movea.l 103294 <hw>,a0
    1902:	317c 004c 0062 	move.w #76,98(a0)
  hw->bltdmod = ZMLINESIZE2 - 4;
    1908:	2079 0010 3294 	movea.l 103294 <hw>,a0
    190e:	317c 0028 0066 	move.w #40,102(a0)
}
    1914:	4e75           	rts

00001916 <Init_ZoomBlit>:

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
    1916:	4fef fff4      	lea -12(sp),sp
    191a:	206f 0010      	movea.l 16(sp),a0
    191e:	222f 0014      	move.l 20(sp),d1
    1922:	202f 0018      	move.l 24(sp),d0
    1926:	3048           	movea.w a0,a0
    1928:	3f48 0004      	move.w a0,4(sp)
    192c:	3201           	move.w d1,d1
    192e:	3f41 0002      	move.w d1,2(sp)
    1932:	3000           	move.w d0,d0
    1934:	3e80           	move.w d0,(sp)
  ZoomBlit_Increment4SrcA = 0;
    1936:	4279 0010 32ca 	clr.w 1032ca <ZoomBlit_Increment4SrcA>

  UWORD colnr = nextzoom - startofword - 1;                                                                          
    193c:	302f 0002      	move.w 2(sp),d0
    1940:	906f 0004      	sub.w 4(sp),d0
    1944:	3200           	move.w d0,d1
    1946:	5341           	subq.w #1,d1
    1948:	3f41 0008      	move.w d1,8(sp)
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
    194c:	3017           	move.w (sp),d0
    194e:	720c           	moveq #12,d1
    1950:	e368           	lsl.w d1,d0
    1952:	3f40 0006      	move.w d0,6(sp)
  UWORD shifta;
  if( shiftright == 0) {
    1956:	4a57           	tst.w (sp)
    1958:	6610           	bne.s 196a <Init_ZoomBlit+0x54>
    ZoomBlit_Increment4SrcA = 1;
    195a:	33fc 0001 0010 	move.w #1,1032ca <ZoomBlit_Increment4SrcA>
    1960:	32ca 
    shifta = 15 << 12;
    1962:	3f7c f000 000a 	move.w #-4096,10(sp)
    1968:	600c           	bra.s 1976 <Init_ZoomBlit+0x60>
  } else {
    shifta = (shiftright - 1) << 12;
    196a:	3017           	move.w (sp),d0
    196c:	5340           	subq.w #1,d0
    196e:	720c           	moveq #12,d1
    1970:	e368           	lsl.w d1,d0
    1972:	3f40 000a      	move.w d0,10(sp)
  }
  WaitBlt(); 
    1976:	4eba e73c      	jsr b4 <WaitBlt>(pc)
  hw->bltcon1 = shiftb; 
    197a:	2079 0010 3294 	movea.l 103294 <hw>,a0
    1980:	316f 0006 0042 	move.w 6(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1986:	2079 0010 3294 	movea.l 103294 <hw>,a0
    198c:	302f 000a      	move.w 10(sp),d0
    1990:	0640 0de4      	addi.w #3556,d0
    1994:	3140 0040      	move.w d0,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1998:	7000           	moveq #0,d0
    199a:	302f 0008      	move.w 8(sp),d0
    199e:	7210           	moveq #16,d1
    19a0:	9280           	sub.l d0,d1
    19a2:	7000           	moveq #0,d0
    19a4:	4640           	not.w d0
    19a6:	e3a8           	lsl.l d1,d0
    19a8:	2079 0010 3294 	movea.l 103294 <hw>,a0
    19ae:	2000           	move.l d0,d0
    19b0:	3140 0070      	move.w d0,112(a0)
}
    19b4:	4fef 000c      	lea 12(sp),sp
    19b8:	4e75           	rts

000019ba <Init_Copy>:

void Init_Copy( WORD shift) {
    19ba:	598f           	subq.l #4,sp
    19bc:	202f 0008      	move.l 8(sp),d0
    19c0:	3000           	move.w d0,d0
    19c2:	3e80           	move.w d0,(sp)
  UWORD shiftright = shift << 12;
    19c4:	3017           	move.w (sp),d0
    19c6:	720c           	moveq #12,d1
    19c8:	e368           	lsl.w d1,d0
    19ca:	3f40 0002      	move.w d0,2(sp)
  WaitBlt();
    19ce:	4eba e6e4      	jsr b4 <WaitBlt>(pc)
  hw->bltcon0 = 0x9f0 + shiftright;
    19d2:	2079 0010 3294 	movea.l 103294 <hw>,a0
    19d8:	302f 0002      	move.w 2(sp),d0
    19dc:	0640 09f0      	addi.w #2544,d0
    19e0:	3140 0040      	move.w d0,64(a0)
  hw->bltcon1 = 0;
    19e4:	2079 0010 3294 	movea.l 103294 <hw>,a0
    19ea:	317c 0000 0042 	move.w #0,66(a0)
}
    19f0:	588f           	addq.l #4,sp
    19f2:	4e75           	rts

000019f4 <Zoom_ZoomIntoPicture>:

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    19f4:	4fef ffcc      	lea -52(sp),sp
    19f8:	222f 0040      	move.l 64(sp),d1
    19fc:	202f 0044      	move.l 68(sp),d0
    1a00:	3201           	move.w d1,d1
    1a02:	3f41 0002      	move.w d1,2(sp)
    1a06:	3000           	move.w d0,d0
    1a08:	3e80           	move.w d0,(sp)
  
  WaitBlt();  
    1a0a:	4eba e6a8      	jsr b4 <WaitBlt>(pc)
  Init_Blit();
    1a0e:	4eba fe8a      	jsr 189a <Init_Blit>(pc)
  WORD shiftright = 9;
    1a12:	3f7c 0009 0032 	move.w #9,50(sp)
  UWORD shifthoriz = 7;
    1a18:	3f7c 0007 0030 	move.w #7,48(sp)
  UWORD startofword = 21*16;
    1a1e:	3f7c 0150 002e 	move.w #336,46(sp)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1a24:	322f 0002      	move.w 2(sp),d1
    1a28:	3001           	move.w d1,d0
    1a2a:	d040           	add.w d0,d0
    1a2c:	d040           	add.w d0,d0
    1a2e:	d041           	add.w d1,d0
    1a30:	d040           	add.w d0,d0
    1a32:	0640 014c      	addi.w #332,d0
    1a36:	3f40 002c      	move.w d0,44(sp)
    1a3a:	601a           	bra.s 1a56 <Zoom_ZoomIntoPicture+0x62>
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    1a3c:	302f 002c      	move.w 44(sp),d0
    1a40:	906f 0002      	sub.w 2(sp),d0
    1a44:	0640 ffed      	addi.w #-19,d0
    1a48:	3f40 002c      	move.w d0,44(sp)
    shiftright--;
    1a4c:	302f 0032      	move.w 50(sp),d0
    1a50:	5340           	subq.w #1,d0
    1a52:	3f40 0032      	move.w d0,50(sp)
  while( nextzoom > 22 * 16) {
    1a56:	0c6f 0160 002c 	cmpi.w #352,44(sp)
    1a5c:	6ede           	bgt.s 1a3c <Zoom_ZoomIntoPicture+0x48>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
    1a5e:	426f 002a      	clr.w 42(sp)
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    1a62:	322f 0002      	move.w 2(sp),d1
    1a66:	3001           	move.w d1,d0
    1a68:	d040           	add.w d0,d0
    1a6a:	d040           	add.w d0,d0
    1a6c:	d041           	add.w d1,d0
    1a6e:	4440           	neg.w d0
    1a70:	0640 0012      	addi.w #18,d0
    1a74:	3f40 0028      	move.w d0,40(sp)
    1a78:	601c           	bra.s 1a96 <Zoom_ZoomIntoPicture+0xa2>
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    1a7a:	302f 0028      	move.w 40(sp),d0
    1a7e:	d06f 0002      	add.w 2(sp),d0
    1a82:	0640 0013      	addi.w #19,d0
    1a86:	3f40 0028      	move.w d0,40(sp)
      shifthoriz--;
    1a8a:	302f 0030      	move.w 48(sp),d0
    1a8e:	3200           	move.w d0,d1
    1a90:	5341           	subq.w #1,d1
    1a92:	3f41 0030      	move.w d1,48(sp)
  while( ZoomHorizontalStart < 0) {
    1a96:	4a6f 0028      	tst.w 40(sp)
    1a9a:	6dde           	blt.s 1a7a <Zoom_ZoomIntoPicture+0x86>
  } 

  for(int i=0;i<22;i++) {
    1a9c:	42af 0024      	clr.l 36(sp)
    1aa0:	6000 02ca      	bra.w 1d6c <Zoom_ZoomIntoPicture+0x378>

    ZoomHorizontal = ZoomHorizontalStart;
    1aa4:	33ef 0028 0010 	move.w 40(sp),1032e6 <ZoomHorizontal>
    1aaa:	32e6 

    WORD linesleft = 272;
    1aac:	3f7c 0110 0022 	move.w #272,34(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1ab2:	7000           	moveq #0,d0
    1ab4:	302f 0030      	move.w 48(sp),d0
    1ab8:	7200           	moveq #0,d1
    1aba:	3217           	move.w (sp),d1
    1abc:	2f01           	move.l d1,-(sp)
    1abe:	2f00           	move.l d0,-(sp)
    1ac0:	4eb9 0000 706c 	jsr 706c <__mulsi3>
    1ac6:	508f           	addq.l #8,sp
    1ac8:	2200           	move.l d0,d1
    1aca:	2001           	move.l d1,d0
    1acc:	d080           	add.l d0,d0
    1ace:	d081           	add.l d1,d0
    1ad0:	2200           	move.l d0,d1
    1ad2:	e789           	lsl.l #3,d1
    1ad4:	9280           	sub.l d0,d1
    1ad6:	202f 0024      	move.l 36(sp),d0
    1ada:	9280           	sub.l d0,d1
    1adc:	2001           	move.l d1,d0
    1ade:	0680 8000 0013 	addi.l #-2147483629,d0
    1ae4:	d080           	add.l d0,d0
    1ae6:	222f 0038      	move.l 56(sp),d1
    1aea:	d280           	add.l d0,d1
    1aec:	2f41 001e      	move.l d1,30(sp)
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1af0:	202f 0024      	move.l 36(sp),d0
    1af4:	7213           	moveq #19,d1
    1af6:	9280           	sub.l d0,d1
    1af8:	2001           	move.l d1,d0
    1afa:	d081           	add.l d1,d0
    1afc:	222f 003c      	move.l 60(sp),d1
    1b00:	d280           	add.l d0,d1
    1b02:	2f41 001a      	move.l d1,26(sp)
    
    UWORD onestep = ZMLINESIZE/2*planes;
    1b06:	3017           	move.w (sp),d0
    1b08:	c1fc 0015      	muls.w #21,d0
    1b0c:	3f40 0018      	move.w d0,24(sp)
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1b10:	7000           	moveq #0,d0
    1b12:	302f 002e      	move.w 46(sp),d0
    1b16:	306f 002c      	movea.w 44(sp),a0
    1b1a:	b1c0           	cmpa.l d0,a0
    1b1c:	6e00 0106      	bgt.w 1c24 <Zoom_ZoomIntoPicture+0x230>
      Init_Copy( shiftright);
    1b20:	306f 0032      	movea.w 50(sp),a0
    1b24:	2f08           	move.l a0,-(sp)
    1b26:	4eba fe92      	jsr 19ba <Init_Copy>(pc)
    1b2a:	588f           	addq.l #4,sp
    1b2c:	6000 00ea      	bra.w 1c18 <Zoom_ZoomIntoPicture+0x224>
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1b30:	3039 0010 32e6 	move.w 1032e6 <ZoomHorizontal>,d0
    1b36:	b06f 0022      	cmp.w 34(sp),d0
    1b3a:	6c12           	bge.s 1b4e <Zoom_ZoomIntoPicture+0x15a>
          linesleft -= ZoomHorizontal;
    1b3c:	322f 0022      	move.w 34(sp),d1
    1b40:	3039 0010 32e6 	move.w 1032e6 <ZoomHorizontal>,d0
    1b46:	9240           	sub.w d0,d1
    1b48:	3f41 0022      	move.w d1,34(sp)
    1b4c:	600c           	bra.s 1b5a <Zoom_ZoomIntoPicture+0x166>
        } else {
          ZoomHorizontal = linesleft;
    1b4e:	33ef 0022 0010 	move.w 34(sp),1032e6 <ZoomHorizontal>
    1b54:	32e6 
          linesleft = 0;
    1b56:	426f 0022      	clr.w 34(sp)
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
    1b5a:	3039 0010 32e6 	move.w 1032e6 <ZoomHorizontal>,d0
    1b60:	322f 0018      	move.w 24(sp),d1
    1b64:	c3c0           	muls.w d0,d1
    1b66:	3f41 000c      	move.w d1,12(sp)
        //Add aditional line
        if( linesleft>0) {
    1b6a:	4a6f 0022      	tst.w 34(sp)
    1b6e:	6f4c           	ble.s 1bbc <Zoom_ZoomIntoPicture+0x1c8>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1b70:	7200           	moveq #0,d1
    1b72:	322f 000c      	move.w 12(sp),d1
    1b76:	7000           	moveq #0,d0
    1b78:	302f 002a      	move.w 42(sp),d0
    1b7c:	d081           	add.l d1,d0
    1b7e:	d080           	add.l d0,d0
    1b80:	222f 001e      	move.l 30(sp),d1
    1b84:	d280           	add.l d0,d1
    1b86:	2f41 0008      	move.l d1,8(sp)
          UWORD *tmpdest = pos4dest +  size4blit;
    1b8a:	7000           	moveq #0,d0
    1b8c:	302f 000c      	move.w 12(sp),d0
    1b90:	d080           	add.l d0,d0
    1b92:	222f 001a      	move.l 26(sp),d1
    1b96:	d280           	add.l d0,d1
    1b98:	2f41 0004      	move.l d1,4(sp)
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
    1b9c:	7000           	moveq #0,d0
    1b9e:	3017           	move.w (sp),d0
    1ba0:	2f00           	move.l d0,-(sp)
    1ba2:	2f2f 0008      	move.l 8(sp),-(sp)
    1ba6:	2f2f 0010      	move.l 16(sp),-(sp)
    1baa:	4eba f3b0      	jsr f5c <Zoom_CopyWord>(pc)
    1bae:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1bb2:	302f 0022      	move.w 34(sp),d0
    1bb6:	5340           	subq.w #1,d0
    1bb8:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1bbc:	3039 0010 32e6 	move.w 1032e6 <ZoomHorizontal>,d0
    1bc2:	c1d7           	muls.w (sp),d0
    1bc4:	7200           	moveq #0,d1
    1bc6:	3200           	move.w d0,d1
    1bc8:	7000           	moveq #0,d0
    1bca:	302f 002a      	move.w 42(sp),d0
    1bce:	d080           	add.l d0,d0
    1bd0:	d0af 001e      	add.l 30(sp),d0
    1bd4:	2f01           	move.l d1,-(sp)
    1bd6:	2f2f 001e      	move.l 30(sp),-(sp)
    1bda:	2f00           	move.l d0,-(sp)
    1bdc:	4eba f37e      	jsr f5c <Zoom_CopyWord>(pc)
    1be0:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1be4:	7000           	moveq #0,d0
    1be6:	302f 000c      	move.w 12(sp),d0
    1bea:	d080           	add.l d0,d0
    1bec:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep; 
    1bf0:	7200           	moveq #0,d1
    1bf2:	322f 000c      	move.w 12(sp),d1
    1bf6:	7000           	moveq #0,d0
    1bf8:	302f 0018      	move.w 24(sp),d0
    1bfc:	d081           	add.l d1,d0
    1bfe:	d080           	add.l d0,d0
    1c00:	d1af 001a      	add.l d0,26(sp)
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1c04:	302f 0002      	move.w 2(sp),d0
    1c08:	d040           	add.w d0,d0
    1c0a:	906f 0002      	sub.w 2(sp),d0
    1c0e:	0640 0012      	addi.w #18,d0
    1c12:	33c0 0010 32e6 	move.w d0,1032e6 <ZoomHorizontal>
      while(linesleft > 0) {
    1c18:	4a6f 0022      	tst.w 34(sp)
    1c1c:	6e00 ff12      	bgt.w 1b30 <Zoom_ZoomIntoPicture+0x13c>
    1c20:	6000 0140      	bra.w 1d62 <Zoom_ZoomIntoPicture+0x36e>
      }
    } else {  
      Init_ZoomBlit( startofword, nextzoom, shiftright);   
    1c24:	326f 0032      	movea.w 50(sp),a1
    1c28:	306f 002c      	movea.w 44(sp),a0
    1c2c:	7000           	moveq #0,d0
    1c2e:	302f 002e      	move.w 46(sp),d0
    1c32:	2f09           	move.l a1,-(sp)
    1c34:	2f08           	move.l a0,-(sp)
    1c36:	2f00           	move.l d0,-(sp)
    1c38:	4eba fcdc      	jsr 1916 <Init_ZoomBlit>(pc)
    1c3c:	4fef 000c      	lea 12(sp),sp
      nextzoom -= (19 + zoomnr);
    1c40:	302f 002c      	move.w 44(sp),d0
    1c44:	906f 0002      	sub.w 2(sp),d0
    1c48:	0640 ffed      	addi.w #-19,d0
    1c4c:	3f40 002c      	move.w d0,44(sp)
    1c50:	6000 00ea      	bra.w 1d3c <Zoom_ZoomIntoPicture+0x348>
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1c54:	3039 0010 32e6 	move.w 1032e6 <ZoomHorizontal>,d0
    1c5a:	b06f 0022      	cmp.w 34(sp),d0
    1c5e:	6c12           	bge.s 1c72 <Zoom_ZoomIntoPicture+0x27e>
          linesleft -= ZoomHorizontal;
    1c60:	322f 0022      	move.w 34(sp),d1
    1c64:	3039 0010 32e6 	move.w 1032e6 <ZoomHorizontal>,d0
    1c6a:	9240           	sub.w d0,d1
    1c6c:	3f41 0022      	move.w d1,34(sp)
    1c70:	600c           	bra.s 1c7e <Zoom_ZoomIntoPicture+0x28a>
        } else {
          ZoomHorizontal = linesleft;
    1c72:	33ef 0022 0010 	move.w 34(sp),1032e6 <ZoomHorizontal>
    1c78:	32e6 
          linesleft = 0;
    1c7a:	426f 0022      	clr.w 34(sp)
        }
        UWORD size4blit = ZoomHorizontal*onestep;
    1c7e:	3039 0010 32e6 	move.w 1032e6 <ZoomHorizontal>,d0
    1c84:	322f 0018      	move.w 24(sp),d1
    1c88:	c3c0           	muls.w d0,d1
    1c8a:	3f41 0016      	move.w d1,22(sp)
        //Add aditional line
        if( linesleft>0) {
    1c8e:	4a6f 0022      	tst.w 34(sp)
    1c92:	6f4c           	ble.s 1ce0 <Zoom_ZoomIntoPicture+0x2ec>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1c94:	7200           	moveq #0,d1
    1c96:	322f 0016      	move.w 22(sp),d1
    1c9a:	7000           	moveq #0,d0
    1c9c:	302f 002a      	move.w 42(sp),d0
    1ca0:	d081           	add.l d1,d0
    1ca2:	d080           	add.l d0,d0
    1ca4:	222f 001e      	move.l 30(sp),d1
    1ca8:	d280           	add.l d0,d1
    1caa:	2f41 0012      	move.l d1,18(sp)
          UWORD *tmpdest = pos4dest + size4blit;
    1cae:	7000           	moveq #0,d0
    1cb0:	302f 0016      	move.w 22(sp),d0
    1cb4:	d080           	add.l d0,d0
    1cb6:	222f 001a      	move.l 26(sp),d1
    1cba:	d280           	add.l d0,d1
    1cbc:	2f41 000e      	move.l d1,14(sp)
          
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
    1cc0:	7000           	moveq #0,d0
    1cc2:	3017           	move.w (sp),d0
    1cc4:	2f00           	move.l d0,-(sp)
    1cc6:	2f2f 0012      	move.l 18(sp),-(sp)
    1cca:	2f2f 001a      	move.l 26(sp),-(sp)
    1cce:	4eba f2ca      	jsr f9a <Zoom_ZoomBlit>(pc)
    1cd2:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1cd6:	302f 0022      	move.w 34(sp),d0
    1cda:	5340           	subq.w #1,d0
    1cdc:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1ce0:	3039 0010 32e6 	move.w 1032e6 <ZoomHorizontal>,d0
    1ce6:	c1d7           	muls.w (sp),d0
    1ce8:	7200           	moveq #0,d1
    1cea:	3200           	move.w d0,d1
    1cec:	7000           	moveq #0,d0
    1cee:	302f 002a      	move.w 42(sp),d0
    1cf2:	d080           	add.l d0,d0
    1cf4:	d0af 001e      	add.l 30(sp),d0
    1cf8:	2f01           	move.l d1,-(sp)
    1cfa:	2f2f 001e      	move.l 30(sp),-(sp)
    1cfe:	2f00           	move.l d0,-(sp)
    1d00:	4eba f298      	jsr f9a <Zoom_ZoomBlit>(pc)
    1d04:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1d08:	7000           	moveq #0,d0
    1d0a:	302f 0016      	move.w 22(sp),d0
    1d0e:	d080           	add.l d0,d0
    1d10:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep;   
    1d14:	7200           	moveq #0,d1
    1d16:	322f 0016      	move.w 22(sp),d1
    1d1a:	7000           	moveq #0,d0
    1d1c:	302f 0018      	move.w 24(sp),d0
    1d20:	d081           	add.l d1,d0
    1d22:	d080           	add.l d0,d0
    1d24:	d1af 001a      	add.l d0,26(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1d28:	302f 0002      	move.w 2(sp),d0
    1d2c:	d040           	add.w d0,d0
    1d2e:	906f 0002      	sub.w 2(sp),d0
    1d32:	0640 0012      	addi.w #18,d0
    1d36:	33c0 0010 32e6 	move.w d0,1032e6 <ZoomHorizontal>
      while( linesleft > 0) {
    1d3c:	4a6f 0022      	tst.w 34(sp)
    1d40:	6e00 ff12      	bgt.w 1c54 <Zoom_ZoomIntoPicture+0x260>
      }
      shiftright--;  
    1d44:	302f 0032      	move.w 50(sp),d0
    1d48:	5340           	subq.w #1,d0
    1d4a:	3f40 0032      	move.w d0,50(sp)
      if(shiftright < 0) {
    1d4e:	6a12           	bpl.s 1d62 <Zoom_ZoomIntoPicture+0x36e>
        shiftright += 16;
    1d50:	302f 0032      	move.w 50(sp),d0
    1d54:	0640 0010      	addi.w #16,d0
    1d58:	3f40 0032      	move.w d0,50(sp)
        shifttoleft = 1;
    1d5c:	3f7c 0001 002a 	move.w #1,42(sp)
      }
    }
    startofword -= 16;
    1d62:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    1d68:	52af 0024      	addq.l #1,36(sp)
    1d6c:	7015           	moveq #21,d0
    1d6e:	b0af 0024      	cmp.l 36(sp),d0
    1d72:	6c00 fd30      	bge.w 1aa4 <Zoom_ZoomIntoPicture+0xb0>
  }
}
    1d76:	4fef 0034      	lea 52(sp),sp
    1d7a:	4e75           	rts

00001d7c <Zoom_SetBplPointers>:

void Zoom_SetBplPointers( UWORD *buffer, ULONG *copper) {
    1d7c:	4fef ffb0      	lea -80(sp),sp
  //                   0  1  1   1   1   0   1   1    1    1    0    1    1    0    1    1
  //int zoomoffset[] = { 0, 0, 42, 42, 84, 84, 84, 126, 126, 168, 168, 168, 210, 210, 210, 332};
  //int zoomoffset[] = { 252, 210, 210, 210, 168, 168, 168, 126, 126, 84, 84, 84, 42, 42, 0, 0 };
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
    1d80:	204f           	movea.l sp,a0
    1d82:	223c 0000 7c88 	move.l #31880,d1
    1d88:	7040           	moveq #64,d0
    1d8a:	2f00           	move.l d0,-(sp)
    1d8c:	2f01           	move.l d1,-(sp)
    1d8e:	2f08           	move.l a0,-(sp)
    1d90:	4eba 4f7c      	jsr 6d0e <memcpy>(pc)
    1d94:	4fef 000c      	lea 12(sp),sp

  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
    1d98:	3039 0010 32e2 	move.w 1032e2 <Zoom_LevelOf102Zoom>,d0
    1d9e:	3000           	move.w d0,d0
    1da0:	0280 0000 ffff 	andi.l #65535,d0
    1da6:	d080           	add.l d0,d0
    1da8:	d080           	add.l d0,d0
    1daa:	41ef 0050      	lea 80(sp),a0
    1dae:	d1c0           	adda.l d0,a0
    1db0:	41e8 ffb0      	lea -80(a0),a0
    1db4:	2010           	move.l (a0),d0
    1db6:	d080           	add.l d0,d0
    1db8:	d0af 0054      	add.l 84(sp),d0
    1dbc:	2f40 004c      	move.l d0,76(sp)
  /*ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;*/
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
    1dc0:	7072           	moveq #114,d0
    1dc2:	d0af 0058      	add.l 88(sp),d0
    1dc6:	2f40 0048      	move.l d0,72(sp)
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1dca:	42af 0044      	clr.l 68(sp)
    1dce:	6036           	bra.s 1e06 <Zoom_SetBplPointers+0x8a>
    UWORD highword = (ULONG)plane2set >> 16;
    1dd0:	202f 004c      	move.l 76(sp),d0
    1dd4:	4240           	clr.w d0
    1dd6:	4840           	swap d0
    1dd8:	3f40 0042      	move.w d0,66(sp)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1ddc:	3f6f 004e 0040 	move.w 78(sp),64(sp)
    *posofcopper = highword;
    1de2:	206f 0048      	movea.l 72(sp),a0
    1de6:	30af 0042      	move.w 66(sp),(a0)
    posofcopper += 2;
    1dea:	58af 0048      	addq.l #4,72(sp)
    *posofcopper = lowword;
    1dee:	206f 0048      	movea.l 72(sp),a0
    1df2:	30af 0040      	move.w 64(sp),(a0)
    posofcopper += 2;
    1df6:	58af 0048      	addq.l #4,72(sp)
    plane2set += 42*268; //Next plane
    1dfa:	06af 0000 2bf8 	addi.l #11256,76(sp)
    1e00:	004c 
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1e02:	52af 0044      	addq.l #1,68(sp)
    1e06:	7004           	moveq #4,d0
    1e08:	b0af 0044      	cmp.l 68(sp),d0
    1e0c:	6cc2           	bge.s 1dd0 <Zoom_SetBplPointers+0x54>
  }
  
}
    1e0e:	4fef 0050      	lea 80(sp),sp
    1e12:	4e75           	rts

00001e14 <Zoom_SwapBuffers>:

void Zoom_SwapBuffers( UWORD zoomlevel) {
    1e14:	598f           	subq.l #4,sp
    1e16:	2f02           	move.l d2,-(sp)
    1e18:	202f 000c      	move.l 12(sp),d0
    1e1c:	3000           	move.w d0,d0
    1e1e:	3f40 0006      	move.w d0,6(sp)

  ViewBuffer = rawzoom + (42*268*5*zoomlevel);
    1e22:	2439 0000 b800 	move.l b800 <rawzoom>,d2
    1e28:	7000           	moveq #0,d0
    1e2a:	302f 0006      	move.w 6(sp),d0
    1e2e:	2f3c 0000 dbd8 	move.l #56280,-(sp)
    1e34:	2f00           	move.l d0,-(sp)
    1e36:	4eb9 0000 706c 	jsr 706c <__mulsi3>
    1e3c:	508f           	addq.l #8,sp
    1e3e:	d082           	add.l d2,d0
    1e40:	23c0 0010 3288 	move.l d0,103288 <ViewBuffer>
  /*ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;*/
}
    1e46:	241f           	move.l (sp)+,d2
    1e48:	588f           	addq.l #4,sp
    1e4a:	4e75           	rts

00001e4c <Test_Zoom2>:
#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
    1e4c:	4fef ff00      	lea -256(sp),sp
    1e50:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  //Test Zoomlevel 1
  volatile ULONG *srcsmall = AllocMem( 80, MEMF_CHIP);
    1e54:	7050           	moveq #80,d0
    1e56:	2f40 00f0      	move.l d0,240(sp)
    1e5a:	7002           	moveq #2,d0
    1e5c:	2f40 00ec      	move.l d0,236(sp)
    1e60:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    1e66:	2c40           	movea.l d0,a6
    1e68:	202f 00f0      	move.l 240(sp),d0
    1e6c:	222f 00ec      	move.l 236(sp),d1
    1e70:	4eae ff3a      	jsr -198(a6)
    1e74:	2f40 00e8      	move.l d0,232(sp)
    1e78:	202f 00e8      	move.l 232(sp),d0
    1e7c:	2f40 00e4      	move.l d0,228(sp)
  if( srcsmall == 0) {
    1e80:	6646           	bne.s 1ec8 <Test_Zoom2+0x7c>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcsmall\n", 42);
    1e82:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    1e88:	2c40           	movea.l d0,a6
    1e8a:	4eae ffc4      	jsr -60(a6)
    1e8e:	2f40 001c      	move.l d0,28(sp)
    1e92:	202f 001c      	move.l 28(sp),d0
    1e96:	2f40 0018      	move.l d0,24(sp)
    1e9a:	2f7c 0000 7cc8 	move.l #31944,20(sp)
    1ea0:	0014 
    1ea2:	702a           	moveq #42,d0
    1ea4:	2f40 0010      	move.l d0,16(sp)
    1ea8:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    1eae:	2c40           	movea.l d0,a6
    1eb0:	222f 0018      	move.l 24(sp),d1
    1eb4:	242f 0014      	move.l 20(sp),d2
    1eb8:	262f 0010      	move.l 16(sp),d3
    1ebc:	4eae ffd0      	jsr -48(a6)
    1ec0:	2f40 000c      	move.l d0,12(sp)
    1ec4:	6000 0560      	bra.w 2426 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong(srcsmall, 0xaaaaaaaa, 2, 10, 0);
    1ec8:	42a7           	clr.l -(sp)
    1eca:	4878 000a      	pea a <_start+0xa>
    1ece:	4878 0002      	pea 2 <_start+0x2>
    1ed2:	2f3c aaaa aaaa 	move.l #-1431655766,-(sp)
    1ed8:	2f2f 00f4      	move.l 244(sp),-(sp)
    1edc:	4eba e33e      	jsr 21c <Utils_FillLong>(pc)
    1ee0:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *srcbig = AllocMem( 160, MEMF_CHIP);
    1ee4:	2f7c 0000 00a0 	move.l #160,224(sp)
    1eea:	00e0 
    1eec:	7002           	moveq #2,d0
    1eee:	2f40 00dc      	move.l d0,220(sp)
    1ef2:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    1ef8:	2c40           	movea.l d0,a6
    1efa:	202f 00e0      	move.l 224(sp),d0
    1efe:	222f 00dc      	move.l 220(sp),d1
    1f02:	4eae ff3a      	jsr -198(a6)
    1f06:	2f40 00d8      	move.l d0,216(sp)
    1f0a:	202f 00d8      	move.l 216(sp),d0
    1f0e:	2f40 00d4      	move.l d0,212(sp)
    if( srcbig == 0) {
    1f12:	6646           	bne.s 1f5a <Test_Zoom2+0x10e>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcbig\n", 40);
    1f14:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    1f1a:	2c40           	movea.l d0,a6
    1f1c:	4eae ffc4      	jsr -60(a6)
    1f20:	2f40 0030      	move.l d0,48(sp)
    1f24:	202f 0030      	move.l 48(sp),d0
    1f28:	2f40 002c      	move.l d0,44(sp)
    1f2c:	2f7c 0000 7cf3 	move.l #31987,40(sp)
    1f32:	0028 
    1f34:	7028           	moveq #40,d0
    1f36:	2f40 0024      	move.l d0,36(sp)
    1f3a:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    1f40:	2c40           	movea.l d0,a6
    1f42:	222f 002c      	move.l 44(sp),d1
    1f46:	242f 0028      	move.l 40(sp),d2
    1f4a:	262f 0024      	move.l 36(sp),d3
    1f4e:	4eae ffd0      	jsr -48(a6)
    1f52:	2f40 0020      	move.l d0,32(sp)
    1f56:	6000 04ce      	bra.w 2426 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong( srcbig, 0x55555555, 2, 20, 0);
    1f5a:	42a7           	clr.l -(sp)
    1f5c:	4878 0014      	pea 14 <_start+0x14>
    1f60:	4878 0002      	pea 2 <_start+0x2>
    1f64:	2f3c 5555 5555 	move.l #1431655765,-(sp)
    1f6a:	2f2f 00e4      	move.l 228(sp),-(sp)
    1f6e:	4eba e2ac      	jsr 21c <Utils_FillLong>(pc)
    1f72:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *target = AllocMem( 168, MEMF_CHIP);
    1f76:	2f7c 0000 00a8 	move.l #168,208(sp)
    1f7c:	00d0 
    1f7e:	7002           	moveq #2,d0
    1f80:	2f40 00cc      	move.l d0,204(sp)
    1f84:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    1f8a:	2c40           	movea.l d0,a6
    1f8c:	202f 00d0      	move.l 208(sp),d0
    1f90:	222f 00cc      	move.l 204(sp),d1
    1f94:	4eae ff3a      	jsr -198(a6)
    1f98:	2f40 00c8      	move.l d0,200(sp)
    1f9c:	202f 00c8      	move.l 200(sp),d0
    1fa0:	2f40 00c4      	move.l d0,196(sp)
  if( target == 0) {
    1fa4:	6646           	bne.s 1fec <Test_Zoom2+0x1a0>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
    1fa6:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    1fac:	2c40           	movea.l d0,a6
    1fae:	4eae ffc4      	jsr -60(a6)
    1fb2:	2f40 0044      	move.l d0,68(sp)
    1fb6:	202f 0044      	move.l 68(sp),d0
    1fba:	2f40 0040      	move.l d0,64(sp)
    1fbe:	2f7c 0000 7d1c 	move.l #32028,60(sp)
    1fc4:	003c 
    1fc6:	7028           	moveq #40,d0
    1fc8:	2f40 0038      	move.l d0,56(sp)
    1fcc:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    1fd2:	2c40           	movea.l d0,a6
    1fd4:	222f 0040      	move.l 64(sp),d1
    1fd8:	242f 003c      	move.l 60(sp),d2
    1fdc:	262f 0038      	move.l 56(sp),d3
    1fe0:	4eae ffd0      	jsr -48(a6)
    1fe4:	2f40 0034      	move.l d0,52(sp)
    1fe8:	6000 043c      	bra.w 2426 <Test_Zoom2+0x5da>
    return;
  }
  WaitBlt();
    1fec:	4eba e0c6      	jsr b4 <WaitBlt>(pc)
  hw->bltafwm = 0xffff;
    1ff0:	2079 0010 3294 	movea.l 103294 <hw>,a0
    1ff6:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1ffc:	2079 0010 3294 	movea.l 103294 <hw>,a0
    2002:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltdmod = 38;
    2008:	2079 0010 3294 	movea.l 103294 <hw>,a0
    200e:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcon1 = 1 << 12; //Shift src big
    2014:	2079 0010 3294 	movea.l 103294 <hw>,a0
    201a:	317c 1000 0042 	move.w #4096,66(a0)
  hw->bltcon0 = 0xde4; //Chanell settings and Shift src small
    2020:	2079 0010 3294 	movea.l 103294 <hw>,a0
    2026:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltcdat = 0x8000; //Show channel small if 1 else channel big
    202c:	2079 0010 3294 	movea.l 103294 <hw>,a0
    2032:	317c 8000 0070 	move.w #-32768,112(a0)
  //srcbig-shift   0010 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sbbb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2038:	4878 0001      	pea 1 <_start+0x1>
    203c:	4878 004e      	pea 4e <_start+0x4e>
    2040:	4878 0026      	pea 26 <_start+0x26>
    2044:	4878 0002      	pea 2 <_start+0x2>
    2048:	2f2f 00d4      	move.l 212(sp),-(sp)
    204c:	2f2f 00e8      	move.l 232(sp),-(sp)
    2050:	2f2f 00fc      	move.l 252(sp),-(sp)
    2054:	4eba efa8      	jsr ffe <Zoom_ZoomBlit2>(pc)
    2058:	4fef 001c      	lea 28(sp),sp
  UWORD *tmp = (UWORD *)target;
    205c:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2062:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    2068:	2c40           	movea.l d0,a6
    206a:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    206e:	42af 0104      	clr.l 260(sp)
    2072:	605c           	bra.s 20d0 <Test_Zoom2+0x284>
    if( *tmp != 0xaaaa ) {
    2074:	206f 0108      	movea.l 264(sp),a0
    2078:	3010           	move.w (a0),d0
    207a:	0c40 aaaa      	cmpi.w #-21846,d0
    207e:	6746           	beq.s 20c6 <Test_Zoom2+0x27a>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 1 failed\n", 40);
    2080:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2086:	2c40           	movea.l d0,a6
    2088:	4eae ffc4      	jsr -60(a6)
    208c:	2f40 0058      	move.l d0,88(sp)
    2090:	202f 0058      	move.l 88(sp),d0
    2094:	2f40 0054      	move.l d0,84(sp)
    2098:	2f7c 0000 7d45 	move.l #32069,80(sp)
    209e:	0050 
    20a0:	7028           	moveq #40,d0
    20a2:	2f40 004c      	move.l d0,76(sp)
    20a6:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    20ac:	2c40           	movea.l d0,a6
    20ae:	222f 0054      	move.l 84(sp),d1
    20b2:	242f 0050      	move.l 80(sp),d2
    20b6:	262f 004c      	move.l 76(sp),d3
    20ba:	4eae ffd0      	jsr -48(a6)
    20be:	2f40 0048      	move.l d0,72(sp)
    20c2:	6000 0362      	bra.w 2426 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    20c6:	7028           	moveq #40,d0
    20c8:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    20cc:	52af 0104      	addq.l #1,260(sp)
    20d0:	7001           	moveq #1,d0
    20d2:	b0af 0104      	cmp.l 260(sp),d0
    20d6:	6c9c           	bge.s 2074 <Test_Zoom2+0x228>
  //srcbig-shift   0001 0101 0101 0101
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       ssbb bbbb bbbb bbbb
  //result:        1001 0101 0101 0101

  hw->bltcon1 = 2 << 12; //Shift src big
    20d8:	2079 0010 3294 	movea.l 103294 <hw>,a0
    20de:	317c 2000 0042 	move.w #8192,66(a0)
  hw->bltcdat = 0xc000; //Show channel small if 1 else channel big
    20e4:	2079 0010 3294 	movea.l 103294 <hw>,a0
    20ea:	317c c000 0070 	move.w #-16384,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    20f0:	4878 0001      	pea 1 <_start+0x1>
    20f4:	4878 004e      	pea 4e <_start+0x4e>
    20f8:	4878 0026      	pea 26 <_start+0x26>
    20fc:	4878 0002      	pea 2 <_start+0x2>
    2100:	2f2f 00d4      	move.l 212(sp),-(sp)
    2104:	2f2f 00e8      	move.l 232(sp),-(sp)
    2108:	2f2f 00fc      	move.l 252(sp),-(sp)
    210c:	4eba eef0      	jsr ffe <Zoom_ZoomBlit2>(pc)
    2110:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2114:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    211a:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    2120:	2c40           	movea.l d0,a6
    2122:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2126:	42af 0100      	clr.l 256(sp)
    212a:	605c           	bra.s 2188 <Test_Zoom2+0x33c>
    if( *tmp != 0x9555 ) {
    212c:	206f 0108      	movea.l 264(sp),a0
    2130:	3010           	move.w (a0),d0
    2132:	0c40 9555      	cmpi.w #-27307,d0
    2136:	6746           	beq.s 217e <Test_Zoom2+0x332>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 2 failed\n", 40);
    2138:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    213e:	2c40           	movea.l d0,a6
    2140:	4eae ffc4      	jsr -60(a6)
    2144:	2f40 006c      	move.l d0,108(sp)
    2148:	202f 006c      	move.l 108(sp),d0
    214c:	2f40 0068      	move.l d0,104(sp)
    2150:	2f7c 0000 7d6e 	move.l #32110,100(sp)
    2156:	0064 
    2158:	7028           	moveq #40,d0
    215a:	2f40 0060      	move.l d0,96(sp)
    215e:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2164:	2c40           	movea.l d0,a6
    2166:	222f 0068      	move.l 104(sp),d1
    216a:	242f 0064      	move.l 100(sp),d2
    216e:	262f 0060      	move.l 96(sp),d3
    2172:	4eae ffd0      	jsr -48(a6)
    2176:	2f40 005c      	move.l d0,92(sp)
    217a:	6000 02aa      	bra.w 2426 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    217e:	7028           	moveq #40,d0
    2180:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2184:	52af 0100      	addq.l #1,256(sp)
    2188:	7001           	moveq #1,d0
    218a:	b0af 0100      	cmp.l 256(sp),d0
    218e:	6c9c           	bge.s 212c <Test_Zoom2+0x2e0>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2190:	2079 0010 3294 	movea.l 103294 <hw>,a0
    2196:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    219c:	2079 0010 3294 	movea.l 103294 <hw>,a0
    21a2:	317c e000 0070 	move.w #-8192,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    21a8:	4878 0001      	pea 1 <_start+0x1>
    21ac:	4878 004e      	pea 4e <_start+0x4e>
    21b0:	4878 0026      	pea 26 <_start+0x26>
    21b4:	4878 0002      	pea 2 <_start+0x2>
    21b8:	2f2f 00d4      	move.l 212(sp),-(sp)
    21bc:	2f2f 00e8      	move.l 232(sp),-(sp)
    21c0:	2f2f 00fc      	move.l 252(sp),-(sp)
    21c4:	4eba ee38      	jsr ffe <Zoom_ZoomBlit2>(pc)
    21c8:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    21cc:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    21d2:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    21d8:	2c40           	movea.l d0,a6
    21da:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    21de:	42af 00fc      	clr.l 252(sp)
    21e2:	605c           	bra.s 2240 <Test_Zoom2+0x3f4>
    if( *tmp != 0xaaaa ) {
    21e4:	206f 0108      	movea.l 264(sp),a0
    21e8:	3010           	move.w (a0),d0
    21ea:	0c40 aaaa      	cmpi.w #-21846,d0
    21ee:	6746           	beq.s 2236 <Test_Zoom2+0x3ea>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    21f0:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    21f6:	2c40           	movea.l d0,a6
    21f8:	4eae ffc4      	jsr -60(a6)
    21fc:	2f40 0080      	move.l d0,128(sp)
    2200:	202f 0080      	move.l 128(sp),d0
    2204:	2f40 007c      	move.l d0,124(sp)
    2208:	2f7c 0000 7d97 	move.l #32151,120(sp)
    220e:	0078 
    2210:	7028           	moveq #40,d0
    2212:	2f40 0074      	move.l d0,116(sp)
    2216:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    221c:	2c40           	movea.l d0,a6
    221e:	222f 007c      	move.l 124(sp),d1
    2222:	242f 0078      	move.l 120(sp),d2
    2226:	262f 0074      	move.l 116(sp),d3
    222a:	4eae ffd0      	jsr -48(a6)
    222e:	2f40 0070      	move.l d0,112(sp)
    2232:	6000 01f2      	bra.w 2426 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    2236:	7028           	moveq #40,d0
    2238:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    223c:	52af 00fc      	addq.l #1,252(sp)
    2240:	7001           	moveq #1,d0
    2242:	b0af 00fc      	cmp.l 252(sp),d0
    2246:	6c9c           	bge.s 21e4 <Test_Zoom2+0x398>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2248:	2079 0010 3294 	movea.l 103294 <hw>,a0
    224e:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    2254:	2079 0010 3294 	movea.l 103294 <hw>,a0
    225a:	317c e000 0070 	move.w #-8192,112(a0)

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2260:	4878 0001      	pea 1 <_start+0x1>
    2264:	4878 004e      	pea 4e <_start+0x4e>
    2268:	4878 0026      	pea 26 <_start+0x26>
    226c:	4878 0002      	pea 2 <_start+0x2>
    2270:	2f2f 00d4      	move.l 212(sp),-(sp)
    2274:	2f2f 00e8      	move.l 232(sp),-(sp)
    2278:	2f2f 00fc      	move.l 252(sp),-(sp)
    227c:	4eba ed80      	jsr ffe <Zoom_ZoomBlit2>(pc)
    2280:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2284:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    228a:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    2290:	2c40           	movea.l d0,a6
    2292:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2296:	42af 00f8      	clr.l 248(sp)
    229a:	605c           	bra.s 22f8 <Test_Zoom2+0x4ac>
    if( *tmp != 0xaaaa ) {
    229c:	206f 0108      	movea.l 264(sp),a0
    22a0:	3010           	move.w (a0),d0
    22a2:	0c40 aaaa      	cmpi.w #-21846,d0
    22a6:	6746           	beq.s 22ee <Test_Zoom2+0x4a2>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    22a8:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    22ae:	2c40           	movea.l d0,a6
    22b0:	4eae ffc4      	jsr -60(a6)
    22b4:	2f40 0094      	move.l d0,148(sp)
    22b8:	202f 0094      	move.l 148(sp),d0
    22bc:	2f40 0090      	move.l d0,144(sp)
    22c0:	2f7c 0000 7d97 	move.l #32151,140(sp)
    22c6:	008c 
    22c8:	7028           	moveq #40,d0
    22ca:	2f40 0088      	move.l d0,136(sp)
    22ce:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    22d4:	2c40           	movea.l d0,a6
    22d6:	222f 0090      	move.l 144(sp),d1
    22da:	242f 008c      	move.l 140(sp),d2
    22de:	262f 0088      	move.l 136(sp),d3
    22e2:	4eae ffd0      	jsr -48(a6)
    22e6:	2f40 0084      	move.l d0,132(sp)
    22ea:	6000 013a      	bra.w 2426 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    22ee:	7028           	moveq #40,d0
    22f0:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    22f4:	52af 00f8      	addq.l #1,248(sp)
    22f8:	7001           	moveq #1,d0
    22fa:	b0af 00f8      	cmp.l 248(sp),d0
    22fe:	6c9c           	bge.s 229c <Test_Zoom2+0x450>
  //srcsmall:            1010 1010 1010 1010
  //srcsmall-shift:      0101 0101 0101 0101
  //pattern:             sssb bbbb bbbb bbbb
  //result:              0100 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2300:	2079 0010 3294 	movea.l 103294 <hw>,a0
    2306:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    230c:	2079 0010 3294 	movea.l 103294 <hw>,a0
    2312:	317c e000 0070 	move.w #-8192,112(a0)
  hw->bltcon0 = 0xde4 + (1 << 12); //Chanell settings and Shift src small
    2318:	2079 0010 3294 	movea.l 103294 <hw>,a0
    231e:	317c 1de4 0040 	move.w #7652,64(a0)
 
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2324:	4878 0001      	pea 1 <_start+0x1>
    2328:	4878 004e      	pea 4e <_start+0x4e>
    232c:	4878 0026      	pea 26 <_start+0x26>
    2330:	4878 0002      	pea 2 <_start+0x2>
    2334:	2f2f 00d4      	move.l 212(sp),-(sp)
    2338:	2f2f 00e8      	move.l 232(sp),-(sp)
    233c:	2f2f 00fc      	move.l 252(sp),-(sp)
    2340:	4eba ecbc      	jsr ffe <Zoom_ZoomBlit2>(pc)
    2344:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2348:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    234e:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    2354:	2c40           	movea.l d0,a6
    2356:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    235a:	42af 00f4      	clr.l 244(sp)
    235e:	605a           	bra.s 23ba <Test_Zoom2+0x56e>
    if( *tmp != 0x4aaa ) {
    2360:	206f 0108      	movea.l 264(sp),a0
    2364:	3010           	move.w (a0),d0
    2366:	0c40 4aaa      	cmpi.w #19114,d0
    236a:	6744           	beq.s 23b0 <Test_Zoom2+0x564>
      Write( Output(), "Test_Zoom2: Test for shifting a failed\n", 39);
    236c:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2372:	2c40           	movea.l d0,a6
    2374:	4eae ffc4      	jsr -60(a6)
    2378:	2f40 00a8      	move.l d0,168(sp)
    237c:	202f 00a8      	move.l 168(sp),d0
    2380:	2f40 00a4      	move.l d0,164(sp)
    2384:	2f7c 0000 7dc0 	move.l #32192,160(sp)
    238a:	00a0 
    238c:	7027           	moveq #39,d0
    238e:	2f40 009c      	move.l d0,156(sp)
    2392:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2398:	2c40           	movea.l d0,a6
    239a:	222f 00a4      	move.l 164(sp),d1
    239e:	242f 00a0      	move.l 160(sp),d2
    23a2:	262f 009c      	move.l 156(sp),d3
    23a6:	4eae ffd0      	jsr -48(a6)
    23aa:	2f40 0098      	move.l d0,152(sp)
    23ae:	6076           	bra.s 2426 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    23b0:	7028           	moveq #40,d0
    23b2:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    23b6:	52af 00f4      	addq.l #1,244(sp)
    23ba:	7001           	moveq #1,d0
    23bc:	b0af 00f4      	cmp.l 244(sp),d0
    23c0:	6c9e           	bge.s 2360 <Test_Zoom2+0x514>

  FreeMem( srcsmall, 80);
    23c2:	2f6f 00e4 00c0 	move.l 228(sp),192(sp)
    23c8:	7050           	moveq #80,d0
    23ca:	2f40 00bc      	move.l d0,188(sp)
    23ce:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    23d4:	2c40           	movea.l d0,a6
    23d6:	226f 00c0      	movea.l 192(sp),a1
    23da:	202f 00bc      	move.l 188(sp),d0
    23de:	4eae ff2e      	jsr -210(a6)
  FreeMem( srcbig, 160);
    23e2:	2f6f 00d4 00b8 	move.l 212(sp),184(sp)
    23e8:	2f7c 0000 00a0 	move.l #160,180(sp)
    23ee:	00b4 
    23f0:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    23f6:	2c40           	movea.l d0,a6
    23f8:	226f 00b8      	movea.l 184(sp),a1
    23fc:	202f 00b4      	move.l 180(sp),d0
    2400:	4eae ff2e      	jsr -210(a6)
  FreeMem( target, 168);
    2404:	2f6f 00c4 00b0 	move.l 196(sp),176(sp)
    240a:	2f7c 0000 00a8 	move.l #168,172(sp)
    2410:	00ac 
    2412:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    2418:	2c40           	movea.l d0,a6
    241a:	226f 00b0      	movea.l 176(sp),a1
    241e:	202f 00ac      	move.l 172(sp),d0
    2422:	4eae ff2e      	jsr -210(a6)
    2426:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    242a:	4fef 0100      	lea 256(sp),sp
    242e:	4e75           	rts

00002430 <ClBuild>:
#include "utils.h"




ULONG * ClBuild() {
    2430:	4fef ffc4      	lea -60(sp),sp
    2434:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
    2438:	2f7c 0000 0084 	move.l #132,48(sp)
    243e:	0030 
    2440:	7002           	moveq #2,d0
    2442:	2f40 002c      	move.l d0,44(sp)
    2446:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    244c:	2c40           	movea.l d0,a6
    244e:	202f 0030      	move.l 48(sp),d0
    2452:	222f 002c      	move.l 44(sp),d1
    2456:	4eae ff3a      	jsr -198(a6)
    245a:	2f40 0028      	move.l d0,40(sp)
    245e:	202f 0028      	move.l 40(sp),d0
    2462:	2f40 0024      	move.l d0,36(sp)
  if( retval == 0) {
    2466:	6658           	bne.s 24c0 <ClBuild+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2468:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    246e:	2c40           	movea.l d0,a6
    2470:	4eae ffc4      	jsr -60(a6)
    2474:	2f40 0020      	move.l d0,32(sp)
    2478:	202f 0020      	move.l 32(sp),d0
    247c:	2f40 001c      	move.l d0,28(sp)
    2480:	2f7c 0000 7c53 	move.l #31827,24(sp)
    2486:	0018 
    2488:	7228           	moveq #40,d1
    248a:	2f41 0014      	move.l d1,20(sp)
    248e:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2494:	2c40           	movea.l d0,a6
    2496:	222f 001c      	move.l 28(sp),d1
    249a:	242f 0018      	move.l 24(sp),d2
    249e:	262f 0014      	move.l 20(sp),d3
    24a2:	4eae ffd0      	jsr -48(a6)
    24a6:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    24aa:	7401           	moveq #1,d2
    24ac:	2f42 000c      	move.l d2,12(sp)
    24b0:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    24b6:	2c40           	movea.l d0,a6
    24b8:	222f 000c      	move.l 12(sp),d1
    24bc:	4eae ff70      	jsr -144(a6)
  }
    
  ULONG *cl = retval;
    24c0:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    24c6:	2f7c 0000 a5ec 	move.l #42476,64(sp)
    24cc:	0040 
  for(int i=0; i<16;i++)
    24ce:	42af 003c      	clr.l 60(sp)
    24d2:	6024           	bra.s 24f8 <ClBuild+0xc8>
    *cl++ = *clpartinstruction++;
    24d4:	222f 0040      	move.l 64(sp),d1
    24d8:	2001           	move.l d1,d0
    24da:	5880           	addq.l #4,d0
    24dc:	2f40 0040      	move.l d0,64(sp)
    24e0:	202f 0044      	move.l 68(sp),d0
    24e4:	2400           	move.l d0,d2
    24e6:	5882           	addq.l #4,d2
    24e8:	2f42 0044      	move.l d2,68(sp)
    24ec:	2041           	movea.l d1,a0
    24ee:	2210           	move.l (a0),d1
    24f0:	2040           	movea.l d0,a0
    24f2:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    24f4:	52af 003c      	addq.l #1,60(sp)
    24f8:	700f           	moveq #15,d0
    24fa:	b0af 003c      	cmp.l 60(sp),d0
    24fe:	6cd4           	bge.s 24d4 <ClBuild+0xa4>
  clpartinstruction = ClScreen;
    2500:	2f7c 0000 a62c 	move.l #42540,64(sp)
    2506:	0040 
  for(int i=0; i<12;i++)
    2508:	42af 0038      	clr.l 56(sp)
    250c:	6024           	bra.s 2532 <ClBuild+0x102>
    *cl++ = *clpartinstruction++;
    250e:	222f 0040      	move.l 64(sp),d1
    2512:	2401           	move.l d1,d2
    2514:	5882           	addq.l #4,d2
    2516:	2f42 0040      	move.l d2,64(sp)
    251a:	202f 0044      	move.l 68(sp),d0
    251e:	2400           	move.l d0,d2
    2520:	5882           	addq.l #4,d2
    2522:	2f42 0044      	move.l d2,68(sp)
    2526:	2041           	movea.l d1,a0
    2528:	2210           	move.l (a0),d1
    252a:	2040           	movea.l d0,a0
    252c:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    252e:	52af 0038      	addq.l #1,56(sp)
    2532:	700b           	moveq #11,d0
    2534:	b0af 0038      	cmp.l 56(sp),d0
    2538:	6cd4           	bge.s 250e <ClBuild+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    253a:	202f 0044      	move.l 68(sp),d0
    253e:	2200           	move.l d0,d1
    2540:	5881           	addq.l #4,d1
    2542:	2f41 0044      	move.l d1,68(sp)
    2546:	2040           	movea.l d0,a0
    2548:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    254e:	202f 0044      	move.l 68(sp),d0
    2552:	2200           	move.l d0,d1
    2554:	5881           	addq.l #4,d1
    2556:	2f41 0044      	move.l d1,68(sp)
    255a:	2040           	movea.l d0,a0
    255c:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
    2562:	2f7c 0000 a56c 	move.l #42348,64(sp)
    2568:	0040 
  for(int i=0; i<2;i++)
    256a:	42af 0034      	clr.l 52(sp)
    256e:	6024           	bra.s 2594 <ClBuild+0x164>
    *cl++ = *clpartinstruction++;
    2570:	222f 0040      	move.l 64(sp),d1
    2574:	2001           	move.l d1,d0
    2576:	5880           	addq.l #4,d0
    2578:	2f40 0040      	move.l d0,64(sp)
    257c:	202f 0044      	move.l 68(sp),d0
    2580:	2400           	move.l d0,d2
    2582:	5882           	addq.l #4,d2
    2584:	2f42 0044      	move.l d2,68(sp)
    2588:	2041           	movea.l d1,a0
    258a:	2210           	move.l (a0),d1
    258c:	2040           	movea.l d0,a0
    258e:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
    2590:	52af 0034      	addq.l #1,52(sp)
    2594:	7001           	moveq #1,d0
    2596:	b0af 0034      	cmp.l 52(sp),d0
    259a:	6cd4           	bge.s 2570 <ClBuild+0x140>
  *cl = 0xfffffffe;
    259c:	206f 0044      	movea.l 68(sp),a0
    25a0:	72fe           	moveq #-2,d1
    25a2:	2081           	move.l d1,(a0)

  return retval;
    25a4:	202f 0024      	move.l 36(sp),d0
}
    25a8:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    25ac:	4fef 003c      	lea 60(sp),sp
    25b0:	4e75           	rts

000025b2 <PrepareDisplay>:

int PrepareDisplay() {
    25b2:	4fef ffb8      	lea -72(sp),sp
    25b6:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClBuild( );
    25ba:	4eba fe74      	jsr 2430 <ClBuild>(pc)
    25be:	23c0 0010 327c 	move.l d0,10327c <Copperlist1>
  Copperlist2 = ClBuild( );
    25c4:	4eba fe6a      	jsr 2430 <ClBuild>(pc)
    25c8:	23c0 0010 3280 	move.l d0,103280 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    25ce:	2f7c 0000 c800 	move.l #51200,80(sp)
    25d4:	0050 
    25d6:	7002           	moveq #2,d0
    25d8:	2f40 004c      	move.l d0,76(sp)
    25dc:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    25e2:	2c40           	movea.l d0,a6
    25e4:	202f 0050      	move.l 80(sp),d0
    25e8:	222f 004c      	move.l 76(sp),d1
    25ec:	4eae ff3a      	jsr -198(a6)
    25f0:	2f40 0048      	move.l d0,72(sp)
    25f4:	202f 0048      	move.l 72(sp),d0
    25f8:	23c0 0010 3274 	move.l d0,103274 <Bitplane1>
  if(Bitplane1 == 0) {
    25fe:	2039 0010 3274 	move.l 103274 <Bitplane1>,d0
    2604:	6658           	bne.s 265e <PrepareDisplay+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2606:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    260c:	2c40           	movea.l d0,a6
    260e:	4eae ffc4      	jsr -60(a6)
    2612:	2f40 0044      	move.l d0,68(sp)
    2616:	202f 0044      	move.l 68(sp),d0
    261a:	2f40 0040      	move.l d0,64(sp)
    261e:	2f7c 0000 7c05 	move.l #31749,60(sp)
    2624:	003c 
    2626:	7026           	moveq #38,d0
    2628:	2f40 0038      	move.l d0,56(sp)
    262c:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2632:	2c40           	movea.l d0,a6
    2634:	222f 0040      	move.l 64(sp),d1
    2638:	242f 003c      	move.l 60(sp),d2
    263c:	262f 0038      	move.l 56(sp),d3
    2640:	4eae ffd0      	jsr -48(a6)
    2644:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    2648:	7001           	moveq #1,d0
    264a:	2f40 0030      	move.l d0,48(sp)
    264e:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2654:	2c40           	movea.l d0,a6
    2656:	222f 0030      	move.l 48(sp),d1
    265a:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane1;
    265e:	2039 0010 3274 	move.l 103274 <Bitplane1>,d0
    2664:	23c0 0010 3288 	move.l d0,103288 <ViewBuffer>
  ViewCopper = Copperlist1;
    266a:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    2670:	23c0 0010 3290 	move.l d0,103290 <ViewCopper>
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    2676:	2f7c 0000 c800 	move.l #51200,44(sp)
    267c:	002c 
    267e:	7002           	moveq #2,d0
    2680:	2f40 0028      	move.l d0,40(sp)
    2684:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    268a:	2c40           	movea.l d0,a6
    268c:	202f 002c      	move.l 44(sp),d0
    2690:	222f 0028      	move.l 40(sp),d1
    2694:	4eae ff3a      	jsr -198(a6)
    2698:	2f40 0024      	move.l d0,36(sp)
    269c:	202f 0024      	move.l 36(sp),d0
    26a0:	23c0 0010 3278 	move.l d0,103278 <Bitplane2>
  if(Bitplane2 == 0) {
    26a6:	2039 0010 3278 	move.l 103278 <Bitplane2>,d0
    26ac:	6658           	bne.s 2706 <PrepareDisplay+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    26ae:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    26b4:	2c40           	movea.l d0,a6
    26b6:	4eae ffc4      	jsr -60(a6)
    26ba:	2f40 0020      	move.l d0,32(sp)
    26be:	202f 0020      	move.l 32(sp),d0
    26c2:	2f40 001c      	move.l d0,28(sp)
    26c6:	2f7c 0000 7c2c 	move.l #31788,24(sp)
    26cc:	0018 
    26ce:	7026           	moveq #38,d0
    26d0:	2f40 0014      	move.l d0,20(sp)
    26d4:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    26da:	2c40           	movea.l d0,a6
    26dc:	222f 001c      	move.l 28(sp),d1
    26e0:	242f 0018      	move.l 24(sp),d2
    26e4:	262f 0014      	move.l 20(sp),d3
    26e8:	4eae ffd0      	jsr -48(a6)
    26ec:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    26f0:	7001           	moveq #1,d0
    26f2:	2f40 000c      	move.l d0,12(sp)
    26f6:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    26fc:	2c40           	movea.l d0,a6
    26fe:	222f 000c      	move.l 12(sp),d1
    2702:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane2;
    2706:	2039 0010 3278 	move.l 103278 <Bitplane2>,d0
    270c:	23c0 0010 3284 	move.l d0,103284 <DrawBuffer>
  DrawCopper = Copperlist2;
    2712:	2039 0010 3280 	move.l 103280 <Copperlist2>,d0
    2718:	23c0 0010 328c 	move.l d0,10328c <DrawCopper>
  /*SwapCl();
  SetBplPointers();
  SwapCl();
  SetBplPointers();*/
  return 0;
    271e:	7000           	moveq #0,d0
}
    2720:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2724:	4fef 0048      	lea 72(sp),sp
    2728:	4e75           	rts

0000272a <TestCopperlistBatch>:

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                  long length) {
    272a:	598f           	subq.l #4,sp
  for( int i=0;i<length;i++)
    272c:	4297           	clr.l (sp)
    272e:	602a           	bra.s 275a <TestCopperlistBatch+0x30>
    if( instructions[ pos+i] != batch[ i])
    2730:	202f 000c      	move.l 12(sp),d0
    2734:	d097           	add.l (sp),d0
    2736:	d080           	add.l d0,d0
    2738:	d080           	add.l d0,d0
    273a:	206f 0008      	movea.l 8(sp),a0
    273e:	d1c0           	adda.l d0,a0
    2740:	2210           	move.l (a0),d1
    2742:	2017           	move.l (sp),d0
    2744:	d080           	add.l d0,d0
    2746:	d080           	add.l d0,d0
    2748:	206f 0010      	movea.l 16(sp),a0
    274c:	d1c0           	adda.l d0,a0
    274e:	2010           	move.l (a0),d0
    2750:	b081           	cmp.l d1,d0
    2752:	6704           	beq.s 2758 <TestCopperlistBatch+0x2e>
      return 0;
    2754:	7000           	moveq #0,d0
    2756:	600c           	bra.s 2764 <TestCopperlistBatch+0x3a>
  for( int i=0;i<length;i++)
    2758:	5297           	addq.l #1,(sp)
    275a:	2017           	move.l (sp),d0
    275c:	b0af 0014      	cmp.l 20(sp),d0
    2760:	6dce           	blt.s 2730 <TestCopperlistBatch+0x6>
  return 1;
    2762:	7001           	moveq #1,d0
}
    2764:	588f           	addq.l #4,sp
    2766:	4e75           	rts

00002768 <TestCopperlistPos>:

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    2768:	202f 0008      	move.l 8(sp),d0
    276c:	d080           	add.l d0,d0
    276e:	d080           	add.l d0,d0
    2770:	206f 0004      	movea.l 4(sp),a0
    2774:	d1c0           	adda.l d0,a0
    2776:	2010           	move.l (a0),d0
    2778:	b0af 000c      	cmp.l 12(sp),d0
    277c:	6604           	bne.s 2782 <TestCopperlistPos+0x1a>
    return 1;
    277e:	7001           	moveq #1,d0
    2780:	6002           	bra.s 2784 <TestCopperlistPos+0x1c>
  else 
    return 0;
    2782:	7000           	moveq #0,d0
}
    2784:	4e75           	rts

00002786 <TestCopperList>:

void TestCopperList() {
    2786:	4fef feb8      	lea -328(sp),sp
    278a:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Write( Output(), "%d", hw->cop1lc);
    278e:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2794:	2c40           	movea.l d0,a6
    2796:	4eae ffc4      	jsr -60(a6)
    279a:	2f40 0150      	move.l d0,336(sp)
    279e:	202f 0150      	move.l 336(sp),d0
    27a2:	2f40 014c      	move.l d0,332(sp)
    27a6:	2f7c 0000 7de8 	move.l #32232,328(sp)
    27ac:	0148 
    27ae:	2079 0010 3294 	movea.l 103294 <hw>,a0
    27b4:	2028 0080      	move.l 128(a0),d0
    27b8:	2f40 0144      	move.l d0,324(sp)
    27bc:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    27c2:	2c40           	movea.l d0,a6
    27c4:	222f 014c      	move.l 332(sp),d1
    27c8:	242f 0148      	move.l 328(sp),d2
    27cc:	262f 0144      	move.l 324(sp),d3
    27d0:	4eae ffd0      	jsr -48(a6)
    27d4:	2f40 0140      	move.l d0,320(sp)
  Copperlist1 = ClBuild();
    27d8:	4eba fc56      	jsr 2430 <ClBuild>(pc)
    27dc:	23c0 0010 327c 	move.l d0,10327c <Copperlist1>
  DrawCopper = Copperlist1;
    27e2:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    27e8:	23c0 0010 328c 	move.l d0,10328c <DrawCopper>
  Copperlist2 = ClBuild();
    27ee:	4eba fc40      	jsr 2430 <ClBuild>(pc)
    27f2:	23c0 0010 3280 	move.l d0,103280 <Copperlist2>
  ViewCopper = Copperlist2;
    27f8:	2039 0010 3280 	move.l 103280 <Copperlist2>,d0
    27fe:	23c0 0010 3290 	move.l d0,103290 <ViewCopper>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2804:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    280a:	4878 0010      	pea 10 <_start+0x10>
    280e:	4879 0000 a5ec 	pea a5ec <ClsSprites>
    2814:	42a7           	clr.l -(sp)
    2816:	2f00           	move.l d0,-(sp)
    2818:	4eba ff10      	jsr 272a <TestCopperlistBatch>(pc)
    281c:	4fef 0010      	lea 16(sp),sp
    2820:	4a80           	tst.l d0
    2822:	6642           	bne.s 2866 <TestCopperList+0xe0>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    2824:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    282a:	2c40           	movea.l d0,a6
    282c:	4eae ffc4      	jsr -60(a6)
    2830:	2f40 013c      	move.l d0,316(sp)
    2834:	202f 013c      	move.l 316(sp),d0
    2838:	2f40 0138      	move.l d0,312(sp)
    283c:	2f7c 0000 7570 	move.l #30064,308(sp)
    2842:	0134 
    2844:	702c           	moveq #44,d0
    2846:	2f40 0130      	move.l d0,304(sp)
    284a:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2850:	2c40           	movea.l d0,a6
    2852:	222f 0138      	move.l 312(sp),d1
    2856:	242f 0134      	move.l 308(sp),d2
    285a:	262f 0130      	move.l 304(sp),d3
    285e:	4eae ffd0      	jsr -48(a6)
    2862:	2f40 012c      	move.l d0,300(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2866:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    286c:	4878 000c      	pea c <_start+0xc>
    2870:	4879 0000 a62c 	pea a62c <ClScreen>
    2876:	4878 0010      	pea 10 <_start+0x10>
    287a:	2f00           	move.l d0,-(sp)
    287c:	4eba feac      	jsr 272a <TestCopperlistBatch>(pc)
    2880:	4fef 0010      	lea 16(sp),sp
    2884:	4a80           	tst.l d0
    2886:	6642           	bne.s 28ca <TestCopperList+0x144>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    2888:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    288e:	2c40           	movea.l d0,a6
    2890:	4eae ffc4      	jsr -60(a6)
    2894:	2f40 0128      	move.l d0,296(sp)
    2898:	202f 0128      	move.l 296(sp),d0
    289c:	2f40 0124      	move.l d0,292(sp)
    28a0:	2f7c 0000 75a6 	move.l #30118,288(sp)
    28a6:	0120 
    28a8:	7036           	moveq #54,d0
    28aa:	2f40 011c      	move.l d0,284(sp)
    28ae:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    28b4:	2c40           	movea.l d0,a6
    28b6:	222f 0124      	move.l 292(sp),d1
    28ba:	242f 0120      	move.l 288(sp),d2
    28be:	262f 011c      	move.l 284(sp),d3
    28c2:	4eae ffd0      	jsr -48(a6)
    28c6:	2f40 0118      	move.l d0,280(sp)
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
    28ca:	23fc 0004 0000 	move.l #262144,103284 <DrawBuffer>
    28d0:	0010 3284 
  ViewBuffer = (ULONG *)0x50000;
    28d4:	23fc 0005 0000 	move.l #327680,103288 <ViewBuffer>
    28da:	0010 3288 
  
  SetBplPointers();
    28de:	4eba d862      	jsr 142 <SetBplPointers>(pc)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    28e2:	2039 0010 3284 	move.l 103284 <DrawBuffer>,d0
    28e8:	0c80 0005 0000 	cmpi.l #327680,d0
    28ee:	660e           	bne.s 28fe <TestCopperList+0x178>
    28f0:	2039 0010 3288 	move.l 103288 <ViewBuffer>,d0
    28f6:	0c80 0004 0000 	cmpi.l #262144,d0
    28fc:	6742           	beq.s 2940 <TestCopperList+0x1ba>
    Write( Output(), 
    28fe:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2904:	2c40           	movea.l d0,a6
    2906:	4eae ffc4      	jsr -60(a6)
    290a:	2f40 0114      	move.l d0,276(sp)
    290e:	202f 0114      	move.l 276(sp),d0
    2912:	2f40 0110      	move.l d0,272(sp)
    2916:	2f7c 0000 7deb 	move.l #32235,268(sp)
    291c:	010c 
    291e:	703b           	moveq #59,d0
    2920:	2f40 0108      	move.l d0,264(sp)
    2924:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    292a:	2c40           	movea.l d0,a6
    292c:	222f 0110      	move.l 272(sp),d1
    2930:	242f 010c      	move.l 268(sp),d2
    2934:	262f 0108      	move.l 264(sp),d3
    2938:	4eae ffd0      	jsr -48(a6)
    293c:	2f40 0104      	move.l d0,260(sp)
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    2940:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    2946:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    294c:	4878 001c      	pea 1c <_start+0x1c>
    2950:	2f00           	move.l d0,-(sp)
    2952:	4eba fe14      	jsr 2768 <TestCopperlistPos>(pc)
    2956:	4fef 000c      	lea 12(sp),sp
    295a:	4a80           	tst.l d0
    295c:	6642           	bne.s 29a0 <TestCopperList+0x21a>
    Write(Output(), 
    295e:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2964:	2c40           	movea.l d0,a6
    2966:	4eae ffc4      	jsr -60(a6)
    296a:	2f40 0100      	move.l d0,256(sp)
    296e:	202f 0100      	move.l 256(sp),d0
    2972:	2f40 00fc      	move.l d0,252(sp)
    2976:	2f7c 0000 7e27 	move.l #32295,248(sp)
    297c:	00f8 
    297e:	703c           	moveq #60,d0
    2980:	2f40 00f4      	move.l d0,244(sp)
    2984:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    298a:	2c40           	movea.l d0,a6
    298c:	222f 00fc      	move.l 252(sp),d1
    2990:	242f 00f8      	move.l 248(sp),d2
    2994:	262f 00f4      	move.l 244(sp),d3
    2998:	4eae ffd0      	jsr -48(a6)
    299c:	2f40 00f0      	move.l d0,240(sp)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    29a0:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    29a6:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    29ac:	4878 001d      	pea 1d <_start+0x1d>
    29b0:	2f00           	move.l d0,-(sp)
    29b2:	4eba fdb4      	jsr 2768 <TestCopperlistPos>(pc)
    29b6:	4fef 000c      	lea 12(sp),sp
    29ba:	4a80           	tst.l d0
    29bc:	6642           	bne.s 2a00 <TestCopperList+0x27a>
    Write(Output(), 
    29be:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    29c4:	2c40           	movea.l d0,a6
    29c6:	4eae ffc4      	jsr -60(a6)
    29ca:	2f40 00ec      	move.l d0,236(sp)
    29ce:	202f 00ec      	move.l 236(sp),d0
    29d2:	2f40 00e8      	move.l d0,232(sp)
    29d6:	2f7c 0000 7e64 	move.l #32356,228(sp)
    29dc:	00e4 
    29de:	703c           	moveq #60,d0
    29e0:	2f40 00e0      	move.l d0,224(sp)
    29e4:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    29ea:	2c40           	movea.l d0,a6
    29ec:	222f 00e8      	move.l 232(sp),d1
    29f0:	242f 00e4      	move.l 228(sp),d2
    29f4:	262f 00e0      	move.l 224(sp),d3
    29f8:	4eae ffd0      	jsr -48(a6)
    29fc:	2f40 00dc      	move.l d0,220(sp)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2a00:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    2a06:	4878 0002      	pea 2 <_start+0x2>
    2a0a:	4879 0000 a56c 	pea a56c <ClColor>
    2a10:	4878 001e      	pea 1e <_start+0x1e>
    2a14:	2f00           	move.l d0,-(sp)
    2a16:	4eba fd12      	jsr 272a <TestCopperlistBatch>(pc)
    2a1a:	4fef 0010      	lea 16(sp),sp
    2a1e:	4a80           	tst.l d0
    2a20:	6642           	bne.s 2a64 <TestCopperList+0x2de>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2a22:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2a28:	2c40           	movea.l d0,a6
    2a2a:	4eae ffc4      	jsr -60(a6)
    2a2e:	2f40 00d8      	move.l d0,216(sp)
    2a32:	202f 00d8      	move.l 216(sp),d0
    2a36:	2f40 00d4      	move.l d0,212(sp)
    2a3a:	2f7c 0000 75dd 	move.l #30173,208(sp)
    2a40:	00d0 
    2a42:	7021           	moveq #33,d0
    2a44:	2f40 00cc      	move.l d0,204(sp)
    2a48:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2a4e:	2c40           	movea.l d0,a6
    2a50:	222f 00d4      	move.l 212(sp),d1
    2a54:	242f 00d0      	move.l 208(sp),d2
    2a58:	262f 00cc      	move.l 204(sp),d3
    2a5c:	4eae ffd0      	jsr -48(a6)
    2a60:	2f40 00c8      	move.l d0,200(sp)

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2a64:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    2a6a:	4878 fffe      	pea fffffffe <_end+0xffefcd12>
    2a6e:	4878 0020      	pea 20 <_start+0x20>
    2a72:	2f00           	move.l d0,-(sp)
    2a74:	4eba fcf2      	jsr 2768 <TestCopperlistPos>(pc)
    2a78:	4fef 000c      	lea 12(sp),sp
    2a7c:	4a80           	tst.l d0
    2a7e:	6642           	bne.s 2ac2 <TestCopperList+0x33c>
    Write(Output(), "Copperlist End not correctly set.\n", 34);
    2a80:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2a86:	2c40           	movea.l d0,a6
    2a88:	4eae ffc4      	jsr -60(a6)
    2a8c:	2f40 00c4      	move.l d0,196(sp)
    2a90:	202f 00c4      	move.l 196(sp),d0
    2a94:	2f40 00c0      	move.l d0,192(sp)
    2a98:	2f7c 0000 75ff 	move.l #30207,188(sp)
    2a9e:	00bc 
    2aa0:	7022           	moveq #34,d0
    2aa2:	2f40 00b8      	move.l d0,184(sp)
    2aa6:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2aac:	2c40           	movea.l d0,a6
    2aae:	222f 00c0      	move.l 192(sp),d1
    2ab2:	242f 00bc      	move.l 188(sp),d2
    2ab6:	262f 00b8      	move.l 184(sp),d3
    2aba:	4eae ffd0      	jsr -48(a6)
    2abe:	2f40 00b4      	move.l d0,180(sp)
  
  SwapCl();
    2ac2:	4eba d6dc      	jsr 1a0 <SwapCl>(pc)
  
  if( DrawCopper != Copperlist2)
    2ac6:	2239 0010 328c 	move.l 10328c <DrawCopper>,d1
    2acc:	2039 0010 3280 	move.l 103280 <Copperlist2>,d0
    2ad2:	b081           	cmp.l d1,d0
    2ad4:	6742           	beq.s 2b18 <TestCopperList+0x392>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
    2ad6:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2adc:	2c40           	movea.l d0,a6
    2ade:	4eae ffc4      	jsr -60(a6)
    2ae2:	2f40 00b0      	move.l d0,176(sp)
    2ae6:	202f 00b0      	move.l 176(sp),d0
    2aea:	2f40 00ac      	move.l d0,172(sp)
    2aee:	2f7c 0000 7ea1 	move.l #32417,168(sp)
    2af4:	00a8 
    2af6:	7015           	moveq #21,d0
    2af8:	2f40 00a4      	move.l d0,164(sp)
    2afc:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2b02:	2c40           	movea.l d0,a6
    2b04:	222f 00ac      	move.l 172(sp),d1
    2b08:	242f 00a8      	move.l 168(sp),d2
    2b0c:	262f 00a4      	move.l 164(sp),d3
    2b10:	4eae ffd0      	jsr -48(a6)
    2b14:	2f40 00a0      	move.l d0,160(sp)

  
  PrepareDisplay();
    2b18:	4eba fa98      	jsr 25b2 <PrepareDisplay>(pc)
  if( DrawBuffer != Bitplane2) 
    2b1c:	2239 0010 3284 	move.l 103284 <DrawBuffer>,d1
    2b22:	2039 0010 3278 	move.l 103278 <Bitplane2>,d0
    2b28:	b081           	cmp.l d1,d0
    2b2a:	6742           	beq.s 2b6e <TestCopperList+0x3e8>
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
    2b2c:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2b32:	2c40           	movea.l d0,a6
    2b34:	4eae ffc4      	jsr -60(a6)
    2b38:	2f40 009c      	move.l d0,156(sp)
    2b3c:	202f 009c      	move.l 156(sp),d0
    2b40:	2f40 0098      	move.l d0,152(sp)
    2b44:	2f7c 0000 7eb7 	move.l #32439,148(sp)
    2b4a:	0094 
    2b4c:	7037           	moveq #55,d0
    2b4e:	2f40 0090      	move.l d0,144(sp)
    2b52:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2b58:	2c40           	movea.l d0,a6
    2b5a:	222f 0098      	move.l 152(sp),d1
    2b5e:	242f 0094      	move.l 148(sp),d2
    2b62:	262f 0090      	move.l 144(sp),d3
    2b66:	4eae ffd0      	jsr -48(a6)
    2b6a:	2f40 008c      	move.l d0,140(sp)
                                                                            55);
  if( DrawCopper != Copperlist2) 
    2b6e:	2239 0010 328c 	move.l 10328c <DrawCopper>,d1
    2b74:	2039 0010 3280 	move.l 103280 <Copperlist2>,d0
    2b7a:	b081           	cmp.l d1,d0
    2b7c:	6742           	beq.s 2bc0 <TestCopperList+0x43a>
    Write( Output(), 
    2b7e:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2b84:	2c40           	movea.l d0,a6
    2b86:	4eae ffc4      	jsr -60(a6)
    2b8a:	2f40 0088      	move.l d0,136(sp)
    2b8e:	202f 0088      	move.l 136(sp),d0
    2b92:	2f40 0084      	move.l d0,132(sp)
    2b96:	2f7c 0000 7eef 	move.l #32495,128(sp)
    2b9c:	0080 
    2b9e:	7039           	moveq #57,d0
    2ba0:	2f40 007c      	move.l d0,124(sp)
    2ba4:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2baa:	2c40           	movea.l d0,a6
    2bac:	222f 0084      	move.l 132(sp),d1
    2bb0:	242f 0080      	move.l 128(sp),d2
    2bb4:	262f 007c      	move.l 124(sp),d3
    2bb8:	4eae ffd0      	jsr -48(a6)
    2bbc:	2f40 0078      	move.l d0,120(sp)
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
    2bc0:	2239 0010 3288 	move.l 103288 <ViewBuffer>,d1
    2bc6:	2039 0010 3274 	move.l 103274 <Bitplane1>,d0
    2bcc:	b081           	cmp.l d1,d0
    2bce:	6742           	beq.s 2c12 <TestCopperList+0x48c>
    Write( Output(), 
    2bd0:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2bd6:	2c40           	movea.l d0,a6
    2bd8:	4eae ffc4      	jsr -60(a6)
    2bdc:	2f40 0074      	move.l d0,116(sp)
    2be0:	202f 0074      	move.l 116(sp),d0
    2be4:	2f40 0070      	move.l d0,112(sp)
    2be8:	2f7c 0000 7f29 	move.l #32553,108(sp)
    2bee:	006c 
    2bf0:	7038           	moveq #56,d0
    2bf2:	2f40 0068      	move.l d0,104(sp)
    2bf6:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2bfc:	2c40           	movea.l d0,a6
    2bfe:	222f 0070      	move.l 112(sp),d1
    2c02:	242f 006c      	move.l 108(sp),d2
    2c06:	262f 0068      	move.l 104(sp),d3
    2c0a:	4eae ffd0      	jsr -48(a6)
    2c0e:	2f40 0064      	move.l d0,100(sp)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
    2c12:	2239 0010 3290 	move.l 103290 <ViewCopper>,d1
    2c18:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    2c1e:	b081           	cmp.l d1,d0
    2c20:	6742           	beq.s 2c64 <TestCopperList+0x4de>
    Write( Output(), 
    2c22:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2c28:	2c40           	movea.l d0,a6
    2c2a:	4eae ffc4      	jsr -60(a6)
    2c2e:	2f40 0060      	move.l d0,96(sp)
    2c32:	202f 0060      	move.l 96(sp),d0
    2c36:	2f40 005c      	move.l d0,92(sp)
    2c3a:	2f7c 0000 7f62 	move.l #32610,88(sp)
    2c40:	0058 
    2c42:	703a           	moveq #58,d0
    2c44:	2f40 0054      	move.l d0,84(sp)
    2c48:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2c4e:	2c40           	movea.l d0,a6
    2c50:	222f 005c      	move.l 92(sp),d1
    2c54:	242f 0058      	move.l 88(sp),d2
    2c58:	262f 0054      	move.l 84(sp),d3
    2c5c:	4eae ffd0      	jsr -48(a6)
    2c60:	2f40 0050      	move.l d0,80(sp)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
    2c64:	4eba d4dc      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2c68:	4eba d536      	jsr 1a0 <SwapCl>(pc)
  UWORD *copword = ViewCopper;
    2c6c:	2f79 0010 3290 	move.l 103290 <ViewCopper>,76(sp)
    2c72:	004c 
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2c74:	307c 0076      	movea.w #118,a0
    2c78:	d1ef 004c      	adda.l 76(sp),a0
    2c7c:	3010           	move.w (a0),d0
    2c7e:	7200           	moveq #0,d1
    2c80:	3200           	move.w d0,d1
    2c82:	307c 0072      	movea.w #114,a0
    2c86:	d1ef 004c      	adda.l 76(sp),a0
    2c8a:	3010           	move.w (a0),d0
    2c8c:	3000           	move.w d0,d0
    2c8e:	0280 0000 ffff 	andi.l #65535,d0
    2c94:	4840           	swap d0
    2c96:	4240           	clr.w d0
    2c98:	d081           	add.l d1,d0
    2c9a:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2c9e:	2039 0010 3278 	move.l 103278 <Bitplane2>,d0
    2ca4:	b0af 0048      	cmp.l 72(sp),d0
    2ca8:	6742           	beq.s 2cec <TestCopperList+0x566>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2caa:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2cb0:	2c40           	movea.l d0,a6
    2cb2:	4eae ffc4      	jsr -60(a6)
    2cb6:	2f40 0044      	move.l d0,68(sp)
    2cba:	202f 0044      	move.l 68(sp),d0
    2cbe:	2f40 0040      	move.l d0,64(sp)
    2cc2:	2f7c 0000 7f9d 	move.l #32669,60(sp)
    2cc8:	003c 
    2cca:	7048           	moveq #72,d0
    2ccc:	2f40 0038      	move.l d0,56(sp)
    2cd0:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2cd6:	2c40           	movea.l d0,a6
    2cd8:	222f 0040      	move.l 64(sp),d1
    2cdc:	242f 003c      	move.l 60(sp),d2
    2ce0:	262f 0038      	move.l 56(sp),d3
    2ce4:	4eae ffd0      	jsr -48(a6)
    2ce8:	2f40 0034      	move.l d0,52(sp)
                                                   " after first frame.\n", 72);
  SetBplPointers();
    2cec:	4eba d454      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2cf0:	4eba d4ae      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2cf4:	2f79 0010 3290 	move.l 103290 <ViewCopper>,76(sp)
    2cfa:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2cfc:	307c 0076      	movea.w #118,a0
    2d00:	d1ef 004c      	adda.l 76(sp),a0
    2d04:	3010           	move.w (a0),d0
    2d06:	7200           	moveq #0,d1
    2d08:	3200           	move.w d0,d1
    2d0a:	307c 0072      	movea.w #114,a0
    2d0e:	d1ef 004c      	adda.l 76(sp),a0
    2d12:	3010           	move.w (a0),d0
    2d14:	3000           	move.w d0,d0
    2d16:	0280 0000 ffff 	andi.l #65535,d0
    2d1c:	4840           	swap d0
    2d1e:	4240           	clr.w d0
    2d20:	d081           	add.l d1,d0
    2d22:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane1) 
    2d26:	2039 0010 3274 	move.l 103274 <Bitplane1>,d0
    2d2c:	b0af 0048      	cmp.l 72(sp),d0
    2d30:	6742           	beq.s 2d74 <TestCopperList+0x5ee>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
    2d32:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2d38:	2c40           	movea.l d0,a6
    2d3a:	4eae ffc4      	jsr -60(a6)
    2d3e:	2f40 0030      	move.l d0,48(sp)
    2d42:	202f 0030      	move.l 48(sp),d0
    2d46:	2f40 002c      	move.l d0,44(sp)
    2d4a:	2f7c 0000 7fe6 	move.l #32742,40(sp)
    2d50:	0028 
    2d52:	7049           	moveq #73,d0
    2d54:	2f40 0024      	move.l d0,36(sp)
    2d58:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2d5e:	2c40           	movea.l d0,a6
    2d60:	222f 002c      	move.l 44(sp),d1
    2d64:	242f 0028      	move.l 40(sp),d2
    2d68:	262f 0024      	move.l 36(sp),d3
    2d6c:	4eae ffd0      	jsr -48(a6)
    2d70:	2f40 0020      	move.l d0,32(sp)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
    2d74:	4eba d3cc      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2d78:	4eba d426      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2d7c:	2f79 0010 3290 	move.l 103290 <ViewCopper>,76(sp)
    2d82:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2d84:	307c 0076      	movea.w #118,a0
    2d88:	d1ef 004c      	adda.l 76(sp),a0
    2d8c:	3010           	move.w (a0),d0
    2d8e:	7200           	moveq #0,d1
    2d90:	3200           	move.w d0,d1
    2d92:	307c 0072      	movea.w #114,a0
    2d96:	d1ef 004c      	adda.l 76(sp),a0
    2d9a:	3010           	move.w (a0),d0
    2d9c:	3000           	move.w d0,d0
    2d9e:	0280 0000 ffff 	andi.l #65535,d0
    2da4:	4840           	swap d0
    2da6:	4240           	clr.w d0
    2da8:	d081           	add.l d1,d0
    2daa:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2dae:	2039 0010 3278 	move.l 103278 <Bitplane2>,d0
    2db4:	b0af 0048      	cmp.l 72(sp),d0
    2db8:	6742           	beq.s 2dfc <TestCopperList+0x676>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2dba:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2dc0:	2c40           	movea.l d0,a6
    2dc2:	4eae ffc4      	jsr -60(a6)
    2dc6:	2f40 001c      	move.l d0,28(sp)
    2dca:	202f 001c      	move.l 28(sp),d0
    2dce:	2f40 0018      	move.l d0,24(sp)
    2dd2:	2f7c 0000 8030 	move.l #32816,20(sp)
    2dd8:	0014 
    2dda:	7048           	moveq #72,d0
    2ddc:	2f40 0010      	move.l d0,16(sp)
    2de0:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2de6:	2c40           	movea.l d0,a6
    2de8:	222f 0018      	move.l 24(sp),d1
    2dec:	242f 0014      	move.l 20(sp),d2
    2df0:	262f 0010      	move.l 16(sp),d3
    2df4:	4eae ffd0      	jsr -48(a6)
    2df8:	2f40 000c      	move.l d0,12(sp)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
    2dfc:	2f3c 0000 c800 	move.l #51200,-(sp)
    2e02:	4878 0084      	pea 84 <_start+0x84>
    2e06:	4eba d2d8      	jsr e0 <FreeDisplay>(pc)
    2e0a:	508f           	addq.l #8,sp
    2e0c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2e10:	4fef 0148      	lea 328(sp),sp
    2e14:	4e75           	rts

00002e16 <RunTests>:
#include "runtests.h"
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    2e16:	4eba f96e      	jsr 2786 <TestCopperList>(pc)
    ZoomTest();
    2e1a:	4eba 0004      	jsr 2e20 <ZoomTest>(pc)
    //SwScrollerTest();
    2e1e:	4e75           	rts

00002e20 <ZoomTest>:
#include "zoomtest2.h"

ULONG Cl102ZoomTest[137];

void ZoomTest() {
  TestZoomSpeed();
    2e20:	4eba 0046      	jsr 2e68 <TestZoomSpeed>(pc)
  ZoomTestDisplay();
    2e24:	4eba 00e2      	jsr 2f08 <ZoomTestDisplay>(pc)
  TestBlitleftOfZoom();
    2e28:	4eba 05a8      	jsr 33d2 <TestBlitleftOfZoom>(pc)
  TestCopyWord();
    2e2c:	4eba 0838      	jsr 3666 <TestCopyWord>(pc)
  TestZoom4Picture();
    2e30:	4eba 0e12      	jsr 3c44 <TestZoom4Picture>(pc)
  TestZoom4PictureOn5Planes();
    2e34:	4eba 0b22      	jsr 3958 <TestZoom4PictureOn5Planes>(pc)
  Test_Zoom2();
    2e38:	4eba f012      	jsr 1e4c <Test_Zoom2>(pc)
  c2p1x1_8_c5_gen_init( 320, 256, 0, 0, 0, 0);
    2e3c:	42a7           	clr.l -(sp)
    2e3e:	42a7           	clr.l -(sp)
    2e40:	42a7           	clr.l -(sp)
    2e42:	42a7           	clr.l -(sp)
    2e44:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2e48:	4878 0140      	pea 140 <FreeDisplay+0x60>
    2e4c:	4eb9 0000 7178 	jsr 7178 <c2p1x1_8_c5_gen_init>
    2e52:	4fef 0018      	lea 24(sp),sp
  c2p1x1_8_c5_gen( 0x100, 0x200);
    2e56:	4878 0200      	pea 200 <Utils_CopyMem+0x22>
    2e5a:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2e5e:	4eb9 0000 71f4 	jsr 71f4 <c2p1x1_8_c5_gen>
    2e64:	508f           	addq.l #8,sp
}
    2e66:	4e75           	rts

00002e68 <TestZoomSpeed>:

int Counter4Frames;

void TestZoomSpeed() {
    2e68:	4fef ffe8      	lea -24(sp),sp
    2e6c:	48e7 3002      	movem.l d2-d3/a6,-(sp)

 	TakeSystem();
    2e70:	4eba d708      	jsr 57a <TakeSystem>(pc)
	WaitVbl();
    2e74:	4eba d6ba      	jsr 530 <WaitVbl>(pc)
  //             fedcba9876543210
  //hw->dmacon = 0x8def;

  hw->dmacon = DMAF_SETCLR | DMAF_AUDIO | DMAF_BLITTER | DMAF_RASTER 
    2e78:	2079 0010 3294 	movea.l 103294 <hw>,a0
    2e7e:	317c 87cf 0096 	move.w #-30769,150(a0)
                                    | DMAF_COPPER | DMAF_MASTER | DMAF_BLITHOG;
   //0b1000011111100000;
  
  //hw->dmacon = 0b1000011111111111;
	hw->intena = (1 << INTB_SETCLR) | (1 << INTB_INTEN) | (1 << INTB_VERTB);
    2e84:	2079 0010 3294 	movea.l 103294 <hw>,a0
    2e8a:	317c c020 009a 	move.w #-16352,154(a0)
  
  Zoom_InitRun(); 
    2e90:	4eba e1ea      	jsr 107c <Zoom_InitRun>(pc)

  int success = 1;
    2e94:	7001           	moveq #1,d0
    2e96:	2f40 0020      	move.l d0,32(sp)
  RunFrame();
    2e9a:	4eba d460      	jsr 2fc <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    2e9e:	3039 0010 32d4 	move.w 1032d4 <Zoom_Counter>,d0
    2ea4:	0c40 0008      	cmpi.w #8,d0
    2ea8:	6304           	bls.s 2eae <TestZoomSpeed+0x46>
    2eaa:	42af 0020      	clr.l 32(sp)
    
  Zoom_Dealloc();
    2eae:	4eba e464      	jsr 1314 <Zoom_Dealloc>(pc)
  FreeSystem();
    2eb2:	4eba d6dc      	jsr 590 <FreeSystem>(pc)

  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    2eb6:	4aaf 0020      	tst.l 32(sp)
    2eba:	6642           	bne.s 2efe <TestZoomSpeed+0x96>
    2ebc:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2ec2:	2c40           	movea.l d0,a6
    2ec4:	4eae ffc4      	jsr -60(a6)
    2ec8:	2f40 001c      	move.l d0,28(sp)
    2ecc:	202f 001c      	move.l 28(sp),d0
    2ed0:	2f40 0018      	move.l d0,24(sp)
    2ed4:	2f7c 0000 8079 	move.l #32889,20(sp)
    2eda:	0014 
    2edc:	701c           	moveq #28,d0
    2ede:	2f40 0010      	move.l d0,16(sp)
    2ee2:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2ee8:	2c40           	movea.l d0,a6
    2eea:	222f 0018      	move.l 24(sp),d1
    2eee:	242f 0014      	move.l 20(sp),d2
    2ef2:	262f 0010      	move.l 16(sp),d3
    2ef6:	4eae ffd0      	jsr -48(a6)
    2efa:	2f40 000c      	move.l d0,12(sp)

  //AddIntServer(INTB_VERTB, vbint);
  //RemIntServer(INTB_VERTB, vbint);
  
}
    2efe:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2f02:	4fef 0018      	lea 24(sp),sp
    2f06:	4e75           	rts

00002f08 <ZoomTestDisplay>:

void ZoomTestDisplay() {
    2f08:	4fef ff38      	lea -200(sp),sp
    2f0c:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Zoom_Init();
    2f10:	4eba e476      	jsr 1388 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    2f14:	4eba e80c      	jsr 1722 <PrepareDisplayZoom>(pc)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2f18:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    2f1e:	4878 0010      	pea 10 <_start+0x10>
    2f22:	4879 0000 a5ec 	pea a5ec <ClsSprites>
    2f28:	42a7           	clr.l -(sp)
    2f2a:	2f00           	move.l d0,-(sp)
    2f2c:	4eba f7fc      	jsr 272a <TestCopperlistBatch>(pc)
    2f30:	4fef 0010      	lea 16(sp),sp
    2f34:	4a80           	tst.l d0
    2f36:	6642           	bne.s 2f7a <ZoomTestDisplay+0x72>
    Write( Output(), 
    2f38:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2f3e:	2c40           	movea.l d0,a6
    2f40:	4eae ffc4      	jsr -60(a6)
    2f44:	2f40 00d0      	move.l d0,208(sp)
    2f48:	202f 00d0      	move.l 208(sp),d0
    2f4c:	2f40 00cc      	move.l d0,204(sp)
    2f50:	2f7c 0000 8098 	move.l #32920,200(sp)
    2f56:	00c8 
    2f58:	7045           	moveq #69,d0
    2f5a:	2f40 00c4      	move.l d0,196(sp)
    2f5e:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2f64:	2c40           	movea.l d0,a6
    2f66:	222f 00cc      	move.l 204(sp),d1
    2f6a:	242f 00c8      	move.l 200(sp),d2
    2f6e:	262f 00c4      	move.l 196(sp),d3
    2f72:	4eae ffd0      	jsr -48(a6)
    2f76:	2f40 00c0      	move.l d0,192(sp)
       "ZoomCopperlist: Sprite section of copper starting on pos 0 messed up\n", 
                                                                            69);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2f7a:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    2f80:	4878 000c      	pea c <_start+0xc>
    2f84:	4879 0000 a62c 	pea a62c <ClScreen>
    2f8a:	4878 0010      	pea 10 <_start+0x10>
    2f8e:	2f00           	move.l d0,-(sp)
    2f90:	4eba f798      	jsr 272a <TestCopperlistBatch>(pc)
    2f94:	4fef 0010      	lea 16(sp),sp
    2f98:	4a80           	tst.l d0
    2f9a:	6642           	bne.s 2fde <ZoomTestDisplay+0xd6>
    Write( Output(), 
    2f9c:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2fa2:	2c40           	movea.l d0,a6
    2fa4:	4eae ffc4      	jsr -60(a6)
    2fa8:	2f40 00bc      	move.l d0,188(sp)
    2fac:	202f 00bc      	move.l 188(sp),d0
    2fb0:	2f40 00b8      	move.l d0,184(sp)
    2fb4:	2f7c 0000 80de 	move.l #32990,180(sp)
    2fba:	00b4 
    2fbc:	7046           	moveq #70,d0
    2fbe:	2f40 00b0      	move.l d0,176(sp)
    2fc2:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    2fc8:	2c40           	movea.l d0,a6
    2fca:	222f 00b8      	move.l 184(sp),d1
    2fce:	242f 00b4      	move.l 180(sp),d2
    2fd2:	262f 00b0      	move.l 176(sp),d3
    2fd6:	4eae ffd0      	jsr -48(a6)
    2fda:	2f40 00ac      	move.l d0,172(sp)
      "ZoomCopperlist: Screen section of copper starting on pos 16 messed up\n",
                                                                            70);
  DrawBuffer = (ULONG *) 0x40000;
    2fde:	23fc 0004 0000 	move.l #262144,103284 <DrawBuffer>
    2fe4:	0010 3284 
  ViewBuffer = (ULONG *) 0x50000;
    2fe8:	23fc 0005 0000 	move.l #327680,103288 <ViewBuffer>
    2fee:	0010 3288 
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    2ff2:	2239 0010 328c 	move.l 10328c <DrawCopper>,d1
    2ff8:	2039 0010 3284 	move.l 103284 <DrawBuffer>,d0
    2ffe:	2f01           	move.l d1,-(sp)
    3000:	2f00           	move.l d0,-(sp)
    3002:	4eba ed78      	jsr 1d7c <Zoom_SetBplPointers>(pc)
    3006:	508f           	addq.l #8,sp
  Zoom_SwapBuffers( 0);
    3008:	42a7           	clr.l -(sp)
    300a:	4eba ee08      	jsr 1e14 <Zoom_SwapBuffers>(pc)
    300e:	588f           	addq.l #4,sp
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    3010:	2039 0010 3284 	move.l 103284 <DrawBuffer>,d0
    3016:	0c80 0005 0000 	cmpi.l #327680,d0
    301c:	660e           	bne.s 302c <ZoomTestDisplay+0x124>
    301e:	2039 0010 3288 	move.l 103288 <ViewBuffer>,d0
    3024:	0c80 0004 0000 	cmpi.l #262144,d0
    302a:	6742           	beq.s 306e <ZoomTestDisplay+0x166>
    Write( Output(), 
    302c:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3032:	2c40           	movea.l d0,a6
    3034:	4eae ffc4      	jsr -60(a6)
    3038:	2f40 00a8      	move.l d0,168(sp)
    303c:	202f 00a8      	move.l 168(sp),d0
    3040:	2f40 00a4      	move.l d0,164(sp)
    3044:	2f7c 0000 8125 	move.l #33061,160(sp)
    304a:	00a0 
    304c:	703b           	moveq #59,d0
    304e:	2f40 009c      	move.l d0,156(sp)
    3052:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3058:	2c40           	movea.l d0,a6
    305a:	222f 00a4      	move.l 164(sp),d1
    305e:	242f 00a0      	move.l 160(sp),d2
    3062:	262f 009c      	move.l 156(sp),d3
    3066:	4eae ffd0      	jsr -48(a6)
    306a:	2f40 0098      	move.l d0,152(sp)
            "ZoomCopperlist: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    306e:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    3074:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    307a:	4878 001c      	pea 1c <_start+0x1c>
    307e:	2f00           	move.l d0,-(sp)
    3080:	4eba f6e6      	jsr 2768 <TestCopperlistPos>(pc)
    3084:	4fef 000c      	lea 12(sp),sp
    3088:	4a80           	tst.l d0
    308a:	6642           	bne.s 30ce <ZoomTestDisplay+0x1c6>
    Write(Output(), 
    308c:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3092:	2c40           	movea.l d0,a6
    3094:	4eae ffc4      	jsr -60(a6)
    3098:	2f40 0094      	move.l d0,148(sp)
    309c:	202f 0094      	move.l 148(sp),d0
    30a0:	2f40 0090      	move.l d0,144(sp)
    30a4:	2f7c 0000 8161 	move.l #33121,140(sp)
    30aa:	008c 
    30ac:	703c           	moveq #60,d0
    30ae:	2f40 0088      	move.l d0,136(sp)
    30b2:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    30b8:	2c40           	movea.l d0,a6
    30ba:	222f 0090      	move.l 144(sp),d1
    30be:	242f 008c      	move.l 140(sp),d2
    30c2:	262f 0088      	move.l 136(sp),d3
    30c6:	4eae ffd0      	jsr -48(a6)
    30ca:	2f40 0084      	move.l d0,132(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    30ce:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    30d4:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    30da:	4878 001d      	pea 1d <_start+0x1d>
    30de:	2f00           	move.l d0,-(sp)
    30e0:	4eba f686      	jsr 2768 <TestCopperlistPos>(pc)
    30e4:	4fef 000c      	lea 12(sp),sp
    30e8:	4a80           	tst.l d0
    30ea:	6642           	bne.s 312e <ZoomTestDisplay+0x226>
    Write(Output(), 
    30ec:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    30f2:	2c40           	movea.l d0,a6
    30f4:	4eae ffc4      	jsr -60(a6)
    30f8:	2f40 0080      	move.l d0,128(sp)
    30fc:	202f 0080      	move.l 128(sp),d0
    3100:	2f40 007c      	move.l d0,124(sp)
    3104:	2f7c 0000 819e 	move.l #33182,120(sp)
    310a:	0078 
    310c:	703c           	moveq #60,d0
    310e:	2f40 0074      	move.l d0,116(sp)
    3112:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3118:	2c40           	movea.l d0,a6
    311a:	222f 007c      	move.l 124(sp),d1
    311e:	242f 0078      	move.l 120(sp),d2
    3122:	262f 0074      	move.l 116(sp),d3
    3126:	4eae ffd0      	jsr -48(a6)
    312a:	2f40 0070      	move.l d0,112(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1pl should be 00f4\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    312e:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    3134:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    313a:	4878 001e      	pea 1e <_start+0x1e>
    313e:	2f00           	move.l d0,-(sp)
    3140:	4eba f626      	jsr 2768 <TestCopperlistPos>(pc)
    3144:	4fef 000c      	lea 12(sp),sp
    3148:	4a80           	tst.l d0
    314a:	6642           	bne.s 318e <ZoomTestDisplay+0x286>
    Write(Output(), 
    314c:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3152:	2c40           	movea.l d0,a6
    3154:	4eae ffc4      	jsr -60(a6)
    3158:	2f40 006c      	move.l d0,108(sp)
    315c:	202f 006c      	move.l 108(sp),d0
    3160:	2f40 0068      	move.l d0,104(sp)
    3164:	2f7c 0000 81db 	move.l #33243,100(sp)
    316a:	0064 
    316c:	703c           	moveq #60,d0
    316e:	2f40 0060      	move.l d0,96(sp)
    3172:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3178:	2c40           	movea.l d0,a6
    317a:	222f 0068      	move.l 104(sp),d1
    317e:	242f 0064      	move.l 100(sp),d2
    3182:	262f 0060      	move.l 96(sp),d3
    3186:	4eae ffd0      	jsr -48(a6)
    318a:	2f40 005c      	move.l d0,92(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    318e:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    3194:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    319a:	4878 001f      	pea 1f <_start+0x1f>
    319e:	2f00           	move.l d0,-(sp)
    31a0:	4eba f5c6      	jsr 2768 <TestCopperlistPos>(pc)
    31a4:	4fef 000c      	lea 12(sp),sp
    31a8:	4a80           	tst.l d0
    31aa:	6642           	bne.s 31ee <ZoomTestDisplay+0x2e6>
    Write(Output(), 
    31ac:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    31b2:	2c40           	movea.l d0,a6
    31b4:	4eae ffc4      	jsr -60(a6)
    31b8:	2f40 0058      	move.l d0,88(sp)
    31bc:	202f 0058      	move.l 88(sp),d0
    31c0:	2f40 0054      	move.l d0,84(sp)
    31c4:	2f7c 0000 8218 	move.l #33304,80(sp)
    31ca:	0050 
    31cc:	703c           	moveq #60,d0
    31ce:	2f40 004c      	move.l d0,76(sp)
    31d2:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    31d8:	2c40           	movea.l d0,a6
    31da:	222f 0054      	move.l 84(sp),d1
    31de:	242f 0050      	move.l 80(sp),d2
    31e2:	262f 004c      	move.l 76(sp),d3
    31e6:	4eae ffd0      	jsr -48(a6)
    31ea:	2f40 0048      	move.l d0,72(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2pl should be 0034\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    31ee:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    31f4:	4878 0020      	pea 20 <_start+0x20>
    31f8:	4879 0000 a56c 	pea a56c <ClColor>
    31fe:	4878 0026      	pea 26 <_start+0x26>
    3202:	2f00           	move.l d0,-(sp)
    3204:	4eba f524      	jsr 272a <TestCopperlistBatch>(pc)
    3208:	4fef 0010      	lea 16(sp),sp
    320c:	4a80           	tst.l d0
    320e:	6642           	bne.s 3252 <ZoomTestDisplay+0x34a>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    3210:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3216:	2c40           	movea.l d0,a6
    3218:	4eae ffc4      	jsr -60(a6)
    321c:	2f40 0044      	move.l d0,68(sp)
    3220:	202f 0044      	move.l 68(sp),d0
    3224:	2f40 0040      	move.l d0,64(sp)
    3228:	2f7c 0000 8255 	move.l #33365,60(sp)
    322e:	003c 
    3230:	7025           	moveq #37,d0
    3232:	2f40 0038      	move.l d0,56(sp)
    3236:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    323c:	2c40           	movea.l d0,a6
    323e:	222f 0040      	move.l 64(sp),d1
    3242:	242f 003c      	move.l 60(sp),d2
    3246:	262f 0038      	move.l 56(sp),d3
    324a:	4eae ffd0      	jsr -48(a6)
    324e:	2f40 0034      	move.l d0,52(sp)

  /*if(  TestCopperlistBatch(  Copperlist1, 71, Cl102ZoomRepeat, 21) == 0)
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36); */
  
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    3252:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    3258:	2f00           	move.l d0,-(sp)
    325a:	4878 000f      	pea f <_start+0xf>
    325e:	4eba d1ac      	jsr 40c <Zoom_Shrink102>(pc)
    3262:	508f           	addq.l #8,sp
  if( TestCopperListZoom102( Copperlist1, 73, Cl102ZoomTest) == 0)
    3264:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    326a:	4879 0000 b804 	pea b804 <Cl102ZoomTest>
    3270:	4878 0049      	pea 49 <_start+0x49>
    3274:	2f00           	move.l d0,-(sp)
    3276:	4eba 00c4      	jsr 333c <TestCopperListZoom102>(pc)
    327a:	4fef 000c      	lea 12(sp),sp
    327e:	4a80           	tst.l d0
    3280:	6642           	bne.s 32c4 <ZoomTestDisplay+0x3bc>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    3282:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3288:	2c40           	movea.l d0,a6
    328a:	4eae ffc4      	jsr -60(a6)
    328e:	2f40 0030      	move.l d0,48(sp)
    3292:	202f 0030      	move.l 48(sp),d0
    3296:	2f40 002c      	move.l d0,44(sp)
    329a:	2f7c 0000 827b 	move.l #33403,40(sp)
    32a0:	0028 
    32a2:	7025           	moveq #37,d0
    32a4:	2f40 0024      	move.l d0,36(sp)
    32a8:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    32ae:	2c40           	movea.l d0,a6
    32b0:	222f 002c      	move.l 44(sp),d1
    32b4:	242f 0028      	move.l 40(sp),d2
    32b8:	262f 0024      	move.l 36(sp),d3
    32bc:	4eae ffd0      	jsr -48(a6)
    32c0:	2f40 0020      	move.l d0,32(sp)

  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    32c4:	2039 0010 327c 	move.l 10327c <Copperlist1>,d0
    32ca:	4878 fffe      	pea fffffffe <_end+0xffefcd12>
    32ce:	4878 00bb      	pea bb <WaitBlt+0x7>
    32d2:	2f00           	move.l d0,-(sp)
    32d4:	4eba f492      	jsr 2768 <TestCopperlistPos>(pc)
    32d8:	4fef 000c      	lea 12(sp),sp
    32dc:	4a80           	tst.l d0
    32de:	6642           	bne.s 3322 <ZoomTestDisplay+0x41a>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    32e0:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    32e6:	2c40           	movea.l d0,a6
    32e8:	4eae ffc4      	jsr -60(a6)
    32ec:	2f40 001c      	move.l d0,28(sp)
    32f0:	202f 001c      	move.l 28(sp),d0
    32f4:	2f40 0018      	move.l d0,24(sp)
    32f8:	2f7c 0000 82a0 	move.l #33440,20(sp)
    32fe:	0014 
    3300:	7032           	moveq #50,d0
    3302:	2f40 0010      	move.l d0,16(sp)
    3306:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    330c:	2c40           	movea.l d0,a6
    330e:	222f 0018      	move.l 24(sp),d1
    3312:	242f 0014      	move.l 20(sp),d2
    3316:	262f 0010      	move.l 16(sp),d3
    331a:	4eae ffd0      	jsr -48(a6)
    331e:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    3322:	2f3c 0000 df20 	move.l #57120,-(sp)
    3328:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    332c:	4eba cdb2      	jsr e0 <FreeDisplay>(pc)
    3330:	508f           	addq.l #8,sp

}
    3332:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3336:	4fef 00c8      	lea 200(sp),sp
    333a:	4e75           	rts

0000333c <TestCopperListZoom102>:

int TestCopperListZoom102( ULONG *cl2test, UWORD position, 
                                                           ULONG *template4cl) {
    333c:	598f           	subq.l #4,sp
    333e:	202f 000c      	move.l 12(sp),d0
    3342:	3000           	move.w d0,d0
    3344:	3f40 0002      	move.w d0,2(sp)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    3348:	7000           	moveq #0,d0
    334a:	302f 0002      	move.w 2(sp),d0
    334e:	4878 001c      	pea 1c <_start+0x1c>
    3352:	2f2f 0014      	move.l 20(sp),-(sp)
    3356:	2f00           	move.l d0,-(sp)
    3358:	2f2f 0014      	move.l 20(sp),-(sp)
    335c:	4eba f3cc      	jsr 272a <TestCopperlistBatch>(pc)
    3360:	4fef 0010      	lea 16(sp),sp
    3364:	4a80           	tst.l d0
    3366:	6604           	bne.s 336c <TestCopperListZoom102+0x30>
    return 0;
    3368:	7000           	moveq #0,d0
    336a:	6062           	bra.s 33ce <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    336c:	7078           	moveq #120,d0
    336e:	d0af 0010      	add.l 16(sp),d0
    3372:	7200           	moveq #0,d1
    3374:	322f 0002      	move.w 2(sp),d1
    3378:	307c 001e      	movea.w #30,a0
    337c:	d1c1           	adda.l d1,a0
    337e:	4878 0036      	pea 36 <_start+0x36>
    3382:	2f00           	move.l d0,-(sp)
    3384:	2f08           	move.l a0,-(sp)
    3386:	2f2f 0014      	move.l 20(sp),-(sp)
    338a:	4eba f39e      	jsr 272a <TestCopperlistBatch>(pc)
    338e:	4fef 0010      	lea 16(sp),sp
    3392:	4a80           	tst.l d0
    3394:	6604           	bne.s 339a <TestCopperListZoom102+0x5e>
    return 0;
    3396:	7000           	moveq #0,d0
    3398:	6034           	bra.s 33ce <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    339a:	202f 0010      	move.l 16(sp),d0
    339e:	0680 0000 0158 	addi.l #344,d0
    33a4:	7200           	moveq #0,d1
    33a6:	322f 0002      	move.w 2(sp),d1
    33aa:	307c 0056      	movea.w #86,a0
    33ae:	d1c1           	adda.l d1,a0
    33b0:	4878 001c      	pea 1c <_start+0x1c>
    33b4:	2f00           	move.l d0,-(sp)
    33b6:	2f08           	move.l a0,-(sp)
    33b8:	2f2f 0014      	move.l 20(sp),-(sp)
    33bc:	4eba f36c      	jsr 272a <TestCopperlistBatch>(pc)
    33c0:	4fef 0010      	lea 16(sp),sp
    33c4:	4a80           	tst.l d0
    33c6:	6604           	bne.s 33cc <TestCopperListZoom102+0x90>
    return 0;
    33c8:	7000           	moveq #0,d0
    33ca:	6002           	bra.s 33ce <TestCopperListZoom102+0x92>
 
  return 1;
    33cc:	7001           	moveq #1,d0
}
    33ce:	588f           	addq.l #4,sp
    33d0:	4e75           	rts

000033d2 <TestBlitleftOfZoom>:

void TestBlitleftOfZoom() {
    33d2:	4fef ff94      	lea -108(sp),sp
    33d6:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Zoom_Init();
    33da:	4eba dfac      	jsr 1388 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    33de:	4eba e342      	jsr 1722 <PrepareDisplayZoom>(pc)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    33e2:	2f7c 0000 c800 	move.l #51200,116(sp)
    33e8:	0074 
    33ea:	7002           	moveq #2,d0
    33ec:	2f40 0070      	move.l d0,112(sp)
    33f0:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    33f6:	2c40           	movea.l d0,a6
    33f8:	202f 0074      	move.l 116(sp),d0
    33fc:	222f 0070      	move.l 112(sp),d1
    3400:	4eae ff3a      	jsr -198(a6)
    3404:	2f40 006c      	move.l d0,108(sp)
    3408:	202f 006c      	move.l 108(sp),d0
    340c:	23c0 0010 32c6 	move.l d0,1032c6 <Zoom_Source>
  if( Zoom_Source == 0) {
    3412:	2039 0010 32c6 	move.l 1032c6 <Zoom_Source>,d0
    3418:	6646           	bne.s 3460 <TestBlitleftOfZoom+0x8e>
    Write(  Output(), 
    341a:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3420:	2c40           	movea.l d0,a6
    3422:	4eae ffc4      	jsr -60(a6)
    3426:	2f40 001c      	move.l d0,28(sp)
    342a:	202f 001c      	move.l 28(sp),d0
    342e:	2f40 0018      	move.l d0,24(sp)
    3432:	2f7c 0000 82d3 	move.l #33491,20(sp)
    3438:	0014 
    343a:	7236           	moveq #54,d1
    343c:	2f41 0010      	move.l d1,16(sp)
    3440:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3446:	2c40           	movea.l d0,a6
    3448:	222f 0018      	move.l 24(sp),d1
    344c:	242f 0014      	move.l 20(sp),d2
    3450:	262f 0010      	move.l 16(sp),d3
    3454:	4eae ffd0      	jsr -48(a6)
    3458:	2f40 000c      	move.l d0,12(sp)
    345c:	6000 01fe      	bra.w 365c <TestBlitleftOfZoom+0x28a>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  
  UWORD *tstsource = Zoom_Source;
    3460:	2f79 0010 32c6 	move.l 1032c6 <Zoom_Source>,104(sp)
    3466:	0068 
  *tstsource++ = 0x0000;
    3468:	202f 0068      	move.l 104(sp),d0
    346c:	2200           	move.l d0,d1
    346e:	5481           	addq.l #2,d1
    3470:	2f41 0068      	move.l d1,104(sp)
    3474:	2040           	movea.l d0,a0
    3476:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    3478:	206f 0068      	movea.l 104(sp),a0
    347c:	30bc 0080      	move.w #128,(a0)
  tstsource += ZMLINESIZE/2-1;
    3480:	7028           	moveq #40,d0
    3482:	d1af 0068      	add.l d0,104(sp)
  *tstsource = 0x1000;
    3486:	206f 0068      	movea.l 104(sp),a0
    348a:	30bc 1000      	move.w #4096,(a0)
  tstsource++;
    348e:	54af 0068      	addq.l #2,104(sp)
  *tstsource = 0x8e88;
    3492:	206f 0068      	movea.l 104(sp),a0
    3496:	30bc 8e88      	move.w #-29048,(a0)
  tstsource += ZMLINESIZE/2-1;
    349a:	7228           	moveq #40,d1
    349c:	d3af 0068      	add.l d1,104(sp)

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
    34a0:	2039 0010 32c6 	move.l 1032c6 <Zoom_Source>,d0
    34a6:	2200           	move.l d0,d1
    34a8:	0681 0000 14d6 	addi.l #5334,d1
    34ae:	2f41 0068      	move.l d1,104(sp)
  *tstsource++ = 0x0000;
    34b2:	202f 0068      	move.l 104(sp),d0
    34b6:	2200           	move.l d0,d1
    34b8:	5481           	addq.l #2,d1
    34ba:	2f41 0068      	move.l d1,104(sp)
    34be:	2040           	movea.l d0,a0
    34c0:	4250           	clr.w (a0)
  *tstsource = 0x00ff;
    34c2:	206f 0068      	movea.l 104(sp),a0
    34c6:	30bc 00ff      	move.w #255,(a0)
  WaitBlit();
    34ca:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    34d0:	2c40           	movea.l d0,a6
    34d2:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    34d6:	4eba e3c2      	jsr 189a <Init_Blit>(pc)
  Init_ZoomBlit( 7, 16, 0);
    34da:	42a7           	clr.l -(sp)
    34dc:	4878 0010      	pea 10 <_start+0x10>
    34e0:	4878 0007      	pea 7 <_start+0x7>
    34e4:	4eba e430      	jsr 1916 <Init_ZoomBlit>(pc)
    34e8:	4fef 000c      	lea 12(sp),sp
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    34ec:	2239 0010 3284 	move.l 103284 <DrawBuffer>,d1
    34f2:	2039 0010 32c6 	move.l 1032c6 <Zoom_Source>,d0
    34f8:	4878 0080      	pea 80 <_start+0x80>
    34fc:	2f01           	move.l d1,-(sp)
    34fe:	2f00           	move.l d0,-(sp)
    3500:	4eba da98      	jsr f9a <Zoom_ZoomBlit>(pc)
    3504:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    3508:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    350e:	2c40           	movea.l d0,a6
    3510:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    3514:	2039 0010 3284 	move.l 103284 <DrawBuffer>,d0
    351a:	2200           	move.l d0,d1
    351c:	5481           	addq.l #2,d1
    351e:	2f41 0064      	move.l d1,100(sp)
  if( *destination != 0x0180) {
    3522:	206f 0064      	movea.l 100(sp),a0
    3526:	3010           	move.w (a0),d0
    3528:	0c40 0180      	cmpi.w #384,d0
    352c:	6742           	beq.s 3570 <TestBlitleftOfZoom+0x19e>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    352e:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3534:	2c40           	movea.l d0,a6
    3536:	4eae ffc4      	jsr -60(a6)
    353a:	2f40 0060      	move.l d0,96(sp)
    353e:	202f 0060      	move.l 96(sp),d0
    3542:	2f40 005c      	move.l d0,92(sp)
    3546:	2f7c 0000 830b 	move.l #33547,88(sp)
    354c:	0058 
    354e:	701c           	moveq #28,d0
    3550:	2f40 0054      	move.l d0,84(sp)
    3554:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    355a:	2c40           	movea.l d0,a6
    355c:	222f 005c      	move.l 92(sp),d1
    3560:	242f 0058      	move.l 88(sp),d2
    3564:	262f 0054      	move.l 84(sp),d3
    3568:	4eae ffd0      	jsr -48(a6)
    356c:	2f40 0050      	move.l d0,80(sp)
  }
  destination += ZMLINESIZE/2;
    3570:	722a           	moveq #42,d1
    3572:	d3af 0064      	add.l d1,100(sp)
  if( *destination != 0x1d88)
    3576:	206f 0064      	movea.l 100(sp),a0
    357a:	3010           	move.w (a0),d0
    357c:	0c40 1d88      	cmpi.w #7560,d0
    3580:	6742           	beq.s 35c4 <TestBlitleftOfZoom+0x1f2>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    3582:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3588:	2c40           	movea.l d0,a6
    358a:	4eae ffc4      	jsr -60(a6)
    358e:	2f40 004c      	move.l d0,76(sp)
    3592:	202f 004c      	move.l 76(sp),d0
    3596:	2f40 0048      	move.l d0,72(sp)
    359a:	2f7c 0000 8328 	move.l #33576,68(sp)
    35a0:	0044 
    35a2:	701c           	moveq #28,d0
    35a4:	2f40 0040      	move.l d0,64(sp)
    35a8:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    35ae:	2c40           	movea.l d0,a6
    35b0:	222f 0048      	move.l 72(sp),d1
    35b4:	242f 0044      	move.l 68(sp),d2
    35b8:	262f 0040      	move.l 64(sp),d3
    35bc:	4eae ffd0      	jsr -48(a6)
    35c0:	2f40 003c      	move.l d0,60(sp)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
    35c4:	2039 0010 3284 	move.l 103284 <DrawBuffer>,d0
    35ca:	2200           	move.l d0,d1
    35cc:	0681 0000 14d6 	addi.l #5334,d1
    35d2:	2f41 0064      	move.l d1,100(sp)
  destination++;
    35d6:	54af 0064      	addq.l #2,100(sp)
  if( *destination != 0x01ff) {
    35da:	206f 0064      	movea.l 100(sp),a0
    35de:	3010           	move.w (a0),d0
    35e0:	0c40 01ff      	cmpi.w #511,d0
    35e4:	6742           	beq.s 3628 <TestBlitleftOfZoom+0x256>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    35e6:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    35ec:	2c40           	movea.l d0,a6
    35ee:	4eae ffc4      	jsr -60(a6)
    35f2:	2f40 0038      	move.l d0,56(sp)
    35f6:	202f 0038      	move.l 56(sp),d0
    35fa:	2f40 0034      	move.l d0,52(sp)
    35fe:	2f7c 0000 8345 	move.l #33605,48(sp)
    3604:	0030 
    3606:	701a           	moveq #26,d0
    3608:	2f40 002c      	move.l d0,44(sp)
    360c:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3612:	2c40           	movea.l d0,a6
    3614:	222f 0034      	move.l 52(sp),d1
    3618:	242f 0030      	move.l 48(sp),d2
    361c:	262f 002c      	move.l 44(sp),d3
    3620:	4eae ffd0      	jsr -48(a6)
    3624:	2f40 0028      	move.l d0,40(sp)
  }
  FreeMem( Zoom_Source, 40*256*5);
    3628:	2f79 0010 32c6 	move.l 1032c6 <Zoom_Source>,36(sp)
    362e:	0024 
    3630:	2f7c 0000 c800 	move.l #51200,32(sp)
    3636:	0020 
    3638:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    363e:	2c40           	movea.l d0,a6
    3640:	226f 0024      	movea.l 36(sp),a1
    3644:	202f 0020      	move.l 32(sp),d0
    3648:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    364c:	2f3c 0000 df20 	move.l #57120,-(sp)
    3652:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    3656:	4eba ca88      	jsr e0 <FreeDisplay>(pc)
    365a:	508f           	addq.l #8,sp
}
    365c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3660:	4fef 006c      	lea 108(sp),sp
    3664:	4e75           	rts

00003666 <TestCopyWord>:

void TestCopyWord() {
    3666:	4fef ff74      	lea -140(sp),sp
    366a:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    366e:	2f7c 0000 04ec 	move.l #1260,136(sp)
    3674:	0088 
    3676:	7002           	moveq #2,d0
    3678:	2f40 0084      	move.l d0,132(sp)
    367c:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    3682:	2c40           	movea.l d0,a6
    3684:	202f 0088      	move.l 136(sp),d0
    3688:	222f 0084      	move.l 132(sp),d1
    368c:	4eae ff3a      	jsr -198(a6)
    3690:	2f40 0080      	move.l d0,128(sp)
    3694:	202f 0080      	move.l 128(sp),d0
    3698:	2f40 007c      	move.l d0,124(sp)
  if( source == 0) {
    369c:	6646           	bne.s 36e4 <TestCopyWord+0x7e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    369e:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    36a4:	2c40           	movea.l d0,a6
    36a6:	4eae ffc4      	jsr -60(a6)
    36aa:	2f40 001c      	move.l d0,28(sp)
    36ae:	202f 001c      	move.l 28(sp),d0
    36b2:	2f40 0018      	move.l d0,24(sp)
    36b6:	2f7c 0000 8360 	move.l #33632,20(sp)
    36bc:	0014 
    36be:	7235           	moveq #53,d1
    36c0:	2f41 0010      	move.l d1,16(sp)
    36c4:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    36ca:	2c40           	movea.l d0,a6
    36cc:	222f 0018      	move.l 24(sp),d1
    36d0:	242f 0014      	move.l 20(sp),d2
    36d4:	262f 0010      	move.l 16(sp),d3
    36d8:	4eae ffd0      	jsr -48(a6)
    36dc:	2f40 000c      	move.l d0,12(sp)
    36e0:	6000 026c      	bra.w 394e <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    36e4:	2f7c 0000 04ec 	move.l #1260,120(sp)
    36ea:	0078 
    36ec:	7002           	moveq #2,d0
    36ee:	2f40 0074      	move.l d0,116(sp)
    36f2:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    36f8:	2c40           	movea.l d0,a6
    36fa:	202f 0078      	move.l 120(sp),d0
    36fe:	222f 0074      	move.l 116(sp),d1
    3702:	4eae ff3a      	jsr -198(a6)
    3706:	2f40 0070      	move.l d0,112(sp)
    370a:	202f 0070      	move.l 112(sp),d0
    370e:	2f40 006c      	move.l d0,108(sp)
  if( destination == 0) {
    3712:	6646           	bne.s 375a <TestCopyWord+0xf4>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3714:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    371a:	2c40           	movea.l d0,a6
    371c:	4eae ffc4      	jsr -60(a6)
    3720:	2f40 0030      	move.l d0,48(sp)
    3724:	202f 0030      	move.l 48(sp),d0
    3728:	2f40 002c      	move.l d0,44(sp)
    372c:	2f7c 0000 8360 	move.l #33632,40(sp)
    3732:	0028 
    3734:	7235           	moveq #53,d1
    3736:	2f41 0024      	move.l d1,36(sp)
    373a:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3740:	2c40           	movea.l d0,a6
    3742:	222f 002c      	move.l 44(sp),d1
    3746:	242f 0028      	move.l 40(sp),d2
    374a:	262f 0024      	move.l 36(sp),d3
    374e:	4eae ffd0      	jsr -48(a6)
    3752:	2f40 0020      	move.l d0,32(sp)
    3756:	6000 01f6      	bra.w 394e <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
    375a:	2f6f 007c 0094 	move.l 124(sp),148(sp)
  for( int i=0; i<8;i++) {
    3760:	42af 0090      	clr.l 144(sp)
    3764:	6000 0086      	bra.w 37ec <TestCopyWord+0x186>
    *tmp++ = 0;
    3768:	202f 0094      	move.l 148(sp),d0
    376c:	2200           	move.l d0,d1
    376e:	5481           	addq.l #2,d1
    3770:	2f41 0094      	move.l d1,148(sp)
    3774:	2040           	movea.l d0,a0
    3776:	4250           	clr.w (a0)
    *tmp++ = 0xaaaa;
    3778:	202f 0094      	move.l 148(sp),d0
    377c:	2200           	move.l d0,d1
    377e:	5481           	addq.l #2,d1
    3780:	2f41 0094      	move.l d1,148(sp)
    3784:	2040           	movea.l d0,a0
    3786:	30bc aaaa      	move.w #-21846,(a0)
    *tmp++ = 0xaaaa;
    378a:	202f 0094      	move.l 148(sp),d0
    378e:	2200           	move.l d0,d1
    3790:	5481           	addq.l #2,d1
    3792:	2f41 0094      	move.l d1,148(sp)
    3796:	2040           	movea.l d0,a0
    3798:	30bc aaaa      	move.w #-21846,(a0)
    *tmp = 0;
    379c:	206f 0094      	movea.l 148(sp),a0
    37a0:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    37a2:	7024           	moveq #36,d0
    37a4:	d1af 0094      	add.l d0,148(sp)
    *tmp++ = 0;
    37a8:	202f 0094      	move.l 148(sp),d0
    37ac:	2200           	move.l d0,d1
    37ae:	5481           	addq.l #2,d1
    37b0:	2f41 0094      	move.l d1,148(sp)
    37b4:	2040           	movea.l d0,a0
    37b6:	4250           	clr.w (a0)
    *tmp++ = 0x5555;
    37b8:	202f 0094      	move.l 148(sp),d0
    37bc:	2200           	move.l d0,d1
    37be:	5481           	addq.l #2,d1
    37c0:	2f41 0094      	move.l d1,148(sp)
    37c4:	2040           	movea.l d0,a0
    37c6:	30bc 5555      	move.w #21845,(a0)
    *tmp++ = 0x5555;
    37ca:	202f 0094      	move.l 148(sp),d0
    37ce:	2200           	move.l d0,d1
    37d0:	5481           	addq.l #2,d1
    37d2:	2f41 0094      	move.l d1,148(sp)
    37d6:	2040           	movea.l d0,a0
    37d8:	30bc 5555      	move.w #21845,(a0)
    *tmp = 0;
    37dc:	206f 0094      	movea.l 148(sp),a0
    37e0:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    37e2:	7024           	moveq #36,d0
    37e4:	d1af 0094      	add.l d0,148(sp)
  for( int i=0; i<8;i++) {
    37e8:	52af 0090      	addq.l #1,144(sp)
    37ec:	7207           	moveq #7,d1
    37ee:	b2af 0090      	cmp.l 144(sp),d1
    37f2:	6c00 ff74      	bge.w 3768 <TestCopyWord+0x102>
  }
  tmp = destination;
    37f6:	2f6f 006c 0094 	move.l 108(sp),148(sp)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    37fc:	42af 008c      	clr.l 140(sp)
    3800:	6014           	bra.s 3816 <TestCopyWord+0x1b0>
    *tmp++ = 0;
    3802:	202f 0094      	move.l 148(sp),d0
    3806:	2200           	move.l d0,d1
    3808:	5481           	addq.l #2,d1
    380a:	2f41 0094      	move.l d1,148(sp)
    380e:	2040           	movea.l d0,a0
    3810:	4250           	clr.w (a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3812:	52af 008c      	addq.l #1,140(sp)
    3816:	0caf 0000 0275 	cmpi.l #629,140(sp)
    381c:	008c 
    381e:	6fe2           	ble.s 3802 <TestCopyWord+0x19c>
  }

  WaitBlit();
    3820:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    3826:	2c40           	movea.l d0,a6
    3828:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
    382c:	4eba db5a      	jsr 1388 <Zoom_Init>(pc)
  Init_Copy( 3);
    3830:	4878 0003      	pea 3 <_start+0x3>
    3834:	4eba e184      	jsr 19ba <Init_Copy>(pc)
    3838:	588f           	addq.l #4,sp
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
    383a:	202f 007c      	move.l 124(sp),d0
    383e:	5480           	addq.l #2,d0
    3840:	4878 0010      	pea 10 <_start+0x10>
    3844:	2f2f 0070      	move.l 112(sp),-(sp)
    3848:	2f00           	move.l d0,-(sp)
    384a:	4eba d710      	jsr f5c <Zoom_CopyWord>(pc)
    384e:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    3852:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    3858:	2c40           	movea.l d0,a6
    385a:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
    385e:	202f 006c      	move.l 108(sp),d0
    3862:	5480           	addq.l #2,d0
    3864:	2f40 0094      	move.l d0,148(sp)
  if( *tmp != 0x5555) 
    3868:	206f 0094      	movea.l 148(sp),a0
    386c:	3010           	move.w (a0),d0
    386e:	0c40 5555      	cmpi.w #21845,d0
    3872:	6742           	beq.s 38b6 <TestCopyWord+0x250>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    3874:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    387a:	2c40           	movea.l d0,a6
    387c:	4eae ffc4      	jsr -60(a6)
    3880:	2f40 0068      	move.l d0,104(sp)
    3884:	202f 0068      	move.l 104(sp),d0
    3888:	2f40 0064      	move.l d0,100(sp)
    388c:	2f7c 0000 8396 	move.l #33686,96(sp)
    3892:	0060 
    3894:	721f           	moveq #31,d1
    3896:	2f41 005c      	move.l d1,92(sp)
    389a:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    38a0:	2c40           	movea.l d0,a6
    38a2:	222f 0064      	move.l 100(sp),d1
    38a6:	242f 0060      	move.l 96(sp),d2
    38aa:	262f 005c      	move.l 92(sp),d3
    38ae:	4eae ffd0      	jsr -48(a6)
    38b2:	2f40 0058      	move.l d0,88(sp)
  tmp += ZMLINESIZE/2;
    38b6:	702a           	moveq #42,d0
    38b8:	d1af 0094      	add.l d0,148(sp)
  if( *tmp != 0xaaaa)
    38bc:	206f 0094      	movea.l 148(sp),a0
    38c0:	3010           	move.w (a0),d0
    38c2:	0c40 aaaa      	cmpi.w #-21846,d0
    38c6:	6742           	beq.s 390a <TestCopyWord+0x2a4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    38c8:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    38ce:	2c40           	movea.l d0,a6
    38d0:	4eae ffc4      	jsr -60(a6)
    38d4:	2f40 0054      	move.l d0,84(sp)
    38d8:	202f 0054      	move.l 84(sp),d0
    38dc:	2f40 0050      	move.l d0,80(sp)
    38e0:	2f7c 0000 83b6 	move.l #33718,76(sp)
    38e6:	004c 
    38e8:	7220           	moveq #32,d1
    38ea:	2f41 0048      	move.l d1,72(sp)
    38ee:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    38f4:	2c40           	movea.l d0,a6
    38f6:	222f 0050      	move.l 80(sp),d1
    38fa:	242f 004c      	move.l 76(sp),d2
    38fe:	262f 0048      	move.l 72(sp),d3
    3902:	4eae ffd0      	jsr -48(a6)
    3906:	2f40 0044      	move.l d0,68(sp)
  
  FreeMem( source,ZMLINESIZE*30);
    390a:	2f6f 007c 0040 	move.l 124(sp),64(sp)
    3910:	2f7c 0000 04ec 	move.l #1260,60(sp)
    3916:	003c 
    3918:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    391e:	2c40           	movea.l d0,a6
    3920:	226f 0040      	movea.l 64(sp),a1
    3924:	202f 003c      	move.l 60(sp),d0
    3928:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    392c:	2f6f 006c 0038 	move.l 108(sp),56(sp)
    3932:	2f7c 0000 04ec 	move.l #1260,52(sp)
    3938:	0034 
    393a:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    3940:	2c40           	movea.l d0,a6
    3942:	226f 0038      	movea.l 56(sp),a1
    3946:	202f 0034      	move.l 52(sp),d0
    394a:	4eae ff2e      	jsr -210(a6)
}
    394e:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3952:	4fef 008c      	lea 140(sp),sp
    3956:	4e75           	rts

00003958 <TestZoom4PictureOn5Planes>:
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */


void TestZoom4PictureOn5Planes() {
    3958:	4fef ff74      	lea -140(sp),sp
    395c:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3960:	2f7c 0000 f460 	move.l #62560,102(sp)
    3966:	0066 
    3968:	7002           	moveq #2,d0
    396a:	2f40 0062      	move.l d0,98(sp)
    396e:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    3974:	2c40           	movea.l d0,a6
    3976:	202f 0066      	move.l 102(sp),d0
    397a:	222f 0062      	move.l 98(sp),d1
    397e:	4eae ff3a      	jsr -198(a6)
    3982:	2f40 005e      	move.l d0,94(sp)
    3986:	202f 005e      	move.l 94(sp),d0
    398a:	2f40 005a      	move.l d0,90(sp)
  if( source == 0) {
    398e:	6646           	bne.s 39d6 <TestZoom4PictureOn5Planes+0x7e>
    Write(  Output(), 
    3990:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3996:	2c40           	movea.l d0,a6
    3998:	4eae ffc4      	jsr -60(a6)
    399c:	2f40 001e      	move.l d0,30(sp)
    39a0:	202f 001e      	move.l 30(sp),d0
    39a4:	2f40 001a      	move.l d0,26(sp)
    39a8:	2f7c 0000 83d7 	move.l #33751,22(sp)
    39ae:	0016 
    39b0:	7239           	moveq #57,d1
    39b2:	2f41 0012      	move.l d1,18(sp)
    39b6:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    39bc:	2c40           	movea.l d0,a6
    39be:	222f 001a      	move.l 26(sp),d1
    39c2:	242f 0016      	move.l 22(sp),d2
    39c6:	262f 0012      	move.l 18(sp),d3
    39ca:	4eae ffd0      	jsr -48(a6)
    39ce:	2f40 000e      	move.l d0,14(sp)
    39d2:	6000 0266      	bra.w 3c3a <TestZoom4PictureOn5Planes+0x2e2>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    39d6:	2f7c 0000 f460 	move.l #62560,86(sp)
    39dc:	0056 
    39de:	7002           	moveq #2,d0
    39e0:	2f40 0052      	move.l d0,82(sp)
    39e4:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    39ea:	2c40           	movea.l d0,a6
    39ec:	202f 0056      	move.l 86(sp),d0
    39f0:	222f 0052      	move.l 82(sp),d1
    39f4:	4eae ff3a      	jsr -198(a6)
    39f8:	2f40 004e      	move.l d0,78(sp)
    39fc:	202f 004e      	move.l 78(sp),d0
    3a00:	2f40 004a      	move.l d0,74(sp)
  if( destination == 0) {
    3a04:	6646           	bne.s 3a4c <TestZoom4PictureOn5Planes+0xf4>
    Write(  Output(), 
    3a06:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3a0c:	2c40           	movea.l d0,a6
    3a0e:	4eae ffc4      	jsr -60(a6)
    3a12:	2f40 0032      	move.l d0,50(sp)
    3a16:	202f 0032      	move.l 50(sp),d0
    3a1a:	2f40 002e      	move.l d0,46(sp)
    3a1e:	2f7c 0000 8411 	move.l #33809,42(sp)
    3a24:	002a 
    3a26:	723d           	moveq #61,d1
    3a28:	2f41 0026      	move.l d1,38(sp)
    3a2c:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3a32:	2c40           	movea.l d0,a6
    3a34:	222f 002e      	move.l 46(sp),d1
    3a38:	242f 002a      	move.l 42(sp),d2
    3a3c:	262f 0026      	move.l 38(sp),d3
    3a40:	4eae ffd0      	jsr -48(a6)
    3a44:	2f40 0022      	move.l d0,34(sp)
    3a48:	6000 01f0      	bra.w 3c3a <TestZoom4PictureOn5Planes+0x2e2>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3a4c:	2f6f 005a 0094 	move.l 90(sp),148(sp)
  for(int i=0;i<128+8;i++) {
    3a52:	42af 0090      	clr.l 144(sp)
    3a56:	6050           	bra.s 3aa8 <TestZoom4PictureOn5Planes+0x150>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3a58:	42af 008c      	clr.l 140(sp)
    3a5c:	6018           	bra.s 3a76 <TestZoom4PictureOn5Planes+0x11e>
      *tmp4source++ = 0x55555555;
    3a5e:	202f 0094      	move.l 148(sp),d0
    3a62:	2200           	move.l d0,d1
    3a64:	5881           	addq.l #4,d1
    3a66:	2f41 0094      	move.l d1,148(sp)
    3a6a:	2040           	movea.l d0,a0
    3a6c:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3a72:	52af 008c      	addq.l #1,140(sp)
    3a76:	7031           	moveq #49,d0
    3a78:	b0af 008c      	cmp.l 140(sp),d0
    3a7c:	6ce0           	bge.s 3a5e <TestZoom4PictureOn5Planes+0x106>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3a7e:	42af 0088      	clr.l 136(sp)
    3a82:	6018           	bra.s 3a9c <TestZoom4PictureOn5Planes+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3a84:	202f 0094      	move.l 148(sp),d0
    3a88:	2200           	move.l d0,d1
    3a8a:	5881           	addq.l #4,d1
    3a8c:	2f41 0094      	move.l d1,148(sp)
    3a90:	2040           	movea.l d0,a0
    3a92:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3a98:	52af 0088      	addq.l #1,136(sp)
    3a9c:	7031           	moveq #49,d0
    3a9e:	b0af 0088      	cmp.l 136(sp),d0
    3aa2:	6ce0           	bge.s 3a84 <TestZoom4PictureOn5Planes+0x12c>
  for(int i=0;i<128+8;i++) {
    3aa4:	52af 0090      	addq.l #1,144(sp)
    3aa8:	0caf 0000 0087 	cmpi.l #135,144(sp)
    3aae:	0090 
    3ab0:	6fa6           	ble.s 3a58 <TestZoom4PictureOn5Planes+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3ab2:	4878 0005      	pea 5 <_start+0x5>
    3ab6:	42a7           	clr.l -(sp)
    3ab8:	2f2f 0052      	move.l 82(sp),-(sp)
    3abc:	2f2f 0066      	move.l 102(sp),-(sp)
    3ac0:	4eba df32      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    3ac4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3ac8:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    3ace:	2c40           	movea.l d0,a6
    3ad0:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3ad4:	222f 004a      	move.l 74(sp),d1
    3ad8:	5881           	addq.l #4,d1
    3ada:	2f41 0084      	move.l d1,132(sp)
  UWORD *valsupposed = destlinezoom1;
    3ade:	2f7c 0000 ba28 	move.l #47656,70(sp)
    3ae4:	0046 
  UWORD mask = 0xffff;
    3ae6:	3f7c ffff 0082 	move.w #-1,130(sp)
  for(int i=0;i<14;i++) {
    3aec:	42af 007e      	clr.l 126(sp)
    3af0:	6000 00a8      	bra.w 3b9a <TestZoom4PictureOn5Planes+0x242>
    for(int i2=0;i2<18;i2++) { 
    3af4:	42af 007a      	clr.l 122(sp)
    3af8:	604e           	bra.s 3b48 <TestZoom4PictureOn5Planes+0x1f0>
      for( int i3=0;i3<5;i3++) {
    3afa:	42af 0076      	clr.l 118(sp)
    3afe:	6038           	bra.s 3b38 <TestZoom4PictureOn5Planes+0x1e0>
        TestRow( valsupposed, valactual, mask, i2+i*19);
    3b00:	222f 007e      	move.l 126(sp),d1
    3b04:	2001           	move.l d1,d0
    3b06:	e788           	lsl.l #3,d0
    3b08:	d081           	add.l d1,d0
    3b0a:	d080           	add.l d0,d0
    3b0c:	d081           	add.l d1,d0
    3b0e:	2200           	move.l d0,d1
    3b10:	d2af 007a      	add.l 122(sp),d1
    3b14:	7000           	moveq #0,d0
    3b16:	302f 0082      	move.w 130(sp),d0
    3b1a:	2f01           	move.l d1,-(sp)
    3b1c:	2f00           	move.l d0,-(sp)
    3b1e:	2f2f 008c      	move.l 140(sp),-(sp)
    3b22:	2f2f 0052      	move.l 82(sp),-(sp)
    3b26:	4eba 2f7e      	jsr 6aa6 <TestRow>(pc)
    3b2a:	4fef 0010      	lea 16(sp),sp
        valactual += ZMLINESIZE/2;
    3b2e:	702a           	moveq #42,d0
    3b30:	d1af 0084      	add.l d0,132(sp)
      for( int i3=0;i3<5;i3++) {
    3b34:	52af 0076      	addq.l #1,118(sp)
    3b38:	7204           	moveq #4,d1
    3b3a:	b2af 0076      	cmp.l 118(sp),d1
    3b3e:	6cc0           	bge.s 3b00 <TestZoom4PictureOn5Planes+0x1a8>
      }
      mask = mask ^ 0xffff;
    3b40:	466f 0082      	not.w 130(sp)
    for(int i2=0;i2<18;i2++) { 
    3b44:	52af 007a      	addq.l #1,122(sp)
    3b48:	7011           	moveq #17,d0
    3b4a:	b0af 007a      	cmp.l 122(sp),d0
    3b4e:	6caa           	bge.s 3afa <TestZoom4PictureOn5Planes+0x1a2>
    }
    for( int i3=0;i3<5;i3++) {
    3b50:	42af 0072      	clr.l 114(sp)
    3b54:	6038           	bra.s 3b8e <TestZoom4PictureOn5Planes+0x236>
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3b56:	222f 007e      	move.l 126(sp),d1
    3b5a:	2001           	move.l d1,d0
    3b5c:	e788           	lsl.l #3,d0
    3b5e:	d081           	add.l d1,d0
    3b60:	d080           	add.l d0,d0
    3b62:	2040           	movea.l d0,a0
    3b64:	d1c1           	adda.l d1,a0
    3b66:	41e8 0012      	lea 18(a0),a0
    3b6a:	7000           	moveq #0,d0
    3b6c:	302f 0082      	move.w 130(sp),d0
    3b70:	2f08           	move.l a0,-(sp)
    3b72:	2f00           	move.l d0,-(sp)
    3b74:	2f2f 008c      	move.l 140(sp),-(sp)
    3b78:	2f2f 0052      	move.l 82(sp),-(sp)
    3b7c:	4eba 2f28      	jsr 6aa6 <TestRow>(pc)
    3b80:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3b84:	722a           	moveq #42,d1
    3b86:	d3af 0084      	add.l d1,132(sp)
    for( int i3=0;i3<5;i3++) {
    3b8a:	52af 0072      	addq.l #1,114(sp)
    3b8e:	7004           	moveq #4,d0
    3b90:	b0af 0072      	cmp.l 114(sp),d0
    3b94:	6cc0           	bge.s 3b56 <TestZoom4PictureOn5Planes+0x1fe>
  for(int i=0;i<14;i++) {
    3b96:	52af 007e      	addq.l #1,126(sp)
    3b9a:	720d           	moveq #13,d1
    3b9c:	b2af 007e      	cmp.l 126(sp),d1
    3ba0:	6c00 ff52      	bge.w 3af4 <TestZoom4PictureOn5Planes+0x19c>
    }
  }
  for(int i2=0;i2<4;i2++) { 
    3ba4:	42af 006e      	clr.l 110(sp)
    3ba8:	6044           	bra.s 3bee <TestZoom4PictureOn5Planes+0x296>
    for( int i3=0;i3<5;i3++) {
    3baa:	42af 006a      	clr.l 106(sp)
    3bae:	602e           	bra.s 3bde <TestZoom4PictureOn5Planes+0x286>
      TestRow( valsupposed, valactual, mask, i2+265);
    3bb0:	222f 006e      	move.l 110(sp),d1
    3bb4:	0681 0000 0109 	addi.l #265,d1
    3bba:	7000           	moveq #0,d0
    3bbc:	302f 0082      	move.w 130(sp),d0
    3bc0:	2f01           	move.l d1,-(sp)
    3bc2:	2f00           	move.l d0,-(sp)
    3bc4:	2f2f 008c      	move.l 140(sp),-(sp)
    3bc8:	2f2f 0052      	move.l 82(sp),-(sp)
    3bcc:	4eba 2ed8      	jsr 6aa6 <TestRow>(pc)
    3bd0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3bd4:	702a           	moveq #42,d0
    3bd6:	d1af 0084      	add.l d0,132(sp)
    for( int i3=0;i3<5;i3++) {
    3bda:	52af 006a      	addq.l #1,106(sp)
    3bde:	7204           	moveq #4,d1
    3be0:	b2af 006a      	cmp.l 106(sp),d1
    3be4:	6cca           	bge.s 3bb0 <TestZoom4PictureOn5Planes+0x258>
    }
    mask = mask ^ 0xffff;
    3be6:	466f 0082      	not.w 130(sp)
  for(int i2=0;i2<4;i2++) { 
    3bea:	52af 006e      	addq.l #1,110(sp)
    3bee:	7003           	moveq #3,d0
    3bf0:	b0af 006e      	cmp.l 110(sp),d0
    3bf4:	6cb4           	bge.s 3baa <TestZoom4PictureOn5Planes+0x252>
  } 
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    3bf6:	2f6f 005a 0042 	move.l 90(sp),66(sp)
    3bfc:	2f7c 0000 f460 	move.l #62560,62(sp)
    3c02:	003e 
    3c04:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    3c0a:	2c40           	movea.l d0,a6
    3c0c:	226f 0042      	movea.l 66(sp),a1
    3c10:	202f 003e      	move.l 62(sp),d0
    3c14:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    3c18:	2f6f 004a 003a 	move.l 74(sp),58(sp)
    3c1e:	2f7c 0000 f460 	move.l #62560,54(sp)
    3c24:	0036 
    3c26:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    3c2c:	2c40           	movea.l d0,a6
    3c2e:	226f 003a      	movea.l 58(sp),a1
    3c32:	202f 0036      	move.l 54(sp),d0
    3c36:	4eae ff2e      	jsr -210(a6)
}
    3c3a:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3c3e:	4fef 008c      	lea 140(sp),sp
    3c42:	4e75           	rts

00003c44 <TestZoom4Picture>:

void TestZoom4Picture() {
    3c44:	4fef fe30      	lea -464(sp),sp
    3c48:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3c4c:	2f7c 0000 30e0 	move.l #12512,106(sp)
    3c52:	006a 
    3c54:	7002           	moveq #2,d0
    3c56:	2f40 0066      	move.l d0,102(sp)
    3c5a:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    3c60:	2c40           	movea.l d0,a6
    3c62:	202f 006a      	move.l 106(sp),d0
    3c66:	222f 0066      	move.l 102(sp),d1
    3c6a:	4eae ff3a      	jsr -198(a6)
    3c6e:	2f40 0062      	move.l d0,98(sp)
    3c72:	202f 0062      	move.l 98(sp),d0
    3c76:	2f40 005e      	move.l d0,94(sp)
  if( source == 0) {
    3c7a:	6646           	bne.s 3cc2 <TestZoom4Picture+0x7e>
    Write(  Output(), 
    3c7c:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3c82:	2c40           	movea.l d0,a6
    3c84:	4eae ffc4      	jsr -60(a6)
    3c88:	2f40 001e      	move.l d0,30(sp)
    3c8c:	202f 001e      	move.l 30(sp),d0
    3c90:	2f40 001a      	move.l d0,26(sp)
    3c94:	2f7c 0000 83d7 	move.l #33751,22(sp)
    3c9a:	0016 
    3c9c:	7239           	moveq #57,d1
    3c9e:	2f41 0012      	move.l d1,18(sp)
    3ca2:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3ca8:	2c40           	movea.l d0,a6
    3caa:	222f 001a      	move.l 26(sp),d1
    3cae:	242f 0016      	move.l 22(sp),d2
    3cb2:	262f 0012      	move.l 18(sp),d3
    3cb6:	4eae ffd0      	jsr -48(a6)
    3cba:	2f40 000e      	move.l d0,14(sp)
    3cbe:	6000 2ddc      	bra.w 6a9c <TestZoom4Picture+0x2e58>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3cc2:	2f7c 0000 30e0 	move.l #12512,90(sp)
    3cc8:	005a 
    3cca:	7002           	moveq #2,d0
    3ccc:	2f40 0056      	move.l d0,86(sp)
    3cd0:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    3cd6:	2c40           	movea.l d0,a6
    3cd8:	202f 005a      	move.l 90(sp),d0
    3cdc:	222f 0056      	move.l 86(sp),d1
    3ce0:	4eae ff3a      	jsr -198(a6)
    3ce4:	2f40 0052      	move.l d0,82(sp)
    3ce8:	202f 0052      	move.l 82(sp),d0
    3cec:	2f40 004e      	move.l d0,78(sp)
  if( destination == 0) {
    3cf0:	6646           	bne.s 3d38 <TestZoom4Picture+0xf4>
    Write(  Output(), 
    3cf2:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3cf8:	2c40           	movea.l d0,a6
    3cfa:	4eae ffc4      	jsr -60(a6)
    3cfe:	2f40 0032      	move.l d0,50(sp)
    3d02:	202f 0032      	move.l 50(sp),d0
    3d06:	2f40 002e      	move.l d0,46(sp)
    3d0a:	2f7c 0000 8411 	move.l #33809,42(sp)
    3d10:	002a 
    3d12:	723d           	moveq #61,d1
    3d14:	2f41 0026      	move.l d1,38(sp)
    3d18:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    3d1e:	2c40           	movea.l d0,a6
    3d20:	222f 002e      	move.l 46(sp),d1
    3d24:	242f 002a      	move.l 42(sp),d2
    3d28:	262f 0026      	move.l 38(sp),d3
    3d2c:	4eae ffd0      	jsr -48(a6)
    3d30:	2f40 0022      	move.l d0,34(sp)
    3d34:	6000 2d66      	bra.w 6a9c <TestZoom4Picture+0x2e58>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3d38:	2f6f 005e 01d8 	move.l 94(sp),472(sp)
  for(int i=0;i<128+8;i++) {
    3d3e:	42af 01d4      	clr.l 468(sp)
    3d42:	6050           	bra.s 3d94 <TestZoom4Picture+0x150>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3d44:	42af 01d0      	clr.l 464(sp)
    3d48:	6018           	bra.s 3d62 <TestZoom4Picture+0x11e>
      *tmp4source++ = 0x55555555;
    3d4a:	202f 01d8      	move.l 472(sp),d0
    3d4e:	2200           	move.l d0,d1
    3d50:	5881           	addq.l #4,d1
    3d52:	2f41 01d8      	move.l d1,472(sp)
    3d56:	2040           	movea.l d0,a0
    3d58:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3d5e:	52af 01d0      	addq.l #1,464(sp)
    3d62:	7009           	moveq #9,d0
    3d64:	b0af 01d0      	cmp.l 464(sp),d0
    3d68:	6ce0           	bge.s 3d4a <TestZoom4Picture+0x106>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3d6a:	42af 01cc      	clr.l 460(sp)
    3d6e:	6018           	bra.s 3d88 <TestZoom4Picture+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3d70:	202f 01d8      	move.l 472(sp),d0
    3d74:	2200           	move.l d0,d1
    3d76:	5881           	addq.l #4,d1
    3d78:	2f41 01d8      	move.l d1,472(sp)
    3d7c:	2040           	movea.l d0,a0
    3d7e:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3d84:	52af 01cc      	addq.l #1,460(sp)
    3d88:	7009           	moveq #9,d0
    3d8a:	b0af 01cc      	cmp.l 460(sp),d0
    3d8e:	6ce0           	bge.s 3d70 <TestZoom4Picture+0x12c>
  for(int i=0;i<128+8;i++) {
    3d90:	52af 01d4      	addq.l #1,468(sp)
    3d94:	0caf 0000 0087 	cmpi.l #135,468(sp)
    3d9a:	01d4 
    3d9c:	6fa6           	ble.s 3d44 <TestZoom4Picture+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    3d9e:	4878 0001      	pea 1 <_start+0x1>
    3da2:	42a7           	clr.l -(sp)
    3da4:	2f2f 0056      	move.l 86(sp),-(sp)
    3da8:	2f2f 006a      	move.l 106(sp),-(sp)
    3dac:	4eba dc46      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    3db0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3db4:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    3dba:	2c40           	movea.l d0,a6
    3dbc:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3dc0:	222f 004e      	move.l 78(sp),d1
    3dc4:	5881           	addq.l #4,d1
    3dc6:	2f41 01c8      	move.l d1,456(sp)
  UWORD *valsupposed = destlinezoom1;
    3dca:	2f7c 0000 ba28 	move.l #47656,74(sp)
    3dd0:	004a 
  UWORD mask = 0xffff;
    3dd2:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<14;i++) {
    3dd8:	42af 01c2      	clr.l 450(sp)
    3ddc:	6000 0084      	bra.w 3e62 <TestZoom4Picture+0x21e>
    for(int i2=0;i2<18;i2++) { 
    3de0:	42af 01be      	clr.l 446(sp)
    3de4:	603c           	bra.s 3e22 <TestZoom4Picture+0x1de>
      TestRow( valsupposed, valactual, mask, i2+i*19);
    3de6:	222f 01c2      	move.l 450(sp),d1
    3dea:	2001           	move.l d1,d0
    3dec:	e788           	lsl.l #3,d0
    3dee:	d081           	add.l d1,d0
    3df0:	d080           	add.l d0,d0
    3df2:	d081           	add.l d1,d0
    3df4:	2200           	move.l d0,d1
    3df6:	d2af 01be      	add.l 446(sp),d1
    3dfa:	7000           	moveq #0,d0
    3dfc:	302f 01c6      	move.w 454(sp),d0
    3e00:	2f01           	move.l d1,-(sp)
    3e02:	2f00           	move.l d0,-(sp)
    3e04:	2f2f 01d0      	move.l 464(sp),-(sp)
    3e08:	2f2f 0056      	move.l 86(sp),-(sp)
    3e0c:	4eba 2c98      	jsr 6aa6 <TestRow>(pc)
    3e10:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3e14:	702a           	moveq #42,d0
    3e16:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    3e1a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) { 
    3e1e:	52af 01be      	addq.l #1,446(sp)
    3e22:	7211           	moveq #17,d1
    3e24:	b2af 01be      	cmp.l 446(sp),d1
    3e28:	6cbc           	bge.s 3de6 <TestZoom4Picture+0x1a2>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    3e2a:	222f 01c2      	move.l 450(sp),d1
    3e2e:	2001           	move.l d1,d0
    3e30:	e788           	lsl.l #3,d0
    3e32:	d081           	add.l d1,d0
    3e34:	d080           	add.l d0,d0
    3e36:	2040           	movea.l d0,a0
    3e38:	d1c1           	adda.l d1,a0
    3e3a:	41e8 0012      	lea 18(a0),a0
    3e3e:	7000           	moveq #0,d0
    3e40:	302f 01c6      	move.w 454(sp),d0
    3e44:	2f08           	move.l a0,-(sp)
    3e46:	2f00           	move.l d0,-(sp)
    3e48:	2f2f 01d0      	move.l 464(sp),-(sp)
    3e4c:	2f2f 0056      	move.l 86(sp),-(sp)
    3e50:	4eba 2c54      	jsr 6aa6 <TestRow>(pc)
    3e54:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3e58:	702a           	moveq #42,d0
    3e5a:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<14;i++) {
    3e5e:	52af 01c2      	addq.l #1,450(sp)
    3e62:	720d           	moveq #13,d1
    3e64:	b2af 01c2      	cmp.l 450(sp),d1
    3e68:	6c00 ff76      	bge.w 3de0 <TestZoom4Picture+0x19c>
  }

  for(int i2=0;i2<4;i2++) { 
    3e6c:	42af 01ba      	clr.l 442(sp)
    3e70:	6032           	bra.s 3ea4 <TestZoom4Picture+0x260>
    TestRow( valsupposed, valactual, mask, i2+265);
    3e72:	222f 01ba      	move.l 442(sp),d1
    3e76:	0681 0000 0109 	addi.l #265,d1
    3e7c:	7000           	moveq #0,d0
    3e7e:	302f 01c6      	move.w 454(sp),d0
    3e82:	2f01           	move.l d1,-(sp)
    3e84:	2f00           	move.l d0,-(sp)
    3e86:	2f2f 01d0      	move.l 464(sp),-(sp)
    3e8a:	2f2f 0056      	move.l 86(sp),-(sp)
    3e8e:	4eba 2c16      	jsr 6aa6 <TestRow>(pc)
    3e92:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3e96:	702a           	moveq #42,d0
    3e98:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    3e9c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    3ea0:	52af 01ba      	addq.l #1,442(sp)
    3ea4:	7203           	moveq #3,d1
    3ea6:	b2af 01ba      	cmp.l 442(sp),d1
    3eaa:	6cc6           	bge.s 3e72 <TestZoom4Picture+0x22e>
  }
  
  UWORD *tmp = source;
    3eac:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    3eb2:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    3eb8:	2f6f 0046 004e 	move.l 70(sp),78(sp)
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    3ebe:	4878 0001      	pea 1 <_start+0x1>
    3ec2:	4878 0001      	pea 1 <_start+0x1>
    3ec6:	2f2f 0056      	move.l 86(sp),-(sp)
    3eca:	2f2f 006a      	move.l 106(sp),-(sp)
    3ece:	4eba db24      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    3ed2:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3ed6:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    3edc:	2c40           	movea.l d0,a6
    3ede:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    3ee2:	202f 004e      	move.l 78(sp),d0
    3ee6:	5880           	addq.l #4,d0
    3ee8:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom2;
    3eec:	2f7c 0000 ba54 	move.l #47700,74(sp)
    3ef2:	004a 
  mask = 0x0000;
    3ef4:	426f 01c6      	clr.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3ef8:	42af 01b6      	clr.l 438(sp)
    3efc:	602a           	bra.s 3f28 <TestZoom4Picture+0x2e4>
    TestRow( valsupposed, valactual, mask, i2);
    3efe:	7000           	moveq #0,d0
    3f00:	302f 01c6      	move.w 454(sp),d0
    3f04:	2f2f 01b6      	move.l 438(sp),-(sp)
    3f08:	2f00           	move.l d0,-(sp)
    3f0a:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f0e:	2f2f 0056      	move.l 86(sp),-(sp)
    3f12:	4eba 2b92      	jsr 6aa6 <TestRow>(pc)
    3f16:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f1a:	722a           	moveq #42,d1
    3f1c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    3f20:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3f24:	52af 01b6      	addq.l #1,438(sp)
    3f28:	700a           	moveq #10,d0
    3f2a:	b0af 01b6      	cmp.l 438(sp),d0
    3f2e:	6cce           	bge.s 3efe <TestZoom4Picture+0x2ba>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    3f30:	4878 0008      	pea 8 <_start+0x8>
    3f34:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3f3a:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f3e:	2f2f 0056      	move.l 86(sp),-(sp)
    3f42:	4eba 2b62      	jsr 6aa6 <TestRow>(pc)
    3f46:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3f4a:	722a           	moveq #42,d1
    3f4c:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 9);
    3f50:	4878 0009      	pea 9 <_start+0x9>
    3f54:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3f5a:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f5e:	2f2f 0056      	move.l 86(sp),-(sp)
    3f62:	4eba 2b42      	jsr 6aa6 <TestRow>(pc)
    3f66:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3f6a:	702a           	moveq #42,d0
    3f6c:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 10);
    3f70:	4878 000a      	pea a <_start+0xa>
    3f74:	42a7           	clr.l -(sp)
    3f76:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f7a:	2f2f 0056      	move.l 86(sp),-(sp)
    3f7e:	4eba 2b26      	jsr 6aa6 <TestRow>(pc)
    3f82:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3f86:	722a           	moveq #42,d1
    3f88:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 11);
    3f8c:	4878 000b      	pea b <_start+0xb>
    3f90:	42a7           	clr.l -(sp)
    3f92:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f96:	2f2f 0056      	move.l 86(sp),-(sp)
    3f9a:	4eba 2b0a      	jsr 6aa6 <TestRow>(pc)
    3f9e:	4fef 0010      	lea 16(sp),sp

  valactual += ZMLINESIZE/2;
    3fa2:	702a           	moveq #42,d0
    3fa4:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<12;i++) {
    3fa8:	42af 01b2      	clr.l 434(sp)
    3fac:	6000 0118      	bra.w 40c6 <TestZoom4Picture+0x482>
    for(int i2=0;i2<16;i2++) {  
    3fb0:	42af 01ae      	clr.l 430(sp)
    3fb4:	603c           	bra.s 3ff2 <TestZoom4Picture+0x3ae>
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    3fb6:	222f 01b2      	move.l 434(sp),d1
    3fba:	2001           	move.l d1,d0
    3fbc:	e988           	lsl.l #4,d0
    3fbe:	d081           	add.l d1,d0
    3fc0:	2040           	movea.l d0,a0
    3fc2:	d1ef 01ae      	adda.l 430(sp),a0
    3fc6:	41e8 000b      	lea 11(a0),a0
    3fca:	7000           	moveq #0,d0
    3fcc:	302f 01c6      	move.w 454(sp),d0
    3fd0:	2f08           	move.l a0,-(sp)
    3fd2:	2f00           	move.l d0,-(sp)
    3fd4:	2f2f 01d0      	move.l 464(sp),-(sp)
    3fd8:	2f2f 0056      	move.l 86(sp),-(sp)
    3fdc:	4eba 2ac8      	jsr 6aa6 <TestRow>(pc)
    3fe0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3fe4:	722a           	moveq #42,d1
    3fe6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    3fea:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {  
    3fee:	52af 01ae      	addq.l #1,430(sp)
    3ff2:	700f           	moveq #15,d0
    3ff4:	b0af 01ae      	cmp.l 430(sp),d0
    3ff8:	6cbc           	bge.s 3fb6 <TestZoom4Picture+0x372>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    3ffa:	222f 01b2      	move.l 434(sp),d1
    3ffe:	2001           	move.l d1,d0
    4000:	e988           	lsl.l #4,d0
    4002:	2040           	movea.l d0,a0
    4004:	d1c1           	adda.l d1,a0
    4006:	41e8 0018      	lea 24(a0),a0
    400a:	7000           	moveq #0,d0
    400c:	302f 01c6      	move.w 454(sp),d0
    4010:	2f08           	move.l a0,-(sp)
    4012:	2f00           	move.l d0,-(sp)
    4014:	2f2f 01d0      	move.l 464(sp),-(sp)
    4018:	2f2f 0056      	move.l 86(sp),-(sp)
    401c:	4eba 2a88      	jsr 6aa6 <TestRow>(pc)
    4020:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4024:	722a           	moveq #42,d1
    4026:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    402a:	222f 01b2      	move.l 434(sp),d1
    402e:	2001           	move.l d1,d0
    4030:	e988           	lsl.l #4,d0
    4032:	2040           	movea.l d0,a0
    4034:	d1c1           	adda.l d1,a0
    4036:	41e8 0019      	lea 25(a0),a0
    403a:	7000           	moveq #0,d0
    403c:	302f 01c6      	move.w 454(sp),d0
    4040:	2f08           	move.l a0,-(sp)
    4042:	2f00           	move.l d0,-(sp)
    4044:	2f2f 01d0      	move.l 464(sp),-(sp)
    4048:	2f2f 0056      	move.l 86(sp),-(sp)
    404c:	4eba 2a58      	jsr 6aa6 <TestRow>(pc)
    4050:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4054:	702a           	moveq #42,d0
    4056:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    405a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    405e:	222f 01b2      	move.l 434(sp),d1
    4062:	2001           	move.l d1,d0
    4064:	e988           	lsl.l #4,d0
    4066:	2040           	movea.l d0,a0
    4068:	d1c1           	adda.l d1,a0
    406a:	41e8 001a      	lea 26(a0),a0
    406e:	7000           	moveq #0,d0
    4070:	302f 01c6      	move.w 454(sp),d0
    4074:	2f08           	move.l a0,-(sp)
    4076:	2f00           	move.l d0,-(sp)
    4078:	2f2f 01d0      	move.l 464(sp),-(sp)
    407c:	2f2f 0056      	move.l 86(sp),-(sp)
    4080:	4eba 2a24      	jsr 6aa6 <TestRow>(pc)
    4084:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4088:	722a           	moveq #42,d1
    408a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    408e:	222f 01b2      	move.l 434(sp),d1
    4092:	2001           	move.l d1,d0
    4094:	e988           	lsl.l #4,d0
    4096:	2040           	movea.l d0,a0
    4098:	d1c1           	adda.l d1,a0
    409a:	41e8 001b      	lea 27(a0),a0
    409e:	7000           	moveq #0,d0
    40a0:	302f 01c6      	move.w 454(sp),d0
    40a4:	2f08           	move.l a0,-(sp)
    40a6:	2f00           	move.l d0,-(sp)
    40a8:	2f2f 01d0      	move.l 464(sp),-(sp)
    40ac:	2f2f 0056      	move.l 86(sp),-(sp)
    40b0:	4eba 29f4      	jsr 6aa6 <TestRow>(pc)
    40b4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40b8:	702a           	moveq #42,d0
    40ba:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    40be:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    40c2:	52af 01b2      	addq.l #1,434(sp)
    40c6:	720b           	moveq #11,d1
    40c8:	b2af 01b2      	cmp.l 434(sp),d1
    40cc:	6c00 fee2      	bge.w 3fb0 <TestZoom4Picture+0x36c>
    
  }

  for(int i2=0;i2<15;i2++) { 
    40d0:	42af 01aa      	clr.l 426(sp)
    40d4:	602a           	bra.s 4100 <TestZoom4Picture+0x4bc>
    TestRow( valsupposed, valactual, mask, i2);
    40d6:	7000           	moveq #0,d0
    40d8:	302f 01c6      	move.w 454(sp),d0
    40dc:	2f2f 01aa      	move.l 426(sp),-(sp)
    40e0:	2f00           	move.l d0,-(sp)
    40e2:	2f2f 01d0      	move.l 464(sp),-(sp)
    40e6:	2f2f 0056      	move.l 86(sp),-(sp)
    40ea:	4eba 29ba      	jsr 6aa6 <TestRow>(pc)
    40ee:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40f2:	702a           	moveq #42,d0
    40f4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    40f8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<15;i2++) { 
    40fc:	52af 01aa      	addq.l #1,426(sp)
    4100:	720e           	moveq #14,d1
    4102:	b2af 01aa      	cmp.l 426(sp),d1
    4106:	6cce           	bge.s 40d6 <TestZoom4Picture+0x492>
  }

  tmp = source;
    4108:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    410e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4114:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    411a:	4878 0001      	pea 1 <_start+0x1>
    411e:	4878 0002      	pea 2 <_start+0x2>
    4122:	2f2f 0056      	move.l 86(sp),-(sp)
    4126:	2f2f 006a      	move.l 106(sp),-(sp)
    412a:	4eba d8c8      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    412e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4132:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    4138:	2c40           	movea.l d0,a6
    413a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    413e:	202f 004e      	move.l 78(sp),d0
    4142:	5880           	addq.l #4,d0
    4144:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom3;
    4148:	2f7c 0000 ba80 	move.l #47744,74(sp)
    414e:	004a 
  mask = 0xffff;
    4150:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<4;i2++) { 
    4156:	42af 01a6      	clr.l 422(sp)
    415a:	602a           	bra.s 4186 <TestZoom4Picture+0x542>
    TestRow( valsupposed, valactual, mask, i2);
    415c:	7000           	moveq #0,d0
    415e:	302f 01c6      	move.w 454(sp),d0
    4162:	2f2f 01a6      	move.l 422(sp),-(sp)
    4166:	2f00           	move.l d0,-(sp)
    4168:	2f2f 01d0      	move.l 464(sp),-(sp)
    416c:	2f2f 0056      	move.l 86(sp),-(sp)
    4170:	4eba 2934      	jsr 6aa6 <TestRow>(pc)
    4174:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4178:	722a           	moveq #42,d1
    417a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    417e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    4182:	52af 01a6      	addq.l #1,422(sp)
    4186:	7003           	moveq #3,d0
    4188:	b0af 01a6      	cmp.l 422(sp),d0
    418c:	6cce           	bge.s 415c <TestZoom4Picture+0x518>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    418e:	4878 0004      	pea 4 <_start+0x4>
    4192:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4198:	2f2f 01d0      	move.l 464(sp),-(sp)
    419c:	2f2f 0056      	move.l 86(sp),-(sp)
    41a0:	4eba 2904      	jsr 6aa6 <TestRow>(pc)
    41a4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    41a8:	722a           	moveq #42,d1
    41aa:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    41ae:	4878 0005      	pea 5 <_start+0x5>
    41b2:	2f3c 0000 ffff 	move.l #65535,-(sp)
    41b8:	2f2f 01d0      	move.l 464(sp),-(sp)
    41bc:	2f2f 0056      	move.l 86(sp),-(sp)
    41c0:	4eba 28e4      	jsr 6aa6 <TestRow>(pc)
    41c4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    41c8:	702a           	moveq #42,d0
    41ca:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    41ce:	4878 0006      	pea 6 <_start+0x6>
    41d2:	42a7           	clr.l -(sp)
    41d4:	2f2f 01d0      	move.l 464(sp),-(sp)
    41d8:	2f2f 0056      	move.l 86(sp),-(sp)
    41dc:	4eba 28c8      	jsr 6aa6 <TestRow>(pc)
    41e0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    41e4:	722a           	moveq #42,d1
    41e6:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    41ea:	4878 0007      	pea 7 <_start+0x7>
    41ee:	42a7           	clr.l -(sp)
    41f0:	2f2f 01d0      	move.l 464(sp),-(sp)
    41f4:	2f2f 0056      	move.l 86(sp),-(sp)
    41f8:	4eba 28ac      	jsr 6aa6 <TestRow>(pc)
    41fc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4200:	702a           	moveq #42,d0
    4202:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    4206:	4878 0008      	pea 8 <_start+0x8>
    420a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4210:	2f2f 01d0      	move.l 464(sp),-(sp)
    4214:	2f2f 0056      	move.l 86(sp),-(sp)
    4218:	4eba 288c      	jsr 6aa6 <TestRow>(pc)
    421c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4220:	722a           	moveq #42,d1
    4222:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    4226:	4878 0009      	pea 9 <_start+0x9>
    422a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4230:	2f2f 01d0      	move.l 464(sp),-(sp)
    4234:	2f2f 0056      	move.l 86(sp),-(sp)
    4238:	4eba 286c      	jsr 6aa6 <TestRow>(pc)
    423c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4240:	702a           	moveq #42,d0
    4242:	d1af 01c8      	add.l d0,456(sp)

  mask = 0x0000;
    4246:	426f 01c6      	clr.w 454(sp)
  for(int i=0;i<12;i++) {
    424a:	42af 01a2      	clr.l 418(sp)
    424e:	6000 01a6      	bra.w 43f6 <TestZoom4Picture+0x7b2>
    for(int i2=0;i2<15;i2++) {  
    4252:	42af 019e      	clr.l 414(sp)
    4256:	6042           	bra.s 429a <TestZoom4Picture+0x656>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    4258:	222f 01a2      	move.l 418(sp),d1
    425c:	2001           	move.l d1,d0
    425e:	d080           	add.l d0,d0
    4260:	d081           	add.l d1,d0
    4262:	2200           	move.l d0,d1
    4264:	e789           	lsl.l #3,d1
    4266:	9280           	sub.l d0,d1
    4268:	2041           	movea.l d1,a0
    426a:	d1ef 019e      	adda.l 414(sp),a0
    426e:	41e8 0009      	lea 9(a0),a0
    4272:	7000           	moveq #0,d0
    4274:	302f 01c6      	move.w 454(sp),d0
    4278:	2f08           	move.l a0,-(sp)
    427a:	2f00           	move.l d0,-(sp)
    427c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4280:	2f2f 0056      	move.l 86(sp),-(sp)
    4284:	4eba 2820      	jsr 6aa6 <TestRow>(pc)
    4288:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    428c:	722a           	moveq #42,d1
    428e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4292:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {  
    4296:	52af 019e      	addq.l #1,414(sp)
    429a:	700e           	moveq #14,d0
    429c:	b0af 019e      	cmp.l 414(sp),d0
    42a0:	6cb6           	bge.s 4258 <TestZoom4Picture+0x614>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    42a2:	222f 01a2      	move.l 418(sp),d1
    42a6:	2001           	move.l d1,d0
    42a8:	d080           	add.l d0,d0
    42aa:	d081           	add.l d1,d0
    42ac:	2200           	move.l d0,d1
    42ae:	e789           	lsl.l #3,d1
    42b0:	2041           	movea.l d1,a0
    42b2:	91c0           	suba.l d0,a0
    42b4:	41e8 0018      	lea 24(a0),a0
    42b8:	7000           	moveq #0,d0
    42ba:	302f 01c6      	move.w 454(sp),d0
    42be:	2f08           	move.l a0,-(sp)
    42c0:	2f00           	move.l d0,-(sp)
    42c2:	2f2f 01d0      	move.l 464(sp),-(sp)
    42c6:	2f2f 0056      	move.l 86(sp),-(sp)
    42ca:	4eba 27da      	jsr 6aa6 <TestRow>(pc)
    42ce:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    42d2:	722a           	moveq #42,d1
    42d4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    42d8:	222f 01a2      	move.l 418(sp),d1
    42dc:	2001           	move.l d1,d0
    42de:	d080           	add.l d0,d0
    42e0:	d081           	add.l d1,d0
    42e2:	2200           	move.l d0,d1
    42e4:	e789           	lsl.l #3,d1
    42e6:	2041           	movea.l d1,a0
    42e8:	91c0           	suba.l d0,a0
    42ea:	41e8 0019      	lea 25(a0),a0
    42ee:	7000           	moveq #0,d0
    42f0:	302f 01c6      	move.w 454(sp),d0
    42f4:	2f08           	move.l a0,-(sp)
    42f6:	2f00           	move.l d0,-(sp)
    42f8:	2f2f 01d0      	move.l 464(sp),-(sp)
    42fc:	2f2f 0056      	move.l 86(sp),-(sp)
    4300:	4eba 27a4      	jsr 6aa6 <TestRow>(pc)
    4304:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4308:	702a           	moveq #42,d0
    430a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    430e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    4312:	222f 01a2      	move.l 418(sp),d1
    4316:	2001           	move.l d1,d0
    4318:	d080           	add.l d0,d0
    431a:	d081           	add.l d1,d0
    431c:	2200           	move.l d0,d1
    431e:	e789           	lsl.l #3,d1
    4320:	2041           	movea.l d1,a0
    4322:	91c0           	suba.l d0,a0
    4324:	41e8 001a      	lea 26(a0),a0
    4328:	7000           	moveq #0,d0
    432a:	302f 01c6      	move.w 454(sp),d0
    432e:	2f08           	move.l a0,-(sp)
    4330:	2f00           	move.l d0,-(sp)
    4332:	2f2f 01d0      	move.l 464(sp),-(sp)
    4336:	2f2f 0056      	move.l 86(sp),-(sp)
    433a:	4eba 276a      	jsr 6aa6 <TestRow>(pc)
    433e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4342:	722a           	moveq #42,d1
    4344:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    4348:	222f 01a2      	move.l 418(sp),d1
    434c:	2001           	move.l d1,d0
    434e:	d080           	add.l d0,d0
    4350:	d081           	add.l d1,d0
    4352:	2200           	move.l d0,d1
    4354:	e789           	lsl.l #3,d1
    4356:	2041           	movea.l d1,a0
    4358:	91c0           	suba.l d0,a0
    435a:	41e8 001b      	lea 27(a0),a0
    435e:	7000           	moveq #0,d0
    4360:	302f 01c6      	move.w 454(sp),d0
    4364:	2f08           	move.l a0,-(sp)
    4366:	2f00           	move.l d0,-(sp)
    4368:	2f2f 01d0      	move.l 464(sp),-(sp)
    436c:	2f2f 0056      	move.l 86(sp),-(sp)
    4370:	4eba 2734      	jsr 6aa6 <TestRow>(pc)
    4374:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4378:	702a           	moveq #42,d0
    437a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    437e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4382:	222f 01a2      	move.l 418(sp),d1
    4386:	2001           	move.l d1,d0
    4388:	d080           	add.l d0,d0
    438a:	d081           	add.l d1,d0
    438c:	2200           	move.l d0,d1
    438e:	e789           	lsl.l #3,d1
    4390:	2041           	movea.l d1,a0
    4392:	91c0           	suba.l d0,a0
    4394:	41e8 001c      	lea 28(a0),a0
    4398:	7000           	moveq #0,d0
    439a:	302f 01c6      	move.w 454(sp),d0
    439e:	2f08           	move.l a0,-(sp)
    43a0:	2f00           	move.l d0,-(sp)
    43a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    43a6:	2f2f 0056      	move.l 86(sp),-(sp)
    43aa:	4eba 26fa      	jsr 6aa6 <TestRow>(pc)
    43ae:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43b2:	722a           	moveq #42,d1
    43b4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    43b8:	222f 01a2      	move.l 418(sp),d1
    43bc:	2001           	move.l d1,d0
    43be:	d080           	add.l d0,d0
    43c0:	d081           	add.l d1,d0
    43c2:	2200           	move.l d0,d1
    43c4:	e789           	lsl.l #3,d1
    43c6:	2041           	movea.l d1,a0
    43c8:	91c0           	suba.l d0,a0
    43ca:	41e8 001d      	lea 29(a0),a0
    43ce:	7000           	moveq #0,d0
    43d0:	302f 01c6      	move.w 454(sp),d0
    43d4:	2f08           	move.l a0,-(sp)
    43d6:	2f00           	move.l d0,-(sp)
    43d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    43dc:	2f2f 0056      	move.l 86(sp),-(sp)
    43e0:	4eba 26c4      	jsr 6aa6 <TestRow>(pc)
    43e4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43e8:	702a           	moveq #42,d0
    43ea:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    43ee:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    43f2:	52af 01a2      	addq.l #1,418(sp)
    43f6:	720b           	moveq #11,d1
    43f8:	b2af 01a2      	cmp.l 418(sp),d1
    43fc:	6c00 fe54      	bge.w 4252 <TestZoom4Picture+0x60e>
  }

  for(int i2=0;i2<8;i2++) {  
    4400:	42af 019a      	clr.l 410(sp)
    4404:	6032           	bra.s 4438 <TestZoom4Picture+0x7f4>
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    4406:	222f 019a      	move.l 410(sp),d1
    440a:	0681 0000 0105 	addi.l #261,d1
    4410:	7000           	moveq #0,d0
    4412:	302f 01c6      	move.w 454(sp),d0
    4416:	2f01           	move.l d1,-(sp)
    4418:	2f00           	move.l d0,-(sp)
    441a:	2f2f 01d0      	move.l 464(sp),-(sp)
    441e:	2f2f 0056      	move.l 86(sp),-(sp)
    4422:	4eba 2682      	jsr 6aa6 <TestRow>(pc)
    4426:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    442a:	702a           	moveq #42,d0
    442c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4430:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    4434:	52af 019a      	addq.l #1,410(sp)
    4438:	7207           	moveq #7,d1
    443a:	b2af 019a      	cmp.l 410(sp),d1
    443e:	6cc6           	bge.s 4406 <TestZoom4Picture+0x7c2>
  }

  tmp = source;
    4440:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4446:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    444c:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    4452:	4878 0001      	pea 1 <_start+0x1>
    4456:	4878 0003      	pea 3 <_start+0x3>
    445a:	2f2f 0056      	move.l 86(sp),-(sp)
    445e:	2f2f 006a      	move.l 106(sp),-(sp)
    4462:	4eba d590      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    4466:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    446a:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    4470:	2c40           	movea.l d0,a6
    4472:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4476:	202f 004e      	move.l 78(sp),d0
    447a:	5880           	addq.l #4,d0
    447c:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom4;
    4480:	2f7c 0000 baac 	move.l #47788,74(sp)
    4486:	004a 
  mask = 0x0000;
    4488:	426f 01c6      	clr.w 454(sp)
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    448c:	4878 0007      	pea 7 <_start+0x7>
    4490:	42a7           	clr.l -(sp)
    4492:	2f2f 01d0      	move.l 464(sp),-(sp)
    4496:	2f2f 0056      	move.l 86(sp),-(sp)
    449a:	4eba 260a      	jsr 6aa6 <TestRow>(pc)
    449e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44a2:	722a           	moveq #42,d1
    44a4:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    44a8:	4878 0008      	pea 8 <_start+0x8>
    44ac:	2f3c 0000 ffff 	move.l #65535,-(sp)
    44b2:	2f2f 01d0      	move.l 464(sp),-(sp)
    44b6:	2f2f 0056      	move.l 86(sp),-(sp)
    44ba:	4eba 25ea      	jsr 6aa6 <TestRow>(pc)
    44be:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44c2:	702a           	moveq #42,d0
    44c4:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    44c8:	4878 0009      	pea 9 <_start+0x9>
    44cc:	2f3c 0000 ffff 	move.l #65535,-(sp)
    44d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    44d6:	2f2f 0056      	move.l 86(sp),-(sp)
    44da:	4eba 25ca      	jsr 6aa6 <TestRow>(pc)
    44de:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44e2:	722a           	moveq #42,d1
    44e4:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    44e8:	4878 0008      	pea 8 <_start+0x8>
    44ec:	42a7           	clr.l -(sp)
    44ee:	2f2f 01d0      	move.l 464(sp),-(sp)
    44f2:	2f2f 0056      	move.l 86(sp),-(sp)
    44f6:	4eba 25ae      	jsr 6aa6 <TestRow>(pc)
    44fa:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44fe:	702a           	moveq #42,d0
    4500:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    4504:	4878 0009      	pea 9 <_start+0x9>
    4508:	42a7           	clr.l -(sp)
    450a:	2f2f 01d0      	move.l 464(sp),-(sp)
    450e:	2f2f 0056      	move.l 86(sp),-(sp)
    4512:	4eba 2592      	jsr 6aa6 <TestRow>(pc)
    4516:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    451a:	722a           	moveq #42,d1
    451c:	d3af 01c8      	add.l d1,456(sp)

  mask = 0xffff;
    4520:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<12;i++) {
    4526:	42af 0196      	clr.l 406(sp)
    452a:	6000 0216      	bra.w 4742 <TestZoom4Picture+0xafe>
    for(int i2=0;i2<14;i2++) {  
    452e:	42af 0192      	clr.l 402(sp)
    4532:	6042           	bra.s 4576 <TestZoom4Picture+0x932>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    4534:	222f 0196      	move.l 406(sp),d1
    4538:	2001           	move.l d1,d0
    453a:	d080           	add.l d0,d0
    453c:	d081           	add.l d1,d0
    453e:	2200           	move.l d0,d1
    4540:	e789           	lsl.l #3,d1
    4542:	9280           	sub.l d0,d1
    4544:	2041           	movea.l d1,a0
    4546:	d1ef 0192      	adda.l 402(sp),a0
    454a:	41e8 0009      	lea 9(a0),a0
    454e:	7000           	moveq #0,d0
    4550:	302f 01c6      	move.w 454(sp),d0
    4554:	2f08           	move.l a0,-(sp)
    4556:	2f00           	move.l d0,-(sp)
    4558:	2f2f 01d0      	move.l 464(sp),-(sp)
    455c:	2f2f 0056      	move.l 86(sp),-(sp)
    4560:	4eba 2544      	jsr 6aa6 <TestRow>(pc)
    4564:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4568:	702a           	moveq #42,d0
    456a:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    456e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {  
    4572:	52af 0192      	addq.l #1,402(sp)
    4576:	720d           	moveq #13,d1
    4578:	b2af 0192      	cmp.l 402(sp),d1
    457c:	6cb6           	bge.s 4534 <TestZoom4Picture+0x8f0>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    457e:	222f 0196      	move.l 406(sp),d1
    4582:	2001           	move.l d1,d0
    4584:	d080           	add.l d0,d0
    4586:	d081           	add.l d1,d0
    4588:	2200           	move.l d0,d1
    458a:	e789           	lsl.l #3,d1
    458c:	2041           	movea.l d1,a0
    458e:	91c0           	suba.l d0,a0
    4590:	41e8 0018      	lea 24(a0),a0
    4594:	7000           	moveq #0,d0
    4596:	302f 01c6      	move.w 454(sp),d0
    459a:	2f08           	move.l a0,-(sp)
    459c:	2f00           	move.l d0,-(sp)
    459e:	2f2f 01d0      	move.l 464(sp),-(sp)
    45a2:	2f2f 0056      	move.l 86(sp),-(sp)
    45a6:	4eba 24fe      	jsr 6aa6 <TestRow>(pc)
    45aa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    45ae:	702a           	moveq #42,d0
    45b0:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    45b4:	222f 0196      	move.l 406(sp),d1
    45b8:	2001           	move.l d1,d0
    45ba:	d080           	add.l d0,d0
    45bc:	d081           	add.l d1,d0
    45be:	2200           	move.l d0,d1
    45c0:	e789           	lsl.l #3,d1
    45c2:	2041           	movea.l d1,a0
    45c4:	91c0           	suba.l d0,a0
    45c6:	41e8 0019      	lea 25(a0),a0
    45ca:	7000           	moveq #0,d0
    45cc:	302f 01c6      	move.w 454(sp),d0
    45d0:	2f08           	move.l a0,-(sp)
    45d2:	2f00           	move.l d0,-(sp)
    45d4:	2f2f 01d0      	move.l 464(sp),-(sp)
    45d8:	2f2f 0056      	move.l 86(sp),-(sp)
    45dc:	4eba 24c8      	jsr 6aa6 <TestRow>(pc)
    45e0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    45e4:	722a           	moveq #42,d1
    45e6:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    45ea:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    45ee:	222f 0196      	move.l 406(sp),d1
    45f2:	2001           	move.l d1,d0
    45f4:	d080           	add.l d0,d0
    45f6:	d081           	add.l d1,d0
    45f8:	2200           	move.l d0,d1
    45fa:	e789           	lsl.l #3,d1
    45fc:	2041           	movea.l d1,a0
    45fe:	91c0           	suba.l d0,a0
    4600:	41e8 001a      	lea 26(a0),a0
    4604:	7000           	moveq #0,d0
    4606:	302f 01c6      	move.w 454(sp),d0
    460a:	2f08           	move.l a0,-(sp)
    460c:	2f00           	move.l d0,-(sp)
    460e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4612:	2f2f 0056      	move.l 86(sp),-(sp)
    4616:	4eba 248e      	jsr 6aa6 <TestRow>(pc)
    461a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    461e:	702a           	moveq #42,d0
    4620:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    4624:	222f 0196      	move.l 406(sp),d1
    4628:	2001           	move.l d1,d0
    462a:	d080           	add.l d0,d0
    462c:	d081           	add.l d1,d0
    462e:	2200           	move.l d0,d1
    4630:	e789           	lsl.l #3,d1
    4632:	2041           	movea.l d1,a0
    4634:	91c0           	suba.l d0,a0
    4636:	41e8 001b      	lea 27(a0),a0
    463a:	7000           	moveq #0,d0
    463c:	302f 01c6      	move.w 454(sp),d0
    4640:	2f08           	move.l a0,-(sp)
    4642:	2f00           	move.l d0,-(sp)
    4644:	2f2f 01d0      	move.l 464(sp),-(sp)
    4648:	2f2f 0056      	move.l 86(sp),-(sp)
    464c:	4eba 2458      	jsr 6aa6 <TestRow>(pc)
    4650:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4654:	722a           	moveq #42,d1
    4656:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    465a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    465e:	222f 0196      	move.l 406(sp),d1
    4662:	2001           	move.l d1,d0
    4664:	d080           	add.l d0,d0
    4666:	d081           	add.l d1,d0
    4668:	2200           	move.l d0,d1
    466a:	e789           	lsl.l #3,d1
    466c:	2041           	movea.l d1,a0
    466e:	91c0           	suba.l d0,a0
    4670:	41e8 001c      	lea 28(a0),a0
    4674:	7000           	moveq #0,d0
    4676:	302f 01c6      	move.w 454(sp),d0
    467a:	2f08           	move.l a0,-(sp)
    467c:	2f00           	move.l d0,-(sp)
    467e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4682:	2f2f 0056      	move.l 86(sp),-(sp)
    4686:	4eba 241e      	jsr 6aa6 <TestRow>(pc)
    468a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    468e:	702a           	moveq #42,d0
    4690:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4694:	222f 0196      	move.l 406(sp),d1
    4698:	2001           	move.l d1,d0
    469a:	d080           	add.l d0,d0
    469c:	d081           	add.l d1,d0
    469e:	2200           	move.l d0,d1
    46a0:	e789           	lsl.l #3,d1
    46a2:	2041           	movea.l d1,a0
    46a4:	91c0           	suba.l d0,a0
    46a6:	41e8 001d      	lea 29(a0),a0
    46aa:	7000           	moveq #0,d0
    46ac:	302f 01c6      	move.w 454(sp),d0
    46b0:	2f08           	move.l a0,-(sp)
    46b2:	2f00           	move.l d0,-(sp)
    46b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    46b8:	2f2f 0056      	move.l 86(sp),-(sp)
    46bc:	4eba 23e8      	jsr 6aa6 <TestRow>(pc)
    46c0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46c4:	722a           	moveq #42,d1
    46c6:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    46ca:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    46ce:	222f 0196      	move.l 406(sp),d1
    46d2:	2001           	move.l d1,d0
    46d4:	d080           	add.l d0,d0
    46d6:	d081           	add.l d1,d0
    46d8:	2200           	move.l d0,d1
    46da:	e789           	lsl.l #3,d1
    46dc:	2041           	movea.l d1,a0
    46de:	91c0           	suba.l d0,a0
    46e0:	41e8 001c      	lea 28(a0),a0
    46e4:	7000           	moveq #0,d0
    46e6:	302f 01c6      	move.w 454(sp),d0
    46ea:	2f08           	move.l a0,-(sp)
    46ec:	2f00           	move.l d0,-(sp)
    46ee:	2f2f 01d0      	move.l 464(sp),-(sp)
    46f2:	2f2f 0056      	move.l 86(sp),-(sp)
    46f6:	4eba 23ae      	jsr 6aa6 <TestRow>(pc)
    46fa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46fe:	702a           	moveq #42,d0
    4700:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4704:	222f 0196      	move.l 406(sp),d1
    4708:	2001           	move.l d1,d0
    470a:	d080           	add.l d0,d0
    470c:	d081           	add.l d1,d0
    470e:	2200           	move.l d0,d1
    4710:	e789           	lsl.l #3,d1
    4712:	2041           	movea.l d1,a0
    4714:	91c0           	suba.l d0,a0
    4716:	41e8 001d      	lea 29(a0),a0
    471a:	7000           	moveq #0,d0
    471c:	302f 01c6      	move.w 454(sp),d0
    4720:	2f08           	move.l a0,-(sp)
    4722:	2f00           	move.l d0,-(sp)
    4724:	2f2f 01d0      	move.l 464(sp),-(sp)
    4728:	2f2f 0056      	move.l 86(sp),-(sp)
    472c:	4eba 2378      	jsr 6aa6 <TestRow>(pc)
    4730:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4734:	722a           	moveq #42,d1
    4736:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    473a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    473e:	52af 0196      	addq.l #1,406(sp)
    4742:	700b           	moveq #11,d0
    4744:	b0af 0196      	cmp.l 406(sp),d0
    4748:	6c00 fde4      	bge.w 452e <TestZoom4Picture+0x8ea>
  }

  TestRow( valsupposed, valactual, mask, 269);
    474c:	7000           	moveq #0,d0
    474e:	302f 01c6      	move.w 454(sp),d0
    4752:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4756:	2f00           	move.l d0,-(sp)
    4758:	2f2f 01d0      	move.l 464(sp),-(sp)
    475c:	2f2f 0056      	move.l 86(sp),-(sp)
    4760:	4eba 2344      	jsr 6aa6 <TestRow>(pc)
    4764:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4768:	722a           	moveq #42,d1
    476a:	d3af 01c8      	add.l d1,456(sp)
  
  tmp = source;
    476e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4774:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    477a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    4780:	4878 0001      	pea 1 <_start+0x1>
    4784:	4878 0004      	pea 4 <_start+0x4>
    4788:	2f2f 0056      	move.l 86(sp),-(sp)
    478c:	2f2f 006a      	move.l 106(sp),-(sp)
    4790:	4eba d262      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    4794:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4798:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    479e:	2c40           	movea.l d0,a6
    47a0:	4eae ff1c      	jsr -228(a6)

  valactual = destination+2; 
    47a4:	202f 004e      	move.l 78(sp),d0
    47a8:	5880           	addq.l #4,d0
    47aa:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom5;
    47ae:	2f7c 0000 bad8 	move.l #47832,74(sp)
    47b4:	004a 
  mask = 0x0000;
    47b6:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<13;i2++) {  
    47ba:	42af 018e      	clr.l 398(sp)
    47be:	602a           	bra.s 47ea <TestZoom4Picture+0xba6>
    TestRow( valsupposed, valactual, mask, i2);
    47c0:	7000           	moveq #0,d0
    47c2:	302f 01c6      	move.w 454(sp),d0
    47c6:	2f2f 018e      	move.l 398(sp),-(sp)
    47ca:	2f00           	move.l d0,-(sp)
    47cc:	2f2f 01d0      	move.l 464(sp),-(sp)
    47d0:	2f2f 0056      	move.l 86(sp),-(sp)
    47d4:	4eba 22d0      	jsr 6aa6 <TestRow>(pc)
    47d8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    47dc:	722a           	moveq #42,d1
    47de:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    47e2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    47e6:	52af 018e      	addq.l #1,398(sp)
    47ea:	700c           	moveq #12,d0
    47ec:	b0af 018e      	cmp.l 398(sp),d0
    47f0:	6cce           	bge.s 47c0 <TestZoom4Picture+0xb7c>
  }

  TestRow( valsupposed, valactual, mask, 12);   
    47f2:	7000           	moveq #0,d0
    47f4:	302f 01c6      	move.w 454(sp),d0
    47f8:	4878 000c      	pea c <_start+0xc>
    47fc:	2f00           	move.l d0,-(sp)
    47fe:	2f2f 01d0      	move.l 464(sp),-(sp)
    4802:	2f2f 0056      	move.l 86(sp),-(sp)
    4806:	4eba 229e      	jsr 6aa6 <TestRow>(pc)
    480a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    480e:	722a           	moveq #42,d1
    4810:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 13);
    4814:	7000           	moveq #0,d0
    4816:	302f 01c6      	move.w 454(sp),d0
    481a:	4878 000d      	pea d <_start+0xd>
    481e:	2f00           	move.l d0,-(sp)
    4820:	2f2f 01d0      	move.l 464(sp),-(sp)
    4824:	2f2f 0056      	move.l 86(sp),-(sp)
    4828:	4eba 227c      	jsr 6aa6 <TestRow>(pc)
    482c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4830:	702a           	moveq #42,d0
    4832:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4836:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 14);
    483a:	7000           	moveq #0,d0
    483c:	302f 01c6      	move.w 454(sp),d0
    4840:	4878 000e      	pea e <_start+0xe>
    4844:	2f00           	move.l d0,-(sp)
    4846:	2f2f 01d0      	move.l 464(sp),-(sp)
    484a:	2f2f 0056      	move.l 86(sp),-(sp)
    484e:	4eba 2256      	jsr 6aa6 <TestRow>(pc)
    4852:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4856:	722a           	moveq #42,d1
    4858:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 15);
    485c:	7000           	moveq #0,d0
    485e:	302f 01c6      	move.w 454(sp),d0
    4862:	4878 000f      	pea f <_start+0xf>
    4866:	2f00           	move.l d0,-(sp)
    4868:	2f2f 01d0      	move.l 464(sp),-(sp)
    486c:	2f2f 0056      	move.l 86(sp),-(sp)
    4870:	4eba 2234      	jsr 6aa6 <TestRow>(pc)
    4874:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4878:	702a           	moveq #42,d0
    487a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    487e:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 16);
    4882:	7000           	moveq #0,d0
    4884:	302f 01c6      	move.w 454(sp),d0
    4888:	4878 0010      	pea 10 <_start+0x10>
    488c:	2f00           	move.l d0,-(sp)
    488e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4892:	2f2f 0056      	move.l 86(sp),-(sp)
    4896:	4eba 220e      	jsr 6aa6 <TestRow>(pc)
    489a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    489e:	722a           	moveq #42,d1
    48a0:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 17);
    48a4:	7000           	moveq #0,d0
    48a6:	302f 01c6      	move.w 454(sp),d0
    48aa:	4878 0011      	pea 11 <_start+0x11>
    48ae:	2f00           	move.l d0,-(sp)
    48b0:	2f2f 01d0      	move.l 464(sp),-(sp)
    48b4:	2f2f 0056      	move.l 86(sp),-(sp)
    48b8:	4eba 21ec      	jsr 6aa6 <TestRow>(pc)
    48bc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48c0:	702a           	moveq #42,d0
    48c2:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    48c6:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 18);
    48ca:	7000           	moveq #0,d0
    48cc:	302f 01c6      	move.w 454(sp),d0
    48d0:	4878 0012      	pea 12 <_start+0x12>
    48d4:	2f00           	move.l d0,-(sp)
    48d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    48da:	2f2f 0056      	move.l 86(sp),-(sp)
    48de:	4eba 21c6      	jsr 6aa6 <TestRow>(pc)
    48e2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48e6:	722a           	moveq #42,d1
    48e8:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 19);
    48ec:	7000           	moveq #0,d0
    48ee:	302f 01c6      	move.w 454(sp),d0
    48f2:	4878 0013      	pea 13 <_start+0x13>
    48f6:	2f00           	move.l d0,-(sp)
    48f8:	2f2f 01d0      	move.l 464(sp),-(sp)
    48fc:	2f2f 0056      	move.l 86(sp),-(sp)
    4900:	4eba 21a4      	jsr 6aa6 <TestRow>(pc)
    4904:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4908:	702a           	moveq #42,d0
    490a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    490e:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 20);
    4912:	7000           	moveq #0,d0
    4914:	302f 01c6      	move.w 454(sp),d0
    4918:	4878 0014      	pea 14 <_start+0x14>
    491c:	2f00           	move.l d0,-(sp)
    491e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4922:	2f2f 0056      	move.l 86(sp),-(sp)
    4926:	4eba 217e      	jsr 6aa6 <TestRow>(pc)
    492a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    492e:	722a           	moveq #42,d1
    4930:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 21);
    4934:	7000           	moveq #0,d0
    4936:	302f 01c6      	move.w 454(sp),d0
    493a:	4878 0015      	pea 15 <_start+0x15>
    493e:	2f00           	move.l d0,-(sp)
    4940:	2f2f 01d0      	move.l 464(sp),-(sp)
    4944:	2f2f 0056      	move.l 86(sp),-(sp)
    4948:	4eba 215c      	jsr 6aa6 <TestRow>(pc)
    494c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4950:	702a           	moveq #42,d0
    4952:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4956:	466f 01c6      	not.w 454(sp)


  for(int i=0;i<10;i++) {
    495a:	42af 018a      	clr.l 394(sp)
    495e:	6000 0286      	bra.w 4be6 <TestZoom4Picture+0xfa2>
    for(int i2=0;i2<13;i2++) {  
    4962:	42af 0186      	clr.l 390(sp)
    4966:	6042           	bra.s 49aa <TestZoom4Picture+0xd66>
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    4968:	222f 018a      	move.l 394(sp),d1
    496c:	2001           	move.l d1,d0
    496e:	d080           	add.l d0,d0
    4970:	d081           	add.l d1,d0
    4972:	2200           	move.l d0,d1
    4974:	e789           	lsl.l #3,d1
    4976:	9280           	sub.l d0,d1
    4978:	2041           	movea.l d1,a0
    497a:	d1ef 0186      	adda.l 390(sp),a0
    497e:	41e8 0016      	lea 22(a0),a0
    4982:	7000           	moveq #0,d0
    4984:	302f 01c6      	move.w 454(sp),d0
    4988:	2f08           	move.l a0,-(sp)
    498a:	2f00           	move.l d0,-(sp)
    498c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4990:	2f2f 0056      	move.l 86(sp),-(sp)
    4994:	4eba 2110      	jsr 6aa6 <TestRow>(pc)
    4998:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    499c:	722a           	moveq #42,d1
    499e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    49a2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {  
    49a6:	52af 0186      	addq.l #1,390(sp)
    49aa:	700c           	moveq #12,d0
    49ac:	b0af 0186      	cmp.l 390(sp),d0
    49b0:	6cb6           	bge.s 4968 <TestZoom4Picture+0xd24>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    49b2:	222f 018a      	move.l 394(sp),d1
    49b6:	2001           	move.l d1,d0
    49b8:	d080           	add.l d0,d0
    49ba:	d081           	add.l d1,d0
    49bc:	2200           	move.l d0,d1
    49be:	e789           	lsl.l #3,d1
    49c0:	2041           	movea.l d1,a0
    49c2:	91c0           	suba.l d0,a0
    49c4:	41e8 0023      	lea 35(a0),a0
    49c8:	7000           	moveq #0,d0
    49ca:	302f 01c6      	move.w 454(sp),d0
    49ce:	2f08           	move.l a0,-(sp)
    49d0:	2f00           	move.l d0,-(sp)
    49d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    49d6:	2f2f 0056      	move.l 86(sp),-(sp)
    49da:	4eba 20ca      	jsr 6aa6 <TestRow>(pc)
    49de:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    49e2:	722a           	moveq #42,d1
    49e4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    49e8:	222f 018a      	move.l 394(sp),d1
    49ec:	2001           	move.l d1,d0
    49ee:	d080           	add.l d0,d0
    49f0:	d081           	add.l d1,d0
    49f2:	2200           	move.l d0,d1
    49f4:	e789           	lsl.l #3,d1
    49f6:	2041           	movea.l d1,a0
    49f8:	91c0           	suba.l d0,a0
    49fa:	41e8 0024      	lea 36(a0),a0
    49fe:	7000           	moveq #0,d0
    4a00:	302f 01c6      	move.w 454(sp),d0
    4a04:	2f08           	move.l a0,-(sp)
    4a06:	2f00           	move.l d0,-(sp)
    4a08:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a0c:	2f2f 0056      	move.l 86(sp),-(sp)
    4a10:	4eba 2094      	jsr 6aa6 <TestRow>(pc)
    4a14:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a18:	702a           	moveq #42,d0
    4a1a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4a1e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    4a22:	222f 018a      	move.l 394(sp),d1
    4a26:	2001           	move.l d1,d0
    4a28:	d080           	add.l d0,d0
    4a2a:	d081           	add.l d1,d0
    4a2c:	2200           	move.l d0,d1
    4a2e:	e789           	lsl.l #3,d1
    4a30:	2041           	movea.l d1,a0
    4a32:	91c0           	suba.l d0,a0
    4a34:	41e8 0025      	lea 37(a0),a0
    4a38:	7000           	moveq #0,d0
    4a3a:	302f 01c6      	move.w 454(sp),d0
    4a3e:	2f08           	move.l a0,-(sp)
    4a40:	2f00           	move.l d0,-(sp)
    4a42:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a46:	2f2f 0056      	move.l 86(sp),-(sp)
    4a4a:	4eba 205a      	jsr 6aa6 <TestRow>(pc)
    4a4e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a52:	722a           	moveq #42,d1
    4a54:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    4a58:	222f 018a      	move.l 394(sp),d1
    4a5c:	2001           	move.l d1,d0
    4a5e:	d080           	add.l d0,d0
    4a60:	d081           	add.l d1,d0
    4a62:	2200           	move.l d0,d1
    4a64:	e789           	lsl.l #3,d1
    4a66:	2041           	movea.l d1,a0
    4a68:	91c0           	suba.l d0,a0
    4a6a:	41e8 0026      	lea 38(a0),a0
    4a6e:	7000           	moveq #0,d0
    4a70:	302f 01c6      	move.w 454(sp),d0
    4a74:	2f08           	move.l a0,-(sp)
    4a76:	2f00           	move.l d0,-(sp)
    4a78:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a7c:	2f2f 0056      	move.l 86(sp),-(sp)
    4a80:	4eba 2024      	jsr 6aa6 <TestRow>(pc)
    4a84:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a88:	702a           	moveq #42,d0
    4a8a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4a8e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    4a92:	222f 018a      	move.l 394(sp),d1
    4a96:	2001           	move.l d1,d0
    4a98:	d080           	add.l d0,d0
    4a9a:	d081           	add.l d1,d0
    4a9c:	2200           	move.l d0,d1
    4a9e:	e789           	lsl.l #3,d1
    4aa0:	2041           	movea.l d1,a0
    4aa2:	91c0           	suba.l d0,a0
    4aa4:	41e8 0027      	lea 39(a0),a0
    4aa8:	7000           	moveq #0,d0
    4aaa:	302f 01c6      	move.w 454(sp),d0
    4aae:	2f08           	move.l a0,-(sp)
    4ab0:	2f00           	move.l d0,-(sp)
    4ab2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ab6:	2f2f 0056      	move.l 86(sp),-(sp)
    4aba:	4eba 1fea      	jsr 6aa6 <TestRow>(pc)
    4abe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ac2:	722a           	moveq #42,d1
    4ac4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    4ac8:	222f 018a      	move.l 394(sp),d1
    4acc:	2001           	move.l d1,d0
    4ace:	d080           	add.l d0,d0
    4ad0:	d081           	add.l d1,d0
    4ad2:	2200           	move.l d0,d1
    4ad4:	e789           	lsl.l #3,d1
    4ad6:	2041           	movea.l d1,a0
    4ad8:	91c0           	suba.l d0,a0
    4ada:	41e8 0028      	lea 40(a0),a0
    4ade:	7000           	moveq #0,d0
    4ae0:	302f 01c6      	move.w 454(sp),d0
    4ae4:	2f08           	move.l a0,-(sp)
    4ae6:	2f00           	move.l d0,-(sp)
    4ae8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4aec:	2f2f 0056      	move.l 86(sp),-(sp)
    4af0:	4eba 1fb4      	jsr 6aa6 <TestRow>(pc)
    4af4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4af8:	702a           	moveq #42,d0
    4afa:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4afe:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    4b02:	222f 018a      	move.l 394(sp),d1
    4b06:	2001           	move.l d1,d0
    4b08:	d080           	add.l d0,d0
    4b0a:	d081           	add.l d1,d0
    4b0c:	2200           	move.l d0,d1
    4b0e:	e789           	lsl.l #3,d1
    4b10:	2041           	movea.l d1,a0
    4b12:	91c0           	suba.l d0,a0
    4b14:	41e8 0029      	lea 41(a0),a0
    4b18:	7000           	moveq #0,d0
    4b1a:	302f 01c6      	move.w 454(sp),d0
    4b1e:	2f08           	move.l a0,-(sp)
    4b20:	2f00           	move.l d0,-(sp)
    4b22:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b26:	2f2f 0056      	move.l 86(sp),-(sp)
    4b2a:	4eba 1f7a      	jsr 6aa6 <TestRow>(pc)
    4b2e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b32:	722a           	moveq #42,d1
    4b34:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    4b38:	222f 018a      	move.l 394(sp),d1
    4b3c:	2001           	move.l d1,d0
    4b3e:	d080           	add.l d0,d0
    4b40:	d081           	add.l d1,d0
    4b42:	2200           	move.l d0,d1
    4b44:	e789           	lsl.l #3,d1
    4b46:	2041           	movea.l d1,a0
    4b48:	91c0           	suba.l d0,a0
    4b4a:	41e8 002a      	lea 42(a0),a0
    4b4e:	7000           	moveq #0,d0
    4b50:	302f 01c6      	move.w 454(sp),d0
    4b54:	2f08           	move.l a0,-(sp)
    4b56:	2f00           	move.l d0,-(sp)
    4b58:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b5c:	2f2f 0056      	move.l 86(sp),-(sp)
    4b60:	4eba 1f44      	jsr 6aa6 <TestRow>(pc)
    4b64:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b68:	702a           	moveq #42,d0
    4b6a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b6e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    4b72:	222f 018a      	move.l 394(sp),d1
    4b76:	2001           	move.l d1,d0
    4b78:	d080           	add.l d0,d0
    4b7a:	d081           	add.l d1,d0
    4b7c:	2200           	move.l d0,d1
    4b7e:	e789           	lsl.l #3,d1
    4b80:	2041           	movea.l d1,a0
    4b82:	91c0           	suba.l d0,a0
    4b84:	41e8 002b      	lea 43(a0),a0
    4b88:	7000           	moveq #0,d0
    4b8a:	302f 01c6      	move.w 454(sp),d0
    4b8e:	2f08           	move.l a0,-(sp)
    4b90:	2f00           	move.l d0,-(sp)
    4b92:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b96:	2f2f 0056      	move.l 86(sp),-(sp)
    4b9a:	4eba 1f0a      	jsr 6aa6 <TestRow>(pc)
    4b9e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ba2:	722a           	moveq #42,d1
    4ba4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    4ba8:	222f 018a      	move.l 394(sp),d1
    4bac:	2001           	move.l d1,d0
    4bae:	d080           	add.l d0,d0
    4bb0:	d081           	add.l d1,d0
    4bb2:	2200           	move.l d0,d1
    4bb4:	e789           	lsl.l #3,d1
    4bb6:	2041           	movea.l d1,a0
    4bb8:	91c0           	suba.l d0,a0
    4bba:	41e8 002c      	lea 44(a0),a0
    4bbe:	7000           	moveq #0,d0
    4bc0:	302f 01c6      	move.w 454(sp),d0
    4bc4:	2f08           	move.l a0,-(sp)
    4bc6:	2f00           	move.l d0,-(sp)
    4bc8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bcc:	2f2f 0056      	move.l 86(sp),-(sp)
    4bd0:	4eba 1ed4      	jsr 6aa6 <TestRow>(pc)
    4bd4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4bd8:	702a           	moveq #42,d0
    4bda:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4bde:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<10;i++) {
    4be2:	52af 018a      	addq.l #1,394(sp)
    4be6:	7209           	moveq #9,d1
    4be8:	b2af 018a      	cmp.l 394(sp),d1
    4bec:	6c00 fd74      	bge.w 4962 <TestZoom4Picture+0xd1e>
  }

  for(int i2=0;i2<13;i2++) {  
    4bf0:	42af 0182      	clr.l 386(sp)
    4bf4:	6032           	bra.s 4c28 <TestZoom4Picture+0xfe4>
    TestRow( valsupposed, valactual, mask, i2+253);
    4bf6:	222f 0182      	move.l 386(sp),d1
    4bfa:	0681 0000 00fd 	addi.l #253,d1
    4c00:	7000           	moveq #0,d0
    4c02:	302f 01c6      	move.w 454(sp),d0
    4c06:	2f01           	move.l d1,-(sp)
    4c08:	2f00           	move.l d0,-(sp)
    4c0a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c0e:	2f2f 0056      	move.l 86(sp),-(sp)
    4c12:	4eba 1e92      	jsr 6aa6 <TestRow>(pc)
    4c16:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c1a:	702a           	moveq #42,d0
    4c1c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c20:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4c24:	52af 0182      	addq.l #1,386(sp)
    4c28:	720c           	moveq #12,d1
    4c2a:	b2af 0182      	cmp.l 386(sp),d1
    4c2e:	6cc6           	bge.s 4bf6 <TestZoom4Picture+0xfb2>
  }

  TestRow( valsupposed, valactual, mask, 266);
    4c30:	7000           	moveq #0,d0
    4c32:	302f 01c6      	move.w 454(sp),d0
    4c36:	4878 010a      	pea 10a <FreeDisplay+0x2a>
    4c3a:	2f00           	move.l d0,-(sp)
    4c3c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c40:	2f2f 0056      	move.l 86(sp),-(sp)
    4c44:	4eba 1e60      	jsr 6aa6 <TestRow>(pc)
    4c48:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4c4c:	702a           	moveq #42,d0
    4c4e:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 267);
    4c52:	7000           	moveq #0,d0
    4c54:	302f 01c6      	move.w 454(sp),d0
    4c58:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    4c5c:	2f00           	move.l d0,-(sp)
    4c5e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c62:	2f2f 0056      	move.l 86(sp),-(sp)
    4c66:	4eba 1e3e      	jsr 6aa6 <TestRow>(pc)
    4c6a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4c6e:	722a           	moveq #42,d1
    4c70:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4c74:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 268);
    4c78:	7000           	moveq #0,d0
    4c7a:	302f 01c6      	move.w 454(sp),d0
    4c7e:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    4c82:	2f00           	move.l d0,-(sp)
    4c84:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c88:	2f2f 0056      	move.l 86(sp),-(sp)
    4c8c:	4eba 1e18      	jsr 6aa6 <TestRow>(pc)
    4c90:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4c94:	702a           	moveq #42,d0
    4c96:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 269);
    4c9a:	7000           	moveq #0,d0
    4c9c:	302f 01c6      	move.w 454(sp),d0
    4ca0:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4ca4:	2f00           	move.l d0,-(sp)
    4ca6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4caa:	2f2f 0056      	move.l 86(sp),-(sp)
    4cae:	4eba 1df6      	jsr 6aa6 <TestRow>(pc)
    4cb2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4cb6:	722a           	moveq #42,d1
    4cb8:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4cbc:	466f 01c6      	not.w 454(sp)

  tmp = source;
    4cc0:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4cc6:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4ccc:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    4cd2:	4878 0001      	pea 1 <_start+0x1>
    4cd6:	4878 0005      	pea 5 <_start+0x5>
    4cda:	2f2f 0056      	move.l 86(sp),-(sp)
    4cde:	2f2f 006a      	move.l 106(sp),-(sp)
    4ce2:	4eba cd10      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    4ce6:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4cea:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    4cf0:	2c40           	movea.l d0,a6
    4cf2:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4cf6:	202f 004e      	move.l 78(sp),d0
    4cfa:	5880           	addq.l #4,d0
    4cfc:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom6;
    4d00:	2f7c 0000 bb04 	move.l #47876,74(sp)
    4d06:	004a 
  mask = 0x0000;
    4d08:	426f 01c6      	clr.w 454(sp)
 
  for(int i2=0;i2<7;i2++) {  
    4d0c:	42af 017e      	clr.l 382(sp)
    4d10:	602a           	bra.s 4d3c <TestZoom4Picture+0x10f8>
    TestRow( valsupposed, valactual, mask, i2);
    4d12:	7000           	moveq #0,d0
    4d14:	302f 01c6      	move.w 454(sp),d0
    4d18:	2f2f 017e      	move.l 382(sp),-(sp)
    4d1c:	2f00           	move.l d0,-(sp)
    4d1e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d22:	2f2f 0056      	move.l 86(sp),-(sp)
    4d26:	4eba 1d7e      	jsr 6aa6 <TestRow>(pc)
    4d2a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d2e:	722a           	moveq #42,d1
    4d30:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4d34:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    4d38:	52af 017e      	addq.l #1,382(sp)
    4d3c:	7006           	moveq #6,d0
    4d3e:	b0af 017e      	cmp.l 382(sp),d0
    4d42:	6cce           	bge.s 4d12 <TestZoom4Picture+0x10ce>
  }

  for(int i=0;i<6;i++) {
    4d44:	42af 017a      	clr.l 378(sp)
    4d48:	605c           	bra.s 4da6 <TestZoom4Picture+0x1162>
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    4d4a:	202f 017a      	move.l 378(sp),d0
    4d4e:	d080           	add.l d0,d0
    4d50:	2200           	move.l d0,d1
    4d52:	5e81           	addq.l #7,d1
    4d54:	7000           	moveq #0,d0
    4d56:	302f 01c6      	move.w 454(sp),d0
    4d5a:	2f01           	move.l d1,-(sp)
    4d5c:	2f00           	move.l d0,-(sp)
    4d5e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d62:	2f2f 0056      	move.l 86(sp),-(sp)
    4d66:	4eba 1d3e      	jsr 6aa6 <TestRow>(pc)
    4d6a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d6e:	722a           	moveq #42,d1
    4d70:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    4d74:	202f 017a      	move.l 378(sp),d0
    4d78:	5880           	addq.l #4,d0
    4d7a:	d080           	add.l d0,d0
    4d7c:	2200           	move.l d0,d1
    4d7e:	7000           	moveq #0,d0
    4d80:	302f 01c6      	move.w 454(sp),d0
    4d84:	2f01           	move.l d1,-(sp)
    4d86:	2f00           	move.l d0,-(sp)
    4d88:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d8c:	2f2f 0056      	move.l 86(sp),-(sp)
    4d90:	4eba 1d14      	jsr 6aa6 <TestRow>(pc)
    4d94:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d98:	702a           	moveq #42,d0
    4d9a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4d9e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<6;i++) {
    4da2:	52af 017a      	addq.l #1,378(sp)
    4da6:	7205           	moveq #5,d1
    4da8:	b2af 017a      	cmp.l 378(sp),d1
    4dac:	6c9c           	bge.s 4d4a <TestZoom4Picture+0x1106>
  }

  for(int i=0;i<10;i++) {
    4dae:	42af 0176      	clr.l 374(sp)
    4db2:	6000 00ce      	bra.w 4e82 <TestZoom4Picture+0x123e>
    for(int i2=0;i2<12;i2++) {  
    4db6:	42af 0172      	clr.l 370(sp)
    4dba:	6040           	bra.s 4dfc <TestZoom4Picture+0x11b8>
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    4dbc:	307c 0013      	movea.w #19,a0
    4dc0:	d1ef 0172      	adda.l 370(sp),a0
    4dc4:	222f 0176      	move.l 374(sp),d1
    4dc8:	2001           	move.l d1,d0
    4dca:	d080           	add.l d0,d0
    4dcc:	d081           	add.l d1,d0
    4dce:	e788           	lsl.l #3,d0
    4dd0:	2208           	move.l a0,d1
    4dd2:	d280           	add.l d0,d1
    4dd4:	7000           	moveq #0,d0
    4dd6:	302f 01c6      	move.w 454(sp),d0
    4dda:	2f01           	move.l d1,-(sp)
    4ddc:	2f00           	move.l d0,-(sp)
    4dde:	2f2f 01d0      	move.l 464(sp),-(sp)
    4de2:	2f2f 0056      	move.l 86(sp),-(sp)
    4de6:	4eba 1cbe      	jsr 6aa6 <TestRow>(pc)
    4dea:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4dee:	702a           	moveq #42,d0
    4df0:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4df4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {  
    4df8:	52af 0172      	addq.l #1,370(sp)
    4dfc:	720b           	moveq #11,d1
    4dfe:	b2af 0172      	cmp.l 370(sp),d1
    4e02:	6cb8           	bge.s 4dbc <TestZoom4Picture+0x1178>
    }
    for(int i=0;i<6;i++) {
    4e04:	42af 016e      	clr.l 366(sp)
    4e08:	606c           	bra.s 4e76 <TestZoom4Picture+0x1232>
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    4e0a:	222f 016e      	move.l 366(sp),d1
    4e0e:	2001           	move.l d1,d0
    4e10:	d080           	add.l d0,d0
    4e12:	d081           	add.l d1,d0
    4e14:	e788           	lsl.l #3,d0
    4e16:	2040           	movea.l d0,a0
    4e18:	41e8 001f      	lea 31(a0),a0
    4e1c:	7000           	moveq #0,d0
    4e1e:	302f 01c6      	move.w 454(sp),d0
    4e22:	2f08           	move.l a0,-(sp)
    4e24:	2f00           	move.l d0,-(sp)
    4e26:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e2a:	2f2f 0056      	move.l 86(sp),-(sp)
    4e2e:	4eba 1c76      	jsr 6aa6 <TestRow>(pc)
    4e32:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4e36:	702a           	moveq #42,d0
    4e38:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    4e3c:	222f 016e      	move.l 366(sp),d1
    4e40:	2001           	move.l d1,d0
    4e42:	d080           	add.l d0,d0
    4e44:	d081           	add.l d1,d0
    4e46:	e788           	lsl.l #3,d0
    4e48:	2040           	movea.l d0,a0
    4e4a:	41e8 0020      	lea 32(a0),a0
    4e4e:	7000           	moveq #0,d0
    4e50:	302f 01c6      	move.w 454(sp),d0
    4e54:	2f08           	move.l a0,-(sp)
    4e56:	2f00           	move.l d0,-(sp)
    4e58:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e5c:	2f2f 0056      	move.l 86(sp),-(sp)
    4e60:	4eba 1c44      	jsr 6aa6 <TestRow>(pc)
    4e64:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4e68:	722a           	moveq #42,d1
    4e6a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4e6e:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<6;i++) {
    4e72:	52af 016e      	addq.l #1,366(sp)
    4e76:	7005           	moveq #5,d0
    4e78:	b0af 016e      	cmp.l 366(sp),d0
    4e7c:	6c8c           	bge.s 4e0a <TestZoom4Picture+0x11c6>
  for(int i=0;i<10;i++) {
    4e7e:	52af 0176      	addq.l #1,374(sp)
    4e82:	7209           	moveq #9,d1
    4e84:	b2af 0176      	cmp.l 374(sp),d1
    4e88:	6c00 ff2c      	bge.w 4db6 <TestZoom4Picture+0x1172>
    }
  }

  for(int i2=0;i2<11;i2++) {  
    4e8c:	42af 016a      	clr.l 362(sp)
    4e90:	6032           	bra.s 4ec4 <TestZoom4Picture+0x1280>
    TestRow( valsupposed, valactual, mask, 258+i2);
    4e92:	222f 016a      	move.l 362(sp),d1
    4e96:	0681 0000 0102 	addi.l #258,d1
    4e9c:	7000           	moveq #0,d0
    4e9e:	302f 01c6      	move.w 454(sp),d0
    4ea2:	2f01           	move.l d1,-(sp)
    4ea4:	2f00           	move.l d0,-(sp)
    4ea6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4eaa:	2f2f 0056      	move.l 86(sp),-(sp)
    4eae:	4eba 1bf6      	jsr 6aa6 <TestRow>(pc)
    4eb2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4eb6:	702a           	moveq #42,d0
    4eb8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4ebc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {  
    4ec0:	52af 016a      	addq.l #1,362(sp)
    4ec4:	720a           	moveq #10,d1
    4ec6:	b2af 016a      	cmp.l 362(sp),d1
    4eca:	6cc6           	bge.s 4e92 <TestZoom4Picture+0x124e>
  }

  tmp = source;
    4ecc:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4ed2:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4ed8:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    4ede:	4878 0001      	pea 1 <_start+0x1>
    4ee2:	4878 0006      	pea 6 <_start+0x6>
    4ee6:	2f2f 0056      	move.l 86(sp),-(sp)
    4eea:	2f2f 006a      	move.l 106(sp),-(sp)
    4eee:	4eba cb04      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    4ef2:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4ef6:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    4efc:	2c40           	movea.l d0,a6
    4efe:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4f02:	202f 004e      	move.l 78(sp),d0
    4f06:	5880           	addq.l #4,d0
    4f08:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom7;
    4f0c:	2f7c 0000 bb30 	move.l #47920,74(sp)
    4f12:	004a 
  mask = 0x0000;
    4f14:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    4f18:	7000           	moveq #0,d0
    4f1a:	302f 01c6      	move.w 454(sp),d0
    4f1e:	42a7           	clr.l -(sp)
    4f20:	2f00           	move.l d0,-(sp)
    4f22:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f26:	2f2f 0056      	move.l 86(sp),-(sp)
    4f2a:	4eba 1b7a      	jsr 6aa6 <TestRow>(pc)
    4f2e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4f32:	722a           	moveq #42,d1
    4f34:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4f38:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    4f3c:	42af 0166      	clr.l 358(sp)
    4f40:	605c           	bra.s 4f9e <TestZoom4Picture+0x135a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    4f42:	202f 0166      	move.l 358(sp),d0
    4f46:	d080           	add.l d0,d0
    4f48:	2200           	move.l d0,d1
    4f4a:	5281           	addq.l #1,d1
    4f4c:	7000           	moveq #0,d0
    4f4e:	302f 01c6      	move.w 454(sp),d0
    4f52:	2f01           	move.l d1,-(sp)
    4f54:	2f00           	move.l d0,-(sp)
    4f56:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f5a:	2f2f 0056      	move.l 86(sp),-(sp)
    4f5e:	4eba 1b46      	jsr 6aa6 <TestRow>(pc)
    4f62:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4f66:	702a           	moveq #42,d0
    4f68:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    4f6c:	202f 0166      	move.l 358(sp),d0
    4f70:	5280           	addq.l #1,d0
    4f72:	d080           	add.l d0,d0
    4f74:	2200           	move.l d0,d1
    4f76:	7000           	moveq #0,d0
    4f78:	302f 01c6      	move.w 454(sp),d0
    4f7c:	2f01           	move.l d1,-(sp)
    4f7e:	2f00           	move.l d0,-(sp)
    4f80:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f84:	2f2f 0056      	move.l 86(sp),-(sp)
    4f88:	4eba 1b1c      	jsr 6aa6 <TestRow>(pc)
    4f8c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4f90:	722a           	moveq #42,d1
    4f92:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4f96:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    4f9a:	52af 0166      	addq.l #1,358(sp)
    4f9e:	7006           	moveq #6,d0
    4fa0:	b0af 0166      	cmp.l 358(sp),d0
    4fa4:	6c9c           	bge.s 4f42 <TestZoom4Picture+0x12fe>
  }

  for(int i=0;i<10;i++) {
    4fa6:	42af 0162      	clr.l 354(sp)
    4faa:	6000 00d4      	bra.w 5080 <TestZoom4Picture+0x143c>
    for(int i2=0;i2<11;i2++) {  
    4fae:	42af 015e      	clr.l 350(sp)
    4fb2:	6042           	bra.s 4ff6 <TestZoom4Picture+0x13b2>
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    4fb4:	307c 000f      	movea.w #15,a0
    4fb8:	d1ef 015e      	adda.l 350(sp),a0
    4fbc:	222f 0162      	move.l 354(sp),d1
    4fc0:	2001           	move.l d1,d0
    4fc2:	d080           	add.l d0,d0
    4fc4:	d081           	add.l d1,d0
    4fc6:	e788           	lsl.l #3,d0
    4fc8:	d081           	add.l d1,d0
    4fca:	2208           	move.l a0,d1
    4fcc:	d280           	add.l d0,d1
    4fce:	7000           	moveq #0,d0
    4fd0:	302f 01c6      	move.w 454(sp),d0
    4fd4:	2f01           	move.l d1,-(sp)
    4fd6:	2f00           	move.l d0,-(sp)
    4fd8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4fdc:	2f2f 0056      	move.l 86(sp),-(sp)
    4fe0:	4eba 1ac4      	jsr 6aa6 <TestRow>(pc)
    4fe4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4fe8:	722a           	moveq #42,d1
    4fea:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4fee:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {  
    4ff2:	52af 015e      	addq.l #1,350(sp)
    4ff6:	700a           	moveq #10,d0
    4ff8:	b0af 015e      	cmp.l 350(sp),d0
    4ffc:	6cb6           	bge.s 4fb4 <TestZoom4Picture+0x1370>
    }
    for(int i=0;i<7;i++) {
    4ffe:	42af 015a      	clr.l 346(sp)
    5002:	6070           	bra.s 5074 <TestZoom4Picture+0x1430>
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    5004:	222f 015a      	move.l 346(sp),d1
    5008:	2001           	move.l d1,d0
    500a:	d080           	add.l d0,d0
    500c:	d081           	add.l d1,d0
    500e:	e788           	lsl.l #3,d0
    5010:	2040           	movea.l d0,a0
    5012:	d1c1           	adda.l d1,a0
    5014:	41e8 001a      	lea 26(a0),a0
    5018:	7000           	moveq #0,d0
    501a:	302f 01c6      	move.w 454(sp),d0
    501e:	2f08           	move.l a0,-(sp)
    5020:	2f00           	move.l d0,-(sp)
    5022:	2f2f 01d0      	move.l 464(sp),-(sp)
    5026:	2f2f 0056      	move.l 86(sp),-(sp)
    502a:	4eba 1a7a      	jsr 6aa6 <TestRow>(pc)
    502e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5032:	722a           	moveq #42,d1
    5034:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    5038:	222f 015a      	move.l 346(sp),d1
    503c:	2001           	move.l d1,d0
    503e:	d080           	add.l d0,d0
    5040:	d081           	add.l d1,d0
    5042:	e788           	lsl.l #3,d0
    5044:	2040           	movea.l d0,a0
    5046:	d1c1           	adda.l d1,a0
    5048:	41e8 001a      	lea 26(a0),a0
    504c:	7000           	moveq #0,d0
    504e:	302f 01c6      	move.w 454(sp),d0
    5052:	2f08           	move.l a0,-(sp)
    5054:	2f00           	move.l d0,-(sp)
    5056:	2f2f 01d0      	move.l 464(sp),-(sp)
    505a:	2f2f 0056      	move.l 86(sp),-(sp)
    505e:	4eba 1a46      	jsr 6aa6 <TestRow>(pc)
    5062:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5066:	702a           	moveq #42,d0
    5068:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    506c:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<7;i++) {
    5070:	52af 015a      	addq.l #1,346(sp)
    5074:	7206           	moveq #6,d1
    5076:	b2af 015a      	cmp.l 346(sp),d1
    507a:	6c88           	bge.s 5004 <TestZoom4Picture+0x13c0>
  for(int i=0;i<10;i++) {
    507c:	52af 0162      	addq.l #1,354(sp)
    5080:	7009           	moveq #9,d0
    5082:	b0af 0162      	cmp.l 354(sp),d0
    5086:	6c00 ff26      	bge.w 4fae <TestZoom4Picture+0x136a>
    }
  }

  for(int i2=0;i2<5;i2++) {  
    508a:	42af 0156      	clr.l 342(sp)
    508e:	6032           	bra.s 50c2 <TestZoom4Picture+0x147e>
    TestRow( valsupposed, valactual, mask, 256+i2);
    5090:	222f 0156      	move.l 342(sp),d1
    5094:	0681 0000 0100 	addi.l #256,d1
    509a:	7000           	moveq #0,d0
    509c:	302f 01c6      	move.w 454(sp),d0
    50a0:	2f01           	move.l d1,-(sp)
    50a2:	2f00           	move.l d0,-(sp)
    50a4:	2f2f 01d0      	move.l 464(sp),-(sp)
    50a8:	2f2f 0056      	move.l 86(sp),-(sp)
    50ac:	4eba 19f8      	jsr 6aa6 <TestRow>(pc)
    50b0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    50b4:	722a           	moveq #42,d1
    50b6:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    50ba:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    50be:	52af 0156      	addq.l #1,342(sp)
    50c2:	7004           	moveq #4,d0
    50c4:	b0af 0156      	cmp.l 342(sp),d0
    50c8:	6cc6           	bge.s 5090 <TestZoom4Picture+0x144c>
  }

  tmp = source;
    50ca:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    50d0:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    50d6:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    50dc:	4878 0001      	pea 1 <_start+0x1>
    50e0:	4878 0007      	pea 7 <_start+0x7>
    50e4:	2f2f 0056      	move.l 86(sp),-(sp)
    50e8:	2f2f 006a      	move.l 106(sp),-(sp)
    50ec:	4eba c906      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    50f0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    50f4:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    50fa:	2c40           	movea.l d0,a6
    50fc:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5100:	222f 004e      	move.l 78(sp),d1
    5104:	5881           	addq.l #4,d1
    5106:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom8;
    510a:	2f7c 0000 bb5c 	move.l #47964,74(sp)
    5110:	004a 
  mask = 0xffff;
    5112:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5118:	7000           	moveq #0,d0
    511a:	302f 01c6      	move.w 454(sp),d0
    511e:	42a7           	clr.l -(sp)
    5120:	2f00           	move.l d0,-(sp)
    5122:	2f2f 01d0      	move.l 464(sp),-(sp)
    5126:	2f2f 0056      	move.l 86(sp),-(sp)
    512a:	4eba 197a      	jsr 6aa6 <TestRow>(pc)
    512e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5132:	702a           	moveq #42,d0
    5134:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5138:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    513c:	42af 0152      	clr.l 338(sp)
    5140:	605c           	bra.s 519e <TestZoom4Picture+0x155a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    5142:	202f 0152      	move.l 338(sp),d0
    5146:	d080           	add.l d0,d0
    5148:	2200           	move.l d0,d1
    514a:	5281           	addq.l #1,d1
    514c:	7000           	moveq #0,d0
    514e:	302f 01c6      	move.w 454(sp),d0
    5152:	2f01           	move.l d1,-(sp)
    5154:	2f00           	move.l d0,-(sp)
    5156:	2f2f 01d0      	move.l 464(sp),-(sp)
    515a:	2f2f 0056      	move.l 86(sp),-(sp)
    515e:	4eba 1946      	jsr 6aa6 <TestRow>(pc)
    5162:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5166:	722a           	moveq #42,d1
    5168:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    516c:	202f 0152      	move.l 338(sp),d0
    5170:	5280           	addq.l #1,d0
    5172:	d080           	add.l d0,d0
    5174:	2200           	move.l d0,d1
    5176:	7000           	moveq #0,d0
    5178:	302f 01c6      	move.w 454(sp),d0
    517c:	2f01           	move.l d1,-(sp)
    517e:	2f00           	move.l d0,-(sp)
    5180:	2f2f 01d0      	move.l 464(sp),-(sp)
    5184:	2f2f 0056      	move.l 86(sp),-(sp)
    5188:	4eba 191c      	jsr 6aa6 <TestRow>(pc)
    518c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5190:	702a           	moveq #42,d0
    5192:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5196:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    519a:	52af 0152      	addq.l #1,338(sp)
    519e:	7204           	moveq #4,d1
    51a0:	b2af 0152      	cmp.l 338(sp),d1
    51a4:	6c9c           	bge.s 5142 <TestZoom4Picture+0x14fe>
  }

  for(int i=0;i<9;i++) {
    51a6:	42af 014e      	clr.l 334(sp)
    51aa:	6000 00f0      	bra.w 529c <TestZoom4Picture+0x1658>
    for(int i2=0;i2<10;i2++) {  
    51ae:	42af 014a      	clr.l 330(sp)
    51b2:	6046           	bra.s 51fa <TestZoom4Picture+0x15b6>
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    51b4:	307c 000b      	movea.w #11,a0
    51b8:	d1ef 014a      	adda.l 330(sp),a0
    51bc:	222f 014e      	move.l 334(sp),d1
    51c0:	2001           	move.l d1,d0
    51c2:	d080           	add.l d0,d0
    51c4:	d081           	add.l d1,d0
    51c6:	d080           	add.l d0,d0
    51c8:	d080           	add.l d0,d0
    51ca:	d081           	add.l d1,d0
    51cc:	d080           	add.l d0,d0
    51ce:	2208           	move.l a0,d1
    51d0:	d280           	add.l d0,d1
    51d2:	7000           	moveq #0,d0
    51d4:	302f 01c6      	move.w 454(sp),d0
    51d8:	2f01           	move.l d1,-(sp)
    51da:	2f00           	move.l d0,-(sp)
    51dc:	2f2f 01d0      	move.l 464(sp),-(sp)
    51e0:	2f2f 0056      	move.l 86(sp),-(sp)
    51e4:	4eba 18c0      	jsr 6aa6 <TestRow>(pc)
    51e8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    51ec:	702a           	moveq #42,d0
    51ee:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    51f2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {  
    51f6:	52af 014a      	addq.l #1,330(sp)
    51fa:	7209           	moveq #9,d1
    51fc:	b2af 014a      	cmp.l 330(sp),d1
    5200:	6cb2           	bge.s 51b4 <TestZoom4Picture+0x1570>
    }
    for(int i2=0;i2<8;i2++) {
    5202:	42af 0146      	clr.l 326(sp)
    5206:	6000 0086      	bra.w 528e <TestZoom4Picture+0x164a>
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    520a:	222f 014e      	move.l 334(sp),d1
    520e:	2001           	move.l d1,d0
    5210:	d080           	add.l d0,d0
    5212:	d081           	add.l d1,d0
    5214:	d080           	add.l d0,d0
    5216:	d080           	add.l d0,d0
    5218:	d081           	add.l d1,d0
    521a:	d080           	add.l d0,d0
    521c:	2040           	movea.l d0,a0
    521e:	41e8 0015      	lea 21(a0),a0
    5222:	2208           	move.l a0,d1
    5224:	d2af 0146      	add.l 326(sp),d1
    5228:	7000           	moveq #0,d0
    522a:	302f 01c6      	move.w 454(sp),d0
    522e:	2f01           	move.l d1,-(sp)
    5230:	2f00           	move.l d0,-(sp)
    5232:	2f2f 01d0      	move.l 464(sp),-(sp)
    5236:	2f2f 0056      	move.l 86(sp),-(sp)
    523a:	4eba 186a      	jsr 6aa6 <TestRow>(pc)
    523e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5242:	702a           	moveq #42,d0
    5244:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    5248:	222f 014e      	move.l 334(sp),d1
    524c:	2001           	move.l d1,d0
    524e:	d080           	add.l d0,d0
    5250:	d081           	add.l d1,d0
    5252:	d080           	add.l d0,d0
    5254:	d080           	add.l d0,d0
    5256:	d081           	add.l d1,d0
    5258:	d080           	add.l d0,d0
    525a:	2040           	movea.l d0,a0
    525c:	41e8 0015      	lea 21(a0),a0
    5260:	2208           	move.l a0,d1
    5262:	d2af 0146      	add.l 326(sp),d1
    5266:	7000           	moveq #0,d0
    5268:	302f 01c6      	move.w 454(sp),d0
    526c:	2f01           	move.l d1,-(sp)
    526e:	2f00           	move.l d0,-(sp)
    5270:	2f2f 01d0      	move.l 464(sp),-(sp)
    5274:	2f2f 0056      	move.l 86(sp),-(sp)
    5278:	4eba 182c      	jsr 6aa6 <TestRow>(pc)
    527c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5280:	722a           	moveq #42,d1
    5282:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5286:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {
    528a:	52af 0146      	addq.l #1,326(sp)
    528e:	7007           	moveq #7,d0
    5290:	b0af 0146      	cmp.l 326(sp),d0
    5294:	6c00 ff74      	bge.w 520a <TestZoom4Picture+0x15c6>
  for(int i=0;i<9;i++) {
    5298:	52af 014e      	addq.l #1,334(sp)
    529c:	7208           	moveq #8,d1
    529e:	b2af 014e      	cmp.l 334(sp),d1
    52a2:	6c00 ff0a      	bge.w 51ae <TestZoom4Picture+0x156a>
    }
  }

  for(int i2=0;i2<10;i2++) {  
    52a6:	42af 0142      	clr.l 322(sp)
    52aa:	6032           	bra.s 52de <TestZoom4Picture+0x169a>
    TestRow( valsupposed, valactual, mask, 245+i2);
    52ac:	222f 0142      	move.l 322(sp),d1
    52b0:	0681 0000 00f5 	addi.l #245,d1
    52b6:	7000           	moveq #0,d0
    52b8:	302f 01c6      	move.w 454(sp),d0
    52bc:	2f01           	move.l d1,-(sp)
    52be:	2f00           	move.l d0,-(sp)
    52c0:	2f2f 01d0      	move.l 464(sp),-(sp)
    52c4:	2f2f 0056      	move.l 86(sp),-(sp)
    52c8:	4eba 17dc      	jsr 6aa6 <TestRow>(pc)
    52cc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    52d0:	702a           	moveq #42,d0
    52d2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    52d6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {  
    52da:	52af 0142      	addq.l #1,322(sp)
    52de:	7209           	moveq #9,d1
    52e0:	b2af 0142      	cmp.l 322(sp),d1
    52e4:	6cc6           	bge.s 52ac <TestZoom4Picture+0x1668>
  }
  for(int i=0;i<7;i++) {
    52e6:	42af 013e      	clr.l 318(sp)
    52ea:	6064           	bra.s 5350 <TestZoom4Picture+0x170c>
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    52ec:	202f 013e      	move.l 318(sp),d0
    52f0:	d080           	add.l d0,d0
    52f2:	2200           	move.l d0,d1
    52f4:	0681 0000 00ff 	addi.l #255,d1
    52fa:	7000           	moveq #0,d0
    52fc:	302f 01c6      	move.w 454(sp),d0
    5300:	2f01           	move.l d1,-(sp)
    5302:	2f00           	move.l d0,-(sp)
    5304:	2f2f 01d0      	move.l 464(sp),-(sp)
    5308:	2f2f 0056      	move.l 86(sp),-(sp)
    530c:	4eba 1798      	jsr 6aa6 <TestRow>(pc)
    5310:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5314:	702a           	moveq #42,d0
    5316:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    531a:	202f 013e      	move.l 318(sp),d0
    531e:	0680 0000 0080 	addi.l #128,d0
    5324:	d080           	add.l d0,d0
    5326:	2200           	move.l d0,d1
    5328:	7000           	moveq #0,d0
    532a:	302f 01c6      	move.w 454(sp),d0
    532e:	2f01           	move.l d1,-(sp)
    5330:	2f00           	move.l d0,-(sp)
    5332:	2f2f 01d0      	move.l 464(sp),-(sp)
    5336:	2f2f 0056      	move.l 86(sp),-(sp)
    533a:	4eba 176a      	jsr 6aa6 <TestRow>(pc)
    533e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5342:	722a           	moveq #42,d1
    5344:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5348:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    534c:	52af 013e      	addq.l #1,318(sp)
    5350:	7006           	moveq #6,d0
    5352:	b0af 013e      	cmp.l 318(sp),d0
    5356:	6c94           	bge.s 52ec <TestZoom4Picture+0x16a8>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5358:	7000           	moveq #0,d0
    535a:	302f 01c6      	move.w 454(sp),d0
    535e:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5362:	2f00           	move.l d0,-(sp)
    5364:	2f2f 01d0      	move.l 464(sp),-(sp)
    5368:	2f2f 0056      	move.l 86(sp),-(sp)
    536c:	4eba 1738      	jsr 6aa6 <TestRow>(pc)
    5370:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5374:	722a           	moveq #42,d1
    5376:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    537a:	466f 01c6      	not.w 454(sp)
 
  tmp = source;
    537e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5384:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    538a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    5390:	4878 0001      	pea 1 <_start+0x1>
    5394:	4878 0008      	pea 8 <_start+0x8>
    5398:	2f2f 0056      	move.l 86(sp),-(sp)
    539c:	2f2f 006a      	move.l 106(sp),-(sp)
    53a0:	4eba c652      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    53a4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    53a8:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    53ae:	2c40           	movea.l d0,a6
    53b0:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    53b4:	202f 004e      	move.l 78(sp),d0
    53b8:	5880           	addq.l #4,d0
    53ba:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom9;
    53be:	2f7c 0000 bb88 	move.l #48008,74(sp)
    53c4:	004a 
  mask = 0x0000;
    53c6:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    53ca:	7000           	moveq #0,d0
    53cc:	302f 01c6      	move.w 454(sp),d0
    53d0:	42a7           	clr.l -(sp)
    53d2:	2f00           	move.l d0,-(sp)
    53d4:	2f2f 01d0      	move.l 464(sp),-(sp)
    53d8:	2f2f 0056      	move.l 86(sp),-(sp)
    53dc:	4eba 16c8      	jsr 6aa6 <TestRow>(pc)
    53e0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    53e4:	722a           	moveq #42,d1
    53e6:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    53ea:	466f 01c6      	not.w 454(sp)
  
  for(int i=0;i<3;i++) {
    53ee:	42af 013a      	clr.l 314(sp)
    53f2:	605c           	bra.s 5450 <TestZoom4Picture+0x180c>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    53f4:	202f 013a      	move.l 314(sp),d0
    53f8:	d080           	add.l d0,d0
    53fa:	2200           	move.l d0,d1
    53fc:	5281           	addq.l #1,d1
    53fe:	7000           	moveq #0,d0
    5400:	302f 01c6      	move.w 454(sp),d0
    5404:	2f01           	move.l d1,-(sp)
    5406:	2f00           	move.l d0,-(sp)
    5408:	2f2f 01d0      	move.l 464(sp),-(sp)
    540c:	2f2f 0056      	move.l 86(sp),-(sp)
    5410:	4eba 1694      	jsr 6aa6 <TestRow>(pc)
    5414:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5418:	702a           	moveq #42,d0
    541a:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    541e:	202f 013a      	move.l 314(sp),d0
    5422:	5280           	addq.l #1,d0
    5424:	d080           	add.l d0,d0
    5426:	2200           	move.l d0,d1
    5428:	7000           	moveq #0,d0
    542a:	302f 01c6      	move.w 454(sp),d0
    542e:	2f01           	move.l d1,-(sp)
    5430:	2f00           	move.l d0,-(sp)
    5432:	2f2f 01d0      	move.l 464(sp),-(sp)
    5436:	2f2f 0056      	move.l 86(sp),-(sp)
    543a:	4eba 166a      	jsr 6aa6 <TestRow>(pc)
    543e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5442:	722a           	moveq #42,d1
    5444:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5448:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    544c:	52af 013a      	addq.l #1,314(sp)
    5450:	7002           	moveq #2,d0
    5452:	b0af 013a      	cmp.l 314(sp),d0
    5456:	6c9c           	bge.s 53f4 <TestZoom4Picture+0x17b0>
  }

  for(int i=0;i<9;i++) {
    5458:	42af 0136      	clr.l 310(sp)
    545c:	6000 00ea      	bra.w 5548 <TestZoom4Picture+0x1904>
    for(int i2=0;i2<9;i2++) {  
    5460:	42af 0132      	clr.l 306(sp)
    5464:	6044           	bra.s 54aa <TestZoom4Picture+0x1866>
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    5466:	307c 000b      	movea.w #11,a0
    546a:	d1ef 0132      	adda.l 306(sp),a0
    546e:	222f 0136      	move.l 310(sp),d1
    5472:	2001           	move.l d1,d0
    5474:	d080           	add.l d0,d0
    5476:	d081           	add.l d1,d0
    5478:	2200           	move.l d0,d1
    547a:	e789           	lsl.l #3,d1
    547c:	d081           	add.l d1,d0
    547e:	2208           	move.l a0,d1
    5480:	d280           	add.l d0,d1
    5482:	7000           	moveq #0,d0
    5484:	302f 01c6      	move.w 454(sp),d0
    5488:	2f01           	move.l d1,-(sp)
    548a:	2f00           	move.l d0,-(sp)
    548c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5490:	2f2f 0056      	move.l 86(sp),-(sp)
    5494:	4eba 1610      	jsr 6aa6 <TestRow>(pc)
    5498:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    549c:	722a           	moveq #42,d1
    549e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    54a2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {  
    54a6:	52af 0132      	addq.l #1,306(sp)
    54aa:	7008           	moveq #8,d0
    54ac:	b0af 0132      	cmp.l 306(sp),d0
    54b0:	6cb4           	bge.s 5466 <TestZoom4Picture+0x1822>
    }
    
    for(int i2=0;i2<9;i2++) {
    54b2:	42af 012e      	clr.l 302(sp)
    54b6:	6000 0082      	bra.w 553a <TestZoom4Picture+0x18f6>
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    54ba:	222f 0136      	move.l 310(sp),d1
    54be:	2001           	move.l d1,d0
    54c0:	d080           	add.l d0,d0
    54c2:	d081           	add.l d1,d0
    54c4:	2200           	move.l d0,d1
    54c6:	e789           	lsl.l #3,d1
    54c8:	2040           	movea.l d0,a0
    54ca:	d1c1           	adda.l d1,a0
    54cc:	41e8 0014      	lea 20(a0),a0
    54d0:	2208           	move.l a0,d1
    54d2:	d2af 012e      	add.l 302(sp),d1
    54d6:	7000           	moveq #0,d0
    54d8:	302f 01c6      	move.w 454(sp),d0
    54dc:	2f01           	move.l d1,-(sp)
    54de:	2f00           	move.l d0,-(sp)
    54e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    54e4:	2f2f 0056      	move.l 86(sp),-(sp)
    54e8:	4eba 15bc      	jsr 6aa6 <TestRow>(pc)
    54ec:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    54f0:	722a           	moveq #42,d1
    54f2:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    54f6:	222f 0136      	move.l 310(sp),d1
    54fa:	2001           	move.l d1,d0
    54fc:	d080           	add.l d0,d0
    54fe:	d081           	add.l d1,d0
    5500:	2200           	move.l d0,d1
    5502:	e789           	lsl.l #3,d1
    5504:	2040           	movea.l d0,a0
    5506:	d1c1           	adda.l d1,a0
    5508:	41e8 0015      	lea 21(a0),a0
    550c:	2208           	move.l a0,d1
    550e:	d2af 012e      	add.l 302(sp),d1
    5512:	7000           	moveq #0,d0
    5514:	302f 01c6      	move.w 454(sp),d0
    5518:	2f01           	move.l d1,-(sp)
    551a:	2f00           	move.l d0,-(sp)
    551c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5520:	2f2f 0056      	move.l 86(sp),-(sp)
    5524:	4eba 1580      	jsr 6aa6 <TestRow>(pc)
    5528:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    552c:	702a           	moveq #42,d0
    552e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5532:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {
    5536:	52af 012e      	addq.l #1,302(sp)
    553a:	7208           	moveq #8,d1
    553c:	b2af 012e      	cmp.l 302(sp),d1
    5540:	6c00 ff78      	bge.w 54ba <TestZoom4Picture+0x1876>
  for(int i=0;i<9;i++) {
    5544:	52af 0136      	addq.l #1,310(sp)
    5548:	7008           	moveq #8,d0
    554a:	b0af 0136      	cmp.l 310(sp),d0
    554e:	6c00 ff10      	bge.w 5460 <TestZoom4Picture+0x181c>
    }
  }

  for(int i2=0;i2<9;i2++) {  
    5552:	42af 012a      	clr.l 298(sp)
    5556:	6032           	bra.s 558a <TestZoom4Picture+0x1946>
    TestRow( valsupposed, valactual, mask, 245+i2);
    5558:	222f 012a      	move.l 298(sp),d1
    555c:	0681 0000 00f5 	addi.l #245,d1
    5562:	7000           	moveq #0,d0
    5564:	302f 01c6      	move.w 454(sp),d0
    5568:	2f01           	move.l d1,-(sp)
    556a:	2f00           	move.l d0,-(sp)
    556c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5570:	2f2f 0056      	move.l 86(sp),-(sp)
    5574:	4eba 1530      	jsr 6aa6 <TestRow>(pc)
    5578:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    557c:	722a           	moveq #42,d1
    557e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5582:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {  
    5586:	52af 012a      	addq.l #1,298(sp)
    558a:	7008           	moveq #8,d0
    558c:	b0af 012a      	cmp.l 298(sp),d0
    5590:	6cc6           	bge.s 5558 <TestZoom4Picture+0x1914>
  }
  for(int i=0;i<5;i++) {
    5592:	42af 0126      	clr.l 294(sp)
    5596:	6064           	bra.s 55fc <TestZoom4Picture+0x19b8>
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    5598:	202f 0126      	move.l 294(sp),d0
    559c:	d080           	add.l d0,d0
    559e:	2200           	move.l d0,d1
    55a0:	0681 0000 0103 	addi.l #259,d1
    55a6:	7000           	moveq #0,d0
    55a8:	302f 01c6      	move.w 454(sp),d0
    55ac:	2f01           	move.l d1,-(sp)
    55ae:	2f00           	move.l d0,-(sp)
    55b0:	2f2f 01d0      	move.l 464(sp),-(sp)
    55b4:	2f2f 0056      	move.l 86(sp),-(sp)
    55b8:	4eba 14ec      	jsr 6aa6 <TestRow>(pc)
    55bc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    55c0:	722a           	moveq #42,d1
    55c2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    55c6:	202f 0126      	move.l 294(sp),d0
    55ca:	0680 0000 0082 	addi.l #130,d0
    55d0:	d080           	add.l d0,d0
    55d2:	2200           	move.l d0,d1
    55d4:	7000           	moveq #0,d0
    55d6:	302f 01c6      	move.w 454(sp),d0
    55da:	2f01           	move.l d1,-(sp)
    55dc:	2f00           	move.l d0,-(sp)
    55de:	2f2f 01d0      	move.l 464(sp),-(sp)
    55e2:	2f2f 0056      	move.l 86(sp),-(sp)
    55e6:	4eba 14be      	jsr 6aa6 <TestRow>(pc)
    55ea:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    55ee:	702a           	moveq #42,d0
    55f0:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    55f4:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    55f8:	52af 0126      	addq.l #1,294(sp)
    55fc:	7204           	moveq #4,d1
    55fe:	b2af 0126      	cmp.l 294(sp),d1
    5602:	6c94           	bge.s 5598 <TestZoom4Picture+0x1954>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5604:	7000           	moveq #0,d0
    5606:	302f 01c6      	move.w 454(sp),d0
    560a:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    560e:	2f00           	move.l d0,-(sp)
    5610:	2f2f 01d0      	move.l 464(sp),-(sp)
    5614:	2f2f 0056      	move.l 86(sp),-(sp)
    5618:	4eba 148c      	jsr 6aa6 <TestRow>(pc)
    561c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5620:	702a           	moveq #42,d0
    5622:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5626:	466f 01c6      	not.w 454(sp)

  tmp = source;
    562a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5630:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5636:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    563c:	4878 0001      	pea 1 <_start+0x1>
    5640:	4878 0009      	pea 9 <_start+0x9>
    5644:	2f2f 0056      	move.l 86(sp),-(sp)
    5648:	2f2f 006a      	move.l 106(sp),-(sp)
    564c:	4eba c3a6      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    5650:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5654:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    565a:	2c40           	movea.l d0,a6
    565c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5660:	222f 004e      	move.l 78(sp),d1
    5664:	5881           	addq.l #4,d1
    5666:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom10;
    566a:	2f7c 0000 bbb4 	move.l #48052,74(sp)
    5670:	004a 

  mask = 0xffff;
    5672:	3f7c ffff 01c6 	move.w #-1,454(sp)
  TestRow( valsupposed, valactual, mask, 0);
    5678:	7000           	moveq #0,d0
    567a:	302f 01c6      	move.w 454(sp),d0
    567e:	42a7           	clr.l -(sp)
    5680:	2f00           	move.l d0,-(sp)
    5682:	2f2f 01d0      	move.l 464(sp),-(sp)
    5686:	2f2f 0056      	move.l 86(sp),-(sp)
    568a:	4eba 141a      	jsr 6aa6 <TestRow>(pc)
    568e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5692:	702a           	moveq #42,d0
    5694:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5698:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 1);   
    569c:	7000           	moveq #0,d0
    569e:	302f 01c6      	move.w 454(sp),d0
    56a2:	4878 0001      	pea 1 <_start+0x1>
    56a6:	2f00           	move.l d0,-(sp)
    56a8:	2f2f 01d0      	move.l 464(sp),-(sp)
    56ac:	2f2f 0056      	move.l 86(sp),-(sp)
    56b0:	4eba 13f4      	jsr 6aa6 <TestRow>(pc)
    56b4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    56b8:	722a           	moveq #42,d1
    56ba:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 2);
    56be:	7000           	moveq #0,d0
    56c0:	302f 01c6      	move.w 454(sp),d0
    56c4:	4878 0002      	pea 2 <_start+0x2>
    56c8:	2f00           	move.l d0,-(sp)
    56ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    56ce:	2f2f 0056      	move.l 86(sp),-(sp)
    56d2:	4eba 13d2      	jsr 6aa6 <TestRow>(pc)
    56d6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    56da:	702a           	moveq #42,d0
    56dc:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    56e0:	466f 01c6      	not.w 454(sp)

  for(int i=0;i<9;i++) {
    56e4:	42af 0122      	clr.l 290(sp)
    56e8:	6000 00e0      	bra.w 57ca <TestZoom4Picture+0x1b86>
    for(int i2=0;i2<8;i2++) {  
    56ec:	42af 011e      	clr.l 286(sp)
    56f0:	6040           	bra.s 5732 <TestZoom4Picture+0x1aee>
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    56f2:	206f 011e      	movea.l 286(sp),a0
    56f6:	5688           	addq.l #3,a0
    56f8:	222f 0122      	move.l 290(sp),d1
    56fc:	2001           	move.l d1,d0
    56fe:	e788           	lsl.l #3,d0
    5700:	9081           	sub.l d1,d0
    5702:	d080           	add.l d0,d0
    5704:	d080           	add.l d0,d0
    5706:	2208           	move.l a0,d1
    5708:	d280           	add.l d0,d1
    570a:	7000           	moveq #0,d0
    570c:	302f 01c6      	move.w 454(sp),d0
    5710:	2f01           	move.l d1,-(sp)
    5712:	2f00           	move.l d0,-(sp)
    5714:	2f2f 01d0      	move.l 464(sp),-(sp)
    5718:	2f2f 0056      	move.l 86(sp),-(sp)
    571c:	4eba 1388      	jsr 6aa6 <TestRow>(pc)
    5720:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5724:	722a           	moveq #42,d1
    5726:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    572a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {  
    572e:	52af 011e      	addq.l #1,286(sp)
    5732:	7007           	moveq #7,d0
    5734:	b0af 011e      	cmp.l 286(sp),d0
    5738:	6cb8           	bge.s 56f2 <TestZoom4Picture+0x1aae>
    }
    
    for(int i2=0;i2<10;i2++) {
    573a:	42af 011a      	clr.l 282(sp)
    573e:	607c           	bra.s 57bc <TestZoom4Picture+0x1b78>
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    5740:	222f 0122      	move.l 290(sp),d1
    5744:	2001           	move.l d1,d0
    5746:	e788           	lsl.l #3,d0
    5748:	9081           	sub.l d1,d0
    574a:	d080           	add.l d0,d0
    574c:	d080           	add.l d0,d0
    574e:	2040           	movea.l d0,a0
    5750:	41e8 000b      	lea 11(a0),a0
    5754:	2208           	move.l a0,d1
    5756:	d2af 011a      	add.l 282(sp),d1
    575a:	7000           	moveq #0,d0
    575c:	302f 01c6      	move.w 454(sp),d0
    5760:	2f01           	move.l d1,-(sp)
    5762:	2f00           	move.l d0,-(sp)
    5764:	2f2f 01d0      	move.l 464(sp),-(sp)
    5768:	2f2f 0056      	move.l 86(sp),-(sp)
    576c:	4eba 1338      	jsr 6aa6 <TestRow>(pc)
    5770:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5774:	722a           	moveq #42,d1
    5776:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    577a:	222f 0122      	move.l 290(sp),d1
    577e:	2001           	move.l d1,d0
    5780:	e788           	lsl.l #3,d0
    5782:	9081           	sub.l d1,d0
    5784:	d080           	add.l d0,d0
    5786:	d080           	add.l d0,d0
    5788:	2040           	movea.l d0,a0
    578a:	41e8 000b      	lea 11(a0),a0
    578e:	2208           	move.l a0,d1
    5790:	d2af 011a      	add.l 282(sp),d1
    5794:	7000           	moveq #0,d0
    5796:	302f 01c6      	move.w 454(sp),d0
    579a:	2f01           	move.l d1,-(sp)
    579c:	2f00           	move.l d0,-(sp)
    579e:	2f2f 01d0      	move.l 464(sp),-(sp)
    57a2:	2f2f 0056      	move.l 86(sp),-(sp)
    57a6:	4eba 12fe      	jsr 6aa6 <TestRow>(pc)
    57aa:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    57ae:	702a           	moveq #42,d0
    57b0:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    57b4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {
    57b8:	52af 011a      	addq.l #1,282(sp)
    57bc:	7209           	moveq #9,d1
    57be:	b2af 011a      	cmp.l 282(sp),d1
    57c2:	6c00 ff7c      	bge.w 5740 <TestZoom4Picture+0x1afc>
  for(int i=0;i<9;i++) {
    57c6:	52af 0122      	addq.l #1,290(sp)
    57ca:	7008           	moveq #8,d0
    57cc:	b0af 0122      	cmp.l 290(sp),d0
    57d0:	6c00 ff1a      	bge.w 56ec <TestZoom4Picture+0x1aa8>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    57d4:	42af 0116      	clr.l 278(sp)
    57d8:	6032           	bra.s 580c <TestZoom4Picture+0x1bc8>
    TestRow( valsupposed, valactual, mask, 255+i2);
    57da:	222f 0116      	move.l 278(sp),d1
    57de:	0681 0000 00ff 	addi.l #255,d1
    57e4:	7000           	moveq #0,d0
    57e6:	302f 01c6      	move.w 454(sp),d0
    57ea:	2f01           	move.l d1,-(sp)
    57ec:	2f00           	move.l d0,-(sp)
    57ee:	2f2f 01d0      	move.l 464(sp),-(sp)
    57f2:	2f2f 0056      	move.l 86(sp),-(sp)
    57f6:	4eba 12ae      	jsr 6aa6 <TestRow>(pc)
    57fa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    57fe:	722a           	moveq #42,d1
    5800:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5804:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    5808:	52af 0116      	addq.l #1,278(sp)
    580c:	7007           	moveq #7,d0
    580e:	b0af 0116      	cmp.l 278(sp),d0
    5812:	6cc6           	bge.s 57da <TestZoom4Picture+0x1b96>
  }
  for(int i=0;i<3;i++) {
    5814:	42af 0112      	clr.l 274(sp)
    5818:	6064           	bra.s 587e <TestZoom4Picture+0x1c3a>
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    581a:	202f 0112      	move.l 274(sp),d0
    581e:	d080           	add.l d0,d0
    5820:	2200           	move.l d0,d1
    5822:	0681 0000 0107 	addi.l #263,d1
    5828:	7000           	moveq #0,d0
    582a:	302f 01c6      	move.w 454(sp),d0
    582e:	2f01           	move.l d1,-(sp)
    5830:	2f00           	move.l d0,-(sp)
    5832:	2f2f 01d0      	move.l 464(sp),-(sp)
    5836:	2f2f 0056      	move.l 86(sp),-(sp)
    583a:	4eba 126a      	jsr 6aa6 <TestRow>(pc)
    583e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5842:	722a           	moveq #42,d1
    5844:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    5848:	202f 0112      	move.l 274(sp),d0
    584c:	0680 0000 0084 	addi.l #132,d0
    5852:	d080           	add.l d0,d0
    5854:	2200           	move.l d0,d1
    5856:	7000           	moveq #0,d0
    5858:	302f 01c6      	move.w 454(sp),d0
    585c:	2f01           	move.l d1,-(sp)
    585e:	2f00           	move.l d0,-(sp)
    5860:	2f2f 01d0      	move.l 464(sp),-(sp)
    5864:	2f2f 0056      	move.l 86(sp),-(sp)
    5868:	4eba 123c      	jsr 6aa6 <TestRow>(pc)
    586c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5870:	702a           	moveq #42,d0
    5872:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5876:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    587a:	52af 0112      	addq.l #1,274(sp)
    587e:	7202           	moveq #2,d1
    5880:	b2af 0112      	cmp.l 274(sp),d1
    5884:	6c94           	bge.s 581a <TestZoom4Picture+0x1bd6>
  }

  tmp = source;
    5886:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    588c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5892:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    5898:	4878 0001      	pea 1 <_start+0x1>
    589c:	4878 000a      	pea a <_start+0xa>
    58a0:	2f2f 0056      	move.l 86(sp),-(sp)
    58a4:	2f2f 006a      	move.l 106(sp),-(sp)
    58a8:	4eba c14a      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    58ac:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    58b0:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    58b6:	2c40           	movea.l d0,a6
    58b8:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    58bc:	202f 004e      	move.l 78(sp),d0
    58c0:	5880           	addq.l #4,d0
    58c2:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom11;
    58c6:	2f7c 0000 bbe0 	move.l #48096,74(sp)
    58cc:	004a 

  mask = 0xffff;
    58ce:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  for(int i2=0;i2<6;i2++) {  
    58d4:	42af 010e      	clr.l 270(sp)
    58d8:	602a           	bra.s 5904 <TestZoom4Picture+0x1cc0>
    TestRow( valsupposed, valactual, mask, i2);
    58da:	7000           	moveq #0,d0
    58dc:	302f 01c6      	move.w 454(sp),d0
    58e0:	2f2f 010e      	move.l 270(sp),-(sp)
    58e4:	2f00           	move.l d0,-(sp)
    58e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    58ea:	2f2f 0056      	move.l 86(sp),-(sp)
    58ee:	4eba 11b6      	jsr 6aa6 <TestRow>(pc)
    58f2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    58f6:	722a           	moveq #42,d1
    58f8:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    58fc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {  
    5900:	52af 010e      	addq.l #1,270(sp)
    5904:	7005           	moveq #5,d0
    5906:	b0af 010e      	cmp.l 270(sp),d0
    590a:	6cce           	bge.s 58da <TestZoom4Picture+0x1c96>
  }

  for(int i2=0;i2<11;i2++) {
    590c:	42af 010a      	clr.l 266(sp)
    5910:	605c           	bra.s 596e <TestZoom4Picture+0x1d2a>
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    5912:	202f 010a      	move.l 266(sp),d0
    5916:	5680           	addq.l #3,d0
    5918:	d080           	add.l d0,d0
    591a:	2200           	move.l d0,d1
    591c:	7000           	moveq #0,d0
    591e:	302f 01c6      	move.w 454(sp),d0
    5922:	2f01           	move.l d1,-(sp)
    5924:	2f00           	move.l d0,-(sp)
    5926:	2f2f 01d0      	move.l 464(sp),-(sp)
    592a:	2f2f 0056      	move.l 86(sp),-(sp)
    592e:	4eba 1176      	jsr 6aa6 <TestRow>(pc)
    5932:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5936:	722a           	moveq #42,d1
    5938:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    593c:	202f 010a      	move.l 266(sp),d0
    5940:	d080           	add.l d0,d0
    5942:	2200           	move.l d0,d1
    5944:	5e81           	addq.l #7,d1
    5946:	7000           	moveq #0,d0
    5948:	302f 01c6      	move.w 454(sp),d0
    594c:	2f01           	move.l d1,-(sp)
    594e:	2f00           	move.l d0,-(sp)
    5950:	2f2f 01d0      	move.l 464(sp),-(sp)
    5954:	2f2f 0056      	move.l 86(sp),-(sp)
    5958:	4eba 114c      	jsr 6aa6 <TestRow>(pc)
    595c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5960:	702a           	moveq #42,d0
    5962:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5966:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    596a:	52af 010a      	addq.l #1,266(sp)
    596e:	720a           	moveq #10,d1
    5970:	b2af 010a      	cmp.l 266(sp),d1
    5974:	6c9c           	bge.s 5912 <TestZoom4Picture+0x1cce>
  }

  for(int i=0;i<8;i++) {
    5976:	42af 0106      	clr.l 262(sp)
    597a:	6000 00f2      	bra.w 5a6e <TestZoom4Picture+0x1e2a>
    for(int i2=0;i2<7;i2++) {  
    597e:	42af 0102      	clr.l 258(sp)
    5982:	6044           	bra.s 59c8 <TestZoom4Picture+0x1d84>
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    5984:	307c 001c      	movea.w #28,a0
    5988:	d1ef 0102      	adda.l 258(sp),a0
    598c:	222f 0106      	move.l 262(sp),d1
    5990:	2001           	move.l d1,d0
    5992:	e788           	lsl.l #3,d0
    5994:	9081           	sub.l d1,d0
    5996:	d080           	add.l d0,d0
    5998:	d080           	add.l d0,d0
    599a:	d081           	add.l d1,d0
    599c:	2208           	move.l a0,d1
    599e:	d280           	add.l d0,d1
    59a0:	7000           	moveq #0,d0
    59a2:	302f 01c6      	move.w 454(sp),d0
    59a6:	2f01           	move.l d1,-(sp)
    59a8:	2f00           	move.l d0,-(sp)
    59aa:	2f2f 01d0      	move.l 464(sp),-(sp)
    59ae:	2f2f 0056      	move.l 86(sp),-(sp)
    59b2:	4eba 10f2      	jsr 6aa6 <TestRow>(pc)
    59b6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    59ba:	702a           	moveq #42,d0
    59bc:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    59c0:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<7;i2++) {  
    59c4:	52af 0102      	addq.l #1,258(sp)
    59c8:	7206           	moveq #6,d1
    59ca:	b2af 0102      	cmp.l 258(sp),d1
    59ce:	6cb4           	bge.s 5984 <TestZoom4Picture+0x1d40>
    }
    
    for(int i2=0;i2<11;i2++) {
    59d0:	42af 00fe      	clr.l 254(sp)
    59d4:	6000 008a      	bra.w 5a60 <TestZoom4Picture+0x1e1c>
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    59d8:	222f 0106      	move.l 262(sp),d1
    59dc:	2001           	move.l d1,d0
    59de:	e788           	lsl.l #3,d0
    59e0:	9081           	sub.l d1,d0
    59e2:	d080           	add.l d0,d0
    59e4:	d080           	add.l d0,d0
    59e6:	2040           	movea.l d0,a0
    59e8:	d1c1           	adda.l d1,a0
    59ea:	41e8 0023      	lea 35(a0),a0
    59ee:	202f 00fe      	move.l 254(sp),d0
    59f2:	d080           	add.l d0,d0
    59f4:	2208           	move.l a0,d1
    59f6:	d280           	add.l d0,d1
    59f8:	7000           	moveq #0,d0
    59fa:	302f 01c6      	move.w 454(sp),d0
    59fe:	2f01           	move.l d1,-(sp)
    5a00:	2f00           	move.l d0,-(sp)
    5a02:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a06:	2f2f 0056      	move.l 86(sp),-(sp)
    5a0a:	4eba 109a      	jsr 6aa6 <TestRow>(pc)
    5a0e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a12:	702a           	moveq #42,d0
    5a14:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    5a18:	222f 0106      	move.l 262(sp),d1
    5a1c:	2001           	move.l d1,d0
    5a1e:	e788           	lsl.l #3,d0
    5a20:	9081           	sub.l d1,d0
    5a22:	d080           	add.l d0,d0
    5a24:	d080           	add.l d0,d0
    5a26:	2040           	movea.l d0,a0
    5a28:	d1c1           	adda.l d1,a0
    5a2a:	41e8 000b      	lea 11(a0),a0
    5a2e:	202f 00fe      	move.l 254(sp),d0
    5a32:	d080           	add.l d0,d0
    5a34:	2208           	move.l a0,d1
    5a36:	d280           	add.l d0,d1
    5a38:	7000           	moveq #0,d0
    5a3a:	302f 01c6      	move.w 454(sp),d0
    5a3e:	2f01           	move.l d1,-(sp)
    5a40:	2f00           	move.l d0,-(sp)
    5a42:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a46:	2f2f 0056      	move.l 86(sp),-(sp)
    5a4a:	4eba 105a      	jsr 6aa6 <TestRow>(pc)
    5a4e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a52:	722a           	moveq #42,d1
    5a54:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5a58:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {
    5a5c:	52af 00fe      	addq.l #1,254(sp)
    5a60:	700a           	moveq #10,d0
    5a62:	b0af 00fe      	cmp.l 254(sp),d0
    5a66:	6c00 ff70      	bge.w 59d8 <TestZoom4Picture+0x1d94>
  for(int i=0;i<8;i++) {
    5a6a:	52af 0106      	addq.l #1,262(sp)
    5a6e:	7207           	moveq #7,d1
    5a70:	b2af 0106      	cmp.l 262(sp),d1
    5a74:	6c00 ff08      	bge.w 597e <TestZoom4Picture+0x1d3a>
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    5a78:	42af 00fa      	clr.l 250(sp)
    5a7c:	6032           	bra.s 5ab0 <TestZoom4Picture+0x1e6c>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5a7e:	222f 00fa      	move.l 250(sp),d1
    5a82:	0681 0000 0104 	addi.l #260,d1
    5a88:	7000           	moveq #0,d0
    5a8a:	302f 01c6      	move.w 454(sp),d0
    5a8e:	2f01           	move.l d1,-(sp)
    5a90:	2f00           	move.l d0,-(sp)
    5a92:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a96:	2f2f 0056      	move.l 86(sp),-(sp)
    5a9a:	4eba 100a      	jsr 6aa6 <TestRow>(pc)
    5a9e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5aa2:	702a           	moveq #42,d0
    5aa4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5aa8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    5aac:	52af 00fa      	addq.l #1,250(sp)
    5ab0:	7206           	moveq #6,d1
    5ab2:	b2af 00fa      	cmp.l 250(sp),d1
    5ab6:	6cc6           	bge.s 5a7e <TestZoom4Picture+0x1e3a>
  }
  TestRow( valsupposed, valactual, mask, 267);   
    5ab8:	7000           	moveq #0,d0
    5aba:	302f 01c6      	move.w 454(sp),d0
    5abe:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    5ac2:	2f00           	move.l d0,-(sp)
    5ac4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ac8:	2f2f 0056      	move.l 86(sp),-(sp)
    5acc:	4eba 0fd8      	jsr 6aa6 <TestRow>(pc)
    5ad0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5ad4:	702a           	moveq #42,d0
    5ad6:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 268);
    5ada:	7000           	moveq #0,d0
    5adc:	302f 01c6      	move.w 454(sp),d0
    5ae0:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    5ae4:	2f00           	move.l d0,-(sp)
    5ae6:	2f2f 01d0      	move.l 464(sp),-(sp)
    5aea:	2f2f 0056      	move.l 86(sp),-(sp)
    5aee:	4eba 0fb6      	jsr 6aa6 <TestRow>(pc)
    5af2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5af6:	722a           	moveq #42,d1
    5af8:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5afc:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 269);
    5b00:	7000           	moveq #0,d0
    5b02:	302f 01c6      	move.w 454(sp),d0
    5b06:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5b0a:	2f00           	move.l d0,-(sp)
    5b0c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b10:	2f2f 0056      	move.l 86(sp),-(sp)
    5b14:	4eba 0f90      	jsr 6aa6 <TestRow>(pc)
    5b18:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b1c:	702a           	moveq #42,d0
    5b1e:	d1af 01c8      	add.l d0,456(sp)
  
  tmp = source;
    5b22:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5b28:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5b2e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    5b34:	4878 0001      	pea 1 <_start+0x1>
    5b38:	4878 000b      	pea b <_start+0xb>
    5b3c:	2f2f 0056      	move.l 86(sp),-(sp)
    5b40:	2f2f 006a      	move.l 106(sp),-(sp)
    5b44:	4eba beae      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    5b48:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5b4c:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    5b52:	2c40           	movea.l d0,a6
    5b54:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5b58:	222f 004e      	move.l 78(sp),d1
    5b5c:	5881           	addq.l #4,d1
    5b5e:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom12;
    5b62:	2f7c 0000 bc0c 	move.l #48140,74(sp)
    5b68:	004a 

  mask = 0x0;
    5b6a:	426f 01c6      	clr.w 454(sp)
   
  TestRow( valsupposed, valactual, mask, 0);
    5b6e:	7000           	moveq #0,d0
    5b70:	302f 01c6      	move.w 454(sp),d0
    5b74:	42a7           	clr.l -(sp)
    5b76:	2f00           	move.l d0,-(sp)
    5b78:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b7c:	2f2f 0056      	move.l 86(sp),-(sp)
    5b80:	4eba 0f24      	jsr 6aa6 <TestRow>(pc)
    5b84:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b88:	702a           	moveq #42,d0
    5b8a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5b8e:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<12;i2++) {
    5b92:	42af 00f6      	clr.l 246(sp)
    5b96:	605c           	bra.s 5bf4 <TestZoom4Picture+0x1fb0>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5b98:	202f 00f6      	move.l 246(sp),d0
    5b9c:	d080           	add.l d0,d0
    5b9e:	2200           	move.l d0,d1
    5ba0:	5281           	addq.l #1,d1
    5ba2:	7000           	moveq #0,d0
    5ba4:	302f 01c6      	move.w 454(sp),d0
    5ba8:	2f01           	move.l d1,-(sp)
    5baa:	2f00           	move.l d0,-(sp)
    5bac:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bb0:	2f2f 0056      	move.l 86(sp),-(sp)
    5bb4:	4eba 0ef0      	jsr 6aa6 <TestRow>(pc)
    5bb8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5bbc:	722a           	moveq #42,d1
    5bbe:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5bc2:	202f 00f6      	move.l 246(sp),d0
    5bc6:	5280           	addq.l #1,d0
    5bc8:	d080           	add.l d0,d0
    5bca:	2200           	move.l d0,d1
    5bcc:	7000           	moveq #0,d0
    5bce:	302f 01c6      	move.w 454(sp),d0
    5bd2:	2f01           	move.l d1,-(sp)
    5bd4:	2f00           	move.l d0,-(sp)
    5bd6:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bda:	2f2f 0056      	move.l 86(sp),-(sp)
    5bde:	4eba 0ec6      	jsr 6aa6 <TestRow>(pc)
    5be2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5be6:	702a           	moveq #42,d0
    5be8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5bec:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    5bf0:	52af 00f6      	addq.l #1,246(sp)
    5bf4:	720b           	moveq #11,d1
    5bf6:	b2af 00f6      	cmp.l 246(sp),d1
    5bfa:	6c9c           	bge.s 5b98 <TestZoom4Picture+0x1f54>
  } 

  for(int i=0;i<8;i++) {
    5bfc:	42af 00f2      	clr.l 242(sp)
    5c00:	6000 00e6      	bra.w 5ce8 <TestZoom4Picture+0x20a4>
    for(int i2=0;i2<6;i2++) {  
    5c04:	42af 00ee      	clr.l 238(sp)
    5c08:	6040           	bra.s 5c4a <TestZoom4Picture+0x2006>
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    5c0a:	307c 0019      	movea.w #25,a0
    5c0e:	d1ef 00ee      	adda.l 238(sp),a0
    5c12:	222f 00f2      	move.l 242(sp),d1
    5c16:	2001           	move.l d1,d0
    5c18:	e988           	lsl.l #4,d0
    5c1a:	9081           	sub.l d1,d0
    5c1c:	d080           	add.l d0,d0
    5c1e:	2208           	move.l a0,d1
    5c20:	d280           	add.l d0,d1
    5c22:	7000           	moveq #0,d0
    5c24:	302f 01c6      	move.w 454(sp),d0
    5c28:	2f01           	move.l d1,-(sp)
    5c2a:	2f00           	move.l d0,-(sp)
    5c2c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c30:	2f2f 0056      	move.l 86(sp),-(sp)
    5c34:	4eba 0e70      	jsr 6aa6 <TestRow>(pc)
    5c38:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5c3c:	702a           	moveq #42,d0
    5c3e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5c42:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<6;i2++) {  
    5c46:	52af 00ee      	addq.l #1,238(sp)
    5c4a:	7205           	moveq #5,d1
    5c4c:	b2af 00ee      	cmp.l 238(sp),d1
    5c50:	6cb8           	bge.s 5c0a <TestZoom4Picture+0x1fc6>
    }
    
    for(int i2=0;i2<12;i2++) {
    5c52:	42af 00ea      	clr.l 234(sp)
    5c56:	6000 0082      	bra.w 5cda <TestZoom4Picture+0x2096>
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    5c5a:	222f 00f2      	move.l 242(sp),d1
    5c5e:	2001           	move.l d1,d0
    5c60:	e988           	lsl.l #4,d0
    5c62:	9081           	sub.l d1,d0
    5c64:	d080           	add.l d0,d0
    5c66:	2040           	movea.l d0,a0
    5c68:	41e8 001f      	lea 31(a0),a0
    5c6c:	202f 00ea      	move.l 234(sp),d0
    5c70:	d080           	add.l d0,d0
    5c72:	2208           	move.l a0,d1
    5c74:	d280           	add.l d0,d1
    5c76:	7000           	moveq #0,d0
    5c78:	302f 01c6      	move.w 454(sp),d0
    5c7c:	2f01           	move.l d1,-(sp)
    5c7e:	2f00           	move.l d0,-(sp)
    5c80:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c84:	2f2f 0056      	move.l 86(sp),-(sp)
    5c88:	4eba 0e1c      	jsr 6aa6 <TestRow>(pc)
    5c8c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5c90:	702a           	moveq #42,d0
    5c92:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    5c96:	222f 00f2      	move.l 242(sp),d1
    5c9a:	2001           	move.l d1,d0
    5c9c:	e988           	lsl.l #4,d0
    5c9e:	9081           	sub.l d1,d0
    5ca0:	d080           	add.l d0,d0
    5ca2:	2040           	movea.l d0,a0
    5ca4:	41e8 0020      	lea 32(a0),a0
    5ca8:	202f 00ea      	move.l 234(sp),d0
    5cac:	d080           	add.l d0,d0
    5cae:	2208           	move.l a0,d1
    5cb0:	d280           	add.l d0,d1
    5cb2:	7000           	moveq #0,d0
    5cb4:	302f 01c6      	move.w 454(sp),d0
    5cb8:	2f01           	move.l d1,-(sp)
    5cba:	2f00           	move.l d0,-(sp)
    5cbc:	2f2f 01d0      	move.l 464(sp),-(sp)
    5cc0:	2f2f 0056      	move.l 86(sp),-(sp)
    5cc4:	4eba 0de0      	jsr 6aa6 <TestRow>(pc)
    5cc8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5ccc:	722a           	moveq #42,d1
    5cce:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5cd2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {
    5cd6:	52af 00ea      	addq.l #1,234(sp)
    5cda:	700b           	moveq #11,d0
    5cdc:	b0af 00ea      	cmp.l 234(sp),d0
    5ce0:	6c00 ff78      	bge.w 5c5a <TestZoom4Picture+0x2016>
  for(int i=0;i<8;i++) {
    5ce4:	52af 00f2      	addq.l #1,242(sp)
    5ce8:	7207           	moveq #7,d1
    5cea:	b2af 00f2      	cmp.l 242(sp),d1
    5cee:	6c00 ff14      	bge.w 5c04 <TestZoom4Picture+0x1fc0>
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    5cf2:	42af 00e6      	clr.l 230(sp)
    5cf6:	6032           	bra.s 5d2a <TestZoom4Picture+0x20e6>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5cf8:	222f 00e6      	move.l 230(sp),d1
    5cfc:	0681 0000 0104 	addi.l #260,d1
    5d02:	7000           	moveq #0,d0
    5d04:	302f 01c6      	move.w 454(sp),d0
    5d08:	2f01           	move.l d1,-(sp)
    5d0a:	2f00           	move.l d0,-(sp)
    5d0c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d10:	2f2f 0056      	move.l 86(sp),-(sp)
    5d14:	4eba 0d90      	jsr 6aa6 <TestRow>(pc)
    5d18:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5d1c:	702a           	moveq #42,d0
    5d1e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5d22:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5d26:	52af 00e6      	addq.l #1,230(sp)
    5d2a:	7204           	moveq #4,d1
    5d2c:	b2af 00e6      	cmp.l 230(sp),d1
    5d30:	6cc6           	bge.s 5cf8 <TestZoom4Picture+0x20b4>
  }

  tmp = source;
    5d32:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5d38:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5d3e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    5d44:	4878 0001      	pea 1 <_start+0x1>
    5d48:	4878 000c      	pea c <_start+0xc>
    5d4c:	2f2f 0056      	move.l 86(sp),-(sp)
    5d50:	2f2f 006a      	move.l 106(sp),-(sp)
    5d54:	4eba bc9e      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    5d58:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5d5c:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    5d62:	2c40           	movea.l d0,a6
    5d64:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5d68:	202f 004e      	move.l 78(sp),d0
    5d6c:	5880           	addq.l #4,d0
    5d6e:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom13;
    5d72:	2f7c 0000 bc38 	move.l #48184,74(sp)
    5d78:	004a 

  mask = 0xffff;
    5d7a:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<11;i2++) {
    5d80:	42af 00e2      	clr.l 226(sp)
    5d84:	605a           	bra.s 5de0 <TestZoom4Picture+0x219c>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    5d86:	202f 00e2      	move.l 226(sp),d0
    5d8a:	d080           	add.l d0,d0
    5d8c:	2200           	move.l d0,d1
    5d8e:	7000           	moveq #0,d0
    5d90:	302f 01c6      	move.w 454(sp),d0
    5d94:	2f01           	move.l d1,-(sp)
    5d96:	2f00           	move.l d0,-(sp)
    5d98:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d9c:	2f2f 0056      	move.l 86(sp),-(sp)
    5da0:	4eba 0d04      	jsr 6aa6 <TestRow>(pc)
    5da4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5da8:	722a           	moveq #42,d1
    5daa:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    5dae:	202f 00e2      	move.l 226(sp),d0
    5db2:	d080           	add.l d0,d0
    5db4:	2200           	move.l d0,d1
    5db6:	5281           	addq.l #1,d1
    5db8:	7000           	moveq #0,d0
    5dba:	302f 01c6      	move.w 454(sp),d0
    5dbe:	2f01           	move.l d1,-(sp)
    5dc0:	2f00           	move.l d0,-(sp)
    5dc2:	2f2f 01d0      	move.l 464(sp),-(sp)
    5dc6:	2f2f 0056      	move.l 86(sp),-(sp)
    5dca:	4eba 0cda      	jsr 6aa6 <TestRow>(pc)
    5dce:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5dd2:	702a           	moveq #42,d0
    5dd4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5dd8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5ddc:	52af 00e2      	addq.l #1,226(sp)
    5de0:	720a           	moveq #10,d1
    5de2:	b2af 00e2      	cmp.l 226(sp),d1
    5de6:	6c9e           	bge.s 5d86 <TestZoom4Picture+0x2142>
  } 

  for(int i=0;i<8;i++) {
    5de8:	42af 00de      	clr.l 222(sp)
    5dec:	6000 00de      	bra.w 5ecc <TestZoom4Picture+0x2288>
    for(int i2=0;i2<5;i2++) {  
    5df0:	42af 00da      	clr.l 218(sp)
    5df4:	603e           	bra.s 5e34 <TestZoom4Picture+0x21f0>
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    5df6:	307c 0016      	movea.w #22,a0
    5dfa:	d1ef 00da      	adda.l 218(sp),a0
    5dfe:	222f 00de      	move.l 222(sp),d1
    5e02:	2001           	move.l d1,d0
    5e04:	eb88           	lsl.l #5,d0
    5e06:	9081           	sub.l d1,d0
    5e08:	2208           	move.l a0,d1
    5e0a:	d280           	add.l d0,d1
    5e0c:	7000           	moveq #0,d0
    5e0e:	302f 01c6      	move.w 454(sp),d0
    5e12:	2f01           	move.l d1,-(sp)
    5e14:	2f00           	move.l d0,-(sp)
    5e16:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e1a:	2f2f 0056      	move.l 86(sp),-(sp)
    5e1e:	4eba 0c86      	jsr 6aa6 <TestRow>(pc)
    5e22:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5e26:	702a           	moveq #42,d0
    5e28:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5e2c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<5;i2++) {  
    5e30:	52af 00da      	addq.l #1,218(sp)
    5e34:	7204           	moveq #4,d1
    5e36:	b2af 00da      	cmp.l 218(sp),d1
    5e3a:	6cba           	bge.s 5df6 <TestZoom4Picture+0x21b2>
    }
    
    for(int i2=0;i2<13;i2++) {
    5e3c:	42af 00d6      	clr.l 214(sp)
    5e40:	607c           	bra.s 5ebe <TestZoom4Picture+0x227a>
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    5e42:	222f 00de      	move.l 222(sp),d1
    5e46:	2001           	move.l d1,d0
    5e48:	eb88           	lsl.l #5,d0
    5e4a:	2040           	movea.l d0,a0
    5e4c:	91c1           	suba.l d1,a0
    5e4e:	41e8 001b      	lea 27(a0),a0
    5e52:	202f 00d6      	move.l 214(sp),d0
    5e56:	d080           	add.l d0,d0
    5e58:	2208           	move.l a0,d1
    5e5a:	d280           	add.l d0,d1
    5e5c:	7000           	moveq #0,d0
    5e5e:	302f 01c6      	move.w 454(sp),d0
    5e62:	2f01           	move.l d1,-(sp)
    5e64:	2f00           	move.l d0,-(sp)
    5e66:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e6a:	2f2f 0056      	move.l 86(sp),-(sp)
    5e6e:	4eba 0c36      	jsr 6aa6 <TestRow>(pc)
    5e72:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5e76:	702a           	moveq #42,d0
    5e78:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    5e7c:	222f 00de      	move.l 222(sp),d1
    5e80:	2001           	move.l d1,d0
    5e82:	eb88           	lsl.l #5,d0
    5e84:	2040           	movea.l d0,a0
    5e86:	91c1           	suba.l d1,a0
    5e88:	41e8 001c      	lea 28(a0),a0
    5e8c:	202f 00d6      	move.l 214(sp),d0
    5e90:	d080           	add.l d0,d0
    5e92:	2208           	move.l a0,d1
    5e94:	d280           	add.l d0,d1
    5e96:	7000           	moveq #0,d0
    5e98:	302f 01c6      	move.w 454(sp),d0
    5e9c:	2f01           	move.l d1,-(sp)
    5e9e:	2f00           	move.l d0,-(sp)
    5ea0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ea4:	2f2f 0056      	move.l 86(sp),-(sp)
    5ea8:	4eba 0bfc      	jsr 6aa6 <TestRow>(pc)
    5eac:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5eb0:	722a           	moveq #42,d1
    5eb2:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5eb6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {
    5eba:	52af 00d6      	addq.l #1,214(sp)
    5ebe:	700c           	moveq #12,d0
    5ec0:	b0af 00d6      	cmp.l 214(sp),d0
    5ec4:	6c00 ff7c      	bge.w 5e42 <TestZoom4Picture+0x21fe>
  for(int i=0;i<8;i++) {
    5ec8:	52af 00de      	addq.l #1,222(sp)
    5ecc:	7207           	moveq #7,d1
    5ece:	b2af 00de      	cmp.l 222(sp),d1
    5ed2:	6c00 ff1c      	bge.w 5df0 <TestZoom4Picture+0x21ac>
    }
  } 

  tmp = source;
    5ed6:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5edc:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5ee2:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    5ee8:	4878 0001      	pea 1 <_start+0x1>
    5eec:	4878 000d      	pea d <_start+0xd>
    5ef0:	2f2f 0056      	move.l 86(sp),-(sp)
    5ef4:	2f2f 006a      	move.l 106(sp),-(sp)
    5ef8:	4eba bafa      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    5efc:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5f00:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    5f06:	2c40           	movea.l d0,a6
    5f08:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5f0c:	202f 004e      	move.l 78(sp),d0
    5f10:	5880           	addq.l #4,d0
    5f12:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom14;
    5f16:	2f7c 0000 bc64 	move.l #48228,74(sp)
    5f1c:	004a 

  mask = 0xffff;
    5f1e:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    5f24:	7000           	moveq #0,d0
    5f26:	302f 01c6      	move.w 454(sp),d0
    5f2a:	42a7           	clr.l -(sp)
    5f2c:	2f00           	move.l d0,-(sp)
    5f2e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f32:	2f2f 0056      	move.l 86(sp),-(sp)
    5f36:	4eba 0b6e      	jsr 6aa6 <TestRow>(pc)
    5f3a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2; 
    5f3e:	722a           	moveq #42,d1
    5f40:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff; 
    5f44:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<9;i2++) {
    5f48:	42af 00d2      	clr.l 210(sp)
    5f4c:	605c           	bra.s 5faa <TestZoom4Picture+0x2366>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5f4e:	202f 00d2      	move.l 210(sp),d0
    5f52:	d080           	add.l d0,d0
    5f54:	2200           	move.l d0,d1
    5f56:	5281           	addq.l #1,d1
    5f58:	7000           	moveq #0,d0
    5f5a:	302f 01c6      	move.w 454(sp),d0
    5f5e:	2f01           	move.l d1,-(sp)
    5f60:	2f00           	move.l d0,-(sp)
    5f62:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f66:	2f2f 0056      	move.l 86(sp),-(sp)
    5f6a:	4eba 0b3a      	jsr 6aa6 <TestRow>(pc)
    5f6e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5f72:	702a           	moveq #42,d0
    5f74:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5f78:	202f 00d2      	move.l 210(sp),d0
    5f7c:	5280           	addq.l #1,d0
    5f7e:	d080           	add.l d0,d0
    5f80:	2200           	move.l d0,d1
    5f82:	7000           	moveq #0,d0
    5f84:	302f 01c6      	move.w 454(sp),d0
    5f88:	2f01           	move.l d1,-(sp)
    5f8a:	2f00           	move.l d0,-(sp)
    5f8c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f90:	2f2f 0056      	move.l 86(sp),-(sp)
    5f94:	4eba 0b10      	jsr 6aa6 <TestRow>(pc)
    5f98:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5f9c:	722a           	moveq #42,d1
    5f9e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5fa2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {
    5fa6:	52af 00d2      	addq.l #1,210(sp)
    5faa:	7008           	moveq #8,d0
    5fac:	b0af 00d2      	cmp.l 210(sp),d0
    5fb0:	6c9c           	bge.s 5f4e <TestZoom4Picture+0x230a>
  } 

  for(int i=0;i<7;i++) {
    5fb2:	42af 00ce      	clr.l 206(sp)
    5fb6:	6000 00cc      	bra.w 6084 <TestZoom4Picture+0x2440>
    for(int i2=0;i2<4;i2++) {  
    5fba:	42af 00ca      	clr.l 202(sp)
    5fbe:	6036           	bra.s 5ff6 <TestZoom4Picture+0x23b2>
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    5fc0:	7213           	moveq #19,d1
    5fc2:	d2af 00ca      	add.l 202(sp),d1
    5fc6:	202f 00ce      	move.l 206(sp),d0
    5fca:	eb88           	lsl.l #5,d0
    5fcc:	d280           	add.l d0,d1
    5fce:	7000           	moveq #0,d0
    5fd0:	302f 01c6      	move.w 454(sp),d0
    5fd4:	2f01           	move.l d1,-(sp)
    5fd6:	2f00           	move.l d0,-(sp)
    5fd8:	2f2f 01d0      	move.l 464(sp),-(sp)
    5fdc:	2f2f 0056      	move.l 86(sp),-(sp)
    5fe0:	4eba 0ac4      	jsr 6aa6 <TestRow>(pc)
    5fe4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5fe8:	722a           	moveq #42,d1
    5fea:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5fee:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<4;i2++) {  
    5ff2:	52af 00ca      	addq.l #1,202(sp)
    5ff6:	7003           	moveq #3,d0
    5ff8:	b0af 00ca      	cmp.l 202(sp),d0
    5ffc:	6cc2           	bge.s 5fc0 <TestZoom4Picture+0x237c>
    }
    
    for(int i2=0;i2<14;i2++) {
    5ffe:	42af 00c6      	clr.l 198(sp)
    6002:	6074           	bra.s 6078 <TestZoom4Picture+0x2434>
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    6004:	202f 00ce      	move.l 206(sp),d0
    6008:	eb88           	lsl.l #5,d0
    600a:	307c 0017      	movea.w #23,a0
    600e:	d1c0           	adda.l d0,a0
    6010:	202f 00c6      	move.l 198(sp),d0
    6014:	d080           	add.l d0,d0
    6016:	2208           	move.l a0,d1
    6018:	d280           	add.l d0,d1
    601a:	7000           	moveq #0,d0
    601c:	302f 01c6      	move.w 454(sp),d0
    6020:	2f01           	move.l d1,-(sp)
    6022:	2f00           	move.l d0,-(sp)
    6024:	2f2f 01d0      	move.l 464(sp),-(sp)
    6028:	2f2f 0056      	move.l 86(sp),-(sp)
    602c:	4eba 0a78      	jsr 6aa6 <TestRow>(pc)
    6030:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6034:	722a           	moveq #42,d1
    6036:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    603a:	202f 00ce      	move.l 206(sp),d0
    603e:	eb88           	lsl.l #5,d0
    6040:	307c 0018      	movea.w #24,a0
    6044:	d1c0           	adda.l d0,a0
    6046:	202f 00c6      	move.l 198(sp),d0
    604a:	d080           	add.l d0,d0
    604c:	2208           	move.l a0,d1
    604e:	d280           	add.l d0,d1
    6050:	7000           	moveq #0,d0
    6052:	302f 01c6      	move.w 454(sp),d0
    6056:	2f01           	move.l d1,-(sp)
    6058:	2f00           	move.l d0,-(sp)
    605a:	2f2f 01d0      	move.l 464(sp),-(sp)
    605e:	2f2f 0056      	move.l 86(sp),-(sp)
    6062:	4eba 0a42      	jsr 6aa6 <TestRow>(pc)
    6066:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    606a:	702a           	moveq #42,d0
    606c:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6070:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {
    6074:	52af 00c6      	addq.l #1,198(sp)
    6078:	720d           	moveq #13,d1
    607a:	b2af 00c6      	cmp.l 198(sp),d1
    607e:	6c84           	bge.s 6004 <TestZoom4Picture+0x23c0>
  for(int i=0;i<7;i++) {
    6080:	52af 00ce      	addq.l #1,206(sp)
    6084:	7006           	moveq #6,d0
    6086:	b0af 00ce      	cmp.l 206(sp),d0
    608a:	6c00 ff2e      	bge.w 5fba <TestZoom4Picture+0x2376>
    }
  }

  for(int i2=0;i2<4;i2++) {  
    608e:	42af 00c2      	clr.l 194(sp)
    6092:	6032           	bra.s 60c6 <TestZoom4Picture+0x2482>
    TestRow( valsupposed, valactual, mask, 243+i2);
    6094:	222f 00c2      	move.l 194(sp),d1
    6098:	0681 0000 00f3 	addi.l #243,d1
    609e:	7000           	moveq #0,d0
    60a0:	302f 01c6      	move.w 454(sp),d0
    60a4:	2f01           	move.l d1,-(sp)
    60a6:	2f00           	move.l d0,-(sp)
    60a8:	2f2f 01d0      	move.l 464(sp),-(sp)
    60ac:	2f2f 0056      	move.l 86(sp),-(sp)
    60b0:	4eba 09f4      	jsr 6aa6 <TestRow>(pc)
    60b4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    60b8:	722a           	moveq #42,d1
    60ba:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    60be:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {  
    60c2:	52af 00c2      	addq.l #1,194(sp)
    60c6:	7003           	moveq #3,d0
    60c8:	b0af 00c2      	cmp.l 194(sp),d0
    60cc:	6cc6           	bge.s 6094 <TestZoom4Picture+0x2450>
  }

  for(int i2=0;i2<12;i2++) {
    60ce:	42af 00be      	clr.l 190(sp)
    60d2:	6060           	bra.s 6134 <TestZoom4Picture+0x24f0>
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    60d4:	202f 00be      	move.l 190(sp),d0
    60d8:	d080           	add.l d0,d0
    60da:	2200           	move.l d0,d1
    60dc:	0681 0000 00f7 	addi.l #247,d1
    60e2:	7000           	moveq #0,d0
    60e4:	302f 01c6      	move.w 454(sp),d0
    60e8:	2f01           	move.l d1,-(sp)
    60ea:	2f00           	move.l d0,-(sp)
    60ec:	2f2f 01d0      	move.l 464(sp),-(sp)
    60f0:	2f2f 0056      	move.l 86(sp),-(sp)
    60f4:	4eba 09b0      	jsr 6aa6 <TestRow>(pc)
    60f8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    60fc:	722a           	moveq #42,d1
    60fe:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    6102:	707c           	moveq #124,d0
    6104:	d0af 00be      	add.l 190(sp),d0
    6108:	d080           	add.l d0,d0
    610a:	2200           	move.l d0,d1
    610c:	7000           	moveq #0,d0
    610e:	302f 01c6      	move.w 454(sp),d0
    6112:	2f01           	move.l d1,-(sp)
    6114:	2f00           	move.l d0,-(sp)
    6116:	2f2f 01d0      	move.l 464(sp),-(sp)
    611a:	2f2f 0056      	move.l 86(sp),-(sp)
    611e:	4eba 0986      	jsr 6aa6 <TestRow>(pc)
    6122:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6126:	702a           	moveq #42,d0
    6128:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    612c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    6130:	52af 00be      	addq.l #1,190(sp)
    6134:	720b           	moveq #11,d1
    6136:	b2af 00be      	cmp.l 190(sp),d1
    613a:	6c98           	bge.s 60d4 <TestZoom4Picture+0x2490>
  }

  tmp = source;
    613c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6142:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6148:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    614e:	4878 0001      	pea 1 <_start+0x1>
    6152:	4878 000e      	pea e <_start+0xe>
    6156:	2f2f 0056      	move.l 86(sp),-(sp)
    615a:	2f2f 006a      	move.l 106(sp),-(sp)
    615e:	4eba b894      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    6162:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6166:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    616c:	2c40           	movea.l d0,a6
    616e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6172:	202f 004e      	move.l 78(sp),d0
    6176:	5880           	addq.l #4,d0
    6178:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom15;
    617c:	2f7c 0000 bc90 	move.l #48272,74(sp)
    6182:	004a 

  mask = 0x0000;
    6184:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<8;i2++) {
    6188:	42af 00ba      	clr.l 186(sp)
    618c:	605a           	bra.s 61e8 <TestZoom4Picture+0x25a4>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    618e:	202f 00ba      	move.l 186(sp),d0
    6192:	d080           	add.l d0,d0
    6194:	2200           	move.l d0,d1
    6196:	7000           	moveq #0,d0
    6198:	302f 01c6      	move.w 454(sp),d0
    619c:	2f01           	move.l d1,-(sp)
    619e:	2f00           	move.l d0,-(sp)
    61a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    61a4:	2f2f 0056      	move.l 86(sp),-(sp)
    61a8:	4eba 08fc      	jsr 6aa6 <TestRow>(pc)
    61ac:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61b0:	722a           	moveq #42,d1
    61b2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    61b6:	202f 00ba      	move.l 186(sp),d0
    61ba:	d080           	add.l d0,d0
    61bc:	2200           	move.l d0,d1
    61be:	5281           	addq.l #1,d1
    61c0:	7000           	moveq #0,d0
    61c2:	302f 01c6      	move.w 454(sp),d0
    61c6:	2f01           	move.l d1,-(sp)
    61c8:	2f00           	move.l d0,-(sp)
    61ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    61ce:	2f2f 0056      	move.l 86(sp),-(sp)
    61d2:	4eba 08d2      	jsr 6aa6 <TestRow>(pc)
    61d6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61da:	702a           	moveq #42,d0
    61dc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    61e0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    61e4:	52af 00ba      	addq.l #1,186(sp)
    61e8:	7207           	moveq #7,d1
    61ea:	b2af 00ba      	cmp.l 186(sp),d1
    61ee:	6c9e           	bge.s 618e <TestZoom4Picture+0x254a>
  }

  for(int i=0;i<7;i++) {
    61f0:	42af 00b6      	clr.l 182(sp)
    61f4:	6000 00de      	bra.w 62d4 <TestZoom4Picture+0x2690>
    for(int i2=0;i2<3;i2++) {  
    61f8:	42af 00b2      	clr.l 178(sp)
    61fc:	603e           	bra.s 623c <TestZoom4Picture+0x25f8>
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    61fe:	307c 0010      	movea.w #16,a0
    6202:	d1ef 00b2      	adda.l 178(sp),a0
    6206:	222f 00b6      	move.l 182(sp),d1
    620a:	2001           	move.l d1,d0
    620c:	eb88           	lsl.l #5,d0
    620e:	d081           	add.l d1,d0
    6210:	2208           	move.l a0,d1
    6212:	d280           	add.l d0,d1
    6214:	7000           	moveq #0,d0
    6216:	302f 01c6      	move.w 454(sp),d0
    621a:	2f01           	move.l d1,-(sp)
    621c:	2f00           	move.l d0,-(sp)
    621e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6222:	2f2f 0056      	move.l 86(sp),-(sp)
    6226:	4eba 087e      	jsr 6aa6 <TestRow>(pc)
    622a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    622e:	702a           	moveq #42,d0
    6230:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6234:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<3;i2++) {  
    6238:	52af 00b2      	addq.l #1,178(sp)
    623c:	7202           	moveq #2,d1
    623e:	b2af 00b2      	cmp.l 178(sp),d1
    6242:	6cba           	bge.s 61fe <TestZoom4Picture+0x25ba>
    }
    
    for(int i2=0;i2<15;i2++) {
    6244:	42af 00ae      	clr.l 174(sp)
    6248:	607c           	bra.s 62c6 <TestZoom4Picture+0x2682>
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    624a:	222f 00b6      	move.l 182(sp),d1
    624e:	2001           	move.l d1,d0
    6250:	eb88           	lsl.l #5,d0
    6252:	2040           	movea.l d0,a0
    6254:	d1c1           	adda.l d1,a0
    6256:	41e8 0013      	lea 19(a0),a0
    625a:	202f 00ae      	move.l 174(sp),d0
    625e:	d080           	add.l d0,d0
    6260:	2208           	move.l a0,d1
    6262:	d280           	add.l d0,d1
    6264:	7000           	moveq #0,d0
    6266:	302f 01c6      	move.w 454(sp),d0
    626a:	2f01           	move.l d1,-(sp)
    626c:	2f00           	move.l d0,-(sp)
    626e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6272:	2f2f 0056      	move.l 86(sp),-(sp)
    6276:	4eba 082e      	jsr 6aa6 <TestRow>(pc)
    627a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    627e:	702a           	moveq #42,d0
    6280:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    6284:	222f 00b6      	move.l 182(sp),d1
    6288:	2001           	move.l d1,d0
    628a:	eb88           	lsl.l #5,d0
    628c:	2040           	movea.l d0,a0
    628e:	d1c1           	adda.l d1,a0
    6290:	41e8 0013      	lea 19(a0),a0
    6294:	202f 00ae      	move.l 174(sp),d0
    6298:	d080           	add.l d0,d0
    629a:	2208           	move.l a0,d1
    629c:	d280           	add.l d0,d1
    629e:	7000           	moveq #0,d0
    62a0:	302f 01c6      	move.w 454(sp),d0
    62a4:	2f01           	move.l d1,-(sp)
    62a6:	2f00           	move.l d0,-(sp)
    62a8:	2f2f 01d0      	move.l 464(sp),-(sp)
    62ac:	2f2f 0056      	move.l 86(sp),-(sp)
    62b0:	4eba 07f4      	jsr 6aa6 <TestRow>(pc)
    62b4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    62b8:	722a           	moveq #42,d1
    62ba:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    62be:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {
    62c2:	52af 00ae      	addq.l #1,174(sp)
    62c6:	700e           	moveq #14,d0
    62c8:	b0af 00ae      	cmp.l 174(sp),d0
    62cc:	6c00 ff7c      	bge.w 624a <TestZoom4Picture+0x2606>
  for(int i=0;i<7;i++) {
    62d0:	52af 00b6      	addq.l #1,182(sp)
    62d4:	7206           	moveq #6,d1
    62d6:	b2af 00b6      	cmp.l 182(sp),d1
    62da:	6c00 ff1c      	bge.w 61f8 <TestZoom4Picture+0x25b4>
    }
  }

  for(int i2=0;i2<3;i2++) {  
    62de:	42af 00aa      	clr.l 170(sp)
    62e2:	6032           	bra.s 6316 <TestZoom4Picture+0x26d2>
    TestRow( valsupposed, valactual, mask, 247+i2);
    62e4:	222f 00aa      	move.l 170(sp),d1
    62e8:	0681 0000 00f7 	addi.l #247,d1
    62ee:	7000           	moveq #0,d0
    62f0:	302f 01c6      	move.w 454(sp),d0
    62f4:	2f01           	move.l d1,-(sp)
    62f6:	2f00           	move.l d0,-(sp)
    62f8:	2f2f 01d0      	move.l 464(sp),-(sp)
    62fc:	2f2f 0056      	move.l 86(sp),-(sp)
    6300:	4eba 07a4      	jsr 6aa6 <TestRow>(pc)
    6304:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6308:	702a           	moveq #42,d0
    630a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    630e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<3;i2++) {  
    6312:	52af 00aa      	addq.l #1,170(sp)
    6316:	7202           	moveq #2,d1
    6318:	b2af 00aa      	cmp.l 170(sp),d1
    631c:	6cc6           	bge.s 62e4 <TestZoom4Picture+0x26a0>
  }

  for(int i2=0;i2<10;i2++) {
    631e:	42af 00a6      	clr.l 166(sp)
    6322:	6060           	bra.s 6384 <TestZoom4Picture+0x2740>
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    6324:	707d           	moveq #125,d0
    6326:	d0af 00a6      	add.l 166(sp),d0
    632a:	d080           	add.l d0,d0
    632c:	2200           	move.l d0,d1
    632e:	7000           	moveq #0,d0
    6330:	302f 01c6      	move.w 454(sp),d0
    6334:	2f01           	move.l d1,-(sp)
    6336:	2f00           	move.l d0,-(sp)
    6338:	2f2f 01d0      	move.l 464(sp),-(sp)
    633c:	2f2f 0056      	move.l 86(sp),-(sp)
    6340:	4eba 0764      	jsr 6aa6 <TestRow>(pc)
    6344:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6348:	702a           	moveq #42,d0
    634a:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    634e:	202f 00a6      	move.l 166(sp),d0
    6352:	d080           	add.l d0,d0
    6354:	2200           	move.l d0,d1
    6356:	0681 0000 00fb 	addi.l #251,d1
    635c:	7000           	moveq #0,d0
    635e:	302f 01c6      	move.w 454(sp),d0
    6362:	2f01           	move.l d1,-(sp)
    6364:	2f00           	move.l d0,-(sp)
    6366:	2f2f 01d0      	move.l 464(sp),-(sp)
    636a:	2f2f 0056      	move.l 86(sp),-(sp)
    636e:	4eba 0736      	jsr 6aa6 <TestRow>(pc)
    6372:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6376:	722a           	moveq #42,d1
    6378:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    637c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {
    6380:	52af 00a6      	addq.l #1,166(sp)
    6384:	7009           	moveq #9,d0
    6386:	b0af 00a6      	cmp.l 166(sp),d0
    638a:	6c98           	bge.s 6324 <TestZoom4Picture+0x26e0>
  }

  tmp = source;
    638c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6392:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6398:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    639e:	4878 0001      	pea 1 <_start+0x1>
    63a2:	4878 000f      	pea f <_start+0xf>
    63a6:	2f2f 0056      	move.l 86(sp),-(sp)
    63aa:	2f2f 006a      	move.l 106(sp),-(sp)
    63ae:	4eba b644      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    63b2:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    63b6:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    63bc:	2c40           	movea.l d0,a6
    63be:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    63c2:	222f 004e      	move.l 78(sp),d1
    63c6:	5881           	addq.l #4,d1
    63c8:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom16;
    63cc:	2f7c 0000 bcbc 	move.l #48316,74(sp)
    63d2:	004a 

  mask = 0x0000;
    63d4:	426f 01c6      	clr.w 454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    63d8:	7000           	moveq #0,d0
    63da:	302f 01c6      	move.w 454(sp),d0
    63de:	42a7           	clr.l -(sp)
    63e0:	2f00           	move.l d0,-(sp)
    63e2:	2f2f 01d0      	move.l 464(sp),-(sp)
    63e6:	2f2f 0056      	move.l 86(sp),-(sp)
    63ea:	4eba 06ba      	jsr 6aa6 <TestRow>(pc)
    63ee:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    63f2:	702a           	moveq #42,d0
    63f4:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    63f8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    63fc:	42af 00a2      	clr.l 162(sp)
    6400:	605a           	bra.s 645c <TestZoom4Picture+0x2818>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6402:	202f 00a2      	move.l 162(sp),d0
    6406:	d080           	add.l d0,d0
    6408:	2200           	move.l d0,d1
    640a:	7000           	moveq #0,d0
    640c:	302f 01c6      	move.w 454(sp),d0
    6410:	2f01           	move.l d1,-(sp)
    6412:	2f00           	move.l d0,-(sp)
    6414:	2f2f 01d0      	move.l 464(sp),-(sp)
    6418:	2f2f 0056      	move.l 86(sp),-(sp)
    641c:	4eba 0688      	jsr 6aa6 <TestRow>(pc)
    6420:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6424:	722a           	moveq #42,d1
    6426:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    642a:	202f 00a2      	move.l 162(sp),d0
    642e:	d080           	add.l d0,d0
    6430:	2200           	move.l d0,d1
    6432:	5281           	addq.l #1,d1
    6434:	7000           	moveq #0,d0
    6436:	302f 01c6      	move.w 454(sp),d0
    643a:	2f01           	move.l d1,-(sp)
    643c:	2f00           	move.l d0,-(sp)
    643e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6442:	2f2f 0056      	move.l 86(sp),-(sp)
    6446:	4eba 065e      	jsr 6aa6 <TestRow>(pc)
    644a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    644e:	702a           	moveq #42,d0
    6450:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6454:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    6458:	52af 00a2      	addq.l #1,162(sp)
    645c:	7205           	moveq #5,d1
    645e:	b2af 00a2      	cmp.l 162(sp),d1
    6462:	6c9e           	bge.s 6402 <TestZoom4Picture+0x27be>
  }

  for(int i=0;i<7;i++) {
    6464:	42af 009e      	clr.l 158(sp)
    6468:	6000 00e6      	bra.w 6550 <TestZoom4Picture+0x290c>
    for(int i2=0;i2<2;i2++) {  
    646c:	42af 009a      	clr.l 154(sp)
    6470:	6040           	bra.s 64b2 <TestZoom4Picture+0x286e>
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    6472:	307c 000d      	movea.w #13,a0
    6476:	d1ef 009a      	adda.l 154(sp),a0
    647a:	222f 009e      	move.l 158(sp),d1
    647e:	2001           	move.l d1,d0
    6480:	e988           	lsl.l #4,d0
    6482:	d081           	add.l d1,d0
    6484:	d080           	add.l d0,d0
    6486:	2208           	move.l a0,d1
    6488:	d280           	add.l d0,d1
    648a:	7000           	moveq #0,d0
    648c:	302f 01c6      	move.w 454(sp),d0
    6490:	2f01           	move.l d1,-(sp)
    6492:	2f00           	move.l d0,-(sp)
    6494:	2f2f 01d0      	move.l 464(sp),-(sp)
    6498:	2f2f 0056      	move.l 86(sp),-(sp)
    649c:	4eba 0608      	jsr 6aa6 <TestRow>(pc)
    64a0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    64a4:	702a           	moveq #42,d0
    64a6:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    64aa:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<2;i2++) {  
    64ae:	52af 009a      	addq.l #1,154(sp)
    64b2:	7201           	moveq #1,d1
    64b4:	b2af 009a      	cmp.l 154(sp),d1
    64b8:	6cb8           	bge.s 6472 <TestZoom4Picture+0x282e>
    }
    
    for(int i2=0;i2<16;i2++) {
    64ba:	42af 0096      	clr.l 150(sp)
    64be:	6000 0082      	bra.w 6542 <TestZoom4Picture+0x28fe>
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    64c2:	222f 009e      	move.l 158(sp),d1
    64c6:	2001           	move.l d1,d0
    64c8:	e988           	lsl.l #4,d0
    64ca:	d081           	add.l d1,d0
    64cc:	d080           	add.l d0,d0
    64ce:	2040           	movea.l d0,a0
    64d0:	41e8 0010      	lea 16(a0),a0
    64d4:	202f 0096      	move.l 150(sp),d0
    64d8:	d080           	add.l d0,d0
    64da:	2208           	move.l a0,d1
    64dc:	d280           	add.l d0,d1
    64de:	7000           	moveq #0,d0
    64e0:	302f 01c6      	move.w 454(sp),d0
    64e4:	2f01           	move.l d1,-(sp)
    64e6:	2f00           	move.l d0,-(sp)
    64e8:	2f2f 01d0      	move.l 464(sp),-(sp)
    64ec:	2f2f 0056      	move.l 86(sp),-(sp)
    64f0:	4eba 05b4      	jsr 6aa6 <TestRow>(pc)
    64f4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    64f8:	702a           	moveq #42,d0
    64fa:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    64fe:	222f 009e      	move.l 158(sp),d1
    6502:	2001           	move.l d1,d0
    6504:	e988           	lsl.l #4,d0
    6506:	d081           	add.l d1,d0
    6508:	d080           	add.l d0,d0
    650a:	2040           	movea.l d0,a0
    650c:	41e8 0011      	lea 17(a0),a0
    6510:	202f 0096      	move.l 150(sp),d0
    6514:	d080           	add.l d0,d0
    6516:	2208           	move.l a0,d1
    6518:	d280           	add.l d0,d1
    651a:	7000           	moveq #0,d0
    651c:	302f 01c6      	move.w 454(sp),d0
    6520:	2f01           	move.l d1,-(sp)
    6522:	2f00           	move.l d0,-(sp)
    6524:	2f2f 01d0      	move.l 464(sp),-(sp)
    6528:	2f2f 0056      	move.l 86(sp),-(sp)
    652c:	4eba 0578      	jsr 6aa6 <TestRow>(pc)
    6530:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6534:	722a           	moveq #42,d1
    6536:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    653a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {
    653e:	52af 0096      	addq.l #1,150(sp)
    6542:	700f           	moveq #15,d0
    6544:	b0af 0096      	cmp.l 150(sp),d0
    6548:	6c00 ff78      	bge.w 64c2 <TestZoom4Picture+0x287e>
  for(int i=0;i<7;i++) {
    654c:	52af 009e      	addq.l #1,158(sp)
    6550:	7206           	moveq #6,d1
    6552:	b2af 009e      	cmp.l 158(sp),d1
    6556:	6c00 ff14      	bge.w 646c <TestZoom4Picture+0x2828>
    }
  }

  for(int i2=0;i2<2;i2++) {
    655a:	42af 0092      	clr.l 146(sp)
    655e:	6032           	bra.s 6592 <TestZoom4Picture+0x294e>
    TestRow( valsupposed, valactual, mask, 251+i2);
    6560:	222f 0092      	move.l 146(sp),d1
    6564:	0681 0000 00fb 	addi.l #251,d1
    656a:	7000           	moveq #0,d0
    656c:	302f 01c6      	move.w 454(sp),d0
    6570:	2f01           	move.l d1,-(sp)
    6572:	2f00           	move.l d0,-(sp)
    6574:	2f2f 01d0      	move.l 464(sp),-(sp)
    6578:	2f2f 0056      	move.l 86(sp),-(sp)
    657c:	4eba 0528      	jsr 6aa6 <TestRow>(pc)
    6580:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6584:	702a           	moveq #42,d0
    6586:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    658a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<2;i2++) {
    658e:	52af 0092      	addq.l #1,146(sp)
    6592:	7201           	moveq #1,d1
    6594:	b2af 0092      	cmp.l 146(sp),d1
    6598:	6cc6           	bge.s 6560 <TestZoom4Picture+0x291c>
  }

  for(int i2=0;i2<8;i2++) {
    659a:	42af 008e      	clr.l 142(sp)
    659e:	6060           	bra.s 6600 <TestZoom4Picture+0x29bc>
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    65a0:	202f 008e      	move.l 142(sp),d0
    65a4:	d080           	add.l d0,d0
    65a6:	2200           	move.l d0,d1
    65a8:	0681 0000 00fd 	addi.l #253,d1
    65ae:	7000           	moveq #0,d0
    65b0:	302f 01c6      	move.w 454(sp),d0
    65b4:	2f01           	move.l d1,-(sp)
    65b6:	2f00           	move.l d0,-(sp)
    65b8:	2f2f 01d0      	move.l 464(sp),-(sp)
    65bc:	2f2f 0056      	move.l 86(sp),-(sp)
    65c0:	4eba 04e4      	jsr 6aa6 <TestRow>(pc)
    65c4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    65c8:	702a           	moveq #42,d0
    65ca:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    65ce:	707f           	moveq #127,d0
    65d0:	d0af 008e      	add.l 142(sp),d0
    65d4:	d080           	add.l d0,d0
    65d6:	2200           	move.l d0,d1
    65d8:	7000           	moveq #0,d0
    65da:	302f 01c6      	move.w 454(sp),d0
    65de:	2f01           	move.l d1,-(sp)
    65e0:	2f00           	move.l d0,-(sp)
    65e2:	2f2f 01d0      	move.l 464(sp),-(sp)
    65e6:	2f2f 0056      	move.l 86(sp),-(sp)
    65ea:	4eba 04ba      	jsr 6aa6 <TestRow>(pc)
    65ee:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    65f2:	722a           	moveq #42,d1
    65f4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    65f8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    65fc:	52af 008e      	addq.l #1,142(sp)
    6600:	7007           	moveq #7,d0
    6602:	b0af 008e      	cmp.l 142(sp),d0
    6606:	6c98           	bge.s 65a0 <TestZoom4Picture+0x295c>
  }

  tmp = source;
    6608:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    660e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6614:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    661a:	4878 0001      	pea 1 <_start+0x1>
    661e:	4878 0010      	pea 10 <_start+0x10>
    6622:	2f2f 0056      	move.l 86(sp),-(sp)
    6626:	2f2f 006a      	move.l 106(sp),-(sp)
    662a:	4eba b3c8      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    662e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6632:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    6638:	2c40           	movea.l d0,a6
    663a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    663e:	222f 004e      	move.l 78(sp),d1
    6642:	5881           	addq.l #4,d1
    6644:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom17;
    6648:	2f7c 0000 bce8 	move.l #48360,74(sp)
    664e:	004a 

  mask = 0xffff;
    6650:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<5;i2++) {
    6656:	42af 008a      	clr.l 138(sp)
    665a:	605a           	bra.s 66b6 <TestZoom4Picture+0x2a72>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    665c:	202f 008a      	move.l 138(sp),d0
    6660:	d080           	add.l d0,d0
    6662:	2200           	move.l d0,d1
    6664:	7000           	moveq #0,d0
    6666:	302f 01c6      	move.w 454(sp),d0
    666a:	2f01           	move.l d1,-(sp)
    666c:	2f00           	move.l d0,-(sp)
    666e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6672:	2f2f 0056      	move.l 86(sp),-(sp)
    6676:	4eba 042e      	jsr 6aa6 <TestRow>(pc)
    667a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    667e:	702a           	moveq #42,d0
    6680:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6684:	202f 008a      	move.l 138(sp),d0
    6688:	d080           	add.l d0,d0
    668a:	2200           	move.l d0,d1
    668c:	5281           	addq.l #1,d1
    668e:	7000           	moveq #0,d0
    6690:	302f 01c6      	move.w 454(sp),d0
    6694:	2f01           	move.l d1,-(sp)
    6696:	2f00           	move.l d0,-(sp)
    6698:	2f2f 01d0      	move.l 464(sp),-(sp)
    669c:	2f2f 0056      	move.l 86(sp),-(sp)
    66a0:	4eba 0404      	jsr 6aa6 <TestRow>(pc)
    66a4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66a8:	722a           	moveq #42,d1
    66aa:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    66ae:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {
    66b2:	52af 008a      	addq.l #1,138(sp)
    66b6:	7004           	moveq #4,d0
    66b8:	b0af 008a      	cmp.l 138(sp),d0
    66bc:	6c9e           	bge.s 665c <TestZoom4Picture+0x2a18>
  }

  for(int i=0;i<7;i++) {
    66be:	42af 0086      	clr.l 134(sp)
    66c2:	6000 00d4      	bra.w 6798 <TestZoom4Picture+0x2b54>
      TestRow( valsupposed, valactual, mask, 10+i*35);
    66c6:	222f 0086      	move.l 134(sp),d1
    66ca:	2001           	move.l d1,d0
    66cc:	e988           	lsl.l #4,d0
    66ce:	d081           	add.l d1,d0
    66d0:	d080           	add.l d0,d0
    66d2:	2040           	movea.l d0,a0
    66d4:	d1c1           	adda.l d1,a0
    66d6:	41e8 000a      	lea 10(a0),a0
    66da:	7000           	moveq #0,d0
    66dc:	302f 01c6      	move.w 454(sp),d0
    66e0:	2f08           	move.l a0,-(sp)
    66e2:	2f00           	move.l d0,-(sp)
    66e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    66e8:	2f2f 0056      	move.l 86(sp),-(sp)
    66ec:	4eba 03b8      	jsr 6aa6 <TestRow>(pc)
    66f0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    66f4:	722a           	moveq #42,d1
    66f6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    66fa:	466f 01c6      	not.w 454(sp)
    
    for(int i2=0;i2<17;i2++) {
    66fe:	42af 0082      	clr.l 130(sp)
    6702:	6000 0086      	bra.w 678a <TestZoom4Picture+0x2b46>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6706:	222f 0086      	move.l 134(sp),d1
    670a:	2001           	move.l d1,d0
    670c:	e988           	lsl.l #4,d0
    670e:	d081           	add.l d1,d0
    6710:	d080           	add.l d0,d0
    6712:	2040           	movea.l d0,a0
    6714:	d1c1           	adda.l d1,a0
    6716:	41e8 000b      	lea 11(a0),a0
    671a:	202f 0082      	move.l 130(sp),d0
    671e:	d080           	add.l d0,d0
    6720:	2208           	move.l a0,d1
    6722:	d280           	add.l d0,d1
    6724:	7000           	moveq #0,d0
    6726:	302f 01c6      	move.w 454(sp),d0
    672a:	2f01           	move.l d1,-(sp)
    672c:	2f00           	move.l d0,-(sp)
    672e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6732:	2f2f 0056      	move.l 86(sp),-(sp)
    6736:	4eba 036e      	jsr 6aa6 <TestRow>(pc)
    673a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    673e:	702a           	moveq #42,d0
    6740:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6744:	222f 0086      	move.l 134(sp),d1
    6748:	2001           	move.l d1,d0
    674a:	e988           	lsl.l #4,d0
    674c:	d081           	add.l d1,d0
    674e:	d080           	add.l d0,d0
    6750:	2040           	movea.l d0,a0
    6752:	d1c1           	adda.l d1,a0
    6754:	41e8 000c      	lea 12(a0),a0
    6758:	202f 0082      	move.l 130(sp),d0
    675c:	d080           	add.l d0,d0
    675e:	2208           	move.l a0,d1
    6760:	d280           	add.l d0,d1
    6762:	7000           	moveq #0,d0
    6764:	302f 01c6      	move.w 454(sp),d0
    6768:	2f01           	move.l d1,-(sp)
    676a:	2f00           	move.l d0,-(sp)
    676c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6770:	2f2f 0056      	move.l 86(sp),-(sp)
    6774:	4eba 0330      	jsr 6aa6 <TestRow>(pc)
    6778:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    677c:	722a           	moveq #42,d1
    677e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6782:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<17;i2++) {
    6786:	52af 0082      	addq.l #1,130(sp)
    678a:	7010           	moveq #16,d0
    678c:	b0af 0082      	cmp.l 130(sp),d0
    6790:	6c00 ff74      	bge.w 6706 <TestZoom4Picture+0x2ac2>
  for(int i=0;i<7;i++) {
    6794:	52af 0086      	addq.l #1,134(sp)
    6798:	7206           	moveq #6,d1
    679a:	b2af 0086      	cmp.l 134(sp),d1
    679e:	6c00 ff26      	bge.w 66c6 <TestZoom4Picture+0x2a82>
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    67a2:	7000           	moveq #0,d0
    67a4:	302f 01c6      	move.w 454(sp),d0
    67a8:	4878 00ff      	pea ff <FreeDisplay+0x1f>
    67ac:	2f00           	move.l d0,-(sp)
    67ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    67b2:	2f2f 0056      	move.l 86(sp),-(sp)
    67b6:	4eba 02ee      	jsr 6aa6 <TestRow>(pc)
    67ba:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    67be:	702a           	moveq #42,d0
    67c0:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    67c4:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<7;i2++) {
    67c8:	42af 007e      	clr.l 126(sp)
    67cc:	6064           	bra.s 6832 <TestZoom4Picture+0x2bee>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    67ce:	202f 007e      	move.l 126(sp),d0
    67d2:	0680 0000 0080 	addi.l #128,d0
    67d8:	d080           	add.l d0,d0
    67da:	2200           	move.l d0,d1
    67dc:	7000           	moveq #0,d0
    67de:	302f 01c6      	move.w 454(sp),d0
    67e2:	2f01           	move.l d1,-(sp)
    67e4:	2f00           	move.l d0,-(sp)
    67e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    67ea:	2f2f 0056      	move.l 86(sp),-(sp)
    67ee:	4eba 02b6      	jsr 6aa6 <TestRow>(pc)
    67f2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    67f6:	722a           	moveq #42,d1
    67f8:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    67fc:	202f 007e      	move.l 126(sp),d0
    6800:	d080           	add.l d0,d0
    6802:	2200           	move.l d0,d1
    6804:	0681 0000 0101 	addi.l #257,d1
    680a:	7000           	moveq #0,d0
    680c:	302f 01c6      	move.w 454(sp),d0
    6810:	2f01           	move.l d1,-(sp)
    6812:	2f00           	move.l d0,-(sp)
    6814:	2f2f 01d0      	move.l 464(sp),-(sp)
    6818:	2f2f 0056      	move.l 86(sp),-(sp)
    681c:	4eba 0288      	jsr 6aa6 <TestRow>(pc)
    6820:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6824:	702a           	moveq #42,d0
    6826:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    682a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {
    682e:	52af 007e      	addq.l #1,126(sp)
    6832:	7206           	moveq #6,d1
    6834:	b2af 007e      	cmp.l 126(sp),d1
    6838:	6c94           	bge.s 67ce <TestZoom4Picture+0x2b8a>
  }   

  tmp = source;
    683a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6840:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6846:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    684c:	4878 0001      	pea 1 <_start+0x1>
    6850:	4878 0011      	pea 11 <_start+0x11>
    6854:	2f2f 0056      	move.l 86(sp),-(sp)
    6858:	2f2f 006a      	move.l 106(sp),-(sp)
    685c:	4eba b196      	jsr 19f4 <Zoom_ZoomIntoPicture>(pc)
    6860:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6864:	2039 0010 32a4 	move.l 1032a4 <GfxBase>,d0
    686a:	2c40           	movea.l d0,a6
    686c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6870:	202f 004e      	move.l 78(sp),d0
    6874:	5880           	addq.l #4,d0
    6876:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom18;
    687a:	2f7c 0000 bd14 	move.l #48404,74(sp)
    6880:	004a 

  mask = 0xffff;
    6882:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);
    6888:	7000           	moveq #0,d0
    688a:	302f 01c6      	move.w 454(sp),d0
    688e:	42a7           	clr.l -(sp)
    6890:	2f00           	move.l d0,-(sp)
    6892:	2f2f 01d0      	move.l 464(sp),-(sp)
    6896:	2f2f 0056      	move.l 86(sp),-(sp)
    689a:	4eba 020a      	jsr 6aa6 <TestRow>(pc)
    689e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    68a2:	722a           	moveq #42,d1
    68a4:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    68a8:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<4;i2++) {
    68ac:	42af 007a      	clr.l 122(sp)
    68b0:	605c           	bra.s 690e <TestZoom4Picture+0x2cca>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    68b2:	202f 007a      	move.l 122(sp),d0
    68b6:	d080           	add.l d0,d0
    68b8:	2200           	move.l d0,d1
    68ba:	5281           	addq.l #1,d1
    68bc:	7000           	moveq #0,d0
    68be:	302f 01c6      	move.w 454(sp),d0
    68c2:	2f01           	move.l d1,-(sp)
    68c4:	2f00           	move.l d0,-(sp)
    68c6:	2f2f 01d0      	move.l 464(sp),-(sp)
    68ca:	2f2f 0056      	move.l 86(sp),-(sp)
    68ce:	4eba 01d6      	jsr 6aa6 <TestRow>(pc)
    68d2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    68d6:	702a           	moveq #42,d0
    68d8:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    68dc:	202f 007a      	move.l 122(sp),d0
    68e0:	5280           	addq.l #1,d0
    68e2:	d080           	add.l d0,d0
    68e4:	2200           	move.l d0,d1
    68e6:	7000           	moveq #0,d0
    68e8:	302f 01c6      	move.w 454(sp),d0
    68ec:	2f01           	move.l d1,-(sp)
    68ee:	2f00           	move.l d0,-(sp)
    68f0:	2f2f 01d0      	move.l 464(sp),-(sp)
    68f4:	2f2f 0056      	move.l 86(sp),-(sp)
    68f8:	4eba 01ac      	jsr 6aa6 <TestRow>(pc)
    68fc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6900:	722a           	moveq #42,d1
    6902:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6906:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    690a:	52af 007a      	addq.l #1,122(sp)
    690e:	7003           	moveq #3,d0
    6910:	b0af 007a      	cmp.l 122(sp),d0
    6914:	6c9c           	bge.s 68b2 <TestZoom4Picture+0x2c6e>
  }

  for(int i=0;i<7;i++) {  
    6916:	42af 0076      	clr.l 118(sp)
    691a:	6000 009c      	bra.w 69b8 <TestZoom4Picture+0x2d74>
    for(int i2=0;i2<18;i2++) {
    691e:	42af 0072      	clr.l 114(sp)
    6922:	6000 0086      	bra.w 69aa <TestZoom4Picture+0x2d66>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6926:	222f 0076      	move.l 118(sp),d1
    692a:	2001           	move.l d1,d0
    692c:	e988           	lsl.l #4,d0
    692e:	d081           	add.l d1,d0
    6930:	d080           	add.l d0,d0
    6932:	2040           	movea.l d0,a0
    6934:	d1c1           	adda.l d1,a0
    6936:	41e8 000b      	lea 11(a0),a0
    693a:	202f 0072      	move.l 114(sp),d0
    693e:	d080           	add.l d0,d0
    6940:	2208           	move.l a0,d1
    6942:	d280           	add.l d0,d1
    6944:	7000           	moveq #0,d0
    6946:	302f 01c6      	move.w 454(sp),d0
    694a:	2f01           	move.l d1,-(sp)
    694c:	2f00           	move.l d0,-(sp)
    694e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6952:	2f2f 0056      	move.l 86(sp),-(sp)
    6956:	4eba 014e      	jsr 6aa6 <TestRow>(pc)
    695a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    695e:	722a           	moveq #42,d1
    6960:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6964:	222f 0076      	move.l 118(sp),d1
    6968:	2001           	move.l d1,d0
    696a:	e988           	lsl.l #4,d0
    696c:	d081           	add.l d1,d0
    696e:	d080           	add.l d0,d0
    6970:	2040           	movea.l d0,a0
    6972:	d1c1           	adda.l d1,a0
    6974:	41e8 000c      	lea 12(a0),a0
    6978:	202f 0072      	move.l 114(sp),d0
    697c:	d080           	add.l d0,d0
    697e:	2208           	move.l a0,d1
    6980:	d280           	add.l d0,d1
    6982:	7000           	moveq #0,d0
    6984:	302f 01c6      	move.w 454(sp),d0
    6988:	2f01           	move.l d1,-(sp)
    698a:	2f00           	move.l d0,-(sp)
    698c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6990:	2f2f 0056      	move.l 86(sp),-(sp)
    6994:	4eba 0110      	jsr 6aa6 <TestRow>(pc)
    6998:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    699c:	702a           	moveq #42,d0
    699e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    69a2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) {
    69a6:	52af 0072      	addq.l #1,114(sp)
    69aa:	7211           	moveq #17,d1
    69ac:	b2af 0072      	cmp.l 114(sp),d1
    69b0:	6c00 ff74      	bge.w 6926 <TestZoom4Picture+0x2ce2>
  for(int i=0;i<7;i++) {  
    69b4:	52af 0076      	addq.l #1,118(sp)
    69b8:	7006           	moveq #6,d0
    69ba:	b0af 0076      	cmp.l 118(sp),d0
    69be:	6c00 ff5e      	bge.w 691e <TestZoom4Picture+0x2cda>
    }
  } 

  for(int i2=0;i2<4;i2++) {
    69c2:	42af 006e      	clr.l 110(sp)
    69c6:	6064           	bra.s 6a2c <TestZoom4Picture+0x2de8>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    69c8:	202f 006e      	move.l 110(sp),d0
    69cc:	0680 0000 0080 	addi.l #128,d0
    69d2:	d080           	add.l d0,d0
    69d4:	2200           	move.l d0,d1
    69d6:	7000           	moveq #0,d0
    69d8:	302f 01c6      	move.w 454(sp),d0
    69dc:	2f01           	move.l d1,-(sp)
    69de:	2f00           	move.l d0,-(sp)
    69e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    69e4:	2f2f 0056      	move.l 86(sp),-(sp)
    69e8:	4eba 00bc      	jsr 6aa6 <TestRow>(pc)
    69ec:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    69f0:	722a           	moveq #42,d1
    69f2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    69f6:	202f 006e      	move.l 110(sp),d0
    69fa:	d080           	add.l d0,d0
    69fc:	2200           	move.l d0,d1
    69fe:	0681 0000 0101 	addi.l #257,d1
    6a04:	7000           	moveq #0,d0
    6a06:	302f 01c6      	move.w 454(sp),d0
    6a0a:	2f01           	move.l d1,-(sp)
    6a0c:	2f00           	move.l d0,-(sp)
    6a0e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a12:	2f2f 0056      	move.l 86(sp),-(sp)
    6a16:	4eba 008e      	jsr 6aa6 <TestRow>(pc)
    6a1a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a1e:	702a           	moveq #42,d0
    6a20:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6a24:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6a28:	52af 006e      	addq.l #1,110(sp)
    6a2c:	7203           	moveq #3,d1
    6a2e:	b2af 006e      	cmp.l 110(sp),d1
    6a32:	6c94           	bge.s 69c8 <TestZoom4Picture+0x2d84>
  }
  TestRow( valsupposed, valactual, mask, 0);
    6a34:	7000           	moveq #0,d0
    6a36:	302f 01c6      	move.w 454(sp),d0
    6a3a:	42a7           	clr.l -(sp)
    6a3c:	2f00           	move.l d0,-(sp)
    6a3e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a42:	2f2f 0056      	move.l 86(sp),-(sp)
    6a46:	4eba 005e      	jsr 6aa6 <TestRow>(pc)
    6a4a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6a4e:	702a           	moveq #42,d0
    6a50:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6a54:	466f 01c6      	not.w 454(sp)
  FreeMem( source, (ZMLINESIZE+4)*272);
    6a58:	2f6f 005e 0042 	move.l 94(sp),66(sp)
    6a5e:	2f7c 0000 30e0 	move.l #12512,62(sp)
    6a64:	003e 
    6a66:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    6a6c:	2c40           	movea.l d0,a6
    6a6e:	226f 0042      	movea.l 66(sp),a1
    6a72:	202f 003e      	move.l 62(sp),d0
    6a76:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    6a7a:	2f6f 004e 003a 	move.l 78(sp),58(sp)
    6a80:	2f7c 0000 30e0 	move.l #12512,54(sp)
    6a86:	0036 
    6a88:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    6a8e:	2c40           	movea.l d0,a6
    6a90:	226f 003a      	movea.l 58(sp),a1
    6a94:	202f 0036      	move.l 54(sp),d0
    6a98:	4eae ff2e      	jsr -210(a6)
}
    6a9c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    6aa0:	4fef 01d0      	lea 464(sp),sp
    6aa4:	4e75           	rts

00006aa6 <TestRow>:

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    6aa6:	4fef ff40      	lea -192(sp),sp
    6aaa:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
    6aae:	202f 00e0      	move.l 224(sp),d0
    6ab2:	3000           	move.w d0,d0
    6ab4:	3f40 0016      	move.w d0,22(sp)
  
  char str[ 100] = { 0 };
    6ab8:	42af 001c      	clr.l 28(sp)
    6abc:	7020           	moveq #32,d0
    6abe:	d08f           	add.l sp,d0
    6ac0:	7260           	moveq #96,d1
    6ac2:	2f01           	move.l d1,-(sp)
    6ac4:	42a7           	clr.l -(sp)
    6ac6:	2f00           	move.l d0,-(sp)
    6ac8:	4eba 020c      	jsr 6cd6 <memset>(pc)
    6acc:	4fef 000c      	lea 12(sp),sp
  UWORD data[2];
  data[1] = numberofline;
    6ad0:	202f 00e4      	move.l 228(sp),d0
    6ad4:	3f40 001a      	move.w d0,26(sp)

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    6ad8:	42af 00d0      	clr.l 208(sp)
    6adc:	6000 00d4      	bra.w 6bb2 <TestRow+0x10c>
    if( (*testpattern++ ^ xormask) != *destination++) {
    6ae0:	202f 00d8      	move.l 216(sp),d0
    6ae4:	2200           	move.l d0,d1
    6ae6:	5481           	addq.l #2,d1
    6ae8:	2f41 00d8      	move.l d1,216(sp)
    6aec:	2040           	movea.l d0,a0
    6aee:	3010           	move.w (a0),d0
    6af0:	322f 0016      	move.w 22(sp),d1
    6af4:	b141           	eor.w d0,d1
    6af6:	202f 00dc      	move.l 220(sp),d0
    6afa:	2400           	move.l d0,d2
    6afc:	5482           	addq.l #2,d2
    6afe:	2f42 00dc      	move.l d2,220(sp)
    6b02:	2040           	movea.l d0,a0
    6b04:	3010           	move.w (a0),d0
    6b06:	b041           	cmp.w d1,d0
    6b08:	6700 00a4      	beq.w 6bae <TestRow+0x108>
      data[0] = i;
    6b0c:	202f 00d0      	move.l 208(sp),d0
    6b10:	3f40 0018      	move.w d0,24(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    6b14:	2f7c 0000 8450 	move.l #33872,164(sp)
    6b1a:	00a4 
    6b1c:	702b           	moveq #43,d0
    6b1e:	4600           	not.b d0
    6b20:	d08f           	add.l sp,d0
    6b22:	0680 ffff ff44 	addi.l #-188,d0
    6b28:	2f40 00a0      	move.l d0,160(sp)
    6b2c:	2f7c 0000 7174 	move.l #29044,156(sp)
    6b32:	009c 
    6b34:	722b           	moveq #43,d1
    6b36:	4601           	not.b d1
    6b38:	d28f           	add.l sp,d1
    6b3a:	0681 ffff ff48 	addi.l #-184,d1
    6b40:	2f41 0098      	move.l d1,152(sp)
    6b44:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    6b4a:	2c40           	movea.l d0,a6
    6b4c:	206f 00a4      	movea.l 164(sp),a0
    6b50:	226f 00a0      	movea.l 160(sp),a1
    6b54:	246f 009c      	movea.l 156(sp),a2
    6b58:	266f 0098      	movea.l 152(sp),a3
    6b5c:	4eae fdf6      	jsr -522(a6)
    6b60:	2f40 0094      	move.l d0,148(sp)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    6b64:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    6b6a:	2c40           	movea.l d0,a6
    6b6c:	4eae ffc4      	jsr -60(a6)
    6b70:	2f40 0090      	move.l d0,144(sp)
    6b74:	202f 0090      	move.l 144(sp),d0
    6b78:	2f40 008c      	move.l d0,140(sp)
    6b7c:	742b           	moveq #43,d2
    6b7e:	4602           	not.b d2
    6b80:	d48f           	add.l sp,d2
    6b82:	0682 ffff ff48 	addi.l #-184,d2
    6b88:	2f42 0088      	move.l d2,136(sp)
    6b8c:	7064           	moveq #100,d0
    6b8e:	2f40 0084      	move.l d0,132(sp)
    6b92:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    6b98:	2c40           	movea.l d0,a6
    6b9a:	222f 008c      	move.l 140(sp),d1
    6b9e:	242f 0088      	move.l 136(sp),d2
    6ba2:	262f 0084      	move.l 132(sp),d3
    6ba6:	4eae ffd0      	jsr -48(a6)
    6baa:	2f40 0080      	move.l d0,128(sp)
  for(int i=0;i<21;i++) {
    6bae:	52af 00d0      	addq.l #1,208(sp)
    6bb2:	7214           	moveq #20,d1
    6bb4:	b2af 00d0      	cmp.l 208(sp),d1
    6bb8:	6c00 ff26      	bge.w 6ae0 <TestRow+0x3a>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    6bbc:	206f 00d8      	movea.l 216(sp),a0
    6bc0:	3010           	move.w (a0),d0
    6bc2:	322f 0016      	move.w 22(sp),d1
    6bc6:	b141           	eor.w d0,d1
    6bc8:	206f 00dc      	movea.l 220(sp),a0
    6bcc:	3010           	move.w (a0),d0
    6bce:	b340           	eor.w d1,d0
    6bd0:	3000           	move.w d0,d0
    6bd2:	0280 0000 ffff 	andi.l #65535,d0
    6bd8:	0280 0000 ff00 	andi.l #65280,d0
    6bde:	6700 00cc      	beq.w 6cac <TestRow+0x206>
    data[0] = 21;
    6be2:	3f7c 0015 0018 	move.w #21,24(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    6be8:	2f7c 0000 8450 	move.l #33872,204(sp)
    6bee:	00cc 
    6bf0:	742b           	moveq #43,d2
    6bf2:	4602           	not.b d2
    6bf4:	d48f           	add.l sp,d2
    6bf6:	0682 ffff ff44 	addi.l #-188,d2
    6bfc:	2f42 00c8      	move.l d2,200(sp)
    6c00:	2f7c 0000 7174 	move.l #29044,196(sp)
    6c06:	00c4 
    6c08:	702b           	moveq #43,d0
    6c0a:	4600           	not.b d0
    6c0c:	d08f           	add.l sp,d0
    6c0e:	0680 ffff ff48 	addi.l #-184,d0
    6c14:	2f40 00c0      	move.l d0,192(sp)
    6c18:	2039 0010 3298 	move.l 103298 <SysBase>,d0
    6c1e:	2c40           	movea.l d0,a6
    6c20:	206f 00cc      	movea.l 204(sp),a0
    6c24:	226f 00c8      	movea.l 200(sp),a1
    6c28:	246f 00c4      	movea.l 196(sp),a2
    6c2c:	266f 00c0      	movea.l 192(sp),a3
    6c30:	4eae fdf6      	jsr -522(a6)
    6c34:	2f40 00bc      	move.l d0,188(sp)
                                                                           str);
    Write(  Output(), str, 100);
    6c38:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    6c3e:	2c40           	movea.l d0,a6
    6c40:	4eae ffc4      	jsr -60(a6)
    6c44:	2f40 00b8      	move.l d0,184(sp)
    6c48:	202f 00b8      	move.l 184(sp),d0
    6c4c:	2f40 00b4      	move.l d0,180(sp)
    6c50:	722b           	moveq #43,d1
    6c52:	4601           	not.b d1
    6c54:	d28f           	add.l sp,d1
    6c56:	0681 ffff ff48 	addi.l #-184,d1
    6c5c:	2f41 00b0      	move.l d1,176(sp)
    6c60:	7464           	moveq #100,d2
    6c62:	2f42 00ac      	move.l d2,172(sp)
    6c66:	2039 0010 32a0 	move.l 1032a0 <DOSBase>,d0
    6c6c:	2c40           	movea.l d0,a6
    6c6e:	222f 00b4      	move.l 180(sp),d1
    6c72:	242f 00b0      	move.l 176(sp),d2
    6c76:	262f 00ac      	move.l 172(sp),d3
    6c7a:	4eae ffd0      	jsr -48(a6)
    6c7e:	2f40 00a8      	move.l d0,168(sp)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
    6c82:	206f 00dc      	movea.l 220(sp),a0
    6c86:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6c88:	7200           	moveq #0,d1
    6c8a:	3200           	move.w d0,d1
                                                   *testpattern,*destination);
    6c8c:	206f 00d8      	movea.l 216(sp),a0
    6c90:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6c92:	3000           	move.w d0,d0
    6c94:	0280 0000 ffff 	andi.l #65535,d0
    6c9a:	2f01           	move.l d1,-(sp)
    6c9c:	2f00           	move.l d0,-(sp)
    6c9e:	4879 0000 8480 	pea 8480 <rundemo.c.95627ee6+0x187>
    6ca4:	4eba 0162      	jsr 6e08 <KPrintF>(pc)
    6ca8:	4fef 000c      	lea 12(sp),sp
     
  }
}
    6cac:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    6cb0:	4fef 00c0      	lea 192(sp),sp
    6cb4:	4e75           	rts

00006cb6 <strlen>:
{
    6cb6:	598f           	subq.l #4,sp
	unsigned long t=0;
    6cb8:	4297           	clr.l (sp)
    6cba:	6002           	bra.s 6cbe <strlen+0x8>
		t++;
    6cbc:	5297           	addq.l #1,(sp)
	while(*s++)
    6cbe:	202f 0008      	move.l 8(sp),d0
    6cc2:	2200           	move.l d0,d1
    6cc4:	5281           	addq.l #1,d1
    6cc6:	2f41 0008      	move.l d1,8(sp)
    6cca:	2040           	movea.l d0,a0
    6ccc:	1010           	move.b (a0),d0
    6cce:	66ec           	bne.s 6cbc <strlen+0x6>
	return t;
    6cd0:	2017           	move.l (sp),d0
}
    6cd2:	588f           	addq.l #4,sp
    6cd4:	4e75           	rts

00006cd6 <memset>:
{
    6cd6:	4e55 fffc      	link.w a5,#-4
	unsigned char *ptr = (unsigned char *)dest;
    6cda:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
    6ce0:	6014           	bra.s 6cf6 <memset+0x20>
		*ptr++ = val;
    6ce2:	202d fffc      	move.l -4(a5),d0
    6ce6:	2200           	move.l d0,d1
    6ce8:	5281           	addq.l #1,d1
    6cea:	2b41 fffc      	move.l d1,-4(a5)
    6cee:	222d 000c      	move.l 12(a5),d1
    6cf2:	2040           	movea.l d0,a0
    6cf4:	1081           	move.b d1,(a0)
	while(len-- > 0)
    6cf6:	202d 0010      	move.l 16(a5),d0
    6cfa:	2200           	move.l d0,d1
    6cfc:	5381           	subq.l #1,d1
    6cfe:	2b41 0010      	move.l d1,16(a5)
    6d02:	4a80           	tst.l d0
    6d04:	66dc           	bne.s 6ce2 <memset+0xc>
	return dest;
    6d06:	202d 0008      	move.l 8(a5),d0
}
    6d0a:	4e5d           	unlk a5
    6d0c:	4e75           	rts

00006d0e <memcpy>:
{
    6d0e:	4e55 fff8      	link.w a5,#-8
    6d12:	2f02           	move.l d2,-(sp)
	char *d = (char *)dest;
    6d14:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = (const char *)src;
    6d1a:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
    6d20:	6020           	bra.s 6d42 <memcpy+0x34>
		*d++ = *s++;
    6d22:	222d fff8      	move.l -8(a5),d1
    6d26:	2001           	move.l d1,d0
    6d28:	5280           	addq.l #1,d0
    6d2a:	2b40 fff8      	move.l d0,-8(a5)
    6d2e:	202d fffc      	move.l -4(a5),d0
    6d32:	2400           	move.l d0,d2
    6d34:	5282           	addq.l #1,d2
    6d36:	2b42 fffc      	move.l d2,-4(a5)
    6d3a:	2041           	movea.l d1,a0
    6d3c:	1210           	move.b (a0),d1
    6d3e:	2040           	movea.l d0,a0
    6d40:	1081           	move.b d1,(a0)
	while(len--)
    6d42:	202d 0010      	move.l 16(a5),d0
    6d46:	2200           	move.l d0,d1
    6d48:	5381           	subq.l #1,d1
    6d4a:	2b41 0010      	move.l d1,16(a5)
    6d4e:	4a80           	tst.l d0
    6d50:	66d0           	bne.s 6d22 <memcpy+0x14>
	return dest;
    6d52:	202d 0008      	move.l 8(a5),d0
}
    6d56:	241f           	move.l (sp)+,d2
    6d58:	4e5d           	unlk a5
    6d5a:	4e75           	rts

00006d5c <memmove>:
{
    6d5c:	4e55 fff0      	link.w a5,#-16
    6d60:	2f02           	move.l d2,-(sp)
	char *d = dest;
    6d62:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = src;
    6d68:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
	if (d < s) {
    6d6e:	202d fffc      	move.l -4(a5),d0
    6d72:	b0ad fff8      	cmp.l -8(a5),d0
    6d76:	6522           	bcs.s 6d9a <memmove+0x3e>
    6d78:	6032           	bra.s 6dac <memmove+0x50>
			*d++ = *s++;
    6d7a:	222d fff8      	move.l -8(a5),d1
    6d7e:	2401           	move.l d1,d2
    6d80:	5282           	addq.l #1,d2
    6d82:	2b42 fff8      	move.l d2,-8(a5)
    6d86:	202d fffc      	move.l -4(a5),d0
    6d8a:	2400           	move.l d0,d2
    6d8c:	5282           	addq.l #1,d2
    6d8e:	2b42 fffc      	move.l d2,-4(a5)
    6d92:	2041           	movea.l d1,a0
    6d94:	1210           	move.b (a0),d1
    6d96:	2040           	movea.l d0,a0
    6d98:	1081           	move.b d1,(a0)
		while (len--)
    6d9a:	202d 0010      	move.l 16(a5),d0
    6d9e:	2200           	move.l d0,d1
    6da0:	5381           	subq.l #1,d1
    6da2:	2b41 0010      	move.l d1,16(a5)
    6da6:	4a80           	tst.l d0
    6da8:	66d0           	bne.s 6d7a <memmove+0x1e>
    6daa:	6052           	bra.s 6dfe <memmove+0xa2>
		const char *lasts = s + (len - 1);
    6dac:	202d 0010      	move.l 16(a5),d0
    6db0:	5380           	subq.l #1,d0
    6db2:	242d fff8      	move.l -8(a5),d2
    6db6:	d480           	add.l d0,d2
    6db8:	2b42 fff4      	move.l d2,-12(a5)
		char *lastd = d + (len - 1);
    6dbc:	202d 0010      	move.l 16(a5),d0
    6dc0:	5380           	subq.l #1,d0
    6dc2:	222d fffc      	move.l -4(a5),d1
    6dc6:	d280           	add.l d0,d1
    6dc8:	2b41 fff0      	move.l d1,-16(a5)
    6dcc:	6020           	bra.s 6dee <memmove+0x92>
			*lastd-- = *lasts--;
    6dce:	222d fff4      	move.l -12(a5),d1
    6dd2:	2401           	move.l d1,d2
    6dd4:	5382           	subq.l #1,d2
    6dd6:	2b42 fff4      	move.l d2,-12(a5)
    6dda:	202d fff0      	move.l -16(a5),d0
    6dde:	2400           	move.l d0,d2
    6de0:	5382           	subq.l #1,d2
    6de2:	2b42 fff0      	move.l d2,-16(a5)
    6de6:	2041           	movea.l d1,a0
    6de8:	1210           	move.b (a0),d1
    6dea:	2040           	movea.l d0,a0
    6dec:	1081           	move.b d1,(a0)
		while (len--)
    6dee:	202d 0010      	move.l 16(a5),d0
    6df2:	2200           	move.l d0,d1
    6df4:	5381           	subq.l #1,d1
    6df6:	2b41 0010      	move.l d1,16(a5)
    6dfa:	4a80           	tst.l d0
    6dfc:	66d0           	bne.s 6dce <memmove+0x72>
	return dest;
    6dfe:	202d 0008      	move.l 8(a5),d0
}
    6e02:	241f           	move.l (sp)+,d2
    6e04:	4e5d           	unlk a5
    6e06:	4e75           	rts

00006e08 <KPrintF>:
{
    6e08:	4fef ff80      	lea -128(sp),sp
    6e0c:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    6e10:	3039 00f0 ff60 	move.w f0ff60 <_end+0xe0cc74>,d0
    6e16:	0c40 4eb9      	cmpi.w #20153,d0
    6e1a:	6722           	beq.s 6e3e <KPrintF+0x36>
    6e1c:	0c40 a00e      	cmpi.w #-24562,d0
    6e20:	671c           	beq.s 6e3e <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    6e22:	2c79 0010 3298 	movea.l 103298 <SysBase>,a6
    6e28:	206f 0090      	movea.l 144(sp),a0
    6e2c:	43ef 0094      	lea 148(sp),a1
    6e30:	45f9 0000 7166 	lea 7166 <KPutCharX>,a2
    6e36:	97cb           	suba.l a3,a3
    6e38:	4eae fdf6      	jsr -522(a6)
    6e3c:	602a           	bra.s 6e68 <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    6e3e:	2c79 0010 3298 	movea.l 103298 <SysBase>,a6
    6e44:	206f 0090      	movea.l 144(sp),a0
    6e48:	43ef 0094      	lea 148(sp),a1
    6e4c:	45f9 0000 7174 	lea 7174 <PutChar>,a2
    6e52:	47ef 000c      	lea 12(sp),a3
    6e56:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    6e5a:	2f0b           	move.l a3,-(sp)
    6e5c:	4878 0056      	pea 56 <_start+0x56>
    6e60:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xe0cc74>
    6e66:	508f           	addq.l #8,sp
}
    6e68:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    6e6c:	4fef 0080      	lea 128(sp),sp
    6e70:	4e75           	rts

00006e72 <warpmode>:

void warpmode(int on) // bool
{
    6e72:	518f           	subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
    6e74:	2f7c 00f0 ff60 	move.l #15794016,4(sp)
    6e7a:	0004 
    if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
    6e7c:	206f 0004      	movea.l 4(sp),a0
    6e80:	3010           	move.w (a0),d0
    6e82:	0c40 4eb9      	cmpi.w #20153,d0
    6e86:	670c           	beq.s 6e94 <warpmode+0x22>
    6e88:	206f 0004      	movea.l 4(sp),a0
    6e8c:	3010           	move.w (a0),d0
    6e8e:	0c40 a00e      	cmpi.w #-24562,d0
    6e92:	6668           	bne.s 6efc <warpmode+0x8a>
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    6e94:	4aaf 000c      	tst.l 12(sp)
    6e98:	6708           	beq.s 6ea2 <warpmode+0x30>
    6e9a:	203c 0000 84a6 	move.l #33958,d0
    6ea0:	6006           	bra.s 6ea8 <warpmode+0x36>
    6ea2:	203c 0000 84b0 	move.l #33968,d0
    6ea8:	4878 0001      	pea 1 <_start+0x1>
    6eac:	220f           	move.l sp,d1
    6eae:	5e81           	addq.l #7,d1
    6eb0:	2f01           	move.l d1,-(sp)
    6eb2:	42a7           	clr.l -(sp)
    6eb4:	2f00           	move.l d0,-(sp)
    6eb6:	4878 ffff      	pea ffffffff <_end+0xffefcd13>
    6eba:	4878 0052      	pea 52 <_start+0x52>
    6ebe:	206f 001c      	movea.l 28(sp),a0
    6ec2:	4e90           	jsr (a0)
    6ec4:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    6ec8:	4aaf 000c      	tst.l 12(sp)
    6ecc:	6708           	beq.s 6ed6 <warpmode+0x64>
    6ece:	203c 0000 84bb 	move.l #33979,d0
    6ed4:	6006           	bra.s 6edc <warpmode+0x6a>
    6ed6:	203c 0000 84d5 	move.l #34005,d0
    6edc:	4878 0001      	pea 1 <_start+0x1>
    6ee0:	220f           	move.l sp,d1
    6ee2:	5e81           	addq.l #7,d1
    6ee4:	2f01           	move.l d1,-(sp)
    6ee6:	42a7           	clr.l -(sp)
    6ee8:	2f00           	move.l d0,-(sp)
    6eea:	4878 ffff      	pea ffffffff <_end+0xffefcd13>
    6eee:	4878 0052      	pea 52 <_start+0x52>
    6ef2:	206f 001c      	movea.l 28(sp),a0
    6ef6:	4e90           	jsr (a0)
    6ef8:	4fef 0018      	lea 24(sp),sp
	}
}
    6efc:	508f           	addq.l #8,sp
    6efe:	4e75           	rts

00006f00 <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4)
{
    6f00:	598f           	subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
    6f02:	2ebc 00f0 ff60 	move.l #15794016,(sp)
    if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    6f08:	2057           	movea.l (sp),a0
    6f0a:	3010           	move.w (a0),d0
    6f0c:	0c40 4eb9      	cmpi.w #20153,d0
    6f10:	670a           	beq.s 6f1c <debug_cmd+0x1c>
    6f12:	2057           	movea.l (sp),a0
    6f14:	3010           	move.w (a0),d0
    6f16:	0c40 a00e      	cmpi.w #-24562,d0
    6f1a:	661e           	bne.s 6f3a <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
    6f1c:	2f2f 0014      	move.l 20(sp),-(sp)
    6f20:	2f2f 0014      	move.l 20(sp),-(sp)
    6f24:	2f2f 0014      	move.l 20(sp),-(sp)
    6f28:	2f2f 0014      	move.l 20(sp),-(sp)
    6f2c:	4878 0058      	pea 58 <_start+0x58>
    6f30:	206f 0014      	movea.l 20(sp),a0
    6f34:	4e90           	jsr (a0)
    6f36:	4fef 0014      	lea 20(sp),sp
	}
}
    6f3a:	588f           	addq.l #4,sp
    6f3c:	4e75           	rts

00006f3e <debug_clear>:
	barto_cmd_text,
};

void debug_clear()
{
	debug_cmd(barto_cmd_clear, 0, 0, 0);
    6f3e:	42a7           	clr.l -(sp)
    6f40:	42a7           	clr.l -(sp)
    6f42:	42a7           	clr.l -(sp)
    6f44:	42a7           	clr.l -(sp)
    6f46:	4eba ffb8      	jsr 6f00 <debug_cmd>(pc)
    6f4a:	4fef 0010      	lea 16(sp),sp
}
    6f4e:	4e75           	rts

00006f50 <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color)
{
    6f50:	518f           	subq.l #8,sp
    6f52:	2f02           	move.l d2,-(sp)
    6f54:	226f 0010      	movea.l 16(sp),a1
    6f58:	206f 0014      	movea.l 20(sp),a0
    6f5c:	222f 0018      	move.l 24(sp),d1
    6f60:	202f 001c      	move.l 28(sp),d0
    6f64:	3249           	movea.w a1,a1
    6f66:	3f49 000a      	move.w a1,10(sp)
    6f6a:	3048           	movea.w a0,a0
    6f6c:	3f48 0008      	move.w a0,8(sp)
    6f70:	3201           	move.w d1,d1
    6f72:	3f41 0006      	move.w d1,6(sp)
    6f76:	3000           	move.w d0,d0
    6f78:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    6f7c:	302f 0006      	move.w 6(sp),d0
    6f80:	48c0           	ext.l d0
    6f82:	4840           	swap d0
    6f84:	4240           	clr.w d0
    6f86:	322f 0004      	move.w 4(sp),d1
    6f8a:	48c1           	ext.l d1
    6f8c:	8280           	or.l d0,d1
    6f8e:	302f 000a      	move.w 10(sp),d0
    6f92:	48c0           	ext.l d0
    6f94:	4840           	swap d0
    6f96:	4240           	clr.w d0
    6f98:	306f 0008      	movea.w 8(sp),a0
    6f9c:	2408           	move.l a0,d2
    6f9e:	8082           	or.l d2,d0
    6fa0:	2f2f 0020      	move.l 32(sp),-(sp)
    6fa4:	2f01           	move.l d1,-(sp)
    6fa6:	2f00           	move.l d0,-(sp)
    6fa8:	4878 0001      	pea 1 <_start+0x1>
    6fac:	4eba ff52      	jsr 6f00 <debug_cmd>(pc)
    6fb0:	4fef 0010      	lea 16(sp),sp
}
    6fb4:	241f           	move.l (sp)+,d2
    6fb6:	508f           	addq.l #8,sp
    6fb8:	4e75           	rts

00006fba <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color)
{
    6fba:	518f           	subq.l #8,sp
    6fbc:	2f02           	move.l d2,-(sp)
    6fbe:	226f 0010      	movea.l 16(sp),a1
    6fc2:	206f 0014      	movea.l 20(sp),a0
    6fc6:	222f 0018      	move.l 24(sp),d1
    6fca:	202f 001c      	move.l 28(sp),d0
    6fce:	3249           	movea.w a1,a1
    6fd0:	3f49 000a      	move.w a1,10(sp)
    6fd4:	3048           	movea.w a0,a0
    6fd6:	3f48 0008      	move.w a0,8(sp)
    6fda:	3201           	move.w d1,d1
    6fdc:	3f41 0006      	move.w d1,6(sp)
    6fe0:	3000           	move.w d0,d0
    6fe2:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    6fe6:	302f 0006      	move.w 6(sp),d0
    6fea:	48c0           	ext.l d0
    6fec:	4840           	swap d0
    6fee:	4240           	clr.w d0
    6ff0:	322f 0004      	move.w 4(sp),d1
    6ff4:	48c1           	ext.l d1
    6ff6:	8280           	or.l d0,d1
    6ff8:	302f 000a      	move.w 10(sp),d0
    6ffc:	48c0           	ext.l d0
    6ffe:	4840           	swap d0
    7000:	4240           	clr.w d0
    7002:	306f 0008      	movea.w 8(sp),a0
    7006:	2408           	move.l a0,d2
    7008:	8082           	or.l d2,d0
    700a:	2f2f 0020      	move.l 32(sp),-(sp)
    700e:	2f01           	move.l d1,-(sp)
    7010:	2f00           	move.l d0,-(sp)
    7012:	4878 0002      	pea 2 <_start+0x2>
    7016:	4eba fee8      	jsr 6f00 <debug_cmd>(pc)
    701a:	4fef 0010      	lea 16(sp),sp
}
    701e:	241f           	move.l (sp)+,d2
    7020:	508f           	addq.l #8,sp
    7022:	4e75           	rts

00007024 <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color)
{
    7024:	598f           	subq.l #4,sp
    7026:	2f02           	move.l d2,-(sp)
    7028:	222f 000c      	move.l 12(sp),d1
    702c:	202f 0010      	move.l 16(sp),d0
    7030:	3201           	move.w d1,d1
    7032:	3f41 0006      	move.w d1,6(sp)
    7036:	3000           	move.w d0,d0
    7038:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
    703c:	202f 0014      	move.l 20(sp),d0
    7040:	322f 0006      	move.w 6(sp),d1
    7044:	48c1           	ext.l d1
    7046:	4841           	swap d1
    7048:	4241           	clr.w d1
    704a:	306f 0004      	movea.w 4(sp),a0
    704e:	2408           	move.l a0,d2
    7050:	8282           	or.l d2,d1
    7052:	2f2f 0018      	move.l 24(sp),-(sp)
    7056:	2f00           	move.l d0,-(sp)
    7058:	2f01           	move.l d1,-(sp)
    705a:	4878 0003      	pea 3 <_start+0x3>
    705e:	4eba fea0      	jsr 6f00 <debug_cmd>(pc)
    7062:	4fef 0010      	lea 16(sp),sp
}
    7066:	241f           	move.l (sp)+,d2
    7068:	588f           	addq.l #4,sp
    706a:	4e75           	rts

0000706c <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    706c:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    7070:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    7074:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    7078:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    707c:	d041           	add.w d1,d0
	swap	d0
    707e:	4840           	swap d0
	clrw	d0
    7080:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    7082:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    7086:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    708a:	d081           	add.l d1,d0
	rts
    708c:	4e75           	rts

0000708e <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    708e:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    7090:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    7094:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    7098:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    709e:	6416           	bcc.s 70b6 <__udivsi3+0x28>
	movel	d0, d2
    70a0:	2400           	move.l d0,d2
	clrw	d2
    70a2:	4242           	clr.w d2
	swap	d2
    70a4:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    70a6:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    70a8:	3002           	move.w d2,d0
	swap	d0
    70aa:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    70ac:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    70b0:	84c1           	divu.w d1,d2
	movew	d2, d0
    70b2:	3002           	move.w d2,d0
	jra	6f
    70b4:	6030           	bra.s 70e6 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    70b6:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    70b8:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    70ba:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    70bc:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    70c2:	64f4           	bcc.s 70b8 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    70c4:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    70c6:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    70cc:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    70ce:	c2c0           	mulu.w d0,d1
	swap	d2
    70d0:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    70d2:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    70d4:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    70d6:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    70d8:	660a           	bne.s 70e4 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    70da:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    70dc:	6506           	bcs.s 70e4 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    70de:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    70e2:	6302           	bls.s 70e6 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    70e4:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    70e6:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    70e8:	4e75           	rts

000070ea <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    70ea:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    70ec:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    70ee:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    70f2:	6a04           	bpl.s 70f8 <__divsi3+0xe>
	negl	d1
    70f4:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    70f6:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    70f8:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    70fc:	6a04           	bpl.s 7102 <__divsi3+0x18>
	negl	d0
    70fe:	4480           	neg.l d0
	negb	d2
    7100:	4402           	neg.b d2

2:	movel	d1, sp@-
    7102:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    7104:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    7106:	6186           	bsr.s 708e <__udivsi3>
	addql	IMM (8), sp
    7108:	508f           	addq.l #8,sp

	tstb	d2
    710a:	4a02           	tst.b d2
	jpl	3f
    710c:	6a02           	bpl.s 7110 <__divsi3+0x26>
	negl	d0
    710e:	4480           	neg.l d0

3:	movel	sp@+, d2
    7110:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    7112:	4e75           	rts

00007114 <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    7114:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7118:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    711c:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    711e:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    7120:	61c8           	bsr.s 70ea <__divsi3>
	addql	IMM (8), sp
    7122:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    7124:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    7128:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    712a:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    712c:	6100 ff3e      	bsr.w 706c <__mulsi3>
	addql	IMM (8), sp
    7130:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    7132:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    7136:	9280           	sub.l d0,d1
	movel	d1, d0
    7138:	2001           	move.l d1,d0
	rts
    713a:	4e75           	rts

0000713c <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    713c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7140:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    7144:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7146:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    7148:	6100 ff44      	bsr.w 708e <__udivsi3>
	addql	IMM (8), sp
    714c:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    714e:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    7152:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7154:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    7156:	6100 ff14      	bsr.w 706c <__mulsi3>
	addql	IMM (8), sp
    715a:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    715c:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    7160:	9280           	sub.l d0,d1
	movel	d1, d0
    7162:	2001           	move.l d1,d0
	rts
    7164:	4e75           	rts

00007166 <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    7166:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    7168:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    716c:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    7170:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    7172:	4e75           	rts

00007174 <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    7174:	16c0           	move.b d0,(a3)+
	rts
    7176:	4e75           	rts

00007178 <c2p1x1_8_c5_gen_init>:
	.text
	FUNC(c2p1x1_8_c5_gen_init)
	.globl	SYM (c2p1x1_8_c5_gen_init)

SYM(c2p1x1_8_c5_gen_init):
	movem.l d0-d7/a0-a6, .gi_saveregs	
    7178:	48f9 7fff 0000 	movem.l d0-a6,71b8 <.gi_saveregs>
    717e:	71b8 
	move.l  4(sp),d0
    7180:	202f 0004      	move.l 4(sp),d0
	move.l	8(sp),d1
    7184:	222f 0008      	move.l 8(sp),d1
	move.l	12(sp),d2
    7188:	242f 000c      	move.l 12(sp),d2
	move.l	16(sp),d3
    718c:	262f 0010      	move.l 16(sp),d3
	move.l  20(sp),d4
    7190:	282f 0014      	move.l 20(sp),d4
	move.l	24(sp),d5
    7194:	2a2f 0018      	move.l 24(sp),d5
	andi.l	IMM (0xffff),d0
    7198:	0280 0000 ffff 	andi.l #65535,d0
	mulu.w	d0,d3
    719e:	c6c0           	mulu.w d0,d3
	lsr.l	#3,d3
    71a0:	e68b           	lsr.l #3,d3
	move.l	d3,c2p1x1_8_c5_gen_scroffs
    71a2:	23c3 0000 750e 	move.l d3,750e <c2p1x1_8_c5_gen_scroffs>
	mulu.w	d0,d1
    71a8:	c2c0           	mulu.w d0,d1
	move.l	d1,c2p1x1_8_c5_gen_pixels
    71aa:	23c1 0000 7512 	move.l d1,7512 <c2p1x1_8_c5_gen_pixels>
	movem.l	.gi_saveregs,d0-d7/a0-a6
    71b0:	4cfa 7fff 0004 	movem.l 71b8 <.gi_saveregs>(pc),d0-a6
	rts
    71b6:	4e75           	rts

000071b8 <.gi_saveregs>:
	...

000071f4 <c2p1x1_8_c5_gen>:
	.text
	FUNC(c2p1x1_8_c5_gen)
	.globl	SYM (c2p1x1_8_c5_gen)

SYM(c2p1x1_8_c5_gen):
	movem.l d0-d7/a0-a6,.c2p_saveregs	
    71f4:	48f9 7fff 0000 	movem.l d0-a6,74d2 <.c2p_saveregs>
    71fa:	74d2 
	movem.l 4(sp),a0
    71fc:	4cef 0100 0004 	movem.l 4(sp),a0
	movem.l 8(sp),a1
    7202:	4cef 0200 0008 	movem.l 8(sp),a1
    move.l	IMM (0x33333333),d5
    7208:	2a3c 3333 3333 	move.l #858993459,d5
	move.l	IMM (0x55555555),a6
    720e:	2c7c 5555 5555 	movea.l #1431655765,a6

	add.w	#BPLSIZE,a1
    7214:	d2fc 2bf8      	adda.w #11256,a1
	add.l	c2p1x1_8_c5_gen_scroffs,a1
    7218:	d3fa 02f4      	adda.l 750e <c2p1x1_8_c5_gen_scroffs>(pc),a1

	move.l	c2p1x1_8_c5_gen_pixels,a2
    721c:	247a 02f4      	movea.l 7512 <c2p1x1_8_c5_gen_pixels>(pc),a2
	add.l	a0,a2
    7220:	d5c8           	adda.l a0,a2
	cmp.l	a0,a2
    7222:	b5c8           	cmpa.l a0,a2
	beq	.none
    7224:	6700 02a4      	beq.w 74ca <.none>

	movem.l	a0-a1,-(sp)
    7228:	48e7 00c0      	movem.l a0-a1,-(sp)

	move.l	(a0)+,d0
    722c:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    722e:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7230:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    7232:	2618           	move.l (a0)+,d3

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    7234:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    723a:	c084           	and.l d4,d0
	and.l	d4,d1
    723c:	c284           	and.l d4,d1
	and.l	d4,d2
    723e:	c484           	and.l d4,d2
	and.l	d4,d3
    7240:	c684           	and.l d4,d3
	lsl.l	#4,d0
    7242:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    7244:	e989           	lsl.l #4,d1
	or.l	d2,d0
    7246:	8082           	or.l d2,d0
	or.l	d3,d1
    7248:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    724a:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    724c:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    724e:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7250:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    7252:	c484           	and.l d4,d2
	and.l	d4,d6
    7254:	cc84           	and.l d4,d6
	and.l	d4,d3
    7256:	c684           	and.l d4,d3
	and.l	d4,d7
    7258:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    725a:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    725c:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    725e:	8486           	or.l d6,d2
	or.l	d7,d3
    7260:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    7262:	3c02           	move.w d2,d6
	move.w	d3,d7
    7264:	3e03           	move.w d3,d7
	move.w	d0,d2
    7266:	3400           	move.w d0,d2
	move.w	d1,d3
    7268:	3601           	move.w d1,d3
	swap	d2
    726a:	4842           	swap d2
	swap	d3
    726c:	4843           	swap d3
	move.w	d2,d0
    726e:	3002           	move.w d2,d0
	move.w	d3,d1
    7270:	3203           	move.w d3,d1
	move.w	d6,d2
    7272:	3406           	move.w d6,d2
	move.w	d7,d3
    7274:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    7276:	2c02           	move.l d2,d6
	move.l	d3,d7
    7278:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    727a:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    727c:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    727e:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7280:	b387           	eor.l d1,d7
	and.l	d5,d6
    7282:	cc85           	and.l d5,d6
	and.l	d5,d7
    7284:	ce85           	and.l d5,d7
	eor.l	d6,d0
    7286:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7288:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    728a:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    728c:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    728e:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7290:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    7292:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7298:	2c01           	move.l d1,d6
	move.l	d3,d7
    729a:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    729c:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    729e:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    72a0:	b186           	eor.l d0,d6
	eor.l	d2,d7
    72a2:	b587           	eor.l d2,d7
	bra	.start1
    72a4:	6000 0088      	bra.w 732e <.start1>

000072a8 <.x1>:
.x1:
	move.l	(a0)+,d0
    72a8:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    72aa:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    72ac:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    72ae:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    72b0:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    72b4:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    72ba:	c084           	and.l d4,d0
	and.l	d4,d1
    72bc:	c284           	and.l d4,d1
	and.l	d4,d2
    72be:	c484           	and.l d4,d2
	and.l	d4,d3
    72c0:	c684           	and.l d4,d3
	lsl.l	#4,d0
    72c2:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    72c4:	e989           	lsl.l #4,d1
	or.l	d2,d0
    72c6:	8082           	or.l d2,d0
	or.l	d3,d1
    72c8:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    72ca:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    72cc:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    72ce:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    72d0:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    72d2:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    72d6:	c484           	and.l d4,d2
	and.l	d4,d6
    72d8:	cc84           	and.l d4,d6
	and.l	d4,d3
    72da:	c684           	and.l d4,d3
	and.l	d4,d7
    72dc:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    72de:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    72e0:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    72e2:	8486           	or.l d6,d2
	or.l	d7,d3
    72e4:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    72e6:	3c02           	move.w d2,d6
	move.w	d3,d7
    72e8:	3e03           	move.w d3,d7
	move.w	d0,d2
    72ea:	3400           	move.w d0,d2
	move.w	d1,d3
    72ec:	3601           	move.w d1,d3
	swap	d2
    72ee:	4842           	swap d2
	swap	d3
    72f0:	4843           	swap d3
	move.w	d2,d0
    72f2:	3002           	move.w d2,d0
	move.w	d3,d1
    72f4:	3203           	move.w d3,d1
	move.w	d6,d2
    72f6:	3406           	move.w d6,d2
	move.w	d7,d3
    72f8:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    72fa:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    72fe:	2c02           	move.l d2,d6
	move.l	d3,d7
    7300:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    7302:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7304:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    7306:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7308:	b387           	eor.l d1,d7
	and.l	d5,d6
    730a:	cc85           	and.l d5,d6
	and.l	d5,d7
    730c:	ce85           	and.l d5,d7
	eor.l	d6,d0
    730e:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7310:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    7312:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7314:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    7316:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7318:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    731a:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7320:	2c01           	move.l d1,d6
	move.l	d3,d7
    7322:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7324:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    7326:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7328:	b186           	eor.l d0,d6
	eor.l	d2,d7
    732a:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    732c:	22cd           	move.l a5,(a1)+

0000732e <.start1>:
.start1:
	and.l	d4,d6
    732e:	cc84           	and.l d4,d6
	and.l	d4,d7
    7330:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7332:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7334:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    7336:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    7338:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    733a:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    733c:	bf83           	eor.l d7,d3

	move.l	a6,d4
    733e:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    7340:	2c01           	move.l d1,d6
	move.l	d3,d7
    7342:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    7344:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    7346:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    7348:	b186           	eor.l d0,d6
	eor.l	d2,d7
    734a:	b587           	eor.l d2,d7
	and.l	d4,d6
    734c:	cc84           	and.l d4,d6
	and.l	d4,d7
    734e:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7350:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7352:	bf82           	eor.l d7,d2
	add.l	d6,d6
    7354:	dc86           	add.l d6,d6
	add.l	d7,d7
    7356:	de87           	add.l d7,d7
	eor.l	d1,d6
    7358:	b386           	eor.l d1,d6
	eor.l	d3,d7
    735a:	b787           	eor.l d3,d7

	move.l	d0,a4
    735c:	2840           	movea.l d0,a4
	move.l	d2,a5
    735e:	2a42           	movea.l d2,a5
	move.l	d6,a3
    7360:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    7362:	b5c8           	cmpa.l a0,a2
	bne	.x1
    7364:	6600 ff42      	bne.w 72a8 <.x1>
	move.l	d7,-BPLSIZE(a1)
    7368:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    736c:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    7370:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    7374:	22cd           	move.l a5,(a1)+

	movem.l	(sp)+,a0-a1
    7376:	4cdf 0300      	movem.l (sp)+,a0-a1
	add.l	#BPLSIZE*4,a1
    737a:	d3fc 0000 afe0 	adda.l #45024,a1

	move.l	(a0)+,d0
    7380:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    7382:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7384:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    7386:	2618           	move.l (a0)+,d3

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    7388:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    738e:	c084           	and.l d4,d0
	and.l	d4,d1
    7390:	c284           	and.l d4,d1
	and.l	d4,d2
    7392:	c484           	and.l d4,d2
	and.l	d4,d3
    7394:	c684           	and.l d4,d3
	lsr.l	#4,d2
    7396:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    7398:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    739a:	8082           	or.l d2,d0
	or.l	d3,d1
    739c:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    739e:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    73a0:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    73a2:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    73a4:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    73a6:	c484           	and.l d4,d2
	and.l	d4,d6
    73a8:	cc84           	and.l d4,d6
	and.l	d4,d3
    73aa:	c684           	and.l d4,d3
	and.l	d4,d7
    73ac:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    73ae:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    73b0:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    73b2:	8486           	or.l d6,d2
	or.l	d7,d3
    73b4:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    73b6:	3c02           	move.w d2,d6
	move.w	d3,d7
    73b8:	3e03           	move.w d3,d7
	move.w	d0,d2
    73ba:	3400           	move.w d0,d2
	move.w	d1,d3
    73bc:	3601           	move.w d1,d3
	swap	d2
    73be:	4842           	swap d2
	swap	d3
    73c0:	4843           	swap d3
	move.w	d2,d0
    73c2:	3002           	move.w d2,d0
	move.w	d3,d1
    73c4:	3203           	move.w d3,d1
	move.w	d6,d2
    73c6:	3406           	move.w d6,d2
	move.w	d7,d3
    73c8:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    73ca:	2c02           	move.l d2,d6
	move.l	d3,d7
    73cc:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    73ce:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    73d0:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    73d2:	b186           	eor.l d0,d6
	eor.l	d1,d7
    73d4:	b387           	eor.l d1,d7
	and.l	d5,d6
    73d6:	cc85           	and.l d5,d6
	and.l	d5,d7
    73d8:	ce85           	and.l d5,d7
	eor.l	d6,d0
    73da:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    73dc:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    73de:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    73e0:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    73e2:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    73e4:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    73e6:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    73ec:	2c01           	move.l d1,d6
	move.l	d3,d7
    73ee:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    73f0:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    73f2:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    73f4:	b186           	eor.l d0,d6
	eor.l	d2,d7
    73f6:	b587           	eor.l d2,d7
	bra	.start2
    73f8:	6000 0088      	bra.w 7482 <.start2>

000073fc <.x2>:
.x2:
	move.l	(a0)+,d0
    73fc:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    73fe:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7400:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    7402:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    7404:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    7408:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    740e:	c084           	and.l d4,d0
	and.l	d4,d1
    7410:	c284           	and.l d4,d1
	and.l	d4,d2
    7412:	c484           	and.l d4,d2
	and.l	d4,d3
    7414:	c684           	and.l d4,d3
	lsr.l	#4,d2
    7416:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    7418:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    741a:	8082           	or.l d2,d0
	or.l	d3,d1
    741c:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    741e:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7420:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    7422:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7424:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    7426:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    742a:	c484           	and.l d4,d2
	and.l	d4,d6
    742c:	cc84           	and.l d4,d6
	and.l	d4,d3
    742e:	c684           	and.l d4,d3
	and.l	d4,d7
    7430:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    7432:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    7434:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    7436:	8486           	or.l d6,d2
	or.l	d7,d3
    7438:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    743a:	3c02           	move.w d2,d6
	move.w	d3,d7
    743c:	3e03           	move.w d3,d7
	move.w	d0,d2
    743e:	3400           	move.w d0,d2
	move.w	d1,d3
    7440:	3601           	move.w d1,d3
	swap	d2
    7442:	4842           	swap d2
	swap	d3
    7444:	4843           	swap d3
	move.w	d2,d0
    7446:	3002           	move.w d2,d0
	move.w	d3,d1
    7448:	3203           	move.w d3,d1
	move.w	d6,d2
    744a:	3406           	move.w d6,d2
	move.w	d7,d3
    744c:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    744e:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    7452:	2c02           	move.l d2,d6
	move.l	d3,d7
    7454:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    7456:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7458:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    745a:	b186           	eor.l d0,d6
	eor.l	d1,d7
    745c:	b387           	eor.l d1,d7
	and.l	d5,d6
    745e:	cc85           	and.l d5,d6
	and.l	d5,d7
    7460:	ce85           	and.l d5,d7
	eor.l	d6,d0
    7462:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7464:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    7466:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7468:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    746a:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    746c:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    746e:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7474:	2c01           	move.l d1,d6
	move.l	d3,d7
    7476:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7478:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    747a:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    747c:	b186           	eor.l d0,d6
	eor.l	d2,d7
    747e:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    7480:	22cd           	move.l a5,(a1)+

00007482 <.start2>:
.start2:
	and.l	d4,d6
    7482:	cc84           	and.l d4,d6
	and.l	d4,d7
    7484:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7486:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7488:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    748a:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    748c:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    748e:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    7490:	bf83           	eor.l d7,d3

	move.l	a6,d4
    7492:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    7494:	2c01           	move.l d1,d6
	move.l	d3,d7
    7496:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    7498:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    749a:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    749c:	b186           	eor.l d0,d6
	eor.l	d2,d7
    749e:	b587           	eor.l d2,d7
	and.l	d4,d6
    74a0:	cc84           	and.l d4,d6
	and.l	d4,d7
    74a2:	ce84           	and.l d4,d7
	eor.l	d6,d0
    74a4:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    74a6:	bf82           	eor.l d7,d2
	add.l	d6,d6
    74a8:	dc86           	add.l d6,d6
	add.l	d7,d7
    74aa:	de87           	add.l d7,d7
	eor.l	d1,d6
    74ac:	b386           	eor.l d1,d6
	eor.l	d3,d7
    74ae:	b787           	eor.l d3,d7

	move.l	d0,a4
    74b0:	2840           	movea.l d0,a4
	move.l	d2,a5
    74b2:	2a42           	movea.l d2,a5
	move.l	d6,a3
    74b4:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    74b6:	b5c8           	cmpa.l a0,a2
	bne	.x2
    74b8:	6600 ff42      	bne.w 73fc <.x2>
	move.l	d7,-BPLSIZE(a1)
    74bc:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    74c0:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    74c4:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    74c8:	22cd           	move.l a5,(a1)+

000074ca <.none>:
.none:
	movem.l .c2p_saveregs,d0-d7/a0-a6
    74ca:	4cfa 7fff 0004 	movem.l 74d2 <.c2p_saveregs>(pc),d0-a6
	rts
    74d0:	4e75           	rts

000074d2 <.c2p_saveregs>:
	...

0000750e <c2p1x1_8_c5_gen_scroffs>:
    750e:	0000 0001      	ori.b #1,d0

00007512 <c2p1x1_8_c5_gen_pixels>:

.c2p_saveregs: .dcb.b 60


c2p1x1_8_c5_gen_scroffs: dc.l	1
    7512:	0000 0001      	ori.b #1,d0
