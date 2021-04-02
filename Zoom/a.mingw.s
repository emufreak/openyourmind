
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
       2:	203c 0000 a642 	move.l #42562,d0
       8:	0480 0000 a642 	subi.l #42562,d0
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
      22:	41f9 0000 a642 	lea a642 <__fini_array_end>,a0
      28:	2071 8800      	movea.l (0,a1,a0.l),a0
      2c:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      2e:	52af 0004      	addq.l #1,4(sp)
      32:	202f 0004      	move.l 4(sp),d0
      36:	b097           	cmp.l (sp),d0
      38:	65de           	bcs.s 18 <_start+0x18>

	count = __init_array_end - __init_array_start;
      3a:	203c 0000 a642 	move.l #42562,d0
      40:	0480 0000 a642 	subi.l #42562,d0
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
      5a:	41f9 0000 a642 	lea a642 <__fini_array_end>,a0
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
      78:	203c 0000 a642 	move.l #42562,d0
      7e:	0480 0000 a642 	subi.l #42562,d0
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
      9a:	41f9 0000 a642 	lea a642 <__fini_array_end>,a0
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
      b6:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
      bc:	3f68 0002 0002 	move.w 2(a0),2(sp)
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
      c2:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
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
      e6:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
      ec:	6722           	beq.s 110 <FreeDisplay+0x30>
      ee:	2f79 004d 2c40 	move.l 4d2c40 <Copperlist1>,16(sp)
      f4:	0010 
      f6:	2f6f 0018 000c 	move.l 24(sp),12(sp)
      fc:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
     102:	2c40           	movea.l d0,a6
     104:	226f 0010      	movea.l 16(sp),a1
     108:	202f 000c      	move.l 12(sp),d0
     10c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     110:	2039 004d 2c44 	move.l 4d2c44 <Copperlist2>,d0
     116:	6722           	beq.s 13a <FreeDisplay+0x5a>
     118:	2f79 004d 2c44 	move.l 4d2c44 <Copperlist2>,8(sp)
     11e:	0008 
     120:	2f6f 0018 0004 	move.l 24(sp),4(sp)
     126:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
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
     146:	2039 004d 2c48 	move.l 4d2c48 <DrawBuffer>,d0
     14c:	4240           	clr.w d0
     14e:	4840           	swap d0
     150:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     154:	2039 004d 2c48 	move.l 4d2c48 <DrawBuffer>,d0
     15a:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     15e:	2f79 004d 2c50 	move.l 4d2c50 <DrawCopper>,4(sp)
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
     17e:	2039 004d 2c48 	move.l 4d2c48 <DrawBuffer>,d0
     184:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     186:	2039 004d 2c4c 	move.l 4d2c4c <ViewBuffer>,d0
     18c:	23c0 004d 2c48 	move.l d0,4d2c48 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     192:	2017           	move.l (sp),d0
     194:	23c0 004d 2c4c 	move.l d0,4d2c4c <ViewBuffer>
}
     19a:	4fef 000c      	lea 12(sp),sp
     19e:	4e75           	rts

000001a0 <SwapCl>:

void SwapCl() {
     1a0:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     1a2:	2039 004d 2c50 	move.l 4d2c50 <DrawCopper>,d0
     1a8:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     1aa:	2039 004d 2c54 	move.l 4d2c54 <ViewCopper>,d0
     1b0:	23c0 004d 2c50 	move.l d0,4d2c50 <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     1b6:	2017           	move.l (sp),d0
     1b8:	23c0 004d 2c54 	move.l d0,4d2c54 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     1be:	2039 004d 2c54 	move.l 4d2c54 <ViewCopper>,d0
     1c4:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
     1ca:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     1ce:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
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
     2a6:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
     2ac:	317c 0020 009c 	move.w #32,156(a0)
     2b2:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
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
     2c2:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
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
     2e2:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
     2e8:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     2ee:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
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
     42e:	0681 0000 a95c 	addi.l #43356,d1
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
     4c2:	2079 004d 2c5c 	movea.l 4d2c5c <SysBase>,a0
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
     4e6:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
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
     514:	2079 004d 2c74 	movea.l 4d2c74 <VBR>,a0
     51a:	41e8 006c      	lea 108(a0),a0
     51e:	20af 0004      	move.l 4(sp),(a0)
}
     522:	4e75           	rts

00000524 <GetInterruptHandler>:

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     524:	2079 004d 2c74 	movea.l 4d2c74 <VBR>,a0
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
     57e:	23c0 004d 2c74 	move.l d0,4d2c74 <VBR>
	SystemIrq=GetInterruptHandler(); //store interrupt register
     584:	4eba ff9e      	jsr 524 <GetInterruptHandler>(pc)
     588:	23c0 004d 2c78 	move.l d0,4d2c78 <SystemIrq>
}
     58e:	4e75           	rts

00000590 <FreeSystem>:

	//restore interrupts
	//SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
     590:	2079 004d 2c68 	movea.l 4d2c68 <GfxBase>,a0
     596:	2028 0026      	move.l 38(a0),d0
     59a:	2079 004d 2c60 	movea.l 4d2c60 <custom>,a0
     5a0:	2140 0080      	move.l d0,128(a0)
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
     5a4:	2079 004d 2c68 	movea.l 4d2c68 <GfxBase>,a0
     5aa:	2028 0032      	move.l 50(a0),d0
     5ae:	2079 004d 2c60 	movea.l 4d2c60 <custom>,a0
     5b4:	2140 0084      	move.l d0,132(a0)
	custom->copjmp1=0x7fff; //start coppper
     5b8:	2079 004d 2c60 	movea.l 4d2c60 <custom>,a0
     5be:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
     5c4:	3039 004d 2c6e 	move.w 4d2c6e <SystemInts>,d0
     5ca:	2079 004d 2c60 	movea.l 4d2c60 <custom>,a0
     5d0:	0040 8000      	ori.w #-32768,d0
     5d4:	3140 009a      	move.w d0,154(a0)
	custom->dmacon=SystemDMA|0x8000;
     5d8:	3039 004d 2c70 	move.w 4d2c70 <SystemDMA>,d0
     5de:	2079 004d 2c60 	movea.l 4d2c60 <custom>,a0
     5e4:	0040 8000      	ori.w #-32768,d0
     5e8:	3140 0096      	move.w d0,150(a0)
	custom->adkcon=SystemADKCON|0x8000;
     5ec:	3039 004d 2c72 	move.w 4d2c72 <SystemADKCON>,d0
     5f2:	2079 004d 2c60 	movea.l 4d2c60 <custom>,a0
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
     606:	2079 004d 2c60 	movea.l 4d2c60 <custom>,a0
     60c:	317c 0020 009c 	move.w #32,156(a0)
     612:	2079 004d 2c60 	movea.l 4d2c60 <custom>,a0
     618:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	frameCounter++;
     61e:	3039 004d 2c80 	move.w 4d2c80 <frameCounter>,d0
     624:	5240           	addq.w #1,d0
     626:	33c0 004d 2c80 	move.w d0,4d2c80 <frameCounter>
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
     646:	23c0 004d 2c5c 	move.l d0,4d2c5c <SysBase>
	hw = (struct Custom*)0xdff000;
     64c:	23fc 00df f000 	move.l #14675968,4d2c58 <hw>
     652:	004d 2c58 

	SysBase = *((struct ExecBase**)4UL);
     656:	307c 0004      	movea.w #4,a0
     65a:	2010           	move.l (a0),d0
     65c:	23c0 004d 2c5c 	move.l d0,4d2c5c <SysBase>
	custom = (struct Custom*)0xdff000;
     662:	23fc 00df f000 	move.l #14675968,4d2c60 <custom>
     668:	004d 2c60 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
     66c:	2f7c 0000 75ee 	move.l #30190,68(sp)
     672:	0044 
     674:	42af 0040      	clr.l 64(sp)
     678:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
     67e:	2c40           	movea.l d0,a6
     680:	226f 0044      	movea.l 68(sp),a1
     684:	202f 0040      	move.l 64(sp),d0
     688:	4eae fdd8      	jsr -552(a6)
     68c:	2f40 003c      	move.l d0,60(sp)
     690:	202f 003c      	move.l 60(sp),d0
     694:	23c0 004d 2c68 	move.l d0,4d2c68 <GfxBase>
	if (!GfxBase)
     69a:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
     6a0:	6614           	bne.s 6b6 <main+0x84>
		Exit(0);
     6a2:	42af 0038      	clr.l 56(sp)
     6a6:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     6ac:	2c40           	movea.l d0,a6
     6ae:	222f 0038      	move.l 56(sp),d1
     6b2:	4eae ff70      	jsr -144(a6)

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     6b6:	2f7c 0000 75ff 	move.l #30207,52(sp)
     6bc:	0034 
     6be:	42af 0030      	clr.l 48(sp)
     6c2:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
     6c8:	2c40           	movea.l d0,a6
     6ca:	226f 0034      	movea.l 52(sp),a1
     6ce:	202f 0030      	move.l 48(sp),d0
     6d2:	4eae fdd8      	jsr -552(a6)
     6d6:	2f40 002c      	move.l d0,44(sp)
     6da:	202f 002c      	move.l 44(sp),d0
     6de:	23c0 004d 2c64 	move.l d0,4d2c64 <DOSBase>
	if (!DOSBase)
     6e4:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     6ea:	6614           	bne.s 700 <main+0xce>
		Exit(0);
     6ec:	42af 0028      	clr.l 40(sp)
     6f0:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     6f6:	2c40           	movea.l d0,a6
     6f8:	222f 0028      	move.l 40(sp),d1
     6fc:	4eae ff70      	jsr -144(a6)

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
     700:	4879 0000 760b 	pea 760b <c2p1x1_8_c5_gen_pixels+0x21>
     706:	4eba 67d8      	jsr 6ee0 <KPrintF>(pc)
     70a:	588f           	addq.l #4,sp
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
     70c:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     712:	2c40           	movea.l d0,a6
     714:	4eae ffc4      	jsr -60(a6)
     718:	2f40 0024      	move.l d0,36(sp)
     71c:	202f 0024      	move.l 36(sp),d0
     720:	2f40 0020      	move.l d0,32(sp)
     724:	2f7c 0000 7627 	move.l #30247,28(sp)
     72a:	001c 
     72c:	700f           	moveq #15,d0
     72e:	2f40 0018      	move.l d0,24(sp)
     732:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     738:	2c40           	movea.l d0,a6
     73a:	222f 0020      	move.l 32(sp),d1
     73e:	242f 001c      	move.l 28(sp),d2
     742:	262f 0018      	move.l 24(sp),d3
     746:	4eae ffd0      	jsr -48(a6)
     74a:	2f40 0014      	move.l d0,20(sp)
	Delay(50);
     74e:	7032           	moveq #50,d0
     750:	2f40 0010      	move.l d0,16(sp)
     754:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
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
     76c:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
     772:	317c 87ff 0096 	move.w #-30721,150(a0)
	//c2p();
  	Zoom_InitRun();
     778:	4eba 093e      	jsr 10b8 <Zoom_InitRun>(pc)

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
     7a6:	4eba 0ba8      	jsr 1350 <Zoom_Dealloc>(pc)
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
     7c8:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
     7ce:	4878 0010      	pea 10 <_start+0x10>
     7d2:	4879 0000 a6c4 	pea a6c4 <ClsSprites>
     7d8:	42a7           	clr.l -(sp)
     7da:	2f00           	move.l d0,-(sp)
     7dc:	4eba 2024      	jsr 2802 <TestCopperlistBatch>(pc)
     7e0:	4fef 0010      	lea 16(sp),sp
     7e4:	4a80           	tst.l d0
     7e6:	6642           	bne.s 82a <SwScrollerTest+0x6e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     7e8:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     7ee:	2c40           	movea.l d0,a6
     7f0:	4eae ffc4      	jsr -60(a6)
     7f4:	2f40 0070      	move.l d0,112(sp)
     7f8:	202f 0070      	move.l 112(sp),d0
     7fc:	2f40 006c      	move.l d0,108(sp)
     800:	2f7c 0000 7648 	move.l #30280,104(sp)
     806:	0068 
     808:	702c           	moveq #44,d0
     80a:	2f40 0064      	move.l d0,100(sp)
     80e:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     814:	2c40           	movea.l d0,a6
     816:	222f 006c      	move.l 108(sp),d1
     81a:	242f 0068      	move.l 104(sp),d2
     81e:	262f 0064      	move.l 100(sp),d3
     822:	4eae ffd0      	jsr -48(a6)
     826:	2f40 0060      	move.l d0,96(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     82a:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
     830:	4878 000c      	pea c <_start+0xc>
     834:	4879 0000 a704 	pea a704 <ClScreen>
     83a:	4878 0010      	pea 10 <_start+0x10>
     83e:	2f00           	move.l d0,-(sp)
     840:	4eba 1fc0      	jsr 2802 <TestCopperlistBatch>(pc)
     844:	4fef 0010      	lea 16(sp),sp
     848:	4a80           	tst.l d0
     84a:	6642           	bne.s 88e <SwScrollerTest+0xd2>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     84c:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     852:	2c40           	movea.l d0,a6
     854:	4eae ffc4      	jsr -60(a6)
     858:	2f40 005c      	move.l d0,92(sp)
     85c:	202f 005c      	move.l 92(sp),d0
     860:	2f40 0058      	move.l d0,88(sp)
     864:	2f7c 0000 767e 	move.l #30334,84(sp)
     86a:	0054 
     86c:	7036           	moveq #54,d0
     86e:	2f40 0050      	move.l d0,80(sp)
     872:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     878:	2c40           	movea.l d0,a6
     87a:	222f 0058      	move.l 88(sp),d1
     87e:	242f 0054      	move.l 84(sp),d2
     882:	262f 0050      	move.l 80(sp),d3
     886:	4eae ffd0      	jsr -48(a6)
     88a:	2f40 004c      	move.l d0,76(sp)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     88e:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
     894:	4878 0002      	pea 2 <_start+0x2>
     898:	4879 0000 a644 	pea a644 <ClColor>
     89e:	4878 001e      	pea 1e <_start+0x1e>
     8a2:	2f00           	move.l d0,-(sp)
     8a4:	4eba 1f5c      	jsr 2802 <TestCopperlistBatch>(pc)
     8a8:	4fef 0010      	lea 16(sp),sp
     8ac:	4a80           	tst.l d0
     8ae:	6642           	bne.s 8f2 <SwScrollerTest+0x136>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     8b0:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     8b6:	2c40           	movea.l d0,a6
     8b8:	4eae ffc4      	jsr -60(a6)
     8bc:	2f40 0048      	move.l d0,72(sp)
     8c0:	202f 0048      	move.l 72(sp),d0
     8c4:	2f40 0044      	move.l d0,68(sp)
     8c8:	2f7c 0000 76b5 	move.l #30389,64(sp)
     8ce:	0040 
     8d0:	7021           	moveq #33,d0
     8d2:	2f40 003c      	move.l d0,60(sp)
     8d6:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     8dc:	2c40           	movea.l d0,a6
     8de:	222f 0044      	move.l 68(sp),d1
     8e2:	242f 0040      	move.l 64(sp),d2
     8e6:	262f 003c      	move.l 60(sp),d3
     8ea:	4eae ffd0      	jsr -48(a6)
     8ee:	2f40 0038      	move.l d0,56(sp)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     8f2:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
     8f8:	4878 fffe      	pea fffffffe <_end+0xffb2d34e>
     8fc:	4878 0020      	pea 20 <_start+0x20>
     900:	2f00           	move.l d0,-(sp)
     902:	4eba 1f3c      	jsr 2840 <TestCopperlistPos>(pc)
     906:	4fef 000c      	lea 12(sp),sp
     90a:	4a80           	tst.l d0
     90c:	6642           	bne.s 950 <SwScrollerTest+0x194>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     90e:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     914:	2c40           	movea.l d0,a6
     916:	4eae ffc4      	jsr -60(a6)
     91a:	2f40 0034      	move.l d0,52(sp)
     91e:	202f 0034      	move.l 52(sp),d0
     922:	2f40 0030      	move.l d0,48(sp)
     926:	2f7c 0000 76d7 	move.l #30423,44(sp)
     92c:	002c 
     92e:	7022           	moveq #34,d0
     930:	2f40 0028      	move.l d0,40(sp)
     934:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     93a:	2c40           	movea.l d0,a6
     93c:	222f 0030      	move.l 48(sp),d1
     940:	242f 002c      	move.l 44(sp),d2
     944:	262f 0028      	move.l 40(sp),d3
     948:	4eae ffd0      	jsr -48(a6)
     94c:	2f40 0024      	move.l d0,36(sp)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     950:	2239 0000 b880 	move.l b880 <sw_text>,d1
     956:	2039 004d 2c48 	move.l 4d2c48 <DrawBuffer>,d0
     95c:	2f01           	move.l d1,-(sp)
     95e:	2f00           	move.l d0,-(sp)
     960:	4879 0000 b884 	pea b884 <sw_testfont>
     966:	4eba 0380      	jsr ce8 <WriteFont>(pc)
     96a:	4fef 000c      	lea 12(sp),sp

  UWORD *tstpointer = (UWORD *)DrawBuffer;
     96e:	2f79 004d 2c48 	move.l 4d2c48 <DrawBuffer>,32(sp)
     974:	0020 
  if( *tstpointer != 0xff00)
     976:	206f 0020      	movea.l 32(sp),a0
     97a:	3010           	move.w (a0),d0
     97c:	0c40 ff00      	cmpi.w #-256,d0
     980:	6742           	beq.s 9c4 <SwScrollerTest+0x208>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     982:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     988:	2c40           	movea.l d0,a6
     98a:	4eae ffc4      	jsr -60(a6)
     98e:	2f40 001c      	move.l d0,28(sp)
     992:	202f 001c      	move.l 28(sp),d0
     996:	2f40 0018      	move.l d0,24(sp)
     99a:	2f7c 0000 76fa 	move.l #30458,20(sp)
     9a0:	0014 
     9a2:	7031           	moveq #49,d0
     9a4:	2f40 0010      	move.l d0,16(sp)
     9a8:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
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
     9ea:	23c0 004d 2c40 	move.l d0,4d2c40 <Copperlist1>
  Copperlist2 = ClbuildSW();
     9f0:	4eba 0174      	jsr b66 <ClbuildSW>(pc)
     9f4:	23c0 004d 2c44 	move.l d0,4d2c44 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     9fa:	2f7c 0000 c800 	move.l #51200,80(sp)
     a00:	0050 
     a02:	7002           	moveq #2,d0
     a04:	2f40 004c      	move.l d0,76(sp)
     a08:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
     a0e:	2c40           	movea.l d0,a6
     a10:	202f 0050      	move.l 80(sp),d0
     a14:	222f 004c      	move.l 76(sp),d1
     a18:	4eae ff3a      	jsr -198(a6)
     a1c:	2f40 0048      	move.l d0,72(sp)
     a20:	202f 0048      	move.l 72(sp),d0
     a24:	23c0 004d 2c38 	move.l d0,4d2c38 <Bitplane1>
  if(Bitplane1 == 0) {
     a2a:	2039 004d 2c38 	move.l 4d2c38 <Bitplane1>,d0
     a30:	6658           	bne.s a8a <PrepareDisplaySW+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     a32:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     a38:	2c40           	movea.l d0,a6
     a3a:	4eae ffc4      	jsr -60(a6)
     a3e:	2f40 0044      	move.l d0,68(sp)
     a42:	202f 0044      	move.l 68(sp),d0
     a46:	2f40 0040      	move.l d0,64(sp)
     a4a:	2f7c 0000 7cdd 	move.l #31965,60(sp)
     a50:	003c 
     a52:	7026           	moveq #38,d0
     a54:	2f40 0038      	move.l d0,56(sp)
     a58:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     a5e:	2c40           	movea.l d0,a6
     a60:	222f 0040      	move.l 64(sp),d1
     a64:	242f 003c      	move.l 60(sp),d2
     a68:	262f 0038      	move.l 56(sp),d3
     a6c:	4eae ffd0      	jsr -48(a6)
     a70:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
     a74:	7001           	moveq #1,d0
     a76:	2f40 0030      	move.l d0,48(sp)
     a7a:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     a80:	2c40           	movea.l d0,a6
     a82:	222f 0030      	move.l 48(sp),d1
     a86:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
     a8a:	2039 004d 2c38 	move.l 4d2c38 <Bitplane1>,d0
     a90:	23c0 004d 2c48 	move.l d0,4d2c48 <DrawBuffer>
  DrawCopper = Copperlist1;
     a96:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
     a9c:	23c0 004d 2c50 	move.l d0,4d2c50 <DrawCopper>
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     aa2:	2f7c 0000 c800 	move.l #51200,44(sp)
     aa8:	002c 
     aaa:	7002           	moveq #2,d0
     aac:	2f40 0028      	move.l d0,40(sp)
     ab0:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
     ab6:	2c40           	movea.l d0,a6
     ab8:	202f 002c      	move.l 44(sp),d0
     abc:	222f 0028      	move.l 40(sp),d1
     ac0:	4eae ff3a      	jsr -198(a6)
     ac4:	2f40 0024      	move.l d0,36(sp)
     ac8:	202f 0024      	move.l 36(sp),d0
     acc:	23c0 004d 2c3c 	move.l d0,4d2c3c <Bitplane2>
  if(Bitplane2 == 0) {
     ad2:	2039 004d 2c3c 	move.l 4d2c3c <Bitplane2>,d0
     ad8:	6658           	bne.s b32 <PrepareDisplaySW+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     ada:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     ae0:	2c40           	movea.l d0,a6
     ae2:	4eae ffc4      	jsr -60(a6)
     ae6:	2f40 0020      	move.l d0,32(sp)
     aea:	202f 0020      	move.l 32(sp),d0
     aee:	2f40 001c      	move.l d0,28(sp)
     af2:	2f7c 0000 7d04 	move.l #32004,24(sp)
     af8:	0018 
     afa:	7026           	moveq #38,d0
     afc:	2f40 0014      	move.l d0,20(sp)
     b00:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     b06:	2c40           	movea.l d0,a6
     b08:	222f 001c      	move.l 28(sp),d1
     b0c:	242f 0018      	move.l 24(sp),d2
     b10:	262f 0014      	move.l 20(sp),d3
     b14:	4eae ffd0      	jsr -48(a6)
     b18:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     b1c:	7001           	moveq #1,d0
     b1e:	2f40 000c      	move.l d0,12(sp)
     b22:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     b28:	2c40           	movea.l d0,a6
     b2a:	222f 000c      	move.l 12(sp),d1
     b2e:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
     b32:	2039 004d 2c3c 	move.l 4d2c3c <Bitplane2>,d0
     b38:	23c0 004d 2c4c 	move.l d0,4d2c4c <ViewBuffer>
  ViewCopper = Copperlist2;
     b3e:	2039 004d 2c44 	move.l 4d2c44 <Copperlist2>,d0
     b44:	23c0 004d 2c54 	move.l d0,4d2c54 <ViewCopper>
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
     b7c:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
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
     b9e:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     ba4:	2c40           	movea.l d0,a6
     ba6:	4eae ffc4      	jsr -60(a6)
     baa:	2f40 0020      	move.l d0,32(sp)
     bae:	202f 0020      	move.l 32(sp),d0
     bb2:	2f40 001c      	move.l d0,28(sp)
     bb6:	2f7c 0000 7d2b 	move.l #32043,24(sp)
     bbc:	0018 
     bbe:	7228           	moveq #40,d1
     bc0:	2f41 0014      	move.l d1,20(sp)
     bc4:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     bca:	2c40           	movea.l d0,a6
     bcc:	222f 001c      	move.l 28(sp),d1
     bd0:	242f 0018      	move.l 24(sp),d2
     bd4:	262f 0014      	move.l 20(sp),d3
     bd8:	4eae ffd0      	jsr -48(a6)
     bdc:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     be0:	7401           	moveq #1,d2
     be2:	2f42 000c      	move.l d2,12(sp)
     be6:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
     bec:	2c40           	movea.l d0,a6
     bee:	222f 000c      	move.l 12(sp),d1
     bf2:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
     bf6:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
     bfc:	2f7c 0000 a6c4 	move.l #42692,64(sp)
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
     c36:	2f7c 0000 a704 	move.l #42756,64(sp)
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
     c98:	2f7c 0000 a644 	move.l #42564,64(sp)
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
     d64:	2439 004d 2c48 	move.l 4d2c48 <DrawBuffer>,d2
     d6a:	2639 0000 b8d8 	move.l b8d8 <rawzoom>,d3
     d70:	2039 0000 b8dc 	move.l b8dc <Zoom_Pic>,d0
     d76:	2f3c 0000 dbd8 	move.l #56280,-(sp)
     d7c:	2f00           	move.l d0,-(sp)
     d7e:	4eb9 0000 7144 	jsr 7144 <__mulsi3>
     d84:	508f           	addq.l #8,sp
     d86:	d083           	add.l d3,d0
     d88:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x24c>
     d8c:	2f02           	move.l d2,-(sp)
     d8e:	2f00           	move.l d0,-(sp)
     d90:	4eba f44c      	jsr 1de <Utils_CopyMem>(pc)
     d94:	4fef 000c      	lea 12(sp),sp
  Zoom_Pic++;
     d98:	2039 0000 b8dc 	move.l b8dc <Zoom_Pic>,d0
     d9e:	5280           	addq.l #1,d0
     da0:	23c0 0000 b8dc 	move.l d0,b8dc <Zoom_Pic>
  if(Zoom_Pic == 87 ) {
     da6:	2039 0000 b8dc 	move.l b8dc <Zoom_Pic>,d0
     dac:	7257           	moveq #87,d1
     dae:	b280           	cmp.l d0,d1
     db0:	6608           	bne.s dba <Zoom_Run+0x5a>
    Zoom_Pic = 11;
     db2:	700b           	moveq #11,d0
     db4:	23c0 0000 b8dc 	move.l d0,b8dc <Zoom_Pic>
  }
}
     dba:	241f           	move.l (sp)+,d2
     dbc:	261f           	move.l (sp)+,d3
     dbe:	4e75           	rts

00000dc0 <Zoom_VblankHandler>:

void Zoom_VblankHandler() {

  Zoom_Counter++;
     dc0:	3039 004d 2c98 	move.w 4d2c98 <Zoom_Counter>,d0
     dc6:	5240           	addq.w #1,d0
     dc8:	33c0 004d 2c98 	move.w d0,4d2c98 <Zoom_Counter>
  SwapCl();
     dce:	4eba f3d0      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     dd2:	33fc 0001 004d 	move.w #1,4d2c9e <Zoom_MouseReleased>
     dd8:	2c9e 
  if( MouseLeft())
     dda:	4eba f486      	jsr 262 <MouseLeft>(pc)
     dde:	4a40           	tst.w d0
     de0:	6708           	beq.s dea <Zoom_VblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     de2:	33fc 0001 004d 	move.w #1,4d2ca0 <Zoom_Mousepressed>
     de8:	2ca0 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     dea:	3039 004d 2ca0 	move.w 4d2ca0 <Zoom_Mousepressed>,d0
     df0:	0c40 0001      	cmpi.w #1,d0
     df4:	6616           	bne.s e0c <Zoom_VblankHandler+0x4c>
     df6:	4eba f46a      	jsr 262 <MouseLeft>(pc)
     dfa:	4a40           	tst.w d0
     dfc:	660e           	bne.s e0c <Zoom_VblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     dfe:	33fc 0001 004d 	move.w #1,4d2c9e <Zoom_MouseReleased>
     e04:	2c9e 
    Zoom_Mousepressed = 0;
     e06:	4279 004d 2ca0 	clr.w 4d2ca0 <Zoom_Mousepressed>
  }
      
      Zoom_MouseReleased = 0;
     e0c:	4279 004d 2c9e 	clr.w 4d2c9e <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom <= 2) {
     e12:	3039 004d 2ca6 	move.w 4d2ca6 <Zoom_LevelOf102Zoom>,d0
     e18:	0c40 0002      	cmpi.w #2,d0
     e1c:	622e           	bhi.s e4c <Zoom_VblankHandler+0x8c>
 
        if( Zoom_LevelOfZoom == 87)
     e1e:	3039 004d 2ca4 	move.w 4d2ca4 <Zoom_LevelOfZoom>,d0
     e24:	0c40 0057      	cmpi.w #87,d0
     e28:	660a           	bne.s e34 <Zoom_VblankHandler+0x74>
          Zoom_LevelOfZoom = 0;
     e2a:	33fc 0000 004d 	move.w #0,4d2ca4 <Zoom_LevelOfZoom>
     e30:	2ca4 
     e32:	600e           	bra.s e42 <Zoom_VblankHandler+0x82>
        else
          Zoom_LevelOfZoom++;
     e34:	3039 004d 2ca4 	move.w 4d2ca4 <Zoom_LevelOfZoom>,d0
     e3a:	5240           	addq.w #1,d0
     e3c:	33c0 004d 2ca4 	move.w d0,4d2ca4 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     e42:	33fc 000f 004d 	move.w #15,4d2ca6 <Zoom_LevelOf102Zoom>
     e48:	2ca6 
     e4a:	600e           	bra.s e5a <Zoom_VblankHandler+0x9a>
        //Zoom_SwapBuffers(  Zoom_LevelOfZoom);
      } else 
        Zoom_LevelOf102Zoom-=2;
     e4c:	3039 004d 2ca6 	move.w 4d2ca6 <Zoom_LevelOf102Zoom>,d0
     e52:	5540           	subq.w #2,d0
     e54:	33c0 004d 2ca6 	move.w d0,4d2ca6 <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     e5a:	2239 004d 2c50 	move.l 4d2c50 <DrawCopper>,d1
     e60:	3039 004d 2ca6 	move.w 4d2ca6 <Zoom_LevelOf102Zoom>,d0
     e66:	3000           	move.w d0,d0
     e68:	0280 0000 ffff 	andi.l #65535,d0
     e6e:	2f01           	move.l d1,-(sp)
     e70:	2f00           	move.l d0,-(sp)
     e72:	4eba f598      	jsr 40c <Zoom_Shrink102>(pc)
     e76:	508f           	addq.l #8,sp
  //Zoom_SetBplPointers(ViewBuffer, DrawCopper);
 
}
     e78:	4e75           	rts

00000e7a <Zoom_ReverseVblankHandler>:


void Zoom_ReverseVblankHandler() {
  
  Zoom_Counter++;
     e7a:	3039 004d 2c98 	move.w 4d2c98 <Zoom_Counter>,d0
     e80:	5240           	addq.w #1,d0
     e82:	33c0 004d 2c98 	move.w d0,4d2c98 <Zoom_Counter>
  SwapCl();
     e88:	4eba f316      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     e8c:	33fc 0001 004d 	move.w #1,4d2c9e <Zoom_MouseReleased>
     e92:	2c9e 
  if( MouseLeft())
     e94:	4eba f3cc      	jsr 262 <MouseLeft>(pc)
     e98:	4a40           	tst.w d0
     e9a:	6708           	beq.s ea4 <Zoom_ReverseVblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     e9c:	33fc 0001 004d 	move.w #1,4d2ca0 <Zoom_Mousepressed>
     ea2:	2ca0 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     ea4:	3039 004d 2ca0 	move.w 4d2ca0 <Zoom_Mousepressed>,d0
     eaa:	0c40 0001      	cmpi.w #1,d0
     eae:	6616           	bne.s ec6 <Zoom_ReverseVblankHandler+0x4c>
     eb0:	4eba f3b0      	jsr 262 <MouseLeft>(pc)
     eb4:	4a40           	tst.w d0
     eb6:	660e           	bne.s ec6 <Zoom_ReverseVblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     eb8:	33fc 0001 004d 	move.w #1,4d2c9e <Zoom_MouseReleased>
     ebe:	2c9e 
    Zoom_Mousepressed = 0;
     ec0:	4279 004d 2ca0 	clr.w 4d2ca0 <Zoom_Mousepressed>
    /*if( MouseLeft()) {
      while (MouseLeft())
      {
      }*/
      
      Zoom_MouseReleased = 0;
     ec6:	4279 004d 2c9e 	clr.w 4d2c9e <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 15) {
     ecc:	3039 004d 2ca6 	move.w 4d2ca6 <Zoom_LevelOf102Zoom>,d0
     ed2:	0c40 000f      	cmpi.w #15,d0
     ed6:	6640           	bne.s f18 <Zoom_ReverseVblankHandler+0x9e>
 
        if( Zoom_LevelOfZoom == 0)
     ed8:	3039 004d 2ca4 	move.w 4d2ca4 <Zoom_LevelOfZoom>,d0
     ede:	660a           	bne.s eea <Zoom_ReverseVblankHandler+0x70>
          Zoom_LevelOfZoom = 17;
     ee0:	33fc 0011 004d 	move.w #17,4d2ca4 <Zoom_LevelOfZoom>
     ee6:	2ca4 
     ee8:	600e           	bra.s ef8 <Zoom_ReverseVblankHandler+0x7e>
        else
          Zoom_LevelOfZoom--;
     eea:	3039 004d 2ca4 	move.w 4d2ca4 <Zoom_LevelOfZoom>,d0
     ef0:	5340           	subq.w #1,d0
     ef2:	33c0 004d 2ca4 	move.w d0,4d2ca4 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 0;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     ef8:	33fc 0000 004d 	move.w #0,4d2ca6 <Zoom_LevelOf102Zoom>
     efe:	2ca6 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     f00:	3039 004d 2ca4 	move.w 4d2ca4 <Zoom_LevelOfZoom>,d0
     f06:	3000           	move.w d0,d0
     f08:	0280 0000 ffff 	andi.l #65535,d0
     f0e:	2f00           	move.l d0,-(sp)
     f10:	4eba 0fda      	jsr 1eec <Zoom_SwapBuffers>(pc)
     f14:	588f           	addq.l #4,sp
     f16:	600e           	bra.s f26 <Zoom_ReverseVblankHandler+0xac>
      } else 
        Zoom_LevelOf102Zoom++;
     f18:	3039 004d 2ca6 	move.w 4d2ca6 <Zoom_LevelOf102Zoom>,d0
     f1e:	5240           	addq.w #1,d0
     f20:	33c0 004d 2ca6 	move.w d0,4d2ca6 <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     f26:	2239 004d 2c50 	move.l 4d2c50 <DrawCopper>,d1
     f2c:	3039 004d 2ca6 	move.w 4d2ca6 <Zoom_LevelOf102Zoom>,d0
     f32:	3000           	move.w d0,d0
     f34:	0280 0000 ffff 	andi.l #65535,d0
     f3a:	2f01           	move.l d1,-(sp)
     f3c:	2f00           	move.l d0,-(sp)
     f3e:	4eba f4cc      	jsr 40c <Zoom_Shrink102>(pc)
     f42:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     f44:	2239 004d 2c50 	move.l 4d2c50 <DrawCopper>,d1
     f4a:	2039 004d 2c4c 	move.l 4d2c4c <ViewBuffer>,d0
     f50:	2f01           	move.l d1,-(sp)
     f52:	2f00           	move.l d0,-(sp)
     f54:	4eba 0efe      	jsr 1e54 <Zoom_SetBplPointers>(pc)
     f58:	508f           	addq.l #8,sp
 
}
     f5a:	4e75           	rts

00000f5c <Zoom_LoadImage>:

void Zoom_LoadImage( ULONG *destination) {  
     f5c:	4fef fff4      	lea -12(sp),sp
     f60:	2f0e           	move.l a6,-(sp)
  CopyMem( rawzoom, destination, ZMBPLSIZE);
     f62:	2f79 0000 b8d8 	move.l b8d8 <rawzoom>,12(sp)
     f68:	000c 
     f6a:	2f6f 0014 0008 	move.l 20(sp),8(sp)
     f70:	2f7c 0000 df20 	move.l #57120,4(sp)
     f76:	0004 
     f78:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
     f7e:	2c40           	movea.l d0,a6
     f80:	206f 000c      	movea.l 12(sp),a0
     f84:	226f 0008      	movea.l 8(sp),a1
     f88:	202f 0004      	move.l 4(sp),d0
     f8c:	4eae fd90      	jsr -624(a6)
}
     f90:	2c5f           	movea.l (sp)+,a6
     f92:	4fef 000c      	lea 12(sp),sp
     f96:	4e75           	rts

00000f98 <Zoom_CopyWord>:

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080008, 
                                                       0x010a0000, 0x01001200 };

void  Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height) {  
     f98:	598f           	subq.l #4,sp
     f9a:	202f 0010      	move.l 16(sp),d0
     f9e:	3000           	move.w d0,d0
     fa0:	3f40 0002      	move.w d0,2(sp)

  WaitBlt();
     fa4:	4eba f10e      	jsr b4 <WaitBlt>(pc)

  hw->bltapt = (UWORD *) source;
     fa8:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
     fae:	216f 0008 0050 	move.l 8(sp),80(a0)
  hw->bltdpt = (UWORD *) destination;
     fb4:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
     fba:	216f 000c 0054 	move.l 12(sp),84(a0)
  hw->bltsize = (height<<6)+2;
     fc0:	302f 0002      	move.w 2(sp),d0
     fc4:	ed48           	lsl.w #6,d0
     fc6:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
     fcc:	5440           	addq.w #2,d0
     fce:	3140 0058      	move.w d0,88(a0)

}
     fd2:	588f           	addq.l #4,sp
     fd4:	4e75           	rts

00000fd6 <Zoom_ZoomBlit>:

void Zoom_ZoomBlit( UWORD *source, UWORD *destination, UWORD height) {
     fd6:	518f           	subq.l #8,sp
     fd8:	202f 0014      	move.l 20(sp),d0
     fdc:	3000           	move.w d0,d0
     fde:	3f40 0002      	move.w d0,2(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B

  UWORD *blta = source + ZoomBlit_Increment4SrcA;
     fe2:	3039 004d 2c8e 	move.w 4d2c8e <ZoomBlit_Increment4SrcA>,d0
     fe8:	3000           	move.w d0,d0
     fea:	0280 0000 ffff 	andi.l #65535,d0
     ff0:	d080           	add.l d0,d0
     ff2:	222f 000c      	move.l 12(sp),d1
     ff6:	d280           	add.l d0,d1
     ff8:	2f41 0004      	move.l d1,4(sp)
  WaitBlt();
     ffc:	4eba f0b6      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  
  hw->bltapt = blta;
    1000:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    1006:	216f 0004 0050 	move.l 4(sp),80(a0)
  hw->bltbpt = source;
    100c:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    1012:	216f 000c 004c 	move.l 12(sp),76(a0)
  hw->bltdpt = destination;
    1018:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    101e:	216f 0010 0054 	move.l 16(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    1024:	302f 0002      	move.w 2(sp),d0
    1028:	ed48           	lsl.w #6,d0
    102a:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    1030:	5440           	addq.w #2,d0
    1032:	3140 0058      	move.w d0,88(a0)

}
    1036:	508f           	addq.l #8,sp
    1038:	4e75           	rts

0000103a <Zoom_ZoomBlit2>:

void Zoom_ZoomBlit2( UWORD *src4a, UWORD *src4b, UWORD *dst, UWORD height,
                                                 UWORD bltamod, UWORD bltbmod
                                                        , UWORD numofwords) {
    103a:	518f           	subq.l #8,sp
    103c:	226f 0018      	movea.l 24(sp),a1
    1040:	206f 001c      	movea.l 28(sp),a0
    1044:	222f 0020      	move.l 32(sp),d1
    1048:	202f 0024      	move.l 36(sp),d0
    104c:	3249           	movea.w a1,a1
    104e:	3f49 0006      	move.w a1,6(sp)
    1052:	3048           	movea.w a0,a0
    1054:	3f48 0004      	move.w a0,4(sp)
    1058:	3201           	move.w d1,d1
    105a:	3f41 0002      	move.w d1,2(sp)
    105e:	3000           	move.w d0,d0
    1060:	3e80           	move.w d0,(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B
  hw->bltamod = bltamod;
    1062:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    1068:	316f 0004 0064 	move.w 4(sp),100(a0)
  hw->bltbmod = bltbmod;  
    106e:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    1074:	316f 0002 0062 	move.w 2(sp),98(a0)
  hw->bltapt = src4a;
    107a:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    1080:	216f 000c 0050 	move.l 12(sp),80(a0)
  hw->bltbpt = src4b;
    1086:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    108c:	216f 0010 004c 	move.l 16(sp),76(a0)
  hw->bltdpt = dst;
    1092:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    1098:	216f 0014 0054 	move.l 20(sp),84(a0)
  hw->bltsize = (height<<6)+numofwords;
    109e:	302f 0006      	move.w 6(sp),d0
    10a2:	ed48           	lsl.w #6,d0
    10a4:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    10aa:	d057           	add.w (sp),d0
    10ac:	3140 0058      	move.w d0,88(a0)
  
  WaitBlt();
    10b0:	4eba f002      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a  

}
    10b4:	508f           	addq.l #8,sp
    10b6:	4e75           	rts

000010b8 <Zoom_InitRun>:


void Zoom_InitRun() {
    10b8:	4fef ffe0      	lea -32(sp),sp
    10bc:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    10be:	4279 004d 2c98 	clr.w 4d2c98 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    10c4:	7004           	moveq #4,d0
    10c6:	2f40 0020      	move.l d0,32(sp)
    10ca:	7002           	moveq #2,d0
    10cc:	2f40 001c      	move.l d0,28(sp)
    10d0:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    10d6:	2c40           	movea.l d0,a6
    10d8:	202f 0020      	move.l 32(sp),d0
    10dc:	222f 001c      	move.l 28(sp),d1
    10e0:	4eae ff3a      	jsr -198(a6)
    10e4:	2f40 0018      	move.l d0,24(sp)
    10e8:	202f 0018      	move.l 24(sp),d0
    10ec:	23c0 004d 2c86 	move.l d0,4d2c86 <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 15;
    10f2:	33fc 000f 004d 	move.w #15,4d2ca6 <Zoom_LevelOf102Zoom>
    10f8:	2ca6 
  ZoomHorizontal = 16;
    10fa:	33fc 0010 004d 	move.w #16,4d2caa <ZoomHorizontal>
    1100:	2caa 
  Zoom_PrepareDisplay();
    1102:	4eba 0288      	jsr 138c <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 15, Copperlist1);
    1106:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    110c:	2f00           	move.l d0,-(sp)
    110e:	4878 000f      	pea f <_start+0xf>
    1112:	4eba f2f8      	jsr 40c <Zoom_Shrink102>(pc)
    1116:	508f           	addq.l #8,sp
  Zoom_Shrink102( 15, Copperlist2);
    1118:	2039 004d 2c44 	move.l 4d2c44 <Copperlist2>,d0
    111e:	2f00           	move.l d0,-(sp)
    1120:	4878 000f      	pea f <_start+0xf>
    1124:	4eba f2e6      	jsr 40c <Zoom_Shrink102>(pc)
    1128:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 1;
    112a:	33fc 0001 004d 	move.w #1,4d2ca4 <Zoom_LevelOfZoom>
    1130:	2ca4 
  Zoom_Direction = 1;                                                  
    1132:	33fc 0001 004d 	move.w #1,4d2ca8 <Zoom_Direction>
    1138:	2ca8 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    113a:	7016           	moveq #22,d0
    113c:	2f40 0014      	move.l d0,20(sp)
    1140:	2f7c 0001 0001 	move.l #65537,16(sp)
    1146:	0010 
    1148:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    114e:	2c40           	movea.l d0,a6
    1150:	202f 0014      	move.l 20(sp),d0
    1154:	222f 0010      	move.l 16(sp),d1
    1158:	4eae ff3a      	jsr -198(a6)
    115c:	2f40 000c      	move.l d0,12(sp)
    1160:	202f 000c      	move.l 12(sp),d0
    1164:	23c0 004d 2c90 	move.l d0,4d2c90 <Zoom_vbint>
    116a:	2039 004d 2c90 	move.l 4d2c90 <Zoom_vbint>,d0
    1170:	673e           	beq.s 11b0 <Zoom_InitRun+0xf8>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1172:	2079 004d 2c90 	movea.l 4d2c90 <Zoom_vbint>,a0
    1178:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    117e:	2079 004d 2c90 	movea.l 4d2c90 <Zoom_vbint>,a0
    1184:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    118a:	2079 004d 2c90 	movea.l 4d2c90 <Zoom_vbint>,a0
    1190:	217c 0000 7d51 	move.l #32081,10(a0)
    1196:	000a 
    Zoom_vbint->is_Data = NULL;
    1198:	2079 004d 2c90 	movea.l 4d2c90 <Zoom_vbint>,a0
    119e:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    11a2:	2079 004d 2c90 	movea.l 4d2c90 <Zoom_vbint>,a0
    11a8:	217c 0000 0dc0 	move.l #3520,18(a0)
    11ae:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    11b0:	7005           	moveq #5,d0
    11b2:	2f40 0008      	move.l d0,8(sp)
    11b6:	2f79 004d 2c90 	move.l 4d2c90 <Zoom_vbint>,4(sp)
    11bc:	0004 
    11be:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    11c4:	2c40           	movea.l d0,a6
    11c6:	202f 0008      	move.l 8(sp),d0
    11ca:	226f 0004      	movea.l 4(sp),a1
    11ce:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    11d2:	2239 004d 2c54 	move.l 4d2c54 <ViewCopper>,d1
    11d8:	2039 004d 2c4c 	move.l 4d2c4c <ViewBuffer>,d0
    11de:	2f01           	move.l d1,-(sp)
    11e0:	2f00           	move.l d0,-(sp)
    11e2:	4eba 0c70      	jsr 1e54 <Zoom_SetBplPointers>(pc)
    11e6:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    11e8:	2239 004d 2c50 	move.l 4d2c50 <DrawCopper>,d1
    11ee:	2039 004d 2c4c 	move.l 4d2c4c <ViewBuffer>,d0
    11f4:	2f01           	move.l d1,-(sp)
    11f6:	2f00           	move.l d0,-(sp)
    11f8:	4eba 0c5a      	jsr 1e54 <Zoom_SetBplPointers>(pc)
    11fc:	508f           	addq.l #8,sp
  SwapCl();
    11fe:	4eba efa0      	jsr 1a0 <SwapCl>(pc)
  
}
    1202:	2c5f           	movea.l (sp)+,a6
    1204:	4fef 0020      	lea 32(sp),sp
    1208:	4e75           	rts

0000120a <Zoom_InitRunReverse>:

void Zoom_InitRunReverse() {
    120a:	4fef ffe0      	lea -32(sp),sp
    120e:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    1210:	4279 004d 2c98 	clr.w 4d2c98 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    1216:	7004           	moveq #4,d0
    1218:	2f40 0020      	move.l d0,32(sp)
    121c:	7002           	moveq #2,d0
    121e:	2f40 001c      	move.l d0,28(sp)
    1222:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    1228:	2c40           	movea.l d0,a6
    122a:	202f 0020      	move.l 32(sp),d0
    122e:	222f 001c      	move.l 28(sp),d1
    1232:	4eae ff3a      	jsr -198(a6)
    1236:	2f40 0018      	move.l d0,24(sp)
    123a:	202f 0018      	move.l 24(sp),d0
    123e:	23c0 004d 2c86 	move.l d0,4d2c86 <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 0;
    1244:	33fc 0000 004d 	move.w #0,4d2ca6 <Zoom_LevelOf102Zoom>
    124a:	2ca6 
  ZoomHorizontal = 16;
    124c:	33fc 0010 004d 	move.w #16,4d2caa <ZoomHorizontal>
    1252:	2caa 
  Zoom_PrepareDisplay();
    1254:	4eba 0136      	jsr 138c <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 0, Copperlist1);
    1258:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    125e:	2f00           	move.l d0,-(sp)
    1260:	42a7           	clr.l -(sp)
    1262:	4eba f1a8      	jsr 40c <Zoom_Shrink102>(pc)
    1266:	508f           	addq.l #8,sp
  Zoom_Shrink102( 0, Copperlist2);
    1268:	2039 004d 2c44 	move.l 4d2c44 <Copperlist2>,d0
    126e:	2f00           	move.l d0,-(sp)
    1270:	42a7           	clr.l -(sp)
    1272:	4eba f198      	jsr 40c <Zoom_Shrink102>(pc)
    1276:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 17;
    1278:	33fc 0011 004d 	move.w #17,4d2ca4 <Zoom_LevelOfZoom>
    127e:	2ca4 
                                                  
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    1280:	7016           	moveq #22,d0
    1282:	2f40 0014      	move.l d0,20(sp)
    1286:	2f7c 0001 0001 	move.l #65537,16(sp)
    128c:	0010 
    128e:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    1294:	2c40           	movea.l d0,a6
    1296:	202f 0014      	move.l 20(sp),d0
    129a:	222f 0010      	move.l 16(sp),d1
    129e:	4eae ff3a      	jsr -198(a6)
    12a2:	2f40 000c      	move.l d0,12(sp)
    12a6:	202f 000c      	move.l 12(sp),d0
    12aa:	23c0 004d 2c90 	move.l d0,4d2c90 <Zoom_vbint>
    12b0:	2039 004d 2c90 	move.l 4d2c90 <Zoom_vbint>,d0
    12b6:	673e           	beq.s 12f6 <Zoom_InitRunReverse+0xec>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    12b8:	2079 004d 2c90 	movea.l 4d2c90 <Zoom_vbint>,a0
    12be:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    12c4:	2079 004d 2c90 	movea.l 4d2c90 <Zoom_vbint>,a0
    12ca:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    12d0:	2079 004d 2c90 	movea.l 4d2c90 <Zoom_vbint>,a0
    12d6:	217c 0000 7d51 	move.l #32081,10(a0)
    12dc:	000a 
    Zoom_vbint->is_Data = NULL;
    12de:	2079 004d 2c90 	movea.l 4d2c90 <Zoom_vbint>,a0
    12e4:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_ReverseVblankHandler;
    12e8:	2079 004d 2c90 	movea.l 4d2c90 <Zoom_vbint>,a0
    12ee:	217c 0000 0e7a 	move.l #3706,18(a0)
    12f4:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    12f6:	7005           	moveq #5,d0
    12f8:	2f40 0008      	move.l d0,8(sp)
    12fc:	2f79 004d 2c90 	move.l 4d2c90 <Zoom_vbint>,4(sp)
    1302:	0004 
    1304:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    130a:	2c40           	movea.l d0,a6
    130c:	202f 0008      	move.l 8(sp),d0
    1310:	226f 0004      	movea.l 4(sp),a1
    1314:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    1318:	2239 004d 2c54 	move.l 4d2c54 <ViewCopper>,d1
    131e:	2039 004d 2c4c 	move.l 4d2c4c <ViewBuffer>,d0
    1324:	2f01           	move.l d1,-(sp)
    1326:	2f00           	move.l d0,-(sp)
    1328:	4eba 0b2a      	jsr 1e54 <Zoom_SetBplPointers>(pc)
    132c:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    132e:	2239 004d 2c50 	move.l 4d2c50 <DrawCopper>,d1
    1334:	2039 004d 2c4c 	move.l 4d2c4c <ViewBuffer>,d0
    133a:	2f01           	move.l d1,-(sp)
    133c:	2f00           	move.l d0,-(sp)
    133e:	4eba 0b14      	jsr 1e54 <Zoom_SetBplPointers>(pc)
    1342:	508f           	addq.l #8,sp
  SwapCl();
    1344:	4eba ee5a      	jsr 1a0 <SwapCl>(pc)
  
}
    1348:	2c5f           	movea.l (sp)+,a6
    134a:	4fef 0020      	lea 32(sp),sp
    134e:	4e75           	rts

00001350 <Zoom_Dealloc>:

void Zoom_Dealloc() {
    1350:	518f           	subq.l #8,sp
    1352:	2f0e           	move.l a6,-(sp)
  RemIntServer(INTB_VERTB, Zoom_vbint);
    1354:	7005           	moveq #5,d0
    1356:	2f40 0008      	move.l d0,8(sp)
    135a:	2f79 004d 2c90 	move.l 4d2c90 <Zoom_vbint>,4(sp)
    1360:	0004 
    1362:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    1368:	2c40           	movea.l d0,a6
    136a:	202f 0008      	move.l 8(sp),d0
    136e:	226f 0004      	movea.l 4(sp),a1
    1372:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    1376:	2f3c 0000 df20 	move.l #57120,-(sp)
    137c:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    1380:	4eba ed5e      	jsr e0 <FreeDisplay>(pc)
    1384:	508f           	addq.l #8,sp
}
    1386:	2c5f           	movea.l (sp)+,a6
    1388:	508f           	addq.l #8,sp
    138a:	4e75           	rts

0000138c <Zoom_PrepareDisplay>:
  
int Zoom_PrepareDisplay() {
    138c:	4fef ffe8      	lea -24(sp),sp
    1390:	2f0e           	move.l a6,-(sp)
  ViewBuffer = AllocVec(268*42*5, MEMF_CHIP);  
    1392:	2f7c 0000 dbd8 	move.l #56280,24(sp)
    1398:	0018 
    139a:	7002           	moveq #2,d0
    139c:	2f40 0014      	move.l d0,20(sp)
    13a0:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    13a6:	2c40           	movea.l d0,a6
    13a8:	202f 0018      	move.l 24(sp),d0
    13ac:	222f 0014      	move.l 20(sp),d1
    13b0:	4eae fd54      	jsr -684(a6)
    13b4:	2f40 0010      	move.l d0,16(sp)
    13b8:	202f 0010      	move.l 16(sp),d0
    13bc:	23c0 004d 2c4c 	move.l d0,4d2c4c <ViewBuffer>
  DrawBuffer = AllocVec(268*42*5, MEMF_CHIP);
    13c2:	2f7c 0000 dbd8 	move.l #56280,12(sp)
    13c8:	000c 
    13ca:	7002           	moveq #2,d0
    13cc:	2f40 0008      	move.l d0,8(sp)
    13d0:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    13d6:	2c40           	movea.l d0,a6
    13d8:	202f 000c      	move.l 12(sp),d0
    13dc:	222f 0008      	move.l 8(sp),d1
    13e0:	4eae fd54      	jsr -684(a6)
    13e4:	2f40 0004      	move.l d0,4(sp)
    13e8:	202f 0004      	move.l 4(sp),d0
    13ec:	23c0 004d 2c48 	move.l d0,4d2c48 <DrawBuffer>
  Utils_CopyMem( rawzoom, ViewBuffer, 14070);
    13f2:	2239 004d 2c4c 	move.l 4d2c4c <ViewBuffer>,d1
    13f8:	2039 0000 b8d8 	move.l b8d8 <rawzoom>,d0
    13fe:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x24c>
    1402:	2f01           	move.l d1,-(sp)
    1404:	2f00           	move.l d0,-(sp)
    1406:	4eba edd6      	jsr 1de <Utils_CopyMem>(pc)
    140a:	4fef 000c      	lea 12(sp),sp
  Utils_CopyMem( rawzoom, DrawBuffer, 14070);
    140e:	2239 004d 2c48 	move.l 4d2c48 <DrawBuffer>,d1
    1414:	2039 0000 b8d8 	move.l b8d8 <rawzoom>,d0
    141a:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x24c>
    141e:	2f01           	move.l d1,-(sp)
    1420:	2f00           	move.l d0,-(sp)
    1422:	4eba edba      	jsr 1de <Utils_CopyMem>(pc)
    1426:	4fef 000c      	lea 12(sp),sp
  //Zoom_SwapBuffers( 0);
  Copperlist1 = ClbuildZoom( );
    142a:	4eba 0080      	jsr 14ac <ClbuildZoom>(pc)
    142e:	23c0 004d 2c40 	move.l d0,4d2c40 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    1434:	4eba 0076      	jsr 14ac <ClbuildZoom>(pc)
    1438:	23c0 004d 2c44 	move.l d0,4d2c44 <Copperlist2>
  if(Bitplane2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;*/
  DrawCopper = Copperlist1;
    143e:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    1444:	23c0 004d 2c50 	move.l d0,4d2c50 <DrawCopper>
  ViewCopper = Copperlist2;
    144a:	2039 004d 2c44 	move.l 4d2c44 <Copperlist2>,d0
    1450:	23c0 004d 2c54 	move.l d0,4d2c54 <ViewCopper>
  return 0;
    1456:	7000           	moveq #0,d0
}
    1458:	2c5f           	movea.l (sp)+,a6
    145a:	4fef 0018      	lea 24(sp),sp
    145e:	4e75           	rts

00001460 <Zoom_Init>:

void Zoom_Init() {
    1460:	4fef fff4      	lea -12(sp),sp
    1464:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    1466:	7004           	moveq #4,d0
    1468:	2f40 000c      	move.l d0,12(sp)
    146c:	7002           	moveq #2,d0
    146e:	2f40 0008      	move.l d0,8(sp)
    1472:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    1478:	2c40           	movea.l d0,a6
    147a:	202f 000c      	move.l 12(sp),d0
    147e:	222f 0008      	move.l 8(sp),d1
    1482:	4eae ff3a      	jsr -198(a6)
    1486:	2f40 0004      	move.l d0,4(sp)
    148a:	202f 0004      	move.l 4(sp),d0
    148e:	23c0 004d 2c86 	move.l d0,4d2c86 <Zoom_ZoomBlitMask>
  ZoomHorizontal = 16;
    1494:	33fc 0010 004d 	move.w #16,4d2caa <ZoomHorizontal>
    149a:	2caa 
  Zoom_LevelOf102Zoom = 15;
    149c:	33fc 000f 004d 	move.w #15,4d2ca6 <Zoom_LevelOf102Zoom>
    14a2:	2ca6 
}
    14a4:	2c5f           	movea.l (sp)+,a6
    14a6:	4fef 000c      	lea 12(sp),sp
    14aa:	4e75           	rts

000014ac <ClbuildZoom>:


ULONG * ClbuildZoom() {
    14ac:	4fef ffac      	lea -84(sp),sp
    14b0:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    14b4:	2f7c 0000 031c 	move.l #796,68(sp)
    14ba:	0044 
    14bc:	7002           	moveq #2,d0
    14be:	2f40 0040      	move.l d0,64(sp)
    14c2:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    14c8:	2c40           	movea.l d0,a6
    14ca:	202f 0044      	move.l 68(sp),d0
    14ce:	222f 0040      	move.l 64(sp),d1
    14d2:	4eae ff3a      	jsr -198(a6)
    14d6:	2f40 003c      	move.l d0,60(sp)
    14da:	202f 003c      	move.l 60(sp),d0
    14de:	2f40 0038      	move.l d0,56(sp)
  
  if( retval == 0) {
    14e2:	6658           	bne.s 153c <ClbuildZoom+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    14e4:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    14ea:	2c40           	movea.l d0,a6
    14ec:	4eae ffc4      	jsr -60(a6)
    14f0:	2f40 0034      	move.l d0,52(sp)
    14f4:	202f 0034      	move.l 52(sp),d0
    14f8:	2f40 0030      	move.l d0,48(sp)
    14fc:	2f7c 0000 7d2b 	move.l #32043,44(sp)
    1502:	002c 
    1504:	7228           	moveq #40,d1
    1506:	2f41 0028      	move.l d1,40(sp)
    150a:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    1510:	2c40           	movea.l d0,a6
    1512:	222f 0030      	move.l 48(sp),d1
    1516:	242f 002c      	move.l 44(sp),d2
    151a:	262f 0028      	move.l 40(sp),d3
    151e:	4eae ffd0      	jsr -48(a6)
    1522:	2f40 0024      	move.l d0,36(sp)
    Exit(1);
    1526:	7401           	moveq #1,d2
    1528:	2f42 0020      	move.l d2,32(sp)
    152c:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    1532:	2c40           	movea.l d0,a6
    1534:	222f 0020      	move.l 32(sp),d1
    1538:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    153c:	2f6f 0038 005c 	move.l 56(sp),92(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    1542:	2f7c 0000 a6c4 	move.l #42692,88(sp)
    1548:	0058 
  for(int i=0; i<16;i++)
    154a:	42af 0054      	clr.l 84(sp)
    154e:	6024           	bra.s 1574 <ClbuildZoom+0xc8>
    *cl++ = *clpartinstruction++;
    1550:	222f 0058      	move.l 88(sp),d1
    1554:	2001           	move.l d1,d0
    1556:	5880           	addq.l #4,d0
    1558:	2f40 0058      	move.l d0,88(sp)
    155c:	202f 005c      	move.l 92(sp),d0
    1560:	2400           	move.l d0,d2
    1562:	5882           	addq.l #4,d2
    1564:	2f42 005c      	move.l d2,92(sp)
    1568:	2041           	movea.l d1,a0
    156a:	2210           	move.l (a0),d1
    156c:	2040           	movea.l d0,a0
    156e:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    1570:	52af 0054      	addq.l #1,84(sp)
    1574:	700f           	moveq #15,d0
    1576:	b0af 0054      	cmp.l 84(sp),d0
    157a:	6cd4           	bge.s 1550 <ClbuildZoom+0xa4>
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
    157c:	2f7c 0000 a704 	move.l #42756,88(sp)
    1582:	0058 
  for(int i=0; i<12;i++)
    1584:	42af 0050      	clr.l 80(sp)
    1588:	6024           	bra.s 15ae <ClbuildZoom+0x102>
    *cl++ = *clpartinstruction++;
    158a:	222f 0058      	move.l 88(sp),d1
    158e:	2401           	move.l d1,d2
    1590:	5882           	addq.l #4,d2
    1592:	2f42 0058      	move.l d2,88(sp)
    1596:	202f 005c      	move.l 92(sp),d0
    159a:	2400           	move.l d0,d2
    159c:	5882           	addq.l #4,d2
    159e:	2f42 005c      	move.l d2,92(sp)
    15a2:	2041           	movea.l d1,a0
    15a4:	2210           	move.l (a0),d1
    15a6:	2040           	movea.l d0,a0
    15a8:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    15aa:	52af 0050      	addq.l #1,80(sp)
    15ae:	700b           	moveq #11,d0
    15b0:	b0af 0050      	cmp.l 80(sp),d0
    15b4:	6cd4           	bge.s 158a <ClbuildZoom+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    15b6:	202f 005c      	move.l 92(sp),d0
    15ba:	2200           	move.l d0,d1
    15bc:	5881           	addq.l #4,d1
    15be:	2f41 005c      	move.l d1,92(sp)
    15c2:	2040           	movea.l d0,a0
    15c4:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    15ca:	202f 005c      	move.l 92(sp),d0
    15ce:	2200           	move.l d0,d1
    15d0:	5881           	addq.l #4,d1
    15d2:	2f41 005c      	move.l d1,92(sp)
    15d6:	2040           	movea.l d0,a0
    15d8:	20bc 00e2 0000 	move.l #14811136,(a0)
  *cl++ = 0x00e40000;
    15de:	202f 005c      	move.l 92(sp),d0
    15e2:	2200           	move.l d0,d1
    15e4:	5881           	addq.l #4,d1
    15e6:	2f41 005c      	move.l d1,92(sp)
    15ea:	2040           	movea.l d0,a0
    15ec:	20bc 00e4 0000 	move.l #14942208,(a0)
  *cl++ = 0x00e60000;
    15f2:	202f 005c      	move.l 92(sp),d0
    15f6:	2200           	move.l d0,d1
    15f8:	5881           	addq.l #4,d1
    15fa:	2f41 005c      	move.l d1,92(sp)
    15fe:	2040           	movea.l d0,a0
    1600:	20bc 00e6 0000 	move.l #15073280,(a0)
  *cl++ = 0x00e80000;
    1606:	202f 005c      	move.l 92(sp),d0
    160a:	2200           	move.l d0,d1
    160c:	5881           	addq.l #4,d1
    160e:	2f41 005c      	move.l d1,92(sp)
    1612:	2040           	movea.l d0,a0
    1614:	20bc 00e8 0000 	move.l #15204352,(a0)
  *cl++ = 0x00ea0000;
    161a:	202f 005c      	move.l 92(sp),d0
    161e:	2200           	move.l d0,d1
    1620:	5881           	addq.l #4,d1
    1622:	2f41 005c      	move.l d1,92(sp)
    1626:	2040           	movea.l d0,a0
    1628:	20bc 00ea 0000 	move.l #15335424,(a0)
  *cl++ = 0x00ec0000;
    162e:	202f 005c      	move.l 92(sp),d0
    1632:	2200           	move.l d0,d1
    1634:	5881           	addq.l #4,d1
    1636:	2f41 005c      	move.l d1,92(sp)
    163a:	2040           	movea.l d0,a0
    163c:	20bc 00ec 0000 	move.l #15466496,(a0)
  *cl++ = 0x00ee0000;
    1642:	202f 005c      	move.l 92(sp),d0
    1646:	2200           	move.l d0,d1
    1648:	5881           	addq.l #4,d1
    164a:	2f41 005c      	move.l d1,92(sp)
    164e:	2040           	movea.l d0,a0
    1650:	20bc 00ee 0000 	move.l #15597568,(a0)
  *cl++ = 0x00f00000;
    1656:	202f 005c      	move.l 92(sp),d0
    165a:	2200           	move.l d0,d1
    165c:	5881           	addq.l #4,d1
    165e:	2f41 005c      	move.l d1,92(sp)
    1662:	2040           	movea.l d0,a0
    1664:	20bc 00f0 0000 	move.l #15728640,(a0)
  *cl++ = 0x00f20000;
    166a:	202f 005c      	move.l 92(sp),d0
    166e:	2200           	move.l d0,d1
    1670:	5881           	addq.l #4,d1
    1672:	2f41 005c      	move.l d1,92(sp)
    1676:	2040           	movea.l d0,a0
    1678:	20bc 00f2 0000 	move.l #15859712,(a0)

  clpartinstruction = ClColor;
    167e:	2f7c 0000 a644 	move.l #42564,88(sp)
    1684:	0058 
  for(int i=0; i<32;i++)
    1686:	42af 004c      	clr.l 76(sp)
    168a:	6024           	bra.s 16b0 <ClbuildZoom+0x204>
    *cl++ = *clpartinstruction++;
    168c:	222f 0058      	move.l 88(sp),d1
    1690:	2001           	move.l d1,d0
    1692:	5880           	addq.l #4,d0
    1694:	2f40 0058      	move.l d0,88(sp)
    1698:	202f 005c      	move.l 92(sp),d0
    169c:	2400           	move.l d0,d2
    169e:	5882           	addq.l #4,d2
    16a0:	2f42 005c      	move.l d2,92(sp)
    16a4:	2041           	movea.l d1,a0
    16a6:	2210           	move.l (a0),d1
    16a8:	2040           	movea.l d0,a0
    16aa:	2081           	move.l d1,(a0)
  for(int i=0; i<32;i++)
    16ac:	52af 004c      	addq.l #1,76(sp)
    16b0:	701f           	moveq #31,d0
    16b2:	b0af 004c      	cmp.l 76(sp),d0
    16b6:	6cd4           	bge.s 168c <ClbuildZoom+0x1e0>
  
  ULONG cop2 = cl+3;
    16b8:	700c           	moveq #12,d0
    16ba:	d0af 005c      	add.l 92(sp),d0
    16be:	2f40 001c      	move.l d0,28(sp)
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    16c2:	202f 001c      	move.l 28(sp),d0
    16c6:	4240           	clr.w d0
    16c8:	4840           	swap d0
    16ca:	2200           	move.l d0,d1
    16cc:	0681 0084 0000 	addi.l #8650752,d1
    16d2:	2f41 0018      	move.l d1,24(sp)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    16d6:	202f 001c      	move.l 28(sp),d0
    16da:	0280 0000 ffff 	andi.l #65535,d0
    16e0:	2400           	move.l d0,d2
    16e2:	0682 0086 0000 	addi.l #8781824,d2
    16e8:	2f42 0014      	move.l d2,20(sp)
  //clpartinstruction = Cl102ZoomInit;
  *cl++ = cop2lch;
    16ec:	202f 005c      	move.l 92(sp),d0
    16f0:	2200           	move.l d0,d1
    16f2:	5881           	addq.l #4,d1
    16f4:	2f41 005c      	move.l d1,92(sp)
    16f8:	2040           	movea.l d0,a0
    16fa:	20af 0018      	move.l 24(sp),(a0)
  *cl++ = cop2lcl;
    16fe:	202f 005c      	move.l 92(sp),d0
    1702:	2200           	move.l d0,d1
    1704:	5881           	addq.l #4,d1
    1706:	2f41 005c      	move.l d1,92(sp)
    170a:	2040           	movea.l d0,a0
    170c:	20af 0014      	move.l 20(sp),(a0)
  *cl++ = 0x2c01ff00;
    1710:	202f 005c      	move.l 92(sp),d0
    1714:	2200           	move.l d0,d1
    1716:	5881           	addq.l #4,d1
    1718:	2f41 005c      	move.l d1,92(sp)
    171c:	2040           	movea.l d0,a0
    171e:	20bc 2c01 ff00 	move.l #738328320,(a0)

  ULONG cop2br1 = cop2 + ( (30)<<2);
    1724:	7078           	moveq #120,d0
    1726:	d0af 001c      	add.l 28(sp),d0
    172a:	2f40 0010      	move.l d0,16(sp)
  ULONG cop2br2 = cop2 + ( (86)<<2);
    172e:	222f 001c      	move.l 28(sp),d1
    1732:	0681 0000 0158 	addi.l #344,d1
    1738:	2f41 000c      	move.l d1,12(sp)
  clpartinstruction = Cl102ZoomRepeat;
    173c:	2f7c 0000 a740 	move.l #42816,88(sp)
    1742:	0058 
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    1744:	202f 0010      	move.l 16(sp),d0
    1748:	4240           	clr.w d0
    174a:	4840           	swap d0
    174c:	307c 0070      	movea.w #112,a0
    1750:	d1ef 0058      	adda.l 88(sp),a0
    1754:	0680 0084 0000 	addi.l #8650752,d0
    175a:	2080           	move.l d0,(a0)
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    175c:	202f 0010      	move.l 16(sp),d0
    1760:	0280 0000 ffff 	andi.l #65535,d0
    1766:	307c 0074      	movea.w #116,a0
    176a:	d1ef 0058      	adda.l 88(sp),a0
    176e:	0680 0086 0000 	addi.l #8781824,d0
    1774:	2080           	move.l d0,(a0)
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    1776:	202f 000c      	move.l 12(sp),d0
    177a:	4240           	clr.w d0
    177c:	4840           	swap d0
    177e:	206f 0058      	movea.l 88(sp),a0
    1782:	41e8 0150      	lea 336(a0),a0
    1786:	0680 0084 0000 	addi.l #8650752,d0
    178c:	2080           	move.l d0,(a0)
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    178e:	202f 000c      	move.l 12(sp),d0
    1792:	0280 0000 ffff 	andi.l #65535,d0
    1798:	206f 0058      	movea.l 88(sp),a0
    179c:	41e8 0154      	lea 340(a0),a0
    17a0:	0680 0086 0000 	addi.l #8781824,d0
    17a6:	2080           	move.l d0,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    17a8:	42af 0048      	clr.l 72(sp)
    17ac:	6024           	bra.s 17d2 <ClbuildZoom+0x326>
    *cl++ = *clpartinstruction++;
    17ae:	222f 0058      	move.l 88(sp),d1
    17b2:	2401           	move.l d1,d2
    17b4:	5882           	addq.l #4,d2
    17b6:	2f42 0058      	move.l d2,88(sp)
    17ba:	202f 005c      	move.l 92(sp),d0
    17be:	2400           	move.l d0,d2
    17c0:	5882           	addq.l #4,d2
    17c2:	2f42 005c      	move.l d2,92(sp)
    17c6:	2041           	movea.l d1,a0
    17c8:	2210           	move.l (a0),d1
    17ca:	2040           	movea.l d0,a0
    17cc:	2081           	move.l d1,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    17ce:	52af 0048      	addq.l #1,72(sp)
    17d2:	7071           	moveq #113,d0
    17d4:	b0af 0048      	cmp.l 72(sp),d0
    17d8:	6cd4           	bge.s 17ae <ClbuildZoom+0x302>

   *cl++ = 0xfffffffe;
    17da:	202f 005c      	move.l 92(sp),d0
    17de:	2200           	move.l d0,d1
    17e0:	5881           	addq.l #4,d1
    17e2:	2f41 005c      	move.l d1,92(sp)
    17e6:	74fe           	moveq #-2,d2
    17e8:	2040           	movea.l d0,a0
    17ea:	2082           	move.l d2,(a0)

  return retval;
    17ec:	202f 0038      	move.l 56(sp),d0
}
    17f0:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    17f4:	4fef 0054      	lea 84(sp),sp
    17f8:	4e75           	rts

000017fa <PrepareDisplayZoom>:

 int PrepareDisplayZoom() {
    17fa:	4fef ffb8      	lea -72(sp),sp
    17fe:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildZoom();
    1802:	4eba fca8      	jsr 14ac <ClbuildZoom>(pc)
    1806:	23c0 004d 2c40 	move.l d0,4d2c40 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    180c:	4eba fc9e      	jsr 14ac <ClbuildZoom>(pc)
    1810:	23c0 004d 2c44 	move.l d0,4d2c44 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1816:	2f7c 0000 df20 	move.l #57120,80(sp)
    181c:	0050 
    181e:	7002           	moveq #2,d0
    1820:	2f40 004c      	move.l d0,76(sp)
    1824:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    182a:	2c40           	movea.l d0,a6
    182c:	202f 0050      	move.l 80(sp),d0
    1830:	222f 004c      	move.l 76(sp),d1
    1834:	4eae ff3a      	jsr -198(a6)
    1838:	2f40 0048      	move.l d0,72(sp)
    183c:	202f 0048      	move.l 72(sp),d0
    1840:	23c0 004d 2c38 	move.l d0,4d2c38 <Bitplane1>
  if(Bitplane1 == 0) {
    1846:	2039 004d 2c38 	move.l 4d2c38 <Bitplane1>,d0
    184c:	6658           	bne.s 18a6 <PrepareDisplayZoom+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    184e:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    1854:	2c40           	movea.l d0,a6
    1856:	4eae ffc4      	jsr -60(a6)
    185a:	2f40 0044      	move.l d0,68(sp)
    185e:	202f 0044      	move.l 68(sp),d0
    1862:	2f40 0040      	move.l d0,64(sp)
    1866:	2f7c 0000 7cdd 	move.l #31965,60(sp)
    186c:	003c 
    186e:	7026           	moveq #38,d0
    1870:	2f40 0038      	move.l d0,56(sp)
    1874:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    187a:	2c40           	movea.l d0,a6
    187c:	222f 0040      	move.l 64(sp),d1
    1880:	242f 003c      	move.l 60(sp),d2
    1884:	262f 0038      	move.l 56(sp),d3
    1888:	4eae ffd0      	jsr -48(a6)
    188c:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    1890:	7001           	moveq #1,d0
    1892:	2f40 0030      	move.l d0,48(sp)
    1896:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    189c:	2c40           	movea.l d0,a6
    189e:	222f 0030      	move.l 48(sp),d1
    18a2:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    18a6:	2039 004d 2c38 	move.l 4d2c38 <Bitplane1>,d0
    18ac:	23c0 004d 2c48 	move.l d0,4d2c48 <DrawBuffer>
  DrawCopper = Copperlist1;
    18b2:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    18b8:	23c0 004d 2c50 	move.l d0,4d2c50 <DrawCopper>
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    18be:	2f7c 0000 df20 	move.l #57120,44(sp)
    18c4:	002c 
    18c6:	7002           	moveq #2,d0
    18c8:	2f40 0028      	move.l d0,40(sp)
    18cc:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    18d2:	2c40           	movea.l d0,a6
    18d4:	202f 002c      	move.l 44(sp),d0
    18d8:	222f 0028      	move.l 40(sp),d1
    18dc:	4eae ff3a      	jsr -198(a6)
    18e0:	2f40 0024      	move.l d0,36(sp)
    18e4:	202f 0024      	move.l 36(sp),d0
    18e8:	23c0 004d 2c3c 	move.l d0,4d2c3c <Bitplane2>
  if(Bitplane2 == 0) {
    18ee:	2039 004d 2c3c 	move.l 4d2c3c <Bitplane2>,d0
    18f4:	6658           	bne.s 194e <PrepareDisplayZoom+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    18f6:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    18fc:	2c40           	movea.l d0,a6
    18fe:	4eae ffc4      	jsr -60(a6)
    1902:	2f40 0020      	move.l d0,32(sp)
    1906:	202f 0020      	move.l 32(sp),d0
    190a:	2f40 001c      	move.l d0,28(sp)
    190e:	2f7c 0000 7d04 	move.l #32004,24(sp)
    1914:	0018 
    1916:	7026           	moveq #38,d0
    1918:	2f40 0014      	move.l d0,20(sp)
    191c:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    1922:	2c40           	movea.l d0,a6
    1924:	222f 001c      	move.l 28(sp),d1
    1928:	242f 0018      	move.l 24(sp),d2
    192c:	262f 0014      	move.l 20(sp),d3
    1930:	4eae ffd0      	jsr -48(a6)
    1934:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    1938:	7001           	moveq #1,d0
    193a:	2f40 000c      	move.l d0,12(sp)
    193e:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    1944:	2c40           	movea.l d0,a6
    1946:	222f 000c      	move.l 12(sp),d1
    194a:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    194e:	2039 004d 2c3c 	move.l 4d2c3c <Bitplane2>,d0
    1954:	23c0 004d 2c4c 	move.l d0,4d2c4c <ViewBuffer>
  ViewCopper = Copperlist2; 
    195a:	2039 004d 2c44 	move.l 4d2c44 <Copperlist2>,d0
    1960:	23c0 004d 2c54 	move.l d0,4d2c54 <ViewCopper>
  return 0;
    1966:	7000           	moveq #0,d0
}
    1968:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    196c:	4fef 0048      	lea 72(sp),sp
    1970:	4e75           	rts

00001972 <Init_Blit>:

void Init_Blit() {
  hw->bltafwm = 0xffff;
    1972:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    1978:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    197e:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    1984:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    198a:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    1990:	317c 0026 0064 	move.w #38,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1996:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    199c:	317c 0026 0062 	move.w #38,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    19a2:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    19a8:	317c 0026 0066 	move.w #38,102(a0)
}
    19ae:	4e75           	rts

000019b0 <Init_Blit2>:


void Init_Blit2() {
  hw->bltafwm = 0xffff;
    19b0:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    19b6:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    19bc:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    19c2:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = 36;
    19c8:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    19ce:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = 76;
    19d4:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    19da:	317c 004c 0062 	move.w #76,98(a0)
  hw->bltdmod = ZMLINESIZE2 - 4;
    19e0:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    19e6:	317c 0028 0066 	move.w #40,102(a0)
}
    19ec:	4e75           	rts

000019ee <Init_ZoomBlit>:

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
    19ee:	4fef fff4      	lea -12(sp),sp
    19f2:	206f 0010      	movea.l 16(sp),a0
    19f6:	222f 0014      	move.l 20(sp),d1
    19fa:	202f 0018      	move.l 24(sp),d0
    19fe:	3048           	movea.w a0,a0
    1a00:	3f48 0004      	move.w a0,4(sp)
    1a04:	3201           	move.w d1,d1
    1a06:	3f41 0002      	move.w d1,2(sp)
    1a0a:	3000           	move.w d0,d0
    1a0c:	3e80           	move.w d0,(sp)
  ZoomBlit_Increment4SrcA = 0;
    1a0e:	4279 004d 2c8e 	clr.w 4d2c8e <ZoomBlit_Increment4SrcA>

  UWORD colnr = nextzoom - startofword - 1;                                                                          
    1a14:	302f 0002      	move.w 2(sp),d0
    1a18:	906f 0004      	sub.w 4(sp),d0
    1a1c:	3200           	move.w d0,d1
    1a1e:	5341           	subq.w #1,d1
    1a20:	3f41 0008      	move.w d1,8(sp)
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
    1a24:	3017           	move.w (sp),d0
    1a26:	720c           	moveq #12,d1
    1a28:	e368           	lsl.w d1,d0
    1a2a:	3f40 0006      	move.w d0,6(sp)
  UWORD shifta;
  if( shiftright == 0) {
    1a2e:	4a57           	tst.w (sp)
    1a30:	6610           	bne.s 1a42 <Init_ZoomBlit+0x54>
    ZoomBlit_Increment4SrcA = 1;
    1a32:	33fc 0001 004d 	move.w #1,4d2c8e <ZoomBlit_Increment4SrcA>
    1a38:	2c8e 
    shifta = 15 << 12;
    1a3a:	3f7c f000 000a 	move.w #-4096,10(sp)
    1a40:	600c           	bra.s 1a4e <Init_ZoomBlit+0x60>
  } else {
    shifta = (shiftright - 1) << 12;
    1a42:	3017           	move.w (sp),d0
    1a44:	5340           	subq.w #1,d0
    1a46:	720c           	moveq #12,d1
    1a48:	e368           	lsl.w d1,d0
    1a4a:	3f40 000a      	move.w d0,10(sp)
  }
  WaitBlt(); 
    1a4e:	4eba e664      	jsr b4 <WaitBlt>(pc)
  hw->bltcon1 = shiftb; 
    1a52:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    1a58:	316f 0006 0042 	move.w 6(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1a5e:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    1a64:	302f 000a      	move.w 10(sp),d0
    1a68:	0640 0de4      	addi.w #3556,d0
    1a6c:	3140 0040      	move.w d0,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1a70:	7000           	moveq #0,d0
    1a72:	302f 0008      	move.w 8(sp),d0
    1a76:	7210           	moveq #16,d1
    1a78:	9280           	sub.l d0,d1
    1a7a:	7000           	moveq #0,d0
    1a7c:	4640           	not.w d0
    1a7e:	e3a8           	lsl.l d1,d0
    1a80:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    1a86:	2000           	move.l d0,d0
    1a88:	3140 0070      	move.w d0,112(a0)
}
    1a8c:	4fef 000c      	lea 12(sp),sp
    1a90:	4e75           	rts

00001a92 <Init_Copy>:

void Init_Copy( WORD shift) {
    1a92:	598f           	subq.l #4,sp
    1a94:	202f 0008      	move.l 8(sp),d0
    1a98:	3000           	move.w d0,d0
    1a9a:	3e80           	move.w d0,(sp)
  UWORD shiftright = shift << 12;
    1a9c:	3017           	move.w (sp),d0
    1a9e:	720c           	moveq #12,d1
    1aa0:	e368           	lsl.w d1,d0
    1aa2:	3f40 0002      	move.w d0,2(sp)
  WaitBlt();
    1aa6:	4eba e60c      	jsr b4 <WaitBlt>(pc)
  hw->bltcon0 = 0x9f0 + shiftright;
    1aaa:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    1ab0:	302f 0002      	move.w 2(sp),d0
    1ab4:	0640 09f0      	addi.w #2544,d0
    1ab8:	3140 0040      	move.w d0,64(a0)
  hw->bltcon1 = 0;
    1abc:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    1ac2:	317c 0000 0042 	move.w #0,66(a0)
}
    1ac8:	588f           	addq.l #4,sp
    1aca:	4e75           	rts

00001acc <Zoom_ZoomIntoPicture>:

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    1acc:	4fef ffcc      	lea -52(sp),sp
    1ad0:	222f 0040      	move.l 64(sp),d1
    1ad4:	202f 0044      	move.l 68(sp),d0
    1ad8:	3201           	move.w d1,d1
    1ada:	3f41 0002      	move.w d1,2(sp)
    1ade:	3000           	move.w d0,d0
    1ae0:	3e80           	move.w d0,(sp)
  
  WaitBlt();  
    1ae2:	4eba e5d0      	jsr b4 <WaitBlt>(pc)
  Init_Blit();
    1ae6:	4eba fe8a      	jsr 1972 <Init_Blit>(pc)
  WORD shiftright = 9;
    1aea:	3f7c 0009 0032 	move.w #9,50(sp)
  UWORD shifthoriz = 7;
    1af0:	3f7c 0007 0030 	move.w #7,48(sp)
  UWORD startofword = 21*16;
    1af6:	3f7c 0150 002e 	move.w #336,46(sp)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1afc:	322f 0002      	move.w 2(sp),d1
    1b00:	3001           	move.w d1,d0
    1b02:	d040           	add.w d0,d0
    1b04:	d040           	add.w d0,d0
    1b06:	d041           	add.w d1,d0
    1b08:	d040           	add.w d0,d0
    1b0a:	0640 014c      	addi.w #332,d0
    1b0e:	3f40 002c      	move.w d0,44(sp)
    1b12:	601a           	bra.s 1b2e <Zoom_ZoomIntoPicture+0x62>
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    1b14:	302f 002c      	move.w 44(sp),d0
    1b18:	906f 0002      	sub.w 2(sp),d0
    1b1c:	0640 ffed      	addi.w #-19,d0
    1b20:	3f40 002c      	move.w d0,44(sp)
    shiftright--;
    1b24:	302f 0032      	move.w 50(sp),d0
    1b28:	5340           	subq.w #1,d0
    1b2a:	3f40 0032      	move.w d0,50(sp)
  while( nextzoom > 22 * 16) {
    1b2e:	0c6f 0160 002c 	cmpi.w #352,44(sp)
    1b34:	6ede           	bgt.s 1b14 <Zoom_ZoomIntoPicture+0x48>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
    1b36:	426f 002a      	clr.w 42(sp)
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    1b3a:	322f 0002      	move.w 2(sp),d1
    1b3e:	3001           	move.w d1,d0
    1b40:	d040           	add.w d0,d0
    1b42:	d040           	add.w d0,d0
    1b44:	d041           	add.w d1,d0
    1b46:	4440           	neg.w d0
    1b48:	0640 0012      	addi.w #18,d0
    1b4c:	3f40 0028      	move.w d0,40(sp)
    1b50:	601c           	bra.s 1b6e <Zoom_ZoomIntoPicture+0xa2>
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    1b52:	302f 0028      	move.w 40(sp),d0
    1b56:	d06f 0002      	add.w 2(sp),d0
    1b5a:	0640 0013      	addi.w #19,d0
    1b5e:	3f40 0028      	move.w d0,40(sp)
      shifthoriz--;
    1b62:	302f 0030      	move.w 48(sp),d0
    1b66:	3200           	move.w d0,d1
    1b68:	5341           	subq.w #1,d1
    1b6a:	3f41 0030      	move.w d1,48(sp)
  while( ZoomHorizontalStart < 0) {
    1b6e:	4a6f 0028      	tst.w 40(sp)
    1b72:	6dde           	blt.s 1b52 <Zoom_ZoomIntoPicture+0x86>
  } 

  for(int i=0;i<22;i++) {
    1b74:	42af 0024      	clr.l 36(sp)
    1b78:	6000 02ca      	bra.w 1e44 <Zoom_ZoomIntoPicture+0x378>

    ZoomHorizontal = ZoomHorizontalStart;
    1b7c:	33ef 0028 004d 	move.w 40(sp),4d2caa <ZoomHorizontal>
    1b82:	2caa 

    WORD linesleft = 272;
    1b84:	3f7c 0110 0022 	move.w #272,34(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1b8a:	7000           	moveq #0,d0
    1b8c:	302f 0030      	move.w 48(sp),d0
    1b90:	7200           	moveq #0,d1
    1b92:	3217           	move.w (sp),d1
    1b94:	2f01           	move.l d1,-(sp)
    1b96:	2f00           	move.l d0,-(sp)
    1b98:	4eb9 0000 7144 	jsr 7144 <__mulsi3>
    1b9e:	508f           	addq.l #8,sp
    1ba0:	2200           	move.l d0,d1
    1ba2:	2001           	move.l d1,d0
    1ba4:	d080           	add.l d0,d0
    1ba6:	d081           	add.l d1,d0
    1ba8:	2200           	move.l d0,d1
    1baa:	e789           	lsl.l #3,d1
    1bac:	9280           	sub.l d0,d1
    1bae:	202f 0024      	move.l 36(sp),d0
    1bb2:	9280           	sub.l d0,d1
    1bb4:	2001           	move.l d1,d0
    1bb6:	0680 8000 0013 	addi.l #-2147483629,d0
    1bbc:	d080           	add.l d0,d0
    1bbe:	222f 0038      	move.l 56(sp),d1
    1bc2:	d280           	add.l d0,d1
    1bc4:	2f41 001e      	move.l d1,30(sp)
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1bc8:	202f 0024      	move.l 36(sp),d0
    1bcc:	7213           	moveq #19,d1
    1bce:	9280           	sub.l d0,d1
    1bd0:	2001           	move.l d1,d0
    1bd2:	d081           	add.l d1,d0
    1bd4:	222f 003c      	move.l 60(sp),d1
    1bd8:	d280           	add.l d0,d1
    1bda:	2f41 001a      	move.l d1,26(sp)
    
    UWORD onestep = ZMLINESIZE/2*planes;
    1bde:	3017           	move.w (sp),d0
    1be0:	c1fc 0015      	muls.w #21,d0
    1be4:	3f40 0018      	move.w d0,24(sp)
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1be8:	7000           	moveq #0,d0
    1bea:	302f 002e      	move.w 46(sp),d0
    1bee:	306f 002c      	movea.w 44(sp),a0
    1bf2:	b1c0           	cmpa.l d0,a0
    1bf4:	6e00 0106      	bgt.w 1cfc <Zoom_ZoomIntoPicture+0x230>
      Init_Copy( shiftright);
    1bf8:	306f 0032      	movea.w 50(sp),a0
    1bfc:	2f08           	move.l a0,-(sp)
    1bfe:	4eba fe92      	jsr 1a92 <Init_Copy>(pc)
    1c02:	588f           	addq.l #4,sp
    1c04:	6000 00ea      	bra.w 1cf0 <Zoom_ZoomIntoPicture+0x224>
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1c08:	3039 004d 2caa 	move.w 4d2caa <ZoomHorizontal>,d0
    1c0e:	b06f 0022      	cmp.w 34(sp),d0
    1c12:	6c12           	bge.s 1c26 <Zoom_ZoomIntoPicture+0x15a>
          linesleft -= ZoomHorizontal;
    1c14:	322f 0022      	move.w 34(sp),d1
    1c18:	3039 004d 2caa 	move.w 4d2caa <ZoomHorizontal>,d0
    1c1e:	9240           	sub.w d0,d1
    1c20:	3f41 0022      	move.w d1,34(sp)
    1c24:	600c           	bra.s 1c32 <Zoom_ZoomIntoPicture+0x166>
        } else {
          ZoomHorizontal = linesleft;
    1c26:	33ef 0022 004d 	move.w 34(sp),4d2caa <ZoomHorizontal>
    1c2c:	2caa 
          linesleft = 0;
    1c2e:	426f 0022      	clr.w 34(sp)
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
    1c32:	3039 004d 2caa 	move.w 4d2caa <ZoomHorizontal>,d0
    1c38:	322f 0018      	move.w 24(sp),d1
    1c3c:	c3c0           	muls.w d0,d1
    1c3e:	3f41 000c      	move.w d1,12(sp)
        //Add aditional line
        if( linesleft>0) {
    1c42:	4a6f 0022      	tst.w 34(sp)
    1c46:	6f4c           	ble.s 1c94 <Zoom_ZoomIntoPicture+0x1c8>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1c48:	7200           	moveq #0,d1
    1c4a:	322f 000c      	move.w 12(sp),d1
    1c4e:	7000           	moveq #0,d0
    1c50:	302f 002a      	move.w 42(sp),d0
    1c54:	d081           	add.l d1,d0
    1c56:	d080           	add.l d0,d0
    1c58:	222f 001e      	move.l 30(sp),d1
    1c5c:	d280           	add.l d0,d1
    1c5e:	2f41 0008      	move.l d1,8(sp)
          UWORD *tmpdest = pos4dest +  size4blit;
    1c62:	7000           	moveq #0,d0
    1c64:	302f 000c      	move.w 12(sp),d0
    1c68:	d080           	add.l d0,d0
    1c6a:	222f 001a      	move.l 26(sp),d1
    1c6e:	d280           	add.l d0,d1
    1c70:	2f41 0004      	move.l d1,4(sp)
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
    1c74:	7000           	moveq #0,d0
    1c76:	3017           	move.w (sp),d0
    1c78:	2f00           	move.l d0,-(sp)
    1c7a:	2f2f 0008      	move.l 8(sp),-(sp)
    1c7e:	2f2f 0010      	move.l 16(sp),-(sp)
    1c82:	4eba f314      	jsr f98 <Zoom_CopyWord>(pc)
    1c86:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1c8a:	302f 0022      	move.w 34(sp),d0
    1c8e:	5340           	subq.w #1,d0
    1c90:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1c94:	3039 004d 2caa 	move.w 4d2caa <ZoomHorizontal>,d0
    1c9a:	c1d7           	muls.w (sp),d0
    1c9c:	7200           	moveq #0,d1
    1c9e:	3200           	move.w d0,d1
    1ca0:	7000           	moveq #0,d0
    1ca2:	302f 002a      	move.w 42(sp),d0
    1ca6:	d080           	add.l d0,d0
    1ca8:	d0af 001e      	add.l 30(sp),d0
    1cac:	2f01           	move.l d1,-(sp)
    1cae:	2f2f 001e      	move.l 30(sp),-(sp)
    1cb2:	2f00           	move.l d0,-(sp)
    1cb4:	4eba f2e2      	jsr f98 <Zoom_CopyWord>(pc)
    1cb8:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1cbc:	7000           	moveq #0,d0
    1cbe:	302f 000c      	move.w 12(sp),d0
    1cc2:	d080           	add.l d0,d0
    1cc4:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep; 
    1cc8:	7200           	moveq #0,d1
    1cca:	322f 000c      	move.w 12(sp),d1
    1cce:	7000           	moveq #0,d0
    1cd0:	302f 0018      	move.w 24(sp),d0
    1cd4:	d081           	add.l d1,d0
    1cd6:	d080           	add.l d0,d0
    1cd8:	d1af 001a      	add.l d0,26(sp)
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1cdc:	302f 0002      	move.w 2(sp),d0
    1ce0:	d040           	add.w d0,d0
    1ce2:	906f 0002      	sub.w 2(sp),d0
    1ce6:	0640 0012      	addi.w #18,d0
    1cea:	33c0 004d 2caa 	move.w d0,4d2caa <ZoomHorizontal>
      while(linesleft > 0) {
    1cf0:	4a6f 0022      	tst.w 34(sp)
    1cf4:	6e00 ff12      	bgt.w 1c08 <Zoom_ZoomIntoPicture+0x13c>
    1cf8:	6000 0140      	bra.w 1e3a <Zoom_ZoomIntoPicture+0x36e>
      }
    } else {  
      Init_ZoomBlit( startofword, nextzoom, shiftright);   
    1cfc:	326f 0032      	movea.w 50(sp),a1
    1d00:	306f 002c      	movea.w 44(sp),a0
    1d04:	7000           	moveq #0,d0
    1d06:	302f 002e      	move.w 46(sp),d0
    1d0a:	2f09           	move.l a1,-(sp)
    1d0c:	2f08           	move.l a0,-(sp)
    1d0e:	2f00           	move.l d0,-(sp)
    1d10:	4eba fcdc      	jsr 19ee <Init_ZoomBlit>(pc)
    1d14:	4fef 000c      	lea 12(sp),sp
      nextzoom -= (19 + zoomnr);
    1d18:	302f 002c      	move.w 44(sp),d0
    1d1c:	906f 0002      	sub.w 2(sp),d0
    1d20:	0640 ffed      	addi.w #-19,d0
    1d24:	3f40 002c      	move.w d0,44(sp)
    1d28:	6000 00ea      	bra.w 1e14 <Zoom_ZoomIntoPicture+0x348>
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1d2c:	3039 004d 2caa 	move.w 4d2caa <ZoomHorizontal>,d0
    1d32:	b06f 0022      	cmp.w 34(sp),d0
    1d36:	6c12           	bge.s 1d4a <Zoom_ZoomIntoPicture+0x27e>
          linesleft -= ZoomHorizontal;
    1d38:	322f 0022      	move.w 34(sp),d1
    1d3c:	3039 004d 2caa 	move.w 4d2caa <ZoomHorizontal>,d0
    1d42:	9240           	sub.w d0,d1
    1d44:	3f41 0022      	move.w d1,34(sp)
    1d48:	600c           	bra.s 1d56 <Zoom_ZoomIntoPicture+0x28a>
        } else {
          ZoomHorizontal = linesleft;
    1d4a:	33ef 0022 004d 	move.w 34(sp),4d2caa <ZoomHorizontal>
    1d50:	2caa 
          linesleft = 0;
    1d52:	426f 0022      	clr.w 34(sp)
        }
        UWORD size4blit = ZoomHorizontal*onestep;
    1d56:	3039 004d 2caa 	move.w 4d2caa <ZoomHorizontal>,d0
    1d5c:	322f 0018      	move.w 24(sp),d1
    1d60:	c3c0           	muls.w d0,d1
    1d62:	3f41 0016      	move.w d1,22(sp)
        //Add aditional line
        if( linesleft>0) {
    1d66:	4a6f 0022      	tst.w 34(sp)
    1d6a:	6f4c           	ble.s 1db8 <Zoom_ZoomIntoPicture+0x2ec>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1d6c:	7200           	moveq #0,d1
    1d6e:	322f 0016      	move.w 22(sp),d1
    1d72:	7000           	moveq #0,d0
    1d74:	302f 002a      	move.w 42(sp),d0
    1d78:	d081           	add.l d1,d0
    1d7a:	d080           	add.l d0,d0
    1d7c:	222f 001e      	move.l 30(sp),d1
    1d80:	d280           	add.l d0,d1
    1d82:	2f41 0012      	move.l d1,18(sp)
          UWORD *tmpdest = pos4dest + size4blit;
    1d86:	7000           	moveq #0,d0
    1d88:	302f 0016      	move.w 22(sp),d0
    1d8c:	d080           	add.l d0,d0
    1d8e:	222f 001a      	move.l 26(sp),d1
    1d92:	d280           	add.l d0,d1
    1d94:	2f41 000e      	move.l d1,14(sp)
          
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
    1d98:	7000           	moveq #0,d0
    1d9a:	3017           	move.w (sp),d0
    1d9c:	2f00           	move.l d0,-(sp)
    1d9e:	2f2f 0012      	move.l 18(sp),-(sp)
    1da2:	2f2f 001a      	move.l 26(sp),-(sp)
    1da6:	4eba f22e      	jsr fd6 <Zoom_ZoomBlit>(pc)
    1daa:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1dae:	302f 0022      	move.w 34(sp),d0
    1db2:	5340           	subq.w #1,d0
    1db4:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1db8:	3039 004d 2caa 	move.w 4d2caa <ZoomHorizontal>,d0
    1dbe:	c1d7           	muls.w (sp),d0
    1dc0:	7200           	moveq #0,d1
    1dc2:	3200           	move.w d0,d1
    1dc4:	7000           	moveq #0,d0
    1dc6:	302f 002a      	move.w 42(sp),d0
    1dca:	d080           	add.l d0,d0
    1dcc:	d0af 001e      	add.l 30(sp),d0
    1dd0:	2f01           	move.l d1,-(sp)
    1dd2:	2f2f 001e      	move.l 30(sp),-(sp)
    1dd6:	2f00           	move.l d0,-(sp)
    1dd8:	4eba f1fc      	jsr fd6 <Zoom_ZoomBlit>(pc)
    1ddc:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1de0:	7000           	moveq #0,d0
    1de2:	302f 0016      	move.w 22(sp),d0
    1de6:	d080           	add.l d0,d0
    1de8:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep;   
    1dec:	7200           	moveq #0,d1
    1dee:	322f 0016      	move.w 22(sp),d1
    1df2:	7000           	moveq #0,d0
    1df4:	302f 0018      	move.w 24(sp),d0
    1df8:	d081           	add.l d1,d0
    1dfa:	d080           	add.l d0,d0
    1dfc:	d1af 001a      	add.l d0,26(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1e00:	302f 0002      	move.w 2(sp),d0
    1e04:	d040           	add.w d0,d0
    1e06:	906f 0002      	sub.w 2(sp),d0
    1e0a:	0640 0012      	addi.w #18,d0
    1e0e:	33c0 004d 2caa 	move.w d0,4d2caa <ZoomHorizontal>
      while( linesleft > 0) {
    1e14:	4a6f 0022      	tst.w 34(sp)
    1e18:	6e00 ff12      	bgt.w 1d2c <Zoom_ZoomIntoPicture+0x260>
      }
      shiftright--;  
    1e1c:	302f 0032      	move.w 50(sp),d0
    1e20:	5340           	subq.w #1,d0
    1e22:	3f40 0032      	move.w d0,50(sp)
      if(shiftright < 0) {
    1e26:	6a12           	bpl.s 1e3a <Zoom_ZoomIntoPicture+0x36e>
        shiftright += 16;
    1e28:	302f 0032      	move.w 50(sp),d0
    1e2c:	0640 0010      	addi.w #16,d0
    1e30:	3f40 0032      	move.w d0,50(sp)
        shifttoleft = 1;
    1e34:	3f7c 0001 002a 	move.w #1,42(sp)
      }
    }
    startofword -= 16;
    1e3a:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    1e40:	52af 0024      	addq.l #1,36(sp)
    1e44:	7015           	moveq #21,d0
    1e46:	b0af 0024      	cmp.l 36(sp),d0
    1e4a:	6c00 fd30      	bge.w 1b7c <Zoom_ZoomIntoPicture+0xb0>
  }
}
    1e4e:	4fef 0034      	lea 52(sp),sp
    1e52:	4e75           	rts

00001e54 <Zoom_SetBplPointers>:

void Zoom_SetBplPointers( UWORD *buffer, ULONG *copper) {
    1e54:	4fef ffb0      	lea -80(sp),sp
  //                   0  1  1   1   1   0   1   1    1    1    0    1    1    0    1    1
  //int zoomoffset[] = { 0, 0, 42, 42, 84, 84, 84, 126, 126, 168, 168, 168, 210, 210, 210, 332};
  //int zoomoffset[] = { 252, 210, 210, 210, 168, 168, 168, 126, 126, 84, 84, 84, 42, 42, 0, 0 };
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
    1e58:	204f           	movea.l sp,a0
    1e5a:	223c 0000 7d60 	move.l #32096,d1
    1e60:	7040           	moveq #64,d0
    1e62:	2f00           	move.l d0,-(sp)
    1e64:	2f01           	move.l d1,-(sp)
    1e66:	2f08           	move.l a0,-(sp)
    1e68:	4eba 4f7c      	jsr 6de6 <memcpy>(pc)
    1e6c:	4fef 000c      	lea 12(sp),sp

  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
    1e70:	3039 004d 2ca6 	move.w 4d2ca6 <Zoom_LevelOf102Zoom>,d0
    1e76:	3000           	move.w d0,d0
    1e78:	0280 0000 ffff 	andi.l #65535,d0
    1e7e:	d080           	add.l d0,d0
    1e80:	d080           	add.l d0,d0
    1e82:	41ef 0050      	lea 80(sp),a0
    1e86:	d1c0           	adda.l d0,a0
    1e88:	41e8 ffb0      	lea -80(a0),a0
    1e8c:	2010           	move.l (a0),d0
    1e8e:	d080           	add.l d0,d0
    1e90:	d0af 0054      	add.l 84(sp),d0
    1e94:	2f40 004c      	move.l d0,76(sp)
  /*ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;*/
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
    1e98:	7072           	moveq #114,d0
    1e9a:	d0af 0058      	add.l 88(sp),d0
    1e9e:	2f40 0048      	move.l d0,72(sp)
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1ea2:	42af 0044      	clr.l 68(sp)
    1ea6:	6036           	bra.s 1ede <Zoom_SetBplPointers+0x8a>
    UWORD highword = (ULONG)plane2set >> 16;
    1ea8:	202f 004c      	move.l 76(sp),d0
    1eac:	4240           	clr.w d0
    1eae:	4840           	swap d0
    1eb0:	3f40 0042      	move.w d0,66(sp)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1eb4:	3f6f 004e 0040 	move.w 78(sp),64(sp)
    *posofcopper = highword;
    1eba:	206f 0048      	movea.l 72(sp),a0
    1ebe:	30af 0042      	move.w 66(sp),(a0)
    posofcopper += 2;
    1ec2:	58af 0048      	addq.l #4,72(sp)
    *posofcopper = lowword;
    1ec6:	206f 0048      	movea.l 72(sp),a0
    1eca:	30af 0040      	move.w 64(sp),(a0)
    posofcopper += 2;
    1ece:	58af 0048      	addq.l #4,72(sp)
    plane2set += 42*268; //Next plane
    1ed2:	06af 0000 2bf8 	addi.l #11256,76(sp)
    1ed8:	004c 
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1eda:	52af 0044      	addq.l #1,68(sp)
    1ede:	7004           	moveq #4,d0
    1ee0:	b0af 0044      	cmp.l 68(sp),d0
    1ee4:	6cc2           	bge.s 1ea8 <Zoom_SetBplPointers+0x54>
  }
  
}
    1ee6:	4fef 0050      	lea 80(sp),sp
    1eea:	4e75           	rts

00001eec <Zoom_SwapBuffers>:

void Zoom_SwapBuffers( UWORD zoomlevel) {
    1eec:	598f           	subq.l #4,sp
    1eee:	2f02           	move.l d2,-(sp)
    1ef0:	202f 000c      	move.l 12(sp),d0
    1ef4:	3000           	move.w d0,d0
    1ef6:	3f40 0006      	move.w d0,6(sp)

  ViewBuffer = rawzoom + (42*268*5*zoomlevel);
    1efa:	2439 0000 b8d8 	move.l b8d8 <rawzoom>,d2
    1f00:	7000           	moveq #0,d0
    1f02:	302f 0006      	move.w 6(sp),d0
    1f06:	2f3c 0000 dbd8 	move.l #56280,-(sp)
    1f0c:	2f00           	move.l d0,-(sp)
    1f0e:	4eb9 0000 7144 	jsr 7144 <__mulsi3>
    1f14:	508f           	addq.l #8,sp
    1f16:	d082           	add.l d2,d0
    1f18:	23c0 004d 2c4c 	move.l d0,4d2c4c <ViewBuffer>
  /*ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;*/
}
    1f1e:	241f           	move.l (sp)+,d2
    1f20:	588f           	addq.l #4,sp
    1f22:	4e75           	rts

00001f24 <Test_Zoom2>:
#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
    1f24:	4fef ff00      	lea -256(sp),sp
    1f28:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  //Test Zoomlevel 1
  volatile ULONG *srcsmall = AllocMem( 80, MEMF_CHIP);
    1f2c:	7050           	moveq #80,d0
    1f2e:	2f40 00f0      	move.l d0,240(sp)
    1f32:	7002           	moveq #2,d0
    1f34:	2f40 00ec      	move.l d0,236(sp)
    1f38:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    1f3e:	2c40           	movea.l d0,a6
    1f40:	202f 00f0      	move.l 240(sp),d0
    1f44:	222f 00ec      	move.l 236(sp),d1
    1f48:	4eae ff3a      	jsr -198(a6)
    1f4c:	2f40 00e8      	move.l d0,232(sp)
    1f50:	202f 00e8      	move.l 232(sp),d0
    1f54:	2f40 00e4      	move.l d0,228(sp)
  if( srcsmall == 0) {
    1f58:	6646           	bne.s 1fa0 <Test_Zoom2+0x7c>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcsmall\n", 42);
    1f5a:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    1f60:	2c40           	movea.l d0,a6
    1f62:	4eae ffc4      	jsr -60(a6)
    1f66:	2f40 001c      	move.l d0,28(sp)
    1f6a:	202f 001c      	move.l 28(sp),d0
    1f6e:	2f40 0018      	move.l d0,24(sp)
    1f72:	2f7c 0000 7da0 	move.l #32160,20(sp)
    1f78:	0014 
    1f7a:	702a           	moveq #42,d0
    1f7c:	2f40 0010      	move.l d0,16(sp)
    1f80:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    1f86:	2c40           	movea.l d0,a6
    1f88:	222f 0018      	move.l 24(sp),d1
    1f8c:	242f 0014      	move.l 20(sp),d2
    1f90:	262f 0010      	move.l 16(sp),d3
    1f94:	4eae ffd0      	jsr -48(a6)
    1f98:	2f40 000c      	move.l d0,12(sp)
    1f9c:	6000 0560      	bra.w 24fe <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong(srcsmall, 0xaaaaaaaa, 2, 10, 0);
    1fa0:	42a7           	clr.l -(sp)
    1fa2:	4878 000a      	pea a <_start+0xa>
    1fa6:	4878 0002      	pea 2 <_start+0x2>
    1faa:	2f3c aaaa aaaa 	move.l #-1431655766,-(sp)
    1fb0:	2f2f 00f4      	move.l 244(sp),-(sp)
    1fb4:	4eba e266      	jsr 21c <Utils_FillLong>(pc)
    1fb8:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *srcbig = AllocMem( 160, MEMF_CHIP);
    1fbc:	2f7c 0000 00a0 	move.l #160,224(sp)
    1fc2:	00e0 
    1fc4:	7002           	moveq #2,d0
    1fc6:	2f40 00dc      	move.l d0,220(sp)
    1fca:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    1fd0:	2c40           	movea.l d0,a6
    1fd2:	202f 00e0      	move.l 224(sp),d0
    1fd6:	222f 00dc      	move.l 220(sp),d1
    1fda:	4eae ff3a      	jsr -198(a6)
    1fde:	2f40 00d8      	move.l d0,216(sp)
    1fe2:	202f 00d8      	move.l 216(sp),d0
    1fe6:	2f40 00d4      	move.l d0,212(sp)
    if( srcbig == 0) {
    1fea:	6646           	bne.s 2032 <Test_Zoom2+0x10e>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcbig\n", 40);
    1fec:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    1ff2:	2c40           	movea.l d0,a6
    1ff4:	4eae ffc4      	jsr -60(a6)
    1ff8:	2f40 0030      	move.l d0,48(sp)
    1ffc:	202f 0030      	move.l 48(sp),d0
    2000:	2f40 002c      	move.l d0,44(sp)
    2004:	2f7c 0000 7dcb 	move.l #32203,40(sp)
    200a:	0028 
    200c:	7028           	moveq #40,d0
    200e:	2f40 0024      	move.l d0,36(sp)
    2012:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2018:	2c40           	movea.l d0,a6
    201a:	222f 002c      	move.l 44(sp),d1
    201e:	242f 0028      	move.l 40(sp),d2
    2022:	262f 0024      	move.l 36(sp),d3
    2026:	4eae ffd0      	jsr -48(a6)
    202a:	2f40 0020      	move.l d0,32(sp)
    202e:	6000 04ce      	bra.w 24fe <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong( srcbig, 0x55555555, 2, 20, 0);
    2032:	42a7           	clr.l -(sp)
    2034:	4878 0014      	pea 14 <_start+0x14>
    2038:	4878 0002      	pea 2 <_start+0x2>
    203c:	2f3c 5555 5555 	move.l #1431655765,-(sp)
    2042:	2f2f 00e4      	move.l 228(sp),-(sp)
    2046:	4eba e1d4      	jsr 21c <Utils_FillLong>(pc)
    204a:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *target = AllocMem( 168, MEMF_CHIP);
    204e:	2f7c 0000 00a8 	move.l #168,208(sp)
    2054:	00d0 
    2056:	7002           	moveq #2,d0
    2058:	2f40 00cc      	move.l d0,204(sp)
    205c:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    2062:	2c40           	movea.l d0,a6
    2064:	202f 00d0      	move.l 208(sp),d0
    2068:	222f 00cc      	move.l 204(sp),d1
    206c:	4eae ff3a      	jsr -198(a6)
    2070:	2f40 00c8      	move.l d0,200(sp)
    2074:	202f 00c8      	move.l 200(sp),d0
    2078:	2f40 00c4      	move.l d0,196(sp)
  if( target == 0) {
    207c:	6646           	bne.s 20c4 <Test_Zoom2+0x1a0>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
    207e:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2084:	2c40           	movea.l d0,a6
    2086:	4eae ffc4      	jsr -60(a6)
    208a:	2f40 0044      	move.l d0,68(sp)
    208e:	202f 0044      	move.l 68(sp),d0
    2092:	2f40 0040      	move.l d0,64(sp)
    2096:	2f7c 0000 7df4 	move.l #32244,60(sp)
    209c:	003c 
    209e:	7028           	moveq #40,d0
    20a0:	2f40 0038      	move.l d0,56(sp)
    20a4:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    20aa:	2c40           	movea.l d0,a6
    20ac:	222f 0040      	move.l 64(sp),d1
    20b0:	242f 003c      	move.l 60(sp),d2
    20b4:	262f 0038      	move.l 56(sp),d3
    20b8:	4eae ffd0      	jsr -48(a6)
    20bc:	2f40 0034      	move.l d0,52(sp)
    20c0:	6000 043c      	bra.w 24fe <Test_Zoom2+0x5da>
    return;
  }
  WaitBlt();
    20c4:	4eba dfee      	jsr b4 <WaitBlt>(pc)
  hw->bltafwm = 0xffff;
    20c8:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    20ce:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    20d4:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    20da:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltdmod = 38;
    20e0:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    20e6:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcon1 = 1 << 12; //Shift src big
    20ec:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    20f2:	317c 1000 0042 	move.w #4096,66(a0)
  hw->bltcon0 = 0xde4; //Chanell settings and Shift src small
    20f8:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    20fe:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltcdat = 0x8000; //Show channel small if 1 else channel big
    2104:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    210a:	317c 8000 0070 	move.w #-32768,112(a0)
  //srcbig-shift   0010 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sbbb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2110:	4878 0001      	pea 1 <_start+0x1>
    2114:	4878 004e      	pea 4e <_start+0x4e>
    2118:	4878 0026      	pea 26 <_start+0x26>
    211c:	4878 0002      	pea 2 <_start+0x2>
    2120:	2f2f 00d4      	move.l 212(sp),-(sp)
    2124:	2f2f 00e8      	move.l 232(sp),-(sp)
    2128:	2f2f 00fc      	move.l 252(sp),-(sp)
    212c:	4eba ef0c      	jsr 103a <Zoom_ZoomBlit2>(pc)
    2130:	4fef 001c      	lea 28(sp),sp
  UWORD *tmp = (UWORD *)target;
    2134:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    213a:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    2140:	2c40           	movea.l d0,a6
    2142:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2146:	42af 0104      	clr.l 260(sp)
    214a:	605c           	bra.s 21a8 <Test_Zoom2+0x284>
    if( *tmp != 0xaaaa ) {
    214c:	206f 0108      	movea.l 264(sp),a0
    2150:	3010           	move.w (a0),d0
    2152:	0c40 aaaa      	cmpi.w #-21846,d0
    2156:	6746           	beq.s 219e <Test_Zoom2+0x27a>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 1 failed\n", 40);
    2158:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    215e:	2c40           	movea.l d0,a6
    2160:	4eae ffc4      	jsr -60(a6)
    2164:	2f40 0058      	move.l d0,88(sp)
    2168:	202f 0058      	move.l 88(sp),d0
    216c:	2f40 0054      	move.l d0,84(sp)
    2170:	2f7c 0000 7e1d 	move.l #32285,80(sp)
    2176:	0050 
    2178:	7028           	moveq #40,d0
    217a:	2f40 004c      	move.l d0,76(sp)
    217e:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2184:	2c40           	movea.l d0,a6
    2186:	222f 0054      	move.l 84(sp),d1
    218a:	242f 0050      	move.l 80(sp),d2
    218e:	262f 004c      	move.l 76(sp),d3
    2192:	4eae ffd0      	jsr -48(a6)
    2196:	2f40 0048      	move.l d0,72(sp)
    219a:	6000 0362      	bra.w 24fe <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    219e:	7028           	moveq #40,d0
    21a0:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    21a4:	52af 0104      	addq.l #1,260(sp)
    21a8:	7001           	moveq #1,d0
    21aa:	b0af 0104      	cmp.l 260(sp),d0
    21ae:	6c9c           	bge.s 214c <Test_Zoom2+0x228>
  //srcbig-shift   0001 0101 0101 0101
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       ssbb bbbb bbbb bbbb
  //result:        1001 0101 0101 0101

  hw->bltcon1 = 2 << 12; //Shift src big
    21b0:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    21b6:	317c 2000 0042 	move.w #8192,66(a0)
  hw->bltcdat = 0xc000; //Show channel small if 1 else channel big
    21bc:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    21c2:	317c c000 0070 	move.w #-16384,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    21c8:	4878 0001      	pea 1 <_start+0x1>
    21cc:	4878 004e      	pea 4e <_start+0x4e>
    21d0:	4878 0026      	pea 26 <_start+0x26>
    21d4:	4878 0002      	pea 2 <_start+0x2>
    21d8:	2f2f 00d4      	move.l 212(sp),-(sp)
    21dc:	2f2f 00e8      	move.l 232(sp),-(sp)
    21e0:	2f2f 00fc      	move.l 252(sp),-(sp)
    21e4:	4eba ee54      	jsr 103a <Zoom_ZoomBlit2>(pc)
    21e8:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    21ec:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    21f2:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    21f8:	2c40           	movea.l d0,a6
    21fa:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    21fe:	42af 0100      	clr.l 256(sp)
    2202:	605c           	bra.s 2260 <Test_Zoom2+0x33c>
    if( *tmp != 0x9555 ) {
    2204:	206f 0108      	movea.l 264(sp),a0
    2208:	3010           	move.w (a0),d0
    220a:	0c40 9555      	cmpi.w #-27307,d0
    220e:	6746           	beq.s 2256 <Test_Zoom2+0x332>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 2 failed\n", 40);
    2210:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2216:	2c40           	movea.l d0,a6
    2218:	4eae ffc4      	jsr -60(a6)
    221c:	2f40 006c      	move.l d0,108(sp)
    2220:	202f 006c      	move.l 108(sp),d0
    2224:	2f40 0068      	move.l d0,104(sp)
    2228:	2f7c 0000 7e46 	move.l #32326,100(sp)
    222e:	0064 
    2230:	7028           	moveq #40,d0
    2232:	2f40 0060      	move.l d0,96(sp)
    2236:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    223c:	2c40           	movea.l d0,a6
    223e:	222f 0068      	move.l 104(sp),d1
    2242:	242f 0064      	move.l 100(sp),d2
    2246:	262f 0060      	move.l 96(sp),d3
    224a:	4eae ffd0      	jsr -48(a6)
    224e:	2f40 005c      	move.l d0,92(sp)
    2252:	6000 02aa      	bra.w 24fe <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    2256:	7028           	moveq #40,d0
    2258:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    225c:	52af 0100      	addq.l #1,256(sp)
    2260:	7001           	moveq #1,d0
    2262:	b0af 0100      	cmp.l 256(sp),d0
    2266:	6c9c           	bge.s 2204 <Test_Zoom2+0x2e0>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2268:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    226e:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    2274:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    227a:	317c e000 0070 	move.w #-8192,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2280:	4878 0001      	pea 1 <_start+0x1>
    2284:	4878 004e      	pea 4e <_start+0x4e>
    2288:	4878 0026      	pea 26 <_start+0x26>
    228c:	4878 0002      	pea 2 <_start+0x2>
    2290:	2f2f 00d4      	move.l 212(sp),-(sp)
    2294:	2f2f 00e8      	move.l 232(sp),-(sp)
    2298:	2f2f 00fc      	move.l 252(sp),-(sp)
    229c:	4eba ed9c      	jsr 103a <Zoom_ZoomBlit2>(pc)
    22a0:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    22a4:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    22aa:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    22b0:	2c40           	movea.l d0,a6
    22b2:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    22b6:	42af 00fc      	clr.l 252(sp)
    22ba:	605c           	bra.s 2318 <Test_Zoom2+0x3f4>
    if( *tmp != 0xaaaa ) {
    22bc:	206f 0108      	movea.l 264(sp),a0
    22c0:	3010           	move.w (a0),d0
    22c2:	0c40 aaaa      	cmpi.w #-21846,d0
    22c6:	6746           	beq.s 230e <Test_Zoom2+0x3ea>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    22c8:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    22ce:	2c40           	movea.l d0,a6
    22d0:	4eae ffc4      	jsr -60(a6)
    22d4:	2f40 0080      	move.l d0,128(sp)
    22d8:	202f 0080      	move.l 128(sp),d0
    22dc:	2f40 007c      	move.l d0,124(sp)
    22e0:	2f7c 0000 7e6f 	move.l #32367,120(sp)
    22e6:	0078 
    22e8:	7028           	moveq #40,d0
    22ea:	2f40 0074      	move.l d0,116(sp)
    22ee:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    22f4:	2c40           	movea.l d0,a6
    22f6:	222f 007c      	move.l 124(sp),d1
    22fa:	242f 0078      	move.l 120(sp),d2
    22fe:	262f 0074      	move.l 116(sp),d3
    2302:	4eae ffd0      	jsr -48(a6)
    2306:	2f40 0070      	move.l d0,112(sp)
    230a:	6000 01f2      	bra.w 24fe <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    230e:	7028           	moveq #40,d0
    2310:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2314:	52af 00fc      	addq.l #1,252(sp)
    2318:	7001           	moveq #1,d0
    231a:	b0af 00fc      	cmp.l 252(sp),d0
    231e:	6c9c           	bge.s 22bc <Test_Zoom2+0x398>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2320:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    2326:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    232c:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    2332:	317c e000 0070 	move.w #-8192,112(a0)

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2338:	4878 0001      	pea 1 <_start+0x1>
    233c:	4878 004e      	pea 4e <_start+0x4e>
    2340:	4878 0026      	pea 26 <_start+0x26>
    2344:	4878 0002      	pea 2 <_start+0x2>
    2348:	2f2f 00d4      	move.l 212(sp),-(sp)
    234c:	2f2f 00e8      	move.l 232(sp),-(sp)
    2350:	2f2f 00fc      	move.l 252(sp),-(sp)
    2354:	4eba ece4      	jsr 103a <Zoom_ZoomBlit2>(pc)
    2358:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    235c:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2362:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    2368:	2c40           	movea.l d0,a6
    236a:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    236e:	42af 00f8      	clr.l 248(sp)
    2372:	605c           	bra.s 23d0 <Test_Zoom2+0x4ac>
    if( *tmp != 0xaaaa ) {
    2374:	206f 0108      	movea.l 264(sp),a0
    2378:	3010           	move.w (a0),d0
    237a:	0c40 aaaa      	cmpi.w #-21846,d0
    237e:	6746           	beq.s 23c6 <Test_Zoom2+0x4a2>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    2380:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2386:	2c40           	movea.l d0,a6
    2388:	4eae ffc4      	jsr -60(a6)
    238c:	2f40 0094      	move.l d0,148(sp)
    2390:	202f 0094      	move.l 148(sp),d0
    2394:	2f40 0090      	move.l d0,144(sp)
    2398:	2f7c 0000 7e6f 	move.l #32367,140(sp)
    239e:	008c 
    23a0:	7028           	moveq #40,d0
    23a2:	2f40 0088      	move.l d0,136(sp)
    23a6:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    23ac:	2c40           	movea.l d0,a6
    23ae:	222f 0090      	move.l 144(sp),d1
    23b2:	242f 008c      	move.l 140(sp),d2
    23b6:	262f 0088      	move.l 136(sp),d3
    23ba:	4eae ffd0      	jsr -48(a6)
    23be:	2f40 0084      	move.l d0,132(sp)
    23c2:	6000 013a      	bra.w 24fe <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    23c6:	7028           	moveq #40,d0
    23c8:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    23cc:	52af 00f8      	addq.l #1,248(sp)
    23d0:	7001           	moveq #1,d0
    23d2:	b0af 00f8      	cmp.l 248(sp),d0
    23d6:	6c9c           	bge.s 2374 <Test_Zoom2+0x450>
  //srcsmall:            1010 1010 1010 1010
  //srcsmall-shift:      0101 0101 0101 0101
  //pattern:             sssb bbbb bbbb bbbb
  //result:              0100 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    23d8:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    23de:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    23e4:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    23ea:	317c e000 0070 	move.w #-8192,112(a0)
  hw->bltcon0 = 0xde4 + (1 << 12); //Chanell settings and Shift src small
    23f0:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    23f6:	317c 1de4 0040 	move.w #7652,64(a0)
 
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    23fc:	4878 0001      	pea 1 <_start+0x1>
    2400:	4878 004e      	pea 4e <_start+0x4e>
    2404:	4878 0026      	pea 26 <_start+0x26>
    2408:	4878 0002      	pea 2 <_start+0x2>
    240c:	2f2f 00d4      	move.l 212(sp),-(sp)
    2410:	2f2f 00e8      	move.l 232(sp),-(sp)
    2414:	2f2f 00fc      	move.l 252(sp),-(sp)
    2418:	4eba ec20      	jsr 103a <Zoom_ZoomBlit2>(pc)
    241c:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2420:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2426:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    242c:	2c40           	movea.l d0,a6
    242e:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2432:	42af 00f4      	clr.l 244(sp)
    2436:	605a           	bra.s 2492 <Test_Zoom2+0x56e>
    if( *tmp != 0x4aaa ) {
    2438:	206f 0108      	movea.l 264(sp),a0
    243c:	3010           	move.w (a0),d0
    243e:	0c40 4aaa      	cmpi.w #19114,d0
    2442:	6744           	beq.s 2488 <Test_Zoom2+0x564>
      Write( Output(), "Test_Zoom2: Test for shifting a failed\n", 39);
    2444:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    244a:	2c40           	movea.l d0,a6
    244c:	4eae ffc4      	jsr -60(a6)
    2450:	2f40 00a8      	move.l d0,168(sp)
    2454:	202f 00a8      	move.l 168(sp),d0
    2458:	2f40 00a4      	move.l d0,164(sp)
    245c:	2f7c 0000 7e98 	move.l #32408,160(sp)
    2462:	00a0 
    2464:	7027           	moveq #39,d0
    2466:	2f40 009c      	move.l d0,156(sp)
    246a:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2470:	2c40           	movea.l d0,a6
    2472:	222f 00a4      	move.l 164(sp),d1
    2476:	242f 00a0      	move.l 160(sp),d2
    247a:	262f 009c      	move.l 156(sp),d3
    247e:	4eae ffd0      	jsr -48(a6)
    2482:	2f40 0098      	move.l d0,152(sp)
    2486:	6076           	bra.s 24fe <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    2488:	7028           	moveq #40,d0
    248a:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    248e:	52af 00f4      	addq.l #1,244(sp)
    2492:	7001           	moveq #1,d0
    2494:	b0af 00f4      	cmp.l 244(sp),d0
    2498:	6c9e           	bge.s 2438 <Test_Zoom2+0x514>

  FreeMem( srcsmall, 80);
    249a:	2f6f 00e4 00c0 	move.l 228(sp),192(sp)
    24a0:	7050           	moveq #80,d0
    24a2:	2f40 00bc      	move.l d0,188(sp)
    24a6:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    24ac:	2c40           	movea.l d0,a6
    24ae:	226f 00c0      	movea.l 192(sp),a1
    24b2:	202f 00bc      	move.l 188(sp),d0
    24b6:	4eae ff2e      	jsr -210(a6)
  FreeMem( srcbig, 160);
    24ba:	2f6f 00d4 00b8 	move.l 212(sp),184(sp)
    24c0:	2f7c 0000 00a0 	move.l #160,180(sp)
    24c6:	00b4 
    24c8:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    24ce:	2c40           	movea.l d0,a6
    24d0:	226f 00b8      	movea.l 184(sp),a1
    24d4:	202f 00b4      	move.l 180(sp),d0
    24d8:	4eae ff2e      	jsr -210(a6)
  FreeMem( target, 168);
    24dc:	2f6f 00c4 00b0 	move.l 196(sp),176(sp)
    24e2:	2f7c 0000 00a8 	move.l #168,172(sp)
    24e8:	00ac 
    24ea:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    24f0:	2c40           	movea.l d0,a6
    24f2:	226f 00b0      	movea.l 176(sp),a1
    24f6:	202f 00ac      	move.l 172(sp),d0
    24fa:	4eae ff2e      	jsr -210(a6)
    24fe:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2502:	4fef 0100      	lea 256(sp),sp
    2506:	4e75           	rts

00002508 <ClBuild>:
#include "utils.h"




ULONG * ClBuild() {
    2508:	4fef ffc4      	lea -60(sp),sp
    250c:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
    2510:	2f7c 0000 0084 	move.l #132,48(sp)
    2516:	0030 
    2518:	7002           	moveq #2,d0
    251a:	2f40 002c      	move.l d0,44(sp)
    251e:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    2524:	2c40           	movea.l d0,a6
    2526:	202f 0030      	move.l 48(sp),d0
    252a:	222f 002c      	move.l 44(sp),d1
    252e:	4eae ff3a      	jsr -198(a6)
    2532:	2f40 0028      	move.l d0,40(sp)
    2536:	202f 0028      	move.l 40(sp),d0
    253a:	2f40 0024      	move.l d0,36(sp)
  if( retval == 0) {
    253e:	6658           	bne.s 2598 <ClBuild+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2540:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2546:	2c40           	movea.l d0,a6
    2548:	4eae ffc4      	jsr -60(a6)
    254c:	2f40 0020      	move.l d0,32(sp)
    2550:	202f 0020      	move.l 32(sp),d0
    2554:	2f40 001c      	move.l d0,28(sp)
    2558:	2f7c 0000 7d2b 	move.l #32043,24(sp)
    255e:	0018 
    2560:	7228           	moveq #40,d1
    2562:	2f41 0014      	move.l d1,20(sp)
    2566:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    256c:	2c40           	movea.l d0,a6
    256e:	222f 001c      	move.l 28(sp),d1
    2572:	242f 0018      	move.l 24(sp),d2
    2576:	262f 0014      	move.l 20(sp),d3
    257a:	4eae ffd0      	jsr -48(a6)
    257e:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    2582:	7401           	moveq #1,d2
    2584:	2f42 000c      	move.l d2,12(sp)
    2588:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    258e:	2c40           	movea.l d0,a6
    2590:	222f 000c      	move.l 12(sp),d1
    2594:	4eae ff70      	jsr -144(a6)
  }
    
  ULONG *cl = retval;
    2598:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    259e:	2f7c 0000 a6c4 	move.l #42692,64(sp)
    25a4:	0040 
  for(int i=0; i<16;i++)
    25a6:	42af 003c      	clr.l 60(sp)
    25aa:	6024           	bra.s 25d0 <ClBuild+0xc8>
    *cl++ = *clpartinstruction++;
    25ac:	222f 0040      	move.l 64(sp),d1
    25b0:	2001           	move.l d1,d0
    25b2:	5880           	addq.l #4,d0
    25b4:	2f40 0040      	move.l d0,64(sp)
    25b8:	202f 0044      	move.l 68(sp),d0
    25bc:	2400           	move.l d0,d2
    25be:	5882           	addq.l #4,d2
    25c0:	2f42 0044      	move.l d2,68(sp)
    25c4:	2041           	movea.l d1,a0
    25c6:	2210           	move.l (a0),d1
    25c8:	2040           	movea.l d0,a0
    25ca:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    25cc:	52af 003c      	addq.l #1,60(sp)
    25d0:	700f           	moveq #15,d0
    25d2:	b0af 003c      	cmp.l 60(sp),d0
    25d6:	6cd4           	bge.s 25ac <ClBuild+0xa4>
  clpartinstruction = ClScreen;
    25d8:	2f7c 0000 a704 	move.l #42756,64(sp)
    25de:	0040 
  for(int i=0; i<12;i++)
    25e0:	42af 0038      	clr.l 56(sp)
    25e4:	6024           	bra.s 260a <ClBuild+0x102>
    *cl++ = *clpartinstruction++;
    25e6:	222f 0040      	move.l 64(sp),d1
    25ea:	2401           	move.l d1,d2
    25ec:	5882           	addq.l #4,d2
    25ee:	2f42 0040      	move.l d2,64(sp)
    25f2:	202f 0044      	move.l 68(sp),d0
    25f6:	2400           	move.l d0,d2
    25f8:	5882           	addq.l #4,d2
    25fa:	2f42 0044      	move.l d2,68(sp)
    25fe:	2041           	movea.l d1,a0
    2600:	2210           	move.l (a0),d1
    2602:	2040           	movea.l d0,a0
    2604:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    2606:	52af 0038      	addq.l #1,56(sp)
    260a:	700b           	moveq #11,d0
    260c:	b0af 0038      	cmp.l 56(sp),d0
    2610:	6cd4           	bge.s 25e6 <ClBuild+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    2612:	202f 0044      	move.l 68(sp),d0
    2616:	2200           	move.l d0,d1
    2618:	5881           	addq.l #4,d1
    261a:	2f41 0044      	move.l d1,68(sp)
    261e:	2040           	movea.l d0,a0
    2620:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    2626:	202f 0044      	move.l 68(sp),d0
    262a:	2200           	move.l d0,d1
    262c:	5881           	addq.l #4,d1
    262e:	2f41 0044      	move.l d1,68(sp)
    2632:	2040           	movea.l d0,a0
    2634:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
    263a:	2f7c 0000 a644 	move.l #42564,64(sp)
    2640:	0040 
  for(int i=0; i<2;i++)
    2642:	42af 0034      	clr.l 52(sp)
    2646:	6024           	bra.s 266c <ClBuild+0x164>
    *cl++ = *clpartinstruction++;
    2648:	222f 0040      	move.l 64(sp),d1
    264c:	2001           	move.l d1,d0
    264e:	5880           	addq.l #4,d0
    2650:	2f40 0040      	move.l d0,64(sp)
    2654:	202f 0044      	move.l 68(sp),d0
    2658:	2400           	move.l d0,d2
    265a:	5882           	addq.l #4,d2
    265c:	2f42 0044      	move.l d2,68(sp)
    2660:	2041           	movea.l d1,a0
    2662:	2210           	move.l (a0),d1
    2664:	2040           	movea.l d0,a0
    2666:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
    2668:	52af 0034      	addq.l #1,52(sp)
    266c:	7001           	moveq #1,d0
    266e:	b0af 0034      	cmp.l 52(sp),d0
    2672:	6cd4           	bge.s 2648 <ClBuild+0x140>
  *cl = 0xfffffffe;
    2674:	206f 0044      	movea.l 68(sp),a0
    2678:	72fe           	moveq #-2,d1
    267a:	2081           	move.l d1,(a0)

  return retval;
    267c:	202f 0024      	move.l 36(sp),d0
}
    2680:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2684:	4fef 003c      	lea 60(sp),sp
    2688:	4e75           	rts

0000268a <PrepareDisplay>:

int PrepareDisplay() {
    268a:	4fef ffb8      	lea -72(sp),sp
    268e:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClBuild( );
    2692:	4eba fe74      	jsr 2508 <ClBuild>(pc)
    2696:	23c0 004d 2c40 	move.l d0,4d2c40 <Copperlist1>
  Copperlist2 = ClBuild( );
    269c:	4eba fe6a      	jsr 2508 <ClBuild>(pc)
    26a0:	23c0 004d 2c44 	move.l d0,4d2c44 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    26a6:	2f7c 0000 c800 	move.l #51200,80(sp)
    26ac:	0050 
    26ae:	7002           	moveq #2,d0
    26b0:	2f40 004c      	move.l d0,76(sp)
    26b4:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    26ba:	2c40           	movea.l d0,a6
    26bc:	202f 0050      	move.l 80(sp),d0
    26c0:	222f 004c      	move.l 76(sp),d1
    26c4:	4eae ff3a      	jsr -198(a6)
    26c8:	2f40 0048      	move.l d0,72(sp)
    26cc:	202f 0048      	move.l 72(sp),d0
    26d0:	23c0 004d 2c38 	move.l d0,4d2c38 <Bitplane1>
  if(Bitplane1 == 0) {
    26d6:	2039 004d 2c38 	move.l 4d2c38 <Bitplane1>,d0
    26dc:	6658           	bne.s 2736 <PrepareDisplay+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    26de:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    26e4:	2c40           	movea.l d0,a6
    26e6:	4eae ffc4      	jsr -60(a6)
    26ea:	2f40 0044      	move.l d0,68(sp)
    26ee:	202f 0044      	move.l 68(sp),d0
    26f2:	2f40 0040      	move.l d0,64(sp)
    26f6:	2f7c 0000 7cdd 	move.l #31965,60(sp)
    26fc:	003c 
    26fe:	7026           	moveq #38,d0
    2700:	2f40 0038      	move.l d0,56(sp)
    2704:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    270a:	2c40           	movea.l d0,a6
    270c:	222f 0040      	move.l 64(sp),d1
    2710:	242f 003c      	move.l 60(sp),d2
    2714:	262f 0038      	move.l 56(sp),d3
    2718:	4eae ffd0      	jsr -48(a6)
    271c:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    2720:	7001           	moveq #1,d0
    2722:	2f40 0030      	move.l d0,48(sp)
    2726:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    272c:	2c40           	movea.l d0,a6
    272e:	222f 0030      	move.l 48(sp),d1
    2732:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane1;
    2736:	2039 004d 2c38 	move.l 4d2c38 <Bitplane1>,d0
    273c:	23c0 004d 2c4c 	move.l d0,4d2c4c <ViewBuffer>
  ViewCopper = Copperlist1;
    2742:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    2748:	23c0 004d 2c54 	move.l d0,4d2c54 <ViewCopper>
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    274e:	2f7c 0000 c800 	move.l #51200,44(sp)
    2754:	002c 
    2756:	7002           	moveq #2,d0
    2758:	2f40 0028      	move.l d0,40(sp)
    275c:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    2762:	2c40           	movea.l d0,a6
    2764:	202f 002c      	move.l 44(sp),d0
    2768:	222f 0028      	move.l 40(sp),d1
    276c:	4eae ff3a      	jsr -198(a6)
    2770:	2f40 0024      	move.l d0,36(sp)
    2774:	202f 0024      	move.l 36(sp),d0
    2778:	23c0 004d 2c3c 	move.l d0,4d2c3c <Bitplane2>
  if(Bitplane2 == 0) {
    277e:	2039 004d 2c3c 	move.l 4d2c3c <Bitplane2>,d0
    2784:	6658           	bne.s 27de <PrepareDisplay+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2786:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    278c:	2c40           	movea.l d0,a6
    278e:	4eae ffc4      	jsr -60(a6)
    2792:	2f40 0020      	move.l d0,32(sp)
    2796:	202f 0020      	move.l 32(sp),d0
    279a:	2f40 001c      	move.l d0,28(sp)
    279e:	2f7c 0000 7d04 	move.l #32004,24(sp)
    27a4:	0018 
    27a6:	7026           	moveq #38,d0
    27a8:	2f40 0014      	move.l d0,20(sp)
    27ac:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    27b2:	2c40           	movea.l d0,a6
    27b4:	222f 001c      	move.l 28(sp),d1
    27b8:	242f 0018      	move.l 24(sp),d2
    27bc:	262f 0014      	move.l 20(sp),d3
    27c0:	4eae ffd0      	jsr -48(a6)
    27c4:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    27c8:	7001           	moveq #1,d0
    27ca:	2f40 000c      	move.l d0,12(sp)
    27ce:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    27d4:	2c40           	movea.l d0,a6
    27d6:	222f 000c      	move.l 12(sp),d1
    27da:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane2;
    27de:	2039 004d 2c3c 	move.l 4d2c3c <Bitplane2>,d0
    27e4:	23c0 004d 2c48 	move.l d0,4d2c48 <DrawBuffer>
  DrawCopper = Copperlist2;
    27ea:	2039 004d 2c44 	move.l 4d2c44 <Copperlist2>,d0
    27f0:	23c0 004d 2c50 	move.l d0,4d2c50 <DrawCopper>
  /*SwapCl();
  SetBplPointers();
  SwapCl();
  SetBplPointers();*/
  return 0;
    27f6:	7000           	moveq #0,d0
}
    27f8:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    27fc:	4fef 0048      	lea 72(sp),sp
    2800:	4e75           	rts

00002802 <TestCopperlistBatch>:

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                  long length) {
    2802:	598f           	subq.l #4,sp
  for( int i=0;i<length;i++)
    2804:	4297           	clr.l (sp)
    2806:	602a           	bra.s 2832 <TestCopperlistBatch+0x30>
    if( instructions[ pos+i] != batch[ i])
    2808:	202f 000c      	move.l 12(sp),d0
    280c:	d097           	add.l (sp),d0
    280e:	d080           	add.l d0,d0
    2810:	d080           	add.l d0,d0
    2812:	206f 0008      	movea.l 8(sp),a0
    2816:	d1c0           	adda.l d0,a0
    2818:	2210           	move.l (a0),d1
    281a:	2017           	move.l (sp),d0
    281c:	d080           	add.l d0,d0
    281e:	d080           	add.l d0,d0
    2820:	206f 0010      	movea.l 16(sp),a0
    2824:	d1c0           	adda.l d0,a0
    2826:	2010           	move.l (a0),d0
    2828:	b081           	cmp.l d1,d0
    282a:	6704           	beq.s 2830 <TestCopperlistBatch+0x2e>
      return 0;
    282c:	7000           	moveq #0,d0
    282e:	600c           	bra.s 283c <TestCopperlistBatch+0x3a>
  for( int i=0;i<length;i++)
    2830:	5297           	addq.l #1,(sp)
    2832:	2017           	move.l (sp),d0
    2834:	b0af 0014      	cmp.l 20(sp),d0
    2838:	6dce           	blt.s 2808 <TestCopperlistBatch+0x6>
  return 1;
    283a:	7001           	moveq #1,d0
}
    283c:	588f           	addq.l #4,sp
    283e:	4e75           	rts

00002840 <TestCopperlistPos>:

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    2840:	202f 0008      	move.l 8(sp),d0
    2844:	d080           	add.l d0,d0
    2846:	d080           	add.l d0,d0
    2848:	206f 0004      	movea.l 4(sp),a0
    284c:	d1c0           	adda.l d0,a0
    284e:	2010           	move.l (a0),d0
    2850:	b0af 000c      	cmp.l 12(sp),d0
    2854:	6604           	bne.s 285a <TestCopperlistPos+0x1a>
    return 1;
    2856:	7001           	moveq #1,d0
    2858:	6002           	bra.s 285c <TestCopperlistPos+0x1c>
  else 
    return 0;
    285a:	7000           	moveq #0,d0
}
    285c:	4e75           	rts

0000285e <TestCopperList>:

void TestCopperList() {
    285e:	4fef feb8      	lea -328(sp),sp
    2862:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Write( Output(), "%d", hw->cop1lc);
    2866:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    286c:	2c40           	movea.l d0,a6
    286e:	4eae ffc4      	jsr -60(a6)
    2872:	2f40 0150      	move.l d0,336(sp)
    2876:	202f 0150      	move.l 336(sp),d0
    287a:	2f40 014c      	move.l d0,332(sp)
    287e:	2f7c 0000 7ec0 	move.l #32448,328(sp)
    2884:	0148 
    2886:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    288c:	2028 0080      	move.l 128(a0),d0
    2890:	2f40 0144      	move.l d0,324(sp)
    2894:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    289a:	2c40           	movea.l d0,a6
    289c:	222f 014c      	move.l 332(sp),d1
    28a0:	242f 0148      	move.l 328(sp),d2
    28a4:	262f 0144      	move.l 324(sp),d3
    28a8:	4eae ffd0      	jsr -48(a6)
    28ac:	2f40 0140      	move.l d0,320(sp)
  Copperlist1 = ClBuild();
    28b0:	4eba fc56      	jsr 2508 <ClBuild>(pc)
    28b4:	23c0 004d 2c40 	move.l d0,4d2c40 <Copperlist1>
  DrawCopper = Copperlist1;
    28ba:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    28c0:	23c0 004d 2c50 	move.l d0,4d2c50 <DrawCopper>
  Copperlist2 = ClBuild();
    28c6:	4eba fc40      	jsr 2508 <ClBuild>(pc)
    28ca:	23c0 004d 2c44 	move.l d0,4d2c44 <Copperlist2>
  ViewCopper = Copperlist2;
    28d0:	2039 004d 2c44 	move.l 4d2c44 <Copperlist2>,d0
    28d6:	23c0 004d 2c54 	move.l d0,4d2c54 <ViewCopper>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    28dc:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    28e2:	4878 0010      	pea 10 <_start+0x10>
    28e6:	4879 0000 a6c4 	pea a6c4 <ClsSprites>
    28ec:	42a7           	clr.l -(sp)
    28ee:	2f00           	move.l d0,-(sp)
    28f0:	4eba ff10      	jsr 2802 <TestCopperlistBatch>(pc)
    28f4:	4fef 0010      	lea 16(sp),sp
    28f8:	4a80           	tst.l d0
    28fa:	6642           	bne.s 293e <TestCopperList+0xe0>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    28fc:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2902:	2c40           	movea.l d0,a6
    2904:	4eae ffc4      	jsr -60(a6)
    2908:	2f40 013c      	move.l d0,316(sp)
    290c:	202f 013c      	move.l 316(sp),d0
    2910:	2f40 0138      	move.l d0,312(sp)
    2914:	2f7c 0000 7648 	move.l #30280,308(sp)
    291a:	0134 
    291c:	702c           	moveq #44,d0
    291e:	2f40 0130      	move.l d0,304(sp)
    2922:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2928:	2c40           	movea.l d0,a6
    292a:	222f 0138      	move.l 312(sp),d1
    292e:	242f 0134      	move.l 308(sp),d2
    2932:	262f 0130      	move.l 304(sp),d3
    2936:	4eae ffd0      	jsr -48(a6)
    293a:	2f40 012c      	move.l d0,300(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    293e:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    2944:	4878 000c      	pea c <_start+0xc>
    2948:	4879 0000 a704 	pea a704 <ClScreen>
    294e:	4878 0010      	pea 10 <_start+0x10>
    2952:	2f00           	move.l d0,-(sp)
    2954:	4eba feac      	jsr 2802 <TestCopperlistBatch>(pc)
    2958:	4fef 0010      	lea 16(sp),sp
    295c:	4a80           	tst.l d0
    295e:	6642           	bne.s 29a2 <TestCopperList+0x144>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    2960:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2966:	2c40           	movea.l d0,a6
    2968:	4eae ffc4      	jsr -60(a6)
    296c:	2f40 0128      	move.l d0,296(sp)
    2970:	202f 0128      	move.l 296(sp),d0
    2974:	2f40 0124      	move.l d0,292(sp)
    2978:	2f7c 0000 767e 	move.l #30334,288(sp)
    297e:	0120 
    2980:	7036           	moveq #54,d0
    2982:	2f40 011c      	move.l d0,284(sp)
    2986:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    298c:	2c40           	movea.l d0,a6
    298e:	222f 0124      	move.l 292(sp),d1
    2992:	242f 0120      	move.l 288(sp),d2
    2996:	262f 011c      	move.l 284(sp),d3
    299a:	4eae ffd0      	jsr -48(a6)
    299e:	2f40 0118      	move.l d0,280(sp)
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
    29a2:	23fc 0004 0000 	move.l #262144,4d2c48 <DrawBuffer>
    29a8:	004d 2c48 
  ViewBuffer = (ULONG *)0x50000;
    29ac:	23fc 0005 0000 	move.l #327680,4d2c4c <ViewBuffer>
    29b2:	004d 2c4c 
  
  SetBplPointers();
    29b6:	4eba d78a      	jsr 142 <SetBplPointers>(pc)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    29ba:	2039 004d 2c48 	move.l 4d2c48 <DrawBuffer>,d0
    29c0:	0c80 0005 0000 	cmpi.l #327680,d0
    29c6:	660e           	bne.s 29d6 <TestCopperList+0x178>
    29c8:	2039 004d 2c4c 	move.l 4d2c4c <ViewBuffer>,d0
    29ce:	0c80 0004 0000 	cmpi.l #262144,d0
    29d4:	6742           	beq.s 2a18 <TestCopperList+0x1ba>
    Write( Output(), 
    29d6:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    29dc:	2c40           	movea.l d0,a6
    29de:	4eae ffc4      	jsr -60(a6)
    29e2:	2f40 0114      	move.l d0,276(sp)
    29e6:	202f 0114      	move.l 276(sp),d0
    29ea:	2f40 0110      	move.l d0,272(sp)
    29ee:	2f7c 0000 7ec3 	move.l #32451,268(sp)
    29f4:	010c 
    29f6:	703b           	moveq #59,d0
    29f8:	2f40 0108      	move.l d0,264(sp)
    29fc:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2a02:	2c40           	movea.l d0,a6
    2a04:	222f 0110      	move.l 272(sp),d1
    2a08:	242f 010c      	move.l 268(sp),d2
    2a0c:	262f 0108      	move.l 264(sp),d3
    2a10:	4eae ffd0      	jsr -48(a6)
    2a14:	2f40 0104      	move.l d0,260(sp)
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    2a18:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    2a1e:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    2a24:	4878 001c      	pea 1c <_start+0x1c>
    2a28:	2f00           	move.l d0,-(sp)
    2a2a:	4eba fe14      	jsr 2840 <TestCopperlistPos>(pc)
    2a2e:	4fef 000c      	lea 12(sp),sp
    2a32:	4a80           	tst.l d0
    2a34:	6642           	bne.s 2a78 <TestCopperList+0x21a>
    Write(Output(), 
    2a36:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2a3c:	2c40           	movea.l d0,a6
    2a3e:	4eae ffc4      	jsr -60(a6)
    2a42:	2f40 0100      	move.l d0,256(sp)
    2a46:	202f 0100      	move.l 256(sp),d0
    2a4a:	2f40 00fc      	move.l d0,252(sp)
    2a4e:	2f7c 0000 7eff 	move.l #32511,248(sp)
    2a54:	00f8 
    2a56:	703c           	moveq #60,d0
    2a58:	2f40 00f4      	move.l d0,244(sp)
    2a5c:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2a62:	2c40           	movea.l d0,a6
    2a64:	222f 00fc      	move.l 252(sp),d1
    2a68:	242f 00f8      	move.l 248(sp),d2
    2a6c:	262f 00f4      	move.l 244(sp),d3
    2a70:	4eae ffd0      	jsr -48(a6)
    2a74:	2f40 00f0      	move.l d0,240(sp)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    2a78:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    2a7e:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    2a84:	4878 001d      	pea 1d <_start+0x1d>
    2a88:	2f00           	move.l d0,-(sp)
    2a8a:	4eba fdb4      	jsr 2840 <TestCopperlistPos>(pc)
    2a8e:	4fef 000c      	lea 12(sp),sp
    2a92:	4a80           	tst.l d0
    2a94:	6642           	bne.s 2ad8 <TestCopperList+0x27a>
    Write(Output(), 
    2a96:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2a9c:	2c40           	movea.l d0,a6
    2a9e:	4eae ffc4      	jsr -60(a6)
    2aa2:	2f40 00ec      	move.l d0,236(sp)
    2aa6:	202f 00ec      	move.l 236(sp),d0
    2aaa:	2f40 00e8      	move.l d0,232(sp)
    2aae:	2f7c 0000 7f3c 	move.l #32572,228(sp)
    2ab4:	00e4 
    2ab6:	703c           	moveq #60,d0
    2ab8:	2f40 00e0      	move.l d0,224(sp)
    2abc:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2ac2:	2c40           	movea.l d0,a6
    2ac4:	222f 00e8      	move.l 232(sp),d1
    2ac8:	242f 00e4      	move.l 228(sp),d2
    2acc:	262f 00e0      	move.l 224(sp),d3
    2ad0:	4eae ffd0      	jsr -48(a6)
    2ad4:	2f40 00dc      	move.l d0,220(sp)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2ad8:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    2ade:	4878 0002      	pea 2 <_start+0x2>
    2ae2:	4879 0000 a644 	pea a644 <ClColor>
    2ae8:	4878 001e      	pea 1e <_start+0x1e>
    2aec:	2f00           	move.l d0,-(sp)
    2aee:	4eba fd12      	jsr 2802 <TestCopperlistBatch>(pc)
    2af2:	4fef 0010      	lea 16(sp),sp
    2af6:	4a80           	tst.l d0
    2af8:	6642           	bne.s 2b3c <TestCopperList+0x2de>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2afa:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2b00:	2c40           	movea.l d0,a6
    2b02:	4eae ffc4      	jsr -60(a6)
    2b06:	2f40 00d8      	move.l d0,216(sp)
    2b0a:	202f 00d8      	move.l 216(sp),d0
    2b0e:	2f40 00d4      	move.l d0,212(sp)
    2b12:	2f7c 0000 76b5 	move.l #30389,208(sp)
    2b18:	00d0 
    2b1a:	7021           	moveq #33,d0
    2b1c:	2f40 00cc      	move.l d0,204(sp)
    2b20:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2b26:	2c40           	movea.l d0,a6
    2b28:	222f 00d4      	move.l 212(sp),d1
    2b2c:	242f 00d0      	move.l 208(sp),d2
    2b30:	262f 00cc      	move.l 204(sp),d3
    2b34:	4eae ffd0      	jsr -48(a6)
    2b38:	2f40 00c8      	move.l d0,200(sp)

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2b3c:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    2b42:	4878 fffe      	pea fffffffe <_end+0xffb2d34e>
    2b46:	4878 0020      	pea 20 <_start+0x20>
    2b4a:	2f00           	move.l d0,-(sp)
    2b4c:	4eba fcf2      	jsr 2840 <TestCopperlistPos>(pc)
    2b50:	4fef 000c      	lea 12(sp),sp
    2b54:	4a80           	tst.l d0
    2b56:	6642           	bne.s 2b9a <TestCopperList+0x33c>
    Write(Output(), "Copperlist End not correctly set.\n", 34);
    2b58:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2b5e:	2c40           	movea.l d0,a6
    2b60:	4eae ffc4      	jsr -60(a6)
    2b64:	2f40 00c4      	move.l d0,196(sp)
    2b68:	202f 00c4      	move.l 196(sp),d0
    2b6c:	2f40 00c0      	move.l d0,192(sp)
    2b70:	2f7c 0000 76d7 	move.l #30423,188(sp)
    2b76:	00bc 
    2b78:	7022           	moveq #34,d0
    2b7a:	2f40 00b8      	move.l d0,184(sp)
    2b7e:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2b84:	2c40           	movea.l d0,a6
    2b86:	222f 00c0      	move.l 192(sp),d1
    2b8a:	242f 00bc      	move.l 188(sp),d2
    2b8e:	262f 00b8      	move.l 184(sp),d3
    2b92:	4eae ffd0      	jsr -48(a6)
    2b96:	2f40 00b4      	move.l d0,180(sp)
  
  SwapCl();
    2b9a:	4eba d604      	jsr 1a0 <SwapCl>(pc)
  
  if( DrawCopper != Copperlist2)
    2b9e:	2239 004d 2c50 	move.l 4d2c50 <DrawCopper>,d1
    2ba4:	2039 004d 2c44 	move.l 4d2c44 <Copperlist2>,d0
    2baa:	b081           	cmp.l d1,d0
    2bac:	6742           	beq.s 2bf0 <TestCopperList+0x392>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
    2bae:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2bb4:	2c40           	movea.l d0,a6
    2bb6:	4eae ffc4      	jsr -60(a6)
    2bba:	2f40 00b0      	move.l d0,176(sp)
    2bbe:	202f 00b0      	move.l 176(sp),d0
    2bc2:	2f40 00ac      	move.l d0,172(sp)
    2bc6:	2f7c 0000 7f79 	move.l #32633,168(sp)
    2bcc:	00a8 
    2bce:	7015           	moveq #21,d0
    2bd0:	2f40 00a4      	move.l d0,164(sp)
    2bd4:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2bda:	2c40           	movea.l d0,a6
    2bdc:	222f 00ac      	move.l 172(sp),d1
    2be0:	242f 00a8      	move.l 168(sp),d2
    2be4:	262f 00a4      	move.l 164(sp),d3
    2be8:	4eae ffd0      	jsr -48(a6)
    2bec:	2f40 00a0      	move.l d0,160(sp)

  
  PrepareDisplay();
    2bf0:	4eba fa98      	jsr 268a <PrepareDisplay>(pc)
  if( DrawBuffer != Bitplane2) 
    2bf4:	2239 004d 2c48 	move.l 4d2c48 <DrawBuffer>,d1
    2bfa:	2039 004d 2c3c 	move.l 4d2c3c <Bitplane2>,d0
    2c00:	b081           	cmp.l d1,d0
    2c02:	6742           	beq.s 2c46 <TestCopperList+0x3e8>
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
    2c04:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2c0a:	2c40           	movea.l d0,a6
    2c0c:	4eae ffc4      	jsr -60(a6)
    2c10:	2f40 009c      	move.l d0,156(sp)
    2c14:	202f 009c      	move.l 156(sp),d0
    2c18:	2f40 0098      	move.l d0,152(sp)
    2c1c:	2f7c 0000 7f8f 	move.l #32655,148(sp)
    2c22:	0094 
    2c24:	7037           	moveq #55,d0
    2c26:	2f40 0090      	move.l d0,144(sp)
    2c2a:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2c30:	2c40           	movea.l d0,a6
    2c32:	222f 0098      	move.l 152(sp),d1
    2c36:	242f 0094      	move.l 148(sp),d2
    2c3a:	262f 0090      	move.l 144(sp),d3
    2c3e:	4eae ffd0      	jsr -48(a6)
    2c42:	2f40 008c      	move.l d0,140(sp)
                                                                            55);
  if( DrawCopper != Copperlist2) 
    2c46:	2239 004d 2c50 	move.l 4d2c50 <DrawCopper>,d1
    2c4c:	2039 004d 2c44 	move.l 4d2c44 <Copperlist2>,d0
    2c52:	b081           	cmp.l d1,d0
    2c54:	6742           	beq.s 2c98 <TestCopperList+0x43a>
    Write( Output(), 
    2c56:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2c5c:	2c40           	movea.l d0,a6
    2c5e:	4eae ffc4      	jsr -60(a6)
    2c62:	2f40 0088      	move.l d0,136(sp)
    2c66:	202f 0088      	move.l 136(sp),d0
    2c6a:	2f40 0084      	move.l d0,132(sp)
    2c6e:	2f7c 0000 7fc7 	move.l #32711,128(sp)
    2c74:	0080 
    2c76:	7039           	moveq #57,d0
    2c78:	2f40 007c      	move.l d0,124(sp)
    2c7c:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2c82:	2c40           	movea.l d0,a6
    2c84:	222f 0084      	move.l 132(sp),d1
    2c88:	242f 0080      	move.l 128(sp),d2
    2c8c:	262f 007c      	move.l 124(sp),d3
    2c90:	4eae ffd0      	jsr -48(a6)
    2c94:	2f40 0078      	move.l d0,120(sp)
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
    2c98:	2239 004d 2c4c 	move.l 4d2c4c <ViewBuffer>,d1
    2c9e:	2039 004d 2c38 	move.l 4d2c38 <Bitplane1>,d0
    2ca4:	b081           	cmp.l d1,d0
    2ca6:	6742           	beq.s 2cea <TestCopperList+0x48c>
    Write( Output(), 
    2ca8:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2cae:	2c40           	movea.l d0,a6
    2cb0:	4eae ffc4      	jsr -60(a6)
    2cb4:	2f40 0074      	move.l d0,116(sp)
    2cb8:	202f 0074      	move.l 116(sp),d0
    2cbc:	2f40 0070      	move.l d0,112(sp)
    2cc0:	2f7c 0000 8001 	move.l #32769,108(sp)
    2cc6:	006c 
    2cc8:	7038           	moveq #56,d0
    2cca:	2f40 0068      	move.l d0,104(sp)
    2cce:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2cd4:	2c40           	movea.l d0,a6
    2cd6:	222f 0070      	move.l 112(sp),d1
    2cda:	242f 006c      	move.l 108(sp),d2
    2cde:	262f 0068      	move.l 104(sp),d3
    2ce2:	4eae ffd0      	jsr -48(a6)
    2ce6:	2f40 0064      	move.l d0,100(sp)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
    2cea:	2239 004d 2c54 	move.l 4d2c54 <ViewCopper>,d1
    2cf0:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    2cf6:	b081           	cmp.l d1,d0
    2cf8:	6742           	beq.s 2d3c <TestCopperList+0x4de>
    Write( Output(), 
    2cfa:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2d00:	2c40           	movea.l d0,a6
    2d02:	4eae ffc4      	jsr -60(a6)
    2d06:	2f40 0060      	move.l d0,96(sp)
    2d0a:	202f 0060      	move.l 96(sp),d0
    2d0e:	2f40 005c      	move.l d0,92(sp)
    2d12:	2f7c 0000 803a 	move.l #32826,88(sp)
    2d18:	0058 
    2d1a:	703a           	moveq #58,d0
    2d1c:	2f40 0054      	move.l d0,84(sp)
    2d20:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2d26:	2c40           	movea.l d0,a6
    2d28:	222f 005c      	move.l 92(sp),d1
    2d2c:	242f 0058      	move.l 88(sp),d2
    2d30:	262f 0054      	move.l 84(sp),d3
    2d34:	4eae ffd0      	jsr -48(a6)
    2d38:	2f40 0050      	move.l d0,80(sp)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
    2d3c:	4eba d404      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2d40:	4eba d45e      	jsr 1a0 <SwapCl>(pc)
  UWORD *copword = ViewCopper;
    2d44:	2f79 004d 2c54 	move.l 4d2c54 <ViewCopper>,76(sp)
    2d4a:	004c 
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2d4c:	307c 0076      	movea.w #118,a0
    2d50:	d1ef 004c      	adda.l 76(sp),a0
    2d54:	3010           	move.w (a0),d0
    2d56:	7200           	moveq #0,d1
    2d58:	3200           	move.w d0,d1
    2d5a:	307c 0072      	movea.w #114,a0
    2d5e:	d1ef 004c      	adda.l 76(sp),a0
    2d62:	3010           	move.w (a0),d0
    2d64:	3000           	move.w d0,d0
    2d66:	0280 0000 ffff 	andi.l #65535,d0
    2d6c:	4840           	swap d0
    2d6e:	4240           	clr.w d0
    2d70:	d081           	add.l d1,d0
    2d72:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2d76:	2039 004d 2c3c 	move.l 4d2c3c <Bitplane2>,d0
    2d7c:	b0af 0048      	cmp.l 72(sp),d0
    2d80:	6742           	beq.s 2dc4 <TestCopperList+0x566>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2d82:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2d88:	2c40           	movea.l d0,a6
    2d8a:	4eae ffc4      	jsr -60(a6)
    2d8e:	2f40 0044      	move.l d0,68(sp)
    2d92:	202f 0044      	move.l 68(sp),d0
    2d96:	2f40 0040      	move.l d0,64(sp)
    2d9a:	2f7c 0000 8075 	move.l #32885,60(sp)
    2da0:	003c 
    2da2:	7048           	moveq #72,d0
    2da4:	2f40 0038      	move.l d0,56(sp)
    2da8:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2dae:	2c40           	movea.l d0,a6
    2db0:	222f 0040      	move.l 64(sp),d1
    2db4:	242f 003c      	move.l 60(sp),d2
    2db8:	262f 0038      	move.l 56(sp),d3
    2dbc:	4eae ffd0      	jsr -48(a6)
    2dc0:	2f40 0034      	move.l d0,52(sp)
                                                   " after first frame.\n", 72);
  SetBplPointers();
    2dc4:	4eba d37c      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2dc8:	4eba d3d6      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2dcc:	2f79 004d 2c54 	move.l 4d2c54 <ViewCopper>,76(sp)
    2dd2:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2dd4:	307c 0076      	movea.w #118,a0
    2dd8:	d1ef 004c      	adda.l 76(sp),a0
    2ddc:	3010           	move.w (a0),d0
    2dde:	7200           	moveq #0,d1
    2de0:	3200           	move.w d0,d1
    2de2:	307c 0072      	movea.w #114,a0
    2de6:	d1ef 004c      	adda.l 76(sp),a0
    2dea:	3010           	move.w (a0),d0
    2dec:	3000           	move.w d0,d0
    2dee:	0280 0000 ffff 	andi.l #65535,d0
    2df4:	4840           	swap d0
    2df6:	4240           	clr.w d0
    2df8:	d081           	add.l d1,d0
    2dfa:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane1) 
    2dfe:	2039 004d 2c38 	move.l 4d2c38 <Bitplane1>,d0
    2e04:	b0af 0048      	cmp.l 72(sp),d0
    2e08:	6742           	beq.s 2e4c <TestCopperList+0x5ee>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
    2e0a:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2e10:	2c40           	movea.l d0,a6
    2e12:	4eae ffc4      	jsr -60(a6)
    2e16:	2f40 0030      	move.l d0,48(sp)
    2e1a:	202f 0030      	move.l 48(sp),d0
    2e1e:	2f40 002c      	move.l d0,44(sp)
    2e22:	2f7c 0000 80be 	move.l #32958,40(sp)
    2e28:	0028 
    2e2a:	7049           	moveq #73,d0
    2e2c:	2f40 0024      	move.l d0,36(sp)
    2e30:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2e36:	2c40           	movea.l d0,a6
    2e38:	222f 002c      	move.l 44(sp),d1
    2e3c:	242f 0028      	move.l 40(sp),d2
    2e40:	262f 0024      	move.l 36(sp),d3
    2e44:	4eae ffd0      	jsr -48(a6)
    2e48:	2f40 0020      	move.l d0,32(sp)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
    2e4c:	4eba d2f4      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2e50:	4eba d34e      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2e54:	2f79 004d 2c54 	move.l 4d2c54 <ViewCopper>,76(sp)
    2e5a:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2e5c:	307c 0076      	movea.w #118,a0
    2e60:	d1ef 004c      	adda.l 76(sp),a0
    2e64:	3010           	move.w (a0),d0
    2e66:	7200           	moveq #0,d1
    2e68:	3200           	move.w d0,d1
    2e6a:	307c 0072      	movea.w #114,a0
    2e6e:	d1ef 004c      	adda.l 76(sp),a0
    2e72:	3010           	move.w (a0),d0
    2e74:	3000           	move.w d0,d0
    2e76:	0280 0000 ffff 	andi.l #65535,d0
    2e7c:	4840           	swap d0
    2e7e:	4240           	clr.w d0
    2e80:	d081           	add.l d1,d0
    2e82:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2e86:	2039 004d 2c3c 	move.l 4d2c3c <Bitplane2>,d0
    2e8c:	b0af 0048      	cmp.l 72(sp),d0
    2e90:	6742           	beq.s 2ed4 <TestCopperList+0x676>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2e92:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2e98:	2c40           	movea.l d0,a6
    2e9a:	4eae ffc4      	jsr -60(a6)
    2e9e:	2f40 001c      	move.l d0,28(sp)
    2ea2:	202f 001c      	move.l 28(sp),d0
    2ea6:	2f40 0018      	move.l d0,24(sp)
    2eaa:	2f7c 0000 8108 	move.l #33032,20(sp)
    2eb0:	0014 
    2eb2:	7048           	moveq #72,d0
    2eb4:	2f40 0010      	move.l d0,16(sp)
    2eb8:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2ebe:	2c40           	movea.l d0,a6
    2ec0:	222f 0018      	move.l 24(sp),d1
    2ec4:	242f 0014      	move.l 20(sp),d2
    2ec8:	262f 0010      	move.l 16(sp),d3
    2ecc:	4eae ffd0      	jsr -48(a6)
    2ed0:	2f40 000c      	move.l d0,12(sp)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
    2ed4:	2f3c 0000 c800 	move.l #51200,-(sp)
    2eda:	4878 0084      	pea 84 <_start+0x84>
    2ede:	4eba d200      	jsr e0 <FreeDisplay>(pc)
    2ee2:	508f           	addq.l #8,sp
    2ee4:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2ee8:	4fef 0148      	lea 328(sp),sp
    2eec:	4e75           	rts

00002eee <RunTests>:
#include "runtests.h"
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    2eee:	4eba f96e      	jsr 285e <TestCopperList>(pc)
    ZoomTest();
    2ef2:	4eba 0004      	jsr 2ef8 <ZoomTest>(pc)
    //SwScrollerTest();
    2ef6:	4e75           	rts

00002ef8 <ZoomTest>:
#include "zoomtest2.h"

ULONG Cl102ZoomTest[137];

void ZoomTest() {
  TestZoomSpeed();
    2ef8:	4eba 0046      	jsr 2f40 <TestZoomSpeed>(pc)
  ZoomTestDisplay();
    2efc:	4eba 00e2      	jsr 2fe0 <ZoomTestDisplay>(pc)
  TestBlitleftOfZoom();
    2f00:	4eba 05a8      	jsr 34aa <TestBlitleftOfZoom>(pc)
  TestCopyWord();
    2f04:	4eba 0838      	jsr 373e <TestCopyWord>(pc)
  TestZoom4Picture();
    2f08:	4eba 0e12      	jsr 3d1c <TestZoom4Picture>(pc)
  TestZoom4PictureOn5Planes();
    2f0c:	4eba 0b22      	jsr 3a30 <TestZoom4PictureOn5Planes>(pc)
  Test_Zoom2();
    2f10:	4eba f012      	jsr 1f24 <Test_Zoom2>(pc)
  c2p1x1_8_c5_gen_init( 320, 256, 0, 0, 0, 0);
    2f14:	42a7           	clr.l -(sp)
    2f16:	42a7           	clr.l -(sp)
    2f18:	42a7           	clr.l -(sp)
    2f1a:	42a7           	clr.l -(sp)
    2f1c:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2f20:	4878 0140      	pea 140 <FreeDisplay+0x60>
    2f24:	4eb9 0000 7250 	jsr 7250 <c2p1x1_8_c5_gen_init>
    2f2a:	4fef 0018      	lea 24(sp),sp
  c2p1x1_8_c5_gen( 0x100, 0x200);
    2f2e:	4878 0200      	pea 200 <Utils_CopyMem+0x22>
    2f32:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2f36:	4eb9 0000 72cc 	jsr 72cc <c2p1x1_8_c5_gen>
    2f3c:	508f           	addq.l #8,sp
}
    2f3e:	4e75           	rts

00002f40 <TestZoomSpeed>:

int Counter4Frames;

void TestZoomSpeed() {
    2f40:	4fef ffe8      	lea -24(sp),sp
    2f44:	48e7 3002      	movem.l d2-d3/a6,-(sp)

 	TakeSystem();
    2f48:	4eba d630      	jsr 57a <TakeSystem>(pc)
	WaitVbl();
    2f4c:	4eba d5e2      	jsr 530 <WaitVbl>(pc)
  //             fedcba9876543210
  //hw->dmacon = 0x8def;

  hw->dmacon = DMAF_SETCLR | DMAF_AUDIO | DMAF_BLITTER | DMAF_RASTER 
    2f50:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    2f56:	317c 87cf 0096 	move.w #-30769,150(a0)
                                    | DMAF_COPPER | DMAF_MASTER | DMAF_BLITHOG;
   //0b1000011111100000;
  
  //hw->dmacon = 0b1000011111111111;
	hw->intena = (1 << INTB_SETCLR) | (1 << INTB_INTEN) | (1 << INTB_VERTB);
    2f5c:	2079 004d 2c58 	movea.l 4d2c58 <hw>,a0
    2f62:	317c c020 009a 	move.w #-16352,154(a0)
  
  Zoom_InitRun(); 
    2f68:	4eba e14e      	jsr 10b8 <Zoom_InitRun>(pc)

  int success = 1;
    2f6c:	7001           	moveq #1,d0
    2f6e:	2f40 0020      	move.l d0,32(sp)
  RunFrame();
    2f72:	4eba d388      	jsr 2fc <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    2f76:	3039 004d 2c98 	move.w 4d2c98 <Zoom_Counter>,d0
    2f7c:	0c40 0008      	cmpi.w #8,d0
    2f80:	6304           	bls.s 2f86 <TestZoomSpeed+0x46>
    2f82:	42af 0020      	clr.l 32(sp)
    
  Zoom_Dealloc();
    2f86:	4eba e3c8      	jsr 1350 <Zoom_Dealloc>(pc)
  FreeSystem();
    2f8a:	4eba d604      	jsr 590 <FreeSystem>(pc)

  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    2f8e:	4aaf 0020      	tst.l 32(sp)
    2f92:	6642           	bne.s 2fd6 <TestZoomSpeed+0x96>
    2f94:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2f9a:	2c40           	movea.l d0,a6
    2f9c:	4eae ffc4      	jsr -60(a6)
    2fa0:	2f40 001c      	move.l d0,28(sp)
    2fa4:	202f 001c      	move.l 28(sp),d0
    2fa8:	2f40 0018      	move.l d0,24(sp)
    2fac:	2f7c 0000 8151 	move.l #33105,20(sp)
    2fb2:	0014 
    2fb4:	701c           	moveq #28,d0
    2fb6:	2f40 0010      	move.l d0,16(sp)
    2fba:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    2fc0:	2c40           	movea.l d0,a6
    2fc2:	222f 0018      	move.l 24(sp),d1
    2fc6:	242f 0014      	move.l 20(sp),d2
    2fca:	262f 0010      	move.l 16(sp),d3
    2fce:	4eae ffd0      	jsr -48(a6)
    2fd2:	2f40 000c      	move.l d0,12(sp)

  //AddIntServer(INTB_VERTB, vbint);
  //RemIntServer(INTB_VERTB, vbint);
  
}
    2fd6:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2fda:	4fef 0018      	lea 24(sp),sp
    2fde:	4e75           	rts

00002fe0 <ZoomTestDisplay>:

void ZoomTestDisplay() {
    2fe0:	4fef ff38      	lea -200(sp),sp
    2fe4:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Zoom_Init();
    2fe8:	4eba e476      	jsr 1460 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    2fec:	4eba e80c      	jsr 17fa <PrepareDisplayZoom>(pc)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2ff0:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    2ff6:	4878 0010      	pea 10 <_start+0x10>
    2ffa:	4879 0000 a6c4 	pea a6c4 <ClsSprites>
    3000:	42a7           	clr.l -(sp)
    3002:	2f00           	move.l d0,-(sp)
    3004:	4eba f7fc      	jsr 2802 <TestCopperlistBatch>(pc)
    3008:	4fef 0010      	lea 16(sp),sp
    300c:	4a80           	tst.l d0
    300e:	6642           	bne.s 3052 <ZoomTestDisplay+0x72>
    Write( Output(), 
    3010:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3016:	2c40           	movea.l d0,a6
    3018:	4eae ffc4      	jsr -60(a6)
    301c:	2f40 00d0      	move.l d0,208(sp)
    3020:	202f 00d0      	move.l 208(sp),d0
    3024:	2f40 00cc      	move.l d0,204(sp)
    3028:	2f7c 0000 8170 	move.l #33136,200(sp)
    302e:	00c8 
    3030:	7045           	moveq #69,d0
    3032:	2f40 00c4      	move.l d0,196(sp)
    3036:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    303c:	2c40           	movea.l d0,a6
    303e:	222f 00cc      	move.l 204(sp),d1
    3042:	242f 00c8      	move.l 200(sp),d2
    3046:	262f 00c4      	move.l 196(sp),d3
    304a:	4eae ffd0      	jsr -48(a6)
    304e:	2f40 00c0      	move.l d0,192(sp)
       "ZoomCopperlist: Sprite section of copper starting on pos 0 messed up\n", 
                                                                            69);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    3052:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    3058:	4878 000c      	pea c <_start+0xc>
    305c:	4879 0000 a704 	pea a704 <ClScreen>
    3062:	4878 0010      	pea 10 <_start+0x10>
    3066:	2f00           	move.l d0,-(sp)
    3068:	4eba f798      	jsr 2802 <TestCopperlistBatch>(pc)
    306c:	4fef 0010      	lea 16(sp),sp
    3070:	4a80           	tst.l d0
    3072:	6642           	bne.s 30b6 <ZoomTestDisplay+0xd6>
    Write( Output(), 
    3074:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    307a:	2c40           	movea.l d0,a6
    307c:	4eae ffc4      	jsr -60(a6)
    3080:	2f40 00bc      	move.l d0,188(sp)
    3084:	202f 00bc      	move.l 188(sp),d0
    3088:	2f40 00b8      	move.l d0,184(sp)
    308c:	2f7c 0000 81b6 	move.l #33206,180(sp)
    3092:	00b4 
    3094:	7046           	moveq #70,d0
    3096:	2f40 00b0      	move.l d0,176(sp)
    309a:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    30a0:	2c40           	movea.l d0,a6
    30a2:	222f 00b8      	move.l 184(sp),d1
    30a6:	242f 00b4      	move.l 180(sp),d2
    30aa:	262f 00b0      	move.l 176(sp),d3
    30ae:	4eae ffd0      	jsr -48(a6)
    30b2:	2f40 00ac      	move.l d0,172(sp)
      "ZoomCopperlist: Screen section of copper starting on pos 16 messed up\n",
                                                                            70);
  DrawBuffer = (ULONG *) 0x40000;
    30b6:	23fc 0004 0000 	move.l #262144,4d2c48 <DrawBuffer>
    30bc:	004d 2c48 
  ViewBuffer = (ULONG *) 0x50000;
    30c0:	23fc 0005 0000 	move.l #327680,4d2c4c <ViewBuffer>
    30c6:	004d 2c4c 
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    30ca:	2239 004d 2c50 	move.l 4d2c50 <DrawCopper>,d1
    30d0:	2039 004d 2c48 	move.l 4d2c48 <DrawBuffer>,d0
    30d6:	2f01           	move.l d1,-(sp)
    30d8:	2f00           	move.l d0,-(sp)
    30da:	4eba ed78      	jsr 1e54 <Zoom_SetBplPointers>(pc)
    30de:	508f           	addq.l #8,sp
  Zoom_SwapBuffers( 0);
    30e0:	42a7           	clr.l -(sp)
    30e2:	4eba ee08      	jsr 1eec <Zoom_SwapBuffers>(pc)
    30e6:	588f           	addq.l #4,sp
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    30e8:	2039 004d 2c48 	move.l 4d2c48 <DrawBuffer>,d0
    30ee:	0c80 0005 0000 	cmpi.l #327680,d0
    30f4:	660e           	bne.s 3104 <ZoomTestDisplay+0x124>
    30f6:	2039 004d 2c4c 	move.l 4d2c4c <ViewBuffer>,d0
    30fc:	0c80 0004 0000 	cmpi.l #262144,d0
    3102:	6742           	beq.s 3146 <ZoomTestDisplay+0x166>
    Write( Output(), 
    3104:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    310a:	2c40           	movea.l d0,a6
    310c:	4eae ffc4      	jsr -60(a6)
    3110:	2f40 00a8      	move.l d0,168(sp)
    3114:	202f 00a8      	move.l 168(sp),d0
    3118:	2f40 00a4      	move.l d0,164(sp)
    311c:	2f7c 0000 81fd 	move.l #33277,160(sp)
    3122:	00a0 
    3124:	703b           	moveq #59,d0
    3126:	2f40 009c      	move.l d0,156(sp)
    312a:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3130:	2c40           	movea.l d0,a6
    3132:	222f 00a4      	move.l 164(sp),d1
    3136:	242f 00a0      	move.l 160(sp),d2
    313a:	262f 009c      	move.l 156(sp),d3
    313e:	4eae ffd0      	jsr -48(a6)
    3142:	2f40 0098      	move.l d0,152(sp)
            "ZoomCopperlist: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    3146:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    314c:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    3152:	4878 001c      	pea 1c <_start+0x1c>
    3156:	2f00           	move.l d0,-(sp)
    3158:	4eba f6e6      	jsr 2840 <TestCopperlistPos>(pc)
    315c:	4fef 000c      	lea 12(sp),sp
    3160:	4a80           	tst.l d0
    3162:	6642           	bne.s 31a6 <ZoomTestDisplay+0x1c6>
    Write(Output(), 
    3164:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    316a:	2c40           	movea.l d0,a6
    316c:	4eae ffc4      	jsr -60(a6)
    3170:	2f40 0094      	move.l d0,148(sp)
    3174:	202f 0094      	move.l 148(sp),d0
    3178:	2f40 0090      	move.l d0,144(sp)
    317c:	2f7c 0000 8239 	move.l #33337,140(sp)
    3182:	008c 
    3184:	703c           	moveq #60,d0
    3186:	2f40 0088      	move.l d0,136(sp)
    318a:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3190:	2c40           	movea.l d0,a6
    3192:	222f 0090      	move.l 144(sp),d1
    3196:	242f 008c      	move.l 140(sp),d2
    319a:	262f 0088      	move.l 136(sp),d3
    319e:	4eae ffd0      	jsr -48(a6)
    31a2:	2f40 0084      	move.l d0,132(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    31a6:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    31ac:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    31b2:	4878 001d      	pea 1d <_start+0x1d>
    31b6:	2f00           	move.l d0,-(sp)
    31b8:	4eba f686      	jsr 2840 <TestCopperlistPos>(pc)
    31bc:	4fef 000c      	lea 12(sp),sp
    31c0:	4a80           	tst.l d0
    31c2:	6642           	bne.s 3206 <ZoomTestDisplay+0x226>
    Write(Output(), 
    31c4:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    31ca:	2c40           	movea.l d0,a6
    31cc:	4eae ffc4      	jsr -60(a6)
    31d0:	2f40 0080      	move.l d0,128(sp)
    31d4:	202f 0080      	move.l 128(sp),d0
    31d8:	2f40 007c      	move.l d0,124(sp)
    31dc:	2f7c 0000 8276 	move.l #33398,120(sp)
    31e2:	0078 
    31e4:	703c           	moveq #60,d0
    31e6:	2f40 0074      	move.l d0,116(sp)
    31ea:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    31f0:	2c40           	movea.l d0,a6
    31f2:	222f 007c      	move.l 124(sp),d1
    31f6:	242f 0078      	move.l 120(sp),d2
    31fa:	262f 0074      	move.l 116(sp),d3
    31fe:	4eae ffd0      	jsr -48(a6)
    3202:	2f40 0070      	move.l d0,112(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1pl should be 00f4\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    3206:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    320c:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    3212:	4878 001e      	pea 1e <_start+0x1e>
    3216:	2f00           	move.l d0,-(sp)
    3218:	4eba f626      	jsr 2840 <TestCopperlistPos>(pc)
    321c:	4fef 000c      	lea 12(sp),sp
    3220:	4a80           	tst.l d0
    3222:	6642           	bne.s 3266 <ZoomTestDisplay+0x286>
    Write(Output(), 
    3224:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    322a:	2c40           	movea.l d0,a6
    322c:	4eae ffc4      	jsr -60(a6)
    3230:	2f40 006c      	move.l d0,108(sp)
    3234:	202f 006c      	move.l 108(sp),d0
    3238:	2f40 0068      	move.l d0,104(sp)
    323c:	2f7c 0000 82b3 	move.l #33459,100(sp)
    3242:	0064 
    3244:	703c           	moveq #60,d0
    3246:	2f40 0060      	move.l d0,96(sp)
    324a:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3250:	2c40           	movea.l d0,a6
    3252:	222f 0068      	move.l 104(sp),d1
    3256:	242f 0064      	move.l 100(sp),d2
    325a:	262f 0060      	move.l 96(sp),d3
    325e:	4eae ffd0      	jsr -48(a6)
    3262:	2f40 005c      	move.l d0,92(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    3266:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    326c:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    3272:	4878 001f      	pea 1f <_start+0x1f>
    3276:	2f00           	move.l d0,-(sp)
    3278:	4eba f5c6      	jsr 2840 <TestCopperlistPos>(pc)
    327c:	4fef 000c      	lea 12(sp),sp
    3280:	4a80           	tst.l d0
    3282:	6642           	bne.s 32c6 <ZoomTestDisplay+0x2e6>
    Write(Output(), 
    3284:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    328a:	2c40           	movea.l d0,a6
    328c:	4eae ffc4      	jsr -60(a6)
    3290:	2f40 0058      	move.l d0,88(sp)
    3294:	202f 0058      	move.l 88(sp),d0
    3298:	2f40 0054      	move.l d0,84(sp)
    329c:	2f7c 0000 82f0 	move.l #33520,80(sp)
    32a2:	0050 
    32a4:	703c           	moveq #60,d0
    32a6:	2f40 004c      	move.l d0,76(sp)
    32aa:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    32b0:	2c40           	movea.l d0,a6
    32b2:	222f 0054      	move.l 84(sp),d1
    32b6:	242f 0050      	move.l 80(sp),d2
    32ba:	262f 004c      	move.l 76(sp),d3
    32be:	4eae ffd0      	jsr -48(a6)
    32c2:	2f40 0048      	move.l d0,72(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2pl should be 0034\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    32c6:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    32cc:	4878 0020      	pea 20 <_start+0x20>
    32d0:	4879 0000 a644 	pea a644 <ClColor>
    32d6:	4878 0026      	pea 26 <_start+0x26>
    32da:	2f00           	move.l d0,-(sp)
    32dc:	4eba f524      	jsr 2802 <TestCopperlistBatch>(pc)
    32e0:	4fef 0010      	lea 16(sp),sp
    32e4:	4a80           	tst.l d0
    32e6:	6642           	bne.s 332a <ZoomTestDisplay+0x34a>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    32e8:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    32ee:	2c40           	movea.l d0,a6
    32f0:	4eae ffc4      	jsr -60(a6)
    32f4:	2f40 0044      	move.l d0,68(sp)
    32f8:	202f 0044      	move.l 68(sp),d0
    32fc:	2f40 0040      	move.l d0,64(sp)
    3300:	2f7c 0000 832d 	move.l #33581,60(sp)
    3306:	003c 
    3308:	7025           	moveq #37,d0
    330a:	2f40 0038      	move.l d0,56(sp)
    330e:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3314:	2c40           	movea.l d0,a6
    3316:	222f 0040      	move.l 64(sp),d1
    331a:	242f 003c      	move.l 60(sp),d2
    331e:	262f 0038      	move.l 56(sp),d3
    3322:	4eae ffd0      	jsr -48(a6)
    3326:	2f40 0034      	move.l d0,52(sp)

  /*if(  TestCopperlistBatch(  Copperlist1, 71, Cl102ZoomRepeat, 21) == 0)
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36); */
  
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    332a:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    3330:	2f00           	move.l d0,-(sp)
    3332:	4878 000f      	pea f <_start+0xf>
    3336:	4eba d0d4      	jsr 40c <Zoom_Shrink102>(pc)
    333a:	508f           	addq.l #8,sp
  if( TestCopperListZoom102( Copperlist1, 73, Cl102ZoomTest) == 0)
    333c:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    3342:	4879 0000 b8e0 	pea b8e0 <Cl102ZoomTest>
    3348:	4878 0049      	pea 49 <_start+0x49>
    334c:	2f00           	move.l d0,-(sp)
    334e:	4eba 00c4      	jsr 3414 <TestCopperListZoom102>(pc)
    3352:	4fef 000c      	lea 12(sp),sp
    3356:	4a80           	tst.l d0
    3358:	6642           	bne.s 339c <ZoomTestDisplay+0x3bc>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    335a:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3360:	2c40           	movea.l d0,a6
    3362:	4eae ffc4      	jsr -60(a6)
    3366:	2f40 0030      	move.l d0,48(sp)
    336a:	202f 0030      	move.l 48(sp),d0
    336e:	2f40 002c      	move.l d0,44(sp)
    3372:	2f7c 0000 8353 	move.l #33619,40(sp)
    3378:	0028 
    337a:	7025           	moveq #37,d0
    337c:	2f40 0024      	move.l d0,36(sp)
    3380:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3386:	2c40           	movea.l d0,a6
    3388:	222f 002c      	move.l 44(sp),d1
    338c:	242f 0028      	move.l 40(sp),d2
    3390:	262f 0024      	move.l 36(sp),d3
    3394:	4eae ffd0      	jsr -48(a6)
    3398:	2f40 0020      	move.l d0,32(sp)

  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    339c:	2039 004d 2c40 	move.l 4d2c40 <Copperlist1>,d0
    33a2:	4878 fffe      	pea fffffffe <_end+0xffb2d34e>
    33a6:	4878 00bb      	pea bb <WaitBlt+0x7>
    33aa:	2f00           	move.l d0,-(sp)
    33ac:	4eba f492      	jsr 2840 <TestCopperlistPos>(pc)
    33b0:	4fef 000c      	lea 12(sp),sp
    33b4:	4a80           	tst.l d0
    33b6:	6642           	bne.s 33fa <ZoomTestDisplay+0x41a>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    33b8:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    33be:	2c40           	movea.l d0,a6
    33c0:	4eae ffc4      	jsr -60(a6)
    33c4:	2f40 001c      	move.l d0,28(sp)
    33c8:	202f 001c      	move.l 28(sp),d0
    33cc:	2f40 0018      	move.l d0,24(sp)
    33d0:	2f7c 0000 8378 	move.l #33656,20(sp)
    33d6:	0014 
    33d8:	7032           	moveq #50,d0
    33da:	2f40 0010      	move.l d0,16(sp)
    33de:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    33e4:	2c40           	movea.l d0,a6
    33e6:	222f 0018      	move.l 24(sp),d1
    33ea:	242f 0014      	move.l 20(sp),d2
    33ee:	262f 0010      	move.l 16(sp),d3
    33f2:	4eae ffd0      	jsr -48(a6)
    33f6:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    33fa:	2f3c 0000 df20 	move.l #57120,-(sp)
    3400:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    3404:	4eba ccda      	jsr e0 <FreeDisplay>(pc)
    3408:	508f           	addq.l #8,sp

}
    340a:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    340e:	4fef 00c8      	lea 200(sp),sp
    3412:	4e75           	rts

00003414 <TestCopperListZoom102>:

int TestCopperListZoom102( ULONG *cl2test, UWORD position, 
                                                           ULONG *template4cl) {
    3414:	598f           	subq.l #4,sp
    3416:	202f 000c      	move.l 12(sp),d0
    341a:	3000           	move.w d0,d0
    341c:	3f40 0002      	move.w d0,2(sp)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    3420:	7000           	moveq #0,d0
    3422:	302f 0002      	move.w 2(sp),d0
    3426:	4878 001c      	pea 1c <_start+0x1c>
    342a:	2f2f 0014      	move.l 20(sp),-(sp)
    342e:	2f00           	move.l d0,-(sp)
    3430:	2f2f 0014      	move.l 20(sp),-(sp)
    3434:	4eba f3cc      	jsr 2802 <TestCopperlistBatch>(pc)
    3438:	4fef 0010      	lea 16(sp),sp
    343c:	4a80           	tst.l d0
    343e:	6604           	bne.s 3444 <TestCopperListZoom102+0x30>
    return 0;
    3440:	7000           	moveq #0,d0
    3442:	6062           	bra.s 34a6 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    3444:	7078           	moveq #120,d0
    3446:	d0af 0010      	add.l 16(sp),d0
    344a:	7200           	moveq #0,d1
    344c:	322f 0002      	move.w 2(sp),d1
    3450:	307c 001e      	movea.w #30,a0
    3454:	d1c1           	adda.l d1,a0
    3456:	4878 0036      	pea 36 <_start+0x36>
    345a:	2f00           	move.l d0,-(sp)
    345c:	2f08           	move.l a0,-(sp)
    345e:	2f2f 0014      	move.l 20(sp),-(sp)
    3462:	4eba f39e      	jsr 2802 <TestCopperlistBatch>(pc)
    3466:	4fef 0010      	lea 16(sp),sp
    346a:	4a80           	tst.l d0
    346c:	6604           	bne.s 3472 <TestCopperListZoom102+0x5e>
    return 0;
    346e:	7000           	moveq #0,d0
    3470:	6034           	bra.s 34a6 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    3472:	202f 0010      	move.l 16(sp),d0
    3476:	0680 0000 0158 	addi.l #344,d0
    347c:	7200           	moveq #0,d1
    347e:	322f 0002      	move.w 2(sp),d1
    3482:	307c 0056      	movea.w #86,a0
    3486:	d1c1           	adda.l d1,a0
    3488:	4878 001c      	pea 1c <_start+0x1c>
    348c:	2f00           	move.l d0,-(sp)
    348e:	2f08           	move.l a0,-(sp)
    3490:	2f2f 0014      	move.l 20(sp),-(sp)
    3494:	4eba f36c      	jsr 2802 <TestCopperlistBatch>(pc)
    3498:	4fef 0010      	lea 16(sp),sp
    349c:	4a80           	tst.l d0
    349e:	6604           	bne.s 34a4 <TestCopperListZoom102+0x90>
    return 0;
    34a0:	7000           	moveq #0,d0
    34a2:	6002           	bra.s 34a6 <TestCopperListZoom102+0x92>
 
  return 1;
    34a4:	7001           	moveq #1,d0
}
    34a6:	588f           	addq.l #4,sp
    34a8:	4e75           	rts

000034aa <TestBlitleftOfZoom>:

void TestBlitleftOfZoom() {
    34aa:	4fef ff94      	lea -108(sp),sp
    34ae:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Zoom_Init();
    34b2:	4eba dfac      	jsr 1460 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    34b6:	4eba e342      	jsr 17fa <PrepareDisplayZoom>(pc)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    34ba:	2f7c 0000 c800 	move.l #51200,116(sp)
    34c0:	0074 
    34c2:	7002           	moveq #2,d0
    34c4:	2f40 0070      	move.l d0,112(sp)
    34c8:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    34ce:	2c40           	movea.l d0,a6
    34d0:	202f 0074      	move.l 116(sp),d0
    34d4:	222f 0070      	move.l 112(sp),d1
    34d8:	4eae ff3a      	jsr -198(a6)
    34dc:	2f40 006c      	move.l d0,108(sp)
    34e0:	202f 006c      	move.l 108(sp),d0
    34e4:	23c0 004d 2c8a 	move.l d0,4d2c8a <Zoom_Source>
  if( Zoom_Source == 0) {
    34ea:	2039 004d 2c8a 	move.l 4d2c8a <Zoom_Source>,d0
    34f0:	6646           	bne.s 3538 <TestBlitleftOfZoom+0x8e>
    Write(  Output(), 
    34f2:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    34f8:	2c40           	movea.l d0,a6
    34fa:	4eae ffc4      	jsr -60(a6)
    34fe:	2f40 001c      	move.l d0,28(sp)
    3502:	202f 001c      	move.l 28(sp),d0
    3506:	2f40 0018      	move.l d0,24(sp)
    350a:	2f7c 0000 83ab 	move.l #33707,20(sp)
    3510:	0014 
    3512:	7236           	moveq #54,d1
    3514:	2f41 0010      	move.l d1,16(sp)
    3518:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    351e:	2c40           	movea.l d0,a6
    3520:	222f 0018      	move.l 24(sp),d1
    3524:	242f 0014      	move.l 20(sp),d2
    3528:	262f 0010      	move.l 16(sp),d3
    352c:	4eae ffd0      	jsr -48(a6)
    3530:	2f40 000c      	move.l d0,12(sp)
    3534:	6000 01fe      	bra.w 3734 <TestBlitleftOfZoom+0x28a>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  
  UWORD *tstsource = Zoom_Source;
    3538:	2f79 004d 2c8a 	move.l 4d2c8a <Zoom_Source>,104(sp)
    353e:	0068 
  *tstsource++ = 0x0000;
    3540:	202f 0068      	move.l 104(sp),d0
    3544:	2200           	move.l d0,d1
    3546:	5481           	addq.l #2,d1
    3548:	2f41 0068      	move.l d1,104(sp)
    354c:	2040           	movea.l d0,a0
    354e:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    3550:	206f 0068      	movea.l 104(sp),a0
    3554:	30bc 0080      	move.w #128,(a0)
  tstsource += ZMLINESIZE/2-1;
    3558:	7028           	moveq #40,d0
    355a:	d1af 0068      	add.l d0,104(sp)
  *tstsource = 0x1000;
    355e:	206f 0068      	movea.l 104(sp),a0
    3562:	30bc 1000      	move.w #4096,(a0)
  tstsource++;
    3566:	54af 0068      	addq.l #2,104(sp)
  *tstsource = 0x8e88;
    356a:	206f 0068      	movea.l 104(sp),a0
    356e:	30bc 8e88      	move.w #-29048,(a0)
  tstsource += ZMLINESIZE/2-1;
    3572:	7228           	moveq #40,d1
    3574:	d3af 0068      	add.l d1,104(sp)

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
    3578:	2039 004d 2c8a 	move.l 4d2c8a <Zoom_Source>,d0
    357e:	2200           	move.l d0,d1
    3580:	0681 0000 14d6 	addi.l #5334,d1
    3586:	2f41 0068      	move.l d1,104(sp)
  *tstsource++ = 0x0000;
    358a:	202f 0068      	move.l 104(sp),d0
    358e:	2200           	move.l d0,d1
    3590:	5481           	addq.l #2,d1
    3592:	2f41 0068      	move.l d1,104(sp)
    3596:	2040           	movea.l d0,a0
    3598:	4250           	clr.w (a0)
  *tstsource = 0x00ff;
    359a:	206f 0068      	movea.l 104(sp),a0
    359e:	30bc 00ff      	move.w #255,(a0)
  WaitBlit();
    35a2:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    35a8:	2c40           	movea.l d0,a6
    35aa:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    35ae:	4eba e3c2      	jsr 1972 <Init_Blit>(pc)
  Init_ZoomBlit( 7, 16, 0);
    35b2:	42a7           	clr.l -(sp)
    35b4:	4878 0010      	pea 10 <_start+0x10>
    35b8:	4878 0007      	pea 7 <_start+0x7>
    35bc:	4eba e430      	jsr 19ee <Init_ZoomBlit>(pc)
    35c0:	4fef 000c      	lea 12(sp),sp
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    35c4:	2239 004d 2c48 	move.l 4d2c48 <DrawBuffer>,d1
    35ca:	2039 004d 2c8a 	move.l 4d2c8a <Zoom_Source>,d0
    35d0:	4878 0080      	pea 80 <_start+0x80>
    35d4:	2f01           	move.l d1,-(sp)
    35d6:	2f00           	move.l d0,-(sp)
    35d8:	4eba d9fc      	jsr fd6 <Zoom_ZoomBlit>(pc)
    35dc:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    35e0:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    35e6:	2c40           	movea.l d0,a6
    35e8:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    35ec:	2039 004d 2c48 	move.l 4d2c48 <DrawBuffer>,d0
    35f2:	2200           	move.l d0,d1
    35f4:	5481           	addq.l #2,d1
    35f6:	2f41 0064      	move.l d1,100(sp)
  if( *destination != 0x0180) {
    35fa:	206f 0064      	movea.l 100(sp),a0
    35fe:	3010           	move.w (a0),d0
    3600:	0c40 0180      	cmpi.w #384,d0
    3604:	6742           	beq.s 3648 <TestBlitleftOfZoom+0x19e>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    3606:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    360c:	2c40           	movea.l d0,a6
    360e:	4eae ffc4      	jsr -60(a6)
    3612:	2f40 0060      	move.l d0,96(sp)
    3616:	202f 0060      	move.l 96(sp),d0
    361a:	2f40 005c      	move.l d0,92(sp)
    361e:	2f7c 0000 83e3 	move.l #33763,88(sp)
    3624:	0058 
    3626:	701c           	moveq #28,d0
    3628:	2f40 0054      	move.l d0,84(sp)
    362c:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3632:	2c40           	movea.l d0,a6
    3634:	222f 005c      	move.l 92(sp),d1
    3638:	242f 0058      	move.l 88(sp),d2
    363c:	262f 0054      	move.l 84(sp),d3
    3640:	4eae ffd0      	jsr -48(a6)
    3644:	2f40 0050      	move.l d0,80(sp)
  }
  destination += ZMLINESIZE/2;
    3648:	722a           	moveq #42,d1
    364a:	d3af 0064      	add.l d1,100(sp)
  if( *destination != 0x1d88)
    364e:	206f 0064      	movea.l 100(sp),a0
    3652:	3010           	move.w (a0),d0
    3654:	0c40 1d88      	cmpi.w #7560,d0
    3658:	6742           	beq.s 369c <TestBlitleftOfZoom+0x1f2>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    365a:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3660:	2c40           	movea.l d0,a6
    3662:	4eae ffc4      	jsr -60(a6)
    3666:	2f40 004c      	move.l d0,76(sp)
    366a:	202f 004c      	move.l 76(sp),d0
    366e:	2f40 0048      	move.l d0,72(sp)
    3672:	2f7c 0000 8400 	move.l #33792,68(sp)
    3678:	0044 
    367a:	701c           	moveq #28,d0
    367c:	2f40 0040      	move.l d0,64(sp)
    3680:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3686:	2c40           	movea.l d0,a6
    3688:	222f 0048      	move.l 72(sp),d1
    368c:	242f 0044      	move.l 68(sp),d2
    3690:	262f 0040      	move.l 64(sp),d3
    3694:	4eae ffd0      	jsr -48(a6)
    3698:	2f40 003c      	move.l d0,60(sp)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
    369c:	2039 004d 2c48 	move.l 4d2c48 <DrawBuffer>,d0
    36a2:	2200           	move.l d0,d1
    36a4:	0681 0000 14d6 	addi.l #5334,d1
    36aa:	2f41 0064      	move.l d1,100(sp)
  destination++;
    36ae:	54af 0064      	addq.l #2,100(sp)
  if( *destination != 0x01ff) {
    36b2:	206f 0064      	movea.l 100(sp),a0
    36b6:	3010           	move.w (a0),d0
    36b8:	0c40 01ff      	cmpi.w #511,d0
    36bc:	6742           	beq.s 3700 <TestBlitleftOfZoom+0x256>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    36be:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    36c4:	2c40           	movea.l d0,a6
    36c6:	4eae ffc4      	jsr -60(a6)
    36ca:	2f40 0038      	move.l d0,56(sp)
    36ce:	202f 0038      	move.l 56(sp),d0
    36d2:	2f40 0034      	move.l d0,52(sp)
    36d6:	2f7c 0000 841d 	move.l #33821,48(sp)
    36dc:	0030 
    36de:	701a           	moveq #26,d0
    36e0:	2f40 002c      	move.l d0,44(sp)
    36e4:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    36ea:	2c40           	movea.l d0,a6
    36ec:	222f 0034      	move.l 52(sp),d1
    36f0:	242f 0030      	move.l 48(sp),d2
    36f4:	262f 002c      	move.l 44(sp),d3
    36f8:	4eae ffd0      	jsr -48(a6)
    36fc:	2f40 0028      	move.l d0,40(sp)
  }
  FreeMem( Zoom_Source, 40*256*5);
    3700:	2f79 004d 2c8a 	move.l 4d2c8a <Zoom_Source>,36(sp)
    3706:	0024 
    3708:	2f7c 0000 c800 	move.l #51200,32(sp)
    370e:	0020 
    3710:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    3716:	2c40           	movea.l d0,a6
    3718:	226f 0024      	movea.l 36(sp),a1
    371c:	202f 0020      	move.l 32(sp),d0
    3720:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    3724:	2f3c 0000 df20 	move.l #57120,-(sp)
    372a:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    372e:	4eba c9b0      	jsr e0 <FreeDisplay>(pc)
    3732:	508f           	addq.l #8,sp
}
    3734:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3738:	4fef 006c      	lea 108(sp),sp
    373c:	4e75           	rts

0000373e <TestCopyWord>:

void TestCopyWord() {
    373e:	4fef ff74      	lea -140(sp),sp
    3742:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    3746:	2f7c 0000 04ec 	move.l #1260,136(sp)
    374c:	0088 
    374e:	7002           	moveq #2,d0
    3750:	2f40 0084      	move.l d0,132(sp)
    3754:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    375a:	2c40           	movea.l d0,a6
    375c:	202f 0088      	move.l 136(sp),d0
    3760:	222f 0084      	move.l 132(sp),d1
    3764:	4eae ff3a      	jsr -198(a6)
    3768:	2f40 0080      	move.l d0,128(sp)
    376c:	202f 0080      	move.l 128(sp),d0
    3770:	2f40 007c      	move.l d0,124(sp)
  if( source == 0) {
    3774:	6646           	bne.s 37bc <TestCopyWord+0x7e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3776:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    377c:	2c40           	movea.l d0,a6
    377e:	4eae ffc4      	jsr -60(a6)
    3782:	2f40 001c      	move.l d0,28(sp)
    3786:	202f 001c      	move.l 28(sp),d0
    378a:	2f40 0018      	move.l d0,24(sp)
    378e:	2f7c 0000 8438 	move.l #33848,20(sp)
    3794:	0014 
    3796:	7235           	moveq #53,d1
    3798:	2f41 0010      	move.l d1,16(sp)
    379c:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    37a2:	2c40           	movea.l d0,a6
    37a4:	222f 0018      	move.l 24(sp),d1
    37a8:	242f 0014      	move.l 20(sp),d2
    37ac:	262f 0010      	move.l 16(sp),d3
    37b0:	4eae ffd0      	jsr -48(a6)
    37b4:	2f40 000c      	move.l d0,12(sp)
    37b8:	6000 026c      	bra.w 3a26 <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    37bc:	2f7c 0000 04ec 	move.l #1260,120(sp)
    37c2:	0078 
    37c4:	7002           	moveq #2,d0
    37c6:	2f40 0074      	move.l d0,116(sp)
    37ca:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    37d0:	2c40           	movea.l d0,a6
    37d2:	202f 0078      	move.l 120(sp),d0
    37d6:	222f 0074      	move.l 116(sp),d1
    37da:	4eae ff3a      	jsr -198(a6)
    37de:	2f40 0070      	move.l d0,112(sp)
    37e2:	202f 0070      	move.l 112(sp),d0
    37e6:	2f40 006c      	move.l d0,108(sp)
  if( destination == 0) {
    37ea:	6646           	bne.s 3832 <TestCopyWord+0xf4>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    37ec:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    37f2:	2c40           	movea.l d0,a6
    37f4:	4eae ffc4      	jsr -60(a6)
    37f8:	2f40 0030      	move.l d0,48(sp)
    37fc:	202f 0030      	move.l 48(sp),d0
    3800:	2f40 002c      	move.l d0,44(sp)
    3804:	2f7c 0000 8438 	move.l #33848,40(sp)
    380a:	0028 
    380c:	7235           	moveq #53,d1
    380e:	2f41 0024      	move.l d1,36(sp)
    3812:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3818:	2c40           	movea.l d0,a6
    381a:	222f 002c      	move.l 44(sp),d1
    381e:	242f 0028      	move.l 40(sp),d2
    3822:	262f 0024      	move.l 36(sp),d3
    3826:	4eae ffd0      	jsr -48(a6)
    382a:	2f40 0020      	move.l d0,32(sp)
    382e:	6000 01f6      	bra.w 3a26 <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
    3832:	2f6f 007c 0094 	move.l 124(sp),148(sp)
  for( int i=0; i<8;i++) {
    3838:	42af 0090      	clr.l 144(sp)
    383c:	6000 0086      	bra.w 38c4 <TestCopyWord+0x186>
    *tmp++ = 0;
    3840:	202f 0094      	move.l 148(sp),d0
    3844:	2200           	move.l d0,d1
    3846:	5481           	addq.l #2,d1
    3848:	2f41 0094      	move.l d1,148(sp)
    384c:	2040           	movea.l d0,a0
    384e:	4250           	clr.w (a0)
    *tmp++ = 0xaaaa;
    3850:	202f 0094      	move.l 148(sp),d0
    3854:	2200           	move.l d0,d1
    3856:	5481           	addq.l #2,d1
    3858:	2f41 0094      	move.l d1,148(sp)
    385c:	2040           	movea.l d0,a0
    385e:	30bc aaaa      	move.w #-21846,(a0)
    *tmp++ = 0xaaaa;
    3862:	202f 0094      	move.l 148(sp),d0
    3866:	2200           	move.l d0,d1
    3868:	5481           	addq.l #2,d1
    386a:	2f41 0094      	move.l d1,148(sp)
    386e:	2040           	movea.l d0,a0
    3870:	30bc aaaa      	move.w #-21846,(a0)
    *tmp = 0;
    3874:	206f 0094      	movea.l 148(sp),a0
    3878:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    387a:	7024           	moveq #36,d0
    387c:	d1af 0094      	add.l d0,148(sp)
    *tmp++ = 0;
    3880:	202f 0094      	move.l 148(sp),d0
    3884:	2200           	move.l d0,d1
    3886:	5481           	addq.l #2,d1
    3888:	2f41 0094      	move.l d1,148(sp)
    388c:	2040           	movea.l d0,a0
    388e:	4250           	clr.w (a0)
    *tmp++ = 0x5555;
    3890:	202f 0094      	move.l 148(sp),d0
    3894:	2200           	move.l d0,d1
    3896:	5481           	addq.l #2,d1
    3898:	2f41 0094      	move.l d1,148(sp)
    389c:	2040           	movea.l d0,a0
    389e:	30bc 5555      	move.w #21845,(a0)
    *tmp++ = 0x5555;
    38a2:	202f 0094      	move.l 148(sp),d0
    38a6:	2200           	move.l d0,d1
    38a8:	5481           	addq.l #2,d1
    38aa:	2f41 0094      	move.l d1,148(sp)
    38ae:	2040           	movea.l d0,a0
    38b0:	30bc 5555      	move.w #21845,(a0)
    *tmp = 0;
    38b4:	206f 0094      	movea.l 148(sp),a0
    38b8:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    38ba:	7024           	moveq #36,d0
    38bc:	d1af 0094      	add.l d0,148(sp)
  for( int i=0; i<8;i++) {
    38c0:	52af 0090      	addq.l #1,144(sp)
    38c4:	7207           	moveq #7,d1
    38c6:	b2af 0090      	cmp.l 144(sp),d1
    38ca:	6c00 ff74      	bge.w 3840 <TestCopyWord+0x102>
  }
  tmp = destination;
    38ce:	2f6f 006c 0094 	move.l 108(sp),148(sp)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    38d4:	42af 008c      	clr.l 140(sp)
    38d8:	6014           	bra.s 38ee <TestCopyWord+0x1b0>
    *tmp++ = 0;
    38da:	202f 0094      	move.l 148(sp),d0
    38de:	2200           	move.l d0,d1
    38e0:	5481           	addq.l #2,d1
    38e2:	2f41 0094      	move.l d1,148(sp)
    38e6:	2040           	movea.l d0,a0
    38e8:	4250           	clr.w (a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    38ea:	52af 008c      	addq.l #1,140(sp)
    38ee:	0caf 0000 0275 	cmpi.l #629,140(sp)
    38f4:	008c 
    38f6:	6fe2           	ble.s 38da <TestCopyWord+0x19c>
  }

  WaitBlit();
    38f8:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    38fe:	2c40           	movea.l d0,a6
    3900:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
    3904:	4eba db5a      	jsr 1460 <Zoom_Init>(pc)
  Init_Copy( 3);
    3908:	4878 0003      	pea 3 <_start+0x3>
    390c:	4eba e184      	jsr 1a92 <Init_Copy>(pc)
    3910:	588f           	addq.l #4,sp
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
    3912:	202f 007c      	move.l 124(sp),d0
    3916:	5480           	addq.l #2,d0
    3918:	4878 0010      	pea 10 <_start+0x10>
    391c:	2f2f 0070      	move.l 112(sp),-(sp)
    3920:	2f00           	move.l d0,-(sp)
    3922:	4eba d674      	jsr f98 <Zoom_CopyWord>(pc)
    3926:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    392a:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    3930:	2c40           	movea.l d0,a6
    3932:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
    3936:	202f 006c      	move.l 108(sp),d0
    393a:	5480           	addq.l #2,d0
    393c:	2f40 0094      	move.l d0,148(sp)
  if( *tmp != 0x5555) 
    3940:	206f 0094      	movea.l 148(sp),a0
    3944:	3010           	move.w (a0),d0
    3946:	0c40 5555      	cmpi.w #21845,d0
    394a:	6742           	beq.s 398e <TestCopyWord+0x250>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    394c:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3952:	2c40           	movea.l d0,a6
    3954:	4eae ffc4      	jsr -60(a6)
    3958:	2f40 0068      	move.l d0,104(sp)
    395c:	202f 0068      	move.l 104(sp),d0
    3960:	2f40 0064      	move.l d0,100(sp)
    3964:	2f7c 0000 846e 	move.l #33902,96(sp)
    396a:	0060 
    396c:	721f           	moveq #31,d1
    396e:	2f41 005c      	move.l d1,92(sp)
    3972:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3978:	2c40           	movea.l d0,a6
    397a:	222f 0064      	move.l 100(sp),d1
    397e:	242f 0060      	move.l 96(sp),d2
    3982:	262f 005c      	move.l 92(sp),d3
    3986:	4eae ffd0      	jsr -48(a6)
    398a:	2f40 0058      	move.l d0,88(sp)
  tmp += ZMLINESIZE/2;
    398e:	702a           	moveq #42,d0
    3990:	d1af 0094      	add.l d0,148(sp)
  if( *tmp != 0xaaaa)
    3994:	206f 0094      	movea.l 148(sp),a0
    3998:	3010           	move.w (a0),d0
    399a:	0c40 aaaa      	cmpi.w #-21846,d0
    399e:	6742           	beq.s 39e2 <TestCopyWord+0x2a4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    39a0:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    39a6:	2c40           	movea.l d0,a6
    39a8:	4eae ffc4      	jsr -60(a6)
    39ac:	2f40 0054      	move.l d0,84(sp)
    39b0:	202f 0054      	move.l 84(sp),d0
    39b4:	2f40 0050      	move.l d0,80(sp)
    39b8:	2f7c 0000 848e 	move.l #33934,76(sp)
    39be:	004c 
    39c0:	7220           	moveq #32,d1
    39c2:	2f41 0048      	move.l d1,72(sp)
    39c6:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    39cc:	2c40           	movea.l d0,a6
    39ce:	222f 0050      	move.l 80(sp),d1
    39d2:	242f 004c      	move.l 76(sp),d2
    39d6:	262f 0048      	move.l 72(sp),d3
    39da:	4eae ffd0      	jsr -48(a6)
    39de:	2f40 0044      	move.l d0,68(sp)
  
  FreeMem( source,ZMLINESIZE*30);
    39e2:	2f6f 007c 0040 	move.l 124(sp),64(sp)
    39e8:	2f7c 0000 04ec 	move.l #1260,60(sp)
    39ee:	003c 
    39f0:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    39f6:	2c40           	movea.l d0,a6
    39f8:	226f 0040      	movea.l 64(sp),a1
    39fc:	202f 003c      	move.l 60(sp),d0
    3a00:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    3a04:	2f6f 006c 0038 	move.l 108(sp),56(sp)
    3a0a:	2f7c 0000 04ec 	move.l #1260,52(sp)
    3a10:	0034 
    3a12:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    3a18:	2c40           	movea.l d0,a6
    3a1a:	226f 0038      	movea.l 56(sp),a1
    3a1e:	202f 0034      	move.l 52(sp),d0
    3a22:	4eae ff2e      	jsr -210(a6)
}
    3a26:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3a2a:	4fef 008c      	lea 140(sp),sp
    3a2e:	4e75           	rts

00003a30 <TestZoom4PictureOn5Planes>:
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */


void TestZoom4PictureOn5Planes() {
    3a30:	4fef ff74      	lea -140(sp),sp
    3a34:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3a38:	2f7c 0000 f460 	move.l #62560,102(sp)
    3a3e:	0066 
    3a40:	7002           	moveq #2,d0
    3a42:	2f40 0062      	move.l d0,98(sp)
    3a46:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    3a4c:	2c40           	movea.l d0,a6
    3a4e:	202f 0066      	move.l 102(sp),d0
    3a52:	222f 0062      	move.l 98(sp),d1
    3a56:	4eae ff3a      	jsr -198(a6)
    3a5a:	2f40 005e      	move.l d0,94(sp)
    3a5e:	202f 005e      	move.l 94(sp),d0
    3a62:	2f40 005a      	move.l d0,90(sp)
  if( source == 0) {
    3a66:	6646           	bne.s 3aae <TestZoom4PictureOn5Planes+0x7e>
    Write(  Output(), 
    3a68:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3a6e:	2c40           	movea.l d0,a6
    3a70:	4eae ffc4      	jsr -60(a6)
    3a74:	2f40 001e      	move.l d0,30(sp)
    3a78:	202f 001e      	move.l 30(sp),d0
    3a7c:	2f40 001a      	move.l d0,26(sp)
    3a80:	2f7c 0000 84af 	move.l #33967,22(sp)
    3a86:	0016 
    3a88:	7239           	moveq #57,d1
    3a8a:	2f41 0012      	move.l d1,18(sp)
    3a8e:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3a94:	2c40           	movea.l d0,a6
    3a96:	222f 001a      	move.l 26(sp),d1
    3a9a:	242f 0016      	move.l 22(sp),d2
    3a9e:	262f 0012      	move.l 18(sp),d3
    3aa2:	4eae ffd0      	jsr -48(a6)
    3aa6:	2f40 000e      	move.l d0,14(sp)
    3aaa:	6000 0266      	bra.w 3d12 <TestZoom4PictureOn5Planes+0x2e2>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3aae:	2f7c 0000 f460 	move.l #62560,86(sp)
    3ab4:	0056 
    3ab6:	7002           	moveq #2,d0
    3ab8:	2f40 0052      	move.l d0,82(sp)
    3abc:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    3ac2:	2c40           	movea.l d0,a6
    3ac4:	202f 0056      	move.l 86(sp),d0
    3ac8:	222f 0052      	move.l 82(sp),d1
    3acc:	4eae ff3a      	jsr -198(a6)
    3ad0:	2f40 004e      	move.l d0,78(sp)
    3ad4:	202f 004e      	move.l 78(sp),d0
    3ad8:	2f40 004a      	move.l d0,74(sp)
  if( destination == 0) {
    3adc:	6646           	bne.s 3b24 <TestZoom4PictureOn5Planes+0xf4>
    Write(  Output(), 
    3ade:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3ae4:	2c40           	movea.l d0,a6
    3ae6:	4eae ffc4      	jsr -60(a6)
    3aea:	2f40 0032      	move.l d0,50(sp)
    3aee:	202f 0032      	move.l 50(sp),d0
    3af2:	2f40 002e      	move.l d0,46(sp)
    3af6:	2f7c 0000 84e9 	move.l #34025,42(sp)
    3afc:	002a 
    3afe:	723d           	moveq #61,d1
    3b00:	2f41 0026      	move.l d1,38(sp)
    3b04:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3b0a:	2c40           	movea.l d0,a6
    3b0c:	222f 002e      	move.l 46(sp),d1
    3b10:	242f 002a      	move.l 42(sp),d2
    3b14:	262f 0026      	move.l 38(sp),d3
    3b18:	4eae ffd0      	jsr -48(a6)
    3b1c:	2f40 0022      	move.l d0,34(sp)
    3b20:	6000 01f0      	bra.w 3d12 <TestZoom4PictureOn5Planes+0x2e2>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3b24:	2f6f 005a 0094 	move.l 90(sp),148(sp)
  for(int i=0;i<128+8;i++) {
    3b2a:	42af 0090      	clr.l 144(sp)
    3b2e:	6050           	bra.s 3b80 <TestZoom4PictureOn5Planes+0x150>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b30:	42af 008c      	clr.l 140(sp)
    3b34:	6018           	bra.s 3b4e <TestZoom4PictureOn5Planes+0x11e>
      *tmp4source++ = 0x55555555;
    3b36:	202f 0094      	move.l 148(sp),d0
    3b3a:	2200           	move.l d0,d1
    3b3c:	5881           	addq.l #4,d1
    3b3e:	2f41 0094      	move.l d1,148(sp)
    3b42:	2040           	movea.l d0,a0
    3b44:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b4a:	52af 008c      	addq.l #1,140(sp)
    3b4e:	7031           	moveq #49,d0
    3b50:	b0af 008c      	cmp.l 140(sp),d0
    3b54:	6ce0           	bge.s 3b36 <TestZoom4PictureOn5Planes+0x106>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b56:	42af 0088      	clr.l 136(sp)
    3b5a:	6018           	bra.s 3b74 <TestZoom4PictureOn5Planes+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3b5c:	202f 0094      	move.l 148(sp),d0
    3b60:	2200           	move.l d0,d1
    3b62:	5881           	addq.l #4,d1
    3b64:	2f41 0094      	move.l d1,148(sp)
    3b68:	2040           	movea.l d0,a0
    3b6a:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b70:	52af 0088      	addq.l #1,136(sp)
    3b74:	7031           	moveq #49,d0
    3b76:	b0af 0088      	cmp.l 136(sp),d0
    3b7a:	6ce0           	bge.s 3b5c <TestZoom4PictureOn5Planes+0x12c>
  for(int i=0;i<128+8;i++) {
    3b7c:	52af 0090      	addq.l #1,144(sp)
    3b80:	0caf 0000 0087 	cmpi.l #135,144(sp)
    3b86:	0090 
    3b88:	6fa6           	ble.s 3b30 <TestZoom4PictureOn5Planes+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3b8a:	4878 0005      	pea 5 <_start+0x5>
    3b8e:	42a7           	clr.l -(sp)
    3b90:	2f2f 0052      	move.l 82(sp),-(sp)
    3b94:	2f2f 0066      	move.l 102(sp),-(sp)
    3b98:	4eba df32      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    3b9c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3ba0:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    3ba6:	2c40           	movea.l d0,a6
    3ba8:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3bac:	222f 004a      	move.l 74(sp),d1
    3bb0:	5881           	addq.l #4,d1
    3bb2:	2f41 0084      	move.l d1,132(sp)
  UWORD *valsupposed = destlinezoom1;
    3bb6:	2f7c 0000 bb04 	move.l #47876,70(sp)
    3bbc:	0046 
  UWORD mask = 0xffff;
    3bbe:	3f7c ffff 0082 	move.w #-1,130(sp)
  for(int i=0;i<14;i++) {
    3bc4:	42af 007e      	clr.l 126(sp)
    3bc8:	6000 00a8      	bra.w 3c72 <TestZoom4PictureOn5Planes+0x242>
    for(int i2=0;i2<18;i2++) { 
    3bcc:	42af 007a      	clr.l 122(sp)
    3bd0:	604e           	bra.s 3c20 <TestZoom4PictureOn5Planes+0x1f0>
      for( int i3=0;i3<5;i3++) {
    3bd2:	42af 0076      	clr.l 118(sp)
    3bd6:	6038           	bra.s 3c10 <TestZoom4PictureOn5Planes+0x1e0>
        TestRow( valsupposed, valactual, mask, i2+i*19);
    3bd8:	222f 007e      	move.l 126(sp),d1
    3bdc:	2001           	move.l d1,d0
    3bde:	e788           	lsl.l #3,d0
    3be0:	d081           	add.l d1,d0
    3be2:	d080           	add.l d0,d0
    3be4:	d081           	add.l d1,d0
    3be6:	2200           	move.l d0,d1
    3be8:	d2af 007a      	add.l 122(sp),d1
    3bec:	7000           	moveq #0,d0
    3bee:	302f 0082      	move.w 130(sp),d0
    3bf2:	2f01           	move.l d1,-(sp)
    3bf4:	2f00           	move.l d0,-(sp)
    3bf6:	2f2f 008c      	move.l 140(sp),-(sp)
    3bfa:	2f2f 0052      	move.l 82(sp),-(sp)
    3bfe:	4eba 2f7e      	jsr 6b7e <TestRow>(pc)
    3c02:	4fef 0010      	lea 16(sp),sp
        valactual += ZMLINESIZE/2;
    3c06:	702a           	moveq #42,d0
    3c08:	d1af 0084      	add.l d0,132(sp)
      for( int i3=0;i3<5;i3++) {
    3c0c:	52af 0076      	addq.l #1,118(sp)
    3c10:	7204           	moveq #4,d1
    3c12:	b2af 0076      	cmp.l 118(sp),d1
    3c16:	6cc0           	bge.s 3bd8 <TestZoom4PictureOn5Planes+0x1a8>
      }
      mask = mask ^ 0xffff;
    3c18:	466f 0082      	not.w 130(sp)
    for(int i2=0;i2<18;i2++) { 
    3c1c:	52af 007a      	addq.l #1,122(sp)
    3c20:	7011           	moveq #17,d0
    3c22:	b0af 007a      	cmp.l 122(sp),d0
    3c26:	6caa           	bge.s 3bd2 <TestZoom4PictureOn5Planes+0x1a2>
    }
    for( int i3=0;i3<5;i3++) {
    3c28:	42af 0072      	clr.l 114(sp)
    3c2c:	6038           	bra.s 3c66 <TestZoom4PictureOn5Planes+0x236>
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3c2e:	222f 007e      	move.l 126(sp),d1
    3c32:	2001           	move.l d1,d0
    3c34:	e788           	lsl.l #3,d0
    3c36:	d081           	add.l d1,d0
    3c38:	d080           	add.l d0,d0
    3c3a:	2040           	movea.l d0,a0
    3c3c:	d1c1           	adda.l d1,a0
    3c3e:	41e8 0012      	lea 18(a0),a0
    3c42:	7000           	moveq #0,d0
    3c44:	302f 0082      	move.w 130(sp),d0
    3c48:	2f08           	move.l a0,-(sp)
    3c4a:	2f00           	move.l d0,-(sp)
    3c4c:	2f2f 008c      	move.l 140(sp),-(sp)
    3c50:	2f2f 0052      	move.l 82(sp),-(sp)
    3c54:	4eba 2f28      	jsr 6b7e <TestRow>(pc)
    3c58:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3c5c:	722a           	moveq #42,d1
    3c5e:	d3af 0084      	add.l d1,132(sp)
    for( int i3=0;i3<5;i3++) {
    3c62:	52af 0072      	addq.l #1,114(sp)
    3c66:	7004           	moveq #4,d0
    3c68:	b0af 0072      	cmp.l 114(sp),d0
    3c6c:	6cc0           	bge.s 3c2e <TestZoom4PictureOn5Planes+0x1fe>
  for(int i=0;i<14;i++) {
    3c6e:	52af 007e      	addq.l #1,126(sp)
    3c72:	720d           	moveq #13,d1
    3c74:	b2af 007e      	cmp.l 126(sp),d1
    3c78:	6c00 ff52      	bge.w 3bcc <TestZoom4PictureOn5Planes+0x19c>
    }
  }
  for(int i2=0;i2<4;i2++) { 
    3c7c:	42af 006e      	clr.l 110(sp)
    3c80:	6044           	bra.s 3cc6 <TestZoom4PictureOn5Planes+0x296>
    for( int i3=0;i3<5;i3++) {
    3c82:	42af 006a      	clr.l 106(sp)
    3c86:	602e           	bra.s 3cb6 <TestZoom4PictureOn5Planes+0x286>
      TestRow( valsupposed, valactual, mask, i2+265);
    3c88:	222f 006e      	move.l 110(sp),d1
    3c8c:	0681 0000 0109 	addi.l #265,d1
    3c92:	7000           	moveq #0,d0
    3c94:	302f 0082      	move.w 130(sp),d0
    3c98:	2f01           	move.l d1,-(sp)
    3c9a:	2f00           	move.l d0,-(sp)
    3c9c:	2f2f 008c      	move.l 140(sp),-(sp)
    3ca0:	2f2f 0052      	move.l 82(sp),-(sp)
    3ca4:	4eba 2ed8      	jsr 6b7e <TestRow>(pc)
    3ca8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3cac:	702a           	moveq #42,d0
    3cae:	d1af 0084      	add.l d0,132(sp)
    for( int i3=0;i3<5;i3++) {
    3cb2:	52af 006a      	addq.l #1,106(sp)
    3cb6:	7204           	moveq #4,d1
    3cb8:	b2af 006a      	cmp.l 106(sp),d1
    3cbc:	6cca           	bge.s 3c88 <TestZoom4PictureOn5Planes+0x258>
    }
    mask = mask ^ 0xffff;
    3cbe:	466f 0082      	not.w 130(sp)
  for(int i2=0;i2<4;i2++) { 
    3cc2:	52af 006e      	addq.l #1,110(sp)
    3cc6:	7003           	moveq #3,d0
    3cc8:	b0af 006e      	cmp.l 110(sp),d0
    3ccc:	6cb4           	bge.s 3c82 <TestZoom4PictureOn5Planes+0x252>
  } 
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    3cce:	2f6f 005a 0042 	move.l 90(sp),66(sp)
    3cd4:	2f7c 0000 f460 	move.l #62560,62(sp)
    3cda:	003e 
    3cdc:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    3ce2:	2c40           	movea.l d0,a6
    3ce4:	226f 0042      	movea.l 66(sp),a1
    3ce8:	202f 003e      	move.l 62(sp),d0
    3cec:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    3cf0:	2f6f 004a 003a 	move.l 74(sp),58(sp)
    3cf6:	2f7c 0000 f460 	move.l #62560,54(sp)
    3cfc:	0036 
    3cfe:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    3d04:	2c40           	movea.l d0,a6
    3d06:	226f 003a      	movea.l 58(sp),a1
    3d0a:	202f 0036      	move.l 54(sp),d0
    3d0e:	4eae ff2e      	jsr -210(a6)
}
    3d12:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3d16:	4fef 008c      	lea 140(sp),sp
    3d1a:	4e75           	rts

00003d1c <TestZoom4Picture>:

void TestZoom4Picture() {
    3d1c:	4fef fe30      	lea -464(sp),sp
    3d20:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3d24:	2f7c 0000 30e0 	move.l #12512,106(sp)
    3d2a:	006a 
    3d2c:	7002           	moveq #2,d0
    3d2e:	2f40 0066      	move.l d0,102(sp)
    3d32:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    3d38:	2c40           	movea.l d0,a6
    3d3a:	202f 006a      	move.l 106(sp),d0
    3d3e:	222f 0066      	move.l 102(sp),d1
    3d42:	4eae ff3a      	jsr -198(a6)
    3d46:	2f40 0062      	move.l d0,98(sp)
    3d4a:	202f 0062      	move.l 98(sp),d0
    3d4e:	2f40 005e      	move.l d0,94(sp)
  if( source == 0) {
    3d52:	6646           	bne.s 3d9a <TestZoom4Picture+0x7e>
    Write(  Output(), 
    3d54:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3d5a:	2c40           	movea.l d0,a6
    3d5c:	4eae ffc4      	jsr -60(a6)
    3d60:	2f40 001e      	move.l d0,30(sp)
    3d64:	202f 001e      	move.l 30(sp),d0
    3d68:	2f40 001a      	move.l d0,26(sp)
    3d6c:	2f7c 0000 84af 	move.l #33967,22(sp)
    3d72:	0016 
    3d74:	7239           	moveq #57,d1
    3d76:	2f41 0012      	move.l d1,18(sp)
    3d7a:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3d80:	2c40           	movea.l d0,a6
    3d82:	222f 001a      	move.l 26(sp),d1
    3d86:	242f 0016      	move.l 22(sp),d2
    3d8a:	262f 0012      	move.l 18(sp),d3
    3d8e:	4eae ffd0      	jsr -48(a6)
    3d92:	2f40 000e      	move.l d0,14(sp)
    3d96:	6000 2ddc      	bra.w 6b74 <TestZoom4Picture+0x2e58>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3d9a:	2f7c 0000 30e0 	move.l #12512,90(sp)
    3da0:	005a 
    3da2:	7002           	moveq #2,d0
    3da4:	2f40 0056      	move.l d0,86(sp)
    3da8:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    3dae:	2c40           	movea.l d0,a6
    3db0:	202f 005a      	move.l 90(sp),d0
    3db4:	222f 0056      	move.l 86(sp),d1
    3db8:	4eae ff3a      	jsr -198(a6)
    3dbc:	2f40 0052      	move.l d0,82(sp)
    3dc0:	202f 0052      	move.l 82(sp),d0
    3dc4:	2f40 004e      	move.l d0,78(sp)
  if( destination == 0) {
    3dc8:	6646           	bne.s 3e10 <TestZoom4Picture+0xf4>
    Write(  Output(), 
    3dca:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3dd0:	2c40           	movea.l d0,a6
    3dd2:	4eae ffc4      	jsr -60(a6)
    3dd6:	2f40 0032      	move.l d0,50(sp)
    3dda:	202f 0032      	move.l 50(sp),d0
    3dde:	2f40 002e      	move.l d0,46(sp)
    3de2:	2f7c 0000 84e9 	move.l #34025,42(sp)
    3de8:	002a 
    3dea:	723d           	moveq #61,d1
    3dec:	2f41 0026      	move.l d1,38(sp)
    3df0:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    3df6:	2c40           	movea.l d0,a6
    3df8:	222f 002e      	move.l 46(sp),d1
    3dfc:	242f 002a      	move.l 42(sp),d2
    3e00:	262f 0026      	move.l 38(sp),d3
    3e04:	4eae ffd0      	jsr -48(a6)
    3e08:	2f40 0022      	move.l d0,34(sp)
    3e0c:	6000 2d66      	bra.w 6b74 <TestZoom4Picture+0x2e58>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3e10:	2f6f 005e 01d8 	move.l 94(sp),472(sp)
  for(int i=0;i<128+8;i++) {
    3e16:	42af 01d4      	clr.l 468(sp)
    3e1a:	6050           	bra.s 3e6c <TestZoom4Picture+0x150>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e1c:	42af 01d0      	clr.l 464(sp)
    3e20:	6018           	bra.s 3e3a <TestZoom4Picture+0x11e>
      *tmp4source++ = 0x55555555;
    3e22:	202f 01d8      	move.l 472(sp),d0
    3e26:	2200           	move.l d0,d1
    3e28:	5881           	addq.l #4,d1
    3e2a:	2f41 01d8      	move.l d1,472(sp)
    3e2e:	2040           	movea.l d0,a0
    3e30:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e36:	52af 01d0      	addq.l #1,464(sp)
    3e3a:	7009           	moveq #9,d0
    3e3c:	b0af 01d0      	cmp.l 464(sp),d0
    3e40:	6ce0           	bge.s 3e22 <TestZoom4Picture+0x106>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e42:	42af 01cc      	clr.l 460(sp)
    3e46:	6018           	bra.s 3e60 <TestZoom4Picture+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3e48:	202f 01d8      	move.l 472(sp),d0
    3e4c:	2200           	move.l d0,d1
    3e4e:	5881           	addq.l #4,d1
    3e50:	2f41 01d8      	move.l d1,472(sp)
    3e54:	2040           	movea.l d0,a0
    3e56:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e5c:	52af 01cc      	addq.l #1,460(sp)
    3e60:	7009           	moveq #9,d0
    3e62:	b0af 01cc      	cmp.l 460(sp),d0
    3e66:	6ce0           	bge.s 3e48 <TestZoom4Picture+0x12c>
  for(int i=0;i<128+8;i++) {
    3e68:	52af 01d4      	addq.l #1,468(sp)
    3e6c:	0caf 0000 0087 	cmpi.l #135,468(sp)
    3e72:	01d4 
    3e74:	6fa6           	ble.s 3e1c <TestZoom4Picture+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    3e76:	4878 0001      	pea 1 <_start+0x1>
    3e7a:	42a7           	clr.l -(sp)
    3e7c:	2f2f 0056      	move.l 86(sp),-(sp)
    3e80:	2f2f 006a      	move.l 106(sp),-(sp)
    3e84:	4eba dc46      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    3e88:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3e8c:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    3e92:	2c40           	movea.l d0,a6
    3e94:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3e98:	222f 004e      	move.l 78(sp),d1
    3e9c:	5881           	addq.l #4,d1
    3e9e:	2f41 01c8      	move.l d1,456(sp)
  UWORD *valsupposed = destlinezoom1;
    3ea2:	2f7c 0000 bb04 	move.l #47876,74(sp)
    3ea8:	004a 
  UWORD mask = 0xffff;
    3eaa:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<14;i++) {
    3eb0:	42af 01c2      	clr.l 450(sp)
    3eb4:	6000 0084      	bra.w 3f3a <TestZoom4Picture+0x21e>
    for(int i2=0;i2<18;i2++) { 
    3eb8:	42af 01be      	clr.l 446(sp)
    3ebc:	603c           	bra.s 3efa <TestZoom4Picture+0x1de>
      TestRow( valsupposed, valactual, mask, i2+i*19);
    3ebe:	222f 01c2      	move.l 450(sp),d1
    3ec2:	2001           	move.l d1,d0
    3ec4:	e788           	lsl.l #3,d0
    3ec6:	d081           	add.l d1,d0
    3ec8:	d080           	add.l d0,d0
    3eca:	d081           	add.l d1,d0
    3ecc:	2200           	move.l d0,d1
    3ece:	d2af 01be      	add.l 446(sp),d1
    3ed2:	7000           	moveq #0,d0
    3ed4:	302f 01c6      	move.w 454(sp),d0
    3ed8:	2f01           	move.l d1,-(sp)
    3eda:	2f00           	move.l d0,-(sp)
    3edc:	2f2f 01d0      	move.l 464(sp),-(sp)
    3ee0:	2f2f 0056      	move.l 86(sp),-(sp)
    3ee4:	4eba 2c98      	jsr 6b7e <TestRow>(pc)
    3ee8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3eec:	702a           	moveq #42,d0
    3eee:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    3ef2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) { 
    3ef6:	52af 01be      	addq.l #1,446(sp)
    3efa:	7211           	moveq #17,d1
    3efc:	b2af 01be      	cmp.l 446(sp),d1
    3f00:	6cbc           	bge.s 3ebe <TestZoom4Picture+0x1a2>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    3f02:	222f 01c2      	move.l 450(sp),d1
    3f06:	2001           	move.l d1,d0
    3f08:	e788           	lsl.l #3,d0
    3f0a:	d081           	add.l d1,d0
    3f0c:	d080           	add.l d0,d0
    3f0e:	2040           	movea.l d0,a0
    3f10:	d1c1           	adda.l d1,a0
    3f12:	41e8 0012      	lea 18(a0),a0
    3f16:	7000           	moveq #0,d0
    3f18:	302f 01c6      	move.w 454(sp),d0
    3f1c:	2f08           	move.l a0,-(sp)
    3f1e:	2f00           	move.l d0,-(sp)
    3f20:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f24:	2f2f 0056      	move.l 86(sp),-(sp)
    3f28:	4eba 2c54      	jsr 6b7e <TestRow>(pc)
    3f2c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f30:	702a           	moveq #42,d0
    3f32:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<14;i++) {
    3f36:	52af 01c2      	addq.l #1,450(sp)
    3f3a:	720d           	moveq #13,d1
    3f3c:	b2af 01c2      	cmp.l 450(sp),d1
    3f40:	6c00 ff76      	bge.w 3eb8 <TestZoom4Picture+0x19c>
  }

  for(int i2=0;i2<4;i2++) { 
    3f44:	42af 01ba      	clr.l 442(sp)
    3f48:	6032           	bra.s 3f7c <TestZoom4Picture+0x260>
    TestRow( valsupposed, valactual, mask, i2+265);
    3f4a:	222f 01ba      	move.l 442(sp),d1
    3f4e:	0681 0000 0109 	addi.l #265,d1
    3f54:	7000           	moveq #0,d0
    3f56:	302f 01c6      	move.w 454(sp),d0
    3f5a:	2f01           	move.l d1,-(sp)
    3f5c:	2f00           	move.l d0,-(sp)
    3f5e:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f62:	2f2f 0056      	move.l 86(sp),-(sp)
    3f66:	4eba 2c16      	jsr 6b7e <TestRow>(pc)
    3f6a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f6e:	702a           	moveq #42,d0
    3f70:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    3f74:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    3f78:	52af 01ba      	addq.l #1,442(sp)
    3f7c:	7203           	moveq #3,d1
    3f7e:	b2af 01ba      	cmp.l 442(sp),d1
    3f82:	6cc6           	bge.s 3f4a <TestZoom4Picture+0x22e>
  }
  
  UWORD *tmp = source;
    3f84:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    3f8a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    3f90:	2f6f 0046 004e 	move.l 70(sp),78(sp)
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    3f96:	4878 0001      	pea 1 <_start+0x1>
    3f9a:	4878 0001      	pea 1 <_start+0x1>
    3f9e:	2f2f 0056      	move.l 86(sp),-(sp)
    3fa2:	2f2f 006a      	move.l 106(sp),-(sp)
    3fa6:	4eba db24      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    3faa:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3fae:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    3fb4:	2c40           	movea.l d0,a6
    3fb6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    3fba:	202f 004e      	move.l 78(sp),d0
    3fbe:	5880           	addq.l #4,d0
    3fc0:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom2;
    3fc4:	2f7c 0000 bb30 	move.l #47920,74(sp)
    3fca:	004a 
  mask = 0x0000;
    3fcc:	426f 01c6      	clr.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3fd0:	42af 01b6      	clr.l 438(sp)
    3fd4:	602a           	bra.s 4000 <TestZoom4Picture+0x2e4>
    TestRow( valsupposed, valactual, mask, i2);
    3fd6:	7000           	moveq #0,d0
    3fd8:	302f 01c6      	move.w 454(sp),d0
    3fdc:	2f2f 01b6      	move.l 438(sp),-(sp)
    3fe0:	2f00           	move.l d0,-(sp)
    3fe2:	2f2f 01d0      	move.l 464(sp),-(sp)
    3fe6:	2f2f 0056      	move.l 86(sp),-(sp)
    3fea:	4eba 2b92      	jsr 6b7e <TestRow>(pc)
    3fee:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3ff2:	722a           	moveq #42,d1
    3ff4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    3ff8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3ffc:	52af 01b6      	addq.l #1,438(sp)
    4000:	700a           	moveq #10,d0
    4002:	b0af 01b6      	cmp.l 438(sp),d0
    4006:	6cce           	bge.s 3fd6 <TestZoom4Picture+0x2ba>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    4008:	4878 0008      	pea 8 <_start+0x8>
    400c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4012:	2f2f 01d0      	move.l 464(sp),-(sp)
    4016:	2f2f 0056      	move.l 86(sp),-(sp)
    401a:	4eba 2b62      	jsr 6b7e <TestRow>(pc)
    401e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4022:	722a           	moveq #42,d1
    4024:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 9);
    4028:	4878 0009      	pea 9 <_start+0x9>
    402c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4032:	2f2f 01d0      	move.l 464(sp),-(sp)
    4036:	2f2f 0056      	move.l 86(sp),-(sp)
    403a:	4eba 2b42      	jsr 6b7e <TestRow>(pc)
    403e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4042:	702a           	moveq #42,d0
    4044:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 10);
    4048:	4878 000a      	pea a <_start+0xa>
    404c:	42a7           	clr.l -(sp)
    404e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4052:	2f2f 0056      	move.l 86(sp),-(sp)
    4056:	4eba 2b26      	jsr 6b7e <TestRow>(pc)
    405a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    405e:	722a           	moveq #42,d1
    4060:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 11);
    4064:	4878 000b      	pea b <_start+0xb>
    4068:	42a7           	clr.l -(sp)
    406a:	2f2f 01d0      	move.l 464(sp),-(sp)
    406e:	2f2f 0056      	move.l 86(sp),-(sp)
    4072:	4eba 2b0a      	jsr 6b7e <TestRow>(pc)
    4076:	4fef 0010      	lea 16(sp),sp

  valactual += ZMLINESIZE/2;
    407a:	702a           	moveq #42,d0
    407c:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<12;i++) {
    4080:	42af 01b2      	clr.l 434(sp)
    4084:	6000 0118      	bra.w 419e <TestZoom4Picture+0x482>
    for(int i2=0;i2<16;i2++) {  
    4088:	42af 01ae      	clr.l 430(sp)
    408c:	603c           	bra.s 40ca <TestZoom4Picture+0x3ae>
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    408e:	222f 01b2      	move.l 434(sp),d1
    4092:	2001           	move.l d1,d0
    4094:	e988           	lsl.l #4,d0
    4096:	d081           	add.l d1,d0
    4098:	2040           	movea.l d0,a0
    409a:	d1ef 01ae      	adda.l 430(sp),a0
    409e:	41e8 000b      	lea 11(a0),a0
    40a2:	7000           	moveq #0,d0
    40a4:	302f 01c6      	move.w 454(sp),d0
    40a8:	2f08           	move.l a0,-(sp)
    40aa:	2f00           	move.l d0,-(sp)
    40ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    40b0:	2f2f 0056      	move.l 86(sp),-(sp)
    40b4:	4eba 2ac8      	jsr 6b7e <TestRow>(pc)
    40b8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    40bc:	722a           	moveq #42,d1
    40be:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    40c2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {  
    40c6:	52af 01ae      	addq.l #1,430(sp)
    40ca:	700f           	moveq #15,d0
    40cc:	b0af 01ae      	cmp.l 430(sp),d0
    40d0:	6cbc           	bge.s 408e <TestZoom4Picture+0x372>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    40d2:	222f 01b2      	move.l 434(sp),d1
    40d6:	2001           	move.l d1,d0
    40d8:	e988           	lsl.l #4,d0
    40da:	2040           	movea.l d0,a0
    40dc:	d1c1           	adda.l d1,a0
    40de:	41e8 0018      	lea 24(a0),a0
    40e2:	7000           	moveq #0,d0
    40e4:	302f 01c6      	move.w 454(sp),d0
    40e8:	2f08           	move.l a0,-(sp)
    40ea:	2f00           	move.l d0,-(sp)
    40ec:	2f2f 01d0      	move.l 464(sp),-(sp)
    40f0:	2f2f 0056      	move.l 86(sp),-(sp)
    40f4:	4eba 2a88      	jsr 6b7e <TestRow>(pc)
    40f8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40fc:	722a           	moveq #42,d1
    40fe:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    4102:	222f 01b2      	move.l 434(sp),d1
    4106:	2001           	move.l d1,d0
    4108:	e988           	lsl.l #4,d0
    410a:	2040           	movea.l d0,a0
    410c:	d1c1           	adda.l d1,a0
    410e:	41e8 0019      	lea 25(a0),a0
    4112:	7000           	moveq #0,d0
    4114:	302f 01c6      	move.w 454(sp),d0
    4118:	2f08           	move.l a0,-(sp)
    411a:	2f00           	move.l d0,-(sp)
    411c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4120:	2f2f 0056      	move.l 86(sp),-(sp)
    4124:	4eba 2a58      	jsr 6b7e <TestRow>(pc)
    4128:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    412c:	702a           	moveq #42,d0
    412e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4132:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    4136:	222f 01b2      	move.l 434(sp),d1
    413a:	2001           	move.l d1,d0
    413c:	e988           	lsl.l #4,d0
    413e:	2040           	movea.l d0,a0
    4140:	d1c1           	adda.l d1,a0
    4142:	41e8 001a      	lea 26(a0),a0
    4146:	7000           	moveq #0,d0
    4148:	302f 01c6      	move.w 454(sp),d0
    414c:	2f08           	move.l a0,-(sp)
    414e:	2f00           	move.l d0,-(sp)
    4150:	2f2f 01d0      	move.l 464(sp),-(sp)
    4154:	2f2f 0056      	move.l 86(sp),-(sp)
    4158:	4eba 2a24      	jsr 6b7e <TestRow>(pc)
    415c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4160:	722a           	moveq #42,d1
    4162:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    4166:	222f 01b2      	move.l 434(sp),d1
    416a:	2001           	move.l d1,d0
    416c:	e988           	lsl.l #4,d0
    416e:	2040           	movea.l d0,a0
    4170:	d1c1           	adda.l d1,a0
    4172:	41e8 001b      	lea 27(a0),a0
    4176:	7000           	moveq #0,d0
    4178:	302f 01c6      	move.w 454(sp),d0
    417c:	2f08           	move.l a0,-(sp)
    417e:	2f00           	move.l d0,-(sp)
    4180:	2f2f 01d0      	move.l 464(sp),-(sp)
    4184:	2f2f 0056      	move.l 86(sp),-(sp)
    4188:	4eba 29f4      	jsr 6b7e <TestRow>(pc)
    418c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4190:	702a           	moveq #42,d0
    4192:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4196:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    419a:	52af 01b2      	addq.l #1,434(sp)
    419e:	720b           	moveq #11,d1
    41a0:	b2af 01b2      	cmp.l 434(sp),d1
    41a4:	6c00 fee2      	bge.w 4088 <TestZoom4Picture+0x36c>
    
  }

  for(int i2=0;i2<15;i2++) { 
    41a8:	42af 01aa      	clr.l 426(sp)
    41ac:	602a           	bra.s 41d8 <TestZoom4Picture+0x4bc>
    TestRow( valsupposed, valactual, mask, i2);
    41ae:	7000           	moveq #0,d0
    41b0:	302f 01c6      	move.w 454(sp),d0
    41b4:	2f2f 01aa      	move.l 426(sp),-(sp)
    41b8:	2f00           	move.l d0,-(sp)
    41ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    41be:	2f2f 0056      	move.l 86(sp),-(sp)
    41c2:	4eba 29ba      	jsr 6b7e <TestRow>(pc)
    41c6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    41ca:	702a           	moveq #42,d0
    41cc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    41d0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<15;i2++) { 
    41d4:	52af 01aa      	addq.l #1,426(sp)
    41d8:	720e           	moveq #14,d1
    41da:	b2af 01aa      	cmp.l 426(sp),d1
    41de:	6cce           	bge.s 41ae <TestZoom4Picture+0x492>
  }

  tmp = source;
    41e0:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    41e6:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    41ec:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    41f2:	4878 0001      	pea 1 <_start+0x1>
    41f6:	4878 0002      	pea 2 <_start+0x2>
    41fa:	2f2f 0056      	move.l 86(sp),-(sp)
    41fe:	2f2f 006a      	move.l 106(sp),-(sp)
    4202:	4eba d8c8      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    4206:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    420a:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    4210:	2c40           	movea.l d0,a6
    4212:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4216:	202f 004e      	move.l 78(sp),d0
    421a:	5880           	addq.l #4,d0
    421c:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom3;
    4220:	2f7c 0000 bb5c 	move.l #47964,74(sp)
    4226:	004a 
  mask = 0xffff;
    4228:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<4;i2++) { 
    422e:	42af 01a6      	clr.l 422(sp)
    4232:	602a           	bra.s 425e <TestZoom4Picture+0x542>
    TestRow( valsupposed, valactual, mask, i2);
    4234:	7000           	moveq #0,d0
    4236:	302f 01c6      	move.w 454(sp),d0
    423a:	2f2f 01a6      	move.l 422(sp),-(sp)
    423e:	2f00           	move.l d0,-(sp)
    4240:	2f2f 01d0      	move.l 464(sp),-(sp)
    4244:	2f2f 0056      	move.l 86(sp),-(sp)
    4248:	4eba 2934      	jsr 6b7e <TestRow>(pc)
    424c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4250:	722a           	moveq #42,d1
    4252:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4256:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    425a:	52af 01a6      	addq.l #1,422(sp)
    425e:	7003           	moveq #3,d0
    4260:	b0af 01a6      	cmp.l 422(sp),d0
    4264:	6cce           	bge.s 4234 <TestZoom4Picture+0x518>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    4266:	4878 0004      	pea 4 <_start+0x4>
    426a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4270:	2f2f 01d0      	move.l 464(sp),-(sp)
    4274:	2f2f 0056      	move.l 86(sp),-(sp)
    4278:	4eba 2904      	jsr 6b7e <TestRow>(pc)
    427c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4280:	722a           	moveq #42,d1
    4282:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    4286:	4878 0005      	pea 5 <_start+0x5>
    428a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4290:	2f2f 01d0      	move.l 464(sp),-(sp)
    4294:	2f2f 0056      	move.l 86(sp),-(sp)
    4298:	4eba 28e4      	jsr 6b7e <TestRow>(pc)
    429c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42a0:	702a           	moveq #42,d0
    42a2:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    42a6:	4878 0006      	pea 6 <_start+0x6>
    42aa:	42a7           	clr.l -(sp)
    42ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    42b0:	2f2f 0056      	move.l 86(sp),-(sp)
    42b4:	4eba 28c8      	jsr 6b7e <TestRow>(pc)
    42b8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42bc:	722a           	moveq #42,d1
    42be:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    42c2:	4878 0007      	pea 7 <_start+0x7>
    42c6:	42a7           	clr.l -(sp)
    42c8:	2f2f 01d0      	move.l 464(sp),-(sp)
    42cc:	2f2f 0056      	move.l 86(sp),-(sp)
    42d0:	4eba 28ac      	jsr 6b7e <TestRow>(pc)
    42d4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42d8:	702a           	moveq #42,d0
    42da:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    42de:	4878 0008      	pea 8 <_start+0x8>
    42e2:	2f3c 0000 ffff 	move.l #65535,-(sp)
    42e8:	2f2f 01d0      	move.l 464(sp),-(sp)
    42ec:	2f2f 0056      	move.l 86(sp),-(sp)
    42f0:	4eba 288c      	jsr 6b7e <TestRow>(pc)
    42f4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42f8:	722a           	moveq #42,d1
    42fa:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    42fe:	4878 0009      	pea 9 <_start+0x9>
    4302:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4308:	2f2f 01d0      	move.l 464(sp),-(sp)
    430c:	2f2f 0056      	move.l 86(sp),-(sp)
    4310:	4eba 286c      	jsr 6b7e <TestRow>(pc)
    4314:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4318:	702a           	moveq #42,d0
    431a:	d1af 01c8      	add.l d0,456(sp)

  mask = 0x0000;
    431e:	426f 01c6      	clr.w 454(sp)
  for(int i=0;i<12;i++) {
    4322:	42af 01a2      	clr.l 418(sp)
    4326:	6000 01a6      	bra.w 44ce <TestZoom4Picture+0x7b2>
    for(int i2=0;i2<15;i2++) {  
    432a:	42af 019e      	clr.l 414(sp)
    432e:	6042           	bra.s 4372 <TestZoom4Picture+0x656>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    4330:	222f 01a2      	move.l 418(sp),d1
    4334:	2001           	move.l d1,d0
    4336:	d080           	add.l d0,d0
    4338:	d081           	add.l d1,d0
    433a:	2200           	move.l d0,d1
    433c:	e789           	lsl.l #3,d1
    433e:	9280           	sub.l d0,d1
    4340:	2041           	movea.l d1,a0
    4342:	d1ef 019e      	adda.l 414(sp),a0
    4346:	41e8 0009      	lea 9(a0),a0
    434a:	7000           	moveq #0,d0
    434c:	302f 01c6      	move.w 454(sp),d0
    4350:	2f08           	move.l a0,-(sp)
    4352:	2f00           	move.l d0,-(sp)
    4354:	2f2f 01d0      	move.l 464(sp),-(sp)
    4358:	2f2f 0056      	move.l 86(sp),-(sp)
    435c:	4eba 2820      	jsr 6b7e <TestRow>(pc)
    4360:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4364:	722a           	moveq #42,d1
    4366:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    436a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {  
    436e:	52af 019e      	addq.l #1,414(sp)
    4372:	700e           	moveq #14,d0
    4374:	b0af 019e      	cmp.l 414(sp),d0
    4378:	6cb6           	bge.s 4330 <TestZoom4Picture+0x614>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    437a:	222f 01a2      	move.l 418(sp),d1
    437e:	2001           	move.l d1,d0
    4380:	d080           	add.l d0,d0
    4382:	d081           	add.l d1,d0
    4384:	2200           	move.l d0,d1
    4386:	e789           	lsl.l #3,d1
    4388:	2041           	movea.l d1,a0
    438a:	91c0           	suba.l d0,a0
    438c:	41e8 0018      	lea 24(a0),a0
    4390:	7000           	moveq #0,d0
    4392:	302f 01c6      	move.w 454(sp),d0
    4396:	2f08           	move.l a0,-(sp)
    4398:	2f00           	move.l d0,-(sp)
    439a:	2f2f 01d0      	move.l 464(sp),-(sp)
    439e:	2f2f 0056      	move.l 86(sp),-(sp)
    43a2:	4eba 27da      	jsr 6b7e <TestRow>(pc)
    43a6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43aa:	722a           	moveq #42,d1
    43ac:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    43b0:	222f 01a2      	move.l 418(sp),d1
    43b4:	2001           	move.l d1,d0
    43b6:	d080           	add.l d0,d0
    43b8:	d081           	add.l d1,d0
    43ba:	2200           	move.l d0,d1
    43bc:	e789           	lsl.l #3,d1
    43be:	2041           	movea.l d1,a0
    43c0:	91c0           	suba.l d0,a0
    43c2:	41e8 0019      	lea 25(a0),a0
    43c6:	7000           	moveq #0,d0
    43c8:	302f 01c6      	move.w 454(sp),d0
    43cc:	2f08           	move.l a0,-(sp)
    43ce:	2f00           	move.l d0,-(sp)
    43d0:	2f2f 01d0      	move.l 464(sp),-(sp)
    43d4:	2f2f 0056      	move.l 86(sp),-(sp)
    43d8:	4eba 27a4      	jsr 6b7e <TestRow>(pc)
    43dc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43e0:	702a           	moveq #42,d0
    43e2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    43e6:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    43ea:	222f 01a2      	move.l 418(sp),d1
    43ee:	2001           	move.l d1,d0
    43f0:	d080           	add.l d0,d0
    43f2:	d081           	add.l d1,d0
    43f4:	2200           	move.l d0,d1
    43f6:	e789           	lsl.l #3,d1
    43f8:	2041           	movea.l d1,a0
    43fa:	91c0           	suba.l d0,a0
    43fc:	41e8 001a      	lea 26(a0),a0
    4400:	7000           	moveq #0,d0
    4402:	302f 01c6      	move.w 454(sp),d0
    4406:	2f08           	move.l a0,-(sp)
    4408:	2f00           	move.l d0,-(sp)
    440a:	2f2f 01d0      	move.l 464(sp),-(sp)
    440e:	2f2f 0056      	move.l 86(sp),-(sp)
    4412:	4eba 276a      	jsr 6b7e <TestRow>(pc)
    4416:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    441a:	722a           	moveq #42,d1
    441c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    4420:	222f 01a2      	move.l 418(sp),d1
    4424:	2001           	move.l d1,d0
    4426:	d080           	add.l d0,d0
    4428:	d081           	add.l d1,d0
    442a:	2200           	move.l d0,d1
    442c:	e789           	lsl.l #3,d1
    442e:	2041           	movea.l d1,a0
    4430:	91c0           	suba.l d0,a0
    4432:	41e8 001b      	lea 27(a0),a0
    4436:	7000           	moveq #0,d0
    4438:	302f 01c6      	move.w 454(sp),d0
    443c:	2f08           	move.l a0,-(sp)
    443e:	2f00           	move.l d0,-(sp)
    4440:	2f2f 01d0      	move.l 464(sp),-(sp)
    4444:	2f2f 0056      	move.l 86(sp),-(sp)
    4448:	4eba 2734      	jsr 6b7e <TestRow>(pc)
    444c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4450:	702a           	moveq #42,d0
    4452:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4456:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    445a:	222f 01a2      	move.l 418(sp),d1
    445e:	2001           	move.l d1,d0
    4460:	d080           	add.l d0,d0
    4462:	d081           	add.l d1,d0
    4464:	2200           	move.l d0,d1
    4466:	e789           	lsl.l #3,d1
    4468:	2041           	movea.l d1,a0
    446a:	91c0           	suba.l d0,a0
    446c:	41e8 001c      	lea 28(a0),a0
    4470:	7000           	moveq #0,d0
    4472:	302f 01c6      	move.w 454(sp),d0
    4476:	2f08           	move.l a0,-(sp)
    4478:	2f00           	move.l d0,-(sp)
    447a:	2f2f 01d0      	move.l 464(sp),-(sp)
    447e:	2f2f 0056      	move.l 86(sp),-(sp)
    4482:	4eba 26fa      	jsr 6b7e <TestRow>(pc)
    4486:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    448a:	722a           	moveq #42,d1
    448c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4490:	222f 01a2      	move.l 418(sp),d1
    4494:	2001           	move.l d1,d0
    4496:	d080           	add.l d0,d0
    4498:	d081           	add.l d1,d0
    449a:	2200           	move.l d0,d1
    449c:	e789           	lsl.l #3,d1
    449e:	2041           	movea.l d1,a0
    44a0:	91c0           	suba.l d0,a0
    44a2:	41e8 001d      	lea 29(a0),a0
    44a6:	7000           	moveq #0,d0
    44a8:	302f 01c6      	move.w 454(sp),d0
    44ac:	2f08           	move.l a0,-(sp)
    44ae:	2f00           	move.l d0,-(sp)
    44b0:	2f2f 01d0      	move.l 464(sp),-(sp)
    44b4:	2f2f 0056      	move.l 86(sp),-(sp)
    44b8:	4eba 26c4      	jsr 6b7e <TestRow>(pc)
    44bc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    44c0:	702a           	moveq #42,d0
    44c2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    44c6:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    44ca:	52af 01a2      	addq.l #1,418(sp)
    44ce:	720b           	moveq #11,d1
    44d0:	b2af 01a2      	cmp.l 418(sp),d1
    44d4:	6c00 fe54      	bge.w 432a <TestZoom4Picture+0x60e>
  }

  for(int i2=0;i2<8;i2++) {  
    44d8:	42af 019a      	clr.l 410(sp)
    44dc:	6032           	bra.s 4510 <TestZoom4Picture+0x7f4>
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    44de:	222f 019a      	move.l 410(sp),d1
    44e2:	0681 0000 0105 	addi.l #261,d1
    44e8:	7000           	moveq #0,d0
    44ea:	302f 01c6      	move.w 454(sp),d0
    44ee:	2f01           	move.l d1,-(sp)
    44f0:	2f00           	move.l d0,-(sp)
    44f2:	2f2f 01d0      	move.l 464(sp),-(sp)
    44f6:	2f2f 0056      	move.l 86(sp),-(sp)
    44fa:	4eba 2682      	jsr 6b7e <TestRow>(pc)
    44fe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4502:	702a           	moveq #42,d0
    4504:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4508:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    450c:	52af 019a      	addq.l #1,410(sp)
    4510:	7207           	moveq #7,d1
    4512:	b2af 019a      	cmp.l 410(sp),d1
    4516:	6cc6           	bge.s 44de <TestZoom4Picture+0x7c2>
  }

  tmp = source;
    4518:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    451e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4524:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    452a:	4878 0001      	pea 1 <_start+0x1>
    452e:	4878 0003      	pea 3 <_start+0x3>
    4532:	2f2f 0056      	move.l 86(sp),-(sp)
    4536:	2f2f 006a      	move.l 106(sp),-(sp)
    453a:	4eba d590      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    453e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4542:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    4548:	2c40           	movea.l d0,a6
    454a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    454e:	202f 004e      	move.l 78(sp),d0
    4552:	5880           	addq.l #4,d0
    4554:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom4;
    4558:	2f7c 0000 bb88 	move.l #48008,74(sp)
    455e:	004a 
  mask = 0x0000;
    4560:	426f 01c6      	clr.w 454(sp)
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    4564:	4878 0007      	pea 7 <_start+0x7>
    4568:	42a7           	clr.l -(sp)
    456a:	2f2f 01d0      	move.l 464(sp),-(sp)
    456e:	2f2f 0056      	move.l 86(sp),-(sp)
    4572:	4eba 260a      	jsr 6b7e <TestRow>(pc)
    4576:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    457a:	722a           	moveq #42,d1
    457c:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    4580:	4878 0008      	pea 8 <_start+0x8>
    4584:	2f3c 0000 ffff 	move.l #65535,-(sp)
    458a:	2f2f 01d0      	move.l 464(sp),-(sp)
    458e:	2f2f 0056      	move.l 86(sp),-(sp)
    4592:	4eba 25ea      	jsr 6b7e <TestRow>(pc)
    4596:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    459a:	702a           	moveq #42,d0
    459c:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    45a0:	4878 0009      	pea 9 <_start+0x9>
    45a4:	2f3c 0000 ffff 	move.l #65535,-(sp)
    45aa:	2f2f 01d0      	move.l 464(sp),-(sp)
    45ae:	2f2f 0056      	move.l 86(sp),-(sp)
    45b2:	4eba 25ca      	jsr 6b7e <TestRow>(pc)
    45b6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    45ba:	722a           	moveq #42,d1
    45bc:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    45c0:	4878 0008      	pea 8 <_start+0x8>
    45c4:	42a7           	clr.l -(sp)
    45c6:	2f2f 01d0      	move.l 464(sp),-(sp)
    45ca:	2f2f 0056      	move.l 86(sp),-(sp)
    45ce:	4eba 25ae      	jsr 6b7e <TestRow>(pc)
    45d2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    45d6:	702a           	moveq #42,d0
    45d8:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    45dc:	4878 0009      	pea 9 <_start+0x9>
    45e0:	42a7           	clr.l -(sp)
    45e2:	2f2f 01d0      	move.l 464(sp),-(sp)
    45e6:	2f2f 0056      	move.l 86(sp),-(sp)
    45ea:	4eba 2592      	jsr 6b7e <TestRow>(pc)
    45ee:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    45f2:	722a           	moveq #42,d1
    45f4:	d3af 01c8      	add.l d1,456(sp)

  mask = 0xffff;
    45f8:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<12;i++) {
    45fe:	42af 0196      	clr.l 406(sp)
    4602:	6000 0216      	bra.w 481a <TestZoom4Picture+0xafe>
    for(int i2=0;i2<14;i2++) {  
    4606:	42af 0192      	clr.l 402(sp)
    460a:	6042           	bra.s 464e <TestZoom4Picture+0x932>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    460c:	222f 0196      	move.l 406(sp),d1
    4610:	2001           	move.l d1,d0
    4612:	d080           	add.l d0,d0
    4614:	d081           	add.l d1,d0
    4616:	2200           	move.l d0,d1
    4618:	e789           	lsl.l #3,d1
    461a:	9280           	sub.l d0,d1
    461c:	2041           	movea.l d1,a0
    461e:	d1ef 0192      	adda.l 402(sp),a0
    4622:	41e8 0009      	lea 9(a0),a0
    4626:	7000           	moveq #0,d0
    4628:	302f 01c6      	move.w 454(sp),d0
    462c:	2f08           	move.l a0,-(sp)
    462e:	2f00           	move.l d0,-(sp)
    4630:	2f2f 01d0      	move.l 464(sp),-(sp)
    4634:	2f2f 0056      	move.l 86(sp),-(sp)
    4638:	4eba 2544      	jsr 6b7e <TestRow>(pc)
    463c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4640:	702a           	moveq #42,d0
    4642:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4646:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {  
    464a:	52af 0192      	addq.l #1,402(sp)
    464e:	720d           	moveq #13,d1
    4650:	b2af 0192      	cmp.l 402(sp),d1
    4654:	6cb6           	bge.s 460c <TestZoom4Picture+0x8f0>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    4656:	222f 0196      	move.l 406(sp),d1
    465a:	2001           	move.l d1,d0
    465c:	d080           	add.l d0,d0
    465e:	d081           	add.l d1,d0
    4660:	2200           	move.l d0,d1
    4662:	e789           	lsl.l #3,d1
    4664:	2041           	movea.l d1,a0
    4666:	91c0           	suba.l d0,a0
    4668:	41e8 0018      	lea 24(a0),a0
    466c:	7000           	moveq #0,d0
    466e:	302f 01c6      	move.w 454(sp),d0
    4672:	2f08           	move.l a0,-(sp)
    4674:	2f00           	move.l d0,-(sp)
    4676:	2f2f 01d0      	move.l 464(sp),-(sp)
    467a:	2f2f 0056      	move.l 86(sp),-(sp)
    467e:	4eba 24fe      	jsr 6b7e <TestRow>(pc)
    4682:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4686:	702a           	moveq #42,d0
    4688:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    468c:	222f 0196      	move.l 406(sp),d1
    4690:	2001           	move.l d1,d0
    4692:	d080           	add.l d0,d0
    4694:	d081           	add.l d1,d0
    4696:	2200           	move.l d0,d1
    4698:	e789           	lsl.l #3,d1
    469a:	2041           	movea.l d1,a0
    469c:	91c0           	suba.l d0,a0
    469e:	41e8 0019      	lea 25(a0),a0
    46a2:	7000           	moveq #0,d0
    46a4:	302f 01c6      	move.w 454(sp),d0
    46a8:	2f08           	move.l a0,-(sp)
    46aa:	2f00           	move.l d0,-(sp)
    46ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    46b0:	2f2f 0056      	move.l 86(sp),-(sp)
    46b4:	4eba 24c8      	jsr 6b7e <TestRow>(pc)
    46b8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46bc:	722a           	moveq #42,d1
    46be:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    46c2:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    46c6:	222f 0196      	move.l 406(sp),d1
    46ca:	2001           	move.l d1,d0
    46cc:	d080           	add.l d0,d0
    46ce:	d081           	add.l d1,d0
    46d0:	2200           	move.l d0,d1
    46d2:	e789           	lsl.l #3,d1
    46d4:	2041           	movea.l d1,a0
    46d6:	91c0           	suba.l d0,a0
    46d8:	41e8 001a      	lea 26(a0),a0
    46dc:	7000           	moveq #0,d0
    46de:	302f 01c6      	move.w 454(sp),d0
    46e2:	2f08           	move.l a0,-(sp)
    46e4:	2f00           	move.l d0,-(sp)
    46e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    46ea:	2f2f 0056      	move.l 86(sp),-(sp)
    46ee:	4eba 248e      	jsr 6b7e <TestRow>(pc)
    46f2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46f6:	702a           	moveq #42,d0
    46f8:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    46fc:	222f 0196      	move.l 406(sp),d1
    4700:	2001           	move.l d1,d0
    4702:	d080           	add.l d0,d0
    4704:	d081           	add.l d1,d0
    4706:	2200           	move.l d0,d1
    4708:	e789           	lsl.l #3,d1
    470a:	2041           	movea.l d1,a0
    470c:	91c0           	suba.l d0,a0
    470e:	41e8 001b      	lea 27(a0),a0
    4712:	7000           	moveq #0,d0
    4714:	302f 01c6      	move.w 454(sp),d0
    4718:	2f08           	move.l a0,-(sp)
    471a:	2f00           	move.l d0,-(sp)
    471c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4720:	2f2f 0056      	move.l 86(sp),-(sp)
    4724:	4eba 2458      	jsr 6b7e <TestRow>(pc)
    4728:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    472c:	722a           	moveq #42,d1
    472e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4732:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4736:	222f 0196      	move.l 406(sp),d1
    473a:	2001           	move.l d1,d0
    473c:	d080           	add.l d0,d0
    473e:	d081           	add.l d1,d0
    4740:	2200           	move.l d0,d1
    4742:	e789           	lsl.l #3,d1
    4744:	2041           	movea.l d1,a0
    4746:	91c0           	suba.l d0,a0
    4748:	41e8 001c      	lea 28(a0),a0
    474c:	7000           	moveq #0,d0
    474e:	302f 01c6      	move.w 454(sp),d0
    4752:	2f08           	move.l a0,-(sp)
    4754:	2f00           	move.l d0,-(sp)
    4756:	2f2f 01d0      	move.l 464(sp),-(sp)
    475a:	2f2f 0056      	move.l 86(sp),-(sp)
    475e:	4eba 241e      	jsr 6b7e <TestRow>(pc)
    4762:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4766:	702a           	moveq #42,d0
    4768:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    476c:	222f 0196      	move.l 406(sp),d1
    4770:	2001           	move.l d1,d0
    4772:	d080           	add.l d0,d0
    4774:	d081           	add.l d1,d0
    4776:	2200           	move.l d0,d1
    4778:	e789           	lsl.l #3,d1
    477a:	2041           	movea.l d1,a0
    477c:	91c0           	suba.l d0,a0
    477e:	41e8 001d      	lea 29(a0),a0
    4782:	7000           	moveq #0,d0
    4784:	302f 01c6      	move.w 454(sp),d0
    4788:	2f08           	move.l a0,-(sp)
    478a:	2f00           	move.l d0,-(sp)
    478c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4790:	2f2f 0056      	move.l 86(sp),-(sp)
    4794:	4eba 23e8      	jsr 6b7e <TestRow>(pc)
    4798:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    479c:	722a           	moveq #42,d1
    479e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    47a2:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    47a6:	222f 0196      	move.l 406(sp),d1
    47aa:	2001           	move.l d1,d0
    47ac:	d080           	add.l d0,d0
    47ae:	d081           	add.l d1,d0
    47b0:	2200           	move.l d0,d1
    47b2:	e789           	lsl.l #3,d1
    47b4:	2041           	movea.l d1,a0
    47b6:	91c0           	suba.l d0,a0
    47b8:	41e8 001c      	lea 28(a0),a0
    47bc:	7000           	moveq #0,d0
    47be:	302f 01c6      	move.w 454(sp),d0
    47c2:	2f08           	move.l a0,-(sp)
    47c4:	2f00           	move.l d0,-(sp)
    47c6:	2f2f 01d0      	move.l 464(sp),-(sp)
    47ca:	2f2f 0056      	move.l 86(sp),-(sp)
    47ce:	4eba 23ae      	jsr 6b7e <TestRow>(pc)
    47d2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    47d6:	702a           	moveq #42,d0
    47d8:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    47dc:	222f 0196      	move.l 406(sp),d1
    47e0:	2001           	move.l d1,d0
    47e2:	d080           	add.l d0,d0
    47e4:	d081           	add.l d1,d0
    47e6:	2200           	move.l d0,d1
    47e8:	e789           	lsl.l #3,d1
    47ea:	2041           	movea.l d1,a0
    47ec:	91c0           	suba.l d0,a0
    47ee:	41e8 001d      	lea 29(a0),a0
    47f2:	7000           	moveq #0,d0
    47f4:	302f 01c6      	move.w 454(sp),d0
    47f8:	2f08           	move.l a0,-(sp)
    47fa:	2f00           	move.l d0,-(sp)
    47fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4800:	2f2f 0056      	move.l 86(sp),-(sp)
    4804:	4eba 2378      	jsr 6b7e <TestRow>(pc)
    4808:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    480c:	722a           	moveq #42,d1
    480e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4812:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    4816:	52af 0196      	addq.l #1,406(sp)
    481a:	700b           	moveq #11,d0
    481c:	b0af 0196      	cmp.l 406(sp),d0
    4820:	6c00 fde4      	bge.w 4606 <TestZoom4Picture+0x8ea>
  }

  TestRow( valsupposed, valactual, mask, 269);
    4824:	7000           	moveq #0,d0
    4826:	302f 01c6      	move.w 454(sp),d0
    482a:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    482e:	2f00           	move.l d0,-(sp)
    4830:	2f2f 01d0      	move.l 464(sp),-(sp)
    4834:	2f2f 0056      	move.l 86(sp),-(sp)
    4838:	4eba 2344      	jsr 6b7e <TestRow>(pc)
    483c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4840:	722a           	moveq #42,d1
    4842:	d3af 01c8      	add.l d1,456(sp)
  
  tmp = source;
    4846:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    484c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4852:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    4858:	4878 0001      	pea 1 <_start+0x1>
    485c:	4878 0004      	pea 4 <_start+0x4>
    4860:	2f2f 0056      	move.l 86(sp),-(sp)
    4864:	2f2f 006a      	move.l 106(sp),-(sp)
    4868:	4eba d262      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    486c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4870:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    4876:	2c40           	movea.l d0,a6
    4878:	4eae ff1c      	jsr -228(a6)

  valactual = destination+2; 
    487c:	202f 004e      	move.l 78(sp),d0
    4880:	5880           	addq.l #4,d0
    4882:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom5;
    4886:	2f7c 0000 bbb4 	move.l #48052,74(sp)
    488c:	004a 
  mask = 0x0000;
    488e:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<13;i2++) {  
    4892:	42af 018e      	clr.l 398(sp)
    4896:	602a           	bra.s 48c2 <TestZoom4Picture+0xba6>
    TestRow( valsupposed, valactual, mask, i2);
    4898:	7000           	moveq #0,d0
    489a:	302f 01c6      	move.w 454(sp),d0
    489e:	2f2f 018e      	move.l 398(sp),-(sp)
    48a2:	2f00           	move.l d0,-(sp)
    48a4:	2f2f 01d0      	move.l 464(sp),-(sp)
    48a8:	2f2f 0056      	move.l 86(sp),-(sp)
    48ac:	4eba 22d0      	jsr 6b7e <TestRow>(pc)
    48b0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    48b4:	722a           	moveq #42,d1
    48b6:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    48ba:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    48be:	52af 018e      	addq.l #1,398(sp)
    48c2:	700c           	moveq #12,d0
    48c4:	b0af 018e      	cmp.l 398(sp),d0
    48c8:	6cce           	bge.s 4898 <TestZoom4Picture+0xb7c>
  }

  TestRow( valsupposed, valactual, mask, 12);   
    48ca:	7000           	moveq #0,d0
    48cc:	302f 01c6      	move.w 454(sp),d0
    48d0:	4878 000c      	pea c <_start+0xc>
    48d4:	2f00           	move.l d0,-(sp)
    48d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    48da:	2f2f 0056      	move.l 86(sp),-(sp)
    48de:	4eba 229e      	jsr 6b7e <TestRow>(pc)
    48e2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48e6:	722a           	moveq #42,d1
    48e8:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 13);
    48ec:	7000           	moveq #0,d0
    48ee:	302f 01c6      	move.w 454(sp),d0
    48f2:	4878 000d      	pea d <_start+0xd>
    48f6:	2f00           	move.l d0,-(sp)
    48f8:	2f2f 01d0      	move.l 464(sp),-(sp)
    48fc:	2f2f 0056      	move.l 86(sp),-(sp)
    4900:	4eba 227c      	jsr 6b7e <TestRow>(pc)
    4904:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4908:	702a           	moveq #42,d0
    490a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    490e:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 14);
    4912:	7000           	moveq #0,d0
    4914:	302f 01c6      	move.w 454(sp),d0
    4918:	4878 000e      	pea e <_start+0xe>
    491c:	2f00           	move.l d0,-(sp)
    491e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4922:	2f2f 0056      	move.l 86(sp),-(sp)
    4926:	4eba 2256      	jsr 6b7e <TestRow>(pc)
    492a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    492e:	722a           	moveq #42,d1
    4930:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 15);
    4934:	7000           	moveq #0,d0
    4936:	302f 01c6      	move.w 454(sp),d0
    493a:	4878 000f      	pea f <_start+0xf>
    493e:	2f00           	move.l d0,-(sp)
    4940:	2f2f 01d0      	move.l 464(sp),-(sp)
    4944:	2f2f 0056      	move.l 86(sp),-(sp)
    4948:	4eba 2234      	jsr 6b7e <TestRow>(pc)
    494c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4950:	702a           	moveq #42,d0
    4952:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4956:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 16);
    495a:	7000           	moveq #0,d0
    495c:	302f 01c6      	move.w 454(sp),d0
    4960:	4878 0010      	pea 10 <_start+0x10>
    4964:	2f00           	move.l d0,-(sp)
    4966:	2f2f 01d0      	move.l 464(sp),-(sp)
    496a:	2f2f 0056      	move.l 86(sp),-(sp)
    496e:	4eba 220e      	jsr 6b7e <TestRow>(pc)
    4972:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4976:	722a           	moveq #42,d1
    4978:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 17);
    497c:	7000           	moveq #0,d0
    497e:	302f 01c6      	move.w 454(sp),d0
    4982:	4878 0011      	pea 11 <_start+0x11>
    4986:	2f00           	move.l d0,-(sp)
    4988:	2f2f 01d0      	move.l 464(sp),-(sp)
    498c:	2f2f 0056      	move.l 86(sp),-(sp)
    4990:	4eba 21ec      	jsr 6b7e <TestRow>(pc)
    4994:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4998:	702a           	moveq #42,d0
    499a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    499e:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 18);
    49a2:	7000           	moveq #0,d0
    49a4:	302f 01c6      	move.w 454(sp),d0
    49a8:	4878 0012      	pea 12 <_start+0x12>
    49ac:	2f00           	move.l d0,-(sp)
    49ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    49b2:	2f2f 0056      	move.l 86(sp),-(sp)
    49b6:	4eba 21c6      	jsr 6b7e <TestRow>(pc)
    49ba:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49be:	722a           	moveq #42,d1
    49c0:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 19);
    49c4:	7000           	moveq #0,d0
    49c6:	302f 01c6      	move.w 454(sp),d0
    49ca:	4878 0013      	pea 13 <_start+0x13>
    49ce:	2f00           	move.l d0,-(sp)
    49d0:	2f2f 01d0      	move.l 464(sp),-(sp)
    49d4:	2f2f 0056      	move.l 86(sp),-(sp)
    49d8:	4eba 21a4      	jsr 6b7e <TestRow>(pc)
    49dc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49e0:	702a           	moveq #42,d0
    49e2:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    49e6:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 20);
    49ea:	7000           	moveq #0,d0
    49ec:	302f 01c6      	move.w 454(sp),d0
    49f0:	4878 0014      	pea 14 <_start+0x14>
    49f4:	2f00           	move.l d0,-(sp)
    49f6:	2f2f 01d0      	move.l 464(sp),-(sp)
    49fa:	2f2f 0056      	move.l 86(sp),-(sp)
    49fe:	4eba 217e      	jsr 6b7e <TestRow>(pc)
    4a02:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a06:	722a           	moveq #42,d1
    4a08:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 21);
    4a0c:	7000           	moveq #0,d0
    4a0e:	302f 01c6      	move.w 454(sp),d0
    4a12:	4878 0015      	pea 15 <_start+0x15>
    4a16:	2f00           	move.l d0,-(sp)
    4a18:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a1c:	2f2f 0056      	move.l 86(sp),-(sp)
    4a20:	4eba 215c      	jsr 6b7e <TestRow>(pc)
    4a24:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a28:	702a           	moveq #42,d0
    4a2a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4a2e:	466f 01c6      	not.w 454(sp)


  for(int i=0;i<10;i++) {
    4a32:	42af 018a      	clr.l 394(sp)
    4a36:	6000 0286      	bra.w 4cbe <TestZoom4Picture+0xfa2>
    for(int i2=0;i2<13;i2++) {  
    4a3a:	42af 0186      	clr.l 390(sp)
    4a3e:	6042           	bra.s 4a82 <TestZoom4Picture+0xd66>
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    4a40:	222f 018a      	move.l 394(sp),d1
    4a44:	2001           	move.l d1,d0
    4a46:	d080           	add.l d0,d0
    4a48:	d081           	add.l d1,d0
    4a4a:	2200           	move.l d0,d1
    4a4c:	e789           	lsl.l #3,d1
    4a4e:	9280           	sub.l d0,d1
    4a50:	2041           	movea.l d1,a0
    4a52:	d1ef 0186      	adda.l 390(sp),a0
    4a56:	41e8 0016      	lea 22(a0),a0
    4a5a:	7000           	moveq #0,d0
    4a5c:	302f 01c6      	move.w 454(sp),d0
    4a60:	2f08           	move.l a0,-(sp)
    4a62:	2f00           	move.l d0,-(sp)
    4a64:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a68:	2f2f 0056      	move.l 86(sp),-(sp)
    4a6c:	4eba 2110      	jsr 6b7e <TestRow>(pc)
    4a70:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4a74:	722a           	moveq #42,d1
    4a76:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4a7a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {  
    4a7e:	52af 0186      	addq.l #1,390(sp)
    4a82:	700c           	moveq #12,d0
    4a84:	b0af 0186      	cmp.l 390(sp),d0
    4a88:	6cb6           	bge.s 4a40 <TestZoom4Picture+0xd24>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    4a8a:	222f 018a      	move.l 394(sp),d1
    4a8e:	2001           	move.l d1,d0
    4a90:	d080           	add.l d0,d0
    4a92:	d081           	add.l d1,d0
    4a94:	2200           	move.l d0,d1
    4a96:	e789           	lsl.l #3,d1
    4a98:	2041           	movea.l d1,a0
    4a9a:	91c0           	suba.l d0,a0
    4a9c:	41e8 0023      	lea 35(a0),a0
    4aa0:	7000           	moveq #0,d0
    4aa2:	302f 01c6      	move.w 454(sp),d0
    4aa6:	2f08           	move.l a0,-(sp)
    4aa8:	2f00           	move.l d0,-(sp)
    4aaa:	2f2f 01d0      	move.l 464(sp),-(sp)
    4aae:	2f2f 0056      	move.l 86(sp),-(sp)
    4ab2:	4eba 20ca      	jsr 6b7e <TestRow>(pc)
    4ab6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4aba:	722a           	moveq #42,d1
    4abc:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    4ac0:	222f 018a      	move.l 394(sp),d1
    4ac4:	2001           	move.l d1,d0
    4ac6:	d080           	add.l d0,d0
    4ac8:	d081           	add.l d1,d0
    4aca:	2200           	move.l d0,d1
    4acc:	e789           	lsl.l #3,d1
    4ace:	2041           	movea.l d1,a0
    4ad0:	91c0           	suba.l d0,a0
    4ad2:	41e8 0024      	lea 36(a0),a0
    4ad6:	7000           	moveq #0,d0
    4ad8:	302f 01c6      	move.w 454(sp),d0
    4adc:	2f08           	move.l a0,-(sp)
    4ade:	2f00           	move.l d0,-(sp)
    4ae0:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ae4:	2f2f 0056      	move.l 86(sp),-(sp)
    4ae8:	4eba 2094      	jsr 6b7e <TestRow>(pc)
    4aec:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4af0:	702a           	moveq #42,d0
    4af2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4af6:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    4afa:	222f 018a      	move.l 394(sp),d1
    4afe:	2001           	move.l d1,d0
    4b00:	d080           	add.l d0,d0
    4b02:	d081           	add.l d1,d0
    4b04:	2200           	move.l d0,d1
    4b06:	e789           	lsl.l #3,d1
    4b08:	2041           	movea.l d1,a0
    4b0a:	91c0           	suba.l d0,a0
    4b0c:	41e8 0025      	lea 37(a0),a0
    4b10:	7000           	moveq #0,d0
    4b12:	302f 01c6      	move.w 454(sp),d0
    4b16:	2f08           	move.l a0,-(sp)
    4b18:	2f00           	move.l d0,-(sp)
    4b1a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b1e:	2f2f 0056      	move.l 86(sp),-(sp)
    4b22:	4eba 205a      	jsr 6b7e <TestRow>(pc)
    4b26:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b2a:	722a           	moveq #42,d1
    4b2c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    4b30:	222f 018a      	move.l 394(sp),d1
    4b34:	2001           	move.l d1,d0
    4b36:	d080           	add.l d0,d0
    4b38:	d081           	add.l d1,d0
    4b3a:	2200           	move.l d0,d1
    4b3c:	e789           	lsl.l #3,d1
    4b3e:	2041           	movea.l d1,a0
    4b40:	91c0           	suba.l d0,a0
    4b42:	41e8 0026      	lea 38(a0),a0
    4b46:	7000           	moveq #0,d0
    4b48:	302f 01c6      	move.w 454(sp),d0
    4b4c:	2f08           	move.l a0,-(sp)
    4b4e:	2f00           	move.l d0,-(sp)
    4b50:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b54:	2f2f 0056      	move.l 86(sp),-(sp)
    4b58:	4eba 2024      	jsr 6b7e <TestRow>(pc)
    4b5c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b60:	702a           	moveq #42,d0
    4b62:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b66:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    4b6a:	222f 018a      	move.l 394(sp),d1
    4b6e:	2001           	move.l d1,d0
    4b70:	d080           	add.l d0,d0
    4b72:	d081           	add.l d1,d0
    4b74:	2200           	move.l d0,d1
    4b76:	e789           	lsl.l #3,d1
    4b78:	2041           	movea.l d1,a0
    4b7a:	91c0           	suba.l d0,a0
    4b7c:	41e8 0027      	lea 39(a0),a0
    4b80:	7000           	moveq #0,d0
    4b82:	302f 01c6      	move.w 454(sp),d0
    4b86:	2f08           	move.l a0,-(sp)
    4b88:	2f00           	move.l d0,-(sp)
    4b8a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b8e:	2f2f 0056      	move.l 86(sp),-(sp)
    4b92:	4eba 1fea      	jsr 6b7e <TestRow>(pc)
    4b96:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b9a:	722a           	moveq #42,d1
    4b9c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    4ba0:	222f 018a      	move.l 394(sp),d1
    4ba4:	2001           	move.l d1,d0
    4ba6:	d080           	add.l d0,d0
    4ba8:	d081           	add.l d1,d0
    4baa:	2200           	move.l d0,d1
    4bac:	e789           	lsl.l #3,d1
    4bae:	2041           	movea.l d1,a0
    4bb0:	91c0           	suba.l d0,a0
    4bb2:	41e8 0028      	lea 40(a0),a0
    4bb6:	7000           	moveq #0,d0
    4bb8:	302f 01c6      	move.w 454(sp),d0
    4bbc:	2f08           	move.l a0,-(sp)
    4bbe:	2f00           	move.l d0,-(sp)
    4bc0:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bc4:	2f2f 0056      	move.l 86(sp),-(sp)
    4bc8:	4eba 1fb4      	jsr 6b7e <TestRow>(pc)
    4bcc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4bd0:	702a           	moveq #42,d0
    4bd2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4bd6:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    4bda:	222f 018a      	move.l 394(sp),d1
    4bde:	2001           	move.l d1,d0
    4be0:	d080           	add.l d0,d0
    4be2:	d081           	add.l d1,d0
    4be4:	2200           	move.l d0,d1
    4be6:	e789           	lsl.l #3,d1
    4be8:	2041           	movea.l d1,a0
    4bea:	91c0           	suba.l d0,a0
    4bec:	41e8 0029      	lea 41(a0),a0
    4bf0:	7000           	moveq #0,d0
    4bf2:	302f 01c6      	move.w 454(sp),d0
    4bf6:	2f08           	move.l a0,-(sp)
    4bf8:	2f00           	move.l d0,-(sp)
    4bfa:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bfe:	2f2f 0056      	move.l 86(sp),-(sp)
    4c02:	4eba 1f7a      	jsr 6b7e <TestRow>(pc)
    4c06:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c0a:	722a           	moveq #42,d1
    4c0c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    4c10:	222f 018a      	move.l 394(sp),d1
    4c14:	2001           	move.l d1,d0
    4c16:	d080           	add.l d0,d0
    4c18:	d081           	add.l d1,d0
    4c1a:	2200           	move.l d0,d1
    4c1c:	e789           	lsl.l #3,d1
    4c1e:	2041           	movea.l d1,a0
    4c20:	91c0           	suba.l d0,a0
    4c22:	41e8 002a      	lea 42(a0),a0
    4c26:	7000           	moveq #0,d0
    4c28:	302f 01c6      	move.w 454(sp),d0
    4c2c:	2f08           	move.l a0,-(sp)
    4c2e:	2f00           	move.l d0,-(sp)
    4c30:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c34:	2f2f 0056      	move.l 86(sp),-(sp)
    4c38:	4eba 1f44      	jsr 6b7e <TestRow>(pc)
    4c3c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c40:	702a           	moveq #42,d0
    4c42:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c46:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    4c4a:	222f 018a      	move.l 394(sp),d1
    4c4e:	2001           	move.l d1,d0
    4c50:	d080           	add.l d0,d0
    4c52:	d081           	add.l d1,d0
    4c54:	2200           	move.l d0,d1
    4c56:	e789           	lsl.l #3,d1
    4c58:	2041           	movea.l d1,a0
    4c5a:	91c0           	suba.l d0,a0
    4c5c:	41e8 002b      	lea 43(a0),a0
    4c60:	7000           	moveq #0,d0
    4c62:	302f 01c6      	move.w 454(sp),d0
    4c66:	2f08           	move.l a0,-(sp)
    4c68:	2f00           	move.l d0,-(sp)
    4c6a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c6e:	2f2f 0056      	move.l 86(sp),-(sp)
    4c72:	4eba 1f0a      	jsr 6b7e <TestRow>(pc)
    4c76:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c7a:	722a           	moveq #42,d1
    4c7c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    4c80:	222f 018a      	move.l 394(sp),d1
    4c84:	2001           	move.l d1,d0
    4c86:	d080           	add.l d0,d0
    4c88:	d081           	add.l d1,d0
    4c8a:	2200           	move.l d0,d1
    4c8c:	e789           	lsl.l #3,d1
    4c8e:	2041           	movea.l d1,a0
    4c90:	91c0           	suba.l d0,a0
    4c92:	41e8 002c      	lea 44(a0),a0
    4c96:	7000           	moveq #0,d0
    4c98:	302f 01c6      	move.w 454(sp),d0
    4c9c:	2f08           	move.l a0,-(sp)
    4c9e:	2f00           	move.l d0,-(sp)
    4ca0:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ca4:	2f2f 0056      	move.l 86(sp),-(sp)
    4ca8:	4eba 1ed4      	jsr 6b7e <TestRow>(pc)
    4cac:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4cb0:	702a           	moveq #42,d0
    4cb2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4cb6:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<10;i++) {
    4cba:	52af 018a      	addq.l #1,394(sp)
    4cbe:	7209           	moveq #9,d1
    4cc0:	b2af 018a      	cmp.l 394(sp),d1
    4cc4:	6c00 fd74      	bge.w 4a3a <TestZoom4Picture+0xd1e>
  }

  for(int i2=0;i2<13;i2++) {  
    4cc8:	42af 0182      	clr.l 386(sp)
    4ccc:	6032           	bra.s 4d00 <TestZoom4Picture+0xfe4>
    TestRow( valsupposed, valactual, mask, i2+253);
    4cce:	222f 0182      	move.l 386(sp),d1
    4cd2:	0681 0000 00fd 	addi.l #253,d1
    4cd8:	7000           	moveq #0,d0
    4cda:	302f 01c6      	move.w 454(sp),d0
    4cde:	2f01           	move.l d1,-(sp)
    4ce0:	2f00           	move.l d0,-(sp)
    4ce2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ce6:	2f2f 0056      	move.l 86(sp),-(sp)
    4cea:	4eba 1e92      	jsr 6b7e <TestRow>(pc)
    4cee:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4cf2:	702a           	moveq #42,d0
    4cf4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4cf8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4cfc:	52af 0182      	addq.l #1,386(sp)
    4d00:	720c           	moveq #12,d1
    4d02:	b2af 0182      	cmp.l 386(sp),d1
    4d06:	6cc6           	bge.s 4cce <TestZoom4Picture+0xfb2>
  }

  TestRow( valsupposed, valactual, mask, 266);
    4d08:	7000           	moveq #0,d0
    4d0a:	302f 01c6      	move.w 454(sp),d0
    4d0e:	4878 010a      	pea 10a <FreeDisplay+0x2a>
    4d12:	2f00           	move.l d0,-(sp)
    4d14:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d18:	2f2f 0056      	move.l 86(sp),-(sp)
    4d1c:	4eba 1e60      	jsr 6b7e <TestRow>(pc)
    4d20:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d24:	702a           	moveq #42,d0
    4d26:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 267);
    4d2a:	7000           	moveq #0,d0
    4d2c:	302f 01c6      	move.w 454(sp),d0
    4d30:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    4d34:	2f00           	move.l d0,-(sp)
    4d36:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d3a:	2f2f 0056      	move.l 86(sp),-(sp)
    4d3e:	4eba 1e3e      	jsr 6b7e <TestRow>(pc)
    4d42:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d46:	722a           	moveq #42,d1
    4d48:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4d4c:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 268);
    4d50:	7000           	moveq #0,d0
    4d52:	302f 01c6      	move.w 454(sp),d0
    4d56:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    4d5a:	2f00           	move.l d0,-(sp)
    4d5c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d60:	2f2f 0056      	move.l 86(sp),-(sp)
    4d64:	4eba 1e18      	jsr 6b7e <TestRow>(pc)
    4d68:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d6c:	702a           	moveq #42,d0
    4d6e:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 269);
    4d72:	7000           	moveq #0,d0
    4d74:	302f 01c6      	move.w 454(sp),d0
    4d78:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4d7c:	2f00           	move.l d0,-(sp)
    4d7e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d82:	2f2f 0056      	move.l 86(sp),-(sp)
    4d86:	4eba 1df6      	jsr 6b7e <TestRow>(pc)
    4d8a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d8e:	722a           	moveq #42,d1
    4d90:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4d94:	466f 01c6      	not.w 454(sp)

  tmp = source;
    4d98:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4d9e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4da4:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    4daa:	4878 0001      	pea 1 <_start+0x1>
    4dae:	4878 0005      	pea 5 <_start+0x5>
    4db2:	2f2f 0056      	move.l 86(sp),-(sp)
    4db6:	2f2f 006a      	move.l 106(sp),-(sp)
    4dba:	4eba cd10      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    4dbe:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4dc2:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    4dc8:	2c40           	movea.l d0,a6
    4dca:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4dce:	202f 004e      	move.l 78(sp),d0
    4dd2:	5880           	addq.l #4,d0
    4dd4:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom6;
    4dd8:	2f7c 0000 bbe0 	move.l #48096,74(sp)
    4dde:	004a 
  mask = 0x0000;
    4de0:	426f 01c6      	clr.w 454(sp)
 
  for(int i2=0;i2<7;i2++) {  
    4de4:	42af 017e      	clr.l 382(sp)
    4de8:	602a           	bra.s 4e14 <TestZoom4Picture+0x10f8>
    TestRow( valsupposed, valactual, mask, i2);
    4dea:	7000           	moveq #0,d0
    4dec:	302f 01c6      	move.w 454(sp),d0
    4df0:	2f2f 017e      	move.l 382(sp),-(sp)
    4df4:	2f00           	move.l d0,-(sp)
    4df6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4dfa:	2f2f 0056      	move.l 86(sp),-(sp)
    4dfe:	4eba 1d7e      	jsr 6b7e <TestRow>(pc)
    4e02:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e06:	722a           	moveq #42,d1
    4e08:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4e0c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    4e10:	52af 017e      	addq.l #1,382(sp)
    4e14:	7006           	moveq #6,d0
    4e16:	b0af 017e      	cmp.l 382(sp),d0
    4e1a:	6cce           	bge.s 4dea <TestZoom4Picture+0x10ce>
  }

  for(int i=0;i<6;i++) {
    4e1c:	42af 017a      	clr.l 378(sp)
    4e20:	605c           	bra.s 4e7e <TestZoom4Picture+0x1162>
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    4e22:	202f 017a      	move.l 378(sp),d0
    4e26:	d080           	add.l d0,d0
    4e28:	2200           	move.l d0,d1
    4e2a:	5e81           	addq.l #7,d1
    4e2c:	7000           	moveq #0,d0
    4e2e:	302f 01c6      	move.w 454(sp),d0
    4e32:	2f01           	move.l d1,-(sp)
    4e34:	2f00           	move.l d0,-(sp)
    4e36:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e3a:	2f2f 0056      	move.l 86(sp),-(sp)
    4e3e:	4eba 1d3e      	jsr 6b7e <TestRow>(pc)
    4e42:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e46:	722a           	moveq #42,d1
    4e48:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    4e4c:	202f 017a      	move.l 378(sp),d0
    4e50:	5880           	addq.l #4,d0
    4e52:	d080           	add.l d0,d0
    4e54:	2200           	move.l d0,d1
    4e56:	7000           	moveq #0,d0
    4e58:	302f 01c6      	move.w 454(sp),d0
    4e5c:	2f01           	move.l d1,-(sp)
    4e5e:	2f00           	move.l d0,-(sp)
    4e60:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e64:	2f2f 0056      	move.l 86(sp),-(sp)
    4e68:	4eba 1d14      	jsr 6b7e <TestRow>(pc)
    4e6c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e70:	702a           	moveq #42,d0
    4e72:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4e76:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<6;i++) {
    4e7a:	52af 017a      	addq.l #1,378(sp)
    4e7e:	7205           	moveq #5,d1
    4e80:	b2af 017a      	cmp.l 378(sp),d1
    4e84:	6c9c           	bge.s 4e22 <TestZoom4Picture+0x1106>
  }

  for(int i=0;i<10;i++) {
    4e86:	42af 0176      	clr.l 374(sp)
    4e8a:	6000 00ce      	bra.w 4f5a <TestZoom4Picture+0x123e>
    for(int i2=0;i2<12;i2++) {  
    4e8e:	42af 0172      	clr.l 370(sp)
    4e92:	6040           	bra.s 4ed4 <TestZoom4Picture+0x11b8>
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    4e94:	307c 0013      	movea.w #19,a0
    4e98:	d1ef 0172      	adda.l 370(sp),a0
    4e9c:	222f 0176      	move.l 374(sp),d1
    4ea0:	2001           	move.l d1,d0
    4ea2:	d080           	add.l d0,d0
    4ea4:	d081           	add.l d1,d0
    4ea6:	e788           	lsl.l #3,d0
    4ea8:	2208           	move.l a0,d1
    4eaa:	d280           	add.l d0,d1
    4eac:	7000           	moveq #0,d0
    4eae:	302f 01c6      	move.w 454(sp),d0
    4eb2:	2f01           	move.l d1,-(sp)
    4eb4:	2f00           	move.l d0,-(sp)
    4eb6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4eba:	2f2f 0056      	move.l 86(sp),-(sp)
    4ebe:	4eba 1cbe      	jsr 6b7e <TestRow>(pc)
    4ec2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4ec6:	702a           	moveq #42,d0
    4ec8:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4ecc:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {  
    4ed0:	52af 0172      	addq.l #1,370(sp)
    4ed4:	720b           	moveq #11,d1
    4ed6:	b2af 0172      	cmp.l 370(sp),d1
    4eda:	6cb8           	bge.s 4e94 <TestZoom4Picture+0x1178>
    }
    for(int i=0;i<6;i++) {
    4edc:	42af 016e      	clr.l 366(sp)
    4ee0:	606c           	bra.s 4f4e <TestZoom4Picture+0x1232>
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    4ee2:	222f 016e      	move.l 366(sp),d1
    4ee6:	2001           	move.l d1,d0
    4ee8:	d080           	add.l d0,d0
    4eea:	d081           	add.l d1,d0
    4eec:	e788           	lsl.l #3,d0
    4eee:	2040           	movea.l d0,a0
    4ef0:	41e8 001f      	lea 31(a0),a0
    4ef4:	7000           	moveq #0,d0
    4ef6:	302f 01c6      	move.w 454(sp),d0
    4efa:	2f08           	move.l a0,-(sp)
    4efc:	2f00           	move.l d0,-(sp)
    4efe:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f02:	2f2f 0056      	move.l 86(sp),-(sp)
    4f06:	4eba 1c76      	jsr 6b7e <TestRow>(pc)
    4f0a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4f0e:	702a           	moveq #42,d0
    4f10:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    4f14:	222f 016e      	move.l 366(sp),d1
    4f18:	2001           	move.l d1,d0
    4f1a:	d080           	add.l d0,d0
    4f1c:	d081           	add.l d1,d0
    4f1e:	e788           	lsl.l #3,d0
    4f20:	2040           	movea.l d0,a0
    4f22:	41e8 0020      	lea 32(a0),a0
    4f26:	7000           	moveq #0,d0
    4f28:	302f 01c6      	move.w 454(sp),d0
    4f2c:	2f08           	move.l a0,-(sp)
    4f2e:	2f00           	move.l d0,-(sp)
    4f30:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f34:	2f2f 0056      	move.l 86(sp),-(sp)
    4f38:	4eba 1c44      	jsr 6b7e <TestRow>(pc)
    4f3c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4f40:	722a           	moveq #42,d1
    4f42:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4f46:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<6;i++) {
    4f4a:	52af 016e      	addq.l #1,366(sp)
    4f4e:	7005           	moveq #5,d0
    4f50:	b0af 016e      	cmp.l 366(sp),d0
    4f54:	6c8c           	bge.s 4ee2 <TestZoom4Picture+0x11c6>
  for(int i=0;i<10;i++) {
    4f56:	52af 0176      	addq.l #1,374(sp)
    4f5a:	7209           	moveq #9,d1
    4f5c:	b2af 0176      	cmp.l 374(sp),d1
    4f60:	6c00 ff2c      	bge.w 4e8e <TestZoom4Picture+0x1172>
    }
  }

  for(int i2=0;i2<11;i2++) {  
    4f64:	42af 016a      	clr.l 362(sp)
    4f68:	6032           	bra.s 4f9c <TestZoom4Picture+0x1280>
    TestRow( valsupposed, valactual, mask, 258+i2);
    4f6a:	222f 016a      	move.l 362(sp),d1
    4f6e:	0681 0000 0102 	addi.l #258,d1
    4f74:	7000           	moveq #0,d0
    4f76:	302f 01c6      	move.w 454(sp),d0
    4f7a:	2f01           	move.l d1,-(sp)
    4f7c:	2f00           	move.l d0,-(sp)
    4f7e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f82:	2f2f 0056      	move.l 86(sp),-(sp)
    4f86:	4eba 1bf6      	jsr 6b7e <TestRow>(pc)
    4f8a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4f8e:	702a           	moveq #42,d0
    4f90:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4f94:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {  
    4f98:	52af 016a      	addq.l #1,362(sp)
    4f9c:	720a           	moveq #10,d1
    4f9e:	b2af 016a      	cmp.l 362(sp),d1
    4fa2:	6cc6           	bge.s 4f6a <TestZoom4Picture+0x124e>
  }

  tmp = source;
    4fa4:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4faa:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4fb0:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    4fb6:	4878 0001      	pea 1 <_start+0x1>
    4fba:	4878 0006      	pea 6 <_start+0x6>
    4fbe:	2f2f 0056      	move.l 86(sp),-(sp)
    4fc2:	2f2f 006a      	move.l 106(sp),-(sp)
    4fc6:	4eba cb04      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    4fca:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4fce:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    4fd4:	2c40           	movea.l d0,a6
    4fd6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4fda:	202f 004e      	move.l 78(sp),d0
    4fde:	5880           	addq.l #4,d0
    4fe0:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom7;
    4fe4:	2f7c 0000 bc0c 	move.l #48140,74(sp)
    4fea:	004a 
  mask = 0x0000;
    4fec:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    4ff0:	7000           	moveq #0,d0
    4ff2:	302f 01c6      	move.w 454(sp),d0
    4ff6:	42a7           	clr.l -(sp)
    4ff8:	2f00           	move.l d0,-(sp)
    4ffa:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ffe:	2f2f 0056      	move.l 86(sp),-(sp)
    5002:	4eba 1b7a      	jsr 6b7e <TestRow>(pc)
    5006:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    500a:	722a           	moveq #42,d1
    500c:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5010:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    5014:	42af 0166      	clr.l 358(sp)
    5018:	605c           	bra.s 5076 <TestZoom4Picture+0x135a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    501a:	202f 0166      	move.l 358(sp),d0
    501e:	d080           	add.l d0,d0
    5020:	2200           	move.l d0,d1
    5022:	5281           	addq.l #1,d1
    5024:	7000           	moveq #0,d0
    5026:	302f 01c6      	move.w 454(sp),d0
    502a:	2f01           	move.l d1,-(sp)
    502c:	2f00           	move.l d0,-(sp)
    502e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5032:	2f2f 0056      	move.l 86(sp),-(sp)
    5036:	4eba 1b46      	jsr 6b7e <TestRow>(pc)
    503a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    503e:	702a           	moveq #42,d0
    5040:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    5044:	202f 0166      	move.l 358(sp),d0
    5048:	5280           	addq.l #1,d0
    504a:	d080           	add.l d0,d0
    504c:	2200           	move.l d0,d1
    504e:	7000           	moveq #0,d0
    5050:	302f 01c6      	move.w 454(sp),d0
    5054:	2f01           	move.l d1,-(sp)
    5056:	2f00           	move.l d0,-(sp)
    5058:	2f2f 01d0      	move.l 464(sp),-(sp)
    505c:	2f2f 0056      	move.l 86(sp),-(sp)
    5060:	4eba 1b1c      	jsr 6b7e <TestRow>(pc)
    5064:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5068:	722a           	moveq #42,d1
    506a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    506e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    5072:	52af 0166      	addq.l #1,358(sp)
    5076:	7006           	moveq #6,d0
    5078:	b0af 0166      	cmp.l 358(sp),d0
    507c:	6c9c           	bge.s 501a <TestZoom4Picture+0x12fe>
  }

  for(int i=0;i<10;i++) {
    507e:	42af 0162      	clr.l 354(sp)
    5082:	6000 00d4      	bra.w 5158 <TestZoom4Picture+0x143c>
    for(int i2=0;i2<11;i2++) {  
    5086:	42af 015e      	clr.l 350(sp)
    508a:	6042           	bra.s 50ce <TestZoom4Picture+0x13b2>
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    508c:	307c 000f      	movea.w #15,a0
    5090:	d1ef 015e      	adda.l 350(sp),a0
    5094:	222f 0162      	move.l 354(sp),d1
    5098:	2001           	move.l d1,d0
    509a:	d080           	add.l d0,d0
    509c:	d081           	add.l d1,d0
    509e:	e788           	lsl.l #3,d0
    50a0:	d081           	add.l d1,d0
    50a2:	2208           	move.l a0,d1
    50a4:	d280           	add.l d0,d1
    50a6:	7000           	moveq #0,d0
    50a8:	302f 01c6      	move.w 454(sp),d0
    50ac:	2f01           	move.l d1,-(sp)
    50ae:	2f00           	move.l d0,-(sp)
    50b0:	2f2f 01d0      	move.l 464(sp),-(sp)
    50b4:	2f2f 0056      	move.l 86(sp),-(sp)
    50b8:	4eba 1ac4      	jsr 6b7e <TestRow>(pc)
    50bc:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    50c0:	722a           	moveq #42,d1
    50c2:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    50c6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {  
    50ca:	52af 015e      	addq.l #1,350(sp)
    50ce:	700a           	moveq #10,d0
    50d0:	b0af 015e      	cmp.l 350(sp),d0
    50d4:	6cb6           	bge.s 508c <TestZoom4Picture+0x1370>
    }
    for(int i=0;i<7;i++) {
    50d6:	42af 015a      	clr.l 346(sp)
    50da:	6070           	bra.s 514c <TestZoom4Picture+0x1430>
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    50dc:	222f 015a      	move.l 346(sp),d1
    50e0:	2001           	move.l d1,d0
    50e2:	d080           	add.l d0,d0
    50e4:	d081           	add.l d1,d0
    50e6:	e788           	lsl.l #3,d0
    50e8:	2040           	movea.l d0,a0
    50ea:	d1c1           	adda.l d1,a0
    50ec:	41e8 001a      	lea 26(a0),a0
    50f0:	7000           	moveq #0,d0
    50f2:	302f 01c6      	move.w 454(sp),d0
    50f6:	2f08           	move.l a0,-(sp)
    50f8:	2f00           	move.l d0,-(sp)
    50fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    50fe:	2f2f 0056      	move.l 86(sp),-(sp)
    5102:	4eba 1a7a      	jsr 6b7e <TestRow>(pc)
    5106:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    510a:	722a           	moveq #42,d1
    510c:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    5110:	222f 015a      	move.l 346(sp),d1
    5114:	2001           	move.l d1,d0
    5116:	d080           	add.l d0,d0
    5118:	d081           	add.l d1,d0
    511a:	e788           	lsl.l #3,d0
    511c:	2040           	movea.l d0,a0
    511e:	d1c1           	adda.l d1,a0
    5120:	41e8 001a      	lea 26(a0),a0
    5124:	7000           	moveq #0,d0
    5126:	302f 01c6      	move.w 454(sp),d0
    512a:	2f08           	move.l a0,-(sp)
    512c:	2f00           	move.l d0,-(sp)
    512e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5132:	2f2f 0056      	move.l 86(sp),-(sp)
    5136:	4eba 1a46      	jsr 6b7e <TestRow>(pc)
    513a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    513e:	702a           	moveq #42,d0
    5140:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5144:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<7;i++) {
    5148:	52af 015a      	addq.l #1,346(sp)
    514c:	7206           	moveq #6,d1
    514e:	b2af 015a      	cmp.l 346(sp),d1
    5152:	6c88           	bge.s 50dc <TestZoom4Picture+0x13c0>
  for(int i=0;i<10;i++) {
    5154:	52af 0162      	addq.l #1,354(sp)
    5158:	7009           	moveq #9,d0
    515a:	b0af 0162      	cmp.l 354(sp),d0
    515e:	6c00 ff26      	bge.w 5086 <TestZoom4Picture+0x136a>
    }
  }

  for(int i2=0;i2<5;i2++) {  
    5162:	42af 0156      	clr.l 342(sp)
    5166:	6032           	bra.s 519a <TestZoom4Picture+0x147e>
    TestRow( valsupposed, valactual, mask, 256+i2);
    5168:	222f 0156      	move.l 342(sp),d1
    516c:	0681 0000 0100 	addi.l #256,d1
    5172:	7000           	moveq #0,d0
    5174:	302f 01c6      	move.w 454(sp),d0
    5178:	2f01           	move.l d1,-(sp)
    517a:	2f00           	move.l d0,-(sp)
    517c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5180:	2f2f 0056      	move.l 86(sp),-(sp)
    5184:	4eba 19f8      	jsr 6b7e <TestRow>(pc)
    5188:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    518c:	722a           	moveq #42,d1
    518e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5192:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5196:	52af 0156      	addq.l #1,342(sp)
    519a:	7004           	moveq #4,d0
    519c:	b0af 0156      	cmp.l 342(sp),d0
    51a0:	6cc6           	bge.s 5168 <TestZoom4Picture+0x144c>
  }

  tmp = source;
    51a2:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    51a8:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    51ae:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    51b4:	4878 0001      	pea 1 <_start+0x1>
    51b8:	4878 0007      	pea 7 <_start+0x7>
    51bc:	2f2f 0056      	move.l 86(sp),-(sp)
    51c0:	2f2f 006a      	move.l 106(sp),-(sp)
    51c4:	4eba c906      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    51c8:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    51cc:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    51d2:	2c40           	movea.l d0,a6
    51d4:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    51d8:	222f 004e      	move.l 78(sp),d1
    51dc:	5881           	addq.l #4,d1
    51de:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom8;
    51e2:	2f7c 0000 bc38 	move.l #48184,74(sp)
    51e8:	004a 
  mask = 0xffff;
    51ea:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    51f0:	7000           	moveq #0,d0
    51f2:	302f 01c6      	move.w 454(sp),d0
    51f6:	42a7           	clr.l -(sp)
    51f8:	2f00           	move.l d0,-(sp)
    51fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    51fe:	2f2f 0056      	move.l 86(sp),-(sp)
    5202:	4eba 197a      	jsr 6b7e <TestRow>(pc)
    5206:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    520a:	702a           	moveq #42,d0
    520c:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5210:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5214:	42af 0152      	clr.l 338(sp)
    5218:	605c           	bra.s 5276 <TestZoom4Picture+0x155a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    521a:	202f 0152      	move.l 338(sp),d0
    521e:	d080           	add.l d0,d0
    5220:	2200           	move.l d0,d1
    5222:	5281           	addq.l #1,d1
    5224:	7000           	moveq #0,d0
    5226:	302f 01c6      	move.w 454(sp),d0
    522a:	2f01           	move.l d1,-(sp)
    522c:	2f00           	move.l d0,-(sp)
    522e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5232:	2f2f 0056      	move.l 86(sp),-(sp)
    5236:	4eba 1946      	jsr 6b7e <TestRow>(pc)
    523a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    523e:	722a           	moveq #42,d1
    5240:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    5244:	202f 0152      	move.l 338(sp),d0
    5248:	5280           	addq.l #1,d0
    524a:	d080           	add.l d0,d0
    524c:	2200           	move.l d0,d1
    524e:	7000           	moveq #0,d0
    5250:	302f 01c6      	move.w 454(sp),d0
    5254:	2f01           	move.l d1,-(sp)
    5256:	2f00           	move.l d0,-(sp)
    5258:	2f2f 01d0      	move.l 464(sp),-(sp)
    525c:	2f2f 0056      	move.l 86(sp),-(sp)
    5260:	4eba 191c      	jsr 6b7e <TestRow>(pc)
    5264:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5268:	702a           	moveq #42,d0
    526a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    526e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5272:	52af 0152      	addq.l #1,338(sp)
    5276:	7204           	moveq #4,d1
    5278:	b2af 0152      	cmp.l 338(sp),d1
    527c:	6c9c           	bge.s 521a <TestZoom4Picture+0x14fe>
  }

  for(int i=0;i<9;i++) {
    527e:	42af 014e      	clr.l 334(sp)
    5282:	6000 00f0      	bra.w 5374 <TestZoom4Picture+0x1658>
    for(int i2=0;i2<10;i2++) {  
    5286:	42af 014a      	clr.l 330(sp)
    528a:	6046           	bra.s 52d2 <TestZoom4Picture+0x15b6>
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    528c:	307c 000b      	movea.w #11,a0
    5290:	d1ef 014a      	adda.l 330(sp),a0
    5294:	222f 014e      	move.l 334(sp),d1
    5298:	2001           	move.l d1,d0
    529a:	d080           	add.l d0,d0
    529c:	d081           	add.l d1,d0
    529e:	d080           	add.l d0,d0
    52a0:	d080           	add.l d0,d0
    52a2:	d081           	add.l d1,d0
    52a4:	d080           	add.l d0,d0
    52a6:	2208           	move.l a0,d1
    52a8:	d280           	add.l d0,d1
    52aa:	7000           	moveq #0,d0
    52ac:	302f 01c6      	move.w 454(sp),d0
    52b0:	2f01           	move.l d1,-(sp)
    52b2:	2f00           	move.l d0,-(sp)
    52b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    52b8:	2f2f 0056      	move.l 86(sp),-(sp)
    52bc:	4eba 18c0      	jsr 6b7e <TestRow>(pc)
    52c0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    52c4:	702a           	moveq #42,d0
    52c6:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    52ca:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {  
    52ce:	52af 014a      	addq.l #1,330(sp)
    52d2:	7209           	moveq #9,d1
    52d4:	b2af 014a      	cmp.l 330(sp),d1
    52d8:	6cb2           	bge.s 528c <TestZoom4Picture+0x1570>
    }
    for(int i2=0;i2<8;i2++) {
    52da:	42af 0146      	clr.l 326(sp)
    52de:	6000 0086      	bra.w 5366 <TestZoom4Picture+0x164a>
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    52e2:	222f 014e      	move.l 334(sp),d1
    52e6:	2001           	move.l d1,d0
    52e8:	d080           	add.l d0,d0
    52ea:	d081           	add.l d1,d0
    52ec:	d080           	add.l d0,d0
    52ee:	d080           	add.l d0,d0
    52f0:	d081           	add.l d1,d0
    52f2:	d080           	add.l d0,d0
    52f4:	2040           	movea.l d0,a0
    52f6:	41e8 0015      	lea 21(a0),a0
    52fa:	2208           	move.l a0,d1
    52fc:	d2af 0146      	add.l 326(sp),d1
    5300:	7000           	moveq #0,d0
    5302:	302f 01c6      	move.w 454(sp),d0
    5306:	2f01           	move.l d1,-(sp)
    5308:	2f00           	move.l d0,-(sp)
    530a:	2f2f 01d0      	move.l 464(sp),-(sp)
    530e:	2f2f 0056      	move.l 86(sp),-(sp)
    5312:	4eba 186a      	jsr 6b7e <TestRow>(pc)
    5316:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    531a:	702a           	moveq #42,d0
    531c:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    5320:	222f 014e      	move.l 334(sp),d1
    5324:	2001           	move.l d1,d0
    5326:	d080           	add.l d0,d0
    5328:	d081           	add.l d1,d0
    532a:	d080           	add.l d0,d0
    532c:	d080           	add.l d0,d0
    532e:	d081           	add.l d1,d0
    5330:	d080           	add.l d0,d0
    5332:	2040           	movea.l d0,a0
    5334:	41e8 0015      	lea 21(a0),a0
    5338:	2208           	move.l a0,d1
    533a:	d2af 0146      	add.l 326(sp),d1
    533e:	7000           	moveq #0,d0
    5340:	302f 01c6      	move.w 454(sp),d0
    5344:	2f01           	move.l d1,-(sp)
    5346:	2f00           	move.l d0,-(sp)
    5348:	2f2f 01d0      	move.l 464(sp),-(sp)
    534c:	2f2f 0056      	move.l 86(sp),-(sp)
    5350:	4eba 182c      	jsr 6b7e <TestRow>(pc)
    5354:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5358:	722a           	moveq #42,d1
    535a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    535e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {
    5362:	52af 0146      	addq.l #1,326(sp)
    5366:	7007           	moveq #7,d0
    5368:	b0af 0146      	cmp.l 326(sp),d0
    536c:	6c00 ff74      	bge.w 52e2 <TestZoom4Picture+0x15c6>
  for(int i=0;i<9;i++) {
    5370:	52af 014e      	addq.l #1,334(sp)
    5374:	7208           	moveq #8,d1
    5376:	b2af 014e      	cmp.l 334(sp),d1
    537a:	6c00 ff0a      	bge.w 5286 <TestZoom4Picture+0x156a>
    }
  }

  for(int i2=0;i2<10;i2++) {  
    537e:	42af 0142      	clr.l 322(sp)
    5382:	6032           	bra.s 53b6 <TestZoom4Picture+0x169a>
    TestRow( valsupposed, valactual, mask, 245+i2);
    5384:	222f 0142      	move.l 322(sp),d1
    5388:	0681 0000 00f5 	addi.l #245,d1
    538e:	7000           	moveq #0,d0
    5390:	302f 01c6      	move.w 454(sp),d0
    5394:	2f01           	move.l d1,-(sp)
    5396:	2f00           	move.l d0,-(sp)
    5398:	2f2f 01d0      	move.l 464(sp),-(sp)
    539c:	2f2f 0056      	move.l 86(sp),-(sp)
    53a0:	4eba 17dc      	jsr 6b7e <TestRow>(pc)
    53a4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    53a8:	702a           	moveq #42,d0
    53aa:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    53ae:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {  
    53b2:	52af 0142      	addq.l #1,322(sp)
    53b6:	7209           	moveq #9,d1
    53b8:	b2af 0142      	cmp.l 322(sp),d1
    53bc:	6cc6           	bge.s 5384 <TestZoom4Picture+0x1668>
  }
  for(int i=0;i<7;i++) {
    53be:	42af 013e      	clr.l 318(sp)
    53c2:	6064           	bra.s 5428 <TestZoom4Picture+0x170c>
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    53c4:	202f 013e      	move.l 318(sp),d0
    53c8:	d080           	add.l d0,d0
    53ca:	2200           	move.l d0,d1
    53cc:	0681 0000 00ff 	addi.l #255,d1
    53d2:	7000           	moveq #0,d0
    53d4:	302f 01c6      	move.w 454(sp),d0
    53d8:	2f01           	move.l d1,-(sp)
    53da:	2f00           	move.l d0,-(sp)
    53dc:	2f2f 01d0      	move.l 464(sp),-(sp)
    53e0:	2f2f 0056      	move.l 86(sp),-(sp)
    53e4:	4eba 1798      	jsr 6b7e <TestRow>(pc)
    53e8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    53ec:	702a           	moveq #42,d0
    53ee:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    53f2:	202f 013e      	move.l 318(sp),d0
    53f6:	0680 0000 0080 	addi.l #128,d0
    53fc:	d080           	add.l d0,d0
    53fe:	2200           	move.l d0,d1
    5400:	7000           	moveq #0,d0
    5402:	302f 01c6      	move.w 454(sp),d0
    5406:	2f01           	move.l d1,-(sp)
    5408:	2f00           	move.l d0,-(sp)
    540a:	2f2f 01d0      	move.l 464(sp),-(sp)
    540e:	2f2f 0056      	move.l 86(sp),-(sp)
    5412:	4eba 176a      	jsr 6b7e <TestRow>(pc)
    5416:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    541a:	722a           	moveq #42,d1
    541c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5420:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    5424:	52af 013e      	addq.l #1,318(sp)
    5428:	7006           	moveq #6,d0
    542a:	b0af 013e      	cmp.l 318(sp),d0
    542e:	6c94           	bge.s 53c4 <TestZoom4Picture+0x16a8>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5430:	7000           	moveq #0,d0
    5432:	302f 01c6      	move.w 454(sp),d0
    5436:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    543a:	2f00           	move.l d0,-(sp)
    543c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5440:	2f2f 0056      	move.l 86(sp),-(sp)
    5444:	4eba 1738      	jsr 6b7e <TestRow>(pc)
    5448:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    544c:	722a           	moveq #42,d1
    544e:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5452:	466f 01c6      	not.w 454(sp)
 
  tmp = source;
    5456:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    545c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5462:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    5468:	4878 0001      	pea 1 <_start+0x1>
    546c:	4878 0008      	pea 8 <_start+0x8>
    5470:	2f2f 0056      	move.l 86(sp),-(sp)
    5474:	2f2f 006a      	move.l 106(sp),-(sp)
    5478:	4eba c652      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    547c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5480:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    5486:	2c40           	movea.l d0,a6
    5488:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    548c:	202f 004e      	move.l 78(sp),d0
    5490:	5880           	addq.l #4,d0
    5492:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom9;
    5496:	2f7c 0000 bc64 	move.l #48228,74(sp)
    549c:	004a 
  mask = 0x0000;
    549e:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    54a2:	7000           	moveq #0,d0
    54a4:	302f 01c6      	move.w 454(sp),d0
    54a8:	42a7           	clr.l -(sp)
    54aa:	2f00           	move.l d0,-(sp)
    54ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    54b0:	2f2f 0056      	move.l 86(sp),-(sp)
    54b4:	4eba 16c8      	jsr 6b7e <TestRow>(pc)
    54b8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    54bc:	722a           	moveq #42,d1
    54be:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    54c2:	466f 01c6      	not.w 454(sp)
  
  for(int i=0;i<3;i++) {
    54c6:	42af 013a      	clr.l 314(sp)
    54ca:	605c           	bra.s 5528 <TestZoom4Picture+0x180c>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    54cc:	202f 013a      	move.l 314(sp),d0
    54d0:	d080           	add.l d0,d0
    54d2:	2200           	move.l d0,d1
    54d4:	5281           	addq.l #1,d1
    54d6:	7000           	moveq #0,d0
    54d8:	302f 01c6      	move.w 454(sp),d0
    54dc:	2f01           	move.l d1,-(sp)
    54de:	2f00           	move.l d0,-(sp)
    54e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    54e4:	2f2f 0056      	move.l 86(sp),-(sp)
    54e8:	4eba 1694      	jsr 6b7e <TestRow>(pc)
    54ec:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    54f0:	702a           	moveq #42,d0
    54f2:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    54f6:	202f 013a      	move.l 314(sp),d0
    54fa:	5280           	addq.l #1,d0
    54fc:	d080           	add.l d0,d0
    54fe:	2200           	move.l d0,d1
    5500:	7000           	moveq #0,d0
    5502:	302f 01c6      	move.w 454(sp),d0
    5506:	2f01           	move.l d1,-(sp)
    5508:	2f00           	move.l d0,-(sp)
    550a:	2f2f 01d0      	move.l 464(sp),-(sp)
    550e:	2f2f 0056      	move.l 86(sp),-(sp)
    5512:	4eba 166a      	jsr 6b7e <TestRow>(pc)
    5516:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    551a:	722a           	moveq #42,d1
    551c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5520:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    5524:	52af 013a      	addq.l #1,314(sp)
    5528:	7002           	moveq #2,d0
    552a:	b0af 013a      	cmp.l 314(sp),d0
    552e:	6c9c           	bge.s 54cc <TestZoom4Picture+0x17b0>
  }

  for(int i=0;i<9;i++) {
    5530:	42af 0136      	clr.l 310(sp)
    5534:	6000 00ea      	bra.w 5620 <TestZoom4Picture+0x1904>
    for(int i2=0;i2<9;i2++) {  
    5538:	42af 0132      	clr.l 306(sp)
    553c:	6044           	bra.s 5582 <TestZoom4Picture+0x1866>
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    553e:	307c 000b      	movea.w #11,a0
    5542:	d1ef 0132      	adda.l 306(sp),a0
    5546:	222f 0136      	move.l 310(sp),d1
    554a:	2001           	move.l d1,d0
    554c:	d080           	add.l d0,d0
    554e:	d081           	add.l d1,d0
    5550:	2200           	move.l d0,d1
    5552:	e789           	lsl.l #3,d1
    5554:	d081           	add.l d1,d0
    5556:	2208           	move.l a0,d1
    5558:	d280           	add.l d0,d1
    555a:	7000           	moveq #0,d0
    555c:	302f 01c6      	move.w 454(sp),d0
    5560:	2f01           	move.l d1,-(sp)
    5562:	2f00           	move.l d0,-(sp)
    5564:	2f2f 01d0      	move.l 464(sp),-(sp)
    5568:	2f2f 0056      	move.l 86(sp),-(sp)
    556c:	4eba 1610      	jsr 6b7e <TestRow>(pc)
    5570:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5574:	722a           	moveq #42,d1
    5576:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    557a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {  
    557e:	52af 0132      	addq.l #1,306(sp)
    5582:	7008           	moveq #8,d0
    5584:	b0af 0132      	cmp.l 306(sp),d0
    5588:	6cb4           	bge.s 553e <TestZoom4Picture+0x1822>
    }
    
    for(int i2=0;i2<9;i2++) {
    558a:	42af 012e      	clr.l 302(sp)
    558e:	6000 0082      	bra.w 5612 <TestZoom4Picture+0x18f6>
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    5592:	222f 0136      	move.l 310(sp),d1
    5596:	2001           	move.l d1,d0
    5598:	d080           	add.l d0,d0
    559a:	d081           	add.l d1,d0
    559c:	2200           	move.l d0,d1
    559e:	e789           	lsl.l #3,d1
    55a0:	2040           	movea.l d0,a0
    55a2:	d1c1           	adda.l d1,a0
    55a4:	41e8 0014      	lea 20(a0),a0
    55a8:	2208           	move.l a0,d1
    55aa:	d2af 012e      	add.l 302(sp),d1
    55ae:	7000           	moveq #0,d0
    55b0:	302f 01c6      	move.w 454(sp),d0
    55b4:	2f01           	move.l d1,-(sp)
    55b6:	2f00           	move.l d0,-(sp)
    55b8:	2f2f 01d0      	move.l 464(sp),-(sp)
    55bc:	2f2f 0056      	move.l 86(sp),-(sp)
    55c0:	4eba 15bc      	jsr 6b7e <TestRow>(pc)
    55c4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    55c8:	722a           	moveq #42,d1
    55ca:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    55ce:	222f 0136      	move.l 310(sp),d1
    55d2:	2001           	move.l d1,d0
    55d4:	d080           	add.l d0,d0
    55d6:	d081           	add.l d1,d0
    55d8:	2200           	move.l d0,d1
    55da:	e789           	lsl.l #3,d1
    55dc:	2040           	movea.l d0,a0
    55de:	d1c1           	adda.l d1,a0
    55e0:	41e8 0015      	lea 21(a0),a0
    55e4:	2208           	move.l a0,d1
    55e6:	d2af 012e      	add.l 302(sp),d1
    55ea:	7000           	moveq #0,d0
    55ec:	302f 01c6      	move.w 454(sp),d0
    55f0:	2f01           	move.l d1,-(sp)
    55f2:	2f00           	move.l d0,-(sp)
    55f4:	2f2f 01d0      	move.l 464(sp),-(sp)
    55f8:	2f2f 0056      	move.l 86(sp),-(sp)
    55fc:	4eba 1580      	jsr 6b7e <TestRow>(pc)
    5600:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5604:	702a           	moveq #42,d0
    5606:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    560a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {
    560e:	52af 012e      	addq.l #1,302(sp)
    5612:	7208           	moveq #8,d1
    5614:	b2af 012e      	cmp.l 302(sp),d1
    5618:	6c00 ff78      	bge.w 5592 <TestZoom4Picture+0x1876>
  for(int i=0;i<9;i++) {
    561c:	52af 0136      	addq.l #1,310(sp)
    5620:	7008           	moveq #8,d0
    5622:	b0af 0136      	cmp.l 310(sp),d0
    5626:	6c00 ff10      	bge.w 5538 <TestZoom4Picture+0x181c>
    }
  }

  for(int i2=0;i2<9;i2++) {  
    562a:	42af 012a      	clr.l 298(sp)
    562e:	6032           	bra.s 5662 <TestZoom4Picture+0x1946>
    TestRow( valsupposed, valactual, mask, 245+i2);
    5630:	222f 012a      	move.l 298(sp),d1
    5634:	0681 0000 00f5 	addi.l #245,d1
    563a:	7000           	moveq #0,d0
    563c:	302f 01c6      	move.w 454(sp),d0
    5640:	2f01           	move.l d1,-(sp)
    5642:	2f00           	move.l d0,-(sp)
    5644:	2f2f 01d0      	move.l 464(sp),-(sp)
    5648:	2f2f 0056      	move.l 86(sp),-(sp)
    564c:	4eba 1530      	jsr 6b7e <TestRow>(pc)
    5650:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5654:	722a           	moveq #42,d1
    5656:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    565a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {  
    565e:	52af 012a      	addq.l #1,298(sp)
    5662:	7008           	moveq #8,d0
    5664:	b0af 012a      	cmp.l 298(sp),d0
    5668:	6cc6           	bge.s 5630 <TestZoom4Picture+0x1914>
  }
  for(int i=0;i<5;i++) {
    566a:	42af 0126      	clr.l 294(sp)
    566e:	6064           	bra.s 56d4 <TestZoom4Picture+0x19b8>
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    5670:	202f 0126      	move.l 294(sp),d0
    5674:	d080           	add.l d0,d0
    5676:	2200           	move.l d0,d1
    5678:	0681 0000 0103 	addi.l #259,d1
    567e:	7000           	moveq #0,d0
    5680:	302f 01c6      	move.w 454(sp),d0
    5684:	2f01           	move.l d1,-(sp)
    5686:	2f00           	move.l d0,-(sp)
    5688:	2f2f 01d0      	move.l 464(sp),-(sp)
    568c:	2f2f 0056      	move.l 86(sp),-(sp)
    5690:	4eba 14ec      	jsr 6b7e <TestRow>(pc)
    5694:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5698:	722a           	moveq #42,d1
    569a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    569e:	202f 0126      	move.l 294(sp),d0
    56a2:	0680 0000 0082 	addi.l #130,d0
    56a8:	d080           	add.l d0,d0
    56aa:	2200           	move.l d0,d1
    56ac:	7000           	moveq #0,d0
    56ae:	302f 01c6      	move.w 454(sp),d0
    56b2:	2f01           	move.l d1,-(sp)
    56b4:	2f00           	move.l d0,-(sp)
    56b6:	2f2f 01d0      	move.l 464(sp),-(sp)
    56ba:	2f2f 0056      	move.l 86(sp),-(sp)
    56be:	4eba 14be      	jsr 6b7e <TestRow>(pc)
    56c2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    56c6:	702a           	moveq #42,d0
    56c8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    56cc:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    56d0:	52af 0126      	addq.l #1,294(sp)
    56d4:	7204           	moveq #4,d1
    56d6:	b2af 0126      	cmp.l 294(sp),d1
    56da:	6c94           	bge.s 5670 <TestZoom4Picture+0x1954>
  }
  TestRow( valsupposed, valactual, mask, 269);
    56dc:	7000           	moveq #0,d0
    56de:	302f 01c6      	move.w 454(sp),d0
    56e2:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    56e6:	2f00           	move.l d0,-(sp)
    56e8:	2f2f 01d0      	move.l 464(sp),-(sp)
    56ec:	2f2f 0056      	move.l 86(sp),-(sp)
    56f0:	4eba 148c      	jsr 6b7e <TestRow>(pc)
    56f4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    56f8:	702a           	moveq #42,d0
    56fa:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    56fe:	466f 01c6      	not.w 454(sp)

  tmp = source;
    5702:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5708:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    570e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    5714:	4878 0001      	pea 1 <_start+0x1>
    5718:	4878 0009      	pea 9 <_start+0x9>
    571c:	2f2f 0056      	move.l 86(sp),-(sp)
    5720:	2f2f 006a      	move.l 106(sp),-(sp)
    5724:	4eba c3a6      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    5728:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    572c:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    5732:	2c40           	movea.l d0,a6
    5734:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5738:	222f 004e      	move.l 78(sp),d1
    573c:	5881           	addq.l #4,d1
    573e:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom10;
    5742:	2f7c 0000 bc90 	move.l #48272,74(sp)
    5748:	004a 

  mask = 0xffff;
    574a:	3f7c ffff 01c6 	move.w #-1,454(sp)
  TestRow( valsupposed, valactual, mask, 0);
    5750:	7000           	moveq #0,d0
    5752:	302f 01c6      	move.w 454(sp),d0
    5756:	42a7           	clr.l -(sp)
    5758:	2f00           	move.l d0,-(sp)
    575a:	2f2f 01d0      	move.l 464(sp),-(sp)
    575e:	2f2f 0056      	move.l 86(sp),-(sp)
    5762:	4eba 141a      	jsr 6b7e <TestRow>(pc)
    5766:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    576a:	702a           	moveq #42,d0
    576c:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5770:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 1);   
    5774:	7000           	moveq #0,d0
    5776:	302f 01c6      	move.w 454(sp),d0
    577a:	4878 0001      	pea 1 <_start+0x1>
    577e:	2f00           	move.l d0,-(sp)
    5780:	2f2f 01d0      	move.l 464(sp),-(sp)
    5784:	2f2f 0056      	move.l 86(sp),-(sp)
    5788:	4eba 13f4      	jsr 6b7e <TestRow>(pc)
    578c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5790:	722a           	moveq #42,d1
    5792:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 2);
    5796:	7000           	moveq #0,d0
    5798:	302f 01c6      	move.w 454(sp),d0
    579c:	4878 0002      	pea 2 <_start+0x2>
    57a0:	2f00           	move.l d0,-(sp)
    57a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    57a6:	2f2f 0056      	move.l 86(sp),-(sp)
    57aa:	4eba 13d2      	jsr 6b7e <TestRow>(pc)
    57ae:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    57b2:	702a           	moveq #42,d0
    57b4:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    57b8:	466f 01c6      	not.w 454(sp)

  for(int i=0;i<9;i++) {
    57bc:	42af 0122      	clr.l 290(sp)
    57c0:	6000 00e0      	bra.w 58a2 <TestZoom4Picture+0x1b86>
    for(int i2=0;i2<8;i2++) {  
    57c4:	42af 011e      	clr.l 286(sp)
    57c8:	6040           	bra.s 580a <TestZoom4Picture+0x1aee>
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    57ca:	206f 011e      	movea.l 286(sp),a0
    57ce:	5688           	addq.l #3,a0
    57d0:	222f 0122      	move.l 290(sp),d1
    57d4:	2001           	move.l d1,d0
    57d6:	e788           	lsl.l #3,d0
    57d8:	9081           	sub.l d1,d0
    57da:	d080           	add.l d0,d0
    57dc:	d080           	add.l d0,d0
    57de:	2208           	move.l a0,d1
    57e0:	d280           	add.l d0,d1
    57e2:	7000           	moveq #0,d0
    57e4:	302f 01c6      	move.w 454(sp),d0
    57e8:	2f01           	move.l d1,-(sp)
    57ea:	2f00           	move.l d0,-(sp)
    57ec:	2f2f 01d0      	move.l 464(sp),-(sp)
    57f0:	2f2f 0056      	move.l 86(sp),-(sp)
    57f4:	4eba 1388      	jsr 6b7e <TestRow>(pc)
    57f8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    57fc:	722a           	moveq #42,d1
    57fe:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5802:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {  
    5806:	52af 011e      	addq.l #1,286(sp)
    580a:	7007           	moveq #7,d0
    580c:	b0af 011e      	cmp.l 286(sp),d0
    5810:	6cb8           	bge.s 57ca <TestZoom4Picture+0x1aae>
    }
    
    for(int i2=0;i2<10;i2++) {
    5812:	42af 011a      	clr.l 282(sp)
    5816:	607c           	bra.s 5894 <TestZoom4Picture+0x1b78>
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    5818:	222f 0122      	move.l 290(sp),d1
    581c:	2001           	move.l d1,d0
    581e:	e788           	lsl.l #3,d0
    5820:	9081           	sub.l d1,d0
    5822:	d080           	add.l d0,d0
    5824:	d080           	add.l d0,d0
    5826:	2040           	movea.l d0,a0
    5828:	41e8 000b      	lea 11(a0),a0
    582c:	2208           	move.l a0,d1
    582e:	d2af 011a      	add.l 282(sp),d1
    5832:	7000           	moveq #0,d0
    5834:	302f 01c6      	move.w 454(sp),d0
    5838:	2f01           	move.l d1,-(sp)
    583a:	2f00           	move.l d0,-(sp)
    583c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5840:	2f2f 0056      	move.l 86(sp),-(sp)
    5844:	4eba 1338      	jsr 6b7e <TestRow>(pc)
    5848:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    584c:	722a           	moveq #42,d1
    584e:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    5852:	222f 0122      	move.l 290(sp),d1
    5856:	2001           	move.l d1,d0
    5858:	e788           	lsl.l #3,d0
    585a:	9081           	sub.l d1,d0
    585c:	d080           	add.l d0,d0
    585e:	d080           	add.l d0,d0
    5860:	2040           	movea.l d0,a0
    5862:	41e8 000b      	lea 11(a0),a0
    5866:	2208           	move.l a0,d1
    5868:	d2af 011a      	add.l 282(sp),d1
    586c:	7000           	moveq #0,d0
    586e:	302f 01c6      	move.w 454(sp),d0
    5872:	2f01           	move.l d1,-(sp)
    5874:	2f00           	move.l d0,-(sp)
    5876:	2f2f 01d0      	move.l 464(sp),-(sp)
    587a:	2f2f 0056      	move.l 86(sp),-(sp)
    587e:	4eba 12fe      	jsr 6b7e <TestRow>(pc)
    5882:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5886:	702a           	moveq #42,d0
    5888:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    588c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {
    5890:	52af 011a      	addq.l #1,282(sp)
    5894:	7209           	moveq #9,d1
    5896:	b2af 011a      	cmp.l 282(sp),d1
    589a:	6c00 ff7c      	bge.w 5818 <TestZoom4Picture+0x1afc>
  for(int i=0;i<9;i++) {
    589e:	52af 0122      	addq.l #1,290(sp)
    58a2:	7008           	moveq #8,d0
    58a4:	b0af 0122      	cmp.l 290(sp),d0
    58a8:	6c00 ff1a      	bge.w 57c4 <TestZoom4Picture+0x1aa8>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    58ac:	42af 0116      	clr.l 278(sp)
    58b0:	6032           	bra.s 58e4 <TestZoom4Picture+0x1bc8>
    TestRow( valsupposed, valactual, mask, 255+i2);
    58b2:	222f 0116      	move.l 278(sp),d1
    58b6:	0681 0000 00ff 	addi.l #255,d1
    58bc:	7000           	moveq #0,d0
    58be:	302f 01c6      	move.w 454(sp),d0
    58c2:	2f01           	move.l d1,-(sp)
    58c4:	2f00           	move.l d0,-(sp)
    58c6:	2f2f 01d0      	move.l 464(sp),-(sp)
    58ca:	2f2f 0056      	move.l 86(sp),-(sp)
    58ce:	4eba 12ae      	jsr 6b7e <TestRow>(pc)
    58d2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    58d6:	722a           	moveq #42,d1
    58d8:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    58dc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    58e0:	52af 0116      	addq.l #1,278(sp)
    58e4:	7007           	moveq #7,d0
    58e6:	b0af 0116      	cmp.l 278(sp),d0
    58ea:	6cc6           	bge.s 58b2 <TestZoom4Picture+0x1b96>
  }
  for(int i=0;i<3;i++) {
    58ec:	42af 0112      	clr.l 274(sp)
    58f0:	6064           	bra.s 5956 <TestZoom4Picture+0x1c3a>
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    58f2:	202f 0112      	move.l 274(sp),d0
    58f6:	d080           	add.l d0,d0
    58f8:	2200           	move.l d0,d1
    58fa:	0681 0000 0107 	addi.l #263,d1
    5900:	7000           	moveq #0,d0
    5902:	302f 01c6      	move.w 454(sp),d0
    5906:	2f01           	move.l d1,-(sp)
    5908:	2f00           	move.l d0,-(sp)
    590a:	2f2f 01d0      	move.l 464(sp),-(sp)
    590e:	2f2f 0056      	move.l 86(sp),-(sp)
    5912:	4eba 126a      	jsr 6b7e <TestRow>(pc)
    5916:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    591a:	722a           	moveq #42,d1
    591c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    5920:	202f 0112      	move.l 274(sp),d0
    5924:	0680 0000 0084 	addi.l #132,d0
    592a:	d080           	add.l d0,d0
    592c:	2200           	move.l d0,d1
    592e:	7000           	moveq #0,d0
    5930:	302f 01c6      	move.w 454(sp),d0
    5934:	2f01           	move.l d1,-(sp)
    5936:	2f00           	move.l d0,-(sp)
    5938:	2f2f 01d0      	move.l 464(sp),-(sp)
    593c:	2f2f 0056      	move.l 86(sp),-(sp)
    5940:	4eba 123c      	jsr 6b7e <TestRow>(pc)
    5944:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5948:	702a           	moveq #42,d0
    594a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    594e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    5952:	52af 0112      	addq.l #1,274(sp)
    5956:	7202           	moveq #2,d1
    5958:	b2af 0112      	cmp.l 274(sp),d1
    595c:	6c94           	bge.s 58f2 <TestZoom4Picture+0x1bd6>
  }

  tmp = source;
    595e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5964:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    596a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    5970:	4878 0001      	pea 1 <_start+0x1>
    5974:	4878 000a      	pea a <_start+0xa>
    5978:	2f2f 0056      	move.l 86(sp),-(sp)
    597c:	2f2f 006a      	move.l 106(sp),-(sp)
    5980:	4eba c14a      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    5984:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5988:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    598e:	2c40           	movea.l d0,a6
    5990:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5994:	202f 004e      	move.l 78(sp),d0
    5998:	5880           	addq.l #4,d0
    599a:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom11;
    599e:	2f7c 0000 bcbc 	move.l #48316,74(sp)
    59a4:	004a 

  mask = 0xffff;
    59a6:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  for(int i2=0;i2<6;i2++) {  
    59ac:	42af 010e      	clr.l 270(sp)
    59b0:	602a           	bra.s 59dc <TestZoom4Picture+0x1cc0>
    TestRow( valsupposed, valactual, mask, i2);
    59b2:	7000           	moveq #0,d0
    59b4:	302f 01c6      	move.w 454(sp),d0
    59b8:	2f2f 010e      	move.l 270(sp),-(sp)
    59bc:	2f00           	move.l d0,-(sp)
    59be:	2f2f 01d0      	move.l 464(sp),-(sp)
    59c2:	2f2f 0056      	move.l 86(sp),-(sp)
    59c6:	4eba 11b6      	jsr 6b7e <TestRow>(pc)
    59ca:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    59ce:	722a           	moveq #42,d1
    59d0:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    59d4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {  
    59d8:	52af 010e      	addq.l #1,270(sp)
    59dc:	7005           	moveq #5,d0
    59de:	b0af 010e      	cmp.l 270(sp),d0
    59e2:	6cce           	bge.s 59b2 <TestZoom4Picture+0x1c96>
  }

  for(int i2=0;i2<11;i2++) {
    59e4:	42af 010a      	clr.l 266(sp)
    59e8:	605c           	bra.s 5a46 <TestZoom4Picture+0x1d2a>
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    59ea:	202f 010a      	move.l 266(sp),d0
    59ee:	5680           	addq.l #3,d0
    59f0:	d080           	add.l d0,d0
    59f2:	2200           	move.l d0,d1
    59f4:	7000           	moveq #0,d0
    59f6:	302f 01c6      	move.w 454(sp),d0
    59fa:	2f01           	move.l d1,-(sp)
    59fc:	2f00           	move.l d0,-(sp)
    59fe:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a02:	2f2f 0056      	move.l 86(sp),-(sp)
    5a06:	4eba 1176      	jsr 6b7e <TestRow>(pc)
    5a0a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a0e:	722a           	moveq #42,d1
    5a10:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    5a14:	202f 010a      	move.l 266(sp),d0
    5a18:	d080           	add.l d0,d0
    5a1a:	2200           	move.l d0,d1
    5a1c:	5e81           	addq.l #7,d1
    5a1e:	7000           	moveq #0,d0
    5a20:	302f 01c6      	move.w 454(sp),d0
    5a24:	2f01           	move.l d1,-(sp)
    5a26:	2f00           	move.l d0,-(sp)
    5a28:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a2c:	2f2f 0056      	move.l 86(sp),-(sp)
    5a30:	4eba 114c      	jsr 6b7e <TestRow>(pc)
    5a34:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a38:	702a           	moveq #42,d0
    5a3a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5a3e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5a42:	52af 010a      	addq.l #1,266(sp)
    5a46:	720a           	moveq #10,d1
    5a48:	b2af 010a      	cmp.l 266(sp),d1
    5a4c:	6c9c           	bge.s 59ea <TestZoom4Picture+0x1cce>
  }

  for(int i=0;i<8;i++) {
    5a4e:	42af 0106      	clr.l 262(sp)
    5a52:	6000 00f2      	bra.w 5b46 <TestZoom4Picture+0x1e2a>
    for(int i2=0;i2<7;i2++) {  
    5a56:	42af 0102      	clr.l 258(sp)
    5a5a:	6044           	bra.s 5aa0 <TestZoom4Picture+0x1d84>
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    5a5c:	307c 001c      	movea.w #28,a0
    5a60:	d1ef 0102      	adda.l 258(sp),a0
    5a64:	222f 0106      	move.l 262(sp),d1
    5a68:	2001           	move.l d1,d0
    5a6a:	e788           	lsl.l #3,d0
    5a6c:	9081           	sub.l d1,d0
    5a6e:	d080           	add.l d0,d0
    5a70:	d080           	add.l d0,d0
    5a72:	d081           	add.l d1,d0
    5a74:	2208           	move.l a0,d1
    5a76:	d280           	add.l d0,d1
    5a78:	7000           	moveq #0,d0
    5a7a:	302f 01c6      	move.w 454(sp),d0
    5a7e:	2f01           	move.l d1,-(sp)
    5a80:	2f00           	move.l d0,-(sp)
    5a82:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a86:	2f2f 0056      	move.l 86(sp),-(sp)
    5a8a:	4eba 10f2      	jsr 6b7e <TestRow>(pc)
    5a8e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a92:	702a           	moveq #42,d0
    5a94:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5a98:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<7;i2++) {  
    5a9c:	52af 0102      	addq.l #1,258(sp)
    5aa0:	7206           	moveq #6,d1
    5aa2:	b2af 0102      	cmp.l 258(sp),d1
    5aa6:	6cb4           	bge.s 5a5c <TestZoom4Picture+0x1d40>
    }
    
    for(int i2=0;i2<11;i2++) {
    5aa8:	42af 00fe      	clr.l 254(sp)
    5aac:	6000 008a      	bra.w 5b38 <TestZoom4Picture+0x1e1c>
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    5ab0:	222f 0106      	move.l 262(sp),d1
    5ab4:	2001           	move.l d1,d0
    5ab6:	e788           	lsl.l #3,d0
    5ab8:	9081           	sub.l d1,d0
    5aba:	d080           	add.l d0,d0
    5abc:	d080           	add.l d0,d0
    5abe:	2040           	movea.l d0,a0
    5ac0:	d1c1           	adda.l d1,a0
    5ac2:	41e8 0023      	lea 35(a0),a0
    5ac6:	202f 00fe      	move.l 254(sp),d0
    5aca:	d080           	add.l d0,d0
    5acc:	2208           	move.l a0,d1
    5ace:	d280           	add.l d0,d1
    5ad0:	7000           	moveq #0,d0
    5ad2:	302f 01c6      	move.w 454(sp),d0
    5ad6:	2f01           	move.l d1,-(sp)
    5ad8:	2f00           	move.l d0,-(sp)
    5ada:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ade:	2f2f 0056      	move.l 86(sp),-(sp)
    5ae2:	4eba 109a      	jsr 6b7e <TestRow>(pc)
    5ae6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5aea:	702a           	moveq #42,d0
    5aec:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    5af0:	222f 0106      	move.l 262(sp),d1
    5af4:	2001           	move.l d1,d0
    5af6:	e788           	lsl.l #3,d0
    5af8:	9081           	sub.l d1,d0
    5afa:	d080           	add.l d0,d0
    5afc:	d080           	add.l d0,d0
    5afe:	2040           	movea.l d0,a0
    5b00:	d1c1           	adda.l d1,a0
    5b02:	41e8 000b      	lea 11(a0),a0
    5b06:	202f 00fe      	move.l 254(sp),d0
    5b0a:	d080           	add.l d0,d0
    5b0c:	2208           	move.l a0,d1
    5b0e:	d280           	add.l d0,d1
    5b10:	7000           	moveq #0,d0
    5b12:	302f 01c6      	move.w 454(sp),d0
    5b16:	2f01           	move.l d1,-(sp)
    5b18:	2f00           	move.l d0,-(sp)
    5b1a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b1e:	2f2f 0056      	move.l 86(sp),-(sp)
    5b22:	4eba 105a      	jsr 6b7e <TestRow>(pc)
    5b26:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5b2a:	722a           	moveq #42,d1
    5b2c:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5b30:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {
    5b34:	52af 00fe      	addq.l #1,254(sp)
    5b38:	700a           	moveq #10,d0
    5b3a:	b0af 00fe      	cmp.l 254(sp),d0
    5b3e:	6c00 ff70      	bge.w 5ab0 <TestZoom4Picture+0x1d94>
  for(int i=0;i<8;i++) {
    5b42:	52af 0106      	addq.l #1,262(sp)
    5b46:	7207           	moveq #7,d1
    5b48:	b2af 0106      	cmp.l 262(sp),d1
    5b4c:	6c00 ff08      	bge.w 5a56 <TestZoom4Picture+0x1d3a>
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    5b50:	42af 00fa      	clr.l 250(sp)
    5b54:	6032           	bra.s 5b88 <TestZoom4Picture+0x1e6c>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5b56:	222f 00fa      	move.l 250(sp),d1
    5b5a:	0681 0000 0104 	addi.l #260,d1
    5b60:	7000           	moveq #0,d0
    5b62:	302f 01c6      	move.w 454(sp),d0
    5b66:	2f01           	move.l d1,-(sp)
    5b68:	2f00           	move.l d0,-(sp)
    5b6a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b6e:	2f2f 0056      	move.l 86(sp),-(sp)
    5b72:	4eba 100a      	jsr 6b7e <TestRow>(pc)
    5b76:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5b7a:	702a           	moveq #42,d0
    5b7c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5b80:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    5b84:	52af 00fa      	addq.l #1,250(sp)
    5b88:	7206           	moveq #6,d1
    5b8a:	b2af 00fa      	cmp.l 250(sp),d1
    5b8e:	6cc6           	bge.s 5b56 <TestZoom4Picture+0x1e3a>
  }
  TestRow( valsupposed, valactual, mask, 267);   
    5b90:	7000           	moveq #0,d0
    5b92:	302f 01c6      	move.w 454(sp),d0
    5b96:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    5b9a:	2f00           	move.l d0,-(sp)
    5b9c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ba0:	2f2f 0056      	move.l 86(sp),-(sp)
    5ba4:	4eba 0fd8      	jsr 6b7e <TestRow>(pc)
    5ba8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5bac:	702a           	moveq #42,d0
    5bae:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 268);
    5bb2:	7000           	moveq #0,d0
    5bb4:	302f 01c6      	move.w 454(sp),d0
    5bb8:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    5bbc:	2f00           	move.l d0,-(sp)
    5bbe:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bc2:	2f2f 0056      	move.l 86(sp),-(sp)
    5bc6:	4eba 0fb6      	jsr 6b7e <TestRow>(pc)
    5bca:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5bce:	722a           	moveq #42,d1
    5bd0:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5bd4:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 269);
    5bd8:	7000           	moveq #0,d0
    5bda:	302f 01c6      	move.w 454(sp),d0
    5bde:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5be2:	2f00           	move.l d0,-(sp)
    5be4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5be8:	2f2f 0056      	move.l 86(sp),-(sp)
    5bec:	4eba 0f90      	jsr 6b7e <TestRow>(pc)
    5bf0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5bf4:	702a           	moveq #42,d0
    5bf6:	d1af 01c8      	add.l d0,456(sp)
  
  tmp = source;
    5bfa:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5c00:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5c06:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    5c0c:	4878 0001      	pea 1 <_start+0x1>
    5c10:	4878 000b      	pea b <_start+0xb>
    5c14:	2f2f 0056      	move.l 86(sp),-(sp)
    5c18:	2f2f 006a      	move.l 106(sp),-(sp)
    5c1c:	4eba beae      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    5c20:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5c24:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    5c2a:	2c40           	movea.l d0,a6
    5c2c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5c30:	222f 004e      	move.l 78(sp),d1
    5c34:	5881           	addq.l #4,d1
    5c36:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom12;
    5c3a:	2f7c 0000 bce8 	move.l #48360,74(sp)
    5c40:	004a 

  mask = 0x0;
    5c42:	426f 01c6      	clr.w 454(sp)
   
  TestRow( valsupposed, valactual, mask, 0);
    5c46:	7000           	moveq #0,d0
    5c48:	302f 01c6      	move.w 454(sp),d0
    5c4c:	42a7           	clr.l -(sp)
    5c4e:	2f00           	move.l d0,-(sp)
    5c50:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c54:	2f2f 0056      	move.l 86(sp),-(sp)
    5c58:	4eba 0f24      	jsr 6b7e <TestRow>(pc)
    5c5c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5c60:	702a           	moveq #42,d0
    5c62:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5c66:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<12;i2++) {
    5c6a:	42af 00f6      	clr.l 246(sp)
    5c6e:	605c           	bra.s 5ccc <TestZoom4Picture+0x1fb0>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5c70:	202f 00f6      	move.l 246(sp),d0
    5c74:	d080           	add.l d0,d0
    5c76:	2200           	move.l d0,d1
    5c78:	5281           	addq.l #1,d1
    5c7a:	7000           	moveq #0,d0
    5c7c:	302f 01c6      	move.w 454(sp),d0
    5c80:	2f01           	move.l d1,-(sp)
    5c82:	2f00           	move.l d0,-(sp)
    5c84:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c88:	2f2f 0056      	move.l 86(sp),-(sp)
    5c8c:	4eba 0ef0      	jsr 6b7e <TestRow>(pc)
    5c90:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5c94:	722a           	moveq #42,d1
    5c96:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5c9a:	202f 00f6      	move.l 246(sp),d0
    5c9e:	5280           	addq.l #1,d0
    5ca0:	d080           	add.l d0,d0
    5ca2:	2200           	move.l d0,d1
    5ca4:	7000           	moveq #0,d0
    5ca6:	302f 01c6      	move.w 454(sp),d0
    5caa:	2f01           	move.l d1,-(sp)
    5cac:	2f00           	move.l d0,-(sp)
    5cae:	2f2f 01d0      	move.l 464(sp),-(sp)
    5cb2:	2f2f 0056      	move.l 86(sp),-(sp)
    5cb6:	4eba 0ec6      	jsr 6b7e <TestRow>(pc)
    5cba:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5cbe:	702a           	moveq #42,d0
    5cc0:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5cc4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    5cc8:	52af 00f6      	addq.l #1,246(sp)
    5ccc:	720b           	moveq #11,d1
    5cce:	b2af 00f6      	cmp.l 246(sp),d1
    5cd2:	6c9c           	bge.s 5c70 <TestZoom4Picture+0x1f54>
  } 

  for(int i=0;i<8;i++) {
    5cd4:	42af 00f2      	clr.l 242(sp)
    5cd8:	6000 00e6      	bra.w 5dc0 <TestZoom4Picture+0x20a4>
    for(int i2=0;i2<6;i2++) {  
    5cdc:	42af 00ee      	clr.l 238(sp)
    5ce0:	6040           	bra.s 5d22 <TestZoom4Picture+0x2006>
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    5ce2:	307c 0019      	movea.w #25,a0
    5ce6:	d1ef 00ee      	adda.l 238(sp),a0
    5cea:	222f 00f2      	move.l 242(sp),d1
    5cee:	2001           	move.l d1,d0
    5cf0:	e988           	lsl.l #4,d0
    5cf2:	9081           	sub.l d1,d0
    5cf4:	d080           	add.l d0,d0
    5cf6:	2208           	move.l a0,d1
    5cf8:	d280           	add.l d0,d1
    5cfa:	7000           	moveq #0,d0
    5cfc:	302f 01c6      	move.w 454(sp),d0
    5d00:	2f01           	move.l d1,-(sp)
    5d02:	2f00           	move.l d0,-(sp)
    5d04:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d08:	2f2f 0056      	move.l 86(sp),-(sp)
    5d0c:	4eba 0e70      	jsr 6b7e <TestRow>(pc)
    5d10:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5d14:	702a           	moveq #42,d0
    5d16:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5d1a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<6;i2++) {  
    5d1e:	52af 00ee      	addq.l #1,238(sp)
    5d22:	7205           	moveq #5,d1
    5d24:	b2af 00ee      	cmp.l 238(sp),d1
    5d28:	6cb8           	bge.s 5ce2 <TestZoom4Picture+0x1fc6>
    }
    
    for(int i2=0;i2<12;i2++) {
    5d2a:	42af 00ea      	clr.l 234(sp)
    5d2e:	6000 0082      	bra.w 5db2 <TestZoom4Picture+0x2096>
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    5d32:	222f 00f2      	move.l 242(sp),d1
    5d36:	2001           	move.l d1,d0
    5d38:	e988           	lsl.l #4,d0
    5d3a:	9081           	sub.l d1,d0
    5d3c:	d080           	add.l d0,d0
    5d3e:	2040           	movea.l d0,a0
    5d40:	41e8 001f      	lea 31(a0),a0
    5d44:	202f 00ea      	move.l 234(sp),d0
    5d48:	d080           	add.l d0,d0
    5d4a:	2208           	move.l a0,d1
    5d4c:	d280           	add.l d0,d1
    5d4e:	7000           	moveq #0,d0
    5d50:	302f 01c6      	move.w 454(sp),d0
    5d54:	2f01           	move.l d1,-(sp)
    5d56:	2f00           	move.l d0,-(sp)
    5d58:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d5c:	2f2f 0056      	move.l 86(sp),-(sp)
    5d60:	4eba 0e1c      	jsr 6b7e <TestRow>(pc)
    5d64:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5d68:	702a           	moveq #42,d0
    5d6a:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    5d6e:	222f 00f2      	move.l 242(sp),d1
    5d72:	2001           	move.l d1,d0
    5d74:	e988           	lsl.l #4,d0
    5d76:	9081           	sub.l d1,d0
    5d78:	d080           	add.l d0,d0
    5d7a:	2040           	movea.l d0,a0
    5d7c:	41e8 0020      	lea 32(a0),a0
    5d80:	202f 00ea      	move.l 234(sp),d0
    5d84:	d080           	add.l d0,d0
    5d86:	2208           	move.l a0,d1
    5d88:	d280           	add.l d0,d1
    5d8a:	7000           	moveq #0,d0
    5d8c:	302f 01c6      	move.w 454(sp),d0
    5d90:	2f01           	move.l d1,-(sp)
    5d92:	2f00           	move.l d0,-(sp)
    5d94:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d98:	2f2f 0056      	move.l 86(sp),-(sp)
    5d9c:	4eba 0de0      	jsr 6b7e <TestRow>(pc)
    5da0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5da4:	722a           	moveq #42,d1
    5da6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5daa:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {
    5dae:	52af 00ea      	addq.l #1,234(sp)
    5db2:	700b           	moveq #11,d0
    5db4:	b0af 00ea      	cmp.l 234(sp),d0
    5db8:	6c00 ff78      	bge.w 5d32 <TestZoom4Picture+0x2016>
  for(int i=0;i<8;i++) {
    5dbc:	52af 00f2      	addq.l #1,242(sp)
    5dc0:	7207           	moveq #7,d1
    5dc2:	b2af 00f2      	cmp.l 242(sp),d1
    5dc6:	6c00 ff14      	bge.w 5cdc <TestZoom4Picture+0x1fc0>
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    5dca:	42af 00e6      	clr.l 230(sp)
    5dce:	6032           	bra.s 5e02 <TestZoom4Picture+0x20e6>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5dd0:	222f 00e6      	move.l 230(sp),d1
    5dd4:	0681 0000 0104 	addi.l #260,d1
    5dda:	7000           	moveq #0,d0
    5ddc:	302f 01c6      	move.w 454(sp),d0
    5de0:	2f01           	move.l d1,-(sp)
    5de2:	2f00           	move.l d0,-(sp)
    5de4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5de8:	2f2f 0056      	move.l 86(sp),-(sp)
    5dec:	4eba 0d90      	jsr 6b7e <TestRow>(pc)
    5df0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5df4:	702a           	moveq #42,d0
    5df6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5dfa:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5dfe:	52af 00e6      	addq.l #1,230(sp)
    5e02:	7204           	moveq #4,d1
    5e04:	b2af 00e6      	cmp.l 230(sp),d1
    5e08:	6cc6           	bge.s 5dd0 <TestZoom4Picture+0x20b4>
  }

  tmp = source;
    5e0a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5e10:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5e16:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    5e1c:	4878 0001      	pea 1 <_start+0x1>
    5e20:	4878 000c      	pea c <_start+0xc>
    5e24:	2f2f 0056      	move.l 86(sp),-(sp)
    5e28:	2f2f 006a      	move.l 106(sp),-(sp)
    5e2c:	4eba bc9e      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    5e30:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5e34:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    5e3a:	2c40           	movea.l d0,a6
    5e3c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5e40:	202f 004e      	move.l 78(sp),d0
    5e44:	5880           	addq.l #4,d0
    5e46:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom13;
    5e4a:	2f7c 0000 bd14 	move.l #48404,74(sp)
    5e50:	004a 

  mask = 0xffff;
    5e52:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<11;i2++) {
    5e58:	42af 00e2      	clr.l 226(sp)
    5e5c:	605a           	bra.s 5eb8 <TestZoom4Picture+0x219c>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    5e5e:	202f 00e2      	move.l 226(sp),d0
    5e62:	d080           	add.l d0,d0
    5e64:	2200           	move.l d0,d1
    5e66:	7000           	moveq #0,d0
    5e68:	302f 01c6      	move.w 454(sp),d0
    5e6c:	2f01           	move.l d1,-(sp)
    5e6e:	2f00           	move.l d0,-(sp)
    5e70:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e74:	2f2f 0056      	move.l 86(sp),-(sp)
    5e78:	4eba 0d04      	jsr 6b7e <TestRow>(pc)
    5e7c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5e80:	722a           	moveq #42,d1
    5e82:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    5e86:	202f 00e2      	move.l 226(sp),d0
    5e8a:	d080           	add.l d0,d0
    5e8c:	2200           	move.l d0,d1
    5e8e:	5281           	addq.l #1,d1
    5e90:	7000           	moveq #0,d0
    5e92:	302f 01c6      	move.w 454(sp),d0
    5e96:	2f01           	move.l d1,-(sp)
    5e98:	2f00           	move.l d0,-(sp)
    5e9a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e9e:	2f2f 0056      	move.l 86(sp),-(sp)
    5ea2:	4eba 0cda      	jsr 6b7e <TestRow>(pc)
    5ea6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5eaa:	702a           	moveq #42,d0
    5eac:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5eb0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5eb4:	52af 00e2      	addq.l #1,226(sp)
    5eb8:	720a           	moveq #10,d1
    5eba:	b2af 00e2      	cmp.l 226(sp),d1
    5ebe:	6c9e           	bge.s 5e5e <TestZoom4Picture+0x2142>
  } 

  for(int i=0;i<8;i++) {
    5ec0:	42af 00de      	clr.l 222(sp)
    5ec4:	6000 00de      	bra.w 5fa4 <TestZoom4Picture+0x2288>
    for(int i2=0;i2<5;i2++) {  
    5ec8:	42af 00da      	clr.l 218(sp)
    5ecc:	603e           	bra.s 5f0c <TestZoom4Picture+0x21f0>
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    5ece:	307c 0016      	movea.w #22,a0
    5ed2:	d1ef 00da      	adda.l 218(sp),a0
    5ed6:	222f 00de      	move.l 222(sp),d1
    5eda:	2001           	move.l d1,d0
    5edc:	eb88           	lsl.l #5,d0
    5ede:	9081           	sub.l d1,d0
    5ee0:	2208           	move.l a0,d1
    5ee2:	d280           	add.l d0,d1
    5ee4:	7000           	moveq #0,d0
    5ee6:	302f 01c6      	move.w 454(sp),d0
    5eea:	2f01           	move.l d1,-(sp)
    5eec:	2f00           	move.l d0,-(sp)
    5eee:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ef2:	2f2f 0056      	move.l 86(sp),-(sp)
    5ef6:	4eba 0c86      	jsr 6b7e <TestRow>(pc)
    5efa:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5efe:	702a           	moveq #42,d0
    5f00:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5f04:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<5;i2++) {  
    5f08:	52af 00da      	addq.l #1,218(sp)
    5f0c:	7204           	moveq #4,d1
    5f0e:	b2af 00da      	cmp.l 218(sp),d1
    5f12:	6cba           	bge.s 5ece <TestZoom4Picture+0x21b2>
    }
    
    for(int i2=0;i2<13;i2++) {
    5f14:	42af 00d6      	clr.l 214(sp)
    5f18:	607c           	bra.s 5f96 <TestZoom4Picture+0x227a>
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    5f1a:	222f 00de      	move.l 222(sp),d1
    5f1e:	2001           	move.l d1,d0
    5f20:	eb88           	lsl.l #5,d0
    5f22:	2040           	movea.l d0,a0
    5f24:	91c1           	suba.l d1,a0
    5f26:	41e8 001b      	lea 27(a0),a0
    5f2a:	202f 00d6      	move.l 214(sp),d0
    5f2e:	d080           	add.l d0,d0
    5f30:	2208           	move.l a0,d1
    5f32:	d280           	add.l d0,d1
    5f34:	7000           	moveq #0,d0
    5f36:	302f 01c6      	move.w 454(sp),d0
    5f3a:	2f01           	move.l d1,-(sp)
    5f3c:	2f00           	move.l d0,-(sp)
    5f3e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f42:	2f2f 0056      	move.l 86(sp),-(sp)
    5f46:	4eba 0c36      	jsr 6b7e <TestRow>(pc)
    5f4a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f4e:	702a           	moveq #42,d0
    5f50:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    5f54:	222f 00de      	move.l 222(sp),d1
    5f58:	2001           	move.l d1,d0
    5f5a:	eb88           	lsl.l #5,d0
    5f5c:	2040           	movea.l d0,a0
    5f5e:	91c1           	suba.l d1,a0
    5f60:	41e8 001c      	lea 28(a0),a0
    5f64:	202f 00d6      	move.l 214(sp),d0
    5f68:	d080           	add.l d0,d0
    5f6a:	2208           	move.l a0,d1
    5f6c:	d280           	add.l d0,d1
    5f6e:	7000           	moveq #0,d0
    5f70:	302f 01c6      	move.w 454(sp),d0
    5f74:	2f01           	move.l d1,-(sp)
    5f76:	2f00           	move.l d0,-(sp)
    5f78:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f7c:	2f2f 0056      	move.l 86(sp),-(sp)
    5f80:	4eba 0bfc      	jsr 6b7e <TestRow>(pc)
    5f84:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f88:	722a           	moveq #42,d1
    5f8a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5f8e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {
    5f92:	52af 00d6      	addq.l #1,214(sp)
    5f96:	700c           	moveq #12,d0
    5f98:	b0af 00d6      	cmp.l 214(sp),d0
    5f9c:	6c00 ff7c      	bge.w 5f1a <TestZoom4Picture+0x21fe>
  for(int i=0;i<8;i++) {
    5fa0:	52af 00de      	addq.l #1,222(sp)
    5fa4:	7207           	moveq #7,d1
    5fa6:	b2af 00de      	cmp.l 222(sp),d1
    5faa:	6c00 ff1c      	bge.w 5ec8 <TestZoom4Picture+0x21ac>
    }
  } 

  tmp = source;
    5fae:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5fb4:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5fba:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    5fc0:	4878 0001      	pea 1 <_start+0x1>
    5fc4:	4878 000d      	pea d <_start+0xd>
    5fc8:	2f2f 0056      	move.l 86(sp),-(sp)
    5fcc:	2f2f 006a      	move.l 106(sp),-(sp)
    5fd0:	4eba bafa      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    5fd4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5fd8:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    5fde:	2c40           	movea.l d0,a6
    5fe0:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5fe4:	202f 004e      	move.l 78(sp),d0
    5fe8:	5880           	addq.l #4,d0
    5fea:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom14;
    5fee:	2f7c 0000 bd40 	move.l #48448,74(sp)
    5ff4:	004a 

  mask = 0xffff;
    5ff6:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    5ffc:	7000           	moveq #0,d0
    5ffe:	302f 01c6      	move.w 454(sp),d0
    6002:	42a7           	clr.l -(sp)
    6004:	2f00           	move.l d0,-(sp)
    6006:	2f2f 01d0      	move.l 464(sp),-(sp)
    600a:	2f2f 0056      	move.l 86(sp),-(sp)
    600e:	4eba 0b6e      	jsr 6b7e <TestRow>(pc)
    6012:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2; 
    6016:	722a           	moveq #42,d1
    6018:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff; 
    601c:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<9;i2++) {
    6020:	42af 00d2      	clr.l 210(sp)
    6024:	605c           	bra.s 6082 <TestZoom4Picture+0x2366>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    6026:	202f 00d2      	move.l 210(sp),d0
    602a:	d080           	add.l d0,d0
    602c:	2200           	move.l d0,d1
    602e:	5281           	addq.l #1,d1
    6030:	7000           	moveq #0,d0
    6032:	302f 01c6      	move.w 454(sp),d0
    6036:	2f01           	move.l d1,-(sp)
    6038:	2f00           	move.l d0,-(sp)
    603a:	2f2f 01d0      	move.l 464(sp),-(sp)
    603e:	2f2f 0056      	move.l 86(sp),-(sp)
    6042:	4eba 0b3a      	jsr 6b7e <TestRow>(pc)
    6046:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    604a:	702a           	moveq #42,d0
    604c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    6050:	202f 00d2      	move.l 210(sp),d0
    6054:	5280           	addq.l #1,d0
    6056:	d080           	add.l d0,d0
    6058:	2200           	move.l d0,d1
    605a:	7000           	moveq #0,d0
    605c:	302f 01c6      	move.w 454(sp),d0
    6060:	2f01           	move.l d1,-(sp)
    6062:	2f00           	move.l d0,-(sp)
    6064:	2f2f 01d0      	move.l 464(sp),-(sp)
    6068:	2f2f 0056      	move.l 86(sp),-(sp)
    606c:	4eba 0b10      	jsr 6b7e <TestRow>(pc)
    6070:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6074:	722a           	moveq #42,d1
    6076:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    607a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {
    607e:	52af 00d2      	addq.l #1,210(sp)
    6082:	7008           	moveq #8,d0
    6084:	b0af 00d2      	cmp.l 210(sp),d0
    6088:	6c9c           	bge.s 6026 <TestZoom4Picture+0x230a>
  } 

  for(int i=0;i<7;i++) {
    608a:	42af 00ce      	clr.l 206(sp)
    608e:	6000 00cc      	bra.w 615c <TestZoom4Picture+0x2440>
    for(int i2=0;i2<4;i2++) {  
    6092:	42af 00ca      	clr.l 202(sp)
    6096:	6036           	bra.s 60ce <TestZoom4Picture+0x23b2>
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    6098:	7213           	moveq #19,d1
    609a:	d2af 00ca      	add.l 202(sp),d1
    609e:	202f 00ce      	move.l 206(sp),d0
    60a2:	eb88           	lsl.l #5,d0
    60a4:	d280           	add.l d0,d1
    60a6:	7000           	moveq #0,d0
    60a8:	302f 01c6      	move.w 454(sp),d0
    60ac:	2f01           	move.l d1,-(sp)
    60ae:	2f00           	move.l d0,-(sp)
    60b0:	2f2f 01d0      	move.l 464(sp),-(sp)
    60b4:	2f2f 0056      	move.l 86(sp),-(sp)
    60b8:	4eba 0ac4      	jsr 6b7e <TestRow>(pc)
    60bc:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    60c0:	722a           	moveq #42,d1
    60c2:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    60c6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<4;i2++) {  
    60ca:	52af 00ca      	addq.l #1,202(sp)
    60ce:	7003           	moveq #3,d0
    60d0:	b0af 00ca      	cmp.l 202(sp),d0
    60d4:	6cc2           	bge.s 6098 <TestZoom4Picture+0x237c>
    }
    
    for(int i2=0;i2<14;i2++) {
    60d6:	42af 00c6      	clr.l 198(sp)
    60da:	6074           	bra.s 6150 <TestZoom4Picture+0x2434>
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    60dc:	202f 00ce      	move.l 206(sp),d0
    60e0:	eb88           	lsl.l #5,d0
    60e2:	307c 0017      	movea.w #23,a0
    60e6:	d1c0           	adda.l d0,a0
    60e8:	202f 00c6      	move.l 198(sp),d0
    60ec:	d080           	add.l d0,d0
    60ee:	2208           	move.l a0,d1
    60f0:	d280           	add.l d0,d1
    60f2:	7000           	moveq #0,d0
    60f4:	302f 01c6      	move.w 454(sp),d0
    60f8:	2f01           	move.l d1,-(sp)
    60fa:	2f00           	move.l d0,-(sp)
    60fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    6100:	2f2f 0056      	move.l 86(sp),-(sp)
    6104:	4eba 0a78      	jsr 6b7e <TestRow>(pc)
    6108:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    610c:	722a           	moveq #42,d1
    610e:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    6112:	202f 00ce      	move.l 206(sp),d0
    6116:	eb88           	lsl.l #5,d0
    6118:	307c 0018      	movea.w #24,a0
    611c:	d1c0           	adda.l d0,a0
    611e:	202f 00c6      	move.l 198(sp),d0
    6122:	d080           	add.l d0,d0
    6124:	2208           	move.l a0,d1
    6126:	d280           	add.l d0,d1
    6128:	7000           	moveq #0,d0
    612a:	302f 01c6      	move.w 454(sp),d0
    612e:	2f01           	move.l d1,-(sp)
    6130:	2f00           	move.l d0,-(sp)
    6132:	2f2f 01d0      	move.l 464(sp),-(sp)
    6136:	2f2f 0056      	move.l 86(sp),-(sp)
    613a:	4eba 0a42      	jsr 6b7e <TestRow>(pc)
    613e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6142:	702a           	moveq #42,d0
    6144:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6148:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {
    614c:	52af 00c6      	addq.l #1,198(sp)
    6150:	720d           	moveq #13,d1
    6152:	b2af 00c6      	cmp.l 198(sp),d1
    6156:	6c84           	bge.s 60dc <TestZoom4Picture+0x23c0>
  for(int i=0;i<7;i++) {
    6158:	52af 00ce      	addq.l #1,206(sp)
    615c:	7006           	moveq #6,d0
    615e:	b0af 00ce      	cmp.l 206(sp),d0
    6162:	6c00 ff2e      	bge.w 6092 <TestZoom4Picture+0x2376>
    }
  }

  for(int i2=0;i2<4;i2++) {  
    6166:	42af 00c2      	clr.l 194(sp)
    616a:	6032           	bra.s 619e <TestZoom4Picture+0x2482>
    TestRow( valsupposed, valactual, mask, 243+i2);
    616c:	222f 00c2      	move.l 194(sp),d1
    6170:	0681 0000 00f3 	addi.l #243,d1
    6176:	7000           	moveq #0,d0
    6178:	302f 01c6      	move.w 454(sp),d0
    617c:	2f01           	move.l d1,-(sp)
    617e:	2f00           	move.l d0,-(sp)
    6180:	2f2f 01d0      	move.l 464(sp),-(sp)
    6184:	2f2f 0056      	move.l 86(sp),-(sp)
    6188:	4eba 09f4      	jsr 6b7e <TestRow>(pc)
    618c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6190:	722a           	moveq #42,d1
    6192:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6196:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {  
    619a:	52af 00c2      	addq.l #1,194(sp)
    619e:	7003           	moveq #3,d0
    61a0:	b0af 00c2      	cmp.l 194(sp),d0
    61a4:	6cc6           	bge.s 616c <TestZoom4Picture+0x2450>
  }

  for(int i2=0;i2<12;i2++) {
    61a6:	42af 00be      	clr.l 190(sp)
    61aa:	6060           	bra.s 620c <TestZoom4Picture+0x24f0>
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    61ac:	202f 00be      	move.l 190(sp),d0
    61b0:	d080           	add.l d0,d0
    61b2:	2200           	move.l d0,d1
    61b4:	0681 0000 00f7 	addi.l #247,d1
    61ba:	7000           	moveq #0,d0
    61bc:	302f 01c6      	move.w 454(sp),d0
    61c0:	2f01           	move.l d1,-(sp)
    61c2:	2f00           	move.l d0,-(sp)
    61c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    61c8:	2f2f 0056      	move.l 86(sp),-(sp)
    61cc:	4eba 09b0      	jsr 6b7e <TestRow>(pc)
    61d0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61d4:	722a           	moveq #42,d1
    61d6:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    61da:	707c           	moveq #124,d0
    61dc:	d0af 00be      	add.l 190(sp),d0
    61e0:	d080           	add.l d0,d0
    61e2:	2200           	move.l d0,d1
    61e4:	7000           	moveq #0,d0
    61e6:	302f 01c6      	move.w 454(sp),d0
    61ea:	2f01           	move.l d1,-(sp)
    61ec:	2f00           	move.l d0,-(sp)
    61ee:	2f2f 01d0      	move.l 464(sp),-(sp)
    61f2:	2f2f 0056      	move.l 86(sp),-(sp)
    61f6:	4eba 0986      	jsr 6b7e <TestRow>(pc)
    61fa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61fe:	702a           	moveq #42,d0
    6200:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6204:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    6208:	52af 00be      	addq.l #1,190(sp)
    620c:	720b           	moveq #11,d1
    620e:	b2af 00be      	cmp.l 190(sp),d1
    6212:	6c98           	bge.s 61ac <TestZoom4Picture+0x2490>
  }

  tmp = source;
    6214:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    621a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6220:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    6226:	4878 0001      	pea 1 <_start+0x1>
    622a:	4878 000e      	pea e <_start+0xe>
    622e:	2f2f 0056      	move.l 86(sp),-(sp)
    6232:	2f2f 006a      	move.l 106(sp),-(sp)
    6236:	4eba b894      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    623a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    623e:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    6244:	2c40           	movea.l d0,a6
    6246:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    624a:	202f 004e      	move.l 78(sp),d0
    624e:	5880           	addq.l #4,d0
    6250:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom15;
    6254:	2f7c 0000 bd6c 	move.l #48492,74(sp)
    625a:	004a 

  mask = 0x0000;
    625c:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<8;i2++) {
    6260:	42af 00ba      	clr.l 186(sp)
    6264:	605a           	bra.s 62c0 <TestZoom4Picture+0x25a4>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6266:	202f 00ba      	move.l 186(sp),d0
    626a:	d080           	add.l d0,d0
    626c:	2200           	move.l d0,d1
    626e:	7000           	moveq #0,d0
    6270:	302f 01c6      	move.w 454(sp),d0
    6274:	2f01           	move.l d1,-(sp)
    6276:	2f00           	move.l d0,-(sp)
    6278:	2f2f 01d0      	move.l 464(sp),-(sp)
    627c:	2f2f 0056      	move.l 86(sp),-(sp)
    6280:	4eba 08fc      	jsr 6b7e <TestRow>(pc)
    6284:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6288:	722a           	moveq #42,d1
    628a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    628e:	202f 00ba      	move.l 186(sp),d0
    6292:	d080           	add.l d0,d0
    6294:	2200           	move.l d0,d1
    6296:	5281           	addq.l #1,d1
    6298:	7000           	moveq #0,d0
    629a:	302f 01c6      	move.w 454(sp),d0
    629e:	2f01           	move.l d1,-(sp)
    62a0:	2f00           	move.l d0,-(sp)
    62a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    62a6:	2f2f 0056      	move.l 86(sp),-(sp)
    62aa:	4eba 08d2      	jsr 6b7e <TestRow>(pc)
    62ae:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    62b2:	702a           	moveq #42,d0
    62b4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    62b8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    62bc:	52af 00ba      	addq.l #1,186(sp)
    62c0:	7207           	moveq #7,d1
    62c2:	b2af 00ba      	cmp.l 186(sp),d1
    62c6:	6c9e           	bge.s 6266 <TestZoom4Picture+0x254a>
  }

  for(int i=0;i<7;i++) {
    62c8:	42af 00b6      	clr.l 182(sp)
    62cc:	6000 00de      	bra.w 63ac <TestZoom4Picture+0x2690>
    for(int i2=0;i2<3;i2++) {  
    62d0:	42af 00b2      	clr.l 178(sp)
    62d4:	603e           	bra.s 6314 <TestZoom4Picture+0x25f8>
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    62d6:	307c 0010      	movea.w #16,a0
    62da:	d1ef 00b2      	adda.l 178(sp),a0
    62de:	222f 00b6      	move.l 182(sp),d1
    62e2:	2001           	move.l d1,d0
    62e4:	eb88           	lsl.l #5,d0
    62e6:	d081           	add.l d1,d0
    62e8:	2208           	move.l a0,d1
    62ea:	d280           	add.l d0,d1
    62ec:	7000           	moveq #0,d0
    62ee:	302f 01c6      	move.w 454(sp),d0
    62f2:	2f01           	move.l d1,-(sp)
    62f4:	2f00           	move.l d0,-(sp)
    62f6:	2f2f 01d0      	move.l 464(sp),-(sp)
    62fa:	2f2f 0056      	move.l 86(sp),-(sp)
    62fe:	4eba 087e      	jsr 6b7e <TestRow>(pc)
    6302:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6306:	702a           	moveq #42,d0
    6308:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    630c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<3;i2++) {  
    6310:	52af 00b2      	addq.l #1,178(sp)
    6314:	7202           	moveq #2,d1
    6316:	b2af 00b2      	cmp.l 178(sp),d1
    631a:	6cba           	bge.s 62d6 <TestZoom4Picture+0x25ba>
    }
    
    for(int i2=0;i2<15;i2++) {
    631c:	42af 00ae      	clr.l 174(sp)
    6320:	607c           	bra.s 639e <TestZoom4Picture+0x2682>
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    6322:	222f 00b6      	move.l 182(sp),d1
    6326:	2001           	move.l d1,d0
    6328:	eb88           	lsl.l #5,d0
    632a:	2040           	movea.l d0,a0
    632c:	d1c1           	adda.l d1,a0
    632e:	41e8 0013      	lea 19(a0),a0
    6332:	202f 00ae      	move.l 174(sp),d0
    6336:	d080           	add.l d0,d0
    6338:	2208           	move.l a0,d1
    633a:	d280           	add.l d0,d1
    633c:	7000           	moveq #0,d0
    633e:	302f 01c6      	move.w 454(sp),d0
    6342:	2f01           	move.l d1,-(sp)
    6344:	2f00           	move.l d0,-(sp)
    6346:	2f2f 01d0      	move.l 464(sp),-(sp)
    634a:	2f2f 0056      	move.l 86(sp),-(sp)
    634e:	4eba 082e      	jsr 6b7e <TestRow>(pc)
    6352:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6356:	702a           	moveq #42,d0
    6358:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    635c:	222f 00b6      	move.l 182(sp),d1
    6360:	2001           	move.l d1,d0
    6362:	eb88           	lsl.l #5,d0
    6364:	2040           	movea.l d0,a0
    6366:	d1c1           	adda.l d1,a0
    6368:	41e8 0013      	lea 19(a0),a0
    636c:	202f 00ae      	move.l 174(sp),d0
    6370:	d080           	add.l d0,d0
    6372:	2208           	move.l a0,d1
    6374:	d280           	add.l d0,d1
    6376:	7000           	moveq #0,d0
    6378:	302f 01c6      	move.w 454(sp),d0
    637c:	2f01           	move.l d1,-(sp)
    637e:	2f00           	move.l d0,-(sp)
    6380:	2f2f 01d0      	move.l 464(sp),-(sp)
    6384:	2f2f 0056      	move.l 86(sp),-(sp)
    6388:	4eba 07f4      	jsr 6b7e <TestRow>(pc)
    638c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6390:	722a           	moveq #42,d1
    6392:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6396:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {
    639a:	52af 00ae      	addq.l #1,174(sp)
    639e:	700e           	moveq #14,d0
    63a0:	b0af 00ae      	cmp.l 174(sp),d0
    63a4:	6c00 ff7c      	bge.w 6322 <TestZoom4Picture+0x2606>
  for(int i=0;i<7;i++) {
    63a8:	52af 00b6      	addq.l #1,182(sp)
    63ac:	7206           	moveq #6,d1
    63ae:	b2af 00b6      	cmp.l 182(sp),d1
    63b2:	6c00 ff1c      	bge.w 62d0 <TestZoom4Picture+0x25b4>
    }
  }

  for(int i2=0;i2<3;i2++) {  
    63b6:	42af 00aa      	clr.l 170(sp)
    63ba:	6032           	bra.s 63ee <TestZoom4Picture+0x26d2>
    TestRow( valsupposed, valactual, mask, 247+i2);
    63bc:	222f 00aa      	move.l 170(sp),d1
    63c0:	0681 0000 00f7 	addi.l #247,d1
    63c6:	7000           	moveq #0,d0
    63c8:	302f 01c6      	move.w 454(sp),d0
    63cc:	2f01           	move.l d1,-(sp)
    63ce:	2f00           	move.l d0,-(sp)
    63d0:	2f2f 01d0      	move.l 464(sp),-(sp)
    63d4:	2f2f 0056      	move.l 86(sp),-(sp)
    63d8:	4eba 07a4      	jsr 6b7e <TestRow>(pc)
    63dc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    63e0:	702a           	moveq #42,d0
    63e2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    63e6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<3;i2++) {  
    63ea:	52af 00aa      	addq.l #1,170(sp)
    63ee:	7202           	moveq #2,d1
    63f0:	b2af 00aa      	cmp.l 170(sp),d1
    63f4:	6cc6           	bge.s 63bc <TestZoom4Picture+0x26a0>
  }

  for(int i2=0;i2<10;i2++) {
    63f6:	42af 00a6      	clr.l 166(sp)
    63fa:	6060           	bra.s 645c <TestZoom4Picture+0x2740>
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    63fc:	707d           	moveq #125,d0
    63fe:	d0af 00a6      	add.l 166(sp),d0
    6402:	d080           	add.l d0,d0
    6404:	2200           	move.l d0,d1
    6406:	7000           	moveq #0,d0
    6408:	302f 01c6      	move.w 454(sp),d0
    640c:	2f01           	move.l d1,-(sp)
    640e:	2f00           	move.l d0,-(sp)
    6410:	2f2f 01d0      	move.l 464(sp),-(sp)
    6414:	2f2f 0056      	move.l 86(sp),-(sp)
    6418:	4eba 0764      	jsr 6b7e <TestRow>(pc)
    641c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6420:	702a           	moveq #42,d0
    6422:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    6426:	202f 00a6      	move.l 166(sp),d0
    642a:	d080           	add.l d0,d0
    642c:	2200           	move.l d0,d1
    642e:	0681 0000 00fb 	addi.l #251,d1
    6434:	7000           	moveq #0,d0
    6436:	302f 01c6      	move.w 454(sp),d0
    643a:	2f01           	move.l d1,-(sp)
    643c:	2f00           	move.l d0,-(sp)
    643e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6442:	2f2f 0056      	move.l 86(sp),-(sp)
    6446:	4eba 0736      	jsr 6b7e <TestRow>(pc)
    644a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    644e:	722a           	moveq #42,d1
    6450:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6454:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {
    6458:	52af 00a6      	addq.l #1,166(sp)
    645c:	7009           	moveq #9,d0
    645e:	b0af 00a6      	cmp.l 166(sp),d0
    6462:	6c98           	bge.s 63fc <TestZoom4Picture+0x26e0>
  }

  tmp = source;
    6464:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    646a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6470:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    6476:	4878 0001      	pea 1 <_start+0x1>
    647a:	4878 000f      	pea f <_start+0xf>
    647e:	2f2f 0056      	move.l 86(sp),-(sp)
    6482:	2f2f 006a      	move.l 106(sp),-(sp)
    6486:	4eba b644      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    648a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    648e:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    6494:	2c40           	movea.l d0,a6
    6496:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    649a:	222f 004e      	move.l 78(sp),d1
    649e:	5881           	addq.l #4,d1
    64a0:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom16;
    64a4:	2f7c 0000 bd98 	move.l #48536,74(sp)
    64aa:	004a 

  mask = 0x0000;
    64ac:	426f 01c6      	clr.w 454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    64b0:	7000           	moveq #0,d0
    64b2:	302f 01c6      	move.w 454(sp),d0
    64b6:	42a7           	clr.l -(sp)
    64b8:	2f00           	move.l d0,-(sp)
    64ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    64be:	2f2f 0056      	move.l 86(sp),-(sp)
    64c2:	4eba 06ba      	jsr 6b7e <TestRow>(pc)
    64c6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    64ca:	702a           	moveq #42,d0
    64cc:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    64d0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    64d4:	42af 00a2      	clr.l 162(sp)
    64d8:	605a           	bra.s 6534 <TestZoom4Picture+0x2818>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    64da:	202f 00a2      	move.l 162(sp),d0
    64de:	d080           	add.l d0,d0
    64e0:	2200           	move.l d0,d1
    64e2:	7000           	moveq #0,d0
    64e4:	302f 01c6      	move.w 454(sp),d0
    64e8:	2f01           	move.l d1,-(sp)
    64ea:	2f00           	move.l d0,-(sp)
    64ec:	2f2f 01d0      	move.l 464(sp),-(sp)
    64f0:	2f2f 0056      	move.l 86(sp),-(sp)
    64f4:	4eba 0688      	jsr 6b7e <TestRow>(pc)
    64f8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    64fc:	722a           	moveq #42,d1
    64fe:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6502:	202f 00a2      	move.l 162(sp),d0
    6506:	d080           	add.l d0,d0
    6508:	2200           	move.l d0,d1
    650a:	5281           	addq.l #1,d1
    650c:	7000           	moveq #0,d0
    650e:	302f 01c6      	move.w 454(sp),d0
    6512:	2f01           	move.l d1,-(sp)
    6514:	2f00           	move.l d0,-(sp)
    6516:	2f2f 01d0      	move.l 464(sp),-(sp)
    651a:	2f2f 0056      	move.l 86(sp),-(sp)
    651e:	4eba 065e      	jsr 6b7e <TestRow>(pc)
    6522:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6526:	702a           	moveq #42,d0
    6528:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    652c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    6530:	52af 00a2      	addq.l #1,162(sp)
    6534:	7205           	moveq #5,d1
    6536:	b2af 00a2      	cmp.l 162(sp),d1
    653a:	6c9e           	bge.s 64da <TestZoom4Picture+0x27be>
  }

  for(int i=0;i<7;i++) {
    653c:	42af 009e      	clr.l 158(sp)
    6540:	6000 00e6      	bra.w 6628 <TestZoom4Picture+0x290c>
    for(int i2=0;i2<2;i2++) {  
    6544:	42af 009a      	clr.l 154(sp)
    6548:	6040           	bra.s 658a <TestZoom4Picture+0x286e>
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    654a:	307c 000d      	movea.w #13,a0
    654e:	d1ef 009a      	adda.l 154(sp),a0
    6552:	222f 009e      	move.l 158(sp),d1
    6556:	2001           	move.l d1,d0
    6558:	e988           	lsl.l #4,d0
    655a:	d081           	add.l d1,d0
    655c:	d080           	add.l d0,d0
    655e:	2208           	move.l a0,d1
    6560:	d280           	add.l d0,d1
    6562:	7000           	moveq #0,d0
    6564:	302f 01c6      	move.w 454(sp),d0
    6568:	2f01           	move.l d1,-(sp)
    656a:	2f00           	move.l d0,-(sp)
    656c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6570:	2f2f 0056      	move.l 86(sp),-(sp)
    6574:	4eba 0608      	jsr 6b7e <TestRow>(pc)
    6578:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    657c:	702a           	moveq #42,d0
    657e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6582:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<2;i2++) {  
    6586:	52af 009a      	addq.l #1,154(sp)
    658a:	7201           	moveq #1,d1
    658c:	b2af 009a      	cmp.l 154(sp),d1
    6590:	6cb8           	bge.s 654a <TestZoom4Picture+0x282e>
    }
    
    for(int i2=0;i2<16;i2++) {
    6592:	42af 0096      	clr.l 150(sp)
    6596:	6000 0082      	bra.w 661a <TestZoom4Picture+0x28fe>
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    659a:	222f 009e      	move.l 158(sp),d1
    659e:	2001           	move.l d1,d0
    65a0:	e988           	lsl.l #4,d0
    65a2:	d081           	add.l d1,d0
    65a4:	d080           	add.l d0,d0
    65a6:	2040           	movea.l d0,a0
    65a8:	41e8 0010      	lea 16(a0),a0
    65ac:	202f 0096      	move.l 150(sp),d0
    65b0:	d080           	add.l d0,d0
    65b2:	2208           	move.l a0,d1
    65b4:	d280           	add.l d0,d1
    65b6:	7000           	moveq #0,d0
    65b8:	302f 01c6      	move.w 454(sp),d0
    65bc:	2f01           	move.l d1,-(sp)
    65be:	2f00           	move.l d0,-(sp)
    65c0:	2f2f 01d0      	move.l 464(sp),-(sp)
    65c4:	2f2f 0056      	move.l 86(sp),-(sp)
    65c8:	4eba 05b4      	jsr 6b7e <TestRow>(pc)
    65cc:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    65d0:	702a           	moveq #42,d0
    65d2:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    65d6:	222f 009e      	move.l 158(sp),d1
    65da:	2001           	move.l d1,d0
    65dc:	e988           	lsl.l #4,d0
    65de:	d081           	add.l d1,d0
    65e0:	d080           	add.l d0,d0
    65e2:	2040           	movea.l d0,a0
    65e4:	41e8 0011      	lea 17(a0),a0
    65e8:	202f 0096      	move.l 150(sp),d0
    65ec:	d080           	add.l d0,d0
    65ee:	2208           	move.l a0,d1
    65f0:	d280           	add.l d0,d1
    65f2:	7000           	moveq #0,d0
    65f4:	302f 01c6      	move.w 454(sp),d0
    65f8:	2f01           	move.l d1,-(sp)
    65fa:	2f00           	move.l d0,-(sp)
    65fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    6600:	2f2f 0056      	move.l 86(sp),-(sp)
    6604:	4eba 0578      	jsr 6b7e <TestRow>(pc)
    6608:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    660c:	722a           	moveq #42,d1
    660e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6612:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {
    6616:	52af 0096      	addq.l #1,150(sp)
    661a:	700f           	moveq #15,d0
    661c:	b0af 0096      	cmp.l 150(sp),d0
    6620:	6c00 ff78      	bge.w 659a <TestZoom4Picture+0x287e>
  for(int i=0;i<7;i++) {
    6624:	52af 009e      	addq.l #1,158(sp)
    6628:	7206           	moveq #6,d1
    662a:	b2af 009e      	cmp.l 158(sp),d1
    662e:	6c00 ff14      	bge.w 6544 <TestZoom4Picture+0x2828>
    }
  }

  for(int i2=0;i2<2;i2++) {
    6632:	42af 0092      	clr.l 146(sp)
    6636:	6032           	bra.s 666a <TestZoom4Picture+0x294e>
    TestRow( valsupposed, valactual, mask, 251+i2);
    6638:	222f 0092      	move.l 146(sp),d1
    663c:	0681 0000 00fb 	addi.l #251,d1
    6642:	7000           	moveq #0,d0
    6644:	302f 01c6      	move.w 454(sp),d0
    6648:	2f01           	move.l d1,-(sp)
    664a:	2f00           	move.l d0,-(sp)
    664c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6650:	2f2f 0056      	move.l 86(sp),-(sp)
    6654:	4eba 0528      	jsr 6b7e <TestRow>(pc)
    6658:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    665c:	702a           	moveq #42,d0
    665e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6662:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<2;i2++) {
    6666:	52af 0092      	addq.l #1,146(sp)
    666a:	7201           	moveq #1,d1
    666c:	b2af 0092      	cmp.l 146(sp),d1
    6670:	6cc6           	bge.s 6638 <TestZoom4Picture+0x291c>
  }

  for(int i2=0;i2<8;i2++) {
    6672:	42af 008e      	clr.l 142(sp)
    6676:	6060           	bra.s 66d8 <TestZoom4Picture+0x29bc>
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    6678:	202f 008e      	move.l 142(sp),d0
    667c:	d080           	add.l d0,d0
    667e:	2200           	move.l d0,d1
    6680:	0681 0000 00fd 	addi.l #253,d1
    6686:	7000           	moveq #0,d0
    6688:	302f 01c6      	move.w 454(sp),d0
    668c:	2f01           	move.l d1,-(sp)
    668e:	2f00           	move.l d0,-(sp)
    6690:	2f2f 01d0      	move.l 464(sp),-(sp)
    6694:	2f2f 0056      	move.l 86(sp),-(sp)
    6698:	4eba 04e4      	jsr 6b7e <TestRow>(pc)
    669c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66a0:	702a           	moveq #42,d0
    66a2:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    66a6:	707f           	moveq #127,d0
    66a8:	d0af 008e      	add.l 142(sp),d0
    66ac:	d080           	add.l d0,d0
    66ae:	2200           	move.l d0,d1
    66b0:	7000           	moveq #0,d0
    66b2:	302f 01c6      	move.w 454(sp),d0
    66b6:	2f01           	move.l d1,-(sp)
    66b8:	2f00           	move.l d0,-(sp)
    66ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    66be:	2f2f 0056      	move.l 86(sp),-(sp)
    66c2:	4eba 04ba      	jsr 6b7e <TestRow>(pc)
    66c6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66ca:	722a           	moveq #42,d1
    66cc:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    66d0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    66d4:	52af 008e      	addq.l #1,142(sp)
    66d8:	7007           	moveq #7,d0
    66da:	b0af 008e      	cmp.l 142(sp),d0
    66de:	6c98           	bge.s 6678 <TestZoom4Picture+0x295c>
  }

  tmp = source;
    66e0:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    66e6:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    66ec:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    66f2:	4878 0001      	pea 1 <_start+0x1>
    66f6:	4878 0010      	pea 10 <_start+0x10>
    66fa:	2f2f 0056      	move.l 86(sp),-(sp)
    66fe:	2f2f 006a      	move.l 106(sp),-(sp)
    6702:	4eba b3c8      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    6706:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    670a:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    6710:	2c40           	movea.l d0,a6
    6712:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6716:	222f 004e      	move.l 78(sp),d1
    671a:	5881           	addq.l #4,d1
    671c:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom17;
    6720:	2f7c 0000 bdc4 	move.l #48580,74(sp)
    6726:	004a 

  mask = 0xffff;
    6728:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<5;i2++) {
    672e:	42af 008a      	clr.l 138(sp)
    6732:	605a           	bra.s 678e <TestZoom4Picture+0x2a72>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6734:	202f 008a      	move.l 138(sp),d0
    6738:	d080           	add.l d0,d0
    673a:	2200           	move.l d0,d1
    673c:	7000           	moveq #0,d0
    673e:	302f 01c6      	move.w 454(sp),d0
    6742:	2f01           	move.l d1,-(sp)
    6744:	2f00           	move.l d0,-(sp)
    6746:	2f2f 01d0      	move.l 464(sp),-(sp)
    674a:	2f2f 0056      	move.l 86(sp),-(sp)
    674e:	4eba 042e      	jsr 6b7e <TestRow>(pc)
    6752:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6756:	702a           	moveq #42,d0
    6758:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    675c:	202f 008a      	move.l 138(sp),d0
    6760:	d080           	add.l d0,d0
    6762:	2200           	move.l d0,d1
    6764:	5281           	addq.l #1,d1
    6766:	7000           	moveq #0,d0
    6768:	302f 01c6      	move.w 454(sp),d0
    676c:	2f01           	move.l d1,-(sp)
    676e:	2f00           	move.l d0,-(sp)
    6770:	2f2f 01d0      	move.l 464(sp),-(sp)
    6774:	2f2f 0056      	move.l 86(sp),-(sp)
    6778:	4eba 0404      	jsr 6b7e <TestRow>(pc)
    677c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6780:	722a           	moveq #42,d1
    6782:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6786:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {
    678a:	52af 008a      	addq.l #1,138(sp)
    678e:	7004           	moveq #4,d0
    6790:	b0af 008a      	cmp.l 138(sp),d0
    6794:	6c9e           	bge.s 6734 <TestZoom4Picture+0x2a18>
  }

  for(int i=0;i<7;i++) {
    6796:	42af 0086      	clr.l 134(sp)
    679a:	6000 00d4      	bra.w 6870 <TestZoom4Picture+0x2b54>
      TestRow( valsupposed, valactual, mask, 10+i*35);
    679e:	222f 0086      	move.l 134(sp),d1
    67a2:	2001           	move.l d1,d0
    67a4:	e988           	lsl.l #4,d0
    67a6:	d081           	add.l d1,d0
    67a8:	d080           	add.l d0,d0
    67aa:	2040           	movea.l d0,a0
    67ac:	d1c1           	adda.l d1,a0
    67ae:	41e8 000a      	lea 10(a0),a0
    67b2:	7000           	moveq #0,d0
    67b4:	302f 01c6      	move.w 454(sp),d0
    67b8:	2f08           	move.l a0,-(sp)
    67ba:	2f00           	move.l d0,-(sp)
    67bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    67c0:	2f2f 0056      	move.l 86(sp),-(sp)
    67c4:	4eba 03b8      	jsr 6b7e <TestRow>(pc)
    67c8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    67cc:	722a           	moveq #42,d1
    67ce:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    67d2:	466f 01c6      	not.w 454(sp)
    
    for(int i2=0;i2<17;i2++) {
    67d6:	42af 0082      	clr.l 130(sp)
    67da:	6000 0086      	bra.w 6862 <TestZoom4Picture+0x2b46>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    67de:	222f 0086      	move.l 134(sp),d1
    67e2:	2001           	move.l d1,d0
    67e4:	e988           	lsl.l #4,d0
    67e6:	d081           	add.l d1,d0
    67e8:	d080           	add.l d0,d0
    67ea:	2040           	movea.l d0,a0
    67ec:	d1c1           	adda.l d1,a0
    67ee:	41e8 000b      	lea 11(a0),a0
    67f2:	202f 0082      	move.l 130(sp),d0
    67f6:	d080           	add.l d0,d0
    67f8:	2208           	move.l a0,d1
    67fa:	d280           	add.l d0,d1
    67fc:	7000           	moveq #0,d0
    67fe:	302f 01c6      	move.w 454(sp),d0
    6802:	2f01           	move.l d1,-(sp)
    6804:	2f00           	move.l d0,-(sp)
    6806:	2f2f 01d0      	move.l 464(sp),-(sp)
    680a:	2f2f 0056      	move.l 86(sp),-(sp)
    680e:	4eba 036e      	jsr 6b7e <TestRow>(pc)
    6812:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6816:	702a           	moveq #42,d0
    6818:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    681c:	222f 0086      	move.l 134(sp),d1
    6820:	2001           	move.l d1,d0
    6822:	e988           	lsl.l #4,d0
    6824:	d081           	add.l d1,d0
    6826:	d080           	add.l d0,d0
    6828:	2040           	movea.l d0,a0
    682a:	d1c1           	adda.l d1,a0
    682c:	41e8 000c      	lea 12(a0),a0
    6830:	202f 0082      	move.l 130(sp),d0
    6834:	d080           	add.l d0,d0
    6836:	2208           	move.l a0,d1
    6838:	d280           	add.l d0,d1
    683a:	7000           	moveq #0,d0
    683c:	302f 01c6      	move.w 454(sp),d0
    6840:	2f01           	move.l d1,-(sp)
    6842:	2f00           	move.l d0,-(sp)
    6844:	2f2f 01d0      	move.l 464(sp),-(sp)
    6848:	2f2f 0056      	move.l 86(sp),-(sp)
    684c:	4eba 0330      	jsr 6b7e <TestRow>(pc)
    6850:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6854:	722a           	moveq #42,d1
    6856:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    685a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<17;i2++) {
    685e:	52af 0082      	addq.l #1,130(sp)
    6862:	7010           	moveq #16,d0
    6864:	b0af 0082      	cmp.l 130(sp),d0
    6868:	6c00 ff74      	bge.w 67de <TestZoom4Picture+0x2ac2>
  for(int i=0;i<7;i++) {
    686c:	52af 0086      	addq.l #1,134(sp)
    6870:	7206           	moveq #6,d1
    6872:	b2af 0086      	cmp.l 134(sp),d1
    6876:	6c00 ff26      	bge.w 679e <TestZoom4Picture+0x2a82>
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    687a:	7000           	moveq #0,d0
    687c:	302f 01c6      	move.w 454(sp),d0
    6880:	4878 00ff      	pea ff <FreeDisplay+0x1f>
    6884:	2f00           	move.l d0,-(sp)
    6886:	2f2f 01d0      	move.l 464(sp),-(sp)
    688a:	2f2f 0056      	move.l 86(sp),-(sp)
    688e:	4eba 02ee      	jsr 6b7e <TestRow>(pc)
    6892:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6896:	702a           	moveq #42,d0
    6898:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    689c:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<7;i2++) {
    68a0:	42af 007e      	clr.l 126(sp)
    68a4:	6064           	bra.s 690a <TestZoom4Picture+0x2bee>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    68a6:	202f 007e      	move.l 126(sp),d0
    68aa:	0680 0000 0080 	addi.l #128,d0
    68b0:	d080           	add.l d0,d0
    68b2:	2200           	move.l d0,d1
    68b4:	7000           	moveq #0,d0
    68b6:	302f 01c6      	move.w 454(sp),d0
    68ba:	2f01           	move.l d1,-(sp)
    68bc:	2f00           	move.l d0,-(sp)
    68be:	2f2f 01d0      	move.l 464(sp),-(sp)
    68c2:	2f2f 0056      	move.l 86(sp),-(sp)
    68c6:	4eba 02b6      	jsr 6b7e <TestRow>(pc)
    68ca:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    68ce:	722a           	moveq #42,d1
    68d0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    68d4:	202f 007e      	move.l 126(sp),d0
    68d8:	d080           	add.l d0,d0
    68da:	2200           	move.l d0,d1
    68dc:	0681 0000 0101 	addi.l #257,d1
    68e2:	7000           	moveq #0,d0
    68e4:	302f 01c6      	move.w 454(sp),d0
    68e8:	2f01           	move.l d1,-(sp)
    68ea:	2f00           	move.l d0,-(sp)
    68ec:	2f2f 01d0      	move.l 464(sp),-(sp)
    68f0:	2f2f 0056      	move.l 86(sp),-(sp)
    68f4:	4eba 0288      	jsr 6b7e <TestRow>(pc)
    68f8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    68fc:	702a           	moveq #42,d0
    68fe:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6902:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {
    6906:	52af 007e      	addq.l #1,126(sp)
    690a:	7206           	moveq #6,d1
    690c:	b2af 007e      	cmp.l 126(sp),d1
    6910:	6c94           	bge.s 68a6 <TestZoom4Picture+0x2b8a>
  }   

  tmp = source;
    6912:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6918:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    691e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    6924:	4878 0001      	pea 1 <_start+0x1>
    6928:	4878 0011      	pea 11 <_start+0x11>
    692c:	2f2f 0056      	move.l 86(sp),-(sp)
    6930:	2f2f 006a      	move.l 106(sp),-(sp)
    6934:	4eba b196      	jsr 1acc <Zoom_ZoomIntoPicture>(pc)
    6938:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    693c:	2039 004d 2c68 	move.l 4d2c68 <GfxBase>,d0
    6942:	2c40           	movea.l d0,a6
    6944:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6948:	202f 004e      	move.l 78(sp),d0
    694c:	5880           	addq.l #4,d0
    694e:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom18;
    6952:	2f7c 0000 bdf0 	move.l #48624,74(sp)
    6958:	004a 

  mask = 0xffff;
    695a:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);
    6960:	7000           	moveq #0,d0
    6962:	302f 01c6      	move.w 454(sp),d0
    6966:	42a7           	clr.l -(sp)
    6968:	2f00           	move.l d0,-(sp)
    696a:	2f2f 01d0      	move.l 464(sp),-(sp)
    696e:	2f2f 0056      	move.l 86(sp),-(sp)
    6972:	4eba 020a      	jsr 6b7e <TestRow>(pc)
    6976:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    697a:	722a           	moveq #42,d1
    697c:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    6980:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<4;i2++) {
    6984:	42af 007a      	clr.l 122(sp)
    6988:	605c           	bra.s 69e6 <TestZoom4Picture+0x2cca>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    698a:	202f 007a      	move.l 122(sp),d0
    698e:	d080           	add.l d0,d0
    6990:	2200           	move.l d0,d1
    6992:	5281           	addq.l #1,d1
    6994:	7000           	moveq #0,d0
    6996:	302f 01c6      	move.w 454(sp),d0
    699a:	2f01           	move.l d1,-(sp)
    699c:	2f00           	move.l d0,-(sp)
    699e:	2f2f 01d0      	move.l 464(sp),-(sp)
    69a2:	2f2f 0056      	move.l 86(sp),-(sp)
    69a6:	4eba 01d6      	jsr 6b7e <TestRow>(pc)
    69aa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    69ae:	702a           	moveq #42,d0
    69b0:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    69b4:	202f 007a      	move.l 122(sp),d0
    69b8:	5280           	addq.l #1,d0
    69ba:	d080           	add.l d0,d0
    69bc:	2200           	move.l d0,d1
    69be:	7000           	moveq #0,d0
    69c0:	302f 01c6      	move.w 454(sp),d0
    69c4:	2f01           	move.l d1,-(sp)
    69c6:	2f00           	move.l d0,-(sp)
    69c8:	2f2f 01d0      	move.l 464(sp),-(sp)
    69cc:	2f2f 0056      	move.l 86(sp),-(sp)
    69d0:	4eba 01ac      	jsr 6b7e <TestRow>(pc)
    69d4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    69d8:	722a           	moveq #42,d1
    69da:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    69de:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    69e2:	52af 007a      	addq.l #1,122(sp)
    69e6:	7003           	moveq #3,d0
    69e8:	b0af 007a      	cmp.l 122(sp),d0
    69ec:	6c9c           	bge.s 698a <TestZoom4Picture+0x2c6e>
  }

  for(int i=0;i<7;i++) {  
    69ee:	42af 0076      	clr.l 118(sp)
    69f2:	6000 009c      	bra.w 6a90 <TestZoom4Picture+0x2d74>
    for(int i2=0;i2<18;i2++) {
    69f6:	42af 0072      	clr.l 114(sp)
    69fa:	6000 0086      	bra.w 6a82 <TestZoom4Picture+0x2d66>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    69fe:	222f 0076      	move.l 118(sp),d1
    6a02:	2001           	move.l d1,d0
    6a04:	e988           	lsl.l #4,d0
    6a06:	d081           	add.l d1,d0
    6a08:	d080           	add.l d0,d0
    6a0a:	2040           	movea.l d0,a0
    6a0c:	d1c1           	adda.l d1,a0
    6a0e:	41e8 000b      	lea 11(a0),a0
    6a12:	202f 0072      	move.l 114(sp),d0
    6a16:	d080           	add.l d0,d0
    6a18:	2208           	move.l a0,d1
    6a1a:	d280           	add.l d0,d1
    6a1c:	7000           	moveq #0,d0
    6a1e:	302f 01c6      	move.w 454(sp),d0
    6a22:	2f01           	move.l d1,-(sp)
    6a24:	2f00           	move.l d0,-(sp)
    6a26:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a2a:	2f2f 0056      	move.l 86(sp),-(sp)
    6a2e:	4eba 014e      	jsr 6b7e <TestRow>(pc)
    6a32:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6a36:	722a           	moveq #42,d1
    6a38:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6a3c:	222f 0076      	move.l 118(sp),d1
    6a40:	2001           	move.l d1,d0
    6a42:	e988           	lsl.l #4,d0
    6a44:	d081           	add.l d1,d0
    6a46:	d080           	add.l d0,d0
    6a48:	2040           	movea.l d0,a0
    6a4a:	d1c1           	adda.l d1,a0
    6a4c:	41e8 000c      	lea 12(a0),a0
    6a50:	202f 0072      	move.l 114(sp),d0
    6a54:	d080           	add.l d0,d0
    6a56:	2208           	move.l a0,d1
    6a58:	d280           	add.l d0,d1
    6a5a:	7000           	moveq #0,d0
    6a5c:	302f 01c6      	move.w 454(sp),d0
    6a60:	2f01           	move.l d1,-(sp)
    6a62:	2f00           	move.l d0,-(sp)
    6a64:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a68:	2f2f 0056      	move.l 86(sp),-(sp)
    6a6c:	4eba 0110      	jsr 6b7e <TestRow>(pc)
    6a70:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6a74:	702a           	moveq #42,d0
    6a76:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6a7a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) {
    6a7e:	52af 0072      	addq.l #1,114(sp)
    6a82:	7211           	moveq #17,d1
    6a84:	b2af 0072      	cmp.l 114(sp),d1
    6a88:	6c00 ff74      	bge.w 69fe <TestZoom4Picture+0x2ce2>
  for(int i=0;i<7;i++) {  
    6a8c:	52af 0076      	addq.l #1,118(sp)
    6a90:	7006           	moveq #6,d0
    6a92:	b0af 0076      	cmp.l 118(sp),d0
    6a96:	6c00 ff5e      	bge.w 69f6 <TestZoom4Picture+0x2cda>
    }
  } 

  for(int i2=0;i2<4;i2++) {
    6a9a:	42af 006e      	clr.l 110(sp)
    6a9e:	6064           	bra.s 6b04 <TestZoom4Picture+0x2de8>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6aa0:	202f 006e      	move.l 110(sp),d0
    6aa4:	0680 0000 0080 	addi.l #128,d0
    6aaa:	d080           	add.l d0,d0
    6aac:	2200           	move.l d0,d1
    6aae:	7000           	moveq #0,d0
    6ab0:	302f 01c6      	move.w 454(sp),d0
    6ab4:	2f01           	move.l d1,-(sp)
    6ab6:	2f00           	move.l d0,-(sp)
    6ab8:	2f2f 01d0      	move.l 464(sp),-(sp)
    6abc:	2f2f 0056      	move.l 86(sp),-(sp)
    6ac0:	4eba 00bc      	jsr 6b7e <TestRow>(pc)
    6ac4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6ac8:	722a           	moveq #42,d1
    6aca:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6ace:	202f 006e      	move.l 110(sp),d0
    6ad2:	d080           	add.l d0,d0
    6ad4:	2200           	move.l d0,d1
    6ad6:	0681 0000 0101 	addi.l #257,d1
    6adc:	7000           	moveq #0,d0
    6ade:	302f 01c6      	move.w 454(sp),d0
    6ae2:	2f01           	move.l d1,-(sp)
    6ae4:	2f00           	move.l d0,-(sp)
    6ae6:	2f2f 01d0      	move.l 464(sp),-(sp)
    6aea:	2f2f 0056      	move.l 86(sp),-(sp)
    6aee:	4eba 008e      	jsr 6b7e <TestRow>(pc)
    6af2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6af6:	702a           	moveq #42,d0
    6af8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6afc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6b00:	52af 006e      	addq.l #1,110(sp)
    6b04:	7203           	moveq #3,d1
    6b06:	b2af 006e      	cmp.l 110(sp),d1
    6b0a:	6c94           	bge.s 6aa0 <TestZoom4Picture+0x2d84>
  }
  TestRow( valsupposed, valactual, mask, 0);
    6b0c:	7000           	moveq #0,d0
    6b0e:	302f 01c6      	move.w 454(sp),d0
    6b12:	42a7           	clr.l -(sp)
    6b14:	2f00           	move.l d0,-(sp)
    6b16:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b1a:	2f2f 0056      	move.l 86(sp),-(sp)
    6b1e:	4eba 005e      	jsr 6b7e <TestRow>(pc)
    6b22:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6b26:	702a           	moveq #42,d0
    6b28:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6b2c:	466f 01c6      	not.w 454(sp)
  FreeMem( source, (ZMLINESIZE+4)*272);
    6b30:	2f6f 005e 0042 	move.l 94(sp),66(sp)
    6b36:	2f7c 0000 30e0 	move.l #12512,62(sp)
    6b3c:	003e 
    6b3e:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    6b44:	2c40           	movea.l d0,a6
    6b46:	226f 0042      	movea.l 66(sp),a1
    6b4a:	202f 003e      	move.l 62(sp),d0
    6b4e:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    6b52:	2f6f 004e 003a 	move.l 78(sp),58(sp)
    6b58:	2f7c 0000 30e0 	move.l #12512,54(sp)
    6b5e:	0036 
    6b60:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    6b66:	2c40           	movea.l d0,a6
    6b68:	226f 003a      	movea.l 58(sp),a1
    6b6c:	202f 0036      	move.l 54(sp),d0
    6b70:	4eae ff2e      	jsr -210(a6)
}
    6b74:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    6b78:	4fef 01d0      	lea 464(sp),sp
    6b7c:	4e75           	rts

00006b7e <TestRow>:

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    6b7e:	4fef ff40      	lea -192(sp),sp
    6b82:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
    6b86:	202f 00e0      	move.l 224(sp),d0
    6b8a:	3000           	move.w d0,d0
    6b8c:	3f40 0016      	move.w d0,22(sp)
  
  char str[ 100] = { 0 };
    6b90:	42af 001c      	clr.l 28(sp)
    6b94:	7020           	moveq #32,d0
    6b96:	d08f           	add.l sp,d0
    6b98:	7260           	moveq #96,d1
    6b9a:	2f01           	move.l d1,-(sp)
    6b9c:	42a7           	clr.l -(sp)
    6b9e:	2f00           	move.l d0,-(sp)
    6ba0:	4eba 020c      	jsr 6dae <memset>(pc)
    6ba4:	4fef 000c      	lea 12(sp),sp
  UWORD data[2];
  data[1] = numberofline;
    6ba8:	202f 00e4      	move.l 228(sp),d0
    6bac:	3f40 001a      	move.w d0,26(sp)

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    6bb0:	42af 00d0      	clr.l 208(sp)
    6bb4:	6000 00d4      	bra.w 6c8a <TestRow+0x10c>
    if( (*testpattern++ ^ xormask) != *destination++) {
    6bb8:	202f 00d8      	move.l 216(sp),d0
    6bbc:	2200           	move.l d0,d1
    6bbe:	5481           	addq.l #2,d1
    6bc0:	2f41 00d8      	move.l d1,216(sp)
    6bc4:	2040           	movea.l d0,a0
    6bc6:	3010           	move.w (a0),d0
    6bc8:	322f 0016      	move.w 22(sp),d1
    6bcc:	b141           	eor.w d0,d1
    6bce:	202f 00dc      	move.l 220(sp),d0
    6bd2:	2400           	move.l d0,d2
    6bd4:	5482           	addq.l #2,d2
    6bd6:	2f42 00dc      	move.l d2,220(sp)
    6bda:	2040           	movea.l d0,a0
    6bdc:	3010           	move.w (a0),d0
    6bde:	b041           	cmp.w d1,d0
    6be0:	6700 00a4      	beq.w 6c86 <TestRow+0x108>
      data[0] = i;
    6be4:	202f 00d0      	move.l 208(sp),d0
    6be8:	3f40 0018      	move.w d0,24(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    6bec:	2f7c 0000 8528 	move.l #34088,164(sp)
    6bf2:	00a4 
    6bf4:	702b           	moveq #43,d0
    6bf6:	4600           	not.b d0
    6bf8:	d08f           	add.l sp,d0
    6bfa:	0680 ffff ff44 	addi.l #-188,d0
    6c00:	2f40 00a0      	move.l d0,160(sp)
    6c04:	2f7c 0000 724c 	move.l #29260,156(sp)
    6c0a:	009c 
    6c0c:	722b           	moveq #43,d1
    6c0e:	4601           	not.b d1
    6c10:	d28f           	add.l sp,d1
    6c12:	0681 ffff ff48 	addi.l #-184,d1
    6c18:	2f41 0098      	move.l d1,152(sp)
    6c1c:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    6c22:	2c40           	movea.l d0,a6
    6c24:	206f 00a4      	movea.l 164(sp),a0
    6c28:	226f 00a0      	movea.l 160(sp),a1
    6c2c:	246f 009c      	movea.l 156(sp),a2
    6c30:	266f 0098      	movea.l 152(sp),a3
    6c34:	4eae fdf6      	jsr -522(a6)
    6c38:	2f40 0094      	move.l d0,148(sp)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    6c3c:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    6c42:	2c40           	movea.l d0,a6
    6c44:	4eae ffc4      	jsr -60(a6)
    6c48:	2f40 0090      	move.l d0,144(sp)
    6c4c:	202f 0090      	move.l 144(sp),d0
    6c50:	2f40 008c      	move.l d0,140(sp)
    6c54:	742b           	moveq #43,d2
    6c56:	4602           	not.b d2
    6c58:	d48f           	add.l sp,d2
    6c5a:	0682 ffff ff48 	addi.l #-184,d2
    6c60:	2f42 0088      	move.l d2,136(sp)
    6c64:	7064           	moveq #100,d0
    6c66:	2f40 0084      	move.l d0,132(sp)
    6c6a:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    6c70:	2c40           	movea.l d0,a6
    6c72:	222f 008c      	move.l 140(sp),d1
    6c76:	242f 0088      	move.l 136(sp),d2
    6c7a:	262f 0084      	move.l 132(sp),d3
    6c7e:	4eae ffd0      	jsr -48(a6)
    6c82:	2f40 0080      	move.l d0,128(sp)
  for(int i=0;i<21;i++) {
    6c86:	52af 00d0      	addq.l #1,208(sp)
    6c8a:	7214           	moveq #20,d1
    6c8c:	b2af 00d0      	cmp.l 208(sp),d1
    6c90:	6c00 ff26      	bge.w 6bb8 <TestRow+0x3a>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    6c94:	206f 00d8      	movea.l 216(sp),a0
    6c98:	3010           	move.w (a0),d0
    6c9a:	322f 0016      	move.w 22(sp),d1
    6c9e:	b141           	eor.w d0,d1
    6ca0:	206f 00dc      	movea.l 220(sp),a0
    6ca4:	3010           	move.w (a0),d0
    6ca6:	b340           	eor.w d1,d0
    6ca8:	3000           	move.w d0,d0
    6caa:	0280 0000 ffff 	andi.l #65535,d0
    6cb0:	0280 0000 ff00 	andi.l #65280,d0
    6cb6:	6700 00cc      	beq.w 6d84 <TestRow+0x206>
    data[0] = 21;
    6cba:	3f7c 0015 0018 	move.w #21,24(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    6cc0:	2f7c 0000 8528 	move.l #34088,204(sp)
    6cc6:	00cc 
    6cc8:	742b           	moveq #43,d2
    6cca:	4602           	not.b d2
    6ccc:	d48f           	add.l sp,d2
    6cce:	0682 ffff ff44 	addi.l #-188,d2
    6cd4:	2f42 00c8      	move.l d2,200(sp)
    6cd8:	2f7c 0000 724c 	move.l #29260,196(sp)
    6cde:	00c4 
    6ce0:	702b           	moveq #43,d0
    6ce2:	4600           	not.b d0
    6ce4:	d08f           	add.l sp,d0
    6ce6:	0680 ffff ff48 	addi.l #-184,d0
    6cec:	2f40 00c0      	move.l d0,192(sp)
    6cf0:	2039 004d 2c5c 	move.l 4d2c5c <SysBase>,d0
    6cf6:	2c40           	movea.l d0,a6
    6cf8:	206f 00cc      	movea.l 204(sp),a0
    6cfc:	226f 00c8      	movea.l 200(sp),a1
    6d00:	246f 00c4      	movea.l 196(sp),a2
    6d04:	266f 00c0      	movea.l 192(sp),a3
    6d08:	4eae fdf6      	jsr -522(a6)
    6d0c:	2f40 00bc      	move.l d0,188(sp)
                                                                           str);
    Write(  Output(), str, 100);
    6d10:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    6d16:	2c40           	movea.l d0,a6
    6d18:	4eae ffc4      	jsr -60(a6)
    6d1c:	2f40 00b8      	move.l d0,184(sp)
    6d20:	202f 00b8      	move.l 184(sp),d0
    6d24:	2f40 00b4      	move.l d0,180(sp)
    6d28:	722b           	moveq #43,d1
    6d2a:	4601           	not.b d1
    6d2c:	d28f           	add.l sp,d1
    6d2e:	0681 ffff ff48 	addi.l #-184,d1
    6d34:	2f41 00b0      	move.l d1,176(sp)
    6d38:	7464           	moveq #100,d2
    6d3a:	2f42 00ac      	move.l d2,172(sp)
    6d3e:	2039 004d 2c64 	move.l 4d2c64 <DOSBase>,d0
    6d44:	2c40           	movea.l d0,a6
    6d46:	222f 00b4      	move.l 180(sp),d1
    6d4a:	242f 00b0      	move.l 176(sp),d2
    6d4e:	262f 00ac      	move.l 172(sp),d3
    6d52:	4eae ffd0      	jsr -48(a6)
    6d56:	2f40 00a8      	move.l d0,168(sp)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
    6d5a:	206f 00dc      	movea.l 220(sp),a0
    6d5e:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6d60:	7200           	moveq #0,d1
    6d62:	3200           	move.w d0,d1
                                                   *testpattern,*destination);
    6d64:	206f 00d8      	movea.l 216(sp),a0
    6d68:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6d6a:	3000           	move.w d0,d0
    6d6c:	0280 0000 ffff 	andi.l #65535,d0
    6d72:	2f01           	move.l d1,-(sp)
    6d74:	2f00           	move.l d0,-(sp)
    6d76:	4879 0000 8558 	pea 8558 <rundemo.c.95627ee6+0x172>
    6d7c:	4eba 0162      	jsr 6ee0 <KPrintF>(pc)
    6d80:	4fef 000c      	lea 12(sp),sp
     
  }
}
    6d84:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    6d88:	4fef 00c0      	lea 192(sp),sp
    6d8c:	4e75           	rts

00006d8e <strlen>:
{
    6d8e:	598f           	subq.l #4,sp
	unsigned long t=0;
    6d90:	4297           	clr.l (sp)
    6d92:	6002           	bra.s 6d96 <strlen+0x8>
		t++;
    6d94:	5297           	addq.l #1,(sp)
	while(*s++)
    6d96:	202f 0008      	move.l 8(sp),d0
    6d9a:	2200           	move.l d0,d1
    6d9c:	5281           	addq.l #1,d1
    6d9e:	2f41 0008      	move.l d1,8(sp)
    6da2:	2040           	movea.l d0,a0
    6da4:	1010           	move.b (a0),d0
    6da6:	66ec           	bne.s 6d94 <strlen+0x6>
	return t;
    6da8:	2017           	move.l (sp),d0
}
    6daa:	588f           	addq.l #4,sp
    6dac:	4e75           	rts

00006dae <memset>:
{
    6dae:	4e55 fffc      	link.w a5,#-4
	unsigned char *ptr = (unsigned char *)dest;
    6db2:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
    6db8:	6014           	bra.s 6dce <memset+0x20>
		*ptr++ = val;
    6dba:	202d fffc      	move.l -4(a5),d0
    6dbe:	2200           	move.l d0,d1
    6dc0:	5281           	addq.l #1,d1
    6dc2:	2b41 fffc      	move.l d1,-4(a5)
    6dc6:	222d 000c      	move.l 12(a5),d1
    6dca:	2040           	movea.l d0,a0
    6dcc:	1081           	move.b d1,(a0)
	while(len-- > 0)
    6dce:	202d 0010      	move.l 16(a5),d0
    6dd2:	2200           	move.l d0,d1
    6dd4:	5381           	subq.l #1,d1
    6dd6:	2b41 0010      	move.l d1,16(a5)
    6dda:	4a80           	tst.l d0
    6ddc:	66dc           	bne.s 6dba <memset+0xc>
	return dest;
    6dde:	202d 0008      	move.l 8(a5),d0
}
    6de2:	4e5d           	unlk a5
    6de4:	4e75           	rts

00006de6 <memcpy>:
{
    6de6:	4e55 fff8      	link.w a5,#-8
    6dea:	2f02           	move.l d2,-(sp)
	char *d = (char *)dest;
    6dec:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = (const char *)src;
    6df2:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
    6df8:	6020           	bra.s 6e1a <memcpy+0x34>
		*d++ = *s++;
    6dfa:	222d fff8      	move.l -8(a5),d1
    6dfe:	2001           	move.l d1,d0
    6e00:	5280           	addq.l #1,d0
    6e02:	2b40 fff8      	move.l d0,-8(a5)
    6e06:	202d fffc      	move.l -4(a5),d0
    6e0a:	2400           	move.l d0,d2
    6e0c:	5282           	addq.l #1,d2
    6e0e:	2b42 fffc      	move.l d2,-4(a5)
    6e12:	2041           	movea.l d1,a0
    6e14:	1210           	move.b (a0),d1
    6e16:	2040           	movea.l d0,a0
    6e18:	1081           	move.b d1,(a0)
	while(len--)
    6e1a:	202d 0010      	move.l 16(a5),d0
    6e1e:	2200           	move.l d0,d1
    6e20:	5381           	subq.l #1,d1
    6e22:	2b41 0010      	move.l d1,16(a5)
    6e26:	4a80           	tst.l d0
    6e28:	66d0           	bne.s 6dfa <memcpy+0x14>
	return dest;
    6e2a:	202d 0008      	move.l 8(a5),d0
}
    6e2e:	241f           	move.l (sp)+,d2
    6e30:	4e5d           	unlk a5
    6e32:	4e75           	rts

00006e34 <memmove>:
{
    6e34:	4e55 fff0      	link.w a5,#-16
    6e38:	2f02           	move.l d2,-(sp)
	char *d = dest;
    6e3a:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = src;
    6e40:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
	if (d < s) {
    6e46:	202d fffc      	move.l -4(a5),d0
    6e4a:	b0ad fff8      	cmp.l -8(a5),d0
    6e4e:	6522           	bcs.s 6e72 <memmove+0x3e>
    6e50:	6032           	bra.s 6e84 <memmove+0x50>
			*d++ = *s++;
    6e52:	222d fff8      	move.l -8(a5),d1
    6e56:	2401           	move.l d1,d2
    6e58:	5282           	addq.l #1,d2
    6e5a:	2b42 fff8      	move.l d2,-8(a5)
    6e5e:	202d fffc      	move.l -4(a5),d0
    6e62:	2400           	move.l d0,d2
    6e64:	5282           	addq.l #1,d2
    6e66:	2b42 fffc      	move.l d2,-4(a5)
    6e6a:	2041           	movea.l d1,a0
    6e6c:	1210           	move.b (a0),d1
    6e6e:	2040           	movea.l d0,a0
    6e70:	1081           	move.b d1,(a0)
		while (len--)
    6e72:	202d 0010      	move.l 16(a5),d0
    6e76:	2200           	move.l d0,d1
    6e78:	5381           	subq.l #1,d1
    6e7a:	2b41 0010      	move.l d1,16(a5)
    6e7e:	4a80           	tst.l d0
    6e80:	66d0           	bne.s 6e52 <memmove+0x1e>
    6e82:	6052           	bra.s 6ed6 <memmove+0xa2>
		const char *lasts = s + (len - 1);
    6e84:	202d 0010      	move.l 16(a5),d0
    6e88:	5380           	subq.l #1,d0
    6e8a:	242d fff8      	move.l -8(a5),d2
    6e8e:	d480           	add.l d0,d2
    6e90:	2b42 fff4      	move.l d2,-12(a5)
		char *lastd = d + (len - 1);
    6e94:	202d 0010      	move.l 16(a5),d0
    6e98:	5380           	subq.l #1,d0
    6e9a:	222d fffc      	move.l -4(a5),d1
    6e9e:	d280           	add.l d0,d1
    6ea0:	2b41 fff0      	move.l d1,-16(a5)
    6ea4:	6020           	bra.s 6ec6 <memmove+0x92>
			*lastd-- = *lasts--;
    6ea6:	222d fff4      	move.l -12(a5),d1
    6eaa:	2401           	move.l d1,d2
    6eac:	5382           	subq.l #1,d2
    6eae:	2b42 fff4      	move.l d2,-12(a5)
    6eb2:	202d fff0      	move.l -16(a5),d0
    6eb6:	2400           	move.l d0,d2
    6eb8:	5382           	subq.l #1,d2
    6eba:	2b42 fff0      	move.l d2,-16(a5)
    6ebe:	2041           	movea.l d1,a0
    6ec0:	1210           	move.b (a0),d1
    6ec2:	2040           	movea.l d0,a0
    6ec4:	1081           	move.b d1,(a0)
		while (len--)
    6ec6:	202d 0010      	move.l 16(a5),d0
    6eca:	2200           	move.l d0,d1
    6ecc:	5381           	subq.l #1,d1
    6ece:	2b41 0010      	move.l d1,16(a5)
    6ed2:	4a80           	tst.l d0
    6ed4:	66d0           	bne.s 6ea6 <memmove+0x72>
	return dest;
    6ed6:	202d 0008      	move.l 8(a5),d0
}
    6eda:	241f           	move.l (sp)+,d2
    6edc:	4e5d           	unlk a5
    6ede:	4e75           	rts

00006ee0 <KPrintF>:
{
    6ee0:	4fef ff80      	lea -128(sp),sp
    6ee4:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    6ee8:	3039 00f0 ff60 	move.w f0ff60 <_end+0xa3d2b0>,d0
    6eee:	0c40 4eb9      	cmpi.w #20153,d0
    6ef2:	6722           	beq.s 6f16 <KPrintF+0x36>
    6ef4:	0c40 a00e      	cmpi.w #-24562,d0
    6ef8:	671c           	beq.s 6f16 <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    6efa:	2c79 004d 2c5c 	movea.l 4d2c5c <SysBase>,a6
    6f00:	206f 0090      	movea.l 144(sp),a0
    6f04:	43ef 0094      	lea 148(sp),a1
    6f08:	45f9 0000 723e 	lea 723e <KPutCharX>,a2
    6f0e:	97cb           	suba.l a3,a3
    6f10:	4eae fdf6      	jsr -522(a6)
    6f14:	602a           	bra.s 6f40 <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    6f16:	2c79 004d 2c5c 	movea.l 4d2c5c <SysBase>,a6
    6f1c:	206f 0090      	movea.l 144(sp),a0
    6f20:	43ef 0094      	lea 148(sp),a1
    6f24:	45f9 0000 724c 	lea 724c <PutChar>,a2
    6f2a:	47ef 000c      	lea 12(sp),a3
    6f2e:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    6f32:	2f0b           	move.l a3,-(sp)
    6f34:	4878 0056      	pea 56 <_start+0x56>
    6f38:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xa3d2b0>
    6f3e:	508f           	addq.l #8,sp
}
    6f40:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    6f44:	4fef 0080      	lea 128(sp),sp
    6f48:	4e75           	rts

00006f4a <warpmode>:

void warpmode(int on) // bool
{
    6f4a:	518f           	subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
    6f4c:	2f7c 00f0 ff60 	move.l #15794016,4(sp)
    6f52:	0004 
    if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
    6f54:	206f 0004      	movea.l 4(sp),a0
    6f58:	3010           	move.w (a0),d0
    6f5a:	0c40 4eb9      	cmpi.w #20153,d0
    6f5e:	670c           	beq.s 6f6c <warpmode+0x22>
    6f60:	206f 0004      	movea.l 4(sp),a0
    6f64:	3010           	move.w (a0),d0
    6f66:	0c40 a00e      	cmpi.w #-24562,d0
    6f6a:	6668           	bne.s 6fd4 <warpmode+0x8a>
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    6f6c:	4aaf 000c      	tst.l 12(sp)
    6f70:	6708           	beq.s 6f7a <warpmode+0x30>
    6f72:	203c 0000 857e 	move.l #34174,d0
    6f78:	6006           	bra.s 6f80 <warpmode+0x36>
    6f7a:	203c 0000 8588 	move.l #34184,d0
    6f80:	4878 0001      	pea 1 <_start+0x1>
    6f84:	220f           	move.l sp,d1
    6f86:	5e81           	addq.l #7,d1
    6f88:	2f01           	move.l d1,-(sp)
    6f8a:	42a7           	clr.l -(sp)
    6f8c:	2f00           	move.l d0,-(sp)
    6f8e:	4878 ffff      	pea ffffffff <_end+0xffb2d34f>
    6f92:	4878 0052      	pea 52 <_start+0x52>
    6f96:	206f 001c      	movea.l 28(sp),a0
    6f9a:	4e90           	jsr (a0)
    6f9c:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    6fa0:	4aaf 000c      	tst.l 12(sp)
    6fa4:	6708           	beq.s 6fae <warpmode+0x64>
    6fa6:	203c 0000 8593 	move.l #34195,d0
    6fac:	6006           	bra.s 6fb4 <warpmode+0x6a>
    6fae:	203c 0000 85ad 	move.l #34221,d0
    6fb4:	4878 0001      	pea 1 <_start+0x1>
    6fb8:	220f           	move.l sp,d1
    6fba:	5e81           	addq.l #7,d1
    6fbc:	2f01           	move.l d1,-(sp)
    6fbe:	42a7           	clr.l -(sp)
    6fc0:	2f00           	move.l d0,-(sp)
    6fc2:	4878 ffff      	pea ffffffff <_end+0xffb2d34f>
    6fc6:	4878 0052      	pea 52 <_start+0x52>
    6fca:	206f 001c      	movea.l 28(sp),a0
    6fce:	4e90           	jsr (a0)
    6fd0:	4fef 0018      	lea 24(sp),sp
	}
}
    6fd4:	508f           	addq.l #8,sp
    6fd6:	4e75           	rts

00006fd8 <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4)
{
    6fd8:	598f           	subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
    6fda:	2ebc 00f0 ff60 	move.l #15794016,(sp)
    if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    6fe0:	2057           	movea.l (sp),a0
    6fe2:	3010           	move.w (a0),d0
    6fe4:	0c40 4eb9      	cmpi.w #20153,d0
    6fe8:	670a           	beq.s 6ff4 <debug_cmd+0x1c>
    6fea:	2057           	movea.l (sp),a0
    6fec:	3010           	move.w (a0),d0
    6fee:	0c40 a00e      	cmpi.w #-24562,d0
    6ff2:	661e           	bne.s 7012 <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
    6ff4:	2f2f 0014      	move.l 20(sp),-(sp)
    6ff8:	2f2f 0014      	move.l 20(sp),-(sp)
    6ffc:	2f2f 0014      	move.l 20(sp),-(sp)
    7000:	2f2f 0014      	move.l 20(sp),-(sp)
    7004:	4878 0058      	pea 58 <_start+0x58>
    7008:	206f 0014      	movea.l 20(sp),a0
    700c:	4e90           	jsr (a0)
    700e:	4fef 0014      	lea 20(sp),sp
	}
}
    7012:	588f           	addq.l #4,sp
    7014:	4e75           	rts

00007016 <debug_clear>:
	barto_cmd_text,
};

void debug_clear()
{
	debug_cmd(barto_cmd_clear, 0, 0, 0);
    7016:	42a7           	clr.l -(sp)
    7018:	42a7           	clr.l -(sp)
    701a:	42a7           	clr.l -(sp)
    701c:	42a7           	clr.l -(sp)
    701e:	4eba ffb8      	jsr 6fd8 <debug_cmd>(pc)
    7022:	4fef 0010      	lea 16(sp),sp
}
    7026:	4e75           	rts

00007028 <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color)
{
    7028:	518f           	subq.l #8,sp
    702a:	2f02           	move.l d2,-(sp)
    702c:	226f 0010      	movea.l 16(sp),a1
    7030:	206f 0014      	movea.l 20(sp),a0
    7034:	222f 0018      	move.l 24(sp),d1
    7038:	202f 001c      	move.l 28(sp),d0
    703c:	3249           	movea.w a1,a1
    703e:	3f49 000a      	move.w a1,10(sp)
    7042:	3048           	movea.w a0,a0
    7044:	3f48 0008      	move.w a0,8(sp)
    7048:	3201           	move.w d1,d1
    704a:	3f41 0006      	move.w d1,6(sp)
    704e:	3000           	move.w d0,d0
    7050:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    7054:	302f 0006      	move.w 6(sp),d0
    7058:	48c0           	ext.l d0
    705a:	4840           	swap d0
    705c:	4240           	clr.w d0
    705e:	322f 0004      	move.w 4(sp),d1
    7062:	48c1           	ext.l d1
    7064:	8280           	or.l d0,d1
    7066:	302f 000a      	move.w 10(sp),d0
    706a:	48c0           	ext.l d0
    706c:	4840           	swap d0
    706e:	4240           	clr.w d0
    7070:	306f 0008      	movea.w 8(sp),a0
    7074:	2408           	move.l a0,d2
    7076:	8082           	or.l d2,d0
    7078:	2f2f 0020      	move.l 32(sp),-(sp)
    707c:	2f01           	move.l d1,-(sp)
    707e:	2f00           	move.l d0,-(sp)
    7080:	4878 0001      	pea 1 <_start+0x1>
    7084:	4eba ff52      	jsr 6fd8 <debug_cmd>(pc)
    7088:	4fef 0010      	lea 16(sp),sp
}
    708c:	241f           	move.l (sp)+,d2
    708e:	508f           	addq.l #8,sp
    7090:	4e75           	rts

00007092 <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color)
{
    7092:	518f           	subq.l #8,sp
    7094:	2f02           	move.l d2,-(sp)
    7096:	226f 0010      	movea.l 16(sp),a1
    709a:	206f 0014      	movea.l 20(sp),a0
    709e:	222f 0018      	move.l 24(sp),d1
    70a2:	202f 001c      	move.l 28(sp),d0
    70a6:	3249           	movea.w a1,a1
    70a8:	3f49 000a      	move.w a1,10(sp)
    70ac:	3048           	movea.w a0,a0
    70ae:	3f48 0008      	move.w a0,8(sp)
    70b2:	3201           	move.w d1,d1
    70b4:	3f41 0006      	move.w d1,6(sp)
    70b8:	3000           	move.w d0,d0
    70ba:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    70be:	302f 0006      	move.w 6(sp),d0
    70c2:	48c0           	ext.l d0
    70c4:	4840           	swap d0
    70c6:	4240           	clr.w d0
    70c8:	322f 0004      	move.w 4(sp),d1
    70cc:	48c1           	ext.l d1
    70ce:	8280           	or.l d0,d1
    70d0:	302f 000a      	move.w 10(sp),d0
    70d4:	48c0           	ext.l d0
    70d6:	4840           	swap d0
    70d8:	4240           	clr.w d0
    70da:	306f 0008      	movea.w 8(sp),a0
    70de:	2408           	move.l a0,d2
    70e0:	8082           	or.l d2,d0
    70e2:	2f2f 0020      	move.l 32(sp),-(sp)
    70e6:	2f01           	move.l d1,-(sp)
    70e8:	2f00           	move.l d0,-(sp)
    70ea:	4878 0002      	pea 2 <_start+0x2>
    70ee:	4eba fee8      	jsr 6fd8 <debug_cmd>(pc)
    70f2:	4fef 0010      	lea 16(sp),sp
}
    70f6:	241f           	move.l (sp)+,d2
    70f8:	508f           	addq.l #8,sp
    70fa:	4e75           	rts

000070fc <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color)
{
    70fc:	598f           	subq.l #4,sp
    70fe:	2f02           	move.l d2,-(sp)
    7100:	222f 000c      	move.l 12(sp),d1
    7104:	202f 0010      	move.l 16(sp),d0
    7108:	3201           	move.w d1,d1
    710a:	3f41 0006      	move.w d1,6(sp)
    710e:	3000           	move.w d0,d0
    7110:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
    7114:	202f 0014      	move.l 20(sp),d0
    7118:	322f 0006      	move.w 6(sp),d1
    711c:	48c1           	ext.l d1
    711e:	4841           	swap d1
    7120:	4241           	clr.w d1
    7122:	306f 0004      	movea.w 4(sp),a0
    7126:	2408           	move.l a0,d2
    7128:	8282           	or.l d2,d1
    712a:	2f2f 0018      	move.l 24(sp),-(sp)
    712e:	2f00           	move.l d0,-(sp)
    7130:	2f01           	move.l d1,-(sp)
    7132:	4878 0003      	pea 3 <_start+0x3>
    7136:	4eba fea0      	jsr 6fd8 <debug_cmd>(pc)
    713a:	4fef 0010      	lea 16(sp),sp
}
    713e:	241f           	move.l (sp)+,d2
    7140:	588f           	addq.l #4,sp
    7142:	4e75           	rts

00007144 <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    7144:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    7148:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    714c:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    7150:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    7154:	d041           	add.w d1,d0
	swap	d0
    7156:	4840           	swap d0
	clrw	d0
    7158:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    715a:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    715e:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    7162:	d081           	add.l d1,d0
	rts
    7164:	4e75           	rts

00007166 <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    7166:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    7168:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    716c:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    7170:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    7176:	6416           	bcc.s 718e <__udivsi3+0x28>
	movel	d0, d2
    7178:	2400           	move.l d0,d2
	clrw	d2
    717a:	4242           	clr.w d2
	swap	d2
    717c:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    717e:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    7180:	3002           	move.w d2,d0
	swap	d0
    7182:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    7184:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    7188:	84c1           	divu.w d1,d2
	movew	d2, d0
    718a:	3002           	move.w d2,d0
	jra	6f
    718c:	6030           	bra.s 71be <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    718e:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    7190:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    7192:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    7194:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    719a:	64f4           	bcc.s 7190 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    719c:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    719e:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    71a4:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    71a6:	c2c0           	mulu.w d0,d1
	swap	d2
    71a8:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    71aa:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    71ac:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    71ae:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    71b0:	660a           	bne.s 71bc <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    71b2:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    71b4:	6506           	bcs.s 71bc <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    71b6:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    71ba:	6302           	bls.s 71be <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    71bc:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    71be:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    71c0:	4e75           	rts

000071c2 <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    71c2:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    71c4:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    71c6:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    71ca:	6a04           	bpl.s 71d0 <__divsi3+0xe>
	negl	d1
    71cc:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    71ce:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    71d0:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    71d4:	6a04           	bpl.s 71da <__divsi3+0x18>
	negl	d0
    71d6:	4480           	neg.l d0
	negb	d2
    71d8:	4402           	neg.b d2

2:	movel	d1, sp@-
    71da:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    71dc:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    71de:	6186           	bsr.s 7166 <__udivsi3>
	addql	IMM (8), sp
    71e0:	508f           	addq.l #8,sp

	tstb	d2
    71e2:	4a02           	tst.b d2
	jpl	3f
    71e4:	6a02           	bpl.s 71e8 <__divsi3+0x26>
	negl	d0
    71e6:	4480           	neg.l d0

3:	movel	sp@+, d2
    71e8:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    71ea:	4e75           	rts

000071ec <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    71ec:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    71f0:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    71f4:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    71f6:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    71f8:	61c8           	bsr.s 71c2 <__divsi3>
	addql	IMM (8), sp
    71fa:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    71fc:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    7200:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7202:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    7204:	6100 ff3e      	bsr.w 7144 <__mulsi3>
	addql	IMM (8), sp
    7208:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    720a:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    720e:	9280           	sub.l d0,d1
	movel	d1, d0
    7210:	2001           	move.l d1,d0
	rts
    7212:	4e75           	rts

00007214 <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    7214:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7218:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    721c:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    721e:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    7220:	6100 ff44      	bsr.w 7166 <__udivsi3>
	addql	IMM (8), sp
    7224:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    7226:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    722a:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    722c:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    722e:	6100 ff14      	bsr.w 7144 <__mulsi3>
	addql	IMM (8), sp
    7232:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    7234:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    7238:	9280           	sub.l d0,d1
	movel	d1, d0
    723a:	2001           	move.l d1,d0
	rts
    723c:	4e75           	rts

0000723e <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    723e:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    7240:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    7244:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    7248:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    724a:	4e75           	rts

0000724c <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    724c:	16c0           	move.b d0,(a3)+
	rts
    724e:	4e75           	rts

00007250 <c2p1x1_8_c5_gen_init>:
	.text
	FUNC(c2p1x1_8_c5_gen_init)
	.globl	SYM (c2p1x1_8_c5_gen_init)

SYM(c2p1x1_8_c5_gen_init):
	movem.l d0-d7/a0-a6, .gi_saveregs	
    7250:	48f9 7fff 0000 	movem.l d0-a6,7290 <.gi_saveregs>
    7256:	7290 
	move.l  4(sp),d0
    7258:	202f 0004      	move.l 4(sp),d0
	move.l	8(sp),d1
    725c:	222f 0008      	move.l 8(sp),d1
	move.l	12(sp),d2
    7260:	242f 000c      	move.l 12(sp),d2
	move.l	16(sp),d3
    7264:	262f 0010      	move.l 16(sp),d3
	move.l  20(sp),d4
    7268:	282f 0014      	move.l 20(sp),d4
	move.l	24(sp),d5
    726c:	2a2f 0018      	move.l 24(sp),d5
	andi.l	IMM (0xffff),d0
    7270:	0280 0000 ffff 	andi.l #65535,d0
	mulu.w	d0,d3
    7276:	c6c0           	mulu.w d0,d3
	lsr.l	#3,d3
    7278:	e68b           	lsr.l #3,d3
	move.l	d3,c2p1x1_8_c5_gen_scroffs
    727a:	23c3 0000 75e6 	move.l d3,75e6 <c2p1x1_8_c5_gen_scroffs>
	mulu.w	d0,d1
    7280:	c2c0           	mulu.w d0,d1
	move.l	d1,c2p1x1_8_c5_gen_pixels
    7282:	23c1 0000 75ea 	move.l d1,75ea <c2p1x1_8_c5_gen_pixels>
	movem.l	.gi_saveregs,d0-d7/a0-a6
    7288:	4cfa 7fff 0004 	movem.l 7290 <.gi_saveregs>(pc),d0-a6
	rts
    728e:	4e75           	rts

00007290 <.gi_saveregs>:
	...

000072cc <c2p1x1_8_c5_gen>:
	.text
	FUNC(c2p1x1_8_c5_gen)
	.globl	SYM (c2p1x1_8_c5_gen)

SYM(c2p1x1_8_c5_gen):
	movem.l d0-d7/a0-a6,.c2p_saveregs	
    72cc:	48f9 7fff 0000 	movem.l d0-a6,75aa <.c2p_saveregs>
    72d2:	75aa 
	movem.l 4(sp),a0
    72d4:	4cef 0100 0004 	movem.l 4(sp),a0
	movem.l 8(sp),a1
    72da:	4cef 0200 0008 	movem.l 8(sp),a1
    move.l	IMM (0x33333333),d5
    72e0:	2a3c 3333 3333 	move.l #858993459,d5
	move.l	IMM (0x55555555),a6
    72e6:	2c7c 5555 5555 	movea.l #1431655765,a6

	add.w	#BPLSIZE,a1
    72ec:	d2fc 2bf8      	adda.w #11256,a1
	add.l	c2p1x1_8_c5_gen_scroffs,a1
    72f0:	d3fa 02f4      	adda.l 75e6 <c2p1x1_8_c5_gen_scroffs>(pc),a1

	move.l	c2p1x1_8_c5_gen_pixels,a2
    72f4:	247a 02f4      	movea.l 75ea <c2p1x1_8_c5_gen_pixels>(pc),a2
	add.l	a0,a2
    72f8:	d5c8           	adda.l a0,a2
	cmp.l	a0,a2
    72fa:	b5c8           	cmpa.l a0,a2
	beq	.none
    72fc:	6700 02a4      	beq.w 75a2 <.none>

	movem.l	a0-a1,-(sp)
    7300:	48e7 00c0      	movem.l a0-a1,-(sp)

	move.l	(a0)+,d0
    7304:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    7306:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7308:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    730a:	2618           	move.l (a0)+,d3

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    730c:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    7312:	c084           	and.l d4,d0
	and.l	d4,d1
    7314:	c284           	and.l d4,d1
	and.l	d4,d2
    7316:	c484           	and.l d4,d2
	and.l	d4,d3
    7318:	c684           	and.l d4,d3
	lsl.l	#4,d0
    731a:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    731c:	e989           	lsl.l #4,d1
	or.l	d2,d0
    731e:	8082           	or.l d2,d0
	or.l	d3,d1
    7320:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    7322:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7324:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    7326:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7328:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    732a:	c484           	and.l d4,d2
	and.l	d4,d6
    732c:	cc84           	and.l d4,d6
	and.l	d4,d3
    732e:	c684           	and.l d4,d3
	and.l	d4,d7
    7330:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    7332:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    7334:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    7336:	8486           	or.l d6,d2
	or.l	d7,d3
    7338:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    733a:	3c02           	move.w d2,d6
	move.w	d3,d7
    733c:	3e03           	move.w d3,d7
	move.w	d0,d2
    733e:	3400           	move.w d0,d2
	move.w	d1,d3
    7340:	3601           	move.w d1,d3
	swap	d2
    7342:	4842           	swap d2
	swap	d3
    7344:	4843           	swap d3
	move.w	d2,d0
    7346:	3002           	move.w d2,d0
	move.w	d3,d1
    7348:	3203           	move.w d3,d1
	move.w	d6,d2
    734a:	3406           	move.w d6,d2
	move.w	d7,d3
    734c:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    734e:	2c02           	move.l d2,d6
	move.l	d3,d7
    7350:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    7352:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7354:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    7356:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7358:	b387           	eor.l d1,d7
	and.l	d5,d6
    735a:	cc85           	and.l d5,d6
	and.l	d5,d7
    735c:	ce85           	and.l d5,d7
	eor.l	d6,d0
    735e:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7360:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    7362:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7364:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    7366:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7368:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    736a:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7370:	2c01           	move.l d1,d6
	move.l	d3,d7
    7372:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7374:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    7376:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7378:	b186           	eor.l d0,d6
	eor.l	d2,d7
    737a:	b587           	eor.l d2,d7
	bra	.start1
    737c:	6000 0088      	bra.w 7406 <.start1>

00007380 <.x1>:
.x1:
	move.l	(a0)+,d0
    7380:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    7382:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7384:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    7386:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    7388:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    738c:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    7392:	c084           	and.l d4,d0
	and.l	d4,d1
    7394:	c284           	and.l d4,d1
	and.l	d4,d2
    7396:	c484           	and.l d4,d2
	and.l	d4,d3
    7398:	c684           	and.l d4,d3
	lsl.l	#4,d0
    739a:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    739c:	e989           	lsl.l #4,d1
	or.l	d2,d0
    739e:	8082           	or.l d2,d0
	or.l	d3,d1
    73a0:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    73a2:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    73a4:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    73a6:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    73a8:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    73aa:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    73ae:	c484           	and.l d4,d2
	and.l	d4,d6
    73b0:	cc84           	and.l d4,d6
	and.l	d4,d3
    73b2:	c684           	and.l d4,d3
	and.l	d4,d7
    73b4:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    73b6:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    73b8:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    73ba:	8486           	or.l d6,d2
	or.l	d7,d3
    73bc:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    73be:	3c02           	move.w d2,d6
	move.w	d3,d7
    73c0:	3e03           	move.w d3,d7
	move.w	d0,d2
    73c2:	3400           	move.w d0,d2
	move.w	d1,d3
    73c4:	3601           	move.w d1,d3
	swap	d2
    73c6:	4842           	swap d2
	swap	d3
    73c8:	4843           	swap d3
	move.w	d2,d0
    73ca:	3002           	move.w d2,d0
	move.w	d3,d1
    73cc:	3203           	move.w d3,d1
	move.w	d6,d2
    73ce:	3406           	move.w d6,d2
	move.w	d7,d3
    73d0:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    73d2:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    73d6:	2c02           	move.l d2,d6
	move.l	d3,d7
    73d8:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    73da:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    73dc:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    73de:	b186           	eor.l d0,d6
	eor.l	d1,d7
    73e0:	b387           	eor.l d1,d7
	and.l	d5,d6
    73e2:	cc85           	and.l d5,d6
	and.l	d5,d7
    73e4:	ce85           	and.l d5,d7
	eor.l	d6,d0
    73e6:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    73e8:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    73ea:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    73ec:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    73ee:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    73f0:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    73f2:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    73f8:	2c01           	move.l d1,d6
	move.l	d3,d7
    73fa:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    73fc:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    73fe:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7400:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7402:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    7404:	22cd           	move.l a5,(a1)+

00007406 <.start1>:
.start1:
	and.l	d4,d6
    7406:	cc84           	and.l d4,d6
	and.l	d4,d7
    7408:	ce84           	and.l d4,d7
	eor.l	d6,d0
    740a:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    740c:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    740e:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    7410:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    7412:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    7414:	bf83           	eor.l d7,d3

	move.l	a6,d4
    7416:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    7418:	2c01           	move.l d1,d6
	move.l	d3,d7
    741a:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    741c:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    741e:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    7420:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7422:	b587           	eor.l d2,d7
	and.l	d4,d6
    7424:	cc84           	and.l d4,d6
	and.l	d4,d7
    7426:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7428:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    742a:	bf82           	eor.l d7,d2
	add.l	d6,d6
    742c:	dc86           	add.l d6,d6
	add.l	d7,d7
    742e:	de87           	add.l d7,d7
	eor.l	d1,d6
    7430:	b386           	eor.l d1,d6
	eor.l	d3,d7
    7432:	b787           	eor.l d3,d7

	move.l	d0,a4
    7434:	2840           	movea.l d0,a4
	move.l	d2,a5
    7436:	2a42           	movea.l d2,a5
	move.l	d6,a3
    7438:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    743a:	b5c8           	cmpa.l a0,a2
	bne	.x1
    743c:	6600 ff42      	bne.w 7380 <.x1>
	move.l	d7,-BPLSIZE(a1)
    7440:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    7444:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    7448:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    744c:	22cd           	move.l a5,(a1)+

	movem.l	(sp)+,a0-a1
    744e:	4cdf 0300      	movem.l (sp)+,a0-a1
	add.l	#BPLSIZE*4,a1
    7452:	d3fc 0000 afe0 	adda.l #45024,a1

	move.l	(a0)+,d0
    7458:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    745a:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    745c:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    745e:	2618           	move.l (a0)+,d3

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    7460:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    7466:	c084           	and.l d4,d0
	and.l	d4,d1
    7468:	c284           	and.l d4,d1
	and.l	d4,d2
    746a:	c484           	and.l d4,d2
	and.l	d4,d3
    746c:	c684           	and.l d4,d3
	lsr.l	#4,d2
    746e:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    7470:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    7472:	8082           	or.l d2,d0
	or.l	d3,d1
    7474:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    7476:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7478:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    747a:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    747c:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    747e:	c484           	and.l d4,d2
	and.l	d4,d6
    7480:	cc84           	and.l d4,d6
	and.l	d4,d3
    7482:	c684           	and.l d4,d3
	and.l	d4,d7
    7484:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    7486:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    7488:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    748a:	8486           	or.l d6,d2
	or.l	d7,d3
    748c:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    748e:	3c02           	move.w d2,d6
	move.w	d3,d7
    7490:	3e03           	move.w d3,d7
	move.w	d0,d2
    7492:	3400           	move.w d0,d2
	move.w	d1,d3
    7494:	3601           	move.w d1,d3
	swap	d2
    7496:	4842           	swap d2
	swap	d3
    7498:	4843           	swap d3
	move.w	d2,d0
    749a:	3002           	move.w d2,d0
	move.w	d3,d1
    749c:	3203           	move.w d3,d1
	move.w	d6,d2
    749e:	3406           	move.w d6,d2
	move.w	d7,d3
    74a0:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    74a2:	2c02           	move.l d2,d6
	move.l	d3,d7
    74a4:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    74a6:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    74a8:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    74aa:	b186           	eor.l d0,d6
	eor.l	d1,d7
    74ac:	b387           	eor.l d1,d7
	and.l	d5,d6
    74ae:	cc85           	and.l d5,d6
	and.l	d5,d7
    74b0:	ce85           	and.l d5,d7
	eor.l	d6,d0
    74b2:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    74b4:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    74b6:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    74b8:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    74ba:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    74bc:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    74be:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    74c4:	2c01           	move.l d1,d6
	move.l	d3,d7
    74c6:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    74c8:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    74ca:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    74cc:	b186           	eor.l d0,d6
	eor.l	d2,d7
    74ce:	b587           	eor.l d2,d7
	bra	.start2
    74d0:	6000 0088      	bra.w 755a <.start2>

000074d4 <.x2>:
.x2:
	move.l	(a0)+,d0
    74d4:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    74d6:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    74d8:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    74da:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    74dc:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    74e0:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    74e6:	c084           	and.l d4,d0
	and.l	d4,d1
    74e8:	c284           	and.l d4,d1
	and.l	d4,d2
    74ea:	c484           	and.l d4,d2
	and.l	d4,d3
    74ec:	c684           	and.l d4,d3
	lsr.l	#4,d2
    74ee:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    74f0:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    74f2:	8082           	or.l d2,d0
	or.l	d3,d1
    74f4:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    74f6:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    74f8:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    74fa:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    74fc:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    74fe:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    7502:	c484           	and.l d4,d2
	and.l	d4,d6
    7504:	cc84           	and.l d4,d6
	and.l	d4,d3
    7506:	c684           	and.l d4,d3
	and.l	d4,d7
    7508:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    750a:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    750c:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    750e:	8486           	or.l d6,d2
	or.l	d7,d3
    7510:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    7512:	3c02           	move.w d2,d6
	move.w	d3,d7
    7514:	3e03           	move.w d3,d7
	move.w	d0,d2
    7516:	3400           	move.w d0,d2
	move.w	d1,d3
    7518:	3601           	move.w d1,d3
	swap	d2
    751a:	4842           	swap d2
	swap	d3
    751c:	4843           	swap d3
	move.w	d2,d0
    751e:	3002           	move.w d2,d0
	move.w	d3,d1
    7520:	3203           	move.w d3,d1
	move.w	d6,d2
    7522:	3406           	move.w d6,d2
	move.w	d7,d3
    7524:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    7526:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    752a:	2c02           	move.l d2,d6
	move.l	d3,d7
    752c:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    752e:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7530:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    7532:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7534:	b387           	eor.l d1,d7
	and.l	d5,d6
    7536:	cc85           	and.l d5,d6
	and.l	d5,d7
    7538:	ce85           	and.l d5,d7
	eor.l	d6,d0
    753a:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    753c:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    753e:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7540:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    7542:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7544:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    7546:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    754c:	2c01           	move.l d1,d6
	move.l	d3,d7
    754e:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7550:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    7552:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7554:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7556:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    7558:	22cd           	move.l a5,(a1)+

0000755a <.start2>:
.start2:
	and.l	d4,d6
    755a:	cc84           	and.l d4,d6
	and.l	d4,d7
    755c:	ce84           	and.l d4,d7
	eor.l	d6,d0
    755e:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7560:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    7562:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    7564:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    7566:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    7568:	bf83           	eor.l d7,d3

	move.l	a6,d4
    756a:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    756c:	2c01           	move.l d1,d6
	move.l	d3,d7
    756e:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    7570:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    7572:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    7574:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7576:	b587           	eor.l d2,d7
	and.l	d4,d6
    7578:	cc84           	and.l d4,d6
	and.l	d4,d7
    757a:	ce84           	and.l d4,d7
	eor.l	d6,d0
    757c:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    757e:	bf82           	eor.l d7,d2
	add.l	d6,d6
    7580:	dc86           	add.l d6,d6
	add.l	d7,d7
    7582:	de87           	add.l d7,d7
	eor.l	d1,d6
    7584:	b386           	eor.l d1,d6
	eor.l	d3,d7
    7586:	b787           	eor.l d3,d7

	move.l	d0,a4
    7588:	2840           	movea.l d0,a4
	move.l	d2,a5
    758a:	2a42           	movea.l d2,a5
	move.l	d6,a3
    758c:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    758e:	b5c8           	cmpa.l a0,a2
	bne	.x2
    7590:	6600 ff42      	bne.w 74d4 <.x2>
	move.l	d7,-BPLSIZE(a1)
    7594:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    7598:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    759c:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    75a0:	22cd           	move.l a5,(a1)+

000075a2 <.none>:
.none:
	movem.l .c2p_saveregs,d0-d7/a0-a6
    75a2:	4cfa 7fff 0004 	movem.l 75aa <.c2p_saveregs>(pc),d0-a6
	rts
    75a8:	4e75           	rts

000075aa <.c2p_saveregs>:
	...

000075e6 <c2p1x1_8_c5_gen_scroffs>:
    75e6:	0000 0001      	ori.b #1,d0

000075ea <c2p1x1_8_c5_gen_pixels>:

.c2p_saveregs: .dcb.b 60


c2p1x1_8_c5_gen_scroffs: dc.l	1
    75ea:	0000 0001      	ori.b #1,d0
