
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
       2:	203c 0000 a65a 	move.l #42586,d0
       8:	0480 0000 a65a 	subi.l #42586,d0
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
      22:	41f9 0000 a65a 	lea a65a <__fini_array_end>,a0
      28:	2071 8800      	movea.l (0,a1,a0.l),a0
      2c:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      2e:	52af 0004      	addq.l #1,4(sp)
      32:	202f 0004      	move.l 4(sp),d0
      36:	b097           	cmp.l (sp),d0
      38:	65de           	bcs.s 18 <_start+0x18>

	count = __init_array_end - __init_array_start;
      3a:	203c 0000 a65a 	move.l #42586,d0
      40:	0480 0000 a65a 	subi.l #42586,d0
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
      5a:	41f9 0000 a65a 	lea a65a <__fini_array_end>,a0
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
      78:	203c 0000 a65a 	move.l #42586,d0
      7e:	0480 0000 a65a 	subi.l #42586,d0
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
      9a:	41f9 0000 a65a 	lea a65a <__fini_array_end>,a0
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
      b6:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
      bc:	3f68 0002 0002 	move.w 2(a0),2(sp)
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
      c2:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
      c8:	3028 0002      	move.w 2(a0),d0
      cc:	3000           	move.w d0,d0
      ce:	0280 0000 ffff 	andi.l #65535,d0
      d4:	0280 0000 4000 	andi.l #16384,d0
      da:	66e6           	bne.s c2 <WaitBlt+0xe>
}
      dc:	588f           	addq.l #4,sp
      de:	4e75           	rts

000000e0 <FreeDisplay>:
           0x01B40CC9,0x01B60DDA,0x01B80ED6,0x01BA0EEC,0x01BC0EEA, 0x01BE0FFF };*/


ULONG ClColor[] = { 0x1800ed9,0x1820db7,0x1840cdb,0x1860bb9,0x1880ab4,0x18a09a7,0x18c0875,0x18e0886,0x1900763,0x1920662,0x1940331,0x19608ad,0x1980272,0x19a0131,0x19c0463,0x19e0584,0x1a00342,
                    0x1a20121,0x1a40222,0x1a60110,0x1a80793,0x1aa0ab4,0x1ac09a7,0x1ae0cd5,0x1b00cc2,0x1b20886,0x1b40fff,0x1b60431,0x1b80db7,0x1ba0740,0x1bc0875,0x1be0000 };
void FreeDisplay( int clsize, int bplsize) {
      e0:	4fef fff0      	lea -16(sp),sp
      e4:	2f0e           	move.l a6,-(sp)
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
      e6:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
      ec:	6722           	beq.s 110 <FreeDisplay+0x30>
      ee:	2f79 004d 2c58 	move.l 4d2c58 <Copperlist1>,16(sp)
      f4:	0010 
      f6:	2f6f 0018 000c 	move.l 24(sp),12(sp)
      fc:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
     102:	2c40           	movea.l d0,a6
     104:	226f 0010      	movea.l 16(sp),a1
     108:	202f 000c      	move.l 12(sp),d0
     10c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     110:	2039 004d 2c5c 	move.l 4d2c5c <Copperlist2>,d0
     116:	6722           	beq.s 13a <FreeDisplay+0x5a>
     118:	2f79 004d 2c5c 	move.l 4d2c5c <Copperlist2>,8(sp)
     11e:	0008 
     120:	2f6f 0018 0004 	move.l 24(sp),4(sp)
     126:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
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
     146:	2039 004d 2c60 	move.l 4d2c60 <DrawBuffer>,d0
     14c:	4240           	clr.w d0
     14e:	4840           	swap d0
     150:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     154:	2039 004d 2c60 	move.l 4d2c60 <DrawBuffer>,d0
     15a:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     15e:	2f79 004d 2c68 	move.l 4d2c68 <DrawCopper>,4(sp)
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
     17e:	2039 004d 2c60 	move.l 4d2c60 <DrawBuffer>,d0
     184:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     186:	2039 004d 2c64 	move.l 4d2c64 <ViewBuffer>,d0
     18c:	23c0 004d 2c60 	move.l d0,4d2c60 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     192:	2017           	move.l (sp),d0
     194:	23c0 004d 2c64 	move.l d0,4d2c64 <ViewBuffer>
}
     19a:	4fef 000c      	lea 12(sp),sp
     19e:	4e75           	rts

000001a0 <SwapCl>:

void SwapCl() {
     1a0:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     1a2:	2039 004d 2c68 	move.l 4d2c68 <DrawCopper>,d0
     1a8:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     1aa:	2039 004d 2c6c 	move.l 4d2c6c <ViewCopper>,d0
     1b0:	23c0 004d 2c68 	move.l d0,4d2c68 <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     1b6:	2017           	move.l (sp),d0
     1b8:	23c0 004d 2c6c 	move.l d0,4d2c6c <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     1be:	2039 004d 2c6c 	move.l 4d2c6c <ViewCopper>,d0
     1c4:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
     1ca:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     1ce:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
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
     2a6:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
     2ac:	317c 0020 009c 	move.w #32,156(a0)
     2b2:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
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
     2c2:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
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
     2e2:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
     2e8:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     2ee:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
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
     42e:	0681 0000 a974 	addi.l #43380,d1
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
     4c2:	2079 004d 2c74 	movea.l 4d2c74 <SysBase>,a0
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
     4e6:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
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
     514:	2079 004d 2c8c 	movea.l 4d2c8c <VBR>,a0
     51a:	41e8 006c      	lea 108(a0),a0
     51e:	20af 0004      	move.l 4(sp),(a0)
}
     522:	4e75           	rts

00000524 <GetInterruptHandler>:

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     524:	2079 004d 2c8c 	movea.l 4d2c8c <VBR>,a0
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
     57e:	23c0 004d 2c8c 	move.l d0,4d2c8c <VBR>
	SystemIrq=GetInterruptHandler(); //store interrupt register
     584:	4eba ff9e      	jsr 524 <GetInterruptHandler>(pc)
     588:	23c0 004d 2c90 	move.l d0,4d2c90 <SystemIrq>
}
     58e:	4e75           	rts

00000590 <FreeSystem>:

	//restore interrupts
	//SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
     590:	2079 004d 2c80 	movea.l 4d2c80 <GfxBase>,a0
     596:	2028 0026      	move.l 38(a0),d0
     59a:	2079 004d 2c78 	movea.l 4d2c78 <custom>,a0
     5a0:	2140 0080      	move.l d0,128(a0)
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
     5a4:	2079 004d 2c80 	movea.l 4d2c80 <GfxBase>,a0
     5aa:	2028 0032      	move.l 50(a0),d0
     5ae:	2079 004d 2c78 	movea.l 4d2c78 <custom>,a0
     5b4:	2140 0084      	move.l d0,132(a0)
	custom->copjmp1=0x7fff; //start coppper
     5b8:	2079 004d 2c78 	movea.l 4d2c78 <custom>,a0
     5be:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
     5c4:	3039 004d 2c86 	move.w 4d2c86 <SystemInts>,d0
     5ca:	2079 004d 2c78 	movea.l 4d2c78 <custom>,a0
     5d0:	0040 8000      	ori.w #-32768,d0
     5d4:	3140 009a      	move.w d0,154(a0)
	custom->dmacon=SystemDMA|0x8000;
     5d8:	3039 004d 2c88 	move.w 4d2c88 <SystemDMA>,d0
     5de:	2079 004d 2c78 	movea.l 4d2c78 <custom>,a0
     5e4:	0040 8000      	ori.w #-32768,d0
     5e8:	3140 0096      	move.w d0,150(a0)
	custom->adkcon=SystemADKCON|0x8000;
     5ec:	3039 004d 2c8a 	move.w 4d2c8a <SystemADKCON>,d0
     5f2:	2079 004d 2c78 	movea.l 4d2c78 <custom>,a0
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
     606:	2079 004d 2c78 	movea.l 4d2c78 <custom>,a0
     60c:	317c 0020 009c 	move.w #32,156(a0)
     612:	2079 004d 2c78 	movea.l 4d2c78 <custom>,a0
     618:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	frameCounter++;
     61e:	3039 004d 2c98 	move.w 4d2c98 <frameCounter>,d0
     624:	5240           	addq.w #1,d0
     626:	33c0 004d 2c98 	move.w d0,4d2c98 <frameCounter>
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
     646:	23c0 004d 2c74 	move.l d0,4d2c74 <SysBase>
	hw = (struct Custom*)0xdff000;
     64c:	23fc 00df f000 	move.l #14675968,4d2c70 <hw>
     652:	004d 2c70 

	SysBase = *((struct ExecBase**)4UL);
     656:	307c 0004      	movea.w #4,a0
     65a:	2010           	move.l (a0),d0
     65c:	23c0 004d 2c74 	move.l d0,4d2c74 <SysBase>
	custom = (struct Custom*)0xdff000;
     662:	23fc 00df f000 	move.l #14675968,4d2c78 <custom>
     668:	004d 2c78 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
     66c:	2f7c 0000 7606 	move.l #30214,68(sp)
     672:	0044 
     674:	42af 0040      	clr.l 64(sp)
     678:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
     67e:	2c40           	movea.l d0,a6
     680:	226f 0044      	movea.l 68(sp),a1
     684:	202f 0040      	move.l 64(sp),d0
     688:	4eae fdd8      	jsr -552(a6)
     68c:	2f40 003c      	move.l d0,60(sp)
     690:	202f 003c      	move.l 60(sp),d0
     694:	23c0 004d 2c80 	move.l d0,4d2c80 <GfxBase>
	if (!GfxBase)
     69a:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
     6a0:	6614           	bne.s 6b6 <main+0x84>
		Exit(0);
     6a2:	42af 0038      	clr.l 56(sp)
     6a6:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     6ac:	2c40           	movea.l d0,a6
     6ae:	222f 0038      	move.l 56(sp),d1
     6b2:	4eae ff70      	jsr -144(a6)

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     6b6:	2f7c 0000 7617 	move.l #30231,52(sp)
     6bc:	0034 
     6be:	42af 0030      	clr.l 48(sp)
     6c2:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
     6c8:	2c40           	movea.l d0,a6
     6ca:	226f 0034      	movea.l 52(sp),a1
     6ce:	202f 0030      	move.l 48(sp),d0
     6d2:	4eae fdd8      	jsr -552(a6)
     6d6:	2f40 002c      	move.l d0,44(sp)
     6da:	202f 002c      	move.l 44(sp),d0
     6de:	23c0 004d 2c7c 	move.l d0,4d2c7c <DOSBase>
	if (!DOSBase)
     6e4:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     6ea:	6614           	bne.s 700 <main+0xce>
		Exit(0);
     6ec:	42af 0028      	clr.l 40(sp)
     6f0:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     6f6:	2c40           	movea.l d0,a6
     6f8:	222f 0028      	move.l 40(sp),d1
     6fc:	4eae ff70      	jsr -144(a6)

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
     700:	4879 0000 7623 	pea 7623 <c2p1x1_8_c5_gen_pixels+0x21>
     706:	4eba 67ee      	jsr 6ef6 <KPrintF>(pc)
     70a:	588f           	addq.l #4,sp
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
     70c:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     712:	2c40           	movea.l d0,a6
     714:	4eae ffc4      	jsr -60(a6)
     718:	2f40 0024      	move.l d0,36(sp)
     71c:	202f 0024      	move.l 36(sp),d0
     720:	2f40 0020      	move.l d0,32(sp)
     724:	2f7c 0000 763f 	move.l #30271,28(sp)
     72a:	001c 
     72c:	700f           	moveq #15,d0
     72e:	2f40 0018      	move.l d0,24(sp)
     732:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     738:	2c40           	movea.l d0,a6
     73a:	222f 0020      	move.l 32(sp),d1
     73e:	242f 001c      	move.l 28(sp),d2
     742:	262f 0018      	move.l 24(sp),d3
     746:	4eae ffd0      	jsr -48(a6)
     74a:	2f40 0014      	move.l d0,20(sp)
	Delay(50);
     74e:	7032           	moveq #50,d0
     750:	2f40 0010      	move.l d0,16(sp)
     754:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     75a:	2c40           	movea.l d0,a6
     75c:	222f 0010      	move.l 16(sp),d1
     760:	4eae ff3a      	jsr -198(a6)

	//warpmode(1);
	// TODO: precalc stuff here
	//warpmode(0);

	TakeSystem();
     764:	4eba fe14      	jsr 57a <TakeSystem>(pc)


	WaitVbl();
     768:	4eba fdc6      	jsr 530 <WaitVbl>(pc)
	
    hw->dmacon = 0b1000011111111111;
     76c:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
     772:	317c 87ff 0096 	move.w #-30721,150(a0)
	//c2p();
  	Zoom_InitRun();
     778:	4eba 0954      	jsr 10ce <Zoom_InitRun>(pc)

	for(int i=0;i<20000;i++) {
     77c:	42af 004c      	clr.l 76(sp)
     780:	600c           	bra.s 78e <main+0x15c>
		WaitVbl();
     782:	4eba fdac      	jsr 530 <WaitVbl>(pc)
		Zoom_Run();
     786:	4eba 05d8      	jsr d60 <Zoom_Run>(pc)
	for(int i=0;i<20000;i++) {
     78a:	52af 004c      	addq.l #1,76(sp)
     78e:	0caf 0000 4e1f 	cmpi.l #19999,76(sp)
     794:	004c 
     796:	6fea           	ble.s 782 <main+0x150>
	}
	ULONG *bp = 0x100;
     798:	2f7c 0000 0100 	move.l #256,12(sp)
     79e:	000c 
  	*bp = 0;
     7a0:	206f 000c      	movea.l 12(sp),a0
     7a4:	4290           	clr.l (a0)
	Zoom_Dealloc();
     7a6:	4eba 0bbe      	jsr 1366 <Zoom_Dealloc>(pc)
	*bp = 0;
     7aa:	206f 000c      	movea.l 12(sp),a0
     7ae:	4290           	clr.l (a0)
     7b0:	7000           	moveq #0,d0
	// END
	FreeSystem();

	/*CloseLibrary((struct Library*)DOSBase);
	CloseLibrary((struct Library*)GfxBase);*/
}
     7b2:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     7b6:	4fef 0044      	lea 68(sp),sp
     7ba:	4e75           	rts

000007bc <SwScrollerTest>:

char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
     7bc:	4fef ff98      	lea -104(sp),sp
     7c0:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  PrepareDisplaySW();
     7c4:	4eba 0218      	jsr 9de <PrepareDisplaySW>(pc)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     7c8:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
     7ce:	4878 0010      	pea 10 <_start+0x10>
     7d2:	4879 0000 a6dc 	pea a6dc <ClsSprites>
     7d8:	42a7           	clr.l -(sp)
     7da:	2f00           	move.l d0,-(sp)
     7dc:	4eba 203a      	jsr 2818 <TestCopperlistBatch>(pc)
     7e0:	4fef 0010      	lea 16(sp),sp
     7e4:	4a80           	tst.l d0
     7e6:	6642           	bne.s 82a <SwScrollerTest+0x6e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     7e8:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     7ee:	2c40           	movea.l d0,a6
     7f0:	4eae ffc4      	jsr -60(a6)
     7f4:	2f40 0070      	move.l d0,112(sp)
     7f8:	202f 0070      	move.l 112(sp),d0
     7fc:	2f40 006c      	move.l d0,108(sp)
     800:	2f7c 0000 7660 	move.l #30304,104(sp)
     806:	0068 
     808:	702c           	moveq #44,d0
     80a:	2f40 0064      	move.l d0,100(sp)
     80e:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     814:	2c40           	movea.l d0,a6
     816:	222f 006c      	move.l 108(sp),d1
     81a:	242f 0068      	move.l 104(sp),d2
     81e:	262f 0064      	move.l 100(sp),d3
     822:	4eae ffd0      	jsr -48(a6)
     826:	2f40 0060      	move.l d0,96(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     82a:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
     830:	4878 000c      	pea c <_start+0xc>
     834:	4879 0000 a71c 	pea a71c <ClScreen>
     83a:	4878 0010      	pea 10 <_start+0x10>
     83e:	2f00           	move.l d0,-(sp)
     840:	4eba 1fd6      	jsr 2818 <TestCopperlistBatch>(pc)
     844:	4fef 0010      	lea 16(sp),sp
     848:	4a80           	tst.l d0
     84a:	6642           	bne.s 88e <SwScrollerTest+0xd2>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     84c:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     852:	2c40           	movea.l d0,a6
     854:	4eae ffc4      	jsr -60(a6)
     858:	2f40 005c      	move.l d0,92(sp)
     85c:	202f 005c      	move.l 92(sp),d0
     860:	2f40 0058      	move.l d0,88(sp)
     864:	2f7c 0000 7696 	move.l #30358,84(sp)
     86a:	0054 
     86c:	7036           	moveq #54,d0
     86e:	2f40 0050      	move.l d0,80(sp)
     872:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     878:	2c40           	movea.l d0,a6
     87a:	222f 0058      	move.l 88(sp),d1
     87e:	242f 0054      	move.l 84(sp),d2
     882:	262f 0050      	move.l 80(sp),d3
     886:	4eae ffd0      	jsr -48(a6)
     88a:	2f40 004c      	move.l d0,76(sp)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     88e:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
     894:	4878 0002      	pea 2 <_start+0x2>
     898:	4879 0000 a65c 	pea a65c <ClColor>
     89e:	4878 001e      	pea 1e <_start+0x1e>
     8a2:	2f00           	move.l d0,-(sp)
     8a4:	4eba 1f72      	jsr 2818 <TestCopperlistBatch>(pc)
     8a8:	4fef 0010      	lea 16(sp),sp
     8ac:	4a80           	tst.l d0
     8ae:	6642           	bne.s 8f2 <SwScrollerTest+0x136>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     8b0:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     8b6:	2c40           	movea.l d0,a6
     8b8:	4eae ffc4      	jsr -60(a6)
     8bc:	2f40 0048      	move.l d0,72(sp)
     8c0:	202f 0048      	move.l 72(sp),d0
     8c4:	2f40 0044      	move.l d0,68(sp)
     8c8:	2f7c 0000 76cd 	move.l #30413,64(sp)
     8ce:	0040 
     8d0:	7021           	moveq #33,d0
     8d2:	2f40 003c      	move.l d0,60(sp)
     8d6:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     8dc:	2c40           	movea.l d0,a6
     8de:	222f 0044      	move.l 68(sp),d1
     8e2:	242f 0040      	move.l 64(sp),d2
     8e6:	262f 003c      	move.l 60(sp),d3
     8ea:	4eae ffd0      	jsr -48(a6)
     8ee:	2f40 0038      	move.l d0,56(sp)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     8f2:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
     8f8:	4878 fffe      	pea fffffffe <_end+0xffb2d336>
     8fc:	4878 0020      	pea 20 <_start+0x20>
     900:	2f00           	move.l d0,-(sp)
     902:	4eba 1f52      	jsr 2856 <TestCopperlistPos>(pc)
     906:	4fef 000c      	lea 12(sp),sp
     90a:	4a80           	tst.l d0
     90c:	6642           	bne.s 950 <SwScrollerTest+0x194>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     90e:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     914:	2c40           	movea.l d0,a6
     916:	4eae ffc4      	jsr -60(a6)
     91a:	2f40 0034      	move.l d0,52(sp)
     91e:	202f 0034      	move.l 52(sp),d0
     922:	2f40 0030      	move.l d0,48(sp)
     926:	2f7c 0000 76ef 	move.l #30447,44(sp)
     92c:	002c 
     92e:	7022           	moveq #34,d0
     930:	2f40 0028      	move.l d0,40(sp)
     934:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     93a:	2c40           	movea.l d0,a6
     93c:	222f 0030      	move.l 48(sp),d1
     940:	242f 002c      	move.l 44(sp),d2
     944:	262f 0028      	move.l 40(sp),d3
     948:	4eae ffd0      	jsr -48(a6)
     94c:	2f40 0024      	move.l d0,36(sp)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     950:	2239 0000 b898 	move.l b898 <sw_text>,d1
     956:	2039 004d 2c60 	move.l 4d2c60 <DrawBuffer>,d0
     95c:	2f01           	move.l d1,-(sp)
     95e:	2f00           	move.l d0,-(sp)
     960:	4879 0000 b89c 	pea b89c <sw_testfont>
     966:	4eba 0380      	jsr ce8 <WriteFont>(pc)
     96a:	4fef 000c      	lea 12(sp),sp

  UWORD *tstpointer = (UWORD *)DrawBuffer;
     96e:	2f79 004d 2c60 	move.l 4d2c60 <DrawBuffer>,32(sp)
     974:	0020 
  if( *tstpointer != 0xff00)
     976:	206f 0020      	movea.l 32(sp),a0
     97a:	3010           	move.w (a0),d0
     97c:	0c40 ff00      	cmpi.w #-256,d0
     980:	6742           	beq.s 9c4 <SwScrollerTest+0x208>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     982:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     988:	2c40           	movea.l d0,a6
     98a:	4eae ffc4      	jsr -60(a6)
     98e:	2f40 001c      	move.l d0,28(sp)
     992:	202f 001c      	move.l 28(sp),d0
     996:	2f40 0018      	move.l d0,24(sp)
     99a:	2f7c 0000 7712 	move.l #30482,20(sp)
     9a0:	0014 
     9a2:	7031           	moveq #49,d0
     9a4:	2f40 0010      	move.l d0,16(sp)
     9a8:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     9ae:	2c40           	movea.l d0,a6
     9b0:	222f 0018      	move.l 24(sp),d1
     9b4:	242f 0014      	move.l 20(sp),d2
     9b8:	262f 0010      	move.l 16(sp),d3
     9bc:	4eae ffd0      	jsr -48(a6)
     9c0:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
     9c4:	2f3c 0000 c800 	move.l #51200,-(sp)
     9ca:	4878 0084      	pea 84 <_start+0x84>
     9ce:	4eba f710      	jsr e0 <FreeDisplay>(pc)
     9d2:	508f           	addq.l #8,sp
     9d4:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     9d8:	4fef 0068      	lea 104(sp),sp
     9dc:	4e75           	rts

000009de <PrepareDisplaySW>:
 #include "swscroller.h"
 #include "utils.h"
 
 INCBIN(swfont, "raw/ruby16_8_1.raw");

 int PrepareDisplaySW() {
     9de:	4fef ffb8      	lea -72(sp),sp
     9e2:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildSW();
     9e6:	4eba 017e      	jsr b66 <ClbuildSW>(pc)
     9ea:	23c0 004d 2c58 	move.l d0,4d2c58 <Copperlist1>
  Copperlist2 = ClbuildSW();
     9f0:	4eba 0174      	jsr b66 <ClbuildSW>(pc)
     9f4:	23c0 004d 2c5c 	move.l d0,4d2c5c <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     9fa:	2f7c 0000 c800 	move.l #51200,80(sp)
     a00:	0050 
     a02:	7002           	moveq #2,d0
     a04:	2f40 004c      	move.l d0,76(sp)
     a08:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
     a0e:	2c40           	movea.l d0,a6
     a10:	202f 0050      	move.l 80(sp),d0
     a14:	222f 004c      	move.l 76(sp),d1
     a18:	4eae ff3a      	jsr -198(a6)
     a1c:	2f40 0048      	move.l d0,72(sp)
     a20:	202f 0048      	move.l 72(sp),d0
     a24:	23c0 004d 2c50 	move.l d0,4d2c50 <Bitplane1>
  if(Bitplane1 == 0) {
     a2a:	2039 004d 2c50 	move.l 4d2c50 <Bitplane1>,d0
     a30:	6658           	bne.s a8a <PrepareDisplaySW+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     a32:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     a38:	2c40           	movea.l d0,a6
     a3a:	4eae ffc4      	jsr -60(a6)
     a3e:	2f40 0044      	move.l d0,68(sp)
     a42:	202f 0044      	move.l 68(sp),d0
     a46:	2f40 0040      	move.l d0,64(sp)
     a4a:	2f7c 0000 7cf5 	move.l #31989,60(sp)
     a50:	003c 
     a52:	7026           	moveq #38,d0
     a54:	2f40 0038      	move.l d0,56(sp)
     a58:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     a5e:	2c40           	movea.l d0,a6
     a60:	222f 0040      	move.l 64(sp),d1
     a64:	242f 003c      	move.l 60(sp),d2
     a68:	262f 0038      	move.l 56(sp),d3
     a6c:	4eae ffd0      	jsr -48(a6)
     a70:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
     a74:	7001           	moveq #1,d0
     a76:	2f40 0030      	move.l d0,48(sp)
     a7a:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     a80:	2c40           	movea.l d0,a6
     a82:	222f 0030      	move.l 48(sp),d1
     a86:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
     a8a:	2039 004d 2c50 	move.l 4d2c50 <Bitplane1>,d0
     a90:	23c0 004d 2c60 	move.l d0,4d2c60 <DrawBuffer>
  DrawCopper = Copperlist1;
     a96:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
     a9c:	23c0 004d 2c68 	move.l d0,4d2c68 <DrawCopper>
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     aa2:	2f7c 0000 c800 	move.l #51200,44(sp)
     aa8:	002c 
     aaa:	7002           	moveq #2,d0
     aac:	2f40 0028      	move.l d0,40(sp)
     ab0:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
     ab6:	2c40           	movea.l d0,a6
     ab8:	202f 002c      	move.l 44(sp),d0
     abc:	222f 0028      	move.l 40(sp),d1
     ac0:	4eae ff3a      	jsr -198(a6)
     ac4:	2f40 0024      	move.l d0,36(sp)
     ac8:	202f 0024      	move.l 36(sp),d0
     acc:	23c0 004d 2c54 	move.l d0,4d2c54 <Bitplane2>
  if(Bitplane2 == 0) {
     ad2:	2039 004d 2c54 	move.l 4d2c54 <Bitplane2>,d0
     ad8:	6658           	bne.s b32 <PrepareDisplaySW+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     ada:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     ae0:	2c40           	movea.l d0,a6
     ae2:	4eae ffc4      	jsr -60(a6)
     ae6:	2f40 0020      	move.l d0,32(sp)
     aea:	202f 0020      	move.l 32(sp),d0
     aee:	2f40 001c      	move.l d0,28(sp)
     af2:	2f7c 0000 7d1c 	move.l #32028,24(sp)
     af8:	0018 
     afa:	7026           	moveq #38,d0
     afc:	2f40 0014      	move.l d0,20(sp)
     b00:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     b06:	2c40           	movea.l d0,a6
     b08:	222f 001c      	move.l 28(sp),d1
     b0c:	242f 0018      	move.l 24(sp),d2
     b10:	262f 0014      	move.l 20(sp),d3
     b14:	4eae ffd0      	jsr -48(a6)
     b18:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     b1c:	7001           	moveq #1,d0
     b1e:	2f40 000c      	move.l d0,12(sp)
     b22:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     b28:	2c40           	movea.l d0,a6
     b2a:	222f 000c      	move.l 12(sp),d1
     b2e:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
     b32:	2039 004d 2c54 	move.l 4d2c54 <Bitplane2>,d0
     b38:	23c0 004d 2c64 	move.l d0,4d2c64 <ViewBuffer>
  ViewCopper = Copperlist2;
     b3e:	2039 004d 2c5c 	move.l 4d2c5c <Copperlist2>,d0
     b44:	23c0 004d 2c6c 	move.l d0,4d2c6c <ViewCopper>
  SwapCl();
     b4a:	4eba f654      	jsr 1a0 <SwapCl>(pc)
  SetBplPointers();
     b4e:	4eba f5f2      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
     b52:	4eba f64c      	jsr 1a0 <SwapCl>(pc)
  SetBplPointers();
     b56:	4eba f5ea      	jsr 142 <SetBplPointers>(pc)
  return 0;
     b5a:	7000           	moveq #0,d0
}
     b5c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     b60:	4fef 0048      	lea 72(sp),sp
     b64:	4e75           	rts

00000b66 <ClbuildSW>:

ULONG * ClbuildSW() {
     b66:	4fef ffc4      	lea -60(sp),sp
     b6a:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
     b6e:	2f7c 0000 0084 	move.l #132,48(sp)
     b74:	0030 
     b76:	7002           	moveq #2,d0
     b78:	2f40 002c      	move.l d0,44(sp)
     b7c:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
     b82:	2c40           	movea.l d0,a6
     b84:	202f 0030      	move.l 48(sp),d0
     b88:	222f 002c      	move.l 44(sp),d1
     b8c:	4eae ff3a      	jsr -198(a6)
     b90:	2f40 0028      	move.l d0,40(sp)
     b94:	202f 0028      	move.l 40(sp),d0
     b98:	2f40 0024      	move.l d0,36(sp)
  
  if( retval == 0) {
     b9c:	6658           	bne.s bf6 <ClbuildSW+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     b9e:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     ba4:	2c40           	movea.l d0,a6
     ba6:	4eae ffc4      	jsr -60(a6)
     baa:	2f40 0020      	move.l d0,32(sp)
     bae:	202f 0020      	move.l 32(sp),d0
     bb2:	2f40 001c      	move.l d0,28(sp)
     bb6:	2f7c 0000 7d43 	move.l #32067,24(sp)
     bbc:	0018 
     bbe:	7228           	moveq #40,d1
     bc0:	2f41 0014      	move.l d1,20(sp)
     bc4:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     bca:	2c40           	movea.l d0,a6
     bcc:	222f 001c      	move.l 28(sp),d1
     bd0:	242f 0018      	move.l 24(sp),d2
     bd4:	262f 0014      	move.l 20(sp),d3
     bd8:	4eae ffd0      	jsr -48(a6)
     bdc:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     be0:	7401           	moveq #1,d2
     be2:	2f42 000c      	move.l d2,12(sp)
     be6:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
     bec:	2c40           	movea.l d0,a6
     bee:	222f 000c      	move.l 12(sp),d1
     bf2:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
     bf6:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
     bfc:	2f7c 0000 a6dc 	move.l #42716,64(sp)
     c02:	0040 
  for(int i=0; i<16;i++)
     c04:	42af 003c      	clr.l 60(sp)
     c08:	6024           	bra.s c2e <ClbuildSW+0xc8>
    *cl++ = *clpartinstruction++;
     c0a:	222f 0040      	move.l 64(sp),d1
     c0e:	2001           	move.l d1,d0
     c10:	5880           	addq.l #4,d0
     c12:	2f40 0040      	move.l d0,64(sp)
     c16:	202f 0044      	move.l 68(sp),d0
     c1a:	2400           	move.l d0,d2
     c1c:	5882           	addq.l #4,d2
     c1e:	2f42 0044      	move.l d2,68(sp)
     c22:	2041           	movea.l d1,a0
     c24:	2210           	move.l (a0),d1
     c26:	2040           	movea.l d0,a0
     c28:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
     c2a:	52af 003c      	addq.l #1,60(sp)
     c2e:	700f           	moveq #15,d0
     c30:	b0af 003c      	cmp.l 60(sp),d0
     c34:	6cd4           	bge.s c0a <ClbuildSW+0xa4>
  clpartinstruction = ClScreen;
     c36:	2f7c 0000 a71c 	move.l #42780,64(sp)
     c3c:	0040 
  for(int i=0; i<12;i++)
     c3e:	42af 0038      	clr.l 56(sp)
     c42:	6024           	bra.s c68 <ClbuildSW+0x102>
    *cl++ = *clpartinstruction++;
     c44:	222f 0040      	move.l 64(sp),d1
     c48:	2401           	move.l d1,d2
     c4a:	5882           	addq.l #4,d2
     c4c:	2f42 0040      	move.l d2,64(sp)
     c50:	202f 0044      	move.l 68(sp),d0
     c54:	2400           	move.l d0,d2
     c56:	5882           	addq.l #4,d2
     c58:	2f42 0044      	move.l d2,68(sp)
     c5c:	2041           	movea.l d1,a0
     c5e:	2210           	move.l (a0),d1
     c60:	2040           	movea.l d0,a0
     c62:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
     c64:	52af 0038      	addq.l #1,56(sp)
     c68:	700b           	moveq #11,d0
     c6a:	b0af 0038      	cmp.l 56(sp),d0
     c6e:	6cd4           	bge.s c44 <ClbuildSW+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
     c70:	202f 0044      	move.l 68(sp),d0
     c74:	2200           	move.l d0,d1
     c76:	5881           	addq.l #4,d1
     c78:	2f41 0044      	move.l d1,68(sp)
     c7c:	2040           	movea.l d0,a0
     c7e:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
     c84:	202f 0044      	move.l 68(sp),d0
     c88:	2200           	move.l d0,d1
     c8a:	5881           	addq.l #4,d1
     c8c:	2f41 0044      	move.l d1,68(sp)
     c90:	2040           	movea.l d0,a0
     c92:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
     c98:	2f7c 0000 a65c 	move.l #42588,64(sp)
     c9e:	0040 
  for(int i=0; i<2;i++)
     ca0:	42af 0034      	clr.l 52(sp)
     ca4:	6024           	bra.s cca <ClbuildSW+0x164>
    *cl++ = *clpartinstruction++;
     ca6:	222f 0040      	move.l 64(sp),d1
     caa:	2001           	move.l d1,d0
     cac:	5880           	addq.l #4,d0
     cae:	2f40 0040      	move.l d0,64(sp)
     cb2:	202f 0044      	move.l 68(sp),d0
     cb6:	2400           	move.l d0,d2
     cb8:	5882           	addq.l #4,d2
     cba:	2f42 0044      	move.l d2,68(sp)
     cbe:	2041           	movea.l d1,a0
     cc0:	2210           	move.l (a0),d1
     cc2:	2040           	movea.l d0,a0
     cc4:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
     cc6:	52af 0034      	addq.l #1,52(sp)
     cca:	7001           	moveq #1,d0
     ccc:	b0af 0034      	cmp.l 52(sp),d0
     cd0:	6cd4           	bge.s ca6 <ClbuildSW+0x140>

  *cl = 0xfffffffe;
     cd2:	206f 0044      	movea.l 68(sp),a0
     cd6:	72fe           	moveq #-2,d1
     cd8:	2081           	move.l d1,(a0)

  return retval;
     cda:	202f 0024      	move.l 36(sp),d0
}
     cde:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     ce2:	4fef 003c      	lea 60(sp),sp
     ce6:	4e75           	rts

00000ce8 <WriteFont>:

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
     ce8:	4fef fff0      	lea -16(sp),sp
  UWORD *bmpptr = Destination;
     cec:	2f6f 0018 000c 	move.l 24(sp),12(sp)
  UWORD *fntptr = font;
     cf2:	2f6f 0014 0008 	move.l 20(sp),8(sp)

  char charpos = *text;
     cf8:	206f 001c      	movea.l 28(sp),a0
     cfc:	1f50 0003      	move.b (a0),3(sp)
  charpos -= 0x20;
     d00:	102f 0003      	move.b 3(sp),d0
     d04:	0600 ffe0      	addi.b #-32,d0
     d08:	1f40 0003      	move.b d0,3(sp)
  charpos = charpos<<3;
     d0c:	102f 0003      	move.b 3(sp),d0
     d10:	4880           	ext.w d0
     d12:	48c0           	ext.l d0
     d14:	e788           	lsl.l #3,d0
     d16:	1f40 0003      	move.b d0,3(sp)
  fntptr += charpos;
     d1a:	102f 0003      	move.b 3(sp),d0
     d1e:	4880           	ext.w d0
     d20:	3040           	movea.w d0,a0
     d22:	2008           	move.l a0,d0
     d24:	d088           	add.l a0,d0
     d26:	d1af 0008      	add.l d0,8(sp)
  for(int i=1;i<=8;i++) {
     d2a:	7001           	moveq #1,d0
     d2c:	2f40 0004      	move.l d0,4(sp)
     d30:	6020           	bra.s d52 <WriteFont+0x6a>
    *bmpptr = *fntptr++;
     d32:	202f 0008      	move.l 8(sp),d0
     d36:	2200           	move.l d0,d1
     d38:	5481           	addq.l #2,d1
     d3a:	2f41 0008      	move.l d1,8(sp)
     d3e:	2040           	movea.l d0,a0
     d40:	3010           	move.w (a0),d0
     d42:	206f 000c      	movea.l 12(sp),a0
     d46:	3080           	move.w d0,(a0)
    bmpptr += 40;
     d48:	7050           	moveq #80,d0
     d4a:	d1af 000c      	add.l d0,12(sp)
  for(int i=1;i<=8;i++) {
     d4e:	52af 0004      	addq.l #1,4(sp)
     d52:	7208           	moveq #8,d1
     d54:	b2af 0004      	cmp.l 4(sp),d1
     d58:	6cd8           	bge.s d32 <WriteFont+0x4a>
  }

}
     d5a:	4fef 0010      	lea 16(sp),sp
     d5e:	4e75           	rts

00000d60 <Zoom_Run>:
    dst += 28140;
  }
}*/

int Zoom_Pic = 1;
void Zoom_Run() {
     d60:	2f03           	move.l d3,-(sp)
     d62:	2f02           	move.l d2,-(sp)
  Utils_CopyMem(rawzoom+56280*Zoom_Pic, DrawBuffer, 14070);
     d64:	2439 004d 2c60 	move.l 4d2c60 <DrawBuffer>,d2
     d6a:	2639 0000 b8f0 	move.l b8f0 <rawzoom>,d3
     d70:	2039 0000 b8f4 	move.l b8f4 <Zoom_Pic>,d0
     d76:	2f3c 0000 dbd8 	move.l #56280,-(sp)
     d7c:	2f00           	move.l d0,-(sp)
     d7e:	4eb9 0000 715c 	jsr 715c <__mulsi3>
     d84:	508f           	addq.l #8,sp
     d86:	d083           	add.l d3,d0
     d88:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x236>
     d8c:	2f02           	move.l d2,-(sp)
     d8e:	2f00           	move.l d0,-(sp)
     d90:	4eba f44c      	jsr 1de <Utils_CopyMem>(pc)
     d94:	4fef 000c      	lea 12(sp),sp
  Zoom_SetBplPointers(DrawBuffer, DrawCopper);
     d98:	2239 004d 2c68 	move.l 4d2c68 <DrawCopper>,d1
     d9e:	2039 004d 2c60 	move.l 4d2c60 <DrawBuffer>,d0
     da4:	2f01           	move.l d1,-(sp)
     da6:	2f00           	move.l d0,-(sp)
     da8:	4eba 10c0      	jsr 1e6a <Zoom_SetBplPointers>(pc)
     dac:	508f           	addq.l #8,sp
  Zoom_Pic++;
     dae:	2039 0000 b8f4 	move.l b8f4 <Zoom_Pic>,d0
     db4:	5280           	addq.l #1,d0
     db6:	23c0 0000 b8f4 	move.l d0,b8f4 <Zoom_Pic>
  if(Zoom_Pic == 87 ) {
     dbc:	2039 0000 b8f4 	move.l b8f4 <Zoom_Pic>,d0
     dc2:	7257           	moveq #87,d1
     dc4:	b280           	cmp.l d0,d1
     dc6:	6608           	bne.s dd0 <Zoom_Run+0x70>
    Zoom_Pic = 11;
     dc8:	700b           	moveq #11,d0
     dca:	23c0 0000 b8f4 	move.l d0,b8f4 <Zoom_Pic>
  }  
}
     dd0:	241f           	move.l (sp)+,d2
     dd2:	261f           	move.l (sp)+,d3
     dd4:	4e75           	rts

00000dd6 <Zoom_VblankHandler>:

void Zoom_VblankHandler() {

  Zoom_Counter++;
     dd6:	3039 004d 2cb0 	move.w 4d2cb0 <Zoom_Counter>,d0
     ddc:	5240           	addq.w #1,d0
     dde:	33c0 004d 2cb0 	move.w d0,4d2cb0 <Zoom_Counter>
  SwapCl();
     de4:	4eba f3ba      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     de8:	33fc 0001 004d 	move.w #1,4d2cb6 <Zoom_MouseReleased>
     dee:	2cb6 
  if( MouseLeft())
     df0:	4eba f470      	jsr 262 <MouseLeft>(pc)
     df4:	4a40           	tst.w d0
     df6:	6708           	beq.s e00 <Zoom_VblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     df8:	33fc 0001 004d 	move.w #1,4d2cb8 <Zoom_Mousepressed>
     dfe:	2cb8 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     e00:	3039 004d 2cb8 	move.w 4d2cb8 <Zoom_Mousepressed>,d0
     e06:	0c40 0001      	cmpi.w #1,d0
     e0a:	6616           	bne.s e22 <Zoom_VblankHandler+0x4c>
     e0c:	4eba f454      	jsr 262 <MouseLeft>(pc)
     e10:	4a40           	tst.w d0
     e12:	660e           	bne.s e22 <Zoom_VblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     e14:	33fc 0001 004d 	move.w #1,4d2cb6 <Zoom_MouseReleased>
     e1a:	2cb6 
    Zoom_Mousepressed = 0;
     e1c:	4279 004d 2cb8 	clr.w 4d2cb8 <Zoom_Mousepressed>
  }
      
      Zoom_MouseReleased = 0;
     e22:	4279 004d 2cb6 	clr.w 4d2cb6 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom <= 2) {
     e28:	3039 004d 2cbe 	move.w 4d2cbe <Zoom_LevelOf102Zoom>,d0
     e2e:	0c40 0002      	cmpi.w #2,d0
     e32:	622e           	bhi.s e62 <Zoom_VblankHandler+0x8c>
 
        if( Zoom_LevelOfZoom == 87)
     e34:	3039 004d 2cbc 	move.w 4d2cbc <Zoom_LevelOfZoom>,d0
     e3a:	0c40 0057      	cmpi.w #87,d0
     e3e:	660a           	bne.s e4a <Zoom_VblankHandler+0x74>
          Zoom_LevelOfZoom = 0;
     e40:	33fc 0000 004d 	move.w #0,4d2cbc <Zoom_LevelOfZoom>
     e46:	2cbc 
     e48:	600e           	bra.s e58 <Zoom_VblankHandler+0x82>
        else
          Zoom_LevelOfZoom++;
     e4a:	3039 004d 2cbc 	move.w 4d2cbc <Zoom_LevelOfZoom>,d0
     e50:	5240           	addq.w #1,d0
     e52:	33c0 004d 2cbc 	move.w d0,4d2cbc <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     e58:	33fc 000f 004d 	move.w #15,4d2cbe <Zoom_LevelOf102Zoom>
     e5e:	2cbe 
     e60:	600e           	bra.s e70 <Zoom_VblankHandler+0x9a>
        //Zoom_SwapBuffers(  Zoom_LevelOfZoom);
      } else 
        Zoom_LevelOf102Zoom-=2;
     e62:	3039 004d 2cbe 	move.w 4d2cbe <Zoom_LevelOf102Zoom>,d0
     e68:	5540           	subq.w #2,d0
     e6a:	33c0 004d 2cbe 	move.w d0,4d2cbe <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     e70:	2239 004d 2c68 	move.l 4d2c68 <DrawCopper>,d1
     e76:	3039 004d 2cbe 	move.w 4d2cbe <Zoom_LevelOf102Zoom>,d0
     e7c:	3000           	move.w d0,d0
     e7e:	0280 0000 ffff 	andi.l #65535,d0
     e84:	2f01           	move.l d1,-(sp)
     e86:	2f00           	move.l d0,-(sp)
     e88:	4eba f582      	jsr 40c <Zoom_Shrink102>(pc)
     e8c:	508f           	addq.l #8,sp
  //Zoom_SetBplPointers(ViewBuffer, DrawCopper);
 
}
     e8e:	4e75           	rts

00000e90 <Zoom_ReverseVblankHandler>:


void Zoom_ReverseVblankHandler() {
  
  Zoom_Counter++;
     e90:	3039 004d 2cb0 	move.w 4d2cb0 <Zoom_Counter>,d0
     e96:	5240           	addq.w #1,d0
     e98:	33c0 004d 2cb0 	move.w d0,4d2cb0 <Zoom_Counter>
  SwapCl();
     e9e:	4eba f300      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     ea2:	33fc 0001 004d 	move.w #1,4d2cb6 <Zoom_MouseReleased>
     ea8:	2cb6 
  if( MouseLeft())
     eaa:	4eba f3b6      	jsr 262 <MouseLeft>(pc)
     eae:	4a40           	tst.w d0
     eb0:	6708           	beq.s eba <Zoom_ReverseVblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     eb2:	33fc 0001 004d 	move.w #1,4d2cb8 <Zoom_Mousepressed>
     eb8:	2cb8 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     eba:	3039 004d 2cb8 	move.w 4d2cb8 <Zoom_Mousepressed>,d0
     ec0:	0c40 0001      	cmpi.w #1,d0
     ec4:	6616           	bne.s edc <Zoom_ReverseVblankHandler+0x4c>
     ec6:	4eba f39a      	jsr 262 <MouseLeft>(pc)
     eca:	4a40           	tst.w d0
     ecc:	660e           	bne.s edc <Zoom_ReverseVblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     ece:	33fc 0001 004d 	move.w #1,4d2cb6 <Zoom_MouseReleased>
     ed4:	2cb6 
    Zoom_Mousepressed = 0;
     ed6:	4279 004d 2cb8 	clr.w 4d2cb8 <Zoom_Mousepressed>
    /*if( MouseLeft()) {
      while (MouseLeft())
      {
      }*/
      
      Zoom_MouseReleased = 0;
     edc:	4279 004d 2cb6 	clr.w 4d2cb6 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 15) {
     ee2:	3039 004d 2cbe 	move.w 4d2cbe <Zoom_LevelOf102Zoom>,d0
     ee8:	0c40 000f      	cmpi.w #15,d0
     eec:	6640           	bne.s f2e <Zoom_ReverseVblankHandler+0x9e>
 
        if( Zoom_LevelOfZoom == 0)
     eee:	3039 004d 2cbc 	move.w 4d2cbc <Zoom_LevelOfZoom>,d0
     ef4:	660a           	bne.s f00 <Zoom_ReverseVblankHandler+0x70>
          Zoom_LevelOfZoom = 17;
     ef6:	33fc 0011 004d 	move.w #17,4d2cbc <Zoom_LevelOfZoom>
     efc:	2cbc 
     efe:	600e           	bra.s f0e <Zoom_ReverseVblankHandler+0x7e>
        else
          Zoom_LevelOfZoom--;
     f00:	3039 004d 2cbc 	move.w 4d2cbc <Zoom_LevelOfZoom>,d0
     f06:	5340           	subq.w #1,d0
     f08:	33c0 004d 2cbc 	move.w d0,4d2cbc <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 0;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     f0e:	33fc 0000 004d 	move.w #0,4d2cbe <Zoom_LevelOf102Zoom>
     f14:	2cbe 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     f16:	3039 004d 2cbc 	move.w 4d2cbc <Zoom_LevelOfZoom>,d0
     f1c:	3000           	move.w d0,d0
     f1e:	0280 0000 ffff 	andi.l #65535,d0
     f24:	2f00           	move.l d0,-(sp)
     f26:	4eba 0fda      	jsr 1f02 <Zoom_SwapBuffers>(pc)
     f2a:	588f           	addq.l #4,sp
     f2c:	600e           	bra.s f3c <Zoom_ReverseVblankHandler+0xac>
      } else 
        Zoom_LevelOf102Zoom++;
     f2e:	3039 004d 2cbe 	move.w 4d2cbe <Zoom_LevelOf102Zoom>,d0
     f34:	5240           	addq.w #1,d0
     f36:	33c0 004d 2cbe 	move.w d0,4d2cbe <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     f3c:	2239 004d 2c68 	move.l 4d2c68 <DrawCopper>,d1
     f42:	3039 004d 2cbe 	move.w 4d2cbe <Zoom_LevelOf102Zoom>,d0
     f48:	3000           	move.w d0,d0
     f4a:	0280 0000 ffff 	andi.l #65535,d0
     f50:	2f01           	move.l d1,-(sp)
     f52:	2f00           	move.l d0,-(sp)
     f54:	4eba f4b6      	jsr 40c <Zoom_Shrink102>(pc)
     f58:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     f5a:	2239 004d 2c68 	move.l 4d2c68 <DrawCopper>,d1
     f60:	2039 004d 2c64 	move.l 4d2c64 <ViewBuffer>,d0
     f66:	2f01           	move.l d1,-(sp)
     f68:	2f00           	move.l d0,-(sp)
     f6a:	4eba 0efe      	jsr 1e6a <Zoom_SetBplPointers>(pc)
     f6e:	508f           	addq.l #8,sp
 
}
     f70:	4e75           	rts

00000f72 <Zoom_LoadImage>:

void Zoom_LoadImage( ULONG *destination) {  
     f72:	4fef fff4      	lea -12(sp),sp
     f76:	2f0e           	move.l a6,-(sp)
  CopyMem( rawzoom, destination, ZMBPLSIZE);
     f78:	2f79 0000 b8f0 	move.l b8f0 <rawzoom>,12(sp)
     f7e:	000c 
     f80:	2f6f 0014 0008 	move.l 20(sp),8(sp)
     f86:	2f7c 0000 df20 	move.l #57120,4(sp)
     f8c:	0004 
     f8e:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
     f94:	2c40           	movea.l d0,a6
     f96:	206f 000c      	movea.l 12(sp),a0
     f9a:	226f 0008      	movea.l 8(sp),a1
     f9e:	202f 0004      	move.l 4(sp),d0
     fa2:	4eae fd90      	jsr -624(a6)
}
     fa6:	2c5f           	movea.l (sp)+,a6
     fa8:	4fef 000c      	lea 12(sp),sp
     fac:	4e75           	rts

00000fae <Zoom_CopyWord>:

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080008, 
                                                       0x010a0000, 0x01001200 };

void  Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height) {  
     fae:	598f           	subq.l #4,sp
     fb0:	202f 0010      	move.l 16(sp),d0
     fb4:	3000           	move.w d0,d0
     fb6:	3f40 0002      	move.w d0,2(sp)

  WaitBlt();
     fba:	4eba f0f8      	jsr b4 <WaitBlt>(pc)

  hw->bltapt = (UWORD *) source;
     fbe:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
     fc4:	216f 0008 0050 	move.l 8(sp),80(a0)
  hw->bltdpt = (UWORD *) destination;
     fca:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
     fd0:	216f 000c 0054 	move.l 12(sp),84(a0)
  hw->bltsize = (height<<6)+2;
     fd6:	302f 0002      	move.w 2(sp),d0
     fda:	ed48           	lsl.w #6,d0
     fdc:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
     fe2:	5440           	addq.w #2,d0
     fe4:	3140 0058      	move.w d0,88(a0)

}
     fe8:	588f           	addq.l #4,sp
     fea:	4e75           	rts

00000fec <Zoom_ZoomBlit>:

void Zoom_ZoomBlit( UWORD *source, UWORD *destination, UWORD height) {
     fec:	518f           	subq.l #8,sp
     fee:	202f 0014      	move.l 20(sp),d0
     ff2:	3000           	move.w d0,d0
     ff4:	3f40 0002      	move.w d0,2(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B

  UWORD *blta = source + ZoomBlit_Increment4SrcA;
     ff8:	3039 004d 2ca6 	move.w 4d2ca6 <ZoomBlit_Increment4SrcA>,d0
     ffe:	3000           	move.w d0,d0
    1000:	0280 0000 ffff 	andi.l #65535,d0
    1006:	d080           	add.l d0,d0
    1008:	222f 000c      	move.l 12(sp),d1
    100c:	d280           	add.l d0,d1
    100e:	2f41 0004      	move.l d1,4(sp)
  WaitBlt();
    1012:	4eba f0a0      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  
  hw->bltapt = blta;
    1016:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    101c:	216f 0004 0050 	move.l 4(sp),80(a0)
  hw->bltbpt = source;
    1022:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    1028:	216f 000c 004c 	move.l 12(sp),76(a0)
  hw->bltdpt = destination;
    102e:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    1034:	216f 0010 0054 	move.l 16(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    103a:	302f 0002      	move.w 2(sp),d0
    103e:	ed48           	lsl.w #6,d0
    1040:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    1046:	5440           	addq.w #2,d0
    1048:	3140 0058      	move.w d0,88(a0)

}
    104c:	508f           	addq.l #8,sp
    104e:	4e75           	rts

00001050 <Zoom_ZoomBlit2>:

void Zoom_ZoomBlit2( UWORD *src4a, UWORD *src4b, UWORD *dst, UWORD height,
                                                 UWORD bltamod, UWORD bltbmod
                                                        , UWORD numofwords) {
    1050:	518f           	subq.l #8,sp
    1052:	226f 0018      	movea.l 24(sp),a1
    1056:	206f 001c      	movea.l 28(sp),a0
    105a:	222f 0020      	move.l 32(sp),d1
    105e:	202f 0024      	move.l 36(sp),d0
    1062:	3249           	movea.w a1,a1
    1064:	3f49 0006      	move.w a1,6(sp)
    1068:	3048           	movea.w a0,a0
    106a:	3f48 0004      	move.w a0,4(sp)
    106e:	3201           	move.w d1,d1
    1070:	3f41 0002      	move.w d1,2(sp)
    1074:	3000           	move.w d0,d0
    1076:	3e80           	move.w d0,(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B
  hw->bltamod = bltamod;
    1078:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    107e:	316f 0004 0064 	move.w 4(sp),100(a0)
  hw->bltbmod = bltbmod;  
    1084:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    108a:	316f 0002 0062 	move.w 2(sp),98(a0)
  hw->bltapt = src4a;
    1090:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    1096:	216f 000c 0050 	move.l 12(sp),80(a0)
  hw->bltbpt = src4b;
    109c:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    10a2:	216f 0010 004c 	move.l 16(sp),76(a0)
  hw->bltdpt = dst;
    10a8:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    10ae:	216f 0014 0054 	move.l 20(sp),84(a0)
  hw->bltsize = (height<<6)+numofwords;
    10b4:	302f 0006      	move.w 6(sp),d0
    10b8:	ed48           	lsl.w #6,d0
    10ba:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    10c0:	d057           	add.w (sp),d0
    10c2:	3140 0058      	move.w d0,88(a0)
  
  WaitBlt();
    10c6:	4eba efec      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a  

}
    10ca:	508f           	addq.l #8,sp
    10cc:	4e75           	rts

000010ce <Zoom_InitRun>:


void Zoom_InitRun() {
    10ce:	4fef ffe0      	lea -32(sp),sp
    10d2:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    10d4:	4279 004d 2cb0 	clr.w 4d2cb0 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    10da:	7004           	moveq #4,d0
    10dc:	2f40 0020      	move.l d0,32(sp)
    10e0:	7002           	moveq #2,d0
    10e2:	2f40 001c      	move.l d0,28(sp)
    10e6:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    10ec:	2c40           	movea.l d0,a6
    10ee:	202f 0020      	move.l 32(sp),d0
    10f2:	222f 001c      	move.l 28(sp),d1
    10f6:	4eae ff3a      	jsr -198(a6)
    10fa:	2f40 0018      	move.l d0,24(sp)
    10fe:	202f 0018      	move.l 24(sp),d0
    1102:	23c0 004d 2c9e 	move.l d0,4d2c9e <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 15;
    1108:	33fc 000f 004d 	move.w #15,4d2cbe <Zoom_LevelOf102Zoom>
    110e:	2cbe 
  ZoomHorizontal = 16;
    1110:	33fc 0010 004d 	move.w #16,4d2cc2 <ZoomHorizontal>
    1116:	2cc2 
  Zoom_PrepareDisplay();
    1118:	4eba 0288      	jsr 13a2 <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 15, Copperlist1);
    111c:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    1122:	2f00           	move.l d0,-(sp)
    1124:	4878 000f      	pea f <_start+0xf>
    1128:	4eba f2e2      	jsr 40c <Zoom_Shrink102>(pc)
    112c:	508f           	addq.l #8,sp
  Zoom_Shrink102( 15, Copperlist2);
    112e:	2039 004d 2c5c 	move.l 4d2c5c <Copperlist2>,d0
    1134:	2f00           	move.l d0,-(sp)
    1136:	4878 000f      	pea f <_start+0xf>
    113a:	4eba f2d0      	jsr 40c <Zoom_Shrink102>(pc)
    113e:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 1;
    1140:	33fc 0001 004d 	move.w #1,4d2cbc <Zoom_LevelOfZoom>
    1146:	2cbc 
  Zoom_Direction = 1;                                                  
    1148:	33fc 0001 004d 	move.w #1,4d2cc0 <Zoom_Direction>
    114e:	2cc0 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    1150:	7016           	moveq #22,d0
    1152:	2f40 0014      	move.l d0,20(sp)
    1156:	2f7c 0001 0001 	move.l #65537,16(sp)
    115c:	0010 
    115e:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    1164:	2c40           	movea.l d0,a6
    1166:	202f 0014      	move.l 20(sp),d0
    116a:	222f 0010      	move.l 16(sp),d1
    116e:	4eae ff3a      	jsr -198(a6)
    1172:	2f40 000c      	move.l d0,12(sp)
    1176:	202f 000c      	move.l 12(sp),d0
    117a:	23c0 004d 2ca8 	move.l d0,4d2ca8 <Zoom_vbint>
    1180:	2039 004d 2ca8 	move.l 4d2ca8 <Zoom_vbint>,d0
    1186:	673e           	beq.s 11c6 <Zoom_InitRun+0xf8>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1188:	2079 004d 2ca8 	movea.l 4d2ca8 <Zoom_vbint>,a0
    118e:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    1194:	2079 004d 2ca8 	movea.l 4d2ca8 <Zoom_vbint>,a0
    119a:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    11a0:	2079 004d 2ca8 	movea.l 4d2ca8 <Zoom_vbint>,a0
    11a6:	217c 0000 7d69 	move.l #32105,10(a0)
    11ac:	000a 
    Zoom_vbint->is_Data = NULL;
    11ae:	2079 004d 2ca8 	movea.l 4d2ca8 <Zoom_vbint>,a0
    11b4:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    11b8:	2079 004d 2ca8 	movea.l 4d2ca8 <Zoom_vbint>,a0
    11be:	217c 0000 0dd6 	move.l #3542,18(a0)
    11c4:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    11c6:	7005           	moveq #5,d0
    11c8:	2f40 0008      	move.l d0,8(sp)
    11cc:	2f79 004d 2ca8 	move.l 4d2ca8 <Zoom_vbint>,4(sp)
    11d2:	0004 
    11d4:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    11da:	2c40           	movea.l d0,a6
    11dc:	202f 0008      	move.l 8(sp),d0
    11e0:	226f 0004      	movea.l 4(sp),a1
    11e4:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    11e8:	2239 004d 2c6c 	move.l 4d2c6c <ViewCopper>,d1
    11ee:	2039 004d 2c64 	move.l 4d2c64 <ViewBuffer>,d0
    11f4:	2f01           	move.l d1,-(sp)
    11f6:	2f00           	move.l d0,-(sp)
    11f8:	4eba 0c70      	jsr 1e6a <Zoom_SetBplPointers>(pc)
    11fc:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    11fe:	2239 004d 2c68 	move.l 4d2c68 <DrawCopper>,d1
    1204:	2039 004d 2c64 	move.l 4d2c64 <ViewBuffer>,d0
    120a:	2f01           	move.l d1,-(sp)
    120c:	2f00           	move.l d0,-(sp)
    120e:	4eba 0c5a      	jsr 1e6a <Zoom_SetBplPointers>(pc)
    1212:	508f           	addq.l #8,sp
  SwapCl();
    1214:	4eba ef8a      	jsr 1a0 <SwapCl>(pc)
  
}
    1218:	2c5f           	movea.l (sp)+,a6
    121a:	4fef 0020      	lea 32(sp),sp
    121e:	4e75           	rts

00001220 <Zoom_InitRunReverse>:

void Zoom_InitRunReverse() {
    1220:	4fef ffe0      	lea -32(sp),sp
    1224:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    1226:	4279 004d 2cb0 	clr.w 4d2cb0 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    122c:	7004           	moveq #4,d0
    122e:	2f40 0020      	move.l d0,32(sp)
    1232:	7002           	moveq #2,d0
    1234:	2f40 001c      	move.l d0,28(sp)
    1238:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    123e:	2c40           	movea.l d0,a6
    1240:	202f 0020      	move.l 32(sp),d0
    1244:	222f 001c      	move.l 28(sp),d1
    1248:	4eae ff3a      	jsr -198(a6)
    124c:	2f40 0018      	move.l d0,24(sp)
    1250:	202f 0018      	move.l 24(sp),d0
    1254:	23c0 004d 2c9e 	move.l d0,4d2c9e <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 0;
    125a:	33fc 0000 004d 	move.w #0,4d2cbe <Zoom_LevelOf102Zoom>
    1260:	2cbe 
  ZoomHorizontal = 16;
    1262:	33fc 0010 004d 	move.w #16,4d2cc2 <ZoomHorizontal>
    1268:	2cc2 
  Zoom_PrepareDisplay();
    126a:	4eba 0136      	jsr 13a2 <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 0, Copperlist1);
    126e:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    1274:	2f00           	move.l d0,-(sp)
    1276:	42a7           	clr.l -(sp)
    1278:	4eba f192      	jsr 40c <Zoom_Shrink102>(pc)
    127c:	508f           	addq.l #8,sp
  Zoom_Shrink102( 0, Copperlist2);
    127e:	2039 004d 2c5c 	move.l 4d2c5c <Copperlist2>,d0
    1284:	2f00           	move.l d0,-(sp)
    1286:	42a7           	clr.l -(sp)
    1288:	4eba f182      	jsr 40c <Zoom_Shrink102>(pc)
    128c:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 17;
    128e:	33fc 0011 004d 	move.w #17,4d2cbc <Zoom_LevelOfZoom>
    1294:	2cbc 
                                                  
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    1296:	7016           	moveq #22,d0
    1298:	2f40 0014      	move.l d0,20(sp)
    129c:	2f7c 0001 0001 	move.l #65537,16(sp)
    12a2:	0010 
    12a4:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    12aa:	2c40           	movea.l d0,a6
    12ac:	202f 0014      	move.l 20(sp),d0
    12b0:	222f 0010      	move.l 16(sp),d1
    12b4:	4eae ff3a      	jsr -198(a6)
    12b8:	2f40 000c      	move.l d0,12(sp)
    12bc:	202f 000c      	move.l 12(sp),d0
    12c0:	23c0 004d 2ca8 	move.l d0,4d2ca8 <Zoom_vbint>
    12c6:	2039 004d 2ca8 	move.l 4d2ca8 <Zoom_vbint>,d0
    12cc:	673e           	beq.s 130c <Zoom_InitRunReverse+0xec>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    12ce:	2079 004d 2ca8 	movea.l 4d2ca8 <Zoom_vbint>,a0
    12d4:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    12da:	2079 004d 2ca8 	movea.l 4d2ca8 <Zoom_vbint>,a0
    12e0:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    12e6:	2079 004d 2ca8 	movea.l 4d2ca8 <Zoom_vbint>,a0
    12ec:	217c 0000 7d69 	move.l #32105,10(a0)
    12f2:	000a 
    Zoom_vbint->is_Data = NULL;
    12f4:	2079 004d 2ca8 	movea.l 4d2ca8 <Zoom_vbint>,a0
    12fa:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_ReverseVblankHandler;
    12fe:	2079 004d 2ca8 	movea.l 4d2ca8 <Zoom_vbint>,a0
    1304:	217c 0000 0e90 	move.l #3728,18(a0)
    130a:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    130c:	7005           	moveq #5,d0
    130e:	2f40 0008      	move.l d0,8(sp)
    1312:	2f79 004d 2ca8 	move.l 4d2ca8 <Zoom_vbint>,4(sp)
    1318:	0004 
    131a:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    1320:	2c40           	movea.l d0,a6
    1322:	202f 0008      	move.l 8(sp),d0
    1326:	226f 0004      	movea.l 4(sp),a1
    132a:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    132e:	2239 004d 2c6c 	move.l 4d2c6c <ViewCopper>,d1
    1334:	2039 004d 2c64 	move.l 4d2c64 <ViewBuffer>,d0
    133a:	2f01           	move.l d1,-(sp)
    133c:	2f00           	move.l d0,-(sp)
    133e:	4eba 0b2a      	jsr 1e6a <Zoom_SetBplPointers>(pc)
    1342:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    1344:	2239 004d 2c68 	move.l 4d2c68 <DrawCopper>,d1
    134a:	2039 004d 2c64 	move.l 4d2c64 <ViewBuffer>,d0
    1350:	2f01           	move.l d1,-(sp)
    1352:	2f00           	move.l d0,-(sp)
    1354:	4eba 0b14      	jsr 1e6a <Zoom_SetBplPointers>(pc)
    1358:	508f           	addq.l #8,sp
  SwapCl();
    135a:	4eba ee44      	jsr 1a0 <SwapCl>(pc)
  
}
    135e:	2c5f           	movea.l (sp)+,a6
    1360:	4fef 0020      	lea 32(sp),sp
    1364:	4e75           	rts

00001366 <Zoom_Dealloc>:

void Zoom_Dealloc() {
    1366:	518f           	subq.l #8,sp
    1368:	2f0e           	move.l a6,-(sp)
  RemIntServer(INTB_VERTB, Zoom_vbint);
    136a:	7005           	moveq #5,d0
    136c:	2f40 0008      	move.l d0,8(sp)
    1370:	2f79 004d 2ca8 	move.l 4d2ca8 <Zoom_vbint>,4(sp)
    1376:	0004 
    1378:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    137e:	2c40           	movea.l d0,a6
    1380:	202f 0008      	move.l 8(sp),d0
    1384:	226f 0004      	movea.l 4(sp),a1
    1388:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    138c:	2f3c 0000 df20 	move.l #57120,-(sp)
    1392:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    1396:	4eba ed48      	jsr e0 <FreeDisplay>(pc)
    139a:	508f           	addq.l #8,sp
}
    139c:	2c5f           	movea.l (sp)+,a6
    139e:	508f           	addq.l #8,sp
    13a0:	4e75           	rts

000013a2 <Zoom_PrepareDisplay>:
  
int Zoom_PrepareDisplay() {
    13a2:	4fef ffe8      	lea -24(sp),sp
    13a6:	2f0e           	move.l a6,-(sp)
  ViewBuffer = AllocVec(268*42*5, MEMF_CHIP);  
    13a8:	2f7c 0000 dbd8 	move.l #56280,24(sp)
    13ae:	0018 
    13b0:	7002           	moveq #2,d0
    13b2:	2f40 0014      	move.l d0,20(sp)
    13b6:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    13bc:	2c40           	movea.l d0,a6
    13be:	202f 0018      	move.l 24(sp),d0
    13c2:	222f 0014      	move.l 20(sp),d1
    13c6:	4eae fd54      	jsr -684(a6)
    13ca:	2f40 0010      	move.l d0,16(sp)
    13ce:	202f 0010      	move.l 16(sp),d0
    13d2:	23c0 004d 2c64 	move.l d0,4d2c64 <ViewBuffer>
  DrawBuffer = AllocVec(268*42*5, MEMF_CHIP);
    13d8:	2f7c 0000 dbd8 	move.l #56280,12(sp)
    13de:	000c 
    13e0:	7002           	moveq #2,d0
    13e2:	2f40 0008      	move.l d0,8(sp)
    13e6:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    13ec:	2c40           	movea.l d0,a6
    13ee:	202f 000c      	move.l 12(sp),d0
    13f2:	222f 0008      	move.l 8(sp),d1
    13f6:	4eae fd54      	jsr -684(a6)
    13fa:	2f40 0004      	move.l d0,4(sp)
    13fe:	202f 0004      	move.l 4(sp),d0
    1402:	23c0 004d 2c60 	move.l d0,4d2c60 <DrawBuffer>
  Utils_CopyMem( rawzoom, ViewBuffer, 14070);
    1408:	2239 004d 2c64 	move.l 4d2c64 <ViewBuffer>,d1
    140e:	2039 0000 b8f0 	move.l b8f0 <rawzoom>,d0
    1414:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x236>
    1418:	2f01           	move.l d1,-(sp)
    141a:	2f00           	move.l d0,-(sp)
    141c:	4eba edc0      	jsr 1de <Utils_CopyMem>(pc)
    1420:	4fef 000c      	lea 12(sp),sp
  Utils_CopyMem( rawzoom, DrawBuffer, 14070);
    1424:	2239 004d 2c60 	move.l 4d2c60 <DrawBuffer>,d1
    142a:	2039 0000 b8f0 	move.l b8f0 <rawzoom>,d0
    1430:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x236>
    1434:	2f01           	move.l d1,-(sp)
    1436:	2f00           	move.l d0,-(sp)
    1438:	4eba eda4      	jsr 1de <Utils_CopyMem>(pc)
    143c:	4fef 000c      	lea 12(sp),sp
  //Zoom_SwapBuffers( 0);
  Copperlist1 = ClbuildZoom( );
    1440:	4eba 0080      	jsr 14c2 <ClbuildZoom>(pc)
    1444:	23c0 004d 2c58 	move.l d0,4d2c58 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    144a:	4eba 0076      	jsr 14c2 <ClbuildZoom>(pc)
    144e:	23c0 004d 2c5c 	move.l d0,4d2c5c <Copperlist2>
  if(Bitplane2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;*/
  DrawCopper = Copperlist1;
    1454:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    145a:	23c0 004d 2c68 	move.l d0,4d2c68 <DrawCopper>
  ViewCopper = Copperlist2;
    1460:	2039 004d 2c5c 	move.l 4d2c5c <Copperlist2>,d0
    1466:	23c0 004d 2c6c 	move.l d0,4d2c6c <ViewCopper>
  return 0;
    146c:	7000           	moveq #0,d0
}
    146e:	2c5f           	movea.l (sp)+,a6
    1470:	4fef 0018      	lea 24(sp),sp
    1474:	4e75           	rts

00001476 <Zoom_Init>:

void Zoom_Init() {
    1476:	4fef fff4      	lea -12(sp),sp
    147a:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    147c:	7004           	moveq #4,d0
    147e:	2f40 000c      	move.l d0,12(sp)
    1482:	7002           	moveq #2,d0
    1484:	2f40 0008      	move.l d0,8(sp)
    1488:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    148e:	2c40           	movea.l d0,a6
    1490:	202f 000c      	move.l 12(sp),d0
    1494:	222f 0008      	move.l 8(sp),d1
    1498:	4eae ff3a      	jsr -198(a6)
    149c:	2f40 0004      	move.l d0,4(sp)
    14a0:	202f 0004      	move.l 4(sp),d0
    14a4:	23c0 004d 2c9e 	move.l d0,4d2c9e <Zoom_ZoomBlitMask>
  ZoomHorizontal = 16;
    14aa:	33fc 0010 004d 	move.w #16,4d2cc2 <ZoomHorizontal>
    14b0:	2cc2 
  Zoom_LevelOf102Zoom = 15;
    14b2:	33fc 000f 004d 	move.w #15,4d2cbe <Zoom_LevelOf102Zoom>
    14b8:	2cbe 
}
    14ba:	2c5f           	movea.l (sp)+,a6
    14bc:	4fef 000c      	lea 12(sp),sp
    14c0:	4e75           	rts

000014c2 <ClbuildZoom>:


ULONG * ClbuildZoom() {
    14c2:	4fef ffac      	lea -84(sp),sp
    14c6:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    14ca:	2f7c 0000 031c 	move.l #796,68(sp)
    14d0:	0044 
    14d2:	7002           	moveq #2,d0
    14d4:	2f40 0040      	move.l d0,64(sp)
    14d8:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    14de:	2c40           	movea.l d0,a6
    14e0:	202f 0044      	move.l 68(sp),d0
    14e4:	222f 0040      	move.l 64(sp),d1
    14e8:	4eae ff3a      	jsr -198(a6)
    14ec:	2f40 003c      	move.l d0,60(sp)
    14f0:	202f 003c      	move.l 60(sp),d0
    14f4:	2f40 0038      	move.l d0,56(sp)
  
  if( retval == 0) {
    14f8:	6658           	bne.s 1552 <ClbuildZoom+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    14fa:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    1500:	2c40           	movea.l d0,a6
    1502:	4eae ffc4      	jsr -60(a6)
    1506:	2f40 0034      	move.l d0,52(sp)
    150a:	202f 0034      	move.l 52(sp),d0
    150e:	2f40 0030      	move.l d0,48(sp)
    1512:	2f7c 0000 7d43 	move.l #32067,44(sp)
    1518:	002c 
    151a:	7228           	moveq #40,d1
    151c:	2f41 0028      	move.l d1,40(sp)
    1520:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    1526:	2c40           	movea.l d0,a6
    1528:	222f 0030      	move.l 48(sp),d1
    152c:	242f 002c      	move.l 44(sp),d2
    1530:	262f 0028      	move.l 40(sp),d3
    1534:	4eae ffd0      	jsr -48(a6)
    1538:	2f40 0024      	move.l d0,36(sp)
    Exit(1);
    153c:	7401           	moveq #1,d2
    153e:	2f42 0020      	move.l d2,32(sp)
    1542:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    1548:	2c40           	movea.l d0,a6
    154a:	222f 0020      	move.l 32(sp),d1
    154e:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    1552:	2f6f 0038 005c 	move.l 56(sp),92(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    1558:	2f7c 0000 a6dc 	move.l #42716,88(sp)
    155e:	0058 
  for(int i=0; i<16;i++)
    1560:	42af 0054      	clr.l 84(sp)
    1564:	6024           	bra.s 158a <ClbuildZoom+0xc8>
    *cl++ = *clpartinstruction++;
    1566:	222f 0058      	move.l 88(sp),d1
    156a:	2001           	move.l d1,d0
    156c:	5880           	addq.l #4,d0
    156e:	2f40 0058      	move.l d0,88(sp)
    1572:	202f 005c      	move.l 92(sp),d0
    1576:	2400           	move.l d0,d2
    1578:	5882           	addq.l #4,d2
    157a:	2f42 005c      	move.l d2,92(sp)
    157e:	2041           	movea.l d1,a0
    1580:	2210           	move.l (a0),d1
    1582:	2040           	movea.l d0,a0
    1584:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    1586:	52af 0054      	addq.l #1,84(sp)
    158a:	700f           	moveq #15,d0
    158c:	b0af 0054      	cmp.l 84(sp),d0
    1590:	6cd4           	bge.s 1566 <ClbuildZoom+0xa4>
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
    1592:	2f7c 0000 a71c 	move.l #42780,88(sp)
    1598:	0058 
  for(int i=0; i<12;i++)
    159a:	42af 0050      	clr.l 80(sp)
    159e:	6024           	bra.s 15c4 <ClbuildZoom+0x102>
    *cl++ = *clpartinstruction++;
    15a0:	222f 0058      	move.l 88(sp),d1
    15a4:	2401           	move.l d1,d2
    15a6:	5882           	addq.l #4,d2
    15a8:	2f42 0058      	move.l d2,88(sp)
    15ac:	202f 005c      	move.l 92(sp),d0
    15b0:	2400           	move.l d0,d2
    15b2:	5882           	addq.l #4,d2
    15b4:	2f42 005c      	move.l d2,92(sp)
    15b8:	2041           	movea.l d1,a0
    15ba:	2210           	move.l (a0),d1
    15bc:	2040           	movea.l d0,a0
    15be:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    15c0:	52af 0050      	addq.l #1,80(sp)
    15c4:	700b           	moveq #11,d0
    15c6:	b0af 0050      	cmp.l 80(sp),d0
    15ca:	6cd4           	bge.s 15a0 <ClbuildZoom+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    15cc:	202f 005c      	move.l 92(sp),d0
    15d0:	2200           	move.l d0,d1
    15d2:	5881           	addq.l #4,d1
    15d4:	2f41 005c      	move.l d1,92(sp)
    15d8:	2040           	movea.l d0,a0
    15da:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    15e0:	202f 005c      	move.l 92(sp),d0
    15e4:	2200           	move.l d0,d1
    15e6:	5881           	addq.l #4,d1
    15e8:	2f41 005c      	move.l d1,92(sp)
    15ec:	2040           	movea.l d0,a0
    15ee:	20bc 00e2 0000 	move.l #14811136,(a0)
  *cl++ = 0x00e40000;
    15f4:	202f 005c      	move.l 92(sp),d0
    15f8:	2200           	move.l d0,d1
    15fa:	5881           	addq.l #4,d1
    15fc:	2f41 005c      	move.l d1,92(sp)
    1600:	2040           	movea.l d0,a0
    1602:	20bc 00e4 0000 	move.l #14942208,(a0)
  *cl++ = 0x00e60000;
    1608:	202f 005c      	move.l 92(sp),d0
    160c:	2200           	move.l d0,d1
    160e:	5881           	addq.l #4,d1
    1610:	2f41 005c      	move.l d1,92(sp)
    1614:	2040           	movea.l d0,a0
    1616:	20bc 00e6 0000 	move.l #15073280,(a0)
  *cl++ = 0x00e80000;
    161c:	202f 005c      	move.l 92(sp),d0
    1620:	2200           	move.l d0,d1
    1622:	5881           	addq.l #4,d1
    1624:	2f41 005c      	move.l d1,92(sp)
    1628:	2040           	movea.l d0,a0
    162a:	20bc 00e8 0000 	move.l #15204352,(a0)
  *cl++ = 0x00ea0000;
    1630:	202f 005c      	move.l 92(sp),d0
    1634:	2200           	move.l d0,d1
    1636:	5881           	addq.l #4,d1
    1638:	2f41 005c      	move.l d1,92(sp)
    163c:	2040           	movea.l d0,a0
    163e:	20bc 00ea 0000 	move.l #15335424,(a0)
  *cl++ = 0x00ec0000;
    1644:	202f 005c      	move.l 92(sp),d0
    1648:	2200           	move.l d0,d1
    164a:	5881           	addq.l #4,d1
    164c:	2f41 005c      	move.l d1,92(sp)
    1650:	2040           	movea.l d0,a0
    1652:	20bc 00ec 0000 	move.l #15466496,(a0)
  *cl++ = 0x00ee0000;
    1658:	202f 005c      	move.l 92(sp),d0
    165c:	2200           	move.l d0,d1
    165e:	5881           	addq.l #4,d1
    1660:	2f41 005c      	move.l d1,92(sp)
    1664:	2040           	movea.l d0,a0
    1666:	20bc 00ee 0000 	move.l #15597568,(a0)
  *cl++ = 0x00f00000;
    166c:	202f 005c      	move.l 92(sp),d0
    1670:	2200           	move.l d0,d1
    1672:	5881           	addq.l #4,d1
    1674:	2f41 005c      	move.l d1,92(sp)
    1678:	2040           	movea.l d0,a0
    167a:	20bc 00f0 0000 	move.l #15728640,(a0)
  *cl++ = 0x00f20000;
    1680:	202f 005c      	move.l 92(sp),d0
    1684:	2200           	move.l d0,d1
    1686:	5881           	addq.l #4,d1
    1688:	2f41 005c      	move.l d1,92(sp)
    168c:	2040           	movea.l d0,a0
    168e:	20bc 00f2 0000 	move.l #15859712,(a0)

  clpartinstruction = ClColor;
    1694:	2f7c 0000 a65c 	move.l #42588,88(sp)
    169a:	0058 
  for(int i=0; i<32;i++)
    169c:	42af 004c      	clr.l 76(sp)
    16a0:	6024           	bra.s 16c6 <ClbuildZoom+0x204>
    *cl++ = *clpartinstruction++;
    16a2:	222f 0058      	move.l 88(sp),d1
    16a6:	2001           	move.l d1,d0
    16a8:	5880           	addq.l #4,d0
    16aa:	2f40 0058      	move.l d0,88(sp)
    16ae:	202f 005c      	move.l 92(sp),d0
    16b2:	2400           	move.l d0,d2
    16b4:	5882           	addq.l #4,d2
    16b6:	2f42 005c      	move.l d2,92(sp)
    16ba:	2041           	movea.l d1,a0
    16bc:	2210           	move.l (a0),d1
    16be:	2040           	movea.l d0,a0
    16c0:	2081           	move.l d1,(a0)
  for(int i=0; i<32;i++)
    16c2:	52af 004c      	addq.l #1,76(sp)
    16c6:	701f           	moveq #31,d0
    16c8:	b0af 004c      	cmp.l 76(sp),d0
    16cc:	6cd4           	bge.s 16a2 <ClbuildZoom+0x1e0>
  
  ULONG cop2 = cl+3;
    16ce:	700c           	moveq #12,d0
    16d0:	d0af 005c      	add.l 92(sp),d0
    16d4:	2f40 001c      	move.l d0,28(sp)
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    16d8:	202f 001c      	move.l 28(sp),d0
    16dc:	4240           	clr.w d0
    16de:	4840           	swap d0
    16e0:	2200           	move.l d0,d1
    16e2:	0681 0084 0000 	addi.l #8650752,d1
    16e8:	2f41 0018      	move.l d1,24(sp)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    16ec:	202f 001c      	move.l 28(sp),d0
    16f0:	0280 0000 ffff 	andi.l #65535,d0
    16f6:	2400           	move.l d0,d2
    16f8:	0682 0086 0000 	addi.l #8781824,d2
    16fe:	2f42 0014      	move.l d2,20(sp)
  //clpartinstruction = Cl102ZoomInit;
  *cl++ = cop2lch;
    1702:	202f 005c      	move.l 92(sp),d0
    1706:	2200           	move.l d0,d1
    1708:	5881           	addq.l #4,d1
    170a:	2f41 005c      	move.l d1,92(sp)
    170e:	2040           	movea.l d0,a0
    1710:	20af 0018      	move.l 24(sp),(a0)
  *cl++ = cop2lcl;
    1714:	202f 005c      	move.l 92(sp),d0
    1718:	2200           	move.l d0,d1
    171a:	5881           	addq.l #4,d1
    171c:	2f41 005c      	move.l d1,92(sp)
    1720:	2040           	movea.l d0,a0
    1722:	20af 0014      	move.l 20(sp),(a0)
  *cl++ = 0x2c01ff00;
    1726:	202f 005c      	move.l 92(sp),d0
    172a:	2200           	move.l d0,d1
    172c:	5881           	addq.l #4,d1
    172e:	2f41 005c      	move.l d1,92(sp)
    1732:	2040           	movea.l d0,a0
    1734:	20bc 2c01 ff00 	move.l #738328320,(a0)

  ULONG cop2br1 = cop2 + ( (30)<<2);
    173a:	7078           	moveq #120,d0
    173c:	d0af 001c      	add.l 28(sp),d0
    1740:	2f40 0010      	move.l d0,16(sp)
  ULONG cop2br2 = cop2 + ( (86)<<2);
    1744:	222f 001c      	move.l 28(sp),d1
    1748:	0681 0000 0158 	addi.l #344,d1
    174e:	2f41 000c      	move.l d1,12(sp)
  clpartinstruction = Cl102ZoomRepeat;
    1752:	2f7c 0000 a758 	move.l #42840,88(sp)
    1758:	0058 
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    175a:	202f 0010      	move.l 16(sp),d0
    175e:	4240           	clr.w d0
    1760:	4840           	swap d0
    1762:	307c 0070      	movea.w #112,a0
    1766:	d1ef 0058      	adda.l 88(sp),a0
    176a:	0680 0084 0000 	addi.l #8650752,d0
    1770:	2080           	move.l d0,(a0)
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    1772:	202f 0010      	move.l 16(sp),d0
    1776:	0280 0000 ffff 	andi.l #65535,d0
    177c:	307c 0074      	movea.w #116,a0
    1780:	d1ef 0058      	adda.l 88(sp),a0
    1784:	0680 0086 0000 	addi.l #8781824,d0
    178a:	2080           	move.l d0,(a0)
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    178c:	202f 000c      	move.l 12(sp),d0
    1790:	4240           	clr.w d0
    1792:	4840           	swap d0
    1794:	206f 0058      	movea.l 88(sp),a0
    1798:	41e8 0150      	lea 336(a0),a0
    179c:	0680 0084 0000 	addi.l #8650752,d0
    17a2:	2080           	move.l d0,(a0)
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    17a4:	202f 000c      	move.l 12(sp),d0
    17a8:	0280 0000 ffff 	andi.l #65535,d0
    17ae:	206f 0058      	movea.l 88(sp),a0
    17b2:	41e8 0154      	lea 340(a0),a0
    17b6:	0680 0086 0000 	addi.l #8781824,d0
    17bc:	2080           	move.l d0,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    17be:	42af 0048      	clr.l 72(sp)
    17c2:	6024           	bra.s 17e8 <ClbuildZoom+0x326>
    *cl++ = *clpartinstruction++;
    17c4:	222f 0058      	move.l 88(sp),d1
    17c8:	2401           	move.l d1,d2
    17ca:	5882           	addq.l #4,d2
    17cc:	2f42 0058      	move.l d2,88(sp)
    17d0:	202f 005c      	move.l 92(sp),d0
    17d4:	2400           	move.l d0,d2
    17d6:	5882           	addq.l #4,d2
    17d8:	2f42 005c      	move.l d2,92(sp)
    17dc:	2041           	movea.l d1,a0
    17de:	2210           	move.l (a0),d1
    17e0:	2040           	movea.l d0,a0
    17e2:	2081           	move.l d1,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    17e4:	52af 0048      	addq.l #1,72(sp)
    17e8:	7071           	moveq #113,d0
    17ea:	b0af 0048      	cmp.l 72(sp),d0
    17ee:	6cd4           	bge.s 17c4 <ClbuildZoom+0x302>

   *cl++ = 0xfffffffe;
    17f0:	202f 005c      	move.l 92(sp),d0
    17f4:	2200           	move.l d0,d1
    17f6:	5881           	addq.l #4,d1
    17f8:	2f41 005c      	move.l d1,92(sp)
    17fc:	74fe           	moveq #-2,d2
    17fe:	2040           	movea.l d0,a0
    1800:	2082           	move.l d2,(a0)

  return retval;
    1802:	202f 0038      	move.l 56(sp),d0
}
    1806:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    180a:	4fef 0054      	lea 84(sp),sp
    180e:	4e75           	rts

00001810 <PrepareDisplayZoom>:

 int PrepareDisplayZoom() {
    1810:	4fef ffb8      	lea -72(sp),sp
    1814:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildZoom();
    1818:	4eba fca8      	jsr 14c2 <ClbuildZoom>(pc)
    181c:	23c0 004d 2c58 	move.l d0,4d2c58 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1822:	4eba fc9e      	jsr 14c2 <ClbuildZoom>(pc)
    1826:	23c0 004d 2c5c 	move.l d0,4d2c5c <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    182c:	2f7c 0000 df20 	move.l #57120,80(sp)
    1832:	0050 
    1834:	7002           	moveq #2,d0
    1836:	2f40 004c      	move.l d0,76(sp)
    183a:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    1840:	2c40           	movea.l d0,a6
    1842:	202f 0050      	move.l 80(sp),d0
    1846:	222f 004c      	move.l 76(sp),d1
    184a:	4eae ff3a      	jsr -198(a6)
    184e:	2f40 0048      	move.l d0,72(sp)
    1852:	202f 0048      	move.l 72(sp),d0
    1856:	23c0 004d 2c50 	move.l d0,4d2c50 <Bitplane1>
  if(Bitplane1 == 0) {
    185c:	2039 004d 2c50 	move.l 4d2c50 <Bitplane1>,d0
    1862:	6658           	bne.s 18bc <PrepareDisplayZoom+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1864:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    186a:	2c40           	movea.l d0,a6
    186c:	4eae ffc4      	jsr -60(a6)
    1870:	2f40 0044      	move.l d0,68(sp)
    1874:	202f 0044      	move.l 68(sp),d0
    1878:	2f40 0040      	move.l d0,64(sp)
    187c:	2f7c 0000 7cf5 	move.l #31989,60(sp)
    1882:	003c 
    1884:	7026           	moveq #38,d0
    1886:	2f40 0038      	move.l d0,56(sp)
    188a:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    1890:	2c40           	movea.l d0,a6
    1892:	222f 0040      	move.l 64(sp),d1
    1896:	242f 003c      	move.l 60(sp),d2
    189a:	262f 0038      	move.l 56(sp),d3
    189e:	4eae ffd0      	jsr -48(a6)
    18a2:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    18a6:	7001           	moveq #1,d0
    18a8:	2f40 0030      	move.l d0,48(sp)
    18ac:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    18b2:	2c40           	movea.l d0,a6
    18b4:	222f 0030      	move.l 48(sp),d1
    18b8:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    18bc:	2039 004d 2c50 	move.l 4d2c50 <Bitplane1>,d0
    18c2:	23c0 004d 2c60 	move.l d0,4d2c60 <DrawBuffer>
  DrawCopper = Copperlist1;
    18c8:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    18ce:	23c0 004d 2c68 	move.l d0,4d2c68 <DrawCopper>
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    18d4:	2f7c 0000 df20 	move.l #57120,44(sp)
    18da:	002c 
    18dc:	7002           	moveq #2,d0
    18de:	2f40 0028      	move.l d0,40(sp)
    18e2:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    18e8:	2c40           	movea.l d0,a6
    18ea:	202f 002c      	move.l 44(sp),d0
    18ee:	222f 0028      	move.l 40(sp),d1
    18f2:	4eae ff3a      	jsr -198(a6)
    18f6:	2f40 0024      	move.l d0,36(sp)
    18fa:	202f 0024      	move.l 36(sp),d0
    18fe:	23c0 004d 2c54 	move.l d0,4d2c54 <Bitplane2>
  if(Bitplane2 == 0) {
    1904:	2039 004d 2c54 	move.l 4d2c54 <Bitplane2>,d0
    190a:	6658           	bne.s 1964 <PrepareDisplayZoom+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    190c:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    1912:	2c40           	movea.l d0,a6
    1914:	4eae ffc4      	jsr -60(a6)
    1918:	2f40 0020      	move.l d0,32(sp)
    191c:	202f 0020      	move.l 32(sp),d0
    1920:	2f40 001c      	move.l d0,28(sp)
    1924:	2f7c 0000 7d1c 	move.l #32028,24(sp)
    192a:	0018 
    192c:	7026           	moveq #38,d0
    192e:	2f40 0014      	move.l d0,20(sp)
    1932:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    1938:	2c40           	movea.l d0,a6
    193a:	222f 001c      	move.l 28(sp),d1
    193e:	242f 0018      	move.l 24(sp),d2
    1942:	262f 0014      	move.l 20(sp),d3
    1946:	4eae ffd0      	jsr -48(a6)
    194a:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    194e:	7001           	moveq #1,d0
    1950:	2f40 000c      	move.l d0,12(sp)
    1954:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    195a:	2c40           	movea.l d0,a6
    195c:	222f 000c      	move.l 12(sp),d1
    1960:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    1964:	2039 004d 2c54 	move.l 4d2c54 <Bitplane2>,d0
    196a:	23c0 004d 2c64 	move.l d0,4d2c64 <ViewBuffer>
  ViewCopper = Copperlist2; 
    1970:	2039 004d 2c5c 	move.l 4d2c5c <Copperlist2>,d0
    1976:	23c0 004d 2c6c 	move.l d0,4d2c6c <ViewCopper>
  return 0;
    197c:	7000           	moveq #0,d0
}
    197e:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1982:	4fef 0048      	lea 72(sp),sp
    1986:	4e75           	rts

00001988 <Init_Blit>:

void Init_Blit() {
  hw->bltafwm = 0xffff;
    1988:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    198e:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1994:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    199a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    19a0:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    19a6:	317c 0026 0064 	move.w #38,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    19ac:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    19b2:	317c 0026 0062 	move.w #38,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    19b8:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    19be:	317c 0026 0066 	move.w #38,102(a0)
}
    19c4:	4e75           	rts

000019c6 <Init_Blit2>:


void Init_Blit2() {
  hw->bltafwm = 0xffff;
    19c6:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    19cc:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    19d2:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    19d8:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = 36;
    19de:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    19e4:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = 76;
    19ea:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    19f0:	317c 004c 0062 	move.w #76,98(a0)
  hw->bltdmod = ZMLINESIZE2 - 4;
    19f6:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    19fc:	317c 0028 0066 	move.w #40,102(a0)
}
    1a02:	4e75           	rts

00001a04 <Init_ZoomBlit>:

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
    1a04:	4fef fff4      	lea -12(sp),sp
    1a08:	206f 0010      	movea.l 16(sp),a0
    1a0c:	222f 0014      	move.l 20(sp),d1
    1a10:	202f 0018      	move.l 24(sp),d0
    1a14:	3048           	movea.w a0,a0
    1a16:	3f48 0004      	move.w a0,4(sp)
    1a1a:	3201           	move.w d1,d1
    1a1c:	3f41 0002      	move.w d1,2(sp)
    1a20:	3000           	move.w d0,d0
    1a22:	3e80           	move.w d0,(sp)
  ZoomBlit_Increment4SrcA = 0;
    1a24:	4279 004d 2ca6 	clr.w 4d2ca6 <ZoomBlit_Increment4SrcA>

  UWORD colnr = nextzoom - startofword - 1;                                                                          
    1a2a:	302f 0002      	move.w 2(sp),d0
    1a2e:	906f 0004      	sub.w 4(sp),d0
    1a32:	3200           	move.w d0,d1
    1a34:	5341           	subq.w #1,d1
    1a36:	3f41 0008      	move.w d1,8(sp)
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
    1a3a:	3017           	move.w (sp),d0
    1a3c:	720c           	moveq #12,d1
    1a3e:	e368           	lsl.w d1,d0
    1a40:	3f40 0006      	move.w d0,6(sp)
  UWORD shifta;
  if( shiftright == 0) {
    1a44:	4a57           	tst.w (sp)
    1a46:	6610           	bne.s 1a58 <Init_ZoomBlit+0x54>
    ZoomBlit_Increment4SrcA = 1;
    1a48:	33fc 0001 004d 	move.w #1,4d2ca6 <ZoomBlit_Increment4SrcA>
    1a4e:	2ca6 
    shifta = 15 << 12;
    1a50:	3f7c f000 000a 	move.w #-4096,10(sp)
    1a56:	600c           	bra.s 1a64 <Init_ZoomBlit+0x60>
  } else {
    shifta = (shiftright - 1) << 12;
    1a58:	3017           	move.w (sp),d0
    1a5a:	5340           	subq.w #1,d0
    1a5c:	720c           	moveq #12,d1
    1a5e:	e368           	lsl.w d1,d0
    1a60:	3f40 000a      	move.w d0,10(sp)
  }
  WaitBlt(); 
    1a64:	4eba e64e      	jsr b4 <WaitBlt>(pc)
  hw->bltcon1 = shiftb; 
    1a68:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    1a6e:	316f 0006 0042 	move.w 6(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1a74:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    1a7a:	302f 000a      	move.w 10(sp),d0
    1a7e:	0640 0de4      	addi.w #3556,d0
    1a82:	3140 0040      	move.w d0,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1a86:	7000           	moveq #0,d0
    1a88:	302f 0008      	move.w 8(sp),d0
    1a8c:	7210           	moveq #16,d1
    1a8e:	9280           	sub.l d0,d1
    1a90:	7000           	moveq #0,d0
    1a92:	4640           	not.w d0
    1a94:	e3a8           	lsl.l d1,d0
    1a96:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    1a9c:	2000           	move.l d0,d0
    1a9e:	3140 0070      	move.w d0,112(a0)
}
    1aa2:	4fef 000c      	lea 12(sp),sp
    1aa6:	4e75           	rts

00001aa8 <Init_Copy>:

void Init_Copy( WORD shift) {
    1aa8:	598f           	subq.l #4,sp
    1aaa:	202f 0008      	move.l 8(sp),d0
    1aae:	3000           	move.w d0,d0
    1ab0:	3e80           	move.w d0,(sp)
  UWORD shiftright = shift << 12;
    1ab2:	3017           	move.w (sp),d0
    1ab4:	720c           	moveq #12,d1
    1ab6:	e368           	lsl.w d1,d0
    1ab8:	3f40 0002      	move.w d0,2(sp)
  WaitBlt();
    1abc:	4eba e5f6      	jsr b4 <WaitBlt>(pc)
  hw->bltcon0 = 0x9f0 + shiftright;
    1ac0:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    1ac6:	302f 0002      	move.w 2(sp),d0
    1aca:	0640 09f0      	addi.w #2544,d0
    1ace:	3140 0040      	move.w d0,64(a0)
  hw->bltcon1 = 0;
    1ad2:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    1ad8:	317c 0000 0042 	move.w #0,66(a0)
}
    1ade:	588f           	addq.l #4,sp
    1ae0:	4e75           	rts

00001ae2 <Zoom_ZoomIntoPicture>:

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    1ae2:	4fef ffcc      	lea -52(sp),sp
    1ae6:	222f 0040      	move.l 64(sp),d1
    1aea:	202f 0044      	move.l 68(sp),d0
    1aee:	3201           	move.w d1,d1
    1af0:	3f41 0002      	move.w d1,2(sp)
    1af4:	3000           	move.w d0,d0
    1af6:	3e80           	move.w d0,(sp)
  
  WaitBlt();  
    1af8:	4eba e5ba      	jsr b4 <WaitBlt>(pc)
  Init_Blit();
    1afc:	4eba fe8a      	jsr 1988 <Init_Blit>(pc)
  WORD shiftright = 9;
    1b00:	3f7c 0009 0032 	move.w #9,50(sp)
  UWORD shifthoriz = 7;
    1b06:	3f7c 0007 0030 	move.w #7,48(sp)
  UWORD startofword = 21*16;
    1b0c:	3f7c 0150 002e 	move.w #336,46(sp)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1b12:	322f 0002      	move.w 2(sp),d1
    1b16:	3001           	move.w d1,d0
    1b18:	d040           	add.w d0,d0
    1b1a:	d040           	add.w d0,d0
    1b1c:	d041           	add.w d1,d0
    1b1e:	d040           	add.w d0,d0
    1b20:	0640 014c      	addi.w #332,d0
    1b24:	3f40 002c      	move.w d0,44(sp)
    1b28:	601a           	bra.s 1b44 <Zoom_ZoomIntoPicture+0x62>
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    1b2a:	302f 002c      	move.w 44(sp),d0
    1b2e:	906f 0002      	sub.w 2(sp),d0
    1b32:	0640 ffed      	addi.w #-19,d0
    1b36:	3f40 002c      	move.w d0,44(sp)
    shiftright--;
    1b3a:	302f 0032      	move.w 50(sp),d0
    1b3e:	5340           	subq.w #1,d0
    1b40:	3f40 0032      	move.w d0,50(sp)
  while( nextzoom > 22 * 16) {
    1b44:	0c6f 0160 002c 	cmpi.w #352,44(sp)
    1b4a:	6ede           	bgt.s 1b2a <Zoom_ZoomIntoPicture+0x48>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
    1b4c:	426f 002a      	clr.w 42(sp)
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    1b50:	322f 0002      	move.w 2(sp),d1
    1b54:	3001           	move.w d1,d0
    1b56:	d040           	add.w d0,d0
    1b58:	d040           	add.w d0,d0
    1b5a:	d041           	add.w d1,d0
    1b5c:	4440           	neg.w d0
    1b5e:	0640 0012      	addi.w #18,d0
    1b62:	3f40 0028      	move.w d0,40(sp)
    1b66:	601c           	bra.s 1b84 <Zoom_ZoomIntoPicture+0xa2>
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    1b68:	302f 0028      	move.w 40(sp),d0
    1b6c:	d06f 0002      	add.w 2(sp),d0
    1b70:	0640 0013      	addi.w #19,d0
    1b74:	3f40 0028      	move.w d0,40(sp)
      shifthoriz--;
    1b78:	302f 0030      	move.w 48(sp),d0
    1b7c:	3200           	move.w d0,d1
    1b7e:	5341           	subq.w #1,d1
    1b80:	3f41 0030      	move.w d1,48(sp)
  while( ZoomHorizontalStart < 0) {
    1b84:	4a6f 0028      	tst.w 40(sp)
    1b88:	6dde           	blt.s 1b68 <Zoom_ZoomIntoPicture+0x86>
  } 

  for(int i=0;i<22;i++) {
    1b8a:	42af 0024      	clr.l 36(sp)
    1b8e:	6000 02ca      	bra.w 1e5a <Zoom_ZoomIntoPicture+0x378>

    ZoomHorizontal = ZoomHorizontalStart;
    1b92:	33ef 0028 004d 	move.w 40(sp),4d2cc2 <ZoomHorizontal>
    1b98:	2cc2 

    WORD linesleft = 272;
    1b9a:	3f7c 0110 0022 	move.w #272,34(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1ba0:	7000           	moveq #0,d0
    1ba2:	302f 0030      	move.w 48(sp),d0
    1ba6:	7200           	moveq #0,d1
    1ba8:	3217           	move.w (sp),d1
    1baa:	2f01           	move.l d1,-(sp)
    1bac:	2f00           	move.l d0,-(sp)
    1bae:	4eb9 0000 715c 	jsr 715c <__mulsi3>
    1bb4:	508f           	addq.l #8,sp
    1bb6:	2200           	move.l d0,d1
    1bb8:	2001           	move.l d1,d0
    1bba:	d080           	add.l d0,d0
    1bbc:	d081           	add.l d1,d0
    1bbe:	2200           	move.l d0,d1
    1bc0:	e789           	lsl.l #3,d1
    1bc2:	9280           	sub.l d0,d1
    1bc4:	202f 0024      	move.l 36(sp),d0
    1bc8:	9280           	sub.l d0,d1
    1bca:	2001           	move.l d1,d0
    1bcc:	0680 8000 0013 	addi.l #-2147483629,d0
    1bd2:	d080           	add.l d0,d0
    1bd4:	222f 0038      	move.l 56(sp),d1
    1bd8:	d280           	add.l d0,d1
    1bda:	2f41 001e      	move.l d1,30(sp)
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1bde:	202f 0024      	move.l 36(sp),d0
    1be2:	7213           	moveq #19,d1
    1be4:	9280           	sub.l d0,d1
    1be6:	2001           	move.l d1,d0
    1be8:	d081           	add.l d1,d0
    1bea:	222f 003c      	move.l 60(sp),d1
    1bee:	d280           	add.l d0,d1
    1bf0:	2f41 001a      	move.l d1,26(sp)
    
    UWORD onestep = ZMLINESIZE/2*planes;
    1bf4:	3017           	move.w (sp),d0
    1bf6:	c1fc 0015      	muls.w #21,d0
    1bfa:	3f40 0018      	move.w d0,24(sp)
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1bfe:	7000           	moveq #0,d0
    1c00:	302f 002e      	move.w 46(sp),d0
    1c04:	306f 002c      	movea.w 44(sp),a0
    1c08:	b1c0           	cmpa.l d0,a0
    1c0a:	6e00 0106      	bgt.w 1d12 <Zoom_ZoomIntoPicture+0x230>
      Init_Copy( shiftright);
    1c0e:	306f 0032      	movea.w 50(sp),a0
    1c12:	2f08           	move.l a0,-(sp)
    1c14:	4eba fe92      	jsr 1aa8 <Init_Copy>(pc)
    1c18:	588f           	addq.l #4,sp
    1c1a:	6000 00ea      	bra.w 1d06 <Zoom_ZoomIntoPicture+0x224>
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1c1e:	3039 004d 2cc2 	move.w 4d2cc2 <ZoomHorizontal>,d0
    1c24:	b06f 0022      	cmp.w 34(sp),d0
    1c28:	6c12           	bge.s 1c3c <Zoom_ZoomIntoPicture+0x15a>
          linesleft -= ZoomHorizontal;
    1c2a:	322f 0022      	move.w 34(sp),d1
    1c2e:	3039 004d 2cc2 	move.w 4d2cc2 <ZoomHorizontal>,d0
    1c34:	9240           	sub.w d0,d1
    1c36:	3f41 0022      	move.w d1,34(sp)
    1c3a:	600c           	bra.s 1c48 <Zoom_ZoomIntoPicture+0x166>
        } else {
          ZoomHorizontal = linesleft;
    1c3c:	33ef 0022 004d 	move.w 34(sp),4d2cc2 <ZoomHorizontal>
    1c42:	2cc2 
          linesleft = 0;
    1c44:	426f 0022      	clr.w 34(sp)
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
    1c48:	3039 004d 2cc2 	move.w 4d2cc2 <ZoomHorizontal>,d0
    1c4e:	322f 0018      	move.w 24(sp),d1
    1c52:	c3c0           	muls.w d0,d1
    1c54:	3f41 000c      	move.w d1,12(sp)
        //Add aditional line
        if( linesleft>0) {
    1c58:	4a6f 0022      	tst.w 34(sp)
    1c5c:	6f4c           	ble.s 1caa <Zoom_ZoomIntoPicture+0x1c8>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1c5e:	7200           	moveq #0,d1
    1c60:	322f 000c      	move.w 12(sp),d1
    1c64:	7000           	moveq #0,d0
    1c66:	302f 002a      	move.w 42(sp),d0
    1c6a:	d081           	add.l d1,d0
    1c6c:	d080           	add.l d0,d0
    1c6e:	222f 001e      	move.l 30(sp),d1
    1c72:	d280           	add.l d0,d1
    1c74:	2f41 0008      	move.l d1,8(sp)
          UWORD *tmpdest = pos4dest +  size4blit;
    1c78:	7000           	moveq #0,d0
    1c7a:	302f 000c      	move.w 12(sp),d0
    1c7e:	d080           	add.l d0,d0
    1c80:	222f 001a      	move.l 26(sp),d1
    1c84:	d280           	add.l d0,d1
    1c86:	2f41 0004      	move.l d1,4(sp)
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
    1c8a:	7000           	moveq #0,d0
    1c8c:	3017           	move.w (sp),d0
    1c8e:	2f00           	move.l d0,-(sp)
    1c90:	2f2f 0008      	move.l 8(sp),-(sp)
    1c94:	2f2f 0010      	move.l 16(sp),-(sp)
    1c98:	4eba f314      	jsr fae <Zoom_CopyWord>(pc)
    1c9c:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1ca0:	302f 0022      	move.w 34(sp),d0
    1ca4:	5340           	subq.w #1,d0
    1ca6:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1caa:	3039 004d 2cc2 	move.w 4d2cc2 <ZoomHorizontal>,d0
    1cb0:	c1d7           	muls.w (sp),d0
    1cb2:	7200           	moveq #0,d1
    1cb4:	3200           	move.w d0,d1
    1cb6:	7000           	moveq #0,d0
    1cb8:	302f 002a      	move.w 42(sp),d0
    1cbc:	d080           	add.l d0,d0
    1cbe:	d0af 001e      	add.l 30(sp),d0
    1cc2:	2f01           	move.l d1,-(sp)
    1cc4:	2f2f 001e      	move.l 30(sp),-(sp)
    1cc8:	2f00           	move.l d0,-(sp)
    1cca:	4eba f2e2      	jsr fae <Zoom_CopyWord>(pc)
    1cce:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1cd2:	7000           	moveq #0,d0
    1cd4:	302f 000c      	move.w 12(sp),d0
    1cd8:	d080           	add.l d0,d0
    1cda:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep; 
    1cde:	7200           	moveq #0,d1
    1ce0:	322f 000c      	move.w 12(sp),d1
    1ce4:	7000           	moveq #0,d0
    1ce6:	302f 0018      	move.w 24(sp),d0
    1cea:	d081           	add.l d1,d0
    1cec:	d080           	add.l d0,d0
    1cee:	d1af 001a      	add.l d0,26(sp)
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1cf2:	302f 0002      	move.w 2(sp),d0
    1cf6:	d040           	add.w d0,d0
    1cf8:	906f 0002      	sub.w 2(sp),d0
    1cfc:	0640 0012      	addi.w #18,d0
    1d00:	33c0 004d 2cc2 	move.w d0,4d2cc2 <ZoomHorizontal>
      while(linesleft > 0) {
    1d06:	4a6f 0022      	tst.w 34(sp)
    1d0a:	6e00 ff12      	bgt.w 1c1e <Zoom_ZoomIntoPicture+0x13c>
    1d0e:	6000 0140      	bra.w 1e50 <Zoom_ZoomIntoPicture+0x36e>
      }
    } else {  
      Init_ZoomBlit( startofword, nextzoom, shiftright);   
    1d12:	326f 0032      	movea.w 50(sp),a1
    1d16:	306f 002c      	movea.w 44(sp),a0
    1d1a:	7000           	moveq #0,d0
    1d1c:	302f 002e      	move.w 46(sp),d0
    1d20:	2f09           	move.l a1,-(sp)
    1d22:	2f08           	move.l a0,-(sp)
    1d24:	2f00           	move.l d0,-(sp)
    1d26:	4eba fcdc      	jsr 1a04 <Init_ZoomBlit>(pc)
    1d2a:	4fef 000c      	lea 12(sp),sp
      nextzoom -= (19 + zoomnr);
    1d2e:	302f 002c      	move.w 44(sp),d0
    1d32:	906f 0002      	sub.w 2(sp),d0
    1d36:	0640 ffed      	addi.w #-19,d0
    1d3a:	3f40 002c      	move.w d0,44(sp)
    1d3e:	6000 00ea      	bra.w 1e2a <Zoom_ZoomIntoPicture+0x348>
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1d42:	3039 004d 2cc2 	move.w 4d2cc2 <ZoomHorizontal>,d0
    1d48:	b06f 0022      	cmp.w 34(sp),d0
    1d4c:	6c12           	bge.s 1d60 <Zoom_ZoomIntoPicture+0x27e>
          linesleft -= ZoomHorizontal;
    1d4e:	322f 0022      	move.w 34(sp),d1
    1d52:	3039 004d 2cc2 	move.w 4d2cc2 <ZoomHorizontal>,d0
    1d58:	9240           	sub.w d0,d1
    1d5a:	3f41 0022      	move.w d1,34(sp)
    1d5e:	600c           	bra.s 1d6c <Zoom_ZoomIntoPicture+0x28a>
        } else {
          ZoomHorizontal = linesleft;
    1d60:	33ef 0022 004d 	move.w 34(sp),4d2cc2 <ZoomHorizontal>
    1d66:	2cc2 
          linesleft = 0;
    1d68:	426f 0022      	clr.w 34(sp)
        }
        UWORD size4blit = ZoomHorizontal*onestep;
    1d6c:	3039 004d 2cc2 	move.w 4d2cc2 <ZoomHorizontal>,d0
    1d72:	322f 0018      	move.w 24(sp),d1
    1d76:	c3c0           	muls.w d0,d1
    1d78:	3f41 0016      	move.w d1,22(sp)
        //Add aditional line
        if( linesleft>0) {
    1d7c:	4a6f 0022      	tst.w 34(sp)
    1d80:	6f4c           	ble.s 1dce <Zoom_ZoomIntoPicture+0x2ec>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1d82:	7200           	moveq #0,d1
    1d84:	322f 0016      	move.w 22(sp),d1
    1d88:	7000           	moveq #0,d0
    1d8a:	302f 002a      	move.w 42(sp),d0
    1d8e:	d081           	add.l d1,d0
    1d90:	d080           	add.l d0,d0
    1d92:	222f 001e      	move.l 30(sp),d1
    1d96:	d280           	add.l d0,d1
    1d98:	2f41 0012      	move.l d1,18(sp)
          UWORD *tmpdest = pos4dest + size4blit;
    1d9c:	7000           	moveq #0,d0
    1d9e:	302f 0016      	move.w 22(sp),d0
    1da2:	d080           	add.l d0,d0
    1da4:	222f 001a      	move.l 26(sp),d1
    1da8:	d280           	add.l d0,d1
    1daa:	2f41 000e      	move.l d1,14(sp)
          
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
    1dae:	7000           	moveq #0,d0
    1db0:	3017           	move.w (sp),d0
    1db2:	2f00           	move.l d0,-(sp)
    1db4:	2f2f 0012      	move.l 18(sp),-(sp)
    1db8:	2f2f 001a      	move.l 26(sp),-(sp)
    1dbc:	4eba f22e      	jsr fec <Zoom_ZoomBlit>(pc)
    1dc0:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1dc4:	302f 0022      	move.w 34(sp),d0
    1dc8:	5340           	subq.w #1,d0
    1dca:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1dce:	3039 004d 2cc2 	move.w 4d2cc2 <ZoomHorizontal>,d0
    1dd4:	c1d7           	muls.w (sp),d0
    1dd6:	7200           	moveq #0,d1
    1dd8:	3200           	move.w d0,d1
    1dda:	7000           	moveq #0,d0
    1ddc:	302f 002a      	move.w 42(sp),d0
    1de0:	d080           	add.l d0,d0
    1de2:	d0af 001e      	add.l 30(sp),d0
    1de6:	2f01           	move.l d1,-(sp)
    1de8:	2f2f 001e      	move.l 30(sp),-(sp)
    1dec:	2f00           	move.l d0,-(sp)
    1dee:	4eba f1fc      	jsr fec <Zoom_ZoomBlit>(pc)
    1df2:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1df6:	7000           	moveq #0,d0
    1df8:	302f 0016      	move.w 22(sp),d0
    1dfc:	d080           	add.l d0,d0
    1dfe:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep;   
    1e02:	7200           	moveq #0,d1
    1e04:	322f 0016      	move.w 22(sp),d1
    1e08:	7000           	moveq #0,d0
    1e0a:	302f 0018      	move.w 24(sp),d0
    1e0e:	d081           	add.l d1,d0
    1e10:	d080           	add.l d0,d0
    1e12:	d1af 001a      	add.l d0,26(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1e16:	302f 0002      	move.w 2(sp),d0
    1e1a:	d040           	add.w d0,d0
    1e1c:	906f 0002      	sub.w 2(sp),d0
    1e20:	0640 0012      	addi.w #18,d0
    1e24:	33c0 004d 2cc2 	move.w d0,4d2cc2 <ZoomHorizontal>
      while( linesleft > 0) {
    1e2a:	4a6f 0022      	tst.w 34(sp)
    1e2e:	6e00 ff12      	bgt.w 1d42 <Zoom_ZoomIntoPicture+0x260>
      }
      shiftright--;  
    1e32:	302f 0032      	move.w 50(sp),d0
    1e36:	5340           	subq.w #1,d0
    1e38:	3f40 0032      	move.w d0,50(sp)
      if(shiftright < 0) {
    1e3c:	6a12           	bpl.s 1e50 <Zoom_ZoomIntoPicture+0x36e>
        shiftright += 16;
    1e3e:	302f 0032      	move.w 50(sp),d0
    1e42:	0640 0010      	addi.w #16,d0
    1e46:	3f40 0032      	move.w d0,50(sp)
        shifttoleft = 1;
    1e4a:	3f7c 0001 002a 	move.w #1,42(sp)
      }
    }
    startofword -= 16;
    1e50:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    1e56:	52af 0024      	addq.l #1,36(sp)
    1e5a:	7015           	moveq #21,d0
    1e5c:	b0af 0024      	cmp.l 36(sp),d0
    1e60:	6c00 fd30      	bge.w 1b92 <Zoom_ZoomIntoPicture+0xb0>
  }
}
    1e64:	4fef 0034      	lea 52(sp),sp
    1e68:	4e75           	rts

00001e6a <Zoom_SetBplPointers>:

void Zoom_SetBplPointers( UWORD *buffer, ULONG *copper) {
    1e6a:	4fef ffb0      	lea -80(sp),sp
  //                   0  1  1   1   1   0   1   1    1    1    0    1    1    0    1    1
  //int zoomoffset[] = { 0, 0, 42, 42, 84, 84, 84, 126, 126, 168, 168, 168, 210, 210, 210, 332};
  //int zoomoffset[] = { 252, 210, 210, 210, 168, 168, 168, 126, 126, 84, 84, 84, 42, 42, 0, 0 };
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
    1e6e:	204f           	movea.l sp,a0
    1e70:	223c 0000 7d78 	move.l #32120,d1
    1e76:	7040           	moveq #64,d0
    1e78:	2f00           	move.l d0,-(sp)
    1e7a:	2f01           	move.l d1,-(sp)
    1e7c:	2f08           	move.l a0,-(sp)
    1e7e:	4eba 4f7c      	jsr 6dfc <memcpy>(pc)
    1e82:	4fef 000c      	lea 12(sp),sp

  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
    1e86:	3039 004d 2cbe 	move.w 4d2cbe <Zoom_LevelOf102Zoom>,d0
    1e8c:	3000           	move.w d0,d0
    1e8e:	0280 0000 ffff 	andi.l #65535,d0
    1e94:	d080           	add.l d0,d0
    1e96:	d080           	add.l d0,d0
    1e98:	41ef 0050      	lea 80(sp),a0
    1e9c:	d1c0           	adda.l d0,a0
    1e9e:	41e8 ffb0      	lea -80(a0),a0
    1ea2:	2010           	move.l (a0),d0
    1ea4:	d080           	add.l d0,d0
    1ea6:	d0af 0054      	add.l 84(sp),d0
    1eaa:	2f40 004c      	move.l d0,76(sp)
  /*ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;*/
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
    1eae:	7072           	moveq #114,d0
    1eb0:	d0af 0058      	add.l 88(sp),d0
    1eb4:	2f40 0048      	move.l d0,72(sp)
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1eb8:	42af 0044      	clr.l 68(sp)
    1ebc:	6036           	bra.s 1ef4 <Zoom_SetBplPointers+0x8a>
    UWORD highword = (ULONG)plane2set >> 16;
    1ebe:	202f 004c      	move.l 76(sp),d0
    1ec2:	4240           	clr.w d0
    1ec4:	4840           	swap d0
    1ec6:	3f40 0042      	move.w d0,66(sp)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1eca:	3f6f 004e 0040 	move.w 78(sp),64(sp)
    *posofcopper = highword;
    1ed0:	206f 0048      	movea.l 72(sp),a0
    1ed4:	30af 0042      	move.w 66(sp),(a0)
    posofcopper += 2;
    1ed8:	58af 0048      	addq.l #4,72(sp)
    *posofcopper = lowword;
    1edc:	206f 0048      	movea.l 72(sp),a0
    1ee0:	30af 0040      	move.w 64(sp),(a0)
    posofcopper += 2;
    1ee4:	58af 0048      	addq.l #4,72(sp)
    plane2set += 42*268; //Next plane
    1ee8:	06af 0000 2bf8 	addi.l #11256,76(sp)
    1eee:	004c 
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1ef0:	52af 0044      	addq.l #1,68(sp)
    1ef4:	7004           	moveq #4,d0
    1ef6:	b0af 0044      	cmp.l 68(sp),d0
    1efa:	6cc2           	bge.s 1ebe <Zoom_SetBplPointers+0x54>
  }
  
}
    1efc:	4fef 0050      	lea 80(sp),sp
    1f00:	4e75           	rts

00001f02 <Zoom_SwapBuffers>:

void Zoom_SwapBuffers( UWORD zoomlevel) {
    1f02:	598f           	subq.l #4,sp
    1f04:	2f02           	move.l d2,-(sp)
    1f06:	202f 000c      	move.l 12(sp),d0
    1f0a:	3000           	move.w d0,d0
    1f0c:	3f40 0006      	move.w d0,6(sp)

  ViewBuffer = rawzoom + (42*268*5*zoomlevel);
    1f10:	2439 0000 b8f0 	move.l b8f0 <rawzoom>,d2
    1f16:	7000           	moveq #0,d0
    1f18:	302f 0006      	move.w 6(sp),d0
    1f1c:	2f3c 0000 dbd8 	move.l #56280,-(sp)
    1f22:	2f00           	move.l d0,-(sp)
    1f24:	4eb9 0000 715c 	jsr 715c <__mulsi3>
    1f2a:	508f           	addq.l #8,sp
    1f2c:	d082           	add.l d2,d0
    1f2e:	23c0 004d 2c64 	move.l d0,4d2c64 <ViewBuffer>
  /*ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;*/
}
    1f34:	241f           	move.l (sp)+,d2
    1f36:	588f           	addq.l #4,sp
    1f38:	4e75           	rts

00001f3a <Test_Zoom2>:
#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
    1f3a:	4fef ff00      	lea -256(sp),sp
    1f3e:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  //Test Zoomlevel 1
  volatile ULONG *srcsmall = AllocMem( 80, MEMF_CHIP);
    1f42:	7050           	moveq #80,d0
    1f44:	2f40 00f0      	move.l d0,240(sp)
    1f48:	7002           	moveq #2,d0
    1f4a:	2f40 00ec      	move.l d0,236(sp)
    1f4e:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    1f54:	2c40           	movea.l d0,a6
    1f56:	202f 00f0      	move.l 240(sp),d0
    1f5a:	222f 00ec      	move.l 236(sp),d1
    1f5e:	4eae ff3a      	jsr -198(a6)
    1f62:	2f40 00e8      	move.l d0,232(sp)
    1f66:	202f 00e8      	move.l 232(sp),d0
    1f6a:	2f40 00e4      	move.l d0,228(sp)
  if( srcsmall == 0) {
    1f6e:	6646           	bne.s 1fb6 <Test_Zoom2+0x7c>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcsmall\n", 42);
    1f70:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    1f76:	2c40           	movea.l d0,a6
    1f78:	4eae ffc4      	jsr -60(a6)
    1f7c:	2f40 001c      	move.l d0,28(sp)
    1f80:	202f 001c      	move.l 28(sp),d0
    1f84:	2f40 0018      	move.l d0,24(sp)
    1f88:	2f7c 0000 7db8 	move.l #32184,20(sp)
    1f8e:	0014 
    1f90:	702a           	moveq #42,d0
    1f92:	2f40 0010      	move.l d0,16(sp)
    1f96:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    1f9c:	2c40           	movea.l d0,a6
    1f9e:	222f 0018      	move.l 24(sp),d1
    1fa2:	242f 0014      	move.l 20(sp),d2
    1fa6:	262f 0010      	move.l 16(sp),d3
    1faa:	4eae ffd0      	jsr -48(a6)
    1fae:	2f40 000c      	move.l d0,12(sp)
    1fb2:	6000 0560      	bra.w 2514 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong(srcsmall, 0xaaaaaaaa, 2, 10, 0);
    1fb6:	42a7           	clr.l -(sp)
    1fb8:	4878 000a      	pea a <_start+0xa>
    1fbc:	4878 0002      	pea 2 <_start+0x2>
    1fc0:	2f3c aaaa aaaa 	move.l #-1431655766,-(sp)
    1fc6:	2f2f 00f4      	move.l 244(sp),-(sp)
    1fca:	4eba e250      	jsr 21c <Utils_FillLong>(pc)
    1fce:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *srcbig = AllocMem( 160, MEMF_CHIP);
    1fd2:	2f7c 0000 00a0 	move.l #160,224(sp)
    1fd8:	00e0 
    1fda:	7002           	moveq #2,d0
    1fdc:	2f40 00dc      	move.l d0,220(sp)
    1fe0:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    1fe6:	2c40           	movea.l d0,a6
    1fe8:	202f 00e0      	move.l 224(sp),d0
    1fec:	222f 00dc      	move.l 220(sp),d1
    1ff0:	4eae ff3a      	jsr -198(a6)
    1ff4:	2f40 00d8      	move.l d0,216(sp)
    1ff8:	202f 00d8      	move.l 216(sp),d0
    1ffc:	2f40 00d4      	move.l d0,212(sp)
    if( srcbig == 0) {
    2000:	6646           	bne.s 2048 <Test_Zoom2+0x10e>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcbig\n", 40);
    2002:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2008:	2c40           	movea.l d0,a6
    200a:	4eae ffc4      	jsr -60(a6)
    200e:	2f40 0030      	move.l d0,48(sp)
    2012:	202f 0030      	move.l 48(sp),d0
    2016:	2f40 002c      	move.l d0,44(sp)
    201a:	2f7c 0000 7de3 	move.l #32227,40(sp)
    2020:	0028 
    2022:	7028           	moveq #40,d0
    2024:	2f40 0024      	move.l d0,36(sp)
    2028:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    202e:	2c40           	movea.l d0,a6
    2030:	222f 002c      	move.l 44(sp),d1
    2034:	242f 0028      	move.l 40(sp),d2
    2038:	262f 0024      	move.l 36(sp),d3
    203c:	4eae ffd0      	jsr -48(a6)
    2040:	2f40 0020      	move.l d0,32(sp)
    2044:	6000 04ce      	bra.w 2514 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong( srcbig, 0x55555555, 2, 20, 0);
    2048:	42a7           	clr.l -(sp)
    204a:	4878 0014      	pea 14 <_start+0x14>
    204e:	4878 0002      	pea 2 <_start+0x2>
    2052:	2f3c 5555 5555 	move.l #1431655765,-(sp)
    2058:	2f2f 00e4      	move.l 228(sp),-(sp)
    205c:	4eba e1be      	jsr 21c <Utils_FillLong>(pc)
    2060:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *target = AllocMem( 168, MEMF_CHIP);
    2064:	2f7c 0000 00a8 	move.l #168,208(sp)
    206a:	00d0 
    206c:	7002           	moveq #2,d0
    206e:	2f40 00cc      	move.l d0,204(sp)
    2072:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    2078:	2c40           	movea.l d0,a6
    207a:	202f 00d0      	move.l 208(sp),d0
    207e:	222f 00cc      	move.l 204(sp),d1
    2082:	4eae ff3a      	jsr -198(a6)
    2086:	2f40 00c8      	move.l d0,200(sp)
    208a:	202f 00c8      	move.l 200(sp),d0
    208e:	2f40 00c4      	move.l d0,196(sp)
  if( target == 0) {
    2092:	6646           	bne.s 20da <Test_Zoom2+0x1a0>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
    2094:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    209a:	2c40           	movea.l d0,a6
    209c:	4eae ffc4      	jsr -60(a6)
    20a0:	2f40 0044      	move.l d0,68(sp)
    20a4:	202f 0044      	move.l 68(sp),d0
    20a8:	2f40 0040      	move.l d0,64(sp)
    20ac:	2f7c 0000 7e0c 	move.l #32268,60(sp)
    20b2:	003c 
    20b4:	7028           	moveq #40,d0
    20b6:	2f40 0038      	move.l d0,56(sp)
    20ba:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    20c0:	2c40           	movea.l d0,a6
    20c2:	222f 0040      	move.l 64(sp),d1
    20c6:	242f 003c      	move.l 60(sp),d2
    20ca:	262f 0038      	move.l 56(sp),d3
    20ce:	4eae ffd0      	jsr -48(a6)
    20d2:	2f40 0034      	move.l d0,52(sp)
    20d6:	6000 043c      	bra.w 2514 <Test_Zoom2+0x5da>
    return;
  }
  WaitBlt();
    20da:	4eba dfd8      	jsr b4 <WaitBlt>(pc)
  hw->bltafwm = 0xffff;
    20de:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    20e4:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    20ea:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    20f0:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltdmod = 38;
    20f6:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    20fc:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcon1 = 1 << 12; //Shift src big
    2102:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    2108:	317c 1000 0042 	move.w #4096,66(a0)
  hw->bltcon0 = 0xde4; //Chanell settings and Shift src small
    210e:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    2114:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltcdat = 0x8000; //Show channel small if 1 else channel big
    211a:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    2120:	317c 8000 0070 	move.w #-32768,112(a0)
  //srcbig-shift   0010 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sbbb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2126:	4878 0001      	pea 1 <_start+0x1>
    212a:	4878 004e      	pea 4e <_start+0x4e>
    212e:	4878 0026      	pea 26 <_start+0x26>
    2132:	4878 0002      	pea 2 <_start+0x2>
    2136:	2f2f 00d4      	move.l 212(sp),-(sp)
    213a:	2f2f 00e8      	move.l 232(sp),-(sp)
    213e:	2f2f 00fc      	move.l 252(sp),-(sp)
    2142:	4eba ef0c      	jsr 1050 <Zoom_ZoomBlit2>(pc)
    2146:	4fef 001c      	lea 28(sp),sp
  UWORD *tmp = (UWORD *)target;
    214a:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2150:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    2156:	2c40           	movea.l d0,a6
    2158:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    215c:	42af 0104      	clr.l 260(sp)
    2160:	605c           	bra.s 21be <Test_Zoom2+0x284>
    if( *tmp != 0xaaaa ) {
    2162:	206f 0108      	movea.l 264(sp),a0
    2166:	3010           	move.w (a0),d0
    2168:	0c40 aaaa      	cmpi.w #-21846,d0
    216c:	6746           	beq.s 21b4 <Test_Zoom2+0x27a>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 1 failed\n", 40);
    216e:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2174:	2c40           	movea.l d0,a6
    2176:	4eae ffc4      	jsr -60(a6)
    217a:	2f40 0058      	move.l d0,88(sp)
    217e:	202f 0058      	move.l 88(sp),d0
    2182:	2f40 0054      	move.l d0,84(sp)
    2186:	2f7c 0000 7e35 	move.l #32309,80(sp)
    218c:	0050 
    218e:	7028           	moveq #40,d0
    2190:	2f40 004c      	move.l d0,76(sp)
    2194:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    219a:	2c40           	movea.l d0,a6
    219c:	222f 0054      	move.l 84(sp),d1
    21a0:	242f 0050      	move.l 80(sp),d2
    21a4:	262f 004c      	move.l 76(sp),d3
    21a8:	4eae ffd0      	jsr -48(a6)
    21ac:	2f40 0048      	move.l d0,72(sp)
    21b0:	6000 0362      	bra.w 2514 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    21b4:	7028           	moveq #40,d0
    21b6:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    21ba:	52af 0104      	addq.l #1,260(sp)
    21be:	7001           	moveq #1,d0
    21c0:	b0af 0104      	cmp.l 260(sp),d0
    21c4:	6c9c           	bge.s 2162 <Test_Zoom2+0x228>
  //srcbig-shift   0001 0101 0101 0101
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       ssbb bbbb bbbb bbbb
  //result:        1001 0101 0101 0101

  hw->bltcon1 = 2 << 12; //Shift src big
    21c6:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    21cc:	317c 2000 0042 	move.w #8192,66(a0)
  hw->bltcdat = 0xc000; //Show channel small if 1 else channel big
    21d2:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    21d8:	317c c000 0070 	move.w #-16384,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    21de:	4878 0001      	pea 1 <_start+0x1>
    21e2:	4878 004e      	pea 4e <_start+0x4e>
    21e6:	4878 0026      	pea 26 <_start+0x26>
    21ea:	4878 0002      	pea 2 <_start+0x2>
    21ee:	2f2f 00d4      	move.l 212(sp),-(sp)
    21f2:	2f2f 00e8      	move.l 232(sp),-(sp)
    21f6:	2f2f 00fc      	move.l 252(sp),-(sp)
    21fa:	4eba ee54      	jsr 1050 <Zoom_ZoomBlit2>(pc)
    21fe:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2202:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2208:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    220e:	2c40           	movea.l d0,a6
    2210:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2214:	42af 0100      	clr.l 256(sp)
    2218:	605c           	bra.s 2276 <Test_Zoom2+0x33c>
    if( *tmp != 0x9555 ) {
    221a:	206f 0108      	movea.l 264(sp),a0
    221e:	3010           	move.w (a0),d0
    2220:	0c40 9555      	cmpi.w #-27307,d0
    2224:	6746           	beq.s 226c <Test_Zoom2+0x332>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 2 failed\n", 40);
    2226:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    222c:	2c40           	movea.l d0,a6
    222e:	4eae ffc4      	jsr -60(a6)
    2232:	2f40 006c      	move.l d0,108(sp)
    2236:	202f 006c      	move.l 108(sp),d0
    223a:	2f40 0068      	move.l d0,104(sp)
    223e:	2f7c 0000 7e5e 	move.l #32350,100(sp)
    2244:	0064 
    2246:	7028           	moveq #40,d0
    2248:	2f40 0060      	move.l d0,96(sp)
    224c:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2252:	2c40           	movea.l d0,a6
    2254:	222f 0068      	move.l 104(sp),d1
    2258:	242f 0064      	move.l 100(sp),d2
    225c:	262f 0060      	move.l 96(sp),d3
    2260:	4eae ffd0      	jsr -48(a6)
    2264:	2f40 005c      	move.l d0,92(sp)
    2268:	6000 02aa      	bra.w 2514 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    226c:	7028           	moveq #40,d0
    226e:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2272:	52af 0100      	addq.l #1,256(sp)
    2276:	7001           	moveq #1,d0
    2278:	b0af 0100      	cmp.l 256(sp),d0
    227c:	6c9c           	bge.s 221a <Test_Zoom2+0x2e0>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    227e:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    2284:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    228a:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    2290:	317c e000 0070 	move.w #-8192,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2296:	4878 0001      	pea 1 <_start+0x1>
    229a:	4878 004e      	pea 4e <_start+0x4e>
    229e:	4878 0026      	pea 26 <_start+0x26>
    22a2:	4878 0002      	pea 2 <_start+0x2>
    22a6:	2f2f 00d4      	move.l 212(sp),-(sp)
    22aa:	2f2f 00e8      	move.l 232(sp),-(sp)
    22ae:	2f2f 00fc      	move.l 252(sp),-(sp)
    22b2:	4eba ed9c      	jsr 1050 <Zoom_ZoomBlit2>(pc)
    22b6:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    22ba:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    22c0:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    22c6:	2c40           	movea.l d0,a6
    22c8:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    22cc:	42af 00fc      	clr.l 252(sp)
    22d0:	605c           	bra.s 232e <Test_Zoom2+0x3f4>
    if( *tmp != 0xaaaa ) {
    22d2:	206f 0108      	movea.l 264(sp),a0
    22d6:	3010           	move.w (a0),d0
    22d8:	0c40 aaaa      	cmpi.w #-21846,d0
    22dc:	6746           	beq.s 2324 <Test_Zoom2+0x3ea>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    22de:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    22e4:	2c40           	movea.l d0,a6
    22e6:	4eae ffc4      	jsr -60(a6)
    22ea:	2f40 0080      	move.l d0,128(sp)
    22ee:	202f 0080      	move.l 128(sp),d0
    22f2:	2f40 007c      	move.l d0,124(sp)
    22f6:	2f7c 0000 7e87 	move.l #32391,120(sp)
    22fc:	0078 
    22fe:	7028           	moveq #40,d0
    2300:	2f40 0074      	move.l d0,116(sp)
    2304:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    230a:	2c40           	movea.l d0,a6
    230c:	222f 007c      	move.l 124(sp),d1
    2310:	242f 0078      	move.l 120(sp),d2
    2314:	262f 0074      	move.l 116(sp),d3
    2318:	4eae ffd0      	jsr -48(a6)
    231c:	2f40 0070      	move.l d0,112(sp)
    2320:	6000 01f2      	bra.w 2514 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    2324:	7028           	moveq #40,d0
    2326:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    232a:	52af 00fc      	addq.l #1,252(sp)
    232e:	7001           	moveq #1,d0
    2330:	b0af 00fc      	cmp.l 252(sp),d0
    2334:	6c9c           	bge.s 22d2 <Test_Zoom2+0x398>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2336:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    233c:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    2342:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    2348:	317c e000 0070 	move.w #-8192,112(a0)

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    234e:	4878 0001      	pea 1 <_start+0x1>
    2352:	4878 004e      	pea 4e <_start+0x4e>
    2356:	4878 0026      	pea 26 <_start+0x26>
    235a:	4878 0002      	pea 2 <_start+0x2>
    235e:	2f2f 00d4      	move.l 212(sp),-(sp)
    2362:	2f2f 00e8      	move.l 232(sp),-(sp)
    2366:	2f2f 00fc      	move.l 252(sp),-(sp)
    236a:	4eba ece4      	jsr 1050 <Zoom_ZoomBlit2>(pc)
    236e:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2372:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2378:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    237e:	2c40           	movea.l d0,a6
    2380:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2384:	42af 00f8      	clr.l 248(sp)
    2388:	605c           	bra.s 23e6 <Test_Zoom2+0x4ac>
    if( *tmp != 0xaaaa ) {
    238a:	206f 0108      	movea.l 264(sp),a0
    238e:	3010           	move.w (a0),d0
    2390:	0c40 aaaa      	cmpi.w #-21846,d0
    2394:	6746           	beq.s 23dc <Test_Zoom2+0x4a2>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    2396:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    239c:	2c40           	movea.l d0,a6
    239e:	4eae ffc4      	jsr -60(a6)
    23a2:	2f40 0094      	move.l d0,148(sp)
    23a6:	202f 0094      	move.l 148(sp),d0
    23aa:	2f40 0090      	move.l d0,144(sp)
    23ae:	2f7c 0000 7e87 	move.l #32391,140(sp)
    23b4:	008c 
    23b6:	7028           	moveq #40,d0
    23b8:	2f40 0088      	move.l d0,136(sp)
    23bc:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    23c2:	2c40           	movea.l d0,a6
    23c4:	222f 0090      	move.l 144(sp),d1
    23c8:	242f 008c      	move.l 140(sp),d2
    23cc:	262f 0088      	move.l 136(sp),d3
    23d0:	4eae ffd0      	jsr -48(a6)
    23d4:	2f40 0084      	move.l d0,132(sp)
    23d8:	6000 013a      	bra.w 2514 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    23dc:	7028           	moveq #40,d0
    23de:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    23e2:	52af 00f8      	addq.l #1,248(sp)
    23e6:	7001           	moveq #1,d0
    23e8:	b0af 00f8      	cmp.l 248(sp),d0
    23ec:	6c9c           	bge.s 238a <Test_Zoom2+0x450>
  //srcsmall:            1010 1010 1010 1010
  //srcsmall-shift:      0101 0101 0101 0101
  //pattern:             sssb bbbb bbbb bbbb
  //result:              0100 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    23ee:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    23f4:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    23fa:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    2400:	317c e000 0070 	move.w #-8192,112(a0)
  hw->bltcon0 = 0xde4 + (1 << 12); //Chanell settings and Shift src small
    2406:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    240c:	317c 1de4 0040 	move.w #7652,64(a0)
 
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2412:	4878 0001      	pea 1 <_start+0x1>
    2416:	4878 004e      	pea 4e <_start+0x4e>
    241a:	4878 0026      	pea 26 <_start+0x26>
    241e:	4878 0002      	pea 2 <_start+0x2>
    2422:	2f2f 00d4      	move.l 212(sp),-(sp)
    2426:	2f2f 00e8      	move.l 232(sp),-(sp)
    242a:	2f2f 00fc      	move.l 252(sp),-(sp)
    242e:	4eba ec20      	jsr 1050 <Zoom_ZoomBlit2>(pc)
    2432:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2436:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    243c:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    2442:	2c40           	movea.l d0,a6
    2444:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2448:	42af 00f4      	clr.l 244(sp)
    244c:	605a           	bra.s 24a8 <Test_Zoom2+0x56e>
    if( *tmp != 0x4aaa ) {
    244e:	206f 0108      	movea.l 264(sp),a0
    2452:	3010           	move.w (a0),d0
    2454:	0c40 4aaa      	cmpi.w #19114,d0
    2458:	6744           	beq.s 249e <Test_Zoom2+0x564>
      Write( Output(), "Test_Zoom2: Test for shifting a failed\n", 39);
    245a:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2460:	2c40           	movea.l d0,a6
    2462:	4eae ffc4      	jsr -60(a6)
    2466:	2f40 00a8      	move.l d0,168(sp)
    246a:	202f 00a8      	move.l 168(sp),d0
    246e:	2f40 00a4      	move.l d0,164(sp)
    2472:	2f7c 0000 7eb0 	move.l #32432,160(sp)
    2478:	00a0 
    247a:	7027           	moveq #39,d0
    247c:	2f40 009c      	move.l d0,156(sp)
    2480:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2486:	2c40           	movea.l d0,a6
    2488:	222f 00a4      	move.l 164(sp),d1
    248c:	242f 00a0      	move.l 160(sp),d2
    2490:	262f 009c      	move.l 156(sp),d3
    2494:	4eae ffd0      	jsr -48(a6)
    2498:	2f40 0098      	move.l d0,152(sp)
    249c:	6076           	bra.s 2514 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    249e:	7028           	moveq #40,d0
    24a0:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    24a4:	52af 00f4      	addq.l #1,244(sp)
    24a8:	7001           	moveq #1,d0
    24aa:	b0af 00f4      	cmp.l 244(sp),d0
    24ae:	6c9e           	bge.s 244e <Test_Zoom2+0x514>

  FreeMem( srcsmall, 80);
    24b0:	2f6f 00e4 00c0 	move.l 228(sp),192(sp)
    24b6:	7050           	moveq #80,d0
    24b8:	2f40 00bc      	move.l d0,188(sp)
    24bc:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    24c2:	2c40           	movea.l d0,a6
    24c4:	226f 00c0      	movea.l 192(sp),a1
    24c8:	202f 00bc      	move.l 188(sp),d0
    24cc:	4eae ff2e      	jsr -210(a6)
  FreeMem( srcbig, 160);
    24d0:	2f6f 00d4 00b8 	move.l 212(sp),184(sp)
    24d6:	2f7c 0000 00a0 	move.l #160,180(sp)
    24dc:	00b4 
    24de:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    24e4:	2c40           	movea.l d0,a6
    24e6:	226f 00b8      	movea.l 184(sp),a1
    24ea:	202f 00b4      	move.l 180(sp),d0
    24ee:	4eae ff2e      	jsr -210(a6)
  FreeMem( target, 168);
    24f2:	2f6f 00c4 00b0 	move.l 196(sp),176(sp)
    24f8:	2f7c 0000 00a8 	move.l #168,172(sp)
    24fe:	00ac 
    2500:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    2506:	2c40           	movea.l d0,a6
    2508:	226f 00b0      	movea.l 176(sp),a1
    250c:	202f 00ac      	move.l 172(sp),d0
    2510:	4eae ff2e      	jsr -210(a6)
    2514:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2518:	4fef 0100      	lea 256(sp),sp
    251c:	4e75           	rts

0000251e <ClBuild>:
#include "utils.h"




ULONG * ClBuild() {
    251e:	4fef ffc4      	lea -60(sp),sp
    2522:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
    2526:	2f7c 0000 0084 	move.l #132,48(sp)
    252c:	0030 
    252e:	7002           	moveq #2,d0
    2530:	2f40 002c      	move.l d0,44(sp)
    2534:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    253a:	2c40           	movea.l d0,a6
    253c:	202f 0030      	move.l 48(sp),d0
    2540:	222f 002c      	move.l 44(sp),d1
    2544:	4eae ff3a      	jsr -198(a6)
    2548:	2f40 0028      	move.l d0,40(sp)
    254c:	202f 0028      	move.l 40(sp),d0
    2550:	2f40 0024      	move.l d0,36(sp)
  if( retval == 0) {
    2554:	6658           	bne.s 25ae <ClBuild+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2556:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    255c:	2c40           	movea.l d0,a6
    255e:	4eae ffc4      	jsr -60(a6)
    2562:	2f40 0020      	move.l d0,32(sp)
    2566:	202f 0020      	move.l 32(sp),d0
    256a:	2f40 001c      	move.l d0,28(sp)
    256e:	2f7c 0000 7d43 	move.l #32067,24(sp)
    2574:	0018 
    2576:	7228           	moveq #40,d1
    2578:	2f41 0014      	move.l d1,20(sp)
    257c:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2582:	2c40           	movea.l d0,a6
    2584:	222f 001c      	move.l 28(sp),d1
    2588:	242f 0018      	move.l 24(sp),d2
    258c:	262f 0014      	move.l 20(sp),d3
    2590:	4eae ffd0      	jsr -48(a6)
    2594:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    2598:	7401           	moveq #1,d2
    259a:	2f42 000c      	move.l d2,12(sp)
    259e:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    25a4:	2c40           	movea.l d0,a6
    25a6:	222f 000c      	move.l 12(sp),d1
    25aa:	4eae ff70      	jsr -144(a6)
  }
    
  ULONG *cl = retval;
    25ae:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    25b4:	2f7c 0000 a6dc 	move.l #42716,64(sp)
    25ba:	0040 
  for(int i=0; i<16;i++)
    25bc:	42af 003c      	clr.l 60(sp)
    25c0:	6024           	bra.s 25e6 <ClBuild+0xc8>
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
  for(int i=0; i<16;i++)
    25e2:	52af 003c      	addq.l #1,60(sp)
    25e6:	700f           	moveq #15,d0
    25e8:	b0af 003c      	cmp.l 60(sp),d0
    25ec:	6cd4           	bge.s 25c2 <ClBuild+0xa4>
  clpartinstruction = ClScreen;
    25ee:	2f7c 0000 a71c 	move.l #42780,64(sp)
    25f4:	0040 
  for(int i=0; i<12;i++)
    25f6:	42af 0038      	clr.l 56(sp)
    25fa:	6024           	bra.s 2620 <ClBuild+0x102>
    *cl++ = *clpartinstruction++;
    25fc:	222f 0040      	move.l 64(sp),d1
    2600:	2401           	move.l d1,d2
    2602:	5882           	addq.l #4,d2
    2604:	2f42 0040      	move.l d2,64(sp)
    2608:	202f 0044      	move.l 68(sp),d0
    260c:	2400           	move.l d0,d2
    260e:	5882           	addq.l #4,d2
    2610:	2f42 0044      	move.l d2,68(sp)
    2614:	2041           	movea.l d1,a0
    2616:	2210           	move.l (a0),d1
    2618:	2040           	movea.l d0,a0
    261a:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    261c:	52af 0038      	addq.l #1,56(sp)
    2620:	700b           	moveq #11,d0
    2622:	b0af 0038      	cmp.l 56(sp),d0
    2626:	6cd4           	bge.s 25fc <ClBuild+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    2628:	202f 0044      	move.l 68(sp),d0
    262c:	2200           	move.l d0,d1
    262e:	5881           	addq.l #4,d1
    2630:	2f41 0044      	move.l d1,68(sp)
    2634:	2040           	movea.l d0,a0
    2636:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    263c:	202f 0044      	move.l 68(sp),d0
    2640:	2200           	move.l d0,d1
    2642:	5881           	addq.l #4,d1
    2644:	2f41 0044      	move.l d1,68(sp)
    2648:	2040           	movea.l d0,a0
    264a:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
    2650:	2f7c 0000 a65c 	move.l #42588,64(sp)
    2656:	0040 
  for(int i=0; i<2;i++)
    2658:	42af 0034      	clr.l 52(sp)
    265c:	6024           	bra.s 2682 <ClBuild+0x164>
    *cl++ = *clpartinstruction++;
    265e:	222f 0040      	move.l 64(sp),d1
    2662:	2001           	move.l d1,d0
    2664:	5880           	addq.l #4,d0
    2666:	2f40 0040      	move.l d0,64(sp)
    266a:	202f 0044      	move.l 68(sp),d0
    266e:	2400           	move.l d0,d2
    2670:	5882           	addq.l #4,d2
    2672:	2f42 0044      	move.l d2,68(sp)
    2676:	2041           	movea.l d1,a0
    2678:	2210           	move.l (a0),d1
    267a:	2040           	movea.l d0,a0
    267c:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
    267e:	52af 0034      	addq.l #1,52(sp)
    2682:	7001           	moveq #1,d0
    2684:	b0af 0034      	cmp.l 52(sp),d0
    2688:	6cd4           	bge.s 265e <ClBuild+0x140>
  *cl = 0xfffffffe;
    268a:	206f 0044      	movea.l 68(sp),a0
    268e:	72fe           	moveq #-2,d1
    2690:	2081           	move.l d1,(a0)

  return retval;
    2692:	202f 0024      	move.l 36(sp),d0
}
    2696:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    269a:	4fef 003c      	lea 60(sp),sp
    269e:	4e75           	rts

000026a0 <PrepareDisplay>:

int PrepareDisplay() {
    26a0:	4fef ffb8      	lea -72(sp),sp
    26a4:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClBuild( );
    26a8:	4eba fe74      	jsr 251e <ClBuild>(pc)
    26ac:	23c0 004d 2c58 	move.l d0,4d2c58 <Copperlist1>
  Copperlist2 = ClBuild( );
    26b2:	4eba fe6a      	jsr 251e <ClBuild>(pc)
    26b6:	23c0 004d 2c5c 	move.l d0,4d2c5c <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    26bc:	2f7c 0000 c800 	move.l #51200,80(sp)
    26c2:	0050 
    26c4:	7002           	moveq #2,d0
    26c6:	2f40 004c      	move.l d0,76(sp)
    26ca:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    26d0:	2c40           	movea.l d0,a6
    26d2:	202f 0050      	move.l 80(sp),d0
    26d6:	222f 004c      	move.l 76(sp),d1
    26da:	4eae ff3a      	jsr -198(a6)
    26de:	2f40 0048      	move.l d0,72(sp)
    26e2:	202f 0048      	move.l 72(sp),d0
    26e6:	23c0 004d 2c50 	move.l d0,4d2c50 <Bitplane1>
  if(Bitplane1 == 0) {
    26ec:	2039 004d 2c50 	move.l 4d2c50 <Bitplane1>,d0
    26f2:	6658           	bne.s 274c <PrepareDisplay+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    26f4:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    26fa:	2c40           	movea.l d0,a6
    26fc:	4eae ffc4      	jsr -60(a6)
    2700:	2f40 0044      	move.l d0,68(sp)
    2704:	202f 0044      	move.l 68(sp),d0
    2708:	2f40 0040      	move.l d0,64(sp)
    270c:	2f7c 0000 7cf5 	move.l #31989,60(sp)
    2712:	003c 
    2714:	7026           	moveq #38,d0
    2716:	2f40 0038      	move.l d0,56(sp)
    271a:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2720:	2c40           	movea.l d0,a6
    2722:	222f 0040      	move.l 64(sp),d1
    2726:	242f 003c      	move.l 60(sp),d2
    272a:	262f 0038      	move.l 56(sp),d3
    272e:	4eae ffd0      	jsr -48(a6)
    2732:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    2736:	7001           	moveq #1,d0
    2738:	2f40 0030      	move.l d0,48(sp)
    273c:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2742:	2c40           	movea.l d0,a6
    2744:	222f 0030      	move.l 48(sp),d1
    2748:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane1;
    274c:	2039 004d 2c50 	move.l 4d2c50 <Bitplane1>,d0
    2752:	23c0 004d 2c64 	move.l d0,4d2c64 <ViewBuffer>
  ViewCopper = Copperlist1;
    2758:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    275e:	23c0 004d 2c6c 	move.l d0,4d2c6c <ViewCopper>
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    2764:	2f7c 0000 c800 	move.l #51200,44(sp)
    276a:	002c 
    276c:	7002           	moveq #2,d0
    276e:	2f40 0028      	move.l d0,40(sp)
    2772:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    2778:	2c40           	movea.l d0,a6
    277a:	202f 002c      	move.l 44(sp),d0
    277e:	222f 0028      	move.l 40(sp),d1
    2782:	4eae ff3a      	jsr -198(a6)
    2786:	2f40 0024      	move.l d0,36(sp)
    278a:	202f 0024      	move.l 36(sp),d0
    278e:	23c0 004d 2c54 	move.l d0,4d2c54 <Bitplane2>
  if(Bitplane2 == 0) {
    2794:	2039 004d 2c54 	move.l 4d2c54 <Bitplane2>,d0
    279a:	6658           	bne.s 27f4 <PrepareDisplay+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    279c:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    27a2:	2c40           	movea.l d0,a6
    27a4:	4eae ffc4      	jsr -60(a6)
    27a8:	2f40 0020      	move.l d0,32(sp)
    27ac:	202f 0020      	move.l 32(sp),d0
    27b0:	2f40 001c      	move.l d0,28(sp)
    27b4:	2f7c 0000 7d1c 	move.l #32028,24(sp)
    27ba:	0018 
    27bc:	7026           	moveq #38,d0
    27be:	2f40 0014      	move.l d0,20(sp)
    27c2:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    27c8:	2c40           	movea.l d0,a6
    27ca:	222f 001c      	move.l 28(sp),d1
    27ce:	242f 0018      	move.l 24(sp),d2
    27d2:	262f 0014      	move.l 20(sp),d3
    27d6:	4eae ffd0      	jsr -48(a6)
    27da:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    27de:	7001           	moveq #1,d0
    27e0:	2f40 000c      	move.l d0,12(sp)
    27e4:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    27ea:	2c40           	movea.l d0,a6
    27ec:	222f 000c      	move.l 12(sp),d1
    27f0:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane2;
    27f4:	2039 004d 2c54 	move.l 4d2c54 <Bitplane2>,d0
    27fa:	23c0 004d 2c60 	move.l d0,4d2c60 <DrawBuffer>
  DrawCopper = Copperlist2;
    2800:	2039 004d 2c5c 	move.l 4d2c5c <Copperlist2>,d0
    2806:	23c0 004d 2c68 	move.l d0,4d2c68 <DrawCopper>
  /*SwapCl();
  SetBplPointers();
  SwapCl();
  SetBplPointers();*/
  return 0;
    280c:	7000           	moveq #0,d0
}
    280e:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2812:	4fef 0048      	lea 72(sp),sp
    2816:	4e75           	rts

00002818 <TestCopperlistBatch>:

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                  long length) {
    2818:	598f           	subq.l #4,sp
  for( int i=0;i<length;i++)
    281a:	4297           	clr.l (sp)
    281c:	602a           	bra.s 2848 <TestCopperlistBatch+0x30>
    if( instructions[ pos+i] != batch[ i])
    281e:	202f 000c      	move.l 12(sp),d0
    2822:	d097           	add.l (sp),d0
    2824:	d080           	add.l d0,d0
    2826:	d080           	add.l d0,d0
    2828:	206f 0008      	movea.l 8(sp),a0
    282c:	d1c0           	adda.l d0,a0
    282e:	2210           	move.l (a0),d1
    2830:	2017           	move.l (sp),d0
    2832:	d080           	add.l d0,d0
    2834:	d080           	add.l d0,d0
    2836:	206f 0010      	movea.l 16(sp),a0
    283a:	d1c0           	adda.l d0,a0
    283c:	2010           	move.l (a0),d0
    283e:	b081           	cmp.l d1,d0
    2840:	6704           	beq.s 2846 <TestCopperlistBatch+0x2e>
      return 0;
    2842:	7000           	moveq #0,d0
    2844:	600c           	bra.s 2852 <TestCopperlistBatch+0x3a>
  for( int i=0;i<length;i++)
    2846:	5297           	addq.l #1,(sp)
    2848:	2017           	move.l (sp),d0
    284a:	b0af 0014      	cmp.l 20(sp),d0
    284e:	6dce           	blt.s 281e <TestCopperlistBatch+0x6>
  return 1;
    2850:	7001           	moveq #1,d0
}
    2852:	588f           	addq.l #4,sp
    2854:	4e75           	rts

00002856 <TestCopperlistPos>:

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    2856:	202f 0008      	move.l 8(sp),d0
    285a:	d080           	add.l d0,d0
    285c:	d080           	add.l d0,d0
    285e:	206f 0004      	movea.l 4(sp),a0
    2862:	d1c0           	adda.l d0,a0
    2864:	2010           	move.l (a0),d0
    2866:	b0af 000c      	cmp.l 12(sp),d0
    286a:	6604           	bne.s 2870 <TestCopperlistPos+0x1a>
    return 1;
    286c:	7001           	moveq #1,d0
    286e:	6002           	bra.s 2872 <TestCopperlistPos+0x1c>
  else 
    return 0;
    2870:	7000           	moveq #0,d0
}
    2872:	4e75           	rts

00002874 <TestCopperList>:

void TestCopperList() {
    2874:	4fef feb8      	lea -328(sp),sp
    2878:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Write( Output(), "%d", hw->cop1lc);
    287c:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2882:	2c40           	movea.l d0,a6
    2884:	4eae ffc4      	jsr -60(a6)
    2888:	2f40 0150      	move.l d0,336(sp)
    288c:	202f 0150      	move.l 336(sp),d0
    2890:	2f40 014c      	move.l d0,332(sp)
    2894:	2f7c 0000 7ed8 	move.l #32472,328(sp)
    289a:	0148 
    289c:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    28a2:	2028 0080      	move.l 128(a0),d0
    28a6:	2f40 0144      	move.l d0,324(sp)
    28aa:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    28b0:	2c40           	movea.l d0,a6
    28b2:	222f 014c      	move.l 332(sp),d1
    28b6:	242f 0148      	move.l 328(sp),d2
    28ba:	262f 0144      	move.l 324(sp),d3
    28be:	4eae ffd0      	jsr -48(a6)
    28c2:	2f40 0140      	move.l d0,320(sp)
  Copperlist1 = ClBuild();
    28c6:	4eba fc56      	jsr 251e <ClBuild>(pc)
    28ca:	23c0 004d 2c58 	move.l d0,4d2c58 <Copperlist1>
  DrawCopper = Copperlist1;
    28d0:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    28d6:	23c0 004d 2c68 	move.l d0,4d2c68 <DrawCopper>
  Copperlist2 = ClBuild();
    28dc:	4eba fc40      	jsr 251e <ClBuild>(pc)
    28e0:	23c0 004d 2c5c 	move.l d0,4d2c5c <Copperlist2>
  ViewCopper = Copperlist2;
    28e6:	2039 004d 2c5c 	move.l 4d2c5c <Copperlist2>,d0
    28ec:	23c0 004d 2c6c 	move.l d0,4d2c6c <ViewCopper>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    28f2:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    28f8:	4878 0010      	pea 10 <_start+0x10>
    28fc:	4879 0000 a6dc 	pea a6dc <ClsSprites>
    2902:	42a7           	clr.l -(sp)
    2904:	2f00           	move.l d0,-(sp)
    2906:	4eba ff10      	jsr 2818 <TestCopperlistBatch>(pc)
    290a:	4fef 0010      	lea 16(sp),sp
    290e:	4a80           	tst.l d0
    2910:	6642           	bne.s 2954 <TestCopperList+0xe0>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    2912:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2918:	2c40           	movea.l d0,a6
    291a:	4eae ffc4      	jsr -60(a6)
    291e:	2f40 013c      	move.l d0,316(sp)
    2922:	202f 013c      	move.l 316(sp),d0
    2926:	2f40 0138      	move.l d0,312(sp)
    292a:	2f7c 0000 7660 	move.l #30304,308(sp)
    2930:	0134 
    2932:	702c           	moveq #44,d0
    2934:	2f40 0130      	move.l d0,304(sp)
    2938:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    293e:	2c40           	movea.l d0,a6
    2940:	222f 0138      	move.l 312(sp),d1
    2944:	242f 0134      	move.l 308(sp),d2
    2948:	262f 0130      	move.l 304(sp),d3
    294c:	4eae ffd0      	jsr -48(a6)
    2950:	2f40 012c      	move.l d0,300(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2954:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    295a:	4878 000c      	pea c <_start+0xc>
    295e:	4879 0000 a71c 	pea a71c <ClScreen>
    2964:	4878 0010      	pea 10 <_start+0x10>
    2968:	2f00           	move.l d0,-(sp)
    296a:	4eba feac      	jsr 2818 <TestCopperlistBatch>(pc)
    296e:	4fef 0010      	lea 16(sp),sp
    2972:	4a80           	tst.l d0
    2974:	6642           	bne.s 29b8 <TestCopperList+0x144>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    2976:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    297c:	2c40           	movea.l d0,a6
    297e:	4eae ffc4      	jsr -60(a6)
    2982:	2f40 0128      	move.l d0,296(sp)
    2986:	202f 0128      	move.l 296(sp),d0
    298a:	2f40 0124      	move.l d0,292(sp)
    298e:	2f7c 0000 7696 	move.l #30358,288(sp)
    2994:	0120 
    2996:	7036           	moveq #54,d0
    2998:	2f40 011c      	move.l d0,284(sp)
    299c:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    29a2:	2c40           	movea.l d0,a6
    29a4:	222f 0124      	move.l 292(sp),d1
    29a8:	242f 0120      	move.l 288(sp),d2
    29ac:	262f 011c      	move.l 284(sp),d3
    29b0:	4eae ffd0      	jsr -48(a6)
    29b4:	2f40 0118      	move.l d0,280(sp)
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
    29b8:	23fc 0004 0000 	move.l #262144,4d2c60 <DrawBuffer>
    29be:	004d 2c60 
  ViewBuffer = (ULONG *)0x50000;
    29c2:	23fc 0005 0000 	move.l #327680,4d2c64 <ViewBuffer>
    29c8:	004d 2c64 
  
  SetBplPointers();
    29cc:	4eba d774      	jsr 142 <SetBplPointers>(pc)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    29d0:	2039 004d 2c60 	move.l 4d2c60 <DrawBuffer>,d0
    29d6:	0c80 0005 0000 	cmpi.l #327680,d0
    29dc:	660e           	bne.s 29ec <TestCopperList+0x178>
    29de:	2039 004d 2c64 	move.l 4d2c64 <ViewBuffer>,d0
    29e4:	0c80 0004 0000 	cmpi.l #262144,d0
    29ea:	6742           	beq.s 2a2e <TestCopperList+0x1ba>
    Write( Output(), 
    29ec:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    29f2:	2c40           	movea.l d0,a6
    29f4:	4eae ffc4      	jsr -60(a6)
    29f8:	2f40 0114      	move.l d0,276(sp)
    29fc:	202f 0114      	move.l 276(sp),d0
    2a00:	2f40 0110      	move.l d0,272(sp)
    2a04:	2f7c 0000 7edb 	move.l #32475,268(sp)
    2a0a:	010c 
    2a0c:	703b           	moveq #59,d0
    2a0e:	2f40 0108      	move.l d0,264(sp)
    2a12:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2a18:	2c40           	movea.l d0,a6
    2a1a:	222f 0110      	move.l 272(sp),d1
    2a1e:	242f 010c      	move.l 268(sp),d2
    2a22:	262f 0108      	move.l 264(sp),d3
    2a26:	4eae ffd0      	jsr -48(a6)
    2a2a:	2f40 0104      	move.l d0,260(sp)
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    2a2e:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    2a34:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    2a3a:	4878 001c      	pea 1c <_start+0x1c>
    2a3e:	2f00           	move.l d0,-(sp)
    2a40:	4eba fe14      	jsr 2856 <TestCopperlistPos>(pc)
    2a44:	4fef 000c      	lea 12(sp),sp
    2a48:	4a80           	tst.l d0
    2a4a:	6642           	bne.s 2a8e <TestCopperList+0x21a>
    Write(Output(), 
    2a4c:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2a52:	2c40           	movea.l d0,a6
    2a54:	4eae ffc4      	jsr -60(a6)
    2a58:	2f40 0100      	move.l d0,256(sp)
    2a5c:	202f 0100      	move.l 256(sp),d0
    2a60:	2f40 00fc      	move.l d0,252(sp)
    2a64:	2f7c 0000 7f17 	move.l #32535,248(sp)
    2a6a:	00f8 
    2a6c:	703c           	moveq #60,d0
    2a6e:	2f40 00f4      	move.l d0,244(sp)
    2a72:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2a78:	2c40           	movea.l d0,a6
    2a7a:	222f 00fc      	move.l 252(sp),d1
    2a7e:	242f 00f8      	move.l 248(sp),d2
    2a82:	262f 00f4      	move.l 244(sp),d3
    2a86:	4eae ffd0      	jsr -48(a6)
    2a8a:	2f40 00f0      	move.l d0,240(sp)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    2a8e:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    2a94:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    2a9a:	4878 001d      	pea 1d <_start+0x1d>
    2a9e:	2f00           	move.l d0,-(sp)
    2aa0:	4eba fdb4      	jsr 2856 <TestCopperlistPos>(pc)
    2aa4:	4fef 000c      	lea 12(sp),sp
    2aa8:	4a80           	tst.l d0
    2aaa:	6642           	bne.s 2aee <TestCopperList+0x27a>
    Write(Output(), 
    2aac:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2ab2:	2c40           	movea.l d0,a6
    2ab4:	4eae ffc4      	jsr -60(a6)
    2ab8:	2f40 00ec      	move.l d0,236(sp)
    2abc:	202f 00ec      	move.l 236(sp),d0
    2ac0:	2f40 00e8      	move.l d0,232(sp)
    2ac4:	2f7c 0000 7f54 	move.l #32596,228(sp)
    2aca:	00e4 
    2acc:	703c           	moveq #60,d0
    2ace:	2f40 00e0      	move.l d0,224(sp)
    2ad2:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2ad8:	2c40           	movea.l d0,a6
    2ada:	222f 00e8      	move.l 232(sp),d1
    2ade:	242f 00e4      	move.l 228(sp),d2
    2ae2:	262f 00e0      	move.l 224(sp),d3
    2ae6:	4eae ffd0      	jsr -48(a6)
    2aea:	2f40 00dc      	move.l d0,220(sp)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2aee:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    2af4:	4878 0002      	pea 2 <_start+0x2>
    2af8:	4879 0000 a65c 	pea a65c <ClColor>
    2afe:	4878 001e      	pea 1e <_start+0x1e>
    2b02:	2f00           	move.l d0,-(sp)
    2b04:	4eba fd12      	jsr 2818 <TestCopperlistBatch>(pc)
    2b08:	4fef 0010      	lea 16(sp),sp
    2b0c:	4a80           	tst.l d0
    2b0e:	6642           	bne.s 2b52 <TestCopperList+0x2de>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2b10:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2b16:	2c40           	movea.l d0,a6
    2b18:	4eae ffc4      	jsr -60(a6)
    2b1c:	2f40 00d8      	move.l d0,216(sp)
    2b20:	202f 00d8      	move.l 216(sp),d0
    2b24:	2f40 00d4      	move.l d0,212(sp)
    2b28:	2f7c 0000 76cd 	move.l #30413,208(sp)
    2b2e:	00d0 
    2b30:	7021           	moveq #33,d0
    2b32:	2f40 00cc      	move.l d0,204(sp)
    2b36:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2b3c:	2c40           	movea.l d0,a6
    2b3e:	222f 00d4      	move.l 212(sp),d1
    2b42:	242f 00d0      	move.l 208(sp),d2
    2b46:	262f 00cc      	move.l 204(sp),d3
    2b4a:	4eae ffd0      	jsr -48(a6)
    2b4e:	2f40 00c8      	move.l d0,200(sp)

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2b52:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    2b58:	4878 fffe      	pea fffffffe <_end+0xffb2d336>
    2b5c:	4878 0020      	pea 20 <_start+0x20>
    2b60:	2f00           	move.l d0,-(sp)
    2b62:	4eba fcf2      	jsr 2856 <TestCopperlistPos>(pc)
    2b66:	4fef 000c      	lea 12(sp),sp
    2b6a:	4a80           	tst.l d0
    2b6c:	6642           	bne.s 2bb0 <TestCopperList+0x33c>
    Write(Output(), "Copperlist End not correctly set.\n", 34);
    2b6e:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2b74:	2c40           	movea.l d0,a6
    2b76:	4eae ffc4      	jsr -60(a6)
    2b7a:	2f40 00c4      	move.l d0,196(sp)
    2b7e:	202f 00c4      	move.l 196(sp),d0
    2b82:	2f40 00c0      	move.l d0,192(sp)
    2b86:	2f7c 0000 76ef 	move.l #30447,188(sp)
    2b8c:	00bc 
    2b8e:	7022           	moveq #34,d0
    2b90:	2f40 00b8      	move.l d0,184(sp)
    2b94:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2b9a:	2c40           	movea.l d0,a6
    2b9c:	222f 00c0      	move.l 192(sp),d1
    2ba0:	242f 00bc      	move.l 188(sp),d2
    2ba4:	262f 00b8      	move.l 184(sp),d3
    2ba8:	4eae ffd0      	jsr -48(a6)
    2bac:	2f40 00b4      	move.l d0,180(sp)
  
  SwapCl();
    2bb0:	4eba d5ee      	jsr 1a0 <SwapCl>(pc)
  
  if( DrawCopper != Copperlist2)
    2bb4:	2239 004d 2c68 	move.l 4d2c68 <DrawCopper>,d1
    2bba:	2039 004d 2c5c 	move.l 4d2c5c <Copperlist2>,d0
    2bc0:	b081           	cmp.l d1,d0
    2bc2:	6742           	beq.s 2c06 <TestCopperList+0x392>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
    2bc4:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2bca:	2c40           	movea.l d0,a6
    2bcc:	4eae ffc4      	jsr -60(a6)
    2bd0:	2f40 00b0      	move.l d0,176(sp)
    2bd4:	202f 00b0      	move.l 176(sp),d0
    2bd8:	2f40 00ac      	move.l d0,172(sp)
    2bdc:	2f7c 0000 7f91 	move.l #32657,168(sp)
    2be2:	00a8 
    2be4:	7015           	moveq #21,d0
    2be6:	2f40 00a4      	move.l d0,164(sp)
    2bea:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2bf0:	2c40           	movea.l d0,a6
    2bf2:	222f 00ac      	move.l 172(sp),d1
    2bf6:	242f 00a8      	move.l 168(sp),d2
    2bfa:	262f 00a4      	move.l 164(sp),d3
    2bfe:	4eae ffd0      	jsr -48(a6)
    2c02:	2f40 00a0      	move.l d0,160(sp)

  
  PrepareDisplay();
    2c06:	4eba fa98      	jsr 26a0 <PrepareDisplay>(pc)
  if( DrawBuffer != Bitplane2) 
    2c0a:	2239 004d 2c60 	move.l 4d2c60 <DrawBuffer>,d1
    2c10:	2039 004d 2c54 	move.l 4d2c54 <Bitplane2>,d0
    2c16:	b081           	cmp.l d1,d0
    2c18:	6742           	beq.s 2c5c <TestCopperList+0x3e8>
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
    2c1a:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2c20:	2c40           	movea.l d0,a6
    2c22:	4eae ffc4      	jsr -60(a6)
    2c26:	2f40 009c      	move.l d0,156(sp)
    2c2a:	202f 009c      	move.l 156(sp),d0
    2c2e:	2f40 0098      	move.l d0,152(sp)
    2c32:	2f7c 0000 7fa7 	move.l #32679,148(sp)
    2c38:	0094 
    2c3a:	7037           	moveq #55,d0
    2c3c:	2f40 0090      	move.l d0,144(sp)
    2c40:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2c46:	2c40           	movea.l d0,a6
    2c48:	222f 0098      	move.l 152(sp),d1
    2c4c:	242f 0094      	move.l 148(sp),d2
    2c50:	262f 0090      	move.l 144(sp),d3
    2c54:	4eae ffd0      	jsr -48(a6)
    2c58:	2f40 008c      	move.l d0,140(sp)
                                                                            55);
  if( DrawCopper != Copperlist2) 
    2c5c:	2239 004d 2c68 	move.l 4d2c68 <DrawCopper>,d1
    2c62:	2039 004d 2c5c 	move.l 4d2c5c <Copperlist2>,d0
    2c68:	b081           	cmp.l d1,d0
    2c6a:	6742           	beq.s 2cae <TestCopperList+0x43a>
    Write( Output(), 
    2c6c:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2c72:	2c40           	movea.l d0,a6
    2c74:	4eae ffc4      	jsr -60(a6)
    2c78:	2f40 0088      	move.l d0,136(sp)
    2c7c:	202f 0088      	move.l 136(sp),d0
    2c80:	2f40 0084      	move.l d0,132(sp)
    2c84:	2f7c 0000 7fdf 	move.l #32735,128(sp)
    2c8a:	0080 
    2c8c:	7039           	moveq #57,d0
    2c8e:	2f40 007c      	move.l d0,124(sp)
    2c92:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2c98:	2c40           	movea.l d0,a6
    2c9a:	222f 0084      	move.l 132(sp),d1
    2c9e:	242f 0080      	move.l 128(sp),d2
    2ca2:	262f 007c      	move.l 124(sp),d3
    2ca6:	4eae ffd0      	jsr -48(a6)
    2caa:	2f40 0078      	move.l d0,120(sp)
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
    2cae:	2239 004d 2c64 	move.l 4d2c64 <ViewBuffer>,d1
    2cb4:	2039 004d 2c50 	move.l 4d2c50 <Bitplane1>,d0
    2cba:	b081           	cmp.l d1,d0
    2cbc:	6742           	beq.s 2d00 <TestCopperList+0x48c>
    Write( Output(), 
    2cbe:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2cc4:	2c40           	movea.l d0,a6
    2cc6:	4eae ffc4      	jsr -60(a6)
    2cca:	2f40 0074      	move.l d0,116(sp)
    2cce:	202f 0074      	move.l 116(sp),d0
    2cd2:	2f40 0070      	move.l d0,112(sp)
    2cd6:	2f7c 0000 8019 	move.l #32793,108(sp)
    2cdc:	006c 
    2cde:	7038           	moveq #56,d0
    2ce0:	2f40 0068      	move.l d0,104(sp)
    2ce4:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2cea:	2c40           	movea.l d0,a6
    2cec:	222f 0070      	move.l 112(sp),d1
    2cf0:	242f 006c      	move.l 108(sp),d2
    2cf4:	262f 0068      	move.l 104(sp),d3
    2cf8:	4eae ffd0      	jsr -48(a6)
    2cfc:	2f40 0064      	move.l d0,100(sp)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
    2d00:	2239 004d 2c6c 	move.l 4d2c6c <ViewCopper>,d1
    2d06:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    2d0c:	b081           	cmp.l d1,d0
    2d0e:	6742           	beq.s 2d52 <TestCopperList+0x4de>
    Write( Output(), 
    2d10:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2d16:	2c40           	movea.l d0,a6
    2d18:	4eae ffc4      	jsr -60(a6)
    2d1c:	2f40 0060      	move.l d0,96(sp)
    2d20:	202f 0060      	move.l 96(sp),d0
    2d24:	2f40 005c      	move.l d0,92(sp)
    2d28:	2f7c 0000 8052 	move.l #32850,88(sp)
    2d2e:	0058 
    2d30:	703a           	moveq #58,d0
    2d32:	2f40 0054      	move.l d0,84(sp)
    2d36:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2d3c:	2c40           	movea.l d0,a6
    2d3e:	222f 005c      	move.l 92(sp),d1
    2d42:	242f 0058      	move.l 88(sp),d2
    2d46:	262f 0054      	move.l 84(sp),d3
    2d4a:	4eae ffd0      	jsr -48(a6)
    2d4e:	2f40 0050      	move.l d0,80(sp)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
    2d52:	4eba d3ee      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2d56:	4eba d448      	jsr 1a0 <SwapCl>(pc)
  UWORD *copword = ViewCopper;
    2d5a:	2f79 004d 2c6c 	move.l 4d2c6c <ViewCopper>,76(sp)
    2d60:	004c 
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2d62:	307c 0076      	movea.w #118,a0
    2d66:	d1ef 004c      	adda.l 76(sp),a0
    2d6a:	3010           	move.w (a0),d0
    2d6c:	7200           	moveq #0,d1
    2d6e:	3200           	move.w d0,d1
    2d70:	307c 0072      	movea.w #114,a0
    2d74:	d1ef 004c      	adda.l 76(sp),a0
    2d78:	3010           	move.w (a0),d0
    2d7a:	3000           	move.w d0,d0
    2d7c:	0280 0000 ffff 	andi.l #65535,d0
    2d82:	4840           	swap d0
    2d84:	4240           	clr.w d0
    2d86:	d081           	add.l d1,d0
    2d88:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2d8c:	2039 004d 2c54 	move.l 4d2c54 <Bitplane2>,d0
    2d92:	b0af 0048      	cmp.l 72(sp),d0
    2d96:	6742           	beq.s 2dda <TestCopperList+0x566>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2d98:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2d9e:	2c40           	movea.l d0,a6
    2da0:	4eae ffc4      	jsr -60(a6)
    2da4:	2f40 0044      	move.l d0,68(sp)
    2da8:	202f 0044      	move.l 68(sp),d0
    2dac:	2f40 0040      	move.l d0,64(sp)
    2db0:	2f7c 0000 808d 	move.l #32909,60(sp)
    2db6:	003c 
    2db8:	7048           	moveq #72,d0
    2dba:	2f40 0038      	move.l d0,56(sp)
    2dbe:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2dc4:	2c40           	movea.l d0,a6
    2dc6:	222f 0040      	move.l 64(sp),d1
    2dca:	242f 003c      	move.l 60(sp),d2
    2dce:	262f 0038      	move.l 56(sp),d3
    2dd2:	4eae ffd0      	jsr -48(a6)
    2dd6:	2f40 0034      	move.l d0,52(sp)
                                                   " after first frame.\n", 72);
  SetBplPointers();
    2dda:	4eba d366      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2dde:	4eba d3c0      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2de2:	2f79 004d 2c6c 	move.l 4d2c6c <ViewCopper>,76(sp)
    2de8:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2dea:	307c 0076      	movea.w #118,a0
    2dee:	d1ef 004c      	adda.l 76(sp),a0
    2df2:	3010           	move.w (a0),d0
    2df4:	7200           	moveq #0,d1
    2df6:	3200           	move.w d0,d1
    2df8:	307c 0072      	movea.w #114,a0
    2dfc:	d1ef 004c      	adda.l 76(sp),a0
    2e00:	3010           	move.w (a0),d0
    2e02:	3000           	move.w d0,d0
    2e04:	0280 0000 ffff 	andi.l #65535,d0
    2e0a:	4840           	swap d0
    2e0c:	4240           	clr.w d0
    2e0e:	d081           	add.l d1,d0
    2e10:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane1) 
    2e14:	2039 004d 2c50 	move.l 4d2c50 <Bitplane1>,d0
    2e1a:	b0af 0048      	cmp.l 72(sp),d0
    2e1e:	6742           	beq.s 2e62 <TestCopperList+0x5ee>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
    2e20:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2e26:	2c40           	movea.l d0,a6
    2e28:	4eae ffc4      	jsr -60(a6)
    2e2c:	2f40 0030      	move.l d0,48(sp)
    2e30:	202f 0030      	move.l 48(sp),d0
    2e34:	2f40 002c      	move.l d0,44(sp)
    2e38:	2f7c 0000 80d6 	move.l #32982,40(sp)
    2e3e:	0028 
    2e40:	7049           	moveq #73,d0
    2e42:	2f40 0024      	move.l d0,36(sp)
    2e46:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2e4c:	2c40           	movea.l d0,a6
    2e4e:	222f 002c      	move.l 44(sp),d1
    2e52:	242f 0028      	move.l 40(sp),d2
    2e56:	262f 0024      	move.l 36(sp),d3
    2e5a:	4eae ffd0      	jsr -48(a6)
    2e5e:	2f40 0020      	move.l d0,32(sp)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
    2e62:	4eba d2de      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2e66:	4eba d338      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2e6a:	2f79 004d 2c6c 	move.l 4d2c6c <ViewCopper>,76(sp)
    2e70:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2e72:	307c 0076      	movea.w #118,a0
    2e76:	d1ef 004c      	adda.l 76(sp),a0
    2e7a:	3010           	move.w (a0),d0
    2e7c:	7200           	moveq #0,d1
    2e7e:	3200           	move.w d0,d1
    2e80:	307c 0072      	movea.w #114,a0
    2e84:	d1ef 004c      	adda.l 76(sp),a0
    2e88:	3010           	move.w (a0),d0
    2e8a:	3000           	move.w d0,d0
    2e8c:	0280 0000 ffff 	andi.l #65535,d0
    2e92:	4840           	swap d0
    2e94:	4240           	clr.w d0
    2e96:	d081           	add.l d1,d0
    2e98:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2e9c:	2039 004d 2c54 	move.l 4d2c54 <Bitplane2>,d0
    2ea2:	b0af 0048      	cmp.l 72(sp),d0
    2ea6:	6742           	beq.s 2eea <TestCopperList+0x676>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2ea8:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2eae:	2c40           	movea.l d0,a6
    2eb0:	4eae ffc4      	jsr -60(a6)
    2eb4:	2f40 001c      	move.l d0,28(sp)
    2eb8:	202f 001c      	move.l 28(sp),d0
    2ebc:	2f40 0018      	move.l d0,24(sp)
    2ec0:	2f7c 0000 8120 	move.l #33056,20(sp)
    2ec6:	0014 
    2ec8:	7048           	moveq #72,d0
    2eca:	2f40 0010      	move.l d0,16(sp)
    2ece:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2ed4:	2c40           	movea.l d0,a6
    2ed6:	222f 0018      	move.l 24(sp),d1
    2eda:	242f 0014      	move.l 20(sp),d2
    2ede:	262f 0010      	move.l 16(sp),d3
    2ee2:	4eae ffd0      	jsr -48(a6)
    2ee6:	2f40 000c      	move.l d0,12(sp)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
    2eea:	2f3c 0000 c800 	move.l #51200,-(sp)
    2ef0:	4878 0084      	pea 84 <_start+0x84>
    2ef4:	4eba d1ea      	jsr e0 <FreeDisplay>(pc)
    2ef8:	508f           	addq.l #8,sp
    2efa:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2efe:	4fef 0148      	lea 328(sp),sp
    2f02:	4e75           	rts

00002f04 <RunTests>:
#include "runtests.h"
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    2f04:	4eba f96e      	jsr 2874 <TestCopperList>(pc)
    ZoomTest();
    2f08:	4eba 0004      	jsr 2f0e <ZoomTest>(pc)
    //SwScrollerTest();
    2f0c:	4e75           	rts

00002f0e <ZoomTest>:
#include "zoomtest2.h"

ULONG Cl102ZoomTest[137];

void ZoomTest() {
  TestZoomSpeed();
    2f0e:	4eba 0046      	jsr 2f56 <TestZoomSpeed>(pc)
  ZoomTestDisplay();
    2f12:	4eba 00e2      	jsr 2ff6 <ZoomTestDisplay>(pc)
  TestBlitleftOfZoom();
    2f16:	4eba 05a8      	jsr 34c0 <TestBlitleftOfZoom>(pc)
  TestCopyWord();
    2f1a:	4eba 0838      	jsr 3754 <TestCopyWord>(pc)
  TestZoom4Picture();
    2f1e:	4eba 0e12      	jsr 3d32 <TestZoom4Picture>(pc)
  TestZoom4PictureOn5Planes();
    2f22:	4eba 0b22      	jsr 3a46 <TestZoom4PictureOn5Planes>(pc)
  Test_Zoom2();
    2f26:	4eba f012      	jsr 1f3a <Test_Zoom2>(pc)
  c2p1x1_8_c5_gen_init( 320, 256, 0, 0, 0, 0);
    2f2a:	42a7           	clr.l -(sp)
    2f2c:	42a7           	clr.l -(sp)
    2f2e:	42a7           	clr.l -(sp)
    2f30:	42a7           	clr.l -(sp)
    2f32:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2f36:	4878 0140      	pea 140 <FreeDisplay+0x60>
    2f3a:	4eb9 0000 7268 	jsr 7268 <c2p1x1_8_c5_gen_init>
    2f40:	4fef 0018      	lea 24(sp),sp
  c2p1x1_8_c5_gen( 0x100, 0x200);
    2f44:	4878 0200      	pea 200 <Utils_CopyMem+0x22>
    2f48:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2f4c:	4eb9 0000 72e4 	jsr 72e4 <c2p1x1_8_c5_gen>
    2f52:	508f           	addq.l #8,sp
}
    2f54:	4e75           	rts

00002f56 <TestZoomSpeed>:

int Counter4Frames;

void TestZoomSpeed() {
    2f56:	4fef ffe8      	lea -24(sp),sp
    2f5a:	48e7 3002      	movem.l d2-d3/a6,-(sp)

 	TakeSystem();
    2f5e:	4eba d61a      	jsr 57a <TakeSystem>(pc)
	WaitVbl();
    2f62:	4eba d5cc      	jsr 530 <WaitVbl>(pc)
  //             fedcba9876543210
  //hw->dmacon = 0x8def;

  hw->dmacon = DMAF_SETCLR | DMAF_AUDIO | DMAF_BLITTER | DMAF_RASTER 
    2f66:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    2f6c:	317c 87cf 0096 	move.w #-30769,150(a0)
                                    | DMAF_COPPER | DMAF_MASTER | DMAF_BLITHOG;
   //0b1000011111100000;
  
  //hw->dmacon = 0b1000011111111111;
	hw->intena = (1 << INTB_SETCLR) | (1 << INTB_INTEN) | (1 << INTB_VERTB);
    2f72:	2079 004d 2c70 	movea.l 4d2c70 <hw>,a0
    2f78:	317c c020 009a 	move.w #-16352,154(a0)
  
  Zoom_InitRun(); 
    2f7e:	4eba e14e      	jsr 10ce <Zoom_InitRun>(pc)

  int success = 1;
    2f82:	7001           	moveq #1,d0
    2f84:	2f40 0020      	move.l d0,32(sp)
  RunFrame();
    2f88:	4eba d372      	jsr 2fc <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    2f8c:	3039 004d 2cb0 	move.w 4d2cb0 <Zoom_Counter>,d0
    2f92:	0c40 0008      	cmpi.w #8,d0
    2f96:	6304           	bls.s 2f9c <TestZoomSpeed+0x46>
    2f98:	42af 0020      	clr.l 32(sp)
    
  Zoom_Dealloc();
    2f9c:	4eba e3c8      	jsr 1366 <Zoom_Dealloc>(pc)
  FreeSystem();
    2fa0:	4eba d5ee      	jsr 590 <FreeSystem>(pc)

  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    2fa4:	4aaf 0020      	tst.l 32(sp)
    2fa8:	6642           	bne.s 2fec <TestZoomSpeed+0x96>
    2faa:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2fb0:	2c40           	movea.l d0,a6
    2fb2:	4eae ffc4      	jsr -60(a6)
    2fb6:	2f40 001c      	move.l d0,28(sp)
    2fba:	202f 001c      	move.l 28(sp),d0
    2fbe:	2f40 0018      	move.l d0,24(sp)
    2fc2:	2f7c 0000 8169 	move.l #33129,20(sp)
    2fc8:	0014 
    2fca:	701c           	moveq #28,d0
    2fcc:	2f40 0010      	move.l d0,16(sp)
    2fd0:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    2fd6:	2c40           	movea.l d0,a6
    2fd8:	222f 0018      	move.l 24(sp),d1
    2fdc:	242f 0014      	move.l 20(sp),d2
    2fe0:	262f 0010      	move.l 16(sp),d3
    2fe4:	4eae ffd0      	jsr -48(a6)
    2fe8:	2f40 000c      	move.l d0,12(sp)

  //AddIntServer(INTB_VERTB, vbint);
  //RemIntServer(INTB_VERTB, vbint);
  
}
    2fec:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2ff0:	4fef 0018      	lea 24(sp),sp
    2ff4:	4e75           	rts

00002ff6 <ZoomTestDisplay>:

void ZoomTestDisplay() {
    2ff6:	4fef ff38      	lea -200(sp),sp
    2ffa:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Zoom_Init();
    2ffe:	4eba e476      	jsr 1476 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    3002:	4eba e80c      	jsr 1810 <PrepareDisplayZoom>(pc)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    3006:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    300c:	4878 0010      	pea 10 <_start+0x10>
    3010:	4879 0000 a6dc 	pea a6dc <ClsSprites>
    3016:	42a7           	clr.l -(sp)
    3018:	2f00           	move.l d0,-(sp)
    301a:	4eba f7fc      	jsr 2818 <TestCopperlistBatch>(pc)
    301e:	4fef 0010      	lea 16(sp),sp
    3022:	4a80           	tst.l d0
    3024:	6642           	bne.s 3068 <ZoomTestDisplay+0x72>
    Write( Output(), 
    3026:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    302c:	2c40           	movea.l d0,a6
    302e:	4eae ffc4      	jsr -60(a6)
    3032:	2f40 00d0      	move.l d0,208(sp)
    3036:	202f 00d0      	move.l 208(sp),d0
    303a:	2f40 00cc      	move.l d0,204(sp)
    303e:	2f7c 0000 8188 	move.l #33160,200(sp)
    3044:	00c8 
    3046:	7045           	moveq #69,d0
    3048:	2f40 00c4      	move.l d0,196(sp)
    304c:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3052:	2c40           	movea.l d0,a6
    3054:	222f 00cc      	move.l 204(sp),d1
    3058:	242f 00c8      	move.l 200(sp),d2
    305c:	262f 00c4      	move.l 196(sp),d3
    3060:	4eae ffd0      	jsr -48(a6)
    3064:	2f40 00c0      	move.l d0,192(sp)
       "ZoomCopperlist: Sprite section of copper starting on pos 0 messed up\n", 
                                                                            69);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    3068:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    306e:	4878 000c      	pea c <_start+0xc>
    3072:	4879 0000 a71c 	pea a71c <ClScreen>
    3078:	4878 0010      	pea 10 <_start+0x10>
    307c:	2f00           	move.l d0,-(sp)
    307e:	4eba f798      	jsr 2818 <TestCopperlistBatch>(pc)
    3082:	4fef 0010      	lea 16(sp),sp
    3086:	4a80           	tst.l d0
    3088:	6642           	bne.s 30cc <ZoomTestDisplay+0xd6>
    Write( Output(), 
    308a:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3090:	2c40           	movea.l d0,a6
    3092:	4eae ffc4      	jsr -60(a6)
    3096:	2f40 00bc      	move.l d0,188(sp)
    309a:	202f 00bc      	move.l 188(sp),d0
    309e:	2f40 00b8      	move.l d0,184(sp)
    30a2:	2f7c 0000 81ce 	move.l #33230,180(sp)
    30a8:	00b4 
    30aa:	7046           	moveq #70,d0
    30ac:	2f40 00b0      	move.l d0,176(sp)
    30b0:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    30b6:	2c40           	movea.l d0,a6
    30b8:	222f 00b8      	move.l 184(sp),d1
    30bc:	242f 00b4      	move.l 180(sp),d2
    30c0:	262f 00b0      	move.l 176(sp),d3
    30c4:	4eae ffd0      	jsr -48(a6)
    30c8:	2f40 00ac      	move.l d0,172(sp)
      "ZoomCopperlist: Screen section of copper starting on pos 16 messed up\n",
                                                                            70);
  DrawBuffer = (ULONG *) 0x40000;
    30cc:	23fc 0004 0000 	move.l #262144,4d2c60 <DrawBuffer>
    30d2:	004d 2c60 
  ViewBuffer = (ULONG *) 0x50000;
    30d6:	23fc 0005 0000 	move.l #327680,4d2c64 <ViewBuffer>
    30dc:	004d 2c64 
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    30e0:	2239 004d 2c68 	move.l 4d2c68 <DrawCopper>,d1
    30e6:	2039 004d 2c60 	move.l 4d2c60 <DrawBuffer>,d0
    30ec:	2f01           	move.l d1,-(sp)
    30ee:	2f00           	move.l d0,-(sp)
    30f0:	4eba ed78      	jsr 1e6a <Zoom_SetBplPointers>(pc)
    30f4:	508f           	addq.l #8,sp
  Zoom_SwapBuffers( 0);
    30f6:	42a7           	clr.l -(sp)
    30f8:	4eba ee08      	jsr 1f02 <Zoom_SwapBuffers>(pc)
    30fc:	588f           	addq.l #4,sp
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    30fe:	2039 004d 2c60 	move.l 4d2c60 <DrawBuffer>,d0
    3104:	0c80 0005 0000 	cmpi.l #327680,d0
    310a:	660e           	bne.s 311a <ZoomTestDisplay+0x124>
    310c:	2039 004d 2c64 	move.l 4d2c64 <ViewBuffer>,d0
    3112:	0c80 0004 0000 	cmpi.l #262144,d0
    3118:	6742           	beq.s 315c <ZoomTestDisplay+0x166>
    Write( Output(), 
    311a:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3120:	2c40           	movea.l d0,a6
    3122:	4eae ffc4      	jsr -60(a6)
    3126:	2f40 00a8      	move.l d0,168(sp)
    312a:	202f 00a8      	move.l 168(sp),d0
    312e:	2f40 00a4      	move.l d0,164(sp)
    3132:	2f7c 0000 8215 	move.l #33301,160(sp)
    3138:	00a0 
    313a:	703b           	moveq #59,d0
    313c:	2f40 009c      	move.l d0,156(sp)
    3140:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3146:	2c40           	movea.l d0,a6
    3148:	222f 00a4      	move.l 164(sp),d1
    314c:	242f 00a0      	move.l 160(sp),d2
    3150:	262f 009c      	move.l 156(sp),d3
    3154:	4eae ffd0      	jsr -48(a6)
    3158:	2f40 0098      	move.l d0,152(sp)
            "ZoomCopperlist: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    315c:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    3162:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    3168:	4878 001c      	pea 1c <_start+0x1c>
    316c:	2f00           	move.l d0,-(sp)
    316e:	4eba f6e6      	jsr 2856 <TestCopperlistPos>(pc)
    3172:	4fef 000c      	lea 12(sp),sp
    3176:	4a80           	tst.l d0
    3178:	6642           	bne.s 31bc <ZoomTestDisplay+0x1c6>
    Write(Output(), 
    317a:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3180:	2c40           	movea.l d0,a6
    3182:	4eae ffc4      	jsr -60(a6)
    3186:	2f40 0094      	move.l d0,148(sp)
    318a:	202f 0094      	move.l 148(sp),d0
    318e:	2f40 0090      	move.l d0,144(sp)
    3192:	2f7c 0000 8251 	move.l #33361,140(sp)
    3198:	008c 
    319a:	703c           	moveq #60,d0
    319c:	2f40 0088      	move.l d0,136(sp)
    31a0:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    31a6:	2c40           	movea.l d0,a6
    31a8:	222f 0090      	move.l 144(sp),d1
    31ac:	242f 008c      	move.l 140(sp),d2
    31b0:	262f 0088      	move.l 136(sp),d3
    31b4:	4eae ffd0      	jsr -48(a6)
    31b8:	2f40 0084      	move.l d0,132(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    31bc:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    31c2:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    31c8:	4878 001d      	pea 1d <_start+0x1d>
    31cc:	2f00           	move.l d0,-(sp)
    31ce:	4eba f686      	jsr 2856 <TestCopperlistPos>(pc)
    31d2:	4fef 000c      	lea 12(sp),sp
    31d6:	4a80           	tst.l d0
    31d8:	6642           	bne.s 321c <ZoomTestDisplay+0x226>
    Write(Output(), 
    31da:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    31e0:	2c40           	movea.l d0,a6
    31e2:	4eae ffc4      	jsr -60(a6)
    31e6:	2f40 0080      	move.l d0,128(sp)
    31ea:	202f 0080      	move.l 128(sp),d0
    31ee:	2f40 007c      	move.l d0,124(sp)
    31f2:	2f7c 0000 828e 	move.l #33422,120(sp)
    31f8:	0078 
    31fa:	703c           	moveq #60,d0
    31fc:	2f40 0074      	move.l d0,116(sp)
    3200:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3206:	2c40           	movea.l d0,a6
    3208:	222f 007c      	move.l 124(sp),d1
    320c:	242f 0078      	move.l 120(sp),d2
    3210:	262f 0074      	move.l 116(sp),d3
    3214:	4eae ffd0      	jsr -48(a6)
    3218:	2f40 0070      	move.l d0,112(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1pl should be 00f4\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    321c:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    3222:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    3228:	4878 001e      	pea 1e <_start+0x1e>
    322c:	2f00           	move.l d0,-(sp)
    322e:	4eba f626      	jsr 2856 <TestCopperlistPos>(pc)
    3232:	4fef 000c      	lea 12(sp),sp
    3236:	4a80           	tst.l d0
    3238:	6642           	bne.s 327c <ZoomTestDisplay+0x286>
    Write(Output(), 
    323a:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3240:	2c40           	movea.l d0,a6
    3242:	4eae ffc4      	jsr -60(a6)
    3246:	2f40 006c      	move.l d0,108(sp)
    324a:	202f 006c      	move.l 108(sp),d0
    324e:	2f40 0068      	move.l d0,104(sp)
    3252:	2f7c 0000 82cb 	move.l #33483,100(sp)
    3258:	0064 
    325a:	703c           	moveq #60,d0
    325c:	2f40 0060      	move.l d0,96(sp)
    3260:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3266:	2c40           	movea.l d0,a6
    3268:	222f 0068      	move.l 104(sp),d1
    326c:	242f 0064      	move.l 100(sp),d2
    3270:	262f 0060      	move.l 96(sp),d3
    3274:	4eae ffd0      	jsr -48(a6)
    3278:	2f40 005c      	move.l d0,92(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    327c:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    3282:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    3288:	4878 001f      	pea 1f <_start+0x1f>
    328c:	2f00           	move.l d0,-(sp)
    328e:	4eba f5c6      	jsr 2856 <TestCopperlistPos>(pc)
    3292:	4fef 000c      	lea 12(sp),sp
    3296:	4a80           	tst.l d0
    3298:	6642           	bne.s 32dc <ZoomTestDisplay+0x2e6>
    Write(Output(), 
    329a:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    32a0:	2c40           	movea.l d0,a6
    32a2:	4eae ffc4      	jsr -60(a6)
    32a6:	2f40 0058      	move.l d0,88(sp)
    32aa:	202f 0058      	move.l 88(sp),d0
    32ae:	2f40 0054      	move.l d0,84(sp)
    32b2:	2f7c 0000 8308 	move.l #33544,80(sp)
    32b8:	0050 
    32ba:	703c           	moveq #60,d0
    32bc:	2f40 004c      	move.l d0,76(sp)
    32c0:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    32c6:	2c40           	movea.l d0,a6
    32c8:	222f 0054      	move.l 84(sp),d1
    32cc:	242f 0050      	move.l 80(sp),d2
    32d0:	262f 004c      	move.l 76(sp),d3
    32d4:	4eae ffd0      	jsr -48(a6)
    32d8:	2f40 0048      	move.l d0,72(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2pl should be 0034\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    32dc:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    32e2:	4878 0020      	pea 20 <_start+0x20>
    32e6:	4879 0000 a65c 	pea a65c <ClColor>
    32ec:	4878 0026      	pea 26 <_start+0x26>
    32f0:	2f00           	move.l d0,-(sp)
    32f2:	4eba f524      	jsr 2818 <TestCopperlistBatch>(pc)
    32f6:	4fef 0010      	lea 16(sp),sp
    32fa:	4a80           	tst.l d0
    32fc:	6642           	bne.s 3340 <ZoomTestDisplay+0x34a>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    32fe:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3304:	2c40           	movea.l d0,a6
    3306:	4eae ffc4      	jsr -60(a6)
    330a:	2f40 0044      	move.l d0,68(sp)
    330e:	202f 0044      	move.l 68(sp),d0
    3312:	2f40 0040      	move.l d0,64(sp)
    3316:	2f7c 0000 8345 	move.l #33605,60(sp)
    331c:	003c 
    331e:	7025           	moveq #37,d0
    3320:	2f40 0038      	move.l d0,56(sp)
    3324:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    332a:	2c40           	movea.l d0,a6
    332c:	222f 0040      	move.l 64(sp),d1
    3330:	242f 003c      	move.l 60(sp),d2
    3334:	262f 0038      	move.l 56(sp),d3
    3338:	4eae ffd0      	jsr -48(a6)
    333c:	2f40 0034      	move.l d0,52(sp)

  /*if(  TestCopperlistBatch(  Copperlist1, 71, Cl102ZoomRepeat, 21) == 0)
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36); */
  
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    3340:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    3346:	2f00           	move.l d0,-(sp)
    3348:	4878 000f      	pea f <_start+0xf>
    334c:	4eba d0be      	jsr 40c <Zoom_Shrink102>(pc)
    3350:	508f           	addq.l #8,sp
  if( TestCopperListZoom102( Copperlist1, 73, Cl102ZoomTest) == 0)
    3352:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    3358:	4879 0000 b8f8 	pea b8f8 <Cl102ZoomTest>
    335e:	4878 0049      	pea 49 <_start+0x49>
    3362:	2f00           	move.l d0,-(sp)
    3364:	4eba 00c4      	jsr 342a <TestCopperListZoom102>(pc)
    3368:	4fef 000c      	lea 12(sp),sp
    336c:	4a80           	tst.l d0
    336e:	6642           	bne.s 33b2 <ZoomTestDisplay+0x3bc>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    3370:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3376:	2c40           	movea.l d0,a6
    3378:	4eae ffc4      	jsr -60(a6)
    337c:	2f40 0030      	move.l d0,48(sp)
    3380:	202f 0030      	move.l 48(sp),d0
    3384:	2f40 002c      	move.l d0,44(sp)
    3388:	2f7c 0000 836b 	move.l #33643,40(sp)
    338e:	0028 
    3390:	7025           	moveq #37,d0
    3392:	2f40 0024      	move.l d0,36(sp)
    3396:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    339c:	2c40           	movea.l d0,a6
    339e:	222f 002c      	move.l 44(sp),d1
    33a2:	242f 0028      	move.l 40(sp),d2
    33a6:	262f 0024      	move.l 36(sp),d3
    33aa:	4eae ffd0      	jsr -48(a6)
    33ae:	2f40 0020      	move.l d0,32(sp)

  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    33b2:	2039 004d 2c58 	move.l 4d2c58 <Copperlist1>,d0
    33b8:	4878 fffe      	pea fffffffe <_end+0xffb2d336>
    33bc:	4878 00bb      	pea bb <WaitBlt+0x7>
    33c0:	2f00           	move.l d0,-(sp)
    33c2:	4eba f492      	jsr 2856 <TestCopperlistPos>(pc)
    33c6:	4fef 000c      	lea 12(sp),sp
    33ca:	4a80           	tst.l d0
    33cc:	6642           	bne.s 3410 <ZoomTestDisplay+0x41a>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    33ce:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    33d4:	2c40           	movea.l d0,a6
    33d6:	4eae ffc4      	jsr -60(a6)
    33da:	2f40 001c      	move.l d0,28(sp)
    33de:	202f 001c      	move.l 28(sp),d0
    33e2:	2f40 0018      	move.l d0,24(sp)
    33e6:	2f7c 0000 8390 	move.l #33680,20(sp)
    33ec:	0014 
    33ee:	7032           	moveq #50,d0
    33f0:	2f40 0010      	move.l d0,16(sp)
    33f4:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    33fa:	2c40           	movea.l d0,a6
    33fc:	222f 0018      	move.l 24(sp),d1
    3400:	242f 0014      	move.l 20(sp),d2
    3404:	262f 0010      	move.l 16(sp),d3
    3408:	4eae ffd0      	jsr -48(a6)
    340c:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    3410:	2f3c 0000 df20 	move.l #57120,-(sp)
    3416:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    341a:	4eba ccc4      	jsr e0 <FreeDisplay>(pc)
    341e:	508f           	addq.l #8,sp

}
    3420:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3424:	4fef 00c8      	lea 200(sp),sp
    3428:	4e75           	rts

0000342a <TestCopperListZoom102>:

int TestCopperListZoom102( ULONG *cl2test, UWORD position, 
                                                           ULONG *template4cl) {
    342a:	598f           	subq.l #4,sp
    342c:	202f 000c      	move.l 12(sp),d0
    3430:	3000           	move.w d0,d0
    3432:	3f40 0002      	move.w d0,2(sp)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    3436:	7000           	moveq #0,d0
    3438:	302f 0002      	move.w 2(sp),d0
    343c:	4878 001c      	pea 1c <_start+0x1c>
    3440:	2f2f 0014      	move.l 20(sp),-(sp)
    3444:	2f00           	move.l d0,-(sp)
    3446:	2f2f 0014      	move.l 20(sp),-(sp)
    344a:	4eba f3cc      	jsr 2818 <TestCopperlistBatch>(pc)
    344e:	4fef 0010      	lea 16(sp),sp
    3452:	4a80           	tst.l d0
    3454:	6604           	bne.s 345a <TestCopperListZoom102+0x30>
    return 0;
    3456:	7000           	moveq #0,d0
    3458:	6062           	bra.s 34bc <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    345a:	7078           	moveq #120,d0
    345c:	d0af 0010      	add.l 16(sp),d0
    3460:	7200           	moveq #0,d1
    3462:	322f 0002      	move.w 2(sp),d1
    3466:	307c 001e      	movea.w #30,a0
    346a:	d1c1           	adda.l d1,a0
    346c:	4878 0036      	pea 36 <_start+0x36>
    3470:	2f00           	move.l d0,-(sp)
    3472:	2f08           	move.l a0,-(sp)
    3474:	2f2f 0014      	move.l 20(sp),-(sp)
    3478:	4eba f39e      	jsr 2818 <TestCopperlistBatch>(pc)
    347c:	4fef 0010      	lea 16(sp),sp
    3480:	4a80           	tst.l d0
    3482:	6604           	bne.s 3488 <TestCopperListZoom102+0x5e>
    return 0;
    3484:	7000           	moveq #0,d0
    3486:	6034           	bra.s 34bc <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    3488:	202f 0010      	move.l 16(sp),d0
    348c:	0680 0000 0158 	addi.l #344,d0
    3492:	7200           	moveq #0,d1
    3494:	322f 0002      	move.w 2(sp),d1
    3498:	307c 0056      	movea.w #86,a0
    349c:	d1c1           	adda.l d1,a0
    349e:	4878 001c      	pea 1c <_start+0x1c>
    34a2:	2f00           	move.l d0,-(sp)
    34a4:	2f08           	move.l a0,-(sp)
    34a6:	2f2f 0014      	move.l 20(sp),-(sp)
    34aa:	4eba f36c      	jsr 2818 <TestCopperlistBatch>(pc)
    34ae:	4fef 0010      	lea 16(sp),sp
    34b2:	4a80           	tst.l d0
    34b4:	6604           	bne.s 34ba <TestCopperListZoom102+0x90>
    return 0;
    34b6:	7000           	moveq #0,d0
    34b8:	6002           	bra.s 34bc <TestCopperListZoom102+0x92>
 
  return 1;
    34ba:	7001           	moveq #1,d0
}
    34bc:	588f           	addq.l #4,sp
    34be:	4e75           	rts

000034c0 <TestBlitleftOfZoom>:

void TestBlitleftOfZoom() {
    34c0:	4fef ff94      	lea -108(sp),sp
    34c4:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Zoom_Init();
    34c8:	4eba dfac      	jsr 1476 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    34cc:	4eba e342      	jsr 1810 <PrepareDisplayZoom>(pc)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    34d0:	2f7c 0000 c800 	move.l #51200,116(sp)
    34d6:	0074 
    34d8:	7002           	moveq #2,d0
    34da:	2f40 0070      	move.l d0,112(sp)
    34de:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    34e4:	2c40           	movea.l d0,a6
    34e6:	202f 0074      	move.l 116(sp),d0
    34ea:	222f 0070      	move.l 112(sp),d1
    34ee:	4eae ff3a      	jsr -198(a6)
    34f2:	2f40 006c      	move.l d0,108(sp)
    34f6:	202f 006c      	move.l 108(sp),d0
    34fa:	23c0 004d 2ca2 	move.l d0,4d2ca2 <Zoom_Source>
  if( Zoom_Source == 0) {
    3500:	2039 004d 2ca2 	move.l 4d2ca2 <Zoom_Source>,d0
    3506:	6646           	bne.s 354e <TestBlitleftOfZoom+0x8e>
    Write(  Output(), 
    3508:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    350e:	2c40           	movea.l d0,a6
    3510:	4eae ffc4      	jsr -60(a6)
    3514:	2f40 001c      	move.l d0,28(sp)
    3518:	202f 001c      	move.l 28(sp),d0
    351c:	2f40 0018      	move.l d0,24(sp)
    3520:	2f7c 0000 83c3 	move.l #33731,20(sp)
    3526:	0014 
    3528:	7236           	moveq #54,d1
    352a:	2f41 0010      	move.l d1,16(sp)
    352e:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3534:	2c40           	movea.l d0,a6
    3536:	222f 0018      	move.l 24(sp),d1
    353a:	242f 0014      	move.l 20(sp),d2
    353e:	262f 0010      	move.l 16(sp),d3
    3542:	4eae ffd0      	jsr -48(a6)
    3546:	2f40 000c      	move.l d0,12(sp)
    354a:	6000 01fe      	bra.w 374a <TestBlitleftOfZoom+0x28a>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  
  UWORD *tstsource = Zoom_Source;
    354e:	2f79 004d 2ca2 	move.l 4d2ca2 <Zoom_Source>,104(sp)
    3554:	0068 
  *tstsource++ = 0x0000;
    3556:	202f 0068      	move.l 104(sp),d0
    355a:	2200           	move.l d0,d1
    355c:	5481           	addq.l #2,d1
    355e:	2f41 0068      	move.l d1,104(sp)
    3562:	2040           	movea.l d0,a0
    3564:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    3566:	206f 0068      	movea.l 104(sp),a0
    356a:	30bc 0080      	move.w #128,(a0)
  tstsource += ZMLINESIZE/2-1;
    356e:	7028           	moveq #40,d0
    3570:	d1af 0068      	add.l d0,104(sp)
  *tstsource = 0x1000;
    3574:	206f 0068      	movea.l 104(sp),a0
    3578:	30bc 1000      	move.w #4096,(a0)
  tstsource++;
    357c:	54af 0068      	addq.l #2,104(sp)
  *tstsource = 0x8e88;
    3580:	206f 0068      	movea.l 104(sp),a0
    3584:	30bc 8e88      	move.w #-29048,(a0)
  tstsource += ZMLINESIZE/2-1;
    3588:	7228           	moveq #40,d1
    358a:	d3af 0068      	add.l d1,104(sp)

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
    358e:	2039 004d 2ca2 	move.l 4d2ca2 <Zoom_Source>,d0
    3594:	2200           	move.l d0,d1
    3596:	0681 0000 14d6 	addi.l #5334,d1
    359c:	2f41 0068      	move.l d1,104(sp)
  *tstsource++ = 0x0000;
    35a0:	202f 0068      	move.l 104(sp),d0
    35a4:	2200           	move.l d0,d1
    35a6:	5481           	addq.l #2,d1
    35a8:	2f41 0068      	move.l d1,104(sp)
    35ac:	2040           	movea.l d0,a0
    35ae:	4250           	clr.w (a0)
  *tstsource = 0x00ff;
    35b0:	206f 0068      	movea.l 104(sp),a0
    35b4:	30bc 00ff      	move.w #255,(a0)
  WaitBlit();
    35b8:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    35be:	2c40           	movea.l d0,a6
    35c0:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    35c4:	4eba e3c2      	jsr 1988 <Init_Blit>(pc)
  Init_ZoomBlit( 7, 16, 0);
    35c8:	42a7           	clr.l -(sp)
    35ca:	4878 0010      	pea 10 <_start+0x10>
    35ce:	4878 0007      	pea 7 <_start+0x7>
    35d2:	4eba e430      	jsr 1a04 <Init_ZoomBlit>(pc)
    35d6:	4fef 000c      	lea 12(sp),sp
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    35da:	2239 004d 2c60 	move.l 4d2c60 <DrawBuffer>,d1
    35e0:	2039 004d 2ca2 	move.l 4d2ca2 <Zoom_Source>,d0
    35e6:	4878 0080      	pea 80 <_start+0x80>
    35ea:	2f01           	move.l d1,-(sp)
    35ec:	2f00           	move.l d0,-(sp)
    35ee:	4eba d9fc      	jsr fec <Zoom_ZoomBlit>(pc)
    35f2:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    35f6:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    35fc:	2c40           	movea.l d0,a6
    35fe:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    3602:	2039 004d 2c60 	move.l 4d2c60 <DrawBuffer>,d0
    3608:	2200           	move.l d0,d1
    360a:	5481           	addq.l #2,d1
    360c:	2f41 0064      	move.l d1,100(sp)
  if( *destination != 0x0180) {
    3610:	206f 0064      	movea.l 100(sp),a0
    3614:	3010           	move.w (a0),d0
    3616:	0c40 0180      	cmpi.w #384,d0
    361a:	6742           	beq.s 365e <TestBlitleftOfZoom+0x19e>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    361c:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3622:	2c40           	movea.l d0,a6
    3624:	4eae ffc4      	jsr -60(a6)
    3628:	2f40 0060      	move.l d0,96(sp)
    362c:	202f 0060      	move.l 96(sp),d0
    3630:	2f40 005c      	move.l d0,92(sp)
    3634:	2f7c 0000 83fb 	move.l #33787,88(sp)
    363a:	0058 
    363c:	701c           	moveq #28,d0
    363e:	2f40 0054      	move.l d0,84(sp)
    3642:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3648:	2c40           	movea.l d0,a6
    364a:	222f 005c      	move.l 92(sp),d1
    364e:	242f 0058      	move.l 88(sp),d2
    3652:	262f 0054      	move.l 84(sp),d3
    3656:	4eae ffd0      	jsr -48(a6)
    365a:	2f40 0050      	move.l d0,80(sp)
  }
  destination += ZMLINESIZE/2;
    365e:	722a           	moveq #42,d1
    3660:	d3af 0064      	add.l d1,100(sp)
  if( *destination != 0x1d88)
    3664:	206f 0064      	movea.l 100(sp),a0
    3668:	3010           	move.w (a0),d0
    366a:	0c40 1d88      	cmpi.w #7560,d0
    366e:	6742           	beq.s 36b2 <TestBlitleftOfZoom+0x1f2>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    3670:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3676:	2c40           	movea.l d0,a6
    3678:	4eae ffc4      	jsr -60(a6)
    367c:	2f40 004c      	move.l d0,76(sp)
    3680:	202f 004c      	move.l 76(sp),d0
    3684:	2f40 0048      	move.l d0,72(sp)
    3688:	2f7c 0000 8418 	move.l #33816,68(sp)
    368e:	0044 
    3690:	701c           	moveq #28,d0
    3692:	2f40 0040      	move.l d0,64(sp)
    3696:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    369c:	2c40           	movea.l d0,a6
    369e:	222f 0048      	move.l 72(sp),d1
    36a2:	242f 0044      	move.l 68(sp),d2
    36a6:	262f 0040      	move.l 64(sp),d3
    36aa:	4eae ffd0      	jsr -48(a6)
    36ae:	2f40 003c      	move.l d0,60(sp)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
    36b2:	2039 004d 2c60 	move.l 4d2c60 <DrawBuffer>,d0
    36b8:	2200           	move.l d0,d1
    36ba:	0681 0000 14d6 	addi.l #5334,d1
    36c0:	2f41 0064      	move.l d1,100(sp)
  destination++;
    36c4:	54af 0064      	addq.l #2,100(sp)
  if( *destination != 0x01ff) {
    36c8:	206f 0064      	movea.l 100(sp),a0
    36cc:	3010           	move.w (a0),d0
    36ce:	0c40 01ff      	cmpi.w #511,d0
    36d2:	6742           	beq.s 3716 <TestBlitleftOfZoom+0x256>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    36d4:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    36da:	2c40           	movea.l d0,a6
    36dc:	4eae ffc4      	jsr -60(a6)
    36e0:	2f40 0038      	move.l d0,56(sp)
    36e4:	202f 0038      	move.l 56(sp),d0
    36e8:	2f40 0034      	move.l d0,52(sp)
    36ec:	2f7c 0000 8435 	move.l #33845,48(sp)
    36f2:	0030 
    36f4:	701a           	moveq #26,d0
    36f6:	2f40 002c      	move.l d0,44(sp)
    36fa:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3700:	2c40           	movea.l d0,a6
    3702:	222f 0034      	move.l 52(sp),d1
    3706:	242f 0030      	move.l 48(sp),d2
    370a:	262f 002c      	move.l 44(sp),d3
    370e:	4eae ffd0      	jsr -48(a6)
    3712:	2f40 0028      	move.l d0,40(sp)
  }
  FreeMem( Zoom_Source, 40*256*5);
    3716:	2f79 004d 2ca2 	move.l 4d2ca2 <Zoom_Source>,36(sp)
    371c:	0024 
    371e:	2f7c 0000 c800 	move.l #51200,32(sp)
    3724:	0020 
    3726:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    372c:	2c40           	movea.l d0,a6
    372e:	226f 0024      	movea.l 36(sp),a1
    3732:	202f 0020      	move.l 32(sp),d0
    3736:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    373a:	2f3c 0000 df20 	move.l #57120,-(sp)
    3740:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    3744:	4eba c99a      	jsr e0 <FreeDisplay>(pc)
    3748:	508f           	addq.l #8,sp
}
    374a:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    374e:	4fef 006c      	lea 108(sp),sp
    3752:	4e75           	rts

00003754 <TestCopyWord>:

void TestCopyWord() {
    3754:	4fef ff74      	lea -140(sp),sp
    3758:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    375c:	2f7c 0000 04ec 	move.l #1260,136(sp)
    3762:	0088 
    3764:	7002           	moveq #2,d0
    3766:	2f40 0084      	move.l d0,132(sp)
    376a:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    3770:	2c40           	movea.l d0,a6
    3772:	202f 0088      	move.l 136(sp),d0
    3776:	222f 0084      	move.l 132(sp),d1
    377a:	4eae ff3a      	jsr -198(a6)
    377e:	2f40 0080      	move.l d0,128(sp)
    3782:	202f 0080      	move.l 128(sp),d0
    3786:	2f40 007c      	move.l d0,124(sp)
  if( source == 0) {
    378a:	6646           	bne.s 37d2 <TestCopyWord+0x7e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    378c:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3792:	2c40           	movea.l d0,a6
    3794:	4eae ffc4      	jsr -60(a6)
    3798:	2f40 001c      	move.l d0,28(sp)
    379c:	202f 001c      	move.l 28(sp),d0
    37a0:	2f40 0018      	move.l d0,24(sp)
    37a4:	2f7c 0000 8450 	move.l #33872,20(sp)
    37aa:	0014 
    37ac:	7235           	moveq #53,d1
    37ae:	2f41 0010      	move.l d1,16(sp)
    37b2:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    37b8:	2c40           	movea.l d0,a6
    37ba:	222f 0018      	move.l 24(sp),d1
    37be:	242f 0014      	move.l 20(sp),d2
    37c2:	262f 0010      	move.l 16(sp),d3
    37c6:	4eae ffd0      	jsr -48(a6)
    37ca:	2f40 000c      	move.l d0,12(sp)
    37ce:	6000 026c      	bra.w 3a3c <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    37d2:	2f7c 0000 04ec 	move.l #1260,120(sp)
    37d8:	0078 
    37da:	7002           	moveq #2,d0
    37dc:	2f40 0074      	move.l d0,116(sp)
    37e0:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    37e6:	2c40           	movea.l d0,a6
    37e8:	202f 0078      	move.l 120(sp),d0
    37ec:	222f 0074      	move.l 116(sp),d1
    37f0:	4eae ff3a      	jsr -198(a6)
    37f4:	2f40 0070      	move.l d0,112(sp)
    37f8:	202f 0070      	move.l 112(sp),d0
    37fc:	2f40 006c      	move.l d0,108(sp)
  if( destination == 0) {
    3800:	6646           	bne.s 3848 <TestCopyWord+0xf4>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3802:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3808:	2c40           	movea.l d0,a6
    380a:	4eae ffc4      	jsr -60(a6)
    380e:	2f40 0030      	move.l d0,48(sp)
    3812:	202f 0030      	move.l 48(sp),d0
    3816:	2f40 002c      	move.l d0,44(sp)
    381a:	2f7c 0000 8450 	move.l #33872,40(sp)
    3820:	0028 
    3822:	7235           	moveq #53,d1
    3824:	2f41 0024      	move.l d1,36(sp)
    3828:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    382e:	2c40           	movea.l d0,a6
    3830:	222f 002c      	move.l 44(sp),d1
    3834:	242f 0028      	move.l 40(sp),d2
    3838:	262f 0024      	move.l 36(sp),d3
    383c:	4eae ffd0      	jsr -48(a6)
    3840:	2f40 0020      	move.l d0,32(sp)
    3844:	6000 01f6      	bra.w 3a3c <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
    3848:	2f6f 007c 0094 	move.l 124(sp),148(sp)
  for( int i=0; i<8;i++) {
    384e:	42af 0090      	clr.l 144(sp)
    3852:	6000 0086      	bra.w 38da <TestCopyWord+0x186>
    *tmp++ = 0;
    3856:	202f 0094      	move.l 148(sp),d0
    385a:	2200           	move.l d0,d1
    385c:	5481           	addq.l #2,d1
    385e:	2f41 0094      	move.l d1,148(sp)
    3862:	2040           	movea.l d0,a0
    3864:	4250           	clr.w (a0)
    *tmp++ = 0xaaaa;
    3866:	202f 0094      	move.l 148(sp),d0
    386a:	2200           	move.l d0,d1
    386c:	5481           	addq.l #2,d1
    386e:	2f41 0094      	move.l d1,148(sp)
    3872:	2040           	movea.l d0,a0
    3874:	30bc aaaa      	move.w #-21846,(a0)
    *tmp++ = 0xaaaa;
    3878:	202f 0094      	move.l 148(sp),d0
    387c:	2200           	move.l d0,d1
    387e:	5481           	addq.l #2,d1
    3880:	2f41 0094      	move.l d1,148(sp)
    3884:	2040           	movea.l d0,a0
    3886:	30bc aaaa      	move.w #-21846,(a0)
    *tmp = 0;
    388a:	206f 0094      	movea.l 148(sp),a0
    388e:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    3890:	7024           	moveq #36,d0
    3892:	d1af 0094      	add.l d0,148(sp)
    *tmp++ = 0;
    3896:	202f 0094      	move.l 148(sp),d0
    389a:	2200           	move.l d0,d1
    389c:	5481           	addq.l #2,d1
    389e:	2f41 0094      	move.l d1,148(sp)
    38a2:	2040           	movea.l d0,a0
    38a4:	4250           	clr.w (a0)
    *tmp++ = 0x5555;
    38a6:	202f 0094      	move.l 148(sp),d0
    38aa:	2200           	move.l d0,d1
    38ac:	5481           	addq.l #2,d1
    38ae:	2f41 0094      	move.l d1,148(sp)
    38b2:	2040           	movea.l d0,a0
    38b4:	30bc 5555      	move.w #21845,(a0)
    *tmp++ = 0x5555;
    38b8:	202f 0094      	move.l 148(sp),d0
    38bc:	2200           	move.l d0,d1
    38be:	5481           	addq.l #2,d1
    38c0:	2f41 0094      	move.l d1,148(sp)
    38c4:	2040           	movea.l d0,a0
    38c6:	30bc 5555      	move.w #21845,(a0)
    *tmp = 0;
    38ca:	206f 0094      	movea.l 148(sp),a0
    38ce:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    38d0:	7024           	moveq #36,d0
    38d2:	d1af 0094      	add.l d0,148(sp)
  for( int i=0; i<8;i++) {
    38d6:	52af 0090      	addq.l #1,144(sp)
    38da:	7207           	moveq #7,d1
    38dc:	b2af 0090      	cmp.l 144(sp),d1
    38e0:	6c00 ff74      	bge.w 3856 <TestCopyWord+0x102>
  }
  tmp = destination;
    38e4:	2f6f 006c 0094 	move.l 108(sp),148(sp)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    38ea:	42af 008c      	clr.l 140(sp)
    38ee:	6014           	bra.s 3904 <TestCopyWord+0x1b0>
    *tmp++ = 0;
    38f0:	202f 0094      	move.l 148(sp),d0
    38f4:	2200           	move.l d0,d1
    38f6:	5481           	addq.l #2,d1
    38f8:	2f41 0094      	move.l d1,148(sp)
    38fc:	2040           	movea.l d0,a0
    38fe:	4250           	clr.w (a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3900:	52af 008c      	addq.l #1,140(sp)
    3904:	0caf 0000 0275 	cmpi.l #629,140(sp)
    390a:	008c 
    390c:	6fe2           	ble.s 38f0 <TestCopyWord+0x19c>
  }

  WaitBlit();
    390e:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    3914:	2c40           	movea.l d0,a6
    3916:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
    391a:	4eba db5a      	jsr 1476 <Zoom_Init>(pc)
  Init_Copy( 3);
    391e:	4878 0003      	pea 3 <_start+0x3>
    3922:	4eba e184      	jsr 1aa8 <Init_Copy>(pc)
    3926:	588f           	addq.l #4,sp
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
    3928:	202f 007c      	move.l 124(sp),d0
    392c:	5480           	addq.l #2,d0
    392e:	4878 0010      	pea 10 <_start+0x10>
    3932:	2f2f 0070      	move.l 112(sp),-(sp)
    3936:	2f00           	move.l d0,-(sp)
    3938:	4eba d674      	jsr fae <Zoom_CopyWord>(pc)
    393c:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    3940:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    3946:	2c40           	movea.l d0,a6
    3948:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
    394c:	202f 006c      	move.l 108(sp),d0
    3950:	5480           	addq.l #2,d0
    3952:	2f40 0094      	move.l d0,148(sp)
  if( *tmp != 0x5555) 
    3956:	206f 0094      	movea.l 148(sp),a0
    395a:	3010           	move.w (a0),d0
    395c:	0c40 5555      	cmpi.w #21845,d0
    3960:	6742           	beq.s 39a4 <TestCopyWord+0x250>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    3962:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3968:	2c40           	movea.l d0,a6
    396a:	4eae ffc4      	jsr -60(a6)
    396e:	2f40 0068      	move.l d0,104(sp)
    3972:	202f 0068      	move.l 104(sp),d0
    3976:	2f40 0064      	move.l d0,100(sp)
    397a:	2f7c 0000 8486 	move.l #33926,96(sp)
    3980:	0060 
    3982:	721f           	moveq #31,d1
    3984:	2f41 005c      	move.l d1,92(sp)
    3988:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    398e:	2c40           	movea.l d0,a6
    3990:	222f 0064      	move.l 100(sp),d1
    3994:	242f 0060      	move.l 96(sp),d2
    3998:	262f 005c      	move.l 92(sp),d3
    399c:	4eae ffd0      	jsr -48(a6)
    39a0:	2f40 0058      	move.l d0,88(sp)
  tmp += ZMLINESIZE/2;
    39a4:	702a           	moveq #42,d0
    39a6:	d1af 0094      	add.l d0,148(sp)
  if( *tmp != 0xaaaa)
    39aa:	206f 0094      	movea.l 148(sp),a0
    39ae:	3010           	move.w (a0),d0
    39b0:	0c40 aaaa      	cmpi.w #-21846,d0
    39b4:	6742           	beq.s 39f8 <TestCopyWord+0x2a4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    39b6:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    39bc:	2c40           	movea.l d0,a6
    39be:	4eae ffc4      	jsr -60(a6)
    39c2:	2f40 0054      	move.l d0,84(sp)
    39c6:	202f 0054      	move.l 84(sp),d0
    39ca:	2f40 0050      	move.l d0,80(sp)
    39ce:	2f7c 0000 84a6 	move.l #33958,76(sp)
    39d4:	004c 
    39d6:	7220           	moveq #32,d1
    39d8:	2f41 0048      	move.l d1,72(sp)
    39dc:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    39e2:	2c40           	movea.l d0,a6
    39e4:	222f 0050      	move.l 80(sp),d1
    39e8:	242f 004c      	move.l 76(sp),d2
    39ec:	262f 0048      	move.l 72(sp),d3
    39f0:	4eae ffd0      	jsr -48(a6)
    39f4:	2f40 0044      	move.l d0,68(sp)
  
  FreeMem( source,ZMLINESIZE*30);
    39f8:	2f6f 007c 0040 	move.l 124(sp),64(sp)
    39fe:	2f7c 0000 04ec 	move.l #1260,60(sp)
    3a04:	003c 
    3a06:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    3a0c:	2c40           	movea.l d0,a6
    3a0e:	226f 0040      	movea.l 64(sp),a1
    3a12:	202f 003c      	move.l 60(sp),d0
    3a16:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    3a1a:	2f6f 006c 0038 	move.l 108(sp),56(sp)
    3a20:	2f7c 0000 04ec 	move.l #1260,52(sp)
    3a26:	0034 
    3a28:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    3a2e:	2c40           	movea.l d0,a6
    3a30:	226f 0038      	movea.l 56(sp),a1
    3a34:	202f 0034      	move.l 52(sp),d0
    3a38:	4eae ff2e      	jsr -210(a6)
}
    3a3c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3a40:	4fef 008c      	lea 140(sp),sp
    3a44:	4e75           	rts

00003a46 <TestZoom4PictureOn5Planes>:
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */


void TestZoom4PictureOn5Planes() {
    3a46:	4fef ff74      	lea -140(sp),sp
    3a4a:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3a4e:	2f7c 0000 f460 	move.l #62560,102(sp)
    3a54:	0066 
    3a56:	7002           	moveq #2,d0
    3a58:	2f40 0062      	move.l d0,98(sp)
    3a5c:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    3a62:	2c40           	movea.l d0,a6
    3a64:	202f 0066      	move.l 102(sp),d0
    3a68:	222f 0062      	move.l 98(sp),d1
    3a6c:	4eae ff3a      	jsr -198(a6)
    3a70:	2f40 005e      	move.l d0,94(sp)
    3a74:	202f 005e      	move.l 94(sp),d0
    3a78:	2f40 005a      	move.l d0,90(sp)
  if( source == 0) {
    3a7c:	6646           	bne.s 3ac4 <TestZoom4PictureOn5Planes+0x7e>
    Write(  Output(), 
    3a7e:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3a84:	2c40           	movea.l d0,a6
    3a86:	4eae ffc4      	jsr -60(a6)
    3a8a:	2f40 001e      	move.l d0,30(sp)
    3a8e:	202f 001e      	move.l 30(sp),d0
    3a92:	2f40 001a      	move.l d0,26(sp)
    3a96:	2f7c 0000 84c7 	move.l #33991,22(sp)
    3a9c:	0016 
    3a9e:	7239           	moveq #57,d1
    3aa0:	2f41 0012      	move.l d1,18(sp)
    3aa4:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3aaa:	2c40           	movea.l d0,a6
    3aac:	222f 001a      	move.l 26(sp),d1
    3ab0:	242f 0016      	move.l 22(sp),d2
    3ab4:	262f 0012      	move.l 18(sp),d3
    3ab8:	4eae ffd0      	jsr -48(a6)
    3abc:	2f40 000e      	move.l d0,14(sp)
    3ac0:	6000 0266      	bra.w 3d28 <TestZoom4PictureOn5Planes+0x2e2>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3ac4:	2f7c 0000 f460 	move.l #62560,86(sp)
    3aca:	0056 
    3acc:	7002           	moveq #2,d0
    3ace:	2f40 0052      	move.l d0,82(sp)
    3ad2:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    3ad8:	2c40           	movea.l d0,a6
    3ada:	202f 0056      	move.l 86(sp),d0
    3ade:	222f 0052      	move.l 82(sp),d1
    3ae2:	4eae ff3a      	jsr -198(a6)
    3ae6:	2f40 004e      	move.l d0,78(sp)
    3aea:	202f 004e      	move.l 78(sp),d0
    3aee:	2f40 004a      	move.l d0,74(sp)
  if( destination == 0) {
    3af2:	6646           	bne.s 3b3a <TestZoom4PictureOn5Planes+0xf4>
    Write(  Output(), 
    3af4:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3afa:	2c40           	movea.l d0,a6
    3afc:	4eae ffc4      	jsr -60(a6)
    3b00:	2f40 0032      	move.l d0,50(sp)
    3b04:	202f 0032      	move.l 50(sp),d0
    3b08:	2f40 002e      	move.l d0,46(sp)
    3b0c:	2f7c 0000 8501 	move.l #34049,42(sp)
    3b12:	002a 
    3b14:	723d           	moveq #61,d1
    3b16:	2f41 0026      	move.l d1,38(sp)
    3b1a:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3b20:	2c40           	movea.l d0,a6
    3b22:	222f 002e      	move.l 46(sp),d1
    3b26:	242f 002a      	move.l 42(sp),d2
    3b2a:	262f 0026      	move.l 38(sp),d3
    3b2e:	4eae ffd0      	jsr -48(a6)
    3b32:	2f40 0022      	move.l d0,34(sp)
    3b36:	6000 01f0      	bra.w 3d28 <TestZoom4PictureOn5Planes+0x2e2>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3b3a:	2f6f 005a 0094 	move.l 90(sp),148(sp)
  for(int i=0;i<128+8;i++) {
    3b40:	42af 0090      	clr.l 144(sp)
    3b44:	6050           	bra.s 3b96 <TestZoom4PictureOn5Planes+0x150>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b46:	42af 008c      	clr.l 140(sp)
    3b4a:	6018           	bra.s 3b64 <TestZoom4PictureOn5Planes+0x11e>
      *tmp4source++ = 0x55555555;
    3b4c:	202f 0094      	move.l 148(sp),d0
    3b50:	2200           	move.l d0,d1
    3b52:	5881           	addq.l #4,d1
    3b54:	2f41 0094      	move.l d1,148(sp)
    3b58:	2040           	movea.l d0,a0
    3b5a:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b60:	52af 008c      	addq.l #1,140(sp)
    3b64:	7031           	moveq #49,d0
    3b66:	b0af 008c      	cmp.l 140(sp),d0
    3b6a:	6ce0           	bge.s 3b4c <TestZoom4PictureOn5Planes+0x106>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b6c:	42af 0088      	clr.l 136(sp)
    3b70:	6018           	bra.s 3b8a <TestZoom4PictureOn5Planes+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3b72:	202f 0094      	move.l 148(sp),d0
    3b76:	2200           	move.l d0,d1
    3b78:	5881           	addq.l #4,d1
    3b7a:	2f41 0094      	move.l d1,148(sp)
    3b7e:	2040           	movea.l d0,a0
    3b80:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b86:	52af 0088      	addq.l #1,136(sp)
    3b8a:	7031           	moveq #49,d0
    3b8c:	b0af 0088      	cmp.l 136(sp),d0
    3b90:	6ce0           	bge.s 3b72 <TestZoom4PictureOn5Planes+0x12c>
  for(int i=0;i<128+8;i++) {
    3b92:	52af 0090      	addq.l #1,144(sp)
    3b96:	0caf 0000 0087 	cmpi.l #135,144(sp)
    3b9c:	0090 
    3b9e:	6fa6           	ble.s 3b46 <TestZoom4PictureOn5Planes+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3ba0:	4878 0005      	pea 5 <_start+0x5>
    3ba4:	42a7           	clr.l -(sp)
    3ba6:	2f2f 0052      	move.l 82(sp),-(sp)
    3baa:	2f2f 0066      	move.l 102(sp),-(sp)
    3bae:	4eba df32      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    3bb2:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3bb6:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    3bbc:	2c40           	movea.l d0,a6
    3bbe:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3bc2:	222f 004a      	move.l 74(sp),d1
    3bc6:	5881           	addq.l #4,d1
    3bc8:	2f41 0084      	move.l d1,132(sp)
  UWORD *valsupposed = destlinezoom1;
    3bcc:	2f7c 0000 bb1c 	move.l #47900,70(sp)
    3bd2:	0046 
  UWORD mask = 0xffff;
    3bd4:	3f7c ffff 0082 	move.w #-1,130(sp)
  for(int i=0;i<14;i++) {
    3bda:	42af 007e      	clr.l 126(sp)
    3bde:	6000 00a8      	bra.w 3c88 <TestZoom4PictureOn5Planes+0x242>
    for(int i2=0;i2<18;i2++) { 
    3be2:	42af 007a      	clr.l 122(sp)
    3be6:	604e           	bra.s 3c36 <TestZoom4PictureOn5Planes+0x1f0>
      for( int i3=0;i3<5;i3++) {
    3be8:	42af 0076      	clr.l 118(sp)
    3bec:	6038           	bra.s 3c26 <TestZoom4PictureOn5Planes+0x1e0>
        TestRow( valsupposed, valactual, mask, i2+i*19);
    3bee:	222f 007e      	move.l 126(sp),d1
    3bf2:	2001           	move.l d1,d0
    3bf4:	e788           	lsl.l #3,d0
    3bf6:	d081           	add.l d1,d0
    3bf8:	d080           	add.l d0,d0
    3bfa:	d081           	add.l d1,d0
    3bfc:	2200           	move.l d0,d1
    3bfe:	d2af 007a      	add.l 122(sp),d1
    3c02:	7000           	moveq #0,d0
    3c04:	302f 0082      	move.w 130(sp),d0
    3c08:	2f01           	move.l d1,-(sp)
    3c0a:	2f00           	move.l d0,-(sp)
    3c0c:	2f2f 008c      	move.l 140(sp),-(sp)
    3c10:	2f2f 0052      	move.l 82(sp),-(sp)
    3c14:	4eba 2f7e      	jsr 6b94 <TestRow>(pc)
    3c18:	4fef 0010      	lea 16(sp),sp
        valactual += ZMLINESIZE/2;
    3c1c:	702a           	moveq #42,d0
    3c1e:	d1af 0084      	add.l d0,132(sp)
      for( int i3=0;i3<5;i3++) {
    3c22:	52af 0076      	addq.l #1,118(sp)
    3c26:	7204           	moveq #4,d1
    3c28:	b2af 0076      	cmp.l 118(sp),d1
    3c2c:	6cc0           	bge.s 3bee <TestZoom4PictureOn5Planes+0x1a8>
      }
      mask = mask ^ 0xffff;
    3c2e:	466f 0082      	not.w 130(sp)
    for(int i2=0;i2<18;i2++) { 
    3c32:	52af 007a      	addq.l #1,122(sp)
    3c36:	7011           	moveq #17,d0
    3c38:	b0af 007a      	cmp.l 122(sp),d0
    3c3c:	6caa           	bge.s 3be8 <TestZoom4PictureOn5Planes+0x1a2>
    }
    for( int i3=0;i3<5;i3++) {
    3c3e:	42af 0072      	clr.l 114(sp)
    3c42:	6038           	bra.s 3c7c <TestZoom4PictureOn5Planes+0x236>
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3c44:	222f 007e      	move.l 126(sp),d1
    3c48:	2001           	move.l d1,d0
    3c4a:	e788           	lsl.l #3,d0
    3c4c:	d081           	add.l d1,d0
    3c4e:	d080           	add.l d0,d0
    3c50:	2040           	movea.l d0,a0
    3c52:	d1c1           	adda.l d1,a0
    3c54:	41e8 0012      	lea 18(a0),a0
    3c58:	7000           	moveq #0,d0
    3c5a:	302f 0082      	move.w 130(sp),d0
    3c5e:	2f08           	move.l a0,-(sp)
    3c60:	2f00           	move.l d0,-(sp)
    3c62:	2f2f 008c      	move.l 140(sp),-(sp)
    3c66:	2f2f 0052      	move.l 82(sp),-(sp)
    3c6a:	4eba 2f28      	jsr 6b94 <TestRow>(pc)
    3c6e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3c72:	722a           	moveq #42,d1
    3c74:	d3af 0084      	add.l d1,132(sp)
    for( int i3=0;i3<5;i3++) {
    3c78:	52af 0072      	addq.l #1,114(sp)
    3c7c:	7004           	moveq #4,d0
    3c7e:	b0af 0072      	cmp.l 114(sp),d0
    3c82:	6cc0           	bge.s 3c44 <TestZoom4PictureOn5Planes+0x1fe>
  for(int i=0;i<14;i++) {
    3c84:	52af 007e      	addq.l #1,126(sp)
    3c88:	720d           	moveq #13,d1
    3c8a:	b2af 007e      	cmp.l 126(sp),d1
    3c8e:	6c00 ff52      	bge.w 3be2 <TestZoom4PictureOn5Planes+0x19c>
    }
  }
  for(int i2=0;i2<4;i2++) { 
    3c92:	42af 006e      	clr.l 110(sp)
    3c96:	6044           	bra.s 3cdc <TestZoom4PictureOn5Planes+0x296>
    for( int i3=0;i3<5;i3++) {
    3c98:	42af 006a      	clr.l 106(sp)
    3c9c:	602e           	bra.s 3ccc <TestZoom4PictureOn5Planes+0x286>
      TestRow( valsupposed, valactual, mask, i2+265);
    3c9e:	222f 006e      	move.l 110(sp),d1
    3ca2:	0681 0000 0109 	addi.l #265,d1
    3ca8:	7000           	moveq #0,d0
    3caa:	302f 0082      	move.w 130(sp),d0
    3cae:	2f01           	move.l d1,-(sp)
    3cb0:	2f00           	move.l d0,-(sp)
    3cb2:	2f2f 008c      	move.l 140(sp),-(sp)
    3cb6:	2f2f 0052      	move.l 82(sp),-(sp)
    3cba:	4eba 2ed8      	jsr 6b94 <TestRow>(pc)
    3cbe:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3cc2:	702a           	moveq #42,d0
    3cc4:	d1af 0084      	add.l d0,132(sp)
    for( int i3=0;i3<5;i3++) {
    3cc8:	52af 006a      	addq.l #1,106(sp)
    3ccc:	7204           	moveq #4,d1
    3cce:	b2af 006a      	cmp.l 106(sp),d1
    3cd2:	6cca           	bge.s 3c9e <TestZoom4PictureOn5Planes+0x258>
    }
    mask = mask ^ 0xffff;
    3cd4:	466f 0082      	not.w 130(sp)
  for(int i2=0;i2<4;i2++) { 
    3cd8:	52af 006e      	addq.l #1,110(sp)
    3cdc:	7003           	moveq #3,d0
    3cde:	b0af 006e      	cmp.l 110(sp),d0
    3ce2:	6cb4           	bge.s 3c98 <TestZoom4PictureOn5Planes+0x252>
  } 
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    3ce4:	2f6f 005a 0042 	move.l 90(sp),66(sp)
    3cea:	2f7c 0000 f460 	move.l #62560,62(sp)
    3cf0:	003e 
    3cf2:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    3cf8:	2c40           	movea.l d0,a6
    3cfa:	226f 0042      	movea.l 66(sp),a1
    3cfe:	202f 003e      	move.l 62(sp),d0
    3d02:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    3d06:	2f6f 004a 003a 	move.l 74(sp),58(sp)
    3d0c:	2f7c 0000 f460 	move.l #62560,54(sp)
    3d12:	0036 
    3d14:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    3d1a:	2c40           	movea.l d0,a6
    3d1c:	226f 003a      	movea.l 58(sp),a1
    3d20:	202f 0036      	move.l 54(sp),d0
    3d24:	4eae ff2e      	jsr -210(a6)
}
    3d28:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3d2c:	4fef 008c      	lea 140(sp),sp
    3d30:	4e75           	rts

00003d32 <TestZoom4Picture>:

void TestZoom4Picture() {
    3d32:	4fef fe30      	lea -464(sp),sp
    3d36:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3d3a:	2f7c 0000 30e0 	move.l #12512,106(sp)
    3d40:	006a 
    3d42:	7002           	moveq #2,d0
    3d44:	2f40 0066      	move.l d0,102(sp)
    3d48:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    3d4e:	2c40           	movea.l d0,a6
    3d50:	202f 006a      	move.l 106(sp),d0
    3d54:	222f 0066      	move.l 102(sp),d1
    3d58:	4eae ff3a      	jsr -198(a6)
    3d5c:	2f40 0062      	move.l d0,98(sp)
    3d60:	202f 0062      	move.l 98(sp),d0
    3d64:	2f40 005e      	move.l d0,94(sp)
  if( source == 0) {
    3d68:	6646           	bne.s 3db0 <TestZoom4Picture+0x7e>
    Write(  Output(), 
    3d6a:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3d70:	2c40           	movea.l d0,a6
    3d72:	4eae ffc4      	jsr -60(a6)
    3d76:	2f40 001e      	move.l d0,30(sp)
    3d7a:	202f 001e      	move.l 30(sp),d0
    3d7e:	2f40 001a      	move.l d0,26(sp)
    3d82:	2f7c 0000 84c7 	move.l #33991,22(sp)
    3d88:	0016 
    3d8a:	7239           	moveq #57,d1
    3d8c:	2f41 0012      	move.l d1,18(sp)
    3d90:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3d96:	2c40           	movea.l d0,a6
    3d98:	222f 001a      	move.l 26(sp),d1
    3d9c:	242f 0016      	move.l 22(sp),d2
    3da0:	262f 0012      	move.l 18(sp),d3
    3da4:	4eae ffd0      	jsr -48(a6)
    3da8:	2f40 000e      	move.l d0,14(sp)
    3dac:	6000 2ddc      	bra.w 6b8a <TestZoom4Picture+0x2e58>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3db0:	2f7c 0000 30e0 	move.l #12512,90(sp)
    3db6:	005a 
    3db8:	7002           	moveq #2,d0
    3dba:	2f40 0056      	move.l d0,86(sp)
    3dbe:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    3dc4:	2c40           	movea.l d0,a6
    3dc6:	202f 005a      	move.l 90(sp),d0
    3dca:	222f 0056      	move.l 86(sp),d1
    3dce:	4eae ff3a      	jsr -198(a6)
    3dd2:	2f40 0052      	move.l d0,82(sp)
    3dd6:	202f 0052      	move.l 82(sp),d0
    3dda:	2f40 004e      	move.l d0,78(sp)
  if( destination == 0) {
    3dde:	6646           	bne.s 3e26 <TestZoom4Picture+0xf4>
    Write(  Output(), 
    3de0:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3de6:	2c40           	movea.l d0,a6
    3de8:	4eae ffc4      	jsr -60(a6)
    3dec:	2f40 0032      	move.l d0,50(sp)
    3df0:	202f 0032      	move.l 50(sp),d0
    3df4:	2f40 002e      	move.l d0,46(sp)
    3df8:	2f7c 0000 8501 	move.l #34049,42(sp)
    3dfe:	002a 
    3e00:	723d           	moveq #61,d1
    3e02:	2f41 0026      	move.l d1,38(sp)
    3e06:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    3e0c:	2c40           	movea.l d0,a6
    3e0e:	222f 002e      	move.l 46(sp),d1
    3e12:	242f 002a      	move.l 42(sp),d2
    3e16:	262f 0026      	move.l 38(sp),d3
    3e1a:	4eae ffd0      	jsr -48(a6)
    3e1e:	2f40 0022      	move.l d0,34(sp)
    3e22:	6000 2d66      	bra.w 6b8a <TestZoom4Picture+0x2e58>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3e26:	2f6f 005e 01d8 	move.l 94(sp),472(sp)
  for(int i=0;i<128+8;i++) {
    3e2c:	42af 01d4      	clr.l 468(sp)
    3e30:	6050           	bra.s 3e82 <TestZoom4Picture+0x150>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e32:	42af 01d0      	clr.l 464(sp)
    3e36:	6018           	bra.s 3e50 <TestZoom4Picture+0x11e>
      *tmp4source++ = 0x55555555;
    3e38:	202f 01d8      	move.l 472(sp),d0
    3e3c:	2200           	move.l d0,d1
    3e3e:	5881           	addq.l #4,d1
    3e40:	2f41 01d8      	move.l d1,472(sp)
    3e44:	2040           	movea.l d0,a0
    3e46:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e4c:	52af 01d0      	addq.l #1,464(sp)
    3e50:	7009           	moveq #9,d0
    3e52:	b0af 01d0      	cmp.l 464(sp),d0
    3e56:	6ce0           	bge.s 3e38 <TestZoom4Picture+0x106>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e58:	42af 01cc      	clr.l 460(sp)
    3e5c:	6018           	bra.s 3e76 <TestZoom4Picture+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3e5e:	202f 01d8      	move.l 472(sp),d0
    3e62:	2200           	move.l d0,d1
    3e64:	5881           	addq.l #4,d1
    3e66:	2f41 01d8      	move.l d1,472(sp)
    3e6a:	2040           	movea.l d0,a0
    3e6c:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e72:	52af 01cc      	addq.l #1,460(sp)
    3e76:	7009           	moveq #9,d0
    3e78:	b0af 01cc      	cmp.l 460(sp),d0
    3e7c:	6ce0           	bge.s 3e5e <TestZoom4Picture+0x12c>
  for(int i=0;i<128+8;i++) {
    3e7e:	52af 01d4      	addq.l #1,468(sp)
    3e82:	0caf 0000 0087 	cmpi.l #135,468(sp)
    3e88:	01d4 
    3e8a:	6fa6           	ble.s 3e32 <TestZoom4Picture+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    3e8c:	4878 0001      	pea 1 <_start+0x1>
    3e90:	42a7           	clr.l -(sp)
    3e92:	2f2f 0056      	move.l 86(sp),-(sp)
    3e96:	2f2f 006a      	move.l 106(sp),-(sp)
    3e9a:	4eba dc46      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    3e9e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3ea2:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    3ea8:	2c40           	movea.l d0,a6
    3eaa:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3eae:	222f 004e      	move.l 78(sp),d1
    3eb2:	5881           	addq.l #4,d1
    3eb4:	2f41 01c8      	move.l d1,456(sp)
  UWORD *valsupposed = destlinezoom1;
    3eb8:	2f7c 0000 bb1c 	move.l #47900,74(sp)
    3ebe:	004a 
  UWORD mask = 0xffff;
    3ec0:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<14;i++) {
    3ec6:	42af 01c2      	clr.l 450(sp)
    3eca:	6000 0084      	bra.w 3f50 <TestZoom4Picture+0x21e>
    for(int i2=0;i2<18;i2++) { 
    3ece:	42af 01be      	clr.l 446(sp)
    3ed2:	603c           	bra.s 3f10 <TestZoom4Picture+0x1de>
      TestRow( valsupposed, valactual, mask, i2+i*19);
    3ed4:	222f 01c2      	move.l 450(sp),d1
    3ed8:	2001           	move.l d1,d0
    3eda:	e788           	lsl.l #3,d0
    3edc:	d081           	add.l d1,d0
    3ede:	d080           	add.l d0,d0
    3ee0:	d081           	add.l d1,d0
    3ee2:	2200           	move.l d0,d1
    3ee4:	d2af 01be      	add.l 446(sp),d1
    3ee8:	7000           	moveq #0,d0
    3eea:	302f 01c6      	move.w 454(sp),d0
    3eee:	2f01           	move.l d1,-(sp)
    3ef0:	2f00           	move.l d0,-(sp)
    3ef2:	2f2f 01d0      	move.l 464(sp),-(sp)
    3ef6:	2f2f 0056      	move.l 86(sp),-(sp)
    3efa:	4eba 2c98      	jsr 6b94 <TestRow>(pc)
    3efe:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3f02:	702a           	moveq #42,d0
    3f04:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    3f08:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) { 
    3f0c:	52af 01be      	addq.l #1,446(sp)
    3f10:	7211           	moveq #17,d1
    3f12:	b2af 01be      	cmp.l 446(sp),d1
    3f16:	6cbc           	bge.s 3ed4 <TestZoom4Picture+0x1a2>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    3f18:	222f 01c2      	move.l 450(sp),d1
    3f1c:	2001           	move.l d1,d0
    3f1e:	e788           	lsl.l #3,d0
    3f20:	d081           	add.l d1,d0
    3f22:	d080           	add.l d0,d0
    3f24:	2040           	movea.l d0,a0
    3f26:	d1c1           	adda.l d1,a0
    3f28:	41e8 0012      	lea 18(a0),a0
    3f2c:	7000           	moveq #0,d0
    3f2e:	302f 01c6      	move.w 454(sp),d0
    3f32:	2f08           	move.l a0,-(sp)
    3f34:	2f00           	move.l d0,-(sp)
    3f36:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f3a:	2f2f 0056      	move.l 86(sp),-(sp)
    3f3e:	4eba 2c54      	jsr 6b94 <TestRow>(pc)
    3f42:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f46:	702a           	moveq #42,d0
    3f48:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<14;i++) {
    3f4c:	52af 01c2      	addq.l #1,450(sp)
    3f50:	720d           	moveq #13,d1
    3f52:	b2af 01c2      	cmp.l 450(sp),d1
    3f56:	6c00 ff76      	bge.w 3ece <TestZoom4Picture+0x19c>
  }

  for(int i2=0;i2<4;i2++) { 
    3f5a:	42af 01ba      	clr.l 442(sp)
    3f5e:	6032           	bra.s 3f92 <TestZoom4Picture+0x260>
    TestRow( valsupposed, valactual, mask, i2+265);
    3f60:	222f 01ba      	move.l 442(sp),d1
    3f64:	0681 0000 0109 	addi.l #265,d1
    3f6a:	7000           	moveq #0,d0
    3f6c:	302f 01c6      	move.w 454(sp),d0
    3f70:	2f01           	move.l d1,-(sp)
    3f72:	2f00           	move.l d0,-(sp)
    3f74:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f78:	2f2f 0056      	move.l 86(sp),-(sp)
    3f7c:	4eba 2c16      	jsr 6b94 <TestRow>(pc)
    3f80:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f84:	702a           	moveq #42,d0
    3f86:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    3f8a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    3f8e:	52af 01ba      	addq.l #1,442(sp)
    3f92:	7203           	moveq #3,d1
    3f94:	b2af 01ba      	cmp.l 442(sp),d1
    3f98:	6cc6           	bge.s 3f60 <TestZoom4Picture+0x22e>
  }
  
  UWORD *tmp = source;
    3f9a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    3fa0:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    3fa6:	2f6f 0046 004e 	move.l 70(sp),78(sp)
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    3fac:	4878 0001      	pea 1 <_start+0x1>
    3fb0:	4878 0001      	pea 1 <_start+0x1>
    3fb4:	2f2f 0056      	move.l 86(sp),-(sp)
    3fb8:	2f2f 006a      	move.l 106(sp),-(sp)
    3fbc:	4eba db24      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    3fc0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3fc4:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    3fca:	2c40           	movea.l d0,a6
    3fcc:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    3fd0:	202f 004e      	move.l 78(sp),d0
    3fd4:	5880           	addq.l #4,d0
    3fd6:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom2;
    3fda:	2f7c 0000 bb48 	move.l #47944,74(sp)
    3fe0:	004a 
  mask = 0x0000;
    3fe2:	426f 01c6      	clr.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3fe6:	42af 01b6      	clr.l 438(sp)
    3fea:	602a           	bra.s 4016 <TestZoom4Picture+0x2e4>
    TestRow( valsupposed, valactual, mask, i2);
    3fec:	7000           	moveq #0,d0
    3fee:	302f 01c6      	move.w 454(sp),d0
    3ff2:	2f2f 01b6      	move.l 438(sp),-(sp)
    3ff6:	2f00           	move.l d0,-(sp)
    3ff8:	2f2f 01d0      	move.l 464(sp),-(sp)
    3ffc:	2f2f 0056      	move.l 86(sp),-(sp)
    4000:	4eba 2b92      	jsr 6b94 <TestRow>(pc)
    4004:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4008:	722a           	moveq #42,d1
    400a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    400e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    4012:	52af 01b6      	addq.l #1,438(sp)
    4016:	700a           	moveq #10,d0
    4018:	b0af 01b6      	cmp.l 438(sp),d0
    401c:	6cce           	bge.s 3fec <TestZoom4Picture+0x2ba>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    401e:	4878 0008      	pea 8 <_start+0x8>
    4022:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4028:	2f2f 01d0      	move.l 464(sp),-(sp)
    402c:	2f2f 0056      	move.l 86(sp),-(sp)
    4030:	4eba 2b62      	jsr 6b94 <TestRow>(pc)
    4034:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4038:	722a           	moveq #42,d1
    403a:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 9);
    403e:	4878 0009      	pea 9 <_start+0x9>
    4042:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4048:	2f2f 01d0      	move.l 464(sp),-(sp)
    404c:	2f2f 0056      	move.l 86(sp),-(sp)
    4050:	4eba 2b42      	jsr 6b94 <TestRow>(pc)
    4054:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4058:	702a           	moveq #42,d0
    405a:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 10);
    405e:	4878 000a      	pea a <_start+0xa>
    4062:	42a7           	clr.l -(sp)
    4064:	2f2f 01d0      	move.l 464(sp),-(sp)
    4068:	2f2f 0056      	move.l 86(sp),-(sp)
    406c:	4eba 2b26      	jsr 6b94 <TestRow>(pc)
    4070:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4074:	722a           	moveq #42,d1
    4076:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 11);
    407a:	4878 000b      	pea b <_start+0xb>
    407e:	42a7           	clr.l -(sp)
    4080:	2f2f 01d0      	move.l 464(sp),-(sp)
    4084:	2f2f 0056      	move.l 86(sp),-(sp)
    4088:	4eba 2b0a      	jsr 6b94 <TestRow>(pc)
    408c:	4fef 0010      	lea 16(sp),sp

  valactual += ZMLINESIZE/2;
    4090:	702a           	moveq #42,d0
    4092:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<12;i++) {
    4096:	42af 01b2      	clr.l 434(sp)
    409a:	6000 0118      	bra.w 41b4 <TestZoom4Picture+0x482>
    for(int i2=0;i2<16;i2++) {  
    409e:	42af 01ae      	clr.l 430(sp)
    40a2:	603c           	bra.s 40e0 <TestZoom4Picture+0x3ae>
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    40a4:	222f 01b2      	move.l 434(sp),d1
    40a8:	2001           	move.l d1,d0
    40aa:	e988           	lsl.l #4,d0
    40ac:	d081           	add.l d1,d0
    40ae:	2040           	movea.l d0,a0
    40b0:	d1ef 01ae      	adda.l 430(sp),a0
    40b4:	41e8 000b      	lea 11(a0),a0
    40b8:	7000           	moveq #0,d0
    40ba:	302f 01c6      	move.w 454(sp),d0
    40be:	2f08           	move.l a0,-(sp)
    40c0:	2f00           	move.l d0,-(sp)
    40c2:	2f2f 01d0      	move.l 464(sp),-(sp)
    40c6:	2f2f 0056      	move.l 86(sp),-(sp)
    40ca:	4eba 2ac8      	jsr 6b94 <TestRow>(pc)
    40ce:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    40d2:	722a           	moveq #42,d1
    40d4:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    40d8:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {  
    40dc:	52af 01ae      	addq.l #1,430(sp)
    40e0:	700f           	moveq #15,d0
    40e2:	b0af 01ae      	cmp.l 430(sp),d0
    40e6:	6cbc           	bge.s 40a4 <TestZoom4Picture+0x372>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    40e8:	222f 01b2      	move.l 434(sp),d1
    40ec:	2001           	move.l d1,d0
    40ee:	e988           	lsl.l #4,d0
    40f0:	2040           	movea.l d0,a0
    40f2:	d1c1           	adda.l d1,a0
    40f4:	41e8 0018      	lea 24(a0),a0
    40f8:	7000           	moveq #0,d0
    40fa:	302f 01c6      	move.w 454(sp),d0
    40fe:	2f08           	move.l a0,-(sp)
    4100:	2f00           	move.l d0,-(sp)
    4102:	2f2f 01d0      	move.l 464(sp),-(sp)
    4106:	2f2f 0056      	move.l 86(sp),-(sp)
    410a:	4eba 2a88      	jsr 6b94 <TestRow>(pc)
    410e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4112:	722a           	moveq #42,d1
    4114:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    4118:	222f 01b2      	move.l 434(sp),d1
    411c:	2001           	move.l d1,d0
    411e:	e988           	lsl.l #4,d0
    4120:	2040           	movea.l d0,a0
    4122:	d1c1           	adda.l d1,a0
    4124:	41e8 0019      	lea 25(a0),a0
    4128:	7000           	moveq #0,d0
    412a:	302f 01c6      	move.w 454(sp),d0
    412e:	2f08           	move.l a0,-(sp)
    4130:	2f00           	move.l d0,-(sp)
    4132:	2f2f 01d0      	move.l 464(sp),-(sp)
    4136:	2f2f 0056      	move.l 86(sp),-(sp)
    413a:	4eba 2a58      	jsr 6b94 <TestRow>(pc)
    413e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4142:	702a           	moveq #42,d0
    4144:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4148:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    414c:	222f 01b2      	move.l 434(sp),d1
    4150:	2001           	move.l d1,d0
    4152:	e988           	lsl.l #4,d0
    4154:	2040           	movea.l d0,a0
    4156:	d1c1           	adda.l d1,a0
    4158:	41e8 001a      	lea 26(a0),a0
    415c:	7000           	moveq #0,d0
    415e:	302f 01c6      	move.w 454(sp),d0
    4162:	2f08           	move.l a0,-(sp)
    4164:	2f00           	move.l d0,-(sp)
    4166:	2f2f 01d0      	move.l 464(sp),-(sp)
    416a:	2f2f 0056      	move.l 86(sp),-(sp)
    416e:	4eba 2a24      	jsr 6b94 <TestRow>(pc)
    4172:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4176:	722a           	moveq #42,d1
    4178:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    417c:	222f 01b2      	move.l 434(sp),d1
    4180:	2001           	move.l d1,d0
    4182:	e988           	lsl.l #4,d0
    4184:	2040           	movea.l d0,a0
    4186:	d1c1           	adda.l d1,a0
    4188:	41e8 001b      	lea 27(a0),a0
    418c:	7000           	moveq #0,d0
    418e:	302f 01c6      	move.w 454(sp),d0
    4192:	2f08           	move.l a0,-(sp)
    4194:	2f00           	move.l d0,-(sp)
    4196:	2f2f 01d0      	move.l 464(sp),-(sp)
    419a:	2f2f 0056      	move.l 86(sp),-(sp)
    419e:	4eba 29f4      	jsr 6b94 <TestRow>(pc)
    41a2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    41a6:	702a           	moveq #42,d0
    41a8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    41ac:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    41b0:	52af 01b2      	addq.l #1,434(sp)
    41b4:	720b           	moveq #11,d1
    41b6:	b2af 01b2      	cmp.l 434(sp),d1
    41ba:	6c00 fee2      	bge.w 409e <TestZoom4Picture+0x36c>
    
  }

  for(int i2=0;i2<15;i2++) { 
    41be:	42af 01aa      	clr.l 426(sp)
    41c2:	602a           	bra.s 41ee <TestZoom4Picture+0x4bc>
    TestRow( valsupposed, valactual, mask, i2);
    41c4:	7000           	moveq #0,d0
    41c6:	302f 01c6      	move.w 454(sp),d0
    41ca:	2f2f 01aa      	move.l 426(sp),-(sp)
    41ce:	2f00           	move.l d0,-(sp)
    41d0:	2f2f 01d0      	move.l 464(sp),-(sp)
    41d4:	2f2f 0056      	move.l 86(sp),-(sp)
    41d8:	4eba 29ba      	jsr 6b94 <TestRow>(pc)
    41dc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    41e0:	702a           	moveq #42,d0
    41e2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    41e6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<15;i2++) { 
    41ea:	52af 01aa      	addq.l #1,426(sp)
    41ee:	720e           	moveq #14,d1
    41f0:	b2af 01aa      	cmp.l 426(sp),d1
    41f4:	6cce           	bge.s 41c4 <TestZoom4Picture+0x492>
  }

  tmp = source;
    41f6:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    41fc:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4202:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    4208:	4878 0001      	pea 1 <_start+0x1>
    420c:	4878 0002      	pea 2 <_start+0x2>
    4210:	2f2f 0056      	move.l 86(sp),-(sp)
    4214:	2f2f 006a      	move.l 106(sp),-(sp)
    4218:	4eba d8c8      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    421c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4220:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    4226:	2c40           	movea.l d0,a6
    4228:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    422c:	202f 004e      	move.l 78(sp),d0
    4230:	5880           	addq.l #4,d0
    4232:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom3;
    4236:	2f7c 0000 bb74 	move.l #47988,74(sp)
    423c:	004a 
  mask = 0xffff;
    423e:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<4;i2++) { 
    4244:	42af 01a6      	clr.l 422(sp)
    4248:	602a           	bra.s 4274 <TestZoom4Picture+0x542>
    TestRow( valsupposed, valactual, mask, i2);
    424a:	7000           	moveq #0,d0
    424c:	302f 01c6      	move.w 454(sp),d0
    4250:	2f2f 01a6      	move.l 422(sp),-(sp)
    4254:	2f00           	move.l d0,-(sp)
    4256:	2f2f 01d0      	move.l 464(sp),-(sp)
    425a:	2f2f 0056      	move.l 86(sp),-(sp)
    425e:	4eba 2934      	jsr 6b94 <TestRow>(pc)
    4262:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4266:	722a           	moveq #42,d1
    4268:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    426c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    4270:	52af 01a6      	addq.l #1,422(sp)
    4274:	7003           	moveq #3,d0
    4276:	b0af 01a6      	cmp.l 422(sp),d0
    427a:	6cce           	bge.s 424a <TestZoom4Picture+0x518>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    427c:	4878 0004      	pea 4 <_start+0x4>
    4280:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4286:	2f2f 01d0      	move.l 464(sp),-(sp)
    428a:	2f2f 0056      	move.l 86(sp),-(sp)
    428e:	4eba 2904      	jsr 6b94 <TestRow>(pc)
    4292:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4296:	722a           	moveq #42,d1
    4298:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    429c:	4878 0005      	pea 5 <_start+0x5>
    42a0:	2f3c 0000 ffff 	move.l #65535,-(sp)
    42a6:	2f2f 01d0      	move.l 464(sp),-(sp)
    42aa:	2f2f 0056      	move.l 86(sp),-(sp)
    42ae:	4eba 28e4      	jsr 6b94 <TestRow>(pc)
    42b2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42b6:	702a           	moveq #42,d0
    42b8:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    42bc:	4878 0006      	pea 6 <_start+0x6>
    42c0:	42a7           	clr.l -(sp)
    42c2:	2f2f 01d0      	move.l 464(sp),-(sp)
    42c6:	2f2f 0056      	move.l 86(sp),-(sp)
    42ca:	4eba 28c8      	jsr 6b94 <TestRow>(pc)
    42ce:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42d2:	722a           	moveq #42,d1
    42d4:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    42d8:	4878 0007      	pea 7 <_start+0x7>
    42dc:	42a7           	clr.l -(sp)
    42de:	2f2f 01d0      	move.l 464(sp),-(sp)
    42e2:	2f2f 0056      	move.l 86(sp),-(sp)
    42e6:	4eba 28ac      	jsr 6b94 <TestRow>(pc)
    42ea:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42ee:	702a           	moveq #42,d0
    42f0:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    42f4:	4878 0008      	pea 8 <_start+0x8>
    42f8:	2f3c 0000 ffff 	move.l #65535,-(sp)
    42fe:	2f2f 01d0      	move.l 464(sp),-(sp)
    4302:	2f2f 0056      	move.l 86(sp),-(sp)
    4306:	4eba 288c      	jsr 6b94 <TestRow>(pc)
    430a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    430e:	722a           	moveq #42,d1
    4310:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    4314:	4878 0009      	pea 9 <_start+0x9>
    4318:	2f3c 0000 ffff 	move.l #65535,-(sp)
    431e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4322:	2f2f 0056      	move.l 86(sp),-(sp)
    4326:	4eba 286c      	jsr 6b94 <TestRow>(pc)
    432a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    432e:	702a           	moveq #42,d0
    4330:	d1af 01c8      	add.l d0,456(sp)

  mask = 0x0000;
    4334:	426f 01c6      	clr.w 454(sp)
  for(int i=0;i<12;i++) {
    4338:	42af 01a2      	clr.l 418(sp)
    433c:	6000 01a6      	bra.w 44e4 <TestZoom4Picture+0x7b2>
    for(int i2=0;i2<15;i2++) {  
    4340:	42af 019e      	clr.l 414(sp)
    4344:	6042           	bra.s 4388 <TestZoom4Picture+0x656>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    4346:	222f 01a2      	move.l 418(sp),d1
    434a:	2001           	move.l d1,d0
    434c:	d080           	add.l d0,d0
    434e:	d081           	add.l d1,d0
    4350:	2200           	move.l d0,d1
    4352:	e789           	lsl.l #3,d1
    4354:	9280           	sub.l d0,d1
    4356:	2041           	movea.l d1,a0
    4358:	d1ef 019e      	adda.l 414(sp),a0
    435c:	41e8 0009      	lea 9(a0),a0
    4360:	7000           	moveq #0,d0
    4362:	302f 01c6      	move.w 454(sp),d0
    4366:	2f08           	move.l a0,-(sp)
    4368:	2f00           	move.l d0,-(sp)
    436a:	2f2f 01d0      	move.l 464(sp),-(sp)
    436e:	2f2f 0056      	move.l 86(sp),-(sp)
    4372:	4eba 2820      	jsr 6b94 <TestRow>(pc)
    4376:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    437a:	722a           	moveq #42,d1
    437c:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4380:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {  
    4384:	52af 019e      	addq.l #1,414(sp)
    4388:	700e           	moveq #14,d0
    438a:	b0af 019e      	cmp.l 414(sp),d0
    438e:	6cb6           	bge.s 4346 <TestZoom4Picture+0x614>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    4390:	222f 01a2      	move.l 418(sp),d1
    4394:	2001           	move.l d1,d0
    4396:	d080           	add.l d0,d0
    4398:	d081           	add.l d1,d0
    439a:	2200           	move.l d0,d1
    439c:	e789           	lsl.l #3,d1
    439e:	2041           	movea.l d1,a0
    43a0:	91c0           	suba.l d0,a0
    43a2:	41e8 0018      	lea 24(a0),a0
    43a6:	7000           	moveq #0,d0
    43a8:	302f 01c6      	move.w 454(sp),d0
    43ac:	2f08           	move.l a0,-(sp)
    43ae:	2f00           	move.l d0,-(sp)
    43b0:	2f2f 01d0      	move.l 464(sp),-(sp)
    43b4:	2f2f 0056      	move.l 86(sp),-(sp)
    43b8:	4eba 27da      	jsr 6b94 <TestRow>(pc)
    43bc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43c0:	722a           	moveq #42,d1
    43c2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    43c6:	222f 01a2      	move.l 418(sp),d1
    43ca:	2001           	move.l d1,d0
    43cc:	d080           	add.l d0,d0
    43ce:	d081           	add.l d1,d0
    43d0:	2200           	move.l d0,d1
    43d2:	e789           	lsl.l #3,d1
    43d4:	2041           	movea.l d1,a0
    43d6:	91c0           	suba.l d0,a0
    43d8:	41e8 0019      	lea 25(a0),a0
    43dc:	7000           	moveq #0,d0
    43de:	302f 01c6      	move.w 454(sp),d0
    43e2:	2f08           	move.l a0,-(sp)
    43e4:	2f00           	move.l d0,-(sp)
    43e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    43ea:	2f2f 0056      	move.l 86(sp),-(sp)
    43ee:	4eba 27a4      	jsr 6b94 <TestRow>(pc)
    43f2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43f6:	702a           	moveq #42,d0
    43f8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    43fc:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    4400:	222f 01a2      	move.l 418(sp),d1
    4404:	2001           	move.l d1,d0
    4406:	d080           	add.l d0,d0
    4408:	d081           	add.l d1,d0
    440a:	2200           	move.l d0,d1
    440c:	e789           	lsl.l #3,d1
    440e:	2041           	movea.l d1,a0
    4410:	91c0           	suba.l d0,a0
    4412:	41e8 001a      	lea 26(a0),a0
    4416:	7000           	moveq #0,d0
    4418:	302f 01c6      	move.w 454(sp),d0
    441c:	2f08           	move.l a0,-(sp)
    441e:	2f00           	move.l d0,-(sp)
    4420:	2f2f 01d0      	move.l 464(sp),-(sp)
    4424:	2f2f 0056      	move.l 86(sp),-(sp)
    4428:	4eba 276a      	jsr 6b94 <TestRow>(pc)
    442c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4430:	722a           	moveq #42,d1
    4432:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    4436:	222f 01a2      	move.l 418(sp),d1
    443a:	2001           	move.l d1,d0
    443c:	d080           	add.l d0,d0
    443e:	d081           	add.l d1,d0
    4440:	2200           	move.l d0,d1
    4442:	e789           	lsl.l #3,d1
    4444:	2041           	movea.l d1,a0
    4446:	91c0           	suba.l d0,a0
    4448:	41e8 001b      	lea 27(a0),a0
    444c:	7000           	moveq #0,d0
    444e:	302f 01c6      	move.w 454(sp),d0
    4452:	2f08           	move.l a0,-(sp)
    4454:	2f00           	move.l d0,-(sp)
    4456:	2f2f 01d0      	move.l 464(sp),-(sp)
    445a:	2f2f 0056      	move.l 86(sp),-(sp)
    445e:	4eba 2734      	jsr 6b94 <TestRow>(pc)
    4462:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4466:	702a           	moveq #42,d0
    4468:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    446c:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4470:	222f 01a2      	move.l 418(sp),d1
    4474:	2001           	move.l d1,d0
    4476:	d080           	add.l d0,d0
    4478:	d081           	add.l d1,d0
    447a:	2200           	move.l d0,d1
    447c:	e789           	lsl.l #3,d1
    447e:	2041           	movea.l d1,a0
    4480:	91c0           	suba.l d0,a0
    4482:	41e8 001c      	lea 28(a0),a0
    4486:	7000           	moveq #0,d0
    4488:	302f 01c6      	move.w 454(sp),d0
    448c:	2f08           	move.l a0,-(sp)
    448e:	2f00           	move.l d0,-(sp)
    4490:	2f2f 01d0      	move.l 464(sp),-(sp)
    4494:	2f2f 0056      	move.l 86(sp),-(sp)
    4498:	4eba 26fa      	jsr 6b94 <TestRow>(pc)
    449c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    44a0:	722a           	moveq #42,d1
    44a2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    44a6:	222f 01a2      	move.l 418(sp),d1
    44aa:	2001           	move.l d1,d0
    44ac:	d080           	add.l d0,d0
    44ae:	d081           	add.l d1,d0
    44b0:	2200           	move.l d0,d1
    44b2:	e789           	lsl.l #3,d1
    44b4:	2041           	movea.l d1,a0
    44b6:	91c0           	suba.l d0,a0
    44b8:	41e8 001d      	lea 29(a0),a0
    44bc:	7000           	moveq #0,d0
    44be:	302f 01c6      	move.w 454(sp),d0
    44c2:	2f08           	move.l a0,-(sp)
    44c4:	2f00           	move.l d0,-(sp)
    44c6:	2f2f 01d0      	move.l 464(sp),-(sp)
    44ca:	2f2f 0056      	move.l 86(sp),-(sp)
    44ce:	4eba 26c4      	jsr 6b94 <TestRow>(pc)
    44d2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    44d6:	702a           	moveq #42,d0
    44d8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    44dc:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    44e0:	52af 01a2      	addq.l #1,418(sp)
    44e4:	720b           	moveq #11,d1
    44e6:	b2af 01a2      	cmp.l 418(sp),d1
    44ea:	6c00 fe54      	bge.w 4340 <TestZoom4Picture+0x60e>
  }

  for(int i2=0;i2<8;i2++) {  
    44ee:	42af 019a      	clr.l 410(sp)
    44f2:	6032           	bra.s 4526 <TestZoom4Picture+0x7f4>
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    44f4:	222f 019a      	move.l 410(sp),d1
    44f8:	0681 0000 0105 	addi.l #261,d1
    44fe:	7000           	moveq #0,d0
    4500:	302f 01c6      	move.w 454(sp),d0
    4504:	2f01           	move.l d1,-(sp)
    4506:	2f00           	move.l d0,-(sp)
    4508:	2f2f 01d0      	move.l 464(sp),-(sp)
    450c:	2f2f 0056      	move.l 86(sp),-(sp)
    4510:	4eba 2682      	jsr 6b94 <TestRow>(pc)
    4514:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4518:	702a           	moveq #42,d0
    451a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    451e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    4522:	52af 019a      	addq.l #1,410(sp)
    4526:	7207           	moveq #7,d1
    4528:	b2af 019a      	cmp.l 410(sp),d1
    452c:	6cc6           	bge.s 44f4 <TestZoom4Picture+0x7c2>
  }

  tmp = source;
    452e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4534:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    453a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    4540:	4878 0001      	pea 1 <_start+0x1>
    4544:	4878 0003      	pea 3 <_start+0x3>
    4548:	2f2f 0056      	move.l 86(sp),-(sp)
    454c:	2f2f 006a      	move.l 106(sp),-(sp)
    4550:	4eba d590      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    4554:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4558:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    455e:	2c40           	movea.l d0,a6
    4560:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4564:	202f 004e      	move.l 78(sp),d0
    4568:	5880           	addq.l #4,d0
    456a:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom4;
    456e:	2f7c 0000 bba0 	move.l #48032,74(sp)
    4574:	004a 
  mask = 0x0000;
    4576:	426f 01c6      	clr.w 454(sp)
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    457a:	4878 0007      	pea 7 <_start+0x7>
    457e:	42a7           	clr.l -(sp)
    4580:	2f2f 01d0      	move.l 464(sp),-(sp)
    4584:	2f2f 0056      	move.l 86(sp),-(sp)
    4588:	4eba 260a      	jsr 6b94 <TestRow>(pc)
    458c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4590:	722a           	moveq #42,d1
    4592:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    4596:	4878 0008      	pea 8 <_start+0x8>
    459a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    45a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    45a4:	2f2f 0056      	move.l 86(sp),-(sp)
    45a8:	4eba 25ea      	jsr 6b94 <TestRow>(pc)
    45ac:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    45b0:	702a           	moveq #42,d0
    45b2:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    45b6:	4878 0009      	pea 9 <_start+0x9>
    45ba:	2f3c 0000 ffff 	move.l #65535,-(sp)
    45c0:	2f2f 01d0      	move.l 464(sp),-(sp)
    45c4:	2f2f 0056      	move.l 86(sp),-(sp)
    45c8:	4eba 25ca      	jsr 6b94 <TestRow>(pc)
    45cc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    45d0:	722a           	moveq #42,d1
    45d2:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    45d6:	4878 0008      	pea 8 <_start+0x8>
    45da:	42a7           	clr.l -(sp)
    45dc:	2f2f 01d0      	move.l 464(sp),-(sp)
    45e0:	2f2f 0056      	move.l 86(sp),-(sp)
    45e4:	4eba 25ae      	jsr 6b94 <TestRow>(pc)
    45e8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    45ec:	702a           	moveq #42,d0
    45ee:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    45f2:	4878 0009      	pea 9 <_start+0x9>
    45f6:	42a7           	clr.l -(sp)
    45f8:	2f2f 01d0      	move.l 464(sp),-(sp)
    45fc:	2f2f 0056      	move.l 86(sp),-(sp)
    4600:	4eba 2592      	jsr 6b94 <TestRow>(pc)
    4604:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4608:	722a           	moveq #42,d1
    460a:	d3af 01c8      	add.l d1,456(sp)

  mask = 0xffff;
    460e:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<12;i++) {
    4614:	42af 0196      	clr.l 406(sp)
    4618:	6000 0216      	bra.w 4830 <TestZoom4Picture+0xafe>
    for(int i2=0;i2<14;i2++) {  
    461c:	42af 0192      	clr.l 402(sp)
    4620:	6042           	bra.s 4664 <TestZoom4Picture+0x932>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    4622:	222f 0196      	move.l 406(sp),d1
    4626:	2001           	move.l d1,d0
    4628:	d080           	add.l d0,d0
    462a:	d081           	add.l d1,d0
    462c:	2200           	move.l d0,d1
    462e:	e789           	lsl.l #3,d1
    4630:	9280           	sub.l d0,d1
    4632:	2041           	movea.l d1,a0
    4634:	d1ef 0192      	adda.l 402(sp),a0
    4638:	41e8 0009      	lea 9(a0),a0
    463c:	7000           	moveq #0,d0
    463e:	302f 01c6      	move.w 454(sp),d0
    4642:	2f08           	move.l a0,-(sp)
    4644:	2f00           	move.l d0,-(sp)
    4646:	2f2f 01d0      	move.l 464(sp),-(sp)
    464a:	2f2f 0056      	move.l 86(sp),-(sp)
    464e:	4eba 2544      	jsr 6b94 <TestRow>(pc)
    4652:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4656:	702a           	moveq #42,d0
    4658:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    465c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {  
    4660:	52af 0192      	addq.l #1,402(sp)
    4664:	720d           	moveq #13,d1
    4666:	b2af 0192      	cmp.l 402(sp),d1
    466a:	6cb6           	bge.s 4622 <TestZoom4Picture+0x8f0>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    466c:	222f 0196      	move.l 406(sp),d1
    4670:	2001           	move.l d1,d0
    4672:	d080           	add.l d0,d0
    4674:	d081           	add.l d1,d0
    4676:	2200           	move.l d0,d1
    4678:	e789           	lsl.l #3,d1
    467a:	2041           	movea.l d1,a0
    467c:	91c0           	suba.l d0,a0
    467e:	41e8 0018      	lea 24(a0),a0
    4682:	7000           	moveq #0,d0
    4684:	302f 01c6      	move.w 454(sp),d0
    4688:	2f08           	move.l a0,-(sp)
    468a:	2f00           	move.l d0,-(sp)
    468c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4690:	2f2f 0056      	move.l 86(sp),-(sp)
    4694:	4eba 24fe      	jsr 6b94 <TestRow>(pc)
    4698:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    469c:	702a           	moveq #42,d0
    469e:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    46a2:	222f 0196      	move.l 406(sp),d1
    46a6:	2001           	move.l d1,d0
    46a8:	d080           	add.l d0,d0
    46aa:	d081           	add.l d1,d0
    46ac:	2200           	move.l d0,d1
    46ae:	e789           	lsl.l #3,d1
    46b0:	2041           	movea.l d1,a0
    46b2:	91c0           	suba.l d0,a0
    46b4:	41e8 0019      	lea 25(a0),a0
    46b8:	7000           	moveq #0,d0
    46ba:	302f 01c6      	move.w 454(sp),d0
    46be:	2f08           	move.l a0,-(sp)
    46c0:	2f00           	move.l d0,-(sp)
    46c2:	2f2f 01d0      	move.l 464(sp),-(sp)
    46c6:	2f2f 0056      	move.l 86(sp),-(sp)
    46ca:	4eba 24c8      	jsr 6b94 <TestRow>(pc)
    46ce:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46d2:	722a           	moveq #42,d1
    46d4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    46d8:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    46dc:	222f 0196      	move.l 406(sp),d1
    46e0:	2001           	move.l d1,d0
    46e2:	d080           	add.l d0,d0
    46e4:	d081           	add.l d1,d0
    46e6:	2200           	move.l d0,d1
    46e8:	e789           	lsl.l #3,d1
    46ea:	2041           	movea.l d1,a0
    46ec:	91c0           	suba.l d0,a0
    46ee:	41e8 001a      	lea 26(a0),a0
    46f2:	7000           	moveq #0,d0
    46f4:	302f 01c6      	move.w 454(sp),d0
    46f8:	2f08           	move.l a0,-(sp)
    46fa:	2f00           	move.l d0,-(sp)
    46fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4700:	2f2f 0056      	move.l 86(sp),-(sp)
    4704:	4eba 248e      	jsr 6b94 <TestRow>(pc)
    4708:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    470c:	702a           	moveq #42,d0
    470e:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    4712:	222f 0196      	move.l 406(sp),d1
    4716:	2001           	move.l d1,d0
    4718:	d080           	add.l d0,d0
    471a:	d081           	add.l d1,d0
    471c:	2200           	move.l d0,d1
    471e:	e789           	lsl.l #3,d1
    4720:	2041           	movea.l d1,a0
    4722:	91c0           	suba.l d0,a0
    4724:	41e8 001b      	lea 27(a0),a0
    4728:	7000           	moveq #0,d0
    472a:	302f 01c6      	move.w 454(sp),d0
    472e:	2f08           	move.l a0,-(sp)
    4730:	2f00           	move.l d0,-(sp)
    4732:	2f2f 01d0      	move.l 464(sp),-(sp)
    4736:	2f2f 0056      	move.l 86(sp),-(sp)
    473a:	4eba 2458      	jsr 6b94 <TestRow>(pc)
    473e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4742:	722a           	moveq #42,d1
    4744:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4748:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    474c:	222f 0196      	move.l 406(sp),d1
    4750:	2001           	move.l d1,d0
    4752:	d080           	add.l d0,d0
    4754:	d081           	add.l d1,d0
    4756:	2200           	move.l d0,d1
    4758:	e789           	lsl.l #3,d1
    475a:	2041           	movea.l d1,a0
    475c:	91c0           	suba.l d0,a0
    475e:	41e8 001c      	lea 28(a0),a0
    4762:	7000           	moveq #0,d0
    4764:	302f 01c6      	move.w 454(sp),d0
    4768:	2f08           	move.l a0,-(sp)
    476a:	2f00           	move.l d0,-(sp)
    476c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4770:	2f2f 0056      	move.l 86(sp),-(sp)
    4774:	4eba 241e      	jsr 6b94 <TestRow>(pc)
    4778:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    477c:	702a           	moveq #42,d0
    477e:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4782:	222f 0196      	move.l 406(sp),d1
    4786:	2001           	move.l d1,d0
    4788:	d080           	add.l d0,d0
    478a:	d081           	add.l d1,d0
    478c:	2200           	move.l d0,d1
    478e:	e789           	lsl.l #3,d1
    4790:	2041           	movea.l d1,a0
    4792:	91c0           	suba.l d0,a0
    4794:	41e8 001d      	lea 29(a0),a0
    4798:	7000           	moveq #0,d0
    479a:	302f 01c6      	move.w 454(sp),d0
    479e:	2f08           	move.l a0,-(sp)
    47a0:	2f00           	move.l d0,-(sp)
    47a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    47a6:	2f2f 0056      	move.l 86(sp),-(sp)
    47aa:	4eba 23e8      	jsr 6b94 <TestRow>(pc)
    47ae:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    47b2:	722a           	moveq #42,d1
    47b4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    47b8:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    47bc:	222f 0196      	move.l 406(sp),d1
    47c0:	2001           	move.l d1,d0
    47c2:	d080           	add.l d0,d0
    47c4:	d081           	add.l d1,d0
    47c6:	2200           	move.l d0,d1
    47c8:	e789           	lsl.l #3,d1
    47ca:	2041           	movea.l d1,a0
    47cc:	91c0           	suba.l d0,a0
    47ce:	41e8 001c      	lea 28(a0),a0
    47d2:	7000           	moveq #0,d0
    47d4:	302f 01c6      	move.w 454(sp),d0
    47d8:	2f08           	move.l a0,-(sp)
    47da:	2f00           	move.l d0,-(sp)
    47dc:	2f2f 01d0      	move.l 464(sp),-(sp)
    47e0:	2f2f 0056      	move.l 86(sp),-(sp)
    47e4:	4eba 23ae      	jsr 6b94 <TestRow>(pc)
    47e8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    47ec:	702a           	moveq #42,d0
    47ee:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    47f2:	222f 0196      	move.l 406(sp),d1
    47f6:	2001           	move.l d1,d0
    47f8:	d080           	add.l d0,d0
    47fa:	d081           	add.l d1,d0
    47fc:	2200           	move.l d0,d1
    47fe:	e789           	lsl.l #3,d1
    4800:	2041           	movea.l d1,a0
    4802:	91c0           	suba.l d0,a0
    4804:	41e8 001d      	lea 29(a0),a0
    4808:	7000           	moveq #0,d0
    480a:	302f 01c6      	move.w 454(sp),d0
    480e:	2f08           	move.l a0,-(sp)
    4810:	2f00           	move.l d0,-(sp)
    4812:	2f2f 01d0      	move.l 464(sp),-(sp)
    4816:	2f2f 0056      	move.l 86(sp),-(sp)
    481a:	4eba 2378      	jsr 6b94 <TestRow>(pc)
    481e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4822:	722a           	moveq #42,d1
    4824:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4828:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    482c:	52af 0196      	addq.l #1,406(sp)
    4830:	700b           	moveq #11,d0
    4832:	b0af 0196      	cmp.l 406(sp),d0
    4836:	6c00 fde4      	bge.w 461c <TestZoom4Picture+0x8ea>
  }

  TestRow( valsupposed, valactual, mask, 269);
    483a:	7000           	moveq #0,d0
    483c:	302f 01c6      	move.w 454(sp),d0
    4840:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4844:	2f00           	move.l d0,-(sp)
    4846:	2f2f 01d0      	move.l 464(sp),-(sp)
    484a:	2f2f 0056      	move.l 86(sp),-(sp)
    484e:	4eba 2344      	jsr 6b94 <TestRow>(pc)
    4852:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4856:	722a           	moveq #42,d1
    4858:	d3af 01c8      	add.l d1,456(sp)
  
  tmp = source;
    485c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4862:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4868:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    486e:	4878 0001      	pea 1 <_start+0x1>
    4872:	4878 0004      	pea 4 <_start+0x4>
    4876:	2f2f 0056      	move.l 86(sp),-(sp)
    487a:	2f2f 006a      	move.l 106(sp),-(sp)
    487e:	4eba d262      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    4882:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4886:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    488c:	2c40           	movea.l d0,a6
    488e:	4eae ff1c      	jsr -228(a6)

  valactual = destination+2; 
    4892:	202f 004e      	move.l 78(sp),d0
    4896:	5880           	addq.l #4,d0
    4898:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom5;
    489c:	2f7c 0000 bbcc 	move.l #48076,74(sp)
    48a2:	004a 
  mask = 0x0000;
    48a4:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<13;i2++) {  
    48a8:	42af 018e      	clr.l 398(sp)
    48ac:	602a           	bra.s 48d8 <TestZoom4Picture+0xba6>
    TestRow( valsupposed, valactual, mask, i2);
    48ae:	7000           	moveq #0,d0
    48b0:	302f 01c6      	move.w 454(sp),d0
    48b4:	2f2f 018e      	move.l 398(sp),-(sp)
    48b8:	2f00           	move.l d0,-(sp)
    48ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    48be:	2f2f 0056      	move.l 86(sp),-(sp)
    48c2:	4eba 22d0      	jsr 6b94 <TestRow>(pc)
    48c6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    48ca:	722a           	moveq #42,d1
    48cc:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    48d0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    48d4:	52af 018e      	addq.l #1,398(sp)
    48d8:	700c           	moveq #12,d0
    48da:	b0af 018e      	cmp.l 398(sp),d0
    48de:	6cce           	bge.s 48ae <TestZoom4Picture+0xb7c>
  }

  TestRow( valsupposed, valactual, mask, 12);   
    48e0:	7000           	moveq #0,d0
    48e2:	302f 01c6      	move.w 454(sp),d0
    48e6:	4878 000c      	pea c <_start+0xc>
    48ea:	2f00           	move.l d0,-(sp)
    48ec:	2f2f 01d0      	move.l 464(sp),-(sp)
    48f0:	2f2f 0056      	move.l 86(sp),-(sp)
    48f4:	4eba 229e      	jsr 6b94 <TestRow>(pc)
    48f8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48fc:	722a           	moveq #42,d1
    48fe:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 13);
    4902:	7000           	moveq #0,d0
    4904:	302f 01c6      	move.w 454(sp),d0
    4908:	4878 000d      	pea d <_start+0xd>
    490c:	2f00           	move.l d0,-(sp)
    490e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4912:	2f2f 0056      	move.l 86(sp),-(sp)
    4916:	4eba 227c      	jsr 6b94 <TestRow>(pc)
    491a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    491e:	702a           	moveq #42,d0
    4920:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4924:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 14);
    4928:	7000           	moveq #0,d0
    492a:	302f 01c6      	move.w 454(sp),d0
    492e:	4878 000e      	pea e <_start+0xe>
    4932:	2f00           	move.l d0,-(sp)
    4934:	2f2f 01d0      	move.l 464(sp),-(sp)
    4938:	2f2f 0056      	move.l 86(sp),-(sp)
    493c:	4eba 2256      	jsr 6b94 <TestRow>(pc)
    4940:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4944:	722a           	moveq #42,d1
    4946:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 15);
    494a:	7000           	moveq #0,d0
    494c:	302f 01c6      	move.w 454(sp),d0
    4950:	4878 000f      	pea f <_start+0xf>
    4954:	2f00           	move.l d0,-(sp)
    4956:	2f2f 01d0      	move.l 464(sp),-(sp)
    495a:	2f2f 0056      	move.l 86(sp),-(sp)
    495e:	4eba 2234      	jsr 6b94 <TestRow>(pc)
    4962:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4966:	702a           	moveq #42,d0
    4968:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    496c:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 16);
    4970:	7000           	moveq #0,d0
    4972:	302f 01c6      	move.w 454(sp),d0
    4976:	4878 0010      	pea 10 <_start+0x10>
    497a:	2f00           	move.l d0,-(sp)
    497c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4980:	2f2f 0056      	move.l 86(sp),-(sp)
    4984:	4eba 220e      	jsr 6b94 <TestRow>(pc)
    4988:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    498c:	722a           	moveq #42,d1
    498e:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 17);
    4992:	7000           	moveq #0,d0
    4994:	302f 01c6      	move.w 454(sp),d0
    4998:	4878 0011      	pea 11 <_start+0x11>
    499c:	2f00           	move.l d0,-(sp)
    499e:	2f2f 01d0      	move.l 464(sp),-(sp)
    49a2:	2f2f 0056      	move.l 86(sp),-(sp)
    49a6:	4eba 21ec      	jsr 6b94 <TestRow>(pc)
    49aa:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49ae:	702a           	moveq #42,d0
    49b0:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    49b4:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 18);
    49b8:	7000           	moveq #0,d0
    49ba:	302f 01c6      	move.w 454(sp),d0
    49be:	4878 0012      	pea 12 <_start+0x12>
    49c2:	2f00           	move.l d0,-(sp)
    49c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    49c8:	2f2f 0056      	move.l 86(sp),-(sp)
    49cc:	4eba 21c6      	jsr 6b94 <TestRow>(pc)
    49d0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49d4:	722a           	moveq #42,d1
    49d6:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 19);
    49da:	7000           	moveq #0,d0
    49dc:	302f 01c6      	move.w 454(sp),d0
    49e0:	4878 0013      	pea 13 <_start+0x13>
    49e4:	2f00           	move.l d0,-(sp)
    49e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    49ea:	2f2f 0056      	move.l 86(sp),-(sp)
    49ee:	4eba 21a4      	jsr 6b94 <TestRow>(pc)
    49f2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49f6:	702a           	moveq #42,d0
    49f8:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    49fc:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 20);
    4a00:	7000           	moveq #0,d0
    4a02:	302f 01c6      	move.w 454(sp),d0
    4a06:	4878 0014      	pea 14 <_start+0x14>
    4a0a:	2f00           	move.l d0,-(sp)
    4a0c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a10:	2f2f 0056      	move.l 86(sp),-(sp)
    4a14:	4eba 217e      	jsr 6b94 <TestRow>(pc)
    4a18:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a1c:	722a           	moveq #42,d1
    4a1e:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 21);
    4a22:	7000           	moveq #0,d0
    4a24:	302f 01c6      	move.w 454(sp),d0
    4a28:	4878 0015      	pea 15 <_start+0x15>
    4a2c:	2f00           	move.l d0,-(sp)
    4a2e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a32:	2f2f 0056      	move.l 86(sp),-(sp)
    4a36:	4eba 215c      	jsr 6b94 <TestRow>(pc)
    4a3a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a3e:	702a           	moveq #42,d0
    4a40:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4a44:	466f 01c6      	not.w 454(sp)


  for(int i=0;i<10;i++) {
    4a48:	42af 018a      	clr.l 394(sp)
    4a4c:	6000 0286      	bra.w 4cd4 <TestZoom4Picture+0xfa2>
    for(int i2=0;i2<13;i2++) {  
    4a50:	42af 0186      	clr.l 390(sp)
    4a54:	6042           	bra.s 4a98 <TestZoom4Picture+0xd66>
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    4a56:	222f 018a      	move.l 394(sp),d1
    4a5a:	2001           	move.l d1,d0
    4a5c:	d080           	add.l d0,d0
    4a5e:	d081           	add.l d1,d0
    4a60:	2200           	move.l d0,d1
    4a62:	e789           	lsl.l #3,d1
    4a64:	9280           	sub.l d0,d1
    4a66:	2041           	movea.l d1,a0
    4a68:	d1ef 0186      	adda.l 390(sp),a0
    4a6c:	41e8 0016      	lea 22(a0),a0
    4a70:	7000           	moveq #0,d0
    4a72:	302f 01c6      	move.w 454(sp),d0
    4a76:	2f08           	move.l a0,-(sp)
    4a78:	2f00           	move.l d0,-(sp)
    4a7a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a7e:	2f2f 0056      	move.l 86(sp),-(sp)
    4a82:	4eba 2110      	jsr 6b94 <TestRow>(pc)
    4a86:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4a8a:	722a           	moveq #42,d1
    4a8c:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4a90:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {  
    4a94:	52af 0186      	addq.l #1,390(sp)
    4a98:	700c           	moveq #12,d0
    4a9a:	b0af 0186      	cmp.l 390(sp),d0
    4a9e:	6cb6           	bge.s 4a56 <TestZoom4Picture+0xd24>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    4aa0:	222f 018a      	move.l 394(sp),d1
    4aa4:	2001           	move.l d1,d0
    4aa6:	d080           	add.l d0,d0
    4aa8:	d081           	add.l d1,d0
    4aaa:	2200           	move.l d0,d1
    4aac:	e789           	lsl.l #3,d1
    4aae:	2041           	movea.l d1,a0
    4ab0:	91c0           	suba.l d0,a0
    4ab2:	41e8 0023      	lea 35(a0),a0
    4ab6:	7000           	moveq #0,d0
    4ab8:	302f 01c6      	move.w 454(sp),d0
    4abc:	2f08           	move.l a0,-(sp)
    4abe:	2f00           	move.l d0,-(sp)
    4ac0:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ac4:	2f2f 0056      	move.l 86(sp),-(sp)
    4ac8:	4eba 20ca      	jsr 6b94 <TestRow>(pc)
    4acc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ad0:	722a           	moveq #42,d1
    4ad2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    4ad6:	222f 018a      	move.l 394(sp),d1
    4ada:	2001           	move.l d1,d0
    4adc:	d080           	add.l d0,d0
    4ade:	d081           	add.l d1,d0
    4ae0:	2200           	move.l d0,d1
    4ae2:	e789           	lsl.l #3,d1
    4ae4:	2041           	movea.l d1,a0
    4ae6:	91c0           	suba.l d0,a0
    4ae8:	41e8 0024      	lea 36(a0),a0
    4aec:	7000           	moveq #0,d0
    4aee:	302f 01c6      	move.w 454(sp),d0
    4af2:	2f08           	move.l a0,-(sp)
    4af4:	2f00           	move.l d0,-(sp)
    4af6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4afa:	2f2f 0056      	move.l 86(sp),-(sp)
    4afe:	4eba 2094      	jsr 6b94 <TestRow>(pc)
    4b02:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b06:	702a           	moveq #42,d0
    4b08:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b0c:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    4b10:	222f 018a      	move.l 394(sp),d1
    4b14:	2001           	move.l d1,d0
    4b16:	d080           	add.l d0,d0
    4b18:	d081           	add.l d1,d0
    4b1a:	2200           	move.l d0,d1
    4b1c:	e789           	lsl.l #3,d1
    4b1e:	2041           	movea.l d1,a0
    4b20:	91c0           	suba.l d0,a0
    4b22:	41e8 0025      	lea 37(a0),a0
    4b26:	7000           	moveq #0,d0
    4b28:	302f 01c6      	move.w 454(sp),d0
    4b2c:	2f08           	move.l a0,-(sp)
    4b2e:	2f00           	move.l d0,-(sp)
    4b30:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b34:	2f2f 0056      	move.l 86(sp),-(sp)
    4b38:	4eba 205a      	jsr 6b94 <TestRow>(pc)
    4b3c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b40:	722a           	moveq #42,d1
    4b42:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    4b46:	222f 018a      	move.l 394(sp),d1
    4b4a:	2001           	move.l d1,d0
    4b4c:	d080           	add.l d0,d0
    4b4e:	d081           	add.l d1,d0
    4b50:	2200           	move.l d0,d1
    4b52:	e789           	lsl.l #3,d1
    4b54:	2041           	movea.l d1,a0
    4b56:	91c0           	suba.l d0,a0
    4b58:	41e8 0026      	lea 38(a0),a0
    4b5c:	7000           	moveq #0,d0
    4b5e:	302f 01c6      	move.w 454(sp),d0
    4b62:	2f08           	move.l a0,-(sp)
    4b64:	2f00           	move.l d0,-(sp)
    4b66:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b6a:	2f2f 0056      	move.l 86(sp),-(sp)
    4b6e:	4eba 2024      	jsr 6b94 <TestRow>(pc)
    4b72:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b76:	702a           	moveq #42,d0
    4b78:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b7c:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    4b80:	222f 018a      	move.l 394(sp),d1
    4b84:	2001           	move.l d1,d0
    4b86:	d080           	add.l d0,d0
    4b88:	d081           	add.l d1,d0
    4b8a:	2200           	move.l d0,d1
    4b8c:	e789           	lsl.l #3,d1
    4b8e:	2041           	movea.l d1,a0
    4b90:	91c0           	suba.l d0,a0
    4b92:	41e8 0027      	lea 39(a0),a0
    4b96:	7000           	moveq #0,d0
    4b98:	302f 01c6      	move.w 454(sp),d0
    4b9c:	2f08           	move.l a0,-(sp)
    4b9e:	2f00           	move.l d0,-(sp)
    4ba0:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ba4:	2f2f 0056      	move.l 86(sp),-(sp)
    4ba8:	4eba 1fea      	jsr 6b94 <TestRow>(pc)
    4bac:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4bb0:	722a           	moveq #42,d1
    4bb2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    4bb6:	222f 018a      	move.l 394(sp),d1
    4bba:	2001           	move.l d1,d0
    4bbc:	d080           	add.l d0,d0
    4bbe:	d081           	add.l d1,d0
    4bc0:	2200           	move.l d0,d1
    4bc2:	e789           	lsl.l #3,d1
    4bc4:	2041           	movea.l d1,a0
    4bc6:	91c0           	suba.l d0,a0
    4bc8:	41e8 0028      	lea 40(a0),a0
    4bcc:	7000           	moveq #0,d0
    4bce:	302f 01c6      	move.w 454(sp),d0
    4bd2:	2f08           	move.l a0,-(sp)
    4bd4:	2f00           	move.l d0,-(sp)
    4bd6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bda:	2f2f 0056      	move.l 86(sp),-(sp)
    4bde:	4eba 1fb4      	jsr 6b94 <TestRow>(pc)
    4be2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4be6:	702a           	moveq #42,d0
    4be8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4bec:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    4bf0:	222f 018a      	move.l 394(sp),d1
    4bf4:	2001           	move.l d1,d0
    4bf6:	d080           	add.l d0,d0
    4bf8:	d081           	add.l d1,d0
    4bfa:	2200           	move.l d0,d1
    4bfc:	e789           	lsl.l #3,d1
    4bfe:	2041           	movea.l d1,a0
    4c00:	91c0           	suba.l d0,a0
    4c02:	41e8 0029      	lea 41(a0),a0
    4c06:	7000           	moveq #0,d0
    4c08:	302f 01c6      	move.w 454(sp),d0
    4c0c:	2f08           	move.l a0,-(sp)
    4c0e:	2f00           	move.l d0,-(sp)
    4c10:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c14:	2f2f 0056      	move.l 86(sp),-(sp)
    4c18:	4eba 1f7a      	jsr 6b94 <TestRow>(pc)
    4c1c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c20:	722a           	moveq #42,d1
    4c22:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    4c26:	222f 018a      	move.l 394(sp),d1
    4c2a:	2001           	move.l d1,d0
    4c2c:	d080           	add.l d0,d0
    4c2e:	d081           	add.l d1,d0
    4c30:	2200           	move.l d0,d1
    4c32:	e789           	lsl.l #3,d1
    4c34:	2041           	movea.l d1,a0
    4c36:	91c0           	suba.l d0,a0
    4c38:	41e8 002a      	lea 42(a0),a0
    4c3c:	7000           	moveq #0,d0
    4c3e:	302f 01c6      	move.w 454(sp),d0
    4c42:	2f08           	move.l a0,-(sp)
    4c44:	2f00           	move.l d0,-(sp)
    4c46:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c4a:	2f2f 0056      	move.l 86(sp),-(sp)
    4c4e:	4eba 1f44      	jsr 6b94 <TestRow>(pc)
    4c52:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c56:	702a           	moveq #42,d0
    4c58:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c5c:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    4c60:	222f 018a      	move.l 394(sp),d1
    4c64:	2001           	move.l d1,d0
    4c66:	d080           	add.l d0,d0
    4c68:	d081           	add.l d1,d0
    4c6a:	2200           	move.l d0,d1
    4c6c:	e789           	lsl.l #3,d1
    4c6e:	2041           	movea.l d1,a0
    4c70:	91c0           	suba.l d0,a0
    4c72:	41e8 002b      	lea 43(a0),a0
    4c76:	7000           	moveq #0,d0
    4c78:	302f 01c6      	move.w 454(sp),d0
    4c7c:	2f08           	move.l a0,-(sp)
    4c7e:	2f00           	move.l d0,-(sp)
    4c80:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c84:	2f2f 0056      	move.l 86(sp),-(sp)
    4c88:	4eba 1f0a      	jsr 6b94 <TestRow>(pc)
    4c8c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c90:	722a           	moveq #42,d1
    4c92:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    4c96:	222f 018a      	move.l 394(sp),d1
    4c9a:	2001           	move.l d1,d0
    4c9c:	d080           	add.l d0,d0
    4c9e:	d081           	add.l d1,d0
    4ca0:	2200           	move.l d0,d1
    4ca2:	e789           	lsl.l #3,d1
    4ca4:	2041           	movea.l d1,a0
    4ca6:	91c0           	suba.l d0,a0
    4ca8:	41e8 002c      	lea 44(a0),a0
    4cac:	7000           	moveq #0,d0
    4cae:	302f 01c6      	move.w 454(sp),d0
    4cb2:	2f08           	move.l a0,-(sp)
    4cb4:	2f00           	move.l d0,-(sp)
    4cb6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cba:	2f2f 0056      	move.l 86(sp),-(sp)
    4cbe:	4eba 1ed4      	jsr 6b94 <TestRow>(pc)
    4cc2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4cc6:	702a           	moveq #42,d0
    4cc8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4ccc:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<10;i++) {
    4cd0:	52af 018a      	addq.l #1,394(sp)
    4cd4:	7209           	moveq #9,d1
    4cd6:	b2af 018a      	cmp.l 394(sp),d1
    4cda:	6c00 fd74      	bge.w 4a50 <TestZoom4Picture+0xd1e>
  }

  for(int i2=0;i2<13;i2++) {  
    4cde:	42af 0182      	clr.l 386(sp)
    4ce2:	6032           	bra.s 4d16 <TestZoom4Picture+0xfe4>
    TestRow( valsupposed, valactual, mask, i2+253);
    4ce4:	222f 0182      	move.l 386(sp),d1
    4ce8:	0681 0000 00fd 	addi.l #253,d1
    4cee:	7000           	moveq #0,d0
    4cf0:	302f 01c6      	move.w 454(sp),d0
    4cf4:	2f01           	move.l d1,-(sp)
    4cf6:	2f00           	move.l d0,-(sp)
    4cf8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cfc:	2f2f 0056      	move.l 86(sp),-(sp)
    4d00:	4eba 1e92      	jsr 6b94 <TestRow>(pc)
    4d04:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d08:	702a           	moveq #42,d0
    4d0a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4d0e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4d12:	52af 0182      	addq.l #1,386(sp)
    4d16:	720c           	moveq #12,d1
    4d18:	b2af 0182      	cmp.l 386(sp),d1
    4d1c:	6cc6           	bge.s 4ce4 <TestZoom4Picture+0xfb2>
  }

  TestRow( valsupposed, valactual, mask, 266);
    4d1e:	7000           	moveq #0,d0
    4d20:	302f 01c6      	move.w 454(sp),d0
    4d24:	4878 010a      	pea 10a <FreeDisplay+0x2a>
    4d28:	2f00           	move.l d0,-(sp)
    4d2a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d2e:	2f2f 0056      	move.l 86(sp),-(sp)
    4d32:	4eba 1e60      	jsr 6b94 <TestRow>(pc)
    4d36:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d3a:	702a           	moveq #42,d0
    4d3c:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 267);
    4d40:	7000           	moveq #0,d0
    4d42:	302f 01c6      	move.w 454(sp),d0
    4d46:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    4d4a:	2f00           	move.l d0,-(sp)
    4d4c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d50:	2f2f 0056      	move.l 86(sp),-(sp)
    4d54:	4eba 1e3e      	jsr 6b94 <TestRow>(pc)
    4d58:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d5c:	722a           	moveq #42,d1
    4d5e:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4d62:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 268);
    4d66:	7000           	moveq #0,d0
    4d68:	302f 01c6      	move.w 454(sp),d0
    4d6c:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    4d70:	2f00           	move.l d0,-(sp)
    4d72:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d76:	2f2f 0056      	move.l 86(sp),-(sp)
    4d7a:	4eba 1e18      	jsr 6b94 <TestRow>(pc)
    4d7e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d82:	702a           	moveq #42,d0
    4d84:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 269);
    4d88:	7000           	moveq #0,d0
    4d8a:	302f 01c6      	move.w 454(sp),d0
    4d8e:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4d92:	2f00           	move.l d0,-(sp)
    4d94:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d98:	2f2f 0056      	move.l 86(sp),-(sp)
    4d9c:	4eba 1df6      	jsr 6b94 <TestRow>(pc)
    4da0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4da4:	722a           	moveq #42,d1
    4da6:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4daa:	466f 01c6      	not.w 454(sp)

  tmp = source;
    4dae:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4db4:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4dba:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    4dc0:	4878 0001      	pea 1 <_start+0x1>
    4dc4:	4878 0005      	pea 5 <_start+0x5>
    4dc8:	2f2f 0056      	move.l 86(sp),-(sp)
    4dcc:	2f2f 006a      	move.l 106(sp),-(sp)
    4dd0:	4eba cd10      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    4dd4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4dd8:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    4dde:	2c40           	movea.l d0,a6
    4de0:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4de4:	202f 004e      	move.l 78(sp),d0
    4de8:	5880           	addq.l #4,d0
    4dea:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom6;
    4dee:	2f7c 0000 bbf8 	move.l #48120,74(sp)
    4df4:	004a 
  mask = 0x0000;
    4df6:	426f 01c6      	clr.w 454(sp)
 
  for(int i2=0;i2<7;i2++) {  
    4dfa:	42af 017e      	clr.l 382(sp)
    4dfe:	602a           	bra.s 4e2a <TestZoom4Picture+0x10f8>
    TestRow( valsupposed, valactual, mask, i2);
    4e00:	7000           	moveq #0,d0
    4e02:	302f 01c6      	move.w 454(sp),d0
    4e06:	2f2f 017e      	move.l 382(sp),-(sp)
    4e0a:	2f00           	move.l d0,-(sp)
    4e0c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e10:	2f2f 0056      	move.l 86(sp),-(sp)
    4e14:	4eba 1d7e      	jsr 6b94 <TestRow>(pc)
    4e18:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e1c:	722a           	moveq #42,d1
    4e1e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4e22:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    4e26:	52af 017e      	addq.l #1,382(sp)
    4e2a:	7006           	moveq #6,d0
    4e2c:	b0af 017e      	cmp.l 382(sp),d0
    4e30:	6cce           	bge.s 4e00 <TestZoom4Picture+0x10ce>
  }

  for(int i=0;i<6;i++) {
    4e32:	42af 017a      	clr.l 378(sp)
    4e36:	605c           	bra.s 4e94 <TestZoom4Picture+0x1162>
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    4e38:	202f 017a      	move.l 378(sp),d0
    4e3c:	d080           	add.l d0,d0
    4e3e:	2200           	move.l d0,d1
    4e40:	5e81           	addq.l #7,d1
    4e42:	7000           	moveq #0,d0
    4e44:	302f 01c6      	move.w 454(sp),d0
    4e48:	2f01           	move.l d1,-(sp)
    4e4a:	2f00           	move.l d0,-(sp)
    4e4c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e50:	2f2f 0056      	move.l 86(sp),-(sp)
    4e54:	4eba 1d3e      	jsr 6b94 <TestRow>(pc)
    4e58:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e5c:	722a           	moveq #42,d1
    4e5e:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    4e62:	202f 017a      	move.l 378(sp),d0
    4e66:	5880           	addq.l #4,d0
    4e68:	d080           	add.l d0,d0
    4e6a:	2200           	move.l d0,d1
    4e6c:	7000           	moveq #0,d0
    4e6e:	302f 01c6      	move.w 454(sp),d0
    4e72:	2f01           	move.l d1,-(sp)
    4e74:	2f00           	move.l d0,-(sp)
    4e76:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e7a:	2f2f 0056      	move.l 86(sp),-(sp)
    4e7e:	4eba 1d14      	jsr 6b94 <TestRow>(pc)
    4e82:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e86:	702a           	moveq #42,d0
    4e88:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4e8c:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<6;i++) {
    4e90:	52af 017a      	addq.l #1,378(sp)
    4e94:	7205           	moveq #5,d1
    4e96:	b2af 017a      	cmp.l 378(sp),d1
    4e9a:	6c9c           	bge.s 4e38 <TestZoom4Picture+0x1106>
  }

  for(int i=0;i<10;i++) {
    4e9c:	42af 0176      	clr.l 374(sp)
    4ea0:	6000 00ce      	bra.w 4f70 <TestZoom4Picture+0x123e>
    for(int i2=0;i2<12;i2++) {  
    4ea4:	42af 0172      	clr.l 370(sp)
    4ea8:	6040           	bra.s 4eea <TestZoom4Picture+0x11b8>
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    4eaa:	307c 0013      	movea.w #19,a0
    4eae:	d1ef 0172      	adda.l 370(sp),a0
    4eb2:	222f 0176      	move.l 374(sp),d1
    4eb6:	2001           	move.l d1,d0
    4eb8:	d080           	add.l d0,d0
    4eba:	d081           	add.l d1,d0
    4ebc:	e788           	lsl.l #3,d0
    4ebe:	2208           	move.l a0,d1
    4ec0:	d280           	add.l d0,d1
    4ec2:	7000           	moveq #0,d0
    4ec4:	302f 01c6      	move.w 454(sp),d0
    4ec8:	2f01           	move.l d1,-(sp)
    4eca:	2f00           	move.l d0,-(sp)
    4ecc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ed0:	2f2f 0056      	move.l 86(sp),-(sp)
    4ed4:	4eba 1cbe      	jsr 6b94 <TestRow>(pc)
    4ed8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4edc:	702a           	moveq #42,d0
    4ede:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4ee2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {  
    4ee6:	52af 0172      	addq.l #1,370(sp)
    4eea:	720b           	moveq #11,d1
    4eec:	b2af 0172      	cmp.l 370(sp),d1
    4ef0:	6cb8           	bge.s 4eaa <TestZoom4Picture+0x1178>
    }
    for(int i=0;i<6;i++) {
    4ef2:	42af 016e      	clr.l 366(sp)
    4ef6:	606c           	bra.s 4f64 <TestZoom4Picture+0x1232>
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    4ef8:	222f 016e      	move.l 366(sp),d1
    4efc:	2001           	move.l d1,d0
    4efe:	d080           	add.l d0,d0
    4f00:	d081           	add.l d1,d0
    4f02:	e788           	lsl.l #3,d0
    4f04:	2040           	movea.l d0,a0
    4f06:	41e8 001f      	lea 31(a0),a0
    4f0a:	7000           	moveq #0,d0
    4f0c:	302f 01c6      	move.w 454(sp),d0
    4f10:	2f08           	move.l a0,-(sp)
    4f12:	2f00           	move.l d0,-(sp)
    4f14:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f18:	2f2f 0056      	move.l 86(sp),-(sp)
    4f1c:	4eba 1c76      	jsr 6b94 <TestRow>(pc)
    4f20:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4f24:	702a           	moveq #42,d0
    4f26:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    4f2a:	222f 016e      	move.l 366(sp),d1
    4f2e:	2001           	move.l d1,d0
    4f30:	d080           	add.l d0,d0
    4f32:	d081           	add.l d1,d0
    4f34:	e788           	lsl.l #3,d0
    4f36:	2040           	movea.l d0,a0
    4f38:	41e8 0020      	lea 32(a0),a0
    4f3c:	7000           	moveq #0,d0
    4f3e:	302f 01c6      	move.w 454(sp),d0
    4f42:	2f08           	move.l a0,-(sp)
    4f44:	2f00           	move.l d0,-(sp)
    4f46:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f4a:	2f2f 0056      	move.l 86(sp),-(sp)
    4f4e:	4eba 1c44      	jsr 6b94 <TestRow>(pc)
    4f52:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4f56:	722a           	moveq #42,d1
    4f58:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4f5c:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<6;i++) {
    4f60:	52af 016e      	addq.l #1,366(sp)
    4f64:	7005           	moveq #5,d0
    4f66:	b0af 016e      	cmp.l 366(sp),d0
    4f6a:	6c8c           	bge.s 4ef8 <TestZoom4Picture+0x11c6>
  for(int i=0;i<10;i++) {
    4f6c:	52af 0176      	addq.l #1,374(sp)
    4f70:	7209           	moveq #9,d1
    4f72:	b2af 0176      	cmp.l 374(sp),d1
    4f76:	6c00 ff2c      	bge.w 4ea4 <TestZoom4Picture+0x1172>
    }
  }

  for(int i2=0;i2<11;i2++) {  
    4f7a:	42af 016a      	clr.l 362(sp)
    4f7e:	6032           	bra.s 4fb2 <TestZoom4Picture+0x1280>
    TestRow( valsupposed, valactual, mask, 258+i2);
    4f80:	222f 016a      	move.l 362(sp),d1
    4f84:	0681 0000 0102 	addi.l #258,d1
    4f8a:	7000           	moveq #0,d0
    4f8c:	302f 01c6      	move.w 454(sp),d0
    4f90:	2f01           	move.l d1,-(sp)
    4f92:	2f00           	move.l d0,-(sp)
    4f94:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f98:	2f2f 0056      	move.l 86(sp),-(sp)
    4f9c:	4eba 1bf6      	jsr 6b94 <TestRow>(pc)
    4fa0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4fa4:	702a           	moveq #42,d0
    4fa6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4faa:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {  
    4fae:	52af 016a      	addq.l #1,362(sp)
    4fb2:	720a           	moveq #10,d1
    4fb4:	b2af 016a      	cmp.l 362(sp),d1
    4fb8:	6cc6           	bge.s 4f80 <TestZoom4Picture+0x124e>
  }

  tmp = source;
    4fba:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4fc0:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4fc6:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    4fcc:	4878 0001      	pea 1 <_start+0x1>
    4fd0:	4878 0006      	pea 6 <_start+0x6>
    4fd4:	2f2f 0056      	move.l 86(sp),-(sp)
    4fd8:	2f2f 006a      	move.l 106(sp),-(sp)
    4fdc:	4eba cb04      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    4fe0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4fe4:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    4fea:	2c40           	movea.l d0,a6
    4fec:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4ff0:	202f 004e      	move.l 78(sp),d0
    4ff4:	5880           	addq.l #4,d0
    4ff6:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom7;
    4ffa:	2f7c 0000 bc24 	move.l #48164,74(sp)
    5000:	004a 
  mask = 0x0000;
    5002:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5006:	7000           	moveq #0,d0
    5008:	302f 01c6      	move.w 454(sp),d0
    500c:	42a7           	clr.l -(sp)
    500e:	2f00           	move.l d0,-(sp)
    5010:	2f2f 01d0      	move.l 464(sp),-(sp)
    5014:	2f2f 0056      	move.l 86(sp),-(sp)
    5018:	4eba 1b7a      	jsr 6b94 <TestRow>(pc)
    501c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5020:	722a           	moveq #42,d1
    5022:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5026:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    502a:	42af 0166      	clr.l 358(sp)
    502e:	605c           	bra.s 508c <TestZoom4Picture+0x135a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    5030:	202f 0166      	move.l 358(sp),d0
    5034:	d080           	add.l d0,d0
    5036:	2200           	move.l d0,d1
    5038:	5281           	addq.l #1,d1
    503a:	7000           	moveq #0,d0
    503c:	302f 01c6      	move.w 454(sp),d0
    5040:	2f01           	move.l d1,-(sp)
    5042:	2f00           	move.l d0,-(sp)
    5044:	2f2f 01d0      	move.l 464(sp),-(sp)
    5048:	2f2f 0056      	move.l 86(sp),-(sp)
    504c:	4eba 1b46      	jsr 6b94 <TestRow>(pc)
    5050:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5054:	702a           	moveq #42,d0
    5056:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    505a:	202f 0166      	move.l 358(sp),d0
    505e:	5280           	addq.l #1,d0
    5060:	d080           	add.l d0,d0
    5062:	2200           	move.l d0,d1
    5064:	7000           	moveq #0,d0
    5066:	302f 01c6      	move.w 454(sp),d0
    506a:	2f01           	move.l d1,-(sp)
    506c:	2f00           	move.l d0,-(sp)
    506e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5072:	2f2f 0056      	move.l 86(sp),-(sp)
    5076:	4eba 1b1c      	jsr 6b94 <TestRow>(pc)
    507a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    507e:	722a           	moveq #42,d1
    5080:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5084:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    5088:	52af 0166      	addq.l #1,358(sp)
    508c:	7006           	moveq #6,d0
    508e:	b0af 0166      	cmp.l 358(sp),d0
    5092:	6c9c           	bge.s 5030 <TestZoom4Picture+0x12fe>
  }

  for(int i=0;i<10;i++) {
    5094:	42af 0162      	clr.l 354(sp)
    5098:	6000 00d4      	bra.w 516e <TestZoom4Picture+0x143c>
    for(int i2=0;i2<11;i2++) {  
    509c:	42af 015e      	clr.l 350(sp)
    50a0:	6042           	bra.s 50e4 <TestZoom4Picture+0x13b2>
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    50a2:	307c 000f      	movea.w #15,a0
    50a6:	d1ef 015e      	adda.l 350(sp),a0
    50aa:	222f 0162      	move.l 354(sp),d1
    50ae:	2001           	move.l d1,d0
    50b0:	d080           	add.l d0,d0
    50b2:	d081           	add.l d1,d0
    50b4:	e788           	lsl.l #3,d0
    50b6:	d081           	add.l d1,d0
    50b8:	2208           	move.l a0,d1
    50ba:	d280           	add.l d0,d1
    50bc:	7000           	moveq #0,d0
    50be:	302f 01c6      	move.w 454(sp),d0
    50c2:	2f01           	move.l d1,-(sp)
    50c4:	2f00           	move.l d0,-(sp)
    50c6:	2f2f 01d0      	move.l 464(sp),-(sp)
    50ca:	2f2f 0056      	move.l 86(sp),-(sp)
    50ce:	4eba 1ac4      	jsr 6b94 <TestRow>(pc)
    50d2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    50d6:	722a           	moveq #42,d1
    50d8:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    50dc:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {  
    50e0:	52af 015e      	addq.l #1,350(sp)
    50e4:	700a           	moveq #10,d0
    50e6:	b0af 015e      	cmp.l 350(sp),d0
    50ea:	6cb6           	bge.s 50a2 <TestZoom4Picture+0x1370>
    }
    for(int i=0;i<7;i++) {
    50ec:	42af 015a      	clr.l 346(sp)
    50f0:	6070           	bra.s 5162 <TestZoom4Picture+0x1430>
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    50f2:	222f 015a      	move.l 346(sp),d1
    50f6:	2001           	move.l d1,d0
    50f8:	d080           	add.l d0,d0
    50fa:	d081           	add.l d1,d0
    50fc:	e788           	lsl.l #3,d0
    50fe:	2040           	movea.l d0,a0
    5100:	d1c1           	adda.l d1,a0
    5102:	41e8 001a      	lea 26(a0),a0
    5106:	7000           	moveq #0,d0
    5108:	302f 01c6      	move.w 454(sp),d0
    510c:	2f08           	move.l a0,-(sp)
    510e:	2f00           	move.l d0,-(sp)
    5110:	2f2f 01d0      	move.l 464(sp),-(sp)
    5114:	2f2f 0056      	move.l 86(sp),-(sp)
    5118:	4eba 1a7a      	jsr 6b94 <TestRow>(pc)
    511c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5120:	722a           	moveq #42,d1
    5122:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    5126:	222f 015a      	move.l 346(sp),d1
    512a:	2001           	move.l d1,d0
    512c:	d080           	add.l d0,d0
    512e:	d081           	add.l d1,d0
    5130:	e788           	lsl.l #3,d0
    5132:	2040           	movea.l d0,a0
    5134:	d1c1           	adda.l d1,a0
    5136:	41e8 001a      	lea 26(a0),a0
    513a:	7000           	moveq #0,d0
    513c:	302f 01c6      	move.w 454(sp),d0
    5140:	2f08           	move.l a0,-(sp)
    5142:	2f00           	move.l d0,-(sp)
    5144:	2f2f 01d0      	move.l 464(sp),-(sp)
    5148:	2f2f 0056      	move.l 86(sp),-(sp)
    514c:	4eba 1a46      	jsr 6b94 <TestRow>(pc)
    5150:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5154:	702a           	moveq #42,d0
    5156:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    515a:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<7;i++) {
    515e:	52af 015a      	addq.l #1,346(sp)
    5162:	7206           	moveq #6,d1
    5164:	b2af 015a      	cmp.l 346(sp),d1
    5168:	6c88           	bge.s 50f2 <TestZoom4Picture+0x13c0>
  for(int i=0;i<10;i++) {
    516a:	52af 0162      	addq.l #1,354(sp)
    516e:	7009           	moveq #9,d0
    5170:	b0af 0162      	cmp.l 354(sp),d0
    5174:	6c00 ff26      	bge.w 509c <TestZoom4Picture+0x136a>
    }
  }

  for(int i2=0;i2<5;i2++) {  
    5178:	42af 0156      	clr.l 342(sp)
    517c:	6032           	bra.s 51b0 <TestZoom4Picture+0x147e>
    TestRow( valsupposed, valactual, mask, 256+i2);
    517e:	222f 0156      	move.l 342(sp),d1
    5182:	0681 0000 0100 	addi.l #256,d1
    5188:	7000           	moveq #0,d0
    518a:	302f 01c6      	move.w 454(sp),d0
    518e:	2f01           	move.l d1,-(sp)
    5190:	2f00           	move.l d0,-(sp)
    5192:	2f2f 01d0      	move.l 464(sp),-(sp)
    5196:	2f2f 0056      	move.l 86(sp),-(sp)
    519a:	4eba 19f8      	jsr 6b94 <TestRow>(pc)
    519e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    51a2:	722a           	moveq #42,d1
    51a4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    51a8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    51ac:	52af 0156      	addq.l #1,342(sp)
    51b0:	7004           	moveq #4,d0
    51b2:	b0af 0156      	cmp.l 342(sp),d0
    51b6:	6cc6           	bge.s 517e <TestZoom4Picture+0x144c>
  }

  tmp = source;
    51b8:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    51be:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    51c4:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    51ca:	4878 0001      	pea 1 <_start+0x1>
    51ce:	4878 0007      	pea 7 <_start+0x7>
    51d2:	2f2f 0056      	move.l 86(sp),-(sp)
    51d6:	2f2f 006a      	move.l 106(sp),-(sp)
    51da:	4eba c906      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    51de:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    51e2:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    51e8:	2c40           	movea.l d0,a6
    51ea:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    51ee:	222f 004e      	move.l 78(sp),d1
    51f2:	5881           	addq.l #4,d1
    51f4:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom8;
    51f8:	2f7c 0000 bc50 	move.l #48208,74(sp)
    51fe:	004a 
  mask = 0xffff;
    5200:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5206:	7000           	moveq #0,d0
    5208:	302f 01c6      	move.w 454(sp),d0
    520c:	42a7           	clr.l -(sp)
    520e:	2f00           	move.l d0,-(sp)
    5210:	2f2f 01d0      	move.l 464(sp),-(sp)
    5214:	2f2f 0056      	move.l 86(sp),-(sp)
    5218:	4eba 197a      	jsr 6b94 <TestRow>(pc)
    521c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5220:	702a           	moveq #42,d0
    5222:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5226:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    522a:	42af 0152      	clr.l 338(sp)
    522e:	605c           	bra.s 528c <TestZoom4Picture+0x155a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    5230:	202f 0152      	move.l 338(sp),d0
    5234:	d080           	add.l d0,d0
    5236:	2200           	move.l d0,d1
    5238:	5281           	addq.l #1,d1
    523a:	7000           	moveq #0,d0
    523c:	302f 01c6      	move.w 454(sp),d0
    5240:	2f01           	move.l d1,-(sp)
    5242:	2f00           	move.l d0,-(sp)
    5244:	2f2f 01d0      	move.l 464(sp),-(sp)
    5248:	2f2f 0056      	move.l 86(sp),-(sp)
    524c:	4eba 1946      	jsr 6b94 <TestRow>(pc)
    5250:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5254:	722a           	moveq #42,d1
    5256:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    525a:	202f 0152      	move.l 338(sp),d0
    525e:	5280           	addq.l #1,d0
    5260:	d080           	add.l d0,d0
    5262:	2200           	move.l d0,d1
    5264:	7000           	moveq #0,d0
    5266:	302f 01c6      	move.w 454(sp),d0
    526a:	2f01           	move.l d1,-(sp)
    526c:	2f00           	move.l d0,-(sp)
    526e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5272:	2f2f 0056      	move.l 86(sp),-(sp)
    5276:	4eba 191c      	jsr 6b94 <TestRow>(pc)
    527a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    527e:	702a           	moveq #42,d0
    5280:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5284:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5288:	52af 0152      	addq.l #1,338(sp)
    528c:	7204           	moveq #4,d1
    528e:	b2af 0152      	cmp.l 338(sp),d1
    5292:	6c9c           	bge.s 5230 <TestZoom4Picture+0x14fe>
  }

  for(int i=0;i<9;i++) {
    5294:	42af 014e      	clr.l 334(sp)
    5298:	6000 00f0      	bra.w 538a <TestZoom4Picture+0x1658>
    for(int i2=0;i2<10;i2++) {  
    529c:	42af 014a      	clr.l 330(sp)
    52a0:	6046           	bra.s 52e8 <TestZoom4Picture+0x15b6>
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    52a2:	307c 000b      	movea.w #11,a0
    52a6:	d1ef 014a      	adda.l 330(sp),a0
    52aa:	222f 014e      	move.l 334(sp),d1
    52ae:	2001           	move.l d1,d0
    52b0:	d080           	add.l d0,d0
    52b2:	d081           	add.l d1,d0
    52b4:	d080           	add.l d0,d0
    52b6:	d080           	add.l d0,d0
    52b8:	d081           	add.l d1,d0
    52ba:	d080           	add.l d0,d0
    52bc:	2208           	move.l a0,d1
    52be:	d280           	add.l d0,d1
    52c0:	7000           	moveq #0,d0
    52c2:	302f 01c6      	move.w 454(sp),d0
    52c6:	2f01           	move.l d1,-(sp)
    52c8:	2f00           	move.l d0,-(sp)
    52ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    52ce:	2f2f 0056      	move.l 86(sp),-(sp)
    52d2:	4eba 18c0      	jsr 6b94 <TestRow>(pc)
    52d6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    52da:	702a           	moveq #42,d0
    52dc:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    52e0:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {  
    52e4:	52af 014a      	addq.l #1,330(sp)
    52e8:	7209           	moveq #9,d1
    52ea:	b2af 014a      	cmp.l 330(sp),d1
    52ee:	6cb2           	bge.s 52a2 <TestZoom4Picture+0x1570>
    }
    for(int i2=0;i2<8;i2++) {
    52f0:	42af 0146      	clr.l 326(sp)
    52f4:	6000 0086      	bra.w 537c <TestZoom4Picture+0x164a>
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    52f8:	222f 014e      	move.l 334(sp),d1
    52fc:	2001           	move.l d1,d0
    52fe:	d080           	add.l d0,d0
    5300:	d081           	add.l d1,d0
    5302:	d080           	add.l d0,d0
    5304:	d080           	add.l d0,d0
    5306:	d081           	add.l d1,d0
    5308:	d080           	add.l d0,d0
    530a:	2040           	movea.l d0,a0
    530c:	41e8 0015      	lea 21(a0),a0
    5310:	2208           	move.l a0,d1
    5312:	d2af 0146      	add.l 326(sp),d1
    5316:	7000           	moveq #0,d0
    5318:	302f 01c6      	move.w 454(sp),d0
    531c:	2f01           	move.l d1,-(sp)
    531e:	2f00           	move.l d0,-(sp)
    5320:	2f2f 01d0      	move.l 464(sp),-(sp)
    5324:	2f2f 0056      	move.l 86(sp),-(sp)
    5328:	4eba 186a      	jsr 6b94 <TestRow>(pc)
    532c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5330:	702a           	moveq #42,d0
    5332:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    5336:	222f 014e      	move.l 334(sp),d1
    533a:	2001           	move.l d1,d0
    533c:	d080           	add.l d0,d0
    533e:	d081           	add.l d1,d0
    5340:	d080           	add.l d0,d0
    5342:	d080           	add.l d0,d0
    5344:	d081           	add.l d1,d0
    5346:	d080           	add.l d0,d0
    5348:	2040           	movea.l d0,a0
    534a:	41e8 0015      	lea 21(a0),a0
    534e:	2208           	move.l a0,d1
    5350:	d2af 0146      	add.l 326(sp),d1
    5354:	7000           	moveq #0,d0
    5356:	302f 01c6      	move.w 454(sp),d0
    535a:	2f01           	move.l d1,-(sp)
    535c:	2f00           	move.l d0,-(sp)
    535e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5362:	2f2f 0056      	move.l 86(sp),-(sp)
    5366:	4eba 182c      	jsr 6b94 <TestRow>(pc)
    536a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    536e:	722a           	moveq #42,d1
    5370:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5374:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {
    5378:	52af 0146      	addq.l #1,326(sp)
    537c:	7007           	moveq #7,d0
    537e:	b0af 0146      	cmp.l 326(sp),d0
    5382:	6c00 ff74      	bge.w 52f8 <TestZoom4Picture+0x15c6>
  for(int i=0;i<9;i++) {
    5386:	52af 014e      	addq.l #1,334(sp)
    538a:	7208           	moveq #8,d1
    538c:	b2af 014e      	cmp.l 334(sp),d1
    5390:	6c00 ff0a      	bge.w 529c <TestZoom4Picture+0x156a>
    }
  }

  for(int i2=0;i2<10;i2++) {  
    5394:	42af 0142      	clr.l 322(sp)
    5398:	6032           	bra.s 53cc <TestZoom4Picture+0x169a>
    TestRow( valsupposed, valactual, mask, 245+i2);
    539a:	222f 0142      	move.l 322(sp),d1
    539e:	0681 0000 00f5 	addi.l #245,d1
    53a4:	7000           	moveq #0,d0
    53a6:	302f 01c6      	move.w 454(sp),d0
    53aa:	2f01           	move.l d1,-(sp)
    53ac:	2f00           	move.l d0,-(sp)
    53ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    53b2:	2f2f 0056      	move.l 86(sp),-(sp)
    53b6:	4eba 17dc      	jsr 6b94 <TestRow>(pc)
    53ba:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    53be:	702a           	moveq #42,d0
    53c0:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    53c4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {  
    53c8:	52af 0142      	addq.l #1,322(sp)
    53cc:	7209           	moveq #9,d1
    53ce:	b2af 0142      	cmp.l 322(sp),d1
    53d2:	6cc6           	bge.s 539a <TestZoom4Picture+0x1668>
  }
  for(int i=0;i<7;i++) {
    53d4:	42af 013e      	clr.l 318(sp)
    53d8:	6064           	bra.s 543e <TestZoom4Picture+0x170c>
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    53da:	202f 013e      	move.l 318(sp),d0
    53de:	d080           	add.l d0,d0
    53e0:	2200           	move.l d0,d1
    53e2:	0681 0000 00ff 	addi.l #255,d1
    53e8:	7000           	moveq #0,d0
    53ea:	302f 01c6      	move.w 454(sp),d0
    53ee:	2f01           	move.l d1,-(sp)
    53f0:	2f00           	move.l d0,-(sp)
    53f2:	2f2f 01d0      	move.l 464(sp),-(sp)
    53f6:	2f2f 0056      	move.l 86(sp),-(sp)
    53fa:	4eba 1798      	jsr 6b94 <TestRow>(pc)
    53fe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5402:	702a           	moveq #42,d0
    5404:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    5408:	202f 013e      	move.l 318(sp),d0
    540c:	0680 0000 0080 	addi.l #128,d0
    5412:	d080           	add.l d0,d0
    5414:	2200           	move.l d0,d1
    5416:	7000           	moveq #0,d0
    5418:	302f 01c6      	move.w 454(sp),d0
    541c:	2f01           	move.l d1,-(sp)
    541e:	2f00           	move.l d0,-(sp)
    5420:	2f2f 01d0      	move.l 464(sp),-(sp)
    5424:	2f2f 0056      	move.l 86(sp),-(sp)
    5428:	4eba 176a      	jsr 6b94 <TestRow>(pc)
    542c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5430:	722a           	moveq #42,d1
    5432:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5436:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    543a:	52af 013e      	addq.l #1,318(sp)
    543e:	7006           	moveq #6,d0
    5440:	b0af 013e      	cmp.l 318(sp),d0
    5444:	6c94           	bge.s 53da <TestZoom4Picture+0x16a8>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5446:	7000           	moveq #0,d0
    5448:	302f 01c6      	move.w 454(sp),d0
    544c:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5450:	2f00           	move.l d0,-(sp)
    5452:	2f2f 01d0      	move.l 464(sp),-(sp)
    5456:	2f2f 0056      	move.l 86(sp),-(sp)
    545a:	4eba 1738      	jsr 6b94 <TestRow>(pc)
    545e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5462:	722a           	moveq #42,d1
    5464:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5468:	466f 01c6      	not.w 454(sp)
 
  tmp = source;
    546c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5472:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5478:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    547e:	4878 0001      	pea 1 <_start+0x1>
    5482:	4878 0008      	pea 8 <_start+0x8>
    5486:	2f2f 0056      	move.l 86(sp),-(sp)
    548a:	2f2f 006a      	move.l 106(sp),-(sp)
    548e:	4eba c652      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    5492:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5496:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    549c:	2c40           	movea.l d0,a6
    549e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    54a2:	202f 004e      	move.l 78(sp),d0
    54a6:	5880           	addq.l #4,d0
    54a8:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom9;
    54ac:	2f7c 0000 bc7c 	move.l #48252,74(sp)
    54b2:	004a 
  mask = 0x0000;
    54b4:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    54b8:	7000           	moveq #0,d0
    54ba:	302f 01c6      	move.w 454(sp),d0
    54be:	42a7           	clr.l -(sp)
    54c0:	2f00           	move.l d0,-(sp)
    54c2:	2f2f 01d0      	move.l 464(sp),-(sp)
    54c6:	2f2f 0056      	move.l 86(sp),-(sp)
    54ca:	4eba 16c8      	jsr 6b94 <TestRow>(pc)
    54ce:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    54d2:	722a           	moveq #42,d1
    54d4:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    54d8:	466f 01c6      	not.w 454(sp)
  
  for(int i=0;i<3;i++) {
    54dc:	42af 013a      	clr.l 314(sp)
    54e0:	605c           	bra.s 553e <TestZoom4Picture+0x180c>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    54e2:	202f 013a      	move.l 314(sp),d0
    54e6:	d080           	add.l d0,d0
    54e8:	2200           	move.l d0,d1
    54ea:	5281           	addq.l #1,d1
    54ec:	7000           	moveq #0,d0
    54ee:	302f 01c6      	move.w 454(sp),d0
    54f2:	2f01           	move.l d1,-(sp)
    54f4:	2f00           	move.l d0,-(sp)
    54f6:	2f2f 01d0      	move.l 464(sp),-(sp)
    54fa:	2f2f 0056      	move.l 86(sp),-(sp)
    54fe:	4eba 1694      	jsr 6b94 <TestRow>(pc)
    5502:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5506:	702a           	moveq #42,d0
    5508:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    550c:	202f 013a      	move.l 314(sp),d0
    5510:	5280           	addq.l #1,d0
    5512:	d080           	add.l d0,d0
    5514:	2200           	move.l d0,d1
    5516:	7000           	moveq #0,d0
    5518:	302f 01c6      	move.w 454(sp),d0
    551c:	2f01           	move.l d1,-(sp)
    551e:	2f00           	move.l d0,-(sp)
    5520:	2f2f 01d0      	move.l 464(sp),-(sp)
    5524:	2f2f 0056      	move.l 86(sp),-(sp)
    5528:	4eba 166a      	jsr 6b94 <TestRow>(pc)
    552c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5530:	722a           	moveq #42,d1
    5532:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5536:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    553a:	52af 013a      	addq.l #1,314(sp)
    553e:	7002           	moveq #2,d0
    5540:	b0af 013a      	cmp.l 314(sp),d0
    5544:	6c9c           	bge.s 54e2 <TestZoom4Picture+0x17b0>
  }

  for(int i=0;i<9;i++) {
    5546:	42af 0136      	clr.l 310(sp)
    554a:	6000 00ea      	bra.w 5636 <TestZoom4Picture+0x1904>
    for(int i2=0;i2<9;i2++) {  
    554e:	42af 0132      	clr.l 306(sp)
    5552:	6044           	bra.s 5598 <TestZoom4Picture+0x1866>
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    5554:	307c 000b      	movea.w #11,a0
    5558:	d1ef 0132      	adda.l 306(sp),a0
    555c:	222f 0136      	move.l 310(sp),d1
    5560:	2001           	move.l d1,d0
    5562:	d080           	add.l d0,d0
    5564:	d081           	add.l d1,d0
    5566:	2200           	move.l d0,d1
    5568:	e789           	lsl.l #3,d1
    556a:	d081           	add.l d1,d0
    556c:	2208           	move.l a0,d1
    556e:	d280           	add.l d0,d1
    5570:	7000           	moveq #0,d0
    5572:	302f 01c6      	move.w 454(sp),d0
    5576:	2f01           	move.l d1,-(sp)
    5578:	2f00           	move.l d0,-(sp)
    557a:	2f2f 01d0      	move.l 464(sp),-(sp)
    557e:	2f2f 0056      	move.l 86(sp),-(sp)
    5582:	4eba 1610      	jsr 6b94 <TestRow>(pc)
    5586:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    558a:	722a           	moveq #42,d1
    558c:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5590:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {  
    5594:	52af 0132      	addq.l #1,306(sp)
    5598:	7008           	moveq #8,d0
    559a:	b0af 0132      	cmp.l 306(sp),d0
    559e:	6cb4           	bge.s 5554 <TestZoom4Picture+0x1822>
    }
    
    for(int i2=0;i2<9;i2++) {
    55a0:	42af 012e      	clr.l 302(sp)
    55a4:	6000 0082      	bra.w 5628 <TestZoom4Picture+0x18f6>
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    55a8:	222f 0136      	move.l 310(sp),d1
    55ac:	2001           	move.l d1,d0
    55ae:	d080           	add.l d0,d0
    55b0:	d081           	add.l d1,d0
    55b2:	2200           	move.l d0,d1
    55b4:	e789           	lsl.l #3,d1
    55b6:	2040           	movea.l d0,a0
    55b8:	d1c1           	adda.l d1,a0
    55ba:	41e8 0014      	lea 20(a0),a0
    55be:	2208           	move.l a0,d1
    55c0:	d2af 012e      	add.l 302(sp),d1
    55c4:	7000           	moveq #0,d0
    55c6:	302f 01c6      	move.w 454(sp),d0
    55ca:	2f01           	move.l d1,-(sp)
    55cc:	2f00           	move.l d0,-(sp)
    55ce:	2f2f 01d0      	move.l 464(sp),-(sp)
    55d2:	2f2f 0056      	move.l 86(sp),-(sp)
    55d6:	4eba 15bc      	jsr 6b94 <TestRow>(pc)
    55da:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    55de:	722a           	moveq #42,d1
    55e0:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    55e4:	222f 0136      	move.l 310(sp),d1
    55e8:	2001           	move.l d1,d0
    55ea:	d080           	add.l d0,d0
    55ec:	d081           	add.l d1,d0
    55ee:	2200           	move.l d0,d1
    55f0:	e789           	lsl.l #3,d1
    55f2:	2040           	movea.l d0,a0
    55f4:	d1c1           	adda.l d1,a0
    55f6:	41e8 0015      	lea 21(a0),a0
    55fa:	2208           	move.l a0,d1
    55fc:	d2af 012e      	add.l 302(sp),d1
    5600:	7000           	moveq #0,d0
    5602:	302f 01c6      	move.w 454(sp),d0
    5606:	2f01           	move.l d1,-(sp)
    5608:	2f00           	move.l d0,-(sp)
    560a:	2f2f 01d0      	move.l 464(sp),-(sp)
    560e:	2f2f 0056      	move.l 86(sp),-(sp)
    5612:	4eba 1580      	jsr 6b94 <TestRow>(pc)
    5616:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    561a:	702a           	moveq #42,d0
    561c:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5620:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {
    5624:	52af 012e      	addq.l #1,302(sp)
    5628:	7208           	moveq #8,d1
    562a:	b2af 012e      	cmp.l 302(sp),d1
    562e:	6c00 ff78      	bge.w 55a8 <TestZoom4Picture+0x1876>
  for(int i=0;i<9;i++) {
    5632:	52af 0136      	addq.l #1,310(sp)
    5636:	7008           	moveq #8,d0
    5638:	b0af 0136      	cmp.l 310(sp),d0
    563c:	6c00 ff10      	bge.w 554e <TestZoom4Picture+0x181c>
    }
  }

  for(int i2=0;i2<9;i2++) {  
    5640:	42af 012a      	clr.l 298(sp)
    5644:	6032           	bra.s 5678 <TestZoom4Picture+0x1946>
    TestRow( valsupposed, valactual, mask, 245+i2);
    5646:	222f 012a      	move.l 298(sp),d1
    564a:	0681 0000 00f5 	addi.l #245,d1
    5650:	7000           	moveq #0,d0
    5652:	302f 01c6      	move.w 454(sp),d0
    5656:	2f01           	move.l d1,-(sp)
    5658:	2f00           	move.l d0,-(sp)
    565a:	2f2f 01d0      	move.l 464(sp),-(sp)
    565e:	2f2f 0056      	move.l 86(sp),-(sp)
    5662:	4eba 1530      	jsr 6b94 <TestRow>(pc)
    5666:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    566a:	722a           	moveq #42,d1
    566c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5670:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {  
    5674:	52af 012a      	addq.l #1,298(sp)
    5678:	7008           	moveq #8,d0
    567a:	b0af 012a      	cmp.l 298(sp),d0
    567e:	6cc6           	bge.s 5646 <TestZoom4Picture+0x1914>
  }
  for(int i=0;i<5;i++) {
    5680:	42af 0126      	clr.l 294(sp)
    5684:	6064           	bra.s 56ea <TestZoom4Picture+0x19b8>
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    5686:	202f 0126      	move.l 294(sp),d0
    568a:	d080           	add.l d0,d0
    568c:	2200           	move.l d0,d1
    568e:	0681 0000 0103 	addi.l #259,d1
    5694:	7000           	moveq #0,d0
    5696:	302f 01c6      	move.w 454(sp),d0
    569a:	2f01           	move.l d1,-(sp)
    569c:	2f00           	move.l d0,-(sp)
    569e:	2f2f 01d0      	move.l 464(sp),-(sp)
    56a2:	2f2f 0056      	move.l 86(sp),-(sp)
    56a6:	4eba 14ec      	jsr 6b94 <TestRow>(pc)
    56aa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    56ae:	722a           	moveq #42,d1
    56b0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    56b4:	202f 0126      	move.l 294(sp),d0
    56b8:	0680 0000 0082 	addi.l #130,d0
    56be:	d080           	add.l d0,d0
    56c0:	2200           	move.l d0,d1
    56c2:	7000           	moveq #0,d0
    56c4:	302f 01c6      	move.w 454(sp),d0
    56c8:	2f01           	move.l d1,-(sp)
    56ca:	2f00           	move.l d0,-(sp)
    56cc:	2f2f 01d0      	move.l 464(sp),-(sp)
    56d0:	2f2f 0056      	move.l 86(sp),-(sp)
    56d4:	4eba 14be      	jsr 6b94 <TestRow>(pc)
    56d8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    56dc:	702a           	moveq #42,d0
    56de:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    56e2:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    56e6:	52af 0126      	addq.l #1,294(sp)
    56ea:	7204           	moveq #4,d1
    56ec:	b2af 0126      	cmp.l 294(sp),d1
    56f0:	6c94           	bge.s 5686 <TestZoom4Picture+0x1954>
  }
  TestRow( valsupposed, valactual, mask, 269);
    56f2:	7000           	moveq #0,d0
    56f4:	302f 01c6      	move.w 454(sp),d0
    56f8:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    56fc:	2f00           	move.l d0,-(sp)
    56fe:	2f2f 01d0      	move.l 464(sp),-(sp)
    5702:	2f2f 0056      	move.l 86(sp),-(sp)
    5706:	4eba 148c      	jsr 6b94 <TestRow>(pc)
    570a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    570e:	702a           	moveq #42,d0
    5710:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5714:	466f 01c6      	not.w 454(sp)

  tmp = source;
    5718:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    571e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5724:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    572a:	4878 0001      	pea 1 <_start+0x1>
    572e:	4878 0009      	pea 9 <_start+0x9>
    5732:	2f2f 0056      	move.l 86(sp),-(sp)
    5736:	2f2f 006a      	move.l 106(sp),-(sp)
    573a:	4eba c3a6      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    573e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5742:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    5748:	2c40           	movea.l d0,a6
    574a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    574e:	222f 004e      	move.l 78(sp),d1
    5752:	5881           	addq.l #4,d1
    5754:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom10;
    5758:	2f7c 0000 bca8 	move.l #48296,74(sp)
    575e:	004a 

  mask = 0xffff;
    5760:	3f7c ffff 01c6 	move.w #-1,454(sp)
  TestRow( valsupposed, valactual, mask, 0);
    5766:	7000           	moveq #0,d0
    5768:	302f 01c6      	move.w 454(sp),d0
    576c:	42a7           	clr.l -(sp)
    576e:	2f00           	move.l d0,-(sp)
    5770:	2f2f 01d0      	move.l 464(sp),-(sp)
    5774:	2f2f 0056      	move.l 86(sp),-(sp)
    5778:	4eba 141a      	jsr 6b94 <TestRow>(pc)
    577c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5780:	702a           	moveq #42,d0
    5782:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5786:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 1);   
    578a:	7000           	moveq #0,d0
    578c:	302f 01c6      	move.w 454(sp),d0
    5790:	4878 0001      	pea 1 <_start+0x1>
    5794:	2f00           	move.l d0,-(sp)
    5796:	2f2f 01d0      	move.l 464(sp),-(sp)
    579a:	2f2f 0056      	move.l 86(sp),-(sp)
    579e:	4eba 13f4      	jsr 6b94 <TestRow>(pc)
    57a2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    57a6:	722a           	moveq #42,d1
    57a8:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 2);
    57ac:	7000           	moveq #0,d0
    57ae:	302f 01c6      	move.w 454(sp),d0
    57b2:	4878 0002      	pea 2 <_start+0x2>
    57b6:	2f00           	move.l d0,-(sp)
    57b8:	2f2f 01d0      	move.l 464(sp),-(sp)
    57bc:	2f2f 0056      	move.l 86(sp),-(sp)
    57c0:	4eba 13d2      	jsr 6b94 <TestRow>(pc)
    57c4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    57c8:	702a           	moveq #42,d0
    57ca:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    57ce:	466f 01c6      	not.w 454(sp)

  for(int i=0;i<9;i++) {
    57d2:	42af 0122      	clr.l 290(sp)
    57d6:	6000 00e0      	bra.w 58b8 <TestZoom4Picture+0x1b86>
    for(int i2=0;i2<8;i2++) {  
    57da:	42af 011e      	clr.l 286(sp)
    57de:	6040           	bra.s 5820 <TestZoom4Picture+0x1aee>
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    57e0:	206f 011e      	movea.l 286(sp),a0
    57e4:	5688           	addq.l #3,a0
    57e6:	222f 0122      	move.l 290(sp),d1
    57ea:	2001           	move.l d1,d0
    57ec:	e788           	lsl.l #3,d0
    57ee:	9081           	sub.l d1,d0
    57f0:	d080           	add.l d0,d0
    57f2:	d080           	add.l d0,d0
    57f4:	2208           	move.l a0,d1
    57f6:	d280           	add.l d0,d1
    57f8:	7000           	moveq #0,d0
    57fa:	302f 01c6      	move.w 454(sp),d0
    57fe:	2f01           	move.l d1,-(sp)
    5800:	2f00           	move.l d0,-(sp)
    5802:	2f2f 01d0      	move.l 464(sp),-(sp)
    5806:	2f2f 0056      	move.l 86(sp),-(sp)
    580a:	4eba 1388      	jsr 6b94 <TestRow>(pc)
    580e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5812:	722a           	moveq #42,d1
    5814:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5818:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {  
    581c:	52af 011e      	addq.l #1,286(sp)
    5820:	7007           	moveq #7,d0
    5822:	b0af 011e      	cmp.l 286(sp),d0
    5826:	6cb8           	bge.s 57e0 <TestZoom4Picture+0x1aae>
    }
    
    for(int i2=0;i2<10;i2++) {
    5828:	42af 011a      	clr.l 282(sp)
    582c:	607c           	bra.s 58aa <TestZoom4Picture+0x1b78>
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    582e:	222f 0122      	move.l 290(sp),d1
    5832:	2001           	move.l d1,d0
    5834:	e788           	lsl.l #3,d0
    5836:	9081           	sub.l d1,d0
    5838:	d080           	add.l d0,d0
    583a:	d080           	add.l d0,d0
    583c:	2040           	movea.l d0,a0
    583e:	41e8 000b      	lea 11(a0),a0
    5842:	2208           	move.l a0,d1
    5844:	d2af 011a      	add.l 282(sp),d1
    5848:	7000           	moveq #0,d0
    584a:	302f 01c6      	move.w 454(sp),d0
    584e:	2f01           	move.l d1,-(sp)
    5850:	2f00           	move.l d0,-(sp)
    5852:	2f2f 01d0      	move.l 464(sp),-(sp)
    5856:	2f2f 0056      	move.l 86(sp),-(sp)
    585a:	4eba 1338      	jsr 6b94 <TestRow>(pc)
    585e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5862:	722a           	moveq #42,d1
    5864:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    5868:	222f 0122      	move.l 290(sp),d1
    586c:	2001           	move.l d1,d0
    586e:	e788           	lsl.l #3,d0
    5870:	9081           	sub.l d1,d0
    5872:	d080           	add.l d0,d0
    5874:	d080           	add.l d0,d0
    5876:	2040           	movea.l d0,a0
    5878:	41e8 000b      	lea 11(a0),a0
    587c:	2208           	move.l a0,d1
    587e:	d2af 011a      	add.l 282(sp),d1
    5882:	7000           	moveq #0,d0
    5884:	302f 01c6      	move.w 454(sp),d0
    5888:	2f01           	move.l d1,-(sp)
    588a:	2f00           	move.l d0,-(sp)
    588c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5890:	2f2f 0056      	move.l 86(sp),-(sp)
    5894:	4eba 12fe      	jsr 6b94 <TestRow>(pc)
    5898:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    589c:	702a           	moveq #42,d0
    589e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    58a2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {
    58a6:	52af 011a      	addq.l #1,282(sp)
    58aa:	7209           	moveq #9,d1
    58ac:	b2af 011a      	cmp.l 282(sp),d1
    58b0:	6c00 ff7c      	bge.w 582e <TestZoom4Picture+0x1afc>
  for(int i=0;i<9;i++) {
    58b4:	52af 0122      	addq.l #1,290(sp)
    58b8:	7008           	moveq #8,d0
    58ba:	b0af 0122      	cmp.l 290(sp),d0
    58be:	6c00 ff1a      	bge.w 57da <TestZoom4Picture+0x1aa8>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    58c2:	42af 0116      	clr.l 278(sp)
    58c6:	6032           	bra.s 58fa <TestZoom4Picture+0x1bc8>
    TestRow( valsupposed, valactual, mask, 255+i2);
    58c8:	222f 0116      	move.l 278(sp),d1
    58cc:	0681 0000 00ff 	addi.l #255,d1
    58d2:	7000           	moveq #0,d0
    58d4:	302f 01c6      	move.w 454(sp),d0
    58d8:	2f01           	move.l d1,-(sp)
    58da:	2f00           	move.l d0,-(sp)
    58dc:	2f2f 01d0      	move.l 464(sp),-(sp)
    58e0:	2f2f 0056      	move.l 86(sp),-(sp)
    58e4:	4eba 12ae      	jsr 6b94 <TestRow>(pc)
    58e8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    58ec:	722a           	moveq #42,d1
    58ee:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    58f2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    58f6:	52af 0116      	addq.l #1,278(sp)
    58fa:	7007           	moveq #7,d0
    58fc:	b0af 0116      	cmp.l 278(sp),d0
    5900:	6cc6           	bge.s 58c8 <TestZoom4Picture+0x1b96>
  }
  for(int i=0;i<3;i++) {
    5902:	42af 0112      	clr.l 274(sp)
    5906:	6064           	bra.s 596c <TestZoom4Picture+0x1c3a>
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    5908:	202f 0112      	move.l 274(sp),d0
    590c:	d080           	add.l d0,d0
    590e:	2200           	move.l d0,d1
    5910:	0681 0000 0107 	addi.l #263,d1
    5916:	7000           	moveq #0,d0
    5918:	302f 01c6      	move.w 454(sp),d0
    591c:	2f01           	move.l d1,-(sp)
    591e:	2f00           	move.l d0,-(sp)
    5920:	2f2f 01d0      	move.l 464(sp),-(sp)
    5924:	2f2f 0056      	move.l 86(sp),-(sp)
    5928:	4eba 126a      	jsr 6b94 <TestRow>(pc)
    592c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5930:	722a           	moveq #42,d1
    5932:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    5936:	202f 0112      	move.l 274(sp),d0
    593a:	0680 0000 0084 	addi.l #132,d0
    5940:	d080           	add.l d0,d0
    5942:	2200           	move.l d0,d1
    5944:	7000           	moveq #0,d0
    5946:	302f 01c6      	move.w 454(sp),d0
    594a:	2f01           	move.l d1,-(sp)
    594c:	2f00           	move.l d0,-(sp)
    594e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5952:	2f2f 0056      	move.l 86(sp),-(sp)
    5956:	4eba 123c      	jsr 6b94 <TestRow>(pc)
    595a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    595e:	702a           	moveq #42,d0
    5960:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5964:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    5968:	52af 0112      	addq.l #1,274(sp)
    596c:	7202           	moveq #2,d1
    596e:	b2af 0112      	cmp.l 274(sp),d1
    5972:	6c94           	bge.s 5908 <TestZoom4Picture+0x1bd6>
  }

  tmp = source;
    5974:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    597a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5980:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    5986:	4878 0001      	pea 1 <_start+0x1>
    598a:	4878 000a      	pea a <_start+0xa>
    598e:	2f2f 0056      	move.l 86(sp),-(sp)
    5992:	2f2f 006a      	move.l 106(sp),-(sp)
    5996:	4eba c14a      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    599a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    599e:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    59a4:	2c40           	movea.l d0,a6
    59a6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    59aa:	202f 004e      	move.l 78(sp),d0
    59ae:	5880           	addq.l #4,d0
    59b0:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom11;
    59b4:	2f7c 0000 bcd4 	move.l #48340,74(sp)
    59ba:	004a 

  mask = 0xffff;
    59bc:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  for(int i2=0;i2<6;i2++) {  
    59c2:	42af 010e      	clr.l 270(sp)
    59c6:	602a           	bra.s 59f2 <TestZoom4Picture+0x1cc0>
    TestRow( valsupposed, valactual, mask, i2);
    59c8:	7000           	moveq #0,d0
    59ca:	302f 01c6      	move.w 454(sp),d0
    59ce:	2f2f 010e      	move.l 270(sp),-(sp)
    59d2:	2f00           	move.l d0,-(sp)
    59d4:	2f2f 01d0      	move.l 464(sp),-(sp)
    59d8:	2f2f 0056      	move.l 86(sp),-(sp)
    59dc:	4eba 11b6      	jsr 6b94 <TestRow>(pc)
    59e0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    59e4:	722a           	moveq #42,d1
    59e6:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    59ea:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {  
    59ee:	52af 010e      	addq.l #1,270(sp)
    59f2:	7005           	moveq #5,d0
    59f4:	b0af 010e      	cmp.l 270(sp),d0
    59f8:	6cce           	bge.s 59c8 <TestZoom4Picture+0x1c96>
  }

  for(int i2=0;i2<11;i2++) {
    59fa:	42af 010a      	clr.l 266(sp)
    59fe:	605c           	bra.s 5a5c <TestZoom4Picture+0x1d2a>
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    5a00:	202f 010a      	move.l 266(sp),d0
    5a04:	5680           	addq.l #3,d0
    5a06:	d080           	add.l d0,d0
    5a08:	2200           	move.l d0,d1
    5a0a:	7000           	moveq #0,d0
    5a0c:	302f 01c6      	move.w 454(sp),d0
    5a10:	2f01           	move.l d1,-(sp)
    5a12:	2f00           	move.l d0,-(sp)
    5a14:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a18:	2f2f 0056      	move.l 86(sp),-(sp)
    5a1c:	4eba 1176      	jsr 6b94 <TestRow>(pc)
    5a20:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a24:	722a           	moveq #42,d1
    5a26:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    5a2a:	202f 010a      	move.l 266(sp),d0
    5a2e:	d080           	add.l d0,d0
    5a30:	2200           	move.l d0,d1
    5a32:	5e81           	addq.l #7,d1
    5a34:	7000           	moveq #0,d0
    5a36:	302f 01c6      	move.w 454(sp),d0
    5a3a:	2f01           	move.l d1,-(sp)
    5a3c:	2f00           	move.l d0,-(sp)
    5a3e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a42:	2f2f 0056      	move.l 86(sp),-(sp)
    5a46:	4eba 114c      	jsr 6b94 <TestRow>(pc)
    5a4a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a4e:	702a           	moveq #42,d0
    5a50:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5a54:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5a58:	52af 010a      	addq.l #1,266(sp)
    5a5c:	720a           	moveq #10,d1
    5a5e:	b2af 010a      	cmp.l 266(sp),d1
    5a62:	6c9c           	bge.s 5a00 <TestZoom4Picture+0x1cce>
  }

  for(int i=0;i<8;i++) {
    5a64:	42af 0106      	clr.l 262(sp)
    5a68:	6000 00f2      	bra.w 5b5c <TestZoom4Picture+0x1e2a>
    for(int i2=0;i2<7;i2++) {  
    5a6c:	42af 0102      	clr.l 258(sp)
    5a70:	6044           	bra.s 5ab6 <TestZoom4Picture+0x1d84>
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    5a72:	307c 001c      	movea.w #28,a0
    5a76:	d1ef 0102      	adda.l 258(sp),a0
    5a7a:	222f 0106      	move.l 262(sp),d1
    5a7e:	2001           	move.l d1,d0
    5a80:	e788           	lsl.l #3,d0
    5a82:	9081           	sub.l d1,d0
    5a84:	d080           	add.l d0,d0
    5a86:	d080           	add.l d0,d0
    5a88:	d081           	add.l d1,d0
    5a8a:	2208           	move.l a0,d1
    5a8c:	d280           	add.l d0,d1
    5a8e:	7000           	moveq #0,d0
    5a90:	302f 01c6      	move.w 454(sp),d0
    5a94:	2f01           	move.l d1,-(sp)
    5a96:	2f00           	move.l d0,-(sp)
    5a98:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a9c:	2f2f 0056      	move.l 86(sp),-(sp)
    5aa0:	4eba 10f2      	jsr 6b94 <TestRow>(pc)
    5aa4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5aa8:	702a           	moveq #42,d0
    5aaa:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5aae:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<7;i2++) {  
    5ab2:	52af 0102      	addq.l #1,258(sp)
    5ab6:	7206           	moveq #6,d1
    5ab8:	b2af 0102      	cmp.l 258(sp),d1
    5abc:	6cb4           	bge.s 5a72 <TestZoom4Picture+0x1d40>
    }
    
    for(int i2=0;i2<11;i2++) {
    5abe:	42af 00fe      	clr.l 254(sp)
    5ac2:	6000 008a      	bra.w 5b4e <TestZoom4Picture+0x1e1c>
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    5ac6:	222f 0106      	move.l 262(sp),d1
    5aca:	2001           	move.l d1,d0
    5acc:	e788           	lsl.l #3,d0
    5ace:	9081           	sub.l d1,d0
    5ad0:	d080           	add.l d0,d0
    5ad2:	d080           	add.l d0,d0
    5ad4:	2040           	movea.l d0,a0
    5ad6:	d1c1           	adda.l d1,a0
    5ad8:	41e8 0023      	lea 35(a0),a0
    5adc:	202f 00fe      	move.l 254(sp),d0
    5ae0:	d080           	add.l d0,d0
    5ae2:	2208           	move.l a0,d1
    5ae4:	d280           	add.l d0,d1
    5ae6:	7000           	moveq #0,d0
    5ae8:	302f 01c6      	move.w 454(sp),d0
    5aec:	2f01           	move.l d1,-(sp)
    5aee:	2f00           	move.l d0,-(sp)
    5af0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5af4:	2f2f 0056      	move.l 86(sp),-(sp)
    5af8:	4eba 109a      	jsr 6b94 <TestRow>(pc)
    5afc:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5b00:	702a           	moveq #42,d0
    5b02:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    5b06:	222f 0106      	move.l 262(sp),d1
    5b0a:	2001           	move.l d1,d0
    5b0c:	e788           	lsl.l #3,d0
    5b0e:	9081           	sub.l d1,d0
    5b10:	d080           	add.l d0,d0
    5b12:	d080           	add.l d0,d0
    5b14:	2040           	movea.l d0,a0
    5b16:	d1c1           	adda.l d1,a0
    5b18:	41e8 000b      	lea 11(a0),a0
    5b1c:	202f 00fe      	move.l 254(sp),d0
    5b20:	d080           	add.l d0,d0
    5b22:	2208           	move.l a0,d1
    5b24:	d280           	add.l d0,d1
    5b26:	7000           	moveq #0,d0
    5b28:	302f 01c6      	move.w 454(sp),d0
    5b2c:	2f01           	move.l d1,-(sp)
    5b2e:	2f00           	move.l d0,-(sp)
    5b30:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b34:	2f2f 0056      	move.l 86(sp),-(sp)
    5b38:	4eba 105a      	jsr 6b94 <TestRow>(pc)
    5b3c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5b40:	722a           	moveq #42,d1
    5b42:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5b46:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {
    5b4a:	52af 00fe      	addq.l #1,254(sp)
    5b4e:	700a           	moveq #10,d0
    5b50:	b0af 00fe      	cmp.l 254(sp),d0
    5b54:	6c00 ff70      	bge.w 5ac6 <TestZoom4Picture+0x1d94>
  for(int i=0;i<8;i++) {
    5b58:	52af 0106      	addq.l #1,262(sp)
    5b5c:	7207           	moveq #7,d1
    5b5e:	b2af 0106      	cmp.l 262(sp),d1
    5b62:	6c00 ff08      	bge.w 5a6c <TestZoom4Picture+0x1d3a>
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    5b66:	42af 00fa      	clr.l 250(sp)
    5b6a:	6032           	bra.s 5b9e <TestZoom4Picture+0x1e6c>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5b6c:	222f 00fa      	move.l 250(sp),d1
    5b70:	0681 0000 0104 	addi.l #260,d1
    5b76:	7000           	moveq #0,d0
    5b78:	302f 01c6      	move.w 454(sp),d0
    5b7c:	2f01           	move.l d1,-(sp)
    5b7e:	2f00           	move.l d0,-(sp)
    5b80:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b84:	2f2f 0056      	move.l 86(sp),-(sp)
    5b88:	4eba 100a      	jsr 6b94 <TestRow>(pc)
    5b8c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5b90:	702a           	moveq #42,d0
    5b92:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5b96:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    5b9a:	52af 00fa      	addq.l #1,250(sp)
    5b9e:	7206           	moveq #6,d1
    5ba0:	b2af 00fa      	cmp.l 250(sp),d1
    5ba4:	6cc6           	bge.s 5b6c <TestZoom4Picture+0x1e3a>
  }
  TestRow( valsupposed, valactual, mask, 267);   
    5ba6:	7000           	moveq #0,d0
    5ba8:	302f 01c6      	move.w 454(sp),d0
    5bac:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    5bb0:	2f00           	move.l d0,-(sp)
    5bb2:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bb6:	2f2f 0056      	move.l 86(sp),-(sp)
    5bba:	4eba 0fd8      	jsr 6b94 <TestRow>(pc)
    5bbe:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5bc2:	702a           	moveq #42,d0
    5bc4:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 268);
    5bc8:	7000           	moveq #0,d0
    5bca:	302f 01c6      	move.w 454(sp),d0
    5bce:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    5bd2:	2f00           	move.l d0,-(sp)
    5bd4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bd8:	2f2f 0056      	move.l 86(sp),-(sp)
    5bdc:	4eba 0fb6      	jsr 6b94 <TestRow>(pc)
    5be0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5be4:	722a           	moveq #42,d1
    5be6:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5bea:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 269);
    5bee:	7000           	moveq #0,d0
    5bf0:	302f 01c6      	move.w 454(sp),d0
    5bf4:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5bf8:	2f00           	move.l d0,-(sp)
    5bfa:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bfe:	2f2f 0056      	move.l 86(sp),-(sp)
    5c02:	4eba 0f90      	jsr 6b94 <TestRow>(pc)
    5c06:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5c0a:	702a           	moveq #42,d0
    5c0c:	d1af 01c8      	add.l d0,456(sp)
  
  tmp = source;
    5c10:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5c16:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5c1c:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    5c22:	4878 0001      	pea 1 <_start+0x1>
    5c26:	4878 000b      	pea b <_start+0xb>
    5c2a:	2f2f 0056      	move.l 86(sp),-(sp)
    5c2e:	2f2f 006a      	move.l 106(sp),-(sp)
    5c32:	4eba beae      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    5c36:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5c3a:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    5c40:	2c40           	movea.l d0,a6
    5c42:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5c46:	222f 004e      	move.l 78(sp),d1
    5c4a:	5881           	addq.l #4,d1
    5c4c:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom12;
    5c50:	2f7c 0000 bd00 	move.l #48384,74(sp)
    5c56:	004a 

  mask = 0x0;
    5c58:	426f 01c6      	clr.w 454(sp)
   
  TestRow( valsupposed, valactual, mask, 0);
    5c5c:	7000           	moveq #0,d0
    5c5e:	302f 01c6      	move.w 454(sp),d0
    5c62:	42a7           	clr.l -(sp)
    5c64:	2f00           	move.l d0,-(sp)
    5c66:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c6a:	2f2f 0056      	move.l 86(sp),-(sp)
    5c6e:	4eba 0f24      	jsr 6b94 <TestRow>(pc)
    5c72:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5c76:	702a           	moveq #42,d0
    5c78:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5c7c:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<12;i2++) {
    5c80:	42af 00f6      	clr.l 246(sp)
    5c84:	605c           	bra.s 5ce2 <TestZoom4Picture+0x1fb0>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5c86:	202f 00f6      	move.l 246(sp),d0
    5c8a:	d080           	add.l d0,d0
    5c8c:	2200           	move.l d0,d1
    5c8e:	5281           	addq.l #1,d1
    5c90:	7000           	moveq #0,d0
    5c92:	302f 01c6      	move.w 454(sp),d0
    5c96:	2f01           	move.l d1,-(sp)
    5c98:	2f00           	move.l d0,-(sp)
    5c9a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c9e:	2f2f 0056      	move.l 86(sp),-(sp)
    5ca2:	4eba 0ef0      	jsr 6b94 <TestRow>(pc)
    5ca6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5caa:	722a           	moveq #42,d1
    5cac:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5cb0:	202f 00f6      	move.l 246(sp),d0
    5cb4:	5280           	addq.l #1,d0
    5cb6:	d080           	add.l d0,d0
    5cb8:	2200           	move.l d0,d1
    5cba:	7000           	moveq #0,d0
    5cbc:	302f 01c6      	move.w 454(sp),d0
    5cc0:	2f01           	move.l d1,-(sp)
    5cc2:	2f00           	move.l d0,-(sp)
    5cc4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5cc8:	2f2f 0056      	move.l 86(sp),-(sp)
    5ccc:	4eba 0ec6      	jsr 6b94 <TestRow>(pc)
    5cd0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5cd4:	702a           	moveq #42,d0
    5cd6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5cda:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    5cde:	52af 00f6      	addq.l #1,246(sp)
    5ce2:	720b           	moveq #11,d1
    5ce4:	b2af 00f6      	cmp.l 246(sp),d1
    5ce8:	6c9c           	bge.s 5c86 <TestZoom4Picture+0x1f54>
  } 

  for(int i=0;i<8;i++) {
    5cea:	42af 00f2      	clr.l 242(sp)
    5cee:	6000 00e6      	bra.w 5dd6 <TestZoom4Picture+0x20a4>
    for(int i2=0;i2<6;i2++) {  
    5cf2:	42af 00ee      	clr.l 238(sp)
    5cf6:	6040           	bra.s 5d38 <TestZoom4Picture+0x2006>
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    5cf8:	307c 0019      	movea.w #25,a0
    5cfc:	d1ef 00ee      	adda.l 238(sp),a0
    5d00:	222f 00f2      	move.l 242(sp),d1
    5d04:	2001           	move.l d1,d0
    5d06:	e988           	lsl.l #4,d0
    5d08:	9081           	sub.l d1,d0
    5d0a:	d080           	add.l d0,d0
    5d0c:	2208           	move.l a0,d1
    5d0e:	d280           	add.l d0,d1
    5d10:	7000           	moveq #0,d0
    5d12:	302f 01c6      	move.w 454(sp),d0
    5d16:	2f01           	move.l d1,-(sp)
    5d18:	2f00           	move.l d0,-(sp)
    5d1a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d1e:	2f2f 0056      	move.l 86(sp),-(sp)
    5d22:	4eba 0e70      	jsr 6b94 <TestRow>(pc)
    5d26:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5d2a:	702a           	moveq #42,d0
    5d2c:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5d30:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<6;i2++) {  
    5d34:	52af 00ee      	addq.l #1,238(sp)
    5d38:	7205           	moveq #5,d1
    5d3a:	b2af 00ee      	cmp.l 238(sp),d1
    5d3e:	6cb8           	bge.s 5cf8 <TestZoom4Picture+0x1fc6>
    }
    
    for(int i2=0;i2<12;i2++) {
    5d40:	42af 00ea      	clr.l 234(sp)
    5d44:	6000 0082      	bra.w 5dc8 <TestZoom4Picture+0x2096>
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    5d48:	222f 00f2      	move.l 242(sp),d1
    5d4c:	2001           	move.l d1,d0
    5d4e:	e988           	lsl.l #4,d0
    5d50:	9081           	sub.l d1,d0
    5d52:	d080           	add.l d0,d0
    5d54:	2040           	movea.l d0,a0
    5d56:	41e8 001f      	lea 31(a0),a0
    5d5a:	202f 00ea      	move.l 234(sp),d0
    5d5e:	d080           	add.l d0,d0
    5d60:	2208           	move.l a0,d1
    5d62:	d280           	add.l d0,d1
    5d64:	7000           	moveq #0,d0
    5d66:	302f 01c6      	move.w 454(sp),d0
    5d6a:	2f01           	move.l d1,-(sp)
    5d6c:	2f00           	move.l d0,-(sp)
    5d6e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d72:	2f2f 0056      	move.l 86(sp),-(sp)
    5d76:	4eba 0e1c      	jsr 6b94 <TestRow>(pc)
    5d7a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5d7e:	702a           	moveq #42,d0
    5d80:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    5d84:	222f 00f2      	move.l 242(sp),d1
    5d88:	2001           	move.l d1,d0
    5d8a:	e988           	lsl.l #4,d0
    5d8c:	9081           	sub.l d1,d0
    5d8e:	d080           	add.l d0,d0
    5d90:	2040           	movea.l d0,a0
    5d92:	41e8 0020      	lea 32(a0),a0
    5d96:	202f 00ea      	move.l 234(sp),d0
    5d9a:	d080           	add.l d0,d0
    5d9c:	2208           	move.l a0,d1
    5d9e:	d280           	add.l d0,d1
    5da0:	7000           	moveq #0,d0
    5da2:	302f 01c6      	move.w 454(sp),d0
    5da6:	2f01           	move.l d1,-(sp)
    5da8:	2f00           	move.l d0,-(sp)
    5daa:	2f2f 01d0      	move.l 464(sp),-(sp)
    5dae:	2f2f 0056      	move.l 86(sp),-(sp)
    5db2:	4eba 0de0      	jsr 6b94 <TestRow>(pc)
    5db6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5dba:	722a           	moveq #42,d1
    5dbc:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5dc0:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {
    5dc4:	52af 00ea      	addq.l #1,234(sp)
    5dc8:	700b           	moveq #11,d0
    5dca:	b0af 00ea      	cmp.l 234(sp),d0
    5dce:	6c00 ff78      	bge.w 5d48 <TestZoom4Picture+0x2016>
  for(int i=0;i<8;i++) {
    5dd2:	52af 00f2      	addq.l #1,242(sp)
    5dd6:	7207           	moveq #7,d1
    5dd8:	b2af 00f2      	cmp.l 242(sp),d1
    5ddc:	6c00 ff14      	bge.w 5cf2 <TestZoom4Picture+0x1fc0>
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    5de0:	42af 00e6      	clr.l 230(sp)
    5de4:	6032           	bra.s 5e18 <TestZoom4Picture+0x20e6>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5de6:	222f 00e6      	move.l 230(sp),d1
    5dea:	0681 0000 0104 	addi.l #260,d1
    5df0:	7000           	moveq #0,d0
    5df2:	302f 01c6      	move.w 454(sp),d0
    5df6:	2f01           	move.l d1,-(sp)
    5df8:	2f00           	move.l d0,-(sp)
    5dfa:	2f2f 01d0      	move.l 464(sp),-(sp)
    5dfe:	2f2f 0056      	move.l 86(sp),-(sp)
    5e02:	4eba 0d90      	jsr 6b94 <TestRow>(pc)
    5e06:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5e0a:	702a           	moveq #42,d0
    5e0c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5e10:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5e14:	52af 00e6      	addq.l #1,230(sp)
    5e18:	7204           	moveq #4,d1
    5e1a:	b2af 00e6      	cmp.l 230(sp),d1
    5e1e:	6cc6           	bge.s 5de6 <TestZoom4Picture+0x20b4>
  }

  tmp = source;
    5e20:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5e26:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5e2c:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    5e32:	4878 0001      	pea 1 <_start+0x1>
    5e36:	4878 000c      	pea c <_start+0xc>
    5e3a:	2f2f 0056      	move.l 86(sp),-(sp)
    5e3e:	2f2f 006a      	move.l 106(sp),-(sp)
    5e42:	4eba bc9e      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    5e46:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5e4a:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    5e50:	2c40           	movea.l d0,a6
    5e52:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5e56:	202f 004e      	move.l 78(sp),d0
    5e5a:	5880           	addq.l #4,d0
    5e5c:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom13;
    5e60:	2f7c 0000 bd2c 	move.l #48428,74(sp)
    5e66:	004a 

  mask = 0xffff;
    5e68:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<11;i2++) {
    5e6e:	42af 00e2      	clr.l 226(sp)
    5e72:	605a           	bra.s 5ece <TestZoom4Picture+0x219c>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    5e74:	202f 00e2      	move.l 226(sp),d0
    5e78:	d080           	add.l d0,d0
    5e7a:	2200           	move.l d0,d1
    5e7c:	7000           	moveq #0,d0
    5e7e:	302f 01c6      	move.w 454(sp),d0
    5e82:	2f01           	move.l d1,-(sp)
    5e84:	2f00           	move.l d0,-(sp)
    5e86:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e8a:	2f2f 0056      	move.l 86(sp),-(sp)
    5e8e:	4eba 0d04      	jsr 6b94 <TestRow>(pc)
    5e92:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5e96:	722a           	moveq #42,d1
    5e98:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    5e9c:	202f 00e2      	move.l 226(sp),d0
    5ea0:	d080           	add.l d0,d0
    5ea2:	2200           	move.l d0,d1
    5ea4:	5281           	addq.l #1,d1
    5ea6:	7000           	moveq #0,d0
    5ea8:	302f 01c6      	move.w 454(sp),d0
    5eac:	2f01           	move.l d1,-(sp)
    5eae:	2f00           	move.l d0,-(sp)
    5eb0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5eb4:	2f2f 0056      	move.l 86(sp),-(sp)
    5eb8:	4eba 0cda      	jsr 6b94 <TestRow>(pc)
    5ebc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5ec0:	702a           	moveq #42,d0
    5ec2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5ec6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5eca:	52af 00e2      	addq.l #1,226(sp)
    5ece:	720a           	moveq #10,d1
    5ed0:	b2af 00e2      	cmp.l 226(sp),d1
    5ed4:	6c9e           	bge.s 5e74 <TestZoom4Picture+0x2142>
  } 

  for(int i=0;i<8;i++) {
    5ed6:	42af 00de      	clr.l 222(sp)
    5eda:	6000 00de      	bra.w 5fba <TestZoom4Picture+0x2288>
    for(int i2=0;i2<5;i2++) {  
    5ede:	42af 00da      	clr.l 218(sp)
    5ee2:	603e           	bra.s 5f22 <TestZoom4Picture+0x21f0>
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    5ee4:	307c 0016      	movea.w #22,a0
    5ee8:	d1ef 00da      	adda.l 218(sp),a0
    5eec:	222f 00de      	move.l 222(sp),d1
    5ef0:	2001           	move.l d1,d0
    5ef2:	eb88           	lsl.l #5,d0
    5ef4:	9081           	sub.l d1,d0
    5ef6:	2208           	move.l a0,d1
    5ef8:	d280           	add.l d0,d1
    5efa:	7000           	moveq #0,d0
    5efc:	302f 01c6      	move.w 454(sp),d0
    5f00:	2f01           	move.l d1,-(sp)
    5f02:	2f00           	move.l d0,-(sp)
    5f04:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f08:	2f2f 0056      	move.l 86(sp),-(sp)
    5f0c:	4eba 0c86      	jsr 6b94 <TestRow>(pc)
    5f10:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f14:	702a           	moveq #42,d0
    5f16:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5f1a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<5;i2++) {  
    5f1e:	52af 00da      	addq.l #1,218(sp)
    5f22:	7204           	moveq #4,d1
    5f24:	b2af 00da      	cmp.l 218(sp),d1
    5f28:	6cba           	bge.s 5ee4 <TestZoom4Picture+0x21b2>
    }
    
    for(int i2=0;i2<13;i2++) {
    5f2a:	42af 00d6      	clr.l 214(sp)
    5f2e:	607c           	bra.s 5fac <TestZoom4Picture+0x227a>
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    5f30:	222f 00de      	move.l 222(sp),d1
    5f34:	2001           	move.l d1,d0
    5f36:	eb88           	lsl.l #5,d0
    5f38:	2040           	movea.l d0,a0
    5f3a:	91c1           	suba.l d1,a0
    5f3c:	41e8 001b      	lea 27(a0),a0
    5f40:	202f 00d6      	move.l 214(sp),d0
    5f44:	d080           	add.l d0,d0
    5f46:	2208           	move.l a0,d1
    5f48:	d280           	add.l d0,d1
    5f4a:	7000           	moveq #0,d0
    5f4c:	302f 01c6      	move.w 454(sp),d0
    5f50:	2f01           	move.l d1,-(sp)
    5f52:	2f00           	move.l d0,-(sp)
    5f54:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f58:	2f2f 0056      	move.l 86(sp),-(sp)
    5f5c:	4eba 0c36      	jsr 6b94 <TestRow>(pc)
    5f60:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f64:	702a           	moveq #42,d0
    5f66:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    5f6a:	222f 00de      	move.l 222(sp),d1
    5f6e:	2001           	move.l d1,d0
    5f70:	eb88           	lsl.l #5,d0
    5f72:	2040           	movea.l d0,a0
    5f74:	91c1           	suba.l d1,a0
    5f76:	41e8 001c      	lea 28(a0),a0
    5f7a:	202f 00d6      	move.l 214(sp),d0
    5f7e:	d080           	add.l d0,d0
    5f80:	2208           	move.l a0,d1
    5f82:	d280           	add.l d0,d1
    5f84:	7000           	moveq #0,d0
    5f86:	302f 01c6      	move.w 454(sp),d0
    5f8a:	2f01           	move.l d1,-(sp)
    5f8c:	2f00           	move.l d0,-(sp)
    5f8e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f92:	2f2f 0056      	move.l 86(sp),-(sp)
    5f96:	4eba 0bfc      	jsr 6b94 <TestRow>(pc)
    5f9a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f9e:	722a           	moveq #42,d1
    5fa0:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5fa4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {
    5fa8:	52af 00d6      	addq.l #1,214(sp)
    5fac:	700c           	moveq #12,d0
    5fae:	b0af 00d6      	cmp.l 214(sp),d0
    5fb2:	6c00 ff7c      	bge.w 5f30 <TestZoom4Picture+0x21fe>
  for(int i=0;i<8;i++) {
    5fb6:	52af 00de      	addq.l #1,222(sp)
    5fba:	7207           	moveq #7,d1
    5fbc:	b2af 00de      	cmp.l 222(sp),d1
    5fc0:	6c00 ff1c      	bge.w 5ede <TestZoom4Picture+0x21ac>
    }
  } 

  tmp = source;
    5fc4:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5fca:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5fd0:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    5fd6:	4878 0001      	pea 1 <_start+0x1>
    5fda:	4878 000d      	pea d <_start+0xd>
    5fde:	2f2f 0056      	move.l 86(sp),-(sp)
    5fe2:	2f2f 006a      	move.l 106(sp),-(sp)
    5fe6:	4eba bafa      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    5fea:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5fee:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    5ff4:	2c40           	movea.l d0,a6
    5ff6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5ffa:	202f 004e      	move.l 78(sp),d0
    5ffe:	5880           	addq.l #4,d0
    6000:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom14;
    6004:	2f7c 0000 bd58 	move.l #48472,74(sp)
    600a:	004a 

  mask = 0xffff;
    600c:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    6012:	7000           	moveq #0,d0
    6014:	302f 01c6      	move.w 454(sp),d0
    6018:	42a7           	clr.l -(sp)
    601a:	2f00           	move.l d0,-(sp)
    601c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6020:	2f2f 0056      	move.l 86(sp),-(sp)
    6024:	4eba 0b6e      	jsr 6b94 <TestRow>(pc)
    6028:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2; 
    602c:	722a           	moveq #42,d1
    602e:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff; 
    6032:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<9;i2++) {
    6036:	42af 00d2      	clr.l 210(sp)
    603a:	605c           	bra.s 6098 <TestZoom4Picture+0x2366>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    603c:	202f 00d2      	move.l 210(sp),d0
    6040:	d080           	add.l d0,d0
    6042:	2200           	move.l d0,d1
    6044:	5281           	addq.l #1,d1
    6046:	7000           	moveq #0,d0
    6048:	302f 01c6      	move.w 454(sp),d0
    604c:	2f01           	move.l d1,-(sp)
    604e:	2f00           	move.l d0,-(sp)
    6050:	2f2f 01d0      	move.l 464(sp),-(sp)
    6054:	2f2f 0056      	move.l 86(sp),-(sp)
    6058:	4eba 0b3a      	jsr 6b94 <TestRow>(pc)
    605c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6060:	702a           	moveq #42,d0
    6062:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    6066:	202f 00d2      	move.l 210(sp),d0
    606a:	5280           	addq.l #1,d0
    606c:	d080           	add.l d0,d0
    606e:	2200           	move.l d0,d1
    6070:	7000           	moveq #0,d0
    6072:	302f 01c6      	move.w 454(sp),d0
    6076:	2f01           	move.l d1,-(sp)
    6078:	2f00           	move.l d0,-(sp)
    607a:	2f2f 01d0      	move.l 464(sp),-(sp)
    607e:	2f2f 0056      	move.l 86(sp),-(sp)
    6082:	4eba 0b10      	jsr 6b94 <TestRow>(pc)
    6086:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    608a:	722a           	moveq #42,d1
    608c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6090:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {
    6094:	52af 00d2      	addq.l #1,210(sp)
    6098:	7008           	moveq #8,d0
    609a:	b0af 00d2      	cmp.l 210(sp),d0
    609e:	6c9c           	bge.s 603c <TestZoom4Picture+0x230a>
  } 

  for(int i=0;i<7;i++) {
    60a0:	42af 00ce      	clr.l 206(sp)
    60a4:	6000 00cc      	bra.w 6172 <TestZoom4Picture+0x2440>
    for(int i2=0;i2<4;i2++) {  
    60a8:	42af 00ca      	clr.l 202(sp)
    60ac:	6036           	bra.s 60e4 <TestZoom4Picture+0x23b2>
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    60ae:	7213           	moveq #19,d1
    60b0:	d2af 00ca      	add.l 202(sp),d1
    60b4:	202f 00ce      	move.l 206(sp),d0
    60b8:	eb88           	lsl.l #5,d0
    60ba:	d280           	add.l d0,d1
    60bc:	7000           	moveq #0,d0
    60be:	302f 01c6      	move.w 454(sp),d0
    60c2:	2f01           	move.l d1,-(sp)
    60c4:	2f00           	move.l d0,-(sp)
    60c6:	2f2f 01d0      	move.l 464(sp),-(sp)
    60ca:	2f2f 0056      	move.l 86(sp),-(sp)
    60ce:	4eba 0ac4      	jsr 6b94 <TestRow>(pc)
    60d2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    60d6:	722a           	moveq #42,d1
    60d8:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    60dc:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<4;i2++) {  
    60e0:	52af 00ca      	addq.l #1,202(sp)
    60e4:	7003           	moveq #3,d0
    60e6:	b0af 00ca      	cmp.l 202(sp),d0
    60ea:	6cc2           	bge.s 60ae <TestZoom4Picture+0x237c>
    }
    
    for(int i2=0;i2<14;i2++) {
    60ec:	42af 00c6      	clr.l 198(sp)
    60f0:	6074           	bra.s 6166 <TestZoom4Picture+0x2434>
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    60f2:	202f 00ce      	move.l 206(sp),d0
    60f6:	eb88           	lsl.l #5,d0
    60f8:	307c 0017      	movea.w #23,a0
    60fc:	d1c0           	adda.l d0,a0
    60fe:	202f 00c6      	move.l 198(sp),d0
    6102:	d080           	add.l d0,d0
    6104:	2208           	move.l a0,d1
    6106:	d280           	add.l d0,d1
    6108:	7000           	moveq #0,d0
    610a:	302f 01c6      	move.w 454(sp),d0
    610e:	2f01           	move.l d1,-(sp)
    6110:	2f00           	move.l d0,-(sp)
    6112:	2f2f 01d0      	move.l 464(sp),-(sp)
    6116:	2f2f 0056      	move.l 86(sp),-(sp)
    611a:	4eba 0a78      	jsr 6b94 <TestRow>(pc)
    611e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6122:	722a           	moveq #42,d1
    6124:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    6128:	202f 00ce      	move.l 206(sp),d0
    612c:	eb88           	lsl.l #5,d0
    612e:	307c 0018      	movea.w #24,a0
    6132:	d1c0           	adda.l d0,a0
    6134:	202f 00c6      	move.l 198(sp),d0
    6138:	d080           	add.l d0,d0
    613a:	2208           	move.l a0,d1
    613c:	d280           	add.l d0,d1
    613e:	7000           	moveq #0,d0
    6140:	302f 01c6      	move.w 454(sp),d0
    6144:	2f01           	move.l d1,-(sp)
    6146:	2f00           	move.l d0,-(sp)
    6148:	2f2f 01d0      	move.l 464(sp),-(sp)
    614c:	2f2f 0056      	move.l 86(sp),-(sp)
    6150:	4eba 0a42      	jsr 6b94 <TestRow>(pc)
    6154:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6158:	702a           	moveq #42,d0
    615a:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    615e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {
    6162:	52af 00c6      	addq.l #1,198(sp)
    6166:	720d           	moveq #13,d1
    6168:	b2af 00c6      	cmp.l 198(sp),d1
    616c:	6c84           	bge.s 60f2 <TestZoom4Picture+0x23c0>
  for(int i=0;i<7;i++) {
    616e:	52af 00ce      	addq.l #1,206(sp)
    6172:	7006           	moveq #6,d0
    6174:	b0af 00ce      	cmp.l 206(sp),d0
    6178:	6c00 ff2e      	bge.w 60a8 <TestZoom4Picture+0x2376>
    }
  }

  for(int i2=0;i2<4;i2++) {  
    617c:	42af 00c2      	clr.l 194(sp)
    6180:	6032           	bra.s 61b4 <TestZoom4Picture+0x2482>
    TestRow( valsupposed, valactual, mask, 243+i2);
    6182:	222f 00c2      	move.l 194(sp),d1
    6186:	0681 0000 00f3 	addi.l #243,d1
    618c:	7000           	moveq #0,d0
    618e:	302f 01c6      	move.w 454(sp),d0
    6192:	2f01           	move.l d1,-(sp)
    6194:	2f00           	move.l d0,-(sp)
    6196:	2f2f 01d0      	move.l 464(sp),-(sp)
    619a:	2f2f 0056      	move.l 86(sp),-(sp)
    619e:	4eba 09f4      	jsr 6b94 <TestRow>(pc)
    61a2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61a6:	722a           	moveq #42,d1
    61a8:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    61ac:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {  
    61b0:	52af 00c2      	addq.l #1,194(sp)
    61b4:	7003           	moveq #3,d0
    61b6:	b0af 00c2      	cmp.l 194(sp),d0
    61ba:	6cc6           	bge.s 6182 <TestZoom4Picture+0x2450>
  }

  for(int i2=0;i2<12;i2++) {
    61bc:	42af 00be      	clr.l 190(sp)
    61c0:	6060           	bra.s 6222 <TestZoom4Picture+0x24f0>
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    61c2:	202f 00be      	move.l 190(sp),d0
    61c6:	d080           	add.l d0,d0
    61c8:	2200           	move.l d0,d1
    61ca:	0681 0000 00f7 	addi.l #247,d1
    61d0:	7000           	moveq #0,d0
    61d2:	302f 01c6      	move.w 454(sp),d0
    61d6:	2f01           	move.l d1,-(sp)
    61d8:	2f00           	move.l d0,-(sp)
    61da:	2f2f 01d0      	move.l 464(sp),-(sp)
    61de:	2f2f 0056      	move.l 86(sp),-(sp)
    61e2:	4eba 09b0      	jsr 6b94 <TestRow>(pc)
    61e6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61ea:	722a           	moveq #42,d1
    61ec:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    61f0:	707c           	moveq #124,d0
    61f2:	d0af 00be      	add.l 190(sp),d0
    61f6:	d080           	add.l d0,d0
    61f8:	2200           	move.l d0,d1
    61fa:	7000           	moveq #0,d0
    61fc:	302f 01c6      	move.w 454(sp),d0
    6200:	2f01           	move.l d1,-(sp)
    6202:	2f00           	move.l d0,-(sp)
    6204:	2f2f 01d0      	move.l 464(sp),-(sp)
    6208:	2f2f 0056      	move.l 86(sp),-(sp)
    620c:	4eba 0986      	jsr 6b94 <TestRow>(pc)
    6210:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6214:	702a           	moveq #42,d0
    6216:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    621a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    621e:	52af 00be      	addq.l #1,190(sp)
    6222:	720b           	moveq #11,d1
    6224:	b2af 00be      	cmp.l 190(sp),d1
    6228:	6c98           	bge.s 61c2 <TestZoom4Picture+0x2490>
  }

  tmp = source;
    622a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6230:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6236:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    623c:	4878 0001      	pea 1 <_start+0x1>
    6240:	4878 000e      	pea e <_start+0xe>
    6244:	2f2f 0056      	move.l 86(sp),-(sp)
    6248:	2f2f 006a      	move.l 106(sp),-(sp)
    624c:	4eba b894      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    6250:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6254:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    625a:	2c40           	movea.l d0,a6
    625c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6260:	202f 004e      	move.l 78(sp),d0
    6264:	5880           	addq.l #4,d0
    6266:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom15;
    626a:	2f7c 0000 bd84 	move.l #48516,74(sp)
    6270:	004a 

  mask = 0x0000;
    6272:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<8;i2++) {
    6276:	42af 00ba      	clr.l 186(sp)
    627a:	605a           	bra.s 62d6 <TestZoom4Picture+0x25a4>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    627c:	202f 00ba      	move.l 186(sp),d0
    6280:	d080           	add.l d0,d0
    6282:	2200           	move.l d0,d1
    6284:	7000           	moveq #0,d0
    6286:	302f 01c6      	move.w 454(sp),d0
    628a:	2f01           	move.l d1,-(sp)
    628c:	2f00           	move.l d0,-(sp)
    628e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6292:	2f2f 0056      	move.l 86(sp),-(sp)
    6296:	4eba 08fc      	jsr 6b94 <TestRow>(pc)
    629a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    629e:	722a           	moveq #42,d1
    62a0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    62a4:	202f 00ba      	move.l 186(sp),d0
    62a8:	d080           	add.l d0,d0
    62aa:	2200           	move.l d0,d1
    62ac:	5281           	addq.l #1,d1
    62ae:	7000           	moveq #0,d0
    62b0:	302f 01c6      	move.w 454(sp),d0
    62b4:	2f01           	move.l d1,-(sp)
    62b6:	2f00           	move.l d0,-(sp)
    62b8:	2f2f 01d0      	move.l 464(sp),-(sp)
    62bc:	2f2f 0056      	move.l 86(sp),-(sp)
    62c0:	4eba 08d2      	jsr 6b94 <TestRow>(pc)
    62c4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    62c8:	702a           	moveq #42,d0
    62ca:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    62ce:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    62d2:	52af 00ba      	addq.l #1,186(sp)
    62d6:	7207           	moveq #7,d1
    62d8:	b2af 00ba      	cmp.l 186(sp),d1
    62dc:	6c9e           	bge.s 627c <TestZoom4Picture+0x254a>
  }

  for(int i=0;i<7;i++) {
    62de:	42af 00b6      	clr.l 182(sp)
    62e2:	6000 00de      	bra.w 63c2 <TestZoom4Picture+0x2690>
    for(int i2=0;i2<3;i2++) {  
    62e6:	42af 00b2      	clr.l 178(sp)
    62ea:	603e           	bra.s 632a <TestZoom4Picture+0x25f8>
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    62ec:	307c 0010      	movea.w #16,a0
    62f0:	d1ef 00b2      	adda.l 178(sp),a0
    62f4:	222f 00b6      	move.l 182(sp),d1
    62f8:	2001           	move.l d1,d0
    62fa:	eb88           	lsl.l #5,d0
    62fc:	d081           	add.l d1,d0
    62fe:	2208           	move.l a0,d1
    6300:	d280           	add.l d0,d1
    6302:	7000           	moveq #0,d0
    6304:	302f 01c6      	move.w 454(sp),d0
    6308:	2f01           	move.l d1,-(sp)
    630a:	2f00           	move.l d0,-(sp)
    630c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6310:	2f2f 0056      	move.l 86(sp),-(sp)
    6314:	4eba 087e      	jsr 6b94 <TestRow>(pc)
    6318:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    631c:	702a           	moveq #42,d0
    631e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6322:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<3;i2++) {  
    6326:	52af 00b2      	addq.l #1,178(sp)
    632a:	7202           	moveq #2,d1
    632c:	b2af 00b2      	cmp.l 178(sp),d1
    6330:	6cba           	bge.s 62ec <TestZoom4Picture+0x25ba>
    }
    
    for(int i2=0;i2<15;i2++) {
    6332:	42af 00ae      	clr.l 174(sp)
    6336:	607c           	bra.s 63b4 <TestZoom4Picture+0x2682>
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    6338:	222f 00b6      	move.l 182(sp),d1
    633c:	2001           	move.l d1,d0
    633e:	eb88           	lsl.l #5,d0
    6340:	2040           	movea.l d0,a0
    6342:	d1c1           	adda.l d1,a0
    6344:	41e8 0013      	lea 19(a0),a0
    6348:	202f 00ae      	move.l 174(sp),d0
    634c:	d080           	add.l d0,d0
    634e:	2208           	move.l a0,d1
    6350:	d280           	add.l d0,d1
    6352:	7000           	moveq #0,d0
    6354:	302f 01c6      	move.w 454(sp),d0
    6358:	2f01           	move.l d1,-(sp)
    635a:	2f00           	move.l d0,-(sp)
    635c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6360:	2f2f 0056      	move.l 86(sp),-(sp)
    6364:	4eba 082e      	jsr 6b94 <TestRow>(pc)
    6368:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    636c:	702a           	moveq #42,d0
    636e:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    6372:	222f 00b6      	move.l 182(sp),d1
    6376:	2001           	move.l d1,d0
    6378:	eb88           	lsl.l #5,d0
    637a:	2040           	movea.l d0,a0
    637c:	d1c1           	adda.l d1,a0
    637e:	41e8 0013      	lea 19(a0),a0
    6382:	202f 00ae      	move.l 174(sp),d0
    6386:	d080           	add.l d0,d0
    6388:	2208           	move.l a0,d1
    638a:	d280           	add.l d0,d1
    638c:	7000           	moveq #0,d0
    638e:	302f 01c6      	move.w 454(sp),d0
    6392:	2f01           	move.l d1,-(sp)
    6394:	2f00           	move.l d0,-(sp)
    6396:	2f2f 01d0      	move.l 464(sp),-(sp)
    639a:	2f2f 0056      	move.l 86(sp),-(sp)
    639e:	4eba 07f4      	jsr 6b94 <TestRow>(pc)
    63a2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    63a6:	722a           	moveq #42,d1
    63a8:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    63ac:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {
    63b0:	52af 00ae      	addq.l #1,174(sp)
    63b4:	700e           	moveq #14,d0
    63b6:	b0af 00ae      	cmp.l 174(sp),d0
    63ba:	6c00 ff7c      	bge.w 6338 <TestZoom4Picture+0x2606>
  for(int i=0;i<7;i++) {
    63be:	52af 00b6      	addq.l #1,182(sp)
    63c2:	7206           	moveq #6,d1
    63c4:	b2af 00b6      	cmp.l 182(sp),d1
    63c8:	6c00 ff1c      	bge.w 62e6 <TestZoom4Picture+0x25b4>
    }
  }

  for(int i2=0;i2<3;i2++) {  
    63cc:	42af 00aa      	clr.l 170(sp)
    63d0:	6032           	bra.s 6404 <TestZoom4Picture+0x26d2>
    TestRow( valsupposed, valactual, mask, 247+i2);
    63d2:	222f 00aa      	move.l 170(sp),d1
    63d6:	0681 0000 00f7 	addi.l #247,d1
    63dc:	7000           	moveq #0,d0
    63de:	302f 01c6      	move.w 454(sp),d0
    63e2:	2f01           	move.l d1,-(sp)
    63e4:	2f00           	move.l d0,-(sp)
    63e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    63ea:	2f2f 0056      	move.l 86(sp),-(sp)
    63ee:	4eba 07a4      	jsr 6b94 <TestRow>(pc)
    63f2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    63f6:	702a           	moveq #42,d0
    63f8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    63fc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<3;i2++) {  
    6400:	52af 00aa      	addq.l #1,170(sp)
    6404:	7202           	moveq #2,d1
    6406:	b2af 00aa      	cmp.l 170(sp),d1
    640a:	6cc6           	bge.s 63d2 <TestZoom4Picture+0x26a0>
  }

  for(int i2=0;i2<10;i2++) {
    640c:	42af 00a6      	clr.l 166(sp)
    6410:	6060           	bra.s 6472 <TestZoom4Picture+0x2740>
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    6412:	707d           	moveq #125,d0
    6414:	d0af 00a6      	add.l 166(sp),d0
    6418:	d080           	add.l d0,d0
    641a:	2200           	move.l d0,d1
    641c:	7000           	moveq #0,d0
    641e:	302f 01c6      	move.w 454(sp),d0
    6422:	2f01           	move.l d1,-(sp)
    6424:	2f00           	move.l d0,-(sp)
    6426:	2f2f 01d0      	move.l 464(sp),-(sp)
    642a:	2f2f 0056      	move.l 86(sp),-(sp)
    642e:	4eba 0764      	jsr 6b94 <TestRow>(pc)
    6432:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6436:	702a           	moveq #42,d0
    6438:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    643c:	202f 00a6      	move.l 166(sp),d0
    6440:	d080           	add.l d0,d0
    6442:	2200           	move.l d0,d1
    6444:	0681 0000 00fb 	addi.l #251,d1
    644a:	7000           	moveq #0,d0
    644c:	302f 01c6      	move.w 454(sp),d0
    6450:	2f01           	move.l d1,-(sp)
    6452:	2f00           	move.l d0,-(sp)
    6454:	2f2f 01d0      	move.l 464(sp),-(sp)
    6458:	2f2f 0056      	move.l 86(sp),-(sp)
    645c:	4eba 0736      	jsr 6b94 <TestRow>(pc)
    6460:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6464:	722a           	moveq #42,d1
    6466:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    646a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {
    646e:	52af 00a6      	addq.l #1,166(sp)
    6472:	7009           	moveq #9,d0
    6474:	b0af 00a6      	cmp.l 166(sp),d0
    6478:	6c98           	bge.s 6412 <TestZoom4Picture+0x26e0>
  }

  tmp = source;
    647a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6480:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6486:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    648c:	4878 0001      	pea 1 <_start+0x1>
    6490:	4878 000f      	pea f <_start+0xf>
    6494:	2f2f 0056      	move.l 86(sp),-(sp)
    6498:	2f2f 006a      	move.l 106(sp),-(sp)
    649c:	4eba b644      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    64a0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    64a4:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    64aa:	2c40           	movea.l d0,a6
    64ac:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    64b0:	222f 004e      	move.l 78(sp),d1
    64b4:	5881           	addq.l #4,d1
    64b6:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom16;
    64ba:	2f7c 0000 bdb0 	move.l #48560,74(sp)
    64c0:	004a 

  mask = 0x0000;
    64c2:	426f 01c6      	clr.w 454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    64c6:	7000           	moveq #0,d0
    64c8:	302f 01c6      	move.w 454(sp),d0
    64cc:	42a7           	clr.l -(sp)
    64ce:	2f00           	move.l d0,-(sp)
    64d0:	2f2f 01d0      	move.l 464(sp),-(sp)
    64d4:	2f2f 0056      	move.l 86(sp),-(sp)
    64d8:	4eba 06ba      	jsr 6b94 <TestRow>(pc)
    64dc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    64e0:	702a           	moveq #42,d0
    64e2:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    64e6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    64ea:	42af 00a2      	clr.l 162(sp)
    64ee:	605a           	bra.s 654a <TestZoom4Picture+0x2818>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    64f0:	202f 00a2      	move.l 162(sp),d0
    64f4:	d080           	add.l d0,d0
    64f6:	2200           	move.l d0,d1
    64f8:	7000           	moveq #0,d0
    64fa:	302f 01c6      	move.w 454(sp),d0
    64fe:	2f01           	move.l d1,-(sp)
    6500:	2f00           	move.l d0,-(sp)
    6502:	2f2f 01d0      	move.l 464(sp),-(sp)
    6506:	2f2f 0056      	move.l 86(sp),-(sp)
    650a:	4eba 0688      	jsr 6b94 <TestRow>(pc)
    650e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6512:	722a           	moveq #42,d1
    6514:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6518:	202f 00a2      	move.l 162(sp),d0
    651c:	d080           	add.l d0,d0
    651e:	2200           	move.l d0,d1
    6520:	5281           	addq.l #1,d1
    6522:	7000           	moveq #0,d0
    6524:	302f 01c6      	move.w 454(sp),d0
    6528:	2f01           	move.l d1,-(sp)
    652a:	2f00           	move.l d0,-(sp)
    652c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6530:	2f2f 0056      	move.l 86(sp),-(sp)
    6534:	4eba 065e      	jsr 6b94 <TestRow>(pc)
    6538:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    653c:	702a           	moveq #42,d0
    653e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6542:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    6546:	52af 00a2      	addq.l #1,162(sp)
    654a:	7205           	moveq #5,d1
    654c:	b2af 00a2      	cmp.l 162(sp),d1
    6550:	6c9e           	bge.s 64f0 <TestZoom4Picture+0x27be>
  }

  for(int i=0;i<7;i++) {
    6552:	42af 009e      	clr.l 158(sp)
    6556:	6000 00e6      	bra.w 663e <TestZoom4Picture+0x290c>
    for(int i2=0;i2<2;i2++) {  
    655a:	42af 009a      	clr.l 154(sp)
    655e:	6040           	bra.s 65a0 <TestZoom4Picture+0x286e>
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    6560:	307c 000d      	movea.w #13,a0
    6564:	d1ef 009a      	adda.l 154(sp),a0
    6568:	222f 009e      	move.l 158(sp),d1
    656c:	2001           	move.l d1,d0
    656e:	e988           	lsl.l #4,d0
    6570:	d081           	add.l d1,d0
    6572:	d080           	add.l d0,d0
    6574:	2208           	move.l a0,d1
    6576:	d280           	add.l d0,d1
    6578:	7000           	moveq #0,d0
    657a:	302f 01c6      	move.w 454(sp),d0
    657e:	2f01           	move.l d1,-(sp)
    6580:	2f00           	move.l d0,-(sp)
    6582:	2f2f 01d0      	move.l 464(sp),-(sp)
    6586:	2f2f 0056      	move.l 86(sp),-(sp)
    658a:	4eba 0608      	jsr 6b94 <TestRow>(pc)
    658e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6592:	702a           	moveq #42,d0
    6594:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6598:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<2;i2++) {  
    659c:	52af 009a      	addq.l #1,154(sp)
    65a0:	7201           	moveq #1,d1
    65a2:	b2af 009a      	cmp.l 154(sp),d1
    65a6:	6cb8           	bge.s 6560 <TestZoom4Picture+0x282e>
    }
    
    for(int i2=0;i2<16;i2++) {
    65a8:	42af 0096      	clr.l 150(sp)
    65ac:	6000 0082      	bra.w 6630 <TestZoom4Picture+0x28fe>
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    65b0:	222f 009e      	move.l 158(sp),d1
    65b4:	2001           	move.l d1,d0
    65b6:	e988           	lsl.l #4,d0
    65b8:	d081           	add.l d1,d0
    65ba:	d080           	add.l d0,d0
    65bc:	2040           	movea.l d0,a0
    65be:	41e8 0010      	lea 16(a0),a0
    65c2:	202f 0096      	move.l 150(sp),d0
    65c6:	d080           	add.l d0,d0
    65c8:	2208           	move.l a0,d1
    65ca:	d280           	add.l d0,d1
    65cc:	7000           	moveq #0,d0
    65ce:	302f 01c6      	move.w 454(sp),d0
    65d2:	2f01           	move.l d1,-(sp)
    65d4:	2f00           	move.l d0,-(sp)
    65d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    65da:	2f2f 0056      	move.l 86(sp),-(sp)
    65de:	4eba 05b4      	jsr 6b94 <TestRow>(pc)
    65e2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    65e6:	702a           	moveq #42,d0
    65e8:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    65ec:	222f 009e      	move.l 158(sp),d1
    65f0:	2001           	move.l d1,d0
    65f2:	e988           	lsl.l #4,d0
    65f4:	d081           	add.l d1,d0
    65f6:	d080           	add.l d0,d0
    65f8:	2040           	movea.l d0,a0
    65fa:	41e8 0011      	lea 17(a0),a0
    65fe:	202f 0096      	move.l 150(sp),d0
    6602:	d080           	add.l d0,d0
    6604:	2208           	move.l a0,d1
    6606:	d280           	add.l d0,d1
    6608:	7000           	moveq #0,d0
    660a:	302f 01c6      	move.w 454(sp),d0
    660e:	2f01           	move.l d1,-(sp)
    6610:	2f00           	move.l d0,-(sp)
    6612:	2f2f 01d0      	move.l 464(sp),-(sp)
    6616:	2f2f 0056      	move.l 86(sp),-(sp)
    661a:	4eba 0578      	jsr 6b94 <TestRow>(pc)
    661e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6622:	722a           	moveq #42,d1
    6624:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6628:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {
    662c:	52af 0096      	addq.l #1,150(sp)
    6630:	700f           	moveq #15,d0
    6632:	b0af 0096      	cmp.l 150(sp),d0
    6636:	6c00 ff78      	bge.w 65b0 <TestZoom4Picture+0x287e>
  for(int i=0;i<7;i++) {
    663a:	52af 009e      	addq.l #1,158(sp)
    663e:	7206           	moveq #6,d1
    6640:	b2af 009e      	cmp.l 158(sp),d1
    6644:	6c00 ff14      	bge.w 655a <TestZoom4Picture+0x2828>
    }
  }

  for(int i2=0;i2<2;i2++) {
    6648:	42af 0092      	clr.l 146(sp)
    664c:	6032           	bra.s 6680 <TestZoom4Picture+0x294e>
    TestRow( valsupposed, valactual, mask, 251+i2);
    664e:	222f 0092      	move.l 146(sp),d1
    6652:	0681 0000 00fb 	addi.l #251,d1
    6658:	7000           	moveq #0,d0
    665a:	302f 01c6      	move.w 454(sp),d0
    665e:	2f01           	move.l d1,-(sp)
    6660:	2f00           	move.l d0,-(sp)
    6662:	2f2f 01d0      	move.l 464(sp),-(sp)
    6666:	2f2f 0056      	move.l 86(sp),-(sp)
    666a:	4eba 0528      	jsr 6b94 <TestRow>(pc)
    666e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6672:	702a           	moveq #42,d0
    6674:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6678:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<2;i2++) {
    667c:	52af 0092      	addq.l #1,146(sp)
    6680:	7201           	moveq #1,d1
    6682:	b2af 0092      	cmp.l 146(sp),d1
    6686:	6cc6           	bge.s 664e <TestZoom4Picture+0x291c>
  }

  for(int i2=0;i2<8;i2++) {
    6688:	42af 008e      	clr.l 142(sp)
    668c:	6060           	bra.s 66ee <TestZoom4Picture+0x29bc>
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    668e:	202f 008e      	move.l 142(sp),d0
    6692:	d080           	add.l d0,d0
    6694:	2200           	move.l d0,d1
    6696:	0681 0000 00fd 	addi.l #253,d1
    669c:	7000           	moveq #0,d0
    669e:	302f 01c6      	move.w 454(sp),d0
    66a2:	2f01           	move.l d1,-(sp)
    66a4:	2f00           	move.l d0,-(sp)
    66a6:	2f2f 01d0      	move.l 464(sp),-(sp)
    66aa:	2f2f 0056      	move.l 86(sp),-(sp)
    66ae:	4eba 04e4      	jsr 6b94 <TestRow>(pc)
    66b2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66b6:	702a           	moveq #42,d0
    66b8:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    66bc:	707f           	moveq #127,d0
    66be:	d0af 008e      	add.l 142(sp),d0
    66c2:	d080           	add.l d0,d0
    66c4:	2200           	move.l d0,d1
    66c6:	7000           	moveq #0,d0
    66c8:	302f 01c6      	move.w 454(sp),d0
    66cc:	2f01           	move.l d1,-(sp)
    66ce:	2f00           	move.l d0,-(sp)
    66d0:	2f2f 01d0      	move.l 464(sp),-(sp)
    66d4:	2f2f 0056      	move.l 86(sp),-(sp)
    66d8:	4eba 04ba      	jsr 6b94 <TestRow>(pc)
    66dc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66e0:	722a           	moveq #42,d1
    66e2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    66e6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    66ea:	52af 008e      	addq.l #1,142(sp)
    66ee:	7007           	moveq #7,d0
    66f0:	b0af 008e      	cmp.l 142(sp),d0
    66f4:	6c98           	bge.s 668e <TestZoom4Picture+0x295c>
  }

  tmp = source;
    66f6:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    66fc:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6702:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    6708:	4878 0001      	pea 1 <_start+0x1>
    670c:	4878 0010      	pea 10 <_start+0x10>
    6710:	2f2f 0056      	move.l 86(sp),-(sp)
    6714:	2f2f 006a      	move.l 106(sp),-(sp)
    6718:	4eba b3c8      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    671c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6720:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    6726:	2c40           	movea.l d0,a6
    6728:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    672c:	222f 004e      	move.l 78(sp),d1
    6730:	5881           	addq.l #4,d1
    6732:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom17;
    6736:	2f7c 0000 bddc 	move.l #48604,74(sp)
    673c:	004a 

  mask = 0xffff;
    673e:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<5;i2++) {
    6744:	42af 008a      	clr.l 138(sp)
    6748:	605a           	bra.s 67a4 <TestZoom4Picture+0x2a72>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    674a:	202f 008a      	move.l 138(sp),d0
    674e:	d080           	add.l d0,d0
    6750:	2200           	move.l d0,d1
    6752:	7000           	moveq #0,d0
    6754:	302f 01c6      	move.w 454(sp),d0
    6758:	2f01           	move.l d1,-(sp)
    675a:	2f00           	move.l d0,-(sp)
    675c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6760:	2f2f 0056      	move.l 86(sp),-(sp)
    6764:	4eba 042e      	jsr 6b94 <TestRow>(pc)
    6768:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    676c:	702a           	moveq #42,d0
    676e:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6772:	202f 008a      	move.l 138(sp),d0
    6776:	d080           	add.l d0,d0
    6778:	2200           	move.l d0,d1
    677a:	5281           	addq.l #1,d1
    677c:	7000           	moveq #0,d0
    677e:	302f 01c6      	move.w 454(sp),d0
    6782:	2f01           	move.l d1,-(sp)
    6784:	2f00           	move.l d0,-(sp)
    6786:	2f2f 01d0      	move.l 464(sp),-(sp)
    678a:	2f2f 0056      	move.l 86(sp),-(sp)
    678e:	4eba 0404      	jsr 6b94 <TestRow>(pc)
    6792:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6796:	722a           	moveq #42,d1
    6798:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    679c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {
    67a0:	52af 008a      	addq.l #1,138(sp)
    67a4:	7004           	moveq #4,d0
    67a6:	b0af 008a      	cmp.l 138(sp),d0
    67aa:	6c9e           	bge.s 674a <TestZoom4Picture+0x2a18>
  }

  for(int i=0;i<7;i++) {
    67ac:	42af 0086      	clr.l 134(sp)
    67b0:	6000 00d4      	bra.w 6886 <TestZoom4Picture+0x2b54>
      TestRow( valsupposed, valactual, mask, 10+i*35);
    67b4:	222f 0086      	move.l 134(sp),d1
    67b8:	2001           	move.l d1,d0
    67ba:	e988           	lsl.l #4,d0
    67bc:	d081           	add.l d1,d0
    67be:	d080           	add.l d0,d0
    67c0:	2040           	movea.l d0,a0
    67c2:	d1c1           	adda.l d1,a0
    67c4:	41e8 000a      	lea 10(a0),a0
    67c8:	7000           	moveq #0,d0
    67ca:	302f 01c6      	move.w 454(sp),d0
    67ce:	2f08           	move.l a0,-(sp)
    67d0:	2f00           	move.l d0,-(sp)
    67d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    67d6:	2f2f 0056      	move.l 86(sp),-(sp)
    67da:	4eba 03b8      	jsr 6b94 <TestRow>(pc)
    67de:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    67e2:	722a           	moveq #42,d1
    67e4:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    67e8:	466f 01c6      	not.w 454(sp)
    
    for(int i2=0;i2<17;i2++) {
    67ec:	42af 0082      	clr.l 130(sp)
    67f0:	6000 0086      	bra.w 6878 <TestZoom4Picture+0x2b46>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    67f4:	222f 0086      	move.l 134(sp),d1
    67f8:	2001           	move.l d1,d0
    67fa:	e988           	lsl.l #4,d0
    67fc:	d081           	add.l d1,d0
    67fe:	d080           	add.l d0,d0
    6800:	2040           	movea.l d0,a0
    6802:	d1c1           	adda.l d1,a0
    6804:	41e8 000b      	lea 11(a0),a0
    6808:	202f 0082      	move.l 130(sp),d0
    680c:	d080           	add.l d0,d0
    680e:	2208           	move.l a0,d1
    6810:	d280           	add.l d0,d1
    6812:	7000           	moveq #0,d0
    6814:	302f 01c6      	move.w 454(sp),d0
    6818:	2f01           	move.l d1,-(sp)
    681a:	2f00           	move.l d0,-(sp)
    681c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6820:	2f2f 0056      	move.l 86(sp),-(sp)
    6824:	4eba 036e      	jsr 6b94 <TestRow>(pc)
    6828:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    682c:	702a           	moveq #42,d0
    682e:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6832:	222f 0086      	move.l 134(sp),d1
    6836:	2001           	move.l d1,d0
    6838:	e988           	lsl.l #4,d0
    683a:	d081           	add.l d1,d0
    683c:	d080           	add.l d0,d0
    683e:	2040           	movea.l d0,a0
    6840:	d1c1           	adda.l d1,a0
    6842:	41e8 000c      	lea 12(a0),a0
    6846:	202f 0082      	move.l 130(sp),d0
    684a:	d080           	add.l d0,d0
    684c:	2208           	move.l a0,d1
    684e:	d280           	add.l d0,d1
    6850:	7000           	moveq #0,d0
    6852:	302f 01c6      	move.w 454(sp),d0
    6856:	2f01           	move.l d1,-(sp)
    6858:	2f00           	move.l d0,-(sp)
    685a:	2f2f 01d0      	move.l 464(sp),-(sp)
    685e:	2f2f 0056      	move.l 86(sp),-(sp)
    6862:	4eba 0330      	jsr 6b94 <TestRow>(pc)
    6866:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    686a:	722a           	moveq #42,d1
    686c:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6870:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<17;i2++) {
    6874:	52af 0082      	addq.l #1,130(sp)
    6878:	7010           	moveq #16,d0
    687a:	b0af 0082      	cmp.l 130(sp),d0
    687e:	6c00 ff74      	bge.w 67f4 <TestZoom4Picture+0x2ac2>
  for(int i=0;i<7;i++) {
    6882:	52af 0086      	addq.l #1,134(sp)
    6886:	7206           	moveq #6,d1
    6888:	b2af 0086      	cmp.l 134(sp),d1
    688c:	6c00 ff26      	bge.w 67b4 <TestZoom4Picture+0x2a82>
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    6890:	7000           	moveq #0,d0
    6892:	302f 01c6      	move.w 454(sp),d0
    6896:	4878 00ff      	pea ff <FreeDisplay+0x1f>
    689a:	2f00           	move.l d0,-(sp)
    689c:	2f2f 01d0      	move.l 464(sp),-(sp)
    68a0:	2f2f 0056      	move.l 86(sp),-(sp)
    68a4:	4eba 02ee      	jsr 6b94 <TestRow>(pc)
    68a8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    68ac:	702a           	moveq #42,d0
    68ae:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    68b2:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<7;i2++) {
    68b6:	42af 007e      	clr.l 126(sp)
    68ba:	6064           	bra.s 6920 <TestZoom4Picture+0x2bee>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    68bc:	202f 007e      	move.l 126(sp),d0
    68c0:	0680 0000 0080 	addi.l #128,d0
    68c6:	d080           	add.l d0,d0
    68c8:	2200           	move.l d0,d1
    68ca:	7000           	moveq #0,d0
    68cc:	302f 01c6      	move.w 454(sp),d0
    68d0:	2f01           	move.l d1,-(sp)
    68d2:	2f00           	move.l d0,-(sp)
    68d4:	2f2f 01d0      	move.l 464(sp),-(sp)
    68d8:	2f2f 0056      	move.l 86(sp),-(sp)
    68dc:	4eba 02b6      	jsr 6b94 <TestRow>(pc)
    68e0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    68e4:	722a           	moveq #42,d1
    68e6:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    68ea:	202f 007e      	move.l 126(sp),d0
    68ee:	d080           	add.l d0,d0
    68f0:	2200           	move.l d0,d1
    68f2:	0681 0000 0101 	addi.l #257,d1
    68f8:	7000           	moveq #0,d0
    68fa:	302f 01c6      	move.w 454(sp),d0
    68fe:	2f01           	move.l d1,-(sp)
    6900:	2f00           	move.l d0,-(sp)
    6902:	2f2f 01d0      	move.l 464(sp),-(sp)
    6906:	2f2f 0056      	move.l 86(sp),-(sp)
    690a:	4eba 0288      	jsr 6b94 <TestRow>(pc)
    690e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6912:	702a           	moveq #42,d0
    6914:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6918:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {
    691c:	52af 007e      	addq.l #1,126(sp)
    6920:	7206           	moveq #6,d1
    6922:	b2af 007e      	cmp.l 126(sp),d1
    6926:	6c94           	bge.s 68bc <TestZoom4Picture+0x2b8a>
  }   

  tmp = source;
    6928:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    692e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6934:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    693a:	4878 0001      	pea 1 <_start+0x1>
    693e:	4878 0011      	pea 11 <_start+0x11>
    6942:	2f2f 0056      	move.l 86(sp),-(sp)
    6946:	2f2f 006a      	move.l 106(sp),-(sp)
    694a:	4eba b196      	jsr 1ae2 <Zoom_ZoomIntoPicture>(pc)
    694e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6952:	2039 004d 2c80 	move.l 4d2c80 <GfxBase>,d0
    6958:	2c40           	movea.l d0,a6
    695a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    695e:	202f 004e      	move.l 78(sp),d0
    6962:	5880           	addq.l #4,d0
    6964:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom18;
    6968:	2f7c 0000 be08 	move.l #48648,74(sp)
    696e:	004a 

  mask = 0xffff;
    6970:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);
    6976:	7000           	moveq #0,d0
    6978:	302f 01c6      	move.w 454(sp),d0
    697c:	42a7           	clr.l -(sp)
    697e:	2f00           	move.l d0,-(sp)
    6980:	2f2f 01d0      	move.l 464(sp),-(sp)
    6984:	2f2f 0056      	move.l 86(sp),-(sp)
    6988:	4eba 020a      	jsr 6b94 <TestRow>(pc)
    698c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6990:	722a           	moveq #42,d1
    6992:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    6996:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<4;i2++) {
    699a:	42af 007a      	clr.l 122(sp)
    699e:	605c           	bra.s 69fc <TestZoom4Picture+0x2cca>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    69a0:	202f 007a      	move.l 122(sp),d0
    69a4:	d080           	add.l d0,d0
    69a6:	2200           	move.l d0,d1
    69a8:	5281           	addq.l #1,d1
    69aa:	7000           	moveq #0,d0
    69ac:	302f 01c6      	move.w 454(sp),d0
    69b0:	2f01           	move.l d1,-(sp)
    69b2:	2f00           	move.l d0,-(sp)
    69b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    69b8:	2f2f 0056      	move.l 86(sp),-(sp)
    69bc:	4eba 01d6      	jsr 6b94 <TestRow>(pc)
    69c0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    69c4:	702a           	moveq #42,d0
    69c6:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    69ca:	202f 007a      	move.l 122(sp),d0
    69ce:	5280           	addq.l #1,d0
    69d0:	d080           	add.l d0,d0
    69d2:	2200           	move.l d0,d1
    69d4:	7000           	moveq #0,d0
    69d6:	302f 01c6      	move.w 454(sp),d0
    69da:	2f01           	move.l d1,-(sp)
    69dc:	2f00           	move.l d0,-(sp)
    69de:	2f2f 01d0      	move.l 464(sp),-(sp)
    69e2:	2f2f 0056      	move.l 86(sp),-(sp)
    69e6:	4eba 01ac      	jsr 6b94 <TestRow>(pc)
    69ea:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    69ee:	722a           	moveq #42,d1
    69f0:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    69f4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    69f8:	52af 007a      	addq.l #1,122(sp)
    69fc:	7003           	moveq #3,d0
    69fe:	b0af 007a      	cmp.l 122(sp),d0
    6a02:	6c9c           	bge.s 69a0 <TestZoom4Picture+0x2c6e>
  }

  for(int i=0;i<7;i++) {  
    6a04:	42af 0076      	clr.l 118(sp)
    6a08:	6000 009c      	bra.w 6aa6 <TestZoom4Picture+0x2d74>
    for(int i2=0;i2<18;i2++) {
    6a0c:	42af 0072      	clr.l 114(sp)
    6a10:	6000 0086      	bra.w 6a98 <TestZoom4Picture+0x2d66>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6a14:	222f 0076      	move.l 118(sp),d1
    6a18:	2001           	move.l d1,d0
    6a1a:	e988           	lsl.l #4,d0
    6a1c:	d081           	add.l d1,d0
    6a1e:	d080           	add.l d0,d0
    6a20:	2040           	movea.l d0,a0
    6a22:	d1c1           	adda.l d1,a0
    6a24:	41e8 000b      	lea 11(a0),a0
    6a28:	202f 0072      	move.l 114(sp),d0
    6a2c:	d080           	add.l d0,d0
    6a2e:	2208           	move.l a0,d1
    6a30:	d280           	add.l d0,d1
    6a32:	7000           	moveq #0,d0
    6a34:	302f 01c6      	move.w 454(sp),d0
    6a38:	2f01           	move.l d1,-(sp)
    6a3a:	2f00           	move.l d0,-(sp)
    6a3c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a40:	2f2f 0056      	move.l 86(sp),-(sp)
    6a44:	4eba 014e      	jsr 6b94 <TestRow>(pc)
    6a48:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6a4c:	722a           	moveq #42,d1
    6a4e:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6a52:	222f 0076      	move.l 118(sp),d1
    6a56:	2001           	move.l d1,d0
    6a58:	e988           	lsl.l #4,d0
    6a5a:	d081           	add.l d1,d0
    6a5c:	d080           	add.l d0,d0
    6a5e:	2040           	movea.l d0,a0
    6a60:	d1c1           	adda.l d1,a0
    6a62:	41e8 000c      	lea 12(a0),a0
    6a66:	202f 0072      	move.l 114(sp),d0
    6a6a:	d080           	add.l d0,d0
    6a6c:	2208           	move.l a0,d1
    6a6e:	d280           	add.l d0,d1
    6a70:	7000           	moveq #0,d0
    6a72:	302f 01c6      	move.w 454(sp),d0
    6a76:	2f01           	move.l d1,-(sp)
    6a78:	2f00           	move.l d0,-(sp)
    6a7a:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a7e:	2f2f 0056      	move.l 86(sp),-(sp)
    6a82:	4eba 0110      	jsr 6b94 <TestRow>(pc)
    6a86:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6a8a:	702a           	moveq #42,d0
    6a8c:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6a90:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) {
    6a94:	52af 0072      	addq.l #1,114(sp)
    6a98:	7211           	moveq #17,d1
    6a9a:	b2af 0072      	cmp.l 114(sp),d1
    6a9e:	6c00 ff74      	bge.w 6a14 <TestZoom4Picture+0x2ce2>
  for(int i=0;i<7;i++) {  
    6aa2:	52af 0076      	addq.l #1,118(sp)
    6aa6:	7006           	moveq #6,d0
    6aa8:	b0af 0076      	cmp.l 118(sp),d0
    6aac:	6c00 ff5e      	bge.w 6a0c <TestZoom4Picture+0x2cda>
    }
  } 

  for(int i2=0;i2<4;i2++) {
    6ab0:	42af 006e      	clr.l 110(sp)
    6ab4:	6064           	bra.s 6b1a <TestZoom4Picture+0x2de8>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6ab6:	202f 006e      	move.l 110(sp),d0
    6aba:	0680 0000 0080 	addi.l #128,d0
    6ac0:	d080           	add.l d0,d0
    6ac2:	2200           	move.l d0,d1
    6ac4:	7000           	moveq #0,d0
    6ac6:	302f 01c6      	move.w 454(sp),d0
    6aca:	2f01           	move.l d1,-(sp)
    6acc:	2f00           	move.l d0,-(sp)
    6ace:	2f2f 01d0      	move.l 464(sp),-(sp)
    6ad2:	2f2f 0056      	move.l 86(sp),-(sp)
    6ad6:	4eba 00bc      	jsr 6b94 <TestRow>(pc)
    6ada:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6ade:	722a           	moveq #42,d1
    6ae0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6ae4:	202f 006e      	move.l 110(sp),d0
    6ae8:	d080           	add.l d0,d0
    6aea:	2200           	move.l d0,d1
    6aec:	0681 0000 0101 	addi.l #257,d1
    6af2:	7000           	moveq #0,d0
    6af4:	302f 01c6      	move.w 454(sp),d0
    6af8:	2f01           	move.l d1,-(sp)
    6afa:	2f00           	move.l d0,-(sp)
    6afc:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b00:	2f2f 0056      	move.l 86(sp),-(sp)
    6b04:	4eba 008e      	jsr 6b94 <TestRow>(pc)
    6b08:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6b0c:	702a           	moveq #42,d0
    6b0e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6b12:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6b16:	52af 006e      	addq.l #1,110(sp)
    6b1a:	7203           	moveq #3,d1
    6b1c:	b2af 006e      	cmp.l 110(sp),d1
    6b20:	6c94           	bge.s 6ab6 <TestZoom4Picture+0x2d84>
  }
  TestRow( valsupposed, valactual, mask, 0);
    6b22:	7000           	moveq #0,d0
    6b24:	302f 01c6      	move.w 454(sp),d0
    6b28:	42a7           	clr.l -(sp)
    6b2a:	2f00           	move.l d0,-(sp)
    6b2c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b30:	2f2f 0056      	move.l 86(sp),-(sp)
    6b34:	4eba 005e      	jsr 6b94 <TestRow>(pc)
    6b38:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6b3c:	702a           	moveq #42,d0
    6b3e:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6b42:	466f 01c6      	not.w 454(sp)
  FreeMem( source, (ZMLINESIZE+4)*272);
    6b46:	2f6f 005e 0042 	move.l 94(sp),66(sp)
    6b4c:	2f7c 0000 30e0 	move.l #12512,62(sp)
    6b52:	003e 
    6b54:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    6b5a:	2c40           	movea.l d0,a6
    6b5c:	226f 0042      	movea.l 66(sp),a1
    6b60:	202f 003e      	move.l 62(sp),d0
    6b64:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    6b68:	2f6f 004e 003a 	move.l 78(sp),58(sp)
    6b6e:	2f7c 0000 30e0 	move.l #12512,54(sp)
    6b74:	0036 
    6b76:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    6b7c:	2c40           	movea.l d0,a6
    6b7e:	226f 003a      	movea.l 58(sp),a1
    6b82:	202f 0036      	move.l 54(sp),d0
    6b86:	4eae ff2e      	jsr -210(a6)
}
    6b8a:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    6b8e:	4fef 01d0      	lea 464(sp),sp
    6b92:	4e75           	rts

00006b94 <TestRow>:

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    6b94:	4fef ff40      	lea -192(sp),sp
    6b98:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
    6b9c:	202f 00e0      	move.l 224(sp),d0
    6ba0:	3000           	move.w d0,d0
    6ba2:	3f40 0016      	move.w d0,22(sp)
  
  char str[ 100] = { 0 };
    6ba6:	42af 001c      	clr.l 28(sp)
    6baa:	7020           	moveq #32,d0
    6bac:	d08f           	add.l sp,d0
    6bae:	7260           	moveq #96,d1
    6bb0:	2f01           	move.l d1,-(sp)
    6bb2:	42a7           	clr.l -(sp)
    6bb4:	2f00           	move.l d0,-(sp)
    6bb6:	4eba 020c      	jsr 6dc4 <memset>(pc)
    6bba:	4fef 000c      	lea 12(sp),sp
  UWORD data[2];
  data[1] = numberofline;
    6bbe:	202f 00e4      	move.l 228(sp),d0
    6bc2:	3f40 001a      	move.w d0,26(sp)

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    6bc6:	42af 00d0      	clr.l 208(sp)
    6bca:	6000 00d4      	bra.w 6ca0 <TestRow+0x10c>
    if( (*testpattern++ ^ xormask) != *destination++) {
    6bce:	202f 00d8      	move.l 216(sp),d0
    6bd2:	2200           	move.l d0,d1
    6bd4:	5481           	addq.l #2,d1
    6bd6:	2f41 00d8      	move.l d1,216(sp)
    6bda:	2040           	movea.l d0,a0
    6bdc:	3010           	move.w (a0),d0
    6bde:	322f 0016      	move.w 22(sp),d1
    6be2:	b141           	eor.w d0,d1
    6be4:	202f 00dc      	move.l 220(sp),d0
    6be8:	2400           	move.l d0,d2
    6bea:	5482           	addq.l #2,d2
    6bec:	2f42 00dc      	move.l d2,220(sp)
    6bf0:	2040           	movea.l d0,a0
    6bf2:	3010           	move.w (a0),d0
    6bf4:	b041           	cmp.w d1,d0
    6bf6:	6700 00a4      	beq.w 6c9c <TestRow+0x108>
      data[0] = i;
    6bfa:	202f 00d0      	move.l 208(sp),d0
    6bfe:	3f40 0018      	move.w d0,24(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    6c02:	2f7c 0000 8540 	move.l #34112,164(sp)
    6c08:	00a4 
    6c0a:	702b           	moveq #43,d0
    6c0c:	4600           	not.b d0
    6c0e:	d08f           	add.l sp,d0
    6c10:	0680 ffff ff44 	addi.l #-188,d0
    6c16:	2f40 00a0      	move.l d0,160(sp)
    6c1a:	2f7c 0000 7264 	move.l #29284,156(sp)
    6c20:	009c 
    6c22:	722b           	moveq #43,d1
    6c24:	4601           	not.b d1
    6c26:	d28f           	add.l sp,d1
    6c28:	0681 ffff ff48 	addi.l #-184,d1
    6c2e:	2f41 0098      	move.l d1,152(sp)
    6c32:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    6c38:	2c40           	movea.l d0,a6
    6c3a:	206f 00a4      	movea.l 164(sp),a0
    6c3e:	226f 00a0      	movea.l 160(sp),a1
    6c42:	246f 009c      	movea.l 156(sp),a2
    6c46:	266f 0098      	movea.l 152(sp),a3
    6c4a:	4eae fdf6      	jsr -522(a6)
    6c4e:	2f40 0094      	move.l d0,148(sp)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    6c52:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    6c58:	2c40           	movea.l d0,a6
    6c5a:	4eae ffc4      	jsr -60(a6)
    6c5e:	2f40 0090      	move.l d0,144(sp)
    6c62:	202f 0090      	move.l 144(sp),d0
    6c66:	2f40 008c      	move.l d0,140(sp)
    6c6a:	742b           	moveq #43,d2
    6c6c:	4602           	not.b d2
    6c6e:	d48f           	add.l sp,d2
    6c70:	0682 ffff ff48 	addi.l #-184,d2
    6c76:	2f42 0088      	move.l d2,136(sp)
    6c7a:	7064           	moveq #100,d0
    6c7c:	2f40 0084      	move.l d0,132(sp)
    6c80:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    6c86:	2c40           	movea.l d0,a6
    6c88:	222f 008c      	move.l 140(sp),d1
    6c8c:	242f 0088      	move.l 136(sp),d2
    6c90:	262f 0084      	move.l 132(sp),d3
    6c94:	4eae ffd0      	jsr -48(a6)
    6c98:	2f40 0080      	move.l d0,128(sp)
  for(int i=0;i<21;i++) {
    6c9c:	52af 00d0      	addq.l #1,208(sp)
    6ca0:	7214           	moveq #20,d1
    6ca2:	b2af 00d0      	cmp.l 208(sp),d1
    6ca6:	6c00 ff26      	bge.w 6bce <TestRow+0x3a>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    6caa:	206f 00d8      	movea.l 216(sp),a0
    6cae:	3010           	move.w (a0),d0
    6cb0:	322f 0016      	move.w 22(sp),d1
    6cb4:	b141           	eor.w d0,d1
    6cb6:	206f 00dc      	movea.l 220(sp),a0
    6cba:	3010           	move.w (a0),d0
    6cbc:	b340           	eor.w d1,d0
    6cbe:	3000           	move.w d0,d0
    6cc0:	0280 0000 ffff 	andi.l #65535,d0
    6cc6:	0280 0000 ff00 	andi.l #65280,d0
    6ccc:	6700 00cc      	beq.w 6d9a <TestRow+0x206>
    data[0] = 21;
    6cd0:	3f7c 0015 0018 	move.w #21,24(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    6cd6:	2f7c 0000 8540 	move.l #34112,204(sp)
    6cdc:	00cc 
    6cde:	742b           	moveq #43,d2
    6ce0:	4602           	not.b d2
    6ce2:	d48f           	add.l sp,d2
    6ce4:	0682 ffff ff44 	addi.l #-188,d2
    6cea:	2f42 00c8      	move.l d2,200(sp)
    6cee:	2f7c 0000 7264 	move.l #29284,196(sp)
    6cf4:	00c4 
    6cf6:	702b           	moveq #43,d0
    6cf8:	4600           	not.b d0
    6cfa:	d08f           	add.l sp,d0
    6cfc:	0680 ffff ff48 	addi.l #-184,d0
    6d02:	2f40 00c0      	move.l d0,192(sp)
    6d06:	2039 004d 2c74 	move.l 4d2c74 <SysBase>,d0
    6d0c:	2c40           	movea.l d0,a6
    6d0e:	206f 00cc      	movea.l 204(sp),a0
    6d12:	226f 00c8      	movea.l 200(sp),a1
    6d16:	246f 00c4      	movea.l 196(sp),a2
    6d1a:	266f 00c0      	movea.l 192(sp),a3
    6d1e:	4eae fdf6      	jsr -522(a6)
    6d22:	2f40 00bc      	move.l d0,188(sp)
                                                                           str);
    Write(  Output(), str, 100);
    6d26:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    6d2c:	2c40           	movea.l d0,a6
    6d2e:	4eae ffc4      	jsr -60(a6)
    6d32:	2f40 00b8      	move.l d0,184(sp)
    6d36:	202f 00b8      	move.l 184(sp),d0
    6d3a:	2f40 00b4      	move.l d0,180(sp)
    6d3e:	722b           	moveq #43,d1
    6d40:	4601           	not.b d1
    6d42:	d28f           	add.l sp,d1
    6d44:	0681 ffff ff48 	addi.l #-184,d1
    6d4a:	2f41 00b0      	move.l d1,176(sp)
    6d4e:	7464           	moveq #100,d2
    6d50:	2f42 00ac      	move.l d2,172(sp)
    6d54:	2039 004d 2c7c 	move.l 4d2c7c <DOSBase>,d0
    6d5a:	2c40           	movea.l d0,a6
    6d5c:	222f 00b4      	move.l 180(sp),d1
    6d60:	242f 00b0      	move.l 176(sp),d2
    6d64:	262f 00ac      	move.l 172(sp),d3
    6d68:	4eae ffd0      	jsr -48(a6)
    6d6c:	2f40 00a8      	move.l d0,168(sp)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
    6d70:	206f 00dc      	movea.l 220(sp),a0
    6d74:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6d76:	7200           	moveq #0,d1
    6d78:	3200           	move.w d0,d1
                                                   *testpattern,*destination);
    6d7a:	206f 00d8      	movea.l 216(sp),a0
    6d7e:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6d80:	3000           	move.w d0,d0
    6d82:	0280 0000 ffff 	andi.l #65535,d0
    6d88:	2f01           	move.l d1,-(sp)
    6d8a:	2f00           	move.l d0,-(sp)
    6d8c:	4879 0000 8570 	pea 8570 <rundemo.c.95627ee6+0x18a>
    6d92:	4eba 0162      	jsr 6ef6 <KPrintF>(pc)
    6d96:	4fef 000c      	lea 12(sp),sp
     
  }
}
    6d9a:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    6d9e:	4fef 00c0      	lea 192(sp),sp
    6da2:	4e75           	rts

00006da4 <strlen>:
{
    6da4:	598f           	subq.l #4,sp
	unsigned long t=0;
    6da6:	4297           	clr.l (sp)
    6da8:	6002           	bra.s 6dac <strlen+0x8>
		t++;
    6daa:	5297           	addq.l #1,(sp)
	while(*s++)
    6dac:	202f 0008      	move.l 8(sp),d0
    6db0:	2200           	move.l d0,d1
    6db2:	5281           	addq.l #1,d1
    6db4:	2f41 0008      	move.l d1,8(sp)
    6db8:	2040           	movea.l d0,a0
    6dba:	1010           	move.b (a0),d0
    6dbc:	66ec           	bne.s 6daa <strlen+0x6>
	return t;
    6dbe:	2017           	move.l (sp),d0
}
    6dc0:	588f           	addq.l #4,sp
    6dc2:	4e75           	rts

00006dc4 <memset>:
{
    6dc4:	4e55 fffc      	link.w a5,#-4
	unsigned char *ptr = (unsigned char *)dest;
    6dc8:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
    6dce:	6014           	bra.s 6de4 <memset+0x20>
		*ptr++ = val;
    6dd0:	202d fffc      	move.l -4(a5),d0
    6dd4:	2200           	move.l d0,d1
    6dd6:	5281           	addq.l #1,d1
    6dd8:	2b41 fffc      	move.l d1,-4(a5)
    6ddc:	222d 000c      	move.l 12(a5),d1
    6de0:	2040           	movea.l d0,a0
    6de2:	1081           	move.b d1,(a0)
	while(len-- > 0)
    6de4:	202d 0010      	move.l 16(a5),d0
    6de8:	2200           	move.l d0,d1
    6dea:	5381           	subq.l #1,d1
    6dec:	2b41 0010      	move.l d1,16(a5)
    6df0:	4a80           	tst.l d0
    6df2:	66dc           	bne.s 6dd0 <memset+0xc>
	return dest;
    6df4:	202d 0008      	move.l 8(a5),d0
}
    6df8:	4e5d           	unlk a5
    6dfa:	4e75           	rts

00006dfc <memcpy>:
{
    6dfc:	4e55 fff8      	link.w a5,#-8
    6e00:	2f02           	move.l d2,-(sp)
	char *d = (char *)dest;
    6e02:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = (const char *)src;
    6e08:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
    6e0e:	6020           	bra.s 6e30 <memcpy+0x34>
		*d++ = *s++;
    6e10:	222d fff8      	move.l -8(a5),d1
    6e14:	2001           	move.l d1,d0
    6e16:	5280           	addq.l #1,d0
    6e18:	2b40 fff8      	move.l d0,-8(a5)
    6e1c:	202d fffc      	move.l -4(a5),d0
    6e20:	2400           	move.l d0,d2
    6e22:	5282           	addq.l #1,d2
    6e24:	2b42 fffc      	move.l d2,-4(a5)
    6e28:	2041           	movea.l d1,a0
    6e2a:	1210           	move.b (a0),d1
    6e2c:	2040           	movea.l d0,a0
    6e2e:	1081           	move.b d1,(a0)
	while(len--)
    6e30:	202d 0010      	move.l 16(a5),d0
    6e34:	2200           	move.l d0,d1
    6e36:	5381           	subq.l #1,d1
    6e38:	2b41 0010      	move.l d1,16(a5)
    6e3c:	4a80           	tst.l d0
    6e3e:	66d0           	bne.s 6e10 <memcpy+0x14>
	return dest;
    6e40:	202d 0008      	move.l 8(a5),d0
}
    6e44:	241f           	move.l (sp)+,d2
    6e46:	4e5d           	unlk a5
    6e48:	4e75           	rts

00006e4a <memmove>:
{
    6e4a:	4e55 fff0      	link.w a5,#-16
    6e4e:	2f02           	move.l d2,-(sp)
	char *d = dest;
    6e50:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = src;
    6e56:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
	if (d < s) {
    6e5c:	202d fffc      	move.l -4(a5),d0
    6e60:	b0ad fff8      	cmp.l -8(a5),d0
    6e64:	6522           	bcs.s 6e88 <memmove+0x3e>
    6e66:	6032           	bra.s 6e9a <memmove+0x50>
			*d++ = *s++;
    6e68:	222d fff8      	move.l -8(a5),d1
    6e6c:	2401           	move.l d1,d2
    6e6e:	5282           	addq.l #1,d2
    6e70:	2b42 fff8      	move.l d2,-8(a5)
    6e74:	202d fffc      	move.l -4(a5),d0
    6e78:	2400           	move.l d0,d2
    6e7a:	5282           	addq.l #1,d2
    6e7c:	2b42 fffc      	move.l d2,-4(a5)
    6e80:	2041           	movea.l d1,a0
    6e82:	1210           	move.b (a0),d1
    6e84:	2040           	movea.l d0,a0
    6e86:	1081           	move.b d1,(a0)
		while (len--)
    6e88:	202d 0010      	move.l 16(a5),d0
    6e8c:	2200           	move.l d0,d1
    6e8e:	5381           	subq.l #1,d1
    6e90:	2b41 0010      	move.l d1,16(a5)
    6e94:	4a80           	tst.l d0
    6e96:	66d0           	bne.s 6e68 <memmove+0x1e>
    6e98:	6052           	bra.s 6eec <memmove+0xa2>
		const char *lasts = s + (len - 1);
    6e9a:	202d 0010      	move.l 16(a5),d0
    6e9e:	5380           	subq.l #1,d0
    6ea0:	242d fff8      	move.l -8(a5),d2
    6ea4:	d480           	add.l d0,d2
    6ea6:	2b42 fff4      	move.l d2,-12(a5)
		char *lastd = d + (len - 1);
    6eaa:	202d 0010      	move.l 16(a5),d0
    6eae:	5380           	subq.l #1,d0
    6eb0:	222d fffc      	move.l -4(a5),d1
    6eb4:	d280           	add.l d0,d1
    6eb6:	2b41 fff0      	move.l d1,-16(a5)
    6eba:	6020           	bra.s 6edc <memmove+0x92>
			*lastd-- = *lasts--;
    6ebc:	222d fff4      	move.l -12(a5),d1
    6ec0:	2401           	move.l d1,d2
    6ec2:	5382           	subq.l #1,d2
    6ec4:	2b42 fff4      	move.l d2,-12(a5)
    6ec8:	202d fff0      	move.l -16(a5),d0
    6ecc:	2400           	move.l d0,d2
    6ece:	5382           	subq.l #1,d2
    6ed0:	2b42 fff0      	move.l d2,-16(a5)
    6ed4:	2041           	movea.l d1,a0
    6ed6:	1210           	move.b (a0),d1
    6ed8:	2040           	movea.l d0,a0
    6eda:	1081           	move.b d1,(a0)
		while (len--)
    6edc:	202d 0010      	move.l 16(a5),d0
    6ee0:	2200           	move.l d0,d1
    6ee2:	5381           	subq.l #1,d1
    6ee4:	2b41 0010      	move.l d1,16(a5)
    6ee8:	4a80           	tst.l d0
    6eea:	66d0           	bne.s 6ebc <memmove+0x72>
	return dest;
    6eec:	202d 0008      	move.l 8(a5),d0
}
    6ef0:	241f           	move.l (sp)+,d2
    6ef2:	4e5d           	unlk a5
    6ef4:	4e75           	rts

00006ef6 <KPrintF>:
{
    6ef6:	4fef ff80      	lea -128(sp),sp
    6efa:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    6efe:	3039 00f0 ff60 	move.w f0ff60 <_end+0xa3d298>,d0
    6f04:	0c40 4eb9      	cmpi.w #20153,d0
    6f08:	6722           	beq.s 6f2c <KPrintF+0x36>
    6f0a:	0c40 a00e      	cmpi.w #-24562,d0
    6f0e:	671c           	beq.s 6f2c <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    6f10:	2c79 004d 2c74 	movea.l 4d2c74 <SysBase>,a6
    6f16:	206f 0090      	movea.l 144(sp),a0
    6f1a:	43ef 0094      	lea 148(sp),a1
    6f1e:	45f9 0000 7256 	lea 7256 <KPutCharX>,a2
    6f24:	97cb           	suba.l a3,a3
    6f26:	4eae fdf6      	jsr -522(a6)
    6f2a:	602a           	bra.s 6f56 <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    6f2c:	2c79 004d 2c74 	movea.l 4d2c74 <SysBase>,a6
    6f32:	206f 0090      	movea.l 144(sp),a0
    6f36:	43ef 0094      	lea 148(sp),a1
    6f3a:	45f9 0000 7264 	lea 7264 <PutChar>,a2
    6f40:	47ef 000c      	lea 12(sp),a3
    6f44:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    6f48:	2f0b           	move.l a3,-(sp)
    6f4a:	4878 0056      	pea 56 <_start+0x56>
    6f4e:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xa3d298>
    6f54:	508f           	addq.l #8,sp
}
    6f56:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    6f5a:	4fef 0080      	lea 128(sp),sp
    6f5e:	4e75           	rts

00006f60 <warpmode>:

void warpmode(int on) // bool
{
    6f60:	518f           	subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
    6f62:	2f7c 00f0 ff60 	move.l #15794016,4(sp)
    6f68:	0004 
    if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
    6f6a:	206f 0004      	movea.l 4(sp),a0
    6f6e:	3010           	move.w (a0),d0
    6f70:	0c40 4eb9      	cmpi.w #20153,d0
    6f74:	670c           	beq.s 6f82 <warpmode+0x22>
    6f76:	206f 0004      	movea.l 4(sp),a0
    6f7a:	3010           	move.w (a0),d0
    6f7c:	0c40 a00e      	cmpi.w #-24562,d0
    6f80:	6668           	bne.s 6fea <warpmode+0x8a>
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    6f82:	4aaf 000c      	tst.l 12(sp)
    6f86:	6708           	beq.s 6f90 <warpmode+0x30>
    6f88:	203c 0000 8596 	move.l #34198,d0
    6f8e:	6006           	bra.s 6f96 <warpmode+0x36>
    6f90:	203c 0000 85a0 	move.l #34208,d0
    6f96:	4878 0001      	pea 1 <_start+0x1>
    6f9a:	220f           	move.l sp,d1
    6f9c:	5e81           	addq.l #7,d1
    6f9e:	2f01           	move.l d1,-(sp)
    6fa0:	42a7           	clr.l -(sp)
    6fa2:	2f00           	move.l d0,-(sp)
    6fa4:	4878 ffff      	pea ffffffff <_end+0xffb2d337>
    6fa8:	4878 0052      	pea 52 <_start+0x52>
    6fac:	206f 001c      	movea.l 28(sp),a0
    6fb0:	4e90           	jsr (a0)
    6fb2:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    6fb6:	4aaf 000c      	tst.l 12(sp)
    6fba:	6708           	beq.s 6fc4 <warpmode+0x64>
    6fbc:	203c 0000 85ab 	move.l #34219,d0
    6fc2:	6006           	bra.s 6fca <warpmode+0x6a>
    6fc4:	203c 0000 85c5 	move.l #34245,d0
    6fca:	4878 0001      	pea 1 <_start+0x1>
    6fce:	220f           	move.l sp,d1
    6fd0:	5e81           	addq.l #7,d1
    6fd2:	2f01           	move.l d1,-(sp)
    6fd4:	42a7           	clr.l -(sp)
    6fd6:	2f00           	move.l d0,-(sp)
    6fd8:	4878 ffff      	pea ffffffff <_end+0xffb2d337>
    6fdc:	4878 0052      	pea 52 <_start+0x52>
    6fe0:	206f 001c      	movea.l 28(sp),a0
    6fe4:	4e90           	jsr (a0)
    6fe6:	4fef 0018      	lea 24(sp),sp
	}
}
    6fea:	508f           	addq.l #8,sp
    6fec:	4e75           	rts

00006fee <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4)
{
    6fee:	598f           	subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
    6ff0:	2ebc 00f0 ff60 	move.l #15794016,(sp)
    if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    6ff6:	2057           	movea.l (sp),a0
    6ff8:	3010           	move.w (a0),d0
    6ffa:	0c40 4eb9      	cmpi.w #20153,d0
    6ffe:	670a           	beq.s 700a <debug_cmd+0x1c>
    7000:	2057           	movea.l (sp),a0
    7002:	3010           	move.w (a0),d0
    7004:	0c40 a00e      	cmpi.w #-24562,d0
    7008:	661e           	bne.s 7028 <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
    700a:	2f2f 0014      	move.l 20(sp),-(sp)
    700e:	2f2f 0014      	move.l 20(sp),-(sp)
    7012:	2f2f 0014      	move.l 20(sp),-(sp)
    7016:	2f2f 0014      	move.l 20(sp),-(sp)
    701a:	4878 0058      	pea 58 <_start+0x58>
    701e:	206f 0014      	movea.l 20(sp),a0
    7022:	4e90           	jsr (a0)
    7024:	4fef 0014      	lea 20(sp),sp
	}
}
    7028:	588f           	addq.l #4,sp
    702a:	4e75           	rts

0000702c <debug_clear>:
	barto_cmd_text,
};

void debug_clear()
{
	debug_cmd(barto_cmd_clear, 0, 0, 0);
    702c:	42a7           	clr.l -(sp)
    702e:	42a7           	clr.l -(sp)
    7030:	42a7           	clr.l -(sp)
    7032:	42a7           	clr.l -(sp)
    7034:	4eba ffb8      	jsr 6fee <debug_cmd>(pc)
    7038:	4fef 0010      	lea 16(sp),sp
}
    703c:	4e75           	rts

0000703e <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color)
{
    703e:	518f           	subq.l #8,sp
    7040:	2f02           	move.l d2,-(sp)
    7042:	226f 0010      	movea.l 16(sp),a1
    7046:	206f 0014      	movea.l 20(sp),a0
    704a:	222f 0018      	move.l 24(sp),d1
    704e:	202f 001c      	move.l 28(sp),d0
    7052:	3249           	movea.w a1,a1
    7054:	3f49 000a      	move.w a1,10(sp)
    7058:	3048           	movea.w a0,a0
    705a:	3f48 0008      	move.w a0,8(sp)
    705e:	3201           	move.w d1,d1
    7060:	3f41 0006      	move.w d1,6(sp)
    7064:	3000           	move.w d0,d0
    7066:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    706a:	302f 0006      	move.w 6(sp),d0
    706e:	48c0           	ext.l d0
    7070:	4840           	swap d0
    7072:	4240           	clr.w d0
    7074:	322f 0004      	move.w 4(sp),d1
    7078:	48c1           	ext.l d1
    707a:	8280           	or.l d0,d1
    707c:	302f 000a      	move.w 10(sp),d0
    7080:	48c0           	ext.l d0
    7082:	4840           	swap d0
    7084:	4240           	clr.w d0
    7086:	306f 0008      	movea.w 8(sp),a0
    708a:	2408           	move.l a0,d2
    708c:	8082           	or.l d2,d0
    708e:	2f2f 0020      	move.l 32(sp),-(sp)
    7092:	2f01           	move.l d1,-(sp)
    7094:	2f00           	move.l d0,-(sp)
    7096:	4878 0001      	pea 1 <_start+0x1>
    709a:	4eba ff52      	jsr 6fee <debug_cmd>(pc)
    709e:	4fef 0010      	lea 16(sp),sp
}
    70a2:	241f           	move.l (sp)+,d2
    70a4:	508f           	addq.l #8,sp
    70a6:	4e75           	rts

000070a8 <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color)
{
    70a8:	518f           	subq.l #8,sp
    70aa:	2f02           	move.l d2,-(sp)
    70ac:	226f 0010      	movea.l 16(sp),a1
    70b0:	206f 0014      	movea.l 20(sp),a0
    70b4:	222f 0018      	move.l 24(sp),d1
    70b8:	202f 001c      	move.l 28(sp),d0
    70bc:	3249           	movea.w a1,a1
    70be:	3f49 000a      	move.w a1,10(sp)
    70c2:	3048           	movea.w a0,a0
    70c4:	3f48 0008      	move.w a0,8(sp)
    70c8:	3201           	move.w d1,d1
    70ca:	3f41 0006      	move.w d1,6(sp)
    70ce:	3000           	move.w d0,d0
    70d0:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    70d4:	302f 0006      	move.w 6(sp),d0
    70d8:	48c0           	ext.l d0
    70da:	4840           	swap d0
    70dc:	4240           	clr.w d0
    70de:	322f 0004      	move.w 4(sp),d1
    70e2:	48c1           	ext.l d1
    70e4:	8280           	or.l d0,d1
    70e6:	302f 000a      	move.w 10(sp),d0
    70ea:	48c0           	ext.l d0
    70ec:	4840           	swap d0
    70ee:	4240           	clr.w d0
    70f0:	306f 0008      	movea.w 8(sp),a0
    70f4:	2408           	move.l a0,d2
    70f6:	8082           	or.l d2,d0
    70f8:	2f2f 0020      	move.l 32(sp),-(sp)
    70fc:	2f01           	move.l d1,-(sp)
    70fe:	2f00           	move.l d0,-(sp)
    7100:	4878 0002      	pea 2 <_start+0x2>
    7104:	4eba fee8      	jsr 6fee <debug_cmd>(pc)
    7108:	4fef 0010      	lea 16(sp),sp
}
    710c:	241f           	move.l (sp)+,d2
    710e:	508f           	addq.l #8,sp
    7110:	4e75           	rts

00007112 <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color)
{
    7112:	598f           	subq.l #4,sp
    7114:	2f02           	move.l d2,-(sp)
    7116:	222f 000c      	move.l 12(sp),d1
    711a:	202f 0010      	move.l 16(sp),d0
    711e:	3201           	move.w d1,d1
    7120:	3f41 0006      	move.w d1,6(sp)
    7124:	3000           	move.w d0,d0
    7126:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
    712a:	202f 0014      	move.l 20(sp),d0
    712e:	322f 0006      	move.w 6(sp),d1
    7132:	48c1           	ext.l d1
    7134:	4841           	swap d1
    7136:	4241           	clr.w d1
    7138:	306f 0004      	movea.w 4(sp),a0
    713c:	2408           	move.l a0,d2
    713e:	8282           	or.l d2,d1
    7140:	2f2f 0018      	move.l 24(sp),-(sp)
    7144:	2f00           	move.l d0,-(sp)
    7146:	2f01           	move.l d1,-(sp)
    7148:	4878 0003      	pea 3 <_start+0x3>
    714c:	4eba fea0      	jsr 6fee <debug_cmd>(pc)
    7150:	4fef 0010      	lea 16(sp),sp
}
    7154:	241f           	move.l (sp)+,d2
    7156:	588f           	addq.l #4,sp
    7158:	4e75           	rts
    715a:	4e71           	nop

0000715c <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    715c:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    7160:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    7164:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    7168:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    716c:	d041           	add.w d1,d0
	swap	d0
    716e:	4840           	swap d0
	clrw	d0
    7170:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    7172:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    7176:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    717a:	d081           	add.l d1,d0
	rts
    717c:	4e75           	rts

0000717e <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    717e:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    7180:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    7184:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    7188:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    718e:	6416           	bcc.s 71a6 <__udivsi3+0x28>
	movel	d0, d2
    7190:	2400           	move.l d0,d2
	clrw	d2
    7192:	4242           	clr.w d2
	swap	d2
    7194:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    7196:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    7198:	3002           	move.w d2,d0
	swap	d0
    719a:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    719c:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    71a0:	84c1           	divu.w d1,d2
	movew	d2, d0
    71a2:	3002           	move.w d2,d0
	jra	6f
    71a4:	6030           	bra.s 71d6 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    71a6:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    71a8:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    71aa:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    71ac:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    71b2:	64f4           	bcc.s 71a8 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    71b4:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    71b6:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    71bc:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    71be:	c2c0           	mulu.w d0,d1
	swap	d2
    71c0:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    71c2:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    71c4:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    71c6:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    71c8:	660a           	bne.s 71d4 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    71ca:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    71cc:	6506           	bcs.s 71d4 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    71ce:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    71d2:	6302           	bls.s 71d6 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    71d4:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    71d6:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    71d8:	4e75           	rts

000071da <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    71da:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    71dc:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    71de:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    71e2:	6a04           	bpl.s 71e8 <__divsi3+0xe>
	negl	d1
    71e4:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    71e6:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    71e8:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    71ec:	6a04           	bpl.s 71f2 <__divsi3+0x18>
	negl	d0
    71ee:	4480           	neg.l d0
	negb	d2
    71f0:	4402           	neg.b d2

2:	movel	d1, sp@-
    71f2:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    71f4:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    71f6:	6186           	bsr.s 717e <__udivsi3>
	addql	IMM (8), sp
    71f8:	508f           	addq.l #8,sp

	tstb	d2
    71fa:	4a02           	tst.b d2
	jpl	3f
    71fc:	6a02           	bpl.s 7200 <__divsi3+0x26>
	negl	d0
    71fe:	4480           	neg.l d0

3:	movel	sp@+, d2
    7200:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    7202:	4e75           	rts

00007204 <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    7204:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7208:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    720c:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    720e:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    7210:	61c8           	bsr.s 71da <__divsi3>
	addql	IMM (8), sp
    7212:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    7214:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    7218:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    721a:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    721c:	6100 ff3e      	bsr.w 715c <__mulsi3>
	addql	IMM (8), sp
    7220:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    7222:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    7226:	9280           	sub.l d0,d1
	movel	d1, d0
    7228:	2001           	move.l d1,d0
	rts
    722a:	4e75           	rts

0000722c <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    722c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7230:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    7234:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7236:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    7238:	6100 ff44      	bsr.w 717e <__udivsi3>
	addql	IMM (8), sp
    723c:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    723e:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    7242:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7244:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    7246:	6100 ff14      	bsr.w 715c <__mulsi3>
	addql	IMM (8), sp
    724a:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    724c:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    7250:	9280           	sub.l d0,d1
	movel	d1, d0
    7252:	2001           	move.l d1,d0
	rts
    7254:	4e75           	rts

00007256 <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    7256:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    7258:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    725c:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    7260:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    7262:	4e75           	rts

00007264 <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    7264:	16c0           	move.b d0,(a3)+
	rts
    7266:	4e75           	rts

00007268 <c2p1x1_8_c5_gen_init>:
	.text
	FUNC(c2p1x1_8_c5_gen_init)
	.globl	SYM (c2p1x1_8_c5_gen_init)

SYM(c2p1x1_8_c5_gen_init):
	movem.l d0-d7/a0-a6, .gi_saveregs	
    7268:	48f9 7fff 0000 	movem.l d0-a6,72a8 <.gi_saveregs>
    726e:	72a8 
	move.l  4(sp),d0
    7270:	202f 0004      	move.l 4(sp),d0
	move.l	8(sp),d1
    7274:	222f 0008      	move.l 8(sp),d1
	move.l	12(sp),d2
    7278:	242f 000c      	move.l 12(sp),d2
	move.l	16(sp),d3
    727c:	262f 0010      	move.l 16(sp),d3
	move.l  20(sp),d4
    7280:	282f 0014      	move.l 20(sp),d4
	move.l	24(sp),d5
    7284:	2a2f 0018      	move.l 24(sp),d5
	andi.l	IMM (0xffff),d0
    7288:	0280 0000 ffff 	andi.l #65535,d0
	mulu.w	d0,d3
    728e:	c6c0           	mulu.w d0,d3
	lsr.l	#3,d3
    7290:	e68b           	lsr.l #3,d3
	move.l	d3,c2p1x1_8_c5_gen_scroffs
    7292:	23c3 0000 75fe 	move.l d3,75fe <c2p1x1_8_c5_gen_scroffs>
	mulu.w	d0,d1
    7298:	c2c0           	mulu.w d0,d1
	move.l	d1,c2p1x1_8_c5_gen_pixels
    729a:	23c1 0000 7602 	move.l d1,7602 <c2p1x1_8_c5_gen_pixels>
	movem.l	.gi_saveregs,d0-d7/a0-a6
    72a0:	4cfa 7fff 0004 	movem.l 72a8 <.gi_saveregs>(pc),d0-a6
	rts
    72a6:	4e75           	rts

000072a8 <.gi_saveregs>:
	...

000072e4 <c2p1x1_8_c5_gen>:
	.text
	FUNC(c2p1x1_8_c5_gen)
	.globl	SYM (c2p1x1_8_c5_gen)

SYM(c2p1x1_8_c5_gen):
	movem.l d0-d7/a0-a6,.c2p_saveregs	
    72e4:	48f9 7fff 0000 	movem.l d0-a6,75c2 <.c2p_saveregs>
    72ea:	75c2 
	movem.l 4(sp),a0
    72ec:	4cef 0100 0004 	movem.l 4(sp),a0
	movem.l 8(sp),a1
    72f2:	4cef 0200 0008 	movem.l 8(sp),a1
    move.l	IMM (0x33333333),d5
    72f8:	2a3c 3333 3333 	move.l #858993459,d5
	move.l	IMM (0x55555555),a6
    72fe:	2c7c 5555 5555 	movea.l #1431655765,a6

	add.w	#BPLSIZE,a1
    7304:	d2fc 2bf8      	adda.w #11256,a1
	add.l	c2p1x1_8_c5_gen_scroffs,a1
    7308:	d3fa 02f4      	adda.l 75fe <c2p1x1_8_c5_gen_scroffs>(pc),a1

	move.l	c2p1x1_8_c5_gen_pixels,a2
    730c:	247a 02f4      	movea.l 7602 <c2p1x1_8_c5_gen_pixels>(pc),a2
	add.l	a0,a2
    7310:	d5c8           	adda.l a0,a2
	cmp.l	a0,a2
    7312:	b5c8           	cmpa.l a0,a2
	beq	.none
    7314:	6700 02a4      	beq.w 75ba <.none>

	movem.l	a0-a1,-(sp)
    7318:	48e7 00c0      	movem.l a0-a1,-(sp)

	move.l	(a0)+,d0
    731c:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    731e:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7320:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    7322:	2618           	move.l (a0)+,d3

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    7324:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    732a:	c084           	and.l d4,d0
	and.l	d4,d1
    732c:	c284           	and.l d4,d1
	and.l	d4,d2
    732e:	c484           	and.l d4,d2
	and.l	d4,d3
    7330:	c684           	and.l d4,d3
	lsl.l	#4,d0
    7332:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    7334:	e989           	lsl.l #4,d1
	or.l	d2,d0
    7336:	8082           	or.l d2,d0
	or.l	d3,d1
    7338:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    733a:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    733c:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    733e:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7340:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    7342:	c484           	and.l d4,d2
	and.l	d4,d6
    7344:	cc84           	and.l d4,d6
	and.l	d4,d3
    7346:	c684           	and.l d4,d3
	and.l	d4,d7
    7348:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    734a:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    734c:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    734e:	8486           	or.l d6,d2
	or.l	d7,d3
    7350:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    7352:	3c02           	move.w d2,d6
	move.w	d3,d7
    7354:	3e03           	move.w d3,d7
	move.w	d0,d2
    7356:	3400           	move.w d0,d2
	move.w	d1,d3
    7358:	3601           	move.w d1,d3
	swap	d2
    735a:	4842           	swap d2
	swap	d3
    735c:	4843           	swap d3
	move.w	d2,d0
    735e:	3002           	move.w d2,d0
	move.w	d3,d1
    7360:	3203           	move.w d3,d1
	move.w	d6,d2
    7362:	3406           	move.w d6,d2
	move.w	d7,d3
    7364:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    7366:	2c02           	move.l d2,d6
	move.l	d3,d7
    7368:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    736a:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    736c:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    736e:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7370:	b387           	eor.l d1,d7
	and.l	d5,d6
    7372:	cc85           	and.l d5,d6
	and.l	d5,d7
    7374:	ce85           	and.l d5,d7
	eor.l	d6,d0
    7376:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7378:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    737a:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    737c:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    737e:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7380:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    7382:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7388:	2c01           	move.l d1,d6
	move.l	d3,d7
    738a:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    738c:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    738e:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7390:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7392:	b587           	eor.l d2,d7
	bra	.start1
    7394:	6000 0088      	bra.w 741e <.start1>

00007398 <.x1>:
.x1:
	move.l	(a0)+,d0
    7398:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    739a:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    739c:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    739e:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    73a0:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    73a4:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    73aa:	c084           	and.l d4,d0
	and.l	d4,d1
    73ac:	c284           	and.l d4,d1
	and.l	d4,d2
    73ae:	c484           	and.l d4,d2
	and.l	d4,d3
    73b0:	c684           	and.l d4,d3
	lsl.l	#4,d0
    73b2:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    73b4:	e989           	lsl.l #4,d1
	or.l	d2,d0
    73b6:	8082           	or.l d2,d0
	or.l	d3,d1
    73b8:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    73ba:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    73bc:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    73be:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    73c0:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    73c2:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    73c6:	c484           	and.l d4,d2
	and.l	d4,d6
    73c8:	cc84           	and.l d4,d6
	and.l	d4,d3
    73ca:	c684           	and.l d4,d3
	and.l	d4,d7
    73cc:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    73ce:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    73d0:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    73d2:	8486           	or.l d6,d2
	or.l	d7,d3
    73d4:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    73d6:	3c02           	move.w d2,d6
	move.w	d3,d7
    73d8:	3e03           	move.w d3,d7
	move.w	d0,d2
    73da:	3400           	move.w d0,d2
	move.w	d1,d3
    73dc:	3601           	move.w d1,d3
	swap	d2
    73de:	4842           	swap d2
	swap	d3
    73e0:	4843           	swap d3
	move.w	d2,d0
    73e2:	3002           	move.w d2,d0
	move.w	d3,d1
    73e4:	3203           	move.w d3,d1
	move.w	d6,d2
    73e6:	3406           	move.w d6,d2
	move.w	d7,d3
    73e8:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    73ea:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    73ee:	2c02           	move.l d2,d6
	move.l	d3,d7
    73f0:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    73f2:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    73f4:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    73f6:	b186           	eor.l d0,d6
	eor.l	d1,d7
    73f8:	b387           	eor.l d1,d7
	and.l	d5,d6
    73fa:	cc85           	and.l d5,d6
	and.l	d5,d7
    73fc:	ce85           	and.l d5,d7
	eor.l	d6,d0
    73fe:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7400:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    7402:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7404:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    7406:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7408:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    740a:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7410:	2c01           	move.l d1,d6
	move.l	d3,d7
    7412:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7414:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    7416:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7418:	b186           	eor.l d0,d6
	eor.l	d2,d7
    741a:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    741c:	22cd           	move.l a5,(a1)+

0000741e <.start1>:
.start1:
	and.l	d4,d6
    741e:	cc84           	and.l d4,d6
	and.l	d4,d7
    7420:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7422:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7424:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    7426:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    7428:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    742a:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    742c:	bf83           	eor.l d7,d3

	move.l	a6,d4
    742e:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    7430:	2c01           	move.l d1,d6
	move.l	d3,d7
    7432:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    7434:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    7436:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    7438:	b186           	eor.l d0,d6
	eor.l	d2,d7
    743a:	b587           	eor.l d2,d7
	and.l	d4,d6
    743c:	cc84           	and.l d4,d6
	and.l	d4,d7
    743e:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7440:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7442:	bf82           	eor.l d7,d2
	add.l	d6,d6
    7444:	dc86           	add.l d6,d6
	add.l	d7,d7
    7446:	de87           	add.l d7,d7
	eor.l	d1,d6
    7448:	b386           	eor.l d1,d6
	eor.l	d3,d7
    744a:	b787           	eor.l d3,d7

	move.l	d0,a4
    744c:	2840           	movea.l d0,a4
	move.l	d2,a5
    744e:	2a42           	movea.l d2,a5
	move.l	d6,a3
    7450:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    7452:	b5c8           	cmpa.l a0,a2
	bne	.x1
    7454:	6600 ff42      	bne.w 7398 <.x1>
	move.l	d7,-BPLSIZE(a1)
    7458:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    745c:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    7460:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    7464:	22cd           	move.l a5,(a1)+

	movem.l	(sp)+,a0-a1
    7466:	4cdf 0300      	movem.l (sp)+,a0-a1
	add.l	#BPLSIZE*4,a1
    746a:	d3fc 0000 afe0 	adda.l #45024,a1

	move.l	(a0)+,d0
    7470:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    7472:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7474:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    7476:	2618           	move.l (a0)+,d3

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    7478:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    747e:	c084           	and.l d4,d0
	and.l	d4,d1
    7480:	c284           	and.l d4,d1
	and.l	d4,d2
    7482:	c484           	and.l d4,d2
	and.l	d4,d3
    7484:	c684           	and.l d4,d3
	lsr.l	#4,d2
    7486:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    7488:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    748a:	8082           	or.l d2,d0
	or.l	d3,d1
    748c:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    748e:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7490:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    7492:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7494:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    7496:	c484           	and.l d4,d2
	and.l	d4,d6
    7498:	cc84           	and.l d4,d6
	and.l	d4,d3
    749a:	c684           	and.l d4,d3
	and.l	d4,d7
    749c:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    749e:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    74a0:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    74a2:	8486           	or.l d6,d2
	or.l	d7,d3
    74a4:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    74a6:	3c02           	move.w d2,d6
	move.w	d3,d7
    74a8:	3e03           	move.w d3,d7
	move.w	d0,d2
    74aa:	3400           	move.w d0,d2
	move.w	d1,d3
    74ac:	3601           	move.w d1,d3
	swap	d2
    74ae:	4842           	swap d2
	swap	d3
    74b0:	4843           	swap d3
	move.w	d2,d0
    74b2:	3002           	move.w d2,d0
	move.w	d3,d1
    74b4:	3203           	move.w d3,d1
	move.w	d6,d2
    74b6:	3406           	move.w d6,d2
	move.w	d7,d3
    74b8:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    74ba:	2c02           	move.l d2,d6
	move.l	d3,d7
    74bc:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    74be:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    74c0:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    74c2:	b186           	eor.l d0,d6
	eor.l	d1,d7
    74c4:	b387           	eor.l d1,d7
	and.l	d5,d6
    74c6:	cc85           	and.l d5,d6
	and.l	d5,d7
    74c8:	ce85           	and.l d5,d7
	eor.l	d6,d0
    74ca:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    74cc:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    74ce:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    74d0:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    74d2:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    74d4:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    74d6:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    74dc:	2c01           	move.l d1,d6
	move.l	d3,d7
    74de:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    74e0:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    74e2:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    74e4:	b186           	eor.l d0,d6
	eor.l	d2,d7
    74e6:	b587           	eor.l d2,d7
	bra	.start2
    74e8:	6000 0088      	bra.w 7572 <.start2>

000074ec <.x2>:
.x2:
	move.l	(a0)+,d0
    74ec:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    74ee:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    74f0:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    74f2:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    74f4:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    74f8:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    74fe:	c084           	and.l d4,d0
	and.l	d4,d1
    7500:	c284           	and.l d4,d1
	and.l	d4,d2
    7502:	c484           	and.l d4,d2
	and.l	d4,d3
    7504:	c684           	and.l d4,d3
	lsr.l	#4,d2
    7506:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    7508:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    750a:	8082           	or.l d2,d0
	or.l	d3,d1
    750c:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    750e:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7510:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    7512:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7514:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    7516:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    751a:	c484           	and.l d4,d2
	and.l	d4,d6
    751c:	cc84           	and.l d4,d6
	and.l	d4,d3
    751e:	c684           	and.l d4,d3
	and.l	d4,d7
    7520:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    7522:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    7524:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    7526:	8486           	or.l d6,d2
	or.l	d7,d3
    7528:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    752a:	3c02           	move.w d2,d6
	move.w	d3,d7
    752c:	3e03           	move.w d3,d7
	move.w	d0,d2
    752e:	3400           	move.w d0,d2
	move.w	d1,d3
    7530:	3601           	move.w d1,d3
	swap	d2
    7532:	4842           	swap d2
	swap	d3
    7534:	4843           	swap d3
	move.w	d2,d0
    7536:	3002           	move.w d2,d0
	move.w	d3,d1
    7538:	3203           	move.w d3,d1
	move.w	d6,d2
    753a:	3406           	move.w d6,d2
	move.w	d7,d3
    753c:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    753e:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    7542:	2c02           	move.l d2,d6
	move.l	d3,d7
    7544:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    7546:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7548:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    754a:	b186           	eor.l d0,d6
	eor.l	d1,d7
    754c:	b387           	eor.l d1,d7
	and.l	d5,d6
    754e:	cc85           	and.l d5,d6
	and.l	d5,d7
    7550:	ce85           	and.l d5,d7
	eor.l	d6,d0
    7552:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7554:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    7556:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7558:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    755a:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    755c:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    755e:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7564:	2c01           	move.l d1,d6
	move.l	d3,d7
    7566:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7568:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    756a:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    756c:	b186           	eor.l d0,d6
	eor.l	d2,d7
    756e:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    7570:	22cd           	move.l a5,(a1)+

00007572 <.start2>:
.start2:
	and.l	d4,d6
    7572:	cc84           	and.l d4,d6
	and.l	d4,d7
    7574:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7576:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7578:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    757a:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    757c:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    757e:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    7580:	bf83           	eor.l d7,d3

	move.l	a6,d4
    7582:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    7584:	2c01           	move.l d1,d6
	move.l	d3,d7
    7586:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    7588:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    758a:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    758c:	b186           	eor.l d0,d6
	eor.l	d2,d7
    758e:	b587           	eor.l d2,d7
	and.l	d4,d6
    7590:	cc84           	and.l d4,d6
	and.l	d4,d7
    7592:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7594:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7596:	bf82           	eor.l d7,d2
	add.l	d6,d6
    7598:	dc86           	add.l d6,d6
	add.l	d7,d7
    759a:	de87           	add.l d7,d7
	eor.l	d1,d6
    759c:	b386           	eor.l d1,d6
	eor.l	d3,d7
    759e:	b787           	eor.l d3,d7

	move.l	d0,a4
    75a0:	2840           	movea.l d0,a4
	move.l	d2,a5
    75a2:	2a42           	movea.l d2,a5
	move.l	d6,a3
    75a4:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    75a6:	b5c8           	cmpa.l a0,a2
	bne	.x2
    75a8:	6600 ff42      	bne.w 74ec <.x2>
	move.l	d7,-BPLSIZE(a1)
    75ac:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    75b0:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    75b4:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    75b8:	22cd           	move.l a5,(a1)+

000075ba <.none>:
.none:
	movem.l .c2p_saveregs,d0-d7/a0-a6
    75ba:	4cfa 7fff 0004 	movem.l 75c2 <.c2p_saveregs>(pc),d0-a6
	rts
    75c0:	4e75           	rts

000075c2 <.c2p_saveregs>:
	...

000075fe <c2p1x1_8_c5_gen_scroffs>:
    75fe:	0000 0001      	ori.b #1,d0

00007602 <c2p1x1_8_c5_gen_pixels>:

.c2p_saveregs: .dcb.b 60


c2p1x1_8_c5_gen_scroffs: dc.l	1
    7602:	0000 0001      	ori.b #1,d0
