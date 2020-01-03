
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
  10:	23ce 0001 b1a6 	move.l a6,1b1a6 <SysBase>
	hw = (struct Custom*)0xdff000;
  16:	23fc 00df f000 	move.l #14675968,1b1a2 <hw>
  1c:	0001 b1a2 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
  20:	43f9 0000 0de5 	lea de5 <incbin_colors_end+0x49>,a1
  26:	7000           	moveq #0,d0
  28:	4eae fdd8      	jsr -552(a6)
  2c:	23c0 0001 b19e 	move.l d0,1b19e <GfxBase>
	if (!GfxBase)
  32:	6700 070a      	beq.w 73e <main+0x738>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
  36:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
  3c:	43f9 0000 0df6 	lea df6 <incbin_colors_end+0x5a>,a1
  42:	7000           	moveq #0,d0
  44:	4eae fdd8      	jsr -552(a6)
  48:	23c0 0001 b19a 	move.l d0,1b19a <DOSBase>
	if (!DOSBase)
  4e:	6700 06e2      	beq.w 732 <main+0x72c>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
  52:	4879 0000 0e02 	pea e02 <incbin_colors_end+0x66>
  58:	4eb9 0000 0866 	jsr 866 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
  5e:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
  64:	4eae ffc4      	jsr -60(a6)
  68:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
  6e:	2200           	move.l d0,d1
  70:	243c 0000 0e1e 	move.l #3614,d2
  76:	760f           	moveq #15,d3
  78:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  DrawCopper = Copperlist1;
  7c:	23fc 0001 b108 	move.l #110856,1b184 <DrawCopper>
  82:	0001 b184 
  ViewCopper = Copperlist2;
  86:	23fc 0001 b088 	move.l #110728,1b104 <ViewCopper>
  8c:	0001 b104 
  ClBuild( Copperlist1);
  90:	4879 0001 b108 	pea 1b108 <Copperlist1>
  96:	4eb9 0000 0916 	jsr 916 <ClBuild>
    if( instructions[ pos+i] != batch[ i])
  9c:	508f           	addq.l #8,sp
  9e:	2039 0001 b108 	move.l 1b108 <Copperlist1>,d0
  a4:	b0b9 0000 2030 	cmp.l 2030 <ClsSprites>,d0
  aa:	6600 061c      	bne.w 6c8 <main+0x6c2>
  ae:	2239 0001 b10c 	move.l 1b10c <Copperlist1+0x4>,d1
  b4:	b2b9 0000 2034 	cmp.l 2034 <ClsSprites+0x4>,d1
  ba:	6600 060c      	bne.w 6c8 <main+0x6c2>
  be:	2039 0001 b110 	move.l 1b110 <Copperlist1+0x8>,d0
  c4:	b0b9 0000 2038 	cmp.l 2038 <ClsSprites+0x8>,d0
  ca:	6600 05fc      	bne.w 6c8 <main+0x6c2>
  ce:	2239 0001 b114 	move.l 1b114 <Copperlist1+0xc>,d1
  d4:	b2b9 0000 203c 	cmp.l 203c <ClsSprites+0xc>,d1
  da:	6600 05ec      	bne.w 6c8 <main+0x6c2>
  de:	2039 0001 b118 	move.l 1b118 <Copperlist1+0x10>,d0
  e4:	b0b9 0000 2040 	cmp.l 2040 <ClsSprites+0x10>,d0
  ea:	6600 05dc      	bne.w 6c8 <main+0x6c2>
  ee:	2239 0001 b11c 	move.l 1b11c <Copperlist1+0x14>,d1
  f4:	b2b9 0000 2044 	cmp.l 2044 <ClsSprites+0x14>,d1
  fa:	6600 05cc      	bne.w 6c8 <main+0x6c2>
  fe:	2039 0001 b120 	move.l 1b120 <Copperlist1+0x18>,d0
 104:	b0b9 0000 2048 	cmp.l 2048 <ClsSprites+0x18>,d0
 10a:	6600 05bc      	bne.w 6c8 <main+0x6c2>
 10e:	2239 0001 b124 	move.l 1b124 <Copperlist1+0x1c>,d1
 114:	b2b9 0000 204c 	cmp.l 204c <ClsSprites+0x1c>,d1
 11a:	6600 05ac      	bne.w 6c8 <main+0x6c2>
 11e:	2039 0001 b128 	move.l 1b128 <Copperlist1+0x20>,d0
 124:	b0b9 0000 2050 	cmp.l 2050 <ClsSprites+0x20>,d0
 12a:	6600 059c      	bne.w 6c8 <main+0x6c2>
 12e:	2239 0001 b12c 	move.l 1b12c <Copperlist1+0x24>,d1
 134:	b2b9 0000 2054 	cmp.l 2054 <ClsSprites+0x24>,d1
 13a:	6600 058c      	bne.w 6c8 <main+0x6c2>
 13e:	2039 0001 b130 	move.l 1b130 <Copperlist1+0x28>,d0
 144:	b0b9 0000 2058 	cmp.l 2058 <ClsSprites+0x28>,d0
 14a:	6600 057c      	bne.w 6c8 <main+0x6c2>
 14e:	2239 0001 b134 	move.l 1b134 <Copperlist1+0x2c>,d1
 154:	b2b9 0000 205c 	cmp.l 205c <ClsSprites+0x2c>,d1
 15a:	6600 056c      	bne.w 6c8 <main+0x6c2>
 15e:	2039 0001 b138 	move.l 1b138 <Copperlist1+0x30>,d0
 164:	b0b9 0000 2060 	cmp.l 2060 <ClsSprites+0x30>,d0
 16a:	6600 055c      	bne.w 6c8 <main+0x6c2>
 16e:	2239 0001 b13c 	move.l 1b13c <Copperlist1+0x34>,d1
 174:	b2b9 0000 2064 	cmp.l 2064 <ClsSprites+0x34>,d1
 17a:	6600 054c      	bne.w 6c8 <main+0x6c2>
 17e:	2039 0001 b140 	move.l 1b140 <Copperlist1+0x38>,d0
 184:	b0b9 0000 2068 	cmp.l 2068 <ClsSprites+0x38>,d0
 18a:	6600 053c      	bne.w 6c8 <main+0x6c2>
 18e:	2239 0001 b144 	move.l 1b144 <Copperlist1+0x3c>,d1
 194:	b2b9 0000 206c 	cmp.l 206c <ClsSprites+0x3c>,d1
 19a:	6600 052c      	bne.w 6c8 <main+0x6c2>
 19e:	2039 0000 2000 	move.l 2000 <ClScreen>,d0
 1a4:	b0b9 0001 b148 	cmp.l 1b148 <Copperlist1+0x40>,d0
 1aa:	6600 053e      	bne.w 6ea <main+0x6e4>
 1ae:	2239 0000 2004 	move.l 2004 <ClScreen+0x4>,d1
 1b4:	b2b9 0001 b14c 	cmp.l 1b14c <Copperlist1+0x44>,d1
 1ba:	6600 052e      	bne.w 6ea <main+0x6e4>
 1be:	2039 0001 b150 	move.l 1b150 <Copperlist1+0x48>,d0
 1c4:	b0b9 0000 2008 	cmp.l 2008 <ClScreen+0x8>,d0
 1ca:	6600 051e      	bne.w 6ea <main+0x6e4>
 1ce:	2239 0001 b154 	move.l 1b154 <Copperlist1+0x4c>,d1
 1d4:	b2b9 0000 200c 	cmp.l 200c <ClScreen+0xc>,d1
 1da:	6600 050e      	bne.w 6ea <main+0x6e4>
 1de:	2039 0001 b158 	move.l 1b158 <Copperlist1+0x50>,d0
 1e4:	b0b9 0000 2010 	cmp.l 2010 <ClScreen+0x10>,d0
 1ea:	6600 04fe      	bne.w 6ea <main+0x6e4>
 1ee:	2239 0001 b15c 	move.l 1b15c <Copperlist1+0x54>,d1
 1f4:	b2b9 0000 2014 	cmp.l 2014 <ClScreen+0x14>,d1
 1fa:	6600 04ee      	bne.w 6ea <main+0x6e4>
 1fe:	2039 0001 b160 	move.l 1b160 <Copperlist1+0x58>,d0
 204:	b0b9 0000 2018 	cmp.l 2018 <ClScreen+0x18>,d0
 20a:	6600 04de      	bne.w 6ea <main+0x6e4>
 20e:	2239 0001 b164 	move.l 1b164 <Copperlist1+0x5c>,d1
 214:	b2b9 0000 201c 	cmp.l 201c <ClScreen+0x1c>,d1
 21a:	6600 04ce      	bne.w 6ea <main+0x6e4>
 21e:	2039 0001 b168 	move.l 1b168 <Copperlist1+0x60>,d0
 224:	b0b9 0000 2020 	cmp.l 2020 <ClScreen+0x20>,d0
 22a:	6600 04be      	bne.w 6ea <main+0x6e4>
 22e:	2239 0001 b16c 	move.l 1b16c <Copperlist1+0x64>,d1
 234:	b2b9 0000 2024 	cmp.l 2024 <ClScreen+0x24>,d1
 23a:	6600 04ae      	bne.w 6ea <main+0x6e4>
 23e:	2039 0001 b170 	move.l 1b170 <Copperlist1+0x68>,d0
 244:	b0b9 0000 2028 	cmp.l 2028 <ClScreen+0x28>,d0
 24a:	6600 049e      	bne.w 6ea <main+0x6e4>
 24e:	2239 0001 b174 	move.l 1b174 <Copperlist1+0x6c>,d1
 254:	b2b9 0000 202c 	cmp.l 202c <ClScreen+0x2c>,d1
 25a:	6600 048e      	bne.w 6ea <main+0x6e4>
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = 0x40000;
 25e:	23fc 0004 0000 	move.l #262144,1b084 <DrawBuffer>
 264:	0001 b084 
  ViewBuffer = 0x50000;
 268:	23fc 0005 0000 	move.l #327680,1b080 <ViewBuffer>
 26e:	0001 b080 
  SetBplPointers();
 272:	4eb9 0000 08ce 	jsr 8ce <SetBplPointers>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
 278:	0cb9 0005 0000 	cmpi.l #327680,1b084 <DrawBuffer>
 27e:	0001 b084 
 282:	6700 04e4      	beq.w 768 <main+0x762>
    Write( Output(), 
 286:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 28c:	4eae ffc4      	jsr -60(a6)
 290:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 296:	2200           	move.l d0,d1
 298:	243c 0000 0e2e 	move.l #3630,d2
 29e:	763b           	moveq #59,d3
 2a0:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 2a4:	0cb9 00e0 0004 	cmpi.l #14680068,1b178 <Copperlist1+0x70>
 2aa:	0001 b178 
 2ae:	671e           	beq.s 2ce <main+0x2c8>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
 2b0:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 2b6:	4eae ffc4      	jsr -60(a6)
 2ba:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 2c0:	2200           	move.l d0,d1
 2c2:	243c 0000 0e6a 	move.l #3690,d2
 2c8:	763c           	moveq #60,d3
 2ca:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 2ce:	0cb9 00e2 0000 	cmpi.l #14811136,1b17c <Copperlist1+0x74>
 2d4:	0001 b17c 
 2d8:	671e           	beq.s 2f8 <main+0x2f2>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
 2da:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 2e0:	4eae ffc4      	jsr -60(a6)
 2e4:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 2ea:	2200           	move.l d0,d1
 2ec:	243c 0000 0ea7 	move.l #3751,d2
 2f2:	763c           	moveq #60,d3
 2f4:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 2f8:	70fe           	moveq #-2,d0
 2fa:	b0b9 0001 b180 	cmp.l 1b180 <Copperlist1+0x78>,d0
 300:	671e           	beq.s 320 <main+0x31a>
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if( TestCopperlistPos( Copperlist1, 30, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set\n", 31);
 302:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 308:	4eae ffc4      	jsr -60(a6)
 30c:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 312:	2200           	move.l d0,d1
 314:	243c 0000 0ee4 	move.l #3812,d2
 31a:	761f           	moveq #31,d3
 31c:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = ViewBuffer;
  ViewBuffer = tmp;
}

void SwapCl() {
  ULONG tmp = DrawCopper;
 320:	2239 0001 b184 	move.l 1b184 <DrawCopper>,d1
  DrawCopper = ViewCopper;
 326:	2039 0001 b104 	move.l 1b104 <ViewCopper>,d0
 32c:	23c0 0001 b184 	move.l d0,1b184 <DrawCopper>
  ViewCopper = tmp;
 332:	23c1 0001 b104 	move.l d1,1b104 <ViewCopper>
  
  SwapCl();
  if( DrawCopper != &Copperlist2)
 338:	0c80 0001 b088 	cmpi.l #110728,d0
 33e:	671e           	beq.s 35e <main+0x358>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
 340:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 346:	4eae ffc4      	jsr -60(a6)
 34a:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 350:	2200           	move.l d0,d1
 352:	243c 0000 0f06 	move.l #3846,d2
 358:	7615           	moveq #21,d3
 35a:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
 35e:	45f9 0000 0a10 	lea a10 <PrepareDisplay>,a2
 364:	4e92           	jsr (a2)
  if( DrawBuffer != Bitplane1) 
 366:	0cb9 0000 e880 	cmpi.l #59520,1b084 <DrawBuffer>
 36c:	0001 b084 
 370:	671e           	beq.s 390 <main+0x38a>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
 372:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 378:	4eae ffc4      	jsr -60(a6)
 37c:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 382:	2200           	move.l d0,d1
 384:	243c 0000 0f1c 	move.l #3868,d2
 38a:	7637           	moveq #55,d3
 38c:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
 390:	0cb9 0001 b108 	cmpi.l #110856,1b184 <DrawCopper>
 396:	0001 b184 
 39a:	671e           	beq.s 3ba <main+0x3b4>
    Write( Output(), 
 39c:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 3a2:	4eae ffc4      	jsr -60(a6)
 3a6:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 3ac:	2200           	move.l d0,d1
 3ae:	243c 0000 0f54 	move.l #3924,d2
 3b4:	7639           	moveq #57,d3
 3b6:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
 3ba:	4e92           	jsr (a2)
  if( ViewBuffer != Bitplane2) 
 3bc:	0cb9 0000 2080 	cmpi.l #8320,1b080 <ViewBuffer>
 3c2:	0001 b080 
 3c6:	671e           	beq.s 3e6 <main+0x3e0>
    Write( Output(), 
 3c8:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 3ce:	4eae ffc4      	jsr -60(a6)
 3d2:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 3d8:	2200           	move.l d0,d1
 3da:	243c 0000 0f8e 	move.l #3982,d2
 3e0:	7638           	moveq #56,d3
 3e2:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
 3e6:	0cb9 0001 b088 	cmpi.l #110728,1b104 <ViewCopper>
 3ec:	0001 b104 
 3f0:	671e           	beq.s 410 <main+0x40a>
    Write( Output(), 
 3f2:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 3f8:	4eae ffc4      	jsr -60(a6)
 3fc:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 402:	2200           	move.l d0,d1
 404:	243c 0000 0fc7 	move.l #4039,d2
 40a:	763a           	moveq #58,d3
 40c:	4eae ffd0      	jsr -48(a6)
             "PrepareDisplay: ViewCopper should be set to Copperlist 2.\n", 58);

  RunFrame();
 410:	45f9 0000 08fa 	lea 8fa <RunFrame>,a2
 416:	4e92           	jsr (a2)
  UWORD *copword = ViewCopper;
 418:	2079 0001 b104 	movea.l 1b104 <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
 41e:	7000           	moveq #0,d0
 420:	3028 0072      	move.w 114(a0),d0
 424:	4840           	swap d0
 426:	4240           	clr.w d0
 428:	7200           	moveq #0,d1
 42a:	3228 0076      	move.w 118(a0),d1
 42e:	d081           	add.l d1,d0
  if( pointer != Bitplane1) 
 430:	0c80 0000 e880 	cmpi.l #59520,d0
 436:	671e           	beq.s 456 <main+0x450>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
 438:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 43e:	4eae ffc4      	jsr -60(a6)
 442:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 448:	2200           	move.l d0,d1
 44a:	243c 0000 1002 	move.l #4098,d2
 450:	7648           	moveq #72,d3
 452:	4eae ffd0      	jsr -48(a6)
                                                   " after first frame.\n", 72);
  
  RunFrame();
 456:	4e92           	jsr (a2)

  copword = ViewCopper;
 458:	2079 0001 b104 	movea.l 1b104 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
 45e:	7000           	moveq #0,d0
 460:	3028 0072      	move.w 114(a0),d0
 464:	4840           	swap d0
 466:	4240           	clr.w d0
 468:	7200           	moveq #0,d1
 46a:	3228 0076      	move.w 118(a0),d1
 46e:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
 470:	0c80 0000 2080 	cmpi.l #8320,d0
 476:	671e           	beq.s 496 <main+0x490>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
 478:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 47e:	4eae ffc4      	jsr -60(a6)
 482:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 488:	2200           	move.l d0,d1
 48a:	243c 0000 104b 	move.l #4171,d2
 490:	7649           	moveq #73,d3
 492:	4eae ffd0      	jsr -48(a6)
                                                  " after second frame.\n", 73);
  
  RunFrame();
 496:	4e92           	jsr (a2)
  
  copword = ViewCopper;
 498:	2079 0001 b104 	movea.l 1b104 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
 49e:	7000           	moveq #0,d0
 4a0:	3028 0072      	move.w 114(a0),d0
 4a4:	4840           	swap d0
 4a6:	4240           	clr.w d0
 4a8:	7200           	moveq #0,d1
 4aa:	3228 0076      	move.w 118(a0),d1
 4ae:	d081           	add.l d1,d0
  if( pointer != Bitplane1) 
 4b0:	0c80 0000 e880 	cmpi.l #59520,d0
 4b6:	671e           	beq.s 4d6 <main+0x4d0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
 4b8:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 4be:	4eae ffc4      	jsr -60(a6)
 4c2:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 4c8:	2200           	move.l d0,d1
 4ca:	243c 0000 1095 	move.l #4245,d2
 4d0:	7648           	moveq #72,d3
 4d2:	4eae ffd0      	jsr -48(a6)
  RunTests();
	Delay(50);
 4d6:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 4dc:	7232           	moveq #50,d1
 4de:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
 4e2:	247c 00f0 ff60 	movea.l #15794016,a2
 4e8:	4a92           	tst.l (a2)
 4ea:	6718           	beq.s 504 <main+0x4fe>
 4ec:	4878 0001      	pea 1 <_start+0x1>
 4f0:	47f9 0000 07c4 	lea 7c4 <warpmode.part.0>,a3
 4f6:	4e93           	jsr (a3)
 4f8:	588f           	addq.l #4,sp
 4fa:	4a92           	tst.l (a2)
 4fc:	6706           	beq.s 504 <main+0x4fe>
 4fe:	42a7           	clr.l -(sp)
 500:	4e93           	jsr (a3)
 502:	588f           	addq.l #4,sp
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
 504:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 50a:	23ee 0022 0001 	move.l 34(a6),1b188 <ActiView>
 510:	b188 
	OwnBlitter();
 512:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
 516:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 51c:	4eae ff1c      	jsr -228(a6)
	Disable();
 520:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 526:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
 52a:	2479 0001 b1a2 	movea.l 1b1a2 <hw>,a2
 530:	302a 0010      	move.w 16(a2),d0
 534:	33c0 0001 b18c 	move.w d0,1b18c <SystemADKCON>
	SystemInts=hw->intenar;
 53a:	302a 001c      	move.w 28(a2),d0
 53e:	33c0 0001 b190 	move.w d0,1b190 <SystemInts>
	SystemDMA=hw->dmaconr;
 544:	302a 0002      	move.w 2(a2),d0
 548:	33c0 0001 b18e 	move.w d0,1b18e <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
 54e:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 554:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
 55a:	47f9 0000 0a54 	lea a54 <WaitVbl>,a3
 560:	4e93           	jsr (a3)
	WaitVbl();
 562:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
 564:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	for(int a=0;a<32;a++)
 56a:	7000           	moveq #0,d0
		hw->color[a]=0;
 56c:	2200           	move.l d0,d1
 56e:	0681 0000 00c0 	addi.l #192,d1
 574:	d281           	add.l d1,d1
 576:	35bc 0000 1800 	move.w #0,(0,a2,d1.l)
	for(int a=0;a<32;a++)
 57c:	5280           	addq.l #1,d0
 57e:	7220           	moveq #32,d1
 580:	b280           	cmp.l d0,d1
 582:	66e8           	bne.s 56c <main+0x566>

	LoadView(0);
 584:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 58a:	93c9           	suba.l a1,a1
 58c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 590:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 596:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 59a:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 5a0:	4eae fef2      	jsr -270(a6)

	WaitVbl();
 5a4:	4e93           	jsr (a3)
	WaitVbl();
 5a6:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
 5a8:	3f7c 4e7a 001a 	move.w #20090,26(sp)
 5ae:	3f7c 0801 001c 	move.w #2049,28(sp)
 5b4:	3f7c 4e73 001e 	move.w #20083,30(sp)
	if (SysBase->AttnFlags & AFF_68010) 
 5ba:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 5c0:	082e 0000 0129 	btst #0,297(a6)
 5c6:	6700 01d0      	beq.w 798 <main+0x792>
		vbr = (APTR)Supervisor((void*)getvbr);
 5ca:	7e1a           	moveq #26,d7
 5cc:	de8f           	add.l sp,d7
 5ce:	cf8d           	exg d7,a5
 5d0:	4eae ffe2      	jsr -30(a6)
 5d4:	cf8d           	exg d7,a5

	VBR=GetVBR();
 5d6:	23c0 0001 b192 	move.l d0,1b192 <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 5dc:	2079 0001 b192 	movea.l 1b192 <VBR.lto_priv.0>,a0
 5e2:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 5e6:	23ca 0001 b196 	move.l a2,1b196 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
 5ec:	4e93           	jsr (a3)
}

void FreeSystem() { 
	WaitVbl();
 5ee:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 5f0:	2079 0001 b1a2 	movea.l 1b1a2 <hw>,a0
 5f6:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 5fa:	3028 0002      	move.w 2(a0),d0
 5fe:	0800 000e      	btst #14,d0
 602:	66f6           	bne.s 5fa <main+0x5f4>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
 604:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 60a:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
 610:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 616:	2279 0001 b192 	movea.l 1b192 <VBR.lto_priv.0>,a1
 61c:	234a 006c      	move.l a2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
 620:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 626:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
 62c:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
 632:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
 638:	3039 0001 b190 	move.w 1b190 <SystemInts>,d0
 63e:	0040 8000      	ori.w #-32768,d0
 642:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
 646:	3039 0001 b18e 	move.w 1b18e <SystemDMA>,d0
 64c:	0040 8000      	ori.w #-32768,d0
 650:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
 654:	3039 0001 b18c 	move.w 1b18c <SystemADKCON>,d0
 65a:	0040 8000      	ori.w #-32768,d0
 65e:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
 662:	2279 0001 b188 	movea.l 1b188 <ActiView>,a1
 668:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 66c:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 672:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 676:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 67c:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
 680:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 686:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
 68a:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 690:	4eae fe32      	jsr -462(a6)
	Enable();
 694:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 69a:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
 69e:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 6a4:	2279 0001 b19a 	movea.l 1b19a <DOSBase>,a1
 6aa:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
 6ae:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 6b4:	2279 0001 b19e 	movea.l 1b19e <GfxBase>,a1
 6ba:	4eae fe62      	jsr -414(a6)
}
 6be:	7000           	moveq #0,d0
 6c0:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
 6c4:	508f           	addq.l #8,sp
 6c6:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
 6c8:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 6ce:	4eae ffc4      	jsr -60(a6)
 6d2:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 6d8:	2200           	move.l d0,d1
 6da:	243c 0000 1115 	move.l #4373,d2
 6e0:	762c           	moveq #44,d3
 6e2:	4eae ffd0      	jsr -48(a6)
 6e6:	6000 fab6      	bra.w 19e <main+0x198>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
 6ea:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 6f0:	4eae ffc4      	jsr -60(a6)
 6f4:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 6fa:	2200           	move.l d0,d1
 6fc:	243c 0000 10de 	move.l #4318,d2
 702:	7636           	moveq #54,d3
 704:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = 0x40000;
 708:	23fc 0004 0000 	move.l #262144,1b084 <DrawBuffer>
 70e:	0001 b084 
  ViewBuffer = 0x50000;
 712:	23fc 0005 0000 	move.l #327680,1b080 <ViewBuffer>
 718:	0001 b080 
  SetBplPointers();
 71c:	4eb9 0000 08ce 	jsr 8ce <SetBplPointers>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
 722:	0cb9 0005 0000 	cmpi.l #327680,1b084 <DrawBuffer>
 728:	0001 b084 
 72c:	6600 fb58      	bne.w 286 <main+0x280>
 730:	6036           	bra.s 768 <main+0x762>
		Exit(0);
 732:	9dce           	suba.l a6,a6
 734:	7200           	moveq #0,d1
 736:	4eae ff70      	jsr -144(a6)
 73a:	6000 f916      	bra.w 52 <main+0x4c>
		Exit(0);
 73e:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 744:	7200           	moveq #0,d1
 746:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
 74a:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 750:	43f9 0000 0df6 	lea df6 <incbin_colors_end+0x5a>,a1
 756:	7000           	moveq #0,d0
 758:	4eae fdd8      	jsr -552(a6)
 75c:	23c0 0001 b19a 	move.l d0,1b19a <DOSBase>
	if (!DOSBase)
 762:	6600 f8ee      	bne.w 52 <main+0x4c>
 766:	60ca           	bra.s 732 <main+0x72c>
 768:	0cb9 0004 0000 	cmpi.l #262144,1b080 <ViewBuffer>
 76e:	0001 b080 
 772:	6700 fb30      	beq.w 2a4 <main+0x29e>
    Write( Output(), 
 776:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 77c:	4eae ffc4      	jsr -60(a6)
 780:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 786:	2200           	move.l d0,d1
 788:	243c 0000 0e2e 	move.l #3630,d2
 78e:	763b           	moveq #59,d3
 790:	4eae ffd0      	jsr -48(a6)
 794:	6000 fb0e      	bra.w 2a4 <main+0x29e>
	APTR vbr = 0;
 798:	7000           	moveq #0,d0
	VBR=GetVBR();
 79a:	23c0 0001 b192 	move.l d0,1b192 <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 7a0:	2079 0001 b192 	movea.l 1b192 <VBR.lto_priv.0>,a0
 7a6:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 7aa:	23ca 0001 b196 	move.l a2,1b196 <SystemIrq>
	WaitVbl();
 7b0:	4e93           	jsr (a3)
	WaitVbl();
 7b2:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 7b4:	2079 0001 b1a2 	movea.l 1b1a2 <hw>,a0
 7ba:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 7be:	6000 fe3a      	bra.w 5fa <main+0x5f4>
 7c2:	4e71           	nop

000007c4 <warpmode.part.0>:
void warpmode(int on) 
 7c4:	598f           	subq.l #4,sp
 7c6:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 7c8:	4aaf 000c      	tst.l 12(sp)
 7cc:	674c           	beq.s 81a <warpmode.part.0+0x56>
 7ce:	4878 0001      	pea 1 <_start+0x1>
 7d2:	740b           	moveq #11,d2
 7d4:	d48f           	add.l sp,d2
 7d6:	2f02           	move.l d2,-(sp)
 7d8:	42a7           	clr.l -(sp)
 7da:	4879 0000 0dd0 	pea dd0 <incbin_colors_end+0x34>
 7e0:	4878 ffff      	pea ffffffff <_end+0xfffe4e53>
 7e4:	4878 0052      	pea 52 <main+0x4c>
 7e8:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef4db4>
 7ee:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 7f2:	203c 0000 0db6 	move.l #3510,d0
 7f8:	4878 0001      	pea 1 <_start+0x1>
 7fc:	2f02           	move.l d2,-(sp)
 7fe:	42a7           	clr.l -(sp)
 800:	2f00           	move.l d0,-(sp)
 802:	4878 ffff      	pea ffffffff <_end+0xfffe4e53>
 806:	4878 0052      	pea 52 <main+0x4c>
 80a:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef4db4>
	}
}
 810:	4fef 0018      	lea 24(sp),sp
 814:	241f           	move.l (sp)+,d2
 816:	588f           	addq.l #4,sp
 818:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 81a:	4878 0001      	pea 1 <_start+0x1>
 81e:	740b           	moveq #11,d2
 820:	d48f           	add.l sp,d2
 822:	2f02           	move.l d2,-(sp)
 824:	42a7           	clr.l -(sp)
 826:	4879 0000 0dda 	pea dda <incbin_colors_end+0x3e>
 82c:	4878 ffff      	pea ffffffff <_end+0xfffe4e53>
 830:	4878 0052      	pea 52 <main+0x4c>
 834:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef4db4>
 83a:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 83e:	203c 0000 0d9d 	move.l #3485,d0
 844:	4878 0001      	pea 1 <_start+0x1>
 848:	2f02           	move.l d2,-(sp)
 84a:	42a7           	clr.l -(sp)
 84c:	2f00           	move.l d0,-(sp)
 84e:	4878 ffff      	pea ffffffff <_end+0xfffe4e53>
 852:	4878 0052      	pea 52 <main+0x4c>
 856:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef4db4>
}
 85c:	4fef 0018      	lea 24(sp),sp
 860:	241f           	move.l (sp)+,d2
 862:	588f           	addq.l #4,sp
 864:	4e75           	rts

00000866 <KPrintF>:
{
 866:	4fef ff80      	lea -128(sp),sp
 86a:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
 86e:	4ab9 00f0 ff60 	tst.l f0ff60 <_end+0xef4db4>
 874:	6734           	beq.s 8aa <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
 876:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 87c:	206f 0090      	movea.l 144(sp),a0
 880:	43ef 0094      	lea 148(sp),a1
 884:	45f9 0000 0d18 	lea d18 <PutChar>,a2
 88a:	47ef 000c      	lea 12(sp),a3
 88e:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
 892:	2f0b           	move.l a3,-(sp)
 894:	4878 0056      	pea 56 <main+0x50>
 898:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef4db4>
 89e:	508f           	addq.l #8,sp
}
 8a0:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 8a4:	4fef 0080      	lea 128(sp),sp
 8a8:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
 8aa:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 8b0:	206f 0090      	movea.l 144(sp),a0
 8b4:	43ef 0094      	lea 148(sp),a1
 8b8:	45f9 0000 0d0a 	lea d0a <KPutCharX>,a2
 8be:	97cb           	suba.l a3,a3
 8c0:	4eae fdf6      	jsr -522(a6)
}
 8c4:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 8c8:	4fef 0080      	lea 128(sp),sp
 8cc:	4e75           	rts

000008ce <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
 8ce:	2039 0001 b084 	move.l 1b084 <DrawBuffer>,d0
  UWORD *copword = DrawCopper;
 8d4:	2079 0001 b184 	movea.l 1b184 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
 8da:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
 8de:	2200           	move.l d0,d1
 8e0:	4241           	clr.w d1
 8e2:	4841           	swap d1
 8e4:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
 8e8:	23f9 0001 b080 	move.l 1b080 <ViewBuffer>,1b084 <DrawBuffer>
 8ee:	0001 b084 
  ViewBuffer = tmp;
 8f2:	23c0 0001 b080 	move.l d0,1b080 <ViewBuffer>
}
 8f8:	4e75           	rts

000008fa <RunFrame>:
	}
	SetInterruptHandler((APTR)interruptHandler);
}

void RunFrame() {
  SetBplPointers();
 8fa:	4eba ffd2      	jsr 8ce <SetBplPointers>(pc)
  ULONG tmp = DrawCopper;
 8fe:	2039 0001 b184 	move.l 1b184 <DrawCopper>,d0
  DrawCopper = ViewCopper;
 904:	23f9 0001 b104 	move.l 1b104 <ViewCopper>,1b184 <DrawCopper>
 90a:	0001 b184 
  ViewCopper = tmp;
 90e:	23c0 0001 b104 	move.l d0,1b104 <ViewCopper>
  SwapCl();
 914:	4e75           	rts

00000916 <ClBuild>:
void ClBuild(  ULONG *cl) {
 916:	206f 0004      	movea.l 4(sp),a0
    *cl++ = *clpartinstruction++;
 91a:	20b9 0000 2030 	move.l 2030 <ClsSprites>,(a0)
 920:	2179 0000 2034 	move.l 2034 <ClsSprites+0x4>,4(a0)
 926:	0004 
 928:	2179 0000 2038 	move.l 2038 <ClsSprites+0x8>,8(a0)
 92e:	0008 
 930:	2179 0000 203c 	move.l 203c <ClsSprites+0xc>,12(a0)
 936:	000c 
 938:	2179 0000 2040 	move.l 2040 <ClsSprites+0x10>,16(a0)
 93e:	0010 
 940:	2179 0000 2044 	move.l 2044 <ClsSprites+0x14>,20(a0)
 946:	0014 
 948:	2179 0000 2048 	move.l 2048 <ClsSprites+0x18>,24(a0)
 94e:	0018 
 950:	2179 0000 204c 	move.l 204c <ClsSprites+0x1c>,28(a0)
 956:	001c 
 958:	2179 0000 2050 	move.l 2050 <ClsSprites+0x20>,32(a0)
 95e:	0020 
 960:	2179 0000 2054 	move.l 2054 <ClsSprites+0x24>,36(a0)
 966:	0024 
 968:	2179 0000 2058 	move.l 2058 <ClsSprites+0x28>,40(a0)
 96e:	0028 
 970:	2179 0000 205c 	move.l 205c <ClsSprites+0x2c>,44(a0)
 976:	002c 
 978:	2179 0000 2060 	move.l 2060 <ClsSprites+0x30>,48(a0)
 97e:	0030 
 980:	2179 0000 2064 	move.l 2064 <ClsSprites+0x34>,52(a0)
 986:	0034 
 988:	2179 0000 2068 	move.l 2068 <ClsSprites+0x38>,56(a0)
 98e:	0038 
 990:	2179 0000 206c 	move.l 206c <ClsSprites+0x3c>,60(a0)
 996:	003c 
    *cl++ = *clpartinstruction++;
 998:	2179 0000 2000 	move.l 2000 <ClScreen>,64(a0)
 99e:	0040 
 9a0:	2179 0000 2004 	move.l 2004 <ClScreen+0x4>,68(a0)
 9a6:	0044 
 9a8:	2179 0000 2008 	move.l 2008 <ClScreen+0x8>,72(a0)
 9ae:	0048 
 9b0:	2179 0000 200c 	move.l 200c <ClScreen+0xc>,76(a0)
 9b6:	004c 
 9b8:	2179 0000 2010 	move.l 2010 <ClScreen+0x10>,80(a0)
 9be:	0050 
 9c0:	2179 0000 2014 	move.l 2014 <ClScreen+0x14>,84(a0)
 9c6:	0054 
 9c8:	2179 0000 2018 	move.l 2018 <ClScreen+0x18>,88(a0)
 9ce:	0058 
 9d0:	2179 0000 201c 	move.l 201c <ClScreen+0x1c>,92(a0)
 9d6:	005c 
 9d8:	2179 0000 2020 	move.l 2020 <ClScreen+0x20>,96(a0)
 9de:	0060 
 9e0:	2179 0000 2024 	move.l 2024 <ClScreen+0x24>,100(a0)
 9e6:	0064 
 9e8:	2179 0000 2028 	move.l 2028 <ClScreen+0x28>,104(a0)
 9ee:	0068 
 9f0:	2179 0000 202c 	move.l 202c <ClScreen+0x2c>,108(a0)
 9f6:	006c 
  *cl++ = 0x00e00000;
 9f8:	217c 00e0 0000 	move.l #14680064,112(a0)
 9fe:	0070 
  *cl++ = 0x00e20000;
 a00:	217c 00e2 0000 	move.l #14811136,116(a0)
 a06:	0074 
  *cl = 0xfffffffe;
 a08:	70fe           	moveq #-2,d0
 a0a:	2140 0078      	move.l d0,120(a0)
}
 a0e:	4e75           	rts

00000a10 <PrepareDisplay>:
void PrepareDisplay() {
 a10:	2f0a           	move.l a2,-(sp)
  ClBuild( Copperlist1);
 a12:	4879 0001 b108 	pea 1b108 <Copperlist1>
 a18:	45fa fefc      	lea 916 <ClBuild>(pc),a2
 a1c:	4e92           	jsr (a2)
  ClBuild( Copperlist2);
 a1e:	4879 0001 b088 	pea 1b088 <Copperlist2>
 a24:	4e92           	jsr (a2)
  DrawBuffer = Bitplane1;
 a26:	23fc 0000 e880 	move.l #59520,1b084 <DrawBuffer>
 a2c:	0001 b084 
  DrawCopper = Copperlist1;
 a30:	23fc 0001 b108 	move.l #110856,1b184 <DrawCopper>
 a36:	0001 b184 
  ViewBuffer = Bitplane2;
 a3a:	23fc 0000 2080 	move.l #8320,1b080 <ViewBuffer>
 a40:	0001 b080 
  ViewCopper = Copperlist2;
 a44:	23fc 0001 b088 	move.l #110728,1b104 <ViewCopper>
 a4a:	0001 b104 
 a4e:	508f           	addq.l #8,sp
}
 a50:	245f           	movea.l (sp)+,a2
 a52:	4e75           	rts

00000a54 <WaitVbl>:
void WaitVbl() {
 a54:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 a56:	2039 00df f004 	move.l dff004 <_end+0xde3e58>,d0
 a5c:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
 a5e:	2017           	move.l (sp),d0
 a60:	0280 0001 ff00 	andi.l #130816,d0
 a66:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
 a68:	2017           	move.l (sp),d0
 a6a:	0c80 0001 3700 	cmpi.l #79616,d0
 a70:	67e4           	beq.s a56 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 a72:	2039 00df f004 	move.l dff004 <_end+0xde3e58>,d0
 a78:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
 a7c:	202f 0004      	move.l 4(sp),d0
 a80:	0280 0001 ff00 	andi.l #130816,d0
 a86:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
 a8a:	202f 0004      	move.l 4(sp),d0
 a8e:	0c80 0001 3700 	cmpi.l #79616,d0
 a94:	66dc           	bne.s a72 <WaitVbl+0x1e>
}
 a96:	508f           	addq.l #8,sp
 a98:	4e75           	rts

00000a9a <memcpy>:
{
 a9a:	48e7 3820      	movem.l d2-d4/a2,-(sp)
 a9e:	202f 0014      	move.l 20(sp),d0
 aa2:	226f 0018      	movea.l 24(sp),a1
 aa6:	222f 001c      	move.l 28(sp),d1
	while(len--)
 aaa:	2601           	move.l d1,d3
 aac:	5383           	subq.l #1,d3
 aae:	4a81           	tst.l d1
 ab0:	6762           	beq.s b14 <memcpy+0x7a>
 ab2:	2040           	movea.l d0,a0
 ab4:	5888           	addq.l #4,a0
 ab6:	b1c9           	cmpa.l a1,a0
 ab8:	53c2           	sl.s d2
 aba:	4402           	neg.b d2
 abc:	41e9 0004      	lea 4(a1),a0
 ac0:	b1c0           	cmpa.l d0,a0
 ac2:	53c4           	sl.s d4
 ac4:	4404           	neg.b d4
 ac6:	8404           	or.b d4,d2
 ac8:	7808           	moveq #8,d4
 aca:	b883           	cmp.l d3,d4
 acc:	55c4           	sc.s d4
 ace:	4404           	neg.b d4
 ad0:	c404           	and.b d4,d2
 ad2:	6746           	beq.s b1a <memcpy+0x80>
 ad4:	2409           	move.l a1,d2
 ad6:	8480           	or.l d0,d2
 ad8:	7803           	moveq #3,d4
 ada:	c484           	and.l d4,d2
 adc:	663c           	bne.s b1a <memcpy+0x80>
 ade:	2049           	movea.l a1,a0
 ae0:	2440           	movea.l d0,a2
 ae2:	74fc           	moveq #-4,d2
 ae4:	c481           	and.l d1,d2
 ae6:	d489           	add.l a1,d2
		*d++ = *s++;
 ae8:	24d8           	move.l (a0)+,(a2)+
 aea:	b488           	cmp.l a0,d2
 aec:	66fa           	bne.s ae8 <memcpy+0x4e>
 aee:	74fc           	moveq #-4,d2
 af0:	c481           	and.l d1,d2
 af2:	2040           	movea.l d0,a0
 af4:	d1c2           	adda.l d2,a0
 af6:	d3c2           	adda.l d2,a1
 af8:	9682           	sub.l d2,d3
 afa:	b481           	cmp.l d1,d2
 afc:	6716           	beq.s b14 <memcpy+0x7a>
 afe:	1091           	move.b (a1),(a0)
	while(len--)
 b00:	4a83           	tst.l d3
 b02:	6710           	beq.s b14 <memcpy+0x7a>
		*d++ = *s++;
 b04:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
 b0a:	5383           	subq.l #1,d3
 b0c:	6706           	beq.s b14 <memcpy+0x7a>
		*d++ = *s++;
 b0e:	1169 0002 0002 	move.b 2(a1),2(a0)
}
 b14:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
 b18:	4e75           	rts
 b1a:	2040           	movea.l d0,a0
 b1c:	d289           	add.l a1,d1
		*d++ = *s++;
 b1e:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 b20:	b289           	cmp.l a1,d1
 b22:	67f0           	beq.s b14 <memcpy+0x7a>
		*d++ = *s++;
 b24:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 b26:	b289           	cmp.l a1,d1
 b28:	66f4           	bne.s b1e <memcpy+0x84>
 b2a:	60e8           	bra.s b14 <memcpy+0x7a>

00000b2c <memset>:
{
 b2c:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
 b30:	202f 0024      	move.l 36(sp),d0
 b34:	2a2f 0028      	move.l 40(sp),d5
 b38:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
 b3c:	2809           	move.l a1,d4
 b3e:	5384           	subq.l #1,d4
 b40:	b2fc 0000      	cmpa.w #0,a1
 b44:	6f00 00b0      	ble.w bf6 <memset+0xca>
 b48:	1e05           	move.b d5,d7
 b4a:	2200           	move.l d0,d1
 b4c:	4481           	neg.l d1
 b4e:	7403           	moveq #3,d2
 b50:	c282           	and.l d2,d1
 b52:	7c05           	moveq #5,d6
		*ptr++ = val;
 b54:	2440           	movea.l d0,a2
 b56:	bc84           	cmp.l d4,d6
 b58:	646a           	bcc.s bc4 <memset+0x98>
 b5a:	4a81           	tst.l d1
 b5c:	6724           	beq.s b82 <memset+0x56>
 b5e:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
 b60:	5384           	subq.l #1,d4
 b62:	7401           	moveq #1,d2
 b64:	b481           	cmp.l d1,d2
 b66:	671a           	beq.s b82 <memset+0x56>
		*ptr++ = val;
 b68:	2440           	movea.l d0,a2
 b6a:	548a           	addq.l #2,a2
 b6c:	2040           	movea.l d0,a0
 b6e:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
 b72:	5384           	subq.l #1,d4
 b74:	7403           	moveq #3,d2
 b76:	b481           	cmp.l d1,d2
 b78:	6608           	bne.s b82 <memset+0x56>
		*ptr++ = val;
 b7a:	528a           	addq.l #1,a2
 b7c:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
 b80:	5384           	subq.l #1,d4
 b82:	2609           	move.l a1,d3
 b84:	9681           	sub.l d1,d3
 b86:	7c00           	moveq #0,d6
 b88:	1c05           	move.b d5,d6
 b8a:	2406           	move.l d6,d2
 b8c:	4842           	swap d2
 b8e:	4242           	clr.w d2
 b90:	2042           	movea.l d2,a0
 b92:	2406           	move.l d6,d2
 b94:	e14a           	lsl.w #8,d2
 b96:	4842           	swap d2
 b98:	4242           	clr.w d2
 b9a:	e18e           	lsl.l #8,d6
 b9c:	2646           	movea.l d6,a3
 b9e:	2c08           	move.l a0,d6
 ba0:	8486           	or.l d6,d2
 ba2:	2c0b           	move.l a3,d6
 ba4:	8486           	or.l d6,d2
 ba6:	1407           	move.b d7,d2
 ba8:	2040           	movea.l d0,a0
 baa:	d1c1           	adda.l d1,a0
 bac:	72fc           	moveq #-4,d1
 bae:	c283           	and.l d3,d1
 bb0:	d288           	add.l a0,d1
		*ptr++ = val;
 bb2:	20c2           	move.l d2,(a0)+
 bb4:	b1c1           	cmpa.l d1,a0
 bb6:	66fa           	bne.s bb2 <memset+0x86>
 bb8:	72fc           	moveq #-4,d1
 bba:	c283           	and.l d3,d1
 bbc:	d5c1           	adda.l d1,a2
 bbe:	9881           	sub.l d1,d4
 bc0:	b283           	cmp.l d3,d1
 bc2:	6732           	beq.s bf6 <memset+0xca>
 bc4:	1485           	move.b d5,(a2)
	while(len-- > 0)
 bc6:	4a84           	tst.l d4
 bc8:	6f2c           	ble.s bf6 <memset+0xca>
		*ptr++ = val;
 bca:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
 bce:	7201           	moveq #1,d1
 bd0:	b284           	cmp.l d4,d1
 bd2:	6c22           	bge.s bf6 <memset+0xca>
		*ptr++ = val;
 bd4:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
 bd8:	7402           	moveq #2,d2
 bda:	b484           	cmp.l d4,d2
 bdc:	6c18           	bge.s bf6 <memset+0xca>
		*ptr++ = val;
 bde:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
 be2:	7c03           	moveq #3,d6
 be4:	bc84           	cmp.l d4,d6
 be6:	6c0e           	bge.s bf6 <memset+0xca>
		*ptr++ = val;
 be8:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
 bec:	7204           	moveq #4,d1
 bee:	b284           	cmp.l d4,d1
 bf0:	6c04           	bge.s bf6 <memset+0xca>
		*ptr++ = val;
 bf2:	1545 0005      	move.b d5,5(a2)
}
 bf6:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
 bfa:	4e75           	rts

00000bfc <strlen>:
{
 bfc:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
 c00:	7000           	moveq #0,d0
	while(*s++)
 c02:	4a10           	tst.b (a0)
 c04:	6708           	beq.s c0e <strlen+0x12>
		t++;
 c06:	5280           	addq.l #1,d0
	while(*s++)
 c08:	4a30 0800      	tst.b (0,a0,d0.l)
 c0c:	66f8           	bne.s c06 <strlen+0xa>
}
 c0e:	4e75           	rts

00000c10 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
 c10:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
 c14:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
 c18:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
 c1c:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
 c20:	d041           	add.w d1,d0
	swap	d0
 c22:	4840           	swap d0
	clrw	d0
 c24:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
 c26:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
 c2a:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
 c2e:	d081           	add.l d1,d0

	rts
 c30:	4e75           	rts

00000c32 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
 c32:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
 c34:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
 c38:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
 c3c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
 c42:	6416           	bcc.s c5a <__udivsi3+0x28>
	movel	d0, d2
 c44:	2400           	move.l d0,d2
	clrw	d2
 c46:	4242           	clr.w d2
	swap	d2
 c48:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
 c4a:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
 c4c:	3002           	move.w d2,d0
	swap	d0
 c4e:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
 c50:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
 c54:	84c1           	divu.w d1,d2
	movew	d2, d0
 c56:	3002           	move.w d2,d0
	jra	6f
 c58:	6030           	bra.s c8a <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
 c5a:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
 c5c:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
 c5e:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
 c60:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
 c66:	64f4           	bcc.s c5c <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
 c68:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
 c6a:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
 c70:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
 c72:	c2c0           	mulu.w d0,d1
	swap	d2
 c74:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
 c76:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
 c78:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
 c7a:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
 c7c:	660a           	bne.s c88 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
 c7e:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
 c80:	6506           	bcs.s c88 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
 c82:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
 c86:	6302           	bls.s c8a <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
 c88:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
 c8a:	241f           	move.l (sp)+,d2
	rts
 c8c:	4e75           	rts

00000c8e <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
 c8e:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
 c90:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
 c92:	222f 000c      	move.l 12(sp),d1
	jpl	1f
 c96:	6a04           	bpl.s c9c <__divsi3+0xe>
	negl	d1
 c98:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
 c9a:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
 c9c:	202f 0008      	move.l 8(sp),d0
	jpl	2f
 ca0:	6a04           	bpl.s ca6 <__divsi3+0x18>
	negl	d0
 ca2:	4480           	neg.l d0
	negb	d2
 ca4:	4402           	neg.b d2

2:	movel	d1, sp@-
 ca6:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 ca8:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
 caa:	6186           	bsr.s c32 <__udivsi3>
	addql	IMM (8), sp
 cac:	508f           	addq.l #8,sp

	tstb	d2
 cae:	4a02           	tst.b d2
	jpl	3f
 cb0:	6a02           	bpl.s cb4 <__divsi3+0x26>
	negl	d0
 cb2:	4480           	neg.l d0

3:	movel	sp@+, d2
 cb4:	241f           	move.l (sp)+,d2
	rts
 cb6:	4e75           	rts

00000cb8 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 cb8:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 cbc:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 cc0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 cc2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
 cc4:	61c8           	bsr.s c8e <__divsi3>
	addql	IMM (8), sp
 cc6:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 cc8:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 ccc:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 cce:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 cd0:	6100 ff3e      	bsr.w c10 <__mulsi3>
	addql	IMM (8), sp
 cd4:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 cd6:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 cda:	9280           	sub.l d0,d1
	movel	d1, d0
 cdc:	2001           	move.l d1,d0
	rts
 cde:	4e75           	rts

00000ce0 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 ce0:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 ce4:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 ce8:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 cea:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
 cec:	6100 ff44      	bsr.w c32 <__udivsi3>
	addql	IMM (8), sp
 cf0:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 cf2:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 cf6:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 cf8:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 cfa:	6100 ff14      	bsr.w c10 <__mulsi3>
	addql	IMM (8), sp
 cfe:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 d00:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 d04:	9280           	sub.l d0,d1
	movel	d1, d0
 d06:	2001           	move.l d1,d0
	rts
 d08:	4e75           	rts

00000d0a <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
 d0a:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
 d0c:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
 d10:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
 d14:	2c5f           	movea.l (sp)+,a6
    rts
 d16:	4e75           	rts

00000d18 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
 d18:	16c0           	move.b d0,(a3)+
	rts
 d1a:	4e75           	rts
