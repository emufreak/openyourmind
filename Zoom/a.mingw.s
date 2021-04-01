
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
       2:	203c 0000 a56e 	move.l #42350,d0
       8:	0480 0000 a56e 	subi.l #42350,d0
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
      22:	41f9 0000 a56e 	lea a56e <__fini_array_end>,a0
      28:	2071 8800      	movea.l (0,a1,a0.l),a0
      2c:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      2e:	52af 0004      	addq.l #1,4(sp)
      32:	202f 0004      	move.l 4(sp),d0
      36:	b097           	cmp.l (sp),d0
      38:	65de           	bcs.s 18 <_start+0x18>

	count = __init_array_end - __init_array_start;
      3a:	203c 0000 a56e 	move.l #42350,d0
      40:	0480 0000 a56e 	subi.l #42350,d0
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
      5a:	41f9 0000 a56e 	lea a56e <__fini_array_end>,a0
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
      78:	203c 0000 a56e 	move.l #42350,d0
      7e:	0480 0000 a56e 	subi.l #42350,d0
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
      9a:	41f9 0000 a56e 	lea a56e <__fini_array_end>,a0
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
      b6:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
      bc:	3f68 0002 0002 	move.w 2(a0),2(sp)
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
      c2:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
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
      e6:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
      ec:	6722           	beq.s 110 <FreeDisplay+0x30>
      ee:	2f79 004d 2b68 	move.l 4d2b68 <Copperlist1>,16(sp)
      f4:	0010 
      f6:	2f6f 0018 000c 	move.l 24(sp),12(sp)
      fc:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
     102:	2c40           	movea.l d0,a6
     104:	226f 0010      	movea.l 16(sp),a1
     108:	202f 000c      	move.l 12(sp),d0
     10c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     110:	2039 004d 2b6c 	move.l 4d2b6c <Copperlist2>,d0
     116:	6722           	beq.s 13a <FreeDisplay+0x5a>
     118:	2f79 004d 2b6c 	move.l 4d2b6c <Copperlist2>,8(sp)
     11e:	0008 
     120:	2f6f 0018 0004 	move.l 24(sp),4(sp)
     126:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
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
     146:	2039 004d 2b70 	move.l 4d2b70 <DrawBuffer>,d0
     14c:	4240           	clr.w d0
     14e:	4840           	swap d0
     150:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     154:	2039 004d 2b70 	move.l 4d2b70 <DrawBuffer>,d0
     15a:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     15e:	2f79 004d 2b78 	move.l 4d2b78 <DrawCopper>,4(sp)
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
     17e:	2039 004d 2b70 	move.l 4d2b70 <DrawBuffer>,d0
     184:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     186:	2039 004d 2b74 	move.l 4d2b74 <ViewBuffer>,d0
     18c:	23c0 004d 2b70 	move.l d0,4d2b70 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     192:	2017           	move.l (sp),d0
     194:	23c0 004d 2b74 	move.l d0,4d2b74 <ViewBuffer>
}
     19a:	4fef 000c      	lea 12(sp),sp
     19e:	4e75           	rts

000001a0 <SwapCl>:

void SwapCl() {
     1a0:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     1a2:	2039 004d 2b78 	move.l 4d2b78 <DrawCopper>,d0
     1a8:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     1aa:	2039 004d 2b7c 	move.l 4d2b7c <ViewCopper>,d0
     1b0:	23c0 004d 2b78 	move.l d0,4d2b78 <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     1b6:	2017           	move.l (sp),d0
     1b8:	23c0 004d 2b7c 	move.l d0,4d2b7c <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     1be:	2039 004d 2b7c 	move.l 4d2b7c <ViewCopper>,d0
     1c4:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
     1ca:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     1ce:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
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
     2a6:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
     2ac:	317c 0020 009c 	move.w #32,156(a0)
     2b2:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
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
     2c2:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
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
     2e2:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
     2e8:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     2ee:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
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
     42e:	0681 0000 a888 	addi.l #43144,d1
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
     4c2:	2079 004d 2b84 	movea.l 4d2b84 <SysBase>,a0
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
     4e6:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
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
     514:	2079 004d 2b9c 	movea.l 4d2b9c <VBR>,a0
     51a:	41e8 006c      	lea 108(a0),a0
     51e:	20af 0004      	move.l 4(sp),(a0)
}
     522:	4e75           	rts

00000524 <GetInterruptHandler>:

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     524:	2079 004d 2b9c 	movea.l 4d2b9c <VBR>,a0
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
     57e:	23c0 004d 2b9c 	move.l d0,4d2b9c <VBR>
	SystemIrq=GetInterruptHandler(); //store interrupt register
     584:	4eba ff9e      	jsr 524 <GetInterruptHandler>(pc)
     588:	23c0 004d 2ba0 	move.l d0,4d2ba0 <SystemIrq>
}
     58e:	4e75           	rts

00000590 <FreeSystem>:

	//restore interrupts
	//SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
     590:	2079 004d 2b90 	movea.l 4d2b90 <GfxBase>,a0
     596:	2028 0026      	move.l 38(a0),d0
     59a:	2079 004d 2b88 	movea.l 4d2b88 <custom>,a0
     5a0:	2140 0080      	move.l d0,128(a0)
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
     5a4:	2079 004d 2b90 	movea.l 4d2b90 <GfxBase>,a0
     5aa:	2028 0032      	move.l 50(a0),d0
     5ae:	2079 004d 2b88 	movea.l 4d2b88 <custom>,a0
     5b4:	2140 0084      	move.l d0,132(a0)
	custom->copjmp1=0x7fff; //start coppper
     5b8:	2079 004d 2b88 	movea.l 4d2b88 <custom>,a0
     5be:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
     5c4:	3039 004d 2b96 	move.w 4d2b96 <SystemInts>,d0
     5ca:	2079 004d 2b88 	movea.l 4d2b88 <custom>,a0
     5d0:	0040 8000      	ori.w #-32768,d0
     5d4:	3140 009a      	move.w d0,154(a0)
	custom->dmacon=SystemDMA|0x8000;
     5d8:	3039 004d 2b98 	move.w 4d2b98 <SystemDMA>,d0
     5de:	2079 004d 2b88 	movea.l 4d2b88 <custom>,a0
     5e4:	0040 8000      	ori.w #-32768,d0
     5e8:	3140 0096      	move.w d0,150(a0)
	custom->adkcon=SystemADKCON|0x8000;
     5ec:	3039 004d 2b9a 	move.w 4d2b9a <SystemADKCON>,d0
     5f2:	2079 004d 2b88 	movea.l 4d2b88 <custom>,a0
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
     606:	2079 004d 2b88 	movea.l 4d2b88 <custom>,a0
     60c:	317c 0020 009c 	move.w #32,156(a0)
     612:	2079 004d 2b88 	movea.l 4d2b88 <custom>,a0
     618:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	frameCounter++;
     61e:	3039 004d 2ba8 	move.w 4d2ba8 <frameCounter>,d0
     624:	5240           	addq.w #1,d0
     626:	33c0 004d 2ba8 	move.w d0,4d2ba8 <frameCounter>
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
     646:	23c0 004d 2b84 	move.l d0,4d2b84 <SysBase>
	hw = (struct Custom*)0xdff000;
     64c:	23fc 00df f000 	move.l #14675968,4d2b80 <hw>
     652:	004d 2b80 

	SysBase = *((struct ExecBase**)4UL);
     656:	307c 0004      	movea.w #4,a0
     65a:	2010           	move.l (a0),d0
     65c:	23c0 004d 2b84 	move.l d0,4d2b84 <SysBase>
	custom = (struct Custom*)0xdff000;
     662:	23fc 00df f000 	move.l #14675968,4d2b88 <custom>
     668:	004d 2b88 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
     66c:	2f7c 0000 751a 	move.l #29978,68(sp)
     672:	0044 
     674:	42af 0040      	clr.l 64(sp)
     678:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
     67e:	2c40           	movea.l d0,a6
     680:	226f 0044      	movea.l 68(sp),a1
     684:	202f 0040      	move.l 64(sp),d0
     688:	4eae fdd8      	jsr -552(a6)
     68c:	2f40 003c      	move.l d0,60(sp)
     690:	202f 003c      	move.l 60(sp),d0
     694:	23c0 004d 2b90 	move.l d0,4d2b90 <GfxBase>
	if (!GfxBase)
     69a:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
     6a0:	6614           	bne.s 6b6 <main+0x84>
		Exit(0);
     6a2:	42af 0038      	clr.l 56(sp)
     6a6:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     6ac:	2c40           	movea.l d0,a6
     6ae:	222f 0038      	move.l 56(sp),d1
     6b2:	4eae ff70      	jsr -144(a6)

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     6b6:	2f7c 0000 752b 	move.l #29995,52(sp)
     6bc:	0034 
     6be:	42af 0030      	clr.l 48(sp)
     6c2:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
     6c8:	2c40           	movea.l d0,a6
     6ca:	226f 0034      	movea.l 52(sp),a1
     6ce:	202f 0030      	move.l 48(sp),d0
     6d2:	4eae fdd8      	jsr -552(a6)
     6d6:	2f40 002c      	move.l d0,44(sp)
     6da:	202f 002c      	move.l 44(sp),d0
     6de:	23c0 004d 2b8c 	move.l d0,4d2b8c <DOSBase>
	if (!DOSBase)
     6e4:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     6ea:	6614           	bne.s 700 <main+0xce>
		Exit(0);
     6ec:	42af 0028      	clr.l 40(sp)
     6f0:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     6f6:	2c40           	movea.l d0,a6
     6f8:	222f 0028      	move.l 40(sp),d1
     6fc:	4eae ff70      	jsr -144(a6)

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
     700:	4879 0000 7537 	pea 7537 <c2p1x1_8_c5_gen_pixels+0x21>
     706:	4eba 6704      	jsr 6e0c <KPrintF>(pc)
     70a:	588f           	addq.l #4,sp
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
     70c:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     712:	2c40           	movea.l d0,a6
     714:	4eae ffc4      	jsr -60(a6)
     718:	2f40 0024      	move.l d0,36(sp)
     71c:	202f 0024      	move.l 36(sp),d0
     720:	2f40 0020      	move.l d0,32(sp)
     724:	2f7c 0000 7553 	move.l #30035,28(sp)
     72a:	001c 
     72c:	700f           	moveq #15,d0
     72e:	2f40 0018      	move.l d0,24(sp)
     732:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     738:	2c40           	movea.l d0,a6
     73a:	222f 0020      	move.l 32(sp),d1
     73e:	242f 001c      	move.l 28(sp),d2
     742:	262f 0018      	move.l 24(sp),d3
     746:	4eae ffd0      	jsr -48(a6)
     74a:	2f40 0014      	move.l d0,20(sp)
	Delay(50);
     74e:	7032           	moveq #50,d0
     750:	2f40 0010      	move.l d0,16(sp)
     754:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
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
     76c:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
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
     7c4:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
     7ca:	4878 0010      	pea 10 <_start+0x10>
     7ce:	4879 0000 a5f0 	pea a5f0 <ClsSprites>
     7d4:	42a7           	clr.l -(sp)
     7d6:	2f00           	move.l d0,-(sp)
     7d8:	4eba 1f54      	jsr 272e <TestCopperlistBatch>(pc)
     7dc:	4fef 0010      	lea 16(sp),sp
     7e0:	4a80           	tst.l d0
     7e2:	6642           	bne.s 826 <SwScrollerTest+0x6e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     7e4:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     7ea:	2c40           	movea.l d0,a6
     7ec:	4eae ffc4      	jsr -60(a6)
     7f0:	2f40 0070      	move.l d0,112(sp)
     7f4:	202f 0070      	move.l 112(sp),d0
     7f8:	2f40 006c      	move.l d0,108(sp)
     7fc:	2f7c 0000 7574 	move.l #30068,104(sp)
     802:	0068 
     804:	702c           	moveq #44,d0
     806:	2f40 0064      	move.l d0,100(sp)
     80a:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     810:	2c40           	movea.l d0,a6
     812:	222f 006c      	move.l 108(sp),d1
     816:	242f 0068      	move.l 104(sp),d2
     81a:	262f 0064      	move.l 100(sp),d3
     81e:	4eae ffd0      	jsr -48(a6)
     822:	2f40 0060      	move.l d0,96(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     826:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
     82c:	4878 000c      	pea c <_start+0xc>
     830:	4879 0000 a630 	pea a630 <ClScreen>
     836:	4878 0010      	pea 10 <_start+0x10>
     83a:	2f00           	move.l d0,-(sp)
     83c:	4eba 1ef0      	jsr 272e <TestCopperlistBatch>(pc)
     840:	4fef 0010      	lea 16(sp),sp
     844:	4a80           	tst.l d0
     846:	6642           	bne.s 88a <SwScrollerTest+0xd2>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     848:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     84e:	2c40           	movea.l d0,a6
     850:	4eae ffc4      	jsr -60(a6)
     854:	2f40 005c      	move.l d0,92(sp)
     858:	202f 005c      	move.l 92(sp),d0
     85c:	2f40 0058      	move.l d0,88(sp)
     860:	2f7c 0000 75aa 	move.l #30122,84(sp)
     866:	0054 
     868:	7036           	moveq #54,d0
     86a:	2f40 0050      	move.l d0,80(sp)
     86e:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     874:	2c40           	movea.l d0,a6
     876:	222f 0058      	move.l 88(sp),d1
     87a:	242f 0054      	move.l 84(sp),d2
     87e:	262f 0050      	move.l 80(sp),d3
     882:	4eae ffd0      	jsr -48(a6)
     886:	2f40 004c      	move.l d0,76(sp)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     88a:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
     890:	4878 0002      	pea 2 <_start+0x2>
     894:	4879 0000 a570 	pea a570 <ClColor>
     89a:	4878 001e      	pea 1e <_start+0x1e>
     89e:	2f00           	move.l d0,-(sp)
     8a0:	4eba 1e8c      	jsr 272e <TestCopperlistBatch>(pc)
     8a4:	4fef 0010      	lea 16(sp),sp
     8a8:	4a80           	tst.l d0
     8aa:	6642           	bne.s 8ee <SwScrollerTest+0x136>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     8ac:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     8b2:	2c40           	movea.l d0,a6
     8b4:	4eae ffc4      	jsr -60(a6)
     8b8:	2f40 0048      	move.l d0,72(sp)
     8bc:	202f 0048      	move.l 72(sp),d0
     8c0:	2f40 0044      	move.l d0,68(sp)
     8c4:	2f7c 0000 75e1 	move.l #30177,64(sp)
     8ca:	0040 
     8cc:	7021           	moveq #33,d0
     8ce:	2f40 003c      	move.l d0,60(sp)
     8d2:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     8d8:	2c40           	movea.l d0,a6
     8da:	222f 0044      	move.l 68(sp),d1
     8de:	242f 0040      	move.l 64(sp),d2
     8e2:	262f 003c      	move.l 60(sp),d3
     8e6:	4eae ffd0      	jsr -48(a6)
     8ea:	2f40 0038      	move.l d0,56(sp)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     8ee:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
     8f4:	4878 fffe      	pea fffffffe <_end+0xffb2d426>
     8f8:	4878 0020      	pea 20 <_start+0x20>
     8fc:	2f00           	move.l d0,-(sp)
     8fe:	4eba 1e6c      	jsr 276c <TestCopperlistPos>(pc)
     902:	4fef 000c      	lea 12(sp),sp
     906:	4a80           	tst.l d0
     908:	6642           	bne.s 94c <SwScrollerTest+0x194>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     90a:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     910:	2c40           	movea.l d0,a6
     912:	4eae ffc4      	jsr -60(a6)
     916:	2f40 0034      	move.l d0,52(sp)
     91a:	202f 0034      	move.l 52(sp),d0
     91e:	2f40 0030      	move.l d0,48(sp)
     922:	2f7c 0000 7603 	move.l #30211,44(sp)
     928:	002c 
     92a:	7022           	moveq #34,d0
     92c:	2f40 0028      	move.l d0,40(sp)
     930:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     936:	2c40           	movea.l d0,a6
     938:	222f 0030      	move.l 48(sp),d1
     93c:	242f 002c      	move.l 44(sp),d2
     940:	262f 0028      	move.l 40(sp),d3
     944:	4eae ffd0      	jsr -48(a6)
     948:	2f40 0024      	move.l d0,36(sp)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     94c:	2239 0000 b7ac 	move.l b7ac <sw_text>,d1
     952:	2039 004d 2b70 	move.l 4d2b70 <DrawBuffer>,d0
     958:	2f01           	move.l d1,-(sp)
     95a:	2f00           	move.l d0,-(sp)
     95c:	4879 0000 b7b0 	pea b7b0 <sw_testfont>
     962:	4eba 0380      	jsr ce4 <WriteFont>(pc)
     966:	4fef 000c      	lea 12(sp),sp

  UWORD *tstpointer = (UWORD *)DrawBuffer;
     96a:	2f79 004d 2b70 	move.l 4d2b70 <DrawBuffer>,32(sp)
     970:	0020 
  if( *tstpointer != 0xff00)
     972:	206f 0020      	movea.l 32(sp),a0
     976:	3010           	move.w (a0),d0
     978:	0c40 ff00      	cmpi.w #-256,d0
     97c:	6742           	beq.s 9c0 <SwScrollerTest+0x208>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     97e:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     984:	2c40           	movea.l d0,a6
     986:	4eae ffc4      	jsr -60(a6)
     98a:	2f40 001c      	move.l d0,28(sp)
     98e:	202f 001c      	move.l 28(sp),d0
     992:	2f40 0018      	move.l d0,24(sp)
     996:	2f7c 0000 7626 	move.l #30246,20(sp)
     99c:	0014 
     99e:	7031           	moveq #49,d0
     9a0:	2f40 0010      	move.l d0,16(sp)
     9a4:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
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
     9e6:	23c0 004d 2b68 	move.l d0,4d2b68 <Copperlist1>
  Copperlist2 = ClbuildSW();
     9ec:	4eba 0174      	jsr b62 <ClbuildSW>(pc)
     9f0:	23c0 004d 2b6c 	move.l d0,4d2b6c <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     9f6:	2f7c 0000 c800 	move.l #51200,80(sp)
     9fc:	0050 
     9fe:	7002           	moveq #2,d0
     a00:	2f40 004c      	move.l d0,76(sp)
     a04:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
     a0a:	2c40           	movea.l d0,a6
     a0c:	202f 0050      	move.l 80(sp),d0
     a10:	222f 004c      	move.l 76(sp),d1
     a14:	4eae ff3a      	jsr -198(a6)
     a18:	2f40 0048      	move.l d0,72(sp)
     a1c:	202f 0048      	move.l 72(sp),d0
     a20:	23c0 004d 2b60 	move.l d0,4d2b60 <Bitplane1>
  if(Bitplane1 == 0) {
     a26:	2039 004d 2b60 	move.l 4d2b60 <Bitplane1>,d0
     a2c:	6658           	bne.s a86 <PrepareDisplaySW+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     a2e:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     a34:	2c40           	movea.l d0,a6
     a36:	4eae ffc4      	jsr -60(a6)
     a3a:	2f40 0044      	move.l d0,68(sp)
     a3e:	202f 0044      	move.l 68(sp),d0
     a42:	2f40 0040      	move.l d0,64(sp)
     a46:	2f7c 0000 7c09 	move.l #31753,60(sp)
     a4c:	003c 
     a4e:	7026           	moveq #38,d0
     a50:	2f40 0038      	move.l d0,56(sp)
     a54:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     a5a:	2c40           	movea.l d0,a6
     a5c:	222f 0040      	move.l 64(sp),d1
     a60:	242f 003c      	move.l 60(sp),d2
     a64:	262f 0038      	move.l 56(sp),d3
     a68:	4eae ffd0      	jsr -48(a6)
     a6c:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
     a70:	7001           	moveq #1,d0
     a72:	2f40 0030      	move.l d0,48(sp)
     a76:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     a7c:	2c40           	movea.l d0,a6
     a7e:	222f 0030      	move.l 48(sp),d1
     a82:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
     a86:	2039 004d 2b60 	move.l 4d2b60 <Bitplane1>,d0
     a8c:	23c0 004d 2b70 	move.l d0,4d2b70 <DrawBuffer>
  DrawCopper = Copperlist1;
     a92:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
     a98:	23c0 004d 2b78 	move.l d0,4d2b78 <DrawCopper>
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     a9e:	2f7c 0000 c800 	move.l #51200,44(sp)
     aa4:	002c 
     aa6:	7002           	moveq #2,d0
     aa8:	2f40 0028      	move.l d0,40(sp)
     aac:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
     ab2:	2c40           	movea.l d0,a6
     ab4:	202f 002c      	move.l 44(sp),d0
     ab8:	222f 0028      	move.l 40(sp),d1
     abc:	4eae ff3a      	jsr -198(a6)
     ac0:	2f40 0024      	move.l d0,36(sp)
     ac4:	202f 0024      	move.l 36(sp),d0
     ac8:	23c0 004d 2b64 	move.l d0,4d2b64 <Bitplane2>
  if(Bitplane2 == 0) {
     ace:	2039 004d 2b64 	move.l 4d2b64 <Bitplane2>,d0
     ad4:	6658           	bne.s b2e <PrepareDisplaySW+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     ad6:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     adc:	2c40           	movea.l d0,a6
     ade:	4eae ffc4      	jsr -60(a6)
     ae2:	2f40 0020      	move.l d0,32(sp)
     ae6:	202f 0020      	move.l 32(sp),d0
     aea:	2f40 001c      	move.l d0,28(sp)
     aee:	2f7c 0000 7c30 	move.l #31792,24(sp)
     af4:	0018 
     af6:	7026           	moveq #38,d0
     af8:	2f40 0014      	move.l d0,20(sp)
     afc:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     b02:	2c40           	movea.l d0,a6
     b04:	222f 001c      	move.l 28(sp),d1
     b08:	242f 0018      	move.l 24(sp),d2
     b0c:	262f 0014      	move.l 20(sp),d3
     b10:	4eae ffd0      	jsr -48(a6)
     b14:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     b18:	7001           	moveq #1,d0
     b1a:	2f40 000c      	move.l d0,12(sp)
     b1e:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     b24:	2c40           	movea.l d0,a6
     b26:	222f 000c      	move.l 12(sp),d1
     b2a:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
     b2e:	2039 004d 2b64 	move.l 4d2b64 <Bitplane2>,d0
     b34:	23c0 004d 2b74 	move.l d0,4d2b74 <ViewBuffer>
  ViewCopper = Copperlist2;
     b3a:	2039 004d 2b6c 	move.l 4d2b6c <Copperlist2>,d0
     b40:	23c0 004d 2b7c 	move.l d0,4d2b7c <ViewCopper>
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
     b78:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
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
     b9a:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     ba0:	2c40           	movea.l d0,a6
     ba2:	4eae ffc4      	jsr -60(a6)
     ba6:	2f40 0020      	move.l d0,32(sp)
     baa:	202f 0020      	move.l 32(sp),d0
     bae:	2f40 001c      	move.l d0,28(sp)
     bb2:	2f7c 0000 7c57 	move.l #31831,24(sp)
     bb8:	0018 
     bba:	7228           	moveq #40,d1
     bbc:	2f41 0014      	move.l d1,20(sp)
     bc0:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     bc6:	2c40           	movea.l d0,a6
     bc8:	222f 001c      	move.l 28(sp),d1
     bcc:	242f 0018      	move.l 24(sp),d2
     bd0:	262f 0014      	move.l 20(sp),d3
     bd4:	4eae ffd0      	jsr -48(a6)
     bd8:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     bdc:	7401           	moveq #1,d2
     bde:	2f42 000c      	move.l d2,12(sp)
     be2:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
     be8:	2c40           	movea.l d0,a6
     bea:	222f 000c      	move.l 12(sp),d1
     bee:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
     bf2:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
     bf8:	2f7c 0000 a5f0 	move.l #42480,64(sp)
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
     c32:	2f7c 0000 a630 	move.l #42544,64(sp)
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
     c94:	2f7c 0000 a570 	move.l #42352,64(sp)
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
     d5c:	3039 004d 2bc0 	move.w 4d2bc0 <Zoom_Counter>,d0
     d62:	5240           	addq.w #1,d0
     d64:	33c0 004d 2bc0 	move.w d0,4d2bc0 <Zoom_Counter>
  SwapCl();
     d6a:	4eba f434      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     d6e:	33fc 0001 004d 	move.w #1,4d2bc6 <Zoom_MouseReleased>
     d74:	2bc6 
  if( MouseLeft())
     d76:	4eba f4ea      	jsr 262 <MouseLeft>(pc)
     d7a:	4a40           	tst.w d0
     d7c:	6708           	beq.s d86 <Zoom_VblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     d7e:	33fc 0001 004d 	move.w #1,4d2bc8 <Zoom_Mousepressed>
     d84:	2bc8 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     d86:	3039 004d 2bc8 	move.w 4d2bc8 <Zoom_Mousepressed>,d0
     d8c:	0c40 0001      	cmpi.w #1,d0
     d90:	6616           	bne.s da8 <Zoom_VblankHandler+0x4c>
     d92:	4eba f4ce      	jsr 262 <MouseLeft>(pc)
     d96:	4a40           	tst.w d0
     d98:	660e           	bne.s da8 <Zoom_VblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     d9a:	33fc 0001 004d 	move.w #1,4d2bc6 <Zoom_MouseReleased>
     da0:	2bc6 
    Zoom_Mousepressed = 0;
     da2:	4279 004d 2bc8 	clr.w 4d2bc8 <Zoom_Mousepressed>
  }
      
      Zoom_MouseReleased = 0;
     da8:	4279 004d 2bc6 	clr.w 4d2bc6 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom <= 2) {
     dae:	3039 004d 2bce 	move.w 4d2bce <Zoom_LevelOf102Zoom>,d0
     db4:	0c40 0002      	cmpi.w #2,d0
     db8:	6244           	bhi.s dfe <Zoom_VblankHandler+0xa2>
 
        if( Zoom_LevelOfZoom == 87)
     dba:	3039 004d 2bcc 	move.w 4d2bcc <Zoom_LevelOfZoom>,d0
     dc0:	0c40 0057      	cmpi.w #87,d0
     dc4:	660a           	bne.s dd0 <Zoom_VblankHandler+0x74>
          Zoom_LevelOfZoom = 0;
     dc6:	33fc 0000 004d 	move.w #0,4d2bcc <Zoom_LevelOfZoom>
     dcc:	2bcc 
     dce:	600e           	bra.s dde <Zoom_VblankHandler+0x82>
        else
          Zoom_LevelOfZoom++;
     dd0:	3039 004d 2bcc 	move.w 4d2bcc <Zoom_LevelOfZoom>,d0
     dd6:	5240           	addq.w #1,d0
     dd8:	33c0 004d 2bcc 	move.w d0,4d2bcc <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     dde:	33fc 000f 004d 	move.w #15,4d2bce <Zoom_LevelOf102Zoom>
     de4:	2bce 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     de6:	3039 004d 2bcc 	move.w 4d2bcc <Zoom_LevelOfZoom>,d0
     dec:	3000           	move.w d0,d0
     dee:	0280 0000 ffff 	andi.l #65535,d0
     df4:	2f00           	move.l d0,-(sp)
     df6:	4eba 1020      	jsr 1e18 <Zoom_SwapBuffers>(pc)
     dfa:	588f           	addq.l #4,sp
     dfc:	600e           	bra.s e0c <Zoom_VblankHandler+0xb0>
      } else 
        Zoom_LevelOf102Zoom-=2;
     dfe:	3039 004d 2bce 	move.w 4d2bce <Zoom_LevelOf102Zoom>,d0
     e04:	5540           	subq.w #2,d0
     e06:	33c0 004d 2bce 	move.w d0,4d2bce <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     e0c:	2239 004d 2b78 	move.l 4d2b78 <DrawCopper>,d1
     e12:	3039 004d 2bce 	move.w 4d2bce <Zoom_LevelOf102Zoom>,d0
     e18:	3000           	move.w d0,d0
     e1a:	0280 0000 ffff 	andi.l #65535,d0
     e20:	2f01           	move.l d1,-(sp)
     e22:	2f00           	move.l d0,-(sp)
     e24:	4eba f5e6      	jsr 40c <Zoom_Shrink102>(pc)
     e28:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     e2a:	2239 004d 2b78 	move.l 4d2b78 <DrawCopper>,d1
     e30:	2039 004d 2b74 	move.l 4d2b74 <ViewBuffer>,d0
     e36:	2f01           	move.l d1,-(sp)
     e38:	2f00           	move.l d0,-(sp)
     e3a:	4eba 0f44      	jsr 1d80 <Zoom_SetBplPointers>(pc)
     e3e:	508f           	addq.l #8,sp
 
}
     e40:	4e75           	rts

00000e42 <Zoom_ReverseVblankHandler>:


void Zoom_ReverseVblankHandler() {
  
  Zoom_Counter++;
     e42:	3039 004d 2bc0 	move.w 4d2bc0 <Zoom_Counter>,d0
     e48:	5240           	addq.w #1,d0
     e4a:	33c0 004d 2bc0 	move.w d0,4d2bc0 <Zoom_Counter>
  SwapCl();
     e50:	4eba f34e      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     e54:	33fc 0001 004d 	move.w #1,4d2bc6 <Zoom_MouseReleased>
     e5a:	2bc6 
  if( MouseLeft())
     e5c:	4eba f404      	jsr 262 <MouseLeft>(pc)
     e60:	4a40           	tst.w d0
     e62:	6708           	beq.s e6c <Zoom_ReverseVblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     e64:	33fc 0001 004d 	move.w #1,4d2bc8 <Zoom_Mousepressed>
     e6a:	2bc8 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     e6c:	3039 004d 2bc8 	move.w 4d2bc8 <Zoom_Mousepressed>,d0
     e72:	0c40 0001      	cmpi.w #1,d0
     e76:	6616           	bne.s e8e <Zoom_ReverseVblankHandler+0x4c>
     e78:	4eba f3e8      	jsr 262 <MouseLeft>(pc)
     e7c:	4a40           	tst.w d0
     e7e:	660e           	bne.s e8e <Zoom_ReverseVblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     e80:	33fc 0001 004d 	move.w #1,4d2bc6 <Zoom_MouseReleased>
     e86:	2bc6 
    Zoom_Mousepressed = 0;
     e88:	4279 004d 2bc8 	clr.w 4d2bc8 <Zoom_Mousepressed>
    /*if( MouseLeft()) {
      while (MouseLeft())
      {
      }*/
      
      Zoom_MouseReleased = 0;
     e8e:	4279 004d 2bc6 	clr.w 4d2bc6 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 15) {
     e94:	3039 004d 2bce 	move.w 4d2bce <Zoom_LevelOf102Zoom>,d0
     e9a:	0c40 000f      	cmpi.w #15,d0
     e9e:	6640           	bne.s ee0 <Zoom_ReverseVblankHandler+0x9e>
 
        if( Zoom_LevelOfZoom == 0)
     ea0:	3039 004d 2bcc 	move.w 4d2bcc <Zoom_LevelOfZoom>,d0
     ea6:	660a           	bne.s eb2 <Zoom_ReverseVblankHandler+0x70>
          Zoom_LevelOfZoom = 17;
     ea8:	33fc 0011 004d 	move.w #17,4d2bcc <Zoom_LevelOfZoom>
     eae:	2bcc 
     eb0:	600e           	bra.s ec0 <Zoom_ReverseVblankHandler+0x7e>
        else
          Zoom_LevelOfZoom--;
     eb2:	3039 004d 2bcc 	move.w 4d2bcc <Zoom_LevelOfZoom>,d0
     eb8:	5340           	subq.w #1,d0
     eba:	33c0 004d 2bcc 	move.w d0,4d2bcc <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 0;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     ec0:	33fc 0000 004d 	move.w #0,4d2bce <Zoom_LevelOf102Zoom>
     ec6:	2bce 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     ec8:	3039 004d 2bcc 	move.w 4d2bcc <Zoom_LevelOfZoom>,d0
     ece:	3000           	move.w d0,d0
     ed0:	0280 0000 ffff 	andi.l #65535,d0
     ed6:	2f00           	move.l d0,-(sp)
     ed8:	4eba 0f3e      	jsr 1e18 <Zoom_SwapBuffers>(pc)
     edc:	588f           	addq.l #4,sp
     ede:	600e           	bra.s eee <Zoom_ReverseVblankHandler+0xac>
      } else 
        Zoom_LevelOf102Zoom++;
     ee0:	3039 004d 2bce 	move.w 4d2bce <Zoom_LevelOf102Zoom>,d0
     ee6:	5240           	addq.w #1,d0
     ee8:	33c0 004d 2bce 	move.w d0,4d2bce <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     eee:	2239 004d 2b78 	move.l 4d2b78 <DrawCopper>,d1
     ef4:	3039 004d 2bce 	move.w 4d2bce <Zoom_LevelOf102Zoom>,d0
     efa:	3000           	move.w d0,d0
     efc:	0280 0000 ffff 	andi.l #65535,d0
     f02:	2f01           	move.l d1,-(sp)
     f04:	2f00           	move.l d0,-(sp)
     f06:	4eba f504      	jsr 40c <Zoom_Shrink102>(pc)
     f0a:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     f0c:	2239 004d 2b78 	move.l 4d2b78 <DrawCopper>,d1
     f12:	2039 004d 2b74 	move.l 4d2b74 <ViewBuffer>,d0
     f18:	2f01           	move.l d1,-(sp)
     f1a:	2f00           	move.l d0,-(sp)
     f1c:	4eba 0e62      	jsr 1d80 <Zoom_SetBplPointers>(pc)
     f20:	508f           	addq.l #8,sp
 
}
     f22:	4e75           	rts

00000f24 <Zoom_LoadImage>:

void Zoom_LoadImage( ULONG *destination) {  
     f24:	4fef fff4      	lea -12(sp),sp
     f28:	2f0e           	move.l a6,-(sp)
  CopyMem( rawzoom, destination, ZMBPLSIZE);
     f2a:	2f79 0000 b804 	move.l b804 <rawzoom>,12(sp)
     f30:	000c 
     f32:	2f6f 0014 0008 	move.l 20(sp),8(sp)
     f38:	2f7c 0000 df20 	move.l #57120,4(sp)
     f3e:	0004 
     f40:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
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
     f70:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
     f76:	216f 0008 0050 	move.l 8(sp),80(a0)
  hw->bltdpt = (UWORD *) destination;
     f7c:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
     f82:	216f 000c 0054 	move.l 12(sp),84(a0)
  hw->bltsize = (height<<6)+2;
     f88:	302f 0002      	move.w 2(sp),d0
     f8c:	ed48           	lsl.w #6,d0
     f8e:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
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
     faa:	3039 004d 2bb6 	move.w 4d2bb6 <ZoomBlit_Increment4SrcA>,d0
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
     fc8:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
     fce:	216f 0004 0050 	move.l 4(sp),80(a0)
  hw->bltbpt = source;
     fd4:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
     fda:	216f 000c 004c 	move.l 12(sp),76(a0)
  hw->bltdpt = destination;
     fe0:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
     fe6:	216f 0010 0054 	move.l 16(sp),84(a0)
  hw->bltsize = (height<<6)+2;
     fec:	302f 0002      	move.w 2(sp),d0
     ff0:	ed48           	lsl.w #6,d0
     ff2:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
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
    102a:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    1030:	316f 0004 0064 	move.w 4(sp),100(a0)
  hw->bltbmod = bltbmod;  
    1036:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    103c:	316f 0002 0062 	move.w 2(sp),98(a0)
  hw->bltapt = src4a;
    1042:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    1048:	216f 000c 0050 	move.l 12(sp),80(a0)
  hw->bltbpt = src4b;
    104e:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    1054:	216f 0010 004c 	move.l 16(sp),76(a0)
  hw->bltdpt = dst;
    105a:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    1060:	216f 0014 0054 	move.l 20(sp),84(a0)
  hw->bltsize = (height<<6)+numofwords;
    1066:	302f 0006      	move.w 6(sp),d0
    106a:	ed48           	lsl.w #6,d0
    106c:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
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
    1086:	4279 004d 2bc0 	clr.w 4d2bc0 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    108c:	7004           	moveq #4,d0
    108e:	2f40 0020      	move.l d0,32(sp)
    1092:	7002           	moveq #2,d0
    1094:	2f40 001c      	move.l d0,28(sp)
    1098:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    109e:	2c40           	movea.l d0,a6
    10a0:	202f 0020      	move.l 32(sp),d0
    10a4:	222f 001c      	move.l 28(sp),d1
    10a8:	4eae ff3a      	jsr -198(a6)
    10ac:	2f40 0018      	move.l d0,24(sp)
    10b0:	202f 0018      	move.l 24(sp),d0
    10b4:	23c0 004d 2bae 	move.l d0,4d2bae <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 15;
    10ba:	33fc 000f 004d 	move.w #15,4d2bce <Zoom_LevelOf102Zoom>
    10c0:	2bce 
  ZoomHorizontal = 16;
    10c2:	33fc 0010 004d 	move.w #16,4d2bd2 <ZoomHorizontal>
    10c8:	2bd2 
  Zoom_PrepareDisplay();
    10ca:	4eba 0288      	jsr 1354 <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 15, Copperlist1);
    10ce:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    10d4:	2f00           	move.l d0,-(sp)
    10d6:	4878 000f      	pea f <_start+0xf>
    10da:	4eba f330      	jsr 40c <Zoom_Shrink102>(pc)
    10de:	508f           	addq.l #8,sp
  Zoom_Shrink102( 15, Copperlist2);
    10e0:	2039 004d 2b6c 	move.l 4d2b6c <Copperlist2>,d0
    10e6:	2f00           	move.l d0,-(sp)
    10e8:	4878 000f      	pea f <_start+0xf>
    10ec:	4eba f31e      	jsr 40c <Zoom_Shrink102>(pc)
    10f0:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 1;
    10f2:	33fc 0001 004d 	move.w #1,4d2bcc <Zoom_LevelOfZoom>
    10f8:	2bcc 
  Zoom_Direction = 1;                                                  
    10fa:	33fc 0001 004d 	move.w #1,4d2bd0 <Zoom_Direction>
    1100:	2bd0 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    1102:	7016           	moveq #22,d0
    1104:	2f40 0014      	move.l d0,20(sp)
    1108:	2f7c 0001 0001 	move.l #65537,16(sp)
    110e:	0010 
    1110:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    1116:	2c40           	movea.l d0,a6
    1118:	202f 0014      	move.l 20(sp),d0
    111c:	222f 0010      	move.l 16(sp),d1
    1120:	4eae ff3a      	jsr -198(a6)
    1124:	2f40 000c      	move.l d0,12(sp)
    1128:	202f 000c      	move.l 12(sp),d0
    112c:	23c0 004d 2bb8 	move.l d0,4d2bb8 <Zoom_vbint>
    1132:	2039 004d 2bb8 	move.l 4d2bb8 <Zoom_vbint>,d0
    1138:	673e           	beq.s 1178 <Zoom_InitRun+0xf8>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    113a:	2079 004d 2bb8 	movea.l 4d2bb8 <Zoom_vbint>,a0
    1140:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    1146:	2079 004d 2bb8 	movea.l 4d2bb8 <Zoom_vbint>,a0
    114c:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    1152:	2079 004d 2bb8 	movea.l 4d2bb8 <Zoom_vbint>,a0
    1158:	217c 0000 7c7d 	move.l #31869,10(a0)
    115e:	000a 
    Zoom_vbint->is_Data = NULL;
    1160:	2079 004d 2bb8 	movea.l 4d2bb8 <Zoom_vbint>,a0
    1166:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    116a:	2079 004d 2bb8 	movea.l 4d2bb8 <Zoom_vbint>,a0
    1170:	217c 0000 0d5c 	move.l #3420,18(a0)
    1176:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    1178:	7005           	moveq #5,d0
    117a:	2f40 0008      	move.l d0,8(sp)
    117e:	2f79 004d 2bb8 	move.l 4d2bb8 <Zoom_vbint>,4(sp)
    1184:	0004 
    1186:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    118c:	2c40           	movea.l d0,a6
    118e:	202f 0008      	move.l 8(sp),d0
    1192:	226f 0004      	movea.l 4(sp),a1
    1196:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    119a:	2239 004d 2b7c 	move.l 4d2b7c <ViewCopper>,d1
    11a0:	2039 004d 2b74 	move.l 4d2b74 <ViewBuffer>,d0
    11a6:	2f01           	move.l d1,-(sp)
    11a8:	2f00           	move.l d0,-(sp)
    11aa:	4eba 0bd4      	jsr 1d80 <Zoom_SetBplPointers>(pc)
    11ae:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    11b0:	2239 004d 2b78 	move.l 4d2b78 <DrawCopper>,d1
    11b6:	2039 004d 2b74 	move.l 4d2b74 <ViewBuffer>,d0
    11bc:	2f01           	move.l d1,-(sp)
    11be:	2f00           	move.l d0,-(sp)
    11c0:	4eba 0bbe      	jsr 1d80 <Zoom_SetBplPointers>(pc)
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
    11d8:	4279 004d 2bc0 	clr.w 4d2bc0 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    11de:	7004           	moveq #4,d0
    11e0:	2f40 0020      	move.l d0,32(sp)
    11e4:	7002           	moveq #2,d0
    11e6:	2f40 001c      	move.l d0,28(sp)
    11ea:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    11f0:	2c40           	movea.l d0,a6
    11f2:	202f 0020      	move.l 32(sp),d0
    11f6:	222f 001c      	move.l 28(sp),d1
    11fa:	4eae ff3a      	jsr -198(a6)
    11fe:	2f40 0018      	move.l d0,24(sp)
    1202:	202f 0018      	move.l 24(sp),d0
    1206:	23c0 004d 2bae 	move.l d0,4d2bae <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 0;
    120c:	33fc 0000 004d 	move.w #0,4d2bce <Zoom_LevelOf102Zoom>
    1212:	2bce 
  ZoomHorizontal = 16;
    1214:	33fc 0010 004d 	move.w #16,4d2bd2 <ZoomHorizontal>
    121a:	2bd2 
  Zoom_PrepareDisplay();
    121c:	4eba 0136      	jsr 1354 <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 0, Copperlist1);
    1220:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    1226:	2f00           	move.l d0,-(sp)
    1228:	42a7           	clr.l -(sp)
    122a:	4eba f1e0      	jsr 40c <Zoom_Shrink102>(pc)
    122e:	508f           	addq.l #8,sp
  Zoom_Shrink102( 0, Copperlist2);
    1230:	2039 004d 2b6c 	move.l 4d2b6c <Copperlist2>,d0
    1236:	2f00           	move.l d0,-(sp)
    1238:	42a7           	clr.l -(sp)
    123a:	4eba f1d0      	jsr 40c <Zoom_Shrink102>(pc)
    123e:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 17;
    1240:	33fc 0011 004d 	move.w #17,4d2bcc <Zoom_LevelOfZoom>
    1246:	2bcc 
                                                  
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    1248:	7016           	moveq #22,d0
    124a:	2f40 0014      	move.l d0,20(sp)
    124e:	2f7c 0001 0001 	move.l #65537,16(sp)
    1254:	0010 
    1256:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    125c:	2c40           	movea.l d0,a6
    125e:	202f 0014      	move.l 20(sp),d0
    1262:	222f 0010      	move.l 16(sp),d1
    1266:	4eae ff3a      	jsr -198(a6)
    126a:	2f40 000c      	move.l d0,12(sp)
    126e:	202f 000c      	move.l 12(sp),d0
    1272:	23c0 004d 2bb8 	move.l d0,4d2bb8 <Zoom_vbint>
    1278:	2039 004d 2bb8 	move.l 4d2bb8 <Zoom_vbint>,d0
    127e:	673e           	beq.s 12be <Zoom_InitRunReverse+0xec>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1280:	2079 004d 2bb8 	movea.l 4d2bb8 <Zoom_vbint>,a0
    1286:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    128c:	2079 004d 2bb8 	movea.l 4d2bb8 <Zoom_vbint>,a0
    1292:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    1298:	2079 004d 2bb8 	movea.l 4d2bb8 <Zoom_vbint>,a0
    129e:	217c 0000 7c7d 	move.l #31869,10(a0)
    12a4:	000a 
    Zoom_vbint->is_Data = NULL;
    12a6:	2079 004d 2bb8 	movea.l 4d2bb8 <Zoom_vbint>,a0
    12ac:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_ReverseVblankHandler;
    12b0:	2079 004d 2bb8 	movea.l 4d2bb8 <Zoom_vbint>,a0
    12b6:	217c 0000 0e42 	move.l #3650,18(a0)
    12bc:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    12be:	7005           	moveq #5,d0
    12c0:	2f40 0008      	move.l d0,8(sp)
    12c4:	2f79 004d 2bb8 	move.l 4d2bb8 <Zoom_vbint>,4(sp)
    12ca:	0004 
    12cc:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    12d2:	2c40           	movea.l d0,a6
    12d4:	202f 0008      	move.l 8(sp),d0
    12d8:	226f 0004      	movea.l 4(sp),a1
    12dc:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    12e0:	2239 004d 2b7c 	move.l 4d2b7c <ViewCopper>,d1
    12e6:	2039 004d 2b74 	move.l 4d2b74 <ViewBuffer>,d0
    12ec:	2f01           	move.l d1,-(sp)
    12ee:	2f00           	move.l d0,-(sp)
    12f0:	4eba 0a8e      	jsr 1d80 <Zoom_SetBplPointers>(pc)
    12f4:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    12f6:	2239 004d 2b78 	move.l 4d2b78 <DrawCopper>,d1
    12fc:	2039 004d 2b74 	move.l 4d2b74 <ViewBuffer>,d0
    1302:	2f01           	move.l d1,-(sp)
    1304:	2f00           	move.l d0,-(sp)
    1306:	4eba 0a78      	jsr 1d80 <Zoom_SetBplPointers>(pc)
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
    1322:	2f79 004d 2bb8 	move.l 4d2bb8 <Zoom_vbint>,4(sp)
    1328:	0004 
    132a:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
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
  Zoom_SwapBuffers( 0);
    1354:	42a7           	clr.l -(sp)
    1356:	4eba 0ac0      	jsr 1e18 <Zoom_SwapBuffers>(pc)
    135a:	588f           	addq.l #4,sp
  Copperlist1 = ClbuildZoom( );
    135c:	4eba 007a      	jsr 13d8 <ClbuildZoom>(pc)
    1360:	23c0 004d 2b68 	move.l d0,4d2b68 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    1366:	4eba 0070      	jsr 13d8 <ClbuildZoom>(pc)
    136a:	23c0 004d 2b6c 	move.l d0,4d2b6c <Copperlist2>
  if(Bitplane2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;*/
  DrawCopper = Copperlist1;
    1370:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    1376:	23c0 004d 2b78 	move.l d0,4d2b78 <DrawCopper>
  ViewCopper = Copperlist2;
    137c:	2039 004d 2b6c 	move.l 4d2b6c <Copperlist2>,d0
    1382:	23c0 004d 2b7c 	move.l d0,4d2b7c <ViewCopper>
  return 0;
    1388:	7000           	moveq #0,d0
}
    138a:	4e75           	rts

0000138c <Zoom_Init>:

void Zoom_Init() {
    138c:	4fef fff4      	lea -12(sp),sp
    1390:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    1392:	7004           	moveq #4,d0
    1394:	2f40 000c      	move.l d0,12(sp)
    1398:	7002           	moveq #2,d0
    139a:	2f40 0008      	move.l d0,8(sp)
    139e:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    13a4:	2c40           	movea.l d0,a6
    13a6:	202f 000c      	move.l 12(sp),d0
    13aa:	222f 0008      	move.l 8(sp),d1
    13ae:	4eae ff3a      	jsr -198(a6)
    13b2:	2f40 0004      	move.l d0,4(sp)
    13b6:	202f 0004      	move.l 4(sp),d0
    13ba:	23c0 004d 2bae 	move.l d0,4d2bae <Zoom_ZoomBlitMask>
  ZoomHorizontal = 16;
    13c0:	33fc 0010 004d 	move.w #16,4d2bd2 <ZoomHorizontal>
    13c6:	2bd2 
  Zoom_LevelOf102Zoom = 15;
    13c8:	33fc 000f 004d 	move.w #15,4d2bce <Zoom_LevelOf102Zoom>
    13ce:	2bce 
}
    13d0:	2c5f           	movea.l (sp)+,a6
    13d2:	4fef 000c      	lea 12(sp),sp
    13d6:	4e75           	rts

000013d8 <ClbuildZoom>:


ULONG * ClbuildZoom() {
    13d8:	4fef ffac      	lea -84(sp),sp
    13dc:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    13e0:	2f7c 0000 031c 	move.l #796,68(sp)
    13e6:	0044 
    13e8:	7002           	moveq #2,d0
    13ea:	2f40 0040      	move.l d0,64(sp)
    13ee:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    13f4:	2c40           	movea.l d0,a6
    13f6:	202f 0044      	move.l 68(sp),d0
    13fa:	222f 0040      	move.l 64(sp),d1
    13fe:	4eae ff3a      	jsr -198(a6)
    1402:	2f40 003c      	move.l d0,60(sp)
    1406:	202f 003c      	move.l 60(sp),d0
    140a:	2f40 0038      	move.l d0,56(sp)
  
  if( retval == 0) {
    140e:	6658           	bne.s 1468 <ClbuildZoom+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1410:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    1416:	2c40           	movea.l d0,a6
    1418:	4eae ffc4      	jsr -60(a6)
    141c:	2f40 0034      	move.l d0,52(sp)
    1420:	202f 0034      	move.l 52(sp),d0
    1424:	2f40 0030      	move.l d0,48(sp)
    1428:	2f7c 0000 7c57 	move.l #31831,44(sp)
    142e:	002c 
    1430:	7228           	moveq #40,d1
    1432:	2f41 0028      	move.l d1,40(sp)
    1436:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    143c:	2c40           	movea.l d0,a6
    143e:	222f 0030      	move.l 48(sp),d1
    1442:	242f 002c      	move.l 44(sp),d2
    1446:	262f 0028      	move.l 40(sp),d3
    144a:	4eae ffd0      	jsr -48(a6)
    144e:	2f40 0024      	move.l d0,36(sp)
    Exit(1);
    1452:	7401           	moveq #1,d2
    1454:	2f42 0020      	move.l d2,32(sp)
    1458:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    145e:	2c40           	movea.l d0,a6
    1460:	222f 0020      	move.l 32(sp),d1
    1464:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    1468:	2f6f 0038 005c 	move.l 56(sp),92(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    146e:	2f7c 0000 a5f0 	move.l #42480,88(sp)
    1474:	0058 
  for(int i=0; i<16;i++)
    1476:	42af 0054      	clr.l 84(sp)
    147a:	6024           	bra.s 14a0 <ClbuildZoom+0xc8>
    *cl++ = *clpartinstruction++;
    147c:	222f 0058      	move.l 88(sp),d1
    1480:	2001           	move.l d1,d0
    1482:	5880           	addq.l #4,d0
    1484:	2f40 0058      	move.l d0,88(sp)
    1488:	202f 005c      	move.l 92(sp),d0
    148c:	2400           	move.l d0,d2
    148e:	5882           	addq.l #4,d2
    1490:	2f42 005c      	move.l d2,92(sp)
    1494:	2041           	movea.l d1,a0
    1496:	2210           	move.l (a0),d1
    1498:	2040           	movea.l d0,a0
    149a:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    149c:	52af 0054      	addq.l #1,84(sp)
    14a0:	700f           	moveq #15,d0
    14a2:	b0af 0054      	cmp.l 84(sp),d0
    14a6:	6cd4           	bge.s 147c <ClbuildZoom+0xa4>
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
    14a8:	2f7c 0000 a630 	move.l #42544,88(sp)
    14ae:	0058 
  for(int i=0; i<12;i++)
    14b0:	42af 0050      	clr.l 80(sp)
    14b4:	6024           	bra.s 14da <ClbuildZoom+0x102>
    *cl++ = *clpartinstruction++;
    14b6:	222f 0058      	move.l 88(sp),d1
    14ba:	2401           	move.l d1,d2
    14bc:	5882           	addq.l #4,d2
    14be:	2f42 0058      	move.l d2,88(sp)
    14c2:	202f 005c      	move.l 92(sp),d0
    14c6:	2400           	move.l d0,d2
    14c8:	5882           	addq.l #4,d2
    14ca:	2f42 005c      	move.l d2,92(sp)
    14ce:	2041           	movea.l d1,a0
    14d0:	2210           	move.l (a0),d1
    14d2:	2040           	movea.l d0,a0
    14d4:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    14d6:	52af 0050      	addq.l #1,80(sp)
    14da:	700b           	moveq #11,d0
    14dc:	b0af 0050      	cmp.l 80(sp),d0
    14e0:	6cd4           	bge.s 14b6 <ClbuildZoom+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    14e2:	202f 005c      	move.l 92(sp),d0
    14e6:	2200           	move.l d0,d1
    14e8:	5881           	addq.l #4,d1
    14ea:	2f41 005c      	move.l d1,92(sp)
    14ee:	2040           	movea.l d0,a0
    14f0:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    14f6:	202f 005c      	move.l 92(sp),d0
    14fa:	2200           	move.l d0,d1
    14fc:	5881           	addq.l #4,d1
    14fe:	2f41 005c      	move.l d1,92(sp)
    1502:	2040           	movea.l d0,a0
    1504:	20bc 00e2 0000 	move.l #14811136,(a0)
  *cl++ = 0x00e40000;
    150a:	202f 005c      	move.l 92(sp),d0
    150e:	2200           	move.l d0,d1
    1510:	5881           	addq.l #4,d1
    1512:	2f41 005c      	move.l d1,92(sp)
    1516:	2040           	movea.l d0,a0
    1518:	20bc 00e4 0000 	move.l #14942208,(a0)
  *cl++ = 0x00e60000;
    151e:	202f 005c      	move.l 92(sp),d0
    1522:	2200           	move.l d0,d1
    1524:	5881           	addq.l #4,d1
    1526:	2f41 005c      	move.l d1,92(sp)
    152a:	2040           	movea.l d0,a0
    152c:	20bc 00e6 0000 	move.l #15073280,(a0)
  *cl++ = 0x00e80000;
    1532:	202f 005c      	move.l 92(sp),d0
    1536:	2200           	move.l d0,d1
    1538:	5881           	addq.l #4,d1
    153a:	2f41 005c      	move.l d1,92(sp)
    153e:	2040           	movea.l d0,a0
    1540:	20bc 00e8 0000 	move.l #15204352,(a0)
  *cl++ = 0x00ea0000;
    1546:	202f 005c      	move.l 92(sp),d0
    154a:	2200           	move.l d0,d1
    154c:	5881           	addq.l #4,d1
    154e:	2f41 005c      	move.l d1,92(sp)
    1552:	2040           	movea.l d0,a0
    1554:	20bc 00ea 0000 	move.l #15335424,(a0)
  *cl++ = 0x00ec0000;
    155a:	202f 005c      	move.l 92(sp),d0
    155e:	2200           	move.l d0,d1
    1560:	5881           	addq.l #4,d1
    1562:	2f41 005c      	move.l d1,92(sp)
    1566:	2040           	movea.l d0,a0
    1568:	20bc 00ec 0000 	move.l #15466496,(a0)
  *cl++ = 0x00ee0000;
    156e:	202f 005c      	move.l 92(sp),d0
    1572:	2200           	move.l d0,d1
    1574:	5881           	addq.l #4,d1
    1576:	2f41 005c      	move.l d1,92(sp)
    157a:	2040           	movea.l d0,a0
    157c:	20bc 00ee 0000 	move.l #15597568,(a0)
  *cl++ = 0x00f00000;
    1582:	202f 005c      	move.l 92(sp),d0
    1586:	2200           	move.l d0,d1
    1588:	5881           	addq.l #4,d1
    158a:	2f41 005c      	move.l d1,92(sp)
    158e:	2040           	movea.l d0,a0
    1590:	20bc 00f0 0000 	move.l #15728640,(a0)
  *cl++ = 0x00f20000;
    1596:	202f 005c      	move.l 92(sp),d0
    159a:	2200           	move.l d0,d1
    159c:	5881           	addq.l #4,d1
    159e:	2f41 005c      	move.l d1,92(sp)
    15a2:	2040           	movea.l d0,a0
    15a4:	20bc 00f2 0000 	move.l #15859712,(a0)

  clpartinstruction = ClColor;
    15aa:	2f7c 0000 a570 	move.l #42352,88(sp)
    15b0:	0058 
  for(int i=0; i<32;i++)
    15b2:	42af 004c      	clr.l 76(sp)
    15b6:	6024           	bra.s 15dc <ClbuildZoom+0x204>
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
  for(int i=0; i<32;i++)
    15d8:	52af 004c      	addq.l #1,76(sp)
    15dc:	701f           	moveq #31,d0
    15de:	b0af 004c      	cmp.l 76(sp),d0
    15e2:	6cd4           	bge.s 15b8 <ClbuildZoom+0x1e0>
  
  ULONG cop2 = cl+3;
    15e4:	700c           	moveq #12,d0
    15e6:	d0af 005c      	add.l 92(sp),d0
    15ea:	2f40 001c      	move.l d0,28(sp)
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    15ee:	202f 001c      	move.l 28(sp),d0
    15f2:	4240           	clr.w d0
    15f4:	4840           	swap d0
    15f6:	2200           	move.l d0,d1
    15f8:	0681 0084 0000 	addi.l #8650752,d1
    15fe:	2f41 0018      	move.l d1,24(sp)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    1602:	202f 001c      	move.l 28(sp),d0
    1606:	0280 0000 ffff 	andi.l #65535,d0
    160c:	2400           	move.l d0,d2
    160e:	0682 0086 0000 	addi.l #8781824,d2
    1614:	2f42 0014      	move.l d2,20(sp)
  //clpartinstruction = Cl102ZoomInit;
  *cl++ = cop2lch;
    1618:	202f 005c      	move.l 92(sp),d0
    161c:	2200           	move.l d0,d1
    161e:	5881           	addq.l #4,d1
    1620:	2f41 005c      	move.l d1,92(sp)
    1624:	2040           	movea.l d0,a0
    1626:	20af 0018      	move.l 24(sp),(a0)
  *cl++ = cop2lcl;
    162a:	202f 005c      	move.l 92(sp),d0
    162e:	2200           	move.l d0,d1
    1630:	5881           	addq.l #4,d1
    1632:	2f41 005c      	move.l d1,92(sp)
    1636:	2040           	movea.l d0,a0
    1638:	20af 0014      	move.l 20(sp),(a0)
  *cl++ = 0x2c01ff00;
    163c:	202f 005c      	move.l 92(sp),d0
    1640:	2200           	move.l d0,d1
    1642:	5881           	addq.l #4,d1
    1644:	2f41 005c      	move.l d1,92(sp)
    1648:	2040           	movea.l d0,a0
    164a:	20bc 2c01 ff00 	move.l #738328320,(a0)

  ULONG cop2br1 = cop2 + ( (30)<<2);
    1650:	7078           	moveq #120,d0
    1652:	d0af 001c      	add.l 28(sp),d0
    1656:	2f40 0010      	move.l d0,16(sp)
  ULONG cop2br2 = cop2 + ( (86)<<2);
    165a:	222f 001c      	move.l 28(sp),d1
    165e:	0681 0000 0158 	addi.l #344,d1
    1664:	2f41 000c      	move.l d1,12(sp)
  clpartinstruction = Cl102ZoomRepeat;
    1668:	2f7c 0000 a66c 	move.l #42604,88(sp)
    166e:	0058 
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    1670:	202f 0010      	move.l 16(sp),d0
    1674:	4240           	clr.w d0
    1676:	4840           	swap d0
    1678:	307c 0070      	movea.w #112,a0
    167c:	d1ef 0058      	adda.l 88(sp),a0
    1680:	0680 0084 0000 	addi.l #8650752,d0
    1686:	2080           	move.l d0,(a0)
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    1688:	202f 0010      	move.l 16(sp),d0
    168c:	0280 0000 ffff 	andi.l #65535,d0
    1692:	307c 0074      	movea.w #116,a0
    1696:	d1ef 0058      	adda.l 88(sp),a0
    169a:	0680 0086 0000 	addi.l #8781824,d0
    16a0:	2080           	move.l d0,(a0)
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    16a2:	202f 000c      	move.l 12(sp),d0
    16a6:	4240           	clr.w d0
    16a8:	4840           	swap d0
    16aa:	206f 0058      	movea.l 88(sp),a0
    16ae:	41e8 0150      	lea 336(a0),a0
    16b2:	0680 0084 0000 	addi.l #8650752,d0
    16b8:	2080           	move.l d0,(a0)
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    16ba:	202f 000c      	move.l 12(sp),d0
    16be:	0280 0000 ffff 	andi.l #65535,d0
    16c4:	206f 0058      	movea.l 88(sp),a0
    16c8:	41e8 0154      	lea 340(a0),a0
    16cc:	0680 0086 0000 	addi.l #8781824,d0
    16d2:	2080           	move.l d0,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    16d4:	42af 0048      	clr.l 72(sp)
    16d8:	6024           	bra.s 16fe <ClbuildZoom+0x326>
    *cl++ = *clpartinstruction++;
    16da:	222f 0058      	move.l 88(sp),d1
    16de:	2401           	move.l d1,d2
    16e0:	5882           	addq.l #4,d2
    16e2:	2f42 0058      	move.l d2,88(sp)
    16e6:	202f 005c      	move.l 92(sp),d0
    16ea:	2400           	move.l d0,d2
    16ec:	5882           	addq.l #4,d2
    16ee:	2f42 005c      	move.l d2,92(sp)
    16f2:	2041           	movea.l d1,a0
    16f4:	2210           	move.l (a0),d1
    16f6:	2040           	movea.l d0,a0
    16f8:	2081           	move.l d1,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    16fa:	52af 0048      	addq.l #1,72(sp)
    16fe:	7071           	moveq #113,d0
    1700:	b0af 0048      	cmp.l 72(sp),d0
    1704:	6cd4           	bge.s 16da <ClbuildZoom+0x302>

   *cl++ = 0xfffffffe;
    1706:	202f 005c      	move.l 92(sp),d0
    170a:	2200           	move.l d0,d1
    170c:	5881           	addq.l #4,d1
    170e:	2f41 005c      	move.l d1,92(sp)
    1712:	74fe           	moveq #-2,d2
    1714:	2040           	movea.l d0,a0
    1716:	2082           	move.l d2,(a0)

  return retval;
    1718:	202f 0038      	move.l 56(sp),d0
}
    171c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1720:	4fef 0054      	lea 84(sp),sp
    1724:	4e75           	rts

00001726 <PrepareDisplayZoom>:

 int PrepareDisplayZoom() {
    1726:	4fef ffb8      	lea -72(sp),sp
    172a:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildZoom();
    172e:	4eba fca8      	jsr 13d8 <ClbuildZoom>(pc)
    1732:	23c0 004d 2b68 	move.l d0,4d2b68 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1738:	4eba fc9e      	jsr 13d8 <ClbuildZoom>(pc)
    173c:	23c0 004d 2b6c 	move.l d0,4d2b6c <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1742:	2f7c 0000 df20 	move.l #57120,80(sp)
    1748:	0050 
    174a:	7002           	moveq #2,d0
    174c:	2f40 004c      	move.l d0,76(sp)
    1750:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    1756:	2c40           	movea.l d0,a6
    1758:	202f 0050      	move.l 80(sp),d0
    175c:	222f 004c      	move.l 76(sp),d1
    1760:	4eae ff3a      	jsr -198(a6)
    1764:	2f40 0048      	move.l d0,72(sp)
    1768:	202f 0048      	move.l 72(sp),d0
    176c:	23c0 004d 2b60 	move.l d0,4d2b60 <Bitplane1>
  if(Bitplane1 == 0) {
    1772:	2039 004d 2b60 	move.l 4d2b60 <Bitplane1>,d0
    1778:	6658           	bne.s 17d2 <PrepareDisplayZoom+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    177a:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    1780:	2c40           	movea.l d0,a6
    1782:	4eae ffc4      	jsr -60(a6)
    1786:	2f40 0044      	move.l d0,68(sp)
    178a:	202f 0044      	move.l 68(sp),d0
    178e:	2f40 0040      	move.l d0,64(sp)
    1792:	2f7c 0000 7c09 	move.l #31753,60(sp)
    1798:	003c 
    179a:	7026           	moveq #38,d0
    179c:	2f40 0038      	move.l d0,56(sp)
    17a0:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    17a6:	2c40           	movea.l d0,a6
    17a8:	222f 0040      	move.l 64(sp),d1
    17ac:	242f 003c      	move.l 60(sp),d2
    17b0:	262f 0038      	move.l 56(sp),d3
    17b4:	4eae ffd0      	jsr -48(a6)
    17b8:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    17bc:	7001           	moveq #1,d0
    17be:	2f40 0030      	move.l d0,48(sp)
    17c2:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    17c8:	2c40           	movea.l d0,a6
    17ca:	222f 0030      	move.l 48(sp),d1
    17ce:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    17d2:	2039 004d 2b60 	move.l 4d2b60 <Bitplane1>,d0
    17d8:	23c0 004d 2b70 	move.l d0,4d2b70 <DrawBuffer>
  DrawCopper = Copperlist1;
    17de:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    17e4:	23c0 004d 2b78 	move.l d0,4d2b78 <DrawCopper>
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    17ea:	2f7c 0000 df20 	move.l #57120,44(sp)
    17f0:	002c 
    17f2:	7002           	moveq #2,d0
    17f4:	2f40 0028      	move.l d0,40(sp)
    17f8:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    17fe:	2c40           	movea.l d0,a6
    1800:	202f 002c      	move.l 44(sp),d0
    1804:	222f 0028      	move.l 40(sp),d1
    1808:	4eae ff3a      	jsr -198(a6)
    180c:	2f40 0024      	move.l d0,36(sp)
    1810:	202f 0024      	move.l 36(sp),d0
    1814:	23c0 004d 2b64 	move.l d0,4d2b64 <Bitplane2>
  if(Bitplane2 == 0) {
    181a:	2039 004d 2b64 	move.l 4d2b64 <Bitplane2>,d0
    1820:	6658           	bne.s 187a <PrepareDisplayZoom+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1822:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    1828:	2c40           	movea.l d0,a6
    182a:	4eae ffc4      	jsr -60(a6)
    182e:	2f40 0020      	move.l d0,32(sp)
    1832:	202f 0020      	move.l 32(sp),d0
    1836:	2f40 001c      	move.l d0,28(sp)
    183a:	2f7c 0000 7c30 	move.l #31792,24(sp)
    1840:	0018 
    1842:	7026           	moveq #38,d0
    1844:	2f40 0014      	move.l d0,20(sp)
    1848:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    184e:	2c40           	movea.l d0,a6
    1850:	222f 001c      	move.l 28(sp),d1
    1854:	242f 0018      	move.l 24(sp),d2
    1858:	262f 0014      	move.l 20(sp),d3
    185c:	4eae ffd0      	jsr -48(a6)
    1860:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    1864:	7001           	moveq #1,d0
    1866:	2f40 000c      	move.l d0,12(sp)
    186a:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    1870:	2c40           	movea.l d0,a6
    1872:	222f 000c      	move.l 12(sp),d1
    1876:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    187a:	2039 004d 2b64 	move.l 4d2b64 <Bitplane2>,d0
    1880:	23c0 004d 2b74 	move.l d0,4d2b74 <ViewBuffer>
  ViewCopper = Copperlist2; 
    1886:	2039 004d 2b6c 	move.l 4d2b6c <Copperlist2>,d0
    188c:	23c0 004d 2b7c 	move.l d0,4d2b7c <ViewCopper>
  return 0;
    1892:	7000           	moveq #0,d0
}
    1894:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1898:	4fef 0048      	lea 72(sp),sp
    189c:	4e75           	rts

0000189e <Init_Blit>:

void Init_Blit() {
  hw->bltafwm = 0xffff;
    189e:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    18a4:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    18aa:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    18b0:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    18b6:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    18bc:	317c 0026 0064 	move.w #38,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    18c2:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    18c8:	317c 0026 0062 	move.w #38,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    18ce:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    18d4:	317c 0026 0066 	move.w #38,102(a0)
}
    18da:	4e75           	rts

000018dc <Init_Blit2>:


void Init_Blit2() {
  hw->bltafwm = 0xffff;
    18dc:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    18e2:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    18e8:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    18ee:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = 36;
    18f4:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    18fa:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = 76;
    1900:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    1906:	317c 004c 0062 	move.w #76,98(a0)
  hw->bltdmod = ZMLINESIZE2 - 4;
    190c:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    1912:	317c 0028 0066 	move.w #40,102(a0)
}
    1918:	4e75           	rts

0000191a <Init_ZoomBlit>:

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
    191a:	4fef fff4      	lea -12(sp),sp
    191e:	206f 0010      	movea.l 16(sp),a0
    1922:	222f 0014      	move.l 20(sp),d1
    1926:	202f 0018      	move.l 24(sp),d0
    192a:	3048           	movea.w a0,a0
    192c:	3f48 0004      	move.w a0,4(sp)
    1930:	3201           	move.w d1,d1
    1932:	3f41 0002      	move.w d1,2(sp)
    1936:	3000           	move.w d0,d0
    1938:	3e80           	move.w d0,(sp)
  ZoomBlit_Increment4SrcA = 0;
    193a:	4279 004d 2bb6 	clr.w 4d2bb6 <ZoomBlit_Increment4SrcA>

  UWORD colnr = nextzoom - startofword - 1;                                                                          
    1940:	302f 0002      	move.w 2(sp),d0
    1944:	906f 0004      	sub.w 4(sp),d0
    1948:	3200           	move.w d0,d1
    194a:	5341           	subq.w #1,d1
    194c:	3f41 0008      	move.w d1,8(sp)
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
    1950:	3017           	move.w (sp),d0
    1952:	720c           	moveq #12,d1
    1954:	e368           	lsl.w d1,d0
    1956:	3f40 0006      	move.w d0,6(sp)
  UWORD shifta;
  if( shiftright == 0) {
    195a:	4a57           	tst.w (sp)
    195c:	6610           	bne.s 196e <Init_ZoomBlit+0x54>
    ZoomBlit_Increment4SrcA = 1;
    195e:	33fc 0001 004d 	move.w #1,4d2bb6 <ZoomBlit_Increment4SrcA>
    1964:	2bb6 
    shifta = 15 << 12;
    1966:	3f7c f000 000a 	move.w #-4096,10(sp)
    196c:	600c           	bra.s 197a <Init_ZoomBlit+0x60>
  } else {
    shifta = (shiftright - 1) << 12;
    196e:	3017           	move.w (sp),d0
    1970:	5340           	subq.w #1,d0
    1972:	720c           	moveq #12,d1
    1974:	e368           	lsl.w d1,d0
    1976:	3f40 000a      	move.w d0,10(sp)
  }
  WaitBlt(); 
    197a:	4eba e738      	jsr b4 <WaitBlt>(pc)
  hw->bltcon1 = shiftb; 
    197e:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    1984:	316f 0006 0042 	move.w 6(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    198a:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    1990:	302f 000a      	move.w 10(sp),d0
    1994:	0640 0de4      	addi.w #3556,d0
    1998:	3140 0040      	move.w d0,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    199c:	7000           	moveq #0,d0
    199e:	302f 0008      	move.w 8(sp),d0
    19a2:	7210           	moveq #16,d1
    19a4:	9280           	sub.l d0,d1
    19a6:	7000           	moveq #0,d0
    19a8:	4640           	not.w d0
    19aa:	e3a8           	lsl.l d1,d0
    19ac:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    19b2:	2000           	move.l d0,d0
    19b4:	3140 0070      	move.w d0,112(a0)
}
    19b8:	4fef 000c      	lea 12(sp),sp
    19bc:	4e75           	rts

000019be <Init_Copy>:

void Init_Copy( WORD shift) {
    19be:	598f           	subq.l #4,sp
    19c0:	202f 0008      	move.l 8(sp),d0
    19c4:	3000           	move.w d0,d0
    19c6:	3e80           	move.w d0,(sp)
  UWORD shiftright = shift << 12;
    19c8:	3017           	move.w (sp),d0
    19ca:	720c           	moveq #12,d1
    19cc:	e368           	lsl.w d1,d0
    19ce:	3f40 0002      	move.w d0,2(sp)
  WaitBlt();
    19d2:	4eba e6e0      	jsr b4 <WaitBlt>(pc)
  hw->bltcon0 = 0x9f0 + shiftright;
    19d6:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    19dc:	302f 0002      	move.w 2(sp),d0
    19e0:	0640 09f0      	addi.w #2544,d0
    19e4:	3140 0040      	move.w d0,64(a0)
  hw->bltcon1 = 0;
    19e8:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    19ee:	317c 0000 0042 	move.w #0,66(a0)
}
    19f4:	588f           	addq.l #4,sp
    19f6:	4e75           	rts

000019f8 <Zoom_ZoomIntoPicture>:

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    19f8:	4fef ffcc      	lea -52(sp),sp
    19fc:	222f 0040      	move.l 64(sp),d1
    1a00:	202f 0044      	move.l 68(sp),d0
    1a04:	3201           	move.w d1,d1
    1a06:	3f41 0002      	move.w d1,2(sp)
    1a0a:	3000           	move.w d0,d0
    1a0c:	3e80           	move.w d0,(sp)
  
  WaitBlt();  
    1a0e:	4eba e6a4      	jsr b4 <WaitBlt>(pc)
  Init_Blit();
    1a12:	4eba fe8a      	jsr 189e <Init_Blit>(pc)
  WORD shiftright = 9;
    1a16:	3f7c 0009 0032 	move.w #9,50(sp)
  UWORD shifthoriz = 7;
    1a1c:	3f7c 0007 0030 	move.w #7,48(sp)
  UWORD startofword = 21*16;
    1a22:	3f7c 0150 002e 	move.w #336,46(sp)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1a28:	322f 0002      	move.w 2(sp),d1
    1a2c:	3001           	move.w d1,d0
    1a2e:	d040           	add.w d0,d0
    1a30:	d040           	add.w d0,d0
    1a32:	d041           	add.w d1,d0
    1a34:	d040           	add.w d0,d0
    1a36:	0640 014c      	addi.w #332,d0
    1a3a:	3f40 002c      	move.w d0,44(sp)
    1a3e:	601a           	bra.s 1a5a <Zoom_ZoomIntoPicture+0x62>
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    1a40:	302f 002c      	move.w 44(sp),d0
    1a44:	906f 0002      	sub.w 2(sp),d0
    1a48:	0640 ffed      	addi.w #-19,d0
    1a4c:	3f40 002c      	move.w d0,44(sp)
    shiftright--;
    1a50:	302f 0032      	move.w 50(sp),d0
    1a54:	5340           	subq.w #1,d0
    1a56:	3f40 0032      	move.w d0,50(sp)
  while( nextzoom > 22 * 16) {
    1a5a:	0c6f 0160 002c 	cmpi.w #352,44(sp)
    1a60:	6ede           	bgt.s 1a40 <Zoom_ZoomIntoPicture+0x48>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
    1a62:	426f 002a      	clr.w 42(sp)
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    1a66:	322f 0002      	move.w 2(sp),d1
    1a6a:	3001           	move.w d1,d0
    1a6c:	d040           	add.w d0,d0
    1a6e:	d040           	add.w d0,d0
    1a70:	d041           	add.w d1,d0
    1a72:	4440           	neg.w d0
    1a74:	0640 0012      	addi.w #18,d0
    1a78:	3f40 0028      	move.w d0,40(sp)
    1a7c:	601c           	bra.s 1a9a <Zoom_ZoomIntoPicture+0xa2>
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    1a7e:	302f 0028      	move.w 40(sp),d0
    1a82:	d06f 0002      	add.w 2(sp),d0
    1a86:	0640 0013      	addi.w #19,d0
    1a8a:	3f40 0028      	move.w d0,40(sp)
      shifthoriz--;
    1a8e:	302f 0030      	move.w 48(sp),d0
    1a92:	3200           	move.w d0,d1
    1a94:	5341           	subq.w #1,d1
    1a96:	3f41 0030      	move.w d1,48(sp)
  while( ZoomHorizontalStart < 0) {
    1a9a:	4a6f 0028      	tst.w 40(sp)
    1a9e:	6dde           	blt.s 1a7e <Zoom_ZoomIntoPicture+0x86>
  } 

  for(int i=0;i<22;i++) {
    1aa0:	42af 0024      	clr.l 36(sp)
    1aa4:	6000 02ca      	bra.w 1d70 <Zoom_ZoomIntoPicture+0x378>

    ZoomHorizontal = ZoomHorizontalStart;
    1aa8:	33ef 0028 004d 	move.w 40(sp),4d2bd2 <ZoomHorizontal>
    1aae:	2bd2 

    WORD linesleft = 272;
    1ab0:	3f7c 0110 0022 	move.w #272,34(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1ab6:	7000           	moveq #0,d0
    1ab8:	302f 0030      	move.w 48(sp),d0
    1abc:	7200           	moveq #0,d1
    1abe:	3217           	move.w (sp),d1
    1ac0:	2f01           	move.l d1,-(sp)
    1ac2:	2f00           	move.l d0,-(sp)
    1ac4:	4eb9 0000 7070 	jsr 7070 <__mulsi3>
    1aca:	508f           	addq.l #8,sp
    1acc:	2200           	move.l d0,d1
    1ace:	2001           	move.l d1,d0
    1ad0:	d080           	add.l d0,d0
    1ad2:	d081           	add.l d1,d0
    1ad4:	2200           	move.l d0,d1
    1ad6:	e789           	lsl.l #3,d1
    1ad8:	9280           	sub.l d0,d1
    1ada:	202f 0024      	move.l 36(sp),d0
    1ade:	9280           	sub.l d0,d1
    1ae0:	2001           	move.l d1,d0
    1ae2:	0680 8000 0013 	addi.l #-2147483629,d0
    1ae8:	d080           	add.l d0,d0
    1aea:	222f 0038      	move.l 56(sp),d1
    1aee:	d280           	add.l d0,d1
    1af0:	2f41 001e      	move.l d1,30(sp)
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1af4:	202f 0024      	move.l 36(sp),d0
    1af8:	7213           	moveq #19,d1
    1afa:	9280           	sub.l d0,d1
    1afc:	2001           	move.l d1,d0
    1afe:	d081           	add.l d1,d0
    1b00:	222f 003c      	move.l 60(sp),d1
    1b04:	d280           	add.l d0,d1
    1b06:	2f41 001a      	move.l d1,26(sp)
    
    UWORD onestep = ZMLINESIZE/2*planes;
    1b0a:	3017           	move.w (sp),d0
    1b0c:	c1fc 0015      	muls.w #21,d0
    1b10:	3f40 0018      	move.w d0,24(sp)
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1b14:	7000           	moveq #0,d0
    1b16:	302f 002e      	move.w 46(sp),d0
    1b1a:	306f 002c      	movea.w 44(sp),a0
    1b1e:	b1c0           	cmpa.l d0,a0
    1b20:	6e00 0106      	bgt.w 1c28 <Zoom_ZoomIntoPicture+0x230>
      Init_Copy( shiftright);
    1b24:	306f 0032      	movea.w 50(sp),a0
    1b28:	2f08           	move.l a0,-(sp)
    1b2a:	4eba fe92      	jsr 19be <Init_Copy>(pc)
    1b2e:	588f           	addq.l #4,sp
    1b30:	6000 00ea      	bra.w 1c1c <Zoom_ZoomIntoPicture+0x224>
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1b34:	3039 004d 2bd2 	move.w 4d2bd2 <ZoomHorizontal>,d0
    1b3a:	b06f 0022      	cmp.w 34(sp),d0
    1b3e:	6c12           	bge.s 1b52 <Zoom_ZoomIntoPicture+0x15a>
          linesleft -= ZoomHorizontal;
    1b40:	322f 0022      	move.w 34(sp),d1
    1b44:	3039 004d 2bd2 	move.w 4d2bd2 <ZoomHorizontal>,d0
    1b4a:	9240           	sub.w d0,d1
    1b4c:	3f41 0022      	move.w d1,34(sp)
    1b50:	600c           	bra.s 1b5e <Zoom_ZoomIntoPicture+0x166>
        } else {
          ZoomHorizontal = linesleft;
    1b52:	33ef 0022 004d 	move.w 34(sp),4d2bd2 <ZoomHorizontal>
    1b58:	2bd2 
          linesleft = 0;
    1b5a:	426f 0022      	clr.w 34(sp)
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
    1b5e:	3039 004d 2bd2 	move.w 4d2bd2 <ZoomHorizontal>,d0
    1b64:	322f 0018      	move.w 24(sp),d1
    1b68:	c3c0           	muls.w d0,d1
    1b6a:	3f41 000c      	move.w d1,12(sp)
        //Add aditional line
        if( linesleft>0) {
    1b6e:	4a6f 0022      	tst.w 34(sp)
    1b72:	6f4c           	ble.s 1bc0 <Zoom_ZoomIntoPicture+0x1c8>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1b74:	7200           	moveq #0,d1
    1b76:	322f 000c      	move.w 12(sp),d1
    1b7a:	7000           	moveq #0,d0
    1b7c:	302f 002a      	move.w 42(sp),d0
    1b80:	d081           	add.l d1,d0
    1b82:	d080           	add.l d0,d0
    1b84:	222f 001e      	move.l 30(sp),d1
    1b88:	d280           	add.l d0,d1
    1b8a:	2f41 0008      	move.l d1,8(sp)
          UWORD *tmpdest = pos4dest +  size4blit;
    1b8e:	7000           	moveq #0,d0
    1b90:	302f 000c      	move.w 12(sp),d0
    1b94:	d080           	add.l d0,d0
    1b96:	222f 001a      	move.l 26(sp),d1
    1b9a:	d280           	add.l d0,d1
    1b9c:	2f41 0004      	move.l d1,4(sp)
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
    1ba0:	7000           	moveq #0,d0
    1ba2:	3017           	move.w (sp),d0
    1ba4:	2f00           	move.l d0,-(sp)
    1ba6:	2f2f 0008      	move.l 8(sp),-(sp)
    1baa:	2f2f 0010      	move.l 16(sp),-(sp)
    1bae:	4eba f3b0      	jsr f60 <Zoom_CopyWord>(pc)
    1bb2:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1bb6:	302f 0022      	move.w 34(sp),d0
    1bba:	5340           	subq.w #1,d0
    1bbc:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1bc0:	3039 004d 2bd2 	move.w 4d2bd2 <ZoomHorizontal>,d0
    1bc6:	c1d7           	muls.w (sp),d0
    1bc8:	7200           	moveq #0,d1
    1bca:	3200           	move.w d0,d1
    1bcc:	7000           	moveq #0,d0
    1bce:	302f 002a      	move.w 42(sp),d0
    1bd2:	d080           	add.l d0,d0
    1bd4:	d0af 001e      	add.l 30(sp),d0
    1bd8:	2f01           	move.l d1,-(sp)
    1bda:	2f2f 001e      	move.l 30(sp),-(sp)
    1bde:	2f00           	move.l d0,-(sp)
    1be0:	4eba f37e      	jsr f60 <Zoom_CopyWord>(pc)
    1be4:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1be8:	7000           	moveq #0,d0
    1bea:	302f 000c      	move.w 12(sp),d0
    1bee:	d080           	add.l d0,d0
    1bf0:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep; 
    1bf4:	7200           	moveq #0,d1
    1bf6:	322f 000c      	move.w 12(sp),d1
    1bfa:	7000           	moveq #0,d0
    1bfc:	302f 0018      	move.w 24(sp),d0
    1c00:	d081           	add.l d1,d0
    1c02:	d080           	add.l d0,d0
    1c04:	d1af 001a      	add.l d0,26(sp)
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1c08:	302f 0002      	move.w 2(sp),d0
    1c0c:	d040           	add.w d0,d0
    1c0e:	906f 0002      	sub.w 2(sp),d0
    1c12:	0640 0012      	addi.w #18,d0
    1c16:	33c0 004d 2bd2 	move.w d0,4d2bd2 <ZoomHorizontal>
      while(linesleft > 0) {
    1c1c:	4a6f 0022      	tst.w 34(sp)
    1c20:	6e00 ff12      	bgt.w 1b34 <Zoom_ZoomIntoPicture+0x13c>
    1c24:	6000 0140      	bra.w 1d66 <Zoom_ZoomIntoPicture+0x36e>
      }
    } else {  
      Init_ZoomBlit( startofword, nextzoom, shiftright);   
    1c28:	326f 0032      	movea.w 50(sp),a1
    1c2c:	306f 002c      	movea.w 44(sp),a0
    1c30:	7000           	moveq #0,d0
    1c32:	302f 002e      	move.w 46(sp),d0
    1c36:	2f09           	move.l a1,-(sp)
    1c38:	2f08           	move.l a0,-(sp)
    1c3a:	2f00           	move.l d0,-(sp)
    1c3c:	4eba fcdc      	jsr 191a <Init_ZoomBlit>(pc)
    1c40:	4fef 000c      	lea 12(sp),sp
      nextzoom -= (19 + zoomnr);
    1c44:	302f 002c      	move.w 44(sp),d0
    1c48:	906f 0002      	sub.w 2(sp),d0
    1c4c:	0640 ffed      	addi.w #-19,d0
    1c50:	3f40 002c      	move.w d0,44(sp)
    1c54:	6000 00ea      	bra.w 1d40 <Zoom_ZoomIntoPicture+0x348>
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1c58:	3039 004d 2bd2 	move.w 4d2bd2 <ZoomHorizontal>,d0
    1c5e:	b06f 0022      	cmp.w 34(sp),d0
    1c62:	6c12           	bge.s 1c76 <Zoom_ZoomIntoPicture+0x27e>
          linesleft -= ZoomHorizontal;
    1c64:	322f 0022      	move.w 34(sp),d1
    1c68:	3039 004d 2bd2 	move.w 4d2bd2 <ZoomHorizontal>,d0
    1c6e:	9240           	sub.w d0,d1
    1c70:	3f41 0022      	move.w d1,34(sp)
    1c74:	600c           	bra.s 1c82 <Zoom_ZoomIntoPicture+0x28a>
        } else {
          ZoomHorizontal = linesleft;
    1c76:	33ef 0022 004d 	move.w 34(sp),4d2bd2 <ZoomHorizontal>
    1c7c:	2bd2 
          linesleft = 0;
    1c7e:	426f 0022      	clr.w 34(sp)
        }
        UWORD size4blit = ZoomHorizontal*onestep;
    1c82:	3039 004d 2bd2 	move.w 4d2bd2 <ZoomHorizontal>,d0
    1c88:	322f 0018      	move.w 24(sp),d1
    1c8c:	c3c0           	muls.w d0,d1
    1c8e:	3f41 0016      	move.w d1,22(sp)
        //Add aditional line
        if( linesleft>0) {
    1c92:	4a6f 0022      	tst.w 34(sp)
    1c96:	6f4c           	ble.s 1ce4 <Zoom_ZoomIntoPicture+0x2ec>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1c98:	7200           	moveq #0,d1
    1c9a:	322f 0016      	move.w 22(sp),d1
    1c9e:	7000           	moveq #0,d0
    1ca0:	302f 002a      	move.w 42(sp),d0
    1ca4:	d081           	add.l d1,d0
    1ca6:	d080           	add.l d0,d0
    1ca8:	222f 001e      	move.l 30(sp),d1
    1cac:	d280           	add.l d0,d1
    1cae:	2f41 0012      	move.l d1,18(sp)
          UWORD *tmpdest = pos4dest + size4blit;
    1cb2:	7000           	moveq #0,d0
    1cb4:	302f 0016      	move.w 22(sp),d0
    1cb8:	d080           	add.l d0,d0
    1cba:	222f 001a      	move.l 26(sp),d1
    1cbe:	d280           	add.l d0,d1
    1cc0:	2f41 000e      	move.l d1,14(sp)
          
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
    1cc4:	7000           	moveq #0,d0
    1cc6:	3017           	move.w (sp),d0
    1cc8:	2f00           	move.l d0,-(sp)
    1cca:	2f2f 0012      	move.l 18(sp),-(sp)
    1cce:	2f2f 001a      	move.l 26(sp),-(sp)
    1cd2:	4eba f2ca      	jsr f9e <Zoom_ZoomBlit>(pc)
    1cd6:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1cda:	302f 0022      	move.w 34(sp),d0
    1cde:	5340           	subq.w #1,d0
    1ce0:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1ce4:	3039 004d 2bd2 	move.w 4d2bd2 <ZoomHorizontal>,d0
    1cea:	c1d7           	muls.w (sp),d0
    1cec:	7200           	moveq #0,d1
    1cee:	3200           	move.w d0,d1
    1cf0:	7000           	moveq #0,d0
    1cf2:	302f 002a      	move.w 42(sp),d0
    1cf6:	d080           	add.l d0,d0
    1cf8:	d0af 001e      	add.l 30(sp),d0
    1cfc:	2f01           	move.l d1,-(sp)
    1cfe:	2f2f 001e      	move.l 30(sp),-(sp)
    1d02:	2f00           	move.l d0,-(sp)
    1d04:	4eba f298      	jsr f9e <Zoom_ZoomBlit>(pc)
    1d08:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1d0c:	7000           	moveq #0,d0
    1d0e:	302f 0016      	move.w 22(sp),d0
    1d12:	d080           	add.l d0,d0
    1d14:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep;   
    1d18:	7200           	moveq #0,d1
    1d1a:	322f 0016      	move.w 22(sp),d1
    1d1e:	7000           	moveq #0,d0
    1d20:	302f 0018      	move.w 24(sp),d0
    1d24:	d081           	add.l d1,d0
    1d26:	d080           	add.l d0,d0
    1d28:	d1af 001a      	add.l d0,26(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1d2c:	302f 0002      	move.w 2(sp),d0
    1d30:	d040           	add.w d0,d0
    1d32:	906f 0002      	sub.w 2(sp),d0
    1d36:	0640 0012      	addi.w #18,d0
    1d3a:	33c0 004d 2bd2 	move.w d0,4d2bd2 <ZoomHorizontal>
      while( linesleft > 0) {
    1d40:	4a6f 0022      	tst.w 34(sp)
    1d44:	6e00 ff12      	bgt.w 1c58 <Zoom_ZoomIntoPicture+0x260>
      }
      shiftright--;  
    1d48:	302f 0032      	move.w 50(sp),d0
    1d4c:	5340           	subq.w #1,d0
    1d4e:	3f40 0032      	move.w d0,50(sp)
      if(shiftright < 0) {
    1d52:	6a12           	bpl.s 1d66 <Zoom_ZoomIntoPicture+0x36e>
        shiftright += 16;
    1d54:	302f 0032      	move.w 50(sp),d0
    1d58:	0640 0010      	addi.w #16,d0
    1d5c:	3f40 0032      	move.w d0,50(sp)
        shifttoleft = 1;
    1d60:	3f7c 0001 002a 	move.w #1,42(sp)
      }
    }
    startofword -= 16;
    1d66:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    1d6c:	52af 0024      	addq.l #1,36(sp)
    1d70:	7015           	moveq #21,d0
    1d72:	b0af 0024      	cmp.l 36(sp),d0
    1d76:	6c00 fd30      	bge.w 1aa8 <Zoom_ZoomIntoPicture+0xb0>
  }
}
    1d7a:	4fef 0034      	lea 52(sp),sp
    1d7e:	4e75           	rts

00001d80 <Zoom_SetBplPointers>:

void Zoom_SetBplPointers( UWORD *buffer, ULONG *copper) {
    1d80:	4fef ffb0      	lea -80(sp),sp
  //                   0  1  1   1   1   0   1   1    1    1    0    1    1    0    1    1
  //int zoomoffset[] = { 0, 0, 42, 42, 84, 84, 84, 126, 126, 168, 168, 168, 210, 210, 210, 332};
  //int zoomoffset[] = { 252, 210, 210, 210, 168, 168, 168, 126, 126, 84, 84, 84, 42, 42, 0, 0 };
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
    1d84:	204f           	movea.l sp,a0
    1d86:	223c 0000 7c8c 	move.l #31884,d1
    1d8c:	7040           	moveq #64,d0
    1d8e:	2f00           	move.l d0,-(sp)
    1d90:	2f01           	move.l d1,-(sp)
    1d92:	2f08           	move.l a0,-(sp)
    1d94:	4eba 4f7c      	jsr 6d12 <memcpy>(pc)
    1d98:	4fef 000c      	lea 12(sp),sp

  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
    1d9c:	3039 004d 2bce 	move.w 4d2bce <Zoom_LevelOf102Zoom>,d0
    1da2:	3000           	move.w d0,d0
    1da4:	0280 0000 ffff 	andi.l #65535,d0
    1daa:	d080           	add.l d0,d0
    1dac:	d080           	add.l d0,d0
    1dae:	41ef 0050      	lea 80(sp),a0
    1db2:	d1c0           	adda.l d0,a0
    1db4:	41e8 ffb0      	lea -80(a0),a0
    1db8:	2010           	move.l (a0),d0
    1dba:	d080           	add.l d0,d0
    1dbc:	d0af 0054      	add.l 84(sp),d0
    1dc0:	2f40 004c      	move.l d0,76(sp)
  /*ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;*/
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
    1dc4:	7072           	moveq #114,d0
    1dc6:	d0af 0058      	add.l 88(sp),d0
    1dca:	2f40 0048      	move.l d0,72(sp)
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1dce:	42af 0044      	clr.l 68(sp)
    1dd2:	6036           	bra.s 1e0a <Zoom_SetBplPointers+0x8a>
    UWORD highword = (ULONG)plane2set >> 16;
    1dd4:	202f 004c      	move.l 76(sp),d0
    1dd8:	4240           	clr.w d0
    1dda:	4840           	swap d0
    1ddc:	3f40 0042      	move.w d0,66(sp)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1de0:	3f6f 004e 0040 	move.w 78(sp),64(sp)
    *posofcopper = highword;
    1de6:	206f 0048      	movea.l 72(sp),a0
    1dea:	30af 0042      	move.w 66(sp),(a0)
    posofcopper += 2;
    1dee:	58af 0048      	addq.l #4,72(sp)
    *posofcopper = lowword;
    1df2:	206f 0048      	movea.l 72(sp),a0
    1df6:	30af 0040      	move.w 64(sp),(a0)
    posofcopper += 2;
    1dfa:	58af 0048      	addq.l #4,72(sp)
    plane2set += 42*268; //Next plane
    1dfe:	06af 0000 2bf8 	addi.l #11256,76(sp)
    1e04:	004c 
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1e06:	52af 0044      	addq.l #1,68(sp)
    1e0a:	7004           	moveq #4,d0
    1e0c:	b0af 0044      	cmp.l 68(sp),d0
    1e10:	6cc2           	bge.s 1dd4 <Zoom_SetBplPointers+0x54>
  }
  
}
    1e12:	4fef 0050      	lea 80(sp),sp
    1e16:	4e75           	rts

00001e18 <Zoom_SwapBuffers>:

void Zoom_SwapBuffers( UWORD zoomlevel) {
    1e18:	598f           	subq.l #4,sp
    1e1a:	2f02           	move.l d2,-(sp)
    1e1c:	202f 000c      	move.l 12(sp),d0
    1e20:	3000           	move.w d0,d0
    1e22:	3f40 0006      	move.w d0,6(sp)

  ViewBuffer = rawzoom + (42*268*5*zoomlevel);
    1e26:	2439 0000 b804 	move.l b804 <rawzoom>,d2
    1e2c:	7000           	moveq #0,d0
    1e2e:	302f 0006      	move.w 6(sp),d0
    1e32:	2f3c 0000 dbd8 	move.l #56280,-(sp)
    1e38:	2f00           	move.l d0,-(sp)
    1e3a:	4eb9 0000 7070 	jsr 7070 <__mulsi3>
    1e40:	508f           	addq.l #8,sp
    1e42:	d082           	add.l d2,d0
    1e44:	23c0 004d 2b74 	move.l d0,4d2b74 <ViewBuffer>
  /*ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;*/
}
    1e4a:	241f           	move.l (sp)+,d2
    1e4c:	588f           	addq.l #4,sp
    1e4e:	4e75           	rts

00001e50 <Test_Zoom2>:
#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
    1e50:	4fef ff00      	lea -256(sp),sp
    1e54:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  //Test Zoomlevel 1
  volatile ULONG *srcsmall = AllocMem( 80, MEMF_CHIP);
    1e58:	7050           	moveq #80,d0
    1e5a:	2f40 00f0      	move.l d0,240(sp)
    1e5e:	7002           	moveq #2,d0
    1e60:	2f40 00ec      	move.l d0,236(sp)
    1e64:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    1e6a:	2c40           	movea.l d0,a6
    1e6c:	202f 00f0      	move.l 240(sp),d0
    1e70:	222f 00ec      	move.l 236(sp),d1
    1e74:	4eae ff3a      	jsr -198(a6)
    1e78:	2f40 00e8      	move.l d0,232(sp)
    1e7c:	202f 00e8      	move.l 232(sp),d0
    1e80:	2f40 00e4      	move.l d0,228(sp)
  if( srcsmall == 0) {
    1e84:	6646           	bne.s 1ecc <Test_Zoom2+0x7c>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcsmall\n", 42);
    1e86:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    1e8c:	2c40           	movea.l d0,a6
    1e8e:	4eae ffc4      	jsr -60(a6)
    1e92:	2f40 001c      	move.l d0,28(sp)
    1e96:	202f 001c      	move.l 28(sp),d0
    1e9a:	2f40 0018      	move.l d0,24(sp)
    1e9e:	2f7c 0000 7ccc 	move.l #31948,20(sp)
    1ea4:	0014 
    1ea6:	702a           	moveq #42,d0
    1ea8:	2f40 0010      	move.l d0,16(sp)
    1eac:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    1eb2:	2c40           	movea.l d0,a6
    1eb4:	222f 0018      	move.l 24(sp),d1
    1eb8:	242f 0014      	move.l 20(sp),d2
    1ebc:	262f 0010      	move.l 16(sp),d3
    1ec0:	4eae ffd0      	jsr -48(a6)
    1ec4:	2f40 000c      	move.l d0,12(sp)
    1ec8:	6000 0560      	bra.w 242a <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong(srcsmall, 0xaaaaaaaa, 2, 10, 0);
    1ecc:	42a7           	clr.l -(sp)
    1ece:	4878 000a      	pea a <_start+0xa>
    1ed2:	4878 0002      	pea 2 <_start+0x2>
    1ed6:	2f3c aaaa aaaa 	move.l #-1431655766,-(sp)
    1edc:	2f2f 00f4      	move.l 244(sp),-(sp)
    1ee0:	4eba e33a      	jsr 21c <Utils_FillLong>(pc)
    1ee4:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *srcbig = AllocMem( 160, MEMF_CHIP);
    1ee8:	2f7c 0000 00a0 	move.l #160,224(sp)
    1eee:	00e0 
    1ef0:	7002           	moveq #2,d0
    1ef2:	2f40 00dc      	move.l d0,220(sp)
    1ef6:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    1efc:	2c40           	movea.l d0,a6
    1efe:	202f 00e0      	move.l 224(sp),d0
    1f02:	222f 00dc      	move.l 220(sp),d1
    1f06:	4eae ff3a      	jsr -198(a6)
    1f0a:	2f40 00d8      	move.l d0,216(sp)
    1f0e:	202f 00d8      	move.l 216(sp),d0
    1f12:	2f40 00d4      	move.l d0,212(sp)
    if( srcbig == 0) {
    1f16:	6646           	bne.s 1f5e <Test_Zoom2+0x10e>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcbig\n", 40);
    1f18:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    1f1e:	2c40           	movea.l d0,a6
    1f20:	4eae ffc4      	jsr -60(a6)
    1f24:	2f40 0030      	move.l d0,48(sp)
    1f28:	202f 0030      	move.l 48(sp),d0
    1f2c:	2f40 002c      	move.l d0,44(sp)
    1f30:	2f7c 0000 7cf7 	move.l #31991,40(sp)
    1f36:	0028 
    1f38:	7028           	moveq #40,d0
    1f3a:	2f40 0024      	move.l d0,36(sp)
    1f3e:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    1f44:	2c40           	movea.l d0,a6
    1f46:	222f 002c      	move.l 44(sp),d1
    1f4a:	242f 0028      	move.l 40(sp),d2
    1f4e:	262f 0024      	move.l 36(sp),d3
    1f52:	4eae ffd0      	jsr -48(a6)
    1f56:	2f40 0020      	move.l d0,32(sp)
    1f5a:	6000 04ce      	bra.w 242a <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong( srcbig, 0x55555555, 2, 20, 0);
    1f5e:	42a7           	clr.l -(sp)
    1f60:	4878 0014      	pea 14 <_start+0x14>
    1f64:	4878 0002      	pea 2 <_start+0x2>
    1f68:	2f3c 5555 5555 	move.l #1431655765,-(sp)
    1f6e:	2f2f 00e4      	move.l 228(sp),-(sp)
    1f72:	4eba e2a8      	jsr 21c <Utils_FillLong>(pc)
    1f76:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *target = AllocMem( 168, MEMF_CHIP);
    1f7a:	2f7c 0000 00a8 	move.l #168,208(sp)
    1f80:	00d0 
    1f82:	7002           	moveq #2,d0
    1f84:	2f40 00cc      	move.l d0,204(sp)
    1f88:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    1f8e:	2c40           	movea.l d0,a6
    1f90:	202f 00d0      	move.l 208(sp),d0
    1f94:	222f 00cc      	move.l 204(sp),d1
    1f98:	4eae ff3a      	jsr -198(a6)
    1f9c:	2f40 00c8      	move.l d0,200(sp)
    1fa0:	202f 00c8      	move.l 200(sp),d0
    1fa4:	2f40 00c4      	move.l d0,196(sp)
  if( target == 0) {
    1fa8:	6646           	bne.s 1ff0 <Test_Zoom2+0x1a0>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
    1faa:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    1fb0:	2c40           	movea.l d0,a6
    1fb2:	4eae ffc4      	jsr -60(a6)
    1fb6:	2f40 0044      	move.l d0,68(sp)
    1fba:	202f 0044      	move.l 68(sp),d0
    1fbe:	2f40 0040      	move.l d0,64(sp)
    1fc2:	2f7c 0000 7d20 	move.l #32032,60(sp)
    1fc8:	003c 
    1fca:	7028           	moveq #40,d0
    1fcc:	2f40 0038      	move.l d0,56(sp)
    1fd0:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    1fd6:	2c40           	movea.l d0,a6
    1fd8:	222f 0040      	move.l 64(sp),d1
    1fdc:	242f 003c      	move.l 60(sp),d2
    1fe0:	262f 0038      	move.l 56(sp),d3
    1fe4:	4eae ffd0      	jsr -48(a6)
    1fe8:	2f40 0034      	move.l d0,52(sp)
    1fec:	6000 043c      	bra.w 242a <Test_Zoom2+0x5da>
    return;
  }
  WaitBlt();
    1ff0:	4eba e0c2      	jsr b4 <WaitBlt>(pc)
  hw->bltafwm = 0xffff;
    1ff4:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    1ffa:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2000:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    2006:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltdmod = 38;
    200c:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    2012:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcon1 = 1 << 12; //Shift src big
    2018:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    201e:	317c 1000 0042 	move.w #4096,66(a0)
  hw->bltcon0 = 0xde4; //Chanell settings and Shift src small
    2024:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    202a:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltcdat = 0x8000; //Show channel small if 1 else channel big
    2030:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    2036:	317c 8000 0070 	move.w #-32768,112(a0)
  //srcbig-shift   0010 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sbbb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    203c:	4878 0001      	pea 1 <_start+0x1>
    2040:	4878 004e      	pea 4e <_start+0x4e>
    2044:	4878 0026      	pea 26 <_start+0x26>
    2048:	4878 0002      	pea 2 <_start+0x2>
    204c:	2f2f 00d4      	move.l 212(sp),-(sp)
    2050:	2f2f 00e8      	move.l 232(sp),-(sp)
    2054:	2f2f 00fc      	move.l 252(sp),-(sp)
    2058:	4eba efa8      	jsr 1002 <Zoom_ZoomBlit2>(pc)
    205c:	4fef 001c      	lea 28(sp),sp
  UWORD *tmp = (UWORD *)target;
    2060:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2066:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    206c:	2c40           	movea.l d0,a6
    206e:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2072:	42af 0104      	clr.l 260(sp)
    2076:	605c           	bra.s 20d4 <Test_Zoom2+0x284>
    if( *tmp != 0xaaaa ) {
    2078:	206f 0108      	movea.l 264(sp),a0
    207c:	3010           	move.w (a0),d0
    207e:	0c40 aaaa      	cmpi.w #-21846,d0
    2082:	6746           	beq.s 20ca <Test_Zoom2+0x27a>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 1 failed\n", 40);
    2084:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    208a:	2c40           	movea.l d0,a6
    208c:	4eae ffc4      	jsr -60(a6)
    2090:	2f40 0058      	move.l d0,88(sp)
    2094:	202f 0058      	move.l 88(sp),d0
    2098:	2f40 0054      	move.l d0,84(sp)
    209c:	2f7c 0000 7d49 	move.l #32073,80(sp)
    20a2:	0050 
    20a4:	7028           	moveq #40,d0
    20a6:	2f40 004c      	move.l d0,76(sp)
    20aa:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    20b0:	2c40           	movea.l d0,a6
    20b2:	222f 0054      	move.l 84(sp),d1
    20b6:	242f 0050      	move.l 80(sp),d2
    20ba:	262f 004c      	move.l 76(sp),d3
    20be:	4eae ffd0      	jsr -48(a6)
    20c2:	2f40 0048      	move.l d0,72(sp)
    20c6:	6000 0362      	bra.w 242a <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    20ca:	7028           	moveq #40,d0
    20cc:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    20d0:	52af 0104      	addq.l #1,260(sp)
    20d4:	7001           	moveq #1,d0
    20d6:	b0af 0104      	cmp.l 260(sp),d0
    20da:	6c9c           	bge.s 2078 <Test_Zoom2+0x228>
  //srcbig-shift   0001 0101 0101 0101
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       ssbb bbbb bbbb bbbb
  //result:        1001 0101 0101 0101

  hw->bltcon1 = 2 << 12; //Shift src big
    20dc:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    20e2:	317c 2000 0042 	move.w #8192,66(a0)
  hw->bltcdat = 0xc000; //Show channel small if 1 else channel big
    20e8:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    20ee:	317c c000 0070 	move.w #-16384,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    20f4:	4878 0001      	pea 1 <_start+0x1>
    20f8:	4878 004e      	pea 4e <_start+0x4e>
    20fc:	4878 0026      	pea 26 <_start+0x26>
    2100:	4878 0002      	pea 2 <_start+0x2>
    2104:	2f2f 00d4      	move.l 212(sp),-(sp)
    2108:	2f2f 00e8      	move.l 232(sp),-(sp)
    210c:	2f2f 00fc      	move.l 252(sp),-(sp)
    2110:	4eba eef0      	jsr 1002 <Zoom_ZoomBlit2>(pc)
    2114:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2118:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    211e:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    2124:	2c40           	movea.l d0,a6
    2126:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    212a:	42af 0100      	clr.l 256(sp)
    212e:	605c           	bra.s 218c <Test_Zoom2+0x33c>
    if( *tmp != 0x9555 ) {
    2130:	206f 0108      	movea.l 264(sp),a0
    2134:	3010           	move.w (a0),d0
    2136:	0c40 9555      	cmpi.w #-27307,d0
    213a:	6746           	beq.s 2182 <Test_Zoom2+0x332>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 2 failed\n", 40);
    213c:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2142:	2c40           	movea.l d0,a6
    2144:	4eae ffc4      	jsr -60(a6)
    2148:	2f40 006c      	move.l d0,108(sp)
    214c:	202f 006c      	move.l 108(sp),d0
    2150:	2f40 0068      	move.l d0,104(sp)
    2154:	2f7c 0000 7d72 	move.l #32114,100(sp)
    215a:	0064 
    215c:	7028           	moveq #40,d0
    215e:	2f40 0060      	move.l d0,96(sp)
    2162:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2168:	2c40           	movea.l d0,a6
    216a:	222f 0068      	move.l 104(sp),d1
    216e:	242f 0064      	move.l 100(sp),d2
    2172:	262f 0060      	move.l 96(sp),d3
    2176:	4eae ffd0      	jsr -48(a6)
    217a:	2f40 005c      	move.l d0,92(sp)
    217e:	6000 02aa      	bra.w 242a <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    2182:	7028           	moveq #40,d0
    2184:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2188:	52af 0100      	addq.l #1,256(sp)
    218c:	7001           	moveq #1,d0
    218e:	b0af 0100      	cmp.l 256(sp),d0
    2192:	6c9c           	bge.s 2130 <Test_Zoom2+0x2e0>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2194:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    219a:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    21a0:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    21a6:	317c e000 0070 	move.w #-8192,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    21ac:	4878 0001      	pea 1 <_start+0x1>
    21b0:	4878 004e      	pea 4e <_start+0x4e>
    21b4:	4878 0026      	pea 26 <_start+0x26>
    21b8:	4878 0002      	pea 2 <_start+0x2>
    21bc:	2f2f 00d4      	move.l 212(sp),-(sp)
    21c0:	2f2f 00e8      	move.l 232(sp),-(sp)
    21c4:	2f2f 00fc      	move.l 252(sp),-(sp)
    21c8:	4eba ee38      	jsr 1002 <Zoom_ZoomBlit2>(pc)
    21cc:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    21d0:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    21d6:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    21dc:	2c40           	movea.l d0,a6
    21de:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    21e2:	42af 00fc      	clr.l 252(sp)
    21e6:	605c           	bra.s 2244 <Test_Zoom2+0x3f4>
    if( *tmp != 0xaaaa ) {
    21e8:	206f 0108      	movea.l 264(sp),a0
    21ec:	3010           	move.w (a0),d0
    21ee:	0c40 aaaa      	cmpi.w #-21846,d0
    21f2:	6746           	beq.s 223a <Test_Zoom2+0x3ea>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    21f4:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    21fa:	2c40           	movea.l d0,a6
    21fc:	4eae ffc4      	jsr -60(a6)
    2200:	2f40 0080      	move.l d0,128(sp)
    2204:	202f 0080      	move.l 128(sp),d0
    2208:	2f40 007c      	move.l d0,124(sp)
    220c:	2f7c 0000 7d9b 	move.l #32155,120(sp)
    2212:	0078 
    2214:	7028           	moveq #40,d0
    2216:	2f40 0074      	move.l d0,116(sp)
    221a:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2220:	2c40           	movea.l d0,a6
    2222:	222f 007c      	move.l 124(sp),d1
    2226:	242f 0078      	move.l 120(sp),d2
    222a:	262f 0074      	move.l 116(sp),d3
    222e:	4eae ffd0      	jsr -48(a6)
    2232:	2f40 0070      	move.l d0,112(sp)
    2236:	6000 01f2      	bra.w 242a <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    223a:	7028           	moveq #40,d0
    223c:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2240:	52af 00fc      	addq.l #1,252(sp)
    2244:	7001           	moveq #1,d0
    2246:	b0af 00fc      	cmp.l 252(sp),d0
    224a:	6c9c           	bge.s 21e8 <Test_Zoom2+0x398>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    224c:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    2252:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    2258:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    225e:	317c e000 0070 	move.w #-8192,112(a0)

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2264:	4878 0001      	pea 1 <_start+0x1>
    2268:	4878 004e      	pea 4e <_start+0x4e>
    226c:	4878 0026      	pea 26 <_start+0x26>
    2270:	4878 0002      	pea 2 <_start+0x2>
    2274:	2f2f 00d4      	move.l 212(sp),-(sp)
    2278:	2f2f 00e8      	move.l 232(sp),-(sp)
    227c:	2f2f 00fc      	move.l 252(sp),-(sp)
    2280:	4eba ed80      	jsr 1002 <Zoom_ZoomBlit2>(pc)
    2284:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2288:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    228e:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    2294:	2c40           	movea.l d0,a6
    2296:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    229a:	42af 00f8      	clr.l 248(sp)
    229e:	605c           	bra.s 22fc <Test_Zoom2+0x4ac>
    if( *tmp != 0xaaaa ) {
    22a0:	206f 0108      	movea.l 264(sp),a0
    22a4:	3010           	move.w (a0),d0
    22a6:	0c40 aaaa      	cmpi.w #-21846,d0
    22aa:	6746           	beq.s 22f2 <Test_Zoom2+0x4a2>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    22ac:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    22b2:	2c40           	movea.l d0,a6
    22b4:	4eae ffc4      	jsr -60(a6)
    22b8:	2f40 0094      	move.l d0,148(sp)
    22bc:	202f 0094      	move.l 148(sp),d0
    22c0:	2f40 0090      	move.l d0,144(sp)
    22c4:	2f7c 0000 7d9b 	move.l #32155,140(sp)
    22ca:	008c 
    22cc:	7028           	moveq #40,d0
    22ce:	2f40 0088      	move.l d0,136(sp)
    22d2:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    22d8:	2c40           	movea.l d0,a6
    22da:	222f 0090      	move.l 144(sp),d1
    22de:	242f 008c      	move.l 140(sp),d2
    22e2:	262f 0088      	move.l 136(sp),d3
    22e6:	4eae ffd0      	jsr -48(a6)
    22ea:	2f40 0084      	move.l d0,132(sp)
    22ee:	6000 013a      	bra.w 242a <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    22f2:	7028           	moveq #40,d0
    22f4:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    22f8:	52af 00f8      	addq.l #1,248(sp)
    22fc:	7001           	moveq #1,d0
    22fe:	b0af 00f8      	cmp.l 248(sp),d0
    2302:	6c9c           	bge.s 22a0 <Test_Zoom2+0x450>
  //srcsmall:            1010 1010 1010 1010
  //srcsmall-shift:      0101 0101 0101 0101
  //pattern:             sssb bbbb bbbb bbbb
  //result:              0100 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2304:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    230a:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    2310:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    2316:	317c e000 0070 	move.w #-8192,112(a0)
  hw->bltcon0 = 0xde4 + (1 << 12); //Chanell settings and Shift src small
    231c:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    2322:	317c 1de4 0040 	move.w #7652,64(a0)
 
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2328:	4878 0001      	pea 1 <_start+0x1>
    232c:	4878 004e      	pea 4e <_start+0x4e>
    2330:	4878 0026      	pea 26 <_start+0x26>
    2334:	4878 0002      	pea 2 <_start+0x2>
    2338:	2f2f 00d4      	move.l 212(sp),-(sp)
    233c:	2f2f 00e8      	move.l 232(sp),-(sp)
    2340:	2f2f 00fc      	move.l 252(sp),-(sp)
    2344:	4eba ecbc      	jsr 1002 <Zoom_ZoomBlit2>(pc)
    2348:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    234c:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2352:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    2358:	2c40           	movea.l d0,a6
    235a:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    235e:	42af 00f4      	clr.l 244(sp)
    2362:	605a           	bra.s 23be <Test_Zoom2+0x56e>
    if( *tmp != 0x4aaa ) {
    2364:	206f 0108      	movea.l 264(sp),a0
    2368:	3010           	move.w (a0),d0
    236a:	0c40 4aaa      	cmpi.w #19114,d0
    236e:	6744           	beq.s 23b4 <Test_Zoom2+0x564>
      Write( Output(), "Test_Zoom2: Test for shifting a failed\n", 39);
    2370:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2376:	2c40           	movea.l d0,a6
    2378:	4eae ffc4      	jsr -60(a6)
    237c:	2f40 00a8      	move.l d0,168(sp)
    2380:	202f 00a8      	move.l 168(sp),d0
    2384:	2f40 00a4      	move.l d0,164(sp)
    2388:	2f7c 0000 7dc4 	move.l #32196,160(sp)
    238e:	00a0 
    2390:	7027           	moveq #39,d0
    2392:	2f40 009c      	move.l d0,156(sp)
    2396:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    239c:	2c40           	movea.l d0,a6
    239e:	222f 00a4      	move.l 164(sp),d1
    23a2:	242f 00a0      	move.l 160(sp),d2
    23a6:	262f 009c      	move.l 156(sp),d3
    23aa:	4eae ffd0      	jsr -48(a6)
    23ae:	2f40 0098      	move.l d0,152(sp)
    23b2:	6076           	bra.s 242a <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    23b4:	7028           	moveq #40,d0
    23b6:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    23ba:	52af 00f4      	addq.l #1,244(sp)
    23be:	7001           	moveq #1,d0
    23c0:	b0af 00f4      	cmp.l 244(sp),d0
    23c4:	6c9e           	bge.s 2364 <Test_Zoom2+0x514>

  FreeMem( srcsmall, 80);
    23c6:	2f6f 00e4 00c0 	move.l 228(sp),192(sp)
    23cc:	7050           	moveq #80,d0
    23ce:	2f40 00bc      	move.l d0,188(sp)
    23d2:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    23d8:	2c40           	movea.l d0,a6
    23da:	226f 00c0      	movea.l 192(sp),a1
    23de:	202f 00bc      	move.l 188(sp),d0
    23e2:	4eae ff2e      	jsr -210(a6)
  FreeMem( srcbig, 160);
    23e6:	2f6f 00d4 00b8 	move.l 212(sp),184(sp)
    23ec:	2f7c 0000 00a0 	move.l #160,180(sp)
    23f2:	00b4 
    23f4:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    23fa:	2c40           	movea.l d0,a6
    23fc:	226f 00b8      	movea.l 184(sp),a1
    2400:	202f 00b4      	move.l 180(sp),d0
    2404:	4eae ff2e      	jsr -210(a6)
  FreeMem( target, 168);
    2408:	2f6f 00c4 00b0 	move.l 196(sp),176(sp)
    240e:	2f7c 0000 00a8 	move.l #168,172(sp)
    2414:	00ac 
    2416:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    241c:	2c40           	movea.l d0,a6
    241e:	226f 00b0      	movea.l 176(sp),a1
    2422:	202f 00ac      	move.l 172(sp),d0
    2426:	4eae ff2e      	jsr -210(a6)
    242a:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    242e:	4fef 0100      	lea 256(sp),sp
    2432:	4e75           	rts

00002434 <ClBuild>:
#include "utils.h"




ULONG * ClBuild() {
    2434:	4fef ffc4      	lea -60(sp),sp
    2438:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
    243c:	2f7c 0000 0084 	move.l #132,48(sp)
    2442:	0030 
    2444:	7002           	moveq #2,d0
    2446:	2f40 002c      	move.l d0,44(sp)
    244a:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    2450:	2c40           	movea.l d0,a6
    2452:	202f 0030      	move.l 48(sp),d0
    2456:	222f 002c      	move.l 44(sp),d1
    245a:	4eae ff3a      	jsr -198(a6)
    245e:	2f40 0028      	move.l d0,40(sp)
    2462:	202f 0028      	move.l 40(sp),d0
    2466:	2f40 0024      	move.l d0,36(sp)
  if( retval == 0) {
    246a:	6658           	bne.s 24c4 <ClBuild+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    246c:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2472:	2c40           	movea.l d0,a6
    2474:	4eae ffc4      	jsr -60(a6)
    2478:	2f40 0020      	move.l d0,32(sp)
    247c:	202f 0020      	move.l 32(sp),d0
    2480:	2f40 001c      	move.l d0,28(sp)
    2484:	2f7c 0000 7c57 	move.l #31831,24(sp)
    248a:	0018 
    248c:	7228           	moveq #40,d1
    248e:	2f41 0014      	move.l d1,20(sp)
    2492:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2498:	2c40           	movea.l d0,a6
    249a:	222f 001c      	move.l 28(sp),d1
    249e:	242f 0018      	move.l 24(sp),d2
    24a2:	262f 0014      	move.l 20(sp),d3
    24a6:	4eae ffd0      	jsr -48(a6)
    24aa:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    24ae:	7401           	moveq #1,d2
    24b0:	2f42 000c      	move.l d2,12(sp)
    24b4:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    24ba:	2c40           	movea.l d0,a6
    24bc:	222f 000c      	move.l 12(sp),d1
    24c0:	4eae ff70      	jsr -144(a6)
  }
    
  ULONG *cl = retval;
    24c4:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    24ca:	2f7c 0000 a5f0 	move.l #42480,64(sp)
    24d0:	0040 
  for(int i=0; i<16;i++)
    24d2:	42af 003c      	clr.l 60(sp)
    24d6:	6024           	bra.s 24fc <ClBuild+0xc8>
    *cl++ = *clpartinstruction++;
    24d8:	222f 0040      	move.l 64(sp),d1
    24dc:	2001           	move.l d1,d0
    24de:	5880           	addq.l #4,d0
    24e0:	2f40 0040      	move.l d0,64(sp)
    24e4:	202f 0044      	move.l 68(sp),d0
    24e8:	2400           	move.l d0,d2
    24ea:	5882           	addq.l #4,d2
    24ec:	2f42 0044      	move.l d2,68(sp)
    24f0:	2041           	movea.l d1,a0
    24f2:	2210           	move.l (a0),d1
    24f4:	2040           	movea.l d0,a0
    24f6:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    24f8:	52af 003c      	addq.l #1,60(sp)
    24fc:	700f           	moveq #15,d0
    24fe:	b0af 003c      	cmp.l 60(sp),d0
    2502:	6cd4           	bge.s 24d8 <ClBuild+0xa4>
  clpartinstruction = ClScreen;
    2504:	2f7c 0000 a630 	move.l #42544,64(sp)
    250a:	0040 
  for(int i=0; i<12;i++)
    250c:	42af 0038      	clr.l 56(sp)
    2510:	6024           	bra.s 2536 <ClBuild+0x102>
    *cl++ = *clpartinstruction++;
    2512:	222f 0040      	move.l 64(sp),d1
    2516:	2401           	move.l d1,d2
    2518:	5882           	addq.l #4,d2
    251a:	2f42 0040      	move.l d2,64(sp)
    251e:	202f 0044      	move.l 68(sp),d0
    2522:	2400           	move.l d0,d2
    2524:	5882           	addq.l #4,d2
    2526:	2f42 0044      	move.l d2,68(sp)
    252a:	2041           	movea.l d1,a0
    252c:	2210           	move.l (a0),d1
    252e:	2040           	movea.l d0,a0
    2530:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    2532:	52af 0038      	addq.l #1,56(sp)
    2536:	700b           	moveq #11,d0
    2538:	b0af 0038      	cmp.l 56(sp),d0
    253c:	6cd4           	bge.s 2512 <ClBuild+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    253e:	202f 0044      	move.l 68(sp),d0
    2542:	2200           	move.l d0,d1
    2544:	5881           	addq.l #4,d1
    2546:	2f41 0044      	move.l d1,68(sp)
    254a:	2040           	movea.l d0,a0
    254c:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    2552:	202f 0044      	move.l 68(sp),d0
    2556:	2200           	move.l d0,d1
    2558:	5881           	addq.l #4,d1
    255a:	2f41 0044      	move.l d1,68(sp)
    255e:	2040           	movea.l d0,a0
    2560:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
    2566:	2f7c 0000 a570 	move.l #42352,64(sp)
    256c:	0040 
  for(int i=0; i<2;i++)
    256e:	42af 0034      	clr.l 52(sp)
    2572:	6024           	bra.s 2598 <ClBuild+0x164>
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
  for(int i=0; i<2;i++)
    2594:	52af 0034      	addq.l #1,52(sp)
    2598:	7001           	moveq #1,d0
    259a:	b0af 0034      	cmp.l 52(sp),d0
    259e:	6cd4           	bge.s 2574 <ClBuild+0x140>
  *cl = 0xfffffffe;
    25a0:	206f 0044      	movea.l 68(sp),a0
    25a4:	72fe           	moveq #-2,d1
    25a6:	2081           	move.l d1,(a0)

  return retval;
    25a8:	202f 0024      	move.l 36(sp),d0
}
    25ac:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    25b0:	4fef 003c      	lea 60(sp),sp
    25b4:	4e75           	rts

000025b6 <PrepareDisplay>:

int PrepareDisplay() {
    25b6:	4fef ffb8      	lea -72(sp),sp
    25ba:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClBuild( );
    25be:	4eba fe74      	jsr 2434 <ClBuild>(pc)
    25c2:	23c0 004d 2b68 	move.l d0,4d2b68 <Copperlist1>
  Copperlist2 = ClBuild( );
    25c8:	4eba fe6a      	jsr 2434 <ClBuild>(pc)
    25cc:	23c0 004d 2b6c 	move.l d0,4d2b6c <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    25d2:	2f7c 0000 c800 	move.l #51200,80(sp)
    25d8:	0050 
    25da:	7002           	moveq #2,d0
    25dc:	2f40 004c      	move.l d0,76(sp)
    25e0:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    25e6:	2c40           	movea.l d0,a6
    25e8:	202f 0050      	move.l 80(sp),d0
    25ec:	222f 004c      	move.l 76(sp),d1
    25f0:	4eae ff3a      	jsr -198(a6)
    25f4:	2f40 0048      	move.l d0,72(sp)
    25f8:	202f 0048      	move.l 72(sp),d0
    25fc:	23c0 004d 2b60 	move.l d0,4d2b60 <Bitplane1>
  if(Bitplane1 == 0) {
    2602:	2039 004d 2b60 	move.l 4d2b60 <Bitplane1>,d0
    2608:	6658           	bne.s 2662 <PrepareDisplay+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    260a:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2610:	2c40           	movea.l d0,a6
    2612:	4eae ffc4      	jsr -60(a6)
    2616:	2f40 0044      	move.l d0,68(sp)
    261a:	202f 0044      	move.l 68(sp),d0
    261e:	2f40 0040      	move.l d0,64(sp)
    2622:	2f7c 0000 7c09 	move.l #31753,60(sp)
    2628:	003c 
    262a:	7026           	moveq #38,d0
    262c:	2f40 0038      	move.l d0,56(sp)
    2630:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2636:	2c40           	movea.l d0,a6
    2638:	222f 0040      	move.l 64(sp),d1
    263c:	242f 003c      	move.l 60(sp),d2
    2640:	262f 0038      	move.l 56(sp),d3
    2644:	4eae ffd0      	jsr -48(a6)
    2648:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    264c:	7001           	moveq #1,d0
    264e:	2f40 0030      	move.l d0,48(sp)
    2652:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2658:	2c40           	movea.l d0,a6
    265a:	222f 0030      	move.l 48(sp),d1
    265e:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane1;
    2662:	2039 004d 2b60 	move.l 4d2b60 <Bitplane1>,d0
    2668:	23c0 004d 2b74 	move.l d0,4d2b74 <ViewBuffer>
  ViewCopper = Copperlist1;
    266e:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    2674:	23c0 004d 2b7c 	move.l d0,4d2b7c <ViewCopper>
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    267a:	2f7c 0000 c800 	move.l #51200,44(sp)
    2680:	002c 
    2682:	7002           	moveq #2,d0
    2684:	2f40 0028      	move.l d0,40(sp)
    2688:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    268e:	2c40           	movea.l d0,a6
    2690:	202f 002c      	move.l 44(sp),d0
    2694:	222f 0028      	move.l 40(sp),d1
    2698:	4eae ff3a      	jsr -198(a6)
    269c:	2f40 0024      	move.l d0,36(sp)
    26a0:	202f 0024      	move.l 36(sp),d0
    26a4:	23c0 004d 2b64 	move.l d0,4d2b64 <Bitplane2>
  if(Bitplane2 == 0) {
    26aa:	2039 004d 2b64 	move.l 4d2b64 <Bitplane2>,d0
    26b0:	6658           	bne.s 270a <PrepareDisplay+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    26b2:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    26b8:	2c40           	movea.l d0,a6
    26ba:	4eae ffc4      	jsr -60(a6)
    26be:	2f40 0020      	move.l d0,32(sp)
    26c2:	202f 0020      	move.l 32(sp),d0
    26c6:	2f40 001c      	move.l d0,28(sp)
    26ca:	2f7c 0000 7c30 	move.l #31792,24(sp)
    26d0:	0018 
    26d2:	7026           	moveq #38,d0
    26d4:	2f40 0014      	move.l d0,20(sp)
    26d8:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    26de:	2c40           	movea.l d0,a6
    26e0:	222f 001c      	move.l 28(sp),d1
    26e4:	242f 0018      	move.l 24(sp),d2
    26e8:	262f 0014      	move.l 20(sp),d3
    26ec:	4eae ffd0      	jsr -48(a6)
    26f0:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    26f4:	7001           	moveq #1,d0
    26f6:	2f40 000c      	move.l d0,12(sp)
    26fa:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2700:	2c40           	movea.l d0,a6
    2702:	222f 000c      	move.l 12(sp),d1
    2706:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane2;
    270a:	2039 004d 2b64 	move.l 4d2b64 <Bitplane2>,d0
    2710:	23c0 004d 2b70 	move.l d0,4d2b70 <DrawBuffer>
  DrawCopper = Copperlist2;
    2716:	2039 004d 2b6c 	move.l 4d2b6c <Copperlist2>,d0
    271c:	23c0 004d 2b78 	move.l d0,4d2b78 <DrawCopper>
  /*SwapCl();
  SetBplPointers();
  SwapCl();
  SetBplPointers();*/
  return 0;
    2722:	7000           	moveq #0,d0
}
    2724:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2728:	4fef 0048      	lea 72(sp),sp
    272c:	4e75           	rts

0000272e <TestCopperlistBatch>:

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                  long length) {
    272e:	598f           	subq.l #4,sp
  for( int i=0;i<length;i++)
    2730:	4297           	clr.l (sp)
    2732:	602a           	bra.s 275e <TestCopperlistBatch+0x30>
    if( instructions[ pos+i] != batch[ i])
    2734:	202f 000c      	move.l 12(sp),d0
    2738:	d097           	add.l (sp),d0
    273a:	d080           	add.l d0,d0
    273c:	d080           	add.l d0,d0
    273e:	206f 0008      	movea.l 8(sp),a0
    2742:	d1c0           	adda.l d0,a0
    2744:	2210           	move.l (a0),d1
    2746:	2017           	move.l (sp),d0
    2748:	d080           	add.l d0,d0
    274a:	d080           	add.l d0,d0
    274c:	206f 0010      	movea.l 16(sp),a0
    2750:	d1c0           	adda.l d0,a0
    2752:	2010           	move.l (a0),d0
    2754:	b081           	cmp.l d1,d0
    2756:	6704           	beq.s 275c <TestCopperlistBatch+0x2e>
      return 0;
    2758:	7000           	moveq #0,d0
    275a:	600c           	bra.s 2768 <TestCopperlistBatch+0x3a>
  for( int i=0;i<length;i++)
    275c:	5297           	addq.l #1,(sp)
    275e:	2017           	move.l (sp),d0
    2760:	b0af 0014      	cmp.l 20(sp),d0
    2764:	6dce           	blt.s 2734 <TestCopperlistBatch+0x6>
  return 1;
    2766:	7001           	moveq #1,d0
}
    2768:	588f           	addq.l #4,sp
    276a:	4e75           	rts

0000276c <TestCopperlistPos>:

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    276c:	202f 0008      	move.l 8(sp),d0
    2770:	d080           	add.l d0,d0
    2772:	d080           	add.l d0,d0
    2774:	206f 0004      	movea.l 4(sp),a0
    2778:	d1c0           	adda.l d0,a0
    277a:	2010           	move.l (a0),d0
    277c:	b0af 000c      	cmp.l 12(sp),d0
    2780:	6604           	bne.s 2786 <TestCopperlistPos+0x1a>
    return 1;
    2782:	7001           	moveq #1,d0
    2784:	6002           	bra.s 2788 <TestCopperlistPos+0x1c>
  else 
    return 0;
    2786:	7000           	moveq #0,d0
}
    2788:	4e75           	rts

0000278a <TestCopperList>:

void TestCopperList() {
    278a:	4fef feb8      	lea -328(sp),sp
    278e:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Write( Output(), "%d", hw->cop1lc);
    2792:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2798:	2c40           	movea.l d0,a6
    279a:	4eae ffc4      	jsr -60(a6)
    279e:	2f40 0150      	move.l d0,336(sp)
    27a2:	202f 0150      	move.l 336(sp),d0
    27a6:	2f40 014c      	move.l d0,332(sp)
    27aa:	2f7c 0000 7dec 	move.l #32236,328(sp)
    27b0:	0148 
    27b2:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    27b8:	2028 0080      	move.l 128(a0),d0
    27bc:	2f40 0144      	move.l d0,324(sp)
    27c0:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    27c6:	2c40           	movea.l d0,a6
    27c8:	222f 014c      	move.l 332(sp),d1
    27cc:	242f 0148      	move.l 328(sp),d2
    27d0:	262f 0144      	move.l 324(sp),d3
    27d4:	4eae ffd0      	jsr -48(a6)
    27d8:	2f40 0140      	move.l d0,320(sp)
  Copperlist1 = ClBuild();
    27dc:	4eba fc56      	jsr 2434 <ClBuild>(pc)
    27e0:	23c0 004d 2b68 	move.l d0,4d2b68 <Copperlist1>
  DrawCopper = Copperlist1;
    27e6:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    27ec:	23c0 004d 2b78 	move.l d0,4d2b78 <DrawCopper>
  Copperlist2 = ClBuild();
    27f2:	4eba fc40      	jsr 2434 <ClBuild>(pc)
    27f6:	23c0 004d 2b6c 	move.l d0,4d2b6c <Copperlist2>
  ViewCopper = Copperlist2;
    27fc:	2039 004d 2b6c 	move.l 4d2b6c <Copperlist2>,d0
    2802:	23c0 004d 2b7c 	move.l d0,4d2b7c <ViewCopper>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2808:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    280e:	4878 0010      	pea 10 <_start+0x10>
    2812:	4879 0000 a5f0 	pea a5f0 <ClsSprites>
    2818:	42a7           	clr.l -(sp)
    281a:	2f00           	move.l d0,-(sp)
    281c:	4eba ff10      	jsr 272e <TestCopperlistBatch>(pc)
    2820:	4fef 0010      	lea 16(sp),sp
    2824:	4a80           	tst.l d0
    2826:	6642           	bne.s 286a <TestCopperList+0xe0>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    2828:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    282e:	2c40           	movea.l d0,a6
    2830:	4eae ffc4      	jsr -60(a6)
    2834:	2f40 013c      	move.l d0,316(sp)
    2838:	202f 013c      	move.l 316(sp),d0
    283c:	2f40 0138      	move.l d0,312(sp)
    2840:	2f7c 0000 7574 	move.l #30068,308(sp)
    2846:	0134 
    2848:	702c           	moveq #44,d0
    284a:	2f40 0130      	move.l d0,304(sp)
    284e:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2854:	2c40           	movea.l d0,a6
    2856:	222f 0138      	move.l 312(sp),d1
    285a:	242f 0134      	move.l 308(sp),d2
    285e:	262f 0130      	move.l 304(sp),d3
    2862:	4eae ffd0      	jsr -48(a6)
    2866:	2f40 012c      	move.l d0,300(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    286a:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    2870:	4878 000c      	pea c <_start+0xc>
    2874:	4879 0000 a630 	pea a630 <ClScreen>
    287a:	4878 0010      	pea 10 <_start+0x10>
    287e:	2f00           	move.l d0,-(sp)
    2880:	4eba feac      	jsr 272e <TestCopperlistBatch>(pc)
    2884:	4fef 0010      	lea 16(sp),sp
    2888:	4a80           	tst.l d0
    288a:	6642           	bne.s 28ce <TestCopperList+0x144>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    288c:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2892:	2c40           	movea.l d0,a6
    2894:	4eae ffc4      	jsr -60(a6)
    2898:	2f40 0128      	move.l d0,296(sp)
    289c:	202f 0128      	move.l 296(sp),d0
    28a0:	2f40 0124      	move.l d0,292(sp)
    28a4:	2f7c 0000 75aa 	move.l #30122,288(sp)
    28aa:	0120 
    28ac:	7036           	moveq #54,d0
    28ae:	2f40 011c      	move.l d0,284(sp)
    28b2:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    28b8:	2c40           	movea.l d0,a6
    28ba:	222f 0124      	move.l 292(sp),d1
    28be:	242f 0120      	move.l 288(sp),d2
    28c2:	262f 011c      	move.l 284(sp),d3
    28c6:	4eae ffd0      	jsr -48(a6)
    28ca:	2f40 0118      	move.l d0,280(sp)
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
    28ce:	23fc 0004 0000 	move.l #262144,4d2b70 <DrawBuffer>
    28d4:	004d 2b70 
  ViewBuffer = (ULONG *)0x50000;
    28d8:	23fc 0005 0000 	move.l #327680,4d2b74 <ViewBuffer>
    28de:	004d 2b74 
  
  SetBplPointers();
    28e2:	4eba d85e      	jsr 142 <SetBplPointers>(pc)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    28e6:	2039 004d 2b70 	move.l 4d2b70 <DrawBuffer>,d0
    28ec:	0c80 0005 0000 	cmpi.l #327680,d0
    28f2:	660e           	bne.s 2902 <TestCopperList+0x178>
    28f4:	2039 004d 2b74 	move.l 4d2b74 <ViewBuffer>,d0
    28fa:	0c80 0004 0000 	cmpi.l #262144,d0
    2900:	6742           	beq.s 2944 <TestCopperList+0x1ba>
    Write( Output(), 
    2902:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2908:	2c40           	movea.l d0,a6
    290a:	4eae ffc4      	jsr -60(a6)
    290e:	2f40 0114      	move.l d0,276(sp)
    2912:	202f 0114      	move.l 276(sp),d0
    2916:	2f40 0110      	move.l d0,272(sp)
    291a:	2f7c 0000 7def 	move.l #32239,268(sp)
    2920:	010c 
    2922:	703b           	moveq #59,d0
    2924:	2f40 0108      	move.l d0,264(sp)
    2928:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    292e:	2c40           	movea.l d0,a6
    2930:	222f 0110      	move.l 272(sp),d1
    2934:	242f 010c      	move.l 268(sp),d2
    2938:	262f 0108      	move.l 264(sp),d3
    293c:	4eae ffd0      	jsr -48(a6)
    2940:	2f40 0104      	move.l d0,260(sp)
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    2944:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    294a:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    2950:	4878 001c      	pea 1c <_start+0x1c>
    2954:	2f00           	move.l d0,-(sp)
    2956:	4eba fe14      	jsr 276c <TestCopperlistPos>(pc)
    295a:	4fef 000c      	lea 12(sp),sp
    295e:	4a80           	tst.l d0
    2960:	6642           	bne.s 29a4 <TestCopperList+0x21a>
    Write(Output(), 
    2962:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2968:	2c40           	movea.l d0,a6
    296a:	4eae ffc4      	jsr -60(a6)
    296e:	2f40 0100      	move.l d0,256(sp)
    2972:	202f 0100      	move.l 256(sp),d0
    2976:	2f40 00fc      	move.l d0,252(sp)
    297a:	2f7c 0000 7e2b 	move.l #32299,248(sp)
    2980:	00f8 
    2982:	703c           	moveq #60,d0
    2984:	2f40 00f4      	move.l d0,244(sp)
    2988:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    298e:	2c40           	movea.l d0,a6
    2990:	222f 00fc      	move.l 252(sp),d1
    2994:	242f 00f8      	move.l 248(sp),d2
    2998:	262f 00f4      	move.l 244(sp),d3
    299c:	4eae ffd0      	jsr -48(a6)
    29a0:	2f40 00f0      	move.l d0,240(sp)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    29a4:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    29aa:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    29b0:	4878 001d      	pea 1d <_start+0x1d>
    29b4:	2f00           	move.l d0,-(sp)
    29b6:	4eba fdb4      	jsr 276c <TestCopperlistPos>(pc)
    29ba:	4fef 000c      	lea 12(sp),sp
    29be:	4a80           	tst.l d0
    29c0:	6642           	bne.s 2a04 <TestCopperList+0x27a>
    Write(Output(), 
    29c2:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    29c8:	2c40           	movea.l d0,a6
    29ca:	4eae ffc4      	jsr -60(a6)
    29ce:	2f40 00ec      	move.l d0,236(sp)
    29d2:	202f 00ec      	move.l 236(sp),d0
    29d6:	2f40 00e8      	move.l d0,232(sp)
    29da:	2f7c 0000 7e68 	move.l #32360,228(sp)
    29e0:	00e4 
    29e2:	703c           	moveq #60,d0
    29e4:	2f40 00e0      	move.l d0,224(sp)
    29e8:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    29ee:	2c40           	movea.l d0,a6
    29f0:	222f 00e8      	move.l 232(sp),d1
    29f4:	242f 00e4      	move.l 228(sp),d2
    29f8:	262f 00e0      	move.l 224(sp),d3
    29fc:	4eae ffd0      	jsr -48(a6)
    2a00:	2f40 00dc      	move.l d0,220(sp)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2a04:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    2a0a:	4878 0002      	pea 2 <_start+0x2>
    2a0e:	4879 0000 a570 	pea a570 <ClColor>
    2a14:	4878 001e      	pea 1e <_start+0x1e>
    2a18:	2f00           	move.l d0,-(sp)
    2a1a:	4eba fd12      	jsr 272e <TestCopperlistBatch>(pc)
    2a1e:	4fef 0010      	lea 16(sp),sp
    2a22:	4a80           	tst.l d0
    2a24:	6642           	bne.s 2a68 <TestCopperList+0x2de>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2a26:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2a2c:	2c40           	movea.l d0,a6
    2a2e:	4eae ffc4      	jsr -60(a6)
    2a32:	2f40 00d8      	move.l d0,216(sp)
    2a36:	202f 00d8      	move.l 216(sp),d0
    2a3a:	2f40 00d4      	move.l d0,212(sp)
    2a3e:	2f7c 0000 75e1 	move.l #30177,208(sp)
    2a44:	00d0 
    2a46:	7021           	moveq #33,d0
    2a48:	2f40 00cc      	move.l d0,204(sp)
    2a4c:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2a52:	2c40           	movea.l d0,a6
    2a54:	222f 00d4      	move.l 212(sp),d1
    2a58:	242f 00d0      	move.l 208(sp),d2
    2a5c:	262f 00cc      	move.l 204(sp),d3
    2a60:	4eae ffd0      	jsr -48(a6)
    2a64:	2f40 00c8      	move.l d0,200(sp)

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2a68:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    2a6e:	4878 fffe      	pea fffffffe <_end+0xffb2d426>
    2a72:	4878 0020      	pea 20 <_start+0x20>
    2a76:	2f00           	move.l d0,-(sp)
    2a78:	4eba fcf2      	jsr 276c <TestCopperlistPos>(pc)
    2a7c:	4fef 000c      	lea 12(sp),sp
    2a80:	4a80           	tst.l d0
    2a82:	6642           	bne.s 2ac6 <TestCopperList+0x33c>
    Write(Output(), "Copperlist End not correctly set.\n", 34);
    2a84:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2a8a:	2c40           	movea.l d0,a6
    2a8c:	4eae ffc4      	jsr -60(a6)
    2a90:	2f40 00c4      	move.l d0,196(sp)
    2a94:	202f 00c4      	move.l 196(sp),d0
    2a98:	2f40 00c0      	move.l d0,192(sp)
    2a9c:	2f7c 0000 7603 	move.l #30211,188(sp)
    2aa2:	00bc 
    2aa4:	7022           	moveq #34,d0
    2aa6:	2f40 00b8      	move.l d0,184(sp)
    2aaa:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2ab0:	2c40           	movea.l d0,a6
    2ab2:	222f 00c0      	move.l 192(sp),d1
    2ab6:	242f 00bc      	move.l 188(sp),d2
    2aba:	262f 00b8      	move.l 184(sp),d3
    2abe:	4eae ffd0      	jsr -48(a6)
    2ac2:	2f40 00b4      	move.l d0,180(sp)
  
  SwapCl();
    2ac6:	4eba d6d8      	jsr 1a0 <SwapCl>(pc)
  
  if( DrawCopper != Copperlist2)
    2aca:	2239 004d 2b78 	move.l 4d2b78 <DrawCopper>,d1
    2ad0:	2039 004d 2b6c 	move.l 4d2b6c <Copperlist2>,d0
    2ad6:	b081           	cmp.l d1,d0
    2ad8:	6742           	beq.s 2b1c <TestCopperList+0x392>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
    2ada:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2ae0:	2c40           	movea.l d0,a6
    2ae2:	4eae ffc4      	jsr -60(a6)
    2ae6:	2f40 00b0      	move.l d0,176(sp)
    2aea:	202f 00b0      	move.l 176(sp),d0
    2aee:	2f40 00ac      	move.l d0,172(sp)
    2af2:	2f7c 0000 7ea5 	move.l #32421,168(sp)
    2af8:	00a8 
    2afa:	7015           	moveq #21,d0
    2afc:	2f40 00a4      	move.l d0,164(sp)
    2b00:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2b06:	2c40           	movea.l d0,a6
    2b08:	222f 00ac      	move.l 172(sp),d1
    2b0c:	242f 00a8      	move.l 168(sp),d2
    2b10:	262f 00a4      	move.l 164(sp),d3
    2b14:	4eae ffd0      	jsr -48(a6)
    2b18:	2f40 00a0      	move.l d0,160(sp)

  
  PrepareDisplay();
    2b1c:	4eba fa98      	jsr 25b6 <PrepareDisplay>(pc)
  if( DrawBuffer != Bitplane2) 
    2b20:	2239 004d 2b70 	move.l 4d2b70 <DrawBuffer>,d1
    2b26:	2039 004d 2b64 	move.l 4d2b64 <Bitplane2>,d0
    2b2c:	b081           	cmp.l d1,d0
    2b2e:	6742           	beq.s 2b72 <TestCopperList+0x3e8>
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
    2b30:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2b36:	2c40           	movea.l d0,a6
    2b38:	4eae ffc4      	jsr -60(a6)
    2b3c:	2f40 009c      	move.l d0,156(sp)
    2b40:	202f 009c      	move.l 156(sp),d0
    2b44:	2f40 0098      	move.l d0,152(sp)
    2b48:	2f7c 0000 7ebb 	move.l #32443,148(sp)
    2b4e:	0094 
    2b50:	7037           	moveq #55,d0
    2b52:	2f40 0090      	move.l d0,144(sp)
    2b56:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2b5c:	2c40           	movea.l d0,a6
    2b5e:	222f 0098      	move.l 152(sp),d1
    2b62:	242f 0094      	move.l 148(sp),d2
    2b66:	262f 0090      	move.l 144(sp),d3
    2b6a:	4eae ffd0      	jsr -48(a6)
    2b6e:	2f40 008c      	move.l d0,140(sp)
                                                                            55);
  if( DrawCopper != Copperlist2) 
    2b72:	2239 004d 2b78 	move.l 4d2b78 <DrawCopper>,d1
    2b78:	2039 004d 2b6c 	move.l 4d2b6c <Copperlist2>,d0
    2b7e:	b081           	cmp.l d1,d0
    2b80:	6742           	beq.s 2bc4 <TestCopperList+0x43a>
    Write( Output(), 
    2b82:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2b88:	2c40           	movea.l d0,a6
    2b8a:	4eae ffc4      	jsr -60(a6)
    2b8e:	2f40 0088      	move.l d0,136(sp)
    2b92:	202f 0088      	move.l 136(sp),d0
    2b96:	2f40 0084      	move.l d0,132(sp)
    2b9a:	2f7c 0000 7ef3 	move.l #32499,128(sp)
    2ba0:	0080 
    2ba2:	7039           	moveq #57,d0
    2ba4:	2f40 007c      	move.l d0,124(sp)
    2ba8:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2bae:	2c40           	movea.l d0,a6
    2bb0:	222f 0084      	move.l 132(sp),d1
    2bb4:	242f 0080      	move.l 128(sp),d2
    2bb8:	262f 007c      	move.l 124(sp),d3
    2bbc:	4eae ffd0      	jsr -48(a6)
    2bc0:	2f40 0078      	move.l d0,120(sp)
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
    2bc4:	2239 004d 2b74 	move.l 4d2b74 <ViewBuffer>,d1
    2bca:	2039 004d 2b60 	move.l 4d2b60 <Bitplane1>,d0
    2bd0:	b081           	cmp.l d1,d0
    2bd2:	6742           	beq.s 2c16 <TestCopperList+0x48c>
    Write( Output(), 
    2bd4:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2bda:	2c40           	movea.l d0,a6
    2bdc:	4eae ffc4      	jsr -60(a6)
    2be0:	2f40 0074      	move.l d0,116(sp)
    2be4:	202f 0074      	move.l 116(sp),d0
    2be8:	2f40 0070      	move.l d0,112(sp)
    2bec:	2f7c 0000 7f2d 	move.l #32557,108(sp)
    2bf2:	006c 
    2bf4:	7038           	moveq #56,d0
    2bf6:	2f40 0068      	move.l d0,104(sp)
    2bfa:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2c00:	2c40           	movea.l d0,a6
    2c02:	222f 0070      	move.l 112(sp),d1
    2c06:	242f 006c      	move.l 108(sp),d2
    2c0a:	262f 0068      	move.l 104(sp),d3
    2c0e:	4eae ffd0      	jsr -48(a6)
    2c12:	2f40 0064      	move.l d0,100(sp)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
    2c16:	2239 004d 2b7c 	move.l 4d2b7c <ViewCopper>,d1
    2c1c:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    2c22:	b081           	cmp.l d1,d0
    2c24:	6742           	beq.s 2c68 <TestCopperList+0x4de>
    Write( Output(), 
    2c26:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2c2c:	2c40           	movea.l d0,a6
    2c2e:	4eae ffc4      	jsr -60(a6)
    2c32:	2f40 0060      	move.l d0,96(sp)
    2c36:	202f 0060      	move.l 96(sp),d0
    2c3a:	2f40 005c      	move.l d0,92(sp)
    2c3e:	2f7c 0000 7f66 	move.l #32614,88(sp)
    2c44:	0058 
    2c46:	703a           	moveq #58,d0
    2c48:	2f40 0054      	move.l d0,84(sp)
    2c4c:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2c52:	2c40           	movea.l d0,a6
    2c54:	222f 005c      	move.l 92(sp),d1
    2c58:	242f 0058      	move.l 88(sp),d2
    2c5c:	262f 0054      	move.l 84(sp),d3
    2c60:	4eae ffd0      	jsr -48(a6)
    2c64:	2f40 0050      	move.l d0,80(sp)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
    2c68:	4eba d4d8      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2c6c:	4eba d532      	jsr 1a0 <SwapCl>(pc)
  UWORD *copword = ViewCopper;
    2c70:	2f79 004d 2b7c 	move.l 4d2b7c <ViewCopper>,76(sp)
    2c76:	004c 
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2c78:	307c 0076      	movea.w #118,a0
    2c7c:	d1ef 004c      	adda.l 76(sp),a0
    2c80:	3010           	move.w (a0),d0
    2c82:	7200           	moveq #0,d1
    2c84:	3200           	move.w d0,d1
    2c86:	307c 0072      	movea.w #114,a0
    2c8a:	d1ef 004c      	adda.l 76(sp),a0
    2c8e:	3010           	move.w (a0),d0
    2c90:	3000           	move.w d0,d0
    2c92:	0280 0000 ffff 	andi.l #65535,d0
    2c98:	4840           	swap d0
    2c9a:	4240           	clr.w d0
    2c9c:	d081           	add.l d1,d0
    2c9e:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2ca2:	2039 004d 2b64 	move.l 4d2b64 <Bitplane2>,d0
    2ca8:	b0af 0048      	cmp.l 72(sp),d0
    2cac:	6742           	beq.s 2cf0 <TestCopperList+0x566>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2cae:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2cb4:	2c40           	movea.l d0,a6
    2cb6:	4eae ffc4      	jsr -60(a6)
    2cba:	2f40 0044      	move.l d0,68(sp)
    2cbe:	202f 0044      	move.l 68(sp),d0
    2cc2:	2f40 0040      	move.l d0,64(sp)
    2cc6:	2f7c 0000 7fa1 	move.l #32673,60(sp)
    2ccc:	003c 
    2cce:	7048           	moveq #72,d0
    2cd0:	2f40 0038      	move.l d0,56(sp)
    2cd4:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2cda:	2c40           	movea.l d0,a6
    2cdc:	222f 0040      	move.l 64(sp),d1
    2ce0:	242f 003c      	move.l 60(sp),d2
    2ce4:	262f 0038      	move.l 56(sp),d3
    2ce8:	4eae ffd0      	jsr -48(a6)
    2cec:	2f40 0034      	move.l d0,52(sp)
                                                   " after first frame.\n", 72);
  SetBplPointers();
    2cf0:	4eba d450      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2cf4:	4eba d4aa      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2cf8:	2f79 004d 2b7c 	move.l 4d2b7c <ViewCopper>,76(sp)
    2cfe:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2d00:	307c 0076      	movea.w #118,a0
    2d04:	d1ef 004c      	adda.l 76(sp),a0
    2d08:	3010           	move.w (a0),d0
    2d0a:	7200           	moveq #0,d1
    2d0c:	3200           	move.w d0,d1
    2d0e:	307c 0072      	movea.w #114,a0
    2d12:	d1ef 004c      	adda.l 76(sp),a0
    2d16:	3010           	move.w (a0),d0
    2d18:	3000           	move.w d0,d0
    2d1a:	0280 0000 ffff 	andi.l #65535,d0
    2d20:	4840           	swap d0
    2d22:	4240           	clr.w d0
    2d24:	d081           	add.l d1,d0
    2d26:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane1) 
    2d2a:	2039 004d 2b60 	move.l 4d2b60 <Bitplane1>,d0
    2d30:	b0af 0048      	cmp.l 72(sp),d0
    2d34:	6742           	beq.s 2d78 <TestCopperList+0x5ee>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
    2d36:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2d3c:	2c40           	movea.l d0,a6
    2d3e:	4eae ffc4      	jsr -60(a6)
    2d42:	2f40 0030      	move.l d0,48(sp)
    2d46:	202f 0030      	move.l 48(sp),d0
    2d4a:	2f40 002c      	move.l d0,44(sp)
    2d4e:	2f7c 0000 7fea 	move.l #32746,40(sp)
    2d54:	0028 
    2d56:	7049           	moveq #73,d0
    2d58:	2f40 0024      	move.l d0,36(sp)
    2d5c:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2d62:	2c40           	movea.l d0,a6
    2d64:	222f 002c      	move.l 44(sp),d1
    2d68:	242f 0028      	move.l 40(sp),d2
    2d6c:	262f 0024      	move.l 36(sp),d3
    2d70:	4eae ffd0      	jsr -48(a6)
    2d74:	2f40 0020      	move.l d0,32(sp)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
    2d78:	4eba d3c8      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2d7c:	4eba d422      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2d80:	2f79 004d 2b7c 	move.l 4d2b7c <ViewCopper>,76(sp)
    2d86:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2d88:	307c 0076      	movea.w #118,a0
    2d8c:	d1ef 004c      	adda.l 76(sp),a0
    2d90:	3010           	move.w (a0),d0
    2d92:	7200           	moveq #0,d1
    2d94:	3200           	move.w d0,d1
    2d96:	307c 0072      	movea.w #114,a0
    2d9a:	d1ef 004c      	adda.l 76(sp),a0
    2d9e:	3010           	move.w (a0),d0
    2da0:	3000           	move.w d0,d0
    2da2:	0280 0000 ffff 	andi.l #65535,d0
    2da8:	4840           	swap d0
    2daa:	4240           	clr.w d0
    2dac:	d081           	add.l d1,d0
    2dae:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2db2:	2039 004d 2b64 	move.l 4d2b64 <Bitplane2>,d0
    2db8:	b0af 0048      	cmp.l 72(sp),d0
    2dbc:	6742           	beq.s 2e00 <TestCopperList+0x676>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2dbe:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2dc4:	2c40           	movea.l d0,a6
    2dc6:	4eae ffc4      	jsr -60(a6)
    2dca:	2f40 001c      	move.l d0,28(sp)
    2dce:	202f 001c      	move.l 28(sp),d0
    2dd2:	2f40 0018      	move.l d0,24(sp)
    2dd6:	2f7c 0000 8034 	move.l #32820,20(sp)
    2ddc:	0014 
    2dde:	7048           	moveq #72,d0
    2de0:	2f40 0010      	move.l d0,16(sp)
    2de4:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2dea:	2c40           	movea.l d0,a6
    2dec:	222f 0018      	move.l 24(sp),d1
    2df0:	242f 0014      	move.l 20(sp),d2
    2df4:	262f 0010      	move.l 16(sp),d3
    2df8:	4eae ffd0      	jsr -48(a6)
    2dfc:	2f40 000c      	move.l d0,12(sp)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
    2e00:	2f3c 0000 c800 	move.l #51200,-(sp)
    2e06:	4878 0084      	pea 84 <_start+0x84>
    2e0a:	4eba d2d4      	jsr e0 <FreeDisplay>(pc)
    2e0e:	508f           	addq.l #8,sp
    2e10:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2e14:	4fef 0148      	lea 328(sp),sp
    2e18:	4e75           	rts

00002e1a <RunTests>:
#include "runtests.h"
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    2e1a:	4eba f96e      	jsr 278a <TestCopperList>(pc)
    ZoomTest();
    2e1e:	4eba 0004      	jsr 2e24 <ZoomTest>(pc)
    //SwScrollerTest();
    2e22:	4e75           	rts

00002e24 <ZoomTest>:
#include "zoomtest2.h"

ULONG Cl102ZoomTest[137];

void ZoomTest() {
  TestZoomSpeed();
    2e24:	4eba 0046      	jsr 2e6c <TestZoomSpeed>(pc)
  ZoomTestDisplay();
    2e28:	4eba 00e2      	jsr 2f0c <ZoomTestDisplay>(pc)
  TestBlitleftOfZoom();
    2e2c:	4eba 05a8      	jsr 33d6 <TestBlitleftOfZoom>(pc)
  TestCopyWord();
    2e30:	4eba 0838      	jsr 366a <TestCopyWord>(pc)
  TestZoom4Picture();
    2e34:	4eba 0e12      	jsr 3c48 <TestZoom4Picture>(pc)
  TestZoom4PictureOn5Planes();
    2e38:	4eba 0b22      	jsr 395c <TestZoom4PictureOn5Planes>(pc)
  Test_Zoom2();
    2e3c:	4eba f012      	jsr 1e50 <Test_Zoom2>(pc)
  c2p1x1_8_c5_gen_init( 320, 256, 0, 0, 0, 0);
    2e40:	42a7           	clr.l -(sp)
    2e42:	42a7           	clr.l -(sp)
    2e44:	42a7           	clr.l -(sp)
    2e46:	42a7           	clr.l -(sp)
    2e48:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2e4c:	4878 0140      	pea 140 <FreeDisplay+0x60>
    2e50:	4eb9 0000 717c 	jsr 717c <c2p1x1_8_c5_gen_init>
    2e56:	4fef 0018      	lea 24(sp),sp
  c2p1x1_8_c5_gen( 0x100, 0x200);
    2e5a:	4878 0200      	pea 200 <Utils_CopyMem+0x22>
    2e5e:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2e62:	4eb9 0000 71f8 	jsr 71f8 <c2p1x1_8_c5_gen>
    2e68:	508f           	addq.l #8,sp
}
    2e6a:	4e75           	rts

00002e6c <TestZoomSpeed>:

int Counter4Frames;

void TestZoomSpeed() {
    2e6c:	4fef ffe8      	lea -24(sp),sp
    2e70:	48e7 3002      	movem.l d2-d3/a6,-(sp)

 	TakeSystem();
    2e74:	4eba d704      	jsr 57a <TakeSystem>(pc)
	WaitVbl();
    2e78:	4eba d6b6      	jsr 530 <WaitVbl>(pc)
  //             fedcba9876543210
  //hw->dmacon = 0x8def;

  hw->dmacon = DMAF_SETCLR | DMAF_AUDIO | DMAF_BLITTER | DMAF_RASTER 
    2e7c:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    2e82:	317c 87cf 0096 	move.w #-30769,150(a0)
                                    | DMAF_COPPER | DMAF_MASTER | DMAF_BLITHOG;
   //0b1000011111100000;
  
  //hw->dmacon = 0b1000011111111111;
	hw->intena = (1 << INTB_SETCLR) | (1 << INTB_INTEN) | (1 << INTB_VERTB);
    2e88:	2079 004d 2b80 	movea.l 4d2b80 <hw>,a0
    2e8e:	317c c020 009a 	move.w #-16352,154(a0)
  
  Zoom_InitRun(); 
    2e94:	4eba e1ea      	jsr 1080 <Zoom_InitRun>(pc)

  int success = 1;
    2e98:	7001           	moveq #1,d0
    2e9a:	2f40 0020      	move.l d0,32(sp)
  RunFrame();
    2e9e:	4eba d45c      	jsr 2fc <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    2ea2:	3039 004d 2bc0 	move.w 4d2bc0 <Zoom_Counter>,d0
    2ea8:	0c40 0008      	cmpi.w #8,d0
    2eac:	6304           	bls.s 2eb2 <TestZoomSpeed+0x46>
    2eae:	42af 0020      	clr.l 32(sp)
    
  Zoom_Dealloc();
    2eb2:	4eba e464      	jsr 1318 <Zoom_Dealloc>(pc)
  FreeSystem();
    2eb6:	4eba d6d8      	jsr 590 <FreeSystem>(pc)

  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    2eba:	4aaf 0020      	tst.l 32(sp)
    2ebe:	6642           	bne.s 2f02 <TestZoomSpeed+0x96>
    2ec0:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2ec6:	2c40           	movea.l d0,a6
    2ec8:	4eae ffc4      	jsr -60(a6)
    2ecc:	2f40 001c      	move.l d0,28(sp)
    2ed0:	202f 001c      	move.l 28(sp),d0
    2ed4:	2f40 0018      	move.l d0,24(sp)
    2ed8:	2f7c 0000 807d 	move.l #32893,20(sp)
    2ede:	0014 
    2ee0:	701c           	moveq #28,d0
    2ee2:	2f40 0010      	move.l d0,16(sp)
    2ee6:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2eec:	2c40           	movea.l d0,a6
    2eee:	222f 0018      	move.l 24(sp),d1
    2ef2:	242f 0014      	move.l 20(sp),d2
    2ef6:	262f 0010      	move.l 16(sp),d3
    2efa:	4eae ffd0      	jsr -48(a6)
    2efe:	2f40 000c      	move.l d0,12(sp)

  //AddIntServer(INTB_VERTB, vbint);
  //RemIntServer(INTB_VERTB, vbint);
  
}
    2f02:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2f06:	4fef 0018      	lea 24(sp),sp
    2f0a:	4e75           	rts

00002f0c <ZoomTestDisplay>:

void ZoomTestDisplay() {
    2f0c:	4fef ff38      	lea -200(sp),sp
    2f10:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Zoom_Init();
    2f14:	4eba e476      	jsr 138c <Zoom_Init>(pc)
  PrepareDisplayZoom();
    2f18:	4eba e80c      	jsr 1726 <PrepareDisplayZoom>(pc)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2f1c:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    2f22:	4878 0010      	pea 10 <_start+0x10>
    2f26:	4879 0000 a5f0 	pea a5f0 <ClsSprites>
    2f2c:	42a7           	clr.l -(sp)
    2f2e:	2f00           	move.l d0,-(sp)
    2f30:	4eba f7fc      	jsr 272e <TestCopperlistBatch>(pc)
    2f34:	4fef 0010      	lea 16(sp),sp
    2f38:	4a80           	tst.l d0
    2f3a:	6642           	bne.s 2f7e <ZoomTestDisplay+0x72>
    Write( Output(), 
    2f3c:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2f42:	2c40           	movea.l d0,a6
    2f44:	4eae ffc4      	jsr -60(a6)
    2f48:	2f40 00d0      	move.l d0,208(sp)
    2f4c:	202f 00d0      	move.l 208(sp),d0
    2f50:	2f40 00cc      	move.l d0,204(sp)
    2f54:	2f7c 0000 809c 	move.l #32924,200(sp)
    2f5a:	00c8 
    2f5c:	7045           	moveq #69,d0
    2f5e:	2f40 00c4      	move.l d0,196(sp)
    2f62:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2f68:	2c40           	movea.l d0,a6
    2f6a:	222f 00cc      	move.l 204(sp),d1
    2f6e:	242f 00c8      	move.l 200(sp),d2
    2f72:	262f 00c4      	move.l 196(sp),d3
    2f76:	4eae ffd0      	jsr -48(a6)
    2f7a:	2f40 00c0      	move.l d0,192(sp)
       "ZoomCopperlist: Sprite section of copper starting on pos 0 messed up\n", 
                                                                            69);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2f7e:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    2f84:	4878 000c      	pea c <_start+0xc>
    2f88:	4879 0000 a630 	pea a630 <ClScreen>
    2f8e:	4878 0010      	pea 10 <_start+0x10>
    2f92:	2f00           	move.l d0,-(sp)
    2f94:	4eba f798      	jsr 272e <TestCopperlistBatch>(pc)
    2f98:	4fef 0010      	lea 16(sp),sp
    2f9c:	4a80           	tst.l d0
    2f9e:	6642           	bne.s 2fe2 <ZoomTestDisplay+0xd6>
    Write( Output(), 
    2fa0:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2fa6:	2c40           	movea.l d0,a6
    2fa8:	4eae ffc4      	jsr -60(a6)
    2fac:	2f40 00bc      	move.l d0,188(sp)
    2fb0:	202f 00bc      	move.l 188(sp),d0
    2fb4:	2f40 00b8      	move.l d0,184(sp)
    2fb8:	2f7c 0000 80e2 	move.l #32994,180(sp)
    2fbe:	00b4 
    2fc0:	7046           	moveq #70,d0
    2fc2:	2f40 00b0      	move.l d0,176(sp)
    2fc6:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    2fcc:	2c40           	movea.l d0,a6
    2fce:	222f 00b8      	move.l 184(sp),d1
    2fd2:	242f 00b4      	move.l 180(sp),d2
    2fd6:	262f 00b0      	move.l 176(sp),d3
    2fda:	4eae ffd0      	jsr -48(a6)
    2fde:	2f40 00ac      	move.l d0,172(sp)
      "ZoomCopperlist: Screen section of copper starting on pos 16 messed up\n",
                                                                            70);
  DrawBuffer = (ULONG *) 0x40000;
    2fe2:	23fc 0004 0000 	move.l #262144,4d2b70 <DrawBuffer>
    2fe8:	004d 2b70 
  ViewBuffer = (ULONG *) 0x50000;
    2fec:	23fc 0005 0000 	move.l #327680,4d2b74 <ViewBuffer>
    2ff2:	004d 2b74 
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    2ff6:	2239 004d 2b78 	move.l 4d2b78 <DrawCopper>,d1
    2ffc:	2039 004d 2b70 	move.l 4d2b70 <DrawBuffer>,d0
    3002:	2f01           	move.l d1,-(sp)
    3004:	2f00           	move.l d0,-(sp)
    3006:	4eba ed78      	jsr 1d80 <Zoom_SetBplPointers>(pc)
    300a:	508f           	addq.l #8,sp
  Zoom_SwapBuffers( 0);
    300c:	42a7           	clr.l -(sp)
    300e:	4eba ee08      	jsr 1e18 <Zoom_SwapBuffers>(pc)
    3012:	588f           	addq.l #4,sp
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    3014:	2039 004d 2b70 	move.l 4d2b70 <DrawBuffer>,d0
    301a:	0c80 0005 0000 	cmpi.l #327680,d0
    3020:	660e           	bne.s 3030 <ZoomTestDisplay+0x124>
    3022:	2039 004d 2b74 	move.l 4d2b74 <ViewBuffer>,d0
    3028:	0c80 0004 0000 	cmpi.l #262144,d0
    302e:	6742           	beq.s 3072 <ZoomTestDisplay+0x166>
    Write( Output(), 
    3030:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    3036:	2c40           	movea.l d0,a6
    3038:	4eae ffc4      	jsr -60(a6)
    303c:	2f40 00a8      	move.l d0,168(sp)
    3040:	202f 00a8      	move.l 168(sp),d0
    3044:	2f40 00a4      	move.l d0,164(sp)
    3048:	2f7c 0000 8129 	move.l #33065,160(sp)
    304e:	00a0 
    3050:	703b           	moveq #59,d0
    3052:	2f40 009c      	move.l d0,156(sp)
    3056:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    305c:	2c40           	movea.l d0,a6
    305e:	222f 00a4      	move.l 164(sp),d1
    3062:	242f 00a0      	move.l 160(sp),d2
    3066:	262f 009c      	move.l 156(sp),d3
    306a:	4eae ffd0      	jsr -48(a6)
    306e:	2f40 0098      	move.l d0,152(sp)
            "ZoomCopperlist: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    3072:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    3078:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    307e:	4878 001c      	pea 1c <_start+0x1c>
    3082:	2f00           	move.l d0,-(sp)
    3084:	4eba f6e6      	jsr 276c <TestCopperlistPos>(pc)
    3088:	4fef 000c      	lea 12(sp),sp
    308c:	4a80           	tst.l d0
    308e:	6642           	bne.s 30d2 <ZoomTestDisplay+0x1c6>
    Write(Output(), 
    3090:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    3096:	2c40           	movea.l d0,a6
    3098:	4eae ffc4      	jsr -60(a6)
    309c:	2f40 0094      	move.l d0,148(sp)
    30a0:	202f 0094      	move.l 148(sp),d0
    30a4:	2f40 0090      	move.l d0,144(sp)
    30a8:	2f7c 0000 8165 	move.l #33125,140(sp)
    30ae:	008c 
    30b0:	703c           	moveq #60,d0
    30b2:	2f40 0088      	move.l d0,136(sp)
    30b6:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    30bc:	2c40           	movea.l d0,a6
    30be:	222f 0090      	move.l 144(sp),d1
    30c2:	242f 008c      	move.l 140(sp),d2
    30c6:	262f 0088      	move.l 136(sp),d3
    30ca:	4eae ffd0      	jsr -48(a6)
    30ce:	2f40 0084      	move.l d0,132(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    30d2:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    30d8:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    30de:	4878 001d      	pea 1d <_start+0x1d>
    30e2:	2f00           	move.l d0,-(sp)
    30e4:	4eba f686      	jsr 276c <TestCopperlistPos>(pc)
    30e8:	4fef 000c      	lea 12(sp),sp
    30ec:	4a80           	tst.l d0
    30ee:	6642           	bne.s 3132 <ZoomTestDisplay+0x226>
    Write(Output(), 
    30f0:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    30f6:	2c40           	movea.l d0,a6
    30f8:	4eae ffc4      	jsr -60(a6)
    30fc:	2f40 0080      	move.l d0,128(sp)
    3100:	202f 0080      	move.l 128(sp),d0
    3104:	2f40 007c      	move.l d0,124(sp)
    3108:	2f7c 0000 81a2 	move.l #33186,120(sp)
    310e:	0078 
    3110:	703c           	moveq #60,d0
    3112:	2f40 0074      	move.l d0,116(sp)
    3116:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    311c:	2c40           	movea.l d0,a6
    311e:	222f 007c      	move.l 124(sp),d1
    3122:	242f 0078      	move.l 120(sp),d2
    3126:	262f 0074      	move.l 116(sp),d3
    312a:	4eae ffd0      	jsr -48(a6)
    312e:	2f40 0070      	move.l d0,112(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1pl should be 00f4\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    3132:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    3138:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    313e:	4878 001e      	pea 1e <_start+0x1e>
    3142:	2f00           	move.l d0,-(sp)
    3144:	4eba f626      	jsr 276c <TestCopperlistPos>(pc)
    3148:	4fef 000c      	lea 12(sp),sp
    314c:	4a80           	tst.l d0
    314e:	6642           	bne.s 3192 <ZoomTestDisplay+0x286>
    Write(Output(), 
    3150:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    3156:	2c40           	movea.l d0,a6
    3158:	4eae ffc4      	jsr -60(a6)
    315c:	2f40 006c      	move.l d0,108(sp)
    3160:	202f 006c      	move.l 108(sp),d0
    3164:	2f40 0068      	move.l d0,104(sp)
    3168:	2f7c 0000 81df 	move.l #33247,100(sp)
    316e:	0064 
    3170:	703c           	moveq #60,d0
    3172:	2f40 0060      	move.l d0,96(sp)
    3176:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    317c:	2c40           	movea.l d0,a6
    317e:	222f 0068      	move.l 104(sp),d1
    3182:	242f 0064      	move.l 100(sp),d2
    3186:	262f 0060      	move.l 96(sp),d3
    318a:	4eae ffd0      	jsr -48(a6)
    318e:	2f40 005c      	move.l d0,92(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    3192:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    3198:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    319e:	4878 001f      	pea 1f <_start+0x1f>
    31a2:	2f00           	move.l d0,-(sp)
    31a4:	4eba f5c6      	jsr 276c <TestCopperlistPos>(pc)
    31a8:	4fef 000c      	lea 12(sp),sp
    31ac:	4a80           	tst.l d0
    31ae:	6642           	bne.s 31f2 <ZoomTestDisplay+0x2e6>
    Write(Output(), 
    31b0:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    31b6:	2c40           	movea.l d0,a6
    31b8:	4eae ffc4      	jsr -60(a6)
    31bc:	2f40 0058      	move.l d0,88(sp)
    31c0:	202f 0058      	move.l 88(sp),d0
    31c4:	2f40 0054      	move.l d0,84(sp)
    31c8:	2f7c 0000 821c 	move.l #33308,80(sp)
    31ce:	0050 
    31d0:	703c           	moveq #60,d0
    31d2:	2f40 004c      	move.l d0,76(sp)
    31d6:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    31dc:	2c40           	movea.l d0,a6
    31de:	222f 0054      	move.l 84(sp),d1
    31e2:	242f 0050      	move.l 80(sp),d2
    31e6:	262f 004c      	move.l 76(sp),d3
    31ea:	4eae ffd0      	jsr -48(a6)
    31ee:	2f40 0048      	move.l d0,72(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2pl should be 0034\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    31f2:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    31f8:	4878 0020      	pea 20 <_start+0x20>
    31fc:	4879 0000 a570 	pea a570 <ClColor>
    3202:	4878 0026      	pea 26 <_start+0x26>
    3206:	2f00           	move.l d0,-(sp)
    3208:	4eba f524      	jsr 272e <TestCopperlistBatch>(pc)
    320c:	4fef 0010      	lea 16(sp),sp
    3210:	4a80           	tst.l d0
    3212:	6642           	bne.s 3256 <ZoomTestDisplay+0x34a>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    3214:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    321a:	2c40           	movea.l d0,a6
    321c:	4eae ffc4      	jsr -60(a6)
    3220:	2f40 0044      	move.l d0,68(sp)
    3224:	202f 0044      	move.l 68(sp),d0
    3228:	2f40 0040      	move.l d0,64(sp)
    322c:	2f7c 0000 8259 	move.l #33369,60(sp)
    3232:	003c 
    3234:	7025           	moveq #37,d0
    3236:	2f40 0038      	move.l d0,56(sp)
    323a:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    3240:	2c40           	movea.l d0,a6
    3242:	222f 0040      	move.l 64(sp),d1
    3246:	242f 003c      	move.l 60(sp),d2
    324a:	262f 0038      	move.l 56(sp),d3
    324e:	4eae ffd0      	jsr -48(a6)
    3252:	2f40 0034      	move.l d0,52(sp)

  /*if(  TestCopperlistBatch(  Copperlist1, 71, Cl102ZoomRepeat, 21) == 0)
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36); */
  
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    3256:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    325c:	2f00           	move.l d0,-(sp)
    325e:	4878 000f      	pea f <_start+0xf>
    3262:	4eba d1a8      	jsr 40c <Zoom_Shrink102>(pc)
    3266:	508f           	addq.l #8,sp
  if( TestCopperListZoom102( Copperlist1, 73, Cl102ZoomTest) == 0)
    3268:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    326e:	4879 0000 b808 	pea b808 <Cl102ZoomTest>
    3274:	4878 0049      	pea 49 <_start+0x49>
    3278:	2f00           	move.l d0,-(sp)
    327a:	4eba 00c4      	jsr 3340 <TestCopperListZoom102>(pc)
    327e:	4fef 000c      	lea 12(sp),sp
    3282:	4a80           	tst.l d0
    3284:	6642           	bne.s 32c8 <ZoomTestDisplay+0x3bc>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    3286:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    328c:	2c40           	movea.l d0,a6
    328e:	4eae ffc4      	jsr -60(a6)
    3292:	2f40 0030      	move.l d0,48(sp)
    3296:	202f 0030      	move.l 48(sp),d0
    329a:	2f40 002c      	move.l d0,44(sp)
    329e:	2f7c 0000 827f 	move.l #33407,40(sp)
    32a4:	0028 
    32a6:	7025           	moveq #37,d0
    32a8:	2f40 0024      	move.l d0,36(sp)
    32ac:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    32b2:	2c40           	movea.l d0,a6
    32b4:	222f 002c      	move.l 44(sp),d1
    32b8:	242f 0028      	move.l 40(sp),d2
    32bc:	262f 0024      	move.l 36(sp),d3
    32c0:	4eae ffd0      	jsr -48(a6)
    32c4:	2f40 0020      	move.l d0,32(sp)

  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    32c8:	2039 004d 2b68 	move.l 4d2b68 <Copperlist1>,d0
    32ce:	4878 fffe      	pea fffffffe <_end+0xffb2d426>
    32d2:	4878 00bb      	pea bb <WaitBlt+0x7>
    32d6:	2f00           	move.l d0,-(sp)
    32d8:	4eba f492      	jsr 276c <TestCopperlistPos>(pc)
    32dc:	4fef 000c      	lea 12(sp),sp
    32e0:	4a80           	tst.l d0
    32e2:	6642           	bne.s 3326 <ZoomTestDisplay+0x41a>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    32e4:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    32ea:	2c40           	movea.l d0,a6
    32ec:	4eae ffc4      	jsr -60(a6)
    32f0:	2f40 001c      	move.l d0,28(sp)
    32f4:	202f 001c      	move.l 28(sp),d0
    32f8:	2f40 0018      	move.l d0,24(sp)
    32fc:	2f7c 0000 82a4 	move.l #33444,20(sp)
    3302:	0014 
    3304:	7032           	moveq #50,d0
    3306:	2f40 0010      	move.l d0,16(sp)
    330a:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    3310:	2c40           	movea.l d0,a6
    3312:	222f 0018      	move.l 24(sp),d1
    3316:	242f 0014      	move.l 20(sp),d2
    331a:	262f 0010      	move.l 16(sp),d3
    331e:	4eae ffd0      	jsr -48(a6)
    3322:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    3326:	2f3c 0000 df20 	move.l #57120,-(sp)
    332c:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    3330:	4eba cdae      	jsr e0 <FreeDisplay>(pc)
    3334:	508f           	addq.l #8,sp

}
    3336:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    333a:	4fef 00c8      	lea 200(sp),sp
    333e:	4e75           	rts

00003340 <TestCopperListZoom102>:

int TestCopperListZoom102( ULONG *cl2test, UWORD position, 
                                                           ULONG *template4cl) {
    3340:	598f           	subq.l #4,sp
    3342:	202f 000c      	move.l 12(sp),d0
    3346:	3000           	move.w d0,d0
    3348:	3f40 0002      	move.w d0,2(sp)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    334c:	7000           	moveq #0,d0
    334e:	302f 0002      	move.w 2(sp),d0
    3352:	4878 001c      	pea 1c <_start+0x1c>
    3356:	2f2f 0014      	move.l 20(sp),-(sp)
    335a:	2f00           	move.l d0,-(sp)
    335c:	2f2f 0014      	move.l 20(sp),-(sp)
    3360:	4eba f3cc      	jsr 272e <TestCopperlistBatch>(pc)
    3364:	4fef 0010      	lea 16(sp),sp
    3368:	4a80           	tst.l d0
    336a:	6604           	bne.s 3370 <TestCopperListZoom102+0x30>
    return 0;
    336c:	7000           	moveq #0,d0
    336e:	6062           	bra.s 33d2 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    3370:	7078           	moveq #120,d0
    3372:	d0af 0010      	add.l 16(sp),d0
    3376:	7200           	moveq #0,d1
    3378:	322f 0002      	move.w 2(sp),d1
    337c:	307c 001e      	movea.w #30,a0
    3380:	d1c1           	adda.l d1,a0
    3382:	4878 0036      	pea 36 <_start+0x36>
    3386:	2f00           	move.l d0,-(sp)
    3388:	2f08           	move.l a0,-(sp)
    338a:	2f2f 0014      	move.l 20(sp),-(sp)
    338e:	4eba f39e      	jsr 272e <TestCopperlistBatch>(pc)
    3392:	4fef 0010      	lea 16(sp),sp
    3396:	4a80           	tst.l d0
    3398:	6604           	bne.s 339e <TestCopperListZoom102+0x5e>
    return 0;
    339a:	7000           	moveq #0,d0
    339c:	6034           	bra.s 33d2 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    339e:	202f 0010      	move.l 16(sp),d0
    33a2:	0680 0000 0158 	addi.l #344,d0
    33a8:	7200           	moveq #0,d1
    33aa:	322f 0002      	move.w 2(sp),d1
    33ae:	307c 0056      	movea.w #86,a0
    33b2:	d1c1           	adda.l d1,a0
    33b4:	4878 001c      	pea 1c <_start+0x1c>
    33b8:	2f00           	move.l d0,-(sp)
    33ba:	2f08           	move.l a0,-(sp)
    33bc:	2f2f 0014      	move.l 20(sp),-(sp)
    33c0:	4eba f36c      	jsr 272e <TestCopperlistBatch>(pc)
    33c4:	4fef 0010      	lea 16(sp),sp
    33c8:	4a80           	tst.l d0
    33ca:	6604           	bne.s 33d0 <TestCopperListZoom102+0x90>
    return 0;
    33cc:	7000           	moveq #0,d0
    33ce:	6002           	bra.s 33d2 <TestCopperListZoom102+0x92>
 
  return 1;
    33d0:	7001           	moveq #1,d0
}
    33d2:	588f           	addq.l #4,sp
    33d4:	4e75           	rts

000033d6 <TestBlitleftOfZoom>:

void TestBlitleftOfZoom() {
    33d6:	4fef ff94      	lea -108(sp),sp
    33da:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Zoom_Init();
    33de:	4eba dfac      	jsr 138c <Zoom_Init>(pc)
  PrepareDisplayZoom();
    33e2:	4eba e342      	jsr 1726 <PrepareDisplayZoom>(pc)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    33e6:	2f7c 0000 c800 	move.l #51200,116(sp)
    33ec:	0074 
    33ee:	7002           	moveq #2,d0
    33f0:	2f40 0070      	move.l d0,112(sp)
    33f4:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    33fa:	2c40           	movea.l d0,a6
    33fc:	202f 0074      	move.l 116(sp),d0
    3400:	222f 0070      	move.l 112(sp),d1
    3404:	4eae ff3a      	jsr -198(a6)
    3408:	2f40 006c      	move.l d0,108(sp)
    340c:	202f 006c      	move.l 108(sp),d0
    3410:	23c0 004d 2bb2 	move.l d0,4d2bb2 <Zoom_Source>
  if( Zoom_Source == 0) {
    3416:	2039 004d 2bb2 	move.l 4d2bb2 <Zoom_Source>,d0
    341c:	6646           	bne.s 3464 <TestBlitleftOfZoom+0x8e>
    Write(  Output(), 
    341e:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    3424:	2c40           	movea.l d0,a6
    3426:	4eae ffc4      	jsr -60(a6)
    342a:	2f40 001c      	move.l d0,28(sp)
    342e:	202f 001c      	move.l 28(sp),d0
    3432:	2f40 0018      	move.l d0,24(sp)
    3436:	2f7c 0000 82d7 	move.l #33495,20(sp)
    343c:	0014 
    343e:	7236           	moveq #54,d1
    3440:	2f41 0010      	move.l d1,16(sp)
    3444:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    344a:	2c40           	movea.l d0,a6
    344c:	222f 0018      	move.l 24(sp),d1
    3450:	242f 0014      	move.l 20(sp),d2
    3454:	262f 0010      	move.l 16(sp),d3
    3458:	4eae ffd0      	jsr -48(a6)
    345c:	2f40 000c      	move.l d0,12(sp)
    3460:	6000 01fe      	bra.w 3660 <TestBlitleftOfZoom+0x28a>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  
  UWORD *tstsource = Zoom_Source;
    3464:	2f79 004d 2bb2 	move.l 4d2bb2 <Zoom_Source>,104(sp)
    346a:	0068 
  *tstsource++ = 0x0000;
    346c:	202f 0068      	move.l 104(sp),d0
    3470:	2200           	move.l d0,d1
    3472:	5481           	addq.l #2,d1
    3474:	2f41 0068      	move.l d1,104(sp)
    3478:	2040           	movea.l d0,a0
    347a:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    347c:	206f 0068      	movea.l 104(sp),a0
    3480:	30bc 0080      	move.w #128,(a0)
  tstsource += ZMLINESIZE/2-1;
    3484:	7028           	moveq #40,d0
    3486:	d1af 0068      	add.l d0,104(sp)
  *tstsource = 0x1000;
    348a:	206f 0068      	movea.l 104(sp),a0
    348e:	30bc 1000      	move.w #4096,(a0)
  tstsource++;
    3492:	54af 0068      	addq.l #2,104(sp)
  *tstsource = 0x8e88;
    3496:	206f 0068      	movea.l 104(sp),a0
    349a:	30bc 8e88      	move.w #-29048,(a0)
  tstsource += ZMLINESIZE/2-1;
    349e:	7228           	moveq #40,d1
    34a0:	d3af 0068      	add.l d1,104(sp)

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
    34a4:	2039 004d 2bb2 	move.l 4d2bb2 <Zoom_Source>,d0
    34aa:	2200           	move.l d0,d1
    34ac:	0681 0000 14d6 	addi.l #5334,d1
    34b2:	2f41 0068      	move.l d1,104(sp)
  *tstsource++ = 0x0000;
    34b6:	202f 0068      	move.l 104(sp),d0
    34ba:	2200           	move.l d0,d1
    34bc:	5481           	addq.l #2,d1
    34be:	2f41 0068      	move.l d1,104(sp)
    34c2:	2040           	movea.l d0,a0
    34c4:	4250           	clr.w (a0)
  *tstsource = 0x00ff;
    34c6:	206f 0068      	movea.l 104(sp),a0
    34ca:	30bc 00ff      	move.w #255,(a0)
  WaitBlit();
    34ce:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    34d4:	2c40           	movea.l d0,a6
    34d6:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    34da:	4eba e3c2      	jsr 189e <Init_Blit>(pc)
  Init_ZoomBlit( 7, 16, 0);
    34de:	42a7           	clr.l -(sp)
    34e0:	4878 0010      	pea 10 <_start+0x10>
    34e4:	4878 0007      	pea 7 <_start+0x7>
    34e8:	4eba e430      	jsr 191a <Init_ZoomBlit>(pc)
    34ec:	4fef 000c      	lea 12(sp),sp
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    34f0:	2239 004d 2b70 	move.l 4d2b70 <DrawBuffer>,d1
    34f6:	2039 004d 2bb2 	move.l 4d2bb2 <Zoom_Source>,d0
    34fc:	4878 0080      	pea 80 <_start+0x80>
    3500:	2f01           	move.l d1,-(sp)
    3502:	2f00           	move.l d0,-(sp)
    3504:	4eba da98      	jsr f9e <Zoom_ZoomBlit>(pc)
    3508:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    350c:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    3512:	2c40           	movea.l d0,a6
    3514:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    3518:	2039 004d 2b70 	move.l 4d2b70 <DrawBuffer>,d0
    351e:	2200           	move.l d0,d1
    3520:	5481           	addq.l #2,d1
    3522:	2f41 0064      	move.l d1,100(sp)
  if( *destination != 0x0180) {
    3526:	206f 0064      	movea.l 100(sp),a0
    352a:	3010           	move.w (a0),d0
    352c:	0c40 0180      	cmpi.w #384,d0
    3530:	6742           	beq.s 3574 <TestBlitleftOfZoom+0x19e>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    3532:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    3538:	2c40           	movea.l d0,a6
    353a:	4eae ffc4      	jsr -60(a6)
    353e:	2f40 0060      	move.l d0,96(sp)
    3542:	202f 0060      	move.l 96(sp),d0
    3546:	2f40 005c      	move.l d0,92(sp)
    354a:	2f7c 0000 830f 	move.l #33551,88(sp)
    3550:	0058 
    3552:	701c           	moveq #28,d0
    3554:	2f40 0054      	move.l d0,84(sp)
    3558:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    355e:	2c40           	movea.l d0,a6
    3560:	222f 005c      	move.l 92(sp),d1
    3564:	242f 0058      	move.l 88(sp),d2
    3568:	262f 0054      	move.l 84(sp),d3
    356c:	4eae ffd0      	jsr -48(a6)
    3570:	2f40 0050      	move.l d0,80(sp)
  }
  destination += ZMLINESIZE/2;
    3574:	722a           	moveq #42,d1
    3576:	d3af 0064      	add.l d1,100(sp)
  if( *destination != 0x1d88)
    357a:	206f 0064      	movea.l 100(sp),a0
    357e:	3010           	move.w (a0),d0
    3580:	0c40 1d88      	cmpi.w #7560,d0
    3584:	6742           	beq.s 35c8 <TestBlitleftOfZoom+0x1f2>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    3586:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    358c:	2c40           	movea.l d0,a6
    358e:	4eae ffc4      	jsr -60(a6)
    3592:	2f40 004c      	move.l d0,76(sp)
    3596:	202f 004c      	move.l 76(sp),d0
    359a:	2f40 0048      	move.l d0,72(sp)
    359e:	2f7c 0000 832c 	move.l #33580,68(sp)
    35a4:	0044 
    35a6:	701c           	moveq #28,d0
    35a8:	2f40 0040      	move.l d0,64(sp)
    35ac:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    35b2:	2c40           	movea.l d0,a6
    35b4:	222f 0048      	move.l 72(sp),d1
    35b8:	242f 0044      	move.l 68(sp),d2
    35bc:	262f 0040      	move.l 64(sp),d3
    35c0:	4eae ffd0      	jsr -48(a6)
    35c4:	2f40 003c      	move.l d0,60(sp)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
    35c8:	2039 004d 2b70 	move.l 4d2b70 <DrawBuffer>,d0
    35ce:	2200           	move.l d0,d1
    35d0:	0681 0000 14d6 	addi.l #5334,d1
    35d6:	2f41 0064      	move.l d1,100(sp)
  destination++;
    35da:	54af 0064      	addq.l #2,100(sp)
  if( *destination != 0x01ff) {
    35de:	206f 0064      	movea.l 100(sp),a0
    35e2:	3010           	move.w (a0),d0
    35e4:	0c40 01ff      	cmpi.w #511,d0
    35e8:	6742           	beq.s 362c <TestBlitleftOfZoom+0x256>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    35ea:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    35f0:	2c40           	movea.l d0,a6
    35f2:	4eae ffc4      	jsr -60(a6)
    35f6:	2f40 0038      	move.l d0,56(sp)
    35fa:	202f 0038      	move.l 56(sp),d0
    35fe:	2f40 0034      	move.l d0,52(sp)
    3602:	2f7c 0000 8349 	move.l #33609,48(sp)
    3608:	0030 
    360a:	701a           	moveq #26,d0
    360c:	2f40 002c      	move.l d0,44(sp)
    3610:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    3616:	2c40           	movea.l d0,a6
    3618:	222f 0034      	move.l 52(sp),d1
    361c:	242f 0030      	move.l 48(sp),d2
    3620:	262f 002c      	move.l 44(sp),d3
    3624:	4eae ffd0      	jsr -48(a6)
    3628:	2f40 0028      	move.l d0,40(sp)
  }
  FreeMem( Zoom_Source, 40*256*5);
    362c:	2f79 004d 2bb2 	move.l 4d2bb2 <Zoom_Source>,36(sp)
    3632:	0024 
    3634:	2f7c 0000 c800 	move.l #51200,32(sp)
    363a:	0020 
    363c:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    3642:	2c40           	movea.l d0,a6
    3644:	226f 0024      	movea.l 36(sp),a1
    3648:	202f 0020      	move.l 32(sp),d0
    364c:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    3650:	2f3c 0000 df20 	move.l #57120,-(sp)
    3656:	4878 031c      	pea 31c <Zoom_InsertShift+0x1e>
    365a:	4eba ca84      	jsr e0 <FreeDisplay>(pc)
    365e:	508f           	addq.l #8,sp
}
    3660:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3664:	4fef 006c      	lea 108(sp),sp
    3668:	4e75           	rts

0000366a <TestCopyWord>:

void TestCopyWord() {
    366a:	4fef ff74      	lea -140(sp),sp
    366e:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    3672:	2f7c 0000 04ec 	move.l #1260,136(sp)
    3678:	0088 
    367a:	7002           	moveq #2,d0
    367c:	2f40 0084      	move.l d0,132(sp)
    3680:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    3686:	2c40           	movea.l d0,a6
    3688:	202f 0088      	move.l 136(sp),d0
    368c:	222f 0084      	move.l 132(sp),d1
    3690:	4eae ff3a      	jsr -198(a6)
    3694:	2f40 0080      	move.l d0,128(sp)
    3698:	202f 0080      	move.l 128(sp),d0
    369c:	2f40 007c      	move.l d0,124(sp)
  if( source == 0) {
    36a0:	6646           	bne.s 36e8 <TestCopyWord+0x7e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    36a2:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    36a8:	2c40           	movea.l d0,a6
    36aa:	4eae ffc4      	jsr -60(a6)
    36ae:	2f40 001c      	move.l d0,28(sp)
    36b2:	202f 001c      	move.l 28(sp),d0
    36b6:	2f40 0018      	move.l d0,24(sp)
    36ba:	2f7c 0000 8364 	move.l #33636,20(sp)
    36c0:	0014 
    36c2:	7235           	moveq #53,d1
    36c4:	2f41 0010      	move.l d1,16(sp)
    36c8:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    36ce:	2c40           	movea.l d0,a6
    36d0:	222f 0018      	move.l 24(sp),d1
    36d4:	242f 0014      	move.l 20(sp),d2
    36d8:	262f 0010      	move.l 16(sp),d3
    36dc:	4eae ffd0      	jsr -48(a6)
    36e0:	2f40 000c      	move.l d0,12(sp)
    36e4:	6000 026c      	bra.w 3952 <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    36e8:	2f7c 0000 04ec 	move.l #1260,120(sp)
    36ee:	0078 
    36f0:	7002           	moveq #2,d0
    36f2:	2f40 0074      	move.l d0,116(sp)
    36f6:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    36fc:	2c40           	movea.l d0,a6
    36fe:	202f 0078      	move.l 120(sp),d0
    3702:	222f 0074      	move.l 116(sp),d1
    3706:	4eae ff3a      	jsr -198(a6)
    370a:	2f40 0070      	move.l d0,112(sp)
    370e:	202f 0070      	move.l 112(sp),d0
    3712:	2f40 006c      	move.l d0,108(sp)
  if( destination == 0) {
    3716:	6646           	bne.s 375e <TestCopyWord+0xf4>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3718:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    371e:	2c40           	movea.l d0,a6
    3720:	4eae ffc4      	jsr -60(a6)
    3724:	2f40 0030      	move.l d0,48(sp)
    3728:	202f 0030      	move.l 48(sp),d0
    372c:	2f40 002c      	move.l d0,44(sp)
    3730:	2f7c 0000 8364 	move.l #33636,40(sp)
    3736:	0028 
    3738:	7235           	moveq #53,d1
    373a:	2f41 0024      	move.l d1,36(sp)
    373e:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    3744:	2c40           	movea.l d0,a6
    3746:	222f 002c      	move.l 44(sp),d1
    374a:	242f 0028      	move.l 40(sp),d2
    374e:	262f 0024      	move.l 36(sp),d3
    3752:	4eae ffd0      	jsr -48(a6)
    3756:	2f40 0020      	move.l d0,32(sp)
    375a:	6000 01f6      	bra.w 3952 <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
    375e:	2f6f 007c 0094 	move.l 124(sp),148(sp)
  for( int i=0; i<8;i++) {
    3764:	42af 0090      	clr.l 144(sp)
    3768:	6000 0086      	bra.w 37f0 <TestCopyWord+0x186>
    *tmp++ = 0;
    376c:	202f 0094      	move.l 148(sp),d0
    3770:	2200           	move.l d0,d1
    3772:	5481           	addq.l #2,d1
    3774:	2f41 0094      	move.l d1,148(sp)
    3778:	2040           	movea.l d0,a0
    377a:	4250           	clr.w (a0)
    *tmp++ = 0xaaaa;
    377c:	202f 0094      	move.l 148(sp),d0
    3780:	2200           	move.l d0,d1
    3782:	5481           	addq.l #2,d1
    3784:	2f41 0094      	move.l d1,148(sp)
    3788:	2040           	movea.l d0,a0
    378a:	30bc aaaa      	move.w #-21846,(a0)
    *tmp++ = 0xaaaa;
    378e:	202f 0094      	move.l 148(sp),d0
    3792:	2200           	move.l d0,d1
    3794:	5481           	addq.l #2,d1
    3796:	2f41 0094      	move.l d1,148(sp)
    379a:	2040           	movea.l d0,a0
    379c:	30bc aaaa      	move.w #-21846,(a0)
    *tmp = 0;
    37a0:	206f 0094      	movea.l 148(sp),a0
    37a4:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    37a6:	7024           	moveq #36,d0
    37a8:	d1af 0094      	add.l d0,148(sp)
    *tmp++ = 0;
    37ac:	202f 0094      	move.l 148(sp),d0
    37b0:	2200           	move.l d0,d1
    37b2:	5481           	addq.l #2,d1
    37b4:	2f41 0094      	move.l d1,148(sp)
    37b8:	2040           	movea.l d0,a0
    37ba:	4250           	clr.w (a0)
    *tmp++ = 0x5555;
    37bc:	202f 0094      	move.l 148(sp),d0
    37c0:	2200           	move.l d0,d1
    37c2:	5481           	addq.l #2,d1
    37c4:	2f41 0094      	move.l d1,148(sp)
    37c8:	2040           	movea.l d0,a0
    37ca:	30bc 5555      	move.w #21845,(a0)
    *tmp++ = 0x5555;
    37ce:	202f 0094      	move.l 148(sp),d0
    37d2:	2200           	move.l d0,d1
    37d4:	5481           	addq.l #2,d1
    37d6:	2f41 0094      	move.l d1,148(sp)
    37da:	2040           	movea.l d0,a0
    37dc:	30bc 5555      	move.w #21845,(a0)
    *tmp = 0;
    37e0:	206f 0094      	movea.l 148(sp),a0
    37e4:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    37e6:	7024           	moveq #36,d0
    37e8:	d1af 0094      	add.l d0,148(sp)
  for( int i=0; i<8;i++) {
    37ec:	52af 0090      	addq.l #1,144(sp)
    37f0:	7207           	moveq #7,d1
    37f2:	b2af 0090      	cmp.l 144(sp),d1
    37f6:	6c00 ff74      	bge.w 376c <TestCopyWord+0x102>
  }
  tmp = destination;
    37fa:	2f6f 006c 0094 	move.l 108(sp),148(sp)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3800:	42af 008c      	clr.l 140(sp)
    3804:	6014           	bra.s 381a <TestCopyWord+0x1b0>
    *tmp++ = 0;
    3806:	202f 0094      	move.l 148(sp),d0
    380a:	2200           	move.l d0,d1
    380c:	5481           	addq.l #2,d1
    380e:	2f41 0094      	move.l d1,148(sp)
    3812:	2040           	movea.l d0,a0
    3814:	4250           	clr.w (a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3816:	52af 008c      	addq.l #1,140(sp)
    381a:	0caf 0000 0275 	cmpi.l #629,140(sp)
    3820:	008c 
    3822:	6fe2           	ble.s 3806 <TestCopyWord+0x19c>
  }

  WaitBlit();
    3824:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    382a:	2c40           	movea.l d0,a6
    382c:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
    3830:	4eba db5a      	jsr 138c <Zoom_Init>(pc)
  Init_Copy( 3);
    3834:	4878 0003      	pea 3 <_start+0x3>
    3838:	4eba e184      	jsr 19be <Init_Copy>(pc)
    383c:	588f           	addq.l #4,sp
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
    383e:	202f 007c      	move.l 124(sp),d0
    3842:	5480           	addq.l #2,d0
    3844:	4878 0010      	pea 10 <_start+0x10>
    3848:	2f2f 0070      	move.l 112(sp),-(sp)
    384c:	2f00           	move.l d0,-(sp)
    384e:	4eba d710      	jsr f60 <Zoom_CopyWord>(pc)
    3852:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    3856:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    385c:	2c40           	movea.l d0,a6
    385e:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
    3862:	202f 006c      	move.l 108(sp),d0
    3866:	5480           	addq.l #2,d0
    3868:	2f40 0094      	move.l d0,148(sp)
  if( *tmp != 0x5555) 
    386c:	206f 0094      	movea.l 148(sp),a0
    3870:	3010           	move.w (a0),d0
    3872:	0c40 5555      	cmpi.w #21845,d0
    3876:	6742           	beq.s 38ba <TestCopyWord+0x250>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    3878:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    387e:	2c40           	movea.l d0,a6
    3880:	4eae ffc4      	jsr -60(a6)
    3884:	2f40 0068      	move.l d0,104(sp)
    3888:	202f 0068      	move.l 104(sp),d0
    388c:	2f40 0064      	move.l d0,100(sp)
    3890:	2f7c 0000 839a 	move.l #33690,96(sp)
    3896:	0060 
    3898:	721f           	moveq #31,d1
    389a:	2f41 005c      	move.l d1,92(sp)
    389e:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    38a4:	2c40           	movea.l d0,a6
    38a6:	222f 0064      	move.l 100(sp),d1
    38aa:	242f 0060      	move.l 96(sp),d2
    38ae:	262f 005c      	move.l 92(sp),d3
    38b2:	4eae ffd0      	jsr -48(a6)
    38b6:	2f40 0058      	move.l d0,88(sp)
  tmp += ZMLINESIZE/2;
    38ba:	702a           	moveq #42,d0
    38bc:	d1af 0094      	add.l d0,148(sp)
  if( *tmp != 0xaaaa)
    38c0:	206f 0094      	movea.l 148(sp),a0
    38c4:	3010           	move.w (a0),d0
    38c6:	0c40 aaaa      	cmpi.w #-21846,d0
    38ca:	6742           	beq.s 390e <TestCopyWord+0x2a4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    38cc:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    38d2:	2c40           	movea.l d0,a6
    38d4:	4eae ffc4      	jsr -60(a6)
    38d8:	2f40 0054      	move.l d0,84(sp)
    38dc:	202f 0054      	move.l 84(sp),d0
    38e0:	2f40 0050      	move.l d0,80(sp)
    38e4:	2f7c 0000 83ba 	move.l #33722,76(sp)
    38ea:	004c 
    38ec:	7220           	moveq #32,d1
    38ee:	2f41 0048      	move.l d1,72(sp)
    38f2:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    38f8:	2c40           	movea.l d0,a6
    38fa:	222f 0050      	move.l 80(sp),d1
    38fe:	242f 004c      	move.l 76(sp),d2
    3902:	262f 0048      	move.l 72(sp),d3
    3906:	4eae ffd0      	jsr -48(a6)
    390a:	2f40 0044      	move.l d0,68(sp)
  
  FreeMem( source,ZMLINESIZE*30);
    390e:	2f6f 007c 0040 	move.l 124(sp),64(sp)
    3914:	2f7c 0000 04ec 	move.l #1260,60(sp)
    391a:	003c 
    391c:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    3922:	2c40           	movea.l d0,a6
    3924:	226f 0040      	movea.l 64(sp),a1
    3928:	202f 003c      	move.l 60(sp),d0
    392c:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    3930:	2f6f 006c 0038 	move.l 108(sp),56(sp)
    3936:	2f7c 0000 04ec 	move.l #1260,52(sp)
    393c:	0034 
    393e:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    3944:	2c40           	movea.l d0,a6
    3946:	226f 0038      	movea.l 56(sp),a1
    394a:	202f 0034      	move.l 52(sp),d0
    394e:	4eae ff2e      	jsr -210(a6)
}
    3952:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3956:	4fef 008c      	lea 140(sp),sp
    395a:	4e75           	rts

0000395c <TestZoom4PictureOn5Planes>:
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */


void TestZoom4PictureOn5Planes() {
    395c:	4fef ff74      	lea -140(sp),sp
    3960:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3964:	2f7c 0000 f460 	move.l #62560,102(sp)
    396a:	0066 
    396c:	7002           	moveq #2,d0
    396e:	2f40 0062      	move.l d0,98(sp)
    3972:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    3978:	2c40           	movea.l d0,a6
    397a:	202f 0066      	move.l 102(sp),d0
    397e:	222f 0062      	move.l 98(sp),d1
    3982:	4eae ff3a      	jsr -198(a6)
    3986:	2f40 005e      	move.l d0,94(sp)
    398a:	202f 005e      	move.l 94(sp),d0
    398e:	2f40 005a      	move.l d0,90(sp)
  if( source == 0) {
    3992:	6646           	bne.s 39da <TestZoom4PictureOn5Planes+0x7e>
    Write(  Output(), 
    3994:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    399a:	2c40           	movea.l d0,a6
    399c:	4eae ffc4      	jsr -60(a6)
    39a0:	2f40 001e      	move.l d0,30(sp)
    39a4:	202f 001e      	move.l 30(sp),d0
    39a8:	2f40 001a      	move.l d0,26(sp)
    39ac:	2f7c 0000 83db 	move.l #33755,22(sp)
    39b2:	0016 
    39b4:	7239           	moveq #57,d1
    39b6:	2f41 0012      	move.l d1,18(sp)
    39ba:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    39c0:	2c40           	movea.l d0,a6
    39c2:	222f 001a      	move.l 26(sp),d1
    39c6:	242f 0016      	move.l 22(sp),d2
    39ca:	262f 0012      	move.l 18(sp),d3
    39ce:	4eae ffd0      	jsr -48(a6)
    39d2:	2f40 000e      	move.l d0,14(sp)
    39d6:	6000 0266      	bra.w 3c3e <TestZoom4PictureOn5Planes+0x2e2>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    39da:	2f7c 0000 f460 	move.l #62560,86(sp)
    39e0:	0056 
    39e2:	7002           	moveq #2,d0
    39e4:	2f40 0052      	move.l d0,82(sp)
    39e8:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    39ee:	2c40           	movea.l d0,a6
    39f0:	202f 0056      	move.l 86(sp),d0
    39f4:	222f 0052      	move.l 82(sp),d1
    39f8:	4eae ff3a      	jsr -198(a6)
    39fc:	2f40 004e      	move.l d0,78(sp)
    3a00:	202f 004e      	move.l 78(sp),d0
    3a04:	2f40 004a      	move.l d0,74(sp)
  if( destination == 0) {
    3a08:	6646           	bne.s 3a50 <TestZoom4PictureOn5Planes+0xf4>
    Write(  Output(), 
    3a0a:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    3a10:	2c40           	movea.l d0,a6
    3a12:	4eae ffc4      	jsr -60(a6)
    3a16:	2f40 0032      	move.l d0,50(sp)
    3a1a:	202f 0032      	move.l 50(sp),d0
    3a1e:	2f40 002e      	move.l d0,46(sp)
    3a22:	2f7c 0000 8415 	move.l #33813,42(sp)
    3a28:	002a 
    3a2a:	723d           	moveq #61,d1
    3a2c:	2f41 0026      	move.l d1,38(sp)
    3a30:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    3a36:	2c40           	movea.l d0,a6
    3a38:	222f 002e      	move.l 46(sp),d1
    3a3c:	242f 002a      	move.l 42(sp),d2
    3a40:	262f 0026      	move.l 38(sp),d3
    3a44:	4eae ffd0      	jsr -48(a6)
    3a48:	2f40 0022      	move.l d0,34(sp)
    3a4c:	6000 01f0      	bra.w 3c3e <TestZoom4PictureOn5Planes+0x2e2>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3a50:	2f6f 005a 0094 	move.l 90(sp),148(sp)
  for(int i=0;i<128+8;i++) {
    3a56:	42af 0090      	clr.l 144(sp)
    3a5a:	6050           	bra.s 3aac <TestZoom4PictureOn5Planes+0x150>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3a5c:	42af 008c      	clr.l 140(sp)
    3a60:	6018           	bra.s 3a7a <TestZoom4PictureOn5Planes+0x11e>
      *tmp4source++ = 0x55555555;
    3a62:	202f 0094      	move.l 148(sp),d0
    3a66:	2200           	move.l d0,d1
    3a68:	5881           	addq.l #4,d1
    3a6a:	2f41 0094      	move.l d1,148(sp)
    3a6e:	2040           	movea.l d0,a0
    3a70:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3a76:	52af 008c      	addq.l #1,140(sp)
    3a7a:	7031           	moveq #49,d0
    3a7c:	b0af 008c      	cmp.l 140(sp),d0
    3a80:	6ce0           	bge.s 3a62 <TestZoom4PictureOn5Planes+0x106>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3a82:	42af 0088      	clr.l 136(sp)
    3a86:	6018           	bra.s 3aa0 <TestZoom4PictureOn5Planes+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3a88:	202f 0094      	move.l 148(sp),d0
    3a8c:	2200           	move.l d0,d1
    3a8e:	5881           	addq.l #4,d1
    3a90:	2f41 0094      	move.l d1,148(sp)
    3a94:	2040           	movea.l d0,a0
    3a96:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3a9c:	52af 0088      	addq.l #1,136(sp)
    3aa0:	7031           	moveq #49,d0
    3aa2:	b0af 0088      	cmp.l 136(sp),d0
    3aa6:	6ce0           	bge.s 3a88 <TestZoom4PictureOn5Planes+0x12c>
  for(int i=0;i<128+8;i++) {
    3aa8:	52af 0090      	addq.l #1,144(sp)
    3aac:	0caf 0000 0087 	cmpi.l #135,144(sp)
    3ab2:	0090 
    3ab4:	6fa6           	ble.s 3a5c <TestZoom4PictureOn5Planes+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3ab6:	4878 0005      	pea 5 <_start+0x5>
    3aba:	42a7           	clr.l -(sp)
    3abc:	2f2f 0052      	move.l 82(sp),-(sp)
    3ac0:	2f2f 0066      	move.l 102(sp),-(sp)
    3ac4:	4eba df32      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    3ac8:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3acc:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    3ad2:	2c40           	movea.l d0,a6
    3ad4:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3ad8:	222f 004a      	move.l 74(sp),d1
    3adc:	5881           	addq.l #4,d1
    3ade:	2f41 0084      	move.l d1,132(sp)
  UWORD *valsupposed = destlinezoom1;
    3ae2:	2f7c 0000 ba2c 	move.l #47660,70(sp)
    3ae8:	0046 
  UWORD mask = 0xffff;
    3aea:	3f7c ffff 0082 	move.w #-1,130(sp)
  for(int i=0;i<14;i++) {
    3af0:	42af 007e      	clr.l 126(sp)
    3af4:	6000 00a8      	bra.w 3b9e <TestZoom4PictureOn5Planes+0x242>
    for(int i2=0;i2<18;i2++) { 
    3af8:	42af 007a      	clr.l 122(sp)
    3afc:	604e           	bra.s 3b4c <TestZoom4PictureOn5Planes+0x1f0>
      for( int i3=0;i3<5;i3++) {
    3afe:	42af 0076      	clr.l 118(sp)
    3b02:	6038           	bra.s 3b3c <TestZoom4PictureOn5Planes+0x1e0>
        TestRow( valsupposed, valactual, mask, i2+i*19);
    3b04:	222f 007e      	move.l 126(sp),d1
    3b08:	2001           	move.l d1,d0
    3b0a:	e788           	lsl.l #3,d0
    3b0c:	d081           	add.l d1,d0
    3b0e:	d080           	add.l d0,d0
    3b10:	d081           	add.l d1,d0
    3b12:	2200           	move.l d0,d1
    3b14:	d2af 007a      	add.l 122(sp),d1
    3b18:	7000           	moveq #0,d0
    3b1a:	302f 0082      	move.w 130(sp),d0
    3b1e:	2f01           	move.l d1,-(sp)
    3b20:	2f00           	move.l d0,-(sp)
    3b22:	2f2f 008c      	move.l 140(sp),-(sp)
    3b26:	2f2f 0052      	move.l 82(sp),-(sp)
    3b2a:	4eba 2f7e      	jsr 6aaa <TestRow>(pc)
    3b2e:	4fef 0010      	lea 16(sp),sp
        valactual += ZMLINESIZE/2;
    3b32:	702a           	moveq #42,d0
    3b34:	d1af 0084      	add.l d0,132(sp)
      for( int i3=0;i3<5;i3++) {
    3b38:	52af 0076      	addq.l #1,118(sp)
    3b3c:	7204           	moveq #4,d1
    3b3e:	b2af 0076      	cmp.l 118(sp),d1
    3b42:	6cc0           	bge.s 3b04 <TestZoom4PictureOn5Planes+0x1a8>
      }
      mask = mask ^ 0xffff;
    3b44:	466f 0082      	not.w 130(sp)
    for(int i2=0;i2<18;i2++) { 
    3b48:	52af 007a      	addq.l #1,122(sp)
    3b4c:	7011           	moveq #17,d0
    3b4e:	b0af 007a      	cmp.l 122(sp),d0
    3b52:	6caa           	bge.s 3afe <TestZoom4PictureOn5Planes+0x1a2>
    }
    for( int i3=0;i3<5;i3++) {
    3b54:	42af 0072      	clr.l 114(sp)
    3b58:	6038           	bra.s 3b92 <TestZoom4PictureOn5Planes+0x236>
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3b5a:	222f 007e      	move.l 126(sp),d1
    3b5e:	2001           	move.l d1,d0
    3b60:	e788           	lsl.l #3,d0
    3b62:	d081           	add.l d1,d0
    3b64:	d080           	add.l d0,d0
    3b66:	2040           	movea.l d0,a0
    3b68:	d1c1           	adda.l d1,a0
    3b6a:	41e8 0012      	lea 18(a0),a0
    3b6e:	7000           	moveq #0,d0
    3b70:	302f 0082      	move.w 130(sp),d0
    3b74:	2f08           	move.l a0,-(sp)
    3b76:	2f00           	move.l d0,-(sp)
    3b78:	2f2f 008c      	move.l 140(sp),-(sp)
    3b7c:	2f2f 0052      	move.l 82(sp),-(sp)
    3b80:	4eba 2f28      	jsr 6aaa <TestRow>(pc)
    3b84:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3b88:	722a           	moveq #42,d1
    3b8a:	d3af 0084      	add.l d1,132(sp)
    for( int i3=0;i3<5;i3++) {
    3b8e:	52af 0072      	addq.l #1,114(sp)
    3b92:	7004           	moveq #4,d0
    3b94:	b0af 0072      	cmp.l 114(sp),d0
    3b98:	6cc0           	bge.s 3b5a <TestZoom4PictureOn5Planes+0x1fe>
  for(int i=0;i<14;i++) {
    3b9a:	52af 007e      	addq.l #1,126(sp)
    3b9e:	720d           	moveq #13,d1
    3ba0:	b2af 007e      	cmp.l 126(sp),d1
    3ba4:	6c00 ff52      	bge.w 3af8 <TestZoom4PictureOn5Planes+0x19c>
    }
  }
  for(int i2=0;i2<4;i2++) { 
    3ba8:	42af 006e      	clr.l 110(sp)
    3bac:	6044           	bra.s 3bf2 <TestZoom4PictureOn5Planes+0x296>
    for( int i3=0;i3<5;i3++) {
    3bae:	42af 006a      	clr.l 106(sp)
    3bb2:	602e           	bra.s 3be2 <TestZoom4PictureOn5Planes+0x286>
      TestRow( valsupposed, valactual, mask, i2+265);
    3bb4:	222f 006e      	move.l 110(sp),d1
    3bb8:	0681 0000 0109 	addi.l #265,d1
    3bbe:	7000           	moveq #0,d0
    3bc0:	302f 0082      	move.w 130(sp),d0
    3bc4:	2f01           	move.l d1,-(sp)
    3bc6:	2f00           	move.l d0,-(sp)
    3bc8:	2f2f 008c      	move.l 140(sp),-(sp)
    3bcc:	2f2f 0052      	move.l 82(sp),-(sp)
    3bd0:	4eba 2ed8      	jsr 6aaa <TestRow>(pc)
    3bd4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3bd8:	702a           	moveq #42,d0
    3bda:	d1af 0084      	add.l d0,132(sp)
    for( int i3=0;i3<5;i3++) {
    3bde:	52af 006a      	addq.l #1,106(sp)
    3be2:	7204           	moveq #4,d1
    3be4:	b2af 006a      	cmp.l 106(sp),d1
    3be8:	6cca           	bge.s 3bb4 <TestZoom4PictureOn5Planes+0x258>
    }
    mask = mask ^ 0xffff;
    3bea:	466f 0082      	not.w 130(sp)
  for(int i2=0;i2<4;i2++) { 
    3bee:	52af 006e      	addq.l #1,110(sp)
    3bf2:	7003           	moveq #3,d0
    3bf4:	b0af 006e      	cmp.l 110(sp),d0
    3bf8:	6cb4           	bge.s 3bae <TestZoom4PictureOn5Planes+0x252>
  } 
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    3bfa:	2f6f 005a 0042 	move.l 90(sp),66(sp)
    3c00:	2f7c 0000 f460 	move.l #62560,62(sp)
    3c06:	003e 
    3c08:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    3c0e:	2c40           	movea.l d0,a6
    3c10:	226f 0042      	movea.l 66(sp),a1
    3c14:	202f 003e      	move.l 62(sp),d0
    3c18:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    3c1c:	2f6f 004a 003a 	move.l 74(sp),58(sp)
    3c22:	2f7c 0000 f460 	move.l #62560,54(sp)
    3c28:	0036 
    3c2a:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    3c30:	2c40           	movea.l d0,a6
    3c32:	226f 003a      	movea.l 58(sp),a1
    3c36:	202f 0036      	move.l 54(sp),d0
    3c3a:	4eae ff2e      	jsr -210(a6)
}
    3c3e:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3c42:	4fef 008c      	lea 140(sp),sp
    3c46:	4e75           	rts

00003c48 <TestZoom4Picture>:

void TestZoom4Picture() {
    3c48:	4fef fe30      	lea -464(sp),sp
    3c4c:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3c50:	2f7c 0000 30e0 	move.l #12512,106(sp)
    3c56:	006a 
    3c58:	7002           	moveq #2,d0
    3c5a:	2f40 0066      	move.l d0,102(sp)
    3c5e:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    3c64:	2c40           	movea.l d0,a6
    3c66:	202f 006a      	move.l 106(sp),d0
    3c6a:	222f 0066      	move.l 102(sp),d1
    3c6e:	4eae ff3a      	jsr -198(a6)
    3c72:	2f40 0062      	move.l d0,98(sp)
    3c76:	202f 0062      	move.l 98(sp),d0
    3c7a:	2f40 005e      	move.l d0,94(sp)
  if( source == 0) {
    3c7e:	6646           	bne.s 3cc6 <TestZoom4Picture+0x7e>
    Write(  Output(), 
    3c80:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    3c86:	2c40           	movea.l d0,a6
    3c88:	4eae ffc4      	jsr -60(a6)
    3c8c:	2f40 001e      	move.l d0,30(sp)
    3c90:	202f 001e      	move.l 30(sp),d0
    3c94:	2f40 001a      	move.l d0,26(sp)
    3c98:	2f7c 0000 83db 	move.l #33755,22(sp)
    3c9e:	0016 
    3ca0:	7239           	moveq #57,d1
    3ca2:	2f41 0012      	move.l d1,18(sp)
    3ca6:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    3cac:	2c40           	movea.l d0,a6
    3cae:	222f 001a      	move.l 26(sp),d1
    3cb2:	242f 0016      	move.l 22(sp),d2
    3cb6:	262f 0012      	move.l 18(sp),d3
    3cba:	4eae ffd0      	jsr -48(a6)
    3cbe:	2f40 000e      	move.l d0,14(sp)
    3cc2:	6000 2ddc      	bra.w 6aa0 <TestZoom4Picture+0x2e58>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3cc6:	2f7c 0000 30e0 	move.l #12512,90(sp)
    3ccc:	005a 
    3cce:	7002           	moveq #2,d0
    3cd0:	2f40 0056      	move.l d0,86(sp)
    3cd4:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    3cda:	2c40           	movea.l d0,a6
    3cdc:	202f 005a      	move.l 90(sp),d0
    3ce0:	222f 0056      	move.l 86(sp),d1
    3ce4:	4eae ff3a      	jsr -198(a6)
    3ce8:	2f40 0052      	move.l d0,82(sp)
    3cec:	202f 0052      	move.l 82(sp),d0
    3cf0:	2f40 004e      	move.l d0,78(sp)
  if( destination == 0) {
    3cf4:	6646           	bne.s 3d3c <TestZoom4Picture+0xf4>
    Write(  Output(), 
    3cf6:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    3cfc:	2c40           	movea.l d0,a6
    3cfe:	4eae ffc4      	jsr -60(a6)
    3d02:	2f40 0032      	move.l d0,50(sp)
    3d06:	202f 0032      	move.l 50(sp),d0
    3d0a:	2f40 002e      	move.l d0,46(sp)
    3d0e:	2f7c 0000 8415 	move.l #33813,42(sp)
    3d14:	002a 
    3d16:	723d           	moveq #61,d1
    3d18:	2f41 0026      	move.l d1,38(sp)
    3d1c:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    3d22:	2c40           	movea.l d0,a6
    3d24:	222f 002e      	move.l 46(sp),d1
    3d28:	242f 002a      	move.l 42(sp),d2
    3d2c:	262f 0026      	move.l 38(sp),d3
    3d30:	4eae ffd0      	jsr -48(a6)
    3d34:	2f40 0022      	move.l d0,34(sp)
    3d38:	6000 2d66      	bra.w 6aa0 <TestZoom4Picture+0x2e58>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3d3c:	2f6f 005e 01d8 	move.l 94(sp),472(sp)
  for(int i=0;i<128+8;i++) {
    3d42:	42af 01d4      	clr.l 468(sp)
    3d46:	6050           	bra.s 3d98 <TestZoom4Picture+0x150>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3d48:	42af 01d0      	clr.l 464(sp)
    3d4c:	6018           	bra.s 3d66 <TestZoom4Picture+0x11e>
      *tmp4source++ = 0x55555555;
    3d4e:	202f 01d8      	move.l 472(sp),d0
    3d52:	2200           	move.l d0,d1
    3d54:	5881           	addq.l #4,d1
    3d56:	2f41 01d8      	move.l d1,472(sp)
    3d5a:	2040           	movea.l d0,a0
    3d5c:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3d62:	52af 01d0      	addq.l #1,464(sp)
    3d66:	7009           	moveq #9,d0
    3d68:	b0af 01d0      	cmp.l 464(sp),d0
    3d6c:	6ce0           	bge.s 3d4e <TestZoom4Picture+0x106>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3d6e:	42af 01cc      	clr.l 460(sp)
    3d72:	6018           	bra.s 3d8c <TestZoom4Picture+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3d74:	202f 01d8      	move.l 472(sp),d0
    3d78:	2200           	move.l d0,d1
    3d7a:	5881           	addq.l #4,d1
    3d7c:	2f41 01d8      	move.l d1,472(sp)
    3d80:	2040           	movea.l d0,a0
    3d82:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3d88:	52af 01cc      	addq.l #1,460(sp)
    3d8c:	7009           	moveq #9,d0
    3d8e:	b0af 01cc      	cmp.l 460(sp),d0
    3d92:	6ce0           	bge.s 3d74 <TestZoom4Picture+0x12c>
  for(int i=0;i<128+8;i++) {
    3d94:	52af 01d4      	addq.l #1,468(sp)
    3d98:	0caf 0000 0087 	cmpi.l #135,468(sp)
    3d9e:	01d4 
    3da0:	6fa6           	ble.s 3d48 <TestZoom4Picture+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    3da2:	4878 0001      	pea 1 <_start+0x1>
    3da6:	42a7           	clr.l -(sp)
    3da8:	2f2f 0056      	move.l 86(sp),-(sp)
    3dac:	2f2f 006a      	move.l 106(sp),-(sp)
    3db0:	4eba dc46      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    3db4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3db8:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    3dbe:	2c40           	movea.l d0,a6
    3dc0:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3dc4:	222f 004e      	move.l 78(sp),d1
    3dc8:	5881           	addq.l #4,d1
    3dca:	2f41 01c8      	move.l d1,456(sp)
  UWORD *valsupposed = destlinezoom1;
    3dce:	2f7c 0000 ba2c 	move.l #47660,74(sp)
    3dd4:	004a 
  UWORD mask = 0xffff;
    3dd6:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<14;i++) {
    3ddc:	42af 01c2      	clr.l 450(sp)
    3de0:	6000 0084      	bra.w 3e66 <TestZoom4Picture+0x21e>
    for(int i2=0;i2<18;i2++) { 
    3de4:	42af 01be      	clr.l 446(sp)
    3de8:	603c           	bra.s 3e26 <TestZoom4Picture+0x1de>
      TestRow( valsupposed, valactual, mask, i2+i*19);
    3dea:	222f 01c2      	move.l 450(sp),d1
    3dee:	2001           	move.l d1,d0
    3df0:	e788           	lsl.l #3,d0
    3df2:	d081           	add.l d1,d0
    3df4:	d080           	add.l d0,d0
    3df6:	d081           	add.l d1,d0
    3df8:	2200           	move.l d0,d1
    3dfa:	d2af 01be      	add.l 446(sp),d1
    3dfe:	7000           	moveq #0,d0
    3e00:	302f 01c6      	move.w 454(sp),d0
    3e04:	2f01           	move.l d1,-(sp)
    3e06:	2f00           	move.l d0,-(sp)
    3e08:	2f2f 01d0      	move.l 464(sp),-(sp)
    3e0c:	2f2f 0056      	move.l 86(sp),-(sp)
    3e10:	4eba 2c98      	jsr 6aaa <TestRow>(pc)
    3e14:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3e18:	702a           	moveq #42,d0
    3e1a:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    3e1e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) { 
    3e22:	52af 01be      	addq.l #1,446(sp)
    3e26:	7211           	moveq #17,d1
    3e28:	b2af 01be      	cmp.l 446(sp),d1
    3e2c:	6cbc           	bge.s 3dea <TestZoom4Picture+0x1a2>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    3e2e:	222f 01c2      	move.l 450(sp),d1
    3e32:	2001           	move.l d1,d0
    3e34:	e788           	lsl.l #3,d0
    3e36:	d081           	add.l d1,d0
    3e38:	d080           	add.l d0,d0
    3e3a:	2040           	movea.l d0,a0
    3e3c:	d1c1           	adda.l d1,a0
    3e3e:	41e8 0012      	lea 18(a0),a0
    3e42:	7000           	moveq #0,d0
    3e44:	302f 01c6      	move.w 454(sp),d0
    3e48:	2f08           	move.l a0,-(sp)
    3e4a:	2f00           	move.l d0,-(sp)
    3e4c:	2f2f 01d0      	move.l 464(sp),-(sp)
    3e50:	2f2f 0056      	move.l 86(sp),-(sp)
    3e54:	4eba 2c54      	jsr 6aaa <TestRow>(pc)
    3e58:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3e5c:	702a           	moveq #42,d0
    3e5e:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<14;i++) {
    3e62:	52af 01c2      	addq.l #1,450(sp)
    3e66:	720d           	moveq #13,d1
    3e68:	b2af 01c2      	cmp.l 450(sp),d1
    3e6c:	6c00 ff76      	bge.w 3de4 <TestZoom4Picture+0x19c>
  }

  for(int i2=0;i2<4;i2++) { 
    3e70:	42af 01ba      	clr.l 442(sp)
    3e74:	6032           	bra.s 3ea8 <TestZoom4Picture+0x260>
    TestRow( valsupposed, valactual, mask, i2+265);
    3e76:	222f 01ba      	move.l 442(sp),d1
    3e7a:	0681 0000 0109 	addi.l #265,d1
    3e80:	7000           	moveq #0,d0
    3e82:	302f 01c6      	move.w 454(sp),d0
    3e86:	2f01           	move.l d1,-(sp)
    3e88:	2f00           	move.l d0,-(sp)
    3e8a:	2f2f 01d0      	move.l 464(sp),-(sp)
    3e8e:	2f2f 0056      	move.l 86(sp),-(sp)
    3e92:	4eba 2c16      	jsr 6aaa <TestRow>(pc)
    3e96:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3e9a:	702a           	moveq #42,d0
    3e9c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    3ea0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    3ea4:	52af 01ba      	addq.l #1,442(sp)
    3ea8:	7203           	moveq #3,d1
    3eaa:	b2af 01ba      	cmp.l 442(sp),d1
    3eae:	6cc6           	bge.s 3e76 <TestZoom4Picture+0x22e>
  }
  
  UWORD *tmp = source;
    3eb0:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    3eb6:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    3ebc:	2f6f 0046 004e 	move.l 70(sp),78(sp)
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    3ec2:	4878 0001      	pea 1 <_start+0x1>
    3ec6:	4878 0001      	pea 1 <_start+0x1>
    3eca:	2f2f 0056      	move.l 86(sp),-(sp)
    3ece:	2f2f 006a      	move.l 106(sp),-(sp)
    3ed2:	4eba db24      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    3ed6:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3eda:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    3ee0:	2c40           	movea.l d0,a6
    3ee2:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    3ee6:	202f 004e      	move.l 78(sp),d0
    3eea:	5880           	addq.l #4,d0
    3eec:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom2;
    3ef0:	2f7c 0000 ba58 	move.l #47704,74(sp)
    3ef6:	004a 
  mask = 0x0000;
    3ef8:	426f 01c6      	clr.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3efc:	42af 01b6      	clr.l 438(sp)
    3f00:	602a           	bra.s 3f2c <TestZoom4Picture+0x2e4>
    TestRow( valsupposed, valactual, mask, i2);
    3f02:	7000           	moveq #0,d0
    3f04:	302f 01c6      	move.w 454(sp),d0
    3f08:	2f2f 01b6      	move.l 438(sp),-(sp)
    3f0c:	2f00           	move.l d0,-(sp)
    3f0e:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f12:	2f2f 0056      	move.l 86(sp),-(sp)
    3f16:	4eba 2b92      	jsr 6aaa <TestRow>(pc)
    3f1a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f1e:	722a           	moveq #42,d1
    3f20:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    3f24:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3f28:	52af 01b6      	addq.l #1,438(sp)
    3f2c:	700a           	moveq #10,d0
    3f2e:	b0af 01b6      	cmp.l 438(sp),d0
    3f32:	6cce           	bge.s 3f02 <TestZoom4Picture+0x2ba>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    3f34:	4878 0008      	pea 8 <_start+0x8>
    3f38:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3f3e:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f42:	2f2f 0056      	move.l 86(sp),-(sp)
    3f46:	4eba 2b62      	jsr 6aaa <TestRow>(pc)
    3f4a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3f4e:	722a           	moveq #42,d1
    3f50:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 9);
    3f54:	4878 0009      	pea 9 <_start+0x9>
    3f58:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3f5e:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f62:	2f2f 0056      	move.l 86(sp),-(sp)
    3f66:	4eba 2b42      	jsr 6aaa <TestRow>(pc)
    3f6a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3f6e:	702a           	moveq #42,d0
    3f70:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 10);
    3f74:	4878 000a      	pea a <_start+0xa>
    3f78:	42a7           	clr.l -(sp)
    3f7a:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f7e:	2f2f 0056      	move.l 86(sp),-(sp)
    3f82:	4eba 2b26      	jsr 6aaa <TestRow>(pc)
    3f86:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3f8a:	722a           	moveq #42,d1
    3f8c:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 11);
    3f90:	4878 000b      	pea b <_start+0xb>
    3f94:	42a7           	clr.l -(sp)
    3f96:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f9a:	2f2f 0056      	move.l 86(sp),-(sp)
    3f9e:	4eba 2b0a      	jsr 6aaa <TestRow>(pc)
    3fa2:	4fef 0010      	lea 16(sp),sp

  valactual += ZMLINESIZE/2;
    3fa6:	702a           	moveq #42,d0
    3fa8:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<12;i++) {
    3fac:	42af 01b2      	clr.l 434(sp)
    3fb0:	6000 0118      	bra.w 40ca <TestZoom4Picture+0x482>
    for(int i2=0;i2<16;i2++) {  
    3fb4:	42af 01ae      	clr.l 430(sp)
    3fb8:	603c           	bra.s 3ff6 <TestZoom4Picture+0x3ae>
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    3fba:	222f 01b2      	move.l 434(sp),d1
    3fbe:	2001           	move.l d1,d0
    3fc0:	e988           	lsl.l #4,d0
    3fc2:	d081           	add.l d1,d0
    3fc4:	2040           	movea.l d0,a0
    3fc6:	d1ef 01ae      	adda.l 430(sp),a0
    3fca:	41e8 000b      	lea 11(a0),a0
    3fce:	7000           	moveq #0,d0
    3fd0:	302f 01c6      	move.w 454(sp),d0
    3fd4:	2f08           	move.l a0,-(sp)
    3fd6:	2f00           	move.l d0,-(sp)
    3fd8:	2f2f 01d0      	move.l 464(sp),-(sp)
    3fdc:	2f2f 0056      	move.l 86(sp),-(sp)
    3fe0:	4eba 2ac8      	jsr 6aaa <TestRow>(pc)
    3fe4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3fe8:	722a           	moveq #42,d1
    3fea:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    3fee:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {  
    3ff2:	52af 01ae      	addq.l #1,430(sp)
    3ff6:	700f           	moveq #15,d0
    3ff8:	b0af 01ae      	cmp.l 430(sp),d0
    3ffc:	6cbc           	bge.s 3fba <TestZoom4Picture+0x372>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    3ffe:	222f 01b2      	move.l 434(sp),d1
    4002:	2001           	move.l d1,d0
    4004:	e988           	lsl.l #4,d0
    4006:	2040           	movea.l d0,a0
    4008:	d1c1           	adda.l d1,a0
    400a:	41e8 0018      	lea 24(a0),a0
    400e:	7000           	moveq #0,d0
    4010:	302f 01c6      	move.w 454(sp),d0
    4014:	2f08           	move.l a0,-(sp)
    4016:	2f00           	move.l d0,-(sp)
    4018:	2f2f 01d0      	move.l 464(sp),-(sp)
    401c:	2f2f 0056      	move.l 86(sp),-(sp)
    4020:	4eba 2a88      	jsr 6aaa <TestRow>(pc)
    4024:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4028:	722a           	moveq #42,d1
    402a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    402e:	222f 01b2      	move.l 434(sp),d1
    4032:	2001           	move.l d1,d0
    4034:	e988           	lsl.l #4,d0
    4036:	2040           	movea.l d0,a0
    4038:	d1c1           	adda.l d1,a0
    403a:	41e8 0019      	lea 25(a0),a0
    403e:	7000           	moveq #0,d0
    4040:	302f 01c6      	move.w 454(sp),d0
    4044:	2f08           	move.l a0,-(sp)
    4046:	2f00           	move.l d0,-(sp)
    4048:	2f2f 01d0      	move.l 464(sp),-(sp)
    404c:	2f2f 0056      	move.l 86(sp),-(sp)
    4050:	4eba 2a58      	jsr 6aaa <TestRow>(pc)
    4054:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4058:	702a           	moveq #42,d0
    405a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    405e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    4062:	222f 01b2      	move.l 434(sp),d1
    4066:	2001           	move.l d1,d0
    4068:	e988           	lsl.l #4,d0
    406a:	2040           	movea.l d0,a0
    406c:	d1c1           	adda.l d1,a0
    406e:	41e8 001a      	lea 26(a0),a0
    4072:	7000           	moveq #0,d0
    4074:	302f 01c6      	move.w 454(sp),d0
    4078:	2f08           	move.l a0,-(sp)
    407a:	2f00           	move.l d0,-(sp)
    407c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4080:	2f2f 0056      	move.l 86(sp),-(sp)
    4084:	4eba 2a24      	jsr 6aaa <TestRow>(pc)
    4088:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    408c:	722a           	moveq #42,d1
    408e:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    4092:	222f 01b2      	move.l 434(sp),d1
    4096:	2001           	move.l d1,d0
    4098:	e988           	lsl.l #4,d0
    409a:	2040           	movea.l d0,a0
    409c:	d1c1           	adda.l d1,a0
    409e:	41e8 001b      	lea 27(a0),a0
    40a2:	7000           	moveq #0,d0
    40a4:	302f 01c6      	move.w 454(sp),d0
    40a8:	2f08           	move.l a0,-(sp)
    40aa:	2f00           	move.l d0,-(sp)
    40ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    40b0:	2f2f 0056      	move.l 86(sp),-(sp)
    40b4:	4eba 29f4      	jsr 6aaa <TestRow>(pc)
    40b8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40bc:	702a           	moveq #42,d0
    40be:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    40c2:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    40c6:	52af 01b2      	addq.l #1,434(sp)
    40ca:	720b           	moveq #11,d1
    40cc:	b2af 01b2      	cmp.l 434(sp),d1
    40d0:	6c00 fee2      	bge.w 3fb4 <TestZoom4Picture+0x36c>
    
  }

  for(int i2=0;i2<15;i2++) { 
    40d4:	42af 01aa      	clr.l 426(sp)
    40d8:	602a           	bra.s 4104 <TestZoom4Picture+0x4bc>
    TestRow( valsupposed, valactual, mask, i2);
    40da:	7000           	moveq #0,d0
    40dc:	302f 01c6      	move.w 454(sp),d0
    40e0:	2f2f 01aa      	move.l 426(sp),-(sp)
    40e4:	2f00           	move.l d0,-(sp)
    40e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    40ea:	2f2f 0056      	move.l 86(sp),-(sp)
    40ee:	4eba 29ba      	jsr 6aaa <TestRow>(pc)
    40f2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40f6:	702a           	moveq #42,d0
    40f8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    40fc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<15;i2++) { 
    4100:	52af 01aa      	addq.l #1,426(sp)
    4104:	720e           	moveq #14,d1
    4106:	b2af 01aa      	cmp.l 426(sp),d1
    410a:	6cce           	bge.s 40da <TestZoom4Picture+0x492>
  }

  tmp = source;
    410c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4112:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4118:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    411e:	4878 0001      	pea 1 <_start+0x1>
    4122:	4878 0002      	pea 2 <_start+0x2>
    4126:	2f2f 0056      	move.l 86(sp),-(sp)
    412a:	2f2f 006a      	move.l 106(sp),-(sp)
    412e:	4eba d8c8      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    4132:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4136:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    413c:	2c40           	movea.l d0,a6
    413e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4142:	202f 004e      	move.l 78(sp),d0
    4146:	5880           	addq.l #4,d0
    4148:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom3;
    414c:	2f7c 0000 ba84 	move.l #47748,74(sp)
    4152:	004a 
  mask = 0xffff;
    4154:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<4;i2++) { 
    415a:	42af 01a6      	clr.l 422(sp)
    415e:	602a           	bra.s 418a <TestZoom4Picture+0x542>
    TestRow( valsupposed, valactual, mask, i2);
    4160:	7000           	moveq #0,d0
    4162:	302f 01c6      	move.w 454(sp),d0
    4166:	2f2f 01a6      	move.l 422(sp),-(sp)
    416a:	2f00           	move.l d0,-(sp)
    416c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4170:	2f2f 0056      	move.l 86(sp),-(sp)
    4174:	4eba 2934      	jsr 6aaa <TestRow>(pc)
    4178:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    417c:	722a           	moveq #42,d1
    417e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4182:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    4186:	52af 01a6      	addq.l #1,422(sp)
    418a:	7003           	moveq #3,d0
    418c:	b0af 01a6      	cmp.l 422(sp),d0
    4190:	6cce           	bge.s 4160 <TestZoom4Picture+0x518>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    4192:	4878 0004      	pea 4 <_start+0x4>
    4196:	2f3c 0000 ffff 	move.l #65535,-(sp)
    419c:	2f2f 01d0      	move.l 464(sp),-(sp)
    41a0:	2f2f 0056      	move.l 86(sp),-(sp)
    41a4:	4eba 2904      	jsr 6aaa <TestRow>(pc)
    41a8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    41ac:	722a           	moveq #42,d1
    41ae:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    41b2:	4878 0005      	pea 5 <_start+0x5>
    41b6:	2f3c 0000 ffff 	move.l #65535,-(sp)
    41bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    41c0:	2f2f 0056      	move.l 86(sp),-(sp)
    41c4:	4eba 28e4      	jsr 6aaa <TestRow>(pc)
    41c8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    41cc:	702a           	moveq #42,d0
    41ce:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    41d2:	4878 0006      	pea 6 <_start+0x6>
    41d6:	42a7           	clr.l -(sp)
    41d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    41dc:	2f2f 0056      	move.l 86(sp),-(sp)
    41e0:	4eba 28c8      	jsr 6aaa <TestRow>(pc)
    41e4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    41e8:	722a           	moveq #42,d1
    41ea:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    41ee:	4878 0007      	pea 7 <_start+0x7>
    41f2:	42a7           	clr.l -(sp)
    41f4:	2f2f 01d0      	move.l 464(sp),-(sp)
    41f8:	2f2f 0056      	move.l 86(sp),-(sp)
    41fc:	4eba 28ac      	jsr 6aaa <TestRow>(pc)
    4200:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4204:	702a           	moveq #42,d0
    4206:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    420a:	4878 0008      	pea 8 <_start+0x8>
    420e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4214:	2f2f 01d0      	move.l 464(sp),-(sp)
    4218:	2f2f 0056      	move.l 86(sp),-(sp)
    421c:	4eba 288c      	jsr 6aaa <TestRow>(pc)
    4220:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4224:	722a           	moveq #42,d1
    4226:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    422a:	4878 0009      	pea 9 <_start+0x9>
    422e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4234:	2f2f 01d0      	move.l 464(sp),-(sp)
    4238:	2f2f 0056      	move.l 86(sp),-(sp)
    423c:	4eba 286c      	jsr 6aaa <TestRow>(pc)
    4240:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4244:	702a           	moveq #42,d0
    4246:	d1af 01c8      	add.l d0,456(sp)

  mask = 0x0000;
    424a:	426f 01c6      	clr.w 454(sp)
  for(int i=0;i<12;i++) {
    424e:	42af 01a2      	clr.l 418(sp)
    4252:	6000 01a6      	bra.w 43fa <TestZoom4Picture+0x7b2>
    for(int i2=0;i2<15;i2++) {  
    4256:	42af 019e      	clr.l 414(sp)
    425a:	6042           	bra.s 429e <TestZoom4Picture+0x656>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    425c:	222f 01a2      	move.l 418(sp),d1
    4260:	2001           	move.l d1,d0
    4262:	d080           	add.l d0,d0
    4264:	d081           	add.l d1,d0
    4266:	2200           	move.l d0,d1
    4268:	e789           	lsl.l #3,d1
    426a:	9280           	sub.l d0,d1
    426c:	2041           	movea.l d1,a0
    426e:	d1ef 019e      	adda.l 414(sp),a0
    4272:	41e8 0009      	lea 9(a0),a0
    4276:	7000           	moveq #0,d0
    4278:	302f 01c6      	move.w 454(sp),d0
    427c:	2f08           	move.l a0,-(sp)
    427e:	2f00           	move.l d0,-(sp)
    4280:	2f2f 01d0      	move.l 464(sp),-(sp)
    4284:	2f2f 0056      	move.l 86(sp),-(sp)
    4288:	4eba 2820      	jsr 6aaa <TestRow>(pc)
    428c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4290:	722a           	moveq #42,d1
    4292:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4296:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {  
    429a:	52af 019e      	addq.l #1,414(sp)
    429e:	700e           	moveq #14,d0
    42a0:	b0af 019e      	cmp.l 414(sp),d0
    42a4:	6cb6           	bge.s 425c <TestZoom4Picture+0x614>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    42a6:	222f 01a2      	move.l 418(sp),d1
    42aa:	2001           	move.l d1,d0
    42ac:	d080           	add.l d0,d0
    42ae:	d081           	add.l d1,d0
    42b0:	2200           	move.l d0,d1
    42b2:	e789           	lsl.l #3,d1
    42b4:	2041           	movea.l d1,a0
    42b6:	91c0           	suba.l d0,a0
    42b8:	41e8 0018      	lea 24(a0),a0
    42bc:	7000           	moveq #0,d0
    42be:	302f 01c6      	move.w 454(sp),d0
    42c2:	2f08           	move.l a0,-(sp)
    42c4:	2f00           	move.l d0,-(sp)
    42c6:	2f2f 01d0      	move.l 464(sp),-(sp)
    42ca:	2f2f 0056      	move.l 86(sp),-(sp)
    42ce:	4eba 27da      	jsr 6aaa <TestRow>(pc)
    42d2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    42d6:	722a           	moveq #42,d1
    42d8:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    42dc:	222f 01a2      	move.l 418(sp),d1
    42e0:	2001           	move.l d1,d0
    42e2:	d080           	add.l d0,d0
    42e4:	d081           	add.l d1,d0
    42e6:	2200           	move.l d0,d1
    42e8:	e789           	lsl.l #3,d1
    42ea:	2041           	movea.l d1,a0
    42ec:	91c0           	suba.l d0,a0
    42ee:	41e8 0019      	lea 25(a0),a0
    42f2:	7000           	moveq #0,d0
    42f4:	302f 01c6      	move.w 454(sp),d0
    42f8:	2f08           	move.l a0,-(sp)
    42fa:	2f00           	move.l d0,-(sp)
    42fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4300:	2f2f 0056      	move.l 86(sp),-(sp)
    4304:	4eba 27a4      	jsr 6aaa <TestRow>(pc)
    4308:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    430c:	702a           	moveq #42,d0
    430e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4312:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    4316:	222f 01a2      	move.l 418(sp),d1
    431a:	2001           	move.l d1,d0
    431c:	d080           	add.l d0,d0
    431e:	d081           	add.l d1,d0
    4320:	2200           	move.l d0,d1
    4322:	e789           	lsl.l #3,d1
    4324:	2041           	movea.l d1,a0
    4326:	91c0           	suba.l d0,a0
    4328:	41e8 001a      	lea 26(a0),a0
    432c:	7000           	moveq #0,d0
    432e:	302f 01c6      	move.w 454(sp),d0
    4332:	2f08           	move.l a0,-(sp)
    4334:	2f00           	move.l d0,-(sp)
    4336:	2f2f 01d0      	move.l 464(sp),-(sp)
    433a:	2f2f 0056      	move.l 86(sp),-(sp)
    433e:	4eba 276a      	jsr 6aaa <TestRow>(pc)
    4342:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4346:	722a           	moveq #42,d1
    4348:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    434c:	222f 01a2      	move.l 418(sp),d1
    4350:	2001           	move.l d1,d0
    4352:	d080           	add.l d0,d0
    4354:	d081           	add.l d1,d0
    4356:	2200           	move.l d0,d1
    4358:	e789           	lsl.l #3,d1
    435a:	2041           	movea.l d1,a0
    435c:	91c0           	suba.l d0,a0
    435e:	41e8 001b      	lea 27(a0),a0
    4362:	7000           	moveq #0,d0
    4364:	302f 01c6      	move.w 454(sp),d0
    4368:	2f08           	move.l a0,-(sp)
    436a:	2f00           	move.l d0,-(sp)
    436c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4370:	2f2f 0056      	move.l 86(sp),-(sp)
    4374:	4eba 2734      	jsr 6aaa <TestRow>(pc)
    4378:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    437c:	702a           	moveq #42,d0
    437e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4382:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4386:	222f 01a2      	move.l 418(sp),d1
    438a:	2001           	move.l d1,d0
    438c:	d080           	add.l d0,d0
    438e:	d081           	add.l d1,d0
    4390:	2200           	move.l d0,d1
    4392:	e789           	lsl.l #3,d1
    4394:	2041           	movea.l d1,a0
    4396:	91c0           	suba.l d0,a0
    4398:	41e8 001c      	lea 28(a0),a0
    439c:	7000           	moveq #0,d0
    439e:	302f 01c6      	move.w 454(sp),d0
    43a2:	2f08           	move.l a0,-(sp)
    43a4:	2f00           	move.l d0,-(sp)
    43a6:	2f2f 01d0      	move.l 464(sp),-(sp)
    43aa:	2f2f 0056      	move.l 86(sp),-(sp)
    43ae:	4eba 26fa      	jsr 6aaa <TestRow>(pc)
    43b2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43b6:	722a           	moveq #42,d1
    43b8:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    43bc:	222f 01a2      	move.l 418(sp),d1
    43c0:	2001           	move.l d1,d0
    43c2:	d080           	add.l d0,d0
    43c4:	d081           	add.l d1,d0
    43c6:	2200           	move.l d0,d1
    43c8:	e789           	lsl.l #3,d1
    43ca:	2041           	movea.l d1,a0
    43cc:	91c0           	suba.l d0,a0
    43ce:	41e8 001d      	lea 29(a0),a0
    43d2:	7000           	moveq #0,d0
    43d4:	302f 01c6      	move.w 454(sp),d0
    43d8:	2f08           	move.l a0,-(sp)
    43da:	2f00           	move.l d0,-(sp)
    43dc:	2f2f 01d0      	move.l 464(sp),-(sp)
    43e0:	2f2f 0056      	move.l 86(sp),-(sp)
    43e4:	4eba 26c4      	jsr 6aaa <TestRow>(pc)
    43e8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43ec:	702a           	moveq #42,d0
    43ee:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    43f2:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    43f6:	52af 01a2      	addq.l #1,418(sp)
    43fa:	720b           	moveq #11,d1
    43fc:	b2af 01a2      	cmp.l 418(sp),d1
    4400:	6c00 fe54      	bge.w 4256 <TestZoom4Picture+0x60e>
  }

  for(int i2=0;i2<8;i2++) {  
    4404:	42af 019a      	clr.l 410(sp)
    4408:	6032           	bra.s 443c <TestZoom4Picture+0x7f4>
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    440a:	222f 019a      	move.l 410(sp),d1
    440e:	0681 0000 0105 	addi.l #261,d1
    4414:	7000           	moveq #0,d0
    4416:	302f 01c6      	move.w 454(sp),d0
    441a:	2f01           	move.l d1,-(sp)
    441c:	2f00           	move.l d0,-(sp)
    441e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4422:	2f2f 0056      	move.l 86(sp),-(sp)
    4426:	4eba 2682      	jsr 6aaa <TestRow>(pc)
    442a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    442e:	702a           	moveq #42,d0
    4430:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4434:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    4438:	52af 019a      	addq.l #1,410(sp)
    443c:	7207           	moveq #7,d1
    443e:	b2af 019a      	cmp.l 410(sp),d1
    4442:	6cc6           	bge.s 440a <TestZoom4Picture+0x7c2>
  }

  tmp = source;
    4444:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    444a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4450:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    4456:	4878 0001      	pea 1 <_start+0x1>
    445a:	4878 0003      	pea 3 <_start+0x3>
    445e:	2f2f 0056      	move.l 86(sp),-(sp)
    4462:	2f2f 006a      	move.l 106(sp),-(sp)
    4466:	4eba d590      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    446a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    446e:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    4474:	2c40           	movea.l d0,a6
    4476:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    447a:	202f 004e      	move.l 78(sp),d0
    447e:	5880           	addq.l #4,d0
    4480:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom4;
    4484:	2f7c 0000 bab0 	move.l #47792,74(sp)
    448a:	004a 
  mask = 0x0000;
    448c:	426f 01c6      	clr.w 454(sp)
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    4490:	4878 0007      	pea 7 <_start+0x7>
    4494:	42a7           	clr.l -(sp)
    4496:	2f2f 01d0      	move.l 464(sp),-(sp)
    449a:	2f2f 0056      	move.l 86(sp),-(sp)
    449e:	4eba 260a      	jsr 6aaa <TestRow>(pc)
    44a2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44a6:	722a           	moveq #42,d1
    44a8:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    44ac:	4878 0008      	pea 8 <_start+0x8>
    44b0:	2f3c 0000 ffff 	move.l #65535,-(sp)
    44b6:	2f2f 01d0      	move.l 464(sp),-(sp)
    44ba:	2f2f 0056      	move.l 86(sp),-(sp)
    44be:	4eba 25ea      	jsr 6aaa <TestRow>(pc)
    44c2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44c6:	702a           	moveq #42,d0
    44c8:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    44cc:	4878 0009      	pea 9 <_start+0x9>
    44d0:	2f3c 0000 ffff 	move.l #65535,-(sp)
    44d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    44da:	2f2f 0056      	move.l 86(sp),-(sp)
    44de:	4eba 25ca      	jsr 6aaa <TestRow>(pc)
    44e2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44e6:	722a           	moveq #42,d1
    44e8:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    44ec:	4878 0008      	pea 8 <_start+0x8>
    44f0:	42a7           	clr.l -(sp)
    44f2:	2f2f 01d0      	move.l 464(sp),-(sp)
    44f6:	2f2f 0056      	move.l 86(sp),-(sp)
    44fa:	4eba 25ae      	jsr 6aaa <TestRow>(pc)
    44fe:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4502:	702a           	moveq #42,d0
    4504:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    4508:	4878 0009      	pea 9 <_start+0x9>
    450c:	42a7           	clr.l -(sp)
    450e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4512:	2f2f 0056      	move.l 86(sp),-(sp)
    4516:	4eba 2592      	jsr 6aaa <TestRow>(pc)
    451a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    451e:	722a           	moveq #42,d1
    4520:	d3af 01c8      	add.l d1,456(sp)

  mask = 0xffff;
    4524:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<12;i++) {
    452a:	42af 0196      	clr.l 406(sp)
    452e:	6000 0216      	bra.w 4746 <TestZoom4Picture+0xafe>
    for(int i2=0;i2<14;i2++) {  
    4532:	42af 0192      	clr.l 402(sp)
    4536:	6042           	bra.s 457a <TestZoom4Picture+0x932>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    4538:	222f 0196      	move.l 406(sp),d1
    453c:	2001           	move.l d1,d0
    453e:	d080           	add.l d0,d0
    4540:	d081           	add.l d1,d0
    4542:	2200           	move.l d0,d1
    4544:	e789           	lsl.l #3,d1
    4546:	9280           	sub.l d0,d1
    4548:	2041           	movea.l d1,a0
    454a:	d1ef 0192      	adda.l 402(sp),a0
    454e:	41e8 0009      	lea 9(a0),a0
    4552:	7000           	moveq #0,d0
    4554:	302f 01c6      	move.w 454(sp),d0
    4558:	2f08           	move.l a0,-(sp)
    455a:	2f00           	move.l d0,-(sp)
    455c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4560:	2f2f 0056      	move.l 86(sp),-(sp)
    4564:	4eba 2544      	jsr 6aaa <TestRow>(pc)
    4568:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    456c:	702a           	moveq #42,d0
    456e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4572:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {  
    4576:	52af 0192      	addq.l #1,402(sp)
    457a:	720d           	moveq #13,d1
    457c:	b2af 0192      	cmp.l 402(sp),d1
    4580:	6cb6           	bge.s 4538 <TestZoom4Picture+0x8f0>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    4582:	222f 0196      	move.l 406(sp),d1
    4586:	2001           	move.l d1,d0
    4588:	d080           	add.l d0,d0
    458a:	d081           	add.l d1,d0
    458c:	2200           	move.l d0,d1
    458e:	e789           	lsl.l #3,d1
    4590:	2041           	movea.l d1,a0
    4592:	91c0           	suba.l d0,a0
    4594:	41e8 0018      	lea 24(a0),a0
    4598:	7000           	moveq #0,d0
    459a:	302f 01c6      	move.w 454(sp),d0
    459e:	2f08           	move.l a0,-(sp)
    45a0:	2f00           	move.l d0,-(sp)
    45a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    45a6:	2f2f 0056      	move.l 86(sp),-(sp)
    45aa:	4eba 24fe      	jsr 6aaa <TestRow>(pc)
    45ae:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    45b2:	702a           	moveq #42,d0
    45b4:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    45b8:	222f 0196      	move.l 406(sp),d1
    45bc:	2001           	move.l d1,d0
    45be:	d080           	add.l d0,d0
    45c0:	d081           	add.l d1,d0
    45c2:	2200           	move.l d0,d1
    45c4:	e789           	lsl.l #3,d1
    45c6:	2041           	movea.l d1,a0
    45c8:	91c0           	suba.l d0,a0
    45ca:	41e8 0019      	lea 25(a0),a0
    45ce:	7000           	moveq #0,d0
    45d0:	302f 01c6      	move.w 454(sp),d0
    45d4:	2f08           	move.l a0,-(sp)
    45d6:	2f00           	move.l d0,-(sp)
    45d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    45dc:	2f2f 0056      	move.l 86(sp),-(sp)
    45e0:	4eba 24c8      	jsr 6aaa <TestRow>(pc)
    45e4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    45e8:	722a           	moveq #42,d1
    45ea:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    45ee:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    45f2:	222f 0196      	move.l 406(sp),d1
    45f6:	2001           	move.l d1,d0
    45f8:	d080           	add.l d0,d0
    45fa:	d081           	add.l d1,d0
    45fc:	2200           	move.l d0,d1
    45fe:	e789           	lsl.l #3,d1
    4600:	2041           	movea.l d1,a0
    4602:	91c0           	suba.l d0,a0
    4604:	41e8 001a      	lea 26(a0),a0
    4608:	7000           	moveq #0,d0
    460a:	302f 01c6      	move.w 454(sp),d0
    460e:	2f08           	move.l a0,-(sp)
    4610:	2f00           	move.l d0,-(sp)
    4612:	2f2f 01d0      	move.l 464(sp),-(sp)
    4616:	2f2f 0056      	move.l 86(sp),-(sp)
    461a:	4eba 248e      	jsr 6aaa <TestRow>(pc)
    461e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4622:	702a           	moveq #42,d0
    4624:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    4628:	222f 0196      	move.l 406(sp),d1
    462c:	2001           	move.l d1,d0
    462e:	d080           	add.l d0,d0
    4630:	d081           	add.l d1,d0
    4632:	2200           	move.l d0,d1
    4634:	e789           	lsl.l #3,d1
    4636:	2041           	movea.l d1,a0
    4638:	91c0           	suba.l d0,a0
    463a:	41e8 001b      	lea 27(a0),a0
    463e:	7000           	moveq #0,d0
    4640:	302f 01c6      	move.w 454(sp),d0
    4644:	2f08           	move.l a0,-(sp)
    4646:	2f00           	move.l d0,-(sp)
    4648:	2f2f 01d0      	move.l 464(sp),-(sp)
    464c:	2f2f 0056      	move.l 86(sp),-(sp)
    4650:	4eba 2458      	jsr 6aaa <TestRow>(pc)
    4654:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4658:	722a           	moveq #42,d1
    465a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    465e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4662:	222f 0196      	move.l 406(sp),d1
    4666:	2001           	move.l d1,d0
    4668:	d080           	add.l d0,d0
    466a:	d081           	add.l d1,d0
    466c:	2200           	move.l d0,d1
    466e:	e789           	lsl.l #3,d1
    4670:	2041           	movea.l d1,a0
    4672:	91c0           	suba.l d0,a0
    4674:	41e8 001c      	lea 28(a0),a0
    4678:	7000           	moveq #0,d0
    467a:	302f 01c6      	move.w 454(sp),d0
    467e:	2f08           	move.l a0,-(sp)
    4680:	2f00           	move.l d0,-(sp)
    4682:	2f2f 01d0      	move.l 464(sp),-(sp)
    4686:	2f2f 0056      	move.l 86(sp),-(sp)
    468a:	4eba 241e      	jsr 6aaa <TestRow>(pc)
    468e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4692:	702a           	moveq #42,d0
    4694:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4698:	222f 0196      	move.l 406(sp),d1
    469c:	2001           	move.l d1,d0
    469e:	d080           	add.l d0,d0
    46a0:	d081           	add.l d1,d0
    46a2:	2200           	move.l d0,d1
    46a4:	e789           	lsl.l #3,d1
    46a6:	2041           	movea.l d1,a0
    46a8:	91c0           	suba.l d0,a0
    46aa:	41e8 001d      	lea 29(a0),a0
    46ae:	7000           	moveq #0,d0
    46b0:	302f 01c6      	move.w 454(sp),d0
    46b4:	2f08           	move.l a0,-(sp)
    46b6:	2f00           	move.l d0,-(sp)
    46b8:	2f2f 01d0      	move.l 464(sp),-(sp)
    46bc:	2f2f 0056      	move.l 86(sp),-(sp)
    46c0:	4eba 23e8      	jsr 6aaa <TestRow>(pc)
    46c4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46c8:	722a           	moveq #42,d1
    46ca:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    46ce:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    46d2:	222f 0196      	move.l 406(sp),d1
    46d6:	2001           	move.l d1,d0
    46d8:	d080           	add.l d0,d0
    46da:	d081           	add.l d1,d0
    46dc:	2200           	move.l d0,d1
    46de:	e789           	lsl.l #3,d1
    46e0:	2041           	movea.l d1,a0
    46e2:	91c0           	suba.l d0,a0
    46e4:	41e8 001c      	lea 28(a0),a0
    46e8:	7000           	moveq #0,d0
    46ea:	302f 01c6      	move.w 454(sp),d0
    46ee:	2f08           	move.l a0,-(sp)
    46f0:	2f00           	move.l d0,-(sp)
    46f2:	2f2f 01d0      	move.l 464(sp),-(sp)
    46f6:	2f2f 0056      	move.l 86(sp),-(sp)
    46fa:	4eba 23ae      	jsr 6aaa <TestRow>(pc)
    46fe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4702:	702a           	moveq #42,d0
    4704:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4708:	222f 0196      	move.l 406(sp),d1
    470c:	2001           	move.l d1,d0
    470e:	d080           	add.l d0,d0
    4710:	d081           	add.l d1,d0
    4712:	2200           	move.l d0,d1
    4714:	e789           	lsl.l #3,d1
    4716:	2041           	movea.l d1,a0
    4718:	91c0           	suba.l d0,a0
    471a:	41e8 001d      	lea 29(a0),a0
    471e:	7000           	moveq #0,d0
    4720:	302f 01c6      	move.w 454(sp),d0
    4724:	2f08           	move.l a0,-(sp)
    4726:	2f00           	move.l d0,-(sp)
    4728:	2f2f 01d0      	move.l 464(sp),-(sp)
    472c:	2f2f 0056      	move.l 86(sp),-(sp)
    4730:	4eba 2378      	jsr 6aaa <TestRow>(pc)
    4734:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4738:	722a           	moveq #42,d1
    473a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    473e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    4742:	52af 0196      	addq.l #1,406(sp)
    4746:	700b           	moveq #11,d0
    4748:	b0af 0196      	cmp.l 406(sp),d0
    474c:	6c00 fde4      	bge.w 4532 <TestZoom4Picture+0x8ea>
  }

  TestRow( valsupposed, valactual, mask, 269);
    4750:	7000           	moveq #0,d0
    4752:	302f 01c6      	move.w 454(sp),d0
    4756:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    475a:	2f00           	move.l d0,-(sp)
    475c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4760:	2f2f 0056      	move.l 86(sp),-(sp)
    4764:	4eba 2344      	jsr 6aaa <TestRow>(pc)
    4768:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    476c:	722a           	moveq #42,d1
    476e:	d3af 01c8      	add.l d1,456(sp)
  
  tmp = source;
    4772:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4778:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    477e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    4784:	4878 0001      	pea 1 <_start+0x1>
    4788:	4878 0004      	pea 4 <_start+0x4>
    478c:	2f2f 0056      	move.l 86(sp),-(sp)
    4790:	2f2f 006a      	move.l 106(sp),-(sp)
    4794:	4eba d262      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    4798:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    479c:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    47a2:	2c40           	movea.l d0,a6
    47a4:	4eae ff1c      	jsr -228(a6)

  valactual = destination+2; 
    47a8:	202f 004e      	move.l 78(sp),d0
    47ac:	5880           	addq.l #4,d0
    47ae:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom5;
    47b2:	2f7c 0000 badc 	move.l #47836,74(sp)
    47b8:	004a 
  mask = 0x0000;
    47ba:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<13;i2++) {  
    47be:	42af 018e      	clr.l 398(sp)
    47c2:	602a           	bra.s 47ee <TestZoom4Picture+0xba6>
    TestRow( valsupposed, valactual, mask, i2);
    47c4:	7000           	moveq #0,d0
    47c6:	302f 01c6      	move.w 454(sp),d0
    47ca:	2f2f 018e      	move.l 398(sp),-(sp)
    47ce:	2f00           	move.l d0,-(sp)
    47d0:	2f2f 01d0      	move.l 464(sp),-(sp)
    47d4:	2f2f 0056      	move.l 86(sp),-(sp)
    47d8:	4eba 22d0      	jsr 6aaa <TestRow>(pc)
    47dc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    47e0:	722a           	moveq #42,d1
    47e2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    47e6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    47ea:	52af 018e      	addq.l #1,398(sp)
    47ee:	700c           	moveq #12,d0
    47f0:	b0af 018e      	cmp.l 398(sp),d0
    47f4:	6cce           	bge.s 47c4 <TestZoom4Picture+0xb7c>
  }

  TestRow( valsupposed, valactual, mask, 12);   
    47f6:	7000           	moveq #0,d0
    47f8:	302f 01c6      	move.w 454(sp),d0
    47fc:	4878 000c      	pea c <_start+0xc>
    4800:	2f00           	move.l d0,-(sp)
    4802:	2f2f 01d0      	move.l 464(sp),-(sp)
    4806:	2f2f 0056      	move.l 86(sp),-(sp)
    480a:	4eba 229e      	jsr 6aaa <TestRow>(pc)
    480e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4812:	722a           	moveq #42,d1
    4814:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 13);
    4818:	7000           	moveq #0,d0
    481a:	302f 01c6      	move.w 454(sp),d0
    481e:	4878 000d      	pea d <_start+0xd>
    4822:	2f00           	move.l d0,-(sp)
    4824:	2f2f 01d0      	move.l 464(sp),-(sp)
    4828:	2f2f 0056      	move.l 86(sp),-(sp)
    482c:	4eba 227c      	jsr 6aaa <TestRow>(pc)
    4830:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4834:	702a           	moveq #42,d0
    4836:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    483a:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 14);
    483e:	7000           	moveq #0,d0
    4840:	302f 01c6      	move.w 454(sp),d0
    4844:	4878 000e      	pea e <_start+0xe>
    4848:	2f00           	move.l d0,-(sp)
    484a:	2f2f 01d0      	move.l 464(sp),-(sp)
    484e:	2f2f 0056      	move.l 86(sp),-(sp)
    4852:	4eba 2256      	jsr 6aaa <TestRow>(pc)
    4856:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    485a:	722a           	moveq #42,d1
    485c:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 15);
    4860:	7000           	moveq #0,d0
    4862:	302f 01c6      	move.w 454(sp),d0
    4866:	4878 000f      	pea f <_start+0xf>
    486a:	2f00           	move.l d0,-(sp)
    486c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4870:	2f2f 0056      	move.l 86(sp),-(sp)
    4874:	4eba 2234      	jsr 6aaa <TestRow>(pc)
    4878:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    487c:	702a           	moveq #42,d0
    487e:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4882:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 16);
    4886:	7000           	moveq #0,d0
    4888:	302f 01c6      	move.w 454(sp),d0
    488c:	4878 0010      	pea 10 <_start+0x10>
    4890:	2f00           	move.l d0,-(sp)
    4892:	2f2f 01d0      	move.l 464(sp),-(sp)
    4896:	2f2f 0056      	move.l 86(sp),-(sp)
    489a:	4eba 220e      	jsr 6aaa <TestRow>(pc)
    489e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48a2:	722a           	moveq #42,d1
    48a4:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 17);
    48a8:	7000           	moveq #0,d0
    48aa:	302f 01c6      	move.w 454(sp),d0
    48ae:	4878 0011      	pea 11 <_start+0x11>
    48b2:	2f00           	move.l d0,-(sp)
    48b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    48b8:	2f2f 0056      	move.l 86(sp),-(sp)
    48bc:	4eba 21ec      	jsr 6aaa <TestRow>(pc)
    48c0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48c4:	702a           	moveq #42,d0
    48c6:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    48ca:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 18);
    48ce:	7000           	moveq #0,d0
    48d0:	302f 01c6      	move.w 454(sp),d0
    48d4:	4878 0012      	pea 12 <_start+0x12>
    48d8:	2f00           	move.l d0,-(sp)
    48da:	2f2f 01d0      	move.l 464(sp),-(sp)
    48de:	2f2f 0056      	move.l 86(sp),-(sp)
    48e2:	4eba 21c6      	jsr 6aaa <TestRow>(pc)
    48e6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    48ea:	722a           	moveq #42,d1
    48ec:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 19);
    48f0:	7000           	moveq #0,d0
    48f2:	302f 01c6      	move.w 454(sp),d0
    48f6:	4878 0013      	pea 13 <_start+0x13>
    48fa:	2f00           	move.l d0,-(sp)
    48fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4900:	2f2f 0056      	move.l 86(sp),-(sp)
    4904:	4eba 21a4      	jsr 6aaa <TestRow>(pc)
    4908:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    490c:	702a           	moveq #42,d0
    490e:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4912:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 20);
    4916:	7000           	moveq #0,d0
    4918:	302f 01c6      	move.w 454(sp),d0
    491c:	4878 0014      	pea 14 <_start+0x14>
    4920:	2f00           	move.l d0,-(sp)
    4922:	2f2f 01d0      	move.l 464(sp),-(sp)
    4926:	2f2f 0056      	move.l 86(sp),-(sp)
    492a:	4eba 217e      	jsr 6aaa <TestRow>(pc)
    492e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4932:	722a           	moveq #42,d1
    4934:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 21);
    4938:	7000           	moveq #0,d0
    493a:	302f 01c6      	move.w 454(sp),d0
    493e:	4878 0015      	pea 15 <_start+0x15>
    4942:	2f00           	move.l d0,-(sp)
    4944:	2f2f 01d0      	move.l 464(sp),-(sp)
    4948:	2f2f 0056      	move.l 86(sp),-(sp)
    494c:	4eba 215c      	jsr 6aaa <TestRow>(pc)
    4950:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4954:	702a           	moveq #42,d0
    4956:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    495a:	466f 01c6      	not.w 454(sp)


  for(int i=0;i<10;i++) {
    495e:	42af 018a      	clr.l 394(sp)
    4962:	6000 0286      	bra.w 4bea <TestZoom4Picture+0xfa2>
    for(int i2=0;i2<13;i2++) {  
    4966:	42af 0186      	clr.l 390(sp)
    496a:	6042           	bra.s 49ae <TestZoom4Picture+0xd66>
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    496c:	222f 018a      	move.l 394(sp),d1
    4970:	2001           	move.l d1,d0
    4972:	d080           	add.l d0,d0
    4974:	d081           	add.l d1,d0
    4976:	2200           	move.l d0,d1
    4978:	e789           	lsl.l #3,d1
    497a:	9280           	sub.l d0,d1
    497c:	2041           	movea.l d1,a0
    497e:	d1ef 0186      	adda.l 390(sp),a0
    4982:	41e8 0016      	lea 22(a0),a0
    4986:	7000           	moveq #0,d0
    4988:	302f 01c6      	move.w 454(sp),d0
    498c:	2f08           	move.l a0,-(sp)
    498e:	2f00           	move.l d0,-(sp)
    4990:	2f2f 01d0      	move.l 464(sp),-(sp)
    4994:	2f2f 0056      	move.l 86(sp),-(sp)
    4998:	4eba 2110      	jsr 6aaa <TestRow>(pc)
    499c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    49a0:	722a           	moveq #42,d1
    49a2:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    49a6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {  
    49aa:	52af 0186      	addq.l #1,390(sp)
    49ae:	700c           	moveq #12,d0
    49b0:	b0af 0186      	cmp.l 390(sp),d0
    49b4:	6cb6           	bge.s 496c <TestZoom4Picture+0xd24>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    49b6:	222f 018a      	move.l 394(sp),d1
    49ba:	2001           	move.l d1,d0
    49bc:	d080           	add.l d0,d0
    49be:	d081           	add.l d1,d0
    49c0:	2200           	move.l d0,d1
    49c2:	e789           	lsl.l #3,d1
    49c4:	2041           	movea.l d1,a0
    49c6:	91c0           	suba.l d0,a0
    49c8:	41e8 0023      	lea 35(a0),a0
    49cc:	7000           	moveq #0,d0
    49ce:	302f 01c6      	move.w 454(sp),d0
    49d2:	2f08           	move.l a0,-(sp)
    49d4:	2f00           	move.l d0,-(sp)
    49d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    49da:	2f2f 0056      	move.l 86(sp),-(sp)
    49de:	4eba 20ca      	jsr 6aaa <TestRow>(pc)
    49e2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    49e6:	722a           	moveq #42,d1
    49e8:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    49ec:	222f 018a      	move.l 394(sp),d1
    49f0:	2001           	move.l d1,d0
    49f2:	d080           	add.l d0,d0
    49f4:	d081           	add.l d1,d0
    49f6:	2200           	move.l d0,d1
    49f8:	e789           	lsl.l #3,d1
    49fa:	2041           	movea.l d1,a0
    49fc:	91c0           	suba.l d0,a0
    49fe:	41e8 0024      	lea 36(a0),a0
    4a02:	7000           	moveq #0,d0
    4a04:	302f 01c6      	move.w 454(sp),d0
    4a08:	2f08           	move.l a0,-(sp)
    4a0a:	2f00           	move.l d0,-(sp)
    4a0c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a10:	2f2f 0056      	move.l 86(sp),-(sp)
    4a14:	4eba 2094      	jsr 6aaa <TestRow>(pc)
    4a18:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a1c:	702a           	moveq #42,d0
    4a1e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4a22:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    4a26:	222f 018a      	move.l 394(sp),d1
    4a2a:	2001           	move.l d1,d0
    4a2c:	d080           	add.l d0,d0
    4a2e:	d081           	add.l d1,d0
    4a30:	2200           	move.l d0,d1
    4a32:	e789           	lsl.l #3,d1
    4a34:	2041           	movea.l d1,a0
    4a36:	91c0           	suba.l d0,a0
    4a38:	41e8 0025      	lea 37(a0),a0
    4a3c:	7000           	moveq #0,d0
    4a3e:	302f 01c6      	move.w 454(sp),d0
    4a42:	2f08           	move.l a0,-(sp)
    4a44:	2f00           	move.l d0,-(sp)
    4a46:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a4a:	2f2f 0056      	move.l 86(sp),-(sp)
    4a4e:	4eba 205a      	jsr 6aaa <TestRow>(pc)
    4a52:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a56:	722a           	moveq #42,d1
    4a58:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    4a5c:	222f 018a      	move.l 394(sp),d1
    4a60:	2001           	move.l d1,d0
    4a62:	d080           	add.l d0,d0
    4a64:	d081           	add.l d1,d0
    4a66:	2200           	move.l d0,d1
    4a68:	e789           	lsl.l #3,d1
    4a6a:	2041           	movea.l d1,a0
    4a6c:	91c0           	suba.l d0,a0
    4a6e:	41e8 0026      	lea 38(a0),a0
    4a72:	7000           	moveq #0,d0
    4a74:	302f 01c6      	move.w 454(sp),d0
    4a78:	2f08           	move.l a0,-(sp)
    4a7a:	2f00           	move.l d0,-(sp)
    4a7c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a80:	2f2f 0056      	move.l 86(sp),-(sp)
    4a84:	4eba 2024      	jsr 6aaa <TestRow>(pc)
    4a88:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a8c:	702a           	moveq #42,d0
    4a8e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4a92:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    4a96:	222f 018a      	move.l 394(sp),d1
    4a9a:	2001           	move.l d1,d0
    4a9c:	d080           	add.l d0,d0
    4a9e:	d081           	add.l d1,d0
    4aa0:	2200           	move.l d0,d1
    4aa2:	e789           	lsl.l #3,d1
    4aa4:	2041           	movea.l d1,a0
    4aa6:	91c0           	suba.l d0,a0
    4aa8:	41e8 0027      	lea 39(a0),a0
    4aac:	7000           	moveq #0,d0
    4aae:	302f 01c6      	move.w 454(sp),d0
    4ab2:	2f08           	move.l a0,-(sp)
    4ab4:	2f00           	move.l d0,-(sp)
    4ab6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4aba:	2f2f 0056      	move.l 86(sp),-(sp)
    4abe:	4eba 1fea      	jsr 6aaa <TestRow>(pc)
    4ac2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ac6:	722a           	moveq #42,d1
    4ac8:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    4acc:	222f 018a      	move.l 394(sp),d1
    4ad0:	2001           	move.l d1,d0
    4ad2:	d080           	add.l d0,d0
    4ad4:	d081           	add.l d1,d0
    4ad6:	2200           	move.l d0,d1
    4ad8:	e789           	lsl.l #3,d1
    4ada:	2041           	movea.l d1,a0
    4adc:	91c0           	suba.l d0,a0
    4ade:	41e8 0028      	lea 40(a0),a0
    4ae2:	7000           	moveq #0,d0
    4ae4:	302f 01c6      	move.w 454(sp),d0
    4ae8:	2f08           	move.l a0,-(sp)
    4aea:	2f00           	move.l d0,-(sp)
    4aec:	2f2f 01d0      	move.l 464(sp),-(sp)
    4af0:	2f2f 0056      	move.l 86(sp),-(sp)
    4af4:	4eba 1fb4      	jsr 6aaa <TestRow>(pc)
    4af8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4afc:	702a           	moveq #42,d0
    4afe:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b02:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    4b06:	222f 018a      	move.l 394(sp),d1
    4b0a:	2001           	move.l d1,d0
    4b0c:	d080           	add.l d0,d0
    4b0e:	d081           	add.l d1,d0
    4b10:	2200           	move.l d0,d1
    4b12:	e789           	lsl.l #3,d1
    4b14:	2041           	movea.l d1,a0
    4b16:	91c0           	suba.l d0,a0
    4b18:	41e8 0029      	lea 41(a0),a0
    4b1c:	7000           	moveq #0,d0
    4b1e:	302f 01c6      	move.w 454(sp),d0
    4b22:	2f08           	move.l a0,-(sp)
    4b24:	2f00           	move.l d0,-(sp)
    4b26:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b2a:	2f2f 0056      	move.l 86(sp),-(sp)
    4b2e:	4eba 1f7a      	jsr 6aaa <TestRow>(pc)
    4b32:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b36:	722a           	moveq #42,d1
    4b38:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    4b3c:	222f 018a      	move.l 394(sp),d1
    4b40:	2001           	move.l d1,d0
    4b42:	d080           	add.l d0,d0
    4b44:	d081           	add.l d1,d0
    4b46:	2200           	move.l d0,d1
    4b48:	e789           	lsl.l #3,d1
    4b4a:	2041           	movea.l d1,a0
    4b4c:	91c0           	suba.l d0,a0
    4b4e:	41e8 002a      	lea 42(a0),a0
    4b52:	7000           	moveq #0,d0
    4b54:	302f 01c6      	move.w 454(sp),d0
    4b58:	2f08           	move.l a0,-(sp)
    4b5a:	2f00           	move.l d0,-(sp)
    4b5c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b60:	2f2f 0056      	move.l 86(sp),-(sp)
    4b64:	4eba 1f44      	jsr 6aaa <TestRow>(pc)
    4b68:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b6c:	702a           	moveq #42,d0
    4b6e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b72:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    4b76:	222f 018a      	move.l 394(sp),d1
    4b7a:	2001           	move.l d1,d0
    4b7c:	d080           	add.l d0,d0
    4b7e:	d081           	add.l d1,d0
    4b80:	2200           	move.l d0,d1
    4b82:	e789           	lsl.l #3,d1
    4b84:	2041           	movea.l d1,a0
    4b86:	91c0           	suba.l d0,a0
    4b88:	41e8 002b      	lea 43(a0),a0
    4b8c:	7000           	moveq #0,d0
    4b8e:	302f 01c6      	move.w 454(sp),d0
    4b92:	2f08           	move.l a0,-(sp)
    4b94:	2f00           	move.l d0,-(sp)
    4b96:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b9a:	2f2f 0056      	move.l 86(sp),-(sp)
    4b9e:	4eba 1f0a      	jsr 6aaa <TestRow>(pc)
    4ba2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ba6:	722a           	moveq #42,d1
    4ba8:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    4bac:	222f 018a      	move.l 394(sp),d1
    4bb0:	2001           	move.l d1,d0
    4bb2:	d080           	add.l d0,d0
    4bb4:	d081           	add.l d1,d0
    4bb6:	2200           	move.l d0,d1
    4bb8:	e789           	lsl.l #3,d1
    4bba:	2041           	movea.l d1,a0
    4bbc:	91c0           	suba.l d0,a0
    4bbe:	41e8 002c      	lea 44(a0),a0
    4bc2:	7000           	moveq #0,d0
    4bc4:	302f 01c6      	move.w 454(sp),d0
    4bc8:	2f08           	move.l a0,-(sp)
    4bca:	2f00           	move.l d0,-(sp)
    4bcc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bd0:	2f2f 0056      	move.l 86(sp),-(sp)
    4bd4:	4eba 1ed4      	jsr 6aaa <TestRow>(pc)
    4bd8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4bdc:	702a           	moveq #42,d0
    4bde:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4be2:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<10;i++) {
    4be6:	52af 018a      	addq.l #1,394(sp)
    4bea:	7209           	moveq #9,d1
    4bec:	b2af 018a      	cmp.l 394(sp),d1
    4bf0:	6c00 fd74      	bge.w 4966 <TestZoom4Picture+0xd1e>
  }

  for(int i2=0;i2<13;i2++) {  
    4bf4:	42af 0182      	clr.l 386(sp)
    4bf8:	6032           	bra.s 4c2c <TestZoom4Picture+0xfe4>
    TestRow( valsupposed, valactual, mask, i2+253);
    4bfa:	222f 0182      	move.l 386(sp),d1
    4bfe:	0681 0000 00fd 	addi.l #253,d1
    4c04:	7000           	moveq #0,d0
    4c06:	302f 01c6      	move.w 454(sp),d0
    4c0a:	2f01           	move.l d1,-(sp)
    4c0c:	2f00           	move.l d0,-(sp)
    4c0e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c12:	2f2f 0056      	move.l 86(sp),-(sp)
    4c16:	4eba 1e92      	jsr 6aaa <TestRow>(pc)
    4c1a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c1e:	702a           	moveq #42,d0
    4c20:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c24:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4c28:	52af 0182      	addq.l #1,386(sp)
    4c2c:	720c           	moveq #12,d1
    4c2e:	b2af 0182      	cmp.l 386(sp),d1
    4c32:	6cc6           	bge.s 4bfa <TestZoom4Picture+0xfb2>
  }

  TestRow( valsupposed, valactual, mask, 266);
    4c34:	7000           	moveq #0,d0
    4c36:	302f 01c6      	move.w 454(sp),d0
    4c3a:	4878 010a      	pea 10a <FreeDisplay+0x2a>
    4c3e:	2f00           	move.l d0,-(sp)
    4c40:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c44:	2f2f 0056      	move.l 86(sp),-(sp)
    4c48:	4eba 1e60      	jsr 6aaa <TestRow>(pc)
    4c4c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4c50:	702a           	moveq #42,d0
    4c52:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 267);
    4c56:	7000           	moveq #0,d0
    4c58:	302f 01c6      	move.w 454(sp),d0
    4c5c:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    4c60:	2f00           	move.l d0,-(sp)
    4c62:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c66:	2f2f 0056      	move.l 86(sp),-(sp)
    4c6a:	4eba 1e3e      	jsr 6aaa <TestRow>(pc)
    4c6e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4c72:	722a           	moveq #42,d1
    4c74:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4c78:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 268);
    4c7c:	7000           	moveq #0,d0
    4c7e:	302f 01c6      	move.w 454(sp),d0
    4c82:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    4c86:	2f00           	move.l d0,-(sp)
    4c88:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c8c:	2f2f 0056      	move.l 86(sp),-(sp)
    4c90:	4eba 1e18      	jsr 6aaa <TestRow>(pc)
    4c94:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4c98:	702a           	moveq #42,d0
    4c9a:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 269);
    4c9e:	7000           	moveq #0,d0
    4ca0:	302f 01c6      	move.w 454(sp),d0
    4ca4:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4ca8:	2f00           	move.l d0,-(sp)
    4caa:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cae:	2f2f 0056      	move.l 86(sp),-(sp)
    4cb2:	4eba 1df6      	jsr 6aaa <TestRow>(pc)
    4cb6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4cba:	722a           	moveq #42,d1
    4cbc:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4cc0:	466f 01c6      	not.w 454(sp)

  tmp = source;
    4cc4:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4cca:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4cd0:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    4cd6:	4878 0001      	pea 1 <_start+0x1>
    4cda:	4878 0005      	pea 5 <_start+0x5>
    4cde:	2f2f 0056      	move.l 86(sp),-(sp)
    4ce2:	2f2f 006a      	move.l 106(sp),-(sp)
    4ce6:	4eba cd10      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    4cea:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4cee:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    4cf4:	2c40           	movea.l d0,a6
    4cf6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4cfa:	202f 004e      	move.l 78(sp),d0
    4cfe:	5880           	addq.l #4,d0
    4d00:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom6;
    4d04:	2f7c 0000 bb08 	move.l #47880,74(sp)
    4d0a:	004a 
  mask = 0x0000;
    4d0c:	426f 01c6      	clr.w 454(sp)
 
  for(int i2=0;i2<7;i2++) {  
    4d10:	42af 017e      	clr.l 382(sp)
    4d14:	602a           	bra.s 4d40 <TestZoom4Picture+0x10f8>
    TestRow( valsupposed, valactual, mask, i2);
    4d16:	7000           	moveq #0,d0
    4d18:	302f 01c6      	move.w 454(sp),d0
    4d1c:	2f2f 017e      	move.l 382(sp),-(sp)
    4d20:	2f00           	move.l d0,-(sp)
    4d22:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d26:	2f2f 0056      	move.l 86(sp),-(sp)
    4d2a:	4eba 1d7e      	jsr 6aaa <TestRow>(pc)
    4d2e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d32:	722a           	moveq #42,d1
    4d34:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4d38:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    4d3c:	52af 017e      	addq.l #1,382(sp)
    4d40:	7006           	moveq #6,d0
    4d42:	b0af 017e      	cmp.l 382(sp),d0
    4d46:	6cce           	bge.s 4d16 <TestZoom4Picture+0x10ce>
  }

  for(int i=0;i<6;i++) {
    4d48:	42af 017a      	clr.l 378(sp)
    4d4c:	605c           	bra.s 4daa <TestZoom4Picture+0x1162>
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    4d4e:	202f 017a      	move.l 378(sp),d0
    4d52:	d080           	add.l d0,d0
    4d54:	2200           	move.l d0,d1
    4d56:	5e81           	addq.l #7,d1
    4d58:	7000           	moveq #0,d0
    4d5a:	302f 01c6      	move.w 454(sp),d0
    4d5e:	2f01           	move.l d1,-(sp)
    4d60:	2f00           	move.l d0,-(sp)
    4d62:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d66:	2f2f 0056      	move.l 86(sp),-(sp)
    4d6a:	4eba 1d3e      	jsr 6aaa <TestRow>(pc)
    4d6e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d72:	722a           	moveq #42,d1
    4d74:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    4d78:	202f 017a      	move.l 378(sp),d0
    4d7c:	5880           	addq.l #4,d0
    4d7e:	d080           	add.l d0,d0
    4d80:	2200           	move.l d0,d1
    4d82:	7000           	moveq #0,d0
    4d84:	302f 01c6      	move.w 454(sp),d0
    4d88:	2f01           	move.l d1,-(sp)
    4d8a:	2f00           	move.l d0,-(sp)
    4d8c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d90:	2f2f 0056      	move.l 86(sp),-(sp)
    4d94:	4eba 1d14      	jsr 6aaa <TestRow>(pc)
    4d98:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d9c:	702a           	moveq #42,d0
    4d9e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4da2:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<6;i++) {
    4da6:	52af 017a      	addq.l #1,378(sp)
    4daa:	7205           	moveq #5,d1
    4dac:	b2af 017a      	cmp.l 378(sp),d1
    4db0:	6c9c           	bge.s 4d4e <TestZoom4Picture+0x1106>
  }

  for(int i=0;i<10;i++) {
    4db2:	42af 0176      	clr.l 374(sp)
    4db6:	6000 00ce      	bra.w 4e86 <TestZoom4Picture+0x123e>
    for(int i2=0;i2<12;i2++) {  
    4dba:	42af 0172      	clr.l 370(sp)
    4dbe:	6040           	bra.s 4e00 <TestZoom4Picture+0x11b8>
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    4dc0:	307c 0013      	movea.w #19,a0
    4dc4:	d1ef 0172      	adda.l 370(sp),a0
    4dc8:	222f 0176      	move.l 374(sp),d1
    4dcc:	2001           	move.l d1,d0
    4dce:	d080           	add.l d0,d0
    4dd0:	d081           	add.l d1,d0
    4dd2:	e788           	lsl.l #3,d0
    4dd4:	2208           	move.l a0,d1
    4dd6:	d280           	add.l d0,d1
    4dd8:	7000           	moveq #0,d0
    4dda:	302f 01c6      	move.w 454(sp),d0
    4dde:	2f01           	move.l d1,-(sp)
    4de0:	2f00           	move.l d0,-(sp)
    4de2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4de6:	2f2f 0056      	move.l 86(sp),-(sp)
    4dea:	4eba 1cbe      	jsr 6aaa <TestRow>(pc)
    4dee:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4df2:	702a           	moveq #42,d0
    4df4:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4df8:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {  
    4dfc:	52af 0172      	addq.l #1,370(sp)
    4e00:	720b           	moveq #11,d1
    4e02:	b2af 0172      	cmp.l 370(sp),d1
    4e06:	6cb8           	bge.s 4dc0 <TestZoom4Picture+0x1178>
    }
    for(int i=0;i<6;i++) {
    4e08:	42af 016e      	clr.l 366(sp)
    4e0c:	606c           	bra.s 4e7a <TestZoom4Picture+0x1232>
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    4e0e:	222f 016e      	move.l 366(sp),d1
    4e12:	2001           	move.l d1,d0
    4e14:	d080           	add.l d0,d0
    4e16:	d081           	add.l d1,d0
    4e18:	e788           	lsl.l #3,d0
    4e1a:	2040           	movea.l d0,a0
    4e1c:	41e8 001f      	lea 31(a0),a0
    4e20:	7000           	moveq #0,d0
    4e22:	302f 01c6      	move.w 454(sp),d0
    4e26:	2f08           	move.l a0,-(sp)
    4e28:	2f00           	move.l d0,-(sp)
    4e2a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e2e:	2f2f 0056      	move.l 86(sp),-(sp)
    4e32:	4eba 1c76      	jsr 6aaa <TestRow>(pc)
    4e36:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4e3a:	702a           	moveq #42,d0
    4e3c:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    4e40:	222f 016e      	move.l 366(sp),d1
    4e44:	2001           	move.l d1,d0
    4e46:	d080           	add.l d0,d0
    4e48:	d081           	add.l d1,d0
    4e4a:	e788           	lsl.l #3,d0
    4e4c:	2040           	movea.l d0,a0
    4e4e:	41e8 0020      	lea 32(a0),a0
    4e52:	7000           	moveq #0,d0
    4e54:	302f 01c6      	move.w 454(sp),d0
    4e58:	2f08           	move.l a0,-(sp)
    4e5a:	2f00           	move.l d0,-(sp)
    4e5c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e60:	2f2f 0056      	move.l 86(sp),-(sp)
    4e64:	4eba 1c44      	jsr 6aaa <TestRow>(pc)
    4e68:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4e6c:	722a           	moveq #42,d1
    4e6e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4e72:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<6;i++) {
    4e76:	52af 016e      	addq.l #1,366(sp)
    4e7a:	7005           	moveq #5,d0
    4e7c:	b0af 016e      	cmp.l 366(sp),d0
    4e80:	6c8c           	bge.s 4e0e <TestZoom4Picture+0x11c6>
  for(int i=0;i<10;i++) {
    4e82:	52af 0176      	addq.l #1,374(sp)
    4e86:	7209           	moveq #9,d1
    4e88:	b2af 0176      	cmp.l 374(sp),d1
    4e8c:	6c00 ff2c      	bge.w 4dba <TestZoom4Picture+0x1172>
    }
  }

  for(int i2=0;i2<11;i2++) {  
    4e90:	42af 016a      	clr.l 362(sp)
    4e94:	6032           	bra.s 4ec8 <TestZoom4Picture+0x1280>
    TestRow( valsupposed, valactual, mask, 258+i2);
    4e96:	222f 016a      	move.l 362(sp),d1
    4e9a:	0681 0000 0102 	addi.l #258,d1
    4ea0:	7000           	moveq #0,d0
    4ea2:	302f 01c6      	move.w 454(sp),d0
    4ea6:	2f01           	move.l d1,-(sp)
    4ea8:	2f00           	move.l d0,-(sp)
    4eaa:	2f2f 01d0      	move.l 464(sp),-(sp)
    4eae:	2f2f 0056      	move.l 86(sp),-(sp)
    4eb2:	4eba 1bf6      	jsr 6aaa <TestRow>(pc)
    4eb6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4eba:	702a           	moveq #42,d0
    4ebc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4ec0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {  
    4ec4:	52af 016a      	addq.l #1,362(sp)
    4ec8:	720a           	moveq #10,d1
    4eca:	b2af 016a      	cmp.l 362(sp),d1
    4ece:	6cc6           	bge.s 4e96 <TestZoom4Picture+0x124e>
  }

  tmp = source;
    4ed0:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4ed6:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4edc:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    4ee2:	4878 0001      	pea 1 <_start+0x1>
    4ee6:	4878 0006      	pea 6 <_start+0x6>
    4eea:	2f2f 0056      	move.l 86(sp),-(sp)
    4eee:	2f2f 006a      	move.l 106(sp),-(sp)
    4ef2:	4eba cb04      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    4ef6:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4efa:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    4f00:	2c40           	movea.l d0,a6
    4f02:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4f06:	202f 004e      	move.l 78(sp),d0
    4f0a:	5880           	addq.l #4,d0
    4f0c:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom7;
    4f10:	2f7c 0000 bb34 	move.l #47924,74(sp)
    4f16:	004a 
  mask = 0x0000;
    4f18:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    4f1c:	7000           	moveq #0,d0
    4f1e:	302f 01c6      	move.w 454(sp),d0
    4f22:	42a7           	clr.l -(sp)
    4f24:	2f00           	move.l d0,-(sp)
    4f26:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f2a:	2f2f 0056      	move.l 86(sp),-(sp)
    4f2e:	4eba 1b7a      	jsr 6aaa <TestRow>(pc)
    4f32:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4f36:	722a           	moveq #42,d1
    4f38:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4f3c:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    4f40:	42af 0166      	clr.l 358(sp)
    4f44:	605c           	bra.s 4fa2 <TestZoom4Picture+0x135a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    4f46:	202f 0166      	move.l 358(sp),d0
    4f4a:	d080           	add.l d0,d0
    4f4c:	2200           	move.l d0,d1
    4f4e:	5281           	addq.l #1,d1
    4f50:	7000           	moveq #0,d0
    4f52:	302f 01c6      	move.w 454(sp),d0
    4f56:	2f01           	move.l d1,-(sp)
    4f58:	2f00           	move.l d0,-(sp)
    4f5a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f5e:	2f2f 0056      	move.l 86(sp),-(sp)
    4f62:	4eba 1b46      	jsr 6aaa <TestRow>(pc)
    4f66:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4f6a:	702a           	moveq #42,d0
    4f6c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    4f70:	202f 0166      	move.l 358(sp),d0
    4f74:	5280           	addq.l #1,d0
    4f76:	d080           	add.l d0,d0
    4f78:	2200           	move.l d0,d1
    4f7a:	7000           	moveq #0,d0
    4f7c:	302f 01c6      	move.w 454(sp),d0
    4f80:	2f01           	move.l d1,-(sp)
    4f82:	2f00           	move.l d0,-(sp)
    4f84:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f88:	2f2f 0056      	move.l 86(sp),-(sp)
    4f8c:	4eba 1b1c      	jsr 6aaa <TestRow>(pc)
    4f90:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4f94:	722a           	moveq #42,d1
    4f96:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4f9a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    4f9e:	52af 0166      	addq.l #1,358(sp)
    4fa2:	7006           	moveq #6,d0
    4fa4:	b0af 0166      	cmp.l 358(sp),d0
    4fa8:	6c9c           	bge.s 4f46 <TestZoom4Picture+0x12fe>
  }

  for(int i=0;i<10;i++) {
    4faa:	42af 0162      	clr.l 354(sp)
    4fae:	6000 00d4      	bra.w 5084 <TestZoom4Picture+0x143c>
    for(int i2=0;i2<11;i2++) {  
    4fb2:	42af 015e      	clr.l 350(sp)
    4fb6:	6042           	bra.s 4ffa <TestZoom4Picture+0x13b2>
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    4fb8:	307c 000f      	movea.w #15,a0
    4fbc:	d1ef 015e      	adda.l 350(sp),a0
    4fc0:	222f 0162      	move.l 354(sp),d1
    4fc4:	2001           	move.l d1,d0
    4fc6:	d080           	add.l d0,d0
    4fc8:	d081           	add.l d1,d0
    4fca:	e788           	lsl.l #3,d0
    4fcc:	d081           	add.l d1,d0
    4fce:	2208           	move.l a0,d1
    4fd0:	d280           	add.l d0,d1
    4fd2:	7000           	moveq #0,d0
    4fd4:	302f 01c6      	move.w 454(sp),d0
    4fd8:	2f01           	move.l d1,-(sp)
    4fda:	2f00           	move.l d0,-(sp)
    4fdc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4fe0:	2f2f 0056      	move.l 86(sp),-(sp)
    4fe4:	4eba 1ac4      	jsr 6aaa <TestRow>(pc)
    4fe8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4fec:	722a           	moveq #42,d1
    4fee:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4ff2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {  
    4ff6:	52af 015e      	addq.l #1,350(sp)
    4ffa:	700a           	moveq #10,d0
    4ffc:	b0af 015e      	cmp.l 350(sp),d0
    5000:	6cb6           	bge.s 4fb8 <TestZoom4Picture+0x1370>
    }
    for(int i=0;i<7;i++) {
    5002:	42af 015a      	clr.l 346(sp)
    5006:	6070           	bra.s 5078 <TestZoom4Picture+0x1430>
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    5008:	222f 015a      	move.l 346(sp),d1
    500c:	2001           	move.l d1,d0
    500e:	d080           	add.l d0,d0
    5010:	d081           	add.l d1,d0
    5012:	e788           	lsl.l #3,d0
    5014:	2040           	movea.l d0,a0
    5016:	d1c1           	adda.l d1,a0
    5018:	41e8 001a      	lea 26(a0),a0
    501c:	7000           	moveq #0,d0
    501e:	302f 01c6      	move.w 454(sp),d0
    5022:	2f08           	move.l a0,-(sp)
    5024:	2f00           	move.l d0,-(sp)
    5026:	2f2f 01d0      	move.l 464(sp),-(sp)
    502a:	2f2f 0056      	move.l 86(sp),-(sp)
    502e:	4eba 1a7a      	jsr 6aaa <TestRow>(pc)
    5032:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5036:	722a           	moveq #42,d1
    5038:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    503c:	222f 015a      	move.l 346(sp),d1
    5040:	2001           	move.l d1,d0
    5042:	d080           	add.l d0,d0
    5044:	d081           	add.l d1,d0
    5046:	e788           	lsl.l #3,d0
    5048:	2040           	movea.l d0,a0
    504a:	d1c1           	adda.l d1,a0
    504c:	41e8 001a      	lea 26(a0),a0
    5050:	7000           	moveq #0,d0
    5052:	302f 01c6      	move.w 454(sp),d0
    5056:	2f08           	move.l a0,-(sp)
    5058:	2f00           	move.l d0,-(sp)
    505a:	2f2f 01d0      	move.l 464(sp),-(sp)
    505e:	2f2f 0056      	move.l 86(sp),-(sp)
    5062:	4eba 1a46      	jsr 6aaa <TestRow>(pc)
    5066:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    506a:	702a           	moveq #42,d0
    506c:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5070:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<7;i++) {
    5074:	52af 015a      	addq.l #1,346(sp)
    5078:	7206           	moveq #6,d1
    507a:	b2af 015a      	cmp.l 346(sp),d1
    507e:	6c88           	bge.s 5008 <TestZoom4Picture+0x13c0>
  for(int i=0;i<10;i++) {
    5080:	52af 0162      	addq.l #1,354(sp)
    5084:	7009           	moveq #9,d0
    5086:	b0af 0162      	cmp.l 354(sp),d0
    508a:	6c00 ff26      	bge.w 4fb2 <TestZoom4Picture+0x136a>
    }
  }

  for(int i2=0;i2<5;i2++) {  
    508e:	42af 0156      	clr.l 342(sp)
    5092:	6032           	bra.s 50c6 <TestZoom4Picture+0x147e>
    TestRow( valsupposed, valactual, mask, 256+i2);
    5094:	222f 0156      	move.l 342(sp),d1
    5098:	0681 0000 0100 	addi.l #256,d1
    509e:	7000           	moveq #0,d0
    50a0:	302f 01c6      	move.w 454(sp),d0
    50a4:	2f01           	move.l d1,-(sp)
    50a6:	2f00           	move.l d0,-(sp)
    50a8:	2f2f 01d0      	move.l 464(sp),-(sp)
    50ac:	2f2f 0056      	move.l 86(sp),-(sp)
    50b0:	4eba 19f8      	jsr 6aaa <TestRow>(pc)
    50b4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    50b8:	722a           	moveq #42,d1
    50ba:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    50be:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    50c2:	52af 0156      	addq.l #1,342(sp)
    50c6:	7004           	moveq #4,d0
    50c8:	b0af 0156      	cmp.l 342(sp),d0
    50cc:	6cc6           	bge.s 5094 <TestZoom4Picture+0x144c>
  }

  tmp = source;
    50ce:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    50d4:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    50da:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    50e0:	4878 0001      	pea 1 <_start+0x1>
    50e4:	4878 0007      	pea 7 <_start+0x7>
    50e8:	2f2f 0056      	move.l 86(sp),-(sp)
    50ec:	2f2f 006a      	move.l 106(sp),-(sp)
    50f0:	4eba c906      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    50f4:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    50f8:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    50fe:	2c40           	movea.l d0,a6
    5100:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5104:	222f 004e      	move.l 78(sp),d1
    5108:	5881           	addq.l #4,d1
    510a:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom8;
    510e:	2f7c 0000 bb60 	move.l #47968,74(sp)
    5114:	004a 
  mask = 0xffff;
    5116:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    511c:	7000           	moveq #0,d0
    511e:	302f 01c6      	move.w 454(sp),d0
    5122:	42a7           	clr.l -(sp)
    5124:	2f00           	move.l d0,-(sp)
    5126:	2f2f 01d0      	move.l 464(sp),-(sp)
    512a:	2f2f 0056      	move.l 86(sp),-(sp)
    512e:	4eba 197a      	jsr 6aaa <TestRow>(pc)
    5132:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5136:	702a           	moveq #42,d0
    5138:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    513c:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5140:	42af 0152      	clr.l 338(sp)
    5144:	605c           	bra.s 51a2 <TestZoom4Picture+0x155a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    5146:	202f 0152      	move.l 338(sp),d0
    514a:	d080           	add.l d0,d0
    514c:	2200           	move.l d0,d1
    514e:	5281           	addq.l #1,d1
    5150:	7000           	moveq #0,d0
    5152:	302f 01c6      	move.w 454(sp),d0
    5156:	2f01           	move.l d1,-(sp)
    5158:	2f00           	move.l d0,-(sp)
    515a:	2f2f 01d0      	move.l 464(sp),-(sp)
    515e:	2f2f 0056      	move.l 86(sp),-(sp)
    5162:	4eba 1946      	jsr 6aaa <TestRow>(pc)
    5166:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    516a:	722a           	moveq #42,d1
    516c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    5170:	202f 0152      	move.l 338(sp),d0
    5174:	5280           	addq.l #1,d0
    5176:	d080           	add.l d0,d0
    5178:	2200           	move.l d0,d1
    517a:	7000           	moveq #0,d0
    517c:	302f 01c6      	move.w 454(sp),d0
    5180:	2f01           	move.l d1,-(sp)
    5182:	2f00           	move.l d0,-(sp)
    5184:	2f2f 01d0      	move.l 464(sp),-(sp)
    5188:	2f2f 0056      	move.l 86(sp),-(sp)
    518c:	4eba 191c      	jsr 6aaa <TestRow>(pc)
    5190:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5194:	702a           	moveq #42,d0
    5196:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    519a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    519e:	52af 0152      	addq.l #1,338(sp)
    51a2:	7204           	moveq #4,d1
    51a4:	b2af 0152      	cmp.l 338(sp),d1
    51a8:	6c9c           	bge.s 5146 <TestZoom4Picture+0x14fe>
  }

  for(int i=0;i<9;i++) {
    51aa:	42af 014e      	clr.l 334(sp)
    51ae:	6000 00f0      	bra.w 52a0 <TestZoom4Picture+0x1658>
    for(int i2=0;i2<10;i2++) {  
    51b2:	42af 014a      	clr.l 330(sp)
    51b6:	6046           	bra.s 51fe <TestZoom4Picture+0x15b6>
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    51b8:	307c 000b      	movea.w #11,a0
    51bc:	d1ef 014a      	adda.l 330(sp),a0
    51c0:	222f 014e      	move.l 334(sp),d1
    51c4:	2001           	move.l d1,d0
    51c6:	d080           	add.l d0,d0
    51c8:	d081           	add.l d1,d0
    51ca:	d080           	add.l d0,d0
    51cc:	d080           	add.l d0,d0
    51ce:	d081           	add.l d1,d0
    51d0:	d080           	add.l d0,d0
    51d2:	2208           	move.l a0,d1
    51d4:	d280           	add.l d0,d1
    51d6:	7000           	moveq #0,d0
    51d8:	302f 01c6      	move.w 454(sp),d0
    51dc:	2f01           	move.l d1,-(sp)
    51de:	2f00           	move.l d0,-(sp)
    51e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    51e4:	2f2f 0056      	move.l 86(sp),-(sp)
    51e8:	4eba 18c0      	jsr 6aaa <TestRow>(pc)
    51ec:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    51f0:	702a           	moveq #42,d0
    51f2:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    51f6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {  
    51fa:	52af 014a      	addq.l #1,330(sp)
    51fe:	7209           	moveq #9,d1
    5200:	b2af 014a      	cmp.l 330(sp),d1
    5204:	6cb2           	bge.s 51b8 <TestZoom4Picture+0x1570>
    }
    for(int i2=0;i2<8;i2++) {
    5206:	42af 0146      	clr.l 326(sp)
    520a:	6000 0086      	bra.w 5292 <TestZoom4Picture+0x164a>
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    520e:	222f 014e      	move.l 334(sp),d1
    5212:	2001           	move.l d1,d0
    5214:	d080           	add.l d0,d0
    5216:	d081           	add.l d1,d0
    5218:	d080           	add.l d0,d0
    521a:	d080           	add.l d0,d0
    521c:	d081           	add.l d1,d0
    521e:	d080           	add.l d0,d0
    5220:	2040           	movea.l d0,a0
    5222:	41e8 0015      	lea 21(a0),a0
    5226:	2208           	move.l a0,d1
    5228:	d2af 0146      	add.l 326(sp),d1
    522c:	7000           	moveq #0,d0
    522e:	302f 01c6      	move.w 454(sp),d0
    5232:	2f01           	move.l d1,-(sp)
    5234:	2f00           	move.l d0,-(sp)
    5236:	2f2f 01d0      	move.l 464(sp),-(sp)
    523a:	2f2f 0056      	move.l 86(sp),-(sp)
    523e:	4eba 186a      	jsr 6aaa <TestRow>(pc)
    5242:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5246:	702a           	moveq #42,d0
    5248:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    524c:	222f 014e      	move.l 334(sp),d1
    5250:	2001           	move.l d1,d0
    5252:	d080           	add.l d0,d0
    5254:	d081           	add.l d1,d0
    5256:	d080           	add.l d0,d0
    5258:	d080           	add.l d0,d0
    525a:	d081           	add.l d1,d0
    525c:	d080           	add.l d0,d0
    525e:	2040           	movea.l d0,a0
    5260:	41e8 0015      	lea 21(a0),a0
    5264:	2208           	move.l a0,d1
    5266:	d2af 0146      	add.l 326(sp),d1
    526a:	7000           	moveq #0,d0
    526c:	302f 01c6      	move.w 454(sp),d0
    5270:	2f01           	move.l d1,-(sp)
    5272:	2f00           	move.l d0,-(sp)
    5274:	2f2f 01d0      	move.l 464(sp),-(sp)
    5278:	2f2f 0056      	move.l 86(sp),-(sp)
    527c:	4eba 182c      	jsr 6aaa <TestRow>(pc)
    5280:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5284:	722a           	moveq #42,d1
    5286:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    528a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {
    528e:	52af 0146      	addq.l #1,326(sp)
    5292:	7007           	moveq #7,d0
    5294:	b0af 0146      	cmp.l 326(sp),d0
    5298:	6c00 ff74      	bge.w 520e <TestZoom4Picture+0x15c6>
  for(int i=0;i<9;i++) {
    529c:	52af 014e      	addq.l #1,334(sp)
    52a0:	7208           	moveq #8,d1
    52a2:	b2af 014e      	cmp.l 334(sp),d1
    52a6:	6c00 ff0a      	bge.w 51b2 <TestZoom4Picture+0x156a>
    }
  }

  for(int i2=0;i2<10;i2++) {  
    52aa:	42af 0142      	clr.l 322(sp)
    52ae:	6032           	bra.s 52e2 <TestZoom4Picture+0x169a>
    TestRow( valsupposed, valactual, mask, 245+i2);
    52b0:	222f 0142      	move.l 322(sp),d1
    52b4:	0681 0000 00f5 	addi.l #245,d1
    52ba:	7000           	moveq #0,d0
    52bc:	302f 01c6      	move.w 454(sp),d0
    52c0:	2f01           	move.l d1,-(sp)
    52c2:	2f00           	move.l d0,-(sp)
    52c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    52c8:	2f2f 0056      	move.l 86(sp),-(sp)
    52cc:	4eba 17dc      	jsr 6aaa <TestRow>(pc)
    52d0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    52d4:	702a           	moveq #42,d0
    52d6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    52da:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {  
    52de:	52af 0142      	addq.l #1,322(sp)
    52e2:	7209           	moveq #9,d1
    52e4:	b2af 0142      	cmp.l 322(sp),d1
    52e8:	6cc6           	bge.s 52b0 <TestZoom4Picture+0x1668>
  }
  for(int i=0;i<7;i++) {
    52ea:	42af 013e      	clr.l 318(sp)
    52ee:	6064           	bra.s 5354 <TestZoom4Picture+0x170c>
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    52f0:	202f 013e      	move.l 318(sp),d0
    52f4:	d080           	add.l d0,d0
    52f6:	2200           	move.l d0,d1
    52f8:	0681 0000 00ff 	addi.l #255,d1
    52fe:	7000           	moveq #0,d0
    5300:	302f 01c6      	move.w 454(sp),d0
    5304:	2f01           	move.l d1,-(sp)
    5306:	2f00           	move.l d0,-(sp)
    5308:	2f2f 01d0      	move.l 464(sp),-(sp)
    530c:	2f2f 0056      	move.l 86(sp),-(sp)
    5310:	4eba 1798      	jsr 6aaa <TestRow>(pc)
    5314:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5318:	702a           	moveq #42,d0
    531a:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    531e:	202f 013e      	move.l 318(sp),d0
    5322:	0680 0000 0080 	addi.l #128,d0
    5328:	d080           	add.l d0,d0
    532a:	2200           	move.l d0,d1
    532c:	7000           	moveq #0,d0
    532e:	302f 01c6      	move.w 454(sp),d0
    5332:	2f01           	move.l d1,-(sp)
    5334:	2f00           	move.l d0,-(sp)
    5336:	2f2f 01d0      	move.l 464(sp),-(sp)
    533a:	2f2f 0056      	move.l 86(sp),-(sp)
    533e:	4eba 176a      	jsr 6aaa <TestRow>(pc)
    5342:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5346:	722a           	moveq #42,d1
    5348:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    534c:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    5350:	52af 013e      	addq.l #1,318(sp)
    5354:	7006           	moveq #6,d0
    5356:	b0af 013e      	cmp.l 318(sp),d0
    535a:	6c94           	bge.s 52f0 <TestZoom4Picture+0x16a8>
  }
  TestRow( valsupposed, valactual, mask, 269);
    535c:	7000           	moveq #0,d0
    535e:	302f 01c6      	move.w 454(sp),d0
    5362:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5366:	2f00           	move.l d0,-(sp)
    5368:	2f2f 01d0      	move.l 464(sp),-(sp)
    536c:	2f2f 0056      	move.l 86(sp),-(sp)
    5370:	4eba 1738      	jsr 6aaa <TestRow>(pc)
    5374:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5378:	722a           	moveq #42,d1
    537a:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    537e:	466f 01c6      	not.w 454(sp)
 
  tmp = source;
    5382:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5388:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    538e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    5394:	4878 0001      	pea 1 <_start+0x1>
    5398:	4878 0008      	pea 8 <_start+0x8>
    539c:	2f2f 0056      	move.l 86(sp),-(sp)
    53a0:	2f2f 006a      	move.l 106(sp),-(sp)
    53a4:	4eba c652      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    53a8:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    53ac:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    53b2:	2c40           	movea.l d0,a6
    53b4:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    53b8:	202f 004e      	move.l 78(sp),d0
    53bc:	5880           	addq.l #4,d0
    53be:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom9;
    53c2:	2f7c 0000 bb8c 	move.l #48012,74(sp)
    53c8:	004a 
  mask = 0x0000;
    53ca:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    53ce:	7000           	moveq #0,d0
    53d0:	302f 01c6      	move.w 454(sp),d0
    53d4:	42a7           	clr.l -(sp)
    53d6:	2f00           	move.l d0,-(sp)
    53d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    53dc:	2f2f 0056      	move.l 86(sp),-(sp)
    53e0:	4eba 16c8      	jsr 6aaa <TestRow>(pc)
    53e4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    53e8:	722a           	moveq #42,d1
    53ea:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    53ee:	466f 01c6      	not.w 454(sp)
  
  for(int i=0;i<3;i++) {
    53f2:	42af 013a      	clr.l 314(sp)
    53f6:	605c           	bra.s 5454 <TestZoom4Picture+0x180c>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    53f8:	202f 013a      	move.l 314(sp),d0
    53fc:	d080           	add.l d0,d0
    53fe:	2200           	move.l d0,d1
    5400:	5281           	addq.l #1,d1
    5402:	7000           	moveq #0,d0
    5404:	302f 01c6      	move.w 454(sp),d0
    5408:	2f01           	move.l d1,-(sp)
    540a:	2f00           	move.l d0,-(sp)
    540c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5410:	2f2f 0056      	move.l 86(sp),-(sp)
    5414:	4eba 1694      	jsr 6aaa <TestRow>(pc)
    5418:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    541c:	702a           	moveq #42,d0
    541e:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    5422:	202f 013a      	move.l 314(sp),d0
    5426:	5280           	addq.l #1,d0
    5428:	d080           	add.l d0,d0
    542a:	2200           	move.l d0,d1
    542c:	7000           	moveq #0,d0
    542e:	302f 01c6      	move.w 454(sp),d0
    5432:	2f01           	move.l d1,-(sp)
    5434:	2f00           	move.l d0,-(sp)
    5436:	2f2f 01d0      	move.l 464(sp),-(sp)
    543a:	2f2f 0056      	move.l 86(sp),-(sp)
    543e:	4eba 166a      	jsr 6aaa <TestRow>(pc)
    5442:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5446:	722a           	moveq #42,d1
    5448:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    544c:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    5450:	52af 013a      	addq.l #1,314(sp)
    5454:	7002           	moveq #2,d0
    5456:	b0af 013a      	cmp.l 314(sp),d0
    545a:	6c9c           	bge.s 53f8 <TestZoom4Picture+0x17b0>
  }

  for(int i=0;i<9;i++) {
    545c:	42af 0136      	clr.l 310(sp)
    5460:	6000 00ea      	bra.w 554c <TestZoom4Picture+0x1904>
    for(int i2=0;i2<9;i2++) {  
    5464:	42af 0132      	clr.l 306(sp)
    5468:	6044           	bra.s 54ae <TestZoom4Picture+0x1866>
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    546a:	307c 000b      	movea.w #11,a0
    546e:	d1ef 0132      	adda.l 306(sp),a0
    5472:	222f 0136      	move.l 310(sp),d1
    5476:	2001           	move.l d1,d0
    5478:	d080           	add.l d0,d0
    547a:	d081           	add.l d1,d0
    547c:	2200           	move.l d0,d1
    547e:	e789           	lsl.l #3,d1
    5480:	d081           	add.l d1,d0
    5482:	2208           	move.l a0,d1
    5484:	d280           	add.l d0,d1
    5486:	7000           	moveq #0,d0
    5488:	302f 01c6      	move.w 454(sp),d0
    548c:	2f01           	move.l d1,-(sp)
    548e:	2f00           	move.l d0,-(sp)
    5490:	2f2f 01d0      	move.l 464(sp),-(sp)
    5494:	2f2f 0056      	move.l 86(sp),-(sp)
    5498:	4eba 1610      	jsr 6aaa <TestRow>(pc)
    549c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    54a0:	722a           	moveq #42,d1
    54a2:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    54a6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {  
    54aa:	52af 0132      	addq.l #1,306(sp)
    54ae:	7008           	moveq #8,d0
    54b0:	b0af 0132      	cmp.l 306(sp),d0
    54b4:	6cb4           	bge.s 546a <TestZoom4Picture+0x1822>
    }
    
    for(int i2=0;i2<9;i2++) {
    54b6:	42af 012e      	clr.l 302(sp)
    54ba:	6000 0082      	bra.w 553e <TestZoom4Picture+0x18f6>
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    54be:	222f 0136      	move.l 310(sp),d1
    54c2:	2001           	move.l d1,d0
    54c4:	d080           	add.l d0,d0
    54c6:	d081           	add.l d1,d0
    54c8:	2200           	move.l d0,d1
    54ca:	e789           	lsl.l #3,d1
    54cc:	2040           	movea.l d0,a0
    54ce:	d1c1           	adda.l d1,a0
    54d0:	41e8 0014      	lea 20(a0),a0
    54d4:	2208           	move.l a0,d1
    54d6:	d2af 012e      	add.l 302(sp),d1
    54da:	7000           	moveq #0,d0
    54dc:	302f 01c6      	move.w 454(sp),d0
    54e0:	2f01           	move.l d1,-(sp)
    54e2:	2f00           	move.l d0,-(sp)
    54e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    54e8:	2f2f 0056      	move.l 86(sp),-(sp)
    54ec:	4eba 15bc      	jsr 6aaa <TestRow>(pc)
    54f0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    54f4:	722a           	moveq #42,d1
    54f6:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    54fa:	222f 0136      	move.l 310(sp),d1
    54fe:	2001           	move.l d1,d0
    5500:	d080           	add.l d0,d0
    5502:	d081           	add.l d1,d0
    5504:	2200           	move.l d0,d1
    5506:	e789           	lsl.l #3,d1
    5508:	2040           	movea.l d0,a0
    550a:	d1c1           	adda.l d1,a0
    550c:	41e8 0015      	lea 21(a0),a0
    5510:	2208           	move.l a0,d1
    5512:	d2af 012e      	add.l 302(sp),d1
    5516:	7000           	moveq #0,d0
    5518:	302f 01c6      	move.w 454(sp),d0
    551c:	2f01           	move.l d1,-(sp)
    551e:	2f00           	move.l d0,-(sp)
    5520:	2f2f 01d0      	move.l 464(sp),-(sp)
    5524:	2f2f 0056      	move.l 86(sp),-(sp)
    5528:	4eba 1580      	jsr 6aaa <TestRow>(pc)
    552c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5530:	702a           	moveq #42,d0
    5532:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5536:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {
    553a:	52af 012e      	addq.l #1,302(sp)
    553e:	7208           	moveq #8,d1
    5540:	b2af 012e      	cmp.l 302(sp),d1
    5544:	6c00 ff78      	bge.w 54be <TestZoom4Picture+0x1876>
  for(int i=0;i<9;i++) {
    5548:	52af 0136      	addq.l #1,310(sp)
    554c:	7008           	moveq #8,d0
    554e:	b0af 0136      	cmp.l 310(sp),d0
    5552:	6c00 ff10      	bge.w 5464 <TestZoom4Picture+0x181c>
    }
  }

  for(int i2=0;i2<9;i2++) {  
    5556:	42af 012a      	clr.l 298(sp)
    555a:	6032           	bra.s 558e <TestZoom4Picture+0x1946>
    TestRow( valsupposed, valactual, mask, 245+i2);
    555c:	222f 012a      	move.l 298(sp),d1
    5560:	0681 0000 00f5 	addi.l #245,d1
    5566:	7000           	moveq #0,d0
    5568:	302f 01c6      	move.w 454(sp),d0
    556c:	2f01           	move.l d1,-(sp)
    556e:	2f00           	move.l d0,-(sp)
    5570:	2f2f 01d0      	move.l 464(sp),-(sp)
    5574:	2f2f 0056      	move.l 86(sp),-(sp)
    5578:	4eba 1530      	jsr 6aaa <TestRow>(pc)
    557c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5580:	722a           	moveq #42,d1
    5582:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5586:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {  
    558a:	52af 012a      	addq.l #1,298(sp)
    558e:	7008           	moveq #8,d0
    5590:	b0af 012a      	cmp.l 298(sp),d0
    5594:	6cc6           	bge.s 555c <TestZoom4Picture+0x1914>
  }
  for(int i=0;i<5;i++) {
    5596:	42af 0126      	clr.l 294(sp)
    559a:	6064           	bra.s 5600 <TestZoom4Picture+0x19b8>
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    559c:	202f 0126      	move.l 294(sp),d0
    55a0:	d080           	add.l d0,d0
    55a2:	2200           	move.l d0,d1
    55a4:	0681 0000 0103 	addi.l #259,d1
    55aa:	7000           	moveq #0,d0
    55ac:	302f 01c6      	move.w 454(sp),d0
    55b0:	2f01           	move.l d1,-(sp)
    55b2:	2f00           	move.l d0,-(sp)
    55b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    55b8:	2f2f 0056      	move.l 86(sp),-(sp)
    55bc:	4eba 14ec      	jsr 6aaa <TestRow>(pc)
    55c0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    55c4:	722a           	moveq #42,d1
    55c6:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    55ca:	202f 0126      	move.l 294(sp),d0
    55ce:	0680 0000 0082 	addi.l #130,d0
    55d4:	d080           	add.l d0,d0
    55d6:	2200           	move.l d0,d1
    55d8:	7000           	moveq #0,d0
    55da:	302f 01c6      	move.w 454(sp),d0
    55de:	2f01           	move.l d1,-(sp)
    55e0:	2f00           	move.l d0,-(sp)
    55e2:	2f2f 01d0      	move.l 464(sp),-(sp)
    55e6:	2f2f 0056      	move.l 86(sp),-(sp)
    55ea:	4eba 14be      	jsr 6aaa <TestRow>(pc)
    55ee:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    55f2:	702a           	moveq #42,d0
    55f4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    55f8:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    55fc:	52af 0126      	addq.l #1,294(sp)
    5600:	7204           	moveq #4,d1
    5602:	b2af 0126      	cmp.l 294(sp),d1
    5606:	6c94           	bge.s 559c <TestZoom4Picture+0x1954>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5608:	7000           	moveq #0,d0
    560a:	302f 01c6      	move.w 454(sp),d0
    560e:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5612:	2f00           	move.l d0,-(sp)
    5614:	2f2f 01d0      	move.l 464(sp),-(sp)
    5618:	2f2f 0056      	move.l 86(sp),-(sp)
    561c:	4eba 148c      	jsr 6aaa <TestRow>(pc)
    5620:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5624:	702a           	moveq #42,d0
    5626:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    562a:	466f 01c6      	not.w 454(sp)

  tmp = source;
    562e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5634:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    563a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    5640:	4878 0001      	pea 1 <_start+0x1>
    5644:	4878 0009      	pea 9 <_start+0x9>
    5648:	2f2f 0056      	move.l 86(sp),-(sp)
    564c:	2f2f 006a      	move.l 106(sp),-(sp)
    5650:	4eba c3a6      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    5654:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5658:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    565e:	2c40           	movea.l d0,a6
    5660:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5664:	222f 004e      	move.l 78(sp),d1
    5668:	5881           	addq.l #4,d1
    566a:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom10;
    566e:	2f7c 0000 bbb8 	move.l #48056,74(sp)
    5674:	004a 

  mask = 0xffff;
    5676:	3f7c ffff 01c6 	move.w #-1,454(sp)
  TestRow( valsupposed, valactual, mask, 0);
    567c:	7000           	moveq #0,d0
    567e:	302f 01c6      	move.w 454(sp),d0
    5682:	42a7           	clr.l -(sp)
    5684:	2f00           	move.l d0,-(sp)
    5686:	2f2f 01d0      	move.l 464(sp),-(sp)
    568a:	2f2f 0056      	move.l 86(sp),-(sp)
    568e:	4eba 141a      	jsr 6aaa <TestRow>(pc)
    5692:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5696:	702a           	moveq #42,d0
    5698:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    569c:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 1);   
    56a0:	7000           	moveq #0,d0
    56a2:	302f 01c6      	move.w 454(sp),d0
    56a6:	4878 0001      	pea 1 <_start+0x1>
    56aa:	2f00           	move.l d0,-(sp)
    56ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    56b0:	2f2f 0056      	move.l 86(sp),-(sp)
    56b4:	4eba 13f4      	jsr 6aaa <TestRow>(pc)
    56b8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    56bc:	722a           	moveq #42,d1
    56be:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 2);
    56c2:	7000           	moveq #0,d0
    56c4:	302f 01c6      	move.w 454(sp),d0
    56c8:	4878 0002      	pea 2 <_start+0x2>
    56cc:	2f00           	move.l d0,-(sp)
    56ce:	2f2f 01d0      	move.l 464(sp),-(sp)
    56d2:	2f2f 0056      	move.l 86(sp),-(sp)
    56d6:	4eba 13d2      	jsr 6aaa <TestRow>(pc)
    56da:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    56de:	702a           	moveq #42,d0
    56e0:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    56e4:	466f 01c6      	not.w 454(sp)

  for(int i=0;i<9;i++) {
    56e8:	42af 0122      	clr.l 290(sp)
    56ec:	6000 00e0      	bra.w 57ce <TestZoom4Picture+0x1b86>
    for(int i2=0;i2<8;i2++) {  
    56f0:	42af 011e      	clr.l 286(sp)
    56f4:	6040           	bra.s 5736 <TestZoom4Picture+0x1aee>
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    56f6:	206f 011e      	movea.l 286(sp),a0
    56fa:	5688           	addq.l #3,a0
    56fc:	222f 0122      	move.l 290(sp),d1
    5700:	2001           	move.l d1,d0
    5702:	e788           	lsl.l #3,d0
    5704:	9081           	sub.l d1,d0
    5706:	d080           	add.l d0,d0
    5708:	d080           	add.l d0,d0
    570a:	2208           	move.l a0,d1
    570c:	d280           	add.l d0,d1
    570e:	7000           	moveq #0,d0
    5710:	302f 01c6      	move.w 454(sp),d0
    5714:	2f01           	move.l d1,-(sp)
    5716:	2f00           	move.l d0,-(sp)
    5718:	2f2f 01d0      	move.l 464(sp),-(sp)
    571c:	2f2f 0056      	move.l 86(sp),-(sp)
    5720:	4eba 1388      	jsr 6aaa <TestRow>(pc)
    5724:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5728:	722a           	moveq #42,d1
    572a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    572e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {  
    5732:	52af 011e      	addq.l #1,286(sp)
    5736:	7007           	moveq #7,d0
    5738:	b0af 011e      	cmp.l 286(sp),d0
    573c:	6cb8           	bge.s 56f6 <TestZoom4Picture+0x1aae>
    }
    
    for(int i2=0;i2<10;i2++) {
    573e:	42af 011a      	clr.l 282(sp)
    5742:	607c           	bra.s 57c0 <TestZoom4Picture+0x1b78>
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    5744:	222f 0122      	move.l 290(sp),d1
    5748:	2001           	move.l d1,d0
    574a:	e788           	lsl.l #3,d0
    574c:	9081           	sub.l d1,d0
    574e:	d080           	add.l d0,d0
    5750:	d080           	add.l d0,d0
    5752:	2040           	movea.l d0,a0
    5754:	41e8 000b      	lea 11(a0),a0
    5758:	2208           	move.l a0,d1
    575a:	d2af 011a      	add.l 282(sp),d1
    575e:	7000           	moveq #0,d0
    5760:	302f 01c6      	move.w 454(sp),d0
    5764:	2f01           	move.l d1,-(sp)
    5766:	2f00           	move.l d0,-(sp)
    5768:	2f2f 01d0      	move.l 464(sp),-(sp)
    576c:	2f2f 0056      	move.l 86(sp),-(sp)
    5770:	4eba 1338      	jsr 6aaa <TestRow>(pc)
    5774:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5778:	722a           	moveq #42,d1
    577a:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    577e:	222f 0122      	move.l 290(sp),d1
    5782:	2001           	move.l d1,d0
    5784:	e788           	lsl.l #3,d0
    5786:	9081           	sub.l d1,d0
    5788:	d080           	add.l d0,d0
    578a:	d080           	add.l d0,d0
    578c:	2040           	movea.l d0,a0
    578e:	41e8 000b      	lea 11(a0),a0
    5792:	2208           	move.l a0,d1
    5794:	d2af 011a      	add.l 282(sp),d1
    5798:	7000           	moveq #0,d0
    579a:	302f 01c6      	move.w 454(sp),d0
    579e:	2f01           	move.l d1,-(sp)
    57a0:	2f00           	move.l d0,-(sp)
    57a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    57a6:	2f2f 0056      	move.l 86(sp),-(sp)
    57aa:	4eba 12fe      	jsr 6aaa <TestRow>(pc)
    57ae:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    57b2:	702a           	moveq #42,d0
    57b4:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    57b8:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {
    57bc:	52af 011a      	addq.l #1,282(sp)
    57c0:	7209           	moveq #9,d1
    57c2:	b2af 011a      	cmp.l 282(sp),d1
    57c6:	6c00 ff7c      	bge.w 5744 <TestZoom4Picture+0x1afc>
  for(int i=0;i<9;i++) {
    57ca:	52af 0122      	addq.l #1,290(sp)
    57ce:	7008           	moveq #8,d0
    57d0:	b0af 0122      	cmp.l 290(sp),d0
    57d4:	6c00 ff1a      	bge.w 56f0 <TestZoom4Picture+0x1aa8>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    57d8:	42af 0116      	clr.l 278(sp)
    57dc:	6032           	bra.s 5810 <TestZoom4Picture+0x1bc8>
    TestRow( valsupposed, valactual, mask, 255+i2);
    57de:	222f 0116      	move.l 278(sp),d1
    57e2:	0681 0000 00ff 	addi.l #255,d1
    57e8:	7000           	moveq #0,d0
    57ea:	302f 01c6      	move.w 454(sp),d0
    57ee:	2f01           	move.l d1,-(sp)
    57f0:	2f00           	move.l d0,-(sp)
    57f2:	2f2f 01d0      	move.l 464(sp),-(sp)
    57f6:	2f2f 0056      	move.l 86(sp),-(sp)
    57fa:	4eba 12ae      	jsr 6aaa <TestRow>(pc)
    57fe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5802:	722a           	moveq #42,d1
    5804:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5808:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    580c:	52af 0116      	addq.l #1,278(sp)
    5810:	7007           	moveq #7,d0
    5812:	b0af 0116      	cmp.l 278(sp),d0
    5816:	6cc6           	bge.s 57de <TestZoom4Picture+0x1b96>
  }
  for(int i=0;i<3;i++) {
    5818:	42af 0112      	clr.l 274(sp)
    581c:	6064           	bra.s 5882 <TestZoom4Picture+0x1c3a>
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    581e:	202f 0112      	move.l 274(sp),d0
    5822:	d080           	add.l d0,d0
    5824:	2200           	move.l d0,d1
    5826:	0681 0000 0107 	addi.l #263,d1
    582c:	7000           	moveq #0,d0
    582e:	302f 01c6      	move.w 454(sp),d0
    5832:	2f01           	move.l d1,-(sp)
    5834:	2f00           	move.l d0,-(sp)
    5836:	2f2f 01d0      	move.l 464(sp),-(sp)
    583a:	2f2f 0056      	move.l 86(sp),-(sp)
    583e:	4eba 126a      	jsr 6aaa <TestRow>(pc)
    5842:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5846:	722a           	moveq #42,d1
    5848:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    584c:	202f 0112      	move.l 274(sp),d0
    5850:	0680 0000 0084 	addi.l #132,d0
    5856:	d080           	add.l d0,d0
    5858:	2200           	move.l d0,d1
    585a:	7000           	moveq #0,d0
    585c:	302f 01c6      	move.w 454(sp),d0
    5860:	2f01           	move.l d1,-(sp)
    5862:	2f00           	move.l d0,-(sp)
    5864:	2f2f 01d0      	move.l 464(sp),-(sp)
    5868:	2f2f 0056      	move.l 86(sp),-(sp)
    586c:	4eba 123c      	jsr 6aaa <TestRow>(pc)
    5870:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5874:	702a           	moveq #42,d0
    5876:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    587a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    587e:	52af 0112      	addq.l #1,274(sp)
    5882:	7202           	moveq #2,d1
    5884:	b2af 0112      	cmp.l 274(sp),d1
    5888:	6c94           	bge.s 581e <TestZoom4Picture+0x1bd6>
  }

  tmp = source;
    588a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5890:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5896:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    589c:	4878 0001      	pea 1 <_start+0x1>
    58a0:	4878 000a      	pea a <_start+0xa>
    58a4:	2f2f 0056      	move.l 86(sp),-(sp)
    58a8:	2f2f 006a      	move.l 106(sp),-(sp)
    58ac:	4eba c14a      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    58b0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    58b4:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    58ba:	2c40           	movea.l d0,a6
    58bc:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    58c0:	202f 004e      	move.l 78(sp),d0
    58c4:	5880           	addq.l #4,d0
    58c6:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom11;
    58ca:	2f7c 0000 bbe4 	move.l #48100,74(sp)
    58d0:	004a 

  mask = 0xffff;
    58d2:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  for(int i2=0;i2<6;i2++) {  
    58d8:	42af 010e      	clr.l 270(sp)
    58dc:	602a           	bra.s 5908 <TestZoom4Picture+0x1cc0>
    TestRow( valsupposed, valactual, mask, i2);
    58de:	7000           	moveq #0,d0
    58e0:	302f 01c6      	move.w 454(sp),d0
    58e4:	2f2f 010e      	move.l 270(sp),-(sp)
    58e8:	2f00           	move.l d0,-(sp)
    58ea:	2f2f 01d0      	move.l 464(sp),-(sp)
    58ee:	2f2f 0056      	move.l 86(sp),-(sp)
    58f2:	4eba 11b6      	jsr 6aaa <TestRow>(pc)
    58f6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    58fa:	722a           	moveq #42,d1
    58fc:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5900:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {  
    5904:	52af 010e      	addq.l #1,270(sp)
    5908:	7005           	moveq #5,d0
    590a:	b0af 010e      	cmp.l 270(sp),d0
    590e:	6cce           	bge.s 58de <TestZoom4Picture+0x1c96>
  }

  for(int i2=0;i2<11;i2++) {
    5910:	42af 010a      	clr.l 266(sp)
    5914:	605c           	bra.s 5972 <TestZoom4Picture+0x1d2a>
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    5916:	202f 010a      	move.l 266(sp),d0
    591a:	5680           	addq.l #3,d0
    591c:	d080           	add.l d0,d0
    591e:	2200           	move.l d0,d1
    5920:	7000           	moveq #0,d0
    5922:	302f 01c6      	move.w 454(sp),d0
    5926:	2f01           	move.l d1,-(sp)
    5928:	2f00           	move.l d0,-(sp)
    592a:	2f2f 01d0      	move.l 464(sp),-(sp)
    592e:	2f2f 0056      	move.l 86(sp),-(sp)
    5932:	4eba 1176      	jsr 6aaa <TestRow>(pc)
    5936:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    593a:	722a           	moveq #42,d1
    593c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    5940:	202f 010a      	move.l 266(sp),d0
    5944:	d080           	add.l d0,d0
    5946:	2200           	move.l d0,d1
    5948:	5e81           	addq.l #7,d1
    594a:	7000           	moveq #0,d0
    594c:	302f 01c6      	move.w 454(sp),d0
    5950:	2f01           	move.l d1,-(sp)
    5952:	2f00           	move.l d0,-(sp)
    5954:	2f2f 01d0      	move.l 464(sp),-(sp)
    5958:	2f2f 0056      	move.l 86(sp),-(sp)
    595c:	4eba 114c      	jsr 6aaa <TestRow>(pc)
    5960:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5964:	702a           	moveq #42,d0
    5966:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    596a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    596e:	52af 010a      	addq.l #1,266(sp)
    5972:	720a           	moveq #10,d1
    5974:	b2af 010a      	cmp.l 266(sp),d1
    5978:	6c9c           	bge.s 5916 <TestZoom4Picture+0x1cce>
  }

  for(int i=0;i<8;i++) {
    597a:	42af 0106      	clr.l 262(sp)
    597e:	6000 00f2      	bra.w 5a72 <TestZoom4Picture+0x1e2a>
    for(int i2=0;i2<7;i2++) {  
    5982:	42af 0102      	clr.l 258(sp)
    5986:	6044           	bra.s 59cc <TestZoom4Picture+0x1d84>
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    5988:	307c 001c      	movea.w #28,a0
    598c:	d1ef 0102      	adda.l 258(sp),a0
    5990:	222f 0106      	move.l 262(sp),d1
    5994:	2001           	move.l d1,d0
    5996:	e788           	lsl.l #3,d0
    5998:	9081           	sub.l d1,d0
    599a:	d080           	add.l d0,d0
    599c:	d080           	add.l d0,d0
    599e:	d081           	add.l d1,d0
    59a0:	2208           	move.l a0,d1
    59a2:	d280           	add.l d0,d1
    59a4:	7000           	moveq #0,d0
    59a6:	302f 01c6      	move.w 454(sp),d0
    59aa:	2f01           	move.l d1,-(sp)
    59ac:	2f00           	move.l d0,-(sp)
    59ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    59b2:	2f2f 0056      	move.l 86(sp),-(sp)
    59b6:	4eba 10f2      	jsr 6aaa <TestRow>(pc)
    59ba:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    59be:	702a           	moveq #42,d0
    59c0:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    59c4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<7;i2++) {  
    59c8:	52af 0102      	addq.l #1,258(sp)
    59cc:	7206           	moveq #6,d1
    59ce:	b2af 0102      	cmp.l 258(sp),d1
    59d2:	6cb4           	bge.s 5988 <TestZoom4Picture+0x1d40>
    }
    
    for(int i2=0;i2<11;i2++) {
    59d4:	42af 00fe      	clr.l 254(sp)
    59d8:	6000 008a      	bra.w 5a64 <TestZoom4Picture+0x1e1c>
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    59dc:	222f 0106      	move.l 262(sp),d1
    59e0:	2001           	move.l d1,d0
    59e2:	e788           	lsl.l #3,d0
    59e4:	9081           	sub.l d1,d0
    59e6:	d080           	add.l d0,d0
    59e8:	d080           	add.l d0,d0
    59ea:	2040           	movea.l d0,a0
    59ec:	d1c1           	adda.l d1,a0
    59ee:	41e8 0023      	lea 35(a0),a0
    59f2:	202f 00fe      	move.l 254(sp),d0
    59f6:	d080           	add.l d0,d0
    59f8:	2208           	move.l a0,d1
    59fa:	d280           	add.l d0,d1
    59fc:	7000           	moveq #0,d0
    59fe:	302f 01c6      	move.w 454(sp),d0
    5a02:	2f01           	move.l d1,-(sp)
    5a04:	2f00           	move.l d0,-(sp)
    5a06:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a0a:	2f2f 0056      	move.l 86(sp),-(sp)
    5a0e:	4eba 109a      	jsr 6aaa <TestRow>(pc)
    5a12:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a16:	702a           	moveq #42,d0
    5a18:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    5a1c:	222f 0106      	move.l 262(sp),d1
    5a20:	2001           	move.l d1,d0
    5a22:	e788           	lsl.l #3,d0
    5a24:	9081           	sub.l d1,d0
    5a26:	d080           	add.l d0,d0
    5a28:	d080           	add.l d0,d0
    5a2a:	2040           	movea.l d0,a0
    5a2c:	d1c1           	adda.l d1,a0
    5a2e:	41e8 000b      	lea 11(a0),a0
    5a32:	202f 00fe      	move.l 254(sp),d0
    5a36:	d080           	add.l d0,d0
    5a38:	2208           	move.l a0,d1
    5a3a:	d280           	add.l d0,d1
    5a3c:	7000           	moveq #0,d0
    5a3e:	302f 01c6      	move.w 454(sp),d0
    5a42:	2f01           	move.l d1,-(sp)
    5a44:	2f00           	move.l d0,-(sp)
    5a46:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a4a:	2f2f 0056      	move.l 86(sp),-(sp)
    5a4e:	4eba 105a      	jsr 6aaa <TestRow>(pc)
    5a52:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a56:	722a           	moveq #42,d1
    5a58:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5a5c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {
    5a60:	52af 00fe      	addq.l #1,254(sp)
    5a64:	700a           	moveq #10,d0
    5a66:	b0af 00fe      	cmp.l 254(sp),d0
    5a6a:	6c00 ff70      	bge.w 59dc <TestZoom4Picture+0x1d94>
  for(int i=0;i<8;i++) {
    5a6e:	52af 0106      	addq.l #1,262(sp)
    5a72:	7207           	moveq #7,d1
    5a74:	b2af 0106      	cmp.l 262(sp),d1
    5a78:	6c00 ff08      	bge.w 5982 <TestZoom4Picture+0x1d3a>
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    5a7c:	42af 00fa      	clr.l 250(sp)
    5a80:	6032           	bra.s 5ab4 <TestZoom4Picture+0x1e6c>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5a82:	222f 00fa      	move.l 250(sp),d1
    5a86:	0681 0000 0104 	addi.l #260,d1
    5a8c:	7000           	moveq #0,d0
    5a8e:	302f 01c6      	move.w 454(sp),d0
    5a92:	2f01           	move.l d1,-(sp)
    5a94:	2f00           	move.l d0,-(sp)
    5a96:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a9a:	2f2f 0056      	move.l 86(sp),-(sp)
    5a9e:	4eba 100a      	jsr 6aaa <TestRow>(pc)
    5aa2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5aa6:	702a           	moveq #42,d0
    5aa8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5aac:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    5ab0:	52af 00fa      	addq.l #1,250(sp)
    5ab4:	7206           	moveq #6,d1
    5ab6:	b2af 00fa      	cmp.l 250(sp),d1
    5aba:	6cc6           	bge.s 5a82 <TestZoom4Picture+0x1e3a>
  }
  TestRow( valsupposed, valactual, mask, 267);   
    5abc:	7000           	moveq #0,d0
    5abe:	302f 01c6      	move.w 454(sp),d0
    5ac2:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    5ac6:	2f00           	move.l d0,-(sp)
    5ac8:	2f2f 01d0      	move.l 464(sp),-(sp)
    5acc:	2f2f 0056      	move.l 86(sp),-(sp)
    5ad0:	4eba 0fd8      	jsr 6aaa <TestRow>(pc)
    5ad4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5ad8:	702a           	moveq #42,d0
    5ada:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 268);
    5ade:	7000           	moveq #0,d0
    5ae0:	302f 01c6      	move.w 454(sp),d0
    5ae4:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    5ae8:	2f00           	move.l d0,-(sp)
    5aea:	2f2f 01d0      	move.l 464(sp),-(sp)
    5aee:	2f2f 0056      	move.l 86(sp),-(sp)
    5af2:	4eba 0fb6      	jsr 6aaa <TestRow>(pc)
    5af6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5afa:	722a           	moveq #42,d1
    5afc:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5b00:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 269);
    5b04:	7000           	moveq #0,d0
    5b06:	302f 01c6      	move.w 454(sp),d0
    5b0a:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5b0e:	2f00           	move.l d0,-(sp)
    5b10:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b14:	2f2f 0056      	move.l 86(sp),-(sp)
    5b18:	4eba 0f90      	jsr 6aaa <TestRow>(pc)
    5b1c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b20:	702a           	moveq #42,d0
    5b22:	d1af 01c8      	add.l d0,456(sp)
  
  tmp = source;
    5b26:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5b2c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5b32:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    5b38:	4878 0001      	pea 1 <_start+0x1>
    5b3c:	4878 000b      	pea b <_start+0xb>
    5b40:	2f2f 0056      	move.l 86(sp),-(sp)
    5b44:	2f2f 006a      	move.l 106(sp),-(sp)
    5b48:	4eba beae      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    5b4c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5b50:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    5b56:	2c40           	movea.l d0,a6
    5b58:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5b5c:	222f 004e      	move.l 78(sp),d1
    5b60:	5881           	addq.l #4,d1
    5b62:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom12;
    5b66:	2f7c 0000 bc10 	move.l #48144,74(sp)
    5b6c:	004a 

  mask = 0x0;
    5b6e:	426f 01c6      	clr.w 454(sp)
   
  TestRow( valsupposed, valactual, mask, 0);
    5b72:	7000           	moveq #0,d0
    5b74:	302f 01c6      	move.w 454(sp),d0
    5b78:	42a7           	clr.l -(sp)
    5b7a:	2f00           	move.l d0,-(sp)
    5b7c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b80:	2f2f 0056      	move.l 86(sp),-(sp)
    5b84:	4eba 0f24      	jsr 6aaa <TestRow>(pc)
    5b88:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b8c:	702a           	moveq #42,d0
    5b8e:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5b92:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<12;i2++) {
    5b96:	42af 00f6      	clr.l 246(sp)
    5b9a:	605c           	bra.s 5bf8 <TestZoom4Picture+0x1fb0>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5b9c:	202f 00f6      	move.l 246(sp),d0
    5ba0:	d080           	add.l d0,d0
    5ba2:	2200           	move.l d0,d1
    5ba4:	5281           	addq.l #1,d1
    5ba6:	7000           	moveq #0,d0
    5ba8:	302f 01c6      	move.w 454(sp),d0
    5bac:	2f01           	move.l d1,-(sp)
    5bae:	2f00           	move.l d0,-(sp)
    5bb0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bb4:	2f2f 0056      	move.l 86(sp),-(sp)
    5bb8:	4eba 0ef0      	jsr 6aaa <TestRow>(pc)
    5bbc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5bc0:	722a           	moveq #42,d1
    5bc2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5bc6:	202f 00f6      	move.l 246(sp),d0
    5bca:	5280           	addq.l #1,d0
    5bcc:	d080           	add.l d0,d0
    5bce:	2200           	move.l d0,d1
    5bd0:	7000           	moveq #0,d0
    5bd2:	302f 01c6      	move.w 454(sp),d0
    5bd6:	2f01           	move.l d1,-(sp)
    5bd8:	2f00           	move.l d0,-(sp)
    5bda:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bde:	2f2f 0056      	move.l 86(sp),-(sp)
    5be2:	4eba 0ec6      	jsr 6aaa <TestRow>(pc)
    5be6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5bea:	702a           	moveq #42,d0
    5bec:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5bf0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    5bf4:	52af 00f6      	addq.l #1,246(sp)
    5bf8:	720b           	moveq #11,d1
    5bfa:	b2af 00f6      	cmp.l 246(sp),d1
    5bfe:	6c9c           	bge.s 5b9c <TestZoom4Picture+0x1f54>
  } 

  for(int i=0;i<8;i++) {
    5c00:	42af 00f2      	clr.l 242(sp)
    5c04:	6000 00e6      	bra.w 5cec <TestZoom4Picture+0x20a4>
    for(int i2=0;i2<6;i2++) {  
    5c08:	42af 00ee      	clr.l 238(sp)
    5c0c:	6040           	bra.s 5c4e <TestZoom4Picture+0x2006>
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    5c0e:	307c 0019      	movea.w #25,a0
    5c12:	d1ef 00ee      	adda.l 238(sp),a0
    5c16:	222f 00f2      	move.l 242(sp),d1
    5c1a:	2001           	move.l d1,d0
    5c1c:	e988           	lsl.l #4,d0
    5c1e:	9081           	sub.l d1,d0
    5c20:	d080           	add.l d0,d0
    5c22:	2208           	move.l a0,d1
    5c24:	d280           	add.l d0,d1
    5c26:	7000           	moveq #0,d0
    5c28:	302f 01c6      	move.w 454(sp),d0
    5c2c:	2f01           	move.l d1,-(sp)
    5c2e:	2f00           	move.l d0,-(sp)
    5c30:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c34:	2f2f 0056      	move.l 86(sp),-(sp)
    5c38:	4eba 0e70      	jsr 6aaa <TestRow>(pc)
    5c3c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5c40:	702a           	moveq #42,d0
    5c42:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5c46:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<6;i2++) {  
    5c4a:	52af 00ee      	addq.l #1,238(sp)
    5c4e:	7205           	moveq #5,d1
    5c50:	b2af 00ee      	cmp.l 238(sp),d1
    5c54:	6cb8           	bge.s 5c0e <TestZoom4Picture+0x1fc6>
    }
    
    for(int i2=0;i2<12;i2++) {
    5c56:	42af 00ea      	clr.l 234(sp)
    5c5a:	6000 0082      	bra.w 5cde <TestZoom4Picture+0x2096>
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    5c5e:	222f 00f2      	move.l 242(sp),d1
    5c62:	2001           	move.l d1,d0
    5c64:	e988           	lsl.l #4,d0
    5c66:	9081           	sub.l d1,d0
    5c68:	d080           	add.l d0,d0
    5c6a:	2040           	movea.l d0,a0
    5c6c:	41e8 001f      	lea 31(a0),a0
    5c70:	202f 00ea      	move.l 234(sp),d0
    5c74:	d080           	add.l d0,d0
    5c76:	2208           	move.l a0,d1
    5c78:	d280           	add.l d0,d1
    5c7a:	7000           	moveq #0,d0
    5c7c:	302f 01c6      	move.w 454(sp),d0
    5c80:	2f01           	move.l d1,-(sp)
    5c82:	2f00           	move.l d0,-(sp)
    5c84:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c88:	2f2f 0056      	move.l 86(sp),-(sp)
    5c8c:	4eba 0e1c      	jsr 6aaa <TestRow>(pc)
    5c90:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5c94:	702a           	moveq #42,d0
    5c96:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    5c9a:	222f 00f2      	move.l 242(sp),d1
    5c9e:	2001           	move.l d1,d0
    5ca0:	e988           	lsl.l #4,d0
    5ca2:	9081           	sub.l d1,d0
    5ca4:	d080           	add.l d0,d0
    5ca6:	2040           	movea.l d0,a0
    5ca8:	41e8 0020      	lea 32(a0),a0
    5cac:	202f 00ea      	move.l 234(sp),d0
    5cb0:	d080           	add.l d0,d0
    5cb2:	2208           	move.l a0,d1
    5cb4:	d280           	add.l d0,d1
    5cb6:	7000           	moveq #0,d0
    5cb8:	302f 01c6      	move.w 454(sp),d0
    5cbc:	2f01           	move.l d1,-(sp)
    5cbe:	2f00           	move.l d0,-(sp)
    5cc0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5cc4:	2f2f 0056      	move.l 86(sp),-(sp)
    5cc8:	4eba 0de0      	jsr 6aaa <TestRow>(pc)
    5ccc:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5cd0:	722a           	moveq #42,d1
    5cd2:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5cd6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {
    5cda:	52af 00ea      	addq.l #1,234(sp)
    5cde:	700b           	moveq #11,d0
    5ce0:	b0af 00ea      	cmp.l 234(sp),d0
    5ce4:	6c00 ff78      	bge.w 5c5e <TestZoom4Picture+0x2016>
  for(int i=0;i<8;i++) {
    5ce8:	52af 00f2      	addq.l #1,242(sp)
    5cec:	7207           	moveq #7,d1
    5cee:	b2af 00f2      	cmp.l 242(sp),d1
    5cf2:	6c00 ff14      	bge.w 5c08 <TestZoom4Picture+0x1fc0>
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    5cf6:	42af 00e6      	clr.l 230(sp)
    5cfa:	6032           	bra.s 5d2e <TestZoom4Picture+0x20e6>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5cfc:	222f 00e6      	move.l 230(sp),d1
    5d00:	0681 0000 0104 	addi.l #260,d1
    5d06:	7000           	moveq #0,d0
    5d08:	302f 01c6      	move.w 454(sp),d0
    5d0c:	2f01           	move.l d1,-(sp)
    5d0e:	2f00           	move.l d0,-(sp)
    5d10:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d14:	2f2f 0056      	move.l 86(sp),-(sp)
    5d18:	4eba 0d90      	jsr 6aaa <TestRow>(pc)
    5d1c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5d20:	702a           	moveq #42,d0
    5d22:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5d26:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5d2a:	52af 00e6      	addq.l #1,230(sp)
    5d2e:	7204           	moveq #4,d1
    5d30:	b2af 00e6      	cmp.l 230(sp),d1
    5d34:	6cc6           	bge.s 5cfc <TestZoom4Picture+0x20b4>
  }

  tmp = source;
    5d36:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5d3c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5d42:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    5d48:	4878 0001      	pea 1 <_start+0x1>
    5d4c:	4878 000c      	pea c <_start+0xc>
    5d50:	2f2f 0056      	move.l 86(sp),-(sp)
    5d54:	2f2f 006a      	move.l 106(sp),-(sp)
    5d58:	4eba bc9e      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    5d5c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5d60:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    5d66:	2c40           	movea.l d0,a6
    5d68:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5d6c:	202f 004e      	move.l 78(sp),d0
    5d70:	5880           	addq.l #4,d0
    5d72:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom13;
    5d76:	2f7c 0000 bc3c 	move.l #48188,74(sp)
    5d7c:	004a 

  mask = 0xffff;
    5d7e:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<11;i2++) {
    5d84:	42af 00e2      	clr.l 226(sp)
    5d88:	605a           	bra.s 5de4 <TestZoom4Picture+0x219c>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    5d8a:	202f 00e2      	move.l 226(sp),d0
    5d8e:	d080           	add.l d0,d0
    5d90:	2200           	move.l d0,d1
    5d92:	7000           	moveq #0,d0
    5d94:	302f 01c6      	move.w 454(sp),d0
    5d98:	2f01           	move.l d1,-(sp)
    5d9a:	2f00           	move.l d0,-(sp)
    5d9c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5da0:	2f2f 0056      	move.l 86(sp),-(sp)
    5da4:	4eba 0d04      	jsr 6aaa <TestRow>(pc)
    5da8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5dac:	722a           	moveq #42,d1
    5dae:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    5db2:	202f 00e2      	move.l 226(sp),d0
    5db6:	d080           	add.l d0,d0
    5db8:	2200           	move.l d0,d1
    5dba:	5281           	addq.l #1,d1
    5dbc:	7000           	moveq #0,d0
    5dbe:	302f 01c6      	move.w 454(sp),d0
    5dc2:	2f01           	move.l d1,-(sp)
    5dc4:	2f00           	move.l d0,-(sp)
    5dc6:	2f2f 01d0      	move.l 464(sp),-(sp)
    5dca:	2f2f 0056      	move.l 86(sp),-(sp)
    5dce:	4eba 0cda      	jsr 6aaa <TestRow>(pc)
    5dd2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5dd6:	702a           	moveq #42,d0
    5dd8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5ddc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5de0:	52af 00e2      	addq.l #1,226(sp)
    5de4:	720a           	moveq #10,d1
    5de6:	b2af 00e2      	cmp.l 226(sp),d1
    5dea:	6c9e           	bge.s 5d8a <TestZoom4Picture+0x2142>
  } 

  for(int i=0;i<8;i++) {
    5dec:	42af 00de      	clr.l 222(sp)
    5df0:	6000 00de      	bra.w 5ed0 <TestZoom4Picture+0x2288>
    for(int i2=0;i2<5;i2++) {  
    5df4:	42af 00da      	clr.l 218(sp)
    5df8:	603e           	bra.s 5e38 <TestZoom4Picture+0x21f0>
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    5dfa:	307c 0016      	movea.w #22,a0
    5dfe:	d1ef 00da      	adda.l 218(sp),a0
    5e02:	222f 00de      	move.l 222(sp),d1
    5e06:	2001           	move.l d1,d0
    5e08:	eb88           	lsl.l #5,d0
    5e0a:	9081           	sub.l d1,d0
    5e0c:	2208           	move.l a0,d1
    5e0e:	d280           	add.l d0,d1
    5e10:	7000           	moveq #0,d0
    5e12:	302f 01c6      	move.w 454(sp),d0
    5e16:	2f01           	move.l d1,-(sp)
    5e18:	2f00           	move.l d0,-(sp)
    5e1a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e1e:	2f2f 0056      	move.l 86(sp),-(sp)
    5e22:	4eba 0c86      	jsr 6aaa <TestRow>(pc)
    5e26:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5e2a:	702a           	moveq #42,d0
    5e2c:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5e30:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<5;i2++) {  
    5e34:	52af 00da      	addq.l #1,218(sp)
    5e38:	7204           	moveq #4,d1
    5e3a:	b2af 00da      	cmp.l 218(sp),d1
    5e3e:	6cba           	bge.s 5dfa <TestZoom4Picture+0x21b2>
    }
    
    for(int i2=0;i2<13;i2++) {
    5e40:	42af 00d6      	clr.l 214(sp)
    5e44:	607c           	bra.s 5ec2 <TestZoom4Picture+0x227a>
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    5e46:	222f 00de      	move.l 222(sp),d1
    5e4a:	2001           	move.l d1,d0
    5e4c:	eb88           	lsl.l #5,d0
    5e4e:	2040           	movea.l d0,a0
    5e50:	91c1           	suba.l d1,a0
    5e52:	41e8 001b      	lea 27(a0),a0
    5e56:	202f 00d6      	move.l 214(sp),d0
    5e5a:	d080           	add.l d0,d0
    5e5c:	2208           	move.l a0,d1
    5e5e:	d280           	add.l d0,d1
    5e60:	7000           	moveq #0,d0
    5e62:	302f 01c6      	move.w 454(sp),d0
    5e66:	2f01           	move.l d1,-(sp)
    5e68:	2f00           	move.l d0,-(sp)
    5e6a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e6e:	2f2f 0056      	move.l 86(sp),-(sp)
    5e72:	4eba 0c36      	jsr 6aaa <TestRow>(pc)
    5e76:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5e7a:	702a           	moveq #42,d0
    5e7c:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    5e80:	222f 00de      	move.l 222(sp),d1
    5e84:	2001           	move.l d1,d0
    5e86:	eb88           	lsl.l #5,d0
    5e88:	2040           	movea.l d0,a0
    5e8a:	91c1           	suba.l d1,a0
    5e8c:	41e8 001c      	lea 28(a0),a0
    5e90:	202f 00d6      	move.l 214(sp),d0
    5e94:	d080           	add.l d0,d0
    5e96:	2208           	move.l a0,d1
    5e98:	d280           	add.l d0,d1
    5e9a:	7000           	moveq #0,d0
    5e9c:	302f 01c6      	move.w 454(sp),d0
    5ea0:	2f01           	move.l d1,-(sp)
    5ea2:	2f00           	move.l d0,-(sp)
    5ea4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ea8:	2f2f 0056      	move.l 86(sp),-(sp)
    5eac:	4eba 0bfc      	jsr 6aaa <TestRow>(pc)
    5eb0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5eb4:	722a           	moveq #42,d1
    5eb6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5eba:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {
    5ebe:	52af 00d6      	addq.l #1,214(sp)
    5ec2:	700c           	moveq #12,d0
    5ec4:	b0af 00d6      	cmp.l 214(sp),d0
    5ec8:	6c00 ff7c      	bge.w 5e46 <TestZoom4Picture+0x21fe>
  for(int i=0;i<8;i++) {
    5ecc:	52af 00de      	addq.l #1,222(sp)
    5ed0:	7207           	moveq #7,d1
    5ed2:	b2af 00de      	cmp.l 222(sp),d1
    5ed6:	6c00 ff1c      	bge.w 5df4 <TestZoom4Picture+0x21ac>
    }
  } 

  tmp = source;
    5eda:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5ee0:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5ee6:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    5eec:	4878 0001      	pea 1 <_start+0x1>
    5ef0:	4878 000d      	pea d <_start+0xd>
    5ef4:	2f2f 0056      	move.l 86(sp),-(sp)
    5ef8:	2f2f 006a      	move.l 106(sp),-(sp)
    5efc:	4eba bafa      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    5f00:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5f04:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    5f0a:	2c40           	movea.l d0,a6
    5f0c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5f10:	202f 004e      	move.l 78(sp),d0
    5f14:	5880           	addq.l #4,d0
    5f16:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom14;
    5f1a:	2f7c 0000 bc68 	move.l #48232,74(sp)
    5f20:	004a 

  mask = 0xffff;
    5f22:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    5f28:	7000           	moveq #0,d0
    5f2a:	302f 01c6      	move.w 454(sp),d0
    5f2e:	42a7           	clr.l -(sp)
    5f30:	2f00           	move.l d0,-(sp)
    5f32:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f36:	2f2f 0056      	move.l 86(sp),-(sp)
    5f3a:	4eba 0b6e      	jsr 6aaa <TestRow>(pc)
    5f3e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2; 
    5f42:	722a           	moveq #42,d1
    5f44:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff; 
    5f48:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<9;i2++) {
    5f4c:	42af 00d2      	clr.l 210(sp)
    5f50:	605c           	bra.s 5fae <TestZoom4Picture+0x2366>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5f52:	202f 00d2      	move.l 210(sp),d0
    5f56:	d080           	add.l d0,d0
    5f58:	2200           	move.l d0,d1
    5f5a:	5281           	addq.l #1,d1
    5f5c:	7000           	moveq #0,d0
    5f5e:	302f 01c6      	move.w 454(sp),d0
    5f62:	2f01           	move.l d1,-(sp)
    5f64:	2f00           	move.l d0,-(sp)
    5f66:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f6a:	2f2f 0056      	move.l 86(sp),-(sp)
    5f6e:	4eba 0b3a      	jsr 6aaa <TestRow>(pc)
    5f72:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5f76:	702a           	moveq #42,d0
    5f78:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5f7c:	202f 00d2      	move.l 210(sp),d0
    5f80:	5280           	addq.l #1,d0
    5f82:	d080           	add.l d0,d0
    5f84:	2200           	move.l d0,d1
    5f86:	7000           	moveq #0,d0
    5f88:	302f 01c6      	move.w 454(sp),d0
    5f8c:	2f01           	move.l d1,-(sp)
    5f8e:	2f00           	move.l d0,-(sp)
    5f90:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f94:	2f2f 0056      	move.l 86(sp),-(sp)
    5f98:	4eba 0b10      	jsr 6aaa <TestRow>(pc)
    5f9c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5fa0:	722a           	moveq #42,d1
    5fa2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5fa6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {
    5faa:	52af 00d2      	addq.l #1,210(sp)
    5fae:	7008           	moveq #8,d0
    5fb0:	b0af 00d2      	cmp.l 210(sp),d0
    5fb4:	6c9c           	bge.s 5f52 <TestZoom4Picture+0x230a>
  } 

  for(int i=0;i<7;i++) {
    5fb6:	42af 00ce      	clr.l 206(sp)
    5fba:	6000 00cc      	bra.w 6088 <TestZoom4Picture+0x2440>
    for(int i2=0;i2<4;i2++) {  
    5fbe:	42af 00ca      	clr.l 202(sp)
    5fc2:	6036           	bra.s 5ffa <TestZoom4Picture+0x23b2>
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    5fc4:	7213           	moveq #19,d1
    5fc6:	d2af 00ca      	add.l 202(sp),d1
    5fca:	202f 00ce      	move.l 206(sp),d0
    5fce:	eb88           	lsl.l #5,d0
    5fd0:	d280           	add.l d0,d1
    5fd2:	7000           	moveq #0,d0
    5fd4:	302f 01c6      	move.w 454(sp),d0
    5fd8:	2f01           	move.l d1,-(sp)
    5fda:	2f00           	move.l d0,-(sp)
    5fdc:	2f2f 01d0      	move.l 464(sp),-(sp)
    5fe0:	2f2f 0056      	move.l 86(sp),-(sp)
    5fe4:	4eba 0ac4      	jsr 6aaa <TestRow>(pc)
    5fe8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5fec:	722a           	moveq #42,d1
    5fee:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5ff2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<4;i2++) {  
    5ff6:	52af 00ca      	addq.l #1,202(sp)
    5ffa:	7003           	moveq #3,d0
    5ffc:	b0af 00ca      	cmp.l 202(sp),d0
    6000:	6cc2           	bge.s 5fc4 <TestZoom4Picture+0x237c>
    }
    
    for(int i2=0;i2<14;i2++) {
    6002:	42af 00c6      	clr.l 198(sp)
    6006:	6074           	bra.s 607c <TestZoom4Picture+0x2434>
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    6008:	202f 00ce      	move.l 206(sp),d0
    600c:	eb88           	lsl.l #5,d0
    600e:	307c 0017      	movea.w #23,a0
    6012:	d1c0           	adda.l d0,a0
    6014:	202f 00c6      	move.l 198(sp),d0
    6018:	d080           	add.l d0,d0
    601a:	2208           	move.l a0,d1
    601c:	d280           	add.l d0,d1
    601e:	7000           	moveq #0,d0
    6020:	302f 01c6      	move.w 454(sp),d0
    6024:	2f01           	move.l d1,-(sp)
    6026:	2f00           	move.l d0,-(sp)
    6028:	2f2f 01d0      	move.l 464(sp),-(sp)
    602c:	2f2f 0056      	move.l 86(sp),-(sp)
    6030:	4eba 0a78      	jsr 6aaa <TestRow>(pc)
    6034:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6038:	722a           	moveq #42,d1
    603a:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    603e:	202f 00ce      	move.l 206(sp),d0
    6042:	eb88           	lsl.l #5,d0
    6044:	307c 0018      	movea.w #24,a0
    6048:	d1c0           	adda.l d0,a0
    604a:	202f 00c6      	move.l 198(sp),d0
    604e:	d080           	add.l d0,d0
    6050:	2208           	move.l a0,d1
    6052:	d280           	add.l d0,d1
    6054:	7000           	moveq #0,d0
    6056:	302f 01c6      	move.w 454(sp),d0
    605a:	2f01           	move.l d1,-(sp)
    605c:	2f00           	move.l d0,-(sp)
    605e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6062:	2f2f 0056      	move.l 86(sp),-(sp)
    6066:	4eba 0a42      	jsr 6aaa <TestRow>(pc)
    606a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    606e:	702a           	moveq #42,d0
    6070:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6074:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {
    6078:	52af 00c6      	addq.l #1,198(sp)
    607c:	720d           	moveq #13,d1
    607e:	b2af 00c6      	cmp.l 198(sp),d1
    6082:	6c84           	bge.s 6008 <TestZoom4Picture+0x23c0>
  for(int i=0;i<7;i++) {
    6084:	52af 00ce      	addq.l #1,206(sp)
    6088:	7006           	moveq #6,d0
    608a:	b0af 00ce      	cmp.l 206(sp),d0
    608e:	6c00 ff2e      	bge.w 5fbe <TestZoom4Picture+0x2376>
    }
  }

  for(int i2=0;i2<4;i2++) {  
    6092:	42af 00c2      	clr.l 194(sp)
    6096:	6032           	bra.s 60ca <TestZoom4Picture+0x2482>
    TestRow( valsupposed, valactual, mask, 243+i2);
    6098:	222f 00c2      	move.l 194(sp),d1
    609c:	0681 0000 00f3 	addi.l #243,d1
    60a2:	7000           	moveq #0,d0
    60a4:	302f 01c6      	move.w 454(sp),d0
    60a8:	2f01           	move.l d1,-(sp)
    60aa:	2f00           	move.l d0,-(sp)
    60ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    60b0:	2f2f 0056      	move.l 86(sp),-(sp)
    60b4:	4eba 09f4      	jsr 6aaa <TestRow>(pc)
    60b8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    60bc:	722a           	moveq #42,d1
    60be:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    60c2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {  
    60c6:	52af 00c2      	addq.l #1,194(sp)
    60ca:	7003           	moveq #3,d0
    60cc:	b0af 00c2      	cmp.l 194(sp),d0
    60d0:	6cc6           	bge.s 6098 <TestZoom4Picture+0x2450>
  }

  for(int i2=0;i2<12;i2++) {
    60d2:	42af 00be      	clr.l 190(sp)
    60d6:	6060           	bra.s 6138 <TestZoom4Picture+0x24f0>
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    60d8:	202f 00be      	move.l 190(sp),d0
    60dc:	d080           	add.l d0,d0
    60de:	2200           	move.l d0,d1
    60e0:	0681 0000 00f7 	addi.l #247,d1
    60e6:	7000           	moveq #0,d0
    60e8:	302f 01c6      	move.w 454(sp),d0
    60ec:	2f01           	move.l d1,-(sp)
    60ee:	2f00           	move.l d0,-(sp)
    60f0:	2f2f 01d0      	move.l 464(sp),-(sp)
    60f4:	2f2f 0056      	move.l 86(sp),-(sp)
    60f8:	4eba 09b0      	jsr 6aaa <TestRow>(pc)
    60fc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6100:	722a           	moveq #42,d1
    6102:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    6106:	707c           	moveq #124,d0
    6108:	d0af 00be      	add.l 190(sp),d0
    610c:	d080           	add.l d0,d0
    610e:	2200           	move.l d0,d1
    6110:	7000           	moveq #0,d0
    6112:	302f 01c6      	move.w 454(sp),d0
    6116:	2f01           	move.l d1,-(sp)
    6118:	2f00           	move.l d0,-(sp)
    611a:	2f2f 01d0      	move.l 464(sp),-(sp)
    611e:	2f2f 0056      	move.l 86(sp),-(sp)
    6122:	4eba 0986      	jsr 6aaa <TestRow>(pc)
    6126:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    612a:	702a           	moveq #42,d0
    612c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6130:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    6134:	52af 00be      	addq.l #1,190(sp)
    6138:	720b           	moveq #11,d1
    613a:	b2af 00be      	cmp.l 190(sp),d1
    613e:	6c98           	bge.s 60d8 <TestZoom4Picture+0x2490>
  }

  tmp = source;
    6140:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6146:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    614c:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    6152:	4878 0001      	pea 1 <_start+0x1>
    6156:	4878 000e      	pea e <_start+0xe>
    615a:	2f2f 0056      	move.l 86(sp),-(sp)
    615e:	2f2f 006a      	move.l 106(sp),-(sp)
    6162:	4eba b894      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    6166:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    616a:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    6170:	2c40           	movea.l d0,a6
    6172:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6176:	202f 004e      	move.l 78(sp),d0
    617a:	5880           	addq.l #4,d0
    617c:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom15;
    6180:	2f7c 0000 bc94 	move.l #48276,74(sp)
    6186:	004a 

  mask = 0x0000;
    6188:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<8;i2++) {
    618c:	42af 00ba      	clr.l 186(sp)
    6190:	605a           	bra.s 61ec <TestZoom4Picture+0x25a4>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6192:	202f 00ba      	move.l 186(sp),d0
    6196:	d080           	add.l d0,d0
    6198:	2200           	move.l d0,d1
    619a:	7000           	moveq #0,d0
    619c:	302f 01c6      	move.w 454(sp),d0
    61a0:	2f01           	move.l d1,-(sp)
    61a2:	2f00           	move.l d0,-(sp)
    61a4:	2f2f 01d0      	move.l 464(sp),-(sp)
    61a8:	2f2f 0056      	move.l 86(sp),-(sp)
    61ac:	4eba 08fc      	jsr 6aaa <TestRow>(pc)
    61b0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61b4:	722a           	moveq #42,d1
    61b6:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    61ba:	202f 00ba      	move.l 186(sp),d0
    61be:	d080           	add.l d0,d0
    61c0:	2200           	move.l d0,d1
    61c2:	5281           	addq.l #1,d1
    61c4:	7000           	moveq #0,d0
    61c6:	302f 01c6      	move.w 454(sp),d0
    61ca:	2f01           	move.l d1,-(sp)
    61cc:	2f00           	move.l d0,-(sp)
    61ce:	2f2f 01d0      	move.l 464(sp),-(sp)
    61d2:	2f2f 0056      	move.l 86(sp),-(sp)
    61d6:	4eba 08d2      	jsr 6aaa <TestRow>(pc)
    61da:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61de:	702a           	moveq #42,d0
    61e0:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    61e4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    61e8:	52af 00ba      	addq.l #1,186(sp)
    61ec:	7207           	moveq #7,d1
    61ee:	b2af 00ba      	cmp.l 186(sp),d1
    61f2:	6c9e           	bge.s 6192 <TestZoom4Picture+0x254a>
  }

  for(int i=0;i<7;i++) {
    61f4:	42af 00b6      	clr.l 182(sp)
    61f8:	6000 00de      	bra.w 62d8 <TestZoom4Picture+0x2690>
    for(int i2=0;i2<3;i2++) {  
    61fc:	42af 00b2      	clr.l 178(sp)
    6200:	603e           	bra.s 6240 <TestZoom4Picture+0x25f8>
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    6202:	307c 0010      	movea.w #16,a0
    6206:	d1ef 00b2      	adda.l 178(sp),a0
    620a:	222f 00b6      	move.l 182(sp),d1
    620e:	2001           	move.l d1,d0
    6210:	eb88           	lsl.l #5,d0
    6212:	d081           	add.l d1,d0
    6214:	2208           	move.l a0,d1
    6216:	d280           	add.l d0,d1
    6218:	7000           	moveq #0,d0
    621a:	302f 01c6      	move.w 454(sp),d0
    621e:	2f01           	move.l d1,-(sp)
    6220:	2f00           	move.l d0,-(sp)
    6222:	2f2f 01d0      	move.l 464(sp),-(sp)
    6226:	2f2f 0056      	move.l 86(sp),-(sp)
    622a:	4eba 087e      	jsr 6aaa <TestRow>(pc)
    622e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6232:	702a           	moveq #42,d0
    6234:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6238:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<3;i2++) {  
    623c:	52af 00b2      	addq.l #1,178(sp)
    6240:	7202           	moveq #2,d1
    6242:	b2af 00b2      	cmp.l 178(sp),d1
    6246:	6cba           	bge.s 6202 <TestZoom4Picture+0x25ba>
    }
    
    for(int i2=0;i2<15;i2++) {
    6248:	42af 00ae      	clr.l 174(sp)
    624c:	607c           	bra.s 62ca <TestZoom4Picture+0x2682>
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    624e:	222f 00b6      	move.l 182(sp),d1
    6252:	2001           	move.l d1,d0
    6254:	eb88           	lsl.l #5,d0
    6256:	2040           	movea.l d0,a0
    6258:	d1c1           	adda.l d1,a0
    625a:	41e8 0013      	lea 19(a0),a0
    625e:	202f 00ae      	move.l 174(sp),d0
    6262:	d080           	add.l d0,d0
    6264:	2208           	move.l a0,d1
    6266:	d280           	add.l d0,d1
    6268:	7000           	moveq #0,d0
    626a:	302f 01c6      	move.w 454(sp),d0
    626e:	2f01           	move.l d1,-(sp)
    6270:	2f00           	move.l d0,-(sp)
    6272:	2f2f 01d0      	move.l 464(sp),-(sp)
    6276:	2f2f 0056      	move.l 86(sp),-(sp)
    627a:	4eba 082e      	jsr 6aaa <TestRow>(pc)
    627e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6282:	702a           	moveq #42,d0
    6284:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    6288:	222f 00b6      	move.l 182(sp),d1
    628c:	2001           	move.l d1,d0
    628e:	eb88           	lsl.l #5,d0
    6290:	2040           	movea.l d0,a0
    6292:	d1c1           	adda.l d1,a0
    6294:	41e8 0013      	lea 19(a0),a0
    6298:	202f 00ae      	move.l 174(sp),d0
    629c:	d080           	add.l d0,d0
    629e:	2208           	move.l a0,d1
    62a0:	d280           	add.l d0,d1
    62a2:	7000           	moveq #0,d0
    62a4:	302f 01c6      	move.w 454(sp),d0
    62a8:	2f01           	move.l d1,-(sp)
    62aa:	2f00           	move.l d0,-(sp)
    62ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    62b0:	2f2f 0056      	move.l 86(sp),-(sp)
    62b4:	4eba 07f4      	jsr 6aaa <TestRow>(pc)
    62b8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    62bc:	722a           	moveq #42,d1
    62be:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    62c2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {
    62c6:	52af 00ae      	addq.l #1,174(sp)
    62ca:	700e           	moveq #14,d0
    62cc:	b0af 00ae      	cmp.l 174(sp),d0
    62d0:	6c00 ff7c      	bge.w 624e <TestZoom4Picture+0x2606>
  for(int i=0;i<7;i++) {
    62d4:	52af 00b6      	addq.l #1,182(sp)
    62d8:	7206           	moveq #6,d1
    62da:	b2af 00b6      	cmp.l 182(sp),d1
    62de:	6c00 ff1c      	bge.w 61fc <TestZoom4Picture+0x25b4>
    }
  }

  for(int i2=0;i2<3;i2++) {  
    62e2:	42af 00aa      	clr.l 170(sp)
    62e6:	6032           	bra.s 631a <TestZoom4Picture+0x26d2>
    TestRow( valsupposed, valactual, mask, 247+i2);
    62e8:	222f 00aa      	move.l 170(sp),d1
    62ec:	0681 0000 00f7 	addi.l #247,d1
    62f2:	7000           	moveq #0,d0
    62f4:	302f 01c6      	move.w 454(sp),d0
    62f8:	2f01           	move.l d1,-(sp)
    62fa:	2f00           	move.l d0,-(sp)
    62fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    6300:	2f2f 0056      	move.l 86(sp),-(sp)
    6304:	4eba 07a4      	jsr 6aaa <TestRow>(pc)
    6308:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    630c:	702a           	moveq #42,d0
    630e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6312:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<3;i2++) {  
    6316:	52af 00aa      	addq.l #1,170(sp)
    631a:	7202           	moveq #2,d1
    631c:	b2af 00aa      	cmp.l 170(sp),d1
    6320:	6cc6           	bge.s 62e8 <TestZoom4Picture+0x26a0>
  }

  for(int i2=0;i2<10;i2++) {
    6322:	42af 00a6      	clr.l 166(sp)
    6326:	6060           	bra.s 6388 <TestZoom4Picture+0x2740>
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    6328:	707d           	moveq #125,d0
    632a:	d0af 00a6      	add.l 166(sp),d0
    632e:	d080           	add.l d0,d0
    6330:	2200           	move.l d0,d1
    6332:	7000           	moveq #0,d0
    6334:	302f 01c6      	move.w 454(sp),d0
    6338:	2f01           	move.l d1,-(sp)
    633a:	2f00           	move.l d0,-(sp)
    633c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6340:	2f2f 0056      	move.l 86(sp),-(sp)
    6344:	4eba 0764      	jsr 6aaa <TestRow>(pc)
    6348:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    634c:	702a           	moveq #42,d0
    634e:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    6352:	202f 00a6      	move.l 166(sp),d0
    6356:	d080           	add.l d0,d0
    6358:	2200           	move.l d0,d1
    635a:	0681 0000 00fb 	addi.l #251,d1
    6360:	7000           	moveq #0,d0
    6362:	302f 01c6      	move.w 454(sp),d0
    6366:	2f01           	move.l d1,-(sp)
    6368:	2f00           	move.l d0,-(sp)
    636a:	2f2f 01d0      	move.l 464(sp),-(sp)
    636e:	2f2f 0056      	move.l 86(sp),-(sp)
    6372:	4eba 0736      	jsr 6aaa <TestRow>(pc)
    6376:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    637a:	722a           	moveq #42,d1
    637c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6380:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {
    6384:	52af 00a6      	addq.l #1,166(sp)
    6388:	7009           	moveq #9,d0
    638a:	b0af 00a6      	cmp.l 166(sp),d0
    638e:	6c98           	bge.s 6328 <TestZoom4Picture+0x26e0>
  }

  tmp = source;
    6390:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6396:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    639c:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    63a2:	4878 0001      	pea 1 <_start+0x1>
    63a6:	4878 000f      	pea f <_start+0xf>
    63aa:	2f2f 0056      	move.l 86(sp),-(sp)
    63ae:	2f2f 006a      	move.l 106(sp),-(sp)
    63b2:	4eba b644      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    63b6:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    63ba:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    63c0:	2c40           	movea.l d0,a6
    63c2:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    63c6:	222f 004e      	move.l 78(sp),d1
    63ca:	5881           	addq.l #4,d1
    63cc:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom16;
    63d0:	2f7c 0000 bcc0 	move.l #48320,74(sp)
    63d6:	004a 

  mask = 0x0000;
    63d8:	426f 01c6      	clr.w 454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    63dc:	7000           	moveq #0,d0
    63de:	302f 01c6      	move.w 454(sp),d0
    63e2:	42a7           	clr.l -(sp)
    63e4:	2f00           	move.l d0,-(sp)
    63e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    63ea:	2f2f 0056      	move.l 86(sp),-(sp)
    63ee:	4eba 06ba      	jsr 6aaa <TestRow>(pc)
    63f2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    63f6:	702a           	moveq #42,d0
    63f8:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    63fc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    6400:	42af 00a2      	clr.l 162(sp)
    6404:	605a           	bra.s 6460 <TestZoom4Picture+0x2818>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6406:	202f 00a2      	move.l 162(sp),d0
    640a:	d080           	add.l d0,d0
    640c:	2200           	move.l d0,d1
    640e:	7000           	moveq #0,d0
    6410:	302f 01c6      	move.w 454(sp),d0
    6414:	2f01           	move.l d1,-(sp)
    6416:	2f00           	move.l d0,-(sp)
    6418:	2f2f 01d0      	move.l 464(sp),-(sp)
    641c:	2f2f 0056      	move.l 86(sp),-(sp)
    6420:	4eba 0688      	jsr 6aaa <TestRow>(pc)
    6424:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6428:	722a           	moveq #42,d1
    642a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    642e:	202f 00a2      	move.l 162(sp),d0
    6432:	d080           	add.l d0,d0
    6434:	2200           	move.l d0,d1
    6436:	5281           	addq.l #1,d1
    6438:	7000           	moveq #0,d0
    643a:	302f 01c6      	move.w 454(sp),d0
    643e:	2f01           	move.l d1,-(sp)
    6440:	2f00           	move.l d0,-(sp)
    6442:	2f2f 01d0      	move.l 464(sp),-(sp)
    6446:	2f2f 0056      	move.l 86(sp),-(sp)
    644a:	4eba 065e      	jsr 6aaa <TestRow>(pc)
    644e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6452:	702a           	moveq #42,d0
    6454:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6458:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    645c:	52af 00a2      	addq.l #1,162(sp)
    6460:	7205           	moveq #5,d1
    6462:	b2af 00a2      	cmp.l 162(sp),d1
    6466:	6c9e           	bge.s 6406 <TestZoom4Picture+0x27be>
  }

  for(int i=0;i<7;i++) {
    6468:	42af 009e      	clr.l 158(sp)
    646c:	6000 00e6      	bra.w 6554 <TestZoom4Picture+0x290c>
    for(int i2=0;i2<2;i2++) {  
    6470:	42af 009a      	clr.l 154(sp)
    6474:	6040           	bra.s 64b6 <TestZoom4Picture+0x286e>
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    6476:	307c 000d      	movea.w #13,a0
    647a:	d1ef 009a      	adda.l 154(sp),a0
    647e:	222f 009e      	move.l 158(sp),d1
    6482:	2001           	move.l d1,d0
    6484:	e988           	lsl.l #4,d0
    6486:	d081           	add.l d1,d0
    6488:	d080           	add.l d0,d0
    648a:	2208           	move.l a0,d1
    648c:	d280           	add.l d0,d1
    648e:	7000           	moveq #0,d0
    6490:	302f 01c6      	move.w 454(sp),d0
    6494:	2f01           	move.l d1,-(sp)
    6496:	2f00           	move.l d0,-(sp)
    6498:	2f2f 01d0      	move.l 464(sp),-(sp)
    649c:	2f2f 0056      	move.l 86(sp),-(sp)
    64a0:	4eba 0608      	jsr 6aaa <TestRow>(pc)
    64a4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    64a8:	702a           	moveq #42,d0
    64aa:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    64ae:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<2;i2++) {  
    64b2:	52af 009a      	addq.l #1,154(sp)
    64b6:	7201           	moveq #1,d1
    64b8:	b2af 009a      	cmp.l 154(sp),d1
    64bc:	6cb8           	bge.s 6476 <TestZoom4Picture+0x282e>
    }
    
    for(int i2=0;i2<16;i2++) {
    64be:	42af 0096      	clr.l 150(sp)
    64c2:	6000 0082      	bra.w 6546 <TestZoom4Picture+0x28fe>
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    64c6:	222f 009e      	move.l 158(sp),d1
    64ca:	2001           	move.l d1,d0
    64cc:	e988           	lsl.l #4,d0
    64ce:	d081           	add.l d1,d0
    64d0:	d080           	add.l d0,d0
    64d2:	2040           	movea.l d0,a0
    64d4:	41e8 0010      	lea 16(a0),a0
    64d8:	202f 0096      	move.l 150(sp),d0
    64dc:	d080           	add.l d0,d0
    64de:	2208           	move.l a0,d1
    64e0:	d280           	add.l d0,d1
    64e2:	7000           	moveq #0,d0
    64e4:	302f 01c6      	move.w 454(sp),d0
    64e8:	2f01           	move.l d1,-(sp)
    64ea:	2f00           	move.l d0,-(sp)
    64ec:	2f2f 01d0      	move.l 464(sp),-(sp)
    64f0:	2f2f 0056      	move.l 86(sp),-(sp)
    64f4:	4eba 05b4      	jsr 6aaa <TestRow>(pc)
    64f8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    64fc:	702a           	moveq #42,d0
    64fe:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    6502:	222f 009e      	move.l 158(sp),d1
    6506:	2001           	move.l d1,d0
    6508:	e988           	lsl.l #4,d0
    650a:	d081           	add.l d1,d0
    650c:	d080           	add.l d0,d0
    650e:	2040           	movea.l d0,a0
    6510:	41e8 0011      	lea 17(a0),a0
    6514:	202f 0096      	move.l 150(sp),d0
    6518:	d080           	add.l d0,d0
    651a:	2208           	move.l a0,d1
    651c:	d280           	add.l d0,d1
    651e:	7000           	moveq #0,d0
    6520:	302f 01c6      	move.w 454(sp),d0
    6524:	2f01           	move.l d1,-(sp)
    6526:	2f00           	move.l d0,-(sp)
    6528:	2f2f 01d0      	move.l 464(sp),-(sp)
    652c:	2f2f 0056      	move.l 86(sp),-(sp)
    6530:	4eba 0578      	jsr 6aaa <TestRow>(pc)
    6534:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6538:	722a           	moveq #42,d1
    653a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    653e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {
    6542:	52af 0096      	addq.l #1,150(sp)
    6546:	700f           	moveq #15,d0
    6548:	b0af 0096      	cmp.l 150(sp),d0
    654c:	6c00 ff78      	bge.w 64c6 <TestZoom4Picture+0x287e>
  for(int i=0;i<7;i++) {
    6550:	52af 009e      	addq.l #1,158(sp)
    6554:	7206           	moveq #6,d1
    6556:	b2af 009e      	cmp.l 158(sp),d1
    655a:	6c00 ff14      	bge.w 6470 <TestZoom4Picture+0x2828>
    }
  }

  for(int i2=0;i2<2;i2++) {
    655e:	42af 0092      	clr.l 146(sp)
    6562:	6032           	bra.s 6596 <TestZoom4Picture+0x294e>
    TestRow( valsupposed, valactual, mask, 251+i2);
    6564:	222f 0092      	move.l 146(sp),d1
    6568:	0681 0000 00fb 	addi.l #251,d1
    656e:	7000           	moveq #0,d0
    6570:	302f 01c6      	move.w 454(sp),d0
    6574:	2f01           	move.l d1,-(sp)
    6576:	2f00           	move.l d0,-(sp)
    6578:	2f2f 01d0      	move.l 464(sp),-(sp)
    657c:	2f2f 0056      	move.l 86(sp),-(sp)
    6580:	4eba 0528      	jsr 6aaa <TestRow>(pc)
    6584:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6588:	702a           	moveq #42,d0
    658a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    658e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<2;i2++) {
    6592:	52af 0092      	addq.l #1,146(sp)
    6596:	7201           	moveq #1,d1
    6598:	b2af 0092      	cmp.l 146(sp),d1
    659c:	6cc6           	bge.s 6564 <TestZoom4Picture+0x291c>
  }

  for(int i2=0;i2<8;i2++) {
    659e:	42af 008e      	clr.l 142(sp)
    65a2:	6060           	bra.s 6604 <TestZoom4Picture+0x29bc>
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    65a4:	202f 008e      	move.l 142(sp),d0
    65a8:	d080           	add.l d0,d0
    65aa:	2200           	move.l d0,d1
    65ac:	0681 0000 00fd 	addi.l #253,d1
    65b2:	7000           	moveq #0,d0
    65b4:	302f 01c6      	move.w 454(sp),d0
    65b8:	2f01           	move.l d1,-(sp)
    65ba:	2f00           	move.l d0,-(sp)
    65bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    65c0:	2f2f 0056      	move.l 86(sp),-(sp)
    65c4:	4eba 04e4      	jsr 6aaa <TestRow>(pc)
    65c8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    65cc:	702a           	moveq #42,d0
    65ce:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    65d2:	707f           	moveq #127,d0
    65d4:	d0af 008e      	add.l 142(sp),d0
    65d8:	d080           	add.l d0,d0
    65da:	2200           	move.l d0,d1
    65dc:	7000           	moveq #0,d0
    65de:	302f 01c6      	move.w 454(sp),d0
    65e2:	2f01           	move.l d1,-(sp)
    65e4:	2f00           	move.l d0,-(sp)
    65e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    65ea:	2f2f 0056      	move.l 86(sp),-(sp)
    65ee:	4eba 04ba      	jsr 6aaa <TestRow>(pc)
    65f2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    65f6:	722a           	moveq #42,d1
    65f8:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    65fc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    6600:	52af 008e      	addq.l #1,142(sp)
    6604:	7007           	moveq #7,d0
    6606:	b0af 008e      	cmp.l 142(sp),d0
    660a:	6c98           	bge.s 65a4 <TestZoom4Picture+0x295c>
  }

  tmp = source;
    660c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6612:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6618:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    661e:	4878 0001      	pea 1 <_start+0x1>
    6622:	4878 0010      	pea 10 <_start+0x10>
    6626:	2f2f 0056      	move.l 86(sp),-(sp)
    662a:	2f2f 006a      	move.l 106(sp),-(sp)
    662e:	4eba b3c8      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    6632:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6636:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    663c:	2c40           	movea.l d0,a6
    663e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6642:	222f 004e      	move.l 78(sp),d1
    6646:	5881           	addq.l #4,d1
    6648:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom17;
    664c:	2f7c 0000 bcec 	move.l #48364,74(sp)
    6652:	004a 

  mask = 0xffff;
    6654:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<5;i2++) {
    665a:	42af 008a      	clr.l 138(sp)
    665e:	605a           	bra.s 66ba <TestZoom4Picture+0x2a72>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6660:	202f 008a      	move.l 138(sp),d0
    6664:	d080           	add.l d0,d0
    6666:	2200           	move.l d0,d1
    6668:	7000           	moveq #0,d0
    666a:	302f 01c6      	move.w 454(sp),d0
    666e:	2f01           	move.l d1,-(sp)
    6670:	2f00           	move.l d0,-(sp)
    6672:	2f2f 01d0      	move.l 464(sp),-(sp)
    6676:	2f2f 0056      	move.l 86(sp),-(sp)
    667a:	4eba 042e      	jsr 6aaa <TestRow>(pc)
    667e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6682:	702a           	moveq #42,d0
    6684:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6688:	202f 008a      	move.l 138(sp),d0
    668c:	d080           	add.l d0,d0
    668e:	2200           	move.l d0,d1
    6690:	5281           	addq.l #1,d1
    6692:	7000           	moveq #0,d0
    6694:	302f 01c6      	move.w 454(sp),d0
    6698:	2f01           	move.l d1,-(sp)
    669a:	2f00           	move.l d0,-(sp)
    669c:	2f2f 01d0      	move.l 464(sp),-(sp)
    66a0:	2f2f 0056      	move.l 86(sp),-(sp)
    66a4:	4eba 0404      	jsr 6aaa <TestRow>(pc)
    66a8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66ac:	722a           	moveq #42,d1
    66ae:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    66b2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {
    66b6:	52af 008a      	addq.l #1,138(sp)
    66ba:	7004           	moveq #4,d0
    66bc:	b0af 008a      	cmp.l 138(sp),d0
    66c0:	6c9e           	bge.s 6660 <TestZoom4Picture+0x2a18>
  }

  for(int i=0;i<7;i++) {
    66c2:	42af 0086      	clr.l 134(sp)
    66c6:	6000 00d4      	bra.w 679c <TestZoom4Picture+0x2b54>
      TestRow( valsupposed, valactual, mask, 10+i*35);
    66ca:	222f 0086      	move.l 134(sp),d1
    66ce:	2001           	move.l d1,d0
    66d0:	e988           	lsl.l #4,d0
    66d2:	d081           	add.l d1,d0
    66d4:	d080           	add.l d0,d0
    66d6:	2040           	movea.l d0,a0
    66d8:	d1c1           	adda.l d1,a0
    66da:	41e8 000a      	lea 10(a0),a0
    66de:	7000           	moveq #0,d0
    66e0:	302f 01c6      	move.w 454(sp),d0
    66e4:	2f08           	move.l a0,-(sp)
    66e6:	2f00           	move.l d0,-(sp)
    66e8:	2f2f 01d0      	move.l 464(sp),-(sp)
    66ec:	2f2f 0056      	move.l 86(sp),-(sp)
    66f0:	4eba 03b8      	jsr 6aaa <TestRow>(pc)
    66f4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    66f8:	722a           	moveq #42,d1
    66fa:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    66fe:	466f 01c6      	not.w 454(sp)
    
    for(int i2=0;i2<17;i2++) {
    6702:	42af 0082      	clr.l 130(sp)
    6706:	6000 0086      	bra.w 678e <TestZoom4Picture+0x2b46>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    670a:	222f 0086      	move.l 134(sp),d1
    670e:	2001           	move.l d1,d0
    6710:	e988           	lsl.l #4,d0
    6712:	d081           	add.l d1,d0
    6714:	d080           	add.l d0,d0
    6716:	2040           	movea.l d0,a0
    6718:	d1c1           	adda.l d1,a0
    671a:	41e8 000b      	lea 11(a0),a0
    671e:	202f 0082      	move.l 130(sp),d0
    6722:	d080           	add.l d0,d0
    6724:	2208           	move.l a0,d1
    6726:	d280           	add.l d0,d1
    6728:	7000           	moveq #0,d0
    672a:	302f 01c6      	move.w 454(sp),d0
    672e:	2f01           	move.l d1,-(sp)
    6730:	2f00           	move.l d0,-(sp)
    6732:	2f2f 01d0      	move.l 464(sp),-(sp)
    6736:	2f2f 0056      	move.l 86(sp),-(sp)
    673a:	4eba 036e      	jsr 6aaa <TestRow>(pc)
    673e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6742:	702a           	moveq #42,d0
    6744:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6748:	222f 0086      	move.l 134(sp),d1
    674c:	2001           	move.l d1,d0
    674e:	e988           	lsl.l #4,d0
    6750:	d081           	add.l d1,d0
    6752:	d080           	add.l d0,d0
    6754:	2040           	movea.l d0,a0
    6756:	d1c1           	adda.l d1,a0
    6758:	41e8 000c      	lea 12(a0),a0
    675c:	202f 0082      	move.l 130(sp),d0
    6760:	d080           	add.l d0,d0
    6762:	2208           	move.l a0,d1
    6764:	d280           	add.l d0,d1
    6766:	7000           	moveq #0,d0
    6768:	302f 01c6      	move.w 454(sp),d0
    676c:	2f01           	move.l d1,-(sp)
    676e:	2f00           	move.l d0,-(sp)
    6770:	2f2f 01d0      	move.l 464(sp),-(sp)
    6774:	2f2f 0056      	move.l 86(sp),-(sp)
    6778:	4eba 0330      	jsr 6aaa <TestRow>(pc)
    677c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6780:	722a           	moveq #42,d1
    6782:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6786:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<17;i2++) {
    678a:	52af 0082      	addq.l #1,130(sp)
    678e:	7010           	moveq #16,d0
    6790:	b0af 0082      	cmp.l 130(sp),d0
    6794:	6c00 ff74      	bge.w 670a <TestZoom4Picture+0x2ac2>
  for(int i=0;i<7;i++) {
    6798:	52af 0086      	addq.l #1,134(sp)
    679c:	7206           	moveq #6,d1
    679e:	b2af 0086      	cmp.l 134(sp),d1
    67a2:	6c00 ff26      	bge.w 66ca <TestZoom4Picture+0x2a82>
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    67a6:	7000           	moveq #0,d0
    67a8:	302f 01c6      	move.w 454(sp),d0
    67ac:	4878 00ff      	pea ff <FreeDisplay+0x1f>
    67b0:	2f00           	move.l d0,-(sp)
    67b2:	2f2f 01d0      	move.l 464(sp),-(sp)
    67b6:	2f2f 0056      	move.l 86(sp),-(sp)
    67ba:	4eba 02ee      	jsr 6aaa <TestRow>(pc)
    67be:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    67c2:	702a           	moveq #42,d0
    67c4:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    67c8:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<7;i2++) {
    67cc:	42af 007e      	clr.l 126(sp)
    67d0:	6064           	bra.s 6836 <TestZoom4Picture+0x2bee>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    67d2:	202f 007e      	move.l 126(sp),d0
    67d6:	0680 0000 0080 	addi.l #128,d0
    67dc:	d080           	add.l d0,d0
    67de:	2200           	move.l d0,d1
    67e0:	7000           	moveq #0,d0
    67e2:	302f 01c6      	move.w 454(sp),d0
    67e6:	2f01           	move.l d1,-(sp)
    67e8:	2f00           	move.l d0,-(sp)
    67ea:	2f2f 01d0      	move.l 464(sp),-(sp)
    67ee:	2f2f 0056      	move.l 86(sp),-(sp)
    67f2:	4eba 02b6      	jsr 6aaa <TestRow>(pc)
    67f6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    67fa:	722a           	moveq #42,d1
    67fc:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6800:	202f 007e      	move.l 126(sp),d0
    6804:	d080           	add.l d0,d0
    6806:	2200           	move.l d0,d1
    6808:	0681 0000 0101 	addi.l #257,d1
    680e:	7000           	moveq #0,d0
    6810:	302f 01c6      	move.w 454(sp),d0
    6814:	2f01           	move.l d1,-(sp)
    6816:	2f00           	move.l d0,-(sp)
    6818:	2f2f 01d0      	move.l 464(sp),-(sp)
    681c:	2f2f 0056      	move.l 86(sp),-(sp)
    6820:	4eba 0288      	jsr 6aaa <TestRow>(pc)
    6824:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6828:	702a           	moveq #42,d0
    682a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    682e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {
    6832:	52af 007e      	addq.l #1,126(sp)
    6836:	7206           	moveq #6,d1
    6838:	b2af 007e      	cmp.l 126(sp),d1
    683c:	6c94           	bge.s 67d2 <TestZoom4Picture+0x2b8a>
  }   

  tmp = source;
    683e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    6844:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    684a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    6850:	4878 0001      	pea 1 <_start+0x1>
    6854:	4878 0011      	pea 11 <_start+0x11>
    6858:	2f2f 0056      	move.l 86(sp),-(sp)
    685c:	2f2f 006a      	move.l 106(sp),-(sp)
    6860:	4eba b196      	jsr 19f8 <Zoom_ZoomIntoPicture>(pc)
    6864:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6868:	2039 004d 2b90 	move.l 4d2b90 <GfxBase>,d0
    686e:	2c40           	movea.l d0,a6
    6870:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6874:	202f 004e      	move.l 78(sp),d0
    6878:	5880           	addq.l #4,d0
    687a:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom18;
    687e:	2f7c 0000 bd18 	move.l #48408,74(sp)
    6884:	004a 

  mask = 0xffff;
    6886:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);
    688c:	7000           	moveq #0,d0
    688e:	302f 01c6      	move.w 454(sp),d0
    6892:	42a7           	clr.l -(sp)
    6894:	2f00           	move.l d0,-(sp)
    6896:	2f2f 01d0      	move.l 464(sp),-(sp)
    689a:	2f2f 0056      	move.l 86(sp),-(sp)
    689e:	4eba 020a      	jsr 6aaa <TestRow>(pc)
    68a2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    68a6:	722a           	moveq #42,d1
    68a8:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    68ac:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<4;i2++) {
    68b0:	42af 007a      	clr.l 122(sp)
    68b4:	605c           	bra.s 6912 <TestZoom4Picture+0x2cca>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    68b6:	202f 007a      	move.l 122(sp),d0
    68ba:	d080           	add.l d0,d0
    68bc:	2200           	move.l d0,d1
    68be:	5281           	addq.l #1,d1
    68c0:	7000           	moveq #0,d0
    68c2:	302f 01c6      	move.w 454(sp),d0
    68c6:	2f01           	move.l d1,-(sp)
    68c8:	2f00           	move.l d0,-(sp)
    68ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    68ce:	2f2f 0056      	move.l 86(sp),-(sp)
    68d2:	4eba 01d6      	jsr 6aaa <TestRow>(pc)
    68d6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    68da:	702a           	moveq #42,d0
    68dc:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    68e0:	202f 007a      	move.l 122(sp),d0
    68e4:	5280           	addq.l #1,d0
    68e6:	d080           	add.l d0,d0
    68e8:	2200           	move.l d0,d1
    68ea:	7000           	moveq #0,d0
    68ec:	302f 01c6      	move.w 454(sp),d0
    68f0:	2f01           	move.l d1,-(sp)
    68f2:	2f00           	move.l d0,-(sp)
    68f4:	2f2f 01d0      	move.l 464(sp),-(sp)
    68f8:	2f2f 0056      	move.l 86(sp),-(sp)
    68fc:	4eba 01ac      	jsr 6aaa <TestRow>(pc)
    6900:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6904:	722a           	moveq #42,d1
    6906:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    690a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    690e:	52af 007a      	addq.l #1,122(sp)
    6912:	7003           	moveq #3,d0
    6914:	b0af 007a      	cmp.l 122(sp),d0
    6918:	6c9c           	bge.s 68b6 <TestZoom4Picture+0x2c6e>
  }

  for(int i=0;i<7;i++) {  
    691a:	42af 0076      	clr.l 118(sp)
    691e:	6000 009c      	bra.w 69bc <TestZoom4Picture+0x2d74>
    for(int i2=0;i2<18;i2++) {
    6922:	42af 0072      	clr.l 114(sp)
    6926:	6000 0086      	bra.w 69ae <TestZoom4Picture+0x2d66>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    692a:	222f 0076      	move.l 118(sp),d1
    692e:	2001           	move.l d1,d0
    6930:	e988           	lsl.l #4,d0
    6932:	d081           	add.l d1,d0
    6934:	d080           	add.l d0,d0
    6936:	2040           	movea.l d0,a0
    6938:	d1c1           	adda.l d1,a0
    693a:	41e8 000b      	lea 11(a0),a0
    693e:	202f 0072      	move.l 114(sp),d0
    6942:	d080           	add.l d0,d0
    6944:	2208           	move.l a0,d1
    6946:	d280           	add.l d0,d1
    6948:	7000           	moveq #0,d0
    694a:	302f 01c6      	move.w 454(sp),d0
    694e:	2f01           	move.l d1,-(sp)
    6950:	2f00           	move.l d0,-(sp)
    6952:	2f2f 01d0      	move.l 464(sp),-(sp)
    6956:	2f2f 0056      	move.l 86(sp),-(sp)
    695a:	4eba 014e      	jsr 6aaa <TestRow>(pc)
    695e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6962:	722a           	moveq #42,d1
    6964:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6968:	222f 0076      	move.l 118(sp),d1
    696c:	2001           	move.l d1,d0
    696e:	e988           	lsl.l #4,d0
    6970:	d081           	add.l d1,d0
    6972:	d080           	add.l d0,d0
    6974:	2040           	movea.l d0,a0
    6976:	d1c1           	adda.l d1,a0
    6978:	41e8 000c      	lea 12(a0),a0
    697c:	202f 0072      	move.l 114(sp),d0
    6980:	d080           	add.l d0,d0
    6982:	2208           	move.l a0,d1
    6984:	d280           	add.l d0,d1
    6986:	7000           	moveq #0,d0
    6988:	302f 01c6      	move.w 454(sp),d0
    698c:	2f01           	move.l d1,-(sp)
    698e:	2f00           	move.l d0,-(sp)
    6990:	2f2f 01d0      	move.l 464(sp),-(sp)
    6994:	2f2f 0056      	move.l 86(sp),-(sp)
    6998:	4eba 0110      	jsr 6aaa <TestRow>(pc)
    699c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    69a0:	702a           	moveq #42,d0
    69a2:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    69a6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) {
    69aa:	52af 0072      	addq.l #1,114(sp)
    69ae:	7211           	moveq #17,d1
    69b0:	b2af 0072      	cmp.l 114(sp),d1
    69b4:	6c00 ff74      	bge.w 692a <TestZoom4Picture+0x2ce2>
  for(int i=0;i<7;i++) {  
    69b8:	52af 0076      	addq.l #1,118(sp)
    69bc:	7006           	moveq #6,d0
    69be:	b0af 0076      	cmp.l 118(sp),d0
    69c2:	6c00 ff5e      	bge.w 6922 <TestZoom4Picture+0x2cda>
    }
  } 

  for(int i2=0;i2<4;i2++) {
    69c6:	42af 006e      	clr.l 110(sp)
    69ca:	6064           	bra.s 6a30 <TestZoom4Picture+0x2de8>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    69cc:	202f 006e      	move.l 110(sp),d0
    69d0:	0680 0000 0080 	addi.l #128,d0
    69d6:	d080           	add.l d0,d0
    69d8:	2200           	move.l d0,d1
    69da:	7000           	moveq #0,d0
    69dc:	302f 01c6      	move.w 454(sp),d0
    69e0:	2f01           	move.l d1,-(sp)
    69e2:	2f00           	move.l d0,-(sp)
    69e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    69e8:	2f2f 0056      	move.l 86(sp),-(sp)
    69ec:	4eba 00bc      	jsr 6aaa <TestRow>(pc)
    69f0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    69f4:	722a           	moveq #42,d1
    69f6:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    69fa:	202f 006e      	move.l 110(sp),d0
    69fe:	d080           	add.l d0,d0
    6a00:	2200           	move.l d0,d1
    6a02:	0681 0000 0101 	addi.l #257,d1
    6a08:	7000           	moveq #0,d0
    6a0a:	302f 01c6      	move.w 454(sp),d0
    6a0e:	2f01           	move.l d1,-(sp)
    6a10:	2f00           	move.l d0,-(sp)
    6a12:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a16:	2f2f 0056      	move.l 86(sp),-(sp)
    6a1a:	4eba 008e      	jsr 6aaa <TestRow>(pc)
    6a1e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a22:	702a           	moveq #42,d0
    6a24:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6a28:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6a2c:	52af 006e      	addq.l #1,110(sp)
    6a30:	7203           	moveq #3,d1
    6a32:	b2af 006e      	cmp.l 110(sp),d1
    6a36:	6c94           	bge.s 69cc <TestZoom4Picture+0x2d84>
  }
  TestRow( valsupposed, valactual, mask, 0);
    6a38:	7000           	moveq #0,d0
    6a3a:	302f 01c6      	move.w 454(sp),d0
    6a3e:	42a7           	clr.l -(sp)
    6a40:	2f00           	move.l d0,-(sp)
    6a42:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a46:	2f2f 0056      	move.l 86(sp),-(sp)
    6a4a:	4eba 005e      	jsr 6aaa <TestRow>(pc)
    6a4e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6a52:	702a           	moveq #42,d0
    6a54:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6a58:	466f 01c6      	not.w 454(sp)
  FreeMem( source, (ZMLINESIZE+4)*272);
    6a5c:	2f6f 005e 0042 	move.l 94(sp),66(sp)
    6a62:	2f7c 0000 30e0 	move.l #12512,62(sp)
    6a68:	003e 
    6a6a:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    6a70:	2c40           	movea.l d0,a6
    6a72:	226f 0042      	movea.l 66(sp),a1
    6a76:	202f 003e      	move.l 62(sp),d0
    6a7a:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    6a7e:	2f6f 004e 003a 	move.l 78(sp),58(sp)
    6a84:	2f7c 0000 30e0 	move.l #12512,54(sp)
    6a8a:	0036 
    6a8c:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    6a92:	2c40           	movea.l d0,a6
    6a94:	226f 003a      	movea.l 58(sp),a1
    6a98:	202f 0036      	move.l 54(sp),d0
    6a9c:	4eae ff2e      	jsr -210(a6)
}
    6aa0:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    6aa4:	4fef 01d0      	lea 464(sp),sp
    6aa8:	4e75           	rts

00006aaa <TestRow>:

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    6aaa:	4fef ff40      	lea -192(sp),sp
    6aae:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
    6ab2:	202f 00e0      	move.l 224(sp),d0
    6ab6:	3000           	move.w d0,d0
    6ab8:	3f40 0016      	move.w d0,22(sp)
  
  char str[ 100] = { 0 };
    6abc:	42af 001c      	clr.l 28(sp)
    6ac0:	7020           	moveq #32,d0
    6ac2:	d08f           	add.l sp,d0
    6ac4:	7260           	moveq #96,d1
    6ac6:	2f01           	move.l d1,-(sp)
    6ac8:	42a7           	clr.l -(sp)
    6aca:	2f00           	move.l d0,-(sp)
    6acc:	4eba 020c      	jsr 6cda <memset>(pc)
    6ad0:	4fef 000c      	lea 12(sp),sp
  UWORD data[2];
  data[1] = numberofline;
    6ad4:	202f 00e4      	move.l 228(sp),d0
    6ad8:	3f40 001a      	move.w d0,26(sp)

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    6adc:	42af 00d0      	clr.l 208(sp)
    6ae0:	6000 00d4      	bra.w 6bb6 <TestRow+0x10c>
    if( (*testpattern++ ^ xormask) != *destination++) {
    6ae4:	202f 00d8      	move.l 216(sp),d0
    6ae8:	2200           	move.l d0,d1
    6aea:	5481           	addq.l #2,d1
    6aec:	2f41 00d8      	move.l d1,216(sp)
    6af0:	2040           	movea.l d0,a0
    6af2:	3010           	move.w (a0),d0
    6af4:	322f 0016      	move.w 22(sp),d1
    6af8:	b141           	eor.w d0,d1
    6afa:	202f 00dc      	move.l 220(sp),d0
    6afe:	2400           	move.l d0,d2
    6b00:	5482           	addq.l #2,d2
    6b02:	2f42 00dc      	move.l d2,220(sp)
    6b06:	2040           	movea.l d0,a0
    6b08:	3010           	move.w (a0),d0
    6b0a:	b041           	cmp.w d1,d0
    6b0c:	6700 00a4      	beq.w 6bb2 <TestRow+0x108>
      data[0] = i;
    6b10:	202f 00d0      	move.l 208(sp),d0
    6b14:	3f40 0018      	move.w d0,24(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    6b18:	2f7c 0000 8454 	move.l #33876,164(sp)
    6b1e:	00a4 
    6b20:	702b           	moveq #43,d0
    6b22:	4600           	not.b d0
    6b24:	d08f           	add.l sp,d0
    6b26:	0680 ffff ff44 	addi.l #-188,d0
    6b2c:	2f40 00a0      	move.l d0,160(sp)
    6b30:	2f7c 0000 7178 	move.l #29048,156(sp)
    6b36:	009c 
    6b38:	722b           	moveq #43,d1
    6b3a:	4601           	not.b d1
    6b3c:	d28f           	add.l sp,d1
    6b3e:	0681 ffff ff48 	addi.l #-184,d1
    6b44:	2f41 0098      	move.l d1,152(sp)
    6b48:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    6b4e:	2c40           	movea.l d0,a6
    6b50:	206f 00a4      	movea.l 164(sp),a0
    6b54:	226f 00a0      	movea.l 160(sp),a1
    6b58:	246f 009c      	movea.l 156(sp),a2
    6b5c:	266f 0098      	movea.l 152(sp),a3
    6b60:	4eae fdf6      	jsr -522(a6)
    6b64:	2f40 0094      	move.l d0,148(sp)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    6b68:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    6b6e:	2c40           	movea.l d0,a6
    6b70:	4eae ffc4      	jsr -60(a6)
    6b74:	2f40 0090      	move.l d0,144(sp)
    6b78:	202f 0090      	move.l 144(sp),d0
    6b7c:	2f40 008c      	move.l d0,140(sp)
    6b80:	742b           	moveq #43,d2
    6b82:	4602           	not.b d2
    6b84:	d48f           	add.l sp,d2
    6b86:	0682 ffff ff48 	addi.l #-184,d2
    6b8c:	2f42 0088      	move.l d2,136(sp)
    6b90:	7064           	moveq #100,d0
    6b92:	2f40 0084      	move.l d0,132(sp)
    6b96:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    6b9c:	2c40           	movea.l d0,a6
    6b9e:	222f 008c      	move.l 140(sp),d1
    6ba2:	242f 0088      	move.l 136(sp),d2
    6ba6:	262f 0084      	move.l 132(sp),d3
    6baa:	4eae ffd0      	jsr -48(a6)
    6bae:	2f40 0080      	move.l d0,128(sp)
  for(int i=0;i<21;i++) {
    6bb2:	52af 00d0      	addq.l #1,208(sp)
    6bb6:	7214           	moveq #20,d1
    6bb8:	b2af 00d0      	cmp.l 208(sp),d1
    6bbc:	6c00 ff26      	bge.w 6ae4 <TestRow+0x3a>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    6bc0:	206f 00d8      	movea.l 216(sp),a0
    6bc4:	3010           	move.w (a0),d0
    6bc6:	322f 0016      	move.w 22(sp),d1
    6bca:	b141           	eor.w d0,d1
    6bcc:	206f 00dc      	movea.l 220(sp),a0
    6bd0:	3010           	move.w (a0),d0
    6bd2:	b340           	eor.w d1,d0
    6bd4:	3000           	move.w d0,d0
    6bd6:	0280 0000 ffff 	andi.l #65535,d0
    6bdc:	0280 0000 ff00 	andi.l #65280,d0
    6be2:	6700 00cc      	beq.w 6cb0 <TestRow+0x206>
    data[0] = 21;
    6be6:	3f7c 0015 0018 	move.w #21,24(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    6bec:	2f7c 0000 8454 	move.l #33876,204(sp)
    6bf2:	00cc 
    6bf4:	742b           	moveq #43,d2
    6bf6:	4602           	not.b d2
    6bf8:	d48f           	add.l sp,d2
    6bfa:	0682 ffff ff44 	addi.l #-188,d2
    6c00:	2f42 00c8      	move.l d2,200(sp)
    6c04:	2f7c 0000 7178 	move.l #29048,196(sp)
    6c0a:	00c4 
    6c0c:	702b           	moveq #43,d0
    6c0e:	4600           	not.b d0
    6c10:	d08f           	add.l sp,d0
    6c12:	0680 ffff ff48 	addi.l #-184,d0
    6c18:	2f40 00c0      	move.l d0,192(sp)
    6c1c:	2039 004d 2b84 	move.l 4d2b84 <SysBase>,d0
    6c22:	2c40           	movea.l d0,a6
    6c24:	206f 00cc      	movea.l 204(sp),a0
    6c28:	226f 00c8      	movea.l 200(sp),a1
    6c2c:	246f 00c4      	movea.l 196(sp),a2
    6c30:	266f 00c0      	movea.l 192(sp),a3
    6c34:	4eae fdf6      	jsr -522(a6)
    6c38:	2f40 00bc      	move.l d0,188(sp)
                                                                           str);
    Write(  Output(), str, 100);
    6c3c:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    6c42:	2c40           	movea.l d0,a6
    6c44:	4eae ffc4      	jsr -60(a6)
    6c48:	2f40 00b8      	move.l d0,184(sp)
    6c4c:	202f 00b8      	move.l 184(sp),d0
    6c50:	2f40 00b4      	move.l d0,180(sp)
    6c54:	722b           	moveq #43,d1
    6c56:	4601           	not.b d1
    6c58:	d28f           	add.l sp,d1
    6c5a:	0681 ffff ff48 	addi.l #-184,d1
    6c60:	2f41 00b0      	move.l d1,176(sp)
    6c64:	7464           	moveq #100,d2
    6c66:	2f42 00ac      	move.l d2,172(sp)
    6c6a:	2039 004d 2b8c 	move.l 4d2b8c <DOSBase>,d0
    6c70:	2c40           	movea.l d0,a6
    6c72:	222f 00b4      	move.l 180(sp),d1
    6c76:	242f 00b0      	move.l 176(sp),d2
    6c7a:	262f 00ac      	move.l 172(sp),d3
    6c7e:	4eae ffd0      	jsr -48(a6)
    6c82:	2f40 00a8      	move.l d0,168(sp)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
    6c86:	206f 00dc      	movea.l 220(sp),a0
    6c8a:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6c8c:	7200           	moveq #0,d1
    6c8e:	3200           	move.w d0,d1
                                                   *testpattern,*destination);
    6c90:	206f 00d8      	movea.l 216(sp),a0
    6c94:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6c96:	3000           	move.w d0,d0
    6c98:	0280 0000 ffff 	andi.l #65535,d0
    6c9e:	2f01           	move.l d1,-(sp)
    6ca0:	2f00           	move.l d0,-(sp)
    6ca2:	4879 0000 8484 	pea 8484 <rundemo.c.95627ee6+0x18b>
    6ca8:	4eba 0162      	jsr 6e0c <KPrintF>(pc)
    6cac:	4fef 000c      	lea 12(sp),sp
     
  }
}
    6cb0:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    6cb4:	4fef 00c0      	lea 192(sp),sp
    6cb8:	4e75           	rts

00006cba <strlen>:
{
    6cba:	598f           	subq.l #4,sp
	unsigned long t=0;
    6cbc:	4297           	clr.l (sp)
    6cbe:	6002           	bra.s 6cc2 <strlen+0x8>
		t++;
    6cc0:	5297           	addq.l #1,(sp)
	while(*s++)
    6cc2:	202f 0008      	move.l 8(sp),d0
    6cc6:	2200           	move.l d0,d1
    6cc8:	5281           	addq.l #1,d1
    6cca:	2f41 0008      	move.l d1,8(sp)
    6cce:	2040           	movea.l d0,a0
    6cd0:	1010           	move.b (a0),d0
    6cd2:	66ec           	bne.s 6cc0 <strlen+0x6>
	return t;
    6cd4:	2017           	move.l (sp),d0
}
    6cd6:	588f           	addq.l #4,sp
    6cd8:	4e75           	rts

00006cda <memset>:
{
    6cda:	4e55 fffc      	link.w a5,#-4
	unsigned char *ptr = (unsigned char *)dest;
    6cde:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
    6ce4:	6014           	bra.s 6cfa <memset+0x20>
		*ptr++ = val;
    6ce6:	202d fffc      	move.l -4(a5),d0
    6cea:	2200           	move.l d0,d1
    6cec:	5281           	addq.l #1,d1
    6cee:	2b41 fffc      	move.l d1,-4(a5)
    6cf2:	222d 000c      	move.l 12(a5),d1
    6cf6:	2040           	movea.l d0,a0
    6cf8:	1081           	move.b d1,(a0)
	while(len-- > 0)
    6cfa:	202d 0010      	move.l 16(a5),d0
    6cfe:	2200           	move.l d0,d1
    6d00:	5381           	subq.l #1,d1
    6d02:	2b41 0010      	move.l d1,16(a5)
    6d06:	4a80           	tst.l d0
    6d08:	66dc           	bne.s 6ce6 <memset+0xc>
	return dest;
    6d0a:	202d 0008      	move.l 8(a5),d0
}
    6d0e:	4e5d           	unlk a5
    6d10:	4e75           	rts

00006d12 <memcpy>:
{
    6d12:	4e55 fff8      	link.w a5,#-8
    6d16:	2f02           	move.l d2,-(sp)
	char *d = (char *)dest;
    6d18:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = (const char *)src;
    6d1e:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
    6d24:	6020           	bra.s 6d46 <memcpy+0x34>
		*d++ = *s++;
    6d26:	222d fff8      	move.l -8(a5),d1
    6d2a:	2001           	move.l d1,d0
    6d2c:	5280           	addq.l #1,d0
    6d2e:	2b40 fff8      	move.l d0,-8(a5)
    6d32:	202d fffc      	move.l -4(a5),d0
    6d36:	2400           	move.l d0,d2
    6d38:	5282           	addq.l #1,d2
    6d3a:	2b42 fffc      	move.l d2,-4(a5)
    6d3e:	2041           	movea.l d1,a0
    6d40:	1210           	move.b (a0),d1
    6d42:	2040           	movea.l d0,a0
    6d44:	1081           	move.b d1,(a0)
	while(len--)
    6d46:	202d 0010      	move.l 16(a5),d0
    6d4a:	2200           	move.l d0,d1
    6d4c:	5381           	subq.l #1,d1
    6d4e:	2b41 0010      	move.l d1,16(a5)
    6d52:	4a80           	tst.l d0
    6d54:	66d0           	bne.s 6d26 <memcpy+0x14>
	return dest;
    6d56:	202d 0008      	move.l 8(a5),d0
}
    6d5a:	241f           	move.l (sp)+,d2
    6d5c:	4e5d           	unlk a5
    6d5e:	4e75           	rts

00006d60 <memmove>:
{
    6d60:	4e55 fff0      	link.w a5,#-16
    6d64:	2f02           	move.l d2,-(sp)
	char *d = dest;
    6d66:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = src;
    6d6c:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
	if (d < s) {
    6d72:	202d fffc      	move.l -4(a5),d0
    6d76:	b0ad fff8      	cmp.l -8(a5),d0
    6d7a:	6522           	bcs.s 6d9e <memmove+0x3e>
    6d7c:	6032           	bra.s 6db0 <memmove+0x50>
			*d++ = *s++;
    6d7e:	222d fff8      	move.l -8(a5),d1
    6d82:	2401           	move.l d1,d2
    6d84:	5282           	addq.l #1,d2
    6d86:	2b42 fff8      	move.l d2,-8(a5)
    6d8a:	202d fffc      	move.l -4(a5),d0
    6d8e:	2400           	move.l d0,d2
    6d90:	5282           	addq.l #1,d2
    6d92:	2b42 fffc      	move.l d2,-4(a5)
    6d96:	2041           	movea.l d1,a0
    6d98:	1210           	move.b (a0),d1
    6d9a:	2040           	movea.l d0,a0
    6d9c:	1081           	move.b d1,(a0)
		while (len--)
    6d9e:	202d 0010      	move.l 16(a5),d0
    6da2:	2200           	move.l d0,d1
    6da4:	5381           	subq.l #1,d1
    6da6:	2b41 0010      	move.l d1,16(a5)
    6daa:	4a80           	tst.l d0
    6dac:	66d0           	bne.s 6d7e <memmove+0x1e>
    6dae:	6052           	bra.s 6e02 <memmove+0xa2>
		const char *lasts = s + (len - 1);
    6db0:	202d 0010      	move.l 16(a5),d0
    6db4:	5380           	subq.l #1,d0
    6db6:	242d fff8      	move.l -8(a5),d2
    6dba:	d480           	add.l d0,d2
    6dbc:	2b42 fff4      	move.l d2,-12(a5)
		char *lastd = d + (len - 1);
    6dc0:	202d 0010      	move.l 16(a5),d0
    6dc4:	5380           	subq.l #1,d0
    6dc6:	222d fffc      	move.l -4(a5),d1
    6dca:	d280           	add.l d0,d1
    6dcc:	2b41 fff0      	move.l d1,-16(a5)
    6dd0:	6020           	bra.s 6df2 <memmove+0x92>
			*lastd-- = *lasts--;
    6dd2:	222d fff4      	move.l -12(a5),d1
    6dd6:	2401           	move.l d1,d2
    6dd8:	5382           	subq.l #1,d2
    6dda:	2b42 fff4      	move.l d2,-12(a5)
    6dde:	202d fff0      	move.l -16(a5),d0
    6de2:	2400           	move.l d0,d2
    6de4:	5382           	subq.l #1,d2
    6de6:	2b42 fff0      	move.l d2,-16(a5)
    6dea:	2041           	movea.l d1,a0
    6dec:	1210           	move.b (a0),d1
    6dee:	2040           	movea.l d0,a0
    6df0:	1081           	move.b d1,(a0)
		while (len--)
    6df2:	202d 0010      	move.l 16(a5),d0
    6df6:	2200           	move.l d0,d1
    6df8:	5381           	subq.l #1,d1
    6dfa:	2b41 0010      	move.l d1,16(a5)
    6dfe:	4a80           	tst.l d0
    6e00:	66d0           	bne.s 6dd2 <memmove+0x72>
	return dest;
    6e02:	202d 0008      	move.l 8(a5),d0
}
    6e06:	241f           	move.l (sp)+,d2
    6e08:	4e5d           	unlk a5
    6e0a:	4e75           	rts

00006e0c <KPrintF>:
{
    6e0c:	4fef ff80      	lea -128(sp),sp
    6e10:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    6e14:	3039 00f0 ff60 	move.w f0ff60 <_end+0xa3d388>,d0
    6e1a:	0c40 4eb9      	cmpi.w #20153,d0
    6e1e:	6722           	beq.s 6e42 <KPrintF+0x36>
    6e20:	0c40 a00e      	cmpi.w #-24562,d0
    6e24:	671c           	beq.s 6e42 <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    6e26:	2c79 004d 2b84 	movea.l 4d2b84 <SysBase>,a6
    6e2c:	206f 0090      	movea.l 144(sp),a0
    6e30:	43ef 0094      	lea 148(sp),a1
    6e34:	45f9 0000 716a 	lea 716a <KPutCharX>,a2
    6e3a:	97cb           	suba.l a3,a3
    6e3c:	4eae fdf6      	jsr -522(a6)
    6e40:	602a           	bra.s 6e6c <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    6e42:	2c79 004d 2b84 	movea.l 4d2b84 <SysBase>,a6
    6e48:	206f 0090      	movea.l 144(sp),a0
    6e4c:	43ef 0094      	lea 148(sp),a1
    6e50:	45f9 0000 7178 	lea 7178 <PutChar>,a2
    6e56:	47ef 000c      	lea 12(sp),a3
    6e5a:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    6e5e:	2f0b           	move.l a3,-(sp)
    6e60:	4878 0056      	pea 56 <_start+0x56>
    6e64:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xa3d388>
    6e6a:	508f           	addq.l #8,sp
}
    6e6c:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    6e70:	4fef 0080      	lea 128(sp),sp
    6e74:	4e75           	rts

00006e76 <warpmode>:

void warpmode(int on) // bool
{
    6e76:	518f           	subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
    6e78:	2f7c 00f0 ff60 	move.l #15794016,4(sp)
    6e7e:	0004 
    if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
    6e80:	206f 0004      	movea.l 4(sp),a0
    6e84:	3010           	move.w (a0),d0
    6e86:	0c40 4eb9      	cmpi.w #20153,d0
    6e8a:	670c           	beq.s 6e98 <warpmode+0x22>
    6e8c:	206f 0004      	movea.l 4(sp),a0
    6e90:	3010           	move.w (a0),d0
    6e92:	0c40 a00e      	cmpi.w #-24562,d0
    6e96:	6668           	bne.s 6f00 <warpmode+0x8a>
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    6e98:	4aaf 000c      	tst.l 12(sp)
    6e9c:	6708           	beq.s 6ea6 <warpmode+0x30>
    6e9e:	203c 0000 84aa 	move.l #33962,d0
    6ea4:	6006           	bra.s 6eac <warpmode+0x36>
    6ea6:	203c 0000 84b4 	move.l #33972,d0
    6eac:	4878 0001      	pea 1 <_start+0x1>
    6eb0:	220f           	move.l sp,d1
    6eb2:	5e81           	addq.l #7,d1
    6eb4:	2f01           	move.l d1,-(sp)
    6eb6:	42a7           	clr.l -(sp)
    6eb8:	2f00           	move.l d0,-(sp)
    6eba:	4878 ffff      	pea ffffffff <_end+0xffb2d427>
    6ebe:	4878 0052      	pea 52 <_start+0x52>
    6ec2:	206f 001c      	movea.l 28(sp),a0
    6ec6:	4e90           	jsr (a0)
    6ec8:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    6ecc:	4aaf 000c      	tst.l 12(sp)
    6ed0:	6708           	beq.s 6eda <warpmode+0x64>
    6ed2:	203c 0000 84bf 	move.l #33983,d0
    6ed8:	6006           	bra.s 6ee0 <warpmode+0x6a>
    6eda:	203c 0000 84d9 	move.l #34009,d0
    6ee0:	4878 0001      	pea 1 <_start+0x1>
    6ee4:	220f           	move.l sp,d1
    6ee6:	5e81           	addq.l #7,d1
    6ee8:	2f01           	move.l d1,-(sp)
    6eea:	42a7           	clr.l -(sp)
    6eec:	2f00           	move.l d0,-(sp)
    6eee:	4878 ffff      	pea ffffffff <_end+0xffb2d427>
    6ef2:	4878 0052      	pea 52 <_start+0x52>
    6ef6:	206f 001c      	movea.l 28(sp),a0
    6efa:	4e90           	jsr (a0)
    6efc:	4fef 0018      	lea 24(sp),sp
	}
}
    6f00:	508f           	addq.l #8,sp
    6f02:	4e75           	rts

00006f04 <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4)
{
    6f04:	598f           	subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
    6f06:	2ebc 00f0 ff60 	move.l #15794016,(sp)
    if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    6f0c:	2057           	movea.l (sp),a0
    6f0e:	3010           	move.w (a0),d0
    6f10:	0c40 4eb9      	cmpi.w #20153,d0
    6f14:	670a           	beq.s 6f20 <debug_cmd+0x1c>
    6f16:	2057           	movea.l (sp),a0
    6f18:	3010           	move.w (a0),d0
    6f1a:	0c40 a00e      	cmpi.w #-24562,d0
    6f1e:	661e           	bne.s 6f3e <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
    6f20:	2f2f 0014      	move.l 20(sp),-(sp)
    6f24:	2f2f 0014      	move.l 20(sp),-(sp)
    6f28:	2f2f 0014      	move.l 20(sp),-(sp)
    6f2c:	2f2f 0014      	move.l 20(sp),-(sp)
    6f30:	4878 0058      	pea 58 <_start+0x58>
    6f34:	206f 0014      	movea.l 20(sp),a0
    6f38:	4e90           	jsr (a0)
    6f3a:	4fef 0014      	lea 20(sp),sp
	}
}
    6f3e:	588f           	addq.l #4,sp
    6f40:	4e75           	rts

00006f42 <debug_clear>:
	barto_cmd_text,
};

void debug_clear()
{
	debug_cmd(barto_cmd_clear, 0, 0, 0);
    6f42:	42a7           	clr.l -(sp)
    6f44:	42a7           	clr.l -(sp)
    6f46:	42a7           	clr.l -(sp)
    6f48:	42a7           	clr.l -(sp)
    6f4a:	4eba ffb8      	jsr 6f04 <debug_cmd>(pc)
    6f4e:	4fef 0010      	lea 16(sp),sp
}
    6f52:	4e75           	rts

00006f54 <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color)
{
    6f54:	518f           	subq.l #8,sp
    6f56:	2f02           	move.l d2,-(sp)
    6f58:	226f 0010      	movea.l 16(sp),a1
    6f5c:	206f 0014      	movea.l 20(sp),a0
    6f60:	222f 0018      	move.l 24(sp),d1
    6f64:	202f 001c      	move.l 28(sp),d0
    6f68:	3249           	movea.w a1,a1
    6f6a:	3f49 000a      	move.w a1,10(sp)
    6f6e:	3048           	movea.w a0,a0
    6f70:	3f48 0008      	move.w a0,8(sp)
    6f74:	3201           	move.w d1,d1
    6f76:	3f41 0006      	move.w d1,6(sp)
    6f7a:	3000           	move.w d0,d0
    6f7c:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    6f80:	302f 0006      	move.w 6(sp),d0
    6f84:	48c0           	ext.l d0
    6f86:	4840           	swap d0
    6f88:	4240           	clr.w d0
    6f8a:	322f 0004      	move.w 4(sp),d1
    6f8e:	48c1           	ext.l d1
    6f90:	8280           	or.l d0,d1
    6f92:	302f 000a      	move.w 10(sp),d0
    6f96:	48c0           	ext.l d0
    6f98:	4840           	swap d0
    6f9a:	4240           	clr.w d0
    6f9c:	306f 0008      	movea.w 8(sp),a0
    6fa0:	2408           	move.l a0,d2
    6fa2:	8082           	or.l d2,d0
    6fa4:	2f2f 0020      	move.l 32(sp),-(sp)
    6fa8:	2f01           	move.l d1,-(sp)
    6faa:	2f00           	move.l d0,-(sp)
    6fac:	4878 0001      	pea 1 <_start+0x1>
    6fb0:	4eba ff52      	jsr 6f04 <debug_cmd>(pc)
    6fb4:	4fef 0010      	lea 16(sp),sp
}
    6fb8:	241f           	move.l (sp)+,d2
    6fba:	508f           	addq.l #8,sp
    6fbc:	4e75           	rts

00006fbe <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color)
{
    6fbe:	518f           	subq.l #8,sp
    6fc0:	2f02           	move.l d2,-(sp)
    6fc2:	226f 0010      	movea.l 16(sp),a1
    6fc6:	206f 0014      	movea.l 20(sp),a0
    6fca:	222f 0018      	move.l 24(sp),d1
    6fce:	202f 001c      	move.l 28(sp),d0
    6fd2:	3249           	movea.w a1,a1
    6fd4:	3f49 000a      	move.w a1,10(sp)
    6fd8:	3048           	movea.w a0,a0
    6fda:	3f48 0008      	move.w a0,8(sp)
    6fde:	3201           	move.w d1,d1
    6fe0:	3f41 0006      	move.w d1,6(sp)
    6fe4:	3000           	move.w d0,d0
    6fe6:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    6fea:	302f 0006      	move.w 6(sp),d0
    6fee:	48c0           	ext.l d0
    6ff0:	4840           	swap d0
    6ff2:	4240           	clr.w d0
    6ff4:	322f 0004      	move.w 4(sp),d1
    6ff8:	48c1           	ext.l d1
    6ffa:	8280           	or.l d0,d1
    6ffc:	302f 000a      	move.w 10(sp),d0
    7000:	48c0           	ext.l d0
    7002:	4840           	swap d0
    7004:	4240           	clr.w d0
    7006:	306f 0008      	movea.w 8(sp),a0
    700a:	2408           	move.l a0,d2
    700c:	8082           	or.l d2,d0
    700e:	2f2f 0020      	move.l 32(sp),-(sp)
    7012:	2f01           	move.l d1,-(sp)
    7014:	2f00           	move.l d0,-(sp)
    7016:	4878 0002      	pea 2 <_start+0x2>
    701a:	4eba fee8      	jsr 6f04 <debug_cmd>(pc)
    701e:	4fef 0010      	lea 16(sp),sp
}
    7022:	241f           	move.l (sp)+,d2
    7024:	508f           	addq.l #8,sp
    7026:	4e75           	rts

00007028 <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color)
{
    7028:	598f           	subq.l #4,sp
    702a:	2f02           	move.l d2,-(sp)
    702c:	222f 000c      	move.l 12(sp),d1
    7030:	202f 0010      	move.l 16(sp),d0
    7034:	3201           	move.w d1,d1
    7036:	3f41 0006      	move.w d1,6(sp)
    703a:	3000           	move.w d0,d0
    703c:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
    7040:	202f 0014      	move.l 20(sp),d0
    7044:	322f 0006      	move.w 6(sp),d1
    7048:	48c1           	ext.l d1
    704a:	4841           	swap d1
    704c:	4241           	clr.w d1
    704e:	306f 0004      	movea.w 4(sp),a0
    7052:	2408           	move.l a0,d2
    7054:	8282           	or.l d2,d1
    7056:	2f2f 0018      	move.l 24(sp),-(sp)
    705a:	2f00           	move.l d0,-(sp)
    705c:	2f01           	move.l d1,-(sp)
    705e:	4878 0003      	pea 3 <_start+0x3>
    7062:	4eba fea0      	jsr 6f04 <debug_cmd>(pc)
    7066:	4fef 0010      	lea 16(sp),sp
}
    706a:	241f           	move.l (sp)+,d2
    706c:	588f           	addq.l #4,sp
    706e:	4e75           	rts

00007070 <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    7070:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    7074:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    7078:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    707c:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    7080:	d041           	add.w d1,d0
	swap	d0
    7082:	4840           	swap d0
	clrw	d0
    7084:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    7086:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    708a:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    708e:	d081           	add.l d1,d0
	rts
    7090:	4e75           	rts

00007092 <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    7092:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    7094:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    7098:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    709c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    70a2:	6416           	bcc.s 70ba <__udivsi3+0x28>
	movel	d0, d2
    70a4:	2400           	move.l d0,d2
	clrw	d2
    70a6:	4242           	clr.w d2
	swap	d2
    70a8:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    70aa:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    70ac:	3002           	move.w d2,d0
	swap	d0
    70ae:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    70b0:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    70b4:	84c1           	divu.w d1,d2
	movew	d2, d0
    70b6:	3002           	move.w d2,d0
	jra	6f
    70b8:	6030           	bra.s 70ea <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    70ba:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    70bc:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    70be:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    70c0:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    70c6:	64f4           	bcc.s 70bc <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    70c8:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    70ca:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    70d0:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    70d2:	c2c0           	mulu.w d0,d1
	swap	d2
    70d4:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    70d6:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    70d8:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    70da:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    70dc:	660a           	bne.s 70e8 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    70de:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    70e0:	6506           	bcs.s 70e8 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    70e2:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    70e6:	6302           	bls.s 70ea <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    70e8:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    70ea:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    70ec:	4e75           	rts

000070ee <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    70ee:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    70f0:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    70f2:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    70f6:	6a04           	bpl.s 70fc <__divsi3+0xe>
	negl	d1
    70f8:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    70fa:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    70fc:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    7100:	6a04           	bpl.s 7106 <__divsi3+0x18>
	negl	d0
    7102:	4480           	neg.l d0
	negb	d2
    7104:	4402           	neg.b d2

2:	movel	d1, sp@-
    7106:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    7108:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    710a:	6186           	bsr.s 7092 <__udivsi3>
	addql	IMM (8), sp
    710c:	508f           	addq.l #8,sp

	tstb	d2
    710e:	4a02           	tst.b d2
	jpl	3f
    7110:	6a02           	bpl.s 7114 <__divsi3+0x26>
	negl	d0
    7112:	4480           	neg.l d0

3:	movel	sp@+, d2
    7114:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    7116:	4e75           	rts

00007118 <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    7118:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    711c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    7120:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7122:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    7124:	61c8           	bsr.s 70ee <__divsi3>
	addql	IMM (8), sp
    7126:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    7128:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    712c:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    712e:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    7130:	6100 ff3e      	bsr.w 7070 <__mulsi3>
	addql	IMM (8), sp
    7134:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    7136:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    713a:	9280           	sub.l d0,d1
	movel	d1, d0
    713c:	2001           	move.l d1,d0
	rts
    713e:	4e75           	rts

00007140 <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    7140:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7144:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    7148:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    714a:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    714c:	6100 ff44      	bsr.w 7092 <__udivsi3>
	addql	IMM (8), sp
    7150:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    7152:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    7156:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7158:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    715a:	6100 ff14      	bsr.w 7070 <__mulsi3>
	addql	IMM (8), sp
    715e:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    7160:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    7164:	9280           	sub.l d0,d1
	movel	d1, d0
    7166:	2001           	move.l d1,d0
	rts
    7168:	4e75           	rts

0000716a <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    716a:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    716c:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    7170:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    7174:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    7176:	4e75           	rts

00007178 <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    7178:	16c0           	move.b d0,(a3)+
	rts
    717a:	4e75           	rts

0000717c <c2p1x1_8_c5_gen_init>:
	.text
	FUNC(c2p1x1_8_c5_gen_init)
	.globl	SYM (c2p1x1_8_c5_gen_init)

SYM(c2p1x1_8_c5_gen_init):
	movem.l d0-d7/a0-a6, .gi_saveregs	
    717c:	48f9 7fff 0000 	movem.l d0-a6,71bc <.gi_saveregs>
    7182:	71bc 
	move.l  4(sp),d0
    7184:	202f 0004      	move.l 4(sp),d0
	move.l	8(sp),d1
    7188:	222f 0008      	move.l 8(sp),d1
	move.l	12(sp),d2
    718c:	242f 000c      	move.l 12(sp),d2
	move.l	16(sp),d3
    7190:	262f 0010      	move.l 16(sp),d3
	move.l  20(sp),d4
    7194:	282f 0014      	move.l 20(sp),d4
	move.l	24(sp),d5
    7198:	2a2f 0018      	move.l 24(sp),d5
	andi.l	IMM (0xffff),d0
    719c:	0280 0000 ffff 	andi.l #65535,d0
	mulu.w	d0,d3
    71a2:	c6c0           	mulu.w d0,d3
	lsr.l	#3,d3
    71a4:	e68b           	lsr.l #3,d3
	move.l	d3,c2p1x1_8_c5_gen_scroffs
    71a6:	23c3 0000 7512 	move.l d3,7512 <c2p1x1_8_c5_gen_scroffs>
	mulu.w	d0,d1
    71ac:	c2c0           	mulu.w d0,d1
	move.l	d1,c2p1x1_8_c5_gen_pixels
    71ae:	23c1 0000 7516 	move.l d1,7516 <c2p1x1_8_c5_gen_pixels>
	movem.l	.gi_saveregs,d0-d7/a0-a6
    71b4:	4cfa 7fff 0004 	movem.l 71bc <.gi_saveregs>(pc),d0-a6
	rts
    71ba:	4e75           	rts

000071bc <.gi_saveregs>:
	...

000071f8 <c2p1x1_8_c5_gen>:
	.text
	FUNC(c2p1x1_8_c5_gen)
	.globl	SYM (c2p1x1_8_c5_gen)

SYM(c2p1x1_8_c5_gen):
	movem.l d0-d7/a0-a6,.c2p_saveregs	
    71f8:	48f9 7fff 0000 	movem.l d0-a6,74d6 <.c2p_saveregs>
    71fe:	74d6 
	movem.l 4(sp),a0
    7200:	4cef 0100 0004 	movem.l 4(sp),a0
	movem.l 8(sp),a1
    7206:	4cef 0200 0008 	movem.l 8(sp),a1
    move.l	IMM (0x33333333),d5
    720c:	2a3c 3333 3333 	move.l #858993459,d5
	move.l	IMM (0x55555555),a6
    7212:	2c7c 5555 5555 	movea.l #1431655765,a6

	add.w	#BPLSIZE,a1
    7218:	d2fc 2bf8      	adda.w #11256,a1
	add.l	c2p1x1_8_c5_gen_scroffs,a1
    721c:	d3fa 02f4      	adda.l 7512 <c2p1x1_8_c5_gen_scroffs>(pc),a1

	move.l	c2p1x1_8_c5_gen_pixels,a2
    7220:	247a 02f4      	movea.l 7516 <c2p1x1_8_c5_gen_pixels>(pc),a2
	add.l	a0,a2
    7224:	d5c8           	adda.l a0,a2
	cmp.l	a0,a2
    7226:	b5c8           	cmpa.l a0,a2
	beq	.none
    7228:	6700 02a4      	beq.w 74ce <.none>

	movem.l	a0-a1,-(sp)
    722c:	48e7 00c0      	movem.l a0-a1,-(sp)

	move.l	(a0)+,d0
    7230:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    7232:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7234:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    7236:	2618           	move.l (a0)+,d3

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    7238:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    723e:	c084           	and.l d4,d0
	and.l	d4,d1
    7240:	c284           	and.l d4,d1
	and.l	d4,d2
    7242:	c484           	and.l d4,d2
	and.l	d4,d3
    7244:	c684           	and.l d4,d3
	lsl.l	#4,d0
    7246:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    7248:	e989           	lsl.l #4,d1
	or.l	d2,d0
    724a:	8082           	or.l d2,d0
	or.l	d3,d1
    724c:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    724e:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7250:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    7252:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7254:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    7256:	c484           	and.l d4,d2
	and.l	d4,d6
    7258:	cc84           	and.l d4,d6
	and.l	d4,d3
    725a:	c684           	and.l d4,d3
	and.l	d4,d7
    725c:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    725e:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    7260:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    7262:	8486           	or.l d6,d2
	or.l	d7,d3
    7264:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    7266:	3c02           	move.w d2,d6
	move.w	d3,d7
    7268:	3e03           	move.w d3,d7
	move.w	d0,d2
    726a:	3400           	move.w d0,d2
	move.w	d1,d3
    726c:	3601           	move.w d1,d3
	swap	d2
    726e:	4842           	swap d2
	swap	d3
    7270:	4843           	swap d3
	move.w	d2,d0
    7272:	3002           	move.w d2,d0
	move.w	d3,d1
    7274:	3203           	move.w d3,d1
	move.w	d6,d2
    7276:	3406           	move.w d6,d2
	move.w	d7,d3
    7278:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    727a:	2c02           	move.l d2,d6
	move.l	d3,d7
    727c:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    727e:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7280:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    7282:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7284:	b387           	eor.l d1,d7
	and.l	d5,d6
    7286:	cc85           	and.l d5,d6
	and.l	d5,d7
    7288:	ce85           	and.l d5,d7
	eor.l	d6,d0
    728a:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    728c:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    728e:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7290:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    7292:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7294:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    7296:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    729c:	2c01           	move.l d1,d6
	move.l	d3,d7
    729e:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    72a0:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    72a2:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    72a4:	b186           	eor.l d0,d6
	eor.l	d2,d7
    72a6:	b587           	eor.l d2,d7
	bra	.start1
    72a8:	6000 0088      	bra.w 7332 <.start1>

000072ac <.x1>:
.x1:
	move.l	(a0)+,d0
    72ac:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    72ae:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    72b0:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    72b2:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    72b4:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    72b8:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    72be:	c084           	and.l d4,d0
	and.l	d4,d1
    72c0:	c284           	and.l d4,d1
	and.l	d4,d2
    72c2:	c484           	and.l d4,d2
	and.l	d4,d3
    72c4:	c684           	and.l d4,d3
	lsl.l	#4,d0
    72c6:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    72c8:	e989           	lsl.l #4,d1
	or.l	d2,d0
    72ca:	8082           	or.l d2,d0
	or.l	d3,d1
    72cc:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    72ce:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    72d0:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    72d2:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    72d4:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    72d6:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    72da:	c484           	and.l d4,d2
	and.l	d4,d6
    72dc:	cc84           	and.l d4,d6
	and.l	d4,d3
    72de:	c684           	and.l d4,d3
	and.l	d4,d7
    72e0:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    72e2:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    72e4:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    72e6:	8486           	or.l d6,d2
	or.l	d7,d3
    72e8:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    72ea:	3c02           	move.w d2,d6
	move.w	d3,d7
    72ec:	3e03           	move.w d3,d7
	move.w	d0,d2
    72ee:	3400           	move.w d0,d2
	move.w	d1,d3
    72f0:	3601           	move.w d1,d3
	swap	d2
    72f2:	4842           	swap d2
	swap	d3
    72f4:	4843           	swap d3
	move.w	d2,d0
    72f6:	3002           	move.w d2,d0
	move.w	d3,d1
    72f8:	3203           	move.w d3,d1
	move.w	d6,d2
    72fa:	3406           	move.w d6,d2
	move.w	d7,d3
    72fc:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    72fe:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    7302:	2c02           	move.l d2,d6
	move.l	d3,d7
    7304:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    7306:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7308:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    730a:	b186           	eor.l d0,d6
	eor.l	d1,d7
    730c:	b387           	eor.l d1,d7
	and.l	d5,d6
    730e:	cc85           	and.l d5,d6
	and.l	d5,d7
    7310:	ce85           	and.l d5,d7
	eor.l	d6,d0
    7312:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7314:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    7316:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7318:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    731a:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    731c:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    731e:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7324:	2c01           	move.l d1,d6
	move.l	d3,d7
    7326:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7328:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    732a:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    732c:	b186           	eor.l d0,d6
	eor.l	d2,d7
    732e:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    7330:	22cd           	move.l a5,(a1)+

00007332 <.start1>:
.start1:
	and.l	d4,d6
    7332:	cc84           	and.l d4,d6
	and.l	d4,d7
    7334:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7336:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7338:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    733a:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    733c:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    733e:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    7340:	bf83           	eor.l d7,d3

	move.l	a6,d4
    7342:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    7344:	2c01           	move.l d1,d6
	move.l	d3,d7
    7346:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    7348:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    734a:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    734c:	b186           	eor.l d0,d6
	eor.l	d2,d7
    734e:	b587           	eor.l d2,d7
	and.l	d4,d6
    7350:	cc84           	and.l d4,d6
	and.l	d4,d7
    7352:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7354:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7356:	bf82           	eor.l d7,d2
	add.l	d6,d6
    7358:	dc86           	add.l d6,d6
	add.l	d7,d7
    735a:	de87           	add.l d7,d7
	eor.l	d1,d6
    735c:	b386           	eor.l d1,d6
	eor.l	d3,d7
    735e:	b787           	eor.l d3,d7

	move.l	d0,a4
    7360:	2840           	movea.l d0,a4
	move.l	d2,a5
    7362:	2a42           	movea.l d2,a5
	move.l	d6,a3
    7364:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    7366:	b5c8           	cmpa.l a0,a2
	bne	.x1
    7368:	6600 ff42      	bne.w 72ac <.x1>
	move.l	d7,-BPLSIZE(a1)
    736c:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    7370:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    7374:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    7378:	22cd           	move.l a5,(a1)+

	movem.l	(sp)+,a0-a1
    737a:	4cdf 0300      	movem.l (sp)+,a0-a1
	add.l	#BPLSIZE*4,a1
    737e:	d3fc 0000 afe0 	adda.l #45024,a1

	move.l	(a0)+,d0
    7384:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    7386:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7388:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    738a:	2618           	move.l (a0)+,d3

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    738c:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    7392:	c084           	and.l d4,d0
	and.l	d4,d1
    7394:	c284           	and.l d4,d1
	and.l	d4,d2
    7396:	c484           	and.l d4,d2
	and.l	d4,d3
    7398:	c684           	and.l d4,d3
	lsr.l	#4,d2
    739a:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    739c:	e88b           	lsr.l #4,d3
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

	and.l	d4,d2			//; Merge 4x1, part 2
    73aa:	c484           	and.l d4,d2
	and.l	d4,d6
    73ac:	cc84           	and.l d4,d6
	and.l	d4,d3
    73ae:	c684           	and.l d4,d3
	and.l	d4,d7
    73b0:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    73b2:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    73b4:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    73b6:	8486           	or.l d6,d2
	or.l	d7,d3
    73b8:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    73ba:	3c02           	move.w d2,d6
	move.w	d3,d7
    73bc:	3e03           	move.w d3,d7
	move.w	d0,d2
    73be:	3400           	move.w d0,d2
	move.w	d1,d3
    73c0:	3601           	move.w d1,d3
	swap	d2
    73c2:	4842           	swap d2
	swap	d3
    73c4:	4843           	swap d3
	move.w	d2,d0
    73c6:	3002           	move.w d2,d0
	move.w	d3,d1
    73c8:	3203           	move.w d3,d1
	move.w	d6,d2
    73ca:	3406           	move.w d6,d2
	move.w	d7,d3
    73cc:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    73ce:	2c02           	move.l d2,d6
	move.l	d3,d7
    73d0:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    73d2:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    73d4:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    73d6:	b186           	eor.l d0,d6
	eor.l	d1,d7
    73d8:	b387           	eor.l d1,d7
	and.l	d5,d6
    73da:	cc85           	and.l d5,d6
	and.l	d5,d7
    73dc:	ce85           	and.l d5,d7
	eor.l	d6,d0
    73de:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    73e0:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    73e2:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    73e4:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    73e6:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    73e8:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    73ea:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    73f0:	2c01           	move.l d1,d6
	move.l	d3,d7
    73f2:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    73f4:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    73f6:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    73f8:	b186           	eor.l d0,d6
	eor.l	d2,d7
    73fa:	b587           	eor.l d2,d7
	bra	.start2
    73fc:	6000 0088      	bra.w 7486 <.start2>

00007400 <.x2>:
.x2:
	move.l	(a0)+,d0
    7400:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    7402:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7404:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    7406:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    7408:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    740c:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    7412:	c084           	and.l d4,d0
	and.l	d4,d1
    7414:	c284           	and.l d4,d1
	and.l	d4,d2
    7416:	c484           	and.l d4,d2
	and.l	d4,d3
    7418:	c684           	and.l d4,d3
	lsr.l	#4,d2
    741a:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    741c:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    741e:	8082           	or.l d2,d0
	or.l	d3,d1
    7420:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    7422:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7424:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    7426:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7428:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    742a:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    742e:	c484           	and.l d4,d2
	and.l	d4,d6
    7430:	cc84           	and.l d4,d6
	and.l	d4,d3
    7432:	c684           	and.l d4,d3
	and.l	d4,d7
    7434:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    7436:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    7438:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    743a:	8486           	or.l d6,d2
	or.l	d7,d3
    743c:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    743e:	3c02           	move.w d2,d6
	move.w	d3,d7
    7440:	3e03           	move.w d3,d7
	move.w	d0,d2
    7442:	3400           	move.w d0,d2
	move.w	d1,d3
    7444:	3601           	move.w d1,d3
	swap	d2
    7446:	4842           	swap d2
	swap	d3
    7448:	4843           	swap d3
	move.w	d2,d0
    744a:	3002           	move.w d2,d0
	move.w	d3,d1
    744c:	3203           	move.w d3,d1
	move.w	d6,d2
    744e:	3406           	move.w d6,d2
	move.w	d7,d3
    7450:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    7452:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    7456:	2c02           	move.l d2,d6
	move.l	d3,d7
    7458:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    745a:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    745c:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    745e:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7460:	b387           	eor.l d1,d7
	and.l	d5,d6
    7462:	cc85           	and.l d5,d6
	and.l	d5,d7
    7464:	ce85           	and.l d5,d7
	eor.l	d6,d0
    7466:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7468:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    746a:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    746c:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    746e:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7470:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    7472:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7478:	2c01           	move.l d1,d6
	move.l	d3,d7
    747a:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    747c:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    747e:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7480:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7482:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    7484:	22cd           	move.l a5,(a1)+

00007486 <.start2>:
.start2:
	and.l	d4,d6
    7486:	cc84           	and.l d4,d6
	and.l	d4,d7
    7488:	ce84           	and.l d4,d7
	eor.l	d6,d0
    748a:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    748c:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    748e:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    7490:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    7492:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    7494:	bf83           	eor.l d7,d3

	move.l	a6,d4
    7496:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    7498:	2c01           	move.l d1,d6
	move.l	d3,d7
    749a:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    749c:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    749e:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    74a0:	b186           	eor.l d0,d6
	eor.l	d2,d7
    74a2:	b587           	eor.l d2,d7
	and.l	d4,d6
    74a4:	cc84           	and.l d4,d6
	and.l	d4,d7
    74a6:	ce84           	and.l d4,d7
	eor.l	d6,d0
    74a8:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    74aa:	bf82           	eor.l d7,d2
	add.l	d6,d6
    74ac:	dc86           	add.l d6,d6
	add.l	d7,d7
    74ae:	de87           	add.l d7,d7
	eor.l	d1,d6
    74b0:	b386           	eor.l d1,d6
	eor.l	d3,d7
    74b2:	b787           	eor.l d3,d7

	move.l	d0,a4
    74b4:	2840           	movea.l d0,a4
	move.l	d2,a5
    74b6:	2a42           	movea.l d2,a5
	move.l	d6,a3
    74b8:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    74ba:	b5c8           	cmpa.l a0,a2
	bne	.x2
    74bc:	6600 ff42      	bne.w 7400 <.x2>
	move.l	d7,-BPLSIZE(a1)
    74c0:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    74c4:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    74c8:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    74cc:	22cd           	move.l a5,(a1)+

000074ce <.none>:
.none:
	movem.l .c2p_saveregs,d0-d7/a0-a6
    74ce:	4cfa 7fff 0004 	movem.l 74d6 <.c2p_saveregs>(pc),d0-a6
	rts
    74d4:	4e75           	rts

000074d6 <.c2p_saveregs>:
	...

00007512 <c2p1x1_8_c5_gen_scroffs>:
    7512:	0000 0001      	ori.b #1,d0

00007516 <c2p1x1_8_c5_gen_pixels>:

.c2p_saveregs: .dcb.b 60


c2p1x1_8_c5_gen_scroffs: dc.l	1
    7516:	0000 0001      	ori.b #1,d0
