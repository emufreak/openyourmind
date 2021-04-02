
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
       2:	203c 0000 a6a2 	move.l #42658,d0
       8:	0480 0000 a6a2 	subi.l #42658,d0
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
      22:	41f9 0000 a6a2 	lea a6a2 <__fini_array_end>,a0
      28:	2071 8800      	movea.l (0,a1,a0.l),a0
      2c:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      2e:	52af 0004      	addq.l #1,4(sp)
      32:	202f 0004      	move.l 4(sp),d0
      36:	b097           	cmp.l (sp),d0
      38:	65de           	bcs.s 18 <_start+0x18>

	count = __init_array_end - __init_array_start;
      3a:	203c 0000 a6a2 	move.l #42658,d0
      40:	0480 0000 a6a2 	subi.l #42658,d0
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
      5a:	41f9 0000 a6a2 	lea a6a2 <__fini_array_end>,a0
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
      78:	203c 0000 a6a2 	move.l #42658,d0
      7e:	0480 0000 a6a2 	subi.l #42658,d0
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
      9a:	41f9 0000 a6a2 	lea a6a2 <__fini_array_end>,a0
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
      b6:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
      bc:	3f68 0002 0002 	move.w 2(a0),2(sp)
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
      c2:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
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
      e6:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
      ec:	6722           	beq.s 110 <FreeDisplay+0x30>
      ee:	2f79 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,16(sp)
      f4:	0010 
      f6:	2f6f 0018 000c 	move.l 24(sp),12(sp)
      fc:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
     102:	2c40           	movea.l d0,a6
     104:	226f 0010      	movea.l 16(sp),a1
     108:	202f 000c      	move.l 12(sp),d0
     10c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     110:	2039 004d 2ca8 	move.l 4d2ca8 <Copperlist2>,d0
     116:	6722           	beq.s 13a <FreeDisplay+0x5a>
     118:	2f79 004d 2ca8 	move.l 4d2ca8 <Copperlist2>,8(sp)
     11e:	0008 
     120:	2f6f 0018 0004 	move.l 24(sp),4(sp)
     126:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
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
     146:	2039 004d 2cac 	move.l 4d2cac <DrawBuffer>,d0
     14c:	4240           	clr.w d0
     14e:	4840           	swap d0
     150:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     154:	2039 004d 2cac 	move.l 4d2cac <DrawBuffer>,d0
     15a:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     15e:	2f79 004d 2cb4 	move.l 4d2cb4 <DrawCopper>,4(sp)
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
     17e:	2039 004d 2cac 	move.l 4d2cac <DrawBuffer>,d0
     184:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     186:	2039 004d 2cb0 	move.l 4d2cb0 <ViewBuffer>,d0
     18c:	23c0 004d 2cac 	move.l d0,4d2cac <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     192:	2017           	move.l (sp),d0
     194:	23c0 004d 2cb0 	move.l d0,4d2cb0 <ViewBuffer>
}
     19a:	4fef 000c      	lea 12(sp),sp
     19e:	4e75           	rts

000001a0 <SwapCl>:

void SwapCl() {
     1a0:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     1a2:	2039 004d 2cb4 	move.l 4d2cb4 <DrawCopper>,d0
     1a8:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     1aa:	2039 004d 2cb8 	move.l 4d2cb8 <ViewCopper>,d0
     1b0:	23c0 004d 2cb4 	move.l d0,4d2cb4 <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     1b6:	2017           	move.l (sp),d0
     1b8:	23c0 004d 2cb8 	move.l d0,4d2cb8 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     1be:	2039 004d 2cb8 	move.l 4d2cb8 <ViewCopper>,d0
     1c4:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
     1ca:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     1ce:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
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
     2a6:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
     2ac:	317c 0020 009c 	move.w #32,156(a0)
     2b2:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
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
     2c2:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
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
     2e2:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
     2e8:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     2ee:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
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
     42e:	0681 0000 a9bc 	addi.l #43452,d1
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
     4c2:	2079 004d 2cc0 	movea.l 4d2cc0 <SysBase>,a0
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
     4e6:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
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
     514:	2079 004d 2cd8 	movea.l 4d2cd8 <VBR>,a0
     51a:	41e8 006c      	lea 108(a0),a0
     51e:	20af 0004      	move.l 4(sp),(a0)
}
     522:	4e75           	rts

00000524 <GetInterruptHandler>:

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     524:	2079 004d 2cd8 	movea.l 4d2cd8 <VBR>,a0
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
     57e:	23c0 004d 2cd8 	move.l d0,4d2cd8 <VBR>
	SystemIrq=GetInterruptHandler(); //store interrupt register
     584:	4eba ff9e      	jsr 524 <GetInterruptHandler>(pc)
     588:	23c0 004d 2cdc 	move.l d0,4d2cdc <SystemIrq>
}
     58e:	4e75           	rts

00000590 <FreeSystem>:

	//restore interrupts
	//SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
     590:	2079 004d 2ccc 	movea.l 4d2ccc <GfxBase>,a0
     596:	2028 0026      	move.l 38(a0),d0
     59a:	2079 004d 2cc4 	movea.l 4d2cc4 <custom>,a0
     5a0:	2140 0080      	move.l d0,128(a0)
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
     5a4:	2079 004d 2ccc 	movea.l 4d2ccc <GfxBase>,a0
     5aa:	2028 0032      	move.l 50(a0),d0
     5ae:	2079 004d 2cc4 	movea.l 4d2cc4 <custom>,a0
     5b4:	2140 0084      	move.l d0,132(a0)
	custom->copjmp1=0x7fff; //start coppper
     5b8:	2079 004d 2cc4 	movea.l 4d2cc4 <custom>,a0
     5be:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
     5c4:	3039 004d 2cd2 	move.w 4d2cd2 <SystemInts>,d0
     5ca:	2079 004d 2cc4 	movea.l 4d2cc4 <custom>,a0
     5d0:	0040 8000      	ori.w #-32768,d0
     5d4:	3140 009a      	move.w d0,154(a0)
	custom->dmacon=SystemDMA|0x8000;
     5d8:	3039 004d 2cd4 	move.w 4d2cd4 <SystemDMA>,d0
     5de:	2079 004d 2cc4 	movea.l 4d2cc4 <custom>,a0
     5e4:	0040 8000      	ori.w #-32768,d0
     5e8:	3140 0096      	move.w d0,150(a0)
	custom->adkcon=SystemADKCON|0x8000;
     5ec:	3039 004d 2cd6 	move.w 4d2cd6 <SystemADKCON>,d0
     5f2:	2079 004d 2cc4 	movea.l 4d2cc4 <custom>,a0
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
     606:	2079 004d 2cc4 	movea.l 4d2cc4 <custom>,a0
     60c:	317c 0020 009c 	move.w #32,156(a0)
     612:	2079 004d 2cc4 	movea.l 4d2cc4 <custom>,a0
     618:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	frameCounter++;
     61e:	3039 004d 2ce4 	move.w 4d2ce4 <frameCounter>,d0
     624:	5240           	addq.w #1,d0
     626:	33c0 004d 2ce4 	move.w d0,4d2ce4 <frameCounter>
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
     646:	23c0 004d 2cc0 	move.l d0,4d2cc0 <SysBase>
	hw = (struct Custom*)0xdff000;
     64c:	23fc 00df f000 	move.l #14675968,4d2cbc <hw>
     652:	004d 2cbc 

	SysBase = *((struct ExecBase**)4UL);
     656:	307c 0004      	movea.w #4,a0
     65a:	2010           	move.l (a0),d0
     65c:	23c0 004d 2cc0 	move.l d0,4d2cc0 <SysBase>
	custom = (struct Custom*)0xdff000;
     662:	23fc 00df f000 	move.l #14675968,4d2cc4 <custom>
     668:	004d 2cc4 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
     66c:	2f7c 0000 764e 	move.l #30286,68(sp)
     672:	0044 
     674:	42af 0040      	clr.l 64(sp)
     678:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
     67e:	2c40           	movea.l d0,a6
     680:	226f 0044      	movea.l 68(sp),a1
     684:	202f 0040      	move.l 64(sp),d0
     688:	4eae fdd8      	jsr -552(a6)
     68c:	2f40 003c      	move.l d0,60(sp)
     690:	202f 003c      	move.l 60(sp),d0
     694:	23c0 004d 2ccc 	move.l d0,4d2ccc <GfxBase>
	if (!GfxBase)
     69a:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
     6a0:	6614           	bne.s 6b6 <main+0x84>
		Exit(0);
     6a2:	42af 0038      	clr.l 56(sp)
     6a6:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     6ac:	2c40           	movea.l d0,a6
     6ae:	222f 0038      	move.l 56(sp),d1
     6b2:	4eae ff70      	jsr -144(a6)

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     6b6:	2f7c 0000 765f 	move.l #30303,52(sp)
     6bc:	0034 
     6be:	42af 0030      	clr.l 48(sp)
     6c2:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
     6c8:	2c40           	movea.l d0,a6
     6ca:	226f 0034      	movea.l 52(sp),a1
     6ce:	202f 0030      	move.l 48(sp),d0
     6d2:	4eae fdd8      	jsr -552(a6)
     6d6:	2f40 002c      	move.l d0,44(sp)
     6da:	202f 002c      	move.l 44(sp),d0
     6de:	23c0 004d 2cc8 	move.l d0,4d2cc8 <DOSBase>
	if (!DOSBase)
     6e4:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     6ea:	6614           	bne.s 700 <main+0xce>
		Exit(0);
     6ec:	42af 0028      	clr.l 40(sp)
     6f0:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     6f6:	2c40           	movea.l d0,a6
     6f8:	222f 0028      	move.l 40(sp),d1
     6fc:	4eae ff70      	jsr -144(a6)

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
     700:	4879 0000 766b 	pea 766b <c2p1x1_8_c5_gen_pixels+0x21>
     706:	4eba 6838      	jsr 6f40 <KPrintF>(pc)
     70a:	588f           	addq.l #4,sp
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
     70c:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     712:	2c40           	movea.l d0,a6
     714:	4eae ffc4      	jsr -60(a6)
     718:	2f40 0024      	move.l d0,36(sp)
     71c:	202f 0024      	move.l 36(sp),d0
     720:	2f40 0020      	move.l d0,32(sp)
     724:	2f7c 0000 7687 	move.l #30343,28(sp)
     72a:	001c 
     72c:	700f           	moveq #15,d0
     72e:	2f40 0018      	move.l d0,24(sp)
     732:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     738:	2c40           	movea.l d0,a6
     73a:	222f 0020      	move.l 32(sp),d1
     73e:	242f 001c      	move.l 28(sp),d2
     742:	262f 0018      	move.l 24(sp),d3
     746:	4eae ffd0      	jsr -48(a6)
     74a:	2f40 0014      	move.l d0,20(sp)
	Delay(50);
     74e:	7032           	moveq #50,d0
     750:	2f40 0010      	move.l d0,16(sp)
     754:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
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
     76c:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
     772:	317c 87ff 0096 	move.w #-30721,150(a0)
	//c2p();
  	Zoom_InitRun();
     778:	4eba 09a6      	jsr 1120 <Zoom_InitRun>(pc)

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
     7a6:	4eba 0c10      	jsr 13b8 <Zoom_Dealloc>(pc)
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
     7c8:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
     7ce:	4878 0010      	pea 10 <_start+0x10>
     7d2:	4879 0000 a724 	pea a724 <ClsSprites>
     7d8:	42a7           	clr.l -(sp)
     7da:	2f00           	move.l d0,-(sp)
     7dc:	4eba 2084      	jsr 2862 <TestCopperlistBatch>(pc)
     7e0:	4fef 0010      	lea 16(sp),sp
     7e4:	4a80           	tst.l d0
     7e6:	6642           	bne.s 82a <SwScrollerTest+0x6e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     7e8:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     7ee:	2c40           	movea.l d0,a6
     7f0:	4eae ffc4      	jsr -60(a6)
     7f4:	2f40 0070      	move.l d0,112(sp)
     7f8:	202f 0070      	move.l 112(sp),d0
     7fc:	2f40 006c      	move.l d0,108(sp)
     800:	2f7c 0000 76a8 	move.l #30376,104(sp)
     806:	0068 
     808:	702c           	moveq #44,d0
     80a:	2f40 0064      	move.l d0,100(sp)
     80e:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     814:	2c40           	movea.l d0,a6
     816:	222f 006c      	move.l 108(sp),d1
     81a:	242f 0068      	move.l 104(sp),d2
     81e:	262f 0064      	move.l 100(sp),d3
     822:	4eae ffd0      	jsr -48(a6)
     826:	2f40 0060      	move.l d0,96(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     82a:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
     830:	4878 000c      	pea c <_start+0xc>
     834:	4879 0000 a764 	pea a764 <ClScreen>
     83a:	4878 0010      	pea 10 <_start+0x10>
     83e:	2f00           	move.l d0,-(sp)
     840:	4eba 2020      	jsr 2862 <TestCopperlistBatch>(pc)
     844:	4fef 0010      	lea 16(sp),sp
     848:	4a80           	tst.l d0
     84a:	6642           	bne.s 88e <SwScrollerTest+0xd2>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     84c:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     852:	2c40           	movea.l d0,a6
     854:	4eae ffc4      	jsr -60(a6)
     858:	2f40 005c      	move.l d0,92(sp)
     85c:	202f 005c      	move.l 92(sp),d0
     860:	2f40 0058      	move.l d0,88(sp)
     864:	2f7c 0000 76de 	move.l #30430,84(sp)
     86a:	0054 
     86c:	7036           	moveq #54,d0
     86e:	2f40 0050      	move.l d0,80(sp)
     872:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     878:	2c40           	movea.l d0,a6
     87a:	222f 0058      	move.l 88(sp),d1
     87e:	242f 0054      	move.l 84(sp),d2
     882:	262f 0050      	move.l 80(sp),d3
     886:	4eae ffd0      	jsr -48(a6)
     88a:	2f40 004c      	move.l d0,76(sp)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     88e:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
     894:	4878 0002      	pea 2 <_start+0x2>
     898:	4879 0000 a6a4 	pea a6a4 <ClColor>
     89e:	4878 001e      	pea 1e <_start+0x1e>
     8a2:	2f00           	move.l d0,-(sp)
     8a4:	4eba 1fbc      	jsr 2862 <TestCopperlistBatch>(pc)
     8a8:	4fef 0010      	lea 16(sp),sp
     8ac:	4a80           	tst.l d0
     8ae:	6642           	bne.s 8f2 <SwScrollerTest+0x136>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     8b0:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     8b6:	2c40           	movea.l d0,a6
     8b8:	4eae ffc4      	jsr -60(a6)
     8bc:	2f40 0048      	move.l d0,72(sp)
     8c0:	202f 0048      	move.l 72(sp),d0
     8c4:	2f40 0044      	move.l d0,68(sp)
     8c8:	2f7c 0000 7715 	move.l #30485,64(sp)
     8ce:	0040 
     8d0:	7021           	moveq #33,d0
     8d2:	2f40 003c      	move.l d0,60(sp)
     8d6:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     8dc:	2c40           	movea.l d0,a6
     8de:	222f 0044      	move.l 68(sp),d1
     8e2:	242f 0040      	move.l 64(sp),d2
     8e6:	262f 003c      	move.l 60(sp),d3
     8ea:	4eae ffd0      	jsr -48(a6)
     8ee:	2f40 0038      	move.l d0,56(sp)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     8f2:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
     8f8:	4878 fffe      	pea fffffffe <_end+0xffb2d2ea>
     8fc:	4878 0020      	pea 20 <_start+0x20>
     900:	2f00           	move.l d0,-(sp)
     902:	4eba 1f9c      	jsr 28a0 <TestCopperlistPos>(pc)
     906:	4fef 000c      	lea 12(sp),sp
     90a:	4a80           	tst.l d0
     90c:	6642           	bne.s 950 <SwScrollerTest+0x194>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     90e:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     914:	2c40           	movea.l d0,a6
     916:	4eae ffc4      	jsr -60(a6)
     91a:	2f40 0034      	move.l d0,52(sp)
     91e:	202f 0034      	move.l 52(sp),d0
     922:	2f40 0030      	move.l d0,48(sp)
     926:	2f7c 0000 7737 	move.l #30519,44(sp)
     92c:	002c 
     92e:	7022           	moveq #34,d0
     930:	2f40 0028      	move.l d0,40(sp)
     934:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     93a:	2c40           	movea.l d0,a6
     93c:	222f 0030      	move.l 48(sp),d1
     940:	242f 002c      	move.l 44(sp),d2
     944:	262f 0028      	move.l 40(sp),d3
     948:	4eae ffd0      	jsr -48(a6)
     94c:	2f40 0024      	move.l d0,36(sp)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     950:	2239 0000 b8e0 	move.l b8e0 <sw_text>,d1
     956:	2039 004d 2cac 	move.l 4d2cac <DrawBuffer>,d0
     95c:	2f01           	move.l d1,-(sp)
     95e:	2f00           	move.l d0,-(sp)
     960:	4879 0000 b8e4 	pea b8e4 <sw_testfont>
     966:	4eba 0380      	jsr ce8 <WriteFont>(pc)
     96a:	4fef 000c      	lea 12(sp),sp

  UWORD *tstpointer = (UWORD *)DrawBuffer;
     96e:	2f79 004d 2cac 	move.l 4d2cac <DrawBuffer>,32(sp)
     974:	0020 
  if( *tstpointer != 0xff00)
     976:	206f 0020      	movea.l 32(sp),a0
     97a:	3010           	move.w (a0),d0
     97c:	0c40 ff00      	cmpi.w #-256,d0
     980:	6742           	beq.s 9c4 <SwScrollerTest+0x208>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     982:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     988:	2c40           	movea.l d0,a6
     98a:	4eae ffc4      	jsr -60(a6)
     98e:	2f40 001c      	move.l d0,28(sp)
     992:	202f 001c      	move.l 28(sp),d0
     996:	2f40 0018      	move.l d0,24(sp)
     99a:	2f7c 0000 775a 	move.l #30554,20(sp)
     9a0:	0014 
     9a2:	7031           	moveq #49,d0
     9a4:	2f40 0010      	move.l d0,16(sp)
     9a8:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
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
     9ea:	23c0 004d 2ca4 	move.l d0,4d2ca4 <Copperlist1>
  Copperlist2 = ClbuildSW();
     9f0:	4eba 0174      	jsr b66 <ClbuildSW>(pc)
     9f4:	23c0 004d 2ca8 	move.l d0,4d2ca8 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     9fa:	2f7c 0000 c800 	move.l #51200,80(sp)
     a00:	0050 
     a02:	7002           	moveq #2,d0
     a04:	2f40 004c      	move.l d0,76(sp)
     a08:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
     a0e:	2c40           	movea.l d0,a6
     a10:	202f 0050      	move.l 80(sp),d0
     a14:	222f 004c      	move.l 76(sp),d1
     a18:	4eae ff3a      	jsr -198(a6)
     a1c:	2f40 0048      	move.l d0,72(sp)
     a20:	202f 0048      	move.l 72(sp),d0
     a24:	23c0 004d 2c9c 	move.l d0,4d2c9c <Bitplane1>
  if(Bitplane1 == 0) {
     a2a:	2039 004d 2c9c 	move.l 4d2c9c <Bitplane1>,d0
     a30:	6658           	bne.s a8a <PrepareDisplaySW+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     a32:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     a38:	2c40           	movea.l d0,a6
     a3a:	4eae ffc4      	jsr -60(a6)
     a3e:	2f40 0044      	move.l d0,68(sp)
     a42:	202f 0044      	move.l 68(sp),d0
     a46:	2f40 0040      	move.l d0,64(sp)
     a4a:	2f7c 0000 7d3d 	move.l #32061,60(sp)
     a50:	003c 
     a52:	7026           	moveq #38,d0
     a54:	2f40 0038      	move.l d0,56(sp)
     a58:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     a5e:	2c40           	movea.l d0,a6
     a60:	222f 0040      	move.l 64(sp),d1
     a64:	242f 003c      	move.l 60(sp),d2
     a68:	262f 0038      	move.l 56(sp),d3
     a6c:	4eae ffd0      	jsr -48(a6)
     a70:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
     a74:	7001           	moveq #1,d0
     a76:	2f40 0030      	move.l d0,48(sp)
     a7a:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     a80:	2c40           	movea.l d0,a6
     a82:	222f 0030      	move.l 48(sp),d1
     a86:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
     a8a:	2039 004d 2c9c 	move.l 4d2c9c <Bitplane1>,d0
     a90:	23c0 004d 2cac 	move.l d0,4d2cac <DrawBuffer>
  DrawCopper = Copperlist1;
     a96:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
     a9c:	23c0 004d 2cb4 	move.l d0,4d2cb4 <DrawCopper>
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     aa2:	2f7c 0000 c800 	move.l #51200,44(sp)
     aa8:	002c 
     aaa:	7002           	moveq #2,d0
     aac:	2f40 0028      	move.l d0,40(sp)
     ab0:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
     ab6:	2c40           	movea.l d0,a6
     ab8:	202f 002c      	move.l 44(sp),d0
     abc:	222f 0028      	move.l 40(sp),d1
     ac0:	4eae ff3a      	jsr -198(a6)
     ac4:	2f40 0024      	move.l d0,36(sp)
     ac8:	202f 0024      	move.l 36(sp),d0
     acc:	23c0 004d 2ca0 	move.l d0,4d2ca0 <Bitplane2>
  if(Bitplane2 == 0) {
     ad2:	2039 004d 2ca0 	move.l 4d2ca0 <Bitplane2>,d0
     ad8:	6658           	bne.s b32 <PrepareDisplaySW+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     ada:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     ae0:	2c40           	movea.l d0,a6
     ae2:	4eae ffc4      	jsr -60(a6)
     ae6:	2f40 0020      	move.l d0,32(sp)
     aea:	202f 0020      	move.l 32(sp),d0
     aee:	2f40 001c      	move.l d0,28(sp)
     af2:	2f7c 0000 7d64 	move.l #32100,24(sp)
     af8:	0018 
     afa:	7026           	moveq #38,d0
     afc:	2f40 0014      	move.l d0,20(sp)
     b00:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     b06:	2c40           	movea.l d0,a6
     b08:	222f 001c      	move.l 28(sp),d1
     b0c:	242f 0018      	move.l 24(sp),d2
     b10:	262f 0014      	move.l 20(sp),d3
     b14:	4eae ffd0      	jsr -48(a6)
     b18:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     b1c:	7001           	moveq #1,d0
     b1e:	2f40 000c      	move.l d0,12(sp)
     b22:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     b28:	2c40           	movea.l d0,a6
     b2a:	222f 000c      	move.l 12(sp),d1
     b2e:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
     b32:	2039 004d 2ca0 	move.l 4d2ca0 <Bitplane2>,d0
     b38:	23c0 004d 2cb0 	move.l d0,4d2cb0 <ViewBuffer>
  ViewCopper = Copperlist2;
     b3e:	2039 004d 2ca8 	move.l 4d2ca8 <Copperlist2>,d0
     b44:	23c0 004d 2cb8 	move.l d0,4d2cb8 <ViewCopper>
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
     b7c:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
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
     b9e:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     ba4:	2c40           	movea.l d0,a6
     ba6:	4eae ffc4      	jsr -60(a6)
     baa:	2f40 0020      	move.l d0,32(sp)
     bae:	202f 0020      	move.l 32(sp),d0
     bb2:	2f40 001c      	move.l d0,28(sp)
     bb6:	2f7c 0000 7d8b 	move.l #32139,24(sp)
     bbc:	0018 
     bbe:	7228           	moveq #40,d1
     bc0:	2f41 0014      	move.l d1,20(sp)
     bc4:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     bca:	2c40           	movea.l d0,a6
     bcc:	222f 001c      	move.l 28(sp),d1
     bd0:	242f 0018      	move.l 24(sp),d2
     bd4:	262f 0014      	move.l 20(sp),d3
     bd8:	4eae ffd0      	jsr -48(a6)
     bdc:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     be0:	7401           	moveq #1,d2
     be2:	2f42 000c      	move.l d2,12(sp)
     be6:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
     bec:	2c40           	movea.l d0,a6
     bee:	222f 000c      	move.l 12(sp),d1
     bf2:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
     bf6:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
     bfc:	2f7c 0000 a724 	move.l #42788,64(sp)
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
     c36:	2f7c 0000 a764 	move.l #42852,64(sp)
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
     c98:	2f7c 0000 a6a4 	move.l #42660,64(sp)
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
  }
}*/

int Zoom_Pic = 1;
volatile int Zoom_DrawPicture = 1;
void Zoom_Run() {
     d60:	598f           	subq.l #4,sp
     d62:	2f03           	move.l d3,-(sp)
     d64:	2f02           	move.l d2,-(sp)
  if( Zoom_DrawPicture == 1) {    
     d66:	2039 0000 b940 	move.l b940 <Zoom_DrawPicture>,d0
     d6c:	7201           	moveq #1,d1
     d6e:	b280           	cmp.l d0,d1
     d70:	6658           	bne.s dca <Zoom_Run+0x6a>
    Utils_CopyMem(rawzoom+56280*Zoom_Pic, DrawBuffer, 14070);  
     d72:	2439 004d 2cac 	move.l 4d2cac <DrawBuffer>,d2
     d78:	2639 0000 b938 	move.l b938 <rawzoom>,d3
     d7e:	2039 0000 b93c 	move.l b93c <Zoom_Pic>,d0
     d84:	2f3c 0000 dbd8 	move.l #56280,-(sp)
     d8a:	2f00           	move.l d0,-(sp)
     d8c:	4eb9 0000 71a4 	jsr 71a4 <__mulsi3>
     d92:	508f           	addq.l #8,sp
     d94:	d083           	add.l d3,d0
     d96:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x1ec>
     d9a:	2f02           	move.l d2,-(sp)
     d9c:	2f00           	move.l d0,-(sp)
     d9e:	4eba f43e      	jsr 1de <Utils_CopyMem>(pc)
     da2:	4fef 000c      	lea 12(sp),sp
    ULONG *bp = 0x100;
     da6:	2f7c 0000 0100 	move.l #256,8(sp)
     dac:	0008 
  	*bp = 0;
     dae:	206f 0008      	movea.l 8(sp),a0
     db2:	4290           	clr.l (a0)
    Zoom_DrawPicture = 0;
     db4:	7000           	moveq #0,d0
     db6:	23c0 0000 b940 	move.l d0,b940 <Zoom_DrawPicture>
    Zoom_Pic++;
     dbc:	2039 0000 b93c 	move.l b93c <Zoom_Pic>,d0
     dc2:	5280           	addq.l #1,d0
     dc4:	23c0 0000 b93c 	move.l d0,b93c <Zoom_Pic>
  }
  //Zoom_SetBplPointers(DrawBuffer, DrawCopper);    
  if(Zoom_Pic == 89 ) {
     dca:	2039 0000 b93c 	move.l b93c <Zoom_Pic>,d0
     dd0:	7259           	moveq #89,d1
     dd2:	b280           	cmp.l d0,d1
     dd4:	6608           	bne.s dde <Zoom_Run+0x7e>
    Zoom_Pic = 11;
     dd6:	700b           	moveq #11,d0
     dd8:	23c0 0000 b93c 	move.l d0,b93c <Zoom_Pic>
  }  
}
     dde:	241f           	move.l (sp)+,d2
     de0:	261f           	move.l (sp)+,d3
     de2:	588f           	addq.l #4,sp
     de4:	4e75           	rts

00000de6 <Zoom_VblankHandler>:



void Zoom_VblankHandler() {
     de6:	598f           	subq.l #4,sp

  Zoom_Counter++;
     de8:	3039 004d 2cfc 	move.w 4d2cfc <Zoom_Counter>,d0
     dee:	5240           	addq.w #1,d0
     df0:	33c0 004d 2cfc 	move.w d0,4d2cfc <Zoom_Counter>
  SwapCl();
     df6:	4eba f3a8      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     dfa:	33fc 0001 004d 	move.w #1,4d2d02 <Zoom_MouseReleased>
     e00:	2d02 
  if( MouseLeft())
     e02:	4eba f45e      	jsr 262 <MouseLeft>(pc)
     e06:	4a40           	tst.w d0
     e08:	6708           	beq.s e12 <Zoom_VblankHandler+0x2c>
    Zoom_Mousepressed = 1;
     e0a:	33fc 0001 004d 	move.w #1,4d2d04 <Zoom_Mousepressed>
     e10:	2d04 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     e12:	3039 004d 2d04 	move.w 4d2d04 <Zoom_Mousepressed>,d0
     e18:	0c40 0001      	cmpi.w #1,d0
     e1c:	6616           	bne.s e34 <Zoom_VblankHandler+0x4e>
     e1e:	4eba f442      	jsr 262 <MouseLeft>(pc)
     e22:	4a40           	tst.w d0
     e24:	660e           	bne.s e34 <Zoom_VblankHandler+0x4e>
    Zoom_MouseReleased = 1;
     e26:	33fc 0001 004d 	move.w #1,4d2d02 <Zoom_MouseReleased>
     e2c:	2d02 
    Zoom_Mousepressed = 0;
     e2e:	4279 004d 2d04 	clr.w 4d2d04 <Zoom_Mousepressed>
  }
      
      Zoom_MouseReleased = 0;
     e34:	4279 004d 2d02 	clr.w 4d2d02 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom <= 2) {
     e3a:	3039 004d 2d0a 	move.w 4d2d0a <Zoom_LevelOf102Zoom>,d0
     e40:	0c40 0002      	cmpi.w #2,d0
     e44:	6256           	bhi.s e9c <Zoom_VblankHandler+0xb6>
 
        if( Zoom_LevelOfZoom == 87)
     e46:	3039 004d 2d08 	move.w 4d2d08 <Zoom_LevelOfZoom>,d0
     e4c:	0c40 0057      	cmpi.w #87,d0
     e50:	660a           	bne.s e5c <Zoom_VblankHandler+0x76>
          Zoom_LevelOfZoom = 0;
     e52:	33fc 0000 004d 	move.w #0,4d2d08 <Zoom_LevelOfZoom>
     e58:	2d08 
     e5a:	600e           	bra.s e6a <Zoom_VblankHandler+0x84>
        else
          Zoom_LevelOfZoom++;
     e5c:	3039 004d 2d08 	move.w 4d2d08 <Zoom_LevelOfZoom>,d0
     e62:	5240           	addq.w #1,d0
     e64:	33c0 004d 2d08 	move.w d0,4d2d08 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;          
     e6a:	33fc 000f 004d 	move.w #15,4d2d0a <Zoom_LevelOf102Zoom>
     e70:	2d0a 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     e72:	3039 004d 2d08 	move.w 4d2d08 <Zoom_LevelOfZoom>,d0
     e78:	3000           	move.w d0,d0
     e7a:	0280 0000 ffff 	andi.l #65535,d0
     e80:	2f00           	move.l d0,-(sp)
     e82:	4eba 10d0      	jsr 1f54 <Zoom_SwapBuffers>(pc)
     e86:	588f           	addq.l #4,sp
        /*Zoom_SetBplPointers( ViewBuffer, ViewCopper);
        Zoom_SetBplPointers( ViewBuffer, DrawCopper);*/
        ULONG *bp = 0x102;
     e88:	2ebc 0000 0102 	move.l #258,(sp)
  	    *bp = 0;
     e8e:	2057           	movea.l (sp),a0
     e90:	4290           	clr.l (a0)
        Zoom_DrawPicture = 1;     
     e92:	7001           	moveq #1,d0
     e94:	23c0 0000 b940 	move.l d0,b940 <Zoom_DrawPicture>
     e9a:	600e           	bra.s eaa <Zoom_VblankHandler+0xc4>
      } else 
        Zoom_LevelOf102Zoom-=2;
     e9c:	3039 004d 2d0a 	move.w 4d2d0a <Zoom_LevelOf102Zoom>,d0
     ea2:	5540           	subq.w #2,d0
     ea4:	33c0 004d 2d0a 	move.w d0,4d2d0a <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     eaa:	2239 004d 2cb4 	move.l 4d2cb4 <DrawCopper>,d1
     eb0:	3039 004d 2d0a 	move.w 4d2d0a <Zoom_LevelOf102Zoom>,d0
     eb6:	3000           	move.w d0,d0
     eb8:	0280 0000 ffff 	andi.l #65535,d0
     ebe:	2f01           	move.l d1,-(sp)
     ec0:	2f00           	move.l d0,-(sp)
     ec2:	4eba f548      	jsr 40c <Zoom_Shrink102>(pc)
     ec6:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     ec8:	2239 004d 2cb4 	move.l 4d2cb4 <DrawCopper>,d1
     ece:	2039 004d 2cb0 	move.l 4d2cb0 <ViewBuffer>,d0
     ed4:	2f01           	move.l d1,-(sp)
     ed6:	2f00           	move.l d0,-(sp)
     ed8:	4eba 0fe2      	jsr 1ebc <Zoom_SetBplPointers>(pc)
     edc:	508f           	addq.l #8,sp
 
}
     ede:	588f           	addq.l #4,sp
     ee0:	4e75           	rts

00000ee2 <Zoom_ReverseVblankHandler>:


void Zoom_ReverseVblankHandler() {
  
  Zoom_Counter++;
     ee2:	3039 004d 2cfc 	move.w 4d2cfc <Zoom_Counter>,d0
     ee8:	5240           	addq.w #1,d0
     eea:	33c0 004d 2cfc 	move.w d0,4d2cfc <Zoom_Counter>
  SwapCl();
     ef0:	4eba f2ae      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     ef4:	33fc 0001 004d 	move.w #1,4d2d02 <Zoom_MouseReleased>
     efa:	2d02 
  if( MouseLeft())
     efc:	4eba f364      	jsr 262 <MouseLeft>(pc)
     f00:	4a40           	tst.w d0
     f02:	6708           	beq.s f0c <Zoom_ReverseVblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     f04:	33fc 0001 004d 	move.w #1,4d2d04 <Zoom_Mousepressed>
     f0a:	2d04 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     f0c:	3039 004d 2d04 	move.w 4d2d04 <Zoom_Mousepressed>,d0
     f12:	0c40 0001      	cmpi.w #1,d0
     f16:	6616           	bne.s f2e <Zoom_ReverseVblankHandler+0x4c>
     f18:	4eba f348      	jsr 262 <MouseLeft>(pc)
     f1c:	4a40           	tst.w d0
     f1e:	660e           	bne.s f2e <Zoom_ReverseVblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     f20:	33fc 0001 004d 	move.w #1,4d2d02 <Zoom_MouseReleased>
     f26:	2d02 
    Zoom_Mousepressed = 0;
     f28:	4279 004d 2d04 	clr.w 4d2d04 <Zoom_Mousepressed>
    /*if( MouseLeft()) {
      while (MouseLeft())
      {
      }*/
      
      Zoom_MouseReleased = 0;
     f2e:	4279 004d 2d02 	clr.w 4d2d02 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 15) {
     f34:	3039 004d 2d0a 	move.w 4d2d0a <Zoom_LevelOf102Zoom>,d0
     f3a:	0c40 000f      	cmpi.w #15,d0
     f3e:	6640           	bne.s f80 <Zoom_ReverseVblankHandler+0x9e>
 
        if( Zoom_LevelOfZoom == 0)
     f40:	3039 004d 2d08 	move.w 4d2d08 <Zoom_LevelOfZoom>,d0
     f46:	660a           	bne.s f52 <Zoom_ReverseVblankHandler+0x70>
          Zoom_LevelOfZoom = 17;
     f48:	33fc 0011 004d 	move.w #17,4d2d08 <Zoom_LevelOfZoom>
     f4e:	2d08 
     f50:	600e           	bra.s f60 <Zoom_ReverseVblankHandler+0x7e>
        else
          Zoom_LevelOfZoom--;
     f52:	3039 004d 2d08 	move.w 4d2d08 <Zoom_LevelOfZoom>,d0
     f58:	5340           	subq.w #1,d0
     f5a:	33c0 004d 2d08 	move.w d0,4d2d08 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 0;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     f60:	33fc 0000 004d 	move.w #0,4d2d0a <Zoom_LevelOf102Zoom>
     f66:	2d0a 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     f68:	3039 004d 2d08 	move.w 4d2d08 <Zoom_LevelOfZoom>,d0
     f6e:	3000           	move.w d0,d0
     f70:	0280 0000 ffff 	andi.l #65535,d0
     f76:	2f00           	move.l d0,-(sp)
     f78:	4eba 0fda      	jsr 1f54 <Zoom_SwapBuffers>(pc)
     f7c:	588f           	addq.l #4,sp
     f7e:	600e           	bra.s f8e <Zoom_ReverseVblankHandler+0xac>
      } else 
        Zoom_LevelOf102Zoom++;
     f80:	3039 004d 2d0a 	move.w 4d2d0a <Zoom_LevelOf102Zoom>,d0
     f86:	5240           	addq.w #1,d0
     f88:	33c0 004d 2d0a 	move.w d0,4d2d0a <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     f8e:	2239 004d 2cb4 	move.l 4d2cb4 <DrawCopper>,d1
     f94:	3039 004d 2d0a 	move.w 4d2d0a <Zoom_LevelOf102Zoom>,d0
     f9a:	3000           	move.w d0,d0
     f9c:	0280 0000 ffff 	andi.l #65535,d0
     fa2:	2f01           	move.l d1,-(sp)
     fa4:	2f00           	move.l d0,-(sp)
     fa6:	4eba f464      	jsr 40c <Zoom_Shrink102>(pc)
     faa:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     fac:	2239 004d 2cb4 	move.l 4d2cb4 <DrawCopper>,d1
     fb2:	2039 004d 2cb0 	move.l 4d2cb0 <ViewBuffer>,d0
     fb8:	2f01           	move.l d1,-(sp)
     fba:	2f00           	move.l d0,-(sp)
     fbc:	4eba 0efe      	jsr 1ebc <Zoom_SetBplPointers>(pc)
     fc0:	508f           	addq.l #8,sp
 
}
     fc2:	4e75           	rts

00000fc4 <Zoom_LoadImage>:

void Zoom_LoadImage( ULONG *destination) {  
     fc4:	4fef fff4      	lea -12(sp),sp
     fc8:	2f0e           	move.l a6,-(sp)
  CopyMem( rawzoom, destination, ZMBPLSIZE);
     fca:	2f79 0000 b938 	move.l b938 <rawzoom>,12(sp)
     fd0:	000c 
     fd2:	2f6f 0014 0008 	move.l 20(sp),8(sp)
     fd8:	2f7c 0000 df20 	move.l #57120,4(sp)
     fde:	0004 
     fe0:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
     fe6:	2c40           	movea.l d0,a6
     fe8:	206f 000c      	movea.l 12(sp),a0
     fec:	226f 0008      	movea.l 8(sp),a1
     ff0:	202f 0004      	move.l 4(sp),d0
     ff4:	4eae fd90      	jsr -624(a6)
}
     ff8:	2c5f           	movea.l (sp)+,a6
     ffa:	4fef 000c      	lea 12(sp),sp
     ffe:	4e75           	rts

00001000 <Zoom_CopyWord>:

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080008, 
                                                       0x010a0000, 0x01001200 };

void  Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height) {  
    1000:	598f           	subq.l #4,sp
    1002:	202f 0010      	move.l 16(sp),d0
    1006:	3000           	move.w d0,d0
    1008:	3f40 0002      	move.w d0,2(sp)

  WaitBlt();
    100c:	4eba f0a6      	jsr b4 <WaitBlt>(pc)

  hw->bltapt = (UWORD *) source;
    1010:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1016:	216f 0008 0050 	move.l 8(sp),80(a0)
  hw->bltdpt = (UWORD *) destination;
    101c:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1022:	216f 000c 0054 	move.l 12(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    1028:	302f 0002      	move.w 2(sp),d0
    102c:	ed48           	lsl.w #6,d0
    102e:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1034:	5440           	addq.w #2,d0
    1036:	3140 0058      	move.w d0,88(a0)

}
    103a:	588f           	addq.l #4,sp
    103c:	4e75           	rts

0000103e <Zoom_ZoomBlit>:

void Zoom_ZoomBlit( UWORD *source, UWORD *destination, UWORD height) {
    103e:	518f           	subq.l #8,sp
    1040:	202f 0014      	move.l 20(sp),d0
    1044:	3000           	move.w d0,d0
    1046:	3f40 0002      	move.w d0,2(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B

  UWORD *blta = source + ZoomBlit_Increment4SrcA;
    104a:	3039 004d 2cf2 	move.w 4d2cf2 <ZoomBlit_Increment4SrcA>,d0
    1050:	3000           	move.w d0,d0
    1052:	0280 0000 ffff 	andi.l #65535,d0
    1058:	d080           	add.l d0,d0
    105a:	222f 000c      	move.l 12(sp),d1
    105e:	d280           	add.l d0,d1
    1060:	2f41 0004      	move.l d1,4(sp)
  WaitBlt();
    1064:	4eba f04e      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  
  hw->bltapt = blta;
    1068:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    106e:	216f 0004 0050 	move.l 4(sp),80(a0)
  hw->bltbpt = source;
    1074:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    107a:	216f 000c 004c 	move.l 12(sp),76(a0)
  hw->bltdpt = destination;
    1080:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1086:	216f 0010 0054 	move.l 16(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    108c:	302f 0002      	move.w 2(sp),d0
    1090:	ed48           	lsl.w #6,d0
    1092:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1098:	5440           	addq.w #2,d0
    109a:	3140 0058      	move.w d0,88(a0)

}
    109e:	508f           	addq.l #8,sp
    10a0:	4e75           	rts

000010a2 <Zoom_ZoomBlit2>:

void Zoom_ZoomBlit2( UWORD *src4a, UWORD *src4b, UWORD *dst, UWORD height,
                                                 UWORD bltamod, UWORD bltbmod
                                                        , UWORD numofwords) {
    10a2:	518f           	subq.l #8,sp
    10a4:	226f 0018      	movea.l 24(sp),a1
    10a8:	206f 001c      	movea.l 28(sp),a0
    10ac:	222f 0020      	move.l 32(sp),d1
    10b0:	202f 0024      	move.l 36(sp),d0
    10b4:	3249           	movea.w a1,a1
    10b6:	3f49 0006      	move.w a1,6(sp)
    10ba:	3048           	movea.w a0,a0
    10bc:	3f48 0004      	move.w a0,4(sp)
    10c0:	3201           	move.w d1,d1
    10c2:	3f41 0002      	move.w d1,2(sp)
    10c6:	3000           	move.w d0,d0
    10c8:	3e80           	move.w d0,(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B
  hw->bltamod = bltamod;
    10ca:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    10d0:	316f 0004 0064 	move.w 4(sp),100(a0)
  hw->bltbmod = bltbmod;  
    10d6:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    10dc:	316f 0002 0062 	move.w 2(sp),98(a0)
  hw->bltapt = src4a;
    10e2:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    10e8:	216f 000c 0050 	move.l 12(sp),80(a0)
  hw->bltbpt = src4b;
    10ee:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    10f4:	216f 0010 004c 	move.l 16(sp),76(a0)
  hw->bltdpt = dst;
    10fa:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1100:	216f 0014 0054 	move.l 20(sp),84(a0)
  hw->bltsize = (height<<6)+numofwords;
    1106:	302f 0006      	move.w 6(sp),d0
    110a:	ed48           	lsl.w #6,d0
    110c:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1112:	d057           	add.w (sp),d0
    1114:	3140 0058      	move.w d0,88(a0)
  
  WaitBlt();
    1118:	4eba ef9a      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a  

}
    111c:	508f           	addq.l #8,sp
    111e:	4e75           	rts

00001120 <Zoom_InitRun>:


void Zoom_InitRun() {
    1120:	4fef ffe0      	lea -32(sp),sp
    1124:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    1126:	4279 004d 2cfc 	clr.w 4d2cfc <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    112c:	7004           	moveq #4,d0
    112e:	2f40 0020      	move.l d0,32(sp)
    1132:	7002           	moveq #2,d0
    1134:	2f40 001c      	move.l d0,28(sp)
    1138:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    113e:	2c40           	movea.l d0,a6
    1140:	202f 0020      	move.l 32(sp),d0
    1144:	222f 001c      	move.l 28(sp),d1
    1148:	4eae ff3a      	jsr -198(a6)
    114c:	2f40 0018      	move.l d0,24(sp)
    1150:	202f 0018      	move.l 24(sp),d0
    1154:	23c0 004d 2cea 	move.l d0,4d2cea <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 15;
    115a:	33fc 000f 004d 	move.w #15,4d2d0a <Zoom_LevelOf102Zoom>
    1160:	2d0a 
  ZoomHorizontal = 16;
    1162:	33fc 0010 004d 	move.w #16,4d2d0e <ZoomHorizontal>
    1168:	2d0e 
  Zoom_PrepareDisplay();
    116a:	4eba 0288      	jsr 13f4 <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 15, Copperlist1);
    116e:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    1174:	2f00           	move.l d0,-(sp)
    1176:	4878 000f      	pea f <_start+0xf>
    117a:	4eba f290      	jsr 40c <Zoom_Shrink102>(pc)
    117e:	508f           	addq.l #8,sp
  Zoom_Shrink102( 15, Copperlist2);
    1180:	2039 004d 2ca8 	move.l 4d2ca8 <Copperlist2>,d0
    1186:	2f00           	move.l d0,-(sp)
    1188:	4878 000f      	pea f <_start+0xf>
    118c:	4eba f27e      	jsr 40c <Zoom_Shrink102>(pc)
    1190:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 1;
    1192:	33fc 0001 004d 	move.w #1,4d2d08 <Zoom_LevelOfZoom>
    1198:	2d08 
  Zoom_Direction = 1;                                                  
    119a:	33fc 0001 004d 	move.w #1,4d2d0c <Zoom_Direction>
    11a0:	2d0c 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    11a2:	7016           	moveq #22,d0
    11a4:	2f40 0014      	move.l d0,20(sp)
    11a8:	2f7c 0001 0001 	move.l #65537,16(sp)
    11ae:	0010 
    11b0:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    11b6:	2c40           	movea.l d0,a6
    11b8:	202f 0014      	move.l 20(sp),d0
    11bc:	222f 0010      	move.l 16(sp),d1
    11c0:	4eae ff3a      	jsr -198(a6)
    11c4:	2f40 000c      	move.l d0,12(sp)
    11c8:	202f 000c      	move.l 12(sp),d0
    11cc:	23c0 004d 2cf4 	move.l d0,4d2cf4 <Zoom_vbint>
    11d2:	2039 004d 2cf4 	move.l 4d2cf4 <Zoom_vbint>,d0
    11d8:	673e           	beq.s 1218 <Zoom_InitRun+0xf8>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    11da:	2079 004d 2cf4 	movea.l 4d2cf4 <Zoom_vbint>,a0
    11e0:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    11e6:	2079 004d 2cf4 	movea.l 4d2cf4 <Zoom_vbint>,a0
    11ec:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    11f2:	2079 004d 2cf4 	movea.l 4d2cf4 <Zoom_vbint>,a0
    11f8:	217c 0000 7db1 	move.l #32177,10(a0)
    11fe:	000a 
    Zoom_vbint->is_Data = NULL;
    1200:	2079 004d 2cf4 	movea.l 4d2cf4 <Zoom_vbint>,a0
    1206:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    120a:	2079 004d 2cf4 	movea.l 4d2cf4 <Zoom_vbint>,a0
    1210:	217c 0000 0de6 	move.l #3558,18(a0)
    1216:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    1218:	7005           	moveq #5,d0
    121a:	2f40 0008      	move.l d0,8(sp)
    121e:	2f79 004d 2cf4 	move.l 4d2cf4 <Zoom_vbint>,4(sp)
    1224:	0004 
    1226:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    122c:	2c40           	movea.l d0,a6
    122e:	202f 0008      	move.l 8(sp),d0
    1232:	226f 0004      	movea.l 4(sp),a1
    1236:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    123a:	2239 004d 2cb8 	move.l 4d2cb8 <ViewCopper>,d1
    1240:	2039 004d 2cb0 	move.l 4d2cb0 <ViewBuffer>,d0
    1246:	2f01           	move.l d1,-(sp)
    1248:	2f00           	move.l d0,-(sp)
    124a:	4eba 0c70      	jsr 1ebc <Zoom_SetBplPointers>(pc)
    124e:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    1250:	2239 004d 2cb4 	move.l 4d2cb4 <DrawCopper>,d1
    1256:	2039 004d 2cb0 	move.l 4d2cb0 <ViewBuffer>,d0
    125c:	2f01           	move.l d1,-(sp)
    125e:	2f00           	move.l d0,-(sp)
    1260:	4eba 0c5a      	jsr 1ebc <Zoom_SetBplPointers>(pc)
    1264:	508f           	addq.l #8,sp
  SwapCl();
    1266:	4eba ef38      	jsr 1a0 <SwapCl>(pc)
  
}
    126a:	2c5f           	movea.l (sp)+,a6
    126c:	4fef 0020      	lea 32(sp),sp
    1270:	4e75           	rts

00001272 <Zoom_InitRunReverse>:

void Zoom_InitRunReverse() {
    1272:	4fef ffe0      	lea -32(sp),sp
    1276:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    1278:	4279 004d 2cfc 	clr.w 4d2cfc <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    127e:	7004           	moveq #4,d0
    1280:	2f40 0020      	move.l d0,32(sp)
    1284:	7002           	moveq #2,d0
    1286:	2f40 001c      	move.l d0,28(sp)
    128a:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    1290:	2c40           	movea.l d0,a6
    1292:	202f 0020      	move.l 32(sp),d0
    1296:	222f 001c      	move.l 28(sp),d1
    129a:	4eae ff3a      	jsr -198(a6)
    129e:	2f40 0018      	move.l d0,24(sp)
    12a2:	202f 0018      	move.l 24(sp),d0
    12a6:	23c0 004d 2cea 	move.l d0,4d2cea <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 0;
    12ac:	33fc 0000 004d 	move.w #0,4d2d0a <Zoom_LevelOf102Zoom>
    12b2:	2d0a 
  ZoomHorizontal = 16;
    12b4:	33fc 0010 004d 	move.w #16,4d2d0e <ZoomHorizontal>
    12ba:	2d0e 
  Zoom_PrepareDisplay();
    12bc:	4eba 0136      	jsr 13f4 <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 0, Copperlist1);
    12c0:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    12c6:	2f00           	move.l d0,-(sp)
    12c8:	42a7           	clr.l -(sp)
    12ca:	4eba f140      	jsr 40c <Zoom_Shrink102>(pc)
    12ce:	508f           	addq.l #8,sp
  Zoom_Shrink102( 0, Copperlist2);
    12d0:	2039 004d 2ca8 	move.l 4d2ca8 <Copperlist2>,d0
    12d6:	2f00           	move.l d0,-(sp)
    12d8:	42a7           	clr.l -(sp)
    12da:	4eba f130      	jsr 40c <Zoom_Shrink102>(pc)
    12de:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 17;
    12e0:	33fc 0011 004d 	move.w #17,4d2d08 <Zoom_LevelOfZoom>
    12e6:	2d08 
                                                  
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    12e8:	7016           	moveq #22,d0
    12ea:	2f40 0014      	move.l d0,20(sp)
    12ee:	2f7c 0001 0001 	move.l #65537,16(sp)
    12f4:	0010 
    12f6:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    12fc:	2c40           	movea.l d0,a6
    12fe:	202f 0014      	move.l 20(sp),d0
    1302:	222f 0010      	move.l 16(sp),d1
    1306:	4eae ff3a      	jsr -198(a6)
    130a:	2f40 000c      	move.l d0,12(sp)
    130e:	202f 000c      	move.l 12(sp),d0
    1312:	23c0 004d 2cf4 	move.l d0,4d2cf4 <Zoom_vbint>
    1318:	2039 004d 2cf4 	move.l 4d2cf4 <Zoom_vbint>,d0
    131e:	673e           	beq.s 135e <Zoom_InitRunReverse+0xec>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1320:	2079 004d 2cf4 	movea.l 4d2cf4 <Zoom_vbint>,a0
    1326:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    132c:	2079 004d 2cf4 	movea.l 4d2cf4 <Zoom_vbint>,a0
    1332:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    1338:	2079 004d 2cf4 	movea.l 4d2cf4 <Zoom_vbint>,a0
    133e:	217c 0000 7db1 	move.l #32177,10(a0)
    1344:	000a 
    Zoom_vbint->is_Data = NULL;
    1346:	2079 004d 2cf4 	movea.l 4d2cf4 <Zoom_vbint>,a0
    134c:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_ReverseVblankHandler;
    1350:	2079 004d 2cf4 	movea.l 4d2cf4 <Zoom_vbint>,a0
    1356:	217c 0000 0ee2 	move.l #3810,18(a0)
    135c:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    135e:	7005           	moveq #5,d0
    1360:	2f40 0008      	move.l d0,8(sp)
    1364:	2f79 004d 2cf4 	move.l 4d2cf4 <Zoom_vbint>,4(sp)
    136a:	0004 
    136c:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    1372:	2c40           	movea.l d0,a6
    1374:	202f 0008      	move.l 8(sp),d0
    1378:	226f 0004      	movea.l 4(sp),a1
    137c:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    1380:	2239 004d 2cb8 	move.l 4d2cb8 <ViewCopper>,d1
    1386:	2039 004d 2cb0 	move.l 4d2cb0 <ViewBuffer>,d0
    138c:	2f01           	move.l d1,-(sp)
    138e:	2f00           	move.l d0,-(sp)
    1390:	4eba 0b2a      	jsr 1ebc <Zoom_SetBplPointers>(pc)
    1394:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    1396:	2239 004d 2cb4 	move.l 4d2cb4 <DrawCopper>,d1
    139c:	2039 004d 2cb0 	move.l 4d2cb0 <ViewBuffer>,d0
    13a2:	2f01           	move.l d1,-(sp)
    13a4:	2f00           	move.l d0,-(sp)
    13a6:	4eba 0b14      	jsr 1ebc <Zoom_SetBplPointers>(pc)
    13aa:	508f           	addq.l #8,sp
  SwapCl();
    13ac:	4eba edf2      	jsr 1a0 <SwapCl>(pc)
  
}
    13b0:	2c5f           	movea.l (sp)+,a6
    13b2:	4fef 0020      	lea 32(sp),sp
    13b6:	4e75           	rts

000013b8 <Zoom_Dealloc>:

void Zoom_Dealloc() {
    13b8:	518f           	subq.l #8,sp
    13ba:	2f0e           	move.l a6,-(sp)
  RemIntServer(INTB_VERTB, Zoom_vbint);
    13bc:	7005           	moveq #5,d0
    13be:	2f40 0008      	move.l d0,8(sp)
    13c2:	2f79 004d 2cf4 	move.l 4d2cf4 <Zoom_vbint>,4(sp)
    13c8:	0004 
    13ca:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    13d0:	2c40           	movea.l d0,a6
    13d2:	202f 0008      	move.l 8(sp),d0
    13d6:	226f 0004      	movea.l 4(sp),a1
    13da:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    13de:	2f3c 0000 df20 	move.l #57120,-(sp)
    13e4:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    13e8:	4eba ecf6      	jsr e0 <FreeDisplay>(pc)
    13ec:	508f           	addq.l #8,sp
}
    13ee:	2c5f           	movea.l (sp)+,a6
    13f0:	508f           	addq.l #8,sp
    13f2:	4e75           	rts

000013f4 <Zoom_PrepareDisplay>:
  
int Zoom_PrepareDisplay() {
    13f4:	4fef ffe8      	lea -24(sp),sp
    13f8:	2f0e           	move.l a6,-(sp)
  ViewBuffer = AllocVec(268*42*5, MEMF_CHIP);  
    13fa:	2f7c 0000 dbd8 	move.l #56280,24(sp)
    1400:	0018 
    1402:	7002           	moveq #2,d0
    1404:	2f40 0014      	move.l d0,20(sp)
    1408:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    140e:	2c40           	movea.l d0,a6
    1410:	202f 0018      	move.l 24(sp),d0
    1414:	222f 0014      	move.l 20(sp),d1
    1418:	4eae fd54      	jsr -684(a6)
    141c:	2f40 0010      	move.l d0,16(sp)
    1420:	202f 0010      	move.l 16(sp),d0
    1424:	23c0 004d 2cb0 	move.l d0,4d2cb0 <ViewBuffer>
  DrawBuffer = AllocVec(268*42*5, MEMF_CHIP);
    142a:	2f7c 0000 dbd8 	move.l #56280,12(sp)
    1430:	000c 
    1432:	7002           	moveq #2,d0
    1434:	2f40 0008      	move.l d0,8(sp)
    1438:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    143e:	2c40           	movea.l d0,a6
    1440:	202f 000c      	move.l 12(sp),d0
    1444:	222f 0008      	move.l 8(sp),d1
    1448:	4eae fd54      	jsr -684(a6)
    144c:	2f40 0004      	move.l d0,4(sp)
    1450:	202f 0004      	move.l 4(sp),d0
    1454:	23c0 004d 2cac 	move.l d0,4d2cac <DrawBuffer>
  Utils_CopyMem( rawzoom, ViewBuffer, 14070);
    145a:	2239 004d 2cb0 	move.l 4d2cb0 <ViewBuffer>,d1
    1460:	2039 0000 b938 	move.l b938 <rawzoom>,d0
    1466:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x1ec>
    146a:	2f01           	move.l d1,-(sp)
    146c:	2f00           	move.l d0,-(sp)
    146e:	4eba ed6e      	jsr 1de <Utils_CopyMem>(pc)
    1472:	4fef 000c      	lea 12(sp),sp
  Utils_CopyMem( rawzoom, DrawBuffer, 14070);
    1476:	2239 004d 2cac 	move.l 4d2cac <DrawBuffer>,d1
    147c:	2039 0000 b938 	move.l b938 <rawzoom>,d0
    1482:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x1ec>
    1486:	2f01           	move.l d1,-(sp)
    1488:	2f00           	move.l d0,-(sp)
    148a:	4eba ed52      	jsr 1de <Utils_CopyMem>(pc)
    148e:	4fef 000c      	lea 12(sp),sp
  //Zoom_SwapBuffers( 0);
  Copperlist1 = ClbuildZoom( );
    1492:	4eba 0080      	jsr 1514 <ClbuildZoom>(pc)
    1496:	23c0 004d 2ca4 	move.l d0,4d2ca4 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    149c:	4eba 0076      	jsr 1514 <ClbuildZoom>(pc)
    14a0:	23c0 004d 2ca8 	move.l d0,4d2ca8 <Copperlist2>
  if(Bitplane2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;*/
  DrawCopper = Copperlist1;
    14a6:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    14ac:	23c0 004d 2cb4 	move.l d0,4d2cb4 <DrawCopper>
  ViewCopper = Copperlist2;
    14b2:	2039 004d 2ca8 	move.l 4d2ca8 <Copperlist2>,d0
    14b8:	23c0 004d 2cb8 	move.l d0,4d2cb8 <ViewCopper>
  return 0;
    14be:	7000           	moveq #0,d0
}
    14c0:	2c5f           	movea.l (sp)+,a6
    14c2:	4fef 0018      	lea 24(sp),sp
    14c6:	4e75           	rts

000014c8 <Zoom_Init>:

void Zoom_Init() {
    14c8:	4fef fff4      	lea -12(sp),sp
    14cc:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    14ce:	7004           	moveq #4,d0
    14d0:	2f40 000c      	move.l d0,12(sp)
    14d4:	7002           	moveq #2,d0
    14d6:	2f40 0008      	move.l d0,8(sp)
    14da:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    14e0:	2c40           	movea.l d0,a6
    14e2:	202f 000c      	move.l 12(sp),d0
    14e6:	222f 0008      	move.l 8(sp),d1
    14ea:	4eae ff3a      	jsr -198(a6)
    14ee:	2f40 0004      	move.l d0,4(sp)
    14f2:	202f 0004      	move.l 4(sp),d0
    14f6:	23c0 004d 2cea 	move.l d0,4d2cea <Zoom_ZoomBlitMask>
  ZoomHorizontal = 16;
    14fc:	33fc 0010 004d 	move.w #16,4d2d0e <ZoomHorizontal>
    1502:	2d0e 
  Zoom_LevelOf102Zoom = 15;
    1504:	33fc 000f 004d 	move.w #15,4d2d0a <Zoom_LevelOf102Zoom>
    150a:	2d0a 
}
    150c:	2c5f           	movea.l (sp)+,a6
    150e:	4fef 000c      	lea 12(sp),sp
    1512:	4e75           	rts

00001514 <ClbuildZoom>:


ULONG * ClbuildZoom() {
    1514:	4fef ffac      	lea -84(sp),sp
    1518:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    151c:	2f7c 0000 031c 	move.l #796,68(sp)
    1522:	0044 
    1524:	7002           	moveq #2,d0
    1526:	2f40 0040      	move.l d0,64(sp)
    152a:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    1530:	2c40           	movea.l d0,a6
    1532:	202f 0044      	move.l 68(sp),d0
    1536:	222f 0040      	move.l 64(sp),d1
    153a:	4eae ff3a      	jsr -198(a6)
    153e:	2f40 003c      	move.l d0,60(sp)
    1542:	202f 003c      	move.l 60(sp),d0
    1546:	2f40 0038      	move.l d0,56(sp)
  
  if( retval == 0) {
    154a:	6658           	bne.s 15a4 <ClbuildZoom+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    154c:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    1552:	2c40           	movea.l d0,a6
    1554:	4eae ffc4      	jsr -60(a6)
    1558:	2f40 0034      	move.l d0,52(sp)
    155c:	202f 0034      	move.l 52(sp),d0
    1560:	2f40 0030      	move.l d0,48(sp)
    1564:	2f7c 0000 7d8b 	move.l #32139,44(sp)
    156a:	002c 
    156c:	7228           	moveq #40,d1
    156e:	2f41 0028      	move.l d1,40(sp)
    1572:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    1578:	2c40           	movea.l d0,a6
    157a:	222f 0030      	move.l 48(sp),d1
    157e:	242f 002c      	move.l 44(sp),d2
    1582:	262f 0028      	move.l 40(sp),d3
    1586:	4eae ffd0      	jsr -48(a6)
    158a:	2f40 0024      	move.l d0,36(sp)
    Exit(1);
    158e:	7401           	moveq #1,d2
    1590:	2f42 0020      	move.l d2,32(sp)
    1594:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    159a:	2c40           	movea.l d0,a6
    159c:	222f 0020      	move.l 32(sp),d1
    15a0:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    15a4:	2f6f 0038 005c 	move.l 56(sp),92(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    15aa:	2f7c 0000 a724 	move.l #42788,88(sp)
    15b0:	0058 
  for(int i=0; i<16;i++)
    15b2:	42af 0054      	clr.l 84(sp)
    15b6:	6024           	bra.s 15dc <ClbuildZoom+0xc8>
    *cl++ = *clpartinstruction++;
    15b8:	222f 0058      	move.l 88(sp),d1
    15bc:	2001           	move.l d1,d0
    15be:	5880           	addq.l #4,d0
    15c0:	2f40 0058      	move.l d0,88(sp)
    15c4:	202f 005c      	move.l 92(sp),d0
    15c8:	2400           	move.l d0,d2
    15ca:	5882           	addq.l #4,d2
    15cc:	2f42 005c      	move.l d2,92(sp)
    15d0:	2041           	movea.l d1,a0
    15d2:	2210           	move.l (a0),d1
    15d4:	2040           	movea.l d0,a0
    15d6:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    15d8:	52af 0054      	addq.l #1,84(sp)
    15dc:	700f           	moveq #15,d0
    15de:	b0af 0054      	cmp.l 84(sp),d0
    15e2:	6cd4           	bge.s 15b8 <ClbuildZoom+0xa4>
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
    15e4:	2f7c 0000 a764 	move.l #42852,88(sp)
    15ea:	0058 
  for(int i=0; i<12;i++)
    15ec:	42af 0050      	clr.l 80(sp)
    15f0:	6024           	bra.s 1616 <ClbuildZoom+0x102>
    *cl++ = *clpartinstruction++;
    15f2:	222f 0058      	move.l 88(sp),d1
    15f6:	2401           	move.l d1,d2
    15f8:	5882           	addq.l #4,d2
    15fa:	2f42 0058      	move.l d2,88(sp)
    15fe:	202f 005c      	move.l 92(sp),d0
    1602:	2400           	move.l d0,d2
    1604:	5882           	addq.l #4,d2
    1606:	2f42 005c      	move.l d2,92(sp)
    160a:	2041           	movea.l d1,a0
    160c:	2210           	move.l (a0),d1
    160e:	2040           	movea.l d0,a0
    1610:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    1612:	52af 0050      	addq.l #1,80(sp)
    1616:	700b           	moveq #11,d0
    1618:	b0af 0050      	cmp.l 80(sp),d0
    161c:	6cd4           	bge.s 15f2 <ClbuildZoom+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    161e:	202f 005c      	move.l 92(sp),d0
    1622:	2200           	move.l d0,d1
    1624:	5881           	addq.l #4,d1
    1626:	2f41 005c      	move.l d1,92(sp)
    162a:	2040           	movea.l d0,a0
    162c:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    1632:	202f 005c      	move.l 92(sp),d0
    1636:	2200           	move.l d0,d1
    1638:	5881           	addq.l #4,d1
    163a:	2f41 005c      	move.l d1,92(sp)
    163e:	2040           	movea.l d0,a0
    1640:	20bc 00e2 0000 	move.l #14811136,(a0)
  *cl++ = 0x00e40000;
    1646:	202f 005c      	move.l 92(sp),d0
    164a:	2200           	move.l d0,d1
    164c:	5881           	addq.l #4,d1
    164e:	2f41 005c      	move.l d1,92(sp)
    1652:	2040           	movea.l d0,a0
    1654:	20bc 00e4 0000 	move.l #14942208,(a0)
  *cl++ = 0x00e60000;
    165a:	202f 005c      	move.l 92(sp),d0
    165e:	2200           	move.l d0,d1
    1660:	5881           	addq.l #4,d1
    1662:	2f41 005c      	move.l d1,92(sp)
    1666:	2040           	movea.l d0,a0
    1668:	20bc 00e6 0000 	move.l #15073280,(a0)
  *cl++ = 0x00e80000;
    166e:	202f 005c      	move.l 92(sp),d0
    1672:	2200           	move.l d0,d1
    1674:	5881           	addq.l #4,d1
    1676:	2f41 005c      	move.l d1,92(sp)
    167a:	2040           	movea.l d0,a0
    167c:	20bc 00e8 0000 	move.l #15204352,(a0)
  *cl++ = 0x00ea0000;
    1682:	202f 005c      	move.l 92(sp),d0
    1686:	2200           	move.l d0,d1
    1688:	5881           	addq.l #4,d1
    168a:	2f41 005c      	move.l d1,92(sp)
    168e:	2040           	movea.l d0,a0
    1690:	20bc 00ea 0000 	move.l #15335424,(a0)
  *cl++ = 0x00ec0000;
    1696:	202f 005c      	move.l 92(sp),d0
    169a:	2200           	move.l d0,d1
    169c:	5881           	addq.l #4,d1
    169e:	2f41 005c      	move.l d1,92(sp)
    16a2:	2040           	movea.l d0,a0
    16a4:	20bc 00ec 0000 	move.l #15466496,(a0)
  *cl++ = 0x00ee0000;
    16aa:	202f 005c      	move.l 92(sp),d0
    16ae:	2200           	move.l d0,d1
    16b0:	5881           	addq.l #4,d1
    16b2:	2f41 005c      	move.l d1,92(sp)
    16b6:	2040           	movea.l d0,a0
    16b8:	20bc 00ee 0000 	move.l #15597568,(a0)
  *cl++ = 0x00f00000;
    16be:	202f 005c      	move.l 92(sp),d0
    16c2:	2200           	move.l d0,d1
    16c4:	5881           	addq.l #4,d1
    16c6:	2f41 005c      	move.l d1,92(sp)
    16ca:	2040           	movea.l d0,a0
    16cc:	20bc 00f0 0000 	move.l #15728640,(a0)
  *cl++ = 0x00f20000;
    16d2:	202f 005c      	move.l 92(sp),d0
    16d6:	2200           	move.l d0,d1
    16d8:	5881           	addq.l #4,d1
    16da:	2f41 005c      	move.l d1,92(sp)
    16de:	2040           	movea.l d0,a0
    16e0:	20bc 00f2 0000 	move.l #15859712,(a0)

  clpartinstruction = ClColor;
    16e6:	2f7c 0000 a6a4 	move.l #42660,88(sp)
    16ec:	0058 
  for(int i=0; i<32;i++)
    16ee:	42af 004c      	clr.l 76(sp)
    16f2:	6024           	bra.s 1718 <ClbuildZoom+0x204>
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
  for(int i=0; i<32;i++)
    1714:	52af 004c      	addq.l #1,76(sp)
    1718:	701f           	moveq #31,d0
    171a:	b0af 004c      	cmp.l 76(sp),d0
    171e:	6cd4           	bge.s 16f4 <ClbuildZoom+0x1e0>
  
  ULONG cop2 = cl+3;
    1720:	700c           	moveq #12,d0
    1722:	d0af 005c      	add.l 92(sp),d0
    1726:	2f40 001c      	move.l d0,28(sp)
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    172a:	202f 001c      	move.l 28(sp),d0
    172e:	4240           	clr.w d0
    1730:	4840           	swap d0
    1732:	2200           	move.l d0,d1
    1734:	0681 0084 0000 	addi.l #8650752,d1
    173a:	2f41 0018      	move.l d1,24(sp)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    173e:	202f 001c      	move.l 28(sp),d0
    1742:	0280 0000 ffff 	andi.l #65535,d0
    1748:	2400           	move.l d0,d2
    174a:	0682 0086 0000 	addi.l #8781824,d2
    1750:	2f42 0014      	move.l d2,20(sp)
  //clpartinstruction = Cl102ZoomInit;
  *cl++ = cop2lch;
    1754:	202f 005c      	move.l 92(sp),d0
    1758:	2200           	move.l d0,d1
    175a:	5881           	addq.l #4,d1
    175c:	2f41 005c      	move.l d1,92(sp)
    1760:	2040           	movea.l d0,a0
    1762:	20af 0018      	move.l 24(sp),(a0)
  *cl++ = cop2lcl;
    1766:	202f 005c      	move.l 92(sp),d0
    176a:	2200           	move.l d0,d1
    176c:	5881           	addq.l #4,d1
    176e:	2f41 005c      	move.l d1,92(sp)
    1772:	2040           	movea.l d0,a0
    1774:	20af 0014      	move.l 20(sp),(a0)
  *cl++ = 0x2c01ff00;
    1778:	202f 005c      	move.l 92(sp),d0
    177c:	2200           	move.l d0,d1
    177e:	5881           	addq.l #4,d1
    1780:	2f41 005c      	move.l d1,92(sp)
    1784:	2040           	movea.l d0,a0
    1786:	20bc 2c01 ff00 	move.l #738328320,(a0)

  ULONG cop2br1 = cop2 + ( (30)<<2);
    178c:	7078           	moveq #120,d0
    178e:	d0af 001c      	add.l 28(sp),d0
    1792:	2f40 0010      	move.l d0,16(sp)
  ULONG cop2br2 = cop2 + ( (86)<<2);
    1796:	222f 001c      	move.l 28(sp),d1
    179a:	0681 0000 0158 	addi.l #344,d1
    17a0:	2f41 000c      	move.l d1,12(sp)
  clpartinstruction = Cl102ZoomRepeat;
    17a4:	2f7c 0000 a7a0 	move.l #42912,88(sp)
    17aa:	0058 
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    17ac:	202f 0010      	move.l 16(sp),d0
    17b0:	4240           	clr.w d0
    17b2:	4840           	swap d0
    17b4:	307c 0070      	movea.w #112,a0
    17b8:	d1ef 0058      	adda.l 88(sp),a0
    17bc:	0680 0084 0000 	addi.l #8650752,d0
    17c2:	2080           	move.l d0,(a0)
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    17c4:	202f 0010      	move.l 16(sp),d0
    17c8:	0280 0000 ffff 	andi.l #65535,d0
    17ce:	307c 0074      	movea.w #116,a0
    17d2:	d1ef 0058      	adda.l 88(sp),a0
    17d6:	0680 0086 0000 	addi.l #8781824,d0
    17dc:	2080           	move.l d0,(a0)
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    17de:	202f 000c      	move.l 12(sp),d0
    17e2:	4240           	clr.w d0
    17e4:	4840           	swap d0
    17e6:	206f 0058      	movea.l 88(sp),a0
    17ea:	41e8 0150      	lea 336(a0),a0
    17ee:	0680 0084 0000 	addi.l #8650752,d0
    17f4:	2080           	move.l d0,(a0)
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    17f6:	202f 000c      	move.l 12(sp),d0
    17fa:	0280 0000 ffff 	andi.l #65535,d0
    1800:	206f 0058      	movea.l 88(sp),a0
    1804:	41e8 0154      	lea 340(a0),a0
    1808:	0680 0086 0000 	addi.l #8781824,d0
    180e:	2080           	move.l d0,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    1810:	42af 0048      	clr.l 72(sp)
    1814:	6024           	bra.s 183a <ClbuildZoom+0x326>
    *cl++ = *clpartinstruction++;
    1816:	222f 0058      	move.l 88(sp),d1
    181a:	2401           	move.l d1,d2
    181c:	5882           	addq.l #4,d2
    181e:	2f42 0058      	move.l d2,88(sp)
    1822:	202f 005c      	move.l 92(sp),d0
    1826:	2400           	move.l d0,d2
    1828:	5882           	addq.l #4,d2
    182a:	2f42 005c      	move.l d2,92(sp)
    182e:	2041           	movea.l d1,a0
    1830:	2210           	move.l (a0),d1
    1832:	2040           	movea.l d0,a0
    1834:	2081           	move.l d1,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    1836:	52af 0048      	addq.l #1,72(sp)
    183a:	7071           	moveq #113,d0
    183c:	b0af 0048      	cmp.l 72(sp),d0
    1840:	6cd4           	bge.s 1816 <ClbuildZoom+0x302>

   *cl++ = 0xfffffffe;
    1842:	202f 005c      	move.l 92(sp),d0
    1846:	2200           	move.l d0,d1
    1848:	5881           	addq.l #4,d1
    184a:	2f41 005c      	move.l d1,92(sp)
    184e:	74fe           	moveq #-2,d2
    1850:	2040           	movea.l d0,a0
    1852:	2082           	move.l d2,(a0)

  return retval;
    1854:	202f 0038      	move.l 56(sp),d0
}
    1858:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    185c:	4fef 0054      	lea 84(sp),sp
    1860:	4e75           	rts

00001862 <PrepareDisplayZoom>:

 int PrepareDisplayZoom() {
    1862:	4fef ffb8      	lea -72(sp),sp
    1866:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildZoom();
    186a:	4eba fca8      	jsr 1514 <ClbuildZoom>(pc)
    186e:	23c0 004d 2ca4 	move.l d0,4d2ca4 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1874:	4eba fc9e      	jsr 1514 <ClbuildZoom>(pc)
    1878:	23c0 004d 2ca8 	move.l d0,4d2ca8 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    187e:	2f7c 0000 df20 	move.l #57120,80(sp)
    1884:	0050 
    1886:	7002           	moveq #2,d0
    1888:	2f40 004c      	move.l d0,76(sp)
    188c:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    1892:	2c40           	movea.l d0,a6
    1894:	202f 0050      	move.l 80(sp),d0
    1898:	222f 004c      	move.l 76(sp),d1
    189c:	4eae ff3a      	jsr -198(a6)
    18a0:	2f40 0048      	move.l d0,72(sp)
    18a4:	202f 0048      	move.l 72(sp),d0
    18a8:	23c0 004d 2c9c 	move.l d0,4d2c9c <Bitplane1>
  if(Bitplane1 == 0) {
    18ae:	2039 004d 2c9c 	move.l 4d2c9c <Bitplane1>,d0
    18b4:	6658           	bne.s 190e <PrepareDisplayZoom+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    18b6:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    18bc:	2c40           	movea.l d0,a6
    18be:	4eae ffc4      	jsr -60(a6)
    18c2:	2f40 0044      	move.l d0,68(sp)
    18c6:	202f 0044      	move.l 68(sp),d0
    18ca:	2f40 0040      	move.l d0,64(sp)
    18ce:	2f7c 0000 7d3d 	move.l #32061,60(sp)
    18d4:	003c 
    18d6:	7026           	moveq #38,d0
    18d8:	2f40 0038      	move.l d0,56(sp)
    18dc:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    18e2:	2c40           	movea.l d0,a6
    18e4:	222f 0040      	move.l 64(sp),d1
    18e8:	242f 003c      	move.l 60(sp),d2
    18ec:	262f 0038      	move.l 56(sp),d3
    18f0:	4eae ffd0      	jsr -48(a6)
    18f4:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    18f8:	7001           	moveq #1,d0
    18fa:	2f40 0030      	move.l d0,48(sp)
    18fe:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    1904:	2c40           	movea.l d0,a6
    1906:	222f 0030      	move.l 48(sp),d1
    190a:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    190e:	2039 004d 2c9c 	move.l 4d2c9c <Bitplane1>,d0
    1914:	23c0 004d 2cac 	move.l d0,4d2cac <DrawBuffer>
  DrawCopper = Copperlist1;
    191a:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    1920:	23c0 004d 2cb4 	move.l d0,4d2cb4 <DrawCopper>
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1926:	2f7c 0000 df20 	move.l #57120,44(sp)
    192c:	002c 
    192e:	7002           	moveq #2,d0
    1930:	2f40 0028      	move.l d0,40(sp)
    1934:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    193a:	2c40           	movea.l d0,a6
    193c:	202f 002c      	move.l 44(sp),d0
    1940:	222f 0028      	move.l 40(sp),d1
    1944:	4eae ff3a      	jsr -198(a6)
    1948:	2f40 0024      	move.l d0,36(sp)
    194c:	202f 0024      	move.l 36(sp),d0
    1950:	23c0 004d 2ca0 	move.l d0,4d2ca0 <Bitplane2>
  if(Bitplane2 == 0) {
    1956:	2039 004d 2ca0 	move.l 4d2ca0 <Bitplane2>,d0
    195c:	6658           	bne.s 19b6 <PrepareDisplayZoom+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    195e:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    1964:	2c40           	movea.l d0,a6
    1966:	4eae ffc4      	jsr -60(a6)
    196a:	2f40 0020      	move.l d0,32(sp)
    196e:	202f 0020      	move.l 32(sp),d0
    1972:	2f40 001c      	move.l d0,28(sp)
    1976:	2f7c 0000 7d64 	move.l #32100,24(sp)
    197c:	0018 
    197e:	7026           	moveq #38,d0
    1980:	2f40 0014      	move.l d0,20(sp)
    1984:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    198a:	2c40           	movea.l d0,a6
    198c:	222f 001c      	move.l 28(sp),d1
    1990:	242f 0018      	move.l 24(sp),d2
    1994:	262f 0014      	move.l 20(sp),d3
    1998:	4eae ffd0      	jsr -48(a6)
    199c:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    19a0:	7001           	moveq #1,d0
    19a2:	2f40 000c      	move.l d0,12(sp)
    19a6:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    19ac:	2c40           	movea.l d0,a6
    19ae:	222f 000c      	move.l 12(sp),d1
    19b2:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    19b6:	2039 004d 2ca0 	move.l 4d2ca0 <Bitplane2>,d0
    19bc:	23c0 004d 2cb0 	move.l d0,4d2cb0 <ViewBuffer>
  ViewCopper = Copperlist2; 
    19c2:	2039 004d 2ca8 	move.l 4d2ca8 <Copperlist2>,d0
    19c8:	23c0 004d 2cb8 	move.l d0,4d2cb8 <ViewCopper>
  return 0;
    19ce:	7000           	moveq #0,d0
}
    19d0:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    19d4:	4fef 0048      	lea 72(sp),sp
    19d8:	4e75           	rts

000019da <Init_Blit>:

void Init_Blit() {
  hw->bltafwm = 0xffff;
    19da:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    19e0:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    19e6:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    19ec:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    19f2:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    19f8:	317c 0026 0064 	move.w #38,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    19fe:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1a04:	317c 0026 0062 	move.w #38,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1a0a:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1a10:	317c 0026 0066 	move.w #38,102(a0)
}
    1a16:	4e75           	rts

00001a18 <Init_Blit2>:


void Init_Blit2() {
  hw->bltafwm = 0xffff;
    1a18:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1a1e:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1a24:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1a2a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = 36;
    1a30:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1a36:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = 76;
    1a3c:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1a42:	317c 004c 0062 	move.w #76,98(a0)
  hw->bltdmod = ZMLINESIZE2 - 4;
    1a48:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1a4e:	317c 0028 0066 	move.w #40,102(a0)
}
    1a54:	4e75           	rts

00001a56 <Init_ZoomBlit>:

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
    1a56:	4fef fff4      	lea -12(sp),sp
    1a5a:	206f 0010      	movea.l 16(sp),a0
    1a5e:	222f 0014      	move.l 20(sp),d1
    1a62:	202f 0018      	move.l 24(sp),d0
    1a66:	3048           	movea.w a0,a0
    1a68:	3f48 0004      	move.w a0,4(sp)
    1a6c:	3201           	move.w d1,d1
    1a6e:	3f41 0002      	move.w d1,2(sp)
    1a72:	3000           	move.w d0,d0
    1a74:	3e80           	move.w d0,(sp)
  ZoomBlit_Increment4SrcA = 0;
    1a76:	4279 004d 2cf2 	clr.w 4d2cf2 <ZoomBlit_Increment4SrcA>

  UWORD colnr = nextzoom - startofword - 1;                                                                          
    1a7c:	302f 0002      	move.w 2(sp),d0
    1a80:	906f 0004      	sub.w 4(sp),d0
    1a84:	3200           	move.w d0,d1
    1a86:	5341           	subq.w #1,d1
    1a88:	3f41 0008      	move.w d1,8(sp)
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
    1a8c:	3017           	move.w (sp),d0
    1a8e:	720c           	moveq #12,d1
    1a90:	e368           	lsl.w d1,d0
    1a92:	3f40 0006      	move.w d0,6(sp)
  UWORD shifta;
  if( shiftright == 0) {
    1a96:	4a57           	tst.w (sp)
    1a98:	6610           	bne.s 1aaa <Init_ZoomBlit+0x54>
    ZoomBlit_Increment4SrcA = 1;
    1a9a:	33fc 0001 004d 	move.w #1,4d2cf2 <ZoomBlit_Increment4SrcA>
    1aa0:	2cf2 
    shifta = 15 << 12;
    1aa2:	3f7c f000 000a 	move.w #-4096,10(sp)
    1aa8:	600c           	bra.s 1ab6 <Init_ZoomBlit+0x60>
  } else {
    shifta = (shiftright - 1) << 12;
    1aaa:	3017           	move.w (sp),d0
    1aac:	5340           	subq.w #1,d0
    1aae:	720c           	moveq #12,d1
    1ab0:	e368           	lsl.w d1,d0
    1ab2:	3f40 000a      	move.w d0,10(sp)
  }
  WaitBlt(); 
    1ab6:	4eba e5fc      	jsr b4 <WaitBlt>(pc)
  hw->bltcon1 = shiftb; 
    1aba:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1ac0:	316f 0006 0042 	move.w 6(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1ac6:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1acc:	302f 000a      	move.w 10(sp),d0
    1ad0:	0640 0de4      	addi.w #3556,d0
    1ad4:	3140 0040      	move.w d0,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1ad8:	7000           	moveq #0,d0
    1ada:	302f 0008      	move.w 8(sp),d0
    1ade:	7210           	moveq #16,d1
    1ae0:	9280           	sub.l d0,d1
    1ae2:	7000           	moveq #0,d0
    1ae4:	4640           	not.w d0
    1ae6:	e3a8           	lsl.l d1,d0
    1ae8:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1aee:	2000           	move.l d0,d0
    1af0:	3140 0070      	move.w d0,112(a0)
}
    1af4:	4fef 000c      	lea 12(sp),sp
    1af8:	4e75           	rts

00001afa <Init_Copy>:

void Init_Copy( WORD shift) {
    1afa:	598f           	subq.l #4,sp
    1afc:	202f 0008      	move.l 8(sp),d0
    1b00:	3000           	move.w d0,d0
    1b02:	3e80           	move.w d0,(sp)
  UWORD shiftright = shift << 12;
    1b04:	3017           	move.w (sp),d0
    1b06:	720c           	moveq #12,d1
    1b08:	e368           	lsl.w d1,d0
    1b0a:	3f40 0002      	move.w d0,2(sp)
  WaitBlt();
    1b0e:	4eba e5a4      	jsr b4 <WaitBlt>(pc)
  hw->bltcon0 = 0x9f0 + shiftright;
    1b12:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1b18:	302f 0002      	move.w 2(sp),d0
    1b1c:	0640 09f0      	addi.w #2544,d0
    1b20:	3140 0040      	move.w d0,64(a0)
  hw->bltcon1 = 0;
    1b24:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    1b2a:	317c 0000 0042 	move.w #0,66(a0)
}
    1b30:	588f           	addq.l #4,sp
    1b32:	4e75           	rts

00001b34 <Zoom_ZoomIntoPicture>:

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    1b34:	4fef ffcc      	lea -52(sp),sp
    1b38:	222f 0040      	move.l 64(sp),d1
    1b3c:	202f 0044      	move.l 68(sp),d0
    1b40:	3201           	move.w d1,d1
    1b42:	3f41 0002      	move.w d1,2(sp)
    1b46:	3000           	move.w d0,d0
    1b48:	3e80           	move.w d0,(sp)
  
  WaitBlt();  
    1b4a:	4eba e568      	jsr b4 <WaitBlt>(pc)
  Init_Blit();
    1b4e:	4eba fe8a      	jsr 19da <Init_Blit>(pc)
  WORD shiftright = 9;
    1b52:	3f7c 0009 0032 	move.w #9,50(sp)
  UWORD shifthoriz = 7;
    1b58:	3f7c 0007 0030 	move.w #7,48(sp)
  UWORD startofword = 21*16;
    1b5e:	3f7c 0150 002e 	move.w #336,46(sp)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1b64:	322f 0002      	move.w 2(sp),d1
    1b68:	3001           	move.w d1,d0
    1b6a:	d040           	add.w d0,d0
    1b6c:	d040           	add.w d0,d0
    1b6e:	d041           	add.w d1,d0
    1b70:	d040           	add.w d0,d0
    1b72:	0640 014c      	addi.w #332,d0
    1b76:	3f40 002c      	move.w d0,44(sp)
    1b7a:	601a           	bra.s 1b96 <Zoom_ZoomIntoPicture+0x62>
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    1b7c:	302f 002c      	move.w 44(sp),d0
    1b80:	906f 0002      	sub.w 2(sp),d0
    1b84:	0640 ffed      	addi.w #-19,d0
    1b88:	3f40 002c      	move.w d0,44(sp)
    shiftright--;
    1b8c:	302f 0032      	move.w 50(sp),d0
    1b90:	5340           	subq.w #1,d0
    1b92:	3f40 0032      	move.w d0,50(sp)
  while( nextzoom > 22 * 16) {
    1b96:	0c6f 0160 002c 	cmpi.w #352,44(sp)
    1b9c:	6ede           	bgt.s 1b7c <Zoom_ZoomIntoPicture+0x48>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
    1b9e:	426f 002a      	clr.w 42(sp)
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    1ba2:	322f 0002      	move.w 2(sp),d1
    1ba6:	3001           	move.w d1,d0
    1ba8:	d040           	add.w d0,d0
    1baa:	d040           	add.w d0,d0
    1bac:	d041           	add.w d1,d0
    1bae:	4440           	neg.w d0
    1bb0:	0640 0012      	addi.w #18,d0
    1bb4:	3f40 0028      	move.w d0,40(sp)
    1bb8:	601c           	bra.s 1bd6 <Zoom_ZoomIntoPicture+0xa2>
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    1bba:	302f 0028      	move.w 40(sp),d0
    1bbe:	d06f 0002      	add.w 2(sp),d0
    1bc2:	0640 0013      	addi.w #19,d0
    1bc6:	3f40 0028      	move.w d0,40(sp)
      shifthoriz--;
    1bca:	302f 0030      	move.w 48(sp),d0
    1bce:	3200           	move.w d0,d1
    1bd0:	5341           	subq.w #1,d1
    1bd2:	3f41 0030      	move.w d1,48(sp)
  while( ZoomHorizontalStart < 0) {
    1bd6:	4a6f 0028      	tst.w 40(sp)
    1bda:	6dde           	blt.s 1bba <Zoom_ZoomIntoPicture+0x86>
  } 

  for(int i=0;i<22;i++) {
    1bdc:	42af 0024      	clr.l 36(sp)
    1be0:	6000 02ca      	bra.w 1eac <Zoom_ZoomIntoPicture+0x378>

    ZoomHorizontal = ZoomHorizontalStart;
    1be4:	33ef 0028 004d 	move.w 40(sp),4d2d0e <ZoomHorizontal>
    1bea:	2d0e 

    WORD linesleft = 272;
    1bec:	3f7c 0110 0022 	move.w #272,34(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1bf2:	7000           	moveq #0,d0
    1bf4:	302f 0030      	move.w 48(sp),d0
    1bf8:	7200           	moveq #0,d1
    1bfa:	3217           	move.w (sp),d1
    1bfc:	2f01           	move.l d1,-(sp)
    1bfe:	2f00           	move.l d0,-(sp)
    1c00:	4eb9 0000 71a4 	jsr 71a4 <__mulsi3>
    1c06:	508f           	addq.l #8,sp
    1c08:	2200           	move.l d0,d1
    1c0a:	2001           	move.l d1,d0
    1c0c:	d080           	add.l d0,d0
    1c0e:	d081           	add.l d1,d0
    1c10:	2200           	move.l d0,d1
    1c12:	e789           	lsl.l #3,d1
    1c14:	9280           	sub.l d0,d1
    1c16:	202f 0024      	move.l 36(sp),d0
    1c1a:	9280           	sub.l d0,d1
    1c1c:	2001           	move.l d1,d0
    1c1e:	0680 8000 0013 	addi.l #-2147483629,d0
    1c24:	d080           	add.l d0,d0
    1c26:	222f 0038      	move.l 56(sp),d1
    1c2a:	d280           	add.l d0,d1
    1c2c:	2f41 001e      	move.l d1,30(sp)
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1c30:	202f 0024      	move.l 36(sp),d0
    1c34:	7213           	moveq #19,d1
    1c36:	9280           	sub.l d0,d1
    1c38:	2001           	move.l d1,d0
    1c3a:	d081           	add.l d1,d0
    1c3c:	222f 003c      	move.l 60(sp),d1
    1c40:	d280           	add.l d0,d1
    1c42:	2f41 001a      	move.l d1,26(sp)
    
    UWORD onestep = ZMLINESIZE/2*planes;
    1c46:	3017           	move.w (sp),d0
    1c48:	c1fc 0015      	muls.w #21,d0
    1c4c:	3f40 0018      	move.w d0,24(sp)
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1c50:	7000           	moveq #0,d0
    1c52:	302f 002e      	move.w 46(sp),d0
    1c56:	306f 002c      	movea.w 44(sp),a0
    1c5a:	b1c0           	cmpa.l d0,a0
    1c5c:	6e00 0106      	bgt.w 1d64 <Zoom_ZoomIntoPicture+0x230>
      Init_Copy( shiftright);
    1c60:	306f 0032      	movea.w 50(sp),a0
    1c64:	2f08           	move.l a0,-(sp)
    1c66:	4eba fe92      	jsr 1afa <Init_Copy>(pc)
    1c6a:	588f           	addq.l #4,sp
    1c6c:	6000 00ea      	bra.w 1d58 <Zoom_ZoomIntoPicture+0x224>
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1c70:	3039 004d 2d0e 	move.w 4d2d0e <ZoomHorizontal>,d0
    1c76:	b06f 0022      	cmp.w 34(sp),d0
    1c7a:	6c12           	bge.s 1c8e <Zoom_ZoomIntoPicture+0x15a>
          linesleft -= ZoomHorizontal;
    1c7c:	322f 0022      	move.w 34(sp),d1
    1c80:	3039 004d 2d0e 	move.w 4d2d0e <ZoomHorizontal>,d0
    1c86:	9240           	sub.w d0,d1
    1c88:	3f41 0022      	move.w d1,34(sp)
    1c8c:	600c           	bra.s 1c9a <Zoom_ZoomIntoPicture+0x166>
        } else {
          ZoomHorizontal = linesleft;
    1c8e:	33ef 0022 004d 	move.w 34(sp),4d2d0e <ZoomHorizontal>
    1c94:	2d0e 
          linesleft = 0;
    1c96:	426f 0022      	clr.w 34(sp)
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
    1c9a:	3039 004d 2d0e 	move.w 4d2d0e <ZoomHorizontal>,d0
    1ca0:	322f 0018      	move.w 24(sp),d1
    1ca4:	c3c0           	muls.w d0,d1
    1ca6:	3f41 000c      	move.w d1,12(sp)
        //Add aditional line
        if( linesleft>0) {
    1caa:	4a6f 0022      	tst.w 34(sp)
    1cae:	6f4c           	ble.s 1cfc <Zoom_ZoomIntoPicture+0x1c8>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1cb0:	7200           	moveq #0,d1
    1cb2:	322f 000c      	move.w 12(sp),d1
    1cb6:	7000           	moveq #0,d0
    1cb8:	302f 002a      	move.w 42(sp),d0
    1cbc:	d081           	add.l d1,d0
    1cbe:	d080           	add.l d0,d0
    1cc0:	222f 001e      	move.l 30(sp),d1
    1cc4:	d280           	add.l d0,d1
    1cc6:	2f41 0008      	move.l d1,8(sp)
          UWORD *tmpdest = pos4dest +  size4blit;
    1cca:	7000           	moveq #0,d0
    1ccc:	302f 000c      	move.w 12(sp),d0
    1cd0:	d080           	add.l d0,d0
    1cd2:	222f 001a      	move.l 26(sp),d1
    1cd6:	d280           	add.l d0,d1
    1cd8:	2f41 0004      	move.l d1,4(sp)
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
    1cdc:	7000           	moveq #0,d0
    1cde:	3017           	move.w (sp),d0
    1ce0:	2f00           	move.l d0,-(sp)
    1ce2:	2f2f 0008      	move.l 8(sp),-(sp)
    1ce6:	2f2f 0010      	move.l 16(sp),-(sp)
    1cea:	4eba f314      	jsr 1000 <Zoom_CopyWord>(pc)
    1cee:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1cf2:	302f 0022      	move.w 34(sp),d0
    1cf6:	5340           	subq.w #1,d0
    1cf8:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1cfc:	3039 004d 2d0e 	move.w 4d2d0e <ZoomHorizontal>,d0
    1d02:	c1d7           	muls.w (sp),d0
    1d04:	7200           	moveq #0,d1
    1d06:	3200           	move.w d0,d1
    1d08:	7000           	moveq #0,d0
    1d0a:	302f 002a      	move.w 42(sp),d0
    1d0e:	d080           	add.l d0,d0
    1d10:	d0af 001e      	add.l 30(sp),d0
    1d14:	2f01           	move.l d1,-(sp)
    1d16:	2f2f 001e      	move.l 30(sp),-(sp)
    1d1a:	2f00           	move.l d0,-(sp)
    1d1c:	4eba f2e2      	jsr 1000 <Zoom_CopyWord>(pc)
    1d20:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1d24:	7000           	moveq #0,d0
    1d26:	302f 000c      	move.w 12(sp),d0
    1d2a:	d080           	add.l d0,d0
    1d2c:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep; 
    1d30:	7200           	moveq #0,d1
    1d32:	322f 000c      	move.w 12(sp),d1
    1d36:	7000           	moveq #0,d0
    1d38:	302f 0018      	move.w 24(sp),d0
    1d3c:	d081           	add.l d1,d0
    1d3e:	d080           	add.l d0,d0
    1d40:	d1af 001a      	add.l d0,26(sp)
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1d44:	302f 0002      	move.w 2(sp),d0
    1d48:	d040           	add.w d0,d0
    1d4a:	906f 0002      	sub.w 2(sp),d0
    1d4e:	0640 0012      	addi.w #18,d0
    1d52:	33c0 004d 2d0e 	move.w d0,4d2d0e <ZoomHorizontal>
      while(linesleft > 0) {
    1d58:	4a6f 0022      	tst.w 34(sp)
    1d5c:	6e00 ff12      	bgt.w 1c70 <Zoom_ZoomIntoPicture+0x13c>
    1d60:	6000 0140      	bra.w 1ea2 <Zoom_ZoomIntoPicture+0x36e>
      }
    } else {  
      Init_ZoomBlit( startofword, nextzoom, shiftright);   
    1d64:	326f 0032      	movea.w 50(sp),a1
    1d68:	306f 002c      	movea.w 44(sp),a0
    1d6c:	7000           	moveq #0,d0
    1d6e:	302f 002e      	move.w 46(sp),d0
    1d72:	2f09           	move.l a1,-(sp)
    1d74:	2f08           	move.l a0,-(sp)
    1d76:	2f00           	move.l d0,-(sp)
    1d78:	4eba fcdc      	jsr 1a56 <Init_ZoomBlit>(pc)
    1d7c:	4fef 000c      	lea 12(sp),sp
      nextzoom -= (19 + zoomnr);
    1d80:	302f 002c      	move.w 44(sp),d0
    1d84:	906f 0002      	sub.w 2(sp),d0
    1d88:	0640 ffed      	addi.w #-19,d0
    1d8c:	3f40 002c      	move.w d0,44(sp)
    1d90:	6000 00ea      	bra.w 1e7c <Zoom_ZoomIntoPicture+0x348>
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1d94:	3039 004d 2d0e 	move.w 4d2d0e <ZoomHorizontal>,d0
    1d9a:	b06f 0022      	cmp.w 34(sp),d0
    1d9e:	6c12           	bge.s 1db2 <Zoom_ZoomIntoPicture+0x27e>
          linesleft -= ZoomHorizontal;
    1da0:	322f 0022      	move.w 34(sp),d1
    1da4:	3039 004d 2d0e 	move.w 4d2d0e <ZoomHorizontal>,d0
    1daa:	9240           	sub.w d0,d1
    1dac:	3f41 0022      	move.w d1,34(sp)
    1db0:	600c           	bra.s 1dbe <Zoom_ZoomIntoPicture+0x28a>
        } else {
          ZoomHorizontal = linesleft;
    1db2:	33ef 0022 004d 	move.w 34(sp),4d2d0e <ZoomHorizontal>
    1db8:	2d0e 
          linesleft = 0;
    1dba:	426f 0022      	clr.w 34(sp)
        }
        UWORD size4blit = ZoomHorizontal*onestep;
    1dbe:	3039 004d 2d0e 	move.w 4d2d0e <ZoomHorizontal>,d0
    1dc4:	322f 0018      	move.w 24(sp),d1
    1dc8:	c3c0           	muls.w d0,d1
    1dca:	3f41 0016      	move.w d1,22(sp)
        //Add aditional line
        if( linesleft>0) {
    1dce:	4a6f 0022      	tst.w 34(sp)
    1dd2:	6f4c           	ble.s 1e20 <Zoom_ZoomIntoPicture+0x2ec>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1dd4:	7200           	moveq #0,d1
    1dd6:	322f 0016      	move.w 22(sp),d1
    1dda:	7000           	moveq #0,d0
    1ddc:	302f 002a      	move.w 42(sp),d0
    1de0:	d081           	add.l d1,d0
    1de2:	d080           	add.l d0,d0
    1de4:	222f 001e      	move.l 30(sp),d1
    1de8:	d280           	add.l d0,d1
    1dea:	2f41 0012      	move.l d1,18(sp)
          UWORD *tmpdest = pos4dest + size4blit;
    1dee:	7000           	moveq #0,d0
    1df0:	302f 0016      	move.w 22(sp),d0
    1df4:	d080           	add.l d0,d0
    1df6:	222f 001a      	move.l 26(sp),d1
    1dfa:	d280           	add.l d0,d1
    1dfc:	2f41 000e      	move.l d1,14(sp)
          
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
    1e00:	7000           	moveq #0,d0
    1e02:	3017           	move.w (sp),d0
    1e04:	2f00           	move.l d0,-(sp)
    1e06:	2f2f 0012      	move.l 18(sp),-(sp)
    1e0a:	2f2f 001a      	move.l 26(sp),-(sp)
    1e0e:	4eba f22e      	jsr 103e <Zoom_ZoomBlit>(pc)
    1e12:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1e16:	302f 0022      	move.w 34(sp),d0
    1e1a:	5340           	subq.w #1,d0
    1e1c:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1e20:	3039 004d 2d0e 	move.w 4d2d0e <ZoomHorizontal>,d0
    1e26:	c1d7           	muls.w (sp),d0
    1e28:	7200           	moveq #0,d1
    1e2a:	3200           	move.w d0,d1
    1e2c:	7000           	moveq #0,d0
    1e2e:	302f 002a      	move.w 42(sp),d0
    1e32:	d080           	add.l d0,d0
    1e34:	d0af 001e      	add.l 30(sp),d0
    1e38:	2f01           	move.l d1,-(sp)
    1e3a:	2f2f 001e      	move.l 30(sp),-(sp)
    1e3e:	2f00           	move.l d0,-(sp)
    1e40:	4eba f1fc      	jsr 103e <Zoom_ZoomBlit>(pc)
    1e44:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1e48:	7000           	moveq #0,d0
    1e4a:	302f 0016      	move.w 22(sp),d0
    1e4e:	d080           	add.l d0,d0
    1e50:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep;   
    1e54:	7200           	moveq #0,d1
    1e56:	322f 0016      	move.w 22(sp),d1
    1e5a:	7000           	moveq #0,d0
    1e5c:	302f 0018      	move.w 24(sp),d0
    1e60:	d081           	add.l d1,d0
    1e62:	d080           	add.l d0,d0
    1e64:	d1af 001a      	add.l d0,26(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1e68:	302f 0002      	move.w 2(sp),d0
    1e6c:	d040           	add.w d0,d0
    1e6e:	906f 0002      	sub.w 2(sp),d0
    1e72:	0640 0012      	addi.w #18,d0
    1e76:	33c0 004d 2d0e 	move.w d0,4d2d0e <ZoomHorizontal>
      while( linesleft > 0) {
    1e7c:	4a6f 0022      	tst.w 34(sp)
    1e80:	6e00 ff12      	bgt.w 1d94 <Zoom_ZoomIntoPicture+0x260>
      }
      shiftright--;  
    1e84:	302f 0032      	move.w 50(sp),d0
    1e88:	5340           	subq.w #1,d0
    1e8a:	3f40 0032      	move.w d0,50(sp)
      if(shiftright < 0) {
    1e8e:	6a12           	bpl.s 1ea2 <Zoom_ZoomIntoPicture+0x36e>
        shiftright += 16;
    1e90:	302f 0032      	move.w 50(sp),d0
    1e94:	0640 0010      	addi.w #16,d0
    1e98:	3f40 0032      	move.w d0,50(sp)
        shifttoleft = 1;
    1e9c:	3f7c 0001 002a 	move.w #1,42(sp)
      }
    }
    startofword -= 16;
    1ea2:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    1ea8:	52af 0024      	addq.l #1,36(sp)
    1eac:	7015           	moveq #21,d0
    1eae:	b0af 0024      	cmp.l 36(sp),d0
    1eb2:	6c00 fd30      	bge.w 1be4 <Zoom_ZoomIntoPicture+0xb0>
  }
}
    1eb6:	4fef 0034      	lea 52(sp),sp
    1eba:	4e75           	rts

00001ebc <Zoom_SetBplPointers>:

void Zoom_SetBplPointers( UWORD *buffer, ULONG *copper) {
    1ebc:	4fef ffb0      	lea -80(sp),sp
  //                   0  1  1   1   1   0   1   1    1    1    0    1    1    0    1    1
  //int zoomoffset[] = { 0, 0, 42, 42, 84, 84, 84, 126, 126, 168, 168, 168, 210, 210, 210, 332};
  //int zoomoffset[] = { 252, 210, 210, 210, 168, 168, 168, 126, 126, 84, 84, 84, 42, 42, 0, 0 };
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
    1ec0:	204f           	movea.l sp,a0
    1ec2:	223c 0000 7dc0 	move.l #32192,d1
    1ec8:	7040           	moveq #64,d0
    1eca:	2f00           	move.l d0,-(sp)
    1ecc:	2f01           	move.l d1,-(sp)
    1ece:	2f08           	move.l a0,-(sp)
    1ed0:	4eba 4f74      	jsr 6e46 <memcpy>(pc)
    1ed4:	4fef 000c      	lea 12(sp),sp

  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
    1ed8:	3039 004d 2d0a 	move.w 4d2d0a <Zoom_LevelOf102Zoom>,d0
    1ede:	3000           	move.w d0,d0
    1ee0:	0280 0000 ffff 	andi.l #65535,d0
    1ee6:	d080           	add.l d0,d0
    1ee8:	d080           	add.l d0,d0
    1eea:	41ef 0050      	lea 80(sp),a0
    1eee:	d1c0           	adda.l d0,a0
    1ef0:	41e8 ffb0      	lea -80(a0),a0
    1ef4:	2010           	move.l (a0),d0
    1ef6:	d080           	add.l d0,d0
    1ef8:	d0af 0054      	add.l 84(sp),d0
    1efc:	2f40 004c      	move.l d0,76(sp)
  /*ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;*/
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
    1f00:	7072           	moveq #114,d0
    1f02:	d0af 0058      	add.l 88(sp),d0
    1f06:	2f40 0048      	move.l d0,72(sp)
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1f0a:	42af 0044      	clr.l 68(sp)
    1f0e:	6036           	bra.s 1f46 <Zoom_SetBplPointers+0x8a>
    UWORD highword = (ULONG)plane2set >> 16;
    1f10:	202f 004c      	move.l 76(sp),d0
    1f14:	4240           	clr.w d0
    1f16:	4840           	swap d0
    1f18:	3f40 0042      	move.w d0,66(sp)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1f1c:	3f6f 004e 0040 	move.w 78(sp),64(sp)
    *posofcopper = highword;
    1f22:	206f 0048      	movea.l 72(sp),a0
    1f26:	30af 0042      	move.w 66(sp),(a0)
    posofcopper += 2;
    1f2a:	58af 0048      	addq.l #4,72(sp)
    *posofcopper = lowword;
    1f2e:	206f 0048      	movea.l 72(sp),a0
    1f32:	30af 0040      	move.w 64(sp),(a0)
    posofcopper += 2;
    1f36:	58af 0048      	addq.l #4,72(sp)
    plane2set += 42*268; //Next plane
    1f3a:	06af 0000 2bf8 	addi.l #11256,76(sp)
    1f40:	004c 
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1f42:	52af 0044      	addq.l #1,68(sp)
    1f46:	7004           	moveq #4,d0
    1f48:	b0af 0044      	cmp.l 68(sp),d0
    1f4c:	6cc2           	bge.s 1f10 <Zoom_SetBplPointers+0x54>
  }
  
}
    1f4e:	4fef 0050      	lea 80(sp),sp
    1f52:	4e75           	rts

00001f54 <Zoom_SwapBuffers>:

void Zoom_SwapBuffers( UWORD zoomlevel) {
    1f54:	518f           	subq.l #8,sp
    1f56:	202f 000c      	move.l 12(sp),d0
    1f5a:	3000           	move.w d0,d0
    1f5c:	3f40 0002      	move.w d0,2(sp)
  //ViewBuffer = rawzoom + (42*268*5*zoomlevel);
  ULONG tmp = (ULONG) DrawBuffer;
    1f60:	2039 004d 2cac 	move.l 4d2cac <DrawBuffer>,d0
    1f66:	2f40 0004      	move.l d0,4(sp)
  DrawBuffer = ViewBuffer;
    1f6a:	2039 004d 2cb0 	move.l 4d2cb0 <ViewBuffer>,d0
    1f70:	23c0 004d 2cac 	move.l d0,4d2cac <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
    1f76:	202f 0004      	move.l 4(sp),d0
    1f7a:	23c0 004d 2cb0 	move.l d0,4d2cb0 <ViewBuffer>
}
    1f80:	508f           	addq.l #8,sp
    1f82:	4e75           	rts

00001f84 <Test_Zoom2>:
#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
    1f84:	4fef ff00      	lea -256(sp),sp
    1f88:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  //Test Zoomlevel 1
  volatile ULONG *srcsmall = AllocMem( 80, MEMF_CHIP);
    1f8c:	7050           	moveq #80,d0
    1f8e:	2f40 00f0      	move.l d0,240(sp)
    1f92:	7002           	moveq #2,d0
    1f94:	2f40 00ec      	move.l d0,236(sp)
    1f98:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    1f9e:	2c40           	movea.l d0,a6
    1fa0:	202f 00f0      	move.l 240(sp),d0
    1fa4:	222f 00ec      	move.l 236(sp),d1
    1fa8:	4eae ff3a      	jsr -198(a6)
    1fac:	2f40 00e8      	move.l d0,232(sp)
    1fb0:	202f 00e8      	move.l 232(sp),d0
    1fb4:	2f40 00e4      	move.l d0,228(sp)
  if( srcsmall == 0) {
    1fb8:	6646           	bne.s 2000 <Test_Zoom2+0x7c>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcsmall\n", 42);
    1fba:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    1fc0:	2c40           	movea.l d0,a6
    1fc2:	4eae ffc4      	jsr -60(a6)
    1fc6:	2f40 001c      	move.l d0,28(sp)
    1fca:	202f 001c      	move.l 28(sp),d0
    1fce:	2f40 0018      	move.l d0,24(sp)
    1fd2:	2f7c 0000 7e00 	move.l #32256,20(sp)
    1fd8:	0014 
    1fda:	702a           	moveq #42,d0
    1fdc:	2f40 0010      	move.l d0,16(sp)
    1fe0:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    1fe6:	2c40           	movea.l d0,a6
    1fe8:	222f 0018      	move.l 24(sp),d1
    1fec:	242f 0014      	move.l 20(sp),d2
    1ff0:	262f 0010      	move.l 16(sp),d3
    1ff4:	4eae ffd0      	jsr -48(a6)
    1ff8:	2f40 000c      	move.l d0,12(sp)
    1ffc:	6000 0560      	bra.w 255e <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong(srcsmall, 0xaaaaaaaa, 2, 10, 0);
    2000:	42a7           	clr.l -(sp)
    2002:	4878 000a      	pea a <_start+0xa>
    2006:	4878 0002      	pea 2 <_start+0x2>
    200a:	2f3c aaaa aaaa 	move.l #-1431655766,-(sp)
    2010:	2f2f 00f4      	move.l 244(sp),-(sp)
    2014:	4eba e206      	jsr 21c <Utils_FillLong>(pc)
    2018:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *srcbig = AllocMem( 160, MEMF_CHIP);
    201c:	2f7c 0000 00a0 	move.l #160,224(sp)
    2022:	00e0 
    2024:	7002           	moveq #2,d0
    2026:	2f40 00dc      	move.l d0,220(sp)
    202a:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    2030:	2c40           	movea.l d0,a6
    2032:	202f 00e0      	move.l 224(sp),d0
    2036:	222f 00dc      	move.l 220(sp),d1
    203a:	4eae ff3a      	jsr -198(a6)
    203e:	2f40 00d8      	move.l d0,216(sp)
    2042:	202f 00d8      	move.l 216(sp),d0
    2046:	2f40 00d4      	move.l d0,212(sp)
    if( srcbig == 0) {
    204a:	6646           	bne.s 2092 <Test_Zoom2+0x10e>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcbig\n", 40);
    204c:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2052:	2c40           	movea.l d0,a6
    2054:	4eae ffc4      	jsr -60(a6)
    2058:	2f40 0030      	move.l d0,48(sp)
    205c:	202f 0030      	move.l 48(sp),d0
    2060:	2f40 002c      	move.l d0,44(sp)
    2064:	2f7c 0000 7e2b 	move.l #32299,40(sp)
    206a:	0028 
    206c:	7028           	moveq #40,d0
    206e:	2f40 0024      	move.l d0,36(sp)
    2072:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2078:	2c40           	movea.l d0,a6
    207a:	222f 002c      	move.l 44(sp),d1
    207e:	242f 0028      	move.l 40(sp),d2
    2082:	262f 0024      	move.l 36(sp),d3
    2086:	4eae ffd0      	jsr -48(a6)
    208a:	2f40 0020      	move.l d0,32(sp)
    208e:	6000 04ce      	bra.w 255e <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong( srcbig, 0x55555555, 2, 20, 0);
    2092:	42a7           	clr.l -(sp)
    2094:	4878 0014      	pea 14 <_start+0x14>
    2098:	4878 0002      	pea 2 <_start+0x2>
    209c:	2f3c 5555 5555 	move.l #1431655765,-(sp)
    20a2:	2f2f 00e4      	move.l 228(sp),-(sp)
    20a6:	4eba e174      	jsr 21c <Utils_FillLong>(pc)
    20aa:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *target = AllocMem( 168, MEMF_CHIP);
    20ae:	2f7c 0000 00a8 	move.l #168,208(sp)
    20b4:	00d0 
    20b6:	7002           	moveq #2,d0
    20b8:	2f40 00cc      	move.l d0,204(sp)
    20bc:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    20c2:	2c40           	movea.l d0,a6
    20c4:	202f 00d0      	move.l 208(sp),d0
    20c8:	222f 00cc      	move.l 204(sp),d1
    20cc:	4eae ff3a      	jsr -198(a6)
    20d0:	2f40 00c8      	move.l d0,200(sp)
    20d4:	202f 00c8      	move.l 200(sp),d0
    20d8:	2f40 00c4      	move.l d0,196(sp)
  if( target == 0) {
    20dc:	6646           	bne.s 2124 <Test_Zoom2+0x1a0>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
    20de:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    20e4:	2c40           	movea.l d0,a6
    20e6:	4eae ffc4      	jsr -60(a6)
    20ea:	2f40 0044      	move.l d0,68(sp)
    20ee:	202f 0044      	move.l 68(sp),d0
    20f2:	2f40 0040      	move.l d0,64(sp)
    20f6:	2f7c 0000 7e54 	move.l #32340,60(sp)
    20fc:	003c 
    20fe:	7028           	moveq #40,d0
    2100:	2f40 0038      	move.l d0,56(sp)
    2104:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    210a:	2c40           	movea.l d0,a6
    210c:	222f 0040      	move.l 64(sp),d1
    2110:	242f 003c      	move.l 60(sp),d2
    2114:	262f 0038      	move.l 56(sp),d3
    2118:	4eae ffd0      	jsr -48(a6)
    211c:	2f40 0034      	move.l d0,52(sp)
    2120:	6000 043c      	bra.w 255e <Test_Zoom2+0x5da>
    return;
  }
  WaitBlt();
    2124:	4eba df8e      	jsr b4 <WaitBlt>(pc)
  hw->bltafwm = 0xffff;
    2128:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    212e:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2134:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    213a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltdmod = 38;
    2140:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    2146:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcon1 = 1 << 12; //Shift src big
    214c:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    2152:	317c 1000 0042 	move.w #4096,66(a0)
  hw->bltcon0 = 0xde4; //Chanell settings and Shift src small
    2158:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    215e:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltcdat = 0x8000; //Show channel small if 1 else channel big
    2164:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    216a:	317c 8000 0070 	move.w #-32768,112(a0)
  //srcbig-shift   0010 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sbbb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2170:	4878 0001      	pea 1 <_start+0x1>
    2174:	4878 004e      	pea 4e <_start+0x4e>
    2178:	4878 0026      	pea 26 <_start+0x26>
    217c:	4878 0002      	pea 2 <_start+0x2>
    2180:	2f2f 00d4      	move.l 212(sp),-(sp)
    2184:	2f2f 00e8      	move.l 232(sp),-(sp)
    2188:	2f2f 00fc      	move.l 252(sp),-(sp)
    218c:	4eba ef14      	jsr 10a2 <Zoom_ZoomBlit2>(pc)
    2190:	4fef 001c      	lea 28(sp),sp
  UWORD *tmp = (UWORD *)target;
    2194:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    219a:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    21a0:	2c40           	movea.l d0,a6
    21a2:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    21a6:	42af 0104      	clr.l 260(sp)
    21aa:	605c           	bra.s 2208 <Test_Zoom2+0x284>
    if( *tmp != 0xaaaa ) {
    21ac:	206f 0108      	movea.l 264(sp),a0
    21b0:	3010           	move.w (a0),d0
    21b2:	0c40 aaaa      	cmpi.w #-21846,d0
    21b6:	6746           	beq.s 21fe <Test_Zoom2+0x27a>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 1 failed\n", 40);
    21b8:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    21be:	2c40           	movea.l d0,a6
    21c0:	4eae ffc4      	jsr -60(a6)
    21c4:	2f40 0058      	move.l d0,88(sp)
    21c8:	202f 0058      	move.l 88(sp),d0
    21cc:	2f40 0054      	move.l d0,84(sp)
    21d0:	2f7c 0000 7e7d 	move.l #32381,80(sp)
    21d6:	0050 
    21d8:	7028           	moveq #40,d0
    21da:	2f40 004c      	move.l d0,76(sp)
    21de:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    21e4:	2c40           	movea.l d0,a6
    21e6:	222f 0054      	move.l 84(sp),d1
    21ea:	242f 0050      	move.l 80(sp),d2
    21ee:	262f 004c      	move.l 76(sp),d3
    21f2:	4eae ffd0      	jsr -48(a6)
    21f6:	2f40 0048      	move.l d0,72(sp)
    21fa:	6000 0362      	bra.w 255e <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    21fe:	7028           	moveq #40,d0
    2200:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2204:	52af 0104      	addq.l #1,260(sp)
    2208:	7001           	moveq #1,d0
    220a:	b0af 0104      	cmp.l 260(sp),d0
    220e:	6c9c           	bge.s 21ac <Test_Zoom2+0x228>
  //srcbig-shift   0001 0101 0101 0101
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       ssbb bbbb bbbb bbbb
  //result:        1001 0101 0101 0101

  hw->bltcon1 = 2 << 12; //Shift src big
    2210:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    2216:	317c 2000 0042 	move.w #8192,66(a0)
  hw->bltcdat = 0xc000; //Show channel small if 1 else channel big
    221c:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    2222:	317c c000 0070 	move.w #-16384,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2228:	4878 0001      	pea 1 <_start+0x1>
    222c:	4878 004e      	pea 4e <_start+0x4e>
    2230:	4878 0026      	pea 26 <_start+0x26>
    2234:	4878 0002      	pea 2 <_start+0x2>
    2238:	2f2f 00d4      	move.l 212(sp),-(sp)
    223c:	2f2f 00e8      	move.l 232(sp),-(sp)
    2240:	2f2f 00fc      	move.l 252(sp),-(sp)
    2244:	4eba ee5c      	jsr 10a2 <Zoom_ZoomBlit2>(pc)
    2248:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    224c:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2252:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    2258:	2c40           	movea.l d0,a6
    225a:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    225e:	42af 0100      	clr.l 256(sp)
    2262:	605c           	bra.s 22c0 <Test_Zoom2+0x33c>
    if( *tmp != 0x9555 ) {
    2264:	206f 0108      	movea.l 264(sp),a0
    2268:	3010           	move.w (a0),d0
    226a:	0c40 9555      	cmpi.w #-27307,d0
    226e:	6746           	beq.s 22b6 <Test_Zoom2+0x332>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 2 failed\n", 40);
    2270:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2276:	2c40           	movea.l d0,a6
    2278:	4eae ffc4      	jsr -60(a6)
    227c:	2f40 006c      	move.l d0,108(sp)
    2280:	202f 006c      	move.l 108(sp),d0
    2284:	2f40 0068      	move.l d0,104(sp)
    2288:	2f7c 0000 7ea6 	move.l #32422,100(sp)
    228e:	0064 
    2290:	7028           	moveq #40,d0
    2292:	2f40 0060      	move.l d0,96(sp)
    2296:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    229c:	2c40           	movea.l d0,a6
    229e:	222f 0068      	move.l 104(sp),d1
    22a2:	242f 0064      	move.l 100(sp),d2
    22a6:	262f 0060      	move.l 96(sp),d3
    22aa:	4eae ffd0      	jsr -48(a6)
    22ae:	2f40 005c      	move.l d0,92(sp)
    22b2:	6000 02aa      	bra.w 255e <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    22b6:	7028           	moveq #40,d0
    22b8:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    22bc:	52af 0100      	addq.l #1,256(sp)
    22c0:	7001           	moveq #1,d0
    22c2:	b0af 0100      	cmp.l 256(sp),d0
    22c6:	6c9c           	bge.s 2264 <Test_Zoom2+0x2e0>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    22c8:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    22ce:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    22d4:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    22da:	317c e000 0070 	move.w #-8192,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    22e0:	4878 0001      	pea 1 <_start+0x1>
    22e4:	4878 004e      	pea 4e <_start+0x4e>
    22e8:	4878 0026      	pea 26 <_start+0x26>
    22ec:	4878 0002      	pea 2 <_start+0x2>
    22f0:	2f2f 00d4      	move.l 212(sp),-(sp)
    22f4:	2f2f 00e8      	move.l 232(sp),-(sp)
    22f8:	2f2f 00fc      	move.l 252(sp),-(sp)
    22fc:	4eba eda4      	jsr 10a2 <Zoom_ZoomBlit2>(pc)
    2300:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2304:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    230a:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    2310:	2c40           	movea.l d0,a6
    2312:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2316:	42af 00fc      	clr.l 252(sp)
    231a:	605c           	bra.s 2378 <Test_Zoom2+0x3f4>
    if( *tmp != 0xaaaa ) {
    231c:	206f 0108      	movea.l 264(sp),a0
    2320:	3010           	move.w (a0),d0
    2322:	0c40 aaaa      	cmpi.w #-21846,d0
    2326:	6746           	beq.s 236e <Test_Zoom2+0x3ea>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    2328:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    232e:	2c40           	movea.l d0,a6
    2330:	4eae ffc4      	jsr -60(a6)
    2334:	2f40 0080      	move.l d0,128(sp)
    2338:	202f 0080      	move.l 128(sp),d0
    233c:	2f40 007c      	move.l d0,124(sp)
    2340:	2f7c 0000 7ecf 	move.l #32463,120(sp)
    2346:	0078 
    2348:	7028           	moveq #40,d0
    234a:	2f40 0074      	move.l d0,116(sp)
    234e:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2354:	2c40           	movea.l d0,a6
    2356:	222f 007c      	move.l 124(sp),d1
    235a:	242f 0078      	move.l 120(sp),d2
    235e:	262f 0074      	move.l 116(sp),d3
    2362:	4eae ffd0      	jsr -48(a6)
    2366:	2f40 0070      	move.l d0,112(sp)
    236a:	6000 01f2      	bra.w 255e <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    236e:	7028           	moveq #40,d0
    2370:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2374:	52af 00fc      	addq.l #1,252(sp)
    2378:	7001           	moveq #1,d0
    237a:	b0af 00fc      	cmp.l 252(sp),d0
    237e:	6c9c           	bge.s 231c <Test_Zoom2+0x398>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2380:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    2386:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    238c:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    2392:	317c e000 0070 	move.w #-8192,112(a0)

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2398:	4878 0001      	pea 1 <_start+0x1>
    239c:	4878 004e      	pea 4e <_start+0x4e>
    23a0:	4878 0026      	pea 26 <_start+0x26>
    23a4:	4878 0002      	pea 2 <_start+0x2>
    23a8:	2f2f 00d4      	move.l 212(sp),-(sp)
    23ac:	2f2f 00e8      	move.l 232(sp),-(sp)
    23b0:	2f2f 00fc      	move.l 252(sp),-(sp)
    23b4:	4eba ecec      	jsr 10a2 <Zoom_ZoomBlit2>(pc)
    23b8:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    23bc:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    23c2:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    23c8:	2c40           	movea.l d0,a6
    23ca:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    23ce:	42af 00f8      	clr.l 248(sp)
    23d2:	605c           	bra.s 2430 <Test_Zoom2+0x4ac>
    if( *tmp != 0xaaaa ) {
    23d4:	206f 0108      	movea.l 264(sp),a0
    23d8:	3010           	move.w (a0),d0
    23da:	0c40 aaaa      	cmpi.w #-21846,d0
    23de:	6746           	beq.s 2426 <Test_Zoom2+0x4a2>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    23e0:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    23e6:	2c40           	movea.l d0,a6
    23e8:	4eae ffc4      	jsr -60(a6)
    23ec:	2f40 0094      	move.l d0,148(sp)
    23f0:	202f 0094      	move.l 148(sp),d0
    23f4:	2f40 0090      	move.l d0,144(sp)
    23f8:	2f7c 0000 7ecf 	move.l #32463,140(sp)
    23fe:	008c 
    2400:	7028           	moveq #40,d0
    2402:	2f40 0088      	move.l d0,136(sp)
    2406:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    240c:	2c40           	movea.l d0,a6
    240e:	222f 0090      	move.l 144(sp),d1
    2412:	242f 008c      	move.l 140(sp),d2
    2416:	262f 0088      	move.l 136(sp),d3
    241a:	4eae ffd0      	jsr -48(a6)
    241e:	2f40 0084      	move.l d0,132(sp)
    2422:	6000 013a      	bra.w 255e <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    2426:	7028           	moveq #40,d0
    2428:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    242c:	52af 00f8      	addq.l #1,248(sp)
    2430:	7001           	moveq #1,d0
    2432:	b0af 00f8      	cmp.l 248(sp),d0
    2436:	6c9c           	bge.s 23d4 <Test_Zoom2+0x450>
  //srcsmall:            1010 1010 1010 1010
  //srcsmall-shift:      0101 0101 0101 0101
  //pattern:             sssb bbbb bbbb bbbb
  //result:              0100 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2438:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    243e:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    2444:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    244a:	317c e000 0070 	move.w #-8192,112(a0)
  hw->bltcon0 = 0xde4 + (1 << 12); //Chanell settings and Shift src small
    2450:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    2456:	317c 1de4 0040 	move.w #7652,64(a0)
 
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    245c:	4878 0001      	pea 1 <_start+0x1>
    2460:	4878 004e      	pea 4e <_start+0x4e>
    2464:	4878 0026      	pea 26 <_start+0x26>
    2468:	4878 0002      	pea 2 <_start+0x2>
    246c:	2f2f 00d4      	move.l 212(sp),-(sp)
    2470:	2f2f 00e8      	move.l 232(sp),-(sp)
    2474:	2f2f 00fc      	move.l 252(sp),-(sp)
    2478:	4eba ec28      	jsr 10a2 <Zoom_ZoomBlit2>(pc)
    247c:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2480:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2486:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    248c:	2c40           	movea.l d0,a6
    248e:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2492:	42af 00f4      	clr.l 244(sp)
    2496:	605a           	bra.s 24f2 <Test_Zoom2+0x56e>
    if( *tmp != 0x4aaa ) {
    2498:	206f 0108      	movea.l 264(sp),a0
    249c:	3010           	move.w (a0),d0
    249e:	0c40 4aaa      	cmpi.w #19114,d0
    24a2:	6744           	beq.s 24e8 <Test_Zoom2+0x564>
      Write( Output(), "Test_Zoom2: Test for shifting a failed\n", 39);
    24a4:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    24aa:	2c40           	movea.l d0,a6
    24ac:	4eae ffc4      	jsr -60(a6)
    24b0:	2f40 00a8      	move.l d0,168(sp)
    24b4:	202f 00a8      	move.l 168(sp),d0
    24b8:	2f40 00a4      	move.l d0,164(sp)
    24bc:	2f7c 0000 7ef8 	move.l #32504,160(sp)
    24c2:	00a0 
    24c4:	7027           	moveq #39,d0
    24c6:	2f40 009c      	move.l d0,156(sp)
    24ca:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    24d0:	2c40           	movea.l d0,a6
    24d2:	222f 00a4      	move.l 164(sp),d1
    24d6:	242f 00a0      	move.l 160(sp),d2
    24da:	262f 009c      	move.l 156(sp),d3
    24de:	4eae ffd0      	jsr -48(a6)
    24e2:	2f40 0098      	move.l d0,152(sp)
    24e6:	6076           	bra.s 255e <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    24e8:	7028           	moveq #40,d0
    24ea:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    24ee:	52af 00f4      	addq.l #1,244(sp)
    24f2:	7001           	moveq #1,d0
    24f4:	b0af 00f4      	cmp.l 244(sp),d0
    24f8:	6c9e           	bge.s 2498 <Test_Zoom2+0x514>

  FreeMem( srcsmall, 80);
    24fa:	2f6f 00e4 00c0 	move.l 228(sp),192(sp)
    2500:	7050           	moveq #80,d0
    2502:	2f40 00bc      	move.l d0,188(sp)
    2506:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    250c:	2c40           	movea.l d0,a6
    250e:	226f 00c0      	movea.l 192(sp),a1
    2512:	202f 00bc      	move.l 188(sp),d0
    2516:	4eae ff2e      	jsr -210(a6)
  FreeMem( srcbig, 160);
    251a:	2f6f 00d4 00b8 	move.l 212(sp),184(sp)
    2520:	2f7c 0000 00a0 	move.l #160,180(sp)
    2526:	00b4 
    2528:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    252e:	2c40           	movea.l d0,a6
    2530:	226f 00b8      	movea.l 184(sp),a1
    2534:	202f 00b4      	move.l 180(sp),d0
    2538:	4eae ff2e      	jsr -210(a6)
  FreeMem( target, 168);
    253c:	2f6f 00c4 00b0 	move.l 196(sp),176(sp)
    2542:	2f7c 0000 00a8 	move.l #168,172(sp)
    2548:	00ac 
    254a:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    2550:	2c40           	movea.l d0,a6
    2552:	226f 00b0      	movea.l 176(sp),a1
    2556:	202f 00ac      	move.l 172(sp),d0
    255a:	4eae ff2e      	jsr -210(a6)
    255e:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2562:	4fef 0100      	lea 256(sp),sp
    2566:	4e75           	rts

00002568 <ClBuild>:
#include "utils.h"




ULONG * ClBuild() {
    2568:	4fef ffc4      	lea -60(sp),sp
    256c:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
    2570:	2f7c 0000 0084 	move.l #132,48(sp)
    2576:	0030 
    2578:	7002           	moveq #2,d0
    257a:	2f40 002c      	move.l d0,44(sp)
    257e:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    2584:	2c40           	movea.l d0,a6
    2586:	202f 0030      	move.l 48(sp),d0
    258a:	222f 002c      	move.l 44(sp),d1
    258e:	4eae ff3a      	jsr -198(a6)
    2592:	2f40 0028      	move.l d0,40(sp)
    2596:	202f 0028      	move.l 40(sp),d0
    259a:	2f40 0024      	move.l d0,36(sp)
  if( retval == 0) {
    259e:	6658           	bne.s 25f8 <ClBuild+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    25a0:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    25a6:	2c40           	movea.l d0,a6
    25a8:	4eae ffc4      	jsr -60(a6)
    25ac:	2f40 0020      	move.l d0,32(sp)
    25b0:	202f 0020      	move.l 32(sp),d0
    25b4:	2f40 001c      	move.l d0,28(sp)
    25b8:	2f7c 0000 7d8b 	move.l #32139,24(sp)
    25be:	0018 
    25c0:	7228           	moveq #40,d1
    25c2:	2f41 0014      	move.l d1,20(sp)
    25c6:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    25cc:	2c40           	movea.l d0,a6
    25ce:	222f 001c      	move.l 28(sp),d1
    25d2:	242f 0018      	move.l 24(sp),d2
    25d6:	262f 0014      	move.l 20(sp),d3
    25da:	4eae ffd0      	jsr -48(a6)
    25de:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    25e2:	7401           	moveq #1,d2
    25e4:	2f42 000c      	move.l d2,12(sp)
    25e8:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    25ee:	2c40           	movea.l d0,a6
    25f0:	222f 000c      	move.l 12(sp),d1
    25f4:	4eae ff70      	jsr -144(a6)
  }
    
  ULONG *cl = retval;
    25f8:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    25fe:	2f7c 0000 a724 	move.l #42788,64(sp)
    2604:	0040 
  for(int i=0; i<16;i++)
    2606:	42af 003c      	clr.l 60(sp)
    260a:	6024           	bra.s 2630 <ClBuild+0xc8>
    *cl++ = *clpartinstruction++;
    260c:	222f 0040      	move.l 64(sp),d1
    2610:	2001           	move.l d1,d0
    2612:	5880           	addq.l #4,d0
    2614:	2f40 0040      	move.l d0,64(sp)
    2618:	202f 0044      	move.l 68(sp),d0
    261c:	2400           	move.l d0,d2
    261e:	5882           	addq.l #4,d2
    2620:	2f42 0044      	move.l d2,68(sp)
    2624:	2041           	movea.l d1,a0
    2626:	2210           	move.l (a0),d1
    2628:	2040           	movea.l d0,a0
    262a:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    262c:	52af 003c      	addq.l #1,60(sp)
    2630:	700f           	moveq #15,d0
    2632:	b0af 003c      	cmp.l 60(sp),d0
    2636:	6cd4           	bge.s 260c <ClBuild+0xa4>
  clpartinstruction = ClScreen;
    2638:	2f7c 0000 a764 	move.l #42852,64(sp)
    263e:	0040 
  for(int i=0; i<12;i++)
    2640:	42af 0038      	clr.l 56(sp)
    2644:	6024           	bra.s 266a <ClBuild+0x102>
    *cl++ = *clpartinstruction++;
    2646:	222f 0040      	move.l 64(sp),d1
    264a:	2401           	move.l d1,d2
    264c:	5882           	addq.l #4,d2
    264e:	2f42 0040      	move.l d2,64(sp)
    2652:	202f 0044      	move.l 68(sp),d0
    2656:	2400           	move.l d0,d2
    2658:	5882           	addq.l #4,d2
    265a:	2f42 0044      	move.l d2,68(sp)
    265e:	2041           	movea.l d1,a0
    2660:	2210           	move.l (a0),d1
    2662:	2040           	movea.l d0,a0
    2664:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    2666:	52af 0038      	addq.l #1,56(sp)
    266a:	700b           	moveq #11,d0
    266c:	b0af 0038      	cmp.l 56(sp),d0
    2670:	6cd4           	bge.s 2646 <ClBuild+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    2672:	202f 0044      	move.l 68(sp),d0
    2676:	2200           	move.l d0,d1
    2678:	5881           	addq.l #4,d1
    267a:	2f41 0044      	move.l d1,68(sp)
    267e:	2040           	movea.l d0,a0
    2680:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    2686:	202f 0044      	move.l 68(sp),d0
    268a:	2200           	move.l d0,d1
    268c:	5881           	addq.l #4,d1
    268e:	2f41 0044      	move.l d1,68(sp)
    2692:	2040           	movea.l d0,a0
    2694:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
    269a:	2f7c 0000 a6a4 	move.l #42660,64(sp)
    26a0:	0040 
  for(int i=0; i<2;i++)
    26a2:	42af 0034      	clr.l 52(sp)
    26a6:	6024           	bra.s 26cc <ClBuild+0x164>
    *cl++ = *clpartinstruction++;
    26a8:	222f 0040      	move.l 64(sp),d1
    26ac:	2001           	move.l d1,d0
    26ae:	5880           	addq.l #4,d0
    26b0:	2f40 0040      	move.l d0,64(sp)
    26b4:	202f 0044      	move.l 68(sp),d0
    26b8:	2400           	move.l d0,d2
    26ba:	5882           	addq.l #4,d2
    26bc:	2f42 0044      	move.l d2,68(sp)
    26c0:	2041           	movea.l d1,a0
    26c2:	2210           	move.l (a0),d1
    26c4:	2040           	movea.l d0,a0
    26c6:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
    26c8:	52af 0034      	addq.l #1,52(sp)
    26cc:	7001           	moveq #1,d0
    26ce:	b0af 0034      	cmp.l 52(sp),d0
    26d2:	6cd4           	bge.s 26a8 <ClBuild+0x140>
  *cl = 0xfffffffe;
    26d4:	206f 0044      	movea.l 68(sp),a0
    26d8:	72fe           	moveq #-2,d1
    26da:	2081           	move.l d1,(a0)

  return retval;
    26dc:	202f 0024      	move.l 36(sp),d0
}
    26e0:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    26e4:	4fef 003c      	lea 60(sp),sp
    26e8:	4e75           	rts

000026ea <PrepareDisplay>:

int PrepareDisplay() {
    26ea:	4fef ffb8      	lea -72(sp),sp
    26ee:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClBuild( );
    26f2:	4eba fe74      	jsr 2568 <ClBuild>(pc)
    26f6:	23c0 004d 2ca4 	move.l d0,4d2ca4 <Copperlist1>
  Copperlist2 = ClBuild( );
    26fc:	4eba fe6a      	jsr 2568 <ClBuild>(pc)
    2700:	23c0 004d 2ca8 	move.l d0,4d2ca8 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    2706:	2f7c 0000 c800 	move.l #51200,80(sp)
    270c:	0050 
    270e:	7002           	moveq #2,d0
    2710:	2f40 004c      	move.l d0,76(sp)
    2714:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    271a:	2c40           	movea.l d0,a6
    271c:	202f 0050      	move.l 80(sp),d0
    2720:	222f 004c      	move.l 76(sp),d1
    2724:	4eae ff3a      	jsr -198(a6)
    2728:	2f40 0048      	move.l d0,72(sp)
    272c:	202f 0048      	move.l 72(sp),d0
    2730:	23c0 004d 2c9c 	move.l d0,4d2c9c <Bitplane1>
  if(Bitplane1 == 0) {
    2736:	2039 004d 2c9c 	move.l 4d2c9c <Bitplane1>,d0
    273c:	6658           	bne.s 2796 <PrepareDisplay+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    273e:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2744:	2c40           	movea.l d0,a6
    2746:	4eae ffc4      	jsr -60(a6)
    274a:	2f40 0044      	move.l d0,68(sp)
    274e:	202f 0044      	move.l 68(sp),d0
    2752:	2f40 0040      	move.l d0,64(sp)
    2756:	2f7c 0000 7d3d 	move.l #32061,60(sp)
    275c:	003c 
    275e:	7026           	moveq #38,d0
    2760:	2f40 0038      	move.l d0,56(sp)
    2764:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    276a:	2c40           	movea.l d0,a6
    276c:	222f 0040      	move.l 64(sp),d1
    2770:	242f 003c      	move.l 60(sp),d2
    2774:	262f 0038      	move.l 56(sp),d3
    2778:	4eae ffd0      	jsr -48(a6)
    277c:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    2780:	7001           	moveq #1,d0
    2782:	2f40 0030      	move.l d0,48(sp)
    2786:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    278c:	2c40           	movea.l d0,a6
    278e:	222f 0030      	move.l 48(sp),d1
    2792:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane1;
    2796:	2039 004d 2c9c 	move.l 4d2c9c <Bitplane1>,d0
    279c:	23c0 004d 2cb0 	move.l d0,4d2cb0 <ViewBuffer>
  ViewCopper = Copperlist1;
    27a2:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    27a8:	23c0 004d 2cb8 	move.l d0,4d2cb8 <ViewCopper>
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    27ae:	2f7c 0000 c800 	move.l #51200,44(sp)
    27b4:	002c 
    27b6:	7002           	moveq #2,d0
    27b8:	2f40 0028      	move.l d0,40(sp)
    27bc:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    27c2:	2c40           	movea.l d0,a6
    27c4:	202f 002c      	move.l 44(sp),d0
    27c8:	222f 0028      	move.l 40(sp),d1
    27cc:	4eae ff3a      	jsr -198(a6)
    27d0:	2f40 0024      	move.l d0,36(sp)
    27d4:	202f 0024      	move.l 36(sp),d0
    27d8:	23c0 004d 2ca0 	move.l d0,4d2ca0 <Bitplane2>
  if(Bitplane2 == 0) {
    27de:	2039 004d 2ca0 	move.l 4d2ca0 <Bitplane2>,d0
    27e4:	6658           	bne.s 283e <PrepareDisplay+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    27e6:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    27ec:	2c40           	movea.l d0,a6
    27ee:	4eae ffc4      	jsr -60(a6)
    27f2:	2f40 0020      	move.l d0,32(sp)
    27f6:	202f 0020      	move.l 32(sp),d0
    27fa:	2f40 001c      	move.l d0,28(sp)
    27fe:	2f7c 0000 7d64 	move.l #32100,24(sp)
    2804:	0018 
    2806:	7026           	moveq #38,d0
    2808:	2f40 0014      	move.l d0,20(sp)
    280c:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2812:	2c40           	movea.l d0,a6
    2814:	222f 001c      	move.l 28(sp),d1
    2818:	242f 0018      	move.l 24(sp),d2
    281c:	262f 0014      	move.l 20(sp),d3
    2820:	4eae ffd0      	jsr -48(a6)
    2824:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    2828:	7001           	moveq #1,d0
    282a:	2f40 000c      	move.l d0,12(sp)
    282e:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2834:	2c40           	movea.l d0,a6
    2836:	222f 000c      	move.l 12(sp),d1
    283a:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane2;
    283e:	2039 004d 2ca0 	move.l 4d2ca0 <Bitplane2>,d0
    2844:	23c0 004d 2cac 	move.l d0,4d2cac <DrawBuffer>
  DrawCopper = Copperlist2;
    284a:	2039 004d 2ca8 	move.l 4d2ca8 <Copperlist2>,d0
    2850:	23c0 004d 2cb4 	move.l d0,4d2cb4 <DrawCopper>
  /*SwapCl();
  SetBplPointers();
  SwapCl();
  SetBplPointers();*/
  return 0;
    2856:	7000           	moveq #0,d0
}
    2858:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    285c:	4fef 0048      	lea 72(sp),sp
    2860:	4e75           	rts

00002862 <TestCopperlistBatch>:

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                  long length) {
    2862:	598f           	subq.l #4,sp
  for( int i=0;i<length;i++)
    2864:	4297           	clr.l (sp)
    2866:	602a           	bra.s 2892 <TestCopperlistBatch+0x30>
    if( instructions[ pos+i] != batch[ i])
    2868:	202f 000c      	move.l 12(sp),d0
    286c:	d097           	add.l (sp),d0
    286e:	d080           	add.l d0,d0
    2870:	d080           	add.l d0,d0
    2872:	206f 0008      	movea.l 8(sp),a0
    2876:	d1c0           	adda.l d0,a0
    2878:	2210           	move.l (a0),d1
    287a:	2017           	move.l (sp),d0
    287c:	d080           	add.l d0,d0
    287e:	d080           	add.l d0,d0
    2880:	206f 0010      	movea.l 16(sp),a0
    2884:	d1c0           	adda.l d0,a0
    2886:	2010           	move.l (a0),d0
    2888:	b081           	cmp.l d1,d0
    288a:	6704           	beq.s 2890 <TestCopperlistBatch+0x2e>
      return 0;
    288c:	7000           	moveq #0,d0
    288e:	600c           	bra.s 289c <TestCopperlistBatch+0x3a>
  for( int i=0;i<length;i++)
    2890:	5297           	addq.l #1,(sp)
    2892:	2017           	move.l (sp),d0
    2894:	b0af 0014      	cmp.l 20(sp),d0
    2898:	6dce           	blt.s 2868 <TestCopperlistBatch+0x6>
  return 1;
    289a:	7001           	moveq #1,d0
}
    289c:	588f           	addq.l #4,sp
    289e:	4e75           	rts

000028a0 <TestCopperlistPos>:

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    28a0:	202f 0008      	move.l 8(sp),d0
    28a4:	d080           	add.l d0,d0
    28a6:	d080           	add.l d0,d0
    28a8:	206f 0004      	movea.l 4(sp),a0
    28ac:	d1c0           	adda.l d0,a0
    28ae:	2010           	move.l (a0),d0
    28b0:	b0af 000c      	cmp.l 12(sp),d0
    28b4:	6604           	bne.s 28ba <TestCopperlistPos+0x1a>
    return 1;
    28b6:	7001           	moveq #1,d0
    28b8:	6002           	bra.s 28bc <TestCopperlistPos+0x1c>
  else 
    return 0;
    28ba:	7000           	moveq #0,d0
}
    28bc:	4e75           	rts

000028be <TestCopperList>:

void TestCopperList() {
    28be:	4fef feb8      	lea -328(sp),sp
    28c2:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Write( Output(), "%d", hw->cop1lc);
    28c6:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    28cc:	2c40           	movea.l d0,a6
    28ce:	4eae ffc4      	jsr -60(a6)
    28d2:	2f40 0150      	move.l d0,336(sp)
    28d6:	202f 0150      	move.l 336(sp),d0
    28da:	2f40 014c      	move.l d0,332(sp)
    28de:	2f7c 0000 7f20 	move.l #32544,328(sp)
    28e4:	0148 
    28e6:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    28ec:	2028 0080      	move.l 128(a0),d0
    28f0:	2f40 0144      	move.l d0,324(sp)
    28f4:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    28fa:	2c40           	movea.l d0,a6
    28fc:	222f 014c      	move.l 332(sp),d1
    2900:	242f 0148      	move.l 328(sp),d2
    2904:	262f 0144      	move.l 324(sp),d3
    2908:	4eae ffd0      	jsr -48(a6)
    290c:	2f40 0140      	move.l d0,320(sp)
  Copperlist1 = ClBuild();
    2910:	4eba fc56      	jsr 2568 <ClBuild>(pc)
    2914:	23c0 004d 2ca4 	move.l d0,4d2ca4 <Copperlist1>
  DrawCopper = Copperlist1;
    291a:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    2920:	23c0 004d 2cb4 	move.l d0,4d2cb4 <DrawCopper>
  Copperlist2 = ClBuild();
    2926:	4eba fc40      	jsr 2568 <ClBuild>(pc)
    292a:	23c0 004d 2ca8 	move.l d0,4d2ca8 <Copperlist2>
  ViewCopper = Copperlist2;
    2930:	2039 004d 2ca8 	move.l 4d2ca8 <Copperlist2>,d0
    2936:	23c0 004d 2cb8 	move.l d0,4d2cb8 <ViewCopper>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    293c:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    2942:	4878 0010      	pea 10 <_start+0x10>
    2946:	4879 0000 a724 	pea a724 <ClsSprites>
    294c:	42a7           	clr.l -(sp)
    294e:	2f00           	move.l d0,-(sp)
    2950:	4eba ff10      	jsr 2862 <TestCopperlistBatch>(pc)
    2954:	4fef 0010      	lea 16(sp),sp
    2958:	4a80           	tst.l d0
    295a:	6642           	bne.s 299e <TestCopperList+0xe0>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    295c:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2962:	2c40           	movea.l d0,a6
    2964:	4eae ffc4      	jsr -60(a6)
    2968:	2f40 013c      	move.l d0,316(sp)
    296c:	202f 013c      	move.l 316(sp),d0
    2970:	2f40 0138      	move.l d0,312(sp)
    2974:	2f7c 0000 76a8 	move.l #30376,308(sp)
    297a:	0134 
    297c:	702c           	moveq #44,d0
    297e:	2f40 0130      	move.l d0,304(sp)
    2982:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2988:	2c40           	movea.l d0,a6
    298a:	222f 0138      	move.l 312(sp),d1
    298e:	242f 0134      	move.l 308(sp),d2
    2992:	262f 0130      	move.l 304(sp),d3
    2996:	4eae ffd0      	jsr -48(a6)
    299a:	2f40 012c      	move.l d0,300(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    299e:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    29a4:	4878 000c      	pea c <_start+0xc>
    29a8:	4879 0000 a764 	pea a764 <ClScreen>
    29ae:	4878 0010      	pea 10 <_start+0x10>
    29b2:	2f00           	move.l d0,-(sp)
    29b4:	4eba feac      	jsr 2862 <TestCopperlistBatch>(pc)
    29b8:	4fef 0010      	lea 16(sp),sp
    29bc:	4a80           	tst.l d0
    29be:	6642           	bne.s 2a02 <TestCopperList+0x144>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    29c0:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    29c6:	2c40           	movea.l d0,a6
    29c8:	4eae ffc4      	jsr -60(a6)
    29cc:	2f40 0128      	move.l d0,296(sp)
    29d0:	202f 0128      	move.l 296(sp),d0
    29d4:	2f40 0124      	move.l d0,292(sp)
    29d8:	2f7c 0000 76de 	move.l #30430,288(sp)
    29de:	0120 
    29e0:	7036           	moveq #54,d0
    29e2:	2f40 011c      	move.l d0,284(sp)
    29e6:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    29ec:	2c40           	movea.l d0,a6
    29ee:	222f 0124      	move.l 292(sp),d1
    29f2:	242f 0120      	move.l 288(sp),d2
    29f6:	262f 011c      	move.l 284(sp),d3
    29fa:	4eae ffd0      	jsr -48(a6)
    29fe:	2f40 0118      	move.l d0,280(sp)
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
    2a02:	23fc 0004 0000 	move.l #262144,4d2cac <DrawBuffer>
    2a08:	004d 2cac 
  ViewBuffer = (ULONG *)0x50000;
    2a0c:	23fc 0005 0000 	move.l #327680,4d2cb0 <ViewBuffer>
    2a12:	004d 2cb0 
  
  SetBplPointers();
    2a16:	4eba d72a      	jsr 142 <SetBplPointers>(pc)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    2a1a:	2039 004d 2cac 	move.l 4d2cac <DrawBuffer>,d0
    2a20:	0c80 0005 0000 	cmpi.l #327680,d0
    2a26:	660e           	bne.s 2a36 <TestCopperList+0x178>
    2a28:	2039 004d 2cb0 	move.l 4d2cb0 <ViewBuffer>,d0
    2a2e:	0c80 0004 0000 	cmpi.l #262144,d0
    2a34:	6742           	beq.s 2a78 <TestCopperList+0x1ba>
    Write( Output(), 
    2a36:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2a3c:	2c40           	movea.l d0,a6
    2a3e:	4eae ffc4      	jsr -60(a6)
    2a42:	2f40 0114      	move.l d0,276(sp)
    2a46:	202f 0114      	move.l 276(sp),d0
    2a4a:	2f40 0110      	move.l d0,272(sp)
    2a4e:	2f7c 0000 7f23 	move.l #32547,268(sp)
    2a54:	010c 
    2a56:	703b           	moveq #59,d0
    2a58:	2f40 0108      	move.l d0,264(sp)
    2a5c:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2a62:	2c40           	movea.l d0,a6
    2a64:	222f 0110      	move.l 272(sp),d1
    2a68:	242f 010c      	move.l 268(sp),d2
    2a6c:	262f 0108      	move.l 264(sp),d3
    2a70:	4eae ffd0      	jsr -48(a6)
    2a74:	2f40 0104      	move.l d0,260(sp)
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    2a78:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    2a7e:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    2a84:	4878 001c      	pea 1c <_start+0x1c>
    2a88:	2f00           	move.l d0,-(sp)
    2a8a:	4eba fe14      	jsr 28a0 <TestCopperlistPos>(pc)
    2a8e:	4fef 000c      	lea 12(sp),sp
    2a92:	4a80           	tst.l d0
    2a94:	6642           	bne.s 2ad8 <TestCopperList+0x21a>
    Write(Output(), 
    2a96:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2a9c:	2c40           	movea.l d0,a6
    2a9e:	4eae ffc4      	jsr -60(a6)
    2aa2:	2f40 0100      	move.l d0,256(sp)
    2aa6:	202f 0100      	move.l 256(sp),d0
    2aaa:	2f40 00fc      	move.l d0,252(sp)
    2aae:	2f7c 0000 7f5f 	move.l #32607,248(sp)
    2ab4:	00f8 
    2ab6:	703c           	moveq #60,d0
    2ab8:	2f40 00f4      	move.l d0,244(sp)
    2abc:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2ac2:	2c40           	movea.l d0,a6
    2ac4:	222f 00fc      	move.l 252(sp),d1
    2ac8:	242f 00f8      	move.l 248(sp),d2
    2acc:	262f 00f4      	move.l 244(sp),d3
    2ad0:	4eae ffd0      	jsr -48(a6)
    2ad4:	2f40 00f0      	move.l d0,240(sp)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    2ad8:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    2ade:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    2ae4:	4878 001d      	pea 1d <_start+0x1d>
    2ae8:	2f00           	move.l d0,-(sp)
    2aea:	4eba fdb4      	jsr 28a0 <TestCopperlistPos>(pc)
    2aee:	4fef 000c      	lea 12(sp),sp
    2af2:	4a80           	tst.l d0
    2af4:	6642           	bne.s 2b38 <TestCopperList+0x27a>
    Write(Output(), 
    2af6:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2afc:	2c40           	movea.l d0,a6
    2afe:	4eae ffc4      	jsr -60(a6)
    2b02:	2f40 00ec      	move.l d0,236(sp)
    2b06:	202f 00ec      	move.l 236(sp),d0
    2b0a:	2f40 00e8      	move.l d0,232(sp)
    2b0e:	2f7c 0000 7f9c 	move.l #32668,228(sp)
    2b14:	00e4 
    2b16:	703c           	moveq #60,d0
    2b18:	2f40 00e0      	move.l d0,224(sp)
    2b1c:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2b22:	2c40           	movea.l d0,a6
    2b24:	222f 00e8      	move.l 232(sp),d1
    2b28:	242f 00e4      	move.l 228(sp),d2
    2b2c:	262f 00e0      	move.l 224(sp),d3
    2b30:	4eae ffd0      	jsr -48(a6)
    2b34:	2f40 00dc      	move.l d0,220(sp)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2b38:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    2b3e:	4878 0002      	pea 2 <_start+0x2>
    2b42:	4879 0000 a6a4 	pea a6a4 <ClColor>
    2b48:	4878 001e      	pea 1e <_start+0x1e>
    2b4c:	2f00           	move.l d0,-(sp)
    2b4e:	4eba fd12      	jsr 2862 <TestCopperlistBatch>(pc)
    2b52:	4fef 0010      	lea 16(sp),sp
    2b56:	4a80           	tst.l d0
    2b58:	6642           	bne.s 2b9c <TestCopperList+0x2de>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2b5a:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2b60:	2c40           	movea.l d0,a6
    2b62:	4eae ffc4      	jsr -60(a6)
    2b66:	2f40 00d8      	move.l d0,216(sp)
    2b6a:	202f 00d8      	move.l 216(sp),d0
    2b6e:	2f40 00d4      	move.l d0,212(sp)
    2b72:	2f7c 0000 7715 	move.l #30485,208(sp)
    2b78:	00d0 
    2b7a:	7021           	moveq #33,d0
    2b7c:	2f40 00cc      	move.l d0,204(sp)
    2b80:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2b86:	2c40           	movea.l d0,a6
    2b88:	222f 00d4      	move.l 212(sp),d1
    2b8c:	242f 00d0      	move.l 208(sp),d2
    2b90:	262f 00cc      	move.l 204(sp),d3
    2b94:	4eae ffd0      	jsr -48(a6)
    2b98:	2f40 00c8      	move.l d0,200(sp)

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2b9c:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    2ba2:	4878 fffe      	pea fffffffe <_end+0xffb2d2ea>
    2ba6:	4878 0020      	pea 20 <_start+0x20>
    2baa:	2f00           	move.l d0,-(sp)
    2bac:	4eba fcf2      	jsr 28a0 <TestCopperlistPos>(pc)
    2bb0:	4fef 000c      	lea 12(sp),sp
    2bb4:	4a80           	tst.l d0
    2bb6:	6642           	bne.s 2bfa <TestCopperList+0x33c>
    Write(Output(), "Copperlist End not correctly set.\n", 34);
    2bb8:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2bbe:	2c40           	movea.l d0,a6
    2bc0:	4eae ffc4      	jsr -60(a6)
    2bc4:	2f40 00c4      	move.l d0,196(sp)
    2bc8:	202f 00c4      	move.l 196(sp),d0
    2bcc:	2f40 00c0      	move.l d0,192(sp)
    2bd0:	2f7c 0000 7737 	move.l #30519,188(sp)
    2bd6:	00bc 
    2bd8:	7022           	moveq #34,d0
    2bda:	2f40 00b8      	move.l d0,184(sp)
    2bde:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2be4:	2c40           	movea.l d0,a6
    2be6:	222f 00c0      	move.l 192(sp),d1
    2bea:	242f 00bc      	move.l 188(sp),d2
    2bee:	262f 00b8      	move.l 184(sp),d3
    2bf2:	4eae ffd0      	jsr -48(a6)
    2bf6:	2f40 00b4      	move.l d0,180(sp)
  
  SwapCl();
    2bfa:	4eba d5a4      	jsr 1a0 <SwapCl>(pc)
  
  if( DrawCopper != Copperlist2)
    2bfe:	2239 004d 2cb4 	move.l 4d2cb4 <DrawCopper>,d1
    2c04:	2039 004d 2ca8 	move.l 4d2ca8 <Copperlist2>,d0
    2c0a:	b081           	cmp.l d1,d0
    2c0c:	6742           	beq.s 2c50 <TestCopperList+0x392>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
    2c0e:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2c14:	2c40           	movea.l d0,a6
    2c16:	4eae ffc4      	jsr -60(a6)
    2c1a:	2f40 00b0      	move.l d0,176(sp)
    2c1e:	202f 00b0      	move.l 176(sp),d0
    2c22:	2f40 00ac      	move.l d0,172(sp)
    2c26:	2f7c 0000 7fd9 	move.l #32729,168(sp)
    2c2c:	00a8 
    2c2e:	7015           	moveq #21,d0
    2c30:	2f40 00a4      	move.l d0,164(sp)
    2c34:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2c3a:	2c40           	movea.l d0,a6
    2c3c:	222f 00ac      	move.l 172(sp),d1
    2c40:	242f 00a8      	move.l 168(sp),d2
    2c44:	262f 00a4      	move.l 164(sp),d3
    2c48:	4eae ffd0      	jsr -48(a6)
    2c4c:	2f40 00a0      	move.l d0,160(sp)

  
  PrepareDisplay();
    2c50:	4eba fa98      	jsr 26ea <PrepareDisplay>(pc)
  if( DrawBuffer != Bitplane2) 
    2c54:	2239 004d 2cac 	move.l 4d2cac <DrawBuffer>,d1
    2c5a:	2039 004d 2ca0 	move.l 4d2ca0 <Bitplane2>,d0
    2c60:	b081           	cmp.l d1,d0
    2c62:	6742           	beq.s 2ca6 <TestCopperList+0x3e8>
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
    2c64:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2c6a:	2c40           	movea.l d0,a6
    2c6c:	4eae ffc4      	jsr -60(a6)
    2c70:	2f40 009c      	move.l d0,156(sp)
    2c74:	202f 009c      	move.l 156(sp),d0
    2c78:	2f40 0098      	move.l d0,152(sp)
    2c7c:	2f7c 0000 7fef 	move.l #32751,148(sp)
    2c82:	0094 
    2c84:	7037           	moveq #55,d0
    2c86:	2f40 0090      	move.l d0,144(sp)
    2c8a:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2c90:	2c40           	movea.l d0,a6
    2c92:	222f 0098      	move.l 152(sp),d1
    2c96:	242f 0094      	move.l 148(sp),d2
    2c9a:	262f 0090      	move.l 144(sp),d3
    2c9e:	4eae ffd0      	jsr -48(a6)
    2ca2:	2f40 008c      	move.l d0,140(sp)
                                                                            55);
  if( DrawCopper != Copperlist2) 
    2ca6:	2239 004d 2cb4 	move.l 4d2cb4 <DrawCopper>,d1
    2cac:	2039 004d 2ca8 	move.l 4d2ca8 <Copperlist2>,d0
    2cb2:	b081           	cmp.l d1,d0
    2cb4:	6742           	beq.s 2cf8 <TestCopperList+0x43a>
    Write( Output(), 
    2cb6:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2cbc:	2c40           	movea.l d0,a6
    2cbe:	4eae ffc4      	jsr -60(a6)
    2cc2:	2f40 0088      	move.l d0,136(sp)
    2cc6:	202f 0088      	move.l 136(sp),d0
    2cca:	2f40 0084      	move.l d0,132(sp)
    2cce:	2f7c 0000 8027 	move.l #32807,128(sp)
    2cd4:	0080 
    2cd6:	7039           	moveq #57,d0
    2cd8:	2f40 007c      	move.l d0,124(sp)
    2cdc:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2ce2:	2c40           	movea.l d0,a6
    2ce4:	222f 0084      	move.l 132(sp),d1
    2ce8:	242f 0080      	move.l 128(sp),d2
    2cec:	262f 007c      	move.l 124(sp),d3
    2cf0:	4eae ffd0      	jsr -48(a6)
    2cf4:	2f40 0078      	move.l d0,120(sp)
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
    2cf8:	2239 004d 2cb0 	move.l 4d2cb0 <ViewBuffer>,d1
    2cfe:	2039 004d 2c9c 	move.l 4d2c9c <Bitplane1>,d0
    2d04:	b081           	cmp.l d1,d0
    2d06:	6742           	beq.s 2d4a <TestCopperList+0x48c>
    Write( Output(), 
    2d08:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2d0e:	2c40           	movea.l d0,a6
    2d10:	4eae ffc4      	jsr -60(a6)
    2d14:	2f40 0074      	move.l d0,116(sp)
    2d18:	202f 0074      	move.l 116(sp),d0
    2d1c:	2f40 0070      	move.l d0,112(sp)
    2d20:	2f7c 0000 8061 	move.l #32865,108(sp)
    2d26:	006c 
    2d28:	7038           	moveq #56,d0
    2d2a:	2f40 0068      	move.l d0,104(sp)
    2d2e:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2d34:	2c40           	movea.l d0,a6
    2d36:	222f 0070      	move.l 112(sp),d1
    2d3a:	242f 006c      	move.l 108(sp),d2
    2d3e:	262f 0068      	move.l 104(sp),d3
    2d42:	4eae ffd0      	jsr -48(a6)
    2d46:	2f40 0064      	move.l d0,100(sp)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
    2d4a:	2239 004d 2cb8 	move.l 4d2cb8 <ViewCopper>,d1
    2d50:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    2d56:	b081           	cmp.l d1,d0
    2d58:	6742           	beq.s 2d9c <TestCopperList+0x4de>
    Write( Output(), 
    2d5a:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2d60:	2c40           	movea.l d0,a6
    2d62:	4eae ffc4      	jsr -60(a6)
    2d66:	2f40 0060      	move.l d0,96(sp)
    2d6a:	202f 0060      	move.l 96(sp),d0
    2d6e:	2f40 005c      	move.l d0,92(sp)
    2d72:	2f7c 0000 809a 	move.l #32922,88(sp)
    2d78:	0058 
    2d7a:	703a           	moveq #58,d0
    2d7c:	2f40 0054      	move.l d0,84(sp)
    2d80:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2d86:	2c40           	movea.l d0,a6
    2d88:	222f 005c      	move.l 92(sp),d1
    2d8c:	242f 0058      	move.l 88(sp),d2
    2d90:	262f 0054      	move.l 84(sp),d3
    2d94:	4eae ffd0      	jsr -48(a6)
    2d98:	2f40 0050      	move.l d0,80(sp)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
    2d9c:	4eba d3a4      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2da0:	4eba d3fe      	jsr 1a0 <SwapCl>(pc)
  UWORD *copword = ViewCopper;
    2da4:	2f79 004d 2cb8 	move.l 4d2cb8 <ViewCopper>,76(sp)
    2daa:	004c 
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2dac:	307c 0076      	movea.w #118,a0
    2db0:	d1ef 004c      	adda.l 76(sp),a0
    2db4:	3010           	move.w (a0),d0
    2db6:	7200           	moveq #0,d1
    2db8:	3200           	move.w d0,d1
    2dba:	307c 0072      	movea.w #114,a0
    2dbe:	d1ef 004c      	adda.l 76(sp),a0
    2dc2:	3010           	move.w (a0),d0
    2dc4:	3000           	move.w d0,d0
    2dc6:	0280 0000 ffff 	andi.l #65535,d0
    2dcc:	4840           	swap d0
    2dce:	4240           	clr.w d0
    2dd0:	d081           	add.l d1,d0
    2dd2:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2dd6:	2039 004d 2ca0 	move.l 4d2ca0 <Bitplane2>,d0
    2ddc:	b0af 0048      	cmp.l 72(sp),d0
    2de0:	6742           	beq.s 2e24 <TestCopperList+0x566>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2de2:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2de8:	2c40           	movea.l d0,a6
    2dea:	4eae ffc4      	jsr -60(a6)
    2dee:	2f40 0044      	move.l d0,68(sp)
    2df2:	202f 0044      	move.l 68(sp),d0
    2df6:	2f40 0040      	move.l d0,64(sp)
    2dfa:	2f7c 0000 80d5 	move.l #32981,60(sp)
    2e00:	003c 
    2e02:	7048           	moveq #72,d0
    2e04:	2f40 0038      	move.l d0,56(sp)
    2e08:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2e0e:	2c40           	movea.l d0,a6
    2e10:	222f 0040      	move.l 64(sp),d1
    2e14:	242f 003c      	move.l 60(sp),d2
    2e18:	262f 0038      	move.l 56(sp),d3
    2e1c:	4eae ffd0      	jsr -48(a6)
    2e20:	2f40 0034      	move.l d0,52(sp)
                                                   " after first frame.\n", 72);
  SetBplPointers();
    2e24:	4eba d31c      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2e28:	4eba d376      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2e2c:	2f79 004d 2cb8 	move.l 4d2cb8 <ViewCopper>,76(sp)
    2e32:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2e34:	307c 0076      	movea.w #118,a0
    2e38:	d1ef 004c      	adda.l 76(sp),a0
    2e3c:	3010           	move.w (a0),d0
    2e3e:	7200           	moveq #0,d1
    2e40:	3200           	move.w d0,d1
    2e42:	307c 0072      	movea.w #114,a0
    2e46:	d1ef 004c      	adda.l 76(sp),a0
    2e4a:	3010           	move.w (a0),d0
    2e4c:	3000           	move.w d0,d0
    2e4e:	0280 0000 ffff 	andi.l #65535,d0
    2e54:	4840           	swap d0
    2e56:	4240           	clr.w d0
    2e58:	d081           	add.l d1,d0
    2e5a:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane1) 
    2e5e:	2039 004d 2c9c 	move.l 4d2c9c <Bitplane1>,d0
    2e64:	b0af 0048      	cmp.l 72(sp),d0
    2e68:	6742           	beq.s 2eac <TestCopperList+0x5ee>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
    2e6a:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2e70:	2c40           	movea.l d0,a6
    2e72:	4eae ffc4      	jsr -60(a6)
    2e76:	2f40 0030      	move.l d0,48(sp)
    2e7a:	202f 0030      	move.l 48(sp),d0
    2e7e:	2f40 002c      	move.l d0,44(sp)
    2e82:	2f7c 0000 811e 	move.l #33054,40(sp)
    2e88:	0028 
    2e8a:	7049           	moveq #73,d0
    2e8c:	2f40 0024      	move.l d0,36(sp)
    2e90:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2e96:	2c40           	movea.l d0,a6
    2e98:	222f 002c      	move.l 44(sp),d1
    2e9c:	242f 0028      	move.l 40(sp),d2
    2ea0:	262f 0024      	move.l 36(sp),d3
    2ea4:	4eae ffd0      	jsr -48(a6)
    2ea8:	2f40 0020      	move.l d0,32(sp)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
    2eac:	4eba d294      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2eb0:	4eba d2ee      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2eb4:	2f79 004d 2cb8 	move.l 4d2cb8 <ViewCopper>,76(sp)
    2eba:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2ebc:	307c 0076      	movea.w #118,a0
    2ec0:	d1ef 004c      	adda.l 76(sp),a0
    2ec4:	3010           	move.w (a0),d0
    2ec6:	7200           	moveq #0,d1
    2ec8:	3200           	move.w d0,d1
    2eca:	307c 0072      	movea.w #114,a0
    2ece:	d1ef 004c      	adda.l 76(sp),a0
    2ed2:	3010           	move.w (a0),d0
    2ed4:	3000           	move.w d0,d0
    2ed6:	0280 0000 ffff 	andi.l #65535,d0
    2edc:	4840           	swap d0
    2ede:	4240           	clr.w d0
    2ee0:	d081           	add.l d1,d0
    2ee2:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2ee6:	2039 004d 2ca0 	move.l 4d2ca0 <Bitplane2>,d0
    2eec:	b0af 0048      	cmp.l 72(sp),d0
    2ef0:	6742           	beq.s 2f34 <TestCopperList+0x676>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2ef2:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2ef8:	2c40           	movea.l d0,a6
    2efa:	4eae ffc4      	jsr -60(a6)
    2efe:	2f40 001c      	move.l d0,28(sp)
    2f02:	202f 001c      	move.l 28(sp),d0
    2f06:	2f40 0018      	move.l d0,24(sp)
    2f0a:	2f7c 0000 8168 	move.l #33128,20(sp)
    2f10:	0014 
    2f12:	7048           	moveq #72,d0
    2f14:	2f40 0010      	move.l d0,16(sp)
    2f18:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2f1e:	2c40           	movea.l d0,a6
    2f20:	222f 0018      	move.l 24(sp),d1
    2f24:	242f 0014      	move.l 20(sp),d2
    2f28:	262f 0010      	move.l 16(sp),d3
    2f2c:	4eae ffd0      	jsr -48(a6)
    2f30:	2f40 000c      	move.l d0,12(sp)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
    2f34:	2f3c 0000 c800 	move.l #51200,-(sp)
    2f3a:	4878 0084      	pea 84 <_start+0x84>
    2f3e:	4eba d1a0      	jsr e0 <FreeDisplay>(pc)
    2f42:	508f           	addq.l #8,sp
    2f44:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2f48:	4fef 0148      	lea 328(sp),sp
    2f4c:	4e75           	rts

00002f4e <RunTests>:
#include "runtests.h"
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    2f4e:	4eba f96e      	jsr 28be <TestCopperList>(pc)
    ZoomTest();
    2f52:	4eba 0004      	jsr 2f58 <ZoomTest>(pc)
    //SwScrollerTest();
    2f56:	4e75           	rts

00002f58 <ZoomTest>:
#include "zoomtest2.h"

ULONG Cl102ZoomTest[137];

void ZoomTest() {
  TestZoomSpeed();
    2f58:	4eba 0046      	jsr 2fa0 <TestZoomSpeed>(pc)
  ZoomTestDisplay();
    2f5c:	4eba 00e2      	jsr 3040 <ZoomTestDisplay>(pc)
  TestBlitleftOfZoom();
    2f60:	4eba 05a8      	jsr 350a <TestBlitleftOfZoom>(pc)
  TestCopyWord();
    2f64:	4eba 0838      	jsr 379e <TestCopyWord>(pc)
  TestZoom4Picture();
    2f68:	4eba 0e12      	jsr 3d7c <TestZoom4Picture>(pc)
  TestZoom4PictureOn5Planes();
    2f6c:	4eba 0b22      	jsr 3a90 <TestZoom4PictureOn5Planes>(pc)
  Test_Zoom2();
    2f70:	4eba f012      	jsr 1f84 <Test_Zoom2>(pc)
  c2p1x1_8_c5_gen_init( 320, 256, 0, 0, 0, 0);
    2f74:	42a7           	clr.l -(sp)
    2f76:	42a7           	clr.l -(sp)
    2f78:	42a7           	clr.l -(sp)
    2f7a:	42a7           	clr.l -(sp)
    2f7c:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2f80:	4878 0140      	pea 140 <FreeDisplay+0x60>
    2f84:	4eb9 0000 72b0 	jsr 72b0 <c2p1x1_8_c5_gen_init>
    2f8a:	4fef 0018      	lea 24(sp),sp
  c2p1x1_8_c5_gen( 0x100, 0x200);
    2f8e:	4878 0200      	pea 200 <Utils_CopyMem+0x22>
    2f92:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2f96:	4eb9 0000 732c 	jsr 732c <c2p1x1_8_c5_gen>
    2f9c:	508f           	addq.l #8,sp
}
    2f9e:	4e75           	rts

00002fa0 <TestZoomSpeed>:

int Counter4Frames;

void TestZoomSpeed() {
    2fa0:	4fef ffe8      	lea -24(sp),sp
    2fa4:	48e7 3002      	movem.l d2-d3/a6,-(sp)

 	TakeSystem();
    2fa8:	4eba d5d0      	jsr 57a <TakeSystem>(pc)
	WaitVbl();
    2fac:	4eba d582      	jsr 530 <WaitVbl>(pc)
  //             fedcba9876543210
  //hw->dmacon = 0x8def;

  hw->dmacon = DMAF_SETCLR | DMAF_AUDIO | DMAF_BLITTER | DMAF_RASTER 
    2fb0:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    2fb6:	317c 87cf 0096 	move.w #-30769,150(a0)
                                    | DMAF_COPPER | DMAF_MASTER | DMAF_BLITHOG;
   //0b1000011111100000;
  
  //hw->dmacon = 0b1000011111111111;
	hw->intena = (1 << INTB_SETCLR) | (1 << INTB_INTEN) | (1 << INTB_VERTB);
    2fbc:	2079 004d 2cbc 	movea.l 4d2cbc <hw>,a0
    2fc2:	317c c020 009a 	move.w #-16352,154(a0)
  
  Zoom_InitRun(); 
    2fc8:	4eba e156      	jsr 1120 <Zoom_InitRun>(pc)

  int success = 1;
    2fcc:	7001           	moveq #1,d0
    2fce:	2f40 0020      	move.l d0,32(sp)
  RunFrame();
    2fd2:	4eba d328      	jsr 2fc <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    2fd6:	3039 004d 2cfc 	move.w 4d2cfc <Zoom_Counter>,d0
    2fdc:	0c40 0008      	cmpi.w #8,d0
    2fe0:	6304           	bls.s 2fe6 <TestZoomSpeed+0x46>
    2fe2:	42af 0020      	clr.l 32(sp)
    
  Zoom_Dealloc();
    2fe6:	4eba e3d0      	jsr 13b8 <Zoom_Dealloc>(pc)
  FreeSystem();
    2fea:	4eba d5a4      	jsr 590 <FreeSystem>(pc)

  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    2fee:	4aaf 0020      	tst.l 32(sp)
    2ff2:	6642           	bne.s 3036 <TestZoomSpeed+0x96>
    2ff4:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    2ffa:	2c40           	movea.l d0,a6
    2ffc:	4eae ffc4      	jsr -60(a6)
    3000:	2f40 001c      	move.l d0,28(sp)
    3004:	202f 001c      	move.l 28(sp),d0
    3008:	2f40 0018      	move.l d0,24(sp)
    300c:	2f7c 0000 81b1 	move.l #33201,20(sp)
    3012:	0014 
    3014:	701c           	moveq #28,d0
    3016:	2f40 0010      	move.l d0,16(sp)
    301a:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3020:	2c40           	movea.l d0,a6
    3022:	222f 0018      	move.l 24(sp),d1
    3026:	242f 0014      	move.l 20(sp),d2
    302a:	262f 0010      	move.l 16(sp),d3
    302e:	4eae ffd0      	jsr -48(a6)
    3032:	2f40 000c      	move.l d0,12(sp)

  //AddIntServer(INTB_VERTB, vbint);
  //RemIntServer(INTB_VERTB, vbint);
  
}
    3036:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    303a:	4fef 0018      	lea 24(sp),sp
    303e:	4e75           	rts

00003040 <ZoomTestDisplay>:

void ZoomTestDisplay() {
    3040:	4fef ff38      	lea -200(sp),sp
    3044:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Zoom_Init();
    3048:	4eba e47e      	jsr 14c8 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    304c:	4eba e814      	jsr 1862 <PrepareDisplayZoom>(pc)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    3050:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    3056:	4878 0010      	pea 10 <_start+0x10>
    305a:	4879 0000 a724 	pea a724 <ClsSprites>
    3060:	42a7           	clr.l -(sp)
    3062:	2f00           	move.l d0,-(sp)
    3064:	4eba f7fc      	jsr 2862 <TestCopperlistBatch>(pc)
    3068:	4fef 0010      	lea 16(sp),sp
    306c:	4a80           	tst.l d0
    306e:	6642           	bne.s 30b2 <ZoomTestDisplay+0x72>
    Write( Output(), 
    3070:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3076:	2c40           	movea.l d0,a6
    3078:	4eae ffc4      	jsr -60(a6)
    307c:	2f40 00d0      	move.l d0,208(sp)
    3080:	202f 00d0      	move.l 208(sp),d0
    3084:	2f40 00cc      	move.l d0,204(sp)
    3088:	2f7c 0000 81d0 	move.l #33232,200(sp)
    308e:	00c8 
    3090:	7045           	moveq #69,d0
    3092:	2f40 00c4      	move.l d0,196(sp)
    3096:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    309c:	2c40           	movea.l d0,a6
    309e:	222f 00cc      	move.l 204(sp),d1
    30a2:	242f 00c8      	move.l 200(sp),d2
    30a6:	262f 00c4      	move.l 196(sp),d3
    30aa:	4eae ffd0      	jsr -48(a6)
    30ae:	2f40 00c0      	move.l d0,192(sp)
       "ZoomCopperlist: Sprite section of copper starting on pos 0 messed up\n", 
                                                                            69);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    30b2:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    30b8:	4878 000c      	pea c <_start+0xc>
    30bc:	4879 0000 a764 	pea a764 <ClScreen>
    30c2:	4878 0010      	pea 10 <_start+0x10>
    30c6:	2f00           	move.l d0,-(sp)
    30c8:	4eba f798      	jsr 2862 <TestCopperlistBatch>(pc)
    30cc:	4fef 0010      	lea 16(sp),sp
    30d0:	4a80           	tst.l d0
    30d2:	6642           	bne.s 3116 <ZoomTestDisplay+0xd6>
    Write( Output(), 
    30d4:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    30da:	2c40           	movea.l d0,a6
    30dc:	4eae ffc4      	jsr -60(a6)
    30e0:	2f40 00bc      	move.l d0,188(sp)
    30e4:	202f 00bc      	move.l 188(sp),d0
    30e8:	2f40 00b8      	move.l d0,184(sp)
    30ec:	2f7c 0000 8216 	move.l #33302,180(sp)
    30f2:	00b4 
    30f4:	7046           	moveq #70,d0
    30f6:	2f40 00b0      	move.l d0,176(sp)
    30fa:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3100:	2c40           	movea.l d0,a6
    3102:	222f 00b8      	move.l 184(sp),d1
    3106:	242f 00b4      	move.l 180(sp),d2
    310a:	262f 00b0      	move.l 176(sp),d3
    310e:	4eae ffd0      	jsr -48(a6)
    3112:	2f40 00ac      	move.l d0,172(sp)
      "ZoomCopperlist: Screen section of copper starting on pos 16 messed up\n",
                                                                            70);
  DrawBuffer = (ULONG *) 0x40000;
    3116:	23fc 0004 0000 	move.l #262144,4d2cac <DrawBuffer>
    311c:	004d 2cac 
  ViewBuffer = (ULONG *) 0x50000;
    3120:	23fc 0005 0000 	move.l #327680,4d2cb0 <ViewBuffer>
    3126:	004d 2cb0 
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    312a:	2239 004d 2cb4 	move.l 4d2cb4 <DrawCopper>,d1
    3130:	2039 004d 2cac 	move.l 4d2cac <DrawBuffer>,d0
    3136:	2f01           	move.l d1,-(sp)
    3138:	2f00           	move.l d0,-(sp)
    313a:	4eba ed80      	jsr 1ebc <Zoom_SetBplPointers>(pc)
    313e:	508f           	addq.l #8,sp
  Zoom_SwapBuffers( 0);
    3140:	42a7           	clr.l -(sp)
    3142:	4eba ee10      	jsr 1f54 <Zoom_SwapBuffers>(pc)
    3146:	588f           	addq.l #4,sp
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    3148:	2039 004d 2cac 	move.l 4d2cac <DrawBuffer>,d0
    314e:	0c80 0005 0000 	cmpi.l #327680,d0
    3154:	660e           	bne.s 3164 <ZoomTestDisplay+0x124>
    3156:	2039 004d 2cb0 	move.l 4d2cb0 <ViewBuffer>,d0
    315c:	0c80 0004 0000 	cmpi.l #262144,d0
    3162:	6742           	beq.s 31a6 <ZoomTestDisplay+0x166>
    Write( Output(), 
    3164:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    316a:	2c40           	movea.l d0,a6
    316c:	4eae ffc4      	jsr -60(a6)
    3170:	2f40 00a8      	move.l d0,168(sp)
    3174:	202f 00a8      	move.l 168(sp),d0
    3178:	2f40 00a4      	move.l d0,164(sp)
    317c:	2f7c 0000 825d 	move.l #33373,160(sp)
    3182:	00a0 
    3184:	703b           	moveq #59,d0
    3186:	2f40 009c      	move.l d0,156(sp)
    318a:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3190:	2c40           	movea.l d0,a6
    3192:	222f 00a4      	move.l 164(sp),d1
    3196:	242f 00a0      	move.l 160(sp),d2
    319a:	262f 009c      	move.l 156(sp),d3
    319e:	4eae ffd0      	jsr -48(a6)
    31a2:	2f40 0098      	move.l d0,152(sp)
            "ZoomCopperlist: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    31a6:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    31ac:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    31b2:	4878 001c      	pea 1c <_start+0x1c>
    31b6:	2f00           	move.l d0,-(sp)
    31b8:	4eba f6e6      	jsr 28a0 <TestCopperlistPos>(pc)
    31bc:	4fef 000c      	lea 12(sp),sp
    31c0:	4a80           	tst.l d0
    31c2:	6642           	bne.s 3206 <ZoomTestDisplay+0x1c6>
    Write(Output(), 
    31c4:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    31ca:	2c40           	movea.l d0,a6
    31cc:	4eae ffc4      	jsr -60(a6)
    31d0:	2f40 0094      	move.l d0,148(sp)
    31d4:	202f 0094      	move.l 148(sp),d0
    31d8:	2f40 0090      	move.l d0,144(sp)
    31dc:	2f7c 0000 8299 	move.l #33433,140(sp)
    31e2:	008c 
    31e4:	703c           	moveq #60,d0
    31e6:	2f40 0088      	move.l d0,136(sp)
    31ea:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    31f0:	2c40           	movea.l d0,a6
    31f2:	222f 0090      	move.l 144(sp),d1
    31f6:	242f 008c      	move.l 140(sp),d2
    31fa:	262f 0088      	move.l 136(sp),d3
    31fe:	4eae ffd0      	jsr -48(a6)
    3202:	2f40 0084      	move.l d0,132(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    3206:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    320c:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    3212:	4878 001d      	pea 1d <_start+0x1d>
    3216:	2f00           	move.l d0,-(sp)
    3218:	4eba f686      	jsr 28a0 <TestCopperlistPos>(pc)
    321c:	4fef 000c      	lea 12(sp),sp
    3220:	4a80           	tst.l d0
    3222:	6642           	bne.s 3266 <ZoomTestDisplay+0x226>
    Write(Output(), 
    3224:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    322a:	2c40           	movea.l d0,a6
    322c:	4eae ffc4      	jsr -60(a6)
    3230:	2f40 0080      	move.l d0,128(sp)
    3234:	202f 0080      	move.l 128(sp),d0
    3238:	2f40 007c      	move.l d0,124(sp)
    323c:	2f7c 0000 82d6 	move.l #33494,120(sp)
    3242:	0078 
    3244:	703c           	moveq #60,d0
    3246:	2f40 0074      	move.l d0,116(sp)
    324a:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3250:	2c40           	movea.l d0,a6
    3252:	222f 007c      	move.l 124(sp),d1
    3256:	242f 0078      	move.l 120(sp),d2
    325a:	262f 0074      	move.l 116(sp),d3
    325e:	4eae ffd0      	jsr -48(a6)
    3262:	2f40 0070      	move.l d0,112(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1pl should be 00f4\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    3266:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    326c:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    3272:	4878 001e      	pea 1e <_start+0x1e>
    3276:	2f00           	move.l d0,-(sp)
    3278:	4eba f626      	jsr 28a0 <TestCopperlistPos>(pc)
    327c:	4fef 000c      	lea 12(sp),sp
    3280:	4a80           	tst.l d0
    3282:	6642           	bne.s 32c6 <ZoomTestDisplay+0x286>
    Write(Output(), 
    3284:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    328a:	2c40           	movea.l d0,a6
    328c:	4eae ffc4      	jsr -60(a6)
    3290:	2f40 006c      	move.l d0,108(sp)
    3294:	202f 006c      	move.l 108(sp),d0
    3298:	2f40 0068      	move.l d0,104(sp)
    329c:	2f7c 0000 8313 	move.l #33555,100(sp)
    32a2:	0064 
    32a4:	703c           	moveq #60,d0
    32a6:	2f40 0060      	move.l d0,96(sp)
    32aa:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    32b0:	2c40           	movea.l d0,a6
    32b2:	222f 0068      	move.l 104(sp),d1
    32b6:	242f 0064      	move.l 100(sp),d2
    32ba:	262f 0060      	move.l 96(sp),d3
    32be:	4eae ffd0      	jsr -48(a6)
    32c2:	2f40 005c      	move.l d0,92(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    32c6:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    32cc:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    32d2:	4878 001f      	pea 1f <_start+0x1f>
    32d6:	2f00           	move.l d0,-(sp)
    32d8:	4eba f5c6      	jsr 28a0 <TestCopperlistPos>(pc)
    32dc:	4fef 000c      	lea 12(sp),sp
    32e0:	4a80           	tst.l d0
    32e2:	6642           	bne.s 3326 <ZoomTestDisplay+0x2e6>
    Write(Output(), 
    32e4:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    32ea:	2c40           	movea.l d0,a6
    32ec:	4eae ffc4      	jsr -60(a6)
    32f0:	2f40 0058      	move.l d0,88(sp)
    32f4:	202f 0058      	move.l 88(sp),d0
    32f8:	2f40 0054      	move.l d0,84(sp)
    32fc:	2f7c 0000 8350 	move.l #33616,80(sp)
    3302:	0050 
    3304:	703c           	moveq #60,d0
    3306:	2f40 004c      	move.l d0,76(sp)
    330a:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3310:	2c40           	movea.l d0,a6
    3312:	222f 0054      	move.l 84(sp),d1
    3316:	242f 0050      	move.l 80(sp),d2
    331a:	262f 004c      	move.l 76(sp),d3
    331e:	4eae ffd0      	jsr -48(a6)
    3322:	2f40 0048      	move.l d0,72(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2pl should be 0034\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    3326:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    332c:	4878 0020      	pea 20 <_start+0x20>
    3330:	4879 0000 a6a4 	pea a6a4 <ClColor>
    3336:	4878 0026      	pea 26 <_start+0x26>
    333a:	2f00           	move.l d0,-(sp)
    333c:	4eba f524      	jsr 2862 <TestCopperlistBatch>(pc)
    3340:	4fef 0010      	lea 16(sp),sp
    3344:	4a80           	tst.l d0
    3346:	6642           	bne.s 338a <ZoomTestDisplay+0x34a>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    3348:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    334e:	2c40           	movea.l d0,a6
    3350:	4eae ffc4      	jsr -60(a6)
    3354:	2f40 0044      	move.l d0,68(sp)
    3358:	202f 0044      	move.l 68(sp),d0
    335c:	2f40 0040      	move.l d0,64(sp)
    3360:	2f7c 0000 838d 	move.l #33677,60(sp)
    3366:	003c 
    3368:	7025           	moveq #37,d0
    336a:	2f40 0038      	move.l d0,56(sp)
    336e:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3374:	2c40           	movea.l d0,a6
    3376:	222f 0040      	move.l 64(sp),d1
    337a:	242f 003c      	move.l 60(sp),d2
    337e:	262f 0038      	move.l 56(sp),d3
    3382:	4eae ffd0      	jsr -48(a6)
    3386:	2f40 0034      	move.l d0,52(sp)

  /*if(  TestCopperlistBatch(  Copperlist1, 71, Cl102ZoomRepeat, 21) == 0)
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36); */
  
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    338a:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    3390:	2f00           	move.l d0,-(sp)
    3392:	4878 000f      	pea f <_start+0xf>
    3396:	4eba d074      	jsr 40c <Zoom_Shrink102>(pc)
    339a:	508f           	addq.l #8,sp
  if( TestCopperListZoom102( Copperlist1, 73, Cl102ZoomTest) == 0)
    339c:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    33a2:	4879 0000 b944 	pea b944 <Cl102ZoomTest>
    33a8:	4878 0049      	pea 49 <_start+0x49>
    33ac:	2f00           	move.l d0,-(sp)
    33ae:	4eba 00c4      	jsr 3474 <TestCopperListZoom102>(pc)
    33b2:	4fef 000c      	lea 12(sp),sp
    33b6:	4a80           	tst.l d0
    33b8:	6642           	bne.s 33fc <ZoomTestDisplay+0x3bc>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    33ba:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    33c0:	2c40           	movea.l d0,a6
    33c2:	4eae ffc4      	jsr -60(a6)
    33c6:	2f40 0030      	move.l d0,48(sp)
    33ca:	202f 0030      	move.l 48(sp),d0
    33ce:	2f40 002c      	move.l d0,44(sp)
    33d2:	2f7c 0000 83b3 	move.l #33715,40(sp)
    33d8:	0028 
    33da:	7025           	moveq #37,d0
    33dc:	2f40 0024      	move.l d0,36(sp)
    33e0:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    33e6:	2c40           	movea.l d0,a6
    33e8:	222f 002c      	move.l 44(sp),d1
    33ec:	242f 0028      	move.l 40(sp),d2
    33f0:	262f 0024      	move.l 36(sp),d3
    33f4:	4eae ffd0      	jsr -48(a6)
    33f8:	2f40 0020      	move.l d0,32(sp)

  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    33fc:	2039 004d 2ca4 	move.l 4d2ca4 <Copperlist1>,d0
    3402:	4878 fffe      	pea fffffffe <_end+0xffb2d2ea>
    3406:	4878 00bb      	pea bb <WaitBlt+0x7>
    340a:	2f00           	move.l d0,-(sp)
    340c:	4eba f492      	jsr 28a0 <TestCopperlistPos>(pc)
    3410:	4fef 000c      	lea 12(sp),sp
    3414:	4a80           	tst.l d0
    3416:	6642           	bne.s 345a <ZoomTestDisplay+0x41a>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    3418:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    341e:	2c40           	movea.l d0,a6
    3420:	4eae ffc4      	jsr -60(a6)
    3424:	2f40 001c      	move.l d0,28(sp)
    3428:	202f 001c      	move.l 28(sp),d0
    342c:	2f40 0018      	move.l d0,24(sp)
    3430:	2f7c 0000 83d8 	move.l #33752,20(sp)
    3436:	0014 
    3438:	7032           	moveq #50,d0
    343a:	2f40 0010      	move.l d0,16(sp)
    343e:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3444:	2c40           	movea.l d0,a6
    3446:	222f 0018      	move.l 24(sp),d1
    344a:	242f 0014      	move.l 20(sp),d2
    344e:	262f 0010      	move.l 16(sp),d3
    3452:	4eae ffd0      	jsr -48(a6)
    3456:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    345a:	2f3c 0000 df20 	move.l #57120,-(sp)
    3460:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    3464:	4eba cc7a      	jsr e0 <FreeDisplay>(pc)
    3468:	508f           	addq.l #8,sp

}
    346a:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    346e:	4fef 00c8      	lea 200(sp),sp
    3472:	4e75           	rts

00003474 <TestCopperListZoom102>:

int TestCopperListZoom102( ULONG *cl2test, UWORD position, 
                                                           ULONG *template4cl) {
    3474:	598f           	subq.l #4,sp
    3476:	202f 000c      	move.l 12(sp),d0
    347a:	3000           	move.w d0,d0
    347c:	3f40 0002      	move.w d0,2(sp)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    3480:	7000           	moveq #0,d0
    3482:	302f 0002      	move.w 2(sp),d0
    3486:	4878 001c      	pea 1c <_start+0x1c>
    348a:	2f2f 0014      	move.l 20(sp),-(sp)
    348e:	2f00           	move.l d0,-(sp)
    3490:	2f2f 0014      	move.l 20(sp),-(sp)
    3494:	4eba f3cc      	jsr 2862 <TestCopperlistBatch>(pc)
    3498:	4fef 0010      	lea 16(sp),sp
    349c:	4a80           	tst.l d0
    349e:	6604           	bne.s 34a4 <TestCopperListZoom102+0x30>
    return 0;
    34a0:	7000           	moveq #0,d0
    34a2:	6062           	bra.s 3506 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    34a4:	7078           	moveq #120,d0
    34a6:	d0af 0010      	add.l 16(sp),d0
    34aa:	7200           	moveq #0,d1
    34ac:	322f 0002      	move.w 2(sp),d1
    34b0:	307c 001e      	movea.w #30,a0
    34b4:	d1c1           	adda.l d1,a0
    34b6:	4878 0036      	pea 36 <_start+0x36>
    34ba:	2f00           	move.l d0,-(sp)
    34bc:	2f08           	move.l a0,-(sp)
    34be:	2f2f 0014      	move.l 20(sp),-(sp)
    34c2:	4eba f39e      	jsr 2862 <TestCopperlistBatch>(pc)
    34c6:	4fef 0010      	lea 16(sp),sp
    34ca:	4a80           	tst.l d0
    34cc:	6604           	bne.s 34d2 <TestCopperListZoom102+0x5e>
    return 0;
    34ce:	7000           	moveq #0,d0
    34d0:	6034           	bra.s 3506 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    34d2:	202f 0010      	move.l 16(sp),d0
    34d6:	0680 0000 0158 	addi.l #344,d0
    34dc:	7200           	moveq #0,d1
    34de:	322f 0002      	move.w 2(sp),d1
    34e2:	307c 0056      	movea.w #86,a0
    34e6:	d1c1           	adda.l d1,a0
    34e8:	4878 001c      	pea 1c <_start+0x1c>
    34ec:	2f00           	move.l d0,-(sp)
    34ee:	2f08           	move.l a0,-(sp)
    34f0:	2f2f 0014      	move.l 20(sp),-(sp)
    34f4:	4eba f36c      	jsr 2862 <TestCopperlistBatch>(pc)
    34f8:	4fef 0010      	lea 16(sp),sp
    34fc:	4a80           	tst.l d0
    34fe:	6604           	bne.s 3504 <TestCopperListZoom102+0x90>
    return 0;
    3500:	7000           	moveq #0,d0
    3502:	6002           	bra.s 3506 <TestCopperListZoom102+0x92>
 
  return 1;
    3504:	7001           	moveq #1,d0
}
    3506:	588f           	addq.l #4,sp
    3508:	4e75           	rts

0000350a <TestBlitleftOfZoom>:

void TestBlitleftOfZoom() {
    350a:	4fef ff94      	lea -108(sp),sp
    350e:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Zoom_Init();
    3512:	4eba dfb4      	jsr 14c8 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    3516:	4eba e34a      	jsr 1862 <PrepareDisplayZoom>(pc)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    351a:	2f7c 0000 c800 	move.l #51200,116(sp)
    3520:	0074 
    3522:	7002           	moveq #2,d0
    3524:	2f40 0070      	move.l d0,112(sp)
    3528:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    352e:	2c40           	movea.l d0,a6
    3530:	202f 0074      	move.l 116(sp),d0
    3534:	222f 0070      	move.l 112(sp),d1
    3538:	4eae ff3a      	jsr -198(a6)
    353c:	2f40 006c      	move.l d0,108(sp)
    3540:	202f 006c      	move.l 108(sp),d0
    3544:	23c0 004d 2cee 	move.l d0,4d2cee <Zoom_Source>
  if( Zoom_Source == 0) {
    354a:	2039 004d 2cee 	move.l 4d2cee <Zoom_Source>,d0
    3550:	6646           	bne.s 3598 <TestBlitleftOfZoom+0x8e>
    Write(  Output(), 
    3552:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3558:	2c40           	movea.l d0,a6
    355a:	4eae ffc4      	jsr -60(a6)
    355e:	2f40 001c      	move.l d0,28(sp)
    3562:	202f 001c      	move.l 28(sp),d0
    3566:	2f40 0018      	move.l d0,24(sp)
    356a:	2f7c 0000 840b 	move.l #33803,20(sp)
    3570:	0014 
    3572:	7236           	moveq #54,d1
    3574:	2f41 0010      	move.l d1,16(sp)
    3578:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    357e:	2c40           	movea.l d0,a6
    3580:	222f 0018      	move.l 24(sp),d1
    3584:	242f 0014      	move.l 20(sp),d2
    3588:	262f 0010      	move.l 16(sp),d3
    358c:	4eae ffd0      	jsr -48(a6)
    3590:	2f40 000c      	move.l d0,12(sp)
    3594:	6000 01fe      	bra.w 3794 <TestBlitleftOfZoom+0x28a>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  
  UWORD *tstsource = Zoom_Source;
    3598:	2f79 004d 2cee 	move.l 4d2cee <Zoom_Source>,104(sp)
    359e:	0068 
  *tstsource++ = 0x0000;
    35a0:	202f 0068      	move.l 104(sp),d0
    35a4:	2200           	move.l d0,d1
    35a6:	5481           	addq.l #2,d1
    35a8:	2f41 0068      	move.l d1,104(sp)
    35ac:	2040           	movea.l d0,a0
    35ae:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    35b0:	206f 0068      	movea.l 104(sp),a0
    35b4:	30bc 0080      	move.w #128,(a0)
  tstsource += ZMLINESIZE/2-1;
    35b8:	7028           	moveq #40,d0
    35ba:	d1af 0068      	add.l d0,104(sp)
  *tstsource = 0x1000;
    35be:	206f 0068      	movea.l 104(sp),a0
    35c2:	30bc 1000      	move.w #4096,(a0)
  tstsource++;
    35c6:	54af 0068      	addq.l #2,104(sp)
  *tstsource = 0x8e88;
    35ca:	206f 0068      	movea.l 104(sp),a0
    35ce:	30bc 8e88      	move.w #-29048,(a0)
  tstsource += ZMLINESIZE/2-1;
    35d2:	7228           	moveq #40,d1
    35d4:	d3af 0068      	add.l d1,104(sp)

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
    35d8:	2039 004d 2cee 	move.l 4d2cee <Zoom_Source>,d0
    35de:	2200           	move.l d0,d1
    35e0:	0681 0000 14d6 	addi.l #5334,d1
    35e6:	2f41 0068      	move.l d1,104(sp)
  *tstsource++ = 0x0000;
    35ea:	202f 0068      	move.l 104(sp),d0
    35ee:	2200           	move.l d0,d1
    35f0:	5481           	addq.l #2,d1
    35f2:	2f41 0068      	move.l d1,104(sp)
    35f6:	2040           	movea.l d0,a0
    35f8:	4250           	clr.w (a0)
  *tstsource = 0x00ff;
    35fa:	206f 0068      	movea.l 104(sp),a0
    35fe:	30bc 00ff      	move.w #255,(a0)
  WaitBlit();
    3602:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    3608:	2c40           	movea.l d0,a6
    360a:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    360e:	4eba e3ca      	jsr 19da <Init_Blit>(pc)
  Init_ZoomBlit( 7, 16, 0);
    3612:	42a7           	clr.l -(sp)
    3614:	4878 0010      	pea 10 <_start+0x10>
    3618:	4878 0007      	pea 7 <_start+0x7>
    361c:	4eba e438      	jsr 1a56 <Init_ZoomBlit>(pc)
    3620:	4fef 000c      	lea 12(sp),sp
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    3624:	2239 004d 2cac 	move.l 4d2cac <DrawBuffer>,d1
    362a:	2039 004d 2cee 	move.l 4d2cee <Zoom_Source>,d0
    3630:	4878 0080      	pea 80 <_start+0x80>
    3634:	2f01           	move.l d1,-(sp)
    3636:	2f00           	move.l d0,-(sp)
    3638:	4eba da04      	jsr 103e <Zoom_ZoomBlit>(pc)
    363c:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    3640:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    3646:	2c40           	movea.l d0,a6
    3648:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    364c:	2039 004d 2cac 	move.l 4d2cac <DrawBuffer>,d0
    3652:	2200           	move.l d0,d1
    3654:	5481           	addq.l #2,d1
    3656:	2f41 0064      	move.l d1,100(sp)
  if( *destination != 0x0180) {
    365a:	206f 0064      	movea.l 100(sp),a0
    365e:	3010           	move.w (a0),d0
    3660:	0c40 0180      	cmpi.w #384,d0
    3664:	6742           	beq.s 36a8 <TestBlitleftOfZoom+0x19e>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    3666:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    366c:	2c40           	movea.l d0,a6
    366e:	4eae ffc4      	jsr -60(a6)
    3672:	2f40 0060      	move.l d0,96(sp)
    3676:	202f 0060      	move.l 96(sp),d0
    367a:	2f40 005c      	move.l d0,92(sp)
    367e:	2f7c 0000 8443 	move.l #33859,88(sp)
    3684:	0058 
    3686:	701c           	moveq #28,d0
    3688:	2f40 0054      	move.l d0,84(sp)
    368c:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3692:	2c40           	movea.l d0,a6
    3694:	222f 005c      	move.l 92(sp),d1
    3698:	242f 0058      	move.l 88(sp),d2
    369c:	262f 0054      	move.l 84(sp),d3
    36a0:	4eae ffd0      	jsr -48(a6)
    36a4:	2f40 0050      	move.l d0,80(sp)
  }
  destination += ZMLINESIZE/2;
    36a8:	722a           	moveq #42,d1
    36aa:	d3af 0064      	add.l d1,100(sp)
  if( *destination != 0x1d88)
    36ae:	206f 0064      	movea.l 100(sp),a0
    36b2:	3010           	move.w (a0),d0
    36b4:	0c40 1d88      	cmpi.w #7560,d0
    36b8:	6742           	beq.s 36fc <TestBlitleftOfZoom+0x1f2>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    36ba:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    36c0:	2c40           	movea.l d0,a6
    36c2:	4eae ffc4      	jsr -60(a6)
    36c6:	2f40 004c      	move.l d0,76(sp)
    36ca:	202f 004c      	move.l 76(sp),d0
    36ce:	2f40 0048      	move.l d0,72(sp)
    36d2:	2f7c 0000 8460 	move.l #33888,68(sp)
    36d8:	0044 
    36da:	701c           	moveq #28,d0
    36dc:	2f40 0040      	move.l d0,64(sp)
    36e0:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    36e6:	2c40           	movea.l d0,a6
    36e8:	222f 0048      	move.l 72(sp),d1
    36ec:	242f 0044      	move.l 68(sp),d2
    36f0:	262f 0040      	move.l 64(sp),d3
    36f4:	4eae ffd0      	jsr -48(a6)
    36f8:	2f40 003c      	move.l d0,60(sp)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
    36fc:	2039 004d 2cac 	move.l 4d2cac <DrawBuffer>,d0
    3702:	2200           	move.l d0,d1
    3704:	0681 0000 14d6 	addi.l #5334,d1
    370a:	2f41 0064      	move.l d1,100(sp)
  destination++;
    370e:	54af 0064      	addq.l #2,100(sp)
  if( *destination != 0x01ff) {
    3712:	206f 0064      	movea.l 100(sp),a0
    3716:	3010           	move.w (a0),d0
    3718:	0c40 01ff      	cmpi.w #511,d0
    371c:	6742           	beq.s 3760 <TestBlitleftOfZoom+0x256>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    371e:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3724:	2c40           	movea.l d0,a6
    3726:	4eae ffc4      	jsr -60(a6)
    372a:	2f40 0038      	move.l d0,56(sp)
    372e:	202f 0038      	move.l 56(sp),d0
    3732:	2f40 0034      	move.l d0,52(sp)
    3736:	2f7c 0000 847d 	move.l #33917,48(sp)
    373c:	0030 
    373e:	701a           	moveq #26,d0
    3740:	2f40 002c      	move.l d0,44(sp)
    3744:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    374a:	2c40           	movea.l d0,a6
    374c:	222f 0034      	move.l 52(sp),d1
    3750:	242f 0030      	move.l 48(sp),d2
    3754:	262f 002c      	move.l 44(sp),d3
    3758:	4eae ffd0      	jsr -48(a6)
    375c:	2f40 0028      	move.l d0,40(sp)
  }
  FreeMem( Zoom_Source, 40*256*5);
    3760:	2f79 004d 2cee 	move.l 4d2cee <Zoom_Source>,36(sp)
    3766:	0024 
    3768:	2f7c 0000 c800 	move.l #51200,32(sp)
    376e:	0020 
    3770:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    3776:	2c40           	movea.l d0,a6
    3778:	226f 0024      	movea.l 36(sp),a1
    377c:	202f 0020      	move.l 32(sp),d0
    3780:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    3784:	2f3c 0000 df20 	move.l #57120,-(sp)
    378a:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    378e:	4eba c950      	jsr e0 <FreeDisplay>(pc)
    3792:	508f           	addq.l #8,sp
}
    3794:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3798:	4fef 006c      	lea 108(sp),sp
    379c:	4e75           	rts

0000379e <TestCopyWord>:

void TestCopyWord() {
    379e:	4fef ff74      	lea -140(sp),sp
    37a2:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    37a6:	2f7c 0000 04ec 	move.l #1260,136(sp)
    37ac:	0088 
    37ae:	7002           	moveq #2,d0
    37b0:	2f40 0084      	move.l d0,132(sp)
    37b4:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    37ba:	2c40           	movea.l d0,a6
    37bc:	202f 0088      	move.l 136(sp),d0
    37c0:	222f 0084      	move.l 132(sp),d1
    37c4:	4eae ff3a      	jsr -198(a6)
    37c8:	2f40 0080      	move.l d0,128(sp)
    37cc:	202f 0080      	move.l 128(sp),d0
    37d0:	2f40 007c      	move.l d0,124(sp)
  if( source == 0) {
    37d4:	6646           	bne.s 381c <TestCopyWord+0x7e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    37d6:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    37dc:	2c40           	movea.l d0,a6
    37de:	4eae ffc4      	jsr -60(a6)
    37e2:	2f40 001c      	move.l d0,28(sp)
    37e6:	202f 001c      	move.l 28(sp),d0
    37ea:	2f40 0018      	move.l d0,24(sp)
    37ee:	2f7c 0000 8498 	move.l #33944,20(sp)
    37f4:	0014 
    37f6:	7235           	moveq #53,d1
    37f8:	2f41 0010      	move.l d1,16(sp)
    37fc:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3802:	2c40           	movea.l d0,a6
    3804:	222f 0018      	move.l 24(sp),d1
    3808:	242f 0014      	move.l 20(sp),d2
    380c:	262f 0010      	move.l 16(sp),d3
    3810:	4eae ffd0      	jsr -48(a6)
    3814:	2f40 000c      	move.l d0,12(sp)
    3818:	6000 026c      	bra.w 3a86 <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    381c:	2f7c 0000 04ec 	move.l #1260,120(sp)
    3822:	0078 
    3824:	7002           	moveq #2,d0
    3826:	2f40 0074      	move.l d0,116(sp)
    382a:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    3830:	2c40           	movea.l d0,a6
    3832:	202f 0078      	move.l 120(sp),d0
    3836:	222f 0074      	move.l 116(sp),d1
    383a:	4eae ff3a      	jsr -198(a6)
    383e:	2f40 0070      	move.l d0,112(sp)
    3842:	202f 0070      	move.l 112(sp),d0
    3846:	2f40 006c      	move.l d0,108(sp)
  if( destination == 0) {
    384a:	6646           	bne.s 3892 <TestCopyWord+0xf4>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    384c:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3852:	2c40           	movea.l d0,a6
    3854:	4eae ffc4      	jsr -60(a6)
    3858:	2f40 0030      	move.l d0,48(sp)
    385c:	202f 0030      	move.l 48(sp),d0
    3860:	2f40 002c      	move.l d0,44(sp)
    3864:	2f7c 0000 8498 	move.l #33944,40(sp)
    386a:	0028 
    386c:	7235           	moveq #53,d1
    386e:	2f41 0024      	move.l d1,36(sp)
    3872:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3878:	2c40           	movea.l d0,a6
    387a:	222f 002c      	move.l 44(sp),d1
    387e:	242f 0028      	move.l 40(sp),d2
    3882:	262f 0024      	move.l 36(sp),d3
    3886:	4eae ffd0      	jsr -48(a6)
    388a:	2f40 0020      	move.l d0,32(sp)
    388e:	6000 01f6      	bra.w 3a86 <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
    3892:	2f6f 007c 0094 	move.l 124(sp),148(sp)
  for( int i=0; i<8;i++) {
    3898:	42af 0090      	clr.l 144(sp)
    389c:	6000 0086      	bra.w 3924 <TestCopyWord+0x186>
    *tmp++ = 0;
    38a0:	202f 0094      	move.l 148(sp),d0
    38a4:	2200           	move.l d0,d1
    38a6:	5481           	addq.l #2,d1
    38a8:	2f41 0094      	move.l d1,148(sp)
    38ac:	2040           	movea.l d0,a0
    38ae:	4250           	clr.w (a0)
    *tmp++ = 0xaaaa;
    38b0:	202f 0094      	move.l 148(sp),d0
    38b4:	2200           	move.l d0,d1
    38b6:	5481           	addq.l #2,d1
    38b8:	2f41 0094      	move.l d1,148(sp)
    38bc:	2040           	movea.l d0,a0
    38be:	30bc aaaa      	move.w #-21846,(a0)
    *tmp++ = 0xaaaa;
    38c2:	202f 0094      	move.l 148(sp),d0
    38c6:	2200           	move.l d0,d1
    38c8:	5481           	addq.l #2,d1
    38ca:	2f41 0094      	move.l d1,148(sp)
    38ce:	2040           	movea.l d0,a0
    38d0:	30bc aaaa      	move.w #-21846,(a0)
    *tmp = 0;
    38d4:	206f 0094      	movea.l 148(sp),a0
    38d8:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    38da:	7024           	moveq #36,d0
    38dc:	d1af 0094      	add.l d0,148(sp)
    *tmp++ = 0;
    38e0:	202f 0094      	move.l 148(sp),d0
    38e4:	2200           	move.l d0,d1
    38e6:	5481           	addq.l #2,d1
    38e8:	2f41 0094      	move.l d1,148(sp)
    38ec:	2040           	movea.l d0,a0
    38ee:	4250           	clr.w (a0)
    *tmp++ = 0x5555;
    38f0:	202f 0094      	move.l 148(sp),d0
    38f4:	2200           	move.l d0,d1
    38f6:	5481           	addq.l #2,d1
    38f8:	2f41 0094      	move.l d1,148(sp)
    38fc:	2040           	movea.l d0,a0
    38fe:	30bc 5555      	move.w #21845,(a0)
    *tmp++ = 0x5555;
    3902:	202f 0094      	move.l 148(sp),d0
    3906:	2200           	move.l d0,d1
    3908:	5481           	addq.l #2,d1
    390a:	2f41 0094      	move.l d1,148(sp)
    390e:	2040           	movea.l d0,a0
    3910:	30bc 5555      	move.w #21845,(a0)
    *tmp = 0;
    3914:	206f 0094      	movea.l 148(sp),a0
    3918:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    391a:	7024           	moveq #36,d0
    391c:	d1af 0094      	add.l d0,148(sp)
  for( int i=0; i<8;i++) {
    3920:	52af 0090      	addq.l #1,144(sp)
    3924:	7207           	moveq #7,d1
    3926:	b2af 0090      	cmp.l 144(sp),d1
    392a:	6c00 ff74      	bge.w 38a0 <TestCopyWord+0x102>
  }
  tmp = destination;
    392e:	2f6f 006c 0094 	move.l 108(sp),148(sp)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3934:	42af 008c      	clr.l 140(sp)
    3938:	6014           	bra.s 394e <TestCopyWord+0x1b0>
    *tmp++ = 0;
    393a:	202f 0094      	move.l 148(sp),d0
    393e:	2200           	move.l d0,d1
    3940:	5481           	addq.l #2,d1
    3942:	2f41 0094      	move.l d1,148(sp)
    3946:	2040           	movea.l d0,a0
    3948:	4250           	clr.w (a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    394a:	52af 008c      	addq.l #1,140(sp)
    394e:	0caf 0000 0275 	cmpi.l #629,140(sp)
    3954:	008c 
    3956:	6fe2           	ble.s 393a <TestCopyWord+0x19c>
  }

  WaitBlit();
    3958:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    395e:	2c40           	movea.l d0,a6
    3960:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
    3964:	4eba db62      	jsr 14c8 <Zoom_Init>(pc)
  Init_Copy( 3);
    3968:	4878 0003      	pea 3 <_start+0x3>
    396c:	4eba e18c      	jsr 1afa <Init_Copy>(pc)
    3970:	588f           	addq.l #4,sp
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
    3972:	202f 007c      	move.l 124(sp),d0
    3976:	5480           	addq.l #2,d0
    3978:	4878 0010      	pea 10 <_start+0x10>
    397c:	2f2f 0070      	move.l 112(sp),-(sp)
    3980:	2f00           	move.l d0,-(sp)
    3982:	4eba d67c      	jsr 1000 <Zoom_CopyWord>(pc)
    3986:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    398a:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    3990:	2c40           	movea.l d0,a6
    3992:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
    3996:	202f 006c      	move.l 108(sp),d0
    399a:	5480           	addq.l #2,d0
    399c:	2f40 0094      	move.l d0,148(sp)
  if( *tmp != 0x5555) 
    39a0:	206f 0094      	movea.l 148(sp),a0
    39a4:	3010           	move.w (a0),d0
    39a6:	0c40 5555      	cmpi.w #21845,d0
    39aa:	6742           	beq.s 39ee <TestCopyWord+0x250>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    39ac:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    39b2:	2c40           	movea.l d0,a6
    39b4:	4eae ffc4      	jsr -60(a6)
    39b8:	2f40 0068      	move.l d0,104(sp)
    39bc:	202f 0068      	move.l 104(sp),d0
    39c0:	2f40 0064      	move.l d0,100(sp)
    39c4:	2f7c 0000 84ce 	move.l #33998,96(sp)
    39ca:	0060 
    39cc:	721f           	moveq #31,d1
    39ce:	2f41 005c      	move.l d1,92(sp)
    39d2:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    39d8:	2c40           	movea.l d0,a6
    39da:	222f 0064      	move.l 100(sp),d1
    39de:	242f 0060      	move.l 96(sp),d2
    39e2:	262f 005c      	move.l 92(sp),d3
    39e6:	4eae ffd0      	jsr -48(a6)
    39ea:	2f40 0058      	move.l d0,88(sp)
  tmp += ZMLINESIZE/2;
    39ee:	702a           	moveq #42,d0
    39f0:	d1af 0094      	add.l d0,148(sp)
  if( *tmp != 0xaaaa)
    39f4:	206f 0094      	movea.l 148(sp),a0
    39f8:	3010           	move.w (a0),d0
    39fa:	0c40 aaaa      	cmpi.w #-21846,d0
    39fe:	6742           	beq.s 3a42 <TestCopyWord+0x2a4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    3a00:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3a06:	2c40           	movea.l d0,a6
    3a08:	4eae ffc4      	jsr -60(a6)
    3a0c:	2f40 0054      	move.l d0,84(sp)
    3a10:	202f 0054      	move.l 84(sp),d0
    3a14:	2f40 0050      	move.l d0,80(sp)
    3a18:	2f7c 0000 84ee 	move.l #34030,76(sp)
    3a1e:	004c 
    3a20:	7220           	moveq #32,d1
    3a22:	2f41 0048      	move.l d1,72(sp)
    3a26:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3a2c:	2c40           	movea.l d0,a6
    3a2e:	222f 0050      	move.l 80(sp),d1
    3a32:	242f 004c      	move.l 76(sp),d2
    3a36:	262f 0048      	move.l 72(sp),d3
    3a3a:	4eae ffd0      	jsr -48(a6)
    3a3e:	2f40 0044      	move.l d0,68(sp)
  
  FreeMem( source,ZMLINESIZE*30);
    3a42:	2f6f 007c 0040 	move.l 124(sp),64(sp)
    3a48:	2f7c 0000 04ec 	move.l #1260,60(sp)
    3a4e:	003c 
    3a50:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    3a56:	2c40           	movea.l d0,a6
    3a58:	226f 0040      	movea.l 64(sp),a1
    3a5c:	202f 003c      	move.l 60(sp),d0
    3a60:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    3a64:	2f6f 006c 0038 	move.l 108(sp),56(sp)
    3a6a:	2f7c 0000 04ec 	move.l #1260,52(sp)
    3a70:	0034 
    3a72:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    3a78:	2c40           	movea.l d0,a6
    3a7a:	226f 0038      	movea.l 56(sp),a1
    3a7e:	202f 0034      	move.l 52(sp),d0
    3a82:	4eae ff2e      	jsr -210(a6)
}
    3a86:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3a8a:	4fef 008c      	lea 140(sp),sp
    3a8e:	4e75           	rts

00003a90 <TestZoom4PictureOn5Planes>:
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */


void TestZoom4PictureOn5Planes() {
    3a90:	4fef ff74      	lea -140(sp),sp
    3a94:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3a98:	2f7c 0000 f460 	move.l #62560,102(sp)
    3a9e:	0066 
    3aa0:	7002           	moveq #2,d0
    3aa2:	2f40 0062      	move.l d0,98(sp)
    3aa6:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    3aac:	2c40           	movea.l d0,a6
    3aae:	202f 0066      	move.l 102(sp),d0
    3ab2:	222f 0062      	move.l 98(sp),d1
    3ab6:	4eae ff3a      	jsr -198(a6)
    3aba:	2f40 005e      	move.l d0,94(sp)
    3abe:	202f 005e      	move.l 94(sp),d0
    3ac2:	2f40 005a      	move.l d0,90(sp)
  if( source == 0) {
    3ac6:	6646           	bne.s 3b0e <TestZoom4PictureOn5Planes+0x7e>
    Write(  Output(), 
    3ac8:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3ace:	2c40           	movea.l d0,a6
    3ad0:	4eae ffc4      	jsr -60(a6)
    3ad4:	2f40 001e      	move.l d0,30(sp)
    3ad8:	202f 001e      	move.l 30(sp),d0
    3adc:	2f40 001a      	move.l d0,26(sp)
    3ae0:	2f7c 0000 850f 	move.l #34063,22(sp)
    3ae6:	0016 
    3ae8:	7239           	moveq #57,d1
    3aea:	2f41 0012      	move.l d1,18(sp)
    3aee:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3af4:	2c40           	movea.l d0,a6
    3af6:	222f 001a      	move.l 26(sp),d1
    3afa:	242f 0016      	move.l 22(sp),d2
    3afe:	262f 0012      	move.l 18(sp),d3
    3b02:	4eae ffd0      	jsr -48(a6)
    3b06:	2f40 000e      	move.l d0,14(sp)
    3b0a:	6000 0266      	bra.w 3d72 <TestZoom4PictureOn5Planes+0x2e2>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3b0e:	2f7c 0000 f460 	move.l #62560,86(sp)
    3b14:	0056 
    3b16:	7002           	moveq #2,d0
    3b18:	2f40 0052      	move.l d0,82(sp)
    3b1c:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    3b22:	2c40           	movea.l d0,a6
    3b24:	202f 0056      	move.l 86(sp),d0
    3b28:	222f 0052      	move.l 82(sp),d1
    3b2c:	4eae ff3a      	jsr -198(a6)
    3b30:	2f40 004e      	move.l d0,78(sp)
    3b34:	202f 004e      	move.l 78(sp),d0
    3b38:	2f40 004a      	move.l d0,74(sp)
  if( destination == 0) {
    3b3c:	6646           	bne.s 3b84 <TestZoom4PictureOn5Planes+0xf4>
    Write(  Output(), 
    3b3e:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3b44:	2c40           	movea.l d0,a6
    3b46:	4eae ffc4      	jsr -60(a6)
    3b4a:	2f40 0032      	move.l d0,50(sp)
    3b4e:	202f 0032      	move.l 50(sp),d0
    3b52:	2f40 002e      	move.l d0,46(sp)
    3b56:	2f7c 0000 8549 	move.l #34121,42(sp)
    3b5c:	002a 
    3b5e:	723d           	moveq #61,d1
    3b60:	2f41 0026      	move.l d1,38(sp)
    3b64:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3b6a:	2c40           	movea.l d0,a6
    3b6c:	222f 002e      	move.l 46(sp),d1
    3b70:	242f 002a      	move.l 42(sp),d2
    3b74:	262f 0026      	move.l 38(sp),d3
    3b78:	4eae ffd0      	jsr -48(a6)
    3b7c:	2f40 0022      	move.l d0,34(sp)
    3b80:	6000 01f0      	bra.w 3d72 <TestZoom4PictureOn5Planes+0x2e2>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3b84:	2f6f 005a 0094 	move.l 90(sp),148(sp)
  for(int i=0;i<128+8;i++) {
    3b8a:	42af 0090      	clr.l 144(sp)
    3b8e:	6050           	bra.s 3be0 <TestZoom4PictureOn5Planes+0x150>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b90:	42af 008c      	clr.l 140(sp)
    3b94:	6018           	bra.s 3bae <TestZoom4PictureOn5Planes+0x11e>
      *tmp4source++ = 0x55555555;
    3b96:	202f 0094      	move.l 148(sp),d0
    3b9a:	2200           	move.l d0,d1
    3b9c:	5881           	addq.l #4,d1
    3b9e:	2f41 0094      	move.l d1,148(sp)
    3ba2:	2040           	movea.l d0,a0
    3ba4:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3baa:	52af 008c      	addq.l #1,140(sp)
    3bae:	7031           	moveq #49,d0
    3bb0:	b0af 008c      	cmp.l 140(sp),d0
    3bb4:	6ce0           	bge.s 3b96 <TestZoom4PictureOn5Planes+0x106>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3bb6:	42af 0088      	clr.l 136(sp)
    3bba:	6018           	bra.s 3bd4 <TestZoom4PictureOn5Planes+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3bbc:	202f 0094      	move.l 148(sp),d0
    3bc0:	2200           	move.l d0,d1
    3bc2:	5881           	addq.l #4,d1
    3bc4:	2f41 0094      	move.l d1,148(sp)
    3bc8:	2040           	movea.l d0,a0
    3bca:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3bd0:	52af 0088      	addq.l #1,136(sp)
    3bd4:	7031           	moveq #49,d0
    3bd6:	b0af 0088      	cmp.l 136(sp),d0
    3bda:	6ce0           	bge.s 3bbc <TestZoom4PictureOn5Planes+0x12c>
  for(int i=0;i<128+8;i++) {
    3bdc:	52af 0090      	addq.l #1,144(sp)
    3be0:	0caf 0000 0087 	cmpi.l #135,144(sp)
    3be6:	0090 
    3be8:	6fa6           	ble.s 3b90 <TestZoom4PictureOn5Planes+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3bea:	4878 0005      	pea 5 <_start+0x5>
    3bee:	42a7           	clr.l -(sp)
    3bf0:	2f2f 0052      	move.l 82(sp),-(sp)
    3bf4:	2f2f 0066      	move.l 102(sp),-(sp)
    3bf8:	4eba df3a      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    3bfc:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3c00:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    3c06:	2c40           	movea.l d0,a6
    3c08:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3c0c:	222f 004a      	move.l 74(sp),d1
    3c10:	5881           	addq.l #4,d1
    3c12:	2f41 0084      	move.l d1,132(sp)
  UWORD *valsupposed = destlinezoom1;
    3c16:	2f7c 0000 bb68 	move.l #47976,70(sp)
    3c1c:	0046 
  UWORD mask = 0xffff;
    3c1e:	3f7c ffff 0082 	move.w #-1,130(sp)
  for(int i=0;i<14;i++) {
    3c24:	42af 007e      	clr.l 126(sp)
    3c28:	6000 00a8      	bra.w 3cd2 <TestZoom4PictureOn5Planes+0x242>
    for(int i2=0;i2<18;i2++) { 
    3c2c:	42af 007a      	clr.l 122(sp)
    3c30:	604e           	bra.s 3c80 <TestZoom4PictureOn5Planes+0x1f0>
      for( int i3=0;i3<5;i3++) {
    3c32:	42af 0076      	clr.l 118(sp)
    3c36:	6038           	bra.s 3c70 <TestZoom4PictureOn5Planes+0x1e0>
        TestRow( valsupposed, valactual, mask, i2+i*19);
    3c38:	222f 007e      	move.l 126(sp),d1
    3c3c:	2001           	move.l d1,d0
    3c3e:	e788           	lsl.l #3,d0
    3c40:	d081           	add.l d1,d0
    3c42:	d080           	add.l d0,d0
    3c44:	d081           	add.l d1,d0
    3c46:	2200           	move.l d0,d1
    3c48:	d2af 007a      	add.l 122(sp),d1
    3c4c:	7000           	moveq #0,d0
    3c4e:	302f 0082      	move.w 130(sp),d0
    3c52:	2f01           	move.l d1,-(sp)
    3c54:	2f00           	move.l d0,-(sp)
    3c56:	2f2f 008c      	move.l 140(sp),-(sp)
    3c5a:	2f2f 0052      	move.l 82(sp),-(sp)
    3c5e:	4eba 2f7e      	jsr 6bde <TestRow>(pc)
    3c62:	4fef 0010      	lea 16(sp),sp
        valactual += ZMLINESIZE/2;
    3c66:	702a           	moveq #42,d0
    3c68:	d1af 0084      	add.l d0,132(sp)
      for( int i3=0;i3<5;i3++) {
    3c6c:	52af 0076      	addq.l #1,118(sp)
    3c70:	7204           	moveq #4,d1
    3c72:	b2af 0076      	cmp.l 118(sp),d1
    3c76:	6cc0           	bge.s 3c38 <TestZoom4PictureOn5Planes+0x1a8>
      }
      mask = mask ^ 0xffff;
    3c78:	466f 0082      	not.w 130(sp)
    for(int i2=0;i2<18;i2++) { 
    3c7c:	52af 007a      	addq.l #1,122(sp)
    3c80:	7011           	moveq #17,d0
    3c82:	b0af 007a      	cmp.l 122(sp),d0
    3c86:	6caa           	bge.s 3c32 <TestZoom4PictureOn5Planes+0x1a2>
    }
    for( int i3=0;i3<5;i3++) {
    3c88:	42af 0072      	clr.l 114(sp)
    3c8c:	6038           	bra.s 3cc6 <TestZoom4PictureOn5Planes+0x236>
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3c8e:	222f 007e      	move.l 126(sp),d1
    3c92:	2001           	move.l d1,d0
    3c94:	e788           	lsl.l #3,d0
    3c96:	d081           	add.l d1,d0
    3c98:	d080           	add.l d0,d0
    3c9a:	2040           	movea.l d0,a0
    3c9c:	d1c1           	adda.l d1,a0
    3c9e:	41e8 0012      	lea 18(a0),a0
    3ca2:	7000           	moveq #0,d0
    3ca4:	302f 0082      	move.w 130(sp),d0
    3ca8:	2f08           	move.l a0,-(sp)
    3caa:	2f00           	move.l d0,-(sp)
    3cac:	2f2f 008c      	move.l 140(sp),-(sp)
    3cb0:	2f2f 0052      	move.l 82(sp),-(sp)
    3cb4:	4eba 2f28      	jsr 6bde <TestRow>(pc)
    3cb8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3cbc:	722a           	moveq #42,d1
    3cbe:	d3af 0084      	add.l d1,132(sp)
    for( int i3=0;i3<5;i3++) {
    3cc2:	52af 0072      	addq.l #1,114(sp)
    3cc6:	7004           	moveq #4,d0
    3cc8:	b0af 0072      	cmp.l 114(sp),d0
    3ccc:	6cc0           	bge.s 3c8e <TestZoom4PictureOn5Planes+0x1fe>
  for(int i=0;i<14;i++) {
    3cce:	52af 007e      	addq.l #1,126(sp)
    3cd2:	720d           	moveq #13,d1
    3cd4:	b2af 007e      	cmp.l 126(sp),d1
    3cd8:	6c00 ff52      	bge.w 3c2c <TestZoom4PictureOn5Planes+0x19c>
    }
  }
  for(int i2=0;i2<4;i2++) { 
    3cdc:	42af 006e      	clr.l 110(sp)
    3ce0:	6044           	bra.s 3d26 <TestZoom4PictureOn5Planes+0x296>
    for( int i3=0;i3<5;i3++) {
    3ce2:	42af 006a      	clr.l 106(sp)
    3ce6:	602e           	bra.s 3d16 <TestZoom4PictureOn5Planes+0x286>
      TestRow( valsupposed, valactual, mask, i2+265);
    3ce8:	222f 006e      	move.l 110(sp),d1
    3cec:	0681 0000 0109 	addi.l #265,d1
    3cf2:	7000           	moveq #0,d0
    3cf4:	302f 0082      	move.w 130(sp),d0
    3cf8:	2f01           	move.l d1,-(sp)
    3cfa:	2f00           	move.l d0,-(sp)
    3cfc:	2f2f 008c      	move.l 140(sp),-(sp)
    3d00:	2f2f 0052      	move.l 82(sp),-(sp)
    3d04:	4eba 2ed8      	jsr 6bde <TestRow>(pc)
    3d08:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3d0c:	702a           	moveq #42,d0
    3d0e:	d1af 0084      	add.l d0,132(sp)
    for( int i3=0;i3<5;i3++) {
    3d12:	52af 006a      	addq.l #1,106(sp)
    3d16:	7204           	moveq #4,d1
    3d18:	b2af 006a      	cmp.l 106(sp),d1
    3d1c:	6cca           	bge.s 3ce8 <TestZoom4PictureOn5Planes+0x258>
    }
    mask = mask ^ 0xffff;
    3d1e:	466f 0082      	not.w 130(sp)
  for(int i2=0;i2<4;i2++) { 
    3d22:	52af 006e      	addq.l #1,110(sp)
    3d26:	7003           	moveq #3,d0
    3d28:	b0af 006e      	cmp.l 110(sp),d0
    3d2c:	6cb4           	bge.s 3ce2 <TestZoom4PictureOn5Planes+0x252>
  } 
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    3d2e:	2f6f 005a 0042 	move.l 90(sp),66(sp)
    3d34:	2f7c 0000 f460 	move.l #62560,62(sp)
    3d3a:	003e 
    3d3c:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    3d42:	2c40           	movea.l d0,a6
    3d44:	226f 0042      	movea.l 66(sp),a1
    3d48:	202f 003e      	move.l 62(sp),d0
    3d4c:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    3d50:	2f6f 004a 003a 	move.l 74(sp),58(sp)
    3d56:	2f7c 0000 f460 	move.l #62560,54(sp)
    3d5c:	0036 
    3d5e:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    3d64:	2c40           	movea.l d0,a6
    3d66:	226f 003a      	movea.l 58(sp),a1
    3d6a:	202f 0036      	move.l 54(sp),d0
    3d6e:	4eae ff2e      	jsr -210(a6)
}
    3d72:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3d76:	4fef 008c      	lea 140(sp),sp
    3d7a:	4e75           	rts

00003d7c <TestZoom4Picture>:

void TestZoom4Picture() {
    3d7c:	4fef fe30      	lea -464(sp),sp
    3d80:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3d84:	2f7c 0000 30e0 	move.l #12512,106(sp)
    3d8a:	006a 
    3d8c:	7002           	moveq #2,d0
    3d8e:	2f40 0066      	move.l d0,102(sp)
    3d92:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    3d98:	2c40           	movea.l d0,a6
    3d9a:	202f 006a      	move.l 106(sp),d0
    3d9e:	222f 0066      	move.l 102(sp),d1
    3da2:	4eae ff3a      	jsr -198(a6)
    3da6:	2f40 0062      	move.l d0,98(sp)
    3daa:	202f 0062      	move.l 98(sp),d0
    3dae:	2f40 005e      	move.l d0,94(sp)
  if( source == 0) {
    3db2:	6646           	bne.s 3dfa <TestZoom4Picture+0x7e>
    Write(  Output(), 
    3db4:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3dba:	2c40           	movea.l d0,a6
    3dbc:	4eae ffc4      	jsr -60(a6)
    3dc0:	2f40 001e      	move.l d0,30(sp)
    3dc4:	202f 001e      	move.l 30(sp),d0
    3dc8:	2f40 001a      	move.l d0,26(sp)
    3dcc:	2f7c 0000 850f 	move.l #34063,22(sp)
    3dd2:	0016 
    3dd4:	7239           	moveq #57,d1
    3dd6:	2f41 0012      	move.l d1,18(sp)
    3dda:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3de0:	2c40           	movea.l d0,a6
    3de2:	222f 001a      	move.l 26(sp),d1
    3de6:	242f 0016      	move.l 22(sp),d2
    3dea:	262f 0012      	move.l 18(sp),d3
    3dee:	4eae ffd0      	jsr -48(a6)
    3df2:	2f40 000e      	move.l d0,14(sp)
    3df6:	6000 2ddc      	bra.w 6bd4 <TestZoom4Picture+0x2e58>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3dfa:	2f7c 0000 30e0 	move.l #12512,90(sp)
    3e00:	005a 
    3e02:	7002           	moveq #2,d0
    3e04:	2f40 0056      	move.l d0,86(sp)
    3e08:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    3e0e:	2c40           	movea.l d0,a6
    3e10:	202f 005a      	move.l 90(sp),d0
    3e14:	222f 0056      	move.l 86(sp),d1
    3e18:	4eae ff3a      	jsr -198(a6)
    3e1c:	2f40 0052      	move.l d0,82(sp)
    3e20:	202f 0052      	move.l 82(sp),d0
    3e24:	2f40 004e      	move.l d0,78(sp)
  if( destination == 0) {
    3e28:	6646           	bne.s 3e70 <TestZoom4Picture+0xf4>
    Write(  Output(), 
    3e2a:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3e30:	2c40           	movea.l d0,a6
    3e32:	4eae ffc4      	jsr -60(a6)
    3e36:	2f40 0032      	move.l d0,50(sp)
    3e3a:	202f 0032      	move.l 50(sp),d0
    3e3e:	2f40 002e      	move.l d0,46(sp)
    3e42:	2f7c 0000 8549 	move.l #34121,42(sp)
    3e48:	002a 
    3e4a:	723d           	moveq #61,d1
    3e4c:	2f41 0026      	move.l d1,38(sp)
    3e50:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    3e56:	2c40           	movea.l d0,a6
    3e58:	222f 002e      	move.l 46(sp),d1
    3e5c:	242f 002a      	move.l 42(sp),d2
    3e60:	262f 0026      	move.l 38(sp),d3
    3e64:	4eae ffd0      	jsr -48(a6)
    3e68:	2f40 0022      	move.l d0,34(sp)
    3e6c:	6000 2d66      	bra.w 6bd4 <TestZoom4Picture+0x2e58>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3e70:	2f6f 005e 01d8 	move.l 94(sp),472(sp)
  for(int i=0;i<128+8;i++) {
    3e76:	42af 01d4      	clr.l 468(sp)
    3e7a:	6050           	bra.s 3ecc <TestZoom4Picture+0x150>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e7c:	42af 01d0      	clr.l 464(sp)
    3e80:	6018           	bra.s 3e9a <TestZoom4Picture+0x11e>
      *tmp4source++ = 0x55555555;
    3e82:	202f 01d8      	move.l 472(sp),d0
    3e86:	2200           	move.l d0,d1
    3e88:	5881           	addq.l #4,d1
    3e8a:	2f41 01d8      	move.l d1,472(sp)
    3e8e:	2040           	movea.l d0,a0
    3e90:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e96:	52af 01d0      	addq.l #1,464(sp)
    3e9a:	7009           	moveq #9,d0
    3e9c:	b0af 01d0      	cmp.l 464(sp),d0
    3ea0:	6ce0           	bge.s 3e82 <TestZoom4Picture+0x106>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3ea2:	42af 01cc      	clr.l 460(sp)
    3ea6:	6018           	bra.s 3ec0 <TestZoom4Picture+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3ea8:	202f 01d8      	move.l 472(sp),d0
    3eac:	2200           	move.l d0,d1
    3eae:	5881           	addq.l #4,d1
    3eb0:	2f41 01d8      	move.l d1,472(sp)
    3eb4:	2040           	movea.l d0,a0
    3eb6:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3ebc:	52af 01cc      	addq.l #1,460(sp)
    3ec0:	7009           	moveq #9,d0
    3ec2:	b0af 01cc      	cmp.l 460(sp),d0
    3ec6:	6ce0           	bge.s 3ea8 <TestZoom4Picture+0x12c>
  for(int i=0;i<128+8;i++) {
    3ec8:	52af 01d4      	addq.l #1,468(sp)
    3ecc:	0caf 0000 0087 	cmpi.l #135,468(sp)
    3ed2:	01d4 
    3ed4:	6fa6           	ble.s 3e7c <TestZoom4Picture+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    3ed6:	4878 0001      	pea 1 <_start+0x1>
    3eda:	42a7           	clr.l -(sp)
    3edc:	2f2f 0056      	move.l 86(sp),-(sp)
    3ee0:	2f2f 006a      	move.l 106(sp),-(sp)
    3ee4:	4eba dc4e      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    3ee8:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3eec:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    3ef2:	2c40           	movea.l d0,a6
    3ef4:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3ef8:	222f 004e      	move.l 78(sp),d1
    3efc:	5881           	addq.l #4,d1
    3efe:	2f41 01c8      	move.l d1,456(sp)
  UWORD *valsupposed = destlinezoom1;
    3f02:	2f7c 0000 bb68 	move.l #47976,74(sp)
    3f08:	004a 
  UWORD mask = 0xffff;
    3f0a:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<14;i++) {
    3f10:	42af 01c2      	clr.l 450(sp)
    3f14:	6000 0084      	bra.w 3f9a <TestZoom4Picture+0x21e>
    for(int i2=0;i2<18;i2++) { 
    3f18:	42af 01be      	clr.l 446(sp)
    3f1c:	603c           	bra.s 3f5a <TestZoom4Picture+0x1de>
      TestRow( valsupposed, valactual, mask, i2+i*19);
    3f1e:	222f 01c2      	move.l 450(sp),d1
    3f22:	2001           	move.l d1,d0
    3f24:	e788           	lsl.l #3,d0
    3f26:	d081           	add.l d1,d0
    3f28:	d080           	add.l d0,d0
    3f2a:	d081           	add.l d1,d0
    3f2c:	2200           	move.l d0,d1
    3f2e:	d2af 01be      	add.l 446(sp),d1
    3f32:	7000           	moveq #0,d0
    3f34:	302f 01c6      	move.w 454(sp),d0
    3f38:	2f01           	move.l d1,-(sp)
    3f3a:	2f00           	move.l d0,-(sp)
    3f3c:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f40:	2f2f 0056      	move.l 86(sp),-(sp)
    3f44:	4eba 2c98      	jsr 6bde <TestRow>(pc)
    3f48:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3f4c:	702a           	moveq #42,d0
    3f4e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    3f52:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) { 
    3f56:	52af 01be      	addq.l #1,446(sp)
    3f5a:	7211           	moveq #17,d1
    3f5c:	b2af 01be      	cmp.l 446(sp),d1
    3f60:	6cbc           	bge.s 3f1e <TestZoom4Picture+0x1a2>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    3f62:	222f 01c2      	move.l 450(sp),d1
    3f66:	2001           	move.l d1,d0
    3f68:	e788           	lsl.l #3,d0
    3f6a:	d081           	add.l d1,d0
    3f6c:	d080           	add.l d0,d0
    3f6e:	2040           	movea.l d0,a0
    3f70:	d1c1           	adda.l d1,a0
    3f72:	41e8 0012      	lea 18(a0),a0
    3f76:	7000           	moveq #0,d0
    3f78:	302f 01c6      	move.w 454(sp),d0
    3f7c:	2f08           	move.l a0,-(sp)
    3f7e:	2f00           	move.l d0,-(sp)
    3f80:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f84:	2f2f 0056      	move.l 86(sp),-(sp)
    3f88:	4eba 2c54      	jsr 6bde <TestRow>(pc)
    3f8c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f90:	702a           	moveq #42,d0
    3f92:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<14;i++) {
    3f96:	52af 01c2      	addq.l #1,450(sp)
    3f9a:	720d           	moveq #13,d1
    3f9c:	b2af 01c2      	cmp.l 450(sp),d1
    3fa0:	6c00 ff76      	bge.w 3f18 <TestZoom4Picture+0x19c>
  }

  for(int i2=0;i2<4;i2++) { 
    3fa4:	42af 01ba      	clr.l 442(sp)
    3fa8:	6032           	bra.s 3fdc <TestZoom4Picture+0x260>
    TestRow( valsupposed, valactual, mask, i2+265);
    3faa:	222f 01ba      	move.l 442(sp),d1
    3fae:	0681 0000 0109 	addi.l #265,d1
    3fb4:	7000           	moveq #0,d0
    3fb6:	302f 01c6      	move.w 454(sp),d0
    3fba:	2f01           	move.l d1,-(sp)
    3fbc:	2f00           	move.l d0,-(sp)
    3fbe:	2f2f 01d0      	move.l 464(sp),-(sp)
    3fc2:	2f2f 0056      	move.l 86(sp),-(sp)
    3fc6:	4eba 2c16      	jsr 6bde <TestRow>(pc)
    3fca:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3fce:	702a           	moveq #42,d0
    3fd0:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    3fd4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    3fd8:	52af 01ba      	addq.l #1,442(sp)
    3fdc:	7203           	moveq #3,d1
    3fde:	b2af 01ba      	cmp.l 442(sp),d1
    3fe2:	6cc6           	bge.s 3faa <TestZoom4Picture+0x22e>
  }
  
  UWORD *tmp = source;
    3fe4:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    3fea:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    3ff0:	2f6f 0046 004e 	move.l 70(sp),78(sp)
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    3ff6:	4878 0001      	pea 1 <_start+0x1>
    3ffa:	4878 0001      	pea 1 <_start+0x1>
    3ffe:	2f2f 0056      	move.l 86(sp),-(sp)
    4002:	2f2f 006a      	move.l 106(sp),-(sp)
    4006:	4eba db2c      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    400a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    400e:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    4014:	2c40           	movea.l d0,a6
    4016:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    401a:	202f 004e      	move.l 78(sp),d0
    401e:	5880           	addq.l #4,d0
    4020:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom2;
    4024:	2f7c 0000 bb94 	move.l #48020,74(sp)
    402a:	004a 
  mask = 0x0000;
    402c:	426f 01c6      	clr.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    4030:	42af 01b6      	clr.l 438(sp)
    4034:	602a           	bra.s 4060 <TestZoom4Picture+0x2e4>
    TestRow( valsupposed, valactual, mask, i2);
    4036:	7000           	moveq #0,d0
    4038:	302f 01c6      	move.w 454(sp),d0
    403c:	2f2f 01b6      	move.l 438(sp),-(sp)
    4040:	2f00           	move.l d0,-(sp)
    4042:	2f2f 01d0      	move.l 464(sp),-(sp)
    4046:	2f2f 0056      	move.l 86(sp),-(sp)
    404a:	4eba 2b92      	jsr 6bde <TestRow>(pc)
    404e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4052:	722a           	moveq #42,d1
    4054:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4058:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    405c:	52af 01b6      	addq.l #1,438(sp)
    4060:	700a           	moveq #10,d0
    4062:	b0af 01b6      	cmp.l 438(sp),d0
    4066:	6cce           	bge.s 4036 <TestZoom4Picture+0x2ba>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    4068:	4878 0008      	pea 8 <_start+0x8>
    406c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4072:	2f2f 01d0      	move.l 464(sp),-(sp)
    4076:	2f2f 0056      	move.l 86(sp),-(sp)
    407a:	4eba 2b62      	jsr 6bde <TestRow>(pc)
    407e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4082:	722a           	moveq #42,d1
    4084:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 9);
    4088:	4878 0009      	pea 9 <_start+0x9>
    408c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4092:	2f2f 01d0      	move.l 464(sp),-(sp)
    4096:	2f2f 0056      	move.l 86(sp),-(sp)
    409a:	4eba 2b42      	jsr 6bde <TestRow>(pc)
    409e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    40a2:	702a           	moveq #42,d0
    40a4:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 10);
    40a8:	4878 000a      	pea a <_start+0xa>
    40ac:	42a7           	clr.l -(sp)
    40ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    40b2:	2f2f 0056      	move.l 86(sp),-(sp)
    40b6:	4eba 2b26      	jsr 6bde <TestRow>(pc)
    40ba:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    40be:	722a           	moveq #42,d1
    40c0:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 11);
    40c4:	4878 000b      	pea b <_start+0xb>
    40c8:	42a7           	clr.l -(sp)
    40ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    40ce:	2f2f 0056      	move.l 86(sp),-(sp)
    40d2:	4eba 2b0a      	jsr 6bde <TestRow>(pc)
    40d6:	4fef 0010      	lea 16(sp),sp

  valactual += ZMLINESIZE/2;
    40da:	702a           	moveq #42,d0
    40dc:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<12;i++) {
    40e0:	42af 01b2      	clr.l 434(sp)
    40e4:	6000 0118      	bra.w 41fe <TestZoom4Picture+0x482>
    for(int i2=0;i2<16;i2++) {  
    40e8:	42af 01ae      	clr.l 430(sp)
    40ec:	603c           	bra.s 412a <TestZoom4Picture+0x3ae>
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    40ee:	222f 01b2      	move.l 434(sp),d1
    40f2:	2001           	move.l d1,d0
    40f4:	e988           	lsl.l #4,d0
    40f6:	d081           	add.l d1,d0
    40f8:	2040           	movea.l d0,a0
    40fa:	d1ef 01ae      	adda.l 430(sp),a0
    40fe:	41e8 000b      	lea 11(a0),a0
    4102:	7000           	moveq #0,d0
    4104:	302f 01c6      	move.w 454(sp),d0
    4108:	2f08           	move.l a0,-(sp)
    410a:	2f00           	move.l d0,-(sp)
    410c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4110:	2f2f 0056      	move.l 86(sp),-(sp)
    4114:	4eba 2ac8      	jsr 6bde <TestRow>(pc)
    4118:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    411c:	722a           	moveq #42,d1
    411e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4122:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {  
    4126:	52af 01ae      	addq.l #1,430(sp)
    412a:	700f           	moveq #15,d0
    412c:	b0af 01ae      	cmp.l 430(sp),d0
    4130:	6cbc           	bge.s 40ee <TestZoom4Picture+0x372>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    4132:	222f 01b2      	move.l 434(sp),d1
    4136:	2001           	move.l d1,d0
    4138:	e988           	lsl.l #4,d0
    413a:	2040           	movea.l d0,a0
    413c:	d1c1           	adda.l d1,a0
    413e:	41e8 0018      	lea 24(a0),a0
    4142:	7000           	moveq #0,d0
    4144:	302f 01c6      	move.w 454(sp),d0
    4148:	2f08           	move.l a0,-(sp)
    414a:	2f00           	move.l d0,-(sp)
    414c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4150:	2f2f 0056      	move.l 86(sp),-(sp)
    4154:	4eba 2a88      	jsr 6bde <TestRow>(pc)
    4158:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    415c:	722a           	moveq #42,d1
    415e:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    4162:	222f 01b2      	move.l 434(sp),d1
    4166:	2001           	move.l d1,d0
    4168:	e988           	lsl.l #4,d0
    416a:	2040           	movea.l d0,a0
    416c:	d1c1           	adda.l d1,a0
    416e:	41e8 0019      	lea 25(a0),a0
    4172:	7000           	moveq #0,d0
    4174:	302f 01c6      	move.w 454(sp),d0
    4178:	2f08           	move.l a0,-(sp)
    417a:	2f00           	move.l d0,-(sp)
    417c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4180:	2f2f 0056      	move.l 86(sp),-(sp)
    4184:	4eba 2a58      	jsr 6bde <TestRow>(pc)
    4188:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    418c:	702a           	moveq #42,d0
    418e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4192:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    4196:	222f 01b2      	move.l 434(sp),d1
    419a:	2001           	move.l d1,d0
    419c:	e988           	lsl.l #4,d0
    419e:	2040           	movea.l d0,a0
    41a0:	d1c1           	adda.l d1,a0
    41a2:	41e8 001a      	lea 26(a0),a0
    41a6:	7000           	moveq #0,d0
    41a8:	302f 01c6      	move.w 454(sp),d0
    41ac:	2f08           	move.l a0,-(sp)
    41ae:	2f00           	move.l d0,-(sp)
    41b0:	2f2f 01d0      	move.l 464(sp),-(sp)
    41b4:	2f2f 0056      	move.l 86(sp),-(sp)
    41b8:	4eba 2a24      	jsr 6bde <TestRow>(pc)
    41bc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    41c0:	722a           	moveq #42,d1
    41c2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    41c6:	222f 01b2      	move.l 434(sp),d1
    41ca:	2001           	move.l d1,d0
    41cc:	e988           	lsl.l #4,d0
    41ce:	2040           	movea.l d0,a0
    41d0:	d1c1           	adda.l d1,a0
    41d2:	41e8 001b      	lea 27(a0),a0
    41d6:	7000           	moveq #0,d0
    41d8:	302f 01c6      	move.w 454(sp),d0
    41dc:	2f08           	move.l a0,-(sp)
    41de:	2f00           	move.l d0,-(sp)
    41e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    41e4:	2f2f 0056      	move.l 86(sp),-(sp)
    41e8:	4eba 29f4      	jsr 6bde <TestRow>(pc)
    41ec:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    41f0:	702a           	moveq #42,d0
    41f2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    41f6:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    41fa:	52af 01b2      	addq.l #1,434(sp)
    41fe:	720b           	moveq #11,d1
    4200:	b2af 01b2      	cmp.l 434(sp),d1
    4204:	6c00 fee2      	bge.w 40e8 <TestZoom4Picture+0x36c>
    
  }

  for(int i2=0;i2<15;i2++) { 
    4208:	42af 01aa      	clr.l 426(sp)
    420c:	602a           	bra.s 4238 <TestZoom4Picture+0x4bc>
    TestRow( valsupposed, valactual, mask, i2);
    420e:	7000           	moveq #0,d0
    4210:	302f 01c6      	move.w 454(sp),d0
    4214:	2f2f 01aa      	move.l 426(sp),-(sp)
    4218:	2f00           	move.l d0,-(sp)
    421a:	2f2f 01d0      	move.l 464(sp),-(sp)
    421e:	2f2f 0056      	move.l 86(sp),-(sp)
    4222:	4eba 29ba      	jsr 6bde <TestRow>(pc)
    4226:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    422a:	702a           	moveq #42,d0
    422c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4230:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<15;i2++) { 
    4234:	52af 01aa      	addq.l #1,426(sp)
    4238:	720e           	moveq #14,d1
    423a:	b2af 01aa      	cmp.l 426(sp),d1
    423e:	6cce           	bge.s 420e <TestZoom4Picture+0x492>
  }

  tmp = source;
    4240:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4246:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    424c:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    4252:	4878 0001      	pea 1 <_start+0x1>
    4256:	4878 0002      	pea 2 <_start+0x2>
    425a:	2f2f 0056      	move.l 86(sp),-(sp)
    425e:	2f2f 006a      	move.l 106(sp),-(sp)
    4262:	4eba d8d0      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    4266:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    426a:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    4270:	2c40           	movea.l d0,a6
    4272:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4276:	202f 004e      	move.l 78(sp),d0
    427a:	5880           	addq.l #4,d0
    427c:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom3;
    4280:	2f7c 0000 bbc0 	move.l #48064,74(sp)
    4286:	004a 
  mask = 0xffff;
    4288:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<4;i2++) { 
    428e:	42af 01a6      	clr.l 422(sp)
    4292:	602a           	bra.s 42be <TestZoom4Picture+0x542>
    TestRow( valsupposed, valactual, mask, i2);
    4294:	7000           	moveq #0,d0
    4296:	302f 01c6      	move.w 454(sp),d0
    429a:	2f2f 01a6      	move.l 422(sp),-(sp)
    429e:	2f00           	move.l d0,-(sp)
    42a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    42a4:	2f2f 0056      	move.l 86(sp),-(sp)
    42a8:	4eba 2934      	jsr 6bde <TestRow>(pc)
    42ac:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    42b0:	722a           	moveq #42,d1
    42b2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    42b6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    42ba:	52af 01a6      	addq.l #1,422(sp)
    42be:	7003           	moveq #3,d0
    42c0:	b0af 01a6      	cmp.l 422(sp),d0
    42c4:	6cce           	bge.s 4294 <TestZoom4Picture+0x518>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    42c6:	4878 0004      	pea 4 <_start+0x4>
    42ca:	2f3c 0000 ffff 	move.l #65535,-(sp)
    42d0:	2f2f 01d0      	move.l 464(sp),-(sp)
    42d4:	2f2f 0056      	move.l 86(sp),-(sp)
    42d8:	4eba 2904      	jsr 6bde <TestRow>(pc)
    42dc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42e0:	722a           	moveq #42,d1
    42e2:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    42e6:	4878 0005      	pea 5 <_start+0x5>
    42ea:	2f3c 0000 ffff 	move.l #65535,-(sp)
    42f0:	2f2f 01d0      	move.l 464(sp),-(sp)
    42f4:	2f2f 0056      	move.l 86(sp),-(sp)
    42f8:	4eba 28e4      	jsr 6bde <TestRow>(pc)
    42fc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4300:	702a           	moveq #42,d0
    4302:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    4306:	4878 0006      	pea 6 <_start+0x6>
    430a:	42a7           	clr.l -(sp)
    430c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4310:	2f2f 0056      	move.l 86(sp),-(sp)
    4314:	4eba 28c8      	jsr 6bde <TestRow>(pc)
    4318:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    431c:	722a           	moveq #42,d1
    431e:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    4322:	4878 0007      	pea 7 <_start+0x7>
    4326:	42a7           	clr.l -(sp)
    4328:	2f2f 01d0      	move.l 464(sp),-(sp)
    432c:	2f2f 0056      	move.l 86(sp),-(sp)
    4330:	4eba 28ac      	jsr 6bde <TestRow>(pc)
    4334:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4338:	702a           	moveq #42,d0
    433a:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    433e:	4878 0008      	pea 8 <_start+0x8>
    4342:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4348:	2f2f 01d0      	move.l 464(sp),-(sp)
    434c:	2f2f 0056      	move.l 86(sp),-(sp)
    4350:	4eba 288c      	jsr 6bde <TestRow>(pc)
    4354:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4358:	722a           	moveq #42,d1
    435a:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    435e:	4878 0009      	pea 9 <_start+0x9>
    4362:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4368:	2f2f 01d0      	move.l 464(sp),-(sp)
    436c:	2f2f 0056      	move.l 86(sp),-(sp)
    4370:	4eba 286c      	jsr 6bde <TestRow>(pc)
    4374:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4378:	702a           	moveq #42,d0
    437a:	d1af 01c8      	add.l d0,456(sp)

  mask = 0x0000;
    437e:	426f 01c6      	clr.w 454(sp)
  for(int i=0;i<12;i++) {
    4382:	42af 01a2      	clr.l 418(sp)
    4386:	6000 01a6      	bra.w 452e <TestZoom4Picture+0x7b2>
    for(int i2=0;i2<15;i2++) {  
    438a:	42af 019e      	clr.l 414(sp)
    438e:	6042           	bra.s 43d2 <TestZoom4Picture+0x656>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    4390:	222f 01a2      	move.l 418(sp),d1
    4394:	2001           	move.l d1,d0
    4396:	d080           	add.l d0,d0
    4398:	d081           	add.l d1,d0
    439a:	2200           	move.l d0,d1
    439c:	e789           	lsl.l #3,d1
    439e:	9280           	sub.l d0,d1
    43a0:	2041           	movea.l d1,a0
    43a2:	d1ef 019e      	adda.l 414(sp),a0
    43a6:	41e8 0009      	lea 9(a0),a0
    43aa:	7000           	moveq #0,d0
    43ac:	302f 01c6      	move.w 454(sp),d0
    43b0:	2f08           	move.l a0,-(sp)
    43b2:	2f00           	move.l d0,-(sp)
    43b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    43b8:	2f2f 0056      	move.l 86(sp),-(sp)
    43bc:	4eba 2820      	jsr 6bde <TestRow>(pc)
    43c0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    43c4:	722a           	moveq #42,d1
    43c6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    43ca:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {  
    43ce:	52af 019e      	addq.l #1,414(sp)
    43d2:	700e           	moveq #14,d0
    43d4:	b0af 019e      	cmp.l 414(sp),d0
    43d8:	6cb6           	bge.s 4390 <TestZoom4Picture+0x614>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    43da:	222f 01a2      	move.l 418(sp),d1
    43de:	2001           	move.l d1,d0
    43e0:	d080           	add.l d0,d0
    43e2:	d081           	add.l d1,d0
    43e4:	2200           	move.l d0,d1
    43e6:	e789           	lsl.l #3,d1
    43e8:	2041           	movea.l d1,a0
    43ea:	91c0           	suba.l d0,a0
    43ec:	41e8 0018      	lea 24(a0),a0
    43f0:	7000           	moveq #0,d0
    43f2:	302f 01c6      	move.w 454(sp),d0
    43f6:	2f08           	move.l a0,-(sp)
    43f8:	2f00           	move.l d0,-(sp)
    43fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    43fe:	2f2f 0056      	move.l 86(sp),-(sp)
    4402:	4eba 27da      	jsr 6bde <TestRow>(pc)
    4406:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    440a:	722a           	moveq #42,d1
    440c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    4410:	222f 01a2      	move.l 418(sp),d1
    4414:	2001           	move.l d1,d0
    4416:	d080           	add.l d0,d0
    4418:	d081           	add.l d1,d0
    441a:	2200           	move.l d0,d1
    441c:	e789           	lsl.l #3,d1
    441e:	2041           	movea.l d1,a0
    4420:	91c0           	suba.l d0,a0
    4422:	41e8 0019      	lea 25(a0),a0
    4426:	7000           	moveq #0,d0
    4428:	302f 01c6      	move.w 454(sp),d0
    442c:	2f08           	move.l a0,-(sp)
    442e:	2f00           	move.l d0,-(sp)
    4430:	2f2f 01d0      	move.l 464(sp),-(sp)
    4434:	2f2f 0056      	move.l 86(sp),-(sp)
    4438:	4eba 27a4      	jsr 6bde <TestRow>(pc)
    443c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4440:	702a           	moveq #42,d0
    4442:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4446:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    444a:	222f 01a2      	move.l 418(sp),d1
    444e:	2001           	move.l d1,d0
    4450:	d080           	add.l d0,d0
    4452:	d081           	add.l d1,d0
    4454:	2200           	move.l d0,d1
    4456:	e789           	lsl.l #3,d1
    4458:	2041           	movea.l d1,a0
    445a:	91c0           	suba.l d0,a0
    445c:	41e8 001a      	lea 26(a0),a0
    4460:	7000           	moveq #0,d0
    4462:	302f 01c6      	move.w 454(sp),d0
    4466:	2f08           	move.l a0,-(sp)
    4468:	2f00           	move.l d0,-(sp)
    446a:	2f2f 01d0      	move.l 464(sp),-(sp)
    446e:	2f2f 0056      	move.l 86(sp),-(sp)
    4472:	4eba 276a      	jsr 6bde <TestRow>(pc)
    4476:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    447a:	722a           	moveq #42,d1
    447c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    4480:	222f 01a2      	move.l 418(sp),d1
    4484:	2001           	move.l d1,d0
    4486:	d080           	add.l d0,d0
    4488:	d081           	add.l d1,d0
    448a:	2200           	move.l d0,d1
    448c:	e789           	lsl.l #3,d1
    448e:	2041           	movea.l d1,a0
    4490:	91c0           	suba.l d0,a0
    4492:	41e8 001b      	lea 27(a0),a0
    4496:	7000           	moveq #0,d0
    4498:	302f 01c6      	move.w 454(sp),d0
    449c:	2f08           	move.l a0,-(sp)
    449e:	2f00           	move.l d0,-(sp)
    44a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    44a4:	2f2f 0056      	move.l 86(sp),-(sp)
    44a8:	4eba 2734      	jsr 6bde <TestRow>(pc)
    44ac:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    44b0:	702a           	moveq #42,d0
    44b2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    44b6:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    44ba:	222f 01a2      	move.l 418(sp),d1
    44be:	2001           	move.l d1,d0
    44c0:	d080           	add.l d0,d0
    44c2:	d081           	add.l d1,d0
    44c4:	2200           	move.l d0,d1
    44c6:	e789           	lsl.l #3,d1
    44c8:	2041           	movea.l d1,a0
    44ca:	91c0           	suba.l d0,a0
    44cc:	41e8 001c      	lea 28(a0),a0
    44d0:	7000           	moveq #0,d0
    44d2:	302f 01c6      	move.w 454(sp),d0
    44d6:	2f08           	move.l a0,-(sp)
    44d8:	2f00           	move.l d0,-(sp)
    44da:	2f2f 01d0      	move.l 464(sp),-(sp)
    44de:	2f2f 0056      	move.l 86(sp),-(sp)
    44e2:	4eba 26fa      	jsr 6bde <TestRow>(pc)
    44e6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    44ea:	722a           	moveq #42,d1
    44ec:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    44f0:	222f 01a2      	move.l 418(sp),d1
    44f4:	2001           	move.l d1,d0
    44f6:	d080           	add.l d0,d0
    44f8:	d081           	add.l d1,d0
    44fa:	2200           	move.l d0,d1
    44fc:	e789           	lsl.l #3,d1
    44fe:	2041           	movea.l d1,a0
    4500:	91c0           	suba.l d0,a0
    4502:	41e8 001d      	lea 29(a0),a0
    4506:	7000           	moveq #0,d0
    4508:	302f 01c6      	move.w 454(sp),d0
    450c:	2f08           	move.l a0,-(sp)
    450e:	2f00           	move.l d0,-(sp)
    4510:	2f2f 01d0      	move.l 464(sp),-(sp)
    4514:	2f2f 0056      	move.l 86(sp),-(sp)
    4518:	4eba 26c4      	jsr 6bde <TestRow>(pc)
    451c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4520:	702a           	moveq #42,d0
    4522:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4526:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    452a:	52af 01a2      	addq.l #1,418(sp)
    452e:	720b           	moveq #11,d1
    4530:	b2af 01a2      	cmp.l 418(sp),d1
    4534:	6c00 fe54      	bge.w 438a <TestZoom4Picture+0x60e>
  }

  for(int i2=0;i2<8;i2++) {  
    4538:	42af 019a      	clr.l 410(sp)
    453c:	6032           	bra.s 4570 <TestZoom4Picture+0x7f4>
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    453e:	222f 019a      	move.l 410(sp),d1
    4542:	0681 0000 0105 	addi.l #261,d1
    4548:	7000           	moveq #0,d0
    454a:	302f 01c6      	move.w 454(sp),d0
    454e:	2f01           	move.l d1,-(sp)
    4550:	2f00           	move.l d0,-(sp)
    4552:	2f2f 01d0      	move.l 464(sp),-(sp)
    4556:	2f2f 0056      	move.l 86(sp),-(sp)
    455a:	4eba 2682      	jsr 6bde <TestRow>(pc)
    455e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4562:	702a           	moveq #42,d0
    4564:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4568:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    456c:	52af 019a      	addq.l #1,410(sp)
    4570:	7207           	moveq #7,d1
    4572:	b2af 019a      	cmp.l 410(sp),d1
    4576:	6cc6           	bge.s 453e <TestZoom4Picture+0x7c2>
  }

  tmp = source;
    4578:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    457e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4584:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    458a:	4878 0001      	pea 1 <_start+0x1>
    458e:	4878 0003      	pea 3 <_start+0x3>
    4592:	2f2f 0056      	move.l 86(sp),-(sp)
    4596:	2f2f 006a      	move.l 106(sp),-(sp)
    459a:	4eba d598      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    459e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    45a2:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    45a8:	2c40           	movea.l d0,a6
    45aa:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    45ae:	202f 004e      	move.l 78(sp),d0
    45b2:	5880           	addq.l #4,d0
    45b4:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom4;
    45b8:	2f7c 0000 bbec 	move.l #48108,74(sp)
    45be:	004a 
  mask = 0x0000;
    45c0:	426f 01c6      	clr.w 454(sp)
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    45c4:	4878 0007      	pea 7 <_start+0x7>
    45c8:	42a7           	clr.l -(sp)
    45ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    45ce:	2f2f 0056      	move.l 86(sp),-(sp)
    45d2:	4eba 260a      	jsr 6bde <TestRow>(pc)
    45d6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    45da:	722a           	moveq #42,d1
    45dc:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    45e0:	4878 0008      	pea 8 <_start+0x8>
    45e4:	2f3c 0000 ffff 	move.l #65535,-(sp)
    45ea:	2f2f 01d0      	move.l 464(sp),-(sp)
    45ee:	2f2f 0056      	move.l 86(sp),-(sp)
    45f2:	4eba 25ea      	jsr 6bde <TestRow>(pc)
    45f6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    45fa:	702a           	moveq #42,d0
    45fc:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    4600:	4878 0009      	pea 9 <_start+0x9>
    4604:	2f3c 0000 ffff 	move.l #65535,-(sp)
    460a:	2f2f 01d0      	move.l 464(sp),-(sp)
    460e:	2f2f 0056      	move.l 86(sp),-(sp)
    4612:	4eba 25ca      	jsr 6bde <TestRow>(pc)
    4616:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    461a:	722a           	moveq #42,d1
    461c:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    4620:	4878 0008      	pea 8 <_start+0x8>
    4624:	42a7           	clr.l -(sp)
    4626:	2f2f 01d0      	move.l 464(sp),-(sp)
    462a:	2f2f 0056      	move.l 86(sp),-(sp)
    462e:	4eba 25ae      	jsr 6bde <TestRow>(pc)
    4632:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4636:	702a           	moveq #42,d0
    4638:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    463c:	4878 0009      	pea 9 <_start+0x9>
    4640:	42a7           	clr.l -(sp)
    4642:	2f2f 01d0      	move.l 464(sp),-(sp)
    4646:	2f2f 0056      	move.l 86(sp),-(sp)
    464a:	4eba 2592      	jsr 6bde <TestRow>(pc)
    464e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4652:	722a           	moveq #42,d1
    4654:	d3af 01c8      	add.l d1,456(sp)

  mask = 0xffff;
    4658:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<12;i++) {
    465e:	42af 0196      	clr.l 406(sp)
    4662:	6000 0216      	bra.w 487a <TestZoom4Picture+0xafe>
    for(int i2=0;i2<14;i2++) {  
    4666:	42af 0192      	clr.l 402(sp)
    466a:	6042           	bra.s 46ae <TestZoom4Picture+0x932>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    466c:	222f 0196      	move.l 406(sp),d1
    4670:	2001           	move.l d1,d0
    4672:	d080           	add.l d0,d0
    4674:	d081           	add.l d1,d0
    4676:	2200           	move.l d0,d1
    4678:	e789           	lsl.l #3,d1
    467a:	9280           	sub.l d0,d1
    467c:	2041           	movea.l d1,a0
    467e:	d1ef 0192      	adda.l 402(sp),a0
    4682:	41e8 0009      	lea 9(a0),a0
    4686:	7000           	moveq #0,d0
    4688:	302f 01c6      	move.w 454(sp),d0
    468c:	2f08           	move.l a0,-(sp)
    468e:	2f00           	move.l d0,-(sp)
    4690:	2f2f 01d0      	move.l 464(sp),-(sp)
    4694:	2f2f 0056      	move.l 86(sp),-(sp)
    4698:	4eba 2544      	jsr 6bde <TestRow>(pc)
    469c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    46a0:	702a           	moveq #42,d0
    46a2:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    46a6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {  
    46aa:	52af 0192      	addq.l #1,402(sp)
    46ae:	720d           	moveq #13,d1
    46b0:	b2af 0192      	cmp.l 402(sp),d1
    46b4:	6cb6           	bge.s 466c <TestZoom4Picture+0x8f0>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    46b6:	222f 0196      	move.l 406(sp),d1
    46ba:	2001           	move.l d1,d0
    46bc:	d080           	add.l d0,d0
    46be:	d081           	add.l d1,d0
    46c0:	2200           	move.l d0,d1
    46c2:	e789           	lsl.l #3,d1
    46c4:	2041           	movea.l d1,a0
    46c6:	91c0           	suba.l d0,a0
    46c8:	41e8 0018      	lea 24(a0),a0
    46cc:	7000           	moveq #0,d0
    46ce:	302f 01c6      	move.w 454(sp),d0
    46d2:	2f08           	move.l a0,-(sp)
    46d4:	2f00           	move.l d0,-(sp)
    46d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    46da:	2f2f 0056      	move.l 86(sp),-(sp)
    46de:	4eba 24fe      	jsr 6bde <TestRow>(pc)
    46e2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46e6:	702a           	moveq #42,d0
    46e8:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    46ec:	222f 0196      	move.l 406(sp),d1
    46f0:	2001           	move.l d1,d0
    46f2:	d080           	add.l d0,d0
    46f4:	d081           	add.l d1,d0
    46f6:	2200           	move.l d0,d1
    46f8:	e789           	lsl.l #3,d1
    46fa:	2041           	movea.l d1,a0
    46fc:	91c0           	suba.l d0,a0
    46fe:	41e8 0019      	lea 25(a0),a0
    4702:	7000           	moveq #0,d0
    4704:	302f 01c6      	move.w 454(sp),d0
    4708:	2f08           	move.l a0,-(sp)
    470a:	2f00           	move.l d0,-(sp)
    470c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4710:	2f2f 0056      	move.l 86(sp),-(sp)
    4714:	4eba 24c8      	jsr 6bde <TestRow>(pc)
    4718:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    471c:	722a           	moveq #42,d1
    471e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4722:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    4726:	222f 0196      	move.l 406(sp),d1
    472a:	2001           	move.l d1,d0
    472c:	d080           	add.l d0,d0
    472e:	d081           	add.l d1,d0
    4730:	2200           	move.l d0,d1
    4732:	e789           	lsl.l #3,d1
    4734:	2041           	movea.l d1,a0
    4736:	91c0           	suba.l d0,a0
    4738:	41e8 001a      	lea 26(a0),a0
    473c:	7000           	moveq #0,d0
    473e:	302f 01c6      	move.w 454(sp),d0
    4742:	2f08           	move.l a0,-(sp)
    4744:	2f00           	move.l d0,-(sp)
    4746:	2f2f 01d0      	move.l 464(sp),-(sp)
    474a:	2f2f 0056      	move.l 86(sp),-(sp)
    474e:	4eba 248e      	jsr 6bde <TestRow>(pc)
    4752:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4756:	702a           	moveq #42,d0
    4758:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    475c:	222f 0196      	move.l 406(sp),d1
    4760:	2001           	move.l d1,d0
    4762:	d080           	add.l d0,d0
    4764:	d081           	add.l d1,d0
    4766:	2200           	move.l d0,d1
    4768:	e789           	lsl.l #3,d1
    476a:	2041           	movea.l d1,a0
    476c:	91c0           	suba.l d0,a0
    476e:	41e8 001b      	lea 27(a0),a0
    4772:	7000           	moveq #0,d0
    4774:	302f 01c6      	move.w 454(sp),d0
    4778:	2f08           	move.l a0,-(sp)
    477a:	2f00           	move.l d0,-(sp)
    477c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4780:	2f2f 0056      	move.l 86(sp),-(sp)
    4784:	4eba 2458      	jsr 6bde <TestRow>(pc)
    4788:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    478c:	722a           	moveq #42,d1
    478e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4792:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4796:	222f 0196      	move.l 406(sp),d1
    479a:	2001           	move.l d1,d0
    479c:	d080           	add.l d0,d0
    479e:	d081           	add.l d1,d0
    47a0:	2200           	move.l d0,d1
    47a2:	e789           	lsl.l #3,d1
    47a4:	2041           	movea.l d1,a0
    47a6:	91c0           	suba.l d0,a0
    47a8:	41e8 001c      	lea 28(a0),a0
    47ac:	7000           	moveq #0,d0
    47ae:	302f 01c6      	move.w 454(sp),d0
    47b2:	2f08           	move.l a0,-(sp)
    47b4:	2f00           	move.l d0,-(sp)
    47b6:	2f2f 01d0      	move.l 464(sp),-(sp)
    47ba:	2f2f 0056      	move.l 86(sp),-(sp)
    47be:	4eba 241e      	jsr 6bde <TestRow>(pc)
    47c2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    47c6:	702a           	moveq #42,d0
    47c8:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    47cc:	222f 0196      	move.l 406(sp),d1
    47d0:	2001           	move.l d1,d0
    47d2:	d080           	add.l d0,d0
    47d4:	d081           	add.l d1,d0
    47d6:	2200           	move.l d0,d1
    47d8:	e789           	lsl.l #3,d1
    47da:	2041           	movea.l d1,a0
    47dc:	91c0           	suba.l d0,a0
    47de:	41e8 001d      	lea 29(a0),a0
    47e2:	7000           	moveq #0,d0
    47e4:	302f 01c6      	move.w 454(sp),d0
    47e8:	2f08           	move.l a0,-(sp)
    47ea:	2f00           	move.l d0,-(sp)
    47ec:	2f2f 01d0      	move.l 464(sp),-(sp)
    47f0:	2f2f 0056      	move.l 86(sp),-(sp)
    47f4:	4eba 23e8      	jsr 6bde <TestRow>(pc)
    47f8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    47fc:	722a           	moveq #42,d1
    47fe:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4802:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4806:	222f 0196      	move.l 406(sp),d1
    480a:	2001           	move.l d1,d0
    480c:	d080           	add.l d0,d0
    480e:	d081           	add.l d1,d0
    4810:	2200           	move.l d0,d1
    4812:	e789           	lsl.l #3,d1
    4814:	2041           	movea.l d1,a0
    4816:	91c0           	suba.l d0,a0
    4818:	41e8 001c      	lea 28(a0),a0
    481c:	7000           	moveq #0,d0
    481e:	302f 01c6      	move.w 454(sp),d0
    4822:	2f08           	move.l a0,-(sp)
    4824:	2f00           	move.l d0,-(sp)
    4826:	2f2f 01d0      	move.l 464(sp),-(sp)
    482a:	2f2f 0056      	move.l 86(sp),-(sp)
    482e:	4eba 23ae      	jsr 6bde <TestRow>(pc)
    4832:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4836:	702a           	moveq #42,d0
    4838:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    483c:	222f 0196      	move.l 406(sp),d1
    4840:	2001           	move.l d1,d0
    4842:	d080           	add.l d0,d0
    4844:	d081           	add.l d1,d0
    4846:	2200           	move.l d0,d1
    4848:	e789           	lsl.l #3,d1
    484a:	2041           	movea.l d1,a0
    484c:	91c0           	suba.l d0,a0
    484e:	41e8 001d      	lea 29(a0),a0
    4852:	7000           	moveq #0,d0
    4854:	302f 01c6      	move.w 454(sp),d0
    4858:	2f08           	move.l a0,-(sp)
    485a:	2f00           	move.l d0,-(sp)
    485c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4860:	2f2f 0056      	move.l 86(sp),-(sp)
    4864:	4eba 2378      	jsr 6bde <TestRow>(pc)
    4868:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    486c:	722a           	moveq #42,d1
    486e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4872:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    4876:	52af 0196      	addq.l #1,406(sp)
    487a:	700b           	moveq #11,d0
    487c:	b0af 0196      	cmp.l 406(sp),d0
    4880:	6c00 fde4      	bge.w 4666 <TestZoom4Picture+0x8ea>
  }

  TestRow( valsupposed, valactual, mask, 269);
    4884:	7000           	moveq #0,d0
    4886:	302f 01c6      	move.w 454(sp),d0
    488a:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    488e:	2f00           	move.l d0,-(sp)
    4890:	2f2f 01d0      	move.l 464(sp),-(sp)
    4894:	2f2f 0056      	move.l 86(sp),-(sp)
    4898:	4eba 2344      	jsr 6bde <TestRow>(pc)
    489c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48a0:	722a           	moveq #42,d1
    48a2:	d3af 01c8      	add.l d1,456(sp)
  
  tmp = source;
    48a6:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    48ac:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    48b2:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    48b8:	4878 0001      	pea 1 <_start+0x1>
    48bc:	4878 0004      	pea 4 <_start+0x4>
    48c0:	2f2f 0056      	move.l 86(sp),-(sp)
    48c4:	2f2f 006a      	move.l 106(sp),-(sp)
    48c8:	4eba d26a      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    48cc:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    48d0:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    48d6:	2c40           	movea.l d0,a6
    48d8:	4eae ff1c      	jsr -228(a6)

  valactual = destination+2; 
    48dc:	202f 004e      	move.l 78(sp),d0
    48e0:	5880           	addq.l #4,d0
    48e2:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom5;
    48e6:	2f7c 0000 bc18 	move.l #48152,74(sp)
    48ec:	004a 
  mask = 0x0000;
    48ee:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<13;i2++) {  
    48f2:	42af 018e      	clr.l 398(sp)
    48f6:	602a           	bra.s 4922 <TestZoom4Picture+0xba6>
    TestRow( valsupposed, valactual, mask, i2);
    48f8:	7000           	moveq #0,d0
    48fa:	302f 01c6      	move.w 454(sp),d0
    48fe:	2f2f 018e      	move.l 398(sp),-(sp)
    4902:	2f00           	move.l d0,-(sp)
    4904:	2f2f 01d0      	move.l 464(sp),-(sp)
    4908:	2f2f 0056      	move.l 86(sp),-(sp)
    490c:	4eba 22d0      	jsr 6bde <TestRow>(pc)
    4910:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4914:	722a           	moveq #42,d1
    4916:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    491a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    491e:	52af 018e      	addq.l #1,398(sp)
    4922:	700c           	moveq #12,d0
    4924:	b0af 018e      	cmp.l 398(sp),d0
    4928:	6cce           	bge.s 48f8 <TestZoom4Picture+0xb7c>
  }

  TestRow( valsupposed, valactual, mask, 12);   
    492a:	7000           	moveq #0,d0
    492c:	302f 01c6      	move.w 454(sp),d0
    4930:	4878 000c      	pea c <_start+0xc>
    4934:	2f00           	move.l d0,-(sp)
    4936:	2f2f 01d0      	move.l 464(sp),-(sp)
    493a:	2f2f 0056      	move.l 86(sp),-(sp)
    493e:	4eba 229e      	jsr 6bde <TestRow>(pc)
    4942:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4946:	722a           	moveq #42,d1
    4948:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 13);
    494c:	7000           	moveq #0,d0
    494e:	302f 01c6      	move.w 454(sp),d0
    4952:	4878 000d      	pea d <_start+0xd>
    4956:	2f00           	move.l d0,-(sp)
    4958:	2f2f 01d0      	move.l 464(sp),-(sp)
    495c:	2f2f 0056      	move.l 86(sp),-(sp)
    4960:	4eba 227c      	jsr 6bde <TestRow>(pc)
    4964:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4968:	702a           	moveq #42,d0
    496a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    496e:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 14);
    4972:	7000           	moveq #0,d0
    4974:	302f 01c6      	move.w 454(sp),d0
    4978:	4878 000e      	pea e <_start+0xe>
    497c:	2f00           	move.l d0,-(sp)
    497e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4982:	2f2f 0056      	move.l 86(sp),-(sp)
    4986:	4eba 2256      	jsr 6bde <TestRow>(pc)
    498a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    498e:	722a           	moveq #42,d1
    4990:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 15);
    4994:	7000           	moveq #0,d0
    4996:	302f 01c6      	move.w 454(sp),d0
    499a:	4878 000f      	pea f <_start+0xf>
    499e:	2f00           	move.l d0,-(sp)
    49a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    49a4:	2f2f 0056      	move.l 86(sp),-(sp)
    49a8:	4eba 2234      	jsr 6bde <TestRow>(pc)
    49ac:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49b0:	702a           	moveq #42,d0
    49b2:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    49b6:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 16);
    49ba:	7000           	moveq #0,d0
    49bc:	302f 01c6      	move.w 454(sp),d0
    49c0:	4878 0010      	pea 10 <_start+0x10>
    49c4:	2f00           	move.l d0,-(sp)
    49c6:	2f2f 01d0      	move.l 464(sp),-(sp)
    49ca:	2f2f 0056      	move.l 86(sp),-(sp)
    49ce:	4eba 220e      	jsr 6bde <TestRow>(pc)
    49d2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49d6:	722a           	moveq #42,d1
    49d8:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 17);
    49dc:	7000           	moveq #0,d0
    49de:	302f 01c6      	move.w 454(sp),d0
    49e2:	4878 0011      	pea 11 <_start+0x11>
    49e6:	2f00           	move.l d0,-(sp)
    49e8:	2f2f 01d0      	move.l 464(sp),-(sp)
    49ec:	2f2f 0056      	move.l 86(sp),-(sp)
    49f0:	4eba 21ec      	jsr 6bde <TestRow>(pc)
    49f4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49f8:	702a           	moveq #42,d0
    49fa:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    49fe:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 18);
    4a02:	7000           	moveq #0,d0
    4a04:	302f 01c6      	move.w 454(sp),d0
    4a08:	4878 0012      	pea 12 <_start+0x12>
    4a0c:	2f00           	move.l d0,-(sp)
    4a0e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a12:	2f2f 0056      	move.l 86(sp),-(sp)
    4a16:	4eba 21c6      	jsr 6bde <TestRow>(pc)
    4a1a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a1e:	722a           	moveq #42,d1
    4a20:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 19);
    4a24:	7000           	moveq #0,d0
    4a26:	302f 01c6      	move.w 454(sp),d0
    4a2a:	4878 0013      	pea 13 <_start+0x13>
    4a2e:	2f00           	move.l d0,-(sp)
    4a30:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a34:	2f2f 0056      	move.l 86(sp),-(sp)
    4a38:	4eba 21a4      	jsr 6bde <TestRow>(pc)
    4a3c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a40:	702a           	moveq #42,d0
    4a42:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4a46:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 20);
    4a4a:	7000           	moveq #0,d0
    4a4c:	302f 01c6      	move.w 454(sp),d0
    4a50:	4878 0014      	pea 14 <_start+0x14>
    4a54:	2f00           	move.l d0,-(sp)
    4a56:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a5a:	2f2f 0056      	move.l 86(sp),-(sp)
    4a5e:	4eba 217e      	jsr 6bde <TestRow>(pc)
    4a62:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a66:	722a           	moveq #42,d1
    4a68:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 21);
    4a6c:	7000           	moveq #0,d0
    4a6e:	302f 01c6      	move.w 454(sp),d0
    4a72:	4878 0015      	pea 15 <_start+0x15>
    4a76:	2f00           	move.l d0,-(sp)
    4a78:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a7c:	2f2f 0056      	move.l 86(sp),-(sp)
    4a80:	4eba 215c      	jsr 6bde <TestRow>(pc)
    4a84:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a88:	702a           	moveq #42,d0
    4a8a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4a8e:	466f 01c6      	not.w 454(sp)


  for(int i=0;i<10;i++) {
    4a92:	42af 018a      	clr.l 394(sp)
    4a96:	6000 0286      	bra.w 4d1e <TestZoom4Picture+0xfa2>
    for(int i2=0;i2<13;i2++) {  
    4a9a:	42af 0186      	clr.l 390(sp)
    4a9e:	6042           	bra.s 4ae2 <TestZoom4Picture+0xd66>
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    4aa0:	222f 018a      	move.l 394(sp),d1
    4aa4:	2001           	move.l d1,d0
    4aa6:	d080           	add.l d0,d0
    4aa8:	d081           	add.l d1,d0
    4aaa:	2200           	move.l d0,d1
    4aac:	e789           	lsl.l #3,d1
    4aae:	9280           	sub.l d0,d1
    4ab0:	2041           	movea.l d1,a0
    4ab2:	d1ef 0186      	adda.l 390(sp),a0
    4ab6:	41e8 0016      	lea 22(a0),a0
    4aba:	7000           	moveq #0,d0
    4abc:	302f 01c6      	move.w 454(sp),d0
    4ac0:	2f08           	move.l a0,-(sp)
    4ac2:	2f00           	move.l d0,-(sp)
    4ac4:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ac8:	2f2f 0056      	move.l 86(sp),-(sp)
    4acc:	4eba 2110      	jsr 6bde <TestRow>(pc)
    4ad0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4ad4:	722a           	moveq #42,d1
    4ad6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4ada:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {  
    4ade:	52af 0186      	addq.l #1,390(sp)
    4ae2:	700c           	moveq #12,d0
    4ae4:	b0af 0186      	cmp.l 390(sp),d0
    4ae8:	6cb6           	bge.s 4aa0 <TestZoom4Picture+0xd24>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    4aea:	222f 018a      	move.l 394(sp),d1
    4aee:	2001           	move.l d1,d0
    4af0:	d080           	add.l d0,d0
    4af2:	d081           	add.l d1,d0
    4af4:	2200           	move.l d0,d1
    4af6:	e789           	lsl.l #3,d1
    4af8:	2041           	movea.l d1,a0
    4afa:	91c0           	suba.l d0,a0
    4afc:	41e8 0023      	lea 35(a0),a0
    4b00:	7000           	moveq #0,d0
    4b02:	302f 01c6      	move.w 454(sp),d0
    4b06:	2f08           	move.l a0,-(sp)
    4b08:	2f00           	move.l d0,-(sp)
    4b0a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b0e:	2f2f 0056      	move.l 86(sp),-(sp)
    4b12:	4eba 20ca      	jsr 6bde <TestRow>(pc)
    4b16:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b1a:	722a           	moveq #42,d1
    4b1c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    4b20:	222f 018a      	move.l 394(sp),d1
    4b24:	2001           	move.l d1,d0
    4b26:	d080           	add.l d0,d0
    4b28:	d081           	add.l d1,d0
    4b2a:	2200           	move.l d0,d1
    4b2c:	e789           	lsl.l #3,d1
    4b2e:	2041           	movea.l d1,a0
    4b30:	91c0           	suba.l d0,a0
    4b32:	41e8 0024      	lea 36(a0),a0
    4b36:	7000           	moveq #0,d0
    4b38:	302f 01c6      	move.w 454(sp),d0
    4b3c:	2f08           	move.l a0,-(sp)
    4b3e:	2f00           	move.l d0,-(sp)
    4b40:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b44:	2f2f 0056      	move.l 86(sp),-(sp)
    4b48:	4eba 2094      	jsr 6bde <TestRow>(pc)
    4b4c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b50:	702a           	moveq #42,d0
    4b52:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b56:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    4b5a:	222f 018a      	move.l 394(sp),d1
    4b5e:	2001           	move.l d1,d0
    4b60:	d080           	add.l d0,d0
    4b62:	d081           	add.l d1,d0
    4b64:	2200           	move.l d0,d1
    4b66:	e789           	lsl.l #3,d1
    4b68:	2041           	movea.l d1,a0
    4b6a:	91c0           	suba.l d0,a0
    4b6c:	41e8 0025      	lea 37(a0),a0
    4b70:	7000           	moveq #0,d0
    4b72:	302f 01c6      	move.w 454(sp),d0
    4b76:	2f08           	move.l a0,-(sp)
    4b78:	2f00           	move.l d0,-(sp)
    4b7a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b7e:	2f2f 0056      	move.l 86(sp),-(sp)
    4b82:	4eba 205a      	jsr 6bde <TestRow>(pc)
    4b86:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b8a:	722a           	moveq #42,d1
    4b8c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    4b90:	222f 018a      	move.l 394(sp),d1
    4b94:	2001           	move.l d1,d0
    4b96:	d080           	add.l d0,d0
    4b98:	d081           	add.l d1,d0
    4b9a:	2200           	move.l d0,d1
    4b9c:	e789           	lsl.l #3,d1
    4b9e:	2041           	movea.l d1,a0
    4ba0:	91c0           	suba.l d0,a0
    4ba2:	41e8 0026      	lea 38(a0),a0
    4ba6:	7000           	moveq #0,d0
    4ba8:	302f 01c6      	move.w 454(sp),d0
    4bac:	2f08           	move.l a0,-(sp)
    4bae:	2f00           	move.l d0,-(sp)
    4bb0:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bb4:	2f2f 0056      	move.l 86(sp),-(sp)
    4bb8:	4eba 2024      	jsr 6bde <TestRow>(pc)
    4bbc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4bc0:	702a           	moveq #42,d0
    4bc2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4bc6:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    4bca:	222f 018a      	move.l 394(sp),d1
    4bce:	2001           	move.l d1,d0
    4bd0:	d080           	add.l d0,d0
    4bd2:	d081           	add.l d1,d0
    4bd4:	2200           	move.l d0,d1
    4bd6:	e789           	lsl.l #3,d1
    4bd8:	2041           	movea.l d1,a0
    4bda:	91c0           	suba.l d0,a0
    4bdc:	41e8 0027      	lea 39(a0),a0
    4be0:	7000           	moveq #0,d0
    4be2:	302f 01c6      	move.w 454(sp),d0
    4be6:	2f08           	move.l a0,-(sp)
    4be8:	2f00           	move.l d0,-(sp)
    4bea:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bee:	2f2f 0056      	move.l 86(sp),-(sp)
    4bf2:	4eba 1fea      	jsr 6bde <TestRow>(pc)
    4bf6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4bfa:	722a           	moveq #42,d1
    4bfc:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    4c00:	222f 018a      	move.l 394(sp),d1
    4c04:	2001           	move.l d1,d0
    4c06:	d080           	add.l d0,d0
    4c08:	d081           	add.l d1,d0
    4c0a:	2200           	move.l d0,d1
    4c0c:	e789           	lsl.l #3,d1
    4c0e:	2041           	movea.l d1,a0
    4c10:	91c0           	suba.l d0,a0
    4c12:	41e8 0028      	lea 40(a0),a0
    4c16:	7000           	moveq #0,d0
    4c18:	302f 01c6      	move.w 454(sp),d0
    4c1c:	2f08           	move.l a0,-(sp)
    4c1e:	2f00           	move.l d0,-(sp)
    4c20:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c24:	2f2f 0056      	move.l 86(sp),-(sp)
    4c28:	4eba 1fb4      	jsr 6bde <TestRow>(pc)
    4c2c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c30:	702a           	moveq #42,d0
    4c32:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c36:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    4c3a:	222f 018a      	move.l 394(sp),d1
    4c3e:	2001           	move.l d1,d0
    4c40:	d080           	add.l d0,d0
    4c42:	d081           	add.l d1,d0
    4c44:	2200           	move.l d0,d1
    4c46:	e789           	lsl.l #3,d1
    4c48:	2041           	movea.l d1,a0
    4c4a:	91c0           	suba.l d0,a0
    4c4c:	41e8 0029      	lea 41(a0),a0
    4c50:	7000           	moveq #0,d0
    4c52:	302f 01c6      	move.w 454(sp),d0
    4c56:	2f08           	move.l a0,-(sp)
    4c58:	2f00           	move.l d0,-(sp)
    4c5a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c5e:	2f2f 0056      	move.l 86(sp),-(sp)
    4c62:	4eba 1f7a      	jsr 6bde <TestRow>(pc)
    4c66:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c6a:	722a           	moveq #42,d1
    4c6c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    4c70:	222f 018a      	move.l 394(sp),d1
    4c74:	2001           	move.l d1,d0
    4c76:	d080           	add.l d0,d0
    4c78:	d081           	add.l d1,d0
    4c7a:	2200           	move.l d0,d1
    4c7c:	e789           	lsl.l #3,d1
    4c7e:	2041           	movea.l d1,a0
    4c80:	91c0           	suba.l d0,a0
    4c82:	41e8 002a      	lea 42(a0),a0
    4c86:	7000           	moveq #0,d0
    4c88:	302f 01c6      	move.w 454(sp),d0
    4c8c:	2f08           	move.l a0,-(sp)
    4c8e:	2f00           	move.l d0,-(sp)
    4c90:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c94:	2f2f 0056      	move.l 86(sp),-(sp)
    4c98:	4eba 1f44      	jsr 6bde <TestRow>(pc)
    4c9c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ca0:	702a           	moveq #42,d0
    4ca2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4ca6:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    4caa:	222f 018a      	move.l 394(sp),d1
    4cae:	2001           	move.l d1,d0
    4cb0:	d080           	add.l d0,d0
    4cb2:	d081           	add.l d1,d0
    4cb4:	2200           	move.l d0,d1
    4cb6:	e789           	lsl.l #3,d1
    4cb8:	2041           	movea.l d1,a0
    4cba:	91c0           	suba.l d0,a0
    4cbc:	41e8 002b      	lea 43(a0),a0
    4cc0:	7000           	moveq #0,d0
    4cc2:	302f 01c6      	move.w 454(sp),d0
    4cc6:	2f08           	move.l a0,-(sp)
    4cc8:	2f00           	move.l d0,-(sp)
    4cca:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cce:	2f2f 0056      	move.l 86(sp),-(sp)
    4cd2:	4eba 1f0a      	jsr 6bde <TestRow>(pc)
    4cd6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4cda:	722a           	moveq #42,d1
    4cdc:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    4ce0:	222f 018a      	move.l 394(sp),d1
    4ce4:	2001           	move.l d1,d0
    4ce6:	d080           	add.l d0,d0
    4ce8:	d081           	add.l d1,d0
    4cea:	2200           	move.l d0,d1
    4cec:	e789           	lsl.l #3,d1
    4cee:	2041           	movea.l d1,a0
    4cf0:	91c0           	suba.l d0,a0
    4cf2:	41e8 002c      	lea 44(a0),a0
    4cf6:	7000           	moveq #0,d0
    4cf8:	302f 01c6      	move.w 454(sp),d0
    4cfc:	2f08           	move.l a0,-(sp)
    4cfe:	2f00           	move.l d0,-(sp)
    4d00:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d04:	2f2f 0056      	move.l 86(sp),-(sp)
    4d08:	4eba 1ed4      	jsr 6bde <TestRow>(pc)
    4d0c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d10:	702a           	moveq #42,d0
    4d12:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4d16:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<10;i++) {
    4d1a:	52af 018a      	addq.l #1,394(sp)
    4d1e:	7209           	moveq #9,d1
    4d20:	b2af 018a      	cmp.l 394(sp),d1
    4d24:	6c00 fd74      	bge.w 4a9a <TestZoom4Picture+0xd1e>
  }

  for(int i2=0;i2<13;i2++) {  
    4d28:	42af 0182      	clr.l 386(sp)
    4d2c:	6032           	bra.s 4d60 <TestZoom4Picture+0xfe4>
    TestRow( valsupposed, valactual, mask, i2+253);
    4d2e:	222f 0182      	move.l 386(sp),d1
    4d32:	0681 0000 00fd 	addi.l #253,d1
    4d38:	7000           	moveq #0,d0
    4d3a:	302f 01c6      	move.w 454(sp),d0
    4d3e:	2f01           	move.l d1,-(sp)
    4d40:	2f00           	move.l d0,-(sp)
    4d42:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d46:	2f2f 0056      	move.l 86(sp),-(sp)
    4d4a:	4eba 1e92      	jsr 6bde <TestRow>(pc)
    4d4e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d52:	702a           	moveq #42,d0
    4d54:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4d58:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4d5c:	52af 0182      	addq.l #1,386(sp)
    4d60:	720c           	moveq #12,d1
    4d62:	b2af 0182      	cmp.l 386(sp),d1
    4d66:	6cc6           	bge.s 4d2e <TestZoom4Picture+0xfb2>
  }

  TestRow( valsupposed, valactual, mask, 266);
    4d68:	7000           	moveq #0,d0
    4d6a:	302f 01c6      	move.w 454(sp),d0
    4d6e:	4878 010a      	pea 10a <FreeDisplay+0x2a>
    4d72:	2f00           	move.l d0,-(sp)
    4d74:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d78:	2f2f 0056      	move.l 86(sp),-(sp)
    4d7c:	4eba 1e60      	jsr 6bde <TestRow>(pc)
    4d80:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d84:	702a           	moveq #42,d0
    4d86:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 267);
    4d8a:	7000           	moveq #0,d0
    4d8c:	302f 01c6      	move.w 454(sp),d0
    4d90:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    4d94:	2f00           	move.l d0,-(sp)
    4d96:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d9a:	2f2f 0056      	move.l 86(sp),-(sp)
    4d9e:	4eba 1e3e      	jsr 6bde <TestRow>(pc)
    4da2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4da6:	722a           	moveq #42,d1
    4da8:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4dac:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 268);
    4db0:	7000           	moveq #0,d0
    4db2:	302f 01c6      	move.w 454(sp),d0
    4db6:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    4dba:	2f00           	move.l d0,-(sp)
    4dbc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4dc0:	2f2f 0056      	move.l 86(sp),-(sp)
    4dc4:	4eba 1e18      	jsr 6bde <TestRow>(pc)
    4dc8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4dcc:	702a           	moveq #42,d0
    4dce:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 269);
    4dd2:	7000           	moveq #0,d0
    4dd4:	302f 01c6      	move.w 454(sp),d0
    4dd8:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4ddc:	2f00           	move.l d0,-(sp)
    4dde:	2f2f 01d0      	move.l 464(sp),-(sp)
    4de2:	2f2f 0056      	move.l 86(sp),-(sp)
    4de6:	4eba 1df6      	jsr 6bde <TestRow>(pc)
    4dea:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4dee:	722a           	moveq #42,d1
    4df0:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4df4:	466f 01c6      	not.w 454(sp)

  tmp = source;
    4df8:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4dfe:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4e04:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    4e0a:	4878 0001      	pea 1 <_start+0x1>
    4e0e:	4878 0005      	pea 5 <_start+0x5>
    4e12:	2f2f 0056      	move.l 86(sp),-(sp)
    4e16:	2f2f 006a      	move.l 106(sp),-(sp)
    4e1a:	4eba cd18      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    4e1e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4e22:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    4e28:	2c40           	movea.l d0,a6
    4e2a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4e2e:	202f 004e      	move.l 78(sp),d0
    4e32:	5880           	addq.l #4,d0
    4e34:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom6;
    4e38:	2f7c 0000 bc44 	move.l #48196,74(sp)
    4e3e:	004a 
  mask = 0x0000;
    4e40:	426f 01c6      	clr.w 454(sp)
 
  for(int i2=0;i2<7;i2++) {  
    4e44:	42af 017e      	clr.l 382(sp)
    4e48:	602a           	bra.s 4e74 <TestZoom4Picture+0x10f8>
    TestRow( valsupposed, valactual, mask, i2);
    4e4a:	7000           	moveq #0,d0
    4e4c:	302f 01c6      	move.w 454(sp),d0
    4e50:	2f2f 017e      	move.l 382(sp),-(sp)
    4e54:	2f00           	move.l d0,-(sp)
    4e56:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e5a:	2f2f 0056      	move.l 86(sp),-(sp)
    4e5e:	4eba 1d7e      	jsr 6bde <TestRow>(pc)
    4e62:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e66:	722a           	moveq #42,d1
    4e68:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4e6c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    4e70:	52af 017e      	addq.l #1,382(sp)
    4e74:	7006           	moveq #6,d0
    4e76:	b0af 017e      	cmp.l 382(sp),d0
    4e7a:	6cce           	bge.s 4e4a <TestZoom4Picture+0x10ce>
  }

  for(int i=0;i<6;i++) {
    4e7c:	42af 017a      	clr.l 378(sp)
    4e80:	605c           	bra.s 4ede <TestZoom4Picture+0x1162>
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    4e82:	202f 017a      	move.l 378(sp),d0
    4e86:	d080           	add.l d0,d0
    4e88:	2200           	move.l d0,d1
    4e8a:	5e81           	addq.l #7,d1
    4e8c:	7000           	moveq #0,d0
    4e8e:	302f 01c6      	move.w 454(sp),d0
    4e92:	2f01           	move.l d1,-(sp)
    4e94:	2f00           	move.l d0,-(sp)
    4e96:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e9a:	2f2f 0056      	move.l 86(sp),-(sp)
    4e9e:	4eba 1d3e      	jsr 6bde <TestRow>(pc)
    4ea2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ea6:	722a           	moveq #42,d1
    4ea8:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    4eac:	202f 017a      	move.l 378(sp),d0
    4eb0:	5880           	addq.l #4,d0
    4eb2:	d080           	add.l d0,d0
    4eb4:	2200           	move.l d0,d1
    4eb6:	7000           	moveq #0,d0
    4eb8:	302f 01c6      	move.w 454(sp),d0
    4ebc:	2f01           	move.l d1,-(sp)
    4ebe:	2f00           	move.l d0,-(sp)
    4ec0:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ec4:	2f2f 0056      	move.l 86(sp),-(sp)
    4ec8:	4eba 1d14      	jsr 6bde <TestRow>(pc)
    4ecc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ed0:	702a           	moveq #42,d0
    4ed2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4ed6:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<6;i++) {
    4eda:	52af 017a      	addq.l #1,378(sp)
    4ede:	7205           	moveq #5,d1
    4ee0:	b2af 017a      	cmp.l 378(sp),d1
    4ee4:	6c9c           	bge.s 4e82 <TestZoom4Picture+0x1106>
  }

  for(int i=0;i<10;i++) {
    4ee6:	42af 0176      	clr.l 374(sp)
    4eea:	6000 00ce      	bra.w 4fba <TestZoom4Picture+0x123e>
    for(int i2=0;i2<12;i2++) {  
    4eee:	42af 0172      	clr.l 370(sp)
    4ef2:	6040           	bra.s 4f34 <TestZoom4Picture+0x11b8>
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    4ef4:	307c 0013      	movea.w #19,a0
    4ef8:	d1ef 0172      	adda.l 370(sp),a0
    4efc:	222f 0176      	move.l 374(sp),d1
    4f00:	2001           	move.l d1,d0
    4f02:	d080           	add.l d0,d0
    4f04:	d081           	add.l d1,d0
    4f06:	e788           	lsl.l #3,d0
    4f08:	2208           	move.l a0,d1
    4f0a:	d280           	add.l d0,d1
    4f0c:	7000           	moveq #0,d0
    4f0e:	302f 01c6      	move.w 454(sp),d0
    4f12:	2f01           	move.l d1,-(sp)
    4f14:	2f00           	move.l d0,-(sp)
    4f16:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f1a:	2f2f 0056      	move.l 86(sp),-(sp)
    4f1e:	4eba 1cbe      	jsr 6bde <TestRow>(pc)
    4f22:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4f26:	702a           	moveq #42,d0
    4f28:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4f2c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {  
    4f30:	52af 0172      	addq.l #1,370(sp)
    4f34:	720b           	moveq #11,d1
    4f36:	b2af 0172      	cmp.l 370(sp),d1
    4f3a:	6cb8           	bge.s 4ef4 <TestZoom4Picture+0x1178>
    }
    for(int i=0;i<6;i++) {
    4f3c:	42af 016e      	clr.l 366(sp)
    4f40:	606c           	bra.s 4fae <TestZoom4Picture+0x1232>
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    4f42:	222f 016e      	move.l 366(sp),d1
    4f46:	2001           	move.l d1,d0
    4f48:	d080           	add.l d0,d0
    4f4a:	d081           	add.l d1,d0
    4f4c:	e788           	lsl.l #3,d0
    4f4e:	2040           	movea.l d0,a0
    4f50:	41e8 001f      	lea 31(a0),a0
    4f54:	7000           	moveq #0,d0
    4f56:	302f 01c6      	move.w 454(sp),d0
    4f5a:	2f08           	move.l a0,-(sp)
    4f5c:	2f00           	move.l d0,-(sp)
    4f5e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f62:	2f2f 0056      	move.l 86(sp),-(sp)
    4f66:	4eba 1c76      	jsr 6bde <TestRow>(pc)
    4f6a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4f6e:	702a           	moveq #42,d0
    4f70:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    4f74:	222f 016e      	move.l 366(sp),d1
    4f78:	2001           	move.l d1,d0
    4f7a:	d080           	add.l d0,d0
    4f7c:	d081           	add.l d1,d0
    4f7e:	e788           	lsl.l #3,d0
    4f80:	2040           	movea.l d0,a0
    4f82:	41e8 0020      	lea 32(a0),a0
    4f86:	7000           	moveq #0,d0
    4f88:	302f 01c6      	move.w 454(sp),d0
    4f8c:	2f08           	move.l a0,-(sp)
    4f8e:	2f00           	move.l d0,-(sp)
    4f90:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f94:	2f2f 0056      	move.l 86(sp),-(sp)
    4f98:	4eba 1c44      	jsr 6bde <TestRow>(pc)
    4f9c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4fa0:	722a           	moveq #42,d1
    4fa2:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4fa6:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<6;i++) {
    4faa:	52af 016e      	addq.l #1,366(sp)
    4fae:	7005           	moveq #5,d0
    4fb0:	b0af 016e      	cmp.l 366(sp),d0
    4fb4:	6c8c           	bge.s 4f42 <TestZoom4Picture+0x11c6>
  for(int i=0;i<10;i++) {
    4fb6:	52af 0176      	addq.l #1,374(sp)
    4fba:	7209           	moveq #9,d1
    4fbc:	b2af 0176      	cmp.l 374(sp),d1
    4fc0:	6c00 ff2c      	bge.w 4eee <TestZoom4Picture+0x1172>
    }
  }

  for(int i2=0;i2<11;i2++) {  
    4fc4:	42af 016a      	clr.l 362(sp)
    4fc8:	6032           	bra.s 4ffc <TestZoom4Picture+0x1280>
    TestRow( valsupposed, valactual, mask, 258+i2);
    4fca:	222f 016a      	move.l 362(sp),d1
    4fce:	0681 0000 0102 	addi.l #258,d1
    4fd4:	7000           	moveq #0,d0
    4fd6:	302f 01c6      	move.w 454(sp),d0
    4fda:	2f01           	move.l d1,-(sp)
    4fdc:	2f00           	move.l d0,-(sp)
    4fde:	2f2f 01d0      	move.l 464(sp),-(sp)
    4fe2:	2f2f 0056      	move.l 86(sp),-(sp)
    4fe6:	4eba 1bf6      	jsr 6bde <TestRow>(pc)
    4fea:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4fee:	702a           	moveq #42,d0
    4ff0:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4ff4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {  
    4ff8:	52af 016a      	addq.l #1,362(sp)
    4ffc:	720a           	moveq #10,d1
    4ffe:	b2af 016a      	cmp.l 362(sp),d1
    5002:	6cc6           	bge.s 4fca <TestZoom4Picture+0x124e>
  }

  tmp = source;
    5004:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    500a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5010:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    5016:	4878 0001      	pea 1 <_start+0x1>
    501a:	4878 0006      	pea 6 <_start+0x6>
    501e:	2f2f 0056      	move.l 86(sp),-(sp)
    5022:	2f2f 006a      	move.l 106(sp),-(sp)
    5026:	4eba cb0c      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    502a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    502e:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    5034:	2c40           	movea.l d0,a6
    5036:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    503a:	202f 004e      	move.l 78(sp),d0
    503e:	5880           	addq.l #4,d0
    5040:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom7;
    5044:	2f7c 0000 bc70 	move.l #48240,74(sp)
    504a:	004a 
  mask = 0x0000;
    504c:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5050:	7000           	moveq #0,d0
    5052:	302f 01c6      	move.w 454(sp),d0
    5056:	42a7           	clr.l -(sp)
    5058:	2f00           	move.l d0,-(sp)
    505a:	2f2f 01d0      	move.l 464(sp),-(sp)
    505e:	2f2f 0056      	move.l 86(sp),-(sp)
    5062:	4eba 1b7a      	jsr 6bde <TestRow>(pc)
    5066:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    506a:	722a           	moveq #42,d1
    506c:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5070:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    5074:	42af 0166      	clr.l 358(sp)
    5078:	605c           	bra.s 50d6 <TestZoom4Picture+0x135a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    507a:	202f 0166      	move.l 358(sp),d0
    507e:	d080           	add.l d0,d0
    5080:	2200           	move.l d0,d1
    5082:	5281           	addq.l #1,d1
    5084:	7000           	moveq #0,d0
    5086:	302f 01c6      	move.w 454(sp),d0
    508a:	2f01           	move.l d1,-(sp)
    508c:	2f00           	move.l d0,-(sp)
    508e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5092:	2f2f 0056      	move.l 86(sp),-(sp)
    5096:	4eba 1b46      	jsr 6bde <TestRow>(pc)
    509a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    509e:	702a           	moveq #42,d0
    50a0:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    50a4:	202f 0166      	move.l 358(sp),d0
    50a8:	5280           	addq.l #1,d0
    50aa:	d080           	add.l d0,d0
    50ac:	2200           	move.l d0,d1
    50ae:	7000           	moveq #0,d0
    50b0:	302f 01c6      	move.w 454(sp),d0
    50b4:	2f01           	move.l d1,-(sp)
    50b6:	2f00           	move.l d0,-(sp)
    50b8:	2f2f 01d0      	move.l 464(sp),-(sp)
    50bc:	2f2f 0056      	move.l 86(sp),-(sp)
    50c0:	4eba 1b1c      	jsr 6bde <TestRow>(pc)
    50c4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    50c8:	722a           	moveq #42,d1
    50ca:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    50ce:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    50d2:	52af 0166      	addq.l #1,358(sp)
    50d6:	7006           	moveq #6,d0
    50d8:	b0af 0166      	cmp.l 358(sp),d0
    50dc:	6c9c           	bge.s 507a <TestZoom4Picture+0x12fe>
  }

  for(int i=0;i<10;i++) {
    50de:	42af 0162      	clr.l 354(sp)
    50e2:	6000 00d4      	bra.w 51b8 <TestZoom4Picture+0x143c>
    for(int i2=0;i2<11;i2++) {  
    50e6:	42af 015e      	clr.l 350(sp)
    50ea:	6042           	bra.s 512e <TestZoom4Picture+0x13b2>
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    50ec:	307c 000f      	movea.w #15,a0
    50f0:	d1ef 015e      	adda.l 350(sp),a0
    50f4:	222f 0162      	move.l 354(sp),d1
    50f8:	2001           	move.l d1,d0
    50fa:	d080           	add.l d0,d0
    50fc:	d081           	add.l d1,d0
    50fe:	e788           	lsl.l #3,d0
    5100:	d081           	add.l d1,d0
    5102:	2208           	move.l a0,d1
    5104:	d280           	add.l d0,d1
    5106:	7000           	moveq #0,d0
    5108:	302f 01c6      	move.w 454(sp),d0
    510c:	2f01           	move.l d1,-(sp)
    510e:	2f00           	move.l d0,-(sp)
    5110:	2f2f 01d0      	move.l 464(sp),-(sp)
    5114:	2f2f 0056      	move.l 86(sp),-(sp)
    5118:	4eba 1ac4      	jsr 6bde <TestRow>(pc)
    511c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5120:	722a           	moveq #42,d1
    5122:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5126:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {  
    512a:	52af 015e      	addq.l #1,350(sp)
    512e:	700a           	moveq #10,d0
    5130:	b0af 015e      	cmp.l 350(sp),d0
    5134:	6cb6           	bge.s 50ec <TestZoom4Picture+0x1370>
    }
    for(int i=0;i<7;i++) {
    5136:	42af 015a      	clr.l 346(sp)
    513a:	6070           	bra.s 51ac <TestZoom4Picture+0x1430>
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    513c:	222f 015a      	move.l 346(sp),d1
    5140:	2001           	move.l d1,d0
    5142:	d080           	add.l d0,d0
    5144:	d081           	add.l d1,d0
    5146:	e788           	lsl.l #3,d0
    5148:	2040           	movea.l d0,a0
    514a:	d1c1           	adda.l d1,a0
    514c:	41e8 001a      	lea 26(a0),a0
    5150:	7000           	moveq #0,d0
    5152:	302f 01c6      	move.w 454(sp),d0
    5156:	2f08           	move.l a0,-(sp)
    5158:	2f00           	move.l d0,-(sp)
    515a:	2f2f 01d0      	move.l 464(sp),-(sp)
    515e:	2f2f 0056      	move.l 86(sp),-(sp)
    5162:	4eba 1a7a      	jsr 6bde <TestRow>(pc)
    5166:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    516a:	722a           	moveq #42,d1
    516c:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    5170:	222f 015a      	move.l 346(sp),d1
    5174:	2001           	move.l d1,d0
    5176:	d080           	add.l d0,d0
    5178:	d081           	add.l d1,d0
    517a:	e788           	lsl.l #3,d0
    517c:	2040           	movea.l d0,a0
    517e:	d1c1           	adda.l d1,a0
    5180:	41e8 001a      	lea 26(a0),a0
    5184:	7000           	moveq #0,d0
    5186:	302f 01c6      	move.w 454(sp),d0
    518a:	2f08           	move.l a0,-(sp)
    518c:	2f00           	move.l d0,-(sp)
    518e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5192:	2f2f 0056      	move.l 86(sp),-(sp)
    5196:	4eba 1a46      	jsr 6bde <TestRow>(pc)
    519a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    519e:	702a           	moveq #42,d0
    51a0:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    51a4:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<7;i++) {
    51a8:	52af 015a      	addq.l #1,346(sp)
    51ac:	7206           	moveq #6,d1
    51ae:	b2af 015a      	cmp.l 346(sp),d1
    51b2:	6c88           	bge.s 513c <TestZoom4Picture+0x13c0>
  for(int i=0;i<10;i++) {
    51b4:	52af 0162      	addq.l #1,354(sp)
    51b8:	7009           	moveq #9,d0
    51ba:	b0af 0162      	cmp.l 354(sp),d0
    51be:	6c00 ff26      	bge.w 50e6 <TestZoom4Picture+0x136a>
    }
  }

  for(int i2=0;i2<5;i2++) {  
    51c2:	42af 0156      	clr.l 342(sp)
    51c6:	6032           	bra.s 51fa <TestZoom4Picture+0x147e>
    TestRow( valsupposed, valactual, mask, 256+i2);
    51c8:	222f 0156      	move.l 342(sp),d1
    51cc:	0681 0000 0100 	addi.l #256,d1
    51d2:	7000           	moveq #0,d0
    51d4:	302f 01c6      	move.w 454(sp),d0
    51d8:	2f01           	move.l d1,-(sp)
    51da:	2f00           	move.l d0,-(sp)
    51dc:	2f2f 01d0      	move.l 464(sp),-(sp)
    51e0:	2f2f 0056      	move.l 86(sp),-(sp)
    51e4:	4eba 19f8      	jsr 6bde <TestRow>(pc)
    51e8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    51ec:	722a           	moveq #42,d1
    51ee:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    51f2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    51f6:	52af 0156      	addq.l #1,342(sp)
    51fa:	7004           	moveq #4,d0
    51fc:	b0af 0156      	cmp.l 342(sp),d0
    5200:	6cc6           	bge.s 51c8 <TestZoom4Picture+0x144c>
  }

  tmp = source;
    5202:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5208:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    520e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    5214:	4878 0001      	pea 1 <_start+0x1>
    5218:	4878 0007      	pea 7 <_start+0x7>
    521c:	2f2f 0056      	move.l 86(sp),-(sp)
    5220:	2f2f 006a      	move.l 106(sp),-(sp)
    5224:	4eba c90e      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    5228:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    522c:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    5232:	2c40           	movea.l d0,a6
    5234:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5238:	222f 004e      	move.l 78(sp),d1
    523c:	5881           	addq.l #4,d1
    523e:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom8;
    5242:	2f7c 0000 bc9c 	move.l #48284,74(sp)
    5248:	004a 
  mask = 0xffff;
    524a:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5250:	7000           	moveq #0,d0
    5252:	302f 01c6      	move.w 454(sp),d0
    5256:	42a7           	clr.l -(sp)
    5258:	2f00           	move.l d0,-(sp)
    525a:	2f2f 01d0      	move.l 464(sp),-(sp)
    525e:	2f2f 0056      	move.l 86(sp),-(sp)
    5262:	4eba 197a      	jsr 6bde <TestRow>(pc)
    5266:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    526a:	702a           	moveq #42,d0
    526c:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5270:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5274:	42af 0152      	clr.l 338(sp)
    5278:	605c           	bra.s 52d6 <TestZoom4Picture+0x155a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    527a:	202f 0152      	move.l 338(sp),d0
    527e:	d080           	add.l d0,d0
    5280:	2200           	move.l d0,d1
    5282:	5281           	addq.l #1,d1
    5284:	7000           	moveq #0,d0
    5286:	302f 01c6      	move.w 454(sp),d0
    528a:	2f01           	move.l d1,-(sp)
    528c:	2f00           	move.l d0,-(sp)
    528e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5292:	2f2f 0056      	move.l 86(sp),-(sp)
    5296:	4eba 1946      	jsr 6bde <TestRow>(pc)
    529a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    529e:	722a           	moveq #42,d1
    52a0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    52a4:	202f 0152      	move.l 338(sp),d0
    52a8:	5280           	addq.l #1,d0
    52aa:	d080           	add.l d0,d0
    52ac:	2200           	move.l d0,d1
    52ae:	7000           	moveq #0,d0
    52b0:	302f 01c6      	move.w 454(sp),d0
    52b4:	2f01           	move.l d1,-(sp)
    52b6:	2f00           	move.l d0,-(sp)
    52b8:	2f2f 01d0      	move.l 464(sp),-(sp)
    52bc:	2f2f 0056      	move.l 86(sp),-(sp)
    52c0:	4eba 191c      	jsr 6bde <TestRow>(pc)
    52c4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    52c8:	702a           	moveq #42,d0
    52ca:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    52ce:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    52d2:	52af 0152      	addq.l #1,338(sp)
    52d6:	7204           	moveq #4,d1
    52d8:	b2af 0152      	cmp.l 338(sp),d1
    52dc:	6c9c           	bge.s 527a <TestZoom4Picture+0x14fe>
  }

  for(int i=0;i<9;i++) {
    52de:	42af 014e      	clr.l 334(sp)
    52e2:	6000 00f0      	bra.w 53d4 <TestZoom4Picture+0x1658>
    for(int i2=0;i2<10;i2++) {  
    52e6:	42af 014a      	clr.l 330(sp)
    52ea:	6046           	bra.s 5332 <TestZoom4Picture+0x15b6>
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    52ec:	307c 000b      	movea.w #11,a0
    52f0:	d1ef 014a      	adda.l 330(sp),a0
    52f4:	222f 014e      	move.l 334(sp),d1
    52f8:	2001           	move.l d1,d0
    52fa:	d080           	add.l d0,d0
    52fc:	d081           	add.l d1,d0
    52fe:	d080           	add.l d0,d0
    5300:	d080           	add.l d0,d0
    5302:	d081           	add.l d1,d0
    5304:	d080           	add.l d0,d0
    5306:	2208           	move.l a0,d1
    5308:	d280           	add.l d0,d1
    530a:	7000           	moveq #0,d0
    530c:	302f 01c6      	move.w 454(sp),d0
    5310:	2f01           	move.l d1,-(sp)
    5312:	2f00           	move.l d0,-(sp)
    5314:	2f2f 01d0      	move.l 464(sp),-(sp)
    5318:	2f2f 0056      	move.l 86(sp),-(sp)
    531c:	4eba 18c0      	jsr 6bde <TestRow>(pc)
    5320:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5324:	702a           	moveq #42,d0
    5326:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    532a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {  
    532e:	52af 014a      	addq.l #1,330(sp)
    5332:	7209           	moveq #9,d1
    5334:	b2af 014a      	cmp.l 330(sp),d1
    5338:	6cb2           	bge.s 52ec <TestZoom4Picture+0x1570>
    }
    for(int i2=0;i2<8;i2++) {
    533a:	42af 0146      	clr.l 326(sp)
    533e:	6000 0086      	bra.w 53c6 <TestZoom4Picture+0x164a>
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    5342:	222f 014e      	move.l 334(sp),d1
    5346:	2001           	move.l d1,d0
    5348:	d080           	add.l d0,d0
    534a:	d081           	add.l d1,d0
    534c:	d080           	add.l d0,d0
    534e:	d080           	add.l d0,d0
    5350:	d081           	add.l d1,d0
    5352:	d080           	add.l d0,d0
    5354:	2040           	movea.l d0,a0
    5356:	41e8 0015      	lea 21(a0),a0
    535a:	2208           	move.l a0,d1
    535c:	d2af 0146      	add.l 326(sp),d1
    5360:	7000           	moveq #0,d0
    5362:	302f 01c6      	move.w 454(sp),d0
    5366:	2f01           	move.l d1,-(sp)
    5368:	2f00           	move.l d0,-(sp)
    536a:	2f2f 01d0      	move.l 464(sp),-(sp)
    536e:	2f2f 0056      	move.l 86(sp),-(sp)
    5372:	4eba 186a      	jsr 6bde <TestRow>(pc)
    5376:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    537a:	702a           	moveq #42,d0
    537c:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    5380:	222f 014e      	move.l 334(sp),d1
    5384:	2001           	move.l d1,d0
    5386:	d080           	add.l d0,d0
    5388:	d081           	add.l d1,d0
    538a:	d080           	add.l d0,d0
    538c:	d080           	add.l d0,d0
    538e:	d081           	add.l d1,d0
    5390:	d080           	add.l d0,d0
    5392:	2040           	movea.l d0,a0
    5394:	41e8 0015      	lea 21(a0),a0
    5398:	2208           	move.l a0,d1
    539a:	d2af 0146      	add.l 326(sp),d1
    539e:	7000           	moveq #0,d0
    53a0:	302f 01c6      	move.w 454(sp),d0
    53a4:	2f01           	move.l d1,-(sp)
    53a6:	2f00           	move.l d0,-(sp)
    53a8:	2f2f 01d0      	move.l 464(sp),-(sp)
    53ac:	2f2f 0056      	move.l 86(sp),-(sp)
    53b0:	4eba 182c      	jsr 6bde <TestRow>(pc)
    53b4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    53b8:	722a           	moveq #42,d1
    53ba:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    53be:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {
    53c2:	52af 0146      	addq.l #1,326(sp)
    53c6:	7007           	moveq #7,d0
    53c8:	b0af 0146      	cmp.l 326(sp),d0
    53cc:	6c00 ff74      	bge.w 5342 <TestZoom4Picture+0x15c6>
  for(int i=0;i<9;i++) {
    53d0:	52af 014e      	addq.l #1,334(sp)
    53d4:	7208           	moveq #8,d1
    53d6:	b2af 014e      	cmp.l 334(sp),d1
    53da:	6c00 ff0a      	bge.w 52e6 <TestZoom4Picture+0x156a>
    }
  }

  for(int i2=0;i2<10;i2++) {  
    53de:	42af 0142      	clr.l 322(sp)
    53e2:	6032           	bra.s 5416 <TestZoom4Picture+0x169a>
    TestRow( valsupposed, valactual, mask, 245+i2);
    53e4:	222f 0142      	move.l 322(sp),d1
    53e8:	0681 0000 00f5 	addi.l #245,d1
    53ee:	7000           	moveq #0,d0
    53f0:	302f 01c6      	move.w 454(sp),d0
    53f4:	2f01           	move.l d1,-(sp)
    53f6:	2f00           	move.l d0,-(sp)
    53f8:	2f2f 01d0      	move.l 464(sp),-(sp)
    53fc:	2f2f 0056      	move.l 86(sp),-(sp)
    5400:	4eba 17dc      	jsr 6bde <TestRow>(pc)
    5404:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5408:	702a           	moveq #42,d0
    540a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    540e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {  
    5412:	52af 0142      	addq.l #1,322(sp)
    5416:	7209           	moveq #9,d1
    5418:	b2af 0142      	cmp.l 322(sp),d1
    541c:	6cc6           	bge.s 53e4 <TestZoom4Picture+0x1668>
  }
  for(int i=0;i<7;i++) {
    541e:	42af 013e      	clr.l 318(sp)
    5422:	6064           	bra.s 5488 <TestZoom4Picture+0x170c>
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    5424:	202f 013e      	move.l 318(sp),d0
    5428:	d080           	add.l d0,d0
    542a:	2200           	move.l d0,d1
    542c:	0681 0000 00ff 	addi.l #255,d1
    5432:	7000           	moveq #0,d0
    5434:	302f 01c6      	move.w 454(sp),d0
    5438:	2f01           	move.l d1,-(sp)
    543a:	2f00           	move.l d0,-(sp)
    543c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5440:	2f2f 0056      	move.l 86(sp),-(sp)
    5444:	4eba 1798      	jsr 6bde <TestRow>(pc)
    5448:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    544c:	702a           	moveq #42,d0
    544e:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    5452:	202f 013e      	move.l 318(sp),d0
    5456:	0680 0000 0080 	addi.l #128,d0
    545c:	d080           	add.l d0,d0
    545e:	2200           	move.l d0,d1
    5460:	7000           	moveq #0,d0
    5462:	302f 01c6      	move.w 454(sp),d0
    5466:	2f01           	move.l d1,-(sp)
    5468:	2f00           	move.l d0,-(sp)
    546a:	2f2f 01d0      	move.l 464(sp),-(sp)
    546e:	2f2f 0056      	move.l 86(sp),-(sp)
    5472:	4eba 176a      	jsr 6bde <TestRow>(pc)
    5476:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    547a:	722a           	moveq #42,d1
    547c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5480:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    5484:	52af 013e      	addq.l #1,318(sp)
    5488:	7006           	moveq #6,d0
    548a:	b0af 013e      	cmp.l 318(sp),d0
    548e:	6c94           	bge.s 5424 <TestZoom4Picture+0x16a8>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5490:	7000           	moveq #0,d0
    5492:	302f 01c6      	move.w 454(sp),d0
    5496:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    549a:	2f00           	move.l d0,-(sp)
    549c:	2f2f 01d0      	move.l 464(sp),-(sp)
    54a0:	2f2f 0056      	move.l 86(sp),-(sp)
    54a4:	4eba 1738      	jsr 6bde <TestRow>(pc)
    54a8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    54ac:	722a           	moveq #42,d1
    54ae:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    54b2:	466f 01c6      	not.w 454(sp)
 
  tmp = source;
    54b6:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    54bc:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    54c2:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    54c8:	4878 0001      	pea 1 <_start+0x1>
    54cc:	4878 0008      	pea 8 <_start+0x8>
    54d0:	2f2f 0056      	move.l 86(sp),-(sp)
    54d4:	2f2f 006a      	move.l 106(sp),-(sp)
    54d8:	4eba c65a      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    54dc:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    54e0:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    54e6:	2c40           	movea.l d0,a6
    54e8:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    54ec:	202f 004e      	move.l 78(sp),d0
    54f0:	5880           	addq.l #4,d0
    54f2:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom9;
    54f6:	2f7c 0000 bcc8 	move.l #48328,74(sp)
    54fc:	004a 
  mask = 0x0000;
    54fe:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5502:	7000           	moveq #0,d0
    5504:	302f 01c6      	move.w 454(sp),d0
    5508:	42a7           	clr.l -(sp)
    550a:	2f00           	move.l d0,-(sp)
    550c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5510:	2f2f 0056      	move.l 86(sp),-(sp)
    5514:	4eba 16c8      	jsr 6bde <TestRow>(pc)
    5518:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    551c:	722a           	moveq #42,d1
    551e:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5522:	466f 01c6      	not.w 454(sp)
  
  for(int i=0;i<3;i++) {
    5526:	42af 013a      	clr.l 314(sp)
    552a:	605c           	bra.s 5588 <TestZoom4Picture+0x180c>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    552c:	202f 013a      	move.l 314(sp),d0
    5530:	d080           	add.l d0,d0
    5532:	2200           	move.l d0,d1
    5534:	5281           	addq.l #1,d1
    5536:	7000           	moveq #0,d0
    5538:	302f 01c6      	move.w 454(sp),d0
    553c:	2f01           	move.l d1,-(sp)
    553e:	2f00           	move.l d0,-(sp)
    5540:	2f2f 01d0      	move.l 464(sp),-(sp)
    5544:	2f2f 0056      	move.l 86(sp),-(sp)
    5548:	4eba 1694      	jsr 6bde <TestRow>(pc)
    554c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5550:	702a           	moveq #42,d0
    5552:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    5556:	202f 013a      	move.l 314(sp),d0
    555a:	5280           	addq.l #1,d0
    555c:	d080           	add.l d0,d0
    555e:	2200           	move.l d0,d1
    5560:	7000           	moveq #0,d0
    5562:	302f 01c6      	move.w 454(sp),d0
    5566:	2f01           	move.l d1,-(sp)
    5568:	2f00           	move.l d0,-(sp)
    556a:	2f2f 01d0      	move.l 464(sp),-(sp)
    556e:	2f2f 0056      	move.l 86(sp),-(sp)
    5572:	4eba 166a      	jsr 6bde <TestRow>(pc)
    5576:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    557a:	722a           	moveq #42,d1
    557c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5580:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    5584:	52af 013a      	addq.l #1,314(sp)
    5588:	7002           	moveq #2,d0
    558a:	b0af 013a      	cmp.l 314(sp),d0
    558e:	6c9c           	bge.s 552c <TestZoom4Picture+0x17b0>
  }

  for(int i=0;i<9;i++) {
    5590:	42af 0136      	clr.l 310(sp)
    5594:	6000 00ea      	bra.w 5680 <TestZoom4Picture+0x1904>
    for(int i2=0;i2<9;i2++) {  
    5598:	42af 0132      	clr.l 306(sp)
    559c:	6044           	bra.s 55e2 <TestZoom4Picture+0x1866>
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    559e:	307c 000b      	movea.w #11,a0
    55a2:	d1ef 0132      	adda.l 306(sp),a0
    55a6:	222f 0136      	move.l 310(sp),d1
    55aa:	2001           	move.l d1,d0
    55ac:	d080           	add.l d0,d0
    55ae:	d081           	add.l d1,d0
    55b0:	2200           	move.l d0,d1
    55b2:	e789           	lsl.l #3,d1
    55b4:	d081           	add.l d1,d0
    55b6:	2208           	move.l a0,d1
    55b8:	d280           	add.l d0,d1
    55ba:	7000           	moveq #0,d0
    55bc:	302f 01c6      	move.w 454(sp),d0
    55c0:	2f01           	move.l d1,-(sp)
    55c2:	2f00           	move.l d0,-(sp)
    55c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    55c8:	2f2f 0056      	move.l 86(sp),-(sp)
    55cc:	4eba 1610      	jsr 6bde <TestRow>(pc)
    55d0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    55d4:	722a           	moveq #42,d1
    55d6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    55da:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {  
    55de:	52af 0132      	addq.l #1,306(sp)
    55e2:	7008           	moveq #8,d0
    55e4:	b0af 0132      	cmp.l 306(sp),d0
    55e8:	6cb4           	bge.s 559e <TestZoom4Picture+0x1822>
    }
    
    for(int i2=0;i2<9;i2++) {
    55ea:	42af 012e      	clr.l 302(sp)
    55ee:	6000 0082      	bra.w 5672 <TestZoom4Picture+0x18f6>
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    55f2:	222f 0136      	move.l 310(sp),d1
    55f6:	2001           	move.l d1,d0
    55f8:	d080           	add.l d0,d0
    55fa:	d081           	add.l d1,d0
    55fc:	2200           	move.l d0,d1
    55fe:	e789           	lsl.l #3,d1
    5600:	2040           	movea.l d0,a0
    5602:	d1c1           	adda.l d1,a0
    5604:	41e8 0014      	lea 20(a0),a0
    5608:	2208           	move.l a0,d1
    560a:	d2af 012e      	add.l 302(sp),d1
    560e:	7000           	moveq #0,d0
    5610:	302f 01c6      	move.w 454(sp),d0
    5614:	2f01           	move.l d1,-(sp)
    5616:	2f00           	move.l d0,-(sp)
    5618:	2f2f 01d0      	move.l 464(sp),-(sp)
    561c:	2f2f 0056      	move.l 86(sp),-(sp)
    5620:	4eba 15bc      	jsr 6bde <TestRow>(pc)
    5624:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5628:	722a           	moveq #42,d1
    562a:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    562e:	222f 0136      	move.l 310(sp),d1
    5632:	2001           	move.l d1,d0
    5634:	d080           	add.l d0,d0
    5636:	d081           	add.l d1,d0
    5638:	2200           	move.l d0,d1
    563a:	e789           	lsl.l #3,d1
    563c:	2040           	movea.l d0,a0
    563e:	d1c1           	adda.l d1,a0
    5640:	41e8 0015      	lea 21(a0),a0
    5644:	2208           	move.l a0,d1
    5646:	d2af 012e      	add.l 302(sp),d1
    564a:	7000           	moveq #0,d0
    564c:	302f 01c6      	move.w 454(sp),d0
    5650:	2f01           	move.l d1,-(sp)
    5652:	2f00           	move.l d0,-(sp)
    5654:	2f2f 01d0      	move.l 464(sp),-(sp)
    5658:	2f2f 0056      	move.l 86(sp),-(sp)
    565c:	4eba 1580      	jsr 6bde <TestRow>(pc)
    5660:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5664:	702a           	moveq #42,d0
    5666:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    566a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {
    566e:	52af 012e      	addq.l #1,302(sp)
    5672:	7208           	moveq #8,d1
    5674:	b2af 012e      	cmp.l 302(sp),d1
    5678:	6c00 ff78      	bge.w 55f2 <TestZoom4Picture+0x1876>
  for(int i=0;i<9;i++) {
    567c:	52af 0136      	addq.l #1,310(sp)
    5680:	7008           	moveq #8,d0
    5682:	b0af 0136      	cmp.l 310(sp),d0
    5686:	6c00 ff10      	bge.w 5598 <TestZoom4Picture+0x181c>
    }
  }

  for(int i2=0;i2<9;i2++) {  
    568a:	42af 012a      	clr.l 298(sp)
    568e:	6032           	bra.s 56c2 <TestZoom4Picture+0x1946>
    TestRow( valsupposed, valactual, mask, 245+i2);
    5690:	222f 012a      	move.l 298(sp),d1
    5694:	0681 0000 00f5 	addi.l #245,d1
    569a:	7000           	moveq #0,d0
    569c:	302f 01c6      	move.w 454(sp),d0
    56a0:	2f01           	move.l d1,-(sp)
    56a2:	2f00           	move.l d0,-(sp)
    56a4:	2f2f 01d0      	move.l 464(sp),-(sp)
    56a8:	2f2f 0056      	move.l 86(sp),-(sp)
    56ac:	4eba 1530      	jsr 6bde <TestRow>(pc)
    56b0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    56b4:	722a           	moveq #42,d1
    56b6:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    56ba:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {  
    56be:	52af 012a      	addq.l #1,298(sp)
    56c2:	7008           	moveq #8,d0
    56c4:	b0af 012a      	cmp.l 298(sp),d0
    56c8:	6cc6           	bge.s 5690 <TestZoom4Picture+0x1914>
  }
  for(int i=0;i<5;i++) {
    56ca:	42af 0126      	clr.l 294(sp)
    56ce:	6064           	bra.s 5734 <TestZoom4Picture+0x19b8>
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    56d0:	202f 0126      	move.l 294(sp),d0
    56d4:	d080           	add.l d0,d0
    56d6:	2200           	move.l d0,d1
    56d8:	0681 0000 0103 	addi.l #259,d1
    56de:	7000           	moveq #0,d0
    56e0:	302f 01c6      	move.w 454(sp),d0
    56e4:	2f01           	move.l d1,-(sp)
    56e6:	2f00           	move.l d0,-(sp)
    56e8:	2f2f 01d0      	move.l 464(sp),-(sp)
    56ec:	2f2f 0056      	move.l 86(sp),-(sp)
    56f0:	4eba 14ec      	jsr 6bde <TestRow>(pc)
    56f4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    56f8:	722a           	moveq #42,d1
    56fa:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    56fe:	202f 0126      	move.l 294(sp),d0
    5702:	0680 0000 0082 	addi.l #130,d0
    5708:	d080           	add.l d0,d0
    570a:	2200           	move.l d0,d1
    570c:	7000           	moveq #0,d0
    570e:	302f 01c6      	move.w 454(sp),d0
    5712:	2f01           	move.l d1,-(sp)
    5714:	2f00           	move.l d0,-(sp)
    5716:	2f2f 01d0      	move.l 464(sp),-(sp)
    571a:	2f2f 0056      	move.l 86(sp),-(sp)
    571e:	4eba 14be      	jsr 6bde <TestRow>(pc)
    5722:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5726:	702a           	moveq #42,d0
    5728:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    572c:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5730:	52af 0126      	addq.l #1,294(sp)
    5734:	7204           	moveq #4,d1
    5736:	b2af 0126      	cmp.l 294(sp),d1
    573a:	6c94           	bge.s 56d0 <TestZoom4Picture+0x1954>
  }
  TestRow( valsupposed, valactual, mask, 269);
    573c:	7000           	moveq #0,d0
    573e:	302f 01c6      	move.w 454(sp),d0
    5742:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5746:	2f00           	move.l d0,-(sp)
    5748:	2f2f 01d0      	move.l 464(sp),-(sp)
    574c:	2f2f 0056      	move.l 86(sp),-(sp)
    5750:	4eba 148c      	jsr 6bde <TestRow>(pc)
    5754:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5758:	702a           	moveq #42,d0
    575a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    575e:	466f 01c6      	not.w 454(sp)

  tmp = source;
    5762:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5768:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    576e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    5774:	4878 0001      	pea 1 <_start+0x1>
    5778:	4878 0009      	pea 9 <_start+0x9>
    577c:	2f2f 0056      	move.l 86(sp),-(sp)
    5780:	2f2f 006a      	move.l 106(sp),-(sp)
    5784:	4eba c3ae      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    5788:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    578c:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    5792:	2c40           	movea.l d0,a6
    5794:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5798:	222f 004e      	move.l 78(sp),d1
    579c:	5881           	addq.l #4,d1
    579e:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom10;
    57a2:	2f7c 0000 bcf4 	move.l #48372,74(sp)
    57a8:	004a 

  mask = 0xffff;
    57aa:	3f7c ffff 01c6 	move.w #-1,454(sp)
  TestRow( valsupposed, valactual, mask, 0);
    57b0:	7000           	moveq #0,d0
    57b2:	302f 01c6      	move.w 454(sp),d0
    57b6:	42a7           	clr.l -(sp)
    57b8:	2f00           	move.l d0,-(sp)
    57ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    57be:	2f2f 0056      	move.l 86(sp),-(sp)
    57c2:	4eba 141a      	jsr 6bde <TestRow>(pc)
    57c6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    57ca:	702a           	moveq #42,d0
    57cc:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    57d0:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 1);   
    57d4:	7000           	moveq #0,d0
    57d6:	302f 01c6      	move.w 454(sp),d0
    57da:	4878 0001      	pea 1 <_start+0x1>
    57de:	2f00           	move.l d0,-(sp)
    57e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    57e4:	2f2f 0056      	move.l 86(sp),-(sp)
    57e8:	4eba 13f4      	jsr 6bde <TestRow>(pc)
    57ec:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    57f0:	722a           	moveq #42,d1
    57f2:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 2);
    57f6:	7000           	moveq #0,d0
    57f8:	302f 01c6      	move.w 454(sp),d0
    57fc:	4878 0002      	pea 2 <_start+0x2>
    5800:	2f00           	move.l d0,-(sp)
    5802:	2f2f 01d0      	move.l 464(sp),-(sp)
    5806:	2f2f 0056      	move.l 86(sp),-(sp)
    580a:	4eba 13d2      	jsr 6bde <TestRow>(pc)
    580e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5812:	702a           	moveq #42,d0
    5814:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5818:	466f 01c6      	not.w 454(sp)

  for(int i=0;i<9;i++) {
    581c:	42af 0122      	clr.l 290(sp)
    5820:	6000 00e0      	bra.w 5902 <TestZoom4Picture+0x1b86>
    for(int i2=0;i2<8;i2++) {  
    5824:	42af 011e      	clr.l 286(sp)
    5828:	6040           	bra.s 586a <TestZoom4Picture+0x1aee>
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    582a:	206f 011e      	movea.l 286(sp),a0
    582e:	5688           	addq.l #3,a0
    5830:	222f 0122      	move.l 290(sp),d1
    5834:	2001           	move.l d1,d0
    5836:	e788           	lsl.l #3,d0
    5838:	9081           	sub.l d1,d0
    583a:	d080           	add.l d0,d0
    583c:	d080           	add.l d0,d0
    583e:	2208           	move.l a0,d1
    5840:	d280           	add.l d0,d1
    5842:	7000           	moveq #0,d0
    5844:	302f 01c6      	move.w 454(sp),d0
    5848:	2f01           	move.l d1,-(sp)
    584a:	2f00           	move.l d0,-(sp)
    584c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5850:	2f2f 0056      	move.l 86(sp),-(sp)
    5854:	4eba 1388      	jsr 6bde <TestRow>(pc)
    5858:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    585c:	722a           	moveq #42,d1
    585e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5862:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {  
    5866:	52af 011e      	addq.l #1,286(sp)
    586a:	7007           	moveq #7,d0
    586c:	b0af 011e      	cmp.l 286(sp),d0
    5870:	6cb8           	bge.s 582a <TestZoom4Picture+0x1aae>
    }
    
    for(int i2=0;i2<10;i2++) {
    5872:	42af 011a      	clr.l 282(sp)
    5876:	607c           	bra.s 58f4 <TestZoom4Picture+0x1b78>
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    5878:	222f 0122      	move.l 290(sp),d1
    587c:	2001           	move.l d1,d0
    587e:	e788           	lsl.l #3,d0
    5880:	9081           	sub.l d1,d0
    5882:	d080           	add.l d0,d0
    5884:	d080           	add.l d0,d0
    5886:	2040           	movea.l d0,a0
    5888:	41e8 000b      	lea 11(a0),a0
    588c:	2208           	move.l a0,d1
    588e:	d2af 011a      	add.l 282(sp),d1
    5892:	7000           	moveq #0,d0
    5894:	302f 01c6      	move.w 454(sp),d0
    5898:	2f01           	move.l d1,-(sp)
    589a:	2f00           	move.l d0,-(sp)
    589c:	2f2f 01d0      	move.l 464(sp),-(sp)
    58a0:	2f2f 0056      	move.l 86(sp),-(sp)
    58a4:	4eba 1338      	jsr 6bde <TestRow>(pc)
    58a8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    58ac:	722a           	moveq #42,d1
    58ae:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    58b2:	222f 0122      	move.l 290(sp),d1
    58b6:	2001           	move.l d1,d0
    58b8:	e788           	lsl.l #3,d0
    58ba:	9081           	sub.l d1,d0
    58bc:	d080           	add.l d0,d0
    58be:	d080           	add.l d0,d0
    58c0:	2040           	movea.l d0,a0
    58c2:	41e8 000b      	lea 11(a0),a0
    58c6:	2208           	move.l a0,d1
    58c8:	d2af 011a      	add.l 282(sp),d1
    58cc:	7000           	moveq #0,d0
    58ce:	302f 01c6      	move.w 454(sp),d0
    58d2:	2f01           	move.l d1,-(sp)
    58d4:	2f00           	move.l d0,-(sp)
    58d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    58da:	2f2f 0056      	move.l 86(sp),-(sp)
    58de:	4eba 12fe      	jsr 6bde <TestRow>(pc)
    58e2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    58e6:	702a           	moveq #42,d0
    58e8:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    58ec:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {
    58f0:	52af 011a      	addq.l #1,282(sp)
    58f4:	7209           	moveq #9,d1
    58f6:	b2af 011a      	cmp.l 282(sp),d1
    58fa:	6c00 ff7c      	bge.w 5878 <TestZoom4Picture+0x1afc>
  for(int i=0;i<9;i++) {
    58fe:	52af 0122      	addq.l #1,290(sp)
    5902:	7008           	moveq #8,d0
    5904:	b0af 0122      	cmp.l 290(sp),d0
    5908:	6c00 ff1a      	bge.w 5824 <TestZoom4Picture+0x1aa8>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    590c:	42af 0116      	clr.l 278(sp)
    5910:	6032           	bra.s 5944 <TestZoom4Picture+0x1bc8>
    TestRow( valsupposed, valactual, mask, 255+i2);
    5912:	222f 0116      	move.l 278(sp),d1
    5916:	0681 0000 00ff 	addi.l #255,d1
    591c:	7000           	moveq #0,d0
    591e:	302f 01c6      	move.w 454(sp),d0
    5922:	2f01           	move.l d1,-(sp)
    5924:	2f00           	move.l d0,-(sp)
    5926:	2f2f 01d0      	move.l 464(sp),-(sp)
    592a:	2f2f 0056      	move.l 86(sp),-(sp)
    592e:	4eba 12ae      	jsr 6bde <TestRow>(pc)
    5932:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5936:	722a           	moveq #42,d1
    5938:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    593c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    5940:	52af 0116      	addq.l #1,278(sp)
    5944:	7007           	moveq #7,d0
    5946:	b0af 0116      	cmp.l 278(sp),d0
    594a:	6cc6           	bge.s 5912 <TestZoom4Picture+0x1b96>
  }
  for(int i=0;i<3;i++) {
    594c:	42af 0112      	clr.l 274(sp)
    5950:	6064           	bra.s 59b6 <TestZoom4Picture+0x1c3a>
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    5952:	202f 0112      	move.l 274(sp),d0
    5956:	d080           	add.l d0,d0
    5958:	2200           	move.l d0,d1
    595a:	0681 0000 0107 	addi.l #263,d1
    5960:	7000           	moveq #0,d0
    5962:	302f 01c6      	move.w 454(sp),d0
    5966:	2f01           	move.l d1,-(sp)
    5968:	2f00           	move.l d0,-(sp)
    596a:	2f2f 01d0      	move.l 464(sp),-(sp)
    596e:	2f2f 0056      	move.l 86(sp),-(sp)
    5972:	4eba 126a      	jsr 6bde <TestRow>(pc)
    5976:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    597a:	722a           	moveq #42,d1
    597c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    5980:	202f 0112      	move.l 274(sp),d0
    5984:	0680 0000 0084 	addi.l #132,d0
    598a:	d080           	add.l d0,d0
    598c:	2200           	move.l d0,d1
    598e:	7000           	moveq #0,d0
    5990:	302f 01c6      	move.w 454(sp),d0
    5994:	2f01           	move.l d1,-(sp)
    5996:	2f00           	move.l d0,-(sp)
    5998:	2f2f 01d0      	move.l 464(sp),-(sp)
    599c:	2f2f 0056      	move.l 86(sp),-(sp)
    59a0:	4eba 123c      	jsr 6bde <TestRow>(pc)
    59a4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    59a8:	702a           	moveq #42,d0
    59aa:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    59ae:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    59b2:	52af 0112      	addq.l #1,274(sp)
    59b6:	7202           	moveq #2,d1
    59b8:	b2af 0112      	cmp.l 274(sp),d1
    59bc:	6c94           	bge.s 5952 <TestZoom4Picture+0x1bd6>
  }

  tmp = source;
    59be:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    59c4:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    59ca:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    59d0:	4878 0001      	pea 1 <_start+0x1>
    59d4:	4878 000a      	pea a <_start+0xa>
    59d8:	2f2f 0056      	move.l 86(sp),-(sp)
    59dc:	2f2f 006a      	move.l 106(sp),-(sp)
    59e0:	4eba c152      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    59e4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    59e8:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    59ee:	2c40           	movea.l d0,a6
    59f0:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    59f4:	202f 004e      	move.l 78(sp),d0
    59f8:	5880           	addq.l #4,d0
    59fa:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom11;
    59fe:	2f7c 0000 bd20 	move.l #48416,74(sp)
    5a04:	004a 

  mask = 0xffff;
    5a06:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  for(int i2=0;i2<6;i2++) {  
    5a0c:	42af 010e      	clr.l 270(sp)
    5a10:	602a           	bra.s 5a3c <TestZoom4Picture+0x1cc0>
    TestRow( valsupposed, valactual, mask, i2);
    5a12:	7000           	moveq #0,d0
    5a14:	302f 01c6      	move.w 454(sp),d0
    5a18:	2f2f 010e      	move.l 270(sp),-(sp)
    5a1c:	2f00           	move.l d0,-(sp)
    5a1e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a22:	2f2f 0056      	move.l 86(sp),-(sp)
    5a26:	4eba 11b6      	jsr 6bde <TestRow>(pc)
    5a2a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a2e:	722a           	moveq #42,d1
    5a30:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5a34:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {  
    5a38:	52af 010e      	addq.l #1,270(sp)
    5a3c:	7005           	moveq #5,d0
    5a3e:	b0af 010e      	cmp.l 270(sp),d0
    5a42:	6cce           	bge.s 5a12 <TestZoom4Picture+0x1c96>
  }

  for(int i2=0;i2<11;i2++) {
    5a44:	42af 010a      	clr.l 266(sp)
    5a48:	605c           	bra.s 5aa6 <TestZoom4Picture+0x1d2a>
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    5a4a:	202f 010a      	move.l 266(sp),d0
    5a4e:	5680           	addq.l #3,d0
    5a50:	d080           	add.l d0,d0
    5a52:	2200           	move.l d0,d1
    5a54:	7000           	moveq #0,d0
    5a56:	302f 01c6      	move.w 454(sp),d0
    5a5a:	2f01           	move.l d1,-(sp)
    5a5c:	2f00           	move.l d0,-(sp)
    5a5e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a62:	2f2f 0056      	move.l 86(sp),-(sp)
    5a66:	4eba 1176      	jsr 6bde <TestRow>(pc)
    5a6a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a6e:	722a           	moveq #42,d1
    5a70:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    5a74:	202f 010a      	move.l 266(sp),d0
    5a78:	d080           	add.l d0,d0
    5a7a:	2200           	move.l d0,d1
    5a7c:	5e81           	addq.l #7,d1
    5a7e:	7000           	moveq #0,d0
    5a80:	302f 01c6      	move.w 454(sp),d0
    5a84:	2f01           	move.l d1,-(sp)
    5a86:	2f00           	move.l d0,-(sp)
    5a88:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a8c:	2f2f 0056      	move.l 86(sp),-(sp)
    5a90:	4eba 114c      	jsr 6bde <TestRow>(pc)
    5a94:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a98:	702a           	moveq #42,d0
    5a9a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5a9e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5aa2:	52af 010a      	addq.l #1,266(sp)
    5aa6:	720a           	moveq #10,d1
    5aa8:	b2af 010a      	cmp.l 266(sp),d1
    5aac:	6c9c           	bge.s 5a4a <TestZoom4Picture+0x1cce>
  }

  for(int i=0;i<8;i++) {
    5aae:	42af 0106      	clr.l 262(sp)
    5ab2:	6000 00f2      	bra.w 5ba6 <TestZoom4Picture+0x1e2a>
    for(int i2=0;i2<7;i2++) {  
    5ab6:	42af 0102      	clr.l 258(sp)
    5aba:	6044           	bra.s 5b00 <TestZoom4Picture+0x1d84>
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    5abc:	307c 001c      	movea.w #28,a0
    5ac0:	d1ef 0102      	adda.l 258(sp),a0
    5ac4:	222f 0106      	move.l 262(sp),d1
    5ac8:	2001           	move.l d1,d0
    5aca:	e788           	lsl.l #3,d0
    5acc:	9081           	sub.l d1,d0
    5ace:	d080           	add.l d0,d0
    5ad0:	d080           	add.l d0,d0
    5ad2:	d081           	add.l d1,d0
    5ad4:	2208           	move.l a0,d1
    5ad6:	d280           	add.l d0,d1
    5ad8:	7000           	moveq #0,d0
    5ada:	302f 01c6      	move.w 454(sp),d0
    5ade:	2f01           	move.l d1,-(sp)
    5ae0:	2f00           	move.l d0,-(sp)
    5ae2:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ae6:	2f2f 0056      	move.l 86(sp),-(sp)
    5aea:	4eba 10f2      	jsr 6bde <TestRow>(pc)
    5aee:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5af2:	702a           	moveq #42,d0
    5af4:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5af8:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<7;i2++) {  
    5afc:	52af 0102      	addq.l #1,258(sp)
    5b00:	7206           	moveq #6,d1
    5b02:	b2af 0102      	cmp.l 258(sp),d1
    5b06:	6cb4           	bge.s 5abc <TestZoom4Picture+0x1d40>
    }
    
    for(int i2=0;i2<11;i2++) {
    5b08:	42af 00fe      	clr.l 254(sp)
    5b0c:	6000 008a      	bra.w 5b98 <TestZoom4Picture+0x1e1c>
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    5b10:	222f 0106      	move.l 262(sp),d1
    5b14:	2001           	move.l d1,d0
    5b16:	e788           	lsl.l #3,d0
    5b18:	9081           	sub.l d1,d0
    5b1a:	d080           	add.l d0,d0
    5b1c:	d080           	add.l d0,d0
    5b1e:	2040           	movea.l d0,a0
    5b20:	d1c1           	adda.l d1,a0
    5b22:	41e8 0023      	lea 35(a0),a0
    5b26:	202f 00fe      	move.l 254(sp),d0
    5b2a:	d080           	add.l d0,d0
    5b2c:	2208           	move.l a0,d1
    5b2e:	d280           	add.l d0,d1
    5b30:	7000           	moveq #0,d0
    5b32:	302f 01c6      	move.w 454(sp),d0
    5b36:	2f01           	move.l d1,-(sp)
    5b38:	2f00           	move.l d0,-(sp)
    5b3a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b3e:	2f2f 0056      	move.l 86(sp),-(sp)
    5b42:	4eba 109a      	jsr 6bde <TestRow>(pc)
    5b46:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5b4a:	702a           	moveq #42,d0
    5b4c:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    5b50:	222f 0106      	move.l 262(sp),d1
    5b54:	2001           	move.l d1,d0
    5b56:	e788           	lsl.l #3,d0
    5b58:	9081           	sub.l d1,d0
    5b5a:	d080           	add.l d0,d0
    5b5c:	d080           	add.l d0,d0
    5b5e:	2040           	movea.l d0,a0
    5b60:	d1c1           	adda.l d1,a0
    5b62:	41e8 000b      	lea 11(a0),a0
    5b66:	202f 00fe      	move.l 254(sp),d0
    5b6a:	d080           	add.l d0,d0
    5b6c:	2208           	move.l a0,d1
    5b6e:	d280           	add.l d0,d1
    5b70:	7000           	moveq #0,d0
    5b72:	302f 01c6      	move.w 454(sp),d0
    5b76:	2f01           	move.l d1,-(sp)
    5b78:	2f00           	move.l d0,-(sp)
    5b7a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b7e:	2f2f 0056      	move.l 86(sp),-(sp)
    5b82:	4eba 105a      	jsr 6bde <TestRow>(pc)
    5b86:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5b8a:	722a           	moveq #42,d1
    5b8c:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5b90:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {
    5b94:	52af 00fe      	addq.l #1,254(sp)
    5b98:	700a           	moveq #10,d0
    5b9a:	b0af 00fe      	cmp.l 254(sp),d0
    5b9e:	6c00 ff70      	bge.w 5b10 <TestZoom4Picture+0x1d94>
  for(int i=0;i<8;i++) {
    5ba2:	52af 0106      	addq.l #1,262(sp)
    5ba6:	7207           	moveq #7,d1
    5ba8:	b2af 0106      	cmp.l 262(sp),d1
    5bac:	6c00 ff08      	bge.w 5ab6 <TestZoom4Picture+0x1d3a>
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    5bb0:	42af 00fa      	clr.l 250(sp)
    5bb4:	6032           	bra.s 5be8 <TestZoom4Picture+0x1e6c>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5bb6:	222f 00fa      	move.l 250(sp),d1
    5bba:	0681 0000 0104 	addi.l #260,d1
    5bc0:	7000           	moveq #0,d0
    5bc2:	302f 01c6      	move.w 454(sp),d0
    5bc6:	2f01           	move.l d1,-(sp)
    5bc8:	2f00           	move.l d0,-(sp)
    5bca:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bce:	2f2f 0056      	move.l 86(sp),-(sp)
    5bd2:	4eba 100a      	jsr 6bde <TestRow>(pc)
    5bd6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5bda:	702a           	moveq #42,d0
    5bdc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5be0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    5be4:	52af 00fa      	addq.l #1,250(sp)
    5be8:	7206           	moveq #6,d1
    5bea:	b2af 00fa      	cmp.l 250(sp),d1
    5bee:	6cc6           	bge.s 5bb6 <TestZoom4Picture+0x1e3a>
  }
  TestRow( valsupposed, valactual, mask, 267);   
    5bf0:	7000           	moveq #0,d0
    5bf2:	302f 01c6      	move.w 454(sp),d0
    5bf6:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    5bfa:	2f00           	move.l d0,-(sp)
    5bfc:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c00:	2f2f 0056      	move.l 86(sp),-(sp)
    5c04:	4eba 0fd8      	jsr 6bde <TestRow>(pc)
    5c08:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5c0c:	702a           	moveq #42,d0
    5c0e:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 268);
    5c12:	7000           	moveq #0,d0
    5c14:	302f 01c6      	move.w 454(sp),d0
    5c18:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    5c1c:	2f00           	move.l d0,-(sp)
    5c1e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c22:	2f2f 0056      	move.l 86(sp),-(sp)
    5c26:	4eba 0fb6      	jsr 6bde <TestRow>(pc)
    5c2a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5c2e:	722a           	moveq #42,d1
    5c30:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5c34:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 269);
    5c38:	7000           	moveq #0,d0
    5c3a:	302f 01c6      	move.w 454(sp),d0
    5c3e:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5c42:	2f00           	move.l d0,-(sp)
    5c44:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c48:	2f2f 0056      	move.l 86(sp),-(sp)
    5c4c:	4eba 0f90      	jsr 6bde <TestRow>(pc)
    5c50:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5c54:	702a           	moveq #42,d0
    5c56:	d1af 01c8      	add.l d0,456(sp)
  
  tmp = source;
    5c5a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5c60:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5c66:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    5c6c:	4878 0001      	pea 1 <_start+0x1>
    5c70:	4878 000b      	pea b <_start+0xb>
    5c74:	2f2f 0056      	move.l 86(sp),-(sp)
    5c78:	2f2f 006a      	move.l 106(sp),-(sp)
    5c7c:	4eba beb6      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    5c80:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5c84:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    5c8a:	2c40           	movea.l d0,a6
    5c8c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5c90:	222f 004e      	move.l 78(sp),d1
    5c94:	5881           	addq.l #4,d1
    5c96:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom12;
    5c9a:	2f7c 0000 bd4c 	move.l #48460,74(sp)
    5ca0:	004a 

  mask = 0x0;
    5ca2:	426f 01c6      	clr.w 454(sp)
   
  TestRow( valsupposed, valactual, mask, 0);
    5ca6:	7000           	moveq #0,d0
    5ca8:	302f 01c6      	move.w 454(sp),d0
    5cac:	42a7           	clr.l -(sp)
    5cae:	2f00           	move.l d0,-(sp)
    5cb0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5cb4:	2f2f 0056      	move.l 86(sp),-(sp)
    5cb8:	4eba 0f24      	jsr 6bde <TestRow>(pc)
    5cbc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5cc0:	702a           	moveq #42,d0
    5cc2:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5cc6:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<12;i2++) {
    5cca:	42af 00f6      	clr.l 246(sp)
    5cce:	605c           	bra.s 5d2c <TestZoom4Picture+0x1fb0>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5cd0:	202f 00f6      	move.l 246(sp),d0
    5cd4:	d080           	add.l d0,d0
    5cd6:	2200           	move.l d0,d1
    5cd8:	5281           	addq.l #1,d1
    5cda:	7000           	moveq #0,d0
    5cdc:	302f 01c6      	move.w 454(sp),d0
    5ce0:	2f01           	move.l d1,-(sp)
    5ce2:	2f00           	move.l d0,-(sp)
    5ce4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ce8:	2f2f 0056      	move.l 86(sp),-(sp)
    5cec:	4eba 0ef0      	jsr 6bde <TestRow>(pc)
    5cf0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5cf4:	722a           	moveq #42,d1
    5cf6:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5cfa:	202f 00f6      	move.l 246(sp),d0
    5cfe:	5280           	addq.l #1,d0
    5d00:	d080           	add.l d0,d0
    5d02:	2200           	move.l d0,d1
    5d04:	7000           	moveq #0,d0
    5d06:	302f 01c6      	move.w 454(sp),d0
    5d0a:	2f01           	move.l d1,-(sp)
    5d0c:	2f00           	move.l d0,-(sp)
    5d0e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d12:	2f2f 0056      	move.l 86(sp),-(sp)
    5d16:	4eba 0ec6      	jsr 6bde <TestRow>(pc)
    5d1a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5d1e:	702a           	moveq #42,d0
    5d20:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5d24:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    5d28:	52af 00f6      	addq.l #1,246(sp)
    5d2c:	720b           	moveq #11,d1
    5d2e:	b2af 00f6      	cmp.l 246(sp),d1
    5d32:	6c9c           	bge.s 5cd0 <TestZoom4Picture+0x1f54>
  } 

  for(int i=0;i<8;i++) {
    5d34:	42af 00f2      	clr.l 242(sp)
    5d38:	6000 00e6      	bra.w 5e20 <TestZoom4Picture+0x20a4>
    for(int i2=0;i2<6;i2++) {  
    5d3c:	42af 00ee      	clr.l 238(sp)
    5d40:	6040           	bra.s 5d82 <TestZoom4Picture+0x2006>
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    5d42:	307c 0019      	movea.w #25,a0
    5d46:	d1ef 00ee      	adda.l 238(sp),a0
    5d4a:	222f 00f2      	move.l 242(sp),d1
    5d4e:	2001           	move.l d1,d0
    5d50:	e988           	lsl.l #4,d0
    5d52:	9081           	sub.l d1,d0
    5d54:	d080           	add.l d0,d0
    5d56:	2208           	move.l a0,d1
    5d58:	d280           	add.l d0,d1
    5d5a:	7000           	moveq #0,d0
    5d5c:	302f 01c6      	move.w 454(sp),d0
    5d60:	2f01           	move.l d1,-(sp)
    5d62:	2f00           	move.l d0,-(sp)
    5d64:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d68:	2f2f 0056      	move.l 86(sp),-(sp)
    5d6c:	4eba 0e70      	jsr 6bde <TestRow>(pc)
    5d70:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5d74:	702a           	moveq #42,d0
    5d76:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5d7a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<6;i2++) {  
    5d7e:	52af 00ee      	addq.l #1,238(sp)
    5d82:	7205           	moveq #5,d1
    5d84:	b2af 00ee      	cmp.l 238(sp),d1
    5d88:	6cb8           	bge.s 5d42 <TestZoom4Picture+0x1fc6>
    }
    
    for(int i2=0;i2<12;i2++) {
    5d8a:	42af 00ea      	clr.l 234(sp)
    5d8e:	6000 0082      	bra.w 5e12 <TestZoom4Picture+0x2096>
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    5d92:	222f 00f2      	move.l 242(sp),d1
    5d96:	2001           	move.l d1,d0
    5d98:	e988           	lsl.l #4,d0
    5d9a:	9081           	sub.l d1,d0
    5d9c:	d080           	add.l d0,d0
    5d9e:	2040           	movea.l d0,a0
    5da0:	41e8 001f      	lea 31(a0),a0
    5da4:	202f 00ea      	move.l 234(sp),d0
    5da8:	d080           	add.l d0,d0
    5daa:	2208           	move.l a0,d1
    5dac:	d280           	add.l d0,d1
    5dae:	7000           	moveq #0,d0
    5db0:	302f 01c6      	move.w 454(sp),d0
    5db4:	2f01           	move.l d1,-(sp)
    5db6:	2f00           	move.l d0,-(sp)
    5db8:	2f2f 01d0      	move.l 464(sp),-(sp)
    5dbc:	2f2f 0056      	move.l 86(sp),-(sp)
    5dc0:	4eba 0e1c      	jsr 6bde <TestRow>(pc)
    5dc4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5dc8:	702a           	moveq #42,d0
    5dca:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    5dce:	222f 00f2      	move.l 242(sp),d1
    5dd2:	2001           	move.l d1,d0
    5dd4:	e988           	lsl.l #4,d0
    5dd6:	9081           	sub.l d1,d0
    5dd8:	d080           	add.l d0,d0
    5dda:	2040           	movea.l d0,a0
    5ddc:	41e8 0020      	lea 32(a0),a0
    5de0:	202f 00ea      	move.l 234(sp),d0
    5de4:	d080           	add.l d0,d0
    5de6:	2208           	move.l a0,d1
    5de8:	d280           	add.l d0,d1
    5dea:	7000           	moveq #0,d0
    5dec:	302f 01c6      	move.w 454(sp),d0
    5df0:	2f01           	move.l d1,-(sp)
    5df2:	2f00           	move.l d0,-(sp)
    5df4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5df8:	2f2f 0056      	move.l 86(sp),-(sp)
    5dfc:	4eba 0de0      	jsr 6bde <TestRow>(pc)
    5e00:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5e04:	722a           	moveq #42,d1
    5e06:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5e0a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {
    5e0e:	52af 00ea      	addq.l #1,234(sp)
    5e12:	700b           	moveq #11,d0
    5e14:	b0af 00ea      	cmp.l 234(sp),d0
    5e18:	6c00 ff78      	bge.w 5d92 <TestZoom4Picture+0x2016>
  for(int i=0;i<8;i++) {
    5e1c:	52af 00f2      	addq.l #1,242(sp)
    5e20:	7207           	moveq #7,d1
    5e22:	b2af 00f2      	cmp.l 242(sp),d1
    5e26:	6c00 ff14      	bge.w 5d3c <TestZoom4Picture+0x1fc0>
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    5e2a:	42af 00e6      	clr.l 230(sp)
    5e2e:	6032           	bra.s 5e62 <TestZoom4Picture+0x20e6>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5e30:	222f 00e6      	move.l 230(sp),d1
    5e34:	0681 0000 0104 	addi.l #260,d1
    5e3a:	7000           	moveq #0,d0
    5e3c:	302f 01c6      	move.w 454(sp),d0
    5e40:	2f01           	move.l d1,-(sp)
    5e42:	2f00           	move.l d0,-(sp)
    5e44:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e48:	2f2f 0056      	move.l 86(sp),-(sp)
    5e4c:	4eba 0d90      	jsr 6bde <TestRow>(pc)
    5e50:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5e54:	702a           	moveq #42,d0
    5e56:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5e5a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5e5e:	52af 00e6      	addq.l #1,230(sp)
    5e62:	7204           	moveq #4,d1
    5e64:	b2af 00e6      	cmp.l 230(sp),d1
    5e68:	6cc6           	bge.s 5e30 <TestZoom4Picture+0x20b4>
  }

  tmp = source;
    5e6a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5e70:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5e76:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    5e7c:	4878 0001      	pea 1 <_start+0x1>
    5e80:	4878 000c      	pea c <_start+0xc>
    5e84:	2f2f 0056      	move.l 86(sp),-(sp)
    5e88:	2f2f 006a      	move.l 106(sp),-(sp)
    5e8c:	4eba bca6      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    5e90:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5e94:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    5e9a:	2c40           	movea.l d0,a6
    5e9c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5ea0:	202f 004e      	move.l 78(sp),d0
    5ea4:	5880           	addq.l #4,d0
    5ea6:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom13;
    5eaa:	2f7c 0000 bd78 	move.l #48504,74(sp)
    5eb0:	004a 

  mask = 0xffff;
    5eb2:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<11;i2++) {
    5eb8:	42af 00e2      	clr.l 226(sp)
    5ebc:	605a           	bra.s 5f18 <TestZoom4Picture+0x219c>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    5ebe:	202f 00e2      	move.l 226(sp),d0
    5ec2:	d080           	add.l d0,d0
    5ec4:	2200           	move.l d0,d1
    5ec6:	7000           	moveq #0,d0
    5ec8:	302f 01c6      	move.w 454(sp),d0
    5ecc:	2f01           	move.l d1,-(sp)
    5ece:	2f00           	move.l d0,-(sp)
    5ed0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ed4:	2f2f 0056      	move.l 86(sp),-(sp)
    5ed8:	4eba 0d04      	jsr 6bde <TestRow>(pc)
    5edc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5ee0:	722a           	moveq #42,d1
    5ee2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    5ee6:	202f 00e2      	move.l 226(sp),d0
    5eea:	d080           	add.l d0,d0
    5eec:	2200           	move.l d0,d1
    5eee:	5281           	addq.l #1,d1
    5ef0:	7000           	moveq #0,d0
    5ef2:	302f 01c6      	move.w 454(sp),d0
    5ef6:	2f01           	move.l d1,-(sp)
    5ef8:	2f00           	move.l d0,-(sp)
    5efa:	2f2f 01d0      	move.l 464(sp),-(sp)
    5efe:	2f2f 0056      	move.l 86(sp),-(sp)
    5f02:	4eba 0cda      	jsr 6bde <TestRow>(pc)
    5f06:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5f0a:	702a           	moveq #42,d0
    5f0c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5f10:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5f14:	52af 00e2      	addq.l #1,226(sp)
    5f18:	720a           	moveq #10,d1
    5f1a:	b2af 00e2      	cmp.l 226(sp),d1
    5f1e:	6c9e           	bge.s 5ebe <TestZoom4Picture+0x2142>
  } 

  for(int i=0;i<8;i++) {
    5f20:	42af 00de      	clr.l 222(sp)
    5f24:	6000 00de      	bra.w 6004 <TestZoom4Picture+0x2288>
    for(int i2=0;i2<5;i2++) {  
    5f28:	42af 00da      	clr.l 218(sp)
    5f2c:	603e           	bra.s 5f6c <TestZoom4Picture+0x21f0>
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    5f2e:	307c 0016      	movea.w #22,a0
    5f32:	d1ef 00da      	adda.l 218(sp),a0
    5f36:	222f 00de      	move.l 222(sp),d1
    5f3a:	2001           	move.l d1,d0
    5f3c:	eb88           	lsl.l #5,d0
    5f3e:	9081           	sub.l d1,d0
    5f40:	2208           	move.l a0,d1
    5f42:	d280           	add.l d0,d1
    5f44:	7000           	moveq #0,d0
    5f46:	302f 01c6      	move.w 454(sp),d0
    5f4a:	2f01           	move.l d1,-(sp)
    5f4c:	2f00           	move.l d0,-(sp)
    5f4e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f52:	2f2f 0056      	move.l 86(sp),-(sp)
    5f56:	4eba 0c86      	jsr 6bde <TestRow>(pc)
    5f5a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f5e:	702a           	moveq #42,d0
    5f60:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5f64:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<5;i2++) {  
    5f68:	52af 00da      	addq.l #1,218(sp)
    5f6c:	7204           	moveq #4,d1
    5f6e:	b2af 00da      	cmp.l 218(sp),d1
    5f72:	6cba           	bge.s 5f2e <TestZoom4Picture+0x21b2>
    }
    
    for(int i2=0;i2<13;i2++) {
    5f74:	42af 00d6      	clr.l 214(sp)
    5f78:	607c           	bra.s 5ff6 <TestZoom4Picture+0x227a>
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    5f7a:	222f 00de      	move.l 222(sp),d1
    5f7e:	2001           	move.l d1,d0
    5f80:	eb88           	lsl.l #5,d0
    5f82:	2040           	movea.l d0,a0
    5f84:	91c1           	suba.l d1,a0
    5f86:	41e8 001b      	lea 27(a0),a0
    5f8a:	202f 00d6      	move.l 214(sp),d0
    5f8e:	d080           	add.l d0,d0
    5f90:	2208           	move.l a0,d1
    5f92:	d280           	add.l d0,d1
    5f94:	7000           	moveq #0,d0
    5f96:	302f 01c6      	move.w 454(sp),d0
    5f9a:	2f01           	move.l d1,-(sp)
    5f9c:	2f00           	move.l d0,-(sp)
    5f9e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5fa2:	2f2f 0056      	move.l 86(sp),-(sp)
    5fa6:	4eba 0c36      	jsr 6bde <TestRow>(pc)
    5faa:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5fae:	702a           	moveq #42,d0
    5fb0:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    5fb4:	222f 00de      	move.l 222(sp),d1
    5fb8:	2001           	move.l d1,d0
    5fba:	eb88           	lsl.l #5,d0
    5fbc:	2040           	movea.l d0,a0
    5fbe:	91c1           	suba.l d1,a0
    5fc0:	41e8 001c      	lea 28(a0),a0
    5fc4:	202f 00d6      	move.l 214(sp),d0
    5fc8:	d080           	add.l d0,d0
    5fca:	2208           	move.l a0,d1
    5fcc:	d280           	add.l d0,d1
    5fce:	7000           	moveq #0,d0
    5fd0:	302f 01c6      	move.w 454(sp),d0
    5fd4:	2f01           	move.l d1,-(sp)
    5fd6:	2f00           	move.l d0,-(sp)
    5fd8:	2f2f 01d0      	move.l 464(sp),-(sp)
    5fdc:	2f2f 0056      	move.l 86(sp),-(sp)
    5fe0:	4eba 0bfc      	jsr 6bde <TestRow>(pc)
    5fe4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5fe8:	722a           	moveq #42,d1
    5fea:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5fee:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {
    5ff2:	52af 00d6      	addq.l #1,214(sp)
    5ff6:	700c           	moveq #12,d0
    5ff8:	b0af 00d6      	cmp.l 214(sp),d0
    5ffc:	6c00 ff7c      	bge.w 5f7a <TestZoom4Picture+0x21fe>
  for(int i=0;i<8;i++) {
    6000:	52af 00de      	addq.l #1,222(sp)
    6004:	7207           	moveq #7,d1
    6006:	b2af 00de      	cmp.l 222(sp),d1
    600a:	6c00 ff1c      	bge.w 5f28 <TestZoom4Picture+0x21ac>
    }
  } 

  tmp = source;
    600e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6014:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    601a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    6020:	4878 0001      	pea 1 <_start+0x1>
    6024:	4878 000d      	pea d <_start+0xd>
    6028:	2f2f 0056      	move.l 86(sp),-(sp)
    602c:	2f2f 006a      	move.l 106(sp),-(sp)
    6030:	4eba bb02      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    6034:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6038:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    603e:	2c40           	movea.l d0,a6
    6040:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6044:	202f 004e      	move.l 78(sp),d0
    6048:	5880           	addq.l #4,d0
    604a:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom14;
    604e:	2f7c 0000 bda4 	move.l #48548,74(sp)
    6054:	004a 

  mask = 0xffff;
    6056:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    605c:	7000           	moveq #0,d0
    605e:	302f 01c6      	move.w 454(sp),d0
    6062:	42a7           	clr.l -(sp)
    6064:	2f00           	move.l d0,-(sp)
    6066:	2f2f 01d0      	move.l 464(sp),-(sp)
    606a:	2f2f 0056      	move.l 86(sp),-(sp)
    606e:	4eba 0b6e      	jsr 6bde <TestRow>(pc)
    6072:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2; 
    6076:	722a           	moveq #42,d1
    6078:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff; 
    607c:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<9;i2++) {
    6080:	42af 00d2      	clr.l 210(sp)
    6084:	605c           	bra.s 60e2 <TestZoom4Picture+0x2366>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    6086:	202f 00d2      	move.l 210(sp),d0
    608a:	d080           	add.l d0,d0
    608c:	2200           	move.l d0,d1
    608e:	5281           	addq.l #1,d1
    6090:	7000           	moveq #0,d0
    6092:	302f 01c6      	move.w 454(sp),d0
    6096:	2f01           	move.l d1,-(sp)
    6098:	2f00           	move.l d0,-(sp)
    609a:	2f2f 01d0      	move.l 464(sp),-(sp)
    609e:	2f2f 0056      	move.l 86(sp),-(sp)
    60a2:	4eba 0b3a      	jsr 6bde <TestRow>(pc)
    60a6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    60aa:	702a           	moveq #42,d0
    60ac:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    60b0:	202f 00d2      	move.l 210(sp),d0
    60b4:	5280           	addq.l #1,d0
    60b6:	d080           	add.l d0,d0
    60b8:	2200           	move.l d0,d1
    60ba:	7000           	moveq #0,d0
    60bc:	302f 01c6      	move.w 454(sp),d0
    60c0:	2f01           	move.l d1,-(sp)
    60c2:	2f00           	move.l d0,-(sp)
    60c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    60c8:	2f2f 0056      	move.l 86(sp),-(sp)
    60cc:	4eba 0b10      	jsr 6bde <TestRow>(pc)
    60d0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    60d4:	722a           	moveq #42,d1
    60d6:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    60da:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {
    60de:	52af 00d2      	addq.l #1,210(sp)
    60e2:	7008           	moveq #8,d0
    60e4:	b0af 00d2      	cmp.l 210(sp),d0
    60e8:	6c9c           	bge.s 6086 <TestZoom4Picture+0x230a>
  } 

  for(int i=0;i<7;i++) {
    60ea:	42af 00ce      	clr.l 206(sp)
    60ee:	6000 00cc      	bra.w 61bc <TestZoom4Picture+0x2440>
    for(int i2=0;i2<4;i2++) {  
    60f2:	42af 00ca      	clr.l 202(sp)
    60f6:	6036           	bra.s 612e <TestZoom4Picture+0x23b2>
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    60f8:	7213           	moveq #19,d1
    60fa:	d2af 00ca      	add.l 202(sp),d1
    60fe:	202f 00ce      	move.l 206(sp),d0
    6102:	eb88           	lsl.l #5,d0
    6104:	d280           	add.l d0,d1
    6106:	7000           	moveq #0,d0
    6108:	302f 01c6      	move.w 454(sp),d0
    610c:	2f01           	move.l d1,-(sp)
    610e:	2f00           	move.l d0,-(sp)
    6110:	2f2f 01d0      	move.l 464(sp),-(sp)
    6114:	2f2f 0056      	move.l 86(sp),-(sp)
    6118:	4eba 0ac4      	jsr 6bde <TestRow>(pc)
    611c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6120:	722a           	moveq #42,d1
    6122:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6126:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<4;i2++) {  
    612a:	52af 00ca      	addq.l #1,202(sp)
    612e:	7003           	moveq #3,d0
    6130:	b0af 00ca      	cmp.l 202(sp),d0
    6134:	6cc2           	bge.s 60f8 <TestZoom4Picture+0x237c>
    }
    
    for(int i2=0;i2<14;i2++) {
    6136:	42af 00c6      	clr.l 198(sp)
    613a:	6074           	bra.s 61b0 <TestZoom4Picture+0x2434>
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    613c:	202f 00ce      	move.l 206(sp),d0
    6140:	eb88           	lsl.l #5,d0
    6142:	307c 0017      	movea.w #23,a0
    6146:	d1c0           	adda.l d0,a0
    6148:	202f 00c6      	move.l 198(sp),d0
    614c:	d080           	add.l d0,d0
    614e:	2208           	move.l a0,d1
    6150:	d280           	add.l d0,d1
    6152:	7000           	moveq #0,d0
    6154:	302f 01c6      	move.w 454(sp),d0
    6158:	2f01           	move.l d1,-(sp)
    615a:	2f00           	move.l d0,-(sp)
    615c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6160:	2f2f 0056      	move.l 86(sp),-(sp)
    6164:	4eba 0a78      	jsr 6bde <TestRow>(pc)
    6168:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    616c:	722a           	moveq #42,d1
    616e:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    6172:	202f 00ce      	move.l 206(sp),d0
    6176:	eb88           	lsl.l #5,d0
    6178:	307c 0018      	movea.w #24,a0
    617c:	d1c0           	adda.l d0,a0
    617e:	202f 00c6      	move.l 198(sp),d0
    6182:	d080           	add.l d0,d0
    6184:	2208           	move.l a0,d1
    6186:	d280           	add.l d0,d1
    6188:	7000           	moveq #0,d0
    618a:	302f 01c6      	move.w 454(sp),d0
    618e:	2f01           	move.l d1,-(sp)
    6190:	2f00           	move.l d0,-(sp)
    6192:	2f2f 01d0      	move.l 464(sp),-(sp)
    6196:	2f2f 0056      	move.l 86(sp),-(sp)
    619a:	4eba 0a42      	jsr 6bde <TestRow>(pc)
    619e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    61a2:	702a           	moveq #42,d0
    61a4:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    61a8:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {
    61ac:	52af 00c6      	addq.l #1,198(sp)
    61b0:	720d           	moveq #13,d1
    61b2:	b2af 00c6      	cmp.l 198(sp),d1
    61b6:	6c84           	bge.s 613c <TestZoom4Picture+0x23c0>
  for(int i=0;i<7;i++) {
    61b8:	52af 00ce      	addq.l #1,206(sp)
    61bc:	7006           	moveq #6,d0
    61be:	b0af 00ce      	cmp.l 206(sp),d0
    61c2:	6c00 ff2e      	bge.w 60f2 <TestZoom4Picture+0x2376>
    }
  }

  for(int i2=0;i2<4;i2++) {  
    61c6:	42af 00c2      	clr.l 194(sp)
    61ca:	6032           	bra.s 61fe <TestZoom4Picture+0x2482>
    TestRow( valsupposed, valactual, mask, 243+i2);
    61cc:	222f 00c2      	move.l 194(sp),d1
    61d0:	0681 0000 00f3 	addi.l #243,d1
    61d6:	7000           	moveq #0,d0
    61d8:	302f 01c6      	move.w 454(sp),d0
    61dc:	2f01           	move.l d1,-(sp)
    61de:	2f00           	move.l d0,-(sp)
    61e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    61e4:	2f2f 0056      	move.l 86(sp),-(sp)
    61e8:	4eba 09f4      	jsr 6bde <TestRow>(pc)
    61ec:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61f0:	722a           	moveq #42,d1
    61f2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    61f6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {  
    61fa:	52af 00c2      	addq.l #1,194(sp)
    61fe:	7003           	moveq #3,d0
    6200:	b0af 00c2      	cmp.l 194(sp),d0
    6204:	6cc6           	bge.s 61cc <TestZoom4Picture+0x2450>
  }

  for(int i2=0;i2<12;i2++) {
    6206:	42af 00be      	clr.l 190(sp)
    620a:	6060           	bra.s 626c <TestZoom4Picture+0x24f0>
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    620c:	202f 00be      	move.l 190(sp),d0
    6210:	d080           	add.l d0,d0
    6212:	2200           	move.l d0,d1
    6214:	0681 0000 00f7 	addi.l #247,d1
    621a:	7000           	moveq #0,d0
    621c:	302f 01c6      	move.w 454(sp),d0
    6220:	2f01           	move.l d1,-(sp)
    6222:	2f00           	move.l d0,-(sp)
    6224:	2f2f 01d0      	move.l 464(sp),-(sp)
    6228:	2f2f 0056      	move.l 86(sp),-(sp)
    622c:	4eba 09b0      	jsr 6bde <TestRow>(pc)
    6230:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6234:	722a           	moveq #42,d1
    6236:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    623a:	707c           	moveq #124,d0
    623c:	d0af 00be      	add.l 190(sp),d0
    6240:	d080           	add.l d0,d0
    6242:	2200           	move.l d0,d1
    6244:	7000           	moveq #0,d0
    6246:	302f 01c6      	move.w 454(sp),d0
    624a:	2f01           	move.l d1,-(sp)
    624c:	2f00           	move.l d0,-(sp)
    624e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6252:	2f2f 0056      	move.l 86(sp),-(sp)
    6256:	4eba 0986      	jsr 6bde <TestRow>(pc)
    625a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    625e:	702a           	moveq #42,d0
    6260:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6264:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    6268:	52af 00be      	addq.l #1,190(sp)
    626c:	720b           	moveq #11,d1
    626e:	b2af 00be      	cmp.l 190(sp),d1
    6272:	6c98           	bge.s 620c <TestZoom4Picture+0x2490>
  }

  tmp = source;
    6274:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    627a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6280:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    6286:	4878 0001      	pea 1 <_start+0x1>
    628a:	4878 000e      	pea e <_start+0xe>
    628e:	2f2f 0056      	move.l 86(sp),-(sp)
    6292:	2f2f 006a      	move.l 106(sp),-(sp)
    6296:	4eba b89c      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    629a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    629e:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    62a4:	2c40           	movea.l d0,a6
    62a6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    62aa:	202f 004e      	move.l 78(sp),d0
    62ae:	5880           	addq.l #4,d0
    62b0:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom15;
    62b4:	2f7c 0000 bdd0 	move.l #48592,74(sp)
    62ba:	004a 

  mask = 0x0000;
    62bc:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<8;i2++) {
    62c0:	42af 00ba      	clr.l 186(sp)
    62c4:	605a           	bra.s 6320 <TestZoom4Picture+0x25a4>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    62c6:	202f 00ba      	move.l 186(sp),d0
    62ca:	d080           	add.l d0,d0
    62cc:	2200           	move.l d0,d1
    62ce:	7000           	moveq #0,d0
    62d0:	302f 01c6      	move.w 454(sp),d0
    62d4:	2f01           	move.l d1,-(sp)
    62d6:	2f00           	move.l d0,-(sp)
    62d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    62dc:	2f2f 0056      	move.l 86(sp),-(sp)
    62e0:	4eba 08fc      	jsr 6bde <TestRow>(pc)
    62e4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    62e8:	722a           	moveq #42,d1
    62ea:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    62ee:	202f 00ba      	move.l 186(sp),d0
    62f2:	d080           	add.l d0,d0
    62f4:	2200           	move.l d0,d1
    62f6:	5281           	addq.l #1,d1
    62f8:	7000           	moveq #0,d0
    62fa:	302f 01c6      	move.w 454(sp),d0
    62fe:	2f01           	move.l d1,-(sp)
    6300:	2f00           	move.l d0,-(sp)
    6302:	2f2f 01d0      	move.l 464(sp),-(sp)
    6306:	2f2f 0056      	move.l 86(sp),-(sp)
    630a:	4eba 08d2      	jsr 6bde <TestRow>(pc)
    630e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6312:	702a           	moveq #42,d0
    6314:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6318:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    631c:	52af 00ba      	addq.l #1,186(sp)
    6320:	7207           	moveq #7,d1
    6322:	b2af 00ba      	cmp.l 186(sp),d1
    6326:	6c9e           	bge.s 62c6 <TestZoom4Picture+0x254a>
  }

  for(int i=0;i<7;i++) {
    6328:	42af 00b6      	clr.l 182(sp)
    632c:	6000 00de      	bra.w 640c <TestZoom4Picture+0x2690>
    for(int i2=0;i2<3;i2++) {  
    6330:	42af 00b2      	clr.l 178(sp)
    6334:	603e           	bra.s 6374 <TestZoom4Picture+0x25f8>
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    6336:	307c 0010      	movea.w #16,a0
    633a:	d1ef 00b2      	adda.l 178(sp),a0
    633e:	222f 00b6      	move.l 182(sp),d1
    6342:	2001           	move.l d1,d0
    6344:	eb88           	lsl.l #5,d0
    6346:	d081           	add.l d1,d0
    6348:	2208           	move.l a0,d1
    634a:	d280           	add.l d0,d1
    634c:	7000           	moveq #0,d0
    634e:	302f 01c6      	move.w 454(sp),d0
    6352:	2f01           	move.l d1,-(sp)
    6354:	2f00           	move.l d0,-(sp)
    6356:	2f2f 01d0      	move.l 464(sp),-(sp)
    635a:	2f2f 0056      	move.l 86(sp),-(sp)
    635e:	4eba 087e      	jsr 6bde <TestRow>(pc)
    6362:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6366:	702a           	moveq #42,d0
    6368:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    636c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<3;i2++) {  
    6370:	52af 00b2      	addq.l #1,178(sp)
    6374:	7202           	moveq #2,d1
    6376:	b2af 00b2      	cmp.l 178(sp),d1
    637a:	6cba           	bge.s 6336 <TestZoom4Picture+0x25ba>
    }
    
    for(int i2=0;i2<15;i2++) {
    637c:	42af 00ae      	clr.l 174(sp)
    6380:	607c           	bra.s 63fe <TestZoom4Picture+0x2682>
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    6382:	222f 00b6      	move.l 182(sp),d1
    6386:	2001           	move.l d1,d0
    6388:	eb88           	lsl.l #5,d0
    638a:	2040           	movea.l d0,a0
    638c:	d1c1           	adda.l d1,a0
    638e:	41e8 0013      	lea 19(a0),a0
    6392:	202f 00ae      	move.l 174(sp),d0
    6396:	d080           	add.l d0,d0
    6398:	2208           	move.l a0,d1
    639a:	d280           	add.l d0,d1
    639c:	7000           	moveq #0,d0
    639e:	302f 01c6      	move.w 454(sp),d0
    63a2:	2f01           	move.l d1,-(sp)
    63a4:	2f00           	move.l d0,-(sp)
    63a6:	2f2f 01d0      	move.l 464(sp),-(sp)
    63aa:	2f2f 0056      	move.l 86(sp),-(sp)
    63ae:	4eba 082e      	jsr 6bde <TestRow>(pc)
    63b2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    63b6:	702a           	moveq #42,d0
    63b8:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    63bc:	222f 00b6      	move.l 182(sp),d1
    63c0:	2001           	move.l d1,d0
    63c2:	eb88           	lsl.l #5,d0
    63c4:	2040           	movea.l d0,a0
    63c6:	d1c1           	adda.l d1,a0
    63c8:	41e8 0013      	lea 19(a0),a0
    63cc:	202f 00ae      	move.l 174(sp),d0
    63d0:	d080           	add.l d0,d0
    63d2:	2208           	move.l a0,d1
    63d4:	d280           	add.l d0,d1
    63d6:	7000           	moveq #0,d0
    63d8:	302f 01c6      	move.w 454(sp),d0
    63dc:	2f01           	move.l d1,-(sp)
    63de:	2f00           	move.l d0,-(sp)
    63e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    63e4:	2f2f 0056      	move.l 86(sp),-(sp)
    63e8:	4eba 07f4      	jsr 6bde <TestRow>(pc)
    63ec:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    63f0:	722a           	moveq #42,d1
    63f2:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    63f6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {
    63fa:	52af 00ae      	addq.l #1,174(sp)
    63fe:	700e           	moveq #14,d0
    6400:	b0af 00ae      	cmp.l 174(sp),d0
    6404:	6c00 ff7c      	bge.w 6382 <TestZoom4Picture+0x2606>
  for(int i=0;i<7;i++) {
    6408:	52af 00b6      	addq.l #1,182(sp)
    640c:	7206           	moveq #6,d1
    640e:	b2af 00b6      	cmp.l 182(sp),d1
    6412:	6c00 ff1c      	bge.w 6330 <TestZoom4Picture+0x25b4>
    }
  }

  for(int i2=0;i2<3;i2++) {  
    6416:	42af 00aa      	clr.l 170(sp)
    641a:	6032           	bra.s 644e <TestZoom4Picture+0x26d2>
    TestRow( valsupposed, valactual, mask, 247+i2);
    641c:	222f 00aa      	move.l 170(sp),d1
    6420:	0681 0000 00f7 	addi.l #247,d1
    6426:	7000           	moveq #0,d0
    6428:	302f 01c6      	move.w 454(sp),d0
    642c:	2f01           	move.l d1,-(sp)
    642e:	2f00           	move.l d0,-(sp)
    6430:	2f2f 01d0      	move.l 464(sp),-(sp)
    6434:	2f2f 0056      	move.l 86(sp),-(sp)
    6438:	4eba 07a4      	jsr 6bde <TestRow>(pc)
    643c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6440:	702a           	moveq #42,d0
    6442:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6446:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<3;i2++) {  
    644a:	52af 00aa      	addq.l #1,170(sp)
    644e:	7202           	moveq #2,d1
    6450:	b2af 00aa      	cmp.l 170(sp),d1
    6454:	6cc6           	bge.s 641c <TestZoom4Picture+0x26a0>
  }

  for(int i2=0;i2<10;i2++) {
    6456:	42af 00a6      	clr.l 166(sp)
    645a:	6060           	bra.s 64bc <TestZoom4Picture+0x2740>
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    645c:	707d           	moveq #125,d0
    645e:	d0af 00a6      	add.l 166(sp),d0
    6462:	d080           	add.l d0,d0
    6464:	2200           	move.l d0,d1
    6466:	7000           	moveq #0,d0
    6468:	302f 01c6      	move.w 454(sp),d0
    646c:	2f01           	move.l d1,-(sp)
    646e:	2f00           	move.l d0,-(sp)
    6470:	2f2f 01d0      	move.l 464(sp),-(sp)
    6474:	2f2f 0056      	move.l 86(sp),-(sp)
    6478:	4eba 0764      	jsr 6bde <TestRow>(pc)
    647c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6480:	702a           	moveq #42,d0
    6482:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    6486:	202f 00a6      	move.l 166(sp),d0
    648a:	d080           	add.l d0,d0
    648c:	2200           	move.l d0,d1
    648e:	0681 0000 00fb 	addi.l #251,d1
    6494:	7000           	moveq #0,d0
    6496:	302f 01c6      	move.w 454(sp),d0
    649a:	2f01           	move.l d1,-(sp)
    649c:	2f00           	move.l d0,-(sp)
    649e:	2f2f 01d0      	move.l 464(sp),-(sp)
    64a2:	2f2f 0056      	move.l 86(sp),-(sp)
    64a6:	4eba 0736      	jsr 6bde <TestRow>(pc)
    64aa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    64ae:	722a           	moveq #42,d1
    64b0:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    64b4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {
    64b8:	52af 00a6      	addq.l #1,166(sp)
    64bc:	7009           	moveq #9,d0
    64be:	b0af 00a6      	cmp.l 166(sp),d0
    64c2:	6c98           	bge.s 645c <TestZoom4Picture+0x26e0>
  }

  tmp = source;
    64c4:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    64ca:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    64d0:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    64d6:	4878 0001      	pea 1 <_start+0x1>
    64da:	4878 000f      	pea f <_start+0xf>
    64de:	2f2f 0056      	move.l 86(sp),-(sp)
    64e2:	2f2f 006a      	move.l 106(sp),-(sp)
    64e6:	4eba b64c      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    64ea:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    64ee:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    64f4:	2c40           	movea.l d0,a6
    64f6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    64fa:	222f 004e      	move.l 78(sp),d1
    64fe:	5881           	addq.l #4,d1
    6500:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom16;
    6504:	2f7c 0000 bdfc 	move.l #48636,74(sp)
    650a:	004a 

  mask = 0x0000;
    650c:	426f 01c6      	clr.w 454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    6510:	7000           	moveq #0,d0
    6512:	302f 01c6      	move.w 454(sp),d0
    6516:	42a7           	clr.l -(sp)
    6518:	2f00           	move.l d0,-(sp)
    651a:	2f2f 01d0      	move.l 464(sp),-(sp)
    651e:	2f2f 0056      	move.l 86(sp),-(sp)
    6522:	4eba 06ba      	jsr 6bde <TestRow>(pc)
    6526:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    652a:	702a           	moveq #42,d0
    652c:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6530:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    6534:	42af 00a2      	clr.l 162(sp)
    6538:	605a           	bra.s 6594 <TestZoom4Picture+0x2818>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    653a:	202f 00a2      	move.l 162(sp),d0
    653e:	d080           	add.l d0,d0
    6540:	2200           	move.l d0,d1
    6542:	7000           	moveq #0,d0
    6544:	302f 01c6      	move.w 454(sp),d0
    6548:	2f01           	move.l d1,-(sp)
    654a:	2f00           	move.l d0,-(sp)
    654c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6550:	2f2f 0056      	move.l 86(sp),-(sp)
    6554:	4eba 0688      	jsr 6bde <TestRow>(pc)
    6558:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    655c:	722a           	moveq #42,d1
    655e:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6562:	202f 00a2      	move.l 162(sp),d0
    6566:	d080           	add.l d0,d0
    6568:	2200           	move.l d0,d1
    656a:	5281           	addq.l #1,d1
    656c:	7000           	moveq #0,d0
    656e:	302f 01c6      	move.w 454(sp),d0
    6572:	2f01           	move.l d1,-(sp)
    6574:	2f00           	move.l d0,-(sp)
    6576:	2f2f 01d0      	move.l 464(sp),-(sp)
    657a:	2f2f 0056      	move.l 86(sp),-(sp)
    657e:	4eba 065e      	jsr 6bde <TestRow>(pc)
    6582:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6586:	702a           	moveq #42,d0
    6588:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    658c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    6590:	52af 00a2      	addq.l #1,162(sp)
    6594:	7205           	moveq #5,d1
    6596:	b2af 00a2      	cmp.l 162(sp),d1
    659a:	6c9e           	bge.s 653a <TestZoom4Picture+0x27be>
  }

  for(int i=0;i<7;i++) {
    659c:	42af 009e      	clr.l 158(sp)
    65a0:	6000 00e6      	bra.w 6688 <TestZoom4Picture+0x290c>
    for(int i2=0;i2<2;i2++) {  
    65a4:	42af 009a      	clr.l 154(sp)
    65a8:	6040           	bra.s 65ea <TestZoom4Picture+0x286e>
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    65aa:	307c 000d      	movea.w #13,a0
    65ae:	d1ef 009a      	adda.l 154(sp),a0
    65b2:	222f 009e      	move.l 158(sp),d1
    65b6:	2001           	move.l d1,d0
    65b8:	e988           	lsl.l #4,d0
    65ba:	d081           	add.l d1,d0
    65bc:	d080           	add.l d0,d0
    65be:	2208           	move.l a0,d1
    65c0:	d280           	add.l d0,d1
    65c2:	7000           	moveq #0,d0
    65c4:	302f 01c6      	move.w 454(sp),d0
    65c8:	2f01           	move.l d1,-(sp)
    65ca:	2f00           	move.l d0,-(sp)
    65cc:	2f2f 01d0      	move.l 464(sp),-(sp)
    65d0:	2f2f 0056      	move.l 86(sp),-(sp)
    65d4:	4eba 0608      	jsr 6bde <TestRow>(pc)
    65d8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    65dc:	702a           	moveq #42,d0
    65de:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    65e2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<2;i2++) {  
    65e6:	52af 009a      	addq.l #1,154(sp)
    65ea:	7201           	moveq #1,d1
    65ec:	b2af 009a      	cmp.l 154(sp),d1
    65f0:	6cb8           	bge.s 65aa <TestZoom4Picture+0x282e>
    }
    
    for(int i2=0;i2<16;i2++) {
    65f2:	42af 0096      	clr.l 150(sp)
    65f6:	6000 0082      	bra.w 667a <TestZoom4Picture+0x28fe>
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    65fa:	222f 009e      	move.l 158(sp),d1
    65fe:	2001           	move.l d1,d0
    6600:	e988           	lsl.l #4,d0
    6602:	d081           	add.l d1,d0
    6604:	d080           	add.l d0,d0
    6606:	2040           	movea.l d0,a0
    6608:	41e8 0010      	lea 16(a0),a0
    660c:	202f 0096      	move.l 150(sp),d0
    6610:	d080           	add.l d0,d0
    6612:	2208           	move.l a0,d1
    6614:	d280           	add.l d0,d1
    6616:	7000           	moveq #0,d0
    6618:	302f 01c6      	move.w 454(sp),d0
    661c:	2f01           	move.l d1,-(sp)
    661e:	2f00           	move.l d0,-(sp)
    6620:	2f2f 01d0      	move.l 464(sp),-(sp)
    6624:	2f2f 0056      	move.l 86(sp),-(sp)
    6628:	4eba 05b4      	jsr 6bde <TestRow>(pc)
    662c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6630:	702a           	moveq #42,d0
    6632:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    6636:	222f 009e      	move.l 158(sp),d1
    663a:	2001           	move.l d1,d0
    663c:	e988           	lsl.l #4,d0
    663e:	d081           	add.l d1,d0
    6640:	d080           	add.l d0,d0
    6642:	2040           	movea.l d0,a0
    6644:	41e8 0011      	lea 17(a0),a0
    6648:	202f 0096      	move.l 150(sp),d0
    664c:	d080           	add.l d0,d0
    664e:	2208           	move.l a0,d1
    6650:	d280           	add.l d0,d1
    6652:	7000           	moveq #0,d0
    6654:	302f 01c6      	move.w 454(sp),d0
    6658:	2f01           	move.l d1,-(sp)
    665a:	2f00           	move.l d0,-(sp)
    665c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6660:	2f2f 0056      	move.l 86(sp),-(sp)
    6664:	4eba 0578      	jsr 6bde <TestRow>(pc)
    6668:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    666c:	722a           	moveq #42,d1
    666e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6672:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {
    6676:	52af 0096      	addq.l #1,150(sp)
    667a:	700f           	moveq #15,d0
    667c:	b0af 0096      	cmp.l 150(sp),d0
    6680:	6c00 ff78      	bge.w 65fa <TestZoom4Picture+0x287e>
  for(int i=0;i<7;i++) {
    6684:	52af 009e      	addq.l #1,158(sp)
    6688:	7206           	moveq #6,d1
    668a:	b2af 009e      	cmp.l 158(sp),d1
    668e:	6c00 ff14      	bge.w 65a4 <TestZoom4Picture+0x2828>
    }
  }

  for(int i2=0;i2<2;i2++) {
    6692:	42af 0092      	clr.l 146(sp)
    6696:	6032           	bra.s 66ca <TestZoom4Picture+0x294e>
    TestRow( valsupposed, valactual, mask, 251+i2);
    6698:	222f 0092      	move.l 146(sp),d1
    669c:	0681 0000 00fb 	addi.l #251,d1
    66a2:	7000           	moveq #0,d0
    66a4:	302f 01c6      	move.w 454(sp),d0
    66a8:	2f01           	move.l d1,-(sp)
    66aa:	2f00           	move.l d0,-(sp)
    66ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    66b0:	2f2f 0056      	move.l 86(sp),-(sp)
    66b4:	4eba 0528      	jsr 6bde <TestRow>(pc)
    66b8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66bc:	702a           	moveq #42,d0
    66be:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    66c2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<2;i2++) {
    66c6:	52af 0092      	addq.l #1,146(sp)
    66ca:	7201           	moveq #1,d1
    66cc:	b2af 0092      	cmp.l 146(sp),d1
    66d0:	6cc6           	bge.s 6698 <TestZoom4Picture+0x291c>
  }

  for(int i2=0;i2<8;i2++) {
    66d2:	42af 008e      	clr.l 142(sp)
    66d6:	6060           	bra.s 6738 <TestZoom4Picture+0x29bc>
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    66d8:	202f 008e      	move.l 142(sp),d0
    66dc:	d080           	add.l d0,d0
    66de:	2200           	move.l d0,d1
    66e0:	0681 0000 00fd 	addi.l #253,d1
    66e6:	7000           	moveq #0,d0
    66e8:	302f 01c6      	move.w 454(sp),d0
    66ec:	2f01           	move.l d1,-(sp)
    66ee:	2f00           	move.l d0,-(sp)
    66f0:	2f2f 01d0      	move.l 464(sp),-(sp)
    66f4:	2f2f 0056      	move.l 86(sp),-(sp)
    66f8:	4eba 04e4      	jsr 6bde <TestRow>(pc)
    66fc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6700:	702a           	moveq #42,d0
    6702:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    6706:	707f           	moveq #127,d0
    6708:	d0af 008e      	add.l 142(sp),d0
    670c:	d080           	add.l d0,d0
    670e:	2200           	move.l d0,d1
    6710:	7000           	moveq #0,d0
    6712:	302f 01c6      	move.w 454(sp),d0
    6716:	2f01           	move.l d1,-(sp)
    6718:	2f00           	move.l d0,-(sp)
    671a:	2f2f 01d0      	move.l 464(sp),-(sp)
    671e:	2f2f 0056      	move.l 86(sp),-(sp)
    6722:	4eba 04ba      	jsr 6bde <TestRow>(pc)
    6726:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    672a:	722a           	moveq #42,d1
    672c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6730:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    6734:	52af 008e      	addq.l #1,142(sp)
    6738:	7007           	moveq #7,d0
    673a:	b0af 008e      	cmp.l 142(sp),d0
    673e:	6c98           	bge.s 66d8 <TestZoom4Picture+0x295c>
  }

  tmp = source;
    6740:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6746:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    674c:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    6752:	4878 0001      	pea 1 <_start+0x1>
    6756:	4878 0010      	pea 10 <_start+0x10>
    675a:	2f2f 0056      	move.l 86(sp),-(sp)
    675e:	2f2f 006a      	move.l 106(sp),-(sp)
    6762:	4eba b3d0      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    6766:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    676a:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    6770:	2c40           	movea.l d0,a6
    6772:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6776:	222f 004e      	move.l 78(sp),d1
    677a:	5881           	addq.l #4,d1
    677c:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom17;
    6780:	2f7c 0000 be28 	move.l #48680,74(sp)
    6786:	004a 

  mask = 0xffff;
    6788:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<5;i2++) {
    678e:	42af 008a      	clr.l 138(sp)
    6792:	605a           	bra.s 67ee <TestZoom4Picture+0x2a72>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6794:	202f 008a      	move.l 138(sp),d0
    6798:	d080           	add.l d0,d0
    679a:	2200           	move.l d0,d1
    679c:	7000           	moveq #0,d0
    679e:	302f 01c6      	move.w 454(sp),d0
    67a2:	2f01           	move.l d1,-(sp)
    67a4:	2f00           	move.l d0,-(sp)
    67a6:	2f2f 01d0      	move.l 464(sp),-(sp)
    67aa:	2f2f 0056      	move.l 86(sp),-(sp)
    67ae:	4eba 042e      	jsr 6bde <TestRow>(pc)
    67b2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    67b6:	702a           	moveq #42,d0
    67b8:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    67bc:	202f 008a      	move.l 138(sp),d0
    67c0:	d080           	add.l d0,d0
    67c2:	2200           	move.l d0,d1
    67c4:	5281           	addq.l #1,d1
    67c6:	7000           	moveq #0,d0
    67c8:	302f 01c6      	move.w 454(sp),d0
    67cc:	2f01           	move.l d1,-(sp)
    67ce:	2f00           	move.l d0,-(sp)
    67d0:	2f2f 01d0      	move.l 464(sp),-(sp)
    67d4:	2f2f 0056      	move.l 86(sp),-(sp)
    67d8:	4eba 0404      	jsr 6bde <TestRow>(pc)
    67dc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    67e0:	722a           	moveq #42,d1
    67e2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    67e6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {
    67ea:	52af 008a      	addq.l #1,138(sp)
    67ee:	7004           	moveq #4,d0
    67f0:	b0af 008a      	cmp.l 138(sp),d0
    67f4:	6c9e           	bge.s 6794 <TestZoom4Picture+0x2a18>
  }

  for(int i=0;i<7;i++) {
    67f6:	42af 0086      	clr.l 134(sp)
    67fa:	6000 00d4      	bra.w 68d0 <TestZoom4Picture+0x2b54>
      TestRow( valsupposed, valactual, mask, 10+i*35);
    67fe:	222f 0086      	move.l 134(sp),d1
    6802:	2001           	move.l d1,d0
    6804:	e988           	lsl.l #4,d0
    6806:	d081           	add.l d1,d0
    6808:	d080           	add.l d0,d0
    680a:	2040           	movea.l d0,a0
    680c:	d1c1           	adda.l d1,a0
    680e:	41e8 000a      	lea 10(a0),a0
    6812:	7000           	moveq #0,d0
    6814:	302f 01c6      	move.w 454(sp),d0
    6818:	2f08           	move.l a0,-(sp)
    681a:	2f00           	move.l d0,-(sp)
    681c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6820:	2f2f 0056      	move.l 86(sp),-(sp)
    6824:	4eba 03b8      	jsr 6bde <TestRow>(pc)
    6828:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    682c:	722a           	moveq #42,d1
    682e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6832:	466f 01c6      	not.w 454(sp)
    
    for(int i2=0;i2<17;i2++) {
    6836:	42af 0082      	clr.l 130(sp)
    683a:	6000 0086      	bra.w 68c2 <TestZoom4Picture+0x2b46>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    683e:	222f 0086      	move.l 134(sp),d1
    6842:	2001           	move.l d1,d0
    6844:	e988           	lsl.l #4,d0
    6846:	d081           	add.l d1,d0
    6848:	d080           	add.l d0,d0
    684a:	2040           	movea.l d0,a0
    684c:	d1c1           	adda.l d1,a0
    684e:	41e8 000b      	lea 11(a0),a0
    6852:	202f 0082      	move.l 130(sp),d0
    6856:	d080           	add.l d0,d0
    6858:	2208           	move.l a0,d1
    685a:	d280           	add.l d0,d1
    685c:	7000           	moveq #0,d0
    685e:	302f 01c6      	move.w 454(sp),d0
    6862:	2f01           	move.l d1,-(sp)
    6864:	2f00           	move.l d0,-(sp)
    6866:	2f2f 01d0      	move.l 464(sp),-(sp)
    686a:	2f2f 0056      	move.l 86(sp),-(sp)
    686e:	4eba 036e      	jsr 6bde <TestRow>(pc)
    6872:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6876:	702a           	moveq #42,d0
    6878:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    687c:	222f 0086      	move.l 134(sp),d1
    6880:	2001           	move.l d1,d0
    6882:	e988           	lsl.l #4,d0
    6884:	d081           	add.l d1,d0
    6886:	d080           	add.l d0,d0
    6888:	2040           	movea.l d0,a0
    688a:	d1c1           	adda.l d1,a0
    688c:	41e8 000c      	lea 12(a0),a0
    6890:	202f 0082      	move.l 130(sp),d0
    6894:	d080           	add.l d0,d0
    6896:	2208           	move.l a0,d1
    6898:	d280           	add.l d0,d1
    689a:	7000           	moveq #0,d0
    689c:	302f 01c6      	move.w 454(sp),d0
    68a0:	2f01           	move.l d1,-(sp)
    68a2:	2f00           	move.l d0,-(sp)
    68a4:	2f2f 01d0      	move.l 464(sp),-(sp)
    68a8:	2f2f 0056      	move.l 86(sp),-(sp)
    68ac:	4eba 0330      	jsr 6bde <TestRow>(pc)
    68b0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    68b4:	722a           	moveq #42,d1
    68b6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    68ba:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<17;i2++) {
    68be:	52af 0082      	addq.l #1,130(sp)
    68c2:	7010           	moveq #16,d0
    68c4:	b0af 0082      	cmp.l 130(sp),d0
    68c8:	6c00 ff74      	bge.w 683e <TestZoom4Picture+0x2ac2>
  for(int i=0;i<7;i++) {
    68cc:	52af 0086      	addq.l #1,134(sp)
    68d0:	7206           	moveq #6,d1
    68d2:	b2af 0086      	cmp.l 134(sp),d1
    68d6:	6c00 ff26      	bge.w 67fe <TestZoom4Picture+0x2a82>
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    68da:	7000           	moveq #0,d0
    68dc:	302f 01c6      	move.w 454(sp),d0
    68e0:	4878 00ff      	pea ff <FreeDisplay+0x1f>
    68e4:	2f00           	move.l d0,-(sp)
    68e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    68ea:	2f2f 0056      	move.l 86(sp),-(sp)
    68ee:	4eba 02ee      	jsr 6bde <TestRow>(pc)
    68f2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    68f6:	702a           	moveq #42,d0
    68f8:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    68fc:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<7;i2++) {
    6900:	42af 007e      	clr.l 126(sp)
    6904:	6064           	bra.s 696a <TestZoom4Picture+0x2bee>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6906:	202f 007e      	move.l 126(sp),d0
    690a:	0680 0000 0080 	addi.l #128,d0
    6910:	d080           	add.l d0,d0
    6912:	2200           	move.l d0,d1
    6914:	7000           	moveq #0,d0
    6916:	302f 01c6      	move.w 454(sp),d0
    691a:	2f01           	move.l d1,-(sp)
    691c:	2f00           	move.l d0,-(sp)
    691e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6922:	2f2f 0056      	move.l 86(sp),-(sp)
    6926:	4eba 02b6      	jsr 6bde <TestRow>(pc)
    692a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    692e:	722a           	moveq #42,d1
    6930:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6934:	202f 007e      	move.l 126(sp),d0
    6938:	d080           	add.l d0,d0
    693a:	2200           	move.l d0,d1
    693c:	0681 0000 0101 	addi.l #257,d1
    6942:	7000           	moveq #0,d0
    6944:	302f 01c6      	move.w 454(sp),d0
    6948:	2f01           	move.l d1,-(sp)
    694a:	2f00           	move.l d0,-(sp)
    694c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6950:	2f2f 0056      	move.l 86(sp),-(sp)
    6954:	4eba 0288      	jsr 6bde <TestRow>(pc)
    6958:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    695c:	702a           	moveq #42,d0
    695e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6962:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {
    6966:	52af 007e      	addq.l #1,126(sp)
    696a:	7206           	moveq #6,d1
    696c:	b2af 007e      	cmp.l 126(sp),d1
    6970:	6c94           	bge.s 6906 <TestZoom4Picture+0x2b8a>
  }   

  tmp = source;
    6972:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6978:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    697e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    6984:	4878 0001      	pea 1 <_start+0x1>
    6988:	4878 0011      	pea 11 <_start+0x11>
    698c:	2f2f 0056      	move.l 86(sp),-(sp)
    6990:	2f2f 006a      	move.l 106(sp),-(sp)
    6994:	4eba b19e      	jsr 1b34 <Zoom_ZoomIntoPicture>(pc)
    6998:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    699c:	2039 004d 2ccc 	move.l 4d2ccc <GfxBase>,d0
    69a2:	2c40           	movea.l d0,a6
    69a4:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    69a8:	202f 004e      	move.l 78(sp),d0
    69ac:	5880           	addq.l #4,d0
    69ae:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom18;
    69b2:	2f7c 0000 be54 	move.l #48724,74(sp)
    69b8:	004a 

  mask = 0xffff;
    69ba:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);
    69c0:	7000           	moveq #0,d0
    69c2:	302f 01c6      	move.w 454(sp),d0
    69c6:	42a7           	clr.l -(sp)
    69c8:	2f00           	move.l d0,-(sp)
    69ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    69ce:	2f2f 0056      	move.l 86(sp),-(sp)
    69d2:	4eba 020a      	jsr 6bde <TestRow>(pc)
    69d6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    69da:	722a           	moveq #42,d1
    69dc:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    69e0:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<4;i2++) {
    69e4:	42af 007a      	clr.l 122(sp)
    69e8:	605c           	bra.s 6a46 <TestZoom4Picture+0x2cca>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    69ea:	202f 007a      	move.l 122(sp),d0
    69ee:	d080           	add.l d0,d0
    69f0:	2200           	move.l d0,d1
    69f2:	5281           	addq.l #1,d1
    69f4:	7000           	moveq #0,d0
    69f6:	302f 01c6      	move.w 454(sp),d0
    69fa:	2f01           	move.l d1,-(sp)
    69fc:	2f00           	move.l d0,-(sp)
    69fe:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a02:	2f2f 0056      	move.l 86(sp),-(sp)
    6a06:	4eba 01d6      	jsr 6bde <TestRow>(pc)
    6a0a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a0e:	702a           	moveq #42,d0
    6a10:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    6a14:	202f 007a      	move.l 122(sp),d0
    6a18:	5280           	addq.l #1,d0
    6a1a:	d080           	add.l d0,d0
    6a1c:	2200           	move.l d0,d1
    6a1e:	7000           	moveq #0,d0
    6a20:	302f 01c6      	move.w 454(sp),d0
    6a24:	2f01           	move.l d1,-(sp)
    6a26:	2f00           	move.l d0,-(sp)
    6a28:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a2c:	2f2f 0056      	move.l 86(sp),-(sp)
    6a30:	4eba 01ac      	jsr 6bde <TestRow>(pc)
    6a34:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a38:	722a           	moveq #42,d1
    6a3a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6a3e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6a42:	52af 007a      	addq.l #1,122(sp)
    6a46:	7003           	moveq #3,d0
    6a48:	b0af 007a      	cmp.l 122(sp),d0
    6a4c:	6c9c           	bge.s 69ea <TestZoom4Picture+0x2c6e>
  }

  for(int i=0;i<7;i++) {  
    6a4e:	42af 0076      	clr.l 118(sp)
    6a52:	6000 009c      	bra.w 6af0 <TestZoom4Picture+0x2d74>
    for(int i2=0;i2<18;i2++) {
    6a56:	42af 0072      	clr.l 114(sp)
    6a5a:	6000 0086      	bra.w 6ae2 <TestZoom4Picture+0x2d66>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6a5e:	222f 0076      	move.l 118(sp),d1
    6a62:	2001           	move.l d1,d0
    6a64:	e988           	lsl.l #4,d0
    6a66:	d081           	add.l d1,d0
    6a68:	d080           	add.l d0,d0
    6a6a:	2040           	movea.l d0,a0
    6a6c:	d1c1           	adda.l d1,a0
    6a6e:	41e8 000b      	lea 11(a0),a0
    6a72:	202f 0072      	move.l 114(sp),d0
    6a76:	d080           	add.l d0,d0
    6a78:	2208           	move.l a0,d1
    6a7a:	d280           	add.l d0,d1
    6a7c:	7000           	moveq #0,d0
    6a7e:	302f 01c6      	move.w 454(sp),d0
    6a82:	2f01           	move.l d1,-(sp)
    6a84:	2f00           	move.l d0,-(sp)
    6a86:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a8a:	2f2f 0056      	move.l 86(sp),-(sp)
    6a8e:	4eba 014e      	jsr 6bde <TestRow>(pc)
    6a92:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6a96:	722a           	moveq #42,d1
    6a98:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6a9c:	222f 0076      	move.l 118(sp),d1
    6aa0:	2001           	move.l d1,d0
    6aa2:	e988           	lsl.l #4,d0
    6aa4:	d081           	add.l d1,d0
    6aa6:	d080           	add.l d0,d0
    6aa8:	2040           	movea.l d0,a0
    6aaa:	d1c1           	adda.l d1,a0
    6aac:	41e8 000c      	lea 12(a0),a0
    6ab0:	202f 0072      	move.l 114(sp),d0
    6ab4:	d080           	add.l d0,d0
    6ab6:	2208           	move.l a0,d1
    6ab8:	d280           	add.l d0,d1
    6aba:	7000           	moveq #0,d0
    6abc:	302f 01c6      	move.w 454(sp),d0
    6ac0:	2f01           	move.l d1,-(sp)
    6ac2:	2f00           	move.l d0,-(sp)
    6ac4:	2f2f 01d0      	move.l 464(sp),-(sp)
    6ac8:	2f2f 0056      	move.l 86(sp),-(sp)
    6acc:	4eba 0110      	jsr 6bde <TestRow>(pc)
    6ad0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6ad4:	702a           	moveq #42,d0
    6ad6:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6ada:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) {
    6ade:	52af 0072      	addq.l #1,114(sp)
    6ae2:	7211           	moveq #17,d1
    6ae4:	b2af 0072      	cmp.l 114(sp),d1
    6ae8:	6c00 ff74      	bge.w 6a5e <TestZoom4Picture+0x2ce2>
  for(int i=0;i<7;i++) {  
    6aec:	52af 0076      	addq.l #1,118(sp)
    6af0:	7006           	moveq #6,d0
    6af2:	b0af 0076      	cmp.l 118(sp),d0
    6af6:	6c00 ff5e      	bge.w 6a56 <TestZoom4Picture+0x2cda>
    }
  } 

  for(int i2=0;i2<4;i2++) {
    6afa:	42af 006e      	clr.l 110(sp)
    6afe:	6064           	bra.s 6b64 <TestZoom4Picture+0x2de8>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6b00:	202f 006e      	move.l 110(sp),d0
    6b04:	0680 0000 0080 	addi.l #128,d0
    6b0a:	d080           	add.l d0,d0
    6b0c:	2200           	move.l d0,d1
    6b0e:	7000           	moveq #0,d0
    6b10:	302f 01c6      	move.w 454(sp),d0
    6b14:	2f01           	move.l d1,-(sp)
    6b16:	2f00           	move.l d0,-(sp)
    6b18:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b1c:	2f2f 0056      	move.l 86(sp),-(sp)
    6b20:	4eba 00bc      	jsr 6bde <TestRow>(pc)
    6b24:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6b28:	722a           	moveq #42,d1
    6b2a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6b2e:	202f 006e      	move.l 110(sp),d0
    6b32:	d080           	add.l d0,d0
    6b34:	2200           	move.l d0,d1
    6b36:	0681 0000 0101 	addi.l #257,d1
    6b3c:	7000           	moveq #0,d0
    6b3e:	302f 01c6      	move.w 454(sp),d0
    6b42:	2f01           	move.l d1,-(sp)
    6b44:	2f00           	move.l d0,-(sp)
    6b46:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b4a:	2f2f 0056      	move.l 86(sp),-(sp)
    6b4e:	4eba 008e      	jsr 6bde <TestRow>(pc)
    6b52:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6b56:	702a           	moveq #42,d0
    6b58:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6b5c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6b60:	52af 006e      	addq.l #1,110(sp)
    6b64:	7203           	moveq #3,d1
    6b66:	b2af 006e      	cmp.l 110(sp),d1
    6b6a:	6c94           	bge.s 6b00 <TestZoom4Picture+0x2d84>
  }
  TestRow( valsupposed, valactual, mask, 0);
    6b6c:	7000           	moveq #0,d0
    6b6e:	302f 01c6      	move.w 454(sp),d0
    6b72:	42a7           	clr.l -(sp)
    6b74:	2f00           	move.l d0,-(sp)
    6b76:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b7a:	2f2f 0056      	move.l 86(sp),-(sp)
    6b7e:	4eba 005e      	jsr 6bde <TestRow>(pc)
    6b82:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6b86:	702a           	moveq #42,d0
    6b88:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6b8c:	466f 01c6      	not.w 454(sp)
  FreeMem( source, (ZMLINESIZE+4)*272);
    6b90:	2f6f 005e 0042 	move.l 94(sp),66(sp)
    6b96:	2f7c 0000 30e0 	move.l #12512,62(sp)
    6b9c:	003e 
    6b9e:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    6ba4:	2c40           	movea.l d0,a6
    6ba6:	226f 0042      	movea.l 66(sp),a1
    6baa:	202f 003e      	move.l 62(sp),d0
    6bae:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    6bb2:	2f6f 004e 003a 	move.l 78(sp),58(sp)
    6bb8:	2f7c 0000 30e0 	move.l #12512,54(sp)
    6bbe:	0036 
    6bc0:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    6bc6:	2c40           	movea.l d0,a6
    6bc8:	226f 003a      	movea.l 58(sp),a1
    6bcc:	202f 0036      	move.l 54(sp),d0
    6bd0:	4eae ff2e      	jsr -210(a6)
}
    6bd4:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    6bd8:	4fef 01d0      	lea 464(sp),sp
    6bdc:	4e75           	rts

00006bde <TestRow>:

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    6bde:	4fef ff40      	lea -192(sp),sp
    6be2:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
    6be6:	202f 00e0      	move.l 224(sp),d0
    6bea:	3000           	move.w d0,d0
    6bec:	3f40 0016      	move.w d0,22(sp)
  
  char str[ 100] = { 0 };
    6bf0:	42af 001c      	clr.l 28(sp)
    6bf4:	7020           	moveq #32,d0
    6bf6:	d08f           	add.l sp,d0
    6bf8:	7260           	moveq #96,d1
    6bfa:	2f01           	move.l d1,-(sp)
    6bfc:	42a7           	clr.l -(sp)
    6bfe:	2f00           	move.l d0,-(sp)
    6c00:	4eba 020c      	jsr 6e0e <memset>(pc)
    6c04:	4fef 000c      	lea 12(sp),sp
  UWORD data[2];
  data[1] = numberofline;
    6c08:	202f 00e4      	move.l 228(sp),d0
    6c0c:	3f40 001a      	move.w d0,26(sp)

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    6c10:	42af 00d0      	clr.l 208(sp)
    6c14:	6000 00d4      	bra.w 6cea <TestRow+0x10c>
    if( (*testpattern++ ^ xormask) != *destination++) {
    6c18:	202f 00d8      	move.l 216(sp),d0
    6c1c:	2200           	move.l d0,d1
    6c1e:	5481           	addq.l #2,d1
    6c20:	2f41 00d8      	move.l d1,216(sp)
    6c24:	2040           	movea.l d0,a0
    6c26:	3010           	move.w (a0),d0
    6c28:	322f 0016      	move.w 22(sp),d1
    6c2c:	b141           	eor.w d0,d1
    6c2e:	202f 00dc      	move.l 220(sp),d0
    6c32:	2400           	move.l d0,d2
    6c34:	5482           	addq.l #2,d2
    6c36:	2f42 00dc      	move.l d2,220(sp)
    6c3a:	2040           	movea.l d0,a0
    6c3c:	3010           	move.w (a0),d0
    6c3e:	b041           	cmp.w d1,d0
    6c40:	6700 00a4      	beq.w 6ce6 <TestRow+0x108>
      data[0] = i;
    6c44:	202f 00d0      	move.l 208(sp),d0
    6c48:	3f40 0018      	move.w d0,24(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    6c4c:	2f7c 0000 8588 	move.l #34184,164(sp)
    6c52:	00a4 
    6c54:	702b           	moveq #43,d0
    6c56:	4600           	not.b d0
    6c58:	d08f           	add.l sp,d0
    6c5a:	0680 ffff ff44 	addi.l #-188,d0
    6c60:	2f40 00a0      	move.l d0,160(sp)
    6c64:	2f7c 0000 72ac 	move.l #29356,156(sp)
    6c6a:	009c 
    6c6c:	722b           	moveq #43,d1
    6c6e:	4601           	not.b d1
    6c70:	d28f           	add.l sp,d1
    6c72:	0681 ffff ff48 	addi.l #-184,d1
    6c78:	2f41 0098      	move.l d1,152(sp)
    6c7c:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    6c82:	2c40           	movea.l d0,a6
    6c84:	206f 00a4      	movea.l 164(sp),a0
    6c88:	226f 00a0      	movea.l 160(sp),a1
    6c8c:	246f 009c      	movea.l 156(sp),a2
    6c90:	266f 0098      	movea.l 152(sp),a3
    6c94:	4eae fdf6      	jsr -522(a6)
    6c98:	2f40 0094      	move.l d0,148(sp)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    6c9c:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    6ca2:	2c40           	movea.l d0,a6
    6ca4:	4eae ffc4      	jsr -60(a6)
    6ca8:	2f40 0090      	move.l d0,144(sp)
    6cac:	202f 0090      	move.l 144(sp),d0
    6cb0:	2f40 008c      	move.l d0,140(sp)
    6cb4:	742b           	moveq #43,d2
    6cb6:	4602           	not.b d2
    6cb8:	d48f           	add.l sp,d2
    6cba:	0682 ffff ff48 	addi.l #-184,d2
    6cc0:	2f42 0088      	move.l d2,136(sp)
    6cc4:	7064           	moveq #100,d0
    6cc6:	2f40 0084      	move.l d0,132(sp)
    6cca:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    6cd0:	2c40           	movea.l d0,a6
    6cd2:	222f 008c      	move.l 140(sp),d1
    6cd6:	242f 0088      	move.l 136(sp),d2
    6cda:	262f 0084      	move.l 132(sp),d3
    6cde:	4eae ffd0      	jsr -48(a6)
    6ce2:	2f40 0080      	move.l d0,128(sp)
  for(int i=0;i<21;i++) {
    6ce6:	52af 00d0      	addq.l #1,208(sp)
    6cea:	7214           	moveq #20,d1
    6cec:	b2af 00d0      	cmp.l 208(sp),d1
    6cf0:	6c00 ff26      	bge.w 6c18 <TestRow+0x3a>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    6cf4:	206f 00d8      	movea.l 216(sp),a0
    6cf8:	3010           	move.w (a0),d0
    6cfa:	322f 0016      	move.w 22(sp),d1
    6cfe:	b141           	eor.w d0,d1
    6d00:	206f 00dc      	movea.l 220(sp),a0
    6d04:	3010           	move.w (a0),d0
    6d06:	b340           	eor.w d1,d0
    6d08:	3000           	move.w d0,d0
    6d0a:	0280 0000 ffff 	andi.l #65535,d0
    6d10:	0280 0000 ff00 	andi.l #65280,d0
    6d16:	6700 00cc      	beq.w 6de4 <TestRow+0x206>
    data[0] = 21;
    6d1a:	3f7c 0015 0018 	move.w #21,24(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    6d20:	2f7c 0000 8588 	move.l #34184,204(sp)
    6d26:	00cc 
    6d28:	742b           	moveq #43,d2
    6d2a:	4602           	not.b d2
    6d2c:	d48f           	add.l sp,d2
    6d2e:	0682 ffff ff44 	addi.l #-188,d2
    6d34:	2f42 00c8      	move.l d2,200(sp)
    6d38:	2f7c 0000 72ac 	move.l #29356,196(sp)
    6d3e:	00c4 
    6d40:	702b           	moveq #43,d0
    6d42:	4600           	not.b d0
    6d44:	d08f           	add.l sp,d0
    6d46:	0680 ffff ff48 	addi.l #-184,d0
    6d4c:	2f40 00c0      	move.l d0,192(sp)
    6d50:	2039 004d 2cc0 	move.l 4d2cc0 <SysBase>,d0
    6d56:	2c40           	movea.l d0,a6
    6d58:	206f 00cc      	movea.l 204(sp),a0
    6d5c:	226f 00c8      	movea.l 200(sp),a1
    6d60:	246f 00c4      	movea.l 196(sp),a2
    6d64:	266f 00c0      	movea.l 192(sp),a3
    6d68:	4eae fdf6      	jsr -522(a6)
    6d6c:	2f40 00bc      	move.l d0,188(sp)
                                                                           str);
    Write(  Output(), str, 100);
    6d70:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    6d76:	2c40           	movea.l d0,a6
    6d78:	4eae ffc4      	jsr -60(a6)
    6d7c:	2f40 00b8      	move.l d0,184(sp)
    6d80:	202f 00b8      	move.l 184(sp),d0
    6d84:	2f40 00b4      	move.l d0,180(sp)
    6d88:	722b           	moveq #43,d1
    6d8a:	4601           	not.b d1
    6d8c:	d28f           	add.l sp,d1
    6d8e:	0681 ffff ff48 	addi.l #-184,d1
    6d94:	2f41 00b0      	move.l d1,176(sp)
    6d98:	7464           	moveq #100,d2
    6d9a:	2f42 00ac      	move.l d2,172(sp)
    6d9e:	2039 004d 2cc8 	move.l 4d2cc8 <DOSBase>,d0
    6da4:	2c40           	movea.l d0,a6
    6da6:	222f 00b4      	move.l 180(sp),d1
    6daa:	242f 00b0      	move.l 176(sp),d2
    6dae:	262f 00ac      	move.l 172(sp),d3
    6db2:	4eae ffd0      	jsr -48(a6)
    6db6:	2f40 00a8      	move.l d0,168(sp)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
    6dba:	206f 00dc      	movea.l 220(sp),a0
    6dbe:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6dc0:	7200           	moveq #0,d1
    6dc2:	3200           	move.w d0,d1
                                                   *testpattern,*destination);
    6dc4:	206f 00d8      	movea.l 216(sp),a0
    6dc8:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6dca:	3000           	move.w d0,d0
    6dcc:	0280 0000 ffff 	andi.l #65535,d0
    6dd2:	2f01           	move.l d1,-(sp)
    6dd4:	2f00           	move.l d0,-(sp)
    6dd6:	4879 0000 85b8 	pea 85b8 <rundemo.c.95627ee6+0x189>
    6ddc:	4eba 0162      	jsr 6f40 <KPrintF>(pc)
    6de0:	4fef 000c      	lea 12(sp),sp
     
  }
}
    6de4:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    6de8:	4fef 00c0      	lea 192(sp),sp
    6dec:	4e75           	rts

00006dee <strlen>:
{
    6dee:	598f           	subq.l #4,sp
	unsigned long t=0;
    6df0:	4297           	clr.l (sp)
    6df2:	6002           	bra.s 6df6 <strlen+0x8>
		t++;
    6df4:	5297           	addq.l #1,(sp)
	while(*s++)
    6df6:	202f 0008      	move.l 8(sp),d0
    6dfa:	2200           	move.l d0,d1
    6dfc:	5281           	addq.l #1,d1
    6dfe:	2f41 0008      	move.l d1,8(sp)
    6e02:	2040           	movea.l d0,a0
    6e04:	1010           	move.b (a0),d0
    6e06:	66ec           	bne.s 6df4 <strlen+0x6>
	return t;
    6e08:	2017           	move.l (sp),d0
}
    6e0a:	588f           	addq.l #4,sp
    6e0c:	4e75           	rts

00006e0e <memset>:
{
    6e0e:	4e55 fffc      	link.w a5,#-4
	unsigned char *ptr = (unsigned char *)dest;
    6e12:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
    6e18:	6014           	bra.s 6e2e <memset+0x20>
		*ptr++ = val;
    6e1a:	202d fffc      	move.l -4(a5),d0
    6e1e:	2200           	move.l d0,d1
    6e20:	5281           	addq.l #1,d1
    6e22:	2b41 fffc      	move.l d1,-4(a5)
    6e26:	222d 000c      	move.l 12(a5),d1
    6e2a:	2040           	movea.l d0,a0
    6e2c:	1081           	move.b d1,(a0)
	while(len-- > 0)
    6e2e:	202d 0010      	move.l 16(a5),d0
    6e32:	2200           	move.l d0,d1
    6e34:	5381           	subq.l #1,d1
    6e36:	2b41 0010      	move.l d1,16(a5)
    6e3a:	4a80           	tst.l d0
    6e3c:	66dc           	bne.s 6e1a <memset+0xc>
	return dest;
    6e3e:	202d 0008      	move.l 8(a5),d0
}
    6e42:	4e5d           	unlk a5
    6e44:	4e75           	rts

00006e46 <memcpy>:
{
    6e46:	4e55 fff8      	link.w a5,#-8
    6e4a:	2f02           	move.l d2,-(sp)
	char *d = (char *)dest;
    6e4c:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = (const char *)src;
    6e52:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
    6e58:	6020           	bra.s 6e7a <memcpy+0x34>
		*d++ = *s++;
    6e5a:	222d fff8      	move.l -8(a5),d1
    6e5e:	2001           	move.l d1,d0
    6e60:	5280           	addq.l #1,d0
    6e62:	2b40 fff8      	move.l d0,-8(a5)
    6e66:	202d fffc      	move.l -4(a5),d0
    6e6a:	2400           	move.l d0,d2
    6e6c:	5282           	addq.l #1,d2
    6e6e:	2b42 fffc      	move.l d2,-4(a5)
    6e72:	2041           	movea.l d1,a0
    6e74:	1210           	move.b (a0),d1
    6e76:	2040           	movea.l d0,a0
    6e78:	1081           	move.b d1,(a0)
	while(len--)
    6e7a:	202d 0010      	move.l 16(a5),d0
    6e7e:	2200           	move.l d0,d1
    6e80:	5381           	subq.l #1,d1
    6e82:	2b41 0010      	move.l d1,16(a5)
    6e86:	4a80           	tst.l d0
    6e88:	66d0           	bne.s 6e5a <memcpy+0x14>
	return dest;
    6e8a:	202d 0008      	move.l 8(a5),d0
}
    6e8e:	241f           	move.l (sp)+,d2
    6e90:	4e5d           	unlk a5
    6e92:	4e75           	rts

00006e94 <memmove>:
{
    6e94:	4e55 fff0      	link.w a5,#-16
    6e98:	2f02           	move.l d2,-(sp)
	char *d = dest;
    6e9a:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = src;
    6ea0:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
	if (d < s) {
    6ea6:	202d fffc      	move.l -4(a5),d0
    6eaa:	b0ad fff8      	cmp.l -8(a5),d0
    6eae:	6522           	bcs.s 6ed2 <memmove+0x3e>
    6eb0:	6032           	bra.s 6ee4 <memmove+0x50>
			*d++ = *s++;
    6eb2:	222d fff8      	move.l -8(a5),d1
    6eb6:	2401           	move.l d1,d2
    6eb8:	5282           	addq.l #1,d2
    6eba:	2b42 fff8      	move.l d2,-8(a5)
    6ebe:	202d fffc      	move.l -4(a5),d0
    6ec2:	2400           	move.l d0,d2
    6ec4:	5282           	addq.l #1,d2
    6ec6:	2b42 fffc      	move.l d2,-4(a5)
    6eca:	2041           	movea.l d1,a0
    6ecc:	1210           	move.b (a0),d1
    6ece:	2040           	movea.l d0,a0
    6ed0:	1081           	move.b d1,(a0)
		while (len--)
    6ed2:	202d 0010      	move.l 16(a5),d0
    6ed6:	2200           	move.l d0,d1
    6ed8:	5381           	subq.l #1,d1
    6eda:	2b41 0010      	move.l d1,16(a5)
    6ede:	4a80           	tst.l d0
    6ee0:	66d0           	bne.s 6eb2 <memmove+0x1e>
    6ee2:	6052           	bra.s 6f36 <memmove+0xa2>
		const char *lasts = s + (len - 1);
    6ee4:	202d 0010      	move.l 16(a5),d0
    6ee8:	5380           	subq.l #1,d0
    6eea:	242d fff8      	move.l -8(a5),d2
    6eee:	d480           	add.l d0,d2
    6ef0:	2b42 fff4      	move.l d2,-12(a5)
		char *lastd = d + (len - 1);
    6ef4:	202d 0010      	move.l 16(a5),d0
    6ef8:	5380           	subq.l #1,d0
    6efa:	222d fffc      	move.l -4(a5),d1
    6efe:	d280           	add.l d0,d1
    6f00:	2b41 fff0      	move.l d1,-16(a5)
    6f04:	6020           	bra.s 6f26 <memmove+0x92>
			*lastd-- = *lasts--;
    6f06:	222d fff4      	move.l -12(a5),d1
    6f0a:	2401           	move.l d1,d2
    6f0c:	5382           	subq.l #1,d2
    6f0e:	2b42 fff4      	move.l d2,-12(a5)
    6f12:	202d fff0      	move.l -16(a5),d0
    6f16:	2400           	move.l d0,d2
    6f18:	5382           	subq.l #1,d2
    6f1a:	2b42 fff0      	move.l d2,-16(a5)
    6f1e:	2041           	movea.l d1,a0
    6f20:	1210           	move.b (a0),d1
    6f22:	2040           	movea.l d0,a0
    6f24:	1081           	move.b d1,(a0)
		while (len--)
    6f26:	202d 0010      	move.l 16(a5),d0
    6f2a:	2200           	move.l d0,d1
    6f2c:	5381           	subq.l #1,d1
    6f2e:	2b41 0010      	move.l d1,16(a5)
    6f32:	4a80           	tst.l d0
    6f34:	66d0           	bne.s 6f06 <memmove+0x72>
	return dest;
    6f36:	202d 0008      	move.l 8(a5),d0
}
    6f3a:	241f           	move.l (sp)+,d2
    6f3c:	4e5d           	unlk a5
    6f3e:	4e75           	rts

00006f40 <KPrintF>:
{
    6f40:	4fef ff80      	lea -128(sp),sp
    6f44:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    6f48:	3039 00f0 ff60 	move.w f0ff60 <_end+0xa3d24c>,d0
    6f4e:	0c40 4eb9      	cmpi.w #20153,d0
    6f52:	6722           	beq.s 6f76 <KPrintF+0x36>
    6f54:	0c40 a00e      	cmpi.w #-24562,d0
    6f58:	671c           	beq.s 6f76 <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    6f5a:	2c79 004d 2cc0 	movea.l 4d2cc0 <SysBase>,a6
    6f60:	206f 0090      	movea.l 144(sp),a0
    6f64:	43ef 0094      	lea 148(sp),a1
    6f68:	45f9 0000 729e 	lea 729e <KPutCharX>,a2
    6f6e:	97cb           	suba.l a3,a3
    6f70:	4eae fdf6      	jsr -522(a6)
    6f74:	602a           	bra.s 6fa0 <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    6f76:	2c79 004d 2cc0 	movea.l 4d2cc0 <SysBase>,a6
    6f7c:	206f 0090      	movea.l 144(sp),a0
    6f80:	43ef 0094      	lea 148(sp),a1
    6f84:	45f9 0000 72ac 	lea 72ac <PutChar>,a2
    6f8a:	47ef 000c      	lea 12(sp),a3
    6f8e:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    6f92:	2f0b           	move.l a3,-(sp)
    6f94:	4878 0056      	pea 56 <_start+0x56>
    6f98:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xa3d24c>
    6f9e:	508f           	addq.l #8,sp
}
    6fa0:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    6fa4:	4fef 0080      	lea 128(sp),sp
    6fa8:	4e75           	rts

00006faa <warpmode>:

void warpmode(int on) // bool
{
    6faa:	518f           	subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
    6fac:	2f7c 00f0 ff60 	move.l #15794016,4(sp)
    6fb2:	0004 
    if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
    6fb4:	206f 0004      	movea.l 4(sp),a0
    6fb8:	3010           	move.w (a0),d0
    6fba:	0c40 4eb9      	cmpi.w #20153,d0
    6fbe:	670c           	beq.s 6fcc <warpmode+0x22>
    6fc0:	206f 0004      	movea.l 4(sp),a0
    6fc4:	3010           	move.w (a0),d0
    6fc6:	0c40 a00e      	cmpi.w #-24562,d0
    6fca:	6668           	bne.s 7034 <warpmode+0x8a>
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    6fcc:	4aaf 000c      	tst.l 12(sp)
    6fd0:	6708           	beq.s 6fda <warpmode+0x30>
    6fd2:	203c 0000 85de 	move.l #34270,d0
    6fd8:	6006           	bra.s 6fe0 <warpmode+0x36>
    6fda:	203c 0000 85e8 	move.l #34280,d0
    6fe0:	4878 0001      	pea 1 <_start+0x1>
    6fe4:	220f           	move.l sp,d1
    6fe6:	5e81           	addq.l #7,d1
    6fe8:	2f01           	move.l d1,-(sp)
    6fea:	42a7           	clr.l -(sp)
    6fec:	2f00           	move.l d0,-(sp)
    6fee:	4878 ffff      	pea ffffffff <_end+0xffb2d2eb>
    6ff2:	4878 0052      	pea 52 <_start+0x52>
    6ff6:	206f 001c      	movea.l 28(sp),a0
    6ffa:	4e90           	jsr (a0)
    6ffc:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    7000:	4aaf 000c      	tst.l 12(sp)
    7004:	6708           	beq.s 700e <warpmode+0x64>
    7006:	203c 0000 85f3 	move.l #34291,d0
    700c:	6006           	bra.s 7014 <warpmode+0x6a>
    700e:	203c 0000 860d 	move.l #34317,d0
    7014:	4878 0001      	pea 1 <_start+0x1>
    7018:	220f           	move.l sp,d1
    701a:	5e81           	addq.l #7,d1
    701c:	2f01           	move.l d1,-(sp)
    701e:	42a7           	clr.l -(sp)
    7020:	2f00           	move.l d0,-(sp)
    7022:	4878 ffff      	pea ffffffff <_end+0xffb2d2eb>
    7026:	4878 0052      	pea 52 <_start+0x52>
    702a:	206f 001c      	movea.l 28(sp),a0
    702e:	4e90           	jsr (a0)
    7030:	4fef 0018      	lea 24(sp),sp
	}
}
    7034:	508f           	addq.l #8,sp
    7036:	4e75           	rts

00007038 <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4)
{
    7038:	598f           	subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
    703a:	2ebc 00f0 ff60 	move.l #15794016,(sp)
    if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    7040:	2057           	movea.l (sp),a0
    7042:	3010           	move.w (a0),d0
    7044:	0c40 4eb9      	cmpi.w #20153,d0
    7048:	670a           	beq.s 7054 <debug_cmd+0x1c>
    704a:	2057           	movea.l (sp),a0
    704c:	3010           	move.w (a0),d0
    704e:	0c40 a00e      	cmpi.w #-24562,d0
    7052:	661e           	bne.s 7072 <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
    7054:	2f2f 0014      	move.l 20(sp),-(sp)
    7058:	2f2f 0014      	move.l 20(sp),-(sp)
    705c:	2f2f 0014      	move.l 20(sp),-(sp)
    7060:	2f2f 0014      	move.l 20(sp),-(sp)
    7064:	4878 0058      	pea 58 <_start+0x58>
    7068:	206f 0014      	movea.l 20(sp),a0
    706c:	4e90           	jsr (a0)
    706e:	4fef 0014      	lea 20(sp),sp
	}
}
    7072:	588f           	addq.l #4,sp
    7074:	4e75           	rts

00007076 <debug_clear>:
	barto_cmd_text,
};

void debug_clear()
{
	debug_cmd(barto_cmd_clear, 0, 0, 0);
    7076:	42a7           	clr.l -(sp)
    7078:	42a7           	clr.l -(sp)
    707a:	42a7           	clr.l -(sp)
    707c:	42a7           	clr.l -(sp)
    707e:	4eba ffb8      	jsr 7038 <debug_cmd>(pc)
    7082:	4fef 0010      	lea 16(sp),sp
}
    7086:	4e75           	rts

00007088 <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color)
{
    7088:	518f           	subq.l #8,sp
    708a:	2f02           	move.l d2,-(sp)
    708c:	226f 0010      	movea.l 16(sp),a1
    7090:	206f 0014      	movea.l 20(sp),a0
    7094:	222f 0018      	move.l 24(sp),d1
    7098:	202f 001c      	move.l 28(sp),d0
    709c:	3249           	movea.w a1,a1
    709e:	3f49 000a      	move.w a1,10(sp)
    70a2:	3048           	movea.w a0,a0
    70a4:	3f48 0008      	move.w a0,8(sp)
    70a8:	3201           	move.w d1,d1
    70aa:	3f41 0006      	move.w d1,6(sp)
    70ae:	3000           	move.w d0,d0
    70b0:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    70b4:	302f 0006      	move.w 6(sp),d0
    70b8:	48c0           	ext.l d0
    70ba:	4840           	swap d0
    70bc:	4240           	clr.w d0
    70be:	322f 0004      	move.w 4(sp),d1
    70c2:	48c1           	ext.l d1
    70c4:	8280           	or.l d0,d1
    70c6:	302f 000a      	move.w 10(sp),d0
    70ca:	48c0           	ext.l d0
    70cc:	4840           	swap d0
    70ce:	4240           	clr.w d0
    70d0:	306f 0008      	movea.w 8(sp),a0
    70d4:	2408           	move.l a0,d2
    70d6:	8082           	or.l d2,d0
    70d8:	2f2f 0020      	move.l 32(sp),-(sp)
    70dc:	2f01           	move.l d1,-(sp)
    70de:	2f00           	move.l d0,-(sp)
    70e0:	4878 0001      	pea 1 <_start+0x1>
    70e4:	4eba ff52      	jsr 7038 <debug_cmd>(pc)
    70e8:	4fef 0010      	lea 16(sp),sp
}
    70ec:	241f           	move.l (sp)+,d2
    70ee:	508f           	addq.l #8,sp
    70f0:	4e75           	rts

000070f2 <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color)
{
    70f2:	518f           	subq.l #8,sp
    70f4:	2f02           	move.l d2,-(sp)
    70f6:	226f 0010      	movea.l 16(sp),a1
    70fa:	206f 0014      	movea.l 20(sp),a0
    70fe:	222f 0018      	move.l 24(sp),d1
    7102:	202f 001c      	move.l 28(sp),d0
    7106:	3249           	movea.w a1,a1
    7108:	3f49 000a      	move.w a1,10(sp)
    710c:	3048           	movea.w a0,a0
    710e:	3f48 0008      	move.w a0,8(sp)
    7112:	3201           	move.w d1,d1
    7114:	3f41 0006      	move.w d1,6(sp)
    7118:	3000           	move.w d0,d0
    711a:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    711e:	302f 0006      	move.w 6(sp),d0
    7122:	48c0           	ext.l d0
    7124:	4840           	swap d0
    7126:	4240           	clr.w d0
    7128:	322f 0004      	move.w 4(sp),d1
    712c:	48c1           	ext.l d1
    712e:	8280           	or.l d0,d1
    7130:	302f 000a      	move.w 10(sp),d0
    7134:	48c0           	ext.l d0
    7136:	4840           	swap d0
    7138:	4240           	clr.w d0
    713a:	306f 0008      	movea.w 8(sp),a0
    713e:	2408           	move.l a0,d2
    7140:	8082           	or.l d2,d0
    7142:	2f2f 0020      	move.l 32(sp),-(sp)
    7146:	2f01           	move.l d1,-(sp)
    7148:	2f00           	move.l d0,-(sp)
    714a:	4878 0002      	pea 2 <_start+0x2>
    714e:	4eba fee8      	jsr 7038 <debug_cmd>(pc)
    7152:	4fef 0010      	lea 16(sp),sp
}
    7156:	241f           	move.l (sp)+,d2
    7158:	508f           	addq.l #8,sp
    715a:	4e75           	rts

0000715c <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color)
{
    715c:	598f           	subq.l #4,sp
    715e:	2f02           	move.l d2,-(sp)
    7160:	222f 000c      	move.l 12(sp),d1
    7164:	202f 0010      	move.l 16(sp),d0
    7168:	3201           	move.w d1,d1
    716a:	3f41 0006      	move.w d1,6(sp)
    716e:	3000           	move.w d0,d0
    7170:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
    7174:	202f 0014      	move.l 20(sp),d0
    7178:	322f 0006      	move.w 6(sp),d1
    717c:	48c1           	ext.l d1
    717e:	4841           	swap d1
    7180:	4241           	clr.w d1
    7182:	306f 0004      	movea.w 4(sp),a0
    7186:	2408           	move.l a0,d2
    7188:	8282           	or.l d2,d1
    718a:	2f2f 0018      	move.l 24(sp),-(sp)
    718e:	2f00           	move.l d0,-(sp)
    7190:	2f01           	move.l d1,-(sp)
    7192:	4878 0003      	pea 3 <_start+0x3>
    7196:	4eba fea0      	jsr 7038 <debug_cmd>(pc)
    719a:	4fef 0010      	lea 16(sp),sp
}
    719e:	241f           	move.l (sp)+,d2
    71a0:	588f           	addq.l #4,sp
    71a2:	4e75           	rts

000071a4 <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    71a4:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    71a8:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    71ac:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    71b0:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    71b4:	d041           	add.w d1,d0
	swap	d0
    71b6:	4840           	swap d0
	clrw	d0
    71b8:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    71ba:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    71be:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    71c2:	d081           	add.l d1,d0
	rts
    71c4:	4e75           	rts

000071c6 <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    71c6:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    71c8:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    71cc:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    71d0:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    71d6:	6416           	bcc.s 71ee <__udivsi3+0x28>
	movel	d0, d2
    71d8:	2400           	move.l d0,d2
	clrw	d2
    71da:	4242           	clr.w d2
	swap	d2
    71dc:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    71de:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    71e0:	3002           	move.w d2,d0
	swap	d0
    71e2:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    71e4:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    71e8:	84c1           	divu.w d1,d2
	movew	d2, d0
    71ea:	3002           	move.w d2,d0
	jra	6f
    71ec:	6030           	bra.s 721e <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    71ee:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    71f0:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    71f2:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    71f4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    71fa:	64f4           	bcc.s 71f0 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    71fc:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    71fe:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    7204:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    7206:	c2c0           	mulu.w d0,d1
	swap	d2
    7208:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    720a:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    720c:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    720e:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    7210:	660a           	bne.s 721c <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    7212:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    7214:	6506           	bcs.s 721c <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    7216:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    721a:	6302           	bls.s 721e <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    721c:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    721e:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    7220:	4e75           	rts

00007222 <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    7222:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    7224:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    7226:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    722a:	6a04           	bpl.s 7230 <__divsi3+0xe>
	negl	d1
    722c:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    722e:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    7230:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    7234:	6a04           	bpl.s 723a <__divsi3+0x18>
	negl	d0
    7236:	4480           	neg.l d0
	negb	d2
    7238:	4402           	neg.b d2

2:	movel	d1, sp@-
    723a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    723c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    723e:	6186           	bsr.s 71c6 <__udivsi3>
	addql	IMM (8), sp
    7240:	508f           	addq.l #8,sp

	tstb	d2
    7242:	4a02           	tst.b d2
	jpl	3f
    7244:	6a02           	bpl.s 7248 <__divsi3+0x26>
	negl	d0
    7246:	4480           	neg.l d0

3:	movel	sp@+, d2
    7248:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    724a:	4e75           	rts

0000724c <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    724c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7250:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    7254:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7256:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    7258:	61c8           	bsr.s 7222 <__divsi3>
	addql	IMM (8), sp
    725a:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    725c:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    7260:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7262:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    7264:	6100 ff3e      	bsr.w 71a4 <__mulsi3>
	addql	IMM (8), sp
    7268:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    726a:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    726e:	9280           	sub.l d0,d1
	movel	d1, d0
    7270:	2001           	move.l d1,d0
	rts
    7272:	4e75           	rts

00007274 <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    7274:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7278:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    727c:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    727e:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    7280:	6100 ff44      	bsr.w 71c6 <__udivsi3>
	addql	IMM (8), sp
    7284:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    7286:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    728a:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    728c:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    728e:	6100 ff14      	bsr.w 71a4 <__mulsi3>
	addql	IMM (8), sp
    7292:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    7294:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    7298:	9280           	sub.l d0,d1
	movel	d1, d0
    729a:	2001           	move.l d1,d0
	rts
    729c:	4e75           	rts

0000729e <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    729e:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    72a0:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    72a4:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    72a8:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    72aa:	4e75           	rts

000072ac <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    72ac:	16c0           	move.b d0,(a3)+
	rts
    72ae:	4e75           	rts

000072b0 <c2p1x1_8_c5_gen_init>:
	.text
	FUNC(c2p1x1_8_c5_gen_init)
	.globl	SYM (c2p1x1_8_c5_gen_init)

SYM(c2p1x1_8_c5_gen_init):
	movem.l d0-d7/a0-a6, .gi_saveregs	
    72b0:	48f9 7fff 0000 	movem.l d0-a6,72f0 <.gi_saveregs>
    72b6:	72f0 
	move.l  4(sp),d0
    72b8:	202f 0004      	move.l 4(sp),d0
	move.l	8(sp),d1
    72bc:	222f 0008      	move.l 8(sp),d1
	move.l	12(sp),d2
    72c0:	242f 000c      	move.l 12(sp),d2
	move.l	16(sp),d3
    72c4:	262f 0010      	move.l 16(sp),d3
	move.l  20(sp),d4
    72c8:	282f 0014      	move.l 20(sp),d4
	move.l	24(sp),d5
    72cc:	2a2f 0018      	move.l 24(sp),d5
	andi.l	IMM (0xffff),d0
    72d0:	0280 0000 ffff 	andi.l #65535,d0
	mulu.w	d0,d3
    72d6:	c6c0           	mulu.w d0,d3
	lsr.l	#3,d3
    72d8:	e68b           	lsr.l #3,d3
	move.l	d3,c2p1x1_8_c5_gen_scroffs
    72da:	23c3 0000 7646 	move.l d3,7646 <c2p1x1_8_c5_gen_scroffs>
	mulu.w	d0,d1
    72e0:	c2c0           	mulu.w d0,d1
	move.l	d1,c2p1x1_8_c5_gen_pixels
    72e2:	23c1 0000 764a 	move.l d1,764a <c2p1x1_8_c5_gen_pixels>
	movem.l	.gi_saveregs,d0-d7/a0-a6
    72e8:	4cfa 7fff 0004 	movem.l 72f0 <.gi_saveregs>(pc),d0-a6
	rts
    72ee:	4e75           	rts

000072f0 <.gi_saveregs>:
	...

0000732c <c2p1x1_8_c5_gen>:
	.text
	FUNC(c2p1x1_8_c5_gen)
	.globl	SYM (c2p1x1_8_c5_gen)

SYM(c2p1x1_8_c5_gen):
	movem.l d0-d7/a0-a6,.c2p_saveregs	
    732c:	48f9 7fff 0000 	movem.l d0-a6,760a <.c2p_saveregs>
    7332:	760a 
	movem.l 4(sp),a0
    7334:	4cef 0100 0004 	movem.l 4(sp),a0
	movem.l 8(sp),a1
    733a:	4cef 0200 0008 	movem.l 8(sp),a1
    move.l	IMM (0x33333333),d5
    7340:	2a3c 3333 3333 	move.l #858993459,d5
	move.l	IMM (0x55555555),a6
    7346:	2c7c 5555 5555 	movea.l #1431655765,a6

	add.w	#BPLSIZE,a1
    734c:	d2fc 2bf8      	adda.w #11256,a1
	add.l	c2p1x1_8_c5_gen_scroffs,a1
    7350:	d3fa 02f4      	adda.l 7646 <c2p1x1_8_c5_gen_scroffs>(pc),a1

	move.l	c2p1x1_8_c5_gen_pixels,a2
    7354:	247a 02f4      	movea.l 764a <c2p1x1_8_c5_gen_pixels>(pc),a2
	add.l	a0,a2
    7358:	d5c8           	adda.l a0,a2
	cmp.l	a0,a2
    735a:	b5c8           	cmpa.l a0,a2
	beq	.none
    735c:	6700 02a4      	beq.w 7602 <.none>

	movem.l	a0-a1,-(sp)
    7360:	48e7 00c0      	movem.l a0-a1,-(sp)

	move.l	(a0)+,d0
    7364:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    7366:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7368:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    736a:	2618           	move.l (a0)+,d3

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    736c:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    7372:	c084           	and.l d4,d0
	and.l	d4,d1
    7374:	c284           	and.l d4,d1
	and.l	d4,d2
    7376:	c484           	and.l d4,d2
	and.l	d4,d3
    7378:	c684           	and.l d4,d3
	lsl.l	#4,d0
    737a:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    737c:	e989           	lsl.l #4,d1
	or.l	d2,d0
    737e:	8082           	or.l d2,d0
	or.l	d3,d1
    7380:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    7382:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7384:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    7386:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7388:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    738a:	c484           	and.l d4,d2
	and.l	d4,d6
    738c:	cc84           	and.l d4,d6
	and.l	d4,d3
    738e:	c684           	and.l d4,d3
	and.l	d4,d7
    7390:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    7392:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    7394:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    7396:	8486           	or.l d6,d2
	or.l	d7,d3
    7398:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    739a:	3c02           	move.w d2,d6
	move.w	d3,d7
    739c:	3e03           	move.w d3,d7
	move.w	d0,d2
    739e:	3400           	move.w d0,d2
	move.w	d1,d3
    73a0:	3601           	move.w d1,d3
	swap	d2
    73a2:	4842           	swap d2
	swap	d3
    73a4:	4843           	swap d3
	move.w	d2,d0
    73a6:	3002           	move.w d2,d0
	move.w	d3,d1
    73a8:	3203           	move.w d3,d1
	move.w	d6,d2
    73aa:	3406           	move.w d6,d2
	move.w	d7,d3
    73ac:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    73ae:	2c02           	move.l d2,d6
	move.l	d3,d7
    73b0:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    73b2:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    73b4:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    73b6:	b186           	eor.l d0,d6
	eor.l	d1,d7
    73b8:	b387           	eor.l d1,d7
	and.l	d5,d6
    73ba:	cc85           	and.l d5,d6
	and.l	d5,d7
    73bc:	ce85           	and.l d5,d7
	eor.l	d6,d0
    73be:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    73c0:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    73c2:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    73c4:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    73c6:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    73c8:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    73ca:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    73d0:	2c01           	move.l d1,d6
	move.l	d3,d7
    73d2:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    73d4:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    73d6:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    73d8:	b186           	eor.l d0,d6
	eor.l	d2,d7
    73da:	b587           	eor.l d2,d7
	bra	.start1
    73dc:	6000 0088      	bra.w 7466 <.start1>

000073e0 <.x1>:
.x1:
	move.l	(a0)+,d0
    73e0:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    73e2:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    73e4:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    73e6:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    73e8:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    73ec:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    73f2:	c084           	and.l d4,d0
	and.l	d4,d1
    73f4:	c284           	and.l d4,d1
	and.l	d4,d2
    73f6:	c484           	and.l d4,d2
	and.l	d4,d3
    73f8:	c684           	and.l d4,d3
	lsl.l	#4,d0
    73fa:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    73fc:	e989           	lsl.l #4,d1
	or.l	d2,d0
    73fe:	8082           	or.l d2,d0
	or.l	d3,d1
    7400:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    7402:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7404:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    7406:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7408:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    740a:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    740e:	c484           	and.l d4,d2
	and.l	d4,d6
    7410:	cc84           	and.l d4,d6
	and.l	d4,d3
    7412:	c684           	and.l d4,d3
	and.l	d4,d7
    7414:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    7416:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    7418:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    741a:	8486           	or.l d6,d2
	or.l	d7,d3
    741c:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    741e:	3c02           	move.w d2,d6
	move.w	d3,d7
    7420:	3e03           	move.w d3,d7
	move.w	d0,d2
    7422:	3400           	move.w d0,d2
	move.w	d1,d3
    7424:	3601           	move.w d1,d3
	swap	d2
    7426:	4842           	swap d2
	swap	d3
    7428:	4843           	swap d3
	move.w	d2,d0
    742a:	3002           	move.w d2,d0
	move.w	d3,d1
    742c:	3203           	move.w d3,d1
	move.w	d6,d2
    742e:	3406           	move.w d6,d2
	move.w	d7,d3
    7430:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    7432:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    7436:	2c02           	move.l d2,d6
	move.l	d3,d7
    7438:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    743a:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    743c:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    743e:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7440:	b387           	eor.l d1,d7
	and.l	d5,d6
    7442:	cc85           	and.l d5,d6
	and.l	d5,d7
    7444:	ce85           	and.l d5,d7
	eor.l	d6,d0
    7446:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7448:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    744a:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    744c:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    744e:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7450:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    7452:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7458:	2c01           	move.l d1,d6
	move.l	d3,d7
    745a:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    745c:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    745e:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7460:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7462:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    7464:	22cd           	move.l a5,(a1)+

00007466 <.start1>:
.start1:
	and.l	d4,d6
    7466:	cc84           	and.l d4,d6
	and.l	d4,d7
    7468:	ce84           	and.l d4,d7
	eor.l	d6,d0
    746a:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    746c:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    746e:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    7470:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    7472:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    7474:	bf83           	eor.l d7,d3

	move.l	a6,d4
    7476:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    7478:	2c01           	move.l d1,d6
	move.l	d3,d7
    747a:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    747c:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    747e:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    7480:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7482:	b587           	eor.l d2,d7
	and.l	d4,d6
    7484:	cc84           	and.l d4,d6
	and.l	d4,d7
    7486:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7488:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    748a:	bf82           	eor.l d7,d2
	add.l	d6,d6
    748c:	dc86           	add.l d6,d6
	add.l	d7,d7
    748e:	de87           	add.l d7,d7
	eor.l	d1,d6
    7490:	b386           	eor.l d1,d6
	eor.l	d3,d7
    7492:	b787           	eor.l d3,d7

	move.l	d0,a4
    7494:	2840           	movea.l d0,a4
	move.l	d2,a5
    7496:	2a42           	movea.l d2,a5
	move.l	d6,a3
    7498:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    749a:	b5c8           	cmpa.l a0,a2
	bne	.x1
    749c:	6600 ff42      	bne.w 73e0 <.x1>
	move.l	d7,-BPLSIZE(a1)
    74a0:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    74a4:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    74a8:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    74ac:	22cd           	move.l a5,(a1)+

	movem.l	(sp)+,a0-a1
    74ae:	4cdf 0300      	movem.l (sp)+,a0-a1
	add.l	#BPLSIZE*4,a1
    74b2:	d3fc 0000 afe0 	adda.l #45024,a1

	move.l	(a0)+,d0
    74b8:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    74ba:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    74bc:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    74be:	2618           	move.l (a0)+,d3

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    74c0:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    74c6:	c084           	and.l d4,d0
	and.l	d4,d1
    74c8:	c284           	and.l d4,d1
	and.l	d4,d2
    74ca:	c484           	and.l d4,d2
	and.l	d4,d3
    74cc:	c684           	and.l d4,d3
	lsr.l	#4,d2
    74ce:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    74d0:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    74d2:	8082           	or.l d2,d0
	or.l	d3,d1
    74d4:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    74d6:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    74d8:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    74da:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    74dc:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    74de:	c484           	and.l d4,d2
	and.l	d4,d6
    74e0:	cc84           	and.l d4,d6
	and.l	d4,d3
    74e2:	c684           	and.l d4,d3
	and.l	d4,d7
    74e4:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    74e6:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    74e8:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    74ea:	8486           	or.l d6,d2
	or.l	d7,d3
    74ec:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    74ee:	3c02           	move.w d2,d6
	move.w	d3,d7
    74f0:	3e03           	move.w d3,d7
	move.w	d0,d2
    74f2:	3400           	move.w d0,d2
	move.w	d1,d3
    74f4:	3601           	move.w d1,d3
	swap	d2
    74f6:	4842           	swap d2
	swap	d3
    74f8:	4843           	swap d3
	move.w	d2,d0
    74fa:	3002           	move.w d2,d0
	move.w	d3,d1
    74fc:	3203           	move.w d3,d1
	move.w	d6,d2
    74fe:	3406           	move.w d6,d2
	move.w	d7,d3
    7500:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    7502:	2c02           	move.l d2,d6
	move.l	d3,d7
    7504:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    7506:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7508:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    750a:	b186           	eor.l d0,d6
	eor.l	d1,d7
    750c:	b387           	eor.l d1,d7
	and.l	d5,d6
    750e:	cc85           	and.l d5,d6
	and.l	d5,d7
    7510:	ce85           	and.l d5,d7
	eor.l	d6,d0
    7512:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7514:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    7516:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7518:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    751a:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    751c:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    751e:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7524:	2c01           	move.l d1,d6
	move.l	d3,d7
    7526:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7528:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    752a:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    752c:	b186           	eor.l d0,d6
	eor.l	d2,d7
    752e:	b587           	eor.l d2,d7
	bra	.start2
    7530:	6000 0088      	bra.w 75ba <.start2>

00007534 <.x2>:
.x2:
	move.l	(a0)+,d0
    7534:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    7536:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7538:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    753a:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    753c:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    7540:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    7546:	c084           	and.l d4,d0
	and.l	d4,d1
    7548:	c284           	and.l d4,d1
	and.l	d4,d2
    754a:	c484           	and.l d4,d2
	and.l	d4,d3
    754c:	c684           	and.l d4,d3
	lsr.l	#4,d2
    754e:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    7550:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    7552:	8082           	or.l d2,d0
	or.l	d3,d1
    7554:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    7556:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7558:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    755a:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    755c:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    755e:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    7562:	c484           	and.l d4,d2
	and.l	d4,d6
    7564:	cc84           	and.l d4,d6
	and.l	d4,d3
    7566:	c684           	and.l d4,d3
	and.l	d4,d7
    7568:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    756a:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    756c:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    756e:	8486           	or.l d6,d2
	or.l	d7,d3
    7570:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    7572:	3c02           	move.w d2,d6
	move.w	d3,d7
    7574:	3e03           	move.w d3,d7
	move.w	d0,d2
    7576:	3400           	move.w d0,d2
	move.w	d1,d3
    7578:	3601           	move.w d1,d3
	swap	d2
    757a:	4842           	swap d2
	swap	d3
    757c:	4843           	swap d3
	move.w	d2,d0
    757e:	3002           	move.w d2,d0
	move.w	d3,d1
    7580:	3203           	move.w d3,d1
	move.w	d6,d2
    7582:	3406           	move.w d6,d2
	move.w	d7,d3
    7584:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    7586:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    758a:	2c02           	move.l d2,d6
	move.l	d3,d7
    758c:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    758e:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7590:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    7592:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7594:	b387           	eor.l d1,d7
	and.l	d5,d6
    7596:	cc85           	and.l d5,d6
	and.l	d5,d7
    7598:	ce85           	and.l d5,d7
	eor.l	d6,d0
    759a:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    759c:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    759e:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    75a0:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    75a2:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    75a4:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    75a6:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    75ac:	2c01           	move.l d1,d6
	move.l	d3,d7
    75ae:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    75b0:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    75b2:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    75b4:	b186           	eor.l d0,d6
	eor.l	d2,d7
    75b6:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    75b8:	22cd           	move.l a5,(a1)+

000075ba <.start2>:
.start2:
	and.l	d4,d6
    75ba:	cc84           	and.l d4,d6
	and.l	d4,d7
    75bc:	ce84           	and.l d4,d7
	eor.l	d6,d0
    75be:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    75c0:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    75c2:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    75c4:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    75c6:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    75c8:	bf83           	eor.l d7,d3

	move.l	a6,d4
    75ca:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    75cc:	2c01           	move.l d1,d6
	move.l	d3,d7
    75ce:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    75d0:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    75d2:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    75d4:	b186           	eor.l d0,d6
	eor.l	d2,d7
    75d6:	b587           	eor.l d2,d7
	and.l	d4,d6
    75d8:	cc84           	and.l d4,d6
	and.l	d4,d7
    75da:	ce84           	and.l d4,d7
	eor.l	d6,d0
    75dc:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    75de:	bf82           	eor.l d7,d2
	add.l	d6,d6
    75e0:	dc86           	add.l d6,d6
	add.l	d7,d7
    75e2:	de87           	add.l d7,d7
	eor.l	d1,d6
    75e4:	b386           	eor.l d1,d6
	eor.l	d3,d7
    75e6:	b787           	eor.l d3,d7

	move.l	d0,a4
    75e8:	2840           	movea.l d0,a4
	move.l	d2,a5
    75ea:	2a42           	movea.l d2,a5
	move.l	d6,a3
    75ec:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    75ee:	b5c8           	cmpa.l a0,a2
	bne	.x2
    75f0:	6600 ff42      	bne.w 7534 <.x2>
	move.l	d7,-BPLSIZE(a1)
    75f4:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    75f8:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    75fc:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    7600:	22cd           	move.l a5,(a1)+

00007602 <.none>:
.none:
	movem.l .c2p_saveregs,d0-d7/a0-a6
    7602:	4cfa 7fff 0004 	movem.l 760a <.c2p_saveregs>(pc),d0-a6
	rts
    7608:	4e75           	rts

0000760a <.c2p_saveregs>:
	...

00007646 <c2p1x1_8_c5_gen_scroffs>:
    7646:	0000 0001      	ori.b #1,d0

0000764a <c2p1x1_8_c5_gen_pixels>:

.c2p_saveregs: .dcb.b 60


c2p1x1_8_c5_gen_scroffs: dc.l	1
    764a:	0000 0001      	ori.b #1,d0
