
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
       2:	203c 0000 a000 	move.l #40960,d0
       8:	0480 0000 a000 	subi.l #40960,d0
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
      22:	41f9 0000 a000 	lea a000 <ClColor>,a0
      28:	2071 8800      	movea.l (0,a1,a0.l),a0
      2c:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      2e:	52af 0004      	addq.l #1,4(sp)
      32:	202f 0004      	move.l 4(sp),d0
      36:	b097           	cmp.l (sp),d0
      38:	65de           	bcs.s 18 <_start+0x18>

	count = __init_array_end - __init_array_start;
      3a:	203c 0000 a000 	move.l #40960,d0
      40:	0480 0000 a000 	subi.l #40960,d0
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
      5a:	41f9 0000 a000 	lea a000 <ClColor>,a0
      60:	2071 8800      	movea.l (0,a1,a0.l),a0
      64:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      66:	52af 0004      	addq.l #1,4(sp)
      6a:	202f 0004      	move.l 4(sp),d0
      6e:	b097           	cmp.l (sp),d0
      70:	65de           	bcs.s 50 <_start+0x50>

	main();
      72:	4eb9 0000 060e 	jsr 60e <main>

	// call dtors
	count = __fini_array_end - __fini_array_start;
      78:	203c 0000 a000 	move.l #40960,d0
      7e:	0480 0000 a000 	subi.l #40960,d0
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
      9a:	41f9 0000 a000 	lea a000 <ClColor>,a0
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
      b6:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
      bc:	3f68 0002 0002 	move.w 2(a0),2(sp)
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
      c2:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
      c8:	3028 0002      	move.w 2(a0),d0
      cc:	3000           	move.w d0,d0
      ce:	0280 0000 ffff 	andi.l #65535,d0
      d4:	0280 0000 4000 	andi.l #16384,d0
      da:	66e6           	bne.s c2 <WaitBlt+0xe>
}
      dc:	588f           	addq.l #4,sp
      de:	4e75           	rts

000000e0 <FreeDisplay>:
ULONG ClColor[] = { 0x1800000,0x1820db7,0x1840cdb,0x1860bb9,0x1880ab4,0x18a09a7,0x18c0875,0x18e0886,0x1900763,0x1920662,0x1940331,0x19608ad,0x1980272,0x19a0131,0x19c0463,0x19e0584,0x1a00342,0x1a20121,0x1a40222,
                    0x1a60110,0x1a80793,0x1aa0ab4,0x1ac09a7,0x1ae0cd5,0x1b00cc2,0x1b20886,0x1b40fff,0x1b60431,0x1b80db7,0x1ba0740,0x1bc0875,0x1be0ed9 };



void FreeDisplay( int clsize, int bplsize) {
      e0:	4fef fff0      	lea -16(sp),sp
      e4:	2f0e           	move.l a6,-(sp)
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
      e6:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
      ec:	6722           	beq.s 110 <FreeDisplay+0x30>
      ee:	2f79 0000 b7e0 	move.l b7e0 <Copperlist1>,16(sp)
      f4:	0010 
      f6:	2f6f 0018 000c 	move.l 24(sp),12(sp)
      fc:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
     102:	2c40           	movea.l d0,a6
     104:	226f 0010      	movea.l 16(sp),a1
     108:	202f 000c      	move.l 12(sp),d0
     10c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     110:	2039 0000 b7e4 	move.l b7e4 <Copperlist2>,d0
     116:	6722           	beq.s 13a <FreeDisplay+0x5a>
     118:	2f79 0000 b7e4 	move.l b7e4 <Copperlist2>,8(sp)
     11e:	0008 
     120:	2f6f 0018 0004 	move.l 24(sp),4(sp)
     126:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
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
     146:	2039 0000 b7e8 	move.l b7e8 <DrawBuffer>,d0
     14c:	4240           	clr.w d0
     14e:	4840           	swap d0
     150:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     154:	2039 0000 b7e8 	move.l b7e8 <DrawBuffer>,d0
     15a:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     15e:	2f79 0000 b7f0 	move.l b7f0 <DrawCopper>,4(sp)
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
     17e:	2039 0000 b7e8 	move.l b7e8 <DrawBuffer>,d0
     184:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     186:	2039 0000 b7ec 	move.l b7ec <ViewBuffer>,d0
     18c:	23c0 0000 b7e8 	move.l d0,b7e8 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     192:	2017           	move.l (sp),d0
     194:	23c0 0000 b7ec 	move.l d0,b7ec <ViewBuffer>
}
     19a:	4fef 000c      	lea 12(sp),sp
     19e:	4e75           	rts

000001a0 <SwapCl>:

void SwapCl() {
     1a0:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     1a2:	2039 0000 b7f0 	move.l b7f0 <DrawCopper>,d0
     1a8:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     1aa:	2039 0000 b7f4 	move.l b7f4 <ViewCopper>,d0
     1b0:	23c0 0000 b7f0 	move.l d0,b7f0 <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     1b6:	2017           	move.l (sp),d0
     1b8:	23c0 0000 b7f4 	move.l d0,b7f4 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     1be:	2039 0000 b7f4 	move.l b7f4 <ViewCopper>,d0
     1c4:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
     1ca:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     1ce:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
     1d4:	2017           	move.l (sp),d0
     1d6:	3140 0088      	move.w d0,136(a0)
}
     1da:	588f           	addq.l #4,sp
     1dc:	4e75           	rts

000001de <Utils_CopyMem>:

__attribute__((optimize("O3")))
void Utils_CopyMem( ULONG *source, ULONG *destination, ULONG size) {
     1de:	206f 0004      	movea.l 4(sp),a0
     1e2:	222f 000c      	move.l 12(sp),d1
  for( int i=0;i<size;i++) 
     1e6:	670e           	beq.s 1f6 <Utils_CopyMem+0x18>
     1e8:	226f 0008      	movea.l 8(sp),a1
     1ec:	7000           	moveq #0,d0
    *destination++ = *source++;  
     1ee:	22d8           	move.l (a0)+,(a1)+
  for( int i=0;i<size;i++) 
     1f0:	5280           	addq.l #1,d0
     1f2:	b081           	cmp.l d1,d0
     1f4:	66f8           	bne.s 1ee <Utils_CopyMem+0x10>
}
     1f6:	4e75           	rts

000001f8 <Utils_FillLong>:

void Utils_FillLong( ULONG *target, ULONG pattern, ULONG lines, 
                                            ULONG linelength, ULONG mod ) {
     1f8:	518f           	subq.l #8,sp
  for( int i=0;i<lines; i++) {
     1fa:	42af 0004      	clr.l 4(sp)
     1fe:	6030           	bra.s 230 <Utils_FillLong+0x38>
    for( int i2=0;i2<linelength;i2++) 
     200:	4297           	clr.l (sp)
     202:	6014           	bra.s 218 <Utils_FillLong+0x20>
      *target++ = pattern;
     204:	202f 000c      	move.l 12(sp),d0
     208:	2200           	move.l d0,d1
     20a:	5881           	addq.l #4,d1
     20c:	2f41 000c      	move.l d1,12(sp)
     210:	2040           	movea.l d0,a0
     212:	20af 0010      	move.l 16(sp),(a0)
    for( int i2=0;i2<linelength;i2++) 
     216:	5297           	addq.l #1,(sp)
     218:	2017           	move.l (sp),d0
     21a:	b0af 0018      	cmp.l 24(sp),d0
     21e:	65e4           	bcs.s 204 <Utils_FillLong+0xc>
    target += mod;
     220:	202f 001c      	move.l 28(sp),d0
     224:	d080           	add.l d0,d0
     226:	d080           	add.l d0,d0
     228:	d1af 000c      	add.l d0,12(sp)
  for( int i=0;i<lines; i++) {
     22c:	52af 0004      	addq.l #1,4(sp)
     230:	202f 0004      	move.l 4(sp),d0
     234:	b0af 0014      	cmp.l 20(sp),d0
     238:	65c6           	bcs.s 200 <Utils_FillLong+0x8>
  }
}
     23a:	508f           	addq.l #8,sp
     23c:	4e75           	rts

0000023e <MouseLeft>:

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     23e:	207c 00bf e001 	movea.l #12574721,a0
     244:	1010           	move.b (a0),d0
     246:	1000           	move.b d0,d0
     248:	0280 0000 00ff 	andi.l #255,d0
     24e:	7240           	moveq #64,d1
     250:	c081           	and.l d1,d0
     252:	57c0           	seq d0
     254:	4400           	neg.b d0
     256:	1000           	move.b d0,d0
     258:	0240 00ff      	andi.w #255,d0
     25c:	4e75           	rts

0000025e <MouseRight>:
     25e:	207c 00df f016 	movea.l #14675990,a0
     264:	3010           	move.w (a0),d0
     266:	3000           	move.w d0,d0
     268:	0280 0000 ffff 	andi.l #65535,d0
     26e:	0280 0000 0400 	andi.l #1024,d0
     274:	57c0           	seq d0
     276:	4400           	neg.b d0
     278:	1000           	move.b d0,d0
     27a:	0240 00ff      	andi.w #255,d0
     27e:	4e75           	rts

00000280 <interruptHandler.lto_priv.0>:
#include "zoom.h"
#include "zoom102.h"

//volatile int frameCounter = 0;

static __attribute__((interrupt)) void interruptHandler() {
     280:	2f08           	move.l a0,-(sp)
	hw->intreq=(1<<INTB_VERTB); hw->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     282:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
     288:	317c 0020 009c 	move.w #32,156(a0)
     28e:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
     294:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	//frameCounter++;
  //Zoom_VblankHandler();
}
     29a:	205f           	movea.l (sp)+,a0
     29c:	4e73           	rte

0000029e <RunDemo>:

void RunDemo() {
//               5432109876543210
  hw->dmacon = 0b1000011111111111;
     29e:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
     2a4:	317c 87ff 0096 	move.w #-30721,150(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req*/
  //PrepareDisplay();
  //CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
  
	while(1) {
		WaitVbl();
     2aa:	4eba 0260      	jsr 50c <WaitVbl>(pc)
    RunFrame();
     2ae:	4eba 0028      	jsr 2d8 <RunFrame>(pc)
     2b2:	60f6           	bra.s 2aa <RunDemo+0xc>

000002b4 <SetInterrupt>:
  
	//SetInterruptHandler((APTR)interruptHandler);
}

void SetInterrupt() {
  SetInterruptHandler((APTR)interruptHandler);
     2b4:	487a ffca      	pea 280 <interruptHandler.lto_priv.0>(pc)
     2b8:	4eba 0236      	jsr 4f0 <SetInterruptHandler>(pc)
     2bc:	588f           	addq.l #4,sp
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     2be:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
     2c4:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     2ca:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
     2d0:	317c 0020 009c 	move.w #32,156(a0)
}
     2d6:	4e75           	rts

000002d8 <RunFrame>:
  else
    Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer, (UWORD *)DrawBuffer, Zoom_LevelOfZoom, 5 );

  Zoom_Blit4ZoomFinished = 1;
  while( tmp == Zoom_LevelOfZoom) { }*/
     2d8:	4e75           	rts

000002da <Zoom_InsertShift>:
           0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
           0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000,
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

void Zoom_InsertShift( UWORD *copperlist, UWORD *values4shift) {
     2da:	4fef fff4      	lea -12(sp),sp
     2de:	2f02           	move.l d2,-(sp)
  for(int i = 0; i<6;i++) {
     2e0:	42af 000c      	clr.l 12(sp)
     2e4:	601e           	bra.s 304 <Zoom_InsertShift+0x2a>
    *copperlist = *values4shift++;
     2e6:	202f 0018      	move.l 24(sp),d0
     2ea:	2200           	move.l d0,d1
     2ec:	5481           	addq.l #2,d1
     2ee:	2f41 0018      	move.l d1,24(sp)
     2f2:	2040           	movea.l d0,a0
     2f4:	3010           	move.w (a0),d0
     2f6:	206f 0014      	movea.l 20(sp),a0
     2fa:	3080           	move.w d0,(a0)
    copperlist += 2;
     2fc:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<6;i++) {
     300:	52af 000c      	addq.l #1,12(sp)
     304:	7005           	moveq #5,d0
     306:	b0af 000c      	cmp.l 12(sp),d0
     30a:	6cda           	bge.s 2e6 <Zoom_InsertShift+0xc>
  }
  copperlist--;
     30c:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     310:	222f 0018      	move.l 24(sp),d1
     314:	2401           	move.l d1,d2
     316:	5482           	addq.l #2,d2
     318:	2f42 0018      	move.l d2,24(sp)
     31c:	202f 0014      	move.l 20(sp),d0
     320:	2400           	move.l d0,d2
     322:	5482           	addq.l #2,d2
     324:	2f42 0014      	move.l d2,20(sp)
     328:	2041           	movea.l d1,a0
     32a:	3210           	move.w (a0),d1
     32c:	2040           	movea.l d0,a0
     32e:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     330:	202f 0018      	move.l 24(sp),d0
     334:	2200           	move.l d0,d1
     336:	5481           	addq.l #2,d1
     338:	2f41 0018      	move.l d1,24(sp)
     33c:	2040           	movea.l d0,a0
     33e:	3010           	move.w (a0),d0
     340:	206f 0014      	movea.l 20(sp),a0
     344:	3080           	move.w d0,(a0)
  copperlist += 2;
     346:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     34a:	42af 0008      	clr.l 8(sp)
     34e:	601e           	bra.s 36e <Zoom_InsertShift+0x94>
    *copperlist = *values4shift++;
     350:	202f 0018      	move.l 24(sp),d0
     354:	2200           	move.l d0,d1
     356:	5481           	addq.l #2,d1
     358:	2f41 0018      	move.l d1,24(sp)
     35c:	2040           	movea.l d0,a0
     35e:	3010           	move.w (a0),d0
     360:	206f 0014      	movea.l 20(sp),a0
     364:	3080           	move.w d0,(a0)
    copperlist += 2;
     366:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     36a:	52af 0008      	addq.l #1,8(sp)
     36e:	7009           	moveq #9,d0
     370:	b0af 0008      	cmp.l 8(sp),d0
     374:	6cda           	bge.s 350 <Zoom_InsertShift+0x76>
  }
  copperlist--;
     376:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     37a:	222f 0018      	move.l 24(sp),d1
     37e:	2401           	move.l d1,d2
     380:	5482           	addq.l #2,d2
     382:	2f42 0018      	move.l d2,24(sp)
     386:	202f 0014      	move.l 20(sp),d0
     38a:	2400           	move.l d0,d2
     38c:	5482           	addq.l #2,d2
     38e:	2f42 0014      	move.l d2,20(sp)
     392:	2041           	movea.l d1,a0
     394:	3210           	move.w (a0),d1
     396:	2040           	movea.l d0,a0
     398:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     39a:	202f 0018      	move.l 24(sp),d0
     39e:	2200           	move.l d0,d1
     3a0:	5481           	addq.l #2,d1
     3a2:	2f41 0018      	move.l d1,24(sp)
     3a6:	2040           	movea.l d0,a0
     3a8:	3010           	move.w (a0),d0
     3aa:	206f 0014      	movea.l 20(sp),a0
     3ae:	3080           	move.w d0,(a0)
  copperlist += 2;
     3b0:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     3b4:	42af 0004      	clr.l 4(sp)
     3b8:	601e           	bra.s 3d8 <Zoom_InsertShift+0xfe>
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
  for(int i = 0; i<7;i++) {
     3d4:	52af 0004      	addq.l #1,4(sp)
     3d8:	7006           	moveq #6,d0
     3da:	b0af 0004      	cmp.l 4(sp),d0
     3de:	6cda           	bge.s 3ba <Zoom_InsertShift+0xe0>
  }
}
     3e0:	241f           	move.l (sp)+,d2
     3e2:	4fef 000c      	lea 12(sp),sp
     3e6:	4e75           	rts

000003e8 <Zoom_Shrink102>:

void Zoom_Shrink102( UWORD levelofshrink, UWORD volatile *copperlist )  {
     3e8:	518f           	subq.l #8,sp
     3ea:	202f 000c      	move.l 12(sp),d0
     3ee:	3000           	move.w d0,d0
     3f0:	3f40 0002      	move.w d0,2(sp)

  
  UWORD *values4shift = Values4Shift+levelofshrink*108;
     3f4:	7200           	moveq #0,d1
     3f6:	322f 0002      	move.w 2(sp),d1
     3fa:	2001           	move.l d1,d0
     3fc:	d080           	add.l d0,d0
     3fe:	d081           	add.l d1,d0
     400:	2200           	move.l d0,d1
     402:	e789           	lsl.l #3,d1
     404:	d081           	add.l d1,d0
     406:	e788           	lsl.l #3,d0
     408:	2200           	move.l d0,d1
     40a:	0681 0000 a318 	addi.l #41752,d1
     410:	2f41 0004      	move.l d1,4(sp)
  //copperlist+=3+73*2;
  Zoom_InsertShift( copperlist+3+73*2, values4shift);
     414:	202f 0010      	move.l 16(sp),d0
     418:	0680 0000 012a 	addi.l #298,d0
     41e:	2f2f 0004      	move.l 4(sp),-(sp)
     422:	2f00           	move.l d0,-(sp)
     424:	4eba feb4      	jsr 2da <Zoom_InsertShift>(pc)
     428:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+63+73*2, values4shift+27);
     42a:	7236           	moveq #54,d1
     42c:	d2af 0004      	add.l 4(sp),d1
     430:	202f 0010      	move.l 16(sp),d0
     434:	0680 0000 01a2 	addi.l #418,d0
     43a:	2f01           	move.l d1,-(sp)
     43c:	2f00           	move.l d0,-(sp)
     43e:	4eba fe9a      	jsr 2da <Zoom_InsertShift>(pc)
     442:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+119+73*2, values4shift+54);
     444:	726c           	moveq #108,d1
     446:	d2af 0004      	add.l 4(sp),d1
     44a:	202f 0010      	move.l 16(sp),d0
     44e:	0680 0000 0212 	addi.l #530,d0
     454:	2f01           	move.l d1,-(sp)
     456:	2f00           	move.l d0,-(sp)
     458:	4eba fe80      	jsr 2da <Zoom_InsertShift>(pc)
     45c:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+175+73*2, values4shift+81);
     45e:	222f 0004      	move.l 4(sp),d1
     462:	0681 0000 00a2 	addi.l #162,d1
     468:	202f 0010      	move.l 16(sp),d0
     46c:	0680 0000 0282 	addi.l #642,d0
     472:	2f01           	move.l d1,-(sp)
     474:	2f00           	move.l d0,-(sp)
     476:	4eba fe62      	jsr 2da <Zoom_InsertShift>(pc)
     47a:	508f           	addq.l #8,sp
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }*/
  
}
     47c:	508f           	addq.l #8,sp
     47e:	4e75           	rts

00000480 <GetVBR>:
volatile static APTR VBR=0;
static APTR SystemIrq;
 
struct View *ActiView;

static APTR GetVBR(void) {
     480:	4fef ffec      	lea -20(sp),sp
     484:	2f0e           	move.l a6,-(sp)
     486:	2f07           	move.l d7,-(sp)
	APTR vbr = 0;
     488:	42af 0018      	clr.l 24(sp)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     48c:	3f7c 4e7a 000a 	move.w #20090,10(sp)
     492:	3f7c 0801 000c 	move.w #2049,12(sp)
     498:	3f7c 4e73 000e 	move.w #20083,14(sp)

	if (SysBase->AttnFlags & AFF_68010) 
     49e:	2079 0000 b7fc 	movea.l b7fc <SysBase>,a0
     4a4:	3028 0128      	move.w 296(a0),d0
     4a8:	3000           	move.w d0,d0
     4aa:	0280 0000 ffff 	andi.l #65535,d0
     4b0:	7201           	moveq #1,d1
     4b2:	c081           	and.l d1,d0
     4b4:	672c           	beq.s 4e2 <GetVBR+0x62>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     4b6:	41ef 001c      	lea 28(sp),a0
     4ba:	41e8 ffee      	lea -18(a0),a0
     4be:	2f48 0014      	move.l a0,20(sp)
     4c2:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
     4c8:	2c40           	movea.l d0,a6
     4ca:	2e2f 0014      	move.l 20(sp),d7
     4ce:	cf8d           	exg d7,a5
     4d0:	4eae ffe2      	jsr -30(a6)
     4d4:	cf8d           	exg d7,a5
     4d6:	2f40 0010      	move.l d0,16(sp)
     4da:	202f 0010      	move.l 16(sp),d0
     4de:	2f40 0018      	move.l d0,24(sp)

	return vbr;
     4e2:	202f 0018      	move.l 24(sp),d0
}
     4e6:	2e1f           	move.l (sp)+,d7
     4e8:	2c5f           	movea.l (sp)+,a6
     4ea:	4fef 0014      	lea 20(sp),sp
     4ee:	4e75           	rts

000004f0 <SetInterruptHandler>:

void SetInterruptHandler(APTR interrupt) {
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     4f0:	2079 0000 b814 	movea.l b814 <VBR>,a0
     4f6:	41e8 006c      	lea 108(a0),a0
     4fa:	20af 0004      	move.l 4(sp),(a0)
}
     4fe:	4e75           	rts

00000500 <GetInterruptHandler>:

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     500:	2079 0000 b814 	movea.l b814 <VBR>,a0
     506:	2028 006c      	move.l 108(a0),d0
}
     50a:	4e75           	rts

0000050c <WaitVbl>:

//vblank begins at vpos 312 hpos 1 and ends at vpos 25 hpos 1
//vsync begins at line 2 hpos 132 and ends at vpos 5 hpos 18 
void WaitVbl() {
     50c:	518f           	subq.l #8,sp
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     50e:	207c 00df f004 	movea.l #14675972,a0
     514:	2010           	move.l (a0),d0
     516:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
     518:	2017           	move.l (sp),d0
     51a:	0280 0001 ff00 	andi.l #130816,d0
     520:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
     522:	2017           	move.l (sp),d0
     524:	0c80 0001 3700 	cmpi.l #79616,d0
     52a:	67e2           	beq.s 50e <WaitVbl+0x2>
			break;
	}
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     52c:	207c 00df f004 	movea.l #14675972,a0
     532:	2010           	move.l (a0),d0
     534:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
     538:	202f 0004      	move.l 4(sp),d0
     53c:	0280 0001 ff00 	andi.l #130816,d0
     542:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
     546:	202f 0004      	move.l 4(sp),d0
     54a:	0c80 0001 3700 	cmpi.l #79616,d0
     550:	66da           	bne.s 52c <WaitVbl+0x20>
			break;
	}
}
     552:	508f           	addq.l #8,sp
     554:	4e75           	rts

00000556 <TakeSystem>:

	WaitVbl();
	WaitVbl();*/


	VBR=GetVBR();
     556:	4eba ff28      	jsr 480 <GetVBR>(pc)
     55a:	23c0 0000 b814 	move.l d0,b814 <VBR>
	SystemIrq=GetInterruptHandler(); //store interrupt register
     560:	4eba ff9e      	jsr 500 <GetInterruptHandler>(pc)
     564:	23c0 0000 b818 	move.l d0,b818 <SystemIrq>
}
     56a:	4e75           	rts

0000056c <FreeSystem>:

	//restore interrupts
	//SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
     56c:	2079 0000 b808 	movea.l b808 <GfxBase>,a0
     572:	2028 0026      	move.l 38(a0),d0
     576:	2079 0000 b800 	movea.l b800 <custom>,a0
     57c:	2140 0080      	move.l d0,128(a0)
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
     580:	2079 0000 b808 	movea.l b808 <GfxBase>,a0
     586:	2028 0032      	move.l 50(a0),d0
     58a:	2079 0000 b800 	movea.l b800 <custom>,a0
     590:	2140 0084      	move.l d0,132(a0)
	custom->copjmp1=0x7fff; //start coppper
     594:	2079 0000 b800 	movea.l b800 <custom>,a0
     59a:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
     5a0:	3039 0000 b80e 	move.w b80e <SystemInts>,d0
     5a6:	2079 0000 b800 	movea.l b800 <custom>,a0
     5ac:	0040 8000      	ori.w #-32768,d0
     5b0:	3140 009a      	move.w d0,154(a0)
	custom->dmacon=SystemDMA|0x8000;
     5b4:	3039 0000 b810 	move.w b810 <SystemDMA>,d0
     5ba:	2079 0000 b800 	movea.l b800 <custom>,a0
     5c0:	0040 8000      	ori.w #-32768,d0
     5c4:	3140 0096      	move.w d0,150(a0)
	custom->adkcon=SystemADKCON|0x8000;
     5c8:	3039 0000 b812 	move.w b812 <SystemADKCON>,d0
     5ce:	2079 0000 b800 	movea.l b800 <custom>,a0
     5d4:	0040 8000      	ori.w #-32768,d0
     5d8:	3140 009e      	move.w d0,158(a0)
	WaitTOF();
	WaitBlit();	*()
	//DisownBlitter();
	//Enable();
	//Permit();*/
}
     5dc:	4e75           	rts

000005de <interruptHandler.lto_priv.1>:
	*copListCurrent++=offsetof(struct Custom, color[index]);
	*copListCurrent++=color;
	return copListCurrent;
}

static __attribute__((interrupt)) void interruptHandler() {
     5de:	2f08           	move.l a0,-(sp)
     5e0:	2f00           	move.l d0,-(sp)
	custom->intreq=(1<<INTB_VERTB); custom->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     5e2:	2079 0000 b800 	movea.l b800 <custom>,a0
     5e8:	317c 0020 009c 	move.w #32,156(a0)
     5ee:	2079 0000 b800 	movea.l b800 <custom>,a0
     5f4:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	frameCounter++;
     5fa:	3039 0000 b820 	move.w b820 <frameCounter>,d0
     600:	5240           	addq.w #1,d0
     602:	33c0 0000 b820 	move.w d0,b820 <frameCounter>
}
     608:	201f           	move.l (sp)+,d0
     60a:	205f           	movea.l (sp)+,a0
     60c:	4e73           	rte

0000060e <main>:
	return copListEnd;
}

//#define a3 REG (a3)

int main() {
     60e:	4fef ffc0      	lea -64(sp),sp
     612:	48e7 3002      	movem.l d2-d3/a6,-(sp)

	ULONG *bp = 0x100;
     616:	2f7c 0000 0100 	move.l #256,72(sp)
     61c:	0048 
	*bp = 0;
     61e:	206f 0048      	movea.l 72(sp),a0
     622:	4290           	clr.l (a0)
	//Get AMOS Params
	register ULONG *asmparams;
	asm("\t move.l %%a3,%0" : "=r"(asmparams));
     624:	200b           	move.l a3,d0
     626:	2400           	move.l d0,d2
	//Zoom_Rawchip = *asmparams++;
	Zoom_Rawfast = *asmparams++;
     628:	2042           	movea.l d2,a0
     62a:	2408           	move.l a0,d2
     62c:	5882           	addq.l #4,d2
     62e:	2010           	move.l (a0),d0
     630:	23c0 0000 b850 	move.l d0,b850 <Zoom_Rawfast>

	ULONG tmp = 4;
     636:	7004           	moveq #4,d0
     638:	2f40 0044      	move.l d0,68(sp)
    SysBase = *((struct ExecBase**)tmp);
     63c:	206f 0044      	movea.l 68(sp),a0
     640:	2010           	move.l (a0),d0
     642:	23c0 0000 b7fc 	move.l d0,b7fc <SysBase>
	hw = (struct Custom*)0xdff000;
     648:	23fc 00df f000 	move.l #14675968,b7f8 <hw>
     64e:	0000 b7f8 

	SysBase = *((struct ExecBase**)4UL);
     652:	307c 0004      	movea.w #4,a0
     656:	2010           	move.l (a0),d0
     658:	23c0 0000 b7fc 	move.l d0,b7fc <SysBase>
	custom = (struct Custom*)0xdff000;
     65e:	23fc 00df f000 	move.l #14675968,b800 <custom>
     664:	0000 b800 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
     668:	2f7c 0000 7622 	move.l #30242,64(sp)
     66e:	0040 
     670:	42af 003c      	clr.l 60(sp)
     674:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
     67a:	2c40           	movea.l d0,a6
     67c:	226f 0040      	movea.l 64(sp),a1
     680:	202f 003c      	move.l 60(sp),d0
     684:	4eae fdd8      	jsr -552(a6)
     688:	2f40 0038      	move.l d0,56(sp)
     68c:	202f 0038      	move.l 56(sp),d0
     690:	23c0 0000 b808 	move.l d0,b808 <GfxBase>
	if (!GfxBase)
     696:	2039 0000 b808 	move.l b808 <GfxBase>,d0
     69c:	6614           	bne.s 6b2 <main+0xa4>
		Exit(0);
     69e:	42af 0034      	clr.l 52(sp)
     6a2:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     6a8:	2c40           	movea.l d0,a6
     6aa:	222f 0034      	move.l 52(sp),d1
     6ae:	4eae ff70      	jsr -144(a6)

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     6b2:	2f7c 0000 7633 	move.l #30259,48(sp)
     6b8:	0030 
     6ba:	42af 002c      	clr.l 44(sp)
     6be:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
     6c4:	2c40           	movea.l d0,a6
     6c6:	226f 0030      	movea.l 48(sp),a1
     6ca:	202f 002c      	move.l 44(sp),d0
     6ce:	4eae fdd8      	jsr -552(a6)
     6d2:	2f40 0028      	move.l d0,40(sp)
     6d6:	202f 0028      	move.l 40(sp),d0
     6da:	23c0 0000 b804 	move.l d0,b804 <DOSBase>
	if (!DOSBase)
     6e0:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     6e6:	6614           	bne.s 6fc <main+0xee>
		Exit(0);
     6e8:	42af 0024      	clr.l 36(sp)
     6ec:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     6f2:	2c40           	movea.l d0,a6
     6f4:	222f 0024      	move.l 36(sp),d1
     6f8:	4eae ff70      	jsr -144(a6)

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
     6fc:	4879 0000 763f 	pea 763f <c2p1x1_8_c5_gen_pixels+0x21>
     702:	4eba 6810      	jsr 6f14 <KPrintF>(pc)
     706:	588f           	addq.l #4,sp
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
     708:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     70e:	2c40           	movea.l d0,a6
     710:	4eae ffc4      	jsr -60(a6)
     714:	2f40 0020      	move.l d0,32(sp)
     718:	202f 0020      	move.l 32(sp),d0
     71c:	2f40 001c      	move.l d0,28(sp)
     720:	2f7c 0000 765b 	move.l #30299,24(sp)
     726:	0018 
     728:	700f           	moveq #15,d0
     72a:	2f40 0014      	move.l d0,20(sp)
     72e:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     734:	2c40           	movea.l d0,a6
     736:	222f 001c      	move.l 28(sp),d1
     73a:	242f 0018      	move.l 24(sp),d2
     73e:	262f 0014      	move.l 20(sp),d3
     742:	4eae ffd0      	jsr -48(a6)
     746:	2f40 0010      	move.l d0,16(sp)
	Delay(50);
     74a:	7032           	moveq #50,d0
     74c:	2f40 000c      	move.l d0,12(sp)
     750:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     756:	2c40           	movea.l d0,a6
     758:	222f 000c      	move.l 12(sp),d1
     75c:	4eae ff3a      	jsr -198(a6)

	//warpmode(1);
	// TODO: precalc stuff here
	//warpmode(0);

	TakeSystem();
     760:	4eba fdf4      	jsr 556 <TakeSystem>(pc)


	WaitVbl();
     764:	4eba fda6      	jsr 50c <WaitVbl>(pc)
	
    hw->dmacon = 0b1000011111111111;
     768:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
     76e:	317c 87ff 0096 	move.w #-30721,150(a0)
	//c2p();
  	Zoom_InitRun();
     774:	4eba 093c      	jsr 10b2 <Zoom_InitRun>(pc)
	Zoom_Run();
     778:	4eba 05b6      	jsr d30 <Zoom_Run>(pc)
	Zoom_Dealloc();
     77c:	4eba 0c0e      	jsr 138c <Zoom_Dealloc>(pc)
     780:	7000           	moveq #0,d0
	// END
	FreeSystem();

	/*CloseLibrary((struct Library*)DOSBase);
	CloseLibrary((struct Library*)GfxBase);*/
}
     782:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     786:	4fef 0040      	lea 64(sp),sp
     78a:	4e75           	rts

0000078c <SwScrollerTest>:

char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
     78c:	4fef ff98      	lea -104(sp),sp
     790:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  PrepareDisplaySW();
     794:	4eba 0218      	jsr 9ae <PrepareDisplaySW>(pc)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     798:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
     79e:	4878 0010      	pea 10 <_start+0x10>
     7a2:	4879 0000 a080 	pea a080 <ClsSprites>
     7a8:	42a7           	clr.l -(sp)
     7aa:	2f00           	move.l d0,-(sp)
     7ac:	4eba 2088      	jsr 2836 <TestCopperlistBatch>(pc)
     7b0:	4fef 0010      	lea 16(sp),sp
     7b4:	4a80           	tst.l d0
     7b6:	6642           	bne.s 7fa <SwScrollerTest+0x6e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     7b8:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     7be:	2c40           	movea.l d0,a6
     7c0:	4eae ffc4      	jsr -60(a6)
     7c4:	2f40 0070      	move.l d0,112(sp)
     7c8:	202f 0070      	move.l 112(sp),d0
     7cc:	2f40 006c      	move.l d0,108(sp)
     7d0:	2f7c 0000 767c 	move.l #30332,104(sp)
     7d6:	0068 
     7d8:	702c           	moveq #44,d0
     7da:	2f40 0064      	move.l d0,100(sp)
     7de:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     7e4:	2c40           	movea.l d0,a6
     7e6:	222f 006c      	move.l 108(sp),d1
     7ea:	242f 0068      	move.l 104(sp),d2
     7ee:	262f 0064      	move.l 100(sp),d3
     7f2:	4eae ffd0      	jsr -48(a6)
     7f6:	2f40 0060      	move.l d0,96(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     7fa:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
     800:	4878 000c      	pea c <_start+0xc>
     804:	4879 0000 a0c0 	pea a0c0 <ClScreen>
     80a:	4878 0010      	pea 10 <_start+0x10>
     80e:	2f00           	move.l d0,-(sp)
     810:	4eba 2024      	jsr 2836 <TestCopperlistBatch>(pc)
     814:	4fef 0010      	lea 16(sp),sp
     818:	4a80           	tst.l d0
     81a:	6642           	bne.s 85e <SwScrollerTest+0xd2>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     81c:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     822:	2c40           	movea.l d0,a6
     824:	4eae ffc4      	jsr -60(a6)
     828:	2f40 005c      	move.l d0,92(sp)
     82c:	202f 005c      	move.l 92(sp),d0
     830:	2f40 0058      	move.l d0,88(sp)
     834:	2f7c 0000 76b2 	move.l #30386,84(sp)
     83a:	0054 
     83c:	7036           	moveq #54,d0
     83e:	2f40 0050      	move.l d0,80(sp)
     842:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     848:	2c40           	movea.l d0,a6
     84a:	222f 0058      	move.l 88(sp),d1
     84e:	242f 0054      	move.l 84(sp),d2
     852:	262f 0050      	move.l 80(sp),d3
     856:	4eae ffd0      	jsr -48(a6)
     85a:	2f40 004c      	move.l d0,76(sp)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     85e:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
     864:	4878 0002      	pea 2 <_start+0x2>
     868:	4879 0000 a000 	pea a000 <ClColor>
     86e:	4878 001e      	pea 1e <_start+0x1e>
     872:	2f00           	move.l d0,-(sp)
     874:	4eba 1fc0      	jsr 2836 <TestCopperlistBatch>(pc)
     878:	4fef 0010      	lea 16(sp),sp
     87c:	4a80           	tst.l d0
     87e:	6642           	bne.s 8c2 <SwScrollerTest+0x136>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     880:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     886:	2c40           	movea.l d0,a6
     888:	4eae ffc4      	jsr -60(a6)
     88c:	2f40 0048      	move.l d0,72(sp)
     890:	202f 0048      	move.l 72(sp),d0
     894:	2f40 0044      	move.l d0,68(sp)
     898:	2f7c 0000 76e9 	move.l #30441,64(sp)
     89e:	0040 
     8a0:	7021           	moveq #33,d0
     8a2:	2f40 003c      	move.l d0,60(sp)
     8a6:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     8ac:	2c40           	movea.l d0,a6
     8ae:	222f 0044      	move.l 68(sp),d1
     8b2:	242f 0040      	move.l 64(sp),d2
     8b6:	262f 003c      	move.l 60(sp),d3
     8ba:	4eae ffd0      	jsr -48(a6)
     8be:	2f40 0038      	move.l d0,56(sp)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     8c2:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
     8c8:	4878 fffe      	pea fffffffe <gcc8_c_support.c.f93356b9+0xfffe099d>
     8cc:	4878 0020      	pea 20 <_start+0x20>
     8d0:	2f00           	move.l d0,-(sp)
     8d2:	4eba 1fa0      	jsr 2874 <TestCopperlistPos>(pc)
     8d6:	4fef 000c      	lea 12(sp),sp
     8da:	4a80           	tst.l d0
     8dc:	6642           	bne.s 920 <SwScrollerTest+0x194>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     8de:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     8e4:	2c40           	movea.l d0,a6
     8e6:	4eae ffc4      	jsr -60(a6)
     8ea:	2f40 0034      	move.l d0,52(sp)
     8ee:	202f 0034      	move.l 52(sp),d0
     8f2:	2f40 0030      	move.l d0,48(sp)
     8f6:	2f7c 0000 770b 	move.l #30475,44(sp)
     8fc:	002c 
     8fe:	7022           	moveq #34,d0
     900:	2f40 0028      	move.l d0,40(sp)
     904:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     90a:	2c40           	movea.l d0,a6
     90c:	222f 0030      	move.l 48(sp),d1
     910:	242f 002c      	move.l 44(sp),d2
     914:	262f 0028      	move.l 40(sp),d3
     918:	4eae ffd0      	jsr -48(a6)
     91c:	2f40 0024      	move.l d0,36(sp)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     920:	2239 0000 b23c 	move.l b23c <sw_text>,d1
     926:	2039 0000 b7e8 	move.l b7e8 <DrawBuffer>,d0
     92c:	2f01           	move.l d1,-(sp)
     92e:	2f00           	move.l d0,-(sp)
     930:	4879 0000 b240 	pea b240 <sw_testfont>
     936:	4eba 0380      	jsr cb8 <WriteFont>(pc)
     93a:	4fef 000c      	lea 12(sp),sp

  UWORD *tstpointer = (UWORD *)DrawBuffer;
     93e:	2f79 0000 b7e8 	move.l b7e8 <DrawBuffer>,32(sp)
     944:	0020 
  if( *tstpointer != 0xff00)
     946:	206f 0020      	movea.l 32(sp),a0
     94a:	3010           	move.w (a0),d0
     94c:	0c40 ff00      	cmpi.w #-256,d0
     950:	6742           	beq.s 994 <SwScrollerTest+0x208>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     952:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     958:	2c40           	movea.l d0,a6
     95a:	4eae ffc4      	jsr -60(a6)
     95e:	2f40 001c      	move.l d0,28(sp)
     962:	202f 001c      	move.l 28(sp),d0
     966:	2f40 0018      	move.l d0,24(sp)
     96a:	2f7c 0000 772e 	move.l #30510,20(sp)
     970:	0014 
     972:	7031           	moveq #49,d0
     974:	2f40 0010      	move.l d0,16(sp)
     978:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     97e:	2c40           	movea.l d0,a6
     980:	222f 0018      	move.l 24(sp),d1
     984:	242f 0014      	move.l 20(sp),d2
     988:	262f 0010      	move.l 16(sp),d3
     98c:	4eae ffd0      	jsr -48(a6)
     990:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
     994:	2f3c 0000 c800 	move.l #51200,-(sp)
     99a:	4878 0084      	pea 84 <_start+0x84>
     99e:	4eba f740      	jsr e0 <FreeDisplay>(pc)
     9a2:	508f           	addq.l #8,sp
     9a4:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     9a8:	4fef 0068      	lea 104(sp),sp
     9ac:	4e75           	rts

000009ae <PrepareDisplaySW>:
 #include "swscroller.h"
 #include "utils.h"
 
 INCBIN(swfont, "raw/ruby16_8_1.raw");

 int PrepareDisplaySW() {
     9ae:	4fef ffb8      	lea -72(sp),sp
     9b2:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildSW();
     9b6:	4eba 017e      	jsr b36 <ClbuildSW>(pc)
     9ba:	23c0 0000 b7e0 	move.l d0,b7e0 <Copperlist1>
  Copperlist2 = ClbuildSW();
     9c0:	4eba 0174      	jsr b36 <ClbuildSW>(pc)
     9c4:	23c0 0000 b7e4 	move.l d0,b7e4 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     9ca:	2f7c 0000 c800 	move.l #51200,80(sp)
     9d0:	0050 
     9d2:	7002           	moveq #2,d0
     9d4:	2f40 004c      	move.l d0,76(sp)
     9d8:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
     9de:	2c40           	movea.l d0,a6
     9e0:	202f 0050      	move.l 80(sp),d0
     9e4:	222f 004c      	move.l 76(sp),d1
     9e8:	4eae ff3a      	jsr -198(a6)
     9ec:	2f40 0048      	move.l d0,72(sp)
     9f0:	202f 0048      	move.l 72(sp),d0
     9f4:	23c0 0000 b7d8 	move.l d0,b7d8 <Bitplane1>
  if(Bitplane1 == 0) {
     9fa:	2039 0000 b7d8 	move.l b7d8 <Bitplane1>,d0
     a00:	6658           	bne.s a5a <PrepareDisplaySW+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     a02:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     a08:	2c40           	movea.l d0,a6
     a0a:	4eae ffc4      	jsr -60(a6)
     a0e:	2f40 0044      	move.l d0,68(sp)
     a12:	202f 0044      	move.l 68(sp),d0
     a16:	2f40 0040      	move.l d0,64(sp)
     a1a:	2f7c 0000 7d11 	move.l #32017,60(sp)
     a20:	003c 
     a22:	7026           	moveq #38,d0
     a24:	2f40 0038      	move.l d0,56(sp)
     a28:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     a2e:	2c40           	movea.l d0,a6
     a30:	222f 0040      	move.l 64(sp),d1
     a34:	242f 003c      	move.l 60(sp),d2
     a38:	262f 0038      	move.l 56(sp),d3
     a3c:	4eae ffd0      	jsr -48(a6)
     a40:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
     a44:	7001           	moveq #1,d0
     a46:	2f40 0030      	move.l d0,48(sp)
     a4a:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     a50:	2c40           	movea.l d0,a6
     a52:	222f 0030      	move.l 48(sp),d1
     a56:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
     a5a:	2039 0000 b7d8 	move.l b7d8 <Bitplane1>,d0
     a60:	23c0 0000 b7e8 	move.l d0,b7e8 <DrawBuffer>
  DrawCopper = Copperlist1;
     a66:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
     a6c:	23c0 0000 b7f0 	move.l d0,b7f0 <DrawCopper>
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
     a72:	2f7c 0000 c800 	move.l #51200,44(sp)
     a78:	002c 
     a7a:	7002           	moveq #2,d0
     a7c:	2f40 0028      	move.l d0,40(sp)
     a80:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
     a86:	2c40           	movea.l d0,a6
     a88:	202f 002c      	move.l 44(sp),d0
     a8c:	222f 0028      	move.l 40(sp),d1
     a90:	4eae ff3a      	jsr -198(a6)
     a94:	2f40 0024      	move.l d0,36(sp)
     a98:	202f 0024      	move.l 36(sp),d0
     a9c:	23c0 0000 b7dc 	move.l d0,b7dc <Bitplane2>
  if(Bitplane2 == 0) {
     aa2:	2039 0000 b7dc 	move.l b7dc <Bitplane2>,d0
     aa8:	6658           	bne.s b02 <PrepareDisplaySW+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     aaa:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     ab0:	2c40           	movea.l d0,a6
     ab2:	4eae ffc4      	jsr -60(a6)
     ab6:	2f40 0020      	move.l d0,32(sp)
     aba:	202f 0020      	move.l 32(sp),d0
     abe:	2f40 001c      	move.l d0,28(sp)
     ac2:	2f7c 0000 7d38 	move.l #32056,24(sp)
     ac8:	0018 
     aca:	7026           	moveq #38,d0
     acc:	2f40 0014      	move.l d0,20(sp)
     ad0:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     ad6:	2c40           	movea.l d0,a6
     ad8:	222f 001c      	move.l 28(sp),d1
     adc:	242f 0018      	move.l 24(sp),d2
     ae0:	262f 0014      	move.l 20(sp),d3
     ae4:	4eae ffd0      	jsr -48(a6)
     ae8:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     aec:	7001           	moveq #1,d0
     aee:	2f40 000c      	move.l d0,12(sp)
     af2:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     af8:	2c40           	movea.l d0,a6
     afa:	222f 000c      	move.l 12(sp),d1
     afe:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
     b02:	2039 0000 b7dc 	move.l b7dc <Bitplane2>,d0
     b08:	23c0 0000 b7ec 	move.l d0,b7ec <ViewBuffer>
  ViewCopper = Copperlist2;
     b0e:	2039 0000 b7e4 	move.l b7e4 <Copperlist2>,d0
     b14:	23c0 0000 b7f4 	move.l d0,b7f4 <ViewCopper>
  SwapCl();
     b1a:	4eba f684      	jsr 1a0 <SwapCl>(pc)
  SetBplPointers();
     b1e:	4eba f622      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
     b22:	4eba f67c      	jsr 1a0 <SwapCl>(pc)
  SetBplPointers();
     b26:	4eba f61a      	jsr 142 <SetBplPointers>(pc)
  return 0;
     b2a:	7000           	moveq #0,d0
}
     b2c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     b30:	4fef 0048      	lea 72(sp),sp
     b34:	4e75           	rts

00000b36 <ClbuildSW>:

ULONG * ClbuildSW() {
     b36:	4fef ffc4      	lea -60(sp),sp
     b3a:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
     b3e:	2f7c 0000 0084 	move.l #132,48(sp)
     b44:	0030 
     b46:	7002           	moveq #2,d0
     b48:	2f40 002c      	move.l d0,44(sp)
     b4c:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
     b52:	2c40           	movea.l d0,a6
     b54:	202f 0030      	move.l 48(sp),d0
     b58:	222f 002c      	move.l 44(sp),d1
     b5c:	4eae ff3a      	jsr -198(a6)
     b60:	2f40 0028      	move.l d0,40(sp)
     b64:	202f 0028      	move.l 40(sp),d0
     b68:	2f40 0024      	move.l d0,36(sp)
  
  if( retval == 0) {
     b6c:	6658           	bne.s bc6 <ClbuildSW+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     b6e:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     b74:	2c40           	movea.l d0,a6
     b76:	4eae ffc4      	jsr -60(a6)
     b7a:	2f40 0020      	move.l d0,32(sp)
     b7e:	202f 0020      	move.l 32(sp),d0
     b82:	2f40 001c      	move.l d0,28(sp)
     b86:	2f7c 0000 7d5f 	move.l #32095,24(sp)
     b8c:	0018 
     b8e:	7228           	moveq #40,d1
     b90:	2f41 0014      	move.l d1,20(sp)
     b94:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     b9a:	2c40           	movea.l d0,a6
     b9c:	222f 001c      	move.l 28(sp),d1
     ba0:	242f 0018      	move.l 24(sp),d2
     ba4:	262f 0014      	move.l 20(sp),d3
     ba8:	4eae ffd0      	jsr -48(a6)
     bac:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
     bb0:	7401           	moveq #1,d2
     bb2:	2f42 000c      	move.l d2,12(sp)
     bb6:	2039 0000 b804 	move.l b804 <DOSBase>,d0
     bbc:	2c40           	movea.l d0,a6
     bbe:	222f 000c      	move.l 12(sp),d1
     bc2:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
     bc6:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
     bcc:	2f7c 0000 a080 	move.l #41088,64(sp)
     bd2:	0040 
  for(int i=0; i<16;i++)
     bd4:	42af 003c      	clr.l 60(sp)
     bd8:	6024           	bra.s bfe <ClbuildSW+0xc8>
    *cl++ = *clpartinstruction++;
     bda:	222f 0040      	move.l 64(sp),d1
     bde:	2001           	move.l d1,d0
     be0:	5880           	addq.l #4,d0
     be2:	2f40 0040      	move.l d0,64(sp)
     be6:	202f 0044      	move.l 68(sp),d0
     bea:	2400           	move.l d0,d2
     bec:	5882           	addq.l #4,d2
     bee:	2f42 0044      	move.l d2,68(sp)
     bf2:	2041           	movea.l d1,a0
     bf4:	2210           	move.l (a0),d1
     bf6:	2040           	movea.l d0,a0
     bf8:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
     bfa:	52af 003c      	addq.l #1,60(sp)
     bfe:	700f           	moveq #15,d0
     c00:	b0af 003c      	cmp.l 60(sp),d0
     c04:	6cd4           	bge.s bda <ClbuildSW+0xa4>
  clpartinstruction = ClScreen;
     c06:	2f7c 0000 a0c0 	move.l #41152,64(sp)
     c0c:	0040 
  for(int i=0; i<12;i++)
     c0e:	42af 0038      	clr.l 56(sp)
     c12:	6024           	bra.s c38 <ClbuildSW+0x102>
    *cl++ = *clpartinstruction++;
     c14:	222f 0040      	move.l 64(sp),d1
     c18:	2401           	move.l d1,d2
     c1a:	5882           	addq.l #4,d2
     c1c:	2f42 0040      	move.l d2,64(sp)
     c20:	202f 0044      	move.l 68(sp),d0
     c24:	2400           	move.l d0,d2
     c26:	5882           	addq.l #4,d2
     c28:	2f42 0044      	move.l d2,68(sp)
     c2c:	2041           	movea.l d1,a0
     c2e:	2210           	move.l (a0),d1
     c30:	2040           	movea.l d0,a0
     c32:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
     c34:	52af 0038      	addq.l #1,56(sp)
     c38:	700b           	moveq #11,d0
     c3a:	b0af 0038      	cmp.l 56(sp),d0
     c3e:	6cd4           	bge.s c14 <ClbuildSW+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
     c40:	202f 0044      	move.l 68(sp),d0
     c44:	2200           	move.l d0,d1
     c46:	5881           	addq.l #4,d1
     c48:	2f41 0044      	move.l d1,68(sp)
     c4c:	2040           	movea.l d0,a0
     c4e:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
     c54:	202f 0044      	move.l 68(sp),d0
     c58:	2200           	move.l d0,d1
     c5a:	5881           	addq.l #4,d1
     c5c:	2f41 0044      	move.l d1,68(sp)
     c60:	2040           	movea.l d0,a0
     c62:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
     c68:	2f7c 0000 a000 	move.l #40960,64(sp)
     c6e:	0040 
  for(int i=0; i<2;i++)
     c70:	42af 0034      	clr.l 52(sp)
     c74:	6024           	bra.s c9a <ClbuildSW+0x164>
    *cl++ = *clpartinstruction++;
     c76:	222f 0040      	move.l 64(sp),d1
     c7a:	2001           	move.l d1,d0
     c7c:	5880           	addq.l #4,d0
     c7e:	2f40 0040      	move.l d0,64(sp)
     c82:	202f 0044      	move.l 68(sp),d0
     c86:	2400           	move.l d0,d2
     c88:	5882           	addq.l #4,d2
     c8a:	2f42 0044      	move.l d2,68(sp)
     c8e:	2041           	movea.l d1,a0
     c90:	2210           	move.l (a0),d1
     c92:	2040           	movea.l d0,a0
     c94:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
     c96:	52af 0034      	addq.l #1,52(sp)
     c9a:	7001           	moveq #1,d0
     c9c:	b0af 0034      	cmp.l 52(sp),d0
     ca0:	6cd4           	bge.s c76 <ClbuildSW+0x140>

  *cl = 0xfffffffe;
     ca2:	206f 0044      	movea.l 68(sp),a0
     ca6:	72fe           	moveq #-2,d1
     ca8:	2081           	move.l d1,(a0)

  return retval;
     caa:	202f 0024      	move.l 36(sp),d0
}
     cae:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
     cb2:	4fef 003c      	lea 60(sp),sp
     cb6:	4e75           	rts

00000cb8 <WriteFont>:

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
     cb8:	4fef fff0      	lea -16(sp),sp
  UWORD *bmpptr = Destination;
     cbc:	2f6f 0018 000c 	move.l 24(sp),12(sp)
  UWORD *fntptr = font;
     cc2:	2f6f 0014 0008 	move.l 20(sp),8(sp)

  char charpos = *text;
     cc8:	206f 001c      	movea.l 28(sp),a0
     ccc:	1f50 0003      	move.b (a0),3(sp)
  charpos -= 0x20;
     cd0:	102f 0003      	move.b 3(sp),d0
     cd4:	0600 ffe0      	addi.b #-32,d0
     cd8:	1f40 0003      	move.b d0,3(sp)
  charpos = charpos<<3;
     cdc:	102f 0003      	move.b 3(sp),d0
     ce0:	4880           	ext.w d0
     ce2:	48c0           	ext.l d0
     ce4:	e788           	lsl.l #3,d0
     ce6:	1f40 0003      	move.b d0,3(sp)
  fntptr += charpos;
     cea:	102f 0003      	move.b 3(sp),d0
     cee:	4880           	ext.w d0
     cf0:	3040           	movea.w d0,a0
     cf2:	2008           	move.l a0,d0
     cf4:	d088           	add.l a0,d0
     cf6:	d1af 0008      	add.l d0,8(sp)
  for(int i=1;i<=8;i++) {
     cfa:	7001           	moveq #1,d0
     cfc:	2f40 0004      	move.l d0,4(sp)
     d00:	6020           	bra.s d22 <WriteFont+0x6a>
    *bmpptr = *fntptr++;
     d02:	202f 0008      	move.l 8(sp),d0
     d06:	2200           	move.l d0,d1
     d08:	5481           	addq.l #2,d1
     d0a:	2f41 0008      	move.l d1,8(sp)
     d0e:	2040           	movea.l d0,a0
     d10:	3010           	move.w (a0),d0
     d12:	206f 000c      	movea.l 12(sp),a0
     d16:	3080           	move.w d0,(a0)
    bmpptr += 40;
     d18:	7050           	moveq #80,d0
     d1a:	d1af 000c      	add.l d0,12(sp)
  for(int i=1;i<=8;i++) {
     d1e:	52af 0004      	addq.l #1,4(sp)
     d22:	7208           	moveq #8,d1
     d24:	b2af 0004      	cmp.l 4(sp),d1
     d28:	6cd8           	bge.s d02 <WriteFont+0x4a>
  }

}
     d2a:	4fef 0010      	lea 16(sp),sp
     d2e:	4e75           	rts

00000d30 <Zoom_Run>:
                     0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0 };
int Zoom_Pic = 1;
int volatile Zoom_DrawPicture = 1;

void Zoom_Run() {
     d30:	598f           	subq.l #4,sp
  for(int i=0;i <2; i++)
     d32:	4297           	clr.l (sp)
     d34:	6068           	bra.s d9e <Zoom_Run+0x6e>
  {
    while(1) {
      WaitVbl();
     d36:	4eba f7d4      	jsr 50c <WaitVbl>(pc)
      if( Zoom_DrawPicture == 1) {    
     d3a:	2039 0000 b298 	move.l b298 <Zoom_DrawPicture>,d0
     d40:	7201           	moveq #1,d1
     d42:	b280           	cmp.l d0,d1
     d44:	6642           	bne.s d88 <Zoom_Run+0x58>
        Utils_CopyMem(imgptrs[Zoom_Pic], DrawBuffer, 14070);  
     d46:	2239 0000 b7e8 	move.l b7e8 <DrawBuffer>,d1
     d4c:	2039 0000 b294 	move.l b294 <Zoom_Pic>,d0
     d52:	d080           	add.l d0,d0
     d54:	2240           	movea.l d0,a1
     d56:	d3c0           	adda.l d0,a1
     d58:	41f9 0000 b854 	lea b854 <imgptrs>,a0
     d5e:	2031 8800      	move.l (0,a1,a0.l),d0
     d62:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x218>
     d66:	2f01           	move.l d1,-(sp)
     d68:	2f00           	move.l d0,-(sp)
     d6a:	4eba f472      	jsr 1de <Utils_CopyMem>(pc)
     d6e:	4fef 000c      	lea 12(sp),sp
        Zoom_DrawPicture = 0;
     d72:	7000           	moveq #0,d0
     d74:	23c0 0000 b298 	move.l d0,b298 <Zoom_DrawPicture>
        Zoom_Pic++;
     d7a:	2039 0000 b294 	move.l b294 <Zoom_Pic>,d0
     d80:	5280           	addq.l #1,d0
     d82:	23c0 0000 b294 	move.l d0,b294 <Zoom_Pic>
      }
  //Zoom_SetBplPointers(DrawBuffer, DrawCopper);    
      if(Zoom_Pic == 88 ) {
     d88:	2039 0000 b294 	move.l b294 <Zoom_Pic>,d0
     d8e:	7258           	moveq #88,d1
     d90:	b280           	cmp.l d0,d1
     d92:	66a2           	bne.s d36 <Zoom_Run+0x6>
        Zoom_Pic = 11;
     d94:	700b           	moveq #11,d0
     d96:	23c0 0000 b294 	move.l d0,b294 <Zoom_Pic>
  for(int i=0;i <2; i++)
     d9c:	5297           	addq.l #1,(sp)
     d9e:	7201           	moveq #1,d1
     da0:	b297           	cmp.l (sp),d1
     da2:	6c92           	bge.s d36 <Zoom_Run+0x6>
        break;
      }
    }  
  }
}
     da4:	588f           	addq.l #4,sp
     da6:	4e75           	rts

00000da8 <Zoom_VblankHandler>:

void Zoom_VblankHandler() {
     da8:	598f           	subq.l #4,sp

  hw->dmacon = 0b1000011111111111;
     daa:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
     db0:	317c 87ff 0096 	move.w #-30721,150(a0)
  Zoom_Counter++;
     db6:	3039 0000 b838 	move.w b838 <Zoom_Counter>,d0
     dbc:	5240           	addq.w #1,d0
     dbe:	33c0 0000 b838 	move.w d0,b838 <Zoom_Counter>
  SwapCl();
     dc4:	4eba f3da      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     dc8:	33fc 0001 0000 	move.w #1,b83e <Zoom_MouseReleased>
     dce:	b83e 
  if( MouseLeft())
     dd0:	4eba f46c      	jsr 23e <MouseLeft>(pc)
     dd4:	4a40           	tst.w d0
     dd6:	6708           	beq.s de0 <Zoom_VblankHandler+0x38>
    Zoom_Mousepressed = 1;
     dd8:	33fc 0001 0000 	move.w #1,b840 <Zoom_Mousepressed>
     dde:	b840 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     de0:	3039 0000 b840 	move.w b840 <Zoom_Mousepressed>,d0
     de6:	0c40 0001      	cmpi.w #1,d0
     dea:	6616           	bne.s e02 <Zoom_VblankHandler+0x5a>
     dec:	4eba f450      	jsr 23e <MouseLeft>(pc)
     df0:	4a40           	tst.w d0
     df2:	660e           	bne.s e02 <Zoom_VblankHandler+0x5a>
    Zoom_MouseReleased = 1;
     df4:	33fc 0001 0000 	move.w #1,b83e <Zoom_MouseReleased>
     dfa:	b83e 
    Zoom_Mousepressed = 0;
     dfc:	4279 0000 b840 	clr.w b840 <Zoom_Mousepressed>
  }
      
      Zoom_MouseReleased = 0;
     e02:	4279 0000 b83e 	clr.w b83e <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom <= 2) {
     e08:	3039 0000 b846 	move.w b846 <Zoom_LevelOf102Zoom>,d0
     e0e:	0c40 0002      	cmpi.w #2,d0
     e12:	6256           	bhi.s e6a <Zoom_VblankHandler+0xc2>
 
        if( Zoom_LevelOfZoom == 87)
     e14:	3039 0000 b844 	move.w b844 <Zoom_LevelOfZoom>,d0
     e1a:	0c40 0057      	cmpi.w #87,d0
     e1e:	660a           	bne.s e2a <Zoom_VblankHandler+0x82>
          Zoom_LevelOfZoom = 0;
     e20:	33fc 0000 0000 	move.w #0,b844 <Zoom_LevelOfZoom>
     e26:	b844 
     e28:	600e           	bra.s e38 <Zoom_VblankHandler+0x90>
        else
          Zoom_LevelOfZoom++;
     e2a:	3039 0000 b844 	move.w b844 <Zoom_LevelOfZoom>,d0
     e30:	5240           	addq.w #1,d0
     e32:	33c0 0000 b844 	move.w d0,b844 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;          
     e38:	33fc 000f 0000 	move.w #15,b846 <Zoom_LevelOf102Zoom>
     e3e:	b846 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     e40:	3039 0000 b844 	move.w b844 <Zoom_LevelOfZoom>,d0
     e46:	3000           	move.w d0,d0
     e48:	0280 0000 ffff 	andi.l #65535,d0
     e4e:	2f00           	move.l d0,-(sp)
     e50:	4eba 10d6      	jsr 1f28 <Zoom_SwapBuffers>(pc)
     e54:	588f           	addq.l #4,sp
        /*Zoom_SetBplPointers( ViewBuffer, ViewCopper);
        Zoom_SetBplPointers( ViewBuffer, DrawCopper);*/
        ULONG *bp = 0x102;
     e56:	2ebc 0000 0102 	move.l #258,(sp)
  	    *bp = 0;
     e5c:	2057           	movea.l (sp),a0
     e5e:	4290           	clr.l (a0)
        Zoom_DrawPicture = 1;     
     e60:	7001           	moveq #1,d0
     e62:	23c0 0000 b298 	move.l d0,b298 <Zoom_DrawPicture>
     e68:	600e           	bra.s e78 <Zoom_VblankHandler+0xd0>
      } else 
        Zoom_LevelOf102Zoom-=2;
     e6a:	3039 0000 b846 	move.w b846 <Zoom_LevelOf102Zoom>,d0
     e70:	5540           	subq.w #2,d0
     e72:	33c0 0000 b846 	move.w d0,b846 <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     e78:	2239 0000 b7f0 	move.l b7f0 <DrawCopper>,d1
     e7e:	3039 0000 b846 	move.w b846 <Zoom_LevelOf102Zoom>,d0
     e84:	3000           	move.w d0,d0
     e86:	0280 0000 ffff 	andi.l #65535,d0
     e8c:	2f01           	move.l d1,-(sp)
     e8e:	2f00           	move.l d0,-(sp)
     e90:	4eba f556      	jsr 3e8 <Zoom_Shrink102>(pc)
     e94:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     e96:	2239 0000 b7f0 	move.l b7f0 <DrawCopper>,d1
     e9c:	2039 0000 b7ec 	move.l b7ec <ViewBuffer>,d0
     ea2:	2f01           	move.l d1,-(sp)
     ea4:	2f00           	move.l d0,-(sp)
     ea6:	4eba 0fe8      	jsr 1e90 <Zoom_SetBplPointers>(pc)
     eaa:	508f           	addq.l #8,sp
 
}
     eac:	588f           	addq.l #4,sp
     eae:	4e75           	rts

00000eb0 <Zoom_ReverseVblankHandler>:


void Zoom_ReverseVblankHandler() {
  
  Zoom_Counter++;
     eb0:	3039 0000 b838 	move.w b838 <Zoom_Counter>,d0
     eb6:	5240           	addq.w #1,d0
     eb8:	33c0 0000 b838 	move.w d0,b838 <Zoom_Counter>
  SwapCl();
     ebe:	4eba f2e0      	jsr 1a0 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     ec2:	33fc 0001 0000 	move.w #1,b83e <Zoom_MouseReleased>
     ec8:	b83e 
  if( MouseLeft())
     eca:	4eba f372      	jsr 23e <MouseLeft>(pc)
     ece:	4a40           	tst.w d0
     ed0:	6708           	beq.s eda <Zoom_ReverseVblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     ed2:	33fc 0001 0000 	move.w #1,b840 <Zoom_Mousepressed>
     ed8:	b840 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     eda:	3039 0000 b840 	move.w b840 <Zoom_Mousepressed>,d0
     ee0:	0c40 0001      	cmpi.w #1,d0
     ee4:	6616           	bne.s efc <Zoom_ReverseVblankHandler+0x4c>
     ee6:	4eba f356      	jsr 23e <MouseLeft>(pc)
     eea:	4a40           	tst.w d0
     eec:	660e           	bne.s efc <Zoom_ReverseVblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     eee:	33fc 0001 0000 	move.w #1,b83e <Zoom_MouseReleased>
     ef4:	b83e 
    Zoom_Mousepressed = 0;
     ef6:	4279 0000 b840 	clr.w b840 <Zoom_Mousepressed>
    /*if( MouseLeft()) {
      while (MouseLeft())
      {
      }*/
      
      Zoom_MouseReleased = 0;
     efc:	4279 0000 b83e 	clr.w b83e <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 15) {
     f02:	3039 0000 b846 	move.w b846 <Zoom_LevelOf102Zoom>,d0
     f08:	0c40 000f      	cmpi.w #15,d0
     f0c:	6640           	bne.s f4e <Zoom_ReverseVblankHandler+0x9e>
 
        if( Zoom_LevelOfZoom == 0)
     f0e:	3039 0000 b844 	move.w b844 <Zoom_LevelOfZoom>,d0
     f14:	660a           	bne.s f20 <Zoom_ReverseVblankHandler+0x70>
          Zoom_LevelOfZoom = 17;
     f16:	33fc 0011 0000 	move.w #17,b844 <Zoom_LevelOfZoom>
     f1c:	b844 
     f1e:	600e           	bra.s f2e <Zoom_ReverseVblankHandler+0x7e>
        else
          Zoom_LevelOfZoom--;
     f20:	3039 0000 b844 	move.w b844 <Zoom_LevelOfZoom>,d0
     f26:	5340           	subq.w #1,d0
     f28:	33c0 0000 b844 	move.w d0,b844 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 0;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     f2e:	33fc 0000 0000 	move.w #0,b846 <Zoom_LevelOf102Zoom>
     f34:	b846 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     f36:	3039 0000 b844 	move.w b844 <Zoom_LevelOfZoom>,d0
     f3c:	3000           	move.w d0,d0
     f3e:	0280 0000 ffff 	andi.l #65535,d0
     f44:	2f00           	move.l d0,-(sp)
     f46:	4eba 0fe0      	jsr 1f28 <Zoom_SwapBuffers>(pc)
     f4a:	588f           	addq.l #4,sp
     f4c:	600e           	bra.s f5c <Zoom_ReverseVblankHandler+0xac>
      } else 
        Zoom_LevelOf102Zoom++;
     f4e:	3039 0000 b846 	move.w b846 <Zoom_LevelOf102Zoom>,d0
     f54:	5240           	addq.w #1,d0
     f56:	33c0 0000 b846 	move.w d0,b846 <Zoom_LevelOf102Zoom>
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     f5c:	2239 0000 b7f0 	move.l b7f0 <DrawCopper>,d1
     f62:	3039 0000 b846 	move.w b846 <Zoom_LevelOf102Zoom>,d0
     f68:	3000           	move.w d0,d0
     f6a:	0280 0000 ffff 	andi.l #65535,d0
     f70:	2f01           	move.l d1,-(sp)
     f72:	2f00           	move.l d0,-(sp)
     f74:	4eba f472      	jsr 3e8 <Zoom_Shrink102>(pc)
     f78:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     f7a:	2239 0000 b7f0 	move.l b7f0 <DrawCopper>,d1
     f80:	2039 0000 b7ec 	move.l b7ec <ViewBuffer>,d0
     f86:	2f01           	move.l d1,-(sp)
     f88:	2f00           	move.l d0,-(sp)
     f8a:	4eba 0f04      	jsr 1e90 <Zoom_SetBplPointers>(pc)
     f8e:	508f           	addq.l #8,sp
 
}
     f90:	4e75           	rts

00000f92 <Zoom_CopyWord>:

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080008, 
                                                       0x010a0000, 0x01001200 };

void  Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height) {  
     f92:	598f           	subq.l #4,sp
     f94:	202f 0010      	move.l 16(sp),d0
     f98:	3000           	move.w d0,d0
     f9a:	3f40 0002      	move.w d0,2(sp)

  WaitBlt();
     f9e:	4eba f114      	jsr b4 <WaitBlt>(pc)

  hw->bltapt = (UWORD *) source;
     fa2:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
     fa8:	216f 0008 0050 	move.l 8(sp),80(a0)
  hw->bltdpt = (UWORD *) destination;
     fae:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
     fb4:	216f 000c 0054 	move.l 12(sp),84(a0)
  hw->bltsize = (height<<6)+2;
     fba:	302f 0002      	move.w 2(sp),d0
     fbe:	ed48           	lsl.w #6,d0
     fc0:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
     fc6:	5440           	addq.w #2,d0
     fc8:	3140 0058      	move.w d0,88(a0)

}
     fcc:	588f           	addq.l #4,sp
     fce:	4e75           	rts

00000fd0 <Zoom_ZoomBlit>:

void Zoom_ZoomBlit( UWORD *source, UWORD *destination, UWORD height) {
     fd0:	518f           	subq.l #8,sp
     fd2:	202f 0014      	move.l 20(sp),d0
     fd6:	3000           	move.w d0,d0
     fd8:	3f40 0002      	move.w d0,2(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B

  UWORD *blta = source + ZoomBlit_Increment4SrcA;
     fdc:	3039 0000 b82e 	move.w b82e <ZoomBlit_Increment4SrcA>,d0
     fe2:	3000           	move.w d0,d0
     fe4:	0280 0000 ffff 	andi.l #65535,d0
     fea:	d080           	add.l d0,d0
     fec:	222f 000c      	move.l 12(sp),d1
     ff0:	d280           	add.l d0,d1
     ff2:	2f41 0004      	move.l d1,4(sp)
  WaitBlt();
     ff6:	4eba f0bc      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  
  hw->bltapt = blta;
     ffa:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    1000:	216f 0004 0050 	move.l 4(sp),80(a0)
  hw->bltbpt = source;
    1006:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    100c:	216f 000c 004c 	move.l 12(sp),76(a0)
  hw->bltdpt = destination;
    1012:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    1018:	216f 0010 0054 	move.l 16(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    101e:	302f 0002      	move.w 2(sp),d0
    1022:	ed48           	lsl.w #6,d0
    1024:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    102a:	5440           	addq.w #2,d0
    102c:	3140 0058      	move.w d0,88(a0)

}
    1030:	508f           	addq.l #8,sp
    1032:	4e75           	rts

00001034 <Zoom_ZoomBlit2>:

void Zoom_ZoomBlit2( UWORD *src4a, UWORD *src4b, UWORD *dst, UWORD height,
                                                 UWORD bltamod, UWORD bltbmod
                                                        , UWORD numofwords) {
    1034:	518f           	subq.l #8,sp
    1036:	226f 0018      	movea.l 24(sp),a1
    103a:	206f 001c      	movea.l 28(sp),a0
    103e:	222f 0020      	move.l 32(sp),d1
    1042:	202f 0024      	move.l 36(sp),d0
    1046:	3249           	movea.w a1,a1
    1048:	3f49 0006      	move.w a1,6(sp)
    104c:	3048           	movea.w a0,a0
    104e:	3f48 0004      	move.w a0,4(sp)
    1052:	3201           	move.w d1,d1
    1054:	3f41 0002      	move.w d1,2(sp)
    1058:	3000           	move.w d0,d0
    105a:	3e80           	move.w d0,(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B
  hw->bltamod = bltamod;
    105c:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    1062:	316f 0004 0064 	move.w 4(sp),100(a0)
  hw->bltbmod = bltbmod;  
    1068:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    106e:	316f 0002 0062 	move.w 2(sp),98(a0)
  hw->bltapt = src4a;
    1074:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    107a:	216f 000c 0050 	move.l 12(sp),80(a0)
  hw->bltbpt = src4b;
    1080:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    1086:	216f 0010 004c 	move.l 16(sp),76(a0)
  hw->bltdpt = dst;
    108c:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    1092:	216f 0014 0054 	move.l 20(sp),84(a0)
  hw->bltsize = (height<<6)+numofwords;
    1098:	302f 0006      	move.w 6(sp),d0
    109c:	ed48           	lsl.w #6,d0
    109e:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    10a4:	d057           	add.w (sp),d0
    10a6:	3140 0058      	move.w d0,88(a0)
  
  WaitBlt();
    10aa:	4eba f008      	jsr b4 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a  

}
    10ae:	508f           	addq.l #8,sp
    10b0:	4e75           	rts

000010b2 <Zoom_InitRun>:


void Zoom_InitRun() {
    10b2:	4fef ffdc      	lea -36(sp),sp
    10b6:	2f0e           	move.l a6,-(sp)

  /*Zoom_Rawchip = rawzoom_chip;
  Zoom_Rawfast = rawzoom_fast;*/

  int i = 0;
    10b8:	42af 0024      	clr.l 36(sp)
    10bc:	6034           	bra.s 10f2 <Zoom_InitRun+0x40>
  for(;i<88;i++) {
    imgptrs[i] = Zoom_Rawfast + 56280*i;
    10be:	2f3c 0000 dbd8 	move.l #56280,-(sp)
    10c4:	2f2f 0028      	move.l 40(sp),-(sp)
    10c8:	4eb9 0000 7178 	jsr 7178 <__mulsi3>
    10ce:	508f           	addq.l #8,sp
    10d0:	2200           	move.l d0,d1
    10d2:	2039 0000 b850 	move.l b850 <Zoom_Rawfast>,d0
    10d8:	d280           	add.l d0,d1
    10da:	202f 0024      	move.l 36(sp),d0
    10de:	d080           	add.l d0,d0
    10e0:	2240           	movea.l d0,a1
    10e2:	d3c0           	adda.l d0,a1
    10e4:	41f9 0000 b854 	lea b854 <imgptrs>,a0
    10ea:	2381 8800      	move.l d1,(0,a1,a0.l)
  for(;i<88;i++) {
    10ee:	52af 0024      	addq.l #1,36(sp)
    10f2:	7057           	moveq #87,d0
    10f4:	b0af 0024      	cmp.l 36(sp),d0
    10f8:	6cc4           	bge.s 10be <Zoom_InitRun+0xc>

  /*for(;i<88;i++) {
    imgptrs[i] = Zoom_Rawchip + 56280*(i-63);
  }*/

  Zoom_Counter = 0;
    10fa:	4279 0000 b838 	clr.w b838 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    1100:	7004           	moveq #4,d0
    1102:	2f40 0020      	move.l d0,32(sp)
    1106:	7002           	moveq #2,d0
    1108:	2f40 001c      	move.l d0,28(sp)
    110c:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    1112:	2c40           	movea.l d0,a6
    1114:	202f 0020      	move.l 32(sp),d0
    1118:	222f 001c      	move.l 28(sp),d1
    111c:	4eae ff3a      	jsr -198(a6)
    1120:	2f40 0018      	move.l d0,24(sp)
    1124:	202f 0018      	move.l 24(sp),d0
    1128:	23c0 0000 b826 	move.l d0,b826 <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 15;
    112e:	33fc 000f 0000 	move.w #15,b846 <Zoom_LevelOf102Zoom>
    1134:	b846 
  ZoomHorizontal = 16;
    1136:	33fc 0010 0000 	move.w #16,b84a <ZoomHorizontal>
    113c:	b84a 
  Zoom_PrepareDisplay();
    113e:	4eba 0288      	jsr 13c8 <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 15, Copperlist1);
    1142:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    1148:	2f00           	move.l d0,-(sp)
    114a:	4878 000f      	pea f <_start+0xf>
    114e:	4eba f298      	jsr 3e8 <Zoom_Shrink102>(pc)
    1152:	508f           	addq.l #8,sp
  Zoom_Shrink102( 15, Copperlist2);
    1154:	2039 0000 b7e4 	move.l b7e4 <Copperlist2>,d0
    115a:	2f00           	move.l d0,-(sp)
    115c:	4878 000f      	pea f <_start+0xf>
    1160:	4eba f286      	jsr 3e8 <Zoom_Shrink102>(pc)
    1164:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 1;
    1166:	33fc 0001 0000 	move.w #1,b844 <Zoom_LevelOfZoom>
    116c:	b844 
  Zoom_Direction = 1;                                                  
    116e:	33fc 0001 0000 	move.w #1,b848 <Zoom_Direction>
    1174:	b848 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    1176:	7016           	moveq #22,d0
    1178:	2f40 0014      	move.l d0,20(sp)
    117c:	2f7c 0001 0001 	move.l #65537,16(sp)
    1182:	0010 
    1184:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    118a:	2c40           	movea.l d0,a6
    118c:	202f 0014      	move.l 20(sp),d0
    1190:	222f 0010      	move.l 16(sp),d1
    1194:	4eae ff3a      	jsr -198(a6)
    1198:	2f40 000c      	move.l d0,12(sp)
    119c:	202f 000c      	move.l 12(sp),d0
    11a0:	23c0 0000 b830 	move.l d0,b830 <Zoom_vbint>
    11a6:	2039 0000 b830 	move.l b830 <Zoom_vbint>,d0
    11ac:	673e           	beq.s 11ec <Zoom_InitRun+0x13a>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    11ae:	2079 0000 b830 	movea.l b830 <Zoom_vbint>,a0
    11b4:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    11ba:	2079 0000 b830 	movea.l b830 <Zoom_vbint>,a0
    11c0:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    11c6:	2079 0000 b830 	movea.l b830 <Zoom_vbint>,a0
    11cc:	217c 0000 7d85 	move.l #32133,10(a0)
    11d2:	000a 
    Zoom_vbint->is_Data = NULL;
    11d4:	2079 0000 b830 	movea.l b830 <Zoom_vbint>,a0
    11da:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    11de:	2079 0000 b830 	movea.l b830 <Zoom_vbint>,a0
    11e4:	217c 0000 0da8 	move.l #3496,18(a0)
    11ea:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    11ec:	7005           	moveq #5,d0
    11ee:	2f40 0008      	move.l d0,8(sp)
    11f2:	2f79 0000 b830 	move.l b830 <Zoom_vbint>,4(sp)
    11f8:	0004 
    11fa:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    1200:	2c40           	movea.l d0,a6
    1202:	202f 0008      	move.l 8(sp),d0
    1206:	226f 0004      	movea.l 4(sp),a1
    120a:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    120e:	2239 0000 b7f4 	move.l b7f4 <ViewCopper>,d1
    1214:	2039 0000 b7ec 	move.l b7ec <ViewBuffer>,d0
    121a:	2f01           	move.l d1,-(sp)
    121c:	2f00           	move.l d0,-(sp)
    121e:	4eba 0c70      	jsr 1e90 <Zoom_SetBplPointers>(pc)
    1222:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    1224:	2239 0000 b7f0 	move.l b7f0 <DrawCopper>,d1
    122a:	2039 0000 b7ec 	move.l b7ec <ViewBuffer>,d0
    1230:	2f01           	move.l d1,-(sp)
    1232:	2f00           	move.l d0,-(sp)
    1234:	4eba 0c5a      	jsr 1e90 <Zoom_SetBplPointers>(pc)
    1238:	508f           	addq.l #8,sp
  SwapCl();
    123a:	4eba ef64      	jsr 1a0 <SwapCl>(pc)
  
}
    123e:	2c5f           	movea.l (sp)+,a6
    1240:	4fef 0024      	lea 36(sp),sp
    1244:	4e75           	rts

00001246 <Zoom_InitRunReverse>:

void Zoom_InitRunReverse() {
    1246:	4fef ffe0      	lea -32(sp),sp
    124a:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    124c:	4279 0000 b838 	clr.w b838 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    1252:	7004           	moveq #4,d0
    1254:	2f40 0020      	move.l d0,32(sp)
    1258:	7002           	moveq #2,d0
    125a:	2f40 001c      	move.l d0,28(sp)
    125e:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    1264:	2c40           	movea.l d0,a6
    1266:	202f 0020      	move.l 32(sp),d0
    126a:	222f 001c      	move.l 28(sp),d1
    126e:	4eae ff3a      	jsr -198(a6)
    1272:	2f40 0018      	move.l d0,24(sp)
    1276:	202f 0018      	move.l 24(sp),d0
    127a:	23c0 0000 b826 	move.l d0,b826 <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 0;
    1280:	33fc 0000 0000 	move.w #0,b846 <Zoom_LevelOf102Zoom>
    1286:	b846 
  ZoomHorizontal = 16;
    1288:	33fc 0010 0000 	move.w #16,b84a <ZoomHorizontal>
    128e:	b84a 
  Zoom_PrepareDisplay();
    1290:	4eba 0136      	jsr 13c8 <Zoom_PrepareDisplay>(pc)
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 0, Copperlist1);
    1294:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    129a:	2f00           	move.l d0,-(sp)
    129c:	42a7           	clr.l -(sp)
    129e:	4eba f148      	jsr 3e8 <Zoom_Shrink102>(pc)
    12a2:	508f           	addq.l #8,sp
  Zoom_Shrink102( 0, Copperlist2);
    12a4:	2039 0000 b7e4 	move.l b7e4 <Copperlist2>,d0
    12aa:	2f00           	move.l d0,-(sp)
    12ac:	42a7           	clr.l -(sp)
    12ae:	4eba f138      	jsr 3e8 <Zoom_Shrink102>(pc)
    12b2:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 17;
    12b4:	33fc 0011 0000 	move.w #17,b844 <Zoom_LevelOfZoom>
    12ba:	b844 
                                                  
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    12bc:	7016           	moveq #22,d0
    12be:	2f40 0014      	move.l d0,20(sp)
    12c2:	2f7c 0001 0001 	move.l #65537,16(sp)
    12c8:	0010 
    12ca:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    12d0:	2c40           	movea.l d0,a6
    12d2:	202f 0014      	move.l 20(sp),d0
    12d6:	222f 0010      	move.l 16(sp),d1
    12da:	4eae ff3a      	jsr -198(a6)
    12de:	2f40 000c      	move.l d0,12(sp)
    12e2:	202f 000c      	move.l 12(sp),d0
    12e6:	23c0 0000 b830 	move.l d0,b830 <Zoom_vbint>
    12ec:	2039 0000 b830 	move.l b830 <Zoom_vbint>,d0
    12f2:	673e           	beq.s 1332 <Zoom_InitRunReverse+0xec>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    12f4:	2079 0000 b830 	movea.l b830 <Zoom_vbint>,a0
    12fa:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    1300:	2079 0000 b830 	movea.l b830 <Zoom_vbint>,a0
    1306:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    130c:	2079 0000 b830 	movea.l b830 <Zoom_vbint>,a0
    1312:	217c 0000 7d85 	move.l #32133,10(a0)
    1318:	000a 
    Zoom_vbint->is_Data = NULL;
    131a:	2079 0000 b830 	movea.l b830 <Zoom_vbint>,a0
    1320:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_ReverseVblankHandler;
    1324:	2079 0000 b830 	movea.l b830 <Zoom_vbint>,a0
    132a:	217c 0000 0eb0 	move.l #3760,18(a0)
    1330:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    1332:	7005           	moveq #5,d0
    1334:	2f40 0008      	move.l d0,8(sp)
    1338:	2f79 0000 b830 	move.l b830 <Zoom_vbint>,4(sp)
    133e:	0004 
    1340:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    1346:	2c40           	movea.l d0,a6
    1348:	202f 0008      	move.l 8(sp),d0
    134c:	226f 0004      	movea.l 4(sp),a1
    1350:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    1354:	2239 0000 b7f4 	move.l b7f4 <ViewCopper>,d1
    135a:	2039 0000 b7ec 	move.l b7ec <ViewBuffer>,d0
    1360:	2f01           	move.l d1,-(sp)
    1362:	2f00           	move.l d0,-(sp)
    1364:	4eba 0b2a      	jsr 1e90 <Zoom_SetBplPointers>(pc)
    1368:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    136a:	2239 0000 b7f0 	move.l b7f0 <DrawCopper>,d1
    1370:	2039 0000 b7ec 	move.l b7ec <ViewBuffer>,d0
    1376:	2f01           	move.l d1,-(sp)
    1378:	2f00           	move.l d0,-(sp)
    137a:	4eba 0b14      	jsr 1e90 <Zoom_SetBplPointers>(pc)
    137e:	508f           	addq.l #8,sp
  SwapCl();
    1380:	4eba ee1e      	jsr 1a0 <SwapCl>(pc)
  
}
    1384:	2c5f           	movea.l (sp)+,a6
    1386:	4fef 0020      	lea 32(sp),sp
    138a:	4e75           	rts

0000138c <Zoom_Dealloc>:

void Zoom_Dealloc() {
    138c:	518f           	subq.l #8,sp
    138e:	2f0e           	move.l a6,-(sp)
  RemIntServer(INTB_VERTB, Zoom_vbint);
    1390:	7005           	moveq #5,d0
    1392:	2f40 0008      	move.l d0,8(sp)
    1396:	2f79 0000 b830 	move.l b830 <Zoom_vbint>,4(sp)
    139c:	0004 
    139e:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    13a4:	2c40           	movea.l d0,a6
    13a6:	202f 0008      	move.l 8(sp),d0
    13aa:	226f 0004      	movea.l 4(sp),a1
    13ae:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    13b2:	2f3c 0000 df20 	move.l #57120,-(sp)
    13b8:	4878 031c      	pea 31c <Zoom_InsertShift+0x42>
    13bc:	4eba ed22      	jsr e0 <FreeDisplay>(pc)
    13c0:	508f           	addq.l #8,sp
}
    13c2:	2c5f           	movea.l (sp)+,a6
    13c4:	508f           	addq.l #8,sp
    13c6:	4e75           	rts

000013c8 <Zoom_PrepareDisplay>:
  
int Zoom_PrepareDisplay() {
    13c8:	4fef ffe8      	lea -24(sp),sp
    13cc:	2f0e           	move.l a6,-(sp)
  ViewBuffer = AllocVec(268*42*5, MEMF_CHIP);  
    13ce:	2f7c 0000 dbd8 	move.l #56280,24(sp)
    13d4:	0018 
    13d6:	7002           	moveq #2,d0
    13d8:	2f40 0014      	move.l d0,20(sp)
    13dc:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    13e2:	2c40           	movea.l d0,a6
    13e4:	202f 0018      	move.l 24(sp),d0
    13e8:	222f 0014      	move.l 20(sp),d1
    13ec:	4eae fd54      	jsr -684(a6)
    13f0:	2f40 0010      	move.l d0,16(sp)
    13f4:	202f 0010      	move.l 16(sp),d0
    13f8:	23c0 0000 b7ec 	move.l d0,b7ec <ViewBuffer>
  DrawBuffer = AllocVec(268*42*5, MEMF_CHIP);
    13fe:	2f7c 0000 dbd8 	move.l #56280,12(sp)
    1404:	000c 
    1406:	7002           	moveq #2,d0
    1408:	2f40 0008      	move.l d0,8(sp)
    140c:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    1412:	2c40           	movea.l d0,a6
    1414:	202f 000c      	move.l 12(sp),d0
    1418:	222f 0008      	move.l 8(sp),d1
    141c:	4eae fd54      	jsr -684(a6)
    1420:	2f40 0004      	move.l d0,4(sp)
    1424:	202f 0004      	move.l 4(sp),d0
    1428:	23c0 0000 b7e8 	move.l d0,b7e8 <DrawBuffer>
  Utils_CopyMem( imgptrs[0], ViewBuffer, 14070);
    142e:	2239 0000 b7ec 	move.l b7ec <ViewBuffer>,d1
    1434:	2039 0000 b854 	move.l b854 <imgptrs>,d0
    143a:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x218>
    143e:	2f01           	move.l d1,-(sp)
    1440:	2f00           	move.l d0,-(sp)
    1442:	4eba ed9a      	jsr 1de <Utils_CopyMem>(pc)
    1446:	4fef 000c      	lea 12(sp),sp
  Utils_CopyMem( imgptrs[0], DrawBuffer, 14070);
    144a:	2239 0000 b7e8 	move.l b7e8 <DrawBuffer>,d1
    1450:	2039 0000 b854 	move.l b854 <imgptrs>,d0
    1456:	4878 36f6      	pea 36f6 <TestBlitleftOfZoom+0x218>
    145a:	2f01           	move.l d1,-(sp)
    145c:	2f00           	move.l d0,-(sp)
    145e:	4eba ed7e      	jsr 1de <Utils_CopyMem>(pc)
    1462:	4fef 000c      	lea 12(sp),sp
  //Zoom_SwapBuffers( 0);
  Copperlist1 = ClbuildZoom( );
    1466:	4eba 0080      	jsr 14e8 <ClbuildZoom>(pc)
    146a:	23c0 0000 b7e0 	move.l d0,b7e0 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    1470:	4eba 0076      	jsr 14e8 <ClbuildZoom>(pc)
    1474:	23c0 0000 b7e4 	move.l d0,b7e4 <Copperlist2>
  if(Bitplane2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;*/
  DrawCopper = Copperlist1;
    147a:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    1480:	23c0 0000 b7f0 	move.l d0,b7f0 <DrawCopper>
  ViewCopper = Copperlist2;
    1486:	2039 0000 b7e4 	move.l b7e4 <Copperlist2>,d0
    148c:	23c0 0000 b7f4 	move.l d0,b7f4 <ViewCopper>
  return 0;
    1492:	7000           	moveq #0,d0
}
    1494:	2c5f           	movea.l (sp)+,a6
    1496:	4fef 0018      	lea 24(sp),sp
    149a:	4e75           	rts

0000149c <Zoom_Init>:

void Zoom_Init() {
    149c:	4fef fff4      	lea -12(sp),sp
    14a0:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    14a2:	7004           	moveq #4,d0
    14a4:	2f40 000c      	move.l d0,12(sp)
    14a8:	7002           	moveq #2,d0
    14aa:	2f40 0008      	move.l d0,8(sp)
    14ae:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    14b4:	2c40           	movea.l d0,a6
    14b6:	202f 000c      	move.l 12(sp),d0
    14ba:	222f 0008      	move.l 8(sp),d1
    14be:	4eae ff3a      	jsr -198(a6)
    14c2:	2f40 0004      	move.l d0,4(sp)
    14c6:	202f 0004      	move.l 4(sp),d0
    14ca:	23c0 0000 b826 	move.l d0,b826 <Zoom_ZoomBlitMask>
  ZoomHorizontal = 16;
    14d0:	33fc 0010 0000 	move.w #16,b84a <ZoomHorizontal>
    14d6:	b84a 
  Zoom_LevelOf102Zoom = 15;
    14d8:	33fc 000f 0000 	move.w #15,b846 <Zoom_LevelOf102Zoom>
    14de:	b846 
}
    14e0:	2c5f           	movea.l (sp)+,a6
    14e2:	4fef 000c      	lea 12(sp),sp
    14e6:	4e75           	rts

000014e8 <ClbuildZoom>:


ULONG * ClbuildZoom() {
    14e8:	4fef ffac      	lea -84(sp),sp
    14ec:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    14f0:	2f7c 0000 031c 	move.l #796,68(sp)
    14f6:	0044 
    14f8:	7002           	moveq #2,d0
    14fa:	2f40 0040      	move.l d0,64(sp)
    14fe:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    1504:	2c40           	movea.l d0,a6
    1506:	202f 0044      	move.l 68(sp),d0
    150a:	222f 0040      	move.l 64(sp),d1
    150e:	4eae ff3a      	jsr -198(a6)
    1512:	2f40 003c      	move.l d0,60(sp)
    1516:	202f 003c      	move.l 60(sp),d0
    151a:	2f40 0038      	move.l d0,56(sp)
  
  if( retval == 0) {
    151e:	6658           	bne.s 1578 <ClbuildZoom+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1520:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    1526:	2c40           	movea.l d0,a6
    1528:	4eae ffc4      	jsr -60(a6)
    152c:	2f40 0034      	move.l d0,52(sp)
    1530:	202f 0034      	move.l 52(sp),d0
    1534:	2f40 0030      	move.l d0,48(sp)
    1538:	2f7c 0000 7d5f 	move.l #32095,44(sp)
    153e:	002c 
    1540:	7228           	moveq #40,d1
    1542:	2f41 0028      	move.l d1,40(sp)
    1546:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    154c:	2c40           	movea.l d0,a6
    154e:	222f 0030      	move.l 48(sp),d1
    1552:	242f 002c      	move.l 44(sp),d2
    1556:	262f 0028      	move.l 40(sp),d3
    155a:	4eae ffd0      	jsr -48(a6)
    155e:	2f40 0024      	move.l d0,36(sp)
    Exit(1);
    1562:	7401           	moveq #1,d2
    1564:	2f42 0020      	move.l d2,32(sp)
    1568:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    156e:	2c40           	movea.l d0,a6
    1570:	222f 0020      	move.l 32(sp),d1
    1574:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    1578:	2f6f 0038 005c 	move.l 56(sp),92(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    157e:	2f7c 0000 a080 	move.l #41088,88(sp)
    1584:	0058 
  for(int i=0; i<16;i++)
    1586:	42af 0054      	clr.l 84(sp)
    158a:	6024           	bra.s 15b0 <ClbuildZoom+0xc8>
    *cl++ = *clpartinstruction++;
    158c:	222f 0058      	move.l 88(sp),d1
    1590:	2001           	move.l d1,d0
    1592:	5880           	addq.l #4,d0
    1594:	2f40 0058      	move.l d0,88(sp)
    1598:	202f 005c      	move.l 92(sp),d0
    159c:	2400           	move.l d0,d2
    159e:	5882           	addq.l #4,d2
    15a0:	2f42 005c      	move.l d2,92(sp)
    15a4:	2041           	movea.l d1,a0
    15a6:	2210           	move.l (a0),d1
    15a8:	2040           	movea.l d0,a0
    15aa:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    15ac:	52af 0054      	addq.l #1,84(sp)
    15b0:	700f           	moveq #15,d0
    15b2:	b0af 0054      	cmp.l 84(sp),d0
    15b6:	6cd4           	bge.s 158c <ClbuildZoom+0xa4>
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
    15b8:	2f7c 0000 a0c0 	move.l #41152,88(sp)
    15be:	0058 
  for(int i=0; i<12;i++)
    15c0:	42af 0050      	clr.l 80(sp)
    15c4:	6024           	bra.s 15ea <ClbuildZoom+0x102>
    *cl++ = *clpartinstruction++;
    15c6:	222f 0058      	move.l 88(sp),d1
    15ca:	2401           	move.l d1,d2
    15cc:	5882           	addq.l #4,d2
    15ce:	2f42 0058      	move.l d2,88(sp)
    15d2:	202f 005c      	move.l 92(sp),d0
    15d6:	2400           	move.l d0,d2
    15d8:	5882           	addq.l #4,d2
    15da:	2f42 005c      	move.l d2,92(sp)
    15de:	2041           	movea.l d1,a0
    15e0:	2210           	move.l (a0),d1
    15e2:	2040           	movea.l d0,a0
    15e4:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    15e6:	52af 0050      	addq.l #1,80(sp)
    15ea:	700b           	moveq #11,d0
    15ec:	b0af 0050      	cmp.l 80(sp),d0
    15f0:	6cd4           	bge.s 15c6 <ClbuildZoom+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    15f2:	202f 005c      	move.l 92(sp),d0
    15f6:	2200           	move.l d0,d1
    15f8:	5881           	addq.l #4,d1
    15fa:	2f41 005c      	move.l d1,92(sp)
    15fe:	2040           	movea.l d0,a0
    1600:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    1606:	202f 005c      	move.l 92(sp),d0
    160a:	2200           	move.l d0,d1
    160c:	5881           	addq.l #4,d1
    160e:	2f41 005c      	move.l d1,92(sp)
    1612:	2040           	movea.l d0,a0
    1614:	20bc 00e2 0000 	move.l #14811136,(a0)
  *cl++ = 0x00e40000;
    161a:	202f 005c      	move.l 92(sp),d0
    161e:	2200           	move.l d0,d1
    1620:	5881           	addq.l #4,d1
    1622:	2f41 005c      	move.l d1,92(sp)
    1626:	2040           	movea.l d0,a0
    1628:	20bc 00e4 0000 	move.l #14942208,(a0)
  *cl++ = 0x00e60000;
    162e:	202f 005c      	move.l 92(sp),d0
    1632:	2200           	move.l d0,d1
    1634:	5881           	addq.l #4,d1
    1636:	2f41 005c      	move.l d1,92(sp)
    163a:	2040           	movea.l d0,a0
    163c:	20bc 00e6 0000 	move.l #15073280,(a0)
  *cl++ = 0x00e80000;
    1642:	202f 005c      	move.l 92(sp),d0
    1646:	2200           	move.l d0,d1
    1648:	5881           	addq.l #4,d1
    164a:	2f41 005c      	move.l d1,92(sp)
    164e:	2040           	movea.l d0,a0
    1650:	20bc 00e8 0000 	move.l #15204352,(a0)
  *cl++ = 0x00ea0000;
    1656:	202f 005c      	move.l 92(sp),d0
    165a:	2200           	move.l d0,d1
    165c:	5881           	addq.l #4,d1
    165e:	2f41 005c      	move.l d1,92(sp)
    1662:	2040           	movea.l d0,a0
    1664:	20bc 00ea 0000 	move.l #15335424,(a0)
  *cl++ = 0x00ec0000;
    166a:	202f 005c      	move.l 92(sp),d0
    166e:	2200           	move.l d0,d1
    1670:	5881           	addq.l #4,d1
    1672:	2f41 005c      	move.l d1,92(sp)
    1676:	2040           	movea.l d0,a0
    1678:	20bc 00ec 0000 	move.l #15466496,(a0)
  *cl++ = 0x00ee0000;
    167e:	202f 005c      	move.l 92(sp),d0
    1682:	2200           	move.l d0,d1
    1684:	5881           	addq.l #4,d1
    1686:	2f41 005c      	move.l d1,92(sp)
    168a:	2040           	movea.l d0,a0
    168c:	20bc 00ee 0000 	move.l #15597568,(a0)
  *cl++ = 0x00f00000;
    1692:	202f 005c      	move.l 92(sp),d0
    1696:	2200           	move.l d0,d1
    1698:	5881           	addq.l #4,d1
    169a:	2f41 005c      	move.l d1,92(sp)
    169e:	2040           	movea.l d0,a0
    16a0:	20bc 00f0 0000 	move.l #15728640,(a0)
  *cl++ = 0x00f20000;
    16a6:	202f 005c      	move.l 92(sp),d0
    16aa:	2200           	move.l d0,d1
    16ac:	5881           	addq.l #4,d1
    16ae:	2f41 005c      	move.l d1,92(sp)
    16b2:	2040           	movea.l d0,a0
    16b4:	20bc 00f2 0000 	move.l #15859712,(a0)

  clpartinstruction = ClColor;
    16ba:	2f7c 0000 a000 	move.l #40960,88(sp)
    16c0:	0058 
  for(int i=0; i<32;i++)
    16c2:	42af 004c      	clr.l 76(sp)
    16c6:	6024           	bra.s 16ec <ClbuildZoom+0x204>
    *cl++ = *clpartinstruction++;
    16c8:	222f 0058      	move.l 88(sp),d1
    16cc:	2001           	move.l d1,d0
    16ce:	5880           	addq.l #4,d0
    16d0:	2f40 0058      	move.l d0,88(sp)
    16d4:	202f 005c      	move.l 92(sp),d0
    16d8:	2400           	move.l d0,d2
    16da:	5882           	addq.l #4,d2
    16dc:	2f42 005c      	move.l d2,92(sp)
    16e0:	2041           	movea.l d1,a0
    16e2:	2210           	move.l (a0),d1
    16e4:	2040           	movea.l d0,a0
    16e6:	2081           	move.l d1,(a0)
  for(int i=0; i<32;i++)
    16e8:	52af 004c      	addq.l #1,76(sp)
    16ec:	701f           	moveq #31,d0
    16ee:	b0af 004c      	cmp.l 76(sp),d0
    16f2:	6cd4           	bge.s 16c8 <ClbuildZoom+0x1e0>
  
  ULONG cop2 = cl+3;
    16f4:	700c           	moveq #12,d0
    16f6:	d0af 005c      	add.l 92(sp),d0
    16fa:	2f40 001c      	move.l d0,28(sp)
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    16fe:	202f 001c      	move.l 28(sp),d0
    1702:	4240           	clr.w d0
    1704:	4840           	swap d0
    1706:	2200           	move.l d0,d1
    1708:	0681 0084 0000 	addi.l #8650752,d1
    170e:	2f41 0018      	move.l d1,24(sp)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    1712:	202f 001c      	move.l 28(sp),d0
    1716:	0280 0000 ffff 	andi.l #65535,d0
    171c:	2400           	move.l d0,d2
    171e:	0682 0086 0000 	addi.l #8781824,d2
    1724:	2f42 0014      	move.l d2,20(sp)
  //clpartinstruction = Cl102ZoomInit;
  *cl++ = cop2lch;
    1728:	202f 005c      	move.l 92(sp),d0
    172c:	2200           	move.l d0,d1
    172e:	5881           	addq.l #4,d1
    1730:	2f41 005c      	move.l d1,92(sp)
    1734:	2040           	movea.l d0,a0
    1736:	20af 0018      	move.l 24(sp),(a0)
  *cl++ = cop2lcl;
    173a:	202f 005c      	move.l 92(sp),d0
    173e:	2200           	move.l d0,d1
    1740:	5881           	addq.l #4,d1
    1742:	2f41 005c      	move.l d1,92(sp)
    1746:	2040           	movea.l d0,a0
    1748:	20af 0014      	move.l 20(sp),(a0)
  *cl++ = 0x2c01ff00;
    174c:	202f 005c      	move.l 92(sp),d0
    1750:	2200           	move.l d0,d1
    1752:	5881           	addq.l #4,d1
    1754:	2f41 005c      	move.l d1,92(sp)
    1758:	2040           	movea.l d0,a0
    175a:	20bc 2c01 ff00 	move.l #738328320,(a0)

  ULONG cop2br1 = cop2 + ( (30)<<2);
    1760:	7078           	moveq #120,d0
    1762:	d0af 001c      	add.l 28(sp),d0
    1766:	2f40 0010      	move.l d0,16(sp)
  ULONG cop2br2 = cop2 + ( (86)<<2);
    176a:	222f 001c      	move.l 28(sp),d1
    176e:	0681 0000 0158 	addi.l #344,d1
    1774:	2f41 000c      	move.l d1,12(sp)
  clpartinstruction = Cl102ZoomRepeat;
    1778:	2f7c 0000 a0fc 	move.l #41212,88(sp)
    177e:	0058 
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    1780:	202f 0010      	move.l 16(sp),d0
    1784:	4240           	clr.w d0
    1786:	4840           	swap d0
    1788:	307c 0070      	movea.w #112,a0
    178c:	d1ef 0058      	adda.l 88(sp),a0
    1790:	0680 0084 0000 	addi.l #8650752,d0
    1796:	2080           	move.l d0,(a0)
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    1798:	202f 0010      	move.l 16(sp),d0
    179c:	0280 0000 ffff 	andi.l #65535,d0
    17a2:	307c 0074      	movea.w #116,a0
    17a6:	d1ef 0058      	adda.l 88(sp),a0
    17aa:	0680 0086 0000 	addi.l #8781824,d0
    17b0:	2080           	move.l d0,(a0)
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    17b2:	202f 000c      	move.l 12(sp),d0
    17b6:	4240           	clr.w d0
    17b8:	4840           	swap d0
    17ba:	206f 0058      	movea.l 88(sp),a0
    17be:	41e8 0150      	lea 336(a0),a0
    17c2:	0680 0084 0000 	addi.l #8650752,d0
    17c8:	2080           	move.l d0,(a0)
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    17ca:	202f 000c      	move.l 12(sp),d0
    17ce:	0280 0000 ffff 	andi.l #65535,d0
    17d4:	206f 0058      	movea.l 88(sp),a0
    17d8:	41e8 0154      	lea 340(a0),a0
    17dc:	0680 0086 0000 	addi.l #8781824,d0
    17e2:	2080           	move.l d0,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    17e4:	42af 0048      	clr.l 72(sp)
    17e8:	6024           	bra.s 180e <ClbuildZoom+0x326>
    *cl++ = *clpartinstruction++;
    17ea:	222f 0058      	move.l 88(sp),d1
    17ee:	2401           	move.l d1,d2
    17f0:	5882           	addq.l #4,d2
    17f2:	2f42 0058      	move.l d2,88(sp)
    17f6:	202f 005c      	move.l 92(sp),d0
    17fa:	2400           	move.l d0,d2
    17fc:	5882           	addq.l #4,d2
    17fe:	2f42 005c      	move.l d2,92(sp)
    1802:	2041           	movea.l d1,a0
    1804:	2210           	move.l (a0),d1
    1806:	2040           	movea.l d0,a0
    1808:	2081           	move.l d1,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    180a:	52af 0048      	addq.l #1,72(sp)
    180e:	7071           	moveq #113,d0
    1810:	b0af 0048      	cmp.l 72(sp),d0
    1814:	6cd4           	bge.s 17ea <ClbuildZoom+0x302>

   *cl++ = 0xfffffffe;
    1816:	202f 005c      	move.l 92(sp),d0
    181a:	2200           	move.l d0,d1
    181c:	5881           	addq.l #4,d1
    181e:	2f41 005c      	move.l d1,92(sp)
    1822:	74fe           	moveq #-2,d2
    1824:	2040           	movea.l d0,a0
    1826:	2082           	move.l d2,(a0)

  return retval;
    1828:	202f 0038      	move.l 56(sp),d0
}
    182c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1830:	4fef 0054      	lea 84(sp),sp
    1834:	4e75           	rts

00001836 <PrepareDisplayZoom>:

 int PrepareDisplayZoom() {
    1836:	4fef ffb8      	lea -72(sp),sp
    183a:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildZoom();
    183e:	4eba fca8      	jsr 14e8 <ClbuildZoom>(pc)
    1842:	23c0 0000 b7e0 	move.l d0,b7e0 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1848:	4eba fc9e      	jsr 14e8 <ClbuildZoom>(pc)
    184c:	23c0 0000 b7e4 	move.l d0,b7e4 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1852:	2f7c 0000 df20 	move.l #57120,80(sp)
    1858:	0050 
    185a:	7002           	moveq #2,d0
    185c:	2f40 004c      	move.l d0,76(sp)
    1860:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    1866:	2c40           	movea.l d0,a6
    1868:	202f 0050      	move.l 80(sp),d0
    186c:	222f 004c      	move.l 76(sp),d1
    1870:	4eae ff3a      	jsr -198(a6)
    1874:	2f40 0048      	move.l d0,72(sp)
    1878:	202f 0048      	move.l 72(sp),d0
    187c:	23c0 0000 b7d8 	move.l d0,b7d8 <Bitplane1>
  if(Bitplane1 == 0) {
    1882:	2039 0000 b7d8 	move.l b7d8 <Bitplane1>,d0
    1888:	6658           	bne.s 18e2 <PrepareDisplayZoom+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    188a:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    1890:	2c40           	movea.l d0,a6
    1892:	4eae ffc4      	jsr -60(a6)
    1896:	2f40 0044      	move.l d0,68(sp)
    189a:	202f 0044      	move.l 68(sp),d0
    189e:	2f40 0040      	move.l d0,64(sp)
    18a2:	2f7c 0000 7d11 	move.l #32017,60(sp)
    18a8:	003c 
    18aa:	7026           	moveq #38,d0
    18ac:	2f40 0038      	move.l d0,56(sp)
    18b0:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    18b6:	2c40           	movea.l d0,a6
    18b8:	222f 0040      	move.l 64(sp),d1
    18bc:	242f 003c      	move.l 60(sp),d2
    18c0:	262f 0038      	move.l 56(sp),d3
    18c4:	4eae ffd0      	jsr -48(a6)
    18c8:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    18cc:	7001           	moveq #1,d0
    18ce:	2f40 0030      	move.l d0,48(sp)
    18d2:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    18d8:	2c40           	movea.l d0,a6
    18da:	222f 0030      	move.l 48(sp),d1
    18de:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    18e2:	2039 0000 b7d8 	move.l b7d8 <Bitplane1>,d0
    18e8:	23c0 0000 b7e8 	move.l d0,b7e8 <DrawBuffer>
  DrawCopper = Copperlist1;
    18ee:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    18f4:	23c0 0000 b7f0 	move.l d0,b7f0 <DrawCopper>
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    18fa:	2f7c 0000 df20 	move.l #57120,44(sp)
    1900:	002c 
    1902:	7002           	moveq #2,d0
    1904:	2f40 0028      	move.l d0,40(sp)
    1908:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    190e:	2c40           	movea.l d0,a6
    1910:	202f 002c      	move.l 44(sp),d0
    1914:	222f 0028      	move.l 40(sp),d1
    1918:	4eae ff3a      	jsr -198(a6)
    191c:	2f40 0024      	move.l d0,36(sp)
    1920:	202f 0024      	move.l 36(sp),d0
    1924:	23c0 0000 b7dc 	move.l d0,b7dc <Bitplane2>
  if(Bitplane2 == 0) {
    192a:	2039 0000 b7dc 	move.l b7dc <Bitplane2>,d0
    1930:	6658           	bne.s 198a <PrepareDisplayZoom+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1932:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    1938:	2c40           	movea.l d0,a6
    193a:	4eae ffc4      	jsr -60(a6)
    193e:	2f40 0020      	move.l d0,32(sp)
    1942:	202f 0020      	move.l 32(sp),d0
    1946:	2f40 001c      	move.l d0,28(sp)
    194a:	2f7c 0000 7d38 	move.l #32056,24(sp)
    1950:	0018 
    1952:	7026           	moveq #38,d0
    1954:	2f40 0014      	move.l d0,20(sp)
    1958:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    195e:	2c40           	movea.l d0,a6
    1960:	222f 001c      	move.l 28(sp),d1
    1964:	242f 0018      	move.l 24(sp),d2
    1968:	262f 0014      	move.l 20(sp),d3
    196c:	4eae ffd0      	jsr -48(a6)
    1970:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    1974:	7001           	moveq #1,d0
    1976:	2f40 000c      	move.l d0,12(sp)
    197a:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    1980:	2c40           	movea.l d0,a6
    1982:	222f 000c      	move.l 12(sp),d1
    1986:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    198a:	2039 0000 b7dc 	move.l b7dc <Bitplane2>,d0
    1990:	23c0 0000 b7ec 	move.l d0,b7ec <ViewBuffer>
  ViewCopper = Copperlist2; 
    1996:	2039 0000 b7e4 	move.l b7e4 <Copperlist2>,d0
    199c:	23c0 0000 b7f4 	move.l d0,b7f4 <ViewCopper>
  return 0;
    19a2:	7000           	moveq #0,d0
}
    19a4:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    19a8:	4fef 0048      	lea 72(sp),sp
    19ac:	4e75           	rts

000019ae <Init_Blit>:

void Init_Blit() {
  hw->bltafwm = 0xffff;
    19ae:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    19b4:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    19ba:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    19c0:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    19c6:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    19cc:	317c 0026 0064 	move.w #38,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    19d2:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    19d8:	317c 0026 0062 	move.w #38,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    19de:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    19e4:	317c 0026 0066 	move.w #38,102(a0)
}
    19ea:	4e75           	rts

000019ec <Init_Blit2>:


void Init_Blit2() {
  hw->bltafwm = 0xffff;
    19ec:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    19f2:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    19f8:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    19fe:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = 36;
    1a04:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    1a0a:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = 76;
    1a10:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    1a16:	317c 004c 0062 	move.w #76,98(a0)
  hw->bltdmod = ZMLINESIZE2 - 4;
    1a1c:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    1a22:	317c 0028 0066 	move.w #40,102(a0)
}
    1a28:	4e75           	rts

00001a2a <Init_ZoomBlit>:

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
    1a2a:	4fef fff4      	lea -12(sp),sp
    1a2e:	206f 0010      	movea.l 16(sp),a0
    1a32:	222f 0014      	move.l 20(sp),d1
    1a36:	202f 0018      	move.l 24(sp),d0
    1a3a:	3048           	movea.w a0,a0
    1a3c:	3f48 0004      	move.w a0,4(sp)
    1a40:	3201           	move.w d1,d1
    1a42:	3f41 0002      	move.w d1,2(sp)
    1a46:	3000           	move.w d0,d0
    1a48:	3e80           	move.w d0,(sp)
  ZoomBlit_Increment4SrcA = 0;
    1a4a:	4279 0000 b82e 	clr.w b82e <ZoomBlit_Increment4SrcA>

  UWORD colnr = nextzoom - startofword - 1;                                                                          
    1a50:	302f 0002      	move.w 2(sp),d0
    1a54:	906f 0004      	sub.w 4(sp),d0
    1a58:	3200           	move.w d0,d1
    1a5a:	5341           	subq.w #1,d1
    1a5c:	3f41 0008      	move.w d1,8(sp)
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
    1a60:	3017           	move.w (sp),d0
    1a62:	720c           	moveq #12,d1
    1a64:	e368           	lsl.w d1,d0
    1a66:	3f40 0006      	move.w d0,6(sp)
  UWORD shifta;
  if( shiftright == 0) {
    1a6a:	4a57           	tst.w (sp)
    1a6c:	6610           	bne.s 1a7e <Init_ZoomBlit+0x54>
    ZoomBlit_Increment4SrcA = 1;
    1a6e:	33fc 0001 0000 	move.w #1,b82e <ZoomBlit_Increment4SrcA>
    1a74:	b82e 
    shifta = 15 << 12;
    1a76:	3f7c f000 000a 	move.w #-4096,10(sp)
    1a7c:	600c           	bra.s 1a8a <Init_ZoomBlit+0x60>
  } else {
    shifta = (shiftright - 1) << 12;
    1a7e:	3017           	move.w (sp),d0
    1a80:	5340           	subq.w #1,d0
    1a82:	720c           	moveq #12,d1
    1a84:	e368           	lsl.w d1,d0
    1a86:	3f40 000a      	move.w d0,10(sp)
  }
  WaitBlt(); 
    1a8a:	4eba e628      	jsr b4 <WaitBlt>(pc)
  hw->bltcon1 = shiftb; 
    1a8e:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    1a94:	316f 0006 0042 	move.w 6(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1a9a:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    1aa0:	302f 000a      	move.w 10(sp),d0
    1aa4:	0640 0de4      	addi.w #3556,d0
    1aa8:	3140 0040      	move.w d0,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1aac:	7000           	moveq #0,d0
    1aae:	302f 0008      	move.w 8(sp),d0
    1ab2:	7210           	moveq #16,d1
    1ab4:	9280           	sub.l d0,d1
    1ab6:	7000           	moveq #0,d0
    1ab8:	4640           	not.w d0
    1aba:	e3a8           	lsl.l d1,d0
    1abc:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    1ac2:	2000           	move.l d0,d0
    1ac4:	3140 0070      	move.w d0,112(a0)
}
    1ac8:	4fef 000c      	lea 12(sp),sp
    1acc:	4e75           	rts

00001ace <Init_Copy>:

void Init_Copy( WORD shift) {
    1ace:	598f           	subq.l #4,sp
    1ad0:	202f 0008      	move.l 8(sp),d0
    1ad4:	3000           	move.w d0,d0
    1ad6:	3e80           	move.w d0,(sp)
  UWORD shiftright = shift << 12;
    1ad8:	3017           	move.w (sp),d0
    1ada:	720c           	moveq #12,d1
    1adc:	e368           	lsl.w d1,d0
    1ade:	3f40 0002      	move.w d0,2(sp)
  WaitBlt();
    1ae2:	4eba e5d0      	jsr b4 <WaitBlt>(pc)
  hw->bltcon0 = 0x9f0 + shiftright;
    1ae6:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    1aec:	302f 0002      	move.w 2(sp),d0
    1af0:	0640 09f0      	addi.w #2544,d0
    1af4:	3140 0040      	move.w d0,64(a0)
  hw->bltcon1 = 0;
    1af8:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    1afe:	317c 0000 0042 	move.w #0,66(a0)
}
    1b04:	588f           	addq.l #4,sp
    1b06:	4e75           	rts

00001b08 <Zoom_ZoomIntoPicture>:

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    1b08:	4fef ffcc      	lea -52(sp),sp
    1b0c:	222f 0040      	move.l 64(sp),d1
    1b10:	202f 0044      	move.l 68(sp),d0
    1b14:	3201           	move.w d1,d1
    1b16:	3f41 0002      	move.w d1,2(sp)
    1b1a:	3000           	move.w d0,d0
    1b1c:	3e80           	move.w d0,(sp)
  
  WaitBlt();  
    1b1e:	4eba e594      	jsr b4 <WaitBlt>(pc)
  Init_Blit();
    1b22:	4eba fe8a      	jsr 19ae <Init_Blit>(pc)
  WORD shiftright = 9;
    1b26:	3f7c 0009 0032 	move.w #9,50(sp)
  UWORD shifthoriz = 7;
    1b2c:	3f7c 0007 0030 	move.w #7,48(sp)
  UWORD startofword = 21*16;
    1b32:	3f7c 0150 002e 	move.w #336,46(sp)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1b38:	322f 0002      	move.w 2(sp),d1
    1b3c:	3001           	move.w d1,d0
    1b3e:	d040           	add.w d0,d0
    1b40:	d040           	add.w d0,d0
    1b42:	d041           	add.w d1,d0
    1b44:	d040           	add.w d0,d0
    1b46:	0640 014c      	addi.w #332,d0
    1b4a:	3f40 002c      	move.w d0,44(sp)
    1b4e:	601a           	bra.s 1b6a <Zoom_ZoomIntoPicture+0x62>
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    1b50:	302f 002c      	move.w 44(sp),d0
    1b54:	906f 0002      	sub.w 2(sp),d0
    1b58:	0640 ffed      	addi.w #-19,d0
    1b5c:	3f40 002c      	move.w d0,44(sp)
    shiftright--;
    1b60:	302f 0032      	move.w 50(sp),d0
    1b64:	5340           	subq.w #1,d0
    1b66:	3f40 0032      	move.w d0,50(sp)
  while( nextzoom > 22 * 16) {
    1b6a:	0c6f 0160 002c 	cmpi.w #352,44(sp)
    1b70:	6ede           	bgt.s 1b50 <Zoom_ZoomIntoPicture+0x48>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
    1b72:	426f 002a      	clr.w 42(sp)
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    1b76:	322f 0002      	move.w 2(sp),d1
    1b7a:	3001           	move.w d1,d0
    1b7c:	d040           	add.w d0,d0
    1b7e:	d040           	add.w d0,d0
    1b80:	d041           	add.w d1,d0
    1b82:	4440           	neg.w d0
    1b84:	0640 0012      	addi.w #18,d0
    1b88:	3f40 0028      	move.w d0,40(sp)
    1b8c:	601c           	bra.s 1baa <Zoom_ZoomIntoPicture+0xa2>
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    1b8e:	302f 0028      	move.w 40(sp),d0
    1b92:	d06f 0002      	add.w 2(sp),d0
    1b96:	0640 0013      	addi.w #19,d0
    1b9a:	3f40 0028      	move.w d0,40(sp)
      shifthoriz--;
    1b9e:	302f 0030      	move.w 48(sp),d0
    1ba2:	3200           	move.w d0,d1
    1ba4:	5341           	subq.w #1,d1
    1ba6:	3f41 0030      	move.w d1,48(sp)
  while( ZoomHorizontalStart < 0) {
    1baa:	4a6f 0028      	tst.w 40(sp)
    1bae:	6dde           	blt.s 1b8e <Zoom_ZoomIntoPicture+0x86>
  } 

  for(int i=0;i<22;i++) {
    1bb0:	42af 0024      	clr.l 36(sp)
    1bb4:	6000 02ca      	bra.w 1e80 <Zoom_ZoomIntoPicture+0x378>

    ZoomHorizontal = ZoomHorizontalStart;
    1bb8:	33ef 0028 0000 	move.w 40(sp),b84a <ZoomHorizontal>
    1bbe:	b84a 

    WORD linesleft = 272;
    1bc0:	3f7c 0110 0022 	move.w #272,34(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1bc6:	7000           	moveq #0,d0
    1bc8:	302f 0030      	move.w 48(sp),d0
    1bcc:	7200           	moveq #0,d1
    1bce:	3217           	move.w (sp),d1
    1bd0:	2f01           	move.l d1,-(sp)
    1bd2:	2f00           	move.l d0,-(sp)
    1bd4:	4eb9 0000 7178 	jsr 7178 <__mulsi3>
    1bda:	508f           	addq.l #8,sp
    1bdc:	2200           	move.l d0,d1
    1bde:	2001           	move.l d1,d0
    1be0:	d080           	add.l d0,d0
    1be2:	d081           	add.l d1,d0
    1be4:	2200           	move.l d0,d1
    1be6:	e789           	lsl.l #3,d1
    1be8:	9280           	sub.l d0,d1
    1bea:	202f 0024      	move.l 36(sp),d0
    1bee:	9280           	sub.l d0,d1
    1bf0:	2001           	move.l d1,d0
    1bf2:	0680 8000 0013 	addi.l #-2147483629,d0
    1bf8:	d080           	add.l d0,d0
    1bfa:	222f 0038      	move.l 56(sp),d1
    1bfe:	d280           	add.l d0,d1
    1c00:	2f41 001e      	move.l d1,30(sp)
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1c04:	202f 0024      	move.l 36(sp),d0
    1c08:	7213           	moveq #19,d1
    1c0a:	9280           	sub.l d0,d1
    1c0c:	2001           	move.l d1,d0
    1c0e:	d081           	add.l d1,d0
    1c10:	222f 003c      	move.l 60(sp),d1
    1c14:	d280           	add.l d0,d1
    1c16:	2f41 001a      	move.l d1,26(sp)
    
    UWORD onestep = ZMLINESIZE/2*planes;
    1c1a:	3017           	move.w (sp),d0
    1c1c:	c1fc 0015      	muls.w #21,d0
    1c20:	3f40 0018      	move.w d0,24(sp)
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1c24:	7000           	moveq #0,d0
    1c26:	302f 002e      	move.w 46(sp),d0
    1c2a:	306f 002c      	movea.w 44(sp),a0
    1c2e:	b1c0           	cmpa.l d0,a0
    1c30:	6e00 0106      	bgt.w 1d38 <Zoom_ZoomIntoPicture+0x230>
      Init_Copy( shiftright);
    1c34:	306f 0032      	movea.w 50(sp),a0
    1c38:	2f08           	move.l a0,-(sp)
    1c3a:	4eba fe92      	jsr 1ace <Init_Copy>(pc)
    1c3e:	588f           	addq.l #4,sp
    1c40:	6000 00ea      	bra.w 1d2c <Zoom_ZoomIntoPicture+0x224>
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1c44:	3039 0000 b84a 	move.w b84a <ZoomHorizontal>,d0
    1c4a:	b06f 0022      	cmp.w 34(sp),d0
    1c4e:	6c12           	bge.s 1c62 <Zoom_ZoomIntoPicture+0x15a>
          linesleft -= ZoomHorizontal;
    1c50:	322f 0022      	move.w 34(sp),d1
    1c54:	3039 0000 b84a 	move.w b84a <ZoomHorizontal>,d0
    1c5a:	9240           	sub.w d0,d1
    1c5c:	3f41 0022      	move.w d1,34(sp)
    1c60:	600c           	bra.s 1c6e <Zoom_ZoomIntoPicture+0x166>
        } else {
          ZoomHorizontal = linesleft;
    1c62:	33ef 0022 0000 	move.w 34(sp),b84a <ZoomHorizontal>
    1c68:	b84a 
          linesleft = 0;
    1c6a:	426f 0022      	clr.w 34(sp)
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
    1c6e:	3039 0000 b84a 	move.w b84a <ZoomHorizontal>,d0
    1c74:	322f 0018      	move.w 24(sp),d1
    1c78:	c3c0           	muls.w d0,d1
    1c7a:	3f41 000c      	move.w d1,12(sp)
        //Add aditional line
        if( linesleft>0) {
    1c7e:	4a6f 0022      	tst.w 34(sp)
    1c82:	6f4c           	ble.s 1cd0 <Zoom_ZoomIntoPicture+0x1c8>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1c84:	7200           	moveq #0,d1
    1c86:	322f 000c      	move.w 12(sp),d1
    1c8a:	7000           	moveq #0,d0
    1c8c:	302f 002a      	move.w 42(sp),d0
    1c90:	d081           	add.l d1,d0
    1c92:	d080           	add.l d0,d0
    1c94:	222f 001e      	move.l 30(sp),d1
    1c98:	d280           	add.l d0,d1
    1c9a:	2f41 0008      	move.l d1,8(sp)
          UWORD *tmpdest = pos4dest +  size4blit;
    1c9e:	7000           	moveq #0,d0
    1ca0:	302f 000c      	move.w 12(sp),d0
    1ca4:	d080           	add.l d0,d0
    1ca6:	222f 001a      	move.l 26(sp),d1
    1caa:	d280           	add.l d0,d1
    1cac:	2f41 0004      	move.l d1,4(sp)
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
    1cb0:	7000           	moveq #0,d0
    1cb2:	3017           	move.w (sp),d0
    1cb4:	2f00           	move.l d0,-(sp)
    1cb6:	2f2f 0008      	move.l 8(sp),-(sp)
    1cba:	2f2f 0010      	move.l 16(sp),-(sp)
    1cbe:	4eba f2d2      	jsr f92 <Zoom_CopyWord>(pc)
    1cc2:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1cc6:	302f 0022      	move.w 34(sp),d0
    1cca:	5340           	subq.w #1,d0
    1ccc:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1cd0:	3039 0000 b84a 	move.w b84a <ZoomHorizontal>,d0
    1cd6:	c1d7           	muls.w (sp),d0
    1cd8:	7200           	moveq #0,d1
    1cda:	3200           	move.w d0,d1
    1cdc:	7000           	moveq #0,d0
    1cde:	302f 002a      	move.w 42(sp),d0
    1ce2:	d080           	add.l d0,d0
    1ce4:	d0af 001e      	add.l 30(sp),d0
    1ce8:	2f01           	move.l d1,-(sp)
    1cea:	2f2f 001e      	move.l 30(sp),-(sp)
    1cee:	2f00           	move.l d0,-(sp)
    1cf0:	4eba f2a0      	jsr f92 <Zoom_CopyWord>(pc)
    1cf4:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1cf8:	7000           	moveq #0,d0
    1cfa:	302f 000c      	move.w 12(sp),d0
    1cfe:	d080           	add.l d0,d0
    1d00:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep; 
    1d04:	7200           	moveq #0,d1
    1d06:	322f 000c      	move.w 12(sp),d1
    1d0a:	7000           	moveq #0,d0
    1d0c:	302f 0018      	move.w 24(sp),d0
    1d10:	d081           	add.l d1,d0
    1d12:	d080           	add.l d0,d0
    1d14:	d1af 001a      	add.l d0,26(sp)
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1d18:	302f 0002      	move.w 2(sp),d0
    1d1c:	d040           	add.w d0,d0
    1d1e:	906f 0002      	sub.w 2(sp),d0
    1d22:	0640 0012      	addi.w #18,d0
    1d26:	33c0 0000 b84a 	move.w d0,b84a <ZoomHorizontal>
      while(linesleft > 0) {
    1d2c:	4a6f 0022      	tst.w 34(sp)
    1d30:	6e00 ff12      	bgt.w 1c44 <Zoom_ZoomIntoPicture+0x13c>
    1d34:	6000 0140      	bra.w 1e76 <Zoom_ZoomIntoPicture+0x36e>
      }
    } else {  
      Init_ZoomBlit( startofword, nextzoom, shiftright);   
    1d38:	326f 0032      	movea.w 50(sp),a1
    1d3c:	306f 002c      	movea.w 44(sp),a0
    1d40:	7000           	moveq #0,d0
    1d42:	302f 002e      	move.w 46(sp),d0
    1d46:	2f09           	move.l a1,-(sp)
    1d48:	2f08           	move.l a0,-(sp)
    1d4a:	2f00           	move.l d0,-(sp)
    1d4c:	4eba fcdc      	jsr 1a2a <Init_ZoomBlit>(pc)
    1d50:	4fef 000c      	lea 12(sp),sp
      nextzoom -= (19 + zoomnr);
    1d54:	302f 002c      	move.w 44(sp),d0
    1d58:	906f 0002      	sub.w 2(sp),d0
    1d5c:	0640 ffed      	addi.w #-19,d0
    1d60:	3f40 002c      	move.w d0,44(sp)
    1d64:	6000 00ea      	bra.w 1e50 <Zoom_ZoomIntoPicture+0x348>
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1d68:	3039 0000 b84a 	move.w b84a <ZoomHorizontal>,d0
    1d6e:	b06f 0022      	cmp.w 34(sp),d0
    1d72:	6c12           	bge.s 1d86 <Zoom_ZoomIntoPicture+0x27e>
          linesleft -= ZoomHorizontal;
    1d74:	322f 0022      	move.w 34(sp),d1
    1d78:	3039 0000 b84a 	move.w b84a <ZoomHorizontal>,d0
    1d7e:	9240           	sub.w d0,d1
    1d80:	3f41 0022      	move.w d1,34(sp)
    1d84:	600c           	bra.s 1d92 <Zoom_ZoomIntoPicture+0x28a>
        } else {
          ZoomHorizontal = linesleft;
    1d86:	33ef 0022 0000 	move.w 34(sp),b84a <ZoomHorizontal>
    1d8c:	b84a 
          linesleft = 0;
    1d8e:	426f 0022      	clr.w 34(sp)
        }
        UWORD size4blit = ZoomHorizontal*onestep;
    1d92:	3039 0000 b84a 	move.w b84a <ZoomHorizontal>,d0
    1d98:	322f 0018      	move.w 24(sp),d1
    1d9c:	c3c0           	muls.w d0,d1
    1d9e:	3f41 0016      	move.w d1,22(sp)
        //Add aditional line
        if( linesleft>0) {
    1da2:	4a6f 0022      	tst.w 34(sp)
    1da6:	6f4c           	ble.s 1df4 <Zoom_ZoomIntoPicture+0x2ec>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1da8:	7200           	moveq #0,d1
    1daa:	322f 0016      	move.w 22(sp),d1
    1dae:	7000           	moveq #0,d0
    1db0:	302f 002a      	move.w 42(sp),d0
    1db4:	d081           	add.l d1,d0
    1db6:	d080           	add.l d0,d0
    1db8:	222f 001e      	move.l 30(sp),d1
    1dbc:	d280           	add.l d0,d1
    1dbe:	2f41 0012      	move.l d1,18(sp)
          UWORD *tmpdest = pos4dest + size4blit;
    1dc2:	7000           	moveq #0,d0
    1dc4:	302f 0016      	move.w 22(sp),d0
    1dc8:	d080           	add.l d0,d0
    1dca:	222f 001a      	move.l 26(sp),d1
    1dce:	d280           	add.l d0,d1
    1dd0:	2f41 000e      	move.l d1,14(sp)
          
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
    1dd4:	7000           	moveq #0,d0
    1dd6:	3017           	move.w (sp),d0
    1dd8:	2f00           	move.l d0,-(sp)
    1dda:	2f2f 0012      	move.l 18(sp),-(sp)
    1dde:	2f2f 001a      	move.l 26(sp),-(sp)
    1de2:	4eba f1ec      	jsr fd0 <Zoom_ZoomBlit>(pc)
    1de6:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1dea:	302f 0022      	move.w 34(sp),d0
    1dee:	5340           	subq.w #1,d0
    1df0:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1df4:	3039 0000 b84a 	move.w b84a <ZoomHorizontal>,d0
    1dfa:	c1d7           	muls.w (sp),d0
    1dfc:	7200           	moveq #0,d1
    1dfe:	3200           	move.w d0,d1
    1e00:	7000           	moveq #0,d0
    1e02:	302f 002a      	move.w 42(sp),d0
    1e06:	d080           	add.l d0,d0
    1e08:	d0af 001e      	add.l 30(sp),d0
    1e0c:	2f01           	move.l d1,-(sp)
    1e0e:	2f2f 001e      	move.l 30(sp),-(sp)
    1e12:	2f00           	move.l d0,-(sp)
    1e14:	4eba f1ba      	jsr fd0 <Zoom_ZoomBlit>(pc)
    1e18:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1e1c:	7000           	moveq #0,d0
    1e1e:	302f 0016      	move.w 22(sp),d0
    1e22:	d080           	add.l d0,d0
    1e24:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep;   
    1e28:	7200           	moveq #0,d1
    1e2a:	322f 0016      	move.w 22(sp),d1
    1e2e:	7000           	moveq #0,d0
    1e30:	302f 0018      	move.w 24(sp),d0
    1e34:	d081           	add.l d1,d0
    1e36:	d080           	add.l d0,d0
    1e38:	d1af 001a      	add.l d0,26(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1e3c:	302f 0002      	move.w 2(sp),d0
    1e40:	d040           	add.w d0,d0
    1e42:	906f 0002      	sub.w 2(sp),d0
    1e46:	0640 0012      	addi.w #18,d0
    1e4a:	33c0 0000 b84a 	move.w d0,b84a <ZoomHorizontal>
      while( linesleft > 0) {
    1e50:	4a6f 0022      	tst.w 34(sp)
    1e54:	6e00 ff12      	bgt.w 1d68 <Zoom_ZoomIntoPicture+0x260>
      }
      shiftright--;  
    1e58:	302f 0032      	move.w 50(sp),d0
    1e5c:	5340           	subq.w #1,d0
    1e5e:	3f40 0032      	move.w d0,50(sp)
      if(shiftright < 0) {
    1e62:	6a12           	bpl.s 1e76 <Zoom_ZoomIntoPicture+0x36e>
        shiftright += 16;
    1e64:	302f 0032      	move.w 50(sp),d0
    1e68:	0640 0010      	addi.w #16,d0
    1e6c:	3f40 0032      	move.w d0,50(sp)
        shifttoleft = 1;
    1e70:	3f7c 0001 002a 	move.w #1,42(sp)
      }
    }
    startofword -= 16;
    1e76:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    1e7c:	52af 0024      	addq.l #1,36(sp)
    1e80:	7015           	moveq #21,d0
    1e82:	b0af 0024      	cmp.l 36(sp),d0
    1e86:	6c00 fd30      	bge.w 1bb8 <Zoom_ZoomIntoPicture+0xb0>
  }
}
    1e8a:	4fef 0034      	lea 52(sp),sp
    1e8e:	4e75           	rts

00001e90 <Zoom_SetBplPointers>:

void Zoom_SetBplPointers( UWORD volatile *buffer, ULONG volatile *copper) {
    1e90:	4fef ffb0      	lea -80(sp),sp
  //                   0  1  1   1   1   0   1   1    1    1    0    1    1    0    1    1
  //int zoomoffset[] = { 0, 0, 42, 42, 84, 84, 84, 126, 126, 168, 168, 168, 210, 210, 210, 332};
  //int zoomoffset[] = { 252, 210, 210, 210, 168, 168, 168, 126, 126, 84, 84, 84, 42, 42, 0, 0 };
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
    1e94:	204f           	movea.l sp,a0
    1e96:	223c 0000 7d94 	move.l #32148,d1
    1e9c:	7040           	moveq #64,d0
    1e9e:	2f00           	move.l d0,-(sp)
    1ea0:	2f01           	move.l d1,-(sp)
    1ea2:	2f08           	move.l a0,-(sp)
    1ea4:	4eba 4f74      	jsr 6e1a <memcpy>(pc)
    1ea8:	4fef 000c      	lea 12(sp),sp

  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
    1eac:	3039 0000 b846 	move.w b846 <Zoom_LevelOf102Zoom>,d0
    1eb2:	3000           	move.w d0,d0
    1eb4:	0280 0000 ffff 	andi.l #65535,d0
    1eba:	d080           	add.l d0,d0
    1ebc:	d080           	add.l d0,d0
    1ebe:	41ef 0050      	lea 80(sp),a0
    1ec2:	d1c0           	adda.l d0,a0
    1ec4:	41e8 ffb0      	lea -80(a0),a0
    1ec8:	2010           	move.l (a0),d0
    1eca:	d080           	add.l d0,d0
    1ecc:	d0af 0054      	add.l 84(sp),d0
    1ed0:	2f40 004c      	move.l d0,76(sp)
  /*ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;*/
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
    1ed4:	7072           	moveq #114,d0
    1ed6:	d0af 0058      	add.l 88(sp),d0
    1eda:	2f40 0048      	move.l d0,72(sp)
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1ede:	42af 0044      	clr.l 68(sp)
    1ee2:	6036           	bra.s 1f1a <Zoom_SetBplPointers+0x8a>
    UWORD highword = (ULONG)plane2set >> 16;
    1ee4:	202f 004c      	move.l 76(sp),d0
    1ee8:	4240           	clr.w d0
    1eea:	4840           	swap d0
    1eec:	3f40 0042      	move.w d0,66(sp)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1ef0:	3f6f 004e 0040 	move.w 78(sp),64(sp)
    *posofcopper = highword;
    1ef6:	206f 0048      	movea.l 72(sp),a0
    1efa:	30af 0042      	move.w 66(sp),(a0)
    posofcopper += 2;
    1efe:	58af 0048      	addq.l #4,72(sp)
    *posofcopper = lowword;
    1f02:	206f 0048      	movea.l 72(sp),a0
    1f06:	30af 0040      	move.w 64(sp),(a0)
    posofcopper += 2;
    1f0a:	58af 0048      	addq.l #4,72(sp)
    plane2set += 42*268; //Next plane
    1f0e:	06af 0000 2bf8 	addi.l #11256,76(sp)
    1f14:	004c 
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1f16:	52af 0044      	addq.l #1,68(sp)
    1f1a:	7004           	moveq #4,d0
    1f1c:	b0af 0044      	cmp.l 68(sp),d0
    1f20:	6cc2           	bge.s 1ee4 <Zoom_SetBplPointers+0x54>
  }
  
}
    1f22:	4fef 0050      	lea 80(sp),sp
    1f26:	4e75           	rts

00001f28 <Zoom_SwapBuffers>:

void Zoom_SwapBuffers( UWORD zoomlevel) {
    1f28:	518f           	subq.l #8,sp
    1f2a:	202f 000c      	move.l 12(sp),d0
    1f2e:	3000           	move.w d0,d0
    1f30:	3f40 0002      	move.w d0,2(sp)
  //ViewBuffer = rawzoom + (42*268*5*zoomlevel);
  ULONG tmp = (ULONG) DrawBuffer;
    1f34:	2039 0000 b7e8 	move.l b7e8 <DrawBuffer>,d0
    1f3a:	2f40 0004      	move.l d0,4(sp)
  DrawBuffer = ViewBuffer;
    1f3e:	2039 0000 b7ec 	move.l b7ec <ViewBuffer>,d0
    1f44:	23c0 0000 b7e8 	move.l d0,b7e8 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
    1f4a:	202f 0004      	move.l 4(sp),d0
    1f4e:	23c0 0000 b7ec 	move.l d0,b7ec <ViewBuffer>
}
    1f54:	508f           	addq.l #8,sp
    1f56:	4e75           	rts

00001f58 <Test_Zoom2>:
#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
    1f58:	4fef ff00      	lea -256(sp),sp
    1f5c:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  //Test Zoomlevel 1
  volatile ULONG *srcsmall = AllocMem( 80, MEMF_CHIP);
    1f60:	7050           	moveq #80,d0
    1f62:	2f40 00f0      	move.l d0,240(sp)
    1f66:	7002           	moveq #2,d0
    1f68:	2f40 00ec      	move.l d0,236(sp)
    1f6c:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    1f72:	2c40           	movea.l d0,a6
    1f74:	202f 00f0      	move.l 240(sp),d0
    1f78:	222f 00ec      	move.l 236(sp),d1
    1f7c:	4eae ff3a      	jsr -198(a6)
    1f80:	2f40 00e8      	move.l d0,232(sp)
    1f84:	202f 00e8      	move.l 232(sp),d0
    1f88:	2f40 00e4      	move.l d0,228(sp)
  if( srcsmall == 0) {
    1f8c:	6646           	bne.s 1fd4 <Test_Zoom2+0x7c>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcsmall\n", 42);
    1f8e:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    1f94:	2c40           	movea.l d0,a6
    1f96:	4eae ffc4      	jsr -60(a6)
    1f9a:	2f40 001c      	move.l d0,28(sp)
    1f9e:	202f 001c      	move.l 28(sp),d0
    1fa2:	2f40 0018      	move.l d0,24(sp)
    1fa6:	2f7c 0000 7dd4 	move.l #32212,20(sp)
    1fac:	0014 
    1fae:	702a           	moveq #42,d0
    1fb0:	2f40 0010      	move.l d0,16(sp)
    1fb4:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    1fba:	2c40           	movea.l d0,a6
    1fbc:	222f 0018      	move.l 24(sp),d1
    1fc0:	242f 0014      	move.l 20(sp),d2
    1fc4:	262f 0010      	move.l 16(sp),d3
    1fc8:	4eae ffd0      	jsr -48(a6)
    1fcc:	2f40 000c      	move.l d0,12(sp)
    1fd0:	6000 0560      	bra.w 2532 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong(srcsmall, 0xaaaaaaaa, 2, 10, 0);
    1fd4:	42a7           	clr.l -(sp)
    1fd6:	4878 000a      	pea a <_start+0xa>
    1fda:	4878 0002      	pea 2 <_start+0x2>
    1fde:	2f3c aaaa aaaa 	move.l #-1431655766,-(sp)
    1fe4:	2f2f 00f4      	move.l 244(sp),-(sp)
    1fe8:	4eba e20e      	jsr 1f8 <Utils_FillLong>(pc)
    1fec:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *srcbig = AllocMem( 160, MEMF_CHIP);
    1ff0:	2f7c 0000 00a0 	move.l #160,224(sp)
    1ff6:	00e0 
    1ff8:	7002           	moveq #2,d0
    1ffa:	2f40 00dc      	move.l d0,220(sp)
    1ffe:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    2004:	2c40           	movea.l d0,a6
    2006:	202f 00e0      	move.l 224(sp),d0
    200a:	222f 00dc      	move.l 220(sp),d1
    200e:	4eae ff3a      	jsr -198(a6)
    2012:	2f40 00d8      	move.l d0,216(sp)
    2016:	202f 00d8      	move.l 216(sp),d0
    201a:	2f40 00d4      	move.l d0,212(sp)
    if( srcbig == 0) {
    201e:	6646           	bne.s 2066 <Test_Zoom2+0x10e>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcbig\n", 40);
    2020:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2026:	2c40           	movea.l d0,a6
    2028:	4eae ffc4      	jsr -60(a6)
    202c:	2f40 0030      	move.l d0,48(sp)
    2030:	202f 0030      	move.l 48(sp),d0
    2034:	2f40 002c      	move.l d0,44(sp)
    2038:	2f7c 0000 7dff 	move.l #32255,40(sp)
    203e:	0028 
    2040:	7028           	moveq #40,d0
    2042:	2f40 0024      	move.l d0,36(sp)
    2046:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    204c:	2c40           	movea.l d0,a6
    204e:	222f 002c      	move.l 44(sp),d1
    2052:	242f 0028      	move.l 40(sp),d2
    2056:	262f 0024      	move.l 36(sp),d3
    205a:	4eae ffd0      	jsr -48(a6)
    205e:	2f40 0020      	move.l d0,32(sp)
    2062:	6000 04ce      	bra.w 2532 <Test_Zoom2+0x5da>
    return;
  }
  Utils_FillLong( srcbig, 0x55555555, 2, 20, 0);
    2066:	42a7           	clr.l -(sp)
    2068:	4878 0014      	pea 14 <_start+0x14>
    206c:	4878 0002      	pea 2 <_start+0x2>
    2070:	2f3c 5555 5555 	move.l #1431655765,-(sp)
    2076:	2f2f 00e4      	move.l 228(sp),-(sp)
    207a:	4eba e17c      	jsr 1f8 <Utils_FillLong>(pc)
    207e:	4fef 0014      	lea 20(sp),sp

  volatile ULONG *target = AllocMem( 168, MEMF_CHIP);
    2082:	2f7c 0000 00a8 	move.l #168,208(sp)
    2088:	00d0 
    208a:	7002           	moveq #2,d0
    208c:	2f40 00cc      	move.l d0,204(sp)
    2090:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    2096:	2c40           	movea.l d0,a6
    2098:	202f 00d0      	move.l 208(sp),d0
    209c:	222f 00cc      	move.l 204(sp),d1
    20a0:	4eae ff3a      	jsr -198(a6)
    20a4:	2f40 00c8      	move.l d0,200(sp)
    20a8:	202f 00c8      	move.l 200(sp),d0
    20ac:	2f40 00c4      	move.l d0,196(sp)
  if( target == 0) {
    20b0:	6646           	bne.s 20f8 <Test_Zoom2+0x1a0>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
    20b2:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    20b8:	2c40           	movea.l d0,a6
    20ba:	4eae ffc4      	jsr -60(a6)
    20be:	2f40 0044      	move.l d0,68(sp)
    20c2:	202f 0044      	move.l 68(sp),d0
    20c6:	2f40 0040      	move.l d0,64(sp)
    20ca:	2f7c 0000 7e28 	move.l #32296,60(sp)
    20d0:	003c 
    20d2:	7028           	moveq #40,d0
    20d4:	2f40 0038      	move.l d0,56(sp)
    20d8:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    20de:	2c40           	movea.l d0,a6
    20e0:	222f 0040      	move.l 64(sp),d1
    20e4:	242f 003c      	move.l 60(sp),d2
    20e8:	262f 0038      	move.l 56(sp),d3
    20ec:	4eae ffd0      	jsr -48(a6)
    20f0:	2f40 0034      	move.l d0,52(sp)
    20f4:	6000 043c      	bra.w 2532 <Test_Zoom2+0x5da>
    return;
  }
  WaitBlt();
    20f8:	4eba dfba      	jsr b4 <WaitBlt>(pc)
  hw->bltafwm = 0xffff;
    20fc:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    2102:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2108:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    210e:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltdmod = 38;
    2114:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    211a:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcon1 = 1 << 12; //Shift src big
    2120:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    2126:	317c 1000 0042 	move.w #4096,66(a0)
  hw->bltcon0 = 0xde4; //Chanell settings and Shift src small
    212c:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    2132:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltcdat = 0x8000; //Show channel small if 1 else channel big
    2138:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    213e:	317c 8000 0070 	move.w #-32768,112(a0)
  //srcbig-shift   0010 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sbbb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2144:	4878 0001      	pea 1 <_start+0x1>
    2148:	4878 004e      	pea 4e <_start+0x4e>
    214c:	4878 0026      	pea 26 <_start+0x26>
    2150:	4878 0002      	pea 2 <_start+0x2>
    2154:	2f2f 00d4      	move.l 212(sp),-(sp)
    2158:	2f2f 00e8      	move.l 232(sp),-(sp)
    215c:	2f2f 00fc      	move.l 252(sp),-(sp)
    2160:	4eba eed2      	jsr 1034 <Zoom_ZoomBlit2>(pc)
    2164:	4fef 001c      	lea 28(sp),sp
  UWORD *tmp = (UWORD *)target;
    2168:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    216e:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    2174:	2c40           	movea.l d0,a6
    2176:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    217a:	42af 0104      	clr.l 260(sp)
    217e:	605c           	bra.s 21dc <Test_Zoom2+0x284>
    if( *tmp != 0xaaaa ) {
    2180:	206f 0108      	movea.l 264(sp),a0
    2184:	3010           	move.w (a0),d0
    2186:	0c40 aaaa      	cmpi.w #-21846,d0
    218a:	6746           	beq.s 21d2 <Test_Zoom2+0x27a>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 1 failed\n", 40);
    218c:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2192:	2c40           	movea.l d0,a6
    2194:	4eae ffc4      	jsr -60(a6)
    2198:	2f40 0058      	move.l d0,88(sp)
    219c:	202f 0058      	move.l 88(sp),d0
    21a0:	2f40 0054      	move.l d0,84(sp)
    21a4:	2f7c 0000 7e51 	move.l #32337,80(sp)
    21aa:	0050 
    21ac:	7028           	moveq #40,d0
    21ae:	2f40 004c      	move.l d0,76(sp)
    21b2:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    21b8:	2c40           	movea.l d0,a6
    21ba:	222f 0054      	move.l 84(sp),d1
    21be:	242f 0050      	move.l 80(sp),d2
    21c2:	262f 004c      	move.l 76(sp),d3
    21c6:	4eae ffd0      	jsr -48(a6)
    21ca:	2f40 0048      	move.l d0,72(sp)
    21ce:	6000 0362      	bra.w 2532 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    21d2:	7028           	moveq #40,d0
    21d4:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    21d8:	52af 0104      	addq.l #1,260(sp)
    21dc:	7001           	moveq #1,d0
    21de:	b0af 0104      	cmp.l 260(sp),d0
    21e2:	6c9c           	bge.s 2180 <Test_Zoom2+0x228>
  //srcbig-shift   0001 0101 0101 0101
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       ssbb bbbb bbbb bbbb
  //result:        1001 0101 0101 0101

  hw->bltcon1 = 2 << 12; //Shift src big
    21e4:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    21ea:	317c 2000 0042 	move.w #8192,66(a0)
  hw->bltcdat = 0xc000; //Show channel small if 1 else channel big
    21f0:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    21f6:	317c c000 0070 	move.w #-16384,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    21fc:	4878 0001      	pea 1 <_start+0x1>
    2200:	4878 004e      	pea 4e <_start+0x4e>
    2204:	4878 0026      	pea 26 <_start+0x26>
    2208:	4878 0002      	pea 2 <_start+0x2>
    220c:	2f2f 00d4      	move.l 212(sp),-(sp)
    2210:	2f2f 00e8      	move.l 232(sp),-(sp)
    2214:	2f2f 00fc      	move.l 252(sp),-(sp)
    2218:	4eba ee1a      	jsr 1034 <Zoom_ZoomBlit2>(pc)
    221c:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2220:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2226:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    222c:	2c40           	movea.l d0,a6
    222e:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2232:	42af 0100      	clr.l 256(sp)
    2236:	605c           	bra.s 2294 <Test_Zoom2+0x33c>
    if( *tmp != 0x9555 ) {
    2238:	206f 0108      	movea.l 264(sp),a0
    223c:	3010           	move.w (a0),d0
    223e:	0c40 9555      	cmpi.w #-27307,d0
    2242:	6746           	beq.s 228a <Test_Zoom2+0x332>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 2 failed\n", 40);
    2244:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    224a:	2c40           	movea.l d0,a6
    224c:	4eae ffc4      	jsr -60(a6)
    2250:	2f40 006c      	move.l d0,108(sp)
    2254:	202f 006c      	move.l 108(sp),d0
    2258:	2f40 0068      	move.l d0,104(sp)
    225c:	2f7c 0000 7e7a 	move.l #32378,100(sp)
    2262:	0064 
    2264:	7028           	moveq #40,d0
    2266:	2f40 0060      	move.l d0,96(sp)
    226a:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2270:	2c40           	movea.l d0,a6
    2272:	222f 0068      	move.l 104(sp),d1
    2276:	242f 0064      	move.l 100(sp),d2
    227a:	262f 0060      	move.l 96(sp),d3
    227e:	4eae ffd0      	jsr -48(a6)
    2282:	2f40 005c      	move.l d0,92(sp)
    2286:	6000 02aa      	bra.w 2532 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;
    228a:	7028           	moveq #40,d0
    228c:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2290:	52af 0100      	addq.l #1,256(sp)
    2294:	7001           	moveq #1,d0
    2296:	b0af 0100      	cmp.l 256(sp),d0
    229a:	6c9c           	bge.s 2238 <Test_Zoom2+0x2e0>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    229c:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    22a2:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    22a8:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    22ae:	317c e000 0070 	move.w #-8192,112(a0)
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    22b4:	4878 0001      	pea 1 <_start+0x1>
    22b8:	4878 004e      	pea 4e <_start+0x4e>
    22bc:	4878 0026      	pea 26 <_start+0x26>
    22c0:	4878 0002      	pea 2 <_start+0x2>
    22c4:	2f2f 00d4      	move.l 212(sp),-(sp)
    22c8:	2f2f 00e8      	move.l 232(sp),-(sp)
    22cc:	2f2f 00fc      	move.l 252(sp),-(sp)
    22d0:	4eba ed62      	jsr 1034 <Zoom_ZoomBlit2>(pc)
    22d4:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    22d8:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    22de:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    22e4:	2c40           	movea.l d0,a6
    22e6:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    22ea:	42af 00fc      	clr.l 252(sp)
    22ee:	605c           	bra.s 234c <Test_Zoom2+0x3f4>
    if( *tmp != 0xaaaa ) {
    22f0:	206f 0108      	movea.l 264(sp),a0
    22f4:	3010           	move.w (a0),d0
    22f6:	0c40 aaaa      	cmpi.w #-21846,d0
    22fa:	6746           	beq.s 2342 <Test_Zoom2+0x3ea>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    22fc:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2302:	2c40           	movea.l d0,a6
    2304:	4eae ffc4      	jsr -60(a6)
    2308:	2f40 0080      	move.l d0,128(sp)
    230c:	202f 0080      	move.l 128(sp),d0
    2310:	2f40 007c      	move.l d0,124(sp)
    2314:	2f7c 0000 7ea3 	move.l #32419,120(sp)
    231a:	0078 
    231c:	7028           	moveq #40,d0
    231e:	2f40 0074      	move.l d0,116(sp)
    2322:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2328:	2c40           	movea.l d0,a6
    232a:	222f 007c      	move.l 124(sp),d1
    232e:	242f 0078      	move.l 120(sp),d2
    2332:	262f 0074      	move.l 116(sp),d3
    2336:	4eae ffd0      	jsr -48(a6)
    233a:	2f40 0070      	move.l d0,112(sp)
    233e:	6000 01f2      	bra.w 2532 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    2342:	7028           	moveq #40,d0
    2344:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2348:	52af 00fc      	addq.l #1,252(sp)
    234c:	7001           	moveq #1,d0
    234e:	b0af 00fc      	cmp.l 252(sp),d0
    2352:	6c9c           	bge.s 22f0 <Test_Zoom2+0x398>
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    2354:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    235a:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    2360:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    2366:	317c e000 0070 	move.w #-8192,112(a0)

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    236c:	4878 0001      	pea 1 <_start+0x1>
    2370:	4878 004e      	pea 4e <_start+0x4e>
    2374:	4878 0026      	pea 26 <_start+0x26>
    2378:	4878 0002      	pea 2 <_start+0x2>
    237c:	2f2f 00d4      	move.l 212(sp),-(sp)
    2380:	2f2f 00e8      	move.l 232(sp),-(sp)
    2384:	2f2f 00fc      	move.l 252(sp),-(sp)
    2388:	4eba ecaa      	jsr 1034 <Zoom_ZoomBlit2>(pc)
    238c:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2390:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    2396:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    239c:	2c40           	movea.l d0,a6
    239e:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    23a2:	42af 00f8      	clr.l 248(sp)
    23a6:	605c           	bra.s 2404 <Test_Zoom2+0x4ac>
    if( *tmp != 0xaaaa ) {
    23a8:	206f 0108      	movea.l 264(sp),a0
    23ac:	3010           	move.w (a0),d0
    23ae:	0c40 aaaa      	cmpi.w #-21846,d0
    23b2:	6746           	beq.s 23fa <Test_Zoom2+0x4a2>
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
    23b4:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    23ba:	2c40           	movea.l d0,a6
    23bc:	4eae ffc4      	jsr -60(a6)
    23c0:	2f40 0094      	move.l d0,148(sp)
    23c4:	202f 0094      	move.l 148(sp),d0
    23c8:	2f40 0090      	move.l d0,144(sp)
    23cc:	2f7c 0000 7ea3 	move.l #32419,140(sp)
    23d2:	008c 
    23d4:	7028           	moveq #40,d0
    23d6:	2f40 0088      	move.l d0,136(sp)
    23da:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    23e0:	2c40           	movea.l d0,a6
    23e2:	222f 0090      	move.l 144(sp),d1
    23e6:	242f 008c      	move.l 140(sp),d2
    23ea:	262f 0088      	move.l 136(sp),d3
    23ee:	4eae ffd0      	jsr -48(a6)
    23f2:	2f40 0084      	move.l d0,132(sp)
    23f6:	6000 013a      	bra.w 2532 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    23fa:	7028           	moveq #40,d0
    23fc:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    2400:	52af 00f8      	addq.l #1,248(sp)
    2404:	7001           	moveq #1,d0
    2406:	b0af 00f8      	cmp.l 248(sp),d0
    240a:	6c9c           	bge.s 23a8 <Test_Zoom2+0x450>
  //srcsmall:            1010 1010 1010 1010
  //srcsmall-shift:      0101 0101 0101 0101
  //pattern:             sssb bbbb bbbb bbbb
  //result:              0100 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
    240c:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    2412:	317c 3000 0042 	move.w #12288,66(a0)
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
    2418:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    241e:	317c e000 0070 	move.w #-8192,112(a0)
  hw->bltcon0 = 0xde4 + (1 << 12); //Chanell settings and Shift src small
    2424:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    242a:	317c 1de4 0040 	move.w #7652,64(a0)
 
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
    2430:	4878 0001      	pea 1 <_start+0x1>
    2434:	4878 004e      	pea 4e <_start+0x4e>
    2438:	4878 0026      	pea 26 <_start+0x26>
    243c:	4878 0002      	pea 2 <_start+0x2>
    2440:	2f2f 00d4      	move.l 212(sp),-(sp)
    2444:	2f2f 00e8      	move.l 232(sp),-(sp)
    2448:	2f2f 00fc      	move.l 252(sp),-(sp)
    244c:	4eba ebe6      	jsr 1034 <Zoom_ZoomBlit2>(pc)
    2450:	4fef 001c      	lea 28(sp),sp
  tmp = (UWORD *)target;
    2454:	2f6f 00c4 0108 	move.l 196(sp),264(sp)
  WaitBlit();
    245a:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    2460:	2c40           	movea.l d0,a6
    2462:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<2;i++)
    2466:	42af 00f4      	clr.l 244(sp)
    246a:	605a           	bra.s 24c6 <Test_Zoom2+0x56e>
    if( *tmp != 0x4aaa ) {
    246c:	206f 0108      	movea.l 264(sp),a0
    2470:	3010           	move.w (a0),d0
    2472:	0c40 4aaa      	cmpi.w #19114,d0
    2476:	6744           	beq.s 24bc <Test_Zoom2+0x564>
      Write( Output(), "Test_Zoom2: Test for shifting a failed\n", 39);
    2478:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    247e:	2c40           	movea.l d0,a6
    2480:	4eae ffc4      	jsr -60(a6)
    2484:	2f40 00a8      	move.l d0,168(sp)
    2488:	202f 00a8      	move.l 168(sp),d0
    248c:	2f40 00a4      	move.l d0,164(sp)
    2490:	2f7c 0000 7ecc 	move.l #32460,160(sp)
    2496:	00a0 
    2498:	7027           	moveq #39,d0
    249a:	2f40 009c      	move.l d0,156(sp)
    249e:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    24a4:	2c40           	movea.l d0,a6
    24a6:	222f 00a4      	move.l 164(sp),d1
    24aa:	242f 00a0      	move.l 160(sp),d2
    24ae:	262f 009c      	move.l 156(sp),d3
    24b2:	4eae ffd0      	jsr -48(a6)
    24b6:	2f40 0098      	move.l d0,152(sp)
    24ba:	6076           	bra.s 2532 <Test_Zoom2+0x5da>
      return;
    } else tmp += 20;  
    24bc:	7028           	moveq #40,d0
    24be:	d1af 0108      	add.l d0,264(sp)
  for(int i=0;i<2;i++)
    24c2:	52af 00f4      	addq.l #1,244(sp)
    24c6:	7001           	moveq #1,d0
    24c8:	b0af 00f4      	cmp.l 244(sp),d0
    24cc:	6c9e           	bge.s 246c <Test_Zoom2+0x514>

  FreeMem( srcsmall, 80);
    24ce:	2f6f 00e4 00c0 	move.l 228(sp),192(sp)
    24d4:	7050           	moveq #80,d0
    24d6:	2f40 00bc      	move.l d0,188(sp)
    24da:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    24e0:	2c40           	movea.l d0,a6
    24e2:	226f 00c0      	movea.l 192(sp),a1
    24e6:	202f 00bc      	move.l 188(sp),d0
    24ea:	4eae ff2e      	jsr -210(a6)
  FreeMem( srcbig, 160);
    24ee:	2f6f 00d4 00b8 	move.l 212(sp),184(sp)
    24f4:	2f7c 0000 00a0 	move.l #160,180(sp)
    24fa:	00b4 
    24fc:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    2502:	2c40           	movea.l d0,a6
    2504:	226f 00b8      	movea.l 184(sp),a1
    2508:	202f 00b4      	move.l 180(sp),d0
    250c:	4eae ff2e      	jsr -210(a6)
  FreeMem( target, 168);
    2510:	2f6f 00c4 00b0 	move.l 196(sp),176(sp)
    2516:	2f7c 0000 00a8 	move.l #168,172(sp)
    251c:	00ac 
    251e:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    2524:	2c40           	movea.l d0,a6
    2526:	226f 00b0      	movea.l 176(sp),a1
    252a:	202f 00ac      	move.l 172(sp),d0
    252e:	4eae ff2e      	jsr -210(a6)
    2532:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2536:	4fef 0100      	lea 256(sp),sp
    253a:	4e75           	rts

0000253c <ClBuild>:
#include "utils.h"




ULONG * ClBuild() {
    253c:	4fef ffc4      	lea -60(sp),sp
    2540:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
    2544:	2f7c 0000 0084 	move.l #132,48(sp)
    254a:	0030 
    254c:	7002           	moveq #2,d0
    254e:	2f40 002c      	move.l d0,44(sp)
    2552:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    2558:	2c40           	movea.l d0,a6
    255a:	202f 0030      	move.l 48(sp),d0
    255e:	222f 002c      	move.l 44(sp),d1
    2562:	4eae ff3a      	jsr -198(a6)
    2566:	2f40 0028      	move.l d0,40(sp)
    256a:	202f 0028      	move.l 40(sp),d0
    256e:	2f40 0024      	move.l d0,36(sp)
  if( retval == 0) {
    2572:	6658           	bne.s 25cc <ClBuild+0x90>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2574:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    257a:	2c40           	movea.l d0,a6
    257c:	4eae ffc4      	jsr -60(a6)
    2580:	2f40 0020      	move.l d0,32(sp)
    2584:	202f 0020      	move.l 32(sp),d0
    2588:	2f40 001c      	move.l d0,28(sp)
    258c:	2f7c 0000 7d5f 	move.l #32095,24(sp)
    2592:	0018 
    2594:	7228           	moveq #40,d1
    2596:	2f41 0014      	move.l d1,20(sp)
    259a:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    25a0:	2c40           	movea.l d0,a6
    25a2:	222f 001c      	move.l 28(sp),d1
    25a6:	242f 0018      	move.l 24(sp),d2
    25aa:	262f 0014      	move.l 20(sp),d3
    25ae:	4eae ffd0      	jsr -48(a6)
    25b2:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    25b6:	7401           	moveq #1,d2
    25b8:	2f42 000c      	move.l d2,12(sp)
    25bc:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    25c2:	2c40           	movea.l d0,a6
    25c4:	222f 000c      	move.l 12(sp),d1
    25c8:	4eae ff70      	jsr -144(a6)
  }
    
  ULONG *cl = retval;
    25cc:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    25d2:	2f7c 0000 a080 	move.l #41088,64(sp)
    25d8:	0040 
  for(int i=0; i<16;i++)
    25da:	42af 003c      	clr.l 60(sp)
    25de:	6024           	bra.s 2604 <ClBuild+0xc8>
    *cl++ = *clpartinstruction++;
    25e0:	222f 0040      	move.l 64(sp),d1
    25e4:	2001           	move.l d1,d0
    25e6:	5880           	addq.l #4,d0
    25e8:	2f40 0040      	move.l d0,64(sp)
    25ec:	202f 0044      	move.l 68(sp),d0
    25f0:	2400           	move.l d0,d2
    25f2:	5882           	addq.l #4,d2
    25f4:	2f42 0044      	move.l d2,68(sp)
    25f8:	2041           	movea.l d1,a0
    25fa:	2210           	move.l (a0),d1
    25fc:	2040           	movea.l d0,a0
    25fe:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    2600:	52af 003c      	addq.l #1,60(sp)
    2604:	700f           	moveq #15,d0
    2606:	b0af 003c      	cmp.l 60(sp),d0
    260a:	6cd4           	bge.s 25e0 <ClBuild+0xa4>
  clpartinstruction = ClScreen;
    260c:	2f7c 0000 a0c0 	move.l #41152,64(sp)
    2612:	0040 
  for(int i=0; i<12;i++)
    2614:	42af 0038      	clr.l 56(sp)
    2618:	6024           	bra.s 263e <ClBuild+0x102>
    *cl++ = *clpartinstruction++;
    261a:	222f 0040      	move.l 64(sp),d1
    261e:	2401           	move.l d1,d2
    2620:	5882           	addq.l #4,d2
    2622:	2f42 0040      	move.l d2,64(sp)
    2626:	202f 0044      	move.l 68(sp),d0
    262a:	2400           	move.l d0,d2
    262c:	5882           	addq.l #4,d2
    262e:	2f42 0044      	move.l d2,68(sp)
    2632:	2041           	movea.l d1,a0
    2634:	2210           	move.l (a0),d1
    2636:	2040           	movea.l d0,a0
    2638:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    263a:	52af 0038      	addq.l #1,56(sp)
    263e:	700b           	moveq #11,d0
    2640:	b0af 0038      	cmp.l 56(sp),d0
    2644:	6cd4           	bge.s 261a <ClBuild+0xde>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    2646:	202f 0044      	move.l 68(sp),d0
    264a:	2200           	move.l d0,d1
    264c:	5881           	addq.l #4,d1
    264e:	2f41 0044      	move.l d1,68(sp)
    2652:	2040           	movea.l d0,a0
    2654:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    265a:	202f 0044      	move.l 68(sp),d0
    265e:	2200           	move.l d0,d1
    2660:	5881           	addq.l #4,d1
    2662:	2f41 0044      	move.l d1,68(sp)
    2666:	2040           	movea.l d0,a0
    2668:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
    266e:	2f7c 0000 a000 	move.l #40960,64(sp)
    2674:	0040 
  for(int i=0; i<2;i++)
    2676:	42af 0034      	clr.l 52(sp)
    267a:	6024           	bra.s 26a0 <ClBuild+0x164>
    *cl++ = *clpartinstruction++;
    267c:	222f 0040      	move.l 64(sp),d1
    2680:	2001           	move.l d1,d0
    2682:	5880           	addq.l #4,d0
    2684:	2f40 0040      	move.l d0,64(sp)
    2688:	202f 0044      	move.l 68(sp),d0
    268c:	2400           	move.l d0,d2
    268e:	5882           	addq.l #4,d2
    2690:	2f42 0044      	move.l d2,68(sp)
    2694:	2041           	movea.l d1,a0
    2696:	2210           	move.l (a0),d1
    2698:	2040           	movea.l d0,a0
    269a:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
    269c:	52af 0034      	addq.l #1,52(sp)
    26a0:	7001           	moveq #1,d0
    26a2:	b0af 0034      	cmp.l 52(sp),d0
    26a6:	6cd4           	bge.s 267c <ClBuild+0x140>
  *cl = 0xfffffffe;
    26a8:	206f 0044      	movea.l 68(sp),a0
    26ac:	72fe           	moveq #-2,d1
    26ae:	2081           	move.l d1,(a0)

  return retval;
    26b0:	202f 0024      	move.l 36(sp),d0
}
    26b4:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    26b8:	4fef 003c      	lea 60(sp),sp
    26bc:	4e75           	rts

000026be <PrepareDisplay>:

int PrepareDisplay() {
    26be:	4fef ffb8      	lea -72(sp),sp
    26c2:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClBuild( );
    26c6:	4eba fe74      	jsr 253c <ClBuild>(pc)
    26ca:	23c0 0000 b7e0 	move.l d0,b7e0 <Copperlist1>
  Copperlist2 = ClBuild( );
    26d0:	4eba fe6a      	jsr 253c <ClBuild>(pc)
    26d4:	23c0 0000 b7e4 	move.l d0,b7e4 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    26da:	2f7c 0000 c800 	move.l #51200,80(sp)
    26e0:	0050 
    26e2:	7002           	moveq #2,d0
    26e4:	2f40 004c      	move.l d0,76(sp)
    26e8:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    26ee:	2c40           	movea.l d0,a6
    26f0:	202f 0050      	move.l 80(sp),d0
    26f4:	222f 004c      	move.l 76(sp),d1
    26f8:	4eae ff3a      	jsr -198(a6)
    26fc:	2f40 0048      	move.l d0,72(sp)
    2700:	202f 0048      	move.l 72(sp),d0
    2704:	23c0 0000 b7d8 	move.l d0,b7d8 <Bitplane1>
  if(Bitplane1 == 0) {
    270a:	2039 0000 b7d8 	move.l b7d8 <Bitplane1>,d0
    2710:	6658           	bne.s 276a <PrepareDisplay+0xac>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2712:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2718:	2c40           	movea.l d0,a6
    271a:	4eae ffc4      	jsr -60(a6)
    271e:	2f40 0044      	move.l d0,68(sp)
    2722:	202f 0044      	move.l 68(sp),d0
    2726:	2f40 0040      	move.l d0,64(sp)
    272a:	2f7c 0000 7d11 	move.l #32017,60(sp)
    2730:	003c 
    2732:	7026           	moveq #38,d0
    2734:	2f40 0038      	move.l d0,56(sp)
    2738:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    273e:	2c40           	movea.l d0,a6
    2740:	222f 0040      	move.l 64(sp),d1
    2744:	242f 003c      	move.l 60(sp),d2
    2748:	262f 0038      	move.l 56(sp),d3
    274c:	4eae ffd0      	jsr -48(a6)
    2750:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    2754:	7001           	moveq #1,d0
    2756:	2f40 0030      	move.l d0,48(sp)
    275a:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2760:	2c40           	movea.l d0,a6
    2762:	222f 0030      	move.l 48(sp),d1
    2766:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane1;
    276a:	2039 0000 b7d8 	move.l b7d8 <Bitplane1>,d0
    2770:	23c0 0000 b7ec 	move.l d0,b7ec <ViewBuffer>
  ViewCopper = Copperlist1;
    2776:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    277c:	23c0 0000 b7f4 	move.l d0,b7f4 <ViewCopper>
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    2782:	2f7c 0000 c800 	move.l #51200,44(sp)
    2788:	002c 
    278a:	7002           	moveq #2,d0
    278c:	2f40 0028      	move.l d0,40(sp)
    2790:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    2796:	2c40           	movea.l d0,a6
    2798:	202f 002c      	move.l 44(sp),d0
    279c:	222f 0028      	move.l 40(sp),d1
    27a0:	4eae ff3a      	jsr -198(a6)
    27a4:	2f40 0024      	move.l d0,36(sp)
    27a8:	202f 0024      	move.l 36(sp),d0
    27ac:	23c0 0000 b7dc 	move.l d0,b7dc <Bitplane2>
  if(Bitplane2 == 0) {
    27b2:	2039 0000 b7dc 	move.l b7dc <Bitplane2>,d0
    27b8:	6658           	bne.s 2812 <PrepareDisplay+0x154>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    27ba:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    27c0:	2c40           	movea.l d0,a6
    27c2:	4eae ffc4      	jsr -60(a6)
    27c6:	2f40 0020      	move.l d0,32(sp)
    27ca:	202f 0020      	move.l 32(sp),d0
    27ce:	2f40 001c      	move.l d0,28(sp)
    27d2:	2f7c 0000 7d38 	move.l #32056,24(sp)
    27d8:	0018 
    27da:	7026           	moveq #38,d0
    27dc:	2f40 0014      	move.l d0,20(sp)
    27e0:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    27e6:	2c40           	movea.l d0,a6
    27e8:	222f 001c      	move.l 28(sp),d1
    27ec:	242f 0018      	move.l 24(sp),d2
    27f0:	262f 0014      	move.l 20(sp),d3
    27f4:	4eae ffd0      	jsr -48(a6)
    27f8:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    27fc:	7001           	moveq #1,d0
    27fe:	2f40 000c      	move.l d0,12(sp)
    2802:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2808:	2c40           	movea.l d0,a6
    280a:	222f 000c      	move.l 12(sp),d1
    280e:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane2;
    2812:	2039 0000 b7dc 	move.l b7dc <Bitplane2>,d0
    2818:	23c0 0000 b7e8 	move.l d0,b7e8 <DrawBuffer>
  DrawCopper = Copperlist2;
    281e:	2039 0000 b7e4 	move.l b7e4 <Copperlist2>,d0
    2824:	23c0 0000 b7f0 	move.l d0,b7f0 <DrawCopper>
  /*SwapCl();
  SetBplPointers();
  SwapCl();
  SetBplPointers();*/
  return 0;
    282a:	7000           	moveq #0,d0
}
    282c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2830:	4fef 0048      	lea 72(sp),sp
    2834:	4e75           	rts

00002836 <TestCopperlistBatch>:

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                  long length) {
    2836:	598f           	subq.l #4,sp
  for( int i=0;i<length;i++)
    2838:	4297           	clr.l (sp)
    283a:	602a           	bra.s 2866 <TestCopperlistBatch+0x30>
    if( instructions[ pos+i] != batch[ i])
    283c:	202f 000c      	move.l 12(sp),d0
    2840:	d097           	add.l (sp),d0
    2842:	d080           	add.l d0,d0
    2844:	d080           	add.l d0,d0
    2846:	206f 0008      	movea.l 8(sp),a0
    284a:	d1c0           	adda.l d0,a0
    284c:	2210           	move.l (a0),d1
    284e:	2017           	move.l (sp),d0
    2850:	d080           	add.l d0,d0
    2852:	d080           	add.l d0,d0
    2854:	206f 0010      	movea.l 16(sp),a0
    2858:	d1c0           	adda.l d0,a0
    285a:	2010           	move.l (a0),d0
    285c:	b081           	cmp.l d1,d0
    285e:	6704           	beq.s 2864 <TestCopperlistBatch+0x2e>
      return 0;
    2860:	7000           	moveq #0,d0
    2862:	600c           	bra.s 2870 <TestCopperlistBatch+0x3a>
  for( int i=0;i<length;i++)
    2864:	5297           	addq.l #1,(sp)
    2866:	2017           	move.l (sp),d0
    2868:	b0af 0014      	cmp.l 20(sp),d0
    286c:	6dce           	blt.s 283c <TestCopperlistBatch+0x6>
  return 1;
    286e:	7001           	moveq #1,d0
}
    2870:	588f           	addq.l #4,sp
    2872:	4e75           	rts

00002874 <TestCopperlistPos>:

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    2874:	202f 0008      	move.l 8(sp),d0
    2878:	d080           	add.l d0,d0
    287a:	d080           	add.l d0,d0
    287c:	206f 0004      	movea.l 4(sp),a0
    2880:	d1c0           	adda.l d0,a0
    2882:	2010           	move.l (a0),d0
    2884:	b0af 000c      	cmp.l 12(sp),d0
    2888:	6604           	bne.s 288e <TestCopperlistPos+0x1a>
    return 1;
    288a:	7001           	moveq #1,d0
    288c:	6002           	bra.s 2890 <TestCopperlistPos+0x1c>
  else 
    return 0;
    288e:	7000           	moveq #0,d0
}
    2890:	4e75           	rts

00002892 <TestCopperList>:

void TestCopperList() {
    2892:	4fef feb8      	lea -328(sp),sp
    2896:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Write( Output(), "%d", hw->cop1lc);
    289a:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    28a0:	2c40           	movea.l d0,a6
    28a2:	4eae ffc4      	jsr -60(a6)
    28a6:	2f40 0150      	move.l d0,336(sp)
    28aa:	202f 0150      	move.l 336(sp),d0
    28ae:	2f40 014c      	move.l d0,332(sp)
    28b2:	2f7c 0000 7ef4 	move.l #32500,328(sp)
    28b8:	0148 
    28ba:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    28c0:	2028 0080      	move.l 128(a0),d0
    28c4:	2f40 0144      	move.l d0,324(sp)
    28c8:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    28ce:	2c40           	movea.l d0,a6
    28d0:	222f 014c      	move.l 332(sp),d1
    28d4:	242f 0148      	move.l 328(sp),d2
    28d8:	262f 0144      	move.l 324(sp),d3
    28dc:	4eae ffd0      	jsr -48(a6)
    28e0:	2f40 0140      	move.l d0,320(sp)
  Copperlist1 = ClBuild();
    28e4:	4eba fc56      	jsr 253c <ClBuild>(pc)
    28e8:	23c0 0000 b7e0 	move.l d0,b7e0 <Copperlist1>
  DrawCopper = Copperlist1;
    28ee:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    28f4:	23c0 0000 b7f0 	move.l d0,b7f0 <DrawCopper>
  Copperlist2 = ClBuild();
    28fa:	4eba fc40      	jsr 253c <ClBuild>(pc)
    28fe:	23c0 0000 b7e4 	move.l d0,b7e4 <Copperlist2>
  ViewCopper = Copperlist2;
    2904:	2039 0000 b7e4 	move.l b7e4 <Copperlist2>,d0
    290a:	23c0 0000 b7f4 	move.l d0,b7f4 <ViewCopper>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2910:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    2916:	4878 0010      	pea 10 <_start+0x10>
    291a:	4879 0000 a080 	pea a080 <ClsSprites>
    2920:	42a7           	clr.l -(sp)
    2922:	2f00           	move.l d0,-(sp)
    2924:	4eba ff10      	jsr 2836 <TestCopperlistBatch>(pc)
    2928:	4fef 0010      	lea 16(sp),sp
    292c:	4a80           	tst.l d0
    292e:	6642           	bne.s 2972 <TestCopperList+0xe0>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    2930:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2936:	2c40           	movea.l d0,a6
    2938:	4eae ffc4      	jsr -60(a6)
    293c:	2f40 013c      	move.l d0,316(sp)
    2940:	202f 013c      	move.l 316(sp),d0
    2944:	2f40 0138      	move.l d0,312(sp)
    2948:	2f7c 0000 767c 	move.l #30332,308(sp)
    294e:	0134 
    2950:	702c           	moveq #44,d0
    2952:	2f40 0130      	move.l d0,304(sp)
    2956:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    295c:	2c40           	movea.l d0,a6
    295e:	222f 0138      	move.l 312(sp),d1
    2962:	242f 0134      	move.l 308(sp),d2
    2966:	262f 0130      	move.l 304(sp),d3
    296a:	4eae ffd0      	jsr -48(a6)
    296e:	2f40 012c      	move.l d0,300(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2972:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    2978:	4878 000c      	pea c <_start+0xc>
    297c:	4879 0000 a0c0 	pea a0c0 <ClScreen>
    2982:	4878 0010      	pea 10 <_start+0x10>
    2986:	2f00           	move.l d0,-(sp)
    2988:	4eba feac      	jsr 2836 <TestCopperlistBatch>(pc)
    298c:	4fef 0010      	lea 16(sp),sp
    2990:	4a80           	tst.l d0
    2992:	6642           	bne.s 29d6 <TestCopperList+0x144>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    2994:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    299a:	2c40           	movea.l d0,a6
    299c:	4eae ffc4      	jsr -60(a6)
    29a0:	2f40 0128      	move.l d0,296(sp)
    29a4:	202f 0128      	move.l 296(sp),d0
    29a8:	2f40 0124      	move.l d0,292(sp)
    29ac:	2f7c 0000 76b2 	move.l #30386,288(sp)
    29b2:	0120 
    29b4:	7036           	moveq #54,d0
    29b6:	2f40 011c      	move.l d0,284(sp)
    29ba:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    29c0:	2c40           	movea.l d0,a6
    29c2:	222f 0124      	move.l 292(sp),d1
    29c6:	242f 0120      	move.l 288(sp),d2
    29ca:	262f 011c      	move.l 284(sp),d3
    29ce:	4eae ffd0      	jsr -48(a6)
    29d2:	2f40 0118      	move.l d0,280(sp)
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
    29d6:	23fc 0004 0000 	move.l #262144,b7e8 <DrawBuffer>
    29dc:	0000 b7e8 
  ViewBuffer = (ULONG *)0x50000;
    29e0:	23fc 0005 0000 	move.l #327680,b7ec <ViewBuffer>
    29e6:	0000 b7ec 
  
  SetBplPointers();
    29ea:	4eba d756      	jsr 142 <SetBplPointers>(pc)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    29ee:	2039 0000 b7e8 	move.l b7e8 <DrawBuffer>,d0
    29f4:	0c80 0005 0000 	cmpi.l #327680,d0
    29fa:	660e           	bne.s 2a0a <TestCopperList+0x178>
    29fc:	2039 0000 b7ec 	move.l b7ec <ViewBuffer>,d0
    2a02:	0c80 0004 0000 	cmpi.l #262144,d0
    2a08:	6742           	beq.s 2a4c <TestCopperList+0x1ba>
    Write( Output(), 
    2a0a:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2a10:	2c40           	movea.l d0,a6
    2a12:	4eae ffc4      	jsr -60(a6)
    2a16:	2f40 0114      	move.l d0,276(sp)
    2a1a:	202f 0114      	move.l 276(sp),d0
    2a1e:	2f40 0110      	move.l d0,272(sp)
    2a22:	2f7c 0000 7ef7 	move.l #32503,268(sp)
    2a28:	010c 
    2a2a:	703b           	moveq #59,d0
    2a2c:	2f40 0108      	move.l d0,264(sp)
    2a30:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2a36:	2c40           	movea.l d0,a6
    2a38:	222f 0110      	move.l 272(sp),d1
    2a3c:	242f 010c      	move.l 268(sp),d2
    2a40:	262f 0108      	move.l 264(sp),d3
    2a44:	4eae ffd0      	jsr -48(a6)
    2a48:	2f40 0104      	move.l d0,260(sp)
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    2a4c:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    2a52:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    2a58:	4878 001c      	pea 1c <_start+0x1c>
    2a5c:	2f00           	move.l d0,-(sp)
    2a5e:	4eba fe14      	jsr 2874 <TestCopperlistPos>(pc)
    2a62:	4fef 000c      	lea 12(sp),sp
    2a66:	4a80           	tst.l d0
    2a68:	6642           	bne.s 2aac <TestCopperList+0x21a>
    Write(Output(), 
    2a6a:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2a70:	2c40           	movea.l d0,a6
    2a72:	4eae ffc4      	jsr -60(a6)
    2a76:	2f40 0100      	move.l d0,256(sp)
    2a7a:	202f 0100      	move.l 256(sp),d0
    2a7e:	2f40 00fc      	move.l d0,252(sp)
    2a82:	2f7c 0000 7f33 	move.l #32563,248(sp)
    2a88:	00f8 
    2a8a:	703c           	moveq #60,d0
    2a8c:	2f40 00f4      	move.l d0,244(sp)
    2a90:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2a96:	2c40           	movea.l d0,a6
    2a98:	222f 00fc      	move.l 252(sp),d1
    2a9c:	242f 00f8      	move.l 248(sp),d2
    2aa0:	262f 00f4      	move.l 244(sp),d3
    2aa4:	4eae ffd0      	jsr -48(a6)
    2aa8:	2f40 00f0      	move.l d0,240(sp)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    2aac:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    2ab2:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    2ab8:	4878 001d      	pea 1d <_start+0x1d>
    2abc:	2f00           	move.l d0,-(sp)
    2abe:	4eba fdb4      	jsr 2874 <TestCopperlistPos>(pc)
    2ac2:	4fef 000c      	lea 12(sp),sp
    2ac6:	4a80           	tst.l d0
    2ac8:	6642           	bne.s 2b0c <TestCopperList+0x27a>
    Write(Output(), 
    2aca:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2ad0:	2c40           	movea.l d0,a6
    2ad2:	4eae ffc4      	jsr -60(a6)
    2ad6:	2f40 00ec      	move.l d0,236(sp)
    2ada:	202f 00ec      	move.l 236(sp),d0
    2ade:	2f40 00e8      	move.l d0,232(sp)
    2ae2:	2f7c 0000 7f70 	move.l #32624,228(sp)
    2ae8:	00e4 
    2aea:	703c           	moveq #60,d0
    2aec:	2f40 00e0      	move.l d0,224(sp)
    2af0:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2af6:	2c40           	movea.l d0,a6
    2af8:	222f 00e8      	move.l 232(sp),d1
    2afc:	242f 00e4      	move.l 228(sp),d2
    2b00:	262f 00e0      	move.l 224(sp),d3
    2b04:	4eae ffd0      	jsr -48(a6)
    2b08:	2f40 00dc      	move.l d0,220(sp)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2b0c:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    2b12:	4878 0002      	pea 2 <_start+0x2>
    2b16:	4879 0000 a000 	pea a000 <ClColor>
    2b1c:	4878 001e      	pea 1e <_start+0x1e>
    2b20:	2f00           	move.l d0,-(sp)
    2b22:	4eba fd12      	jsr 2836 <TestCopperlistBatch>(pc)
    2b26:	4fef 0010      	lea 16(sp),sp
    2b2a:	4a80           	tst.l d0
    2b2c:	6642           	bne.s 2b70 <TestCopperList+0x2de>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2b2e:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2b34:	2c40           	movea.l d0,a6
    2b36:	4eae ffc4      	jsr -60(a6)
    2b3a:	2f40 00d8      	move.l d0,216(sp)
    2b3e:	202f 00d8      	move.l 216(sp),d0
    2b42:	2f40 00d4      	move.l d0,212(sp)
    2b46:	2f7c 0000 76e9 	move.l #30441,208(sp)
    2b4c:	00d0 
    2b4e:	7021           	moveq #33,d0
    2b50:	2f40 00cc      	move.l d0,204(sp)
    2b54:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2b5a:	2c40           	movea.l d0,a6
    2b5c:	222f 00d4      	move.l 212(sp),d1
    2b60:	242f 00d0      	move.l 208(sp),d2
    2b64:	262f 00cc      	move.l 204(sp),d3
    2b68:	4eae ffd0      	jsr -48(a6)
    2b6c:	2f40 00c8      	move.l d0,200(sp)

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2b70:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    2b76:	4878 fffe      	pea fffffffe <gcc8_c_support.c.f93356b9+0xfffe099d>
    2b7a:	4878 0020      	pea 20 <_start+0x20>
    2b7e:	2f00           	move.l d0,-(sp)
    2b80:	4eba fcf2      	jsr 2874 <TestCopperlistPos>(pc)
    2b84:	4fef 000c      	lea 12(sp),sp
    2b88:	4a80           	tst.l d0
    2b8a:	6642           	bne.s 2bce <TestCopperList+0x33c>
    Write(Output(), "Copperlist End not correctly set.\n", 34);
    2b8c:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2b92:	2c40           	movea.l d0,a6
    2b94:	4eae ffc4      	jsr -60(a6)
    2b98:	2f40 00c4      	move.l d0,196(sp)
    2b9c:	202f 00c4      	move.l 196(sp),d0
    2ba0:	2f40 00c0      	move.l d0,192(sp)
    2ba4:	2f7c 0000 770b 	move.l #30475,188(sp)
    2baa:	00bc 
    2bac:	7022           	moveq #34,d0
    2bae:	2f40 00b8      	move.l d0,184(sp)
    2bb2:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2bb8:	2c40           	movea.l d0,a6
    2bba:	222f 00c0      	move.l 192(sp),d1
    2bbe:	242f 00bc      	move.l 188(sp),d2
    2bc2:	262f 00b8      	move.l 184(sp),d3
    2bc6:	4eae ffd0      	jsr -48(a6)
    2bca:	2f40 00b4      	move.l d0,180(sp)
  
  SwapCl();
    2bce:	4eba d5d0      	jsr 1a0 <SwapCl>(pc)
  
  if( DrawCopper != Copperlist2)
    2bd2:	2239 0000 b7f0 	move.l b7f0 <DrawCopper>,d1
    2bd8:	2039 0000 b7e4 	move.l b7e4 <Copperlist2>,d0
    2bde:	b081           	cmp.l d1,d0
    2be0:	6742           	beq.s 2c24 <TestCopperList+0x392>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
    2be2:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2be8:	2c40           	movea.l d0,a6
    2bea:	4eae ffc4      	jsr -60(a6)
    2bee:	2f40 00b0      	move.l d0,176(sp)
    2bf2:	202f 00b0      	move.l 176(sp),d0
    2bf6:	2f40 00ac      	move.l d0,172(sp)
    2bfa:	2f7c 0000 7fad 	move.l #32685,168(sp)
    2c00:	00a8 
    2c02:	7015           	moveq #21,d0
    2c04:	2f40 00a4      	move.l d0,164(sp)
    2c08:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2c0e:	2c40           	movea.l d0,a6
    2c10:	222f 00ac      	move.l 172(sp),d1
    2c14:	242f 00a8      	move.l 168(sp),d2
    2c18:	262f 00a4      	move.l 164(sp),d3
    2c1c:	4eae ffd0      	jsr -48(a6)
    2c20:	2f40 00a0      	move.l d0,160(sp)

  
  PrepareDisplay();
    2c24:	4eba fa98      	jsr 26be <PrepareDisplay>(pc)
  if( DrawBuffer != Bitplane2) 
    2c28:	2239 0000 b7e8 	move.l b7e8 <DrawBuffer>,d1
    2c2e:	2039 0000 b7dc 	move.l b7dc <Bitplane2>,d0
    2c34:	b081           	cmp.l d1,d0
    2c36:	6742           	beq.s 2c7a <TestCopperList+0x3e8>
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
    2c38:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2c3e:	2c40           	movea.l d0,a6
    2c40:	4eae ffc4      	jsr -60(a6)
    2c44:	2f40 009c      	move.l d0,156(sp)
    2c48:	202f 009c      	move.l 156(sp),d0
    2c4c:	2f40 0098      	move.l d0,152(sp)
    2c50:	2f7c 0000 7fc3 	move.l #32707,148(sp)
    2c56:	0094 
    2c58:	7037           	moveq #55,d0
    2c5a:	2f40 0090      	move.l d0,144(sp)
    2c5e:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2c64:	2c40           	movea.l d0,a6
    2c66:	222f 0098      	move.l 152(sp),d1
    2c6a:	242f 0094      	move.l 148(sp),d2
    2c6e:	262f 0090      	move.l 144(sp),d3
    2c72:	4eae ffd0      	jsr -48(a6)
    2c76:	2f40 008c      	move.l d0,140(sp)
                                                                            55);
  if( DrawCopper != Copperlist2) 
    2c7a:	2239 0000 b7f0 	move.l b7f0 <DrawCopper>,d1
    2c80:	2039 0000 b7e4 	move.l b7e4 <Copperlist2>,d0
    2c86:	b081           	cmp.l d1,d0
    2c88:	6742           	beq.s 2ccc <TestCopperList+0x43a>
    Write( Output(), 
    2c8a:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2c90:	2c40           	movea.l d0,a6
    2c92:	4eae ffc4      	jsr -60(a6)
    2c96:	2f40 0088      	move.l d0,136(sp)
    2c9a:	202f 0088      	move.l 136(sp),d0
    2c9e:	2f40 0084      	move.l d0,132(sp)
    2ca2:	2f7c 0000 7ffb 	move.l #32763,128(sp)
    2ca8:	0080 
    2caa:	7039           	moveq #57,d0
    2cac:	2f40 007c      	move.l d0,124(sp)
    2cb0:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2cb6:	2c40           	movea.l d0,a6
    2cb8:	222f 0084      	move.l 132(sp),d1
    2cbc:	242f 0080      	move.l 128(sp),d2
    2cc0:	262f 007c      	move.l 124(sp),d3
    2cc4:	4eae ffd0      	jsr -48(a6)
    2cc8:	2f40 0078      	move.l d0,120(sp)
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
    2ccc:	2239 0000 b7ec 	move.l b7ec <ViewBuffer>,d1
    2cd2:	2039 0000 b7d8 	move.l b7d8 <Bitplane1>,d0
    2cd8:	b081           	cmp.l d1,d0
    2cda:	6742           	beq.s 2d1e <TestCopperList+0x48c>
    Write( Output(), 
    2cdc:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2ce2:	2c40           	movea.l d0,a6
    2ce4:	4eae ffc4      	jsr -60(a6)
    2ce8:	2f40 0074      	move.l d0,116(sp)
    2cec:	202f 0074      	move.l 116(sp),d0
    2cf0:	2f40 0070      	move.l d0,112(sp)
    2cf4:	2f7c 0000 8035 	move.l #32821,108(sp)
    2cfa:	006c 
    2cfc:	7038           	moveq #56,d0
    2cfe:	2f40 0068      	move.l d0,104(sp)
    2d02:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2d08:	2c40           	movea.l d0,a6
    2d0a:	222f 0070      	move.l 112(sp),d1
    2d0e:	242f 006c      	move.l 108(sp),d2
    2d12:	262f 0068      	move.l 104(sp),d3
    2d16:	4eae ffd0      	jsr -48(a6)
    2d1a:	2f40 0064      	move.l d0,100(sp)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
    2d1e:	2239 0000 b7f4 	move.l b7f4 <ViewCopper>,d1
    2d24:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    2d2a:	b081           	cmp.l d1,d0
    2d2c:	6742           	beq.s 2d70 <TestCopperList+0x4de>
    Write( Output(), 
    2d2e:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2d34:	2c40           	movea.l d0,a6
    2d36:	4eae ffc4      	jsr -60(a6)
    2d3a:	2f40 0060      	move.l d0,96(sp)
    2d3e:	202f 0060      	move.l 96(sp),d0
    2d42:	2f40 005c      	move.l d0,92(sp)
    2d46:	2f7c 0000 806e 	move.l #32878,88(sp)
    2d4c:	0058 
    2d4e:	703a           	moveq #58,d0
    2d50:	2f40 0054      	move.l d0,84(sp)
    2d54:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2d5a:	2c40           	movea.l d0,a6
    2d5c:	222f 005c      	move.l 92(sp),d1
    2d60:	242f 0058      	move.l 88(sp),d2
    2d64:	262f 0054      	move.l 84(sp),d3
    2d68:	4eae ffd0      	jsr -48(a6)
    2d6c:	2f40 0050      	move.l d0,80(sp)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
    2d70:	4eba d3d0      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2d74:	4eba d42a      	jsr 1a0 <SwapCl>(pc)
  UWORD *copword = ViewCopper;
    2d78:	2f79 0000 b7f4 	move.l b7f4 <ViewCopper>,76(sp)
    2d7e:	004c 
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2d80:	307c 0076      	movea.w #118,a0
    2d84:	d1ef 004c      	adda.l 76(sp),a0
    2d88:	3010           	move.w (a0),d0
    2d8a:	7200           	moveq #0,d1
    2d8c:	3200           	move.w d0,d1
    2d8e:	307c 0072      	movea.w #114,a0
    2d92:	d1ef 004c      	adda.l 76(sp),a0
    2d96:	3010           	move.w (a0),d0
    2d98:	3000           	move.w d0,d0
    2d9a:	0280 0000 ffff 	andi.l #65535,d0
    2da0:	4840           	swap d0
    2da2:	4240           	clr.w d0
    2da4:	d081           	add.l d1,d0
    2da6:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2daa:	2039 0000 b7dc 	move.l b7dc <Bitplane2>,d0
    2db0:	b0af 0048      	cmp.l 72(sp),d0
    2db4:	6742           	beq.s 2df8 <TestCopperList+0x566>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2db6:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2dbc:	2c40           	movea.l d0,a6
    2dbe:	4eae ffc4      	jsr -60(a6)
    2dc2:	2f40 0044      	move.l d0,68(sp)
    2dc6:	202f 0044      	move.l 68(sp),d0
    2dca:	2f40 0040      	move.l d0,64(sp)
    2dce:	2f7c 0000 80a9 	move.l #32937,60(sp)
    2dd4:	003c 
    2dd6:	7048           	moveq #72,d0
    2dd8:	2f40 0038      	move.l d0,56(sp)
    2ddc:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2de2:	2c40           	movea.l d0,a6
    2de4:	222f 0040      	move.l 64(sp),d1
    2de8:	242f 003c      	move.l 60(sp),d2
    2dec:	262f 0038      	move.l 56(sp),d3
    2df0:	4eae ffd0      	jsr -48(a6)
    2df4:	2f40 0034      	move.l d0,52(sp)
                                                   " after first frame.\n", 72);
  SetBplPointers();
    2df8:	4eba d348      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2dfc:	4eba d3a2      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2e00:	2f79 0000 b7f4 	move.l b7f4 <ViewCopper>,76(sp)
    2e06:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2e08:	307c 0076      	movea.w #118,a0
    2e0c:	d1ef 004c      	adda.l 76(sp),a0
    2e10:	3010           	move.w (a0),d0
    2e12:	7200           	moveq #0,d1
    2e14:	3200           	move.w d0,d1
    2e16:	307c 0072      	movea.w #114,a0
    2e1a:	d1ef 004c      	adda.l 76(sp),a0
    2e1e:	3010           	move.w (a0),d0
    2e20:	3000           	move.w d0,d0
    2e22:	0280 0000 ffff 	andi.l #65535,d0
    2e28:	4840           	swap d0
    2e2a:	4240           	clr.w d0
    2e2c:	d081           	add.l d1,d0
    2e2e:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane1) 
    2e32:	2039 0000 b7d8 	move.l b7d8 <Bitplane1>,d0
    2e38:	b0af 0048      	cmp.l 72(sp),d0
    2e3c:	6742           	beq.s 2e80 <TestCopperList+0x5ee>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
    2e3e:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2e44:	2c40           	movea.l d0,a6
    2e46:	4eae ffc4      	jsr -60(a6)
    2e4a:	2f40 0030      	move.l d0,48(sp)
    2e4e:	202f 0030      	move.l 48(sp),d0
    2e52:	2f40 002c      	move.l d0,44(sp)
    2e56:	2f7c 0000 80f2 	move.l #33010,40(sp)
    2e5c:	0028 
    2e5e:	7049           	moveq #73,d0
    2e60:	2f40 0024      	move.l d0,36(sp)
    2e64:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2e6a:	2c40           	movea.l d0,a6
    2e6c:	222f 002c      	move.l 44(sp),d1
    2e70:	242f 0028      	move.l 40(sp),d2
    2e74:	262f 0024      	move.l 36(sp),d3
    2e78:	4eae ffd0      	jsr -48(a6)
    2e7c:	2f40 0020      	move.l d0,32(sp)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
    2e80:	4eba d2c0      	jsr 142 <SetBplPointers>(pc)
  SwapCl();
    2e84:	4eba d31a      	jsr 1a0 <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    2e88:	2f79 0000 b7f4 	move.l b7f4 <ViewCopper>,76(sp)
    2e8e:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2e90:	307c 0076      	movea.w #118,a0
    2e94:	d1ef 004c      	adda.l 76(sp),a0
    2e98:	3010           	move.w (a0),d0
    2e9a:	7200           	moveq #0,d1
    2e9c:	3200           	move.w d0,d1
    2e9e:	307c 0072      	movea.w #114,a0
    2ea2:	d1ef 004c      	adda.l 76(sp),a0
    2ea6:	3010           	move.w (a0),d0
    2ea8:	3000           	move.w d0,d0
    2eaa:	0280 0000 ffff 	andi.l #65535,d0
    2eb0:	4840           	swap d0
    2eb2:	4240           	clr.w d0
    2eb4:	d081           	add.l d1,d0
    2eb6:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2eba:	2039 0000 b7dc 	move.l b7dc <Bitplane2>,d0
    2ec0:	b0af 0048      	cmp.l 72(sp),d0
    2ec4:	6742           	beq.s 2f08 <TestCopperList+0x676>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2ec6:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2ecc:	2c40           	movea.l d0,a6
    2ece:	4eae ffc4      	jsr -60(a6)
    2ed2:	2f40 001c      	move.l d0,28(sp)
    2ed6:	202f 001c      	move.l 28(sp),d0
    2eda:	2f40 0018      	move.l d0,24(sp)
    2ede:	2f7c 0000 813c 	move.l #33084,20(sp)
    2ee4:	0014 
    2ee6:	7048           	moveq #72,d0
    2ee8:	2f40 0010      	move.l d0,16(sp)
    2eec:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2ef2:	2c40           	movea.l d0,a6
    2ef4:	222f 0018      	move.l 24(sp),d1
    2ef8:	242f 0014      	move.l 20(sp),d2
    2efc:	262f 0010      	move.l 16(sp),d3
    2f00:	4eae ffd0      	jsr -48(a6)
    2f04:	2f40 000c      	move.l d0,12(sp)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
    2f08:	2f3c 0000 c800 	move.l #51200,-(sp)
    2f0e:	4878 0084      	pea 84 <_start+0x84>
    2f12:	4eba d1cc      	jsr e0 <FreeDisplay>(pc)
    2f16:	508f           	addq.l #8,sp
    2f18:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2f1c:	4fef 0148      	lea 328(sp),sp
    2f20:	4e75           	rts

00002f22 <RunTests>:
#include "runtests.h"
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    2f22:	4eba f96e      	jsr 2892 <TestCopperList>(pc)
    ZoomTest();
    2f26:	4eba 0004      	jsr 2f2c <ZoomTest>(pc)
    //SwScrollerTest();
    2f2a:	4e75           	rts

00002f2c <ZoomTest>:
#include "zoomtest2.h"

ULONG Cl102ZoomTest[137];

void ZoomTest() {
  TestZoomSpeed();
    2f2c:	4eba 0046      	jsr 2f74 <TestZoomSpeed>(pc)
  ZoomTestDisplay();
    2f30:	4eba 00e2      	jsr 3014 <ZoomTestDisplay>(pc)
  TestBlitleftOfZoom();
    2f34:	4eba 05a8      	jsr 34de <TestBlitleftOfZoom>(pc)
  TestCopyWord();
    2f38:	4eba 0838      	jsr 3772 <TestCopyWord>(pc)
  TestZoom4Picture();
    2f3c:	4eba 0e12      	jsr 3d50 <TestZoom4Picture>(pc)
  TestZoom4PictureOn5Planes();
    2f40:	4eba 0b22      	jsr 3a64 <TestZoom4PictureOn5Planes>(pc)
  Test_Zoom2();
    2f44:	4eba f012      	jsr 1f58 <Test_Zoom2>(pc)
  c2p1x1_8_c5_gen_init( 320, 256, 0, 0, 0, 0);
    2f48:	42a7           	clr.l -(sp)
    2f4a:	42a7           	clr.l -(sp)
    2f4c:	42a7           	clr.l -(sp)
    2f4e:	42a7           	clr.l -(sp)
    2f50:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2f54:	4878 0140      	pea 140 <FreeDisplay+0x60>
    2f58:	4eb9 0000 7284 	jsr 7284 <c2p1x1_8_c5_gen_init>
    2f5e:	4fef 0018      	lea 24(sp),sp
  c2p1x1_8_c5_gen( 0x100, 0x200);
    2f62:	4878 0200      	pea 200 <Utils_FillLong+0x8>
    2f66:	4878 0100      	pea 100 <FreeDisplay+0x20>
    2f6a:	4eb9 0000 7300 	jsr 7300 <c2p1x1_8_c5_gen>
    2f70:	508f           	addq.l #8,sp
}
    2f72:	4e75           	rts

00002f74 <TestZoomSpeed>:

int Counter4Frames;

void TestZoomSpeed() {
    2f74:	4fef ffe8      	lea -24(sp),sp
    2f78:	48e7 3002      	movem.l d2-d3/a6,-(sp)

 	TakeSystem();
    2f7c:	4eba d5d8      	jsr 556 <TakeSystem>(pc)
	WaitVbl();
    2f80:	4eba d58a      	jsr 50c <WaitVbl>(pc)
  //             fedcba9876543210
  //hw->dmacon = 0x8def;

  hw->dmacon = DMAF_SETCLR | DMAF_AUDIO | DMAF_BLITTER | DMAF_RASTER 
    2f84:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    2f8a:	317c 87cf 0096 	move.w #-30769,150(a0)
                                    | DMAF_COPPER | DMAF_MASTER | DMAF_BLITHOG;
   //0b1000011111100000;
  
  //hw->dmacon = 0b1000011111111111;
	hw->intena = (1 << INTB_SETCLR) | (1 << INTB_INTEN) | (1 << INTB_VERTB);
    2f90:	2079 0000 b7f8 	movea.l b7f8 <hw>,a0
    2f96:	317c c020 009a 	move.w #-16352,154(a0)
  
  Zoom_InitRun(); 
    2f9c:	4eba e114      	jsr 10b2 <Zoom_InitRun>(pc)

  int success = 1;
    2fa0:	7001           	moveq #1,d0
    2fa2:	2f40 0020      	move.l d0,32(sp)
  RunFrame();
    2fa6:	4eba d330      	jsr 2d8 <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    2faa:	3039 0000 b838 	move.w b838 <Zoom_Counter>,d0
    2fb0:	0c40 0008      	cmpi.w #8,d0
    2fb4:	6304           	bls.s 2fba <TestZoomSpeed+0x46>
    2fb6:	42af 0020      	clr.l 32(sp)
    
  Zoom_Dealloc();
    2fba:	4eba e3d0      	jsr 138c <Zoom_Dealloc>(pc)
  FreeSystem();
    2fbe:	4eba d5ac      	jsr 56c <FreeSystem>(pc)

  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    2fc2:	4aaf 0020      	tst.l 32(sp)
    2fc6:	6642           	bne.s 300a <TestZoomSpeed+0x96>
    2fc8:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2fce:	2c40           	movea.l d0,a6
    2fd0:	4eae ffc4      	jsr -60(a6)
    2fd4:	2f40 001c      	move.l d0,28(sp)
    2fd8:	202f 001c      	move.l 28(sp),d0
    2fdc:	2f40 0018      	move.l d0,24(sp)
    2fe0:	2f7c 0000 8185 	move.l #33157,20(sp)
    2fe6:	0014 
    2fe8:	701c           	moveq #28,d0
    2fea:	2f40 0010      	move.l d0,16(sp)
    2fee:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    2ff4:	2c40           	movea.l d0,a6
    2ff6:	222f 0018      	move.l 24(sp),d1
    2ffa:	242f 0014      	move.l 20(sp),d2
    2ffe:	262f 0010      	move.l 16(sp),d3
    3002:	4eae ffd0      	jsr -48(a6)
    3006:	2f40 000c      	move.l d0,12(sp)

  //AddIntServer(INTB_VERTB, vbint);
  //RemIntServer(INTB_VERTB, vbint);
  
}
    300a:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    300e:	4fef 0018      	lea 24(sp),sp
    3012:	4e75           	rts

00003014 <ZoomTestDisplay>:

void ZoomTestDisplay() {
    3014:	4fef ff38      	lea -200(sp),sp
    3018:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Zoom_Init();
    301c:	4eba e47e      	jsr 149c <Zoom_Init>(pc)
  PrepareDisplayZoom();
    3020:	4eba e814      	jsr 1836 <PrepareDisplayZoom>(pc)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    3024:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    302a:	4878 0010      	pea 10 <_start+0x10>
    302e:	4879 0000 a080 	pea a080 <ClsSprites>
    3034:	42a7           	clr.l -(sp)
    3036:	2f00           	move.l d0,-(sp)
    3038:	4eba f7fc      	jsr 2836 <TestCopperlistBatch>(pc)
    303c:	4fef 0010      	lea 16(sp),sp
    3040:	4a80           	tst.l d0
    3042:	6642           	bne.s 3086 <ZoomTestDisplay+0x72>
    Write( Output(), 
    3044:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    304a:	2c40           	movea.l d0,a6
    304c:	4eae ffc4      	jsr -60(a6)
    3050:	2f40 00d0      	move.l d0,208(sp)
    3054:	202f 00d0      	move.l 208(sp),d0
    3058:	2f40 00cc      	move.l d0,204(sp)
    305c:	2f7c 0000 81a4 	move.l #33188,200(sp)
    3062:	00c8 
    3064:	7045           	moveq #69,d0
    3066:	2f40 00c4      	move.l d0,196(sp)
    306a:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3070:	2c40           	movea.l d0,a6
    3072:	222f 00cc      	move.l 204(sp),d1
    3076:	242f 00c8      	move.l 200(sp),d2
    307a:	262f 00c4      	move.l 196(sp),d3
    307e:	4eae ffd0      	jsr -48(a6)
    3082:	2f40 00c0      	move.l d0,192(sp)
       "ZoomCopperlist: Sprite section of copper starting on pos 0 messed up\n", 
                                                                            69);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    3086:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    308c:	4878 000c      	pea c <_start+0xc>
    3090:	4879 0000 a0c0 	pea a0c0 <ClScreen>
    3096:	4878 0010      	pea 10 <_start+0x10>
    309a:	2f00           	move.l d0,-(sp)
    309c:	4eba f798      	jsr 2836 <TestCopperlistBatch>(pc)
    30a0:	4fef 0010      	lea 16(sp),sp
    30a4:	4a80           	tst.l d0
    30a6:	6642           	bne.s 30ea <ZoomTestDisplay+0xd6>
    Write( Output(), 
    30a8:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    30ae:	2c40           	movea.l d0,a6
    30b0:	4eae ffc4      	jsr -60(a6)
    30b4:	2f40 00bc      	move.l d0,188(sp)
    30b8:	202f 00bc      	move.l 188(sp),d0
    30bc:	2f40 00b8      	move.l d0,184(sp)
    30c0:	2f7c 0000 81ea 	move.l #33258,180(sp)
    30c6:	00b4 
    30c8:	7046           	moveq #70,d0
    30ca:	2f40 00b0      	move.l d0,176(sp)
    30ce:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    30d4:	2c40           	movea.l d0,a6
    30d6:	222f 00b8      	move.l 184(sp),d1
    30da:	242f 00b4      	move.l 180(sp),d2
    30de:	262f 00b0      	move.l 176(sp),d3
    30e2:	4eae ffd0      	jsr -48(a6)
    30e6:	2f40 00ac      	move.l d0,172(sp)
      "ZoomCopperlist: Screen section of copper starting on pos 16 messed up\n",
                                                                            70);
  DrawBuffer = (ULONG *) 0x40000;
    30ea:	23fc 0004 0000 	move.l #262144,b7e8 <DrawBuffer>
    30f0:	0000 b7e8 
  ViewBuffer = (ULONG *) 0x50000;
    30f4:	23fc 0005 0000 	move.l #327680,b7ec <ViewBuffer>
    30fa:	0000 b7ec 
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    30fe:	2239 0000 b7f0 	move.l b7f0 <DrawCopper>,d1
    3104:	2039 0000 b7e8 	move.l b7e8 <DrawBuffer>,d0
    310a:	2f01           	move.l d1,-(sp)
    310c:	2f00           	move.l d0,-(sp)
    310e:	4eba ed80      	jsr 1e90 <Zoom_SetBplPointers>(pc)
    3112:	508f           	addq.l #8,sp
  Zoom_SwapBuffers( 0);
    3114:	42a7           	clr.l -(sp)
    3116:	4eba ee10      	jsr 1f28 <Zoom_SwapBuffers>(pc)
    311a:	588f           	addq.l #4,sp
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    311c:	2039 0000 b7e8 	move.l b7e8 <DrawBuffer>,d0
    3122:	0c80 0005 0000 	cmpi.l #327680,d0
    3128:	660e           	bne.s 3138 <ZoomTestDisplay+0x124>
    312a:	2039 0000 b7ec 	move.l b7ec <ViewBuffer>,d0
    3130:	0c80 0004 0000 	cmpi.l #262144,d0
    3136:	6742           	beq.s 317a <ZoomTestDisplay+0x166>
    Write( Output(), 
    3138:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    313e:	2c40           	movea.l d0,a6
    3140:	4eae ffc4      	jsr -60(a6)
    3144:	2f40 00a8      	move.l d0,168(sp)
    3148:	202f 00a8      	move.l 168(sp),d0
    314c:	2f40 00a4      	move.l d0,164(sp)
    3150:	2f7c 0000 8231 	move.l #33329,160(sp)
    3156:	00a0 
    3158:	703b           	moveq #59,d0
    315a:	2f40 009c      	move.l d0,156(sp)
    315e:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3164:	2c40           	movea.l d0,a6
    3166:	222f 00a4      	move.l 164(sp),d1
    316a:	242f 00a0      	move.l 160(sp),d2
    316e:	262f 009c      	move.l 156(sp),d3
    3172:	4eae ffd0      	jsr -48(a6)
    3176:	2f40 0098      	move.l d0,152(sp)
            "ZoomCopperlist: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    317a:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    3180:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    3186:	4878 001c      	pea 1c <_start+0x1c>
    318a:	2f00           	move.l d0,-(sp)
    318c:	4eba f6e6      	jsr 2874 <TestCopperlistPos>(pc)
    3190:	4fef 000c      	lea 12(sp),sp
    3194:	4a80           	tst.l d0
    3196:	6642           	bne.s 31da <ZoomTestDisplay+0x1c6>
    Write(Output(), 
    3198:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    319e:	2c40           	movea.l d0,a6
    31a0:	4eae ffc4      	jsr -60(a6)
    31a4:	2f40 0094      	move.l d0,148(sp)
    31a8:	202f 0094      	move.l 148(sp),d0
    31ac:	2f40 0090      	move.l d0,144(sp)
    31b0:	2f7c 0000 826d 	move.l #33389,140(sp)
    31b6:	008c 
    31b8:	703c           	moveq #60,d0
    31ba:	2f40 0088      	move.l d0,136(sp)
    31be:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    31c4:	2c40           	movea.l d0,a6
    31c6:	222f 0090      	move.l 144(sp),d1
    31ca:	242f 008c      	move.l 140(sp),d2
    31ce:	262f 0088      	move.l 136(sp),d3
    31d2:	4eae ffd0      	jsr -48(a6)
    31d6:	2f40 0084      	move.l d0,132(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    31da:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    31e0:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    31e6:	4878 001d      	pea 1d <_start+0x1d>
    31ea:	2f00           	move.l d0,-(sp)
    31ec:	4eba f686      	jsr 2874 <TestCopperlistPos>(pc)
    31f0:	4fef 000c      	lea 12(sp),sp
    31f4:	4a80           	tst.l d0
    31f6:	6642           	bne.s 323a <ZoomTestDisplay+0x226>
    Write(Output(), 
    31f8:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    31fe:	2c40           	movea.l d0,a6
    3200:	4eae ffc4      	jsr -60(a6)
    3204:	2f40 0080      	move.l d0,128(sp)
    3208:	202f 0080      	move.l 128(sp),d0
    320c:	2f40 007c      	move.l d0,124(sp)
    3210:	2f7c 0000 82aa 	move.l #33450,120(sp)
    3216:	0078 
    3218:	703c           	moveq #60,d0
    321a:	2f40 0074      	move.l d0,116(sp)
    321e:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3224:	2c40           	movea.l d0,a6
    3226:	222f 007c      	move.l 124(sp),d1
    322a:	242f 0078      	move.l 120(sp),d2
    322e:	262f 0074      	move.l 116(sp),d3
    3232:	4eae ffd0      	jsr -48(a6)
    3236:	2f40 0070      	move.l d0,112(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1pl should be 00f4\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    323a:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    3240:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    3246:	4878 001e      	pea 1e <_start+0x1e>
    324a:	2f00           	move.l d0,-(sp)
    324c:	4eba f626      	jsr 2874 <TestCopperlistPos>(pc)
    3250:	4fef 000c      	lea 12(sp),sp
    3254:	4a80           	tst.l d0
    3256:	6642           	bne.s 329a <ZoomTestDisplay+0x286>
    Write(Output(), 
    3258:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    325e:	2c40           	movea.l d0,a6
    3260:	4eae ffc4      	jsr -60(a6)
    3264:	2f40 006c      	move.l d0,108(sp)
    3268:	202f 006c      	move.l 108(sp),d0
    326c:	2f40 0068      	move.l d0,104(sp)
    3270:	2f7c 0000 82e7 	move.l #33511,100(sp)
    3276:	0064 
    3278:	703c           	moveq #60,d0
    327a:	2f40 0060      	move.l d0,96(sp)
    327e:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3284:	2c40           	movea.l d0,a6
    3286:	222f 0068      	move.l 104(sp),d1
    328a:	242f 0064      	move.l 100(sp),d2
    328e:	262f 0060      	move.l 96(sp),d3
    3292:	4eae ffd0      	jsr -48(a6)
    3296:	2f40 005c      	move.l d0,92(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    329a:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    32a0:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    32a6:	4878 001f      	pea 1f <_start+0x1f>
    32aa:	2f00           	move.l d0,-(sp)
    32ac:	4eba f5c6      	jsr 2874 <TestCopperlistPos>(pc)
    32b0:	4fef 000c      	lea 12(sp),sp
    32b4:	4a80           	tst.l d0
    32b6:	6642           	bne.s 32fa <ZoomTestDisplay+0x2e6>
    Write(Output(), 
    32b8:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    32be:	2c40           	movea.l d0,a6
    32c0:	4eae ffc4      	jsr -60(a6)
    32c4:	2f40 0058      	move.l d0,88(sp)
    32c8:	202f 0058      	move.l 88(sp),d0
    32cc:	2f40 0054      	move.l d0,84(sp)
    32d0:	2f7c 0000 8324 	move.l #33572,80(sp)
    32d6:	0050 
    32d8:	703c           	moveq #60,d0
    32da:	2f40 004c      	move.l d0,76(sp)
    32de:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    32e4:	2c40           	movea.l d0,a6
    32e6:	222f 0054      	move.l 84(sp),d1
    32ea:	242f 0050      	move.l 80(sp),d2
    32ee:	262f 004c      	move.l 76(sp),d3
    32f2:	4eae ffd0      	jsr -48(a6)
    32f6:	2f40 0048      	move.l d0,72(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2pl should be 0034\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    32fa:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    3300:	4878 0020      	pea 20 <_start+0x20>
    3304:	4879 0000 a000 	pea a000 <ClColor>
    330a:	4878 0026      	pea 26 <_start+0x26>
    330e:	2f00           	move.l d0,-(sp)
    3310:	4eba f524      	jsr 2836 <TestCopperlistBatch>(pc)
    3314:	4fef 0010      	lea 16(sp),sp
    3318:	4a80           	tst.l d0
    331a:	6642           	bne.s 335e <ZoomTestDisplay+0x34a>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    331c:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3322:	2c40           	movea.l d0,a6
    3324:	4eae ffc4      	jsr -60(a6)
    3328:	2f40 0044      	move.l d0,68(sp)
    332c:	202f 0044      	move.l 68(sp),d0
    3330:	2f40 0040      	move.l d0,64(sp)
    3334:	2f7c 0000 8361 	move.l #33633,60(sp)
    333a:	003c 
    333c:	7025           	moveq #37,d0
    333e:	2f40 0038      	move.l d0,56(sp)
    3342:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3348:	2c40           	movea.l d0,a6
    334a:	222f 0040      	move.l 64(sp),d1
    334e:	242f 003c      	move.l 60(sp),d2
    3352:	262f 0038      	move.l 56(sp),d3
    3356:	4eae ffd0      	jsr -48(a6)
    335a:	2f40 0034      	move.l d0,52(sp)

  /*if(  TestCopperlistBatch(  Copperlist1, 71, Cl102ZoomRepeat, 21) == 0)
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36); */
  
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    335e:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    3364:	2f00           	move.l d0,-(sp)
    3366:	4878 000f      	pea f <_start+0xf>
    336a:	4eba d07c      	jsr 3e8 <Zoom_Shrink102>(pc)
    336e:	508f           	addq.l #8,sp
  if( TestCopperListZoom102( Copperlist1, 73, Cl102ZoomTest) == 0)
    3370:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    3376:	4879 0000 b29c 	pea b29c <Cl102ZoomTest>
    337c:	4878 0049      	pea 49 <_start+0x49>
    3380:	2f00           	move.l d0,-(sp)
    3382:	4eba 00c4      	jsr 3448 <TestCopperListZoom102>(pc)
    3386:	4fef 000c      	lea 12(sp),sp
    338a:	4a80           	tst.l d0
    338c:	6642           	bne.s 33d0 <ZoomTestDisplay+0x3bc>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    338e:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3394:	2c40           	movea.l d0,a6
    3396:	4eae ffc4      	jsr -60(a6)
    339a:	2f40 0030      	move.l d0,48(sp)
    339e:	202f 0030      	move.l 48(sp),d0
    33a2:	2f40 002c      	move.l d0,44(sp)
    33a6:	2f7c 0000 8387 	move.l #33671,40(sp)
    33ac:	0028 
    33ae:	7025           	moveq #37,d0
    33b0:	2f40 0024      	move.l d0,36(sp)
    33b4:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    33ba:	2c40           	movea.l d0,a6
    33bc:	222f 002c      	move.l 44(sp),d1
    33c0:	242f 0028      	move.l 40(sp),d2
    33c4:	262f 0024      	move.l 36(sp),d3
    33c8:	4eae ffd0      	jsr -48(a6)
    33cc:	2f40 0020      	move.l d0,32(sp)

  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    33d0:	2039 0000 b7e0 	move.l b7e0 <Copperlist1>,d0
    33d6:	4878 fffe      	pea fffffffe <gcc8_c_support.c.f93356b9+0xfffe099d>
    33da:	4878 00bb      	pea bb <WaitBlt+0x7>
    33de:	2f00           	move.l d0,-(sp)
    33e0:	4eba f492      	jsr 2874 <TestCopperlistPos>(pc)
    33e4:	4fef 000c      	lea 12(sp),sp
    33e8:	4a80           	tst.l d0
    33ea:	6642           	bne.s 342e <ZoomTestDisplay+0x41a>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    33ec:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    33f2:	2c40           	movea.l d0,a6
    33f4:	4eae ffc4      	jsr -60(a6)
    33f8:	2f40 001c      	move.l d0,28(sp)
    33fc:	202f 001c      	move.l 28(sp),d0
    3400:	2f40 0018      	move.l d0,24(sp)
    3404:	2f7c 0000 83ac 	move.l #33708,20(sp)
    340a:	0014 
    340c:	7032           	moveq #50,d0
    340e:	2f40 0010      	move.l d0,16(sp)
    3412:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3418:	2c40           	movea.l d0,a6
    341a:	222f 0018      	move.l 24(sp),d1
    341e:	242f 0014      	move.l 20(sp),d2
    3422:	262f 0010      	move.l 16(sp),d3
    3426:	4eae ffd0      	jsr -48(a6)
    342a:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    342e:	2f3c 0000 df20 	move.l #57120,-(sp)
    3434:	4878 031c      	pea 31c <Zoom_InsertShift+0x42>
    3438:	4eba cca6      	jsr e0 <FreeDisplay>(pc)
    343c:	508f           	addq.l #8,sp

}
    343e:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3442:	4fef 00c8      	lea 200(sp),sp
    3446:	4e75           	rts

00003448 <TestCopperListZoom102>:

int TestCopperListZoom102( ULONG *cl2test, UWORD position, 
                                                           ULONG *template4cl) {
    3448:	598f           	subq.l #4,sp
    344a:	202f 000c      	move.l 12(sp),d0
    344e:	3000           	move.w d0,d0
    3450:	3f40 0002      	move.w d0,2(sp)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    3454:	7000           	moveq #0,d0
    3456:	302f 0002      	move.w 2(sp),d0
    345a:	4878 001c      	pea 1c <_start+0x1c>
    345e:	2f2f 0014      	move.l 20(sp),-(sp)
    3462:	2f00           	move.l d0,-(sp)
    3464:	2f2f 0014      	move.l 20(sp),-(sp)
    3468:	4eba f3cc      	jsr 2836 <TestCopperlistBatch>(pc)
    346c:	4fef 0010      	lea 16(sp),sp
    3470:	4a80           	tst.l d0
    3472:	6604           	bne.s 3478 <TestCopperListZoom102+0x30>
    return 0;
    3474:	7000           	moveq #0,d0
    3476:	6062           	bra.s 34da <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    3478:	7078           	moveq #120,d0
    347a:	d0af 0010      	add.l 16(sp),d0
    347e:	7200           	moveq #0,d1
    3480:	322f 0002      	move.w 2(sp),d1
    3484:	307c 001e      	movea.w #30,a0
    3488:	d1c1           	adda.l d1,a0
    348a:	4878 0036      	pea 36 <_start+0x36>
    348e:	2f00           	move.l d0,-(sp)
    3490:	2f08           	move.l a0,-(sp)
    3492:	2f2f 0014      	move.l 20(sp),-(sp)
    3496:	4eba f39e      	jsr 2836 <TestCopperlistBatch>(pc)
    349a:	4fef 0010      	lea 16(sp),sp
    349e:	4a80           	tst.l d0
    34a0:	6604           	bne.s 34a6 <TestCopperListZoom102+0x5e>
    return 0;
    34a2:	7000           	moveq #0,d0
    34a4:	6034           	bra.s 34da <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    34a6:	202f 0010      	move.l 16(sp),d0
    34aa:	0680 0000 0158 	addi.l #344,d0
    34b0:	7200           	moveq #0,d1
    34b2:	322f 0002      	move.w 2(sp),d1
    34b6:	307c 0056      	movea.w #86,a0
    34ba:	d1c1           	adda.l d1,a0
    34bc:	4878 001c      	pea 1c <_start+0x1c>
    34c0:	2f00           	move.l d0,-(sp)
    34c2:	2f08           	move.l a0,-(sp)
    34c4:	2f2f 0014      	move.l 20(sp),-(sp)
    34c8:	4eba f36c      	jsr 2836 <TestCopperlistBatch>(pc)
    34cc:	4fef 0010      	lea 16(sp),sp
    34d0:	4a80           	tst.l d0
    34d2:	6604           	bne.s 34d8 <TestCopperListZoom102+0x90>
    return 0;
    34d4:	7000           	moveq #0,d0
    34d6:	6002           	bra.s 34da <TestCopperListZoom102+0x92>
 
  return 1;
    34d8:	7001           	moveq #1,d0
}
    34da:	588f           	addq.l #4,sp
    34dc:	4e75           	rts

000034de <TestBlitleftOfZoom>:

void TestBlitleftOfZoom() {
    34de:	4fef ff94      	lea -108(sp),sp
    34e2:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Zoom_Init();
    34e6:	4eba dfb4      	jsr 149c <Zoom_Init>(pc)
  PrepareDisplayZoom();
    34ea:	4eba e34a      	jsr 1836 <PrepareDisplayZoom>(pc)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    34ee:	2f7c 0000 c800 	move.l #51200,116(sp)
    34f4:	0074 
    34f6:	7002           	moveq #2,d0
    34f8:	2f40 0070      	move.l d0,112(sp)
    34fc:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    3502:	2c40           	movea.l d0,a6
    3504:	202f 0074      	move.l 116(sp),d0
    3508:	222f 0070      	move.l 112(sp),d1
    350c:	4eae ff3a      	jsr -198(a6)
    3510:	2f40 006c      	move.l d0,108(sp)
    3514:	202f 006c      	move.l 108(sp),d0
    3518:	23c0 0000 b82a 	move.l d0,b82a <Zoom_Source>
  if( Zoom_Source == 0) {
    351e:	2039 0000 b82a 	move.l b82a <Zoom_Source>,d0
    3524:	6646           	bne.s 356c <TestBlitleftOfZoom+0x8e>
    Write(  Output(), 
    3526:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    352c:	2c40           	movea.l d0,a6
    352e:	4eae ffc4      	jsr -60(a6)
    3532:	2f40 001c      	move.l d0,28(sp)
    3536:	202f 001c      	move.l 28(sp),d0
    353a:	2f40 0018      	move.l d0,24(sp)
    353e:	2f7c 0000 83df 	move.l #33759,20(sp)
    3544:	0014 
    3546:	7236           	moveq #54,d1
    3548:	2f41 0010      	move.l d1,16(sp)
    354c:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3552:	2c40           	movea.l d0,a6
    3554:	222f 0018      	move.l 24(sp),d1
    3558:	242f 0014      	move.l 20(sp),d2
    355c:	262f 0010      	move.l 16(sp),d3
    3560:	4eae ffd0      	jsr -48(a6)
    3564:	2f40 000c      	move.l d0,12(sp)
    3568:	6000 01fe      	bra.w 3768 <TestBlitleftOfZoom+0x28a>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  
  UWORD *tstsource = Zoom_Source;
    356c:	2f79 0000 b82a 	move.l b82a <Zoom_Source>,104(sp)
    3572:	0068 
  *tstsource++ = 0x0000;
    3574:	202f 0068      	move.l 104(sp),d0
    3578:	2200           	move.l d0,d1
    357a:	5481           	addq.l #2,d1
    357c:	2f41 0068      	move.l d1,104(sp)
    3580:	2040           	movea.l d0,a0
    3582:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    3584:	206f 0068      	movea.l 104(sp),a0
    3588:	30bc 0080      	move.w #128,(a0)
  tstsource += ZMLINESIZE/2-1;
    358c:	7028           	moveq #40,d0
    358e:	d1af 0068      	add.l d0,104(sp)
  *tstsource = 0x1000;
    3592:	206f 0068      	movea.l 104(sp),a0
    3596:	30bc 1000      	move.w #4096,(a0)
  tstsource++;
    359a:	54af 0068      	addq.l #2,104(sp)
  *tstsource = 0x8e88;
    359e:	206f 0068      	movea.l 104(sp),a0
    35a2:	30bc 8e88      	move.w #-29048,(a0)
  tstsource += ZMLINESIZE/2-1;
    35a6:	7228           	moveq #40,d1
    35a8:	d3af 0068      	add.l d1,104(sp)

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
    35ac:	2039 0000 b82a 	move.l b82a <Zoom_Source>,d0
    35b2:	2200           	move.l d0,d1
    35b4:	0681 0000 14d6 	addi.l #5334,d1
    35ba:	2f41 0068      	move.l d1,104(sp)
  *tstsource++ = 0x0000;
    35be:	202f 0068      	move.l 104(sp),d0
    35c2:	2200           	move.l d0,d1
    35c4:	5481           	addq.l #2,d1
    35c6:	2f41 0068      	move.l d1,104(sp)
    35ca:	2040           	movea.l d0,a0
    35cc:	4250           	clr.w (a0)
  *tstsource = 0x00ff;
    35ce:	206f 0068      	movea.l 104(sp),a0
    35d2:	30bc 00ff      	move.w #255,(a0)
  WaitBlit();
    35d6:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    35dc:	2c40           	movea.l d0,a6
    35de:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    35e2:	4eba e3ca      	jsr 19ae <Init_Blit>(pc)
  Init_ZoomBlit( 7, 16, 0);
    35e6:	42a7           	clr.l -(sp)
    35e8:	4878 0010      	pea 10 <_start+0x10>
    35ec:	4878 0007      	pea 7 <_start+0x7>
    35f0:	4eba e438      	jsr 1a2a <Init_ZoomBlit>(pc)
    35f4:	4fef 000c      	lea 12(sp),sp
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    35f8:	2239 0000 b7e8 	move.l b7e8 <DrawBuffer>,d1
    35fe:	2039 0000 b82a 	move.l b82a <Zoom_Source>,d0
    3604:	4878 0080      	pea 80 <_start+0x80>
    3608:	2f01           	move.l d1,-(sp)
    360a:	2f00           	move.l d0,-(sp)
    360c:	4eba d9c2      	jsr fd0 <Zoom_ZoomBlit>(pc)
    3610:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    3614:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    361a:	2c40           	movea.l d0,a6
    361c:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    3620:	2039 0000 b7e8 	move.l b7e8 <DrawBuffer>,d0
    3626:	2200           	move.l d0,d1
    3628:	5481           	addq.l #2,d1
    362a:	2f41 0064      	move.l d1,100(sp)
  if( *destination != 0x0180) {
    362e:	206f 0064      	movea.l 100(sp),a0
    3632:	3010           	move.w (a0),d0
    3634:	0c40 0180      	cmpi.w #384,d0
    3638:	6742           	beq.s 367c <TestBlitleftOfZoom+0x19e>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    363a:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3640:	2c40           	movea.l d0,a6
    3642:	4eae ffc4      	jsr -60(a6)
    3646:	2f40 0060      	move.l d0,96(sp)
    364a:	202f 0060      	move.l 96(sp),d0
    364e:	2f40 005c      	move.l d0,92(sp)
    3652:	2f7c 0000 8417 	move.l #33815,88(sp)
    3658:	0058 
    365a:	701c           	moveq #28,d0
    365c:	2f40 0054      	move.l d0,84(sp)
    3660:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3666:	2c40           	movea.l d0,a6
    3668:	222f 005c      	move.l 92(sp),d1
    366c:	242f 0058      	move.l 88(sp),d2
    3670:	262f 0054      	move.l 84(sp),d3
    3674:	4eae ffd0      	jsr -48(a6)
    3678:	2f40 0050      	move.l d0,80(sp)
  }
  destination += ZMLINESIZE/2;
    367c:	722a           	moveq #42,d1
    367e:	d3af 0064      	add.l d1,100(sp)
  if( *destination != 0x1d88)
    3682:	206f 0064      	movea.l 100(sp),a0
    3686:	3010           	move.w (a0),d0
    3688:	0c40 1d88      	cmpi.w #7560,d0
    368c:	6742           	beq.s 36d0 <TestBlitleftOfZoom+0x1f2>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    368e:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3694:	2c40           	movea.l d0,a6
    3696:	4eae ffc4      	jsr -60(a6)
    369a:	2f40 004c      	move.l d0,76(sp)
    369e:	202f 004c      	move.l 76(sp),d0
    36a2:	2f40 0048      	move.l d0,72(sp)
    36a6:	2f7c 0000 8434 	move.l #33844,68(sp)
    36ac:	0044 
    36ae:	701c           	moveq #28,d0
    36b0:	2f40 0040      	move.l d0,64(sp)
    36b4:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    36ba:	2c40           	movea.l d0,a6
    36bc:	222f 0048      	move.l 72(sp),d1
    36c0:	242f 0044      	move.l 68(sp),d2
    36c4:	262f 0040      	move.l 64(sp),d3
    36c8:	4eae ffd0      	jsr -48(a6)
    36cc:	2f40 003c      	move.l d0,60(sp)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
    36d0:	2039 0000 b7e8 	move.l b7e8 <DrawBuffer>,d0
    36d6:	2200           	move.l d0,d1
    36d8:	0681 0000 14d6 	addi.l #5334,d1
    36de:	2f41 0064      	move.l d1,100(sp)
  destination++;
    36e2:	54af 0064      	addq.l #2,100(sp)
  if( *destination != 0x01ff) {
    36e6:	206f 0064      	movea.l 100(sp),a0
    36ea:	3010           	move.w (a0),d0
    36ec:	0c40 01ff      	cmpi.w #511,d0
    36f0:	6742           	beq.s 3734 <TestBlitleftOfZoom+0x256>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    36f2:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    36f8:	2c40           	movea.l d0,a6
    36fa:	4eae ffc4      	jsr -60(a6)
    36fe:	2f40 0038      	move.l d0,56(sp)
    3702:	202f 0038      	move.l 56(sp),d0
    3706:	2f40 0034      	move.l d0,52(sp)
    370a:	2f7c 0000 8451 	move.l #33873,48(sp)
    3710:	0030 
    3712:	701a           	moveq #26,d0
    3714:	2f40 002c      	move.l d0,44(sp)
    3718:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    371e:	2c40           	movea.l d0,a6
    3720:	222f 0034      	move.l 52(sp),d1
    3724:	242f 0030      	move.l 48(sp),d2
    3728:	262f 002c      	move.l 44(sp),d3
    372c:	4eae ffd0      	jsr -48(a6)
    3730:	2f40 0028      	move.l d0,40(sp)
  }
  FreeMem( Zoom_Source, 40*256*5);
    3734:	2f79 0000 b82a 	move.l b82a <Zoom_Source>,36(sp)
    373a:	0024 
    373c:	2f7c 0000 c800 	move.l #51200,32(sp)
    3742:	0020 
    3744:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    374a:	2c40           	movea.l d0,a6
    374c:	226f 0024      	movea.l 36(sp),a1
    3750:	202f 0020      	move.l 32(sp),d0
    3754:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    3758:	2f3c 0000 df20 	move.l #57120,-(sp)
    375e:	4878 031c      	pea 31c <Zoom_InsertShift+0x42>
    3762:	4eba c97c      	jsr e0 <FreeDisplay>(pc)
    3766:	508f           	addq.l #8,sp
}
    3768:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    376c:	4fef 006c      	lea 108(sp),sp
    3770:	4e75           	rts

00003772 <TestCopyWord>:

void TestCopyWord() {
    3772:	4fef ff74      	lea -140(sp),sp
    3776:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    377a:	2f7c 0000 04ec 	move.l #1260,136(sp)
    3780:	0088 
    3782:	7002           	moveq #2,d0
    3784:	2f40 0084      	move.l d0,132(sp)
    3788:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    378e:	2c40           	movea.l d0,a6
    3790:	202f 0088      	move.l 136(sp),d0
    3794:	222f 0084      	move.l 132(sp),d1
    3798:	4eae ff3a      	jsr -198(a6)
    379c:	2f40 0080      	move.l d0,128(sp)
    37a0:	202f 0080      	move.l 128(sp),d0
    37a4:	2f40 007c      	move.l d0,124(sp)
  if( source == 0) {
    37a8:	6646           	bne.s 37f0 <TestCopyWord+0x7e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    37aa:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    37b0:	2c40           	movea.l d0,a6
    37b2:	4eae ffc4      	jsr -60(a6)
    37b6:	2f40 001c      	move.l d0,28(sp)
    37ba:	202f 001c      	move.l 28(sp),d0
    37be:	2f40 0018      	move.l d0,24(sp)
    37c2:	2f7c 0000 846c 	move.l #33900,20(sp)
    37c8:	0014 
    37ca:	7235           	moveq #53,d1
    37cc:	2f41 0010      	move.l d1,16(sp)
    37d0:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    37d6:	2c40           	movea.l d0,a6
    37d8:	222f 0018      	move.l 24(sp),d1
    37dc:	242f 0014      	move.l 20(sp),d2
    37e0:	262f 0010      	move.l 16(sp),d3
    37e4:	4eae ffd0      	jsr -48(a6)
    37e8:	2f40 000c      	move.l d0,12(sp)
    37ec:	6000 026c      	bra.w 3a5a <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    37f0:	2f7c 0000 04ec 	move.l #1260,120(sp)
    37f6:	0078 
    37f8:	7002           	moveq #2,d0
    37fa:	2f40 0074      	move.l d0,116(sp)
    37fe:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    3804:	2c40           	movea.l d0,a6
    3806:	202f 0078      	move.l 120(sp),d0
    380a:	222f 0074      	move.l 116(sp),d1
    380e:	4eae ff3a      	jsr -198(a6)
    3812:	2f40 0070      	move.l d0,112(sp)
    3816:	202f 0070      	move.l 112(sp),d0
    381a:	2f40 006c      	move.l d0,108(sp)
  if( destination == 0) {
    381e:	6646           	bne.s 3866 <TestCopyWord+0xf4>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3820:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3826:	2c40           	movea.l d0,a6
    3828:	4eae ffc4      	jsr -60(a6)
    382c:	2f40 0030      	move.l d0,48(sp)
    3830:	202f 0030      	move.l 48(sp),d0
    3834:	2f40 002c      	move.l d0,44(sp)
    3838:	2f7c 0000 846c 	move.l #33900,40(sp)
    383e:	0028 
    3840:	7235           	moveq #53,d1
    3842:	2f41 0024      	move.l d1,36(sp)
    3846:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    384c:	2c40           	movea.l d0,a6
    384e:	222f 002c      	move.l 44(sp),d1
    3852:	242f 0028      	move.l 40(sp),d2
    3856:	262f 0024      	move.l 36(sp),d3
    385a:	4eae ffd0      	jsr -48(a6)
    385e:	2f40 0020      	move.l d0,32(sp)
    3862:	6000 01f6      	bra.w 3a5a <TestCopyWord+0x2e8>
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
    3866:	2f6f 007c 0094 	move.l 124(sp),148(sp)
  for( int i=0; i<8;i++) {
    386c:	42af 0090      	clr.l 144(sp)
    3870:	6000 0086      	bra.w 38f8 <TestCopyWord+0x186>
    *tmp++ = 0;
    3874:	202f 0094      	move.l 148(sp),d0
    3878:	2200           	move.l d0,d1
    387a:	5481           	addq.l #2,d1
    387c:	2f41 0094      	move.l d1,148(sp)
    3880:	2040           	movea.l d0,a0
    3882:	4250           	clr.w (a0)
    *tmp++ = 0xaaaa;
    3884:	202f 0094      	move.l 148(sp),d0
    3888:	2200           	move.l d0,d1
    388a:	5481           	addq.l #2,d1
    388c:	2f41 0094      	move.l d1,148(sp)
    3890:	2040           	movea.l d0,a0
    3892:	30bc aaaa      	move.w #-21846,(a0)
    *tmp++ = 0xaaaa;
    3896:	202f 0094      	move.l 148(sp),d0
    389a:	2200           	move.l d0,d1
    389c:	5481           	addq.l #2,d1
    389e:	2f41 0094      	move.l d1,148(sp)
    38a2:	2040           	movea.l d0,a0
    38a4:	30bc aaaa      	move.w #-21846,(a0)
    *tmp = 0;
    38a8:	206f 0094      	movea.l 148(sp),a0
    38ac:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    38ae:	7024           	moveq #36,d0
    38b0:	d1af 0094      	add.l d0,148(sp)
    *tmp++ = 0;
    38b4:	202f 0094      	move.l 148(sp),d0
    38b8:	2200           	move.l d0,d1
    38ba:	5481           	addq.l #2,d1
    38bc:	2f41 0094      	move.l d1,148(sp)
    38c0:	2040           	movea.l d0,a0
    38c2:	4250           	clr.w (a0)
    *tmp++ = 0x5555;
    38c4:	202f 0094      	move.l 148(sp),d0
    38c8:	2200           	move.l d0,d1
    38ca:	5481           	addq.l #2,d1
    38cc:	2f41 0094      	move.l d1,148(sp)
    38d0:	2040           	movea.l d0,a0
    38d2:	30bc 5555      	move.w #21845,(a0)
    *tmp++ = 0x5555;
    38d6:	202f 0094      	move.l 148(sp),d0
    38da:	2200           	move.l d0,d1
    38dc:	5481           	addq.l #2,d1
    38de:	2f41 0094      	move.l d1,148(sp)
    38e2:	2040           	movea.l d0,a0
    38e4:	30bc 5555      	move.w #21845,(a0)
    *tmp = 0;
    38e8:	206f 0094      	movea.l 148(sp),a0
    38ec:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    38ee:	7024           	moveq #36,d0
    38f0:	d1af 0094      	add.l d0,148(sp)
  for( int i=0; i<8;i++) {
    38f4:	52af 0090      	addq.l #1,144(sp)
    38f8:	7207           	moveq #7,d1
    38fa:	b2af 0090      	cmp.l 144(sp),d1
    38fe:	6c00 ff74      	bge.w 3874 <TestCopyWord+0x102>
  }
  tmp = destination;
    3902:	2f6f 006c 0094 	move.l 108(sp),148(sp)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3908:	42af 008c      	clr.l 140(sp)
    390c:	6014           	bra.s 3922 <TestCopyWord+0x1b0>
    *tmp++ = 0;
    390e:	202f 0094      	move.l 148(sp),d0
    3912:	2200           	move.l d0,d1
    3914:	5481           	addq.l #2,d1
    3916:	2f41 0094      	move.l d1,148(sp)
    391a:	2040           	movea.l d0,a0
    391c:	4250           	clr.w (a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    391e:	52af 008c      	addq.l #1,140(sp)
    3922:	0caf 0000 0275 	cmpi.l #629,140(sp)
    3928:	008c 
    392a:	6fe2           	ble.s 390e <TestCopyWord+0x19c>
  }

  WaitBlit();
    392c:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    3932:	2c40           	movea.l d0,a6
    3934:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
    3938:	4eba db62      	jsr 149c <Zoom_Init>(pc)
  Init_Copy( 3);
    393c:	4878 0003      	pea 3 <_start+0x3>
    3940:	4eba e18c      	jsr 1ace <Init_Copy>(pc)
    3944:	588f           	addq.l #4,sp
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
    3946:	202f 007c      	move.l 124(sp),d0
    394a:	5480           	addq.l #2,d0
    394c:	4878 0010      	pea 10 <_start+0x10>
    3950:	2f2f 0070      	move.l 112(sp),-(sp)
    3954:	2f00           	move.l d0,-(sp)
    3956:	4eba d63a      	jsr f92 <Zoom_CopyWord>(pc)
    395a:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    395e:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    3964:	2c40           	movea.l d0,a6
    3966:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
    396a:	202f 006c      	move.l 108(sp),d0
    396e:	5480           	addq.l #2,d0
    3970:	2f40 0094      	move.l d0,148(sp)
  if( *tmp != 0x5555) 
    3974:	206f 0094      	movea.l 148(sp),a0
    3978:	3010           	move.w (a0),d0
    397a:	0c40 5555      	cmpi.w #21845,d0
    397e:	6742           	beq.s 39c2 <TestCopyWord+0x250>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    3980:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3986:	2c40           	movea.l d0,a6
    3988:	4eae ffc4      	jsr -60(a6)
    398c:	2f40 0068      	move.l d0,104(sp)
    3990:	202f 0068      	move.l 104(sp),d0
    3994:	2f40 0064      	move.l d0,100(sp)
    3998:	2f7c 0000 84a2 	move.l #33954,96(sp)
    399e:	0060 
    39a0:	721f           	moveq #31,d1
    39a2:	2f41 005c      	move.l d1,92(sp)
    39a6:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    39ac:	2c40           	movea.l d0,a6
    39ae:	222f 0064      	move.l 100(sp),d1
    39b2:	242f 0060      	move.l 96(sp),d2
    39b6:	262f 005c      	move.l 92(sp),d3
    39ba:	4eae ffd0      	jsr -48(a6)
    39be:	2f40 0058      	move.l d0,88(sp)
  tmp += ZMLINESIZE/2;
    39c2:	702a           	moveq #42,d0
    39c4:	d1af 0094      	add.l d0,148(sp)
  if( *tmp != 0xaaaa)
    39c8:	206f 0094      	movea.l 148(sp),a0
    39cc:	3010           	move.w (a0),d0
    39ce:	0c40 aaaa      	cmpi.w #-21846,d0
    39d2:	6742           	beq.s 3a16 <TestCopyWord+0x2a4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    39d4:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    39da:	2c40           	movea.l d0,a6
    39dc:	4eae ffc4      	jsr -60(a6)
    39e0:	2f40 0054      	move.l d0,84(sp)
    39e4:	202f 0054      	move.l 84(sp),d0
    39e8:	2f40 0050      	move.l d0,80(sp)
    39ec:	2f7c 0000 84c2 	move.l #33986,76(sp)
    39f2:	004c 
    39f4:	7220           	moveq #32,d1
    39f6:	2f41 0048      	move.l d1,72(sp)
    39fa:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3a00:	2c40           	movea.l d0,a6
    3a02:	222f 0050      	move.l 80(sp),d1
    3a06:	242f 004c      	move.l 76(sp),d2
    3a0a:	262f 0048      	move.l 72(sp),d3
    3a0e:	4eae ffd0      	jsr -48(a6)
    3a12:	2f40 0044      	move.l d0,68(sp)
  
  FreeMem( source,ZMLINESIZE*30);
    3a16:	2f6f 007c 0040 	move.l 124(sp),64(sp)
    3a1c:	2f7c 0000 04ec 	move.l #1260,60(sp)
    3a22:	003c 
    3a24:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    3a2a:	2c40           	movea.l d0,a6
    3a2c:	226f 0040      	movea.l 64(sp),a1
    3a30:	202f 003c      	move.l 60(sp),d0
    3a34:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    3a38:	2f6f 006c 0038 	move.l 108(sp),56(sp)
    3a3e:	2f7c 0000 04ec 	move.l #1260,52(sp)
    3a44:	0034 
    3a46:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    3a4c:	2c40           	movea.l d0,a6
    3a4e:	226f 0038      	movea.l 56(sp),a1
    3a52:	202f 0034      	move.l 52(sp),d0
    3a56:	4eae ff2e      	jsr -210(a6)
}
    3a5a:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3a5e:	4fef 008c      	lea 140(sp),sp
    3a62:	4e75           	rts

00003a64 <TestZoom4PictureOn5Planes>:
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */


void TestZoom4PictureOn5Planes() {
    3a64:	4fef ff74      	lea -140(sp),sp
    3a68:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3a6c:	2f7c 0000 f460 	move.l #62560,102(sp)
    3a72:	0066 
    3a74:	7002           	moveq #2,d0
    3a76:	2f40 0062      	move.l d0,98(sp)
    3a7a:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    3a80:	2c40           	movea.l d0,a6
    3a82:	202f 0066      	move.l 102(sp),d0
    3a86:	222f 0062      	move.l 98(sp),d1
    3a8a:	4eae ff3a      	jsr -198(a6)
    3a8e:	2f40 005e      	move.l d0,94(sp)
    3a92:	202f 005e      	move.l 94(sp),d0
    3a96:	2f40 005a      	move.l d0,90(sp)
  if( source == 0) {
    3a9a:	6646           	bne.s 3ae2 <TestZoom4PictureOn5Planes+0x7e>
    Write(  Output(), 
    3a9c:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3aa2:	2c40           	movea.l d0,a6
    3aa4:	4eae ffc4      	jsr -60(a6)
    3aa8:	2f40 001e      	move.l d0,30(sp)
    3aac:	202f 001e      	move.l 30(sp),d0
    3ab0:	2f40 001a      	move.l d0,26(sp)
    3ab4:	2f7c 0000 84e3 	move.l #34019,22(sp)
    3aba:	0016 
    3abc:	7239           	moveq #57,d1
    3abe:	2f41 0012      	move.l d1,18(sp)
    3ac2:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3ac8:	2c40           	movea.l d0,a6
    3aca:	222f 001a      	move.l 26(sp),d1
    3ace:	242f 0016      	move.l 22(sp),d2
    3ad2:	262f 0012      	move.l 18(sp),d3
    3ad6:	4eae ffd0      	jsr -48(a6)
    3ada:	2f40 000e      	move.l d0,14(sp)
    3ade:	6000 0266      	bra.w 3d46 <TestZoom4PictureOn5Planes+0x2e2>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3ae2:	2f7c 0000 f460 	move.l #62560,86(sp)
    3ae8:	0056 
    3aea:	7002           	moveq #2,d0
    3aec:	2f40 0052      	move.l d0,82(sp)
    3af0:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    3af6:	2c40           	movea.l d0,a6
    3af8:	202f 0056      	move.l 86(sp),d0
    3afc:	222f 0052      	move.l 82(sp),d1
    3b00:	4eae ff3a      	jsr -198(a6)
    3b04:	2f40 004e      	move.l d0,78(sp)
    3b08:	202f 004e      	move.l 78(sp),d0
    3b0c:	2f40 004a      	move.l d0,74(sp)
  if( destination == 0) {
    3b10:	6646           	bne.s 3b58 <TestZoom4PictureOn5Planes+0xf4>
    Write(  Output(), 
    3b12:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3b18:	2c40           	movea.l d0,a6
    3b1a:	4eae ffc4      	jsr -60(a6)
    3b1e:	2f40 0032      	move.l d0,50(sp)
    3b22:	202f 0032      	move.l 50(sp),d0
    3b26:	2f40 002e      	move.l d0,46(sp)
    3b2a:	2f7c 0000 851d 	move.l #34077,42(sp)
    3b30:	002a 
    3b32:	723d           	moveq #61,d1
    3b34:	2f41 0026      	move.l d1,38(sp)
    3b38:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3b3e:	2c40           	movea.l d0,a6
    3b40:	222f 002e      	move.l 46(sp),d1
    3b44:	242f 002a      	move.l 42(sp),d2
    3b48:	262f 0026      	move.l 38(sp),d3
    3b4c:	4eae ffd0      	jsr -48(a6)
    3b50:	2f40 0022      	move.l d0,34(sp)
    3b54:	6000 01f0      	bra.w 3d46 <TestZoom4PictureOn5Planes+0x2e2>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3b58:	2f6f 005a 0094 	move.l 90(sp),148(sp)
  for(int i=0;i<128+8;i++) {
    3b5e:	42af 0090      	clr.l 144(sp)
    3b62:	6050           	bra.s 3bb4 <TestZoom4PictureOn5Planes+0x150>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b64:	42af 008c      	clr.l 140(sp)
    3b68:	6018           	bra.s 3b82 <TestZoom4PictureOn5Planes+0x11e>
      *tmp4source++ = 0x55555555;
    3b6a:	202f 0094      	move.l 148(sp),d0
    3b6e:	2200           	move.l d0,d1
    3b70:	5881           	addq.l #4,d1
    3b72:	2f41 0094      	move.l d1,148(sp)
    3b76:	2040           	movea.l d0,a0
    3b78:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b7e:	52af 008c      	addq.l #1,140(sp)
    3b82:	7031           	moveq #49,d0
    3b84:	b0af 008c      	cmp.l 140(sp),d0
    3b88:	6ce0           	bge.s 3b6a <TestZoom4PictureOn5Planes+0x106>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3b8a:	42af 0088      	clr.l 136(sp)
    3b8e:	6018           	bra.s 3ba8 <TestZoom4PictureOn5Planes+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3b90:	202f 0094      	move.l 148(sp),d0
    3b94:	2200           	move.l d0,d1
    3b96:	5881           	addq.l #4,d1
    3b98:	2f41 0094      	move.l d1,148(sp)
    3b9c:	2040           	movea.l d0,a0
    3b9e:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3ba4:	52af 0088      	addq.l #1,136(sp)
    3ba8:	7031           	moveq #49,d0
    3baa:	b0af 0088      	cmp.l 136(sp),d0
    3bae:	6ce0           	bge.s 3b90 <TestZoom4PictureOn5Planes+0x12c>
  for(int i=0;i<128+8;i++) {
    3bb0:	52af 0090      	addq.l #1,144(sp)
    3bb4:	0caf 0000 0087 	cmpi.l #135,144(sp)
    3bba:	0090 
    3bbc:	6fa6           	ble.s 3b64 <TestZoom4PictureOn5Planes+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3bbe:	4878 0005      	pea 5 <_start+0x5>
    3bc2:	42a7           	clr.l -(sp)
    3bc4:	2f2f 0052      	move.l 82(sp),-(sp)
    3bc8:	2f2f 0066      	move.l 102(sp),-(sp)
    3bcc:	4eba df3a      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    3bd0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3bd4:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    3bda:	2c40           	movea.l d0,a6
    3bdc:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3be0:	222f 004a      	move.l 74(sp),d1
    3be4:	5881           	addq.l #4,d1
    3be6:	2f41 0084      	move.l d1,132(sp)
  UWORD *valsupposed = destlinezoom1;
    3bea:	2f7c 0000 b4c0 	move.l #46272,70(sp)
    3bf0:	0046 
  UWORD mask = 0xffff;
    3bf2:	3f7c ffff 0082 	move.w #-1,130(sp)
  for(int i=0;i<14;i++) {
    3bf8:	42af 007e      	clr.l 126(sp)
    3bfc:	6000 00a8      	bra.w 3ca6 <TestZoom4PictureOn5Planes+0x242>
    for(int i2=0;i2<18;i2++) { 
    3c00:	42af 007a      	clr.l 122(sp)
    3c04:	604e           	bra.s 3c54 <TestZoom4PictureOn5Planes+0x1f0>
      for( int i3=0;i3<5;i3++) {
    3c06:	42af 0076      	clr.l 118(sp)
    3c0a:	6038           	bra.s 3c44 <TestZoom4PictureOn5Planes+0x1e0>
        TestRow( valsupposed, valactual, mask, i2+i*19);
    3c0c:	222f 007e      	move.l 126(sp),d1
    3c10:	2001           	move.l d1,d0
    3c12:	e788           	lsl.l #3,d0
    3c14:	d081           	add.l d1,d0
    3c16:	d080           	add.l d0,d0
    3c18:	d081           	add.l d1,d0
    3c1a:	2200           	move.l d0,d1
    3c1c:	d2af 007a      	add.l 122(sp),d1
    3c20:	7000           	moveq #0,d0
    3c22:	302f 0082      	move.w 130(sp),d0
    3c26:	2f01           	move.l d1,-(sp)
    3c28:	2f00           	move.l d0,-(sp)
    3c2a:	2f2f 008c      	move.l 140(sp),-(sp)
    3c2e:	2f2f 0052      	move.l 82(sp),-(sp)
    3c32:	4eba 2f7e      	jsr 6bb2 <TestRow>(pc)
    3c36:	4fef 0010      	lea 16(sp),sp
        valactual += ZMLINESIZE/2;
    3c3a:	702a           	moveq #42,d0
    3c3c:	d1af 0084      	add.l d0,132(sp)
      for( int i3=0;i3<5;i3++) {
    3c40:	52af 0076      	addq.l #1,118(sp)
    3c44:	7204           	moveq #4,d1
    3c46:	b2af 0076      	cmp.l 118(sp),d1
    3c4a:	6cc0           	bge.s 3c0c <TestZoom4PictureOn5Planes+0x1a8>
      }
      mask = mask ^ 0xffff;
    3c4c:	466f 0082      	not.w 130(sp)
    for(int i2=0;i2<18;i2++) { 
    3c50:	52af 007a      	addq.l #1,122(sp)
    3c54:	7011           	moveq #17,d0
    3c56:	b0af 007a      	cmp.l 122(sp),d0
    3c5a:	6caa           	bge.s 3c06 <TestZoom4PictureOn5Planes+0x1a2>
    }
    for( int i3=0;i3<5;i3++) {
    3c5c:	42af 0072      	clr.l 114(sp)
    3c60:	6038           	bra.s 3c9a <TestZoom4PictureOn5Planes+0x236>
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3c62:	222f 007e      	move.l 126(sp),d1
    3c66:	2001           	move.l d1,d0
    3c68:	e788           	lsl.l #3,d0
    3c6a:	d081           	add.l d1,d0
    3c6c:	d080           	add.l d0,d0
    3c6e:	2040           	movea.l d0,a0
    3c70:	d1c1           	adda.l d1,a0
    3c72:	41e8 0012      	lea 18(a0),a0
    3c76:	7000           	moveq #0,d0
    3c78:	302f 0082      	move.w 130(sp),d0
    3c7c:	2f08           	move.l a0,-(sp)
    3c7e:	2f00           	move.l d0,-(sp)
    3c80:	2f2f 008c      	move.l 140(sp),-(sp)
    3c84:	2f2f 0052      	move.l 82(sp),-(sp)
    3c88:	4eba 2f28      	jsr 6bb2 <TestRow>(pc)
    3c8c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3c90:	722a           	moveq #42,d1
    3c92:	d3af 0084      	add.l d1,132(sp)
    for( int i3=0;i3<5;i3++) {
    3c96:	52af 0072      	addq.l #1,114(sp)
    3c9a:	7004           	moveq #4,d0
    3c9c:	b0af 0072      	cmp.l 114(sp),d0
    3ca0:	6cc0           	bge.s 3c62 <TestZoom4PictureOn5Planes+0x1fe>
  for(int i=0;i<14;i++) {
    3ca2:	52af 007e      	addq.l #1,126(sp)
    3ca6:	720d           	moveq #13,d1
    3ca8:	b2af 007e      	cmp.l 126(sp),d1
    3cac:	6c00 ff52      	bge.w 3c00 <TestZoom4PictureOn5Planes+0x19c>
    }
  }
  for(int i2=0;i2<4;i2++) { 
    3cb0:	42af 006e      	clr.l 110(sp)
    3cb4:	6044           	bra.s 3cfa <TestZoom4PictureOn5Planes+0x296>
    for( int i3=0;i3<5;i3++) {
    3cb6:	42af 006a      	clr.l 106(sp)
    3cba:	602e           	bra.s 3cea <TestZoom4PictureOn5Planes+0x286>
      TestRow( valsupposed, valactual, mask, i2+265);
    3cbc:	222f 006e      	move.l 110(sp),d1
    3cc0:	0681 0000 0109 	addi.l #265,d1
    3cc6:	7000           	moveq #0,d0
    3cc8:	302f 0082      	move.w 130(sp),d0
    3ccc:	2f01           	move.l d1,-(sp)
    3cce:	2f00           	move.l d0,-(sp)
    3cd0:	2f2f 008c      	move.l 140(sp),-(sp)
    3cd4:	2f2f 0052      	move.l 82(sp),-(sp)
    3cd8:	4eba 2ed8      	jsr 6bb2 <TestRow>(pc)
    3cdc:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3ce0:	702a           	moveq #42,d0
    3ce2:	d1af 0084      	add.l d0,132(sp)
    for( int i3=0;i3<5;i3++) {
    3ce6:	52af 006a      	addq.l #1,106(sp)
    3cea:	7204           	moveq #4,d1
    3cec:	b2af 006a      	cmp.l 106(sp),d1
    3cf0:	6cca           	bge.s 3cbc <TestZoom4PictureOn5Planes+0x258>
    }
    mask = mask ^ 0xffff;
    3cf2:	466f 0082      	not.w 130(sp)
  for(int i2=0;i2<4;i2++) { 
    3cf6:	52af 006e      	addq.l #1,110(sp)
    3cfa:	7003           	moveq #3,d0
    3cfc:	b0af 006e      	cmp.l 110(sp),d0
    3d00:	6cb4           	bge.s 3cb6 <TestZoom4PictureOn5Planes+0x252>
  } 
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    3d02:	2f6f 005a 0042 	move.l 90(sp),66(sp)
    3d08:	2f7c 0000 f460 	move.l #62560,62(sp)
    3d0e:	003e 
    3d10:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    3d16:	2c40           	movea.l d0,a6
    3d18:	226f 0042      	movea.l 66(sp),a1
    3d1c:	202f 003e      	move.l 62(sp),d0
    3d20:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    3d24:	2f6f 004a 003a 	move.l 74(sp),58(sp)
    3d2a:	2f7c 0000 f460 	move.l #62560,54(sp)
    3d30:	0036 
    3d32:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    3d38:	2c40           	movea.l d0,a6
    3d3a:	226f 003a      	movea.l 58(sp),a1
    3d3e:	202f 0036      	move.l 54(sp),d0
    3d42:	4eae ff2e      	jsr -210(a6)
}
    3d46:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3d4a:	4fef 008c      	lea 140(sp),sp
    3d4e:	4e75           	rts

00003d50 <TestZoom4Picture>:

void TestZoom4Picture() {
    3d50:	4fef fe30      	lea -464(sp),sp
    3d54:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3d58:	2f7c 0000 30e0 	move.l #12512,106(sp)
    3d5e:	006a 
    3d60:	7002           	moveq #2,d0
    3d62:	2f40 0066      	move.l d0,102(sp)
    3d66:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    3d6c:	2c40           	movea.l d0,a6
    3d6e:	202f 006a      	move.l 106(sp),d0
    3d72:	222f 0066      	move.l 102(sp),d1
    3d76:	4eae ff3a      	jsr -198(a6)
    3d7a:	2f40 0062      	move.l d0,98(sp)
    3d7e:	202f 0062      	move.l 98(sp),d0
    3d82:	2f40 005e      	move.l d0,94(sp)
  if( source == 0) {
    3d86:	6646           	bne.s 3dce <TestZoom4Picture+0x7e>
    Write(  Output(), 
    3d88:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3d8e:	2c40           	movea.l d0,a6
    3d90:	4eae ffc4      	jsr -60(a6)
    3d94:	2f40 001e      	move.l d0,30(sp)
    3d98:	202f 001e      	move.l 30(sp),d0
    3d9c:	2f40 001a      	move.l d0,26(sp)
    3da0:	2f7c 0000 84e3 	move.l #34019,22(sp)
    3da6:	0016 
    3da8:	7239           	moveq #57,d1
    3daa:	2f41 0012      	move.l d1,18(sp)
    3dae:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3db4:	2c40           	movea.l d0,a6
    3db6:	222f 001a      	move.l 26(sp),d1
    3dba:	242f 0016      	move.l 22(sp),d2
    3dbe:	262f 0012      	move.l 18(sp),d3
    3dc2:	4eae ffd0      	jsr -48(a6)
    3dc6:	2f40 000e      	move.l d0,14(sp)
    3dca:	6000 2ddc      	bra.w 6ba8 <TestZoom4Picture+0x2e58>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3dce:	2f7c 0000 30e0 	move.l #12512,90(sp)
    3dd4:	005a 
    3dd6:	7002           	moveq #2,d0
    3dd8:	2f40 0056      	move.l d0,86(sp)
    3ddc:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    3de2:	2c40           	movea.l d0,a6
    3de4:	202f 005a      	move.l 90(sp),d0
    3de8:	222f 0056      	move.l 86(sp),d1
    3dec:	4eae ff3a      	jsr -198(a6)
    3df0:	2f40 0052      	move.l d0,82(sp)
    3df4:	202f 0052      	move.l 82(sp),d0
    3df8:	2f40 004e      	move.l d0,78(sp)
  if( destination == 0) {
    3dfc:	6646           	bne.s 3e44 <TestZoom4Picture+0xf4>
    Write(  Output(), 
    3dfe:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3e04:	2c40           	movea.l d0,a6
    3e06:	4eae ffc4      	jsr -60(a6)
    3e0a:	2f40 0032      	move.l d0,50(sp)
    3e0e:	202f 0032      	move.l 50(sp),d0
    3e12:	2f40 002e      	move.l d0,46(sp)
    3e16:	2f7c 0000 851d 	move.l #34077,42(sp)
    3e1c:	002a 
    3e1e:	723d           	moveq #61,d1
    3e20:	2f41 0026      	move.l d1,38(sp)
    3e24:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    3e2a:	2c40           	movea.l d0,a6
    3e2c:	222f 002e      	move.l 46(sp),d1
    3e30:	242f 002a      	move.l 42(sp),d2
    3e34:	262f 0026      	move.l 38(sp),d3
    3e38:	4eae ffd0      	jsr -48(a6)
    3e3c:	2f40 0022      	move.l d0,34(sp)
    3e40:	6000 2d66      	bra.w 6ba8 <TestZoom4Picture+0x2e58>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3e44:	2f6f 005e 01d8 	move.l 94(sp),472(sp)
  for(int i=0;i<128+8;i++) {
    3e4a:	42af 01d4      	clr.l 468(sp)
    3e4e:	6050           	bra.s 3ea0 <TestZoom4Picture+0x150>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e50:	42af 01d0      	clr.l 464(sp)
    3e54:	6018           	bra.s 3e6e <TestZoom4Picture+0x11e>
      *tmp4source++ = 0x55555555;
    3e56:	202f 01d8      	move.l 472(sp),d0
    3e5a:	2200           	move.l d0,d1
    3e5c:	5881           	addq.l #4,d1
    3e5e:	2f41 01d8      	move.l d1,472(sp)
    3e62:	2040           	movea.l d0,a0
    3e64:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e6a:	52af 01d0      	addq.l #1,464(sp)
    3e6e:	7009           	moveq #9,d0
    3e70:	b0af 01d0      	cmp.l 464(sp),d0
    3e74:	6ce0           	bge.s 3e56 <TestZoom4Picture+0x106>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e76:	42af 01cc      	clr.l 460(sp)
    3e7a:	6018           	bra.s 3e94 <TestZoom4Picture+0x144>
      *tmp4source++ = 0xaaaaaaaa;
    3e7c:	202f 01d8      	move.l 472(sp),d0
    3e80:	2200           	move.l d0,d1
    3e82:	5881           	addq.l #4,d1
    3e84:	2f41 01d8      	move.l d1,472(sp)
    3e88:	2040           	movea.l d0,a0
    3e8a:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3e90:	52af 01cc      	addq.l #1,460(sp)
    3e94:	7009           	moveq #9,d0
    3e96:	b0af 01cc      	cmp.l 460(sp),d0
    3e9a:	6ce0           	bge.s 3e7c <TestZoom4Picture+0x12c>
  for(int i=0;i<128+8;i++) {
    3e9c:	52af 01d4      	addq.l #1,468(sp)
    3ea0:	0caf 0000 0087 	cmpi.l #135,468(sp)
    3ea6:	01d4 
    3ea8:	6fa6           	ble.s 3e50 <TestZoom4Picture+0x100>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    3eaa:	4878 0001      	pea 1 <_start+0x1>
    3eae:	42a7           	clr.l -(sp)
    3eb0:	2f2f 0056      	move.l 86(sp),-(sp)
    3eb4:	2f2f 006a      	move.l 106(sp),-(sp)
    3eb8:	4eba dc4e      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    3ebc:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3ec0:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    3ec6:	2c40           	movea.l d0,a6
    3ec8:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3ecc:	222f 004e      	move.l 78(sp),d1
    3ed0:	5881           	addq.l #4,d1
    3ed2:	2f41 01c8      	move.l d1,456(sp)
  UWORD *valsupposed = destlinezoom1;
    3ed6:	2f7c 0000 b4c0 	move.l #46272,74(sp)
    3edc:	004a 
  UWORD mask = 0xffff;
    3ede:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<14;i++) {
    3ee4:	42af 01c2      	clr.l 450(sp)
    3ee8:	6000 0084      	bra.w 3f6e <TestZoom4Picture+0x21e>
    for(int i2=0;i2<18;i2++) { 
    3eec:	42af 01be      	clr.l 446(sp)
    3ef0:	603c           	bra.s 3f2e <TestZoom4Picture+0x1de>
      TestRow( valsupposed, valactual, mask, i2+i*19);
    3ef2:	222f 01c2      	move.l 450(sp),d1
    3ef6:	2001           	move.l d1,d0
    3ef8:	e788           	lsl.l #3,d0
    3efa:	d081           	add.l d1,d0
    3efc:	d080           	add.l d0,d0
    3efe:	d081           	add.l d1,d0
    3f00:	2200           	move.l d0,d1
    3f02:	d2af 01be      	add.l 446(sp),d1
    3f06:	7000           	moveq #0,d0
    3f08:	302f 01c6      	move.w 454(sp),d0
    3f0c:	2f01           	move.l d1,-(sp)
    3f0e:	2f00           	move.l d0,-(sp)
    3f10:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f14:	2f2f 0056      	move.l 86(sp),-(sp)
    3f18:	4eba 2c98      	jsr 6bb2 <TestRow>(pc)
    3f1c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3f20:	702a           	moveq #42,d0
    3f22:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    3f26:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) { 
    3f2a:	52af 01be      	addq.l #1,446(sp)
    3f2e:	7211           	moveq #17,d1
    3f30:	b2af 01be      	cmp.l 446(sp),d1
    3f34:	6cbc           	bge.s 3ef2 <TestZoom4Picture+0x1a2>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    3f36:	222f 01c2      	move.l 450(sp),d1
    3f3a:	2001           	move.l d1,d0
    3f3c:	e788           	lsl.l #3,d0
    3f3e:	d081           	add.l d1,d0
    3f40:	d080           	add.l d0,d0
    3f42:	2040           	movea.l d0,a0
    3f44:	d1c1           	adda.l d1,a0
    3f46:	41e8 0012      	lea 18(a0),a0
    3f4a:	7000           	moveq #0,d0
    3f4c:	302f 01c6      	move.w 454(sp),d0
    3f50:	2f08           	move.l a0,-(sp)
    3f52:	2f00           	move.l d0,-(sp)
    3f54:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f58:	2f2f 0056      	move.l 86(sp),-(sp)
    3f5c:	4eba 2c54      	jsr 6bb2 <TestRow>(pc)
    3f60:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f64:	702a           	moveq #42,d0
    3f66:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<14;i++) {
    3f6a:	52af 01c2      	addq.l #1,450(sp)
    3f6e:	720d           	moveq #13,d1
    3f70:	b2af 01c2      	cmp.l 450(sp),d1
    3f74:	6c00 ff76      	bge.w 3eec <TestZoom4Picture+0x19c>
  }

  for(int i2=0;i2<4;i2++) { 
    3f78:	42af 01ba      	clr.l 442(sp)
    3f7c:	6032           	bra.s 3fb0 <TestZoom4Picture+0x260>
    TestRow( valsupposed, valactual, mask, i2+265);
    3f7e:	222f 01ba      	move.l 442(sp),d1
    3f82:	0681 0000 0109 	addi.l #265,d1
    3f88:	7000           	moveq #0,d0
    3f8a:	302f 01c6      	move.w 454(sp),d0
    3f8e:	2f01           	move.l d1,-(sp)
    3f90:	2f00           	move.l d0,-(sp)
    3f92:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f96:	2f2f 0056      	move.l 86(sp),-(sp)
    3f9a:	4eba 2c16      	jsr 6bb2 <TestRow>(pc)
    3f9e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3fa2:	702a           	moveq #42,d0
    3fa4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    3fa8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    3fac:	52af 01ba      	addq.l #1,442(sp)
    3fb0:	7203           	moveq #3,d1
    3fb2:	b2af 01ba      	cmp.l 442(sp),d1
    3fb6:	6cc6           	bge.s 3f7e <TestZoom4Picture+0x22e>
  }
  
  UWORD *tmp = source;
    3fb8:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    3fbe:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    3fc4:	2f6f 0046 004e 	move.l 70(sp),78(sp)
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    3fca:	4878 0001      	pea 1 <_start+0x1>
    3fce:	4878 0001      	pea 1 <_start+0x1>
    3fd2:	2f2f 0056      	move.l 86(sp),-(sp)
    3fd6:	2f2f 006a      	move.l 106(sp),-(sp)
    3fda:	4eba db2c      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    3fde:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3fe2:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    3fe8:	2c40           	movea.l d0,a6
    3fea:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    3fee:	202f 004e      	move.l 78(sp),d0
    3ff2:	5880           	addq.l #4,d0
    3ff4:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom2;
    3ff8:	2f7c 0000 b4ec 	move.l #46316,74(sp)
    3ffe:	004a 
  mask = 0x0000;
    4000:	426f 01c6      	clr.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    4004:	42af 01b6      	clr.l 438(sp)
    4008:	602a           	bra.s 4034 <TestZoom4Picture+0x2e4>
    TestRow( valsupposed, valactual, mask, i2);
    400a:	7000           	moveq #0,d0
    400c:	302f 01c6      	move.w 454(sp),d0
    4010:	2f2f 01b6      	move.l 438(sp),-(sp)
    4014:	2f00           	move.l d0,-(sp)
    4016:	2f2f 01d0      	move.l 464(sp),-(sp)
    401a:	2f2f 0056      	move.l 86(sp),-(sp)
    401e:	4eba 2b92      	jsr 6bb2 <TestRow>(pc)
    4022:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4026:	722a           	moveq #42,d1
    4028:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    402c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    4030:	52af 01b6      	addq.l #1,438(sp)
    4034:	700a           	moveq #10,d0
    4036:	b0af 01b6      	cmp.l 438(sp),d0
    403a:	6cce           	bge.s 400a <TestZoom4Picture+0x2ba>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    403c:	4878 0008      	pea 8 <_start+0x8>
    4040:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4046:	2f2f 01d0      	move.l 464(sp),-(sp)
    404a:	2f2f 0056      	move.l 86(sp),-(sp)
    404e:	4eba 2b62      	jsr 6bb2 <TestRow>(pc)
    4052:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4056:	722a           	moveq #42,d1
    4058:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 9);
    405c:	4878 0009      	pea 9 <_start+0x9>
    4060:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4066:	2f2f 01d0      	move.l 464(sp),-(sp)
    406a:	2f2f 0056      	move.l 86(sp),-(sp)
    406e:	4eba 2b42      	jsr 6bb2 <TestRow>(pc)
    4072:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4076:	702a           	moveq #42,d0
    4078:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 10);
    407c:	4878 000a      	pea a <_start+0xa>
    4080:	42a7           	clr.l -(sp)
    4082:	2f2f 01d0      	move.l 464(sp),-(sp)
    4086:	2f2f 0056      	move.l 86(sp),-(sp)
    408a:	4eba 2b26      	jsr 6bb2 <TestRow>(pc)
    408e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4092:	722a           	moveq #42,d1
    4094:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 11);
    4098:	4878 000b      	pea b <_start+0xb>
    409c:	42a7           	clr.l -(sp)
    409e:	2f2f 01d0      	move.l 464(sp),-(sp)
    40a2:	2f2f 0056      	move.l 86(sp),-(sp)
    40a6:	4eba 2b0a      	jsr 6bb2 <TestRow>(pc)
    40aa:	4fef 0010      	lea 16(sp),sp

  valactual += ZMLINESIZE/2;
    40ae:	702a           	moveq #42,d0
    40b0:	d1af 01c8      	add.l d0,456(sp)
  for(int i=0;i<12;i++) {
    40b4:	42af 01b2      	clr.l 434(sp)
    40b8:	6000 0118      	bra.w 41d2 <TestZoom4Picture+0x482>
    for(int i2=0;i2<16;i2++) {  
    40bc:	42af 01ae      	clr.l 430(sp)
    40c0:	603c           	bra.s 40fe <TestZoom4Picture+0x3ae>
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    40c2:	222f 01b2      	move.l 434(sp),d1
    40c6:	2001           	move.l d1,d0
    40c8:	e988           	lsl.l #4,d0
    40ca:	d081           	add.l d1,d0
    40cc:	2040           	movea.l d0,a0
    40ce:	d1ef 01ae      	adda.l 430(sp),a0
    40d2:	41e8 000b      	lea 11(a0),a0
    40d6:	7000           	moveq #0,d0
    40d8:	302f 01c6      	move.w 454(sp),d0
    40dc:	2f08           	move.l a0,-(sp)
    40de:	2f00           	move.l d0,-(sp)
    40e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    40e4:	2f2f 0056      	move.l 86(sp),-(sp)
    40e8:	4eba 2ac8      	jsr 6bb2 <TestRow>(pc)
    40ec:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    40f0:	722a           	moveq #42,d1
    40f2:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    40f6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {  
    40fa:	52af 01ae      	addq.l #1,430(sp)
    40fe:	700f           	moveq #15,d0
    4100:	b0af 01ae      	cmp.l 430(sp),d0
    4104:	6cbc           	bge.s 40c2 <TestZoom4Picture+0x372>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    4106:	222f 01b2      	move.l 434(sp),d1
    410a:	2001           	move.l d1,d0
    410c:	e988           	lsl.l #4,d0
    410e:	2040           	movea.l d0,a0
    4110:	d1c1           	adda.l d1,a0
    4112:	41e8 0018      	lea 24(a0),a0
    4116:	7000           	moveq #0,d0
    4118:	302f 01c6      	move.w 454(sp),d0
    411c:	2f08           	move.l a0,-(sp)
    411e:	2f00           	move.l d0,-(sp)
    4120:	2f2f 01d0      	move.l 464(sp),-(sp)
    4124:	2f2f 0056      	move.l 86(sp),-(sp)
    4128:	4eba 2a88      	jsr 6bb2 <TestRow>(pc)
    412c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4130:	722a           	moveq #42,d1
    4132:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    4136:	222f 01b2      	move.l 434(sp),d1
    413a:	2001           	move.l d1,d0
    413c:	e988           	lsl.l #4,d0
    413e:	2040           	movea.l d0,a0
    4140:	d1c1           	adda.l d1,a0
    4142:	41e8 0019      	lea 25(a0),a0
    4146:	7000           	moveq #0,d0
    4148:	302f 01c6      	move.w 454(sp),d0
    414c:	2f08           	move.l a0,-(sp)
    414e:	2f00           	move.l d0,-(sp)
    4150:	2f2f 01d0      	move.l 464(sp),-(sp)
    4154:	2f2f 0056      	move.l 86(sp),-(sp)
    4158:	4eba 2a58      	jsr 6bb2 <TestRow>(pc)
    415c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4160:	702a           	moveq #42,d0
    4162:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4166:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    416a:	222f 01b2      	move.l 434(sp),d1
    416e:	2001           	move.l d1,d0
    4170:	e988           	lsl.l #4,d0
    4172:	2040           	movea.l d0,a0
    4174:	d1c1           	adda.l d1,a0
    4176:	41e8 001a      	lea 26(a0),a0
    417a:	7000           	moveq #0,d0
    417c:	302f 01c6      	move.w 454(sp),d0
    4180:	2f08           	move.l a0,-(sp)
    4182:	2f00           	move.l d0,-(sp)
    4184:	2f2f 01d0      	move.l 464(sp),-(sp)
    4188:	2f2f 0056      	move.l 86(sp),-(sp)
    418c:	4eba 2a24      	jsr 6bb2 <TestRow>(pc)
    4190:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4194:	722a           	moveq #42,d1
    4196:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    419a:	222f 01b2      	move.l 434(sp),d1
    419e:	2001           	move.l d1,d0
    41a0:	e988           	lsl.l #4,d0
    41a2:	2040           	movea.l d0,a0
    41a4:	d1c1           	adda.l d1,a0
    41a6:	41e8 001b      	lea 27(a0),a0
    41aa:	7000           	moveq #0,d0
    41ac:	302f 01c6      	move.w 454(sp),d0
    41b0:	2f08           	move.l a0,-(sp)
    41b2:	2f00           	move.l d0,-(sp)
    41b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    41b8:	2f2f 0056      	move.l 86(sp),-(sp)
    41bc:	4eba 29f4      	jsr 6bb2 <TestRow>(pc)
    41c0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    41c4:	702a           	moveq #42,d0
    41c6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    41ca:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    41ce:	52af 01b2      	addq.l #1,434(sp)
    41d2:	720b           	moveq #11,d1
    41d4:	b2af 01b2      	cmp.l 434(sp),d1
    41d8:	6c00 fee2      	bge.w 40bc <TestZoom4Picture+0x36c>
    
  }

  for(int i2=0;i2<15;i2++) { 
    41dc:	42af 01aa      	clr.l 426(sp)
    41e0:	602a           	bra.s 420c <TestZoom4Picture+0x4bc>
    TestRow( valsupposed, valactual, mask, i2);
    41e2:	7000           	moveq #0,d0
    41e4:	302f 01c6      	move.w 454(sp),d0
    41e8:	2f2f 01aa      	move.l 426(sp),-(sp)
    41ec:	2f00           	move.l d0,-(sp)
    41ee:	2f2f 01d0      	move.l 464(sp),-(sp)
    41f2:	2f2f 0056      	move.l 86(sp),-(sp)
    41f6:	4eba 29ba      	jsr 6bb2 <TestRow>(pc)
    41fa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    41fe:	702a           	moveq #42,d0
    4200:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4204:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<15;i2++) { 
    4208:	52af 01aa      	addq.l #1,426(sp)
    420c:	720e           	moveq #14,d1
    420e:	b2af 01aa      	cmp.l 426(sp),d1
    4212:	6cce           	bge.s 41e2 <TestZoom4Picture+0x492>
  }

  tmp = source;
    4214:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    421a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4220:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    4226:	4878 0001      	pea 1 <_start+0x1>
    422a:	4878 0002      	pea 2 <_start+0x2>
    422e:	2f2f 0056      	move.l 86(sp),-(sp)
    4232:	2f2f 006a      	move.l 106(sp),-(sp)
    4236:	4eba d8d0      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    423a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    423e:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    4244:	2c40           	movea.l d0,a6
    4246:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    424a:	202f 004e      	move.l 78(sp),d0
    424e:	5880           	addq.l #4,d0
    4250:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom3;
    4254:	2f7c 0000 b518 	move.l #46360,74(sp)
    425a:	004a 
  mask = 0xffff;
    425c:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<4;i2++) { 
    4262:	42af 01a6      	clr.l 422(sp)
    4266:	602a           	bra.s 4292 <TestZoom4Picture+0x542>
    TestRow( valsupposed, valactual, mask, i2);
    4268:	7000           	moveq #0,d0
    426a:	302f 01c6      	move.w 454(sp),d0
    426e:	2f2f 01a6      	move.l 422(sp),-(sp)
    4272:	2f00           	move.l d0,-(sp)
    4274:	2f2f 01d0      	move.l 464(sp),-(sp)
    4278:	2f2f 0056      	move.l 86(sp),-(sp)
    427c:	4eba 2934      	jsr 6bb2 <TestRow>(pc)
    4280:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4284:	722a           	moveq #42,d1
    4286:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    428a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    428e:	52af 01a6      	addq.l #1,422(sp)
    4292:	7003           	moveq #3,d0
    4294:	b0af 01a6      	cmp.l 422(sp),d0
    4298:	6cce           	bge.s 4268 <TestZoom4Picture+0x518>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    429a:	4878 0004      	pea 4 <_start+0x4>
    429e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    42a4:	2f2f 01d0      	move.l 464(sp),-(sp)
    42a8:	2f2f 0056      	move.l 86(sp),-(sp)
    42ac:	4eba 2904      	jsr 6bb2 <TestRow>(pc)
    42b0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42b4:	722a           	moveq #42,d1
    42b6:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    42ba:	4878 0005      	pea 5 <_start+0x5>
    42be:	2f3c 0000 ffff 	move.l #65535,-(sp)
    42c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    42c8:	2f2f 0056      	move.l 86(sp),-(sp)
    42cc:	4eba 28e4      	jsr 6bb2 <TestRow>(pc)
    42d0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42d4:	702a           	moveq #42,d0
    42d6:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    42da:	4878 0006      	pea 6 <_start+0x6>
    42de:	42a7           	clr.l -(sp)
    42e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    42e4:	2f2f 0056      	move.l 86(sp),-(sp)
    42e8:	4eba 28c8      	jsr 6bb2 <TestRow>(pc)
    42ec:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42f0:	722a           	moveq #42,d1
    42f2:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    42f6:	4878 0007      	pea 7 <_start+0x7>
    42fa:	42a7           	clr.l -(sp)
    42fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4300:	2f2f 0056      	move.l 86(sp),-(sp)
    4304:	4eba 28ac      	jsr 6bb2 <TestRow>(pc)
    4308:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    430c:	702a           	moveq #42,d0
    430e:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    4312:	4878 0008      	pea 8 <_start+0x8>
    4316:	2f3c 0000 ffff 	move.l #65535,-(sp)
    431c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4320:	2f2f 0056      	move.l 86(sp),-(sp)
    4324:	4eba 288c      	jsr 6bb2 <TestRow>(pc)
    4328:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    432c:	722a           	moveq #42,d1
    432e:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    4332:	4878 0009      	pea 9 <_start+0x9>
    4336:	2f3c 0000 ffff 	move.l #65535,-(sp)
    433c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4340:	2f2f 0056      	move.l 86(sp),-(sp)
    4344:	4eba 286c      	jsr 6bb2 <TestRow>(pc)
    4348:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    434c:	702a           	moveq #42,d0
    434e:	d1af 01c8      	add.l d0,456(sp)

  mask = 0x0000;
    4352:	426f 01c6      	clr.w 454(sp)
  for(int i=0;i<12;i++) {
    4356:	42af 01a2      	clr.l 418(sp)
    435a:	6000 01a6      	bra.w 4502 <TestZoom4Picture+0x7b2>
    for(int i2=0;i2<15;i2++) {  
    435e:	42af 019e      	clr.l 414(sp)
    4362:	6042           	bra.s 43a6 <TestZoom4Picture+0x656>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    4364:	222f 01a2      	move.l 418(sp),d1
    4368:	2001           	move.l d1,d0
    436a:	d080           	add.l d0,d0
    436c:	d081           	add.l d1,d0
    436e:	2200           	move.l d0,d1
    4370:	e789           	lsl.l #3,d1
    4372:	9280           	sub.l d0,d1
    4374:	2041           	movea.l d1,a0
    4376:	d1ef 019e      	adda.l 414(sp),a0
    437a:	41e8 0009      	lea 9(a0),a0
    437e:	7000           	moveq #0,d0
    4380:	302f 01c6      	move.w 454(sp),d0
    4384:	2f08           	move.l a0,-(sp)
    4386:	2f00           	move.l d0,-(sp)
    4388:	2f2f 01d0      	move.l 464(sp),-(sp)
    438c:	2f2f 0056      	move.l 86(sp),-(sp)
    4390:	4eba 2820      	jsr 6bb2 <TestRow>(pc)
    4394:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4398:	722a           	moveq #42,d1
    439a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    439e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {  
    43a2:	52af 019e      	addq.l #1,414(sp)
    43a6:	700e           	moveq #14,d0
    43a8:	b0af 019e      	cmp.l 414(sp),d0
    43ac:	6cb6           	bge.s 4364 <TestZoom4Picture+0x614>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    43ae:	222f 01a2      	move.l 418(sp),d1
    43b2:	2001           	move.l d1,d0
    43b4:	d080           	add.l d0,d0
    43b6:	d081           	add.l d1,d0
    43b8:	2200           	move.l d0,d1
    43ba:	e789           	lsl.l #3,d1
    43bc:	2041           	movea.l d1,a0
    43be:	91c0           	suba.l d0,a0
    43c0:	41e8 0018      	lea 24(a0),a0
    43c4:	7000           	moveq #0,d0
    43c6:	302f 01c6      	move.w 454(sp),d0
    43ca:	2f08           	move.l a0,-(sp)
    43cc:	2f00           	move.l d0,-(sp)
    43ce:	2f2f 01d0      	move.l 464(sp),-(sp)
    43d2:	2f2f 0056      	move.l 86(sp),-(sp)
    43d6:	4eba 27da      	jsr 6bb2 <TestRow>(pc)
    43da:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43de:	722a           	moveq #42,d1
    43e0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    43e4:	222f 01a2      	move.l 418(sp),d1
    43e8:	2001           	move.l d1,d0
    43ea:	d080           	add.l d0,d0
    43ec:	d081           	add.l d1,d0
    43ee:	2200           	move.l d0,d1
    43f0:	e789           	lsl.l #3,d1
    43f2:	2041           	movea.l d1,a0
    43f4:	91c0           	suba.l d0,a0
    43f6:	41e8 0019      	lea 25(a0),a0
    43fa:	7000           	moveq #0,d0
    43fc:	302f 01c6      	move.w 454(sp),d0
    4400:	2f08           	move.l a0,-(sp)
    4402:	2f00           	move.l d0,-(sp)
    4404:	2f2f 01d0      	move.l 464(sp),-(sp)
    4408:	2f2f 0056      	move.l 86(sp),-(sp)
    440c:	4eba 27a4      	jsr 6bb2 <TestRow>(pc)
    4410:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4414:	702a           	moveq #42,d0
    4416:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    441a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    441e:	222f 01a2      	move.l 418(sp),d1
    4422:	2001           	move.l d1,d0
    4424:	d080           	add.l d0,d0
    4426:	d081           	add.l d1,d0
    4428:	2200           	move.l d0,d1
    442a:	e789           	lsl.l #3,d1
    442c:	2041           	movea.l d1,a0
    442e:	91c0           	suba.l d0,a0
    4430:	41e8 001a      	lea 26(a0),a0
    4434:	7000           	moveq #0,d0
    4436:	302f 01c6      	move.w 454(sp),d0
    443a:	2f08           	move.l a0,-(sp)
    443c:	2f00           	move.l d0,-(sp)
    443e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4442:	2f2f 0056      	move.l 86(sp),-(sp)
    4446:	4eba 276a      	jsr 6bb2 <TestRow>(pc)
    444a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    444e:	722a           	moveq #42,d1
    4450:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    4454:	222f 01a2      	move.l 418(sp),d1
    4458:	2001           	move.l d1,d0
    445a:	d080           	add.l d0,d0
    445c:	d081           	add.l d1,d0
    445e:	2200           	move.l d0,d1
    4460:	e789           	lsl.l #3,d1
    4462:	2041           	movea.l d1,a0
    4464:	91c0           	suba.l d0,a0
    4466:	41e8 001b      	lea 27(a0),a0
    446a:	7000           	moveq #0,d0
    446c:	302f 01c6      	move.w 454(sp),d0
    4470:	2f08           	move.l a0,-(sp)
    4472:	2f00           	move.l d0,-(sp)
    4474:	2f2f 01d0      	move.l 464(sp),-(sp)
    4478:	2f2f 0056      	move.l 86(sp),-(sp)
    447c:	4eba 2734      	jsr 6bb2 <TestRow>(pc)
    4480:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4484:	702a           	moveq #42,d0
    4486:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    448a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    448e:	222f 01a2      	move.l 418(sp),d1
    4492:	2001           	move.l d1,d0
    4494:	d080           	add.l d0,d0
    4496:	d081           	add.l d1,d0
    4498:	2200           	move.l d0,d1
    449a:	e789           	lsl.l #3,d1
    449c:	2041           	movea.l d1,a0
    449e:	91c0           	suba.l d0,a0
    44a0:	41e8 001c      	lea 28(a0),a0
    44a4:	7000           	moveq #0,d0
    44a6:	302f 01c6      	move.w 454(sp),d0
    44aa:	2f08           	move.l a0,-(sp)
    44ac:	2f00           	move.l d0,-(sp)
    44ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    44b2:	2f2f 0056      	move.l 86(sp),-(sp)
    44b6:	4eba 26fa      	jsr 6bb2 <TestRow>(pc)
    44ba:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    44be:	722a           	moveq #42,d1
    44c0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    44c4:	222f 01a2      	move.l 418(sp),d1
    44c8:	2001           	move.l d1,d0
    44ca:	d080           	add.l d0,d0
    44cc:	d081           	add.l d1,d0
    44ce:	2200           	move.l d0,d1
    44d0:	e789           	lsl.l #3,d1
    44d2:	2041           	movea.l d1,a0
    44d4:	91c0           	suba.l d0,a0
    44d6:	41e8 001d      	lea 29(a0),a0
    44da:	7000           	moveq #0,d0
    44dc:	302f 01c6      	move.w 454(sp),d0
    44e0:	2f08           	move.l a0,-(sp)
    44e2:	2f00           	move.l d0,-(sp)
    44e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    44e8:	2f2f 0056      	move.l 86(sp),-(sp)
    44ec:	4eba 26c4      	jsr 6bb2 <TestRow>(pc)
    44f0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    44f4:	702a           	moveq #42,d0
    44f6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    44fa:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    44fe:	52af 01a2      	addq.l #1,418(sp)
    4502:	720b           	moveq #11,d1
    4504:	b2af 01a2      	cmp.l 418(sp),d1
    4508:	6c00 fe54      	bge.w 435e <TestZoom4Picture+0x60e>
  }

  for(int i2=0;i2<8;i2++) {  
    450c:	42af 019a      	clr.l 410(sp)
    4510:	6032           	bra.s 4544 <TestZoom4Picture+0x7f4>
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    4512:	222f 019a      	move.l 410(sp),d1
    4516:	0681 0000 0105 	addi.l #261,d1
    451c:	7000           	moveq #0,d0
    451e:	302f 01c6      	move.w 454(sp),d0
    4522:	2f01           	move.l d1,-(sp)
    4524:	2f00           	move.l d0,-(sp)
    4526:	2f2f 01d0      	move.l 464(sp),-(sp)
    452a:	2f2f 0056      	move.l 86(sp),-(sp)
    452e:	4eba 2682      	jsr 6bb2 <TestRow>(pc)
    4532:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4536:	702a           	moveq #42,d0
    4538:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    453c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    4540:	52af 019a      	addq.l #1,410(sp)
    4544:	7207           	moveq #7,d1
    4546:	b2af 019a      	cmp.l 410(sp),d1
    454a:	6cc6           	bge.s 4512 <TestZoom4Picture+0x7c2>
  }

  tmp = source;
    454c:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4552:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4558:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    455e:	4878 0001      	pea 1 <_start+0x1>
    4562:	4878 0003      	pea 3 <_start+0x3>
    4566:	2f2f 0056      	move.l 86(sp),-(sp)
    456a:	2f2f 006a      	move.l 106(sp),-(sp)
    456e:	4eba d598      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    4572:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4576:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    457c:	2c40           	movea.l d0,a6
    457e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4582:	202f 004e      	move.l 78(sp),d0
    4586:	5880           	addq.l #4,d0
    4588:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom4;
    458c:	2f7c 0000 b544 	move.l #46404,74(sp)
    4592:	004a 
  mask = 0x0000;
    4594:	426f 01c6      	clr.w 454(sp)
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    4598:	4878 0007      	pea 7 <_start+0x7>
    459c:	42a7           	clr.l -(sp)
    459e:	2f2f 01d0      	move.l 464(sp),-(sp)
    45a2:	2f2f 0056      	move.l 86(sp),-(sp)
    45a6:	4eba 260a      	jsr 6bb2 <TestRow>(pc)
    45aa:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    45ae:	722a           	moveq #42,d1
    45b0:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    45b4:	4878 0008      	pea 8 <_start+0x8>
    45b8:	2f3c 0000 ffff 	move.l #65535,-(sp)
    45be:	2f2f 01d0      	move.l 464(sp),-(sp)
    45c2:	2f2f 0056      	move.l 86(sp),-(sp)
    45c6:	4eba 25ea      	jsr 6bb2 <TestRow>(pc)
    45ca:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    45ce:	702a           	moveq #42,d0
    45d0:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    45d4:	4878 0009      	pea 9 <_start+0x9>
    45d8:	2f3c 0000 ffff 	move.l #65535,-(sp)
    45de:	2f2f 01d0      	move.l 464(sp),-(sp)
    45e2:	2f2f 0056      	move.l 86(sp),-(sp)
    45e6:	4eba 25ca      	jsr 6bb2 <TestRow>(pc)
    45ea:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    45ee:	722a           	moveq #42,d1
    45f0:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    45f4:	4878 0008      	pea 8 <_start+0x8>
    45f8:	42a7           	clr.l -(sp)
    45fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    45fe:	2f2f 0056      	move.l 86(sp),-(sp)
    4602:	4eba 25ae      	jsr 6bb2 <TestRow>(pc)
    4606:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    460a:	702a           	moveq #42,d0
    460c:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    4610:	4878 0009      	pea 9 <_start+0x9>
    4614:	42a7           	clr.l -(sp)
    4616:	2f2f 01d0      	move.l 464(sp),-(sp)
    461a:	2f2f 0056      	move.l 86(sp),-(sp)
    461e:	4eba 2592      	jsr 6bb2 <TestRow>(pc)
    4622:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4626:	722a           	moveq #42,d1
    4628:	d3af 01c8      	add.l d1,456(sp)

  mask = 0xffff;
    462c:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<12;i++) {
    4632:	42af 0196      	clr.l 406(sp)
    4636:	6000 0216      	bra.w 484e <TestZoom4Picture+0xafe>
    for(int i2=0;i2<14;i2++) {  
    463a:	42af 0192      	clr.l 402(sp)
    463e:	6042           	bra.s 4682 <TestZoom4Picture+0x932>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    4640:	222f 0196      	move.l 406(sp),d1
    4644:	2001           	move.l d1,d0
    4646:	d080           	add.l d0,d0
    4648:	d081           	add.l d1,d0
    464a:	2200           	move.l d0,d1
    464c:	e789           	lsl.l #3,d1
    464e:	9280           	sub.l d0,d1
    4650:	2041           	movea.l d1,a0
    4652:	d1ef 0192      	adda.l 402(sp),a0
    4656:	41e8 0009      	lea 9(a0),a0
    465a:	7000           	moveq #0,d0
    465c:	302f 01c6      	move.w 454(sp),d0
    4660:	2f08           	move.l a0,-(sp)
    4662:	2f00           	move.l d0,-(sp)
    4664:	2f2f 01d0      	move.l 464(sp),-(sp)
    4668:	2f2f 0056      	move.l 86(sp),-(sp)
    466c:	4eba 2544      	jsr 6bb2 <TestRow>(pc)
    4670:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4674:	702a           	moveq #42,d0
    4676:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    467a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {  
    467e:	52af 0192      	addq.l #1,402(sp)
    4682:	720d           	moveq #13,d1
    4684:	b2af 0192      	cmp.l 402(sp),d1
    4688:	6cb6           	bge.s 4640 <TestZoom4Picture+0x8f0>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    468a:	222f 0196      	move.l 406(sp),d1
    468e:	2001           	move.l d1,d0
    4690:	d080           	add.l d0,d0
    4692:	d081           	add.l d1,d0
    4694:	2200           	move.l d0,d1
    4696:	e789           	lsl.l #3,d1
    4698:	2041           	movea.l d1,a0
    469a:	91c0           	suba.l d0,a0
    469c:	41e8 0018      	lea 24(a0),a0
    46a0:	7000           	moveq #0,d0
    46a2:	302f 01c6      	move.w 454(sp),d0
    46a6:	2f08           	move.l a0,-(sp)
    46a8:	2f00           	move.l d0,-(sp)
    46aa:	2f2f 01d0      	move.l 464(sp),-(sp)
    46ae:	2f2f 0056      	move.l 86(sp),-(sp)
    46b2:	4eba 24fe      	jsr 6bb2 <TestRow>(pc)
    46b6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46ba:	702a           	moveq #42,d0
    46bc:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    46c0:	222f 0196      	move.l 406(sp),d1
    46c4:	2001           	move.l d1,d0
    46c6:	d080           	add.l d0,d0
    46c8:	d081           	add.l d1,d0
    46ca:	2200           	move.l d0,d1
    46cc:	e789           	lsl.l #3,d1
    46ce:	2041           	movea.l d1,a0
    46d0:	91c0           	suba.l d0,a0
    46d2:	41e8 0019      	lea 25(a0),a0
    46d6:	7000           	moveq #0,d0
    46d8:	302f 01c6      	move.w 454(sp),d0
    46dc:	2f08           	move.l a0,-(sp)
    46de:	2f00           	move.l d0,-(sp)
    46e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    46e4:	2f2f 0056      	move.l 86(sp),-(sp)
    46e8:	4eba 24c8      	jsr 6bb2 <TestRow>(pc)
    46ec:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46f0:	722a           	moveq #42,d1
    46f2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    46f6:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    46fa:	222f 0196      	move.l 406(sp),d1
    46fe:	2001           	move.l d1,d0
    4700:	d080           	add.l d0,d0
    4702:	d081           	add.l d1,d0
    4704:	2200           	move.l d0,d1
    4706:	e789           	lsl.l #3,d1
    4708:	2041           	movea.l d1,a0
    470a:	91c0           	suba.l d0,a0
    470c:	41e8 001a      	lea 26(a0),a0
    4710:	7000           	moveq #0,d0
    4712:	302f 01c6      	move.w 454(sp),d0
    4716:	2f08           	move.l a0,-(sp)
    4718:	2f00           	move.l d0,-(sp)
    471a:	2f2f 01d0      	move.l 464(sp),-(sp)
    471e:	2f2f 0056      	move.l 86(sp),-(sp)
    4722:	4eba 248e      	jsr 6bb2 <TestRow>(pc)
    4726:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    472a:	702a           	moveq #42,d0
    472c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    4730:	222f 0196      	move.l 406(sp),d1
    4734:	2001           	move.l d1,d0
    4736:	d080           	add.l d0,d0
    4738:	d081           	add.l d1,d0
    473a:	2200           	move.l d0,d1
    473c:	e789           	lsl.l #3,d1
    473e:	2041           	movea.l d1,a0
    4740:	91c0           	suba.l d0,a0
    4742:	41e8 001b      	lea 27(a0),a0
    4746:	7000           	moveq #0,d0
    4748:	302f 01c6      	move.w 454(sp),d0
    474c:	2f08           	move.l a0,-(sp)
    474e:	2f00           	move.l d0,-(sp)
    4750:	2f2f 01d0      	move.l 464(sp),-(sp)
    4754:	2f2f 0056      	move.l 86(sp),-(sp)
    4758:	4eba 2458      	jsr 6bb2 <TestRow>(pc)
    475c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4760:	722a           	moveq #42,d1
    4762:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4766:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    476a:	222f 0196      	move.l 406(sp),d1
    476e:	2001           	move.l d1,d0
    4770:	d080           	add.l d0,d0
    4772:	d081           	add.l d1,d0
    4774:	2200           	move.l d0,d1
    4776:	e789           	lsl.l #3,d1
    4778:	2041           	movea.l d1,a0
    477a:	91c0           	suba.l d0,a0
    477c:	41e8 001c      	lea 28(a0),a0
    4780:	7000           	moveq #0,d0
    4782:	302f 01c6      	move.w 454(sp),d0
    4786:	2f08           	move.l a0,-(sp)
    4788:	2f00           	move.l d0,-(sp)
    478a:	2f2f 01d0      	move.l 464(sp),-(sp)
    478e:	2f2f 0056      	move.l 86(sp),-(sp)
    4792:	4eba 241e      	jsr 6bb2 <TestRow>(pc)
    4796:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    479a:	702a           	moveq #42,d0
    479c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    47a0:	222f 0196      	move.l 406(sp),d1
    47a4:	2001           	move.l d1,d0
    47a6:	d080           	add.l d0,d0
    47a8:	d081           	add.l d1,d0
    47aa:	2200           	move.l d0,d1
    47ac:	e789           	lsl.l #3,d1
    47ae:	2041           	movea.l d1,a0
    47b0:	91c0           	suba.l d0,a0
    47b2:	41e8 001d      	lea 29(a0),a0
    47b6:	7000           	moveq #0,d0
    47b8:	302f 01c6      	move.w 454(sp),d0
    47bc:	2f08           	move.l a0,-(sp)
    47be:	2f00           	move.l d0,-(sp)
    47c0:	2f2f 01d0      	move.l 464(sp),-(sp)
    47c4:	2f2f 0056      	move.l 86(sp),-(sp)
    47c8:	4eba 23e8      	jsr 6bb2 <TestRow>(pc)
    47cc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    47d0:	722a           	moveq #42,d1
    47d2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    47d6:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    47da:	222f 0196      	move.l 406(sp),d1
    47de:	2001           	move.l d1,d0
    47e0:	d080           	add.l d0,d0
    47e2:	d081           	add.l d1,d0
    47e4:	2200           	move.l d0,d1
    47e6:	e789           	lsl.l #3,d1
    47e8:	2041           	movea.l d1,a0
    47ea:	91c0           	suba.l d0,a0
    47ec:	41e8 001c      	lea 28(a0),a0
    47f0:	7000           	moveq #0,d0
    47f2:	302f 01c6      	move.w 454(sp),d0
    47f6:	2f08           	move.l a0,-(sp)
    47f8:	2f00           	move.l d0,-(sp)
    47fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    47fe:	2f2f 0056      	move.l 86(sp),-(sp)
    4802:	4eba 23ae      	jsr 6bb2 <TestRow>(pc)
    4806:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    480a:	702a           	moveq #42,d0
    480c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    4810:	222f 0196      	move.l 406(sp),d1
    4814:	2001           	move.l d1,d0
    4816:	d080           	add.l d0,d0
    4818:	d081           	add.l d1,d0
    481a:	2200           	move.l d0,d1
    481c:	e789           	lsl.l #3,d1
    481e:	2041           	movea.l d1,a0
    4820:	91c0           	suba.l d0,a0
    4822:	41e8 001d      	lea 29(a0),a0
    4826:	7000           	moveq #0,d0
    4828:	302f 01c6      	move.w 454(sp),d0
    482c:	2f08           	move.l a0,-(sp)
    482e:	2f00           	move.l d0,-(sp)
    4830:	2f2f 01d0      	move.l 464(sp),-(sp)
    4834:	2f2f 0056      	move.l 86(sp),-(sp)
    4838:	4eba 2378      	jsr 6bb2 <TestRow>(pc)
    483c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4840:	722a           	moveq #42,d1
    4842:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4846:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    484a:	52af 0196      	addq.l #1,406(sp)
    484e:	700b           	moveq #11,d0
    4850:	b0af 0196      	cmp.l 406(sp),d0
    4854:	6c00 fde4      	bge.w 463a <TestZoom4Picture+0x8ea>
  }

  TestRow( valsupposed, valactual, mask, 269);
    4858:	7000           	moveq #0,d0
    485a:	302f 01c6      	move.w 454(sp),d0
    485e:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4862:	2f00           	move.l d0,-(sp)
    4864:	2f2f 01d0      	move.l 464(sp),-(sp)
    4868:	2f2f 0056      	move.l 86(sp),-(sp)
    486c:	4eba 2344      	jsr 6bb2 <TestRow>(pc)
    4870:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4874:	722a           	moveq #42,d1
    4876:	d3af 01c8      	add.l d1,456(sp)
  
  tmp = source;
    487a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4880:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4886:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    488c:	4878 0001      	pea 1 <_start+0x1>
    4890:	4878 0004      	pea 4 <_start+0x4>
    4894:	2f2f 0056      	move.l 86(sp),-(sp)
    4898:	2f2f 006a      	move.l 106(sp),-(sp)
    489c:	4eba d26a      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    48a0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    48a4:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    48aa:	2c40           	movea.l d0,a6
    48ac:	4eae ff1c      	jsr -228(a6)

  valactual = destination+2; 
    48b0:	202f 004e      	move.l 78(sp),d0
    48b4:	5880           	addq.l #4,d0
    48b6:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom5;
    48ba:	2f7c 0000 b570 	move.l #46448,74(sp)
    48c0:	004a 
  mask = 0x0000;
    48c2:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<13;i2++) {  
    48c6:	42af 018e      	clr.l 398(sp)
    48ca:	602a           	bra.s 48f6 <TestZoom4Picture+0xba6>
    TestRow( valsupposed, valactual, mask, i2);
    48cc:	7000           	moveq #0,d0
    48ce:	302f 01c6      	move.w 454(sp),d0
    48d2:	2f2f 018e      	move.l 398(sp),-(sp)
    48d6:	2f00           	move.l d0,-(sp)
    48d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    48dc:	2f2f 0056      	move.l 86(sp),-(sp)
    48e0:	4eba 22d0      	jsr 6bb2 <TestRow>(pc)
    48e4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    48e8:	722a           	moveq #42,d1
    48ea:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    48ee:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    48f2:	52af 018e      	addq.l #1,398(sp)
    48f6:	700c           	moveq #12,d0
    48f8:	b0af 018e      	cmp.l 398(sp),d0
    48fc:	6cce           	bge.s 48cc <TestZoom4Picture+0xb7c>
  }

  TestRow( valsupposed, valactual, mask, 12);   
    48fe:	7000           	moveq #0,d0
    4900:	302f 01c6      	move.w 454(sp),d0
    4904:	4878 000c      	pea c <_start+0xc>
    4908:	2f00           	move.l d0,-(sp)
    490a:	2f2f 01d0      	move.l 464(sp),-(sp)
    490e:	2f2f 0056      	move.l 86(sp),-(sp)
    4912:	4eba 229e      	jsr 6bb2 <TestRow>(pc)
    4916:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    491a:	722a           	moveq #42,d1
    491c:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 13);
    4920:	7000           	moveq #0,d0
    4922:	302f 01c6      	move.w 454(sp),d0
    4926:	4878 000d      	pea d <_start+0xd>
    492a:	2f00           	move.l d0,-(sp)
    492c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4930:	2f2f 0056      	move.l 86(sp),-(sp)
    4934:	4eba 227c      	jsr 6bb2 <TestRow>(pc)
    4938:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    493c:	702a           	moveq #42,d0
    493e:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4942:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 14);
    4946:	7000           	moveq #0,d0
    4948:	302f 01c6      	move.w 454(sp),d0
    494c:	4878 000e      	pea e <_start+0xe>
    4950:	2f00           	move.l d0,-(sp)
    4952:	2f2f 01d0      	move.l 464(sp),-(sp)
    4956:	2f2f 0056      	move.l 86(sp),-(sp)
    495a:	4eba 2256      	jsr 6bb2 <TestRow>(pc)
    495e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4962:	722a           	moveq #42,d1
    4964:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 15);
    4968:	7000           	moveq #0,d0
    496a:	302f 01c6      	move.w 454(sp),d0
    496e:	4878 000f      	pea f <_start+0xf>
    4972:	2f00           	move.l d0,-(sp)
    4974:	2f2f 01d0      	move.l 464(sp),-(sp)
    4978:	2f2f 0056      	move.l 86(sp),-(sp)
    497c:	4eba 2234      	jsr 6bb2 <TestRow>(pc)
    4980:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4984:	702a           	moveq #42,d0
    4986:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    498a:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 16);
    498e:	7000           	moveq #0,d0
    4990:	302f 01c6      	move.w 454(sp),d0
    4994:	4878 0010      	pea 10 <_start+0x10>
    4998:	2f00           	move.l d0,-(sp)
    499a:	2f2f 01d0      	move.l 464(sp),-(sp)
    499e:	2f2f 0056      	move.l 86(sp),-(sp)
    49a2:	4eba 220e      	jsr 6bb2 <TestRow>(pc)
    49a6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49aa:	722a           	moveq #42,d1
    49ac:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 17);
    49b0:	7000           	moveq #0,d0
    49b2:	302f 01c6      	move.w 454(sp),d0
    49b6:	4878 0011      	pea 11 <_start+0x11>
    49ba:	2f00           	move.l d0,-(sp)
    49bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    49c0:	2f2f 0056      	move.l 86(sp),-(sp)
    49c4:	4eba 21ec      	jsr 6bb2 <TestRow>(pc)
    49c8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49cc:	702a           	moveq #42,d0
    49ce:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    49d2:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 18);
    49d6:	7000           	moveq #0,d0
    49d8:	302f 01c6      	move.w 454(sp),d0
    49dc:	4878 0012      	pea 12 <_start+0x12>
    49e0:	2f00           	move.l d0,-(sp)
    49e2:	2f2f 01d0      	move.l 464(sp),-(sp)
    49e6:	2f2f 0056      	move.l 86(sp),-(sp)
    49ea:	4eba 21c6      	jsr 6bb2 <TestRow>(pc)
    49ee:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49f2:	722a           	moveq #42,d1
    49f4:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 19);
    49f8:	7000           	moveq #0,d0
    49fa:	302f 01c6      	move.w 454(sp),d0
    49fe:	4878 0013      	pea 13 <_start+0x13>
    4a02:	2f00           	move.l d0,-(sp)
    4a04:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a08:	2f2f 0056      	move.l 86(sp),-(sp)
    4a0c:	4eba 21a4      	jsr 6bb2 <TestRow>(pc)
    4a10:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a14:	702a           	moveq #42,d0
    4a16:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4a1a:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 20);
    4a1e:	7000           	moveq #0,d0
    4a20:	302f 01c6      	move.w 454(sp),d0
    4a24:	4878 0014      	pea 14 <_start+0x14>
    4a28:	2f00           	move.l d0,-(sp)
    4a2a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a2e:	2f2f 0056      	move.l 86(sp),-(sp)
    4a32:	4eba 217e      	jsr 6bb2 <TestRow>(pc)
    4a36:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a3a:	722a           	moveq #42,d1
    4a3c:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 21);
    4a40:	7000           	moveq #0,d0
    4a42:	302f 01c6      	move.w 454(sp),d0
    4a46:	4878 0015      	pea 15 <_start+0x15>
    4a4a:	2f00           	move.l d0,-(sp)
    4a4c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a50:	2f2f 0056      	move.l 86(sp),-(sp)
    4a54:	4eba 215c      	jsr 6bb2 <TestRow>(pc)
    4a58:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a5c:	702a           	moveq #42,d0
    4a5e:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4a62:	466f 01c6      	not.w 454(sp)


  for(int i=0;i<10;i++) {
    4a66:	42af 018a      	clr.l 394(sp)
    4a6a:	6000 0286      	bra.w 4cf2 <TestZoom4Picture+0xfa2>
    for(int i2=0;i2<13;i2++) {  
    4a6e:	42af 0186      	clr.l 390(sp)
    4a72:	6042           	bra.s 4ab6 <TestZoom4Picture+0xd66>
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    4a74:	222f 018a      	move.l 394(sp),d1
    4a78:	2001           	move.l d1,d0
    4a7a:	d080           	add.l d0,d0
    4a7c:	d081           	add.l d1,d0
    4a7e:	2200           	move.l d0,d1
    4a80:	e789           	lsl.l #3,d1
    4a82:	9280           	sub.l d0,d1
    4a84:	2041           	movea.l d1,a0
    4a86:	d1ef 0186      	adda.l 390(sp),a0
    4a8a:	41e8 0016      	lea 22(a0),a0
    4a8e:	7000           	moveq #0,d0
    4a90:	302f 01c6      	move.w 454(sp),d0
    4a94:	2f08           	move.l a0,-(sp)
    4a96:	2f00           	move.l d0,-(sp)
    4a98:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a9c:	2f2f 0056      	move.l 86(sp),-(sp)
    4aa0:	4eba 2110      	jsr 6bb2 <TestRow>(pc)
    4aa4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4aa8:	722a           	moveq #42,d1
    4aaa:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4aae:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {  
    4ab2:	52af 0186      	addq.l #1,390(sp)
    4ab6:	700c           	moveq #12,d0
    4ab8:	b0af 0186      	cmp.l 390(sp),d0
    4abc:	6cb6           	bge.s 4a74 <TestZoom4Picture+0xd24>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    4abe:	222f 018a      	move.l 394(sp),d1
    4ac2:	2001           	move.l d1,d0
    4ac4:	d080           	add.l d0,d0
    4ac6:	d081           	add.l d1,d0
    4ac8:	2200           	move.l d0,d1
    4aca:	e789           	lsl.l #3,d1
    4acc:	2041           	movea.l d1,a0
    4ace:	91c0           	suba.l d0,a0
    4ad0:	41e8 0023      	lea 35(a0),a0
    4ad4:	7000           	moveq #0,d0
    4ad6:	302f 01c6      	move.w 454(sp),d0
    4ada:	2f08           	move.l a0,-(sp)
    4adc:	2f00           	move.l d0,-(sp)
    4ade:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ae2:	2f2f 0056      	move.l 86(sp),-(sp)
    4ae6:	4eba 20ca      	jsr 6bb2 <TestRow>(pc)
    4aea:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4aee:	722a           	moveq #42,d1
    4af0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    4af4:	222f 018a      	move.l 394(sp),d1
    4af8:	2001           	move.l d1,d0
    4afa:	d080           	add.l d0,d0
    4afc:	d081           	add.l d1,d0
    4afe:	2200           	move.l d0,d1
    4b00:	e789           	lsl.l #3,d1
    4b02:	2041           	movea.l d1,a0
    4b04:	91c0           	suba.l d0,a0
    4b06:	41e8 0024      	lea 36(a0),a0
    4b0a:	7000           	moveq #0,d0
    4b0c:	302f 01c6      	move.w 454(sp),d0
    4b10:	2f08           	move.l a0,-(sp)
    4b12:	2f00           	move.l d0,-(sp)
    4b14:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b18:	2f2f 0056      	move.l 86(sp),-(sp)
    4b1c:	4eba 2094      	jsr 6bb2 <TestRow>(pc)
    4b20:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b24:	702a           	moveq #42,d0
    4b26:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b2a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    4b2e:	222f 018a      	move.l 394(sp),d1
    4b32:	2001           	move.l d1,d0
    4b34:	d080           	add.l d0,d0
    4b36:	d081           	add.l d1,d0
    4b38:	2200           	move.l d0,d1
    4b3a:	e789           	lsl.l #3,d1
    4b3c:	2041           	movea.l d1,a0
    4b3e:	91c0           	suba.l d0,a0
    4b40:	41e8 0025      	lea 37(a0),a0
    4b44:	7000           	moveq #0,d0
    4b46:	302f 01c6      	move.w 454(sp),d0
    4b4a:	2f08           	move.l a0,-(sp)
    4b4c:	2f00           	move.l d0,-(sp)
    4b4e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b52:	2f2f 0056      	move.l 86(sp),-(sp)
    4b56:	4eba 205a      	jsr 6bb2 <TestRow>(pc)
    4b5a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b5e:	722a           	moveq #42,d1
    4b60:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    4b64:	222f 018a      	move.l 394(sp),d1
    4b68:	2001           	move.l d1,d0
    4b6a:	d080           	add.l d0,d0
    4b6c:	d081           	add.l d1,d0
    4b6e:	2200           	move.l d0,d1
    4b70:	e789           	lsl.l #3,d1
    4b72:	2041           	movea.l d1,a0
    4b74:	91c0           	suba.l d0,a0
    4b76:	41e8 0026      	lea 38(a0),a0
    4b7a:	7000           	moveq #0,d0
    4b7c:	302f 01c6      	move.w 454(sp),d0
    4b80:	2f08           	move.l a0,-(sp)
    4b82:	2f00           	move.l d0,-(sp)
    4b84:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b88:	2f2f 0056      	move.l 86(sp),-(sp)
    4b8c:	4eba 2024      	jsr 6bb2 <TestRow>(pc)
    4b90:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b94:	702a           	moveq #42,d0
    4b96:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b9a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    4b9e:	222f 018a      	move.l 394(sp),d1
    4ba2:	2001           	move.l d1,d0
    4ba4:	d080           	add.l d0,d0
    4ba6:	d081           	add.l d1,d0
    4ba8:	2200           	move.l d0,d1
    4baa:	e789           	lsl.l #3,d1
    4bac:	2041           	movea.l d1,a0
    4bae:	91c0           	suba.l d0,a0
    4bb0:	41e8 0027      	lea 39(a0),a0
    4bb4:	7000           	moveq #0,d0
    4bb6:	302f 01c6      	move.w 454(sp),d0
    4bba:	2f08           	move.l a0,-(sp)
    4bbc:	2f00           	move.l d0,-(sp)
    4bbe:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bc2:	2f2f 0056      	move.l 86(sp),-(sp)
    4bc6:	4eba 1fea      	jsr 6bb2 <TestRow>(pc)
    4bca:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4bce:	722a           	moveq #42,d1
    4bd0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    4bd4:	222f 018a      	move.l 394(sp),d1
    4bd8:	2001           	move.l d1,d0
    4bda:	d080           	add.l d0,d0
    4bdc:	d081           	add.l d1,d0
    4bde:	2200           	move.l d0,d1
    4be0:	e789           	lsl.l #3,d1
    4be2:	2041           	movea.l d1,a0
    4be4:	91c0           	suba.l d0,a0
    4be6:	41e8 0028      	lea 40(a0),a0
    4bea:	7000           	moveq #0,d0
    4bec:	302f 01c6      	move.w 454(sp),d0
    4bf0:	2f08           	move.l a0,-(sp)
    4bf2:	2f00           	move.l d0,-(sp)
    4bf4:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bf8:	2f2f 0056      	move.l 86(sp),-(sp)
    4bfc:	4eba 1fb4      	jsr 6bb2 <TestRow>(pc)
    4c00:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c04:	702a           	moveq #42,d0
    4c06:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c0a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    4c0e:	222f 018a      	move.l 394(sp),d1
    4c12:	2001           	move.l d1,d0
    4c14:	d080           	add.l d0,d0
    4c16:	d081           	add.l d1,d0
    4c18:	2200           	move.l d0,d1
    4c1a:	e789           	lsl.l #3,d1
    4c1c:	2041           	movea.l d1,a0
    4c1e:	91c0           	suba.l d0,a0
    4c20:	41e8 0029      	lea 41(a0),a0
    4c24:	7000           	moveq #0,d0
    4c26:	302f 01c6      	move.w 454(sp),d0
    4c2a:	2f08           	move.l a0,-(sp)
    4c2c:	2f00           	move.l d0,-(sp)
    4c2e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c32:	2f2f 0056      	move.l 86(sp),-(sp)
    4c36:	4eba 1f7a      	jsr 6bb2 <TestRow>(pc)
    4c3a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c3e:	722a           	moveq #42,d1
    4c40:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    4c44:	222f 018a      	move.l 394(sp),d1
    4c48:	2001           	move.l d1,d0
    4c4a:	d080           	add.l d0,d0
    4c4c:	d081           	add.l d1,d0
    4c4e:	2200           	move.l d0,d1
    4c50:	e789           	lsl.l #3,d1
    4c52:	2041           	movea.l d1,a0
    4c54:	91c0           	suba.l d0,a0
    4c56:	41e8 002a      	lea 42(a0),a0
    4c5a:	7000           	moveq #0,d0
    4c5c:	302f 01c6      	move.w 454(sp),d0
    4c60:	2f08           	move.l a0,-(sp)
    4c62:	2f00           	move.l d0,-(sp)
    4c64:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c68:	2f2f 0056      	move.l 86(sp),-(sp)
    4c6c:	4eba 1f44      	jsr 6bb2 <TestRow>(pc)
    4c70:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c74:	702a           	moveq #42,d0
    4c76:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c7a:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    4c7e:	222f 018a      	move.l 394(sp),d1
    4c82:	2001           	move.l d1,d0
    4c84:	d080           	add.l d0,d0
    4c86:	d081           	add.l d1,d0
    4c88:	2200           	move.l d0,d1
    4c8a:	e789           	lsl.l #3,d1
    4c8c:	2041           	movea.l d1,a0
    4c8e:	91c0           	suba.l d0,a0
    4c90:	41e8 002b      	lea 43(a0),a0
    4c94:	7000           	moveq #0,d0
    4c96:	302f 01c6      	move.w 454(sp),d0
    4c9a:	2f08           	move.l a0,-(sp)
    4c9c:	2f00           	move.l d0,-(sp)
    4c9e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ca2:	2f2f 0056      	move.l 86(sp),-(sp)
    4ca6:	4eba 1f0a      	jsr 6bb2 <TestRow>(pc)
    4caa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4cae:	722a           	moveq #42,d1
    4cb0:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    4cb4:	222f 018a      	move.l 394(sp),d1
    4cb8:	2001           	move.l d1,d0
    4cba:	d080           	add.l d0,d0
    4cbc:	d081           	add.l d1,d0
    4cbe:	2200           	move.l d0,d1
    4cc0:	e789           	lsl.l #3,d1
    4cc2:	2041           	movea.l d1,a0
    4cc4:	91c0           	suba.l d0,a0
    4cc6:	41e8 002c      	lea 44(a0),a0
    4cca:	7000           	moveq #0,d0
    4ccc:	302f 01c6      	move.w 454(sp),d0
    4cd0:	2f08           	move.l a0,-(sp)
    4cd2:	2f00           	move.l d0,-(sp)
    4cd4:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cd8:	2f2f 0056      	move.l 86(sp),-(sp)
    4cdc:	4eba 1ed4      	jsr 6bb2 <TestRow>(pc)
    4ce0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ce4:	702a           	moveq #42,d0
    4ce6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4cea:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<10;i++) {
    4cee:	52af 018a      	addq.l #1,394(sp)
    4cf2:	7209           	moveq #9,d1
    4cf4:	b2af 018a      	cmp.l 394(sp),d1
    4cf8:	6c00 fd74      	bge.w 4a6e <TestZoom4Picture+0xd1e>
  }

  for(int i2=0;i2<13;i2++) {  
    4cfc:	42af 0182      	clr.l 386(sp)
    4d00:	6032           	bra.s 4d34 <TestZoom4Picture+0xfe4>
    TestRow( valsupposed, valactual, mask, i2+253);
    4d02:	222f 0182      	move.l 386(sp),d1
    4d06:	0681 0000 00fd 	addi.l #253,d1
    4d0c:	7000           	moveq #0,d0
    4d0e:	302f 01c6      	move.w 454(sp),d0
    4d12:	2f01           	move.l d1,-(sp)
    4d14:	2f00           	move.l d0,-(sp)
    4d16:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d1a:	2f2f 0056      	move.l 86(sp),-(sp)
    4d1e:	4eba 1e92      	jsr 6bb2 <TestRow>(pc)
    4d22:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d26:	702a           	moveq #42,d0
    4d28:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4d2c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4d30:	52af 0182      	addq.l #1,386(sp)
    4d34:	720c           	moveq #12,d1
    4d36:	b2af 0182      	cmp.l 386(sp),d1
    4d3a:	6cc6           	bge.s 4d02 <TestZoom4Picture+0xfb2>
  }

  TestRow( valsupposed, valactual, mask, 266);
    4d3c:	7000           	moveq #0,d0
    4d3e:	302f 01c6      	move.w 454(sp),d0
    4d42:	4878 010a      	pea 10a <FreeDisplay+0x2a>
    4d46:	2f00           	move.l d0,-(sp)
    4d48:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d4c:	2f2f 0056      	move.l 86(sp),-(sp)
    4d50:	4eba 1e60      	jsr 6bb2 <TestRow>(pc)
    4d54:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d58:	702a           	moveq #42,d0
    4d5a:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 267);
    4d5e:	7000           	moveq #0,d0
    4d60:	302f 01c6      	move.w 454(sp),d0
    4d64:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    4d68:	2f00           	move.l d0,-(sp)
    4d6a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d6e:	2f2f 0056      	move.l 86(sp),-(sp)
    4d72:	4eba 1e3e      	jsr 6bb2 <TestRow>(pc)
    4d76:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4d7a:	722a           	moveq #42,d1
    4d7c:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4d80:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 268);
    4d84:	7000           	moveq #0,d0
    4d86:	302f 01c6      	move.w 454(sp),d0
    4d8a:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    4d8e:	2f00           	move.l d0,-(sp)
    4d90:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d94:	2f2f 0056      	move.l 86(sp),-(sp)
    4d98:	4eba 1e18      	jsr 6bb2 <TestRow>(pc)
    4d9c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4da0:	702a           	moveq #42,d0
    4da2:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 269);
    4da6:	7000           	moveq #0,d0
    4da8:	302f 01c6      	move.w 454(sp),d0
    4dac:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    4db0:	2f00           	move.l d0,-(sp)
    4db2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4db6:	2f2f 0056      	move.l 86(sp),-(sp)
    4dba:	4eba 1df6      	jsr 6bb2 <TestRow>(pc)
    4dbe:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4dc2:	722a           	moveq #42,d1
    4dc4:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4dc8:	466f 01c6      	not.w 454(sp)

  tmp = source;
    4dcc:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4dd2:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4dd8:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    4dde:	4878 0001      	pea 1 <_start+0x1>
    4de2:	4878 0005      	pea 5 <_start+0x5>
    4de6:	2f2f 0056      	move.l 86(sp),-(sp)
    4dea:	2f2f 006a      	move.l 106(sp),-(sp)
    4dee:	4eba cd18      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    4df2:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4df6:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    4dfc:	2c40           	movea.l d0,a6
    4dfe:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4e02:	202f 004e      	move.l 78(sp),d0
    4e06:	5880           	addq.l #4,d0
    4e08:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom6;
    4e0c:	2f7c 0000 b59c 	move.l #46492,74(sp)
    4e12:	004a 
  mask = 0x0000;
    4e14:	426f 01c6      	clr.w 454(sp)
 
  for(int i2=0;i2<7;i2++) {  
    4e18:	42af 017e      	clr.l 382(sp)
    4e1c:	602a           	bra.s 4e48 <TestZoom4Picture+0x10f8>
    TestRow( valsupposed, valactual, mask, i2);
    4e1e:	7000           	moveq #0,d0
    4e20:	302f 01c6      	move.w 454(sp),d0
    4e24:	2f2f 017e      	move.l 382(sp),-(sp)
    4e28:	2f00           	move.l d0,-(sp)
    4e2a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e2e:	2f2f 0056      	move.l 86(sp),-(sp)
    4e32:	4eba 1d7e      	jsr 6bb2 <TestRow>(pc)
    4e36:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e3a:	722a           	moveq #42,d1
    4e3c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4e40:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    4e44:	52af 017e      	addq.l #1,382(sp)
    4e48:	7006           	moveq #6,d0
    4e4a:	b0af 017e      	cmp.l 382(sp),d0
    4e4e:	6cce           	bge.s 4e1e <TestZoom4Picture+0x10ce>
  }

  for(int i=0;i<6;i++) {
    4e50:	42af 017a      	clr.l 378(sp)
    4e54:	605c           	bra.s 4eb2 <TestZoom4Picture+0x1162>
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    4e56:	202f 017a      	move.l 378(sp),d0
    4e5a:	d080           	add.l d0,d0
    4e5c:	2200           	move.l d0,d1
    4e5e:	5e81           	addq.l #7,d1
    4e60:	7000           	moveq #0,d0
    4e62:	302f 01c6      	move.w 454(sp),d0
    4e66:	2f01           	move.l d1,-(sp)
    4e68:	2f00           	move.l d0,-(sp)
    4e6a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e6e:	2f2f 0056      	move.l 86(sp),-(sp)
    4e72:	4eba 1d3e      	jsr 6bb2 <TestRow>(pc)
    4e76:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e7a:	722a           	moveq #42,d1
    4e7c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    4e80:	202f 017a      	move.l 378(sp),d0
    4e84:	5880           	addq.l #4,d0
    4e86:	d080           	add.l d0,d0
    4e88:	2200           	move.l d0,d1
    4e8a:	7000           	moveq #0,d0
    4e8c:	302f 01c6      	move.w 454(sp),d0
    4e90:	2f01           	move.l d1,-(sp)
    4e92:	2f00           	move.l d0,-(sp)
    4e94:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e98:	2f2f 0056      	move.l 86(sp),-(sp)
    4e9c:	4eba 1d14      	jsr 6bb2 <TestRow>(pc)
    4ea0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ea4:	702a           	moveq #42,d0
    4ea6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4eaa:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<6;i++) {
    4eae:	52af 017a      	addq.l #1,378(sp)
    4eb2:	7205           	moveq #5,d1
    4eb4:	b2af 017a      	cmp.l 378(sp),d1
    4eb8:	6c9c           	bge.s 4e56 <TestZoom4Picture+0x1106>
  }

  for(int i=0;i<10;i++) {
    4eba:	42af 0176      	clr.l 374(sp)
    4ebe:	6000 00ce      	bra.w 4f8e <TestZoom4Picture+0x123e>
    for(int i2=0;i2<12;i2++) {  
    4ec2:	42af 0172      	clr.l 370(sp)
    4ec6:	6040           	bra.s 4f08 <TestZoom4Picture+0x11b8>
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    4ec8:	307c 0013      	movea.w #19,a0
    4ecc:	d1ef 0172      	adda.l 370(sp),a0
    4ed0:	222f 0176      	move.l 374(sp),d1
    4ed4:	2001           	move.l d1,d0
    4ed6:	d080           	add.l d0,d0
    4ed8:	d081           	add.l d1,d0
    4eda:	e788           	lsl.l #3,d0
    4edc:	2208           	move.l a0,d1
    4ede:	d280           	add.l d0,d1
    4ee0:	7000           	moveq #0,d0
    4ee2:	302f 01c6      	move.w 454(sp),d0
    4ee6:	2f01           	move.l d1,-(sp)
    4ee8:	2f00           	move.l d0,-(sp)
    4eea:	2f2f 01d0      	move.l 464(sp),-(sp)
    4eee:	2f2f 0056      	move.l 86(sp),-(sp)
    4ef2:	4eba 1cbe      	jsr 6bb2 <TestRow>(pc)
    4ef6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4efa:	702a           	moveq #42,d0
    4efc:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4f00:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {  
    4f04:	52af 0172      	addq.l #1,370(sp)
    4f08:	720b           	moveq #11,d1
    4f0a:	b2af 0172      	cmp.l 370(sp),d1
    4f0e:	6cb8           	bge.s 4ec8 <TestZoom4Picture+0x1178>
    }
    for(int i=0;i<6;i++) {
    4f10:	42af 016e      	clr.l 366(sp)
    4f14:	606c           	bra.s 4f82 <TestZoom4Picture+0x1232>
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    4f16:	222f 016e      	move.l 366(sp),d1
    4f1a:	2001           	move.l d1,d0
    4f1c:	d080           	add.l d0,d0
    4f1e:	d081           	add.l d1,d0
    4f20:	e788           	lsl.l #3,d0
    4f22:	2040           	movea.l d0,a0
    4f24:	41e8 001f      	lea 31(a0),a0
    4f28:	7000           	moveq #0,d0
    4f2a:	302f 01c6      	move.w 454(sp),d0
    4f2e:	2f08           	move.l a0,-(sp)
    4f30:	2f00           	move.l d0,-(sp)
    4f32:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f36:	2f2f 0056      	move.l 86(sp),-(sp)
    4f3a:	4eba 1c76      	jsr 6bb2 <TestRow>(pc)
    4f3e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4f42:	702a           	moveq #42,d0
    4f44:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    4f48:	222f 016e      	move.l 366(sp),d1
    4f4c:	2001           	move.l d1,d0
    4f4e:	d080           	add.l d0,d0
    4f50:	d081           	add.l d1,d0
    4f52:	e788           	lsl.l #3,d0
    4f54:	2040           	movea.l d0,a0
    4f56:	41e8 0020      	lea 32(a0),a0
    4f5a:	7000           	moveq #0,d0
    4f5c:	302f 01c6      	move.w 454(sp),d0
    4f60:	2f08           	move.l a0,-(sp)
    4f62:	2f00           	move.l d0,-(sp)
    4f64:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f68:	2f2f 0056      	move.l 86(sp),-(sp)
    4f6c:	4eba 1c44      	jsr 6bb2 <TestRow>(pc)
    4f70:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4f74:	722a           	moveq #42,d1
    4f76:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4f7a:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<6;i++) {
    4f7e:	52af 016e      	addq.l #1,366(sp)
    4f82:	7005           	moveq #5,d0
    4f84:	b0af 016e      	cmp.l 366(sp),d0
    4f88:	6c8c           	bge.s 4f16 <TestZoom4Picture+0x11c6>
  for(int i=0;i<10;i++) {
    4f8a:	52af 0176      	addq.l #1,374(sp)
    4f8e:	7209           	moveq #9,d1
    4f90:	b2af 0176      	cmp.l 374(sp),d1
    4f94:	6c00 ff2c      	bge.w 4ec2 <TestZoom4Picture+0x1172>
    }
  }

  for(int i2=0;i2<11;i2++) {  
    4f98:	42af 016a      	clr.l 362(sp)
    4f9c:	6032           	bra.s 4fd0 <TestZoom4Picture+0x1280>
    TestRow( valsupposed, valactual, mask, 258+i2);
    4f9e:	222f 016a      	move.l 362(sp),d1
    4fa2:	0681 0000 0102 	addi.l #258,d1
    4fa8:	7000           	moveq #0,d0
    4faa:	302f 01c6      	move.w 454(sp),d0
    4fae:	2f01           	move.l d1,-(sp)
    4fb0:	2f00           	move.l d0,-(sp)
    4fb2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4fb6:	2f2f 0056      	move.l 86(sp),-(sp)
    4fba:	4eba 1bf6      	jsr 6bb2 <TestRow>(pc)
    4fbe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4fc2:	702a           	moveq #42,d0
    4fc4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4fc8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {  
    4fcc:	52af 016a      	addq.l #1,362(sp)
    4fd0:	720a           	moveq #10,d1
    4fd2:	b2af 016a      	cmp.l 362(sp),d1
    4fd6:	6cc6           	bge.s 4f9e <TestZoom4Picture+0x124e>
  }

  tmp = source;
    4fd8:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    4fde:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    4fe4:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    4fea:	4878 0001      	pea 1 <_start+0x1>
    4fee:	4878 0006      	pea 6 <_start+0x6>
    4ff2:	2f2f 0056      	move.l 86(sp),-(sp)
    4ff6:	2f2f 006a      	move.l 106(sp),-(sp)
    4ffa:	4eba cb0c      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    4ffe:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5002:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    5008:	2c40           	movea.l d0,a6
    500a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    500e:	202f 004e      	move.l 78(sp),d0
    5012:	5880           	addq.l #4,d0
    5014:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom7;
    5018:	2f7c 0000 b5c8 	move.l #46536,74(sp)
    501e:	004a 
  mask = 0x0000;
    5020:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5024:	7000           	moveq #0,d0
    5026:	302f 01c6      	move.w 454(sp),d0
    502a:	42a7           	clr.l -(sp)
    502c:	2f00           	move.l d0,-(sp)
    502e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5032:	2f2f 0056      	move.l 86(sp),-(sp)
    5036:	4eba 1b7a      	jsr 6bb2 <TestRow>(pc)
    503a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    503e:	722a           	moveq #42,d1
    5040:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5044:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    5048:	42af 0166      	clr.l 358(sp)
    504c:	605c           	bra.s 50aa <TestZoom4Picture+0x135a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    504e:	202f 0166      	move.l 358(sp),d0
    5052:	d080           	add.l d0,d0
    5054:	2200           	move.l d0,d1
    5056:	5281           	addq.l #1,d1
    5058:	7000           	moveq #0,d0
    505a:	302f 01c6      	move.w 454(sp),d0
    505e:	2f01           	move.l d1,-(sp)
    5060:	2f00           	move.l d0,-(sp)
    5062:	2f2f 01d0      	move.l 464(sp),-(sp)
    5066:	2f2f 0056      	move.l 86(sp),-(sp)
    506a:	4eba 1b46      	jsr 6bb2 <TestRow>(pc)
    506e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5072:	702a           	moveq #42,d0
    5074:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    5078:	202f 0166      	move.l 358(sp),d0
    507c:	5280           	addq.l #1,d0
    507e:	d080           	add.l d0,d0
    5080:	2200           	move.l d0,d1
    5082:	7000           	moveq #0,d0
    5084:	302f 01c6      	move.w 454(sp),d0
    5088:	2f01           	move.l d1,-(sp)
    508a:	2f00           	move.l d0,-(sp)
    508c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5090:	2f2f 0056      	move.l 86(sp),-(sp)
    5094:	4eba 1b1c      	jsr 6bb2 <TestRow>(pc)
    5098:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    509c:	722a           	moveq #42,d1
    509e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    50a2:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    50a6:	52af 0166      	addq.l #1,358(sp)
    50aa:	7006           	moveq #6,d0
    50ac:	b0af 0166      	cmp.l 358(sp),d0
    50b0:	6c9c           	bge.s 504e <TestZoom4Picture+0x12fe>
  }

  for(int i=0;i<10;i++) {
    50b2:	42af 0162      	clr.l 354(sp)
    50b6:	6000 00d4      	bra.w 518c <TestZoom4Picture+0x143c>
    for(int i2=0;i2<11;i2++) {  
    50ba:	42af 015e      	clr.l 350(sp)
    50be:	6042           	bra.s 5102 <TestZoom4Picture+0x13b2>
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    50c0:	307c 000f      	movea.w #15,a0
    50c4:	d1ef 015e      	adda.l 350(sp),a0
    50c8:	222f 0162      	move.l 354(sp),d1
    50cc:	2001           	move.l d1,d0
    50ce:	d080           	add.l d0,d0
    50d0:	d081           	add.l d1,d0
    50d2:	e788           	lsl.l #3,d0
    50d4:	d081           	add.l d1,d0
    50d6:	2208           	move.l a0,d1
    50d8:	d280           	add.l d0,d1
    50da:	7000           	moveq #0,d0
    50dc:	302f 01c6      	move.w 454(sp),d0
    50e0:	2f01           	move.l d1,-(sp)
    50e2:	2f00           	move.l d0,-(sp)
    50e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    50e8:	2f2f 0056      	move.l 86(sp),-(sp)
    50ec:	4eba 1ac4      	jsr 6bb2 <TestRow>(pc)
    50f0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    50f4:	722a           	moveq #42,d1
    50f6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    50fa:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {  
    50fe:	52af 015e      	addq.l #1,350(sp)
    5102:	700a           	moveq #10,d0
    5104:	b0af 015e      	cmp.l 350(sp),d0
    5108:	6cb6           	bge.s 50c0 <TestZoom4Picture+0x1370>
    }
    for(int i=0;i<7;i++) {
    510a:	42af 015a      	clr.l 346(sp)
    510e:	6070           	bra.s 5180 <TestZoom4Picture+0x1430>
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
    5136:	4eba 1a7a      	jsr 6bb2 <TestRow>(pc)
    513a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    513e:	722a           	moveq #42,d1
    5140:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    5144:	222f 015a      	move.l 346(sp),d1
    5148:	2001           	move.l d1,d0
    514a:	d080           	add.l d0,d0
    514c:	d081           	add.l d1,d0
    514e:	e788           	lsl.l #3,d0
    5150:	2040           	movea.l d0,a0
    5152:	d1c1           	adda.l d1,a0
    5154:	41e8 001a      	lea 26(a0),a0
    5158:	7000           	moveq #0,d0
    515a:	302f 01c6      	move.w 454(sp),d0
    515e:	2f08           	move.l a0,-(sp)
    5160:	2f00           	move.l d0,-(sp)
    5162:	2f2f 01d0      	move.l 464(sp),-(sp)
    5166:	2f2f 0056      	move.l 86(sp),-(sp)
    516a:	4eba 1a46      	jsr 6bb2 <TestRow>(pc)
    516e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5172:	702a           	moveq #42,d0
    5174:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5178:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<7;i++) {
    517c:	52af 015a      	addq.l #1,346(sp)
    5180:	7206           	moveq #6,d1
    5182:	b2af 015a      	cmp.l 346(sp),d1
    5186:	6c88           	bge.s 5110 <TestZoom4Picture+0x13c0>
  for(int i=0;i<10;i++) {
    5188:	52af 0162      	addq.l #1,354(sp)
    518c:	7009           	moveq #9,d0
    518e:	b0af 0162      	cmp.l 354(sp),d0
    5192:	6c00 ff26      	bge.w 50ba <TestZoom4Picture+0x136a>
    }
  }

  for(int i2=0;i2<5;i2++) {  
    5196:	42af 0156      	clr.l 342(sp)
    519a:	6032           	bra.s 51ce <TestZoom4Picture+0x147e>
    TestRow( valsupposed, valactual, mask, 256+i2);
    519c:	222f 0156      	move.l 342(sp),d1
    51a0:	0681 0000 0100 	addi.l #256,d1
    51a6:	7000           	moveq #0,d0
    51a8:	302f 01c6      	move.w 454(sp),d0
    51ac:	2f01           	move.l d1,-(sp)
    51ae:	2f00           	move.l d0,-(sp)
    51b0:	2f2f 01d0      	move.l 464(sp),-(sp)
    51b4:	2f2f 0056      	move.l 86(sp),-(sp)
    51b8:	4eba 19f8      	jsr 6bb2 <TestRow>(pc)
    51bc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    51c0:	722a           	moveq #42,d1
    51c2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    51c6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    51ca:	52af 0156      	addq.l #1,342(sp)
    51ce:	7004           	moveq #4,d0
    51d0:	b0af 0156      	cmp.l 342(sp),d0
    51d4:	6cc6           	bge.s 519c <TestZoom4Picture+0x144c>
  }

  tmp = source;
    51d6:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    51dc:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    51e2:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    51e8:	4878 0001      	pea 1 <_start+0x1>
    51ec:	4878 0007      	pea 7 <_start+0x7>
    51f0:	2f2f 0056      	move.l 86(sp),-(sp)
    51f4:	2f2f 006a      	move.l 106(sp),-(sp)
    51f8:	4eba c90e      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    51fc:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5200:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    5206:	2c40           	movea.l d0,a6
    5208:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    520c:	222f 004e      	move.l 78(sp),d1
    5210:	5881           	addq.l #4,d1
    5212:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom8;
    5216:	2f7c 0000 b5f4 	move.l #46580,74(sp)
    521c:	004a 
  mask = 0xffff;
    521e:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5224:	7000           	moveq #0,d0
    5226:	302f 01c6      	move.w 454(sp),d0
    522a:	42a7           	clr.l -(sp)
    522c:	2f00           	move.l d0,-(sp)
    522e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5232:	2f2f 0056      	move.l 86(sp),-(sp)
    5236:	4eba 197a      	jsr 6bb2 <TestRow>(pc)
    523a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    523e:	702a           	moveq #42,d0
    5240:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5244:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5248:	42af 0152      	clr.l 338(sp)
    524c:	605c           	bra.s 52aa <TestZoom4Picture+0x155a>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    524e:	202f 0152      	move.l 338(sp),d0
    5252:	d080           	add.l d0,d0
    5254:	2200           	move.l d0,d1
    5256:	5281           	addq.l #1,d1
    5258:	7000           	moveq #0,d0
    525a:	302f 01c6      	move.w 454(sp),d0
    525e:	2f01           	move.l d1,-(sp)
    5260:	2f00           	move.l d0,-(sp)
    5262:	2f2f 01d0      	move.l 464(sp),-(sp)
    5266:	2f2f 0056      	move.l 86(sp),-(sp)
    526a:	4eba 1946      	jsr 6bb2 <TestRow>(pc)
    526e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5272:	722a           	moveq #42,d1
    5274:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    5278:	202f 0152      	move.l 338(sp),d0
    527c:	5280           	addq.l #1,d0
    527e:	d080           	add.l d0,d0
    5280:	2200           	move.l d0,d1
    5282:	7000           	moveq #0,d0
    5284:	302f 01c6      	move.w 454(sp),d0
    5288:	2f01           	move.l d1,-(sp)
    528a:	2f00           	move.l d0,-(sp)
    528c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5290:	2f2f 0056      	move.l 86(sp),-(sp)
    5294:	4eba 191c      	jsr 6bb2 <TestRow>(pc)
    5298:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    529c:	702a           	moveq #42,d0
    529e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    52a2:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    52a6:	52af 0152      	addq.l #1,338(sp)
    52aa:	7204           	moveq #4,d1
    52ac:	b2af 0152      	cmp.l 338(sp),d1
    52b0:	6c9c           	bge.s 524e <TestZoom4Picture+0x14fe>
  }

  for(int i=0;i<9;i++) {
    52b2:	42af 014e      	clr.l 334(sp)
    52b6:	6000 00f0      	bra.w 53a8 <TestZoom4Picture+0x1658>
    for(int i2=0;i2<10;i2++) {  
    52ba:	42af 014a      	clr.l 330(sp)
    52be:	6046           	bra.s 5306 <TestZoom4Picture+0x15b6>
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    52c0:	307c 000b      	movea.w #11,a0
    52c4:	d1ef 014a      	adda.l 330(sp),a0
    52c8:	222f 014e      	move.l 334(sp),d1
    52cc:	2001           	move.l d1,d0
    52ce:	d080           	add.l d0,d0
    52d0:	d081           	add.l d1,d0
    52d2:	d080           	add.l d0,d0
    52d4:	d080           	add.l d0,d0
    52d6:	d081           	add.l d1,d0
    52d8:	d080           	add.l d0,d0
    52da:	2208           	move.l a0,d1
    52dc:	d280           	add.l d0,d1
    52de:	7000           	moveq #0,d0
    52e0:	302f 01c6      	move.w 454(sp),d0
    52e4:	2f01           	move.l d1,-(sp)
    52e6:	2f00           	move.l d0,-(sp)
    52e8:	2f2f 01d0      	move.l 464(sp),-(sp)
    52ec:	2f2f 0056      	move.l 86(sp),-(sp)
    52f0:	4eba 18c0      	jsr 6bb2 <TestRow>(pc)
    52f4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    52f8:	702a           	moveq #42,d0
    52fa:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    52fe:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {  
    5302:	52af 014a      	addq.l #1,330(sp)
    5306:	7209           	moveq #9,d1
    5308:	b2af 014a      	cmp.l 330(sp),d1
    530c:	6cb2           	bge.s 52c0 <TestZoom4Picture+0x1570>
    }
    for(int i2=0;i2<8;i2++) {
    530e:	42af 0146      	clr.l 326(sp)
    5312:	6000 0086      	bra.w 539a <TestZoom4Picture+0x164a>
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    5316:	222f 014e      	move.l 334(sp),d1
    531a:	2001           	move.l d1,d0
    531c:	d080           	add.l d0,d0
    531e:	d081           	add.l d1,d0
    5320:	d080           	add.l d0,d0
    5322:	d080           	add.l d0,d0
    5324:	d081           	add.l d1,d0
    5326:	d080           	add.l d0,d0
    5328:	2040           	movea.l d0,a0
    532a:	41e8 0015      	lea 21(a0),a0
    532e:	2208           	move.l a0,d1
    5330:	d2af 0146      	add.l 326(sp),d1
    5334:	7000           	moveq #0,d0
    5336:	302f 01c6      	move.w 454(sp),d0
    533a:	2f01           	move.l d1,-(sp)
    533c:	2f00           	move.l d0,-(sp)
    533e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5342:	2f2f 0056      	move.l 86(sp),-(sp)
    5346:	4eba 186a      	jsr 6bb2 <TestRow>(pc)
    534a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    534e:	702a           	moveq #42,d0
    5350:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    5354:	222f 014e      	move.l 334(sp),d1
    5358:	2001           	move.l d1,d0
    535a:	d080           	add.l d0,d0
    535c:	d081           	add.l d1,d0
    535e:	d080           	add.l d0,d0
    5360:	d080           	add.l d0,d0
    5362:	d081           	add.l d1,d0
    5364:	d080           	add.l d0,d0
    5366:	2040           	movea.l d0,a0
    5368:	41e8 0015      	lea 21(a0),a0
    536c:	2208           	move.l a0,d1
    536e:	d2af 0146      	add.l 326(sp),d1
    5372:	7000           	moveq #0,d0
    5374:	302f 01c6      	move.w 454(sp),d0
    5378:	2f01           	move.l d1,-(sp)
    537a:	2f00           	move.l d0,-(sp)
    537c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5380:	2f2f 0056      	move.l 86(sp),-(sp)
    5384:	4eba 182c      	jsr 6bb2 <TestRow>(pc)
    5388:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    538c:	722a           	moveq #42,d1
    538e:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5392:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {
    5396:	52af 0146      	addq.l #1,326(sp)
    539a:	7007           	moveq #7,d0
    539c:	b0af 0146      	cmp.l 326(sp),d0
    53a0:	6c00 ff74      	bge.w 5316 <TestZoom4Picture+0x15c6>
  for(int i=0;i<9;i++) {
    53a4:	52af 014e      	addq.l #1,334(sp)
    53a8:	7208           	moveq #8,d1
    53aa:	b2af 014e      	cmp.l 334(sp),d1
    53ae:	6c00 ff0a      	bge.w 52ba <TestZoom4Picture+0x156a>
    }
  }

  for(int i2=0;i2<10;i2++) {  
    53b2:	42af 0142      	clr.l 322(sp)
    53b6:	6032           	bra.s 53ea <TestZoom4Picture+0x169a>
    TestRow( valsupposed, valactual, mask, 245+i2);
    53b8:	222f 0142      	move.l 322(sp),d1
    53bc:	0681 0000 00f5 	addi.l #245,d1
    53c2:	7000           	moveq #0,d0
    53c4:	302f 01c6      	move.w 454(sp),d0
    53c8:	2f01           	move.l d1,-(sp)
    53ca:	2f00           	move.l d0,-(sp)
    53cc:	2f2f 01d0      	move.l 464(sp),-(sp)
    53d0:	2f2f 0056      	move.l 86(sp),-(sp)
    53d4:	4eba 17dc      	jsr 6bb2 <TestRow>(pc)
    53d8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    53dc:	702a           	moveq #42,d0
    53de:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    53e2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {  
    53e6:	52af 0142      	addq.l #1,322(sp)
    53ea:	7209           	moveq #9,d1
    53ec:	b2af 0142      	cmp.l 322(sp),d1
    53f0:	6cc6           	bge.s 53b8 <TestZoom4Picture+0x1668>
  }
  for(int i=0;i<7;i++) {
    53f2:	42af 013e      	clr.l 318(sp)
    53f6:	6064           	bra.s 545c <TestZoom4Picture+0x170c>
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    53f8:	202f 013e      	move.l 318(sp),d0
    53fc:	d080           	add.l d0,d0
    53fe:	2200           	move.l d0,d1
    5400:	0681 0000 00ff 	addi.l #255,d1
    5406:	7000           	moveq #0,d0
    5408:	302f 01c6      	move.w 454(sp),d0
    540c:	2f01           	move.l d1,-(sp)
    540e:	2f00           	move.l d0,-(sp)
    5410:	2f2f 01d0      	move.l 464(sp),-(sp)
    5414:	2f2f 0056      	move.l 86(sp),-(sp)
    5418:	4eba 1798      	jsr 6bb2 <TestRow>(pc)
    541c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5420:	702a           	moveq #42,d0
    5422:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    5426:	202f 013e      	move.l 318(sp),d0
    542a:	0680 0000 0080 	addi.l #128,d0
    5430:	d080           	add.l d0,d0
    5432:	2200           	move.l d0,d1
    5434:	7000           	moveq #0,d0
    5436:	302f 01c6      	move.w 454(sp),d0
    543a:	2f01           	move.l d1,-(sp)
    543c:	2f00           	move.l d0,-(sp)
    543e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5442:	2f2f 0056      	move.l 86(sp),-(sp)
    5446:	4eba 176a      	jsr 6bb2 <TestRow>(pc)
    544a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    544e:	722a           	moveq #42,d1
    5450:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5454:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    5458:	52af 013e      	addq.l #1,318(sp)
    545c:	7006           	moveq #6,d0
    545e:	b0af 013e      	cmp.l 318(sp),d0
    5462:	6c94           	bge.s 53f8 <TestZoom4Picture+0x16a8>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5464:	7000           	moveq #0,d0
    5466:	302f 01c6      	move.w 454(sp),d0
    546a:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    546e:	2f00           	move.l d0,-(sp)
    5470:	2f2f 01d0      	move.l 464(sp),-(sp)
    5474:	2f2f 0056      	move.l 86(sp),-(sp)
    5478:	4eba 1738      	jsr 6bb2 <TestRow>(pc)
    547c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5480:	722a           	moveq #42,d1
    5482:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5486:	466f 01c6      	not.w 454(sp)
 
  tmp = source;
    548a:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5490:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5496:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    549c:	4878 0001      	pea 1 <_start+0x1>
    54a0:	4878 0008      	pea 8 <_start+0x8>
    54a4:	2f2f 0056      	move.l 86(sp),-(sp)
    54a8:	2f2f 006a      	move.l 106(sp),-(sp)
    54ac:	4eba c65a      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    54b0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    54b4:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    54ba:	2c40           	movea.l d0,a6
    54bc:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    54c0:	202f 004e      	move.l 78(sp),d0
    54c4:	5880           	addq.l #4,d0
    54c6:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom9;
    54ca:	2f7c 0000 b620 	move.l #46624,74(sp)
    54d0:	004a 
  mask = 0x0000;
    54d2:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    54d6:	7000           	moveq #0,d0
    54d8:	302f 01c6      	move.w 454(sp),d0
    54dc:	42a7           	clr.l -(sp)
    54de:	2f00           	move.l d0,-(sp)
    54e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    54e4:	2f2f 0056      	move.l 86(sp),-(sp)
    54e8:	4eba 16c8      	jsr 6bb2 <TestRow>(pc)
    54ec:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    54f0:	722a           	moveq #42,d1
    54f2:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    54f6:	466f 01c6      	not.w 454(sp)
  
  for(int i=0;i<3;i++) {
    54fa:	42af 013a      	clr.l 314(sp)
    54fe:	605c           	bra.s 555c <TestZoom4Picture+0x180c>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    5500:	202f 013a      	move.l 314(sp),d0
    5504:	d080           	add.l d0,d0
    5506:	2200           	move.l d0,d1
    5508:	5281           	addq.l #1,d1
    550a:	7000           	moveq #0,d0
    550c:	302f 01c6      	move.w 454(sp),d0
    5510:	2f01           	move.l d1,-(sp)
    5512:	2f00           	move.l d0,-(sp)
    5514:	2f2f 01d0      	move.l 464(sp),-(sp)
    5518:	2f2f 0056      	move.l 86(sp),-(sp)
    551c:	4eba 1694      	jsr 6bb2 <TestRow>(pc)
    5520:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5524:	702a           	moveq #42,d0
    5526:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    552a:	202f 013a      	move.l 314(sp),d0
    552e:	5280           	addq.l #1,d0
    5530:	d080           	add.l d0,d0
    5532:	2200           	move.l d0,d1
    5534:	7000           	moveq #0,d0
    5536:	302f 01c6      	move.w 454(sp),d0
    553a:	2f01           	move.l d1,-(sp)
    553c:	2f00           	move.l d0,-(sp)
    553e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5542:	2f2f 0056      	move.l 86(sp),-(sp)
    5546:	4eba 166a      	jsr 6bb2 <TestRow>(pc)
    554a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    554e:	722a           	moveq #42,d1
    5550:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5554:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    5558:	52af 013a      	addq.l #1,314(sp)
    555c:	7002           	moveq #2,d0
    555e:	b0af 013a      	cmp.l 314(sp),d0
    5562:	6c9c           	bge.s 5500 <TestZoom4Picture+0x17b0>
  }

  for(int i=0;i<9;i++) {
    5564:	42af 0136      	clr.l 310(sp)
    5568:	6000 00ea      	bra.w 5654 <TestZoom4Picture+0x1904>
    for(int i2=0;i2<9;i2++) {  
    556c:	42af 0132      	clr.l 306(sp)
    5570:	6044           	bra.s 55b6 <TestZoom4Picture+0x1866>
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    5572:	307c 000b      	movea.w #11,a0
    5576:	d1ef 0132      	adda.l 306(sp),a0
    557a:	222f 0136      	move.l 310(sp),d1
    557e:	2001           	move.l d1,d0
    5580:	d080           	add.l d0,d0
    5582:	d081           	add.l d1,d0
    5584:	2200           	move.l d0,d1
    5586:	e789           	lsl.l #3,d1
    5588:	d081           	add.l d1,d0
    558a:	2208           	move.l a0,d1
    558c:	d280           	add.l d0,d1
    558e:	7000           	moveq #0,d0
    5590:	302f 01c6      	move.w 454(sp),d0
    5594:	2f01           	move.l d1,-(sp)
    5596:	2f00           	move.l d0,-(sp)
    5598:	2f2f 01d0      	move.l 464(sp),-(sp)
    559c:	2f2f 0056      	move.l 86(sp),-(sp)
    55a0:	4eba 1610      	jsr 6bb2 <TestRow>(pc)
    55a4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    55a8:	722a           	moveq #42,d1
    55aa:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    55ae:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {  
    55b2:	52af 0132      	addq.l #1,306(sp)
    55b6:	7008           	moveq #8,d0
    55b8:	b0af 0132      	cmp.l 306(sp),d0
    55bc:	6cb4           	bge.s 5572 <TestZoom4Picture+0x1822>
    }
    
    for(int i2=0;i2<9;i2++) {
    55be:	42af 012e      	clr.l 302(sp)
    55c2:	6000 0082      	bra.w 5646 <TestZoom4Picture+0x18f6>
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    55c6:	222f 0136      	move.l 310(sp),d1
    55ca:	2001           	move.l d1,d0
    55cc:	d080           	add.l d0,d0
    55ce:	d081           	add.l d1,d0
    55d0:	2200           	move.l d0,d1
    55d2:	e789           	lsl.l #3,d1
    55d4:	2040           	movea.l d0,a0
    55d6:	d1c1           	adda.l d1,a0
    55d8:	41e8 0014      	lea 20(a0),a0
    55dc:	2208           	move.l a0,d1
    55de:	d2af 012e      	add.l 302(sp),d1
    55e2:	7000           	moveq #0,d0
    55e4:	302f 01c6      	move.w 454(sp),d0
    55e8:	2f01           	move.l d1,-(sp)
    55ea:	2f00           	move.l d0,-(sp)
    55ec:	2f2f 01d0      	move.l 464(sp),-(sp)
    55f0:	2f2f 0056      	move.l 86(sp),-(sp)
    55f4:	4eba 15bc      	jsr 6bb2 <TestRow>(pc)
    55f8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    55fc:	722a           	moveq #42,d1
    55fe:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    5602:	222f 0136      	move.l 310(sp),d1
    5606:	2001           	move.l d1,d0
    5608:	d080           	add.l d0,d0
    560a:	d081           	add.l d1,d0
    560c:	2200           	move.l d0,d1
    560e:	e789           	lsl.l #3,d1
    5610:	2040           	movea.l d0,a0
    5612:	d1c1           	adda.l d1,a0
    5614:	41e8 0015      	lea 21(a0),a0
    5618:	2208           	move.l a0,d1
    561a:	d2af 012e      	add.l 302(sp),d1
    561e:	7000           	moveq #0,d0
    5620:	302f 01c6      	move.w 454(sp),d0
    5624:	2f01           	move.l d1,-(sp)
    5626:	2f00           	move.l d0,-(sp)
    5628:	2f2f 01d0      	move.l 464(sp),-(sp)
    562c:	2f2f 0056      	move.l 86(sp),-(sp)
    5630:	4eba 1580      	jsr 6bb2 <TestRow>(pc)
    5634:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5638:	702a           	moveq #42,d0
    563a:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    563e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {
    5642:	52af 012e      	addq.l #1,302(sp)
    5646:	7208           	moveq #8,d1
    5648:	b2af 012e      	cmp.l 302(sp),d1
    564c:	6c00 ff78      	bge.w 55c6 <TestZoom4Picture+0x1876>
  for(int i=0;i<9;i++) {
    5650:	52af 0136      	addq.l #1,310(sp)
    5654:	7008           	moveq #8,d0
    5656:	b0af 0136      	cmp.l 310(sp),d0
    565a:	6c00 ff10      	bge.w 556c <TestZoom4Picture+0x181c>
    }
  }

  for(int i2=0;i2<9;i2++) {  
    565e:	42af 012a      	clr.l 298(sp)
    5662:	6032           	bra.s 5696 <TestZoom4Picture+0x1946>
    TestRow( valsupposed, valactual, mask, 245+i2);
    5664:	222f 012a      	move.l 298(sp),d1
    5668:	0681 0000 00f5 	addi.l #245,d1
    566e:	7000           	moveq #0,d0
    5670:	302f 01c6      	move.w 454(sp),d0
    5674:	2f01           	move.l d1,-(sp)
    5676:	2f00           	move.l d0,-(sp)
    5678:	2f2f 01d0      	move.l 464(sp),-(sp)
    567c:	2f2f 0056      	move.l 86(sp),-(sp)
    5680:	4eba 1530      	jsr 6bb2 <TestRow>(pc)
    5684:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5688:	722a           	moveq #42,d1
    568a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    568e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {  
    5692:	52af 012a      	addq.l #1,298(sp)
    5696:	7008           	moveq #8,d0
    5698:	b0af 012a      	cmp.l 298(sp),d0
    569c:	6cc6           	bge.s 5664 <TestZoom4Picture+0x1914>
  }
  for(int i=0;i<5;i++) {
    569e:	42af 0126      	clr.l 294(sp)
    56a2:	6064           	bra.s 5708 <TestZoom4Picture+0x19b8>
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    56a4:	202f 0126      	move.l 294(sp),d0
    56a8:	d080           	add.l d0,d0
    56aa:	2200           	move.l d0,d1
    56ac:	0681 0000 0103 	addi.l #259,d1
    56b2:	7000           	moveq #0,d0
    56b4:	302f 01c6      	move.w 454(sp),d0
    56b8:	2f01           	move.l d1,-(sp)
    56ba:	2f00           	move.l d0,-(sp)
    56bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    56c0:	2f2f 0056      	move.l 86(sp),-(sp)
    56c4:	4eba 14ec      	jsr 6bb2 <TestRow>(pc)
    56c8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    56cc:	722a           	moveq #42,d1
    56ce:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    56d2:	202f 0126      	move.l 294(sp),d0
    56d6:	0680 0000 0082 	addi.l #130,d0
    56dc:	d080           	add.l d0,d0
    56de:	2200           	move.l d0,d1
    56e0:	7000           	moveq #0,d0
    56e2:	302f 01c6      	move.w 454(sp),d0
    56e6:	2f01           	move.l d1,-(sp)
    56e8:	2f00           	move.l d0,-(sp)
    56ea:	2f2f 01d0      	move.l 464(sp),-(sp)
    56ee:	2f2f 0056      	move.l 86(sp),-(sp)
    56f2:	4eba 14be      	jsr 6bb2 <TestRow>(pc)
    56f6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    56fa:	702a           	moveq #42,d0
    56fc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5700:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5704:	52af 0126      	addq.l #1,294(sp)
    5708:	7204           	moveq #4,d1
    570a:	b2af 0126      	cmp.l 294(sp),d1
    570e:	6c94           	bge.s 56a4 <TestZoom4Picture+0x1954>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5710:	7000           	moveq #0,d0
    5712:	302f 01c6      	move.w 454(sp),d0
    5716:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    571a:	2f00           	move.l d0,-(sp)
    571c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5720:	2f2f 0056      	move.l 86(sp),-(sp)
    5724:	4eba 148c      	jsr 6bb2 <TestRow>(pc)
    5728:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    572c:	702a           	moveq #42,d0
    572e:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5732:	466f 01c6      	not.w 454(sp)

  tmp = source;
    5736:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    573c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5742:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    5748:	4878 0001      	pea 1 <_start+0x1>
    574c:	4878 0009      	pea 9 <_start+0x9>
    5750:	2f2f 0056      	move.l 86(sp),-(sp)
    5754:	2f2f 006a      	move.l 106(sp),-(sp)
    5758:	4eba c3ae      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    575c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5760:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    5766:	2c40           	movea.l d0,a6
    5768:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    576c:	222f 004e      	move.l 78(sp),d1
    5770:	5881           	addq.l #4,d1
    5772:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom10;
    5776:	2f7c 0000 b64c 	move.l #46668,74(sp)
    577c:	004a 

  mask = 0xffff;
    577e:	3f7c ffff 01c6 	move.w #-1,454(sp)
  TestRow( valsupposed, valactual, mask, 0);
    5784:	7000           	moveq #0,d0
    5786:	302f 01c6      	move.w 454(sp),d0
    578a:	42a7           	clr.l -(sp)
    578c:	2f00           	move.l d0,-(sp)
    578e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5792:	2f2f 0056      	move.l 86(sp),-(sp)
    5796:	4eba 141a      	jsr 6bb2 <TestRow>(pc)
    579a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    579e:	702a           	moveq #42,d0
    57a0:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    57a4:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 1);   
    57a8:	7000           	moveq #0,d0
    57aa:	302f 01c6      	move.w 454(sp),d0
    57ae:	4878 0001      	pea 1 <_start+0x1>
    57b2:	2f00           	move.l d0,-(sp)
    57b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    57b8:	2f2f 0056      	move.l 86(sp),-(sp)
    57bc:	4eba 13f4      	jsr 6bb2 <TestRow>(pc)
    57c0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    57c4:	722a           	moveq #42,d1
    57c6:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 2);
    57ca:	7000           	moveq #0,d0
    57cc:	302f 01c6      	move.w 454(sp),d0
    57d0:	4878 0002      	pea 2 <_start+0x2>
    57d4:	2f00           	move.l d0,-(sp)
    57d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    57da:	2f2f 0056      	move.l 86(sp),-(sp)
    57de:	4eba 13d2      	jsr 6bb2 <TestRow>(pc)
    57e2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    57e6:	702a           	moveq #42,d0
    57e8:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    57ec:	466f 01c6      	not.w 454(sp)

  for(int i=0;i<9;i++) {
    57f0:	42af 0122      	clr.l 290(sp)
    57f4:	6000 00e0      	bra.w 58d6 <TestZoom4Picture+0x1b86>
    for(int i2=0;i2<8;i2++) {  
    57f8:	42af 011e      	clr.l 286(sp)
    57fc:	6040           	bra.s 583e <TestZoom4Picture+0x1aee>
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    57fe:	206f 011e      	movea.l 286(sp),a0
    5802:	5688           	addq.l #3,a0
    5804:	222f 0122      	move.l 290(sp),d1
    5808:	2001           	move.l d1,d0
    580a:	e788           	lsl.l #3,d0
    580c:	9081           	sub.l d1,d0
    580e:	d080           	add.l d0,d0
    5810:	d080           	add.l d0,d0
    5812:	2208           	move.l a0,d1
    5814:	d280           	add.l d0,d1
    5816:	7000           	moveq #0,d0
    5818:	302f 01c6      	move.w 454(sp),d0
    581c:	2f01           	move.l d1,-(sp)
    581e:	2f00           	move.l d0,-(sp)
    5820:	2f2f 01d0      	move.l 464(sp),-(sp)
    5824:	2f2f 0056      	move.l 86(sp),-(sp)
    5828:	4eba 1388      	jsr 6bb2 <TestRow>(pc)
    582c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5830:	722a           	moveq #42,d1
    5832:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5836:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {  
    583a:	52af 011e      	addq.l #1,286(sp)
    583e:	7007           	moveq #7,d0
    5840:	b0af 011e      	cmp.l 286(sp),d0
    5844:	6cb8           	bge.s 57fe <TestZoom4Picture+0x1aae>
    }
    
    for(int i2=0;i2<10;i2++) {
    5846:	42af 011a      	clr.l 282(sp)
    584a:	607c           	bra.s 58c8 <TestZoom4Picture+0x1b78>
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    584c:	222f 0122      	move.l 290(sp),d1
    5850:	2001           	move.l d1,d0
    5852:	e788           	lsl.l #3,d0
    5854:	9081           	sub.l d1,d0
    5856:	d080           	add.l d0,d0
    5858:	d080           	add.l d0,d0
    585a:	2040           	movea.l d0,a0
    585c:	41e8 000b      	lea 11(a0),a0
    5860:	2208           	move.l a0,d1
    5862:	d2af 011a      	add.l 282(sp),d1
    5866:	7000           	moveq #0,d0
    5868:	302f 01c6      	move.w 454(sp),d0
    586c:	2f01           	move.l d1,-(sp)
    586e:	2f00           	move.l d0,-(sp)
    5870:	2f2f 01d0      	move.l 464(sp),-(sp)
    5874:	2f2f 0056      	move.l 86(sp),-(sp)
    5878:	4eba 1338      	jsr 6bb2 <TestRow>(pc)
    587c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5880:	722a           	moveq #42,d1
    5882:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    5886:	222f 0122      	move.l 290(sp),d1
    588a:	2001           	move.l d1,d0
    588c:	e788           	lsl.l #3,d0
    588e:	9081           	sub.l d1,d0
    5890:	d080           	add.l d0,d0
    5892:	d080           	add.l d0,d0
    5894:	2040           	movea.l d0,a0
    5896:	41e8 000b      	lea 11(a0),a0
    589a:	2208           	move.l a0,d1
    589c:	d2af 011a      	add.l 282(sp),d1
    58a0:	7000           	moveq #0,d0
    58a2:	302f 01c6      	move.w 454(sp),d0
    58a6:	2f01           	move.l d1,-(sp)
    58a8:	2f00           	move.l d0,-(sp)
    58aa:	2f2f 01d0      	move.l 464(sp),-(sp)
    58ae:	2f2f 0056      	move.l 86(sp),-(sp)
    58b2:	4eba 12fe      	jsr 6bb2 <TestRow>(pc)
    58b6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    58ba:	702a           	moveq #42,d0
    58bc:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    58c0:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {
    58c4:	52af 011a      	addq.l #1,282(sp)
    58c8:	7209           	moveq #9,d1
    58ca:	b2af 011a      	cmp.l 282(sp),d1
    58ce:	6c00 ff7c      	bge.w 584c <TestZoom4Picture+0x1afc>
  for(int i=0;i<9;i++) {
    58d2:	52af 0122      	addq.l #1,290(sp)
    58d6:	7008           	moveq #8,d0
    58d8:	b0af 0122      	cmp.l 290(sp),d0
    58dc:	6c00 ff1a      	bge.w 57f8 <TestZoom4Picture+0x1aa8>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    58e0:	42af 0116      	clr.l 278(sp)
    58e4:	6032           	bra.s 5918 <TestZoom4Picture+0x1bc8>
    TestRow( valsupposed, valactual, mask, 255+i2);
    58e6:	222f 0116      	move.l 278(sp),d1
    58ea:	0681 0000 00ff 	addi.l #255,d1
    58f0:	7000           	moveq #0,d0
    58f2:	302f 01c6      	move.w 454(sp),d0
    58f6:	2f01           	move.l d1,-(sp)
    58f8:	2f00           	move.l d0,-(sp)
    58fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    58fe:	2f2f 0056      	move.l 86(sp),-(sp)
    5902:	4eba 12ae      	jsr 6bb2 <TestRow>(pc)
    5906:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    590a:	722a           	moveq #42,d1
    590c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5910:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    5914:	52af 0116      	addq.l #1,278(sp)
    5918:	7007           	moveq #7,d0
    591a:	b0af 0116      	cmp.l 278(sp),d0
    591e:	6cc6           	bge.s 58e6 <TestZoom4Picture+0x1b96>
  }
  for(int i=0;i<3;i++) {
    5920:	42af 0112      	clr.l 274(sp)
    5924:	6064           	bra.s 598a <TestZoom4Picture+0x1c3a>
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    5926:	202f 0112      	move.l 274(sp),d0
    592a:	d080           	add.l d0,d0
    592c:	2200           	move.l d0,d1
    592e:	0681 0000 0107 	addi.l #263,d1
    5934:	7000           	moveq #0,d0
    5936:	302f 01c6      	move.w 454(sp),d0
    593a:	2f01           	move.l d1,-(sp)
    593c:	2f00           	move.l d0,-(sp)
    593e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5942:	2f2f 0056      	move.l 86(sp),-(sp)
    5946:	4eba 126a      	jsr 6bb2 <TestRow>(pc)
    594a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    594e:	722a           	moveq #42,d1
    5950:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    5954:	202f 0112      	move.l 274(sp),d0
    5958:	0680 0000 0084 	addi.l #132,d0
    595e:	d080           	add.l d0,d0
    5960:	2200           	move.l d0,d1
    5962:	7000           	moveq #0,d0
    5964:	302f 01c6      	move.w 454(sp),d0
    5968:	2f01           	move.l d1,-(sp)
    596a:	2f00           	move.l d0,-(sp)
    596c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5970:	2f2f 0056      	move.l 86(sp),-(sp)
    5974:	4eba 123c      	jsr 6bb2 <TestRow>(pc)
    5978:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    597c:	702a           	moveq #42,d0
    597e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5982:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    5986:	52af 0112      	addq.l #1,274(sp)
    598a:	7202           	moveq #2,d1
    598c:	b2af 0112      	cmp.l 274(sp),d1
    5990:	6c94           	bge.s 5926 <TestZoom4Picture+0x1bd6>
  }

  tmp = source;
    5992:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5998:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    599e:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    59a4:	4878 0001      	pea 1 <_start+0x1>
    59a8:	4878 000a      	pea a <_start+0xa>
    59ac:	2f2f 0056      	move.l 86(sp),-(sp)
    59b0:	2f2f 006a      	move.l 106(sp),-(sp)
    59b4:	4eba c152      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    59b8:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    59bc:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    59c2:	2c40           	movea.l d0,a6
    59c4:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    59c8:	202f 004e      	move.l 78(sp),d0
    59cc:	5880           	addq.l #4,d0
    59ce:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom11;
    59d2:	2f7c 0000 b678 	move.l #46712,74(sp)
    59d8:	004a 

  mask = 0xffff;
    59da:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  for(int i2=0;i2<6;i2++) {  
    59e0:	42af 010e      	clr.l 270(sp)
    59e4:	602a           	bra.s 5a10 <TestZoom4Picture+0x1cc0>
    TestRow( valsupposed, valactual, mask, i2);
    59e6:	7000           	moveq #0,d0
    59e8:	302f 01c6      	move.w 454(sp),d0
    59ec:	2f2f 010e      	move.l 270(sp),-(sp)
    59f0:	2f00           	move.l d0,-(sp)
    59f2:	2f2f 01d0      	move.l 464(sp),-(sp)
    59f6:	2f2f 0056      	move.l 86(sp),-(sp)
    59fa:	4eba 11b6      	jsr 6bb2 <TestRow>(pc)
    59fe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a02:	722a           	moveq #42,d1
    5a04:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5a08:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {  
    5a0c:	52af 010e      	addq.l #1,270(sp)
    5a10:	7005           	moveq #5,d0
    5a12:	b0af 010e      	cmp.l 270(sp),d0
    5a16:	6cce           	bge.s 59e6 <TestZoom4Picture+0x1c96>
  }

  for(int i2=0;i2<11;i2++) {
    5a18:	42af 010a      	clr.l 266(sp)
    5a1c:	605c           	bra.s 5a7a <TestZoom4Picture+0x1d2a>
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    5a1e:	202f 010a      	move.l 266(sp),d0
    5a22:	5680           	addq.l #3,d0
    5a24:	d080           	add.l d0,d0
    5a26:	2200           	move.l d0,d1
    5a28:	7000           	moveq #0,d0
    5a2a:	302f 01c6      	move.w 454(sp),d0
    5a2e:	2f01           	move.l d1,-(sp)
    5a30:	2f00           	move.l d0,-(sp)
    5a32:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a36:	2f2f 0056      	move.l 86(sp),-(sp)
    5a3a:	4eba 1176      	jsr 6bb2 <TestRow>(pc)
    5a3e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a42:	722a           	moveq #42,d1
    5a44:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    5a48:	202f 010a      	move.l 266(sp),d0
    5a4c:	d080           	add.l d0,d0
    5a4e:	2200           	move.l d0,d1
    5a50:	5e81           	addq.l #7,d1
    5a52:	7000           	moveq #0,d0
    5a54:	302f 01c6      	move.w 454(sp),d0
    5a58:	2f01           	move.l d1,-(sp)
    5a5a:	2f00           	move.l d0,-(sp)
    5a5c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a60:	2f2f 0056      	move.l 86(sp),-(sp)
    5a64:	4eba 114c      	jsr 6bb2 <TestRow>(pc)
    5a68:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a6c:	702a           	moveq #42,d0
    5a6e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5a72:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5a76:	52af 010a      	addq.l #1,266(sp)
    5a7a:	720a           	moveq #10,d1
    5a7c:	b2af 010a      	cmp.l 266(sp),d1
    5a80:	6c9c           	bge.s 5a1e <TestZoom4Picture+0x1cce>
  }

  for(int i=0;i<8;i++) {
    5a82:	42af 0106      	clr.l 262(sp)
    5a86:	6000 00f2      	bra.w 5b7a <TestZoom4Picture+0x1e2a>
    for(int i2=0;i2<7;i2++) {  
    5a8a:	42af 0102      	clr.l 258(sp)
    5a8e:	6044           	bra.s 5ad4 <TestZoom4Picture+0x1d84>
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    5a90:	307c 001c      	movea.w #28,a0
    5a94:	d1ef 0102      	adda.l 258(sp),a0
    5a98:	222f 0106      	move.l 262(sp),d1
    5a9c:	2001           	move.l d1,d0
    5a9e:	e788           	lsl.l #3,d0
    5aa0:	9081           	sub.l d1,d0
    5aa2:	d080           	add.l d0,d0
    5aa4:	d080           	add.l d0,d0
    5aa6:	d081           	add.l d1,d0
    5aa8:	2208           	move.l a0,d1
    5aaa:	d280           	add.l d0,d1
    5aac:	7000           	moveq #0,d0
    5aae:	302f 01c6      	move.w 454(sp),d0
    5ab2:	2f01           	move.l d1,-(sp)
    5ab4:	2f00           	move.l d0,-(sp)
    5ab6:	2f2f 01d0      	move.l 464(sp),-(sp)
    5aba:	2f2f 0056      	move.l 86(sp),-(sp)
    5abe:	4eba 10f2      	jsr 6bb2 <TestRow>(pc)
    5ac2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5ac6:	702a           	moveq #42,d0
    5ac8:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5acc:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<7;i2++) {  
    5ad0:	52af 0102      	addq.l #1,258(sp)
    5ad4:	7206           	moveq #6,d1
    5ad6:	b2af 0102      	cmp.l 258(sp),d1
    5ada:	6cb4           	bge.s 5a90 <TestZoom4Picture+0x1d40>
    }
    
    for(int i2=0;i2<11;i2++) {
    5adc:	42af 00fe      	clr.l 254(sp)
    5ae0:	6000 008a      	bra.w 5b6c <TestZoom4Picture+0x1e1c>
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    5ae4:	222f 0106      	move.l 262(sp),d1
    5ae8:	2001           	move.l d1,d0
    5aea:	e788           	lsl.l #3,d0
    5aec:	9081           	sub.l d1,d0
    5aee:	d080           	add.l d0,d0
    5af0:	d080           	add.l d0,d0
    5af2:	2040           	movea.l d0,a0
    5af4:	d1c1           	adda.l d1,a0
    5af6:	41e8 0023      	lea 35(a0),a0
    5afa:	202f 00fe      	move.l 254(sp),d0
    5afe:	d080           	add.l d0,d0
    5b00:	2208           	move.l a0,d1
    5b02:	d280           	add.l d0,d1
    5b04:	7000           	moveq #0,d0
    5b06:	302f 01c6      	move.w 454(sp),d0
    5b0a:	2f01           	move.l d1,-(sp)
    5b0c:	2f00           	move.l d0,-(sp)
    5b0e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b12:	2f2f 0056      	move.l 86(sp),-(sp)
    5b16:	4eba 109a      	jsr 6bb2 <TestRow>(pc)
    5b1a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5b1e:	702a           	moveq #42,d0
    5b20:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    5b24:	222f 0106      	move.l 262(sp),d1
    5b28:	2001           	move.l d1,d0
    5b2a:	e788           	lsl.l #3,d0
    5b2c:	9081           	sub.l d1,d0
    5b2e:	d080           	add.l d0,d0
    5b30:	d080           	add.l d0,d0
    5b32:	2040           	movea.l d0,a0
    5b34:	d1c1           	adda.l d1,a0
    5b36:	41e8 000b      	lea 11(a0),a0
    5b3a:	202f 00fe      	move.l 254(sp),d0
    5b3e:	d080           	add.l d0,d0
    5b40:	2208           	move.l a0,d1
    5b42:	d280           	add.l d0,d1
    5b44:	7000           	moveq #0,d0
    5b46:	302f 01c6      	move.w 454(sp),d0
    5b4a:	2f01           	move.l d1,-(sp)
    5b4c:	2f00           	move.l d0,-(sp)
    5b4e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b52:	2f2f 0056      	move.l 86(sp),-(sp)
    5b56:	4eba 105a      	jsr 6bb2 <TestRow>(pc)
    5b5a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5b5e:	722a           	moveq #42,d1
    5b60:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5b64:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {
    5b68:	52af 00fe      	addq.l #1,254(sp)
    5b6c:	700a           	moveq #10,d0
    5b6e:	b0af 00fe      	cmp.l 254(sp),d0
    5b72:	6c00 ff70      	bge.w 5ae4 <TestZoom4Picture+0x1d94>
  for(int i=0;i<8;i++) {
    5b76:	52af 0106      	addq.l #1,262(sp)
    5b7a:	7207           	moveq #7,d1
    5b7c:	b2af 0106      	cmp.l 262(sp),d1
    5b80:	6c00 ff08      	bge.w 5a8a <TestZoom4Picture+0x1d3a>
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    5b84:	42af 00fa      	clr.l 250(sp)
    5b88:	6032           	bra.s 5bbc <TestZoom4Picture+0x1e6c>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5b8a:	222f 00fa      	move.l 250(sp),d1
    5b8e:	0681 0000 0104 	addi.l #260,d1
    5b94:	7000           	moveq #0,d0
    5b96:	302f 01c6      	move.w 454(sp),d0
    5b9a:	2f01           	move.l d1,-(sp)
    5b9c:	2f00           	move.l d0,-(sp)
    5b9e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ba2:	2f2f 0056      	move.l 86(sp),-(sp)
    5ba6:	4eba 100a      	jsr 6bb2 <TestRow>(pc)
    5baa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5bae:	702a           	moveq #42,d0
    5bb0:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5bb4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    5bb8:	52af 00fa      	addq.l #1,250(sp)
    5bbc:	7206           	moveq #6,d1
    5bbe:	b2af 00fa      	cmp.l 250(sp),d1
    5bc2:	6cc6           	bge.s 5b8a <TestZoom4Picture+0x1e3a>
  }
  TestRow( valsupposed, valactual, mask, 267);   
    5bc4:	7000           	moveq #0,d0
    5bc6:	302f 01c6      	move.w 454(sp),d0
    5bca:	4878 010b      	pea 10b <FreeDisplay+0x2b>
    5bce:	2f00           	move.l d0,-(sp)
    5bd0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bd4:	2f2f 0056      	move.l 86(sp),-(sp)
    5bd8:	4eba 0fd8      	jsr 6bb2 <TestRow>(pc)
    5bdc:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5be0:	702a           	moveq #42,d0
    5be2:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 268);
    5be6:	7000           	moveq #0,d0
    5be8:	302f 01c6      	move.w 454(sp),d0
    5bec:	4878 010c      	pea 10c <FreeDisplay+0x2c>
    5bf0:	2f00           	move.l d0,-(sp)
    5bf2:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bf6:	2f2f 0056      	move.l 86(sp),-(sp)
    5bfa:	4eba 0fb6      	jsr 6bb2 <TestRow>(pc)
    5bfe:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5c02:	722a           	moveq #42,d1
    5c04:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5c08:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 269);
    5c0c:	7000           	moveq #0,d0
    5c0e:	302f 01c6      	move.w 454(sp),d0
    5c12:	4878 010d      	pea 10d <FreeDisplay+0x2d>
    5c16:	2f00           	move.l d0,-(sp)
    5c18:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c1c:	2f2f 0056      	move.l 86(sp),-(sp)
    5c20:	4eba 0f90      	jsr 6bb2 <TestRow>(pc)
    5c24:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5c28:	702a           	moveq #42,d0
    5c2a:	d1af 01c8      	add.l d0,456(sp)
  
  tmp = source;
    5c2e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5c34:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5c3a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    5c40:	4878 0001      	pea 1 <_start+0x1>
    5c44:	4878 000b      	pea b <_start+0xb>
    5c48:	2f2f 0056      	move.l 86(sp),-(sp)
    5c4c:	2f2f 006a      	move.l 106(sp),-(sp)
    5c50:	4eba beb6      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    5c54:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5c58:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    5c5e:	2c40           	movea.l d0,a6
    5c60:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5c64:	222f 004e      	move.l 78(sp),d1
    5c68:	5881           	addq.l #4,d1
    5c6a:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom12;
    5c6e:	2f7c 0000 b6a4 	move.l #46756,74(sp)
    5c74:	004a 

  mask = 0x0;
    5c76:	426f 01c6      	clr.w 454(sp)
   
  TestRow( valsupposed, valactual, mask, 0);
    5c7a:	7000           	moveq #0,d0
    5c7c:	302f 01c6      	move.w 454(sp),d0
    5c80:	42a7           	clr.l -(sp)
    5c82:	2f00           	move.l d0,-(sp)
    5c84:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c88:	2f2f 0056      	move.l 86(sp),-(sp)
    5c8c:	4eba 0f24      	jsr 6bb2 <TestRow>(pc)
    5c90:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5c94:	702a           	moveq #42,d0
    5c96:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5c9a:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<12;i2++) {
    5c9e:	42af 00f6      	clr.l 246(sp)
    5ca2:	605c           	bra.s 5d00 <TestZoom4Picture+0x1fb0>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5ca4:	202f 00f6      	move.l 246(sp),d0
    5ca8:	d080           	add.l d0,d0
    5caa:	2200           	move.l d0,d1
    5cac:	5281           	addq.l #1,d1
    5cae:	7000           	moveq #0,d0
    5cb0:	302f 01c6      	move.w 454(sp),d0
    5cb4:	2f01           	move.l d1,-(sp)
    5cb6:	2f00           	move.l d0,-(sp)
    5cb8:	2f2f 01d0      	move.l 464(sp),-(sp)
    5cbc:	2f2f 0056      	move.l 86(sp),-(sp)
    5cc0:	4eba 0ef0      	jsr 6bb2 <TestRow>(pc)
    5cc4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5cc8:	722a           	moveq #42,d1
    5cca:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5cce:	202f 00f6      	move.l 246(sp),d0
    5cd2:	5280           	addq.l #1,d0
    5cd4:	d080           	add.l d0,d0
    5cd6:	2200           	move.l d0,d1
    5cd8:	7000           	moveq #0,d0
    5cda:	302f 01c6      	move.w 454(sp),d0
    5cde:	2f01           	move.l d1,-(sp)
    5ce0:	2f00           	move.l d0,-(sp)
    5ce2:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ce6:	2f2f 0056      	move.l 86(sp),-(sp)
    5cea:	4eba 0ec6      	jsr 6bb2 <TestRow>(pc)
    5cee:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5cf2:	702a           	moveq #42,d0
    5cf4:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5cf8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    5cfc:	52af 00f6      	addq.l #1,246(sp)
    5d00:	720b           	moveq #11,d1
    5d02:	b2af 00f6      	cmp.l 246(sp),d1
    5d06:	6c9c           	bge.s 5ca4 <TestZoom4Picture+0x1f54>
  } 

  for(int i=0;i<8;i++) {
    5d08:	42af 00f2      	clr.l 242(sp)
    5d0c:	6000 00e6      	bra.w 5df4 <TestZoom4Picture+0x20a4>
    for(int i2=0;i2<6;i2++) {  
    5d10:	42af 00ee      	clr.l 238(sp)
    5d14:	6040           	bra.s 5d56 <TestZoom4Picture+0x2006>
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    5d16:	307c 0019      	movea.w #25,a0
    5d1a:	d1ef 00ee      	adda.l 238(sp),a0
    5d1e:	222f 00f2      	move.l 242(sp),d1
    5d22:	2001           	move.l d1,d0
    5d24:	e988           	lsl.l #4,d0
    5d26:	9081           	sub.l d1,d0
    5d28:	d080           	add.l d0,d0
    5d2a:	2208           	move.l a0,d1
    5d2c:	d280           	add.l d0,d1
    5d2e:	7000           	moveq #0,d0
    5d30:	302f 01c6      	move.w 454(sp),d0
    5d34:	2f01           	move.l d1,-(sp)
    5d36:	2f00           	move.l d0,-(sp)
    5d38:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d3c:	2f2f 0056      	move.l 86(sp),-(sp)
    5d40:	4eba 0e70      	jsr 6bb2 <TestRow>(pc)
    5d44:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5d48:	702a           	moveq #42,d0
    5d4a:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5d4e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<6;i2++) {  
    5d52:	52af 00ee      	addq.l #1,238(sp)
    5d56:	7205           	moveq #5,d1
    5d58:	b2af 00ee      	cmp.l 238(sp),d1
    5d5c:	6cb8           	bge.s 5d16 <TestZoom4Picture+0x1fc6>
    }
    
    for(int i2=0;i2<12;i2++) {
    5d5e:	42af 00ea      	clr.l 234(sp)
    5d62:	6000 0082      	bra.w 5de6 <TestZoom4Picture+0x2096>
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    5d66:	222f 00f2      	move.l 242(sp),d1
    5d6a:	2001           	move.l d1,d0
    5d6c:	e988           	lsl.l #4,d0
    5d6e:	9081           	sub.l d1,d0
    5d70:	d080           	add.l d0,d0
    5d72:	2040           	movea.l d0,a0
    5d74:	41e8 001f      	lea 31(a0),a0
    5d78:	202f 00ea      	move.l 234(sp),d0
    5d7c:	d080           	add.l d0,d0
    5d7e:	2208           	move.l a0,d1
    5d80:	d280           	add.l d0,d1
    5d82:	7000           	moveq #0,d0
    5d84:	302f 01c6      	move.w 454(sp),d0
    5d88:	2f01           	move.l d1,-(sp)
    5d8a:	2f00           	move.l d0,-(sp)
    5d8c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d90:	2f2f 0056      	move.l 86(sp),-(sp)
    5d94:	4eba 0e1c      	jsr 6bb2 <TestRow>(pc)
    5d98:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5d9c:	702a           	moveq #42,d0
    5d9e:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    5da2:	222f 00f2      	move.l 242(sp),d1
    5da6:	2001           	move.l d1,d0
    5da8:	e988           	lsl.l #4,d0
    5daa:	9081           	sub.l d1,d0
    5dac:	d080           	add.l d0,d0
    5dae:	2040           	movea.l d0,a0
    5db0:	41e8 0020      	lea 32(a0),a0
    5db4:	202f 00ea      	move.l 234(sp),d0
    5db8:	d080           	add.l d0,d0
    5dba:	2208           	move.l a0,d1
    5dbc:	d280           	add.l d0,d1
    5dbe:	7000           	moveq #0,d0
    5dc0:	302f 01c6      	move.w 454(sp),d0
    5dc4:	2f01           	move.l d1,-(sp)
    5dc6:	2f00           	move.l d0,-(sp)
    5dc8:	2f2f 01d0      	move.l 464(sp),-(sp)
    5dcc:	2f2f 0056      	move.l 86(sp),-(sp)
    5dd0:	4eba 0de0      	jsr 6bb2 <TestRow>(pc)
    5dd4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5dd8:	722a           	moveq #42,d1
    5dda:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5dde:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {
    5de2:	52af 00ea      	addq.l #1,234(sp)
    5de6:	700b           	moveq #11,d0
    5de8:	b0af 00ea      	cmp.l 234(sp),d0
    5dec:	6c00 ff78      	bge.w 5d66 <TestZoom4Picture+0x2016>
  for(int i=0;i<8;i++) {
    5df0:	52af 00f2      	addq.l #1,242(sp)
    5df4:	7207           	moveq #7,d1
    5df6:	b2af 00f2      	cmp.l 242(sp),d1
    5dfa:	6c00 ff14      	bge.w 5d10 <TestZoom4Picture+0x1fc0>
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    5dfe:	42af 00e6      	clr.l 230(sp)
    5e02:	6032           	bra.s 5e36 <TestZoom4Picture+0x20e6>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5e04:	222f 00e6      	move.l 230(sp),d1
    5e08:	0681 0000 0104 	addi.l #260,d1
    5e0e:	7000           	moveq #0,d0
    5e10:	302f 01c6      	move.w 454(sp),d0
    5e14:	2f01           	move.l d1,-(sp)
    5e16:	2f00           	move.l d0,-(sp)
    5e18:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e1c:	2f2f 0056      	move.l 86(sp),-(sp)
    5e20:	4eba 0d90      	jsr 6bb2 <TestRow>(pc)
    5e24:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5e28:	702a           	moveq #42,d0
    5e2a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5e2e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    5e32:	52af 00e6      	addq.l #1,230(sp)
    5e36:	7204           	moveq #4,d1
    5e38:	b2af 00e6      	cmp.l 230(sp),d1
    5e3c:	6cc6           	bge.s 5e04 <TestZoom4Picture+0x20b4>
  }

  tmp = source;
    5e3e:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5e44:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5e4a:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    5e50:	4878 0001      	pea 1 <_start+0x1>
    5e54:	4878 000c      	pea c <_start+0xc>
    5e58:	2f2f 0056      	move.l 86(sp),-(sp)
    5e5c:	2f2f 006a      	move.l 106(sp),-(sp)
    5e60:	4eba bca6      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    5e64:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5e68:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    5e6e:	2c40           	movea.l d0,a6
    5e70:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5e74:	202f 004e      	move.l 78(sp),d0
    5e78:	5880           	addq.l #4,d0
    5e7a:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom13;
    5e7e:	2f7c 0000 b6d0 	move.l #46800,74(sp)
    5e84:	004a 

  mask = 0xffff;
    5e86:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<11;i2++) {
    5e8c:	42af 00e2      	clr.l 226(sp)
    5e90:	605a           	bra.s 5eec <TestZoom4Picture+0x219c>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    5e92:	202f 00e2      	move.l 226(sp),d0
    5e96:	d080           	add.l d0,d0
    5e98:	2200           	move.l d0,d1
    5e9a:	7000           	moveq #0,d0
    5e9c:	302f 01c6      	move.w 454(sp),d0
    5ea0:	2f01           	move.l d1,-(sp)
    5ea2:	2f00           	move.l d0,-(sp)
    5ea4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ea8:	2f2f 0056      	move.l 86(sp),-(sp)
    5eac:	4eba 0d04      	jsr 6bb2 <TestRow>(pc)
    5eb0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5eb4:	722a           	moveq #42,d1
    5eb6:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    5eba:	202f 00e2      	move.l 226(sp),d0
    5ebe:	d080           	add.l d0,d0
    5ec0:	2200           	move.l d0,d1
    5ec2:	5281           	addq.l #1,d1
    5ec4:	7000           	moveq #0,d0
    5ec6:	302f 01c6      	move.w 454(sp),d0
    5eca:	2f01           	move.l d1,-(sp)
    5ecc:	2f00           	move.l d0,-(sp)
    5ece:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ed2:	2f2f 0056      	move.l 86(sp),-(sp)
    5ed6:	4eba 0cda      	jsr 6bb2 <TestRow>(pc)
    5eda:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5ede:	702a           	moveq #42,d0
    5ee0:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5ee4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5ee8:	52af 00e2      	addq.l #1,226(sp)
    5eec:	720a           	moveq #10,d1
    5eee:	b2af 00e2      	cmp.l 226(sp),d1
    5ef2:	6c9e           	bge.s 5e92 <TestZoom4Picture+0x2142>
  } 

  for(int i=0;i<8;i++) {
    5ef4:	42af 00de      	clr.l 222(sp)
    5ef8:	6000 00de      	bra.w 5fd8 <TestZoom4Picture+0x2288>
    for(int i2=0;i2<5;i2++) {  
    5efc:	42af 00da      	clr.l 218(sp)
    5f00:	603e           	bra.s 5f40 <TestZoom4Picture+0x21f0>
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    5f02:	307c 0016      	movea.w #22,a0
    5f06:	d1ef 00da      	adda.l 218(sp),a0
    5f0a:	222f 00de      	move.l 222(sp),d1
    5f0e:	2001           	move.l d1,d0
    5f10:	eb88           	lsl.l #5,d0
    5f12:	9081           	sub.l d1,d0
    5f14:	2208           	move.l a0,d1
    5f16:	d280           	add.l d0,d1
    5f18:	7000           	moveq #0,d0
    5f1a:	302f 01c6      	move.w 454(sp),d0
    5f1e:	2f01           	move.l d1,-(sp)
    5f20:	2f00           	move.l d0,-(sp)
    5f22:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f26:	2f2f 0056      	move.l 86(sp),-(sp)
    5f2a:	4eba 0c86      	jsr 6bb2 <TestRow>(pc)
    5f2e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f32:	702a           	moveq #42,d0
    5f34:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5f38:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<5;i2++) {  
    5f3c:	52af 00da      	addq.l #1,218(sp)
    5f40:	7204           	moveq #4,d1
    5f42:	b2af 00da      	cmp.l 218(sp),d1
    5f46:	6cba           	bge.s 5f02 <TestZoom4Picture+0x21b2>
    }
    
    for(int i2=0;i2<13;i2++) {
    5f48:	42af 00d6      	clr.l 214(sp)
    5f4c:	607c           	bra.s 5fca <TestZoom4Picture+0x227a>
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    5f4e:	222f 00de      	move.l 222(sp),d1
    5f52:	2001           	move.l d1,d0
    5f54:	eb88           	lsl.l #5,d0
    5f56:	2040           	movea.l d0,a0
    5f58:	91c1           	suba.l d1,a0
    5f5a:	41e8 001b      	lea 27(a0),a0
    5f5e:	202f 00d6      	move.l 214(sp),d0
    5f62:	d080           	add.l d0,d0
    5f64:	2208           	move.l a0,d1
    5f66:	d280           	add.l d0,d1
    5f68:	7000           	moveq #0,d0
    5f6a:	302f 01c6      	move.w 454(sp),d0
    5f6e:	2f01           	move.l d1,-(sp)
    5f70:	2f00           	move.l d0,-(sp)
    5f72:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f76:	2f2f 0056      	move.l 86(sp),-(sp)
    5f7a:	4eba 0c36      	jsr 6bb2 <TestRow>(pc)
    5f7e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f82:	702a           	moveq #42,d0
    5f84:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    5f88:	222f 00de      	move.l 222(sp),d1
    5f8c:	2001           	move.l d1,d0
    5f8e:	eb88           	lsl.l #5,d0
    5f90:	2040           	movea.l d0,a0
    5f92:	91c1           	suba.l d1,a0
    5f94:	41e8 001c      	lea 28(a0),a0
    5f98:	202f 00d6      	move.l 214(sp),d0
    5f9c:	d080           	add.l d0,d0
    5f9e:	2208           	move.l a0,d1
    5fa0:	d280           	add.l d0,d1
    5fa2:	7000           	moveq #0,d0
    5fa4:	302f 01c6      	move.w 454(sp),d0
    5fa8:	2f01           	move.l d1,-(sp)
    5faa:	2f00           	move.l d0,-(sp)
    5fac:	2f2f 01d0      	move.l 464(sp),-(sp)
    5fb0:	2f2f 0056      	move.l 86(sp),-(sp)
    5fb4:	4eba 0bfc      	jsr 6bb2 <TestRow>(pc)
    5fb8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5fbc:	722a           	moveq #42,d1
    5fbe:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5fc2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {
    5fc6:	52af 00d6      	addq.l #1,214(sp)
    5fca:	700c           	moveq #12,d0
    5fcc:	b0af 00d6      	cmp.l 214(sp),d0
    5fd0:	6c00 ff7c      	bge.w 5f4e <TestZoom4Picture+0x21fe>
  for(int i=0;i<8;i++) {
    5fd4:	52af 00de      	addq.l #1,222(sp)
    5fd8:	7207           	moveq #7,d1
    5fda:	b2af 00de      	cmp.l 222(sp),d1
    5fde:	6c00 ff1c      	bge.w 5efc <TestZoom4Picture+0x21ac>
    }
  } 

  tmp = source;
    5fe2:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    5fe8:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    5fee:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    5ff4:	4878 0001      	pea 1 <_start+0x1>
    5ff8:	4878 000d      	pea d <_start+0xd>
    5ffc:	2f2f 0056      	move.l 86(sp),-(sp)
    6000:	2f2f 006a      	move.l 106(sp),-(sp)
    6004:	4eba bb02      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    6008:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    600c:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    6012:	2c40           	movea.l d0,a6
    6014:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6018:	202f 004e      	move.l 78(sp),d0
    601c:	5880           	addq.l #4,d0
    601e:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom14;
    6022:	2f7c 0000 b6fc 	move.l #46844,74(sp)
    6028:	004a 

  mask = 0xffff;
    602a:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    6030:	7000           	moveq #0,d0
    6032:	302f 01c6      	move.w 454(sp),d0
    6036:	42a7           	clr.l -(sp)
    6038:	2f00           	move.l d0,-(sp)
    603a:	2f2f 01d0      	move.l 464(sp),-(sp)
    603e:	2f2f 0056      	move.l 86(sp),-(sp)
    6042:	4eba 0b6e      	jsr 6bb2 <TestRow>(pc)
    6046:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2; 
    604a:	722a           	moveq #42,d1
    604c:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff; 
    6050:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<9;i2++) {
    6054:	42af 00d2      	clr.l 210(sp)
    6058:	605c           	bra.s 60b6 <TestZoom4Picture+0x2366>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    605a:	202f 00d2      	move.l 210(sp),d0
    605e:	d080           	add.l d0,d0
    6060:	2200           	move.l d0,d1
    6062:	5281           	addq.l #1,d1
    6064:	7000           	moveq #0,d0
    6066:	302f 01c6      	move.w 454(sp),d0
    606a:	2f01           	move.l d1,-(sp)
    606c:	2f00           	move.l d0,-(sp)
    606e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6072:	2f2f 0056      	move.l 86(sp),-(sp)
    6076:	4eba 0b3a      	jsr 6bb2 <TestRow>(pc)
    607a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    607e:	702a           	moveq #42,d0
    6080:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    6084:	202f 00d2      	move.l 210(sp),d0
    6088:	5280           	addq.l #1,d0
    608a:	d080           	add.l d0,d0
    608c:	2200           	move.l d0,d1
    608e:	7000           	moveq #0,d0
    6090:	302f 01c6      	move.w 454(sp),d0
    6094:	2f01           	move.l d1,-(sp)
    6096:	2f00           	move.l d0,-(sp)
    6098:	2f2f 01d0      	move.l 464(sp),-(sp)
    609c:	2f2f 0056      	move.l 86(sp),-(sp)
    60a0:	4eba 0b10      	jsr 6bb2 <TestRow>(pc)
    60a4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    60a8:	722a           	moveq #42,d1
    60aa:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    60ae:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {
    60b2:	52af 00d2      	addq.l #1,210(sp)
    60b6:	7008           	moveq #8,d0
    60b8:	b0af 00d2      	cmp.l 210(sp),d0
    60bc:	6c9c           	bge.s 605a <TestZoom4Picture+0x230a>
  } 

  for(int i=0;i<7;i++) {
    60be:	42af 00ce      	clr.l 206(sp)
    60c2:	6000 00cc      	bra.w 6190 <TestZoom4Picture+0x2440>
    for(int i2=0;i2<4;i2++) {  
    60c6:	42af 00ca      	clr.l 202(sp)
    60ca:	6036           	bra.s 6102 <TestZoom4Picture+0x23b2>
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    60cc:	7213           	moveq #19,d1
    60ce:	d2af 00ca      	add.l 202(sp),d1
    60d2:	202f 00ce      	move.l 206(sp),d0
    60d6:	eb88           	lsl.l #5,d0
    60d8:	d280           	add.l d0,d1
    60da:	7000           	moveq #0,d0
    60dc:	302f 01c6      	move.w 454(sp),d0
    60e0:	2f01           	move.l d1,-(sp)
    60e2:	2f00           	move.l d0,-(sp)
    60e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    60e8:	2f2f 0056      	move.l 86(sp),-(sp)
    60ec:	4eba 0ac4      	jsr 6bb2 <TestRow>(pc)
    60f0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    60f4:	722a           	moveq #42,d1
    60f6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    60fa:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<4;i2++) {  
    60fe:	52af 00ca      	addq.l #1,202(sp)
    6102:	7003           	moveq #3,d0
    6104:	b0af 00ca      	cmp.l 202(sp),d0
    6108:	6cc2           	bge.s 60cc <TestZoom4Picture+0x237c>
    }
    
    for(int i2=0;i2<14;i2++) {
    610a:	42af 00c6      	clr.l 198(sp)
    610e:	6074           	bra.s 6184 <TestZoom4Picture+0x2434>
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    6110:	202f 00ce      	move.l 206(sp),d0
    6114:	eb88           	lsl.l #5,d0
    6116:	307c 0017      	movea.w #23,a0
    611a:	d1c0           	adda.l d0,a0
    611c:	202f 00c6      	move.l 198(sp),d0
    6120:	d080           	add.l d0,d0
    6122:	2208           	move.l a0,d1
    6124:	d280           	add.l d0,d1
    6126:	7000           	moveq #0,d0
    6128:	302f 01c6      	move.w 454(sp),d0
    612c:	2f01           	move.l d1,-(sp)
    612e:	2f00           	move.l d0,-(sp)
    6130:	2f2f 01d0      	move.l 464(sp),-(sp)
    6134:	2f2f 0056      	move.l 86(sp),-(sp)
    6138:	4eba 0a78      	jsr 6bb2 <TestRow>(pc)
    613c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6140:	722a           	moveq #42,d1
    6142:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    6146:	202f 00ce      	move.l 206(sp),d0
    614a:	eb88           	lsl.l #5,d0
    614c:	307c 0018      	movea.w #24,a0
    6150:	d1c0           	adda.l d0,a0
    6152:	202f 00c6      	move.l 198(sp),d0
    6156:	d080           	add.l d0,d0
    6158:	2208           	move.l a0,d1
    615a:	d280           	add.l d0,d1
    615c:	7000           	moveq #0,d0
    615e:	302f 01c6      	move.w 454(sp),d0
    6162:	2f01           	move.l d1,-(sp)
    6164:	2f00           	move.l d0,-(sp)
    6166:	2f2f 01d0      	move.l 464(sp),-(sp)
    616a:	2f2f 0056      	move.l 86(sp),-(sp)
    616e:	4eba 0a42      	jsr 6bb2 <TestRow>(pc)
    6172:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6176:	702a           	moveq #42,d0
    6178:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    617c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {
    6180:	52af 00c6      	addq.l #1,198(sp)
    6184:	720d           	moveq #13,d1
    6186:	b2af 00c6      	cmp.l 198(sp),d1
    618a:	6c84           	bge.s 6110 <TestZoom4Picture+0x23c0>
  for(int i=0;i<7;i++) {
    618c:	52af 00ce      	addq.l #1,206(sp)
    6190:	7006           	moveq #6,d0
    6192:	b0af 00ce      	cmp.l 206(sp),d0
    6196:	6c00 ff2e      	bge.w 60c6 <TestZoom4Picture+0x2376>
    }
  }

  for(int i2=0;i2<4;i2++) {  
    619a:	42af 00c2      	clr.l 194(sp)
    619e:	6032           	bra.s 61d2 <TestZoom4Picture+0x2482>
    TestRow( valsupposed, valactual, mask, 243+i2);
    61a0:	222f 00c2      	move.l 194(sp),d1
    61a4:	0681 0000 00f3 	addi.l #243,d1
    61aa:	7000           	moveq #0,d0
    61ac:	302f 01c6      	move.w 454(sp),d0
    61b0:	2f01           	move.l d1,-(sp)
    61b2:	2f00           	move.l d0,-(sp)
    61b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    61b8:	2f2f 0056      	move.l 86(sp),-(sp)
    61bc:	4eba 09f4      	jsr 6bb2 <TestRow>(pc)
    61c0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    61c4:	722a           	moveq #42,d1
    61c6:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    61ca:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {  
    61ce:	52af 00c2      	addq.l #1,194(sp)
    61d2:	7003           	moveq #3,d0
    61d4:	b0af 00c2      	cmp.l 194(sp),d0
    61d8:	6cc6           	bge.s 61a0 <TestZoom4Picture+0x2450>
  }

  for(int i2=0;i2<12;i2++) {
    61da:	42af 00be      	clr.l 190(sp)
    61de:	6060           	bra.s 6240 <TestZoom4Picture+0x24f0>
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    61e0:	202f 00be      	move.l 190(sp),d0
    61e4:	d080           	add.l d0,d0
    61e6:	2200           	move.l d0,d1
    61e8:	0681 0000 00f7 	addi.l #247,d1
    61ee:	7000           	moveq #0,d0
    61f0:	302f 01c6      	move.w 454(sp),d0
    61f4:	2f01           	move.l d1,-(sp)
    61f6:	2f00           	move.l d0,-(sp)
    61f8:	2f2f 01d0      	move.l 464(sp),-(sp)
    61fc:	2f2f 0056      	move.l 86(sp),-(sp)
    6200:	4eba 09b0      	jsr 6bb2 <TestRow>(pc)
    6204:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6208:	722a           	moveq #42,d1
    620a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    620e:	707c           	moveq #124,d0
    6210:	d0af 00be      	add.l 190(sp),d0
    6214:	d080           	add.l d0,d0
    6216:	2200           	move.l d0,d1
    6218:	7000           	moveq #0,d0
    621a:	302f 01c6      	move.w 454(sp),d0
    621e:	2f01           	move.l d1,-(sp)
    6220:	2f00           	move.l d0,-(sp)
    6222:	2f2f 01d0      	move.l 464(sp),-(sp)
    6226:	2f2f 0056      	move.l 86(sp),-(sp)
    622a:	4eba 0986      	jsr 6bb2 <TestRow>(pc)
    622e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6232:	702a           	moveq #42,d0
    6234:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6238:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    623c:	52af 00be      	addq.l #1,190(sp)
    6240:	720b           	moveq #11,d1
    6242:	b2af 00be      	cmp.l 190(sp),d1
    6246:	6c98           	bge.s 61e0 <TestZoom4Picture+0x2490>
  }

  tmp = source;
    6248:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    624e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6254:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    625a:	4878 0001      	pea 1 <_start+0x1>
    625e:	4878 000e      	pea e <_start+0xe>
    6262:	2f2f 0056      	move.l 86(sp),-(sp)
    6266:	2f2f 006a      	move.l 106(sp),-(sp)
    626a:	4eba b89c      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    626e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6272:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    6278:	2c40           	movea.l d0,a6
    627a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    627e:	202f 004e      	move.l 78(sp),d0
    6282:	5880           	addq.l #4,d0
    6284:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom15;
    6288:	2f7c 0000 b728 	move.l #46888,74(sp)
    628e:	004a 

  mask = 0x0000;
    6290:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<8;i2++) {
    6294:	42af 00ba      	clr.l 186(sp)
    6298:	605a           	bra.s 62f4 <TestZoom4Picture+0x25a4>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    629a:	202f 00ba      	move.l 186(sp),d0
    629e:	d080           	add.l d0,d0
    62a0:	2200           	move.l d0,d1
    62a2:	7000           	moveq #0,d0
    62a4:	302f 01c6      	move.w 454(sp),d0
    62a8:	2f01           	move.l d1,-(sp)
    62aa:	2f00           	move.l d0,-(sp)
    62ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    62b0:	2f2f 0056      	move.l 86(sp),-(sp)
    62b4:	4eba 08fc      	jsr 6bb2 <TestRow>(pc)
    62b8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    62bc:	722a           	moveq #42,d1
    62be:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    62c2:	202f 00ba      	move.l 186(sp),d0
    62c6:	d080           	add.l d0,d0
    62c8:	2200           	move.l d0,d1
    62ca:	5281           	addq.l #1,d1
    62cc:	7000           	moveq #0,d0
    62ce:	302f 01c6      	move.w 454(sp),d0
    62d2:	2f01           	move.l d1,-(sp)
    62d4:	2f00           	move.l d0,-(sp)
    62d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    62da:	2f2f 0056      	move.l 86(sp),-(sp)
    62de:	4eba 08d2      	jsr 6bb2 <TestRow>(pc)
    62e2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    62e6:	702a           	moveq #42,d0
    62e8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    62ec:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    62f0:	52af 00ba      	addq.l #1,186(sp)
    62f4:	7207           	moveq #7,d1
    62f6:	b2af 00ba      	cmp.l 186(sp),d1
    62fa:	6c9e           	bge.s 629a <TestZoom4Picture+0x254a>
  }

  for(int i=0;i<7;i++) {
    62fc:	42af 00b6      	clr.l 182(sp)
    6300:	6000 00de      	bra.w 63e0 <TestZoom4Picture+0x2690>
    for(int i2=0;i2<3;i2++) {  
    6304:	42af 00b2      	clr.l 178(sp)
    6308:	603e           	bra.s 6348 <TestZoom4Picture+0x25f8>
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    630a:	307c 0010      	movea.w #16,a0
    630e:	d1ef 00b2      	adda.l 178(sp),a0
    6312:	222f 00b6      	move.l 182(sp),d1
    6316:	2001           	move.l d1,d0
    6318:	eb88           	lsl.l #5,d0
    631a:	d081           	add.l d1,d0
    631c:	2208           	move.l a0,d1
    631e:	d280           	add.l d0,d1
    6320:	7000           	moveq #0,d0
    6322:	302f 01c6      	move.w 454(sp),d0
    6326:	2f01           	move.l d1,-(sp)
    6328:	2f00           	move.l d0,-(sp)
    632a:	2f2f 01d0      	move.l 464(sp),-(sp)
    632e:	2f2f 0056      	move.l 86(sp),-(sp)
    6332:	4eba 087e      	jsr 6bb2 <TestRow>(pc)
    6336:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    633a:	702a           	moveq #42,d0
    633c:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6340:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<3;i2++) {  
    6344:	52af 00b2      	addq.l #1,178(sp)
    6348:	7202           	moveq #2,d1
    634a:	b2af 00b2      	cmp.l 178(sp),d1
    634e:	6cba           	bge.s 630a <TestZoom4Picture+0x25ba>
    }
    
    for(int i2=0;i2<15;i2++) {
    6350:	42af 00ae      	clr.l 174(sp)
    6354:	607c           	bra.s 63d2 <TestZoom4Picture+0x2682>
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    6356:	222f 00b6      	move.l 182(sp),d1
    635a:	2001           	move.l d1,d0
    635c:	eb88           	lsl.l #5,d0
    635e:	2040           	movea.l d0,a0
    6360:	d1c1           	adda.l d1,a0
    6362:	41e8 0013      	lea 19(a0),a0
    6366:	202f 00ae      	move.l 174(sp),d0
    636a:	d080           	add.l d0,d0
    636c:	2208           	move.l a0,d1
    636e:	d280           	add.l d0,d1
    6370:	7000           	moveq #0,d0
    6372:	302f 01c6      	move.w 454(sp),d0
    6376:	2f01           	move.l d1,-(sp)
    6378:	2f00           	move.l d0,-(sp)
    637a:	2f2f 01d0      	move.l 464(sp),-(sp)
    637e:	2f2f 0056      	move.l 86(sp),-(sp)
    6382:	4eba 082e      	jsr 6bb2 <TestRow>(pc)
    6386:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    638a:	702a           	moveq #42,d0
    638c:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    6390:	222f 00b6      	move.l 182(sp),d1
    6394:	2001           	move.l d1,d0
    6396:	eb88           	lsl.l #5,d0
    6398:	2040           	movea.l d0,a0
    639a:	d1c1           	adda.l d1,a0
    639c:	41e8 0013      	lea 19(a0),a0
    63a0:	202f 00ae      	move.l 174(sp),d0
    63a4:	d080           	add.l d0,d0
    63a6:	2208           	move.l a0,d1
    63a8:	d280           	add.l d0,d1
    63aa:	7000           	moveq #0,d0
    63ac:	302f 01c6      	move.w 454(sp),d0
    63b0:	2f01           	move.l d1,-(sp)
    63b2:	2f00           	move.l d0,-(sp)
    63b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    63b8:	2f2f 0056      	move.l 86(sp),-(sp)
    63bc:	4eba 07f4      	jsr 6bb2 <TestRow>(pc)
    63c0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    63c4:	722a           	moveq #42,d1
    63c6:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    63ca:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {
    63ce:	52af 00ae      	addq.l #1,174(sp)
    63d2:	700e           	moveq #14,d0
    63d4:	b0af 00ae      	cmp.l 174(sp),d0
    63d8:	6c00 ff7c      	bge.w 6356 <TestZoom4Picture+0x2606>
  for(int i=0;i<7;i++) {
    63dc:	52af 00b6      	addq.l #1,182(sp)
    63e0:	7206           	moveq #6,d1
    63e2:	b2af 00b6      	cmp.l 182(sp),d1
    63e6:	6c00 ff1c      	bge.w 6304 <TestZoom4Picture+0x25b4>
    }
  }

  for(int i2=0;i2<3;i2++) {  
    63ea:	42af 00aa      	clr.l 170(sp)
    63ee:	6032           	bra.s 6422 <TestZoom4Picture+0x26d2>
    TestRow( valsupposed, valactual, mask, 247+i2);
    63f0:	222f 00aa      	move.l 170(sp),d1
    63f4:	0681 0000 00f7 	addi.l #247,d1
    63fa:	7000           	moveq #0,d0
    63fc:	302f 01c6      	move.w 454(sp),d0
    6400:	2f01           	move.l d1,-(sp)
    6402:	2f00           	move.l d0,-(sp)
    6404:	2f2f 01d0      	move.l 464(sp),-(sp)
    6408:	2f2f 0056      	move.l 86(sp),-(sp)
    640c:	4eba 07a4      	jsr 6bb2 <TestRow>(pc)
    6410:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6414:	702a           	moveq #42,d0
    6416:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    641a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<3;i2++) {  
    641e:	52af 00aa      	addq.l #1,170(sp)
    6422:	7202           	moveq #2,d1
    6424:	b2af 00aa      	cmp.l 170(sp),d1
    6428:	6cc6           	bge.s 63f0 <TestZoom4Picture+0x26a0>
  }

  for(int i2=0;i2<10;i2++) {
    642a:	42af 00a6      	clr.l 166(sp)
    642e:	6060           	bra.s 6490 <TestZoom4Picture+0x2740>
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    6430:	707d           	moveq #125,d0
    6432:	d0af 00a6      	add.l 166(sp),d0
    6436:	d080           	add.l d0,d0
    6438:	2200           	move.l d0,d1
    643a:	7000           	moveq #0,d0
    643c:	302f 01c6      	move.w 454(sp),d0
    6440:	2f01           	move.l d1,-(sp)
    6442:	2f00           	move.l d0,-(sp)
    6444:	2f2f 01d0      	move.l 464(sp),-(sp)
    6448:	2f2f 0056      	move.l 86(sp),-(sp)
    644c:	4eba 0764      	jsr 6bb2 <TestRow>(pc)
    6450:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6454:	702a           	moveq #42,d0
    6456:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    645a:	202f 00a6      	move.l 166(sp),d0
    645e:	d080           	add.l d0,d0
    6460:	2200           	move.l d0,d1
    6462:	0681 0000 00fb 	addi.l #251,d1
    6468:	7000           	moveq #0,d0
    646a:	302f 01c6      	move.w 454(sp),d0
    646e:	2f01           	move.l d1,-(sp)
    6470:	2f00           	move.l d0,-(sp)
    6472:	2f2f 01d0      	move.l 464(sp),-(sp)
    6476:	2f2f 0056      	move.l 86(sp),-(sp)
    647a:	4eba 0736      	jsr 6bb2 <TestRow>(pc)
    647e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6482:	722a           	moveq #42,d1
    6484:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6488:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {
    648c:	52af 00a6      	addq.l #1,166(sp)
    6490:	7009           	moveq #9,d0
    6492:	b0af 00a6      	cmp.l 166(sp),d0
    6496:	6c98           	bge.s 6430 <TestZoom4Picture+0x26e0>
  }

  tmp = source;
    6498:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    649e:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    64a4:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    64aa:	4878 0001      	pea 1 <_start+0x1>
    64ae:	4878 000f      	pea f <_start+0xf>
    64b2:	2f2f 0056      	move.l 86(sp),-(sp)
    64b6:	2f2f 006a      	move.l 106(sp),-(sp)
    64ba:	4eba b64c      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    64be:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    64c2:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    64c8:	2c40           	movea.l d0,a6
    64ca:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    64ce:	222f 004e      	move.l 78(sp),d1
    64d2:	5881           	addq.l #4,d1
    64d4:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom16;
    64d8:	2f7c 0000 b754 	move.l #46932,74(sp)
    64de:	004a 

  mask = 0x0000;
    64e0:	426f 01c6      	clr.w 454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    64e4:	7000           	moveq #0,d0
    64e6:	302f 01c6      	move.w 454(sp),d0
    64ea:	42a7           	clr.l -(sp)
    64ec:	2f00           	move.l d0,-(sp)
    64ee:	2f2f 01d0      	move.l 464(sp),-(sp)
    64f2:	2f2f 0056      	move.l 86(sp),-(sp)
    64f6:	4eba 06ba      	jsr 6bb2 <TestRow>(pc)
    64fa:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    64fe:	702a           	moveq #42,d0
    6500:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6504:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    6508:	42af 00a2      	clr.l 162(sp)
    650c:	605a           	bra.s 6568 <TestZoom4Picture+0x2818>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    650e:	202f 00a2      	move.l 162(sp),d0
    6512:	d080           	add.l d0,d0
    6514:	2200           	move.l d0,d1
    6516:	7000           	moveq #0,d0
    6518:	302f 01c6      	move.w 454(sp),d0
    651c:	2f01           	move.l d1,-(sp)
    651e:	2f00           	move.l d0,-(sp)
    6520:	2f2f 01d0      	move.l 464(sp),-(sp)
    6524:	2f2f 0056      	move.l 86(sp),-(sp)
    6528:	4eba 0688      	jsr 6bb2 <TestRow>(pc)
    652c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6530:	722a           	moveq #42,d1
    6532:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6536:	202f 00a2      	move.l 162(sp),d0
    653a:	d080           	add.l d0,d0
    653c:	2200           	move.l d0,d1
    653e:	5281           	addq.l #1,d1
    6540:	7000           	moveq #0,d0
    6542:	302f 01c6      	move.w 454(sp),d0
    6546:	2f01           	move.l d1,-(sp)
    6548:	2f00           	move.l d0,-(sp)
    654a:	2f2f 01d0      	move.l 464(sp),-(sp)
    654e:	2f2f 0056      	move.l 86(sp),-(sp)
    6552:	4eba 065e      	jsr 6bb2 <TestRow>(pc)
    6556:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    655a:	702a           	moveq #42,d0
    655c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6560:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    6564:	52af 00a2      	addq.l #1,162(sp)
    6568:	7205           	moveq #5,d1
    656a:	b2af 00a2      	cmp.l 162(sp),d1
    656e:	6c9e           	bge.s 650e <TestZoom4Picture+0x27be>
  }

  for(int i=0;i<7;i++) {
    6570:	42af 009e      	clr.l 158(sp)
    6574:	6000 00e6      	bra.w 665c <TestZoom4Picture+0x290c>
    for(int i2=0;i2<2;i2++) {  
    6578:	42af 009a      	clr.l 154(sp)
    657c:	6040           	bra.s 65be <TestZoom4Picture+0x286e>
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    657e:	307c 000d      	movea.w #13,a0
    6582:	d1ef 009a      	adda.l 154(sp),a0
    6586:	222f 009e      	move.l 158(sp),d1
    658a:	2001           	move.l d1,d0
    658c:	e988           	lsl.l #4,d0
    658e:	d081           	add.l d1,d0
    6590:	d080           	add.l d0,d0
    6592:	2208           	move.l a0,d1
    6594:	d280           	add.l d0,d1
    6596:	7000           	moveq #0,d0
    6598:	302f 01c6      	move.w 454(sp),d0
    659c:	2f01           	move.l d1,-(sp)
    659e:	2f00           	move.l d0,-(sp)
    65a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    65a4:	2f2f 0056      	move.l 86(sp),-(sp)
    65a8:	4eba 0608      	jsr 6bb2 <TestRow>(pc)
    65ac:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    65b0:	702a           	moveq #42,d0
    65b2:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    65b6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<2;i2++) {  
    65ba:	52af 009a      	addq.l #1,154(sp)
    65be:	7201           	moveq #1,d1
    65c0:	b2af 009a      	cmp.l 154(sp),d1
    65c4:	6cb8           	bge.s 657e <TestZoom4Picture+0x282e>
    }
    
    for(int i2=0;i2<16;i2++) {
    65c6:	42af 0096      	clr.l 150(sp)
    65ca:	6000 0082      	bra.w 664e <TestZoom4Picture+0x28fe>
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    65ce:	222f 009e      	move.l 158(sp),d1
    65d2:	2001           	move.l d1,d0
    65d4:	e988           	lsl.l #4,d0
    65d6:	d081           	add.l d1,d0
    65d8:	d080           	add.l d0,d0
    65da:	2040           	movea.l d0,a0
    65dc:	41e8 0010      	lea 16(a0),a0
    65e0:	202f 0096      	move.l 150(sp),d0
    65e4:	d080           	add.l d0,d0
    65e6:	2208           	move.l a0,d1
    65e8:	d280           	add.l d0,d1
    65ea:	7000           	moveq #0,d0
    65ec:	302f 01c6      	move.w 454(sp),d0
    65f0:	2f01           	move.l d1,-(sp)
    65f2:	2f00           	move.l d0,-(sp)
    65f4:	2f2f 01d0      	move.l 464(sp),-(sp)
    65f8:	2f2f 0056      	move.l 86(sp),-(sp)
    65fc:	4eba 05b4      	jsr 6bb2 <TestRow>(pc)
    6600:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6604:	702a           	moveq #42,d0
    6606:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    660a:	222f 009e      	move.l 158(sp),d1
    660e:	2001           	move.l d1,d0
    6610:	e988           	lsl.l #4,d0
    6612:	d081           	add.l d1,d0
    6614:	d080           	add.l d0,d0
    6616:	2040           	movea.l d0,a0
    6618:	41e8 0011      	lea 17(a0),a0
    661c:	202f 0096      	move.l 150(sp),d0
    6620:	d080           	add.l d0,d0
    6622:	2208           	move.l a0,d1
    6624:	d280           	add.l d0,d1
    6626:	7000           	moveq #0,d0
    6628:	302f 01c6      	move.w 454(sp),d0
    662c:	2f01           	move.l d1,-(sp)
    662e:	2f00           	move.l d0,-(sp)
    6630:	2f2f 01d0      	move.l 464(sp),-(sp)
    6634:	2f2f 0056      	move.l 86(sp),-(sp)
    6638:	4eba 0578      	jsr 6bb2 <TestRow>(pc)
    663c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6640:	722a           	moveq #42,d1
    6642:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6646:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {
    664a:	52af 0096      	addq.l #1,150(sp)
    664e:	700f           	moveq #15,d0
    6650:	b0af 0096      	cmp.l 150(sp),d0
    6654:	6c00 ff78      	bge.w 65ce <TestZoom4Picture+0x287e>
  for(int i=0;i<7;i++) {
    6658:	52af 009e      	addq.l #1,158(sp)
    665c:	7206           	moveq #6,d1
    665e:	b2af 009e      	cmp.l 158(sp),d1
    6662:	6c00 ff14      	bge.w 6578 <TestZoom4Picture+0x2828>
    }
  }

  for(int i2=0;i2<2;i2++) {
    6666:	42af 0092      	clr.l 146(sp)
    666a:	6032           	bra.s 669e <TestZoom4Picture+0x294e>
    TestRow( valsupposed, valactual, mask, 251+i2);
    666c:	222f 0092      	move.l 146(sp),d1
    6670:	0681 0000 00fb 	addi.l #251,d1
    6676:	7000           	moveq #0,d0
    6678:	302f 01c6      	move.w 454(sp),d0
    667c:	2f01           	move.l d1,-(sp)
    667e:	2f00           	move.l d0,-(sp)
    6680:	2f2f 01d0      	move.l 464(sp),-(sp)
    6684:	2f2f 0056      	move.l 86(sp),-(sp)
    6688:	4eba 0528      	jsr 6bb2 <TestRow>(pc)
    668c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6690:	702a           	moveq #42,d0
    6692:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6696:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<2;i2++) {
    669a:	52af 0092      	addq.l #1,146(sp)
    669e:	7201           	moveq #1,d1
    66a0:	b2af 0092      	cmp.l 146(sp),d1
    66a4:	6cc6           	bge.s 666c <TestZoom4Picture+0x291c>
  }

  for(int i2=0;i2<8;i2++) {
    66a6:	42af 008e      	clr.l 142(sp)
    66aa:	6060           	bra.s 670c <TestZoom4Picture+0x29bc>
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    66ac:	202f 008e      	move.l 142(sp),d0
    66b0:	d080           	add.l d0,d0
    66b2:	2200           	move.l d0,d1
    66b4:	0681 0000 00fd 	addi.l #253,d1
    66ba:	7000           	moveq #0,d0
    66bc:	302f 01c6      	move.w 454(sp),d0
    66c0:	2f01           	move.l d1,-(sp)
    66c2:	2f00           	move.l d0,-(sp)
    66c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    66c8:	2f2f 0056      	move.l 86(sp),-(sp)
    66cc:	4eba 04e4      	jsr 6bb2 <TestRow>(pc)
    66d0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66d4:	702a           	moveq #42,d0
    66d6:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    66da:	707f           	moveq #127,d0
    66dc:	d0af 008e      	add.l 142(sp),d0
    66e0:	d080           	add.l d0,d0
    66e2:	2200           	move.l d0,d1
    66e4:	7000           	moveq #0,d0
    66e6:	302f 01c6      	move.w 454(sp),d0
    66ea:	2f01           	move.l d1,-(sp)
    66ec:	2f00           	move.l d0,-(sp)
    66ee:	2f2f 01d0      	move.l 464(sp),-(sp)
    66f2:	2f2f 0056      	move.l 86(sp),-(sp)
    66f6:	4eba 04ba      	jsr 6bb2 <TestRow>(pc)
    66fa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    66fe:	722a           	moveq #42,d1
    6700:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6704:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    6708:	52af 008e      	addq.l #1,142(sp)
    670c:	7007           	moveq #7,d0
    670e:	b0af 008e      	cmp.l 142(sp),d0
    6712:	6c98           	bge.s 66ac <TestZoom4Picture+0x295c>
  }

  tmp = source;
    6714:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    671a:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6720:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    6726:	4878 0001      	pea 1 <_start+0x1>
    672a:	4878 0010      	pea 10 <_start+0x10>
    672e:	2f2f 0056      	move.l 86(sp),-(sp)
    6732:	2f2f 006a      	move.l 106(sp),-(sp)
    6736:	4eba b3d0      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    673a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    673e:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    6744:	2c40           	movea.l d0,a6
    6746:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    674a:	222f 004e      	move.l 78(sp),d1
    674e:	5881           	addq.l #4,d1
    6750:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom17;
    6754:	2f7c 0000 b780 	move.l #46976,74(sp)
    675a:	004a 

  mask = 0xffff;
    675c:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<5;i2++) {
    6762:	42af 008a      	clr.l 138(sp)
    6766:	605a           	bra.s 67c2 <TestZoom4Picture+0x2a72>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6768:	202f 008a      	move.l 138(sp),d0
    676c:	d080           	add.l d0,d0
    676e:	2200           	move.l d0,d1
    6770:	7000           	moveq #0,d0
    6772:	302f 01c6      	move.w 454(sp),d0
    6776:	2f01           	move.l d1,-(sp)
    6778:	2f00           	move.l d0,-(sp)
    677a:	2f2f 01d0      	move.l 464(sp),-(sp)
    677e:	2f2f 0056      	move.l 86(sp),-(sp)
    6782:	4eba 042e      	jsr 6bb2 <TestRow>(pc)
    6786:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    678a:	702a           	moveq #42,d0
    678c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6790:	202f 008a      	move.l 138(sp),d0
    6794:	d080           	add.l d0,d0
    6796:	2200           	move.l d0,d1
    6798:	5281           	addq.l #1,d1
    679a:	7000           	moveq #0,d0
    679c:	302f 01c6      	move.w 454(sp),d0
    67a0:	2f01           	move.l d1,-(sp)
    67a2:	2f00           	move.l d0,-(sp)
    67a4:	2f2f 01d0      	move.l 464(sp),-(sp)
    67a8:	2f2f 0056      	move.l 86(sp),-(sp)
    67ac:	4eba 0404      	jsr 6bb2 <TestRow>(pc)
    67b0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    67b4:	722a           	moveq #42,d1
    67b6:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    67ba:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {
    67be:	52af 008a      	addq.l #1,138(sp)
    67c2:	7004           	moveq #4,d0
    67c4:	b0af 008a      	cmp.l 138(sp),d0
    67c8:	6c9e           	bge.s 6768 <TestZoom4Picture+0x2a18>
  }

  for(int i=0;i<7;i++) {
    67ca:	42af 0086      	clr.l 134(sp)
    67ce:	6000 00d4      	bra.w 68a4 <TestZoom4Picture+0x2b54>
      TestRow( valsupposed, valactual, mask, 10+i*35);
    67d2:	222f 0086      	move.l 134(sp),d1
    67d6:	2001           	move.l d1,d0
    67d8:	e988           	lsl.l #4,d0
    67da:	d081           	add.l d1,d0
    67dc:	d080           	add.l d0,d0
    67de:	2040           	movea.l d0,a0
    67e0:	d1c1           	adda.l d1,a0
    67e2:	41e8 000a      	lea 10(a0),a0
    67e6:	7000           	moveq #0,d0
    67e8:	302f 01c6      	move.w 454(sp),d0
    67ec:	2f08           	move.l a0,-(sp)
    67ee:	2f00           	move.l d0,-(sp)
    67f0:	2f2f 01d0      	move.l 464(sp),-(sp)
    67f4:	2f2f 0056      	move.l 86(sp),-(sp)
    67f8:	4eba 03b8      	jsr 6bb2 <TestRow>(pc)
    67fc:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6800:	722a           	moveq #42,d1
    6802:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    6806:	466f 01c6      	not.w 454(sp)
    
    for(int i2=0;i2<17;i2++) {
    680a:	42af 0082      	clr.l 130(sp)
    680e:	6000 0086      	bra.w 6896 <TestZoom4Picture+0x2b46>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6812:	222f 0086      	move.l 134(sp),d1
    6816:	2001           	move.l d1,d0
    6818:	e988           	lsl.l #4,d0
    681a:	d081           	add.l d1,d0
    681c:	d080           	add.l d0,d0
    681e:	2040           	movea.l d0,a0
    6820:	d1c1           	adda.l d1,a0
    6822:	41e8 000b      	lea 11(a0),a0
    6826:	202f 0082      	move.l 130(sp),d0
    682a:	d080           	add.l d0,d0
    682c:	2208           	move.l a0,d1
    682e:	d280           	add.l d0,d1
    6830:	7000           	moveq #0,d0
    6832:	302f 01c6      	move.w 454(sp),d0
    6836:	2f01           	move.l d1,-(sp)
    6838:	2f00           	move.l d0,-(sp)
    683a:	2f2f 01d0      	move.l 464(sp),-(sp)
    683e:	2f2f 0056      	move.l 86(sp),-(sp)
    6842:	4eba 036e      	jsr 6bb2 <TestRow>(pc)
    6846:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    684a:	702a           	moveq #42,d0
    684c:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6850:	222f 0086      	move.l 134(sp),d1
    6854:	2001           	move.l d1,d0
    6856:	e988           	lsl.l #4,d0
    6858:	d081           	add.l d1,d0
    685a:	d080           	add.l d0,d0
    685c:	2040           	movea.l d0,a0
    685e:	d1c1           	adda.l d1,a0
    6860:	41e8 000c      	lea 12(a0),a0
    6864:	202f 0082      	move.l 130(sp),d0
    6868:	d080           	add.l d0,d0
    686a:	2208           	move.l a0,d1
    686c:	d280           	add.l d0,d1
    686e:	7000           	moveq #0,d0
    6870:	302f 01c6      	move.w 454(sp),d0
    6874:	2f01           	move.l d1,-(sp)
    6876:	2f00           	move.l d0,-(sp)
    6878:	2f2f 01d0      	move.l 464(sp),-(sp)
    687c:	2f2f 0056      	move.l 86(sp),-(sp)
    6880:	4eba 0330      	jsr 6bb2 <TestRow>(pc)
    6884:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6888:	722a           	moveq #42,d1
    688a:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    688e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<17;i2++) {
    6892:	52af 0082      	addq.l #1,130(sp)
    6896:	7010           	moveq #16,d0
    6898:	b0af 0082      	cmp.l 130(sp),d0
    689c:	6c00 ff74      	bge.w 6812 <TestZoom4Picture+0x2ac2>
  for(int i=0;i<7;i++) {
    68a0:	52af 0086      	addq.l #1,134(sp)
    68a4:	7206           	moveq #6,d1
    68a6:	b2af 0086      	cmp.l 134(sp),d1
    68aa:	6c00 ff26      	bge.w 67d2 <TestZoom4Picture+0x2a82>
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    68ae:	7000           	moveq #0,d0
    68b0:	302f 01c6      	move.w 454(sp),d0
    68b4:	4878 00ff      	pea ff <FreeDisplay+0x1f>
    68b8:	2f00           	move.l d0,-(sp)
    68ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    68be:	2f2f 0056      	move.l 86(sp),-(sp)
    68c2:	4eba 02ee      	jsr 6bb2 <TestRow>(pc)
    68c6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    68ca:	702a           	moveq #42,d0
    68cc:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    68d0:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<7;i2++) {
    68d4:	42af 007e      	clr.l 126(sp)
    68d8:	6064           	bra.s 693e <TestZoom4Picture+0x2bee>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    68da:	202f 007e      	move.l 126(sp),d0
    68de:	0680 0000 0080 	addi.l #128,d0
    68e4:	d080           	add.l d0,d0
    68e6:	2200           	move.l d0,d1
    68e8:	7000           	moveq #0,d0
    68ea:	302f 01c6      	move.w 454(sp),d0
    68ee:	2f01           	move.l d1,-(sp)
    68f0:	2f00           	move.l d0,-(sp)
    68f2:	2f2f 01d0      	move.l 464(sp),-(sp)
    68f6:	2f2f 0056      	move.l 86(sp),-(sp)
    68fa:	4eba 02b6      	jsr 6bb2 <TestRow>(pc)
    68fe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6902:	722a           	moveq #42,d1
    6904:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6908:	202f 007e      	move.l 126(sp),d0
    690c:	d080           	add.l d0,d0
    690e:	2200           	move.l d0,d1
    6910:	0681 0000 0101 	addi.l #257,d1
    6916:	7000           	moveq #0,d0
    6918:	302f 01c6      	move.w 454(sp),d0
    691c:	2f01           	move.l d1,-(sp)
    691e:	2f00           	move.l d0,-(sp)
    6920:	2f2f 01d0      	move.l 464(sp),-(sp)
    6924:	2f2f 0056      	move.l 86(sp),-(sp)
    6928:	4eba 0288      	jsr 6bb2 <TestRow>(pc)
    692c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6930:	702a           	moveq #42,d0
    6932:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6936:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {
    693a:	52af 007e      	addq.l #1,126(sp)
    693e:	7206           	moveq #6,d1
    6940:	b2af 007e      	cmp.l 126(sp),d1
    6944:	6c94           	bge.s 68da <TestZoom4Picture+0x2b8a>
  }   

  tmp = source;
    6946:	2f6f 005e 0046 	move.l 94(sp),70(sp)
  source = destination;
    694c:	2f6f 004e 005e 	move.l 78(sp),94(sp)
  destination = tmp;
    6952:	2f6f 0046 004e 	move.l 70(sp),78(sp)

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    6958:	4878 0001      	pea 1 <_start+0x1>
    695c:	4878 0011      	pea 11 <_start+0x11>
    6960:	2f2f 0056      	move.l 86(sp),-(sp)
    6964:	2f2f 006a      	move.l 106(sp),-(sp)
    6968:	4eba b19e      	jsr 1b08 <Zoom_ZoomIntoPicture>(pc)
    696c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6970:	2039 0000 b808 	move.l b808 <GfxBase>,d0
    6976:	2c40           	movea.l d0,a6
    6978:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    697c:	202f 004e      	move.l 78(sp),d0
    6980:	5880           	addq.l #4,d0
    6982:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom18;
    6986:	2f7c 0000 b7ac 	move.l #47020,74(sp)
    698c:	004a 

  mask = 0xffff;
    698e:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);
    6994:	7000           	moveq #0,d0
    6996:	302f 01c6      	move.w 454(sp),d0
    699a:	42a7           	clr.l -(sp)
    699c:	2f00           	move.l d0,-(sp)
    699e:	2f2f 01d0      	move.l 464(sp),-(sp)
    69a2:	2f2f 0056      	move.l 86(sp),-(sp)
    69a6:	4eba 020a      	jsr 6bb2 <TestRow>(pc)
    69aa:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    69ae:	722a           	moveq #42,d1
    69b0:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    69b4:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<4;i2++) {
    69b8:	42af 007a      	clr.l 122(sp)
    69bc:	605c           	bra.s 6a1a <TestZoom4Picture+0x2cca>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    69be:	202f 007a      	move.l 122(sp),d0
    69c2:	d080           	add.l d0,d0
    69c4:	2200           	move.l d0,d1
    69c6:	5281           	addq.l #1,d1
    69c8:	7000           	moveq #0,d0
    69ca:	302f 01c6      	move.w 454(sp),d0
    69ce:	2f01           	move.l d1,-(sp)
    69d0:	2f00           	move.l d0,-(sp)
    69d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    69d6:	2f2f 0056      	move.l 86(sp),-(sp)
    69da:	4eba 01d6      	jsr 6bb2 <TestRow>(pc)
    69de:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    69e2:	702a           	moveq #42,d0
    69e4:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    69e8:	202f 007a      	move.l 122(sp),d0
    69ec:	5280           	addq.l #1,d0
    69ee:	d080           	add.l d0,d0
    69f0:	2200           	move.l d0,d1
    69f2:	7000           	moveq #0,d0
    69f4:	302f 01c6      	move.w 454(sp),d0
    69f8:	2f01           	move.l d1,-(sp)
    69fa:	2f00           	move.l d0,-(sp)
    69fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a00:	2f2f 0056      	move.l 86(sp),-(sp)
    6a04:	4eba 01ac      	jsr 6bb2 <TestRow>(pc)
    6a08:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6a0c:	722a           	moveq #42,d1
    6a0e:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6a12:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6a16:	52af 007a      	addq.l #1,122(sp)
    6a1a:	7003           	moveq #3,d0
    6a1c:	b0af 007a      	cmp.l 122(sp),d0
    6a20:	6c9c           	bge.s 69be <TestZoom4Picture+0x2c6e>
  }

  for(int i=0;i<7;i++) {  
    6a22:	42af 0076      	clr.l 118(sp)
    6a26:	6000 009c      	bra.w 6ac4 <TestZoom4Picture+0x2d74>
    for(int i2=0;i2<18;i2++) {
    6a2a:	42af 0072      	clr.l 114(sp)
    6a2e:	6000 0086      	bra.w 6ab6 <TestZoom4Picture+0x2d66>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6a32:	222f 0076      	move.l 118(sp),d1
    6a36:	2001           	move.l d1,d0
    6a38:	e988           	lsl.l #4,d0
    6a3a:	d081           	add.l d1,d0
    6a3c:	d080           	add.l d0,d0
    6a3e:	2040           	movea.l d0,a0
    6a40:	d1c1           	adda.l d1,a0
    6a42:	41e8 000b      	lea 11(a0),a0
    6a46:	202f 0072      	move.l 114(sp),d0
    6a4a:	d080           	add.l d0,d0
    6a4c:	2208           	move.l a0,d1
    6a4e:	d280           	add.l d0,d1
    6a50:	7000           	moveq #0,d0
    6a52:	302f 01c6      	move.w 454(sp),d0
    6a56:	2f01           	move.l d1,-(sp)
    6a58:	2f00           	move.l d0,-(sp)
    6a5a:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a5e:	2f2f 0056      	move.l 86(sp),-(sp)
    6a62:	4eba 014e      	jsr 6bb2 <TestRow>(pc)
    6a66:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6a6a:	722a           	moveq #42,d1
    6a6c:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6a70:	222f 0076      	move.l 118(sp),d1
    6a74:	2001           	move.l d1,d0
    6a76:	e988           	lsl.l #4,d0
    6a78:	d081           	add.l d1,d0
    6a7a:	d080           	add.l d0,d0
    6a7c:	2040           	movea.l d0,a0
    6a7e:	d1c1           	adda.l d1,a0
    6a80:	41e8 000c      	lea 12(a0),a0
    6a84:	202f 0072      	move.l 114(sp),d0
    6a88:	d080           	add.l d0,d0
    6a8a:	2208           	move.l a0,d1
    6a8c:	d280           	add.l d0,d1
    6a8e:	7000           	moveq #0,d0
    6a90:	302f 01c6      	move.w 454(sp),d0
    6a94:	2f01           	move.l d1,-(sp)
    6a96:	2f00           	move.l d0,-(sp)
    6a98:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a9c:	2f2f 0056      	move.l 86(sp),-(sp)
    6aa0:	4eba 0110      	jsr 6bb2 <TestRow>(pc)
    6aa4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6aa8:	702a           	moveq #42,d0
    6aaa:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6aae:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) {
    6ab2:	52af 0072      	addq.l #1,114(sp)
    6ab6:	7211           	moveq #17,d1
    6ab8:	b2af 0072      	cmp.l 114(sp),d1
    6abc:	6c00 ff74      	bge.w 6a32 <TestZoom4Picture+0x2ce2>
  for(int i=0;i<7;i++) {  
    6ac0:	52af 0076      	addq.l #1,118(sp)
    6ac4:	7006           	moveq #6,d0
    6ac6:	b0af 0076      	cmp.l 118(sp),d0
    6aca:	6c00 ff5e      	bge.w 6a2a <TestZoom4Picture+0x2cda>
    }
  } 

  for(int i2=0;i2<4;i2++) {
    6ace:	42af 006e      	clr.l 110(sp)
    6ad2:	6064           	bra.s 6b38 <TestZoom4Picture+0x2de8>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6ad4:	202f 006e      	move.l 110(sp),d0
    6ad8:	0680 0000 0080 	addi.l #128,d0
    6ade:	d080           	add.l d0,d0
    6ae0:	2200           	move.l d0,d1
    6ae2:	7000           	moveq #0,d0
    6ae4:	302f 01c6      	move.w 454(sp),d0
    6ae8:	2f01           	move.l d1,-(sp)
    6aea:	2f00           	move.l d0,-(sp)
    6aec:	2f2f 01d0      	move.l 464(sp),-(sp)
    6af0:	2f2f 0056      	move.l 86(sp),-(sp)
    6af4:	4eba 00bc      	jsr 6bb2 <TestRow>(pc)
    6af8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6afc:	722a           	moveq #42,d1
    6afe:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6b02:	202f 006e      	move.l 110(sp),d0
    6b06:	d080           	add.l d0,d0
    6b08:	2200           	move.l d0,d1
    6b0a:	0681 0000 0101 	addi.l #257,d1
    6b10:	7000           	moveq #0,d0
    6b12:	302f 01c6      	move.w 454(sp),d0
    6b16:	2f01           	move.l d1,-(sp)
    6b18:	2f00           	move.l d0,-(sp)
    6b1a:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b1e:	2f2f 0056      	move.l 86(sp),-(sp)
    6b22:	4eba 008e      	jsr 6bb2 <TestRow>(pc)
    6b26:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6b2a:	702a           	moveq #42,d0
    6b2c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6b30:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6b34:	52af 006e      	addq.l #1,110(sp)
    6b38:	7203           	moveq #3,d1
    6b3a:	b2af 006e      	cmp.l 110(sp),d1
    6b3e:	6c94           	bge.s 6ad4 <TestZoom4Picture+0x2d84>
  }
  TestRow( valsupposed, valactual, mask, 0);
    6b40:	7000           	moveq #0,d0
    6b42:	302f 01c6      	move.w 454(sp),d0
    6b46:	42a7           	clr.l -(sp)
    6b48:	2f00           	move.l d0,-(sp)
    6b4a:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b4e:	2f2f 0056      	move.l 86(sp),-(sp)
    6b52:	4eba 005e      	jsr 6bb2 <TestRow>(pc)
    6b56:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6b5a:	702a           	moveq #42,d0
    6b5c:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6b60:	466f 01c6      	not.w 454(sp)
  FreeMem( source, (ZMLINESIZE+4)*272);
    6b64:	2f6f 005e 0042 	move.l 94(sp),66(sp)
    6b6a:	2f7c 0000 30e0 	move.l #12512,62(sp)
    6b70:	003e 
    6b72:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    6b78:	2c40           	movea.l d0,a6
    6b7a:	226f 0042      	movea.l 66(sp),a1
    6b7e:	202f 003e      	move.l 62(sp),d0
    6b82:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    6b86:	2f6f 004e 003a 	move.l 78(sp),58(sp)
    6b8c:	2f7c 0000 30e0 	move.l #12512,54(sp)
    6b92:	0036 
    6b94:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    6b9a:	2c40           	movea.l d0,a6
    6b9c:	226f 003a      	movea.l 58(sp),a1
    6ba0:	202f 0036      	move.l 54(sp),d0
    6ba4:	4eae ff2e      	jsr -210(a6)
}
    6ba8:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    6bac:	4fef 01d0      	lea 464(sp),sp
    6bb0:	4e75           	rts

00006bb2 <TestRow>:

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    6bb2:	4fef ff40      	lea -192(sp),sp
    6bb6:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
    6bba:	202f 00e0      	move.l 224(sp),d0
    6bbe:	3000           	move.w d0,d0
    6bc0:	3f40 0016      	move.w d0,22(sp)
  
  char str[ 100] = { 0 };
    6bc4:	42af 001c      	clr.l 28(sp)
    6bc8:	7020           	moveq #32,d0
    6bca:	d08f           	add.l sp,d0
    6bcc:	7260           	moveq #96,d1
    6bce:	2f01           	move.l d1,-(sp)
    6bd0:	42a7           	clr.l -(sp)
    6bd2:	2f00           	move.l d0,-(sp)
    6bd4:	4eba 020c      	jsr 6de2 <memset>(pc)
    6bd8:	4fef 000c      	lea 12(sp),sp
  UWORD data[2];
  data[1] = numberofline;
    6bdc:	202f 00e4      	move.l 228(sp),d0
    6be0:	3f40 001a      	move.w d0,26(sp)

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    6be4:	42af 00d0      	clr.l 208(sp)
    6be8:	6000 00d4      	bra.w 6cbe <TestRow+0x10c>
    if( (*testpattern++ ^ xormask) != *destination++) {
    6bec:	202f 00d8      	move.l 216(sp),d0
    6bf0:	2200           	move.l d0,d1
    6bf2:	5481           	addq.l #2,d1
    6bf4:	2f41 00d8      	move.l d1,216(sp)
    6bf8:	2040           	movea.l d0,a0
    6bfa:	3010           	move.w (a0),d0
    6bfc:	322f 0016      	move.w 22(sp),d1
    6c00:	b141           	eor.w d0,d1
    6c02:	202f 00dc      	move.l 220(sp),d0
    6c06:	2400           	move.l d0,d2
    6c08:	5482           	addq.l #2,d2
    6c0a:	2f42 00dc      	move.l d2,220(sp)
    6c0e:	2040           	movea.l d0,a0
    6c10:	3010           	move.w (a0),d0
    6c12:	b041           	cmp.w d1,d0
    6c14:	6700 00a4      	beq.w 6cba <TestRow+0x108>
      data[0] = i;
    6c18:	202f 00d0      	move.l 208(sp),d0
    6c1c:	3f40 0018      	move.w d0,24(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    6c20:	2f7c 0000 855c 	move.l #34140,164(sp)
    6c26:	00a4 
    6c28:	702b           	moveq #43,d0
    6c2a:	4600           	not.b d0
    6c2c:	d08f           	add.l sp,d0
    6c2e:	0680 ffff ff44 	addi.l #-188,d0
    6c34:	2f40 00a0      	move.l d0,160(sp)
    6c38:	2f7c 0000 7280 	move.l #29312,156(sp)
    6c3e:	009c 
    6c40:	722b           	moveq #43,d1
    6c42:	4601           	not.b d1
    6c44:	d28f           	add.l sp,d1
    6c46:	0681 ffff ff48 	addi.l #-184,d1
    6c4c:	2f41 0098      	move.l d1,152(sp)
    6c50:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    6c56:	2c40           	movea.l d0,a6
    6c58:	206f 00a4      	movea.l 164(sp),a0
    6c5c:	226f 00a0      	movea.l 160(sp),a1
    6c60:	246f 009c      	movea.l 156(sp),a2
    6c64:	266f 0098      	movea.l 152(sp),a3
    6c68:	4eae fdf6      	jsr -522(a6)
    6c6c:	2f40 0094      	move.l d0,148(sp)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    6c70:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    6c76:	2c40           	movea.l d0,a6
    6c78:	4eae ffc4      	jsr -60(a6)
    6c7c:	2f40 0090      	move.l d0,144(sp)
    6c80:	202f 0090      	move.l 144(sp),d0
    6c84:	2f40 008c      	move.l d0,140(sp)
    6c88:	742b           	moveq #43,d2
    6c8a:	4602           	not.b d2
    6c8c:	d48f           	add.l sp,d2
    6c8e:	0682 ffff ff48 	addi.l #-184,d2
    6c94:	2f42 0088      	move.l d2,136(sp)
    6c98:	7064           	moveq #100,d0
    6c9a:	2f40 0084      	move.l d0,132(sp)
    6c9e:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    6ca4:	2c40           	movea.l d0,a6
    6ca6:	222f 008c      	move.l 140(sp),d1
    6caa:	242f 0088      	move.l 136(sp),d2
    6cae:	262f 0084      	move.l 132(sp),d3
    6cb2:	4eae ffd0      	jsr -48(a6)
    6cb6:	2f40 0080      	move.l d0,128(sp)
  for(int i=0;i<21;i++) {
    6cba:	52af 00d0      	addq.l #1,208(sp)
    6cbe:	7214           	moveq #20,d1
    6cc0:	b2af 00d0      	cmp.l 208(sp),d1
    6cc4:	6c00 ff26      	bge.w 6bec <TestRow+0x3a>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    6cc8:	206f 00d8      	movea.l 216(sp),a0
    6ccc:	3010           	move.w (a0),d0
    6cce:	322f 0016      	move.w 22(sp),d1
    6cd2:	b141           	eor.w d0,d1
    6cd4:	206f 00dc      	movea.l 220(sp),a0
    6cd8:	3010           	move.w (a0),d0
    6cda:	b340           	eor.w d1,d0
    6cdc:	3000           	move.w d0,d0
    6cde:	0280 0000 ffff 	andi.l #65535,d0
    6ce4:	0280 0000 ff00 	andi.l #65280,d0
    6cea:	6700 00cc      	beq.w 6db8 <TestRow+0x206>
    data[0] = 21;
    6cee:	3f7c 0015 0018 	move.w #21,24(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    6cf4:	2f7c 0000 855c 	move.l #34140,204(sp)
    6cfa:	00cc 
    6cfc:	742b           	moveq #43,d2
    6cfe:	4602           	not.b d2
    6d00:	d48f           	add.l sp,d2
    6d02:	0682 ffff ff44 	addi.l #-188,d2
    6d08:	2f42 00c8      	move.l d2,200(sp)
    6d0c:	2f7c 0000 7280 	move.l #29312,196(sp)
    6d12:	00c4 
    6d14:	702b           	moveq #43,d0
    6d16:	4600           	not.b d0
    6d18:	d08f           	add.l sp,d0
    6d1a:	0680 ffff ff48 	addi.l #-184,d0
    6d20:	2f40 00c0      	move.l d0,192(sp)
    6d24:	2039 0000 b7fc 	move.l b7fc <SysBase>,d0
    6d2a:	2c40           	movea.l d0,a6
    6d2c:	206f 00cc      	movea.l 204(sp),a0
    6d30:	226f 00c8      	movea.l 200(sp),a1
    6d34:	246f 00c4      	movea.l 196(sp),a2
    6d38:	266f 00c0      	movea.l 192(sp),a3
    6d3c:	4eae fdf6      	jsr -522(a6)
    6d40:	2f40 00bc      	move.l d0,188(sp)
                                                                           str);
    Write(  Output(), str, 100);
    6d44:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    6d4a:	2c40           	movea.l d0,a6
    6d4c:	4eae ffc4      	jsr -60(a6)
    6d50:	2f40 00b8      	move.l d0,184(sp)
    6d54:	202f 00b8      	move.l 184(sp),d0
    6d58:	2f40 00b4      	move.l d0,180(sp)
    6d5c:	722b           	moveq #43,d1
    6d5e:	4601           	not.b d1
    6d60:	d28f           	add.l sp,d1
    6d62:	0681 ffff ff48 	addi.l #-184,d1
    6d68:	2f41 00b0      	move.l d1,176(sp)
    6d6c:	7464           	moveq #100,d2
    6d6e:	2f42 00ac      	move.l d2,172(sp)
    6d72:	2039 0000 b804 	move.l b804 <DOSBase>,d0
    6d78:	2c40           	movea.l d0,a6
    6d7a:	222f 00b4      	move.l 180(sp),d1
    6d7e:	242f 00b0      	move.l 176(sp),d2
    6d82:	262f 00ac      	move.l 172(sp),d3
    6d86:	4eae ffd0      	jsr -48(a6)
    6d8a:	2f40 00a8      	move.l d0,168(sp)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
    6d8e:	206f 00dc      	movea.l 220(sp),a0
    6d92:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6d94:	7200           	moveq #0,d1
    6d96:	3200           	move.w d0,d1
                                                   *testpattern,*destination);
    6d98:	206f 00d8      	movea.l 216(sp),a0
    6d9c:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6d9e:	3000           	move.w d0,d0
    6da0:	0280 0000 ffff 	andi.l #65535,d0
    6da6:	2f01           	move.l d1,-(sp)
    6da8:	2f00           	move.l d0,-(sp)
    6daa:	4879 0000 858c 	pea 858c <rundemo.c.95627ee6+0x1d5>
    6db0:	4eba 0162      	jsr 6f14 <KPrintF>(pc)
    6db4:	4fef 000c      	lea 12(sp),sp
     
  }
}
    6db8:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    6dbc:	4fef 00c0      	lea 192(sp),sp
    6dc0:	4e75           	rts

00006dc2 <strlen>:
{
    6dc2:	598f           	subq.l #4,sp
	unsigned long t=0;
    6dc4:	4297           	clr.l (sp)
    6dc6:	6002           	bra.s 6dca <strlen+0x8>
		t++;
    6dc8:	5297           	addq.l #1,(sp)
	while(*s++)
    6dca:	202f 0008      	move.l 8(sp),d0
    6dce:	2200           	move.l d0,d1
    6dd0:	5281           	addq.l #1,d1
    6dd2:	2f41 0008      	move.l d1,8(sp)
    6dd6:	2040           	movea.l d0,a0
    6dd8:	1010           	move.b (a0),d0
    6dda:	66ec           	bne.s 6dc8 <strlen+0x6>
	return t;
    6ddc:	2017           	move.l (sp),d0
}
    6dde:	588f           	addq.l #4,sp
    6de0:	4e75           	rts

00006de2 <memset>:
{
    6de2:	4e55 fffc      	link.w a5,#-4
	unsigned char *ptr = (unsigned char *)dest;
    6de6:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
    6dec:	6014           	bra.s 6e02 <memset+0x20>
		*ptr++ = val;
    6dee:	202d fffc      	move.l -4(a5),d0
    6df2:	2200           	move.l d0,d1
    6df4:	5281           	addq.l #1,d1
    6df6:	2b41 fffc      	move.l d1,-4(a5)
    6dfa:	222d 000c      	move.l 12(a5),d1
    6dfe:	2040           	movea.l d0,a0
    6e00:	1081           	move.b d1,(a0)
	while(len-- > 0)
    6e02:	202d 0010      	move.l 16(a5),d0
    6e06:	2200           	move.l d0,d1
    6e08:	5381           	subq.l #1,d1
    6e0a:	2b41 0010      	move.l d1,16(a5)
    6e0e:	4a80           	tst.l d0
    6e10:	66dc           	bne.s 6dee <memset+0xc>
	return dest;
    6e12:	202d 0008      	move.l 8(a5),d0
}
    6e16:	4e5d           	unlk a5
    6e18:	4e75           	rts

00006e1a <memcpy>:
{
    6e1a:	4e55 fff8      	link.w a5,#-8
    6e1e:	2f02           	move.l d2,-(sp)
	char *d = (char *)dest;
    6e20:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = (const char *)src;
    6e26:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
    6e2c:	6020           	bra.s 6e4e <memcpy+0x34>
		*d++ = *s++;
    6e2e:	222d fff8      	move.l -8(a5),d1
    6e32:	2001           	move.l d1,d0
    6e34:	5280           	addq.l #1,d0
    6e36:	2b40 fff8      	move.l d0,-8(a5)
    6e3a:	202d fffc      	move.l -4(a5),d0
    6e3e:	2400           	move.l d0,d2
    6e40:	5282           	addq.l #1,d2
    6e42:	2b42 fffc      	move.l d2,-4(a5)
    6e46:	2041           	movea.l d1,a0
    6e48:	1210           	move.b (a0),d1
    6e4a:	2040           	movea.l d0,a0
    6e4c:	1081           	move.b d1,(a0)
	while(len--)
    6e4e:	202d 0010      	move.l 16(a5),d0
    6e52:	2200           	move.l d0,d1
    6e54:	5381           	subq.l #1,d1
    6e56:	2b41 0010      	move.l d1,16(a5)
    6e5a:	4a80           	tst.l d0
    6e5c:	66d0           	bne.s 6e2e <memcpy+0x14>
	return dest;
    6e5e:	202d 0008      	move.l 8(a5),d0
}
    6e62:	241f           	move.l (sp)+,d2
    6e64:	4e5d           	unlk a5
    6e66:	4e75           	rts

00006e68 <memmove>:
{
    6e68:	4e55 fff0      	link.w a5,#-16
    6e6c:	2f02           	move.l d2,-(sp)
	char *d = dest;
    6e6e:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = src;
    6e74:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
	if (d < s) {
    6e7a:	202d fffc      	move.l -4(a5),d0
    6e7e:	b0ad fff8      	cmp.l -8(a5),d0
    6e82:	6522           	bcs.s 6ea6 <memmove+0x3e>
    6e84:	6032           	bra.s 6eb8 <memmove+0x50>
			*d++ = *s++;
    6e86:	222d fff8      	move.l -8(a5),d1
    6e8a:	2401           	move.l d1,d2
    6e8c:	5282           	addq.l #1,d2
    6e8e:	2b42 fff8      	move.l d2,-8(a5)
    6e92:	202d fffc      	move.l -4(a5),d0
    6e96:	2400           	move.l d0,d2
    6e98:	5282           	addq.l #1,d2
    6e9a:	2b42 fffc      	move.l d2,-4(a5)
    6e9e:	2041           	movea.l d1,a0
    6ea0:	1210           	move.b (a0),d1
    6ea2:	2040           	movea.l d0,a0
    6ea4:	1081           	move.b d1,(a0)
		while (len--)
    6ea6:	202d 0010      	move.l 16(a5),d0
    6eaa:	2200           	move.l d0,d1
    6eac:	5381           	subq.l #1,d1
    6eae:	2b41 0010      	move.l d1,16(a5)
    6eb2:	4a80           	tst.l d0
    6eb4:	66d0           	bne.s 6e86 <memmove+0x1e>
    6eb6:	6052           	bra.s 6f0a <memmove+0xa2>
		const char *lasts = s + (len - 1);
    6eb8:	202d 0010      	move.l 16(a5),d0
    6ebc:	5380           	subq.l #1,d0
    6ebe:	242d fff8      	move.l -8(a5),d2
    6ec2:	d480           	add.l d0,d2
    6ec4:	2b42 fff4      	move.l d2,-12(a5)
		char *lastd = d + (len - 1);
    6ec8:	202d 0010      	move.l 16(a5),d0
    6ecc:	5380           	subq.l #1,d0
    6ece:	222d fffc      	move.l -4(a5),d1
    6ed2:	d280           	add.l d0,d1
    6ed4:	2b41 fff0      	move.l d1,-16(a5)
    6ed8:	6020           	bra.s 6efa <memmove+0x92>
			*lastd-- = *lasts--;
    6eda:	222d fff4      	move.l -12(a5),d1
    6ede:	2401           	move.l d1,d2
    6ee0:	5382           	subq.l #1,d2
    6ee2:	2b42 fff4      	move.l d2,-12(a5)
    6ee6:	202d fff0      	move.l -16(a5),d0
    6eea:	2400           	move.l d0,d2
    6eec:	5382           	subq.l #1,d2
    6eee:	2b42 fff0      	move.l d2,-16(a5)
    6ef2:	2041           	movea.l d1,a0
    6ef4:	1210           	move.b (a0),d1
    6ef6:	2040           	movea.l d0,a0
    6ef8:	1081           	move.b d1,(a0)
		while (len--)
    6efa:	202d 0010      	move.l 16(a5),d0
    6efe:	2200           	move.l d0,d1
    6f00:	5381           	subq.l #1,d1
    6f02:	2b41 0010      	move.l d1,16(a5)
    6f06:	4a80           	tst.l d0
    6f08:	66d0           	bne.s 6eda <memmove+0x72>
	return dest;
    6f0a:	202d 0008      	move.l 8(a5),d0
}
    6f0e:	241f           	move.l (sp)+,d2
    6f10:	4e5d           	unlk a5
    6f12:	4e75           	rts

00006f14 <KPrintF>:
{
    6f14:	4fef ff80      	lea -128(sp),sp
    6f18:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    6f1c:	3039 00f0 ff60 	move.w f0ff60 <gcc8_c_support.c.f93356b9+0xef08ff>,d0
    6f22:	0c40 4eb9      	cmpi.w #20153,d0
    6f26:	6722           	beq.s 6f4a <KPrintF+0x36>
    6f28:	0c40 a00e      	cmpi.w #-24562,d0
    6f2c:	671c           	beq.s 6f4a <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    6f2e:	2c79 0000 b7fc 	movea.l b7fc <SysBase>,a6
    6f34:	206f 0090      	movea.l 144(sp),a0
    6f38:	43ef 0094      	lea 148(sp),a1
    6f3c:	45f9 0000 7272 	lea 7272 <KPutCharX>,a2
    6f42:	97cb           	suba.l a3,a3
    6f44:	4eae fdf6      	jsr -522(a6)
    6f48:	602a           	bra.s 6f74 <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    6f4a:	2c79 0000 b7fc 	movea.l b7fc <SysBase>,a6
    6f50:	206f 0090      	movea.l 144(sp),a0
    6f54:	43ef 0094      	lea 148(sp),a1
    6f58:	45f9 0000 7280 	lea 7280 <PutChar>,a2
    6f5e:	47ef 000c      	lea 12(sp),a3
    6f62:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    6f66:	2f0b           	move.l a3,-(sp)
    6f68:	4878 0056      	pea 56 <_start+0x56>
    6f6c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.f93356b9+0xef08ff>
    6f72:	508f           	addq.l #8,sp
}
    6f74:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    6f78:	4fef 0080      	lea 128(sp),sp
    6f7c:	4e75           	rts

00006f7e <warpmode>:

void warpmode(int on) // bool
{
    6f7e:	518f           	subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
    6f80:	2f7c 00f0 ff60 	move.l #15794016,4(sp)
    6f86:	0004 
    if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
    6f88:	206f 0004      	movea.l 4(sp),a0
    6f8c:	3010           	move.w (a0),d0
    6f8e:	0c40 4eb9      	cmpi.w #20153,d0
    6f92:	670c           	beq.s 6fa0 <warpmode+0x22>
    6f94:	206f 0004      	movea.l 4(sp),a0
    6f98:	3010           	move.w (a0),d0
    6f9a:	0c40 a00e      	cmpi.w #-24562,d0
    6f9e:	6668           	bne.s 7008 <warpmode+0x8a>
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    6fa0:	4aaf 000c      	tst.l 12(sp)
    6fa4:	6708           	beq.s 6fae <warpmode+0x30>
    6fa6:	203c 0000 85b2 	move.l #34226,d0
    6fac:	6006           	bra.s 6fb4 <warpmode+0x36>
    6fae:	203c 0000 85bc 	move.l #34236,d0
    6fb4:	4878 0001      	pea 1 <_start+0x1>
    6fb8:	220f           	move.l sp,d1
    6fba:	5e81           	addq.l #7,d1
    6fbc:	2f01           	move.l d1,-(sp)
    6fbe:	42a7           	clr.l -(sp)
    6fc0:	2f00           	move.l d0,-(sp)
    6fc2:	4878 ffff      	pea ffffffff <gcc8_c_support.c.f93356b9+0xfffe099e>
    6fc6:	4878 0052      	pea 52 <_start+0x52>
    6fca:	206f 001c      	movea.l 28(sp),a0
    6fce:	4e90           	jsr (a0)
    6fd0:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    6fd4:	4aaf 000c      	tst.l 12(sp)
    6fd8:	6708           	beq.s 6fe2 <warpmode+0x64>
    6fda:	203c 0000 85c7 	move.l #34247,d0
    6fe0:	6006           	bra.s 6fe8 <warpmode+0x6a>
    6fe2:	203c 0000 85e1 	move.l #34273,d0
    6fe8:	4878 0001      	pea 1 <_start+0x1>
    6fec:	220f           	move.l sp,d1
    6fee:	5e81           	addq.l #7,d1
    6ff0:	2f01           	move.l d1,-(sp)
    6ff2:	42a7           	clr.l -(sp)
    6ff4:	2f00           	move.l d0,-(sp)
    6ff6:	4878 ffff      	pea ffffffff <gcc8_c_support.c.f93356b9+0xfffe099e>
    6ffa:	4878 0052      	pea 52 <_start+0x52>
    6ffe:	206f 001c      	movea.l 28(sp),a0
    7002:	4e90           	jsr (a0)
    7004:	4fef 0018      	lea 24(sp),sp
	}
}
    7008:	508f           	addq.l #8,sp
    700a:	4e75           	rts

0000700c <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4)
{
    700c:	598f           	subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
    700e:	2ebc 00f0 ff60 	move.l #15794016,(sp)
    if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    7014:	2057           	movea.l (sp),a0
    7016:	3010           	move.w (a0),d0
    7018:	0c40 4eb9      	cmpi.w #20153,d0
    701c:	670a           	beq.s 7028 <debug_cmd+0x1c>
    701e:	2057           	movea.l (sp),a0
    7020:	3010           	move.w (a0),d0
    7022:	0c40 a00e      	cmpi.w #-24562,d0
    7026:	661e           	bne.s 7046 <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
    7028:	2f2f 0014      	move.l 20(sp),-(sp)
    702c:	2f2f 0014      	move.l 20(sp),-(sp)
    7030:	2f2f 0014      	move.l 20(sp),-(sp)
    7034:	2f2f 0014      	move.l 20(sp),-(sp)
    7038:	4878 0058      	pea 58 <_start+0x58>
    703c:	206f 0014      	movea.l 20(sp),a0
    7040:	4e90           	jsr (a0)
    7042:	4fef 0014      	lea 20(sp),sp
	}
}
    7046:	588f           	addq.l #4,sp
    7048:	4e75           	rts

0000704a <debug_clear>:
	barto_cmd_text,
};

void debug_clear()
{
	debug_cmd(barto_cmd_clear, 0, 0, 0);
    704a:	42a7           	clr.l -(sp)
    704c:	42a7           	clr.l -(sp)
    704e:	42a7           	clr.l -(sp)
    7050:	42a7           	clr.l -(sp)
    7052:	4eba ffb8      	jsr 700c <debug_cmd>(pc)
    7056:	4fef 0010      	lea 16(sp),sp
}
    705a:	4e75           	rts

0000705c <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color)
{
    705c:	518f           	subq.l #8,sp
    705e:	2f02           	move.l d2,-(sp)
    7060:	226f 0010      	movea.l 16(sp),a1
    7064:	206f 0014      	movea.l 20(sp),a0
    7068:	222f 0018      	move.l 24(sp),d1
    706c:	202f 001c      	move.l 28(sp),d0
    7070:	3249           	movea.w a1,a1
    7072:	3f49 000a      	move.w a1,10(sp)
    7076:	3048           	movea.w a0,a0
    7078:	3f48 0008      	move.w a0,8(sp)
    707c:	3201           	move.w d1,d1
    707e:	3f41 0006      	move.w d1,6(sp)
    7082:	3000           	move.w d0,d0
    7084:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    7088:	302f 0006      	move.w 6(sp),d0
    708c:	48c0           	ext.l d0
    708e:	4840           	swap d0
    7090:	4240           	clr.w d0
    7092:	322f 0004      	move.w 4(sp),d1
    7096:	48c1           	ext.l d1
    7098:	8280           	or.l d0,d1
    709a:	302f 000a      	move.w 10(sp),d0
    709e:	48c0           	ext.l d0
    70a0:	4840           	swap d0
    70a2:	4240           	clr.w d0
    70a4:	306f 0008      	movea.w 8(sp),a0
    70a8:	2408           	move.l a0,d2
    70aa:	8082           	or.l d2,d0
    70ac:	2f2f 0020      	move.l 32(sp),-(sp)
    70b0:	2f01           	move.l d1,-(sp)
    70b2:	2f00           	move.l d0,-(sp)
    70b4:	4878 0001      	pea 1 <_start+0x1>
    70b8:	4eba ff52      	jsr 700c <debug_cmd>(pc)
    70bc:	4fef 0010      	lea 16(sp),sp
}
    70c0:	241f           	move.l (sp)+,d2
    70c2:	508f           	addq.l #8,sp
    70c4:	4e75           	rts

000070c6 <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color)
{
    70c6:	518f           	subq.l #8,sp
    70c8:	2f02           	move.l d2,-(sp)
    70ca:	226f 0010      	movea.l 16(sp),a1
    70ce:	206f 0014      	movea.l 20(sp),a0
    70d2:	222f 0018      	move.l 24(sp),d1
    70d6:	202f 001c      	move.l 28(sp),d0
    70da:	3249           	movea.w a1,a1
    70dc:	3f49 000a      	move.w a1,10(sp)
    70e0:	3048           	movea.w a0,a0
    70e2:	3f48 0008      	move.w a0,8(sp)
    70e6:	3201           	move.w d1,d1
    70e8:	3f41 0006      	move.w d1,6(sp)
    70ec:	3000           	move.w d0,d0
    70ee:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    70f2:	302f 0006      	move.w 6(sp),d0
    70f6:	48c0           	ext.l d0
    70f8:	4840           	swap d0
    70fa:	4240           	clr.w d0
    70fc:	322f 0004      	move.w 4(sp),d1
    7100:	48c1           	ext.l d1
    7102:	8280           	or.l d0,d1
    7104:	302f 000a      	move.w 10(sp),d0
    7108:	48c0           	ext.l d0
    710a:	4840           	swap d0
    710c:	4240           	clr.w d0
    710e:	306f 0008      	movea.w 8(sp),a0
    7112:	2408           	move.l a0,d2
    7114:	8082           	or.l d2,d0
    7116:	2f2f 0020      	move.l 32(sp),-(sp)
    711a:	2f01           	move.l d1,-(sp)
    711c:	2f00           	move.l d0,-(sp)
    711e:	4878 0002      	pea 2 <_start+0x2>
    7122:	4eba fee8      	jsr 700c <debug_cmd>(pc)
    7126:	4fef 0010      	lea 16(sp),sp
}
    712a:	241f           	move.l (sp)+,d2
    712c:	508f           	addq.l #8,sp
    712e:	4e75           	rts

00007130 <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color)
{
    7130:	598f           	subq.l #4,sp
    7132:	2f02           	move.l d2,-(sp)
    7134:	222f 000c      	move.l 12(sp),d1
    7138:	202f 0010      	move.l 16(sp),d0
    713c:	3201           	move.w d1,d1
    713e:	3f41 0006      	move.w d1,6(sp)
    7142:	3000           	move.w d0,d0
    7144:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
    7148:	202f 0014      	move.l 20(sp),d0
    714c:	322f 0006      	move.w 6(sp),d1
    7150:	48c1           	ext.l d1
    7152:	4841           	swap d1
    7154:	4241           	clr.w d1
    7156:	306f 0004      	movea.w 4(sp),a0
    715a:	2408           	move.l a0,d2
    715c:	8282           	or.l d2,d1
    715e:	2f2f 0018      	move.l 24(sp),-(sp)
    7162:	2f00           	move.l d0,-(sp)
    7164:	2f01           	move.l d1,-(sp)
    7166:	4878 0003      	pea 3 <_start+0x3>
    716a:	4eba fea0      	jsr 700c <debug_cmd>(pc)
    716e:	4fef 0010      	lea 16(sp),sp
}
    7172:	241f           	move.l (sp)+,d2
    7174:	588f           	addq.l #4,sp
    7176:	4e75           	rts

00007178 <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    7178:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    717c:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    7180:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    7184:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    7188:	d041           	add.w d1,d0
	swap	d0
    718a:	4840           	swap d0
	clrw	d0
    718c:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    718e:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    7192:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    7196:	d081           	add.l d1,d0
	rts
    7198:	4e75           	rts

0000719a <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    719a:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    719c:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    71a0:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    71a4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    71aa:	6416           	bcc.s 71c2 <__udivsi3+0x28>
	movel	d0, d2
    71ac:	2400           	move.l d0,d2
	clrw	d2
    71ae:	4242           	clr.w d2
	swap	d2
    71b0:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    71b2:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    71b4:	3002           	move.w d2,d0
	swap	d0
    71b6:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    71b8:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    71bc:	84c1           	divu.w d1,d2
	movew	d2, d0
    71be:	3002           	move.w d2,d0
	jra	6f
    71c0:	6030           	bra.s 71f2 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    71c2:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    71c4:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    71c6:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    71c8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    71ce:	64f4           	bcc.s 71c4 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    71d0:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    71d2:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    71d8:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    71da:	c2c0           	mulu.w d0,d1
	swap	d2
    71dc:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    71de:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    71e0:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    71e2:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    71e4:	660a           	bne.s 71f0 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    71e6:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    71e8:	6506           	bcs.s 71f0 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    71ea:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    71ee:	6302           	bls.s 71f2 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    71f0:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    71f2:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    71f4:	4e75           	rts

000071f6 <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    71f6:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    71f8:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    71fa:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    71fe:	6a04           	bpl.s 7204 <__divsi3+0xe>
	negl	d1
    7200:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    7202:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    7204:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    7208:	6a04           	bpl.s 720e <__divsi3+0x18>
	negl	d0
    720a:	4480           	neg.l d0
	negb	d2
    720c:	4402           	neg.b d2

2:	movel	d1, sp@-
    720e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    7210:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    7212:	6186           	bsr.s 719a <__udivsi3>
	addql	IMM (8), sp
    7214:	508f           	addq.l #8,sp

	tstb	d2
    7216:	4a02           	tst.b d2
	jpl	3f
    7218:	6a02           	bpl.s 721c <__divsi3+0x26>
	negl	d0
    721a:	4480           	neg.l d0

3:	movel	sp@+, d2
    721c:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    721e:	4e75           	rts

00007220 <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    7220:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7224:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    7228:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    722a:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    722c:	61c8           	bsr.s 71f6 <__divsi3>
	addql	IMM (8), sp
    722e:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    7230:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    7234:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7236:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    7238:	6100 ff3e      	bsr.w 7178 <__mulsi3>
	addql	IMM (8), sp
    723c:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    723e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    7242:	9280           	sub.l d0,d1
	movel	d1, d0
    7244:	2001           	move.l d1,d0
	rts
    7246:	4e75           	rts

00007248 <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    7248:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    724c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    7250:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7252:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    7254:	6100 ff44      	bsr.w 719a <__udivsi3>
	addql	IMM (8), sp
    7258:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    725a:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    725e:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    7260:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    7262:	6100 ff14      	bsr.w 7178 <__mulsi3>
	addql	IMM (8), sp
    7266:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    7268:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    726c:	9280           	sub.l d0,d1
	movel	d1, d0
    726e:	2001           	move.l d1,d0
	rts
    7270:	4e75           	rts

00007272 <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    7272:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    7274:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    7278:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    727c:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    727e:	4e75           	rts

00007280 <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    7280:	16c0           	move.b d0,(a3)+
	rts
    7282:	4e75           	rts

00007284 <c2p1x1_8_c5_gen_init>:
	.text
	FUNC(c2p1x1_8_c5_gen_init)
	.globl	SYM (c2p1x1_8_c5_gen_init)

SYM(c2p1x1_8_c5_gen_init):
	movem.l d0-d7/a0-a6, .gi_saveregs	
    7284:	48f9 7fff 0000 	movem.l d0-a6,72c4 <.gi_saveregs>
    728a:	72c4 
	move.l  4(sp),d0
    728c:	202f 0004      	move.l 4(sp),d0
	move.l	8(sp),d1
    7290:	222f 0008      	move.l 8(sp),d1
	move.l	12(sp),d2
    7294:	242f 000c      	move.l 12(sp),d2
	move.l	16(sp),d3
    7298:	262f 0010      	move.l 16(sp),d3
	move.l  20(sp),d4
    729c:	282f 0014      	move.l 20(sp),d4
	move.l	24(sp),d5
    72a0:	2a2f 0018      	move.l 24(sp),d5
	andi.l	IMM (0xffff),d0
    72a4:	0280 0000 ffff 	andi.l #65535,d0
	mulu.w	d0,d3
    72aa:	c6c0           	mulu.w d0,d3
	lsr.l	#3,d3
    72ac:	e68b           	lsr.l #3,d3
	move.l	d3,c2p1x1_8_c5_gen_scroffs
    72ae:	23c3 0000 761a 	move.l d3,761a <c2p1x1_8_c5_gen_scroffs>
	mulu.w	d0,d1
    72b4:	c2c0           	mulu.w d0,d1
	move.l	d1,c2p1x1_8_c5_gen_pixels
    72b6:	23c1 0000 761e 	move.l d1,761e <c2p1x1_8_c5_gen_pixels>
	movem.l	.gi_saveregs,d0-d7/a0-a6
    72bc:	4cfa 7fff 0004 	movem.l 72c4 <.gi_saveregs>(pc),d0-a6
	rts
    72c2:	4e75           	rts

000072c4 <.gi_saveregs>:
	...

00007300 <c2p1x1_8_c5_gen>:
	.text
	FUNC(c2p1x1_8_c5_gen)
	.globl	SYM (c2p1x1_8_c5_gen)

SYM(c2p1x1_8_c5_gen):
	movem.l d0-d7/a0-a6,.c2p_saveregs	
    7300:	48f9 7fff 0000 	movem.l d0-a6,75de <.c2p_saveregs>
    7306:	75de 
	movem.l 4(sp),a0
    7308:	4cef 0100 0004 	movem.l 4(sp),a0
	movem.l 8(sp),a1
    730e:	4cef 0200 0008 	movem.l 8(sp),a1
    move.l	IMM (0x33333333),d5
    7314:	2a3c 3333 3333 	move.l #858993459,d5
	move.l	IMM (0x55555555),a6
    731a:	2c7c 5555 5555 	movea.l #1431655765,a6

	add.w	#BPLSIZE,a1
    7320:	d2fc 2bf8      	adda.w #11256,a1
	add.l	c2p1x1_8_c5_gen_scroffs,a1
    7324:	d3fa 02f4      	adda.l 761a <c2p1x1_8_c5_gen_scroffs>(pc),a1

	move.l	c2p1x1_8_c5_gen_pixels,a2
    7328:	247a 02f4      	movea.l 761e <c2p1x1_8_c5_gen_pixels>(pc),a2
	add.l	a0,a2
    732c:	d5c8           	adda.l a0,a2
	cmp.l	a0,a2
    732e:	b5c8           	cmpa.l a0,a2
	beq	.none
    7330:	6700 02a4      	beq.w 75d6 <.none>

	movem.l	a0-a1,-(sp)
    7334:	48e7 00c0      	movem.l a0-a1,-(sp)

	move.l	(a0)+,d0
    7338:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    733a:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    733c:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    733e:	2618           	move.l (a0)+,d3

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    7340:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    7346:	c084           	and.l d4,d0
	and.l	d4,d1
    7348:	c284           	and.l d4,d1
	and.l	d4,d2
    734a:	c484           	and.l d4,d2
	and.l	d4,d3
    734c:	c684           	and.l d4,d3
	lsl.l	#4,d0
    734e:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    7350:	e989           	lsl.l #4,d1
	or.l	d2,d0
    7352:	8082           	or.l d2,d0
	or.l	d3,d1
    7354:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    7356:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    7358:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    735a:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    735c:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    735e:	c484           	and.l d4,d2
	and.l	d4,d6
    7360:	cc84           	and.l d4,d6
	and.l	d4,d3
    7362:	c684           	and.l d4,d3
	and.l	d4,d7
    7364:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    7366:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    7368:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    736a:	8486           	or.l d6,d2
	or.l	d7,d3
    736c:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    736e:	3c02           	move.w d2,d6
	move.w	d3,d7
    7370:	3e03           	move.w d3,d7
	move.w	d0,d2
    7372:	3400           	move.w d0,d2
	move.w	d1,d3
    7374:	3601           	move.w d1,d3
	swap	d2
    7376:	4842           	swap d2
	swap	d3
    7378:	4843           	swap d3
	move.w	d2,d0
    737a:	3002           	move.w d2,d0
	move.w	d3,d1
    737c:	3203           	move.w d3,d1
	move.w	d6,d2
    737e:	3406           	move.w d6,d2
	move.w	d7,d3
    7380:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    7382:	2c02           	move.l d2,d6
	move.l	d3,d7
    7384:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    7386:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7388:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    738a:	b186           	eor.l d0,d6
	eor.l	d1,d7
    738c:	b387           	eor.l d1,d7
	and.l	d5,d6
    738e:	cc85           	and.l d5,d6
	and.l	d5,d7
    7390:	ce85           	and.l d5,d7
	eor.l	d6,d0
    7392:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7394:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    7396:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7398:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    739a:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    739c:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    739e:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    73a4:	2c01           	move.l d1,d6
	move.l	d3,d7
    73a6:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    73a8:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    73aa:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    73ac:	b186           	eor.l d0,d6
	eor.l	d2,d7
    73ae:	b587           	eor.l d2,d7
	bra	.start1
    73b0:	6000 0088      	bra.w 743a <.start1>

000073b4 <.x1>:
.x1:
	move.l	(a0)+,d0
    73b4:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    73b6:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    73b8:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    73ba:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    73bc:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
    73c0:	283c 0f0f 0f0f 	move.l #252645135,d4
	and.l	d4,d0
    73c6:	c084           	and.l d4,d0
	and.l	d4,d1
    73c8:	c284           	and.l d4,d1
	and.l	d4,d2
    73ca:	c484           	and.l d4,d2
	and.l	d4,d3
    73cc:	c684           	and.l d4,d3
	lsl.l	#4,d0
    73ce:	e988           	lsl.l #4,d0
	lsl.l	#4,d1
    73d0:	e989           	lsl.l #4,d1
	or.l	d2,d0
    73d2:	8082           	or.l d2,d0
	or.l	d3,d1
    73d4:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    73d6:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    73d8:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    73da:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    73dc:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    73de:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    73e2:	c484           	and.l d4,d2
	and.l	d4,d6
    73e4:	cc84           	and.l d4,d6
	and.l	d4,d3
    73e6:	c684           	and.l d4,d3
	and.l	d4,d7
    73e8:	ce84           	and.l d4,d7
	lsl.l	#4,d2
    73ea:	e98a           	lsl.l #4,d2
	lsl.l	#4,d3
    73ec:	e98b           	lsl.l #4,d3
	or.l	d6,d2
    73ee:	8486           	or.l d6,d2
	or.l	d7,d3
    73f0:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    73f2:	3c02           	move.w d2,d6
	move.w	d3,d7
    73f4:	3e03           	move.w d3,d7
	move.w	d0,d2
    73f6:	3400           	move.w d0,d2
	move.w	d1,d3
    73f8:	3601           	move.w d1,d3
	swap	d2
    73fa:	4842           	swap d2
	swap	d3
    73fc:	4843           	swap d3
	move.w	d2,d0
    73fe:	3002           	move.w d2,d0
	move.w	d3,d1
    7400:	3203           	move.w d3,d1
	move.w	d6,d2
    7402:	3406           	move.w d6,d2
	move.w	d7,d3
    7404:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    7406:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    740a:	2c02           	move.l d2,d6
	move.l	d3,d7
    740c:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    740e:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7410:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    7412:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7414:	b387           	eor.l d1,d7
	and.l	d5,d6
    7416:	cc85           	and.l d5,d6
	and.l	d5,d7
    7418:	ce85           	and.l d5,d7
	eor.l	d6,d0
    741a:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    741c:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    741e:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7420:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    7422:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7424:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    7426:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    742c:	2c01           	move.l d1,d6
	move.l	d3,d7
    742e:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7430:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    7432:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7434:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7436:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    7438:	22cd           	move.l a5,(a1)+

0000743a <.start1>:
.start1:
	and.l	d4,d6
    743a:	cc84           	and.l d4,d6
	and.l	d4,d7
    743c:	ce84           	and.l d4,d7
	eor.l	d6,d0
    743e:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7440:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    7442:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    7444:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    7446:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    7448:	bf83           	eor.l d7,d3

	move.l	a6,d4
    744a:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    744c:	2c01           	move.l d1,d6
	move.l	d3,d7
    744e:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    7450:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    7452:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    7454:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7456:	b587           	eor.l d2,d7
	and.l	d4,d6
    7458:	cc84           	and.l d4,d6
	and.l	d4,d7
    745a:	ce84           	and.l d4,d7
	eor.l	d6,d0
    745c:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    745e:	bf82           	eor.l d7,d2
	add.l	d6,d6
    7460:	dc86           	add.l d6,d6
	add.l	d7,d7
    7462:	de87           	add.l d7,d7
	eor.l	d1,d6
    7464:	b386           	eor.l d1,d6
	eor.l	d3,d7
    7466:	b787           	eor.l d3,d7

	move.l	d0,a4
    7468:	2840           	movea.l d0,a4
	move.l	d2,a5
    746a:	2a42           	movea.l d2,a5
	move.l	d6,a3
    746c:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    746e:	b5c8           	cmpa.l a0,a2
	bne	.x1
    7470:	6600 ff42      	bne.w 73b4 <.x1>
	move.l	d7,-BPLSIZE(a1)
    7474:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    7478:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    747c:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    7480:	22cd           	move.l a5,(a1)+

	movem.l	(sp)+,a0-a1
    7482:	4cdf 0300      	movem.l (sp)+,a0-a1
	add.l	#BPLSIZE*4,a1
    7486:	d3fc 0000 afe0 	adda.l #45024,a1

	move.l	(a0)+,d0
    748c:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    748e:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    7490:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    7492:	2618           	move.l (a0)+,d3

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    7494:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    749a:	c084           	and.l d4,d0
	and.l	d4,d1
    749c:	c284           	and.l d4,d1
	and.l	d4,d2
    749e:	c484           	and.l d4,d2
	and.l	d4,d3
    74a0:	c684           	and.l d4,d3
	lsr.l	#4,d2
    74a2:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    74a4:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    74a6:	8082           	or.l d2,d0
	or.l	d3,d1
    74a8:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    74aa:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    74ac:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    74ae:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    74b0:	2e18           	move.l (a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
    74b2:	c484           	and.l d4,d2
	and.l	d4,d6
    74b4:	cc84           	and.l d4,d6
	and.l	d4,d3
    74b6:	c684           	and.l d4,d3
	and.l	d4,d7
    74b8:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    74ba:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    74bc:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    74be:	8486           	or.l d6,d2
	or.l	d7,d3
    74c0:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    74c2:	3c02           	move.w d2,d6
	move.w	d3,d7
    74c4:	3e03           	move.w d3,d7
	move.w	d0,d2
    74c6:	3400           	move.w d0,d2
	move.w	d1,d3
    74c8:	3601           	move.w d1,d3
	swap	d2
    74ca:	4842           	swap d2
	swap	d3
    74cc:	4843           	swap d3
	move.w	d2,d0
    74ce:	3002           	move.w d2,d0
	move.w	d3,d1
    74d0:	3203           	move.w d3,d1
	move.w	d6,d2
    74d2:	3406           	move.w d6,d2
	move.w	d7,d3
    74d4:	3607           	move.w d7,d3

	move.l	d2,d6			//; Swap 2x2
    74d6:	2c02           	move.l d2,d6
	move.l	d3,d7
    74d8:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    74da:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    74dc:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    74de:	b186           	eor.l d0,d6
	eor.l	d1,d7
    74e0:	b387           	eor.l d1,d7
	and.l	d5,d6
    74e2:	cc85           	and.l d5,d6
	and.l	d5,d7
    74e4:	ce85           	and.l d5,d7
	eor.l	d6,d0
    74e6:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    74e8:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    74ea:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    74ec:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    74ee:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    74f0:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    74f2:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    74f8:	2c01           	move.l d1,d6
	move.l	d3,d7
    74fa:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    74fc:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    74fe:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7500:	b186           	eor.l d0,d6
	eor.l	d2,d7
    7502:	b587           	eor.l d2,d7
	bra	.start2
    7504:	6000 0088      	bra.w 758e <.start2>

00007508 <.x2>:
.x2:
	move.l	(a0)+,d0
    7508:	2018           	move.l (a0)+,d0
	move.l	(a0)+,d2
    750a:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d1
    750c:	2218           	move.l (a0)+,d1
	move.l	(a0)+,d3
    750e:	2618           	move.l (a0)+,d3
	move.l	d7,-BPLSIZE(a1)
    7510:	2347 d408      	move.l d7,-11256(a1)

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
    7514:	283c f0f0 f0f0 	move.l #-252645136,d4
	and.l	d4,d0
    751a:	c084           	and.l d4,d0
	and.l	d4,d1
    751c:	c284           	and.l d4,d1
	and.l	d4,d2
    751e:	c484           	and.l d4,d2
	and.l	d4,d3
    7520:	c684           	and.l d4,d3
	lsr.l	#4,d2
    7522:	e88a           	lsr.l #4,d2
	lsr.l	#4,d3
    7524:	e88b           	lsr.l #4,d3
	or.l	d2,d0
    7526:	8082           	or.l d2,d0
	or.l	d3,d1
    7528:	8283           	or.l d3,d1

	move.l	(a0)+,d2
    752a:	2418           	move.l (a0)+,d2
	move.l	(a0)+,d6
    752c:	2c18           	move.l (a0)+,d6
	move.l	(a0)+,d3
    752e:	2618           	move.l (a0)+,d3
	move.l	(a0)+,d7
    7530:	2e18           	move.l (a0)+,d7
	move.l	a3,BPLSIZE(a1)
    7532:	234b 2bf8      	move.l a3,11256(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
    7536:	c484           	and.l d4,d2
	and.l	d4,d6
    7538:	cc84           	and.l d4,d6
	and.l	d4,d3
    753a:	c684           	and.l d4,d3
	and.l	d4,d7
    753c:	ce84           	and.l d4,d7
	lsr.l	#4,d6
    753e:	e88e           	lsr.l #4,d6
	lsr.l	#4,d7
    7540:	e88f           	lsr.l #4,d7
	or.l	d6,d2
    7542:	8486           	or.l d6,d2
	or.l	d7,d3
    7544:	8687           	or.l d7,d3

	move.w	d2,d6			//; Swap 16x2
    7546:	3c02           	move.w d2,d6
	move.w	d3,d7
    7548:	3e03           	move.w d3,d7
	move.w	d0,d2
    754a:	3400           	move.w d0,d2
	move.w	d1,d3
    754c:	3601           	move.w d1,d3
	swap	d2
    754e:	4842           	swap d2
	swap	d3
    7550:	4843           	swap d3
	move.w	d2,d0
    7552:	3002           	move.w d2,d0
	move.w	d3,d1
    7554:	3203           	move.w d3,d1
	move.w	d6,d2
    7556:	3406           	move.w d6,d2
	move.w	d7,d3
    7558:	3607           	move.w d7,d3
	move.l	a4,BPLSIZE*2(a1)
    755a:	234c 57f0      	move.l a4,22512(a1)

	move.l	d2,d6			//; Swap 2x2
    755e:	2c02           	move.l d2,d6
	move.l	d3,d7
    7560:	2e03           	move.l d3,d7
	lsr.l	#2,d6
    7562:	e48e           	lsr.l #2,d6
	lsr.l	#2,d7
    7564:	e48f           	lsr.l #2,d7
	eor.l	d0,d6
    7566:	b186           	eor.l d0,d6
	eor.l	d1,d7
    7568:	b387           	eor.l d1,d7
	and.l	d5,d6
    756a:	cc85           	and.l d5,d6
	and.l	d5,d7
    756c:	ce85           	and.l d5,d7
	eor.l	d6,d0
    756e:	bd80           	eor.l d6,d0
	eor.l	d7,d1
    7570:	bf81           	eor.l d7,d1
	lsl.l	#2,d6
    7572:	e58e           	lsl.l #2,d6
	lsl.l	#2,d7
    7574:	e58f           	lsl.l #2,d7
	eor.l	d6,d2
    7576:	bd82           	eor.l d6,d2
	eor.l	d7,d3
    7578:	bf83           	eor.l d7,d3

	move.l	IMM (0x00ff00ff),d4
    757a:	283c 00ff 00ff 	move.l #16711935,d4
	move.l	d1,d6			//; Swap 8x1
    7580:	2c01           	move.l d1,d6
	move.l	d3,d7
    7582:	2e03           	move.l d3,d7
	lsr.l	#8,d6
    7584:	e08e           	lsr.l #8,d6
	lsr.l	#8,d7
    7586:	e08f           	lsr.l #8,d7
	eor.l	d0,d6
    7588:	b186           	eor.l d0,d6
	eor.l	d2,d7
    758a:	b587           	eor.l d2,d7
	move.l	a5,(a1)+
    758c:	22cd           	move.l a5,(a1)+

0000758e <.start2>:
.start2:
	and.l	d4,d6
    758e:	cc84           	and.l d4,d6
	and.l	d4,d7
    7590:	ce84           	and.l d4,d7
	eor.l	d6,d0
    7592:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    7594:	bf82           	eor.l d7,d2
	lsl.l	#8,d6
    7596:	e18e           	lsl.l #8,d6
	lsl.l	#8,d7
    7598:	e18f           	lsl.l #8,d7
	eor.l	d6,d1
    759a:	bd81           	eor.l d6,d1
	eor.l	d7,d3
    759c:	bf83           	eor.l d7,d3

	move.l	a6,d4
    759e:	280e           	move.l a6,d4
	move.l	d1,d6			//; Swap 1x1
    75a0:	2c01           	move.l d1,d6
	move.l	d3,d7
    75a2:	2e03           	move.l d3,d7
	lsr.l	#1,d6
    75a4:	e28e           	lsr.l #1,d6
	lsr.l	#1,d7
    75a6:	e28f           	lsr.l #1,d7
	eor.l	d0,d6
    75a8:	b186           	eor.l d0,d6
	eor.l	d2,d7
    75aa:	b587           	eor.l d2,d7
	and.l	d4,d6
    75ac:	cc84           	and.l d4,d6
	and.l	d4,d7
    75ae:	ce84           	and.l d4,d7
	eor.l	d6,d0
    75b0:	bd80           	eor.l d6,d0
	eor.l	d7,d2
    75b2:	bf82           	eor.l d7,d2
	add.l	d6,d6
    75b4:	dc86           	add.l d6,d6
	add.l	d7,d7
    75b6:	de87           	add.l d7,d7
	eor.l	d1,d6
    75b8:	b386           	eor.l d1,d6
	eor.l	d3,d7
    75ba:	b787           	eor.l d3,d7

	move.l	d0,a4
    75bc:	2840           	movea.l d0,a4
	move.l	d2,a5
    75be:	2a42           	movea.l d2,a5
	move.l	d6,a3
    75c0:	2646           	movea.l d6,a3

	cmpa.l	a0,a2
    75c2:	b5c8           	cmpa.l a0,a2
	bne	.x2
    75c4:	6600 ff42      	bne.w 7508 <.x2>
	move.l	d7,-BPLSIZE(a1)
    75c8:	2347 d408      	move.l d7,-11256(a1)
	move.l	a3,BPLSIZE(a1)
    75cc:	234b 2bf8      	move.l a3,11256(a1)
	move.l	a4,BPLSIZE*2(a1)
    75d0:	234c 57f0      	move.l a4,22512(a1)
	move.l	a5,(a1)+
    75d4:	22cd           	move.l a5,(a1)+

000075d6 <.none>:
.none:
	movem.l .c2p_saveregs,d0-d7/a0-a6
    75d6:	4cfa 7fff 0004 	movem.l 75de <.c2p_saveregs>(pc),d0-a6
	rts
    75dc:	4e75           	rts

000075de <.c2p_saveregs>:
	...

0000761a <c2p1x1_8_c5_gen_scroffs>:
    761a:	0000 0001      	ori.b #1,d0

0000761e <c2p1x1_8_c5_gen_pixels>:

.c2p_saveregs: .dcb.b 60


c2p1x1_8_c5_gen_scroffs: dc.l	1
    761e:	0000 0001      	ori.b #1,d0
