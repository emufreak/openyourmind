
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
       2:	203c 0000 a612 	move.l #42514,d0
       8:	0480 0000 a612 	subi.l #42514,d0
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
      22:	41f9 0000 a612 	lea a612 <__fini_array_end>,a0
      28:	2071 8800      	movea.l (0,a1,a0.l),a0
      2c:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      2e:	52af 0004      	addq.l #1,4(sp)
      32:	202f 0004      	move.l 4(sp),d0
      36:	b097           	cmp.l (sp),d0
      38:	65de           	bcs.s 18 <_start+0x18>

	count = __init_array_end - __init_array_start;
      3a:	203c 0000 a612 	move.l #42514,d0
      40:	0480 0000 a612 	subi.l #42514,d0
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
      5a:	41f9 0000 a612 	lea a612 <__fini_array_end>,a0
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
      78:	203c 0000 a612 	move.l #42514,d0
      7e:	0480 0000 a612 	subi.l #42514,d0
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
      9a:	41f9 0000 a612 	lea a612 <__fini_array_end>,a0
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
      b6:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
      bc:	3f68 0002 0002 	move.w 2(a0),2(sp)
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
      c2:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
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
      e6:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
      ec:	6722           	beq.s 110 <FreeDisplay+0x30>
      ee:	2f79 004d 2c0c 	move.l 4d2c0c <Copperlist1>,16(sp)
      f4:	0010 
      f6:	2f6f 0018 000c 	move.l 24(sp),12(sp)
      fc:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
     102:	2c40           	movea.l d0,a6
     104:	226f 0010      	movea.l 16(sp),a1
     108:	202f 000c      	move.l 12(sp),d0
     10c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     110:	2039 004d 2c10 	move.l 4d2c10 <Copperlist2>,d0
     116:	6722           	beq.s 13a <FreeDisplay+0x5a>
     118:	2f79 004d 2c10 	move.l 4d2c10 <Copperlist2>,8(sp)
     11e:	0008 
     120:	2f6f 0018 0004 	move.l 24(sp),4(sp)
     126:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
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
     146:	2039 004d 2c14 	move.l 4d2c14 <DrawBuffer>,d0
     14c:	4240           	clr.w d0
     14e:	4840           	swap d0
     150:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     154:	2039 004d 2c14 	move.l 4d2c14 <DrawBuffer>,d0
     15a:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     15e:	2f79 004d 2c1c 	move.l 4d2c1c <DrawCopper>,4(sp)
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
     17e:	2039 004d 2c14 	move.l 4d2c14 <DrawBuffer>,d0
     184:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     186:	2039 004d 2c18 	move.l 4d2c18 <ViewBuffer>,d0
     18c:	23c0 004d 2c14 	move.l d0,4d2c14 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     192:	2017           	move.l (sp),d0
     194:	23c0 004d 2c18 	move.l d0,4d2c18 <ViewBuffer>
}
     19a:	4fef 000c      	lea 12(sp),sp
     19e:	4e75           	rts

000001a0 <SwapCl>:

void SwapCl() {
     1a0:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     1a2:	2039 004d 2c1c 	move.l 4d2c1c <DrawCopper>,d0
     1a8:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     1aa:	2039 004d 2c20 	move.l 4d2c20 <ViewCopper>,d0
     1b0:	23c0 004d 2c1c 	move.l d0,4d2c1c <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     1b6:	2017           	move.l (sp),d0
     1b8:	23c0 004d 2c20 	move.l d0,4d2c20 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     1be:	2039 004d 2c20 	move.l 4d2c20 <ViewCopper>,d0
     1c4:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
     1ca:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     1ce:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
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
     2a6:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
     2ac:	317c 0020 009c 	move.w #32,156(a0)
     2b2:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
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
     2c2:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
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
     2e2:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
     2e8:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     2ee:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
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
     42e:	0681 0000 a92c 	addi.l #43308,d1
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
     4c2:	2079 004d 2c28 	movea.l 4d2c28 <SysBase>,a0
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
     4e6:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
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
     514:	2079 004d 2c40 	movea.l 4d2c40 <VBR>,a0
     51a:	41e8 006c      	lea 108(a0),a0
     51e:	20af 0004      	move.l 4(sp),(a0)
}
     522:	4e75           	rts

00000524 <GetInterruptHandler>:

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     524:	2079 004d 2c40 	movea.l 4d2c40 <VBR>,a0
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
     57e:	23c0 004d 2c40 	move.l d0,4d2c40 <VBR>
	SystemIrq=GetInterruptHandler(); //store interrupt register
     584:	4eba ff9e      	jsr 524 <GetInterruptHandler>(pc)
     588:	23c0 004d 2c44 	move.l d0,4d2c44 <SystemIrq>
}
     58e:	4e75           	rts

00000590 <FreeSystem>:

	//restore interrupts
	//SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
     590:	2079 004d 2c34 	movea.l 4d2c34 <GfxBase>,a0
     596:	2028 0026      	move.l 38(a0),d0
     59a:	2079 004d 2c2c 	movea.l 4d2c2c <custom>,a0
     5a0:	2140 0080      	move.l d0,128(a0)
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
     5a4:	2079 004d 2c34 	movea.l 4d2c34 <GfxBase>,a0
     5aa:	2028 0032      	move.l 50(a0),d0
     5ae:	2079 004d 2c2c 	movea.l 4d2c2c <custom>,a0
     5b4:	2140 0084      	move.l d0,132(a0)
	custom->copjmp1=0x7fff; //start coppper
     5b8:	2079 004d 2c2c 	movea.l 4d2c2c <custom>,a0
     5be:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
     5c4:	3039 004d 2c3a 	move.w 4d2c3a <SystemInts>,d0
     5ca:	2079 004d 2c2c 	movea.l 4d2c2c <custom>,a0
     5d0:	0040 8000      	ori.w #-32768,d0
     5d4:	3140 009a      	move.w d0,154(a0)
	custom->dmacon=SystemDMA|0x8000;
     5d8:	3039 004d 2c3c 	move.w 4d2c3c <SystemDMA>,d0
     5de:	2079 004d 2c2c 	movea.l 4d2c2c <custom>,a0
     5e4:	0040 8000      	ori.w #-32768,d0
     5e8:	3140 0096      	move.w d0,150(a0)
	custom->adkcon=SystemADKCON|0x8000;
     5ec:	3039 004d 2c3e 	move.w 4d2c3e <SystemADKCON>,d0
     5f2:	2079 004d 2c2c 	movea.l 4d2c2c <custom>,a0
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
     606:	2079 004d 2c2c 	movea.l 4d2c2c <custom>,a0
     60c:	317c 0020 009c 	move.w #32,156(a0)
     612:	2079 004d 2c2c 	movea.l 4d2c2c <custom>,a0
     618:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	frameCounter++;
     61e:	3039 004d 2c4c 	move.w 4d2c4c <frameCounter>,d0
     624:	5240           	addq.w #1,d0
     626:	33c0 004d 2c4c 	move.w d0,4d2c4c <frameCounter>
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
     646:	23c0 004d 2c28 	move.l d0,4d2c28 <SysBase>
	hw = (struct Custom*)0xdff000;
     64c:	23fc 00df f000 	move.l #14675968,4d2c24 <hw>
     652:	004d 2c24 

	SysBase = *((struct ExecBase**)4UL);
     656:	307c 0004      	movea.w #4,a0
     65a:	2010           	move.l (a0),d0
     65c:	23c0 004d 2c28 	move.l d0,4d2c28 <SysBase>
	custom = (struct Custom*)0xdff000;
     662:	23fc 00df f000 	move.l #14675968,4d2c2c <custom>
     668:	004d 2c2c 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
     66c:	2f7c 0000 75be 	move.l #30142,68(sp)
     672:	0044 
     674:	42af 0040      	clr.l 64(sp)
     678:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
     67e:	2c40           	movea.l d0,a6
     680:	226f 0044      	movea.l 68(sp),a1
     684:	202f 0040      	move.l 64(sp),d0
     688:	4eae fdd8      	jsr -552(a6)
     68c:	2f40 003c      	move.l d0,60(sp)
     690:	202f 003c      	move.l 60(sp),d0
     694:	23c0 004d 2c34 	move.l d0,4d2c34 <GfxBase>
	if (!GfxBase)
     69a:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
     6a0:	6614           	bne.s 6b6 <main+0x84>
		Exit(0);
     6a2:	42af 0038      	clr.l 56(sp)
     6a6:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     6ac:	2c40           	movea.l d0,a6
     6ae:	222f 0038      	move.l 56(sp),d1
     6b2:	4eae ff70      	jsr -144(a6)

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     6b6:	2f7c 0000 75cf 	move.l #30159,52(sp)
     6bc:	0034 
     6be:	42af 0030      	clr.l 48(sp)
     6c2:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
     6c8:	2c40           	movea.l d0,a6
     6ca:	226f 0034      	movea.l 52(sp),a1
     6ce:	202f 0030      	move.l 48(sp),d0
     6d2:	4eae fdd8      	jsr -552(a6)
     6d6:	2f40 002c      	move.l d0,44(sp)
     6da:	202f 002c      	move.l 44(sp),d0
     6de:	23c0 004d 2c30 	move.l d0,4d2c30 <DOSBase>
	if (!DOSBase)
     6e4:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     6ea:	6614           	bne.s 700 <main+0xce>
		Exit(0);
     6ec:	42af 0028      	clr.l 40(sp)
     6f0:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     6f6:	2c40           	movea.l d0,a6
     6f8:	222f 0028      	move.l 40(sp),d1
     6fc:	4eae ff70      	jsr -144(a6)

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
     700:	4879 0000 75db 	pea 75db <c2p1x1_8_c5_gen_pixels+0x21>
     706:	4eba 67a8      	jsr 6eb0 <KPrintF>(pc)
     70a:	588f           	addq.l #4,sp
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
     70c:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     712:	2c40           	movea.l d0,a6
     714:	4eae ffc4      	jsr -60(a6)
     718:	2f40 0024      	move.l d0,36(sp)
     71c:	202f 0024      	move.l 36(sp),d0
     720:	2f40 0020      	move.l d0,32(sp)
     724:	2f7c 0000 75f7 	move.l #30199,28(sp)
     72a:	001c 
     72c:	700f           	moveq #15,d0
     72e:	2f40 0018      	move.l d0,24(sp)
     732:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     738:	2c40           	movea.l d0,a6
     73a:	222f 0020      	move.l 32(sp),d1
     73e:	242f 001c      	move.l 28(sp),d2
     742:	262f 0018      	move.l 24(sp),d3
     746:	4eae ffd0      	jsr -48(a6)
     74a:	2f40 0014      	move.l d0,20(sp)
	Delay(50);
     74e:	7032           	moveq #50,d0
     750:	2f40 0010      	move.l d0,16(sp)
     754:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
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
     76c:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
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
     7c4:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
     7ca:	4878 0010      	pea 10 <_start+0x10>
     7ce:	4879 0000 a694 	pea a694 <ClsSprites>
     7d4:	42a7           	clr.l -(sp)
     7d6:	2f00           	move.l d0,-(sp)
     7d8:	4eba 1ff8      	jsr 27d2 <TestCopperlistBatch>(pc)
     7dc:	4fef 0010      	lea 16(sp),sp
     7e0:	4a80           	tst.l d0
     7e2:	6642           	bne.s 826 <SwScrollerTest+0x6e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     7e4:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     7ea:	2c40           	movea.l d0,a6
     7ec:	4eae ffc4      	jsr -60(a6)
     7f0:	2f40 0070      	move.l d0,112(sp)
     7f4:	202f 0070      	move.l 112(sp),d0
     7f8:	2f40 006c      	move.l d0,108(sp)
     7fc:	2f7c 0000 7618 	move.l #30232,104(sp)
     802:	0068 
     804:	702c           	moveq #44,d0
     806:	2f40 0064      	move.l d0,100(sp)
     80a:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     810:	2c40           	movea.l d0,a6
     812:	222f 006c      	move.l 108(sp),d1
     816:	242f 0068      	move.l 104(sp),d2
     81a:	262f 0064      	move.l 100(sp),d3
     81e:	4eae ffd0      	jsr -48(a6)
     822:	2f40 0060      	move.l d0,96(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     826:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
     82c:	4878 000c      	pea c <_start+0xc>
     830:	4879 0000 a6d4 	pea a6d4 <ClScreen>
     836:	4878 0010      	pea 10 <_start+0x10>
     83a:	2f00           	move.l d0,-(sp)
     83c:	4eba 1f94      	jsr 27d2 <TestCopperlistBatch>(pc)
     840:	4fef 0010      	lea 16(sp),sp
     844:	4a80           	tst.l d0
     846:	6642           	bne.s 88a <SwScrollerTest+0xd2>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     848:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     84e:	2c40           	movea.l d0,a6
     850:	4eae ffc4      	jsr -60(a6)
     854:	2f40 005c      	move.l d0,92(sp)
     858:	202f 005c      	move.l 92(sp),d0
     85c:	2f40 0058      	move.l d0,88(sp)
     860:	2f7c 0000 764e 	move.l #30286,84(sp)
     866:	0054 
     868:	7036           	moveq #54,d0
     86a:	2f40 0050      	move.l d0,80(sp)
     86e:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     874:	2c40           	movea.l d0,a6
     876:	222f 0058      	move.l 88(sp),d1
     87a:	242f 0054      	move.l 84(sp),d2
     87e:	262f 0050      	move.l 80(sp),d3
     882:	4eae ffd0      	jsr -48(a6)
     886:	2f40 004c      	move.l d0,76(sp)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     88a:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
     890:	4878 0002      	pea 2 <_start+0x2>
     894:	4879 0000 a614 	pea a614 <ClColor>
     89a:	4878 001e      	pea 1e <_start+0x1e>
     89e:	2f00           	move.l d0,-(sp)
     8a0:	4eba 1f30      	jsr 27d2 <TestCopperlistBatch>(pc)
     8a4:	4fef 0010      	lea 16(sp),sp
     8a8:	4a80           	tst.l d0
     8aa:	6642           	bne.s 8ee <SwScrollerTest+0x136>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     8ac:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     8b2:	2c40           	movea.l d0,a6
     8b4:	4eae ffc4      	jsr -60(a6)
     8b8:	2f40 0048      	move.l d0,72(sp)
     8bc:	202f 0048      	move.l 72(sp),d0
     8c0:	2f40 0044      	move.l d0,68(sp)
     8c4:	2f7c 0000 7685 	move.l #30341,64(sp)
     8ca:	0040 
     8cc:	7021           	moveq #33,d0
     8ce:	2f40 003c      	move.l d0,60(sp)
     8d2:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     8d8:	2c40           	movea.l d0,a6
     8da:	222f 0044      	move.l 68(sp),d1
     8de:	242f 0040      	move.l 64(sp),d2
     8e2:	262f 003c      	move.l 60(sp),d3
     8e6:	4eae ffd0      	jsr -48(a6)
     8ea:	2f40 0038      	move.l d0,56(sp)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     8ee:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
     8f4:	4878 fffe      	pea fffffffe <_end+0xffb2d382>
     8f8:	4878 0020      	pea 20 <_start+0x20>
     8fc:	2f00           	move.l d0,-(sp)
     8fe:	4eba 1f10      	jsr 2810 <TestCopperlistPos>(pc)
     902:	4fef 000c      	lea 12(sp),sp
     906:	4a80           	tst.l d0
     908:	6642           	bne.s 94c <SwScrollerTest+0x194>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     90a:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     910:	2c40           	movea.l d0,a6
     912:	4eae ffc4      	jsr -60(a6)
     916:	2f40 0034      	move.l d0,52(sp)
     91a:	202f 0034      	move.l 52(sp),d0
     91e:	2f40 0030      	move.l d0,48(sp)
     922:	2f7c 0000 76a7 	move.l #30375,44(sp)
     928:	002c 
     92a:	7022           	moveq #34,d0
     92c:	2f40 0028      	move.l d0,40(sp)
     930:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     936:	2c40           	movea.l d0,a6
     938:	222f 0030      	move.l 48(sp),d1
     93c:	242f 002c      	move.l 44(sp),d2
     940:	262f 0028      	move.l 40(sp),d3
     944:	4eae ffd0      	jsr -48(a6)
     948:	2f40 0024      	move.l d0,36(sp)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     94c:	2239 0000 b850 	move.l b850 <sw_text>,d1
     952:	2039 004d 2c14 	move.l 4d2c14 <DrawBuffer>,d0
     958:	2f01           	move.l d1,-(sp)
     95a:	2f00           	move.l d0,-(sp)
     95c:	4879 0000 b854 	pea b854 <sw_testfont>
     962:	4eba 0380      	jsr ce4 <WriteFont>(pc)
     966:	4fef 000c      	lea 12(sp),sp

  UWORD *tstpointer = (UWORD *)DrawBuffer;
     96a:	2f79 004d 2c14 	move.l 4d2c14 <DrawBuffer>,32(sp)
     970:	0020 
  if( *tstpointer != 0xff00)
     972:	206f 0020      	movea.l 32(sp),a0
     976:	3010           	move.w (a0),d0
     978:	0c40 ff00      	cmpi.w #-256,d0
     97c:	6742           	beq.s 9c0 <SwScrollerTest+0x208>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     97e:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     984:	2c40           	movea.l d0,a6
     986:	4eae ffc4      	jsr -60(a6)
     98a:	2f40 001c      	move.l d0,28(sp)
     98e:	202f 001c      	move.l 28(sp),d0
     992:	2f40 0018      	move.l d0,24(sp)
     996:	2f7c 0000 76ca 	move.l #30410,20(sp)
     99c:	0014 
     99e:	7031           	moveq #49,d0
     9a0:	2f40 0010      	move.l d0,16(sp)
     9a4:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
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
     9e6:	23c0 004d 2c0c 	move.l d0,4d2c0c <Copperlist1>
  Copperlist2 = ClbuildSW();
     9ec:	4eba 0174      	jsr b62 <ClbuildSW>(pc)
     9f0:	23c0 004d 2c10 	move.l d0,4d2c10 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     9f6:	2f7c 0000 c800 	move.l #51200,80(sp)
     9fc:	0050 
     9fe:	7002           	moveq #2,d0
     a00:	2f40 004c      	move.l d0,76(sp)
     a04:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
     a0a:	2c40           	movea.l d0,a6
     a0c:	202f 0050      	move.l 80(sp),d0
     a10:	222f 004c      	move.l 76(sp),d1
     a14:	4eae ff3a      	jsr -198(a6)
     a18:	2f40 0048      	move.l d0,72(sp)
     a1c:	202f 0048      	move.l 72(sp),d0
     a20:	23c0 004d 2c04 	move.l d0,4d2c04 <Bitplane1>
  if(Bitplane1 == 0) {
     a26:	2039 004d 2c04 	move.l 4d2c04 <Bitplane1>,d0
     a2c:	6658           	bne.s a86 <PrepareDisplaySW+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     a2e:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     a34:	2c40           	movea.l d0,a6
     a36:	4eae ffc4      	jsr -60(a6)
     a3a:	2f40 0044      	move.l d0,68(sp)
     a3e:	202f 0044      	move.l 68(sp),d0
     a42:	2f40 0040      	move.l d0,64(sp)
     a46:	2f7c 0000 7cad 	move.l #31917,60(sp)
     a4c:	003c 
     a4e:	7026           	moveq #38,d0
     a50:	2f40 0038      	move.l d0,56(sp)
     a54:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     a5a:	2c40           	movea.l d0,a6
     a5c:	222f 0040      	move.l 64(sp),d1
     a60:	242f 003c      	move.l 60(sp),d2
     a64:	262f 0038      	move.l 56(sp),d3
     a68:	4eae ffd0      	jsr -48(a6)
     a6c:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
     a70:	7001           	moveq #1,d0
     a72:	2f40 0030      	move.l d0,48(sp)
     a76:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     a7c:	2c40           	movea.l d0,a6
     a7e:	222f 0030      	move.l 48(sp),d1
     a82:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
     a86:	2039 004d 2c04 	move.l 4d2c04 <Bitplane1>,d0
     a8c:	23c0 004d 2c14 	move.l d0,4d2c14 <DrawBuffer>
  DrawCopper = Copperlist1;
     a92:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
     a98:	23c0 004d 2c1c 	move.l d0,4d2c1c <DrawCopper>
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     a9e:	2f7c 0000 c800 	move.l #51200,44(sp)
     aa4:	002c 
     aa6:	7002           	moveq #2,d0
     aa8:	2f40 0028      	move.l d0,40(sp)
     aac:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
     ab2:	2c40           	movea.l d0,a6
     ab4:	202f 002c      	move.l 44(sp),d0
     ab8:	222f 0028      	move.l 40(sp),d1
     abc:	4eae ff3a      	jsr -198(a6)
     ac0:	2f40 0024      	move.l d0,36(sp)
     ac4:	202f 0024      	move.l 36(sp),d0
     ac8:	23c0 004d 2c08 	move.l d0,4d2c08 <Bitplane2>
  if(Bitplane2 == 0) {
     ace:	2039 004d 2c08 	move.l 4d2c08 <Bitplane2>,d0
     ad4:	6658           	bne.s b2e <PrepareDisplaySW+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     ad6:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     adc:	2c40           	movea.l d0,a6
     ade:	4eae ffc4      	jsr -60(a6)
     ae2:	2f40 0020      	move.l d0,32(sp)
     ae6:	202f 0020      	move.l 32(sp),d0
     aea:	2f40 001c      	move.l d0,28(sp)
     aee:	2f7c 0000 7cd4 	move.l #31956,24(sp)
     af4:	0018 
     af6:	7026           	moveq #38,d0
     af8:	2f40 0014      	move.l d0,20(sp)
     afc:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     b02:	2c40           	movea.l d0,a6
     b04:	222f 001c      	move.l 28(sp),d1
     b08:	242f 0018      	move.l 24(sp),d2
     b0c:	262f 0014      	move.l 20(sp),d3
     b10:	4eae ffd0      	jsr -48(a6)
     b14:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     b18:	7001           	moveq #1,d0
     b1a:	2f40 000c      	move.l d0,12(sp)
     b1e:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     b24:	2c40           	movea.l d0,a6
     b26:	222f 000c      	move.l 12(sp),d1
     b2a:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
     b2e:	2039 004d 2c08 	move.l 4d2c08 <Bitplane2>,d0
     b34:	23c0 004d 2c18 	move.l d0,4d2c18 <ViewBuffer>
  ViewCopper = Copperlist2;
     b3a:	2039 004d 2c10 	move.l 4d2c10 <Copperlist2>,d0
     b40:	23c0 004d 2c20 	move.l d0,4d2c20 <ViewCopper>
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
     b78:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
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
     b9a:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     ba0:	2c40           	movea.l d0,a6
     ba2:	4eae ffc4      	jsr -60(a6)
     ba6:	2f40 0020      	move.l d0,32(sp)
     baa:	202f 0020      	move.l 32(sp),d0
     bae:	2f40 001c      	move.l d0,28(sp)
     bb2:	2f7c 0000 7cfb 	move.l #31995,24(sp)
     bb8:	0018 
     bba:	7228           	moveq #40,d1
     bbc:	2f41 0014      	move.l d1,20(sp)
     bc0:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     bc6:	2c40           	movea.l d0,a6
     bc8:	222f 001c      	move.l 28(sp),d1
     bcc:	242f 0018      	move.l 24(sp),d2
     bd0:	262f 0014      	move.l 20(sp),d3
     bd4:	4eae ffd0      	jsr -48(a6)
     bd8:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     bdc:	7401           	moveq #1,d2
     bde:	2f42 000c      	move.l d2,12(sp)
     be2:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
     be8:	2c40           	movea.l d0,a6
     bea:	222f 000c      	move.l 12(sp),d1
     bee:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
     bf2:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
     bf8:	2f7c 0000 a694 	move.l #42644,64(sp)
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
     c32:	2f7c 0000 a6d4 	move.l #42708,64(sp)
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
     c94:	2f7c 0000 a614 	move.l #42516,64(sp)
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
     d5c:	3039 004d 2c64 	move.w 4d2c64 <Zoom_Counter>,d0
     d62:	5240           	addq.w #1,d0
     d64:	33c0 004d 2c64 	move.w d0,4d2c64 <Zoom_Counter>
  SwapCl();
     d6a:	4eba f434      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     d6e:	33fc 0001 004d 	move.w #1,4d2c6a <Zoom_MouseReleased>
     d74:	2c6a 
  if( MouseLeft())
     d76:	4eba f4ea      	jsr 262 <MouseLeft>(pc)
     d7a:	4a40           	tst.w d0
     d7c:	6708           	beq.s d86 <Zoom_VblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     d7e:	33fc 0001 004d 	move.w #1,4d2c6c <Zoom_Mousepressed>
     d84:	2c6c 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     d86:	3039 004d 2c6c 	move.w 4d2c6c <Zoom_Mousepressed>,d0
     d8c:	0c40 0001      	cmpi.w #1,d0
     d90:	6616           	bne.s da8 <Zoom_VblankHandler+0x4c>
     d92:	4eba f4ce      	jsr 262 <MouseLeft>(pc)
     d96:	4a40           	tst.w d0
     d98:	660e           	bne.s da8 <Zoom_VblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     d9a:	33fc 0001 004d 	move.w #1,4d2c6a <Zoom_MouseReleased>
     da0:	2c6a 
    Zoom_Mousepressed = 0;
     da2:	4279 004d 2c6c 	clr.w 4d2c6c <Zoom_Mousepressed>
  }
      
      Zoom_MouseReleased = 0;
     da8:	4279 004d 2c6a 	clr.w 4d2c6a <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom <= 2) {
     dae:	3039 004d 2c72 	move.w 4d2c72 <Zoom_LevelOf102Zoom>,d0
     db4:	0c40 0002      	cmpi.w #2,d0
     db8:	6244           	bhi.s dfe <Zoom_VblankHandler+0xa2>
 
        if( Zoom_LevelOfZoom == 87)
     dba:	3039 004d 2c70 	move.w 4d2c70 <Zoom_LevelOfZoom>,d0
     dc0:	0c40 0057      	cmpi.w #87,d0
     dc4:	660a           	bne.s dd0 <Zoom_VblankHandler+0x74>
          Zoom_LevelOfZoom = 0;
     dc6:	33fc 0000 004d 	move.w #0,4d2c70 <Zoom_LevelOfZoom>
     dcc:	2c70 
     dce:	600e           	bra.s dde <Zoom_VblankHandler+0x82>
        else
          Zoom_LevelOfZoom++;
     dd0:	3039 004d 2c70 	move.w 4d2c70 <Zoom_LevelOfZoom>,d0
     dd6:	5240           	addq.w #1,d0
     dd8:	33c0 004d 2c70 	move.w d0,4d2c70 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     dde:	33fc 000f 004d 	move.w #15,4d2c72 <Zoom_LevelOf102Zoom>
     de4:	2c72 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     de6:	3039 004d 2c70 	move.w 4d2c70 <Zoom_LevelOfZoom>,d0
     dec:	3000           	move.w d0,d0
     dee:	0280 0000 ffff 	andi.l #65535,d0
     df4:	2f00           	move.l d0,-(sp)
     df6:	4eba 10c4      	jsr 1ebc <Zoom_SwapBuffers>(pc)
     dfa:	588f           	addq.l #4,sp
     dfc:	600e           	bra.s e0c <Zoom_VblankHandler+0xb0>
      } else 
        Zoom_LevelOf102Zoom-=2;
     dfe:	3039 004d 2c72 	move.w 4d2c72 <Zoom_LevelOf102Zoom>,d0
     e04:	5540           	subq.w #2,d0
     e06:	33c0 004d 2c72 	move.w d0,4d2c72 <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     e0c:	2239 004d 2c1c 	move.l 4d2c1c <DrawCopper>,d1
     e12:	3039 004d 2c72 	move.w 4d2c72 <Zoom_LevelOf102Zoom>,d0
     e18:	3000           	move.w d0,d0
     e1a:	0280 0000 ffff 	andi.l #65535,d0
     e20:	2f01           	move.l d1,-(sp)
     e22:	2f00           	move.l d0,-(sp)
     e24:	4eba f5e6      	jsr 40c <Zoom_Shrink102>(pc)
     e28:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     e2a:	2239 004d 2c1c 	move.l 4d2c1c <DrawCopper>,d1
     e30:	2039 004d 2c18 	move.l 4d2c18 <ViewBuffer>,d0
     e36:	2f01           	move.l d1,-(sp)
     e38:	2f00           	move.l d0,-(sp)
     e3a:	4eba 0fe8      	jsr 1e24 <Zoom_SetBplPointers>(pc)
     e3e:	508f           	addq.l #8,sp
 
}
     e40:	4e75           	rts

00000e42 <Zoom_ReverseVblankHandler>:


void Zoom_ReverseVblankHandler() {
  
  Zoom_Counter++;
     e42:	3039 004d 2c64 	move.w 4d2c64 <Zoom_Counter>,d0
     e48:	5240           	addq.w #1,d0
     e4a:	33c0 004d 2c64 	move.w d0,4d2c64 <Zoom_Counter>
  SwapCl();
     e50:	4eba f34e      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     e54:	33fc 0001 004d 	move.w #1,4d2c6a <Zoom_MouseReleased>
     e5a:	2c6a 
  if( MouseLeft())
     e5c:	4eba f404      	jsr 262 <MouseLeft>(pc)
     e60:	4a40           	tst.w d0
     e62:	6708           	beq.s e6c <Zoom_ReverseVblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     e64:	33fc 0001 004d 	move.w #1,4d2c6c <Zoom_Mousepressed>
     e6a:	2c6c 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     e6c:	3039 004d 2c6c 	move.w 4d2c6c <Zoom_Mousepressed>,d0
     e72:	0c40 0001      	cmpi.w #1,d0
     e76:	6616           	bne.s e8e <Zoom_ReverseVblankHandler+0x4c>
     e78:	4eba f3e8      	jsr 262 <MouseLeft>(pc)
     e7c:	4a40           	tst.w d0
     e7e:	660e           	bne.s e8e <Zoom_ReverseVblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     e80:	33fc 0001 004d 	move.w #1,4d2c6a <Zoom_MouseReleased>
     e86:	2c6a 
    Zoom_Mousepressed = 0;
     e88:	4279 004d 2c6c 	clr.w 4d2c6c <Zoom_Mousepressed>
    /*if( MouseLeft()) {
      while (MouseLeft())
      {
      }*/
      
      Zoom_MouseReleased = 0;
     e8e:	4279 004d 2c6a 	clr.w 4d2c6a <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 15) {
     e94:	3039 004d 2c72 	move.w 4d2c72 <Zoom_LevelOf102Zoom>,d0
     e9a:	0c40 000f      	cmpi.w #15,d0
     e9e:	6640           	bne.s ee0 <Zoom_ReverseVblankHandler+0x9e>
 
        if( Zoom_LevelOfZoom == 0)
     ea0:	3039 004d 2c70 	move.w 4d2c70 <Zoom_LevelOfZoom>,d0
     ea6:	660a           	bne.s eb2 <Zoom_ReverseVblankHandler+0x70>
          Zoom_LevelOfZoom = 17;
     ea8:	33fc 0011 004d 	move.w #17,4d2c70 <Zoom_LevelOfZoom>
     eae:	2c70 
     eb0:	600e           	bra.s ec0 <Zoom_ReverseVblankHandler+0x7e>
        else
          Zoom_LevelOfZoom--;
     eb2:	3039 004d 2c70 	move.w 4d2c70 <Zoom_LevelOfZoom>,d0
     eb8:	5340           	subq.w #1,d0
     eba:	33c0 004d 2c70 	move.w d0,4d2c70 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 0;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     ec0:	33fc 0000 004d 	move.w #0,4d2c72 <Zoom_LevelOf102Zoom>
     ec6:	2c72 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     ec8:	3039 004d 2c70 	move.w 4d2c70 <Zoom_LevelOfZoom>,d0
     ece:	3000           	move.w d0,d0
     ed0:	0280 0000 ffff 	andi.l #65535,d0
     ed6:	2f00           	move.l d0,-(sp)
     ed8:	4eba 0fe2      	jsr 1ebc <Zoom_SwapBuffers>(pc)
     edc:	588f           	addq.l #4,sp
     ede:	600e           	bra.s eee <Zoom_ReverseVblankHandler+0xac>
      } else 
        Zoom_LevelOf102Zoom++;
     ee0:	3039 004d 2c72 	move.w 4d2c72 <Zoom_LevelOf102Zoom>,d0
     ee6:	5240           	addq.w #1,d0
     ee8:	33c0 004d 2c72 	move.w d0,4d2c72 <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     eee:	2239 004d 2c1c 	move.l 4d2c1c <DrawCopper>,d1
     ef4:	3039 004d 2c72 	move.w 4d2c72 <Zoom_LevelOf102Zoom>,d0
     efa:	3000           	move.w d0,d0
     efc:	0280 0000 ffff 	andi.l #65535,d0
     f02:	2f01           	move.l d1,-(sp)
     f04:	2f00           	move.l d0,-(sp)
     f06:	4eba f504      	jsr 40c <Zoom_Shrink102>(pc)
     f0a:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     f0c:	2239 004d 2c1c 	move.l 4d2c1c <DrawCopper>,d1
     f12:	2039 004d 2c18 	move.l 4d2c18 <ViewBuffer>,d0
     f18:	2f01           	move.l d1,-(sp)
     f1a:	2f00           	move.l d0,-(sp)
     f1c:	4eba 0f06      	jsr 1e24 <Zoom_SetBplPointers>(pc)
     f20:	508f           	addq.l #8,sp
 
}
     f22:	4e75           	rts

00000f24 <Zoom_LoadImage>:

void Zoom_LoadImage( ULONG *destination) {  
     f24:	4fef fff4      	lea -12(sp),sp
     f28:	2f0e           	move.l a6,-(sp)
  CopyMem( rawzoom, destination, ZMBPLSIZE);
     f2a:	2f79 0000 b8a8 	move.l b8a8 <rawzoom>,12(sp)
     f30:	000c 
     f32:	2f6f 0014 0008 	move.l 20(sp),8(sp)
     f38:	2f7c 0000 df20 	move.l #57120,4(sp)
     f3e:	0004 
     f40:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
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
     f70:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
     f76:	216f 0008 0050 	move.l 8(sp),80(a0)
  hw->bltdpt = (UWORD *) destination;
     f7c:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
     f82:	216f 000c 0054 	move.l 12(sp),84(a0)
  hw->bltsize = (height<<6)+2;
     f88:	302f 0002      	move.w 2(sp),d0
     f8c:	ed48           	lsl.w #6,d0
     f8e:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
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
     faa:	3039 004d 2c5a 	move.w 4d2c5a <ZoomBlit_Increment4SrcA>,d0
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
     fc8:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
     fce:	216f 0004 0050 	move.l 4(sp),80(a0)
  hw->bltbpt = source;
     fd4:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
     fda:	216f 000c 004c 	move.l 12(sp),76(a0)
  hw->bltdpt = destination;
     fe0:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
     fe6:	216f 0010 0054 	move.l 16(sp),84(a0)
  hw->bltsize = (height<<6)+2;
     fec:	302f 0002      	move.w 2(sp),d0
     ff0:	ed48           	lsl.w #6,d0
     ff2:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
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
    102a:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    1030:	316f 0004 0064 	move.w 4(sp),100(a0)
  hw->bltbmod = bltbmod;  
    1036:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    103c:	316f 0002 0062 	move.w 2(sp),98(a0)
  hw->bltapt = src4a;
    1042:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    1048:	216f 000c 0050 	move.l 12(sp),80(a0)
  hw->bltbpt = src4b;
    104e:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    1054:	216f 0010 004c 	move.l 16(sp),76(a0)
  hw->bltdpt = dst;
    105a:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    1060:	216f 0014 0054 	move.l 20(sp),84(a0)
  hw->bltsize = (height<<6)+numofwords;
    1066:	302f 0006      	move.w 6(sp),d0
    106a:	ed48           	lsl.w #6,d0
    106c:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
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
    1086:	4279 004d 2c64 	clr.w 4d2c64 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    108c:	7004           	moveq #4,d0
    108e:	2f40 0020      	move.l d0,32(sp)
    1092:	7002           	moveq #2,d0
    1094:	2f40 001c      	move.l d0,28(sp)
    1098:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    109e:	2c40           	movea.l d0,a6
    10a0:	202f 0020      	move.l 32(sp),d0
    10a4:	222f 001c      	move.l 28(sp),d1
    10a8:	4eae ff3a      	jsr -198(a6)
    10ac:	2f40 0018      	move.l d0,24(sp)
    10b0:	202f 0018      	move.l 24(sp),d0
    10b4:	23c0 004d 2c52 	move.l d0,4d2c52 <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 15;
    10ba:	33fc 000f 004d 	move.w #15,4d2c72 <Zoom_LevelOf102Zoom>
    10c0:	2c72 
  ZoomHorizontal = 16;
    10c2:	33fc 0010 004d 	move.w #16,4d2c76 <ZoomHorizontal>
    10c8:	2c76 
  Zoom_PrepareDisplay();
    10ca:	4eba 0288      	jsr 1354 <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 15, Copperlist1);
    10ce:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    10d4:	2f00           	move.l d0,-(sp)
    10d6:	4878 000f      	pea f <_start+0xf>
    10da:	4eba f330      	jsr 40c <Zoom_Shrink102>(pc)
    10de:	508f           	addq.l #8,sp
  Zoom_Shrink102( 15, Copperlist2);
    10e0:	2039 004d 2c10 	move.l 4d2c10 <Copperlist2>,d0
    10e6:	2f00           	move.l d0,-(sp)
    10e8:	4878 000f      	pea f <_start+0xf>
    10ec:	4eba f31e      	jsr 40c <Zoom_Shrink102>(pc)
    10f0:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 1;
    10f2:	33fc 0001 004d 	move.w #1,4d2c70 <Zoom_LevelOfZoom>
    10f8:	2c70 
  Zoom_Direction = 1;                                                  
    10fa:	33fc 0001 004d 	move.w #1,4d2c74 <Zoom_Direction>
    1100:	2c74 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    1102:	7016           	moveq #22,d0
    1104:	2f40 0014      	move.l d0,20(sp)
    1108:	2f7c 0001 0001 	move.l #65537,16(sp)
    110e:	0010 
    1110:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    1116:	2c40           	movea.l d0,a6
    1118:	202f 0014      	move.l 20(sp),d0
    111c:	222f 0010      	move.l 16(sp),d1
    1120:	4eae ff3a      	jsr -198(a6)
    1124:	2f40 000c      	move.l d0,12(sp)
    1128:	202f 000c      	move.l 12(sp),d0
    112c:	23c0 004d 2c5c 	move.l d0,4d2c5c <Zoom_vbint>
    1132:	2039 004d 2c5c 	move.l 4d2c5c <Zoom_vbint>,d0
    1138:	673e           	beq.s 1178 <Zoom_InitRun+0xf8>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    113a:	2079 004d 2c5c 	movea.l 4d2c5c <Zoom_vbint>,a0
    1140:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    1146:	2079 004d 2c5c 	movea.l 4d2c5c <Zoom_vbint>,a0
    114c:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    1152:	2079 004d 2c5c 	movea.l 4d2c5c <Zoom_vbint>,a0
    1158:	217c 0000 7d21 	move.l #32033,10(a0)
    115e:	000a 
    Zoom_vbint->is_Data = NULL;
    1160:	2079 004d 2c5c 	movea.l 4d2c5c <Zoom_vbint>,a0
    1166:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    116a:	2079 004d 2c5c 	movea.l 4d2c5c <Zoom_vbint>,a0
    1170:	217c 0000 0d5c 	move.l #3420,18(a0)
    1176:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    1178:	7005           	moveq #5,d0
    117a:	2f40 0008      	move.l d0,8(sp)
    117e:	2f79 004d 2c5c 	move.l 4d2c5c <Zoom_vbint>,4(sp)
    1184:	0004 
    1186:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    118c:	2c40           	movea.l d0,a6
    118e:	202f 0008      	move.l 8(sp),d0
    1192:	226f 0004      	movea.l 4(sp),a1
    1196:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    119a:	2239 004d 2c20 	move.l 4d2c20 <ViewCopper>,d1
    11a0:	2039 004d 2c18 	move.l 4d2c18 <ViewBuffer>,d0
    11a6:	2f01           	move.l d1,-(sp)
    11a8:	2f00           	move.l d0,-(sp)
    11aa:	4eba 0c78      	jsr 1e24 <Zoom_SetBplPointers>(pc)
    11ae:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    11b0:	2239 004d 2c1c 	move.l 4d2c1c <DrawCopper>,d1
    11b6:	2039 004d 2c18 	move.l 4d2c18 <ViewBuffer>,d0
    11bc:	2f01           	move.l d1,-(sp)
    11be:	2f00           	move.l d0,-(sp)
    11c0:	4eba 0c62      	jsr 1e24 <Zoom_SetBplPointers>(pc)
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
    11d8:	4279 004d 2c64 	clr.w 4d2c64 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    11de:	7004           	moveq #4,d0
    11e0:	2f40 0020      	move.l d0,32(sp)
    11e4:	7002           	moveq #2,d0
    11e6:	2f40 001c      	move.l d0,28(sp)
    11ea:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    11f0:	2c40           	movea.l d0,a6
    11f2:	202f 0020      	move.l 32(sp),d0
    11f6:	222f 001c      	move.l 28(sp),d1
    11fa:	4eae ff3a      	jsr -198(a6)
    11fe:	2f40 0018      	move.l d0,24(sp)
    1202:	202f 0018      	move.l 24(sp),d0
    1206:	23c0 004d 2c52 	move.l d0,4d2c52 <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 0;
    120c:	33fc 0000 004d 	move.w #0,4d2c72 <Zoom_LevelOf102Zoom>
    1212:	2c72 
  ZoomHorizontal = 16;
    1214:	33fc 0010 004d 	move.w #16,4d2c76 <ZoomHorizontal>
    121a:	2c76 
  Zoom_PrepareDisplay();
    121c:	4eba 0136      	jsr 1354 <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 0, Copperlist1);
    1220:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    1226:	2f00           	move.l d0,-(sp)
    1228:	42a7           	clr.l -(sp)
    122a:	4eba f1e0      	jsr 40c <Zoom_Shrink102>(pc)
    122e:	508f           	addq.l #8,sp
  Zoom_Shrink102( 0, Copperlist2);
    1230:	2039 004d 2c10 	move.l 4d2c10 <Copperlist2>,d0
    1236:	2f00           	move.l d0,-(sp)
    1238:	42a7           	clr.l -(sp)
    123a:	4eba f1d0      	jsr 40c <Zoom_Shrink102>(pc)
    123e:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 17;
    1240:	33fc 0011 004d 	move.w #17,4d2c70 <Zoom_LevelOfZoom>
    1246:	2c70 
                                                  
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    1248:	7016           	moveq #22,d0
    124a:	2f40 0014      	move.l d0,20(sp)
    124e:	2f7c 0001 0001 	move.l #65537,16(sp)
    1254:	0010 
    1256:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    125c:	2c40           	movea.l d0,a6
    125e:	202f 0014      	move.l 20(sp),d0
    1262:	222f 0010      	move.l 16(sp),d1
    1266:	4eae ff3a      	jsr -198(a6)
    126a:	2f40 000c      	move.l d0,12(sp)
    126e:	202f 000c      	move.l 12(sp),d0
    1272:	23c0 004d 2c5c 	move.l d0,4d2c5c <Zoom_vbint>
    1278:	2039 004d 2c5c 	move.l 4d2c5c <Zoom_vbint>,d0
    127e:	673e           	beq.s 12be <Zoom_InitRunReverse+0xec>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1280:	2079 004d 2c5c 	movea.l 4d2c5c <Zoom_vbint>,a0
    1286:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    128c:	2079 004d 2c5c 	movea.l 4d2c5c <Zoom_vbint>,a0
    1292:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    1298:	2079 004d 2c5c 	movea.l 4d2c5c <Zoom_vbint>,a0
    129e:	217c 0000 7d21 	move.l #32033,10(a0)
    12a4:	000a 
    Zoom_vbint->is_Data = NULL;
    12a6:	2079 004d 2c5c 	movea.l 4d2c5c <Zoom_vbint>,a0
    12ac:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_ReverseVblankHandler;
    12b0:	2079 004d 2c5c 	movea.l 4d2c5c <Zoom_vbint>,a0
    12b6:	217c 0000 0e42 	move.l #3650,18(a0)
    12bc:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    12be:	7005           	moveq #5,d0
    12c0:	2f40 0008      	move.l d0,8(sp)
    12c4:	2f79 004d 2c5c 	move.l 4d2c5c <Zoom_vbint>,4(sp)
    12ca:	0004 
    12cc:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    12d2:	2c40           	movea.l d0,a6
    12d4:	202f 0008      	move.l 8(sp),d0
    12d8:	226f 0004      	movea.l 4(sp),a1
    12dc:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    12e0:	2239 004d 2c20 	move.l 4d2c20 <ViewCopper>,d1
    12e6:	2039 004d 2c18 	move.l 4d2c18 <ViewBuffer>,d0
    12ec:	2f01           	move.l d1,-(sp)
    12ee:	2f00           	move.l d0,-(sp)
    12f0:	4eba 0b32      	jsr 1e24 <Zoom_SetBplPointers>(pc)
    12f4:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    12f6:	2239 004d 2c1c 	move.l 4d2c1c <DrawCopper>,d1
    12fc:	2039 004d 2c18 	move.l 4d2c18 <ViewBuffer>,d0
    1302:	2f01           	move.l d1,-(sp)
    1304:	2f00           	move.l d0,-(sp)
    1306:	4eba 0b1c      	jsr 1e24 <Zoom_SetBplPointers>(pc)
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
    1322:	2f79 004d 2c5c 	move.l 4d2c5c <Zoom_vbint>,4(sp)
    1328:	0004 
    132a:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
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
    1368:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    136e:	2c40           	movea.l d0,a6
    1370:	202f 0018      	move.l 24(sp),d0
    1374:	222f 0014      	move.l 20(sp),d1
    1378:	4eae fd54      	jsr -684(a6)
    137c:	2f40 0010      	move.l d0,16(sp)
    1380:	202f 0010      	move.l 16(sp),d0
    1384:	23c0 004d 2c18 	move.l d0,4d2c18 <ViewBuffer>
  DrawBuffer = AllocVec(268*42*5, MEMF_CHIP);
    138a:	2f7c 0000 dbd8 	move.l #56280,12(sp)
    1390:	000c 
    1392:	7002           	moveq #2,d0
    1394:	2f40 0008      	move.l d0,8(sp)
    1398:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    139e:	2c40           	movea.l d0,a6
    13a0:	202f 000c      	move.l 12(sp),d0
    13a4:	222f 0008      	move.l 8(sp),d1
    13a8:	4eae fd54      	jsr -684(a6)
    13ac:	2f40 0004      	move.l d0,4(sp)
    13b0:	202f 0004      	move.l 4(sp),d0
    13b4:	23c0 004d 2c14 	move.l d0,4d2c14 <DrawBuffer>
  Utils_CopyMem( rawzoom, ViewBuffer, 14070);
    13ba:	2239 004d 2c18 	move.l 4d2c18 <ViewBuffer>,d1
    13c0:	2039 0000 b8a8 	move.l b8a8 <rawzoom>,d0
    13c6:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x27c>
    13ca:	2f01           	move.l d1,-(sp)
    13cc:	2f00           	move.l d0,-(sp)
    13ce:	4eba ee0e      	jsr 1de <Utils_CopyMem>(pc)
    13d2:	4fef 000c      	lea 12(sp),sp
  Utils_CopyMem( rawzoom, DrawBuffer, 14070);
    13d6:	2239 004d 2c14 	move.l 4d2c14 <DrawBuffer>,d1
    13dc:	2039 0000 b8a8 	move.l b8a8 <rawzoom>,d0
    13e2:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x27c>
    13e6:	2f01           	move.l d1,-(sp)
    13e8:	2f00           	move.l d0,-(sp)
    13ea:	4eba edf2      	jsr 1de <Utils_CopyMem>(pc)
    13ee:	4fef 000c      	lea 12(sp),sp
  Zoom_SwapBuffers( 0);
    13f2:	42a7           	clr.l -(sp)
    13f4:	4eba 0ac6      	jsr 1ebc <Zoom_SwapBuffers>(pc)
    13f8:	588f           	addq.l #4,sp
  Copperlist1 = ClbuildZoom( );
    13fa:	4eba 0080      	jsr 147c <ClbuildZoom>(pc)
    13fe:	23c0 004d 2c0c 	move.l d0,4d2c0c <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    1404:	4eba 0076      	jsr 147c <ClbuildZoom>(pc)
    1408:	23c0 004d 2c10 	move.l d0,4d2c10 <Copperlist2>
  if(Bitplane2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;*/
  DrawCopper = Copperlist1;
    140e:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    1414:	23c0 004d 2c1c 	move.l d0,4d2c1c <DrawCopper>
  ViewCopper = Copperlist2;
    141a:	2039 004d 2c10 	move.l 4d2c10 <Copperlist2>,d0
    1420:	23c0 004d 2c20 	move.l d0,4d2c20 <ViewCopper>
  return 0;
    1426:	7000           	moveq #0,d0
}
    1428:	2c5f           	movea.l (sp)+,a6
    142a:	4fef 0018      	lea 24(sp),sp
    142e:	4e75           	rts

00001430 <Zoom_Init>:

void Zoom_Init() {
    1430:	4fef fff4      	lea -12(sp),sp
    1434:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    1436:	7004           	moveq #4,d0
    1438:	2f40 000c      	move.l d0,12(sp)
    143c:	7002           	moveq #2,d0
    143e:	2f40 0008      	move.l d0,8(sp)
    1442:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    1448:	2c40           	movea.l d0,a6
    144a:	202f 000c      	move.l 12(sp),d0
    144e:	222f 0008      	move.l 8(sp),d1
    1452:	4eae ff3a      	jsr -198(a6)
    1456:	2f40 0004      	move.l d0,4(sp)
    145a:	202f 0004      	move.l 4(sp),d0
    145e:	23c0 004d 2c52 	move.l d0,4d2c52 <Zoom_ZoomBlitMask>
  ZoomHorizontal = 16;
    1464:	33fc 0010 004d 	move.w #16,4d2c76 <ZoomHorizontal>
    146a:	2c76 
  Zoom_LevelOf102Zoom = 15;
    146c:	33fc 000f 004d 	move.w #15,4d2c72 <Zoom_LevelOf102Zoom>
    1472:	2c72 
}
    1474:	2c5f           	movea.l (sp)+,a6
    1476:	4fef 000c      	lea 12(sp),sp
    147a:	4e75           	rts

0000147c <ClbuildZoom>:


ULONG * ClbuildZoom() {
    147c:	4fef ffac      	lea -84(sp),sp
    1480:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1484:	2f7c 0000 031c 	move.l #796,68(sp)
    148a:	0044 
    148c:	7002           	moveq #2,d0
    148e:	2f40 0040      	move.l d0,64(sp)
    1492:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    1498:	2c40           	movea.l d0,a6
    149a:	202f 0044      	move.l 68(sp),d0
    149e:	222f 0040      	move.l 64(sp),d1
    14a2:	4eae ff3a      	jsr -198(a6)
    14a6:	2f40 003c      	move.l d0,60(sp)
    14aa:	202f 003c      	move.l 60(sp),d0
    14ae:	2f40 0038      	move.l d0,56(sp)
  
  if( retval == 0) {
    14b2:	6658           	bne.s 150c <ClbuildZoom+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    14b4:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    14ba:	2c40           	movea.l d0,a6
    14bc:	4eae ffc4      	jsr -60(a6)
    14c0:	2f40 0034      	move.l d0,52(sp)
    14c4:	202f 0034      	move.l 52(sp),d0
    14c8:	2f40 0030      	move.l d0,48(sp)
    14cc:	2f7c 0000 7cfb 	move.l #31995,44(sp)
    14d2:	002c 
    14d4:	7228           	moveq #40,d1
    14d6:	2f41 0028      	move.l d1,40(sp)
    14da:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    14e0:	2c40           	movea.l d0,a6
    14e2:	222f 0030      	move.l 48(sp),d1
    14e6:	242f 002c      	move.l 44(sp),d2
    14ea:	262f 0028      	move.l 40(sp),d3
    14ee:	4eae ffd0      	jsr -48(a6)
    14f2:	2f40 0024      	move.l d0,36(sp)
    Exit(1);
    14f6:	7401           	moveq #1,d2
    14f8:	2f42 0020      	move.l d2,32(sp)
    14fc:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    1502:	2c40           	movea.l d0,a6
    1504:	222f 0020      	move.l 32(sp),d1
    1508:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    150c:	2f6f 0038 005c 	move.l 56(sp),92(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    1512:	2f7c 0000 a694 	move.l #42644,88(sp)
    1518:	0058 
  for(int i=0; i<16;i++)
    151a:	42af 0054      	clr.l 84(sp)
    151e:	6024           	bra.s 1544 <ClbuildZoom+0xc8>
    *cl++ = *clpartinstruction++;
    1520:	222f 0058      	move.l 88(sp),d1
    1524:	2001           	move.l d1,d0
    1526:	5880           	addq.l #4,d0
    1528:	2f40 0058      	move.l d0,88(sp)
    152c:	202f 005c      	move.l 92(sp),d0
    1530:	2400           	move.l d0,d2
    1532:	5882           	addq.l #4,d2
    1534:	2f42 005c      	move.l d2,92(sp)
    1538:	2041           	movea.l d1,a0
    153a:	2210           	move.l (a0),d1
    153c:	2040           	movea.l d0,a0
    153e:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    1540:	52af 0054      	addq.l #1,84(sp)
    1544:	700f           	moveq #15,d0
    1546:	b0af 0054      	cmp.l 84(sp),d0
    154a:	6cd4           	bge.s 1520 <ClbuildZoom+0xa4>
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
    154c:	2f7c 0000 a6d4 	move.l #42708,88(sp)
    1552:	0058 
  for(int i=0; i<12;i++)
    1554:	42af 0050      	clr.l 80(sp)
    1558:	6024           	bra.s 157e <ClbuildZoom+0x102>
    *cl++ = *clpartinstruction++;
    155a:	222f 0058      	move.l 88(sp),d1
    155e:	2401           	move.l d1,d2
    1560:	5882           	addq.l #4,d2
    1562:	2f42 0058      	move.l d2,88(sp)
    1566:	202f 005c      	move.l 92(sp),d0
    156a:	2400           	move.l d0,d2
    156c:	5882           	addq.l #4,d2
    156e:	2f42 005c      	move.l d2,92(sp)
    1572:	2041           	movea.l d1,a0
    1574:	2210           	move.l (a0),d1
    1576:	2040           	movea.l d0,a0
    1578:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    157a:	52af 0050      	addq.l #1,80(sp)
    157e:	700b           	moveq #11,d0
    1580:	b0af 0050      	cmp.l 80(sp),d0
    1584:	6cd4           	bge.s 155a <ClbuildZoom+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    1586:	202f 005c      	move.l 92(sp),d0
    158a:	2200           	move.l d0,d1
    158c:	5881           	addq.l #4,d1
    158e:	2f41 005c      	move.l d1,92(sp)
    1592:	2040           	movea.l d0,a0
    1594:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    159a:	202f 005c      	move.l 92(sp),d0
    159e:	2200           	move.l d0,d1
    15a0:	5881           	addq.l #4,d1
    15a2:	2f41 005c      	move.l d1,92(sp)
    15a6:	2040           	movea.l d0,a0
    15a8:	20bc 00e2 0000 	move.l #14811136,(a0)
  *cl++ = 0x00e40000;
    15ae:	202f 005c      	move.l 92(sp),d0
    15b2:	2200           	move.l d0,d1
    15b4:	5881           	addq.l #4,d1
    15b6:	2f41 005c      	move.l d1,92(sp)
    15ba:	2040           	movea.l d0,a0
    15bc:	20bc 00e4 0000 	move.l #14942208,(a0)
  *cl++ = 0x00e60000;
    15c2:	202f 005c      	move.l 92(sp),d0
    15c6:	2200           	move.l d0,d1
    15c8:	5881           	addq.l #4,d1
    15ca:	2f41 005c      	move.l d1,92(sp)
    15ce:	2040           	movea.l d0,a0
    15d0:	20bc 00e6 0000 	move.l #15073280,(a0)
  *cl++ = 0x00e80000;
    15d6:	202f 005c      	move.l 92(sp),d0
    15da:	2200           	move.l d0,d1
    15dc:	5881           	addq.l #4,d1
    15de:	2f41 005c      	move.l d1,92(sp)
    15e2:	2040           	movea.l d0,a0
    15e4:	20bc 00e8 0000 	move.l #15204352,(a0)
  *cl++ = 0x00ea0000;
    15ea:	202f 005c      	move.l 92(sp),d0
    15ee:	2200           	move.l d0,d1
    15f0:	5881           	addq.l #4,d1
    15f2:	2f41 005c      	move.l d1,92(sp)
    15f6:	2040           	movea.l d0,a0
    15f8:	20bc 00ea 0000 	move.l #15335424,(a0)
  *cl++ = 0x00ec0000;
    15fe:	202f 005c      	move.l 92(sp),d0
    1602:	2200           	move.l d0,d1
    1604:	5881           	addq.l #4,d1
    1606:	2f41 005c      	move.l d1,92(sp)
    160a:	2040           	movea.l d0,a0
    160c:	20bc 00ec 0000 	move.l #15466496,(a0)
  *cl++ = 0x00ee0000;
    1612:	202f 005c      	move.l 92(sp),d0
    1616:	2200           	move.l d0,d1
    1618:	5881           	addq.l #4,d1
    161a:	2f41 005c      	move.l d1,92(sp)
    161e:	2040           	movea.l d0,a0
    1620:	20bc 00ee 0000 	move.l #15597568,(a0)
  *cl++ = 0x00f00000;
    1626:	202f 005c      	move.l 92(sp),d0
    162a:	2200           	move.l d0,d1
    162c:	5881           	addq.l #4,d1
    162e:	2f41 005c      	move.l d1,92(sp)
    1632:	2040           	movea.l d0,a0
    1634:	20bc 00f0 0000 	move.l #15728640,(a0)
  *cl++ = 0x00f20000;
    163a:	202f 005c      	move.l 92(sp),d0
    163e:	2200           	move.l d0,d1
    1640:	5881           	addq.l #4,d1
    1642:	2f41 005c      	move.l d1,92(sp)
    1646:	2040           	movea.l d0,a0
    1648:	20bc 00f2 0000 	move.l #15859712,(a0)

  clpartinstruction = ClColor;
    164e:	2f7c 0000 a614 	move.l #42516,88(sp)
    1654:	0058 
  for(int i=0; i<32;i++)
    1656:	42af 004c      	clr.l 76(sp)
    165a:	6024           	bra.s 1680 <ClbuildZoom+0x204>
    *cl++ = *clpartinstruction++;
    165c:	222f 0058      	move.l 88(sp),d1
    1660:	2001           	move.l d1,d0
    1662:	5880           	addq.l #4,d0
    1664:	2f40 0058      	move.l d0,88(sp)
    1668:	202f 005c      	move.l 92(sp),d0
    166c:	2400           	move.l d0,d2
    166e:	5882           	addq.l #4,d2
    1670:	2f42 005c      	move.l d2,92(sp)
    1674:	2041           	movea.l d1,a0
    1676:	2210           	move.l (a0),d1
    1678:	2040           	movea.l d0,a0
    167a:	2081           	move.l d1,(a0)
  for(int i=0; i<32;i++)
    167c:	52af 004c      	addq.l #1,76(sp)
    1680:	701f           	moveq #31,d0
    1682:	b0af 004c      	cmp.l 76(sp),d0
    1686:	6cd4           	bge.s 165c <ClbuildZoom+0x1e0>
  
  ULONG cop2 = cl+3;
    1688:	700c           	moveq #12,d0
    168a:	d0af 005c      	add.l 92(sp),d0
    168e:	2f40 001c      	move.l d0,28(sp)
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    1692:	202f 001c      	move.l 28(sp),d0
    1696:	4240           	clr.w d0
    1698:	4840           	swap d0
    169a:	2200           	move.l d0,d1
    169c:	0681 0084 0000 	addi.l #8650752,d1
    16a2:	2f41 0018      	move.l d1,24(sp)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    16a6:	202f 001c      	move.l 28(sp),d0
    16aa:	0280 0000 ffff 	andi.l #65535,d0
    16b0:	2400           	move.l d0,d2
    16b2:	0682 0086 0000 	addi.l #8781824,d2
    16b8:	2f42 0014      	move.l d2,20(sp)
  //clpartinstruction = Cl102ZoomInit;
  *cl++ = cop2lch;
    16bc:	202f 005c      	move.l 92(sp),d0
    16c0:	2200           	move.l d0,d1
    16c2:	5881           	addq.l #4,d1
    16c4:	2f41 005c      	move.l d1,92(sp)
    16c8:	2040           	movea.l d0,a0
    16ca:	20af 0018      	move.l 24(sp),(a0)
  *cl++ = cop2lcl;
    16ce:	202f 005c      	move.l 92(sp),d0
    16d2:	2200           	move.l d0,d1
    16d4:	5881           	addq.l #4,d1
    16d6:	2f41 005c      	move.l d1,92(sp)
    16da:	2040           	movea.l d0,a0
    16dc:	20af 0014      	move.l 20(sp),(a0)
  *cl++ = 0x2c01ff00;
    16e0:	202f 005c      	move.l 92(sp),d0
    16e4:	2200           	move.l d0,d1
    16e6:	5881           	addq.l #4,d1
    16e8:	2f41 005c      	move.l d1,92(sp)
    16ec:	2040           	movea.l d0,a0
    16ee:	20bc 2c01 ff00 	move.l #738328320,(a0)

  ULONG cop2br1 = cop2 + ( (30)<<2);
    16f4:	7078           	moveq #120,d0
    16f6:	d0af 001c      	add.l 28(sp),d0
    16fa:	2f40 0010      	move.l d0,16(sp)
  ULONG cop2br2 = cop2 + ( (86)<<2);
    16fe:	222f 001c      	move.l 28(sp),d1
    1702:	0681 0000 0158 	addi.l #344,d1
    1708:	2f41 000c      	move.l d1,12(sp)
  clpartinstruction = Cl102ZoomRepeat;
    170c:	2f7c 0000 a710 	move.l #42768,88(sp)
    1712:	0058 
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    1714:	202f 0010      	move.l 16(sp),d0
    1718:	4240           	clr.w d0
    171a:	4840           	swap d0
    171c:	307c 0070      	movea.w #112,a0
    1720:	d1ef 0058      	adda.l 88(sp),a0
    1724:	0680 0084 0000 	addi.l #8650752,d0
    172a:	2080           	move.l d0,(a0)
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    172c:	202f 0010      	move.l 16(sp),d0
    1730:	0280 0000 ffff 	andi.l #65535,d0
    1736:	307c 0074      	movea.w #116,a0
    173a:	d1ef 0058      	adda.l 88(sp),a0
    173e:	0680 0086 0000 	addi.l #8781824,d0
    1744:	2080           	move.l d0,(a0)
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    1746:	202f 000c      	move.l 12(sp),d0
    174a:	4240           	clr.w d0
    174c:	4840           	swap d0
    174e:	206f 0058      	movea.l 88(sp),a0
    1752:	41e8 0150      	lea 336(a0),a0
    1756:	0680 0084 0000 	addi.l #8650752,d0
    175c:	2080           	move.l d0,(a0)
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    175e:	202f 000c      	move.l 12(sp),d0
    1762:	0280 0000 ffff 	andi.l #65535,d0
    1768:	206f 0058      	movea.l 88(sp),a0
    176c:	41e8 0154      	lea 340(a0),a0
    1770:	0680 0086 0000 	addi.l #8781824,d0
    1776:	2080           	move.l d0,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    1778:	42af 0048      	clr.l 72(sp)
    177c:	6024           	bra.s 17a2 <ClbuildZoom+0x326>
    *cl++ = *clpartinstruction++;
    177e:	222f 0058      	move.l 88(sp),d1
    1782:	2401           	move.l d1,d2
    1784:	5882           	addq.l #4,d2
    1786:	2f42 0058      	move.l d2,88(sp)
    178a:	202f 005c      	move.l 92(sp),d0
    178e:	2400           	move.l d0,d2
    1790:	5882           	addq.l #4,d2
    1792:	2f42 005c      	move.l d2,92(sp)
    1796:	2041           	movea.l d1,a0
    1798:	2210           	move.l (a0),d1
    179a:	2040           	movea.l d0,a0
    179c:	2081           	move.l d1,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    179e:	52af 0048      	addq.l #1,72(sp)
    17a2:	7071           	moveq #113,d0
    17a4:	b0af 0048      	cmp.l 72(sp),d0
    17a8:	6cd4           	bge.s 177e <ClbuildZoom+0x302>

   *cl++ = 0xfffffffe;
    17aa:	202f 005c      	move.l 92(sp),d0
    17ae:	2200           	move.l d0,d1
    17b0:	5881           	addq.l #4,d1
    17b2:	2f41 005c      	move.l d1,92(sp)
    17b6:	74fe           	moveq #-2,d2
    17b8:	2040           	movea.l d0,a0
    17ba:	2082           	move.l d2,(a0)

  return retval;
    17bc:	202f 0038      	move.l 56(sp),d0
}
    17c0:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    17c4:	4fef 0054      	lea 84(sp),sp
    17c8:	4e75           	rts

000017ca <PrepareDisplayZoom>:

 int PrepareDisplayZoom() {
    17ca:	4fef ffb8      	lea -72(sp),sp
    17ce:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildZoom();
    17d2:	4eba fca8      	jsr 147c <ClbuildZoom>(pc)
    17d6:	23c0 004d 2c0c 	move.l d0,4d2c0c <Copperlist1>
  Copperlist2 = ClbuildZoom();
    17dc:	4eba fc9e      	jsr 147c <ClbuildZoom>(pc)
    17e0:	23c0 004d 2c10 	move.l d0,4d2c10 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    17e6:	2f7c 0000 df20 	move.l #57120,80(sp)
    17ec:	0050 
    17ee:	7002           	moveq #2,d0
    17f0:	2f40 004c      	move.l d0,76(sp)
    17f4:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    17fa:	2c40           	movea.l d0,a6
    17fc:	202f 0050      	move.l 80(sp),d0
    1800:	222f 004c      	move.l 76(sp),d1
    1804:	4eae ff3a      	jsr -198(a6)
    1808:	2f40 0048      	move.l d0,72(sp)
    180c:	202f 0048      	move.l 72(sp),d0
    1810:	23c0 004d 2c04 	move.l d0,4d2c04 <Bitplane1>
  if(Bitplane1 == 0) {
    1816:	2039 004d 2c04 	move.l 4d2c04 <Bitplane1>,d0
    181c:	6658           	bne.s 1876 <PrepareDisplayZoom+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    181e:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    1824:	2c40           	movea.l d0,a6
    1826:	4eae ffc4      	jsr -60(a6)
    182a:	2f40 0044      	move.l d0,68(sp)
    182e:	202f 0044      	move.l 68(sp),d0
    1832:	2f40 0040      	move.l d0,64(sp)
    1836:	2f7c 0000 7cad 	move.l #31917,60(sp)
    183c:	003c 
    183e:	7026           	moveq #38,d0
    1840:	2f40 0038      	move.l d0,56(sp)
    1844:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    184a:	2c40           	movea.l d0,a6
    184c:	222f 0040      	move.l 64(sp),d1
    1850:	242f 003c      	move.l 60(sp),d2
    1854:	262f 0038      	move.l 56(sp),d3
    1858:	4eae ffd0      	jsr -48(a6)
    185c:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    1860:	7001           	moveq #1,d0
    1862:	2f40 0030      	move.l d0,48(sp)
    1866:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    186c:	2c40           	movea.l d0,a6
    186e:	222f 0030      	move.l 48(sp),d1
    1872:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    1876:	2039 004d 2c04 	move.l 4d2c04 <Bitplane1>,d0
    187c:	23c0 004d 2c14 	move.l d0,4d2c14 <DrawBuffer>
  DrawCopper = Copperlist1;
    1882:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    1888:	23c0 004d 2c1c 	move.l d0,4d2c1c <DrawCopper>
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    188e:	2f7c 0000 df20 	move.l #57120,44(sp)
    1894:	002c 
    1896:	7002           	moveq #2,d0
    1898:	2f40 0028      	move.l d0,40(sp)
    189c:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    18a2:	2c40           	movea.l d0,a6
    18a4:	202f 002c      	move.l 44(sp),d0
    18a8:	222f 0028      	move.l 40(sp),d1
    18ac:	4eae ff3a      	jsr -198(a6)
    18b0:	2f40 0024      	move.l d0,36(sp)
    18b4:	202f 0024      	move.l 36(sp),d0
    18b8:	23c0 004d 2c08 	move.l d0,4d2c08 <Bitplane2>
  if(Bitplane2 == 0) {
    18be:	2039 004d 2c08 	move.l 4d2c08 <Bitplane2>,d0
    18c4:	6658           	bne.s 191e <PrepareDisplayZoom+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    18c6:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    18cc:	2c40           	movea.l d0,a6
    18ce:	4eae ffc4      	jsr -60(a6)
    18d2:	2f40 0020      	move.l d0,32(sp)
    18d6:	202f 0020      	move.l 32(sp),d0
    18da:	2f40 001c      	move.l d0,28(sp)
    18de:	2f7c 0000 7cd4 	move.l #31956,24(sp)
    18e4:	0018 
    18e6:	7026           	moveq #38,d0
    18e8:	2f40 0014      	move.l d0,20(sp)
    18ec:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    18f2:	2c40           	movea.l d0,a6
    18f4:	222f 001c      	move.l 28(sp),d1
    18f8:	242f 0018      	move.l 24(sp),d2
    18fc:	262f 0014      	move.l 20(sp),d3
    1900:	4eae ffd0      	jsr -48(a6)
    1904:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    1908:	7001           	moveq #1,d0
    190a:	2f40 000c      	move.l d0,12(sp)
    190e:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    1914:	2c40           	movea.l d0,a6
    1916:	222f 000c      	move.l 12(sp),d1
    191a:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    191e:	2039 004d 2c08 	move.l 4d2c08 <Bitplane2>,d0
    1924:	23c0 004d 2c18 	move.l d0,4d2c18 <ViewBuffer>
  ViewCopper = Copperlist2; 
    192a:	2039 004d 2c10 	move.l 4d2c10 <Copperlist2>,d0
    1930:	23c0 004d 2c20 	move.l d0,4d2c20 <ViewCopper>
  return 0;
    1936:	7000           	moveq #0,d0
}
    1938:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    193c:	4fef 0048      	lea 72(sp),sp
    1940:	4e75           	rts

00001942 <Init_Blit>:

void Init_Blit() {
  hw->bltafwm = 0xffff;
    1942:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    1948:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    194e:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    1954:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    195a:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    1960:	317c 0026 0064 	move.w #38,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1966:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    196c:	317c 0026 0062 	move.w #38,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1972:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    1978:	317c 0026 0066 	move.w #38,102(a0)
}
    197e:	4e75           	rts

00001980 <Init_Blit2>:


void Init_Blit2() {
  hw->bltafwm = 0xffff;
    1980:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    1986:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    198c:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    1992:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = 36;
    1998:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    199e:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = 76;
    19a4:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    19aa:	317c 004c 0062 	move.w #76,98(a0)
  hw->bltdmod = ZMLINESIZE2 - 4;
    19b0:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    19b6:	317c 0028 0066 	move.w #40,102(a0)
}
    19bc:	4e75           	rts

000019be <Init_ZoomBlit>:

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
    19be:	4fef fff4      	lea -12(sp),sp
    19c2:	206f 0010      	movea.l 16(sp),a0
    19c6:	222f 0014      	move.l 20(sp),d1
    19ca:	202f 0018      	move.l 24(sp),d0
    19ce:	3048           	movea.w a0,a0
    19d0:	3f48 0004      	move.w a0,4(sp)
    19d4:	3201           	move.w d1,d1
    19d6:	3f41 0002      	move.w d1,2(sp)
    19da:	3000           	move.w d0,d0
    19dc:	3e80           	move.w d0,(sp)
  ZoomBlit_Increment4SrcA = 0;
    19de:	4279 004d 2c5a 	clr.w 4d2c5a <ZoomBlit_Increment4SrcA>

  UWORD colnr = nextzoom - startofword - 1;                                                                          
    19e4:	302f 0002      	move.w 2(sp),d0
    19e8:	906f 0004      	sub.w 4(sp),d0
    19ec:	3200           	move.w d0,d1
    19ee:	5341           	subq.w #1,d1
    19f0:	3f41 0008      	move.w d1,8(sp)
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
    19f4:	3017           	move.w (sp),d0
    19f6:	720c           	moveq #12,d1
    19f8:	e368           	lsl.w d1,d0
    19fa:	3f40 0006      	move.w d0,6(sp)
  UWORD shifta;
  if( shiftright == 0) {
    19fe:	4a57           	tst.w (sp)
    1a00:	6610           	bne.s 1a12 <Init_ZoomBlit+0x54>
    ZoomBlit_Increment4SrcA = 1;
    1a02:	33fc 0001 004d 	move.w #1,4d2c5a <ZoomBlit_Increment4SrcA>
    1a08:	2c5a 
    shifta = 15 << 12;
    1a0a:	3f7c f000 000a 	move.w #-4096,10(sp)
    1a10:	600c           	bra.s 1a1e <Init_ZoomBlit+0x60>
  } else {
    shifta = (shiftright - 1) << 12;
    1a12:	3017           	move.w (sp),d0
    1a14:	5340           	subq.w #1,d0
    1a16:	720c           	moveq #12,d1
    1a18:	e368           	lsl.w d1,d0
    1a1a:	3f40 000a      	move.w d0,10(sp)
  }
  WaitBlt(); 
    1a1e:	4eba e694      	jsr b4 <WaitBlt>(pc)
  hw->bltcon1 = shiftb; 
    1a22:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    1a28:	316f 0006 0042 	move.w 6(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1a2e:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    1a34:	302f 000a      	move.w 10(sp),d0
    1a38:	0640 0de4      	addi.w #3556,d0
    1a3c:	3140 0040      	move.w d0,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1a40:	7000           	moveq #0,d0
    1a42:	302f 0008      	move.w 8(sp),d0
    1a46:	7210           	moveq #16,d1
    1a48:	9280           	sub.l d0,d1
    1a4a:	7000           	moveq #0,d0
    1a4c:	4640           	not.w d0
    1a4e:	e3a8           	lsl.l d1,d0
    1a50:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    1a56:	2000           	move.l d0,d0
    1a58:	3140 0070      	move.w d0,112(a0)
}
    1a5c:	4fef 000c      	lea 12(sp),sp
    1a60:	4e75           	rts

00001a62 <Init_Copy>:

void Init_Copy( WORD shift) {
    1a62:	598f           	subq.l #4,sp
    1a64:	202f 0008      	move.l 8(sp),d0
    1a68:	3000           	move.w d0,d0
    1a6a:	3e80           	move.w d0,(sp)
  UWORD shiftright = shift << 12;
    1a6c:	3017           	move.w (sp),d0
    1a6e:	720c           	moveq #12,d1
    1a70:	e368           	lsl.w d1,d0
    1a72:	3f40 0002      	move.w d0,2(sp)
  WaitBlt();
    1a76:	4eba e63c      	jsr b4 <WaitBlt>(pc)
  hw->bltcon0 = 0x9f0 + shiftright;
    1a7a:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    1a80:	302f 0002      	move.w 2(sp),d0
    1a84:	0640 09f0      	addi.w #2544,d0
    1a88:	3140 0040      	move.w d0,64(a0)
  hw->bltcon1 = 0;
    1a8c:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    1a92:	317c 0000 0042 	move.w #0,66(a0)
}
    1a98:	588f           	addq.l #4,sp
    1a9a:	4e75           	rts

00001a9c <Zoom_ZoomIntoPicture>:

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    1a9c:	4fef ffcc      	lea -52(sp),sp
    1aa0:	222f 0040      	move.l 64(sp),d1
    1aa4:	202f 0044      	move.l 68(sp),d0
    1aa8:	3201           	move.w d1,d1
    1aaa:	3f41 0002      	move.w d1,2(sp)
    1aae:	3000           	move.w d0,d0
    1ab0:	3e80           	move.w d0,(sp)
  
  WaitBlt();  
    1ab2:	4eba e600      	jsr b4 <WaitBlt>(pc)
  Init_Blit();
    1ab6:	4eba fe8a      	jsr 1942 <Init_Blit>(pc)
  WORD shiftright = 9;
    1aba:	3f7c 0009 0032 	move.w #9,50(sp)
  UWORD shifthoriz = 7;
    1ac0:	3f7c 0007 0030 	move.w #7,48(sp)
  UWORD startofword = 21*16;
    1ac6:	3f7c 0150 002e 	move.w #336,46(sp)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1acc:	322f 0002      	move.w 2(sp),d1
    1ad0:	3001           	move.w d1,d0
    1ad2:	d040           	add.w d0,d0
    1ad4:	d040           	add.w d0,d0
    1ad6:	d041           	add.w d1,d0
    1ad8:	d040           	add.w d0,d0
    1ada:	0640 014c      	addi.w #332,d0
    1ade:	3f40 002c      	move.w d0,44(sp)
    1ae2:	601a           	bra.s 1afe <Zoom_ZoomIntoPicture+0x62>
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    1ae4:	302f 002c      	move.w 44(sp),d0
    1ae8:	906f 0002      	sub.w 2(sp),d0
    1aec:	0640 ffed      	addi.w #-19,d0
    1af0:	3f40 002c      	move.w d0,44(sp)
    shiftright--;
    1af4:	302f 0032      	move.w 50(sp),d0
    1af8:	5340           	subq.w #1,d0
    1afa:	3f40 0032      	move.w d0,50(sp)
  while( nextzoom > 22 * 16) {
    1afe:	0c6f 0160 002c 	cmpi.w #352,44(sp)
    1b04:	6ede           	bgt.s 1ae4 <Zoom_ZoomIntoPicture+0x48>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
    1b06:	426f 002a      	clr.w 42(sp)
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    1b0a:	322f 0002      	move.w 2(sp),d1
    1b0e:	3001           	move.w d1,d0
    1b10:	d040           	add.w d0,d0
    1b12:	d040           	add.w d0,d0
    1b14:	d041           	add.w d1,d0
    1b16:	4440           	neg.w d0
    1b18:	0640 0012      	addi.w #18,d0
    1b1c:	3f40 0028      	move.w d0,40(sp)
    1b20:	601c           	bra.s 1b3e <Zoom_ZoomIntoPicture+0xa2>
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    1b22:	302f 0028      	move.w 40(sp),d0
    1b26:	d06f 0002      	add.w 2(sp),d0
    1b2a:	0640 0013      	addi.w #19,d0
    1b2e:	3f40 0028      	move.w d0,40(sp)
      shifthoriz--;
    1b32:	302f 0030      	move.w 48(sp),d0
    1b36:	3200           	move.w d0,d1
    1b38:	5341           	subq.w #1,d1
    1b3a:	3f41 0030      	move.w d1,48(sp)
  while( ZoomHorizontalStart < 0) {
    1b3e:	4a6f 0028      	tst.w 40(sp)
    1b42:	6dde           	blt.s 1b22 <Zoom_ZoomIntoPicture+0x86>
  } 

  for(int i=0;i<22;i++) {
    1b44:	42af 0024      	clr.l 36(sp)
    1b48:	6000 02ca      	bra.w 1e14 <Zoom_ZoomIntoPicture+0x378>

    ZoomHorizontal = ZoomHorizontalStart;
    1b4c:	33ef 0028 004d 	move.w 40(sp),4d2c76 <ZoomHorizontal>
    1b52:	2c76 

    WORD linesleft = 272;
    1b54:	3f7c 0110 0022 	move.w #272,34(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1b5a:	7000           	moveq #0,d0
    1b5c:	302f 0030      	move.w 48(sp),d0
    1b60:	7200           	moveq #0,d1
    1b62:	3217           	move.w (sp),d1
    1b64:	2f01           	move.l d1,-(sp)
    1b66:	2f00           	move.l d0,-(sp)
    1b68:	4eb9 0000 7114 	jsr 7114 <__mulsi3>
    1b6e:	508f           	addq.l #8,sp
    1b70:	2200           	move.l d0,d1
    1b72:	2001           	move.l d1,d0
    1b74:	d080           	add.l d0,d0
    1b76:	d081           	add.l d1,d0
    1b78:	2200           	move.l d0,d1
    1b7a:	e789           	lsl.l #3,d1
    1b7c:	9280           	sub.l d0,d1
    1b7e:	202f 0024      	move.l 36(sp),d0
    1b82:	9280           	sub.l d0,d1
    1b84:	2001           	move.l d1,d0
    1b86:	0680 8000 0013 	addi.l #-2147483629,d0
    1b8c:	d080           	add.l d0,d0
    1b8e:	222f 0038      	move.l 56(sp),d1
    1b92:	d280           	add.l d0,d1
    1b94:	2f41 001e      	move.l d1,30(sp)
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1b98:	202f 0024      	move.l 36(sp),d0
    1b9c:	7213           	moveq #19,d1
    1b9e:	9280           	sub.l d0,d1
    1ba0:	2001           	move.l d1,d0
    1ba2:	d081           	add.l d1,d0
    1ba4:	222f 003c      	move.l 60(sp),d1
    1ba8:	d280           	add.l d0,d1
    1baa:	2f41 001a      	move.l d1,26(sp)
    
    UWORD onestep = ZMLINESIZE/2*planes;
    1bae:	3017           	move.w (sp),d0
    1bb0:	c1fc 0015      	muls.w #21,d0
    1bb4:	3f40 0018      	move.w d0,24(sp)
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1bb8:	7000           	moveq #0,d0
    1bba:	302f 002e      	move.w 46(sp),d0
    1bbe:	306f 002c      	movea.w 44(sp),a0
    1bc2:	b1c0           	cmpa.l d0,a0
    1bc4:	6e00 0106      	bgt.w 1ccc <Zoom_ZoomIntoPicture+0x230>
      Init_Copy( shiftright);
    1bc8:	306f 0032      	movea.w 50(sp),a0
    1bcc:	2f08           	move.l a0,-(sp)
    1bce:	4eba fe92      	jsr 1a62 <Init_Copy>(pc)
    1bd2:	588f           	addq.l #4,sp
    1bd4:	6000 00ea      	bra.w 1cc0 <Zoom_ZoomIntoPicture+0x224>
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1bd8:	3039 004d 2c76 	move.w 4d2c76 <ZoomHorizontal>,d0
    1bde:	b06f 0022      	cmp.w 34(sp),d0
    1be2:	6c12           	bge.s 1bf6 <Zoom_ZoomIntoPicture+0x15a>
          linesleft -= ZoomHorizontal;
    1be4:	322f 0022      	move.w 34(sp),d1
    1be8:	3039 004d 2c76 	move.w 4d2c76 <ZoomHorizontal>,d0
    1bee:	9240           	sub.w d0,d1
    1bf0:	3f41 0022      	move.w d1,34(sp)
    1bf4:	600c           	bra.s 1c02 <Zoom_ZoomIntoPicture+0x166>
        } else {
          ZoomHorizontal = linesleft;
    1bf6:	33ef 0022 004d 	move.w 34(sp),4d2c76 <ZoomHorizontal>
    1bfc:	2c76 
          linesleft = 0;
    1bfe:	426f 0022      	clr.w 34(sp)
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
    1c02:	3039 004d 2c76 	move.w 4d2c76 <ZoomHorizontal>,d0
    1c08:	322f 0018      	move.w 24(sp),d1
    1c0c:	c3c0           	muls.w d0,d1
    1c0e:	3f41 000c      	move.w d1,12(sp)
        //Add aditional line
        if( linesleft>0) {
    1c12:	4a6f 0022      	tst.w 34(sp)
    1c16:	6f4c           	ble.s 1c64 <Zoom_ZoomIntoPicture+0x1c8>
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
    1c52:	4eba f30c      	jsr f60 <Zoom_CopyWord>(pc)
    1c56:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1c5a:	302f 0022      	move.w 34(sp),d0
    1c5e:	5340           	subq.w #1,d0
    1c60:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1c64:	3039 004d 2c76 	move.w 4d2c76 <ZoomHorizontal>,d0
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
    1c84:	4eba f2da      	jsr f60 <Zoom_CopyWord>(pc)
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
    1cba:	33c0 004d 2c76 	move.w d0,4d2c76 <ZoomHorizontal>
      while(linesleft > 0) {
    1cc0:	4a6f 0022      	tst.w 34(sp)
    1cc4:	6e00 ff12      	bgt.w 1bd8 <Zoom_ZoomIntoPicture+0x13c>
    1cc8:	6000 0140      	bra.w 1e0a <Zoom_ZoomIntoPicture+0x36e>
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
    1ce0:	4eba fcdc      	jsr 19be <Init_ZoomBlit>(pc)
    1ce4:	4fef 000c      	lea 12(sp),sp
      nextzoom -= (19 + zoomnr);
    1ce8:	302f 002c      	move.w 44(sp),d0
    1cec:	906f 0002      	sub.w 2(sp),d0
    1cf0:	0640 ffed      	addi.w #-19,d0
    1cf4:	3f40 002c      	move.w d0,44(sp)
    1cf8:	6000 00ea      	bra.w 1de4 <Zoom_ZoomIntoPicture+0x348>
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1cfc:	3039 004d 2c76 	move.w 4d2c76 <ZoomHorizontal>,d0
    1d02:	b06f 0022      	cmp.w 34(sp),d0
    1d06:	6c12           	bge.s 1d1a <Zoom_ZoomIntoPicture+0x27e>
          linesleft -= ZoomHorizontal;
    1d08:	322f 0022      	move.w 34(sp),d1
    1d0c:	3039 004d 2c76 	move.w 4d2c76 <ZoomHorizontal>,d0
    1d12:	9240           	sub.w d0,d1
    1d14:	3f41 0022      	move.w d1,34(sp)
    1d18:	600c           	bra.s 1d26 <Zoom_ZoomIntoPicture+0x28a>
        } else {
          ZoomHorizontal = linesleft;
    1d1a:	33ef 0022 004d 	move.w 34(sp),4d2c76 <ZoomHorizontal>
    1d20:	2c76 
          linesleft = 0;
    1d22:	426f 0022      	clr.w 34(sp)
        }
        UWORD size4blit = ZoomHorizontal*onestep;
    1d26:	3039 004d 2c76 	move.w 4d2c76 <ZoomHorizontal>,d0
    1d2c:	322f 0018      	move.w 24(sp),d1
    1d30:	c3c0           	muls.w d0,d1
    1d32:	3f41 0016      	move.w d1,22(sp)
        //Add aditional line
        if( linesleft>0) {
    1d36:	4a6f 0022      	tst.w 34(sp)
    1d3a:	6f4c           	ble.s 1d88 <Zoom_ZoomIntoPicture+0x2ec>
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
    1d76:	4eba f226      	jsr f9e <Zoom_ZoomBlit>(pc)
    1d7a:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1d7e:	302f 0022      	move.w 34(sp),d0
    1d82:	5340           	subq.w #1,d0
    1d84:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1d88:	3039 004d 2c76 	move.w 4d2c76 <ZoomHorizontal>,d0
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
    1da8:	4eba f1f4      	jsr f9e <Zoom_ZoomBlit>(pc)
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
    1dde:	33c0 004d 2c76 	move.w d0,4d2c76 <ZoomHorizontal>
      while( linesleft > 0) {
    1de4:	4a6f 0022      	tst.w 34(sp)
    1de8:	6e00 ff12      	bgt.w 1cfc <Zoom_ZoomIntoPicture+0x260>
      }
      shiftright--;  
    1dec:	302f 0032      	move.w 50(sp),d0
    1df0:	5340           	subq.w #1,d0
    1df2:	3f40 0032      	move.w d0,50(sp)
      if(shiftright < 0) {
    1df6:	6a12           	bpl.s 1e0a <Zoom_ZoomIntoPicture+0x36e>
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
    1e1a:	6c00 fd30      	bge.w 1b4c <Zoom_ZoomIntoPicture+0xb0>
  }
}
    1e1e:	4fef 0034      	lea 52(sp),sp
    1e22:	4e75           	rts

00001e24 <Zoom_SetBplPointers>:

void Zoom_SetBplPointers( UWORD *buffer, ULONG *copper) {
    1e24:	4fef ffb0      	lea -80(sp),sp
  //                   0  1  1   1   1   0   1   1    1    1    0    1    1    0    1    1
  //int zoomoffset[] = { 0, 0, 42, 42, 84, 84, 84, 126, 126, 168, 168, 168, 210, 210, 210, 332};
  //int zoomoffset[] = { 252, 210, 210, 210, 168, 168, 168, 126, 126, 84, 84, 84, 42, 42, 0, 0 };
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
    1e28:	204f           	movea.l sp,a0
    1e2a:	223c 0000 7d30 	move.l #32048,d1
    1e30:	7040           	moveq #64,d0
    1e32:	2f00           	move.l d0,-(sp)
    1e34:	2f01           	move.l d1,-(sp)
    1e36:	2f08           	move.l a0,-(sp)
    1e38:	4eba 4f7c      	jsr 6db6 <memcpy>(pc)
    1e3c:	4fef 000c      	lea 12(sp),sp

  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
    1e40:	3039 004d 2c72 	move.w 4d2c72 <Zoom_LevelOf102Zoom>,d0
    1e46:	3000           	move.w d0,d0
    1e48:	0280 0000 ffff 	andi.l #65535,d0
    1e4e:	d080           	add.l d0,d0
    1e50:	d080           	add.l d0,d0
    1e52:	41ef 0050      	lea 80(sp),a0
    1e56:	d1c0           	adda.l d0,a0
    1e58:	41e8 ffb0      	lea -80(a0),a0
    1e5c:	2010           	move.l (a0),d0
    1e5e:	d080           	add.l d0,d0
    1e60:	d0af 0054      	add.l 84(sp),d0
    1e64:	2f40 004c      	move.l d0,76(sp)
  /*ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;*/
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
    1e68:	7072           	moveq #114,d0
    1e6a:	d0af 0058      	add.l 88(sp),d0
    1e6e:	2f40 0048      	move.l d0,72(sp)
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1e72:	42af 0044      	clr.l 68(sp)
    1e76:	6036           	bra.s 1eae <Zoom_SetBplPointers+0x8a>
    UWORD highword = (ULONG)plane2set >> 16;
    1e78:	202f 004c      	move.l 76(sp),d0
    1e7c:	4240           	clr.w d0
    1e7e:	4840           	swap d0
    1e80:	3f40 0042      	move.w d0,66(sp)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1e84:	3f6f 004e 0040 	move.w 78(sp),64(sp)
    *posofcopper = highword;
    1e8a:	206f 0048      	movea.l 72(sp),a0
    1e8e:	30af 0042      	move.w 66(sp),(a0)
    posofcopper += 2;
    1e92:	58af 0048      	addq.l #4,72(sp)
    *posofcopper = lowword;
    1e96:	206f 0048      	movea.l 72(sp),a0
    1e9a:	30af 0040      	move.w 64(sp),(a0)
    posofcopper += 2;
    1e9e:	58af 0048      	addq.l #4,72(sp)
    plane2set += 42*268; //Next plane
    1ea2:	06af 0000 2bf8 	addi.l #11256,76(sp)
    1ea8:	004c 
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1eaa:	52af 0044      	addq.l #1,68(sp)
    1eae:	7004           	moveq #4,d0
    1eb0:	b0af 0044      	cmp.l 68(sp),d0
    1eb4:	6cc2           	bge.s 1e78 <Zoom_SetBplPointers+0x54>
  }
  
}
    1eb6:	4fef 0050      	lea 80(sp),sp
    1eba:	4e75           	rts

00001ebc <Zoom_SwapBuffers>:

void Zoom_SwapBuffers( UWORD zoomlevel) {
    1ebc:	598f           	subq.l #4,sp
    1ebe:	2f02           	move.l d2,-(sp)
    1ec0:	202f 000c      	move.l 12(sp),d0
    1ec4:	3000           	move.w d0,d0
    1ec6:	3f40 0006      	move.w d0,6(sp)

  ViewBuffer = rawzoom + (42*268*5*zoomlevel);
    1eca:	2439 0000 b8a8 	move.l b8a8 <rawzoom>,d2
    1ed0:	7000           	moveq #0,d0
    1ed2:	302f 0006      	move.w 6(sp),d0
    1ed6:	2f3c 0000 dbd8 	move.l #56280,-(sp)
    1edc:	2f00           	move.l d0,-(sp)
    1ede:	4eb9 0000 7114 	jsr 7114 <__mulsi3>
    1ee4:	508f           	addq.l #8,sp
    1ee6:	d082           	add.l d2,d0
    1ee8:	23c0 004d 2c18 	move.l d0,4d2c18 <ViewBuffer>
  /*ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;*/
}
    1eee:	241f           	move.l (sp)+,d2
    1ef0:	588f           	addq.l #4,sp
    1ef2:	4e75           	rts

00001ef4 <Test_Zoom2>:
#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
    1ef4:	4fef ff00      	lea -256(sp),sp
    1ef8:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  //Test Zoomlevel 1
  volatile ULONG *srcsmall = AllocMem( 80, MEMF_CHIP);
    1efc:	7050           	moveq #80,d0
    1efe:	2f40 00f0      	move.l d0,240(sp)
    1f02:	7002           	moveq #2,d0
    1f04:	2f40 00ec      	move.l d0,236(sp)
    1f08:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    1f0e:	2c40           	movea.l d0,a6
    1f10:	202f 00f0      	move.l 240(sp),d0
    1f14:	222f 00ec      	move.l 236(sp),d1
    1f18:	4eae ff3a      	jsr -198(a6)
    1f1c:	2f40 00e8      	move.l d0,232(sp)
    1f20:	202f 00e8      	move.l 232(sp),d0
    1f24:	2f40 00e4      	move.l d0,228(sp)
  if( srcsmall == 0) {
    1f28:	6646           	bne.s 1f70 <Test_Zoom2+0x7c>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcsmall\n", 42);
    1f2a:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    1f30:	2c40           	movea.l d0,a6
    1f32:	4eae ffc4      	jsr -60(a6)
    1f36:	2f40 001c      	move.l d0,28(sp)
    1f3a:	202f 001c      	move.l 28(sp),d0
    1f3e:	2f40 0018      	move.l d0,24(sp)
    1f42:	2f7c 0000 7d70 	move.l #32112,20(sp)
    1f48:	0014 
    1f4a:	702a           	moveq #42,d0
    1f4c:	2f40 0010      	move.l d0,16(sp)
    1f50:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    1f56:	2c40           	movea.l d0,a6
    1f58:	222f 0018      	move.l 24(sp),d1
    1f5c:	242f 0014      	move.l 20(sp),d2
    1f60:	262f 0010      	move.l 16(sp),d3
    1f64:	4eae ffd0      	jsr -48(a6)
    1f68:	2f40 000c      	move.l d0,12(sp)
    1f6c:	6000 0560      	bra.w 24ce <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong(srcsmall, 0xaaaaaaaa, 2, 10, 0);
    1f70:	42a7           	clr.l -(sp)
    1f72:	4878 000a      	pea a <_start+0xa>
    1f76:	4878 0002      	pea 2 <_start+0x2>
    1f7a:	2f3c aaaa aaaa 	move.l #-1431655766,-(sp)
    1f80:	2f2f 00f4      	move.l 244(sp),-(sp)
    1f84:	4eba e296      	jsr 21c <Utils_FillLong>(pc)
    1f88:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *srcbig = AllocMem( 160, MEMF_CHIP);
    1f8c:	2f7c 0000 00a0 	move.l #160,224(sp)
    1f92:	00e0 
    1f94:	7002           	moveq #2,d0
    1f96:	2f40 00dc      	move.l d0,220(sp)
    1f9a:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    1fa0:	2c40           	movea.l d0,a6
    1fa2:	202f 00e0      	move.l 224(sp),d0
    1fa6:	222f 00dc      	move.l 220(sp),d1
    1faa:	4eae ff3a      	jsr -198(a6)
    1fae:	2f40 00d8      	move.l d0,216(sp)
    1fb2:	202f 00d8      	move.l 216(sp),d0
    1fb6:	2f40 00d4      	move.l d0,212(sp)
    if( srcbig == 0) {
    1fba:	6646           	bne.s 2002 <Test_Zoom2+0x10e>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcbig\n", 40);
    1fbc:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    1fc2:	2c40           	movea.l d0,a6
    1fc4:	4eae ffc4      	jsr -60(a6)
    1fc8:	2f40 0030      	move.l d0,48(sp)
    1fcc:	202f 0030      	move.l 48(sp),d0
    1fd0:	2f40 002c      	move.l d0,44(sp)
    1fd4:	2f7c 0000 7d9b 	move.l #32155,40(sp)
    1fda:	0028 
    1fdc:	7028           	moveq #40,d0
    1fde:	2f40 0024      	move.l d0,36(sp)
    1fe2:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    1fe8:	2c40           	movea.l d0,a6
    1fea:	222f 002c      	move.l 44(sp),d1
    1fee:	242f 0028      	move.l 40(sp),d2
    1ff2:	262f 0024      	move.l 36(sp),d3
    1ff6:	4eae ffd0      	jsr -48(a6)
    1ffa:	2f40 0020      	move.l d0,32(sp)
    1ffe:	6000 04ce      	bra.w 24ce <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong( srcbig, 0x55555555, 2, 20, 0);
    2002:	42a7           	clr.l -(sp)
    2004:	4878 0014      	pea 14 <_start+0x14>
    2008:	4878 0002      	pea 2 <_start+0x2>
    200c:	2f3c 5555 5555 	move.l #1431655765,-(sp)
    2012:	2f2f 00e4      	move.l 228(sp),-(sp)
    2016:	4eba e204      	jsr 21c <Utils_FillLong>(pc)
    201a:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *target = AllocMem( 168, MEMF_CHIP);
    201e:	2f7c 0000 00a8 	move.l #168,208(sp)
    2024:	00d0 
    2026:	7002           	moveq #2,d0
    2028:	2f40 00cc      	move.l d0,204(sp)
    202c:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    2032:	2c40           	movea.l d0,a6
    2034:	202f 00d0      	move.l 208(sp),d0
    2038:	222f 00cc      	move.l 204(sp),d1
    203c:	4eae ff3a      	jsr -198(a6)
    2040:	2f40 00c8      	move.l d0,200(sp)
    2044:	202f 00c8      	move.l 200(sp),d0
    2048:	2f40 00c4      	move.l d0,196(sp)
  if( target == 0) {
    204c:	6646           	bne.s 2094 <Test_Zoom2+0x1a0>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
    204e:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2054:	2c40           	movea.l d0,a6
    2056:	4eae ffc4      	jsr -60(a6)
    205a:	2f40 0044      	move.l d0,68(sp)
    205e:	202f 0044      	move.l 68(sp),d0
    2062:	2f40 0040      	move.l d0,64(sp)
    2066:	2f7c 0000 7dc4 	move.l #32196,60(sp)
    206c:	003c 
    206e:	7028           	moveq #40,d0
    2070:	2f40 0038      	move.l d0,56(sp)
    2074:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    207a:	2c40           	movea.l d0,a6
    207c:	222f 0040      	move.l 64(sp),d1
    2080:	242f 003c      	move.l 60(sp),d2
    2084:	262f 0038      	move.l 56(sp),d3
    2088:	4eae ffd0      	jsr -48(a6)
    208c:	2f40 0034      	move.l d0,52(sp)
    2090:	6000 043c      	bra.w 24ce <Test_Zoom2+0x5da>
    return;
  }
  WaitBlt();
    2094:	4eba e01e      	jsr b4 <WaitBlt>(pc)
  hw->bltafwm = 0xffff;
    2098:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    209e:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    20a4:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    20aa:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltdmod = 38;
    20b0:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    20b6:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcon1 = 1 << 12; //Shift src big
    20bc:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    20c2:	317c 1000 0042 	move.w #4096,66(a0)
  hw->bltcon0 = 0xde4; //Chanell settings and Shift src small
    20c8:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    20ce:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltcdat = 0x8000; //Show channel small if 1 else channel big
    20d4:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    20da:	317c 8000 0070 	move.w #-32768,112(a0)
  //srcbig-shift   0010 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sbbb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    20e0:	4878 0001      	pea 1 <_start+0x1>
    20e4:	4878 004e      	pea 4e <_start+0x4e>
    20e8:	4878 0026      	pea 26 <_start+0x26>
    20ec:	4878 0002      	pea 2 <_start+0x2>
    20f0:	2f2f 00d4      	move.l 212(sp),-(sp)
    20f4:	2f2f 00e8      	move.l 232(sp),-(sp)
    20f8:	2f2f 00fc      	move.l 252(sp),-(sp)
    20fc:	4eba ef04      	jsr 1002 <Zoom_ZoomBlit2>(pc)
    2100:	4fef 001c      	lea 28(sp),sp
  UWORD *tmp = (UWORD *)target;
    2104:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    210a:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    2110:	2c40           	movea.l d0,a6
    2112:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2116:	42af 0104      	clr.l 260(sp)
    211a:	605c           	bra.s 2178 <Test_Zoom2+0x284>
    if( *tmp != 0xaaaa ) {
    211c:	206f 0108      	movea.l 264(sp),a0
    2120:	3010           	move.w (a0),d0
    2122:	0c40 aaaa      	cmpi.w #-21846,d0
    2126:	6746           	beq.s 216e <Test_Zoom2+0x27a>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 1 failed\n", 40);
    2128:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    212e:	2c40           	movea.l d0,a6
    2130:	4eae ffc4      	jsr -60(a6)
    2134:	2f40 0058      	move.l d0,88(sp)
    2138:	202f 0058      	move.l 88(sp),d0
    213c:	2f40 0054      	move.l d0,84(sp)
    2140:	2f7c 0000 7ded 	move.l #32237,80(sp)
    2146:	0050 
    2148:	7028           	moveq #40,d0
    214a:	2f40 004c      	move.l d0,76(sp)
    214e:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2154:	2c40           	movea.l d0,a6
    2156:	222f 0054      	move.l 84(sp),d1
    215a:	242f 0050      	move.l 80(sp),d2
    215e:	262f 004c      	move.l 76(sp),d3
    2162:	4eae ffd0      	jsr -48(a6)
    2166:	2f40 0048      	move.l d0,72(sp)
    216a:	6000 0362      	bra.w 24ce <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    216e:	7028           	moveq #40,d0
    2170:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2174:	52af 0104      	addq.l #1,260(sp)
    2178:	7001           	moveq #1,d0
    217a:	b0af 0104      	cmp.l 260(sp),d0
    217e:	6c9c           	bge.s 211c <Test_Zoom2+0x228>
  //srcbig-shift   0001 0101 0101 0101
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       ssbb bbbb bbbb bbbb
  //result:        1001 0101 0101 0101

  hw->bltcon1 = 2 << 12; //Shift src big
    2180:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    2186:	317c 2000 0042 	move.w #8192,66(a0)
  hw->bltcdat = 0xc000; //Show channel small if 1 else channel big
    218c:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    2192:	317c c000 0070 	move.w #-16384,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2198:	4878 0001      	pea 1 <_start+0x1>
    219c:	4878 004e      	pea 4e <_start+0x4e>
    21a0:	4878 0026      	pea 26 <_start+0x26>
    21a4:	4878 0002      	pea 2 <_start+0x2>
    21a8:	2f2f 00d4      	move.l 212(sp),-(sp)
    21ac:	2f2f 00e8      	move.l 232(sp),-(sp)
    21b0:	2f2f 00fc      	move.l 252(sp),-(sp)
    21b4:	4eba ee4c      	jsr 1002 <Zoom_ZoomBlit2>(pc)
    21b8:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    21bc:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    21c2:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    21c8:	2c40           	movea.l d0,a6
    21ca:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    21ce:	42af 0100      	clr.l 256(sp)
    21d2:	605c           	bra.s 2230 <Test_Zoom2+0x33c>
    if( *tmp != 0x9555 ) {
    21d4:	206f 0108      	movea.l 264(sp),a0
    21d8:	3010           	move.w (a0),d0
    21da:	0c40 9555      	cmpi.w #-27307,d0
    21de:	6746           	beq.s 2226 <Test_Zoom2+0x332>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 2 failed\n", 40);
    21e0:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    21e6:	2c40           	movea.l d0,a6
    21e8:	4eae ffc4      	jsr -60(a6)
    21ec:	2f40 006c      	move.l d0,108(sp)
    21f0:	202f 006c      	move.l 108(sp),d0
    21f4:	2f40 0068      	move.l d0,104(sp)
    21f8:	2f7c 0000 7e16 	move.l #32278,100(sp)
    21fe:	0064 
    2200:	7028           	moveq #40,d0
    2202:	2f40 0060      	move.l d0,96(sp)
    2206:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    220c:	2c40           	movea.l d0,a6
    220e:	222f 0068      	move.l 104(sp),d1
    2212:	242f 0064      	move.l 100(sp),d2
    2216:	262f 0060      	move.l 96(sp),d3
    221a:	4eae ffd0      	jsr -48(a6)
    221e:	2f40 005c      	move.l d0,92(sp)
    2222:	6000 02aa      	bra.w 24ce <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    2226:	7028           	moveq #40,d0
    2228:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    222c:	52af 0100      	addq.l #1,256(sp)
    2230:	7001           	moveq #1,d0
    2232:	b0af 0100      	cmp.l 256(sp),d0
    2236:	6c9c           	bge.s 21d4 <Test_Zoom2+0x2e0>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2238:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    223e:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    2244:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    224a:	317c e000 0070 	move.w #-8192,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2250:	4878 0001      	pea 1 <_start+0x1>
    2254:	4878 004e      	pea 4e <_start+0x4e>
    2258:	4878 0026      	pea 26 <_start+0x26>
    225c:	4878 0002      	pea 2 <_start+0x2>
    2260:	2f2f 00d4      	move.l 212(sp),-(sp)
    2264:	2f2f 00e8      	move.l 232(sp),-(sp)
    2268:	2f2f 00fc      	move.l 252(sp),-(sp)
    226c:	4eba ed94      	jsr 1002 <Zoom_ZoomBlit2>(pc)
    2270:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2274:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    227a:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    2280:	2c40           	movea.l d0,a6
    2282:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2286:	42af 00fc      	clr.l 252(sp)
    228a:	605c           	bra.s 22e8 <Test_Zoom2+0x3f4>
    if( *tmp != 0xaaaa ) {
    228c:	206f 0108      	movea.l 264(sp),a0
    2290:	3010           	move.w (a0),d0
    2292:	0c40 aaaa      	cmpi.w #-21846,d0
    2296:	6746           	beq.s 22de <Test_Zoom2+0x3ea>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    2298:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    229e:	2c40           	movea.l d0,a6
    22a0:	4eae ffc4      	jsr -60(a6)
    22a4:	2f40 0080      	move.l d0,128(sp)
    22a8:	202f 0080      	move.l 128(sp),d0
    22ac:	2f40 007c      	move.l d0,124(sp)
    22b0:	2f7c 0000 7e3f 	move.l #32319,120(sp)
    22b6:	0078 
    22b8:	7028           	moveq #40,d0
    22ba:	2f40 0074      	move.l d0,116(sp)
    22be:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    22c4:	2c40           	movea.l d0,a6
    22c6:	222f 007c      	move.l 124(sp),d1
    22ca:	242f 0078      	move.l 120(sp),d2
    22ce:	262f 0074      	move.l 116(sp),d3
    22d2:	4eae ffd0      	jsr -48(a6)
    22d6:	2f40 0070      	move.l d0,112(sp)
    22da:	6000 01f2      	bra.w 24ce <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    22de:	7028           	moveq #40,d0
    22e0:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    22e4:	52af 00fc      	addq.l #1,252(sp)
    22e8:	7001           	moveq #1,d0
    22ea:	b0af 00fc      	cmp.l 252(sp),d0
    22ee:	6c9c           	bge.s 228c <Test_Zoom2+0x398>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    22f0:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    22f6:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    22fc:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    2302:	317c e000 0070 	move.w #-8192,112(a0)

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2308:	4878 0001      	pea 1 <_start+0x1>
    230c:	4878 004e      	pea 4e <_start+0x4e>
    2310:	4878 0026      	pea 26 <_start+0x26>
    2314:	4878 0002      	pea 2 <_start+0x2>
    2318:	2f2f 00d4      	move.l 212(sp),-(sp)
    231c:	2f2f 00e8      	move.l 232(sp),-(sp)
    2320:	2f2f 00fc      	move.l 252(sp),-(sp)
    2324:	4eba ecdc      	jsr 1002 <Zoom_ZoomBlit2>(pc)
    2328:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    232c:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2332:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    2338:	2c40           	movea.l d0,a6
    233a:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    233e:	42af 00f8      	clr.l 248(sp)
    2342:	605c           	bra.s 23a0 <Test_Zoom2+0x4ac>
    if( *tmp != 0xaaaa ) {
    2344:	206f 0108      	movea.l 264(sp),a0
    2348:	3010           	move.w (a0),d0
    234a:	0c40 aaaa      	cmpi.w #-21846,d0
    234e:	6746           	beq.s 2396 <Test_Zoom2+0x4a2>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    2350:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2356:	2c40           	movea.l d0,a6
    2358:	4eae ffc4      	jsr -60(a6)
    235c:	2f40 0094      	move.l d0,148(sp)
    2360:	202f 0094      	move.l 148(sp),d0
    2364:	2f40 0090      	move.l d0,144(sp)
    2368:	2f7c 0000 7e3f 	move.l #32319,140(sp)
    236e:	008c 
    2370:	7028           	moveq #40,d0
    2372:	2f40 0088      	move.l d0,136(sp)
    2376:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    237c:	2c40           	movea.l d0,a6
    237e:	222f 0090      	move.l 144(sp),d1
    2382:	242f 008c      	move.l 140(sp),d2
    2386:	262f 0088      	move.l 136(sp),d3
    238a:	4eae ffd0      	jsr -48(a6)
    238e:	2f40 0084      	move.l d0,132(sp)
    2392:	6000 013a      	bra.w 24ce <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    2396:	7028           	moveq #40,d0
    2398:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    239c:	52af 00f8      	addq.l #1,248(sp)
    23a0:	7001           	moveq #1,d0
    23a2:	b0af 00f8      	cmp.l 248(sp),d0
    23a6:	6c9c           	bge.s 2344 <Test_Zoom2+0x450>
  //srcsmall:            1010 1010 1010 1010
  //srcsmall-shift:      0101 0101 0101 0101
  //pattern:             sssb bbbb bbbb bbbb
  //result:              0100 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    23a8:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    23ae:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    23b4:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    23ba:	317c e000 0070 	move.w #-8192,112(a0)
  hw->bltcon0 = 0xde4 + (1 << 12); //Chanell settings and Shift src small
    23c0:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    23c6:	317c 1de4 0040 	move.w #7652,64(a0)
 
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    23cc:	4878 0001      	pea 1 <_start+0x1>
    23d0:	4878 004e      	pea 4e <_start+0x4e>
    23d4:	4878 0026      	pea 26 <_start+0x26>
    23d8:	4878 0002      	pea 2 <_start+0x2>
    23dc:	2f2f 00d4      	move.l 212(sp),-(sp)
    23e0:	2f2f 00e8      	move.l 232(sp),-(sp)
    23e4:	2f2f 00fc      	move.l 252(sp),-(sp)
    23e8:	4eba ec18      	jsr 1002 <Zoom_ZoomBlit2>(pc)
    23ec:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    23f0:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    23f6:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    23fc:	2c40           	movea.l d0,a6
    23fe:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2402:	42af 00f4      	clr.l 244(sp)
    2406:	605a           	bra.s 2462 <Test_Zoom2+0x56e>
    if( *tmp != 0x4aaa ) {
    2408:	206f 0108      	movea.l 264(sp),a0
    240c:	3010           	move.w (a0),d0
    240e:	0c40 4aaa      	cmpi.w #19114,d0
    2412:	6744           	beq.s 2458 <Test_Zoom2+0x564>
      Write( Output(), "Test_Zoom2: Test for shifting a failed\n", 39);
    2414:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    241a:	2c40           	movea.l d0,a6
    241c:	4eae ffc4      	jsr -60(a6)
    2420:	2f40 00a8      	move.l d0,168(sp)
    2424:	202f 00a8      	move.l 168(sp),d0
    2428:	2f40 00a4      	move.l d0,164(sp)
    242c:	2f7c 0000 7e68 	move.l #32360,160(sp)
    2432:	00a0 
    2434:	7027           	moveq #39,d0
    2436:	2f40 009c      	move.l d0,156(sp)
    243a:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2440:	2c40           	movea.l d0,a6
    2442:	222f 00a4      	move.l 164(sp),d1
    2446:	242f 00a0      	move.l 160(sp),d2
    244a:	262f 009c      	move.l 156(sp),d3
    244e:	4eae ffd0      	jsr -48(a6)
    2452:	2f40 0098      	move.l d0,152(sp)
    2456:	6076           	bra.s 24ce <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    2458:	7028           	moveq #40,d0
    245a:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    245e:	52af 00f4      	addq.l #1,244(sp)
    2462:	7001           	moveq #1,d0
    2464:	b0af 00f4      	cmp.l 244(sp),d0
    2468:	6c9e           	bge.s 2408 <Test_Zoom2+0x514>

  FreeMem( srcsmall, 80);
    246a:	2f6f 00e4 00c0 	move.l 228(sp),192(sp)
    2470:	7050           	moveq #80,d0
    2472:	2f40 00bc      	move.l d0,188(sp)
    2476:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    247c:	2c40           	movea.l d0,a6
    247e:	226f 00c0      	movea.l 192(sp),a1
    2482:	202f 00bc      	move.l 188(sp),d0
    2486:	4eae ff2e      	jsr -210(a6)
  FreeMem( srcbig, 160);
    248a:	2f6f 00d4 00b8 	move.l 212(sp),184(sp)
    2490:	2f7c 0000 00a0 	move.l #160,180(sp)
    2496:	00b4 
    2498:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    249e:	2c40           	movea.l d0,a6
    24a0:	226f 00b8      	movea.l 184(sp),a1
    24a4:	202f 00b4      	move.l 180(sp),d0
    24a8:	4eae ff2e      	jsr -210(a6)
  FreeMem( target, 168);
    24ac:	2f6f 00c4 00b0 	move.l 196(sp),176(sp)
    24b2:	2f7c 0000 00a8 	move.l #168,172(sp)
    24b8:	00ac 
    24ba:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    24c0:	2c40           	movea.l d0,a6
    24c2:	226f 00b0      	movea.l 176(sp),a1
    24c6:	202f 00ac      	move.l 172(sp),d0
    24ca:	4eae ff2e      	jsr -210(a6)
    24ce:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    24d2:	4fef 0100      	lea 256(sp),sp
    24d6:	4e75           	rts

000024d8 <ClBuild>:
#include "utils.h"




ULONG * ClBuild() {
    24d8:	4fef ffc4      	lea -60(sp),sp
    24dc:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
    24e0:	2f7c 0000 0084 	move.l #132,48(sp)
    24e6:	0030 
    24e8:	7002           	moveq #2,d0
    24ea:	2f40 002c      	move.l d0,44(sp)
    24ee:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    24f4:	2c40           	movea.l d0,a6
    24f6:	202f 0030      	move.l 48(sp),d0
    24fa:	222f 002c      	move.l 44(sp),d1
    24fe:	4eae ff3a      	jsr -198(a6)
    2502:	2f40 0028      	move.l d0,40(sp)
    2506:	202f 0028      	move.l 40(sp),d0
    250a:	2f40 0024      	move.l d0,36(sp)
  if( retval == 0) {
    250e:	6658           	bne.s 2568 <ClBuild+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2510:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2516:	2c40           	movea.l d0,a6
    2518:	4eae ffc4      	jsr -60(a6)
    251c:	2f40 0020      	move.l d0,32(sp)
    2520:	202f 0020      	move.l 32(sp),d0
    2524:	2f40 001c      	move.l d0,28(sp)
    2528:	2f7c 0000 7cfb 	move.l #31995,24(sp)
    252e:	0018 
    2530:	7228           	moveq #40,d1
    2532:	2f41 0014      	move.l d1,20(sp)
    2536:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    253c:	2c40           	movea.l d0,a6
    253e:	222f 001c      	move.l 28(sp),d1
    2542:	242f 0018      	move.l 24(sp),d2
    2546:	262f 0014      	move.l 20(sp),d3
    254a:	4eae ffd0      	jsr -48(a6)
    254e:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    2552:	7401           	moveq #1,d2
    2554:	2f42 000c      	move.l d2,12(sp)
    2558:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    255e:	2c40           	movea.l d0,a6
    2560:	222f 000c      	move.l 12(sp),d1
    2564:	4eae ff70      	jsr -144(a6)
  }
    
  ULONG *cl = retval;
    2568:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    256e:	2f7c 0000 a694 	move.l #42644,64(sp)
    2574:	0040 
  for(int i=0; i<16;i++)
    2576:	42af 003c      	clr.l 60(sp)
    257a:	6024           	bra.s 25a0 <ClBuild+0xc8>
    *cl++ = *clpartinstruction++;
    257c:	222f 0040      	move.l 64(sp),d1
    2580:	2001           	move.l d1,d0
    2582:	5880           	addq.l #4,d0
    2584:	2f40 0040      	move.l d0,64(sp)
    2588:	202f 0044      	move.l 68(sp),d0
    258c:	2400           	move.l d0,d2
    258e:	5882           	addq.l #4,d2
    2590:	2f42 0044      	move.l d2,68(sp)
    2594:	2041           	movea.l d1,a0
    2596:	2210           	move.l (a0),d1
    2598:	2040           	movea.l d0,a0
    259a:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    259c:	52af 003c      	addq.l #1,60(sp)
    25a0:	700f           	moveq #15,d0
    25a2:	b0af 003c      	cmp.l 60(sp),d0
    25a6:	6cd4           	bge.s 257c <ClBuild+0xa4>
  clpartinstruction = ClScreen;
    25a8:	2f7c 0000 a6d4 	move.l #42708,64(sp)
    25ae:	0040 
  for(int i=0; i<12;i++)
    25b0:	42af 0038      	clr.l 56(sp)
    25b4:	6024           	bra.s 25da <ClBuild+0x102>
    *cl++ = *clpartinstruction++;
    25b6:	222f 0040      	move.l 64(sp),d1
    25ba:	2401           	move.l d1,d2
    25bc:	5882           	addq.l #4,d2
    25be:	2f42 0040      	move.l d2,64(sp)
    25c2:	202f 0044      	move.l 68(sp),d0
    25c6:	2400           	move.l d0,d2
    25c8:	5882           	addq.l #4,d2
    25ca:	2f42 0044      	move.l d2,68(sp)
    25ce:	2041           	movea.l d1,a0
    25d0:	2210           	move.l (a0),d1
    25d2:	2040           	movea.l d0,a0
    25d4:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    25d6:	52af 0038      	addq.l #1,56(sp)
    25da:	700b           	moveq #11,d0
    25dc:	b0af 0038      	cmp.l 56(sp),d0
    25e0:	6cd4           	bge.s 25b6 <ClBuild+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    25e2:	202f 0044      	move.l 68(sp),d0
    25e6:	2200           	move.l d0,d1
    25e8:	5881           	addq.l #4,d1
    25ea:	2f41 0044      	move.l d1,68(sp)
    25ee:	2040           	movea.l d0,a0
    25f0:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    25f6:	202f 0044      	move.l 68(sp),d0
    25fa:	2200           	move.l d0,d1
    25fc:	5881           	addq.l #4,d1
    25fe:	2f41 0044      	move.l d1,68(sp)
    2602:	2040           	movea.l d0,a0
    2604:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
    260a:	2f7c 0000 a614 	move.l #42516,64(sp)
    2610:	0040 
  for(int i=0; i<2;i++)
    2612:	42af 0034      	clr.l 52(sp)
    2616:	6024           	bra.s 263c <ClBuild+0x164>
    *cl++ = *clpartinstruction++;
    2618:	222f 0040      	move.l 64(sp),d1
    261c:	2001           	move.l d1,d0
    261e:	5880           	addq.l #4,d0
    2620:	2f40 0040      	move.l d0,64(sp)
    2624:	202f 0044      	move.l 68(sp),d0
    2628:	2400           	move.l d0,d2
    262a:	5882           	addq.l #4,d2
    262c:	2f42 0044      	move.l d2,68(sp)
    2630:	2041           	movea.l d1,a0
    2632:	2210           	move.l (a0),d1
    2634:	2040           	movea.l d0,a0
    2636:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
    2638:	52af 0034      	addq.l #1,52(sp)
    263c:	7001           	moveq #1,d0
    263e:	b0af 0034      	cmp.l 52(sp),d0
    2642:	6cd4           	bge.s 2618 <ClBuild+0x140>
  *cl = 0xfffffffe;
    2644:	206f 0044      	movea.l 68(sp),a0
    2648:	72fe           	moveq #-2,d1
    264a:	2081           	move.l d1,(a0)

  return retval;
    264c:	202f 0024      	move.l 36(sp),d0
}
    2650:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2654:	4fef 003c      	lea 60(sp),sp
    2658:	4e75           	rts

0000265a <PrepareDisplay>:

int PrepareDisplay() {
    265a:	4fef ffb8      	lea -72(sp),sp
    265e:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClBuild( );
    2662:	4eba fe74      	jsr 24d8 <ClBuild>(pc)
    2666:	23c0 004d 2c0c 	move.l d0,4d2c0c <Copperlist1>
  Copperlist2 = ClBuild( );
    266c:	4eba fe6a      	jsr 24d8 <ClBuild>(pc)
    2670:	23c0 004d 2c10 	move.l d0,4d2c10 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    2676:	2f7c 0000 c800 	move.l #51200,80(sp)
    267c:	0050 
    267e:	7002           	moveq #2,d0
    2680:	2f40 004c      	move.l d0,76(sp)
    2684:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    268a:	2c40           	movea.l d0,a6
    268c:	202f 0050      	move.l 80(sp),d0
    2690:	222f 004c      	move.l 76(sp),d1
    2694:	4eae ff3a      	jsr -198(a6)
    2698:	2f40 0048      	move.l d0,72(sp)
    269c:	202f 0048      	move.l 72(sp),d0
    26a0:	23c0 004d 2c04 	move.l d0,4d2c04 <Bitplane1>
  if(Bitplane1 == 0) {
    26a6:	2039 004d 2c04 	move.l 4d2c04 <Bitplane1>,d0
    26ac:	6658           	bne.s 2706 <PrepareDisplay+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    26ae:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    26b4:	2c40           	movea.l d0,a6
    26b6:	4eae ffc4      	jsr -60(a6)
    26ba:	2f40 0044      	move.l d0,68(sp)
    26be:	202f 0044      	move.l 68(sp),d0
    26c2:	2f40 0040      	move.l d0,64(sp)
    26c6:	2f7c 0000 7cad 	move.l #31917,60(sp)
    26cc:	003c 
    26ce:	7026           	moveq #38,d0
    26d0:	2f40 0038      	move.l d0,56(sp)
    26d4:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    26da:	2c40           	movea.l d0,a6
    26dc:	222f 0040      	move.l 64(sp),d1
    26e0:	242f 003c      	move.l 60(sp),d2
    26e4:	262f 0038      	move.l 56(sp),d3
    26e8:	4eae ffd0      	jsr -48(a6)
    26ec:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    26f0:	7001           	moveq #1,d0
    26f2:	2f40 0030      	move.l d0,48(sp)
    26f6:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    26fc:	2c40           	movea.l d0,a6
    26fe:	222f 0030      	move.l 48(sp),d1
    2702:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane1;
    2706:	2039 004d 2c04 	move.l 4d2c04 <Bitplane1>,d0
    270c:	23c0 004d 2c18 	move.l d0,4d2c18 <ViewBuffer>
  ViewCopper = Copperlist1;
    2712:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    2718:	23c0 004d 2c20 	move.l d0,4d2c20 <ViewCopper>
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    271e:	2f7c 0000 c800 	move.l #51200,44(sp)
    2724:	002c 
    2726:	7002           	moveq #2,d0
    2728:	2f40 0028      	move.l d0,40(sp)
    272c:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    2732:	2c40           	movea.l d0,a6
    2734:	202f 002c      	move.l 44(sp),d0
    2738:	222f 0028      	move.l 40(sp),d1
    273c:	4eae ff3a      	jsr -198(a6)
    2740:	2f40 0024      	move.l d0,36(sp)
    2744:	202f 0024      	move.l 36(sp),d0
    2748:	23c0 004d 2c08 	move.l d0,4d2c08 <Bitplane2>
  if(Bitplane2 == 0) {
    274e:	2039 004d 2c08 	move.l 4d2c08 <Bitplane2>,d0
    2754:	6658           	bne.s 27ae <PrepareDisplay+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2756:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    275c:	2c40           	movea.l d0,a6
    275e:	4eae ffc4      	jsr -60(a6)
    2762:	2f40 0020      	move.l d0,32(sp)
    2766:	202f 0020      	move.l 32(sp),d0
    276a:	2f40 001c      	move.l d0,28(sp)
    276e:	2f7c 0000 7cd4 	move.l #31956,24(sp)
    2774:	0018 
    2776:	7026           	moveq #38,d0
    2778:	2f40 0014      	move.l d0,20(sp)
    277c:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2782:	2c40           	movea.l d0,a6
    2784:	222f 001c      	move.l 28(sp),d1
    2788:	242f 0018      	move.l 24(sp),d2
    278c:	262f 0014      	move.l 20(sp),d3
    2790:	4eae ffd0      	jsr -48(a6)
    2794:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    2798:	7001           	moveq #1,d0
    279a:	2f40 000c      	move.l d0,12(sp)
    279e:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    27a4:	2c40           	movea.l d0,a6
    27a6:	222f 000c      	move.l 12(sp),d1
    27aa:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane2;
    27ae:	2039 004d 2c08 	move.l 4d2c08 <Bitplane2>,d0
    27b4:	23c0 004d 2c14 	move.l d0,4d2c14 <DrawBuffer>
  DrawCopper = Copperlist2;
    27ba:	2039 004d 2c10 	move.l 4d2c10 <Copperlist2>,d0
    27c0:	23c0 004d 2c1c 	move.l d0,4d2c1c <DrawCopper>
  /*SwapCl();
  SetBplPointers();
  SwapCl();
  SetBplPointers();*/
  return 0;
    27c6:	7000           	moveq #0,d0
}
    27c8:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    27cc:	4fef 0048      	lea 72(sp),sp
    27d0:	4e75           	rts

000027d2 <TestCopperlistBatch>:

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                  long length) {
    27d2:	598f           	subq.l #4,sp
  for( int i=0;i<length;i++)
    27d4:	4297           	clr.l (sp)
    27d6:	602a           	bra.s 2802 <TestCopperlistBatch+0x30>
    if( instructions[ pos+i] != batch[ i])
    27d8:	202f 000c      	move.l 12(sp),d0
    27dc:	d097           	add.l (sp),d0
    27de:	d080           	add.l d0,d0
    27e0:	d080           	add.l d0,d0
    27e2:	206f 0008      	movea.l 8(sp),a0
    27e6:	d1c0           	adda.l d0,a0
    27e8:	2210           	move.l (a0),d1
    27ea:	2017           	move.l (sp),d0
    27ec:	d080           	add.l d0,d0
    27ee:	d080           	add.l d0,d0
    27f0:	206f 0010      	movea.l 16(sp),a0
    27f4:	d1c0           	adda.l d0,a0
    27f6:	2010           	move.l (a0),d0
    27f8:	b081           	cmp.l d1,d0
    27fa:	6704           	beq.s 2800 <TestCopperlistBatch+0x2e>
      return 0;
    27fc:	7000           	moveq #0,d0
    27fe:	600c           	bra.s 280c <TestCopperlistBatch+0x3a>
  for( int i=0;i<length;i++)
    2800:	5297           	addq.l #1,(sp)
    2802:	2017           	move.l (sp),d0
    2804:	b0af 0014      	cmp.l 20(sp),d0
    2808:	6dce           	blt.s 27d8 <TestCopperlistBatch+0x6>
  return 1;
    280a:	7001           	moveq #1,d0
}
    280c:	588f           	addq.l #4,sp
    280e:	4e75           	rts

00002810 <TestCopperlistPos>:

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    2810:	202f 0008      	move.l 8(sp),d0
    2814:	d080           	add.l d0,d0
    2816:	d080           	add.l d0,d0
    2818:	206f 0004      	movea.l 4(sp),a0
    281c:	d1c0           	adda.l d0,a0
    281e:	2010           	move.l (a0),d0
    2820:	b0af 000c      	cmp.l 12(sp),d0
    2824:	6604           	bne.s 282a <TestCopperlistPos+0x1a>
    return 1;
    2826:	7001           	moveq #1,d0
    2828:	6002           	bra.s 282c <TestCopperlistPos+0x1c>
  else 
    return 0;
    282a:	7000           	moveq #0,d0
}
    282c:	4e75           	rts

0000282e <TestCopperList>:

void TestCopperList() {
    282e:	4fef feb8      	lea -328(sp),sp
    2832:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Write( Output(), "%d", hw->cop1lc);
    2836:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    283c:	2c40           	movea.l d0,a6
    283e:	4eae ffc4      	jsr -60(a6)
    2842:	2f40 0150      	move.l d0,336(sp)
    2846:	202f 0150      	move.l 336(sp),d0
    284a:	2f40 014c      	move.l d0,332(sp)
    284e:	2f7c 0000 7e90 	move.l #32400,328(sp)
    2854:	0148 
    2856:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    285c:	2028 0080      	move.l 128(a0),d0
    2860:	2f40 0144      	move.l d0,324(sp)
    2864:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    286a:	2c40           	movea.l d0,a6
    286c:	222f 014c      	move.l 332(sp),d1
    2870:	242f 0148      	move.l 328(sp),d2
    2874:	262f 0144      	move.l 324(sp),d3
    2878:	4eae ffd0      	jsr -48(a6)
    287c:	2f40 0140      	move.l d0,320(sp)
  Copperlist1 = ClBuild();
    2880:	4eba fc56      	jsr 24d8 <ClBuild>(pc)
    2884:	23c0 004d 2c0c 	move.l d0,4d2c0c <Copperlist1>
  DrawCopper = Copperlist1;
    288a:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    2890:	23c0 004d 2c1c 	move.l d0,4d2c1c <DrawCopper>
  Copperlist2 = ClBuild();
    2896:	4eba fc40      	jsr 24d8 <ClBuild>(pc)
    289a:	23c0 004d 2c10 	move.l d0,4d2c10 <Copperlist2>
  ViewCopper = Copperlist2;
    28a0:	2039 004d 2c10 	move.l 4d2c10 <Copperlist2>,d0
    28a6:	23c0 004d 2c20 	move.l d0,4d2c20 <ViewCopper>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    28ac:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    28b2:	4878 0010      	pea 10 <_start+0x10>
    28b6:	4879 0000 a694 	pea a694 <ClsSprites>
    28bc:	42a7           	clr.l -(sp)
    28be:	2f00           	move.l d0,-(sp)
    28c0:	4eba ff10      	jsr 27d2 <TestCopperlistBatch>(pc)
    28c4:	4fef 0010      	lea 16(sp),sp
    28c8:	4a80           	tst.l d0
    28ca:	6642           	bne.s 290e <TestCopperList+0xe0>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    28cc:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    28d2:	2c40           	movea.l d0,a6
    28d4:	4eae ffc4      	jsr -60(a6)
    28d8:	2f40 013c      	move.l d0,316(sp)
    28dc:	202f 013c      	move.l 316(sp),d0
    28e0:	2f40 0138      	move.l d0,312(sp)
    28e4:	2f7c 0000 7618 	move.l #30232,308(sp)
    28ea:	0134 
    28ec:	702c           	moveq #44,d0
    28ee:	2f40 0130      	move.l d0,304(sp)
    28f2:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    28f8:	2c40           	movea.l d0,a6
    28fa:	222f 0138      	move.l 312(sp),d1
    28fe:	242f 0134      	move.l 308(sp),d2
    2902:	262f 0130      	move.l 304(sp),d3
    2906:	4eae ffd0      	jsr -48(a6)
    290a:	2f40 012c      	move.l d0,300(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    290e:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    2914:	4878 000c      	pea c <_start+0xc>
    2918:	4879 0000 a6d4 	pea a6d4 <ClScreen>
    291e:	4878 0010      	pea 10 <_start+0x10>
    2922:	2f00           	move.l d0,-(sp)
    2924:	4eba feac      	jsr 27d2 <TestCopperlistBatch>(pc)
    2928:	4fef 0010      	lea 16(sp),sp
    292c:	4a80           	tst.l d0
    292e:	6642           	bne.s 2972 <TestCopperList+0x144>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    2930:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2936:	2c40           	movea.l d0,a6
    2938:	4eae ffc4      	jsr -60(a6)
    293c:	2f40 0128      	move.l d0,296(sp)
    2940:	202f 0128      	move.l 296(sp),d0
    2944:	2f40 0124      	move.l d0,292(sp)
    2948:	2f7c 0000 764e 	move.l #30286,288(sp)
    294e:	0120 
    2950:	7036           	moveq #54,d0
    2952:	2f40 011c      	move.l d0,284(sp)
    2956:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    295c:	2c40           	movea.l d0,a6
    295e:	222f 0124      	move.l 292(sp),d1
    2962:	242f 0120      	move.l 288(sp),d2
    2966:	262f 011c      	move.l 284(sp),d3
    296a:	4eae ffd0      	jsr -48(a6)
    296e:	2f40 0118      	move.l d0,280(sp)
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
    2972:	23fc 0004 0000 	move.l #262144,4d2c14 <DrawBuffer>
    2978:	004d 2c14 
  ViewBuffer = (ULONG *)0x50000;
    297c:	23fc 0005 0000 	move.l #327680,4d2c18 <ViewBuffer>
    2982:	004d 2c18 
  
  SetBplPointers();
    2986:	4eba d7ba      	jsr 142 <SetBplPointers>(pc)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    298a:	2039 004d 2c14 	move.l 4d2c14 <DrawBuffer>,d0
    2990:	0c80 0005 0000 	cmpi.l #327680,d0
    2996:	660e           	bne.s 29a6 <TestCopperList+0x178>
    2998:	2039 004d 2c18 	move.l 4d2c18 <ViewBuffer>,d0
    299e:	0c80 0004 0000 	cmpi.l #262144,d0
    29a4:	6742           	beq.s 29e8 <TestCopperList+0x1ba>
    Write( Output(), 
    29a6:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    29ac:	2c40           	movea.l d0,a6
    29ae:	4eae ffc4      	jsr -60(a6)
    29b2:	2f40 0114      	move.l d0,276(sp)
    29b6:	202f 0114      	move.l 276(sp),d0
    29ba:	2f40 0110      	move.l d0,272(sp)
    29be:	2f7c 0000 7e93 	move.l #32403,268(sp)
    29c4:	010c 
    29c6:	703b           	moveq #59,d0
    29c8:	2f40 0108      	move.l d0,264(sp)
    29cc:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    29d2:	2c40           	movea.l d0,a6
    29d4:	222f 0110      	move.l 272(sp),d1
    29d8:	242f 010c      	move.l 268(sp),d2
    29dc:	262f 0108      	move.l 264(sp),d3
    29e0:	4eae ffd0      	jsr -48(a6)
    29e4:	2f40 0104      	move.l d0,260(sp)
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    29e8:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    29ee:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    29f4:	4878 001c      	pea 1c <_start+0x1c>
    29f8:	2f00           	move.l d0,-(sp)
    29fa:	4eba fe14      	jsr 2810 <TestCopperlistPos>(pc)
    29fe:	4fef 000c      	lea 12(sp),sp
    2a02:	4a80           	tst.l d0
    2a04:	6642           	bne.s 2a48 <TestCopperList+0x21a>
    Write(Output(), 
    2a06:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2a0c:	2c40           	movea.l d0,a6
    2a0e:	4eae ffc4      	jsr -60(a6)
    2a12:	2f40 0100      	move.l d0,256(sp)
    2a16:	202f 0100      	move.l 256(sp),d0
    2a1a:	2f40 00fc      	move.l d0,252(sp)
    2a1e:	2f7c 0000 7ecf 	move.l #32463,248(sp)
    2a24:	00f8 
    2a26:	703c           	moveq #60,d0
    2a28:	2f40 00f4      	move.l d0,244(sp)
    2a2c:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2a32:	2c40           	movea.l d0,a6
    2a34:	222f 00fc      	move.l 252(sp),d1
    2a38:	242f 00f8      	move.l 248(sp),d2
    2a3c:	262f 00f4      	move.l 244(sp),d3
    2a40:	4eae ffd0      	jsr -48(a6)
    2a44:	2f40 00f0      	move.l d0,240(sp)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    2a48:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    2a4e:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    2a54:	4878 001d      	pea 1d <_start+0x1d>
    2a58:	2f00           	move.l d0,-(sp)
    2a5a:	4eba fdb4      	jsr 2810 <TestCopperlistPos>(pc)
    2a5e:	4fef 000c      	lea 12(sp),sp
    2a62:	4a80           	tst.l d0
    2a64:	6642           	bne.s 2aa8 <TestCopperList+0x27a>
    Write(Output(), 
    2a66:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2a6c:	2c40           	movea.l d0,a6
    2a6e:	4eae ffc4      	jsr -60(a6)
    2a72:	2f40 00ec      	move.l d0,236(sp)
    2a76:	202f 00ec      	move.l 236(sp),d0
    2a7a:	2f40 00e8      	move.l d0,232(sp)
    2a7e:	2f7c 0000 7f0c 	move.l #32524,228(sp)
    2a84:	00e4 
    2a86:	703c           	moveq #60,d0
    2a88:	2f40 00e0      	move.l d0,224(sp)
    2a8c:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2a92:	2c40           	movea.l d0,a6
    2a94:	222f 00e8      	move.l 232(sp),d1
    2a98:	242f 00e4      	move.l 228(sp),d2
    2a9c:	262f 00e0      	move.l 224(sp),d3
    2aa0:	4eae ffd0      	jsr -48(a6)
    2aa4:	2f40 00dc      	move.l d0,220(sp)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2aa8:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    2aae:	4878 0002      	pea 2 <_start+0x2>
    2ab2:	4879 0000 a614 	pea a614 <ClColor>
    2ab8:	4878 001e      	pea 1e <_start+0x1e>
    2abc:	2f00           	move.l d0,-(sp)
    2abe:	4eba fd12      	jsr 27d2 <TestCopperlistBatch>(pc)
    2ac2:	4fef 0010      	lea 16(sp),sp
    2ac6:	4a80           	tst.l d0
    2ac8:	6642           	bne.s 2b0c <TestCopperList+0x2de>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2aca:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2ad0:	2c40           	movea.l d0,a6
    2ad2:	4eae ffc4      	jsr -60(a6)
    2ad6:	2f40 00d8      	move.l d0,216(sp)
    2ada:	202f 00d8      	move.l 216(sp),d0
    2ade:	2f40 00d4      	move.l d0,212(sp)
    2ae2:	2f7c 0000 7685 	move.l #30341,208(sp)
    2ae8:	00d0 
    2aea:	7021           	moveq #33,d0
    2aec:	2f40 00cc      	move.l d0,204(sp)
    2af0:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2af6:	2c40           	movea.l d0,a6
    2af8:	222f 00d4      	move.l 212(sp),d1
    2afc:	242f 00d0      	move.l 208(sp),d2
    2b00:	262f 00cc      	move.l 204(sp),d3
    2b04:	4eae ffd0      	jsr -48(a6)
    2b08:	2f40 00c8      	move.l d0,200(sp)

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2b0c:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    2b12:	4878 fffe      	pea fffffffe <_end+0xffb2d382>
    2b16:	4878 0020      	pea 20 <_start+0x20>
    2b1a:	2f00           	move.l d0,-(sp)
    2b1c:	4eba fcf2      	jsr 2810 <TestCopperlistPos>(pc)
    2b20:	4fef 000c      	lea 12(sp),sp
    2b24:	4a80           	tst.l d0
    2b26:	6642           	bne.s 2b6a <TestCopperList+0x33c>
    Write(Output(), "Copperlist End not correctly set.\n", 34);
    2b28:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2b2e:	2c40           	movea.l d0,a6
    2b30:	4eae ffc4      	jsr -60(a6)
    2b34:	2f40 00c4      	move.l d0,196(sp)
    2b38:	202f 00c4      	move.l 196(sp),d0
    2b3c:	2f40 00c0      	move.l d0,192(sp)
    2b40:	2f7c 0000 76a7 	move.l #30375,188(sp)
    2b46:	00bc 
    2b48:	7022           	moveq #34,d0
    2b4a:	2f40 00b8      	move.l d0,184(sp)
    2b4e:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2b54:	2c40           	movea.l d0,a6
    2b56:	222f 00c0      	move.l 192(sp),d1
    2b5a:	242f 00bc      	move.l 188(sp),d2
    2b5e:	262f 00b8      	move.l 184(sp),d3
    2b62:	4eae ffd0      	jsr -48(a6)
    2b66:	2f40 00b4      	move.l d0,180(sp)
  
  SwapCl();
    2b6a:	4eba d634      	jsr 1a0 <SwapCl>(pc)
  
  if( DrawCopper != Copperlist2)
    2b6e:	2239 004d 2c1c 	move.l 4d2c1c <DrawCopper>,d1
    2b74:	2039 004d 2c10 	move.l 4d2c10 <Copperlist2>,d0
    2b7a:	b081           	cmp.l d1,d0
    2b7c:	6742           	beq.s 2bc0 <TestCopperList+0x392>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
    2b7e:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2b84:	2c40           	movea.l d0,a6
    2b86:	4eae ffc4      	jsr -60(a6)
    2b8a:	2f40 00b0      	move.l d0,176(sp)
    2b8e:	202f 00b0      	move.l 176(sp),d0
    2b92:	2f40 00ac      	move.l d0,172(sp)
    2b96:	2f7c 0000 7f49 	move.l #32585,168(sp)
    2b9c:	00a8 
    2b9e:	7015           	moveq #21,d0
    2ba0:	2f40 00a4      	move.l d0,164(sp)
    2ba4:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2baa:	2c40           	movea.l d0,a6
    2bac:	222f 00ac      	move.l 172(sp),d1
    2bb0:	242f 00a8      	move.l 168(sp),d2
    2bb4:	262f 00a4      	move.l 164(sp),d3
    2bb8:	4eae ffd0      	jsr -48(a6)
    2bbc:	2f40 00a0      	move.l d0,160(sp)

  
  PrepareDisplay();
    2bc0:	4eba fa98      	jsr 265a <PrepareDisplay>(pc)
  if( DrawBuffer != Bitplane2) 
    2bc4:	2239 004d 2c14 	move.l 4d2c14 <DrawBuffer>,d1
    2bca:	2039 004d 2c08 	move.l 4d2c08 <Bitplane2>,d0
    2bd0:	b081           	cmp.l d1,d0
    2bd2:	6742           	beq.s 2c16 <TestCopperList+0x3e8>
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
    2bd4:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2bda:	2c40           	movea.l d0,a6
    2bdc:	4eae ffc4      	jsr -60(a6)
    2be0:	2f40 009c      	move.l d0,156(sp)
    2be4:	202f 009c      	move.l 156(sp),d0
    2be8:	2f40 0098      	move.l d0,152(sp)
    2bec:	2f7c 0000 7f5f 	move.l #32607,148(sp)
    2bf2:	0094 
    2bf4:	7037           	moveq #55,d0
    2bf6:	2f40 0090      	move.l d0,144(sp)
    2bfa:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2c00:	2c40           	movea.l d0,a6
    2c02:	222f 0098      	move.l 152(sp),d1
    2c06:	242f 0094      	move.l 148(sp),d2
    2c0a:	262f 0090      	move.l 144(sp),d3
    2c0e:	4eae ffd0      	jsr -48(a6)
    2c12:	2f40 008c      	move.l d0,140(sp)
                                                                            55);
  if( DrawCopper != Copperlist2) 
    2c16:	2239 004d 2c1c 	move.l 4d2c1c <DrawCopper>,d1
    2c1c:	2039 004d 2c10 	move.l 4d2c10 <Copperlist2>,d0
    2c22:	b081           	cmp.l d1,d0
    2c24:	6742           	beq.s 2c68 <TestCopperList+0x43a>
    Write( Output(), 
    2c26:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2c2c:	2c40           	movea.l d0,a6
    2c2e:	4eae ffc4      	jsr -60(a6)
    2c32:	2f40 0088      	move.l d0,136(sp)
    2c36:	202f 0088      	move.l 136(sp),d0
    2c3a:	2f40 0084      	move.l d0,132(sp)
    2c3e:	2f7c 0000 7f97 	move.l #32663,128(sp)
    2c44:	0080 
    2c46:	7039           	moveq #57,d0
    2c48:	2f40 007c      	move.l d0,124(sp)
    2c4c:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2c52:	2c40           	movea.l d0,a6
    2c54:	222f 0084      	move.l 132(sp),d1
    2c58:	242f 0080      	move.l 128(sp),d2
    2c5c:	262f 007c      	move.l 124(sp),d3
    2c60:	4eae ffd0      	jsr -48(a6)
    2c64:	2f40 0078      	move.l d0,120(sp)
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
    2c68:	2239 004d 2c18 	move.l 4d2c18 <ViewBuffer>,d1
    2c6e:	2039 004d 2c04 	move.l 4d2c04 <Bitplane1>,d0
    2c74:	b081           	cmp.l d1,d0
    2c76:	6742           	beq.s 2cba <TestCopperList+0x48c>
    Write( Output(), 
    2c78:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2c7e:	2c40           	movea.l d0,a6
    2c80:	4eae ffc4      	jsr -60(a6)
    2c84:	2f40 0074      	move.l d0,116(sp)
    2c88:	202f 0074      	move.l 116(sp),d0
    2c8c:	2f40 0070      	move.l d0,112(sp)
    2c90:	2f7c 0000 7fd1 	move.l #32721,108(sp)
    2c96:	006c 
    2c98:	7038           	moveq #56,d0
    2c9a:	2f40 0068      	move.l d0,104(sp)
    2c9e:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2ca4:	2c40           	movea.l d0,a6
    2ca6:	222f 0070      	move.l 112(sp),d1
    2caa:	242f 006c      	move.l 108(sp),d2
    2cae:	262f 0068      	move.l 104(sp),d3
    2cb2:	4eae ffd0      	jsr -48(a6)
    2cb6:	2f40 0064      	move.l d0,100(sp)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
    2cba:	2239 004d 2c20 	move.l 4d2c20 <ViewCopper>,d1
    2cc0:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    2cc6:	b081           	cmp.l d1,d0
    2cc8:	6742           	beq.s 2d0c <TestCopperList+0x4de>
    Write( Output(), 
    2cca:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2cd0:	2c40           	movea.l d0,a6
    2cd2:	4eae ffc4      	jsr -60(a6)
    2cd6:	2f40 0060      	move.l d0,96(sp)
    2cda:	202f 0060      	move.l 96(sp),d0
    2cde:	2f40 005c      	move.l d0,92(sp)
    2ce2:	2f7c 0000 800a 	move.l #32778,88(sp)
    2ce8:	0058 
    2cea:	703a           	moveq #58,d0
    2cec:	2f40 0054      	move.l d0,84(sp)
    2cf0:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2cf6:	2c40           	movea.l d0,a6
    2cf8:	222f 005c      	move.l 92(sp),d1
    2cfc:	242f 0058      	move.l 88(sp),d2
    2d00:	262f 0054      	move.l 84(sp),d3
    2d04:	4eae ffd0      	jsr -48(a6)
    2d08:	2f40 0050      	move.l d0,80(sp)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
    2d0c:	4eba d434      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2d10:	4eba d48e      	jsr 1a0 <SwapCl>(pc)
  UWORD *copword = ViewCopper;
    2d14:	2f79 004d 2c20 	move.l 4d2c20 <ViewCopper>,76(sp)
    2d1a:	004c 
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2d1c:	307c 0076      	movea.w #118,a0
    2d20:	d1ef 004c      	adda.l 76(sp),a0
    2d24:	3010           	move.w (a0),d0
    2d26:	7200           	moveq #0,d1
    2d28:	3200           	move.w d0,d1
    2d2a:	307c 0072      	movea.w #114,a0
    2d2e:	d1ef 004c      	adda.l 76(sp),a0
    2d32:	3010           	move.w (a0),d0
    2d34:	3000           	move.w d0,d0
    2d36:	0280 0000 ffff 	andi.l #65535,d0
    2d3c:	4840           	swap d0
    2d3e:	4240           	clr.w d0
    2d40:	d081           	add.l d1,d0
    2d42:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2d46:	2039 004d 2c08 	move.l 4d2c08 <Bitplane2>,d0
    2d4c:	b0af 0048      	cmp.l 72(sp),d0
    2d50:	6742           	beq.s 2d94 <TestCopperList+0x566>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2d52:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2d58:	2c40           	movea.l d0,a6
    2d5a:	4eae ffc4      	jsr -60(a6)
    2d5e:	2f40 0044      	move.l d0,68(sp)
    2d62:	202f 0044      	move.l 68(sp),d0
    2d66:	2f40 0040      	move.l d0,64(sp)
    2d6a:	2f7c 0000 8045 	move.l #32837,60(sp)
    2d70:	003c 
    2d72:	7048           	moveq #72,d0
    2d74:	2f40 0038      	move.l d0,56(sp)
    2d78:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2d7e:	2c40           	movea.l d0,a6
    2d80:	222f 0040      	move.l 64(sp),d1
    2d84:	242f 003c      	move.l 60(sp),d2
    2d88:	262f 0038      	move.l 56(sp),d3
    2d8c:	4eae ffd0      	jsr -48(a6)
    2d90:	2f40 0034      	move.l d0,52(sp)
                                                   " after first frame.\n", 72);
  SetBplPointers();
    2d94:	4eba d3ac      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2d98:	4eba d406      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2d9c:	2f79 004d 2c20 	move.l 4d2c20 <ViewCopper>,76(sp)
    2da2:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2da4:	307c 0076      	movea.w #118,a0
    2da8:	d1ef 004c      	adda.l 76(sp),a0
    2dac:	3010           	move.w (a0),d0
    2dae:	7200           	moveq #0,d1
    2db0:	3200           	move.w d0,d1
    2db2:	307c 0072      	movea.w #114,a0
    2db6:	d1ef 004c      	adda.l 76(sp),a0
    2dba:	3010           	move.w (a0),d0
    2dbc:	3000           	move.w d0,d0
    2dbe:	0280 0000 ffff 	andi.l #65535,d0
    2dc4:	4840           	swap d0
    2dc6:	4240           	clr.w d0
    2dc8:	d081           	add.l d1,d0
    2dca:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane1) 
    2dce:	2039 004d 2c04 	move.l 4d2c04 <Bitplane1>,d0
    2dd4:	b0af 0048      	cmp.l 72(sp),d0
    2dd8:	6742           	beq.s 2e1c <TestCopperList+0x5ee>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
    2dda:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2de0:	2c40           	movea.l d0,a6
    2de2:	4eae ffc4      	jsr -60(a6)
    2de6:	2f40 0030      	move.l d0,48(sp)
    2dea:	202f 0030      	move.l 48(sp),d0
    2dee:	2f40 002c      	move.l d0,44(sp)
    2df2:	2f7c 0000 808e 	move.l #32910,40(sp)
    2df8:	0028 
    2dfa:	7049           	moveq #73,d0
    2dfc:	2f40 0024      	move.l d0,36(sp)
    2e00:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2e06:	2c40           	movea.l d0,a6
    2e08:	222f 002c      	move.l 44(sp),d1
    2e0c:	242f 0028      	move.l 40(sp),d2
    2e10:	262f 0024      	move.l 36(sp),d3
    2e14:	4eae ffd0      	jsr -48(a6)
    2e18:	2f40 0020      	move.l d0,32(sp)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
    2e1c:	4eba d324      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2e20:	4eba d37e      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2e24:	2f79 004d 2c20 	move.l 4d2c20 <ViewCopper>,76(sp)
    2e2a:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2e2c:	307c 0076      	movea.w #118,a0
    2e30:	d1ef 004c      	adda.l 76(sp),a0
    2e34:	3010           	move.w (a0),d0
    2e36:	7200           	moveq #0,d1
    2e38:	3200           	move.w d0,d1
    2e3a:	307c 0072      	movea.w #114,a0
    2e3e:	d1ef 004c      	adda.l 76(sp),a0
    2e42:	3010           	move.w (a0),d0
    2e44:	3000           	move.w d0,d0
    2e46:	0280 0000 ffff 	andi.l #65535,d0
    2e4c:	4840           	swap d0
    2e4e:	4240           	clr.w d0
    2e50:	d081           	add.l d1,d0
    2e52:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2e56:	2039 004d 2c08 	move.l 4d2c08 <Bitplane2>,d0
    2e5c:	b0af 0048      	cmp.l 72(sp),d0
    2e60:	6742           	beq.s 2ea4 <TestCopperList+0x676>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2e62:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2e68:	2c40           	movea.l d0,a6
    2e6a:	4eae ffc4      	jsr -60(a6)
    2e6e:	2f40 001c      	move.l d0,28(sp)
    2e72:	202f 001c      	move.l 28(sp),d0
    2e76:	2f40 0018      	move.l d0,24(sp)
    2e7a:	2f7c 0000 80d8 	move.l #32984,20(sp)
    2e80:	0014 
    2e82:	7048           	moveq #72,d0
    2e84:	2f40 0010      	move.l d0,16(sp)
    2e88:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2e8e:	2c40           	movea.l d0,a6
    2e90:	222f 0018      	move.l 24(sp),d1
    2e94:	242f 0014      	move.l 20(sp),d2
    2e98:	262f 0010      	move.l 16(sp),d3
    2e9c:	4eae ffd0      	jsr -48(a6)
    2ea0:	2f40 000c      	move.l d0,12(sp)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
    2ea4:	2f3c 0000 c800 	move.l #51200,-(sp)
    2eaa:	4878 0084      	pea 84 <_start+0x84>
    2eae:	4eba d230      	jsr e0 <FreeDisplay>(pc)
    2eb2:	508f           	addq.l #8,sp
    2eb4:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2eb8:	4fef 0148      	lea 328(sp),sp
    2ebc:	4e75           	rts

00002ebe <RunTests>:
#include "runtests.h"
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    2ebe:	4eba f96e      	jsr 282e <TestCopperList>(pc)
    ZoomTest();
    2ec2:	4eba 0004      	jsr 2ec8 <ZoomTest>(pc)
    //SwScrollerTest();
    2ec6:	4e75           	rts

00002ec8 <ZoomTest>:
#include "zoomtest2.h"

ULONG Cl102ZoomTest[137];

void ZoomTest() {
  TestZoomSpeed();
    2ec8:	4eba 0046      	jsr 2f10 <TestZoomSpeed>(pc)
  ZoomTestDisplay();
    2ecc:	4eba 00e2      	jsr 2fb0 <ZoomTestDisplay>(pc)
  TestBlitleftOfZoom();
    2ed0:	4eba 05a8      	jsr 347a <TestBlitleftOfZoom>(pc)
  TestCopyWord();
    2ed4:	4eba 0838      	jsr 370e <TestCopyWord>(pc)
  TestZoom4Picture();
    2ed8:	4eba 0e12      	jsr 3cec <TestZoom4Picture>(pc)
  TestZoom4PictureOn5Planes();
    2edc:	4eba 0b22      	jsr 3a00 <TestZoom4PictureOn5Planes>(pc)
  Test_Zoom2();
    2ee0:	4eba f012      	jsr 1ef4 <Test_Zoom2>(pc)
  c2p1x1_8_c5_gen_init( 320, 256, 0, 0, 0, 0);
    2ee4:	42a7           	clr.l -(sp)
    2ee6:	42a7           	clr.l -(sp)
    2ee8:	42a7           	clr.l -(sp)
    2eea:	42a7           	clr.l -(sp)
    2eec:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2ef0:	4878 0140      	pea 140 <FreeDisplay+0x60>
    2ef4:	4eb9 0000 7220 	jsr 7220 <c2p1x1_8_c5_gen_init>
    2efa:	4fef 0018      	lea 24(sp),sp
  c2p1x1_8_c5_gen( 0x100, 0x200);
    2efe:	4878 0200      	pea 200 <Utils_CopyMem+0x22>
    2f02:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2f06:	4eb9 0000 729c 	jsr 729c <c2p1x1_8_c5_gen>
    2f0c:	508f           	addq.l #8,sp
}
    2f0e:	4e75           	rts

00002f10 <TestZoomSpeed>:

int Counter4Frames;

void TestZoomSpeed() {
    2f10:	4fef ffe8      	lea -24(sp),sp
    2f14:	48e7 3002      	movem.l d2-d3/a6,-(sp)

 	TakeSystem();
    2f18:	4eba d660      	jsr 57a <TakeSystem>(pc)
	WaitVbl();
    2f1c:	4eba d612      	jsr 530 <WaitVbl>(pc)
  //             fedcba9876543210
  //hw->dmacon = 0x8def;

  hw->dmacon = DMAF_SETCLR | DMAF_AUDIO | DMAF_BLITTER | DMAF_RASTER 
    2f20:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    2f26:	317c 87cf 0096 	move.w #-30769,150(a0)
                                    | DMAF_COPPER | DMAF_MASTER | DMAF_BLITHOG;
   //0b1000011111100000;
  
  //hw->dmacon = 0b1000011111111111;
	hw->intena = (1 << INTB_SETCLR) | (1 << INTB_INTEN) | (1 << INTB_VERTB);
    2f2c:	2079 004d 2c24 	movea.l 4d2c24 <hw>,a0
    2f32:	317c c020 009a 	move.w #-16352,154(a0)
  
  Zoom_InitRun(); 
    2f38:	4eba e146      	jsr 1080 <Zoom_InitRun>(pc)

  int success = 1;
    2f3c:	7001           	moveq #1,d0
    2f3e:	2f40 0020      	move.l d0,32(sp)
  RunFrame();
    2f42:	4eba d3b8      	jsr 2fc <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    2f46:	3039 004d 2c64 	move.w 4d2c64 <Zoom_Counter>,d0
    2f4c:	0c40 0008      	cmpi.w #8,d0
    2f50:	6304           	bls.s 2f56 <TestZoomSpeed+0x46>
    2f52:	42af 0020      	clr.l 32(sp)
    
  Zoom_Dealloc();
    2f56:	4eba e3c0      	jsr 1318 <Zoom_Dealloc>(pc)
  FreeSystem();
    2f5a:	4eba d634      	jsr 590 <FreeSystem>(pc)

  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    2f5e:	4aaf 0020      	tst.l 32(sp)
    2f62:	6642           	bne.s 2fa6 <TestZoomSpeed+0x96>
    2f64:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2f6a:	2c40           	movea.l d0,a6
    2f6c:	4eae ffc4      	jsr -60(a6)
    2f70:	2f40 001c      	move.l d0,28(sp)
    2f74:	202f 001c      	move.l 28(sp),d0
    2f78:	2f40 0018      	move.l d0,24(sp)
    2f7c:	2f7c 0000 8121 	move.l #33057,20(sp)
    2f82:	0014 
    2f84:	701c           	moveq #28,d0
    2f86:	2f40 0010      	move.l d0,16(sp)
    2f8a:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2f90:	2c40           	movea.l d0,a6
    2f92:	222f 0018      	move.l 24(sp),d1
    2f96:	242f 0014      	move.l 20(sp),d2
    2f9a:	262f 0010      	move.l 16(sp),d3
    2f9e:	4eae ffd0      	jsr -48(a6)
    2fa2:	2f40 000c      	move.l d0,12(sp)

  //AddIntServer(INTB_VERTB, vbint);
  //RemIntServer(INTB_VERTB, vbint);
  
}
    2fa6:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2faa:	4fef 0018      	lea 24(sp),sp
    2fae:	4e75           	rts

00002fb0 <ZoomTestDisplay>:

void ZoomTestDisplay() {
    2fb0:	4fef ff38      	lea -200(sp),sp
    2fb4:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Zoom_Init();
    2fb8:	4eba e476      	jsr 1430 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    2fbc:	4eba e80c      	jsr 17ca <PrepareDisplayZoom>(pc)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2fc0:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    2fc6:	4878 0010      	pea 10 <_start+0x10>
    2fca:	4879 0000 a694 	pea a694 <ClsSprites>
    2fd0:	42a7           	clr.l -(sp)
    2fd2:	2f00           	move.l d0,-(sp)
    2fd4:	4eba f7fc      	jsr 27d2 <TestCopperlistBatch>(pc)
    2fd8:	4fef 0010      	lea 16(sp),sp
    2fdc:	4a80           	tst.l d0
    2fde:	6642           	bne.s 3022 <ZoomTestDisplay+0x72>
    Write( Output(), 
    2fe0:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    2fe6:	2c40           	movea.l d0,a6
    2fe8:	4eae ffc4      	jsr -60(a6)
    2fec:	2f40 00d0      	move.l d0,208(sp)
    2ff0:	202f 00d0      	move.l 208(sp),d0
    2ff4:	2f40 00cc      	move.l d0,204(sp)
    2ff8:	2f7c 0000 8140 	move.l #33088,200(sp)
    2ffe:	00c8 
    3000:	7045           	moveq #69,d0
    3002:	2f40 00c4      	move.l d0,196(sp)
    3006:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    300c:	2c40           	movea.l d0,a6
    300e:	222f 00cc      	move.l 204(sp),d1
    3012:	242f 00c8      	move.l 200(sp),d2
    3016:	262f 00c4      	move.l 196(sp),d3
    301a:	4eae ffd0      	jsr -48(a6)
    301e:	2f40 00c0      	move.l d0,192(sp)
       "ZoomCopperlist: Sprite section of copper starting on pos 0 messed up\n", 
                                                                            69);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    3022:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    3028:	4878 000c      	pea c <_start+0xc>
    302c:	4879 0000 a6d4 	pea a6d4 <ClScreen>
    3032:	4878 0010      	pea 10 <_start+0x10>
    3036:	2f00           	move.l d0,-(sp)
    3038:	4eba f798      	jsr 27d2 <TestCopperlistBatch>(pc)
    303c:	4fef 0010      	lea 16(sp),sp
    3040:	4a80           	tst.l d0
    3042:	6642           	bne.s 3086 <ZoomTestDisplay+0xd6>
    Write( Output(), 
    3044:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    304a:	2c40           	movea.l d0,a6
    304c:	4eae ffc4      	jsr -60(a6)
    3050:	2f40 00bc      	move.l d0,188(sp)
    3054:	202f 00bc      	move.l 188(sp),d0
    3058:	2f40 00b8      	move.l d0,184(sp)
    305c:	2f7c 0000 8186 	move.l #33158,180(sp)
    3062:	00b4 
    3064:	7046           	moveq #70,d0
    3066:	2f40 00b0      	move.l d0,176(sp)
    306a:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3070:	2c40           	movea.l d0,a6
    3072:	222f 00b8      	move.l 184(sp),d1
    3076:	242f 00b4      	move.l 180(sp),d2
    307a:	262f 00b0      	move.l 176(sp),d3
    307e:	4eae ffd0      	jsr -48(a6)
    3082:	2f40 00ac      	move.l d0,172(sp)
      "ZoomCopperlist: Screen section of copper starting on pos 16 messed up\n",
                                                                            70);
  DrawBuffer = (ULONG *) 0x40000;
    3086:	23fc 0004 0000 	move.l #262144,4d2c14 <DrawBuffer>
    308c:	004d 2c14 
  ViewBuffer = (ULONG *) 0x50000;
    3090:	23fc 0005 0000 	move.l #327680,4d2c18 <ViewBuffer>
    3096:	004d 2c18 
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    309a:	2239 004d 2c1c 	move.l 4d2c1c <DrawCopper>,d1
    30a0:	2039 004d 2c14 	move.l 4d2c14 <DrawBuffer>,d0
    30a6:	2f01           	move.l d1,-(sp)
    30a8:	2f00           	move.l d0,-(sp)
    30aa:	4eba ed78      	jsr 1e24 <Zoom_SetBplPointers>(pc)
    30ae:	508f           	addq.l #8,sp
  Zoom_SwapBuffers( 0);
    30b0:	42a7           	clr.l -(sp)
    30b2:	4eba ee08      	jsr 1ebc <Zoom_SwapBuffers>(pc)
    30b6:	588f           	addq.l #4,sp
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    30b8:	2039 004d 2c14 	move.l 4d2c14 <DrawBuffer>,d0
    30be:	0c80 0005 0000 	cmpi.l #327680,d0
    30c4:	660e           	bne.s 30d4 <ZoomTestDisplay+0x124>
    30c6:	2039 004d 2c18 	move.l 4d2c18 <ViewBuffer>,d0
    30cc:	0c80 0004 0000 	cmpi.l #262144,d0
    30d2:	6742           	beq.s 3116 <ZoomTestDisplay+0x166>
    Write( Output(), 
    30d4:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    30da:	2c40           	movea.l d0,a6
    30dc:	4eae ffc4      	jsr -60(a6)
    30e0:	2f40 00a8      	move.l d0,168(sp)
    30e4:	202f 00a8      	move.l 168(sp),d0
    30e8:	2f40 00a4      	move.l d0,164(sp)
    30ec:	2f7c 0000 81cd 	move.l #33229,160(sp)
    30f2:	00a0 
    30f4:	703b           	moveq #59,d0
    30f6:	2f40 009c      	move.l d0,156(sp)
    30fa:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3100:	2c40           	movea.l d0,a6
    3102:	222f 00a4      	move.l 164(sp),d1
    3106:	242f 00a0      	move.l 160(sp),d2
    310a:	262f 009c      	move.l 156(sp),d3
    310e:	4eae ffd0      	jsr -48(a6)
    3112:	2f40 0098      	move.l d0,152(sp)
            "ZoomCopperlist: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    3116:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    311c:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    3122:	4878 001c      	pea 1c <_start+0x1c>
    3126:	2f00           	move.l d0,-(sp)
    3128:	4eba f6e6      	jsr 2810 <TestCopperlistPos>(pc)
    312c:	4fef 000c      	lea 12(sp),sp
    3130:	4a80           	tst.l d0
    3132:	6642           	bne.s 3176 <ZoomTestDisplay+0x1c6>
    Write(Output(), 
    3134:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    313a:	2c40           	movea.l d0,a6
    313c:	4eae ffc4      	jsr -60(a6)
    3140:	2f40 0094      	move.l d0,148(sp)
    3144:	202f 0094      	move.l 148(sp),d0
    3148:	2f40 0090      	move.l d0,144(sp)
    314c:	2f7c 0000 8209 	move.l #33289,140(sp)
    3152:	008c 
    3154:	703c           	moveq #60,d0
    3156:	2f40 0088      	move.l d0,136(sp)
    315a:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3160:	2c40           	movea.l d0,a6
    3162:	222f 0090      	move.l 144(sp),d1
    3166:	242f 008c      	move.l 140(sp),d2
    316a:	262f 0088      	move.l 136(sp),d3
    316e:	4eae ffd0      	jsr -48(a6)
    3172:	2f40 0084      	move.l d0,132(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    3176:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    317c:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    3182:	4878 001d      	pea 1d <_start+0x1d>
    3186:	2f00           	move.l d0,-(sp)
    3188:	4eba f686      	jsr 2810 <TestCopperlistPos>(pc)
    318c:	4fef 000c      	lea 12(sp),sp
    3190:	4a80           	tst.l d0
    3192:	6642           	bne.s 31d6 <ZoomTestDisplay+0x226>
    Write(Output(), 
    3194:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    319a:	2c40           	movea.l d0,a6
    319c:	4eae ffc4      	jsr -60(a6)
    31a0:	2f40 0080      	move.l d0,128(sp)
    31a4:	202f 0080      	move.l 128(sp),d0
    31a8:	2f40 007c      	move.l d0,124(sp)
    31ac:	2f7c 0000 8246 	move.l #33350,120(sp)
    31b2:	0078 
    31b4:	703c           	moveq #60,d0
    31b6:	2f40 0074      	move.l d0,116(sp)
    31ba:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    31c0:	2c40           	movea.l d0,a6
    31c2:	222f 007c      	move.l 124(sp),d1
    31c6:	242f 0078      	move.l 120(sp),d2
    31ca:	262f 0074      	move.l 116(sp),d3
    31ce:	4eae ffd0      	jsr -48(a6)
    31d2:	2f40 0070      	move.l d0,112(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1pl should be 00f4\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    31d6:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    31dc:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    31e2:	4878 001e      	pea 1e <_start+0x1e>
    31e6:	2f00           	move.l d0,-(sp)
    31e8:	4eba f626      	jsr 2810 <TestCopperlistPos>(pc)
    31ec:	4fef 000c      	lea 12(sp),sp
    31f0:	4a80           	tst.l d0
    31f2:	6642           	bne.s 3236 <ZoomTestDisplay+0x286>
    Write(Output(), 
    31f4:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    31fa:	2c40           	movea.l d0,a6
    31fc:	4eae ffc4      	jsr -60(a6)
    3200:	2f40 006c      	move.l d0,108(sp)
    3204:	202f 006c      	move.l 108(sp),d0
    3208:	2f40 0068      	move.l d0,104(sp)
    320c:	2f7c 0000 8283 	move.l #33411,100(sp)
    3212:	0064 
    3214:	703c           	moveq #60,d0
    3216:	2f40 0060      	move.l d0,96(sp)
    321a:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3220:	2c40           	movea.l d0,a6
    3222:	222f 0068      	move.l 104(sp),d1
    3226:	242f 0064      	move.l 100(sp),d2
    322a:	262f 0060      	move.l 96(sp),d3
    322e:	4eae ffd0      	jsr -48(a6)
    3232:	2f40 005c      	move.l d0,92(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    3236:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    323c:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    3242:	4878 001f      	pea 1f <_start+0x1f>
    3246:	2f00           	move.l d0,-(sp)
    3248:	4eba f5c6      	jsr 2810 <TestCopperlistPos>(pc)
    324c:	4fef 000c      	lea 12(sp),sp
    3250:	4a80           	tst.l d0
    3252:	6642           	bne.s 3296 <ZoomTestDisplay+0x2e6>
    Write(Output(), 
    3254:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    325a:	2c40           	movea.l d0,a6
    325c:	4eae ffc4      	jsr -60(a6)
    3260:	2f40 0058      	move.l d0,88(sp)
    3264:	202f 0058      	move.l 88(sp),d0
    3268:	2f40 0054      	move.l d0,84(sp)
    326c:	2f7c 0000 82c0 	move.l #33472,80(sp)
    3272:	0050 
    3274:	703c           	moveq #60,d0
    3276:	2f40 004c      	move.l d0,76(sp)
    327a:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3280:	2c40           	movea.l d0,a6
    3282:	222f 0054      	move.l 84(sp),d1
    3286:	242f 0050      	move.l 80(sp),d2
    328a:	262f 004c      	move.l 76(sp),d3
    328e:	4eae ffd0      	jsr -48(a6)
    3292:	2f40 0048      	move.l d0,72(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2pl should be 0034\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    3296:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    329c:	4878 0020      	pea 20 <_start+0x20>
    32a0:	4879 0000 a614 	pea a614 <ClColor>
    32a6:	4878 0026      	pea 26 <_start+0x26>
    32aa:	2f00           	move.l d0,-(sp)
    32ac:	4eba f524      	jsr 27d2 <TestCopperlistBatch>(pc)
    32b0:	4fef 0010      	lea 16(sp),sp
    32b4:	4a80           	tst.l d0
    32b6:	6642           	bne.s 32fa <ZoomTestDisplay+0x34a>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    32b8:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    32be:	2c40           	movea.l d0,a6
    32c0:	4eae ffc4      	jsr -60(a6)
    32c4:	2f40 0044      	move.l d0,68(sp)
    32c8:	202f 0044      	move.l 68(sp),d0
    32cc:	2f40 0040      	move.l d0,64(sp)
    32d0:	2f7c 0000 82fd 	move.l #33533,60(sp)
    32d6:	003c 
    32d8:	7025           	moveq #37,d0
    32da:	2f40 0038      	move.l d0,56(sp)
    32de:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    32e4:	2c40           	movea.l d0,a6
    32e6:	222f 0040      	move.l 64(sp),d1
    32ea:	242f 003c      	move.l 60(sp),d2
    32ee:	262f 0038      	move.l 56(sp),d3
    32f2:	4eae ffd0      	jsr -48(a6)
    32f6:	2f40 0034      	move.l d0,52(sp)

  /*if(  TestCopperlistBatch(  Copperlist1, 71, Cl102ZoomRepeat, 21) == 0)
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36); */
  
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    32fa:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    3300:	2f00           	move.l d0,-(sp)
    3302:	4878 000f      	pea f <_start+0xf>
    3306:	4eba d104      	jsr 40c <Zoom_Shrink102>(pc)
    330a:	508f           	addq.l #8,sp
  if( TestCopperListZoom102( Copperlist1, 73, Cl102ZoomTest) == 0)
    330c:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    3312:	4879 0000 b8ac 	pea b8ac <Cl102ZoomTest>
    3318:	4878 0049      	pea 49 <_start+0x49>
    331c:	2f00           	move.l d0,-(sp)
    331e:	4eba 00c4      	jsr 33e4 <TestCopperListZoom102>(pc)
    3322:	4fef 000c      	lea 12(sp),sp
    3326:	4a80           	tst.l d0
    3328:	6642           	bne.s 336c <ZoomTestDisplay+0x3bc>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    332a:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3330:	2c40           	movea.l d0,a6
    3332:	4eae ffc4      	jsr -60(a6)
    3336:	2f40 0030      	move.l d0,48(sp)
    333a:	202f 0030      	move.l 48(sp),d0
    333e:	2f40 002c      	move.l d0,44(sp)
    3342:	2f7c 0000 8323 	move.l #33571,40(sp)
    3348:	0028 
    334a:	7025           	moveq #37,d0
    334c:	2f40 0024      	move.l d0,36(sp)
    3350:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3356:	2c40           	movea.l d0,a6
    3358:	222f 002c      	move.l 44(sp),d1
    335c:	242f 0028      	move.l 40(sp),d2
    3360:	262f 0024      	move.l 36(sp),d3
    3364:	4eae ffd0      	jsr -48(a6)
    3368:	2f40 0020      	move.l d0,32(sp)

  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    336c:	2039 004d 2c0c 	move.l 4d2c0c <Copperlist1>,d0
    3372:	4878 fffe      	pea fffffffe <_end+0xffb2d382>
    3376:	4878 00bb      	pea bb <WaitBlt+0x7>
    337a:	2f00           	move.l d0,-(sp)
    337c:	4eba f492      	jsr 2810 <TestCopperlistPos>(pc)
    3380:	4fef 000c      	lea 12(sp),sp
    3384:	4a80           	tst.l d0
    3386:	6642           	bne.s 33ca <ZoomTestDisplay+0x41a>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    3388:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    338e:	2c40           	movea.l d0,a6
    3390:	4eae ffc4      	jsr -60(a6)
    3394:	2f40 001c      	move.l d0,28(sp)
    3398:	202f 001c      	move.l 28(sp),d0
    339c:	2f40 0018      	move.l d0,24(sp)
    33a0:	2f7c 0000 8348 	move.l #33608,20(sp)
    33a6:	0014 
    33a8:	7032           	moveq #50,d0
    33aa:	2f40 0010      	move.l d0,16(sp)
    33ae:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    33b4:	2c40           	movea.l d0,a6
    33b6:	222f 0018      	move.l 24(sp),d1
    33ba:	242f 0014      	move.l 20(sp),d2
    33be:	262f 0010      	move.l 16(sp),d3
    33c2:	4eae ffd0      	jsr -48(a6)
    33c6:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    33ca:	2f3c 0000 df20 	move.l #57120,-(sp)
    33d0:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    33d4:	4eba cd0a      	jsr e0 <FreeDisplay>(pc)
    33d8:	508f           	addq.l #8,sp

}
    33da:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    33de:	4fef 00c8      	lea 200(sp),sp
    33e2:	4e75           	rts

000033e4 <TestCopperListZoom102>:

int TestCopperListZoom102( ULONG *cl2test, UWORD position, 
                                                           ULONG *template4cl) {
    33e4:	598f           	subq.l #4,sp
    33e6:	202f 000c      	move.l 12(sp),d0
    33ea:	3000           	move.w d0,d0
    33ec:	3f40 0002      	move.w d0,2(sp)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    33f0:	7000           	moveq #0,d0
    33f2:	302f 0002      	move.w 2(sp),d0
    33f6:	4878 001c      	pea 1c <_start+0x1c>
    33fa:	2f2f 0014      	move.l 20(sp),-(sp)
    33fe:	2f00           	move.l d0,-(sp)
    3400:	2f2f 0014      	move.l 20(sp),-(sp)
    3404:	4eba f3cc      	jsr 27d2 <TestCopperlistBatch>(pc)
    3408:	4fef 0010      	lea 16(sp),sp
    340c:	4a80           	tst.l d0
    340e:	6604           	bne.s 3414 <TestCopperListZoom102+0x30>
    return 0;
    3410:	7000           	moveq #0,d0
    3412:	6062           	bra.s 3476 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    3414:	7078           	moveq #120,d0
    3416:	d0af 0010      	add.l 16(sp),d0
    341a:	7200           	moveq #0,d1
    341c:	322f 0002      	move.w 2(sp),d1
    3420:	307c 001e      	movea.w #30,a0
    3424:	d1c1           	adda.l d1,a0
    3426:	4878 0036      	pea 36 <_start+0x36>
    342a:	2f00           	move.l d0,-(sp)
    342c:	2f08           	move.l a0,-(sp)
    342e:	2f2f 0014      	move.l 20(sp),-(sp)
    3432:	4eba f39e      	jsr 27d2 <TestCopperlistBatch>(pc)
    3436:	4fef 0010      	lea 16(sp),sp
    343a:	4a80           	tst.l d0
    343c:	6604           	bne.s 3442 <TestCopperListZoom102+0x5e>
    return 0;
    343e:	7000           	moveq #0,d0
    3440:	6034           	bra.s 3476 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    3442:	202f 0010      	move.l 16(sp),d0
    3446:	0680 0000 0158 	addi.l #344,d0
    344c:	7200           	moveq #0,d1
    344e:	322f 0002      	move.w 2(sp),d1
    3452:	307c 0056      	movea.w #86,a0
    3456:	d1c1           	adda.l d1,a0
    3458:	4878 001c      	pea 1c <_start+0x1c>
    345c:	2f00           	move.l d0,-(sp)
    345e:	2f08           	move.l a0,-(sp)
    3460:	2f2f 0014      	move.l 20(sp),-(sp)
    3464:	4eba f36c      	jsr 27d2 <TestCopperlistBatch>(pc)
    3468:	4fef 0010      	lea 16(sp),sp
    346c:	4a80           	tst.l d0
    346e:	6604           	bne.s 3474 <TestCopperListZoom102+0x90>
    return 0;
    3470:	7000           	moveq #0,d0
    3472:	6002           	bra.s 3476 <TestCopperListZoom102+0x92>
 
  return 1;
    3474:	7001           	moveq #1,d0
}
    3476:	588f           	addq.l #4,sp
    3478:	4e75           	rts

0000347a <TestBlitleftOfZoom>:

void TestBlitleftOfZoom() {
    347a:	4fef ff94      	lea -108(sp),sp
    347e:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Zoom_Init();
    3482:	4eba dfac      	jsr 1430 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    3486:	4eba e342      	jsr 17ca <PrepareDisplayZoom>(pc)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    348a:	2f7c 0000 c800 	move.l #51200,116(sp)
    3490:	0074 
    3492:	7002           	moveq #2,d0
    3494:	2f40 0070      	move.l d0,112(sp)
    3498:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    349e:	2c40           	movea.l d0,a6
    34a0:	202f 0074      	move.l 116(sp),d0
    34a4:	222f 0070      	move.l 112(sp),d1
    34a8:	4eae ff3a      	jsr -198(a6)
    34ac:	2f40 006c      	move.l d0,108(sp)
    34b0:	202f 006c      	move.l 108(sp),d0
    34b4:	23c0 004d 2c56 	move.l d0,4d2c56 <Zoom_Source>
  if( Zoom_Source == 0) {
    34ba:	2039 004d 2c56 	move.l 4d2c56 <Zoom_Source>,d0
    34c0:	6646           	bne.s 3508 <TestBlitleftOfZoom+0x8e>
    Write(  Output(), 
    34c2:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    34c8:	2c40           	movea.l d0,a6
    34ca:	4eae ffc4      	jsr -60(a6)
    34ce:	2f40 001c      	move.l d0,28(sp)
    34d2:	202f 001c      	move.l 28(sp),d0
    34d6:	2f40 0018      	move.l d0,24(sp)
    34da:	2f7c 0000 837b 	move.l #33659,20(sp)
    34e0:	0014 
    34e2:	7236           	moveq #54,d1
    34e4:	2f41 0010      	move.l d1,16(sp)
    34e8:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    34ee:	2c40           	movea.l d0,a6
    34f0:	222f 0018      	move.l 24(sp),d1
    34f4:	242f 0014      	move.l 20(sp),d2
    34f8:	262f 0010      	move.l 16(sp),d3
    34fc:	4eae ffd0      	jsr -48(a6)
    3500:	2f40 000c      	move.l d0,12(sp)
    3504:	6000 01fe      	bra.w 3704 <TestBlitleftOfZoom+0x28a>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  
  UWORD *tstsource = Zoom_Source;
    3508:	2f79 004d 2c56 	move.l 4d2c56 <Zoom_Source>,104(sp)
    350e:	0068 
  *tstsource++ = 0x0000;
    3510:	202f 0068      	move.l 104(sp),d0
    3514:	2200           	move.l d0,d1
    3516:	5481           	addq.l #2,d1
    3518:	2f41 0068      	move.l d1,104(sp)
    351c:	2040           	movea.l d0,a0
    351e:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    3520:	206f 0068      	movea.l 104(sp),a0
    3524:	30bc 0080      	move.w #128,(a0)
  tstsource += ZMLINESIZE/2-1;
    3528:	7028           	moveq #40,d0
    352a:	d1af 0068      	add.l d0,104(sp)
  *tstsource = 0x1000;
    352e:	206f 0068      	movea.l 104(sp),a0
    3532:	30bc 1000      	move.w #4096,(a0)
  tstsource++;
    3536:	54af 0068      	addq.l #2,104(sp)
  *tstsource = 0x8e88;
    353a:	206f 0068      	movea.l 104(sp),a0
    353e:	30bc 8e88      	move.w #-29048,(a0)
  tstsource += ZMLINESIZE/2-1;
    3542:	7228           	moveq #40,d1
    3544:	d3af 0068      	add.l d1,104(sp)

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
    3548:	2039 004d 2c56 	move.l 4d2c56 <Zoom_Source>,d0
    354e:	2200           	move.l d0,d1
    3550:	0681 0000 14d6 	addi.l #5334,d1
    3556:	2f41 0068      	move.l d1,104(sp)
  *tstsource++ = 0x0000;
    355a:	202f 0068      	move.l 104(sp),d0
    355e:	2200           	move.l d0,d1
    3560:	5481           	addq.l #2,d1
    3562:	2f41 0068      	move.l d1,104(sp)
    3566:	2040           	movea.l d0,a0
    3568:	4250           	clr.w (a0)
  *tstsource = 0x00ff;
    356a:	206f 0068      	movea.l 104(sp),a0
    356e:	30bc 00ff      	move.w #255,(a0)
  WaitBlit();
    3572:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    3578:	2c40           	movea.l d0,a6
    357a:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    357e:	4eba e3c2      	jsr 1942 <Init_Blit>(pc)
  Init_ZoomBlit( 7, 16, 0);
    3582:	42a7           	clr.l -(sp)
    3584:	4878 0010      	pea 10 <_start+0x10>
    3588:	4878 0007      	pea 7 <_start+0x7>
    358c:	4eba e430      	jsr 19be <Init_ZoomBlit>(pc)
    3590:	4fef 000c      	lea 12(sp),sp
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    3594:	2239 004d 2c14 	move.l 4d2c14 <DrawBuffer>,d1
    359a:	2039 004d 2c56 	move.l 4d2c56 <Zoom_Source>,d0
    35a0:	4878 0080      	pea 80 <_start+0x80>
    35a4:	2f01           	move.l d1,-(sp)
    35a6:	2f00           	move.l d0,-(sp)
    35a8:	4eba d9f4      	jsr f9e <Zoom_ZoomBlit>(pc)
    35ac:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    35b0:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    35b6:	2c40           	movea.l d0,a6
    35b8:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    35bc:	2039 004d 2c14 	move.l 4d2c14 <DrawBuffer>,d0
    35c2:	2200           	move.l d0,d1
    35c4:	5481           	addq.l #2,d1
    35c6:	2f41 0064      	move.l d1,100(sp)
  if( *destination != 0x0180) {
    35ca:	206f 0064      	movea.l 100(sp),a0
    35ce:	3010           	move.w (a0),d0
    35d0:	0c40 0180      	cmpi.w #384,d0
    35d4:	6742           	beq.s 3618 <TestBlitleftOfZoom+0x19e>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    35d6:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    35dc:	2c40           	movea.l d0,a6
    35de:	4eae ffc4      	jsr -60(a6)
    35e2:	2f40 0060      	move.l d0,96(sp)
    35e6:	202f 0060      	move.l 96(sp),d0
    35ea:	2f40 005c      	move.l d0,92(sp)
    35ee:	2f7c 0000 83b3 	move.l #33715,88(sp)
    35f4:	0058 
    35f6:	701c           	moveq #28,d0
    35f8:	2f40 0054      	move.l d0,84(sp)
    35fc:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3602:	2c40           	movea.l d0,a6
    3604:	222f 005c      	move.l 92(sp),d1
    3608:	242f 0058      	move.l 88(sp),d2
    360c:	262f 0054      	move.l 84(sp),d3
    3610:	4eae ffd0      	jsr -48(a6)
    3614:	2f40 0050      	move.l d0,80(sp)
  }
  destination += ZMLINESIZE/2;
    3618:	722a           	moveq #42,d1
    361a:	d3af 0064      	add.l d1,100(sp)
  if( *destination != 0x1d88)
    361e:	206f 0064      	movea.l 100(sp),a0
    3622:	3010           	move.w (a0),d0
    3624:	0c40 1d88      	cmpi.w #7560,d0
    3628:	6742           	beq.s 366c <TestBlitleftOfZoom+0x1f2>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    362a:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3630:	2c40           	movea.l d0,a6
    3632:	4eae ffc4      	jsr -60(a6)
    3636:	2f40 004c      	move.l d0,76(sp)
    363a:	202f 004c      	move.l 76(sp),d0
    363e:	2f40 0048      	move.l d0,72(sp)
    3642:	2f7c 0000 83d0 	move.l #33744,68(sp)
    3648:	0044 
    364a:	701c           	moveq #28,d0
    364c:	2f40 0040      	move.l d0,64(sp)
    3650:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3656:	2c40           	movea.l d0,a6
    3658:	222f 0048      	move.l 72(sp),d1
    365c:	242f 0044      	move.l 68(sp),d2
    3660:	262f 0040      	move.l 64(sp),d3
    3664:	4eae ffd0      	jsr -48(a6)
    3668:	2f40 003c      	move.l d0,60(sp)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
    366c:	2039 004d 2c14 	move.l 4d2c14 <DrawBuffer>,d0
    3672:	2200           	move.l d0,d1
    3674:	0681 0000 14d6 	addi.l #5334,d1
    367a:	2f41 0064      	move.l d1,100(sp)
  destination++;
    367e:	54af 0064      	addq.l #2,100(sp)
  if( *destination != 0x01ff) {
    3682:	206f 0064      	movea.l 100(sp),a0
    3686:	3010           	move.w (a0),d0
    3688:	0c40 01ff      	cmpi.w #511,d0
    368c:	6742           	beq.s 36d0 <TestBlitleftOfZoom+0x256>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    368e:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3694:	2c40           	movea.l d0,a6
    3696:	4eae ffc4      	jsr -60(a6)
    369a:	2f40 0038      	move.l d0,56(sp)
    369e:	202f 0038      	move.l 56(sp),d0
    36a2:	2f40 0034      	move.l d0,52(sp)
    36a6:	2f7c 0000 83ed 	move.l #33773,48(sp)
    36ac:	0030 
    36ae:	701a           	moveq #26,d0
    36b0:	2f40 002c      	move.l d0,44(sp)
    36b4:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    36ba:	2c40           	movea.l d0,a6
    36bc:	222f 0034      	move.l 52(sp),d1
    36c0:	242f 0030      	move.l 48(sp),d2
    36c4:	262f 002c      	move.l 44(sp),d3
    36c8:	4eae ffd0      	jsr -48(a6)
    36cc:	2f40 0028      	move.l d0,40(sp)
  }
  FreeMem( Zoom_Source, 40*256*5);
    36d0:	2f79 004d 2c56 	move.l 4d2c56 <Zoom_Source>,36(sp)
    36d6:	0024 
    36d8:	2f7c 0000 c800 	move.l #51200,32(sp)
    36de:	0020 
    36e0:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    36e6:	2c40           	movea.l d0,a6
    36e8:	226f 0024      	movea.l 36(sp),a1
    36ec:	202f 0020      	move.l 32(sp),d0
    36f0:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    36f4:	2f3c 0000 df20 	move.l #57120,-(sp)
    36fa:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    36fe:	4eba c9e0      	jsr e0 <FreeDisplay>(pc)
    3702:	508f           	addq.l #8,sp
}
    3704:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3708:	4fef 006c      	lea 108(sp),sp
    370c:	4e75           	rts

0000370e <TestCopyWord>:

void TestCopyWord() {
    370e:	4fef ff74      	lea -140(sp),sp
    3712:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    3716:	2f7c 0000 04ec 	move.l #1260,136(sp)
    371c:	0088 
    371e:	7002           	moveq #2,d0
    3720:	2f40 0084      	move.l d0,132(sp)
    3724:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    372a:	2c40           	movea.l d0,a6
    372c:	202f 0088      	move.l 136(sp),d0
    3730:	222f 0084      	move.l 132(sp),d1
    3734:	4eae ff3a      	jsr -198(a6)
    3738:	2f40 0080      	move.l d0,128(sp)
    373c:	202f 0080      	move.l 128(sp),d0
    3740:	2f40 007c      	move.l d0,124(sp)
  if( source == 0) {
    3744:	6646           	bne.s 378c <TestCopyWord+0x7e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3746:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    374c:	2c40           	movea.l d0,a6
    374e:	4eae ffc4      	jsr -60(a6)
    3752:	2f40 001c      	move.l d0,28(sp)
    3756:	202f 001c      	move.l 28(sp),d0
    375a:	2f40 0018      	move.l d0,24(sp)
    375e:	2f7c 0000 8408 	move.l #33800,20(sp)
    3764:	0014 
    3766:	7235           	moveq #53,d1
    3768:	2f41 0010      	move.l d1,16(sp)
    376c:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3772:	2c40           	movea.l d0,a6
    3774:	222f 0018      	move.l 24(sp),d1
    3778:	242f 0014      	move.l 20(sp),d2
    377c:	262f 0010      	move.l 16(sp),d3
    3780:	4eae ffd0      	jsr -48(a6)
    3784:	2f40 000c      	move.l d0,12(sp)
    3788:	6000 026c      	bra.w 39f6 <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    378c:	2f7c 0000 04ec 	move.l #1260,120(sp)
    3792:	0078 
    3794:	7002           	moveq #2,d0
    3796:	2f40 0074      	move.l d0,116(sp)
    379a:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    37a0:	2c40           	movea.l d0,a6
    37a2:	202f 0078      	move.l 120(sp),d0
    37a6:	222f 0074      	move.l 116(sp),d1
    37aa:	4eae ff3a      	jsr -198(a6)
    37ae:	2f40 0070      	move.l d0,112(sp)
    37b2:	202f 0070      	move.l 112(sp),d0
    37b6:	2f40 006c      	move.l d0,108(sp)
  if( destination == 0) {
    37ba:	6646           	bne.s 3802 <TestCopyWord+0xf4>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    37bc:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    37c2:	2c40           	movea.l d0,a6
    37c4:	4eae ffc4      	jsr -60(a6)
    37c8:	2f40 0030      	move.l d0,48(sp)
    37cc:	202f 0030      	move.l 48(sp),d0
    37d0:	2f40 002c      	move.l d0,44(sp)
    37d4:	2f7c 0000 8408 	move.l #33800,40(sp)
    37da:	0028 
    37dc:	7235           	moveq #53,d1
    37de:	2f41 0024      	move.l d1,36(sp)
    37e2:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    37e8:	2c40           	movea.l d0,a6
    37ea:	222f 002c      	move.l 44(sp),d1
    37ee:	242f 0028      	move.l 40(sp),d2
    37f2:	262f 0024      	move.l 36(sp),d3
    37f6:	4eae ffd0      	jsr -48(a6)
    37fa:	2f40 0020      	move.l d0,32(sp)
    37fe:	6000 01f6      	bra.w 39f6 <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
    3802:	2f6f 007c 0094 	move.l 124(sp),148(sp)
  for( int i=0; i<8;i++) {
    3808:	42af 0090      	clr.l 144(sp)
    380c:	6000 0086      	bra.w 3894 <TestCopyWord+0x186>
    *tmp++ = 0;
    3810:	202f 0094      	move.l 148(sp),d0
    3814:	2200           	move.l d0,d1
    3816:	5481           	addq.l #2,d1
    3818:	2f41 0094      	move.l d1,148(sp)
    381c:	2040           	movea.l d0,a0
    381e:	4250           	clr.w (a0)
    *tmp++ = 0xaaaa;
    3820:	202f 0094      	move.l 148(sp),d0
    3824:	2200           	move.l d0,d1
    3826:	5481           	addq.l #2,d1
    3828:	2f41 0094      	move.l d1,148(sp)
    382c:	2040           	movea.l d0,a0
    382e:	30bc aaaa      	move.w #-21846,(a0)
    *tmp++ = 0xaaaa;
    3832:	202f 0094      	move.l 148(sp),d0
    3836:	2200           	move.l d0,d1
    3838:	5481           	addq.l #2,d1
    383a:	2f41 0094      	move.l d1,148(sp)
    383e:	2040           	movea.l d0,a0
    3840:	30bc aaaa      	move.w #-21846,(a0)
    *tmp = 0;
    3844:	206f 0094      	movea.l 148(sp),a0
    3848:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    384a:	7024           	moveq #36,d0
    384c:	d1af 0094      	add.l d0,148(sp)
    *tmp++ = 0;
    3850:	202f 0094      	move.l 148(sp),d0
    3854:	2200           	move.l d0,d1
    3856:	5481           	addq.l #2,d1
    3858:	2f41 0094      	move.l d1,148(sp)
    385c:	2040           	movea.l d0,a0
    385e:	4250           	clr.w (a0)
    *tmp++ = 0x5555;
    3860:	202f 0094      	move.l 148(sp),d0
    3864:	2200           	move.l d0,d1
    3866:	5481           	addq.l #2,d1
    3868:	2f41 0094      	move.l d1,148(sp)
    386c:	2040           	movea.l d0,a0
    386e:	30bc 5555      	move.w #21845,(a0)
    *tmp++ = 0x5555;
    3872:	202f 0094      	move.l 148(sp),d0
    3876:	2200           	move.l d0,d1
    3878:	5481           	addq.l #2,d1
    387a:	2f41 0094      	move.l d1,148(sp)
    387e:	2040           	movea.l d0,a0
    3880:	30bc 5555      	move.w #21845,(a0)
    *tmp = 0;
    3884:	206f 0094      	movea.l 148(sp),a0
    3888:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    388a:	7024           	moveq #36,d0
    388c:	d1af 0094      	add.l d0,148(sp)
  for( int i=0; i<8;i++) {
    3890:	52af 0090      	addq.l #1,144(sp)
    3894:	7207           	moveq #7,d1
    3896:	b2af 0090      	cmp.l 144(sp),d1
    389a:	6c00 ff74      	bge.w 3810 <TestCopyWord+0x102>
  }
  tmp = destination;
    389e:	2f6f 006c 0094 	move.l 108(sp),148(sp)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    38a4:	42af 008c      	clr.l 140(sp)
    38a8:	6014           	bra.s 38be <TestCopyWord+0x1b0>
    *tmp++ = 0;
    38aa:	202f 0094      	move.l 148(sp),d0
    38ae:	2200           	move.l d0,d1
    38b0:	5481           	addq.l #2,d1
    38b2:	2f41 0094      	move.l d1,148(sp)
    38b6:	2040           	movea.l d0,a0
    38b8:	4250           	clr.w (a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    38ba:	52af 008c      	addq.l #1,140(sp)
    38be:	0caf 0000 0275 	cmpi.l #629,140(sp)
    38c4:	008c 
    38c6:	6fe2           	ble.s 38aa <TestCopyWord+0x19c>
  }

  WaitBlit();
    38c8:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    38ce:	2c40           	movea.l d0,a6
    38d0:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
    38d4:	4eba db5a      	jsr 1430 <Zoom_Init>(pc)
  Init_Copy( 3);
    38d8:	4878 0003      	pea 3 <_start+0x3>
    38dc:	4eba e184      	jsr 1a62 <Init_Copy>(pc)
    38e0:	588f           	addq.l #4,sp
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
    38e2:	202f 007c      	move.l 124(sp),d0
    38e6:	5480           	addq.l #2,d0
    38e8:	4878 0010      	pea 10 <_start+0x10>
    38ec:	2f2f 0070      	move.l 112(sp),-(sp)
    38f0:	2f00           	move.l d0,-(sp)
    38f2:	4eba d66c      	jsr f60 <Zoom_CopyWord>(pc)
    38f6:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    38fa:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    3900:	2c40           	movea.l d0,a6
    3902:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
    3906:	202f 006c      	move.l 108(sp),d0
    390a:	5480           	addq.l #2,d0
    390c:	2f40 0094      	move.l d0,148(sp)
  if( *tmp != 0x5555) 
    3910:	206f 0094      	movea.l 148(sp),a0
    3914:	3010           	move.w (a0),d0
    3916:	0c40 5555      	cmpi.w #21845,d0
    391a:	6742           	beq.s 395e <TestCopyWord+0x250>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    391c:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3922:	2c40           	movea.l d0,a6
    3924:	4eae ffc4      	jsr -60(a6)
    3928:	2f40 0068      	move.l d0,104(sp)
    392c:	202f 0068      	move.l 104(sp),d0
    3930:	2f40 0064      	move.l d0,100(sp)
    3934:	2f7c 0000 843e 	move.l #33854,96(sp)
    393a:	0060 
    393c:	721f           	moveq #31,d1
    393e:	2f41 005c      	move.l d1,92(sp)
    3942:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3948:	2c40           	movea.l d0,a6
    394a:	222f 0064      	move.l 100(sp),d1
    394e:	242f 0060      	move.l 96(sp),d2
    3952:	262f 005c      	move.l 92(sp),d3
    3956:	4eae ffd0      	jsr -48(a6)
    395a:	2f40 0058      	move.l d0,88(sp)
  tmp += ZMLINESIZE/2;
    395e:	702a           	moveq #42,d0
    3960:	d1af 0094      	add.l d0,148(sp)
  if( *tmp != 0xaaaa)
    3964:	206f 0094      	movea.l 148(sp),a0
    3968:	3010           	move.w (a0),d0
    396a:	0c40 aaaa      	cmpi.w #-21846,d0
    396e:	6742           	beq.s 39b2 <TestCopyWord+0x2a4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    3970:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3976:	2c40           	movea.l d0,a6
    3978:	4eae ffc4      	jsr -60(a6)
    397c:	2f40 0054      	move.l d0,84(sp)
    3980:	202f 0054      	move.l 84(sp),d0
    3984:	2f40 0050      	move.l d0,80(sp)
    3988:	2f7c 0000 845e 	move.l #33886,76(sp)
    398e:	004c 
    3990:	7220           	moveq #32,d1
    3992:	2f41 0048      	move.l d1,72(sp)
    3996:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    399c:	2c40           	movea.l d0,a6
    399e:	222f 0050      	move.l 80(sp),d1
    39a2:	242f 004c      	move.l 76(sp),d2
    39a6:	262f 0048      	move.l 72(sp),d3
    39aa:	4eae ffd0      	jsr -48(a6)
    39ae:	2f40 0044      	move.l d0,68(sp)
  
  FreeMem( source,ZMLINESIZE*30);
    39b2:	2f6f 007c 0040 	move.l 124(sp),64(sp)
    39b8:	2f7c 0000 04ec 	move.l #1260,60(sp)
    39be:	003c 
    39c0:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    39c6:	2c40           	movea.l d0,a6
    39c8:	226f 0040      	movea.l 64(sp),a1
    39cc:	202f 003c      	move.l 60(sp),d0
    39d0:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    39d4:	2f6f 006c 0038 	move.l 108(sp),56(sp)
    39da:	2f7c 0000 04ec 	move.l #1260,52(sp)
    39e0:	0034 
    39e2:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    39e8:	2c40           	movea.l d0,a6
    39ea:	226f 0038      	movea.l 56(sp),a1
    39ee:	202f 0034      	move.l 52(sp),d0
    39f2:	4eae ff2e      	jsr -210(a6)
}
    39f6:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    39fa:	4fef 008c      	lea 140(sp),sp
    39fe:	4e75           	rts

00003a00 <TestZoom4PictureOn5Planes>:
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */


void TestZoom4PictureOn5Planes() {
    3a00:	4fef ff74      	lea -140(sp),sp
    3a04:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3a08:	2f7c 0000 f460 	move.l #62560,102(sp)
    3a0e:	0066 
    3a10:	7002           	moveq #2,d0
    3a12:	2f40 0062      	move.l d0,98(sp)
    3a16:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    3a1c:	2c40           	movea.l d0,a6
    3a1e:	202f 0066      	move.l 102(sp),d0
    3a22:	222f 0062      	move.l 98(sp),d1
    3a26:	4eae ff3a      	jsr -198(a6)
    3a2a:	2f40 005e      	move.l d0,94(sp)
    3a2e:	202f 005e      	move.l 94(sp),d0
    3a32:	2f40 005a      	move.l d0,90(sp)
  if( source == 0) {
    3a36:	6646           	bne.s 3a7e <TestZoom4PictureOn5Planes+0x7e>
    Write(  Output(), 
    3a38:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3a3e:	2c40           	movea.l d0,a6
    3a40:	4eae ffc4      	jsr -60(a6)
    3a44:	2f40 001e      	move.l d0,30(sp)
    3a48:	202f 001e      	move.l 30(sp),d0
    3a4c:	2f40 001a      	move.l d0,26(sp)
    3a50:	2f7c 0000 847f 	move.l #33919,22(sp)
    3a56:	0016 
    3a58:	7239           	moveq #57,d1
    3a5a:	2f41 0012      	move.l d1,18(sp)
    3a5e:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3a64:	2c40           	movea.l d0,a6
    3a66:	222f 001a      	move.l 26(sp),d1
    3a6a:	242f 0016      	move.l 22(sp),d2
    3a6e:	262f 0012      	move.l 18(sp),d3
    3a72:	4eae ffd0      	jsr -48(a6)
    3a76:	2f40 000e      	move.l d0,14(sp)
    3a7a:	6000 0266      	bra.w 3ce2 <TestZoom4PictureOn5Planes+0x2e2>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3a7e:	2f7c 0000 f460 	move.l #62560,86(sp)
    3a84:	0056 
    3a86:	7002           	moveq #2,d0
    3a88:	2f40 0052      	move.l d0,82(sp)
    3a8c:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    3a92:	2c40           	movea.l d0,a6
    3a94:	202f 0056      	move.l 86(sp),d0
    3a98:	222f 0052      	move.l 82(sp),d1
    3a9c:	4eae ff3a      	jsr -198(a6)
    3aa0:	2f40 004e      	move.l d0,78(sp)
    3aa4:	202f 004e      	move.l 78(sp),d0
    3aa8:	2f40 004a      	move.l d0,74(sp)
  if( destination == 0) {
    3aac:	6646           	bne.s 3af4 <TestZoom4PictureOn5Planes+0xf4>
    Write(  Output(), 
    3aae:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3ab4:	2c40           	movea.l d0,a6
    3ab6:	4eae ffc4      	jsr -60(a6)
    3aba:	2f40 0032      	move.l d0,50(sp)
    3abe:	202f 0032      	move.l 50(sp),d0
    3ac2:	2f40 002e      	move.l d0,46(sp)
    3ac6:	2f7c 0000 84b9 	move.l #33977,42(sp)
    3acc:	002a 
    3ace:	723d           	moveq #61,d1
    3ad0:	2f41 0026      	move.l d1,38(sp)
    3ad4:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3ada:	2c40           	movea.l d0,a6
    3adc:	222f 002e      	move.l 46(sp),d1
    3ae0:	242f 002a      	move.l 42(sp),d2
    3ae4:	262f 0026      	move.l 38(sp),d3
    3ae8:	4eae ffd0      	jsr -48(a6)
    3aec:	2f40 0022      	move.l d0,34(sp)
    3af0:	6000 01f0      	bra.w 3ce2 <TestZoom4PictureOn5Planes+0x2e2>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3af4:	2f6f 005a 0094 	move.l 90(sp),148(sp)
  for(int i=0;i<128+8;i++) {
    3afa:	42af 0090      	clr.l 144(sp)
    3afe:	6050           	bra.s 3b50 <TestZoom4PictureOn5Planes+0x150>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b00:	42af 008c      	clr.l 140(sp)
    3b04:	6018           	bra.s 3b1e <TestZoom4PictureOn5Planes+0x11e>
      *tmp4source++ = 0x55555555;
    3b06:	202f 0094      	move.l 148(sp),d0
    3b0a:	2200           	move.l d0,d1
    3b0c:	5881           	addq.l #4,d1
    3b0e:	2f41 0094      	move.l d1,148(sp)
    3b12:	2040           	movea.l d0,a0
    3b14:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b1a:	52af 008c      	addq.l #1,140(sp)
    3b1e:	7031           	moveq #49,d0
    3b20:	b0af 008c      	cmp.l 140(sp),d0
    3b24:	6ce0           	bge.s 3b06 <TestZoom4PictureOn5Planes+0x106>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b26:	42af 0088      	clr.l 136(sp)
    3b2a:	6018           	bra.s 3b44 <TestZoom4PictureOn5Planes+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3b2c:	202f 0094      	move.l 148(sp),d0
    3b30:	2200           	move.l d0,d1
    3b32:	5881           	addq.l #4,d1
    3b34:	2f41 0094      	move.l d1,148(sp)
    3b38:	2040           	movea.l d0,a0
    3b3a:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b40:	52af 0088      	addq.l #1,136(sp)
    3b44:	7031           	moveq #49,d0
    3b46:	b0af 0088      	cmp.l 136(sp),d0
    3b4a:	6ce0           	bge.s 3b2c <TestZoom4PictureOn5Planes+0x12c>
  for(int i=0;i<128+8;i++) {
    3b4c:	52af 0090      	addq.l #1,144(sp)
    3b50:	0caf 0000 0087 	cmpi.l #135,144(sp)
    3b56:	0090 
    3b58:	6fa6           	ble.s 3b00 <TestZoom4PictureOn5Planes+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3b5a:	4878 0005      	pea 5 <_start+0x5>
    3b5e:	42a7           	clr.l -(sp)
    3b60:	2f2f 0052      	move.l 82(sp),-(sp)
    3b64:	2f2f 0066      	move.l 102(sp),-(sp)
    3b68:	4eba df32      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    3b6c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3b70:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    3b76:	2c40           	movea.l d0,a6
    3b78:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3b7c:	222f 004a      	move.l 74(sp),d1
    3b80:	5881           	addq.l #4,d1
    3b82:	2f41 0084      	move.l d1,132(sp)
  UWORD *valsupposed = destlinezoom1;
    3b86:	2f7c 0000 bad0 	move.l #47824,70(sp)
    3b8c:	0046 
  UWORD mask = 0xffff;
    3b8e:	3f7c ffff 0082 	move.w #-1,130(sp)
  for(int i=0;i<14;i++) {
    3b94:	42af 007e      	clr.l 126(sp)
    3b98:	6000 00a8      	bra.w 3c42 <TestZoom4PictureOn5Planes+0x242>
    for(int i2=0;i2<18;i2++) { 
    3b9c:	42af 007a      	clr.l 122(sp)
    3ba0:	604e           	bra.s 3bf0 <TestZoom4PictureOn5Planes+0x1f0>
      for( int i3=0;i3<5;i3++) {
    3ba2:	42af 0076      	clr.l 118(sp)
    3ba6:	6038           	bra.s 3be0 <TestZoom4PictureOn5Planes+0x1e0>
        TestRow( valsupposed, valactual, mask, i2+i*19);
    3ba8:	222f 007e      	move.l 126(sp),d1
    3bac:	2001           	move.l d1,d0
    3bae:	e788           	lsl.l #3,d0
    3bb0:	d081           	add.l d1,d0
    3bb2:	d080           	add.l d0,d0
    3bb4:	d081           	add.l d1,d0
    3bb6:	2200           	move.l d0,d1
    3bb8:	d2af 007a      	add.l 122(sp),d1
    3bbc:	7000           	moveq #0,d0
    3bbe:	302f 0082      	move.w 130(sp),d0
    3bc2:	2f01           	move.l d1,-(sp)
    3bc4:	2f00           	move.l d0,-(sp)
    3bc6:	2f2f 008c      	move.l 140(sp),-(sp)
    3bca:	2f2f 0052      	move.l 82(sp),-(sp)
    3bce:	4eba 2f7e      	jsr 6b4e <TestRow>(pc)
    3bd2:	4fef 0010      	lea 16(sp),sp
        valactual += ZMLINESIZE/2;
    3bd6:	702a           	moveq #42,d0
    3bd8:	d1af 0084      	add.l d0,132(sp)
      for( int i3=0;i3<5;i3++) {
    3bdc:	52af 0076      	addq.l #1,118(sp)
    3be0:	7204           	moveq #4,d1
    3be2:	b2af 0076      	cmp.l 118(sp),d1
    3be6:	6cc0           	bge.s 3ba8 <TestZoom4PictureOn5Planes+0x1a8>
      }
      mask = mask ^ 0xffff;
    3be8:	466f 0082      	not.w 130(sp)
    for(int i2=0;i2<18;i2++) { 
    3bec:	52af 007a      	addq.l #1,122(sp)
    3bf0:	7011           	moveq #17,d0
    3bf2:	b0af 007a      	cmp.l 122(sp),d0
    3bf6:	6caa           	bge.s 3ba2 <TestZoom4PictureOn5Planes+0x1a2>
    }
    for( int i3=0;i3<5;i3++) {
    3bf8:	42af 0072      	clr.l 114(sp)
    3bfc:	6038           	bra.s 3c36 <TestZoom4PictureOn5Planes+0x236>
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3bfe:	222f 007e      	move.l 126(sp),d1
    3c02:	2001           	move.l d1,d0
    3c04:	e788           	lsl.l #3,d0
    3c06:	d081           	add.l d1,d0
    3c08:	d080           	add.l d0,d0
    3c0a:	2040           	movea.l d0,a0
    3c0c:	d1c1           	adda.l d1,a0
    3c0e:	41e8 0012      	lea 18(a0),a0
    3c12:	7000           	moveq #0,d0
    3c14:	302f 0082      	move.w 130(sp),d0
    3c18:	2f08           	move.l a0,-(sp)
    3c1a:	2f00           	move.l d0,-(sp)
    3c1c:	2f2f 008c      	move.l 140(sp),-(sp)
    3c20:	2f2f 0052      	move.l 82(sp),-(sp)
    3c24:	4eba 2f28      	jsr 6b4e <TestRow>(pc)
    3c28:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3c2c:	722a           	moveq #42,d1
    3c2e:	d3af 0084      	add.l d1,132(sp)
    for( int i3=0;i3<5;i3++) {
    3c32:	52af 0072      	addq.l #1,114(sp)
    3c36:	7004           	moveq #4,d0
    3c38:	b0af 0072      	cmp.l 114(sp),d0
    3c3c:	6cc0           	bge.s 3bfe <TestZoom4PictureOn5Planes+0x1fe>
  for(int i=0;i<14;i++) {
    3c3e:	52af 007e      	addq.l #1,126(sp)
    3c42:	720d           	moveq #13,d1
    3c44:	b2af 007e      	cmp.l 126(sp),d1
    3c48:	6c00 ff52      	bge.w 3b9c <TestZoom4PictureOn5Planes+0x19c>
    }
  }
  for(int i2=0;i2<4;i2++) { 
    3c4c:	42af 006e      	clr.l 110(sp)
    3c50:	6044           	bra.s 3c96 <TestZoom4PictureOn5Planes+0x296>
    for( int i3=0;i3<5;i3++) {
    3c52:	42af 006a      	clr.l 106(sp)
    3c56:	602e           	bra.s 3c86 <TestZoom4PictureOn5Planes+0x286>
      TestRow( valsupposed, valactual, mask, i2+265);
    3c58:	222f 006e      	move.l 110(sp),d1
    3c5c:	0681 0000 0109 	addi.l #265,d1
    3c62:	7000           	moveq #0,d0
    3c64:	302f 0082      	move.w 130(sp),d0
    3c68:	2f01           	move.l d1,-(sp)
    3c6a:	2f00           	move.l d0,-(sp)
    3c6c:	2f2f 008c      	move.l 140(sp),-(sp)
    3c70:	2f2f 0052      	move.l 82(sp),-(sp)
    3c74:	4eba 2ed8      	jsr 6b4e <TestRow>(pc)
    3c78:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3c7c:	702a           	moveq #42,d0
    3c7e:	d1af 0084      	add.l d0,132(sp)
    for( int i3=0;i3<5;i3++) {
    3c82:	52af 006a      	addq.l #1,106(sp)
    3c86:	7204           	moveq #4,d1
    3c88:	b2af 006a      	cmp.l 106(sp),d1
    3c8c:	6cca           	bge.s 3c58 <TestZoom4PictureOn5Planes+0x258>
    }
    mask = mask ^ 0xffff;
    3c8e:	466f 0082      	not.w 130(sp)
  for(int i2=0;i2<4;i2++) { 
    3c92:	52af 006e      	addq.l #1,110(sp)
    3c96:	7003           	moveq #3,d0
    3c98:	b0af 006e      	cmp.l 110(sp),d0
    3c9c:	6cb4           	bge.s 3c52 <TestZoom4PictureOn5Planes+0x252>
  } 
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    3c9e:	2f6f 005a 0042 	move.l 90(sp),66(sp)
    3ca4:	2f7c 0000 f460 	move.l #62560,62(sp)
    3caa:	003e 
    3cac:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    3cb2:	2c40           	movea.l d0,a6
    3cb4:	226f 0042      	movea.l 66(sp),a1
    3cb8:	202f 003e      	move.l 62(sp),d0
    3cbc:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    3cc0:	2f6f 004a 003a 	move.l 74(sp),58(sp)
    3cc6:	2f7c 0000 f460 	move.l #62560,54(sp)
    3ccc:	0036 
    3cce:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    3cd4:	2c40           	movea.l d0,a6
    3cd6:	226f 003a      	movea.l 58(sp),a1
    3cda:	202f 0036      	move.l 54(sp),d0
    3cde:	4eae ff2e      	jsr -210(a6)
}
    3ce2:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3ce6:	4fef 008c      	lea 140(sp),sp
    3cea:	4e75           	rts

00003cec <TestZoom4Picture>:

void TestZoom4Picture() {
    3cec:	4fef fe30      	lea -464(sp),sp
    3cf0:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3cf4:	2f7c 0000 30e0 	move.l #12512,106(sp)
    3cfa:	006a 
    3cfc:	7002           	moveq #2,d0
    3cfe:	2f40 0066      	move.l d0,102(sp)
    3d02:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    3d08:	2c40           	movea.l d0,a6
    3d0a:	202f 006a      	move.l 106(sp),d0
    3d0e:	222f 0066      	move.l 102(sp),d1
    3d12:	4eae ff3a      	jsr -198(a6)
    3d16:	2f40 0062      	move.l d0,98(sp)
    3d1a:	202f 0062      	move.l 98(sp),d0
    3d1e:	2f40 005e      	move.l d0,94(sp)
  if( source == 0) {
    3d22:	6646           	bne.s 3d6a <TestZoom4Picture+0x7e>
    Write(  Output(), 
    3d24:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3d2a:	2c40           	movea.l d0,a6
    3d2c:	4eae ffc4      	jsr -60(a6)
    3d30:	2f40 001e      	move.l d0,30(sp)
    3d34:	202f 001e      	move.l 30(sp),d0
    3d38:	2f40 001a      	move.l d0,26(sp)
    3d3c:	2f7c 0000 847f 	move.l #33919,22(sp)
    3d42:	0016 
    3d44:	7239           	moveq #57,d1
    3d46:	2f41 0012      	move.l d1,18(sp)
    3d4a:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3d50:	2c40           	movea.l d0,a6
    3d52:	222f 001a      	move.l 26(sp),d1
    3d56:	242f 0016      	move.l 22(sp),d2
    3d5a:	262f 0012      	move.l 18(sp),d3
    3d5e:	4eae ffd0      	jsr -48(a6)
    3d62:	2f40 000e      	move.l d0,14(sp)
    3d66:	6000 2ddc      	bra.w 6b44 <TestZoom4Picture+0x2e58>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3d6a:	2f7c 0000 30e0 	move.l #12512,90(sp)
    3d70:	005a 
    3d72:	7002           	moveq #2,d0
    3d74:	2f40 0056      	move.l d0,86(sp)
    3d78:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    3d7e:	2c40           	movea.l d0,a6
    3d80:	202f 005a      	move.l 90(sp),d0
    3d84:	222f 0056      	move.l 86(sp),d1
    3d88:	4eae ff3a      	jsr -198(a6)
    3d8c:	2f40 0052      	move.l d0,82(sp)
    3d90:	202f 0052      	move.l 82(sp),d0
    3d94:	2f40 004e      	move.l d0,78(sp)
  if( destination == 0) {
    3d98:	6646           	bne.s 3de0 <TestZoom4Picture+0xf4>
    Write(  Output(), 
    3d9a:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3da0:	2c40           	movea.l d0,a6
    3da2:	4eae ffc4      	jsr -60(a6)
    3da6:	2f40 0032      	move.l d0,50(sp)
    3daa:	202f 0032      	move.l 50(sp),d0
    3dae:	2f40 002e      	move.l d0,46(sp)
    3db2:	2f7c 0000 84b9 	move.l #33977,42(sp)
    3db8:	002a 
    3dba:	723d           	moveq #61,d1
    3dbc:	2f41 0026      	move.l d1,38(sp)
    3dc0:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    3dc6:	2c40           	movea.l d0,a6
    3dc8:	222f 002e      	move.l 46(sp),d1
    3dcc:	242f 002a      	move.l 42(sp),d2
    3dd0:	262f 0026      	move.l 38(sp),d3
    3dd4:	4eae ffd0      	jsr -48(a6)
    3dd8:	2f40 0022      	move.l d0,34(sp)
    3ddc:	6000 2d66      	bra.w 6b44 <TestZoom4Picture+0x2e58>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3de0:	2f6f 005e 01d8 	move.l 94(sp),472(sp)
  for(int i=0;i<128+8;i++) {
    3de6:	42af 01d4      	clr.l 468(sp)
    3dea:	6050           	bra.s 3e3c <TestZoom4Picture+0x150>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3dec:	42af 01d0      	clr.l 464(sp)
    3df0:	6018           	bra.s 3e0a <TestZoom4Picture+0x11e>
      *tmp4source++ = 0x55555555;
    3df2:	202f 01d8      	move.l 472(sp),d0
    3df6:	2200           	move.l d0,d1
    3df8:	5881           	addq.l #4,d1
    3dfa:	2f41 01d8      	move.l d1,472(sp)
    3dfe:	2040           	movea.l d0,a0
    3e00:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e06:	52af 01d0      	addq.l #1,464(sp)
    3e0a:	7009           	moveq #9,d0
    3e0c:	b0af 01d0      	cmp.l 464(sp),d0
    3e10:	6ce0           	bge.s 3df2 <TestZoom4Picture+0x106>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e12:	42af 01cc      	clr.l 460(sp)
    3e16:	6018           	bra.s 3e30 <TestZoom4Picture+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3e18:	202f 01d8      	move.l 472(sp),d0
    3e1c:	2200           	move.l d0,d1
    3e1e:	5881           	addq.l #4,d1
    3e20:	2f41 01d8      	move.l d1,472(sp)
    3e24:	2040           	movea.l d0,a0
    3e26:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e2c:	52af 01cc      	addq.l #1,460(sp)
    3e30:	7009           	moveq #9,d0
    3e32:	b0af 01cc      	cmp.l 460(sp),d0
    3e36:	6ce0           	bge.s 3e18 <TestZoom4Picture+0x12c>
  for(int i=0;i<128+8;i++) {
    3e38:	52af 01d4      	addq.l #1,468(sp)
    3e3c:	0caf 0000 0087 	cmpi.l #135,468(sp)
    3e42:	01d4 
    3e44:	6fa6           	ble.s 3dec <TestZoom4Picture+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    3e46:	4878 0001      	pea 1 <_start+0x1>
    3e4a:	42a7           	clr.l -(sp)
    3e4c:	2f2f 0056      	move.l 86(sp),-(sp)
    3e50:	2f2f 006a      	move.l 106(sp),-(sp)
    3e54:	4eba dc46      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    3e58:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3e5c:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    3e62:	2c40           	movea.l d0,a6
    3e64:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3e68:	222f 004e      	move.l 78(sp),d1
    3e6c:	5881           	addq.l #4,d1
    3e6e:	2f41 01c8      	move.l d1,456(sp)
  UWORD *valsupposed = destlinezoom1;
    3e72:	2f7c 0000 bad0 	move.l #47824,74(sp)
    3e78:	004a 
  UWORD mask = 0xffff;
    3e7a:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<14;i++) {
    3e80:	42af 01c2      	clr.l 450(sp)
    3e84:	6000 0084      	bra.w 3f0a <TestZoom4Picture+0x21e>
    for(int i2=0;i2<18;i2++) { 
    3e88:	42af 01be      	clr.l 446(sp)
    3e8c:	603c           	bra.s 3eca <TestZoom4Picture+0x1de>
      TestRow( valsupposed, valactual, mask, i2+i*19);
    3e8e:	222f 01c2      	move.l 450(sp),d1
    3e92:	2001           	move.l d1,d0
    3e94:	e788           	lsl.l #3,d0
    3e96:	d081           	add.l d1,d0
    3e98:	d080           	add.l d0,d0
    3e9a:	d081           	add.l d1,d0
    3e9c:	2200           	move.l d0,d1
    3e9e:	d2af 01be      	add.l 446(sp),d1
    3ea2:	7000           	moveq #0,d0
    3ea4:	302f 01c6      	move.w 454(sp),d0
    3ea8:	2f01           	move.l d1,-(sp)
    3eaa:	2f00           	move.l d0,-(sp)
    3eac:	2f2f 01d0      	move.l 464(sp),-(sp)
    3eb0:	2f2f 0056      	move.l 86(sp),-(sp)
    3eb4:	4eba 2c98      	jsr 6b4e <TestRow>(pc)
    3eb8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3ebc:	702a           	moveq #42,d0
    3ebe:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    3ec2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) { 
    3ec6:	52af 01be      	addq.l #1,446(sp)
    3eca:	7211           	moveq #17,d1
    3ecc:	b2af 01be      	cmp.l 446(sp),d1
    3ed0:	6cbc           	bge.s 3e8e <TestZoom4Picture+0x1a2>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    3ed2:	222f 01c2      	move.l 450(sp),d1
    3ed6:	2001           	move.l d1,d0
    3ed8:	e788           	lsl.l #3,d0
    3eda:	d081           	add.l d1,d0
    3edc:	d080           	add.l d0,d0
    3ede:	2040           	movea.l d0,a0
    3ee0:	d1c1           	adda.l d1,a0
    3ee2:	41e8 0012      	lea 18(a0),a0
    3ee6:	7000           	moveq #0,d0
    3ee8:	302f 01c6      	move.w 454(sp),d0
    3eec:	2f08           	move.l a0,-(sp)
    3eee:	2f00           	move.l d0,-(sp)
    3ef0:	2f2f 01d0      	move.l 464(sp),-(sp)
    3ef4:	2f2f 0056      	move.l 86(sp),-(sp)
    3ef8:	4eba 2c54      	jsr 6b4e <TestRow>(pc)
    3efc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f00:	702a           	moveq #42,d0
    3f02:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<14;i++) {
    3f06:	52af 01c2      	addq.l #1,450(sp)
    3f0a:	720d           	moveq #13,d1
    3f0c:	b2af 01c2      	cmp.l 450(sp),d1
    3f10:	6c00 ff76      	bge.w 3e88 <TestZoom4Picture+0x19c>
  }

  for(int i2=0;i2<4;i2++) { 
    3f14:	42af 01ba      	clr.l 442(sp)
    3f18:	6032           	bra.s 3f4c <TestZoom4Picture+0x260>
    TestRow( valsupposed, valactual, mask, i2+265);
    3f1a:	222f 01ba      	move.l 442(sp),d1
    3f1e:	0681 0000 0109 	addi.l #265,d1
    3f24:	7000           	moveq #0,d0
    3f26:	302f 01c6      	move.w 454(sp),d0
    3f2a:	2f01           	move.l d1,-(sp)
    3f2c:	2f00           	move.l d0,-(sp)
    3f2e:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f32:	2f2f 0056      	move.l 86(sp),-(sp)
    3f36:	4eba 2c16      	jsr 6b4e <TestRow>(pc)
    3f3a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f3e:	702a           	moveq #42,d0
    3f40:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    3f44:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    3f48:	52af 01ba      	addq.l #1,442(sp)
    3f4c:	7203           	moveq #3,d1
    3f4e:	b2af 01ba      	cmp.l 442(sp),d1
    3f52:	6cc6           	bge.s 3f1a <TestZoom4Picture+0x22e>
  }
  
  UWORD *tmp = source;
    3f54:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    3f5a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    3f60:	2f6f 0046 004e 	move.l 70(sp),78(sp)
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    3f66:	4878 0001      	pea 1 <_start+0x1>
    3f6a:	4878 0001      	pea 1 <_start+0x1>
    3f6e:	2f2f 0056      	move.l 86(sp),-(sp)
    3f72:	2f2f 006a      	move.l 106(sp),-(sp)
    3f76:	4eba db24      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    3f7a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3f7e:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    3f84:	2c40           	movea.l d0,a6
    3f86:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    3f8a:	202f 004e      	move.l 78(sp),d0
    3f8e:	5880           	addq.l #4,d0
    3f90:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom2;
    3f94:	2f7c 0000 bafc 	move.l #47868,74(sp)
    3f9a:	004a 
  mask = 0x0000;
    3f9c:	426f 01c6      	clr.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3fa0:	42af 01b6      	clr.l 438(sp)
    3fa4:	602a           	bra.s 3fd0 <TestZoom4Picture+0x2e4>
    TestRow( valsupposed, valactual, mask, i2);
    3fa6:	7000           	moveq #0,d0
    3fa8:	302f 01c6      	move.w 454(sp),d0
    3fac:	2f2f 01b6      	move.l 438(sp),-(sp)
    3fb0:	2f00           	move.l d0,-(sp)
    3fb2:	2f2f 01d0      	move.l 464(sp),-(sp)
    3fb6:	2f2f 0056      	move.l 86(sp),-(sp)
    3fba:	4eba 2b92      	jsr 6b4e <TestRow>(pc)
    3fbe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3fc2:	722a           	moveq #42,d1
    3fc4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    3fc8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3fcc:	52af 01b6      	addq.l #1,438(sp)
    3fd0:	700a           	moveq #10,d0
    3fd2:	b0af 01b6      	cmp.l 438(sp),d0
    3fd6:	6cce           	bge.s 3fa6 <TestZoom4Picture+0x2ba>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    3fd8:	4878 0008      	pea 8 <_start+0x8>
    3fdc:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3fe2:	2f2f 01d0      	move.l 464(sp),-(sp)
    3fe6:	2f2f 0056      	move.l 86(sp),-(sp)
    3fea:	4eba 2b62      	jsr 6b4e <TestRow>(pc)
    3fee:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3ff2:	722a           	moveq #42,d1
    3ff4:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 9);
    3ff8:	4878 0009      	pea 9 <_start+0x9>
    3ffc:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4002:	2f2f 01d0      	move.l 464(sp),-(sp)
    4006:	2f2f 0056      	move.l 86(sp),-(sp)
    400a:	4eba 2b42      	jsr 6b4e <TestRow>(pc)
    400e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4012:	702a           	moveq #42,d0
    4014:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 10);
    4018:	4878 000a      	pea a <_start+0xa>
    401c:	42a7           	clr.l -(sp)
    401e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4022:	2f2f 0056      	move.l 86(sp),-(sp)
    4026:	4eba 2b26      	jsr 6b4e <TestRow>(pc)
    402a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    402e:	722a           	moveq #42,d1
    4030:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 11);
    4034:	4878 000b      	pea b <_start+0xb>
    4038:	42a7           	clr.l -(sp)
    403a:	2f2f 01d0      	move.l 464(sp),-(sp)
    403e:	2f2f 0056      	move.l 86(sp),-(sp)
    4042:	4eba 2b0a      	jsr 6b4e <TestRow>(pc)
    4046:	4fef 0010      	lea 16(sp),sp

  valactual += ZMLINESIZE/2;
    404a:	702a           	moveq #42,d0
    404c:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<12;i++) {
    4050:	42af 01b2      	clr.l 434(sp)
    4054:	6000 0118      	bra.w 416e <TestZoom4Picture+0x482>
    for(int i2=0;i2<16;i2++) {  
    4058:	42af 01ae      	clr.l 430(sp)
    405c:	603c           	bra.s 409a <TestZoom4Picture+0x3ae>
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    405e:	222f 01b2      	move.l 434(sp),d1
    4062:	2001           	move.l d1,d0
    4064:	e988           	lsl.l #4,d0
    4066:	d081           	add.l d1,d0
    4068:	2040           	movea.l d0,a0
    406a:	d1ef 01ae      	adda.l 430(sp),a0
    406e:	41e8 000b      	lea 11(a0),a0
    4072:	7000           	moveq #0,d0
    4074:	302f 01c6      	move.w 454(sp),d0
    4078:	2f08           	move.l a0,-(sp)
    407a:	2f00           	move.l d0,-(sp)
    407c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4080:	2f2f 0056      	move.l 86(sp),-(sp)
    4084:	4eba 2ac8      	jsr 6b4e <TestRow>(pc)
    4088:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    408c:	722a           	moveq #42,d1
    408e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4092:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {  
    4096:	52af 01ae      	addq.l #1,430(sp)
    409a:	700f           	moveq #15,d0
    409c:	b0af 01ae      	cmp.l 430(sp),d0
    40a0:	6cbc           	bge.s 405e <TestZoom4Picture+0x372>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    40a2:	222f 01b2      	move.l 434(sp),d1
    40a6:	2001           	move.l d1,d0
    40a8:	e988           	lsl.l #4,d0
    40aa:	2040           	movea.l d0,a0
    40ac:	d1c1           	adda.l d1,a0
    40ae:	41e8 0018      	lea 24(a0),a0
    40b2:	7000           	moveq #0,d0
    40b4:	302f 01c6      	move.w 454(sp),d0
    40b8:	2f08           	move.l a0,-(sp)
    40ba:	2f00           	move.l d0,-(sp)
    40bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    40c0:	2f2f 0056      	move.l 86(sp),-(sp)
    40c4:	4eba 2a88      	jsr 6b4e <TestRow>(pc)
    40c8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40cc:	722a           	moveq #42,d1
    40ce:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    40d2:	222f 01b2      	move.l 434(sp),d1
    40d6:	2001           	move.l d1,d0
    40d8:	e988           	lsl.l #4,d0
    40da:	2040           	movea.l d0,a0
    40dc:	d1c1           	adda.l d1,a0
    40de:	41e8 0019      	lea 25(a0),a0
    40e2:	7000           	moveq #0,d0
    40e4:	302f 01c6      	move.w 454(sp),d0
    40e8:	2f08           	move.l a0,-(sp)
    40ea:	2f00           	move.l d0,-(sp)
    40ec:	2f2f 01d0      	move.l 464(sp),-(sp)
    40f0:	2f2f 0056      	move.l 86(sp),-(sp)
    40f4:	4eba 2a58      	jsr 6b4e <TestRow>(pc)
    40f8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40fc:	702a           	moveq #42,d0
    40fe:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4102:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    4106:	222f 01b2      	move.l 434(sp),d1
    410a:	2001           	move.l d1,d0
    410c:	e988           	lsl.l #4,d0
    410e:	2040           	movea.l d0,a0
    4110:	d1c1           	adda.l d1,a0
    4112:	41e8 001a      	lea 26(a0),a0
    4116:	7000           	moveq #0,d0
    4118:	302f 01c6      	move.w 454(sp),d0
    411c:	2f08           	move.l a0,-(sp)
    411e:	2f00           	move.l d0,-(sp)
    4120:	2f2f 01d0      	move.l 464(sp),-(sp)
    4124:	2f2f 0056      	move.l 86(sp),-(sp)
    4128:	4eba 2a24      	jsr 6b4e <TestRow>(pc)
    412c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4130:	722a           	moveq #42,d1
    4132:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    4136:	222f 01b2      	move.l 434(sp),d1
    413a:	2001           	move.l d1,d0
    413c:	e988           	lsl.l #4,d0
    413e:	2040           	movea.l d0,a0
    4140:	d1c1           	adda.l d1,a0
    4142:	41e8 001b      	lea 27(a0),a0
    4146:	7000           	moveq #0,d0
    4148:	302f 01c6      	move.w 454(sp),d0
    414c:	2f08           	move.l a0,-(sp)
    414e:	2f00           	move.l d0,-(sp)
    4150:	2f2f 01d0      	move.l 464(sp),-(sp)
    4154:	2f2f 0056      	move.l 86(sp),-(sp)
    4158:	4eba 29f4      	jsr 6b4e <TestRow>(pc)
    415c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4160:	702a           	moveq #42,d0
    4162:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4166:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    416a:	52af 01b2      	addq.l #1,434(sp)
    416e:	720b           	moveq #11,d1
    4170:	b2af 01b2      	cmp.l 434(sp),d1
    4174:	6c00 fee2      	bge.w 4058 <TestZoom4Picture+0x36c>
    
  }

  for(int i2=0;i2<15;i2++) { 
    4178:	42af 01aa      	clr.l 426(sp)
    417c:	602a           	bra.s 41a8 <TestZoom4Picture+0x4bc>
    TestRow( valsupposed, valactual, mask, i2);
    417e:	7000           	moveq #0,d0
    4180:	302f 01c6      	move.w 454(sp),d0
    4184:	2f2f 01aa      	move.l 426(sp),-(sp)
    4188:	2f00           	move.l d0,-(sp)
    418a:	2f2f 01d0      	move.l 464(sp),-(sp)
    418e:	2f2f 0056      	move.l 86(sp),-(sp)
    4192:	4eba 29ba      	jsr 6b4e <TestRow>(pc)
    4196:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    419a:	702a           	moveq #42,d0
    419c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    41a0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<15;i2++) { 
    41a4:	52af 01aa      	addq.l #1,426(sp)
    41a8:	720e           	moveq #14,d1
    41aa:	b2af 01aa      	cmp.l 426(sp),d1
    41ae:	6cce           	bge.s 417e <TestZoom4Picture+0x492>
  }

  tmp = source;
    41b0:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    41b6:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    41bc:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    41c2:	4878 0001      	pea 1 <_start+0x1>
    41c6:	4878 0002      	pea 2 <_start+0x2>
    41ca:	2f2f 0056      	move.l 86(sp),-(sp)
    41ce:	2f2f 006a      	move.l 106(sp),-(sp)
    41d2:	4eba d8c8      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    41d6:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    41da:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    41e0:	2c40           	movea.l d0,a6
    41e2:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    41e6:	202f 004e      	move.l 78(sp),d0
    41ea:	5880           	addq.l #4,d0
    41ec:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom3;
    41f0:	2f7c 0000 bb28 	move.l #47912,74(sp)
    41f6:	004a 
  mask = 0xffff;
    41f8:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<4;i2++) { 
    41fe:	42af 01a6      	clr.l 422(sp)
    4202:	602a           	bra.s 422e <TestZoom4Picture+0x542>
    TestRow( valsupposed, valactual, mask, i2);
    4204:	7000           	moveq #0,d0
    4206:	302f 01c6      	move.w 454(sp),d0
    420a:	2f2f 01a6      	move.l 422(sp),-(sp)
    420e:	2f00           	move.l d0,-(sp)
    4210:	2f2f 01d0      	move.l 464(sp),-(sp)
    4214:	2f2f 0056      	move.l 86(sp),-(sp)
    4218:	4eba 2934      	jsr 6b4e <TestRow>(pc)
    421c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4220:	722a           	moveq #42,d1
    4222:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4226:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    422a:	52af 01a6      	addq.l #1,422(sp)
    422e:	7003           	moveq #3,d0
    4230:	b0af 01a6      	cmp.l 422(sp),d0
    4234:	6cce           	bge.s 4204 <TestZoom4Picture+0x518>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    4236:	4878 0004      	pea 4 <_start+0x4>
    423a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4240:	2f2f 01d0      	move.l 464(sp),-(sp)
    4244:	2f2f 0056      	move.l 86(sp),-(sp)
    4248:	4eba 2904      	jsr 6b4e <TestRow>(pc)
    424c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4250:	722a           	moveq #42,d1
    4252:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    4256:	4878 0005      	pea 5 <_start+0x5>
    425a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4260:	2f2f 01d0      	move.l 464(sp),-(sp)
    4264:	2f2f 0056      	move.l 86(sp),-(sp)
    4268:	4eba 28e4      	jsr 6b4e <TestRow>(pc)
    426c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4270:	702a           	moveq #42,d0
    4272:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    4276:	4878 0006      	pea 6 <_start+0x6>
    427a:	42a7           	clr.l -(sp)
    427c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4280:	2f2f 0056      	move.l 86(sp),-(sp)
    4284:	4eba 28c8      	jsr 6b4e <TestRow>(pc)
    4288:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    428c:	722a           	moveq #42,d1
    428e:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    4292:	4878 0007      	pea 7 <_start+0x7>
    4296:	42a7           	clr.l -(sp)
    4298:	2f2f 01d0      	move.l 464(sp),-(sp)
    429c:	2f2f 0056      	move.l 86(sp),-(sp)
    42a0:	4eba 28ac      	jsr 6b4e <TestRow>(pc)
    42a4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42a8:	702a           	moveq #42,d0
    42aa:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    42ae:	4878 0008      	pea 8 <_start+0x8>
    42b2:	2f3c 0000 ffff 	move.l #65535,-(sp)
    42b8:	2f2f 01d0      	move.l 464(sp),-(sp)
    42bc:	2f2f 0056      	move.l 86(sp),-(sp)
    42c0:	4eba 288c      	jsr 6b4e <TestRow>(pc)
    42c4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42c8:	722a           	moveq #42,d1
    42ca:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    42ce:	4878 0009      	pea 9 <_start+0x9>
    42d2:	2f3c 0000 ffff 	move.l #65535,-(sp)
    42d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    42dc:	2f2f 0056      	move.l 86(sp),-(sp)
    42e0:	4eba 286c      	jsr 6b4e <TestRow>(pc)
    42e4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42e8:	702a           	moveq #42,d0
    42ea:	d1af 01c8      	add.l d0,456(sp)

  mask = 0x0000;
    42ee:	426f 01c6      	clr.w 454(sp)
  for(int i=0;i<12;i++) {
    42f2:	42af 01a2      	clr.l 418(sp)
    42f6:	6000 01a6      	bra.w 449e <TestZoom4Picture+0x7b2>
    for(int i2=0;i2<15;i2++) {  
    42fa:	42af 019e      	clr.l 414(sp)
    42fe:	6042           	bra.s 4342 <TestZoom4Picture+0x656>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    4300:	222f 01a2      	move.l 418(sp),d1
    4304:	2001           	move.l d1,d0
    4306:	d080           	add.l d0,d0
    4308:	d081           	add.l d1,d0
    430a:	2200           	move.l d0,d1
    430c:	e789           	lsl.l #3,d1
    430e:	9280           	sub.l d0,d1
    4310:	2041           	movea.l d1,a0
    4312:	d1ef 019e      	adda.l 414(sp),a0
    4316:	41e8 0009      	lea 9(a0),a0
    431a:	7000           	moveq #0,d0
    431c:	302f 01c6      	move.w 454(sp),d0
    4320:	2f08           	move.l a0,-(sp)
    4322:	2f00           	move.l d0,-(sp)
    4324:	2f2f 01d0      	move.l 464(sp),-(sp)
    4328:	2f2f 0056      	move.l 86(sp),-(sp)
    432c:	4eba 2820      	jsr 6b4e <TestRow>(pc)
    4330:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4334:	722a           	moveq #42,d1
    4336:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    433a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {  
    433e:	52af 019e      	addq.l #1,414(sp)
    4342:	700e           	moveq #14,d0
    4344:	b0af 019e      	cmp.l 414(sp),d0
    4348:	6cb6           	bge.s 4300 <TestZoom4Picture+0x614>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    434a:	222f 01a2      	move.l 418(sp),d1
    434e:	2001           	move.l d1,d0
    4350:	d080           	add.l d0,d0
    4352:	d081           	add.l d1,d0
    4354:	2200           	move.l d0,d1
    4356:	e789           	lsl.l #3,d1
    4358:	2041           	movea.l d1,a0
    435a:	91c0           	suba.l d0,a0
    435c:	41e8 0018      	lea 24(a0),a0
    4360:	7000           	moveq #0,d0
    4362:	302f 01c6      	move.w 454(sp),d0
    4366:	2f08           	move.l a0,-(sp)
    4368:	2f00           	move.l d0,-(sp)
    436a:	2f2f 01d0      	move.l 464(sp),-(sp)
    436e:	2f2f 0056      	move.l 86(sp),-(sp)
    4372:	4eba 27da      	jsr 6b4e <TestRow>(pc)
    4376:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    437a:	722a           	moveq #42,d1
    437c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    4380:	222f 01a2      	move.l 418(sp),d1
    4384:	2001           	move.l d1,d0
    4386:	d080           	add.l d0,d0
    4388:	d081           	add.l d1,d0
    438a:	2200           	move.l d0,d1
    438c:	e789           	lsl.l #3,d1
    438e:	2041           	movea.l d1,a0
    4390:	91c0           	suba.l d0,a0
    4392:	41e8 0019      	lea 25(a0),a0
    4396:	7000           	moveq #0,d0
    4398:	302f 01c6      	move.w 454(sp),d0
    439c:	2f08           	move.l a0,-(sp)
    439e:	2f00           	move.l d0,-(sp)
    43a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    43a4:	2f2f 0056      	move.l 86(sp),-(sp)
    43a8:	4eba 27a4      	jsr 6b4e <TestRow>(pc)
    43ac:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43b0:	702a           	moveq #42,d0
    43b2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    43b6:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    43ba:	222f 01a2      	move.l 418(sp),d1
    43be:	2001           	move.l d1,d0
    43c0:	d080           	add.l d0,d0
    43c2:	d081           	add.l d1,d0
    43c4:	2200           	move.l d0,d1
    43c6:	e789           	lsl.l #3,d1
    43c8:	2041           	movea.l d1,a0
    43ca:	91c0           	suba.l d0,a0
    43cc:	41e8 001a      	lea 26(a0),a0
    43d0:	7000           	moveq #0,d0
    43d2:	302f 01c6      	move.w 454(sp),d0
    43d6:	2f08           	move.l a0,-(sp)
    43d8:	2f00           	move.l d0,-(sp)
    43da:	2f2f 01d0      	move.l 464(sp),-(sp)
    43de:	2f2f 0056      	move.l 86(sp),-(sp)
    43e2:	4eba 276a      	jsr 6b4e <TestRow>(pc)
    43e6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43ea:	722a           	moveq #42,d1
    43ec:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    43f0:	222f 01a2      	move.l 418(sp),d1
    43f4:	2001           	move.l d1,d0
    43f6:	d080           	add.l d0,d0
    43f8:	d081           	add.l d1,d0
    43fa:	2200           	move.l d0,d1
    43fc:	e789           	lsl.l #3,d1
    43fe:	2041           	movea.l d1,a0
    4400:	91c0           	suba.l d0,a0
    4402:	41e8 001b      	lea 27(a0),a0
    4406:	7000           	moveq #0,d0
    4408:	302f 01c6      	move.w 454(sp),d0
    440c:	2f08           	move.l a0,-(sp)
    440e:	2f00           	move.l d0,-(sp)
    4410:	2f2f 01d0      	move.l 464(sp),-(sp)
    4414:	2f2f 0056      	move.l 86(sp),-(sp)
    4418:	4eba 2734      	jsr 6b4e <TestRow>(pc)
    441c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4420:	702a           	moveq #42,d0
    4422:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4426:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    442a:	222f 01a2      	move.l 418(sp),d1
    442e:	2001           	move.l d1,d0
    4430:	d080           	add.l d0,d0
    4432:	d081           	add.l d1,d0
    4434:	2200           	move.l d0,d1
    4436:	e789           	lsl.l #3,d1
    4438:	2041           	movea.l d1,a0
    443a:	91c0           	suba.l d0,a0
    443c:	41e8 001c      	lea 28(a0),a0
    4440:	7000           	moveq #0,d0
    4442:	302f 01c6      	move.w 454(sp),d0
    4446:	2f08           	move.l a0,-(sp)
    4448:	2f00           	move.l d0,-(sp)
    444a:	2f2f 01d0      	move.l 464(sp),-(sp)
    444e:	2f2f 0056      	move.l 86(sp),-(sp)
    4452:	4eba 26fa      	jsr 6b4e <TestRow>(pc)
    4456:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    445a:	722a           	moveq #42,d1
    445c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4460:	222f 01a2      	move.l 418(sp),d1
    4464:	2001           	move.l d1,d0
    4466:	d080           	add.l d0,d0
    4468:	d081           	add.l d1,d0
    446a:	2200           	move.l d0,d1
    446c:	e789           	lsl.l #3,d1
    446e:	2041           	movea.l d1,a0
    4470:	91c0           	suba.l d0,a0
    4472:	41e8 001d      	lea 29(a0),a0
    4476:	7000           	moveq #0,d0
    4478:	302f 01c6      	move.w 454(sp),d0
    447c:	2f08           	move.l a0,-(sp)
    447e:	2f00           	move.l d0,-(sp)
    4480:	2f2f 01d0      	move.l 464(sp),-(sp)
    4484:	2f2f 0056      	move.l 86(sp),-(sp)
    4488:	4eba 26c4      	jsr 6b4e <TestRow>(pc)
    448c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4490:	702a           	moveq #42,d0
    4492:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4496:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    449a:	52af 01a2      	addq.l #1,418(sp)
    449e:	720b           	moveq #11,d1
    44a0:	b2af 01a2      	cmp.l 418(sp),d1
    44a4:	6c00 fe54      	bge.w 42fa <TestZoom4Picture+0x60e>
  }

  for(int i2=0;i2<8;i2++) {  
    44a8:	42af 019a      	clr.l 410(sp)
    44ac:	6032           	bra.s 44e0 <TestZoom4Picture+0x7f4>
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    44ae:	222f 019a      	move.l 410(sp),d1
    44b2:	0681 0000 0105 	addi.l #261,d1
    44b8:	7000           	moveq #0,d0
    44ba:	302f 01c6      	move.w 454(sp),d0
    44be:	2f01           	move.l d1,-(sp)
    44c0:	2f00           	move.l d0,-(sp)
    44c2:	2f2f 01d0      	move.l 464(sp),-(sp)
    44c6:	2f2f 0056      	move.l 86(sp),-(sp)
    44ca:	4eba 2682      	jsr 6b4e <TestRow>(pc)
    44ce:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    44d2:	702a           	moveq #42,d0
    44d4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    44d8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    44dc:	52af 019a      	addq.l #1,410(sp)
    44e0:	7207           	moveq #7,d1
    44e2:	b2af 019a      	cmp.l 410(sp),d1
    44e6:	6cc6           	bge.s 44ae <TestZoom4Picture+0x7c2>
  }

  tmp = source;
    44e8:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    44ee:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    44f4:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    44fa:	4878 0001      	pea 1 <_start+0x1>
    44fe:	4878 0003      	pea 3 <_start+0x3>
    4502:	2f2f 0056      	move.l 86(sp),-(sp)
    4506:	2f2f 006a      	move.l 106(sp),-(sp)
    450a:	4eba d590      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    450e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4512:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    4518:	2c40           	movea.l d0,a6
    451a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    451e:	202f 004e      	move.l 78(sp),d0
    4522:	5880           	addq.l #4,d0
    4524:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom4;
    4528:	2f7c 0000 bb54 	move.l #47956,74(sp)
    452e:	004a 
  mask = 0x0000;
    4530:	426f 01c6      	clr.w 454(sp)
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    4534:	4878 0007      	pea 7 <_start+0x7>
    4538:	42a7           	clr.l -(sp)
    453a:	2f2f 01d0      	move.l 464(sp),-(sp)
    453e:	2f2f 0056      	move.l 86(sp),-(sp)
    4542:	4eba 260a      	jsr 6b4e <TestRow>(pc)
    4546:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    454a:	722a           	moveq #42,d1
    454c:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    4550:	4878 0008      	pea 8 <_start+0x8>
    4554:	2f3c 0000 ffff 	move.l #65535,-(sp)
    455a:	2f2f 01d0      	move.l 464(sp),-(sp)
    455e:	2f2f 0056      	move.l 86(sp),-(sp)
    4562:	4eba 25ea      	jsr 6b4e <TestRow>(pc)
    4566:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    456a:	702a           	moveq #42,d0
    456c:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    4570:	4878 0009      	pea 9 <_start+0x9>
    4574:	2f3c 0000 ffff 	move.l #65535,-(sp)
    457a:	2f2f 01d0      	move.l 464(sp),-(sp)
    457e:	2f2f 0056      	move.l 86(sp),-(sp)
    4582:	4eba 25ca      	jsr 6b4e <TestRow>(pc)
    4586:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    458a:	722a           	moveq #42,d1
    458c:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    4590:	4878 0008      	pea 8 <_start+0x8>
    4594:	42a7           	clr.l -(sp)
    4596:	2f2f 01d0      	move.l 464(sp),-(sp)
    459a:	2f2f 0056      	move.l 86(sp),-(sp)
    459e:	4eba 25ae      	jsr 6b4e <TestRow>(pc)
    45a2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    45a6:	702a           	moveq #42,d0
    45a8:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    45ac:	4878 0009      	pea 9 <_start+0x9>
    45b0:	42a7           	clr.l -(sp)
    45b2:	2f2f 01d0      	move.l 464(sp),-(sp)
    45b6:	2f2f 0056      	move.l 86(sp),-(sp)
    45ba:	4eba 2592      	jsr 6b4e <TestRow>(pc)
    45be:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    45c2:	722a           	moveq #42,d1
    45c4:	d3af 01c8      	add.l d1,456(sp)

  mask = 0xffff;
    45c8:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<12;i++) {
    45ce:	42af 0196      	clr.l 406(sp)
    45d2:	6000 0216      	bra.w 47ea <TestZoom4Picture+0xafe>
    for(int i2=0;i2<14;i2++) {  
    45d6:	42af 0192      	clr.l 402(sp)
    45da:	6042           	bra.s 461e <TestZoom4Picture+0x932>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    45dc:	222f 0196      	move.l 406(sp),d1
    45e0:	2001           	move.l d1,d0
    45e2:	d080           	add.l d0,d0
    45e4:	d081           	add.l d1,d0
    45e6:	2200           	move.l d0,d1
    45e8:	e789           	lsl.l #3,d1
    45ea:	9280           	sub.l d0,d1
    45ec:	2041           	movea.l d1,a0
    45ee:	d1ef 0192      	adda.l 402(sp),a0
    45f2:	41e8 0009      	lea 9(a0),a0
    45f6:	7000           	moveq #0,d0
    45f8:	302f 01c6      	move.w 454(sp),d0
    45fc:	2f08           	move.l a0,-(sp)
    45fe:	2f00           	move.l d0,-(sp)
    4600:	2f2f 01d0      	move.l 464(sp),-(sp)
    4604:	2f2f 0056      	move.l 86(sp),-(sp)
    4608:	4eba 2544      	jsr 6b4e <TestRow>(pc)
    460c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4610:	702a           	moveq #42,d0
    4612:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4616:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {  
    461a:	52af 0192      	addq.l #1,402(sp)
    461e:	720d           	moveq #13,d1
    4620:	b2af 0192      	cmp.l 402(sp),d1
    4624:	6cb6           	bge.s 45dc <TestZoom4Picture+0x8f0>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    4626:	222f 0196      	move.l 406(sp),d1
    462a:	2001           	move.l d1,d0
    462c:	d080           	add.l d0,d0
    462e:	d081           	add.l d1,d0
    4630:	2200           	move.l d0,d1
    4632:	e789           	lsl.l #3,d1
    4634:	2041           	movea.l d1,a0
    4636:	91c0           	suba.l d0,a0
    4638:	41e8 0018      	lea 24(a0),a0
    463c:	7000           	moveq #0,d0
    463e:	302f 01c6      	move.w 454(sp),d0
    4642:	2f08           	move.l a0,-(sp)
    4644:	2f00           	move.l d0,-(sp)
    4646:	2f2f 01d0      	move.l 464(sp),-(sp)
    464a:	2f2f 0056      	move.l 86(sp),-(sp)
    464e:	4eba 24fe      	jsr 6b4e <TestRow>(pc)
    4652:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4656:	702a           	moveq #42,d0
    4658:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    465c:	222f 0196      	move.l 406(sp),d1
    4660:	2001           	move.l d1,d0
    4662:	d080           	add.l d0,d0
    4664:	d081           	add.l d1,d0
    4666:	2200           	move.l d0,d1
    4668:	e789           	lsl.l #3,d1
    466a:	2041           	movea.l d1,a0
    466c:	91c0           	suba.l d0,a0
    466e:	41e8 0019      	lea 25(a0),a0
    4672:	7000           	moveq #0,d0
    4674:	302f 01c6      	move.w 454(sp),d0
    4678:	2f08           	move.l a0,-(sp)
    467a:	2f00           	move.l d0,-(sp)
    467c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4680:	2f2f 0056      	move.l 86(sp),-(sp)
    4684:	4eba 24c8      	jsr 6b4e <TestRow>(pc)
    4688:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    468c:	722a           	moveq #42,d1
    468e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4692:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    4696:	222f 0196      	move.l 406(sp),d1
    469a:	2001           	move.l d1,d0
    469c:	d080           	add.l d0,d0
    469e:	d081           	add.l d1,d0
    46a0:	2200           	move.l d0,d1
    46a2:	e789           	lsl.l #3,d1
    46a4:	2041           	movea.l d1,a0
    46a6:	91c0           	suba.l d0,a0
    46a8:	41e8 001a      	lea 26(a0),a0
    46ac:	7000           	moveq #0,d0
    46ae:	302f 01c6      	move.w 454(sp),d0
    46b2:	2f08           	move.l a0,-(sp)
    46b4:	2f00           	move.l d0,-(sp)
    46b6:	2f2f 01d0      	move.l 464(sp),-(sp)
    46ba:	2f2f 0056      	move.l 86(sp),-(sp)
    46be:	4eba 248e      	jsr 6b4e <TestRow>(pc)
    46c2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46c6:	702a           	moveq #42,d0
    46c8:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    46cc:	222f 0196      	move.l 406(sp),d1
    46d0:	2001           	move.l d1,d0
    46d2:	d080           	add.l d0,d0
    46d4:	d081           	add.l d1,d0
    46d6:	2200           	move.l d0,d1
    46d8:	e789           	lsl.l #3,d1
    46da:	2041           	movea.l d1,a0
    46dc:	91c0           	suba.l d0,a0
    46de:	41e8 001b      	lea 27(a0),a0
    46e2:	7000           	moveq #0,d0
    46e4:	302f 01c6      	move.w 454(sp),d0
    46e8:	2f08           	move.l a0,-(sp)
    46ea:	2f00           	move.l d0,-(sp)
    46ec:	2f2f 01d0      	move.l 464(sp),-(sp)
    46f0:	2f2f 0056      	move.l 86(sp),-(sp)
    46f4:	4eba 2458      	jsr 6b4e <TestRow>(pc)
    46f8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46fc:	722a           	moveq #42,d1
    46fe:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4702:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4706:	222f 0196      	move.l 406(sp),d1
    470a:	2001           	move.l d1,d0
    470c:	d080           	add.l d0,d0
    470e:	d081           	add.l d1,d0
    4710:	2200           	move.l d0,d1
    4712:	e789           	lsl.l #3,d1
    4714:	2041           	movea.l d1,a0
    4716:	91c0           	suba.l d0,a0
    4718:	41e8 001c      	lea 28(a0),a0
    471c:	7000           	moveq #0,d0
    471e:	302f 01c6      	move.w 454(sp),d0
    4722:	2f08           	move.l a0,-(sp)
    4724:	2f00           	move.l d0,-(sp)
    4726:	2f2f 01d0      	move.l 464(sp),-(sp)
    472a:	2f2f 0056      	move.l 86(sp),-(sp)
    472e:	4eba 241e      	jsr 6b4e <TestRow>(pc)
    4732:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4736:	702a           	moveq #42,d0
    4738:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    473c:	222f 0196      	move.l 406(sp),d1
    4740:	2001           	move.l d1,d0
    4742:	d080           	add.l d0,d0
    4744:	d081           	add.l d1,d0
    4746:	2200           	move.l d0,d1
    4748:	e789           	lsl.l #3,d1
    474a:	2041           	movea.l d1,a0
    474c:	91c0           	suba.l d0,a0
    474e:	41e8 001d      	lea 29(a0),a0
    4752:	7000           	moveq #0,d0
    4754:	302f 01c6      	move.w 454(sp),d0
    4758:	2f08           	move.l a0,-(sp)
    475a:	2f00           	move.l d0,-(sp)
    475c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4760:	2f2f 0056      	move.l 86(sp),-(sp)
    4764:	4eba 23e8      	jsr 6b4e <TestRow>(pc)
    4768:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    476c:	722a           	moveq #42,d1
    476e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4772:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4776:	222f 0196      	move.l 406(sp),d1
    477a:	2001           	move.l d1,d0
    477c:	d080           	add.l d0,d0
    477e:	d081           	add.l d1,d0
    4780:	2200           	move.l d0,d1
    4782:	e789           	lsl.l #3,d1
    4784:	2041           	movea.l d1,a0
    4786:	91c0           	suba.l d0,a0
    4788:	41e8 001c      	lea 28(a0),a0
    478c:	7000           	moveq #0,d0
    478e:	302f 01c6      	move.w 454(sp),d0
    4792:	2f08           	move.l a0,-(sp)
    4794:	2f00           	move.l d0,-(sp)
    4796:	2f2f 01d0      	move.l 464(sp),-(sp)
    479a:	2f2f 0056      	move.l 86(sp),-(sp)
    479e:	4eba 23ae      	jsr 6b4e <TestRow>(pc)
    47a2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    47a6:	702a           	moveq #42,d0
    47a8:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    47ac:	222f 0196      	move.l 406(sp),d1
    47b0:	2001           	move.l d1,d0
    47b2:	d080           	add.l d0,d0
    47b4:	d081           	add.l d1,d0
    47b6:	2200           	move.l d0,d1
    47b8:	e789           	lsl.l #3,d1
    47ba:	2041           	movea.l d1,a0
    47bc:	91c0           	suba.l d0,a0
    47be:	41e8 001d      	lea 29(a0),a0
    47c2:	7000           	moveq #0,d0
    47c4:	302f 01c6      	move.w 454(sp),d0
    47c8:	2f08           	move.l a0,-(sp)
    47ca:	2f00           	move.l d0,-(sp)
    47cc:	2f2f 01d0      	move.l 464(sp),-(sp)
    47d0:	2f2f 0056      	move.l 86(sp),-(sp)
    47d4:	4eba 2378      	jsr 6b4e <TestRow>(pc)
    47d8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    47dc:	722a           	moveq #42,d1
    47de:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    47e2:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    47e6:	52af 0196      	addq.l #1,406(sp)
    47ea:	700b           	moveq #11,d0
    47ec:	b0af 0196      	cmp.l 406(sp),d0
    47f0:	6c00 fde4      	bge.w 45d6 <TestZoom4Picture+0x8ea>
  }

  TestRow( valsupposed, valactual, mask, 269);
    47f4:	7000           	moveq #0,d0
    47f6:	302f 01c6      	move.w 454(sp),d0
    47fa:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    47fe:	2f00           	move.l d0,-(sp)
    4800:	2f2f 01d0      	move.l 464(sp),-(sp)
    4804:	2f2f 0056      	move.l 86(sp),-(sp)
    4808:	4eba 2344      	jsr 6b4e <TestRow>(pc)
    480c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4810:	722a           	moveq #42,d1
    4812:	d3af 01c8      	add.l d1,456(sp)
  
  tmp = source;
    4816:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    481c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4822:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    4828:	4878 0001      	pea 1 <_start+0x1>
    482c:	4878 0004      	pea 4 <_start+0x4>
    4830:	2f2f 0056      	move.l 86(sp),-(sp)
    4834:	2f2f 006a      	move.l 106(sp),-(sp)
    4838:	4eba d262      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    483c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4840:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    4846:	2c40           	movea.l d0,a6
    4848:	4eae ff1c      	jsr -228(a6)

  valactual = destination+2; 
    484c:	202f 004e      	move.l 78(sp),d0
    4850:	5880           	addq.l #4,d0
    4852:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom5;
    4856:	2f7c 0000 bb80 	move.l #48000,74(sp)
    485c:	004a 
  mask = 0x0000;
    485e:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<13;i2++) {  
    4862:	42af 018e      	clr.l 398(sp)
    4866:	602a           	bra.s 4892 <TestZoom4Picture+0xba6>
    TestRow( valsupposed, valactual, mask, i2);
    4868:	7000           	moveq #0,d0
    486a:	302f 01c6      	move.w 454(sp),d0
    486e:	2f2f 018e      	move.l 398(sp),-(sp)
    4872:	2f00           	move.l d0,-(sp)
    4874:	2f2f 01d0      	move.l 464(sp),-(sp)
    4878:	2f2f 0056      	move.l 86(sp),-(sp)
    487c:	4eba 22d0      	jsr 6b4e <TestRow>(pc)
    4880:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4884:	722a           	moveq #42,d1
    4886:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    488a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    488e:	52af 018e      	addq.l #1,398(sp)
    4892:	700c           	moveq #12,d0
    4894:	b0af 018e      	cmp.l 398(sp),d0
    4898:	6cce           	bge.s 4868 <TestZoom4Picture+0xb7c>
  }

  TestRow( valsupposed, valactual, mask, 12);   
    489a:	7000           	moveq #0,d0
    489c:	302f 01c6      	move.w 454(sp),d0
    48a0:	4878 000c      	pea c <_start+0xc>
    48a4:	2f00           	move.l d0,-(sp)
    48a6:	2f2f 01d0      	move.l 464(sp),-(sp)
    48aa:	2f2f 0056      	move.l 86(sp),-(sp)
    48ae:	4eba 229e      	jsr 6b4e <TestRow>(pc)
    48b2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48b6:	722a           	moveq #42,d1
    48b8:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 13);
    48bc:	7000           	moveq #0,d0
    48be:	302f 01c6      	move.w 454(sp),d0
    48c2:	4878 000d      	pea d <_start+0xd>
    48c6:	2f00           	move.l d0,-(sp)
    48c8:	2f2f 01d0      	move.l 464(sp),-(sp)
    48cc:	2f2f 0056      	move.l 86(sp),-(sp)
    48d0:	4eba 227c      	jsr 6b4e <TestRow>(pc)
    48d4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48d8:	702a           	moveq #42,d0
    48da:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    48de:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 14);
    48e2:	7000           	moveq #0,d0
    48e4:	302f 01c6      	move.w 454(sp),d0
    48e8:	4878 000e      	pea e <_start+0xe>
    48ec:	2f00           	move.l d0,-(sp)
    48ee:	2f2f 01d0      	move.l 464(sp),-(sp)
    48f2:	2f2f 0056      	move.l 86(sp),-(sp)
    48f6:	4eba 2256      	jsr 6b4e <TestRow>(pc)
    48fa:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48fe:	722a           	moveq #42,d1
    4900:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 15);
    4904:	7000           	moveq #0,d0
    4906:	302f 01c6      	move.w 454(sp),d0
    490a:	4878 000f      	pea f <_start+0xf>
    490e:	2f00           	move.l d0,-(sp)
    4910:	2f2f 01d0      	move.l 464(sp),-(sp)
    4914:	2f2f 0056      	move.l 86(sp),-(sp)
    4918:	4eba 2234      	jsr 6b4e <TestRow>(pc)
    491c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4920:	702a           	moveq #42,d0
    4922:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4926:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 16);
    492a:	7000           	moveq #0,d0
    492c:	302f 01c6      	move.w 454(sp),d0
    4930:	4878 0010      	pea 10 <_start+0x10>
    4934:	2f00           	move.l d0,-(sp)
    4936:	2f2f 01d0      	move.l 464(sp),-(sp)
    493a:	2f2f 0056      	move.l 86(sp),-(sp)
    493e:	4eba 220e      	jsr 6b4e <TestRow>(pc)
    4942:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4946:	722a           	moveq #42,d1
    4948:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 17);
    494c:	7000           	moveq #0,d0
    494e:	302f 01c6      	move.w 454(sp),d0
    4952:	4878 0011      	pea 11 <_start+0x11>
    4956:	2f00           	move.l d0,-(sp)
    4958:	2f2f 01d0      	move.l 464(sp),-(sp)
    495c:	2f2f 0056      	move.l 86(sp),-(sp)
    4960:	4eba 21ec      	jsr 6b4e <TestRow>(pc)
    4964:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4968:	702a           	moveq #42,d0
    496a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    496e:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 18);
    4972:	7000           	moveq #0,d0
    4974:	302f 01c6      	move.w 454(sp),d0
    4978:	4878 0012      	pea 12 <_start+0x12>
    497c:	2f00           	move.l d0,-(sp)
    497e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4982:	2f2f 0056      	move.l 86(sp),-(sp)
    4986:	4eba 21c6      	jsr 6b4e <TestRow>(pc)
    498a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    498e:	722a           	moveq #42,d1
    4990:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 19);
    4994:	7000           	moveq #0,d0
    4996:	302f 01c6      	move.w 454(sp),d0
    499a:	4878 0013      	pea 13 <_start+0x13>
    499e:	2f00           	move.l d0,-(sp)
    49a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    49a4:	2f2f 0056      	move.l 86(sp),-(sp)
    49a8:	4eba 21a4      	jsr 6b4e <TestRow>(pc)
    49ac:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49b0:	702a           	moveq #42,d0
    49b2:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    49b6:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 20);
    49ba:	7000           	moveq #0,d0
    49bc:	302f 01c6      	move.w 454(sp),d0
    49c0:	4878 0014      	pea 14 <_start+0x14>
    49c4:	2f00           	move.l d0,-(sp)
    49c6:	2f2f 01d0      	move.l 464(sp),-(sp)
    49ca:	2f2f 0056      	move.l 86(sp),-(sp)
    49ce:	4eba 217e      	jsr 6b4e <TestRow>(pc)
    49d2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49d6:	722a           	moveq #42,d1
    49d8:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 21);
    49dc:	7000           	moveq #0,d0
    49de:	302f 01c6      	move.w 454(sp),d0
    49e2:	4878 0015      	pea 15 <_start+0x15>
    49e6:	2f00           	move.l d0,-(sp)
    49e8:	2f2f 01d0      	move.l 464(sp),-(sp)
    49ec:	2f2f 0056      	move.l 86(sp),-(sp)
    49f0:	4eba 215c      	jsr 6b4e <TestRow>(pc)
    49f4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49f8:	702a           	moveq #42,d0
    49fa:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    49fe:	466f 01c6      	not.w 454(sp)


  for(int i=0;i<10;i++) {
    4a02:	42af 018a      	clr.l 394(sp)
    4a06:	6000 0286      	bra.w 4c8e <TestZoom4Picture+0xfa2>
    for(int i2=0;i2<13;i2++) {  
    4a0a:	42af 0186      	clr.l 390(sp)
    4a0e:	6042           	bra.s 4a52 <TestZoom4Picture+0xd66>
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    4a10:	222f 018a      	move.l 394(sp),d1
    4a14:	2001           	move.l d1,d0
    4a16:	d080           	add.l d0,d0
    4a18:	d081           	add.l d1,d0
    4a1a:	2200           	move.l d0,d1
    4a1c:	e789           	lsl.l #3,d1
    4a1e:	9280           	sub.l d0,d1
    4a20:	2041           	movea.l d1,a0
    4a22:	d1ef 0186      	adda.l 390(sp),a0
    4a26:	41e8 0016      	lea 22(a0),a0
    4a2a:	7000           	moveq #0,d0
    4a2c:	302f 01c6      	move.w 454(sp),d0
    4a30:	2f08           	move.l a0,-(sp)
    4a32:	2f00           	move.l d0,-(sp)
    4a34:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a38:	2f2f 0056      	move.l 86(sp),-(sp)
    4a3c:	4eba 2110      	jsr 6b4e <TestRow>(pc)
    4a40:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4a44:	722a           	moveq #42,d1
    4a46:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4a4a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {  
    4a4e:	52af 0186      	addq.l #1,390(sp)
    4a52:	700c           	moveq #12,d0
    4a54:	b0af 0186      	cmp.l 390(sp),d0
    4a58:	6cb6           	bge.s 4a10 <TestZoom4Picture+0xd24>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    4a5a:	222f 018a      	move.l 394(sp),d1
    4a5e:	2001           	move.l d1,d0
    4a60:	d080           	add.l d0,d0
    4a62:	d081           	add.l d1,d0
    4a64:	2200           	move.l d0,d1
    4a66:	e789           	lsl.l #3,d1
    4a68:	2041           	movea.l d1,a0
    4a6a:	91c0           	suba.l d0,a0
    4a6c:	41e8 0023      	lea 35(a0),a0
    4a70:	7000           	moveq #0,d0
    4a72:	302f 01c6      	move.w 454(sp),d0
    4a76:	2f08           	move.l a0,-(sp)
    4a78:	2f00           	move.l d0,-(sp)
    4a7a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a7e:	2f2f 0056      	move.l 86(sp),-(sp)
    4a82:	4eba 20ca      	jsr 6b4e <TestRow>(pc)
    4a86:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a8a:	722a           	moveq #42,d1
    4a8c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    4a90:	222f 018a      	move.l 394(sp),d1
    4a94:	2001           	move.l d1,d0
    4a96:	d080           	add.l d0,d0
    4a98:	d081           	add.l d1,d0
    4a9a:	2200           	move.l d0,d1
    4a9c:	e789           	lsl.l #3,d1
    4a9e:	2041           	movea.l d1,a0
    4aa0:	91c0           	suba.l d0,a0
    4aa2:	41e8 0024      	lea 36(a0),a0
    4aa6:	7000           	moveq #0,d0
    4aa8:	302f 01c6      	move.w 454(sp),d0
    4aac:	2f08           	move.l a0,-(sp)
    4aae:	2f00           	move.l d0,-(sp)
    4ab0:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ab4:	2f2f 0056      	move.l 86(sp),-(sp)
    4ab8:	4eba 2094      	jsr 6b4e <TestRow>(pc)
    4abc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ac0:	702a           	moveq #42,d0
    4ac2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4ac6:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    4aca:	222f 018a      	move.l 394(sp),d1
    4ace:	2001           	move.l d1,d0
    4ad0:	d080           	add.l d0,d0
    4ad2:	d081           	add.l d1,d0
    4ad4:	2200           	move.l d0,d1
    4ad6:	e789           	lsl.l #3,d1
    4ad8:	2041           	movea.l d1,a0
    4ada:	91c0           	suba.l d0,a0
    4adc:	41e8 0025      	lea 37(a0),a0
    4ae0:	7000           	moveq #0,d0
    4ae2:	302f 01c6      	move.w 454(sp),d0
    4ae6:	2f08           	move.l a0,-(sp)
    4ae8:	2f00           	move.l d0,-(sp)
    4aea:	2f2f 01d0      	move.l 464(sp),-(sp)
    4aee:	2f2f 0056      	move.l 86(sp),-(sp)
    4af2:	4eba 205a      	jsr 6b4e <TestRow>(pc)
    4af6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4afa:	722a           	moveq #42,d1
    4afc:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    4b00:	222f 018a      	move.l 394(sp),d1
    4b04:	2001           	move.l d1,d0
    4b06:	d080           	add.l d0,d0
    4b08:	d081           	add.l d1,d0
    4b0a:	2200           	move.l d0,d1
    4b0c:	e789           	lsl.l #3,d1
    4b0e:	2041           	movea.l d1,a0
    4b10:	91c0           	suba.l d0,a0
    4b12:	41e8 0026      	lea 38(a0),a0
    4b16:	7000           	moveq #0,d0
    4b18:	302f 01c6      	move.w 454(sp),d0
    4b1c:	2f08           	move.l a0,-(sp)
    4b1e:	2f00           	move.l d0,-(sp)
    4b20:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b24:	2f2f 0056      	move.l 86(sp),-(sp)
    4b28:	4eba 2024      	jsr 6b4e <TestRow>(pc)
    4b2c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b30:	702a           	moveq #42,d0
    4b32:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b36:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    4b3a:	222f 018a      	move.l 394(sp),d1
    4b3e:	2001           	move.l d1,d0
    4b40:	d080           	add.l d0,d0
    4b42:	d081           	add.l d1,d0
    4b44:	2200           	move.l d0,d1
    4b46:	e789           	lsl.l #3,d1
    4b48:	2041           	movea.l d1,a0
    4b4a:	91c0           	suba.l d0,a0
    4b4c:	41e8 0027      	lea 39(a0),a0
    4b50:	7000           	moveq #0,d0
    4b52:	302f 01c6      	move.w 454(sp),d0
    4b56:	2f08           	move.l a0,-(sp)
    4b58:	2f00           	move.l d0,-(sp)
    4b5a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b5e:	2f2f 0056      	move.l 86(sp),-(sp)
    4b62:	4eba 1fea      	jsr 6b4e <TestRow>(pc)
    4b66:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b6a:	722a           	moveq #42,d1
    4b6c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    4b70:	222f 018a      	move.l 394(sp),d1
    4b74:	2001           	move.l d1,d0
    4b76:	d080           	add.l d0,d0
    4b78:	d081           	add.l d1,d0
    4b7a:	2200           	move.l d0,d1
    4b7c:	e789           	lsl.l #3,d1
    4b7e:	2041           	movea.l d1,a0
    4b80:	91c0           	suba.l d0,a0
    4b82:	41e8 0028      	lea 40(a0),a0
    4b86:	7000           	moveq #0,d0
    4b88:	302f 01c6      	move.w 454(sp),d0
    4b8c:	2f08           	move.l a0,-(sp)
    4b8e:	2f00           	move.l d0,-(sp)
    4b90:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b94:	2f2f 0056      	move.l 86(sp),-(sp)
    4b98:	4eba 1fb4      	jsr 6b4e <TestRow>(pc)
    4b9c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ba0:	702a           	moveq #42,d0
    4ba2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4ba6:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    4baa:	222f 018a      	move.l 394(sp),d1
    4bae:	2001           	move.l d1,d0
    4bb0:	d080           	add.l d0,d0
    4bb2:	d081           	add.l d1,d0
    4bb4:	2200           	move.l d0,d1
    4bb6:	e789           	lsl.l #3,d1
    4bb8:	2041           	movea.l d1,a0
    4bba:	91c0           	suba.l d0,a0
    4bbc:	41e8 0029      	lea 41(a0),a0
    4bc0:	7000           	moveq #0,d0
    4bc2:	302f 01c6      	move.w 454(sp),d0
    4bc6:	2f08           	move.l a0,-(sp)
    4bc8:	2f00           	move.l d0,-(sp)
    4bca:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bce:	2f2f 0056      	move.l 86(sp),-(sp)
    4bd2:	4eba 1f7a      	jsr 6b4e <TestRow>(pc)
    4bd6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4bda:	722a           	moveq #42,d1
    4bdc:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    4be0:	222f 018a      	move.l 394(sp),d1
    4be4:	2001           	move.l d1,d0
    4be6:	d080           	add.l d0,d0
    4be8:	d081           	add.l d1,d0
    4bea:	2200           	move.l d0,d1
    4bec:	e789           	lsl.l #3,d1
    4bee:	2041           	movea.l d1,a0
    4bf0:	91c0           	suba.l d0,a0
    4bf2:	41e8 002a      	lea 42(a0),a0
    4bf6:	7000           	moveq #0,d0
    4bf8:	302f 01c6      	move.w 454(sp),d0
    4bfc:	2f08           	move.l a0,-(sp)
    4bfe:	2f00           	move.l d0,-(sp)
    4c00:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c04:	2f2f 0056      	move.l 86(sp),-(sp)
    4c08:	4eba 1f44      	jsr 6b4e <TestRow>(pc)
    4c0c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c10:	702a           	moveq #42,d0
    4c12:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c16:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    4c1a:	222f 018a      	move.l 394(sp),d1
    4c1e:	2001           	move.l d1,d0
    4c20:	d080           	add.l d0,d0
    4c22:	d081           	add.l d1,d0
    4c24:	2200           	move.l d0,d1
    4c26:	e789           	lsl.l #3,d1
    4c28:	2041           	movea.l d1,a0
    4c2a:	91c0           	suba.l d0,a0
    4c2c:	41e8 002b      	lea 43(a0),a0
    4c30:	7000           	moveq #0,d0
    4c32:	302f 01c6      	move.w 454(sp),d0
    4c36:	2f08           	move.l a0,-(sp)
    4c38:	2f00           	move.l d0,-(sp)
    4c3a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c3e:	2f2f 0056      	move.l 86(sp),-(sp)
    4c42:	4eba 1f0a      	jsr 6b4e <TestRow>(pc)
    4c46:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c4a:	722a           	moveq #42,d1
    4c4c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    4c50:	222f 018a      	move.l 394(sp),d1
    4c54:	2001           	move.l d1,d0
    4c56:	d080           	add.l d0,d0
    4c58:	d081           	add.l d1,d0
    4c5a:	2200           	move.l d0,d1
    4c5c:	e789           	lsl.l #3,d1
    4c5e:	2041           	movea.l d1,a0
    4c60:	91c0           	suba.l d0,a0
    4c62:	41e8 002c      	lea 44(a0),a0
    4c66:	7000           	moveq #0,d0
    4c68:	302f 01c6      	move.w 454(sp),d0
    4c6c:	2f08           	move.l a0,-(sp)
    4c6e:	2f00           	move.l d0,-(sp)
    4c70:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c74:	2f2f 0056      	move.l 86(sp),-(sp)
    4c78:	4eba 1ed4      	jsr 6b4e <TestRow>(pc)
    4c7c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c80:	702a           	moveq #42,d0
    4c82:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c86:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<10;i++) {
    4c8a:	52af 018a      	addq.l #1,394(sp)
    4c8e:	7209           	moveq #9,d1
    4c90:	b2af 018a      	cmp.l 394(sp),d1
    4c94:	6c00 fd74      	bge.w 4a0a <TestZoom4Picture+0xd1e>
  }

  for(int i2=0;i2<13;i2++) {  
    4c98:	42af 0182      	clr.l 386(sp)
    4c9c:	6032           	bra.s 4cd0 <TestZoom4Picture+0xfe4>
    TestRow( valsupposed, valactual, mask, i2+253);
    4c9e:	222f 0182      	move.l 386(sp),d1
    4ca2:	0681 0000 00fd 	addi.l #253,d1
    4ca8:	7000           	moveq #0,d0
    4caa:	302f 01c6      	move.w 454(sp),d0
    4cae:	2f01           	move.l d1,-(sp)
    4cb0:	2f00           	move.l d0,-(sp)
    4cb2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cb6:	2f2f 0056      	move.l 86(sp),-(sp)
    4cba:	4eba 1e92      	jsr 6b4e <TestRow>(pc)
    4cbe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4cc2:	702a           	moveq #42,d0
    4cc4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4cc8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4ccc:	52af 0182      	addq.l #1,386(sp)
    4cd0:	720c           	moveq #12,d1
    4cd2:	b2af 0182      	cmp.l 386(sp),d1
    4cd6:	6cc6           	bge.s 4c9e <TestZoom4Picture+0xfb2>
  }

  TestRow( valsupposed, valactual, mask, 266);
    4cd8:	7000           	moveq #0,d0
    4cda:	302f 01c6      	move.w 454(sp),d0
    4cde:	4878 010a      	pea 10a <FreeDisplay+0x2a>
    4ce2:	2f00           	move.l d0,-(sp)
    4ce4:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ce8:	2f2f 0056      	move.l 86(sp),-(sp)
    4cec:	4eba 1e60      	jsr 6b4e <TestRow>(pc)
    4cf0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4cf4:	702a           	moveq #42,d0
    4cf6:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 267);
    4cfa:	7000           	moveq #0,d0
    4cfc:	302f 01c6      	move.w 454(sp),d0
    4d00:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    4d04:	2f00           	move.l d0,-(sp)
    4d06:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d0a:	2f2f 0056      	move.l 86(sp),-(sp)
    4d0e:	4eba 1e3e      	jsr 6b4e <TestRow>(pc)
    4d12:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d16:	722a           	moveq #42,d1
    4d18:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4d1c:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 268);
    4d20:	7000           	moveq #0,d0
    4d22:	302f 01c6      	move.w 454(sp),d0
    4d26:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    4d2a:	2f00           	move.l d0,-(sp)
    4d2c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d30:	2f2f 0056      	move.l 86(sp),-(sp)
    4d34:	4eba 1e18      	jsr 6b4e <TestRow>(pc)
    4d38:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d3c:	702a           	moveq #42,d0
    4d3e:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 269);
    4d42:	7000           	moveq #0,d0
    4d44:	302f 01c6      	move.w 454(sp),d0
    4d48:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4d4c:	2f00           	move.l d0,-(sp)
    4d4e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d52:	2f2f 0056      	move.l 86(sp),-(sp)
    4d56:	4eba 1df6      	jsr 6b4e <TestRow>(pc)
    4d5a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d5e:	722a           	moveq #42,d1
    4d60:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4d64:	466f 01c6      	not.w 454(sp)

  tmp = source;
    4d68:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4d6e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4d74:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    4d7a:	4878 0001      	pea 1 <_start+0x1>
    4d7e:	4878 0005      	pea 5 <_start+0x5>
    4d82:	2f2f 0056      	move.l 86(sp),-(sp)
    4d86:	2f2f 006a      	move.l 106(sp),-(sp)
    4d8a:	4eba cd10      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    4d8e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4d92:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    4d98:	2c40           	movea.l d0,a6
    4d9a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4d9e:	202f 004e      	move.l 78(sp),d0
    4da2:	5880           	addq.l #4,d0
    4da4:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom6;
    4da8:	2f7c 0000 bbac 	move.l #48044,74(sp)
    4dae:	004a 
  mask = 0x0000;
    4db0:	426f 01c6      	clr.w 454(sp)
 
  for(int i2=0;i2<7;i2++) {  
    4db4:	42af 017e      	clr.l 382(sp)
    4db8:	602a           	bra.s 4de4 <TestZoom4Picture+0x10f8>
    TestRow( valsupposed, valactual, mask, i2);
    4dba:	7000           	moveq #0,d0
    4dbc:	302f 01c6      	move.w 454(sp),d0
    4dc0:	2f2f 017e      	move.l 382(sp),-(sp)
    4dc4:	2f00           	move.l d0,-(sp)
    4dc6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4dca:	2f2f 0056      	move.l 86(sp),-(sp)
    4dce:	4eba 1d7e      	jsr 6b4e <TestRow>(pc)
    4dd2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4dd6:	722a           	moveq #42,d1
    4dd8:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4ddc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    4de0:	52af 017e      	addq.l #1,382(sp)
    4de4:	7006           	moveq #6,d0
    4de6:	b0af 017e      	cmp.l 382(sp),d0
    4dea:	6cce           	bge.s 4dba <TestZoom4Picture+0x10ce>
  }

  for(int i=0;i<6;i++) {
    4dec:	42af 017a      	clr.l 378(sp)
    4df0:	605c           	bra.s 4e4e <TestZoom4Picture+0x1162>
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    4df2:	202f 017a      	move.l 378(sp),d0
    4df6:	d080           	add.l d0,d0
    4df8:	2200           	move.l d0,d1
    4dfa:	5e81           	addq.l #7,d1
    4dfc:	7000           	moveq #0,d0
    4dfe:	302f 01c6      	move.w 454(sp),d0
    4e02:	2f01           	move.l d1,-(sp)
    4e04:	2f00           	move.l d0,-(sp)
    4e06:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e0a:	2f2f 0056      	move.l 86(sp),-(sp)
    4e0e:	4eba 1d3e      	jsr 6b4e <TestRow>(pc)
    4e12:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e16:	722a           	moveq #42,d1
    4e18:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    4e1c:	202f 017a      	move.l 378(sp),d0
    4e20:	5880           	addq.l #4,d0
    4e22:	d080           	add.l d0,d0
    4e24:	2200           	move.l d0,d1
    4e26:	7000           	moveq #0,d0
    4e28:	302f 01c6      	move.w 454(sp),d0
    4e2c:	2f01           	move.l d1,-(sp)
    4e2e:	2f00           	move.l d0,-(sp)
    4e30:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e34:	2f2f 0056      	move.l 86(sp),-(sp)
    4e38:	4eba 1d14      	jsr 6b4e <TestRow>(pc)
    4e3c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e40:	702a           	moveq #42,d0
    4e42:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4e46:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<6;i++) {
    4e4a:	52af 017a      	addq.l #1,378(sp)
    4e4e:	7205           	moveq #5,d1
    4e50:	b2af 017a      	cmp.l 378(sp),d1
    4e54:	6c9c           	bge.s 4df2 <TestZoom4Picture+0x1106>
  }

  for(int i=0;i<10;i++) {
    4e56:	42af 0176      	clr.l 374(sp)
    4e5a:	6000 00ce      	bra.w 4f2a <TestZoom4Picture+0x123e>
    for(int i2=0;i2<12;i2++) {  
    4e5e:	42af 0172      	clr.l 370(sp)
    4e62:	6040           	bra.s 4ea4 <TestZoom4Picture+0x11b8>
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    4e64:	307c 0013      	movea.w #19,a0
    4e68:	d1ef 0172      	adda.l 370(sp),a0
    4e6c:	222f 0176      	move.l 374(sp),d1
    4e70:	2001           	move.l d1,d0
    4e72:	d080           	add.l d0,d0
    4e74:	d081           	add.l d1,d0
    4e76:	e788           	lsl.l #3,d0
    4e78:	2208           	move.l a0,d1
    4e7a:	d280           	add.l d0,d1
    4e7c:	7000           	moveq #0,d0
    4e7e:	302f 01c6      	move.w 454(sp),d0
    4e82:	2f01           	move.l d1,-(sp)
    4e84:	2f00           	move.l d0,-(sp)
    4e86:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e8a:	2f2f 0056      	move.l 86(sp),-(sp)
    4e8e:	4eba 1cbe      	jsr 6b4e <TestRow>(pc)
    4e92:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4e96:	702a           	moveq #42,d0
    4e98:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4e9c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {  
    4ea0:	52af 0172      	addq.l #1,370(sp)
    4ea4:	720b           	moveq #11,d1
    4ea6:	b2af 0172      	cmp.l 370(sp),d1
    4eaa:	6cb8           	bge.s 4e64 <TestZoom4Picture+0x1178>
    }
    for(int i=0;i<6;i++) {
    4eac:	42af 016e      	clr.l 366(sp)
    4eb0:	606c           	bra.s 4f1e <TestZoom4Picture+0x1232>
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    4eb2:	222f 016e      	move.l 366(sp),d1
    4eb6:	2001           	move.l d1,d0
    4eb8:	d080           	add.l d0,d0
    4eba:	d081           	add.l d1,d0
    4ebc:	e788           	lsl.l #3,d0
    4ebe:	2040           	movea.l d0,a0
    4ec0:	41e8 001f      	lea 31(a0),a0
    4ec4:	7000           	moveq #0,d0
    4ec6:	302f 01c6      	move.w 454(sp),d0
    4eca:	2f08           	move.l a0,-(sp)
    4ecc:	2f00           	move.l d0,-(sp)
    4ece:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ed2:	2f2f 0056      	move.l 86(sp),-(sp)
    4ed6:	4eba 1c76      	jsr 6b4e <TestRow>(pc)
    4eda:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4ede:	702a           	moveq #42,d0
    4ee0:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    4ee4:	222f 016e      	move.l 366(sp),d1
    4ee8:	2001           	move.l d1,d0
    4eea:	d080           	add.l d0,d0
    4eec:	d081           	add.l d1,d0
    4eee:	e788           	lsl.l #3,d0
    4ef0:	2040           	movea.l d0,a0
    4ef2:	41e8 0020      	lea 32(a0),a0
    4ef6:	7000           	moveq #0,d0
    4ef8:	302f 01c6      	move.w 454(sp),d0
    4efc:	2f08           	move.l a0,-(sp)
    4efe:	2f00           	move.l d0,-(sp)
    4f00:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f04:	2f2f 0056      	move.l 86(sp),-(sp)
    4f08:	4eba 1c44      	jsr 6b4e <TestRow>(pc)
    4f0c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4f10:	722a           	moveq #42,d1
    4f12:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4f16:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<6;i++) {
    4f1a:	52af 016e      	addq.l #1,366(sp)
    4f1e:	7005           	moveq #5,d0
    4f20:	b0af 016e      	cmp.l 366(sp),d0
    4f24:	6c8c           	bge.s 4eb2 <TestZoom4Picture+0x11c6>
  for(int i=0;i<10;i++) {
    4f26:	52af 0176      	addq.l #1,374(sp)
    4f2a:	7209           	moveq #9,d1
    4f2c:	b2af 0176      	cmp.l 374(sp),d1
    4f30:	6c00 ff2c      	bge.w 4e5e <TestZoom4Picture+0x1172>
    }
  }

  for(int i2=0;i2<11;i2++) {  
    4f34:	42af 016a      	clr.l 362(sp)
    4f38:	6032           	bra.s 4f6c <TestZoom4Picture+0x1280>
    TestRow( valsupposed, valactual, mask, 258+i2);
    4f3a:	222f 016a      	move.l 362(sp),d1
    4f3e:	0681 0000 0102 	addi.l #258,d1
    4f44:	7000           	moveq #0,d0
    4f46:	302f 01c6      	move.w 454(sp),d0
    4f4a:	2f01           	move.l d1,-(sp)
    4f4c:	2f00           	move.l d0,-(sp)
    4f4e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f52:	2f2f 0056      	move.l 86(sp),-(sp)
    4f56:	4eba 1bf6      	jsr 6b4e <TestRow>(pc)
    4f5a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4f5e:	702a           	moveq #42,d0
    4f60:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4f64:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {  
    4f68:	52af 016a      	addq.l #1,362(sp)
    4f6c:	720a           	moveq #10,d1
    4f6e:	b2af 016a      	cmp.l 362(sp),d1
    4f72:	6cc6           	bge.s 4f3a <TestZoom4Picture+0x124e>
  }

  tmp = source;
    4f74:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4f7a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4f80:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    4f86:	4878 0001      	pea 1 <_start+0x1>
    4f8a:	4878 0006      	pea 6 <_start+0x6>
    4f8e:	2f2f 0056      	move.l 86(sp),-(sp)
    4f92:	2f2f 006a      	move.l 106(sp),-(sp)
    4f96:	4eba cb04      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    4f9a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4f9e:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    4fa4:	2c40           	movea.l d0,a6
    4fa6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4faa:	202f 004e      	move.l 78(sp),d0
    4fae:	5880           	addq.l #4,d0
    4fb0:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom7;
    4fb4:	2f7c 0000 bbd8 	move.l #48088,74(sp)
    4fba:	004a 
  mask = 0x0000;
    4fbc:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    4fc0:	7000           	moveq #0,d0
    4fc2:	302f 01c6      	move.w 454(sp),d0
    4fc6:	42a7           	clr.l -(sp)
    4fc8:	2f00           	move.l d0,-(sp)
    4fca:	2f2f 01d0      	move.l 464(sp),-(sp)
    4fce:	2f2f 0056      	move.l 86(sp),-(sp)
    4fd2:	4eba 1b7a      	jsr 6b4e <TestRow>(pc)
    4fd6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4fda:	722a           	moveq #42,d1
    4fdc:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4fe0:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    4fe4:	42af 0166      	clr.l 358(sp)
    4fe8:	605c           	bra.s 5046 <TestZoom4Picture+0x135a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    4fea:	202f 0166      	move.l 358(sp),d0
    4fee:	d080           	add.l d0,d0
    4ff0:	2200           	move.l d0,d1
    4ff2:	5281           	addq.l #1,d1
    4ff4:	7000           	moveq #0,d0
    4ff6:	302f 01c6      	move.w 454(sp),d0
    4ffa:	2f01           	move.l d1,-(sp)
    4ffc:	2f00           	move.l d0,-(sp)
    4ffe:	2f2f 01d0      	move.l 464(sp),-(sp)
    5002:	2f2f 0056      	move.l 86(sp),-(sp)
    5006:	4eba 1b46      	jsr 6b4e <TestRow>(pc)
    500a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    500e:	702a           	moveq #42,d0
    5010:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    5014:	202f 0166      	move.l 358(sp),d0
    5018:	5280           	addq.l #1,d0
    501a:	d080           	add.l d0,d0
    501c:	2200           	move.l d0,d1
    501e:	7000           	moveq #0,d0
    5020:	302f 01c6      	move.w 454(sp),d0
    5024:	2f01           	move.l d1,-(sp)
    5026:	2f00           	move.l d0,-(sp)
    5028:	2f2f 01d0      	move.l 464(sp),-(sp)
    502c:	2f2f 0056      	move.l 86(sp),-(sp)
    5030:	4eba 1b1c      	jsr 6b4e <TestRow>(pc)
    5034:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5038:	722a           	moveq #42,d1
    503a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    503e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    5042:	52af 0166      	addq.l #1,358(sp)
    5046:	7006           	moveq #6,d0
    5048:	b0af 0166      	cmp.l 358(sp),d0
    504c:	6c9c           	bge.s 4fea <TestZoom4Picture+0x12fe>
  }

  for(int i=0;i<10;i++) {
    504e:	42af 0162      	clr.l 354(sp)
    5052:	6000 00d4      	bra.w 5128 <TestZoom4Picture+0x143c>
    for(int i2=0;i2<11;i2++) {  
    5056:	42af 015e      	clr.l 350(sp)
    505a:	6042           	bra.s 509e <TestZoom4Picture+0x13b2>
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    505c:	307c 000f      	movea.w #15,a0
    5060:	d1ef 015e      	adda.l 350(sp),a0
    5064:	222f 0162      	move.l 354(sp),d1
    5068:	2001           	move.l d1,d0
    506a:	d080           	add.l d0,d0
    506c:	d081           	add.l d1,d0
    506e:	e788           	lsl.l #3,d0
    5070:	d081           	add.l d1,d0
    5072:	2208           	move.l a0,d1
    5074:	d280           	add.l d0,d1
    5076:	7000           	moveq #0,d0
    5078:	302f 01c6      	move.w 454(sp),d0
    507c:	2f01           	move.l d1,-(sp)
    507e:	2f00           	move.l d0,-(sp)
    5080:	2f2f 01d0      	move.l 464(sp),-(sp)
    5084:	2f2f 0056      	move.l 86(sp),-(sp)
    5088:	4eba 1ac4      	jsr 6b4e <TestRow>(pc)
    508c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5090:	722a           	moveq #42,d1
    5092:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5096:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {  
    509a:	52af 015e      	addq.l #1,350(sp)
    509e:	700a           	moveq #10,d0
    50a0:	b0af 015e      	cmp.l 350(sp),d0
    50a4:	6cb6           	bge.s 505c <TestZoom4Picture+0x1370>
    }
    for(int i=0;i<7;i++) {
    50a6:	42af 015a      	clr.l 346(sp)
    50aa:	6070           	bra.s 511c <TestZoom4Picture+0x1430>
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    50ac:	222f 015a      	move.l 346(sp),d1
    50b0:	2001           	move.l d1,d0
    50b2:	d080           	add.l d0,d0
    50b4:	d081           	add.l d1,d0
    50b6:	e788           	lsl.l #3,d0
    50b8:	2040           	movea.l d0,a0
    50ba:	d1c1           	adda.l d1,a0
    50bc:	41e8 001a      	lea 26(a0),a0
    50c0:	7000           	moveq #0,d0
    50c2:	302f 01c6      	move.w 454(sp),d0
    50c6:	2f08           	move.l a0,-(sp)
    50c8:	2f00           	move.l d0,-(sp)
    50ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    50ce:	2f2f 0056      	move.l 86(sp),-(sp)
    50d2:	4eba 1a7a      	jsr 6b4e <TestRow>(pc)
    50d6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    50da:	722a           	moveq #42,d1
    50dc:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    50e0:	222f 015a      	move.l 346(sp),d1
    50e4:	2001           	move.l d1,d0
    50e6:	d080           	add.l d0,d0
    50e8:	d081           	add.l d1,d0
    50ea:	e788           	lsl.l #3,d0
    50ec:	2040           	movea.l d0,a0
    50ee:	d1c1           	adda.l d1,a0
    50f0:	41e8 001a      	lea 26(a0),a0
    50f4:	7000           	moveq #0,d0
    50f6:	302f 01c6      	move.w 454(sp),d0
    50fa:	2f08           	move.l a0,-(sp)
    50fc:	2f00           	move.l d0,-(sp)
    50fe:	2f2f 01d0      	move.l 464(sp),-(sp)
    5102:	2f2f 0056      	move.l 86(sp),-(sp)
    5106:	4eba 1a46      	jsr 6b4e <TestRow>(pc)
    510a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    510e:	702a           	moveq #42,d0
    5110:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5114:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<7;i++) {
    5118:	52af 015a      	addq.l #1,346(sp)
    511c:	7206           	moveq #6,d1
    511e:	b2af 015a      	cmp.l 346(sp),d1
    5122:	6c88           	bge.s 50ac <TestZoom4Picture+0x13c0>
  for(int i=0;i<10;i++) {
    5124:	52af 0162      	addq.l #1,354(sp)
    5128:	7009           	moveq #9,d0
    512a:	b0af 0162      	cmp.l 354(sp),d0
    512e:	6c00 ff26      	bge.w 5056 <TestZoom4Picture+0x136a>
    }
  }

  for(int i2=0;i2<5;i2++) {  
    5132:	42af 0156      	clr.l 342(sp)
    5136:	6032           	bra.s 516a <TestZoom4Picture+0x147e>
    TestRow( valsupposed, valactual, mask, 256+i2);
    5138:	222f 0156      	move.l 342(sp),d1
    513c:	0681 0000 0100 	addi.l #256,d1
    5142:	7000           	moveq #0,d0
    5144:	302f 01c6      	move.w 454(sp),d0
    5148:	2f01           	move.l d1,-(sp)
    514a:	2f00           	move.l d0,-(sp)
    514c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5150:	2f2f 0056      	move.l 86(sp),-(sp)
    5154:	4eba 19f8      	jsr 6b4e <TestRow>(pc)
    5158:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    515c:	722a           	moveq #42,d1
    515e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5162:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5166:	52af 0156      	addq.l #1,342(sp)
    516a:	7004           	moveq #4,d0
    516c:	b0af 0156      	cmp.l 342(sp),d0
    5170:	6cc6           	bge.s 5138 <TestZoom4Picture+0x144c>
  }

  tmp = source;
    5172:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5178:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    517e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    5184:	4878 0001      	pea 1 <_start+0x1>
    5188:	4878 0007      	pea 7 <_start+0x7>
    518c:	2f2f 0056      	move.l 86(sp),-(sp)
    5190:	2f2f 006a      	move.l 106(sp),-(sp)
    5194:	4eba c906      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    5198:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    519c:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    51a2:	2c40           	movea.l d0,a6
    51a4:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    51a8:	222f 004e      	move.l 78(sp),d1
    51ac:	5881           	addq.l #4,d1
    51ae:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom8;
    51b2:	2f7c 0000 bc04 	move.l #48132,74(sp)
    51b8:	004a 
  mask = 0xffff;
    51ba:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    51c0:	7000           	moveq #0,d0
    51c2:	302f 01c6      	move.w 454(sp),d0
    51c6:	42a7           	clr.l -(sp)
    51c8:	2f00           	move.l d0,-(sp)
    51ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    51ce:	2f2f 0056      	move.l 86(sp),-(sp)
    51d2:	4eba 197a      	jsr 6b4e <TestRow>(pc)
    51d6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    51da:	702a           	moveq #42,d0
    51dc:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    51e0:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    51e4:	42af 0152      	clr.l 338(sp)
    51e8:	605c           	bra.s 5246 <TestZoom4Picture+0x155a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    51ea:	202f 0152      	move.l 338(sp),d0
    51ee:	d080           	add.l d0,d0
    51f0:	2200           	move.l d0,d1
    51f2:	5281           	addq.l #1,d1
    51f4:	7000           	moveq #0,d0
    51f6:	302f 01c6      	move.w 454(sp),d0
    51fa:	2f01           	move.l d1,-(sp)
    51fc:	2f00           	move.l d0,-(sp)
    51fe:	2f2f 01d0      	move.l 464(sp),-(sp)
    5202:	2f2f 0056      	move.l 86(sp),-(sp)
    5206:	4eba 1946      	jsr 6b4e <TestRow>(pc)
    520a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    520e:	722a           	moveq #42,d1
    5210:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    5214:	202f 0152      	move.l 338(sp),d0
    5218:	5280           	addq.l #1,d0
    521a:	d080           	add.l d0,d0
    521c:	2200           	move.l d0,d1
    521e:	7000           	moveq #0,d0
    5220:	302f 01c6      	move.w 454(sp),d0
    5224:	2f01           	move.l d1,-(sp)
    5226:	2f00           	move.l d0,-(sp)
    5228:	2f2f 01d0      	move.l 464(sp),-(sp)
    522c:	2f2f 0056      	move.l 86(sp),-(sp)
    5230:	4eba 191c      	jsr 6b4e <TestRow>(pc)
    5234:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5238:	702a           	moveq #42,d0
    523a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    523e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5242:	52af 0152      	addq.l #1,338(sp)
    5246:	7204           	moveq #4,d1
    5248:	b2af 0152      	cmp.l 338(sp),d1
    524c:	6c9c           	bge.s 51ea <TestZoom4Picture+0x14fe>
  }

  for(int i=0;i<9;i++) {
    524e:	42af 014e      	clr.l 334(sp)
    5252:	6000 00f0      	bra.w 5344 <TestZoom4Picture+0x1658>
    for(int i2=0;i2<10;i2++) {  
    5256:	42af 014a      	clr.l 330(sp)
    525a:	6046           	bra.s 52a2 <TestZoom4Picture+0x15b6>
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    525c:	307c 000b      	movea.w #11,a0
    5260:	d1ef 014a      	adda.l 330(sp),a0
    5264:	222f 014e      	move.l 334(sp),d1
    5268:	2001           	move.l d1,d0
    526a:	d080           	add.l d0,d0
    526c:	d081           	add.l d1,d0
    526e:	d080           	add.l d0,d0
    5270:	d080           	add.l d0,d0
    5272:	d081           	add.l d1,d0
    5274:	d080           	add.l d0,d0
    5276:	2208           	move.l a0,d1
    5278:	d280           	add.l d0,d1
    527a:	7000           	moveq #0,d0
    527c:	302f 01c6      	move.w 454(sp),d0
    5280:	2f01           	move.l d1,-(sp)
    5282:	2f00           	move.l d0,-(sp)
    5284:	2f2f 01d0      	move.l 464(sp),-(sp)
    5288:	2f2f 0056      	move.l 86(sp),-(sp)
    528c:	4eba 18c0      	jsr 6b4e <TestRow>(pc)
    5290:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5294:	702a           	moveq #42,d0
    5296:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    529a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {  
    529e:	52af 014a      	addq.l #1,330(sp)
    52a2:	7209           	moveq #9,d1
    52a4:	b2af 014a      	cmp.l 330(sp),d1
    52a8:	6cb2           	bge.s 525c <TestZoom4Picture+0x1570>
    }
    for(int i2=0;i2<8;i2++) {
    52aa:	42af 0146      	clr.l 326(sp)
    52ae:	6000 0086      	bra.w 5336 <TestZoom4Picture+0x164a>
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    52b2:	222f 014e      	move.l 334(sp),d1
    52b6:	2001           	move.l d1,d0
    52b8:	d080           	add.l d0,d0
    52ba:	d081           	add.l d1,d0
    52bc:	d080           	add.l d0,d0
    52be:	d080           	add.l d0,d0
    52c0:	d081           	add.l d1,d0
    52c2:	d080           	add.l d0,d0
    52c4:	2040           	movea.l d0,a0
    52c6:	41e8 0015      	lea 21(a0),a0
    52ca:	2208           	move.l a0,d1
    52cc:	d2af 0146      	add.l 326(sp),d1
    52d0:	7000           	moveq #0,d0
    52d2:	302f 01c6      	move.w 454(sp),d0
    52d6:	2f01           	move.l d1,-(sp)
    52d8:	2f00           	move.l d0,-(sp)
    52da:	2f2f 01d0      	move.l 464(sp),-(sp)
    52de:	2f2f 0056      	move.l 86(sp),-(sp)
    52e2:	4eba 186a      	jsr 6b4e <TestRow>(pc)
    52e6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    52ea:	702a           	moveq #42,d0
    52ec:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    52f0:	222f 014e      	move.l 334(sp),d1
    52f4:	2001           	move.l d1,d0
    52f6:	d080           	add.l d0,d0
    52f8:	d081           	add.l d1,d0
    52fa:	d080           	add.l d0,d0
    52fc:	d080           	add.l d0,d0
    52fe:	d081           	add.l d1,d0
    5300:	d080           	add.l d0,d0
    5302:	2040           	movea.l d0,a0
    5304:	41e8 0015      	lea 21(a0),a0
    5308:	2208           	move.l a0,d1
    530a:	d2af 0146      	add.l 326(sp),d1
    530e:	7000           	moveq #0,d0
    5310:	302f 01c6      	move.w 454(sp),d0
    5314:	2f01           	move.l d1,-(sp)
    5316:	2f00           	move.l d0,-(sp)
    5318:	2f2f 01d0      	move.l 464(sp),-(sp)
    531c:	2f2f 0056      	move.l 86(sp),-(sp)
    5320:	4eba 182c      	jsr 6b4e <TestRow>(pc)
    5324:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5328:	722a           	moveq #42,d1
    532a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    532e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {
    5332:	52af 0146      	addq.l #1,326(sp)
    5336:	7007           	moveq #7,d0
    5338:	b0af 0146      	cmp.l 326(sp),d0
    533c:	6c00 ff74      	bge.w 52b2 <TestZoom4Picture+0x15c6>
  for(int i=0;i<9;i++) {
    5340:	52af 014e      	addq.l #1,334(sp)
    5344:	7208           	moveq #8,d1
    5346:	b2af 014e      	cmp.l 334(sp),d1
    534a:	6c00 ff0a      	bge.w 5256 <TestZoom4Picture+0x156a>
    }
  }

  for(int i2=0;i2<10;i2++) {  
    534e:	42af 0142      	clr.l 322(sp)
    5352:	6032           	bra.s 5386 <TestZoom4Picture+0x169a>
    TestRow( valsupposed, valactual, mask, 245+i2);
    5354:	222f 0142      	move.l 322(sp),d1
    5358:	0681 0000 00f5 	addi.l #245,d1
    535e:	7000           	moveq #0,d0
    5360:	302f 01c6      	move.w 454(sp),d0
    5364:	2f01           	move.l d1,-(sp)
    5366:	2f00           	move.l d0,-(sp)
    5368:	2f2f 01d0      	move.l 464(sp),-(sp)
    536c:	2f2f 0056      	move.l 86(sp),-(sp)
    5370:	4eba 17dc      	jsr 6b4e <TestRow>(pc)
    5374:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5378:	702a           	moveq #42,d0
    537a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    537e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {  
    5382:	52af 0142      	addq.l #1,322(sp)
    5386:	7209           	moveq #9,d1
    5388:	b2af 0142      	cmp.l 322(sp),d1
    538c:	6cc6           	bge.s 5354 <TestZoom4Picture+0x1668>
  }
  for(int i=0;i<7;i++) {
    538e:	42af 013e      	clr.l 318(sp)
    5392:	6064           	bra.s 53f8 <TestZoom4Picture+0x170c>
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    5394:	202f 013e      	move.l 318(sp),d0
    5398:	d080           	add.l d0,d0
    539a:	2200           	move.l d0,d1
    539c:	0681 0000 00ff 	addi.l #255,d1
    53a2:	7000           	moveq #0,d0
    53a4:	302f 01c6      	move.w 454(sp),d0
    53a8:	2f01           	move.l d1,-(sp)
    53aa:	2f00           	move.l d0,-(sp)
    53ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    53b0:	2f2f 0056      	move.l 86(sp),-(sp)
    53b4:	4eba 1798      	jsr 6b4e <TestRow>(pc)
    53b8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    53bc:	702a           	moveq #42,d0
    53be:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    53c2:	202f 013e      	move.l 318(sp),d0
    53c6:	0680 0000 0080 	addi.l #128,d0
    53cc:	d080           	add.l d0,d0
    53ce:	2200           	move.l d0,d1
    53d0:	7000           	moveq #0,d0
    53d2:	302f 01c6      	move.w 454(sp),d0
    53d6:	2f01           	move.l d1,-(sp)
    53d8:	2f00           	move.l d0,-(sp)
    53da:	2f2f 01d0      	move.l 464(sp),-(sp)
    53de:	2f2f 0056      	move.l 86(sp),-(sp)
    53e2:	4eba 176a      	jsr 6b4e <TestRow>(pc)
    53e6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    53ea:	722a           	moveq #42,d1
    53ec:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    53f0:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    53f4:	52af 013e      	addq.l #1,318(sp)
    53f8:	7006           	moveq #6,d0
    53fa:	b0af 013e      	cmp.l 318(sp),d0
    53fe:	6c94           	bge.s 5394 <TestZoom4Picture+0x16a8>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5400:	7000           	moveq #0,d0
    5402:	302f 01c6      	move.w 454(sp),d0
    5406:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    540a:	2f00           	move.l d0,-(sp)
    540c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5410:	2f2f 0056      	move.l 86(sp),-(sp)
    5414:	4eba 1738      	jsr 6b4e <TestRow>(pc)
    5418:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    541c:	722a           	moveq #42,d1
    541e:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5422:	466f 01c6      	not.w 454(sp)
 
  tmp = source;
    5426:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    542c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5432:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    5438:	4878 0001      	pea 1 <_start+0x1>
    543c:	4878 0008      	pea 8 <_start+0x8>
    5440:	2f2f 0056      	move.l 86(sp),-(sp)
    5444:	2f2f 006a      	move.l 106(sp),-(sp)
    5448:	4eba c652      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    544c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5450:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    5456:	2c40           	movea.l d0,a6
    5458:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    545c:	202f 004e      	move.l 78(sp),d0
    5460:	5880           	addq.l #4,d0
    5462:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom9;
    5466:	2f7c 0000 bc30 	move.l #48176,74(sp)
    546c:	004a 
  mask = 0x0000;
    546e:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5472:	7000           	moveq #0,d0
    5474:	302f 01c6      	move.w 454(sp),d0
    5478:	42a7           	clr.l -(sp)
    547a:	2f00           	move.l d0,-(sp)
    547c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5480:	2f2f 0056      	move.l 86(sp),-(sp)
    5484:	4eba 16c8      	jsr 6b4e <TestRow>(pc)
    5488:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    548c:	722a           	moveq #42,d1
    548e:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5492:	466f 01c6      	not.w 454(sp)
  
  for(int i=0;i<3;i++) {
    5496:	42af 013a      	clr.l 314(sp)
    549a:	605c           	bra.s 54f8 <TestZoom4Picture+0x180c>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    549c:	202f 013a      	move.l 314(sp),d0
    54a0:	d080           	add.l d0,d0
    54a2:	2200           	move.l d0,d1
    54a4:	5281           	addq.l #1,d1
    54a6:	7000           	moveq #0,d0
    54a8:	302f 01c6      	move.w 454(sp),d0
    54ac:	2f01           	move.l d1,-(sp)
    54ae:	2f00           	move.l d0,-(sp)
    54b0:	2f2f 01d0      	move.l 464(sp),-(sp)
    54b4:	2f2f 0056      	move.l 86(sp),-(sp)
    54b8:	4eba 1694      	jsr 6b4e <TestRow>(pc)
    54bc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    54c0:	702a           	moveq #42,d0
    54c2:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    54c6:	202f 013a      	move.l 314(sp),d0
    54ca:	5280           	addq.l #1,d0
    54cc:	d080           	add.l d0,d0
    54ce:	2200           	move.l d0,d1
    54d0:	7000           	moveq #0,d0
    54d2:	302f 01c6      	move.w 454(sp),d0
    54d6:	2f01           	move.l d1,-(sp)
    54d8:	2f00           	move.l d0,-(sp)
    54da:	2f2f 01d0      	move.l 464(sp),-(sp)
    54de:	2f2f 0056      	move.l 86(sp),-(sp)
    54e2:	4eba 166a      	jsr 6b4e <TestRow>(pc)
    54e6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    54ea:	722a           	moveq #42,d1
    54ec:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    54f0:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    54f4:	52af 013a      	addq.l #1,314(sp)
    54f8:	7002           	moveq #2,d0
    54fa:	b0af 013a      	cmp.l 314(sp),d0
    54fe:	6c9c           	bge.s 549c <TestZoom4Picture+0x17b0>
  }

  for(int i=0;i<9;i++) {
    5500:	42af 0136      	clr.l 310(sp)
    5504:	6000 00ea      	bra.w 55f0 <TestZoom4Picture+0x1904>
    for(int i2=0;i2<9;i2++) {  
    5508:	42af 0132      	clr.l 306(sp)
    550c:	6044           	bra.s 5552 <TestZoom4Picture+0x1866>
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    550e:	307c 000b      	movea.w #11,a0
    5512:	d1ef 0132      	adda.l 306(sp),a0
    5516:	222f 0136      	move.l 310(sp),d1
    551a:	2001           	move.l d1,d0
    551c:	d080           	add.l d0,d0
    551e:	d081           	add.l d1,d0
    5520:	2200           	move.l d0,d1
    5522:	e789           	lsl.l #3,d1
    5524:	d081           	add.l d1,d0
    5526:	2208           	move.l a0,d1
    5528:	d280           	add.l d0,d1
    552a:	7000           	moveq #0,d0
    552c:	302f 01c6      	move.w 454(sp),d0
    5530:	2f01           	move.l d1,-(sp)
    5532:	2f00           	move.l d0,-(sp)
    5534:	2f2f 01d0      	move.l 464(sp),-(sp)
    5538:	2f2f 0056      	move.l 86(sp),-(sp)
    553c:	4eba 1610      	jsr 6b4e <TestRow>(pc)
    5540:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5544:	722a           	moveq #42,d1
    5546:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    554a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {  
    554e:	52af 0132      	addq.l #1,306(sp)
    5552:	7008           	moveq #8,d0
    5554:	b0af 0132      	cmp.l 306(sp),d0
    5558:	6cb4           	bge.s 550e <TestZoom4Picture+0x1822>
    }
    
    for(int i2=0;i2<9;i2++) {
    555a:	42af 012e      	clr.l 302(sp)
    555e:	6000 0082      	bra.w 55e2 <TestZoom4Picture+0x18f6>
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    5562:	222f 0136      	move.l 310(sp),d1
    5566:	2001           	move.l d1,d0
    5568:	d080           	add.l d0,d0
    556a:	d081           	add.l d1,d0
    556c:	2200           	move.l d0,d1
    556e:	e789           	lsl.l #3,d1
    5570:	2040           	movea.l d0,a0
    5572:	d1c1           	adda.l d1,a0
    5574:	41e8 0014      	lea 20(a0),a0
    5578:	2208           	move.l a0,d1
    557a:	d2af 012e      	add.l 302(sp),d1
    557e:	7000           	moveq #0,d0
    5580:	302f 01c6      	move.w 454(sp),d0
    5584:	2f01           	move.l d1,-(sp)
    5586:	2f00           	move.l d0,-(sp)
    5588:	2f2f 01d0      	move.l 464(sp),-(sp)
    558c:	2f2f 0056      	move.l 86(sp),-(sp)
    5590:	4eba 15bc      	jsr 6b4e <TestRow>(pc)
    5594:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5598:	722a           	moveq #42,d1
    559a:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    559e:	222f 0136      	move.l 310(sp),d1
    55a2:	2001           	move.l d1,d0
    55a4:	d080           	add.l d0,d0
    55a6:	d081           	add.l d1,d0
    55a8:	2200           	move.l d0,d1
    55aa:	e789           	lsl.l #3,d1
    55ac:	2040           	movea.l d0,a0
    55ae:	d1c1           	adda.l d1,a0
    55b0:	41e8 0015      	lea 21(a0),a0
    55b4:	2208           	move.l a0,d1
    55b6:	d2af 012e      	add.l 302(sp),d1
    55ba:	7000           	moveq #0,d0
    55bc:	302f 01c6      	move.w 454(sp),d0
    55c0:	2f01           	move.l d1,-(sp)
    55c2:	2f00           	move.l d0,-(sp)
    55c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    55c8:	2f2f 0056      	move.l 86(sp),-(sp)
    55cc:	4eba 1580      	jsr 6b4e <TestRow>(pc)
    55d0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    55d4:	702a           	moveq #42,d0
    55d6:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    55da:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {
    55de:	52af 012e      	addq.l #1,302(sp)
    55e2:	7208           	moveq #8,d1
    55e4:	b2af 012e      	cmp.l 302(sp),d1
    55e8:	6c00 ff78      	bge.w 5562 <TestZoom4Picture+0x1876>
  for(int i=0;i<9;i++) {
    55ec:	52af 0136      	addq.l #1,310(sp)
    55f0:	7008           	moveq #8,d0
    55f2:	b0af 0136      	cmp.l 310(sp),d0
    55f6:	6c00 ff10      	bge.w 5508 <TestZoom4Picture+0x181c>
    }
  }

  for(int i2=0;i2<9;i2++) {  
    55fa:	42af 012a      	clr.l 298(sp)
    55fe:	6032           	bra.s 5632 <TestZoom4Picture+0x1946>
    TestRow( valsupposed, valactual, mask, 245+i2);
    5600:	222f 012a      	move.l 298(sp),d1
    5604:	0681 0000 00f5 	addi.l #245,d1
    560a:	7000           	moveq #0,d0
    560c:	302f 01c6      	move.w 454(sp),d0
    5610:	2f01           	move.l d1,-(sp)
    5612:	2f00           	move.l d0,-(sp)
    5614:	2f2f 01d0      	move.l 464(sp),-(sp)
    5618:	2f2f 0056      	move.l 86(sp),-(sp)
    561c:	4eba 1530      	jsr 6b4e <TestRow>(pc)
    5620:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5624:	722a           	moveq #42,d1
    5626:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    562a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {  
    562e:	52af 012a      	addq.l #1,298(sp)
    5632:	7008           	moveq #8,d0
    5634:	b0af 012a      	cmp.l 298(sp),d0
    5638:	6cc6           	bge.s 5600 <TestZoom4Picture+0x1914>
  }
  for(int i=0;i<5;i++) {
    563a:	42af 0126      	clr.l 294(sp)
    563e:	6064           	bra.s 56a4 <TestZoom4Picture+0x19b8>
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    5640:	202f 0126      	move.l 294(sp),d0
    5644:	d080           	add.l d0,d0
    5646:	2200           	move.l d0,d1
    5648:	0681 0000 0103 	addi.l #259,d1
    564e:	7000           	moveq #0,d0
    5650:	302f 01c6      	move.w 454(sp),d0
    5654:	2f01           	move.l d1,-(sp)
    5656:	2f00           	move.l d0,-(sp)
    5658:	2f2f 01d0      	move.l 464(sp),-(sp)
    565c:	2f2f 0056      	move.l 86(sp),-(sp)
    5660:	4eba 14ec      	jsr 6b4e <TestRow>(pc)
    5664:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5668:	722a           	moveq #42,d1
    566a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    566e:	202f 0126      	move.l 294(sp),d0
    5672:	0680 0000 0082 	addi.l #130,d0
    5678:	d080           	add.l d0,d0
    567a:	2200           	move.l d0,d1
    567c:	7000           	moveq #0,d0
    567e:	302f 01c6      	move.w 454(sp),d0
    5682:	2f01           	move.l d1,-(sp)
    5684:	2f00           	move.l d0,-(sp)
    5686:	2f2f 01d0      	move.l 464(sp),-(sp)
    568a:	2f2f 0056      	move.l 86(sp),-(sp)
    568e:	4eba 14be      	jsr 6b4e <TestRow>(pc)
    5692:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5696:	702a           	moveq #42,d0
    5698:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    569c:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    56a0:	52af 0126      	addq.l #1,294(sp)
    56a4:	7204           	moveq #4,d1
    56a6:	b2af 0126      	cmp.l 294(sp),d1
    56aa:	6c94           	bge.s 5640 <TestZoom4Picture+0x1954>
  }
  TestRow( valsupposed, valactual, mask, 269);
    56ac:	7000           	moveq #0,d0
    56ae:	302f 01c6      	move.w 454(sp),d0
    56b2:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    56b6:	2f00           	move.l d0,-(sp)
    56b8:	2f2f 01d0      	move.l 464(sp),-(sp)
    56bc:	2f2f 0056      	move.l 86(sp),-(sp)
    56c0:	4eba 148c      	jsr 6b4e <TestRow>(pc)
    56c4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    56c8:	702a           	moveq #42,d0
    56ca:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    56ce:	466f 01c6      	not.w 454(sp)

  tmp = source;
    56d2:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    56d8:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    56de:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    56e4:	4878 0001      	pea 1 <_start+0x1>
    56e8:	4878 0009      	pea 9 <_start+0x9>
    56ec:	2f2f 0056      	move.l 86(sp),-(sp)
    56f0:	2f2f 006a      	move.l 106(sp),-(sp)
    56f4:	4eba c3a6      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    56f8:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    56fc:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    5702:	2c40           	movea.l d0,a6
    5704:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5708:	222f 004e      	move.l 78(sp),d1
    570c:	5881           	addq.l #4,d1
    570e:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom10;
    5712:	2f7c 0000 bc5c 	move.l #48220,74(sp)
    5718:	004a 

  mask = 0xffff;
    571a:	3f7c ffff 01c6 	move.w #-1,454(sp)
  TestRow( valsupposed, valactual, mask, 0);
    5720:	7000           	moveq #0,d0
    5722:	302f 01c6      	move.w 454(sp),d0
    5726:	42a7           	clr.l -(sp)
    5728:	2f00           	move.l d0,-(sp)
    572a:	2f2f 01d0      	move.l 464(sp),-(sp)
    572e:	2f2f 0056      	move.l 86(sp),-(sp)
    5732:	4eba 141a      	jsr 6b4e <TestRow>(pc)
    5736:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    573a:	702a           	moveq #42,d0
    573c:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5740:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 1);   
    5744:	7000           	moveq #0,d0
    5746:	302f 01c6      	move.w 454(sp),d0
    574a:	4878 0001      	pea 1 <_start+0x1>
    574e:	2f00           	move.l d0,-(sp)
    5750:	2f2f 01d0      	move.l 464(sp),-(sp)
    5754:	2f2f 0056      	move.l 86(sp),-(sp)
    5758:	4eba 13f4      	jsr 6b4e <TestRow>(pc)
    575c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5760:	722a           	moveq #42,d1
    5762:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 2);
    5766:	7000           	moveq #0,d0
    5768:	302f 01c6      	move.w 454(sp),d0
    576c:	4878 0002      	pea 2 <_start+0x2>
    5770:	2f00           	move.l d0,-(sp)
    5772:	2f2f 01d0      	move.l 464(sp),-(sp)
    5776:	2f2f 0056      	move.l 86(sp),-(sp)
    577a:	4eba 13d2      	jsr 6b4e <TestRow>(pc)
    577e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5782:	702a           	moveq #42,d0
    5784:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5788:	466f 01c6      	not.w 454(sp)

  for(int i=0;i<9;i++) {
    578c:	42af 0122      	clr.l 290(sp)
    5790:	6000 00e0      	bra.w 5872 <TestZoom4Picture+0x1b86>
    for(int i2=0;i2<8;i2++) {  
    5794:	42af 011e      	clr.l 286(sp)
    5798:	6040           	bra.s 57da <TestZoom4Picture+0x1aee>
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    579a:	206f 011e      	movea.l 286(sp),a0
    579e:	5688           	addq.l #3,a0
    57a0:	222f 0122      	move.l 290(sp),d1
    57a4:	2001           	move.l d1,d0
    57a6:	e788           	lsl.l #3,d0
    57a8:	9081           	sub.l d1,d0
    57aa:	d080           	add.l d0,d0
    57ac:	d080           	add.l d0,d0
    57ae:	2208           	move.l a0,d1
    57b0:	d280           	add.l d0,d1
    57b2:	7000           	moveq #0,d0
    57b4:	302f 01c6      	move.w 454(sp),d0
    57b8:	2f01           	move.l d1,-(sp)
    57ba:	2f00           	move.l d0,-(sp)
    57bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    57c0:	2f2f 0056      	move.l 86(sp),-(sp)
    57c4:	4eba 1388      	jsr 6b4e <TestRow>(pc)
    57c8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    57cc:	722a           	moveq #42,d1
    57ce:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    57d2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {  
    57d6:	52af 011e      	addq.l #1,286(sp)
    57da:	7007           	moveq #7,d0
    57dc:	b0af 011e      	cmp.l 286(sp),d0
    57e0:	6cb8           	bge.s 579a <TestZoom4Picture+0x1aae>
    }
    
    for(int i2=0;i2<10;i2++) {
    57e2:	42af 011a      	clr.l 282(sp)
    57e6:	607c           	bra.s 5864 <TestZoom4Picture+0x1b78>
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    57e8:	222f 0122      	move.l 290(sp),d1
    57ec:	2001           	move.l d1,d0
    57ee:	e788           	lsl.l #3,d0
    57f0:	9081           	sub.l d1,d0
    57f2:	d080           	add.l d0,d0
    57f4:	d080           	add.l d0,d0
    57f6:	2040           	movea.l d0,a0
    57f8:	41e8 000b      	lea 11(a0),a0
    57fc:	2208           	move.l a0,d1
    57fe:	d2af 011a      	add.l 282(sp),d1
    5802:	7000           	moveq #0,d0
    5804:	302f 01c6      	move.w 454(sp),d0
    5808:	2f01           	move.l d1,-(sp)
    580a:	2f00           	move.l d0,-(sp)
    580c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5810:	2f2f 0056      	move.l 86(sp),-(sp)
    5814:	4eba 1338      	jsr 6b4e <TestRow>(pc)
    5818:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    581c:	722a           	moveq #42,d1
    581e:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    5822:	222f 0122      	move.l 290(sp),d1
    5826:	2001           	move.l d1,d0
    5828:	e788           	lsl.l #3,d0
    582a:	9081           	sub.l d1,d0
    582c:	d080           	add.l d0,d0
    582e:	d080           	add.l d0,d0
    5830:	2040           	movea.l d0,a0
    5832:	41e8 000b      	lea 11(a0),a0
    5836:	2208           	move.l a0,d1
    5838:	d2af 011a      	add.l 282(sp),d1
    583c:	7000           	moveq #0,d0
    583e:	302f 01c6      	move.w 454(sp),d0
    5842:	2f01           	move.l d1,-(sp)
    5844:	2f00           	move.l d0,-(sp)
    5846:	2f2f 01d0      	move.l 464(sp),-(sp)
    584a:	2f2f 0056      	move.l 86(sp),-(sp)
    584e:	4eba 12fe      	jsr 6b4e <TestRow>(pc)
    5852:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5856:	702a           	moveq #42,d0
    5858:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    585c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {
    5860:	52af 011a      	addq.l #1,282(sp)
    5864:	7209           	moveq #9,d1
    5866:	b2af 011a      	cmp.l 282(sp),d1
    586a:	6c00 ff7c      	bge.w 57e8 <TestZoom4Picture+0x1afc>
  for(int i=0;i<9;i++) {
    586e:	52af 0122      	addq.l #1,290(sp)
    5872:	7008           	moveq #8,d0
    5874:	b0af 0122      	cmp.l 290(sp),d0
    5878:	6c00 ff1a      	bge.w 5794 <TestZoom4Picture+0x1aa8>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    587c:	42af 0116      	clr.l 278(sp)
    5880:	6032           	bra.s 58b4 <TestZoom4Picture+0x1bc8>
    TestRow( valsupposed, valactual, mask, 255+i2);
    5882:	222f 0116      	move.l 278(sp),d1
    5886:	0681 0000 00ff 	addi.l #255,d1
    588c:	7000           	moveq #0,d0
    588e:	302f 01c6      	move.w 454(sp),d0
    5892:	2f01           	move.l d1,-(sp)
    5894:	2f00           	move.l d0,-(sp)
    5896:	2f2f 01d0      	move.l 464(sp),-(sp)
    589a:	2f2f 0056      	move.l 86(sp),-(sp)
    589e:	4eba 12ae      	jsr 6b4e <TestRow>(pc)
    58a2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    58a6:	722a           	moveq #42,d1
    58a8:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    58ac:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    58b0:	52af 0116      	addq.l #1,278(sp)
    58b4:	7007           	moveq #7,d0
    58b6:	b0af 0116      	cmp.l 278(sp),d0
    58ba:	6cc6           	bge.s 5882 <TestZoom4Picture+0x1b96>
  }
  for(int i=0;i<3;i++) {
    58bc:	42af 0112      	clr.l 274(sp)
    58c0:	6064           	bra.s 5926 <TestZoom4Picture+0x1c3a>
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    58c2:	202f 0112      	move.l 274(sp),d0
    58c6:	d080           	add.l d0,d0
    58c8:	2200           	move.l d0,d1
    58ca:	0681 0000 0107 	addi.l #263,d1
    58d0:	7000           	moveq #0,d0
    58d2:	302f 01c6      	move.w 454(sp),d0
    58d6:	2f01           	move.l d1,-(sp)
    58d8:	2f00           	move.l d0,-(sp)
    58da:	2f2f 01d0      	move.l 464(sp),-(sp)
    58de:	2f2f 0056      	move.l 86(sp),-(sp)
    58e2:	4eba 126a      	jsr 6b4e <TestRow>(pc)
    58e6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    58ea:	722a           	moveq #42,d1
    58ec:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    58f0:	202f 0112      	move.l 274(sp),d0
    58f4:	0680 0000 0084 	addi.l #132,d0
    58fa:	d080           	add.l d0,d0
    58fc:	2200           	move.l d0,d1
    58fe:	7000           	moveq #0,d0
    5900:	302f 01c6      	move.w 454(sp),d0
    5904:	2f01           	move.l d1,-(sp)
    5906:	2f00           	move.l d0,-(sp)
    5908:	2f2f 01d0      	move.l 464(sp),-(sp)
    590c:	2f2f 0056      	move.l 86(sp),-(sp)
    5910:	4eba 123c      	jsr 6b4e <TestRow>(pc)
    5914:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5918:	702a           	moveq #42,d0
    591a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    591e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    5922:	52af 0112      	addq.l #1,274(sp)
    5926:	7202           	moveq #2,d1
    5928:	b2af 0112      	cmp.l 274(sp),d1
    592c:	6c94           	bge.s 58c2 <TestZoom4Picture+0x1bd6>
  }

  tmp = source;
    592e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5934:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    593a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    5940:	4878 0001      	pea 1 <_start+0x1>
    5944:	4878 000a      	pea a <_start+0xa>
    5948:	2f2f 0056      	move.l 86(sp),-(sp)
    594c:	2f2f 006a      	move.l 106(sp),-(sp)
    5950:	4eba c14a      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    5954:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5958:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    595e:	2c40           	movea.l d0,a6
    5960:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5964:	202f 004e      	move.l 78(sp),d0
    5968:	5880           	addq.l #4,d0
    596a:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom11;
    596e:	2f7c 0000 bc88 	move.l #48264,74(sp)
    5974:	004a 

  mask = 0xffff;
    5976:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  for(int i2=0;i2<6;i2++) {  
    597c:	42af 010e      	clr.l 270(sp)
    5980:	602a           	bra.s 59ac <TestZoom4Picture+0x1cc0>
    TestRow( valsupposed, valactual, mask, i2);
    5982:	7000           	moveq #0,d0
    5984:	302f 01c6      	move.w 454(sp),d0
    5988:	2f2f 010e      	move.l 270(sp),-(sp)
    598c:	2f00           	move.l d0,-(sp)
    598e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5992:	2f2f 0056      	move.l 86(sp),-(sp)
    5996:	4eba 11b6      	jsr 6b4e <TestRow>(pc)
    599a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    599e:	722a           	moveq #42,d1
    59a0:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    59a4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {  
    59a8:	52af 010e      	addq.l #1,270(sp)
    59ac:	7005           	moveq #5,d0
    59ae:	b0af 010e      	cmp.l 270(sp),d0
    59b2:	6cce           	bge.s 5982 <TestZoom4Picture+0x1c96>
  }

  for(int i2=0;i2<11;i2++) {
    59b4:	42af 010a      	clr.l 266(sp)
    59b8:	605c           	bra.s 5a16 <TestZoom4Picture+0x1d2a>
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    59ba:	202f 010a      	move.l 266(sp),d0
    59be:	5680           	addq.l #3,d0
    59c0:	d080           	add.l d0,d0
    59c2:	2200           	move.l d0,d1
    59c4:	7000           	moveq #0,d0
    59c6:	302f 01c6      	move.w 454(sp),d0
    59ca:	2f01           	move.l d1,-(sp)
    59cc:	2f00           	move.l d0,-(sp)
    59ce:	2f2f 01d0      	move.l 464(sp),-(sp)
    59d2:	2f2f 0056      	move.l 86(sp),-(sp)
    59d6:	4eba 1176      	jsr 6b4e <TestRow>(pc)
    59da:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    59de:	722a           	moveq #42,d1
    59e0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    59e4:	202f 010a      	move.l 266(sp),d0
    59e8:	d080           	add.l d0,d0
    59ea:	2200           	move.l d0,d1
    59ec:	5e81           	addq.l #7,d1
    59ee:	7000           	moveq #0,d0
    59f0:	302f 01c6      	move.w 454(sp),d0
    59f4:	2f01           	move.l d1,-(sp)
    59f6:	2f00           	move.l d0,-(sp)
    59f8:	2f2f 01d0      	move.l 464(sp),-(sp)
    59fc:	2f2f 0056      	move.l 86(sp),-(sp)
    5a00:	4eba 114c      	jsr 6b4e <TestRow>(pc)
    5a04:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a08:	702a           	moveq #42,d0
    5a0a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5a0e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5a12:	52af 010a      	addq.l #1,266(sp)
    5a16:	720a           	moveq #10,d1
    5a18:	b2af 010a      	cmp.l 266(sp),d1
    5a1c:	6c9c           	bge.s 59ba <TestZoom4Picture+0x1cce>
  }

  for(int i=0;i<8;i++) {
    5a1e:	42af 0106      	clr.l 262(sp)
    5a22:	6000 00f2      	bra.w 5b16 <TestZoom4Picture+0x1e2a>
    for(int i2=0;i2<7;i2++) {  
    5a26:	42af 0102      	clr.l 258(sp)
    5a2a:	6044           	bra.s 5a70 <TestZoom4Picture+0x1d84>
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    5a2c:	307c 001c      	movea.w #28,a0
    5a30:	d1ef 0102      	adda.l 258(sp),a0
    5a34:	222f 0106      	move.l 262(sp),d1
    5a38:	2001           	move.l d1,d0
    5a3a:	e788           	lsl.l #3,d0
    5a3c:	9081           	sub.l d1,d0
    5a3e:	d080           	add.l d0,d0
    5a40:	d080           	add.l d0,d0
    5a42:	d081           	add.l d1,d0
    5a44:	2208           	move.l a0,d1
    5a46:	d280           	add.l d0,d1
    5a48:	7000           	moveq #0,d0
    5a4a:	302f 01c6      	move.w 454(sp),d0
    5a4e:	2f01           	move.l d1,-(sp)
    5a50:	2f00           	move.l d0,-(sp)
    5a52:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a56:	2f2f 0056      	move.l 86(sp),-(sp)
    5a5a:	4eba 10f2      	jsr 6b4e <TestRow>(pc)
    5a5e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a62:	702a           	moveq #42,d0
    5a64:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5a68:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<7;i2++) {  
    5a6c:	52af 0102      	addq.l #1,258(sp)
    5a70:	7206           	moveq #6,d1
    5a72:	b2af 0102      	cmp.l 258(sp),d1
    5a76:	6cb4           	bge.s 5a2c <TestZoom4Picture+0x1d40>
    }
    
    for(int i2=0;i2<11;i2++) {
    5a78:	42af 00fe      	clr.l 254(sp)
    5a7c:	6000 008a      	bra.w 5b08 <TestZoom4Picture+0x1e1c>
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    5a80:	222f 0106      	move.l 262(sp),d1
    5a84:	2001           	move.l d1,d0
    5a86:	e788           	lsl.l #3,d0
    5a88:	9081           	sub.l d1,d0
    5a8a:	d080           	add.l d0,d0
    5a8c:	d080           	add.l d0,d0
    5a8e:	2040           	movea.l d0,a0
    5a90:	d1c1           	adda.l d1,a0
    5a92:	41e8 0023      	lea 35(a0),a0
    5a96:	202f 00fe      	move.l 254(sp),d0
    5a9a:	d080           	add.l d0,d0
    5a9c:	2208           	move.l a0,d1
    5a9e:	d280           	add.l d0,d1
    5aa0:	7000           	moveq #0,d0
    5aa2:	302f 01c6      	move.w 454(sp),d0
    5aa6:	2f01           	move.l d1,-(sp)
    5aa8:	2f00           	move.l d0,-(sp)
    5aaa:	2f2f 01d0      	move.l 464(sp),-(sp)
    5aae:	2f2f 0056      	move.l 86(sp),-(sp)
    5ab2:	4eba 109a      	jsr 6b4e <TestRow>(pc)
    5ab6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5aba:	702a           	moveq #42,d0
    5abc:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    5ac0:	222f 0106      	move.l 262(sp),d1
    5ac4:	2001           	move.l d1,d0
    5ac6:	e788           	lsl.l #3,d0
    5ac8:	9081           	sub.l d1,d0
    5aca:	d080           	add.l d0,d0
    5acc:	d080           	add.l d0,d0
    5ace:	2040           	movea.l d0,a0
    5ad0:	d1c1           	adda.l d1,a0
    5ad2:	41e8 000b      	lea 11(a0),a0
    5ad6:	202f 00fe      	move.l 254(sp),d0
    5ada:	d080           	add.l d0,d0
    5adc:	2208           	move.l a0,d1
    5ade:	d280           	add.l d0,d1
    5ae0:	7000           	moveq #0,d0
    5ae2:	302f 01c6      	move.w 454(sp),d0
    5ae6:	2f01           	move.l d1,-(sp)
    5ae8:	2f00           	move.l d0,-(sp)
    5aea:	2f2f 01d0      	move.l 464(sp),-(sp)
    5aee:	2f2f 0056      	move.l 86(sp),-(sp)
    5af2:	4eba 105a      	jsr 6b4e <TestRow>(pc)
    5af6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5afa:	722a           	moveq #42,d1
    5afc:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5b00:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {
    5b04:	52af 00fe      	addq.l #1,254(sp)
    5b08:	700a           	moveq #10,d0
    5b0a:	b0af 00fe      	cmp.l 254(sp),d0
    5b0e:	6c00 ff70      	bge.w 5a80 <TestZoom4Picture+0x1d94>
  for(int i=0;i<8;i++) {
    5b12:	52af 0106      	addq.l #1,262(sp)
    5b16:	7207           	moveq #7,d1
    5b18:	b2af 0106      	cmp.l 262(sp),d1
    5b1c:	6c00 ff08      	bge.w 5a26 <TestZoom4Picture+0x1d3a>
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    5b20:	42af 00fa      	clr.l 250(sp)
    5b24:	6032           	bra.s 5b58 <TestZoom4Picture+0x1e6c>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5b26:	222f 00fa      	move.l 250(sp),d1
    5b2a:	0681 0000 0104 	addi.l #260,d1
    5b30:	7000           	moveq #0,d0
    5b32:	302f 01c6      	move.w 454(sp),d0
    5b36:	2f01           	move.l d1,-(sp)
    5b38:	2f00           	move.l d0,-(sp)
    5b3a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b3e:	2f2f 0056      	move.l 86(sp),-(sp)
    5b42:	4eba 100a      	jsr 6b4e <TestRow>(pc)
    5b46:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5b4a:	702a           	moveq #42,d0
    5b4c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5b50:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    5b54:	52af 00fa      	addq.l #1,250(sp)
    5b58:	7206           	moveq #6,d1
    5b5a:	b2af 00fa      	cmp.l 250(sp),d1
    5b5e:	6cc6           	bge.s 5b26 <TestZoom4Picture+0x1e3a>
  }
  TestRow( valsupposed, valactual, mask, 267);   
    5b60:	7000           	moveq #0,d0
    5b62:	302f 01c6      	move.w 454(sp),d0
    5b66:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    5b6a:	2f00           	move.l d0,-(sp)
    5b6c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b70:	2f2f 0056      	move.l 86(sp),-(sp)
    5b74:	4eba 0fd8      	jsr 6b4e <TestRow>(pc)
    5b78:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b7c:	702a           	moveq #42,d0
    5b7e:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 268);
    5b82:	7000           	moveq #0,d0
    5b84:	302f 01c6      	move.w 454(sp),d0
    5b88:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    5b8c:	2f00           	move.l d0,-(sp)
    5b8e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b92:	2f2f 0056      	move.l 86(sp),-(sp)
    5b96:	4eba 0fb6      	jsr 6b4e <TestRow>(pc)
    5b9a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b9e:	722a           	moveq #42,d1
    5ba0:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5ba4:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 269);
    5ba8:	7000           	moveq #0,d0
    5baa:	302f 01c6      	move.w 454(sp),d0
    5bae:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5bb2:	2f00           	move.l d0,-(sp)
    5bb4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bb8:	2f2f 0056      	move.l 86(sp),-(sp)
    5bbc:	4eba 0f90      	jsr 6b4e <TestRow>(pc)
    5bc0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5bc4:	702a           	moveq #42,d0
    5bc6:	d1af 01c8      	add.l d0,456(sp)
  
  tmp = source;
    5bca:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5bd0:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5bd6:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    5bdc:	4878 0001      	pea 1 <_start+0x1>
    5be0:	4878 000b      	pea b <_start+0xb>
    5be4:	2f2f 0056      	move.l 86(sp),-(sp)
    5be8:	2f2f 006a      	move.l 106(sp),-(sp)
    5bec:	4eba beae      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    5bf0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5bf4:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    5bfa:	2c40           	movea.l d0,a6
    5bfc:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5c00:	222f 004e      	move.l 78(sp),d1
    5c04:	5881           	addq.l #4,d1
    5c06:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom12;
    5c0a:	2f7c 0000 bcb4 	move.l #48308,74(sp)
    5c10:	004a 

  mask = 0x0;
    5c12:	426f 01c6      	clr.w 454(sp)
   
  TestRow( valsupposed, valactual, mask, 0);
    5c16:	7000           	moveq #0,d0
    5c18:	302f 01c6      	move.w 454(sp),d0
    5c1c:	42a7           	clr.l -(sp)
    5c1e:	2f00           	move.l d0,-(sp)
    5c20:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c24:	2f2f 0056      	move.l 86(sp),-(sp)
    5c28:	4eba 0f24      	jsr 6b4e <TestRow>(pc)
    5c2c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5c30:	702a           	moveq #42,d0
    5c32:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5c36:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<12;i2++) {
    5c3a:	42af 00f6      	clr.l 246(sp)
    5c3e:	605c           	bra.s 5c9c <TestZoom4Picture+0x1fb0>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5c40:	202f 00f6      	move.l 246(sp),d0
    5c44:	d080           	add.l d0,d0
    5c46:	2200           	move.l d0,d1
    5c48:	5281           	addq.l #1,d1
    5c4a:	7000           	moveq #0,d0
    5c4c:	302f 01c6      	move.w 454(sp),d0
    5c50:	2f01           	move.l d1,-(sp)
    5c52:	2f00           	move.l d0,-(sp)
    5c54:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c58:	2f2f 0056      	move.l 86(sp),-(sp)
    5c5c:	4eba 0ef0      	jsr 6b4e <TestRow>(pc)
    5c60:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5c64:	722a           	moveq #42,d1
    5c66:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5c6a:	202f 00f6      	move.l 246(sp),d0
    5c6e:	5280           	addq.l #1,d0
    5c70:	d080           	add.l d0,d0
    5c72:	2200           	move.l d0,d1
    5c74:	7000           	moveq #0,d0
    5c76:	302f 01c6      	move.w 454(sp),d0
    5c7a:	2f01           	move.l d1,-(sp)
    5c7c:	2f00           	move.l d0,-(sp)
    5c7e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c82:	2f2f 0056      	move.l 86(sp),-(sp)
    5c86:	4eba 0ec6      	jsr 6b4e <TestRow>(pc)
    5c8a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5c8e:	702a           	moveq #42,d0
    5c90:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5c94:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    5c98:	52af 00f6      	addq.l #1,246(sp)
    5c9c:	720b           	moveq #11,d1
    5c9e:	b2af 00f6      	cmp.l 246(sp),d1
    5ca2:	6c9c           	bge.s 5c40 <TestZoom4Picture+0x1f54>
  } 

  for(int i=0;i<8;i++) {
    5ca4:	42af 00f2      	clr.l 242(sp)
    5ca8:	6000 00e6      	bra.w 5d90 <TestZoom4Picture+0x20a4>
    for(int i2=0;i2<6;i2++) {  
    5cac:	42af 00ee      	clr.l 238(sp)
    5cb0:	6040           	bra.s 5cf2 <TestZoom4Picture+0x2006>
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    5cb2:	307c 0019      	movea.w #25,a0
    5cb6:	d1ef 00ee      	adda.l 238(sp),a0
    5cba:	222f 00f2      	move.l 242(sp),d1
    5cbe:	2001           	move.l d1,d0
    5cc0:	e988           	lsl.l #4,d0
    5cc2:	9081           	sub.l d1,d0
    5cc4:	d080           	add.l d0,d0
    5cc6:	2208           	move.l a0,d1
    5cc8:	d280           	add.l d0,d1
    5cca:	7000           	moveq #0,d0
    5ccc:	302f 01c6      	move.w 454(sp),d0
    5cd0:	2f01           	move.l d1,-(sp)
    5cd2:	2f00           	move.l d0,-(sp)
    5cd4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5cd8:	2f2f 0056      	move.l 86(sp),-(sp)
    5cdc:	4eba 0e70      	jsr 6b4e <TestRow>(pc)
    5ce0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5ce4:	702a           	moveq #42,d0
    5ce6:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5cea:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<6;i2++) {  
    5cee:	52af 00ee      	addq.l #1,238(sp)
    5cf2:	7205           	moveq #5,d1
    5cf4:	b2af 00ee      	cmp.l 238(sp),d1
    5cf8:	6cb8           	bge.s 5cb2 <TestZoom4Picture+0x1fc6>
    }
    
    for(int i2=0;i2<12;i2++) {
    5cfa:	42af 00ea      	clr.l 234(sp)
    5cfe:	6000 0082      	bra.w 5d82 <TestZoom4Picture+0x2096>
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    5d02:	222f 00f2      	move.l 242(sp),d1
    5d06:	2001           	move.l d1,d0
    5d08:	e988           	lsl.l #4,d0
    5d0a:	9081           	sub.l d1,d0
    5d0c:	d080           	add.l d0,d0
    5d0e:	2040           	movea.l d0,a0
    5d10:	41e8 001f      	lea 31(a0),a0
    5d14:	202f 00ea      	move.l 234(sp),d0
    5d18:	d080           	add.l d0,d0
    5d1a:	2208           	move.l a0,d1
    5d1c:	d280           	add.l d0,d1
    5d1e:	7000           	moveq #0,d0
    5d20:	302f 01c6      	move.w 454(sp),d0
    5d24:	2f01           	move.l d1,-(sp)
    5d26:	2f00           	move.l d0,-(sp)
    5d28:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d2c:	2f2f 0056      	move.l 86(sp),-(sp)
    5d30:	4eba 0e1c      	jsr 6b4e <TestRow>(pc)
    5d34:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5d38:	702a           	moveq #42,d0
    5d3a:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    5d3e:	222f 00f2      	move.l 242(sp),d1
    5d42:	2001           	move.l d1,d0
    5d44:	e988           	lsl.l #4,d0
    5d46:	9081           	sub.l d1,d0
    5d48:	d080           	add.l d0,d0
    5d4a:	2040           	movea.l d0,a0
    5d4c:	41e8 0020      	lea 32(a0),a0
    5d50:	202f 00ea      	move.l 234(sp),d0
    5d54:	d080           	add.l d0,d0
    5d56:	2208           	move.l a0,d1
    5d58:	d280           	add.l d0,d1
    5d5a:	7000           	moveq #0,d0
    5d5c:	302f 01c6      	move.w 454(sp),d0
    5d60:	2f01           	move.l d1,-(sp)
    5d62:	2f00           	move.l d0,-(sp)
    5d64:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d68:	2f2f 0056      	move.l 86(sp),-(sp)
    5d6c:	4eba 0de0      	jsr 6b4e <TestRow>(pc)
    5d70:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5d74:	722a           	moveq #42,d1
    5d76:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5d7a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {
    5d7e:	52af 00ea      	addq.l #1,234(sp)
    5d82:	700b           	moveq #11,d0
    5d84:	b0af 00ea      	cmp.l 234(sp),d0
    5d88:	6c00 ff78      	bge.w 5d02 <TestZoom4Picture+0x2016>
  for(int i=0;i<8;i++) {
    5d8c:	52af 00f2      	addq.l #1,242(sp)
    5d90:	7207           	moveq #7,d1
    5d92:	b2af 00f2      	cmp.l 242(sp),d1
    5d96:	6c00 ff14      	bge.w 5cac <TestZoom4Picture+0x1fc0>
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    5d9a:	42af 00e6      	clr.l 230(sp)
    5d9e:	6032           	bra.s 5dd2 <TestZoom4Picture+0x20e6>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5da0:	222f 00e6      	move.l 230(sp),d1
    5da4:	0681 0000 0104 	addi.l #260,d1
    5daa:	7000           	moveq #0,d0
    5dac:	302f 01c6      	move.w 454(sp),d0
    5db0:	2f01           	move.l d1,-(sp)
    5db2:	2f00           	move.l d0,-(sp)
    5db4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5db8:	2f2f 0056      	move.l 86(sp),-(sp)
    5dbc:	4eba 0d90      	jsr 6b4e <TestRow>(pc)
    5dc0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5dc4:	702a           	moveq #42,d0
    5dc6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5dca:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5dce:	52af 00e6      	addq.l #1,230(sp)
    5dd2:	7204           	moveq #4,d1
    5dd4:	b2af 00e6      	cmp.l 230(sp),d1
    5dd8:	6cc6           	bge.s 5da0 <TestZoom4Picture+0x20b4>
  }

  tmp = source;
    5dda:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5de0:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5de6:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    5dec:	4878 0001      	pea 1 <_start+0x1>
    5df0:	4878 000c      	pea c <_start+0xc>
    5df4:	2f2f 0056      	move.l 86(sp),-(sp)
    5df8:	2f2f 006a      	move.l 106(sp),-(sp)
    5dfc:	4eba bc9e      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    5e00:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5e04:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    5e0a:	2c40           	movea.l d0,a6
    5e0c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5e10:	202f 004e      	move.l 78(sp),d0
    5e14:	5880           	addq.l #4,d0
    5e16:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom13;
    5e1a:	2f7c 0000 bce0 	move.l #48352,74(sp)
    5e20:	004a 

  mask = 0xffff;
    5e22:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<11;i2++) {
    5e28:	42af 00e2      	clr.l 226(sp)
    5e2c:	605a           	bra.s 5e88 <TestZoom4Picture+0x219c>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    5e2e:	202f 00e2      	move.l 226(sp),d0
    5e32:	d080           	add.l d0,d0
    5e34:	2200           	move.l d0,d1
    5e36:	7000           	moveq #0,d0
    5e38:	302f 01c6      	move.w 454(sp),d0
    5e3c:	2f01           	move.l d1,-(sp)
    5e3e:	2f00           	move.l d0,-(sp)
    5e40:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e44:	2f2f 0056      	move.l 86(sp),-(sp)
    5e48:	4eba 0d04      	jsr 6b4e <TestRow>(pc)
    5e4c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5e50:	722a           	moveq #42,d1
    5e52:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    5e56:	202f 00e2      	move.l 226(sp),d0
    5e5a:	d080           	add.l d0,d0
    5e5c:	2200           	move.l d0,d1
    5e5e:	5281           	addq.l #1,d1
    5e60:	7000           	moveq #0,d0
    5e62:	302f 01c6      	move.w 454(sp),d0
    5e66:	2f01           	move.l d1,-(sp)
    5e68:	2f00           	move.l d0,-(sp)
    5e6a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e6e:	2f2f 0056      	move.l 86(sp),-(sp)
    5e72:	4eba 0cda      	jsr 6b4e <TestRow>(pc)
    5e76:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5e7a:	702a           	moveq #42,d0
    5e7c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5e80:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5e84:	52af 00e2      	addq.l #1,226(sp)
    5e88:	720a           	moveq #10,d1
    5e8a:	b2af 00e2      	cmp.l 226(sp),d1
    5e8e:	6c9e           	bge.s 5e2e <TestZoom4Picture+0x2142>
  } 

  for(int i=0;i<8;i++) {
    5e90:	42af 00de      	clr.l 222(sp)
    5e94:	6000 00de      	bra.w 5f74 <TestZoom4Picture+0x2288>
    for(int i2=0;i2<5;i2++) {  
    5e98:	42af 00da      	clr.l 218(sp)
    5e9c:	603e           	bra.s 5edc <TestZoom4Picture+0x21f0>
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    5e9e:	307c 0016      	movea.w #22,a0
    5ea2:	d1ef 00da      	adda.l 218(sp),a0
    5ea6:	222f 00de      	move.l 222(sp),d1
    5eaa:	2001           	move.l d1,d0
    5eac:	eb88           	lsl.l #5,d0
    5eae:	9081           	sub.l d1,d0
    5eb0:	2208           	move.l a0,d1
    5eb2:	d280           	add.l d0,d1
    5eb4:	7000           	moveq #0,d0
    5eb6:	302f 01c6      	move.w 454(sp),d0
    5eba:	2f01           	move.l d1,-(sp)
    5ebc:	2f00           	move.l d0,-(sp)
    5ebe:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ec2:	2f2f 0056      	move.l 86(sp),-(sp)
    5ec6:	4eba 0c86      	jsr 6b4e <TestRow>(pc)
    5eca:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5ece:	702a           	moveq #42,d0
    5ed0:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5ed4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<5;i2++) {  
    5ed8:	52af 00da      	addq.l #1,218(sp)
    5edc:	7204           	moveq #4,d1
    5ede:	b2af 00da      	cmp.l 218(sp),d1
    5ee2:	6cba           	bge.s 5e9e <TestZoom4Picture+0x21b2>
    }
    
    for(int i2=0;i2<13;i2++) {
    5ee4:	42af 00d6      	clr.l 214(sp)
    5ee8:	607c           	bra.s 5f66 <TestZoom4Picture+0x227a>
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    5eea:	222f 00de      	move.l 222(sp),d1
    5eee:	2001           	move.l d1,d0
    5ef0:	eb88           	lsl.l #5,d0
    5ef2:	2040           	movea.l d0,a0
    5ef4:	91c1           	suba.l d1,a0
    5ef6:	41e8 001b      	lea 27(a0),a0
    5efa:	202f 00d6      	move.l 214(sp),d0
    5efe:	d080           	add.l d0,d0
    5f00:	2208           	move.l a0,d1
    5f02:	d280           	add.l d0,d1
    5f04:	7000           	moveq #0,d0
    5f06:	302f 01c6      	move.w 454(sp),d0
    5f0a:	2f01           	move.l d1,-(sp)
    5f0c:	2f00           	move.l d0,-(sp)
    5f0e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f12:	2f2f 0056      	move.l 86(sp),-(sp)
    5f16:	4eba 0c36      	jsr 6b4e <TestRow>(pc)
    5f1a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f1e:	702a           	moveq #42,d0
    5f20:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    5f24:	222f 00de      	move.l 222(sp),d1
    5f28:	2001           	move.l d1,d0
    5f2a:	eb88           	lsl.l #5,d0
    5f2c:	2040           	movea.l d0,a0
    5f2e:	91c1           	suba.l d1,a0
    5f30:	41e8 001c      	lea 28(a0),a0
    5f34:	202f 00d6      	move.l 214(sp),d0
    5f38:	d080           	add.l d0,d0
    5f3a:	2208           	move.l a0,d1
    5f3c:	d280           	add.l d0,d1
    5f3e:	7000           	moveq #0,d0
    5f40:	302f 01c6      	move.w 454(sp),d0
    5f44:	2f01           	move.l d1,-(sp)
    5f46:	2f00           	move.l d0,-(sp)
    5f48:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f4c:	2f2f 0056      	move.l 86(sp),-(sp)
    5f50:	4eba 0bfc      	jsr 6b4e <TestRow>(pc)
    5f54:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f58:	722a           	moveq #42,d1
    5f5a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5f5e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {
    5f62:	52af 00d6      	addq.l #1,214(sp)
    5f66:	700c           	moveq #12,d0
    5f68:	b0af 00d6      	cmp.l 214(sp),d0
    5f6c:	6c00 ff7c      	bge.w 5eea <TestZoom4Picture+0x21fe>
  for(int i=0;i<8;i++) {
    5f70:	52af 00de      	addq.l #1,222(sp)
    5f74:	7207           	moveq #7,d1
    5f76:	b2af 00de      	cmp.l 222(sp),d1
    5f7a:	6c00 ff1c      	bge.w 5e98 <TestZoom4Picture+0x21ac>
    }
  } 

  tmp = source;
    5f7e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5f84:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5f8a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    5f90:	4878 0001      	pea 1 <_start+0x1>
    5f94:	4878 000d      	pea d <_start+0xd>
    5f98:	2f2f 0056      	move.l 86(sp),-(sp)
    5f9c:	2f2f 006a      	move.l 106(sp),-(sp)
    5fa0:	4eba bafa      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    5fa4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5fa8:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    5fae:	2c40           	movea.l d0,a6
    5fb0:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5fb4:	202f 004e      	move.l 78(sp),d0
    5fb8:	5880           	addq.l #4,d0
    5fba:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom14;
    5fbe:	2f7c 0000 bd0c 	move.l #48396,74(sp)
    5fc4:	004a 

  mask = 0xffff;
    5fc6:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    5fcc:	7000           	moveq #0,d0
    5fce:	302f 01c6      	move.w 454(sp),d0
    5fd2:	42a7           	clr.l -(sp)
    5fd4:	2f00           	move.l d0,-(sp)
    5fd6:	2f2f 01d0      	move.l 464(sp),-(sp)
    5fda:	2f2f 0056      	move.l 86(sp),-(sp)
    5fde:	4eba 0b6e      	jsr 6b4e <TestRow>(pc)
    5fe2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2; 
    5fe6:	722a           	moveq #42,d1
    5fe8:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff; 
    5fec:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<9;i2++) {
    5ff0:	42af 00d2      	clr.l 210(sp)
    5ff4:	605c           	bra.s 6052 <TestZoom4Picture+0x2366>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5ff6:	202f 00d2      	move.l 210(sp),d0
    5ffa:	d080           	add.l d0,d0
    5ffc:	2200           	move.l d0,d1
    5ffe:	5281           	addq.l #1,d1
    6000:	7000           	moveq #0,d0
    6002:	302f 01c6      	move.w 454(sp),d0
    6006:	2f01           	move.l d1,-(sp)
    6008:	2f00           	move.l d0,-(sp)
    600a:	2f2f 01d0      	move.l 464(sp),-(sp)
    600e:	2f2f 0056      	move.l 86(sp),-(sp)
    6012:	4eba 0b3a      	jsr 6b4e <TestRow>(pc)
    6016:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    601a:	702a           	moveq #42,d0
    601c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    6020:	202f 00d2      	move.l 210(sp),d0
    6024:	5280           	addq.l #1,d0
    6026:	d080           	add.l d0,d0
    6028:	2200           	move.l d0,d1
    602a:	7000           	moveq #0,d0
    602c:	302f 01c6      	move.w 454(sp),d0
    6030:	2f01           	move.l d1,-(sp)
    6032:	2f00           	move.l d0,-(sp)
    6034:	2f2f 01d0      	move.l 464(sp),-(sp)
    6038:	2f2f 0056      	move.l 86(sp),-(sp)
    603c:	4eba 0b10      	jsr 6b4e <TestRow>(pc)
    6040:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6044:	722a           	moveq #42,d1
    6046:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    604a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {
    604e:	52af 00d2      	addq.l #1,210(sp)
    6052:	7008           	moveq #8,d0
    6054:	b0af 00d2      	cmp.l 210(sp),d0
    6058:	6c9c           	bge.s 5ff6 <TestZoom4Picture+0x230a>
  } 

  for(int i=0;i<7;i++) {
    605a:	42af 00ce      	clr.l 206(sp)
    605e:	6000 00cc      	bra.w 612c <TestZoom4Picture+0x2440>
    for(int i2=0;i2<4;i2++) {  
    6062:	42af 00ca      	clr.l 202(sp)
    6066:	6036           	bra.s 609e <TestZoom4Picture+0x23b2>
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    6068:	7213           	moveq #19,d1
    606a:	d2af 00ca      	add.l 202(sp),d1
    606e:	202f 00ce      	move.l 206(sp),d0
    6072:	eb88           	lsl.l #5,d0
    6074:	d280           	add.l d0,d1
    6076:	7000           	moveq #0,d0
    6078:	302f 01c6      	move.w 454(sp),d0
    607c:	2f01           	move.l d1,-(sp)
    607e:	2f00           	move.l d0,-(sp)
    6080:	2f2f 01d0      	move.l 464(sp),-(sp)
    6084:	2f2f 0056      	move.l 86(sp),-(sp)
    6088:	4eba 0ac4      	jsr 6b4e <TestRow>(pc)
    608c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6090:	722a           	moveq #42,d1
    6092:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6096:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<4;i2++) {  
    609a:	52af 00ca      	addq.l #1,202(sp)
    609e:	7003           	moveq #3,d0
    60a0:	b0af 00ca      	cmp.l 202(sp),d0
    60a4:	6cc2           	bge.s 6068 <TestZoom4Picture+0x237c>
    }
    
    for(int i2=0;i2<14;i2++) {
    60a6:	42af 00c6      	clr.l 198(sp)
    60aa:	6074           	bra.s 6120 <TestZoom4Picture+0x2434>
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    60ac:	202f 00ce      	move.l 206(sp),d0
    60b0:	eb88           	lsl.l #5,d0
    60b2:	307c 0017      	movea.w #23,a0
    60b6:	d1c0           	adda.l d0,a0
    60b8:	202f 00c6      	move.l 198(sp),d0
    60bc:	d080           	add.l d0,d0
    60be:	2208           	move.l a0,d1
    60c0:	d280           	add.l d0,d1
    60c2:	7000           	moveq #0,d0
    60c4:	302f 01c6      	move.w 454(sp),d0
    60c8:	2f01           	move.l d1,-(sp)
    60ca:	2f00           	move.l d0,-(sp)
    60cc:	2f2f 01d0      	move.l 464(sp),-(sp)
    60d0:	2f2f 0056      	move.l 86(sp),-(sp)
    60d4:	4eba 0a78      	jsr 6b4e <TestRow>(pc)
    60d8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    60dc:	722a           	moveq #42,d1
    60de:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    60e2:	202f 00ce      	move.l 206(sp),d0
    60e6:	eb88           	lsl.l #5,d0
    60e8:	307c 0018      	movea.w #24,a0
    60ec:	d1c0           	adda.l d0,a0
    60ee:	202f 00c6      	move.l 198(sp),d0
    60f2:	d080           	add.l d0,d0
    60f4:	2208           	move.l a0,d1
    60f6:	d280           	add.l d0,d1
    60f8:	7000           	moveq #0,d0
    60fa:	302f 01c6      	move.w 454(sp),d0
    60fe:	2f01           	move.l d1,-(sp)
    6100:	2f00           	move.l d0,-(sp)
    6102:	2f2f 01d0      	move.l 464(sp),-(sp)
    6106:	2f2f 0056      	move.l 86(sp),-(sp)
    610a:	4eba 0a42      	jsr 6b4e <TestRow>(pc)
    610e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6112:	702a           	moveq #42,d0
    6114:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6118:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {
    611c:	52af 00c6      	addq.l #1,198(sp)
    6120:	720d           	moveq #13,d1
    6122:	b2af 00c6      	cmp.l 198(sp),d1
    6126:	6c84           	bge.s 60ac <TestZoom4Picture+0x23c0>
  for(int i=0;i<7;i++) {
    6128:	52af 00ce      	addq.l #1,206(sp)
    612c:	7006           	moveq #6,d0
    612e:	b0af 00ce      	cmp.l 206(sp),d0
    6132:	6c00 ff2e      	bge.w 6062 <TestZoom4Picture+0x2376>
    }
  }

  for(int i2=0;i2<4;i2++) {  
    6136:	42af 00c2      	clr.l 194(sp)
    613a:	6032           	bra.s 616e <TestZoom4Picture+0x2482>
    TestRow( valsupposed, valactual, mask, 243+i2);
    613c:	222f 00c2      	move.l 194(sp),d1
    6140:	0681 0000 00f3 	addi.l #243,d1
    6146:	7000           	moveq #0,d0
    6148:	302f 01c6      	move.w 454(sp),d0
    614c:	2f01           	move.l d1,-(sp)
    614e:	2f00           	move.l d0,-(sp)
    6150:	2f2f 01d0      	move.l 464(sp),-(sp)
    6154:	2f2f 0056      	move.l 86(sp),-(sp)
    6158:	4eba 09f4      	jsr 6b4e <TestRow>(pc)
    615c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6160:	722a           	moveq #42,d1
    6162:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6166:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {  
    616a:	52af 00c2      	addq.l #1,194(sp)
    616e:	7003           	moveq #3,d0
    6170:	b0af 00c2      	cmp.l 194(sp),d0
    6174:	6cc6           	bge.s 613c <TestZoom4Picture+0x2450>
  }

  for(int i2=0;i2<12;i2++) {
    6176:	42af 00be      	clr.l 190(sp)
    617a:	6060           	bra.s 61dc <TestZoom4Picture+0x24f0>
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    617c:	202f 00be      	move.l 190(sp),d0
    6180:	d080           	add.l d0,d0
    6182:	2200           	move.l d0,d1
    6184:	0681 0000 00f7 	addi.l #247,d1
    618a:	7000           	moveq #0,d0
    618c:	302f 01c6      	move.w 454(sp),d0
    6190:	2f01           	move.l d1,-(sp)
    6192:	2f00           	move.l d0,-(sp)
    6194:	2f2f 01d0      	move.l 464(sp),-(sp)
    6198:	2f2f 0056      	move.l 86(sp),-(sp)
    619c:	4eba 09b0      	jsr 6b4e <TestRow>(pc)
    61a0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61a4:	722a           	moveq #42,d1
    61a6:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    61aa:	707c           	moveq #124,d0
    61ac:	d0af 00be      	add.l 190(sp),d0
    61b0:	d080           	add.l d0,d0
    61b2:	2200           	move.l d0,d1
    61b4:	7000           	moveq #0,d0
    61b6:	302f 01c6      	move.w 454(sp),d0
    61ba:	2f01           	move.l d1,-(sp)
    61bc:	2f00           	move.l d0,-(sp)
    61be:	2f2f 01d0      	move.l 464(sp),-(sp)
    61c2:	2f2f 0056      	move.l 86(sp),-(sp)
    61c6:	4eba 0986      	jsr 6b4e <TestRow>(pc)
    61ca:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61ce:	702a           	moveq #42,d0
    61d0:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    61d4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    61d8:	52af 00be      	addq.l #1,190(sp)
    61dc:	720b           	moveq #11,d1
    61de:	b2af 00be      	cmp.l 190(sp),d1
    61e2:	6c98           	bge.s 617c <TestZoom4Picture+0x2490>
  }

  tmp = source;
    61e4:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    61ea:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    61f0:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    61f6:	4878 0001      	pea 1 <_start+0x1>
    61fa:	4878 000e      	pea e <_start+0xe>
    61fe:	2f2f 0056      	move.l 86(sp),-(sp)
    6202:	2f2f 006a      	move.l 106(sp),-(sp)
    6206:	4eba b894      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    620a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    620e:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    6214:	2c40           	movea.l d0,a6
    6216:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    621a:	202f 004e      	move.l 78(sp),d0
    621e:	5880           	addq.l #4,d0
    6220:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom15;
    6224:	2f7c 0000 bd38 	move.l #48440,74(sp)
    622a:	004a 

  mask = 0x0000;
    622c:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<8;i2++) {
    6230:	42af 00ba      	clr.l 186(sp)
    6234:	605a           	bra.s 6290 <TestZoom4Picture+0x25a4>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6236:	202f 00ba      	move.l 186(sp),d0
    623a:	d080           	add.l d0,d0
    623c:	2200           	move.l d0,d1
    623e:	7000           	moveq #0,d0
    6240:	302f 01c6      	move.w 454(sp),d0
    6244:	2f01           	move.l d1,-(sp)
    6246:	2f00           	move.l d0,-(sp)
    6248:	2f2f 01d0      	move.l 464(sp),-(sp)
    624c:	2f2f 0056      	move.l 86(sp),-(sp)
    6250:	4eba 08fc      	jsr 6b4e <TestRow>(pc)
    6254:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6258:	722a           	moveq #42,d1
    625a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    625e:	202f 00ba      	move.l 186(sp),d0
    6262:	d080           	add.l d0,d0
    6264:	2200           	move.l d0,d1
    6266:	5281           	addq.l #1,d1
    6268:	7000           	moveq #0,d0
    626a:	302f 01c6      	move.w 454(sp),d0
    626e:	2f01           	move.l d1,-(sp)
    6270:	2f00           	move.l d0,-(sp)
    6272:	2f2f 01d0      	move.l 464(sp),-(sp)
    6276:	2f2f 0056      	move.l 86(sp),-(sp)
    627a:	4eba 08d2      	jsr 6b4e <TestRow>(pc)
    627e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6282:	702a           	moveq #42,d0
    6284:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6288:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    628c:	52af 00ba      	addq.l #1,186(sp)
    6290:	7207           	moveq #7,d1
    6292:	b2af 00ba      	cmp.l 186(sp),d1
    6296:	6c9e           	bge.s 6236 <TestZoom4Picture+0x254a>
  }

  for(int i=0;i<7;i++) {
    6298:	42af 00b6      	clr.l 182(sp)
    629c:	6000 00de      	bra.w 637c <TestZoom4Picture+0x2690>
    for(int i2=0;i2<3;i2++) {  
    62a0:	42af 00b2      	clr.l 178(sp)
    62a4:	603e           	bra.s 62e4 <TestZoom4Picture+0x25f8>
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    62a6:	307c 0010      	movea.w #16,a0
    62aa:	d1ef 00b2      	adda.l 178(sp),a0
    62ae:	222f 00b6      	move.l 182(sp),d1
    62b2:	2001           	move.l d1,d0
    62b4:	eb88           	lsl.l #5,d0
    62b6:	d081           	add.l d1,d0
    62b8:	2208           	move.l a0,d1
    62ba:	d280           	add.l d0,d1
    62bc:	7000           	moveq #0,d0
    62be:	302f 01c6      	move.w 454(sp),d0
    62c2:	2f01           	move.l d1,-(sp)
    62c4:	2f00           	move.l d0,-(sp)
    62c6:	2f2f 01d0      	move.l 464(sp),-(sp)
    62ca:	2f2f 0056      	move.l 86(sp),-(sp)
    62ce:	4eba 087e      	jsr 6b4e <TestRow>(pc)
    62d2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    62d6:	702a           	moveq #42,d0
    62d8:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    62dc:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<3;i2++) {  
    62e0:	52af 00b2      	addq.l #1,178(sp)
    62e4:	7202           	moveq #2,d1
    62e6:	b2af 00b2      	cmp.l 178(sp),d1
    62ea:	6cba           	bge.s 62a6 <TestZoom4Picture+0x25ba>
    }
    
    for(int i2=0;i2<15;i2++) {
    62ec:	42af 00ae      	clr.l 174(sp)
    62f0:	607c           	bra.s 636e <TestZoom4Picture+0x2682>
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    62f2:	222f 00b6      	move.l 182(sp),d1
    62f6:	2001           	move.l d1,d0
    62f8:	eb88           	lsl.l #5,d0
    62fa:	2040           	movea.l d0,a0
    62fc:	d1c1           	adda.l d1,a0
    62fe:	41e8 0013      	lea 19(a0),a0
    6302:	202f 00ae      	move.l 174(sp),d0
    6306:	d080           	add.l d0,d0
    6308:	2208           	move.l a0,d1
    630a:	d280           	add.l d0,d1
    630c:	7000           	moveq #0,d0
    630e:	302f 01c6      	move.w 454(sp),d0
    6312:	2f01           	move.l d1,-(sp)
    6314:	2f00           	move.l d0,-(sp)
    6316:	2f2f 01d0      	move.l 464(sp),-(sp)
    631a:	2f2f 0056      	move.l 86(sp),-(sp)
    631e:	4eba 082e      	jsr 6b4e <TestRow>(pc)
    6322:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6326:	702a           	moveq #42,d0
    6328:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    632c:	222f 00b6      	move.l 182(sp),d1
    6330:	2001           	move.l d1,d0
    6332:	eb88           	lsl.l #5,d0
    6334:	2040           	movea.l d0,a0
    6336:	d1c1           	adda.l d1,a0
    6338:	41e8 0013      	lea 19(a0),a0
    633c:	202f 00ae      	move.l 174(sp),d0
    6340:	d080           	add.l d0,d0
    6342:	2208           	move.l a0,d1
    6344:	d280           	add.l d0,d1
    6346:	7000           	moveq #0,d0
    6348:	302f 01c6      	move.w 454(sp),d0
    634c:	2f01           	move.l d1,-(sp)
    634e:	2f00           	move.l d0,-(sp)
    6350:	2f2f 01d0      	move.l 464(sp),-(sp)
    6354:	2f2f 0056      	move.l 86(sp),-(sp)
    6358:	4eba 07f4      	jsr 6b4e <TestRow>(pc)
    635c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6360:	722a           	moveq #42,d1
    6362:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6366:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {
    636a:	52af 00ae      	addq.l #1,174(sp)
    636e:	700e           	moveq #14,d0
    6370:	b0af 00ae      	cmp.l 174(sp),d0
    6374:	6c00 ff7c      	bge.w 62f2 <TestZoom4Picture+0x2606>
  for(int i=0;i<7;i++) {
    6378:	52af 00b6      	addq.l #1,182(sp)
    637c:	7206           	moveq #6,d1
    637e:	b2af 00b6      	cmp.l 182(sp),d1
    6382:	6c00 ff1c      	bge.w 62a0 <TestZoom4Picture+0x25b4>
    }
  }

  for(int i2=0;i2<3;i2++) {  
    6386:	42af 00aa      	clr.l 170(sp)
    638a:	6032           	bra.s 63be <TestZoom4Picture+0x26d2>
    TestRow( valsupposed, valactual, mask, 247+i2);
    638c:	222f 00aa      	move.l 170(sp),d1
    6390:	0681 0000 00f7 	addi.l #247,d1
    6396:	7000           	moveq #0,d0
    6398:	302f 01c6      	move.w 454(sp),d0
    639c:	2f01           	move.l d1,-(sp)
    639e:	2f00           	move.l d0,-(sp)
    63a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    63a4:	2f2f 0056      	move.l 86(sp),-(sp)
    63a8:	4eba 07a4      	jsr 6b4e <TestRow>(pc)
    63ac:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    63b0:	702a           	moveq #42,d0
    63b2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    63b6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<3;i2++) {  
    63ba:	52af 00aa      	addq.l #1,170(sp)
    63be:	7202           	moveq #2,d1
    63c0:	b2af 00aa      	cmp.l 170(sp),d1
    63c4:	6cc6           	bge.s 638c <TestZoom4Picture+0x26a0>
  }

  for(int i2=0;i2<10;i2++) {
    63c6:	42af 00a6      	clr.l 166(sp)
    63ca:	6060           	bra.s 642c <TestZoom4Picture+0x2740>
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    63cc:	707d           	moveq #125,d0
    63ce:	d0af 00a6      	add.l 166(sp),d0
    63d2:	d080           	add.l d0,d0
    63d4:	2200           	move.l d0,d1
    63d6:	7000           	moveq #0,d0
    63d8:	302f 01c6      	move.w 454(sp),d0
    63dc:	2f01           	move.l d1,-(sp)
    63de:	2f00           	move.l d0,-(sp)
    63e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    63e4:	2f2f 0056      	move.l 86(sp),-(sp)
    63e8:	4eba 0764      	jsr 6b4e <TestRow>(pc)
    63ec:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    63f0:	702a           	moveq #42,d0
    63f2:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    63f6:	202f 00a6      	move.l 166(sp),d0
    63fa:	d080           	add.l d0,d0
    63fc:	2200           	move.l d0,d1
    63fe:	0681 0000 00fb 	addi.l #251,d1
    6404:	7000           	moveq #0,d0
    6406:	302f 01c6      	move.w 454(sp),d0
    640a:	2f01           	move.l d1,-(sp)
    640c:	2f00           	move.l d0,-(sp)
    640e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6412:	2f2f 0056      	move.l 86(sp),-(sp)
    6416:	4eba 0736      	jsr 6b4e <TestRow>(pc)
    641a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    641e:	722a           	moveq #42,d1
    6420:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6424:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {
    6428:	52af 00a6      	addq.l #1,166(sp)
    642c:	7009           	moveq #9,d0
    642e:	b0af 00a6      	cmp.l 166(sp),d0
    6432:	6c98           	bge.s 63cc <TestZoom4Picture+0x26e0>
  }

  tmp = source;
    6434:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    643a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6440:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    6446:	4878 0001      	pea 1 <_start+0x1>
    644a:	4878 000f      	pea f <_start+0xf>
    644e:	2f2f 0056      	move.l 86(sp),-(sp)
    6452:	2f2f 006a      	move.l 106(sp),-(sp)
    6456:	4eba b644      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    645a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    645e:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    6464:	2c40           	movea.l d0,a6
    6466:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    646a:	222f 004e      	move.l 78(sp),d1
    646e:	5881           	addq.l #4,d1
    6470:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom16;
    6474:	2f7c 0000 bd64 	move.l #48484,74(sp)
    647a:	004a 

  mask = 0x0000;
    647c:	426f 01c6      	clr.w 454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    6480:	7000           	moveq #0,d0
    6482:	302f 01c6      	move.w 454(sp),d0
    6486:	42a7           	clr.l -(sp)
    6488:	2f00           	move.l d0,-(sp)
    648a:	2f2f 01d0      	move.l 464(sp),-(sp)
    648e:	2f2f 0056      	move.l 86(sp),-(sp)
    6492:	4eba 06ba      	jsr 6b4e <TestRow>(pc)
    6496:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    649a:	702a           	moveq #42,d0
    649c:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    64a0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    64a4:	42af 00a2      	clr.l 162(sp)
    64a8:	605a           	bra.s 6504 <TestZoom4Picture+0x2818>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    64aa:	202f 00a2      	move.l 162(sp),d0
    64ae:	d080           	add.l d0,d0
    64b0:	2200           	move.l d0,d1
    64b2:	7000           	moveq #0,d0
    64b4:	302f 01c6      	move.w 454(sp),d0
    64b8:	2f01           	move.l d1,-(sp)
    64ba:	2f00           	move.l d0,-(sp)
    64bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    64c0:	2f2f 0056      	move.l 86(sp),-(sp)
    64c4:	4eba 0688      	jsr 6b4e <TestRow>(pc)
    64c8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    64cc:	722a           	moveq #42,d1
    64ce:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    64d2:	202f 00a2      	move.l 162(sp),d0
    64d6:	d080           	add.l d0,d0
    64d8:	2200           	move.l d0,d1
    64da:	5281           	addq.l #1,d1
    64dc:	7000           	moveq #0,d0
    64de:	302f 01c6      	move.w 454(sp),d0
    64e2:	2f01           	move.l d1,-(sp)
    64e4:	2f00           	move.l d0,-(sp)
    64e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    64ea:	2f2f 0056      	move.l 86(sp),-(sp)
    64ee:	4eba 065e      	jsr 6b4e <TestRow>(pc)
    64f2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    64f6:	702a           	moveq #42,d0
    64f8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    64fc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    6500:	52af 00a2      	addq.l #1,162(sp)
    6504:	7205           	moveq #5,d1
    6506:	b2af 00a2      	cmp.l 162(sp),d1
    650a:	6c9e           	bge.s 64aa <TestZoom4Picture+0x27be>
  }

  for(int i=0;i<7;i++) {
    650c:	42af 009e      	clr.l 158(sp)
    6510:	6000 00e6      	bra.w 65f8 <TestZoom4Picture+0x290c>
    for(int i2=0;i2<2;i2++) {  
    6514:	42af 009a      	clr.l 154(sp)
    6518:	6040           	bra.s 655a <TestZoom4Picture+0x286e>
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    651a:	307c 000d      	movea.w #13,a0
    651e:	d1ef 009a      	adda.l 154(sp),a0
    6522:	222f 009e      	move.l 158(sp),d1
    6526:	2001           	move.l d1,d0
    6528:	e988           	lsl.l #4,d0
    652a:	d081           	add.l d1,d0
    652c:	d080           	add.l d0,d0
    652e:	2208           	move.l a0,d1
    6530:	d280           	add.l d0,d1
    6532:	7000           	moveq #0,d0
    6534:	302f 01c6      	move.w 454(sp),d0
    6538:	2f01           	move.l d1,-(sp)
    653a:	2f00           	move.l d0,-(sp)
    653c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6540:	2f2f 0056      	move.l 86(sp),-(sp)
    6544:	4eba 0608      	jsr 6b4e <TestRow>(pc)
    6548:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    654c:	702a           	moveq #42,d0
    654e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6552:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<2;i2++) {  
    6556:	52af 009a      	addq.l #1,154(sp)
    655a:	7201           	moveq #1,d1
    655c:	b2af 009a      	cmp.l 154(sp),d1
    6560:	6cb8           	bge.s 651a <TestZoom4Picture+0x282e>
    }
    
    for(int i2=0;i2<16;i2++) {
    6562:	42af 0096      	clr.l 150(sp)
    6566:	6000 0082      	bra.w 65ea <TestZoom4Picture+0x28fe>
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    656a:	222f 009e      	move.l 158(sp),d1
    656e:	2001           	move.l d1,d0
    6570:	e988           	lsl.l #4,d0
    6572:	d081           	add.l d1,d0
    6574:	d080           	add.l d0,d0
    6576:	2040           	movea.l d0,a0
    6578:	41e8 0010      	lea 16(a0),a0
    657c:	202f 0096      	move.l 150(sp),d0
    6580:	d080           	add.l d0,d0
    6582:	2208           	move.l a0,d1
    6584:	d280           	add.l d0,d1
    6586:	7000           	moveq #0,d0
    6588:	302f 01c6      	move.w 454(sp),d0
    658c:	2f01           	move.l d1,-(sp)
    658e:	2f00           	move.l d0,-(sp)
    6590:	2f2f 01d0      	move.l 464(sp),-(sp)
    6594:	2f2f 0056      	move.l 86(sp),-(sp)
    6598:	4eba 05b4      	jsr 6b4e <TestRow>(pc)
    659c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    65a0:	702a           	moveq #42,d0
    65a2:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    65a6:	222f 009e      	move.l 158(sp),d1
    65aa:	2001           	move.l d1,d0
    65ac:	e988           	lsl.l #4,d0
    65ae:	d081           	add.l d1,d0
    65b0:	d080           	add.l d0,d0
    65b2:	2040           	movea.l d0,a0
    65b4:	41e8 0011      	lea 17(a0),a0
    65b8:	202f 0096      	move.l 150(sp),d0
    65bc:	d080           	add.l d0,d0
    65be:	2208           	move.l a0,d1
    65c0:	d280           	add.l d0,d1
    65c2:	7000           	moveq #0,d0
    65c4:	302f 01c6      	move.w 454(sp),d0
    65c8:	2f01           	move.l d1,-(sp)
    65ca:	2f00           	move.l d0,-(sp)
    65cc:	2f2f 01d0      	move.l 464(sp),-(sp)
    65d0:	2f2f 0056      	move.l 86(sp),-(sp)
    65d4:	4eba 0578      	jsr 6b4e <TestRow>(pc)
    65d8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    65dc:	722a           	moveq #42,d1
    65de:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    65e2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {
    65e6:	52af 0096      	addq.l #1,150(sp)
    65ea:	700f           	moveq #15,d0
    65ec:	b0af 0096      	cmp.l 150(sp),d0
    65f0:	6c00 ff78      	bge.w 656a <TestZoom4Picture+0x287e>
  for(int i=0;i<7;i++) {
    65f4:	52af 009e      	addq.l #1,158(sp)
    65f8:	7206           	moveq #6,d1
    65fa:	b2af 009e      	cmp.l 158(sp),d1
    65fe:	6c00 ff14      	bge.w 6514 <TestZoom4Picture+0x2828>
    }
  }

  for(int i2=0;i2<2;i2++) {
    6602:	42af 0092      	clr.l 146(sp)
    6606:	6032           	bra.s 663a <TestZoom4Picture+0x294e>
    TestRow( valsupposed, valactual, mask, 251+i2);
    6608:	222f 0092      	move.l 146(sp),d1
    660c:	0681 0000 00fb 	addi.l #251,d1
    6612:	7000           	moveq #0,d0
    6614:	302f 01c6      	move.w 454(sp),d0
    6618:	2f01           	move.l d1,-(sp)
    661a:	2f00           	move.l d0,-(sp)
    661c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6620:	2f2f 0056      	move.l 86(sp),-(sp)
    6624:	4eba 0528      	jsr 6b4e <TestRow>(pc)
    6628:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    662c:	702a           	moveq #42,d0
    662e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6632:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<2;i2++) {
    6636:	52af 0092      	addq.l #1,146(sp)
    663a:	7201           	moveq #1,d1
    663c:	b2af 0092      	cmp.l 146(sp),d1
    6640:	6cc6           	bge.s 6608 <TestZoom4Picture+0x291c>
  }

  for(int i2=0;i2<8;i2++) {
    6642:	42af 008e      	clr.l 142(sp)
    6646:	6060           	bra.s 66a8 <TestZoom4Picture+0x29bc>
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    6648:	202f 008e      	move.l 142(sp),d0
    664c:	d080           	add.l d0,d0
    664e:	2200           	move.l d0,d1
    6650:	0681 0000 00fd 	addi.l #253,d1
    6656:	7000           	moveq #0,d0
    6658:	302f 01c6      	move.w 454(sp),d0
    665c:	2f01           	move.l d1,-(sp)
    665e:	2f00           	move.l d0,-(sp)
    6660:	2f2f 01d0      	move.l 464(sp),-(sp)
    6664:	2f2f 0056      	move.l 86(sp),-(sp)
    6668:	4eba 04e4      	jsr 6b4e <TestRow>(pc)
    666c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6670:	702a           	moveq #42,d0
    6672:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    6676:	707f           	moveq #127,d0
    6678:	d0af 008e      	add.l 142(sp),d0
    667c:	d080           	add.l d0,d0
    667e:	2200           	move.l d0,d1
    6680:	7000           	moveq #0,d0
    6682:	302f 01c6      	move.w 454(sp),d0
    6686:	2f01           	move.l d1,-(sp)
    6688:	2f00           	move.l d0,-(sp)
    668a:	2f2f 01d0      	move.l 464(sp),-(sp)
    668e:	2f2f 0056      	move.l 86(sp),-(sp)
    6692:	4eba 04ba      	jsr 6b4e <TestRow>(pc)
    6696:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    669a:	722a           	moveq #42,d1
    669c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    66a0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    66a4:	52af 008e      	addq.l #1,142(sp)
    66a8:	7007           	moveq #7,d0
    66aa:	b0af 008e      	cmp.l 142(sp),d0
    66ae:	6c98           	bge.s 6648 <TestZoom4Picture+0x295c>
  }

  tmp = source;
    66b0:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    66b6:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    66bc:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    66c2:	4878 0001      	pea 1 <_start+0x1>
    66c6:	4878 0010      	pea 10 <_start+0x10>
    66ca:	2f2f 0056      	move.l 86(sp),-(sp)
    66ce:	2f2f 006a      	move.l 106(sp),-(sp)
    66d2:	4eba b3c8      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    66d6:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    66da:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    66e0:	2c40           	movea.l d0,a6
    66e2:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    66e6:	222f 004e      	move.l 78(sp),d1
    66ea:	5881           	addq.l #4,d1
    66ec:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom17;
    66f0:	2f7c 0000 bd90 	move.l #48528,74(sp)
    66f6:	004a 

  mask = 0xffff;
    66f8:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<5;i2++) {
    66fe:	42af 008a      	clr.l 138(sp)
    6702:	605a           	bra.s 675e <TestZoom4Picture+0x2a72>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6704:	202f 008a      	move.l 138(sp),d0
    6708:	d080           	add.l d0,d0
    670a:	2200           	move.l d0,d1
    670c:	7000           	moveq #0,d0
    670e:	302f 01c6      	move.w 454(sp),d0
    6712:	2f01           	move.l d1,-(sp)
    6714:	2f00           	move.l d0,-(sp)
    6716:	2f2f 01d0      	move.l 464(sp),-(sp)
    671a:	2f2f 0056      	move.l 86(sp),-(sp)
    671e:	4eba 042e      	jsr 6b4e <TestRow>(pc)
    6722:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6726:	702a           	moveq #42,d0
    6728:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    672c:	202f 008a      	move.l 138(sp),d0
    6730:	d080           	add.l d0,d0
    6732:	2200           	move.l d0,d1
    6734:	5281           	addq.l #1,d1
    6736:	7000           	moveq #0,d0
    6738:	302f 01c6      	move.w 454(sp),d0
    673c:	2f01           	move.l d1,-(sp)
    673e:	2f00           	move.l d0,-(sp)
    6740:	2f2f 01d0      	move.l 464(sp),-(sp)
    6744:	2f2f 0056      	move.l 86(sp),-(sp)
    6748:	4eba 0404      	jsr 6b4e <TestRow>(pc)
    674c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6750:	722a           	moveq #42,d1
    6752:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6756:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {
    675a:	52af 008a      	addq.l #1,138(sp)
    675e:	7004           	moveq #4,d0
    6760:	b0af 008a      	cmp.l 138(sp),d0
    6764:	6c9e           	bge.s 6704 <TestZoom4Picture+0x2a18>
  }

  for(int i=0;i<7;i++) {
    6766:	42af 0086      	clr.l 134(sp)
    676a:	6000 00d4      	bra.w 6840 <TestZoom4Picture+0x2b54>
      TestRow( valsupposed, valactual, mask, 10+i*35);
    676e:	222f 0086      	move.l 134(sp),d1
    6772:	2001           	move.l d1,d0
    6774:	e988           	lsl.l #4,d0
    6776:	d081           	add.l d1,d0
    6778:	d080           	add.l d0,d0
    677a:	2040           	movea.l d0,a0
    677c:	d1c1           	adda.l d1,a0
    677e:	41e8 000a      	lea 10(a0),a0
    6782:	7000           	moveq #0,d0
    6784:	302f 01c6      	move.w 454(sp),d0
    6788:	2f08           	move.l a0,-(sp)
    678a:	2f00           	move.l d0,-(sp)
    678c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6790:	2f2f 0056      	move.l 86(sp),-(sp)
    6794:	4eba 03b8      	jsr 6b4e <TestRow>(pc)
    6798:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    679c:	722a           	moveq #42,d1
    679e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    67a2:	466f 01c6      	not.w 454(sp)
    
    for(int i2=0;i2<17;i2++) {
    67a6:	42af 0082      	clr.l 130(sp)
    67aa:	6000 0086      	bra.w 6832 <TestZoom4Picture+0x2b46>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    67ae:	222f 0086      	move.l 134(sp),d1
    67b2:	2001           	move.l d1,d0
    67b4:	e988           	lsl.l #4,d0
    67b6:	d081           	add.l d1,d0
    67b8:	d080           	add.l d0,d0
    67ba:	2040           	movea.l d0,a0
    67bc:	d1c1           	adda.l d1,a0
    67be:	41e8 000b      	lea 11(a0),a0
    67c2:	202f 0082      	move.l 130(sp),d0
    67c6:	d080           	add.l d0,d0
    67c8:	2208           	move.l a0,d1
    67ca:	d280           	add.l d0,d1
    67cc:	7000           	moveq #0,d0
    67ce:	302f 01c6      	move.w 454(sp),d0
    67d2:	2f01           	move.l d1,-(sp)
    67d4:	2f00           	move.l d0,-(sp)
    67d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    67da:	2f2f 0056      	move.l 86(sp),-(sp)
    67de:	4eba 036e      	jsr 6b4e <TestRow>(pc)
    67e2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    67e6:	702a           	moveq #42,d0
    67e8:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    67ec:	222f 0086      	move.l 134(sp),d1
    67f0:	2001           	move.l d1,d0
    67f2:	e988           	lsl.l #4,d0
    67f4:	d081           	add.l d1,d0
    67f6:	d080           	add.l d0,d0
    67f8:	2040           	movea.l d0,a0
    67fa:	d1c1           	adda.l d1,a0
    67fc:	41e8 000c      	lea 12(a0),a0
    6800:	202f 0082      	move.l 130(sp),d0
    6804:	d080           	add.l d0,d0
    6806:	2208           	move.l a0,d1
    6808:	d280           	add.l d0,d1
    680a:	7000           	moveq #0,d0
    680c:	302f 01c6      	move.w 454(sp),d0
    6810:	2f01           	move.l d1,-(sp)
    6812:	2f00           	move.l d0,-(sp)
    6814:	2f2f 01d0      	move.l 464(sp),-(sp)
    6818:	2f2f 0056      	move.l 86(sp),-(sp)
    681c:	4eba 0330      	jsr 6b4e <TestRow>(pc)
    6820:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6824:	722a           	moveq #42,d1
    6826:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    682a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<17;i2++) {
    682e:	52af 0082      	addq.l #1,130(sp)
    6832:	7010           	moveq #16,d0
    6834:	b0af 0082      	cmp.l 130(sp),d0
    6838:	6c00 ff74      	bge.w 67ae <TestZoom4Picture+0x2ac2>
  for(int i=0;i<7;i++) {
    683c:	52af 0086      	addq.l #1,134(sp)
    6840:	7206           	moveq #6,d1
    6842:	b2af 0086      	cmp.l 134(sp),d1
    6846:	6c00 ff26      	bge.w 676e <TestZoom4Picture+0x2a82>
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    684a:	7000           	moveq #0,d0
    684c:	302f 01c6      	move.w 454(sp),d0
    6850:	4878 00ff      	pea ff <FreeDisplay+0x1f>
    6854:	2f00           	move.l d0,-(sp)
    6856:	2f2f 01d0      	move.l 464(sp),-(sp)
    685a:	2f2f 0056      	move.l 86(sp),-(sp)
    685e:	4eba 02ee      	jsr 6b4e <TestRow>(pc)
    6862:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6866:	702a           	moveq #42,d0
    6868:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    686c:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<7;i2++) {
    6870:	42af 007e      	clr.l 126(sp)
    6874:	6064           	bra.s 68da <TestZoom4Picture+0x2bee>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6876:	202f 007e      	move.l 126(sp),d0
    687a:	0680 0000 0080 	addi.l #128,d0
    6880:	d080           	add.l d0,d0
    6882:	2200           	move.l d0,d1
    6884:	7000           	moveq #0,d0
    6886:	302f 01c6      	move.w 454(sp),d0
    688a:	2f01           	move.l d1,-(sp)
    688c:	2f00           	move.l d0,-(sp)
    688e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6892:	2f2f 0056      	move.l 86(sp),-(sp)
    6896:	4eba 02b6      	jsr 6b4e <TestRow>(pc)
    689a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    689e:	722a           	moveq #42,d1
    68a0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    68a4:	202f 007e      	move.l 126(sp),d0
    68a8:	d080           	add.l d0,d0
    68aa:	2200           	move.l d0,d1
    68ac:	0681 0000 0101 	addi.l #257,d1
    68b2:	7000           	moveq #0,d0
    68b4:	302f 01c6      	move.w 454(sp),d0
    68b8:	2f01           	move.l d1,-(sp)
    68ba:	2f00           	move.l d0,-(sp)
    68bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    68c0:	2f2f 0056      	move.l 86(sp),-(sp)
    68c4:	4eba 0288      	jsr 6b4e <TestRow>(pc)
    68c8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    68cc:	702a           	moveq #42,d0
    68ce:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    68d2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {
    68d6:	52af 007e      	addq.l #1,126(sp)
    68da:	7206           	moveq #6,d1
    68dc:	b2af 007e      	cmp.l 126(sp),d1
    68e0:	6c94           	bge.s 6876 <TestZoom4Picture+0x2b8a>
  }   

  tmp = source;
    68e2:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    68e8:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    68ee:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    68f4:	4878 0001      	pea 1 <_start+0x1>
    68f8:	4878 0011      	pea 11 <_start+0x11>
    68fc:	2f2f 0056      	move.l 86(sp),-(sp)
    6900:	2f2f 006a      	move.l 106(sp),-(sp)
    6904:	4eba b196      	jsr 1a9c <Zoom_ZoomIntoPicture>(pc)
    6908:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    690c:	2039 004d 2c34 	move.l 4d2c34 <GfxBase>,d0
    6912:	2c40           	movea.l d0,a6
    6914:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6918:	202f 004e      	move.l 78(sp),d0
    691c:	5880           	addq.l #4,d0
    691e:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom18;
    6922:	2f7c 0000 bdbc 	move.l #48572,74(sp)
    6928:	004a 

  mask = 0xffff;
    692a:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);
    6930:	7000           	moveq #0,d0
    6932:	302f 01c6      	move.w 454(sp),d0
    6936:	42a7           	clr.l -(sp)
    6938:	2f00           	move.l d0,-(sp)
    693a:	2f2f 01d0      	move.l 464(sp),-(sp)
    693e:	2f2f 0056      	move.l 86(sp),-(sp)
    6942:	4eba 020a      	jsr 6b4e <TestRow>(pc)
    6946:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    694a:	722a           	moveq #42,d1
    694c:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    6950:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<4;i2++) {
    6954:	42af 007a      	clr.l 122(sp)
    6958:	605c           	bra.s 69b6 <TestZoom4Picture+0x2cca>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    695a:	202f 007a      	move.l 122(sp),d0
    695e:	d080           	add.l d0,d0
    6960:	2200           	move.l d0,d1
    6962:	5281           	addq.l #1,d1
    6964:	7000           	moveq #0,d0
    6966:	302f 01c6      	move.w 454(sp),d0
    696a:	2f01           	move.l d1,-(sp)
    696c:	2f00           	move.l d0,-(sp)
    696e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6972:	2f2f 0056      	move.l 86(sp),-(sp)
    6976:	4eba 01d6      	jsr 6b4e <TestRow>(pc)
    697a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    697e:	702a           	moveq #42,d0
    6980:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    6984:	202f 007a      	move.l 122(sp),d0
    6988:	5280           	addq.l #1,d0
    698a:	d080           	add.l d0,d0
    698c:	2200           	move.l d0,d1
    698e:	7000           	moveq #0,d0
    6990:	302f 01c6      	move.w 454(sp),d0
    6994:	2f01           	move.l d1,-(sp)
    6996:	2f00           	move.l d0,-(sp)
    6998:	2f2f 01d0      	move.l 464(sp),-(sp)
    699c:	2f2f 0056      	move.l 86(sp),-(sp)
    69a0:	4eba 01ac      	jsr 6b4e <TestRow>(pc)
    69a4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    69a8:	722a           	moveq #42,d1
    69aa:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    69ae:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    69b2:	52af 007a      	addq.l #1,122(sp)
    69b6:	7003           	moveq #3,d0
    69b8:	b0af 007a      	cmp.l 122(sp),d0
    69bc:	6c9c           	bge.s 695a <TestZoom4Picture+0x2c6e>
  }

  for(int i=0;i<7;i++) {  
    69be:	42af 0076      	clr.l 118(sp)
    69c2:	6000 009c      	bra.w 6a60 <TestZoom4Picture+0x2d74>
    for(int i2=0;i2<18;i2++) {
    69c6:	42af 0072      	clr.l 114(sp)
    69ca:	6000 0086      	bra.w 6a52 <TestZoom4Picture+0x2d66>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    69ce:	222f 0076      	move.l 118(sp),d1
    69d2:	2001           	move.l d1,d0
    69d4:	e988           	lsl.l #4,d0
    69d6:	d081           	add.l d1,d0
    69d8:	d080           	add.l d0,d0
    69da:	2040           	movea.l d0,a0
    69dc:	d1c1           	adda.l d1,a0
    69de:	41e8 000b      	lea 11(a0),a0
    69e2:	202f 0072      	move.l 114(sp),d0
    69e6:	d080           	add.l d0,d0
    69e8:	2208           	move.l a0,d1
    69ea:	d280           	add.l d0,d1
    69ec:	7000           	moveq #0,d0
    69ee:	302f 01c6      	move.w 454(sp),d0
    69f2:	2f01           	move.l d1,-(sp)
    69f4:	2f00           	move.l d0,-(sp)
    69f6:	2f2f 01d0      	move.l 464(sp),-(sp)
    69fa:	2f2f 0056      	move.l 86(sp),-(sp)
    69fe:	4eba 014e      	jsr 6b4e <TestRow>(pc)
    6a02:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6a06:	722a           	moveq #42,d1
    6a08:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6a0c:	222f 0076      	move.l 118(sp),d1
    6a10:	2001           	move.l d1,d0
    6a12:	e988           	lsl.l #4,d0
    6a14:	d081           	add.l d1,d0
    6a16:	d080           	add.l d0,d0
    6a18:	2040           	movea.l d0,a0
    6a1a:	d1c1           	adda.l d1,a0
    6a1c:	41e8 000c      	lea 12(a0),a0
    6a20:	202f 0072      	move.l 114(sp),d0
    6a24:	d080           	add.l d0,d0
    6a26:	2208           	move.l a0,d1
    6a28:	d280           	add.l d0,d1
    6a2a:	7000           	moveq #0,d0
    6a2c:	302f 01c6      	move.w 454(sp),d0
    6a30:	2f01           	move.l d1,-(sp)
    6a32:	2f00           	move.l d0,-(sp)
    6a34:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a38:	2f2f 0056      	move.l 86(sp),-(sp)
    6a3c:	4eba 0110      	jsr 6b4e <TestRow>(pc)
    6a40:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6a44:	702a           	moveq #42,d0
    6a46:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6a4a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) {
    6a4e:	52af 0072      	addq.l #1,114(sp)
    6a52:	7211           	moveq #17,d1
    6a54:	b2af 0072      	cmp.l 114(sp),d1
    6a58:	6c00 ff74      	bge.w 69ce <TestZoom4Picture+0x2ce2>
  for(int i=0;i<7;i++) {  
    6a5c:	52af 0076      	addq.l #1,118(sp)
    6a60:	7006           	moveq #6,d0
    6a62:	b0af 0076      	cmp.l 118(sp),d0
    6a66:	6c00 ff5e      	bge.w 69c6 <TestZoom4Picture+0x2cda>
    }
  } 

  for(int i2=0;i2<4;i2++) {
    6a6a:	42af 006e      	clr.l 110(sp)
    6a6e:	6064           	bra.s 6ad4 <TestZoom4Picture+0x2de8>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6a70:	202f 006e      	move.l 110(sp),d0
    6a74:	0680 0000 0080 	addi.l #128,d0
    6a7a:	d080           	add.l d0,d0
    6a7c:	2200           	move.l d0,d1
    6a7e:	7000           	moveq #0,d0
    6a80:	302f 01c6      	move.w 454(sp),d0
    6a84:	2f01           	move.l d1,-(sp)
    6a86:	2f00           	move.l d0,-(sp)
    6a88:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a8c:	2f2f 0056      	move.l 86(sp),-(sp)
    6a90:	4eba 00bc      	jsr 6b4e <TestRow>(pc)
    6a94:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a98:	722a           	moveq #42,d1
    6a9a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6a9e:	202f 006e      	move.l 110(sp),d0
    6aa2:	d080           	add.l d0,d0
    6aa4:	2200           	move.l d0,d1
    6aa6:	0681 0000 0101 	addi.l #257,d1
    6aac:	7000           	moveq #0,d0
    6aae:	302f 01c6      	move.w 454(sp),d0
    6ab2:	2f01           	move.l d1,-(sp)
    6ab4:	2f00           	move.l d0,-(sp)
    6ab6:	2f2f 01d0      	move.l 464(sp),-(sp)
    6aba:	2f2f 0056      	move.l 86(sp),-(sp)
    6abe:	4eba 008e      	jsr 6b4e <TestRow>(pc)
    6ac2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6ac6:	702a           	moveq #42,d0
    6ac8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6acc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6ad0:	52af 006e      	addq.l #1,110(sp)
    6ad4:	7203           	moveq #3,d1
    6ad6:	b2af 006e      	cmp.l 110(sp),d1
    6ada:	6c94           	bge.s 6a70 <TestZoom4Picture+0x2d84>
  }
  TestRow( valsupposed, valactual, mask, 0);
    6adc:	7000           	moveq #0,d0
    6ade:	302f 01c6      	move.w 454(sp),d0
    6ae2:	42a7           	clr.l -(sp)
    6ae4:	2f00           	move.l d0,-(sp)
    6ae6:	2f2f 01d0      	move.l 464(sp),-(sp)
    6aea:	2f2f 0056      	move.l 86(sp),-(sp)
    6aee:	4eba 005e      	jsr 6b4e <TestRow>(pc)
    6af2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6af6:	702a           	moveq #42,d0
    6af8:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6afc:	466f 01c6      	not.w 454(sp)
  FreeMem( source, (ZMLINESIZE+4)*272);
    6b00:	2f6f 005e 0042 	move.l 94(sp),66(sp)
    6b06:	2f7c 0000 30e0 	move.l #12512,62(sp)
    6b0c:	003e 
    6b0e:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    6b14:	2c40           	movea.l d0,a6
    6b16:	226f 0042      	movea.l 66(sp),a1
    6b1a:	202f 003e      	move.l 62(sp),d0
    6b1e:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    6b22:	2f6f 004e 003a 	move.l 78(sp),58(sp)
    6b28:	2f7c 0000 30e0 	move.l #12512,54(sp)
    6b2e:	0036 
    6b30:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    6b36:	2c40           	movea.l d0,a6
    6b38:	226f 003a      	movea.l 58(sp),a1
    6b3c:	202f 0036      	move.l 54(sp),d0
    6b40:	4eae ff2e      	jsr -210(a6)
}
    6b44:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    6b48:	4fef 01d0      	lea 464(sp),sp
    6b4c:	4e75           	rts

00006b4e <TestRow>:

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    6b4e:	4fef ff40      	lea -192(sp),sp
    6b52:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
    6b56:	202f 00e0      	move.l 224(sp),d0
    6b5a:	3000           	move.w d0,d0
    6b5c:	3f40 0016      	move.w d0,22(sp)
  
  char str[ 100] = { 0 };
    6b60:	42af 001c      	clr.l 28(sp)
    6b64:	7020           	moveq #32,d0
    6b66:	d08f           	add.l sp,d0
    6b68:	7260           	moveq #96,d1
    6b6a:	2f01           	move.l d1,-(sp)
    6b6c:	42a7           	clr.l -(sp)
    6b6e:	2f00           	move.l d0,-(sp)
    6b70:	4eba 020c      	jsr 6d7e <memset>(pc)
    6b74:	4fef 000c      	lea 12(sp),sp
  UWORD data[2];
  data[1] = numberofline;
    6b78:	202f 00e4      	move.l 228(sp),d0
    6b7c:	3f40 001a      	move.w d0,26(sp)

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    6b80:	42af 00d0      	clr.l 208(sp)
    6b84:	6000 00d4      	bra.w 6c5a <TestRow+0x10c>
    if( (*testpattern++ ^ xormask) != *destination++) {
    6b88:	202f 00d8      	move.l 216(sp),d0
    6b8c:	2200           	move.l d0,d1
    6b8e:	5481           	addq.l #2,d1
    6b90:	2f41 00d8      	move.l d1,216(sp)
    6b94:	2040           	movea.l d0,a0
    6b96:	3010           	move.w (a0),d0
    6b98:	322f 0016      	move.w 22(sp),d1
    6b9c:	b141           	eor.w d0,d1
    6b9e:	202f 00dc      	move.l 220(sp),d0
    6ba2:	2400           	move.l d0,d2
    6ba4:	5482           	addq.l #2,d2
    6ba6:	2f42 00dc      	move.l d2,220(sp)
    6baa:	2040           	movea.l d0,a0
    6bac:	3010           	move.w (a0),d0
    6bae:	b041           	cmp.w d1,d0
    6bb0:	6700 00a4      	beq.w 6c56 <TestRow+0x108>
      data[0] = i;
    6bb4:	202f 00d0      	move.l 208(sp),d0
    6bb8:	3f40 0018      	move.w d0,24(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    6bbc:	2f7c 0000 84f8 	move.l #34040,164(sp)
    6bc2:	00a4 
    6bc4:	702b           	moveq #43,d0
    6bc6:	4600           	not.b d0
    6bc8:	d08f           	add.l sp,d0
    6bca:	0680 ffff ff44 	addi.l #-188,d0
    6bd0:	2f40 00a0      	move.l d0,160(sp)
    6bd4:	2f7c 0000 721c 	move.l #29212,156(sp)
    6bda:	009c 
    6bdc:	722b           	moveq #43,d1
    6bde:	4601           	not.b d1
    6be0:	d28f           	add.l sp,d1
    6be2:	0681 ffff ff48 	addi.l #-184,d1
    6be8:	2f41 0098      	move.l d1,152(sp)
    6bec:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    6bf2:	2c40           	movea.l d0,a6
    6bf4:	206f 00a4      	movea.l 164(sp),a0
    6bf8:	226f 00a0      	movea.l 160(sp),a1
    6bfc:	246f 009c      	movea.l 156(sp),a2
    6c00:	266f 0098      	movea.l 152(sp),a3
    6c04:	4eae fdf6      	jsr -522(a6)
    6c08:	2f40 0094      	move.l d0,148(sp)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    6c0c:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    6c12:	2c40           	movea.l d0,a6
    6c14:	4eae ffc4      	jsr -60(a6)
    6c18:	2f40 0090      	move.l d0,144(sp)
    6c1c:	202f 0090      	move.l 144(sp),d0
    6c20:	2f40 008c      	move.l d0,140(sp)
    6c24:	742b           	moveq #43,d2
    6c26:	4602           	not.b d2
    6c28:	d48f           	add.l sp,d2
    6c2a:	0682 ffff ff48 	addi.l #-184,d2
    6c30:	2f42 0088      	move.l d2,136(sp)
    6c34:	7064           	moveq #100,d0
    6c36:	2f40 0084      	move.l d0,132(sp)
    6c3a:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    6c40:	2c40           	movea.l d0,a6
    6c42:	222f 008c      	move.l 140(sp),d1
    6c46:	242f 0088      	move.l 136(sp),d2
    6c4a:	262f 0084      	move.l 132(sp),d3
    6c4e:	4eae ffd0      	jsr -48(a6)
    6c52:	2f40 0080      	move.l d0,128(sp)
  for(int i=0;i<21;i++) {
    6c56:	52af 00d0      	addq.l #1,208(sp)
    6c5a:	7214           	moveq #20,d1
    6c5c:	b2af 00d0      	cmp.l 208(sp),d1
    6c60:	6c00 ff26      	bge.w 6b88 <TestRow+0x3a>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    6c64:	206f 00d8      	movea.l 216(sp),a0
    6c68:	3010           	move.w (a0),d0
    6c6a:	322f 0016      	move.w 22(sp),d1
    6c6e:	b141           	eor.w d0,d1
    6c70:	206f 00dc      	movea.l 220(sp),a0
    6c74:	3010           	move.w (a0),d0
    6c76:	b340           	eor.w d1,d0
    6c78:	3000           	move.w d0,d0
    6c7a:	0280 0000 ffff 	andi.l #65535,d0
    6c80:	0280 0000 ff00 	andi.l #65280,d0
    6c86:	6700 00cc      	beq.w 6d54 <TestRow+0x206>
    data[0] = 21;
    6c8a:	3f7c 0015 0018 	move.w #21,24(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    6c90:	2f7c 0000 84f8 	move.l #34040,204(sp)
    6c96:	00cc 
    6c98:	742b           	moveq #43,d2
    6c9a:	4602           	not.b d2
    6c9c:	d48f           	add.l sp,d2
    6c9e:	0682 ffff ff44 	addi.l #-188,d2
    6ca4:	2f42 00c8      	move.l d2,200(sp)
    6ca8:	2f7c 0000 721c 	move.l #29212,196(sp)
    6cae:	00c4 
    6cb0:	702b           	moveq #43,d0
    6cb2:	4600           	not.b d0
    6cb4:	d08f           	add.l sp,d0
    6cb6:	0680 ffff ff48 	addi.l #-184,d0
    6cbc:	2f40 00c0      	move.l d0,192(sp)
    6cc0:	2039 004d 2c28 	move.l 4d2c28 <SysBase>,d0
    6cc6:	2c40           	movea.l d0,a6
    6cc8:	206f 00cc      	movea.l 204(sp),a0
    6ccc:	226f 00c8      	movea.l 200(sp),a1
    6cd0:	246f 00c4      	movea.l 196(sp),a2
    6cd4:	266f 00c0      	movea.l 192(sp),a3
    6cd8:	4eae fdf6      	jsr -522(a6)
    6cdc:	2f40 00bc      	move.l d0,188(sp)
                                                                           str);
    Write(  Output(), str, 100);
    6ce0:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    6ce6:	2c40           	movea.l d0,a6
    6ce8:	4eae ffc4      	jsr -60(a6)
    6cec:	2f40 00b8      	move.l d0,184(sp)
    6cf0:	202f 00b8      	move.l 184(sp),d0
    6cf4:	2f40 00b4      	move.l d0,180(sp)
    6cf8:	722b           	moveq #43,d1
    6cfa:	4601           	not.b d1
    6cfc:	d28f           	add.l sp,d1
    6cfe:	0681 ffff ff48 	addi.l #-184,d1
    6d04:	2f41 00b0      	move.l d1,176(sp)
    6d08:	7464           	moveq #100,d2
    6d0a:	2f42 00ac      	move.l d2,172(sp)
    6d0e:	2039 004d 2c30 	move.l 4d2c30 <DOSBase>,d0
    6d14:	2c40           	movea.l d0,a6
    6d16:	222f 00b4      	move.l 180(sp),d1
    6d1a:	242f 00b0      	move.l 176(sp),d2
    6d1e:	262f 00ac      	move.l 172(sp),d3
    6d22:	4eae ffd0      	jsr -48(a6)
    6d26:	2f40 00a8      	move.l d0,168(sp)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
    6d2a:	206f 00dc      	movea.l 220(sp),a0
    6d2e:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6d30:	7200           	moveq #0,d1
    6d32:	3200           	move.w d0,d1
                                                   *testpattern,*destination);
    6d34:	206f 00d8      	movea.l 216(sp),a0
    6d38:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6d3a:	3000           	move.w d0,d0
    6d3c:	0280 0000 ffff 	andi.l #65535,d0
    6d42:	2f01           	move.l d1,-(sp)
    6d44:	2f00           	move.l d0,-(sp)
    6d46:	4879 0000 8528 	pea 8528 <rundemo.c.95627ee6+0x15c>
    6d4c:	4eba 0162      	jsr 6eb0 <KPrintF>(pc)
    6d50:	4fef 000c      	lea 12(sp),sp
     
  }
}
    6d54:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    6d58:	4fef 00c0      	lea 192(sp),sp
    6d5c:	4e75           	rts

00006d5e <strlen>:
{
    6d5e:	598f           	subq.l #4,sp
	unsigned long t=0;
    6d60:	4297           	clr.l (sp)
    6d62:	6002           	bra.s 6d66 <strlen+0x8>
		t++;
    6d64:	5297           	addq.l #1,(sp)
	while(*s++)
    6d66:	202f 0008      	move.l 8(sp),d0
    6d6a:	2200           	move.l d0,d1
    6d6c:	5281           	addq.l #1,d1
    6d6e:	2f41 0008      	move.l d1,8(sp)
    6d72:	2040           	movea.l d0,a0
    6d74:	1010           	move.b (a0),d0
    6d76:	66ec           	bne.s 6d64 <strlen+0x6>
	return t;
    6d78:	2017           	move.l (sp),d0
}
    6d7a:	588f           	addq.l #4,sp
    6d7c:	4e75           	rts

00006d7e <memset>:
{
    6d7e:	4e55 fffc      	link.w a5,#-4
	unsigned char *ptr = (unsigned char *)dest;
    6d82:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
    6d88:	6014           	bra.s 6d9e <memset+0x20>
		*ptr++ = val;
    6d8a:	202d fffc      	move.l -4(a5),d0
    6d8e:	2200           	move.l d0,d1
    6d90:	5281           	addq.l #1,d1
    6d92:	2b41 fffc      	move.l d1,-4(a5)
    6d96:	222d 000c      	move.l 12(a5),d1
    6d9a:	2040           	movea.l d0,a0
    6d9c:	1081           	move.b d1,(a0)
	while(len-- > 0)
    6d9e:	202d 0010      	move.l 16(a5),d0
    6da2:	2200           	move.l d0,d1
    6da4:	5381           	subq.l #1,d1
    6da6:	2b41 0010      	move.l d1,16(a5)
    6daa:	4a80           	tst.l d0
    6dac:	66dc           	bne.s 6d8a <memset+0xc>
	return dest;
    6dae:	202d 0008      	move.l 8(a5),d0
}
    6db2:	4e5d           	unlk a5
    6db4:	4e75           	rts

00006db6 <memcpy>:
{
    6db6:	4e55 fff8      	link.w a5,#-8
    6dba:	2f02           	move.l d2,-(sp)
	char *d = (char *)dest;
    6dbc:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = (const char *)src;
    6dc2:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
    6dc8:	6020           	bra.s 6dea <memcpy+0x34>
		*d++ = *s++;
    6dca:	222d fff8      	move.l -8(a5),d1
    6dce:	2001           	move.l d1,d0
    6dd0:	5280           	addq.l #1,d0
    6dd2:	2b40 fff8      	move.l d0,-8(a5)
    6dd6:	202d fffc      	move.l -4(a5),d0
    6dda:	2400           	move.l d0,d2
    6ddc:	5282           	addq.l #1,d2
    6dde:	2b42 fffc      	move.l d2,-4(a5)
    6de2:	2041           	movea.l d1,a0
    6de4:	1210           	move.b (a0),d1
    6de6:	2040           	movea.l d0,a0
    6de8:	1081           	move.b d1,(a0)
	while(len--)
    6dea:	202d 0010      	move.l 16(a5),d0
    6dee:	2200           	move.l d0,d1
    6df0:	5381           	subq.l #1,d1
    6df2:	2b41 0010      	move.l d1,16(a5)
    6df6:	4a80           	tst.l d0
    6df8:	66d0           	bne.s 6dca <memcpy+0x14>
	return dest;
    6dfa:	202d 0008      	move.l 8(a5),d0
}
    6dfe:	241f           	move.l (sp)+,d2
    6e00:	4e5d           	unlk a5
    6e02:	4e75           	rts

00006e04 <memmove>:
{
    6e04:	4e55 fff0      	link.w a5,#-16
    6e08:	2f02           	move.l d2,-(sp)
	char *d = dest;
    6e0a:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = src;
    6e10:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
	if (d < s) {
    6e16:	202d fffc      	move.l -4(a5),d0
    6e1a:	b0ad fff8      	cmp.l -8(a5),d0
    6e1e:	6522           	bcs.s 6e42 <memmove+0x3e>
    6e20:	6032           	bra.s 6e54 <memmove+0x50>
			*d++ = *s++;
    6e22:	222d fff8      	move.l -8(a5),d1
    6e26:	2401           	move.l d1,d2
    6e28:	5282           	addq.l #1,d2
    6e2a:	2b42 fff8      	move.l d2,-8(a5)
    6e2e:	202d fffc      	move.l -4(a5),d0
    6e32:	2400           	move.l d0,d2
    6e34:	5282           	addq.l #1,d2
    6e36:	2b42 fffc      	move.l d2,-4(a5)
    6e3a:	2041           	movea.l d1,a0
    6e3c:	1210           	move.b (a0),d1
    6e3e:	2040           	movea.l d0,a0
    6e40:	1081           	move.b d1,(a0)
		while (len--)
    6e42:	202d 0010      	move.l 16(a5),d0
    6e46:	2200           	move.l d0,d1
    6e48:	5381           	subq.l #1,d1
    6e4a:	2b41 0010      	move.l d1,16(a5)
    6e4e:	4a80           	tst.l d0
    6e50:	66d0           	bne.s 6e22 <memmove+0x1e>
    6e52:	6052           	bra.s 6ea6 <memmove+0xa2>
		const char *lasts = s + (len - 1);
    6e54:	202d 0010      	move.l 16(a5),d0
    6e58:	5380           	subq.l #1,d0
    6e5a:	242d fff8      	move.l -8(a5),d2
    6e5e:	d480           	add.l d0,d2
    6e60:	2b42 fff4      	move.l d2,-12(a5)
		char *lastd = d + (len - 1);
    6e64:	202d 0010      	move.l 16(a5),d0
    6e68:	5380           	subq.l #1,d0
    6e6a:	222d fffc      	move.l -4(a5),d1
    6e6e:	d280           	add.l d0,d1
    6e70:	2b41 fff0      	move.l d1,-16(a5)
    6e74:	6020           	bra.s 6e96 <memmove+0x92>
			*lastd-- = *lasts--;
    6e76:	222d fff4      	move.l -12(a5),d1
    6e7a:	2401           	move.l d1,d2
    6e7c:	5382           	subq.l #1,d2
    6e7e:	2b42 fff4      	move.l d2,-12(a5)
    6e82:	202d fff0      	move.l -16(a5),d0
    6e86:	2400           	move.l d0,d2
    6e88:	5382           	subq.l #1,d2
    6e8a:	2b42 fff0      	move.l d2,-16(a5)
    6e8e:	2041           	movea.l d1,a0
    6e90:	1210           	move.b (a0),d1
    6e92:	2040           	movea.l d0,a0
    6e94:	1081           	move.b d1,(a0)
		while (len--)
    6e96:	202d 0010      	move.l 16(a5),d0
    6e9a:	2200           	move.l d0,d1
    6e9c:	5381           	subq.l #1,d1
    6e9e:	2b41 0010      	move.l d1,16(a5)
    6ea2:	4a80           	tst.l d0
    6ea4:	66d0           	bne.s 6e76 <memmove+0x72>
	return dest;
    6ea6:	202d 0008      	move.l 8(a5),d0
}
    6eaa:	241f           	move.l (sp)+,d2
    6eac:	4e5d           	unlk a5
    6eae:	4e75           	rts

00006eb0 <KPrintF>:
{
    6eb0:	4fef ff80      	lea -128(sp),sp
    6eb4:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    6eb8:	3039 00f0 ff60 	move.w f0ff60 <_end+0xa3d2e4>,d0
    6ebe:	0c40 4eb9      	cmpi.w #20153,d0
    6ec2:	6722           	beq.s 6ee6 <KPrintF+0x36>
    6ec4:	0c40 a00e      	cmpi.w #-24562,d0
    6ec8:	671c           	beq.s 6ee6 <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    6eca:	2c79 004d 2c28 	movea.l 4d2c28 <SysBase>,a6
    6ed0:	206f 0090      	movea.l 144(sp),a0
    6ed4:	43ef 0094      	lea 148(sp),a1
    6ed8:	45f9 0000 720e 	lea 720e <KPutCharX>,a2
    6ede:	97cb           	suba.l a3,a3
    6ee0:	4eae fdf6      	jsr -522(a6)
    6ee4:	602a           	bra.s 6f10 <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    6ee6:	2c79 004d 2c28 	movea.l 4d2c28 <SysBase>,a6
    6eec:	206f 0090      	movea.l 144(sp),a0
    6ef0:	43ef 0094      	lea 148(sp),a1
    6ef4:	45f9 0000 721c 	lea 721c <PutChar>,a2
    6efa:	47ef 000c      	lea 12(sp),a3
    6efe:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    6f02:	2f0b           	move.l a3,-(sp)
    6f04:	4878 0056      	pea 56 <_start+0x56>
    6f08:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xa3d2e4>
    6f0e:	508f           	addq.l #8,sp
}
    6f10:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    6f14:	4fef 0080      	lea 128(sp),sp
    6f18:	4e75           	rts

00006f1a <warpmode>:

void warpmode(int on) // bool
{
    6f1a:	518f           	subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
    6f1c:	2f7c 00f0 ff60 	move.l #15794016,4(sp)
    6f22:	0004 
    if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
    6f24:	206f 0004      	movea.l 4(sp),a0
    6f28:	3010           	move.w (a0),d0
    6f2a:	0c40 4eb9      	cmpi.w #20153,d0
    6f2e:	670c           	beq.s 6f3c <warpmode+0x22>
    6f30:	206f 0004      	movea.l 4(sp),a0
    6f34:	3010           	move.w (a0),d0
    6f36:	0c40 a00e      	cmpi.w #-24562,d0
    6f3a:	6668           	bne.s 6fa4 <warpmode+0x8a>
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    6f3c:	4aaf 000c      	tst.l 12(sp)
    6f40:	6708           	beq.s 6f4a <warpmode+0x30>
    6f42:	203c 0000 854e 	move.l #34126,d0
    6f48:	6006           	bra.s 6f50 <warpmode+0x36>
    6f4a:	203c 0000 8558 	move.l #34136,d0
    6f50:	4878 0001      	pea 1 <_start+0x1>
    6f54:	220f           	move.l sp,d1
    6f56:	5e81           	addq.l #7,d1
    6f58:	2f01           	move.l d1,-(sp)
    6f5a:	42a7           	clr.l -(sp)
    6f5c:	2f00           	move.l d0,-(sp)
    6f5e:	4878 ffff      	pea ffffffff <_end+0xffb2d383>
    6f62:	4878 0052      	pea 52 <_start+0x52>
    6f66:	206f 001c      	movea.l 28(sp),a0
    6f6a:	4e90           	jsr (a0)
    6f6c:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    6f70:	4aaf 000c      	tst.l 12(sp)
    6f74:	6708           	beq.s 6f7e <warpmode+0x64>
    6f76:	203c 0000 8563 	move.l #34147,d0
    6f7c:	6006           	bra.s 6f84 <warpmode+0x6a>
    6f7e:	203c 0000 857d 	move.l #34173,d0
    6f84:	4878 0001      	pea 1 <_start+0x1>
    6f88:	220f           	move.l sp,d1
    6f8a:	5e81           	addq.l #7,d1
    6f8c:	2f01           	move.l d1,-(sp)
    6f8e:	42a7           	clr.l -(sp)
    6f90:	2f00           	move.l d0,-(sp)
    6f92:	4878 ffff      	pea ffffffff <_end+0xffb2d383>
    6f96:	4878 0052      	pea 52 <_start+0x52>
    6f9a:	206f 001c      	movea.l 28(sp),a0
    6f9e:	4e90           	jsr (a0)
    6fa0:	4fef 0018      	lea 24(sp),sp
	}
}
    6fa4:	508f           	addq.l #8,sp
    6fa6:	4e75           	rts

00006fa8 <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4)
{
    6fa8:	598f           	subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
    6faa:	2ebc 00f0 ff60 	move.l #15794016,(sp)
    if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    6fb0:	2057           	movea.l (sp),a0
    6fb2:	3010           	move.w (a0),d0
    6fb4:	0c40 4eb9      	cmpi.w #20153,d0
    6fb8:	670a           	beq.s 6fc4 <debug_cmd+0x1c>
    6fba:	2057           	movea.l (sp),a0
    6fbc:	3010           	move.w (a0),d0
    6fbe:	0c40 a00e      	cmpi.w #-24562,d0
    6fc2:	661e           	bne.s 6fe2 <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
    6fc4:	2f2f 0014      	move.l 20(sp),-(sp)
    6fc8:	2f2f 0014      	move.l 20(sp),-(sp)
    6fcc:	2f2f 0014      	move.l 20(sp),-(sp)
    6fd0:	2f2f 0014      	move.l 20(sp),-(sp)
    6fd4:	4878 0058      	pea 58 <_start+0x58>
    6fd8:	206f 0014      	movea.l 20(sp),a0
    6fdc:	4e90           	jsr (a0)
    6fde:	4fef 0014      	lea 20(sp),sp
	}
}
    6fe2:	588f           	addq.l #4,sp
    6fe4:	4e75           	rts

00006fe6 <debug_clear>:
	barto_cmd_text,
};

void debug_clear()
{
	debug_cmd(barto_cmd_clear, 0, 0, 0);
    6fe6:	42a7           	clr.l -(sp)
    6fe8:	42a7           	clr.l -(sp)
    6fea:	42a7           	clr.l -(sp)
    6fec:	42a7           	clr.l -(sp)
    6fee:	4eba ffb8      	jsr 6fa8 <debug_cmd>(pc)
    6ff2:	4fef 0010      	lea 16(sp),sp
}
    6ff6:	4e75           	rts

00006ff8 <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color)
{
    6ff8:	518f           	subq.l #8,sp
    6ffa:	2f02           	move.l d2,-(sp)
    6ffc:	226f 0010      	movea.l 16(sp),a1
    7000:	206f 0014      	movea.l 20(sp),a0
    7004:	222f 0018      	move.l 24(sp),d1
    7008:	202f 001c      	move.l 28(sp),d0
    700c:	3249           	movea.w a1,a1
    700e:	3f49 000a      	move.w a1,10(sp)
    7012:	3048           	movea.w a0,a0
    7014:	3f48 0008      	move.w a0,8(sp)
    7018:	3201           	move.w d1,d1
    701a:	3f41 0006      	move.w d1,6(sp)
    701e:	3000           	move.w d0,d0
    7020:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    7024:	302f 0006      	move.w 6(sp),d0
    7028:	48c0           	ext.l d0
    702a:	4840           	swap d0
    702c:	4240           	clr.w d0
    702e:	322f 0004      	move.w 4(sp),d1
    7032:	48c1           	ext.l d1
    7034:	8280           	or.l d0,d1
    7036:	302f 000a      	move.w 10(sp),d0
    703a:	48c0           	ext.l d0
    703c:	4840           	swap d0
    703e:	4240           	clr.w d0
    7040:	306f 0008      	movea.w 8(sp),a0
    7044:	2408           	move.l a0,d2
    7046:	8082           	or.l d2,d0
    7048:	2f2f 0020      	move.l 32(sp),-(sp)
    704c:	2f01           	move.l d1,-(sp)
    704e:	2f00           	move.l d0,-(sp)
    7050:	4878 0001      	pea 1 <_start+0x1>
    7054:	4eba ff52      	jsr 6fa8 <debug_cmd>(pc)
    7058:	4fef 0010      	lea 16(sp),sp
}
    705c:	241f           	move.l (sp)+,d2
    705e:	508f           	addq.l #8,sp
    7060:	4e75           	rts

00007062 <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color)
{
    7062:	518f           	subq.l #8,sp
    7064:	2f02           	move.l d2,-(sp)
    7066:	226f 0010      	movea.l 16(sp),a1
    706a:	206f 0014      	movea.l 20(sp),a0
    706e:	222f 0018      	move.l 24(sp),d1
    7072:	202f 001c      	move.l 28(sp),d0
    7076:	3249           	movea.w a1,a1
    7078:	3f49 000a      	move.w a1,10(sp)
    707c:	3048           	movea.w a0,a0
    707e:	3f48 0008      	move.w a0,8(sp)
    7082:	3201           	move.w d1,d1
    7084:	3f41 0006      	move.w d1,6(sp)
    7088:	3000           	move.w d0,d0
    708a:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    708e:	302f 0006      	move.w 6(sp),d0
    7092:	48c0           	ext.l d0
    7094:	4840           	swap d0
    7096:	4240           	clr.w d0
    7098:	322f 0004      	move.w 4(sp),d1
    709c:	48c1           	ext.l d1
    709e:	8280           	or.l d0,d1
    70a0:	302f 000a      	move.w 10(sp),d0
    70a4:	48c0           	ext.l d0
    70a6:	4840           	swap d0
    70a8:	4240           	clr.w d0
    70aa:	306f 0008      	movea.w 8(sp),a0
    70ae:	2408           	move.l a0,d2
    70b0:	8082           	or.l d2,d0
    70b2:	2f2f 0020      	move.l 32(sp),-(sp)
    70b6:	2f01           	move.l d1,-(sp)
    70b8:	2f00           	move.l d0,-(sp)
    70ba:	4878 0002      	pea 2 <_start+0x2>
    70be:	4eba fee8      	jsr 6fa8 <debug_cmd>(pc)
    70c2:	4fef 0010      	lea 16(sp),sp
}
    70c6:	241f           	move.l (sp)+,d2
    70c8:	508f           	addq.l #8,sp
    70ca:	4e75           	rts

000070cc <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color)
{
    70cc:	598f           	subq.l #4,sp
    70ce:	2f02           	move.l d2,-(sp)
    70d0:	222f 000c      	move.l 12(sp),d1
    70d4:	202f 0010      	move.l 16(sp),d0
    70d8:	3201           	move.w d1,d1
    70da:	3f41 0006      	move.w d1,6(sp)
    70de:	3000           	move.w d0,d0
    70e0:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
    70e4:	202f 0014      	move.l 20(sp),d0
    70e8:	322f 0006      	move.w 6(sp),d1
    70ec:	48c1           	ext.l d1
    70ee:	4841           	swap d1
    70f0:	4241           	clr.w d1
    70f2:	306f 0004      	movea.w 4(sp),a0
    70f6:	2408           	move.l a0,d2
    70f8:	8282           	or.l d2,d1
    70fa:	2f2f 0018      	move.l 24(sp),-(sp)
    70fe:	2f00           	move.l d0,-(sp)
    7100:	2f01           	move.l d1,-(sp)
    7102:	4878 0003      	pea 3 <_start+0x3>
    7106:	4eba fea0      	jsr 6fa8 <debug_cmd>(pc)
    710a:	4fef 0010      	lea 16(sp),sp
}
    710e:	241f           	move.l (sp)+,d2
    7110:	588f           	addq.l #4,sp
    7112:	4e75           	rts

00007114 <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    7114:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    7118:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    711c:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    7120:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    7124:	d041           	add.w d1,d0
	swap	d0
    7126:	4840           	swap d0
	clrw	d0
    7128:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    712a:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    712e:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    7132:	d081           	add.l d1,d0
	rts
    7134:	4e75           	rts

00007136 <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    7136:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    7138:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    713c:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    7140:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    7146:	6416           	bcc.s 715e <__udivsi3+0x28>
	movel	d0, d2
    7148:	2400           	move.l d0,d2
	clrw	d2
    714a:	4242           	clr.w d2
	swap	d2
    714c:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    714e:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    7150:	3002           	move.w d2,d0
	swap	d0
    7152:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    7154:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    7158:	84c1           	divu.w d1,d2
	movew	d2, d0
    715a:	3002           	move.w d2,d0
	jra	6f
    715c:	6030           	bra.s 718e <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    715e:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    7160:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    7162:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    7164:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    716a:	64f4           	bcc.s 7160 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    716c:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    716e:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    7174:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    7176:	c2c0           	mulu.w d0,d1
	swap	d2
    7178:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    717a:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    717c:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    717e:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    7180:	660a           	bne.s 718c <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    7182:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    7184:	6506           	bcs.s 718c <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    7186:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    718a:	6302           	bls.s 718e <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    718c:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    718e:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    7190:	4e75           	rts

00007192 <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    7192:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    7194:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    7196:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    719a:	6a04           	bpl.s 71a0 <__divsi3+0xe>
	negl	d1
    719c:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    719e:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    71a0:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    71a4:	6a04           	bpl.s 71aa <__divsi3+0x18>
	negl	d0
    71a6:	4480           	neg.l d0
	negb	d2
    71a8:	4402           	neg.b d2

2:	movel	d1, sp@-
    71aa:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    71ac:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    71ae:	6186           	bsr.s 7136 <__udivsi3>
	addql	IMM (8), sp
    71b0:	508f           	addq.l #8,sp

	tstb	d2
    71b2:	4a02           	tst.b d2
	jpl	3f
    71b4:	6a02           	bpl.s 71b8 <__divsi3+0x26>
	negl	d0
    71b6:	4480           	neg.l d0

3:	movel	sp@+, d2
    71b8:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    71ba:	4e75           	rts

000071bc <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    71bc:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    71c0:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    71c4:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    71c6:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    71c8:	61c8           	bsr.s 7192 <__divsi3>
	addql	IMM (8), sp
    71ca:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    71cc:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    71d0:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    71d2:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    71d4:	6100 ff3e      	bsr.w 7114 <__mulsi3>
	addql	IMM (8), sp
    71d8:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    71da:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    71de:	9280           	sub.l d0,d1
	movel	d1, d0
    71e0:	2001           	move.l d1,d0
	rts
    71e2:	4e75           	rts

000071e4 <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    71e4:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    71e8:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    71ec:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    71ee:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    71f0:	6100 ff44      	bsr.w 7136 <__udivsi3>
	addql	IMM (8), sp
    71f4:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    71f6:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    71fa:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    71fc:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    71fe:	6100 ff14      	bsr.w 7114 <__mulsi3>
	addql	IMM (8), sp
    7202:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    7204:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    7208:	9280           	sub.l d0,d1
	movel	d1, d0
    720a:	2001           	move.l d1,d0
	rts
    720c:	4e75           	rts

0000720e <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    720e:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    7210:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    7214:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    7218:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    721a:	4e75           	rts

0000721c <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    721c:	16c0           	move.b d0,(a3)+
	rts
    721e:	4e75           	rts

00007220 <c2p1x1_8_c5_gen_init>:
	.text
	FUNC(c2p1x1_8_c5_gen_init)
	.globl	SYM (c2p1x1_8_c5_gen_init)

SYM(c2p1x1_8_c5_gen_init):
	movem.l d0-d7/a0-a6, .gi_saveregs	
    7220:	48f9 7fff 0000 	movem.l d0-a6,7260 <.gi_saveregs>
    7226:	7260 
	move.l  4(sp),d0
    7228:	202f 0004      	move.l 4(sp),d0
	move.l	8(sp),d1
    722c:	222f 0008      	move.l 8(sp),d1
	move.l	12(sp),d2
    7230:	242f 000c      	move.l 12(sp),d2
	move.l	16(sp),d3
    7234:	262f 0010      	move.l 16(sp),d3
	move.l  20(sp),d4
    7238:	282f 0014      	move.l 20(sp),d4
	move.l	24(sp),d5
    723c:	2a2f 0018      	move.l 24(sp),d5
	andi.l	IMM (0xffff),d0
    7240:	0280 0000 ffff 	andi.l #65535,d0
	mulu.w	d0,d3
    7246:	c6c0           	mulu.w d0,d3
	lsr.l	#3,d3
    7248:	e68b           	lsr.l #3,d3
	move.l	d3,c2p1x1_8_c5_gen_scroffs
    724a:	23c3 0000 75b6 	move.l d3,75b6 <c2p1x1_8_c5_gen_scroffs>
	mulu.w	d0,d1
    7250:	c2c0           	mulu.w d0,d1
	move.l	d1,c2p1x1_8_c5_gen_pixels
    7252:	23c1 0000 75ba 	move.l d1,75ba <c2p1x1_8_c5_gen_pixels>
	movem.l	.gi_saveregs,d0-d7/a0-a6
    7258:	4cfa 7fff 0004 	movem.l 7260 <.gi_saveregs>(pc),d0-a6
	rts
    725e:	4e75           	rts

00007260 <.gi_saveregs>:
	...

0000729c <c2p1x1_8_c5_gen>:
	.text
	FUNC(c2p1x1_8_c5_gen)
	.globl	SYM (c2p1x1_8_c5_gen)

SYM(c2p1x1_8_c5_gen):
	movem.l d0-d7/a0-a6,.c2p_saveregs	
    729c:	48f9 7fff 0000 	movem.l d0-a6,757a <.c2p_saveregs>
    72a2:	757a 
	movem.l 4(sp),a0
    72a4:	4cef 0100 0004 	movem.l 4(sp),a0
	movem.l 8(sp),a1
    72aa:	4cef 0200 0008 	movem.l 8(sp),a1
    move.l	IMM (0x33333333),d5
    72b0:	2a3c 3333 3333 	move.l #858993459,d5
	move.l	IMM (0x55555555),a6
    72b6:	2c7c 5555 5555 	movea.l #1431655765,a6

	add.w	#BPLSIZE,a1
    72bc:	d2fc 2bf8      	adda.w #11256,a1
	add.l	c2p1x1_8_c5_gen_scroffs,a1
    72c0:	d3fa 02f4      	adda.l 75b6 <c2p1x1_8_c5_gen_scroffs>(pc),a1

	move.l	c2p1x1_8_c5_gen_pixels,a2
    72c4:	247a 02f4      	movea.l 75ba <c2p1x1_8_c5_gen_pixels>(pc),a2
	add.l	a0,a2
    72c8:	d5c8           	adda.l a0,a2
	cmp.l	a0,a2
    72ca:	b5c8           	cmpa.l a0,a2
	beq	.none
    72cc:	6700 02a4      	beq.w 7572 <.none>

	movem.l	a0-a1,-(sp)
    72d0:	48e7 00c0      	movem.l a0-a1,-(sp)

	move.l	(a0)+,d0
    72d4:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    72d6:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    72d8:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    72da:	2618           	move.l (a0)+,d3

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    72dc:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    72e2:	c084           	and.l d4,d0
	and.l	d4,d1
    72e4:	c284           	and.l d4,d1
	and.l	d4,d2
    72e6:	c484           	and.l d4,d2
	and.l	d4,d3
    72e8:	c684           	and.l d4,d3
	lsl.l	#4,d0
    72ea:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    72ec:	e989           	lsl.l #4,d1
	or.l	d2,d0
    72ee:	8082           	or.l d2,d0
	or.l	d3,d1
    72f0:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    72f2:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    72f4:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    72f6:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    72f8:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    72fa:	c484           	and.l d4,d2
	and.l	d4,d6
    72fc:	cc84           	and.l d4,d6
	and.l	d4,d3
    72fe:	c684           	and.l d4,d3
	and.l	d4,d7
    7300:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    7302:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    7304:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    7306:	8486           	or.l d6,d2
	or.l	d7,d3
    7308:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    730a:	3c02           	move.w d2,d6
	move.w	d3,d7
    730c:	3e03           	move.w d3,d7
	move.w	d0,d2
    730e:	3400           	move.w d0,d2
	move.w	d1,d3
    7310:	3601           	move.w d1,d3
	swap	d2
    7312:	4842           	swap d2
	swap	d3
    7314:	4843           	swap d3
	move.w	d2,d0
    7316:	3002           	move.w d2,d0
	move.w	d3,d1
    7318:	3203           	move.w d3,d1
	move.w	d6,d2
    731a:	3406           	move.w d6,d2
	move.w	d7,d3
    731c:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    731e:	2c02           	move.l d2,d6
	move.l	d3,d7
    7320:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    7322:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7324:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    7326:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7328:	b387           	eor.l d1,d7
	and.l	d5,d6
    732a:	cc85           	and.l d5,d6
	and.l	d5,d7
    732c:	ce85           	and.l d5,d7
	eor.l	d6,d0
    732e:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7330:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    7332:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7334:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    7336:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7338:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    733a:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7340:	2c01           	move.l d1,d6
	move.l	d3,d7
    7342:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7344:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    7346:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7348:	b186           	eor.l d0,d6
	eor.l	d2,d7
    734a:	b587           	eor.l d2,d7
	bra	.start1
    734c:	6000 0088      	bra.w 73d6 <.start1>

00007350 <.x1>:
.x1:
	move.l	(a0)+,d0
    7350:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    7352:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7354:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    7356:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    7358:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    735c:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    7362:	c084           	and.l d4,d0
	and.l	d4,d1
    7364:	c284           	and.l d4,d1
	and.l	d4,d2
    7366:	c484           	and.l d4,d2
	and.l	d4,d3
    7368:	c684           	and.l d4,d3
	lsl.l	#4,d0
    736a:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    736c:	e989           	lsl.l #4,d1
	or.l	d2,d0
    736e:	8082           	or.l d2,d0
	or.l	d3,d1
    7370:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    7372:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7374:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    7376:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7378:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    737a:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    737e:	c484           	and.l d4,d2
	and.l	d4,d6
    7380:	cc84           	and.l d4,d6
	and.l	d4,d3
    7382:	c684           	and.l d4,d3
	and.l	d4,d7
    7384:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    7386:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    7388:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    738a:	8486           	or.l d6,d2
	or.l	d7,d3
    738c:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    738e:	3c02           	move.w d2,d6
	move.w	d3,d7
    7390:	3e03           	move.w d3,d7
	move.w	d0,d2
    7392:	3400           	move.w d0,d2
	move.w	d1,d3
    7394:	3601           	move.w d1,d3
	swap	d2
    7396:	4842           	swap d2
	swap	d3
    7398:	4843           	swap d3
	move.w	d2,d0
    739a:	3002           	move.w d2,d0
	move.w	d3,d1
    739c:	3203           	move.w d3,d1
	move.w	d6,d2
    739e:	3406           	move.w d6,d2
	move.w	d7,d3
    73a0:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    73a2:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    73a6:	2c02           	move.l d2,d6
	move.l	d3,d7
    73a8:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    73aa:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    73ac:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    73ae:	b186           	eor.l d0,d6
	eor.l	d1,d7
    73b0:	b387           	eor.l d1,d7
	and.l	d5,d6
    73b2:	cc85           	and.l d5,d6
	and.l	d5,d7
    73b4:	ce85           	and.l d5,d7
	eor.l	d6,d0
    73b6:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    73b8:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    73ba:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    73bc:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    73be:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    73c0:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    73c2:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    73c8:	2c01           	move.l d1,d6
	move.l	d3,d7
    73ca:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    73cc:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    73ce:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    73d0:	b186           	eor.l d0,d6
	eor.l	d2,d7
    73d2:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    73d4:	22cd           	move.l a5,(a1)+

000073d6 <.start1>:
.start1:
	and.l	d4,d6
    73d6:	cc84           	and.l d4,d6
	and.l	d4,d7
    73d8:	ce84           	and.l d4,d7
	eor.l	d6,d0
    73da:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    73dc:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    73de:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    73e0:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    73e2:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    73e4:	bf83           	eor.l d7,d3

	move.l	a6,d4
    73e6:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    73e8:	2c01           	move.l d1,d6
	move.l	d3,d7
    73ea:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    73ec:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    73ee:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    73f0:	b186           	eor.l d0,d6
	eor.l	d2,d7
    73f2:	b587           	eor.l d2,d7
	and.l	d4,d6
    73f4:	cc84           	and.l d4,d6
	and.l	d4,d7
    73f6:	ce84           	and.l d4,d7
	eor.l	d6,d0
    73f8:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    73fa:	bf82           	eor.l d7,d2
	add.l	d6,d6
    73fc:	dc86           	add.l d6,d6
	add.l	d7,d7
    73fe:	de87           	add.l d7,d7
	eor.l	d1,d6
    7400:	b386           	eor.l d1,d6
	eor.l	d3,d7
    7402:	b787           	eor.l d3,d7

	move.l	d0,a4
    7404:	2840           	movea.l d0,a4
	move.l	d2,a5
    7406:	2a42           	movea.l d2,a5
	move.l	d6,a3
    7408:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    740a:	b5c8           	cmpa.l a0,a2
	bne	.x1
    740c:	6600 ff42      	bne.w 7350 <.x1>
	move.l	d7,-BPLSIZE(a1)
    7410:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    7414:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    7418:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    741c:	22cd           	move.l a5,(a1)+

	movem.l	(sp)+,a0-a1
    741e:	4cdf 0300      	movem.l (sp)+,a0-a1
	add.l	#BPLSIZE*4,a1
    7422:	d3fc 0000 afe0 	adda.l #45024,a1

	move.l	(a0)+,d0
    7428:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    742a:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    742c:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    742e:	2618           	move.l (a0)+,d3

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    7430:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    7436:	c084           	and.l d4,d0
	and.l	d4,d1
    7438:	c284           	and.l d4,d1
	and.l	d4,d2
    743a:	c484           	and.l d4,d2
	and.l	d4,d3
    743c:	c684           	and.l d4,d3
	lsr.l	#4,d2
    743e:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    7440:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    7442:	8082           	or.l d2,d0
	or.l	d3,d1
    7444:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    7446:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7448:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    744a:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    744c:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    744e:	c484           	and.l d4,d2
	and.l	d4,d6
    7450:	cc84           	and.l d4,d6
	and.l	d4,d3
    7452:	c684           	and.l d4,d3
	and.l	d4,d7
    7454:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    7456:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    7458:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    745a:	8486           	or.l d6,d2
	or.l	d7,d3
    745c:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    745e:	3c02           	move.w d2,d6
	move.w	d3,d7
    7460:	3e03           	move.w d3,d7
	move.w	d0,d2
    7462:	3400           	move.w d0,d2
	move.w	d1,d3
    7464:	3601           	move.w d1,d3
	swap	d2
    7466:	4842           	swap d2
	swap	d3
    7468:	4843           	swap d3
	move.w	d2,d0
    746a:	3002           	move.w d2,d0
	move.w	d3,d1
    746c:	3203           	move.w d3,d1
	move.w	d6,d2
    746e:	3406           	move.w d6,d2
	move.w	d7,d3
    7470:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    7472:	2c02           	move.l d2,d6
	move.l	d3,d7
    7474:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    7476:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7478:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    747a:	b186           	eor.l d0,d6
	eor.l	d1,d7
    747c:	b387           	eor.l d1,d7
	and.l	d5,d6
    747e:	cc85           	and.l d5,d6
	and.l	d5,d7
    7480:	ce85           	and.l d5,d7
	eor.l	d6,d0
    7482:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7484:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    7486:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7488:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    748a:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    748c:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    748e:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7494:	2c01           	move.l d1,d6
	move.l	d3,d7
    7496:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7498:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    749a:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    749c:	b186           	eor.l d0,d6
	eor.l	d2,d7
    749e:	b587           	eor.l d2,d7
	bra	.start2
    74a0:	6000 0088      	bra.w 752a <.start2>

000074a4 <.x2>:
.x2:
	move.l	(a0)+,d0
    74a4:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    74a6:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    74a8:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    74aa:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    74ac:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    74b0:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    74b6:	c084           	and.l d4,d0
	and.l	d4,d1
    74b8:	c284           	and.l d4,d1
	and.l	d4,d2
    74ba:	c484           	and.l d4,d2
	and.l	d4,d3
    74bc:	c684           	and.l d4,d3
	lsr.l	#4,d2
    74be:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    74c0:	e88b           	lsr.l #4,d3
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
	move.l	a3,BPLSIZE(a1)
    74ce:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    74d2:	c484           	and.l d4,d2
	and.l	d4,d6
    74d4:	cc84           	and.l d4,d6
	and.l	d4,d3
    74d6:	c684           	and.l d4,d3
	and.l	d4,d7
    74d8:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    74da:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    74dc:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    74de:	8486           	or.l d6,d2
	or.l	d7,d3
    74e0:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    74e2:	3c02           	move.w d2,d6
	move.w	d3,d7
    74e4:	3e03           	move.w d3,d7
	move.w	d0,d2
    74e6:	3400           	move.w d0,d2
	move.w	d1,d3
    74e8:	3601           	move.w d1,d3
	swap	d2
    74ea:	4842           	swap d2
	swap	d3
    74ec:	4843           	swap d3
	move.w	d2,d0
    74ee:	3002           	move.w d2,d0
	move.w	d3,d1
    74f0:	3203           	move.w d3,d1
	move.w	d6,d2
    74f2:	3406           	move.w d6,d2
	move.w	d7,d3
    74f4:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    74f6:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    74fa:	2c02           	move.l d2,d6
	move.l	d3,d7
    74fc:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    74fe:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7500:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    7502:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7504:	b387           	eor.l d1,d7
	and.l	d5,d6
    7506:	cc85           	and.l d5,d6
	and.l	d5,d7
    7508:	ce85           	and.l d5,d7
	eor.l	d6,d0
    750a:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    750c:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    750e:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7510:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    7512:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7514:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    7516:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    751c:	2c01           	move.l d1,d6
	move.l	d3,d7
    751e:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7520:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    7522:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7524:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7526:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    7528:	22cd           	move.l a5,(a1)+

0000752a <.start2>:
.start2:
	and.l	d4,d6
    752a:	cc84           	and.l d4,d6
	and.l	d4,d7
    752c:	ce84           	and.l d4,d7
	eor.l	d6,d0
    752e:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7530:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    7532:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    7534:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    7536:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    7538:	bf83           	eor.l d7,d3

	move.l	a6,d4
    753a:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    753c:	2c01           	move.l d1,d6
	move.l	d3,d7
    753e:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    7540:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    7542:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    7544:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7546:	b587           	eor.l d2,d7
	and.l	d4,d6
    7548:	cc84           	and.l d4,d6
	and.l	d4,d7
    754a:	ce84           	and.l d4,d7
	eor.l	d6,d0
    754c:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    754e:	bf82           	eor.l d7,d2
	add.l	d6,d6
    7550:	dc86           	add.l d6,d6
	add.l	d7,d7
    7552:	de87           	add.l d7,d7
	eor.l	d1,d6
    7554:	b386           	eor.l d1,d6
	eor.l	d3,d7
    7556:	b787           	eor.l d3,d7

	move.l	d0,a4
    7558:	2840           	movea.l d0,a4
	move.l	d2,a5
    755a:	2a42           	movea.l d2,a5
	move.l	d6,a3
    755c:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    755e:	b5c8           	cmpa.l a0,a2
	bne	.x2
    7560:	6600 ff42      	bne.w 74a4 <.x2>
	move.l	d7,-BPLSIZE(a1)
    7564:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    7568:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    756c:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    7570:	22cd           	move.l a5,(a1)+

00007572 <.none>:
.none:
	movem.l .c2p_saveregs,d0-d7/a0-a6
    7572:	4cfa 7fff 0004 	movem.l 757a <.c2p_saveregs>(pc),d0-a6
	rts
    7578:	4e75           	rts

0000757a <.c2p_saveregs>:
	...

000075b6 <c2p1x1_8_c5_gen_scroffs>:
    75b6:	0000 0001      	ori.b #1,d0

000075ba <c2p1x1_8_c5_gen_pixels>:

.c2p_saveregs: .dcb.b 60


c2p1x1_8_c5_gen_scroffs: dc.l	1
    75ba:	0000 0001      	ori.b #1,d0
