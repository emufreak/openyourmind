
a.mingw.elf:     file format elf32-m68k


Disassembly of section .text:

00000000 <_start>:


int main();

__attribute__((used)) __attribute__((section(".text.unlikely"))) void _start() {
	main();
   0:	4ef9 0000 0006 	jmp 6 <main>

00000006 <main>:
#include "utils.h"
#include "runtests.h"
#include "rundemo.h"

int main() {
   6:	518f           	subq.l #8,sp
   8:	48e7 3132      	movem.l d2-d3/d7/a2-a3/a6,-(sp)

    SysBase = *((struct ExecBase**)4UL);
   c:	2c78 0004      	movea.l 4 <_start+0x4>,a6
  10:	23ce 0000 2d2e 	move.l a6,2d2e <SysBase>
	hw = (struct Custom*)0xdff000;
  16:	23fc 00df f000 	move.l #14675968,2d2a <hw>
  1c:	0000 2d2a 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
  20:	43f9 0000 0ad5 	lea ad5 <incbin_colors_end+0x49>,a1
  26:	7000           	moveq #0,d0
  28:	4eae fdd8      	jsr -552(a6)
  2c:	23c0 0000 2d26 	move.l d0,2d26 <GfxBase>
	if (!GfxBase)
  32:	6700 0592      	beq.w 5c6 <main+0x5c0>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
  36:	2c79 0000 2d2e 	movea.l 2d2e <SysBase>,a6
  3c:	43f9 0000 0ae6 	lea ae6 <incbin_colors_end+0x5a>,a1
  42:	7000           	moveq #0,d0
  44:	4eae fdd8      	jsr -552(a6)
  48:	23c0 0000 2d22 	move.l d0,2d22 <DOSBase>
	if (!DOSBase)
  4e:	6700 056a      	beq.w 5ba <main+0x5b4>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
  52:	4879 0000 0af2 	pea af2 <incbin_colors_end+0x66>
  58:	4eb9 0000 06be 	jsr 6be <KPrintF>
	Write(Output(), "Hello console!\n", 15);
  5e:	2c79 0000 2d22 	movea.l 2d22 <DOSBase>,a6
  64:	4eae ffc4      	jsr -60(a6)
  68:	2c79 0000 2d22 	movea.l 2d22 <DOSBase>,a6
  6e:	2200           	move.l d0,d1
  70:	243c 0000 0b0e 	move.l #2830,d2
  76:	760f           	moveq #15,d3
  78:	4eae ffd0      	jsr -48(a6)
#include "runtests.h"
#include "coppertests.h"

void RunTests() {
    TestCopperList();
  7c:	47f9 0000 2c38 	lea 2c38 <ClsSprites>,a3
  82:	4df9 0000 2c94 	lea 2c94 <CopperList>,a6
  88:	4878 0040      	pea 40 <main+0x3a>
  8c:	2f0b           	move.l a3,-(sp)
  8e:	2f0e           	move.l a6,-(sp)
  90:	4eb9 0000 0788 	jsr 788 <memcpy>
  96:	45f9 0000 2c08 	lea 2c08 <ClScreen>,a2
  9c:	23d2 0000 2cd4 	move.l (a2),2cd4 <CopperList+0x40>
  a2:	23f9 0000 2c0c 	move.l 2c0c <ClScreen+0x4>,2cd8 <CopperList+0x44>
  a8:	0000 2cd8 
  ac:	23f9 0000 2c10 	move.l 2c10 <ClScreen+0x8>,2cdc <CopperList+0x48>
  b2:	0000 2cdc 
  b6:	23f9 0000 2c14 	move.l 2c14 <ClScreen+0xc>,2ce0 <CopperList+0x4c>
  bc:	0000 2ce0 
  c0:	23f9 0000 2c18 	move.l 2c18 <ClScreen+0x10>,2ce4 <CopperList+0x50>
  c6:	0000 2ce4 
  ca:	23f9 0000 2c1c 	move.l 2c1c <ClScreen+0x14>,2ce8 <CopperList+0x54>
  d0:	0000 2ce8 
  d4:	23f9 0000 2c20 	move.l 2c20 <ClScreen+0x18>,2cec <CopperList+0x58>
  da:	0000 2cec 
  de:	23f9 0000 2c24 	move.l 2c24 <ClScreen+0x1c>,2cf0 <CopperList+0x5c>
  e4:	0000 2cf0 
  e8:	23f9 0000 2c28 	move.l 2c28 <ClScreen+0x20>,2cf4 <CopperList+0x60>
  ee:	0000 2cf4 
  f2:	23f9 0000 2c2c 	move.l 2c2c <ClScreen+0x24>,2cf8 <CopperList+0x64>
  f8:	0000 2cf8 
  fc:	23f9 0000 2c30 	move.l 2c30 <ClScreen+0x28>,2cfc <CopperList+0x68>
 102:	0000 2cfc 
 106:	23f9 0000 2c34 	move.l 2c34 <ClScreen+0x2c>,2d00 <CopperList+0x6c>
 10c:	0000 2d00 
  for(int i=0; i<16;i++)
    *clinstruction++ = *clpartinstruction++;
  clpartinstruction = ClScreen;
  for(int i=0; i<12;i++)
    *clinstruction++ = *clpartinstruction++;
  CopBpl1High = (long) clinstruction + 2;
 110:	23fc 0000 2d06 	move.l #11526,2c8c <CopBpl1High>
 116:	0000 2c8c 
  *clinstruction++ = 0x00e00000;
 11a:	23fc 00e0 0000 	move.l #14680064,2d04 <CopperList+0x70>
 120:	0000 2d04 
  CopBpl1Low = (long) clinstruction + 2;
 124:	23fc 0000 2d0a 	move.l #11530,2c88 <CopBpl1Low>
 12a:	0000 2c88 
  *clinstruction++ = 0x00e20000;
 12e:	23fc 00e2 0000 	move.l #14811136,2d08 <CopperList+0x74>
 134:	0000 2d08 
  *clinstruction = 0xfffffffe;
 138:	70fe           	moveq #-2,d0
 13a:	23c0 0000 2d0c 	move.l d0,2d0c <CopperList+0x78>

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                 long length) {
  for( int i=0;i<length;i++)
    if( instructions[ pos+i] != batch[ i])
 140:	4fef 0010      	lea 16(sp),sp
 144:	2c56           	movea.l (a6),a6
 146:	bdd3           	cmpa.l (a3),a6
 148:	6600 042c      	bne.w 576 <main+0x570>
 14c:	2239 0000 2c98 	move.l 2c98 <CopperList+0x4>,d1
 152:	b2b9 0000 2c3c 	cmp.l 2c3c <ClsSprites+0x4>,d1
 158:	6600 041c      	bne.w 576 <main+0x570>
 15c:	2039 0000 2c9c 	move.l 2c9c <CopperList+0x8>,d0
 162:	b0b9 0000 2c40 	cmp.l 2c40 <ClsSprites+0x8>,d0
 168:	6600 040c      	bne.w 576 <main+0x570>
 16c:	2239 0000 2ca0 	move.l 2ca0 <CopperList+0xc>,d1
 172:	b2b9 0000 2c44 	cmp.l 2c44 <ClsSprites+0xc>,d1
 178:	6600 03fc      	bne.w 576 <main+0x570>
 17c:	2039 0000 2ca4 	move.l 2ca4 <CopperList+0x10>,d0
 182:	b0b9 0000 2c48 	cmp.l 2c48 <ClsSprites+0x10>,d0
 188:	6600 03ec      	bne.w 576 <main+0x570>
 18c:	2239 0000 2ca8 	move.l 2ca8 <CopperList+0x14>,d1
 192:	b2b9 0000 2c4c 	cmp.l 2c4c <ClsSprites+0x14>,d1
 198:	6600 03dc      	bne.w 576 <main+0x570>
 19c:	2039 0000 2cac 	move.l 2cac <CopperList+0x18>,d0
 1a2:	b0b9 0000 2c50 	cmp.l 2c50 <ClsSprites+0x18>,d0
 1a8:	6600 03cc      	bne.w 576 <main+0x570>
 1ac:	2239 0000 2cb0 	move.l 2cb0 <CopperList+0x1c>,d1
 1b2:	b2b9 0000 2c54 	cmp.l 2c54 <ClsSprites+0x1c>,d1
 1b8:	6600 03bc      	bne.w 576 <main+0x570>
 1bc:	2039 0000 2cb4 	move.l 2cb4 <CopperList+0x20>,d0
 1c2:	b0b9 0000 2c58 	cmp.l 2c58 <ClsSprites+0x20>,d0
 1c8:	6600 03ac      	bne.w 576 <main+0x570>
 1cc:	2239 0000 2cb8 	move.l 2cb8 <CopperList+0x24>,d1
 1d2:	b2b9 0000 2c5c 	cmp.l 2c5c <ClsSprites+0x24>,d1
 1d8:	6600 039c      	bne.w 576 <main+0x570>
 1dc:	2039 0000 2cbc 	move.l 2cbc <CopperList+0x28>,d0
 1e2:	b0b9 0000 2c60 	cmp.l 2c60 <ClsSprites+0x28>,d0
 1e8:	6600 038c      	bne.w 576 <main+0x570>
 1ec:	2239 0000 2cc0 	move.l 2cc0 <CopperList+0x2c>,d1
 1f2:	b2b9 0000 2c64 	cmp.l 2c64 <ClsSprites+0x2c>,d1
 1f8:	6600 037c      	bne.w 576 <main+0x570>
 1fc:	2039 0000 2cc4 	move.l 2cc4 <CopperList+0x30>,d0
 202:	b0b9 0000 2c68 	cmp.l 2c68 <ClsSprites+0x30>,d0
 208:	6600 036c      	bne.w 576 <main+0x570>
 20c:	2239 0000 2cc8 	move.l 2cc8 <CopperList+0x34>,d1
 212:	b2b9 0000 2c6c 	cmp.l 2c6c <ClsSprites+0x34>,d1
 218:	6600 035c      	bne.w 576 <main+0x570>
 21c:	2039 0000 2ccc 	move.l 2ccc <CopperList+0x38>,d0
 222:	b0b9 0000 2c70 	cmp.l 2c70 <ClsSprites+0x38>,d0
 228:	6600 034c      	bne.w 576 <main+0x570>
 22c:	2239 0000 2cd0 	move.l 2cd0 <CopperList+0x3c>,d1
 232:	b2b9 0000 2c74 	cmp.l 2c74 <ClsSprites+0x3c>,d1
 238:	6600 033c      	bne.w 576 <main+0x570>
 23c:	2039 0000 2cd4 	move.l 2cd4 <CopperList+0x40>,d0
 242:	b092           	cmp.l (a2),d0
 244:	6600 0352      	bne.w 598 <main+0x592>
 248:	2239 0000 2cd8 	move.l 2cd8 <CopperList+0x44>,d1
 24e:	b2b9 0000 2c0c 	cmp.l 2c0c <ClScreen+0x4>,d1
 254:	6600 0342      	bne.w 598 <main+0x592>
 258:	2039 0000 2c10 	move.l 2c10 <ClScreen+0x8>,d0
 25e:	b0b9 0000 2cdc 	cmp.l 2cdc <CopperList+0x48>,d0
 264:	6600 0332      	bne.w 598 <main+0x592>
 268:	2239 0000 2c14 	move.l 2c14 <ClScreen+0xc>,d1
 26e:	b2b9 0000 2ce0 	cmp.l 2ce0 <CopperList+0x4c>,d1
 274:	6600 0322      	bne.w 598 <main+0x592>
 278:	2039 0000 2ce4 	move.l 2ce4 <CopperList+0x50>,d0
 27e:	b0b9 0000 2c18 	cmp.l 2c18 <ClScreen+0x10>,d0
 284:	6600 0312      	bne.w 598 <main+0x592>
 288:	2239 0000 2c1c 	move.l 2c1c <ClScreen+0x14>,d1
 28e:	b2b9 0000 2ce8 	cmp.l 2ce8 <CopperList+0x54>,d1
 294:	6600 0302      	bne.w 598 <main+0x592>
 298:	2039 0000 2cec 	move.l 2cec <CopperList+0x58>,d0
 29e:	b0b9 0000 2c20 	cmp.l 2c20 <ClScreen+0x18>,d0
 2a4:	6600 02f2      	bne.w 598 <main+0x592>
 2a8:	2239 0000 2cf0 	move.l 2cf0 <CopperList+0x5c>,d1
 2ae:	b2b9 0000 2c24 	cmp.l 2c24 <ClScreen+0x1c>,d1
 2b4:	6600 02e2      	bne.w 598 <main+0x592>
 2b8:	2039 0000 2cf4 	move.l 2cf4 <CopperList+0x60>,d0
 2be:	b0b9 0000 2c28 	cmp.l 2c28 <ClScreen+0x20>,d0
 2c4:	6600 02d2      	bne.w 598 <main+0x592>
 2c8:	2239 0000 2cf8 	move.l 2cf8 <CopperList+0x64>,d1
 2ce:	b2b9 0000 2c2c 	cmp.l 2c2c <ClScreen+0x24>,d1
 2d4:	6600 02c2      	bne.w 598 <main+0x592>
 2d8:	2039 0000 2cfc 	move.l 2cfc <CopperList+0x68>,d0
 2de:	b0b9 0000 2c30 	cmp.l 2c30 <ClScreen+0x28>,d0
 2e4:	6600 02b2      	bne.w 598 <main+0x592>
 2e8:	2239 0000 2d00 	move.l 2d00 <CopperList+0x6c>,d1
 2ee:	b2b9 0000 2c34 	cmp.l 2c34 <ClScreen+0x2c>,d1
 2f4:	6600 02a2      	bne.w 598 <main+0x592>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                           44);
  if(  TestCopperlistBatch(  CopperList, 16, ClScreen, 12) == 0)
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                           54);
  DrawBuffer = 0x40000;
 2f8:	23fc 0004 0000 	move.l #262144,2c90 <DrawBuffer>
 2fe:	0000 2c90 
  SetBplPointers();
 302:	4eb9 0000 0726 	jsr 726 <SetBplPointers>
  if( instructions[pos] == value ) 
 308:	0cb9 00e0 0004 	cmpi.l #14680068,2d04 <CopperList+0x70>
 30e:	0000 2d04 
 312:	671e           	beq.s 332 <main+0x32c>
  if(  TestCopperlistPos(  CopperList, 28, 0x00e00004) == 0)
    Write(Output(), "Problem in Copperlist bpl1ph should be 0004\n", 44);
 314:	2c79 0000 2d22 	movea.l 2d22 <DOSBase>,a6
 31a:	4eae ffc4      	jsr -60(a6)
 31e:	2c79 0000 2d22 	movea.l 2d22 <DOSBase>,a6
 324:	2200           	move.l d0,d1
 326:	243c 0000 0b1e 	move.l #2846,d2
 32c:	762c           	moveq #44,d3
 32e:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 332:	0cb9 00e2 0000 	cmpi.l #14811136,2d08 <CopperList+0x74>
 338:	0000 2d08 
 33c:	671e           	beq.s 35c <main+0x356>
  
  if(  TestCopperlistPos(  CopperList, 29, 0x00e20000) == 0)
    Write(Output(), 
 33e:	2c79 0000 2d22 	movea.l 2d22 <DOSBase>,a6
 344:	4eae ffc4      	jsr -60(a6)
 348:	2c79 0000 2d22 	movea.l 2d22 <DOSBase>,a6
 34e:	2200           	move.l d0,d1
 350:	243c 0000 0b4b 	move.l #2891,d2
 356:	762c           	moveq #44,d3
 358:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 35c:	70fe           	moveq #-2,d0
 35e:	b0b9 0000 2d0c 	cmp.l 2d0c <CopperList+0x78>,d0
 364:	671e           	beq.s 384 <main+0x37e>
             "Problem in Copperlist bpl1pl should be 0000\n", 44);

  if( TestCopperlistPos( CopperList, 30, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set\n", 31);
 366:	2c79 0000 2d22 	movea.l 2d22 <DOSBase>,a6
 36c:	4eae ffc4      	jsr -60(a6)
 370:	2c79 0000 2d22 	movea.l 2d22 <DOSBase>,a6
 376:	2200           	move.l d0,d1
 378:	243c 0000 0b78 	move.l #2936,d2
 37e:	761f           	moveq #31,d3
 380:	4eae ffd0      	jsr -48(a6)
  RunTests();
	Delay(50);
 384:	2c79 0000 2d22 	movea.l 2d22 <DOSBase>,a6
 38a:	7232           	moveq #50,d1
 38c:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
 390:	247c 00f0 ff60 	movea.l #15794016,a2
 396:	4a92           	tst.l (a2)
 398:	6718           	beq.s 3b2 <main+0x3ac>
 39a:	4878 0001      	pea 1 <_start+0x1>
 39e:	47f9 0000 061c 	lea 61c <warpmode.part.0>,a3
 3a4:	4e93           	jsr (a3)
 3a6:	588f           	addq.l #4,sp
 3a8:	4a92           	tst.l (a2)
 3aa:	6706           	beq.s 3b2 <main+0x3ac>
 3ac:	42a7           	clr.l -(sp)
 3ae:	4e93           	jsr (a3)
 3b0:	588f           	addq.l #4,sp
  *CopBpl1Low = lowword;
  *CopBpl1High = highword;
}

void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
 3b2:	2c79 0000 2d26 	movea.l 2d26 <GfxBase>,a6
 3b8:	23ee 0022 0000 	move.l 34(a6),2d10 <ActiView>
 3be:	2d10 
	OwnBlitter();
 3c0:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
 3c4:	2c79 0000 2d26 	movea.l 2d26 <GfxBase>,a6
 3ca:	4eae ff1c      	jsr -228(a6)
	Disable();
 3ce:	2c79 0000 2d2e 	movea.l 2d2e <SysBase>,a6
 3d4:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
 3d8:	2479 0000 2d2a 	movea.l 2d2a <hw>,a2
 3de:	302a 0010      	move.w 16(a2),d0
 3e2:	33c0 0000 2d14 	move.w d0,2d14 <SystemADKCON>
	SystemInts=hw->intenar;
 3e8:	302a 001c      	move.w 28(a2),d0
 3ec:	33c0 0000 2d18 	move.w d0,2d18 <SystemInts>
	SystemDMA=hw->dmaconr;
 3f2:	302a 0002      	move.w 2(a2),d0
 3f6:	33c0 0000 2d16 	move.w d0,2d16 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
 3fc:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 402:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
 408:	47f9 0000 0742 	lea 742 <WaitVbl>,a3
 40e:	4e93           	jsr (a3)
	WaitVbl();
 410:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
 412:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	for(int a=0;a<32;a++)
 418:	7000           	moveq #0,d0
		hw->color[a]=0;
 41a:	2200           	move.l d0,d1
 41c:	0681 0000 00c0 	addi.l #192,d1
 422:	d281           	add.l d1,d1
 424:	35bc 0000 1800 	move.w #0,(0,a2,d1.l)
	for(int a=0;a<32;a++)
 42a:	5280           	addq.l #1,d0
 42c:	7220           	moveq #32,d1
 42e:	b280           	cmp.l d0,d1
 430:	66e8           	bne.s 41a <main+0x414>

	LoadView(0);
 432:	2c79 0000 2d26 	movea.l 2d26 <GfxBase>,a6
 438:	93c9           	suba.l a1,a1
 43a:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 43e:	2c79 0000 2d26 	movea.l 2d26 <GfxBase>,a6
 444:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 448:	2c79 0000 2d26 	movea.l 2d26 <GfxBase>,a6
 44e:	4eae fef2      	jsr -270(a6)

	WaitVbl();
 452:	4e93           	jsr (a3)
	WaitVbl();
 454:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
 456:	3f7c 4e7a 001a 	move.w #20090,26(sp)
 45c:	3f7c 0801 001c 	move.w #2049,28(sp)
 462:	3f7c 4e73 001e 	move.w #20083,30(sp)
	if (SysBase->AttnFlags & AFF_68010) 
 468:	2c79 0000 2d2e 	movea.l 2d2e <SysBase>,a6
 46e:	082e 0000 0129 	btst #0,297(a6)
 474:	6700 017a      	beq.w 5f0 <main+0x5ea>
		vbr = (APTR)Supervisor((void*)getvbr);
 478:	7e1a           	moveq #26,d7
 47a:	de8f           	add.l sp,d7
 47c:	cf8d           	exg d7,a5
 47e:	4eae ffe2      	jsr -30(a6)
 482:	cf8d           	exg d7,a5

	VBR=GetVBR();
 484:	23c0 0000 2d1a 	move.l d0,2d1a <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 48a:	2079 0000 2d1a 	movea.l 2d1a <VBR.lto_priv.0>,a0
 490:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 494:	23ca 0000 2d1e 	move.l a2,2d1e <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
 49a:	4e93           	jsr (a3)
}

void FreeSystem() { 
	WaitVbl();
 49c:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 49e:	2079 0000 2d2a 	movea.l 2d2a <hw>,a0
 4a4:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 4a8:	3028 0002      	move.w 2(a0),d0
 4ac:	0800 000e      	btst #14,d0
 4b0:	66f6           	bne.s 4a8 <main+0x4a2>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
 4b2:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 4b8:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
 4be:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 4c4:	2279 0000 2d1a 	movea.l 2d1a <VBR.lto_priv.0>,a1
 4ca:	234a 006c      	move.l a2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
 4ce:	2c79 0000 2d26 	movea.l 2d26 <GfxBase>,a6
 4d4:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
 4da:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
 4e0:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
 4e6:	3039 0000 2d18 	move.w 2d18 <SystemInts>,d0
 4ec:	0040 8000      	ori.w #-32768,d0
 4f0:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
 4f4:	3039 0000 2d16 	move.w 2d16 <SystemDMA>,d0
 4fa:	0040 8000      	ori.w #-32768,d0
 4fe:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
 502:	3039 0000 2d14 	move.w 2d14 <SystemADKCON>,d0
 508:	0040 8000      	ori.w #-32768,d0
 50c:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
 510:	2279 0000 2d10 	movea.l 2d10 <ActiView>,a1
 516:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 51a:	2c79 0000 2d26 	movea.l 2d26 <GfxBase>,a6
 520:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 524:	2c79 0000 2d26 	movea.l 2d26 <GfxBase>,a6
 52a:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
 52e:	2c79 0000 2d26 	movea.l 2d26 <GfxBase>,a6
 534:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
 538:	2c79 0000 2d26 	movea.l 2d26 <GfxBase>,a6
 53e:	4eae fe32      	jsr -462(a6)
	Enable();
 542:	2c79 0000 2d2e 	movea.l 2d2e <SysBase>,a6
 548:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
 54c:	2c79 0000 2d2e 	movea.l 2d2e <SysBase>,a6
 552:	2279 0000 2d22 	movea.l 2d22 <DOSBase>,a1
 558:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
 55c:	2c79 0000 2d2e 	movea.l 2d2e <SysBase>,a6
 562:	2279 0000 2d26 	movea.l 2d26 <GfxBase>,a1
 568:	4eae fe62      	jsr -414(a6)
}
 56c:	7000           	moveq #0,d0
 56e:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
 572:	508f           	addq.l #8,sp
 574:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
 576:	2c79 0000 2d22 	movea.l 2d22 <DOSBase>,a6
 57c:	4eae ffc4      	jsr -60(a6)
 580:	2c79 0000 2d22 	movea.l 2d22 <DOSBase>,a6
 586:	2200           	move.l d0,d1
 588:	243c 0000 0bd1 	move.l #3025,d2
 58e:	762c           	moveq #44,d3
 590:	4eae ffd0      	jsr -48(a6)
 594:	6000 fca6      	bra.w 23c <main+0x236>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
 598:	2c79 0000 2d22 	movea.l 2d22 <DOSBase>,a6
 59e:	4eae ffc4      	jsr -60(a6)
 5a2:	2c79 0000 2d22 	movea.l 2d22 <DOSBase>,a6
 5a8:	2200           	move.l d0,d1
 5aa:	243c 0000 0b9a 	move.l #2970,d2
 5b0:	7636           	moveq #54,d3
 5b2:	4eae ffd0      	jsr -48(a6)
 5b6:	6000 fd40      	bra.w 2f8 <main+0x2f2>
		Exit(0);
 5ba:	9dce           	suba.l a6,a6
 5bc:	7200           	moveq #0,d1
 5be:	4eae ff70      	jsr -144(a6)
 5c2:	6000 fa8e      	bra.w 52 <main+0x4c>
		Exit(0);
 5c6:	2c79 0000 2d22 	movea.l 2d22 <DOSBase>,a6
 5cc:	7200           	moveq #0,d1
 5ce:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
 5d2:	2c79 0000 2d2e 	movea.l 2d2e <SysBase>,a6
 5d8:	43f9 0000 0ae6 	lea ae6 <incbin_colors_end+0x5a>,a1
 5de:	7000           	moveq #0,d0
 5e0:	4eae fdd8      	jsr -552(a6)
 5e4:	23c0 0000 2d22 	move.l d0,2d22 <DOSBase>
	if (!DOSBase)
 5ea:	6600 fa66      	bne.w 52 <main+0x4c>
 5ee:	60ca           	bra.s 5ba <main+0x5b4>
	APTR vbr = 0;
 5f0:	7000           	moveq #0,d0
	VBR=GetVBR();
 5f2:	23c0 0000 2d1a 	move.l d0,2d1a <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 5f8:	2079 0000 2d1a 	movea.l 2d1a <VBR.lto_priv.0>,a0
 5fe:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 602:	23ca 0000 2d1e 	move.l a2,2d1e <SystemIrq>
	WaitVbl();
 608:	4e93           	jsr (a3)
	WaitVbl();
 60a:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 60c:	2079 0000 2d2a 	movea.l 2d2a <hw>,a0
 612:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 616:	6000 fe90      	bra.w 4a8 <main+0x4a2>
 61a:	4e71           	nop

0000061c <warpmode.part.0>:
void warpmode(int on) 
 61c:	598f           	subq.l #4,sp
 61e:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 620:	4aaf 000c      	tst.l 12(sp)
 624:	674c           	beq.s 672 <warpmode.part.0+0x56>
 626:	4878 0001      	pea 1 <_start+0x1>
 62a:	740b           	moveq #11,d2
 62c:	d48f           	add.l sp,d2
 62e:	2f02           	move.l d2,-(sp)
 630:	42a7           	clr.l -(sp)
 632:	4879 0000 0ac0 	pea ac0 <incbin_colors_end+0x34>
 638:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff1cbb>
 63c:	4878 0052      	pea 52 <main+0x4c>
 640:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf01c1c>
 646:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 64a:	203c 0000 0aa6 	move.l #2726,d0
 650:	4878 0001      	pea 1 <_start+0x1>
 654:	2f02           	move.l d2,-(sp)
 656:	42a7           	clr.l -(sp)
 658:	2f00           	move.l d0,-(sp)
 65a:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff1cbb>
 65e:	4878 0052      	pea 52 <main+0x4c>
 662:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf01c1c>
	}
}
 668:	4fef 0018      	lea 24(sp),sp
 66c:	241f           	move.l (sp)+,d2
 66e:	588f           	addq.l #4,sp
 670:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 672:	4878 0001      	pea 1 <_start+0x1>
 676:	740b           	moveq #11,d2
 678:	d48f           	add.l sp,d2
 67a:	2f02           	move.l d2,-(sp)
 67c:	42a7           	clr.l -(sp)
 67e:	4879 0000 0aca 	pea aca <incbin_colors_end+0x3e>
 684:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff1cbb>
 688:	4878 0052      	pea 52 <main+0x4c>
 68c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf01c1c>
 692:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 696:	203c 0000 0a8d 	move.l #2701,d0
 69c:	4878 0001      	pea 1 <_start+0x1>
 6a0:	2f02           	move.l d2,-(sp)
 6a2:	42a7           	clr.l -(sp)
 6a4:	2f00           	move.l d0,-(sp)
 6a6:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff1cbb>
 6aa:	4878 0052      	pea 52 <main+0x4c>
 6ae:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf01c1c>
}
 6b4:	4fef 0018      	lea 24(sp),sp
 6b8:	241f           	move.l (sp)+,d2
 6ba:	588f           	addq.l #4,sp
 6bc:	4e75           	rts

000006be <KPrintF>:
{
 6be:	4fef ff80      	lea -128(sp),sp
 6c2:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
 6c6:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xf01c1c>
 6cc:	6734           	beq.s 702 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
 6ce:	2c79 0000 2d2e 	movea.l 2d2e <SysBase>,a6
 6d4:	206f 0090      	movea.l 144(sp),a0
 6d8:	43ef 0094      	lea 148(sp),a1
 6dc:	45f9 0000 0a08 	lea a08 <PutChar>,a2
 6e2:	47ef 000c      	lea 12(sp),a3
 6e6:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
 6ea:	2f0b           	move.l a3,-(sp)
 6ec:	4878 0056      	pea 56 <main+0x50>
 6f0:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf01c1c>
 6f6:	508f           	addq.l #8,sp
}
 6f8:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 6fc:	4fef 0080      	lea 128(sp),sp
 700:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
 702:	2c79 0000 2d2e 	movea.l 2d2e <SysBase>,a6
 708:	206f 0090      	movea.l 144(sp),a0
 70c:	43ef 0094      	lea 148(sp),a1
 710:	45f9 0000 09fa 	lea 9fa <KPutCharX>,a2
 716:	97cb           	suba.l a3,a3
 718:	4eae fdf6      	jsr -522(a6)
}
 71c:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 720:	4fef 0080      	lea 128(sp),sp
 724:	4e75           	rts

00000726 <SetBplPointers>:
  UWORD highword = DrawBuffer >> 16;
 726:	2039 0000 2c90 	move.l 2c90 <DrawBuffer>,d0
  *CopBpl1Low = lowword;
 72c:	2079 0000 2c88 	movea.l 2c88 <CopBpl1Low>,a0
  UWORD lowword = DrawBuffer & 0xffff;
 732:	3080           	move.w d0,(a0)
  UWORD highword = DrawBuffer >> 16;
 734:	4240           	clr.w d0
 736:	4840           	swap d0
 738:	2079 0000 2c8c 	movea.l 2c8c <CopBpl1High>,a0
 73e:	3080           	move.w d0,(a0)
}
 740:	4e75           	rts

00000742 <WaitVbl>:
void WaitVbl() {
 742:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 744:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdf0cc0>,d0
 74a:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
 74c:	2017           	move.l (sp),d0
 74e:	0280 0001 ff00 	andi.l #130816,d0
 754:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
 756:	2017           	move.l (sp),d0
 758:	0c80 0001 3700 	cmpi.l #79616,d0
 75e:	67e4           	beq.s 744 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 760:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdf0cc0>,d0
 766:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
 76a:	202f 0004      	move.l 4(sp),d0
 76e:	0280 0001 ff00 	andi.l #130816,d0
 774:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
 778:	202f 0004      	move.l 4(sp),d0
 77c:	0c80 0001 3700 	cmpi.l #79616,d0
 782:	66dc           	bne.s 760 <WaitVbl+0x1e>
}
 784:	508f           	addq.l #8,sp
 786:	4e75           	rts

00000788 <memcpy>:
{
 788:	48e7 3820      	movem.l d2-d4/a2,-(sp)
 78c:	202f 0014      	move.l 20(sp),d0
 790:	226f 0018      	movea.l 24(sp),a1
 794:	222f 001c      	move.l 28(sp),d1
	while(len--)
 798:	2601           	move.l d1,d3
 79a:	5383           	subq.l #1,d3
 79c:	4a81           	tst.l d1
 79e:	6762           	beq.s 802 <memcpy+0x7a>
 7a0:	2040           	movea.l d0,a0
 7a2:	5888           	addq.l #4,a0
 7a4:	b1c9           	cmpa.l a1,a0
 7a6:	53c2           	sl.s d2
 7a8:	4402           	neg.b d2
 7aa:	41e9 0004      	lea 4(a1),a0
 7ae:	b1c0           	cmpa.l d0,a0
 7b0:	53c4           	sl.s d4
 7b2:	4404           	neg.b d4
 7b4:	8404           	or.b d4,d2
 7b6:	7808           	moveq #8,d4
 7b8:	b883           	cmp.l d3,d4
 7ba:	55c4           	sc.s d4
 7bc:	4404           	neg.b d4
 7be:	c404           	and.b d4,d2
 7c0:	6746           	beq.s 808 <memcpy+0x80>
 7c2:	2409           	move.l a1,d2
 7c4:	8480           	or.l d0,d2
 7c6:	7803           	moveq #3,d4
 7c8:	c484           	and.l d4,d2
 7ca:	663c           	bne.s 808 <memcpy+0x80>
 7cc:	2049           	movea.l a1,a0
 7ce:	2440           	movea.l d0,a2
 7d0:	74fc           	moveq #-4,d2
 7d2:	c481           	and.l d1,d2
 7d4:	d489           	add.l a1,d2
		*d++ = *s++;
 7d6:	24d8           	move.l (a0)+,(a2)+
 7d8:	b488           	cmp.l a0,d2
 7da:	66fa           	bne.s 7d6 <memcpy+0x4e>
 7dc:	74fc           	moveq #-4,d2
 7de:	c481           	and.l d1,d2
 7e0:	2040           	movea.l d0,a0
 7e2:	d1c2           	adda.l d2,a0
 7e4:	d3c2           	adda.l d2,a1
 7e6:	9682           	sub.l d2,d3
 7e8:	b481           	cmp.l d1,d2
 7ea:	6716           	beq.s 802 <memcpy+0x7a>
 7ec:	1091           	move.b (a1),(a0)
	while(len--)
 7ee:	4a83           	tst.l d3
 7f0:	6710           	beq.s 802 <memcpy+0x7a>
		*d++ = *s++;
 7f2:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
 7f8:	5383           	subq.l #1,d3
 7fa:	6706           	beq.s 802 <memcpy+0x7a>
		*d++ = *s++;
 7fc:	1169 0002 0002 	move.b 2(a1),2(a0)
}
 802:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
 806:	4e75           	rts
 808:	2040           	movea.l d0,a0
 80a:	d289           	add.l a1,d1
		*d++ = *s++;
 80c:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 80e:	b289           	cmp.l a1,d1
 810:	67f0           	beq.s 802 <memcpy+0x7a>
		*d++ = *s++;
 812:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 814:	b289           	cmp.l a1,d1
 816:	66f4           	bne.s 80c <memcpy+0x84>
 818:	60e8           	bra.s 802 <memcpy+0x7a>

0000081a <memset>:
{
 81a:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
 81e:	202f 0024      	move.l 36(sp),d0
 822:	2a2f 0028      	move.l 40(sp),d5
 826:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
 82a:	2809           	move.l a1,d4
 82c:	5384           	subq.l #1,d4
 82e:	b2fc 0000      	cmpa.w #0,a1
 832:	6f00 00b0      	ble.w 8e4 <memset+0xca>
 836:	1e05           	move.b d5,d7
 838:	2200           	move.l d0,d1
 83a:	4481           	neg.l d1
 83c:	7403           	moveq #3,d2
 83e:	c282           	and.l d2,d1
 840:	7c05           	moveq #5,d6
		*ptr++ = val;
 842:	2440           	movea.l d0,a2
 844:	bc84           	cmp.l d4,d6
 846:	646a           	bcc.s 8b2 <memset+0x98>
 848:	4a81           	tst.l d1
 84a:	6724           	beq.s 870 <memset+0x56>
 84c:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
 84e:	5384           	subq.l #1,d4
 850:	7401           	moveq #1,d2
 852:	b481           	cmp.l d1,d2
 854:	671a           	beq.s 870 <memset+0x56>
		*ptr++ = val;
 856:	2440           	movea.l d0,a2
 858:	548a           	addq.l #2,a2
 85a:	2040           	movea.l d0,a0
 85c:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
 860:	5384           	subq.l #1,d4
 862:	7403           	moveq #3,d2
 864:	b481           	cmp.l d1,d2
 866:	6608           	bne.s 870 <memset+0x56>
		*ptr++ = val;
 868:	528a           	addq.l #1,a2
 86a:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
 86e:	5384           	subq.l #1,d4
 870:	2609           	move.l a1,d3
 872:	9681           	sub.l d1,d3
 874:	7c00           	moveq #0,d6
 876:	1c05           	move.b d5,d6
 878:	2406           	move.l d6,d2
 87a:	4842           	swap d2
 87c:	4242           	clr.w d2
 87e:	2042           	movea.l d2,a0
 880:	2406           	move.l d6,d2
 882:	e14a           	lsl.w #8,d2
 884:	4842           	swap d2
 886:	4242           	clr.w d2
 888:	e18e           	lsl.l #8,d6
 88a:	2646           	movea.l d6,a3
 88c:	2c08           	move.l a0,d6
 88e:	8486           	or.l d6,d2
 890:	2c0b           	move.l a3,d6
 892:	8486           	or.l d6,d2
 894:	1407           	move.b d7,d2
 896:	2040           	movea.l d0,a0
 898:	d1c1           	adda.l d1,a0
 89a:	72fc           	moveq #-4,d1
 89c:	c283           	and.l d3,d1
 89e:	d288           	add.l a0,d1
		*ptr++ = val;
 8a0:	20c2           	move.l d2,(a0)+
 8a2:	b1c1           	cmpa.l d1,a0
 8a4:	66fa           	bne.s 8a0 <memset+0x86>
 8a6:	72fc           	moveq #-4,d1
 8a8:	c283           	and.l d3,d1
 8aa:	d5c1           	adda.l d1,a2
 8ac:	9881           	sub.l d1,d4
 8ae:	b283           	cmp.l d3,d1
 8b0:	6732           	beq.s 8e4 <memset+0xca>
 8b2:	1485           	move.b d5,(a2)
	while(len-- > 0)
 8b4:	4a84           	tst.l d4
 8b6:	6f2c           	ble.s 8e4 <memset+0xca>
		*ptr++ = val;
 8b8:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
 8bc:	7201           	moveq #1,d1
 8be:	b284           	cmp.l d4,d1
 8c0:	6c22           	bge.s 8e4 <memset+0xca>
		*ptr++ = val;
 8c2:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
 8c6:	7402           	moveq #2,d2
 8c8:	b484           	cmp.l d4,d2
 8ca:	6c18           	bge.s 8e4 <memset+0xca>
		*ptr++ = val;
 8cc:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
 8d0:	7c03           	moveq #3,d6
 8d2:	bc84           	cmp.l d4,d6
 8d4:	6c0e           	bge.s 8e4 <memset+0xca>
		*ptr++ = val;
 8d6:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
 8da:	7204           	moveq #4,d1
 8dc:	b284           	cmp.l d4,d1
 8de:	6c04           	bge.s 8e4 <memset+0xca>
		*ptr++ = val;
 8e0:	1545 0005      	move.b d5,5(a2)
}
 8e4:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
 8e8:	4e75           	rts

000008ea <strlen>:
{
 8ea:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
 8ee:	7000           	moveq #0,d0
	while(*s++)
 8f0:	4a10           	tst.b (a0)
 8f2:	6708           	beq.s 8fc <strlen+0x12>
		t++;
 8f4:	5280           	addq.l #1,d0
	while(*s++)
 8f6:	4a30 0800      	tst.b (0,a0,d0.l)
 8fa:	66f8           	bne.s 8f4 <strlen+0xa>
}
 8fc:	4e75           	rts
 8fe:	4e71           	nop

00000900 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
 900:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
 904:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
 908:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
 90c:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
 910:	d041           	add.w d1,d0
	swap	d0
 912:	4840           	swap d0
	clrw	d0
 914:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
 916:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
 91a:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
 91e:	d081           	add.l d1,d0

	rts
 920:	4e75           	rts

00000922 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
 922:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
 924:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
 928:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
 92c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
 932:	6416           	bcc.s 94a <__udivsi3+0x28>
	movel	d0, d2
 934:	2400           	move.l d0,d2
	clrw	d2
 936:	4242           	clr.w d2
	swap	d2
 938:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
 93a:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
 93c:	3002           	move.w d2,d0
	swap	d0
 93e:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
 940:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
 944:	84c1           	divu.w d1,d2
	movew	d2, d0
 946:	3002           	move.w d2,d0
	jra	6f
 948:	6030           	bra.s 97a <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
 94a:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
 94c:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
 94e:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
 950:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
 956:	64f4           	bcc.s 94c <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
 958:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
 95a:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
 960:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
 962:	c2c0           	mulu.w d0,d1
	swap	d2
 964:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
 966:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
 968:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
 96a:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
 96c:	660a           	bne.s 978 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
 96e:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
 970:	6506           	bcs.s 978 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
 972:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
 976:	6302           	bls.s 97a <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
 978:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
 97a:	241f           	move.l (sp)+,d2
	rts
 97c:	4e75           	rts

0000097e <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
 97e:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
 980:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
 982:	222f 000c      	move.l 12(sp),d1
	jpl	1f
 986:	6a04           	bpl.s 98c <__divsi3+0xe>
	negl	d1
 988:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
 98a:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
 98c:	202f 0008      	move.l 8(sp),d0
	jpl	2f
 990:	6a04           	bpl.s 996 <__divsi3+0x18>
	negl	d0
 992:	4480           	neg.l d0
	negb	d2
 994:	4402           	neg.b d2

2:	movel	d1, sp@-
 996:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 998:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
 99a:	6186           	bsr.s 922 <__udivsi3>
	addql	IMM (8), sp
 99c:	508f           	addq.l #8,sp

	tstb	d2
 99e:	4a02           	tst.b d2
	jpl	3f
 9a0:	6a02           	bpl.s 9a4 <__divsi3+0x26>
	negl	d0
 9a2:	4480           	neg.l d0

3:	movel	sp@+, d2
 9a4:	241f           	move.l (sp)+,d2
	rts
 9a6:	4e75           	rts

000009a8 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 9a8:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 9ac:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 9b0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 9b2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
 9b4:	61c8           	bsr.s 97e <__divsi3>
	addql	IMM (8), sp
 9b6:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 9b8:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 9bc:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 9be:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 9c0:	6100 ff3e      	bsr.w 900 <__mulsi3>
	addql	IMM (8), sp
 9c4:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 9c6:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 9ca:	9280           	sub.l d0,d1
	movel	d1, d0
 9cc:	2001           	move.l d1,d0
	rts
 9ce:	4e75           	rts

000009d0 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 9d0:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 9d4:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 9d8:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 9da:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
 9dc:	6100 ff44      	bsr.w 922 <__udivsi3>
	addql	IMM (8), sp
 9e0:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 9e2:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 9e6:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 9e8:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 9ea:	6100 ff14      	bsr.w 900 <__mulsi3>
	addql	IMM (8), sp
 9ee:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 9f0:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 9f4:	9280           	sub.l d0,d1
	movel	d1, d0
 9f6:	2001           	move.l d1,d0
	rts
 9f8:	4e75           	rts

000009fa <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
 9fa:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
 9fc:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
 a00:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
 a04:	2c5f           	movea.l (sp)+,a6
    rts
 a06:	4e75           	rts

00000a08 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
 a08:	16c0           	move.b d0,(a3)+
	rts
 a0a:	4e75           	rts
