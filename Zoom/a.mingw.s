
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
       2:	203c 0000 a60a 	move.l #42506,d0
       8:	0480 0000 a60a 	subi.l #42506,d0
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
      22:	41f9 0000 a60a 	lea a60a <__fini_array_end>,a0
      28:	2071 8800      	movea.l (0,a1,a0.l),a0
      2c:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      2e:	52af 0004      	addq.l #1,4(sp)
      32:	202f 0004      	move.l 4(sp),d0
      36:	b097           	cmp.l (sp),d0
      38:	65de           	bcs.s 18 <_start+0x18>

	count = __init_array_end - __init_array_start;
      3a:	203c 0000 a60a 	move.l #42506,d0
      40:	0480 0000 a60a 	subi.l #42506,d0
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
      5a:	41f9 0000 a60a 	lea a60a <__fini_array_end>,a0
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
      78:	203c 0000 a60a 	move.l #42506,d0
      7e:	0480 0000 a60a 	subi.l #42506,d0
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
      9a:	41f9 0000 a60a 	lea a60a <__fini_array_end>,a0
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
      b6:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
      bc:	3f68 0002 0002 	move.w 2(a0),2(sp)
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
      c2:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
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
      e6:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
      ec:	6722           	beq.s 110 <FreeDisplay+0x30>
      ee:	2f79 004d 2c04 	move.l 4d2c04 <Copperlist1>,16(sp)
      f4:	0010 
      f6:	2f6f 0018 000c 	move.l 24(sp),12(sp)
      fc:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
     102:	2c40           	movea.l d0,a6
     104:	226f 0010      	movea.l 16(sp),a1
     108:	202f 000c      	move.l 12(sp),d0
     10c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     110:	2039 004d 2c08 	move.l 4d2c08 <Copperlist2>,d0
     116:	6722           	beq.s 13a <FreeDisplay+0x5a>
     118:	2f79 004d 2c08 	move.l 4d2c08 <Copperlist2>,8(sp)
     11e:	0008 
     120:	2f6f 0018 0004 	move.l 24(sp),4(sp)
     126:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
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
     146:	2039 004d 2c0c 	move.l 4d2c0c <DrawBuffer>,d0
     14c:	4240           	clr.w d0
     14e:	4840           	swap d0
     150:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     154:	2039 004d 2c0c 	move.l 4d2c0c <DrawBuffer>,d0
     15a:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     15e:	2f79 004d 2c14 	move.l 4d2c14 <DrawCopper>,4(sp)
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
     17e:	2039 004d 2c0c 	move.l 4d2c0c <DrawBuffer>,d0
     184:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     186:	2039 004d 2c10 	move.l 4d2c10 <ViewBuffer>,d0
     18c:	23c0 004d 2c0c 	move.l d0,4d2c0c <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     192:	2017           	move.l (sp),d0
     194:	23c0 004d 2c10 	move.l d0,4d2c10 <ViewBuffer>
}
     19a:	4fef 000c      	lea 12(sp),sp
     19e:	4e75           	rts

000001a0 <SwapCl>:

void SwapCl() {
     1a0:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     1a2:	2039 004d 2c14 	move.l 4d2c14 <DrawCopper>,d0
     1a8:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     1aa:	2039 004d 2c18 	move.l 4d2c18 <ViewCopper>,d0
     1b0:	23c0 004d 2c14 	move.l d0,4d2c14 <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     1b6:	2017           	move.l (sp),d0
     1b8:	23c0 004d 2c18 	move.l d0,4d2c18 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     1be:	2039 004d 2c18 	move.l 4d2c18 <ViewCopper>,d0
     1c4:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
     1ca:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     1ce:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
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
     2a6:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
     2ac:	317c 0020 009c 	move.w #32,156(a0)
     2b2:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
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
     2c2:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
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
     2e2:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
     2e8:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     2ee:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
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
     42e:	0681 0000 a924 	addi.l #43300,d1
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
     4c2:	2079 004d 2c20 	movea.l 4d2c20 <SysBase>,a0
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
     4e6:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
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
     514:	2079 004d 2c38 	movea.l 4d2c38 <VBR>,a0
     51a:	41e8 006c      	lea 108(a0),a0
     51e:	20af 0004      	move.l 4(sp),(a0)
}
     522:	4e75           	rts

00000524 <GetInterruptHandler>:

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     524:	2079 004d 2c38 	movea.l 4d2c38 <VBR>,a0
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
     57e:	23c0 004d 2c38 	move.l d0,4d2c38 <VBR>
	SystemIrq=GetInterruptHandler(); //store interrupt register
     584:	4eba ff9e      	jsr 524 <GetInterruptHandler>(pc)
     588:	23c0 004d 2c3c 	move.l d0,4d2c3c <SystemIrq>
}
     58e:	4e75           	rts

00000590 <FreeSystem>:

	//restore interrupts
	//SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
     590:	2079 004d 2c2c 	movea.l 4d2c2c <GfxBase>,a0
     596:	2028 0026      	move.l 38(a0),d0
     59a:	2079 004d 2c24 	movea.l 4d2c24 <custom>,a0
     5a0:	2140 0080      	move.l d0,128(a0)
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
     5a4:	2079 004d 2c2c 	movea.l 4d2c2c <GfxBase>,a0
     5aa:	2028 0032      	move.l 50(a0),d0
     5ae:	2079 004d 2c24 	movea.l 4d2c24 <custom>,a0
     5b4:	2140 0084      	move.l d0,132(a0)
	custom->copjmp1=0x7fff; //start coppper
     5b8:	2079 004d 2c24 	movea.l 4d2c24 <custom>,a0
     5be:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
     5c4:	3039 004d 2c32 	move.w 4d2c32 <SystemInts>,d0
     5ca:	2079 004d 2c24 	movea.l 4d2c24 <custom>,a0
     5d0:	0040 8000      	ori.w #-32768,d0
     5d4:	3140 009a      	move.w d0,154(a0)
	custom->dmacon=SystemDMA|0x8000;
     5d8:	3039 004d 2c34 	move.w 4d2c34 <SystemDMA>,d0
     5de:	2079 004d 2c24 	movea.l 4d2c24 <custom>,a0
     5e4:	0040 8000      	ori.w #-32768,d0
     5e8:	3140 0096      	move.w d0,150(a0)
	custom->adkcon=SystemADKCON|0x8000;
     5ec:	3039 004d 2c36 	move.w 4d2c36 <SystemADKCON>,d0
     5f2:	2079 004d 2c24 	movea.l 4d2c24 <custom>,a0
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
     606:	2079 004d 2c24 	movea.l 4d2c24 <custom>,a0
     60c:	317c 0020 009c 	move.w #32,156(a0)
     612:	2079 004d 2c24 	movea.l 4d2c24 <custom>,a0
     618:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	frameCounter++;
     61e:	3039 004d 2c44 	move.w 4d2c44 <frameCounter>,d0
     624:	5240           	addq.w #1,d0
     626:	33c0 004d 2c44 	move.w d0,4d2c44 <frameCounter>
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
     646:	23c0 004d 2c20 	move.l d0,4d2c20 <SysBase>
	hw = (struct Custom*)0xdff000;
     64c:	23fc 00df f000 	move.l #14675968,4d2c1c <hw>
     652:	004d 2c1c 

	SysBase = *((struct ExecBase**)4UL);
     656:	307c 0004      	movea.w #4,a0
     65a:	2010           	move.l (a0),d0
     65c:	23c0 004d 2c20 	move.l d0,4d2c20 <SysBase>
	custom = (struct Custom*)0xdff000;
     662:	23fc 00df f000 	move.l #14675968,4d2c24 <custom>
     668:	004d 2c24 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
     66c:	2f7c 0000 75b6 	move.l #30134,68(sp)
     672:	0044 
     674:	42af 0040      	clr.l 64(sp)
     678:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
     67e:	2c40           	movea.l d0,a6
     680:	226f 0044      	movea.l 68(sp),a1
     684:	202f 0040      	move.l 64(sp),d0
     688:	4eae fdd8      	jsr -552(a6)
     68c:	2f40 003c      	move.l d0,60(sp)
     690:	202f 003c      	move.l 60(sp),d0
     694:	23c0 004d 2c2c 	move.l d0,4d2c2c <GfxBase>
	if (!GfxBase)
     69a:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
     6a0:	6614           	bne.s 6b6 <main+0x84>
		Exit(0);
     6a2:	42af 0038      	clr.l 56(sp)
     6a6:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     6ac:	2c40           	movea.l d0,a6
     6ae:	222f 0038      	move.l 56(sp),d1
     6b2:	4eae ff70      	jsr -144(a6)

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     6b6:	2f7c 0000 75c7 	move.l #30151,52(sp)
     6bc:	0034 
     6be:	42af 0030      	clr.l 48(sp)
     6c2:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
     6c8:	2c40           	movea.l d0,a6
     6ca:	226f 0034      	movea.l 52(sp),a1
     6ce:	202f 0030      	move.l 48(sp),d0
     6d2:	4eae fdd8      	jsr -552(a6)
     6d6:	2f40 002c      	move.l d0,44(sp)
     6da:	202f 002c      	move.l 44(sp),d0
     6de:	23c0 004d 2c28 	move.l d0,4d2c28 <DOSBase>
	if (!DOSBase)
     6e4:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     6ea:	6614           	bne.s 700 <main+0xce>
		Exit(0);
     6ec:	42af 0028      	clr.l 40(sp)
     6f0:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     6f6:	2c40           	movea.l d0,a6
     6f8:	222f 0028      	move.l 40(sp),d1
     6fc:	4eae ff70      	jsr -144(a6)

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
     700:	4879 0000 75d3 	pea 75d3 <c2p1x1_8_c5_gen_pixels+0x21>
     706:	4eba 67a0      	jsr 6ea8 <KPrintF>(pc)
     70a:	588f           	addq.l #4,sp
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
     70c:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     712:	2c40           	movea.l d0,a6
     714:	4eae ffc4      	jsr -60(a6)
     718:	2f40 0024      	move.l d0,36(sp)
     71c:	202f 0024      	move.l 36(sp),d0
     720:	2f40 0020      	move.l d0,32(sp)
     724:	2f7c 0000 75ef 	move.l #30191,28(sp)
     72a:	001c 
     72c:	700f           	moveq #15,d0
     72e:	2f40 0018      	move.l d0,24(sp)
     732:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     738:	2c40           	movea.l d0,a6
     73a:	222f 0020      	move.l 32(sp),d1
     73e:	242f 001c      	move.l 28(sp),d2
     742:	262f 0018      	move.l 24(sp),d3
     746:	4eae ffd0      	jsr -48(a6)
     74a:	2f40 0014      	move.l d0,20(sp)
	Delay(50);
     74e:	7032           	moveq #50,d0
     750:	2f40 0010      	move.l d0,16(sp)
     754:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
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
     76c:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
     772:	317c 87ff 0096 	move.w #-30721,150(a0)
	//c2p();
  	Zoom_InitRun();
     778:	4eba 0906      	jsr 1080 <Zoom_InitRun>(pc)

	for(int i=0;i<20000;i++) {
     77c:	42af 004c      	clr.l 76(sp)
     780:	6008           	bra.s 78a <main+0x158>
		WaitVbl();
     782:	4eba fdac      	jsr 530 <WaitVbl>(pc)
	for(int i=0;i<20000;i++) {
     786:	52af 004c      	addq.l #1,76(sp)
     78a:	0caf 0000 4e1f 	cmpi.l #19999,76(sp)
     790:	004c 
     792:	6fee           	ble.s 782 <main+0x150>
	}
	ULONG *bp = 0x100;
     794:	2f7c 0000 0100 	move.l #256,12(sp)
     79a:	000c 
  	*bp = 0;
     79c:	206f 000c      	movea.l 12(sp),a0
     7a0:	4290           	clr.l (a0)
	Zoom_Dealloc();
     7a2:	4eba 0b74      	jsr 1318 <Zoom_Dealloc>(pc)
	*bp = 0;
     7a6:	206f 000c      	movea.l 12(sp),a0
     7aa:	4290           	clr.l (a0)
     7ac:	7000           	moveq #0,d0
	// END
	FreeSystem();

	/*CloseLibrary((struct Library*)DOSBase);
	CloseLibrary((struct Library*)GfxBase);*/
}
     7ae:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     7b2:	4fef 0044      	lea 68(sp),sp
     7b6:	4e75           	rts

000007b8 <SwScrollerTest>:

char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
     7b8:	4fef ff98      	lea -104(sp),sp
     7bc:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  PrepareDisplaySW();
     7c0:	4eba 0218      	jsr 9da <PrepareDisplaySW>(pc)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     7c4:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
     7ca:	4878 0010      	pea 10 <_start+0x10>
     7ce:	4879 0000 a68c 	pea a68c <ClsSprites>
     7d4:	42a7           	clr.l -(sp)
     7d6:	2f00           	move.l d0,-(sp)
     7d8:	4eba 1ff0      	jsr 27ca <TestCopperlistBatch>(pc)
     7dc:	4fef 0010      	lea 16(sp),sp
     7e0:	4a80           	tst.l d0
     7e2:	6642           	bne.s 826 <SwScrollerTest+0x6e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     7e4:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     7ea:	2c40           	movea.l d0,a6
     7ec:	4eae ffc4      	jsr -60(a6)
     7f0:	2f40 0070      	move.l d0,112(sp)
     7f4:	202f 0070      	move.l 112(sp),d0
     7f8:	2f40 006c      	move.l d0,108(sp)
     7fc:	2f7c 0000 7610 	move.l #30224,104(sp)
     802:	0068 
     804:	702c           	moveq #44,d0
     806:	2f40 0064      	move.l d0,100(sp)
     80a:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     810:	2c40           	movea.l d0,a6
     812:	222f 006c      	move.l 108(sp),d1
     816:	242f 0068      	move.l 104(sp),d2
     81a:	262f 0064      	move.l 100(sp),d3
     81e:	4eae ffd0      	jsr -48(a6)
     822:	2f40 0060      	move.l d0,96(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     826:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
     82c:	4878 000c      	pea c <_start+0xc>
     830:	4879 0000 a6cc 	pea a6cc <ClScreen>
     836:	4878 0010      	pea 10 <_start+0x10>
     83a:	2f00           	move.l d0,-(sp)
     83c:	4eba 1f8c      	jsr 27ca <TestCopperlistBatch>(pc)
     840:	4fef 0010      	lea 16(sp),sp
     844:	4a80           	tst.l d0
     846:	6642           	bne.s 88a <SwScrollerTest+0xd2>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     848:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     84e:	2c40           	movea.l d0,a6
     850:	4eae ffc4      	jsr -60(a6)
     854:	2f40 005c      	move.l d0,92(sp)
     858:	202f 005c      	move.l 92(sp),d0
     85c:	2f40 0058      	move.l d0,88(sp)
     860:	2f7c 0000 7646 	move.l #30278,84(sp)
     866:	0054 
     868:	7036           	moveq #54,d0
     86a:	2f40 0050      	move.l d0,80(sp)
     86e:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     874:	2c40           	movea.l d0,a6
     876:	222f 0058      	move.l 88(sp),d1
     87a:	242f 0054      	move.l 84(sp),d2
     87e:	262f 0050      	move.l 80(sp),d3
     882:	4eae ffd0      	jsr -48(a6)
     886:	2f40 004c      	move.l d0,76(sp)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     88a:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
     890:	4878 0002      	pea 2 <_start+0x2>
     894:	4879 0000 a60c 	pea a60c <ClColor>
     89a:	4878 001e      	pea 1e <_start+0x1e>
     89e:	2f00           	move.l d0,-(sp)
     8a0:	4eba 1f28      	jsr 27ca <TestCopperlistBatch>(pc)
     8a4:	4fef 0010      	lea 16(sp),sp
     8a8:	4a80           	tst.l d0
     8aa:	6642           	bne.s 8ee <SwScrollerTest+0x136>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     8ac:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     8b2:	2c40           	movea.l d0,a6
     8b4:	4eae ffc4      	jsr -60(a6)
     8b8:	2f40 0048      	move.l d0,72(sp)
     8bc:	202f 0048      	move.l 72(sp),d0
     8c0:	2f40 0044      	move.l d0,68(sp)
     8c4:	2f7c 0000 767d 	move.l #30333,64(sp)
     8ca:	0040 
     8cc:	7021           	moveq #33,d0
     8ce:	2f40 003c      	move.l d0,60(sp)
     8d2:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     8d8:	2c40           	movea.l d0,a6
     8da:	222f 0044      	move.l 68(sp),d1
     8de:	242f 0040      	move.l 64(sp),d2
     8e2:	262f 003c      	move.l 60(sp),d3
     8e6:	4eae ffd0      	jsr -48(a6)
     8ea:	2f40 0038      	move.l d0,56(sp)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     8ee:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
     8f4:	4878 fffe      	pea fffffffe <_end+0xffb2d38a>
     8f8:	4878 0020      	pea 20 <_start+0x20>
     8fc:	2f00           	move.l d0,-(sp)
     8fe:	4eba 1f08      	jsr 2808 <TestCopperlistPos>(pc)
     902:	4fef 000c      	lea 12(sp),sp
     906:	4a80           	tst.l d0
     908:	6642           	bne.s 94c <SwScrollerTest+0x194>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     90a:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     910:	2c40           	movea.l d0,a6
     912:	4eae ffc4      	jsr -60(a6)
     916:	2f40 0034      	move.l d0,52(sp)
     91a:	202f 0034      	move.l 52(sp),d0
     91e:	2f40 0030      	move.l d0,48(sp)
     922:	2f7c 0000 769f 	move.l #30367,44(sp)
     928:	002c 
     92a:	7022           	moveq #34,d0
     92c:	2f40 0028      	move.l d0,40(sp)
     930:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     936:	2c40           	movea.l d0,a6
     938:	222f 0030      	move.l 48(sp),d1
     93c:	242f 002c      	move.l 44(sp),d2
     940:	262f 0028      	move.l 40(sp),d3
     944:	4eae ffd0      	jsr -48(a6)
     948:	2f40 0024      	move.l d0,36(sp)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     94c:	2239 0000 b848 	move.l b848 <sw_text>,d1
     952:	2039 004d 2c0c 	move.l 4d2c0c <DrawBuffer>,d0
     958:	2f01           	move.l d1,-(sp)
     95a:	2f00           	move.l d0,-(sp)
     95c:	4879 0000 b84c 	pea b84c <sw_testfont>
     962:	4eba 0380      	jsr ce4 <WriteFont>(pc)
     966:	4fef 000c      	lea 12(sp),sp

  UWORD *tstpointer = (UWORD *)DrawBuffer;
     96a:	2f79 004d 2c0c 	move.l 4d2c0c <DrawBuffer>,32(sp)
     970:	0020 
  if( *tstpointer != 0xff00)
     972:	206f 0020      	movea.l 32(sp),a0
     976:	3010           	move.w (a0),d0
     978:	0c40 ff00      	cmpi.w #-256,d0
     97c:	6742           	beq.s 9c0 <SwScrollerTest+0x208>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     97e:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     984:	2c40           	movea.l d0,a6
     986:	4eae ffc4      	jsr -60(a6)
     98a:	2f40 001c      	move.l d0,28(sp)
     98e:	202f 001c      	move.l 28(sp),d0
     992:	2f40 0018      	move.l d0,24(sp)
     996:	2f7c 0000 76c2 	move.l #30402,20(sp)
     99c:	0014 
     99e:	7031           	moveq #49,d0
     9a0:	2f40 0010      	move.l d0,16(sp)
     9a4:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     9aa:	2c40           	movea.l d0,a6
     9ac:	222f 0018      	move.l 24(sp),d1
     9b0:	242f 0014      	move.l 20(sp),d2
     9b4:	262f 0010      	move.l 16(sp),d3
     9b8:	4eae ffd0      	jsr -48(a6)
     9bc:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
     9c0:	2f3c 0000 c800 	move.l #51200,-(sp)
     9c6:	4878 0084      	pea 84 <_start+0x84>
     9ca:	4eba f714      	jsr e0 <FreeDisplay>(pc)
     9ce:	508f           	addq.l #8,sp
     9d0:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     9d4:	4fef 0068      	lea 104(sp),sp
     9d8:	4e75           	rts

000009da <PrepareDisplaySW>:
 #include "swscroller.h"
 #include "utils.h"
 
 INCBIN(swfont, "raw/ruby16_8_1.raw");

 int PrepareDisplaySW() {
     9da:	4fef ffb8      	lea -72(sp),sp
     9de:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildSW();
     9e2:	4eba 017e      	jsr b62 <ClbuildSW>(pc)
     9e6:	23c0 004d 2c04 	move.l d0,4d2c04 <Copperlist1>
  Copperlist2 = ClbuildSW();
     9ec:	4eba 0174      	jsr b62 <ClbuildSW>(pc)
     9f0:	23c0 004d 2c08 	move.l d0,4d2c08 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     9f6:	2f7c 0000 c800 	move.l #51200,80(sp)
     9fc:	0050 
     9fe:	7002           	moveq #2,d0
     a00:	2f40 004c      	move.l d0,76(sp)
     a04:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
     a0a:	2c40           	movea.l d0,a6
     a0c:	202f 0050      	move.l 80(sp),d0
     a10:	222f 004c      	move.l 76(sp),d1
     a14:	4eae ff3a      	jsr -198(a6)
     a18:	2f40 0048      	move.l d0,72(sp)
     a1c:	202f 0048      	move.l 72(sp),d0
     a20:	23c0 004d 2bfc 	move.l d0,4d2bfc <Bitplane1>
  if(Bitplane1 == 0) {
     a26:	2039 004d 2bfc 	move.l 4d2bfc <Bitplane1>,d0
     a2c:	6658           	bne.s a86 <PrepareDisplaySW+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     a2e:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     a34:	2c40           	movea.l d0,a6
     a36:	4eae ffc4      	jsr -60(a6)
     a3a:	2f40 0044      	move.l d0,68(sp)
     a3e:	202f 0044      	move.l 68(sp),d0
     a42:	2f40 0040      	move.l d0,64(sp)
     a46:	2f7c 0000 7ca5 	move.l #31909,60(sp)
     a4c:	003c 
     a4e:	7026           	moveq #38,d0
     a50:	2f40 0038      	move.l d0,56(sp)
     a54:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     a5a:	2c40           	movea.l d0,a6
     a5c:	222f 0040      	move.l 64(sp),d1
     a60:	242f 003c      	move.l 60(sp),d2
     a64:	262f 0038      	move.l 56(sp),d3
     a68:	4eae ffd0      	jsr -48(a6)
     a6c:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
     a70:	7001           	moveq #1,d0
     a72:	2f40 0030      	move.l d0,48(sp)
     a76:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     a7c:	2c40           	movea.l d0,a6
     a7e:	222f 0030      	move.l 48(sp),d1
     a82:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
     a86:	2039 004d 2bfc 	move.l 4d2bfc <Bitplane1>,d0
     a8c:	23c0 004d 2c0c 	move.l d0,4d2c0c <DrawBuffer>
  DrawCopper = Copperlist1;
     a92:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
     a98:	23c0 004d 2c14 	move.l d0,4d2c14 <DrawCopper>
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     a9e:	2f7c 0000 c800 	move.l #51200,44(sp)
     aa4:	002c 
     aa6:	7002           	moveq #2,d0
     aa8:	2f40 0028      	move.l d0,40(sp)
     aac:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
     ab2:	2c40           	movea.l d0,a6
     ab4:	202f 002c      	move.l 44(sp),d0
     ab8:	222f 0028      	move.l 40(sp),d1
     abc:	4eae ff3a      	jsr -198(a6)
     ac0:	2f40 0024      	move.l d0,36(sp)
     ac4:	202f 0024      	move.l 36(sp),d0
     ac8:	23c0 004d 2c00 	move.l d0,4d2c00 <Bitplane2>
  if(Bitplane2 == 0) {
     ace:	2039 004d 2c00 	move.l 4d2c00 <Bitplane2>,d0
     ad4:	6658           	bne.s b2e <PrepareDisplaySW+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     ad6:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     adc:	2c40           	movea.l d0,a6
     ade:	4eae ffc4      	jsr -60(a6)
     ae2:	2f40 0020      	move.l d0,32(sp)
     ae6:	202f 0020      	move.l 32(sp),d0
     aea:	2f40 001c      	move.l d0,28(sp)
     aee:	2f7c 0000 7ccc 	move.l #31948,24(sp)
     af4:	0018 
     af6:	7026           	moveq #38,d0
     af8:	2f40 0014      	move.l d0,20(sp)
     afc:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     b02:	2c40           	movea.l d0,a6
     b04:	222f 001c      	move.l 28(sp),d1
     b08:	242f 0018      	move.l 24(sp),d2
     b0c:	262f 0014      	move.l 20(sp),d3
     b10:	4eae ffd0      	jsr -48(a6)
     b14:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     b18:	7001           	moveq #1,d0
     b1a:	2f40 000c      	move.l d0,12(sp)
     b1e:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     b24:	2c40           	movea.l d0,a6
     b26:	222f 000c      	move.l 12(sp),d1
     b2a:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
     b2e:	2039 004d 2c00 	move.l 4d2c00 <Bitplane2>,d0
     b34:	23c0 004d 2c10 	move.l d0,4d2c10 <ViewBuffer>
  ViewCopper = Copperlist2;
     b3a:	2039 004d 2c08 	move.l 4d2c08 <Copperlist2>,d0
     b40:	23c0 004d 2c18 	move.l d0,4d2c18 <ViewCopper>
  SwapCl();
     b46:	4eba f658      	jsr 1a0 <SwapCl>(pc)
  SetBplPointers();
     b4a:	4eba f5f6      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
     b4e:	4eba f650      	jsr 1a0 <SwapCl>(pc)
  SetBplPointers();
     b52:	4eba f5ee      	jsr 142 <SetBplPointers>(pc)
  return 0;
     b56:	7000           	moveq #0,d0
}
     b58:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     b5c:	4fef 0048      	lea 72(sp),sp
     b60:	4e75           	rts

00000b62 <ClbuildSW>:

ULONG * ClbuildSW() {
     b62:	4fef ffc4      	lea -60(sp),sp
     b66:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
     b6a:	2f7c 0000 0084 	move.l #132,48(sp)
     b70:	0030 
     b72:	7002           	moveq #2,d0
     b74:	2f40 002c      	move.l d0,44(sp)
     b78:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
     b7e:	2c40           	movea.l d0,a6
     b80:	202f 0030      	move.l 48(sp),d0
     b84:	222f 002c      	move.l 44(sp),d1
     b88:	4eae ff3a      	jsr -198(a6)
     b8c:	2f40 0028      	move.l d0,40(sp)
     b90:	202f 0028      	move.l 40(sp),d0
     b94:	2f40 0024      	move.l d0,36(sp)
  
  if( retval == 0) {
     b98:	6658           	bne.s bf2 <ClbuildSW+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     b9a:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     ba0:	2c40           	movea.l d0,a6
     ba2:	4eae ffc4      	jsr -60(a6)
     ba6:	2f40 0020      	move.l d0,32(sp)
     baa:	202f 0020      	move.l 32(sp),d0
     bae:	2f40 001c      	move.l d0,28(sp)
     bb2:	2f7c 0000 7cf3 	move.l #31987,24(sp)
     bb8:	0018 
     bba:	7228           	moveq #40,d1
     bbc:	2f41 0014      	move.l d1,20(sp)
     bc0:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     bc6:	2c40           	movea.l d0,a6
     bc8:	222f 001c      	move.l 28(sp),d1
     bcc:	242f 0018      	move.l 24(sp),d2
     bd0:	262f 0014      	move.l 20(sp),d3
     bd4:	4eae ffd0      	jsr -48(a6)
     bd8:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     bdc:	7401           	moveq #1,d2
     bde:	2f42 000c      	move.l d2,12(sp)
     be2:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
     be8:	2c40           	movea.l d0,a6
     bea:	222f 000c      	move.l 12(sp),d1
     bee:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
     bf2:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
     bf8:	2f7c 0000 a68c 	move.l #42636,64(sp)
     bfe:	0040 
  for(int i=0; i<16;i++)
     c00:	42af 003c      	clr.l 60(sp)
     c04:	6024           	bra.s c2a <ClbuildSW+0xc8>
    *cl++ = *clpartinstruction++;
     c06:	222f 0040      	move.l 64(sp),d1
     c0a:	2001           	move.l d1,d0
     c0c:	5880           	addq.l #4,d0
     c0e:	2f40 0040      	move.l d0,64(sp)
     c12:	202f 0044      	move.l 68(sp),d0
     c16:	2400           	move.l d0,d2
     c18:	5882           	addq.l #4,d2
     c1a:	2f42 0044      	move.l d2,68(sp)
     c1e:	2041           	movea.l d1,a0
     c20:	2210           	move.l (a0),d1
     c22:	2040           	movea.l d0,a0
     c24:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
     c26:	52af 003c      	addq.l #1,60(sp)
     c2a:	700f           	moveq #15,d0
     c2c:	b0af 003c      	cmp.l 60(sp),d0
     c30:	6cd4           	bge.s c06 <ClbuildSW+0xa4>
  clpartinstruction = ClScreen;
     c32:	2f7c 0000 a6cc 	move.l #42700,64(sp)
     c38:	0040 
  for(int i=0; i<12;i++)
     c3a:	42af 0038      	clr.l 56(sp)
     c3e:	6024           	bra.s c64 <ClbuildSW+0x102>
    *cl++ = *clpartinstruction++;
     c40:	222f 0040      	move.l 64(sp),d1
     c44:	2401           	move.l d1,d2
     c46:	5882           	addq.l #4,d2
     c48:	2f42 0040      	move.l d2,64(sp)
     c4c:	202f 0044      	move.l 68(sp),d0
     c50:	2400           	move.l d0,d2
     c52:	5882           	addq.l #4,d2
     c54:	2f42 0044      	move.l d2,68(sp)
     c58:	2041           	movea.l d1,a0
     c5a:	2210           	move.l (a0),d1
     c5c:	2040           	movea.l d0,a0
     c5e:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
     c60:	52af 0038      	addq.l #1,56(sp)
     c64:	700b           	moveq #11,d0
     c66:	b0af 0038      	cmp.l 56(sp),d0
     c6a:	6cd4           	bge.s c40 <ClbuildSW+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
     c6c:	202f 0044      	move.l 68(sp),d0
     c70:	2200           	move.l d0,d1
     c72:	5881           	addq.l #4,d1
     c74:	2f41 0044      	move.l d1,68(sp)
     c78:	2040           	movea.l d0,a0
     c7a:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
     c80:	202f 0044      	move.l 68(sp),d0
     c84:	2200           	move.l d0,d1
     c86:	5881           	addq.l #4,d1
     c88:	2f41 0044      	move.l d1,68(sp)
     c8c:	2040           	movea.l d0,a0
     c8e:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
     c94:	2f7c 0000 a60c 	move.l #42508,64(sp)
     c9a:	0040 
  for(int i=0; i<2;i++)
     c9c:	42af 0034      	clr.l 52(sp)
     ca0:	6024           	bra.s cc6 <ClbuildSW+0x164>
    *cl++ = *clpartinstruction++;
     ca2:	222f 0040      	move.l 64(sp),d1
     ca6:	2001           	move.l d1,d0
     ca8:	5880           	addq.l #4,d0
     caa:	2f40 0040      	move.l d0,64(sp)
     cae:	202f 0044      	move.l 68(sp),d0
     cb2:	2400           	move.l d0,d2
     cb4:	5882           	addq.l #4,d2
     cb6:	2f42 0044      	move.l d2,68(sp)
     cba:	2041           	movea.l d1,a0
     cbc:	2210           	move.l (a0),d1
     cbe:	2040           	movea.l d0,a0
     cc0:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
     cc2:	52af 0034      	addq.l #1,52(sp)
     cc6:	7001           	moveq #1,d0
     cc8:	b0af 0034      	cmp.l 52(sp),d0
     ccc:	6cd4           	bge.s ca2 <ClbuildSW+0x140>

  *cl = 0xfffffffe;
     cce:	206f 0044      	movea.l 68(sp),a0
     cd2:	72fe           	moveq #-2,d1
     cd4:	2081           	move.l d1,(a0)

  return retval;
     cd6:	202f 0024      	move.l 36(sp),d0
}
     cda:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     cde:	4fef 003c      	lea 60(sp),sp
     ce2:	4e75           	rts

00000ce4 <WriteFont>:

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
     ce4:	4fef fff0      	lea -16(sp),sp
  UWORD *bmpptr = Destination;
     ce8:	2f6f 0018 000c 	move.l 24(sp),12(sp)
  UWORD *fntptr = font;
     cee:	2f6f 0014 0008 	move.l 20(sp),8(sp)

  char charpos = *text;
     cf4:	206f 001c      	movea.l 28(sp),a0
     cf8:	1f50 0003      	move.b (a0),3(sp)
  charpos -= 0x20;
     cfc:	102f 0003      	move.b 3(sp),d0
     d00:	0600 ffe0      	addi.b #-32,d0
     d04:	1f40 0003      	move.b d0,3(sp)
  charpos = charpos<<3;
     d08:	102f 0003      	move.b 3(sp),d0
     d0c:	4880           	ext.w d0
     d0e:	48c0           	ext.l d0
     d10:	e788           	lsl.l #3,d0
     d12:	1f40 0003      	move.b d0,3(sp)
  fntptr += charpos;
     d16:	102f 0003      	move.b 3(sp),d0
     d1a:	4880           	ext.w d0
     d1c:	3040           	movea.w d0,a0
     d1e:	2008           	move.l a0,d0
     d20:	d088           	add.l a0,d0
     d22:	d1af 0008      	add.l d0,8(sp)
  for(int i=1;i<=8;i++) {
     d26:	7001           	moveq #1,d0
     d28:	2f40 0004      	move.l d0,4(sp)
     d2c:	6020           	bra.s d4e <WriteFont+0x6a>
    *bmpptr = *fntptr++;
     d2e:	202f 0008      	move.l 8(sp),d0
     d32:	2200           	move.l d0,d1
     d34:	5481           	addq.l #2,d1
     d36:	2f41 0008      	move.l d1,8(sp)
     d3a:	2040           	movea.l d0,a0
     d3c:	3010           	move.w (a0),d0
     d3e:	206f 000c      	movea.l 12(sp),a0
     d42:	3080           	move.w d0,(a0)
    bmpptr += 40;
     d44:	7050           	moveq #80,d0
     d46:	d1af 000c      	add.l d0,12(sp)
  for(int i=1;i<=8;i++) {
     d4a:	52af 0004      	addq.l #1,4(sp)
     d4e:	7208           	moveq #8,d1
     d50:	b2af 0004      	cmp.l 4(sp),d1
     d54:	6cd8           	bge.s d2e <WriteFont+0x4a>
  }

}
     d56:	4fef 0010      	lea 16(sp),sp
     d5a:	4e75           	rts

00000d5c <Zoom_VblankHandler>:
  }
}*/

void Zoom_VblankHandler() {

  Zoom_Counter++;
     d5c:	3039 004d 2c5c 	move.w 4d2c5c <Zoom_Counter>,d0
     d62:	5240           	addq.w #1,d0
     d64:	33c0 004d 2c5c 	move.w d0,4d2c5c <Zoom_Counter>
  SwapCl();
     d6a:	4eba f434      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     d6e:	33fc 0001 004d 	move.w #1,4d2c62 <Zoom_MouseReleased>
     d74:	2c62 
  if( MouseLeft())
     d76:	4eba f4ea      	jsr 262 <MouseLeft>(pc)
     d7a:	4a40           	tst.w d0
     d7c:	6708           	beq.s d86 <Zoom_VblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     d7e:	33fc 0001 004d 	move.w #1,4d2c64 <Zoom_Mousepressed>
     d84:	2c64 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     d86:	3039 004d 2c64 	move.w 4d2c64 <Zoom_Mousepressed>,d0
     d8c:	0c40 0001      	cmpi.w #1,d0
     d90:	6616           	bne.s da8 <Zoom_VblankHandler+0x4c>
     d92:	4eba f4ce      	jsr 262 <MouseLeft>(pc)
     d96:	4a40           	tst.w d0
     d98:	660e           	bne.s da8 <Zoom_VblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     d9a:	33fc 0001 004d 	move.w #1,4d2c62 <Zoom_MouseReleased>
     da0:	2c62 
    Zoom_Mousepressed = 0;
     da2:	4279 004d 2c64 	clr.w 4d2c64 <Zoom_Mousepressed>
  }
      
      Zoom_MouseReleased = 0;
     da8:	4279 004d 2c62 	clr.w 4d2c62 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom <= 2) {
     dae:	3039 004d 2c6a 	move.w 4d2c6a <Zoom_LevelOf102Zoom>,d0
     db4:	0c40 0002      	cmpi.w #2,d0
     db8:	6244           	bhi.s dfe <Zoom_VblankHandler+0xa2>
 
        if( Zoom_LevelOfZoom == 87)
     dba:	3039 004d 2c68 	move.w 4d2c68 <Zoom_LevelOfZoom>,d0
     dc0:	0c40 0057      	cmpi.w #87,d0
     dc4:	660a           	bne.s dd0 <Zoom_VblankHandler+0x74>
          Zoom_LevelOfZoom = 0;
     dc6:	33fc 0000 004d 	move.w #0,4d2c68 <Zoom_LevelOfZoom>
     dcc:	2c68 
     dce:	600e           	bra.s dde <Zoom_VblankHandler+0x82>
        else
          Zoom_LevelOfZoom++;
     dd0:	3039 004d 2c68 	move.w 4d2c68 <Zoom_LevelOfZoom>,d0
     dd6:	5240           	addq.w #1,d0
     dd8:	33c0 004d 2c68 	move.w d0,4d2c68 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     dde:	33fc 000f 004d 	move.w #15,4d2c6a <Zoom_LevelOf102Zoom>
     de4:	2c6a 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     de6:	3039 004d 2c68 	move.w 4d2c68 <Zoom_LevelOfZoom>,d0
     dec:	3000           	move.w d0,d0
     dee:	0280 0000 ffff 	andi.l #65535,d0
     df4:	2f00           	move.l d0,-(sp)
     df6:	4eba 10bc      	jsr 1eb4 <Zoom_SwapBuffers>(pc)
     dfa:	588f           	addq.l #4,sp
     dfc:	600e           	bra.s e0c <Zoom_VblankHandler+0xb0>
      } else 
        Zoom_LevelOf102Zoom-=2;
     dfe:	3039 004d 2c6a 	move.w 4d2c6a <Zoom_LevelOf102Zoom>,d0
     e04:	5540           	subq.w #2,d0
     e06:	33c0 004d 2c6a 	move.w d0,4d2c6a <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     e0c:	2239 004d 2c14 	move.l 4d2c14 <DrawCopper>,d1
     e12:	3039 004d 2c6a 	move.w 4d2c6a <Zoom_LevelOf102Zoom>,d0
     e18:	3000           	move.w d0,d0
     e1a:	0280 0000 ffff 	andi.l #65535,d0
     e20:	2f01           	move.l d1,-(sp)
     e22:	2f00           	move.l d0,-(sp)
     e24:	4eba f5e6      	jsr 40c <Zoom_Shrink102>(pc)
     e28:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     e2a:	2239 004d 2c14 	move.l 4d2c14 <DrawCopper>,d1
     e30:	2039 004d 2c10 	move.l 4d2c10 <ViewBuffer>,d0
     e36:	2f01           	move.l d1,-(sp)
     e38:	2f00           	move.l d0,-(sp)
     e3a:	4eba 0fe0      	jsr 1e1c <Zoom_SetBplPointers>(pc)
     e3e:	508f           	addq.l #8,sp
 
}
     e40:	4e75           	rts

00000e42 <Zoom_ReverseVblankHandler>:


void Zoom_ReverseVblankHandler() {
  
  Zoom_Counter++;
     e42:	3039 004d 2c5c 	move.w 4d2c5c <Zoom_Counter>,d0
     e48:	5240           	addq.w #1,d0
     e4a:	33c0 004d 2c5c 	move.w d0,4d2c5c <Zoom_Counter>
  SwapCl();
     e50:	4eba f34e      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     e54:	33fc 0001 004d 	move.w #1,4d2c62 <Zoom_MouseReleased>
     e5a:	2c62 
  if( MouseLeft())
     e5c:	4eba f404      	jsr 262 <MouseLeft>(pc)
     e60:	4a40           	tst.w d0
     e62:	6708           	beq.s e6c <Zoom_ReverseVblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     e64:	33fc 0001 004d 	move.w #1,4d2c64 <Zoom_Mousepressed>
     e6a:	2c64 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     e6c:	3039 004d 2c64 	move.w 4d2c64 <Zoom_Mousepressed>,d0
     e72:	0c40 0001      	cmpi.w #1,d0
     e76:	6616           	bne.s e8e <Zoom_ReverseVblankHandler+0x4c>
     e78:	4eba f3e8      	jsr 262 <MouseLeft>(pc)
     e7c:	4a40           	tst.w d0
     e7e:	660e           	bne.s e8e <Zoom_ReverseVblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     e80:	33fc 0001 004d 	move.w #1,4d2c62 <Zoom_MouseReleased>
     e86:	2c62 
    Zoom_Mousepressed = 0;
     e88:	4279 004d 2c64 	clr.w 4d2c64 <Zoom_Mousepressed>
    /*if( MouseLeft()) {
      while (MouseLeft())
      {
      }*/
      
      Zoom_MouseReleased = 0;
     e8e:	4279 004d 2c62 	clr.w 4d2c62 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 15) {
     e94:	3039 004d 2c6a 	move.w 4d2c6a <Zoom_LevelOf102Zoom>,d0
     e9a:	0c40 000f      	cmpi.w #15,d0
     e9e:	6640           	bne.s ee0 <Zoom_ReverseVblankHandler+0x9e>
 
        if( Zoom_LevelOfZoom == 0)
     ea0:	3039 004d 2c68 	move.w 4d2c68 <Zoom_LevelOfZoom>,d0
     ea6:	660a           	bne.s eb2 <Zoom_ReverseVblankHandler+0x70>
          Zoom_LevelOfZoom = 17;
     ea8:	33fc 0011 004d 	move.w #17,4d2c68 <Zoom_LevelOfZoom>
     eae:	2c68 
     eb0:	600e           	bra.s ec0 <Zoom_ReverseVblankHandler+0x7e>
        else
          Zoom_LevelOfZoom--;
     eb2:	3039 004d 2c68 	move.w 4d2c68 <Zoom_LevelOfZoom>,d0
     eb8:	5340           	subq.w #1,d0
     eba:	33c0 004d 2c68 	move.w d0,4d2c68 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 0;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     ec0:	33fc 0000 004d 	move.w #0,4d2c6a <Zoom_LevelOf102Zoom>
     ec6:	2c6a 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     ec8:	3039 004d 2c68 	move.w 4d2c68 <Zoom_LevelOfZoom>,d0
     ece:	3000           	move.w d0,d0
     ed0:	0280 0000 ffff 	andi.l #65535,d0
     ed6:	2f00           	move.l d0,-(sp)
     ed8:	4eba 0fda      	jsr 1eb4 <Zoom_SwapBuffers>(pc)
     edc:	588f           	addq.l #4,sp
     ede:	600e           	bra.s eee <Zoom_ReverseVblankHandler+0xac>
      } else 
        Zoom_LevelOf102Zoom++;
     ee0:	3039 004d 2c6a 	move.w 4d2c6a <Zoom_LevelOf102Zoom>,d0
     ee6:	5240           	addq.w #1,d0
     ee8:	33c0 004d 2c6a 	move.w d0,4d2c6a <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     eee:	2239 004d 2c14 	move.l 4d2c14 <DrawCopper>,d1
     ef4:	3039 004d 2c6a 	move.w 4d2c6a <Zoom_LevelOf102Zoom>,d0
     efa:	3000           	move.w d0,d0
     efc:	0280 0000 ffff 	andi.l #65535,d0
     f02:	2f01           	move.l d1,-(sp)
     f04:	2f00           	move.l d0,-(sp)
     f06:	4eba f504      	jsr 40c <Zoom_Shrink102>(pc)
     f0a:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     f0c:	2239 004d 2c14 	move.l 4d2c14 <DrawCopper>,d1
     f12:	2039 004d 2c10 	move.l 4d2c10 <ViewBuffer>,d0
     f18:	2f01           	move.l d1,-(sp)
     f1a:	2f00           	move.l d0,-(sp)
     f1c:	4eba 0efe      	jsr 1e1c <Zoom_SetBplPointers>(pc)
     f20:	508f           	addq.l #8,sp
 
}
     f22:	4e75           	rts

00000f24 <Zoom_LoadImage>:

void Zoom_LoadImage( ULONG *destination) {  
     f24:	4fef fff4      	lea -12(sp),sp
     f28:	2f0e           	move.l a6,-(sp)
  CopyMem( rawzoom, destination, ZMBPLSIZE);
     f2a:	2f79 0000 b8a0 	move.l b8a0 <rawzoom>,12(sp)
     f30:	000c 
     f32:	2f6f 0014 0008 	move.l 20(sp),8(sp)
     f38:	2f7c 0000 df20 	move.l #57120,4(sp)
     f3e:	0004 
     f40:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
     f46:	2c40           	movea.l d0,a6
     f48:	206f 000c      	movea.l 12(sp),a0
     f4c:	226f 0008      	movea.l 8(sp),a1
     f50:	202f 0004      	move.l 4(sp),d0
     f54:	4eae fd90      	jsr -624(a6)
}
     f58:	2c5f           	movea.l (sp)+,a6
     f5a:	4fef 000c      	lea 12(sp),sp
     f5e:	4e75           	rts

00000f60 <Zoom_CopyWord>:

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080008, 
                                                       0x010a0000, 0x01001200 };

void  Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height) {  
     f60:	598f           	subq.l #4,sp
     f62:	202f 0010      	move.l 16(sp),d0
     f66:	3000           	move.w d0,d0
     f68:	3f40 0002      	move.w d0,2(sp)

  WaitBlt();
     f6c:	4eba f146      	jsr b4 <WaitBlt>(pc)

  hw->bltapt = (UWORD *) source;
     f70:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
     f76:	216f 0008 0050 	move.l 8(sp),80(a0)
  hw->bltdpt = (UWORD *) destination;
     f7c:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
     f82:	216f 000c 0054 	move.l 12(sp),84(a0)
  hw->bltsize = (height<<6)+2;
     f88:	302f 0002      	move.w 2(sp),d0
     f8c:	ed48           	lsl.w #6,d0
     f8e:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
     f94:	5440           	addq.w #2,d0
     f96:	3140 0058      	move.w d0,88(a0)

}
     f9a:	588f           	addq.l #4,sp
     f9c:	4e75           	rts

00000f9e <Zoom_ZoomBlit>:

void Zoom_ZoomBlit( UWORD *source, UWORD *destination, UWORD height) {
     f9e:	518f           	subq.l #8,sp
     fa0:	202f 0014      	move.l 20(sp),d0
     fa4:	3000           	move.w d0,d0
     fa6:	3f40 0002      	move.w d0,2(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B

  UWORD *blta = source + ZoomBlit_Increment4SrcA;
     faa:	3039 004d 2c52 	move.w 4d2c52 <ZoomBlit_Increment4SrcA>,d0
     fb0:	3000           	move.w d0,d0
     fb2:	0280 0000 ffff 	andi.l #65535,d0
     fb8:	d080           	add.l d0,d0
     fba:	222f 000c      	move.l 12(sp),d1
     fbe:	d280           	add.l d0,d1
     fc0:	2f41 0004      	move.l d1,4(sp)
  WaitBlt();
     fc4:	4eba f0ee      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  
  hw->bltapt = blta;
     fc8:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
     fce:	216f 0004 0050 	move.l 4(sp),80(a0)
  hw->bltbpt = source;
     fd4:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
     fda:	216f 000c 004c 	move.l 12(sp),76(a0)
  hw->bltdpt = destination;
     fe0:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
     fe6:	216f 0010 0054 	move.l 16(sp),84(a0)
  hw->bltsize = (height<<6)+2;
     fec:	302f 0002      	move.w 2(sp),d0
     ff0:	ed48           	lsl.w #6,d0
     ff2:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
     ff8:	5440           	addq.w #2,d0
     ffa:	3140 0058      	move.w d0,88(a0)

}
     ffe:	508f           	addq.l #8,sp
    1000:	4e75           	rts

00001002 <Zoom_ZoomBlit2>:

void Zoom_ZoomBlit2( UWORD *src4a, UWORD *src4b, UWORD *dst, UWORD height,
                                                 UWORD bltamod, UWORD bltbmod
                                                        , UWORD numofwords) {
    1002:	518f           	subq.l #8,sp
    1004:	226f 0018      	movea.l 24(sp),a1
    1008:	206f 001c      	movea.l 28(sp),a0
    100c:	222f 0020      	move.l 32(sp),d1
    1010:	202f 0024      	move.l 36(sp),d0
    1014:	3249           	movea.w a1,a1
    1016:	3f49 0006      	move.w a1,6(sp)
    101a:	3048           	movea.w a0,a0
    101c:	3f48 0004      	move.w a0,4(sp)
    1020:	3201           	move.w d1,d1
    1022:	3f41 0002      	move.w d1,2(sp)
    1026:	3000           	move.w d0,d0
    1028:	3e80           	move.w d0,(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B
  hw->bltamod = bltamod;
    102a:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    1030:	316f 0004 0064 	move.w 4(sp),100(a0)
  hw->bltbmod = bltbmod;  
    1036:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    103c:	316f 0002 0062 	move.w 2(sp),98(a0)
  hw->bltapt = src4a;
    1042:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    1048:	216f 000c 0050 	move.l 12(sp),80(a0)
  hw->bltbpt = src4b;
    104e:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    1054:	216f 0010 004c 	move.l 16(sp),76(a0)
  hw->bltdpt = dst;
    105a:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    1060:	216f 0014 0054 	move.l 20(sp),84(a0)
  hw->bltsize = (height<<6)+numofwords;
    1066:	302f 0006      	move.w 6(sp),d0
    106a:	ed48           	lsl.w #6,d0
    106c:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    1072:	d057           	add.w (sp),d0
    1074:	3140 0058      	move.w d0,88(a0)
  
  WaitBlt();
    1078:	4eba f03a      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a  

}
    107c:	508f           	addq.l #8,sp
    107e:	4e75           	rts

00001080 <Zoom_InitRun>:


void Zoom_InitRun() {
    1080:	4fef ffe0      	lea -32(sp),sp
    1084:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    1086:	4279 004d 2c5c 	clr.w 4d2c5c <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    108c:	7004           	moveq #4,d0
    108e:	2f40 0020      	move.l d0,32(sp)
    1092:	7002           	moveq #2,d0
    1094:	2f40 001c      	move.l d0,28(sp)
    1098:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    109e:	2c40           	movea.l d0,a6
    10a0:	202f 0020      	move.l 32(sp),d0
    10a4:	222f 001c      	move.l 28(sp),d1
    10a8:	4eae ff3a      	jsr -198(a6)
    10ac:	2f40 0018      	move.l d0,24(sp)
    10b0:	202f 0018      	move.l 24(sp),d0
    10b4:	23c0 004d 2c4a 	move.l d0,4d2c4a <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 15;
    10ba:	33fc 000f 004d 	move.w #15,4d2c6a <Zoom_LevelOf102Zoom>
    10c0:	2c6a 
  ZoomHorizontal = 16;
    10c2:	33fc 0010 004d 	move.w #16,4d2c6e <ZoomHorizontal>
    10c8:	2c6e 
  Zoom_PrepareDisplay();
    10ca:	4eba 0288      	jsr 1354 <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 15, Copperlist1);
    10ce:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    10d4:	2f00           	move.l d0,-(sp)
    10d6:	4878 000f      	pea f <_start+0xf>
    10da:	4eba f330      	jsr 40c <Zoom_Shrink102>(pc)
    10de:	508f           	addq.l #8,sp
  Zoom_Shrink102( 15, Copperlist2);
    10e0:	2039 004d 2c08 	move.l 4d2c08 <Copperlist2>,d0
    10e6:	2f00           	move.l d0,-(sp)
    10e8:	4878 000f      	pea f <_start+0xf>
    10ec:	4eba f31e      	jsr 40c <Zoom_Shrink102>(pc)
    10f0:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 1;
    10f2:	33fc 0001 004d 	move.w #1,4d2c68 <Zoom_LevelOfZoom>
    10f8:	2c68 
  Zoom_Direction = 1;                                                  
    10fa:	33fc 0001 004d 	move.w #1,4d2c6c <Zoom_Direction>
    1100:	2c6c 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    1102:	7016           	moveq #22,d0
    1104:	2f40 0014      	move.l d0,20(sp)
    1108:	2f7c 0001 0001 	move.l #65537,16(sp)
    110e:	0010 
    1110:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    1116:	2c40           	movea.l d0,a6
    1118:	202f 0014      	move.l 20(sp),d0
    111c:	222f 0010      	move.l 16(sp),d1
    1120:	4eae ff3a      	jsr -198(a6)
    1124:	2f40 000c      	move.l d0,12(sp)
    1128:	202f 000c      	move.l 12(sp),d0
    112c:	23c0 004d 2c54 	move.l d0,4d2c54 <Zoom_vbint>
    1132:	2039 004d 2c54 	move.l 4d2c54 <Zoom_vbint>,d0
    1138:	673e           	beq.s 1178 <Zoom_InitRun+0xf8>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    113a:	2079 004d 2c54 	movea.l 4d2c54 <Zoom_vbint>,a0
    1140:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    1146:	2079 004d 2c54 	movea.l 4d2c54 <Zoom_vbint>,a0
    114c:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    1152:	2079 004d 2c54 	movea.l 4d2c54 <Zoom_vbint>,a0
    1158:	217c 0000 7d19 	move.l #32025,10(a0)
    115e:	000a 
    Zoom_vbint->is_Data = NULL;
    1160:	2079 004d 2c54 	movea.l 4d2c54 <Zoom_vbint>,a0
    1166:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    116a:	2079 004d 2c54 	movea.l 4d2c54 <Zoom_vbint>,a0
    1170:	217c 0000 0d5c 	move.l #3420,18(a0)
    1176:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    1178:	7005           	moveq #5,d0
    117a:	2f40 0008      	move.l d0,8(sp)
    117e:	2f79 004d 2c54 	move.l 4d2c54 <Zoom_vbint>,4(sp)
    1184:	0004 
    1186:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    118c:	2c40           	movea.l d0,a6
    118e:	202f 0008      	move.l 8(sp),d0
    1192:	226f 0004      	movea.l 4(sp),a1
    1196:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    119a:	2239 004d 2c18 	move.l 4d2c18 <ViewCopper>,d1
    11a0:	2039 004d 2c10 	move.l 4d2c10 <ViewBuffer>,d0
    11a6:	2f01           	move.l d1,-(sp)
    11a8:	2f00           	move.l d0,-(sp)
    11aa:	4eba 0c70      	jsr 1e1c <Zoom_SetBplPointers>(pc)
    11ae:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    11b0:	2239 004d 2c14 	move.l 4d2c14 <DrawCopper>,d1
    11b6:	2039 004d 2c10 	move.l 4d2c10 <ViewBuffer>,d0
    11bc:	2f01           	move.l d1,-(sp)
    11be:	2f00           	move.l d0,-(sp)
    11c0:	4eba 0c5a      	jsr 1e1c <Zoom_SetBplPointers>(pc)
    11c4:	508f           	addq.l #8,sp
  SwapCl();
    11c6:	4eba efd8      	jsr 1a0 <SwapCl>(pc)
  
}
    11ca:	2c5f           	movea.l (sp)+,a6
    11cc:	4fef 0020      	lea 32(sp),sp
    11d0:	4e75           	rts

000011d2 <Zoom_InitRunReverse>:

void Zoom_InitRunReverse() {
    11d2:	4fef ffe0      	lea -32(sp),sp
    11d6:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    11d8:	4279 004d 2c5c 	clr.w 4d2c5c <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    11de:	7004           	moveq #4,d0
    11e0:	2f40 0020      	move.l d0,32(sp)
    11e4:	7002           	moveq #2,d0
    11e6:	2f40 001c      	move.l d0,28(sp)
    11ea:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    11f0:	2c40           	movea.l d0,a6
    11f2:	202f 0020      	move.l 32(sp),d0
    11f6:	222f 001c      	move.l 28(sp),d1
    11fa:	4eae ff3a      	jsr -198(a6)
    11fe:	2f40 0018      	move.l d0,24(sp)
    1202:	202f 0018      	move.l 24(sp),d0
    1206:	23c0 004d 2c4a 	move.l d0,4d2c4a <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 0;
    120c:	33fc 0000 004d 	move.w #0,4d2c6a <Zoom_LevelOf102Zoom>
    1212:	2c6a 
  ZoomHorizontal = 16;
    1214:	33fc 0010 004d 	move.w #16,4d2c6e <ZoomHorizontal>
    121a:	2c6e 
  Zoom_PrepareDisplay();
    121c:	4eba 0136      	jsr 1354 <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 0, Copperlist1);
    1220:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    1226:	2f00           	move.l d0,-(sp)
    1228:	42a7           	clr.l -(sp)
    122a:	4eba f1e0      	jsr 40c <Zoom_Shrink102>(pc)
    122e:	508f           	addq.l #8,sp
  Zoom_Shrink102( 0, Copperlist2);
    1230:	2039 004d 2c08 	move.l 4d2c08 <Copperlist2>,d0
    1236:	2f00           	move.l d0,-(sp)
    1238:	42a7           	clr.l -(sp)
    123a:	4eba f1d0      	jsr 40c <Zoom_Shrink102>(pc)
    123e:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 17;
    1240:	33fc 0011 004d 	move.w #17,4d2c68 <Zoom_LevelOfZoom>
    1246:	2c68 
                                                  
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    1248:	7016           	moveq #22,d0
    124a:	2f40 0014      	move.l d0,20(sp)
    124e:	2f7c 0001 0001 	move.l #65537,16(sp)
    1254:	0010 
    1256:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    125c:	2c40           	movea.l d0,a6
    125e:	202f 0014      	move.l 20(sp),d0
    1262:	222f 0010      	move.l 16(sp),d1
    1266:	4eae ff3a      	jsr -198(a6)
    126a:	2f40 000c      	move.l d0,12(sp)
    126e:	202f 000c      	move.l 12(sp),d0
    1272:	23c0 004d 2c54 	move.l d0,4d2c54 <Zoom_vbint>
    1278:	2039 004d 2c54 	move.l 4d2c54 <Zoom_vbint>,d0
    127e:	673e           	beq.s 12be <Zoom_InitRunReverse+0xec>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1280:	2079 004d 2c54 	movea.l 4d2c54 <Zoom_vbint>,a0
    1286:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    128c:	2079 004d 2c54 	movea.l 4d2c54 <Zoom_vbint>,a0
    1292:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    1298:	2079 004d 2c54 	movea.l 4d2c54 <Zoom_vbint>,a0
    129e:	217c 0000 7d19 	move.l #32025,10(a0)
    12a4:	000a 
    Zoom_vbint->is_Data = NULL;
    12a6:	2079 004d 2c54 	movea.l 4d2c54 <Zoom_vbint>,a0
    12ac:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_ReverseVblankHandler;
    12b0:	2079 004d 2c54 	movea.l 4d2c54 <Zoom_vbint>,a0
    12b6:	217c 0000 0e42 	move.l #3650,18(a0)
    12bc:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    12be:	7005           	moveq #5,d0
    12c0:	2f40 0008      	move.l d0,8(sp)
    12c4:	2f79 004d 2c54 	move.l 4d2c54 <Zoom_vbint>,4(sp)
    12ca:	0004 
    12cc:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    12d2:	2c40           	movea.l d0,a6
    12d4:	202f 0008      	move.l 8(sp),d0
    12d8:	226f 0004      	movea.l 4(sp),a1
    12dc:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    12e0:	2239 004d 2c18 	move.l 4d2c18 <ViewCopper>,d1
    12e6:	2039 004d 2c10 	move.l 4d2c10 <ViewBuffer>,d0
    12ec:	2f01           	move.l d1,-(sp)
    12ee:	2f00           	move.l d0,-(sp)
    12f0:	4eba 0b2a      	jsr 1e1c <Zoom_SetBplPointers>(pc)
    12f4:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    12f6:	2239 004d 2c14 	move.l 4d2c14 <DrawCopper>,d1
    12fc:	2039 004d 2c10 	move.l 4d2c10 <ViewBuffer>,d0
    1302:	2f01           	move.l d1,-(sp)
    1304:	2f00           	move.l d0,-(sp)
    1306:	4eba 0b14      	jsr 1e1c <Zoom_SetBplPointers>(pc)
    130a:	508f           	addq.l #8,sp
  SwapCl();
    130c:	4eba ee92      	jsr 1a0 <SwapCl>(pc)
  
}
    1310:	2c5f           	movea.l (sp)+,a6
    1312:	4fef 0020      	lea 32(sp),sp
    1316:	4e75           	rts

00001318 <Zoom_Dealloc>:

void Zoom_Dealloc() {
    1318:	518f           	subq.l #8,sp
    131a:	2f0e           	move.l a6,-(sp)
  RemIntServer(INTB_VERTB, Zoom_vbint);
    131c:	7005           	moveq #5,d0
    131e:	2f40 0008      	move.l d0,8(sp)
    1322:	2f79 004d 2c54 	move.l 4d2c54 <Zoom_vbint>,4(sp)
    1328:	0004 
    132a:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    1330:	2c40           	movea.l d0,a6
    1332:	202f 0008      	move.l 8(sp),d0
    1336:	226f 0004      	movea.l 4(sp),a1
    133a:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    133e:	2f3c 0000 df20 	move.l #57120,-(sp)
    1344:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    1348:	4eba ed96      	jsr e0 <FreeDisplay>(pc)
    134c:	508f           	addq.l #8,sp
}
    134e:	2c5f           	movea.l (sp)+,a6
    1350:	508f           	addq.l #8,sp
    1352:	4e75           	rts

00001354 <Zoom_PrepareDisplay>:
  
int Zoom_PrepareDisplay() {
    1354:	4fef ffe8      	lea -24(sp),sp
    1358:	2f0e           	move.l a6,-(sp)
  ViewBuffer = AllocVec(268*42*5, MEMF_CHIP);  
    135a:	2f7c 0000 dbd8 	move.l #56280,24(sp)
    1360:	0018 
    1362:	7002           	moveq #2,d0
    1364:	2f40 0014      	move.l d0,20(sp)
    1368:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    136e:	2c40           	movea.l d0,a6
    1370:	202f 0018      	move.l 24(sp),d0
    1374:	222f 0014      	move.l 20(sp),d1
    1378:	4eae fd54      	jsr -684(a6)
    137c:	2f40 0010      	move.l d0,16(sp)
    1380:	202f 0010      	move.l 16(sp),d0
    1384:	23c0 004d 2c10 	move.l d0,4d2c10 <ViewBuffer>
  DrawBuffer = AllocVec(268*42*5, MEMF_CHIP);
    138a:	2f7c 0000 dbd8 	move.l #56280,12(sp)
    1390:	000c 
    1392:	7002           	moveq #2,d0
    1394:	2f40 0008      	move.l d0,8(sp)
    1398:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    139e:	2c40           	movea.l d0,a6
    13a0:	202f 000c      	move.l 12(sp),d0
    13a4:	222f 0008      	move.l 8(sp),d1
    13a8:	4eae fd54      	jsr -684(a6)
    13ac:	2f40 0004      	move.l d0,4(sp)
    13b0:	202f 0004      	move.l 4(sp),d0
    13b4:	23c0 004d 2c0c 	move.l d0,4d2c0c <DrawBuffer>
  Utils_CopyMem( rawzoom, ViewBuffer, 14070);
    13ba:	2239 004d 2c10 	move.l 4d2c10 <ViewBuffer>,d1
    13c0:	2039 0000 b8a0 	move.l b8a0 <rawzoom>,d0
    13c6:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x284>
    13ca:	2f01           	move.l d1,-(sp)
    13cc:	2f00           	move.l d0,-(sp)
    13ce:	4eba ee0e      	jsr 1de <Utils_CopyMem>(pc)
    13d2:	4fef 000c      	lea 12(sp),sp
  Utils_CopyMem( rawzoom, DrawBuffer, 14070);
    13d6:	2239 004d 2c0c 	move.l 4d2c0c <DrawBuffer>,d1
    13dc:	2039 0000 b8a0 	move.l b8a0 <rawzoom>,d0
    13e2:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x284>
    13e6:	2f01           	move.l d1,-(sp)
    13e8:	2f00           	move.l d0,-(sp)
    13ea:	4eba edf2      	jsr 1de <Utils_CopyMem>(pc)
    13ee:	4fef 000c      	lea 12(sp),sp
  //Zoom_SwapBuffers( 0);
  Copperlist1 = ClbuildZoom( );
    13f2:	4eba 0080      	jsr 1474 <ClbuildZoom>(pc)
    13f6:	23c0 004d 2c04 	move.l d0,4d2c04 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    13fc:	4eba 0076      	jsr 1474 <ClbuildZoom>(pc)
    1400:	23c0 004d 2c08 	move.l d0,4d2c08 <Copperlist2>
  if(Bitplane2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;*/
  DrawCopper = Copperlist1;
    1406:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    140c:	23c0 004d 2c14 	move.l d0,4d2c14 <DrawCopper>
  ViewCopper = Copperlist2;
    1412:	2039 004d 2c08 	move.l 4d2c08 <Copperlist2>,d0
    1418:	23c0 004d 2c18 	move.l d0,4d2c18 <ViewCopper>
  return 0;
    141e:	7000           	moveq #0,d0
}
    1420:	2c5f           	movea.l (sp)+,a6
    1422:	4fef 0018      	lea 24(sp),sp
    1426:	4e75           	rts

00001428 <Zoom_Init>:

void Zoom_Init() {
    1428:	4fef fff4      	lea -12(sp),sp
    142c:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    142e:	7004           	moveq #4,d0
    1430:	2f40 000c      	move.l d0,12(sp)
    1434:	7002           	moveq #2,d0
    1436:	2f40 0008      	move.l d0,8(sp)
    143a:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    1440:	2c40           	movea.l d0,a6
    1442:	202f 000c      	move.l 12(sp),d0
    1446:	222f 0008      	move.l 8(sp),d1
    144a:	4eae ff3a      	jsr -198(a6)
    144e:	2f40 0004      	move.l d0,4(sp)
    1452:	202f 0004      	move.l 4(sp),d0
    1456:	23c0 004d 2c4a 	move.l d0,4d2c4a <Zoom_ZoomBlitMask>
  ZoomHorizontal = 16;
    145c:	33fc 0010 004d 	move.w #16,4d2c6e <ZoomHorizontal>
    1462:	2c6e 
  Zoom_LevelOf102Zoom = 15;
    1464:	33fc 000f 004d 	move.w #15,4d2c6a <Zoom_LevelOf102Zoom>
    146a:	2c6a 
}
    146c:	2c5f           	movea.l (sp)+,a6
    146e:	4fef 000c      	lea 12(sp),sp
    1472:	4e75           	rts

00001474 <ClbuildZoom>:


ULONG * ClbuildZoom() {
    1474:	4fef ffac      	lea -84(sp),sp
    1478:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    147c:	2f7c 0000 031c 	move.l #796,68(sp)
    1482:	0044 
    1484:	7002           	moveq #2,d0
    1486:	2f40 0040      	move.l d0,64(sp)
    148a:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    1490:	2c40           	movea.l d0,a6
    1492:	202f 0044      	move.l 68(sp),d0
    1496:	222f 0040      	move.l 64(sp),d1
    149a:	4eae ff3a      	jsr -198(a6)
    149e:	2f40 003c      	move.l d0,60(sp)
    14a2:	202f 003c      	move.l 60(sp),d0
    14a6:	2f40 0038      	move.l d0,56(sp)
  
  if( retval == 0) {
    14aa:	6658           	bne.s 1504 <ClbuildZoom+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    14ac:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    14b2:	2c40           	movea.l d0,a6
    14b4:	4eae ffc4      	jsr -60(a6)
    14b8:	2f40 0034      	move.l d0,52(sp)
    14bc:	202f 0034      	move.l 52(sp),d0
    14c0:	2f40 0030      	move.l d0,48(sp)
    14c4:	2f7c 0000 7cf3 	move.l #31987,44(sp)
    14ca:	002c 
    14cc:	7228           	moveq #40,d1
    14ce:	2f41 0028      	move.l d1,40(sp)
    14d2:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    14d8:	2c40           	movea.l d0,a6
    14da:	222f 0030      	move.l 48(sp),d1
    14de:	242f 002c      	move.l 44(sp),d2
    14e2:	262f 0028      	move.l 40(sp),d3
    14e6:	4eae ffd0      	jsr -48(a6)
    14ea:	2f40 0024      	move.l d0,36(sp)
    Exit(1);
    14ee:	7401           	moveq #1,d2
    14f0:	2f42 0020      	move.l d2,32(sp)
    14f4:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    14fa:	2c40           	movea.l d0,a6
    14fc:	222f 0020      	move.l 32(sp),d1
    1500:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    1504:	2f6f 0038 005c 	move.l 56(sp),92(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    150a:	2f7c 0000 a68c 	move.l #42636,88(sp)
    1510:	0058 
  for(int i=0; i<16;i++)
    1512:	42af 0054      	clr.l 84(sp)
    1516:	6024           	bra.s 153c <ClbuildZoom+0xc8>
    *cl++ = *clpartinstruction++;
    1518:	222f 0058      	move.l 88(sp),d1
    151c:	2001           	move.l d1,d0
    151e:	5880           	addq.l #4,d0
    1520:	2f40 0058      	move.l d0,88(sp)
    1524:	202f 005c      	move.l 92(sp),d0
    1528:	2400           	move.l d0,d2
    152a:	5882           	addq.l #4,d2
    152c:	2f42 005c      	move.l d2,92(sp)
    1530:	2041           	movea.l d1,a0
    1532:	2210           	move.l (a0),d1
    1534:	2040           	movea.l d0,a0
    1536:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    1538:	52af 0054      	addq.l #1,84(sp)
    153c:	700f           	moveq #15,d0
    153e:	b0af 0054      	cmp.l 84(sp),d0
    1542:	6cd4           	bge.s 1518 <ClbuildZoom+0xa4>
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
    1544:	2f7c 0000 a6cc 	move.l #42700,88(sp)
    154a:	0058 
  for(int i=0; i<12;i++)
    154c:	42af 0050      	clr.l 80(sp)
    1550:	6024           	bra.s 1576 <ClbuildZoom+0x102>
    *cl++ = *clpartinstruction++;
    1552:	222f 0058      	move.l 88(sp),d1
    1556:	2401           	move.l d1,d2
    1558:	5882           	addq.l #4,d2
    155a:	2f42 0058      	move.l d2,88(sp)
    155e:	202f 005c      	move.l 92(sp),d0
    1562:	2400           	move.l d0,d2
    1564:	5882           	addq.l #4,d2
    1566:	2f42 005c      	move.l d2,92(sp)
    156a:	2041           	movea.l d1,a0
    156c:	2210           	move.l (a0),d1
    156e:	2040           	movea.l d0,a0
    1570:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    1572:	52af 0050      	addq.l #1,80(sp)
    1576:	700b           	moveq #11,d0
    1578:	b0af 0050      	cmp.l 80(sp),d0
    157c:	6cd4           	bge.s 1552 <ClbuildZoom+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    157e:	202f 005c      	move.l 92(sp),d0
    1582:	2200           	move.l d0,d1
    1584:	5881           	addq.l #4,d1
    1586:	2f41 005c      	move.l d1,92(sp)
    158a:	2040           	movea.l d0,a0
    158c:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    1592:	202f 005c      	move.l 92(sp),d0
    1596:	2200           	move.l d0,d1
    1598:	5881           	addq.l #4,d1
    159a:	2f41 005c      	move.l d1,92(sp)
    159e:	2040           	movea.l d0,a0
    15a0:	20bc 00e2 0000 	move.l #14811136,(a0)
  *cl++ = 0x00e40000;
    15a6:	202f 005c      	move.l 92(sp),d0
    15aa:	2200           	move.l d0,d1
    15ac:	5881           	addq.l #4,d1
    15ae:	2f41 005c      	move.l d1,92(sp)
    15b2:	2040           	movea.l d0,a0
    15b4:	20bc 00e4 0000 	move.l #14942208,(a0)
  *cl++ = 0x00e60000;
    15ba:	202f 005c      	move.l 92(sp),d0
    15be:	2200           	move.l d0,d1
    15c0:	5881           	addq.l #4,d1
    15c2:	2f41 005c      	move.l d1,92(sp)
    15c6:	2040           	movea.l d0,a0
    15c8:	20bc 00e6 0000 	move.l #15073280,(a0)
  *cl++ = 0x00e80000;
    15ce:	202f 005c      	move.l 92(sp),d0
    15d2:	2200           	move.l d0,d1
    15d4:	5881           	addq.l #4,d1
    15d6:	2f41 005c      	move.l d1,92(sp)
    15da:	2040           	movea.l d0,a0
    15dc:	20bc 00e8 0000 	move.l #15204352,(a0)
  *cl++ = 0x00ea0000;
    15e2:	202f 005c      	move.l 92(sp),d0
    15e6:	2200           	move.l d0,d1
    15e8:	5881           	addq.l #4,d1
    15ea:	2f41 005c      	move.l d1,92(sp)
    15ee:	2040           	movea.l d0,a0
    15f0:	20bc 00ea 0000 	move.l #15335424,(a0)
  *cl++ = 0x00ec0000;
    15f6:	202f 005c      	move.l 92(sp),d0
    15fa:	2200           	move.l d0,d1
    15fc:	5881           	addq.l #4,d1
    15fe:	2f41 005c      	move.l d1,92(sp)
    1602:	2040           	movea.l d0,a0
    1604:	20bc 00ec 0000 	move.l #15466496,(a0)
  *cl++ = 0x00ee0000;
    160a:	202f 005c      	move.l 92(sp),d0
    160e:	2200           	move.l d0,d1
    1610:	5881           	addq.l #4,d1
    1612:	2f41 005c      	move.l d1,92(sp)
    1616:	2040           	movea.l d0,a0
    1618:	20bc 00ee 0000 	move.l #15597568,(a0)
  *cl++ = 0x00f00000;
    161e:	202f 005c      	move.l 92(sp),d0
    1622:	2200           	move.l d0,d1
    1624:	5881           	addq.l #4,d1
    1626:	2f41 005c      	move.l d1,92(sp)
    162a:	2040           	movea.l d0,a0
    162c:	20bc 00f0 0000 	move.l #15728640,(a0)
  *cl++ = 0x00f20000;
    1632:	202f 005c      	move.l 92(sp),d0
    1636:	2200           	move.l d0,d1
    1638:	5881           	addq.l #4,d1
    163a:	2f41 005c      	move.l d1,92(sp)
    163e:	2040           	movea.l d0,a0
    1640:	20bc 00f2 0000 	move.l #15859712,(a0)

  clpartinstruction = ClColor;
    1646:	2f7c 0000 a60c 	move.l #42508,88(sp)
    164c:	0058 
  for(int i=0; i<32;i++)
    164e:	42af 004c      	clr.l 76(sp)
    1652:	6024           	bra.s 1678 <ClbuildZoom+0x204>
    *cl++ = *clpartinstruction++;
    1654:	222f 0058      	move.l 88(sp),d1
    1658:	2001           	move.l d1,d0
    165a:	5880           	addq.l #4,d0
    165c:	2f40 0058      	move.l d0,88(sp)
    1660:	202f 005c      	move.l 92(sp),d0
    1664:	2400           	move.l d0,d2
    1666:	5882           	addq.l #4,d2
    1668:	2f42 005c      	move.l d2,92(sp)
    166c:	2041           	movea.l d1,a0
    166e:	2210           	move.l (a0),d1
    1670:	2040           	movea.l d0,a0
    1672:	2081           	move.l d1,(a0)
  for(int i=0; i<32;i++)
    1674:	52af 004c      	addq.l #1,76(sp)
    1678:	701f           	moveq #31,d0
    167a:	b0af 004c      	cmp.l 76(sp),d0
    167e:	6cd4           	bge.s 1654 <ClbuildZoom+0x1e0>
  
  ULONG cop2 = cl+3;
    1680:	700c           	moveq #12,d0
    1682:	d0af 005c      	add.l 92(sp),d0
    1686:	2f40 001c      	move.l d0,28(sp)
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    168a:	202f 001c      	move.l 28(sp),d0
    168e:	4240           	clr.w d0
    1690:	4840           	swap d0
    1692:	2200           	move.l d0,d1
    1694:	0681 0084 0000 	addi.l #8650752,d1
    169a:	2f41 0018      	move.l d1,24(sp)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    169e:	202f 001c      	move.l 28(sp),d0
    16a2:	0280 0000 ffff 	andi.l #65535,d0
    16a8:	2400           	move.l d0,d2
    16aa:	0682 0086 0000 	addi.l #8781824,d2
    16b0:	2f42 0014      	move.l d2,20(sp)
  //clpartinstruction = Cl102ZoomInit;
  *cl++ = cop2lch;
    16b4:	202f 005c      	move.l 92(sp),d0
    16b8:	2200           	move.l d0,d1
    16ba:	5881           	addq.l #4,d1
    16bc:	2f41 005c      	move.l d1,92(sp)
    16c0:	2040           	movea.l d0,a0
    16c2:	20af 0018      	move.l 24(sp),(a0)
  *cl++ = cop2lcl;
    16c6:	202f 005c      	move.l 92(sp),d0
    16ca:	2200           	move.l d0,d1
    16cc:	5881           	addq.l #4,d1
    16ce:	2f41 005c      	move.l d1,92(sp)
    16d2:	2040           	movea.l d0,a0
    16d4:	20af 0014      	move.l 20(sp),(a0)
  *cl++ = 0x2c01ff00;
    16d8:	202f 005c      	move.l 92(sp),d0
    16dc:	2200           	move.l d0,d1
    16de:	5881           	addq.l #4,d1
    16e0:	2f41 005c      	move.l d1,92(sp)
    16e4:	2040           	movea.l d0,a0
    16e6:	20bc 2c01 ff00 	move.l #738328320,(a0)

  ULONG cop2br1 = cop2 + ( (30)<<2);
    16ec:	7078           	moveq #120,d0
    16ee:	d0af 001c      	add.l 28(sp),d0
    16f2:	2f40 0010      	move.l d0,16(sp)
  ULONG cop2br2 = cop2 + ( (86)<<2);
    16f6:	222f 001c      	move.l 28(sp),d1
    16fa:	0681 0000 0158 	addi.l #344,d1
    1700:	2f41 000c      	move.l d1,12(sp)
  clpartinstruction = Cl102ZoomRepeat;
    1704:	2f7c 0000 a708 	move.l #42760,88(sp)
    170a:	0058 
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    170c:	202f 0010      	move.l 16(sp),d0
    1710:	4240           	clr.w d0
    1712:	4840           	swap d0
    1714:	307c 0070      	movea.w #112,a0
    1718:	d1ef 0058      	adda.l 88(sp),a0
    171c:	0680 0084 0000 	addi.l #8650752,d0
    1722:	2080           	move.l d0,(a0)
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    1724:	202f 0010      	move.l 16(sp),d0
    1728:	0280 0000 ffff 	andi.l #65535,d0
    172e:	307c 0074      	movea.w #116,a0
    1732:	d1ef 0058      	adda.l 88(sp),a0
    1736:	0680 0086 0000 	addi.l #8781824,d0
    173c:	2080           	move.l d0,(a0)
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    173e:	202f 000c      	move.l 12(sp),d0
    1742:	4240           	clr.w d0
    1744:	4840           	swap d0
    1746:	206f 0058      	movea.l 88(sp),a0
    174a:	41e8 0150      	lea 336(a0),a0
    174e:	0680 0084 0000 	addi.l #8650752,d0
    1754:	2080           	move.l d0,(a0)
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    1756:	202f 000c      	move.l 12(sp),d0
    175a:	0280 0000 ffff 	andi.l #65535,d0
    1760:	206f 0058      	movea.l 88(sp),a0
    1764:	41e8 0154      	lea 340(a0),a0
    1768:	0680 0086 0000 	addi.l #8781824,d0
    176e:	2080           	move.l d0,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    1770:	42af 0048      	clr.l 72(sp)
    1774:	6024           	bra.s 179a <ClbuildZoom+0x326>
    *cl++ = *clpartinstruction++;
    1776:	222f 0058      	move.l 88(sp),d1
    177a:	2401           	move.l d1,d2
    177c:	5882           	addq.l #4,d2
    177e:	2f42 0058      	move.l d2,88(sp)
    1782:	202f 005c      	move.l 92(sp),d0
    1786:	2400           	move.l d0,d2
    1788:	5882           	addq.l #4,d2
    178a:	2f42 005c      	move.l d2,92(sp)
    178e:	2041           	movea.l d1,a0
    1790:	2210           	move.l (a0),d1
    1792:	2040           	movea.l d0,a0
    1794:	2081           	move.l d1,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    1796:	52af 0048      	addq.l #1,72(sp)
    179a:	7071           	moveq #113,d0
    179c:	b0af 0048      	cmp.l 72(sp),d0
    17a0:	6cd4           	bge.s 1776 <ClbuildZoom+0x302>

   *cl++ = 0xfffffffe;
    17a2:	202f 005c      	move.l 92(sp),d0
    17a6:	2200           	move.l d0,d1
    17a8:	5881           	addq.l #4,d1
    17aa:	2f41 005c      	move.l d1,92(sp)
    17ae:	74fe           	moveq #-2,d2
    17b0:	2040           	movea.l d0,a0
    17b2:	2082           	move.l d2,(a0)

  return retval;
    17b4:	202f 0038      	move.l 56(sp),d0
}
    17b8:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    17bc:	4fef 0054      	lea 84(sp),sp
    17c0:	4e75           	rts

000017c2 <PrepareDisplayZoom>:

 int PrepareDisplayZoom() {
    17c2:	4fef ffb8      	lea -72(sp),sp
    17c6:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildZoom();
    17ca:	4eba fca8      	jsr 1474 <ClbuildZoom>(pc)
    17ce:	23c0 004d 2c04 	move.l d0,4d2c04 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    17d4:	4eba fc9e      	jsr 1474 <ClbuildZoom>(pc)
    17d8:	23c0 004d 2c08 	move.l d0,4d2c08 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    17de:	2f7c 0000 df20 	move.l #57120,80(sp)
    17e4:	0050 
    17e6:	7002           	moveq #2,d0
    17e8:	2f40 004c      	move.l d0,76(sp)
    17ec:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    17f2:	2c40           	movea.l d0,a6
    17f4:	202f 0050      	move.l 80(sp),d0
    17f8:	222f 004c      	move.l 76(sp),d1
    17fc:	4eae ff3a      	jsr -198(a6)
    1800:	2f40 0048      	move.l d0,72(sp)
    1804:	202f 0048      	move.l 72(sp),d0
    1808:	23c0 004d 2bfc 	move.l d0,4d2bfc <Bitplane1>
  if(Bitplane1 == 0) {
    180e:	2039 004d 2bfc 	move.l 4d2bfc <Bitplane1>,d0
    1814:	6658           	bne.s 186e <PrepareDisplayZoom+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1816:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    181c:	2c40           	movea.l d0,a6
    181e:	4eae ffc4      	jsr -60(a6)
    1822:	2f40 0044      	move.l d0,68(sp)
    1826:	202f 0044      	move.l 68(sp),d0
    182a:	2f40 0040      	move.l d0,64(sp)
    182e:	2f7c 0000 7ca5 	move.l #31909,60(sp)
    1834:	003c 
    1836:	7026           	moveq #38,d0
    1838:	2f40 0038      	move.l d0,56(sp)
    183c:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    1842:	2c40           	movea.l d0,a6
    1844:	222f 0040      	move.l 64(sp),d1
    1848:	242f 003c      	move.l 60(sp),d2
    184c:	262f 0038      	move.l 56(sp),d3
    1850:	4eae ffd0      	jsr -48(a6)
    1854:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    1858:	7001           	moveq #1,d0
    185a:	2f40 0030      	move.l d0,48(sp)
    185e:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    1864:	2c40           	movea.l d0,a6
    1866:	222f 0030      	move.l 48(sp),d1
    186a:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    186e:	2039 004d 2bfc 	move.l 4d2bfc <Bitplane1>,d0
    1874:	23c0 004d 2c0c 	move.l d0,4d2c0c <DrawBuffer>
  DrawCopper = Copperlist1;
    187a:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    1880:	23c0 004d 2c14 	move.l d0,4d2c14 <DrawCopper>
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1886:	2f7c 0000 df20 	move.l #57120,44(sp)
    188c:	002c 
    188e:	7002           	moveq #2,d0
    1890:	2f40 0028      	move.l d0,40(sp)
    1894:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    189a:	2c40           	movea.l d0,a6
    189c:	202f 002c      	move.l 44(sp),d0
    18a0:	222f 0028      	move.l 40(sp),d1
    18a4:	4eae ff3a      	jsr -198(a6)
    18a8:	2f40 0024      	move.l d0,36(sp)
    18ac:	202f 0024      	move.l 36(sp),d0
    18b0:	23c0 004d 2c00 	move.l d0,4d2c00 <Bitplane2>
  if(Bitplane2 == 0) {
    18b6:	2039 004d 2c00 	move.l 4d2c00 <Bitplane2>,d0
    18bc:	6658           	bne.s 1916 <PrepareDisplayZoom+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    18be:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    18c4:	2c40           	movea.l d0,a6
    18c6:	4eae ffc4      	jsr -60(a6)
    18ca:	2f40 0020      	move.l d0,32(sp)
    18ce:	202f 0020      	move.l 32(sp),d0
    18d2:	2f40 001c      	move.l d0,28(sp)
    18d6:	2f7c 0000 7ccc 	move.l #31948,24(sp)
    18dc:	0018 
    18de:	7026           	moveq #38,d0
    18e0:	2f40 0014      	move.l d0,20(sp)
    18e4:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    18ea:	2c40           	movea.l d0,a6
    18ec:	222f 001c      	move.l 28(sp),d1
    18f0:	242f 0018      	move.l 24(sp),d2
    18f4:	262f 0014      	move.l 20(sp),d3
    18f8:	4eae ffd0      	jsr -48(a6)
    18fc:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    1900:	7001           	moveq #1,d0
    1902:	2f40 000c      	move.l d0,12(sp)
    1906:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    190c:	2c40           	movea.l d0,a6
    190e:	222f 000c      	move.l 12(sp),d1
    1912:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    1916:	2039 004d 2c00 	move.l 4d2c00 <Bitplane2>,d0
    191c:	23c0 004d 2c10 	move.l d0,4d2c10 <ViewBuffer>
  ViewCopper = Copperlist2; 
    1922:	2039 004d 2c08 	move.l 4d2c08 <Copperlist2>,d0
    1928:	23c0 004d 2c18 	move.l d0,4d2c18 <ViewCopper>
  return 0;
    192e:	7000           	moveq #0,d0
}
    1930:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1934:	4fef 0048      	lea 72(sp),sp
    1938:	4e75           	rts

0000193a <Init_Blit>:

void Init_Blit() {
  hw->bltafwm = 0xffff;
    193a:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    1940:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1946:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    194c:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1952:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    1958:	317c 0026 0064 	move.w #38,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    195e:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    1964:	317c 0026 0062 	move.w #38,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    196a:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    1970:	317c 0026 0066 	move.w #38,102(a0)
}
    1976:	4e75           	rts

00001978 <Init_Blit2>:


void Init_Blit2() {
  hw->bltafwm = 0xffff;
    1978:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    197e:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1984:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    198a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = 36;
    1990:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    1996:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = 76;
    199c:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    19a2:	317c 004c 0062 	move.w #76,98(a0)
  hw->bltdmod = ZMLINESIZE2 - 4;
    19a8:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    19ae:	317c 0028 0066 	move.w #40,102(a0)
}
    19b4:	4e75           	rts

000019b6 <Init_ZoomBlit>:

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
    19b6:	4fef fff4      	lea -12(sp),sp
    19ba:	206f 0010      	movea.l 16(sp),a0
    19be:	222f 0014      	move.l 20(sp),d1
    19c2:	202f 0018      	move.l 24(sp),d0
    19c6:	3048           	movea.w a0,a0
    19c8:	3f48 0004      	move.w a0,4(sp)
    19cc:	3201           	move.w d1,d1
    19ce:	3f41 0002      	move.w d1,2(sp)
    19d2:	3000           	move.w d0,d0
    19d4:	3e80           	move.w d0,(sp)
  ZoomBlit_Increment4SrcA = 0;
    19d6:	4279 004d 2c52 	clr.w 4d2c52 <ZoomBlit_Increment4SrcA>

  UWORD colnr = nextzoom - startofword - 1;                                                                          
    19dc:	302f 0002      	move.w 2(sp),d0
    19e0:	906f 0004      	sub.w 4(sp),d0
    19e4:	3200           	move.w d0,d1
    19e6:	5341           	subq.w #1,d1
    19e8:	3f41 0008      	move.w d1,8(sp)
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
    19ec:	3017           	move.w (sp),d0
    19ee:	720c           	moveq #12,d1
    19f0:	e368           	lsl.w d1,d0
    19f2:	3f40 0006      	move.w d0,6(sp)
  UWORD shifta;
  if( shiftright == 0) {
    19f6:	4a57           	tst.w (sp)
    19f8:	6610           	bne.s 1a0a <Init_ZoomBlit+0x54>
    ZoomBlit_Increment4SrcA = 1;
    19fa:	33fc 0001 004d 	move.w #1,4d2c52 <ZoomBlit_Increment4SrcA>
    1a00:	2c52 
    shifta = 15 << 12;
    1a02:	3f7c f000 000a 	move.w #-4096,10(sp)
    1a08:	600c           	bra.s 1a16 <Init_ZoomBlit+0x60>
  } else {
    shifta = (shiftright - 1) << 12;
    1a0a:	3017           	move.w (sp),d0
    1a0c:	5340           	subq.w #1,d0
    1a0e:	720c           	moveq #12,d1
    1a10:	e368           	lsl.w d1,d0
    1a12:	3f40 000a      	move.w d0,10(sp)
  }
  WaitBlt(); 
    1a16:	4eba e69c      	jsr b4 <WaitBlt>(pc)
  hw->bltcon1 = shiftb; 
    1a1a:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    1a20:	316f 0006 0042 	move.w 6(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1a26:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    1a2c:	302f 000a      	move.w 10(sp),d0
    1a30:	0640 0de4      	addi.w #3556,d0
    1a34:	3140 0040      	move.w d0,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1a38:	7000           	moveq #0,d0
    1a3a:	302f 0008      	move.w 8(sp),d0
    1a3e:	7210           	moveq #16,d1
    1a40:	9280           	sub.l d0,d1
    1a42:	7000           	moveq #0,d0
    1a44:	4640           	not.w d0
    1a46:	e3a8           	lsl.l d1,d0
    1a48:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    1a4e:	2000           	move.l d0,d0
    1a50:	3140 0070      	move.w d0,112(a0)
}
    1a54:	4fef 000c      	lea 12(sp),sp
    1a58:	4e75           	rts

00001a5a <Init_Copy>:

void Init_Copy( WORD shift) {
    1a5a:	598f           	subq.l #4,sp
    1a5c:	202f 0008      	move.l 8(sp),d0
    1a60:	3000           	move.w d0,d0
    1a62:	3e80           	move.w d0,(sp)
  UWORD shiftright = shift << 12;
    1a64:	3017           	move.w (sp),d0
    1a66:	720c           	moveq #12,d1
    1a68:	e368           	lsl.w d1,d0
    1a6a:	3f40 0002      	move.w d0,2(sp)
  WaitBlt();
    1a6e:	4eba e644      	jsr b4 <WaitBlt>(pc)
  hw->bltcon0 = 0x9f0 + shiftright;
    1a72:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    1a78:	302f 0002      	move.w 2(sp),d0
    1a7c:	0640 09f0      	addi.w #2544,d0
    1a80:	3140 0040      	move.w d0,64(a0)
  hw->bltcon1 = 0;
    1a84:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    1a8a:	317c 0000 0042 	move.w #0,66(a0)
}
    1a90:	588f           	addq.l #4,sp
    1a92:	4e75           	rts

00001a94 <Zoom_ZoomIntoPicture>:

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    1a94:	4fef ffcc      	lea -52(sp),sp
    1a98:	222f 0040      	move.l 64(sp),d1
    1a9c:	202f 0044      	move.l 68(sp),d0
    1aa0:	3201           	move.w d1,d1
    1aa2:	3f41 0002      	move.w d1,2(sp)
    1aa6:	3000           	move.w d0,d0
    1aa8:	3e80           	move.w d0,(sp)
  
  WaitBlt();  
    1aaa:	4eba e608      	jsr b4 <WaitBlt>(pc)
  Init_Blit();
    1aae:	4eba fe8a      	jsr 193a <Init_Blit>(pc)
  WORD shiftright = 9;
    1ab2:	3f7c 0009 0032 	move.w #9,50(sp)
  UWORD shifthoriz = 7;
    1ab8:	3f7c 0007 0030 	move.w #7,48(sp)
  UWORD startofword = 21*16;
    1abe:	3f7c 0150 002e 	move.w #336,46(sp)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1ac4:	322f 0002      	move.w 2(sp),d1
    1ac8:	3001           	move.w d1,d0
    1aca:	d040           	add.w d0,d0
    1acc:	d040           	add.w d0,d0
    1ace:	d041           	add.w d1,d0
    1ad0:	d040           	add.w d0,d0
    1ad2:	0640 014c      	addi.w #332,d0
    1ad6:	3f40 002c      	move.w d0,44(sp)
    1ada:	601a           	bra.s 1af6 <Zoom_ZoomIntoPicture+0x62>
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    1adc:	302f 002c      	move.w 44(sp),d0
    1ae0:	906f 0002      	sub.w 2(sp),d0
    1ae4:	0640 ffed      	addi.w #-19,d0
    1ae8:	3f40 002c      	move.w d0,44(sp)
    shiftright--;
    1aec:	302f 0032      	move.w 50(sp),d0
    1af0:	5340           	subq.w #1,d0
    1af2:	3f40 0032      	move.w d0,50(sp)
  while( nextzoom > 22 * 16) {
    1af6:	0c6f 0160 002c 	cmpi.w #352,44(sp)
    1afc:	6ede           	bgt.s 1adc <Zoom_ZoomIntoPicture+0x48>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
    1afe:	426f 002a      	clr.w 42(sp)
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    1b02:	322f 0002      	move.w 2(sp),d1
    1b06:	3001           	move.w d1,d0
    1b08:	d040           	add.w d0,d0
    1b0a:	d040           	add.w d0,d0
    1b0c:	d041           	add.w d1,d0
    1b0e:	4440           	neg.w d0
    1b10:	0640 0012      	addi.w #18,d0
    1b14:	3f40 0028      	move.w d0,40(sp)
    1b18:	601c           	bra.s 1b36 <Zoom_ZoomIntoPicture+0xa2>
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    1b1a:	302f 0028      	move.w 40(sp),d0
    1b1e:	d06f 0002      	add.w 2(sp),d0
    1b22:	0640 0013      	addi.w #19,d0
    1b26:	3f40 0028      	move.w d0,40(sp)
      shifthoriz--;
    1b2a:	302f 0030      	move.w 48(sp),d0
    1b2e:	3200           	move.w d0,d1
    1b30:	5341           	subq.w #1,d1
    1b32:	3f41 0030      	move.w d1,48(sp)
  while( ZoomHorizontalStart < 0) {
    1b36:	4a6f 0028      	tst.w 40(sp)
    1b3a:	6dde           	blt.s 1b1a <Zoom_ZoomIntoPicture+0x86>
  } 

  for(int i=0;i<22;i++) {
    1b3c:	42af 0024      	clr.l 36(sp)
    1b40:	6000 02ca      	bra.w 1e0c <Zoom_ZoomIntoPicture+0x378>

    ZoomHorizontal = ZoomHorizontalStart;
    1b44:	33ef 0028 004d 	move.w 40(sp),4d2c6e <ZoomHorizontal>
    1b4a:	2c6e 

    WORD linesleft = 272;
    1b4c:	3f7c 0110 0022 	move.w #272,34(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1b52:	7000           	moveq #0,d0
    1b54:	302f 0030      	move.w 48(sp),d0
    1b58:	7200           	moveq #0,d1
    1b5a:	3217           	move.w (sp),d1
    1b5c:	2f01           	move.l d1,-(sp)
    1b5e:	2f00           	move.l d0,-(sp)
    1b60:	4eb9 0000 710c 	jsr 710c <__mulsi3>
    1b66:	508f           	addq.l #8,sp
    1b68:	2200           	move.l d0,d1
    1b6a:	2001           	move.l d1,d0
    1b6c:	d080           	add.l d0,d0
    1b6e:	d081           	add.l d1,d0
    1b70:	2200           	move.l d0,d1
    1b72:	e789           	lsl.l #3,d1
    1b74:	9280           	sub.l d0,d1
    1b76:	202f 0024      	move.l 36(sp),d0
    1b7a:	9280           	sub.l d0,d1
    1b7c:	2001           	move.l d1,d0
    1b7e:	0680 8000 0013 	addi.l #-2147483629,d0
    1b84:	d080           	add.l d0,d0
    1b86:	222f 0038      	move.l 56(sp),d1
    1b8a:	d280           	add.l d0,d1
    1b8c:	2f41 001e      	move.l d1,30(sp)
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1b90:	202f 0024      	move.l 36(sp),d0
    1b94:	7213           	moveq #19,d1
    1b96:	9280           	sub.l d0,d1
    1b98:	2001           	move.l d1,d0
    1b9a:	d081           	add.l d1,d0
    1b9c:	222f 003c      	move.l 60(sp),d1
    1ba0:	d280           	add.l d0,d1
    1ba2:	2f41 001a      	move.l d1,26(sp)
    
    UWORD onestep = ZMLINESIZE/2*planes;
    1ba6:	3017           	move.w (sp),d0
    1ba8:	c1fc 0015      	muls.w #21,d0
    1bac:	3f40 0018      	move.w d0,24(sp)
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1bb0:	7000           	moveq #0,d0
    1bb2:	302f 002e      	move.w 46(sp),d0
    1bb6:	306f 002c      	movea.w 44(sp),a0
    1bba:	b1c0           	cmpa.l d0,a0
    1bbc:	6e00 0106      	bgt.w 1cc4 <Zoom_ZoomIntoPicture+0x230>
      Init_Copy( shiftright);
    1bc0:	306f 0032      	movea.w 50(sp),a0
    1bc4:	2f08           	move.l a0,-(sp)
    1bc6:	4eba fe92      	jsr 1a5a <Init_Copy>(pc)
    1bca:	588f           	addq.l #4,sp
    1bcc:	6000 00ea      	bra.w 1cb8 <Zoom_ZoomIntoPicture+0x224>
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1bd0:	3039 004d 2c6e 	move.w 4d2c6e <ZoomHorizontal>,d0
    1bd6:	b06f 0022      	cmp.w 34(sp),d0
    1bda:	6c12           	bge.s 1bee <Zoom_ZoomIntoPicture+0x15a>
          linesleft -= ZoomHorizontal;
    1bdc:	322f 0022      	move.w 34(sp),d1
    1be0:	3039 004d 2c6e 	move.w 4d2c6e <ZoomHorizontal>,d0
    1be6:	9240           	sub.w d0,d1
    1be8:	3f41 0022      	move.w d1,34(sp)
    1bec:	600c           	bra.s 1bfa <Zoom_ZoomIntoPicture+0x166>
        } else {
          ZoomHorizontal = linesleft;
    1bee:	33ef 0022 004d 	move.w 34(sp),4d2c6e <ZoomHorizontal>
    1bf4:	2c6e 
          linesleft = 0;
    1bf6:	426f 0022      	clr.w 34(sp)
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
    1bfa:	3039 004d 2c6e 	move.w 4d2c6e <ZoomHorizontal>,d0
    1c00:	322f 0018      	move.w 24(sp),d1
    1c04:	c3c0           	muls.w d0,d1
    1c06:	3f41 000c      	move.w d1,12(sp)
        //Add aditional line
        if( linesleft>0) {
    1c0a:	4a6f 0022      	tst.w 34(sp)
    1c0e:	6f4c           	ble.s 1c5c <Zoom_ZoomIntoPicture+0x1c8>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1c10:	7200           	moveq #0,d1
    1c12:	322f 000c      	move.w 12(sp),d1
    1c16:	7000           	moveq #0,d0
    1c18:	302f 002a      	move.w 42(sp),d0
    1c1c:	d081           	add.l d1,d0
    1c1e:	d080           	add.l d0,d0
    1c20:	222f 001e      	move.l 30(sp),d1
    1c24:	d280           	add.l d0,d1
    1c26:	2f41 0008      	move.l d1,8(sp)
          UWORD *tmpdest = pos4dest +  size4blit;
    1c2a:	7000           	moveq #0,d0
    1c2c:	302f 000c      	move.w 12(sp),d0
    1c30:	d080           	add.l d0,d0
    1c32:	222f 001a      	move.l 26(sp),d1
    1c36:	d280           	add.l d0,d1
    1c38:	2f41 0004      	move.l d1,4(sp)
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
    1c3c:	7000           	moveq #0,d0
    1c3e:	3017           	move.w (sp),d0
    1c40:	2f00           	move.l d0,-(sp)
    1c42:	2f2f 0008      	move.l 8(sp),-(sp)
    1c46:	2f2f 0010      	move.l 16(sp),-(sp)
    1c4a:	4eba f314      	jsr f60 <Zoom_CopyWord>(pc)
    1c4e:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1c52:	302f 0022      	move.w 34(sp),d0
    1c56:	5340           	subq.w #1,d0
    1c58:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1c5c:	3039 004d 2c6e 	move.w 4d2c6e <ZoomHorizontal>,d0
    1c62:	c1d7           	muls.w (sp),d0
    1c64:	7200           	moveq #0,d1
    1c66:	3200           	move.w d0,d1
    1c68:	7000           	moveq #0,d0
    1c6a:	302f 002a      	move.w 42(sp),d0
    1c6e:	d080           	add.l d0,d0
    1c70:	d0af 001e      	add.l 30(sp),d0
    1c74:	2f01           	move.l d1,-(sp)
    1c76:	2f2f 001e      	move.l 30(sp),-(sp)
    1c7a:	2f00           	move.l d0,-(sp)
    1c7c:	4eba f2e2      	jsr f60 <Zoom_CopyWord>(pc)
    1c80:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1c84:	7000           	moveq #0,d0
    1c86:	302f 000c      	move.w 12(sp),d0
    1c8a:	d080           	add.l d0,d0
    1c8c:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep; 
    1c90:	7200           	moveq #0,d1
    1c92:	322f 000c      	move.w 12(sp),d1
    1c96:	7000           	moveq #0,d0
    1c98:	302f 0018      	move.w 24(sp),d0
    1c9c:	d081           	add.l d1,d0
    1c9e:	d080           	add.l d0,d0
    1ca0:	d1af 001a      	add.l d0,26(sp)
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1ca4:	302f 0002      	move.w 2(sp),d0
    1ca8:	d040           	add.w d0,d0
    1caa:	906f 0002      	sub.w 2(sp),d0
    1cae:	0640 0012      	addi.w #18,d0
    1cb2:	33c0 004d 2c6e 	move.w d0,4d2c6e <ZoomHorizontal>
      while(linesleft > 0) {
    1cb8:	4a6f 0022      	tst.w 34(sp)
    1cbc:	6e00 ff12      	bgt.w 1bd0 <Zoom_ZoomIntoPicture+0x13c>
    1cc0:	6000 0140      	bra.w 1e02 <Zoom_ZoomIntoPicture+0x36e>
      }
    } else {  
      Init_ZoomBlit( startofword, nextzoom, shiftright);   
    1cc4:	326f 0032      	movea.w 50(sp),a1
    1cc8:	306f 002c      	movea.w 44(sp),a0
    1ccc:	7000           	moveq #0,d0
    1cce:	302f 002e      	move.w 46(sp),d0
    1cd2:	2f09           	move.l a1,-(sp)
    1cd4:	2f08           	move.l a0,-(sp)
    1cd6:	2f00           	move.l d0,-(sp)
    1cd8:	4eba fcdc      	jsr 19b6 <Init_ZoomBlit>(pc)
    1cdc:	4fef 000c      	lea 12(sp),sp
      nextzoom -= (19 + zoomnr);
    1ce0:	302f 002c      	move.w 44(sp),d0
    1ce4:	906f 0002      	sub.w 2(sp),d0
    1ce8:	0640 ffed      	addi.w #-19,d0
    1cec:	3f40 002c      	move.w d0,44(sp)
    1cf0:	6000 00ea      	bra.w 1ddc <Zoom_ZoomIntoPicture+0x348>
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1cf4:	3039 004d 2c6e 	move.w 4d2c6e <ZoomHorizontal>,d0
    1cfa:	b06f 0022      	cmp.w 34(sp),d0
    1cfe:	6c12           	bge.s 1d12 <Zoom_ZoomIntoPicture+0x27e>
          linesleft -= ZoomHorizontal;
    1d00:	322f 0022      	move.w 34(sp),d1
    1d04:	3039 004d 2c6e 	move.w 4d2c6e <ZoomHorizontal>,d0
    1d0a:	9240           	sub.w d0,d1
    1d0c:	3f41 0022      	move.w d1,34(sp)
    1d10:	600c           	bra.s 1d1e <Zoom_ZoomIntoPicture+0x28a>
        } else {
          ZoomHorizontal = linesleft;
    1d12:	33ef 0022 004d 	move.w 34(sp),4d2c6e <ZoomHorizontal>
    1d18:	2c6e 
          linesleft = 0;
    1d1a:	426f 0022      	clr.w 34(sp)
        }
        UWORD size4blit = ZoomHorizontal*onestep;
    1d1e:	3039 004d 2c6e 	move.w 4d2c6e <ZoomHorizontal>,d0
    1d24:	322f 0018      	move.w 24(sp),d1
    1d28:	c3c0           	muls.w d0,d1
    1d2a:	3f41 0016      	move.w d1,22(sp)
        //Add aditional line
        if( linesleft>0) {
    1d2e:	4a6f 0022      	tst.w 34(sp)
    1d32:	6f4c           	ble.s 1d80 <Zoom_ZoomIntoPicture+0x2ec>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1d34:	7200           	moveq #0,d1
    1d36:	322f 0016      	move.w 22(sp),d1
    1d3a:	7000           	moveq #0,d0
    1d3c:	302f 002a      	move.w 42(sp),d0
    1d40:	d081           	add.l d1,d0
    1d42:	d080           	add.l d0,d0
    1d44:	222f 001e      	move.l 30(sp),d1
    1d48:	d280           	add.l d0,d1
    1d4a:	2f41 0012      	move.l d1,18(sp)
          UWORD *tmpdest = pos4dest + size4blit;
    1d4e:	7000           	moveq #0,d0
    1d50:	302f 0016      	move.w 22(sp),d0
    1d54:	d080           	add.l d0,d0
    1d56:	222f 001a      	move.l 26(sp),d1
    1d5a:	d280           	add.l d0,d1
    1d5c:	2f41 000e      	move.l d1,14(sp)
          
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
    1d60:	7000           	moveq #0,d0
    1d62:	3017           	move.w (sp),d0
    1d64:	2f00           	move.l d0,-(sp)
    1d66:	2f2f 0012      	move.l 18(sp),-(sp)
    1d6a:	2f2f 001a      	move.l 26(sp),-(sp)
    1d6e:	4eba f22e      	jsr f9e <Zoom_ZoomBlit>(pc)
    1d72:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1d76:	302f 0022      	move.w 34(sp),d0
    1d7a:	5340           	subq.w #1,d0
    1d7c:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1d80:	3039 004d 2c6e 	move.w 4d2c6e <ZoomHorizontal>,d0
    1d86:	c1d7           	muls.w (sp),d0
    1d88:	7200           	moveq #0,d1
    1d8a:	3200           	move.w d0,d1
    1d8c:	7000           	moveq #0,d0
    1d8e:	302f 002a      	move.w 42(sp),d0
    1d92:	d080           	add.l d0,d0
    1d94:	d0af 001e      	add.l 30(sp),d0
    1d98:	2f01           	move.l d1,-(sp)
    1d9a:	2f2f 001e      	move.l 30(sp),-(sp)
    1d9e:	2f00           	move.l d0,-(sp)
    1da0:	4eba f1fc      	jsr f9e <Zoom_ZoomBlit>(pc)
    1da4:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1da8:	7000           	moveq #0,d0
    1daa:	302f 0016      	move.w 22(sp),d0
    1dae:	d080           	add.l d0,d0
    1db0:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep;   
    1db4:	7200           	moveq #0,d1
    1db6:	322f 0016      	move.w 22(sp),d1
    1dba:	7000           	moveq #0,d0
    1dbc:	302f 0018      	move.w 24(sp),d0
    1dc0:	d081           	add.l d1,d0
    1dc2:	d080           	add.l d0,d0
    1dc4:	d1af 001a      	add.l d0,26(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1dc8:	302f 0002      	move.w 2(sp),d0
    1dcc:	d040           	add.w d0,d0
    1dce:	906f 0002      	sub.w 2(sp),d0
    1dd2:	0640 0012      	addi.w #18,d0
    1dd6:	33c0 004d 2c6e 	move.w d0,4d2c6e <ZoomHorizontal>
      while( linesleft > 0) {
    1ddc:	4a6f 0022      	tst.w 34(sp)
    1de0:	6e00 ff12      	bgt.w 1cf4 <Zoom_ZoomIntoPicture+0x260>
      }
      shiftright--;  
    1de4:	302f 0032      	move.w 50(sp),d0
    1de8:	5340           	subq.w #1,d0
    1dea:	3f40 0032      	move.w d0,50(sp)
      if(shiftright < 0) {
    1dee:	6a12           	bpl.s 1e02 <Zoom_ZoomIntoPicture+0x36e>
        shiftright += 16;
    1df0:	302f 0032      	move.w 50(sp),d0
    1df4:	0640 0010      	addi.w #16,d0
    1df8:	3f40 0032      	move.w d0,50(sp)
        shifttoleft = 1;
    1dfc:	3f7c 0001 002a 	move.w #1,42(sp)
      }
    }
    startofword -= 16;
    1e02:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    1e08:	52af 0024      	addq.l #1,36(sp)
    1e0c:	7015           	moveq #21,d0
    1e0e:	b0af 0024      	cmp.l 36(sp),d0
    1e12:	6c00 fd30      	bge.w 1b44 <Zoom_ZoomIntoPicture+0xb0>
  }
}
    1e16:	4fef 0034      	lea 52(sp),sp
    1e1a:	4e75           	rts

00001e1c <Zoom_SetBplPointers>:

void Zoom_SetBplPointers( UWORD *buffer, ULONG *copper) {
    1e1c:	4fef ffb0      	lea -80(sp),sp
  //                   0  1  1   1   1   0   1   1    1    1    0    1    1    0    1    1
  //int zoomoffset[] = { 0, 0, 42, 42, 84, 84, 84, 126, 126, 168, 168, 168, 210, 210, 210, 332};
  //int zoomoffset[] = { 252, 210, 210, 210, 168, 168, 168, 126, 126, 84, 84, 84, 42, 42, 0, 0 };
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
    1e20:	204f           	movea.l sp,a0
    1e22:	223c 0000 7d28 	move.l #32040,d1
    1e28:	7040           	moveq #64,d0
    1e2a:	2f00           	move.l d0,-(sp)
    1e2c:	2f01           	move.l d1,-(sp)
    1e2e:	2f08           	move.l a0,-(sp)
    1e30:	4eba 4f7c      	jsr 6dae <memcpy>(pc)
    1e34:	4fef 000c      	lea 12(sp),sp

  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
    1e38:	3039 004d 2c6a 	move.w 4d2c6a <Zoom_LevelOf102Zoom>,d0
    1e3e:	3000           	move.w d0,d0
    1e40:	0280 0000 ffff 	andi.l #65535,d0
    1e46:	d080           	add.l d0,d0
    1e48:	d080           	add.l d0,d0
    1e4a:	41ef 0050      	lea 80(sp),a0
    1e4e:	d1c0           	adda.l d0,a0
    1e50:	41e8 ffb0      	lea -80(a0),a0
    1e54:	2010           	move.l (a0),d0
    1e56:	d080           	add.l d0,d0
    1e58:	d0af 0054      	add.l 84(sp),d0
    1e5c:	2f40 004c      	move.l d0,76(sp)
  /*ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;*/
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
    1e60:	7072           	moveq #114,d0
    1e62:	d0af 0058      	add.l 88(sp),d0
    1e66:	2f40 0048      	move.l d0,72(sp)
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1e6a:	42af 0044      	clr.l 68(sp)
    1e6e:	6036           	bra.s 1ea6 <Zoom_SetBplPointers+0x8a>
    UWORD highword = (ULONG)plane2set >> 16;
    1e70:	202f 004c      	move.l 76(sp),d0
    1e74:	4240           	clr.w d0
    1e76:	4840           	swap d0
    1e78:	3f40 0042      	move.w d0,66(sp)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1e7c:	3f6f 004e 0040 	move.w 78(sp),64(sp)
    *posofcopper = highword;
    1e82:	206f 0048      	movea.l 72(sp),a0
    1e86:	30af 0042      	move.w 66(sp),(a0)
    posofcopper += 2;
    1e8a:	58af 0048      	addq.l #4,72(sp)
    *posofcopper = lowword;
    1e8e:	206f 0048      	movea.l 72(sp),a0
    1e92:	30af 0040      	move.w 64(sp),(a0)
    posofcopper += 2;
    1e96:	58af 0048      	addq.l #4,72(sp)
    plane2set += 42*268; //Next plane
    1e9a:	06af 0000 2bf8 	addi.l #11256,76(sp)
    1ea0:	004c 
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1ea2:	52af 0044      	addq.l #1,68(sp)
    1ea6:	7004           	moveq #4,d0
    1ea8:	b0af 0044      	cmp.l 68(sp),d0
    1eac:	6cc2           	bge.s 1e70 <Zoom_SetBplPointers+0x54>
  }
  
}
    1eae:	4fef 0050      	lea 80(sp),sp
    1eb2:	4e75           	rts

00001eb4 <Zoom_SwapBuffers>:

void Zoom_SwapBuffers( UWORD zoomlevel) {
    1eb4:	598f           	subq.l #4,sp
    1eb6:	2f02           	move.l d2,-(sp)
    1eb8:	202f 000c      	move.l 12(sp),d0
    1ebc:	3000           	move.w d0,d0
    1ebe:	3f40 0006      	move.w d0,6(sp)

  ViewBuffer = rawzoom + (42*268*5*zoomlevel);
    1ec2:	2439 0000 b8a0 	move.l b8a0 <rawzoom>,d2
    1ec8:	7000           	moveq #0,d0
    1eca:	302f 0006      	move.w 6(sp),d0
    1ece:	2f3c 0000 dbd8 	move.l #56280,-(sp)
    1ed4:	2f00           	move.l d0,-(sp)
    1ed6:	4eb9 0000 710c 	jsr 710c <__mulsi3>
    1edc:	508f           	addq.l #8,sp
    1ede:	d082           	add.l d2,d0
    1ee0:	23c0 004d 2c10 	move.l d0,4d2c10 <ViewBuffer>
  /*ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;*/
}
    1ee6:	241f           	move.l (sp)+,d2
    1ee8:	588f           	addq.l #4,sp
    1eea:	4e75           	rts

00001eec <Test_Zoom2>:
#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
    1eec:	4fef ff00      	lea -256(sp),sp
    1ef0:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  //Test Zoomlevel 1
  volatile ULONG *srcsmall = AllocMem( 80, MEMF_CHIP);
    1ef4:	7050           	moveq #80,d0
    1ef6:	2f40 00f0      	move.l d0,240(sp)
    1efa:	7002           	moveq #2,d0
    1efc:	2f40 00ec      	move.l d0,236(sp)
    1f00:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    1f06:	2c40           	movea.l d0,a6
    1f08:	202f 00f0      	move.l 240(sp),d0
    1f0c:	222f 00ec      	move.l 236(sp),d1
    1f10:	4eae ff3a      	jsr -198(a6)
    1f14:	2f40 00e8      	move.l d0,232(sp)
    1f18:	202f 00e8      	move.l 232(sp),d0
    1f1c:	2f40 00e4      	move.l d0,228(sp)
  if( srcsmall == 0) {
    1f20:	6646           	bne.s 1f68 <Test_Zoom2+0x7c>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcsmall\n", 42);
    1f22:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    1f28:	2c40           	movea.l d0,a6
    1f2a:	4eae ffc4      	jsr -60(a6)
    1f2e:	2f40 001c      	move.l d0,28(sp)
    1f32:	202f 001c      	move.l 28(sp),d0
    1f36:	2f40 0018      	move.l d0,24(sp)
    1f3a:	2f7c 0000 7d68 	move.l #32104,20(sp)
    1f40:	0014 
    1f42:	702a           	moveq #42,d0
    1f44:	2f40 0010      	move.l d0,16(sp)
    1f48:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    1f4e:	2c40           	movea.l d0,a6
    1f50:	222f 0018      	move.l 24(sp),d1
    1f54:	242f 0014      	move.l 20(sp),d2
    1f58:	262f 0010      	move.l 16(sp),d3
    1f5c:	4eae ffd0      	jsr -48(a6)
    1f60:	2f40 000c      	move.l d0,12(sp)
    1f64:	6000 0560      	bra.w 24c6 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong(srcsmall, 0xaaaaaaaa, 2, 10, 0);
    1f68:	42a7           	clr.l -(sp)
    1f6a:	4878 000a      	pea a <_start+0xa>
    1f6e:	4878 0002      	pea 2 <_start+0x2>
    1f72:	2f3c aaaa aaaa 	move.l #-1431655766,-(sp)
    1f78:	2f2f 00f4      	move.l 244(sp),-(sp)
    1f7c:	4eba e29e      	jsr 21c <Utils_FillLong>(pc)
    1f80:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *srcbig = AllocMem( 160, MEMF_CHIP);
    1f84:	2f7c 0000 00a0 	move.l #160,224(sp)
    1f8a:	00e0 
    1f8c:	7002           	moveq #2,d0
    1f8e:	2f40 00dc      	move.l d0,220(sp)
    1f92:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    1f98:	2c40           	movea.l d0,a6
    1f9a:	202f 00e0      	move.l 224(sp),d0
    1f9e:	222f 00dc      	move.l 220(sp),d1
    1fa2:	4eae ff3a      	jsr -198(a6)
    1fa6:	2f40 00d8      	move.l d0,216(sp)
    1faa:	202f 00d8      	move.l 216(sp),d0
    1fae:	2f40 00d4      	move.l d0,212(sp)
    if( srcbig == 0) {
    1fb2:	6646           	bne.s 1ffa <Test_Zoom2+0x10e>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcbig\n", 40);
    1fb4:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    1fba:	2c40           	movea.l d0,a6
    1fbc:	4eae ffc4      	jsr -60(a6)
    1fc0:	2f40 0030      	move.l d0,48(sp)
    1fc4:	202f 0030      	move.l 48(sp),d0
    1fc8:	2f40 002c      	move.l d0,44(sp)
    1fcc:	2f7c 0000 7d93 	move.l #32147,40(sp)
    1fd2:	0028 
    1fd4:	7028           	moveq #40,d0
    1fd6:	2f40 0024      	move.l d0,36(sp)
    1fda:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    1fe0:	2c40           	movea.l d0,a6
    1fe2:	222f 002c      	move.l 44(sp),d1
    1fe6:	242f 0028      	move.l 40(sp),d2
    1fea:	262f 0024      	move.l 36(sp),d3
    1fee:	4eae ffd0      	jsr -48(a6)
    1ff2:	2f40 0020      	move.l d0,32(sp)
    1ff6:	6000 04ce      	bra.w 24c6 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong( srcbig, 0x55555555, 2, 20, 0);
    1ffa:	42a7           	clr.l -(sp)
    1ffc:	4878 0014      	pea 14 <_start+0x14>
    2000:	4878 0002      	pea 2 <_start+0x2>
    2004:	2f3c 5555 5555 	move.l #1431655765,-(sp)
    200a:	2f2f 00e4      	move.l 228(sp),-(sp)
    200e:	4eba e20c      	jsr 21c <Utils_FillLong>(pc)
    2012:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *target = AllocMem( 168, MEMF_CHIP);
    2016:	2f7c 0000 00a8 	move.l #168,208(sp)
    201c:	00d0 
    201e:	7002           	moveq #2,d0
    2020:	2f40 00cc      	move.l d0,204(sp)
    2024:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    202a:	2c40           	movea.l d0,a6
    202c:	202f 00d0      	move.l 208(sp),d0
    2030:	222f 00cc      	move.l 204(sp),d1
    2034:	4eae ff3a      	jsr -198(a6)
    2038:	2f40 00c8      	move.l d0,200(sp)
    203c:	202f 00c8      	move.l 200(sp),d0
    2040:	2f40 00c4      	move.l d0,196(sp)
  if( target == 0) {
    2044:	6646           	bne.s 208c <Test_Zoom2+0x1a0>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
    2046:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    204c:	2c40           	movea.l d0,a6
    204e:	4eae ffc4      	jsr -60(a6)
    2052:	2f40 0044      	move.l d0,68(sp)
    2056:	202f 0044      	move.l 68(sp),d0
    205a:	2f40 0040      	move.l d0,64(sp)
    205e:	2f7c 0000 7dbc 	move.l #32188,60(sp)
    2064:	003c 
    2066:	7028           	moveq #40,d0
    2068:	2f40 0038      	move.l d0,56(sp)
    206c:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2072:	2c40           	movea.l d0,a6
    2074:	222f 0040      	move.l 64(sp),d1
    2078:	242f 003c      	move.l 60(sp),d2
    207c:	262f 0038      	move.l 56(sp),d3
    2080:	4eae ffd0      	jsr -48(a6)
    2084:	2f40 0034      	move.l d0,52(sp)
    2088:	6000 043c      	bra.w 24c6 <Test_Zoom2+0x5da>
    return;
  }
  WaitBlt();
    208c:	4eba e026      	jsr b4 <WaitBlt>(pc)
  hw->bltafwm = 0xffff;
    2090:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    2096:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    209c:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    20a2:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltdmod = 38;
    20a8:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    20ae:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcon1 = 1 << 12; //Shift src big
    20b4:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    20ba:	317c 1000 0042 	move.w #4096,66(a0)
  hw->bltcon0 = 0xde4; //Chanell settings and Shift src small
    20c0:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    20c6:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltcdat = 0x8000; //Show channel small if 1 else channel big
    20cc:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    20d2:	317c 8000 0070 	move.w #-32768,112(a0)
  //srcbig-shift   0010 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sbbb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    20d8:	4878 0001      	pea 1 <_start+0x1>
    20dc:	4878 004e      	pea 4e <_start+0x4e>
    20e0:	4878 0026      	pea 26 <_start+0x26>
    20e4:	4878 0002      	pea 2 <_start+0x2>
    20e8:	2f2f 00d4      	move.l 212(sp),-(sp)
    20ec:	2f2f 00e8      	move.l 232(sp),-(sp)
    20f0:	2f2f 00fc      	move.l 252(sp),-(sp)
    20f4:	4eba ef0c      	jsr 1002 <Zoom_ZoomBlit2>(pc)
    20f8:	4fef 001c      	lea 28(sp),sp
  UWORD *tmp = (UWORD *)target;
    20fc:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2102:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    2108:	2c40           	movea.l d0,a6
    210a:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    210e:	42af 0104      	clr.l 260(sp)
    2112:	605c           	bra.s 2170 <Test_Zoom2+0x284>
    if( *tmp != 0xaaaa ) {
    2114:	206f 0108      	movea.l 264(sp),a0
    2118:	3010           	move.w (a0),d0
    211a:	0c40 aaaa      	cmpi.w #-21846,d0
    211e:	6746           	beq.s 2166 <Test_Zoom2+0x27a>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 1 failed\n", 40);
    2120:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2126:	2c40           	movea.l d0,a6
    2128:	4eae ffc4      	jsr -60(a6)
    212c:	2f40 0058      	move.l d0,88(sp)
    2130:	202f 0058      	move.l 88(sp),d0
    2134:	2f40 0054      	move.l d0,84(sp)
    2138:	2f7c 0000 7de5 	move.l #32229,80(sp)
    213e:	0050 
    2140:	7028           	moveq #40,d0
    2142:	2f40 004c      	move.l d0,76(sp)
    2146:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    214c:	2c40           	movea.l d0,a6
    214e:	222f 0054      	move.l 84(sp),d1
    2152:	242f 0050      	move.l 80(sp),d2
    2156:	262f 004c      	move.l 76(sp),d3
    215a:	4eae ffd0      	jsr -48(a6)
    215e:	2f40 0048      	move.l d0,72(sp)
    2162:	6000 0362      	bra.w 24c6 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    2166:	7028           	moveq #40,d0
    2168:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    216c:	52af 0104      	addq.l #1,260(sp)
    2170:	7001           	moveq #1,d0
    2172:	b0af 0104      	cmp.l 260(sp),d0
    2176:	6c9c           	bge.s 2114 <Test_Zoom2+0x228>
  //srcbig-shift   0001 0101 0101 0101
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       ssbb bbbb bbbb bbbb
  //result:        1001 0101 0101 0101

  hw->bltcon1 = 2 << 12; //Shift src big
    2178:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    217e:	317c 2000 0042 	move.w #8192,66(a0)
  hw->bltcdat = 0xc000; //Show channel small if 1 else channel big
    2184:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    218a:	317c c000 0070 	move.w #-16384,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2190:	4878 0001      	pea 1 <_start+0x1>
    2194:	4878 004e      	pea 4e <_start+0x4e>
    2198:	4878 0026      	pea 26 <_start+0x26>
    219c:	4878 0002      	pea 2 <_start+0x2>
    21a0:	2f2f 00d4      	move.l 212(sp),-(sp)
    21a4:	2f2f 00e8      	move.l 232(sp),-(sp)
    21a8:	2f2f 00fc      	move.l 252(sp),-(sp)
    21ac:	4eba ee54      	jsr 1002 <Zoom_ZoomBlit2>(pc)
    21b0:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    21b4:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    21ba:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    21c0:	2c40           	movea.l d0,a6
    21c2:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    21c6:	42af 0100      	clr.l 256(sp)
    21ca:	605c           	bra.s 2228 <Test_Zoom2+0x33c>
    if( *tmp != 0x9555 ) {
    21cc:	206f 0108      	movea.l 264(sp),a0
    21d0:	3010           	move.w (a0),d0
    21d2:	0c40 9555      	cmpi.w #-27307,d0
    21d6:	6746           	beq.s 221e <Test_Zoom2+0x332>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 2 failed\n", 40);
    21d8:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    21de:	2c40           	movea.l d0,a6
    21e0:	4eae ffc4      	jsr -60(a6)
    21e4:	2f40 006c      	move.l d0,108(sp)
    21e8:	202f 006c      	move.l 108(sp),d0
    21ec:	2f40 0068      	move.l d0,104(sp)
    21f0:	2f7c 0000 7e0e 	move.l #32270,100(sp)
    21f6:	0064 
    21f8:	7028           	moveq #40,d0
    21fa:	2f40 0060      	move.l d0,96(sp)
    21fe:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2204:	2c40           	movea.l d0,a6
    2206:	222f 0068      	move.l 104(sp),d1
    220a:	242f 0064      	move.l 100(sp),d2
    220e:	262f 0060      	move.l 96(sp),d3
    2212:	4eae ffd0      	jsr -48(a6)
    2216:	2f40 005c      	move.l d0,92(sp)
    221a:	6000 02aa      	bra.w 24c6 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    221e:	7028           	moveq #40,d0
    2220:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2224:	52af 0100      	addq.l #1,256(sp)
    2228:	7001           	moveq #1,d0
    222a:	b0af 0100      	cmp.l 256(sp),d0
    222e:	6c9c           	bge.s 21cc <Test_Zoom2+0x2e0>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2230:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    2236:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    223c:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    2242:	317c e000 0070 	move.w #-8192,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2248:	4878 0001      	pea 1 <_start+0x1>
    224c:	4878 004e      	pea 4e <_start+0x4e>
    2250:	4878 0026      	pea 26 <_start+0x26>
    2254:	4878 0002      	pea 2 <_start+0x2>
    2258:	2f2f 00d4      	move.l 212(sp),-(sp)
    225c:	2f2f 00e8      	move.l 232(sp),-(sp)
    2260:	2f2f 00fc      	move.l 252(sp),-(sp)
    2264:	4eba ed9c      	jsr 1002 <Zoom_ZoomBlit2>(pc)
    2268:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    226c:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2272:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    2278:	2c40           	movea.l d0,a6
    227a:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    227e:	42af 00fc      	clr.l 252(sp)
    2282:	605c           	bra.s 22e0 <Test_Zoom2+0x3f4>
    if( *tmp != 0xaaaa ) {
    2284:	206f 0108      	movea.l 264(sp),a0
    2288:	3010           	move.w (a0),d0
    228a:	0c40 aaaa      	cmpi.w #-21846,d0
    228e:	6746           	beq.s 22d6 <Test_Zoom2+0x3ea>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    2290:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2296:	2c40           	movea.l d0,a6
    2298:	4eae ffc4      	jsr -60(a6)
    229c:	2f40 0080      	move.l d0,128(sp)
    22a0:	202f 0080      	move.l 128(sp),d0
    22a4:	2f40 007c      	move.l d0,124(sp)
    22a8:	2f7c 0000 7e37 	move.l #32311,120(sp)
    22ae:	0078 
    22b0:	7028           	moveq #40,d0
    22b2:	2f40 0074      	move.l d0,116(sp)
    22b6:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    22bc:	2c40           	movea.l d0,a6
    22be:	222f 007c      	move.l 124(sp),d1
    22c2:	242f 0078      	move.l 120(sp),d2
    22c6:	262f 0074      	move.l 116(sp),d3
    22ca:	4eae ffd0      	jsr -48(a6)
    22ce:	2f40 0070      	move.l d0,112(sp)
    22d2:	6000 01f2      	bra.w 24c6 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    22d6:	7028           	moveq #40,d0
    22d8:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    22dc:	52af 00fc      	addq.l #1,252(sp)
    22e0:	7001           	moveq #1,d0
    22e2:	b0af 00fc      	cmp.l 252(sp),d0
    22e6:	6c9c           	bge.s 2284 <Test_Zoom2+0x398>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    22e8:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    22ee:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    22f4:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    22fa:	317c e000 0070 	move.w #-8192,112(a0)

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2300:	4878 0001      	pea 1 <_start+0x1>
    2304:	4878 004e      	pea 4e <_start+0x4e>
    2308:	4878 0026      	pea 26 <_start+0x26>
    230c:	4878 0002      	pea 2 <_start+0x2>
    2310:	2f2f 00d4      	move.l 212(sp),-(sp)
    2314:	2f2f 00e8      	move.l 232(sp),-(sp)
    2318:	2f2f 00fc      	move.l 252(sp),-(sp)
    231c:	4eba ece4      	jsr 1002 <Zoom_ZoomBlit2>(pc)
    2320:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2324:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    232a:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    2330:	2c40           	movea.l d0,a6
    2332:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2336:	42af 00f8      	clr.l 248(sp)
    233a:	605c           	bra.s 2398 <Test_Zoom2+0x4ac>
    if( *tmp != 0xaaaa ) {
    233c:	206f 0108      	movea.l 264(sp),a0
    2340:	3010           	move.w (a0),d0
    2342:	0c40 aaaa      	cmpi.w #-21846,d0
    2346:	6746           	beq.s 238e <Test_Zoom2+0x4a2>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    2348:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    234e:	2c40           	movea.l d0,a6
    2350:	4eae ffc4      	jsr -60(a6)
    2354:	2f40 0094      	move.l d0,148(sp)
    2358:	202f 0094      	move.l 148(sp),d0
    235c:	2f40 0090      	move.l d0,144(sp)
    2360:	2f7c 0000 7e37 	move.l #32311,140(sp)
    2366:	008c 
    2368:	7028           	moveq #40,d0
    236a:	2f40 0088      	move.l d0,136(sp)
    236e:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2374:	2c40           	movea.l d0,a6
    2376:	222f 0090      	move.l 144(sp),d1
    237a:	242f 008c      	move.l 140(sp),d2
    237e:	262f 0088      	move.l 136(sp),d3
    2382:	4eae ffd0      	jsr -48(a6)
    2386:	2f40 0084      	move.l d0,132(sp)
    238a:	6000 013a      	bra.w 24c6 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    238e:	7028           	moveq #40,d0
    2390:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2394:	52af 00f8      	addq.l #1,248(sp)
    2398:	7001           	moveq #1,d0
    239a:	b0af 00f8      	cmp.l 248(sp),d0
    239e:	6c9c           	bge.s 233c <Test_Zoom2+0x450>
  //srcsmall:            1010 1010 1010 1010
  //srcsmall-shift:      0101 0101 0101 0101
  //pattern:             sssb bbbb bbbb bbbb
  //result:              0100 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    23a0:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    23a6:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    23ac:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    23b2:	317c e000 0070 	move.w #-8192,112(a0)
  hw->bltcon0 = 0xde4 + (1 << 12); //Chanell settings and Shift src small
    23b8:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    23be:	317c 1de4 0040 	move.w #7652,64(a0)
 
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    23c4:	4878 0001      	pea 1 <_start+0x1>
    23c8:	4878 004e      	pea 4e <_start+0x4e>
    23cc:	4878 0026      	pea 26 <_start+0x26>
    23d0:	4878 0002      	pea 2 <_start+0x2>
    23d4:	2f2f 00d4      	move.l 212(sp),-(sp)
    23d8:	2f2f 00e8      	move.l 232(sp),-(sp)
    23dc:	2f2f 00fc      	move.l 252(sp),-(sp)
    23e0:	4eba ec20      	jsr 1002 <Zoom_ZoomBlit2>(pc)
    23e4:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    23e8:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    23ee:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    23f4:	2c40           	movea.l d0,a6
    23f6:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    23fa:	42af 00f4      	clr.l 244(sp)
    23fe:	605a           	bra.s 245a <Test_Zoom2+0x56e>
    if( *tmp != 0x4aaa ) {
    2400:	206f 0108      	movea.l 264(sp),a0
    2404:	3010           	move.w (a0),d0
    2406:	0c40 4aaa      	cmpi.w #19114,d0
    240a:	6744           	beq.s 2450 <Test_Zoom2+0x564>
      Write( Output(), "Test_Zoom2: Test for shifting a failed\n", 39);
    240c:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2412:	2c40           	movea.l d0,a6
    2414:	4eae ffc4      	jsr -60(a6)
    2418:	2f40 00a8      	move.l d0,168(sp)
    241c:	202f 00a8      	move.l 168(sp),d0
    2420:	2f40 00a4      	move.l d0,164(sp)
    2424:	2f7c 0000 7e60 	move.l #32352,160(sp)
    242a:	00a0 
    242c:	7027           	moveq #39,d0
    242e:	2f40 009c      	move.l d0,156(sp)
    2432:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2438:	2c40           	movea.l d0,a6
    243a:	222f 00a4      	move.l 164(sp),d1
    243e:	242f 00a0      	move.l 160(sp),d2
    2442:	262f 009c      	move.l 156(sp),d3
    2446:	4eae ffd0      	jsr -48(a6)
    244a:	2f40 0098      	move.l d0,152(sp)
    244e:	6076           	bra.s 24c6 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    2450:	7028           	moveq #40,d0
    2452:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2456:	52af 00f4      	addq.l #1,244(sp)
    245a:	7001           	moveq #1,d0
    245c:	b0af 00f4      	cmp.l 244(sp),d0
    2460:	6c9e           	bge.s 2400 <Test_Zoom2+0x514>

  FreeMem( srcsmall, 80);
    2462:	2f6f 00e4 00c0 	move.l 228(sp),192(sp)
    2468:	7050           	moveq #80,d0
    246a:	2f40 00bc      	move.l d0,188(sp)
    246e:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    2474:	2c40           	movea.l d0,a6
    2476:	226f 00c0      	movea.l 192(sp),a1
    247a:	202f 00bc      	move.l 188(sp),d0
    247e:	4eae ff2e      	jsr -210(a6)
  FreeMem( srcbig, 160);
    2482:	2f6f 00d4 00b8 	move.l 212(sp),184(sp)
    2488:	2f7c 0000 00a0 	move.l #160,180(sp)
    248e:	00b4 
    2490:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    2496:	2c40           	movea.l d0,a6
    2498:	226f 00b8      	movea.l 184(sp),a1
    249c:	202f 00b4      	move.l 180(sp),d0
    24a0:	4eae ff2e      	jsr -210(a6)
  FreeMem( target, 168);
    24a4:	2f6f 00c4 00b0 	move.l 196(sp),176(sp)
    24aa:	2f7c 0000 00a8 	move.l #168,172(sp)
    24b0:	00ac 
    24b2:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    24b8:	2c40           	movea.l d0,a6
    24ba:	226f 00b0      	movea.l 176(sp),a1
    24be:	202f 00ac      	move.l 172(sp),d0
    24c2:	4eae ff2e      	jsr -210(a6)
    24c6:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    24ca:	4fef 0100      	lea 256(sp),sp
    24ce:	4e75           	rts

000024d0 <ClBuild>:
#include "utils.h"




ULONG * ClBuild() {
    24d0:	4fef ffc4      	lea -60(sp),sp
    24d4:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
    24d8:	2f7c 0000 0084 	move.l #132,48(sp)
    24de:	0030 
    24e0:	7002           	moveq #2,d0
    24e2:	2f40 002c      	move.l d0,44(sp)
    24e6:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    24ec:	2c40           	movea.l d0,a6
    24ee:	202f 0030      	move.l 48(sp),d0
    24f2:	222f 002c      	move.l 44(sp),d1
    24f6:	4eae ff3a      	jsr -198(a6)
    24fa:	2f40 0028      	move.l d0,40(sp)
    24fe:	202f 0028      	move.l 40(sp),d0
    2502:	2f40 0024      	move.l d0,36(sp)
  if( retval == 0) {
    2506:	6658           	bne.s 2560 <ClBuild+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2508:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    250e:	2c40           	movea.l d0,a6
    2510:	4eae ffc4      	jsr -60(a6)
    2514:	2f40 0020      	move.l d0,32(sp)
    2518:	202f 0020      	move.l 32(sp),d0
    251c:	2f40 001c      	move.l d0,28(sp)
    2520:	2f7c 0000 7cf3 	move.l #31987,24(sp)
    2526:	0018 
    2528:	7228           	moveq #40,d1
    252a:	2f41 0014      	move.l d1,20(sp)
    252e:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2534:	2c40           	movea.l d0,a6
    2536:	222f 001c      	move.l 28(sp),d1
    253a:	242f 0018      	move.l 24(sp),d2
    253e:	262f 0014      	move.l 20(sp),d3
    2542:	4eae ffd0      	jsr -48(a6)
    2546:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    254a:	7401           	moveq #1,d2
    254c:	2f42 000c      	move.l d2,12(sp)
    2550:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2556:	2c40           	movea.l d0,a6
    2558:	222f 000c      	move.l 12(sp),d1
    255c:	4eae ff70      	jsr -144(a6)
  }
    
  ULONG *cl = retval;
    2560:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    2566:	2f7c 0000 a68c 	move.l #42636,64(sp)
    256c:	0040 
  for(int i=0; i<16;i++)
    256e:	42af 003c      	clr.l 60(sp)
    2572:	6024           	bra.s 2598 <ClBuild+0xc8>
    *cl++ = *clpartinstruction++;
    2574:	222f 0040      	move.l 64(sp),d1
    2578:	2001           	move.l d1,d0
    257a:	5880           	addq.l #4,d0
    257c:	2f40 0040      	move.l d0,64(sp)
    2580:	202f 0044      	move.l 68(sp),d0
    2584:	2400           	move.l d0,d2
    2586:	5882           	addq.l #4,d2
    2588:	2f42 0044      	move.l d2,68(sp)
    258c:	2041           	movea.l d1,a0
    258e:	2210           	move.l (a0),d1
    2590:	2040           	movea.l d0,a0
    2592:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    2594:	52af 003c      	addq.l #1,60(sp)
    2598:	700f           	moveq #15,d0
    259a:	b0af 003c      	cmp.l 60(sp),d0
    259e:	6cd4           	bge.s 2574 <ClBuild+0xa4>
  clpartinstruction = ClScreen;
    25a0:	2f7c 0000 a6cc 	move.l #42700,64(sp)
    25a6:	0040 
  for(int i=0; i<12;i++)
    25a8:	42af 0038      	clr.l 56(sp)
    25ac:	6024           	bra.s 25d2 <ClBuild+0x102>
    *cl++ = *clpartinstruction++;
    25ae:	222f 0040      	move.l 64(sp),d1
    25b2:	2401           	move.l d1,d2
    25b4:	5882           	addq.l #4,d2
    25b6:	2f42 0040      	move.l d2,64(sp)
    25ba:	202f 0044      	move.l 68(sp),d0
    25be:	2400           	move.l d0,d2
    25c0:	5882           	addq.l #4,d2
    25c2:	2f42 0044      	move.l d2,68(sp)
    25c6:	2041           	movea.l d1,a0
    25c8:	2210           	move.l (a0),d1
    25ca:	2040           	movea.l d0,a0
    25cc:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    25ce:	52af 0038      	addq.l #1,56(sp)
    25d2:	700b           	moveq #11,d0
    25d4:	b0af 0038      	cmp.l 56(sp),d0
    25d8:	6cd4           	bge.s 25ae <ClBuild+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    25da:	202f 0044      	move.l 68(sp),d0
    25de:	2200           	move.l d0,d1
    25e0:	5881           	addq.l #4,d1
    25e2:	2f41 0044      	move.l d1,68(sp)
    25e6:	2040           	movea.l d0,a0
    25e8:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    25ee:	202f 0044      	move.l 68(sp),d0
    25f2:	2200           	move.l d0,d1
    25f4:	5881           	addq.l #4,d1
    25f6:	2f41 0044      	move.l d1,68(sp)
    25fa:	2040           	movea.l d0,a0
    25fc:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
    2602:	2f7c 0000 a60c 	move.l #42508,64(sp)
    2608:	0040 
  for(int i=0; i<2;i++)
    260a:	42af 0034      	clr.l 52(sp)
    260e:	6024           	bra.s 2634 <ClBuild+0x164>
    *cl++ = *clpartinstruction++;
    2610:	222f 0040      	move.l 64(sp),d1
    2614:	2001           	move.l d1,d0
    2616:	5880           	addq.l #4,d0
    2618:	2f40 0040      	move.l d0,64(sp)
    261c:	202f 0044      	move.l 68(sp),d0
    2620:	2400           	move.l d0,d2
    2622:	5882           	addq.l #4,d2
    2624:	2f42 0044      	move.l d2,68(sp)
    2628:	2041           	movea.l d1,a0
    262a:	2210           	move.l (a0),d1
    262c:	2040           	movea.l d0,a0
    262e:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
    2630:	52af 0034      	addq.l #1,52(sp)
    2634:	7001           	moveq #1,d0
    2636:	b0af 0034      	cmp.l 52(sp),d0
    263a:	6cd4           	bge.s 2610 <ClBuild+0x140>
  *cl = 0xfffffffe;
    263c:	206f 0044      	movea.l 68(sp),a0
    2640:	72fe           	moveq #-2,d1
    2642:	2081           	move.l d1,(a0)

  return retval;
    2644:	202f 0024      	move.l 36(sp),d0
}
    2648:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    264c:	4fef 003c      	lea 60(sp),sp
    2650:	4e75           	rts

00002652 <PrepareDisplay>:

int PrepareDisplay() {
    2652:	4fef ffb8      	lea -72(sp),sp
    2656:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClBuild( );
    265a:	4eba fe74      	jsr 24d0 <ClBuild>(pc)
    265e:	23c0 004d 2c04 	move.l d0,4d2c04 <Copperlist1>
  Copperlist2 = ClBuild( );
    2664:	4eba fe6a      	jsr 24d0 <ClBuild>(pc)
    2668:	23c0 004d 2c08 	move.l d0,4d2c08 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    266e:	2f7c 0000 c800 	move.l #51200,80(sp)
    2674:	0050 
    2676:	7002           	moveq #2,d0
    2678:	2f40 004c      	move.l d0,76(sp)
    267c:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    2682:	2c40           	movea.l d0,a6
    2684:	202f 0050      	move.l 80(sp),d0
    2688:	222f 004c      	move.l 76(sp),d1
    268c:	4eae ff3a      	jsr -198(a6)
    2690:	2f40 0048      	move.l d0,72(sp)
    2694:	202f 0048      	move.l 72(sp),d0
    2698:	23c0 004d 2bfc 	move.l d0,4d2bfc <Bitplane1>
  if(Bitplane1 == 0) {
    269e:	2039 004d 2bfc 	move.l 4d2bfc <Bitplane1>,d0
    26a4:	6658           	bne.s 26fe <PrepareDisplay+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    26a6:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    26ac:	2c40           	movea.l d0,a6
    26ae:	4eae ffc4      	jsr -60(a6)
    26b2:	2f40 0044      	move.l d0,68(sp)
    26b6:	202f 0044      	move.l 68(sp),d0
    26ba:	2f40 0040      	move.l d0,64(sp)
    26be:	2f7c 0000 7ca5 	move.l #31909,60(sp)
    26c4:	003c 
    26c6:	7026           	moveq #38,d0
    26c8:	2f40 0038      	move.l d0,56(sp)
    26cc:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    26d2:	2c40           	movea.l d0,a6
    26d4:	222f 0040      	move.l 64(sp),d1
    26d8:	242f 003c      	move.l 60(sp),d2
    26dc:	262f 0038      	move.l 56(sp),d3
    26e0:	4eae ffd0      	jsr -48(a6)
    26e4:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    26e8:	7001           	moveq #1,d0
    26ea:	2f40 0030      	move.l d0,48(sp)
    26ee:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    26f4:	2c40           	movea.l d0,a6
    26f6:	222f 0030      	move.l 48(sp),d1
    26fa:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane1;
    26fe:	2039 004d 2bfc 	move.l 4d2bfc <Bitplane1>,d0
    2704:	23c0 004d 2c10 	move.l d0,4d2c10 <ViewBuffer>
  ViewCopper = Copperlist1;
    270a:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    2710:	23c0 004d 2c18 	move.l d0,4d2c18 <ViewCopper>
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    2716:	2f7c 0000 c800 	move.l #51200,44(sp)
    271c:	002c 
    271e:	7002           	moveq #2,d0
    2720:	2f40 0028      	move.l d0,40(sp)
    2724:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    272a:	2c40           	movea.l d0,a6
    272c:	202f 002c      	move.l 44(sp),d0
    2730:	222f 0028      	move.l 40(sp),d1
    2734:	4eae ff3a      	jsr -198(a6)
    2738:	2f40 0024      	move.l d0,36(sp)
    273c:	202f 0024      	move.l 36(sp),d0
    2740:	23c0 004d 2c00 	move.l d0,4d2c00 <Bitplane2>
  if(Bitplane2 == 0) {
    2746:	2039 004d 2c00 	move.l 4d2c00 <Bitplane2>,d0
    274c:	6658           	bne.s 27a6 <PrepareDisplay+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    274e:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2754:	2c40           	movea.l d0,a6
    2756:	4eae ffc4      	jsr -60(a6)
    275a:	2f40 0020      	move.l d0,32(sp)
    275e:	202f 0020      	move.l 32(sp),d0
    2762:	2f40 001c      	move.l d0,28(sp)
    2766:	2f7c 0000 7ccc 	move.l #31948,24(sp)
    276c:	0018 
    276e:	7026           	moveq #38,d0
    2770:	2f40 0014      	move.l d0,20(sp)
    2774:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    277a:	2c40           	movea.l d0,a6
    277c:	222f 001c      	move.l 28(sp),d1
    2780:	242f 0018      	move.l 24(sp),d2
    2784:	262f 0014      	move.l 20(sp),d3
    2788:	4eae ffd0      	jsr -48(a6)
    278c:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    2790:	7001           	moveq #1,d0
    2792:	2f40 000c      	move.l d0,12(sp)
    2796:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    279c:	2c40           	movea.l d0,a6
    279e:	222f 000c      	move.l 12(sp),d1
    27a2:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane2;
    27a6:	2039 004d 2c00 	move.l 4d2c00 <Bitplane2>,d0
    27ac:	23c0 004d 2c0c 	move.l d0,4d2c0c <DrawBuffer>
  DrawCopper = Copperlist2;
    27b2:	2039 004d 2c08 	move.l 4d2c08 <Copperlist2>,d0
    27b8:	23c0 004d 2c14 	move.l d0,4d2c14 <DrawCopper>
  /*SwapCl();
  SetBplPointers();
  SwapCl();
  SetBplPointers();*/
  return 0;
    27be:	7000           	moveq #0,d0
}
    27c0:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    27c4:	4fef 0048      	lea 72(sp),sp
    27c8:	4e75           	rts

000027ca <TestCopperlistBatch>:

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                  long length) {
    27ca:	598f           	subq.l #4,sp
  for( int i=0;i<length;i++)
    27cc:	4297           	clr.l (sp)
    27ce:	602a           	bra.s 27fa <TestCopperlistBatch+0x30>
    if( instructions[ pos+i] != batch[ i])
    27d0:	202f 000c      	move.l 12(sp),d0
    27d4:	d097           	add.l (sp),d0
    27d6:	d080           	add.l d0,d0
    27d8:	d080           	add.l d0,d0
    27da:	206f 0008      	movea.l 8(sp),a0
    27de:	d1c0           	adda.l d0,a0
    27e0:	2210           	move.l (a0),d1
    27e2:	2017           	move.l (sp),d0
    27e4:	d080           	add.l d0,d0
    27e6:	d080           	add.l d0,d0
    27e8:	206f 0010      	movea.l 16(sp),a0
    27ec:	d1c0           	adda.l d0,a0
    27ee:	2010           	move.l (a0),d0
    27f0:	b081           	cmp.l d1,d0
    27f2:	6704           	beq.s 27f8 <TestCopperlistBatch+0x2e>
      return 0;
    27f4:	7000           	moveq #0,d0
    27f6:	600c           	bra.s 2804 <TestCopperlistBatch+0x3a>
  for( int i=0;i<length;i++)
    27f8:	5297           	addq.l #1,(sp)
    27fa:	2017           	move.l (sp),d0
    27fc:	b0af 0014      	cmp.l 20(sp),d0
    2800:	6dce           	blt.s 27d0 <TestCopperlistBatch+0x6>
  return 1;
    2802:	7001           	moveq #1,d0
}
    2804:	588f           	addq.l #4,sp
    2806:	4e75           	rts

00002808 <TestCopperlistPos>:

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    2808:	202f 0008      	move.l 8(sp),d0
    280c:	d080           	add.l d0,d0
    280e:	d080           	add.l d0,d0
    2810:	206f 0004      	movea.l 4(sp),a0
    2814:	d1c0           	adda.l d0,a0
    2816:	2010           	move.l (a0),d0
    2818:	b0af 000c      	cmp.l 12(sp),d0
    281c:	6604           	bne.s 2822 <TestCopperlistPos+0x1a>
    return 1;
    281e:	7001           	moveq #1,d0
    2820:	6002           	bra.s 2824 <TestCopperlistPos+0x1c>
  else 
    return 0;
    2822:	7000           	moveq #0,d0
}
    2824:	4e75           	rts

00002826 <TestCopperList>:

void TestCopperList() {
    2826:	4fef feb8      	lea -328(sp),sp
    282a:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Write( Output(), "%d", hw->cop1lc);
    282e:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2834:	2c40           	movea.l d0,a6
    2836:	4eae ffc4      	jsr -60(a6)
    283a:	2f40 0150      	move.l d0,336(sp)
    283e:	202f 0150      	move.l 336(sp),d0
    2842:	2f40 014c      	move.l d0,332(sp)
    2846:	2f7c 0000 7e88 	move.l #32392,328(sp)
    284c:	0148 
    284e:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    2854:	2028 0080      	move.l 128(a0),d0
    2858:	2f40 0144      	move.l d0,324(sp)
    285c:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2862:	2c40           	movea.l d0,a6
    2864:	222f 014c      	move.l 332(sp),d1
    2868:	242f 0148      	move.l 328(sp),d2
    286c:	262f 0144      	move.l 324(sp),d3
    2870:	4eae ffd0      	jsr -48(a6)
    2874:	2f40 0140      	move.l d0,320(sp)
  Copperlist1 = ClBuild();
    2878:	4eba fc56      	jsr 24d0 <ClBuild>(pc)
    287c:	23c0 004d 2c04 	move.l d0,4d2c04 <Copperlist1>
  DrawCopper = Copperlist1;
    2882:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    2888:	23c0 004d 2c14 	move.l d0,4d2c14 <DrawCopper>
  Copperlist2 = ClBuild();
    288e:	4eba fc40      	jsr 24d0 <ClBuild>(pc)
    2892:	23c0 004d 2c08 	move.l d0,4d2c08 <Copperlist2>
  ViewCopper = Copperlist2;
    2898:	2039 004d 2c08 	move.l 4d2c08 <Copperlist2>,d0
    289e:	23c0 004d 2c18 	move.l d0,4d2c18 <ViewCopper>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    28a4:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    28aa:	4878 0010      	pea 10 <_start+0x10>
    28ae:	4879 0000 a68c 	pea a68c <ClsSprites>
    28b4:	42a7           	clr.l -(sp)
    28b6:	2f00           	move.l d0,-(sp)
    28b8:	4eba ff10      	jsr 27ca <TestCopperlistBatch>(pc)
    28bc:	4fef 0010      	lea 16(sp),sp
    28c0:	4a80           	tst.l d0
    28c2:	6642           	bne.s 2906 <TestCopperList+0xe0>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    28c4:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    28ca:	2c40           	movea.l d0,a6
    28cc:	4eae ffc4      	jsr -60(a6)
    28d0:	2f40 013c      	move.l d0,316(sp)
    28d4:	202f 013c      	move.l 316(sp),d0
    28d8:	2f40 0138      	move.l d0,312(sp)
    28dc:	2f7c 0000 7610 	move.l #30224,308(sp)
    28e2:	0134 
    28e4:	702c           	moveq #44,d0
    28e6:	2f40 0130      	move.l d0,304(sp)
    28ea:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    28f0:	2c40           	movea.l d0,a6
    28f2:	222f 0138      	move.l 312(sp),d1
    28f6:	242f 0134      	move.l 308(sp),d2
    28fa:	262f 0130      	move.l 304(sp),d3
    28fe:	4eae ffd0      	jsr -48(a6)
    2902:	2f40 012c      	move.l d0,300(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2906:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    290c:	4878 000c      	pea c <_start+0xc>
    2910:	4879 0000 a6cc 	pea a6cc <ClScreen>
    2916:	4878 0010      	pea 10 <_start+0x10>
    291a:	2f00           	move.l d0,-(sp)
    291c:	4eba feac      	jsr 27ca <TestCopperlistBatch>(pc)
    2920:	4fef 0010      	lea 16(sp),sp
    2924:	4a80           	tst.l d0
    2926:	6642           	bne.s 296a <TestCopperList+0x144>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    2928:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    292e:	2c40           	movea.l d0,a6
    2930:	4eae ffc4      	jsr -60(a6)
    2934:	2f40 0128      	move.l d0,296(sp)
    2938:	202f 0128      	move.l 296(sp),d0
    293c:	2f40 0124      	move.l d0,292(sp)
    2940:	2f7c 0000 7646 	move.l #30278,288(sp)
    2946:	0120 
    2948:	7036           	moveq #54,d0
    294a:	2f40 011c      	move.l d0,284(sp)
    294e:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2954:	2c40           	movea.l d0,a6
    2956:	222f 0124      	move.l 292(sp),d1
    295a:	242f 0120      	move.l 288(sp),d2
    295e:	262f 011c      	move.l 284(sp),d3
    2962:	4eae ffd0      	jsr -48(a6)
    2966:	2f40 0118      	move.l d0,280(sp)
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
    296a:	23fc 0004 0000 	move.l #262144,4d2c0c <DrawBuffer>
    2970:	004d 2c0c 
  ViewBuffer = (ULONG *)0x50000;
    2974:	23fc 0005 0000 	move.l #327680,4d2c10 <ViewBuffer>
    297a:	004d 2c10 
  
  SetBplPointers();
    297e:	4eba d7c2      	jsr 142 <SetBplPointers>(pc)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    2982:	2039 004d 2c0c 	move.l 4d2c0c <DrawBuffer>,d0
    2988:	0c80 0005 0000 	cmpi.l #327680,d0
    298e:	660e           	bne.s 299e <TestCopperList+0x178>
    2990:	2039 004d 2c10 	move.l 4d2c10 <ViewBuffer>,d0
    2996:	0c80 0004 0000 	cmpi.l #262144,d0
    299c:	6742           	beq.s 29e0 <TestCopperList+0x1ba>
    Write( Output(), 
    299e:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    29a4:	2c40           	movea.l d0,a6
    29a6:	4eae ffc4      	jsr -60(a6)
    29aa:	2f40 0114      	move.l d0,276(sp)
    29ae:	202f 0114      	move.l 276(sp),d0
    29b2:	2f40 0110      	move.l d0,272(sp)
    29b6:	2f7c 0000 7e8b 	move.l #32395,268(sp)
    29bc:	010c 
    29be:	703b           	moveq #59,d0
    29c0:	2f40 0108      	move.l d0,264(sp)
    29c4:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    29ca:	2c40           	movea.l d0,a6
    29cc:	222f 0110      	move.l 272(sp),d1
    29d0:	242f 010c      	move.l 268(sp),d2
    29d4:	262f 0108      	move.l 264(sp),d3
    29d8:	4eae ffd0      	jsr -48(a6)
    29dc:	2f40 0104      	move.l d0,260(sp)
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    29e0:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    29e6:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    29ec:	4878 001c      	pea 1c <_start+0x1c>
    29f0:	2f00           	move.l d0,-(sp)
    29f2:	4eba fe14      	jsr 2808 <TestCopperlistPos>(pc)
    29f6:	4fef 000c      	lea 12(sp),sp
    29fa:	4a80           	tst.l d0
    29fc:	6642           	bne.s 2a40 <TestCopperList+0x21a>
    Write(Output(), 
    29fe:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2a04:	2c40           	movea.l d0,a6
    2a06:	4eae ffc4      	jsr -60(a6)
    2a0a:	2f40 0100      	move.l d0,256(sp)
    2a0e:	202f 0100      	move.l 256(sp),d0
    2a12:	2f40 00fc      	move.l d0,252(sp)
    2a16:	2f7c 0000 7ec7 	move.l #32455,248(sp)
    2a1c:	00f8 
    2a1e:	703c           	moveq #60,d0
    2a20:	2f40 00f4      	move.l d0,244(sp)
    2a24:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2a2a:	2c40           	movea.l d0,a6
    2a2c:	222f 00fc      	move.l 252(sp),d1
    2a30:	242f 00f8      	move.l 248(sp),d2
    2a34:	262f 00f4      	move.l 244(sp),d3
    2a38:	4eae ffd0      	jsr -48(a6)
    2a3c:	2f40 00f0      	move.l d0,240(sp)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    2a40:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    2a46:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    2a4c:	4878 001d      	pea 1d <_start+0x1d>
    2a50:	2f00           	move.l d0,-(sp)
    2a52:	4eba fdb4      	jsr 2808 <TestCopperlistPos>(pc)
    2a56:	4fef 000c      	lea 12(sp),sp
    2a5a:	4a80           	tst.l d0
    2a5c:	6642           	bne.s 2aa0 <TestCopperList+0x27a>
    Write(Output(), 
    2a5e:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2a64:	2c40           	movea.l d0,a6
    2a66:	4eae ffc4      	jsr -60(a6)
    2a6a:	2f40 00ec      	move.l d0,236(sp)
    2a6e:	202f 00ec      	move.l 236(sp),d0
    2a72:	2f40 00e8      	move.l d0,232(sp)
    2a76:	2f7c 0000 7f04 	move.l #32516,228(sp)
    2a7c:	00e4 
    2a7e:	703c           	moveq #60,d0
    2a80:	2f40 00e0      	move.l d0,224(sp)
    2a84:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2a8a:	2c40           	movea.l d0,a6
    2a8c:	222f 00e8      	move.l 232(sp),d1
    2a90:	242f 00e4      	move.l 228(sp),d2
    2a94:	262f 00e0      	move.l 224(sp),d3
    2a98:	4eae ffd0      	jsr -48(a6)
    2a9c:	2f40 00dc      	move.l d0,220(sp)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2aa0:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    2aa6:	4878 0002      	pea 2 <_start+0x2>
    2aaa:	4879 0000 a60c 	pea a60c <ClColor>
    2ab0:	4878 001e      	pea 1e <_start+0x1e>
    2ab4:	2f00           	move.l d0,-(sp)
    2ab6:	4eba fd12      	jsr 27ca <TestCopperlistBatch>(pc)
    2aba:	4fef 0010      	lea 16(sp),sp
    2abe:	4a80           	tst.l d0
    2ac0:	6642           	bne.s 2b04 <TestCopperList+0x2de>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2ac2:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2ac8:	2c40           	movea.l d0,a6
    2aca:	4eae ffc4      	jsr -60(a6)
    2ace:	2f40 00d8      	move.l d0,216(sp)
    2ad2:	202f 00d8      	move.l 216(sp),d0
    2ad6:	2f40 00d4      	move.l d0,212(sp)
    2ada:	2f7c 0000 767d 	move.l #30333,208(sp)
    2ae0:	00d0 
    2ae2:	7021           	moveq #33,d0
    2ae4:	2f40 00cc      	move.l d0,204(sp)
    2ae8:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2aee:	2c40           	movea.l d0,a6
    2af0:	222f 00d4      	move.l 212(sp),d1
    2af4:	242f 00d0      	move.l 208(sp),d2
    2af8:	262f 00cc      	move.l 204(sp),d3
    2afc:	4eae ffd0      	jsr -48(a6)
    2b00:	2f40 00c8      	move.l d0,200(sp)

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2b04:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    2b0a:	4878 fffe      	pea fffffffe <_end+0xffb2d38a>
    2b0e:	4878 0020      	pea 20 <_start+0x20>
    2b12:	2f00           	move.l d0,-(sp)
    2b14:	4eba fcf2      	jsr 2808 <TestCopperlistPos>(pc)
    2b18:	4fef 000c      	lea 12(sp),sp
    2b1c:	4a80           	tst.l d0
    2b1e:	6642           	bne.s 2b62 <TestCopperList+0x33c>
    Write(Output(), "Copperlist End not correctly set.\n", 34);
    2b20:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2b26:	2c40           	movea.l d0,a6
    2b28:	4eae ffc4      	jsr -60(a6)
    2b2c:	2f40 00c4      	move.l d0,196(sp)
    2b30:	202f 00c4      	move.l 196(sp),d0
    2b34:	2f40 00c0      	move.l d0,192(sp)
    2b38:	2f7c 0000 769f 	move.l #30367,188(sp)
    2b3e:	00bc 
    2b40:	7022           	moveq #34,d0
    2b42:	2f40 00b8      	move.l d0,184(sp)
    2b46:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2b4c:	2c40           	movea.l d0,a6
    2b4e:	222f 00c0      	move.l 192(sp),d1
    2b52:	242f 00bc      	move.l 188(sp),d2
    2b56:	262f 00b8      	move.l 184(sp),d3
    2b5a:	4eae ffd0      	jsr -48(a6)
    2b5e:	2f40 00b4      	move.l d0,180(sp)
  
  SwapCl();
    2b62:	4eba d63c      	jsr 1a0 <SwapCl>(pc)
  
  if( DrawCopper != Copperlist2)
    2b66:	2239 004d 2c14 	move.l 4d2c14 <DrawCopper>,d1
    2b6c:	2039 004d 2c08 	move.l 4d2c08 <Copperlist2>,d0
    2b72:	b081           	cmp.l d1,d0
    2b74:	6742           	beq.s 2bb8 <TestCopperList+0x392>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
    2b76:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2b7c:	2c40           	movea.l d0,a6
    2b7e:	4eae ffc4      	jsr -60(a6)
    2b82:	2f40 00b0      	move.l d0,176(sp)
    2b86:	202f 00b0      	move.l 176(sp),d0
    2b8a:	2f40 00ac      	move.l d0,172(sp)
    2b8e:	2f7c 0000 7f41 	move.l #32577,168(sp)
    2b94:	00a8 
    2b96:	7015           	moveq #21,d0
    2b98:	2f40 00a4      	move.l d0,164(sp)
    2b9c:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2ba2:	2c40           	movea.l d0,a6
    2ba4:	222f 00ac      	move.l 172(sp),d1
    2ba8:	242f 00a8      	move.l 168(sp),d2
    2bac:	262f 00a4      	move.l 164(sp),d3
    2bb0:	4eae ffd0      	jsr -48(a6)
    2bb4:	2f40 00a0      	move.l d0,160(sp)

  
  PrepareDisplay();
    2bb8:	4eba fa98      	jsr 2652 <PrepareDisplay>(pc)
  if( DrawBuffer != Bitplane2) 
    2bbc:	2239 004d 2c0c 	move.l 4d2c0c <DrawBuffer>,d1
    2bc2:	2039 004d 2c00 	move.l 4d2c00 <Bitplane2>,d0
    2bc8:	b081           	cmp.l d1,d0
    2bca:	6742           	beq.s 2c0e <TestCopperList+0x3e8>
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
    2bcc:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2bd2:	2c40           	movea.l d0,a6
    2bd4:	4eae ffc4      	jsr -60(a6)
    2bd8:	2f40 009c      	move.l d0,156(sp)
    2bdc:	202f 009c      	move.l 156(sp),d0
    2be0:	2f40 0098      	move.l d0,152(sp)
    2be4:	2f7c 0000 7f57 	move.l #32599,148(sp)
    2bea:	0094 
    2bec:	7037           	moveq #55,d0
    2bee:	2f40 0090      	move.l d0,144(sp)
    2bf2:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2bf8:	2c40           	movea.l d0,a6
    2bfa:	222f 0098      	move.l 152(sp),d1
    2bfe:	242f 0094      	move.l 148(sp),d2
    2c02:	262f 0090      	move.l 144(sp),d3
    2c06:	4eae ffd0      	jsr -48(a6)
    2c0a:	2f40 008c      	move.l d0,140(sp)
                                                                            55);
  if( DrawCopper != Copperlist2) 
    2c0e:	2239 004d 2c14 	move.l 4d2c14 <DrawCopper>,d1
    2c14:	2039 004d 2c08 	move.l 4d2c08 <Copperlist2>,d0
    2c1a:	b081           	cmp.l d1,d0
    2c1c:	6742           	beq.s 2c60 <TestCopperList+0x43a>
    Write( Output(), 
    2c1e:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2c24:	2c40           	movea.l d0,a6
    2c26:	4eae ffc4      	jsr -60(a6)
    2c2a:	2f40 0088      	move.l d0,136(sp)
    2c2e:	202f 0088      	move.l 136(sp),d0
    2c32:	2f40 0084      	move.l d0,132(sp)
    2c36:	2f7c 0000 7f8f 	move.l #32655,128(sp)
    2c3c:	0080 
    2c3e:	7039           	moveq #57,d0
    2c40:	2f40 007c      	move.l d0,124(sp)
    2c44:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2c4a:	2c40           	movea.l d0,a6
    2c4c:	222f 0084      	move.l 132(sp),d1
    2c50:	242f 0080      	move.l 128(sp),d2
    2c54:	262f 007c      	move.l 124(sp),d3
    2c58:	4eae ffd0      	jsr -48(a6)
    2c5c:	2f40 0078      	move.l d0,120(sp)
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
    2c60:	2239 004d 2c10 	move.l 4d2c10 <ViewBuffer>,d1
    2c66:	2039 004d 2bfc 	move.l 4d2bfc <Bitplane1>,d0
    2c6c:	b081           	cmp.l d1,d0
    2c6e:	6742           	beq.s 2cb2 <TestCopperList+0x48c>
    Write( Output(), 
    2c70:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2c76:	2c40           	movea.l d0,a6
    2c78:	4eae ffc4      	jsr -60(a6)
    2c7c:	2f40 0074      	move.l d0,116(sp)
    2c80:	202f 0074      	move.l 116(sp),d0
    2c84:	2f40 0070      	move.l d0,112(sp)
    2c88:	2f7c 0000 7fc9 	move.l #32713,108(sp)
    2c8e:	006c 
    2c90:	7038           	moveq #56,d0
    2c92:	2f40 0068      	move.l d0,104(sp)
    2c96:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2c9c:	2c40           	movea.l d0,a6
    2c9e:	222f 0070      	move.l 112(sp),d1
    2ca2:	242f 006c      	move.l 108(sp),d2
    2ca6:	262f 0068      	move.l 104(sp),d3
    2caa:	4eae ffd0      	jsr -48(a6)
    2cae:	2f40 0064      	move.l d0,100(sp)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
    2cb2:	2239 004d 2c18 	move.l 4d2c18 <ViewCopper>,d1
    2cb8:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    2cbe:	b081           	cmp.l d1,d0
    2cc0:	6742           	beq.s 2d04 <TestCopperList+0x4de>
    Write( Output(), 
    2cc2:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2cc8:	2c40           	movea.l d0,a6
    2cca:	4eae ffc4      	jsr -60(a6)
    2cce:	2f40 0060      	move.l d0,96(sp)
    2cd2:	202f 0060      	move.l 96(sp),d0
    2cd6:	2f40 005c      	move.l d0,92(sp)
    2cda:	2f7c 0000 8002 	move.l #32770,88(sp)
    2ce0:	0058 
    2ce2:	703a           	moveq #58,d0
    2ce4:	2f40 0054      	move.l d0,84(sp)
    2ce8:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2cee:	2c40           	movea.l d0,a6
    2cf0:	222f 005c      	move.l 92(sp),d1
    2cf4:	242f 0058      	move.l 88(sp),d2
    2cf8:	262f 0054      	move.l 84(sp),d3
    2cfc:	4eae ffd0      	jsr -48(a6)
    2d00:	2f40 0050      	move.l d0,80(sp)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
    2d04:	4eba d43c      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2d08:	4eba d496      	jsr 1a0 <SwapCl>(pc)
  UWORD *copword = ViewCopper;
    2d0c:	2f79 004d 2c18 	move.l 4d2c18 <ViewCopper>,76(sp)
    2d12:	004c 
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2d14:	307c 0076      	movea.w #118,a0
    2d18:	d1ef 004c      	adda.l 76(sp),a0
    2d1c:	3010           	move.w (a0),d0
    2d1e:	7200           	moveq #0,d1
    2d20:	3200           	move.w d0,d1
    2d22:	307c 0072      	movea.w #114,a0
    2d26:	d1ef 004c      	adda.l 76(sp),a0
    2d2a:	3010           	move.w (a0),d0
    2d2c:	3000           	move.w d0,d0
    2d2e:	0280 0000 ffff 	andi.l #65535,d0
    2d34:	4840           	swap d0
    2d36:	4240           	clr.w d0
    2d38:	d081           	add.l d1,d0
    2d3a:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2d3e:	2039 004d 2c00 	move.l 4d2c00 <Bitplane2>,d0
    2d44:	b0af 0048      	cmp.l 72(sp),d0
    2d48:	6742           	beq.s 2d8c <TestCopperList+0x566>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2d4a:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2d50:	2c40           	movea.l d0,a6
    2d52:	4eae ffc4      	jsr -60(a6)
    2d56:	2f40 0044      	move.l d0,68(sp)
    2d5a:	202f 0044      	move.l 68(sp),d0
    2d5e:	2f40 0040      	move.l d0,64(sp)
    2d62:	2f7c 0000 803d 	move.l #32829,60(sp)
    2d68:	003c 
    2d6a:	7048           	moveq #72,d0
    2d6c:	2f40 0038      	move.l d0,56(sp)
    2d70:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2d76:	2c40           	movea.l d0,a6
    2d78:	222f 0040      	move.l 64(sp),d1
    2d7c:	242f 003c      	move.l 60(sp),d2
    2d80:	262f 0038      	move.l 56(sp),d3
    2d84:	4eae ffd0      	jsr -48(a6)
    2d88:	2f40 0034      	move.l d0,52(sp)
                                                   " after first frame.\n", 72);
  SetBplPointers();
    2d8c:	4eba d3b4      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2d90:	4eba d40e      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2d94:	2f79 004d 2c18 	move.l 4d2c18 <ViewCopper>,76(sp)
    2d9a:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2d9c:	307c 0076      	movea.w #118,a0
    2da0:	d1ef 004c      	adda.l 76(sp),a0
    2da4:	3010           	move.w (a0),d0
    2da6:	7200           	moveq #0,d1
    2da8:	3200           	move.w d0,d1
    2daa:	307c 0072      	movea.w #114,a0
    2dae:	d1ef 004c      	adda.l 76(sp),a0
    2db2:	3010           	move.w (a0),d0
    2db4:	3000           	move.w d0,d0
    2db6:	0280 0000 ffff 	andi.l #65535,d0
    2dbc:	4840           	swap d0
    2dbe:	4240           	clr.w d0
    2dc0:	d081           	add.l d1,d0
    2dc2:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane1) 
    2dc6:	2039 004d 2bfc 	move.l 4d2bfc <Bitplane1>,d0
    2dcc:	b0af 0048      	cmp.l 72(sp),d0
    2dd0:	6742           	beq.s 2e14 <TestCopperList+0x5ee>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
    2dd2:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2dd8:	2c40           	movea.l d0,a6
    2dda:	4eae ffc4      	jsr -60(a6)
    2dde:	2f40 0030      	move.l d0,48(sp)
    2de2:	202f 0030      	move.l 48(sp),d0
    2de6:	2f40 002c      	move.l d0,44(sp)
    2dea:	2f7c 0000 8086 	move.l #32902,40(sp)
    2df0:	0028 
    2df2:	7049           	moveq #73,d0
    2df4:	2f40 0024      	move.l d0,36(sp)
    2df8:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2dfe:	2c40           	movea.l d0,a6
    2e00:	222f 002c      	move.l 44(sp),d1
    2e04:	242f 0028      	move.l 40(sp),d2
    2e08:	262f 0024      	move.l 36(sp),d3
    2e0c:	4eae ffd0      	jsr -48(a6)
    2e10:	2f40 0020      	move.l d0,32(sp)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
    2e14:	4eba d32c      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2e18:	4eba d386      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2e1c:	2f79 004d 2c18 	move.l 4d2c18 <ViewCopper>,76(sp)
    2e22:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2e24:	307c 0076      	movea.w #118,a0
    2e28:	d1ef 004c      	adda.l 76(sp),a0
    2e2c:	3010           	move.w (a0),d0
    2e2e:	7200           	moveq #0,d1
    2e30:	3200           	move.w d0,d1
    2e32:	307c 0072      	movea.w #114,a0
    2e36:	d1ef 004c      	adda.l 76(sp),a0
    2e3a:	3010           	move.w (a0),d0
    2e3c:	3000           	move.w d0,d0
    2e3e:	0280 0000 ffff 	andi.l #65535,d0
    2e44:	4840           	swap d0
    2e46:	4240           	clr.w d0
    2e48:	d081           	add.l d1,d0
    2e4a:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2e4e:	2039 004d 2c00 	move.l 4d2c00 <Bitplane2>,d0
    2e54:	b0af 0048      	cmp.l 72(sp),d0
    2e58:	6742           	beq.s 2e9c <TestCopperList+0x676>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2e5a:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2e60:	2c40           	movea.l d0,a6
    2e62:	4eae ffc4      	jsr -60(a6)
    2e66:	2f40 001c      	move.l d0,28(sp)
    2e6a:	202f 001c      	move.l 28(sp),d0
    2e6e:	2f40 0018      	move.l d0,24(sp)
    2e72:	2f7c 0000 80d0 	move.l #32976,20(sp)
    2e78:	0014 
    2e7a:	7048           	moveq #72,d0
    2e7c:	2f40 0010      	move.l d0,16(sp)
    2e80:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2e86:	2c40           	movea.l d0,a6
    2e88:	222f 0018      	move.l 24(sp),d1
    2e8c:	242f 0014      	move.l 20(sp),d2
    2e90:	262f 0010      	move.l 16(sp),d3
    2e94:	4eae ffd0      	jsr -48(a6)
    2e98:	2f40 000c      	move.l d0,12(sp)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
    2e9c:	2f3c 0000 c800 	move.l #51200,-(sp)
    2ea2:	4878 0084      	pea 84 <_start+0x84>
    2ea6:	4eba d238      	jsr e0 <FreeDisplay>(pc)
    2eaa:	508f           	addq.l #8,sp
    2eac:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2eb0:	4fef 0148      	lea 328(sp),sp
    2eb4:	4e75           	rts

00002eb6 <RunTests>:
#include "runtests.h"
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    2eb6:	4eba f96e      	jsr 2826 <TestCopperList>(pc)
    ZoomTest();
    2eba:	4eba 0004      	jsr 2ec0 <ZoomTest>(pc)
    //SwScrollerTest();
    2ebe:	4e75           	rts

00002ec0 <ZoomTest>:
#include "zoomtest2.h"

ULONG Cl102ZoomTest[137];

void ZoomTest() {
  TestZoomSpeed();
    2ec0:	4eba 0046      	jsr 2f08 <TestZoomSpeed>(pc)
  ZoomTestDisplay();
    2ec4:	4eba 00e2      	jsr 2fa8 <ZoomTestDisplay>(pc)
  TestBlitleftOfZoom();
    2ec8:	4eba 05a8      	jsr 3472 <TestBlitleftOfZoom>(pc)
  TestCopyWord();
    2ecc:	4eba 0838      	jsr 3706 <TestCopyWord>(pc)
  TestZoom4Picture();
    2ed0:	4eba 0e12      	jsr 3ce4 <TestZoom4Picture>(pc)
  TestZoom4PictureOn5Planes();
    2ed4:	4eba 0b22      	jsr 39f8 <TestZoom4PictureOn5Planes>(pc)
  Test_Zoom2();
    2ed8:	4eba f012      	jsr 1eec <Test_Zoom2>(pc)
  c2p1x1_8_c5_gen_init( 320, 256, 0, 0, 0, 0);
    2edc:	42a7           	clr.l -(sp)
    2ede:	42a7           	clr.l -(sp)
    2ee0:	42a7           	clr.l -(sp)
    2ee2:	42a7           	clr.l -(sp)
    2ee4:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2ee8:	4878 0140      	pea 140 <FreeDisplay+0x60>
    2eec:	4eb9 0000 7218 	jsr 7218 <c2p1x1_8_c5_gen_init>
    2ef2:	4fef 0018      	lea 24(sp),sp
  c2p1x1_8_c5_gen( 0x100, 0x200);
    2ef6:	4878 0200      	pea 200 <Utils_CopyMem+0x22>
    2efa:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2efe:	4eb9 0000 7294 	jsr 7294 <c2p1x1_8_c5_gen>
    2f04:	508f           	addq.l #8,sp
}
    2f06:	4e75           	rts

00002f08 <TestZoomSpeed>:

int Counter4Frames;

void TestZoomSpeed() {
    2f08:	4fef ffe8      	lea -24(sp),sp
    2f0c:	48e7 3002      	movem.l d2-d3/a6,-(sp)

 	TakeSystem();
    2f10:	4eba d668      	jsr 57a <TakeSystem>(pc)
	WaitVbl();
    2f14:	4eba d61a      	jsr 530 <WaitVbl>(pc)
  //             fedcba9876543210
  //hw->dmacon = 0x8def;

  hw->dmacon = DMAF_SETCLR | DMAF_AUDIO | DMAF_BLITTER | DMAF_RASTER 
    2f18:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    2f1e:	317c 87cf 0096 	move.w #-30769,150(a0)
                                    | DMAF_COPPER | DMAF_MASTER | DMAF_BLITHOG;
   //0b1000011111100000;
  
  //hw->dmacon = 0b1000011111111111;
	hw->intena = (1 << INTB_SETCLR) | (1 << INTB_INTEN) | (1 << INTB_VERTB);
    2f24:	2079 004d 2c1c 	movea.l 4d2c1c <hw>,a0
    2f2a:	317c c020 009a 	move.w #-16352,154(a0)
  
  Zoom_InitRun(); 
    2f30:	4eba e14e      	jsr 1080 <Zoom_InitRun>(pc)

  int success = 1;
    2f34:	7001           	moveq #1,d0
    2f36:	2f40 0020      	move.l d0,32(sp)
  RunFrame();
    2f3a:	4eba d3c0      	jsr 2fc <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    2f3e:	3039 004d 2c5c 	move.w 4d2c5c <Zoom_Counter>,d0
    2f44:	0c40 0008      	cmpi.w #8,d0
    2f48:	6304           	bls.s 2f4e <TestZoomSpeed+0x46>
    2f4a:	42af 0020      	clr.l 32(sp)
    
  Zoom_Dealloc();
    2f4e:	4eba e3c8      	jsr 1318 <Zoom_Dealloc>(pc)
  FreeSystem();
    2f52:	4eba d63c      	jsr 590 <FreeSystem>(pc)

  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    2f56:	4aaf 0020      	tst.l 32(sp)
    2f5a:	6642           	bne.s 2f9e <TestZoomSpeed+0x96>
    2f5c:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2f62:	2c40           	movea.l d0,a6
    2f64:	4eae ffc4      	jsr -60(a6)
    2f68:	2f40 001c      	move.l d0,28(sp)
    2f6c:	202f 001c      	move.l 28(sp),d0
    2f70:	2f40 0018      	move.l d0,24(sp)
    2f74:	2f7c 0000 8119 	move.l #33049,20(sp)
    2f7a:	0014 
    2f7c:	701c           	moveq #28,d0
    2f7e:	2f40 0010      	move.l d0,16(sp)
    2f82:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2f88:	2c40           	movea.l d0,a6
    2f8a:	222f 0018      	move.l 24(sp),d1
    2f8e:	242f 0014      	move.l 20(sp),d2
    2f92:	262f 0010      	move.l 16(sp),d3
    2f96:	4eae ffd0      	jsr -48(a6)
    2f9a:	2f40 000c      	move.l d0,12(sp)

  //AddIntServer(INTB_VERTB, vbint);
  //RemIntServer(INTB_VERTB, vbint);
  
}
    2f9e:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2fa2:	4fef 0018      	lea 24(sp),sp
    2fa6:	4e75           	rts

00002fa8 <ZoomTestDisplay>:

void ZoomTestDisplay() {
    2fa8:	4fef ff38      	lea -200(sp),sp
    2fac:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Zoom_Init();
    2fb0:	4eba e476      	jsr 1428 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    2fb4:	4eba e80c      	jsr 17c2 <PrepareDisplayZoom>(pc)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2fb8:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    2fbe:	4878 0010      	pea 10 <_start+0x10>
    2fc2:	4879 0000 a68c 	pea a68c <ClsSprites>
    2fc8:	42a7           	clr.l -(sp)
    2fca:	2f00           	move.l d0,-(sp)
    2fcc:	4eba f7fc      	jsr 27ca <TestCopperlistBatch>(pc)
    2fd0:	4fef 0010      	lea 16(sp),sp
    2fd4:	4a80           	tst.l d0
    2fd6:	6642           	bne.s 301a <ZoomTestDisplay+0x72>
    Write( Output(), 
    2fd8:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    2fde:	2c40           	movea.l d0,a6
    2fe0:	4eae ffc4      	jsr -60(a6)
    2fe4:	2f40 00d0      	move.l d0,208(sp)
    2fe8:	202f 00d0      	move.l 208(sp),d0
    2fec:	2f40 00cc      	move.l d0,204(sp)
    2ff0:	2f7c 0000 8138 	move.l #33080,200(sp)
    2ff6:	00c8 
    2ff8:	7045           	moveq #69,d0
    2ffa:	2f40 00c4      	move.l d0,196(sp)
    2ffe:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3004:	2c40           	movea.l d0,a6
    3006:	222f 00cc      	move.l 204(sp),d1
    300a:	242f 00c8      	move.l 200(sp),d2
    300e:	262f 00c4      	move.l 196(sp),d3
    3012:	4eae ffd0      	jsr -48(a6)
    3016:	2f40 00c0      	move.l d0,192(sp)
       "ZoomCopperlist: Sprite section of copper starting on pos 0 messed up\n", 
                                                                            69);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    301a:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    3020:	4878 000c      	pea c <_start+0xc>
    3024:	4879 0000 a6cc 	pea a6cc <ClScreen>
    302a:	4878 0010      	pea 10 <_start+0x10>
    302e:	2f00           	move.l d0,-(sp)
    3030:	4eba f798      	jsr 27ca <TestCopperlistBatch>(pc)
    3034:	4fef 0010      	lea 16(sp),sp
    3038:	4a80           	tst.l d0
    303a:	6642           	bne.s 307e <ZoomTestDisplay+0xd6>
    Write( Output(), 
    303c:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3042:	2c40           	movea.l d0,a6
    3044:	4eae ffc4      	jsr -60(a6)
    3048:	2f40 00bc      	move.l d0,188(sp)
    304c:	202f 00bc      	move.l 188(sp),d0
    3050:	2f40 00b8      	move.l d0,184(sp)
    3054:	2f7c 0000 817e 	move.l #33150,180(sp)
    305a:	00b4 
    305c:	7046           	moveq #70,d0
    305e:	2f40 00b0      	move.l d0,176(sp)
    3062:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3068:	2c40           	movea.l d0,a6
    306a:	222f 00b8      	move.l 184(sp),d1
    306e:	242f 00b4      	move.l 180(sp),d2
    3072:	262f 00b0      	move.l 176(sp),d3
    3076:	4eae ffd0      	jsr -48(a6)
    307a:	2f40 00ac      	move.l d0,172(sp)
      "ZoomCopperlist: Screen section of copper starting on pos 16 messed up\n",
                                                                            70);
  DrawBuffer = (ULONG *) 0x40000;
    307e:	23fc 0004 0000 	move.l #262144,4d2c0c <DrawBuffer>
    3084:	004d 2c0c 
  ViewBuffer = (ULONG *) 0x50000;
    3088:	23fc 0005 0000 	move.l #327680,4d2c10 <ViewBuffer>
    308e:	004d 2c10 
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    3092:	2239 004d 2c14 	move.l 4d2c14 <DrawCopper>,d1
    3098:	2039 004d 2c0c 	move.l 4d2c0c <DrawBuffer>,d0
    309e:	2f01           	move.l d1,-(sp)
    30a0:	2f00           	move.l d0,-(sp)
    30a2:	4eba ed78      	jsr 1e1c <Zoom_SetBplPointers>(pc)
    30a6:	508f           	addq.l #8,sp
  Zoom_SwapBuffers( 0);
    30a8:	42a7           	clr.l -(sp)
    30aa:	4eba ee08      	jsr 1eb4 <Zoom_SwapBuffers>(pc)
    30ae:	588f           	addq.l #4,sp
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    30b0:	2039 004d 2c0c 	move.l 4d2c0c <DrawBuffer>,d0
    30b6:	0c80 0005 0000 	cmpi.l #327680,d0
    30bc:	660e           	bne.s 30cc <ZoomTestDisplay+0x124>
    30be:	2039 004d 2c10 	move.l 4d2c10 <ViewBuffer>,d0
    30c4:	0c80 0004 0000 	cmpi.l #262144,d0
    30ca:	6742           	beq.s 310e <ZoomTestDisplay+0x166>
    Write( Output(), 
    30cc:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    30d2:	2c40           	movea.l d0,a6
    30d4:	4eae ffc4      	jsr -60(a6)
    30d8:	2f40 00a8      	move.l d0,168(sp)
    30dc:	202f 00a8      	move.l 168(sp),d0
    30e0:	2f40 00a4      	move.l d0,164(sp)
    30e4:	2f7c 0000 81c5 	move.l #33221,160(sp)
    30ea:	00a0 
    30ec:	703b           	moveq #59,d0
    30ee:	2f40 009c      	move.l d0,156(sp)
    30f2:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    30f8:	2c40           	movea.l d0,a6
    30fa:	222f 00a4      	move.l 164(sp),d1
    30fe:	242f 00a0      	move.l 160(sp),d2
    3102:	262f 009c      	move.l 156(sp),d3
    3106:	4eae ffd0      	jsr -48(a6)
    310a:	2f40 0098      	move.l d0,152(sp)
            "ZoomCopperlist: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    310e:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    3114:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    311a:	4878 001c      	pea 1c <_start+0x1c>
    311e:	2f00           	move.l d0,-(sp)
    3120:	4eba f6e6      	jsr 2808 <TestCopperlistPos>(pc)
    3124:	4fef 000c      	lea 12(sp),sp
    3128:	4a80           	tst.l d0
    312a:	6642           	bne.s 316e <ZoomTestDisplay+0x1c6>
    Write(Output(), 
    312c:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3132:	2c40           	movea.l d0,a6
    3134:	4eae ffc4      	jsr -60(a6)
    3138:	2f40 0094      	move.l d0,148(sp)
    313c:	202f 0094      	move.l 148(sp),d0
    3140:	2f40 0090      	move.l d0,144(sp)
    3144:	2f7c 0000 8201 	move.l #33281,140(sp)
    314a:	008c 
    314c:	703c           	moveq #60,d0
    314e:	2f40 0088      	move.l d0,136(sp)
    3152:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3158:	2c40           	movea.l d0,a6
    315a:	222f 0090      	move.l 144(sp),d1
    315e:	242f 008c      	move.l 140(sp),d2
    3162:	262f 0088      	move.l 136(sp),d3
    3166:	4eae ffd0      	jsr -48(a6)
    316a:	2f40 0084      	move.l d0,132(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    316e:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    3174:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    317a:	4878 001d      	pea 1d <_start+0x1d>
    317e:	2f00           	move.l d0,-(sp)
    3180:	4eba f686      	jsr 2808 <TestCopperlistPos>(pc)
    3184:	4fef 000c      	lea 12(sp),sp
    3188:	4a80           	tst.l d0
    318a:	6642           	bne.s 31ce <ZoomTestDisplay+0x226>
    Write(Output(), 
    318c:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3192:	2c40           	movea.l d0,a6
    3194:	4eae ffc4      	jsr -60(a6)
    3198:	2f40 0080      	move.l d0,128(sp)
    319c:	202f 0080      	move.l 128(sp),d0
    31a0:	2f40 007c      	move.l d0,124(sp)
    31a4:	2f7c 0000 823e 	move.l #33342,120(sp)
    31aa:	0078 
    31ac:	703c           	moveq #60,d0
    31ae:	2f40 0074      	move.l d0,116(sp)
    31b2:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    31b8:	2c40           	movea.l d0,a6
    31ba:	222f 007c      	move.l 124(sp),d1
    31be:	242f 0078      	move.l 120(sp),d2
    31c2:	262f 0074      	move.l 116(sp),d3
    31c6:	4eae ffd0      	jsr -48(a6)
    31ca:	2f40 0070      	move.l d0,112(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1pl should be 00f4\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    31ce:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    31d4:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    31da:	4878 001e      	pea 1e <_start+0x1e>
    31de:	2f00           	move.l d0,-(sp)
    31e0:	4eba f626      	jsr 2808 <TestCopperlistPos>(pc)
    31e4:	4fef 000c      	lea 12(sp),sp
    31e8:	4a80           	tst.l d0
    31ea:	6642           	bne.s 322e <ZoomTestDisplay+0x286>
    Write(Output(), 
    31ec:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    31f2:	2c40           	movea.l d0,a6
    31f4:	4eae ffc4      	jsr -60(a6)
    31f8:	2f40 006c      	move.l d0,108(sp)
    31fc:	202f 006c      	move.l 108(sp),d0
    3200:	2f40 0068      	move.l d0,104(sp)
    3204:	2f7c 0000 827b 	move.l #33403,100(sp)
    320a:	0064 
    320c:	703c           	moveq #60,d0
    320e:	2f40 0060      	move.l d0,96(sp)
    3212:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3218:	2c40           	movea.l d0,a6
    321a:	222f 0068      	move.l 104(sp),d1
    321e:	242f 0064      	move.l 100(sp),d2
    3222:	262f 0060      	move.l 96(sp),d3
    3226:	4eae ffd0      	jsr -48(a6)
    322a:	2f40 005c      	move.l d0,92(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    322e:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    3234:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    323a:	4878 001f      	pea 1f <_start+0x1f>
    323e:	2f00           	move.l d0,-(sp)
    3240:	4eba f5c6      	jsr 2808 <TestCopperlistPos>(pc)
    3244:	4fef 000c      	lea 12(sp),sp
    3248:	4a80           	tst.l d0
    324a:	6642           	bne.s 328e <ZoomTestDisplay+0x2e6>
    Write(Output(), 
    324c:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3252:	2c40           	movea.l d0,a6
    3254:	4eae ffc4      	jsr -60(a6)
    3258:	2f40 0058      	move.l d0,88(sp)
    325c:	202f 0058      	move.l 88(sp),d0
    3260:	2f40 0054      	move.l d0,84(sp)
    3264:	2f7c 0000 82b8 	move.l #33464,80(sp)
    326a:	0050 
    326c:	703c           	moveq #60,d0
    326e:	2f40 004c      	move.l d0,76(sp)
    3272:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3278:	2c40           	movea.l d0,a6
    327a:	222f 0054      	move.l 84(sp),d1
    327e:	242f 0050      	move.l 80(sp),d2
    3282:	262f 004c      	move.l 76(sp),d3
    3286:	4eae ffd0      	jsr -48(a6)
    328a:	2f40 0048      	move.l d0,72(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2pl should be 0034\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    328e:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    3294:	4878 0020      	pea 20 <_start+0x20>
    3298:	4879 0000 a60c 	pea a60c <ClColor>
    329e:	4878 0026      	pea 26 <_start+0x26>
    32a2:	2f00           	move.l d0,-(sp)
    32a4:	4eba f524      	jsr 27ca <TestCopperlistBatch>(pc)
    32a8:	4fef 0010      	lea 16(sp),sp
    32ac:	4a80           	tst.l d0
    32ae:	6642           	bne.s 32f2 <ZoomTestDisplay+0x34a>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    32b0:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    32b6:	2c40           	movea.l d0,a6
    32b8:	4eae ffc4      	jsr -60(a6)
    32bc:	2f40 0044      	move.l d0,68(sp)
    32c0:	202f 0044      	move.l 68(sp),d0
    32c4:	2f40 0040      	move.l d0,64(sp)
    32c8:	2f7c 0000 82f5 	move.l #33525,60(sp)
    32ce:	003c 
    32d0:	7025           	moveq #37,d0
    32d2:	2f40 0038      	move.l d0,56(sp)
    32d6:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    32dc:	2c40           	movea.l d0,a6
    32de:	222f 0040      	move.l 64(sp),d1
    32e2:	242f 003c      	move.l 60(sp),d2
    32e6:	262f 0038      	move.l 56(sp),d3
    32ea:	4eae ffd0      	jsr -48(a6)
    32ee:	2f40 0034      	move.l d0,52(sp)

  /*if(  TestCopperlistBatch(  Copperlist1, 71, Cl102ZoomRepeat, 21) == 0)
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36); */
  
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    32f2:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    32f8:	2f00           	move.l d0,-(sp)
    32fa:	4878 000f      	pea f <_start+0xf>
    32fe:	4eba d10c      	jsr 40c <Zoom_Shrink102>(pc)
    3302:	508f           	addq.l #8,sp
  if( TestCopperListZoom102( Copperlist1, 73, Cl102ZoomTest) == 0)
    3304:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    330a:	4879 0000 b8a4 	pea b8a4 <Cl102ZoomTest>
    3310:	4878 0049      	pea 49 <_start+0x49>
    3314:	2f00           	move.l d0,-(sp)
    3316:	4eba 00c4      	jsr 33dc <TestCopperListZoom102>(pc)
    331a:	4fef 000c      	lea 12(sp),sp
    331e:	4a80           	tst.l d0
    3320:	6642           	bne.s 3364 <ZoomTestDisplay+0x3bc>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    3322:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3328:	2c40           	movea.l d0,a6
    332a:	4eae ffc4      	jsr -60(a6)
    332e:	2f40 0030      	move.l d0,48(sp)
    3332:	202f 0030      	move.l 48(sp),d0
    3336:	2f40 002c      	move.l d0,44(sp)
    333a:	2f7c 0000 831b 	move.l #33563,40(sp)
    3340:	0028 
    3342:	7025           	moveq #37,d0
    3344:	2f40 0024      	move.l d0,36(sp)
    3348:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    334e:	2c40           	movea.l d0,a6
    3350:	222f 002c      	move.l 44(sp),d1
    3354:	242f 0028      	move.l 40(sp),d2
    3358:	262f 0024      	move.l 36(sp),d3
    335c:	4eae ffd0      	jsr -48(a6)
    3360:	2f40 0020      	move.l d0,32(sp)

  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    3364:	2039 004d 2c04 	move.l 4d2c04 <Copperlist1>,d0
    336a:	4878 fffe      	pea fffffffe <_end+0xffb2d38a>
    336e:	4878 00bb      	pea bb <WaitBlt+0x7>
    3372:	2f00           	move.l d0,-(sp)
    3374:	4eba f492      	jsr 2808 <TestCopperlistPos>(pc)
    3378:	4fef 000c      	lea 12(sp),sp
    337c:	4a80           	tst.l d0
    337e:	6642           	bne.s 33c2 <ZoomTestDisplay+0x41a>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    3380:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3386:	2c40           	movea.l d0,a6
    3388:	4eae ffc4      	jsr -60(a6)
    338c:	2f40 001c      	move.l d0,28(sp)
    3390:	202f 001c      	move.l 28(sp),d0
    3394:	2f40 0018      	move.l d0,24(sp)
    3398:	2f7c 0000 8340 	move.l #33600,20(sp)
    339e:	0014 
    33a0:	7032           	moveq #50,d0
    33a2:	2f40 0010      	move.l d0,16(sp)
    33a6:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    33ac:	2c40           	movea.l d0,a6
    33ae:	222f 0018      	move.l 24(sp),d1
    33b2:	242f 0014      	move.l 20(sp),d2
    33b6:	262f 0010      	move.l 16(sp),d3
    33ba:	4eae ffd0      	jsr -48(a6)
    33be:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    33c2:	2f3c 0000 df20 	move.l #57120,-(sp)
    33c8:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    33cc:	4eba cd12      	jsr e0 <FreeDisplay>(pc)
    33d0:	508f           	addq.l #8,sp

}
    33d2:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    33d6:	4fef 00c8      	lea 200(sp),sp
    33da:	4e75           	rts

000033dc <TestCopperListZoom102>:

int TestCopperListZoom102( ULONG *cl2test, UWORD position, 
                                                           ULONG *template4cl) {
    33dc:	598f           	subq.l #4,sp
    33de:	202f 000c      	move.l 12(sp),d0
    33e2:	3000           	move.w d0,d0
    33e4:	3f40 0002      	move.w d0,2(sp)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    33e8:	7000           	moveq #0,d0
    33ea:	302f 0002      	move.w 2(sp),d0
    33ee:	4878 001c      	pea 1c <_start+0x1c>
    33f2:	2f2f 0014      	move.l 20(sp),-(sp)
    33f6:	2f00           	move.l d0,-(sp)
    33f8:	2f2f 0014      	move.l 20(sp),-(sp)
    33fc:	4eba f3cc      	jsr 27ca <TestCopperlistBatch>(pc)
    3400:	4fef 0010      	lea 16(sp),sp
    3404:	4a80           	tst.l d0
    3406:	6604           	bne.s 340c <TestCopperListZoom102+0x30>
    return 0;
    3408:	7000           	moveq #0,d0
    340a:	6062           	bra.s 346e <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    340c:	7078           	moveq #120,d0
    340e:	d0af 0010      	add.l 16(sp),d0
    3412:	7200           	moveq #0,d1
    3414:	322f 0002      	move.w 2(sp),d1
    3418:	307c 001e      	movea.w #30,a0
    341c:	d1c1           	adda.l d1,a0
    341e:	4878 0036      	pea 36 <_start+0x36>
    3422:	2f00           	move.l d0,-(sp)
    3424:	2f08           	move.l a0,-(sp)
    3426:	2f2f 0014      	move.l 20(sp),-(sp)
    342a:	4eba f39e      	jsr 27ca <TestCopperlistBatch>(pc)
    342e:	4fef 0010      	lea 16(sp),sp
    3432:	4a80           	tst.l d0
    3434:	6604           	bne.s 343a <TestCopperListZoom102+0x5e>
    return 0;
    3436:	7000           	moveq #0,d0
    3438:	6034           	bra.s 346e <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    343a:	202f 0010      	move.l 16(sp),d0
    343e:	0680 0000 0158 	addi.l #344,d0
    3444:	7200           	moveq #0,d1
    3446:	322f 0002      	move.w 2(sp),d1
    344a:	307c 0056      	movea.w #86,a0
    344e:	d1c1           	adda.l d1,a0
    3450:	4878 001c      	pea 1c <_start+0x1c>
    3454:	2f00           	move.l d0,-(sp)
    3456:	2f08           	move.l a0,-(sp)
    3458:	2f2f 0014      	move.l 20(sp),-(sp)
    345c:	4eba f36c      	jsr 27ca <TestCopperlistBatch>(pc)
    3460:	4fef 0010      	lea 16(sp),sp
    3464:	4a80           	tst.l d0
    3466:	6604           	bne.s 346c <TestCopperListZoom102+0x90>
    return 0;
    3468:	7000           	moveq #0,d0
    346a:	6002           	bra.s 346e <TestCopperListZoom102+0x92>
 
  return 1;
    346c:	7001           	moveq #1,d0
}
    346e:	588f           	addq.l #4,sp
    3470:	4e75           	rts

00003472 <TestBlitleftOfZoom>:

void TestBlitleftOfZoom() {
    3472:	4fef ff94      	lea -108(sp),sp
    3476:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Zoom_Init();
    347a:	4eba dfac      	jsr 1428 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    347e:	4eba e342      	jsr 17c2 <PrepareDisplayZoom>(pc)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    3482:	2f7c 0000 c800 	move.l #51200,116(sp)
    3488:	0074 
    348a:	7002           	moveq #2,d0
    348c:	2f40 0070      	move.l d0,112(sp)
    3490:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    3496:	2c40           	movea.l d0,a6
    3498:	202f 0074      	move.l 116(sp),d0
    349c:	222f 0070      	move.l 112(sp),d1
    34a0:	4eae ff3a      	jsr -198(a6)
    34a4:	2f40 006c      	move.l d0,108(sp)
    34a8:	202f 006c      	move.l 108(sp),d0
    34ac:	23c0 004d 2c4e 	move.l d0,4d2c4e <Zoom_Source>
  if( Zoom_Source == 0) {
    34b2:	2039 004d 2c4e 	move.l 4d2c4e <Zoom_Source>,d0
    34b8:	6646           	bne.s 3500 <TestBlitleftOfZoom+0x8e>
    Write(  Output(), 
    34ba:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    34c0:	2c40           	movea.l d0,a6
    34c2:	4eae ffc4      	jsr -60(a6)
    34c6:	2f40 001c      	move.l d0,28(sp)
    34ca:	202f 001c      	move.l 28(sp),d0
    34ce:	2f40 0018      	move.l d0,24(sp)
    34d2:	2f7c 0000 8373 	move.l #33651,20(sp)
    34d8:	0014 
    34da:	7236           	moveq #54,d1
    34dc:	2f41 0010      	move.l d1,16(sp)
    34e0:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    34e6:	2c40           	movea.l d0,a6
    34e8:	222f 0018      	move.l 24(sp),d1
    34ec:	242f 0014      	move.l 20(sp),d2
    34f0:	262f 0010      	move.l 16(sp),d3
    34f4:	4eae ffd0      	jsr -48(a6)
    34f8:	2f40 000c      	move.l d0,12(sp)
    34fc:	6000 01fe      	bra.w 36fc <TestBlitleftOfZoom+0x28a>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  
  UWORD *tstsource = Zoom_Source;
    3500:	2f79 004d 2c4e 	move.l 4d2c4e <Zoom_Source>,104(sp)
    3506:	0068 
  *tstsource++ = 0x0000;
    3508:	202f 0068      	move.l 104(sp),d0
    350c:	2200           	move.l d0,d1
    350e:	5481           	addq.l #2,d1
    3510:	2f41 0068      	move.l d1,104(sp)
    3514:	2040           	movea.l d0,a0
    3516:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    3518:	206f 0068      	movea.l 104(sp),a0
    351c:	30bc 0080      	move.w #128,(a0)
  tstsource += ZMLINESIZE/2-1;
    3520:	7028           	moveq #40,d0
    3522:	d1af 0068      	add.l d0,104(sp)
  *tstsource = 0x1000;
    3526:	206f 0068      	movea.l 104(sp),a0
    352a:	30bc 1000      	move.w #4096,(a0)
  tstsource++;
    352e:	54af 0068      	addq.l #2,104(sp)
  *tstsource = 0x8e88;
    3532:	206f 0068      	movea.l 104(sp),a0
    3536:	30bc 8e88      	move.w #-29048,(a0)
  tstsource += ZMLINESIZE/2-1;
    353a:	7228           	moveq #40,d1
    353c:	d3af 0068      	add.l d1,104(sp)

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
    3540:	2039 004d 2c4e 	move.l 4d2c4e <Zoom_Source>,d0
    3546:	2200           	move.l d0,d1
    3548:	0681 0000 14d6 	addi.l #5334,d1
    354e:	2f41 0068      	move.l d1,104(sp)
  *tstsource++ = 0x0000;
    3552:	202f 0068      	move.l 104(sp),d0
    3556:	2200           	move.l d0,d1
    3558:	5481           	addq.l #2,d1
    355a:	2f41 0068      	move.l d1,104(sp)
    355e:	2040           	movea.l d0,a0
    3560:	4250           	clr.w (a0)
  *tstsource = 0x00ff;
    3562:	206f 0068      	movea.l 104(sp),a0
    3566:	30bc 00ff      	move.w #255,(a0)
  WaitBlit();
    356a:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    3570:	2c40           	movea.l d0,a6
    3572:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    3576:	4eba e3c2      	jsr 193a <Init_Blit>(pc)
  Init_ZoomBlit( 7, 16, 0);
    357a:	42a7           	clr.l -(sp)
    357c:	4878 0010      	pea 10 <_start+0x10>
    3580:	4878 0007      	pea 7 <_start+0x7>
    3584:	4eba e430      	jsr 19b6 <Init_ZoomBlit>(pc)
    3588:	4fef 000c      	lea 12(sp),sp
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    358c:	2239 004d 2c0c 	move.l 4d2c0c <DrawBuffer>,d1
    3592:	2039 004d 2c4e 	move.l 4d2c4e <Zoom_Source>,d0
    3598:	4878 0080      	pea 80 <_start+0x80>
    359c:	2f01           	move.l d1,-(sp)
    359e:	2f00           	move.l d0,-(sp)
    35a0:	4eba d9fc      	jsr f9e <Zoom_ZoomBlit>(pc)
    35a4:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    35a8:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    35ae:	2c40           	movea.l d0,a6
    35b0:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    35b4:	2039 004d 2c0c 	move.l 4d2c0c <DrawBuffer>,d0
    35ba:	2200           	move.l d0,d1
    35bc:	5481           	addq.l #2,d1
    35be:	2f41 0064      	move.l d1,100(sp)
  if( *destination != 0x0180) {
    35c2:	206f 0064      	movea.l 100(sp),a0
    35c6:	3010           	move.w (a0),d0
    35c8:	0c40 0180      	cmpi.w #384,d0
    35cc:	6742           	beq.s 3610 <TestBlitleftOfZoom+0x19e>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    35ce:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    35d4:	2c40           	movea.l d0,a6
    35d6:	4eae ffc4      	jsr -60(a6)
    35da:	2f40 0060      	move.l d0,96(sp)
    35de:	202f 0060      	move.l 96(sp),d0
    35e2:	2f40 005c      	move.l d0,92(sp)
    35e6:	2f7c 0000 83ab 	move.l #33707,88(sp)
    35ec:	0058 
    35ee:	701c           	moveq #28,d0
    35f0:	2f40 0054      	move.l d0,84(sp)
    35f4:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    35fa:	2c40           	movea.l d0,a6
    35fc:	222f 005c      	move.l 92(sp),d1
    3600:	242f 0058      	move.l 88(sp),d2
    3604:	262f 0054      	move.l 84(sp),d3
    3608:	4eae ffd0      	jsr -48(a6)
    360c:	2f40 0050      	move.l d0,80(sp)
  }
  destination += ZMLINESIZE/2;
    3610:	722a           	moveq #42,d1
    3612:	d3af 0064      	add.l d1,100(sp)
  if( *destination != 0x1d88)
    3616:	206f 0064      	movea.l 100(sp),a0
    361a:	3010           	move.w (a0),d0
    361c:	0c40 1d88      	cmpi.w #7560,d0
    3620:	6742           	beq.s 3664 <TestBlitleftOfZoom+0x1f2>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    3622:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3628:	2c40           	movea.l d0,a6
    362a:	4eae ffc4      	jsr -60(a6)
    362e:	2f40 004c      	move.l d0,76(sp)
    3632:	202f 004c      	move.l 76(sp),d0
    3636:	2f40 0048      	move.l d0,72(sp)
    363a:	2f7c 0000 83c8 	move.l #33736,68(sp)
    3640:	0044 
    3642:	701c           	moveq #28,d0
    3644:	2f40 0040      	move.l d0,64(sp)
    3648:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    364e:	2c40           	movea.l d0,a6
    3650:	222f 0048      	move.l 72(sp),d1
    3654:	242f 0044      	move.l 68(sp),d2
    3658:	262f 0040      	move.l 64(sp),d3
    365c:	4eae ffd0      	jsr -48(a6)
    3660:	2f40 003c      	move.l d0,60(sp)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
    3664:	2039 004d 2c0c 	move.l 4d2c0c <DrawBuffer>,d0
    366a:	2200           	move.l d0,d1
    366c:	0681 0000 14d6 	addi.l #5334,d1
    3672:	2f41 0064      	move.l d1,100(sp)
  destination++;
    3676:	54af 0064      	addq.l #2,100(sp)
  if( *destination != 0x01ff) {
    367a:	206f 0064      	movea.l 100(sp),a0
    367e:	3010           	move.w (a0),d0
    3680:	0c40 01ff      	cmpi.w #511,d0
    3684:	6742           	beq.s 36c8 <TestBlitleftOfZoom+0x256>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    3686:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    368c:	2c40           	movea.l d0,a6
    368e:	4eae ffc4      	jsr -60(a6)
    3692:	2f40 0038      	move.l d0,56(sp)
    3696:	202f 0038      	move.l 56(sp),d0
    369a:	2f40 0034      	move.l d0,52(sp)
    369e:	2f7c 0000 83e5 	move.l #33765,48(sp)
    36a4:	0030 
    36a6:	701a           	moveq #26,d0
    36a8:	2f40 002c      	move.l d0,44(sp)
    36ac:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    36b2:	2c40           	movea.l d0,a6
    36b4:	222f 0034      	move.l 52(sp),d1
    36b8:	242f 0030      	move.l 48(sp),d2
    36bc:	262f 002c      	move.l 44(sp),d3
    36c0:	4eae ffd0      	jsr -48(a6)
    36c4:	2f40 0028      	move.l d0,40(sp)
  }
  FreeMem( Zoom_Source, 40*256*5);
    36c8:	2f79 004d 2c4e 	move.l 4d2c4e <Zoom_Source>,36(sp)
    36ce:	0024 
    36d0:	2f7c 0000 c800 	move.l #51200,32(sp)
    36d6:	0020 
    36d8:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    36de:	2c40           	movea.l d0,a6
    36e0:	226f 0024      	movea.l 36(sp),a1
    36e4:	202f 0020      	move.l 32(sp),d0
    36e8:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    36ec:	2f3c 0000 df20 	move.l #57120,-(sp)
    36f2:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    36f6:	4eba c9e8      	jsr e0 <FreeDisplay>(pc)
    36fa:	508f           	addq.l #8,sp
}
    36fc:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3700:	4fef 006c      	lea 108(sp),sp
    3704:	4e75           	rts

00003706 <TestCopyWord>:

void TestCopyWord() {
    3706:	4fef ff74      	lea -140(sp),sp
    370a:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    370e:	2f7c 0000 04ec 	move.l #1260,136(sp)
    3714:	0088 
    3716:	7002           	moveq #2,d0
    3718:	2f40 0084      	move.l d0,132(sp)
    371c:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    3722:	2c40           	movea.l d0,a6
    3724:	202f 0088      	move.l 136(sp),d0
    3728:	222f 0084      	move.l 132(sp),d1
    372c:	4eae ff3a      	jsr -198(a6)
    3730:	2f40 0080      	move.l d0,128(sp)
    3734:	202f 0080      	move.l 128(sp),d0
    3738:	2f40 007c      	move.l d0,124(sp)
  if( source == 0) {
    373c:	6646           	bne.s 3784 <TestCopyWord+0x7e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    373e:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3744:	2c40           	movea.l d0,a6
    3746:	4eae ffc4      	jsr -60(a6)
    374a:	2f40 001c      	move.l d0,28(sp)
    374e:	202f 001c      	move.l 28(sp),d0
    3752:	2f40 0018      	move.l d0,24(sp)
    3756:	2f7c 0000 8400 	move.l #33792,20(sp)
    375c:	0014 
    375e:	7235           	moveq #53,d1
    3760:	2f41 0010      	move.l d1,16(sp)
    3764:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    376a:	2c40           	movea.l d0,a6
    376c:	222f 0018      	move.l 24(sp),d1
    3770:	242f 0014      	move.l 20(sp),d2
    3774:	262f 0010      	move.l 16(sp),d3
    3778:	4eae ffd0      	jsr -48(a6)
    377c:	2f40 000c      	move.l d0,12(sp)
    3780:	6000 026c      	bra.w 39ee <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    3784:	2f7c 0000 04ec 	move.l #1260,120(sp)
    378a:	0078 
    378c:	7002           	moveq #2,d0
    378e:	2f40 0074      	move.l d0,116(sp)
    3792:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    3798:	2c40           	movea.l d0,a6
    379a:	202f 0078      	move.l 120(sp),d0
    379e:	222f 0074      	move.l 116(sp),d1
    37a2:	4eae ff3a      	jsr -198(a6)
    37a6:	2f40 0070      	move.l d0,112(sp)
    37aa:	202f 0070      	move.l 112(sp),d0
    37ae:	2f40 006c      	move.l d0,108(sp)
  if( destination == 0) {
    37b2:	6646           	bne.s 37fa <TestCopyWord+0xf4>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    37b4:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    37ba:	2c40           	movea.l d0,a6
    37bc:	4eae ffc4      	jsr -60(a6)
    37c0:	2f40 0030      	move.l d0,48(sp)
    37c4:	202f 0030      	move.l 48(sp),d0
    37c8:	2f40 002c      	move.l d0,44(sp)
    37cc:	2f7c 0000 8400 	move.l #33792,40(sp)
    37d2:	0028 
    37d4:	7235           	moveq #53,d1
    37d6:	2f41 0024      	move.l d1,36(sp)
    37da:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    37e0:	2c40           	movea.l d0,a6
    37e2:	222f 002c      	move.l 44(sp),d1
    37e6:	242f 0028      	move.l 40(sp),d2
    37ea:	262f 0024      	move.l 36(sp),d3
    37ee:	4eae ffd0      	jsr -48(a6)
    37f2:	2f40 0020      	move.l d0,32(sp)
    37f6:	6000 01f6      	bra.w 39ee <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
    37fa:	2f6f 007c 0094 	move.l 124(sp),148(sp)
  for( int i=0; i<8;i++) {
    3800:	42af 0090      	clr.l 144(sp)
    3804:	6000 0086      	bra.w 388c <TestCopyWord+0x186>
    *tmp++ = 0;
    3808:	202f 0094      	move.l 148(sp),d0
    380c:	2200           	move.l d0,d1
    380e:	5481           	addq.l #2,d1
    3810:	2f41 0094      	move.l d1,148(sp)
    3814:	2040           	movea.l d0,a0
    3816:	4250           	clr.w (a0)
    *tmp++ = 0xaaaa;
    3818:	202f 0094      	move.l 148(sp),d0
    381c:	2200           	move.l d0,d1
    381e:	5481           	addq.l #2,d1
    3820:	2f41 0094      	move.l d1,148(sp)
    3824:	2040           	movea.l d0,a0
    3826:	30bc aaaa      	move.w #-21846,(a0)
    *tmp++ = 0xaaaa;
    382a:	202f 0094      	move.l 148(sp),d0
    382e:	2200           	move.l d0,d1
    3830:	5481           	addq.l #2,d1
    3832:	2f41 0094      	move.l d1,148(sp)
    3836:	2040           	movea.l d0,a0
    3838:	30bc aaaa      	move.w #-21846,(a0)
    *tmp = 0;
    383c:	206f 0094      	movea.l 148(sp),a0
    3840:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    3842:	7024           	moveq #36,d0
    3844:	d1af 0094      	add.l d0,148(sp)
    *tmp++ = 0;
    3848:	202f 0094      	move.l 148(sp),d0
    384c:	2200           	move.l d0,d1
    384e:	5481           	addq.l #2,d1
    3850:	2f41 0094      	move.l d1,148(sp)
    3854:	2040           	movea.l d0,a0
    3856:	4250           	clr.w (a0)
    *tmp++ = 0x5555;
    3858:	202f 0094      	move.l 148(sp),d0
    385c:	2200           	move.l d0,d1
    385e:	5481           	addq.l #2,d1
    3860:	2f41 0094      	move.l d1,148(sp)
    3864:	2040           	movea.l d0,a0
    3866:	30bc 5555      	move.w #21845,(a0)
    *tmp++ = 0x5555;
    386a:	202f 0094      	move.l 148(sp),d0
    386e:	2200           	move.l d0,d1
    3870:	5481           	addq.l #2,d1
    3872:	2f41 0094      	move.l d1,148(sp)
    3876:	2040           	movea.l d0,a0
    3878:	30bc 5555      	move.w #21845,(a0)
    *tmp = 0;
    387c:	206f 0094      	movea.l 148(sp),a0
    3880:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    3882:	7024           	moveq #36,d0
    3884:	d1af 0094      	add.l d0,148(sp)
  for( int i=0; i<8;i++) {
    3888:	52af 0090      	addq.l #1,144(sp)
    388c:	7207           	moveq #7,d1
    388e:	b2af 0090      	cmp.l 144(sp),d1
    3892:	6c00 ff74      	bge.w 3808 <TestCopyWord+0x102>
  }
  tmp = destination;
    3896:	2f6f 006c 0094 	move.l 108(sp),148(sp)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    389c:	42af 008c      	clr.l 140(sp)
    38a0:	6014           	bra.s 38b6 <TestCopyWord+0x1b0>
    *tmp++ = 0;
    38a2:	202f 0094      	move.l 148(sp),d0
    38a6:	2200           	move.l d0,d1
    38a8:	5481           	addq.l #2,d1
    38aa:	2f41 0094      	move.l d1,148(sp)
    38ae:	2040           	movea.l d0,a0
    38b0:	4250           	clr.w (a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    38b2:	52af 008c      	addq.l #1,140(sp)
    38b6:	0caf 0000 0275 	cmpi.l #629,140(sp)
    38bc:	008c 
    38be:	6fe2           	ble.s 38a2 <TestCopyWord+0x19c>
  }

  WaitBlit();
    38c0:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    38c6:	2c40           	movea.l d0,a6
    38c8:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
    38cc:	4eba db5a      	jsr 1428 <Zoom_Init>(pc)
  Init_Copy( 3);
    38d0:	4878 0003      	pea 3 <_start+0x3>
    38d4:	4eba e184      	jsr 1a5a <Init_Copy>(pc)
    38d8:	588f           	addq.l #4,sp
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
    38da:	202f 007c      	move.l 124(sp),d0
    38de:	5480           	addq.l #2,d0
    38e0:	4878 0010      	pea 10 <_start+0x10>
    38e4:	2f2f 0070      	move.l 112(sp),-(sp)
    38e8:	2f00           	move.l d0,-(sp)
    38ea:	4eba d674      	jsr f60 <Zoom_CopyWord>(pc)
    38ee:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    38f2:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    38f8:	2c40           	movea.l d0,a6
    38fa:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
    38fe:	202f 006c      	move.l 108(sp),d0
    3902:	5480           	addq.l #2,d0
    3904:	2f40 0094      	move.l d0,148(sp)
  if( *tmp != 0x5555) 
    3908:	206f 0094      	movea.l 148(sp),a0
    390c:	3010           	move.w (a0),d0
    390e:	0c40 5555      	cmpi.w #21845,d0
    3912:	6742           	beq.s 3956 <TestCopyWord+0x250>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    3914:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    391a:	2c40           	movea.l d0,a6
    391c:	4eae ffc4      	jsr -60(a6)
    3920:	2f40 0068      	move.l d0,104(sp)
    3924:	202f 0068      	move.l 104(sp),d0
    3928:	2f40 0064      	move.l d0,100(sp)
    392c:	2f7c 0000 8436 	move.l #33846,96(sp)
    3932:	0060 
    3934:	721f           	moveq #31,d1
    3936:	2f41 005c      	move.l d1,92(sp)
    393a:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3940:	2c40           	movea.l d0,a6
    3942:	222f 0064      	move.l 100(sp),d1
    3946:	242f 0060      	move.l 96(sp),d2
    394a:	262f 005c      	move.l 92(sp),d3
    394e:	4eae ffd0      	jsr -48(a6)
    3952:	2f40 0058      	move.l d0,88(sp)
  tmp += ZMLINESIZE/2;
    3956:	702a           	moveq #42,d0
    3958:	d1af 0094      	add.l d0,148(sp)
  if( *tmp != 0xaaaa)
    395c:	206f 0094      	movea.l 148(sp),a0
    3960:	3010           	move.w (a0),d0
    3962:	0c40 aaaa      	cmpi.w #-21846,d0
    3966:	6742           	beq.s 39aa <TestCopyWord+0x2a4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    3968:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    396e:	2c40           	movea.l d0,a6
    3970:	4eae ffc4      	jsr -60(a6)
    3974:	2f40 0054      	move.l d0,84(sp)
    3978:	202f 0054      	move.l 84(sp),d0
    397c:	2f40 0050      	move.l d0,80(sp)
    3980:	2f7c 0000 8456 	move.l #33878,76(sp)
    3986:	004c 
    3988:	7220           	moveq #32,d1
    398a:	2f41 0048      	move.l d1,72(sp)
    398e:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3994:	2c40           	movea.l d0,a6
    3996:	222f 0050      	move.l 80(sp),d1
    399a:	242f 004c      	move.l 76(sp),d2
    399e:	262f 0048      	move.l 72(sp),d3
    39a2:	4eae ffd0      	jsr -48(a6)
    39a6:	2f40 0044      	move.l d0,68(sp)
  
  FreeMem( source,ZMLINESIZE*30);
    39aa:	2f6f 007c 0040 	move.l 124(sp),64(sp)
    39b0:	2f7c 0000 04ec 	move.l #1260,60(sp)
    39b6:	003c 
    39b8:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    39be:	2c40           	movea.l d0,a6
    39c0:	226f 0040      	movea.l 64(sp),a1
    39c4:	202f 003c      	move.l 60(sp),d0
    39c8:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    39cc:	2f6f 006c 0038 	move.l 108(sp),56(sp)
    39d2:	2f7c 0000 04ec 	move.l #1260,52(sp)
    39d8:	0034 
    39da:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    39e0:	2c40           	movea.l d0,a6
    39e2:	226f 0038      	movea.l 56(sp),a1
    39e6:	202f 0034      	move.l 52(sp),d0
    39ea:	4eae ff2e      	jsr -210(a6)
}
    39ee:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    39f2:	4fef 008c      	lea 140(sp),sp
    39f6:	4e75           	rts

000039f8 <TestZoom4PictureOn5Planes>:
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */


void TestZoom4PictureOn5Planes() {
    39f8:	4fef ff74      	lea -140(sp),sp
    39fc:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3a00:	2f7c 0000 f460 	move.l #62560,102(sp)
    3a06:	0066 
    3a08:	7002           	moveq #2,d0
    3a0a:	2f40 0062      	move.l d0,98(sp)
    3a0e:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    3a14:	2c40           	movea.l d0,a6
    3a16:	202f 0066      	move.l 102(sp),d0
    3a1a:	222f 0062      	move.l 98(sp),d1
    3a1e:	4eae ff3a      	jsr -198(a6)
    3a22:	2f40 005e      	move.l d0,94(sp)
    3a26:	202f 005e      	move.l 94(sp),d0
    3a2a:	2f40 005a      	move.l d0,90(sp)
  if( source == 0) {
    3a2e:	6646           	bne.s 3a76 <TestZoom4PictureOn5Planes+0x7e>
    Write(  Output(), 
    3a30:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3a36:	2c40           	movea.l d0,a6
    3a38:	4eae ffc4      	jsr -60(a6)
    3a3c:	2f40 001e      	move.l d0,30(sp)
    3a40:	202f 001e      	move.l 30(sp),d0
    3a44:	2f40 001a      	move.l d0,26(sp)
    3a48:	2f7c 0000 8477 	move.l #33911,22(sp)
    3a4e:	0016 
    3a50:	7239           	moveq #57,d1
    3a52:	2f41 0012      	move.l d1,18(sp)
    3a56:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3a5c:	2c40           	movea.l d0,a6
    3a5e:	222f 001a      	move.l 26(sp),d1
    3a62:	242f 0016      	move.l 22(sp),d2
    3a66:	262f 0012      	move.l 18(sp),d3
    3a6a:	4eae ffd0      	jsr -48(a6)
    3a6e:	2f40 000e      	move.l d0,14(sp)
    3a72:	6000 0266      	bra.w 3cda <TestZoom4PictureOn5Planes+0x2e2>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3a76:	2f7c 0000 f460 	move.l #62560,86(sp)
    3a7c:	0056 
    3a7e:	7002           	moveq #2,d0
    3a80:	2f40 0052      	move.l d0,82(sp)
    3a84:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    3a8a:	2c40           	movea.l d0,a6
    3a8c:	202f 0056      	move.l 86(sp),d0
    3a90:	222f 0052      	move.l 82(sp),d1
    3a94:	4eae ff3a      	jsr -198(a6)
    3a98:	2f40 004e      	move.l d0,78(sp)
    3a9c:	202f 004e      	move.l 78(sp),d0
    3aa0:	2f40 004a      	move.l d0,74(sp)
  if( destination == 0) {
    3aa4:	6646           	bne.s 3aec <TestZoom4PictureOn5Planes+0xf4>
    Write(  Output(), 
    3aa6:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3aac:	2c40           	movea.l d0,a6
    3aae:	4eae ffc4      	jsr -60(a6)
    3ab2:	2f40 0032      	move.l d0,50(sp)
    3ab6:	202f 0032      	move.l 50(sp),d0
    3aba:	2f40 002e      	move.l d0,46(sp)
    3abe:	2f7c 0000 84b1 	move.l #33969,42(sp)
    3ac4:	002a 
    3ac6:	723d           	moveq #61,d1
    3ac8:	2f41 0026      	move.l d1,38(sp)
    3acc:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3ad2:	2c40           	movea.l d0,a6
    3ad4:	222f 002e      	move.l 46(sp),d1
    3ad8:	242f 002a      	move.l 42(sp),d2
    3adc:	262f 0026      	move.l 38(sp),d3
    3ae0:	4eae ffd0      	jsr -48(a6)
    3ae4:	2f40 0022      	move.l d0,34(sp)
    3ae8:	6000 01f0      	bra.w 3cda <TestZoom4PictureOn5Planes+0x2e2>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3aec:	2f6f 005a 0094 	move.l 90(sp),148(sp)
  for(int i=0;i<128+8;i++) {
    3af2:	42af 0090      	clr.l 144(sp)
    3af6:	6050           	bra.s 3b48 <TestZoom4PictureOn5Planes+0x150>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3af8:	42af 008c      	clr.l 140(sp)
    3afc:	6018           	bra.s 3b16 <TestZoom4PictureOn5Planes+0x11e>
      *tmp4source++ = 0x55555555;
    3afe:	202f 0094      	move.l 148(sp),d0
    3b02:	2200           	move.l d0,d1
    3b04:	5881           	addq.l #4,d1
    3b06:	2f41 0094      	move.l d1,148(sp)
    3b0a:	2040           	movea.l d0,a0
    3b0c:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b12:	52af 008c      	addq.l #1,140(sp)
    3b16:	7031           	moveq #49,d0
    3b18:	b0af 008c      	cmp.l 140(sp),d0
    3b1c:	6ce0           	bge.s 3afe <TestZoom4PictureOn5Planes+0x106>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b1e:	42af 0088      	clr.l 136(sp)
    3b22:	6018           	bra.s 3b3c <TestZoom4PictureOn5Planes+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3b24:	202f 0094      	move.l 148(sp),d0
    3b28:	2200           	move.l d0,d1
    3b2a:	5881           	addq.l #4,d1
    3b2c:	2f41 0094      	move.l d1,148(sp)
    3b30:	2040           	movea.l d0,a0
    3b32:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b38:	52af 0088      	addq.l #1,136(sp)
    3b3c:	7031           	moveq #49,d0
    3b3e:	b0af 0088      	cmp.l 136(sp),d0
    3b42:	6ce0           	bge.s 3b24 <TestZoom4PictureOn5Planes+0x12c>
  for(int i=0;i<128+8;i++) {
    3b44:	52af 0090      	addq.l #1,144(sp)
    3b48:	0caf 0000 0087 	cmpi.l #135,144(sp)
    3b4e:	0090 
    3b50:	6fa6           	ble.s 3af8 <TestZoom4PictureOn5Planes+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3b52:	4878 0005      	pea 5 <_start+0x5>
    3b56:	42a7           	clr.l -(sp)
    3b58:	2f2f 0052      	move.l 82(sp),-(sp)
    3b5c:	2f2f 0066      	move.l 102(sp),-(sp)
    3b60:	4eba df32      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    3b64:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3b68:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    3b6e:	2c40           	movea.l d0,a6
    3b70:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3b74:	222f 004a      	move.l 74(sp),d1
    3b78:	5881           	addq.l #4,d1
    3b7a:	2f41 0084      	move.l d1,132(sp)
  UWORD *valsupposed = destlinezoom1;
    3b7e:	2f7c 0000 bac8 	move.l #47816,70(sp)
    3b84:	0046 
  UWORD mask = 0xffff;
    3b86:	3f7c ffff 0082 	move.w #-1,130(sp)
  for(int i=0;i<14;i++) {
    3b8c:	42af 007e      	clr.l 126(sp)
    3b90:	6000 00a8      	bra.w 3c3a <TestZoom4PictureOn5Planes+0x242>
    for(int i2=0;i2<18;i2++) { 
    3b94:	42af 007a      	clr.l 122(sp)
    3b98:	604e           	bra.s 3be8 <TestZoom4PictureOn5Planes+0x1f0>
      for( int i3=0;i3<5;i3++) {
    3b9a:	42af 0076      	clr.l 118(sp)
    3b9e:	6038           	bra.s 3bd8 <TestZoom4PictureOn5Planes+0x1e0>
        TestRow( valsupposed, valactual, mask, i2+i*19);
    3ba0:	222f 007e      	move.l 126(sp),d1
    3ba4:	2001           	move.l d1,d0
    3ba6:	e788           	lsl.l #3,d0
    3ba8:	d081           	add.l d1,d0
    3baa:	d080           	add.l d0,d0
    3bac:	d081           	add.l d1,d0
    3bae:	2200           	move.l d0,d1
    3bb0:	d2af 007a      	add.l 122(sp),d1
    3bb4:	7000           	moveq #0,d0
    3bb6:	302f 0082      	move.w 130(sp),d0
    3bba:	2f01           	move.l d1,-(sp)
    3bbc:	2f00           	move.l d0,-(sp)
    3bbe:	2f2f 008c      	move.l 140(sp),-(sp)
    3bc2:	2f2f 0052      	move.l 82(sp),-(sp)
    3bc6:	4eba 2f7e      	jsr 6b46 <TestRow>(pc)
    3bca:	4fef 0010      	lea 16(sp),sp
        valactual += ZMLINESIZE/2;
    3bce:	702a           	moveq #42,d0
    3bd0:	d1af 0084      	add.l d0,132(sp)
      for( int i3=0;i3<5;i3++) {
    3bd4:	52af 0076      	addq.l #1,118(sp)
    3bd8:	7204           	moveq #4,d1
    3bda:	b2af 0076      	cmp.l 118(sp),d1
    3bde:	6cc0           	bge.s 3ba0 <TestZoom4PictureOn5Planes+0x1a8>
      }
      mask = mask ^ 0xffff;
    3be0:	466f 0082      	not.w 130(sp)
    for(int i2=0;i2<18;i2++) { 
    3be4:	52af 007a      	addq.l #1,122(sp)
    3be8:	7011           	moveq #17,d0
    3bea:	b0af 007a      	cmp.l 122(sp),d0
    3bee:	6caa           	bge.s 3b9a <TestZoom4PictureOn5Planes+0x1a2>
    }
    for( int i3=0;i3<5;i3++) {
    3bf0:	42af 0072      	clr.l 114(sp)
    3bf4:	6038           	bra.s 3c2e <TestZoom4PictureOn5Planes+0x236>
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3bf6:	222f 007e      	move.l 126(sp),d1
    3bfa:	2001           	move.l d1,d0
    3bfc:	e788           	lsl.l #3,d0
    3bfe:	d081           	add.l d1,d0
    3c00:	d080           	add.l d0,d0
    3c02:	2040           	movea.l d0,a0
    3c04:	d1c1           	adda.l d1,a0
    3c06:	41e8 0012      	lea 18(a0),a0
    3c0a:	7000           	moveq #0,d0
    3c0c:	302f 0082      	move.w 130(sp),d0
    3c10:	2f08           	move.l a0,-(sp)
    3c12:	2f00           	move.l d0,-(sp)
    3c14:	2f2f 008c      	move.l 140(sp),-(sp)
    3c18:	2f2f 0052      	move.l 82(sp),-(sp)
    3c1c:	4eba 2f28      	jsr 6b46 <TestRow>(pc)
    3c20:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3c24:	722a           	moveq #42,d1
    3c26:	d3af 0084      	add.l d1,132(sp)
    for( int i3=0;i3<5;i3++) {
    3c2a:	52af 0072      	addq.l #1,114(sp)
    3c2e:	7004           	moveq #4,d0
    3c30:	b0af 0072      	cmp.l 114(sp),d0
    3c34:	6cc0           	bge.s 3bf6 <TestZoom4PictureOn5Planes+0x1fe>
  for(int i=0;i<14;i++) {
    3c36:	52af 007e      	addq.l #1,126(sp)
    3c3a:	720d           	moveq #13,d1
    3c3c:	b2af 007e      	cmp.l 126(sp),d1
    3c40:	6c00 ff52      	bge.w 3b94 <TestZoom4PictureOn5Planes+0x19c>
    }
  }
  for(int i2=0;i2<4;i2++) { 
    3c44:	42af 006e      	clr.l 110(sp)
    3c48:	6044           	bra.s 3c8e <TestZoom4PictureOn5Planes+0x296>
    for( int i3=0;i3<5;i3++) {
    3c4a:	42af 006a      	clr.l 106(sp)
    3c4e:	602e           	bra.s 3c7e <TestZoom4PictureOn5Planes+0x286>
      TestRow( valsupposed, valactual, mask, i2+265);
    3c50:	222f 006e      	move.l 110(sp),d1
    3c54:	0681 0000 0109 	addi.l #265,d1
    3c5a:	7000           	moveq #0,d0
    3c5c:	302f 0082      	move.w 130(sp),d0
    3c60:	2f01           	move.l d1,-(sp)
    3c62:	2f00           	move.l d0,-(sp)
    3c64:	2f2f 008c      	move.l 140(sp),-(sp)
    3c68:	2f2f 0052      	move.l 82(sp),-(sp)
    3c6c:	4eba 2ed8      	jsr 6b46 <TestRow>(pc)
    3c70:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3c74:	702a           	moveq #42,d0
    3c76:	d1af 0084      	add.l d0,132(sp)
    for( int i3=0;i3<5;i3++) {
    3c7a:	52af 006a      	addq.l #1,106(sp)
    3c7e:	7204           	moveq #4,d1
    3c80:	b2af 006a      	cmp.l 106(sp),d1
    3c84:	6cca           	bge.s 3c50 <TestZoom4PictureOn5Planes+0x258>
    }
    mask = mask ^ 0xffff;
    3c86:	466f 0082      	not.w 130(sp)
  for(int i2=0;i2<4;i2++) { 
    3c8a:	52af 006e      	addq.l #1,110(sp)
    3c8e:	7003           	moveq #3,d0
    3c90:	b0af 006e      	cmp.l 110(sp),d0
    3c94:	6cb4           	bge.s 3c4a <TestZoom4PictureOn5Planes+0x252>
  } 
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    3c96:	2f6f 005a 0042 	move.l 90(sp),66(sp)
    3c9c:	2f7c 0000 f460 	move.l #62560,62(sp)
    3ca2:	003e 
    3ca4:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    3caa:	2c40           	movea.l d0,a6
    3cac:	226f 0042      	movea.l 66(sp),a1
    3cb0:	202f 003e      	move.l 62(sp),d0
    3cb4:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    3cb8:	2f6f 004a 003a 	move.l 74(sp),58(sp)
    3cbe:	2f7c 0000 f460 	move.l #62560,54(sp)
    3cc4:	0036 
    3cc6:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    3ccc:	2c40           	movea.l d0,a6
    3cce:	226f 003a      	movea.l 58(sp),a1
    3cd2:	202f 0036      	move.l 54(sp),d0
    3cd6:	4eae ff2e      	jsr -210(a6)
}
    3cda:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3cde:	4fef 008c      	lea 140(sp),sp
    3ce2:	4e75           	rts

00003ce4 <TestZoom4Picture>:

void TestZoom4Picture() {
    3ce4:	4fef fe30      	lea -464(sp),sp
    3ce8:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3cec:	2f7c 0000 30e0 	move.l #12512,106(sp)
    3cf2:	006a 
    3cf4:	7002           	moveq #2,d0
    3cf6:	2f40 0066      	move.l d0,102(sp)
    3cfa:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    3d00:	2c40           	movea.l d0,a6
    3d02:	202f 006a      	move.l 106(sp),d0
    3d06:	222f 0066      	move.l 102(sp),d1
    3d0a:	4eae ff3a      	jsr -198(a6)
    3d0e:	2f40 0062      	move.l d0,98(sp)
    3d12:	202f 0062      	move.l 98(sp),d0
    3d16:	2f40 005e      	move.l d0,94(sp)
  if( source == 0) {
    3d1a:	6646           	bne.s 3d62 <TestZoom4Picture+0x7e>
    Write(  Output(), 
    3d1c:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3d22:	2c40           	movea.l d0,a6
    3d24:	4eae ffc4      	jsr -60(a6)
    3d28:	2f40 001e      	move.l d0,30(sp)
    3d2c:	202f 001e      	move.l 30(sp),d0
    3d30:	2f40 001a      	move.l d0,26(sp)
    3d34:	2f7c 0000 8477 	move.l #33911,22(sp)
    3d3a:	0016 
    3d3c:	7239           	moveq #57,d1
    3d3e:	2f41 0012      	move.l d1,18(sp)
    3d42:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3d48:	2c40           	movea.l d0,a6
    3d4a:	222f 001a      	move.l 26(sp),d1
    3d4e:	242f 0016      	move.l 22(sp),d2
    3d52:	262f 0012      	move.l 18(sp),d3
    3d56:	4eae ffd0      	jsr -48(a6)
    3d5a:	2f40 000e      	move.l d0,14(sp)
    3d5e:	6000 2ddc      	bra.w 6b3c <TestZoom4Picture+0x2e58>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3d62:	2f7c 0000 30e0 	move.l #12512,90(sp)
    3d68:	005a 
    3d6a:	7002           	moveq #2,d0
    3d6c:	2f40 0056      	move.l d0,86(sp)
    3d70:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    3d76:	2c40           	movea.l d0,a6
    3d78:	202f 005a      	move.l 90(sp),d0
    3d7c:	222f 0056      	move.l 86(sp),d1
    3d80:	4eae ff3a      	jsr -198(a6)
    3d84:	2f40 0052      	move.l d0,82(sp)
    3d88:	202f 0052      	move.l 82(sp),d0
    3d8c:	2f40 004e      	move.l d0,78(sp)
  if( destination == 0) {
    3d90:	6646           	bne.s 3dd8 <TestZoom4Picture+0xf4>
    Write(  Output(), 
    3d92:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3d98:	2c40           	movea.l d0,a6
    3d9a:	4eae ffc4      	jsr -60(a6)
    3d9e:	2f40 0032      	move.l d0,50(sp)
    3da2:	202f 0032      	move.l 50(sp),d0
    3da6:	2f40 002e      	move.l d0,46(sp)
    3daa:	2f7c 0000 84b1 	move.l #33969,42(sp)
    3db0:	002a 
    3db2:	723d           	moveq #61,d1
    3db4:	2f41 0026      	move.l d1,38(sp)
    3db8:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    3dbe:	2c40           	movea.l d0,a6
    3dc0:	222f 002e      	move.l 46(sp),d1
    3dc4:	242f 002a      	move.l 42(sp),d2
    3dc8:	262f 0026      	move.l 38(sp),d3
    3dcc:	4eae ffd0      	jsr -48(a6)
    3dd0:	2f40 0022      	move.l d0,34(sp)
    3dd4:	6000 2d66      	bra.w 6b3c <TestZoom4Picture+0x2e58>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3dd8:	2f6f 005e 01d8 	move.l 94(sp),472(sp)
  for(int i=0;i<128+8;i++) {
    3dde:	42af 01d4      	clr.l 468(sp)
    3de2:	6050           	bra.s 3e34 <TestZoom4Picture+0x150>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3de4:	42af 01d0      	clr.l 464(sp)
    3de8:	6018           	bra.s 3e02 <TestZoom4Picture+0x11e>
      *tmp4source++ = 0x55555555;
    3dea:	202f 01d8      	move.l 472(sp),d0
    3dee:	2200           	move.l d0,d1
    3df0:	5881           	addq.l #4,d1
    3df2:	2f41 01d8      	move.l d1,472(sp)
    3df6:	2040           	movea.l d0,a0
    3df8:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3dfe:	52af 01d0      	addq.l #1,464(sp)
    3e02:	7009           	moveq #9,d0
    3e04:	b0af 01d0      	cmp.l 464(sp),d0
    3e08:	6ce0           	bge.s 3dea <TestZoom4Picture+0x106>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e0a:	42af 01cc      	clr.l 460(sp)
    3e0e:	6018           	bra.s 3e28 <TestZoom4Picture+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3e10:	202f 01d8      	move.l 472(sp),d0
    3e14:	2200           	move.l d0,d1
    3e16:	5881           	addq.l #4,d1
    3e18:	2f41 01d8      	move.l d1,472(sp)
    3e1c:	2040           	movea.l d0,a0
    3e1e:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e24:	52af 01cc      	addq.l #1,460(sp)
    3e28:	7009           	moveq #9,d0
    3e2a:	b0af 01cc      	cmp.l 460(sp),d0
    3e2e:	6ce0           	bge.s 3e10 <TestZoom4Picture+0x12c>
  for(int i=0;i<128+8;i++) {
    3e30:	52af 01d4      	addq.l #1,468(sp)
    3e34:	0caf 0000 0087 	cmpi.l #135,468(sp)
    3e3a:	01d4 
    3e3c:	6fa6           	ble.s 3de4 <TestZoom4Picture+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    3e3e:	4878 0001      	pea 1 <_start+0x1>
    3e42:	42a7           	clr.l -(sp)
    3e44:	2f2f 0056      	move.l 86(sp),-(sp)
    3e48:	2f2f 006a      	move.l 106(sp),-(sp)
    3e4c:	4eba dc46      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    3e50:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3e54:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    3e5a:	2c40           	movea.l d0,a6
    3e5c:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3e60:	222f 004e      	move.l 78(sp),d1
    3e64:	5881           	addq.l #4,d1
    3e66:	2f41 01c8      	move.l d1,456(sp)
  UWORD *valsupposed = destlinezoom1;
    3e6a:	2f7c 0000 bac8 	move.l #47816,74(sp)
    3e70:	004a 
  UWORD mask = 0xffff;
    3e72:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<14;i++) {
    3e78:	42af 01c2      	clr.l 450(sp)
    3e7c:	6000 0084      	bra.w 3f02 <TestZoom4Picture+0x21e>
    for(int i2=0;i2<18;i2++) { 
    3e80:	42af 01be      	clr.l 446(sp)
    3e84:	603c           	bra.s 3ec2 <TestZoom4Picture+0x1de>
      TestRow( valsupposed, valactual, mask, i2+i*19);
    3e86:	222f 01c2      	move.l 450(sp),d1
    3e8a:	2001           	move.l d1,d0
    3e8c:	e788           	lsl.l #3,d0
    3e8e:	d081           	add.l d1,d0
    3e90:	d080           	add.l d0,d0
    3e92:	d081           	add.l d1,d0
    3e94:	2200           	move.l d0,d1
    3e96:	d2af 01be      	add.l 446(sp),d1
    3e9a:	7000           	moveq #0,d0
    3e9c:	302f 01c6      	move.w 454(sp),d0
    3ea0:	2f01           	move.l d1,-(sp)
    3ea2:	2f00           	move.l d0,-(sp)
    3ea4:	2f2f 01d0      	move.l 464(sp),-(sp)
    3ea8:	2f2f 0056      	move.l 86(sp),-(sp)
    3eac:	4eba 2c98      	jsr 6b46 <TestRow>(pc)
    3eb0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3eb4:	702a           	moveq #42,d0
    3eb6:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    3eba:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) { 
    3ebe:	52af 01be      	addq.l #1,446(sp)
    3ec2:	7211           	moveq #17,d1
    3ec4:	b2af 01be      	cmp.l 446(sp),d1
    3ec8:	6cbc           	bge.s 3e86 <TestZoom4Picture+0x1a2>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    3eca:	222f 01c2      	move.l 450(sp),d1
    3ece:	2001           	move.l d1,d0
    3ed0:	e788           	lsl.l #3,d0
    3ed2:	d081           	add.l d1,d0
    3ed4:	d080           	add.l d0,d0
    3ed6:	2040           	movea.l d0,a0
    3ed8:	d1c1           	adda.l d1,a0
    3eda:	41e8 0012      	lea 18(a0),a0
    3ede:	7000           	moveq #0,d0
    3ee0:	302f 01c6      	move.w 454(sp),d0
    3ee4:	2f08           	move.l a0,-(sp)
    3ee6:	2f00           	move.l d0,-(sp)
    3ee8:	2f2f 01d0      	move.l 464(sp),-(sp)
    3eec:	2f2f 0056      	move.l 86(sp),-(sp)
    3ef0:	4eba 2c54      	jsr 6b46 <TestRow>(pc)
    3ef4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3ef8:	702a           	moveq #42,d0
    3efa:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<14;i++) {
    3efe:	52af 01c2      	addq.l #1,450(sp)
    3f02:	720d           	moveq #13,d1
    3f04:	b2af 01c2      	cmp.l 450(sp),d1
    3f08:	6c00 ff76      	bge.w 3e80 <TestZoom4Picture+0x19c>
  }

  for(int i2=0;i2<4;i2++) { 
    3f0c:	42af 01ba      	clr.l 442(sp)
    3f10:	6032           	bra.s 3f44 <TestZoom4Picture+0x260>
    TestRow( valsupposed, valactual, mask, i2+265);
    3f12:	222f 01ba      	move.l 442(sp),d1
    3f16:	0681 0000 0109 	addi.l #265,d1
    3f1c:	7000           	moveq #0,d0
    3f1e:	302f 01c6      	move.w 454(sp),d0
    3f22:	2f01           	move.l d1,-(sp)
    3f24:	2f00           	move.l d0,-(sp)
    3f26:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f2a:	2f2f 0056      	move.l 86(sp),-(sp)
    3f2e:	4eba 2c16      	jsr 6b46 <TestRow>(pc)
    3f32:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f36:	702a           	moveq #42,d0
    3f38:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    3f3c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    3f40:	52af 01ba      	addq.l #1,442(sp)
    3f44:	7203           	moveq #3,d1
    3f46:	b2af 01ba      	cmp.l 442(sp),d1
    3f4a:	6cc6           	bge.s 3f12 <TestZoom4Picture+0x22e>
  }
  
  UWORD *tmp = source;
    3f4c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    3f52:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    3f58:	2f6f 0046 004e 	move.l 70(sp),78(sp)
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    3f5e:	4878 0001      	pea 1 <_start+0x1>
    3f62:	4878 0001      	pea 1 <_start+0x1>
    3f66:	2f2f 0056      	move.l 86(sp),-(sp)
    3f6a:	2f2f 006a      	move.l 106(sp),-(sp)
    3f6e:	4eba db24      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    3f72:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3f76:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    3f7c:	2c40           	movea.l d0,a6
    3f7e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    3f82:	202f 004e      	move.l 78(sp),d0
    3f86:	5880           	addq.l #4,d0
    3f88:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom2;
    3f8c:	2f7c 0000 baf4 	move.l #47860,74(sp)
    3f92:	004a 
  mask = 0x0000;
    3f94:	426f 01c6      	clr.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3f98:	42af 01b6      	clr.l 438(sp)
    3f9c:	602a           	bra.s 3fc8 <TestZoom4Picture+0x2e4>
    TestRow( valsupposed, valactual, mask, i2);
    3f9e:	7000           	moveq #0,d0
    3fa0:	302f 01c6      	move.w 454(sp),d0
    3fa4:	2f2f 01b6      	move.l 438(sp),-(sp)
    3fa8:	2f00           	move.l d0,-(sp)
    3faa:	2f2f 01d0      	move.l 464(sp),-(sp)
    3fae:	2f2f 0056      	move.l 86(sp),-(sp)
    3fb2:	4eba 2b92      	jsr 6b46 <TestRow>(pc)
    3fb6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3fba:	722a           	moveq #42,d1
    3fbc:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    3fc0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3fc4:	52af 01b6      	addq.l #1,438(sp)
    3fc8:	700a           	moveq #10,d0
    3fca:	b0af 01b6      	cmp.l 438(sp),d0
    3fce:	6cce           	bge.s 3f9e <TestZoom4Picture+0x2ba>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    3fd0:	4878 0008      	pea 8 <_start+0x8>
    3fd4:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3fda:	2f2f 01d0      	move.l 464(sp),-(sp)
    3fde:	2f2f 0056      	move.l 86(sp),-(sp)
    3fe2:	4eba 2b62      	jsr 6b46 <TestRow>(pc)
    3fe6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3fea:	722a           	moveq #42,d1
    3fec:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 9);
    3ff0:	4878 0009      	pea 9 <_start+0x9>
    3ff4:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3ffa:	2f2f 01d0      	move.l 464(sp),-(sp)
    3ffe:	2f2f 0056      	move.l 86(sp),-(sp)
    4002:	4eba 2b42      	jsr 6b46 <TestRow>(pc)
    4006:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    400a:	702a           	moveq #42,d0
    400c:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 10);
    4010:	4878 000a      	pea a <_start+0xa>
    4014:	42a7           	clr.l -(sp)
    4016:	2f2f 01d0      	move.l 464(sp),-(sp)
    401a:	2f2f 0056      	move.l 86(sp),-(sp)
    401e:	4eba 2b26      	jsr 6b46 <TestRow>(pc)
    4022:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4026:	722a           	moveq #42,d1
    4028:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 11);
    402c:	4878 000b      	pea b <_start+0xb>
    4030:	42a7           	clr.l -(sp)
    4032:	2f2f 01d0      	move.l 464(sp),-(sp)
    4036:	2f2f 0056      	move.l 86(sp),-(sp)
    403a:	4eba 2b0a      	jsr 6b46 <TestRow>(pc)
    403e:	4fef 0010      	lea 16(sp),sp

  valactual += ZMLINESIZE/2;
    4042:	702a           	moveq #42,d0
    4044:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<12;i++) {
    4048:	42af 01b2      	clr.l 434(sp)
    404c:	6000 0118      	bra.w 4166 <TestZoom4Picture+0x482>
    for(int i2=0;i2<16;i2++) {  
    4050:	42af 01ae      	clr.l 430(sp)
    4054:	603c           	bra.s 4092 <TestZoom4Picture+0x3ae>
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    4056:	222f 01b2      	move.l 434(sp),d1
    405a:	2001           	move.l d1,d0
    405c:	e988           	lsl.l #4,d0
    405e:	d081           	add.l d1,d0
    4060:	2040           	movea.l d0,a0
    4062:	d1ef 01ae      	adda.l 430(sp),a0
    4066:	41e8 000b      	lea 11(a0),a0
    406a:	7000           	moveq #0,d0
    406c:	302f 01c6      	move.w 454(sp),d0
    4070:	2f08           	move.l a0,-(sp)
    4072:	2f00           	move.l d0,-(sp)
    4074:	2f2f 01d0      	move.l 464(sp),-(sp)
    4078:	2f2f 0056      	move.l 86(sp),-(sp)
    407c:	4eba 2ac8      	jsr 6b46 <TestRow>(pc)
    4080:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4084:	722a           	moveq #42,d1
    4086:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    408a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {  
    408e:	52af 01ae      	addq.l #1,430(sp)
    4092:	700f           	moveq #15,d0
    4094:	b0af 01ae      	cmp.l 430(sp),d0
    4098:	6cbc           	bge.s 4056 <TestZoom4Picture+0x372>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    409a:	222f 01b2      	move.l 434(sp),d1
    409e:	2001           	move.l d1,d0
    40a0:	e988           	lsl.l #4,d0
    40a2:	2040           	movea.l d0,a0
    40a4:	d1c1           	adda.l d1,a0
    40a6:	41e8 0018      	lea 24(a0),a0
    40aa:	7000           	moveq #0,d0
    40ac:	302f 01c6      	move.w 454(sp),d0
    40b0:	2f08           	move.l a0,-(sp)
    40b2:	2f00           	move.l d0,-(sp)
    40b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    40b8:	2f2f 0056      	move.l 86(sp),-(sp)
    40bc:	4eba 2a88      	jsr 6b46 <TestRow>(pc)
    40c0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40c4:	722a           	moveq #42,d1
    40c6:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    40ca:	222f 01b2      	move.l 434(sp),d1
    40ce:	2001           	move.l d1,d0
    40d0:	e988           	lsl.l #4,d0
    40d2:	2040           	movea.l d0,a0
    40d4:	d1c1           	adda.l d1,a0
    40d6:	41e8 0019      	lea 25(a0),a0
    40da:	7000           	moveq #0,d0
    40dc:	302f 01c6      	move.w 454(sp),d0
    40e0:	2f08           	move.l a0,-(sp)
    40e2:	2f00           	move.l d0,-(sp)
    40e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    40e8:	2f2f 0056      	move.l 86(sp),-(sp)
    40ec:	4eba 2a58      	jsr 6b46 <TestRow>(pc)
    40f0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40f4:	702a           	moveq #42,d0
    40f6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    40fa:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    40fe:	222f 01b2      	move.l 434(sp),d1
    4102:	2001           	move.l d1,d0
    4104:	e988           	lsl.l #4,d0
    4106:	2040           	movea.l d0,a0
    4108:	d1c1           	adda.l d1,a0
    410a:	41e8 001a      	lea 26(a0),a0
    410e:	7000           	moveq #0,d0
    4110:	302f 01c6      	move.w 454(sp),d0
    4114:	2f08           	move.l a0,-(sp)
    4116:	2f00           	move.l d0,-(sp)
    4118:	2f2f 01d0      	move.l 464(sp),-(sp)
    411c:	2f2f 0056      	move.l 86(sp),-(sp)
    4120:	4eba 2a24      	jsr 6b46 <TestRow>(pc)
    4124:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4128:	722a           	moveq #42,d1
    412a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    412e:	222f 01b2      	move.l 434(sp),d1
    4132:	2001           	move.l d1,d0
    4134:	e988           	lsl.l #4,d0
    4136:	2040           	movea.l d0,a0
    4138:	d1c1           	adda.l d1,a0
    413a:	41e8 001b      	lea 27(a0),a0
    413e:	7000           	moveq #0,d0
    4140:	302f 01c6      	move.w 454(sp),d0
    4144:	2f08           	move.l a0,-(sp)
    4146:	2f00           	move.l d0,-(sp)
    4148:	2f2f 01d0      	move.l 464(sp),-(sp)
    414c:	2f2f 0056      	move.l 86(sp),-(sp)
    4150:	4eba 29f4      	jsr 6b46 <TestRow>(pc)
    4154:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4158:	702a           	moveq #42,d0
    415a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    415e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    4162:	52af 01b2      	addq.l #1,434(sp)
    4166:	720b           	moveq #11,d1
    4168:	b2af 01b2      	cmp.l 434(sp),d1
    416c:	6c00 fee2      	bge.w 4050 <TestZoom4Picture+0x36c>
    
  }

  for(int i2=0;i2<15;i2++) { 
    4170:	42af 01aa      	clr.l 426(sp)
    4174:	602a           	bra.s 41a0 <TestZoom4Picture+0x4bc>
    TestRow( valsupposed, valactual, mask, i2);
    4176:	7000           	moveq #0,d0
    4178:	302f 01c6      	move.w 454(sp),d0
    417c:	2f2f 01aa      	move.l 426(sp),-(sp)
    4180:	2f00           	move.l d0,-(sp)
    4182:	2f2f 01d0      	move.l 464(sp),-(sp)
    4186:	2f2f 0056      	move.l 86(sp),-(sp)
    418a:	4eba 29ba      	jsr 6b46 <TestRow>(pc)
    418e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4192:	702a           	moveq #42,d0
    4194:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4198:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<15;i2++) { 
    419c:	52af 01aa      	addq.l #1,426(sp)
    41a0:	720e           	moveq #14,d1
    41a2:	b2af 01aa      	cmp.l 426(sp),d1
    41a6:	6cce           	bge.s 4176 <TestZoom4Picture+0x492>
  }

  tmp = source;
    41a8:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    41ae:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    41b4:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    41ba:	4878 0001      	pea 1 <_start+0x1>
    41be:	4878 0002      	pea 2 <_start+0x2>
    41c2:	2f2f 0056      	move.l 86(sp),-(sp)
    41c6:	2f2f 006a      	move.l 106(sp),-(sp)
    41ca:	4eba d8c8      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    41ce:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    41d2:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    41d8:	2c40           	movea.l d0,a6
    41da:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    41de:	202f 004e      	move.l 78(sp),d0
    41e2:	5880           	addq.l #4,d0
    41e4:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom3;
    41e8:	2f7c 0000 bb20 	move.l #47904,74(sp)
    41ee:	004a 
  mask = 0xffff;
    41f0:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<4;i2++) { 
    41f6:	42af 01a6      	clr.l 422(sp)
    41fa:	602a           	bra.s 4226 <TestZoom4Picture+0x542>
    TestRow( valsupposed, valactual, mask, i2);
    41fc:	7000           	moveq #0,d0
    41fe:	302f 01c6      	move.w 454(sp),d0
    4202:	2f2f 01a6      	move.l 422(sp),-(sp)
    4206:	2f00           	move.l d0,-(sp)
    4208:	2f2f 01d0      	move.l 464(sp),-(sp)
    420c:	2f2f 0056      	move.l 86(sp),-(sp)
    4210:	4eba 2934      	jsr 6b46 <TestRow>(pc)
    4214:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4218:	722a           	moveq #42,d1
    421a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    421e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    4222:	52af 01a6      	addq.l #1,422(sp)
    4226:	7003           	moveq #3,d0
    4228:	b0af 01a6      	cmp.l 422(sp),d0
    422c:	6cce           	bge.s 41fc <TestZoom4Picture+0x518>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    422e:	4878 0004      	pea 4 <_start+0x4>
    4232:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4238:	2f2f 01d0      	move.l 464(sp),-(sp)
    423c:	2f2f 0056      	move.l 86(sp),-(sp)
    4240:	4eba 2904      	jsr 6b46 <TestRow>(pc)
    4244:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4248:	722a           	moveq #42,d1
    424a:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    424e:	4878 0005      	pea 5 <_start+0x5>
    4252:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4258:	2f2f 01d0      	move.l 464(sp),-(sp)
    425c:	2f2f 0056      	move.l 86(sp),-(sp)
    4260:	4eba 28e4      	jsr 6b46 <TestRow>(pc)
    4264:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4268:	702a           	moveq #42,d0
    426a:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    426e:	4878 0006      	pea 6 <_start+0x6>
    4272:	42a7           	clr.l -(sp)
    4274:	2f2f 01d0      	move.l 464(sp),-(sp)
    4278:	2f2f 0056      	move.l 86(sp),-(sp)
    427c:	4eba 28c8      	jsr 6b46 <TestRow>(pc)
    4280:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4284:	722a           	moveq #42,d1
    4286:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    428a:	4878 0007      	pea 7 <_start+0x7>
    428e:	42a7           	clr.l -(sp)
    4290:	2f2f 01d0      	move.l 464(sp),-(sp)
    4294:	2f2f 0056      	move.l 86(sp),-(sp)
    4298:	4eba 28ac      	jsr 6b46 <TestRow>(pc)
    429c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42a0:	702a           	moveq #42,d0
    42a2:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    42a6:	4878 0008      	pea 8 <_start+0x8>
    42aa:	2f3c 0000 ffff 	move.l #65535,-(sp)
    42b0:	2f2f 01d0      	move.l 464(sp),-(sp)
    42b4:	2f2f 0056      	move.l 86(sp),-(sp)
    42b8:	4eba 288c      	jsr 6b46 <TestRow>(pc)
    42bc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42c0:	722a           	moveq #42,d1
    42c2:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    42c6:	4878 0009      	pea 9 <_start+0x9>
    42ca:	2f3c 0000 ffff 	move.l #65535,-(sp)
    42d0:	2f2f 01d0      	move.l 464(sp),-(sp)
    42d4:	2f2f 0056      	move.l 86(sp),-(sp)
    42d8:	4eba 286c      	jsr 6b46 <TestRow>(pc)
    42dc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42e0:	702a           	moveq #42,d0
    42e2:	d1af 01c8      	add.l d0,456(sp)

  mask = 0x0000;
    42e6:	426f 01c6      	clr.w 454(sp)
  for(int i=0;i<12;i++) {
    42ea:	42af 01a2      	clr.l 418(sp)
    42ee:	6000 01a6      	bra.w 4496 <TestZoom4Picture+0x7b2>
    for(int i2=0;i2<15;i2++) {  
    42f2:	42af 019e      	clr.l 414(sp)
    42f6:	6042           	bra.s 433a <TestZoom4Picture+0x656>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    42f8:	222f 01a2      	move.l 418(sp),d1
    42fc:	2001           	move.l d1,d0
    42fe:	d080           	add.l d0,d0
    4300:	d081           	add.l d1,d0
    4302:	2200           	move.l d0,d1
    4304:	e789           	lsl.l #3,d1
    4306:	9280           	sub.l d0,d1
    4308:	2041           	movea.l d1,a0
    430a:	d1ef 019e      	adda.l 414(sp),a0
    430e:	41e8 0009      	lea 9(a0),a0
    4312:	7000           	moveq #0,d0
    4314:	302f 01c6      	move.w 454(sp),d0
    4318:	2f08           	move.l a0,-(sp)
    431a:	2f00           	move.l d0,-(sp)
    431c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4320:	2f2f 0056      	move.l 86(sp),-(sp)
    4324:	4eba 2820      	jsr 6b46 <TestRow>(pc)
    4328:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    432c:	722a           	moveq #42,d1
    432e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4332:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {  
    4336:	52af 019e      	addq.l #1,414(sp)
    433a:	700e           	moveq #14,d0
    433c:	b0af 019e      	cmp.l 414(sp),d0
    4340:	6cb6           	bge.s 42f8 <TestZoom4Picture+0x614>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    4342:	222f 01a2      	move.l 418(sp),d1
    4346:	2001           	move.l d1,d0
    4348:	d080           	add.l d0,d0
    434a:	d081           	add.l d1,d0
    434c:	2200           	move.l d0,d1
    434e:	e789           	lsl.l #3,d1
    4350:	2041           	movea.l d1,a0
    4352:	91c0           	suba.l d0,a0
    4354:	41e8 0018      	lea 24(a0),a0
    4358:	7000           	moveq #0,d0
    435a:	302f 01c6      	move.w 454(sp),d0
    435e:	2f08           	move.l a0,-(sp)
    4360:	2f00           	move.l d0,-(sp)
    4362:	2f2f 01d0      	move.l 464(sp),-(sp)
    4366:	2f2f 0056      	move.l 86(sp),-(sp)
    436a:	4eba 27da      	jsr 6b46 <TestRow>(pc)
    436e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4372:	722a           	moveq #42,d1
    4374:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    4378:	222f 01a2      	move.l 418(sp),d1
    437c:	2001           	move.l d1,d0
    437e:	d080           	add.l d0,d0
    4380:	d081           	add.l d1,d0
    4382:	2200           	move.l d0,d1
    4384:	e789           	lsl.l #3,d1
    4386:	2041           	movea.l d1,a0
    4388:	91c0           	suba.l d0,a0
    438a:	41e8 0019      	lea 25(a0),a0
    438e:	7000           	moveq #0,d0
    4390:	302f 01c6      	move.w 454(sp),d0
    4394:	2f08           	move.l a0,-(sp)
    4396:	2f00           	move.l d0,-(sp)
    4398:	2f2f 01d0      	move.l 464(sp),-(sp)
    439c:	2f2f 0056      	move.l 86(sp),-(sp)
    43a0:	4eba 27a4      	jsr 6b46 <TestRow>(pc)
    43a4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43a8:	702a           	moveq #42,d0
    43aa:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    43ae:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    43b2:	222f 01a2      	move.l 418(sp),d1
    43b6:	2001           	move.l d1,d0
    43b8:	d080           	add.l d0,d0
    43ba:	d081           	add.l d1,d0
    43bc:	2200           	move.l d0,d1
    43be:	e789           	lsl.l #3,d1
    43c0:	2041           	movea.l d1,a0
    43c2:	91c0           	suba.l d0,a0
    43c4:	41e8 001a      	lea 26(a0),a0
    43c8:	7000           	moveq #0,d0
    43ca:	302f 01c6      	move.w 454(sp),d0
    43ce:	2f08           	move.l a0,-(sp)
    43d0:	2f00           	move.l d0,-(sp)
    43d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    43d6:	2f2f 0056      	move.l 86(sp),-(sp)
    43da:	4eba 276a      	jsr 6b46 <TestRow>(pc)
    43de:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43e2:	722a           	moveq #42,d1
    43e4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    43e8:	222f 01a2      	move.l 418(sp),d1
    43ec:	2001           	move.l d1,d0
    43ee:	d080           	add.l d0,d0
    43f0:	d081           	add.l d1,d0
    43f2:	2200           	move.l d0,d1
    43f4:	e789           	lsl.l #3,d1
    43f6:	2041           	movea.l d1,a0
    43f8:	91c0           	suba.l d0,a0
    43fa:	41e8 001b      	lea 27(a0),a0
    43fe:	7000           	moveq #0,d0
    4400:	302f 01c6      	move.w 454(sp),d0
    4404:	2f08           	move.l a0,-(sp)
    4406:	2f00           	move.l d0,-(sp)
    4408:	2f2f 01d0      	move.l 464(sp),-(sp)
    440c:	2f2f 0056      	move.l 86(sp),-(sp)
    4410:	4eba 2734      	jsr 6b46 <TestRow>(pc)
    4414:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4418:	702a           	moveq #42,d0
    441a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    441e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4422:	222f 01a2      	move.l 418(sp),d1
    4426:	2001           	move.l d1,d0
    4428:	d080           	add.l d0,d0
    442a:	d081           	add.l d1,d0
    442c:	2200           	move.l d0,d1
    442e:	e789           	lsl.l #3,d1
    4430:	2041           	movea.l d1,a0
    4432:	91c0           	suba.l d0,a0
    4434:	41e8 001c      	lea 28(a0),a0
    4438:	7000           	moveq #0,d0
    443a:	302f 01c6      	move.w 454(sp),d0
    443e:	2f08           	move.l a0,-(sp)
    4440:	2f00           	move.l d0,-(sp)
    4442:	2f2f 01d0      	move.l 464(sp),-(sp)
    4446:	2f2f 0056      	move.l 86(sp),-(sp)
    444a:	4eba 26fa      	jsr 6b46 <TestRow>(pc)
    444e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4452:	722a           	moveq #42,d1
    4454:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4458:	222f 01a2      	move.l 418(sp),d1
    445c:	2001           	move.l d1,d0
    445e:	d080           	add.l d0,d0
    4460:	d081           	add.l d1,d0
    4462:	2200           	move.l d0,d1
    4464:	e789           	lsl.l #3,d1
    4466:	2041           	movea.l d1,a0
    4468:	91c0           	suba.l d0,a0
    446a:	41e8 001d      	lea 29(a0),a0
    446e:	7000           	moveq #0,d0
    4470:	302f 01c6      	move.w 454(sp),d0
    4474:	2f08           	move.l a0,-(sp)
    4476:	2f00           	move.l d0,-(sp)
    4478:	2f2f 01d0      	move.l 464(sp),-(sp)
    447c:	2f2f 0056      	move.l 86(sp),-(sp)
    4480:	4eba 26c4      	jsr 6b46 <TestRow>(pc)
    4484:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4488:	702a           	moveq #42,d0
    448a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    448e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    4492:	52af 01a2      	addq.l #1,418(sp)
    4496:	720b           	moveq #11,d1
    4498:	b2af 01a2      	cmp.l 418(sp),d1
    449c:	6c00 fe54      	bge.w 42f2 <TestZoom4Picture+0x60e>
  }

  for(int i2=0;i2<8;i2++) {  
    44a0:	42af 019a      	clr.l 410(sp)
    44a4:	6032           	bra.s 44d8 <TestZoom4Picture+0x7f4>
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    44a6:	222f 019a      	move.l 410(sp),d1
    44aa:	0681 0000 0105 	addi.l #261,d1
    44b0:	7000           	moveq #0,d0
    44b2:	302f 01c6      	move.w 454(sp),d0
    44b6:	2f01           	move.l d1,-(sp)
    44b8:	2f00           	move.l d0,-(sp)
    44ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    44be:	2f2f 0056      	move.l 86(sp),-(sp)
    44c2:	4eba 2682      	jsr 6b46 <TestRow>(pc)
    44c6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    44ca:	702a           	moveq #42,d0
    44cc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    44d0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    44d4:	52af 019a      	addq.l #1,410(sp)
    44d8:	7207           	moveq #7,d1
    44da:	b2af 019a      	cmp.l 410(sp),d1
    44de:	6cc6           	bge.s 44a6 <TestZoom4Picture+0x7c2>
  }

  tmp = source;
    44e0:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    44e6:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    44ec:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    44f2:	4878 0001      	pea 1 <_start+0x1>
    44f6:	4878 0003      	pea 3 <_start+0x3>
    44fa:	2f2f 0056      	move.l 86(sp),-(sp)
    44fe:	2f2f 006a      	move.l 106(sp),-(sp)
    4502:	4eba d590      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    4506:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    450a:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    4510:	2c40           	movea.l d0,a6
    4512:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4516:	202f 004e      	move.l 78(sp),d0
    451a:	5880           	addq.l #4,d0
    451c:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom4;
    4520:	2f7c 0000 bb4c 	move.l #47948,74(sp)
    4526:	004a 
  mask = 0x0000;
    4528:	426f 01c6      	clr.w 454(sp)
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    452c:	4878 0007      	pea 7 <_start+0x7>
    4530:	42a7           	clr.l -(sp)
    4532:	2f2f 01d0      	move.l 464(sp),-(sp)
    4536:	2f2f 0056      	move.l 86(sp),-(sp)
    453a:	4eba 260a      	jsr 6b46 <TestRow>(pc)
    453e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4542:	722a           	moveq #42,d1
    4544:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    4548:	4878 0008      	pea 8 <_start+0x8>
    454c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4552:	2f2f 01d0      	move.l 464(sp),-(sp)
    4556:	2f2f 0056      	move.l 86(sp),-(sp)
    455a:	4eba 25ea      	jsr 6b46 <TestRow>(pc)
    455e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4562:	702a           	moveq #42,d0
    4564:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    4568:	4878 0009      	pea 9 <_start+0x9>
    456c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4572:	2f2f 01d0      	move.l 464(sp),-(sp)
    4576:	2f2f 0056      	move.l 86(sp),-(sp)
    457a:	4eba 25ca      	jsr 6b46 <TestRow>(pc)
    457e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4582:	722a           	moveq #42,d1
    4584:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    4588:	4878 0008      	pea 8 <_start+0x8>
    458c:	42a7           	clr.l -(sp)
    458e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4592:	2f2f 0056      	move.l 86(sp),-(sp)
    4596:	4eba 25ae      	jsr 6b46 <TestRow>(pc)
    459a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    459e:	702a           	moveq #42,d0
    45a0:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    45a4:	4878 0009      	pea 9 <_start+0x9>
    45a8:	42a7           	clr.l -(sp)
    45aa:	2f2f 01d0      	move.l 464(sp),-(sp)
    45ae:	2f2f 0056      	move.l 86(sp),-(sp)
    45b2:	4eba 2592      	jsr 6b46 <TestRow>(pc)
    45b6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    45ba:	722a           	moveq #42,d1
    45bc:	d3af 01c8      	add.l d1,456(sp)

  mask = 0xffff;
    45c0:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<12;i++) {
    45c6:	42af 0196      	clr.l 406(sp)
    45ca:	6000 0216      	bra.w 47e2 <TestZoom4Picture+0xafe>
    for(int i2=0;i2<14;i2++) {  
    45ce:	42af 0192      	clr.l 402(sp)
    45d2:	6042           	bra.s 4616 <TestZoom4Picture+0x932>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    45d4:	222f 0196      	move.l 406(sp),d1
    45d8:	2001           	move.l d1,d0
    45da:	d080           	add.l d0,d0
    45dc:	d081           	add.l d1,d0
    45de:	2200           	move.l d0,d1
    45e0:	e789           	lsl.l #3,d1
    45e2:	9280           	sub.l d0,d1
    45e4:	2041           	movea.l d1,a0
    45e6:	d1ef 0192      	adda.l 402(sp),a0
    45ea:	41e8 0009      	lea 9(a0),a0
    45ee:	7000           	moveq #0,d0
    45f0:	302f 01c6      	move.w 454(sp),d0
    45f4:	2f08           	move.l a0,-(sp)
    45f6:	2f00           	move.l d0,-(sp)
    45f8:	2f2f 01d0      	move.l 464(sp),-(sp)
    45fc:	2f2f 0056      	move.l 86(sp),-(sp)
    4600:	4eba 2544      	jsr 6b46 <TestRow>(pc)
    4604:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4608:	702a           	moveq #42,d0
    460a:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    460e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {  
    4612:	52af 0192      	addq.l #1,402(sp)
    4616:	720d           	moveq #13,d1
    4618:	b2af 0192      	cmp.l 402(sp),d1
    461c:	6cb6           	bge.s 45d4 <TestZoom4Picture+0x8f0>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    461e:	222f 0196      	move.l 406(sp),d1
    4622:	2001           	move.l d1,d0
    4624:	d080           	add.l d0,d0
    4626:	d081           	add.l d1,d0
    4628:	2200           	move.l d0,d1
    462a:	e789           	lsl.l #3,d1
    462c:	2041           	movea.l d1,a0
    462e:	91c0           	suba.l d0,a0
    4630:	41e8 0018      	lea 24(a0),a0
    4634:	7000           	moveq #0,d0
    4636:	302f 01c6      	move.w 454(sp),d0
    463a:	2f08           	move.l a0,-(sp)
    463c:	2f00           	move.l d0,-(sp)
    463e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4642:	2f2f 0056      	move.l 86(sp),-(sp)
    4646:	4eba 24fe      	jsr 6b46 <TestRow>(pc)
    464a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    464e:	702a           	moveq #42,d0
    4650:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    4654:	222f 0196      	move.l 406(sp),d1
    4658:	2001           	move.l d1,d0
    465a:	d080           	add.l d0,d0
    465c:	d081           	add.l d1,d0
    465e:	2200           	move.l d0,d1
    4660:	e789           	lsl.l #3,d1
    4662:	2041           	movea.l d1,a0
    4664:	91c0           	suba.l d0,a0
    4666:	41e8 0019      	lea 25(a0),a0
    466a:	7000           	moveq #0,d0
    466c:	302f 01c6      	move.w 454(sp),d0
    4670:	2f08           	move.l a0,-(sp)
    4672:	2f00           	move.l d0,-(sp)
    4674:	2f2f 01d0      	move.l 464(sp),-(sp)
    4678:	2f2f 0056      	move.l 86(sp),-(sp)
    467c:	4eba 24c8      	jsr 6b46 <TestRow>(pc)
    4680:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4684:	722a           	moveq #42,d1
    4686:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    468a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    468e:	222f 0196      	move.l 406(sp),d1
    4692:	2001           	move.l d1,d0
    4694:	d080           	add.l d0,d0
    4696:	d081           	add.l d1,d0
    4698:	2200           	move.l d0,d1
    469a:	e789           	lsl.l #3,d1
    469c:	2041           	movea.l d1,a0
    469e:	91c0           	suba.l d0,a0
    46a0:	41e8 001a      	lea 26(a0),a0
    46a4:	7000           	moveq #0,d0
    46a6:	302f 01c6      	move.w 454(sp),d0
    46aa:	2f08           	move.l a0,-(sp)
    46ac:	2f00           	move.l d0,-(sp)
    46ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    46b2:	2f2f 0056      	move.l 86(sp),-(sp)
    46b6:	4eba 248e      	jsr 6b46 <TestRow>(pc)
    46ba:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46be:	702a           	moveq #42,d0
    46c0:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    46c4:	222f 0196      	move.l 406(sp),d1
    46c8:	2001           	move.l d1,d0
    46ca:	d080           	add.l d0,d0
    46cc:	d081           	add.l d1,d0
    46ce:	2200           	move.l d0,d1
    46d0:	e789           	lsl.l #3,d1
    46d2:	2041           	movea.l d1,a0
    46d4:	91c0           	suba.l d0,a0
    46d6:	41e8 001b      	lea 27(a0),a0
    46da:	7000           	moveq #0,d0
    46dc:	302f 01c6      	move.w 454(sp),d0
    46e0:	2f08           	move.l a0,-(sp)
    46e2:	2f00           	move.l d0,-(sp)
    46e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    46e8:	2f2f 0056      	move.l 86(sp),-(sp)
    46ec:	4eba 2458      	jsr 6b46 <TestRow>(pc)
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
    4726:	4eba 241e      	jsr 6b46 <TestRow>(pc)
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
    475c:	4eba 23e8      	jsr 6b46 <TestRow>(pc)
    4760:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4764:	722a           	moveq #42,d1
    4766:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    476a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    476e:	222f 0196      	move.l 406(sp),d1
    4772:	2001           	move.l d1,d0
    4774:	d080           	add.l d0,d0
    4776:	d081           	add.l d1,d0
    4778:	2200           	move.l d0,d1
    477a:	e789           	lsl.l #3,d1
    477c:	2041           	movea.l d1,a0
    477e:	91c0           	suba.l d0,a0
    4780:	41e8 001c      	lea 28(a0),a0
    4784:	7000           	moveq #0,d0
    4786:	302f 01c6      	move.w 454(sp),d0
    478a:	2f08           	move.l a0,-(sp)
    478c:	2f00           	move.l d0,-(sp)
    478e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4792:	2f2f 0056      	move.l 86(sp),-(sp)
    4796:	4eba 23ae      	jsr 6b46 <TestRow>(pc)
    479a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    479e:	702a           	moveq #42,d0
    47a0:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    47a4:	222f 0196      	move.l 406(sp),d1
    47a8:	2001           	move.l d1,d0
    47aa:	d080           	add.l d0,d0
    47ac:	d081           	add.l d1,d0
    47ae:	2200           	move.l d0,d1
    47b0:	e789           	lsl.l #3,d1
    47b2:	2041           	movea.l d1,a0
    47b4:	91c0           	suba.l d0,a0
    47b6:	41e8 001d      	lea 29(a0),a0
    47ba:	7000           	moveq #0,d0
    47bc:	302f 01c6      	move.w 454(sp),d0
    47c0:	2f08           	move.l a0,-(sp)
    47c2:	2f00           	move.l d0,-(sp)
    47c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    47c8:	2f2f 0056      	move.l 86(sp),-(sp)
    47cc:	4eba 2378      	jsr 6b46 <TestRow>(pc)
    47d0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    47d4:	722a           	moveq #42,d1
    47d6:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    47da:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    47de:	52af 0196      	addq.l #1,406(sp)
    47e2:	700b           	moveq #11,d0
    47e4:	b0af 0196      	cmp.l 406(sp),d0
    47e8:	6c00 fde4      	bge.w 45ce <TestZoom4Picture+0x8ea>
  }

  TestRow( valsupposed, valactual, mask, 269);
    47ec:	7000           	moveq #0,d0
    47ee:	302f 01c6      	move.w 454(sp),d0
    47f2:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    47f6:	2f00           	move.l d0,-(sp)
    47f8:	2f2f 01d0      	move.l 464(sp),-(sp)
    47fc:	2f2f 0056      	move.l 86(sp),-(sp)
    4800:	4eba 2344      	jsr 6b46 <TestRow>(pc)
    4804:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4808:	722a           	moveq #42,d1
    480a:	d3af 01c8      	add.l d1,456(sp)
  
  tmp = source;
    480e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4814:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    481a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    4820:	4878 0001      	pea 1 <_start+0x1>
    4824:	4878 0004      	pea 4 <_start+0x4>
    4828:	2f2f 0056      	move.l 86(sp),-(sp)
    482c:	2f2f 006a      	move.l 106(sp),-(sp)
    4830:	4eba d262      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    4834:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4838:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    483e:	2c40           	movea.l d0,a6
    4840:	4eae ff1c      	jsr -228(a6)

  valactual = destination+2; 
    4844:	202f 004e      	move.l 78(sp),d0
    4848:	5880           	addq.l #4,d0
    484a:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom5;
    484e:	2f7c 0000 bb78 	move.l #47992,74(sp)
    4854:	004a 
  mask = 0x0000;
    4856:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<13;i2++) {  
    485a:	42af 018e      	clr.l 398(sp)
    485e:	602a           	bra.s 488a <TestZoom4Picture+0xba6>
    TestRow( valsupposed, valactual, mask, i2);
    4860:	7000           	moveq #0,d0
    4862:	302f 01c6      	move.w 454(sp),d0
    4866:	2f2f 018e      	move.l 398(sp),-(sp)
    486a:	2f00           	move.l d0,-(sp)
    486c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4870:	2f2f 0056      	move.l 86(sp),-(sp)
    4874:	4eba 22d0      	jsr 6b46 <TestRow>(pc)
    4878:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    487c:	722a           	moveq #42,d1
    487e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4882:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4886:	52af 018e      	addq.l #1,398(sp)
    488a:	700c           	moveq #12,d0
    488c:	b0af 018e      	cmp.l 398(sp),d0
    4890:	6cce           	bge.s 4860 <TestZoom4Picture+0xb7c>
  }

  TestRow( valsupposed, valactual, mask, 12);   
    4892:	7000           	moveq #0,d0
    4894:	302f 01c6      	move.w 454(sp),d0
    4898:	4878 000c      	pea c <_start+0xc>
    489c:	2f00           	move.l d0,-(sp)
    489e:	2f2f 01d0      	move.l 464(sp),-(sp)
    48a2:	2f2f 0056      	move.l 86(sp),-(sp)
    48a6:	4eba 229e      	jsr 6b46 <TestRow>(pc)
    48aa:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48ae:	722a           	moveq #42,d1
    48b0:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 13);
    48b4:	7000           	moveq #0,d0
    48b6:	302f 01c6      	move.w 454(sp),d0
    48ba:	4878 000d      	pea d <_start+0xd>
    48be:	2f00           	move.l d0,-(sp)
    48c0:	2f2f 01d0      	move.l 464(sp),-(sp)
    48c4:	2f2f 0056      	move.l 86(sp),-(sp)
    48c8:	4eba 227c      	jsr 6b46 <TestRow>(pc)
    48cc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48d0:	702a           	moveq #42,d0
    48d2:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    48d6:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 14);
    48da:	7000           	moveq #0,d0
    48dc:	302f 01c6      	move.w 454(sp),d0
    48e0:	4878 000e      	pea e <_start+0xe>
    48e4:	2f00           	move.l d0,-(sp)
    48e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    48ea:	2f2f 0056      	move.l 86(sp),-(sp)
    48ee:	4eba 2256      	jsr 6b46 <TestRow>(pc)
    48f2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48f6:	722a           	moveq #42,d1
    48f8:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 15);
    48fc:	7000           	moveq #0,d0
    48fe:	302f 01c6      	move.w 454(sp),d0
    4902:	4878 000f      	pea f <_start+0xf>
    4906:	2f00           	move.l d0,-(sp)
    4908:	2f2f 01d0      	move.l 464(sp),-(sp)
    490c:	2f2f 0056      	move.l 86(sp),-(sp)
    4910:	4eba 2234      	jsr 6b46 <TestRow>(pc)
    4914:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4918:	702a           	moveq #42,d0
    491a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    491e:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 16);
    4922:	7000           	moveq #0,d0
    4924:	302f 01c6      	move.w 454(sp),d0
    4928:	4878 0010      	pea 10 <_start+0x10>
    492c:	2f00           	move.l d0,-(sp)
    492e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4932:	2f2f 0056      	move.l 86(sp),-(sp)
    4936:	4eba 220e      	jsr 6b46 <TestRow>(pc)
    493a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    493e:	722a           	moveq #42,d1
    4940:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 17);
    4944:	7000           	moveq #0,d0
    4946:	302f 01c6      	move.w 454(sp),d0
    494a:	4878 0011      	pea 11 <_start+0x11>
    494e:	2f00           	move.l d0,-(sp)
    4950:	2f2f 01d0      	move.l 464(sp),-(sp)
    4954:	2f2f 0056      	move.l 86(sp),-(sp)
    4958:	4eba 21ec      	jsr 6b46 <TestRow>(pc)
    495c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4960:	702a           	moveq #42,d0
    4962:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4966:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 18);
    496a:	7000           	moveq #0,d0
    496c:	302f 01c6      	move.w 454(sp),d0
    4970:	4878 0012      	pea 12 <_start+0x12>
    4974:	2f00           	move.l d0,-(sp)
    4976:	2f2f 01d0      	move.l 464(sp),-(sp)
    497a:	2f2f 0056      	move.l 86(sp),-(sp)
    497e:	4eba 21c6      	jsr 6b46 <TestRow>(pc)
    4982:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4986:	722a           	moveq #42,d1
    4988:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 19);
    498c:	7000           	moveq #0,d0
    498e:	302f 01c6      	move.w 454(sp),d0
    4992:	4878 0013      	pea 13 <_start+0x13>
    4996:	2f00           	move.l d0,-(sp)
    4998:	2f2f 01d0      	move.l 464(sp),-(sp)
    499c:	2f2f 0056      	move.l 86(sp),-(sp)
    49a0:	4eba 21a4      	jsr 6b46 <TestRow>(pc)
    49a4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49a8:	702a           	moveq #42,d0
    49aa:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    49ae:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 20);
    49b2:	7000           	moveq #0,d0
    49b4:	302f 01c6      	move.w 454(sp),d0
    49b8:	4878 0014      	pea 14 <_start+0x14>
    49bc:	2f00           	move.l d0,-(sp)
    49be:	2f2f 01d0      	move.l 464(sp),-(sp)
    49c2:	2f2f 0056      	move.l 86(sp),-(sp)
    49c6:	4eba 217e      	jsr 6b46 <TestRow>(pc)
    49ca:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49ce:	722a           	moveq #42,d1
    49d0:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 21);
    49d4:	7000           	moveq #0,d0
    49d6:	302f 01c6      	move.w 454(sp),d0
    49da:	4878 0015      	pea 15 <_start+0x15>
    49de:	2f00           	move.l d0,-(sp)
    49e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    49e4:	2f2f 0056      	move.l 86(sp),-(sp)
    49e8:	4eba 215c      	jsr 6b46 <TestRow>(pc)
    49ec:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49f0:	702a           	moveq #42,d0
    49f2:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    49f6:	466f 01c6      	not.w 454(sp)


  for(int i=0;i<10;i++) {
    49fa:	42af 018a      	clr.l 394(sp)
    49fe:	6000 0286      	bra.w 4c86 <TestZoom4Picture+0xfa2>
    for(int i2=0;i2<13;i2++) {  
    4a02:	42af 0186      	clr.l 390(sp)
    4a06:	6042           	bra.s 4a4a <TestZoom4Picture+0xd66>
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    4a08:	222f 018a      	move.l 394(sp),d1
    4a0c:	2001           	move.l d1,d0
    4a0e:	d080           	add.l d0,d0
    4a10:	d081           	add.l d1,d0
    4a12:	2200           	move.l d0,d1
    4a14:	e789           	lsl.l #3,d1
    4a16:	9280           	sub.l d0,d1
    4a18:	2041           	movea.l d1,a0
    4a1a:	d1ef 0186      	adda.l 390(sp),a0
    4a1e:	41e8 0016      	lea 22(a0),a0
    4a22:	7000           	moveq #0,d0
    4a24:	302f 01c6      	move.w 454(sp),d0
    4a28:	2f08           	move.l a0,-(sp)
    4a2a:	2f00           	move.l d0,-(sp)
    4a2c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a30:	2f2f 0056      	move.l 86(sp),-(sp)
    4a34:	4eba 2110      	jsr 6b46 <TestRow>(pc)
    4a38:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4a3c:	722a           	moveq #42,d1
    4a3e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4a42:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {  
    4a46:	52af 0186      	addq.l #1,390(sp)
    4a4a:	700c           	moveq #12,d0
    4a4c:	b0af 0186      	cmp.l 390(sp),d0
    4a50:	6cb6           	bge.s 4a08 <TestZoom4Picture+0xd24>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    4a52:	222f 018a      	move.l 394(sp),d1
    4a56:	2001           	move.l d1,d0
    4a58:	d080           	add.l d0,d0
    4a5a:	d081           	add.l d1,d0
    4a5c:	2200           	move.l d0,d1
    4a5e:	e789           	lsl.l #3,d1
    4a60:	2041           	movea.l d1,a0
    4a62:	91c0           	suba.l d0,a0
    4a64:	41e8 0023      	lea 35(a0),a0
    4a68:	7000           	moveq #0,d0
    4a6a:	302f 01c6      	move.w 454(sp),d0
    4a6e:	2f08           	move.l a0,-(sp)
    4a70:	2f00           	move.l d0,-(sp)
    4a72:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a76:	2f2f 0056      	move.l 86(sp),-(sp)
    4a7a:	4eba 20ca      	jsr 6b46 <TestRow>(pc)
    4a7e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a82:	722a           	moveq #42,d1
    4a84:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    4a88:	222f 018a      	move.l 394(sp),d1
    4a8c:	2001           	move.l d1,d0
    4a8e:	d080           	add.l d0,d0
    4a90:	d081           	add.l d1,d0
    4a92:	2200           	move.l d0,d1
    4a94:	e789           	lsl.l #3,d1
    4a96:	2041           	movea.l d1,a0
    4a98:	91c0           	suba.l d0,a0
    4a9a:	41e8 0024      	lea 36(a0),a0
    4a9e:	7000           	moveq #0,d0
    4aa0:	302f 01c6      	move.w 454(sp),d0
    4aa4:	2f08           	move.l a0,-(sp)
    4aa6:	2f00           	move.l d0,-(sp)
    4aa8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4aac:	2f2f 0056      	move.l 86(sp),-(sp)
    4ab0:	4eba 2094      	jsr 6b46 <TestRow>(pc)
    4ab4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ab8:	702a           	moveq #42,d0
    4aba:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4abe:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    4ac2:	222f 018a      	move.l 394(sp),d1
    4ac6:	2001           	move.l d1,d0
    4ac8:	d080           	add.l d0,d0
    4aca:	d081           	add.l d1,d0
    4acc:	2200           	move.l d0,d1
    4ace:	e789           	lsl.l #3,d1
    4ad0:	2041           	movea.l d1,a0
    4ad2:	91c0           	suba.l d0,a0
    4ad4:	41e8 0025      	lea 37(a0),a0
    4ad8:	7000           	moveq #0,d0
    4ada:	302f 01c6      	move.w 454(sp),d0
    4ade:	2f08           	move.l a0,-(sp)
    4ae0:	2f00           	move.l d0,-(sp)
    4ae2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ae6:	2f2f 0056      	move.l 86(sp),-(sp)
    4aea:	4eba 205a      	jsr 6b46 <TestRow>(pc)
    4aee:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4af2:	722a           	moveq #42,d1
    4af4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    4af8:	222f 018a      	move.l 394(sp),d1
    4afc:	2001           	move.l d1,d0
    4afe:	d080           	add.l d0,d0
    4b00:	d081           	add.l d1,d0
    4b02:	2200           	move.l d0,d1
    4b04:	e789           	lsl.l #3,d1
    4b06:	2041           	movea.l d1,a0
    4b08:	91c0           	suba.l d0,a0
    4b0a:	41e8 0026      	lea 38(a0),a0
    4b0e:	7000           	moveq #0,d0
    4b10:	302f 01c6      	move.w 454(sp),d0
    4b14:	2f08           	move.l a0,-(sp)
    4b16:	2f00           	move.l d0,-(sp)
    4b18:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b1c:	2f2f 0056      	move.l 86(sp),-(sp)
    4b20:	4eba 2024      	jsr 6b46 <TestRow>(pc)
    4b24:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b28:	702a           	moveq #42,d0
    4b2a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b2e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    4b32:	222f 018a      	move.l 394(sp),d1
    4b36:	2001           	move.l d1,d0
    4b38:	d080           	add.l d0,d0
    4b3a:	d081           	add.l d1,d0
    4b3c:	2200           	move.l d0,d1
    4b3e:	e789           	lsl.l #3,d1
    4b40:	2041           	movea.l d1,a0
    4b42:	91c0           	suba.l d0,a0
    4b44:	41e8 0027      	lea 39(a0),a0
    4b48:	7000           	moveq #0,d0
    4b4a:	302f 01c6      	move.w 454(sp),d0
    4b4e:	2f08           	move.l a0,-(sp)
    4b50:	2f00           	move.l d0,-(sp)
    4b52:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b56:	2f2f 0056      	move.l 86(sp),-(sp)
    4b5a:	4eba 1fea      	jsr 6b46 <TestRow>(pc)
    4b5e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b62:	722a           	moveq #42,d1
    4b64:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    4b68:	222f 018a      	move.l 394(sp),d1
    4b6c:	2001           	move.l d1,d0
    4b6e:	d080           	add.l d0,d0
    4b70:	d081           	add.l d1,d0
    4b72:	2200           	move.l d0,d1
    4b74:	e789           	lsl.l #3,d1
    4b76:	2041           	movea.l d1,a0
    4b78:	91c0           	suba.l d0,a0
    4b7a:	41e8 0028      	lea 40(a0),a0
    4b7e:	7000           	moveq #0,d0
    4b80:	302f 01c6      	move.w 454(sp),d0
    4b84:	2f08           	move.l a0,-(sp)
    4b86:	2f00           	move.l d0,-(sp)
    4b88:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b8c:	2f2f 0056      	move.l 86(sp),-(sp)
    4b90:	4eba 1fb4      	jsr 6b46 <TestRow>(pc)
    4b94:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b98:	702a           	moveq #42,d0
    4b9a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b9e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    4ba2:	222f 018a      	move.l 394(sp),d1
    4ba6:	2001           	move.l d1,d0
    4ba8:	d080           	add.l d0,d0
    4baa:	d081           	add.l d1,d0
    4bac:	2200           	move.l d0,d1
    4bae:	e789           	lsl.l #3,d1
    4bb0:	2041           	movea.l d1,a0
    4bb2:	91c0           	suba.l d0,a0
    4bb4:	41e8 0029      	lea 41(a0),a0
    4bb8:	7000           	moveq #0,d0
    4bba:	302f 01c6      	move.w 454(sp),d0
    4bbe:	2f08           	move.l a0,-(sp)
    4bc0:	2f00           	move.l d0,-(sp)
    4bc2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bc6:	2f2f 0056      	move.l 86(sp),-(sp)
    4bca:	4eba 1f7a      	jsr 6b46 <TestRow>(pc)
    4bce:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4bd2:	722a           	moveq #42,d1
    4bd4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    4bd8:	222f 018a      	move.l 394(sp),d1
    4bdc:	2001           	move.l d1,d0
    4bde:	d080           	add.l d0,d0
    4be0:	d081           	add.l d1,d0
    4be2:	2200           	move.l d0,d1
    4be4:	e789           	lsl.l #3,d1
    4be6:	2041           	movea.l d1,a0
    4be8:	91c0           	suba.l d0,a0
    4bea:	41e8 002a      	lea 42(a0),a0
    4bee:	7000           	moveq #0,d0
    4bf0:	302f 01c6      	move.w 454(sp),d0
    4bf4:	2f08           	move.l a0,-(sp)
    4bf6:	2f00           	move.l d0,-(sp)
    4bf8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bfc:	2f2f 0056      	move.l 86(sp),-(sp)
    4c00:	4eba 1f44      	jsr 6b46 <TestRow>(pc)
    4c04:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c08:	702a           	moveq #42,d0
    4c0a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c0e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    4c12:	222f 018a      	move.l 394(sp),d1
    4c16:	2001           	move.l d1,d0
    4c18:	d080           	add.l d0,d0
    4c1a:	d081           	add.l d1,d0
    4c1c:	2200           	move.l d0,d1
    4c1e:	e789           	lsl.l #3,d1
    4c20:	2041           	movea.l d1,a0
    4c22:	91c0           	suba.l d0,a0
    4c24:	41e8 002b      	lea 43(a0),a0
    4c28:	7000           	moveq #0,d0
    4c2a:	302f 01c6      	move.w 454(sp),d0
    4c2e:	2f08           	move.l a0,-(sp)
    4c30:	2f00           	move.l d0,-(sp)
    4c32:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c36:	2f2f 0056      	move.l 86(sp),-(sp)
    4c3a:	4eba 1f0a      	jsr 6b46 <TestRow>(pc)
    4c3e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c42:	722a           	moveq #42,d1
    4c44:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    4c48:	222f 018a      	move.l 394(sp),d1
    4c4c:	2001           	move.l d1,d0
    4c4e:	d080           	add.l d0,d0
    4c50:	d081           	add.l d1,d0
    4c52:	2200           	move.l d0,d1
    4c54:	e789           	lsl.l #3,d1
    4c56:	2041           	movea.l d1,a0
    4c58:	91c0           	suba.l d0,a0
    4c5a:	41e8 002c      	lea 44(a0),a0
    4c5e:	7000           	moveq #0,d0
    4c60:	302f 01c6      	move.w 454(sp),d0
    4c64:	2f08           	move.l a0,-(sp)
    4c66:	2f00           	move.l d0,-(sp)
    4c68:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c6c:	2f2f 0056      	move.l 86(sp),-(sp)
    4c70:	4eba 1ed4      	jsr 6b46 <TestRow>(pc)
    4c74:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c78:	702a           	moveq #42,d0
    4c7a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c7e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<10;i++) {
    4c82:	52af 018a      	addq.l #1,394(sp)
    4c86:	7209           	moveq #9,d1
    4c88:	b2af 018a      	cmp.l 394(sp),d1
    4c8c:	6c00 fd74      	bge.w 4a02 <TestZoom4Picture+0xd1e>
  }

  for(int i2=0;i2<13;i2++) {  
    4c90:	42af 0182      	clr.l 386(sp)
    4c94:	6032           	bra.s 4cc8 <TestZoom4Picture+0xfe4>
    TestRow( valsupposed, valactual, mask, i2+253);
    4c96:	222f 0182      	move.l 386(sp),d1
    4c9a:	0681 0000 00fd 	addi.l #253,d1
    4ca0:	7000           	moveq #0,d0
    4ca2:	302f 01c6      	move.w 454(sp),d0
    4ca6:	2f01           	move.l d1,-(sp)
    4ca8:	2f00           	move.l d0,-(sp)
    4caa:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cae:	2f2f 0056      	move.l 86(sp),-(sp)
    4cb2:	4eba 1e92      	jsr 6b46 <TestRow>(pc)
    4cb6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4cba:	702a           	moveq #42,d0
    4cbc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4cc0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4cc4:	52af 0182      	addq.l #1,386(sp)
    4cc8:	720c           	moveq #12,d1
    4cca:	b2af 0182      	cmp.l 386(sp),d1
    4cce:	6cc6           	bge.s 4c96 <TestZoom4Picture+0xfb2>
  }

  TestRow( valsupposed, valactual, mask, 266);
    4cd0:	7000           	moveq #0,d0
    4cd2:	302f 01c6      	move.w 454(sp),d0
    4cd6:	4878 010a      	pea 10a <FreeDisplay+0x2a>
    4cda:	2f00           	move.l d0,-(sp)
    4cdc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ce0:	2f2f 0056      	move.l 86(sp),-(sp)
    4ce4:	4eba 1e60      	jsr 6b46 <TestRow>(pc)
    4ce8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4cec:	702a           	moveq #42,d0
    4cee:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 267);
    4cf2:	7000           	moveq #0,d0
    4cf4:	302f 01c6      	move.w 454(sp),d0
    4cf8:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    4cfc:	2f00           	move.l d0,-(sp)
    4cfe:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d02:	2f2f 0056      	move.l 86(sp),-(sp)
    4d06:	4eba 1e3e      	jsr 6b46 <TestRow>(pc)
    4d0a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d0e:	722a           	moveq #42,d1
    4d10:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4d14:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 268);
    4d18:	7000           	moveq #0,d0
    4d1a:	302f 01c6      	move.w 454(sp),d0
    4d1e:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    4d22:	2f00           	move.l d0,-(sp)
    4d24:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d28:	2f2f 0056      	move.l 86(sp),-(sp)
    4d2c:	4eba 1e18      	jsr 6b46 <TestRow>(pc)
    4d30:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d34:	702a           	moveq #42,d0
    4d36:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 269);
    4d3a:	7000           	moveq #0,d0
    4d3c:	302f 01c6      	move.w 454(sp),d0
    4d40:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4d44:	2f00           	move.l d0,-(sp)
    4d46:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d4a:	2f2f 0056      	move.l 86(sp),-(sp)
    4d4e:	4eba 1df6      	jsr 6b46 <TestRow>(pc)
    4d52:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d56:	722a           	moveq #42,d1
    4d58:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4d5c:	466f 01c6      	not.w 454(sp)

  tmp = source;
    4d60:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4d66:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4d6c:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    4d72:	4878 0001      	pea 1 <_start+0x1>
    4d76:	4878 0005      	pea 5 <_start+0x5>
    4d7a:	2f2f 0056      	move.l 86(sp),-(sp)
    4d7e:	2f2f 006a      	move.l 106(sp),-(sp)
    4d82:	4eba cd10      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    4d86:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4d8a:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    4d90:	2c40           	movea.l d0,a6
    4d92:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4d96:	202f 004e      	move.l 78(sp),d0
    4d9a:	5880           	addq.l #4,d0
    4d9c:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom6;
    4da0:	2f7c 0000 bba4 	move.l #48036,74(sp)
    4da6:	004a 
  mask = 0x0000;
    4da8:	426f 01c6      	clr.w 454(sp)
 
  for(int i2=0;i2<7;i2++) {  
    4dac:	42af 017e      	clr.l 382(sp)
    4db0:	602a           	bra.s 4ddc <TestZoom4Picture+0x10f8>
    TestRow( valsupposed, valactual, mask, i2);
    4db2:	7000           	moveq #0,d0
    4db4:	302f 01c6      	move.w 454(sp),d0
    4db8:	2f2f 017e      	move.l 382(sp),-(sp)
    4dbc:	2f00           	move.l d0,-(sp)
    4dbe:	2f2f 01d0      	move.l 464(sp),-(sp)
    4dc2:	2f2f 0056      	move.l 86(sp),-(sp)
    4dc6:	4eba 1d7e      	jsr 6b46 <TestRow>(pc)
    4dca:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4dce:	722a           	moveq #42,d1
    4dd0:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4dd4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    4dd8:	52af 017e      	addq.l #1,382(sp)
    4ddc:	7006           	moveq #6,d0
    4dde:	b0af 017e      	cmp.l 382(sp),d0
    4de2:	6cce           	bge.s 4db2 <TestZoom4Picture+0x10ce>
  }

  for(int i=0;i<6;i++) {
    4de4:	42af 017a      	clr.l 378(sp)
    4de8:	605c           	bra.s 4e46 <TestZoom4Picture+0x1162>
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    4dea:	202f 017a      	move.l 378(sp),d0
    4dee:	d080           	add.l d0,d0
    4df0:	2200           	move.l d0,d1
    4df2:	5e81           	addq.l #7,d1
    4df4:	7000           	moveq #0,d0
    4df6:	302f 01c6      	move.w 454(sp),d0
    4dfa:	2f01           	move.l d1,-(sp)
    4dfc:	2f00           	move.l d0,-(sp)
    4dfe:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e02:	2f2f 0056      	move.l 86(sp),-(sp)
    4e06:	4eba 1d3e      	jsr 6b46 <TestRow>(pc)
    4e0a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e0e:	722a           	moveq #42,d1
    4e10:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    4e14:	202f 017a      	move.l 378(sp),d0
    4e18:	5880           	addq.l #4,d0
    4e1a:	d080           	add.l d0,d0
    4e1c:	2200           	move.l d0,d1
    4e1e:	7000           	moveq #0,d0
    4e20:	302f 01c6      	move.w 454(sp),d0
    4e24:	2f01           	move.l d1,-(sp)
    4e26:	2f00           	move.l d0,-(sp)
    4e28:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e2c:	2f2f 0056      	move.l 86(sp),-(sp)
    4e30:	4eba 1d14      	jsr 6b46 <TestRow>(pc)
    4e34:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e38:	702a           	moveq #42,d0
    4e3a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4e3e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<6;i++) {
    4e42:	52af 017a      	addq.l #1,378(sp)
    4e46:	7205           	moveq #5,d1
    4e48:	b2af 017a      	cmp.l 378(sp),d1
    4e4c:	6c9c           	bge.s 4dea <TestZoom4Picture+0x1106>
  }

  for(int i=0;i<10;i++) {
    4e4e:	42af 0176      	clr.l 374(sp)
    4e52:	6000 00ce      	bra.w 4f22 <TestZoom4Picture+0x123e>
    for(int i2=0;i2<12;i2++) {  
    4e56:	42af 0172      	clr.l 370(sp)
    4e5a:	6040           	bra.s 4e9c <TestZoom4Picture+0x11b8>
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    4e5c:	307c 0013      	movea.w #19,a0
    4e60:	d1ef 0172      	adda.l 370(sp),a0
    4e64:	222f 0176      	move.l 374(sp),d1
    4e68:	2001           	move.l d1,d0
    4e6a:	d080           	add.l d0,d0
    4e6c:	d081           	add.l d1,d0
    4e6e:	e788           	lsl.l #3,d0
    4e70:	2208           	move.l a0,d1
    4e72:	d280           	add.l d0,d1
    4e74:	7000           	moveq #0,d0
    4e76:	302f 01c6      	move.w 454(sp),d0
    4e7a:	2f01           	move.l d1,-(sp)
    4e7c:	2f00           	move.l d0,-(sp)
    4e7e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e82:	2f2f 0056      	move.l 86(sp),-(sp)
    4e86:	4eba 1cbe      	jsr 6b46 <TestRow>(pc)
    4e8a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4e8e:	702a           	moveq #42,d0
    4e90:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4e94:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {  
    4e98:	52af 0172      	addq.l #1,370(sp)
    4e9c:	720b           	moveq #11,d1
    4e9e:	b2af 0172      	cmp.l 370(sp),d1
    4ea2:	6cb8           	bge.s 4e5c <TestZoom4Picture+0x1178>
    }
    for(int i=0;i<6;i++) {
    4ea4:	42af 016e      	clr.l 366(sp)
    4ea8:	606c           	bra.s 4f16 <TestZoom4Picture+0x1232>
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    4eaa:	222f 016e      	move.l 366(sp),d1
    4eae:	2001           	move.l d1,d0
    4eb0:	d080           	add.l d0,d0
    4eb2:	d081           	add.l d1,d0
    4eb4:	e788           	lsl.l #3,d0
    4eb6:	2040           	movea.l d0,a0
    4eb8:	41e8 001f      	lea 31(a0),a0
    4ebc:	7000           	moveq #0,d0
    4ebe:	302f 01c6      	move.w 454(sp),d0
    4ec2:	2f08           	move.l a0,-(sp)
    4ec4:	2f00           	move.l d0,-(sp)
    4ec6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4eca:	2f2f 0056      	move.l 86(sp),-(sp)
    4ece:	4eba 1c76      	jsr 6b46 <TestRow>(pc)
    4ed2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4ed6:	702a           	moveq #42,d0
    4ed8:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    4edc:	222f 016e      	move.l 366(sp),d1
    4ee0:	2001           	move.l d1,d0
    4ee2:	d080           	add.l d0,d0
    4ee4:	d081           	add.l d1,d0
    4ee6:	e788           	lsl.l #3,d0
    4ee8:	2040           	movea.l d0,a0
    4eea:	41e8 0020      	lea 32(a0),a0
    4eee:	7000           	moveq #0,d0
    4ef0:	302f 01c6      	move.w 454(sp),d0
    4ef4:	2f08           	move.l a0,-(sp)
    4ef6:	2f00           	move.l d0,-(sp)
    4ef8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4efc:	2f2f 0056      	move.l 86(sp),-(sp)
    4f00:	4eba 1c44      	jsr 6b46 <TestRow>(pc)
    4f04:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4f08:	722a           	moveq #42,d1
    4f0a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4f0e:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<6;i++) {
    4f12:	52af 016e      	addq.l #1,366(sp)
    4f16:	7005           	moveq #5,d0
    4f18:	b0af 016e      	cmp.l 366(sp),d0
    4f1c:	6c8c           	bge.s 4eaa <TestZoom4Picture+0x11c6>
  for(int i=0;i<10;i++) {
    4f1e:	52af 0176      	addq.l #1,374(sp)
    4f22:	7209           	moveq #9,d1
    4f24:	b2af 0176      	cmp.l 374(sp),d1
    4f28:	6c00 ff2c      	bge.w 4e56 <TestZoom4Picture+0x1172>
    }
  }

  for(int i2=0;i2<11;i2++) {  
    4f2c:	42af 016a      	clr.l 362(sp)
    4f30:	6032           	bra.s 4f64 <TestZoom4Picture+0x1280>
    TestRow( valsupposed, valactual, mask, 258+i2);
    4f32:	222f 016a      	move.l 362(sp),d1
    4f36:	0681 0000 0102 	addi.l #258,d1
    4f3c:	7000           	moveq #0,d0
    4f3e:	302f 01c6      	move.w 454(sp),d0
    4f42:	2f01           	move.l d1,-(sp)
    4f44:	2f00           	move.l d0,-(sp)
    4f46:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f4a:	2f2f 0056      	move.l 86(sp),-(sp)
    4f4e:	4eba 1bf6      	jsr 6b46 <TestRow>(pc)
    4f52:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4f56:	702a           	moveq #42,d0
    4f58:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4f5c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {  
    4f60:	52af 016a      	addq.l #1,362(sp)
    4f64:	720a           	moveq #10,d1
    4f66:	b2af 016a      	cmp.l 362(sp),d1
    4f6a:	6cc6           	bge.s 4f32 <TestZoom4Picture+0x124e>
  }

  tmp = source;
    4f6c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4f72:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4f78:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    4f7e:	4878 0001      	pea 1 <_start+0x1>
    4f82:	4878 0006      	pea 6 <_start+0x6>
    4f86:	2f2f 0056      	move.l 86(sp),-(sp)
    4f8a:	2f2f 006a      	move.l 106(sp),-(sp)
    4f8e:	4eba cb04      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    4f92:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4f96:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    4f9c:	2c40           	movea.l d0,a6
    4f9e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4fa2:	202f 004e      	move.l 78(sp),d0
    4fa6:	5880           	addq.l #4,d0
    4fa8:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom7;
    4fac:	2f7c 0000 bbd0 	move.l #48080,74(sp)
    4fb2:	004a 
  mask = 0x0000;
    4fb4:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    4fb8:	7000           	moveq #0,d0
    4fba:	302f 01c6      	move.w 454(sp),d0
    4fbe:	42a7           	clr.l -(sp)
    4fc0:	2f00           	move.l d0,-(sp)
    4fc2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4fc6:	2f2f 0056      	move.l 86(sp),-(sp)
    4fca:	4eba 1b7a      	jsr 6b46 <TestRow>(pc)
    4fce:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4fd2:	722a           	moveq #42,d1
    4fd4:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4fd8:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    4fdc:	42af 0166      	clr.l 358(sp)
    4fe0:	605c           	bra.s 503e <TestZoom4Picture+0x135a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    4fe2:	202f 0166      	move.l 358(sp),d0
    4fe6:	d080           	add.l d0,d0
    4fe8:	2200           	move.l d0,d1
    4fea:	5281           	addq.l #1,d1
    4fec:	7000           	moveq #0,d0
    4fee:	302f 01c6      	move.w 454(sp),d0
    4ff2:	2f01           	move.l d1,-(sp)
    4ff4:	2f00           	move.l d0,-(sp)
    4ff6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ffa:	2f2f 0056      	move.l 86(sp),-(sp)
    4ffe:	4eba 1b46      	jsr 6b46 <TestRow>(pc)
    5002:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5006:	702a           	moveq #42,d0
    5008:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    500c:	202f 0166      	move.l 358(sp),d0
    5010:	5280           	addq.l #1,d0
    5012:	d080           	add.l d0,d0
    5014:	2200           	move.l d0,d1
    5016:	7000           	moveq #0,d0
    5018:	302f 01c6      	move.w 454(sp),d0
    501c:	2f01           	move.l d1,-(sp)
    501e:	2f00           	move.l d0,-(sp)
    5020:	2f2f 01d0      	move.l 464(sp),-(sp)
    5024:	2f2f 0056      	move.l 86(sp),-(sp)
    5028:	4eba 1b1c      	jsr 6b46 <TestRow>(pc)
    502c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5030:	722a           	moveq #42,d1
    5032:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5036:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    503a:	52af 0166      	addq.l #1,358(sp)
    503e:	7006           	moveq #6,d0
    5040:	b0af 0166      	cmp.l 358(sp),d0
    5044:	6c9c           	bge.s 4fe2 <TestZoom4Picture+0x12fe>
  }

  for(int i=0;i<10;i++) {
    5046:	42af 0162      	clr.l 354(sp)
    504a:	6000 00d4      	bra.w 5120 <TestZoom4Picture+0x143c>
    for(int i2=0;i2<11;i2++) {  
    504e:	42af 015e      	clr.l 350(sp)
    5052:	6042           	bra.s 5096 <TestZoom4Picture+0x13b2>
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    5054:	307c 000f      	movea.w #15,a0
    5058:	d1ef 015e      	adda.l 350(sp),a0
    505c:	222f 0162      	move.l 354(sp),d1
    5060:	2001           	move.l d1,d0
    5062:	d080           	add.l d0,d0
    5064:	d081           	add.l d1,d0
    5066:	e788           	lsl.l #3,d0
    5068:	d081           	add.l d1,d0
    506a:	2208           	move.l a0,d1
    506c:	d280           	add.l d0,d1
    506e:	7000           	moveq #0,d0
    5070:	302f 01c6      	move.w 454(sp),d0
    5074:	2f01           	move.l d1,-(sp)
    5076:	2f00           	move.l d0,-(sp)
    5078:	2f2f 01d0      	move.l 464(sp),-(sp)
    507c:	2f2f 0056      	move.l 86(sp),-(sp)
    5080:	4eba 1ac4      	jsr 6b46 <TestRow>(pc)
    5084:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5088:	722a           	moveq #42,d1
    508a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    508e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {  
    5092:	52af 015e      	addq.l #1,350(sp)
    5096:	700a           	moveq #10,d0
    5098:	b0af 015e      	cmp.l 350(sp),d0
    509c:	6cb6           	bge.s 5054 <TestZoom4Picture+0x1370>
    }
    for(int i=0;i<7;i++) {
    509e:	42af 015a      	clr.l 346(sp)
    50a2:	6070           	bra.s 5114 <TestZoom4Picture+0x1430>
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    50a4:	222f 015a      	move.l 346(sp),d1
    50a8:	2001           	move.l d1,d0
    50aa:	d080           	add.l d0,d0
    50ac:	d081           	add.l d1,d0
    50ae:	e788           	lsl.l #3,d0
    50b0:	2040           	movea.l d0,a0
    50b2:	d1c1           	adda.l d1,a0
    50b4:	41e8 001a      	lea 26(a0),a0
    50b8:	7000           	moveq #0,d0
    50ba:	302f 01c6      	move.w 454(sp),d0
    50be:	2f08           	move.l a0,-(sp)
    50c0:	2f00           	move.l d0,-(sp)
    50c2:	2f2f 01d0      	move.l 464(sp),-(sp)
    50c6:	2f2f 0056      	move.l 86(sp),-(sp)
    50ca:	4eba 1a7a      	jsr 6b46 <TestRow>(pc)
    50ce:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    50d2:	722a           	moveq #42,d1
    50d4:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    50d8:	222f 015a      	move.l 346(sp),d1
    50dc:	2001           	move.l d1,d0
    50de:	d080           	add.l d0,d0
    50e0:	d081           	add.l d1,d0
    50e2:	e788           	lsl.l #3,d0
    50e4:	2040           	movea.l d0,a0
    50e6:	d1c1           	adda.l d1,a0
    50e8:	41e8 001a      	lea 26(a0),a0
    50ec:	7000           	moveq #0,d0
    50ee:	302f 01c6      	move.w 454(sp),d0
    50f2:	2f08           	move.l a0,-(sp)
    50f4:	2f00           	move.l d0,-(sp)
    50f6:	2f2f 01d0      	move.l 464(sp),-(sp)
    50fa:	2f2f 0056      	move.l 86(sp),-(sp)
    50fe:	4eba 1a46      	jsr 6b46 <TestRow>(pc)
    5102:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5106:	702a           	moveq #42,d0
    5108:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    510c:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<7;i++) {
    5110:	52af 015a      	addq.l #1,346(sp)
    5114:	7206           	moveq #6,d1
    5116:	b2af 015a      	cmp.l 346(sp),d1
    511a:	6c88           	bge.s 50a4 <TestZoom4Picture+0x13c0>
  for(int i=0;i<10;i++) {
    511c:	52af 0162      	addq.l #1,354(sp)
    5120:	7009           	moveq #9,d0
    5122:	b0af 0162      	cmp.l 354(sp),d0
    5126:	6c00 ff26      	bge.w 504e <TestZoom4Picture+0x136a>
    }
  }

  for(int i2=0;i2<5;i2++) {  
    512a:	42af 0156      	clr.l 342(sp)
    512e:	6032           	bra.s 5162 <TestZoom4Picture+0x147e>
    TestRow( valsupposed, valactual, mask, 256+i2);
    5130:	222f 0156      	move.l 342(sp),d1
    5134:	0681 0000 0100 	addi.l #256,d1
    513a:	7000           	moveq #0,d0
    513c:	302f 01c6      	move.w 454(sp),d0
    5140:	2f01           	move.l d1,-(sp)
    5142:	2f00           	move.l d0,-(sp)
    5144:	2f2f 01d0      	move.l 464(sp),-(sp)
    5148:	2f2f 0056      	move.l 86(sp),-(sp)
    514c:	4eba 19f8      	jsr 6b46 <TestRow>(pc)
    5150:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5154:	722a           	moveq #42,d1
    5156:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    515a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    515e:	52af 0156      	addq.l #1,342(sp)
    5162:	7004           	moveq #4,d0
    5164:	b0af 0156      	cmp.l 342(sp),d0
    5168:	6cc6           	bge.s 5130 <TestZoom4Picture+0x144c>
  }

  tmp = source;
    516a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5170:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5176:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    517c:	4878 0001      	pea 1 <_start+0x1>
    5180:	4878 0007      	pea 7 <_start+0x7>
    5184:	2f2f 0056      	move.l 86(sp),-(sp)
    5188:	2f2f 006a      	move.l 106(sp),-(sp)
    518c:	4eba c906      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    5190:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5194:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    519a:	2c40           	movea.l d0,a6
    519c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    51a0:	222f 004e      	move.l 78(sp),d1
    51a4:	5881           	addq.l #4,d1
    51a6:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom8;
    51aa:	2f7c 0000 bbfc 	move.l #48124,74(sp)
    51b0:	004a 
  mask = 0xffff;
    51b2:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    51b8:	7000           	moveq #0,d0
    51ba:	302f 01c6      	move.w 454(sp),d0
    51be:	42a7           	clr.l -(sp)
    51c0:	2f00           	move.l d0,-(sp)
    51c2:	2f2f 01d0      	move.l 464(sp),-(sp)
    51c6:	2f2f 0056      	move.l 86(sp),-(sp)
    51ca:	4eba 197a      	jsr 6b46 <TestRow>(pc)
    51ce:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    51d2:	702a           	moveq #42,d0
    51d4:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    51d8:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    51dc:	42af 0152      	clr.l 338(sp)
    51e0:	605c           	bra.s 523e <TestZoom4Picture+0x155a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    51e2:	202f 0152      	move.l 338(sp),d0
    51e6:	d080           	add.l d0,d0
    51e8:	2200           	move.l d0,d1
    51ea:	5281           	addq.l #1,d1
    51ec:	7000           	moveq #0,d0
    51ee:	302f 01c6      	move.w 454(sp),d0
    51f2:	2f01           	move.l d1,-(sp)
    51f4:	2f00           	move.l d0,-(sp)
    51f6:	2f2f 01d0      	move.l 464(sp),-(sp)
    51fa:	2f2f 0056      	move.l 86(sp),-(sp)
    51fe:	4eba 1946      	jsr 6b46 <TestRow>(pc)
    5202:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5206:	722a           	moveq #42,d1
    5208:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    520c:	202f 0152      	move.l 338(sp),d0
    5210:	5280           	addq.l #1,d0
    5212:	d080           	add.l d0,d0
    5214:	2200           	move.l d0,d1
    5216:	7000           	moveq #0,d0
    5218:	302f 01c6      	move.w 454(sp),d0
    521c:	2f01           	move.l d1,-(sp)
    521e:	2f00           	move.l d0,-(sp)
    5220:	2f2f 01d0      	move.l 464(sp),-(sp)
    5224:	2f2f 0056      	move.l 86(sp),-(sp)
    5228:	4eba 191c      	jsr 6b46 <TestRow>(pc)
    522c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5230:	702a           	moveq #42,d0
    5232:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5236:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    523a:	52af 0152      	addq.l #1,338(sp)
    523e:	7204           	moveq #4,d1
    5240:	b2af 0152      	cmp.l 338(sp),d1
    5244:	6c9c           	bge.s 51e2 <TestZoom4Picture+0x14fe>
  }

  for(int i=0;i<9;i++) {
    5246:	42af 014e      	clr.l 334(sp)
    524a:	6000 00f0      	bra.w 533c <TestZoom4Picture+0x1658>
    for(int i2=0;i2<10;i2++) {  
    524e:	42af 014a      	clr.l 330(sp)
    5252:	6046           	bra.s 529a <TestZoom4Picture+0x15b6>
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    5254:	307c 000b      	movea.w #11,a0
    5258:	d1ef 014a      	adda.l 330(sp),a0
    525c:	222f 014e      	move.l 334(sp),d1
    5260:	2001           	move.l d1,d0
    5262:	d080           	add.l d0,d0
    5264:	d081           	add.l d1,d0
    5266:	d080           	add.l d0,d0
    5268:	d080           	add.l d0,d0
    526a:	d081           	add.l d1,d0
    526c:	d080           	add.l d0,d0
    526e:	2208           	move.l a0,d1
    5270:	d280           	add.l d0,d1
    5272:	7000           	moveq #0,d0
    5274:	302f 01c6      	move.w 454(sp),d0
    5278:	2f01           	move.l d1,-(sp)
    527a:	2f00           	move.l d0,-(sp)
    527c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5280:	2f2f 0056      	move.l 86(sp),-(sp)
    5284:	4eba 18c0      	jsr 6b46 <TestRow>(pc)
    5288:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    528c:	702a           	moveq #42,d0
    528e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5292:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {  
    5296:	52af 014a      	addq.l #1,330(sp)
    529a:	7209           	moveq #9,d1
    529c:	b2af 014a      	cmp.l 330(sp),d1
    52a0:	6cb2           	bge.s 5254 <TestZoom4Picture+0x1570>
    }
    for(int i2=0;i2<8;i2++) {
    52a2:	42af 0146      	clr.l 326(sp)
    52a6:	6000 0086      	bra.w 532e <TestZoom4Picture+0x164a>
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    52aa:	222f 014e      	move.l 334(sp),d1
    52ae:	2001           	move.l d1,d0
    52b0:	d080           	add.l d0,d0
    52b2:	d081           	add.l d1,d0
    52b4:	d080           	add.l d0,d0
    52b6:	d080           	add.l d0,d0
    52b8:	d081           	add.l d1,d0
    52ba:	d080           	add.l d0,d0
    52bc:	2040           	movea.l d0,a0
    52be:	41e8 0015      	lea 21(a0),a0
    52c2:	2208           	move.l a0,d1
    52c4:	d2af 0146      	add.l 326(sp),d1
    52c8:	7000           	moveq #0,d0
    52ca:	302f 01c6      	move.w 454(sp),d0
    52ce:	2f01           	move.l d1,-(sp)
    52d0:	2f00           	move.l d0,-(sp)
    52d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    52d6:	2f2f 0056      	move.l 86(sp),-(sp)
    52da:	4eba 186a      	jsr 6b46 <TestRow>(pc)
    52de:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    52e2:	702a           	moveq #42,d0
    52e4:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    52e8:	222f 014e      	move.l 334(sp),d1
    52ec:	2001           	move.l d1,d0
    52ee:	d080           	add.l d0,d0
    52f0:	d081           	add.l d1,d0
    52f2:	d080           	add.l d0,d0
    52f4:	d080           	add.l d0,d0
    52f6:	d081           	add.l d1,d0
    52f8:	d080           	add.l d0,d0
    52fa:	2040           	movea.l d0,a0
    52fc:	41e8 0015      	lea 21(a0),a0
    5300:	2208           	move.l a0,d1
    5302:	d2af 0146      	add.l 326(sp),d1
    5306:	7000           	moveq #0,d0
    5308:	302f 01c6      	move.w 454(sp),d0
    530c:	2f01           	move.l d1,-(sp)
    530e:	2f00           	move.l d0,-(sp)
    5310:	2f2f 01d0      	move.l 464(sp),-(sp)
    5314:	2f2f 0056      	move.l 86(sp),-(sp)
    5318:	4eba 182c      	jsr 6b46 <TestRow>(pc)
    531c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5320:	722a           	moveq #42,d1
    5322:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5326:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {
    532a:	52af 0146      	addq.l #1,326(sp)
    532e:	7007           	moveq #7,d0
    5330:	b0af 0146      	cmp.l 326(sp),d0
    5334:	6c00 ff74      	bge.w 52aa <TestZoom4Picture+0x15c6>
  for(int i=0;i<9;i++) {
    5338:	52af 014e      	addq.l #1,334(sp)
    533c:	7208           	moveq #8,d1
    533e:	b2af 014e      	cmp.l 334(sp),d1
    5342:	6c00 ff0a      	bge.w 524e <TestZoom4Picture+0x156a>
    }
  }

  for(int i2=0;i2<10;i2++) {  
    5346:	42af 0142      	clr.l 322(sp)
    534a:	6032           	bra.s 537e <TestZoom4Picture+0x169a>
    TestRow( valsupposed, valactual, mask, 245+i2);
    534c:	222f 0142      	move.l 322(sp),d1
    5350:	0681 0000 00f5 	addi.l #245,d1
    5356:	7000           	moveq #0,d0
    5358:	302f 01c6      	move.w 454(sp),d0
    535c:	2f01           	move.l d1,-(sp)
    535e:	2f00           	move.l d0,-(sp)
    5360:	2f2f 01d0      	move.l 464(sp),-(sp)
    5364:	2f2f 0056      	move.l 86(sp),-(sp)
    5368:	4eba 17dc      	jsr 6b46 <TestRow>(pc)
    536c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5370:	702a           	moveq #42,d0
    5372:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5376:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {  
    537a:	52af 0142      	addq.l #1,322(sp)
    537e:	7209           	moveq #9,d1
    5380:	b2af 0142      	cmp.l 322(sp),d1
    5384:	6cc6           	bge.s 534c <TestZoom4Picture+0x1668>
  }
  for(int i=0;i<7;i++) {
    5386:	42af 013e      	clr.l 318(sp)
    538a:	6064           	bra.s 53f0 <TestZoom4Picture+0x170c>
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    538c:	202f 013e      	move.l 318(sp),d0
    5390:	d080           	add.l d0,d0
    5392:	2200           	move.l d0,d1
    5394:	0681 0000 00ff 	addi.l #255,d1
    539a:	7000           	moveq #0,d0
    539c:	302f 01c6      	move.w 454(sp),d0
    53a0:	2f01           	move.l d1,-(sp)
    53a2:	2f00           	move.l d0,-(sp)
    53a4:	2f2f 01d0      	move.l 464(sp),-(sp)
    53a8:	2f2f 0056      	move.l 86(sp),-(sp)
    53ac:	4eba 1798      	jsr 6b46 <TestRow>(pc)
    53b0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    53b4:	702a           	moveq #42,d0
    53b6:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    53ba:	202f 013e      	move.l 318(sp),d0
    53be:	0680 0000 0080 	addi.l #128,d0
    53c4:	d080           	add.l d0,d0
    53c6:	2200           	move.l d0,d1
    53c8:	7000           	moveq #0,d0
    53ca:	302f 01c6      	move.w 454(sp),d0
    53ce:	2f01           	move.l d1,-(sp)
    53d0:	2f00           	move.l d0,-(sp)
    53d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    53d6:	2f2f 0056      	move.l 86(sp),-(sp)
    53da:	4eba 176a      	jsr 6b46 <TestRow>(pc)
    53de:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    53e2:	722a           	moveq #42,d1
    53e4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    53e8:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    53ec:	52af 013e      	addq.l #1,318(sp)
    53f0:	7006           	moveq #6,d0
    53f2:	b0af 013e      	cmp.l 318(sp),d0
    53f6:	6c94           	bge.s 538c <TestZoom4Picture+0x16a8>
  }
  TestRow( valsupposed, valactual, mask, 269);
    53f8:	7000           	moveq #0,d0
    53fa:	302f 01c6      	move.w 454(sp),d0
    53fe:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5402:	2f00           	move.l d0,-(sp)
    5404:	2f2f 01d0      	move.l 464(sp),-(sp)
    5408:	2f2f 0056      	move.l 86(sp),-(sp)
    540c:	4eba 1738      	jsr 6b46 <TestRow>(pc)
    5410:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5414:	722a           	moveq #42,d1
    5416:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    541a:	466f 01c6      	not.w 454(sp)
 
  tmp = source;
    541e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5424:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    542a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    5430:	4878 0001      	pea 1 <_start+0x1>
    5434:	4878 0008      	pea 8 <_start+0x8>
    5438:	2f2f 0056      	move.l 86(sp),-(sp)
    543c:	2f2f 006a      	move.l 106(sp),-(sp)
    5440:	4eba c652      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    5444:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5448:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    544e:	2c40           	movea.l d0,a6
    5450:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5454:	202f 004e      	move.l 78(sp),d0
    5458:	5880           	addq.l #4,d0
    545a:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom9;
    545e:	2f7c 0000 bc28 	move.l #48168,74(sp)
    5464:	004a 
  mask = 0x0000;
    5466:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    546a:	7000           	moveq #0,d0
    546c:	302f 01c6      	move.w 454(sp),d0
    5470:	42a7           	clr.l -(sp)
    5472:	2f00           	move.l d0,-(sp)
    5474:	2f2f 01d0      	move.l 464(sp),-(sp)
    5478:	2f2f 0056      	move.l 86(sp),-(sp)
    547c:	4eba 16c8      	jsr 6b46 <TestRow>(pc)
    5480:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5484:	722a           	moveq #42,d1
    5486:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    548a:	466f 01c6      	not.w 454(sp)
  
  for(int i=0;i<3;i++) {
    548e:	42af 013a      	clr.l 314(sp)
    5492:	605c           	bra.s 54f0 <TestZoom4Picture+0x180c>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    5494:	202f 013a      	move.l 314(sp),d0
    5498:	d080           	add.l d0,d0
    549a:	2200           	move.l d0,d1
    549c:	5281           	addq.l #1,d1
    549e:	7000           	moveq #0,d0
    54a0:	302f 01c6      	move.w 454(sp),d0
    54a4:	2f01           	move.l d1,-(sp)
    54a6:	2f00           	move.l d0,-(sp)
    54a8:	2f2f 01d0      	move.l 464(sp),-(sp)
    54ac:	2f2f 0056      	move.l 86(sp),-(sp)
    54b0:	4eba 1694      	jsr 6b46 <TestRow>(pc)
    54b4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    54b8:	702a           	moveq #42,d0
    54ba:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    54be:	202f 013a      	move.l 314(sp),d0
    54c2:	5280           	addq.l #1,d0
    54c4:	d080           	add.l d0,d0
    54c6:	2200           	move.l d0,d1
    54c8:	7000           	moveq #0,d0
    54ca:	302f 01c6      	move.w 454(sp),d0
    54ce:	2f01           	move.l d1,-(sp)
    54d0:	2f00           	move.l d0,-(sp)
    54d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    54d6:	2f2f 0056      	move.l 86(sp),-(sp)
    54da:	4eba 166a      	jsr 6b46 <TestRow>(pc)
    54de:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    54e2:	722a           	moveq #42,d1
    54e4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    54e8:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    54ec:	52af 013a      	addq.l #1,314(sp)
    54f0:	7002           	moveq #2,d0
    54f2:	b0af 013a      	cmp.l 314(sp),d0
    54f6:	6c9c           	bge.s 5494 <TestZoom4Picture+0x17b0>
  }

  for(int i=0;i<9;i++) {
    54f8:	42af 0136      	clr.l 310(sp)
    54fc:	6000 00ea      	bra.w 55e8 <TestZoom4Picture+0x1904>
    for(int i2=0;i2<9;i2++) {  
    5500:	42af 0132      	clr.l 306(sp)
    5504:	6044           	bra.s 554a <TestZoom4Picture+0x1866>
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    5506:	307c 000b      	movea.w #11,a0
    550a:	d1ef 0132      	adda.l 306(sp),a0
    550e:	222f 0136      	move.l 310(sp),d1
    5512:	2001           	move.l d1,d0
    5514:	d080           	add.l d0,d0
    5516:	d081           	add.l d1,d0
    5518:	2200           	move.l d0,d1
    551a:	e789           	lsl.l #3,d1
    551c:	d081           	add.l d1,d0
    551e:	2208           	move.l a0,d1
    5520:	d280           	add.l d0,d1
    5522:	7000           	moveq #0,d0
    5524:	302f 01c6      	move.w 454(sp),d0
    5528:	2f01           	move.l d1,-(sp)
    552a:	2f00           	move.l d0,-(sp)
    552c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5530:	2f2f 0056      	move.l 86(sp),-(sp)
    5534:	4eba 1610      	jsr 6b46 <TestRow>(pc)
    5538:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    553c:	722a           	moveq #42,d1
    553e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5542:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {  
    5546:	52af 0132      	addq.l #1,306(sp)
    554a:	7008           	moveq #8,d0
    554c:	b0af 0132      	cmp.l 306(sp),d0
    5550:	6cb4           	bge.s 5506 <TestZoom4Picture+0x1822>
    }
    
    for(int i2=0;i2<9;i2++) {
    5552:	42af 012e      	clr.l 302(sp)
    5556:	6000 0082      	bra.w 55da <TestZoom4Picture+0x18f6>
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    555a:	222f 0136      	move.l 310(sp),d1
    555e:	2001           	move.l d1,d0
    5560:	d080           	add.l d0,d0
    5562:	d081           	add.l d1,d0
    5564:	2200           	move.l d0,d1
    5566:	e789           	lsl.l #3,d1
    5568:	2040           	movea.l d0,a0
    556a:	d1c1           	adda.l d1,a0
    556c:	41e8 0014      	lea 20(a0),a0
    5570:	2208           	move.l a0,d1
    5572:	d2af 012e      	add.l 302(sp),d1
    5576:	7000           	moveq #0,d0
    5578:	302f 01c6      	move.w 454(sp),d0
    557c:	2f01           	move.l d1,-(sp)
    557e:	2f00           	move.l d0,-(sp)
    5580:	2f2f 01d0      	move.l 464(sp),-(sp)
    5584:	2f2f 0056      	move.l 86(sp),-(sp)
    5588:	4eba 15bc      	jsr 6b46 <TestRow>(pc)
    558c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5590:	722a           	moveq #42,d1
    5592:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    5596:	222f 0136      	move.l 310(sp),d1
    559a:	2001           	move.l d1,d0
    559c:	d080           	add.l d0,d0
    559e:	d081           	add.l d1,d0
    55a0:	2200           	move.l d0,d1
    55a2:	e789           	lsl.l #3,d1
    55a4:	2040           	movea.l d0,a0
    55a6:	d1c1           	adda.l d1,a0
    55a8:	41e8 0015      	lea 21(a0),a0
    55ac:	2208           	move.l a0,d1
    55ae:	d2af 012e      	add.l 302(sp),d1
    55b2:	7000           	moveq #0,d0
    55b4:	302f 01c6      	move.w 454(sp),d0
    55b8:	2f01           	move.l d1,-(sp)
    55ba:	2f00           	move.l d0,-(sp)
    55bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    55c0:	2f2f 0056      	move.l 86(sp),-(sp)
    55c4:	4eba 1580      	jsr 6b46 <TestRow>(pc)
    55c8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    55cc:	702a           	moveq #42,d0
    55ce:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    55d2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {
    55d6:	52af 012e      	addq.l #1,302(sp)
    55da:	7208           	moveq #8,d1
    55dc:	b2af 012e      	cmp.l 302(sp),d1
    55e0:	6c00 ff78      	bge.w 555a <TestZoom4Picture+0x1876>
  for(int i=0;i<9;i++) {
    55e4:	52af 0136      	addq.l #1,310(sp)
    55e8:	7008           	moveq #8,d0
    55ea:	b0af 0136      	cmp.l 310(sp),d0
    55ee:	6c00 ff10      	bge.w 5500 <TestZoom4Picture+0x181c>
    }
  }

  for(int i2=0;i2<9;i2++) {  
    55f2:	42af 012a      	clr.l 298(sp)
    55f6:	6032           	bra.s 562a <TestZoom4Picture+0x1946>
    TestRow( valsupposed, valactual, mask, 245+i2);
    55f8:	222f 012a      	move.l 298(sp),d1
    55fc:	0681 0000 00f5 	addi.l #245,d1
    5602:	7000           	moveq #0,d0
    5604:	302f 01c6      	move.w 454(sp),d0
    5608:	2f01           	move.l d1,-(sp)
    560a:	2f00           	move.l d0,-(sp)
    560c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5610:	2f2f 0056      	move.l 86(sp),-(sp)
    5614:	4eba 1530      	jsr 6b46 <TestRow>(pc)
    5618:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    561c:	722a           	moveq #42,d1
    561e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5622:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {  
    5626:	52af 012a      	addq.l #1,298(sp)
    562a:	7008           	moveq #8,d0
    562c:	b0af 012a      	cmp.l 298(sp),d0
    5630:	6cc6           	bge.s 55f8 <TestZoom4Picture+0x1914>
  }
  for(int i=0;i<5;i++) {
    5632:	42af 0126      	clr.l 294(sp)
    5636:	6064           	bra.s 569c <TestZoom4Picture+0x19b8>
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    5638:	202f 0126      	move.l 294(sp),d0
    563c:	d080           	add.l d0,d0
    563e:	2200           	move.l d0,d1
    5640:	0681 0000 0103 	addi.l #259,d1
    5646:	7000           	moveq #0,d0
    5648:	302f 01c6      	move.w 454(sp),d0
    564c:	2f01           	move.l d1,-(sp)
    564e:	2f00           	move.l d0,-(sp)
    5650:	2f2f 01d0      	move.l 464(sp),-(sp)
    5654:	2f2f 0056      	move.l 86(sp),-(sp)
    5658:	4eba 14ec      	jsr 6b46 <TestRow>(pc)
    565c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5660:	722a           	moveq #42,d1
    5662:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    5666:	202f 0126      	move.l 294(sp),d0
    566a:	0680 0000 0082 	addi.l #130,d0
    5670:	d080           	add.l d0,d0
    5672:	2200           	move.l d0,d1
    5674:	7000           	moveq #0,d0
    5676:	302f 01c6      	move.w 454(sp),d0
    567a:	2f01           	move.l d1,-(sp)
    567c:	2f00           	move.l d0,-(sp)
    567e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5682:	2f2f 0056      	move.l 86(sp),-(sp)
    5686:	4eba 14be      	jsr 6b46 <TestRow>(pc)
    568a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    568e:	702a           	moveq #42,d0
    5690:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5694:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5698:	52af 0126      	addq.l #1,294(sp)
    569c:	7204           	moveq #4,d1
    569e:	b2af 0126      	cmp.l 294(sp),d1
    56a2:	6c94           	bge.s 5638 <TestZoom4Picture+0x1954>
  }
  TestRow( valsupposed, valactual, mask, 269);
    56a4:	7000           	moveq #0,d0
    56a6:	302f 01c6      	move.w 454(sp),d0
    56aa:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    56ae:	2f00           	move.l d0,-(sp)
    56b0:	2f2f 01d0      	move.l 464(sp),-(sp)
    56b4:	2f2f 0056      	move.l 86(sp),-(sp)
    56b8:	4eba 148c      	jsr 6b46 <TestRow>(pc)
    56bc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    56c0:	702a           	moveq #42,d0
    56c2:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    56c6:	466f 01c6      	not.w 454(sp)

  tmp = source;
    56ca:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    56d0:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    56d6:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    56dc:	4878 0001      	pea 1 <_start+0x1>
    56e0:	4878 0009      	pea 9 <_start+0x9>
    56e4:	2f2f 0056      	move.l 86(sp),-(sp)
    56e8:	2f2f 006a      	move.l 106(sp),-(sp)
    56ec:	4eba c3a6      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    56f0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    56f4:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    56fa:	2c40           	movea.l d0,a6
    56fc:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5700:	222f 004e      	move.l 78(sp),d1
    5704:	5881           	addq.l #4,d1
    5706:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom10;
    570a:	2f7c 0000 bc54 	move.l #48212,74(sp)
    5710:	004a 

  mask = 0xffff;
    5712:	3f7c ffff 01c6 	move.w #-1,454(sp)
  TestRow( valsupposed, valactual, mask, 0);
    5718:	7000           	moveq #0,d0
    571a:	302f 01c6      	move.w 454(sp),d0
    571e:	42a7           	clr.l -(sp)
    5720:	2f00           	move.l d0,-(sp)
    5722:	2f2f 01d0      	move.l 464(sp),-(sp)
    5726:	2f2f 0056      	move.l 86(sp),-(sp)
    572a:	4eba 141a      	jsr 6b46 <TestRow>(pc)
    572e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5732:	702a           	moveq #42,d0
    5734:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5738:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 1);   
    573c:	7000           	moveq #0,d0
    573e:	302f 01c6      	move.w 454(sp),d0
    5742:	4878 0001      	pea 1 <_start+0x1>
    5746:	2f00           	move.l d0,-(sp)
    5748:	2f2f 01d0      	move.l 464(sp),-(sp)
    574c:	2f2f 0056      	move.l 86(sp),-(sp)
    5750:	4eba 13f4      	jsr 6b46 <TestRow>(pc)
    5754:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5758:	722a           	moveq #42,d1
    575a:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 2);
    575e:	7000           	moveq #0,d0
    5760:	302f 01c6      	move.w 454(sp),d0
    5764:	4878 0002      	pea 2 <_start+0x2>
    5768:	2f00           	move.l d0,-(sp)
    576a:	2f2f 01d0      	move.l 464(sp),-(sp)
    576e:	2f2f 0056      	move.l 86(sp),-(sp)
    5772:	4eba 13d2      	jsr 6b46 <TestRow>(pc)
    5776:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    577a:	702a           	moveq #42,d0
    577c:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5780:	466f 01c6      	not.w 454(sp)

  for(int i=0;i<9;i++) {
    5784:	42af 0122      	clr.l 290(sp)
    5788:	6000 00e0      	bra.w 586a <TestZoom4Picture+0x1b86>
    for(int i2=0;i2<8;i2++) {  
    578c:	42af 011e      	clr.l 286(sp)
    5790:	6040           	bra.s 57d2 <TestZoom4Picture+0x1aee>
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    5792:	206f 011e      	movea.l 286(sp),a0
    5796:	5688           	addq.l #3,a0
    5798:	222f 0122      	move.l 290(sp),d1
    579c:	2001           	move.l d1,d0
    579e:	e788           	lsl.l #3,d0
    57a0:	9081           	sub.l d1,d0
    57a2:	d080           	add.l d0,d0
    57a4:	d080           	add.l d0,d0
    57a6:	2208           	move.l a0,d1
    57a8:	d280           	add.l d0,d1
    57aa:	7000           	moveq #0,d0
    57ac:	302f 01c6      	move.w 454(sp),d0
    57b0:	2f01           	move.l d1,-(sp)
    57b2:	2f00           	move.l d0,-(sp)
    57b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    57b8:	2f2f 0056      	move.l 86(sp),-(sp)
    57bc:	4eba 1388      	jsr 6b46 <TestRow>(pc)
    57c0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    57c4:	722a           	moveq #42,d1
    57c6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    57ca:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {  
    57ce:	52af 011e      	addq.l #1,286(sp)
    57d2:	7007           	moveq #7,d0
    57d4:	b0af 011e      	cmp.l 286(sp),d0
    57d8:	6cb8           	bge.s 5792 <TestZoom4Picture+0x1aae>
    }
    
    for(int i2=0;i2<10;i2++) {
    57da:	42af 011a      	clr.l 282(sp)
    57de:	607c           	bra.s 585c <TestZoom4Picture+0x1b78>
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    57e0:	222f 0122      	move.l 290(sp),d1
    57e4:	2001           	move.l d1,d0
    57e6:	e788           	lsl.l #3,d0
    57e8:	9081           	sub.l d1,d0
    57ea:	d080           	add.l d0,d0
    57ec:	d080           	add.l d0,d0
    57ee:	2040           	movea.l d0,a0
    57f0:	41e8 000b      	lea 11(a0),a0
    57f4:	2208           	move.l a0,d1
    57f6:	d2af 011a      	add.l 282(sp),d1
    57fa:	7000           	moveq #0,d0
    57fc:	302f 01c6      	move.w 454(sp),d0
    5800:	2f01           	move.l d1,-(sp)
    5802:	2f00           	move.l d0,-(sp)
    5804:	2f2f 01d0      	move.l 464(sp),-(sp)
    5808:	2f2f 0056      	move.l 86(sp),-(sp)
    580c:	4eba 1338      	jsr 6b46 <TestRow>(pc)
    5810:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5814:	722a           	moveq #42,d1
    5816:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    581a:	222f 0122      	move.l 290(sp),d1
    581e:	2001           	move.l d1,d0
    5820:	e788           	lsl.l #3,d0
    5822:	9081           	sub.l d1,d0
    5824:	d080           	add.l d0,d0
    5826:	d080           	add.l d0,d0
    5828:	2040           	movea.l d0,a0
    582a:	41e8 000b      	lea 11(a0),a0
    582e:	2208           	move.l a0,d1
    5830:	d2af 011a      	add.l 282(sp),d1
    5834:	7000           	moveq #0,d0
    5836:	302f 01c6      	move.w 454(sp),d0
    583a:	2f01           	move.l d1,-(sp)
    583c:	2f00           	move.l d0,-(sp)
    583e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5842:	2f2f 0056      	move.l 86(sp),-(sp)
    5846:	4eba 12fe      	jsr 6b46 <TestRow>(pc)
    584a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    584e:	702a           	moveq #42,d0
    5850:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5854:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {
    5858:	52af 011a      	addq.l #1,282(sp)
    585c:	7209           	moveq #9,d1
    585e:	b2af 011a      	cmp.l 282(sp),d1
    5862:	6c00 ff7c      	bge.w 57e0 <TestZoom4Picture+0x1afc>
  for(int i=0;i<9;i++) {
    5866:	52af 0122      	addq.l #1,290(sp)
    586a:	7008           	moveq #8,d0
    586c:	b0af 0122      	cmp.l 290(sp),d0
    5870:	6c00 ff1a      	bge.w 578c <TestZoom4Picture+0x1aa8>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    5874:	42af 0116      	clr.l 278(sp)
    5878:	6032           	bra.s 58ac <TestZoom4Picture+0x1bc8>
    TestRow( valsupposed, valactual, mask, 255+i2);
    587a:	222f 0116      	move.l 278(sp),d1
    587e:	0681 0000 00ff 	addi.l #255,d1
    5884:	7000           	moveq #0,d0
    5886:	302f 01c6      	move.w 454(sp),d0
    588a:	2f01           	move.l d1,-(sp)
    588c:	2f00           	move.l d0,-(sp)
    588e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5892:	2f2f 0056      	move.l 86(sp),-(sp)
    5896:	4eba 12ae      	jsr 6b46 <TestRow>(pc)
    589a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    589e:	722a           	moveq #42,d1
    58a0:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    58a4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    58a8:	52af 0116      	addq.l #1,278(sp)
    58ac:	7007           	moveq #7,d0
    58ae:	b0af 0116      	cmp.l 278(sp),d0
    58b2:	6cc6           	bge.s 587a <TestZoom4Picture+0x1b96>
  }
  for(int i=0;i<3;i++) {
    58b4:	42af 0112      	clr.l 274(sp)
    58b8:	6064           	bra.s 591e <TestZoom4Picture+0x1c3a>
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    58ba:	202f 0112      	move.l 274(sp),d0
    58be:	d080           	add.l d0,d0
    58c0:	2200           	move.l d0,d1
    58c2:	0681 0000 0107 	addi.l #263,d1
    58c8:	7000           	moveq #0,d0
    58ca:	302f 01c6      	move.w 454(sp),d0
    58ce:	2f01           	move.l d1,-(sp)
    58d0:	2f00           	move.l d0,-(sp)
    58d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    58d6:	2f2f 0056      	move.l 86(sp),-(sp)
    58da:	4eba 126a      	jsr 6b46 <TestRow>(pc)
    58de:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    58e2:	722a           	moveq #42,d1
    58e4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    58e8:	202f 0112      	move.l 274(sp),d0
    58ec:	0680 0000 0084 	addi.l #132,d0
    58f2:	d080           	add.l d0,d0
    58f4:	2200           	move.l d0,d1
    58f6:	7000           	moveq #0,d0
    58f8:	302f 01c6      	move.w 454(sp),d0
    58fc:	2f01           	move.l d1,-(sp)
    58fe:	2f00           	move.l d0,-(sp)
    5900:	2f2f 01d0      	move.l 464(sp),-(sp)
    5904:	2f2f 0056      	move.l 86(sp),-(sp)
    5908:	4eba 123c      	jsr 6b46 <TestRow>(pc)
    590c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5910:	702a           	moveq #42,d0
    5912:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5916:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    591a:	52af 0112      	addq.l #1,274(sp)
    591e:	7202           	moveq #2,d1
    5920:	b2af 0112      	cmp.l 274(sp),d1
    5924:	6c94           	bge.s 58ba <TestZoom4Picture+0x1bd6>
  }

  tmp = source;
    5926:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    592c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5932:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    5938:	4878 0001      	pea 1 <_start+0x1>
    593c:	4878 000a      	pea a <_start+0xa>
    5940:	2f2f 0056      	move.l 86(sp),-(sp)
    5944:	2f2f 006a      	move.l 106(sp),-(sp)
    5948:	4eba c14a      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    594c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5950:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    5956:	2c40           	movea.l d0,a6
    5958:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    595c:	202f 004e      	move.l 78(sp),d0
    5960:	5880           	addq.l #4,d0
    5962:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom11;
    5966:	2f7c 0000 bc80 	move.l #48256,74(sp)
    596c:	004a 

  mask = 0xffff;
    596e:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  for(int i2=0;i2<6;i2++) {  
    5974:	42af 010e      	clr.l 270(sp)
    5978:	602a           	bra.s 59a4 <TestZoom4Picture+0x1cc0>
    TestRow( valsupposed, valactual, mask, i2);
    597a:	7000           	moveq #0,d0
    597c:	302f 01c6      	move.w 454(sp),d0
    5980:	2f2f 010e      	move.l 270(sp),-(sp)
    5984:	2f00           	move.l d0,-(sp)
    5986:	2f2f 01d0      	move.l 464(sp),-(sp)
    598a:	2f2f 0056      	move.l 86(sp),-(sp)
    598e:	4eba 11b6      	jsr 6b46 <TestRow>(pc)
    5992:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5996:	722a           	moveq #42,d1
    5998:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    599c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {  
    59a0:	52af 010e      	addq.l #1,270(sp)
    59a4:	7005           	moveq #5,d0
    59a6:	b0af 010e      	cmp.l 270(sp),d0
    59aa:	6cce           	bge.s 597a <TestZoom4Picture+0x1c96>
  }

  for(int i2=0;i2<11;i2++) {
    59ac:	42af 010a      	clr.l 266(sp)
    59b0:	605c           	bra.s 5a0e <TestZoom4Picture+0x1d2a>
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    59b2:	202f 010a      	move.l 266(sp),d0
    59b6:	5680           	addq.l #3,d0
    59b8:	d080           	add.l d0,d0
    59ba:	2200           	move.l d0,d1
    59bc:	7000           	moveq #0,d0
    59be:	302f 01c6      	move.w 454(sp),d0
    59c2:	2f01           	move.l d1,-(sp)
    59c4:	2f00           	move.l d0,-(sp)
    59c6:	2f2f 01d0      	move.l 464(sp),-(sp)
    59ca:	2f2f 0056      	move.l 86(sp),-(sp)
    59ce:	4eba 1176      	jsr 6b46 <TestRow>(pc)
    59d2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    59d6:	722a           	moveq #42,d1
    59d8:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    59dc:	202f 010a      	move.l 266(sp),d0
    59e0:	d080           	add.l d0,d0
    59e2:	2200           	move.l d0,d1
    59e4:	5e81           	addq.l #7,d1
    59e6:	7000           	moveq #0,d0
    59e8:	302f 01c6      	move.w 454(sp),d0
    59ec:	2f01           	move.l d1,-(sp)
    59ee:	2f00           	move.l d0,-(sp)
    59f0:	2f2f 01d0      	move.l 464(sp),-(sp)
    59f4:	2f2f 0056      	move.l 86(sp),-(sp)
    59f8:	4eba 114c      	jsr 6b46 <TestRow>(pc)
    59fc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a00:	702a           	moveq #42,d0
    5a02:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5a06:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5a0a:	52af 010a      	addq.l #1,266(sp)
    5a0e:	720a           	moveq #10,d1
    5a10:	b2af 010a      	cmp.l 266(sp),d1
    5a14:	6c9c           	bge.s 59b2 <TestZoom4Picture+0x1cce>
  }

  for(int i=0;i<8;i++) {
    5a16:	42af 0106      	clr.l 262(sp)
    5a1a:	6000 00f2      	bra.w 5b0e <TestZoom4Picture+0x1e2a>
    for(int i2=0;i2<7;i2++) {  
    5a1e:	42af 0102      	clr.l 258(sp)
    5a22:	6044           	bra.s 5a68 <TestZoom4Picture+0x1d84>
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    5a24:	307c 001c      	movea.w #28,a0
    5a28:	d1ef 0102      	adda.l 258(sp),a0
    5a2c:	222f 0106      	move.l 262(sp),d1
    5a30:	2001           	move.l d1,d0
    5a32:	e788           	lsl.l #3,d0
    5a34:	9081           	sub.l d1,d0
    5a36:	d080           	add.l d0,d0
    5a38:	d080           	add.l d0,d0
    5a3a:	d081           	add.l d1,d0
    5a3c:	2208           	move.l a0,d1
    5a3e:	d280           	add.l d0,d1
    5a40:	7000           	moveq #0,d0
    5a42:	302f 01c6      	move.w 454(sp),d0
    5a46:	2f01           	move.l d1,-(sp)
    5a48:	2f00           	move.l d0,-(sp)
    5a4a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a4e:	2f2f 0056      	move.l 86(sp),-(sp)
    5a52:	4eba 10f2      	jsr 6b46 <TestRow>(pc)
    5a56:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a5a:	702a           	moveq #42,d0
    5a5c:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5a60:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<7;i2++) {  
    5a64:	52af 0102      	addq.l #1,258(sp)
    5a68:	7206           	moveq #6,d1
    5a6a:	b2af 0102      	cmp.l 258(sp),d1
    5a6e:	6cb4           	bge.s 5a24 <TestZoom4Picture+0x1d40>
    }
    
    for(int i2=0;i2<11;i2++) {
    5a70:	42af 00fe      	clr.l 254(sp)
    5a74:	6000 008a      	bra.w 5b00 <TestZoom4Picture+0x1e1c>
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    5a78:	222f 0106      	move.l 262(sp),d1
    5a7c:	2001           	move.l d1,d0
    5a7e:	e788           	lsl.l #3,d0
    5a80:	9081           	sub.l d1,d0
    5a82:	d080           	add.l d0,d0
    5a84:	d080           	add.l d0,d0
    5a86:	2040           	movea.l d0,a0
    5a88:	d1c1           	adda.l d1,a0
    5a8a:	41e8 0023      	lea 35(a0),a0
    5a8e:	202f 00fe      	move.l 254(sp),d0
    5a92:	d080           	add.l d0,d0
    5a94:	2208           	move.l a0,d1
    5a96:	d280           	add.l d0,d1
    5a98:	7000           	moveq #0,d0
    5a9a:	302f 01c6      	move.w 454(sp),d0
    5a9e:	2f01           	move.l d1,-(sp)
    5aa0:	2f00           	move.l d0,-(sp)
    5aa2:	2f2f 01d0      	move.l 464(sp),-(sp)
    5aa6:	2f2f 0056      	move.l 86(sp),-(sp)
    5aaa:	4eba 109a      	jsr 6b46 <TestRow>(pc)
    5aae:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5ab2:	702a           	moveq #42,d0
    5ab4:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    5ab8:	222f 0106      	move.l 262(sp),d1
    5abc:	2001           	move.l d1,d0
    5abe:	e788           	lsl.l #3,d0
    5ac0:	9081           	sub.l d1,d0
    5ac2:	d080           	add.l d0,d0
    5ac4:	d080           	add.l d0,d0
    5ac6:	2040           	movea.l d0,a0
    5ac8:	d1c1           	adda.l d1,a0
    5aca:	41e8 000b      	lea 11(a0),a0
    5ace:	202f 00fe      	move.l 254(sp),d0
    5ad2:	d080           	add.l d0,d0
    5ad4:	2208           	move.l a0,d1
    5ad6:	d280           	add.l d0,d1
    5ad8:	7000           	moveq #0,d0
    5ada:	302f 01c6      	move.w 454(sp),d0
    5ade:	2f01           	move.l d1,-(sp)
    5ae0:	2f00           	move.l d0,-(sp)
    5ae2:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ae6:	2f2f 0056      	move.l 86(sp),-(sp)
    5aea:	4eba 105a      	jsr 6b46 <TestRow>(pc)
    5aee:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5af2:	722a           	moveq #42,d1
    5af4:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5af8:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {
    5afc:	52af 00fe      	addq.l #1,254(sp)
    5b00:	700a           	moveq #10,d0
    5b02:	b0af 00fe      	cmp.l 254(sp),d0
    5b06:	6c00 ff70      	bge.w 5a78 <TestZoom4Picture+0x1d94>
  for(int i=0;i<8;i++) {
    5b0a:	52af 0106      	addq.l #1,262(sp)
    5b0e:	7207           	moveq #7,d1
    5b10:	b2af 0106      	cmp.l 262(sp),d1
    5b14:	6c00 ff08      	bge.w 5a1e <TestZoom4Picture+0x1d3a>
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    5b18:	42af 00fa      	clr.l 250(sp)
    5b1c:	6032           	bra.s 5b50 <TestZoom4Picture+0x1e6c>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5b1e:	222f 00fa      	move.l 250(sp),d1
    5b22:	0681 0000 0104 	addi.l #260,d1
    5b28:	7000           	moveq #0,d0
    5b2a:	302f 01c6      	move.w 454(sp),d0
    5b2e:	2f01           	move.l d1,-(sp)
    5b30:	2f00           	move.l d0,-(sp)
    5b32:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b36:	2f2f 0056      	move.l 86(sp),-(sp)
    5b3a:	4eba 100a      	jsr 6b46 <TestRow>(pc)
    5b3e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5b42:	702a           	moveq #42,d0
    5b44:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5b48:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    5b4c:	52af 00fa      	addq.l #1,250(sp)
    5b50:	7206           	moveq #6,d1
    5b52:	b2af 00fa      	cmp.l 250(sp),d1
    5b56:	6cc6           	bge.s 5b1e <TestZoom4Picture+0x1e3a>
  }
  TestRow( valsupposed, valactual, mask, 267);   
    5b58:	7000           	moveq #0,d0
    5b5a:	302f 01c6      	move.w 454(sp),d0
    5b5e:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    5b62:	2f00           	move.l d0,-(sp)
    5b64:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b68:	2f2f 0056      	move.l 86(sp),-(sp)
    5b6c:	4eba 0fd8      	jsr 6b46 <TestRow>(pc)
    5b70:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b74:	702a           	moveq #42,d0
    5b76:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 268);
    5b7a:	7000           	moveq #0,d0
    5b7c:	302f 01c6      	move.w 454(sp),d0
    5b80:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    5b84:	2f00           	move.l d0,-(sp)
    5b86:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b8a:	2f2f 0056      	move.l 86(sp),-(sp)
    5b8e:	4eba 0fb6      	jsr 6b46 <TestRow>(pc)
    5b92:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b96:	722a           	moveq #42,d1
    5b98:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5b9c:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 269);
    5ba0:	7000           	moveq #0,d0
    5ba2:	302f 01c6      	move.w 454(sp),d0
    5ba6:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5baa:	2f00           	move.l d0,-(sp)
    5bac:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bb0:	2f2f 0056      	move.l 86(sp),-(sp)
    5bb4:	4eba 0f90      	jsr 6b46 <TestRow>(pc)
    5bb8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5bbc:	702a           	moveq #42,d0
    5bbe:	d1af 01c8      	add.l d0,456(sp)
  
  tmp = source;
    5bc2:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5bc8:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5bce:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    5bd4:	4878 0001      	pea 1 <_start+0x1>
    5bd8:	4878 000b      	pea b <_start+0xb>
    5bdc:	2f2f 0056      	move.l 86(sp),-(sp)
    5be0:	2f2f 006a      	move.l 106(sp),-(sp)
    5be4:	4eba beae      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    5be8:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5bec:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    5bf2:	2c40           	movea.l d0,a6
    5bf4:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5bf8:	222f 004e      	move.l 78(sp),d1
    5bfc:	5881           	addq.l #4,d1
    5bfe:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom12;
    5c02:	2f7c 0000 bcac 	move.l #48300,74(sp)
    5c08:	004a 

  mask = 0x0;
    5c0a:	426f 01c6      	clr.w 454(sp)
   
  TestRow( valsupposed, valactual, mask, 0);
    5c0e:	7000           	moveq #0,d0
    5c10:	302f 01c6      	move.w 454(sp),d0
    5c14:	42a7           	clr.l -(sp)
    5c16:	2f00           	move.l d0,-(sp)
    5c18:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c1c:	2f2f 0056      	move.l 86(sp),-(sp)
    5c20:	4eba 0f24      	jsr 6b46 <TestRow>(pc)
    5c24:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5c28:	702a           	moveq #42,d0
    5c2a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5c2e:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<12;i2++) {
    5c32:	42af 00f6      	clr.l 246(sp)
    5c36:	605c           	bra.s 5c94 <TestZoom4Picture+0x1fb0>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5c38:	202f 00f6      	move.l 246(sp),d0
    5c3c:	d080           	add.l d0,d0
    5c3e:	2200           	move.l d0,d1
    5c40:	5281           	addq.l #1,d1
    5c42:	7000           	moveq #0,d0
    5c44:	302f 01c6      	move.w 454(sp),d0
    5c48:	2f01           	move.l d1,-(sp)
    5c4a:	2f00           	move.l d0,-(sp)
    5c4c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c50:	2f2f 0056      	move.l 86(sp),-(sp)
    5c54:	4eba 0ef0      	jsr 6b46 <TestRow>(pc)
    5c58:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5c5c:	722a           	moveq #42,d1
    5c5e:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5c62:	202f 00f6      	move.l 246(sp),d0
    5c66:	5280           	addq.l #1,d0
    5c68:	d080           	add.l d0,d0
    5c6a:	2200           	move.l d0,d1
    5c6c:	7000           	moveq #0,d0
    5c6e:	302f 01c6      	move.w 454(sp),d0
    5c72:	2f01           	move.l d1,-(sp)
    5c74:	2f00           	move.l d0,-(sp)
    5c76:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c7a:	2f2f 0056      	move.l 86(sp),-(sp)
    5c7e:	4eba 0ec6      	jsr 6b46 <TestRow>(pc)
    5c82:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5c86:	702a           	moveq #42,d0
    5c88:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5c8c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    5c90:	52af 00f6      	addq.l #1,246(sp)
    5c94:	720b           	moveq #11,d1
    5c96:	b2af 00f6      	cmp.l 246(sp),d1
    5c9a:	6c9c           	bge.s 5c38 <TestZoom4Picture+0x1f54>
  } 

  for(int i=0;i<8;i++) {
    5c9c:	42af 00f2      	clr.l 242(sp)
    5ca0:	6000 00e6      	bra.w 5d88 <TestZoom4Picture+0x20a4>
    for(int i2=0;i2<6;i2++) {  
    5ca4:	42af 00ee      	clr.l 238(sp)
    5ca8:	6040           	bra.s 5cea <TestZoom4Picture+0x2006>
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    5caa:	307c 0019      	movea.w #25,a0
    5cae:	d1ef 00ee      	adda.l 238(sp),a0
    5cb2:	222f 00f2      	move.l 242(sp),d1
    5cb6:	2001           	move.l d1,d0
    5cb8:	e988           	lsl.l #4,d0
    5cba:	9081           	sub.l d1,d0
    5cbc:	d080           	add.l d0,d0
    5cbe:	2208           	move.l a0,d1
    5cc0:	d280           	add.l d0,d1
    5cc2:	7000           	moveq #0,d0
    5cc4:	302f 01c6      	move.w 454(sp),d0
    5cc8:	2f01           	move.l d1,-(sp)
    5cca:	2f00           	move.l d0,-(sp)
    5ccc:	2f2f 01d0      	move.l 464(sp),-(sp)
    5cd0:	2f2f 0056      	move.l 86(sp),-(sp)
    5cd4:	4eba 0e70      	jsr 6b46 <TestRow>(pc)
    5cd8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5cdc:	702a           	moveq #42,d0
    5cde:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5ce2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<6;i2++) {  
    5ce6:	52af 00ee      	addq.l #1,238(sp)
    5cea:	7205           	moveq #5,d1
    5cec:	b2af 00ee      	cmp.l 238(sp),d1
    5cf0:	6cb8           	bge.s 5caa <TestZoom4Picture+0x1fc6>
    }
    
    for(int i2=0;i2<12;i2++) {
    5cf2:	42af 00ea      	clr.l 234(sp)
    5cf6:	6000 0082      	bra.w 5d7a <TestZoom4Picture+0x2096>
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    5cfa:	222f 00f2      	move.l 242(sp),d1
    5cfe:	2001           	move.l d1,d0
    5d00:	e988           	lsl.l #4,d0
    5d02:	9081           	sub.l d1,d0
    5d04:	d080           	add.l d0,d0
    5d06:	2040           	movea.l d0,a0
    5d08:	41e8 001f      	lea 31(a0),a0
    5d0c:	202f 00ea      	move.l 234(sp),d0
    5d10:	d080           	add.l d0,d0
    5d12:	2208           	move.l a0,d1
    5d14:	d280           	add.l d0,d1
    5d16:	7000           	moveq #0,d0
    5d18:	302f 01c6      	move.w 454(sp),d0
    5d1c:	2f01           	move.l d1,-(sp)
    5d1e:	2f00           	move.l d0,-(sp)
    5d20:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d24:	2f2f 0056      	move.l 86(sp),-(sp)
    5d28:	4eba 0e1c      	jsr 6b46 <TestRow>(pc)
    5d2c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5d30:	702a           	moveq #42,d0
    5d32:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    5d36:	222f 00f2      	move.l 242(sp),d1
    5d3a:	2001           	move.l d1,d0
    5d3c:	e988           	lsl.l #4,d0
    5d3e:	9081           	sub.l d1,d0
    5d40:	d080           	add.l d0,d0
    5d42:	2040           	movea.l d0,a0
    5d44:	41e8 0020      	lea 32(a0),a0
    5d48:	202f 00ea      	move.l 234(sp),d0
    5d4c:	d080           	add.l d0,d0
    5d4e:	2208           	move.l a0,d1
    5d50:	d280           	add.l d0,d1
    5d52:	7000           	moveq #0,d0
    5d54:	302f 01c6      	move.w 454(sp),d0
    5d58:	2f01           	move.l d1,-(sp)
    5d5a:	2f00           	move.l d0,-(sp)
    5d5c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d60:	2f2f 0056      	move.l 86(sp),-(sp)
    5d64:	4eba 0de0      	jsr 6b46 <TestRow>(pc)
    5d68:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5d6c:	722a           	moveq #42,d1
    5d6e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5d72:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {
    5d76:	52af 00ea      	addq.l #1,234(sp)
    5d7a:	700b           	moveq #11,d0
    5d7c:	b0af 00ea      	cmp.l 234(sp),d0
    5d80:	6c00 ff78      	bge.w 5cfa <TestZoom4Picture+0x2016>
  for(int i=0;i<8;i++) {
    5d84:	52af 00f2      	addq.l #1,242(sp)
    5d88:	7207           	moveq #7,d1
    5d8a:	b2af 00f2      	cmp.l 242(sp),d1
    5d8e:	6c00 ff14      	bge.w 5ca4 <TestZoom4Picture+0x1fc0>
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    5d92:	42af 00e6      	clr.l 230(sp)
    5d96:	6032           	bra.s 5dca <TestZoom4Picture+0x20e6>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5d98:	222f 00e6      	move.l 230(sp),d1
    5d9c:	0681 0000 0104 	addi.l #260,d1
    5da2:	7000           	moveq #0,d0
    5da4:	302f 01c6      	move.w 454(sp),d0
    5da8:	2f01           	move.l d1,-(sp)
    5daa:	2f00           	move.l d0,-(sp)
    5dac:	2f2f 01d0      	move.l 464(sp),-(sp)
    5db0:	2f2f 0056      	move.l 86(sp),-(sp)
    5db4:	4eba 0d90      	jsr 6b46 <TestRow>(pc)
    5db8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5dbc:	702a           	moveq #42,d0
    5dbe:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5dc2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5dc6:	52af 00e6      	addq.l #1,230(sp)
    5dca:	7204           	moveq #4,d1
    5dcc:	b2af 00e6      	cmp.l 230(sp),d1
    5dd0:	6cc6           	bge.s 5d98 <TestZoom4Picture+0x20b4>
  }

  tmp = source;
    5dd2:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5dd8:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5dde:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    5de4:	4878 0001      	pea 1 <_start+0x1>
    5de8:	4878 000c      	pea c <_start+0xc>
    5dec:	2f2f 0056      	move.l 86(sp),-(sp)
    5df0:	2f2f 006a      	move.l 106(sp),-(sp)
    5df4:	4eba bc9e      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    5df8:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5dfc:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    5e02:	2c40           	movea.l d0,a6
    5e04:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5e08:	202f 004e      	move.l 78(sp),d0
    5e0c:	5880           	addq.l #4,d0
    5e0e:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom13;
    5e12:	2f7c 0000 bcd8 	move.l #48344,74(sp)
    5e18:	004a 

  mask = 0xffff;
    5e1a:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<11;i2++) {
    5e20:	42af 00e2      	clr.l 226(sp)
    5e24:	605a           	bra.s 5e80 <TestZoom4Picture+0x219c>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    5e26:	202f 00e2      	move.l 226(sp),d0
    5e2a:	d080           	add.l d0,d0
    5e2c:	2200           	move.l d0,d1
    5e2e:	7000           	moveq #0,d0
    5e30:	302f 01c6      	move.w 454(sp),d0
    5e34:	2f01           	move.l d1,-(sp)
    5e36:	2f00           	move.l d0,-(sp)
    5e38:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e3c:	2f2f 0056      	move.l 86(sp),-(sp)
    5e40:	4eba 0d04      	jsr 6b46 <TestRow>(pc)
    5e44:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5e48:	722a           	moveq #42,d1
    5e4a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    5e4e:	202f 00e2      	move.l 226(sp),d0
    5e52:	d080           	add.l d0,d0
    5e54:	2200           	move.l d0,d1
    5e56:	5281           	addq.l #1,d1
    5e58:	7000           	moveq #0,d0
    5e5a:	302f 01c6      	move.w 454(sp),d0
    5e5e:	2f01           	move.l d1,-(sp)
    5e60:	2f00           	move.l d0,-(sp)
    5e62:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e66:	2f2f 0056      	move.l 86(sp),-(sp)
    5e6a:	4eba 0cda      	jsr 6b46 <TestRow>(pc)
    5e6e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5e72:	702a           	moveq #42,d0
    5e74:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5e78:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5e7c:	52af 00e2      	addq.l #1,226(sp)
    5e80:	720a           	moveq #10,d1
    5e82:	b2af 00e2      	cmp.l 226(sp),d1
    5e86:	6c9e           	bge.s 5e26 <TestZoom4Picture+0x2142>
  } 

  for(int i=0;i<8;i++) {
    5e88:	42af 00de      	clr.l 222(sp)
    5e8c:	6000 00de      	bra.w 5f6c <TestZoom4Picture+0x2288>
    for(int i2=0;i2<5;i2++) {  
    5e90:	42af 00da      	clr.l 218(sp)
    5e94:	603e           	bra.s 5ed4 <TestZoom4Picture+0x21f0>
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    5e96:	307c 0016      	movea.w #22,a0
    5e9a:	d1ef 00da      	adda.l 218(sp),a0
    5e9e:	222f 00de      	move.l 222(sp),d1
    5ea2:	2001           	move.l d1,d0
    5ea4:	eb88           	lsl.l #5,d0
    5ea6:	9081           	sub.l d1,d0
    5ea8:	2208           	move.l a0,d1
    5eaa:	d280           	add.l d0,d1
    5eac:	7000           	moveq #0,d0
    5eae:	302f 01c6      	move.w 454(sp),d0
    5eb2:	2f01           	move.l d1,-(sp)
    5eb4:	2f00           	move.l d0,-(sp)
    5eb6:	2f2f 01d0      	move.l 464(sp),-(sp)
    5eba:	2f2f 0056      	move.l 86(sp),-(sp)
    5ebe:	4eba 0c86      	jsr 6b46 <TestRow>(pc)
    5ec2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5ec6:	702a           	moveq #42,d0
    5ec8:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5ecc:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<5;i2++) {  
    5ed0:	52af 00da      	addq.l #1,218(sp)
    5ed4:	7204           	moveq #4,d1
    5ed6:	b2af 00da      	cmp.l 218(sp),d1
    5eda:	6cba           	bge.s 5e96 <TestZoom4Picture+0x21b2>
    }
    
    for(int i2=0;i2<13;i2++) {
    5edc:	42af 00d6      	clr.l 214(sp)
    5ee0:	607c           	bra.s 5f5e <TestZoom4Picture+0x227a>
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    5ee2:	222f 00de      	move.l 222(sp),d1
    5ee6:	2001           	move.l d1,d0
    5ee8:	eb88           	lsl.l #5,d0
    5eea:	2040           	movea.l d0,a0
    5eec:	91c1           	suba.l d1,a0
    5eee:	41e8 001b      	lea 27(a0),a0
    5ef2:	202f 00d6      	move.l 214(sp),d0
    5ef6:	d080           	add.l d0,d0
    5ef8:	2208           	move.l a0,d1
    5efa:	d280           	add.l d0,d1
    5efc:	7000           	moveq #0,d0
    5efe:	302f 01c6      	move.w 454(sp),d0
    5f02:	2f01           	move.l d1,-(sp)
    5f04:	2f00           	move.l d0,-(sp)
    5f06:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f0a:	2f2f 0056      	move.l 86(sp),-(sp)
    5f0e:	4eba 0c36      	jsr 6b46 <TestRow>(pc)
    5f12:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f16:	702a           	moveq #42,d0
    5f18:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    5f1c:	222f 00de      	move.l 222(sp),d1
    5f20:	2001           	move.l d1,d0
    5f22:	eb88           	lsl.l #5,d0
    5f24:	2040           	movea.l d0,a0
    5f26:	91c1           	suba.l d1,a0
    5f28:	41e8 001c      	lea 28(a0),a0
    5f2c:	202f 00d6      	move.l 214(sp),d0
    5f30:	d080           	add.l d0,d0
    5f32:	2208           	move.l a0,d1
    5f34:	d280           	add.l d0,d1
    5f36:	7000           	moveq #0,d0
    5f38:	302f 01c6      	move.w 454(sp),d0
    5f3c:	2f01           	move.l d1,-(sp)
    5f3e:	2f00           	move.l d0,-(sp)
    5f40:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f44:	2f2f 0056      	move.l 86(sp),-(sp)
    5f48:	4eba 0bfc      	jsr 6b46 <TestRow>(pc)
    5f4c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f50:	722a           	moveq #42,d1
    5f52:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5f56:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {
    5f5a:	52af 00d6      	addq.l #1,214(sp)
    5f5e:	700c           	moveq #12,d0
    5f60:	b0af 00d6      	cmp.l 214(sp),d0
    5f64:	6c00 ff7c      	bge.w 5ee2 <TestZoom4Picture+0x21fe>
  for(int i=0;i<8;i++) {
    5f68:	52af 00de      	addq.l #1,222(sp)
    5f6c:	7207           	moveq #7,d1
    5f6e:	b2af 00de      	cmp.l 222(sp),d1
    5f72:	6c00 ff1c      	bge.w 5e90 <TestZoom4Picture+0x21ac>
    }
  } 

  tmp = source;
    5f76:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5f7c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5f82:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    5f88:	4878 0001      	pea 1 <_start+0x1>
    5f8c:	4878 000d      	pea d <_start+0xd>
    5f90:	2f2f 0056      	move.l 86(sp),-(sp)
    5f94:	2f2f 006a      	move.l 106(sp),-(sp)
    5f98:	4eba bafa      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    5f9c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5fa0:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    5fa6:	2c40           	movea.l d0,a6
    5fa8:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5fac:	202f 004e      	move.l 78(sp),d0
    5fb0:	5880           	addq.l #4,d0
    5fb2:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom14;
    5fb6:	2f7c 0000 bd04 	move.l #48388,74(sp)
    5fbc:	004a 

  mask = 0xffff;
    5fbe:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    5fc4:	7000           	moveq #0,d0
    5fc6:	302f 01c6      	move.w 454(sp),d0
    5fca:	42a7           	clr.l -(sp)
    5fcc:	2f00           	move.l d0,-(sp)
    5fce:	2f2f 01d0      	move.l 464(sp),-(sp)
    5fd2:	2f2f 0056      	move.l 86(sp),-(sp)
    5fd6:	4eba 0b6e      	jsr 6b46 <TestRow>(pc)
    5fda:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2; 
    5fde:	722a           	moveq #42,d1
    5fe0:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff; 
    5fe4:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<9;i2++) {
    5fe8:	42af 00d2      	clr.l 210(sp)
    5fec:	605c           	bra.s 604a <TestZoom4Picture+0x2366>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5fee:	202f 00d2      	move.l 210(sp),d0
    5ff2:	d080           	add.l d0,d0
    5ff4:	2200           	move.l d0,d1
    5ff6:	5281           	addq.l #1,d1
    5ff8:	7000           	moveq #0,d0
    5ffa:	302f 01c6      	move.w 454(sp),d0
    5ffe:	2f01           	move.l d1,-(sp)
    6000:	2f00           	move.l d0,-(sp)
    6002:	2f2f 01d0      	move.l 464(sp),-(sp)
    6006:	2f2f 0056      	move.l 86(sp),-(sp)
    600a:	4eba 0b3a      	jsr 6b46 <TestRow>(pc)
    600e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6012:	702a           	moveq #42,d0
    6014:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    6018:	202f 00d2      	move.l 210(sp),d0
    601c:	5280           	addq.l #1,d0
    601e:	d080           	add.l d0,d0
    6020:	2200           	move.l d0,d1
    6022:	7000           	moveq #0,d0
    6024:	302f 01c6      	move.w 454(sp),d0
    6028:	2f01           	move.l d1,-(sp)
    602a:	2f00           	move.l d0,-(sp)
    602c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6030:	2f2f 0056      	move.l 86(sp),-(sp)
    6034:	4eba 0b10      	jsr 6b46 <TestRow>(pc)
    6038:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    603c:	722a           	moveq #42,d1
    603e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6042:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {
    6046:	52af 00d2      	addq.l #1,210(sp)
    604a:	7008           	moveq #8,d0
    604c:	b0af 00d2      	cmp.l 210(sp),d0
    6050:	6c9c           	bge.s 5fee <TestZoom4Picture+0x230a>
  } 

  for(int i=0;i<7;i++) {
    6052:	42af 00ce      	clr.l 206(sp)
    6056:	6000 00cc      	bra.w 6124 <TestZoom4Picture+0x2440>
    for(int i2=0;i2<4;i2++) {  
    605a:	42af 00ca      	clr.l 202(sp)
    605e:	6036           	bra.s 6096 <TestZoom4Picture+0x23b2>
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    6060:	7213           	moveq #19,d1
    6062:	d2af 00ca      	add.l 202(sp),d1
    6066:	202f 00ce      	move.l 206(sp),d0
    606a:	eb88           	lsl.l #5,d0
    606c:	d280           	add.l d0,d1
    606e:	7000           	moveq #0,d0
    6070:	302f 01c6      	move.w 454(sp),d0
    6074:	2f01           	move.l d1,-(sp)
    6076:	2f00           	move.l d0,-(sp)
    6078:	2f2f 01d0      	move.l 464(sp),-(sp)
    607c:	2f2f 0056      	move.l 86(sp),-(sp)
    6080:	4eba 0ac4      	jsr 6b46 <TestRow>(pc)
    6084:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6088:	722a           	moveq #42,d1
    608a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    608e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<4;i2++) {  
    6092:	52af 00ca      	addq.l #1,202(sp)
    6096:	7003           	moveq #3,d0
    6098:	b0af 00ca      	cmp.l 202(sp),d0
    609c:	6cc2           	bge.s 6060 <TestZoom4Picture+0x237c>
    }
    
    for(int i2=0;i2<14;i2++) {
    609e:	42af 00c6      	clr.l 198(sp)
    60a2:	6074           	bra.s 6118 <TestZoom4Picture+0x2434>
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    60a4:	202f 00ce      	move.l 206(sp),d0
    60a8:	eb88           	lsl.l #5,d0
    60aa:	307c 0017      	movea.w #23,a0
    60ae:	d1c0           	adda.l d0,a0
    60b0:	202f 00c6      	move.l 198(sp),d0
    60b4:	d080           	add.l d0,d0
    60b6:	2208           	move.l a0,d1
    60b8:	d280           	add.l d0,d1
    60ba:	7000           	moveq #0,d0
    60bc:	302f 01c6      	move.w 454(sp),d0
    60c0:	2f01           	move.l d1,-(sp)
    60c2:	2f00           	move.l d0,-(sp)
    60c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    60c8:	2f2f 0056      	move.l 86(sp),-(sp)
    60cc:	4eba 0a78      	jsr 6b46 <TestRow>(pc)
    60d0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    60d4:	722a           	moveq #42,d1
    60d6:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    60da:	202f 00ce      	move.l 206(sp),d0
    60de:	eb88           	lsl.l #5,d0
    60e0:	307c 0018      	movea.w #24,a0
    60e4:	d1c0           	adda.l d0,a0
    60e6:	202f 00c6      	move.l 198(sp),d0
    60ea:	d080           	add.l d0,d0
    60ec:	2208           	move.l a0,d1
    60ee:	d280           	add.l d0,d1
    60f0:	7000           	moveq #0,d0
    60f2:	302f 01c6      	move.w 454(sp),d0
    60f6:	2f01           	move.l d1,-(sp)
    60f8:	2f00           	move.l d0,-(sp)
    60fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    60fe:	2f2f 0056      	move.l 86(sp),-(sp)
    6102:	4eba 0a42      	jsr 6b46 <TestRow>(pc)
    6106:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    610a:	702a           	moveq #42,d0
    610c:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6110:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {
    6114:	52af 00c6      	addq.l #1,198(sp)
    6118:	720d           	moveq #13,d1
    611a:	b2af 00c6      	cmp.l 198(sp),d1
    611e:	6c84           	bge.s 60a4 <TestZoom4Picture+0x23c0>
  for(int i=0;i<7;i++) {
    6120:	52af 00ce      	addq.l #1,206(sp)
    6124:	7006           	moveq #6,d0
    6126:	b0af 00ce      	cmp.l 206(sp),d0
    612a:	6c00 ff2e      	bge.w 605a <TestZoom4Picture+0x2376>
    }
  }

  for(int i2=0;i2<4;i2++) {  
    612e:	42af 00c2      	clr.l 194(sp)
    6132:	6032           	bra.s 6166 <TestZoom4Picture+0x2482>
    TestRow( valsupposed, valactual, mask, 243+i2);
    6134:	222f 00c2      	move.l 194(sp),d1
    6138:	0681 0000 00f3 	addi.l #243,d1
    613e:	7000           	moveq #0,d0
    6140:	302f 01c6      	move.w 454(sp),d0
    6144:	2f01           	move.l d1,-(sp)
    6146:	2f00           	move.l d0,-(sp)
    6148:	2f2f 01d0      	move.l 464(sp),-(sp)
    614c:	2f2f 0056      	move.l 86(sp),-(sp)
    6150:	4eba 09f4      	jsr 6b46 <TestRow>(pc)
    6154:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6158:	722a           	moveq #42,d1
    615a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    615e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {  
    6162:	52af 00c2      	addq.l #1,194(sp)
    6166:	7003           	moveq #3,d0
    6168:	b0af 00c2      	cmp.l 194(sp),d0
    616c:	6cc6           	bge.s 6134 <TestZoom4Picture+0x2450>
  }

  for(int i2=0;i2<12;i2++) {
    616e:	42af 00be      	clr.l 190(sp)
    6172:	6060           	bra.s 61d4 <TestZoom4Picture+0x24f0>
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    6174:	202f 00be      	move.l 190(sp),d0
    6178:	d080           	add.l d0,d0
    617a:	2200           	move.l d0,d1
    617c:	0681 0000 00f7 	addi.l #247,d1
    6182:	7000           	moveq #0,d0
    6184:	302f 01c6      	move.w 454(sp),d0
    6188:	2f01           	move.l d1,-(sp)
    618a:	2f00           	move.l d0,-(sp)
    618c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6190:	2f2f 0056      	move.l 86(sp),-(sp)
    6194:	4eba 09b0      	jsr 6b46 <TestRow>(pc)
    6198:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    619c:	722a           	moveq #42,d1
    619e:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    61a2:	707c           	moveq #124,d0
    61a4:	d0af 00be      	add.l 190(sp),d0
    61a8:	d080           	add.l d0,d0
    61aa:	2200           	move.l d0,d1
    61ac:	7000           	moveq #0,d0
    61ae:	302f 01c6      	move.w 454(sp),d0
    61b2:	2f01           	move.l d1,-(sp)
    61b4:	2f00           	move.l d0,-(sp)
    61b6:	2f2f 01d0      	move.l 464(sp),-(sp)
    61ba:	2f2f 0056      	move.l 86(sp),-(sp)
    61be:	4eba 0986      	jsr 6b46 <TestRow>(pc)
    61c2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61c6:	702a           	moveq #42,d0
    61c8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    61cc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    61d0:	52af 00be      	addq.l #1,190(sp)
    61d4:	720b           	moveq #11,d1
    61d6:	b2af 00be      	cmp.l 190(sp),d1
    61da:	6c98           	bge.s 6174 <TestZoom4Picture+0x2490>
  }

  tmp = source;
    61dc:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    61e2:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    61e8:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    61ee:	4878 0001      	pea 1 <_start+0x1>
    61f2:	4878 000e      	pea e <_start+0xe>
    61f6:	2f2f 0056      	move.l 86(sp),-(sp)
    61fa:	2f2f 006a      	move.l 106(sp),-(sp)
    61fe:	4eba b894      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    6202:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6206:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    620c:	2c40           	movea.l d0,a6
    620e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6212:	202f 004e      	move.l 78(sp),d0
    6216:	5880           	addq.l #4,d0
    6218:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom15;
    621c:	2f7c 0000 bd30 	move.l #48432,74(sp)
    6222:	004a 

  mask = 0x0000;
    6224:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<8;i2++) {
    6228:	42af 00ba      	clr.l 186(sp)
    622c:	605a           	bra.s 6288 <TestZoom4Picture+0x25a4>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    622e:	202f 00ba      	move.l 186(sp),d0
    6232:	d080           	add.l d0,d0
    6234:	2200           	move.l d0,d1
    6236:	7000           	moveq #0,d0
    6238:	302f 01c6      	move.w 454(sp),d0
    623c:	2f01           	move.l d1,-(sp)
    623e:	2f00           	move.l d0,-(sp)
    6240:	2f2f 01d0      	move.l 464(sp),-(sp)
    6244:	2f2f 0056      	move.l 86(sp),-(sp)
    6248:	4eba 08fc      	jsr 6b46 <TestRow>(pc)
    624c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6250:	722a           	moveq #42,d1
    6252:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6256:	202f 00ba      	move.l 186(sp),d0
    625a:	d080           	add.l d0,d0
    625c:	2200           	move.l d0,d1
    625e:	5281           	addq.l #1,d1
    6260:	7000           	moveq #0,d0
    6262:	302f 01c6      	move.w 454(sp),d0
    6266:	2f01           	move.l d1,-(sp)
    6268:	2f00           	move.l d0,-(sp)
    626a:	2f2f 01d0      	move.l 464(sp),-(sp)
    626e:	2f2f 0056      	move.l 86(sp),-(sp)
    6272:	4eba 08d2      	jsr 6b46 <TestRow>(pc)
    6276:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    627a:	702a           	moveq #42,d0
    627c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6280:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    6284:	52af 00ba      	addq.l #1,186(sp)
    6288:	7207           	moveq #7,d1
    628a:	b2af 00ba      	cmp.l 186(sp),d1
    628e:	6c9e           	bge.s 622e <TestZoom4Picture+0x254a>
  }

  for(int i=0;i<7;i++) {
    6290:	42af 00b6      	clr.l 182(sp)
    6294:	6000 00de      	bra.w 6374 <TestZoom4Picture+0x2690>
    for(int i2=0;i2<3;i2++) {  
    6298:	42af 00b2      	clr.l 178(sp)
    629c:	603e           	bra.s 62dc <TestZoom4Picture+0x25f8>
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    629e:	307c 0010      	movea.w #16,a0
    62a2:	d1ef 00b2      	adda.l 178(sp),a0
    62a6:	222f 00b6      	move.l 182(sp),d1
    62aa:	2001           	move.l d1,d0
    62ac:	eb88           	lsl.l #5,d0
    62ae:	d081           	add.l d1,d0
    62b0:	2208           	move.l a0,d1
    62b2:	d280           	add.l d0,d1
    62b4:	7000           	moveq #0,d0
    62b6:	302f 01c6      	move.w 454(sp),d0
    62ba:	2f01           	move.l d1,-(sp)
    62bc:	2f00           	move.l d0,-(sp)
    62be:	2f2f 01d0      	move.l 464(sp),-(sp)
    62c2:	2f2f 0056      	move.l 86(sp),-(sp)
    62c6:	4eba 087e      	jsr 6b46 <TestRow>(pc)
    62ca:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    62ce:	702a           	moveq #42,d0
    62d0:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    62d4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<3;i2++) {  
    62d8:	52af 00b2      	addq.l #1,178(sp)
    62dc:	7202           	moveq #2,d1
    62de:	b2af 00b2      	cmp.l 178(sp),d1
    62e2:	6cba           	bge.s 629e <TestZoom4Picture+0x25ba>
    }
    
    for(int i2=0;i2<15;i2++) {
    62e4:	42af 00ae      	clr.l 174(sp)
    62e8:	607c           	bra.s 6366 <TestZoom4Picture+0x2682>
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    62ea:	222f 00b6      	move.l 182(sp),d1
    62ee:	2001           	move.l d1,d0
    62f0:	eb88           	lsl.l #5,d0
    62f2:	2040           	movea.l d0,a0
    62f4:	d1c1           	adda.l d1,a0
    62f6:	41e8 0013      	lea 19(a0),a0
    62fa:	202f 00ae      	move.l 174(sp),d0
    62fe:	d080           	add.l d0,d0
    6300:	2208           	move.l a0,d1
    6302:	d280           	add.l d0,d1
    6304:	7000           	moveq #0,d0
    6306:	302f 01c6      	move.w 454(sp),d0
    630a:	2f01           	move.l d1,-(sp)
    630c:	2f00           	move.l d0,-(sp)
    630e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6312:	2f2f 0056      	move.l 86(sp),-(sp)
    6316:	4eba 082e      	jsr 6b46 <TestRow>(pc)
    631a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    631e:	702a           	moveq #42,d0
    6320:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    6324:	222f 00b6      	move.l 182(sp),d1
    6328:	2001           	move.l d1,d0
    632a:	eb88           	lsl.l #5,d0
    632c:	2040           	movea.l d0,a0
    632e:	d1c1           	adda.l d1,a0
    6330:	41e8 0013      	lea 19(a0),a0
    6334:	202f 00ae      	move.l 174(sp),d0
    6338:	d080           	add.l d0,d0
    633a:	2208           	move.l a0,d1
    633c:	d280           	add.l d0,d1
    633e:	7000           	moveq #0,d0
    6340:	302f 01c6      	move.w 454(sp),d0
    6344:	2f01           	move.l d1,-(sp)
    6346:	2f00           	move.l d0,-(sp)
    6348:	2f2f 01d0      	move.l 464(sp),-(sp)
    634c:	2f2f 0056      	move.l 86(sp),-(sp)
    6350:	4eba 07f4      	jsr 6b46 <TestRow>(pc)
    6354:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6358:	722a           	moveq #42,d1
    635a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    635e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {
    6362:	52af 00ae      	addq.l #1,174(sp)
    6366:	700e           	moveq #14,d0
    6368:	b0af 00ae      	cmp.l 174(sp),d0
    636c:	6c00 ff7c      	bge.w 62ea <TestZoom4Picture+0x2606>
  for(int i=0;i<7;i++) {
    6370:	52af 00b6      	addq.l #1,182(sp)
    6374:	7206           	moveq #6,d1
    6376:	b2af 00b6      	cmp.l 182(sp),d1
    637a:	6c00 ff1c      	bge.w 6298 <TestZoom4Picture+0x25b4>
    }
  }

  for(int i2=0;i2<3;i2++) {  
    637e:	42af 00aa      	clr.l 170(sp)
    6382:	6032           	bra.s 63b6 <TestZoom4Picture+0x26d2>
    TestRow( valsupposed, valactual, mask, 247+i2);
    6384:	222f 00aa      	move.l 170(sp),d1
    6388:	0681 0000 00f7 	addi.l #247,d1
    638e:	7000           	moveq #0,d0
    6390:	302f 01c6      	move.w 454(sp),d0
    6394:	2f01           	move.l d1,-(sp)
    6396:	2f00           	move.l d0,-(sp)
    6398:	2f2f 01d0      	move.l 464(sp),-(sp)
    639c:	2f2f 0056      	move.l 86(sp),-(sp)
    63a0:	4eba 07a4      	jsr 6b46 <TestRow>(pc)
    63a4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    63a8:	702a           	moveq #42,d0
    63aa:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    63ae:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<3;i2++) {  
    63b2:	52af 00aa      	addq.l #1,170(sp)
    63b6:	7202           	moveq #2,d1
    63b8:	b2af 00aa      	cmp.l 170(sp),d1
    63bc:	6cc6           	bge.s 6384 <TestZoom4Picture+0x26a0>
  }

  for(int i2=0;i2<10;i2++) {
    63be:	42af 00a6      	clr.l 166(sp)
    63c2:	6060           	bra.s 6424 <TestZoom4Picture+0x2740>
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    63c4:	707d           	moveq #125,d0
    63c6:	d0af 00a6      	add.l 166(sp),d0
    63ca:	d080           	add.l d0,d0
    63cc:	2200           	move.l d0,d1
    63ce:	7000           	moveq #0,d0
    63d0:	302f 01c6      	move.w 454(sp),d0
    63d4:	2f01           	move.l d1,-(sp)
    63d6:	2f00           	move.l d0,-(sp)
    63d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    63dc:	2f2f 0056      	move.l 86(sp),-(sp)
    63e0:	4eba 0764      	jsr 6b46 <TestRow>(pc)
    63e4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    63e8:	702a           	moveq #42,d0
    63ea:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    63ee:	202f 00a6      	move.l 166(sp),d0
    63f2:	d080           	add.l d0,d0
    63f4:	2200           	move.l d0,d1
    63f6:	0681 0000 00fb 	addi.l #251,d1
    63fc:	7000           	moveq #0,d0
    63fe:	302f 01c6      	move.w 454(sp),d0
    6402:	2f01           	move.l d1,-(sp)
    6404:	2f00           	move.l d0,-(sp)
    6406:	2f2f 01d0      	move.l 464(sp),-(sp)
    640a:	2f2f 0056      	move.l 86(sp),-(sp)
    640e:	4eba 0736      	jsr 6b46 <TestRow>(pc)
    6412:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6416:	722a           	moveq #42,d1
    6418:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    641c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {
    6420:	52af 00a6      	addq.l #1,166(sp)
    6424:	7009           	moveq #9,d0
    6426:	b0af 00a6      	cmp.l 166(sp),d0
    642a:	6c98           	bge.s 63c4 <TestZoom4Picture+0x26e0>
  }

  tmp = source;
    642c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6432:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6438:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    643e:	4878 0001      	pea 1 <_start+0x1>
    6442:	4878 000f      	pea f <_start+0xf>
    6446:	2f2f 0056      	move.l 86(sp),-(sp)
    644a:	2f2f 006a      	move.l 106(sp),-(sp)
    644e:	4eba b644      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    6452:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6456:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    645c:	2c40           	movea.l d0,a6
    645e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6462:	222f 004e      	move.l 78(sp),d1
    6466:	5881           	addq.l #4,d1
    6468:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom16;
    646c:	2f7c 0000 bd5c 	move.l #48476,74(sp)
    6472:	004a 

  mask = 0x0000;
    6474:	426f 01c6      	clr.w 454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    6478:	7000           	moveq #0,d0
    647a:	302f 01c6      	move.w 454(sp),d0
    647e:	42a7           	clr.l -(sp)
    6480:	2f00           	move.l d0,-(sp)
    6482:	2f2f 01d0      	move.l 464(sp),-(sp)
    6486:	2f2f 0056      	move.l 86(sp),-(sp)
    648a:	4eba 06ba      	jsr 6b46 <TestRow>(pc)
    648e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6492:	702a           	moveq #42,d0
    6494:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6498:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    649c:	42af 00a2      	clr.l 162(sp)
    64a0:	605a           	bra.s 64fc <TestZoom4Picture+0x2818>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    64a2:	202f 00a2      	move.l 162(sp),d0
    64a6:	d080           	add.l d0,d0
    64a8:	2200           	move.l d0,d1
    64aa:	7000           	moveq #0,d0
    64ac:	302f 01c6      	move.w 454(sp),d0
    64b0:	2f01           	move.l d1,-(sp)
    64b2:	2f00           	move.l d0,-(sp)
    64b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    64b8:	2f2f 0056      	move.l 86(sp),-(sp)
    64bc:	4eba 0688      	jsr 6b46 <TestRow>(pc)
    64c0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    64c4:	722a           	moveq #42,d1
    64c6:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    64ca:	202f 00a2      	move.l 162(sp),d0
    64ce:	d080           	add.l d0,d0
    64d0:	2200           	move.l d0,d1
    64d2:	5281           	addq.l #1,d1
    64d4:	7000           	moveq #0,d0
    64d6:	302f 01c6      	move.w 454(sp),d0
    64da:	2f01           	move.l d1,-(sp)
    64dc:	2f00           	move.l d0,-(sp)
    64de:	2f2f 01d0      	move.l 464(sp),-(sp)
    64e2:	2f2f 0056      	move.l 86(sp),-(sp)
    64e6:	4eba 065e      	jsr 6b46 <TestRow>(pc)
    64ea:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    64ee:	702a           	moveq #42,d0
    64f0:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    64f4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    64f8:	52af 00a2      	addq.l #1,162(sp)
    64fc:	7205           	moveq #5,d1
    64fe:	b2af 00a2      	cmp.l 162(sp),d1
    6502:	6c9e           	bge.s 64a2 <TestZoom4Picture+0x27be>
  }

  for(int i=0;i<7;i++) {
    6504:	42af 009e      	clr.l 158(sp)
    6508:	6000 00e6      	bra.w 65f0 <TestZoom4Picture+0x290c>
    for(int i2=0;i2<2;i2++) {  
    650c:	42af 009a      	clr.l 154(sp)
    6510:	6040           	bra.s 6552 <TestZoom4Picture+0x286e>
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    6512:	307c 000d      	movea.w #13,a0
    6516:	d1ef 009a      	adda.l 154(sp),a0
    651a:	222f 009e      	move.l 158(sp),d1
    651e:	2001           	move.l d1,d0
    6520:	e988           	lsl.l #4,d0
    6522:	d081           	add.l d1,d0
    6524:	d080           	add.l d0,d0
    6526:	2208           	move.l a0,d1
    6528:	d280           	add.l d0,d1
    652a:	7000           	moveq #0,d0
    652c:	302f 01c6      	move.w 454(sp),d0
    6530:	2f01           	move.l d1,-(sp)
    6532:	2f00           	move.l d0,-(sp)
    6534:	2f2f 01d0      	move.l 464(sp),-(sp)
    6538:	2f2f 0056      	move.l 86(sp),-(sp)
    653c:	4eba 0608      	jsr 6b46 <TestRow>(pc)
    6540:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6544:	702a           	moveq #42,d0
    6546:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    654a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<2;i2++) {  
    654e:	52af 009a      	addq.l #1,154(sp)
    6552:	7201           	moveq #1,d1
    6554:	b2af 009a      	cmp.l 154(sp),d1
    6558:	6cb8           	bge.s 6512 <TestZoom4Picture+0x282e>
    }
    
    for(int i2=0;i2<16;i2++) {
    655a:	42af 0096      	clr.l 150(sp)
    655e:	6000 0082      	bra.w 65e2 <TestZoom4Picture+0x28fe>
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    6562:	222f 009e      	move.l 158(sp),d1
    6566:	2001           	move.l d1,d0
    6568:	e988           	lsl.l #4,d0
    656a:	d081           	add.l d1,d0
    656c:	d080           	add.l d0,d0
    656e:	2040           	movea.l d0,a0
    6570:	41e8 0010      	lea 16(a0),a0
    6574:	202f 0096      	move.l 150(sp),d0
    6578:	d080           	add.l d0,d0
    657a:	2208           	move.l a0,d1
    657c:	d280           	add.l d0,d1
    657e:	7000           	moveq #0,d0
    6580:	302f 01c6      	move.w 454(sp),d0
    6584:	2f01           	move.l d1,-(sp)
    6586:	2f00           	move.l d0,-(sp)
    6588:	2f2f 01d0      	move.l 464(sp),-(sp)
    658c:	2f2f 0056      	move.l 86(sp),-(sp)
    6590:	4eba 05b4      	jsr 6b46 <TestRow>(pc)
    6594:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6598:	702a           	moveq #42,d0
    659a:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    659e:	222f 009e      	move.l 158(sp),d1
    65a2:	2001           	move.l d1,d0
    65a4:	e988           	lsl.l #4,d0
    65a6:	d081           	add.l d1,d0
    65a8:	d080           	add.l d0,d0
    65aa:	2040           	movea.l d0,a0
    65ac:	41e8 0011      	lea 17(a0),a0
    65b0:	202f 0096      	move.l 150(sp),d0
    65b4:	d080           	add.l d0,d0
    65b6:	2208           	move.l a0,d1
    65b8:	d280           	add.l d0,d1
    65ba:	7000           	moveq #0,d0
    65bc:	302f 01c6      	move.w 454(sp),d0
    65c0:	2f01           	move.l d1,-(sp)
    65c2:	2f00           	move.l d0,-(sp)
    65c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    65c8:	2f2f 0056      	move.l 86(sp),-(sp)
    65cc:	4eba 0578      	jsr 6b46 <TestRow>(pc)
    65d0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    65d4:	722a           	moveq #42,d1
    65d6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    65da:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {
    65de:	52af 0096      	addq.l #1,150(sp)
    65e2:	700f           	moveq #15,d0
    65e4:	b0af 0096      	cmp.l 150(sp),d0
    65e8:	6c00 ff78      	bge.w 6562 <TestZoom4Picture+0x287e>
  for(int i=0;i<7;i++) {
    65ec:	52af 009e      	addq.l #1,158(sp)
    65f0:	7206           	moveq #6,d1
    65f2:	b2af 009e      	cmp.l 158(sp),d1
    65f6:	6c00 ff14      	bge.w 650c <TestZoom4Picture+0x2828>
    }
  }

  for(int i2=0;i2<2;i2++) {
    65fa:	42af 0092      	clr.l 146(sp)
    65fe:	6032           	bra.s 6632 <TestZoom4Picture+0x294e>
    TestRow( valsupposed, valactual, mask, 251+i2);
    6600:	222f 0092      	move.l 146(sp),d1
    6604:	0681 0000 00fb 	addi.l #251,d1
    660a:	7000           	moveq #0,d0
    660c:	302f 01c6      	move.w 454(sp),d0
    6610:	2f01           	move.l d1,-(sp)
    6612:	2f00           	move.l d0,-(sp)
    6614:	2f2f 01d0      	move.l 464(sp),-(sp)
    6618:	2f2f 0056      	move.l 86(sp),-(sp)
    661c:	4eba 0528      	jsr 6b46 <TestRow>(pc)
    6620:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6624:	702a           	moveq #42,d0
    6626:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    662a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<2;i2++) {
    662e:	52af 0092      	addq.l #1,146(sp)
    6632:	7201           	moveq #1,d1
    6634:	b2af 0092      	cmp.l 146(sp),d1
    6638:	6cc6           	bge.s 6600 <TestZoom4Picture+0x291c>
  }

  for(int i2=0;i2<8;i2++) {
    663a:	42af 008e      	clr.l 142(sp)
    663e:	6060           	bra.s 66a0 <TestZoom4Picture+0x29bc>
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    6640:	202f 008e      	move.l 142(sp),d0
    6644:	d080           	add.l d0,d0
    6646:	2200           	move.l d0,d1
    6648:	0681 0000 00fd 	addi.l #253,d1
    664e:	7000           	moveq #0,d0
    6650:	302f 01c6      	move.w 454(sp),d0
    6654:	2f01           	move.l d1,-(sp)
    6656:	2f00           	move.l d0,-(sp)
    6658:	2f2f 01d0      	move.l 464(sp),-(sp)
    665c:	2f2f 0056      	move.l 86(sp),-(sp)
    6660:	4eba 04e4      	jsr 6b46 <TestRow>(pc)
    6664:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6668:	702a           	moveq #42,d0
    666a:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    666e:	707f           	moveq #127,d0
    6670:	d0af 008e      	add.l 142(sp),d0
    6674:	d080           	add.l d0,d0
    6676:	2200           	move.l d0,d1
    6678:	7000           	moveq #0,d0
    667a:	302f 01c6      	move.w 454(sp),d0
    667e:	2f01           	move.l d1,-(sp)
    6680:	2f00           	move.l d0,-(sp)
    6682:	2f2f 01d0      	move.l 464(sp),-(sp)
    6686:	2f2f 0056      	move.l 86(sp),-(sp)
    668a:	4eba 04ba      	jsr 6b46 <TestRow>(pc)
    668e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6692:	722a           	moveq #42,d1
    6694:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6698:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    669c:	52af 008e      	addq.l #1,142(sp)
    66a0:	7007           	moveq #7,d0
    66a2:	b0af 008e      	cmp.l 142(sp),d0
    66a6:	6c98           	bge.s 6640 <TestZoom4Picture+0x295c>
  }

  tmp = source;
    66a8:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    66ae:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    66b4:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    66ba:	4878 0001      	pea 1 <_start+0x1>
    66be:	4878 0010      	pea 10 <_start+0x10>
    66c2:	2f2f 0056      	move.l 86(sp),-(sp)
    66c6:	2f2f 006a      	move.l 106(sp),-(sp)
    66ca:	4eba b3c8      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    66ce:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    66d2:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    66d8:	2c40           	movea.l d0,a6
    66da:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    66de:	222f 004e      	move.l 78(sp),d1
    66e2:	5881           	addq.l #4,d1
    66e4:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom17;
    66e8:	2f7c 0000 bd88 	move.l #48520,74(sp)
    66ee:	004a 

  mask = 0xffff;
    66f0:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<5;i2++) {
    66f6:	42af 008a      	clr.l 138(sp)
    66fa:	605a           	bra.s 6756 <TestZoom4Picture+0x2a72>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    66fc:	202f 008a      	move.l 138(sp),d0
    6700:	d080           	add.l d0,d0
    6702:	2200           	move.l d0,d1
    6704:	7000           	moveq #0,d0
    6706:	302f 01c6      	move.w 454(sp),d0
    670a:	2f01           	move.l d1,-(sp)
    670c:	2f00           	move.l d0,-(sp)
    670e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6712:	2f2f 0056      	move.l 86(sp),-(sp)
    6716:	4eba 042e      	jsr 6b46 <TestRow>(pc)
    671a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    671e:	702a           	moveq #42,d0
    6720:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6724:	202f 008a      	move.l 138(sp),d0
    6728:	d080           	add.l d0,d0
    672a:	2200           	move.l d0,d1
    672c:	5281           	addq.l #1,d1
    672e:	7000           	moveq #0,d0
    6730:	302f 01c6      	move.w 454(sp),d0
    6734:	2f01           	move.l d1,-(sp)
    6736:	2f00           	move.l d0,-(sp)
    6738:	2f2f 01d0      	move.l 464(sp),-(sp)
    673c:	2f2f 0056      	move.l 86(sp),-(sp)
    6740:	4eba 0404      	jsr 6b46 <TestRow>(pc)
    6744:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6748:	722a           	moveq #42,d1
    674a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    674e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {
    6752:	52af 008a      	addq.l #1,138(sp)
    6756:	7004           	moveq #4,d0
    6758:	b0af 008a      	cmp.l 138(sp),d0
    675c:	6c9e           	bge.s 66fc <TestZoom4Picture+0x2a18>
  }

  for(int i=0;i<7;i++) {
    675e:	42af 0086      	clr.l 134(sp)
    6762:	6000 00d4      	bra.w 6838 <TestZoom4Picture+0x2b54>
      TestRow( valsupposed, valactual, mask, 10+i*35);
    6766:	222f 0086      	move.l 134(sp),d1
    676a:	2001           	move.l d1,d0
    676c:	e988           	lsl.l #4,d0
    676e:	d081           	add.l d1,d0
    6770:	d080           	add.l d0,d0
    6772:	2040           	movea.l d0,a0
    6774:	d1c1           	adda.l d1,a0
    6776:	41e8 000a      	lea 10(a0),a0
    677a:	7000           	moveq #0,d0
    677c:	302f 01c6      	move.w 454(sp),d0
    6780:	2f08           	move.l a0,-(sp)
    6782:	2f00           	move.l d0,-(sp)
    6784:	2f2f 01d0      	move.l 464(sp),-(sp)
    6788:	2f2f 0056      	move.l 86(sp),-(sp)
    678c:	4eba 03b8      	jsr 6b46 <TestRow>(pc)
    6790:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6794:	722a           	moveq #42,d1
    6796:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    679a:	466f 01c6      	not.w 454(sp)
    
    for(int i2=0;i2<17;i2++) {
    679e:	42af 0082      	clr.l 130(sp)
    67a2:	6000 0086      	bra.w 682a <TestZoom4Picture+0x2b46>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    67a6:	222f 0086      	move.l 134(sp),d1
    67aa:	2001           	move.l d1,d0
    67ac:	e988           	lsl.l #4,d0
    67ae:	d081           	add.l d1,d0
    67b0:	d080           	add.l d0,d0
    67b2:	2040           	movea.l d0,a0
    67b4:	d1c1           	adda.l d1,a0
    67b6:	41e8 000b      	lea 11(a0),a0
    67ba:	202f 0082      	move.l 130(sp),d0
    67be:	d080           	add.l d0,d0
    67c0:	2208           	move.l a0,d1
    67c2:	d280           	add.l d0,d1
    67c4:	7000           	moveq #0,d0
    67c6:	302f 01c6      	move.w 454(sp),d0
    67ca:	2f01           	move.l d1,-(sp)
    67cc:	2f00           	move.l d0,-(sp)
    67ce:	2f2f 01d0      	move.l 464(sp),-(sp)
    67d2:	2f2f 0056      	move.l 86(sp),-(sp)
    67d6:	4eba 036e      	jsr 6b46 <TestRow>(pc)
    67da:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    67de:	702a           	moveq #42,d0
    67e0:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    67e4:	222f 0086      	move.l 134(sp),d1
    67e8:	2001           	move.l d1,d0
    67ea:	e988           	lsl.l #4,d0
    67ec:	d081           	add.l d1,d0
    67ee:	d080           	add.l d0,d0
    67f0:	2040           	movea.l d0,a0
    67f2:	d1c1           	adda.l d1,a0
    67f4:	41e8 000c      	lea 12(a0),a0
    67f8:	202f 0082      	move.l 130(sp),d0
    67fc:	d080           	add.l d0,d0
    67fe:	2208           	move.l a0,d1
    6800:	d280           	add.l d0,d1
    6802:	7000           	moveq #0,d0
    6804:	302f 01c6      	move.w 454(sp),d0
    6808:	2f01           	move.l d1,-(sp)
    680a:	2f00           	move.l d0,-(sp)
    680c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6810:	2f2f 0056      	move.l 86(sp),-(sp)
    6814:	4eba 0330      	jsr 6b46 <TestRow>(pc)
    6818:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    681c:	722a           	moveq #42,d1
    681e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6822:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<17;i2++) {
    6826:	52af 0082      	addq.l #1,130(sp)
    682a:	7010           	moveq #16,d0
    682c:	b0af 0082      	cmp.l 130(sp),d0
    6830:	6c00 ff74      	bge.w 67a6 <TestZoom4Picture+0x2ac2>
  for(int i=0;i<7;i++) {
    6834:	52af 0086      	addq.l #1,134(sp)
    6838:	7206           	moveq #6,d1
    683a:	b2af 0086      	cmp.l 134(sp),d1
    683e:	6c00 ff26      	bge.w 6766 <TestZoom4Picture+0x2a82>
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    6842:	7000           	moveq #0,d0
    6844:	302f 01c6      	move.w 454(sp),d0
    6848:	4878 00ff      	pea ff <FreeDisplay+0x1f>
    684c:	2f00           	move.l d0,-(sp)
    684e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6852:	2f2f 0056      	move.l 86(sp),-(sp)
    6856:	4eba 02ee      	jsr 6b46 <TestRow>(pc)
    685a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    685e:	702a           	moveq #42,d0
    6860:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6864:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<7;i2++) {
    6868:	42af 007e      	clr.l 126(sp)
    686c:	6064           	bra.s 68d2 <TestZoom4Picture+0x2bee>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    686e:	202f 007e      	move.l 126(sp),d0
    6872:	0680 0000 0080 	addi.l #128,d0
    6878:	d080           	add.l d0,d0
    687a:	2200           	move.l d0,d1
    687c:	7000           	moveq #0,d0
    687e:	302f 01c6      	move.w 454(sp),d0
    6882:	2f01           	move.l d1,-(sp)
    6884:	2f00           	move.l d0,-(sp)
    6886:	2f2f 01d0      	move.l 464(sp),-(sp)
    688a:	2f2f 0056      	move.l 86(sp),-(sp)
    688e:	4eba 02b6      	jsr 6b46 <TestRow>(pc)
    6892:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6896:	722a           	moveq #42,d1
    6898:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    689c:	202f 007e      	move.l 126(sp),d0
    68a0:	d080           	add.l d0,d0
    68a2:	2200           	move.l d0,d1
    68a4:	0681 0000 0101 	addi.l #257,d1
    68aa:	7000           	moveq #0,d0
    68ac:	302f 01c6      	move.w 454(sp),d0
    68b0:	2f01           	move.l d1,-(sp)
    68b2:	2f00           	move.l d0,-(sp)
    68b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    68b8:	2f2f 0056      	move.l 86(sp),-(sp)
    68bc:	4eba 0288      	jsr 6b46 <TestRow>(pc)
    68c0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    68c4:	702a           	moveq #42,d0
    68c6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    68ca:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {
    68ce:	52af 007e      	addq.l #1,126(sp)
    68d2:	7206           	moveq #6,d1
    68d4:	b2af 007e      	cmp.l 126(sp),d1
    68d8:	6c94           	bge.s 686e <TestZoom4Picture+0x2b8a>
  }   

  tmp = source;
    68da:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    68e0:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    68e6:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    68ec:	4878 0001      	pea 1 <_start+0x1>
    68f0:	4878 0011      	pea 11 <_start+0x11>
    68f4:	2f2f 0056      	move.l 86(sp),-(sp)
    68f8:	2f2f 006a      	move.l 106(sp),-(sp)
    68fc:	4eba b196      	jsr 1a94 <Zoom_ZoomIntoPicture>(pc)
    6900:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6904:	2039 004d 2c2c 	move.l 4d2c2c <GfxBase>,d0
    690a:	2c40           	movea.l d0,a6
    690c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6910:	202f 004e      	move.l 78(sp),d0
    6914:	5880           	addq.l #4,d0
    6916:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom18;
    691a:	2f7c 0000 bdb4 	move.l #48564,74(sp)
    6920:	004a 

  mask = 0xffff;
    6922:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);
    6928:	7000           	moveq #0,d0
    692a:	302f 01c6      	move.w 454(sp),d0
    692e:	42a7           	clr.l -(sp)
    6930:	2f00           	move.l d0,-(sp)
    6932:	2f2f 01d0      	move.l 464(sp),-(sp)
    6936:	2f2f 0056      	move.l 86(sp),-(sp)
    693a:	4eba 020a      	jsr 6b46 <TestRow>(pc)
    693e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6942:	722a           	moveq #42,d1
    6944:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    6948:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<4;i2++) {
    694c:	42af 007a      	clr.l 122(sp)
    6950:	605c           	bra.s 69ae <TestZoom4Picture+0x2cca>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    6952:	202f 007a      	move.l 122(sp),d0
    6956:	d080           	add.l d0,d0
    6958:	2200           	move.l d0,d1
    695a:	5281           	addq.l #1,d1
    695c:	7000           	moveq #0,d0
    695e:	302f 01c6      	move.w 454(sp),d0
    6962:	2f01           	move.l d1,-(sp)
    6964:	2f00           	move.l d0,-(sp)
    6966:	2f2f 01d0      	move.l 464(sp),-(sp)
    696a:	2f2f 0056      	move.l 86(sp),-(sp)
    696e:	4eba 01d6      	jsr 6b46 <TestRow>(pc)
    6972:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6976:	702a           	moveq #42,d0
    6978:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    697c:	202f 007a      	move.l 122(sp),d0
    6980:	5280           	addq.l #1,d0
    6982:	d080           	add.l d0,d0
    6984:	2200           	move.l d0,d1
    6986:	7000           	moveq #0,d0
    6988:	302f 01c6      	move.w 454(sp),d0
    698c:	2f01           	move.l d1,-(sp)
    698e:	2f00           	move.l d0,-(sp)
    6990:	2f2f 01d0      	move.l 464(sp),-(sp)
    6994:	2f2f 0056      	move.l 86(sp),-(sp)
    6998:	4eba 01ac      	jsr 6b46 <TestRow>(pc)
    699c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    69a0:	722a           	moveq #42,d1
    69a2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    69a6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    69aa:	52af 007a      	addq.l #1,122(sp)
    69ae:	7003           	moveq #3,d0
    69b0:	b0af 007a      	cmp.l 122(sp),d0
    69b4:	6c9c           	bge.s 6952 <TestZoom4Picture+0x2c6e>
  }

  for(int i=0;i<7;i++) {  
    69b6:	42af 0076      	clr.l 118(sp)
    69ba:	6000 009c      	bra.w 6a58 <TestZoom4Picture+0x2d74>
    for(int i2=0;i2<18;i2++) {
    69be:	42af 0072      	clr.l 114(sp)
    69c2:	6000 0086      	bra.w 6a4a <TestZoom4Picture+0x2d66>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    69c6:	222f 0076      	move.l 118(sp),d1
    69ca:	2001           	move.l d1,d0
    69cc:	e988           	lsl.l #4,d0
    69ce:	d081           	add.l d1,d0
    69d0:	d080           	add.l d0,d0
    69d2:	2040           	movea.l d0,a0
    69d4:	d1c1           	adda.l d1,a0
    69d6:	41e8 000b      	lea 11(a0),a0
    69da:	202f 0072      	move.l 114(sp),d0
    69de:	d080           	add.l d0,d0
    69e0:	2208           	move.l a0,d1
    69e2:	d280           	add.l d0,d1
    69e4:	7000           	moveq #0,d0
    69e6:	302f 01c6      	move.w 454(sp),d0
    69ea:	2f01           	move.l d1,-(sp)
    69ec:	2f00           	move.l d0,-(sp)
    69ee:	2f2f 01d0      	move.l 464(sp),-(sp)
    69f2:	2f2f 0056      	move.l 86(sp),-(sp)
    69f6:	4eba 014e      	jsr 6b46 <TestRow>(pc)
    69fa:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    69fe:	722a           	moveq #42,d1
    6a00:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6a04:	222f 0076      	move.l 118(sp),d1
    6a08:	2001           	move.l d1,d0
    6a0a:	e988           	lsl.l #4,d0
    6a0c:	d081           	add.l d1,d0
    6a0e:	d080           	add.l d0,d0
    6a10:	2040           	movea.l d0,a0
    6a12:	d1c1           	adda.l d1,a0
    6a14:	41e8 000c      	lea 12(a0),a0
    6a18:	202f 0072      	move.l 114(sp),d0
    6a1c:	d080           	add.l d0,d0
    6a1e:	2208           	move.l a0,d1
    6a20:	d280           	add.l d0,d1
    6a22:	7000           	moveq #0,d0
    6a24:	302f 01c6      	move.w 454(sp),d0
    6a28:	2f01           	move.l d1,-(sp)
    6a2a:	2f00           	move.l d0,-(sp)
    6a2c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a30:	2f2f 0056      	move.l 86(sp),-(sp)
    6a34:	4eba 0110      	jsr 6b46 <TestRow>(pc)
    6a38:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6a3c:	702a           	moveq #42,d0
    6a3e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6a42:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) {
    6a46:	52af 0072      	addq.l #1,114(sp)
    6a4a:	7211           	moveq #17,d1
    6a4c:	b2af 0072      	cmp.l 114(sp),d1
    6a50:	6c00 ff74      	bge.w 69c6 <TestZoom4Picture+0x2ce2>
  for(int i=0;i<7;i++) {  
    6a54:	52af 0076      	addq.l #1,118(sp)
    6a58:	7006           	moveq #6,d0
    6a5a:	b0af 0076      	cmp.l 118(sp),d0
    6a5e:	6c00 ff5e      	bge.w 69be <TestZoom4Picture+0x2cda>
    }
  } 

  for(int i2=0;i2<4;i2++) {
    6a62:	42af 006e      	clr.l 110(sp)
    6a66:	6064           	bra.s 6acc <TestZoom4Picture+0x2de8>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6a68:	202f 006e      	move.l 110(sp),d0
    6a6c:	0680 0000 0080 	addi.l #128,d0
    6a72:	d080           	add.l d0,d0
    6a74:	2200           	move.l d0,d1
    6a76:	7000           	moveq #0,d0
    6a78:	302f 01c6      	move.w 454(sp),d0
    6a7c:	2f01           	move.l d1,-(sp)
    6a7e:	2f00           	move.l d0,-(sp)
    6a80:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a84:	2f2f 0056      	move.l 86(sp),-(sp)
    6a88:	4eba 00bc      	jsr 6b46 <TestRow>(pc)
    6a8c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a90:	722a           	moveq #42,d1
    6a92:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6a96:	202f 006e      	move.l 110(sp),d0
    6a9a:	d080           	add.l d0,d0
    6a9c:	2200           	move.l d0,d1
    6a9e:	0681 0000 0101 	addi.l #257,d1
    6aa4:	7000           	moveq #0,d0
    6aa6:	302f 01c6      	move.w 454(sp),d0
    6aaa:	2f01           	move.l d1,-(sp)
    6aac:	2f00           	move.l d0,-(sp)
    6aae:	2f2f 01d0      	move.l 464(sp),-(sp)
    6ab2:	2f2f 0056      	move.l 86(sp),-(sp)
    6ab6:	4eba 008e      	jsr 6b46 <TestRow>(pc)
    6aba:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6abe:	702a           	moveq #42,d0
    6ac0:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6ac4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6ac8:	52af 006e      	addq.l #1,110(sp)
    6acc:	7203           	moveq #3,d1
    6ace:	b2af 006e      	cmp.l 110(sp),d1
    6ad2:	6c94           	bge.s 6a68 <TestZoom4Picture+0x2d84>
  }
  TestRow( valsupposed, valactual, mask, 0);
    6ad4:	7000           	moveq #0,d0
    6ad6:	302f 01c6      	move.w 454(sp),d0
    6ada:	42a7           	clr.l -(sp)
    6adc:	2f00           	move.l d0,-(sp)
    6ade:	2f2f 01d0      	move.l 464(sp),-(sp)
    6ae2:	2f2f 0056      	move.l 86(sp),-(sp)
    6ae6:	4eba 005e      	jsr 6b46 <TestRow>(pc)
    6aea:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6aee:	702a           	moveq #42,d0
    6af0:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6af4:	466f 01c6      	not.w 454(sp)
  FreeMem( source, (ZMLINESIZE+4)*272);
    6af8:	2f6f 005e 0042 	move.l 94(sp),66(sp)
    6afe:	2f7c 0000 30e0 	move.l #12512,62(sp)
    6b04:	003e 
    6b06:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    6b0c:	2c40           	movea.l d0,a6
    6b0e:	226f 0042      	movea.l 66(sp),a1
    6b12:	202f 003e      	move.l 62(sp),d0
    6b16:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    6b1a:	2f6f 004e 003a 	move.l 78(sp),58(sp)
    6b20:	2f7c 0000 30e0 	move.l #12512,54(sp)
    6b26:	0036 
    6b28:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    6b2e:	2c40           	movea.l d0,a6
    6b30:	226f 003a      	movea.l 58(sp),a1
    6b34:	202f 0036      	move.l 54(sp),d0
    6b38:	4eae ff2e      	jsr -210(a6)
}
    6b3c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    6b40:	4fef 01d0      	lea 464(sp),sp
    6b44:	4e75           	rts

00006b46 <TestRow>:

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    6b46:	4fef ff40      	lea -192(sp),sp
    6b4a:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
    6b4e:	202f 00e0      	move.l 224(sp),d0
    6b52:	3000           	move.w d0,d0
    6b54:	3f40 0016      	move.w d0,22(sp)
  
  char str[ 100] = { 0 };
    6b58:	42af 001c      	clr.l 28(sp)
    6b5c:	7020           	moveq #32,d0
    6b5e:	d08f           	add.l sp,d0
    6b60:	7260           	moveq #96,d1
    6b62:	2f01           	move.l d1,-(sp)
    6b64:	42a7           	clr.l -(sp)
    6b66:	2f00           	move.l d0,-(sp)
    6b68:	4eba 020c      	jsr 6d76 <memset>(pc)
    6b6c:	4fef 000c      	lea 12(sp),sp
  UWORD data[2];
  data[1] = numberofline;
    6b70:	202f 00e4      	move.l 228(sp),d0
    6b74:	3f40 001a      	move.w d0,26(sp)

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    6b78:	42af 00d0      	clr.l 208(sp)
    6b7c:	6000 00d4      	bra.w 6c52 <TestRow+0x10c>
    if( (*testpattern++ ^ xormask) != *destination++) {
    6b80:	202f 00d8      	move.l 216(sp),d0
    6b84:	2200           	move.l d0,d1
    6b86:	5481           	addq.l #2,d1
    6b88:	2f41 00d8      	move.l d1,216(sp)
    6b8c:	2040           	movea.l d0,a0
    6b8e:	3010           	move.w (a0),d0
    6b90:	322f 0016      	move.w 22(sp),d1
    6b94:	b141           	eor.w d0,d1
    6b96:	202f 00dc      	move.l 220(sp),d0
    6b9a:	2400           	move.l d0,d2
    6b9c:	5482           	addq.l #2,d2
    6b9e:	2f42 00dc      	move.l d2,220(sp)
    6ba2:	2040           	movea.l d0,a0
    6ba4:	3010           	move.w (a0),d0
    6ba6:	b041           	cmp.w d1,d0
    6ba8:	6700 00a4      	beq.w 6c4e <TestRow+0x108>
      data[0] = i;
    6bac:	202f 00d0      	move.l 208(sp),d0
    6bb0:	3f40 0018      	move.w d0,24(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    6bb4:	2f7c 0000 84f0 	move.l #34032,164(sp)
    6bba:	00a4 
    6bbc:	702b           	moveq #43,d0
    6bbe:	4600           	not.b d0
    6bc0:	d08f           	add.l sp,d0
    6bc2:	0680 ffff ff44 	addi.l #-188,d0
    6bc8:	2f40 00a0      	move.l d0,160(sp)
    6bcc:	2f7c 0000 7214 	move.l #29204,156(sp)
    6bd2:	009c 
    6bd4:	722b           	moveq #43,d1
    6bd6:	4601           	not.b d1
    6bd8:	d28f           	add.l sp,d1
    6bda:	0681 ffff ff48 	addi.l #-184,d1
    6be0:	2f41 0098      	move.l d1,152(sp)
    6be4:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    6bea:	2c40           	movea.l d0,a6
    6bec:	206f 00a4      	movea.l 164(sp),a0
    6bf0:	226f 00a0      	movea.l 160(sp),a1
    6bf4:	246f 009c      	movea.l 156(sp),a2
    6bf8:	266f 0098      	movea.l 152(sp),a3
    6bfc:	4eae fdf6      	jsr -522(a6)
    6c00:	2f40 0094      	move.l d0,148(sp)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    6c04:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    6c0a:	2c40           	movea.l d0,a6
    6c0c:	4eae ffc4      	jsr -60(a6)
    6c10:	2f40 0090      	move.l d0,144(sp)
    6c14:	202f 0090      	move.l 144(sp),d0
    6c18:	2f40 008c      	move.l d0,140(sp)
    6c1c:	742b           	moveq #43,d2
    6c1e:	4602           	not.b d2
    6c20:	d48f           	add.l sp,d2
    6c22:	0682 ffff ff48 	addi.l #-184,d2
    6c28:	2f42 0088      	move.l d2,136(sp)
    6c2c:	7064           	moveq #100,d0
    6c2e:	2f40 0084      	move.l d0,132(sp)
    6c32:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    6c38:	2c40           	movea.l d0,a6
    6c3a:	222f 008c      	move.l 140(sp),d1
    6c3e:	242f 0088      	move.l 136(sp),d2
    6c42:	262f 0084      	move.l 132(sp),d3
    6c46:	4eae ffd0      	jsr -48(a6)
    6c4a:	2f40 0080      	move.l d0,128(sp)
  for(int i=0;i<21;i++) {
    6c4e:	52af 00d0      	addq.l #1,208(sp)
    6c52:	7214           	moveq #20,d1
    6c54:	b2af 00d0      	cmp.l 208(sp),d1
    6c58:	6c00 ff26      	bge.w 6b80 <TestRow+0x3a>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    6c5c:	206f 00d8      	movea.l 216(sp),a0
    6c60:	3010           	move.w (a0),d0
    6c62:	322f 0016      	move.w 22(sp),d1
    6c66:	b141           	eor.w d0,d1
    6c68:	206f 00dc      	movea.l 220(sp),a0
    6c6c:	3010           	move.w (a0),d0
    6c6e:	b340           	eor.w d1,d0
    6c70:	3000           	move.w d0,d0
    6c72:	0280 0000 ffff 	andi.l #65535,d0
    6c78:	0280 0000 ff00 	andi.l #65280,d0
    6c7e:	6700 00cc      	beq.w 6d4c <TestRow+0x206>
    data[0] = 21;
    6c82:	3f7c 0015 0018 	move.w #21,24(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    6c88:	2f7c 0000 84f0 	move.l #34032,204(sp)
    6c8e:	00cc 
    6c90:	742b           	moveq #43,d2
    6c92:	4602           	not.b d2
    6c94:	d48f           	add.l sp,d2
    6c96:	0682 ffff ff44 	addi.l #-188,d2
    6c9c:	2f42 00c8      	move.l d2,200(sp)
    6ca0:	2f7c 0000 7214 	move.l #29204,196(sp)
    6ca6:	00c4 
    6ca8:	702b           	moveq #43,d0
    6caa:	4600           	not.b d0
    6cac:	d08f           	add.l sp,d0
    6cae:	0680 ffff ff48 	addi.l #-184,d0
    6cb4:	2f40 00c0      	move.l d0,192(sp)
    6cb8:	2039 004d 2c20 	move.l 4d2c20 <SysBase>,d0
    6cbe:	2c40           	movea.l d0,a6
    6cc0:	206f 00cc      	movea.l 204(sp),a0
    6cc4:	226f 00c8      	movea.l 200(sp),a1
    6cc8:	246f 00c4      	movea.l 196(sp),a2
    6ccc:	266f 00c0      	movea.l 192(sp),a3
    6cd0:	4eae fdf6      	jsr -522(a6)
    6cd4:	2f40 00bc      	move.l d0,188(sp)
                                                                           str);
    Write(  Output(), str, 100);
    6cd8:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    6cde:	2c40           	movea.l d0,a6
    6ce0:	4eae ffc4      	jsr -60(a6)
    6ce4:	2f40 00b8      	move.l d0,184(sp)
    6ce8:	202f 00b8      	move.l 184(sp),d0
    6cec:	2f40 00b4      	move.l d0,180(sp)
    6cf0:	722b           	moveq #43,d1
    6cf2:	4601           	not.b d1
    6cf4:	d28f           	add.l sp,d1
    6cf6:	0681 ffff ff48 	addi.l #-184,d1
    6cfc:	2f41 00b0      	move.l d1,176(sp)
    6d00:	7464           	moveq #100,d2
    6d02:	2f42 00ac      	move.l d2,172(sp)
    6d06:	2039 004d 2c28 	move.l 4d2c28 <DOSBase>,d0
    6d0c:	2c40           	movea.l d0,a6
    6d0e:	222f 00b4      	move.l 180(sp),d1
    6d12:	242f 00b0      	move.l 176(sp),d2
    6d16:	262f 00ac      	move.l 172(sp),d3
    6d1a:	4eae ffd0      	jsr -48(a6)
    6d1e:	2f40 00a8      	move.l d0,168(sp)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
    6d22:	206f 00dc      	movea.l 220(sp),a0
    6d26:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6d28:	7200           	moveq #0,d1
    6d2a:	3200           	move.w d0,d1
                                                   *testpattern,*destination);
    6d2c:	206f 00d8      	movea.l 216(sp),a0
    6d30:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6d32:	3000           	move.w d0,d0
    6d34:	0280 0000 ffff 	andi.l #65535,d0
    6d3a:	2f01           	move.l d1,-(sp)
    6d3c:	2f00           	move.l d0,-(sp)
    6d3e:	4879 0000 8520 	pea 8520 <rundemo.c.95627ee6+0x154>
    6d44:	4eba 0162      	jsr 6ea8 <KPrintF>(pc)
    6d48:	4fef 000c      	lea 12(sp),sp
     
  }
}
    6d4c:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    6d50:	4fef 00c0      	lea 192(sp),sp
    6d54:	4e75           	rts

00006d56 <strlen>:
{
    6d56:	598f           	subq.l #4,sp
	unsigned long t=0;
    6d58:	4297           	clr.l (sp)
    6d5a:	6002           	bra.s 6d5e <strlen+0x8>
		t++;
    6d5c:	5297           	addq.l #1,(sp)
	while(*s++)
    6d5e:	202f 0008      	move.l 8(sp),d0
    6d62:	2200           	move.l d0,d1
    6d64:	5281           	addq.l #1,d1
    6d66:	2f41 0008      	move.l d1,8(sp)
    6d6a:	2040           	movea.l d0,a0
    6d6c:	1010           	move.b (a0),d0
    6d6e:	66ec           	bne.s 6d5c <strlen+0x6>
	return t;
    6d70:	2017           	move.l (sp),d0
}
    6d72:	588f           	addq.l #4,sp
    6d74:	4e75           	rts

00006d76 <memset>:
{
    6d76:	4e55 fffc      	link.w a5,#-4
	unsigned char *ptr = (unsigned char *)dest;
    6d7a:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
    6d80:	6014           	bra.s 6d96 <memset+0x20>
		*ptr++ = val;
    6d82:	202d fffc      	move.l -4(a5),d0
    6d86:	2200           	move.l d0,d1
    6d88:	5281           	addq.l #1,d1
    6d8a:	2b41 fffc      	move.l d1,-4(a5)
    6d8e:	222d 000c      	move.l 12(a5),d1
    6d92:	2040           	movea.l d0,a0
    6d94:	1081           	move.b d1,(a0)
	while(len-- > 0)
    6d96:	202d 0010      	move.l 16(a5),d0
    6d9a:	2200           	move.l d0,d1
    6d9c:	5381           	subq.l #1,d1
    6d9e:	2b41 0010      	move.l d1,16(a5)
    6da2:	4a80           	tst.l d0
    6da4:	66dc           	bne.s 6d82 <memset+0xc>
	return dest;
    6da6:	202d 0008      	move.l 8(a5),d0
}
    6daa:	4e5d           	unlk a5
    6dac:	4e75           	rts

00006dae <memcpy>:
{
    6dae:	4e55 fff8      	link.w a5,#-8
    6db2:	2f02           	move.l d2,-(sp)
	char *d = (char *)dest;
    6db4:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = (const char *)src;
    6dba:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
    6dc0:	6020           	bra.s 6de2 <memcpy+0x34>
		*d++ = *s++;
    6dc2:	222d fff8      	move.l -8(a5),d1
    6dc6:	2001           	move.l d1,d0
    6dc8:	5280           	addq.l #1,d0
    6dca:	2b40 fff8      	move.l d0,-8(a5)
    6dce:	202d fffc      	move.l -4(a5),d0
    6dd2:	2400           	move.l d0,d2
    6dd4:	5282           	addq.l #1,d2
    6dd6:	2b42 fffc      	move.l d2,-4(a5)
    6dda:	2041           	movea.l d1,a0
    6ddc:	1210           	move.b (a0),d1
    6dde:	2040           	movea.l d0,a0
    6de0:	1081           	move.b d1,(a0)
	while(len--)
    6de2:	202d 0010      	move.l 16(a5),d0
    6de6:	2200           	move.l d0,d1
    6de8:	5381           	subq.l #1,d1
    6dea:	2b41 0010      	move.l d1,16(a5)
    6dee:	4a80           	tst.l d0
    6df0:	66d0           	bne.s 6dc2 <memcpy+0x14>
	return dest;
    6df2:	202d 0008      	move.l 8(a5),d0
}
    6df6:	241f           	move.l (sp)+,d2
    6df8:	4e5d           	unlk a5
    6dfa:	4e75           	rts

00006dfc <memmove>:
{
    6dfc:	4e55 fff0      	link.w a5,#-16
    6e00:	2f02           	move.l d2,-(sp)
	char *d = dest;
    6e02:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = src;
    6e08:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
	if (d < s) {
    6e0e:	202d fffc      	move.l -4(a5),d0
    6e12:	b0ad fff8      	cmp.l -8(a5),d0
    6e16:	6522           	bcs.s 6e3a <memmove+0x3e>
    6e18:	6032           	bra.s 6e4c <memmove+0x50>
			*d++ = *s++;
    6e1a:	222d fff8      	move.l -8(a5),d1
    6e1e:	2401           	move.l d1,d2
    6e20:	5282           	addq.l #1,d2
    6e22:	2b42 fff8      	move.l d2,-8(a5)
    6e26:	202d fffc      	move.l -4(a5),d0
    6e2a:	2400           	move.l d0,d2
    6e2c:	5282           	addq.l #1,d2
    6e2e:	2b42 fffc      	move.l d2,-4(a5)
    6e32:	2041           	movea.l d1,a0
    6e34:	1210           	move.b (a0),d1
    6e36:	2040           	movea.l d0,a0
    6e38:	1081           	move.b d1,(a0)
		while (len--)
    6e3a:	202d 0010      	move.l 16(a5),d0
    6e3e:	2200           	move.l d0,d1
    6e40:	5381           	subq.l #1,d1
    6e42:	2b41 0010      	move.l d1,16(a5)
    6e46:	4a80           	tst.l d0
    6e48:	66d0           	bne.s 6e1a <memmove+0x1e>
    6e4a:	6052           	bra.s 6e9e <memmove+0xa2>
		const char *lasts = s + (len - 1);
    6e4c:	202d 0010      	move.l 16(a5),d0
    6e50:	5380           	subq.l #1,d0
    6e52:	242d fff8      	move.l -8(a5),d2
    6e56:	d480           	add.l d0,d2
    6e58:	2b42 fff4      	move.l d2,-12(a5)
		char *lastd = d + (len - 1);
    6e5c:	202d 0010      	move.l 16(a5),d0
    6e60:	5380           	subq.l #1,d0
    6e62:	222d fffc      	move.l -4(a5),d1
    6e66:	d280           	add.l d0,d1
    6e68:	2b41 fff0      	move.l d1,-16(a5)
    6e6c:	6020           	bra.s 6e8e <memmove+0x92>
			*lastd-- = *lasts--;
    6e6e:	222d fff4      	move.l -12(a5),d1
    6e72:	2401           	move.l d1,d2
    6e74:	5382           	subq.l #1,d2
    6e76:	2b42 fff4      	move.l d2,-12(a5)
    6e7a:	202d fff0      	move.l -16(a5),d0
    6e7e:	2400           	move.l d0,d2
    6e80:	5382           	subq.l #1,d2
    6e82:	2b42 fff0      	move.l d2,-16(a5)
    6e86:	2041           	movea.l d1,a0
    6e88:	1210           	move.b (a0),d1
    6e8a:	2040           	movea.l d0,a0
    6e8c:	1081           	move.b d1,(a0)
		while (len--)
    6e8e:	202d 0010      	move.l 16(a5),d0
    6e92:	2200           	move.l d0,d1
    6e94:	5381           	subq.l #1,d1
    6e96:	2b41 0010      	move.l d1,16(a5)
    6e9a:	4a80           	tst.l d0
    6e9c:	66d0           	bne.s 6e6e <memmove+0x72>
	return dest;
    6e9e:	202d 0008      	move.l 8(a5),d0
}
    6ea2:	241f           	move.l (sp)+,d2
    6ea4:	4e5d           	unlk a5
    6ea6:	4e75           	rts

00006ea8 <KPrintF>:
{
    6ea8:	4fef ff80      	lea -128(sp),sp
    6eac:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    6eb0:	3039 00f0 ff60 	move.w f0ff60 <_end+0xa3d2ec>,d0
    6eb6:	0c40 4eb9      	cmpi.w #20153,d0
    6eba:	6722           	beq.s 6ede <KPrintF+0x36>
    6ebc:	0c40 a00e      	cmpi.w #-24562,d0
    6ec0:	671c           	beq.s 6ede <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    6ec2:	2c79 004d 2c20 	movea.l 4d2c20 <SysBase>,a6
    6ec8:	206f 0090      	movea.l 144(sp),a0
    6ecc:	43ef 0094      	lea 148(sp),a1
    6ed0:	45f9 0000 7206 	lea 7206 <KPutCharX>,a2
    6ed6:	97cb           	suba.l a3,a3
    6ed8:	4eae fdf6      	jsr -522(a6)
    6edc:	602a           	bra.s 6f08 <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    6ede:	2c79 004d 2c20 	movea.l 4d2c20 <SysBase>,a6
    6ee4:	206f 0090      	movea.l 144(sp),a0
    6ee8:	43ef 0094      	lea 148(sp),a1
    6eec:	45f9 0000 7214 	lea 7214 <PutChar>,a2
    6ef2:	47ef 000c      	lea 12(sp),a3
    6ef6:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    6efa:	2f0b           	move.l a3,-(sp)
    6efc:	4878 0056      	pea 56 <_start+0x56>
    6f00:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xa3d2ec>
    6f06:	508f           	addq.l #8,sp
}
    6f08:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    6f0c:	4fef 0080      	lea 128(sp),sp
    6f10:	4e75           	rts

00006f12 <warpmode>:

void warpmode(int on) // bool
{
    6f12:	518f           	subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
    6f14:	2f7c 00f0 ff60 	move.l #15794016,4(sp)
    6f1a:	0004 
    if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
    6f1c:	206f 0004      	movea.l 4(sp),a0
    6f20:	3010           	move.w (a0),d0
    6f22:	0c40 4eb9      	cmpi.w #20153,d0
    6f26:	670c           	beq.s 6f34 <warpmode+0x22>
    6f28:	206f 0004      	movea.l 4(sp),a0
    6f2c:	3010           	move.w (a0),d0
    6f2e:	0c40 a00e      	cmpi.w #-24562,d0
    6f32:	6668           	bne.s 6f9c <warpmode+0x8a>
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    6f34:	4aaf 000c      	tst.l 12(sp)
    6f38:	6708           	beq.s 6f42 <warpmode+0x30>
    6f3a:	203c 0000 8546 	move.l #34118,d0
    6f40:	6006           	bra.s 6f48 <warpmode+0x36>
    6f42:	203c 0000 8550 	move.l #34128,d0
    6f48:	4878 0001      	pea 1 <_start+0x1>
    6f4c:	220f           	move.l sp,d1
    6f4e:	5e81           	addq.l #7,d1
    6f50:	2f01           	move.l d1,-(sp)
    6f52:	42a7           	clr.l -(sp)
    6f54:	2f00           	move.l d0,-(sp)
    6f56:	4878 ffff      	pea ffffffff <_end+0xffb2d38b>
    6f5a:	4878 0052      	pea 52 <_start+0x52>
    6f5e:	206f 001c      	movea.l 28(sp),a0
    6f62:	4e90           	jsr (a0)
    6f64:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    6f68:	4aaf 000c      	tst.l 12(sp)
    6f6c:	6708           	beq.s 6f76 <warpmode+0x64>
    6f6e:	203c 0000 855b 	move.l #34139,d0
    6f74:	6006           	bra.s 6f7c <warpmode+0x6a>
    6f76:	203c 0000 8575 	move.l #34165,d0
    6f7c:	4878 0001      	pea 1 <_start+0x1>
    6f80:	220f           	move.l sp,d1
    6f82:	5e81           	addq.l #7,d1
    6f84:	2f01           	move.l d1,-(sp)
    6f86:	42a7           	clr.l -(sp)
    6f88:	2f00           	move.l d0,-(sp)
    6f8a:	4878 ffff      	pea ffffffff <_end+0xffb2d38b>
    6f8e:	4878 0052      	pea 52 <_start+0x52>
    6f92:	206f 001c      	movea.l 28(sp),a0
    6f96:	4e90           	jsr (a0)
    6f98:	4fef 0018      	lea 24(sp),sp
	}
}
    6f9c:	508f           	addq.l #8,sp
    6f9e:	4e75           	rts

00006fa0 <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4)
{
    6fa0:	598f           	subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
    6fa2:	2ebc 00f0 ff60 	move.l #15794016,(sp)
    if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    6fa8:	2057           	movea.l (sp),a0
    6faa:	3010           	move.w (a0),d0
    6fac:	0c40 4eb9      	cmpi.w #20153,d0
    6fb0:	670a           	beq.s 6fbc <debug_cmd+0x1c>
    6fb2:	2057           	movea.l (sp),a0
    6fb4:	3010           	move.w (a0),d0
    6fb6:	0c40 a00e      	cmpi.w #-24562,d0
    6fba:	661e           	bne.s 6fda <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
    6fbc:	2f2f 0014      	move.l 20(sp),-(sp)
    6fc0:	2f2f 0014      	move.l 20(sp),-(sp)
    6fc4:	2f2f 0014      	move.l 20(sp),-(sp)
    6fc8:	2f2f 0014      	move.l 20(sp),-(sp)
    6fcc:	4878 0058      	pea 58 <_start+0x58>
    6fd0:	206f 0014      	movea.l 20(sp),a0
    6fd4:	4e90           	jsr (a0)
    6fd6:	4fef 0014      	lea 20(sp),sp
	}
}
    6fda:	588f           	addq.l #4,sp
    6fdc:	4e75           	rts

00006fde <debug_clear>:
	barto_cmd_text,
};

void debug_clear()
{
	debug_cmd(barto_cmd_clear, 0, 0, 0);
    6fde:	42a7           	clr.l -(sp)
    6fe0:	42a7           	clr.l -(sp)
    6fe2:	42a7           	clr.l -(sp)
    6fe4:	42a7           	clr.l -(sp)
    6fe6:	4eba ffb8      	jsr 6fa0 <debug_cmd>(pc)
    6fea:	4fef 0010      	lea 16(sp),sp
}
    6fee:	4e75           	rts

00006ff0 <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color)
{
    6ff0:	518f           	subq.l #8,sp
    6ff2:	2f02           	move.l d2,-(sp)
    6ff4:	226f 0010      	movea.l 16(sp),a1
    6ff8:	206f 0014      	movea.l 20(sp),a0
    6ffc:	222f 0018      	move.l 24(sp),d1
    7000:	202f 001c      	move.l 28(sp),d0
    7004:	3249           	movea.w a1,a1
    7006:	3f49 000a      	move.w a1,10(sp)
    700a:	3048           	movea.w a0,a0
    700c:	3f48 0008      	move.w a0,8(sp)
    7010:	3201           	move.w d1,d1
    7012:	3f41 0006      	move.w d1,6(sp)
    7016:	3000           	move.w d0,d0
    7018:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    701c:	302f 0006      	move.w 6(sp),d0
    7020:	48c0           	ext.l d0
    7022:	4840           	swap d0
    7024:	4240           	clr.w d0
    7026:	322f 0004      	move.w 4(sp),d1
    702a:	48c1           	ext.l d1
    702c:	8280           	or.l d0,d1
    702e:	302f 000a      	move.w 10(sp),d0
    7032:	48c0           	ext.l d0
    7034:	4840           	swap d0
    7036:	4240           	clr.w d0
    7038:	306f 0008      	movea.w 8(sp),a0
    703c:	2408           	move.l a0,d2
    703e:	8082           	or.l d2,d0
    7040:	2f2f 0020      	move.l 32(sp),-(sp)
    7044:	2f01           	move.l d1,-(sp)
    7046:	2f00           	move.l d0,-(sp)
    7048:	4878 0001      	pea 1 <_start+0x1>
    704c:	4eba ff52      	jsr 6fa0 <debug_cmd>(pc)
    7050:	4fef 0010      	lea 16(sp),sp
}
    7054:	241f           	move.l (sp)+,d2
    7056:	508f           	addq.l #8,sp
    7058:	4e75           	rts

0000705a <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color)
{
    705a:	518f           	subq.l #8,sp
    705c:	2f02           	move.l d2,-(sp)
    705e:	226f 0010      	movea.l 16(sp),a1
    7062:	206f 0014      	movea.l 20(sp),a0
    7066:	222f 0018      	move.l 24(sp),d1
    706a:	202f 001c      	move.l 28(sp),d0
    706e:	3249           	movea.w a1,a1
    7070:	3f49 000a      	move.w a1,10(sp)
    7074:	3048           	movea.w a0,a0
    7076:	3f48 0008      	move.w a0,8(sp)
    707a:	3201           	move.w d1,d1
    707c:	3f41 0006      	move.w d1,6(sp)
    7080:	3000           	move.w d0,d0
    7082:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    7086:	302f 0006      	move.w 6(sp),d0
    708a:	48c0           	ext.l d0
    708c:	4840           	swap d0
    708e:	4240           	clr.w d0
    7090:	322f 0004      	move.w 4(sp),d1
    7094:	48c1           	ext.l d1
    7096:	8280           	or.l d0,d1
    7098:	302f 000a      	move.w 10(sp),d0
    709c:	48c0           	ext.l d0
    709e:	4840           	swap d0
    70a0:	4240           	clr.w d0
    70a2:	306f 0008      	movea.w 8(sp),a0
    70a6:	2408           	move.l a0,d2
    70a8:	8082           	or.l d2,d0
    70aa:	2f2f 0020      	move.l 32(sp),-(sp)
    70ae:	2f01           	move.l d1,-(sp)
    70b0:	2f00           	move.l d0,-(sp)
    70b2:	4878 0002      	pea 2 <_start+0x2>
    70b6:	4eba fee8      	jsr 6fa0 <debug_cmd>(pc)
    70ba:	4fef 0010      	lea 16(sp),sp
}
    70be:	241f           	move.l (sp)+,d2
    70c0:	508f           	addq.l #8,sp
    70c2:	4e75           	rts

000070c4 <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color)
{
    70c4:	598f           	subq.l #4,sp
    70c6:	2f02           	move.l d2,-(sp)
    70c8:	222f 000c      	move.l 12(sp),d1
    70cc:	202f 0010      	move.l 16(sp),d0
    70d0:	3201           	move.w d1,d1
    70d2:	3f41 0006      	move.w d1,6(sp)
    70d6:	3000           	move.w d0,d0
    70d8:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
    70dc:	202f 0014      	move.l 20(sp),d0
    70e0:	322f 0006      	move.w 6(sp),d1
    70e4:	48c1           	ext.l d1
    70e6:	4841           	swap d1
    70e8:	4241           	clr.w d1
    70ea:	306f 0004      	movea.w 4(sp),a0
    70ee:	2408           	move.l a0,d2
    70f0:	8282           	or.l d2,d1
    70f2:	2f2f 0018      	move.l 24(sp),-(sp)
    70f6:	2f00           	move.l d0,-(sp)
    70f8:	2f01           	move.l d1,-(sp)
    70fa:	4878 0003      	pea 3 <_start+0x3>
    70fe:	4eba fea0      	jsr 6fa0 <debug_cmd>(pc)
    7102:	4fef 0010      	lea 16(sp),sp
}
    7106:	241f           	move.l (sp)+,d2
    7108:	588f           	addq.l #4,sp
    710a:	4e75           	rts

0000710c <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    710c:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    7110:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    7114:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    7118:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    711c:	d041           	add.w d1,d0
	swap	d0
    711e:	4840           	swap d0
	clrw	d0
    7120:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    7122:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    7126:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    712a:	d081           	add.l d1,d0
	rts
    712c:	4e75           	rts

0000712e <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    712e:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    7130:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    7134:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    7138:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    713e:	6416           	bcc.s 7156 <__udivsi3+0x28>
	movel	d0, d2
    7140:	2400           	move.l d0,d2
	clrw	d2
    7142:	4242           	clr.w d2
	swap	d2
    7144:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    7146:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    7148:	3002           	move.w d2,d0
	swap	d0
    714a:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    714c:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    7150:	84c1           	divu.w d1,d2
	movew	d2, d0
    7152:	3002           	move.w d2,d0
	jra	6f
    7154:	6030           	bra.s 7186 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    7156:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    7158:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    715a:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    715c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    7162:	64f4           	bcc.s 7158 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    7164:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    7166:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    716c:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    716e:	c2c0           	mulu.w d0,d1
	swap	d2
    7170:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    7172:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    7174:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    7176:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    7178:	660a           	bne.s 7184 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    717a:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    717c:	6506           	bcs.s 7184 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    717e:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    7182:	6302           	bls.s 7186 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    7184:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    7186:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    7188:	4e75           	rts

0000718a <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    718a:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    718c:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    718e:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    7192:	6a04           	bpl.s 7198 <__divsi3+0xe>
	negl	d1
    7194:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    7196:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    7198:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    719c:	6a04           	bpl.s 71a2 <__divsi3+0x18>
	negl	d0
    719e:	4480           	neg.l d0
	negb	d2
    71a0:	4402           	neg.b d2

2:	movel	d1, sp@-
    71a2:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    71a4:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    71a6:	6186           	bsr.s 712e <__udivsi3>
	addql	IMM (8), sp
    71a8:	508f           	addq.l #8,sp

	tstb	d2
    71aa:	4a02           	tst.b d2
	jpl	3f
    71ac:	6a02           	bpl.s 71b0 <__divsi3+0x26>
	negl	d0
    71ae:	4480           	neg.l d0

3:	movel	sp@+, d2
    71b0:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    71b2:	4e75           	rts

000071b4 <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    71b4:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    71b8:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    71bc:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    71be:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    71c0:	61c8           	bsr.s 718a <__divsi3>
	addql	IMM (8), sp
    71c2:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    71c4:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    71c8:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    71ca:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    71cc:	6100 ff3e      	bsr.w 710c <__mulsi3>
	addql	IMM (8), sp
    71d0:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    71d2:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    71d6:	9280           	sub.l d0,d1
	movel	d1, d0
    71d8:	2001           	move.l d1,d0
	rts
    71da:	4e75           	rts

000071dc <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    71dc:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    71e0:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    71e4:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    71e6:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    71e8:	6100 ff44      	bsr.w 712e <__udivsi3>
	addql	IMM (8), sp
    71ec:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    71ee:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    71f2:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    71f4:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    71f6:	6100 ff14      	bsr.w 710c <__mulsi3>
	addql	IMM (8), sp
    71fa:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    71fc:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    7200:	9280           	sub.l d0,d1
	movel	d1, d0
    7202:	2001           	move.l d1,d0
	rts
    7204:	4e75           	rts

00007206 <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    7206:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    7208:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    720c:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    7210:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    7212:	4e75           	rts

00007214 <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    7214:	16c0           	move.b d0,(a3)+
	rts
    7216:	4e75           	rts

00007218 <c2p1x1_8_c5_gen_init>:
	.text
	FUNC(c2p1x1_8_c5_gen_init)
	.globl	SYM (c2p1x1_8_c5_gen_init)

SYM(c2p1x1_8_c5_gen_init):
	movem.l d0-d7/a0-a6, .gi_saveregs	
    7218:	48f9 7fff 0000 	movem.l d0-a6,7258 <.gi_saveregs>
    721e:	7258 
	move.l  4(sp),d0
    7220:	202f 0004      	move.l 4(sp),d0
	move.l	8(sp),d1
    7224:	222f 0008      	move.l 8(sp),d1
	move.l	12(sp),d2
    7228:	242f 000c      	move.l 12(sp),d2
	move.l	16(sp),d3
    722c:	262f 0010      	move.l 16(sp),d3
	move.l  20(sp),d4
    7230:	282f 0014      	move.l 20(sp),d4
	move.l	24(sp),d5
    7234:	2a2f 0018      	move.l 24(sp),d5
	andi.l	IMM (0xffff),d0
    7238:	0280 0000 ffff 	andi.l #65535,d0
	mulu.w	d0,d3
    723e:	c6c0           	mulu.w d0,d3
	lsr.l	#3,d3
    7240:	e68b           	lsr.l #3,d3
	move.l	d3,c2p1x1_8_c5_gen_scroffs
    7242:	23c3 0000 75ae 	move.l d3,75ae <c2p1x1_8_c5_gen_scroffs>
	mulu.w	d0,d1
    7248:	c2c0           	mulu.w d0,d1
	move.l	d1,c2p1x1_8_c5_gen_pixels
    724a:	23c1 0000 75b2 	move.l d1,75b2 <c2p1x1_8_c5_gen_pixels>
	movem.l	.gi_saveregs,d0-d7/a0-a6
    7250:	4cfa 7fff 0004 	movem.l 7258 <.gi_saveregs>(pc),d0-a6
	rts
    7256:	4e75           	rts

00007258 <.gi_saveregs>:
	...

00007294 <c2p1x1_8_c5_gen>:
	.text
	FUNC(c2p1x1_8_c5_gen)
	.globl	SYM (c2p1x1_8_c5_gen)

SYM(c2p1x1_8_c5_gen):
	movem.l d0-d7/a0-a6,.c2p_saveregs	
    7294:	48f9 7fff 0000 	movem.l d0-a6,7572 <.c2p_saveregs>
    729a:	7572 
	movem.l 4(sp),a0
    729c:	4cef 0100 0004 	movem.l 4(sp),a0
	movem.l 8(sp),a1
    72a2:	4cef 0200 0008 	movem.l 8(sp),a1
    move.l	IMM (0x33333333),d5
    72a8:	2a3c 3333 3333 	move.l #858993459,d5
	move.l	IMM (0x55555555),a6
    72ae:	2c7c 5555 5555 	movea.l #1431655765,a6

	add.w	#BPLSIZE,a1
    72b4:	d2fc 2bf8      	adda.w #11256,a1
	add.l	c2p1x1_8_c5_gen_scroffs,a1
    72b8:	d3fa 02f4      	adda.l 75ae <c2p1x1_8_c5_gen_scroffs>(pc),a1

	move.l	c2p1x1_8_c5_gen_pixels,a2
    72bc:	247a 02f4      	movea.l 75b2 <c2p1x1_8_c5_gen_pixels>(pc),a2
	add.l	a0,a2
    72c0:	d5c8           	adda.l a0,a2
	cmp.l	a0,a2
    72c2:	b5c8           	cmpa.l a0,a2
	beq	.none
    72c4:	6700 02a4      	beq.w 756a <.none>

	movem.l	a0-a1,-(sp)
    72c8:	48e7 00c0      	movem.l a0-a1,-(sp)

	move.l	(a0)+,d0
    72cc:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    72ce:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    72d0:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    72d2:	2618           	move.l (a0)+,d3

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    72d4:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    72da:	c084           	and.l d4,d0
	and.l	d4,d1
    72dc:	c284           	and.l d4,d1
	and.l	d4,d2
    72de:	c484           	and.l d4,d2
	and.l	d4,d3
    72e0:	c684           	and.l d4,d3
	lsl.l	#4,d0
    72e2:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    72e4:	e989           	lsl.l #4,d1
	or.l	d2,d0
    72e6:	8082           	or.l d2,d0
	or.l	d3,d1
    72e8:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    72ea:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    72ec:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    72ee:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    72f0:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    72f2:	c484           	and.l d4,d2
	and.l	d4,d6
    72f4:	cc84           	and.l d4,d6
	and.l	d4,d3
    72f6:	c684           	and.l d4,d3
	and.l	d4,d7
    72f8:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    72fa:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    72fc:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    72fe:	8486           	or.l d6,d2
	or.l	d7,d3
    7300:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    7302:	3c02           	move.w d2,d6
	move.w	d3,d7
    7304:	3e03           	move.w d3,d7
	move.w	d0,d2
    7306:	3400           	move.w d0,d2
	move.w	d1,d3
    7308:	3601           	move.w d1,d3
	swap	d2
    730a:	4842           	swap d2
	swap	d3
    730c:	4843           	swap d3
	move.w	d2,d0
    730e:	3002           	move.w d2,d0
	move.w	d3,d1
    7310:	3203           	move.w d3,d1
	move.w	d6,d2
    7312:	3406           	move.w d6,d2
	move.w	d7,d3
    7314:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    7316:	2c02           	move.l d2,d6
	move.l	d3,d7
    7318:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    731a:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    731c:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    731e:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7320:	b387           	eor.l d1,d7
	and.l	d5,d6
    7322:	cc85           	and.l d5,d6
	and.l	d5,d7
    7324:	ce85           	and.l d5,d7
	eor.l	d6,d0
    7326:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7328:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    732a:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    732c:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    732e:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7330:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    7332:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7338:	2c01           	move.l d1,d6
	move.l	d3,d7
    733a:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    733c:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    733e:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7340:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7342:	b587           	eor.l d2,d7
	bra	.start1
    7344:	6000 0088      	bra.w 73ce <.start1>

00007348 <.x1>:
.x1:
	move.l	(a0)+,d0
    7348:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    734a:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    734c:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    734e:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    7350:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    7354:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    735a:	c084           	and.l d4,d0
	and.l	d4,d1
    735c:	c284           	and.l d4,d1
	and.l	d4,d2
    735e:	c484           	and.l d4,d2
	and.l	d4,d3
    7360:	c684           	and.l d4,d3
	lsl.l	#4,d0
    7362:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    7364:	e989           	lsl.l #4,d1
	or.l	d2,d0
    7366:	8082           	or.l d2,d0
	or.l	d3,d1
    7368:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    736a:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    736c:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    736e:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7370:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    7372:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    7376:	c484           	and.l d4,d2
	and.l	d4,d6
    7378:	cc84           	and.l d4,d6
	and.l	d4,d3
    737a:	c684           	and.l d4,d3
	and.l	d4,d7
    737c:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    737e:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    7380:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    7382:	8486           	or.l d6,d2
	or.l	d7,d3
    7384:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    7386:	3c02           	move.w d2,d6
	move.w	d3,d7
    7388:	3e03           	move.w d3,d7
	move.w	d0,d2
    738a:	3400           	move.w d0,d2
	move.w	d1,d3
    738c:	3601           	move.w d1,d3
	swap	d2
    738e:	4842           	swap d2
	swap	d3
    7390:	4843           	swap d3
	move.w	d2,d0
    7392:	3002           	move.w d2,d0
	move.w	d3,d1
    7394:	3203           	move.w d3,d1
	move.w	d6,d2
    7396:	3406           	move.w d6,d2
	move.w	d7,d3
    7398:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    739a:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    739e:	2c02           	move.l d2,d6
	move.l	d3,d7
    73a0:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    73a2:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    73a4:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    73a6:	b186           	eor.l d0,d6
	eor.l	d1,d7
    73a8:	b387           	eor.l d1,d7
	and.l	d5,d6
    73aa:	cc85           	and.l d5,d6
	and.l	d5,d7
    73ac:	ce85           	and.l d5,d7
	eor.l	d6,d0
    73ae:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    73b0:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    73b2:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    73b4:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    73b6:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    73b8:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    73ba:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    73c0:	2c01           	move.l d1,d6
	move.l	d3,d7
    73c2:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    73c4:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    73c6:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    73c8:	b186           	eor.l d0,d6
	eor.l	d2,d7
    73ca:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    73cc:	22cd           	move.l a5,(a1)+

000073ce <.start1>:
.start1:
	and.l	d4,d6
    73ce:	cc84           	and.l d4,d6
	and.l	d4,d7
    73d0:	ce84           	and.l d4,d7
	eor.l	d6,d0
    73d2:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    73d4:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    73d6:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    73d8:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    73da:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    73dc:	bf83           	eor.l d7,d3

	move.l	a6,d4
    73de:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    73e0:	2c01           	move.l d1,d6
	move.l	d3,d7
    73e2:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    73e4:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    73e6:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    73e8:	b186           	eor.l d0,d6
	eor.l	d2,d7
    73ea:	b587           	eor.l d2,d7
	and.l	d4,d6
    73ec:	cc84           	and.l d4,d6
	and.l	d4,d7
    73ee:	ce84           	and.l d4,d7
	eor.l	d6,d0
    73f0:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    73f2:	bf82           	eor.l d7,d2
	add.l	d6,d6
    73f4:	dc86           	add.l d6,d6
	add.l	d7,d7
    73f6:	de87           	add.l d7,d7
	eor.l	d1,d6
    73f8:	b386           	eor.l d1,d6
	eor.l	d3,d7
    73fa:	b787           	eor.l d3,d7

	move.l	d0,a4
    73fc:	2840           	movea.l d0,a4
	move.l	d2,a5
    73fe:	2a42           	movea.l d2,a5
	move.l	d6,a3
    7400:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    7402:	b5c8           	cmpa.l a0,a2
	bne	.x1
    7404:	6600 ff42      	bne.w 7348 <.x1>
	move.l	d7,-BPLSIZE(a1)
    7408:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    740c:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    7410:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    7414:	22cd           	move.l a5,(a1)+

	movem.l	(sp)+,a0-a1
    7416:	4cdf 0300      	movem.l (sp)+,a0-a1
	add.l	#BPLSIZE*4,a1
    741a:	d3fc 0000 afe0 	adda.l #45024,a1

	move.l	(a0)+,d0
    7420:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    7422:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7424:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    7426:	2618           	move.l (a0)+,d3

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    7428:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    742e:	c084           	and.l d4,d0
	and.l	d4,d1
    7430:	c284           	and.l d4,d1
	and.l	d4,d2
    7432:	c484           	and.l d4,d2
	and.l	d4,d3
    7434:	c684           	and.l d4,d3
	lsr.l	#4,d2
    7436:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    7438:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    743a:	8082           	or.l d2,d0
	or.l	d3,d1
    743c:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    743e:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7440:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    7442:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7444:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    7446:	c484           	and.l d4,d2
	and.l	d4,d6
    7448:	cc84           	and.l d4,d6
	and.l	d4,d3
    744a:	c684           	and.l d4,d3
	and.l	d4,d7
    744c:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    744e:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    7450:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    7452:	8486           	or.l d6,d2
	or.l	d7,d3
    7454:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    7456:	3c02           	move.w d2,d6
	move.w	d3,d7
    7458:	3e03           	move.w d3,d7
	move.w	d0,d2
    745a:	3400           	move.w d0,d2
	move.w	d1,d3
    745c:	3601           	move.w d1,d3
	swap	d2
    745e:	4842           	swap d2
	swap	d3
    7460:	4843           	swap d3
	move.w	d2,d0
    7462:	3002           	move.w d2,d0
	move.w	d3,d1
    7464:	3203           	move.w d3,d1
	move.w	d6,d2
    7466:	3406           	move.w d6,d2
	move.w	d7,d3
    7468:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    746a:	2c02           	move.l d2,d6
	move.l	d3,d7
    746c:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    746e:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7470:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    7472:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7474:	b387           	eor.l d1,d7
	and.l	d5,d6
    7476:	cc85           	and.l d5,d6
	and.l	d5,d7
    7478:	ce85           	and.l d5,d7
	eor.l	d6,d0
    747a:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    747c:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    747e:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7480:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    7482:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7484:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    7486:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    748c:	2c01           	move.l d1,d6
	move.l	d3,d7
    748e:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7490:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    7492:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7494:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7496:	b587           	eor.l d2,d7
	bra	.start2
    7498:	6000 0088      	bra.w 7522 <.start2>

0000749c <.x2>:
.x2:
	move.l	(a0)+,d0
    749c:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    749e:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    74a0:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    74a2:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    74a4:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    74a8:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    74ae:	c084           	and.l d4,d0
	and.l	d4,d1
    74b0:	c284           	and.l d4,d1
	and.l	d4,d2
    74b2:	c484           	and.l d4,d2
	and.l	d4,d3
    74b4:	c684           	and.l d4,d3
	lsr.l	#4,d2
    74b6:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    74b8:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    74ba:	8082           	or.l d2,d0
	or.l	d3,d1
    74bc:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    74be:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    74c0:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    74c2:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    74c4:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    74c6:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    74ca:	c484           	and.l d4,d2
	and.l	d4,d6
    74cc:	cc84           	and.l d4,d6
	and.l	d4,d3
    74ce:	c684           	and.l d4,d3
	and.l	d4,d7
    74d0:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    74d2:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    74d4:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    74d6:	8486           	or.l d6,d2
	or.l	d7,d3
    74d8:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    74da:	3c02           	move.w d2,d6
	move.w	d3,d7
    74dc:	3e03           	move.w d3,d7
	move.w	d0,d2
    74de:	3400           	move.w d0,d2
	move.w	d1,d3
    74e0:	3601           	move.w d1,d3
	swap	d2
    74e2:	4842           	swap d2
	swap	d3
    74e4:	4843           	swap d3
	move.w	d2,d0
    74e6:	3002           	move.w d2,d0
	move.w	d3,d1
    74e8:	3203           	move.w d3,d1
	move.w	d6,d2
    74ea:	3406           	move.w d6,d2
	move.w	d7,d3
    74ec:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    74ee:	234c 57f0      	move.l a4,22512(a1)

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
	move.l	a5,(a1)+
    7520:	22cd           	move.l a5,(a1)+

00007522 <.start2>:
.start2:
	and.l	d4,d6
    7522:	cc84           	and.l d4,d6
	and.l	d4,d7
    7524:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7526:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7528:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    752a:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    752c:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    752e:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    7530:	bf83           	eor.l d7,d3

	move.l	a6,d4
    7532:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    7534:	2c01           	move.l d1,d6
	move.l	d3,d7
    7536:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    7538:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    753a:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    753c:	b186           	eor.l d0,d6
	eor.l	d2,d7
    753e:	b587           	eor.l d2,d7
	and.l	d4,d6
    7540:	cc84           	and.l d4,d6
	and.l	d4,d7
    7542:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7544:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7546:	bf82           	eor.l d7,d2
	add.l	d6,d6
    7548:	dc86           	add.l d6,d6
	add.l	d7,d7
    754a:	de87           	add.l d7,d7
	eor.l	d1,d6
    754c:	b386           	eor.l d1,d6
	eor.l	d3,d7
    754e:	b787           	eor.l d3,d7

	move.l	d0,a4
    7550:	2840           	movea.l d0,a4
	move.l	d2,a5
    7552:	2a42           	movea.l d2,a5
	move.l	d6,a3
    7554:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    7556:	b5c8           	cmpa.l a0,a2
	bne	.x2
    7558:	6600 ff42      	bne.w 749c <.x2>
	move.l	d7,-BPLSIZE(a1)
    755c:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    7560:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    7564:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    7568:	22cd           	move.l a5,(a1)+

0000756a <.none>:
.none:
	movem.l .c2p_saveregs,d0-d7/a0-a6
    756a:	4cfa 7fff 0004 	movem.l 7572 <.c2p_saveregs>(pc),d0-a6
	rts
    7570:	4e75           	rts

00007572 <.c2p_saveregs>:
	...

000075ae <c2p1x1_8_c5_gen_scroffs>:
    75ae:	0000 0001      	ori.b #1,d0

000075b2 <c2p1x1_8_c5_gen_pixels>:

.c2p_saveregs: .dcb.b 60


c2p1x1_8_c5_gen_scroffs: dc.l	1
    75b2:	0000 0001      	ori.b #1,d0
