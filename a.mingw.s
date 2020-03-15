
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
       6:	4e55 ff9c      	link.w a5,#-100
       a:	48e7 3f3a      	movem.l d2-d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 636c 	move.l a6,636c <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,633e <hw>
      1e:	0000 633e 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 3a41 	lea 3a41 <incbin_swfont_end+0x113>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 6342 	move.l d0,6342 <GfxBase>
	if (!GfxBase)
      34:	6700 1860      	beq.w 1896 <main+0x1890>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
      3e:	43f9 0000 3a52 	lea 3a52 <incbin_swfont_end+0x124>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 6368 	move.l d0,6368 <DOSBase>
	if (!DOSBase)
      50:	6700 1838      	beq.w 188a <main+0x1884>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 3a5e 	pea 3a5e <incbin_swfont_end+0x130>
      5a:	4eb9 0000 1acc 	jsr 1acc <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 3a7a 	move.l #14970,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 633e 	movea.l 633e <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 3a8a 	move.l #14986,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 2180 	lea 2180 <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 6364 	move.l d0,6364 <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 6354 	move.l d0,6354 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 6360 	move.l d0,6360 <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 6348 	move.l d0,6348 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 61f8 	cmp.l 61f8 <ClsSprites>,d0
      d2:	6600 16ea      	bne.w 17be <main+0x17b8>
      d6:	206a 0004      	movea.l 4(a2),a0
      da:	b1f9 0000 61fc 	cmpa.l 61fc <ClsSprites+0x4>,a0
      e0:	6600 16dc      	bne.w 17be <main+0x17b8>
      e4:	202a 0008      	move.l 8(a2),d0
      e8:	b0b9 0000 6200 	cmp.l 6200 <ClsSprites+0x8>,d0
      ee:	6600 16ce      	bne.w 17be <main+0x17b8>
      f2:	206a 000c      	movea.l 12(a2),a0
      f6:	b1f9 0000 6204 	cmpa.l 6204 <ClsSprites+0xc>,a0
      fc:	6600 16c0      	bne.w 17be <main+0x17b8>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 6208 	cmp.l 6208 <ClsSprites+0x10>,d0
     10a:	6600 16b2      	bne.w 17be <main+0x17b8>
     10e:	206a 0014      	movea.l 20(a2),a0
     112:	b1f9 0000 620c 	cmpa.l 620c <ClsSprites+0x14>,a0
     118:	6600 16a4      	bne.w 17be <main+0x17b8>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 6210 	cmp.l 6210 <ClsSprites+0x18>,d0
     126:	6600 1696      	bne.w 17be <main+0x17b8>
     12a:	206a 001c      	movea.l 28(a2),a0
     12e:	b1f9 0000 6214 	cmpa.l 6214 <ClsSprites+0x1c>,a0
     134:	6600 1688      	bne.w 17be <main+0x17b8>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 6218 	cmp.l 6218 <ClsSprites+0x20>,d0
     142:	6600 167a      	bne.w 17be <main+0x17b8>
     146:	206a 0024      	movea.l 36(a2),a0
     14a:	b1f9 0000 621c 	cmpa.l 621c <ClsSprites+0x24>,a0
     150:	6600 166c      	bne.w 17be <main+0x17b8>
     154:	202a 0028      	move.l 40(a2),d0
     158:	b0b9 0000 6220 	cmp.l 6220 <ClsSprites+0x28>,d0
     15e:	6600 165e      	bne.w 17be <main+0x17b8>
     162:	206a 002c      	movea.l 44(a2),a0
     166:	b1f9 0000 6224 	cmpa.l 6224 <ClsSprites+0x2c>,a0
     16c:	6600 1650      	bne.w 17be <main+0x17b8>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 6228 	cmp.l 6228 <ClsSprites+0x30>,d0
     17a:	6600 1642      	bne.w 17be <main+0x17b8>
     17e:	206a 0034      	movea.l 52(a2),a0
     182:	b1f9 0000 622c 	cmpa.l 622c <ClsSprites+0x34>,a0
     188:	6600 1634      	bne.w 17be <main+0x17b8>
     18c:	202a 0038      	move.l 56(a2),d0
     190:	b0b9 0000 6230 	cmp.l 6230 <ClsSprites+0x38>,d0
     196:	6600 1626      	bne.w 17be <main+0x17b8>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 6234 	cmpa.l 6234 <ClsSprites+0x3c>,a2
     1a4:	6600 1618      	bne.w 17be <main+0x17b8>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 6364 	movea.l 6364 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 61c8 	move.l 61c8 <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 164e      	bne.w 1808 <main+0x1802>
     1bc:	2028 0044      	move.l 68(a0),d0
     1c0:	b0b9 0000 61cc 	cmp.l 61cc <ClScreen+0x4>,d0
     1c6:	6600 1640      	bne.w 1808 <main+0x1802>
     1ca:	2039 0000 61d0 	move.l 61d0 <ClScreen+0x8>,d0
     1d0:	b0a8 0048      	cmp.l 72(a0),d0
     1d4:	6600 1632      	bne.w 1808 <main+0x1802>
     1d8:	2039 0000 61d4 	move.l 61d4 <ClScreen+0xc>,d0
     1de:	b0a8 004c      	cmp.l 76(a0),d0
     1e2:	6600 1624      	bne.w 1808 <main+0x1802>
     1e6:	2028 0050      	move.l 80(a0),d0
     1ea:	b0b9 0000 61d8 	cmp.l 61d8 <ClScreen+0x10>,d0
     1f0:	6600 1616      	bne.w 1808 <main+0x1802>
     1f4:	2028 0054      	move.l 84(a0),d0
     1f8:	b0b9 0000 61dc 	cmp.l 61dc <ClScreen+0x14>,d0
     1fe:	6600 1608      	bne.w 1808 <main+0x1802>
     202:	2028 0058      	move.l 88(a0),d0
     206:	b0b9 0000 61e0 	cmp.l 61e0 <ClScreen+0x18>,d0
     20c:	6600 15fa      	bne.w 1808 <main+0x1802>
     210:	2039 0000 61e4 	move.l 61e4 <ClScreen+0x1c>,d0
     216:	b0a8 005c      	cmp.l 92(a0),d0
     21a:	6600 15ec      	bne.w 1808 <main+0x1802>
     21e:	2028 0060      	move.l 96(a0),d0
     222:	b0b9 0000 61e8 	cmp.l 61e8 <ClScreen+0x20>,d0
     228:	6600 15de      	bne.w 1808 <main+0x1802>
     22c:	2028 0064      	move.l 100(a0),d0
     230:	b0b9 0000 61ec 	cmp.l 61ec <ClScreen+0x24>,d0
     236:	6600 15d0      	bne.w 1808 <main+0x1802>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 61f0 	cmp.l 61f0 <ClScreen+0x28>,d0
     244:	6600 15c2      	bne.w 1808 <main+0x1802>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 61f4 	cmpa.l 61f4 <ClScreen+0x2c>,a0
     252:	6600 15b4      	bne.w 1808 <main+0x1802>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     256:	23fc 0004 0000 	move.l #262144,6358 <DrawBuffer>
     25c:	0000 6358 
  ViewBuffer = (ULONG *)0x50000;
     260:	23fc 0005 0000 	move.l #327680,634c <ViewBuffer>
     266:	0000 634c 
  SetBplPointers();
     26a:	45f9 0000 2cc6 	lea 2cc6 <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,6358 <DrawBuffer>
     278:	0000 6358 
     27c:	6700 15dc      	beq.w 185a <main+0x1854>
    Write( Output(), 
     280:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 3a8d 	move.l #14989,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     29e:	2079 0000 6364 	movea.l 6364 <Copperlist1>,a0
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 3ac9 	move.l #15049,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 6364 	movea.l 6364 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 3b06 	move.l #15110,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 6364 	movea.l 6364 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2028 0078      	move.l 120(a0),d0
     304:	b0b9 0000 61c0 	cmp.l 61c0 <ClColor>,d0
     30a:	6600 14d4      	bne.w 17e0 <main+0x17da>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 61c4 	cmp.l 61c4 <ClColor+0x4>,d0
     318:	6600 14c6      	bne.w 17e0 <main+0x17da>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 3b65 	move.l #15205,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 2abe 	lea 2abe <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2079 0000 6354 	movea.l 6354 <DrawCopper>,a0
     350:	b1f9 0000 6360 	cmpa.l 6360 <Copperlist2>,a0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 3b88 	move.l #15240,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 2cf2 	lea 2cf2 <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 6358 	move.l 6358 <DrawBuffer>,d0
     384:	b0b9 0000 635c 	cmp.l 635c <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 3b9e 	move.l #15262,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2079 0000 6354 	movea.l 6354 <DrawCopper>,a0
     3b0:	b1f9 0000 6364 	cmpa.l 6364 <Copperlist1>,a0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 3bd6 	move.l #15318,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2039 0000 634c 	move.l 634c <ViewBuffer>,d0
     3de:	b0b9 0000 6350 	cmp.l 6350 <Bitplane2>,d0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 3c10 	move.l #15376,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2079 0000 6348 	movea.l 6348 <ViewCopper>,a0
     40a:	b1f9 0000 6360 	cmpa.l 6360 <Copperlist2>,a0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 3c49 	move.l #15433,d2
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
     434:	2079 0000 6348 	movea.l 6348 <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     44c:	b0b9 0000 6350 	cmp.l 6350 <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 3c84 	move.l #15492,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     476:	2079 0000 6348 	movea.l 6348 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     48e:	b0b9 0000 635c 	cmp.l 635c <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 3ccd 	move.l #15565,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4b8:	2079 0000 6348 	movea.l 6348 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4d0:	b0b9 0000 6350 	cmp.l 6350 <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 3d17 	move.l #15639,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	2c3c 0000 2e30 	move.l #11824,d6
     506:	2046           	movea.l d6,a0
     508:	4e90           	jsr (a0)
  TestZoom4Picture();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     50a:	47f9 0000 2ae4 	lea 2ae4 <PrepareDisplayZoom>,a3
     510:	4e93           	jsr (a3)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     512:	4878 0010      	pea 10 <main+0xa>
     516:	4879 0000 61f8 	pea 61f8 <ClsSprites>
     51c:	42a7           	clr.l -(sp)
     51e:	2f39 0000 6364 	move.l 6364 <Copperlist1>,-(sp)
     524:	283c 0000 1faa 	move.l #8106,d4
     52a:	2044           	movea.l d4,a0
     52c:	4e90           	jsr (a0)
     52e:	4fef 0018      	lea 24(sp),sp
     532:	4a80           	tst.l d0
     534:	661e           	bne.s 554 <main+0x54e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     536:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     53c:	4eae ffc4      	jsr -60(a6)
     540:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     546:	2200           	move.l d0,d1
     548:	243c 0000 3d60 	move.l #15712,d2
     54e:	762c           	moveq #44,d3
     550:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     554:	4878 000c      	pea c <main+0x6>
     558:	4879 0000 6190 	pea 6190 <ClScreenZoom>
     55e:	4878 0010      	pea 10 <main+0xa>
     562:	2f39 0000 6364 	move.l 6364 <Copperlist1>,-(sp)
     568:	2044           	movea.l d4,a0
     56a:	4e90           	jsr (a0)
     56c:	4fef 0010      	lea 16(sp),sp
     570:	4a80           	tst.l d0
     572:	661e           	bne.s 592 <main+0x58c>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     574:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     57a:	4eae ffc4      	jsr -60(a6)
     57e:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     584:	2200           	move.l d0,d1
     586:	243c 0000 3d96 	move.l #15766,d2
     58c:	7636           	moveq #54,d3
     58e:	4eae ffd0      	jsr -48(a6)
  //ZoomHorizontal = 10;
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     592:	2079 0000 6354 	movea.l 6354 <DrawCopper>,a0
  copword += ZMBPLPTRS+1;
  for(int i=1;i<=2;i++) {
    UWORD highword = ptr >> 16;
    UWORD lowword = ptr & 0xffff;
    *copword = highword;
     598:	317c 0004 0072 	move.w #4,114(a0)
    copword += 2;
    *copword = lowword;
     59e:	4268 0076      	clr.w 118(a0)
    *copword = highword;
     5a2:	317c 0004 007a 	move.w #4,122(a0)
    *copword = lowword;
     5a8:	317c 2800 007e 	move.w #10240,126(a0)
    copword += 2;
    ptr += 40*256;
  }
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
     5ae:	23fc 0005 0000 	move.l #327680,6358 <DrawBuffer>
     5b4:	0000 6358 
  ViewBuffer = (ULONG *) tmp;
     5b8:	23fc 0004 0000 	move.l #262144,634c <ViewBuffer>
     5be:	0000 634c 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5c2:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c8:	4878 001c      	pea 1c <main+0x16>
     5cc:	2f39 0000 6364 	move.l 6364 <Copperlist1>,-(sp)
     5d2:	2a3c 0000 1f8c 	move.l #8076,d5
     5d8:	2045           	movea.l d5,a0
     5da:	4e90           	jsr (a0)
     5dc:	4fef 000c      	lea 12(sp),sp
     5e0:	4a80           	tst.l d0
     5e2:	661e           	bne.s 602 <main+0x5fc>
    Write(Output(), 
     5e4:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     5ea:	4eae ffc4      	jsr -60(a6)
     5ee:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     5f4:	2200           	move.l d0,d1
     5f6:	243c 0000 3ac9 	move.l #15049,d2
     5fc:	763c           	moveq #60,d3
     5fe:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     602:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     608:	4878 001d      	pea 1d <main+0x17>
     60c:	2f39 0000 6364 	move.l 6364 <Copperlist1>,-(sp)
     612:	2045           	movea.l d5,a0
     614:	4e90           	jsr (a0)
     616:	4fef 000c      	lea 12(sp),sp
     61a:	4a80           	tst.l d0
     61c:	661e           	bne.s 63c <main+0x636>
    Write(Output(), 
     61e:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     624:	4eae ffc4      	jsr -60(a6)
     628:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     62e:	2200           	move.l d0,d1
     630:	243c 0000 3b06 	move.l #15110,d2
     636:	763c           	moveq #60,d3
     638:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     63c:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     642:	4878 001e      	pea 1e <main+0x18>
     646:	2f39 0000 6364 	move.l 6364 <Copperlist1>,-(sp)
     64c:	2045           	movea.l d5,a0
     64e:	4e90           	jsr (a0)
     650:	4fef 000c      	lea 12(sp),sp
     654:	4a80           	tst.l d0
     656:	661e           	bne.s 676 <main+0x670>
    Write(Output(), 
     658:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     65e:	4eae ffc4      	jsr -60(a6)
     662:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     668:	2200           	move.l d0,d1
     66a:	243c 0000 3dcd 	move.l #15821,d2
     670:	763c           	moveq #60,d3
     672:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     676:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     67c:	4878 001f      	pea 1f <main+0x19>
     680:	2f39 0000 6364 	move.l 6364 <Copperlist1>,-(sp)
     686:	2045           	movea.l d5,a0
     688:	4e90           	jsr (a0)
     68a:	4fef 000c      	lea 12(sp),sp
     68e:	4a80           	tst.l d0
     690:	661e           	bne.s 6b0 <main+0x6aa>
    Write(Output(), 
     692:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     698:	4eae ffc4      	jsr -60(a6)
     69c:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     6a2:	2200           	move.l d0,d1
     6a4:	243c 0000 3e0a 	move.l #15882,d2
     6aa:	763c           	moveq #60,d3
     6ac:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6b0:	4878 0002      	pea 2 <_start+0x2>
     6b4:	4879 0000 61c0 	pea 61c0 <ClColor>
     6ba:	4878 0020      	pea 20 <main+0x1a>
     6be:	2f39 0000 6364 	move.l 6364 <Copperlist1>,-(sp)
     6c4:	2044           	movea.l d4,a0
     6c6:	4e90           	jsr (a0)
     6c8:	4fef 0010      	lea 16(sp),sp
     6cc:	4a80           	tst.l d0
     6ce:	661e           	bne.s 6ee <main+0x6e8>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6d0:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     6d6:	4eae ffc4      	jsr -60(a6)
     6da:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     6e0:	2200           	move.l d0,d1
     6e2:	243c 0000 3b43 	move.l #15171,d2
     6e8:	7621           	moveq #33,d3
     6ea:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6ee:	4878 0040      	pea 40 <main+0x3a>
     6f2:	4879 0000 4150 	pea 4150 <rundemo.c.d99b7c69+0x4b7>
     6f8:	486d ffc0      	pea -64(a5)
     6fc:	4eb9 0000 2ee8 	jsr 2ee8 <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     702:	4878 0010      	pea 10 <main+0xa>
     706:	486d ffc0      	pea -64(a5)
     70a:	4878 0022      	pea 22 <main+0x1c>
     70e:	2f39 0000 6364 	move.l 6364 <Copperlist1>,-(sp)
     714:	2044           	movea.l d4,a0
     716:	4e90           	jsr (a0)
     718:	4fef 001c      	lea 28(sp),sp
     71c:	4a80           	tst.l d0
     71e:	661e           	bne.s 73e <main+0x738>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     720:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     726:	4eae ffc4      	jsr -60(a6)
     72a:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     730:	2200           	move.l d0,d1
     732:	243c 0000 3e47 	move.l #15943,d2
     738:	7621           	moveq #33,d3
     73a:	4eae ffd0      	jsr -48(a6)

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     73e:	2b7c 2d07 fffe 	move.l #755499006,-76(a5)
     744:	ffb4 
     746:	2b7c 0182 00f0 	move.l #25297136,-72(a5)
     74c:	ffb8 
     74e:	2b7c 0182 0f00 	move.l #25300736,-68(a5)
     754:	ffbc 

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
     756:	4878 0003      	pea 3 <_start+0x3>
     75a:	486d ffb4      	pea -76(a5)
     75e:	4878 004b      	pea 4b <main+0x45>
     762:	2f39 0000 6364 	move.l 6364 <Copperlist1>,-(sp)
     768:	2044           	movea.l d4,a0
     76a:	4e90           	jsr (a0)
     76c:	4fef 0010      	lea 16(sp),sp
     770:	4a80           	tst.l d0
     772:	661e           	bne.s 792 <main+0x78c>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     774:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     77a:	4eae ffc4      	jsr -60(a6)
     77e:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     784:	2200           	move.l d0,d1
     786:	243c 0000 3e69 	move.l #15977,d2
     78c:	762c           	moveq #44,d3
     78e:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     792:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdcd49>
     796:	4878 2922      	pea 2922 <ClbuildZoom+0x12e>
     79a:	2f39 0000 6364 	move.l 6364 <Copperlist1>,-(sp)
     7a0:	2045           	movea.l d5,a0
     7a2:	4e90           	jsr (a0)
     7a4:	4fef 000c      	lea 12(sp),sp
     7a8:	4a80           	tst.l d0
     7aa:	661e           	bne.s 7ca <main+0x7c4>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     7ac:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     7b2:	4eae ffc4      	jsr -60(a6)
     7b6:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     7bc:	2200           	move.l d0,d1
     7be:	243c 0000 3b65 	move.l #15205,d2
     7c4:	7622           	moveq #34,d3
     7c6:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7ca:	2f3c 0001 6800 	move.l #92160,-(sp)
     7d0:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7d6:	2046           	movea.l d6,a0
     7d8:	4e90           	jsr (a0)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7da:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
     7e0:	7004           	moveq #4,d0
     7e2:	7202           	moveq #2,d1
     7e4:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
     7e8:	33fc 0010 0000 	move.w #16,6346 <ZoomHorizontal>
     7ee:	6346 

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     7f0:	4e93           	jsr (a3)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7f2:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
     7f8:	203c 0000 c800 	move.l #51200,d0
     7fe:	7202           	moveq #2,d1
     800:	4eae ff3a      	jsr -198(a6)
     804:	2440           	movea.l d0,a2
     806:	23c0 0000 6328 	move.l d0,6328 <Zoom_Source>
  if( Zoom_Source == 0) {
     80c:	508f           	addq.l #8,sp
     80e:	6700 110a      	beq.w 191a <main+0x1914>
    return;
  }

  
  UWORD *tstsource = Zoom_Source;
  *tstsource++ = 0x0000;
     812:	4252           	clr.w (a2)
  *tstsource = 0x0080;
     814:	357c 0080 0002 	move.w #128,2(a2)
  tstsource += ZMLINESIZE/2-1;
  *tstsource = 0x1000;
     81a:	357c 1000 0030 	move.w #4096,48(a2)
  tstsource++;
  *tstsource = 0x8e88;
     820:	357c 8e88 0032 	move.w #-29048,50(a2)
  tstsource += ZMLINESIZE/2-1;

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
  *tstsource++ = 0x0000;
     826:	426a 17d0      	clr.w 6096(a2)
  *tstsource = 0x00ff;
     82a:	357c 00ff 17d2 	move.w #255,6098(a2)

  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 0, 8, 128);
     830:	2439 0000 6358 	move.l 6358 <DrawBuffer>,d2
    srca = source + 1;
     836:	2600           	move.l d0,d3
     838:	5483           	addq.l #2,d3
  WaitBlit();
     83a:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
     840:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     844:	2079 0000 633e 	movea.l 633e <hw>,a0
     84a:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     850:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltafwm = 0xffff;
     856:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     85c:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     862:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     868:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     86e:	317c ff00 0070 	move.w #-256,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     874:	317c 002c 0066 	move.w #44,102(a0)
  *bp = 0;
     87a:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltapt = srca;
     87e:	2143 0050      	move.l d3,80(a0)
  hw->bltbpt = srcb;
     882:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = destination;
     886:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = height*64+2;
     88a:	317c 2002 0058 	move.w #8194,88(a0)
  WaitBlit();
     890:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
     896:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     89a:	2479 0000 6358 	movea.l 6358 <DrawBuffer>,a2
  if( *destination != 0x0180) {
     8a0:	0c6a 0180 0002 	cmpi.w #384,2(a2)
     8a6:	671e           	beq.s 8c6 <main+0x8c0>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
     8a8:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     8ae:	4eae ffc4      	jsr -60(a6)
     8b2:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     8b8:	2200           	move.l d0,d1
     8ba:	243c 0000 3ece 	move.l #16078,d2
     8c0:	761c           	moveq #28,d3
     8c2:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8c6:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
     8cc:	671e           	beq.s 8ec <main+0x8e6>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
     8ce:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     8d4:	4eae ffc4      	jsr -60(a6)
     8d8:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     8de:	2200           	move.l d0,d1
     8e0:	243c 0000 3eeb 	move.l #16107,d2
     8e6:	761c           	moveq #28,d3
     8e8:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     8ec:	2079 0000 6358 	movea.l 6358 <DrawBuffer>,a0
     8f2:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
     8f8:	671e           	beq.s 918 <main+0x912>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
     8fa:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     900:	4eae ffc4      	jsr -60(a6)
     904:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     90a:	2200           	move.l d0,d1
     90c:	243c 0000 3f08 	move.l #16136,d2
     912:	761a           	moveq #26,d3
     914:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     918:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
     91e:	2279 0000 6328 	movea.l 6328 <Zoom_Source>,a1
     924:	203c 0000 c800 	move.l #51200,d0
     92a:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     92e:	2f3c 0001 6800 	move.l #92160,-(sp)
     934:	2f3c 0000 a48c 	move.l #42124,-(sp)
     93a:	2046           	movea.l d6,a0
     93c:	4e90           	jsr (a0)
     93e:	508f           	addq.l #8,sp
}

void TestCopyColumnOfZoom() {

  PrepareDisplayZoom();
     940:	4e93           	jsr (a3)

  UWORD *destination = (UWORD *)DrawBuffer;
     942:	2079 0000 6358 	movea.l 6358 <DrawBuffer>,a0
  *destination= 0x0000;
     948:	4250           	clr.w (a0)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     94a:	317c 000f 0030 	move.w #15,48(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     950:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     956:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
     95c:	203c 0000 c800 	move.l #51200,d0
     962:	7202           	moveq #2,d1
     964:	4eae ff3a      	jsr -198(a6)
     968:	2440           	movea.l d0,a2
     96a:	23c0 0000 6328 	move.l d0,6328 <Zoom_Source>
  if( Zoom_Source == 0) {
     970:	6700 0ffa      	beq.w 196c <main+0x1966>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }

  UWORD *tstsource = Zoom_Source;
  *tstsource = 0xffff;
     974:	34bc ffff      	move.w #-1,(a2)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     978:	357c ffff 0030 	move.w #-1,48(a2)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0xc000;
     97e:	357c c000 47d0 	move.w #-16384,18384(a2)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 1, 1);
     984:	2439 0000 6358 	move.l 6358 <DrawBuffer>,d2
  WaitBlit();
     98a:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
     990:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     994:	2079 0000 633e 	movea.l 633e <hw>,a0
     99a:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     9a0:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     9a6:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     9ac:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     9b2:	317c 002e 0064 	move.w #46,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     9b8:	317c 002e 0062 	move.w #46,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     9be:	317c 002e 0066 	move.w #46,102(a0)
  hw->bltcdat = bltmask;
     9c4:	317c 4000 0070 	move.w #16384,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     9ca:	214a 0050      	move.l a2,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     9ce:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     9d2:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     9d6:	317c 6001 0058 	move.w #24577,88(a0)
  
  WaitBlit();
     9dc:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
     9e2:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     9e6:	2479 0000 6358 	movea.l 6358 <DrawBuffer>,a2
  if( *destination != 0x4000)
     9ec:	0c52 4000      	cmpi.w #16384,(a2)
     9f0:	671e           	beq.s a10 <main+0xa0a>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     9f2:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     9f8:	4eae ffc4      	jsr -60(a6)
     9fc:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     a02:	2200           	move.l d0,d1
     a04:	243c 0000 3f23 	move.l #16163,d2
     a0a:	7629           	moveq #41,d3
     a0c:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x400f)
     a10:	0c6a 400f 0030 	cmpi.w #16399,48(a2)
     a16:	671e           	beq.s a36 <main+0xa30>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     a18:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     a1e:	4eae ffc4      	jsr -60(a6)
     a22:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     a28:	2200           	move.l d0,d1
     a2a:	243c 0000 3f4d 	move.l #16205,d2
     a30:	762a           	moveq #42,d3
     a32:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     a36:	2479 0000 6358 	movea.l 6358 <DrawBuffer>,a2
     a3c:	0c6a 400f 47d0 	cmpi.w #16399,18384(a2)
     a42:	6724           	beq.s a68 <main+0xa62>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     a44:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     a4a:	4eae ffc4      	jsr -60(a6)
     a4e:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     a54:	2200           	move.l d0,d1
     a56:	243c 0000 3f78 	move.l #16248,d2
     a5c:	7628           	moveq #40,d3
     a5e:	4eae ffd0      	jsr -48(a6)
     a62:	2479 0000 6358 	movea.l 6358 <DrawBuffer>,a2

  destination = (UWORD *)DrawBuffer;
  *destination= 0x0000;
     a68:	4252           	clr.w (a2)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     a6a:	357c 000f 0030 	move.w #15,48(a2)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     a70:	357c 000f 47d0 	move.w #15,18384(a2)

  tstsource = Zoom_Source;
     a76:	2679 0000 6328 	movea.l 6328 <Zoom_Source>,a3
  *tstsource = 0xffff;
     a7c:	36bc ffff      	move.w #-1,(a3)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     a80:	377c ffff 0030 	move.w #-1,48(a3)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0x8000;
     a86:	377c 8000 47d0 	move.w #-32768,18384(a3)
  WaitBlit();
     a8c:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
     a92:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     a96:	2079 0000 633e 	movea.l 633e <hw>,a0
     a9c:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     aa2:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     aa8:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     aae:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     ab4:	317c 002e 0064 	move.w #46,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     aba:	317c 002e 0062 	move.w #46,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     ac0:	317c 002e 0066 	move.w #46,102(a0)
  hw->bltcdat = bltmask;
     ac6:	317c 8000 0070 	move.w #-32768,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     acc:	214b 0050      	move.l a3,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     ad0:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     ad4:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     ad8:	317c 6001 0058 	move.w #24577,88(a0)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 0, 0);
  
  WaitBlit();
     ade:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
     ae4:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     ae8:	2479 0000 6358 	movea.l 6358 <DrawBuffer>,a2
  if( *destination != 0x8000)
     aee:	0c52 8000      	cmpi.w #-32768,(a2)
     af2:	671e           	beq.s b12 <main+0xb0c>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     af4:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     afa:	4eae ffc4      	jsr -60(a6)
     afe:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     b04:	2200           	move.l d0,d1
     b06:	243c 0000 3fa1 	move.l #16289,d2
     b0c:	7628           	moveq #40,d3
     b0e:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x800f)
     b12:	0c6a 800f 0030 	cmpi.w #-32753,48(a2)
     b18:	671e           	beq.s b38 <main+0xb32>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     b1a:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     b20:	4eae ffc4      	jsr -60(a6)
     b24:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     b2a:	2200           	move.l d0,d1
     b2c:	243c 0000 3fca 	move.l #16330,d2
     b32:	7629           	moveq #41,d3
     b34:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     b38:	2079 0000 6358 	movea.l 6358 <DrawBuffer>,a0
     b3e:	0c68 800f 47d0 	cmpi.w #-32753,18384(a0)
     b44:	671e           	beq.s b64 <main+0xb5e>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     b46:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     b4c:	4eae ffc4      	jsr -60(a6)
     b50:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     b56:	2200           	move.l d0,d1
     b58:	243c 0000 3ff4 	move.l #16372,d2
     b5e:	7627           	moveq #39,d3
     b60:	4eae ffd0      	jsr -48(a6)

  FreeMem( Zoom_Source, 40*256*5);
     b64:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
     b6a:	2279 0000 6328 	movea.l 6328 <Zoom_Source>,a1
     b70:	203c 0000 c800 	move.l #51200,d0
     b76:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     b7a:	2f3c 0001 6800 	move.l #92160,-(sp)
     b80:	2f3c 0000 a48c 	move.l #42124,-(sp)
     b86:	2046           	movea.l d6,a0
     b88:	4e90           	jsr (a0)
     b8a:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     b8c:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
     b92:	203c 0000 05a0 	move.l #1440,d0
     b98:	7202           	moveq #2,d1
     b9a:	4eae ff3a      	jsr -198(a6)
     b9e:	2440           	movea.l d0,a2
  if( source == 0) {
     ba0:	4a80           	tst.l d0
     ba2:	6700 0d1c      	beq.w 18c0 <main+0x18ba>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     ba6:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
     bac:	203c 0000 05a0 	move.l #1440,d0
     bb2:	7202           	moveq #2,d1
     bb4:	4eae ff3a      	jsr -198(a6)
     bb8:	2640           	movea.l d0,a3
  if( destination == 0) {
     bba:	4a80           	tst.l d0
     bbc:	6700 0d02      	beq.w 18c0 <main+0x18ba>
    return;
  }
  
  UWORD *tmp = source;
  for( int i=0; i<8;i++) {
    *tmp++ = 0;
     bc0:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
     bc2:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
     bc8:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
     bce:	426a 0006      	clr.w 6(a2)
    tmp += ZMLINESIZE/2-3;
    *tmp++ = 0;
     bd2:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
     bd6:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
     bdc:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
     be2:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
     be6:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
     bea:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
     bf0:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
     bf6:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
     bfa:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
     bfe:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
     c04:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
     c0a:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
     c0e:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
     c12:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
     c18:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
     c1e:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
     c22:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
     c26:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
     c2c:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
     c32:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
     c36:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
     c3a:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
     c40:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
     c46:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
     c4a:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
     c4e:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
     c54:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
     c5a:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
     c5e:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
     c62:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
     c68:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
     c6e:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
     c72:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
     c76:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
     c7c:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
     c82:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
     c86:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
     c8a:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
     c90:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
     c96:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
     c9a:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
     c9e:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
     ca4:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
     caa:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
     cae:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
     cb2:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
     cb8:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
     cbe:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
     cc2:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
     cc6:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
     ccc:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
     cd2:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
     cd6:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
     cda:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
     ce0:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
     ce6:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
     cea:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
     cee:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
     cf4:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
     cfa:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
     cfe:	4878 05a0      	pea 5a0 <main+0x59a>
     d02:	42a7           	clr.l -(sp)
     d04:	2f00           	move.l d0,-(sp)
     d06:	4eb9 0000 2f7a 	jsr 2f7a <memset>
  WaitBlit();
     d0c:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
     d12:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     d16:	2079 0000 633e 	movea.l 633e <hw>,a0
     d1c:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     d22:	317c 39f0 0040 	move.w #14832,64(a0)
  hw->bltafwm = 0xffff;
     d28:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     d2e:	317c ffff 0046 	move.w #-1,70(a0)
  *bp = 0;
     d34:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltamod = ZMLINESIZE - 4;
     d38:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     d3e:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
     d44:	200a           	move.l a2,d0
     d46:	5480           	addq.l #2,d0
     d48:	2140 0050      	move.l d0,80(a0)
  hw->bltdpt = (UWORD *) destination;
     d4c:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
     d50:	317c 0402 0058 	move.w #1026,88(a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    *tmp++ = 0;
  }

  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 3, 16);
  WaitBlit();
     d56:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
     d5c:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     d60:	4fef 000c      	lea 12(sp),sp
     d64:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
     d6a:	671e           	beq.s d8a <main+0xd84>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     d6c:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     d72:	4eae ffc4      	jsr -60(a6)
     d76:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     d7c:	2200           	move.l d0,d1
     d7e:	243c 0000 4052 	move.l #16466,d2
     d84:	761f           	moveq #31,d3
     d86:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     d8a:	0c6b aaaa 0032 	cmpi.w #-21846,50(a3)
     d90:	671e           	beq.s db0 <main+0xdaa>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     d92:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     d98:	4eae ffc4      	jsr -60(a6)
     d9c:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
     da2:	2200           	move.l d0,d1
     da4:	243c 0000 4072 	move.l #16498,d2
     daa:	7620           	moveq #32,d3
     dac:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     db0:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
     db6:	224a           	movea.l a2,a1
     db8:	203c 0000 05a0 	move.l #1440,d0
     dbe:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     dc2:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
     dc8:	224b           	movea.l a3,a1
     dca:	203c 0000 05a0 	move.l #1440,d0
     dd0:	4eae ff2e      	jsr -210(a6)
   a    6    6    5    5    5    4    c
*/


void TestZoom4Picture() {
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dd4:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
     dda:	203c 0000 3740 	move.l #14144,d0
     de0:	7202           	moveq #2,d1
     de2:	4eae ff3a      	jsr -198(a6)
     de6:	2440           	movea.l d0,a2
  if( source == 0) {
     de8:	4a80           	tst.l d0
     dea:	6700 0b0c      	beq.w 18f8 <main+0x18f2>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dee:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
     df4:	203c 0000 3740 	move.l #14144,d0
     dfa:	7202           	moveq #2,d1
     dfc:	4eae ff3a      	jsr -198(a6)
     e00:	2b40 ffb0      	move.l d0,-80(a5)
  if( destination == 0) {
     e04:	6700 0bb2      	beq.w 19b8 <main+0x19b2>
     e08:	200a           	move.l a2,d0
     e0a:	0680 0000 3300 	addi.l #13056,d0
     e10:	204a           	movea.l a2,a0
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
     e12:	20bc 5555 5555 	move.l #1431655765,(a0)
     e18:	217c 5555 5555 	move.l #1431655765,4(a0)
     e1e:	0004 
     e20:	217c 5555 5555 	move.l #1431655765,8(a0)
     e26:	0008 
     e28:	217c 5555 5555 	move.l #1431655765,12(a0)
     e2e:	000c 
     e30:	217c 5555 5555 	move.l #1431655765,16(a0)
     e36:	0010 
     e38:	217c 5555 5555 	move.l #1431655765,20(a0)
     e3e:	0014 
     e40:	217c 5555 5555 	move.l #1431655765,24(a0)
     e46:	0018 
     e48:	217c 5555 5555 	move.l #1431655765,28(a0)
     e4e:	001c 
     e50:	217c 5555 5555 	move.l #1431655765,32(a0)
     e56:	0020 
     e58:	217c 5555 5555 	move.l #1431655765,36(a0)
     e5e:	0024 
     e60:	217c 5555 5555 	move.l #1431655765,40(a0)
     e66:	0028 
     e68:	217c 5555 5555 	move.l #1431655765,44(a0)
     e6e:	002c 
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
     e70:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     e76:	0030 
     e78:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     e7e:	0034 
     e80:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     e86:	0038 
     e88:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     e8e:	003c 
     e90:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     e96:	0040 
     e98:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     e9e:	0044 
     ea0:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     ea6:	0048 
     ea8:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     eae:	004c 
     eb0:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     eb6:	0050 
     eb8:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
     ebe:	0054 
     ec0:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
     ec6:	0058 
     ec8:	41e8 0060      	lea 96(a0),a0
     ecc:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     ed2:	fffc 
  for(int i=0;i<128+8;i++) {
     ed4:	b1c0           	cmpa.l d0,a0
     ed6:	6600 ff3a      	bne.w e12 <main+0xe0c>
  }

  Zoom_ZoomIntoPicture( source, destination, 0);
     eda:	42a7           	clr.l -(sp)
     edc:	2f2d ffb0      	move.l -80(a5),-(sp)
     ee0:	2f0a           	move.l a2,-(sp)
     ee2:	4eb9 0000 23de 	jsr 23de <Zoom_ZoomIntoPicture>
  WaitBlit();
     ee8:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
     eee:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
     ef2:	206d ffb0      	movea.l -80(a5),a0
     ef6:	5888           	addq.l #4,a0
     ef8:	2b48 ffa4      	move.l a0,-92(a5)
  UWORD *valsupposed = destlinezoom1;
  UWORD mask = 0x0;
  for(int i=0;i<17;i++) {
     efc:	202d ffb0      	move.l -80(a5),d0
     f00:	0680 0000 02d4 	addi.l #724,d0
     f06:	4fef 000c      	lea 12(sp),sp
  UWORD *valactual = destination+2; 
     f0a:	3c7c 000f      	movea.w #15,a6
  UWORD mask = 0x0;
     f0e:	4242           	clr.w d2
     f10:	7600           	moveq #0,d3
     f12:	49f9 0000 1e76 	lea 1e76 <TestRow.constprop.2>,a4
     f18:	2b4a ffa0      	move.l a2,-96(a5)
     f1c:	2e00           	move.l d0,d7
     f1e:	2647           	movea.l d7,a3
     f20:	47eb fd30      	lea -720(a3),a3
     f24:	45ee fff1      	lea -15(a6),a2
    for(int i2=0;i2<15;i2++) { 
      TestRow( valsupposed, valactual, mask, i2+i*16);
     f28:	2f0a           	move.l a2,-(sp)
     f2a:	2f03           	move.l d3,-(sp)
     f2c:	2f0b           	move.l a3,-(sp)
     f2e:	4e94           	jsr (a4)
      valactual += ZMLINESIZE/2;
     f30:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
     f34:	4642           	not.w d2
     f36:	528a           	addq.l #1,a2
    for(int i2=0;i2<15;i2++) { 
     f38:	4fef 000c      	lea 12(sp),sp
     f3c:	be8b           	cmp.l a3,d7
     f3e:	6600 0912      	bne.w 1852 <main+0x184c>
    }
    TestRow( valsupposed, valactual, mask, 15+i*16);
     f42:	2f0e           	move.l a6,-(sp)
     f44:	7600           	moveq #0,d3
     f46:	3602           	move.w d2,d3
     f48:	2f03           	move.l d3,-(sp)
     f4a:	2f0b           	move.l a3,-(sp)
     f4c:	4e94           	jsr (a4)
    valactual += ZMLINESIZE/2;
     f4e:	2e0b           	move.l a3,d7
     f50:	0687 0000 0300 	addi.l #768,d7
     f56:	4dee 0010      	lea 16(a6),a6
  for(int i=0;i<17;i++) {
     f5a:	4fef 000c      	lea 12(sp),sp
     f5e:	bcfc 011f      	cmpa.w #287,a6
     f62:	66ba           	bne.s f1e <main+0xf18>
     f64:	246d ffa0      	movea.l -96(a5),a2
  
  UWORD *tmp = source;
  source = destination;
  destination = tmp;
  
  Zoom_ZoomIntoPicture( source, destination, 1);
     f68:	4878 0001      	pea 1 <_start+0x1>
     f6c:	2f0a           	move.l a2,-(sp)
     f6e:	2f2d ffb0      	move.l -80(a5),-(sp)
     f72:	4eb9 0000 23de 	jsr 23de <Zoom_ZoomIntoPicture>
  WaitBlit();
     f78:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
     f7e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
     f82:	41ea 0004      	lea 4(a2),a0
     f86:	2b48 ffa0      	move.l a0,-96(a5)
     f8a:	4fef 000c      	lea 12(sp),sp
     f8e:	2848           	movea.l a0,a4
  valsupposed = destlinezoom2;
  mask = 0x0000;
  for(int i2=0;i2<7;i2++) { 
     f90:	7e00           	moveq #0,d7
  mask = 0x0000;
     f92:	4242           	clr.w d2
     f94:	47f9 0000 1d60 	lea 1d60 <TestRow.constprop.3>,a3
    TestRow( valsupposed, valactual, mask, i2);
     f9a:	2f07           	move.l d7,-(sp)
     f9c:	3f02           	move.w d2,-(sp)
     f9e:	4267           	clr.w -(sp)
     fa0:	2f0c           	move.l a4,-(sp)
     fa2:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
     fa4:	49ec 0030      	lea 48(a4),a4
    mask = mask ^ 0xffff;
     fa8:	4642           	not.w d2
  for(int i2=0;i2<7;i2++) { 
     faa:	5287           	addq.l #1,d7
     fac:	4fef 000c      	lea 12(sp),sp
     fb0:	7007           	moveq #7,d0
     fb2:	b087           	cmp.l d7,d0
     fb4:	66e4           	bne.s f9a <main+0xf94>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
     fb6:	4878 0008      	pea 8 <main+0x2>
     fba:	2f3c 0000 ffff 	move.l #65535,-(sp)
     fc0:	486a 0154      	pea 340(a2)
     fc4:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 9);
     fc6:	4878 0009      	pea 9 <main+0x3>
     fca:	2f3c 0000 ffff 	move.l #65535,-(sp)
     fd0:	486a 0184      	pea 388(a2)
     fd4:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 10);
     fd6:	4878 000a      	pea a <main+0x4>
     fda:	42a7           	clr.l -(sp)
     fdc:	486a 01b4      	pea 436(a2)
     fe0:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 11);
     fe2:	4fef 0024      	lea 36(sp),sp
     fe6:	4878 000b      	pea b <main+0x5>
     fea:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
     fec:	41ea 01e4      	lea 484(a2),a0
     ff0:	2b48 ffac      	move.l a0,-84(a5)
  TestRow( valsupposed, valactual, 0x0000, 11);
     ff4:	2f08           	move.l a0,-(sp)
     ff6:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  
  for(int i=0;i<15;i++) {
     ff8:	220a           	move.l a2,d1
     ffa:	0681 0000 0484 	addi.l #1156,d1
    1000:	4fef 000c      	lea 12(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
    1004:	3c7c 0018      	movea.w #24,a6
    1008:	7600           	moveq #0,d3
    100a:	3602           	move.w d2,d3
    100c:	2b4a ffa8      	move.l a2,-88(a5)
    1010:	2441           	movea.l d1,a2
    1012:	49ea fd90      	lea -624(a2),a4
    1016:	41ee fff3      	lea -13(a6),a0
    101a:	2b48 ff9c      	move.l a0,-100(a5)
    101e:	2e03           	move.l d3,d7
    for(int i2=0;i2<13;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    1020:	2f2d ff9c      	move.l -100(a5),-(sp)
    1024:	2f07           	move.l d7,-(sp)
    1026:	2f0c           	move.l a4,-(sp)
    1028:	4e93           	jsr (a3)
      valactual += ZMLINESIZE/2;
    102a:	49ec 0030      	lea 48(a4),a4
      mask = mask ^ 0xffff;
    102e:	4642           	not.w d2
    1030:	52ad ff9c      	addq.l #1,-100(a5)
    for(int i2=0;i2<13;i2++) {  
    1034:	4fef 000c      	lea 12(sp),sp
    1038:	b5cc           	cmpa.l a4,a2
    103a:	6720           	beq.s 105c <main+0x1056>
    103c:	7e00           	moveq #0,d7
    103e:	3e02           	move.w d2,d7
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    1040:	2f2d ff9c      	move.l -100(a5),-(sp)
    1044:	2f07           	move.l d7,-(sp)
    1046:	2f0c           	move.l a4,-(sp)
    1048:	4e93           	jsr (a3)
      valactual += ZMLINESIZE/2;
    104a:	49ec 0030      	lea 48(a4),a4
      mask = mask ^ 0xffff;
    104e:	4642           	not.w d2
    1050:	52ad ff9c      	addq.l #1,-100(a5)
    for(int i2=0;i2<13;i2++) {  
    1054:	4fef 000c      	lea 12(sp),sp
    1058:	b5cc           	cmpa.l a4,a2
    105a:	66e0           	bne.s 103c <main+0x1036>
    }

    TestRow( valsupposed, valactual, mask, i*17+11+13);
    105c:	7600           	moveq #0,d3
    105e:	3602           	move.w d2,d3
    1060:	2f0e           	move.l a6,-(sp)
    1062:	2f03           	move.l d3,-(sp)
    1064:	2f0c           	move.l a4,-(sp)
    1066:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    1068:	486e 0001      	pea 1(a6)
    106c:	2f03           	move.l d3,-(sp)
    106e:	486c 0030      	pea 48(a4)
    1072:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    1074:	486e 0002      	pea 2(a6)
    1078:	2f07           	move.l d7,-(sp)
    107a:	486c 0060      	pea 96(a4)
    107e:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    1080:	4fef 0024      	lea 36(sp),sp
    1084:	486e 0003      	pea 3(a6)
    1088:	2f07           	move.l d7,-(sp)
    108a:	486c 0090      	pea 144(a4)
    108e:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1090:	45ec 0330      	lea 816(a4),a2
    1094:	4dee 0011      	lea 17(a6),a6
  for(int i=0;i<15;i++) {
    1098:	4fef 000c      	lea 12(sp),sp
    109c:	bcfc 0117      	cmpa.w #279,a6
    10a0:	6600 ff70      	bne.w 1012 <main+0x100c>
    10a4:	246d ffa8      	movea.l -88(a5),a2
    10a8:	49ea 31e4      	lea 12772(a2),a4
  }

  for(int i2=0;i2<6;i2++) { 
    10ac:	7e00           	moveq #0,d7
    TestRow( valsupposed, valactual, mask, i2);
    10ae:	2f07           	move.l d7,-(sp)
    10b0:	2f03           	move.l d3,-(sp)
    10b2:	2f0c           	move.l a4,-(sp)
    10b4:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    10b6:	49ec 0030      	lea 48(a4),a4
    mask = mask ^ 0xffff;
    10ba:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) { 
    10bc:	5287           	addq.l #1,d7
    10be:	4fef 000c      	lea 12(sp),sp
    10c2:	7006           	moveq #6,d0
    10c4:	b087           	cmp.l d7,d0
    10c6:	671e           	beq.s 10e6 <main+0x10e0>
    10c8:	7600           	moveq #0,d3
    10ca:	3602           	move.w d2,d3
    TestRow( valsupposed, valactual, mask, i2);
    10cc:	2f07           	move.l d7,-(sp)
    10ce:	2f03           	move.l d3,-(sp)
    10d0:	2f0c           	move.l a4,-(sp)
    10d2:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    10d4:	49ec 0030      	lea 48(a4),a4
    mask = mask ^ 0xffff;
    10d8:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) { 
    10da:	5287           	addq.l #1,d7
    10dc:	4fef 000c      	lea 12(sp),sp
    10e0:	7006           	moveq #6,d0
    10e2:	b087           	cmp.l d7,d0
    10e4:	66e2           	bne.s 10c8 <main+0x10c2>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 2);
    10e6:	4878 0002      	pea 2 <_start+0x2>
    10ea:	2f2d ffb0      	move.l -80(a5),-(sp)
    10ee:	2f0a           	move.l a2,-(sp)
    10f0:	4eb9 0000 23de 	jsr 23de <Zoom_ZoomIntoPicture>
  WaitBlit();
    10f6:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    10fc:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom3;
  mask = 0x0000;
  
  TestRow( valsupposed, valactual, 0xffff, 0);
    1100:	42a7           	clr.l -(sp)
    1102:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1108:	2f2d ffa4      	move.l -92(a5),-(sp)
    110c:	47f9 0000 1c4a 	lea 1c4a <TestRow.constprop.4>,a3
    1112:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 1);
    1114:	4878 0001      	pea 1 <_start+0x1>
    1118:	42a7           	clr.l -(sp)
    111a:	206d ffb0      	movea.l -80(a5),a0
    111e:	4868 0034      	pea 52(a0)
    1122:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 2);
    1124:	4fef 0024      	lea 36(sp),sp
    1128:	4878 0002      	pea 2 <_start+0x2>
    112c:	42a7           	clr.l -(sp)
    112e:	206d ffb0      	movea.l -80(a5),a0
    1132:	4868 0064      	pea 100(a0)
    1136:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 3);
    1138:	4878 0003      	pea 3 <_start+0x3>
    113c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1142:	206d ffb0      	movea.l -80(a5),a0
    1146:	4868 0094      	pea 148(a0)
    114a:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 4);
    114c:	4878 0004      	pea 4 <_start+0x4>
    1150:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1156:	206d ffb0      	movea.l -80(a5),a0
    115a:	4868 00c4      	pea 196(a0)
    115e:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  for(int i=0;i<14;i++) {
    1160:	222d ffb0      	move.l -80(a5),d1
    1164:	0681 0000 0334 	addi.l #820,d1
    116a:	4fef 0024      	lea 36(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 4);
    116e:	3c7c 0011      	movea.w #17,a6
    1172:	7400           	moveq #0,d2
    1174:	76ff           	moveq #-1,d3
    1176:	2b4a ffa4      	move.l a2,-92(a5)
    117a:	2441           	movea.l d1,a2
    117c:	2b6d ffb0 ffa8 	move.l -80(a5),-88(a5)
    1182:	49ea fdc0      	lea -576(a2),a4
    1186:	41ee fff4      	lea -12(a6),a0
    118a:	2b48 ffb0      	move.l a0,-80(a5)
    for(int i2=0;i2<12;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*18+5);
    118e:	2f2d ffb0      	move.l -80(a5),-(sp)
    1192:	2f02           	move.l d2,-(sp)
    1194:	2f0c           	move.l a4,-(sp)
    1196:	4e93           	jsr (a3)
      valactual += ZMLINESIZE/2;
    1198:	49ec 0030      	lea 48(a4),a4
      mask = mask ^ 0xffff;
    119c:	52ad ffb0      	addq.l #1,-80(a5)
    for(int i2=0;i2<12;i2++) {  
    11a0:	4fef 000c      	lea 12(sp),sp
    11a4:	b5cc           	cmpa.l a4,a2
    11a6:	6720           	beq.s 11c8 <main+0x11c2>
    11a8:	7400           	moveq #0,d2
    11aa:	3403           	move.w d3,d2
    11ac:	4643           	not.w d3
      TestRow( valsupposed, valactual, mask, i2+i*18+5);
    11ae:	2f2d ffb0      	move.l -80(a5),-(sp)
    11b2:	2f02           	move.l d2,-(sp)
    11b4:	2f0c           	move.l a4,-(sp)
    11b6:	4e93           	jsr (a3)
      valactual += ZMLINESIZE/2;
    11b8:	49ec 0030      	lea 48(a4),a4
      mask = mask ^ 0xffff;
    11bc:	52ad ffb0      	addq.l #1,-80(a5)
    for(int i2=0;i2<12;i2++) {  
    11c0:	4fef 000c      	lea 12(sp),sp
    11c4:	b5cc           	cmpa.l a4,a2
    11c6:	66e0           	bne.s 11a8 <main+0x11a2>
    }

    TestRow( valsupposed, valactual, mask, i*18+5+12);
    11c8:	7e00           	moveq #0,d7
    11ca:	3e03           	move.w d3,d7
    11cc:	2f0e           	move.l a6,-(sp)
    11ce:	2f07           	move.l d7,-(sp)
    11d0:	2f0c           	move.l a4,-(sp)
    11d2:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*18+5+13);
    11d4:	486e 0001      	pea 1(a6)
    11d8:	2f07           	move.l d7,-(sp)
    11da:	486c 0030      	pea 48(a4)
    11de:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*18+5+14);
    11e0:	486e 0002      	pea 2(a6)
    11e4:	2f02           	move.l d2,-(sp)
    11e6:	486c 0060      	pea 96(a4)
    11ea:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*18+5+15);
    11ec:	4fef 0024      	lea 36(sp),sp
    11f0:	486e 0003      	pea 3(a6)
    11f4:	2f02           	move.l d2,-(sp)
    11f6:	486c 0090      	pea 144(a4)
    11fa:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*18+5+16);
    11fc:	486e 0004      	pea 4(a6)
    1200:	2f07           	move.l d7,-(sp)
    1202:	486c 00c0      	pea 192(a4)
    1206:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*18+5+17);
    1208:	486e 0005      	pea 5(a6)
    120c:	2f07           	move.l d7,-(sp)
    120e:	486c 00f0      	pea 240(a4)
    1212:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1214:	45ec 0360      	lea 864(a4),a2
    1218:	4dee 0012      	lea 18(a6),a6
  for(int i=0;i<14;i++) {
    121c:	4fef 0024      	lea 36(sp),sp
    1220:	bcfc 010d      	cmpa.w #269,a6
    1224:	6600 ff5c      	bne.w 1182 <main+0x117c>
    1228:	246d ffa4      	movea.l -92(a5),a2
    122c:	2b6d ffa8 ffb0 	move.l -88(a5),-80(a5)
    1232:	2c6d ffb0      	movea.l -80(a5),a6
    1236:	4dee 3034      	lea 12340(a6),a6
    123a:	387c 0101      	movea.w #257,a4
  }

  for(int i2=0;i2<12;i2++) {  
    TestRow( valsupposed, valactual, mask, i2+14*18+5);
    123e:	2f0c           	move.l a4,-(sp)
    1240:	2f02           	move.l d2,-(sp)
    1242:	2f0e           	move.l a6,-(sp)
    1244:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    1246:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    124a:	528c           	addq.l #1,a4
  for(int i2=0;i2<12;i2++) {  
    124c:	4fef 000c      	lea 12(sp),sp
    1250:	b8fc 010d      	cmpa.w #269,a4
    1254:	671e           	beq.s 1274 <main+0x126e>
    1256:	7400           	moveq #0,d2
    1258:	3403           	move.w d3,d2
    125a:	4643           	not.w d3
    TestRow( valsupposed, valactual, mask, i2+14*18+5);
    125c:	2f0c           	move.l a4,-(sp)
    125e:	2f02           	move.l d2,-(sp)
    1260:	2f0e           	move.l a6,-(sp)
    1262:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    1264:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1268:	528c           	addq.l #1,a4
  for(int i2=0;i2<12;i2++) {  
    126a:	4fef 000c      	lea 12(sp),sp
    126e:	b8fc 010d      	cmpa.w #269,a4
    1272:	66e2           	bne.s 1256 <main+0x1250>
    1274:	7e00           	moveq #0,d7
    1276:	3e03           	move.w d3,d7
  }
  
  TestRow( valsupposed, valactual, mask, 14*18+5+12);
    1278:	2f0c           	move.l a4,-(sp)
    127a:	2f07           	move.l d7,-(sp)
    127c:	206d ffb0      	movea.l -80(a5),a0
    1280:	4868 3274      	pea 12916(a0)
    1284:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 14*18+5+13);
    1286:	4878 010e      	pea 10e <main+0x108>
    128a:	2f07           	move.l d7,-(sp)
    128c:	206d ffb0      	movea.l -80(a5),a0
    1290:	4868 32a4      	pea 12964(a0)
    1294:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 14*18+5+14);
    1296:	4878 010f      	pea 10f <main+0x109>
    129a:	2f02           	move.l d2,-(sp)
    129c:	206d ffb0      	movea.l -80(a5),a0
    12a0:	4868 32d4      	pea 13012(a0)
    12a4:	4e93           	jsr (a3)
  tmp = source;
  source = destination;
  destination = tmp;
  
  UWORD *bp = (UWORD *)0x200;
  *bp = 0;
    12a6:	4278 0200      	clr.w 200 <main+0x1fa>
  Zoom_ZoomIntoPicture( source, destination, 3);
    12aa:	4fef 0024      	lea 36(sp),sp
    12ae:	4878 0003      	pea 3 <_start+0x3>
    12b2:	2f0a           	move.l a2,-(sp)
    12b4:	2f2d ffb0      	move.l -80(a5),-(sp)
    12b8:	4eb9 0000 23de 	jsr 23de <Zoom_ZoomIntoPicture>
  WaitBlit();
    12be:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    12c4:	4eae ff1c      	jsr -228(a6)
    12c8:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
  valsupposed = destlinezoom4;
  mask = 0x0000;
  
  for(int i2=0;i2<10;i2++) {  
    12cc:	7400           	moveq #0,d2
  mask = 0x0000;
    12ce:	4247           	clr.w d7
    12d0:	47f9 0000 1b34 	lea 1b34 <TestRow.constprop.5>,a3
    12d6:	286d ffa0      	movea.l -96(a5),a4
    TestRow( valsupposed, valactual, mask, i2);
    12da:	2f02           	move.l d2,-(sp)
    12dc:	3f07           	move.w d7,-(sp)
    12de:	4267           	clr.w -(sp)
    12e0:	2f0c           	move.l a4,-(sp)
    12e2:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    12e4:	49ec 0030      	lea 48(a4),a4
    mask = mask ^ 0xffff;
    12e8:	4647           	not.w d7
  for(int i2=0;i2<10;i2++) {  
    12ea:	5282           	addq.l #1,d2
    12ec:	4fef 000c      	lea 12(sp),sp
    12f0:	700a           	moveq #10,d0
    12f2:	b082           	cmp.l d2,d0
    12f4:	66e4           	bne.s 12da <main+0x12d4>
    12f6:	286d ffac      	movea.l -84(a5),a4
    12fa:	307c 0009      	movea.w #9,a0
    12fe:	2b48 ffa4      	move.l a0,-92(a5)
  }
  
  mask = 0;
    1302:	4243           	clr.w d3
    1304:	2b4a ffa0      	move.l a2,-96(a5)
    1308:	3443           	movea.w d3,a2
  for(int i=0;i<13;i++) {  
    TestRow( valsupposed, valactual, mask, 0+9+i*19);
    130a:	7400           	moveq #0,d2
    130c:	340a           	move.w a2,d2
    130e:	2f2d ffa4      	move.l -92(a5),-(sp)
    1312:	2f02           	move.l d2,-(sp)
    1314:	2f0c           	move.l a4,-(sp)
    1316:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    1318:	2e0c           	move.l a4,d7
    TestRow( valsupposed, valactual, mask, 1+9+i*19);
    131a:	206d ffa4      	movea.l -92(a5),a0
    131e:	4868 0001      	pea 1(a0)
    1322:	2f02           	move.l d2,-(sp)
    1324:	486c 0030      	pea 48(a4)
    1328:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    132a:	300a           	move.w a2,d0
    132c:	4640           	not.w d0
    132e:	3c40           	movea.w d0,a6
    TestRow( valsupposed, valactual, mask, 2+9+i*19);
    1330:	7600           	moveq #0,d3
    1332:	3600           	move.w d0,d3
    1334:	206d ffa4      	movea.l -92(a5),a0
    1338:	4868 0002      	pea 2(a0)
    133c:	2f03           	move.l d3,-(sp)
    133e:	486c 0060      	pea 96(a4)
    1342:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 3+9+i*19);
    1344:	4fef 0024      	lea 36(sp),sp
    1348:	206d ffa4      	movea.l -92(a5),a0
    134c:	4868 0003      	pea 3(a0)
    1350:	2f03           	move.l d3,-(sp)
    1352:	486c 0090      	pea 144(a4)
    1356:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, 4+9+i*19);
    1358:	206d ffa4      	movea.l -92(a5),a0
    135c:	4868 0004      	pea 4(a0)
    1360:	2f02           	move.l d2,-(sp)
    1362:	486c 00c0      	pea 192(a4)
    1366:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 5+9+i*19);
    1368:	206d ffa4      	movea.l -92(a5),a0
    136c:	4868 0005      	pea 5(a0)
    1370:	2f02           	move.l d2,-(sp)
    1372:	486c 00f0      	pea 240(a4)
    1376:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, 6+9+i*19);
    1378:	4fef 0024      	lea 36(sp),sp
    137c:	206d ffa4      	movea.l -92(a5),a0
    1380:	4868 0006      	pea 6(a0)
    1384:	2f03           	move.l d3,-(sp)
    1386:	486c 0120      	pea 288(a4)
    138a:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 7+9+i*19);
    138c:	206d ffa4      	movea.l -92(a5),a0
    1390:	4868 0007      	pea 7(a0)
    1394:	2f03           	move.l d3,-(sp)
    1396:	486c 0150      	pea 336(a4)
    139a:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    for(int i2=0;i2<11;i2++) {  
    139c:	4fef 0018      	lea 24(sp),sp
    TestRow( valsupposed, valactual, mask, 7+9+i*19);
    13a0:	262d ffa4      	move.l -92(a5),d3
    13a4:	0687 0000 0390 	addi.l #912,d7
    13aa:	49ec 0180      	lea 384(a4),a4
      TestRow( valsupposed, valactual, mask, i2+i*19+9);
    13ae:	2f03           	move.l d3,-(sp)
    13b0:	2f02           	move.l d2,-(sp)
    13b2:	2f0c           	move.l a4,-(sp)
    13b4:	4e93           	jsr (a3)
      valactual += ZMLINESIZE/2;
    13b6:	49ec 0030      	lea 48(a4),a4
      mask = mask ^ 0xffff;
    13ba:	344e           	movea.w a6,a2
    13bc:	5283           	addq.l #1,d3
    for(int i2=0;i2<11;i2++) {  
    13be:	4fef 000c      	lea 12(sp),sp
    13c2:	be8c           	cmp.l a4,d7
    13c4:	6722           	beq.s 13e8 <main+0x13e2>
    13c6:	7400           	moveq #0,d2
    13c8:	340e           	move.w a6,d2
    13ca:	300e           	move.w a6,d0
    13cc:	4640           	not.w d0
    13ce:	3c40           	movea.w d0,a6
      TestRow( valsupposed, valactual, mask, i2+i*19+9);
    13d0:	2f03           	move.l d3,-(sp)
    13d2:	2f02           	move.l d2,-(sp)
    13d4:	2f0c           	move.l a4,-(sp)
    13d6:	4e93           	jsr (a3)
      valactual += ZMLINESIZE/2;
    13d8:	49ec 0030      	lea 48(a4),a4
      mask = mask ^ 0xffff;
    13dc:	344e           	movea.w a6,a2
    13de:	5283           	addq.l #1,d3
    for(int i2=0;i2<11;i2++) {  
    13e0:	4fef 000c      	lea 12(sp),sp
    13e4:	be8c           	cmp.l a4,d7
    13e6:	66de           	bne.s 13c6 <main+0x13c0>
    13e8:	7013           	moveq #19,d0
    13ea:	d1ad ffa4      	add.l d0,-92(a5)
  for(int i=0;i<13;i++) {  
    13ee:	0cad 0000 0100 	cmpi.l #256,-92(a5)
    13f4:	ffa4 
    13f6:	6600 ff12      	bne.w 130a <main+0x1304>
    13fa:	360e           	move.w a6,d3
    13fc:	246d ffa0      	movea.l -96(a5),a2
    }
  }

  TestRow( valsupposed, valactual, 0xffff, 0+9+19*13);
    1400:	2f2d ffa4      	move.l -92(a5),-(sp)
    1404:	2f3c 0000 ffff 	move.l #65535,-(sp)
    140a:	486a 3034      	pea 12340(a2)
    140e:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 1+9+13*19);
    1410:	4878 0101      	pea 101 <main+0xfb>
    1414:	2f3c 0000 ffff 	move.l #65535,-(sp)
    141a:	486a 3064      	pea 12388(a2)
    141e:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 2+9+13*19);
    1420:	4878 0102      	pea 102 <main+0xfc>
    1424:	42a7           	clr.l -(sp)
    1426:	486a 3094      	pea 12436(a2)
    142a:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 3+9+13*19);
    142c:	4fef 0024      	lea 36(sp),sp
    1430:	4878 0103      	pea 103 <main+0xfd>
    1434:	42a7           	clr.l -(sp)
    1436:	486a 30c4      	pea 12484(a2)
    143a:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 4+9+13*19);
    143c:	4878 0104      	pea 104 <main+0xfe>
    1440:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1446:	486a 30f4      	pea 12532(a2)
    144a:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 5+9+13*19);
    144c:	4878 0105      	pea 105 <main+0xff>
    1450:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1456:	486a 3124      	pea 12580(a2)
    145a:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 6+9+13*19);
    145c:	4fef 0024      	lea 36(sp),sp
    1460:	4878 0106      	pea 106 <main+0x100>
    1464:	42a7           	clr.l -(sp)
    1466:	486a 3154      	pea 12628(a2)
    146a:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 7+9+13*19);
    146c:	4878 0107      	pea 107 <main+0x101>
    1470:	42a7           	clr.l -(sp)
    1472:	486a 3184      	pea 12676(a2)
    1476:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2; 
    1478:	45ea 31b4      	lea 12724(a2),a2
    147c:	4fef 0018      	lea 24(sp),sp
    1480:	243c 0000 0108 	move.l #264,d2

  for(int i2=0;i2<7;i2++) {  
    TestRow( valsupposed, valactual, mask, i2+8+9+13*19);
    1486:	2f02           	move.l d2,-(sp)
    1488:	3f03           	move.w d3,-(sp)
    148a:	4267           	clr.w -(sp)
    148c:	2f0a           	move.l a2,-(sp)
    148e:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    1490:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    1494:	4643           	not.w d3
    1496:	5282           	addq.l #1,d2
  for(int i2=0;i2<7;i2++) {  
    1498:	4fef 000c      	lea 12(sp),sp
    149c:	0c82 0000 010f 	cmpi.l #271,d2
    14a2:	66e2           	bne.s 1486 <main+0x1480>
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
    14a4:	4eb9 0000 2cf2 	jsr 2cf2 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    14aa:	4878 0010      	pea 10 <main+0xa>
    14ae:	4879 0000 61f8 	pea 61f8 <ClsSprites>
    14b4:	42a7           	clr.l -(sp)
    14b6:	2f39 0000 6364 	move.l 6364 <Copperlist1>,-(sp)
    14bc:	2044           	movea.l d4,a0
    14be:	4e90           	jsr (a0)
    14c0:	4fef 0010      	lea 16(sp),sp
    14c4:	4a80           	tst.l d0
    14c6:	661e           	bne.s 14e6 <main+0x14e0>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    14c8:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    14ce:	4eae ffc4      	jsr -60(a6)
    14d2:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    14d8:	2200           	move.l d0,d1
    14da:	243c 0000 3d60 	move.l #15712,d2
    14e0:	762c           	moveq #44,d3
    14e2:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    14e6:	4878 000c      	pea c <main+0x6>
    14ea:	4879 0000 61c8 	pea 61c8 <ClScreen>
    14f0:	4878 0010      	pea 10 <main+0xa>
    14f4:	2f39 0000 6364 	move.l 6364 <Copperlist1>,-(sp)
    14fa:	2044           	movea.l d4,a0
    14fc:	4e90           	jsr (a0)
    14fe:	4fef 0010      	lea 16(sp),sp
    1502:	4a80           	tst.l d0
    1504:	661e           	bne.s 1524 <main+0x151e>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    1506:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    150c:	4eae ffc4      	jsr -60(a6)
    1510:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1516:	2200           	move.l d0,d1
    1518:	243c 0000 3d96 	move.l #15766,d2
    151e:	7636           	moveq #54,d3
    1520:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    1524:	4878 0002      	pea 2 <_start+0x2>
    1528:	4879 0000 61c0 	pea 61c0 <ClColor>
    152e:	4878 001e      	pea 1e <main+0x18>
    1532:	2f39 0000 6364 	move.l 6364 <Copperlist1>,-(sp)
    1538:	2044           	movea.l d4,a0
    153a:	4e90           	jsr (a0)
    153c:	4fef 0010      	lea 16(sp),sp
    1540:	4a80           	tst.l d0
    1542:	661e           	bne.s 1562 <main+0x155c>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1544:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    154a:	4eae ffc4      	jsr -60(a6)
    154e:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1554:	2200           	move.l d0,d1
    1556:	243c 0000 3b43 	move.l #15171,d2
    155c:	7621           	moveq #33,d3
    155e:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    1562:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdcd49>
    1566:	4878 0020      	pea 20 <main+0x1a>
    156a:	2f39 0000 6364 	move.l 6364 <Copperlist1>,-(sp)
    1570:	2045           	movea.l d5,a0
    1572:	4e90           	jsr (a0)
    1574:	4fef 000c      	lea 12(sp),sp
    1578:	4a80           	tst.l d0
    157a:	661e           	bne.s 159a <main+0x1594>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    157c:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1582:	4eae ffc4      	jsr -60(a6)
    1586:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    158c:	2200           	move.l d0,d1
    158e:	243c 0000 3b65 	move.l #15205,d2
    1594:	7622           	moveq #34,d3
    1596:	4eae ffd0      	jsr -48(a6)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    159a:	2479 0000 6358 	movea.l 6358 <DrawBuffer>,a2
    15a0:	4879 0000 410c 	pea 410c <rundemo.c.d99b7c69+0x473>
    15a6:	2f0a           	move.l a2,-(sp)
    15a8:	4eb9 0000 19dc 	jsr 19dc <WriteFont.constprop.6>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    15ae:	508f           	addq.l #8,sp
    15b0:	0c52 ff00      	cmpi.w #-256,(a2)
    15b4:	671e           	beq.s 15d4 <main+0x15ce>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    15b6:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    15bc:	4eae ffc4      	jsr -60(a6)
    15c0:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    15c6:	2200           	move.l d0,d1
    15c8:	243c 0000 411d 	move.l #16669,d2
    15ce:	7631           	moveq #49,d3
    15d0:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    15d4:	2f3c 0000 c800 	move.l #51200,-(sp)
    15da:	4878 0084      	pea 84 <main+0x7e>
    15de:	2046           	movea.l d6,a0
    15e0:	4e90           	jsr (a0)
  RunTests();
	Delay(50);
    15e2:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    15e8:	7232           	moveq #50,d1
    15ea:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    15ee:	247c 00f0 ff60 	movea.l #15794016,a2
    15f4:	508f           	addq.l #8,sp
    15f6:	4a92           	tst.l (a2)
    15f8:	6718           	beq.s 1612 <main+0x160c>
    15fa:	4878 0001      	pea 1 <_start+0x1>
    15fe:	47f9 0000 1a2a 	lea 1a2a <warpmode.part.0>,a3
    1604:	4e93           	jsr (a3)
    1606:	588f           	addq.l #4,sp
    1608:	4a92           	tst.l (a2)
    160a:	6706           	beq.s 1612 <main+0x160c>
    160c:	42a7           	clr.l -(sp)
    160e:	4e93           	jsr (a3)
    1610:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    1612:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    1618:	23ee 0022 0000 	move.l 34(a6),632c <ActiView>
    161e:	632c 
	OwnBlitter();
    1620:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    1624:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    162a:	4eae ff1c      	jsr -228(a6)
	Disable();
    162e:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    1634:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    1638:	2679 0000 633e 	movea.l 633e <hw>,a3
    163e:	302b 0010      	move.w 16(a3),d0
    1642:	33c0 0000 6330 	move.w d0,6330 <SystemADKCON>
	SystemInts=hw->intenar;
    1648:	302b 001c      	move.w 28(a3),d0
    164c:	33c0 0000 6334 	move.w d0,6334 <SystemInts>
	SystemDMA=hw->dmaconr;
    1652:	302b 0002      	move.w 2(a3),d0
    1656:	33c0 0000 6332 	move.w d0,6332 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    165c:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    1662:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
    1668:	45f9 0000 2ea2 	lea 2ea2 <WaitVbl>,a2
    166e:	4e92           	jsr (a2)
	WaitVbl();
    1670:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
    1672:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    1678:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    167e:	93c9           	suba.l a1,a1
    1680:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    1684:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    168a:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    168e:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    1694:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    1698:	4e92           	jsr (a2)
	WaitVbl();
    169a:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    169c:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
    16a2:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
    16a8:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    16ae:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    16b4:	082e 0000 0129 	btst #0,297(a6)
    16ba:	6700 02d2      	beq.w 198e <main+0x1988>
		vbr = (APTR)Supervisor((void*)getvbr);
    16be:	7ec0           	moveq #-64,d7
    16c0:	de8d           	add.l a5,d7
    16c2:	cf8d           	exg d7,a5
    16c4:	4eae ffe2      	jsr -30(a6)
    16c8:	cf8d           	exg d7,a5

	VBR=GetVBR();
    16ca:	23c0 0000 6336 	move.l d0,6336 <VBR.lto_priv.7>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    16d0:	2079 0000 6336 	movea.l 6336 <VBR.lto_priv.7>,a0
    16d6:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    16da:	23c2 0000 633a 	move.l d2,633a <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    16e0:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
    16e2:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    16e4:	2079 0000 633e 	movea.l 633e <hw>,a0
    16ea:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    16ee:	3028 0002      	move.w 2(a0),d0
    16f2:	0800 000e      	btst #14,d0
    16f6:	66f6           	bne.s 16ee <main+0x16e8>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    16f8:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    16fe:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    1704:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    170a:	2279 0000 6336 	movea.l 6336 <VBR.lto_priv.7>,a1
    1710:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    1714:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    171a:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    1720:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    1726:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    172c:	3039 0000 6334 	move.w 6334 <SystemInts>,d0
    1732:	0040 8000      	ori.w #-32768,d0
    1736:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    173a:	3039 0000 6332 	move.w 6332 <SystemDMA>,d0
    1740:	0040 8000      	ori.w #-32768,d0
    1744:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    1748:	3039 0000 6330 	move.w 6330 <SystemADKCON>,d0
    174e:	0040 8000      	ori.w #-32768,d0
    1752:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    1756:	2279 0000 632c 	movea.l 632c <ActiView>,a1
    175c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    1760:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    1766:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    176a:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    1770:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    1774:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    177a:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    177e:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    1784:	4eae fe32      	jsr -462(a6)
	Enable();
    1788:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    178e:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    1792:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    1798:	2279 0000 6368 	movea.l 6368 <DOSBase>,a1
    179e:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    17a2:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    17a8:	2279 0000 6342 	movea.l 6342 <GfxBase>,a1
    17ae:	4eae fe62      	jsr -414(a6)
}
    17b2:	7000           	moveq #0,d0
    17b4:	4ced 5cfc ff74 	movem.l -140(a5),d2-d7/a2-a4/a6
    17ba:	4e5d           	unlk a5
    17bc:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    17be:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    17c4:	4eae ffc4      	jsr -60(a6)
    17c8:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    17ce:	2200           	move.l d0,d1
    17d0:	243c 0000 3d60 	move.l #15712,d2
    17d6:	762c           	moveq #44,d3
    17d8:	4eae ffd0      	jsr -48(a6)
    17dc:	6000 e9ca      	bra.w 1a8 <main+0x1a2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    17e0:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    17e6:	4eae ffc4      	jsr -60(a6)
    17ea:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    17f0:	2200           	move.l d0,d1
    17f2:	243c 0000 3b43 	move.l #15171,d2
    17f8:	7621           	moveq #33,d3
    17fa:	4eae ffd0      	jsr -48(a6)
    17fe:	2079 0000 6364 	movea.l 6364 <Copperlist1>,a0
    1804:	6000 eb16      	bra.w 31c <main+0x316>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    1808:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    180e:	4eae ffc4      	jsr -60(a6)
    1812:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1818:	2200           	move.l d0,d1
    181a:	243c 0000 3d96 	move.l #15766,d2
    1820:	7636           	moveq #54,d3
    1822:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    1826:	23fc 0004 0000 	move.l #262144,6358 <DrawBuffer>
    182c:	0000 6358 
  ViewBuffer = (ULONG *)0x50000;
    1830:	23fc 0005 0000 	move.l #327680,634c <ViewBuffer>
    1836:	0000 634c 
  SetBplPointers();
    183a:	45f9 0000 2cc6 	lea 2cc6 <SetBplPointers>,a2
    1840:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    1842:	0cb9 0005 0000 	cmpi.l #327680,6358 <DrawBuffer>
    1848:	0000 6358 
    184c:	6600 ea32      	bne.w 280 <main+0x27a>
    1850:	6008           	bra.s 185a <main+0x1854>
    1852:	7600           	moveq #0,d3
    1854:	3602           	move.w d2,d3
    1856:	6000 f6d0      	bra.w f28 <main+0xf22>
    185a:	0cb9 0004 0000 	cmpi.l #262144,634c <ViewBuffer>
    1860:	0000 634c 
    1864:	6700 ea38      	beq.w 29e <main+0x298>
    Write( Output(), 
    1868:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    186e:	4eae ffc4      	jsr -60(a6)
    1872:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1878:	2200           	move.l d0,d1
    187a:	243c 0000 3a8d 	move.l #14989,d2
    1880:	763b           	moveq #59,d3
    1882:	4eae ffd0      	jsr -48(a6)
    1886:	6000 ea16      	bra.w 29e <main+0x298>
		Exit(0);
    188a:	9dce           	suba.l a6,a6
    188c:	7200           	moveq #0,d1
    188e:	4eae ff70      	jsr -144(a6)
    1892:	6000 e7c0      	bra.w 54 <main+0x4e>
		Exit(0);
    1896:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    189c:	7200           	moveq #0,d1
    189e:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    18a2:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    18a8:	43f9 0000 3a52 	lea 3a52 <incbin_swfont_end+0x124>,a1
    18ae:	7000           	moveq #0,d0
    18b0:	4eae fdd8      	jsr -552(a6)
    18b4:	23c0 0000 6368 	move.l d0,6368 <DOSBase>
	if (!DOSBase)
    18ba:	6600 e798      	bne.w 54 <main+0x4e>
    18be:	60ca           	bra.s 188a <main+0x1884>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    18c0:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    18c6:	4eae ffc4      	jsr -60(a6)
    18ca:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    18d0:	2200           	move.l d0,d1
    18d2:	243c 0000 401c 	move.l #16412,d2
    18d8:	7635           	moveq #53,d3
    18da:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    18de:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    18e4:	203c 0000 3740 	move.l #14144,d0
    18ea:	7202           	moveq #2,d1
    18ec:	4eae ff3a      	jsr -198(a6)
    18f0:	2440           	movea.l d0,a2
  if( source == 0) {
    18f2:	4a80           	tst.l d0
    18f4:	6600 f4f8      	bne.w dee <main+0xde8>
    Write(  Output(), 
    18f8:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    18fe:	4eae ffc4      	jsr -60(a6)
    1902:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1908:	2200           	move.l d0,d1
    190a:	243c 0000 4093 	move.l #16531,d2
    1910:	7639           	moveq #57,d3
    1912:	4eae ffd0      	jsr -48(a6)
    return;
    1916:	6000 fb8c      	bra.w 14a4 <main+0x149e>
    Write(  Output(), 
    191a:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1920:	4eae ffc4      	jsr -60(a6)
    1924:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    192a:	2200           	move.l d0,d1
    192c:	243c 0000 3e96 	move.l #16022,d2
    1932:	7636           	moveq #54,d3
    1934:	4eae ffd0      	jsr -48(a6)
  PrepareDisplayZoom();
    1938:	4e93           	jsr (a3)
  UWORD *destination = (UWORD *)DrawBuffer;
    193a:	2079 0000 6358 	movea.l 6358 <DrawBuffer>,a0
  *destination= 0x0000;
    1940:	4250           	clr.w (a0)
  *destination= 0x000f;
    1942:	317c 000f 0030 	move.w #15,48(a0)
  *destination = 0x000f;
    1948:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    194e:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    1954:	203c 0000 c800 	move.l #51200,d0
    195a:	7202           	moveq #2,d1
    195c:	4eae ff3a      	jsr -198(a6)
    1960:	2440           	movea.l d0,a2
    1962:	23c0 0000 6328 	move.l d0,6328 <Zoom_Source>
  if( Zoom_Source == 0) {
    1968:	6600 f00a      	bne.w 974 <main+0x96e>
    Write(  Output(), 
    196c:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1972:	4eae ffc4      	jsr -60(a6)
    1976:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    197c:	2200           	move.l d0,d1
    197e:	243c 0000 3e96 	move.l #16022,d2
    1984:	7636           	moveq #54,d3
    1986:	4eae ffd0      	jsr -48(a6)
    return;
    198a:	6000 f200      	bra.w b8c <main+0xb86>
	APTR vbr = 0;
    198e:	7000           	moveq #0,d0
	VBR=GetVBR();
    1990:	23c0 0000 6336 	move.l d0,6336 <VBR.lto_priv.7>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    1996:	2079 0000 6336 	movea.l 6336 <VBR.lto_priv.7>,a0
    199c:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    19a0:	23c2 0000 633a 	move.l d2,633a <SystemIrq>
	WaitVbl();
    19a6:	4e92           	jsr (a2)
	WaitVbl();
    19a8:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    19aa:	2079 0000 633e 	movea.l 633e <hw>,a0
    19b0:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    19b4:	6000 fd38      	bra.w 16ee <main+0x16e8>
    Write(  Output(), 
    19b8:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    19be:	4eae ffc4      	jsr -60(a6)
    19c2:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    19c8:	2200           	move.l d0,d1
    19ca:	243c 0000 40cd 	move.l #16589,d2
    19d0:	763d           	moveq #61,d3
    19d2:	4eae ffd0      	jsr -48(a6)
    return;
    19d6:	6000 facc      	bra.w 14a4 <main+0x149e>
    19da:	4e71           	nop

000019dc <WriteFont.constprop.6>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    19dc:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    19e0:	206f 0008      	movea.l 8(sp),a0
    19e4:	1010           	move.b (a0),d0
    19e6:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    19ea:	4880           	ext.w d0
    19ec:	48c0           	ext.l d0
    19ee:	e788           	lsl.l #3,d0
  fntptr += charpos;
    19f0:	4880           	ext.w d0
    19f2:	3040           	movea.w d0,a0
    19f4:	d1c8           	adda.l a0,a0
    19f6:	d1fc 0000 62e8 	adda.l #25320,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    19fc:	3290           	move.w (a0),(a1)
    19fe:	3368 0002 0050 	move.w 2(a0),80(a1)
    1a04:	3368 0004 00a0 	move.w 4(a0),160(a1)
    1a0a:	3368 0006 00f0 	move.w 6(a0),240(a1)
    1a10:	3368 0008 0140 	move.w 8(a0),320(a1)
    1a16:	3368 000a 0190 	move.w 10(a0),400(a1)
    1a1c:	3368 000c 01e0 	move.w 12(a0),480(a1)
    1a22:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    1a28:	4e75           	rts

00001a2a <warpmode.part.0>:
void warpmode(int on) 
    1a2a:	598f           	subq.l #4,sp
    1a2c:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    1a2e:	4aaf 000c      	tst.l 12(sp)
    1a32:	674c           	beq.s 1a80 <warpmode.part.0+0x56>
    1a34:	4878 0001      	pea 1 <_start+0x1>
    1a38:	740b           	moveq #11,d2
    1a3a:	d48f           	add.l sp,d2
    1a3c:	2f02           	move.l d2,-(sp)
    1a3e:	42a7           	clr.l -(sp)
    1a40:	4879 0000 3962 	pea 3962 <incbin_swfont_end+0x34>
    1a46:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdcd4a>
    1a4a:	4878 0052      	pea 52 <main+0x4c>
    1a4e:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeeccab>
    1a54:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1a58:	203c 0000 3948 	move.l #14664,d0
    1a5e:	4878 0001      	pea 1 <_start+0x1>
    1a62:	2f02           	move.l d2,-(sp)
    1a64:	42a7           	clr.l -(sp)
    1a66:	2f00           	move.l d0,-(sp)
    1a68:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdcd4a>
    1a6c:	4878 0052      	pea 52 <main+0x4c>
    1a70:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeeccab>
	}
}
    1a76:	4fef 0018      	lea 24(sp),sp
    1a7a:	241f           	move.l (sp)+,d2
    1a7c:	588f           	addq.l #4,sp
    1a7e:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    1a80:	4878 0001      	pea 1 <_start+0x1>
    1a84:	740b           	moveq #11,d2
    1a86:	d48f           	add.l sp,d2
    1a88:	2f02           	move.l d2,-(sp)
    1a8a:	42a7           	clr.l -(sp)
    1a8c:	4879 0000 396c 	pea 396c <incbin_swfont_end+0x3e>
    1a92:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdcd4a>
    1a96:	4878 0052      	pea 52 <main+0x4c>
    1a9a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeeccab>
    1aa0:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1aa4:	203c 0000 392f 	move.l #14639,d0
    1aaa:	4878 0001      	pea 1 <_start+0x1>
    1aae:	2f02           	move.l d2,-(sp)
    1ab0:	42a7           	clr.l -(sp)
    1ab2:	2f00           	move.l d0,-(sp)
    1ab4:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdcd4a>
    1ab8:	4878 0052      	pea 52 <main+0x4c>
    1abc:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeeccab>
}
    1ac2:	4fef 0018      	lea 24(sp),sp
    1ac6:	241f           	move.l (sp)+,d2
    1ac8:	588f           	addq.l #4,sp
    1aca:	4e75           	rts

00001acc <KPrintF>:
{
    1acc:	4fef ff80      	lea -128(sp),sp
    1ad0:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    1ad4:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeeccab>
    1ada:	6734           	beq.s 1b10 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    1adc:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    1ae2:	206f 0090      	movea.l 144(sp),a0
    1ae6:	43ef 0094      	lea 148(sp),a1
    1aea:	45f9 0000 3168 	lea 3168 <PutChar>,a2
    1af0:	47ef 000c      	lea 12(sp),a3
    1af4:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    1af8:	2f0b           	move.l a3,-(sp)
    1afa:	4878 0056      	pea 56 <main+0x50>
    1afe:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeeccab>
    1b04:	508f           	addq.l #8,sp
}
    1b06:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1b0a:	4fef 0080      	lea 128(sp),sp
    1b0e:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    1b10:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    1b16:	206f 0090      	movea.l 144(sp),a0
    1b1a:	43ef 0094      	lea 148(sp),a1
    1b1e:	45f9 0000 315a 	lea 315a <KPutCharX>,a2
    1b24:	97cb           	suba.l a3,a3
    1b26:	4eae fdf6      	jsr -522(a6)
}
    1b2a:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1b2e:	4fef 0080      	lea 128(sp),sp
    1b32:	4e75           	rts

00001b34 <TestRow.constprop.5>:
  }
 
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1b34:	4fef ff94      	lea -108(sp),sp
    1b38:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1b3c:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    1b42:	3c2f 002e      	move.w 46(sp),d6
                                                             int numberofline) {    
  
  char str[ 100] = { 0 };
    1b46:	7a34           	moveq #52,d5
    1b48:	da8f           	add.l sp,d5
    1b4a:	4878 0064      	pea 64 <main+0x5e>
    1b4e:	42a7           	clr.l -(sp)
    1b50:	2f05           	move.l d5,-(sp)
    1b52:	4eba 1426      	jsr 2f7a <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
    1b56:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1b5c:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
    1b60:	2a6f 009c      	movea.l 156(sp),a5

  for(int i=0;i<21;i++) {
    1b64:	7800           	moveq #0,d4
  testpattern += 0;
    1b66:	49f9 0000 62bc 	lea 62bc <destlinezoom4>,a4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1b6c:	2e3c 0000 3977 	move.l #14711,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    1b72:	301c           	move.w (a4)+,d0
    1b74:	bd40           	eor.w d6,d0
    1b76:	b05d           	cmp.w (a5)+,d0
    1b78:	6736           	beq.s 1bb0 <TestRow.constprop.5+0x7c>
      data[0] = i;
    1b7a:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1b7e:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    1b84:	2047           	movea.l d7,a0
    1b86:	43ef 0030      	lea 48(sp),a1
    1b8a:	45f9 0000 3168 	lea 3168 <PutChar>,a2
    1b90:	2645           	movea.l d5,a3
    1b92:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    1b96:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1b9c:	4eae ffc4      	jsr -60(a6)
    1ba0:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1ba6:	2200           	move.l d0,d1
    1ba8:	2405           	move.l d5,d2
    1baa:	7664           	moveq #100,d3
    1bac:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    1bb0:	5284           	addq.l #1,d4
    1bb2:	b9fc 0000 62e6 	cmpa.l #25318,a4
    1bb8:	66b8           	bne.s 1b72 <TestRow.constprop.5+0x3e>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1bba:	3039 0000 62e6 	move.w 62e6 <destlinezoom4+0x2a>,d0
    1bc0:	322f 002e      	move.w 46(sp),d1
    1bc4:	b340           	eor.w d1,d0
    1bc6:	206f 009c      	movea.l 156(sp),a0
    1bca:	3228 002a      	move.w 42(a0),d1
    1bce:	b340           	eor.w d1,d0
    1bd0:	0240 ff00      	andi.w #-256,d0
    1bd4:	660a           	bne.s 1be0 <TestRow.constprop.5+0xac>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
    1bd6:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1bda:	4fef 006c      	lea 108(sp),sp
    1bde:	4e75           	rts
    data[0] = 21;
    1be0:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    1be6:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    1bec:	41f9 0000 3977 	lea 3977 <incbin_swfont_end+0x49>,a0
    1bf2:	43ef 0030      	lea 48(sp),a1
    1bf6:	45f9 0000 3168 	lea 3168 <PutChar>,a2
    1bfc:	47ef 0034      	lea 52(sp),a3
    1c00:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1c04:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1c0a:	4eae ffc4      	jsr -60(a6)
    1c0e:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1c14:	2200           	move.l d0,d1
    1c16:	240b           	move.l a3,d2
    1c18:	7664           	moveq #100,d3
    1c1a:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1c1e:	206f 009c      	movea.l 156(sp),a0
    1c22:	7000           	moveq #0,d0
    1c24:	3028 002a      	move.w 42(a0),d0
    1c28:	2f00           	move.l d0,-(sp)
    1c2a:	3039 0000 62e6 	move.w 62e6 <destlinezoom4+0x2a>,d0
    1c30:	2f00           	move.l d0,-(sp)
    1c32:	4879 0000 39a7 	pea 39a7 <incbin_swfont_end+0x79>
    1c38:	4eba fe92      	jsr 1acc <KPrintF>(pc)
    1c3c:	4fef 000c      	lea 12(sp),sp
}
    1c40:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1c44:	4fef 006c      	lea 108(sp),sp
    1c48:	4e75           	rts

00001c4a <TestRow.constprop.4>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1c4a:	4fef ff94      	lea -108(sp),sp
    1c4e:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1c52:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    1c58:	3c2f 002e      	move.w 46(sp),d6
  char str[ 100] = { 0 };
    1c5c:	7a34           	moveq #52,d5
    1c5e:	da8f           	add.l sp,d5
    1c60:	4878 0064      	pea 64 <main+0x5e>
    1c64:	42a7           	clr.l -(sp)
    1c66:	2f05           	move.l d5,-(sp)
    1c68:	4eba 1310      	jsr 2f7a <memset>(pc)
  data[1] = numberofline;
    1c6c:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1c72:	4fef 000c      	lea 12(sp),sp
  destination += 0;
    1c76:	2a6f 009c      	movea.l 156(sp),a5
  for(int i=0;i<21;i++) {
    1c7a:	7800           	moveq #0,d4
  testpattern += 0;
    1c7c:	49f9 0000 6290 	lea 6290 <destlinezoom3>,a4
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1c82:	2e3c 0000 3977 	move.l #14711,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    1c88:	301c           	move.w (a4)+,d0
    1c8a:	bd40           	eor.w d6,d0
    1c8c:	b05d           	cmp.w (a5)+,d0
    1c8e:	6736           	beq.s 1cc6 <TestRow.constprop.4+0x7c>
      data[0] = i;
    1c90:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1c94:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    1c9a:	2047           	movea.l d7,a0
    1c9c:	43ef 0030      	lea 48(sp),a1
    1ca0:	45f9 0000 3168 	lea 3168 <PutChar>,a2
    1ca6:	2645           	movea.l d5,a3
    1ca8:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1cac:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1cb2:	4eae ffc4      	jsr -60(a6)
    1cb6:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1cbc:	2200           	move.l d0,d1
    1cbe:	2405           	move.l d5,d2
    1cc0:	7664           	moveq #100,d3
    1cc2:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    1cc6:	5284           	addq.l #1,d4
    1cc8:	b9fc 0000 62ba 	cmpa.l #25274,a4
    1cce:	66b8           	bne.s 1c88 <TestRow.constprop.4+0x3e>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1cd0:	3039 0000 62ba 	move.w 62ba <destlinezoom3+0x2a>,d0
    1cd6:	322f 002e      	move.w 46(sp),d1
    1cda:	b340           	eor.w d1,d0
    1cdc:	206f 009c      	movea.l 156(sp),a0
    1ce0:	3228 002a      	move.w 42(a0),d1
    1ce4:	b340           	eor.w d1,d0
    1ce6:	0240 ff00      	andi.w #-256,d0
    1cea:	660a           	bne.s 1cf6 <TestRow.constprop.4+0xac>
}
    1cec:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1cf0:	4fef 006c      	lea 108(sp),sp
    1cf4:	4e75           	rts
    data[0] = 21;
    1cf6:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    1cfc:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    1d02:	41f9 0000 3977 	lea 3977 <incbin_swfont_end+0x49>,a0
    1d08:	43ef 0030      	lea 48(sp),a1
    1d0c:	45f9 0000 3168 	lea 3168 <PutChar>,a2
    1d12:	47ef 0034      	lea 52(sp),a3
    1d16:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1d1a:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1d20:	4eae ffc4      	jsr -60(a6)
    1d24:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1d2a:	2200           	move.l d0,d1
    1d2c:	240b           	move.l a3,d2
    1d2e:	7664           	moveq #100,d3
    1d30:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1d34:	206f 009c      	movea.l 156(sp),a0
    1d38:	7000           	moveq #0,d0
    1d3a:	3028 002a      	move.w 42(a0),d0
    1d3e:	2f00           	move.l d0,-(sp)
    1d40:	3039 0000 62ba 	move.w 62ba <destlinezoom3+0x2a>,d0
    1d46:	2f00           	move.l d0,-(sp)
    1d48:	4879 0000 39a7 	pea 39a7 <incbin_swfont_end+0x79>
    1d4e:	4eba fd7c      	jsr 1acc <KPrintF>(pc)
    1d52:	4fef 000c      	lea 12(sp),sp
}
    1d56:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1d5a:	4fef 006c      	lea 108(sp),sp
    1d5e:	4e75           	rts

00001d60 <TestRow.constprop.3>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1d60:	4fef ff94      	lea -108(sp),sp
    1d64:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1d68:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    1d6e:	3c2f 002e      	move.w 46(sp),d6
  char str[ 100] = { 0 };
    1d72:	7a34           	moveq #52,d5
    1d74:	da8f           	add.l sp,d5
    1d76:	4878 0064      	pea 64 <main+0x5e>
    1d7a:	42a7           	clr.l -(sp)
    1d7c:	2f05           	move.l d5,-(sp)
    1d7e:	4eba 11fa      	jsr 2f7a <memset>(pc)
  data[1] = numberofline;
    1d82:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1d88:	4fef 000c      	lea 12(sp),sp
  destination += 0;
    1d8c:	2a6f 009c      	movea.l 156(sp),a5
  for(int i=0;i<21;i++) {
    1d90:	7800           	moveq #0,d4
  testpattern += 0;
    1d92:	49f9 0000 6264 	lea 6264 <destlinezoom2>,a4
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1d98:	2e3c 0000 3977 	move.l #14711,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    1d9e:	301c           	move.w (a4)+,d0
    1da0:	bd40           	eor.w d6,d0
    1da2:	b05d           	cmp.w (a5)+,d0
    1da4:	6736           	beq.s 1ddc <TestRow.constprop.3+0x7c>
      data[0] = i;
    1da6:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1daa:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    1db0:	2047           	movea.l d7,a0
    1db2:	43ef 0030      	lea 48(sp),a1
    1db6:	45f9 0000 3168 	lea 3168 <PutChar>,a2
    1dbc:	2645           	movea.l d5,a3
    1dbe:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1dc2:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1dc8:	4eae ffc4      	jsr -60(a6)
    1dcc:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1dd2:	2200           	move.l d0,d1
    1dd4:	2405           	move.l d5,d2
    1dd6:	7664           	moveq #100,d3
    1dd8:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    1ddc:	5284           	addq.l #1,d4
    1dde:	b9fc 0000 628e 	cmpa.l #25230,a4
    1de4:	66b8           	bne.s 1d9e <TestRow.constprop.3+0x3e>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1de6:	3039 0000 628e 	move.w 628e <destlinezoom2+0x2a>,d0
    1dec:	322f 002e      	move.w 46(sp),d1
    1df0:	b340           	eor.w d1,d0
    1df2:	206f 009c      	movea.l 156(sp),a0
    1df6:	3228 002a      	move.w 42(a0),d1
    1dfa:	b340           	eor.w d1,d0
    1dfc:	0240 ff00      	andi.w #-256,d0
    1e00:	660a           	bne.s 1e0c <TestRow.constprop.3+0xac>
}
    1e02:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1e06:	4fef 006c      	lea 108(sp),sp
    1e0a:	4e75           	rts
    data[0] = 21;
    1e0c:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    1e12:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    1e18:	41f9 0000 3977 	lea 3977 <incbin_swfont_end+0x49>,a0
    1e1e:	43ef 0030      	lea 48(sp),a1
    1e22:	45f9 0000 3168 	lea 3168 <PutChar>,a2
    1e28:	47ef 0034      	lea 52(sp),a3
    1e2c:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1e30:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1e36:	4eae ffc4      	jsr -60(a6)
    1e3a:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1e40:	2200           	move.l d0,d1
    1e42:	240b           	move.l a3,d2
    1e44:	7664           	moveq #100,d3
    1e46:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1e4a:	206f 009c      	movea.l 156(sp),a0
    1e4e:	7000           	moveq #0,d0
    1e50:	3028 002a      	move.w 42(a0),d0
    1e54:	2f00           	move.l d0,-(sp)
    1e56:	3039 0000 628e 	move.w 628e <destlinezoom2+0x2a>,d0
    1e5c:	2f00           	move.l d0,-(sp)
    1e5e:	4879 0000 39a7 	pea 39a7 <incbin_swfont_end+0x79>
    1e64:	4eba fc66      	jsr 1acc <KPrintF>(pc)
    1e68:	4fef 000c      	lea 12(sp),sp
}
    1e6c:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1e70:	4fef 006c      	lea 108(sp),sp
    1e74:	4e75           	rts

00001e76 <TestRow.constprop.2>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1e76:	4fef ff94      	lea -108(sp),sp
    1e7a:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1e7e:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    1e84:	3c2f 002e      	move.w 46(sp),d6
  char str[ 100] = { 0 };
    1e88:	7a34           	moveq #52,d5
    1e8a:	da8f           	add.l sp,d5
    1e8c:	4878 0064      	pea 64 <main+0x5e>
    1e90:	42a7           	clr.l -(sp)
    1e92:	2f05           	move.l d5,-(sp)
    1e94:	4eba 10e4      	jsr 2f7a <memset>(pc)
  data[1] = numberofline;
    1e98:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1e9e:	4fef 000c      	lea 12(sp),sp
  destination += 0;
    1ea2:	2a6f 009c      	movea.l 156(sp),a5
  for(int i=0;i<21;i++) {
    1ea6:	7800           	moveq #0,d4
  testpattern += 0;
    1ea8:	49f9 0000 6238 	lea 6238 <destlinezoom1>,a4
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1eae:	2e3c 0000 3977 	move.l #14711,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    1eb4:	301c           	move.w (a4)+,d0
    1eb6:	bd40           	eor.w d6,d0
    1eb8:	b05d           	cmp.w (a5)+,d0
    1eba:	6736           	beq.s 1ef2 <TestRow.constprop.2+0x7c>
      data[0] = i;
    1ebc:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1ec0:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    1ec6:	2047           	movea.l d7,a0
    1ec8:	43ef 0030      	lea 48(sp),a1
    1ecc:	45f9 0000 3168 	lea 3168 <PutChar>,a2
    1ed2:	2645           	movea.l d5,a3
    1ed4:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1ed8:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1ede:	4eae ffc4      	jsr -60(a6)
    1ee2:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1ee8:	2200           	move.l d0,d1
    1eea:	2405           	move.l d5,d2
    1eec:	7664           	moveq #100,d3
    1eee:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    1ef2:	5284           	addq.l #1,d4
    1ef4:	b9fc 0000 6262 	cmpa.l #25186,a4
    1efa:	66b8           	bne.s 1eb4 <TestRow.constprop.2+0x3e>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1efc:	3039 0000 6262 	move.w 6262 <destlinezoom1+0x2a>,d0
    1f02:	322f 002e      	move.w 46(sp),d1
    1f06:	b340           	eor.w d1,d0
    1f08:	206f 009c      	movea.l 156(sp),a0
    1f0c:	3228 002a      	move.w 42(a0),d1
    1f10:	b340           	eor.w d1,d0
    1f12:	0240 ff00      	andi.w #-256,d0
    1f16:	660a           	bne.s 1f22 <TestRow.constprop.2+0xac>
}
    1f18:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1f1c:	4fef 006c      	lea 108(sp),sp
    1f20:	4e75           	rts
    data[0] = 21;
    1f22:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    1f28:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    1f2e:	41f9 0000 3977 	lea 3977 <incbin_swfont_end+0x49>,a0
    1f34:	43ef 0030      	lea 48(sp),a1
    1f38:	45f9 0000 3168 	lea 3168 <PutChar>,a2
    1f3e:	47ef 0034      	lea 52(sp),a3
    1f42:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1f46:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1f4c:	4eae ffc4      	jsr -60(a6)
    1f50:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    1f56:	2200           	move.l d0,d1
    1f58:	240b           	move.l a3,d2
    1f5a:	7664           	moveq #100,d3
    1f5c:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1f60:	206f 009c      	movea.l 156(sp),a0
    1f64:	7000           	moveq #0,d0
    1f66:	3028 002a      	move.w 42(a0),d0
    1f6a:	2f00           	move.l d0,-(sp)
    1f6c:	3039 0000 6262 	move.w 6262 <destlinezoom1+0x2a>,d0
    1f72:	2f00           	move.l d0,-(sp)
    1f74:	4879 0000 39a7 	pea 39a7 <incbin_swfont_end+0x79>
    1f7a:	4eba fb50      	jsr 1acc <KPrintF>(pc)
    1f7e:	4fef 000c      	lea 12(sp),sp
}
    1f82:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1f86:	4fef 006c      	lea 108(sp),sp
    1f8a:	4e75           	rts

00001f8c <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    1f8c:	202f 0008      	move.l 8(sp),d0
    1f90:	d080           	add.l d0,d0
    1f92:	d080           	add.l d0,d0
    1f94:	206f 0004      	movea.l 4(sp),a0
    1f98:	2030 0800      	move.l (0,a0,d0.l),d0
    1f9c:	b0af 000c      	cmp.l 12(sp),d0
    1fa0:	57c0           	seq d0
    1fa2:	4880           	ext.w d0
    1fa4:	48c0           	ext.l d0
}
    1fa6:	4480           	neg.l d0
    1fa8:	4e75           	rts

00001faa <TestCopperlistBatch>:
                                                                  long length) {
    1faa:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    1fae:	246f 0010      	movea.l 16(sp),a2
    1fb2:	206f 0014      	movea.l 20(sp),a0
    1fb6:	226f 0018      	movea.l 24(sp),a1
    1fba:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    1fbe:	2008           	move.l a0,d0
    1fc0:	d088           	add.l a0,d0
    1fc2:	d080           	add.l d0,d0
    1fc4:	2411           	move.l (a1),d2
    1fc6:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    1fca:	6600 01ac      	bne.w 2178 <TestCopperlistBatch+0x1ce>
    1fce:	2008           	move.l a0,d0
    1fd0:	5280           	addq.l #1,d0
    1fd2:	d080           	add.l d0,d0
    1fd4:	d080           	add.l d0,d0
    1fd6:	2032 0800      	move.l (0,a2,d0.l),d0
    1fda:	b0a9 0004      	cmp.l 4(a1),d0
    1fde:	6600 0198      	bne.w 2178 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1fe2:	7002           	moveq #2,d0
    1fe4:	b081           	cmp.l d1,d0
    1fe6:	6700 0188      	beq.w 2170 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1fea:	2008           	move.l a0,d0
    1fec:	5480           	addq.l #2,d0
    1fee:	d080           	add.l d0,d0
    1ff0:	d080           	add.l d0,d0
    1ff2:	2032 0800      	move.l (0,a2,d0.l),d0
    1ff6:	b0a9 0008      	cmp.l 8(a1),d0
    1ffa:	6600 017c      	bne.w 2178 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1ffe:	7403           	moveq #3,d2
    2000:	b481           	cmp.l d1,d2
    2002:	6700 016c      	beq.w 2170 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2006:	2008           	move.l a0,d0
    2008:	5680           	addq.l #3,d0
    200a:	d080           	add.l d0,d0
    200c:	d080           	add.l d0,d0
    200e:	2032 0800      	move.l (0,a2,d0.l),d0
    2012:	b0a9 000c      	cmp.l 12(a1),d0
    2016:	6600 0160      	bne.w 2178 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    201a:	7004           	moveq #4,d0
    201c:	b081           	cmp.l d1,d0
    201e:	6700 0150      	beq.w 2170 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2022:	2008           	move.l a0,d0
    2024:	5880           	addq.l #4,d0
    2026:	d080           	add.l d0,d0
    2028:	d080           	add.l d0,d0
    202a:	2032 0800      	move.l (0,a2,d0.l),d0
    202e:	b0a9 0010      	cmp.l 16(a1),d0
    2032:	6600 0144      	bne.w 2178 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2036:	7405           	moveq #5,d2
    2038:	b481           	cmp.l d1,d2
    203a:	6700 0134      	beq.w 2170 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    203e:	2008           	move.l a0,d0
    2040:	5a80           	addq.l #5,d0
    2042:	d080           	add.l d0,d0
    2044:	d080           	add.l d0,d0
    2046:	2032 0800      	move.l (0,a2,d0.l),d0
    204a:	b0a9 0014      	cmp.l 20(a1),d0
    204e:	6600 0128      	bne.w 2178 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2052:	7006           	moveq #6,d0
    2054:	b081           	cmp.l d1,d0
    2056:	6700 0118      	beq.w 2170 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    205a:	2008           	move.l a0,d0
    205c:	5c80           	addq.l #6,d0
    205e:	d080           	add.l d0,d0
    2060:	d080           	add.l d0,d0
    2062:	2032 0800      	move.l (0,a2,d0.l),d0
    2066:	b0a9 0018      	cmp.l 24(a1),d0
    206a:	6600 010c      	bne.w 2178 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    206e:	7407           	moveq #7,d2
    2070:	b481           	cmp.l d1,d2
    2072:	6700 00fc      	beq.w 2170 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2076:	2008           	move.l a0,d0
    2078:	5e80           	addq.l #7,d0
    207a:	d080           	add.l d0,d0
    207c:	d080           	add.l d0,d0
    207e:	2032 0800      	move.l (0,a2,d0.l),d0
    2082:	b0a9 001c      	cmp.l 28(a1),d0
    2086:	6600 00f0      	bne.w 2178 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    208a:	7008           	moveq #8,d0
    208c:	b081           	cmp.l d1,d0
    208e:	6700 00e0      	beq.w 2170 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2092:	2008           	move.l a0,d0
    2094:	5080           	addq.l #8,d0
    2096:	d080           	add.l d0,d0
    2098:	d080           	add.l d0,d0
    209a:	2032 0800      	move.l (0,a2,d0.l),d0
    209e:	b0a9 0020      	cmp.l 32(a1),d0
    20a2:	6600 00d4      	bne.w 2178 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    20a6:	7409           	moveq #9,d2
    20a8:	b481           	cmp.l d1,d2
    20aa:	6700 00c4      	beq.w 2170 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    20ae:	47e8 0009      	lea 9(a0),a3
    20b2:	200b           	move.l a3,d0
    20b4:	d08b           	add.l a3,d0
    20b6:	d080           	add.l d0,d0
    20b8:	2032 0800      	move.l (0,a2,d0.l),d0
    20bc:	b0a9 0024      	cmp.l 36(a1),d0
    20c0:	6600 00b6      	bne.w 2178 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    20c4:	700a           	moveq #10,d0
    20c6:	b081           	cmp.l d1,d0
    20c8:	6700 00a6      	beq.w 2170 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    20cc:	47e8 000a      	lea 10(a0),a3
    20d0:	200b           	move.l a3,d0
    20d2:	d08b           	add.l a3,d0
    20d4:	d080           	add.l d0,d0
    20d6:	2032 0800      	move.l (0,a2,d0.l),d0
    20da:	b0a9 0028      	cmp.l 40(a1),d0
    20de:	6600 0098      	bne.w 2178 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    20e2:	740b           	moveq #11,d2
    20e4:	b481           	cmp.l d1,d2
    20e6:	6700 0088      	beq.w 2170 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    20ea:	47e8 000b      	lea 11(a0),a3
    20ee:	200b           	move.l a3,d0
    20f0:	d08b           	add.l a3,d0
    20f2:	d080           	add.l d0,d0
    20f4:	2032 0800      	move.l (0,a2,d0.l),d0
    20f8:	b0a9 002c      	cmp.l 44(a1),d0
    20fc:	667a           	bne.s 2178 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    20fe:	700c           	moveq #12,d0
    2100:	b081           	cmp.l d1,d0
    2102:	676c           	beq.s 2170 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2104:	47e8 000c      	lea 12(a0),a3
    2108:	200b           	move.l a3,d0
    210a:	d08b           	add.l a3,d0
    210c:	d080           	add.l d0,d0
    210e:	2032 0800      	move.l (0,a2,d0.l),d0
    2112:	b0a9 0030      	cmp.l 48(a1),d0
    2116:	6660           	bne.s 2178 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2118:	740d           	moveq #13,d2
    211a:	b481           	cmp.l d1,d2
    211c:	6752           	beq.s 2170 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    211e:	47e8 000d      	lea 13(a0),a3
    2122:	200b           	move.l a3,d0
    2124:	d08b           	add.l a3,d0
    2126:	d080           	add.l d0,d0
    2128:	2032 0800      	move.l (0,a2,d0.l),d0
    212c:	b0a9 0034      	cmp.l 52(a1),d0
    2130:	6646           	bne.s 2178 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2132:	700e           	moveq #14,d0
    2134:	b081           	cmp.l d1,d0
    2136:	6738           	beq.s 2170 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2138:	47e8 000e      	lea 14(a0),a3
    213c:	200b           	move.l a3,d0
    213e:	d08b           	add.l a3,d0
    2140:	d080           	add.l d0,d0
    2142:	2032 0800      	move.l (0,a2,d0.l),d0
    2146:	b0a9 0038      	cmp.l 56(a1),d0
    214a:	662c           	bne.s 2178 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    214c:	7410           	moveq #16,d2
    214e:	b481           	cmp.l d1,d2
    2150:	661e           	bne.s 2170 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2152:	41e8 000f      	lea 15(a0),a0
    2156:	d1c8           	adda.l a0,a0
    2158:	d1c8           	adda.l a0,a0
    215a:	2070 a800      	movea.l (0,a0,a2.l),a0
    215e:	b1e9 003c      	cmpa.l 60(a1),a0
    2162:	57c0           	seq d0
    2164:	4880           	ext.w d0
    2166:	48c0           	ext.l d0
    2168:	4480           	neg.l d0
}
    216a:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    216e:	4e75           	rts
  return 1;
    2170:	7001           	moveq #1,d0
}
    2172:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    2176:	4e75           	rts
      return 0;
    2178:	7000           	moveq #0,d0
}
    217a:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    217e:	4e75           	rts

00002180 <ClBuild>:
ULONG * ClbuildSW() {
    2180:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    2184:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    218a:	707b           	moveq #123,d0
    218c:	4600           	not.b d0
    218e:	7202           	moveq #2,d1
    2190:	4eae ff3a      	jsr -198(a6)
    2194:	2440           	movea.l d0,a2
  if( retval == 0) {
    2196:	4a80           	tst.l d0
    2198:	6700 010e      	beq.w 22a8 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    219c:	24b9 0000 61f8 	move.l 61f8 <ClsSprites>,(a2)
    21a2:	2579 0000 61fc 	move.l 61fc <ClsSprites+0x4>,4(a2)
    21a8:	0004 
    21aa:	2579 0000 6200 	move.l 6200 <ClsSprites+0x8>,8(a2)
    21b0:	0008 
    21b2:	2579 0000 6204 	move.l 6204 <ClsSprites+0xc>,12(a2)
    21b8:	000c 
    21ba:	2579 0000 6208 	move.l 6208 <ClsSprites+0x10>,16(a2)
    21c0:	0010 
    21c2:	2579 0000 620c 	move.l 620c <ClsSprites+0x14>,20(a2)
    21c8:	0014 
    21ca:	2579 0000 6210 	move.l 6210 <ClsSprites+0x18>,24(a2)
    21d0:	0018 
    21d2:	2579 0000 6214 	move.l 6214 <ClsSprites+0x1c>,28(a2)
    21d8:	001c 
    21da:	2579 0000 6218 	move.l 6218 <ClsSprites+0x20>,32(a2)
    21e0:	0020 
    21e2:	2579 0000 621c 	move.l 621c <ClsSprites+0x24>,36(a2)
    21e8:	0024 
    21ea:	2579 0000 6220 	move.l 6220 <ClsSprites+0x28>,40(a2)
    21f0:	0028 
    21f2:	2579 0000 6224 	move.l 6224 <ClsSprites+0x2c>,44(a2)
    21f8:	002c 
    21fa:	2579 0000 6228 	move.l 6228 <ClsSprites+0x30>,48(a2)
    2200:	0030 
    2202:	2579 0000 622c 	move.l 622c <ClsSprites+0x34>,52(a2)
    2208:	0034 
    220a:	2579 0000 6230 	move.l 6230 <ClsSprites+0x38>,56(a2)
    2210:	0038 
    2212:	2579 0000 6234 	move.l 6234 <ClsSprites+0x3c>,60(a2)
    2218:	003c 
    *cl++ = *clpartinstruction++;
    221a:	2579 0000 61c8 	move.l 61c8 <ClScreen>,64(a2)
    2220:	0040 
    2222:	2579 0000 61cc 	move.l 61cc <ClScreen+0x4>,68(a2)
    2228:	0044 
    222a:	2579 0000 61d0 	move.l 61d0 <ClScreen+0x8>,72(a2)
    2230:	0048 
    2232:	2579 0000 61d4 	move.l 61d4 <ClScreen+0xc>,76(a2)
    2238:	004c 
    223a:	2579 0000 61d8 	move.l 61d8 <ClScreen+0x10>,80(a2)
    2240:	0050 
    2242:	2579 0000 61dc 	move.l 61dc <ClScreen+0x14>,84(a2)
    2248:	0054 
    224a:	2579 0000 61e0 	move.l 61e0 <ClScreen+0x18>,88(a2)
    2250:	0058 
    2252:	2579 0000 61e4 	move.l 61e4 <ClScreen+0x1c>,92(a2)
    2258:	005c 
    225a:	2579 0000 61e8 	move.l 61e8 <ClScreen+0x20>,96(a2)
    2260:	0060 
    2262:	2579 0000 61ec 	move.l 61ec <ClScreen+0x24>,100(a2)
    2268:	0064 
    226a:	2579 0000 61f0 	move.l 61f0 <ClScreen+0x28>,104(a2)
    2270:	0068 
    2272:	2579 0000 61f4 	move.l 61f4 <ClScreen+0x2c>,108(a2)
    2278:	006c 
  *cl++ = 0x00e00000;
    227a:	257c 00e0 0000 	move.l #14680064,112(a2)
    2280:	0070 
  *cl++ = 0x00e20000;
    2282:	257c 00e2 0000 	move.l #14811136,116(a2)
    2288:	0074 
    *cl++ = *clpartinstruction++;
    228a:	2579 0000 61c0 	move.l 61c0 <ClColor>,120(a2)
    2290:	0078 
    2292:	2579 0000 61c4 	move.l 61c4 <ClColor+0x4>,124(a2)
    2298:	007c 
  *cl = 0xfffffffe;
    229a:	70fe           	moveq #-2,d0
    229c:	2540 0080      	move.l d0,128(a2)
}
    22a0:	200a           	move.l a2,d0
    22a2:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    22a6:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    22a8:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    22ae:	4eae ffc4      	jsr -60(a6)
    22b2:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    22b8:	2200           	move.l d0,d1
    22ba:	243c 0000 39cd 	move.l #14797,d2
    22c0:	7628           	moveq #40,d3
    22c2:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    22c6:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    22cc:	7201           	moveq #1,d1
    22ce:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    22d2:	24b9 0000 61f8 	move.l 61f8 <ClsSprites>,(a2)
    22d8:	2579 0000 61fc 	move.l 61fc <ClsSprites+0x4>,4(a2)
    22de:	0004 
    22e0:	2579 0000 6200 	move.l 6200 <ClsSprites+0x8>,8(a2)
    22e6:	0008 
    22e8:	2579 0000 6204 	move.l 6204 <ClsSprites+0xc>,12(a2)
    22ee:	000c 
    22f0:	2579 0000 6208 	move.l 6208 <ClsSprites+0x10>,16(a2)
    22f6:	0010 
    22f8:	2579 0000 620c 	move.l 620c <ClsSprites+0x14>,20(a2)
    22fe:	0014 
    2300:	2579 0000 6210 	move.l 6210 <ClsSprites+0x18>,24(a2)
    2306:	0018 
    2308:	2579 0000 6214 	move.l 6214 <ClsSprites+0x1c>,28(a2)
    230e:	001c 
    2310:	2579 0000 6218 	move.l 6218 <ClsSprites+0x20>,32(a2)
    2316:	0020 
    2318:	2579 0000 621c 	move.l 621c <ClsSprites+0x24>,36(a2)
    231e:	0024 
    2320:	2579 0000 6220 	move.l 6220 <ClsSprites+0x28>,40(a2)
    2326:	0028 
    2328:	2579 0000 6224 	move.l 6224 <ClsSprites+0x2c>,44(a2)
    232e:	002c 
    2330:	2579 0000 6228 	move.l 6228 <ClsSprites+0x30>,48(a2)
    2336:	0030 
    2338:	2579 0000 622c 	move.l 622c <ClsSprites+0x34>,52(a2)
    233e:	0034 
    2340:	2579 0000 6230 	move.l 6230 <ClsSprites+0x38>,56(a2)
    2346:	0038 
    2348:	2579 0000 6234 	move.l 6234 <ClsSprites+0x3c>,60(a2)
    234e:	003c 
    *cl++ = *clpartinstruction++;
    2350:	2579 0000 61c8 	move.l 61c8 <ClScreen>,64(a2)
    2356:	0040 
    2358:	2579 0000 61cc 	move.l 61cc <ClScreen+0x4>,68(a2)
    235e:	0044 
    2360:	2579 0000 61d0 	move.l 61d0 <ClScreen+0x8>,72(a2)
    2366:	0048 
    2368:	2579 0000 61d4 	move.l 61d4 <ClScreen+0xc>,76(a2)
    236e:	004c 
    2370:	2579 0000 61d8 	move.l 61d8 <ClScreen+0x10>,80(a2)
    2376:	0050 
    2378:	2579 0000 61dc 	move.l 61dc <ClScreen+0x14>,84(a2)
    237e:	0054 
    2380:	2579 0000 61e0 	move.l 61e0 <ClScreen+0x18>,88(a2)
    2386:	0058 
    2388:	2579 0000 61e4 	move.l 61e4 <ClScreen+0x1c>,92(a2)
    238e:	005c 
    2390:	2579 0000 61e8 	move.l 61e8 <ClScreen+0x20>,96(a2)
    2396:	0060 
    2398:	2579 0000 61ec 	move.l 61ec <ClScreen+0x24>,100(a2)
    239e:	0064 
    23a0:	2579 0000 61f0 	move.l 61f0 <ClScreen+0x28>,104(a2)
    23a6:	0068 
    23a8:	2579 0000 61f4 	move.l 61f4 <ClScreen+0x2c>,108(a2)
    23ae:	006c 
  *cl++ = 0x00e00000;
    23b0:	257c 00e0 0000 	move.l #14680064,112(a2)
    23b6:	0070 
  *cl++ = 0x00e20000;
    23b8:	257c 00e2 0000 	move.l #14811136,116(a2)
    23be:	0074 
    *cl++ = *clpartinstruction++;
    23c0:	2579 0000 61c0 	move.l 61c0 <ClColor>,120(a2)
    23c6:	0078 
    23c8:	2579 0000 61c4 	move.l 61c4 <ClColor+0x4>,124(a2)
    23ce:	007c 
  *cl = 0xfffffffe;
    23d0:	70fe           	moveq #-2,d0
    23d2:	2540 0080      	move.l d0,128(a2)
}
    23d6:	200a           	move.l a2,d0
    23d8:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    23dc:	4e75           	rts

000023de <Zoom_ZoomIntoPicture>:
void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr) {
    23de:	4fef ffe4      	lea -28(sp),sp
    23e2:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    23e6:	202f 0054      	move.l 84(sp),d0
    23ea:	3240           	movea.w d0,a1
  UWORD nextzoom = 22*16 - 20 + zoomnr * 10;
    23ec:	3040           	movea.w d0,a0
    23ee:	d0c0           	adda.w d0,a0
    23f0:	3208           	move.w a0,d1
    23f2:	d248           	add.w a0,d1
    23f4:	d240           	add.w d0,d1
    23f6:	d241           	add.w d1,d1
    23f8:	0641 014c      	addi.w #332,d1
    23fc:	3f41 0038      	move.w d1,56(sp)
  while( nextzoom > 22 * 16) {
    2400:	0c41 0160      	cmpi.w #352,d1
    2404:	6300 039a      	bls.w 27a0 <Zoom_ZoomIntoPicture+0x3c2>
    nextzoom -= (19 + zoomnr);
    2408:	72ed           	moveq #-19,d1
    240a:	9240           	sub.w d0,d1
    240c:	d36f 0038      	add.w d1,56(sp)
    shiftright--;
    2410:	7e08           	moveq #8,d7
  *bp2 = 0;
    2412:	4278 0206      	clr.w 206 <main+0x200>
  WORD ZoomHorizontalStart = 15 - zoomnr * 6;
    2416:	3208           	move.w a0,d1
    2418:	d240           	add.w d0,d1
    241a:	d241           	add.w d1,d1
    241c:	740f           	moveq #15,d2
    241e:	9441           	sub.w d1,d2
    2420:	3f42 003e      	move.w d2,62(sp)
  while( ZoomHorizontalStart < 0) {
    2424:	6c00 0392      	bge.w 27b8 <Zoom_ZoomIntoPicture+0x3da>
      ZoomHorizontalStart += 1 + 15 + zoomnr;
    2428:	3200           	move.w d0,d1
    242a:	0641 0010      	addi.w #16,d1
    242e:	d36f 003e      	add.w d1,62(sp)
    2432:	223c 8000 00be 	move.l #-2147483458,d1
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    2438:	90c0           	suba.w d0,a0
    243a:	3a48           	movea.w a0,a5
    243c:	4bed 000f      	lea 15(a5),a5
    2440:	d281           	add.l d1,d1
    2442:	d2af 004c      	add.l 76(sp),d1
    2446:	2f41 0034      	move.l d1,52(sp)
    244a:	742c           	moveq #44,d2
    244c:	d4af 0050      	add.l 80(sp),d2
    2450:	2f42 003a      	move.l d2,58(sp)
  UWORD shifttoleft = 0;
    2454:	426f 0042      	clr.w 66(sp)
  UWORD startofword = 21*16;
    2458:	3f7c 0150 002e 	move.w #336,46(sp)
      nextzoom -= (19 + zoomnr);
    245e:	74ed           	moveq #-19,d2
    2460:	9449           	sub.w a1,d2
    2462:	3f42 0046      	move.w d2,70(sp)
    WORD linesleft = 272;
    2466:	3f47 002c      	move.w d7,44(sp)
    ZoomHorizontal = ZoomHorizontalStart;
    246a:	33ef 003e 0000 	move.w 62(sp),6346 <ZoomHorizontal>
    2470:	6346 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
    2472:	2a2f 0034      	move.l 52(sp),d5
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    2476:	246f 003a      	movea.l 58(sp),a2
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    247a:	7000           	moveq #0,d0
    247c:	302f 0042      	move.w 66(sp),d0
    2480:	d080           	add.l d0,d0
    2482:	2f40 0030      	move.l d0,48(sp)
    2486:	3f6f 002c 0044 	move.w 44(sp),68(sp)
    248c:	3c2f 002c      	move.w 44(sp),d6
    2490:	700c           	moveq #12,d0
    2492:	e16e           	lsl.w d0,d6
    2494:	342f 0038      	move.w 56(sp),d2
    2498:	b46f 002e      	cmp.w 46(sp),d2
    249c:	6200 0172      	bhi.w 2610 <Zoom_ZoomIntoPicture+0x232>
  hw->bltcon0 = 0x9f0 + shiftright;
    24a0:	0646 09f0      	addi.w #2544,d6
    24a4:	342f 003e      	move.w 62(sp),d2
    WORD linesleft = 272;
    24a8:	363c 0110      	move.w #272,d3
    24ac:	2805           	move.l d5,d4
    24ae:	d8af 0030      	add.l 48(sp),d4
    24b2:	266f 0030      	movea.l 48(sp),a3
        if( linesleft >= ZoomHorizontal+1) {
    24b6:	b642           	cmp.w d2,d3
    24b8:	6f00 00c4      	ble.w 257e <Zoom_ZoomIntoPicture+0x1a0>
          linesleft -= ZoomHorizontal;
    24bc:	9642           	sub.w d2,d3
    24be:	3e03           	move.w d3,d7
  WaitBlit();
    24c0:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    24c6:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    24ca:	2079 0000 633e 	movea.l 633e <hw>,a0
    24d0:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    24d6:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    24da:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    24e0:	317c ffff 0046 	move.w #-1,70(a0)
  *bp = 0;
    24e6:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltamod = ZMLINESIZE - 4;
    24ea:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    24f0:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    24f6:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
    24fa:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    24fe:	ed4a           	lsl.w #6,d2
    2500:	5442           	addq.w #2,d2
    2502:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    2506:	3079 0000 6346 	movea.w 6346 <ZoomHorizontal>,a0
    250c:	2008           	move.l a0,d0
    250e:	d088           	add.l a0,d0
    2510:	d088           	add.l a0,d0
    2512:	e988           	lsl.l #4,d0
    2514:	da80           	add.l d0,d5
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    2516:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    2518:	4a47           	tst.w d7
    251a:	6f00 00cc      	ble.w 25e8 <Zoom_ZoomIntoPicture+0x20a>
          Zoom_CopyWord( pos4source+shifttoleft, pos4dest, shiftright, 1);
    251e:	2805           	move.l d5,d4
    2520:	d88b           	add.l a3,d4
  WaitBlit();
    2522:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    2528:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    252c:	2079 0000 633e 	movea.l 633e <hw>,a0
    2532:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    2538:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    253c:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2542:	317c ffff 0046 	move.w #-1,70(a0)
  *bp = 0;
    2548:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltamod = ZMLINESIZE - 4;
    254c:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    2552:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    2558:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
    255c:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    2560:	317c 0042 0058 	move.w #66,88(a0)
          linesleft--;
    2566:	5343           	subq.w #1,d3
          pos4dest += ZMLINESIZE/2;
    2568:	45ea 0030      	lea 48(a2),a2
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    256c:	33cd 0000 6346 	move.w a5,6346 <ZoomHorizontal>
      while(linesleft > 0) {
    2572:	4a43           	tst.w d3
    2574:	6778           	beq.s 25ee <Zoom_ZoomIntoPicture+0x210>
    2576:	340d           	move.w a5,d2
        if( linesleft >= ZoomHorizontal+1) {
    2578:	b642           	cmp.w d2,d3
    257a:	6e00 ff40      	bgt.w 24bc <Zoom_ZoomIntoPicture+0xde>
          ZoomHorizontal = linesleft;
    257e:	33c3 0000 6346 	move.w d3,6346 <ZoomHorizontal>
    2584:	3403           	move.w d3,d2
    2586:	4243           	clr.w d3
          linesleft = 0;
    2588:	4247           	clr.w d7
  WaitBlit();
    258a:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    2590:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    2594:	2079 0000 633e 	movea.l 633e <hw>,a0
    259a:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    25a0:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    25a4:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    25aa:	317c ffff 0046 	move.w #-1,70(a0)
  *bp = 0;
    25b0:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltamod = ZMLINESIZE - 4;
    25b4:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    25ba:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    25c0:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
    25c4:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    25c8:	ed4a           	lsl.w #6,d2
    25ca:	5442           	addq.w #2,d2
    25cc:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    25d0:	3079 0000 6346 	movea.w 6346 <ZoomHorizontal>,a0
    25d6:	2008           	move.l a0,d0
    25d8:	d088           	add.l a0,d0
    25da:	d088           	add.l a0,d0
    25dc:	e988           	lsl.l #4,d0
    25de:	da80           	add.l d0,d5
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    25e0:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    25e2:	4a47           	tst.w d7
    25e4:	6e00 ff38      	bgt.w 251e <Zoom_ZoomIntoPicture+0x140>
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    25e8:	33cd 0000 6346 	move.w a5,6346 <ZoomHorizontal>
    startofword -= 16;
    25ee:	066f fff0 002e 	addi.w #-16,46(sp)
    25f4:	55af 0034      	subq.l #2,52(sp)
    25f8:	55af 003a      	subq.l #2,58(sp)
  for(int i=0;i<22;i++) {
    25fc:	0c6f fff0 002e 	cmpi.w #-16,46(sp)
    2602:	6600 fe66      	bne.w 246a <Zoom_ZoomIntoPicture+0x8c>
}
    2606:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    260a:	4fef 001c      	lea 28(sp),sp
    260e:	4e75           	rts
    2610:	3002           	move.w d2,d0
      UWORD colnr = nextzoom - startofword - 1; 
    2612:	5340           	subq.w #1,d0
    2614:	906f 002e      	sub.w 46(sp),d0
      nextzoom -= (19 + zoomnr);
    2618:	342f 0046      	move.w 70(sp),d2
    261c:	d56f 0038      	add.w d2,56(sp)
    shifta = (shift - 1) << 12;
    2620:	342f 002c      	move.w 44(sp),d2
    2624:	5342           	subq.w #1,d2
    2626:	3f42 0040      	move.w d2,64(sp)
    262a:	3202           	move.w d2,d1
    262c:	740c           	moveq #12,d2
    262e:	e569           	lsl.w d2,d1
  hw->bltcon0 = 0xde4 + shifta;
    2630:	3e3c f000      	move.w #-4096,d7
    2634:	4a6f 002c      	tst.w 44(sp)
    2638:	6702           	beq.s 263c <Zoom_ZoomIntoPicture+0x25e>
    263a:	3e01           	move.w d1,d7
    263c:	0647 0de4      	addi.w #3556,d7
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    2640:	0280 0000 ffff 	andi.l #65535,d0
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    2646:	7210           	moveq #16,d1
    2648:	9280           	sub.l d0,d1
    264a:	7400           	moveq #0,d2
    264c:	4642           	not.w d2
    264e:	e3aa           	lsl.l d1,d2
    2650:	2642           	movea.l d2,a3
    2652:	342f 003e      	move.w 62(sp),d2
    WORD linesleft = 272;
    2656:	363c 0110      	move.w #272,d3
    265a:	282f 0034      	move.l 52(sp),d4
    265e:	d8af 0030      	add.l 48(sp),d4
        if( linesleft >= ZoomHorizontal+1) {
    2662:	b642           	cmp.w d2,d3
    2664:	6f00 00b2      	ble.w 2718 <Zoom_ZoomIntoPicture+0x33a>
          linesleft -= ZoomHorizontal;
    2668:	9642           	sub.w d2,d3
    srca = source + 1;
    266a:	2844           	movea.l d4,a4
  if( shift == 0) {
    266c:	4a6f 002c      	tst.w 44(sp)
    2670:	6602           	bne.s 2674 <Zoom_ZoomIntoPicture+0x296>
    srca = source + 1;
    2672:	548c           	addq.l #2,a4
  WaitBlit();
    2674:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    267a:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    267e:	2079 0000 633e 	movea.l 633e <hw>,a0
    2684:	3146 0042      	move.w d6,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    2688:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
    268c:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2692:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    2698:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    269e:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    26a4:	314b 0070      	move.w a3,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    26a8:	317c 002c 0066 	move.w #44,102(a0)
  *bp = 0;
    26ae:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltapt = srca;
    26b2:	214c 0050      	move.l a4,80(a0)
  hw->bltbpt = srcb;
    26b6:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    26ba:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    26be:	ed4a           	lsl.w #6,d2
    26c0:	5442           	addq.w #2,d2
    26c2:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    26c6:	3079 0000 6346 	movea.w 6346 <ZoomHorizontal>,a0
    26cc:	2008           	move.l a0,d0
    26ce:	d088           	add.l a0,d0
    26d0:	d088           	add.l a0,d0
    26d2:	e988           	lsl.l #4,d0
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    26d4:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    26d6:	4a43           	tst.w d3
    26d8:	6e4c           	bgt.s 2726 <Zoom_ZoomIntoPicture+0x348>
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    26da:	33cd 0000 6346 	move.w a5,6346 <ZoomHorizontal>
      shiftright--;  
    26e0:	3f6f 0040 002c 	move.w 64(sp),44(sp)
      if(shiftright < 0) {
    26e6:	6c00 ff06      	bge.w 25ee <Zoom_ZoomIntoPicture+0x210>
        shiftright += 16;
    26ea:	342f 0044      	move.w 68(sp),d2
    26ee:	0642 000f      	addi.w #15,d2
    26f2:	3f42 002c      	move.w d2,44(sp)
        shifttoleft = 1;
    26f6:	3f7c 0001 0042 	move.w #1,66(sp)
    startofword -= 16;
    26fc:	066f fff0 002e 	addi.w #-16,46(sp)
    2702:	55af 0034      	subq.l #2,52(sp)
    2706:	55af 003a      	subq.l #2,58(sp)
  for(int i=0;i<22;i++) {
    270a:	0c6f fff0 002e 	cmpi.w #-16,46(sp)
    2710:	6600 fd58      	bne.w 246a <Zoom_ZoomIntoPicture+0x8c>
    2714:	6000 fef0      	bra.w 2606 <Zoom_ZoomIntoPicture+0x228>
          ZoomHorizontal = linesleft;
    2718:	33c3 0000 6346 	move.w d3,6346 <ZoomHorizontal>
    271e:	3403           	move.w d3,d2
          linesleft = 0;
    2720:	4243           	clr.w d3
    2722:	6000 ff46      	bra.w 266a <Zoom_ZoomIntoPicture+0x28c>
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    2726:	da80           	add.l d0,d5
          Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    2728:	282f 0030      	move.l 48(sp),d4
    272c:	d885           	add.l d5,d4
    srca = source + 1;
    272e:	2404           	move.l d4,d2
  if( shift == 0) {
    2730:	4a6f 002c      	tst.w 44(sp)
    2734:	6602           	bne.s 2738 <Zoom_ZoomIntoPicture+0x35a>
    srca = source + 1;
    2736:	5482           	addq.l #2,d2
  WaitBlit();
    2738:	2c79 0000 6342 	movea.l 6342 <GfxBase>,a6
    273e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    2742:	2079 0000 633e 	movea.l 633e <hw>,a0
    2748:	3146 0042      	move.w d6,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    274c:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
    2750:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2756:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    275c:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    2762:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    2768:	314b 0070      	move.w a3,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    276c:	317c 002c 0066 	move.w #44,102(a0)
  *bp = 0;
    2772:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltapt = srca;
    2776:	2142 0050      	move.l d2,80(a0)
  hw->bltbpt = srcb;
    277a:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    277e:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    2782:	317c 0042 0058 	move.w #66,88(a0)
          pos4dest += ZMLINESIZE/2;
    2788:	45ea 0030      	lea 48(a2),a2
          linesleft--;
    278c:	5343           	subq.w #1,d3
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    278e:	33cd 0000 6346 	move.w a5,6346 <ZoomHorizontal>
      while( linesleft > 0)
    2794:	4a43           	tst.w d3
    2796:	6700 ff48      	beq.w 26e0 <Zoom_ZoomIntoPicture+0x302>
    279a:	340d           	move.w a5,d2
    279c:	6000 fec4      	bra.w 2662 <Zoom_ZoomIntoPicture+0x284>
  WORD shiftright = 9;
    27a0:	7e09           	moveq #9,d7
  *bp2 = 0;
    27a2:	4278 0206      	clr.w 206 <main+0x200>
  WORD ZoomHorizontalStart = 15 - zoomnr * 6;
    27a6:	3208           	move.w a0,d1
    27a8:	d240           	add.w d0,d1
    27aa:	d241           	add.w d1,d1
    27ac:	740f           	moveq #15,d2
    27ae:	9441           	sub.w d1,d2
    27b0:	3f42 003e      	move.w d2,62(sp)
  while( ZoomHorizontalStart < 0) {
    27b4:	6d00 fc72      	blt.w 2428 <Zoom_ZoomIntoPicture+0x4a>
    27b8:	223c 8000 00d6 	move.l #-2147483434,d1
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    27be:	90c0           	suba.w d0,a0
    27c0:	3a48           	movea.w a0,a5
    27c2:	4bed 000f      	lea 15(a5),a5
    27c6:	d281           	add.l d1,d1
    27c8:	d2af 004c      	add.l 76(sp),d1
    27cc:	2f41 0034      	move.l d1,52(sp)
    27d0:	742c           	moveq #44,d2
    27d2:	d4af 0050      	add.l 80(sp),d2
    27d6:	2f42 003a      	move.l d2,58(sp)
  UWORD shifttoleft = 0;
    27da:	426f 0042      	clr.w 66(sp)
  UWORD startofword = 21*16;
    27de:	3f7c 0150 002e 	move.w #336,46(sp)
      nextzoom -= (19 + zoomnr);
    27e4:	74ed           	moveq #-19,d2
    27e6:	9449           	sub.w a1,d2
    27e8:	3f42 0046      	move.w d2,70(sp)
    WORD linesleft = 272;
    27ec:	3f47 002c      	move.w d7,44(sp)
    27f0:	6000 fc78      	bra.w 246a <Zoom_ZoomIntoPicture+0x8c>

000027f4 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    27f4:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    27f8:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    27fe:	203c 0000 a48c 	move.l #42124,d0
    2804:	7202           	moveq #2,d1
    2806:	4eae ff3a      	jsr -198(a6)
    280a:	2440           	movea.l d0,a2
  if( retval == 0) {
    280c:	4a80           	tst.l d0
    280e:	6700 0160      	beq.w 2970 <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    2812:	24b9 0000 61f8 	move.l 61f8 <ClsSprites>,(a2)
    2818:	2579 0000 61fc 	move.l 61fc <ClsSprites+0x4>,4(a2)
    281e:	0004 
    2820:	2579 0000 6200 	move.l 6200 <ClsSprites+0x8>,8(a2)
    2826:	0008 
    2828:	2579 0000 6204 	move.l 6204 <ClsSprites+0xc>,12(a2)
    282e:	000c 
    2830:	2579 0000 6208 	move.l 6208 <ClsSprites+0x10>,16(a2)
    2836:	0010 
    2838:	2579 0000 620c 	move.l 620c <ClsSprites+0x14>,20(a2)
    283e:	0014 
    2840:	2579 0000 6210 	move.l 6210 <ClsSprites+0x18>,24(a2)
    2846:	0018 
    2848:	2579 0000 6214 	move.l 6214 <ClsSprites+0x1c>,28(a2)
    284e:	001c 
    2850:	2579 0000 6218 	move.l 6218 <ClsSprites+0x20>,32(a2)
    2856:	0020 
    2858:	2579 0000 621c 	move.l 621c <ClsSprites+0x24>,36(a2)
    285e:	0024 
    2860:	2579 0000 6220 	move.l 6220 <ClsSprites+0x28>,40(a2)
    2866:	0028 
    2868:	2579 0000 6224 	move.l 6224 <ClsSprites+0x2c>,44(a2)
    286e:	002c 
    2870:	2579 0000 6228 	move.l 6228 <ClsSprites+0x30>,48(a2)
    2876:	0030 
    2878:	2579 0000 622c 	move.l 622c <ClsSprites+0x34>,52(a2)
    287e:	0034 
    2880:	2579 0000 6230 	move.l 6230 <ClsSprites+0x38>,56(a2)
    2886:	0038 
    2888:	2579 0000 6234 	move.l 6234 <ClsSprites+0x3c>,60(a2)
    288e:	003c 
    *cl++ = *clpartinstruction++;
    2890:	2579 0000 6190 	move.l 6190 <ClScreenZoom>,64(a2)
    2896:	0040 
    2898:	2579 0000 6194 	move.l 6194 <ClScreenZoom+0x4>,68(a2)
    289e:	0044 
    28a0:	2579 0000 6198 	move.l 6198 <ClScreenZoom+0x8>,72(a2)
    28a6:	0048 
    28a8:	2579 0000 619c 	move.l 619c <ClScreenZoom+0xc>,76(a2)
    28ae:	004c 
    28b0:	2579 0000 61a0 	move.l 61a0 <ClScreenZoom+0x10>,80(a2)
    28b6:	0050 
    28b8:	2579 0000 61a4 	move.l 61a4 <ClScreenZoom+0x14>,84(a2)
    28be:	0054 
    28c0:	2579 0000 61a8 	move.l 61a8 <ClScreenZoom+0x18>,88(a2)
    28c6:	0058 
    28c8:	2579 0000 61ac 	move.l 61ac <ClScreenZoom+0x1c>,92(a2)
    28ce:	005c 
    28d0:	2579 0000 61b0 	move.l 61b0 <ClScreenZoom+0x20>,96(a2)
    28d6:	0060 
    28d8:	2579 0000 61b4 	move.l 61b4 <ClScreenZoom+0x24>,100(a2)
    28de:	0064 
    28e0:	2579 0000 61b8 	move.l 61b8 <ClScreenZoom+0x28>,104(a2)
    28e6:	0068 
    28e8:	2579 0000 61bc 	move.l 61bc <ClScreenZoom+0x2c>,108(a2)
    28ee:	006c 
  *cl++ = 0x00e00000;
    28f0:	257c 00e0 0000 	move.l #14680064,112(a2)
    28f6:	0070 
  *cl++ = 0x00e20000;
    28f8:	257c 00e2 0000 	move.l #14811136,116(a2)
    28fe:	0074 
  *cl++ = 0x00e40000;
    2900:	257c 00e4 0000 	move.l #14942208,120(a2)
    2906:	0078 
  *cl++ = 0x00e60000;
    2908:	257c 00e6 0000 	move.l #15073280,124(a2)
    290e:	007c 
    *cl++ = *clpartinstruction++;
    2910:	2579 0000 61c0 	move.l 61c0 <ClColor>,128(a2)
    2916:	0080 
    2918:	2579 0000 61c4 	move.l 61c4 <ClColor+0x4>,132(a2)
    291e:	0084 
    2920:	43ea 012c      	lea 300(a2),a1
    2924:	220a           	move.l a2,d1
    2926:	0681 0000 a52c 	addi.l #42284,d1
    292c:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    2932:	41e9 ff60      	lea -160(a1),a0
    2936:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    293a:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    2940:	5088           	addq.l #8,a0
    2942:	217c 0182 0f00 	move.l #25300736,-4(a0)
    2948:	fffc 
    for(int i2=0;i2<20;i2++) {
    294a:	b3c8           	cmpa.l a0,a1
    294c:	66ec           	bne.s 293a <ClbuildZoom+0x146>
    294e:	43e8 00a4      	lea 164(a0),a1
    2952:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    2958:	b3c1           	cmpa.l d1,a1
    295a:	66d6           	bne.s 2932 <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    295c:	203c 0000 a488 	move.l #42120,d0
    2962:	72fe           	moveq #-2,d1
    2964:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    2968:	200a           	move.l a2,d0
    296a:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    296e:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2970:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    2976:	4eae ffc4      	jsr -60(a6)
    297a:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    2980:	2200           	move.l d0,d1
    2982:	243c 0000 39cd 	move.l #14797,d2
    2988:	7628           	moveq #40,d3
    298a:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    298e:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    2994:	7201           	moveq #1,d1
    2996:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    299a:	24b9 0000 61f8 	move.l 61f8 <ClsSprites>,(a2)
    29a0:	2579 0000 61fc 	move.l 61fc <ClsSprites+0x4>,4(a2)
    29a6:	0004 
    29a8:	2579 0000 6200 	move.l 6200 <ClsSprites+0x8>,8(a2)
    29ae:	0008 
    29b0:	2579 0000 6204 	move.l 6204 <ClsSprites+0xc>,12(a2)
    29b6:	000c 
    29b8:	2579 0000 6208 	move.l 6208 <ClsSprites+0x10>,16(a2)
    29be:	0010 
    29c0:	2579 0000 620c 	move.l 620c <ClsSprites+0x14>,20(a2)
    29c6:	0014 
    29c8:	2579 0000 6210 	move.l 6210 <ClsSprites+0x18>,24(a2)
    29ce:	0018 
    29d0:	2579 0000 6214 	move.l 6214 <ClsSprites+0x1c>,28(a2)
    29d6:	001c 
    29d8:	2579 0000 6218 	move.l 6218 <ClsSprites+0x20>,32(a2)
    29de:	0020 
    29e0:	2579 0000 621c 	move.l 621c <ClsSprites+0x24>,36(a2)
    29e6:	0024 
    29e8:	2579 0000 6220 	move.l 6220 <ClsSprites+0x28>,40(a2)
    29ee:	0028 
    29f0:	2579 0000 6224 	move.l 6224 <ClsSprites+0x2c>,44(a2)
    29f6:	002c 
    29f8:	2579 0000 6228 	move.l 6228 <ClsSprites+0x30>,48(a2)
    29fe:	0030 
    2a00:	2579 0000 622c 	move.l 622c <ClsSprites+0x34>,52(a2)
    2a06:	0034 
    2a08:	2579 0000 6230 	move.l 6230 <ClsSprites+0x38>,56(a2)
    2a0e:	0038 
    2a10:	2579 0000 6234 	move.l 6234 <ClsSprites+0x3c>,60(a2)
    2a16:	003c 
    *cl++ = *clpartinstruction++;
    2a18:	2579 0000 6190 	move.l 6190 <ClScreenZoom>,64(a2)
    2a1e:	0040 
    2a20:	2579 0000 6194 	move.l 6194 <ClScreenZoom+0x4>,68(a2)
    2a26:	0044 
    2a28:	2579 0000 6198 	move.l 6198 <ClScreenZoom+0x8>,72(a2)
    2a2e:	0048 
    2a30:	2579 0000 619c 	move.l 619c <ClScreenZoom+0xc>,76(a2)
    2a36:	004c 
    2a38:	2579 0000 61a0 	move.l 61a0 <ClScreenZoom+0x10>,80(a2)
    2a3e:	0050 
    2a40:	2579 0000 61a4 	move.l 61a4 <ClScreenZoom+0x14>,84(a2)
    2a46:	0054 
    2a48:	2579 0000 61a8 	move.l 61a8 <ClScreenZoom+0x18>,88(a2)
    2a4e:	0058 
    2a50:	2579 0000 61ac 	move.l 61ac <ClScreenZoom+0x1c>,92(a2)
    2a56:	005c 
    2a58:	2579 0000 61b0 	move.l 61b0 <ClScreenZoom+0x20>,96(a2)
    2a5e:	0060 
    2a60:	2579 0000 61b4 	move.l 61b4 <ClScreenZoom+0x24>,100(a2)
    2a66:	0064 
    2a68:	2579 0000 61b8 	move.l 61b8 <ClScreenZoom+0x28>,104(a2)
    2a6e:	0068 
    2a70:	2579 0000 61bc 	move.l 61bc <ClScreenZoom+0x2c>,108(a2)
    2a76:	006c 
  *cl++ = 0x00e00000;
    2a78:	257c 00e0 0000 	move.l #14680064,112(a2)
    2a7e:	0070 
  *cl++ = 0x00e20000;
    2a80:	257c 00e2 0000 	move.l #14811136,116(a2)
    2a86:	0074 
  *cl++ = 0x00e40000;
    2a88:	257c 00e4 0000 	move.l #14942208,120(a2)
    2a8e:	0078 
  *cl++ = 0x00e60000;
    2a90:	257c 00e6 0000 	move.l #15073280,124(a2)
    2a96:	007c 
    *cl++ = *clpartinstruction++;
    2a98:	2579 0000 61c0 	move.l 61c0 <ClColor>,128(a2)
    2a9e:	0080 
    2aa0:	2579 0000 61c4 	move.l 61c4 <ClColor+0x4>,132(a2)
    2aa6:	0084 
    2aa8:	43ea 012c      	lea 300(a2),a1
    2aac:	220a           	move.l a2,d1
    2aae:	0681 0000 a52c 	addi.l #42284,d1
    2ab4:	203c 2c07 fffe 	move.l #738721790,d0
    2aba:	6000 fe76      	bra.w 2932 <ClbuildZoom+0x13e>

00002abe <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    2abe:	2039 0000 6354 	move.l 6354 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    2ac4:	23f9 0000 6348 	move.l 6348 <ViewCopper>,6354 <DrawCopper>
    2aca:	0000 6354 
  ViewCopper = (ULONG *)tmp;
    2ace:	23c0 0000 6348 	move.l d0,6348 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    2ad4:	2079 0000 633e 	movea.l 633e <hw>,a0
    2ada:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    2ade:	3140 0088      	move.w d0,136(a0)
}
    2ae2:	4e75           	rts

00002ae4 <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    2ae4:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    2ae8:	45fa fd0a      	lea 27f4 <ClbuildZoom>(pc),a2
    2aec:	4e92           	jsr (a2)
    2aee:	23c0 0000 6364 	move.l d0,6364 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    2af4:	4e92           	jsr (a2)
    2af6:	23c0 0000 6360 	move.l d0,6360 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2afc:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    2b02:	203c 0001 6800 	move.l #92160,d0
    2b08:	7202           	moveq #2,d1
    2b0a:	4eae ff3a      	jsr -198(a6)
    2b0e:	23c0 0000 635c 	move.l d0,635c <Bitplane1>
  if(Bitplane1 == 0) {
    2b14:	6700 014e      	beq.w 2c64 <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    2b18:	23c0 0000 6358 	move.l d0,6358 <DrawBuffer>
  DrawCopper = Copperlist1;
    2b1e:	23f9 0000 6364 	move.l 6364 <Copperlist1>,6354 <DrawCopper>
    2b24:	0000 6354 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2b28:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    2b2e:	203c 0001 6800 	move.l #92160,d0
    2b34:	7202           	moveq #2,d1
    2b36:	4eae ff3a      	jsr -198(a6)
    2b3a:	2400           	move.l d0,d2
    2b3c:	23c0 0000 6350 	move.l d0,6350 <Bitplane2>
  if(Bitplane2 == 0) {
    2b42:	6778           	beq.s 2bbc <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    2b44:	23f9 0000 6360 	move.l 6360 <Copperlist2>,6348 <ViewCopper>
    2b4a:	0000 6348 
  SwapCl();
    2b4e:	45fa ff6e      	lea 2abe <SwapCl>(pc),a2
    2b52:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    2b54:	2039 0000 6358 	move.l 6358 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2b5a:	2079 0000 6354 	movea.l 6354 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2b60:	2200           	move.l d0,d1
    2b62:	4241           	clr.w d1
    2b64:	4841           	swap d1
    2b66:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    2b6a:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    2b6e:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2b74:	2200           	move.l d0,d1
    2b76:	4241           	clr.w d1
    2b78:	4841           	swap d1
    2b7a:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2b7e:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    2b82:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    2b84:	2079 0000 6354 	movea.l 6354 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2b8a:	2002           	move.l d2,d0
    2b8c:	4240           	clr.w d0
    2b8e:	4840           	swap d0
    2b90:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    2b94:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    2b98:	2002           	move.l d2,d0
    2b9a:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2ba0:	2200           	move.l d0,d1
    2ba2:	4241           	clr.w d1
    2ba4:	4841           	swap d1
    2ba6:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2baa:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    2bae:	23c2 0000 634c 	move.l d2,634c <ViewBuffer>
}
    2bb4:	7000           	moveq #0,d0
    2bb6:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2bba:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2bbc:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    2bc2:	4eae ffc4      	jsr -60(a6)
    2bc6:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    2bcc:	2200           	move.l d0,d1
    2bce:	243c 0000 3a1a 	move.l #14874,d2
    2bd4:	7626           	moveq #38,d3
    2bd6:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2bda:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    2be0:	7201           	moveq #1,d1
    2be2:	4eae ff70      	jsr -144(a6)
    2be6:	2439 0000 6350 	move.l 6350 <Bitplane2>,d2
  ViewCopper = Copperlist2;
    2bec:	23f9 0000 6360 	move.l 6360 <Copperlist2>,6348 <ViewCopper>
    2bf2:	0000 6348 
  SwapCl();
    2bf6:	45fa fec6      	lea 2abe <SwapCl>(pc),a2
    2bfa:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    2bfc:	2039 0000 6358 	move.l 6358 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2c02:	2079 0000 6354 	movea.l 6354 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2c08:	2200           	move.l d0,d1
    2c0a:	4241           	clr.w d1
    2c0c:	4841           	swap d1
    2c0e:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    2c12:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    2c16:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2c1c:	2200           	move.l d0,d1
    2c1e:	4241           	clr.w d1
    2c20:	4841           	swap d1
    2c22:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2c26:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    2c2a:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    2c2c:	2079 0000 6354 	movea.l 6354 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2c32:	2002           	move.l d2,d0
    2c34:	4240           	clr.w d0
    2c36:	4840           	swap d0
    2c38:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    2c3c:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    2c40:	2002           	move.l d2,d0
    2c42:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2c48:	2200           	move.l d0,d1
    2c4a:	4241           	clr.w d1
    2c4c:	4841           	swap d1
    2c4e:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2c52:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    2c56:	23c2 0000 634c 	move.l d2,634c <ViewBuffer>
}
    2c5c:	7000           	moveq #0,d0
    2c5e:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2c62:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2c64:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    2c6a:	4eae ffc4      	jsr -60(a6)
    2c6e:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    2c74:	2200           	move.l d0,d1
    2c76:	243c 0000 39f3 	move.l #14835,d2
    2c7c:	7626           	moveq #38,d3
    2c7e:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2c82:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    2c88:	7201           	moveq #1,d1
    2c8a:	4eae ff70      	jsr -144(a6)
    2c8e:	2039 0000 635c 	move.l 635c <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    2c94:	23c0 0000 6358 	move.l d0,6358 <DrawBuffer>
  DrawCopper = Copperlist1;
    2c9a:	23f9 0000 6364 	move.l 6364 <Copperlist1>,6354 <DrawCopper>
    2ca0:	0000 6354 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2ca4:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    2caa:	203c 0001 6800 	move.l #92160,d0
    2cb0:	7202           	moveq #2,d1
    2cb2:	4eae ff3a      	jsr -198(a6)
    2cb6:	2400           	move.l d0,d2
    2cb8:	23c0 0000 6350 	move.l d0,6350 <Bitplane2>
  if(Bitplane2 == 0) {
    2cbe:	6600 fe84      	bne.w 2b44 <PrepareDisplayZoom+0x60>
    2cc2:	6000 fef8      	bra.w 2bbc <PrepareDisplayZoom+0xd8>

00002cc6 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2cc6:	2039 0000 6358 	move.l 6358 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2ccc:	2079 0000 6354 	movea.l 6354 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    2cd2:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2cd6:	2200           	move.l d0,d1
    2cd8:	4241           	clr.w d1
    2cda:	4841           	swap d1
    2cdc:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    2ce0:	23f9 0000 634c 	move.l 634c <ViewBuffer>,6358 <DrawBuffer>
    2ce6:	0000 6358 
  ViewBuffer = (ULONG *) tmp;
    2cea:	23c0 0000 634c 	move.l d0,634c <ViewBuffer>
}
    2cf0:	4e75           	rts

00002cf2 <PrepareDisplay>:
 int PrepareDisplaySW() {
    2cf2:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    2cf6:	45fa f488      	lea 2180 <ClBuild>(pc),a2
    2cfa:	4e92           	jsr (a2)
    2cfc:	23c0 0000 6364 	move.l d0,6364 <Copperlist1>
  Copperlist2 = ClbuildSW();
    2d02:	4e92           	jsr (a2)
    2d04:	23c0 0000 6360 	move.l d0,6360 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2d0a:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    2d10:	203c 0000 c800 	move.l #51200,d0
    2d16:	7202           	moveq #2,d1
    2d18:	4eae ff3a      	jsr -198(a6)
    2d1c:	23c0 0000 635c 	move.l d0,635c <Bitplane1>
  if(Bitplane1 == 0) {
    2d22:	6700 00ac      	beq.w 2dd0 <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    2d26:	23c0 0000 6358 	move.l d0,6358 <DrawBuffer>
  DrawCopper = Copperlist1;
    2d2c:	23f9 0000 6364 	move.l 6364 <Copperlist1>,6354 <DrawCopper>
    2d32:	0000 6354 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2d36:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    2d3c:	203c 0000 c800 	move.l #51200,d0
    2d42:	7202           	moveq #2,d1
    2d44:	4eae ff3a      	jsr -198(a6)
    2d48:	23c0 0000 6350 	move.l d0,6350 <Bitplane2>
  if(Bitplane2 == 0) {
    2d4e:	6728           	beq.s 2d78 <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    2d50:	23c0 0000 634c 	move.l d0,634c <ViewBuffer>
  ViewCopper = Copperlist2;
    2d56:	23f9 0000 6360 	move.l 6360 <Copperlist2>,6348 <ViewCopper>
    2d5c:	0000 6348 
  SwapCl();
    2d60:	47fa fd5c      	lea 2abe <SwapCl>(pc),a3
    2d64:	4e93           	jsr (a3)
  SetBplPointers();
    2d66:	45fa ff5e      	lea 2cc6 <SetBplPointers>(pc),a2
    2d6a:	4e92           	jsr (a2)
  SwapCl();
    2d6c:	4e93           	jsr (a3)
  SetBplPointers();
    2d6e:	4e92           	jsr (a2)
}
    2d70:	7000           	moveq #0,d0
    2d72:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    2d76:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2d78:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    2d7e:	4eae ffc4      	jsr -60(a6)
    2d82:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    2d88:	2200           	move.l d0,d1
    2d8a:	243c 0000 3a1a 	move.l #14874,d2
    2d90:	7626           	moveq #38,d3
    2d92:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2d96:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    2d9c:	7201           	moveq #1,d1
    2d9e:	4eae ff70      	jsr -144(a6)
    2da2:	2039 0000 6350 	move.l 6350 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    2da8:	23c0 0000 634c 	move.l d0,634c <ViewBuffer>
  ViewCopper = Copperlist2;
    2dae:	23f9 0000 6360 	move.l 6360 <Copperlist2>,6348 <ViewCopper>
    2db4:	0000 6348 
  SwapCl();
    2db8:	47fa fd04      	lea 2abe <SwapCl>(pc),a3
    2dbc:	4e93           	jsr (a3)
  SetBplPointers();
    2dbe:	45fa ff06      	lea 2cc6 <SetBplPointers>(pc),a2
    2dc2:	4e92           	jsr (a2)
  SwapCl();
    2dc4:	4e93           	jsr (a3)
  SetBplPointers();
    2dc6:	4e92           	jsr (a2)
}
    2dc8:	7000           	moveq #0,d0
    2dca:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    2dce:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2dd0:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    2dd6:	4eae ffc4      	jsr -60(a6)
    2dda:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    2de0:	2200           	move.l d0,d1
    2de2:	243c 0000 39f3 	move.l #14835,d2
    2de8:	7626           	moveq #38,d3
    2dea:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2dee:	2c79 0000 6368 	movea.l 6368 <DOSBase>,a6
    2df4:	7201           	moveq #1,d1
    2df6:	4eae ff70      	jsr -144(a6)
    2dfa:	2039 0000 635c 	move.l 635c <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    2e00:	23c0 0000 6358 	move.l d0,6358 <DrawBuffer>
  DrawCopper = Copperlist1;
    2e06:	23f9 0000 6364 	move.l 6364 <Copperlist1>,6354 <DrawCopper>
    2e0c:	0000 6354 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2e10:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    2e16:	203c 0000 c800 	move.l #51200,d0
    2e1c:	7202           	moveq #2,d1
    2e1e:	4eae ff3a      	jsr -198(a6)
    2e22:	23c0 0000 6350 	move.l d0,6350 <Bitplane2>
  if(Bitplane2 == 0) {
    2e28:	6600 ff26      	bne.w 2d50 <PrepareDisplay+0x5e>
    2e2c:	6000 ff4a      	bra.w 2d78 <PrepareDisplay+0x86>

00002e30 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    2e30:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    2e34:	262f 0010      	move.l 16(sp),d3
    2e38:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    2e3c:	2279 0000 6364 	movea.l 6364 <Copperlist1>,a1
    2e42:	b2fc 0000      	cmpa.w #0,a1
    2e46:	670c           	beq.s 2e54 <FreeDisplay+0x24>
    2e48:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    2e4e:	2003           	move.l d3,d0
    2e50:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    2e54:	2279 0000 6360 	movea.l 6360 <Copperlist2>,a1
    2e5a:	b2fc 0000      	cmpa.w #0,a1
    2e5e:	670c           	beq.s 2e6c <FreeDisplay+0x3c>
    2e60:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    2e66:	2003           	move.l d3,d0
    2e68:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    2e6c:	2279 0000 635c 	movea.l 635c <Bitplane1>,a1
    2e72:	b2fc 0000      	cmpa.w #0,a1
    2e76:	670c           	beq.s 2e84 <FreeDisplay+0x54>
    2e78:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    2e7e:	2002           	move.l d2,d0
    2e80:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    2e84:	2279 0000 6350 	movea.l 6350 <Bitplane2>,a1
    2e8a:	b2fc 0000      	cmpa.w #0,a1
    2e8e:	670c           	beq.s 2e9c <FreeDisplay+0x6c>
    2e90:	2c79 0000 636c 	movea.l 636c <SysBase>,a6
    2e96:	2002           	move.l d2,d0
    2e98:	4eae ff2e      	jsr -210(a6)
}
    2e9c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2ea0:	4e75           	rts

00002ea2 <WaitVbl>:
void WaitVbl() {
    2ea2:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    2ea4:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddbd4f>,d0
    2eaa:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    2eac:	2017           	move.l (sp),d0
    2eae:	0280 0001 ff00 	andi.l #130816,d0
    2eb4:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    2eb6:	2017           	move.l (sp),d0
    2eb8:	0c80 0001 3700 	cmpi.l #79616,d0
    2ebe:	67e4           	beq.s 2ea4 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    2ec0:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddbd4f>,d0
    2ec6:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    2eca:	202f 0004      	move.l 4(sp),d0
    2ece:	0280 0001 ff00 	andi.l #130816,d0
    2ed4:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    2ed8:	202f 0004      	move.l 4(sp),d0
    2edc:	0c80 0001 3700 	cmpi.l #79616,d0
    2ee2:	66dc           	bne.s 2ec0 <WaitVbl+0x1e>
}
    2ee4:	508f           	addq.l #8,sp
    2ee6:	4e75           	rts

00002ee8 <memcpy>:
{
    2ee8:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    2eec:	202f 0014      	move.l 20(sp),d0
    2ef0:	226f 0018      	movea.l 24(sp),a1
    2ef4:	222f 001c      	move.l 28(sp),d1
	while(len--)
    2ef8:	2601           	move.l d1,d3
    2efa:	5383           	subq.l #1,d3
    2efc:	4a81           	tst.l d1
    2efe:	6762           	beq.s 2f62 <memcpy+0x7a>
    2f00:	2040           	movea.l d0,a0
    2f02:	5888           	addq.l #4,a0
    2f04:	b1c9           	cmpa.l a1,a0
    2f06:	53c2           	sl.s d2
    2f08:	4402           	neg.b d2
    2f0a:	41e9 0004      	lea 4(a1),a0
    2f0e:	b1c0           	cmpa.l d0,a0
    2f10:	53c4           	sl.s d4
    2f12:	4404           	neg.b d4
    2f14:	8404           	or.b d4,d2
    2f16:	7808           	moveq #8,d4
    2f18:	b883           	cmp.l d3,d4
    2f1a:	55c4           	sc.s d4
    2f1c:	4404           	neg.b d4
    2f1e:	c404           	and.b d4,d2
    2f20:	6746           	beq.s 2f68 <memcpy+0x80>
    2f22:	2409           	move.l a1,d2
    2f24:	8480           	or.l d0,d2
    2f26:	7803           	moveq #3,d4
    2f28:	c484           	and.l d4,d2
    2f2a:	663c           	bne.s 2f68 <memcpy+0x80>
    2f2c:	2049           	movea.l a1,a0
    2f2e:	2440           	movea.l d0,a2
    2f30:	74fc           	moveq #-4,d2
    2f32:	c481           	and.l d1,d2
    2f34:	d489           	add.l a1,d2
		*d++ = *s++;
    2f36:	24d8           	move.l (a0)+,(a2)+
    2f38:	b488           	cmp.l a0,d2
    2f3a:	66fa           	bne.s 2f36 <memcpy+0x4e>
    2f3c:	74fc           	moveq #-4,d2
    2f3e:	c481           	and.l d1,d2
    2f40:	2040           	movea.l d0,a0
    2f42:	d1c2           	adda.l d2,a0
    2f44:	d3c2           	adda.l d2,a1
    2f46:	9682           	sub.l d2,d3
    2f48:	b481           	cmp.l d1,d2
    2f4a:	6716           	beq.s 2f62 <memcpy+0x7a>
    2f4c:	1091           	move.b (a1),(a0)
	while(len--)
    2f4e:	4a83           	tst.l d3
    2f50:	6710           	beq.s 2f62 <memcpy+0x7a>
		*d++ = *s++;
    2f52:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    2f58:	5383           	subq.l #1,d3
    2f5a:	6706           	beq.s 2f62 <memcpy+0x7a>
		*d++ = *s++;
    2f5c:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    2f62:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    2f66:	4e75           	rts
    2f68:	2040           	movea.l d0,a0
    2f6a:	d289           	add.l a1,d1
		*d++ = *s++;
    2f6c:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    2f6e:	b289           	cmp.l a1,d1
    2f70:	67f0           	beq.s 2f62 <memcpy+0x7a>
		*d++ = *s++;
    2f72:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    2f74:	b289           	cmp.l a1,d1
    2f76:	66f4           	bne.s 2f6c <memcpy+0x84>
    2f78:	60e8           	bra.s 2f62 <memcpy+0x7a>

00002f7a <memset>:
{
    2f7a:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    2f7e:	202f 0024      	move.l 36(sp),d0
    2f82:	2a2f 0028      	move.l 40(sp),d5
    2f86:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    2f8a:	2809           	move.l a1,d4
    2f8c:	5384           	subq.l #1,d4
    2f8e:	b2fc 0000      	cmpa.w #0,a1
    2f92:	6f00 00b0      	ble.w 3044 <memset+0xca>
    2f96:	1e05           	move.b d5,d7
    2f98:	2200           	move.l d0,d1
    2f9a:	4481           	neg.l d1
    2f9c:	7403           	moveq #3,d2
    2f9e:	c282           	and.l d2,d1
    2fa0:	7c05           	moveq #5,d6
		*ptr++ = val;
    2fa2:	2440           	movea.l d0,a2
    2fa4:	bc84           	cmp.l d4,d6
    2fa6:	646a           	bcc.s 3012 <memset+0x98>
    2fa8:	4a81           	tst.l d1
    2faa:	6724           	beq.s 2fd0 <memset+0x56>
    2fac:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    2fae:	5384           	subq.l #1,d4
    2fb0:	7401           	moveq #1,d2
    2fb2:	b481           	cmp.l d1,d2
    2fb4:	671a           	beq.s 2fd0 <memset+0x56>
		*ptr++ = val;
    2fb6:	2440           	movea.l d0,a2
    2fb8:	548a           	addq.l #2,a2
    2fba:	2040           	movea.l d0,a0
    2fbc:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    2fc0:	5384           	subq.l #1,d4
    2fc2:	7403           	moveq #3,d2
    2fc4:	b481           	cmp.l d1,d2
    2fc6:	6608           	bne.s 2fd0 <memset+0x56>
		*ptr++ = val;
    2fc8:	528a           	addq.l #1,a2
    2fca:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    2fce:	5384           	subq.l #1,d4
    2fd0:	2609           	move.l a1,d3
    2fd2:	9681           	sub.l d1,d3
    2fd4:	7c00           	moveq #0,d6
    2fd6:	1c05           	move.b d5,d6
    2fd8:	2406           	move.l d6,d2
    2fda:	4842           	swap d2
    2fdc:	4242           	clr.w d2
    2fde:	2042           	movea.l d2,a0
    2fe0:	2406           	move.l d6,d2
    2fe2:	e14a           	lsl.w #8,d2
    2fe4:	4842           	swap d2
    2fe6:	4242           	clr.w d2
    2fe8:	e18e           	lsl.l #8,d6
    2fea:	2646           	movea.l d6,a3
    2fec:	2c08           	move.l a0,d6
    2fee:	8486           	or.l d6,d2
    2ff0:	2c0b           	move.l a3,d6
    2ff2:	8486           	or.l d6,d2
    2ff4:	1407           	move.b d7,d2
    2ff6:	2040           	movea.l d0,a0
    2ff8:	d1c1           	adda.l d1,a0
    2ffa:	72fc           	moveq #-4,d1
    2ffc:	c283           	and.l d3,d1
    2ffe:	d288           	add.l a0,d1
		*ptr++ = val;
    3000:	20c2           	move.l d2,(a0)+
    3002:	b1c1           	cmpa.l d1,a0
    3004:	66fa           	bne.s 3000 <memset+0x86>
    3006:	72fc           	moveq #-4,d1
    3008:	c283           	and.l d3,d1
    300a:	d5c1           	adda.l d1,a2
    300c:	9881           	sub.l d1,d4
    300e:	b283           	cmp.l d3,d1
    3010:	6732           	beq.s 3044 <memset+0xca>
    3012:	1485           	move.b d5,(a2)
	while(len-- > 0)
    3014:	4a84           	tst.l d4
    3016:	6f2c           	ble.s 3044 <memset+0xca>
		*ptr++ = val;
    3018:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    301c:	7201           	moveq #1,d1
    301e:	b284           	cmp.l d4,d1
    3020:	6c22           	bge.s 3044 <memset+0xca>
		*ptr++ = val;
    3022:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    3026:	7402           	moveq #2,d2
    3028:	b484           	cmp.l d4,d2
    302a:	6c18           	bge.s 3044 <memset+0xca>
		*ptr++ = val;
    302c:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    3030:	7c03           	moveq #3,d6
    3032:	bc84           	cmp.l d4,d6
    3034:	6c0e           	bge.s 3044 <memset+0xca>
		*ptr++ = val;
    3036:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    303a:	7204           	moveq #4,d1
    303c:	b284           	cmp.l d4,d1
    303e:	6c04           	bge.s 3044 <memset+0xca>
		*ptr++ = val;
    3040:	1545 0005      	move.b d5,5(a2)
}
    3044:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    3048:	4e75           	rts

0000304a <strlen>:
{
    304a:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    304e:	7000           	moveq #0,d0
	while(*s++)
    3050:	4a10           	tst.b (a0)
    3052:	6708           	beq.s 305c <strlen+0x12>
		t++;
    3054:	5280           	addq.l #1,d0
	while(*s++)
    3056:	4a30 0800      	tst.b (0,a0,d0.l)
    305a:	66f8           	bne.s 3054 <strlen+0xa>
}
    305c:	4e75           	rts
    305e:	4e71           	nop

00003060 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    3060:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    3064:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    3068:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    306c:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    3070:	d041           	add.w d1,d0
	swap	d0
    3072:	4840           	swap d0
	clrw	d0
    3074:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    3076:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    307a:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    307e:	d081           	add.l d1,d0

	rts
    3080:	4e75           	rts

00003082 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    3082:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    3084:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    3088:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    308c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    3092:	6416           	bcc.s 30aa <__udivsi3+0x28>
	movel	d0, d2
    3094:	2400           	move.l d0,d2
	clrw	d2
    3096:	4242           	clr.w d2
	swap	d2
    3098:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    309a:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    309c:	3002           	move.w d2,d0
	swap	d0
    309e:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    30a0:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    30a4:	84c1           	divu.w d1,d2
	movew	d2, d0
    30a6:	3002           	move.w d2,d0
	jra	6f
    30a8:	6030           	bra.s 30da <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    30aa:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    30ac:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    30ae:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    30b0:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    30b6:	64f4           	bcc.s 30ac <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    30b8:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    30ba:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    30c0:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    30c2:	c2c0           	mulu.w d0,d1
	swap	d2
    30c4:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    30c6:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    30c8:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    30ca:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    30cc:	660a           	bne.s 30d8 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    30ce:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    30d0:	6506           	bcs.s 30d8 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    30d2:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    30d6:	6302           	bls.s 30da <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    30d8:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    30da:	241f           	move.l (sp)+,d2
	rts
    30dc:	4e75           	rts

000030de <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    30de:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    30e0:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    30e2:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    30e6:	6a04           	bpl.s 30ec <__divsi3+0xe>
	negl	d1
    30e8:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    30ea:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    30ec:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    30f0:	6a04           	bpl.s 30f6 <__divsi3+0x18>
	negl	d0
    30f2:	4480           	neg.l d0
	negb	d2
    30f4:	4402           	neg.b d2

2:	movel	d1, sp@-
    30f6:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    30f8:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    30fa:	6186           	bsr.s 3082 <__udivsi3>
	addql	IMM (8), sp
    30fc:	508f           	addq.l #8,sp

	tstb	d2
    30fe:	4a02           	tst.b d2
	jpl	3f
    3100:	6a02           	bpl.s 3104 <__divsi3+0x26>
	negl	d0
    3102:	4480           	neg.l d0

3:	movel	sp@+, d2
    3104:	241f           	move.l (sp)+,d2
	rts
    3106:	4e75           	rts

00003108 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    3108:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    310c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    3110:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    3112:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    3114:	61c8           	bsr.s 30de <__divsi3>
	addql	IMM (8), sp
    3116:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    3118:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    311c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    311e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    3120:	6100 ff3e      	bsr.w 3060 <__mulsi3>
	addql	IMM (8), sp
    3124:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    3126:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    312a:	9280           	sub.l d0,d1
	movel	d1, d0
    312c:	2001           	move.l d1,d0
	rts
    312e:	4e75           	rts

00003130 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    3130:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    3134:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    3138:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    313a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    313c:	6100 ff44      	bsr.w 3082 <__udivsi3>
	addql	IMM (8), sp
    3140:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    3142:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    3146:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    3148:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    314a:	6100 ff14      	bsr.w 3060 <__mulsi3>
	addql	IMM (8), sp
    314e:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    3150:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    3154:	9280           	sub.l d0,d1
	movel	d1, d0
    3156:	2001           	move.l d1,d0
	rts
    3158:	4e75           	rts

0000315a <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    315a:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    315c:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    3160:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    3164:	2c5f           	movea.l (sp)+,a6
    rts
    3166:	4e75           	rts

00003168 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    3168:	16c0           	move.b d0,(a3)+
	rts
    316a:	4e75           	rts

0000316c <saveregs>:
	...

000031a8 <font2distance>:
    31a8:	0505           	btst d2,d5
    31aa:	0505           	btst d2,d5
    31ac:	0505           	btst d2,d5
    31ae:	0505           	btst d2,d5
    31b0:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    31b2:	0505           	btst d2,d5
    31b4:	0505           	btst d2,d5
    31b6:	0005 0505      	ori.b #5,d5
    31ba:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    31bc:	0505           	btst d2,d5
    31be:	0505           	btst d2,d5
    31c0:	0505           	btst d2,d5
    31c2:	0505           	btst d2,d5
    31c4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    31c6:	0505           	btst d2,d5
    31c8:	0505           	btst d2,d5
    31ca:	0505           	btst d2,d5
    31cc:	0505           	btst d2,d5
    31ce:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    31d0:	0500           	btst d2,d0
    31d2:	0505           	btst d2,d5
    31d4:	0505           	btst d2,d5
    31d6:	0505           	btst d2,d5
    31d8:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    31da:	0505           	btst d2,d5
    31dc:	0505           	btst d2,d5
    31de:	0505           	btst d2,d5
    31e0:	0505           	btst d2,d5
    31e2:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    31e4:	0505           	btst d2,d5
    31e6:	0505           	btst d2,d5
    31e8:	0503           	btst d2,d3
    31ea:	0505           	btst d2,d5
    31ec:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    31ee:	0505           	btst d2,d5
    31f0:	0500           	btst d2,d0
    31f2:	0505           	btst d2,d5
    31f4:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    31f8:	0505           	btst d2,d5
    31fa:	0503           	btst d2,d3
    31fc:	0205 0507      	andi.b #7,d5
    3200:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    3202:	0505           	btst d2,d5
    3204:	0505           	btst d2,d5
    3206:	0505           	btst d2,d5
    3208:	0505           	btst d2,d5
    320a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    320c:	0505           	btst d2,d5
    320e:	0505           	btst d2,d5
    3210:	0505           	btst d2,d5
    3212:	0505           	btst d2,d5
    3214:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3216:	0505           	btst d2,d5
    3218:	0505           	btst d2,d5
    321a:	0505           	btst d2,d5
    321c:	0505           	btst d2,d5
    321e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3220:	0505           	btst d2,d5
    3222:	0505           	btst d2,d5
    3224:	0505           	btst d2,d5
    3226:	0505           	btst d2,d5
    3228:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    322a:	0505           	btst d2,d5
    322c:	0505           	btst d2,d5
    322e:	0505           	btst d2,d5
    3230:	0505           	btst d2,d5
    3232:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3234:	0505           	btst d2,d5
    3236:	0505           	btst d2,d5
    3238:	0505           	btst d2,d5
    323a:	0505           	btst d2,d5
    323c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    323e:	0505           	btst d2,d5
    3240:	0505           	btst d2,d5
    3242:	0505           	btst d2,d5
    3244:	0505           	btst d2,d5
    3246:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3248:	0505           	btst d2,d5
    324a:	0505           	btst d2,d5
    324c:	0505           	btst d2,d5
    324e:	0505           	btst d2,d5
    3250:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3252:	0505           	btst d2,d5
    3254:	0505           	btst d2,d5
    3256:	0505           	btst d2,d5
    3258:	0505           	btst d2,d5
    325a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    325c:	0505           	btst d2,d5
    325e:	0505           	btst d2,d5
    3260:	0505           	btst d2,d5
    3262:	0505           	btst d2,d5
    3264:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3266:	0505           	btst d2,d5
    3268:	0505           	btst d2,d5
    326a:	0505           	btst d2,d5
    326c:	0505           	btst d2,d5
    326e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3270:	0505           	btst d2,d5
    3272:	0505           	btst d2,d5
    3274:	0505           	btst d2,d5
    3276:	0505           	btst d2,d5
    3278:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    327a:	0505           	btst d2,d5
    327c:	0505           	btst d2,d5
    327e:	0505           	btst d2,d5
    3280:	0505           	btst d2,d5
    3282:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3284:	0505           	btst d2,d5
    3286:	0505           	btst d2,d5
    3288:	0505           	btst d2,d5
    328a:	0505           	btst d2,d5
    328c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    328e:	0505           	btst d2,d5
    3290:	0505           	btst d2,d5
    3292:	0505           	btst d2,d5
    3294:	0505           	btst d2,d5
    3296:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3298:	0505           	btst d2,d5
    329a:	0505           	btst d2,d5
    329c:	0505           	btst d2,d5
    329e:	0505           	btst d2,d5
    32a0:	0505           	btst d2,d5

000032a2 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    32a2:	16c0           	move.b d0,(a3)+
  RTS
    32a4:	4e75           	rts

000032a6 <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    32a6:	48f9 7fff 0000 	movem.l d0-a6,316c <saveregs>
    32ac:	316c 
  lea 0xdff000,a5
    32ae:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddbd4b>,a5
  move.l sp@(4),a0  //Fontlocation
    32b4:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    32b8:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    32bc:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    32c0:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    32c2:	082d 0006 0002 	btst #6,2(a5)

000032c8 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    32c8:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    32ce:	66f8           	bne.s 32c8 <st2wblit>

000032d0 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    32d0:	7019           	moveq #25,d0
	sub.l d5,d5      
    32d2:	9a85           	sub.l d5,d5

000032d4 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    32d4:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    32d6:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    32d8:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    32dc:	9dce           	suba.l a6,a6
	move.l d2, a6
    32de:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    32e0:	ddfc 0000 31a8 	adda.l #12712,a6

	LSL  	#4,d2 	    //Fetch next char
    32e6:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    32e8:	2842           	movea.l d2,a4


	move.l  #0,d4
    32ea:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    32ec:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    32ee:	3814           	move.w (a4),d4
	swap	d4
    32f0:	4844           	swap d4
	lsr.l	d5, d4
    32f2:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    32f4:	8993           	or.l d4,(a3)
	clr.l	d4
    32f6:	4284           	clr.l d4
	move.w  2(a4), d4
    32f8:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    32fc:	4844           	swap d4
	lsr.l	d5, d4
    32fe:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    3300:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    3304:	4284           	clr.l d4
	move.w  4(a4), d4
    3306:	382c 0004      	move.w 4(a4),d4
	swap	d4
    330a:	4844           	swap d4
	lsr.l	d5, d4
    330c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    330e:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    3312:	4284           	clr.l d4
	move.w  6(a4), d4
    3314:	382c 0006      	move.w 6(a4),d4
	swap	d4
    3318:	4844           	swap d4
	lsr.l	d5, d4
    331a:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    331c:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    3320:	4284           	clr.l d4
	move.w  8(a4), d4
    3322:	382c 0008      	move.w 8(a4),d4
	swap	d4
    3326:	4844           	swap d4
	lsr.l	d5, d4
    3328:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    332a:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    332e:	4284           	clr.l d4
	move.w  10(a4), d4
    3330:	382c 000a      	move.w 10(a4),d4
	swap	d4
    3334:	4844           	swap d4
	lsr.l	d5, d4
    3336:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    3338:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    333c:	4284           	clr.l d4
	move.w  12(a4), d4
    333e:	382c 000c      	move.w 12(a4),d4
	swap	d4
    3342:	4844           	swap d4
	lsr.l	d5, d4
    3344:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    3346:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    334a:	4284           	clr.l d4
	move.w  14(a4), d4
    334c:	382c 000e      	move.w 14(a4),d4
	swap	d4
    3350:	4844           	swap d4
	lsr.l	d5, d4
    3352:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    3354:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    3358:	4284           	clr.l d4

	add.b   (a6), d5
    335a:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    335c:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    3360:	6500 0006      	bcs.w 3368 <noadditionalchar>
	addq.w  #1, a3
    3364:	524b           	addq.w #1,a3
	sub.w   #8,d5
    3366:	5145           	subq.w #8,d5

00003368 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    3368:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    336a:	51c8 ff68      	dbf d0,32d4 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    336e:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    3372:	51cb ff5c      	dbf d3,32d0 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    3376:	4cfa 7fff fdf2 	movem.l 316c <saveregs>(pc),d0-a6

	RTS
    337c:	4e75           	rts
