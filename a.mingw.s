
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
  20:	43f9 0000 0da5 	lea da5 <incbin_colors_end+0x49>,a1
  26:	7000           	moveq #0,d0
  28:	4eae fdd8      	jsr -552(a6)
  2c:	23c0 0001 b19e 	move.l d0,1b19e <GfxBase>
	if (!GfxBase)
  32:	6700 06e8      	beq.w 71c <main+0x716>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
  36:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
  3c:	43f9 0000 0db6 	lea db6 <incbin_colors_end+0x5a>,a1
  42:	7000           	moveq #0,d0
  44:	4eae fdd8      	jsr -552(a6)
  48:	23c0 0001 b19a 	move.l d0,1b19a <DOSBase>
	if (!DOSBase)
  4e:	6700 06c0      	beq.w 710 <main+0x70a>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
  52:	4879 0000 0dc2 	pea dc2 <incbin_colors_end+0x66>
  58:	4eb9 0000 0842 	jsr 842 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
  5e:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
  64:	4eae ffc4      	jsr -60(a6)
  68:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
  6e:	2200           	move.l d0,d1
  70:	243c 0000 0dde 	move.l #3550,d2
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
  96:	4eb9 0000 08d6 	jsr 8d6 <ClBuild>
    if( instructions[ pos+i] != batch[ i])
  9c:	508f           	addq.l #8,sp
  9e:	2039 0001 b108 	move.l 1b108 <Copperlist1>,d0
  a4:	b0b9 0000 2030 	cmp.l 2030 <ClsSprites>,d0
  aa:	6600 05f8      	bne.w 6a4 <main+0x69e>
  ae:	2239 0001 b10c 	move.l 1b10c <Copperlist1+0x4>,d1
  b4:	b2b9 0000 2034 	cmp.l 2034 <ClsSprites+0x4>,d1
  ba:	6600 05e8      	bne.w 6a4 <main+0x69e>
  be:	2039 0001 b110 	move.l 1b110 <Copperlist1+0x8>,d0
  c4:	b0b9 0000 2038 	cmp.l 2038 <ClsSprites+0x8>,d0
  ca:	6600 05d8      	bne.w 6a4 <main+0x69e>
  ce:	2239 0001 b114 	move.l 1b114 <Copperlist1+0xc>,d1
  d4:	b2b9 0000 203c 	cmp.l 203c <ClsSprites+0xc>,d1
  da:	6600 05c8      	bne.w 6a4 <main+0x69e>
  de:	2039 0001 b118 	move.l 1b118 <Copperlist1+0x10>,d0
  e4:	b0b9 0000 2040 	cmp.l 2040 <ClsSprites+0x10>,d0
  ea:	6600 05b8      	bne.w 6a4 <main+0x69e>
  ee:	2239 0001 b11c 	move.l 1b11c <Copperlist1+0x14>,d1
  f4:	b2b9 0000 2044 	cmp.l 2044 <ClsSprites+0x14>,d1
  fa:	6600 05a8      	bne.w 6a4 <main+0x69e>
  fe:	2039 0001 b120 	move.l 1b120 <Copperlist1+0x18>,d0
 104:	b0b9 0000 2048 	cmp.l 2048 <ClsSprites+0x18>,d0
 10a:	6600 0598      	bne.w 6a4 <main+0x69e>
 10e:	2239 0001 b124 	move.l 1b124 <Copperlist1+0x1c>,d1
 114:	b2b9 0000 204c 	cmp.l 204c <ClsSprites+0x1c>,d1
 11a:	6600 0588      	bne.w 6a4 <main+0x69e>
 11e:	2039 0001 b128 	move.l 1b128 <Copperlist1+0x20>,d0
 124:	b0b9 0000 2050 	cmp.l 2050 <ClsSprites+0x20>,d0
 12a:	6600 0578      	bne.w 6a4 <main+0x69e>
 12e:	2239 0001 b12c 	move.l 1b12c <Copperlist1+0x24>,d1
 134:	b2b9 0000 2054 	cmp.l 2054 <ClsSprites+0x24>,d1
 13a:	6600 0568      	bne.w 6a4 <main+0x69e>
 13e:	2039 0001 b130 	move.l 1b130 <Copperlist1+0x28>,d0
 144:	b0b9 0000 2058 	cmp.l 2058 <ClsSprites+0x28>,d0
 14a:	6600 0558      	bne.w 6a4 <main+0x69e>
 14e:	2239 0001 b134 	move.l 1b134 <Copperlist1+0x2c>,d1
 154:	b2b9 0000 205c 	cmp.l 205c <ClsSprites+0x2c>,d1
 15a:	6600 0548      	bne.w 6a4 <main+0x69e>
 15e:	2039 0001 b138 	move.l 1b138 <Copperlist1+0x30>,d0
 164:	b0b9 0000 2060 	cmp.l 2060 <ClsSprites+0x30>,d0
 16a:	6600 0538      	bne.w 6a4 <main+0x69e>
 16e:	2239 0001 b13c 	move.l 1b13c <Copperlist1+0x34>,d1
 174:	b2b9 0000 2064 	cmp.l 2064 <ClsSprites+0x34>,d1
 17a:	6600 0528      	bne.w 6a4 <main+0x69e>
 17e:	2039 0001 b140 	move.l 1b140 <Copperlist1+0x38>,d0
 184:	b0b9 0000 2068 	cmp.l 2068 <ClsSprites+0x38>,d0
 18a:	6600 0518      	bne.w 6a4 <main+0x69e>
 18e:	2239 0001 b144 	move.l 1b144 <Copperlist1+0x3c>,d1
 194:	b2b9 0000 206c 	cmp.l 206c <ClsSprites+0x3c>,d1
 19a:	6600 0508      	bne.w 6a4 <main+0x69e>
 19e:	2039 0000 2000 	move.l 2000 <ClScreen>,d0
 1a4:	b0b9 0001 b148 	cmp.l 1b148 <Copperlist1+0x40>,d0
 1aa:	6600 051a      	bne.w 6c6 <main+0x6c0>
 1ae:	2239 0000 2004 	move.l 2004 <ClScreen+0x4>,d1
 1b4:	b2b9 0001 b14c 	cmp.l 1b14c <Copperlist1+0x44>,d1
 1ba:	6600 050a      	bne.w 6c6 <main+0x6c0>
 1be:	2039 0001 b150 	move.l 1b150 <Copperlist1+0x48>,d0
 1c4:	b0b9 0000 2008 	cmp.l 2008 <ClScreen+0x8>,d0
 1ca:	6600 04fa      	bne.w 6c6 <main+0x6c0>
 1ce:	2239 0001 b154 	move.l 1b154 <Copperlist1+0x4c>,d1
 1d4:	b2b9 0000 200c 	cmp.l 200c <ClScreen+0xc>,d1
 1da:	6600 04ea      	bne.w 6c6 <main+0x6c0>
 1de:	2039 0001 b158 	move.l 1b158 <Copperlist1+0x50>,d0
 1e4:	b0b9 0000 2010 	cmp.l 2010 <ClScreen+0x10>,d0
 1ea:	6600 04da      	bne.w 6c6 <main+0x6c0>
 1ee:	2239 0001 b15c 	move.l 1b15c <Copperlist1+0x54>,d1
 1f4:	b2b9 0000 2014 	cmp.l 2014 <ClScreen+0x14>,d1
 1fa:	6600 04ca      	bne.w 6c6 <main+0x6c0>
 1fe:	2039 0001 b160 	move.l 1b160 <Copperlist1+0x58>,d0
 204:	b0b9 0000 2018 	cmp.l 2018 <ClScreen+0x18>,d0
 20a:	6600 04ba      	bne.w 6c6 <main+0x6c0>
 20e:	2239 0001 b164 	move.l 1b164 <Copperlist1+0x5c>,d1
 214:	b2b9 0000 201c 	cmp.l 201c <ClScreen+0x1c>,d1
 21a:	6600 04aa      	bne.w 6c6 <main+0x6c0>
 21e:	2039 0001 b168 	move.l 1b168 <Copperlist1+0x60>,d0
 224:	b0b9 0000 2020 	cmp.l 2020 <ClScreen+0x20>,d0
 22a:	6600 049a      	bne.w 6c6 <main+0x6c0>
 22e:	2239 0001 b16c 	move.l 1b16c <Copperlist1+0x64>,d1
 234:	b2b9 0000 2024 	cmp.l 2024 <ClScreen+0x24>,d1
 23a:	6600 048a      	bne.w 6c6 <main+0x6c0>
 23e:	2039 0001 b170 	move.l 1b170 <Copperlist1+0x68>,d0
 244:	b0b9 0000 2028 	cmp.l 2028 <ClScreen+0x28>,d0
 24a:	6600 047a      	bne.w 6c6 <main+0x6c0>
 24e:	2239 0001 b174 	move.l 1b174 <Copperlist1+0x6c>,d1
 254:	b2b9 0000 202c 	cmp.l 202c <ClScreen+0x2c>,d1
 25a:	6600 046a      	bne.w 6c6 <main+0x6c0>
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
 272:	45f9 0000 08aa 	lea 8aa <SetBplPointers>,a2
 278:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
 27a:	0cb9 0005 0000 	cmpi.l #327680,1b084 <DrawBuffer>
 280:	0001 b084 
 284:	6700 04c0      	beq.w 746 <main+0x740>
    Write( Output(), 
 288:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 28e:	4eae ffc4      	jsr -60(a6)
 292:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 298:	2200           	move.l d0,d1
 29a:	243c 0000 0dee 	move.l #3566,d2
 2a0:	763b           	moveq #59,d3
 2a2:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 2a6:	0cb9 00e0 0004 	cmpi.l #14680068,1b178 <Copperlist1+0x70>
 2ac:	0001 b178 
 2b0:	671e           	beq.s 2d0 <main+0x2ca>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
 2b2:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 2b8:	4eae ffc4      	jsr -60(a6)
 2bc:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 2c2:	2200           	move.l d0,d1
 2c4:	243c 0000 0e2a 	move.l #3626,d2
 2ca:	763c           	moveq #60,d3
 2cc:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 2d0:	0cb9 00e2 0000 	cmpi.l #14811136,1b17c <Copperlist1+0x74>
 2d6:	0001 b17c 
 2da:	671e           	beq.s 2fa <main+0x2f4>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
 2dc:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 2e2:	4eae ffc4      	jsr -60(a6)
 2e6:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 2ec:	2200           	move.l d0,d1
 2ee:	243c 0000 0e67 	move.l #3687,d2
 2f4:	763c           	moveq #60,d3
 2f6:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 2fa:	70fe           	moveq #-2,d0
 2fc:	b0b9 0001 b180 	cmp.l 1b180 <Copperlist1+0x78>,d0
 302:	671e           	beq.s 322 <main+0x31c>
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if( TestCopperlistPos( Copperlist1, 30, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set\n", 31);
 304:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 30a:	4eae ffc4      	jsr -60(a6)
 30e:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 314:	2200           	move.l d0,d1
 316:	243c 0000 0ea4 	move.l #3748,d2
 31c:	761f           	moveq #31,d3
 31e:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = ViewBuffer;
  ViewBuffer = tmp;
}

void SwapCl() {
  ULONG tmp = DrawCopper;
 322:	2239 0001 b184 	move.l 1b184 <DrawCopper>,d1
  DrawCopper = ViewCopper;
 328:	2039 0001 b104 	move.l 1b104 <ViewCopper>,d0
 32e:	23c0 0001 b184 	move.l d0,1b184 <DrawCopper>
  ViewCopper = tmp;
 334:	23c1 0001 b104 	move.l d1,1b104 <ViewCopper>
  
  SwapCl();
  if( DrawCopper != &Copperlist2)
 33a:	0c80 0001 b088 	cmpi.l #110728,d0
 340:	671e           	beq.s 360 <main+0x35a>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
 342:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 348:	4eae ffc4      	jsr -60(a6)
 34c:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 352:	2200           	move.l d0,d1
 354:	243c 0000 0ec6 	move.l #3782,d2
 35a:	7615           	moveq #21,d3
 35c:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
 360:	47f9 0000 09d0 	lea 9d0 <PrepareDisplay>,a3
 366:	4e93           	jsr (a3)
  if( DrawBuffer != Bitplane1) 
 368:	0cb9 0000 e880 	cmpi.l #59520,1b084 <DrawBuffer>
 36e:	0001 b084 
 372:	671e           	beq.s 392 <main+0x38c>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
 374:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 37a:	4eae ffc4      	jsr -60(a6)
 37e:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 384:	2200           	move.l d0,d1
 386:	243c 0000 0edc 	move.l #3804,d2
 38c:	7637           	moveq #55,d3
 38e:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
 392:	0cb9 0001 b108 	cmpi.l #110856,1b184 <DrawCopper>
 398:	0001 b184 
 39c:	671e           	beq.s 3bc <main+0x3b6>
    Write( Output(), 
 39e:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 3a4:	4eae ffc4      	jsr -60(a6)
 3a8:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 3ae:	2200           	move.l d0,d1
 3b0:	243c 0000 0f14 	move.l #3860,d2
 3b6:	7639           	moveq #57,d3
 3b8:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
 3bc:	4e93           	jsr (a3)
  if( ViewBuffer != Bitplane2) 
 3be:	0cb9 0000 2080 	cmpi.l #8320,1b080 <ViewBuffer>
 3c4:	0001 b080 
 3c8:	671e           	beq.s 3e8 <main+0x3e2>
    Write( Output(), 
 3ca:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 3d0:	4eae ffc4      	jsr -60(a6)
 3d4:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 3da:	2200           	move.l d0,d1
 3dc:	243c 0000 0f4e 	move.l #3918,d2
 3e2:	7638           	moveq #56,d3
 3e4:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
 3e8:	0cb9 0001 b088 	cmpi.l #110728,1b104 <ViewCopper>
 3ee:	0001 b104 
 3f2:	671e           	beq.s 412 <main+0x40c>
    Write( Output(), 
 3f4:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 3fa:	4eae ffc4      	jsr -60(a6)
 3fe:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 404:	2200           	move.l d0,d1
 406:	243c 0000 0f87 	move.l #3975,d2
 40c:	763a           	moveq #58,d3
 40e:	4eae ffd0      	jsr -48(a6)
	}
	SetInterruptHandler((APTR)interruptHandler);
}

void RunFrame() {
  SetBplPointers();
 412:	4e92           	jsr (a2)
  ULONG tmp = DrawCopper;
 414:	2079 0001 b184 	movea.l 1b184 <DrawCopper>,a0
  DrawCopper = ViewCopper;
 41a:	23f9 0001 b104 	move.l 1b104 <ViewCopper>,1b184 <DrawCopper>
 420:	0001 b184 
  ViewCopper = tmp;
 424:	23c8 0001 b104 	move.l a0,1b104 <ViewCopper>
             "PrepareDisplay: ViewCopper should be set to Copperlist 2.\n", 58);

  RunFrame();
  UWORD *copword = ViewCopper;
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
 42a:	7000           	moveq #0,d0
 42c:	3028 0072      	move.w 114(a0),d0
 430:	4840           	swap d0
 432:	4240           	clr.w d0
 434:	7200           	moveq #0,d1
 436:	3228 0076      	move.w 118(a0),d1
 43a:	d081           	add.l d1,d0
  if( pointer != Bitplane1) 
 43c:	0c80 0000 e880 	cmpi.l #59520,d0
 442:	671e           	beq.s 462 <main+0x45c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
 444:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 44a:	4eae ffc4      	jsr -60(a6)
 44e:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 454:	2200           	move.l d0,d1
 456:	243c 0000 0fc2 	move.l #4034,d2
 45c:	7648           	moveq #72,d3
 45e:	4eae ffd0      	jsr -48(a6)
 462:	4e92           	jsr (a2)
  ULONG tmp = DrawCopper;
 464:	2079 0001 b184 	movea.l 1b184 <DrawCopper>,a0
  DrawCopper = ViewCopper;
 46a:	23f9 0001 b104 	move.l 1b104 <ViewCopper>,1b184 <DrawCopper>
 470:	0001 b184 
  ViewCopper = tmp;
 474:	23c8 0001 b104 	move.l a0,1b104 <ViewCopper>
                                                   " after first frame.\n", 72);
  
  RunFrame();
  
  copword = ViewCopper;
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
 47a:	7000           	moveq #0,d0
 47c:	3028 0072      	move.w 114(a0),d0
 480:	4840           	swap d0
 482:	4240           	clr.w d0
 484:	7200           	moveq #0,d1
 486:	3228 0076      	move.w 118(a0),d1
 48a:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
 48c:	0c80 0000 2080 	cmpi.l #8320,d0
 492:	671e           	beq.s 4b2 <main+0x4ac>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
 494:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 49a:	4eae ffc4      	jsr -60(a6)
 49e:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 4a4:	2200           	move.l d0,d1
 4a6:	243c 0000 100b 	move.l #4107,d2
 4ac:	7649           	moveq #73,d3
 4ae:	4eae ffd0      	jsr -48(a6)
  RunTests();
	Delay(50);
 4b2:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 4b8:	7232           	moveq #50,d1
 4ba:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
 4be:	247c 00f0 ff60 	movea.l #15794016,a2
 4c4:	4a92           	tst.l (a2)
 4c6:	6718           	beq.s 4e0 <main+0x4da>
 4c8:	4878 0001      	pea 1 <_start+0x1>
 4cc:	47f9 0000 07a0 	lea 7a0 <warpmode.part.0>,a3
 4d2:	4e93           	jsr (a3)
 4d4:	588f           	addq.l #4,sp
 4d6:	4a92           	tst.l (a2)
 4d8:	6706           	beq.s 4e0 <main+0x4da>
 4da:	42a7           	clr.l -(sp)
 4dc:	4e93           	jsr (a3)
 4de:	588f           	addq.l #4,sp
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
 4e0:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 4e6:	23ee 0022 0001 	move.l 34(a6),1b188 <ActiView>
 4ec:	b188 
	OwnBlitter();
 4ee:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
 4f2:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 4f8:	4eae ff1c      	jsr -228(a6)
	Disable();
 4fc:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 502:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
 506:	2479 0001 b1a2 	movea.l 1b1a2 <hw>,a2
 50c:	302a 0010      	move.w 16(a2),d0
 510:	33c0 0001 b18c 	move.w d0,1b18c <SystemADKCON>
	SystemInts=hw->intenar;
 516:	302a 001c      	move.w 28(a2),d0
 51a:	33c0 0001 b190 	move.w d0,1b190 <SystemInts>
	SystemDMA=hw->dmaconr;
 520:	302a 0002      	move.w 2(a2),d0
 524:	33c0 0001 b18e 	move.w d0,1b18e <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
 52a:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 530:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
 536:	47f9 0000 0a14 	lea a14 <WaitVbl>,a3
 53c:	4e93           	jsr (a3)
	WaitVbl();
 53e:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
 540:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	for(int a=0;a<32;a++)
 546:	7000           	moveq #0,d0
		hw->color[a]=0;
 548:	2200           	move.l d0,d1
 54a:	0681 0000 00c0 	addi.l #192,d1
 550:	d281           	add.l d1,d1
 552:	35bc 0000 1800 	move.w #0,(0,a2,d1.l)
	for(int a=0;a<32;a++)
 558:	5280           	addq.l #1,d0
 55a:	7220           	moveq #32,d1
 55c:	b280           	cmp.l d0,d1
 55e:	66e8           	bne.s 548 <main+0x542>

	LoadView(0);
 560:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 566:	93c9           	suba.l a1,a1
 568:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 56c:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 572:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 576:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 57c:	4eae fef2      	jsr -270(a6)

	WaitVbl();
 580:	4e93           	jsr (a3)
	WaitVbl();
 582:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
 584:	3f7c 4e7a 001a 	move.w #20090,26(sp)
 58a:	3f7c 0801 001c 	move.w #2049,28(sp)
 590:	3f7c 4e73 001e 	move.w #20083,30(sp)
	if (SysBase->AttnFlags & AFF_68010) 
 596:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 59c:	082e 0000 0129 	btst #0,297(a6)
 5a2:	6700 01d2      	beq.w 776 <main+0x770>
		vbr = (APTR)Supervisor((void*)getvbr);
 5a6:	7e1a           	moveq #26,d7
 5a8:	de8f           	add.l sp,d7
 5aa:	cf8d           	exg d7,a5
 5ac:	4eae ffe2      	jsr -30(a6)
 5b0:	cf8d           	exg d7,a5

	VBR=GetVBR();
 5b2:	23c0 0001 b192 	move.l d0,1b192 <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 5b8:	2079 0001 b192 	movea.l 1b192 <VBR.lto_priv.0>,a0
 5be:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 5c2:	23ca 0001 b196 	move.l a2,1b196 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
 5c8:	4e93           	jsr (a3)
}

void FreeSystem() { 
	WaitVbl();
 5ca:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 5cc:	2079 0001 b1a2 	movea.l 1b1a2 <hw>,a0
 5d2:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 5d6:	3028 0002      	move.w 2(a0),d0
 5da:	0800 000e      	btst #14,d0
 5de:	66f6           	bne.s 5d6 <main+0x5d0>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
 5e0:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 5e6:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
 5ec:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 5f2:	2279 0001 b192 	movea.l 1b192 <VBR.lto_priv.0>,a1
 5f8:	234a 006c      	move.l a2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
 5fc:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 602:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
 608:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
 60e:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
 614:	3039 0001 b190 	move.w 1b190 <SystemInts>,d0
 61a:	0040 8000      	ori.w #-32768,d0
 61e:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
 622:	3039 0001 b18e 	move.w 1b18e <SystemDMA>,d0
 628:	0040 8000      	ori.w #-32768,d0
 62c:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
 630:	3039 0001 b18c 	move.w 1b18c <SystemADKCON>,d0
 636:	0040 8000      	ori.w #-32768,d0
 63a:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
 63e:	2279 0001 b188 	movea.l 1b188 <ActiView>,a1
 644:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 648:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 64e:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 652:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 658:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
 65c:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 662:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
 666:	2c79 0001 b19e 	movea.l 1b19e <GfxBase>,a6
 66c:	4eae fe32      	jsr -462(a6)
	Enable();
 670:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 676:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
 67a:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 680:	2279 0001 b19a 	movea.l 1b19a <DOSBase>,a1
 686:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
 68a:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 690:	2279 0001 b19e 	movea.l 1b19e <GfxBase>,a1
 696:	4eae fe62      	jsr -414(a6)
}
 69a:	7000           	moveq #0,d0
 69c:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
 6a0:	508f           	addq.l #8,sp
 6a2:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
 6a4:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 6aa:	4eae ffc4      	jsr -60(a6)
 6ae:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 6b4:	2200           	move.l d0,d1
 6b6:	243c 0000 108c 	move.l #4236,d2
 6bc:	762c           	moveq #44,d3
 6be:	4eae ffd0      	jsr -48(a6)
 6c2:	6000 fada      	bra.w 19e <main+0x198>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
 6c6:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 6cc:	4eae ffc4      	jsr -60(a6)
 6d0:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 6d6:	2200           	move.l d0,d1
 6d8:	243c 0000 1055 	move.l #4181,d2
 6de:	7636           	moveq #54,d3
 6e0:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = 0x40000;
 6e4:	23fc 0004 0000 	move.l #262144,1b084 <DrawBuffer>
 6ea:	0001 b084 
  ViewBuffer = 0x50000;
 6ee:	23fc 0005 0000 	move.l #327680,1b080 <ViewBuffer>
 6f4:	0001 b080 
  SetBplPointers();
 6f8:	45f9 0000 08aa 	lea 8aa <SetBplPointers>,a2
 6fe:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
 700:	0cb9 0005 0000 	cmpi.l #327680,1b084 <DrawBuffer>
 706:	0001 b084 
 70a:	6600 fb7c      	bne.w 288 <main+0x282>
 70e:	6036           	bra.s 746 <main+0x740>
		Exit(0);
 710:	9dce           	suba.l a6,a6
 712:	7200           	moveq #0,d1
 714:	4eae ff70      	jsr -144(a6)
 718:	6000 f938      	bra.w 52 <main+0x4c>
		Exit(0);
 71c:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 722:	7200           	moveq #0,d1
 724:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
 728:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 72e:	43f9 0000 0db6 	lea db6 <incbin_colors_end+0x5a>,a1
 734:	7000           	moveq #0,d0
 736:	4eae fdd8      	jsr -552(a6)
 73a:	23c0 0001 b19a 	move.l d0,1b19a <DOSBase>
	if (!DOSBase)
 740:	6600 f910      	bne.w 52 <main+0x4c>
 744:	60ca           	bra.s 710 <main+0x70a>
 746:	0cb9 0004 0000 	cmpi.l #262144,1b080 <ViewBuffer>
 74c:	0001 b080 
 750:	6700 fb54      	beq.w 2a6 <main+0x2a0>
    Write( Output(), 
 754:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 75a:	4eae ffc4      	jsr -60(a6)
 75e:	2c79 0001 b19a 	movea.l 1b19a <DOSBase>,a6
 764:	2200           	move.l d0,d1
 766:	243c 0000 0dee 	move.l #3566,d2
 76c:	763b           	moveq #59,d3
 76e:	4eae ffd0      	jsr -48(a6)
 772:	6000 fb32      	bra.w 2a6 <main+0x2a0>
	APTR vbr = 0;
 776:	7000           	moveq #0,d0
	VBR=GetVBR();
 778:	23c0 0001 b192 	move.l d0,1b192 <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 77e:	2079 0001 b192 	movea.l 1b192 <VBR.lto_priv.0>,a0
 784:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 788:	23ca 0001 b196 	move.l a2,1b196 <SystemIrq>
	WaitVbl();
 78e:	4e93           	jsr (a3)
	WaitVbl();
 790:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 792:	2079 0001 b1a2 	movea.l 1b1a2 <hw>,a0
 798:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 79c:	6000 fe38      	bra.w 5d6 <main+0x5d0>

000007a0 <warpmode.part.0>:
void warpmode(int on) 
 7a0:	598f           	subq.l #4,sp
 7a2:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 7a4:	4aaf 000c      	tst.l 12(sp)
 7a8:	674c           	beq.s 7f6 <warpmode.part.0+0x56>
 7aa:	4878 0001      	pea 1 <_start+0x1>
 7ae:	740b           	moveq #11,d2
 7b0:	d48f           	add.l sp,d2
 7b2:	2f02           	move.l d2,-(sp)
 7b4:	42a7           	clr.l -(sp)
 7b6:	4879 0000 0d90 	pea d90 <incbin_colors_end+0x34>
 7bc:	4878 ffff      	pea ffffffff <_end+0xfffe4e53>
 7c0:	4878 0052      	pea 52 <main+0x4c>
 7c4:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef4db4>
 7ca:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 7ce:	203c 0000 0d76 	move.l #3446,d0
 7d4:	4878 0001      	pea 1 <_start+0x1>
 7d8:	2f02           	move.l d2,-(sp)
 7da:	42a7           	clr.l -(sp)
 7dc:	2f00           	move.l d0,-(sp)
 7de:	4878 ffff      	pea ffffffff <_end+0xfffe4e53>
 7e2:	4878 0052      	pea 52 <main+0x4c>
 7e6:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef4db4>
	}
}
 7ec:	4fef 0018      	lea 24(sp),sp
 7f0:	241f           	move.l (sp)+,d2
 7f2:	588f           	addq.l #4,sp
 7f4:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 7f6:	4878 0001      	pea 1 <_start+0x1>
 7fa:	740b           	moveq #11,d2
 7fc:	d48f           	add.l sp,d2
 7fe:	2f02           	move.l d2,-(sp)
 800:	42a7           	clr.l -(sp)
 802:	4879 0000 0d9a 	pea d9a <incbin_colors_end+0x3e>
 808:	4878 ffff      	pea ffffffff <_end+0xfffe4e53>
 80c:	4878 0052      	pea 52 <main+0x4c>
 810:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef4db4>
 816:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 81a:	203c 0000 0d5d 	move.l #3421,d0
 820:	4878 0001      	pea 1 <_start+0x1>
 824:	2f02           	move.l d2,-(sp)
 826:	42a7           	clr.l -(sp)
 828:	2f00           	move.l d0,-(sp)
 82a:	4878 ffff      	pea ffffffff <_end+0xfffe4e53>
 82e:	4878 0052      	pea 52 <main+0x4c>
 832:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef4db4>
}
 838:	4fef 0018      	lea 24(sp),sp
 83c:	241f           	move.l (sp)+,d2
 83e:	588f           	addq.l #4,sp
 840:	4e75           	rts

00000842 <KPrintF>:
{
 842:	4fef ff80      	lea -128(sp),sp
 846:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
 84a:	4ab9 00f0 ff60 	tst.l f0ff60 <_end+0xef4db4>
 850:	6734           	beq.s 886 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
 852:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 858:	206f 0090      	movea.l 144(sp),a0
 85c:	43ef 0094      	lea 148(sp),a1
 860:	45f9 0000 0cd8 	lea cd8 <PutChar>,a2
 866:	47ef 000c      	lea 12(sp),a3
 86a:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
 86e:	2f0b           	move.l a3,-(sp)
 870:	4878 0056      	pea 56 <main+0x50>
 874:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef4db4>
 87a:	508f           	addq.l #8,sp
}
 87c:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 880:	4fef 0080      	lea 128(sp),sp
 884:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
 886:	2c79 0001 b1a6 	movea.l 1b1a6 <SysBase>,a6
 88c:	206f 0090      	movea.l 144(sp),a0
 890:	43ef 0094      	lea 148(sp),a1
 894:	45f9 0000 0cca 	lea cca <KPutCharX>,a2
 89a:	97cb           	suba.l a3,a3
 89c:	4eae fdf6      	jsr -522(a6)
}
 8a0:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 8a4:	4fef 0080      	lea 128(sp),sp
 8a8:	4e75           	rts

000008aa <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
 8aa:	2039 0001 b084 	move.l 1b084 <DrawBuffer>,d0
  UWORD *copword = DrawCopper;
 8b0:	2079 0001 b184 	movea.l 1b184 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
 8b6:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
 8ba:	2200           	move.l d0,d1
 8bc:	4241           	clr.w d1
 8be:	4841           	swap d1
 8c0:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
 8c4:	23f9 0001 b080 	move.l 1b080 <ViewBuffer>,1b084 <DrawBuffer>
 8ca:	0001 b084 
  ViewBuffer = tmp;
 8ce:	23c0 0001 b080 	move.l d0,1b080 <ViewBuffer>
}
 8d4:	4e75           	rts

000008d6 <ClBuild>:
void ClBuild(  ULONG *cl) {
 8d6:	206f 0004      	movea.l 4(sp),a0
    *cl++ = *clpartinstruction++;
 8da:	20b9 0000 2030 	move.l 2030 <ClsSprites>,(a0)
 8e0:	2179 0000 2034 	move.l 2034 <ClsSprites+0x4>,4(a0)
 8e6:	0004 
 8e8:	2179 0000 2038 	move.l 2038 <ClsSprites+0x8>,8(a0)
 8ee:	0008 
 8f0:	2179 0000 203c 	move.l 203c <ClsSprites+0xc>,12(a0)
 8f6:	000c 
 8f8:	2179 0000 2040 	move.l 2040 <ClsSprites+0x10>,16(a0)
 8fe:	0010 
 900:	2179 0000 2044 	move.l 2044 <ClsSprites+0x14>,20(a0)
 906:	0014 
 908:	2179 0000 2048 	move.l 2048 <ClsSprites+0x18>,24(a0)
 90e:	0018 
 910:	2179 0000 204c 	move.l 204c <ClsSprites+0x1c>,28(a0)
 916:	001c 
 918:	2179 0000 2050 	move.l 2050 <ClsSprites+0x20>,32(a0)
 91e:	0020 
 920:	2179 0000 2054 	move.l 2054 <ClsSprites+0x24>,36(a0)
 926:	0024 
 928:	2179 0000 2058 	move.l 2058 <ClsSprites+0x28>,40(a0)
 92e:	0028 
 930:	2179 0000 205c 	move.l 205c <ClsSprites+0x2c>,44(a0)
 936:	002c 
 938:	2179 0000 2060 	move.l 2060 <ClsSprites+0x30>,48(a0)
 93e:	0030 
 940:	2179 0000 2064 	move.l 2064 <ClsSprites+0x34>,52(a0)
 946:	0034 
 948:	2179 0000 2068 	move.l 2068 <ClsSprites+0x38>,56(a0)
 94e:	0038 
 950:	2179 0000 206c 	move.l 206c <ClsSprites+0x3c>,60(a0)
 956:	003c 
    *cl++ = *clpartinstruction++;
 958:	2179 0000 2000 	move.l 2000 <ClScreen>,64(a0)
 95e:	0040 
 960:	2179 0000 2004 	move.l 2004 <ClScreen+0x4>,68(a0)
 966:	0044 
 968:	2179 0000 2008 	move.l 2008 <ClScreen+0x8>,72(a0)
 96e:	0048 
 970:	2179 0000 200c 	move.l 200c <ClScreen+0xc>,76(a0)
 976:	004c 
 978:	2179 0000 2010 	move.l 2010 <ClScreen+0x10>,80(a0)
 97e:	0050 
 980:	2179 0000 2014 	move.l 2014 <ClScreen+0x14>,84(a0)
 986:	0054 
 988:	2179 0000 2018 	move.l 2018 <ClScreen+0x18>,88(a0)
 98e:	0058 
 990:	2179 0000 201c 	move.l 201c <ClScreen+0x1c>,92(a0)
 996:	005c 
 998:	2179 0000 2020 	move.l 2020 <ClScreen+0x20>,96(a0)
 99e:	0060 
 9a0:	2179 0000 2024 	move.l 2024 <ClScreen+0x24>,100(a0)
 9a6:	0064 
 9a8:	2179 0000 2028 	move.l 2028 <ClScreen+0x28>,104(a0)
 9ae:	0068 
 9b0:	2179 0000 202c 	move.l 202c <ClScreen+0x2c>,108(a0)
 9b6:	006c 
  *cl++ = 0x00e00000;
 9b8:	217c 00e0 0000 	move.l #14680064,112(a0)
 9be:	0070 
  *cl++ = 0x00e20000;
 9c0:	217c 00e2 0000 	move.l #14811136,116(a0)
 9c6:	0074 
  *cl = 0xfffffffe;
 9c8:	70fe           	moveq #-2,d0
 9ca:	2140 0078      	move.l d0,120(a0)
}
 9ce:	4e75           	rts

000009d0 <PrepareDisplay>:
void PrepareDisplay() {
 9d0:	2f0a           	move.l a2,-(sp)
  ClBuild( Copperlist1);
 9d2:	4879 0001 b108 	pea 1b108 <Copperlist1>
 9d8:	45fa fefc      	lea 8d6 <ClBuild>(pc),a2
 9dc:	4e92           	jsr (a2)
  ClBuild( Copperlist2);
 9de:	4879 0001 b088 	pea 1b088 <Copperlist2>
 9e4:	4e92           	jsr (a2)
  DrawBuffer = Bitplane1;
 9e6:	23fc 0000 e880 	move.l #59520,1b084 <DrawBuffer>
 9ec:	0001 b084 
  DrawCopper = Copperlist1;
 9f0:	23fc 0001 b108 	move.l #110856,1b184 <DrawCopper>
 9f6:	0001 b184 
  ViewBuffer = Bitplane2;
 9fa:	23fc 0000 2080 	move.l #8320,1b080 <ViewBuffer>
 a00:	0001 b080 
  ViewCopper = Copperlist2;
 a04:	23fc 0001 b088 	move.l #110728,1b104 <ViewCopper>
 a0a:	0001 b104 
 a0e:	508f           	addq.l #8,sp
}
 a10:	245f           	movea.l (sp)+,a2
 a12:	4e75           	rts

00000a14 <WaitVbl>:
void WaitVbl() {
 a14:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 a16:	2039 00df f004 	move.l dff004 <_end+0xde3e58>,d0
 a1c:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
 a1e:	2017           	move.l (sp),d0
 a20:	0280 0001 ff00 	andi.l #130816,d0
 a26:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
 a28:	2017           	move.l (sp),d0
 a2a:	0c80 0001 3700 	cmpi.l #79616,d0
 a30:	67e4           	beq.s a16 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 a32:	2039 00df f004 	move.l dff004 <_end+0xde3e58>,d0
 a38:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
 a3c:	202f 0004      	move.l 4(sp),d0
 a40:	0280 0001 ff00 	andi.l #130816,d0
 a46:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
 a4a:	202f 0004      	move.l 4(sp),d0
 a4e:	0c80 0001 3700 	cmpi.l #79616,d0
 a54:	66dc           	bne.s a32 <WaitVbl+0x1e>
}
 a56:	508f           	addq.l #8,sp
 a58:	4e75           	rts

00000a5a <memcpy>:
{
 a5a:	48e7 3820      	movem.l d2-d4/a2,-(sp)
 a5e:	202f 0014      	move.l 20(sp),d0
 a62:	226f 0018      	movea.l 24(sp),a1
 a66:	222f 001c      	move.l 28(sp),d1
	while(len--)
 a6a:	2601           	move.l d1,d3
 a6c:	5383           	subq.l #1,d3
 a6e:	4a81           	tst.l d1
 a70:	6762           	beq.s ad4 <memcpy+0x7a>
 a72:	2040           	movea.l d0,a0
 a74:	5888           	addq.l #4,a0
 a76:	b1c9           	cmpa.l a1,a0
 a78:	53c2           	sl.s d2
 a7a:	4402           	neg.b d2
 a7c:	41e9 0004      	lea 4(a1),a0
 a80:	b1c0           	cmpa.l d0,a0
 a82:	53c4           	sl.s d4
 a84:	4404           	neg.b d4
 a86:	8404           	or.b d4,d2
 a88:	7808           	moveq #8,d4
 a8a:	b883           	cmp.l d3,d4
 a8c:	55c4           	sc.s d4
 a8e:	4404           	neg.b d4
 a90:	c404           	and.b d4,d2
 a92:	6746           	beq.s ada <memcpy+0x80>
 a94:	2409           	move.l a1,d2
 a96:	8480           	or.l d0,d2
 a98:	7803           	moveq #3,d4
 a9a:	c484           	and.l d4,d2
 a9c:	663c           	bne.s ada <memcpy+0x80>
 a9e:	2049           	movea.l a1,a0
 aa0:	2440           	movea.l d0,a2
 aa2:	74fc           	moveq #-4,d2
 aa4:	c481           	and.l d1,d2
 aa6:	d489           	add.l a1,d2
		*d++ = *s++;
 aa8:	24d8           	move.l (a0)+,(a2)+
 aaa:	b488           	cmp.l a0,d2
 aac:	66fa           	bne.s aa8 <memcpy+0x4e>
 aae:	74fc           	moveq #-4,d2
 ab0:	c481           	and.l d1,d2
 ab2:	2040           	movea.l d0,a0
 ab4:	d1c2           	adda.l d2,a0
 ab6:	d3c2           	adda.l d2,a1
 ab8:	9682           	sub.l d2,d3
 aba:	b481           	cmp.l d1,d2
 abc:	6716           	beq.s ad4 <memcpy+0x7a>
 abe:	1091           	move.b (a1),(a0)
	while(len--)
 ac0:	4a83           	tst.l d3
 ac2:	6710           	beq.s ad4 <memcpy+0x7a>
		*d++ = *s++;
 ac4:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
 aca:	5383           	subq.l #1,d3
 acc:	6706           	beq.s ad4 <memcpy+0x7a>
		*d++ = *s++;
 ace:	1169 0002 0002 	move.b 2(a1),2(a0)
}
 ad4:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
 ad8:	4e75           	rts
 ada:	2040           	movea.l d0,a0
 adc:	d289           	add.l a1,d1
		*d++ = *s++;
 ade:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 ae0:	b289           	cmp.l a1,d1
 ae2:	67f0           	beq.s ad4 <memcpy+0x7a>
		*d++ = *s++;
 ae4:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 ae6:	b289           	cmp.l a1,d1
 ae8:	66f4           	bne.s ade <memcpy+0x84>
 aea:	60e8           	bra.s ad4 <memcpy+0x7a>

00000aec <memset>:
{
 aec:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
 af0:	202f 0024      	move.l 36(sp),d0
 af4:	2a2f 0028      	move.l 40(sp),d5
 af8:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
 afc:	2809           	move.l a1,d4
 afe:	5384           	subq.l #1,d4
 b00:	b2fc 0000      	cmpa.w #0,a1
 b04:	6f00 00b0      	ble.w bb6 <memset+0xca>
 b08:	1e05           	move.b d5,d7
 b0a:	2200           	move.l d0,d1
 b0c:	4481           	neg.l d1
 b0e:	7403           	moveq #3,d2
 b10:	c282           	and.l d2,d1
 b12:	7c05           	moveq #5,d6
		*ptr++ = val;
 b14:	2440           	movea.l d0,a2
 b16:	bc84           	cmp.l d4,d6
 b18:	646a           	bcc.s b84 <memset+0x98>
 b1a:	4a81           	tst.l d1
 b1c:	6724           	beq.s b42 <memset+0x56>
 b1e:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
 b20:	5384           	subq.l #1,d4
 b22:	7401           	moveq #1,d2
 b24:	b481           	cmp.l d1,d2
 b26:	671a           	beq.s b42 <memset+0x56>
		*ptr++ = val;
 b28:	2440           	movea.l d0,a2
 b2a:	548a           	addq.l #2,a2
 b2c:	2040           	movea.l d0,a0
 b2e:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
 b32:	5384           	subq.l #1,d4
 b34:	7403           	moveq #3,d2
 b36:	b481           	cmp.l d1,d2
 b38:	6608           	bne.s b42 <memset+0x56>
		*ptr++ = val;
 b3a:	528a           	addq.l #1,a2
 b3c:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
 b40:	5384           	subq.l #1,d4
 b42:	2609           	move.l a1,d3
 b44:	9681           	sub.l d1,d3
 b46:	7c00           	moveq #0,d6
 b48:	1c05           	move.b d5,d6
 b4a:	2406           	move.l d6,d2
 b4c:	4842           	swap d2
 b4e:	4242           	clr.w d2
 b50:	2042           	movea.l d2,a0
 b52:	2406           	move.l d6,d2
 b54:	e14a           	lsl.w #8,d2
 b56:	4842           	swap d2
 b58:	4242           	clr.w d2
 b5a:	e18e           	lsl.l #8,d6
 b5c:	2646           	movea.l d6,a3
 b5e:	2c08           	move.l a0,d6
 b60:	8486           	or.l d6,d2
 b62:	2c0b           	move.l a3,d6
 b64:	8486           	or.l d6,d2
 b66:	1407           	move.b d7,d2
 b68:	2040           	movea.l d0,a0
 b6a:	d1c1           	adda.l d1,a0
 b6c:	72fc           	moveq #-4,d1
 b6e:	c283           	and.l d3,d1
 b70:	d288           	add.l a0,d1
		*ptr++ = val;
 b72:	20c2           	move.l d2,(a0)+
 b74:	b1c1           	cmpa.l d1,a0
 b76:	66fa           	bne.s b72 <memset+0x86>
 b78:	72fc           	moveq #-4,d1
 b7a:	c283           	and.l d3,d1
 b7c:	d5c1           	adda.l d1,a2
 b7e:	9881           	sub.l d1,d4
 b80:	b283           	cmp.l d3,d1
 b82:	6732           	beq.s bb6 <memset+0xca>
 b84:	1485           	move.b d5,(a2)
	while(len-- > 0)
 b86:	4a84           	tst.l d4
 b88:	6f2c           	ble.s bb6 <memset+0xca>
		*ptr++ = val;
 b8a:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
 b8e:	7201           	moveq #1,d1
 b90:	b284           	cmp.l d4,d1
 b92:	6c22           	bge.s bb6 <memset+0xca>
		*ptr++ = val;
 b94:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
 b98:	7402           	moveq #2,d2
 b9a:	b484           	cmp.l d4,d2
 b9c:	6c18           	bge.s bb6 <memset+0xca>
		*ptr++ = val;
 b9e:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
 ba2:	7c03           	moveq #3,d6
 ba4:	bc84           	cmp.l d4,d6
 ba6:	6c0e           	bge.s bb6 <memset+0xca>
		*ptr++ = val;
 ba8:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
 bac:	7204           	moveq #4,d1
 bae:	b284           	cmp.l d4,d1
 bb0:	6c04           	bge.s bb6 <memset+0xca>
		*ptr++ = val;
 bb2:	1545 0005      	move.b d5,5(a2)
}
 bb6:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
 bba:	4e75           	rts

00000bbc <strlen>:
{
 bbc:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
 bc0:	7000           	moveq #0,d0
	while(*s++)
 bc2:	4a10           	tst.b (a0)
 bc4:	6708           	beq.s bce <strlen+0x12>
		t++;
 bc6:	5280           	addq.l #1,d0
	while(*s++)
 bc8:	4a30 0800      	tst.b (0,a0,d0.l)
 bcc:	66f8           	bne.s bc6 <strlen+0xa>
}
 bce:	4e75           	rts

00000bd0 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
 bd0:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
 bd4:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
 bd8:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
 bdc:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
 be0:	d041           	add.w d1,d0
	swap	d0
 be2:	4840           	swap d0
	clrw	d0
 be4:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
 be6:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
 bea:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
 bee:	d081           	add.l d1,d0

	rts
 bf0:	4e75           	rts

00000bf2 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
 bf2:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
 bf4:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
 bf8:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
 bfc:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
 c02:	6416           	bcc.s c1a <__udivsi3+0x28>
	movel	d0, d2
 c04:	2400           	move.l d0,d2
	clrw	d2
 c06:	4242           	clr.w d2
	swap	d2
 c08:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
 c0a:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
 c0c:	3002           	move.w d2,d0
	swap	d0
 c0e:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
 c10:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
 c14:	84c1           	divu.w d1,d2
	movew	d2, d0
 c16:	3002           	move.w d2,d0
	jra	6f
 c18:	6030           	bra.s c4a <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
 c1a:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
 c1c:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
 c1e:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
 c20:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
 c26:	64f4           	bcc.s c1c <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
 c28:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
 c2a:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
 c30:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
 c32:	c2c0           	mulu.w d0,d1
	swap	d2
 c34:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
 c36:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
 c38:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
 c3a:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
 c3c:	660a           	bne.s c48 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
 c3e:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
 c40:	6506           	bcs.s c48 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
 c42:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
 c46:	6302           	bls.s c4a <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
 c48:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
 c4a:	241f           	move.l (sp)+,d2
	rts
 c4c:	4e75           	rts

00000c4e <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
 c4e:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
 c50:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
 c52:	222f 000c      	move.l 12(sp),d1
	jpl	1f
 c56:	6a04           	bpl.s c5c <__divsi3+0xe>
	negl	d1
 c58:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
 c5a:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
 c5c:	202f 0008      	move.l 8(sp),d0
	jpl	2f
 c60:	6a04           	bpl.s c66 <__divsi3+0x18>
	negl	d0
 c62:	4480           	neg.l d0
	negb	d2
 c64:	4402           	neg.b d2

2:	movel	d1, sp@-
 c66:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 c68:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
 c6a:	6186           	bsr.s bf2 <__udivsi3>
	addql	IMM (8), sp
 c6c:	508f           	addq.l #8,sp

	tstb	d2
 c6e:	4a02           	tst.b d2
	jpl	3f
 c70:	6a02           	bpl.s c74 <__divsi3+0x26>
	negl	d0
 c72:	4480           	neg.l d0

3:	movel	sp@+, d2
 c74:	241f           	move.l (sp)+,d2
	rts
 c76:	4e75           	rts

00000c78 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 c78:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 c7c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 c80:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 c82:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
 c84:	61c8           	bsr.s c4e <__divsi3>
	addql	IMM (8), sp
 c86:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 c88:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 c8c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 c8e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 c90:	6100 ff3e      	bsr.w bd0 <__mulsi3>
	addql	IMM (8), sp
 c94:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 c96:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 c9a:	9280           	sub.l d0,d1
	movel	d1, d0
 c9c:	2001           	move.l d1,d0
	rts
 c9e:	4e75           	rts

00000ca0 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 ca0:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 ca4:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 ca8:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 caa:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
 cac:	6100 ff44      	bsr.w bf2 <__udivsi3>
	addql	IMM (8), sp
 cb0:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 cb2:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 cb6:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 cb8:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 cba:	6100 ff14      	bsr.w bd0 <__mulsi3>
	addql	IMM (8), sp
 cbe:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 cc0:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 cc4:	9280           	sub.l d0,d1
	movel	d1, d0
 cc6:	2001           	move.l d1,d0
	rts
 cc8:	4e75           	rts

00000cca <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
 cca:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
 ccc:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
 cd0:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
 cd4:	2c5f           	movea.l (sp)+,a6
    rts
 cd6:	4e75           	rts

00000cd8 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
 cd8:	16c0           	move.b d0,(a3)+
	rts
 cda:	4e75           	rts
