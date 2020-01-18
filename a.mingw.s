
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
       6:	4e55 ffb4      	link.w a5,#-76
       a:	48e7 313a      	movem.l d2-d3/d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 45ce 	move.l a6,45ce <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,45aa <hw>
      1e:	0000 45aa 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 20db 	lea 20db <incbin_swfont_end+0xbd>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 45a6 	move.l d0,45a6 <GfxBase>
	if (!GfxBase)
      34:	6700 0a1a      	beq.w a50 <main+0xa4a>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
      3e:	43f9 0000 20ec 	lea 20ec <incbin_swfont_end+0xce>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 45be 	move.l d0,45be <DOSBase>
	if (!DOSBase)
      50:	6700 09f2      	beq.w a44 <main+0xa3e>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 20f8 	pea 20f8 <incbin_swfont_end+0xda>
      5a:	4eb9 0000 0d00 	jsr d00 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 2114 	move.l #8468,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 45aa 	movea.l 45aa <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 2124 	move.l #8484,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 0f3e 	lea f3e <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 45d2 	move.l d0,45d2 <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 45b6 	move.l d0,45b6 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 45ca 	move.l d0,45ca <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 45ae 	move.l d0,45ae <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 4534 	cmp.l 4534 <ClsSprites>,d0
      d2:	6600 0902      	bne.w 9d6 <main+0x9d0>
      d6:	202a 0004      	move.l 4(a2),d0
      da:	b0b9 0000 4538 	cmp.l 4538 <ClsSprites+0x4>,d0
      e0:	6600 08f4      	bne.w 9d6 <main+0x9d0>
      e4:	202a 0008      	move.l 8(a2),d0
      e8:	b0b9 0000 453c 	cmp.l 453c <ClsSprites+0x8>,d0
      ee:	6600 08e6      	bne.w 9d6 <main+0x9d0>
      f2:	202a 000c      	move.l 12(a2),d0
      f6:	b0b9 0000 4540 	cmp.l 4540 <ClsSprites+0xc>,d0
      fc:	6600 08d8      	bne.w 9d6 <main+0x9d0>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 4544 	cmp.l 4544 <ClsSprites+0x10>,d0
     10a:	6600 08ca      	bne.w 9d6 <main+0x9d0>
     10e:	202a 0014      	move.l 20(a2),d0
     112:	b0b9 0000 4548 	cmp.l 4548 <ClsSprites+0x14>,d0
     118:	6600 08bc      	bne.w 9d6 <main+0x9d0>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 454c 	cmp.l 454c <ClsSprites+0x18>,d0
     126:	6600 08ae      	bne.w 9d6 <main+0x9d0>
     12a:	202a 001c      	move.l 28(a2),d0
     12e:	b0b9 0000 4550 	cmp.l 4550 <ClsSprites+0x1c>,d0
     134:	6600 08a0      	bne.w 9d6 <main+0x9d0>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 4554 	cmp.l 4554 <ClsSprites+0x20>,d0
     142:	6600 0892      	bne.w 9d6 <main+0x9d0>
     146:	202a 0024      	move.l 36(a2),d0
     14a:	b0b9 0000 4558 	cmp.l 4558 <ClsSprites+0x24>,d0
     150:	6600 0884      	bne.w 9d6 <main+0x9d0>
     154:	202a 0028      	move.l 40(a2),d0
     158:	b0b9 0000 455c 	cmp.l 455c <ClsSprites+0x28>,d0
     15e:	6600 0876      	bne.w 9d6 <main+0x9d0>
     162:	202a 002c      	move.l 44(a2),d0
     166:	b0b9 0000 4560 	cmp.l 4560 <ClsSprites+0x2c>,d0
     16c:	6600 0868      	bne.w 9d6 <main+0x9d0>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 4564 	cmp.l 4564 <ClsSprites+0x30>,d0
     17a:	6600 085a      	bne.w 9d6 <main+0x9d0>
     17e:	202a 0034      	move.l 52(a2),d0
     182:	b0b9 0000 4568 	cmp.l 4568 <ClsSprites+0x34>,d0
     188:	6600 084c      	bne.w 9d6 <main+0x9d0>
     18c:	202a 0038      	move.l 56(a2),d0
     190:	b0b9 0000 456c 	cmp.l 456c <ClsSprites+0x38>,d0
     196:	6600 083e      	bne.w 9d6 <main+0x9d0>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 4570 	cmpa.l 4570 <ClsSprites+0x3c>,a2
     1a4:	6600 0830      	bne.w 9d6 <main+0x9d0>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 45d2 	movea.l 45d2 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 4504 	move.l 4504 <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 083e      	bne.w 9f8 <main+0x9f2>
     1bc:	2039 0000 4508 	move.l 4508 <ClScreen+0x4>,d0
     1c2:	b0a8 0044      	cmp.l 68(a0),d0
     1c6:	6600 0830      	bne.w 9f8 <main+0x9f2>
     1ca:	2039 0000 450c 	move.l 450c <ClScreen+0x8>,d0
     1d0:	b0a8 0048      	cmp.l 72(a0),d0
     1d4:	6600 0822      	bne.w 9f8 <main+0x9f2>
     1d8:	2039 0000 4510 	move.l 4510 <ClScreen+0xc>,d0
     1de:	b0a8 004c      	cmp.l 76(a0),d0
     1e2:	6600 0814      	bne.w 9f8 <main+0x9f2>
     1e6:	2039 0000 4514 	move.l 4514 <ClScreen+0x10>,d0
     1ec:	b0a8 0050      	cmp.l 80(a0),d0
     1f0:	6600 0806      	bne.w 9f8 <main+0x9f2>
     1f4:	2028 0054      	move.l 84(a0),d0
     1f8:	b0b9 0000 4518 	cmp.l 4518 <ClScreen+0x14>,d0
     1fe:	6600 07f8      	bne.w 9f8 <main+0x9f2>
     202:	2028 0058      	move.l 88(a0),d0
     206:	b0b9 0000 451c 	cmp.l 451c <ClScreen+0x18>,d0
     20c:	6600 07ea      	bne.w 9f8 <main+0x9f2>
     210:	2028 005c      	move.l 92(a0),d0
     214:	b0b9 0000 4520 	cmp.l 4520 <ClScreen+0x1c>,d0
     21a:	6600 07dc      	bne.w 9f8 <main+0x9f2>
     21e:	2028 0060      	move.l 96(a0),d0
     222:	b0b9 0000 4524 	cmp.l 4524 <ClScreen+0x20>,d0
     228:	6600 07ce      	bne.w 9f8 <main+0x9f2>
     22c:	2028 0064      	move.l 100(a0),d0
     230:	b0b9 0000 4528 	cmp.l 4528 <ClScreen+0x24>,d0
     236:	6600 07c0      	bne.w 9f8 <main+0x9f2>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 452c 	cmp.l 452c <ClScreen+0x28>,d0
     244:	6600 07b2      	bne.w 9f8 <main+0x9f2>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 4530 	cmpa.l 4530 <ClScreen+0x2c>,a0
     252:	6600 07a4      	bne.w 9f8 <main+0x9f2>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = 0x40000;
     256:	23fc 0004 0000 	move.l #262144,45ba <DrawBuffer>
     25c:	0000 45ba 
  ViewBuffer = 0x50000;
     260:	23fc 0005 0000 	move.l #327680,45b2 <ViewBuffer>
     266:	0000 45b2 
  SetBplPointers();
     26a:	45f9 0000 146c 	lea 146c <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,45ba <DrawBuffer>
     278:	0000 45ba 
     27c:	6700 08cc      	beq.w b4a <main+0xb44>
    Write( Output(), 
     280:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 2127 	move.l #8487,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  int test1 = instructions[pos];
     29e:	2079 0000 45d2 	movea.l 45d2 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 2163 	move.l #8547,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 45d2 	movea.l 45d2 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 21a0 	move.l #8608,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 45d2 	movea.l 45d2 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2028 0078      	move.l 120(a0),d0
     304:	b0b9 0000 44fc 	cmp.l 44fc <ClColor>,d0
     30a:	6600 086e      	bne.w b7a <main+0xb74>
     30e:	2039 0000 4500 	move.l 4500 <ClColor+0x4>,d0
     314:	b0a8 007c      	cmp.l 124(a0),d0
     318:	6600 0860      	bne.w b7a <main+0xb74>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 21ff 	move.l #8703,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 1446 	lea 1446 <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2039 0000 45b6 	move.l 45b6 <DrawCopper>,d0
     350:	b0b9 0000 45ca 	cmp.l 45ca <Copperlist2>,d0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 2222 	move.l #8738,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 1498 	lea 1498 <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 45ba 	move.l 45ba <DrawBuffer>,d0
     384:	b0b9 0000 45c6 	cmp.l 45c6 <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 2238 	move.l #8760,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2039 0000 45b6 	move.l 45b6 <DrawCopper>,d0
     3b0:	b0b9 0000 45d2 	cmp.l 45d2 <Copperlist1>,d0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 2270 	move.l #8816,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2039 0000 45b2 	move.l 45b2 <ViewBuffer>,d0
     3de:	b0b9 0000 45c2 	cmp.l 45c2 <Bitplane2>,d0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 22aa 	move.l #8874,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2039 0000 45ae 	move.l 45ae <ViewCopper>,d0
     40a:	b0b9 0000 45ca 	cmp.l 45ca <Copperlist2>,d0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 22e3 	move.l #8931,d2
     42a:	763a           	moveq #58,d3
     42c:	4eae ffd0      	jsr -48(a6)
	}
	SetInterruptHandler((APTR)interruptHandler);
}

void RunFrame() {
  SwapCl();
     430:	4e93           	jsr (a3)
  SetBplPointers();
     432:	4e92           	jsr (a2)
             "PrepareDisplay: ViewCopper should be set to Copperlist 2.\n", 58);

  RunFrame();
  UWORD *copword = ViewCopper;
     434:	2079 0000 45ae 	movea.l 45ae <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
     44c:	b0b9 0000 45c2 	cmp.l 45c2 <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 231e 	move.l #8990,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = ViewCopper;
     476:	2079 0000 45ae 	movea.l 45ae <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != Bitplane1) 
     48e:	b0b9 0000 45c6 	cmp.l 45c6 <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 2367 	move.l #9063,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = ViewCopper;
     4b8:	2079 0000 45ae 	movea.l 45ae <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
     4d0:	b0b9 0000 45c2 	cmp.l 45c2 <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 23b1 	move.l #9137,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	4878 0084      	pea 84 <main+0x7e>
     4fa:	49f9 0000 0bcc 	lea bcc <FreeDisplay.constprop.1>,a4
     500:	4e94           	jsr (a4)
  return retval;
}

 int PrepareDisplayZoom() {

  Copperlist1 = ClbuildZoom();
     502:	4df9 0000 119c 	lea 119c <ClbuildZoom>,a6
     508:	4e96           	jsr (a6)
     50a:	23c0 0000 45d2 	move.l d0,45d2 <Copperlist1>
  Copperlist2 = ClbuildZoom();
     510:	4e96           	jsr (a6)
     512:	23c0 0000 45ca 	move.l d0,45ca <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
     518:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     51e:	203c 0000 c800 	move.l #51200,d0
     524:	7202           	moveq #2,d1
     526:	4eae ff3a      	jsr -198(a6)
     52a:	23c0 0000 45c6 	move.l d0,45c6 <Bitplane1>
  if(Bitplane1 == 0) {
     530:	588f           	addq.l #4,sp
     532:	6700 05b6      	beq.w aea <main+0xae4>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    Exit(1);
  }
  DrawBuffer = Bitplane1;
     536:	23c0 0000 45ba 	move.l d0,45ba <DrawBuffer>
  DrawCopper = Copperlist1;
     53c:	23f9 0000 45d2 	move.l 45d2 <Copperlist1>,45b6 <DrawCopper>
     542:	0000 45b6 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
     546:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     54c:	203c 0000 c800 	move.l #51200,d0
     552:	7202           	moveq #2,d1
     554:	4eae ff3a      	jsr -198(a6)
     558:	23c0 0000 45c2 	move.l d0,45c2 <Bitplane2>
  if(Bitplane2 == 0) {
     55e:	6700 051a      	beq.w a7a <main+0xa74>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;
     562:	23c0 0000 45b2 	move.l d0,45b2 <ViewBuffer>
  ViewCopper = Copperlist2;
     568:	23f9 0000 45ca 	move.l 45ca <Copperlist2>,45ae <ViewCopper>
     56e:	0000 45ae 
  SwapCl();
     572:	4e93           	jsr (a3)
  SetBplPointers();
     574:	4e92           	jsr (a2)
  SwapCl();
     576:	4e93           	jsr (a3)
  SetBplPointers();
     578:	4e92           	jsr (a2)

void ZoomTest() {

  PrepareDisplayZoom();

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     57a:	4878 0010      	pea 10 <main+0xa>
     57e:	4879 0000 4534 	pea 4534 <ClsSprites>
     584:	42a7           	clr.l -(sp)
     586:	2f39 0000 45d2 	move.l 45d2 <Copperlist1>,-(sp)
     58c:	45f9 0000 0d68 	lea d68 <TestCopperlistBatch>,a2
     592:	4e92           	jsr (a2)
     594:	4fef 0010      	lea 16(sp),sp
     598:	4a80           	tst.l d0
     59a:	661e           	bne.s 5ba <main+0x5b4>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     59c:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     5a2:	4eae ffc4      	jsr -60(a6)
     5a6:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     5ac:	2200           	move.l d0,d1
     5ae:	243c 0000 23fa 	move.l #9210,d2
     5b4:	762c           	moveq #44,d3
     5b6:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     5ba:	4878 000c      	pea c <main+0x6>
     5be:	4879 0000 4504 	pea 4504 <ClScreen>
     5c4:	4878 0010      	pea 10 <main+0xa>
     5c8:	2f39 0000 45d2 	move.l 45d2 <Copperlist1>,-(sp)
     5ce:	4e92           	jsr (a2)
     5d0:	4fef 0010      	lea 16(sp),sp
     5d4:	4a80           	tst.l d0
     5d6:	661e           	bne.s 5f6 <main+0x5f0>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     5d8:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     5de:	4eae ffc4      	jsr -60(a6)
     5e2:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     5e8:	2200           	move.l d0,d1
     5ea:	243c 0000 2430 	move.l #9264,d2
     5f0:	7636           	moveq #54,d3
     5f2:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     5f6:	4878 0002      	pea 2 <_start+0x2>
     5fa:	4879 0000 44fc 	pea 44fc <ClColor>
     600:	4878 001e      	pea 1e <main+0x18>
     604:	2f39 0000 45d2 	move.l 45d2 <Copperlist1>,-(sp)
     60a:	4e92           	jsr (a2)
     60c:	4fef 0010      	lea 16(sp),sp
     610:	4a80           	tst.l d0
     612:	661e           	bne.s 632 <main+0x62c>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     614:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     61a:	4eae ffc4      	jsr -60(a6)
     61e:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     624:	2200           	move.l d0,d1
     626:	243c 0000 21dd 	move.l #8669,d2
     62c:	7621           	moveq #33,d3
     62e:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     632:	7ec0           	moveq #-64,d7
     634:	de8d           	add.l a5,d7
     636:	4878 0040      	pea 40 <main+0x3a>
     63a:	4879 0000 24ba 	pea 24ba <incbin_swfont_end+0x49c>
     640:	2f07           	move.l d7,-(sp)
     642:	4eb9 0000 161c 	jsr 161c <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 32, clpart1, 16) == 0)
     648:	4878 0010      	pea 10 <main+0xa>
     64c:	2f07           	move.l d7,-(sp)
     64e:	4878 0020      	pea 20 <main+0x1a>
     652:	2f39 0000 45d2 	move.l 45d2 <Copperlist1>,-(sp)
     658:	4e92           	jsr (a2)
     65a:	4fef 001c      	lea 28(sp),sp
     65e:	4a80           	tst.l d0
     660:	661e           	bne.s 680 <main+0x67a>
    Write( Output(), "Copperlist: Starwars part messed up.\n", 37);
     662:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     668:	4eae ffc4      	jsr -60(a6)
     66c:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     672:	2200           	move.l d0,d1
     674:	243c 0000 2467 	move.l #9319,d2
     67a:	7625           	moveq #37,d3
     67c:	4eae ffd0      	jsr -48(a6)

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     680:	2b7c 2d07 fffe 	move.l #755499006,-76(a5)
     686:	ffb4 
     688:	2b7c 0182 00f0 	move.l #25297136,-72(a5)
     68e:	ffb8 
     690:	2b7c 0182 0f00 	move.l #25300736,-68(a5)
     696:	ffbc 

  if( TestCopperlistBatch( Copperlist1, 73, clpart2, 3) == 0)
     698:	4878 0003      	pea 3 <_start+0x3>
     69c:	486d ffb4      	pea -76(a5)
     6a0:	4878 0049      	pea 49 <main+0x43>
     6a4:	2f39 0000 45d2 	move.l 45d2 <Copperlist1>,-(sp)
     6aa:	4e92           	jsr (a2)
     6ac:	4fef 0010      	lea 16(sp),sp
     6b0:	4a80           	tst.l d0
     6b2:	661e           	bne.s 6d2 <main+0x6cc>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     6b4:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     6ba:	4eae ffc4      	jsr -60(a6)
     6be:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     6c4:	2200           	move.l d0,d1
     6c6:	243c 0000 248d 	move.l #9357,d2
     6cc:	762c           	moveq #44,d3
     6ce:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10528, 0xfffffffe) == 0)
     6d2:	4878 2920      	pea 2920 <incbin_swfont_end+0x902>
     6d6:	2f39 0000 45d2 	move.l 45d2 <Copperlist1>,-(sp)
     6dc:	47f9 0000 0c42 	lea c42 <TestCopperlistPos.constprop.0>,a3
     6e2:	4e93           	jsr (a3)
     6e4:	508f           	addq.l #8,sp
     6e6:	4a80           	tst.l d0
     6e8:	661e           	bne.s 708 <main+0x702>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     6ea:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     6f0:	4eae ffc4      	jsr -60(a6)
     6f4:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     6fa:	2200           	move.l d0,d1
     6fc:	243c 0000 21ff 	move.l #8703,d2
     702:	7622           	moveq #34,d3
     704:	4eae ffd0      	jsr -48(a6)
 
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     708:	2f3c 0000 a484 	move.l #42116,-(sp)
     70e:	4e94           	jsr (a4)
#include "coppertests.h"
#include "utils.h"
#include "utilsasm.h"

void SwScrollerTest() {
    PrepareDisplaySW();
     710:	4eb9 0000 1498 	jsr 1498 <PrepareDisplay>

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     716:	4878 0010      	pea 10 <main+0xa>
     71a:	4879 0000 4534 	pea 4534 <ClsSprites>
     720:	42a7           	clr.l -(sp)
     722:	2f39 0000 45d2 	move.l 45d2 <Copperlist1>,-(sp)
     728:	4e92           	jsr (a2)
     72a:	4fef 0014      	lea 20(sp),sp
     72e:	4a80           	tst.l d0
     730:	661e           	bne.s 750 <main+0x74a>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     732:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     738:	4eae ffc4      	jsr -60(a6)
     73c:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     742:	2200           	move.l d0,d1
     744:	243c 0000 23fa 	move.l #9210,d2
     74a:	762c           	moveq #44,d3
     74c:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     750:	4878 000c      	pea c <main+0x6>
     754:	4879 0000 4504 	pea 4504 <ClScreen>
     75a:	4878 0010      	pea 10 <main+0xa>
     75e:	2f39 0000 45d2 	move.l 45d2 <Copperlist1>,-(sp)
     764:	4e92           	jsr (a2)
     766:	4fef 0010      	lea 16(sp),sp
     76a:	4a80           	tst.l d0
     76c:	661e           	bne.s 78c <main+0x786>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     76e:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     774:	4eae ffc4      	jsr -60(a6)
     778:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     77e:	2200           	move.l d0,d1
     780:	243c 0000 2430 	move.l #9264,d2
     786:	7636           	moveq #54,d3
     788:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     78c:	4878 0002      	pea 2 <_start+0x2>
     790:	4879 0000 44fc 	pea 44fc <ClColor>
     796:	4878 001e      	pea 1e <main+0x18>
     79a:	2f39 0000 45d2 	move.l 45d2 <Copperlist1>,-(sp)
     7a0:	4e92           	jsr (a2)
     7a2:	4fef 0010      	lea 16(sp),sp
     7a6:	4a80           	tst.l d0
     7a8:	661e           	bne.s 7c8 <main+0x7c2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     7aa:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     7b0:	4eae ffc4      	jsr -60(a6)
     7b4:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     7ba:	2200           	move.l d0,d1
     7bc:	243c 0000 21dd 	move.l #8669,d2
     7c2:	7621           	moveq #33,d3
     7c4:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     7c8:	4878 0020      	pea 20 <main+0x1a>
     7cc:	2f39 0000 45d2 	move.l 45d2 <Copperlist1>,-(sp)
     7d2:	4e93           	jsr (a3)
     7d4:	508f           	addq.l #8,sp
     7d6:	4a80           	tst.l d0
     7d8:	661e           	bne.s 7f8 <main+0x7f2>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     7da:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     7e0:	4eae ffc4      	jsr -60(a6)
     7e4:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     7ea:	2200           	move.l d0,d1
     7ec:	243c 0000 21ff 	move.l #8703,d2
     7f2:	7622           	moveq #34,d3
     7f4:	4eae ffd0      	jsr -48(a6)
 
  FreeDisplay( SWCPSIZE, SWBPLSIZE);
     7f8:	4878 0084      	pea 84 <main+0x7e>
     7fc:	4e94           	jsr (a4)
  RunTests();
	Delay(50);
     7fe:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     804:	7232           	moveq #50,d1
     806:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
     80a:	247c 00f0 ff60 	movea.l #15794016,a2
     810:	588f           	addq.l #4,sp
     812:	4a92           	tst.l (a2)
     814:	6718           	beq.s 82e <main+0x828>
     816:	4878 0001      	pea 1 <_start+0x1>
     81a:	47f9 0000 0c5e 	lea c5e <warpmode.part.0>,a3
     820:	4e93           	jsr (a3)
     822:	588f           	addq.l #4,sp
     824:	4a92           	tst.l (a2)
     826:	6706           	beq.s 82e <main+0x828>
     828:	42a7           	clr.l -(sp)
     82a:	4e93           	jsr (a3)
     82c:	588f           	addq.l #4,sp
  ViewCopper = tmp;
  hw->cop1lc = ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
     82e:	2c79 0000 45a6 	movea.l 45a6 <GfxBase>,a6
     834:	23ee 0022 0000 	move.l 34(a6),4594 <ActiView>
     83a:	4594 
	OwnBlitter();
     83c:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     840:	2c79 0000 45a6 	movea.l 45a6 <GfxBase>,a6
     846:	4eae ff1c      	jsr -228(a6)
	Disable();
     84a:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     850:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     854:	2679 0000 45aa 	movea.l 45aa <hw>,a3
     85a:	302b 0010      	move.w 16(a3),d0
     85e:	33c0 0000 4598 	move.w d0,4598 <SystemADKCON>
	SystemInts=hw->intenar;
     864:	302b 001c      	move.w 28(a3),d0
     868:	33c0 0000 459c 	move.w d0,459c <SystemInts>
	SystemDMA=hw->dmaconr;
     86e:	302b 0002      	move.w 2(a3),d0
     872:	33c0 0000 459a 	move.w d0,459a <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     878:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     87e:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     884:	45f9 0000 15d6 	lea 15d6 <WaitVbl>,a2
     88a:	4e92           	jsr (a2)
	WaitVbl();
     88c:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     88e:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     894:	2c79 0000 45a6 	movea.l 45a6 <GfxBase>,a6
     89a:	93c9           	suba.l a1,a1
     89c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     8a0:	2c79 0000 45a6 	movea.l 45a6 <GfxBase>,a6
     8a6:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     8aa:	2c79 0000 45a6 	movea.l 45a6 <GfxBase>,a6
     8b0:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     8b4:	4e92           	jsr (a2)
	WaitVbl();
     8b6:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     8b8:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
     8be:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
     8c4:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
     8ca:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     8d0:	082e 0000 0129 	btst #0,297(a6)
     8d6:	6700 02ca      	beq.w ba2 <main+0xb9c>
		vbr = (APTR)Supervisor((void*)getvbr);
     8da:	cf8d           	exg d7,a5
     8dc:	4eae ffe2      	jsr -30(a6)
     8e0:	cf8d           	exg d7,a5

	VBR=GetVBR();
     8e2:	23c0 0000 459e 	move.l d0,459e <VBR.lto_priv.2>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     8e8:	2079 0000 459e 	movea.l 459e <VBR.lto_priv.2>,a0
     8ee:	2e28 006c      	move.l 108(a0),d7
	SystemIrq=GetInterruptHandler(); //store interrupt register
     8f2:	23c7 0000 45a2 	move.l d7,45a2 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
     8f8:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
     8fa:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     8fc:	2079 0000 45aa 	movea.l 45aa <hw>,a0
     902:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     906:	3028 0002      	move.w 2(a0),d0
     90a:	0800 000e      	btst #14,d0
     90e:	66f6           	bne.s 906 <main+0x900>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
     910:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     916:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
     91c:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     922:	2279 0000 459e 	movea.l 459e <VBR.lto_priv.2>,a1
     928:	2347 006c      	move.l d7,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     92c:	2c79 0000 45a6 	movea.l 45a6 <GfxBase>,a6
     932:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     938:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     93e:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     944:	3039 0000 459c 	move.w 459c <SystemInts>,d0
     94a:	0040 8000      	ori.w #-32768,d0
     94e:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     952:	3039 0000 459a 	move.w 459a <SystemDMA>,d0
     958:	0040 8000      	ori.w #-32768,d0
     95c:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     960:	3039 0000 4598 	move.w 4598 <SystemADKCON>,d0
     966:	0040 8000      	ori.w #-32768,d0
     96a:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     96e:	2279 0000 4594 	movea.l 4594 <ActiView>,a1
     974:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     978:	2c79 0000 45a6 	movea.l 45a6 <GfxBase>,a6
     97e:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     982:	2c79 0000 45a6 	movea.l 45a6 <GfxBase>,a6
     988:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     98c:	2c79 0000 45a6 	movea.l 45a6 <GfxBase>,a6
     992:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     996:	2c79 0000 45a6 	movea.l 45a6 <GfxBase>,a6
     99c:	4eae fe32      	jsr -462(a6)
	Enable();
     9a0:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     9a6:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     9aa:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     9b0:	2279 0000 45be 	movea.l 45be <DOSBase>,a1
     9b6:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     9ba:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     9c0:	2279 0000 45a6 	movea.l 45a6 <GfxBase>,a1
     9c6:	4eae fe62      	jsr -414(a6)
}
     9ca:	7000           	moveq #0,d0
     9cc:	4ced 5c8c ff98 	movem.l -104(a5),d2-d3/d7/a2-a4/a6
     9d2:	4e5d           	unlk a5
     9d4:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     9d6:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     9dc:	4eae ffc4      	jsr -60(a6)
     9e0:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     9e6:	2200           	move.l d0,d1
     9e8:	243c 0000 23fa 	move.l #9210,d2
     9ee:	762c           	moveq #44,d3
     9f0:	4eae ffd0      	jsr -48(a6)
     9f4:	6000 f7b2      	bra.w 1a8 <main+0x1a2>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     9f8:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     9fe:	4eae ffc4      	jsr -60(a6)
     a02:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     a08:	2200           	move.l d0,d1
     a0a:	243c 0000 2430 	move.l #9264,d2
     a10:	7636           	moveq #54,d3
     a12:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = 0x40000;
     a16:	23fc 0004 0000 	move.l #262144,45ba <DrawBuffer>
     a1c:	0000 45ba 
  ViewBuffer = 0x50000;
     a20:	23fc 0005 0000 	move.l #327680,45b2 <ViewBuffer>
     a26:	0000 45b2 
  SetBplPointers();
     a2a:	45f9 0000 146c 	lea 146c <SetBplPointers>,a2
     a30:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     a32:	0cb9 0005 0000 	cmpi.l #327680,45ba <DrawBuffer>
     a38:	0000 45ba 
     a3c:	6600 f842      	bne.w 280 <main+0x27a>
     a40:	6000 0108      	bra.w b4a <main+0xb44>
		Exit(0);
     a44:	9dce           	suba.l a6,a6
     a46:	7200           	moveq #0,d1
     a48:	4eae ff70      	jsr -144(a6)
     a4c:	6000 f606      	bra.w 54 <main+0x4e>
		Exit(0);
     a50:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     a56:	7200           	moveq #0,d1
     a58:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     a5c:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     a62:	43f9 0000 20ec 	lea 20ec <incbin_swfont_end+0xce>,a1
     a68:	7000           	moveq #0,d0
     a6a:	4eae fdd8      	jsr -552(a6)
     a6e:	23c0 0000 45be 	move.l d0,45be <DOSBase>
	if (!DOSBase)
     a74:	6600 f5de      	bne.w 54 <main+0x4e>
     a78:	60ca           	bra.s a44 <main+0xa3e>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     a7a:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     a80:	4eae ffc4      	jsr -60(a6)
     a84:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     a8a:	2200           	move.l d0,d1
     a8c:	243c 0000 20b4 	move.l #8372,d2
     a92:	7626           	moveq #38,d3
     a94:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     a98:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     a9e:	7201           	moveq #1,d1
     aa0:	4eae ff70      	jsr -144(a6)
     aa4:	2039 0000 45c2 	move.l 45c2 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
     aaa:	23c0 0000 45b2 	move.l d0,45b2 <ViewBuffer>
  ViewCopper = Copperlist2;
     ab0:	23f9 0000 45ca 	move.l 45ca <Copperlist2>,45ae <ViewCopper>
     ab6:	0000 45ae 
  SwapCl();
     aba:	4e93           	jsr (a3)
  SetBplPointers();
     abc:	4e92           	jsr (a2)
  SwapCl();
     abe:	4e93           	jsr (a3)
  SetBplPointers();
     ac0:	4e92           	jsr (a2)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     ac2:	4878 0010      	pea 10 <main+0xa>
     ac6:	4879 0000 4534 	pea 4534 <ClsSprites>
     acc:	42a7           	clr.l -(sp)
     ace:	2f39 0000 45d2 	move.l 45d2 <Copperlist1>,-(sp)
     ad4:	45f9 0000 0d68 	lea d68 <TestCopperlistBatch>,a2
     ada:	4e92           	jsr (a2)
     adc:	4fef 0010      	lea 16(sp),sp
     ae0:	4a80           	tst.l d0
     ae2:	6600 fad6      	bne.w 5ba <main+0x5b4>
     ae6:	6000 fab4      	bra.w 59c <main+0x596>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     aea:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     af0:	4eae ffc4      	jsr -60(a6)
     af4:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     afa:	2200           	move.l d0,d1
     afc:	243c 0000 208d 	move.l #8333,d2
     b02:	7626           	moveq #38,d3
     b04:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     b08:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     b0e:	7201           	moveq #1,d1
     b10:	4eae ff70      	jsr -144(a6)
     b14:	2039 0000 45c6 	move.l 45c6 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
     b1a:	23c0 0000 45ba 	move.l d0,45ba <DrawBuffer>
  DrawCopper = Copperlist1;
     b20:	23f9 0000 45d2 	move.l 45d2 <Copperlist1>,45b6 <DrawCopper>
     b26:	0000 45b6 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
     b2a:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     b30:	203c 0000 c800 	move.l #51200,d0
     b36:	7202           	moveq #2,d1
     b38:	4eae ff3a      	jsr -198(a6)
     b3c:	23c0 0000 45c2 	move.l d0,45c2 <Bitplane2>
  if(Bitplane2 == 0) {
     b42:	6600 fa1e      	bne.w 562 <main+0x55c>
     b46:	6000 ff32      	bra.w a7a <main+0xa74>
     b4a:	0cb9 0004 0000 	cmpi.l #262144,45b2 <ViewBuffer>
     b50:	0000 45b2 
     b54:	6700 f748      	beq.w 29e <main+0x298>
    Write( Output(), 
     b58:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     b5e:	4eae ffc4      	jsr -60(a6)
     b62:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     b68:	2200           	move.l d0,d1
     b6a:	243c 0000 2127 	move.l #8487,d2
     b70:	763b           	moveq #59,d3
     b72:	4eae ffd0      	jsr -48(a6)
     b76:	6000 f726      	bra.w 29e <main+0x298>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     b7a:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     b80:	4eae ffc4      	jsr -60(a6)
     b84:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
     b8a:	2200           	move.l d0,d1
     b8c:	243c 0000 21dd 	move.l #8669,d2
     b92:	7621           	moveq #33,d3
     b94:	4eae ffd0      	jsr -48(a6)
     b98:	2079 0000 45d2 	movea.l 45d2 <Copperlist1>,a0
     b9e:	6000 f77c      	bra.w 31c <main+0x316>
	APTR vbr = 0;
     ba2:	7000           	moveq #0,d0
	VBR=GetVBR();
     ba4:	23c0 0000 459e 	move.l d0,459e <VBR.lto_priv.2>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     baa:	2079 0000 459e 	movea.l 459e <VBR.lto_priv.2>,a0
     bb0:	2e28 006c      	move.l 108(a0),d7
	SystemIrq=GetInterruptHandler(); //store interrupt register
     bb4:	23c7 0000 45a2 	move.l d7,45a2 <SystemIrq>
	WaitVbl();
     bba:	4e92           	jsr (a2)
	WaitVbl();
     bbc:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     bbe:	2079 0000 45aa 	movea.l 45aa <hw>,a0
     bc4:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     bc8:	6000 fd3c      	bra.w 906 <main+0x900>

00000bcc <FreeDisplay.constprop.1>:
void FreeDisplay( int clsize, int bplsize) {
     bcc:	2f0e           	move.l a6,-(sp)
     bce:	2f02           	move.l d2,-(sp)
     bd0:	242f 000c      	move.l 12(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
     bd4:	2279 0000 45d2 	movea.l 45d2 <Copperlist1>,a1
     bda:	b2fc 0000      	cmpa.w #0,a1
     bde:	670c           	beq.s bec <FreeDisplay.constprop.1+0x20>
     be0:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     be6:	2002           	move.l d2,d0
     be8:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     bec:	2279 0000 45ca 	movea.l 45ca <Copperlist2>,a1
     bf2:	b2fc 0000      	cmpa.w #0,a1
     bf6:	670c           	beq.s c04 <FreeDisplay.constprop.1+0x38>
     bf8:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     bfe:	2002           	move.l d2,d0
     c00:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
     c04:	2279 0000 45c6 	movea.l 45c6 <Bitplane1>,a1
     c0a:	b2fc 0000      	cmpa.w #0,a1
     c0e:	6710           	beq.s c20 <FreeDisplay.constprop.1+0x54>
     c10:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     c16:	203c 0000 c800 	move.l #51200,d0
     c1c:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
     c20:	2279 0000 45c2 	movea.l 45c2 <Bitplane2>,a1
     c26:	b2fc 0000      	cmpa.w #0,a1
     c2a:	6710           	beq.s c3c <FreeDisplay.constprop.1+0x70>
     c2c:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     c32:	203c 0000 c800 	move.l #51200,d0
     c38:	4eae ff2e      	jsr -210(a6)
}
     c3c:	241f           	move.l (sp)+,d2
     c3e:	2c5f           	movea.l (sp)+,a6
     c40:	4e75           	rts

00000c42 <TestCopperlistPos.constprop.0>:
  int test1 = instructions[pos];
     c42:	202f 0008      	move.l 8(sp),d0
     c46:	d080           	add.l d0,d0
     c48:	d080           	add.l d0,d0
  if( instructions[pos] == value ) 
     c4a:	206f 0004      	movea.l 4(sp),a0
     c4e:	72fe           	moveq #-2,d1
     c50:	b2b0 0800      	cmp.l (0,a0,d0.l),d1
     c54:	57c0           	seq d0
     c56:	4880           	ext.w d0
     c58:	48c0           	ext.l d0
}
     c5a:	4480           	neg.l d0
     c5c:	4e75           	rts

00000c5e <warpmode.part.0>:
void warpmode(int on) 
     c5e:	598f           	subq.l #4,sp
     c60:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     c62:	4aaf 000c      	tst.l 12(sp)
     c66:	674c           	beq.s cb4 <warpmode.part.0+0x56>
     c68:	4878 0001      	pea 1 <_start+0x1>
     c6c:	740b           	moveq #11,d2
     c6e:	d48f           	add.l sp,d2
     c70:	2f02           	move.l d2,-(sp)
     c72:	42a7           	clr.l -(sp)
     c74:	4879 0000 2052 	pea 2052 <incbin_swfont_end+0x34>
     c7a:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffe20b9>
     c7e:	4878 0052      	pea 52 <main+0x4c>
     c82:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xef201a>
     c88:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     c8c:	203c 0000 2038 	move.l #8248,d0
     c92:	4878 0001      	pea 1 <_start+0x1>
     c96:	2f02           	move.l d2,-(sp)
     c98:	42a7           	clr.l -(sp)
     c9a:	2f00           	move.l d0,-(sp)
     c9c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffe20b9>
     ca0:	4878 0052      	pea 52 <main+0x4c>
     ca4:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xef201a>
	}
}
     caa:	4fef 0018      	lea 24(sp),sp
     cae:	241f           	move.l (sp)+,d2
     cb0:	588f           	addq.l #4,sp
     cb2:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     cb4:	4878 0001      	pea 1 <_start+0x1>
     cb8:	740b           	moveq #11,d2
     cba:	d48f           	add.l sp,d2
     cbc:	2f02           	move.l d2,-(sp)
     cbe:	42a7           	clr.l -(sp)
     cc0:	4879 0000 205c 	pea 205c <incbin_swfont_end+0x3e>
     cc6:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffe20b9>
     cca:	4878 0052      	pea 52 <main+0x4c>
     cce:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xef201a>
     cd4:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     cd8:	203c 0000 201f 	move.l #8223,d0
     cde:	4878 0001      	pea 1 <_start+0x1>
     ce2:	2f02           	move.l d2,-(sp)
     ce4:	42a7           	clr.l -(sp)
     ce6:	2f00           	move.l d0,-(sp)
     ce8:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffe20b9>
     cec:	4878 0052      	pea 52 <main+0x4c>
     cf0:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xef201a>
}
     cf6:	4fef 0018      	lea 24(sp),sp
     cfa:	241f           	move.l (sp)+,d2
     cfc:	588f           	addq.l #4,sp
     cfe:	4e75           	rts

00000d00 <KPrintF>:
{
     d00:	4fef ff80      	lea -128(sp),sp
     d04:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
     d08:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xef201a>
     d0e:	6734           	beq.s d44 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     d10:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     d16:	206f 0090      	movea.l 144(sp),a0
     d1a:	43ef 0094      	lea 148(sp),a1
     d1e:	45f9 0000 189c 	lea 189c <PutChar>,a2
     d24:	47ef 000c      	lea 12(sp),a3
     d28:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     d2c:	2f0b           	move.l a3,-(sp)
     d2e:	4878 0056      	pea 56 <main+0x50>
     d32:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xef201a>
     d38:	508f           	addq.l #8,sp
}
     d3a:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     d3e:	4fef 0080      	lea 128(sp),sp
     d42:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     d44:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     d4a:	206f 0090      	movea.l 144(sp),a0
     d4e:	43ef 0094      	lea 148(sp),a1
     d52:	45f9 0000 188e 	lea 188e <KPutCharX>,a2
     d58:	97cb           	suba.l a3,a3
     d5a:	4eae fdf6      	jsr -522(a6)
}
     d5e:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     d62:	4fef 0080      	lea 128(sp),sp
     d66:	4e75           	rts

00000d68 <TestCopperlistBatch>:
                                                                  long length) {
     d68:	48e7 2030      	movem.l d2/a2-a3,-(sp)
     d6c:	246f 0010      	movea.l 16(sp),a2
     d70:	206f 0014      	movea.l 20(sp),a0
     d74:	226f 0018      	movea.l 24(sp),a1
     d78:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
     d7c:	2008           	move.l a0,d0
     d7e:	d088           	add.l a0,d0
     d80:	d080           	add.l d0,d0
     d82:	2411           	move.l (a1),d2
     d84:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
     d88:	6600 01ac      	bne.w f36 <TestCopperlistBatch+0x1ce>
     d8c:	2008           	move.l a0,d0
     d8e:	5280           	addq.l #1,d0
     d90:	d080           	add.l d0,d0
     d92:	d080           	add.l d0,d0
     d94:	2032 0800      	move.l (0,a2,d0.l),d0
     d98:	b0a9 0004      	cmp.l 4(a1),d0
     d9c:	6600 0198      	bne.w f36 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     da0:	7002           	moveq #2,d0
     da2:	b081           	cmp.l d1,d0
     da4:	6700 0188      	beq.w f2e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     da8:	2008           	move.l a0,d0
     daa:	5480           	addq.l #2,d0
     dac:	d080           	add.l d0,d0
     dae:	d080           	add.l d0,d0
     db0:	2032 0800      	move.l (0,a2,d0.l),d0
     db4:	b0a9 0008      	cmp.l 8(a1),d0
     db8:	6600 017c      	bne.w f36 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     dbc:	7403           	moveq #3,d2
     dbe:	b481           	cmp.l d1,d2
     dc0:	6700 016c      	beq.w f2e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     dc4:	2008           	move.l a0,d0
     dc6:	5680           	addq.l #3,d0
     dc8:	d080           	add.l d0,d0
     dca:	d080           	add.l d0,d0
     dcc:	2032 0800      	move.l (0,a2,d0.l),d0
     dd0:	b0a9 000c      	cmp.l 12(a1),d0
     dd4:	6600 0160      	bne.w f36 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     dd8:	7004           	moveq #4,d0
     dda:	b081           	cmp.l d1,d0
     ddc:	6700 0150      	beq.w f2e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     de0:	2008           	move.l a0,d0
     de2:	5880           	addq.l #4,d0
     de4:	d080           	add.l d0,d0
     de6:	d080           	add.l d0,d0
     de8:	2032 0800      	move.l (0,a2,d0.l),d0
     dec:	b0a9 0010      	cmp.l 16(a1),d0
     df0:	6600 0144      	bne.w f36 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     df4:	7405           	moveq #5,d2
     df6:	b481           	cmp.l d1,d2
     df8:	6700 0134      	beq.w f2e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     dfc:	2008           	move.l a0,d0
     dfe:	5a80           	addq.l #5,d0
     e00:	d080           	add.l d0,d0
     e02:	d080           	add.l d0,d0
     e04:	2032 0800      	move.l (0,a2,d0.l),d0
     e08:	b0a9 0014      	cmp.l 20(a1),d0
     e0c:	6600 0128      	bne.w f36 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     e10:	7006           	moveq #6,d0
     e12:	b081           	cmp.l d1,d0
     e14:	6700 0118      	beq.w f2e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     e18:	2008           	move.l a0,d0
     e1a:	5c80           	addq.l #6,d0
     e1c:	d080           	add.l d0,d0
     e1e:	d080           	add.l d0,d0
     e20:	2032 0800      	move.l (0,a2,d0.l),d0
     e24:	b0a9 0018      	cmp.l 24(a1),d0
     e28:	6600 010c      	bne.w f36 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     e2c:	7407           	moveq #7,d2
     e2e:	b481           	cmp.l d1,d2
     e30:	6700 00fc      	beq.w f2e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     e34:	2008           	move.l a0,d0
     e36:	5e80           	addq.l #7,d0
     e38:	d080           	add.l d0,d0
     e3a:	d080           	add.l d0,d0
     e3c:	2032 0800      	move.l (0,a2,d0.l),d0
     e40:	b0a9 001c      	cmp.l 28(a1),d0
     e44:	6600 00f0      	bne.w f36 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     e48:	7008           	moveq #8,d0
     e4a:	b081           	cmp.l d1,d0
     e4c:	6700 00e0      	beq.w f2e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     e50:	2008           	move.l a0,d0
     e52:	5080           	addq.l #8,d0
     e54:	d080           	add.l d0,d0
     e56:	d080           	add.l d0,d0
     e58:	2032 0800      	move.l (0,a2,d0.l),d0
     e5c:	b0a9 0020      	cmp.l 32(a1),d0
     e60:	6600 00d4      	bne.w f36 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     e64:	7409           	moveq #9,d2
     e66:	b481           	cmp.l d1,d2
     e68:	6700 00c4      	beq.w f2e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     e6c:	47e8 0009      	lea 9(a0),a3
     e70:	200b           	move.l a3,d0
     e72:	d08b           	add.l a3,d0
     e74:	d080           	add.l d0,d0
     e76:	2032 0800      	move.l (0,a2,d0.l),d0
     e7a:	b0a9 0024      	cmp.l 36(a1),d0
     e7e:	6600 00b6      	bne.w f36 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     e82:	700a           	moveq #10,d0
     e84:	b081           	cmp.l d1,d0
     e86:	6700 00a6      	beq.w f2e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     e8a:	47e8 000a      	lea 10(a0),a3
     e8e:	200b           	move.l a3,d0
     e90:	d08b           	add.l a3,d0
     e92:	d080           	add.l d0,d0
     e94:	2032 0800      	move.l (0,a2,d0.l),d0
     e98:	b0a9 0028      	cmp.l 40(a1),d0
     e9c:	6600 0098      	bne.w f36 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     ea0:	740b           	moveq #11,d2
     ea2:	b481           	cmp.l d1,d2
     ea4:	6700 0088      	beq.w f2e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     ea8:	47e8 000b      	lea 11(a0),a3
     eac:	200b           	move.l a3,d0
     eae:	d08b           	add.l a3,d0
     eb0:	d080           	add.l d0,d0
     eb2:	2032 0800      	move.l (0,a2,d0.l),d0
     eb6:	b0a9 002c      	cmp.l 44(a1),d0
     eba:	667a           	bne.s f36 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     ebc:	700c           	moveq #12,d0
     ebe:	b081           	cmp.l d1,d0
     ec0:	676c           	beq.s f2e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     ec2:	47e8 000c      	lea 12(a0),a3
     ec6:	200b           	move.l a3,d0
     ec8:	d08b           	add.l a3,d0
     eca:	d080           	add.l d0,d0
     ecc:	2032 0800      	move.l (0,a2,d0.l),d0
     ed0:	b0a9 0030      	cmp.l 48(a1),d0
     ed4:	6660           	bne.s f36 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     ed6:	740d           	moveq #13,d2
     ed8:	b481           	cmp.l d1,d2
     eda:	6752           	beq.s f2e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     edc:	47e8 000d      	lea 13(a0),a3
     ee0:	200b           	move.l a3,d0
     ee2:	d08b           	add.l a3,d0
     ee4:	d080           	add.l d0,d0
     ee6:	2032 0800      	move.l (0,a2,d0.l),d0
     eea:	b0a9 0034      	cmp.l 52(a1),d0
     eee:	6646           	bne.s f36 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     ef0:	700e           	moveq #14,d0
     ef2:	b081           	cmp.l d1,d0
     ef4:	6738           	beq.s f2e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     ef6:	47e8 000e      	lea 14(a0),a3
     efa:	200b           	move.l a3,d0
     efc:	d08b           	add.l a3,d0
     efe:	d080           	add.l d0,d0
     f00:	2032 0800      	move.l (0,a2,d0.l),d0
     f04:	b0a9 0038      	cmp.l 56(a1),d0
     f08:	662c           	bne.s f36 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     f0a:	7410           	moveq #16,d2
     f0c:	b481           	cmp.l d1,d2
     f0e:	661e           	bne.s f2e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     f10:	41e8 000f      	lea 15(a0),a0
     f14:	d1c8           	adda.l a0,a0
     f16:	d1c8           	adda.l a0,a0
     f18:	2070 a800      	movea.l (0,a0,a2.l),a0
     f1c:	b1e9 003c      	cmpa.l 60(a1),a0
     f20:	57c0           	seq d0
     f22:	4880           	ext.w d0
     f24:	48c0           	ext.l d0
     f26:	4480           	neg.l d0
}
     f28:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     f2c:	4e75           	rts
  return 1;
     f2e:	7001           	moveq #1,d0
}
     f30:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     f34:	4e75           	rts
      return 0;
     f36:	7000           	moveq #0,d0
}
     f38:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     f3c:	4e75           	rts

00000f3e <ClBuild>:
  SwapCl();
  SetBplPointers();
  return 0;
}

ULONG * ClbuildSW() {
     f3e:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
     f42:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
     f48:	707b           	moveq #123,d0
     f4a:	4600           	not.b d0
     f4c:	7202           	moveq #2,d1
     f4e:	4eae ff3a      	jsr -198(a6)
     f52:	2440           	movea.l d0,a2
  
  if( retval == 0) {
     f54:	4a80           	tst.l d0
     f56:	6700 010e      	beq.w 1066 <ClBuild+0x128>
  ULONG *cl = retval;
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;
     f5a:	24b9 0000 4534 	move.l 4534 <ClsSprites>,(a2)
     f60:	2579 0000 4538 	move.l 4538 <ClsSprites+0x4>,4(a2)
     f66:	0004 
     f68:	2579 0000 453c 	move.l 453c <ClsSprites+0x8>,8(a2)
     f6e:	0008 
     f70:	2579 0000 4540 	move.l 4540 <ClsSprites+0xc>,12(a2)
     f76:	000c 
     f78:	2579 0000 4544 	move.l 4544 <ClsSprites+0x10>,16(a2)
     f7e:	0010 
     f80:	2579 0000 4548 	move.l 4548 <ClsSprites+0x14>,20(a2)
     f86:	0014 
     f88:	2579 0000 454c 	move.l 454c <ClsSprites+0x18>,24(a2)
     f8e:	0018 
     f90:	2579 0000 4550 	move.l 4550 <ClsSprites+0x1c>,28(a2)
     f96:	001c 
     f98:	2579 0000 4554 	move.l 4554 <ClsSprites+0x20>,32(a2)
     f9e:	0020 
     fa0:	2579 0000 4558 	move.l 4558 <ClsSprites+0x24>,36(a2)
     fa6:	0024 
     fa8:	2579 0000 455c 	move.l 455c <ClsSprites+0x28>,40(a2)
     fae:	0028 
     fb0:	2579 0000 4560 	move.l 4560 <ClsSprites+0x2c>,44(a2)
     fb6:	002c 
     fb8:	2579 0000 4564 	move.l 4564 <ClsSprites+0x30>,48(a2)
     fbe:	0030 
     fc0:	2579 0000 4568 	move.l 4568 <ClsSprites+0x34>,52(a2)
     fc6:	0034 
     fc8:	2579 0000 456c 	move.l 456c <ClsSprites+0x38>,56(a2)
     fce:	0038 
     fd0:	2579 0000 4570 	move.l 4570 <ClsSprites+0x3c>,60(a2)
     fd6:	003c 
  clpartinstruction = ClScreen;
  for(int i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
     fd8:	2579 0000 4504 	move.l 4504 <ClScreen>,64(a2)
     fde:	0040 
     fe0:	2579 0000 4508 	move.l 4508 <ClScreen+0x4>,68(a2)
     fe6:	0044 
     fe8:	2579 0000 450c 	move.l 450c <ClScreen+0x8>,72(a2)
     fee:	0048 
     ff0:	2579 0000 4510 	move.l 4510 <ClScreen+0xc>,76(a2)
     ff6:	004c 
     ff8:	2579 0000 4514 	move.l 4514 <ClScreen+0x10>,80(a2)
     ffe:	0050 
    1000:	2579 0000 4518 	move.l 4518 <ClScreen+0x14>,84(a2)
    1006:	0054 
    1008:	2579 0000 451c 	move.l 451c <ClScreen+0x18>,88(a2)
    100e:	0058 
    1010:	2579 0000 4520 	move.l 4520 <ClScreen+0x1c>,92(a2)
    1016:	005c 
    1018:	2579 0000 4524 	move.l 4524 <ClScreen+0x20>,96(a2)
    101e:	0060 
    1020:	2579 0000 4528 	move.l 4528 <ClScreen+0x24>,100(a2)
    1026:	0064 
    1028:	2579 0000 452c 	move.l 452c <ClScreen+0x28>,104(a2)
    102e:	0068 
    1030:	2579 0000 4530 	move.l 4530 <ClScreen+0x2c>,108(a2)
    1036:	006c 
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    1038:	257c 00e0 0000 	move.l #14680064,112(a2)
    103e:	0070 
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    1040:	257c 00e2 0000 	move.l #14811136,116(a2)
    1046:	0074 

  clpartinstruction = ClColor;
  for(int i=0; i<2;i++)
    *cl++ = *clpartinstruction++;
    1048:	2579 0000 44fc 	move.l 44fc <ClColor>,120(a2)
    104e:	0078 
    1050:	2579 0000 4500 	move.l 4500 <ClColor+0x4>,124(a2)
    1056:	007c 

  *cl = 0xfffffffe;
    1058:	70fe           	moveq #-2,d0
    105a:	2540 0080      	move.l d0,128(a2)

  return retval;
}
    105e:	200a           	move.l a2,d0
    1060:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1064:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1066:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
    106c:	4eae ffc4      	jsr -60(a6)
    1070:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
    1076:	2200           	move.l d0,d1
    1078:	243c 0000 2067 	move.l #8295,d2
    107e:	7628           	moveq #40,d3
    1080:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1084:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
    108a:	7201           	moveq #1,d1
    108c:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1090:	24b9 0000 4534 	move.l 4534 <ClsSprites>,(a2)
    1096:	2579 0000 4538 	move.l 4538 <ClsSprites+0x4>,4(a2)
    109c:	0004 
    109e:	2579 0000 453c 	move.l 453c <ClsSprites+0x8>,8(a2)
    10a4:	0008 
    10a6:	2579 0000 4540 	move.l 4540 <ClsSprites+0xc>,12(a2)
    10ac:	000c 
    10ae:	2579 0000 4544 	move.l 4544 <ClsSprites+0x10>,16(a2)
    10b4:	0010 
    10b6:	2579 0000 4548 	move.l 4548 <ClsSprites+0x14>,20(a2)
    10bc:	0014 
    10be:	2579 0000 454c 	move.l 454c <ClsSprites+0x18>,24(a2)
    10c4:	0018 
    10c6:	2579 0000 4550 	move.l 4550 <ClsSprites+0x1c>,28(a2)
    10cc:	001c 
    10ce:	2579 0000 4554 	move.l 4554 <ClsSprites+0x20>,32(a2)
    10d4:	0020 
    10d6:	2579 0000 4558 	move.l 4558 <ClsSprites+0x24>,36(a2)
    10dc:	0024 
    10de:	2579 0000 455c 	move.l 455c <ClsSprites+0x28>,40(a2)
    10e4:	0028 
    10e6:	2579 0000 4560 	move.l 4560 <ClsSprites+0x2c>,44(a2)
    10ec:	002c 
    10ee:	2579 0000 4564 	move.l 4564 <ClsSprites+0x30>,48(a2)
    10f4:	0030 
    10f6:	2579 0000 4568 	move.l 4568 <ClsSprites+0x34>,52(a2)
    10fc:	0034 
    10fe:	2579 0000 456c 	move.l 456c <ClsSprites+0x38>,56(a2)
    1104:	0038 
    1106:	2579 0000 4570 	move.l 4570 <ClsSprites+0x3c>,60(a2)
    110c:	003c 
    *cl++ = *clpartinstruction++;
    110e:	2579 0000 4504 	move.l 4504 <ClScreen>,64(a2)
    1114:	0040 
    1116:	2579 0000 4508 	move.l 4508 <ClScreen+0x4>,68(a2)
    111c:	0044 
    111e:	2579 0000 450c 	move.l 450c <ClScreen+0x8>,72(a2)
    1124:	0048 
    1126:	2579 0000 4510 	move.l 4510 <ClScreen+0xc>,76(a2)
    112c:	004c 
    112e:	2579 0000 4514 	move.l 4514 <ClScreen+0x10>,80(a2)
    1134:	0050 
    1136:	2579 0000 4518 	move.l 4518 <ClScreen+0x14>,84(a2)
    113c:	0054 
    113e:	2579 0000 451c 	move.l 451c <ClScreen+0x18>,88(a2)
    1144:	0058 
    1146:	2579 0000 4520 	move.l 4520 <ClScreen+0x1c>,92(a2)
    114c:	005c 
    114e:	2579 0000 4524 	move.l 4524 <ClScreen+0x20>,96(a2)
    1154:	0060 
    1156:	2579 0000 4528 	move.l 4528 <ClScreen+0x24>,100(a2)
    115c:	0064 
    115e:	2579 0000 452c 	move.l 452c <ClScreen+0x28>,104(a2)
    1164:	0068 
    1166:	2579 0000 4530 	move.l 4530 <ClScreen+0x2c>,108(a2)
    116c:	006c 
  *cl++ = 0x00e00000;
    116e:	257c 00e0 0000 	move.l #14680064,112(a2)
    1174:	0070 
  *cl++ = 0x00e20000;
    1176:	257c 00e2 0000 	move.l #14811136,116(a2)
    117c:	0074 
    *cl++ = *clpartinstruction++;
    117e:	2579 0000 44fc 	move.l 44fc <ClColor>,120(a2)
    1184:	0078 
    1186:	2579 0000 4500 	move.l 4500 <ClColor+0x4>,124(a2)
    118c:	007c 
  *cl = 0xfffffffe;
    118e:	70fe           	moveq #-2,d0
    1190:	2540 0080      	move.l d0,128(a2)
}
    1194:	200a           	move.l a2,d0
    1196:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    119a:	4e75           	rts

0000119c <ClbuildZoom>:
ULONG * ClbuildZoom() {
    119c:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    11a0:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
    11a6:	203c 0000 a484 	move.l #42116,d0
    11ac:	7202           	moveq #2,d1
    11ae:	4eae ff3a      	jsr -198(a6)
    11b2:	2440           	movea.l d0,a2
  if( retval == 0) {
    11b4:	4a80           	tst.l d0
    11b6:	6700 0150      	beq.w 1308 <ClbuildZoom+0x16c>
    *cl++ = *clpartinstruction++;
    11ba:	24b9 0000 4534 	move.l 4534 <ClsSprites>,(a2)
    11c0:	2579 0000 4538 	move.l 4538 <ClsSprites+0x4>,4(a2)
    11c6:	0004 
    11c8:	2579 0000 453c 	move.l 453c <ClsSprites+0x8>,8(a2)
    11ce:	0008 
    11d0:	2579 0000 4540 	move.l 4540 <ClsSprites+0xc>,12(a2)
    11d6:	000c 
    11d8:	2579 0000 4544 	move.l 4544 <ClsSprites+0x10>,16(a2)
    11de:	0010 
    11e0:	2579 0000 4548 	move.l 4548 <ClsSprites+0x14>,20(a2)
    11e6:	0014 
    11e8:	2579 0000 454c 	move.l 454c <ClsSprites+0x18>,24(a2)
    11ee:	0018 
    11f0:	2579 0000 4550 	move.l 4550 <ClsSprites+0x1c>,28(a2)
    11f6:	001c 
    11f8:	2579 0000 4554 	move.l 4554 <ClsSprites+0x20>,32(a2)
    11fe:	0020 
    1200:	2579 0000 4558 	move.l 4558 <ClsSprites+0x24>,36(a2)
    1206:	0024 
    1208:	2579 0000 455c 	move.l 455c <ClsSprites+0x28>,40(a2)
    120e:	0028 
    1210:	2579 0000 4560 	move.l 4560 <ClsSprites+0x2c>,44(a2)
    1216:	002c 
    1218:	2579 0000 4564 	move.l 4564 <ClsSprites+0x30>,48(a2)
    121e:	0030 
    1220:	2579 0000 4568 	move.l 4568 <ClsSprites+0x34>,52(a2)
    1226:	0034 
    1228:	2579 0000 456c 	move.l 456c <ClsSprites+0x38>,56(a2)
    122e:	0038 
    1230:	2579 0000 4570 	move.l 4570 <ClsSprites+0x3c>,60(a2)
    1236:	003c 
    *cl++ = *clpartinstruction++;
    1238:	2579 0000 4504 	move.l 4504 <ClScreen>,64(a2)
    123e:	0040 
    1240:	2579 0000 4508 	move.l 4508 <ClScreen+0x4>,68(a2)
    1246:	0044 
    1248:	2579 0000 450c 	move.l 450c <ClScreen+0x8>,72(a2)
    124e:	0048 
    1250:	2579 0000 4510 	move.l 4510 <ClScreen+0xc>,76(a2)
    1256:	004c 
    1258:	2579 0000 4514 	move.l 4514 <ClScreen+0x10>,80(a2)
    125e:	0050 
    1260:	2579 0000 4518 	move.l 4518 <ClScreen+0x14>,84(a2)
    1266:	0054 
    1268:	2579 0000 451c 	move.l 451c <ClScreen+0x18>,88(a2)
    126e:	0058 
    1270:	2579 0000 4520 	move.l 4520 <ClScreen+0x1c>,92(a2)
    1276:	005c 
    1278:	2579 0000 4524 	move.l 4524 <ClScreen+0x20>,96(a2)
    127e:	0060 
    1280:	2579 0000 4528 	move.l 4528 <ClScreen+0x24>,100(a2)
    1286:	0064 
    1288:	2579 0000 452c 	move.l 452c <ClScreen+0x28>,104(a2)
    128e:	0068 
    1290:	2579 0000 4530 	move.l 4530 <ClScreen+0x2c>,108(a2)
    1296:	006c 
  *cl++ = 0x00e00000;
    1298:	257c 00e0 0000 	move.l #14680064,112(a2)
    129e:	0070 
  *cl++ = 0x00e20000;
    12a0:	257c 00e2 0000 	move.l #14811136,116(a2)
    12a6:	0074 
    *cl++ = *clpartinstruction++;
    12a8:	2579 0000 44fc 	move.l 44fc <ClColor>,120(a2)
    12ae:	0078 
    12b0:	2579 0000 4500 	move.l 4500 <ClColor+0x4>,124(a2)
    12b6:	007c 
    12b8:	43ea 0124      	lea 292(a2),a1
    12bc:	220a           	move.l a2,d1
    12be:	0681 0000 a524 	addi.l #42276,d1
    12c4:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    12ca:	41e9 ff60      	lea -160(a1),a0
    12ce:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    12d2:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    12d8:	5088           	addq.l #8,a0
    12da:	217c 0182 0f00 	move.l #25300736,-4(a0)
    12e0:	fffc 
    for(int i2=0;i2<20;i2++) {
    12e2:	b3c8           	cmpa.l a0,a1
    12e4:	66ec           	bne.s 12d2 <ClbuildZoom+0x136>
    12e6:	43e8 00a4      	lea 164(a0),a1
    12ea:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    12f0:	b3c1           	cmpa.l d1,a1
    12f2:	66d6           	bne.s 12ca <ClbuildZoom+0x12e>
   *cl = 0xfffffffe;
    12f4:	203c 0000 a480 	move.l #42112,d0
    12fa:	72fe           	moveq #-2,d1
    12fc:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    1300:	200a           	move.l a2,d0
    1302:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1306:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1308:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
    130e:	4eae ffc4      	jsr -60(a6)
    1312:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
    1318:	2200           	move.l d0,d1
    131a:	243c 0000 2067 	move.l #8295,d2
    1320:	7628           	moveq #40,d3
    1322:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1326:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
    132c:	7201           	moveq #1,d1
    132e:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1332:	24b9 0000 4534 	move.l 4534 <ClsSprites>,(a2)
    1338:	2579 0000 4538 	move.l 4538 <ClsSprites+0x4>,4(a2)
    133e:	0004 
    1340:	2579 0000 453c 	move.l 453c <ClsSprites+0x8>,8(a2)
    1346:	0008 
    1348:	2579 0000 4540 	move.l 4540 <ClsSprites+0xc>,12(a2)
    134e:	000c 
    1350:	2579 0000 4544 	move.l 4544 <ClsSprites+0x10>,16(a2)
    1356:	0010 
    1358:	2579 0000 4548 	move.l 4548 <ClsSprites+0x14>,20(a2)
    135e:	0014 
    1360:	2579 0000 454c 	move.l 454c <ClsSprites+0x18>,24(a2)
    1366:	0018 
    1368:	2579 0000 4550 	move.l 4550 <ClsSprites+0x1c>,28(a2)
    136e:	001c 
    1370:	2579 0000 4554 	move.l 4554 <ClsSprites+0x20>,32(a2)
    1376:	0020 
    1378:	2579 0000 4558 	move.l 4558 <ClsSprites+0x24>,36(a2)
    137e:	0024 
    1380:	2579 0000 455c 	move.l 455c <ClsSprites+0x28>,40(a2)
    1386:	0028 
    1388:	2579 0000 4560 	move.l 4560 <ClsSprites+0x2c>,44(a2)
    138e:	002c 
    1390:	2579 0000 4564 	move.l 4564 <ClsSprites+0x30>,48(a2)
    1396:	0030 
    1398:	2579 0000 4568 	move.l 4568 <ClsSprites+0x34>,52(a2)
    139e:	0034 
    13a0:	2579 0000 456c 	move.l 456c <ClsSprites+0x38>,56(a2)
    13a6:	0038 
    13a8:	2579 0000 4570 	move.l 4570 <ClsSprites+0x3c>,60(a2)
    13ae:	003c 
    *cl++ = *clpartinstruction++;
    13b0:	2579 0000 4504 	move.l 4504 <ClScreen>,64(a2)
    13b6:	0040 
    13b8:	2579 0000 4508 	move.l 4508 <ClScreen+0x4>,68(a2)
    13be:	0044 
    13c0:	2579 0000 450c 	move.l 450c <ClScreen+0x8>,72(a2)
    13c6:	0048 
    13c8:	2579 0000 4510 	move.l 4510 <ClScreen+0xc>,76(a2)
    13ce:	004c 
    13d0:	2579 0000 4514 	move.l 4514 <ClScreen+0x10>,80(a2)
    13d6:	0050 
    13d8:	2579 0000 4518 	move.l 4518 <ClScreen+0x14>,84(a2)
    13de:	0054 
    13e0:	2579 0000 451c 	move.l 451c <ClScreen+0x18>,88(a2)
    13e6:	0058 
    13e8:	2579 0000 4520 	move.l 4520 <ClScreen+0x1c>,92(a2)
    13ee:	005c 
    13f0:	2579 0000 4524 	move.l 4524 <ClScreen+0x20>,96(a2)
    13f6:	0060 
    13f8:	2579 0000 4528 	move.l 4528 <ClScreen+0x24>,100(a2)
    13fe:	0064 
    1400:	2579 0000 452c 	move.l 452c <ClScreen+0x28>,104(a2)
    1406:	0068 
    1408:	2579 0000 4530 	move.l 4530 <ClScreen+0x2c>,108(a2)
    140e:	006c 
  *cl++ = 0x00e00000;
    1410:	257c 00e0 0000 	move.l #14680064,112(a2)
    1416:	0070 
  *cl++ = 0x00e20000;
    1418:	257c 00e2 0000 	move.l #14811136,116(a2)
    141e:	0074 
    *cl++ = *clpartinstruction++;
    1420:	2579 0000 44fc 	move.l 44fc <ClColor>,120(a2)
    1426:	0078 
    1428:	2579 0000 4500 	move.l 4500 <ClColor+0x4>,124(a2)
    142e:	007c 
    1430:	43ea 0124      	lea 292(a2),a1
    1434:	220a           	move.l a2,d1
    1436:	0681 0000 a524 	addi.l #42276,d1
    143c:	203c 2c07 fffe 	move.l #738721790,d0
    1442:	6000 fe86      	bra.w 12ca <ClbuildZoom+0x12e>

00001446 <SwapCl>:
  ULONG tmp = DrawCopper;
    1446:	2039 0000 45b6 	move.l 45b6 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    144c:	23f9 0000 45ae 	move.l 45ae <ViewCopper>,45b6 <DrawCopper>
    1452:	0000 45b6 
  ViewCopper = tmp;
    1456:	23c0 0000 45ae 	move.l d0,45ae <ViewCopper>
  hw->cop1lc = ViewCopper;
    145c:	2079 0000 45aa 	movea.l 45aa <hw>,a0
    1462:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    1466:	3140 0088      	move.w d0,136(a0)
}
    146a:	4e75           	rts

0000146c <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    146c:	2039 0000 45ba 	move.l 45ba <DrawBuffer>,d0
  UWORD *copword = DrawCopper;
    1472:	2079 0000 45b6 	movea.l 45b6 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    1478:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    147c:	2200           	move.l d0,d1
    147e:	4241           	clr.w d1
    1480:	4841           	swap d1
    1482:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    1486:	23f9 0000 45b2 	move.l 45b2 <ViewBuffer>,45ba <DrawBuffer>
    148c:	0000 45ba 
  ViewBuffer = tmp;
    1490:	23c0 0000 45b2 	move.l d0,45b2 <ViewBuffer>
}
    1496:	4e75           	rts

00001498 <PrepareDisplay>:
 int PrepareDisplaySW() {
    1498:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    149c:	45fa faa0      	lea f3e <ClBuild>(pc),a2
    14a0:	4e92           	jsr (a2)
    14a2:	23c0 0000 45d2 	move.l d0,45d2 <Copperlist1>
  Copperlist2 = ClbuildSW();
    14a8:	4e92           	jsr (a2)
    14aa:	23c0 0000 45ca 	move.l d0,45ca <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    14b0:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
    14b6:	203c 0000 c800 	move.l #51200,d0
    14bc:	7202           	moveq #2,d1
    14be:	4eae ff3a      	jsr -198(a6)
    14c2:	23c0 0000 45c6 	move.l d0,45c6 <Bitplane1>
  if(Bitplane1 == 0) {
    14c8:	6700 00ac      	beq.w 1576 <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    14cc:	23c0 0000 45ba 	move.l d0,45ba <DrawBuffer>
  DrawCopper = Copperlist1;
    14d2:	23f9 0000 45d2 	move.l 45d2 <Copperlist1>,45b6 <DrawCopper>
    14d8:	0000 45b6 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    14dc:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
    14e2:	203c 0000 c800 	move.l #51200,d0
    14e8:	7202           	moveq #2,d1
    14ea:	4eae ff3a      	jsr -198(a6)
    14ee:	23c0 0000 45c2 	move.l d0,45c2 <Bitplane2>
  if(Bitplane2 == 0) {
    14f4:	6728           	beq.s 151e <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    14f6:	23c0 0000 45b2 	move.l d0,45b2 <ViewBuffer>
  ViewCopper = Copperlist2;
    14fc:	23f9 0000 45ca 	move.l 45ca <Copperlist2>,45ae <ViewCopper>
    1502:	0000 45ae 
  SwapCl();
    1506:	47fa ff3e      	lea 1446 <SwapCl>(pc),a3
    150a:	4e93           	jsr (a3)
  SetBplPointers();
    150c:	45fa ff5e      	lea 146c <SetBplPointers>(pc),a2
    1510:	4e92           	jsr (a2)
  SwapCl();
    1512:	4e93           	jsr (a3)
  SetBplPointers();
    1514:	4e92           	jsr (a2)
}
    1516:	7000           	moveq #0,d0
    1518:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    151c:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    151e:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
    1524:	4eae ffc4      	jsr -60(a6)
    1528:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
    152e:	2200           	move.l d0,d1
    1530:	243c 0000 20b4 	move.l #8372,d2
    1536:	7626           	moveq #38,d3
    1538:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    153c:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
    1542:	7201           	moveq #1,d1
    1544:	4eae ff70      	jsr -144(a6)
    1548:	2039 0000 45c2 	move.l 45c2 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    154e:	23c0 0000 45b2 	move.l d0,45b2 <ViewBuffer>
  ViewCopper = Copperlist2;
    1554:	23f9 0000 45ca 	move.l 45ca <Copperlist2>,45ae <ViewCopper>
    155a:	0000 45ae 
  SwapCl();
    155e:	47fa fee6      	lea 1446 <SwapCl>(pc),a3
    1562:	4e93           	jsr (a3)
  SetBplPointers();
    1564:	45fa ff06      	lea 146c <SetBplPointers>(pc),a2
    1568:	4e92           	jsr (a2)
  SwapCl();
    156a:	4e93           	jsr (a3)
  SetBplPointers();
    156c:	4e92           	jsr (a2)
}
    156e:	7000           	moveq #0,d0
    1570:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    1574:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1576:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
    157c:	4eae ffc4      	jsr -60(a6)
    1580:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
    1586:	2200           	move.l d0,d1
    1588:	243c 0000 208d 	move.l #8333,d2
    158e:	7626           	moveq #38,d3
    1590:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1594:	2c79 0000 45be 	movea.l 45be <DOSBase>,a6
    159a:	7201           	moveq #1,d1
    159c:	4eae ff70      	jsr -144(a6)
    15a0:	2039 0000 45c6 	move.l 45c6 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    15a6:	23c0 0000 45ba 	move.l d0,45ba <DrawBuffer>
  DrawCopper = Copperlist1;
    15ac:	23f9 0000 45d2 	move.l 45d2 <Copperlist1>,45b6 <DrawCopper>
    15b2:	0000 45b6 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    15b6:	2c79 0000 45ce 	movea.l 45ce <SysBase>,a6
    15bc:	203c 0000 c800 	move.l #51200,d0
    15c2:	7202           	moveq #2,d1
    15c4:	4eae ff3a      	jsr -198(a6)
    15c8:	23c0 0000 45c2 	move.l d0,45c2 <Bitplane2>
  if(Bitplane2 == 0) {
    15ce:	6600 ff26      	bne.w 14f6 <PrepareDisplay+0x5e>
    15d2:	6000 ff4a      	bra.w 151e <PrepareDisplay+0x86>

000015d6 <WaitVbl>:
void WaitVbl() {
    15d6:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    15d8:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xde10be>,d0
    15de:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    15e0:	2017           	move.l (sp),d0
    15e2:	0280 0001 ff00 	andi.l #130816,d0
    15e8:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    15ea:	2017           	move.l (sp),d0
    15ec:	0c80 0001 3700 	cmpi.l #79616,d0
    15f2:	67e4           	beq.s 15d8 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    15f4:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xde10be>,d0
    15fa:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    15fe:	202f 0004      	move.l 4(sp),d0
    1602:	0280 0001 ff00 	andi.l #130816,d0
    1608:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    160c:	202f 0004      	move.l 4(sp),d0
    1610:	0c80 0001 3700 	cmpi.l #79616,d0
    1616:	66dc           	bne.s 15f4 <WaitVbl+0x1e>
}
    1618:	508f           	addq.l #8,sp
    161a:	4e75           	rts

0000161c <memcpy>:
{
    161c:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    1620:	202f 0014      	move.l 20(sp),d0
    1624:	226f 0018      	movea.l 24(sp),a1
    1628:	222f 001c      	move.l 28(sp),d1
	while(len--)
    162c:	2601           	move.l d1,d3
    162e:	5383           	subq.l #1,d3
    1630:	4a81           	tst.l d1
    1632:	6762           	beq.s 1696 <memcpy+0x7a>
    1634:	2040           	movea.l d0,a0
    1636:	5888           	addq.l #4,a0
    1638:	b1c9           	cmpa.l a1,a0
    163a:	53c2           	sl.s d2
    163c:	4402           	neg.b d2
    163e:	41e9 0004      	lea 4(a1),a0
    1642:	b1c0           	cmpa.l d0,a0
    1644:	53c4           	sl.s d4
    1646:	4404           	neg.b d4
    1648:	8404           	or.b d4,d2
    164a:	7808           	moveq #8,d4
    164c:	b883           	cmp.l d3,d4
    164e:	55c4           	sc.s d4
    1650:	4404           	neg.b d4
    1652:	c404           	and.b d4,d2
    1654:	6746           	beq.s 169c <memcpy+0x80>
    1656:	2409           	move.l a1,d2
    1658:	8480           	or.l d0,d2
    165a:	7803           	moveq #3,d4
    165c:	c484           	and.l d4,d2
    165e:	663c           	bne.s 169c <memcpy+0x80>
    1660:	2049           	movea.l a1,a0
    1662:	2440           	movea.l d0,a2
    1664:	74fc           	moveq #-4,d2
    1666:	c481           	and.l d1,d2
    1668:	d489           	add.l a1,d2
		*d++ = *s++;
    166a:	24d8           	move.l (a0)+,(a2)+
    166c:	b488           	cmp.l a0,d2
    166e:	66fa           	bne.s 166a <memcpy+0x4e>
    1670:	74fc           	moveq #-4,d2
    1672:	c481           	and.l d1,d2
    1674:	2040           	movea.l d0,a0
    1676:	d1c2           	adda.l d2,a0
    1678:	d3c2           	adda.l d2,a1
    167a:	9682           	sub.l d2,d3
    167c:	b481           	cmp.l d1,d2
    167e:	6716           	beq.s 1696 <memcpy+0x7a>
    1680:	1091           	move.b (a1),(a0)
	while(len--)
    1682:	4a83           	tst.l d3
    1684:	6710           	beq.s 1696 <memcpy+0x7a>
		*d++ = *s++;
    1686:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    168c:	5383           	subq.l #1,d3
    168e:	6706           	beq.s 1696 <memcpy+0x7a>
		*d++ = *s++;
    1690:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    1696:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    169a:	4e75           	rts
    169c:	2040           	movea.l d0,a0
    169e:	d289           	add.l a1,d1
		*d++ = *s++;
    16a0:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    16a2:	b289           	cmp.l a1,d1
    16a4:	67f0           	beq.s 1696 <memcpy+0x7a>
		*d++ = *s++;
    16a6:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    16a8:	b289           	cmp.l a1,d1
    16aa:	66f4           	bne.s 16a0 <memcpy+0x84>
    16ac:	60e8           	bra.s 1696 <memcpy+0x7a>

000016ae <memset>:
{
    16ae:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    16b2:	202f 0024      	move.l 36(sp),d0
    16b6:	2a2f 0028      	move.l 40(sp),d5
    16ba:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    16be:	2809           	move.l a1,d4
    16c0:	5384           	subq.l #1,d4
    16c2:	b2fc 0000      	cmpa.w #0,a1
    16c6:	6f00 00b0      	ble.w 1778 <memset+0xca>
    16ca:	1e05           	move.b d5,d7
    16cc:	2200           	move.l d0,d1
    16ce:	4481           	neg.l d1
    16d0:	7403           	moveq #3,d2
    16d2:	c282           	and.l d2,d1
    16d4:	7c05           	moveq #5,d6
		*ptr++ = val;
    16d6:	2440           	movea.l d0,a2
    16d8:	bc84           	cmp.l d4,d6
    16da:	646a           	bcc.s 1746 <memset+0x98>
    16dc:	4a81           	tst.l d1
    16de:	6724           	beq.s 1704 <memset+0x56>
    16e0:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    16e2:	5384           	subq.l #1,d4
    16e4:	7401           	moveq #1,d2
    16e6:	b481           	cmp.l d1,d2
    16e8:	671a           	beq.s 1704 <memset+0x56>
		*ptr++ = val;
    16ea:	2440           	movea.l d0,a2
    16ec:	548a           	addq.l #2,a2
    16ee:	2040           	movea.l d0,a0
    16f0:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    16f4:	5384           	subq.l #1,d4
    16f6:	7403           	moveq #3,d2
    16f8:	b481           	cmp.l d1,d2
    16fa:	6608           	bne.s 1704 <memset+0x56>
		*ptr++ = val;
    16fc:	528a           	addq.l #1,a2
    16fe:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    1702:	5384           	subq.l #1,d4
    1704:	2609           	move.l a1,d3
    1706:	9681           	sub.l d1,d3
    1708:	7c00           	moveq #0,d6
    170a:	1c05           	move.b d5,d6
    170c:	2406           	move.l d6,d2
    170e:	4842           	swap d2
    1710:	4242           	clr.w d2
    1712:	2042           	movea.l d2,a0
    1714:	2406           	move.l d6,d2
    1716:	e14a           	lsl.w #8,d2
    1718:	4842           	swap d2
    171a:	4242           	clr.w d2
    171c:	e18e           	lsl.l #8,d6
    171e:	2646           	movea.l d6,a3
    1720:	2c08           	move.l a0,d6
    1722:	8486           	or.l d6,d2
    1724:	2c0b           	move.l a3,d6
    1726:	8486           	or.l d6,d2
    1728:	1407           	move.b d7,d2
    172a:	2040           	movea.l d0,a0
    172c:	d1c1           	adda.l d1,a0
    172e:	72fc           	moveq #-4,d1
    1730:	c283           	and.l d3,d1
    1732:	d288           	add.l a0,d1
		*ptr++ = val;
    1734:	20c2           	move.l d2,(a0)+
    1736:	b1c1           	cmpa.l d1,a0
    1738:	66fa           	bne.s 1734 <memset+0x86>
    173a:	72fc           	moveq #-4,d1
    173c:	c283           	and.l d3,d1
    173e:	d5c1           	adda.l d1,a2
    1740:	9881           	sub.l d1,d4
    1742:	b283           	cmp.l d3,d1
    1744:	6732           	beq.s 1778 <memset+0xca>
    1746:	1485           	move.b d5,(a2)
	while(len-- > 0)
    1748:	4a84           	tst.l d4
    174a:	6f2c           	ble.s 1778 <memset+0xca>
		*ptr++ = val;
    174c:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    1750:	7201           	moveq #1,d1
    1752:	b284           	cmp.l d4,d1
    1754:	6c22           	bge.s 1778 <memset+0xca>
		*ptr++ = val;
    1756:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    175a:	7402           	moveq #2,d2
    175c:	b484           	cmp.l d4,d2
    175e:	6c18           	bge.s 1778 <memset+0xca>
		*ptr++ = val;
    1760:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    1764:	7c03           	moveq #3,d6
    1766:	bc84           	cmp.l d4,d6
    1768:	6c0e           	bge.s 1778 <memset+0xca>
		*ptr++ = val;
    176a:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    176e:	7204           	moveq #4,d1
    1770:	b284           	cmp.l d4,d1
    1772:	6c04           	bge.s 1778 <memset+0xca>
		*ptr++ = val;
    1774:	1545 0005      	move.b d5,5(a2)
}
    1778:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    177c:	4e75           	rts

0000177e <strlen>:
{
    177e:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    1782:	7000           	moveq #0,d0
	while(*s++)
    1784:	4a10           	tst.b (a0)
    1786:	6708           	beq.s 1790 <strlen+0x12>
		t++;
    1788:	5280           	addq.l #1,d0
	while(*s++)
    178a:	4a30 0800      	tst.b (0,a0,d0.l)
    178e:	66f8           	bne.s 1788 <strlen+0xa>
}
    1790:	4e75           	rts
    1792:	4e71           	nop

00001794 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    1794:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    1798:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    179c:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    17a0:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    17a4:	d041           	add.w d1,d0
	swap	d0
    17a6:	4840           	swap d0
	clrw	d0
    17a8:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    17aa:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    17ae:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    17b2:	d081           	add.l d1,d0

	rts
    17b4:	4e75           	rts

000017b6 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    17b6:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    17b8:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    17bc:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    17c0:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    17c6:	6416           	bcc.s 17de <__udivsi3+0x28>
	movel	d0, d2
    17c8:	2400           	move.l d0,d2
	clrw	d2
    17ca:	4242           	clr.w d2
	swap	d2
    17cc:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    17ce:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    17d0:	3002           	move.w d2,d0
	swap	d0
    17d2:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    17d4:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    17d8:	84c1           	divu.w d1,d2
	movew	d2, d0
    17da:	3002           	move.w d2,d0
	jra	6f
    17dc:	6030           	bra.s 180e <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    17de:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    17e0:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    17e2:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    17e4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    17ea:	64f4           	bcc.s 17e0 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    17ec:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    17ee:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    17f4:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    17f6:	c2c0           	mulu.w d0,d1
	swap	d2
    17f8:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    17fa:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    17fc:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    17fe:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    1800:	660a           	bne.s 180c <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    1802:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    1804:	6506           	bcs.s 180c <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    1806:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    180a:	6302           	bls.s 180e <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    180c:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    180e:	241f           	move.l (sp)+,d2
	rts
    1810:	4e75           	rts

00001812 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    1812:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    1814:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    1816:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    181a:	6a04           	bpl.s 1820 <__divsi3+0xe>
	negl	d1
    181c:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    181e:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    1820:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    1824:	6a04           	bpl.s 182a <__divsi3+0x18>
	negl	d0
    1826:	4480           	neg.l d0
	negb	d2
    1828:	4402           	neg.b d2

2:	movel	d1, sp@-
    182a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    182c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    182e:	6186           	bsr.s 17b6 <__udivsi3>
	addql	IMM (8), sp
    1830:	508f           	addq.l #8,sp

	tstb	d2
    1832:	4a02           	tst.b d2
	jpl	3f
    1834:	6a02           	bpl.s 1838 <__divsi3+0x26>
	negl	d0
    1836:	4480           	neg.l d0

3:	movel	sp@+, d2
    1838:	241f           	move.l (sp)+,d2
	rts
    183a:	4e75           	rts

0000183c <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    183c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1840:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1844:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1846:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    1848:	61c8           	bsr.s 1812 <__divsi3>
	addql	IMM (8), sp
    184a:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    184c:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1850:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1852:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1854:	6100 ff3e      	bsr.w 1794 <__mulsi3>
	addql	IMM (8), sp
    1858:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    185a:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    185e:	9280           	sub.l d0,d1
	movel	d1, d0
    1860:	2001           	move.l d1,d0
	rts
    1862:	4e75           	rts

00001864 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    1864:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1868:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    186c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    186e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    1870:	6100 ff44      	bsr.w 17b6 <__udivsi3>
	addql	IMM (8), sp
    1874:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    1876:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    187a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    187c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    187e:	6100 ff14      	bsr.w 1794 <__mulsi3>
	addql	IMM (8), sp
    1882:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    1884:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1888:	9280           	sub.l d0,d1
	movel	d1, d0
    188a:	2001           	move.l d1,d0
	rts
    188c:	4e75           	rts

0000188e <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    188e:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    1890:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    1894:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    1898:	2c5f           	movea.l (sp)+,a6
    rts
    189a:	4e75           	rts

0000189c <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    189c:	16c0           	move.b d0,(a3)+
	rts
    189e:	4e75           	rts

000018a0 <saveregs>:
    18a0:	3c00           	move.w d0,d6

000018a2 <font2distance>:
#define a6 REG (a6)
#define fp REG (fp)
#define sp REG (sp)
#define pc REG (pc)

saveregs: dcb 60,0
    18a2:	0005 0505      	ori.b #5,d5
    18a6:	0505           	btst d2,d5
    18a8:	0505           	btst d2,d5
    18aa:	0505           	btst d2,d5

font2distance:
  dc.b 0, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    18ac:	0505           	btst d2,d5
    18ae:	0505           	btst d2,d5
    18b0:	0005 0505      	ori.b #5,d5
    18b4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    18b6:	0505           	btst d2,d5
    18b8:	0505           	btst d2,d5
    18ba:	0505           	btst d2,d5
    18bc:	0505           	btst d2,d5
    18be:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    18c0:	0505           	btst d2,d5
    18c2:	0505           	btst d2,d5
    18c4:	0505           	btst d2,d5
    18c6:	0505           	btst d2,d5
    18c8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    18ca:	0500           	btst d2,d0
    18cc:	0505           	btst d2,d5
    18ce:	0505           	btst d2,d5
    18d0:	0505           	btst d2,d5
    18d2:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    18d4:	0505           	btst d2,d5
    18d6:	0505           	btst d2,d5
    18d8:	0505           	btst d2,d5
    18da:	0505           	btst d2,d5
    18dc:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    18de:	0505           	btst d2,d5
    18e0:	0505           	btst d2,d5
    18e2:	0503           	btst d2,d3
    18e4:	0505           	btst d2,d5
    18e6:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    18e8:	0505           	btst d2,d5
    18ea:	0500           	btst d2,d0
    18ec:	0505           	btst d2,d5
    18ee:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    18f2:	0505           	btst d2,d5
    18f4:	0503           	btst d2,d3
    18f6:	0205 0507      	andi.b #7,d5
    18fa:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    18fc:	0505           	btst d2,d5
    18fe:	0505           	btst d2,d5
    1900:	0505           	btst d2,d5
    1902:	0505           	btst d2,d5
    1904:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1906:	0505           	btst d2,d5
    1908:	0505           	btst d2,d5
    190a:	0505           	btst d2,d5
    190c:	0505           	btst d2,d5
    190e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1910:	0505           	btst d2,d5
    1912:	0505           	btst d2,d5
    1914:	0505           	btst d2,d5
    1916:	0505           	btst d2,d5
    1918:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    191a:	0505           	btst d2,d5
    191c:	0505           	btst d2,d5
    191e:	0505           	btst d2,d5
    1920:	0505           	btst d2,d5
    1922:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1924:	0505           	btst d2,d5
    1926:	0505           	btst d2,d5
    1928:	0505           	btst d2,d5
    192a:	0505           	btst d2,d5
    192c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    192e:	0505           	btst d2,d5
    1930:	0505           	btst d2,d5
    1932:	0505           	btst d2,d5
    1934:	0505           	btst d2,d5
    1936:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1938:	0505           	btst d2,d5
    193a:	0505           	btst d2,d5
    193c:	0505           	btst d2,d5
    193e:	0505           	btst d2,d5
    1940:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1942:	0505           	btst d2,d5
    1944:	0505           	btst d2,d5
    1946:	0505           	btst d2,d5
    1948:	0505           	btst d2,d5
    194a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    194c:	0505           	btst d2,d5
    194e:	0505           	btst d2,d5
    1950:	0505           	btst d2,d5
    1952:	0505           	btst d2,d5
    1954:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1956:	0505           	btst d2,d5
    1958:	0505           	btst d2,d5
    195a:	0505           	btst d2,d5
    195c:	0505           	btst d2,d5
    195e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1960:	0505           	btst d2,d5
    1962:	0505           	btst d2,d5
    1964:	0505           	btst d2,d5
    1966:	0505           	btst d2,d5
    1968:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    196a:	0505           	btst d2,d5
    196c:	0505           	btst d2,d5
    196e:	0505           	btst d2,d5
    1970:	0505           	btst d2,d5
    1972:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1974:	0505           	btst d2,d5
    1976:	0505           	btst d2,d5
    1978:	0505           	btst d2,d5
    197a:	0505           	btst d2,d5
    197c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    197e:	0505           	btst d2,d5
    1980:	0505           	btst d2,d5
    1982:	0505           	btst d2,d5
    1984:	0505           	btst d2,d5
    1986:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1988:	0505           	btst d2,d5
    198a:	0505           	btst d2,d5
    198c:	0505           	btst d2,d5
    198e:	0505           	btst d2,d5
    1990:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1992:	0505           	btst d2,d5
    1994:	0505           	btst d2,d5
    1996:	0505           	btst d2,d5
    1998:	0505           	btst d2,d5
    199a:	0505           	btst d2,d5

0000199c <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__PrintFont)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    199c:	48f9 7fff 0000 	movem.l d0-a6,18a0 <saveregs>
    19a2:	18a0 
  move.l sp@(4),a0  //Fontlocation
    19a4:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a2  //Textlocation
    19a8:	246f 0008      	movea.l 8(sp),a2
  move.l sp@(12),a3 //Destination
    19ac:	266f 000c      	movea.l 12(sp),a3
  sub.l  d3,d3      //Number of rows = 1
    19b0:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    19b2:	082d 0006 0002 	btst #6,2(a5)

000019b8 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    19b8:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    19be:	66f8           	bne.s 19b8 <st2wblit>

000019c0 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    19c0:	7019           	moveq #25,d0
	sub.l d5,d5      
    19c2:	9a85           	sub.l d5,d5

000019c4 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    19c4:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    19c6:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    19c8:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    19cc:	9dce           	suba.l a6,a6
	move.l d2, a6
    19ce:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    19d0:	ddfc 0000 18a2 	adda.l #6306,a6

	LSL  	#4,d2 	    //Fetch next char
    19d6:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    19d8:	2842           	movea.l d2,a4


	move.l  #0,d4
    19da:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    19dc:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    19de:	3814           	move.w (a4),d4
	swap	d4
    19e0:	4844           	swap d4
	lsr.l	d5, d4
    19e2:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    19e4:	8993           	or.l d4,(a3)
	clr.l	d4
    19e6:	4284           	clr.l d4
	move.w  2(a4), d4
    19e8:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    19ec:	4844           	swap d4
	lsr.l	d5, d4
    19ee:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    19f0:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    19f4:	4284           	clr.l d4
	move.w  4(a4), d4
    19f6:	382c 0004      	move.w 4(a4),d4
	swap	d4
    19fa:	4844           	swap d4
	lsr.l	d5, d4
    19fc:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    19fe:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    1a02:	4284           	clr.l d4
	move.w  6(a4), d4
    1a04:	382c 0006      	move.w 6(a4),d4
	swap	d4
    1a08:	4844           	swap d4
	lsr.l	d5, d4
    1a0a:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    1a0c:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    1a10:	4284           	clr.l d4
	move.w  8(a4), d4
    1a12:	382c 0008      	move.w 8(a4),d4
	swap	d4
    1a16:	4844           	swap d4
	lsr.l	d5, d4
    1a18:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    1a1a:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    1a1e:	4284           	clr.l d4
	move.w  10(a4), d4
    1a20:	382c 000a      	move.w 10(a4),d4
	swap	d4
    1a24:	4844           	swap d4
	lsr.l	d5, d4
    1a26:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    1a28:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    1a2c:	4284           	clr.l d4
	move.w  12(a4), d4
    1a2e:	382c 000c      	move.w 12(a4),d4
	swap	d4
    1a32:	4844           	swap d4
	lsr.l	d5, d4
    1a34:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    1a36:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    1a3a:	4284           	clr.l d4
	move.w  14(a4), d4
    1a3c:	382c 000e      	move.w 14(a4),d4
	swap	d4
    1a40:	4844           	swap d4
	lsr.l	d5, d4
    1a42:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    1a44:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    1a48:	4284           	clr.l d4

	add.b   (a6), d5
    1a4a:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    1a4c:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    1a50:	6500 0006      	bcs.w 1a58 <noadditionalchar>
	addq.w  #1, a3
    1a54:	524b           	addq.w #1,a3
	sub.w   #8,d5
    1a56:	5145           	subq.w #8,d5

00001a58 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    1a58:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    1a5a:	51c8 ff68      	dbf d0,19c4 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    1a5e:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    1a62:	51cb ff5c      	dbf d3,19c0 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    1a66:	4cfa 7fff fe36 	movem.l 18a0 <saveregs>(pc),d0-a6

	RTS
    1a6c:	4e75           	rts
