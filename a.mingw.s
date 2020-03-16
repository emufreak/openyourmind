
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
       6:	4e55 ff98      	link.w a5,#-104
       a:	48e7 3f3a      	movem.l d2-d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 66dc 	move.l a6,66dc <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,66ae <hw>
      1e:	0000 66ae 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 3d85 	lea 3d85 <rundemo.c.d99b7c69+0xec>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 66b2 	move.l d0,66b2 <GfxBase>
	if (!GfxBase)
      34:	6700 1a84      	beq.w 1aba <main+0x1ab4>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
      3e:	43f9 0000 3d96 	lea 3d96 <rundemo.c.d99b7c69+0xfd>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 66d8 	move.l d0,66d8 <DOSBase>
	if (!DOSBase)
      50:	6700 1a5c      	beq.w 1aae <main+0x1aa8>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 3da2 	pea 3da2 <rundemo.c.d99b7c69+0x109>
      5a:	4eb9 0000 1cf0 	jsr 1cf0 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 3dbe 	move.l #15806,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 66ae 	movea.l 66ae <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 3dce 	move.l #15822,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 24ba 	lea 24ba <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 66d4 	move.l d0,66d4 <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 66c4 	move.l d0,66c4 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 66d0 	move.l d0,66d0 <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 66b8 	move.l d0,66b8 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 653c 	cmp.l 653c <ClsSprites>,d0
      d2:	6600 190e      	bne.w 19e2 <main+0x19dc>
      d6:	206a 0004      	movea.l 4(a2),a0
      da:	b1f9 0000 6540 	cmpa.l 6540 <ClsSprites+0x4>,a0
      e0:	6600 1900      	bne.w 19e2 <main+0x19dc>
      e4:	202a 0008      	move.l 8(a2),d0
      e8:	b0b9 0000 6544 	cmp.l 6544 <ClsSprites+0x8>,d0
      ee:	6600 18f2      	bne.w 19e2 <main+0x19dc>
      f2:	206a 000c      	movea.l 12(a2),a0
      f6:	b1f9 0000 6548 	cmpa.l 6548 <ClsSprites+0xc>,a0
      fc:	6600 18e4      	bne.w 19e2 <main+0x19dc>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 654c 	cmp.l 654c <ClsSprites+0x10>,d0
     10a:	6600 18d6      	bne.w 19e2 <main+0x19dc>
     10e:	206a 0014      	movea.l 20(a2),a0
     112:	b1f9 0000 6550 	cmpa.l 6550 <ClsSprites+0x14>,a0
     118:	6600 18c8      	bne.w 19e2 <main+0x19dc>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 6554 	cmp.l 6554 <ClsSprites+0x18>,d0
     126:	6600 18ba      	bne.w 19e2 <main+0x19dc>
     12a:	206a 001c      	movea.l 28(a2),a0
     12e:	b1f9 0000 6558 	cmpa.l 6558 <ClsSprites+0x1c>,a0
     134:	6600 18ac      	bne.w 19e2 <main+0x19dc>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 655c 	cmp.l 655c <ClsSprites+0x20>,d0
     142:	6600 189e      	bne.w 19e2 <main+0x19dc>
     146:	206a 0024      	movea.l 36(a2),a0
     14a:	b1f9 0000 6560 	cmpa.l 6560 <ClsSprites+0x24>,a0
     150:	6600 1890      	bne.w 19e2 <main+0x19dc>
     154:	202a 0028      	move.l 40(a2),d0
     158:	b0b9 0000 6564 	cmp.l 6564 <ClsSprites+0x28>,d0
     15e:	6600 1882      	bne.w 19e2 <main+0x19dc>
     162:	206a 002c      	movea.l 44(a2),a0
     166:	b1f9 0000 6568 	cmpa.l 6568 <ClsSprites+0x2c>,a0
     16c:	6600 1874      	bne.w 19e2 <main+0x19dc>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 656c 	cmp.l 656c <ClsSprites+0x30>,d0
     17a:	6600 1866      	bne.w 19e2 <main+0x19dc>
     17e:	206a 0034      	movea.l 52(a2),a0
     182:	b1f9 0000 6570 	cmpa.l 6570 <ClsSprites+0x34>,a0
     188:	6600 1858      	bne.w 19e2 <main+0x19dc>
     18c:	202a 0038      	move.l 56(a2),d0
     190:	b0b9 0000 6574 	cmp.l 6574 <ClsSprites+0x38>,d0
     196:	6600 184a      	bne.w 19e2 <main+0x19dc>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 6578 	cmpa.l 6578 <ClsSprites+0x3c>,a2
     1a4:	6600 183c      	bne.w 19e2 <main+0x19dc>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 66d4 	movea.l 66d4 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 650c 	move.l 650c <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 1872      	bne.w 1a2c <main+0x1a26>
     1bc:	2039 0000 6510 	move.l 6510 <ClScreen+0x4>,d0
     1c2:	b0a8 0044      	cmp.l 68(a0),d0
     1c6:	6600 1864      	bne.w 1a2c <main+0x1a26>
     1ca:	2039 0000 6514 	move.l 6514 <ClScreen+0x8>,d0
     1d0:	b0a8 0048      	cmp.l 72(a0),d0
     1d4:	6600 1856      	bne.w 1a2c <main+0x1a26>
     1d8:	2039 0000 6518 	move.l 6518 <ClScreen+0xc>,d0
     1de:	b0a8 004c      	cmp.l 76(a0),d0
     1e2:	6600 1848      	bne.w 1a2c <main+0x1a26>
     1e6:	2039 0000 651c 	move.l 651c <ClScreen+0x10>,d0
     1ec:	b0a8 0050      	cmp.l 80(a0),d0
     1f0:	6600 183a      	bne.w 1a2c <main+0x1a26>
     1f4:	2039 0000 6520 	move.l 6520 <ClScreen+0x14>,d0
     1fa:	b0a8 0054      	cmp.l 84(a0),d0
     1fe:	6600 182c      	bne.w 1a2c <main+0x1a26>
     202:	2028 0058      	move.l 88(a0),d0
     206:	b0b9 0000 6524 	cmp.l 6524 <ClScreen+0x18>,d0
     20c:	6600 181e      	bne.w 1a2c <main+0x1a26>
     210:	2028 005c      	move.l 92(a0),d0
     214:	b0b9 0000 6528 	cmp.l 6528 <ClScreen+0x1c>,d0
     21a:	6600 1810      	bne.w 1a2c <main+0x1a26>
     21e:	2039 0000 652c 	move.l 652c <ClScreen+0x20>,d0
     224:	b0a8 0060      	cmp.l 96(a0),d0
     228:	6600 1802      	bne.w 1a2c <main+0x1a26>
     22c:	2028 0064      	move.l 100(a0),d0
     230:	b0b9 0000 6530 	cmp.l 6530 <ClScreen+0x24>,d0
     236:	6600 17f4      	bne.w 1a2c <main+0x1a26>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 6534 	cmp.l 6534 <ClScreen+0x28>,d0
     244:	6600 17e6      	bne.w 1a2c <main+0x1a26>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 6538 	cmpa.l 6538 <ClScreen+0x2c>,a0
     252:	6600 17d8      	bne.w 1a2c <main+0x1a26>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     256:	23fc 0004 0000 	move.l #262144,66c8 <DrawBuffer>
     25c:	0000 66c8 
  ViewBuffer = (ULONG *)0x50000;
     260:	23fc 0005 0000 	move.l #327680,66bc <ViewBuffer>
     266:	0000 66bc 
  SetBplPointers();
     26a:	45f9 0000 300c 	lea 300c <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,66c8 <DrawBuffer>
     278:	0000 66c8 
     27c:	6700 1800      	beq.w 1a7e <main+0x1a78>
    Write( Output(), 
     280:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 3dd1 	move.l #15825,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     29e:	2079 0000 66d4 	movea.l 66d4 <Copperlist1>,a0
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 3e0d 	move.l #15885,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 66d4 	movea.l 66d4 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 3e4a 	move.l #15946,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 66d4 	movea.l 66d4 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2028 0078      	move.l 120(a0),d0
     304:	b0b9 0000 6504 	cmp.l 6504 <ClColor>,d0
     30a:	6600 16f8      	bne.w 1a04 <main+0x19fe>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 6508 	cmp.l 6508 <ClColor+0x4>,d0
     318:	6600 16ea      	bne.w 1a04 <main+0x19fe>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 3ea9 	move.l #16041,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 2e04 	lea 2e04 <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2079 0000 66c4 	movea.l 66c4 <DrawCopper>,a0
     350:	b1f9 0000 66d0 	cmpa.l 66d0 <Copperlist2>,a0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 3ecc 	move.l #16076,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 3038 	lea 3038 <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 66c8 	move.l 66c8 <DrawBuffer>,d0
     384:	b0b9 0000 66cc 	cmp.l 66cc <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 3ee2 	move.l #16098,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2079 0000 66c4 	movea.l 66c4 <DrawCopper>,a0
     3b0:	b1f9 0000 66d4 	cmpa.l 66d4 <Copperlist1>,a0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 3f1a 	move.l #16154,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2039 0000 66bc 	move.l 66bc <ViewBuffer>,d0
     3de:	b0b9 0000 66c0 	cmp.l 66c0 <Bitplane2>,d0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 3f54 	move.l #16212,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2079 0000 66b8 	movea.l 66b8 <ViewCopper>,a0
     40a:	b1f9 0000 66d0 	cmpa.l 66d0 <Copperlist2>,a0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 3f8d 	move.l #16269,d2
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
     434:	2079 0000 66b8 	movea.l 66b8 <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     44c:	b0b9 0000 66c0 	cmp.l 66c0 <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 3fc8 	move.l #16328,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     476:	2079 0000 66b8 	movea.l 66b8 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     48e:	b0b9 0000 66cc 	cmp.l 66cc <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 4011 	move.l #16401,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4b8:	2079 0000 66b8 	movea.l 66b8 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4d0:	b0b9 0000 66c0 	cmp.l 66c0 <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 405b 	move.l #16475,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	4eb9 0000 3176 	jsr 3176 <FreeDisplay>
  TestZoom4Picture();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     506:	47f9 0000 2e2a 	lea 2e2a <PrepareDisplayZoom>,a3
     50c:	4e93           	jsr (a3)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     50e:	4878 0010      	pea 10 <main+0xa>
     512:	4879 0000 653c 	pea 653c <ClsSprites>
     518:	42a7           	clr.l -(sp)
     51a:	2f39 0000 66d4 	move.l 66d4 <Copperlist1>,-(sp)
     520:	283c 0000 22e4 	move.l #8932,d4
     526:	2044           	movea.l d4,a0
     528:	4e90           	jsr (a0)
     52a:	4fef 0018      	lea 24(sp),sp
     52e:	4a80           	tst.l d0
     530:	661e           	bne.s 550 <main+0x54a>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     532:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     538:	4eae ffc4      	jsr -60(a6)
     53c:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     542:	2200           	move.l d0,d1
     544:	243c 0000 40a4 	move.l #16548,d2
     54a:	762c           	moveq #44,d3
     54c:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     550:	4878 000c      	pea c <main+0x6>
     554:	4879 0000 64d4 	pea 64d4 <ClScreenZoom>
     55a:	4878 0010      	pea 10 <main+0xa>
     55e:	2f39 0000 66d4 	move.l 66d4 <Copperlist1>,-(sp)
     564:	2044           	movea.l d4,a0
     566:	4e90           	jsr (a0)
     568:	4fef 0010      	lea 16(sp),sp
     56c:	4a80           	tst.l d0
     56e:	661e           	bne.s 58e <main+0x588>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     570:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     576:	4eae ffc4      	jsr -60(a6)
     57a:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     580:	2200           	move.l d0,d1
     582:	243c 0000 40da 	move.l #16602,d2
     588:	7636           	moveq #54,d3
     58a:	4eae ffd0      	jsr -48(a6)
  //ZoomHorizontal = 10;
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     58e:	2079 0000 66c4 	movea.l 66c4 <DrawCopper>,a0
  copword += ZMBPLPTRS+1;
  for(int i=1;i<=2;i++) {
    UWORD highword = ptr >> 16;
    UWORD lowword = ptr & 0xffff;
    *copword = highword;
     594:	317c 0004 0072 	move.w #4,114(a0)
    copword += 2;
    *copword = lowword;
     59a:	4268 0076      	clr.w 118(a0)
    *copword = highword;
     59e:	317c 0004 007a 	move.w #4,122(a0)
    *copword = lowword;
     5a4:	317c 2800 007e 	move.w #10240,126(a0)
    copword += 2;
    ptr += 40*256;
  }
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
     5aa:	23fc 0005 0000 	move.l #327680,66c8 <DrawBuffer>
     5b0:	0000 66c8 
  ViewBuffer = (ULONG *) tmp;
     5b4:	23fc 0004 0000 	move.l #262144,66bc <ViewBuffer>
     5ba:	0000 66bc 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5be:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c4:	4878 001c      	pea 1c <main+0x16>
     5c8:	2f39 0000 66d4 	move.l 66d4 <Copperlist1>,-(sp)
     5ce:	2a3c 0000 22c6 	move.l #8902,d5
     5d4:	2045           	movea.l d5,a0
     5d6:	4e90           	jsr (a0)
     5d8:	4fef 000c      	lea 12(sp),sp
     5dc:	4a80           	tst.l d0
     5de:	661e           	bne.s 5fe <main+0x5f8>
    Write(Output(), 
     5e0:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     5e6:	4eae ffc4      	jsr -60(a6)
     5ea:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     5f0:	2200           	move.l d0,d1
     5f2:	243c 0000 3e0d 	move.l #15885,d2
     5f8:	763c           	moveq #60,d3
     5fa:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     5fe:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     604:	4878 001d      	pea 1d <main+0x17>
     608:	2f39 0000 66d4 	move.l 66d4 <Copperlist1>,-(sp)
     60e:	2045           	movea.l d5,a0
     610:	4e90           	jsr (a0)
     612:	4fef 000c      	lea 12(sp),sp
     616:	4a80           	tst.l d0
     618:	661e           	bne.s 638 <main+0x632>
    Write(Output(), 
     61a:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     620:	4eae ffc4      	jsr -60(a6)
     624:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     62a:	2200           	move.l d0,d1
     62c:	243c 0000 3e4a 	move.l #15946,d2
     632:	763c           	moveq #60,d3
     634:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     638:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     63e:	4878 001e      	pea 1e <main+0x18>
     642:	2f39 0000 66d4 	move.l 66d4 <Copperlist1>,-(sp)
     648:	2045           	movea.l d5,a0
     64a:	4e90           	jsr (a0)
     64c:	4fef 000c      	lea 12(sp),sp
     650:	4a80           	tst.l d0
     652:	661e           	bne.s 672 <main+0x66c>
    Write(Output(), 
     654:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     65a:	4eae ffc4      	jsr -60(a6)
     65e:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     664:	2200           	move.l d0,d1
     666:	243c 0000 4111 	move.l #16657,d2
     66c:	763c           	moveq #60,d3
     66e:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     672:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     678:	4878 001f      	pea 1f <main+0x19>
     67c:	2f39 0000 66d4 	move.l 66d4 <Copperlist1>,-(sp)
     682:	2045           	movea.l d5,a0
     684:	4e90           	jsr (a0)
     686:	4fef 000c      	lea 12(sp),sp
     68a:	4a80           	tst.l d0
     68c:	661e           	bne.s 6ac <main+0x6a6>
    Write(Output(), 
     68e:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     694:	4eae ffc4      	jsr -60(a6)
     698:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     69e:	2200           	move.l d0,d1
     6a0:	243c 0000 414e 	move.l #16718,d2
     6a6:	763c           	moveq #60,d3
     6a8:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6ac:	4878 0002      	pea 2 <_start+0x2>
     6b0:	4879 0000 6504 	pea 6504 <ClColor>
     6b6:	4878 0020      	pea 20 <main+0x1a>
     6ba:	2f39 0000 66d4 	move.l 66d4 <Copperlist1>,-(sp)
     6c0:	2044           	movea.l d4,a0
     6c2:	4e90           	jsr (a0)
     6c4:	4fef 0010      	lea 16(sp),sp
     6c8:	4a80           	tst.l d0
     6ca:	661e           	bne.s 6ea <main+0x6e4>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6cc:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     6d2:	4eae ffc4      	jsr -60(a6)
     6d6:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     6dc:	2200           	move.l d0,d1
     6de:	243c 0000 3e87 	move.l #16007,d2
     6e4:	7621           	moveq #33,d3
     6e6:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6ea:	4878 0040      	pea 40 <main+0x3a>
     6ee:	4879 0000 4494 	pea 4494 <rundemo.c.d99b7c69+0x7fb>
     6f4:	486d ffc0      	pea -64(a5)
     6f8:	4eb9 0000 322e 	jsr 322e <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     6fe:	4878 0010      	pea 10 <main+0xa>
     702:	486d ffc0      	pea -64(a5)
     706:	4878 0022      	pea 22 <main+0x1c>
     70a:	2f39 0000 66d4 	move.l 66d4 <Copperlist1>,-(sp)
     710:	2044           	movea.l d4,a0
     712:	4e90           	jsr (a0)
     714:	4fef 001c      	lea 28(sp),sp
     718:	4a80           	tst.l d0
     71a:	661e           	bne.s 73a <main+0x734>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     71c:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     722:	4eae ffc4      	jsr -60(a6)
     726:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     72c:	2200           	move.l d0,d1
     72e:	243c 0000 418b 	move.l #16779,d2
     734:	7621           	moveq #33,d3
     736:	4eae ffd0      	jsr -48(a6)

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     73a:	2b7c 2d07 fffe 	move.l #755499006,-76(a5)
     740:	ffb4 
     742:	2b7c 0182 00f0 	move.l #25297136,-72(a5)
     748:	ffb8 
     74a:	2b7c 0182 0f00 	move.l #25300736,-68(a5)
     750:	ffbc 

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
     752:	4878 0003      	pea 3 <_start+0x3>
     756:	486d ffb4      	pea -76(a5)
     75a:	4878 004b      	pea 4b <main+0x45>
     75e:	2f39 0000 66d4 	move.l 66d4 <Copperlist1>,-(sp)
     764:	2044           	movea.l d4,a0
     766:	4e90           	jsr (a0)
     768:	4fef 0010      	lea 16(sp),sp
     76c:	4a80           	tst.l d0
     76e:	661e           	bne.s 78e <main+0x788>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     770:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     776:	4eae ffc4      	jsr -60(a6)
     77a:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     780:	2200           	move.l d0,d1
     782:	243c 0000 41ad 	move.l #16813,d2
     788:	762c           	moveq #44,d3
     78a:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     78e:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdccdd>
     792:	4878 2922      	pea 2922 <Zoom_ZoomIntoPicture+0x20a>
     796:	2f39 0000 66d4 	move.l 66d4 <Copperlist1>,-(sp)
     79c:	2045           	movea.l d5,a0
     79e:	4e90           	jsr (a0)
     7a0:	4fef 000c      	lea 12(sp),sp
     7a4:	4a80           	tst.l d0
     7a6:	661e           	bne.s 7c6 <main+0x7c0>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     7a8:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     7ae:	4eae ffc4      	jsr -60(a6)
     7b2:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     7b8:	2200           	move.l d0,d1
     7ba:	243c 0000 3ea9 	move.l #16041,d2
     7c0:	7622           	moveq #34,d3
     7c2:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7c6:	2f3c 0001 6800 	move.l #92160,-(sp)
     7cc:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7d2:	4eb9 0000 3176 	jsr 3176 <FreeDisplay>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7d8:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
     7de:	7004           	moveq #4,d0
     7e0:	7202           	moveq #2,d1
     7e2:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
     7e6:	33fc 0010 0000 	move.w #16,66b6 <ZoomHorizontal>
     7ec:	66b6 

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     7ee:	4e93           	jsr (a3)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7f0:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
     7f6:	203c 0000 c800 	move.l #51200,d0
     7fc:	7202           	moveq #2,d1
     7fe:	4eae ff3a      	jsr -198(a6)
     802:	2440           	movea.l d0,a2
     804:	23c0 0000 6698 	move.l d0,6698 <Zoom_Source>
  if( Zoom_Source == 0) {
     80a:	508f           	addq.l #8,sp
     80c:	6700 1330      	beq.w 1b3e <main+0x1b38>
    return;
  }

  
  UWORD *tstsource = Zoom_Source;
  *tstsource++ = 0x0000;
     810:	4252           	clr.w (a2)
  *tstsource = 0x0080;
     812:	357c 0080 0002 	move.w #128,2(a2)
  tstsource += ZMLINESIZE/2-1;
  *tstsource = 0x1000;
     818:	357c 1000 0030 	move.w #4096,48(a2)
  tstsource++;
  *tstsource = 0x8e88;
     81e:	357c 8e88 0032 	move.w #-29048,50(a2)
  tstsource += ZMLINESIZE/2-1;

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
  *tstsource++ = 0x0000;
     824:	426a 17d0      	clr.w 6096(a2)
  *tstsource = 0x00ff;
     828:	357c 00ff 17d2 	move.w #255,6098(a2)

  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 0, 8, 128);
     82e:	2439 0000 66c8 	move.l 66c8 <DrawBuffer>,d2
    srca = source + 1;
     834:	2600           	move.l d0,d3
     836:	5483           	addq.l #2,d3
  WaitBlit();
     838:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
     83e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     842:	2079 0000 66ae 	movea.l 66ae <hw>,a0
     848:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     84e:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltafwm = 0xffff;
     854:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     85a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     860:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     866:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     86c:	317c ff00 0070 	move.w #-256,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     872:	317c 002c 0066 	move.w #44,102(a0)
  *bp = 0;
     878:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltapt = srca;
     87c:	2143 0050      	move.l d3,80(a0)
  hw->bltbpt = srcb;
     880:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = destination;
     884:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = height*64+2;
     888:	317c 2002 0058 	move.w #8194,88(a0)
  WaitBlit();
     88e:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
     894:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     898:	2479 0000 66c8 	movea.l 66c8 <DrawBuffer>,a2
  if( *destination != 0x0180) {
     89e:	0c6a 0180 0002 	cmpi.w #384,2(a2)
     8a4:	671e           	beq.s 8c4 <main+0x8be>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
     8a6:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     8ac:	4eae ffc4      	jsr -60(a6)
     8b0:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     8b6:	2200           	move.l d0,d1
     8b8:	243c 0000 4212 	move.l #16914,d2
     8be:	761c           	moveq #28,d3
     8c0:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8c4:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
     8ca:	671e           	beq.s 8ea <main+0x8e4>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
     8cc:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     8d2:	4eae ffc4      	jsr -60(a6)
     8d6:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     8dc:	2200           	move.l d0,d1
     8de:	243c 0000 422f 	move.l #16943,d2
     8e4:	761c           	moveq #28,d3
     8e6:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     8ea:	2079 0000 66c8 	movea.l 66c8 <DrawBuffer>,a0
     8f0:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
     8f6:	671e           	beq.s 916 <main+0x910>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
     8f8:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     8fe:	4eae ffc4      	jsr -60(a6)
     902:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     908:	2200           	move.l d0,d1
     90a:	243c 0000 424c 	move.l #16972,d2
     910:	761a           	moveq #26,d3
     912:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     916:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
     91c:	2279 0000 6698 	movea.l 6698 <Zoom_Source>,a1
     922:	203c 0000 c800 	move.l #51200,d0
     928:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     92c:	2f3c 0001 6800 	move.l #92160,-(sp)
     932:	2f3c 0000 a48c 	move.l #42124,-(sp)
     938:	4eb9 0000 3176 	jsr 3176 <FreeDisplay>
     93e:	508f           	addq.l #8,sp
}

void TestCopyColumnOfZoom() {

  PrepareDisplayZoom();
     940:	4e93           	jsr (a3)

  UWORD *destination = (UWORD *)DrawBuffer;
     942:	2079 0000 66c8 	movea.l 66c8 <DrawBuffer>,a0
  *destination= 0x0000;
     948:	4250           	clr.w (a0)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     94a:	317c 000f 0030 	move.w #15,48(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     950:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     956:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
     95c:	203c 0000 c800 	move.l #51200,d0
     962:	7202           	moveq #2,d1
     964:	4eae ff3a      	jsr -198(a6)
     968:	2440           	movea.l d0,a2
     96a:	23c0 0000 6698 	move.l d0,6698 <Zoom_Source>
  if( Zoom_Source == 0) {
     970:	6700 121e      	beq.w 1b90 <main+0x1b8a>
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
     984:	2439 0000 66c8 	move.l 66c8 <DrawBuffer>,d2
  WaitBlit();
     98a:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
     990:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     994:	2079 0000 66ae 	movea.l 66ae <hw>,a0
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
     9dc:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
     9e2:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     9e6:	2479 0000 66c8 	movea.l 66c8 <DrawBuffer>,a2
  if( *destination != 0x4000)
     9ec:	0c52 4000      	cmpi.w #16384,(a2)
     9f0:	671e           	beq.s a10 <main+0xa0a>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     9f2:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     9f8:	4eae ffc4      	jsr -60(a6)
     9fc:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     a02:	2200           	move.l d0,d1
     a04:	243c 0000 4267 	move.l #16999,d2
     a0a:	7629           	moveq #41,d3
     a0c:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x400f)
     a10:	0c6a 400f 0030 	cmpi.w #16399,48(a2)
     a16:	671e           	beq.s a36 <main+0xa30>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     a18:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     a1e:	4eae ffc4      	jsr -60(a6)
     a22:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     a28:	2200           	move.l d0,d1
     a2a:	243c 0000 4291 	move.l #17041,d2
     a30:	762a           	moveq #42,d3
     a32:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     a36:	2479 0000 66c8 	movea.l 66c8 <DrawBuffer>,a2
     a3c:	0c6a 400f 47d0 	cmpi.w #16399,18384(a2)
     a42:	6724           	beq.s a68 <main+0xa62>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     a44:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     a4a:	4eae ffc4      	jsr -60(a6)
     a4e:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     a54:	2200           	move.l d0,d1
     a56:	243c 0000 42bc 	move.l #17084,d2
     a5c:	7628           	moveq #40,d3
     a5e:	4eae ffd0      	jsr -48(a6)
     a62:	2479 0000 66c8 	movea.l 66c8 <DrawBuffer>,a2

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
     a76:	2679 0000 6698 	movea.l 6698 <Zoom_Source>,a3
  *tstsource = 0xffff;
     a7c:	36bc ffff      	move.w #-1,(a3)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     a80:	377c ffff 0030 	move.w #-1,48(a3)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0x8000;
     a86:	377c 8000 47d0 	move.w #-32768,18384(a3)
  WaitBlit();
     a8c:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
     a92:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     a96:	2079 0000 66ae 	movea.l 66ae <hw>,a0
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
     ade:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
     ae4:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     ae8:	2479 0000 66c8 	movea.l 66c8 <DrawBuffer>,a2
  if( *destination != 0x8000)
     aee:	0c52 8000      	cmpi.w #-32768,(a2)
     af2:	671e           	beq.s b12 <main+0xb0c>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     af4:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     afa:	4eae ffc4      	jsr -60(a6)
     afe:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     b04:	2200           	move.l d0,d1
     b06:	243c 0000 42e5 	move.l #17125,d2
     b0c:	7628           	moveq #40,d3
     b0e:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x800f)
     b12:	0c6a 800f 0030 	cmpi.w #-32753,48(a2)
     b18:	671e           	beq.s b38 <main+0xb32>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     b1a:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     b20:	4eae ffc4      	jsr -60(a6)
     b24:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     b2a:	2200           	move.l d0,d1
     b2c:	243c 0000 430e 	move.l #17166,d2
     b32:	7629           	moveq #41,d3
     b34:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     b38:	2079 0000 66c8 	movea.l 66c8 <DrawBuffer>,a0
     b3e:	0c68 800f 47d0 	cmpi.w #-32753,18384(a0)
     b44:	671e           	beq.s b64 <main+0xb5e>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     b46:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     b4c:	4eae ffc4      	jsr -60(a6)
     b50:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     b56:	2200           	move.l d0,d1
     b58:	243c 0000 4338 	move.l #17208,d2
     b5e:	7627           	moveq #39,d3
     b60:	4eae ffd0      	jsr -48(a6)

  FreeMem( Zoom_Source, 40*256*5);
     b64:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
     b6a:	2279 0000 6698 	movea.l 6698 <Zoom_Source>,a1
     b70:	203c 0000 c800 	move.l #51200,d0
     b76:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     b7a:	2f3c 0001 6800 	move.l #92160,-(sp)
     b80:	2f3c 0000 a48c 	move.l #42124,-(sp)
     b86:	4eb9 0000 3176 	jsr 3176 <FreeDisplay>
     b8c:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     b8e:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
     b94:	203c 0000 05a0 	move.l #1440,d0
     b9a:	7202           	moveq #2,d1
     b9c:	4eae ff3a      	jsr -198(a6)
     ba0:	2440           	movea.l d0,a2
  if( source == 0) {
     ba2:	4a80           	tst.l d0
     ba4:	6700 0f3e      	beq.w 1ae4 <main+0x1ade>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     ba8:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
     bae:	203c 0000 05a0 	move.l #1440,d0
     bb4:	7202           	moveq #2,d1
     bb6:	4eae ff3a      	jsr -198(a6)
     bba:	2640           	movea.l d0,a3
  if( destination == 0) {
     bbc:	4a80           	tst.l d0
     bbe:	6700 0f24      	beq.w 1ae4 <main+0x1ade>
    return;
  }
  
  UWORD *tmp = source;
  for( int i=0; i<8;i++) {
    *tmp++ = 0;
     bc2:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
     bc4:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
     bca:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
     bd0:	426a 0006      	clr.w 6(a2)
    tmp += ZMLINESIZE/2-3;
    *tmp++ = 0;
     bd4:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
     bd8:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
     bde:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
     be4:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
     be8:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
     bec:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
     bf2:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
     bf8:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
     bfc:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
     c00:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
     c06:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
     c0c:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
     c10:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
     c14:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
     c1a:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
     c20:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
     c24:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
     c28:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
     c2e:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
     c34:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
     c38:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
     c3c:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
     c42:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
     c48:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
     c4c:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
     c50:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
     c56:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
     c5c:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
     c60:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
     c64:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
     c6a:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
     c70:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
     c74:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
     c78:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
     c7e:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
     c84:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
     c88:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
     c8c:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
     c92:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
     c98:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
     c9c:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
     ca0:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
     ca6:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
     cac:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
     cb0:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
     cb4:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
     cba:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
     cc0:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
     cc4:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
     cc8:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
     cce:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
     cd4:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
     cd8:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
     cdc:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
     ce2:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
     ce8:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
     cec:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
     cf0:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
     cf6:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
     cfc:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
     d00:	4878 05a0      	pea 5a0 <main+0x59a>
     d04:	42a7           	clr.l -(sp)
     d06:	2f00           	move.l d0,-(sp)
     d08:	4eb9 0000 32c0 	jsr 32c0 <memset>
  WaitBlit();
     d0e:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
     d14:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     d18:	2079 0000 66ae 	movea.l 66ae <hw>,a0
     d1e:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     d24:	317c 39f0 0040 	move.w #14832,64(a0)
  hw->bltafwm = 0xffff;
     d2a:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     d30:	317c ffff 0046 	move.w #-1,70(a0)
  *bp = 0;
     d36:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltamod = ZMLINESIZE - 4;
     d3a:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     d40:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
     d46:	200a           	move.l a2,d0
     d48:	5480           	addq.l #2,d0
     d4a:	2140 0050      	move.l d0,80(a0)
  hw->bltdpt = (UWORD *) destination;
     d4e:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
     d52:	317c 0402 0058 	move.w #1026,88(a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    *tmp++ = 0;
  }

  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 3, 16);
  WaitBlit();
     d58:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
     d5e:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     d62:	4fef 000c      	lea 12(sp),sp
     d66:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
     d6c:	671e           	beq.s d8c <main+0xd86>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     d6e:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     d74:	4eae ffc4      	jsr -60(a6)
     d78:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     d7e:	2200           	move.l d0,d1
     d80:	243c 0000 4396 	move.l #17302,d2
     d86:	761f           	moveq #31,d3
     d88:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     d8c:	0c6b aaaa 0032 	cmpi.w #-21846,50(a3)
     d92:	671e           	beq.s db2 <main+0xdac>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     d94:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     d9a:	4eae ffc4      	jsr -60(a6)
     d9e:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
     da4:	2200           	move.l d0,d1
     da6:	243c 0000 43b6 	move.l #17334,d2
     dac:	7620           	moveq #32,d3
     dae:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     db2:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
     db8:	224a           	movea.l a2,a1
     dba:	203c 0000 05a0 	move.l #1440,d0
     dc0:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     dc4:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
     dca:	224b           	movea.l a3,a1
     dcc:	203c 0000 05a0 	move.l #1440,d0
     dd2:	4eae ff2e      	jsr -210(a6)
   a    6    6    5    5    5    4    c
*/


void TestZoom4Picture() {
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dd6:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
     ddc:	203c 0000 3740 	move.l #14144,d0
     de2:	7202           	moveq #2,d1
     de4:	4eae ff3a      	jsr -198(a6)
     de8:	2440           	movea.l d0,a2
  if( source == 0) {
     dea:	4a80           	tst.l d0
     dec:	6700 0d2e      	beq.w 1b1c <main+0x1b16>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     df0:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
     df6:	203c 0000 3740 	move.l #14144,d0
     dfc:	7202           	moveq #2,d1
     dfe:	4eae ff3a      	jsr -198(a6)
     e02:	2840           	movea.l d0,a4
  if( destination == 0) {
     e04:	4a80           	tst.l d0
     e06:	6700 0dd4      	beq.w 1bdc <main+0x1bd6>
     e0a:	200a           	move.l a2,d0
     e0c:	0680 0000 3300 	addi.l #13056,d0
     e12:	204a           	movea.l a2,a0
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
     e14:	20bc 5555 5555 	move.l #1431655765,(a0)
     e1a:	217c 5555 5555 	move.l #1431655765,4(a0)
     e20:	0004 
     e22:	217c 5555 5555 	move.l #1431655765,8(a0)
     e28:	0008 
     e2a:	217c 5555 5555 	move.l #1431655765,12(a0)
     e30:	000c 
     e32:	217c 5555 5555 	move.l #1431655765,16(a0)
     e38:	0010 
     e3a:	217c 5555 5555 	move.l #1431655765,20(a0)
     e40:	0014 
     e42:	217c 5555 5555 	move.l #1431655765,24(a0)
     e48:	0018 
     e4a:	217c 5555 5555 	move.l #1431655765,28(a0)
     e50:	001c 
     e52:	217c 5555 5555 	move.l #1431655765,32(a0)
     e58:	0020 
     e5a:	217c 5555 5555 	move.l #1431655765,36(a0)
     e60:	0024 
     e62:	217c 5555 5555 	move.l #1431655765,40(a0)
     e68:	0028 
     e6a:	217c 5555 5555 	move.l #1431655765,44(a0)
     e70:	002c 
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
     e72:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     e78:	0030 
     e7a:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     e80:	0034 
     e82:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     e88:	0038 
     e8a:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     e90:	003c 
     e92:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     e98:	0040 
     e9a:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     ea0:	0044 
     ea2:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     ea8:	0048 
     eaa:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     eb0:	004c 
     eb2:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     eb8:	0050 
     eba:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
     ec0:	0054 
     ec2:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
     ec8:	0058 
     eca:	41e8 0060      	lea 96(a0),a0
     ece:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     ed4:	fffc 
  for(int i=0;i<128+8;i++) {
     ed6:	b1c0           	cmpa.l d0,a0
     ed8:	6600 ff3a      	bne.w e14 <main+0xe0e>
  }

  Zoom_ZoomIntoPicture( source, destination, 0);
     edc:	42a7           	clr.l -(sp)
     ede:	2f0c           	move.l a4,-(sp)
     ee0:	2f0a           	move.l a2,-(sp)
     ee2:	4eb9 0000 2718 	jsr 2718 <Zoom_ZoomIntoPicture>
  WaitBlit();
     ee8:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
     eee:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
     ef2:	41ec 0004      	lea 4(a4),a0
     ef6:	2b48 ffa0      	move.l a0,-96(a5)
  UWORD *valsupposed = destlinezoom1;
  UWORD mask = 0x0;
  for(int i=0;i<17;i++) {
     efa:	200c           	move.l a4,d0
     efc:	0680 0000 02d4 	addi.l #724,d0
     f02:	4fef 000c      	lea 12(sp),sp
  UWORD *valactual = destination+2; 
     f06:	3c7c 000f      	movea.w #15,a6
  UWORD mask = 0x0;
     f0a:	4242           	clr.w d2
     f0c:	7600           	moveq #0,d3
     f0e:	2e0a           	move.l a2,d7
     f10:	2c00           	move.l d0,d6
     f12:	2646           	movea.l d6,a3
     f14:	47eb fd30      	lea -720(a3),a3
     f18:	45ee fff1      	lea -15(a6),a2
    for(int i2=0;i2<15;i2++) { 
      TestRow( valsupposed, valactual, mask, i2+i*16);
     f1c:	2f0a           	move.l a2,-(sp)
     f1e:	2f03           	move.l d3,-(sp)
     f20:	2f0b           	move.l a3,-(sp)
     f22:	4eb9 0000 21b0 	jsr 21b0 <TestRow.constprop.2>
      valactual += ZMLINESIZE/2;
     f28:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
     f2c:	4642           	not.w d2
     f2e:	528a           	addq.l #1,a2
    for(int i2=0;i2<15;i2++) { 
     f30:	4fef 000c      	lea 12(sp),sp
     f34:	bc8b           	cmp.l a3,d6
     f36:	6600 0b3e      	bne.w 1a76 <main+0x1a70>
    }
    TestRow( valsupposed, valactual, mask, 15+i*16);
     f3a:	2f0e           	move.l a6,-(sp)
     f3c:	7600           	moveq #0,d3
     f3e:	3602           	move.w d2,d3
     f40:	2f03           	move.l d3,-(sp)
     f42:	2f0b           	move.l a3,-(sp)
     f44:	4eb9 0000 21b0 	jsr 21b0 <TestRow.constprop.2>
    valactual += ZMLINESIZE/2;
     f4a:	2c0b           	move.l a3,d6
     f4c:	0686 0000 0300 	addi.l #768,d6
     f52:	4dee 0010      	lea 16(a6),a6
  for(int i=0;i<17;i++) {
     f56:	4fef 000c      	lea 12(sp),sp
     f5a:	bcfc 011f      	cmpa.w #287,a6
     f5e:	66b2           	bne.s f12 <main+0xf0c>
     f60:	2447           	movea.l d7,a2
  
  UWORD *tmp = source;
  source = destination;
  destination = tmp;
  
  Zoom_ZoomIntoPicture( source, destination, 1);
     f62:	4878 0001      	pea 1 <_start+0x1>
     f66:	2f07           	move.l d7,-(sp)
     f68:	2f0c           	move.l a4,-(sp)
     f6a:	4eb9 0000 2718 	jsr 2718 <Zoom_ZoomIntoPicture>
  WaitBlit();
     f70:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
     f76:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
     f7a:	41ea 0004      	lea 4(a2),a0
     f7e:	2b48 ff98      	move.l a0,-104(a5)
     f82:	4fef 000c      	lea 12(sp),sp
     f86:	2b48 ff9c      	move.l a0,-100(a5)
  valsupposed = destlinezoom2;
  mask = 0x0000;
  for(int i2=0;i2<7;i2++) { 
     f8a:	7c00           	moveq #0,d6
  mask = 0x0000;
     f8c:	4242           	clr.w d2
     f8e:	47f9 0000 209a 	lea 209a <TestRow.constprop.3>,a3
    TestRow( valsupposed, valactual, mask, i2);
     f94:	2f06           	move.l d6,-(sp)
     f96:	3f02           	move.w d2,-(sp)
     f98:	4267           	clr.w -(sp)
     f9a:	2f2d ff9c      	move.l -100(a5),-(sp)
     f9e:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
     fa0:	7030           	moveq #48,d0
     fa2:	d1ad ff9c      	add.l d0,-100(a5)
    mask = mask ^ 0xffff;
     fa6:	4642           	not.w d2
  for(int i2=0;i2<7;i2++) { 
     fa8:	5286           	addq.l #1,d6
     faa:	4fef 000c      	lea 12(sp),sp
     fae:	7007           	moveq #7,d0
     fb0:	b086           	cmp.l d6,d0
     fb2:	66e0           	bne.s f94 <main+0xf8e>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
     fb4:	4878 0008      	pea 8 <main+0x2>
     fb8:	2f3c 0000 ffff 	move.l #65535,-(sp)
     fbe:	486a 0154      	pea 340(a2)
     fc2:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 9);
     fc4:	4878 0009      	pea 9 <main+0x3>
     fc8:	2f3c 0000 ffff 	move.l #65535,-(sp)
     fce:	486a 0184      	pea 388(a2)
     fd2:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 10);
     fd4:	4878 000a      	pea a <main+0x4>
     fd8:	42a7           	clr.l -(sp)
     fda:	486a 01b4      	pea 436(a2)
     fde:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 11);
     fe0:	4fef 0024      	lea 36(sp),sp
     fe4:	4878 000b      	pea b <main+0x5>
     fe8:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
     fea:	41ea 01e4      	lea 484(a2),a0
     fee:	2b48 ffa4      	move.l a0,-92(a5)
  TestRow( valsupposed, valactual, 0x0000, 11);
     ff2:	2f08           	move.l a0,-(sp)
     ff4:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  
  for(int i=0;i<15;i++) {
     ff6:	220a           	move.l a2,d1
     ff8:	0681 0000 0484 	addi.l #1156,d1
     ffe:	4fef 000c      	lea 12(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
    1002:	3c7c 0018      	movea.w #24,a6
    1006:	7600           	moveq #0,d3
    1008:	3602           	move.w d2,d3
    100a:	2b4a ff9c      	move.l a2,-100(a5)
    100e:	2e01           	move.l d1,d7
    1010:	2047           	movea.l d7,a0
    1012:	41e8 fd90      	lea -624(a0),a0
    1016:	2b48 ffa8      	move.l a0,-88(a5)
    101a:	45ee fff3      	lea -13(a6),a2
    101e:	2c03           	move.l d3,d6
    for(int i2=0;i2<13;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    1020:	2f0a           	move.l a2,-(sp)
    1022:	2f06           	move.l d6,-(sp)
    1024:	2f2d ffa8      	move.l -88(a5),-(sp)
    1028:	4e93           	jsr (a3)
      valactual += ZMLINESIZE/2;
    102a:	7030           	moveq #48,d0
    102c:	d1ad ffa8      	add.l d0,-88(a5)
      mask = mask ^ 0xffff;
    1030:	4642           	not.w d2
    1032:	528a           	addq.l #1,a2
    for(int i2=0;i2<13;i2++) {  
    1034:	4fef 000c      	lea 12(sp),sp
    1038:	bead ffa8      	cmp.l -88(a5),d7
    103c:	6722           	beq.s 1060 <main+0x105a>
    103e:	7c00           	moveq #0,d6
    1040:	3c02           	move.w d2,d6
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    1042:	2f0a           	move.l a2,-(sp)
    1044:	2f06           	move.l d6,-(sp)
    1046:	2f2d ffa8      	move.l -88(a5),-(sp)
    104a:	4e93           	jsr (a3)
      valactual += ZMLINESIZE/2;
    104c:	7030           	moveq #48,d0
    104e:	d1ad ffa8      	add.l d0,-88(a5)
      mask = mask ^ 0xffff;
    1052:	4642           	not.w d2
    1054:	528a           	addq.l #1,a2
    for(int i2=0;i2<13;i2++) {  
    1056:	4fef 000c      	lea 12(sp),sp
    105a:	bead ffa8      	cmp.l -88(a5),d7
    105e:	66de           	bne.s 103e <main+0x1038>
    }

    TestRow( valsupposed, valactual, mask, i*17+11+13);
    1060:	7600           	moveq #0,d3
    1062:	3602           	move.w d2,d3
    1064:	2f0e           	move.l a6,-(sp)
    1066:	2f03           	move.l d3,-(sp)
    1068:	2f2d ffa8      	move.l -88(a5),-(sp)
    106c:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    106e:	486e 0001      	pea 1(a6)
    1072:	2f03           	move.l d3,-(sp)
    1074:	206d ffa8      	movea.l -88(a5),a0
    1078:	4868 0030      	pea 48(a0)
    107c:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    107e:	486e 0002      	pea 2(a6)
    1082:	2f06           	move.l d6,-(sp)
    1084:	206d ffa8      	movea.l -88(a5),a0
    1088:	4868 0060      	pea 96(a0)
    108c:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    108e:	4fef 0024      	lea 36(sp),sp
    1092:	486e 0003      	pea 3(a6)
    1096:	2f06           	move.l d6,-(sp)
    1098:	206d ffa8      	movea.l -88(a5),a0
    109c:	4868 0090      	pea 144(a0)
    10a0:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    10a2:	2e2d ffa8      	move.l -88(a5),d7
    10a6:	0687 0000 0330 	addi.l #816,d7
    10ac:	4dee 0011      	lea 17(a6),a6
  for(int i=0;i<15;i++) {
    10b0:	4fef 000c      	lea 12(sp),sp
    10b4:	bcfc 0117      	cmpa.w #279,a6
    10b8:	6600 ff56      	bne.w 1010 <main+0x100a>
    10bc:	246d ff9c      	movea.l -100(a5),a2
    10c0:	41ea 31e4      	lea 12772(a2),a0
    10c4:	2b48 ff9c      	move.l a0,-100(a5)
  }

  for(int i2=0;i2<6;i2++) { 
    10c8:	7c00           	moveq #0,d6
    TestRow( valsupposed, valactual, mask, i2);
    10ca:	2f06           	move.l d6,-(sp)
    10cc:	2f03           	move.l d3,-(sp)
    10ce:	2f2d ff9c      	move.l -100(a5),-(sp)
    10d2:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    10d4:	7030           	moveq #48,d0
    10d6:	d1ad ff9c      	add.l d0,-100(a5)
    mask = mask ^ 0xffff;
    10da:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) { 
    10dc:	5286           	addq.l #1,d6
    10de:	4fef 000c      	lea 12(sp),sp
    10e2:	7006           	moveq #6,d0
    10e4:	b086           	cmp.l d6,d0
    10e6:	6722           	beq.s 110a <main+0x1104>
    10e8:	7600           	moveq #0,d3
    10ea:	3602           	move.w d2,d3
    TestRow( valsupposed, valactual, mask, i2);
    10ec:	2f06           	move.l d6,-(sp)
    10ee:	2f03           	move.l d3,-(sp)
    10f0:	2f2d ff9c      	move.l -100(a5),-(sp)
    10f4:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    10f6:	7030           	moveq #48,d0
    10f8:	d1ad ff9c      	add.l d0,-100(a5)
    mask = mask ^ 0xffff;
    10fc:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) { 
    10fe:	5286           	addq.l #1,d6
    1100:	4fef 000c      	lea 12(sp),sp
    1104:	7006           	moveq #6,d0
    1106:	b086           	cmp.l d6,d0
    1108:	66de           	bne.s 10e8 <main+0x10e2>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 2);
    110a:	4878 0002      	pea 2 <_start+0x2>
    110e:	2f0c           	move.l a4,-(sp)
    1110:	2f0a           	move.l a2,-(sp)
    1112:	4eb9 0000 2718 	jsr 2718 <Zoom_ZoomIntoPicture>
  WaitBlit();
    1118:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    111e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom3;
  mask = 0x0000;
  
  TestRow( valsupposed, valactual, 0xffff, 0);
    1122:	42a7           	clr.l -(sp)
    1124:	2f3c 0000 ffff 	move.l #65535,-(sp)
    112a:	2f2d ffa0      	move.l -96(a5),-(sp)
    112e:	47f9 0000 1f84 	lea 1f84 <TestRow.constprop.4>,a3
    1134:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 1);
    1136:	4878 0001      	pea 1 <_start+0x1>
    113a:	42a7           	clr.l -(sp)
    113c:	486c 0034      	pea 52(a4)
    1140:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 2);
    1142:	4fef 0024      	lea 36(sp),sp
    1146:	4878 0002      	pea 2 <_start+0x2>
    114a:	42a7           	clr.l -(sp)
    114c:	486c 0064      	pea 100(a4)
    1150:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 3);
    1152:	4878 0003      	pea 3 <_start+0x3>
    1156:	2f3c 0000 ffff 	move.l #65535,-(sp)
  valactual += ZMLINESIZE/2;
    115c:	41ec 0094      	lea 148(a4),a0
    1160:	2b48 ffa8      	move.l a0,-88(a5)
  TestRow( valsupposed, valactual, 0xffff, 3);
    1164:	2f08           	move.l a0,-(sp)
    1166:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 4);
    1168:	4878 0004      	pea 4 <_start+0x4>
    116c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1172:	486c 00c4      	pea 196(a4)
    1176:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  for(int i=0;i<14;i++) {
    1178:	220c           	move.l a4,d1
    117a:	0681 0000 0334 	addi.l #820,d1
    1180:	4fef 0024      	lea 36(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 4);
    1184:	3c7c 0011      	movea.w #17,a6
    1188:	7400           	moveq #0,d2
    118a:	76ff           	moveq #-1,d3
    118c:	2b4a ff9c      	move.l a2,-100(a5)
    1190:	2e01           	move.l d1,d7
    1192:	2047           	movea.l d7,a0
    1194:	41e8 fdc0      	lea -576(a0),a0
    1198:	2b48 ffac      	move.l a0,-84(a5)
    119c:	45ee fff4      	lea -12(a6),a2
    for(int i2=0;i2<12;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*18+5);
    11a0:	2f0a           	move.l a2,-(sp)
    11a2:	2f02           	move.l d2,-(sp)
    11a4:	2f2d ffac      	move.l -84(a5),-(sp)
    11a8:	4e93           	jsr (a3)
      valactual += ZMLINESIZE/2;
    11aa:	7030           	moveq #48,d0
    11ac:	d1ad ffac      	add.l d0,-84(a5)
      mask = mask ^ 0xffff;
    11b0:	528a           	addq.l #1,a2
    for(int i2=0;i2<12;i2++) {  
    11b2:	4fef 000c      	lea 12(sp),sp
    11b6:	bead ffac      	cmp.l -84(a5),d7
    11ba:	6722           	beq.s 11de <main+0x11d8>
    11bc:	7400           	moveq #0,d2
    11be:	3403           	move.w d3,d2
    11c0:	4643           	not.w d3
      TestRow( valsupposed, valactual, mask, i2+i*18+5);
    11c2:	2f0a           	move.l a2,-(sp)
    11c4:	2f02           	move.l d2,-(sp)
    11c6:	2f2d ffac      	move.l -84(a5),-(sp)
    11ca:	4e93           	jsr (a3)
      valactual += ZMLINESIZE/2;
    11cc:	7030           	moveq #48,d0
    11ce:	d1ad ffac      	add.l d0,-84(a5)
      mask = mask ^ 0xffff;
    11d2:	528a           	addq.l #1,a2
    for(int i2=0;i2<12;i2++) {  
    11d4:	4fef 000c      	lea 12(sp),sp
    11d8:	bead ffac      	cmp.l -84(a5),d7
    11dc:	66de           	bne.s 11bc <main+0x11b6>
    }

    TestRow( valsupposed, valactual, mask, i*18+5+12);
    11de:	7c00           	moveq #0,d6
    11e0:	3c03           	move.w d3,d6
    11e2:	2f0e           	move.l a6,-(sp)
    11e4:	2f06           	move.l d6,-(sp)
    11e6:	2f2d ffac      	move.l -84(a5),-(sp)
    11ea:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*18+5+13);
    11ec:	486e 0001      	pea 1(a6)
    11f0:	2f06           	move.l d6,-(sp)
    11f2:	206d ffac      	movea.l -84(a5),a0
    11f6:	4868 0030      	pea 48(a0)
    11fa:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*18+5+14);
    11fc:	486e 0002      	pea 2(a6)
    1200:	2f02           	move.l d2,-(sp)
    1202:	206d ffac      	movea.l -84(a5),a0
    1206:	4868 0060      	pea 96(a0)
    120a:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*18+5+15);
    120c:	4fef 0024      	lea 36(sp),sp
    1210:	486e 0003      	pea 3(a6)
    1214:	2f02           	move.l d2,-(sp)
    1216:	206d ffac      	movea.l -84(a5),a0
    121a:	4868 0090      	pea 144(a0)
    121e:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*18+5+16);
    1220:	486e 0004      	pea 4(a6)
    1224:	2f06           	move.l d6,-(sp)
    1226:	206d ffac      	movea.l -84(a5),a0
    122a:	4868 00c0      	pea 192(a0)
    122e:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*18+5+17);
    1230:	486e 0005      	pea 5(a6)
    1234:	2f06           	move.l d6,-(sp)
    1236:	206d ffac      	movea.l -84(a5),a0
    123a:	4868 00f0      	pea 240(a0)
    123e:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1240:	2e2d ffac      	move.l -84(a5),d7
    1244:	0687 0000 0360 	addi.l #864,d7
    124a:	4dee 0012      	lea 18(a6),a6
  for(int i=0;i<14;i++) {
    124e:	4fef 0024      	lea 36(sp),sp
    1252:	bcfc 010d      	cmpa.w #269,a6
    1256:	6600 ff3a      	bne.w 1192 <main+0x118c>
    125a:	246d ff9c      	movea.l -100(a5),a2
    125e:	4dec 3034      	lea 12340(a4),a6
    1262:	2b7c 0000 0101 	move.l #257,-100(a5)
    1268:	ff9c 
  }

  for(int i2=0;i2<12;i2++) {  
    TestRow( valsupposed, valactual, mask, i2+14*18+5);
    126a:	2f2d ff9c      	move.l -100(a5),-(sp)
    126e:	2f02           	move.l d2,-(sp)
    1270:	2f0e           	move.l a6,-(sp)
    1272:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    1274:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1278:	52ad ff9c      	addq.l #1,-100(a5)
  for(int i2=0;i2<12;i2++) {  
    127c:	4fef 000c      	lea 12(sp),sp
    1280:	0cad 0000 010d 	cmpi.l #269,-100(a5)
    1286:	ff9c 
    1288:	6726           	beq.s 12b0 <main+0x12aa>
    128a:	7400           	moveq #0,d2
    128c:	3403           	move.w d3,d2
    128e:	4643           	not.w d3
    TestRow( valsupposed, valactual, mask, i2+14*18+5);
    1290:	2f2d ff9c      	move.l -100(a5),-(sp)
    1294:	2f02           	move.l d2,-(sp)
    1296:	2f0e           	move.l a6,-(sp)
    1298:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    129a:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    129e:	52ad ff9c      	addq.l #1,-100(a5)
  for(int i2=0;i2<12;i2++) {  
    12a2:	4fef 000c      	lea 12(sp),sp
    12a6:	0cad 0000 010d 	cmpi.l #269,-100(a5)
    12ac:	ff9c 
    12ae:	66da           	bne.s 128a <main+0x1284>
    12b0:	7c00           	moveq #0,d6
    12b2:	3c03           	move.w d3,d6
  }
  
  TestRow( valsupposed, valactual, mask, 14*18+5+12);
    12b4:	2f2d ff9c      	move.l -100(a5),-(sp)
    12b8:	2f06           	move.l d6,-(sp)
    12ba:	41ec 3274      	lea 12916(a4),a0
    12be:	2b48 ffac      	move.l a0,-84(a5)
    12c2:	2f08           	move.l a0,-(sp)
    12c4:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 14*18+5+13);
    12c6:	4878 010e      	pea 10e <main+0x108>
    12ca:	2f06           	move.l d6,-(sp)
  valactual += ZMLINESIZE/2;
    12cc:	41ec 32a4      	lea 12964(a4),a0
    12d0:	2b48 ffb0      	move.l a0,-80(a5)
  TestRow( valsupposed, valactual, mask, 14*18+5+13);
    12d4:	2f08           	move.l a0,-(sp)
    12d6:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 14*18+5+14);
    12d8:	4878 010f      	pea 10f <main+0x109>
    12dc:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    12de:	41ec 32d4      	lea 13012(a4),a0
    12e2:	2b48 ff9c      	move.l a0,-100(a5)
  TestRow( valsupposed, valactual, mask, 14*18+5+14);
    12e6:	2f08           	move.l a0,-(sp)
    12e8:	4e93           	jsr (a3)

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 3);
    12ea:	4fef 0024      	lea 36(sp),sp
    12ee:	4878 0003      	pea 3 <_start+0x3>
    12f2:	2f0a           	move.l a2,-(sp)
    12f4:	2f0c           	move.l a4,-(sp)
    12f6:	4eb9 0000 2718 	jsr 2718 <Zoom_ZoomIntoPicture>
  WaitBlit();
    12fc:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    1302:	4eae ff1c      	jsr -228(a6)
    1306:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
  valsupposed = destlinezoom4;
  mask = 0x0000;
  
  for(int i2=0;i2<10;i2++) {  
    130a:	7400           	moveq #0,d2
  mask = 0x0000;
    130c:	4246           	clr.w d6
    130e:	47f9 0000 1e6e 	lea 1e6e <TestRow.constprop.5>,a3
    TestRow( valsupposed, valactual, mask, i2);
    1314:	2f02           	move.l d2,-(sp)
    1316:	3f06           	move.w d6,-(sp)
    1318:	4267           	clr.w -(sp)
    131a:	2f2d ff98      	move.l -104(a5),-(sp)
    131e:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    1320:	7030           	moveq #48,d0
    1322:	d1ad ff98      	add.l d0,-104(a5)
    mask = mask ^ 0xffff;
    1326:	4646           	not.w d6
  for(int i2=0;i2<10;i2++) {  
    1328:	5282           	addq.l #1,d2
    132a:	4fef 000c      	lea 12(sp),sp
    132e:	700a           	moveq #10,d0
    1330:	b082           	cmp.l d2,d0
    1332:	66e0           	bne.s 1314 <main+0x130e>
    1334:	3c7c 0009      	movea.w #9,a6
  }
  
  mask = 0;
    1338:	4243           	clr.w d3
    133a:	2b4a ff98      	move.l a2,-104(a5)
    133e:	3443           	movea.w d3,a2
  for(int i=0;i<13;i++) {  
    TestRow( valsupposed, valactual, mask, 0+9+i*19);
    1340:	7400           	moveq #0,d2
    1342:	340a           	move.w a2,d2
    1344:	2f0e           	move.l a6,-(sp)
    1346:	2f02           	move.l d2,-(sp)
    1348:	2f2d ffa4      	move.l -92(a5),-(sp)
    134c:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    134e:	2c2d ffa4      	move.l -92(a5),d6
    TestRow( valsupposed, valactual, mask, 1+9+i*19);
    1352:	486e 0001      	pea 1(a6)
    1356:	2f02           	move.l d2,-(sp)
    1358:	2046           	movea.l d6,a0
    135a:	4868 0030      	pea 48(a0)
    135e:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1360:	3e0a           	move.w a2,d7
    1362:	4647           	not.w d7
    TestRow( valsupposed, valactual, mask, 2+9+i*19);
    1364:	7600           	moveq #0,d3
    1366:	3607           	move.w d7,d3
    1368:	486e 0002      	pea 2(a6)
    136c:	2f03           	move.l d3,-(sp)
    136e:	206d ffa4      	movea.l -92(a5),a0
    1372:	4868 0060      	pea 96(a0)
    1376:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 3+9+i*19);
    1378:	4fef 0024      	lea 36(sp),sp
    137c:	486e 0003      	pea 3(a6)
    1380:	2f03           	move.l d3,-(sp)
    1382:	206d ffa4      	movea.l -92(a5),a0
    1386:	4868 0090      	pea 144(a0)
    138a:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, 4+9+i*19);
    138c:	486e 0004      	pea 4(a6)
    1390:	2f02           	move.l d2,-(sp)
    1392:	206d ffa4      	movea.l -92(a5),a0
    1396:	4868 00c0      	pea 192(a0)
    139a:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 5+9+i*19);
    139c:	486e 0005      	pea 5(a6)
    13a0:	2f02           	move.l d2,-(sp)
    13a2:	206d ffa4      	movea.l -92(a5),a0
    13a6:	4868 00f0      	pea 240(a0)
    13aa:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, 6+9+i*19);
    13ac:	4fef 0024      	lea 36(sp),sp
    13b0:	486e 0006      	pea 6(a6)
    13b4:	2f03           	move.l d3,-(sp)
    13b6:	206d ffa4      	movea.l -92(a5),a0
    13ba:	4868 0120      	pea 288(a0)
    13be:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 7+9+i*19);
    13c0:	486e 0007      	pea 7(a6)
    13c4:	2f03           	move.l d3,-(sp)
    13c6:	206d ffa4      	movea.l -92(a5),a0
    13ca:	4868 0150      	pea 336(a0)
    13ce:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    for(int i2=0;i2<11;i2++) {  
    13d0:	4fef 0018      	lea 24(sp),sp
    TestRow( valsupposed, valactual, mask, 7+9+i*19);
    13d4:	260e           	move.l a6,d3
    13d6:	0686 0000 0390 	addi.l #912,d6
    13dc:	06ad 0000 0180 	addi.l #384,-92(a5)
    13e2:	ffa4 
      TestRow( valsupposed, valactual, mask, i2+i*19+9);
    13e4:	2f03           	move.l d3,-(sp)
    13e6:	2f02           	move.l d2,-(sp)
    13e8:	2f2d ffa4      	move.l -92(a5),-(sp)
    13ec:	4e93           	jsr (a3)
      valactual += ZMLINESIZE/2;
    13ee:	7030           	moveq #48,d0
    13f0:	d1ad ffa4      	add.l d0,-92(a5)
      mask = mask ^ 0xffff;
    13f4:	3447           	movea.w d7,a2
    13f6:	5283           	addq.l #1,d3
    for(int i2=0;i2<11;i2++) {  
    13f8:	4fef 000c      	lea 12(sp),sp
    13fc:	bcad ffa4      	cmp.l -92(a5),d6
    1400:	6724           	beq.s 1426 <main+0x1420>
    1402:	7400           	moveq #0,d2
    1404:	3407           	move.w d7,d2
    1406:	4647           	not.w d7
      TestRow( valsupposed, valactual, mask, i2+i*19+9);
    1408:	2f03           	move.l d3,-(sp)
    140a:	2f02           	move.l d2,-(sp)
    140c:	2f2d ffa4      	move.l -92(a5),-(sp)
    1410:	4e93           	jsr (a3)
      valactual += ZMLINESIZE/2;
    1412:	7030           	moveq #48,d0
    1414:	d1ad ffa4      	add.l d0,-92(a5)
      mask = mask ^ 0xffff;
    1418:	3447           	movea.w d7,a2
    141a:	5283           	addq.l #1,d3
    for(int i2=0;i2<11;i2++) {  
    141c:	4fef 000c      	lea 12(sp),sp
    1420:	bcad ffa4      	cmp.l -92(a5),d6
    1424:	66dc           	bne.s 1402 <main+0x13fc>
    1426:	4dee 0013      	lea 19(a6),a6
  for(int i=0;i<13;i++) {  
    142a:	bcfc 0100      	cmpa.w #256,a6
    142e:	6600 ff10      	bne.w 1340 <main+0x133a>
    1432:	3607           	move.w d7,d3
    1434:	246d ff98      	movea.l -104(a5),a2
    }
  }

  TestRow( valsupposed, valactual, 0xffff, 0+9+19*13);
    1438:	2f0e           	move.l a6,-(sp)
    143a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1440:	486a 3034      	pea 12340(a2)
    1444:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 1+9+13*19);
    1446:	4878 0101      	pea 101 <main+0xfb>
    144a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1450:	486a 3064      	pea 12388(a2)
    1454:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 2+9+13*19);
    1456:	4878 0102      	pea 102 <main+0xfc>
    145a:	42a7           	clr.l -(sp)
    145c:	486a 3094      	pea 12436(a2)
    1460:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 3+9+13*19);
    1462:	4fef 0024      	lea 36(sp),sp
    1466:	4878 0103      	pea 103 <main+0xfd>
    146a:	42a7           	clr.l -(sp)
    146c:	486a 30c4      	pea 12484(a2)
    1470:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 4+9+13*19);
    1472:	4878 0104      	pea 104 <main+0xfe>
    1476:	2f3c 0000 ffff 	move.l #65535,-(sp)
    147c:	486a 30f4      	pea 12532(a2)
    1480:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 5+9+13*19);
    1482:	4878 0105      	pea 105 <main+0xff>
    1486:	2f3c 0000 ffff 	move.l #65535,-(sp)
    148c:	486a 3124      	pea 12580(a2)
    1490:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 6+9+13*19);
    1492:	4fef 0024      	lea 36(sp),sp
    1496:	4878 0106      	pea 106 <main+0x100>
    149a:	42a7           	clr.l -(sp)
    149c:	486a 3154      	pea 12628(a2)
    14a0:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 7+9+13*19);
    14a2:	4878 0107      	pea 107 <main+0x101>
    14a6:	42a7           	clr.l -(sp)
    14a8:	486a 3184      	pea 12676(a2)
    14ac:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2; 
    14ae:	41ea 31b4      	lea 12724(a2),a0
    14b2:	2b48 ff98      	move.l a0,-104(a5)
    14b6:	4fef 0018      	lea 24(sp),sp
    14ba:	243c 0000 0108 	move.l #264,d2

  for(int i2=0;i2<7;i2++) {  
    TestRow( valsupposed, valactual, mask, i2+8+9+13*19);
    14c0:	2f02           	move.l d2,-(sp)
    14c2:	3f03           	move.w d3,-(sp)
    14c4:	4267           	clr.w -(sp)
    14c6:	2f2d ff98      	move.l -104(a5),-(sp)
    14ca:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    14cc:	7030           	moveq #48,d0
    14ce:	d1ad ff98      	add.l d0,-104(a5)
    mask = mask ^ 0xffff;
    14d2:	4643           	not.w d3
    14d4:	5282           	addq.l #1,d2
  for(int i2=0;i2<7;i2++) {  
    14d6:	4fef 000c      	lea 12(sp),sp
    14da:	0c82 0000 010f 	cmpi.l #271,d2
    14e0:	66de           	bne.s 14c0 <main+0x14ba>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 4);
    14e2:	4878 0004      	pea 4 <_start+0x4>
    14e6:	2f0c           	move.l a4,-(sp)
    14e8:	2f0a           	move.l a2,-(sp)
    14ea:	4eb9 0000 2718 	jsr 2718 <Zoom_ZoomIntoPicture>
  WaitBlit();
    14f0:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    14f6:	4eae ff1c      	jsr -228(a6)
    14fa:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
  valsupposed = destlinezoom5;
  mask = 0xffff;
  

  for(int i2=0;i2<3;i2++) {  
    14fe:	7400           	moveq #0,d2
  mask = 0xffff;
    1500:	76ff           	moveq #-1,d3
    1502:	47f9 0000 1d58 	lea 1d58 <TestRow.constprop.6>,a3
    1508:	246d ffa0      	movea.l -96(a5),a2
    TestRow( valsupposed, valactual, mask, i2);
    150c:	2f02           	move.l d2,-(sp)
    150e:	3f03           	move.w d3,-(sp)
    1510:	4267           	clr.w -(sp)
    1512:	2f0a           	move.l a2,-(sp)
    1514:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    1516:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    151a:	4643           	not.w d3
  for(int i2=0;i2<3;i2++) {  
    151c:	5282           	addq.l #1,d2
    151e:	4fef 000c      	lea 12(sp),sp
    1522:	7003           	moveq #3,d0
    1524:	b082           	cmp.l d2,d0
    1526:	66e4           	bne.s 150c <main+0x1506>
    1528:	246d ffa8      	movea.l -88(a5),a2
    152c:	41ec 3154      	lea 12628(a4),a0
    1530:	2b48 ffa0      	move.l a0,-96(a5)
    1534:	307c 0009      	movea.w #9,a0
    1538:	2b48 ff98      	move.l a0,-104(a5)
  }

  mask = 0;
    153c:	4242           	clr.w d2
    153e:	2b4c ffa4      	move.l a4,-92(a5)
  for(int i=0;i<13;i++) {  
    TestRow( valsupposed, valactual, mask, 0+9+i*19);
    1542:	7600           	moveq #0,d3
    1544:	3602           	move.w d2,d3
    1546:	2f2d ff98      	move.l -104(a5),-(sp)
    154a:	2f03           	move.l d3,-(sp)
    154c:	2f0a           	move.l a2,-(sp)
    154e:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+9+i*19);
    1550:	206d ff98      	movea.l -104(a5),a0
    1554:	4868 0001      	pea 1(a0)
    1558:	2f03           	move.l d3,-(sp)
    155a:	486a 0030      	pea 48(a2)
    155e:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1560:	4642           	not.w d2
    TestRow( valsupposed, valactual, mask, 2+9+i*19);
    1562:	7c00           	moveq #0,d6
    1564:	3c02           	move.w d2,d6
    1566:	206d ff98      	movea.l -104(a5),a0
    156a:	4868 0002      	pea 2(a0)
    156e:	2f06           	move.l d6,-(sp)
    1570:	486a 0060      	pea 96(a2)
    1574:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 3+9+i*19);
    1576:	4fef 0024      	lea 36(sp),sp
    157a:	206d ff98      	movea.l -104(a5),a0
    157e:	4868 0003      	pea 3(a0)
    1582:	2f06           	move.l d6,-(sp)
    1584:	486a 0090      	pea 144(a2)
    1588:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, 4+9+i*19);
    158a:	206d ff98      	movea.l -104(a5),a0
    158e:	4868 0004      	pea 4(a0)
    1592:	2f03           	move.l d3,-(sp)
    1594:	486a 00c0      	pea 192(a2)
    1598:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 5+9+i*19);
    159a:	206d ff98      	movea.l -104(a5),a0
    159e:	4868 0005      	pea 5(a0)
    15a2:	2f03           	move.l d3,-(sp)
    15a4:	486a 00f0      	pea 240(a2)
    15a8:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, 6+9+i*19);
    15aa:	4fef 0024      	lea 36(sp),sp
    15ae:	286d ff98      	movea.l -104(a5),a4
    15b2:	5c8c           	addq.l #6,a4
    15b4:	2f0c           	move.l a4,-(sp)
    15b6:	2f06           	move.l d6,-(sp)
    15b8:	486a 0120      	pea 288(a2)
    15bc:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 7+9+i*19);
    15be:	2e2d ff98      	move.l -104(a5),d7
    15c2:	5e87           	addq.l #7,d7
    15c4:	2f07           	move.l d7,-(sp)
    15c6:	2f06           	move.l d6,-(sp)
    15c8:	486a 0150      	pea 336(a2)
    15cc:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, 6+9+i*19);
    15ce:	2f0c           	move.l a4,-(sp)
    15d0:	2f03           	move.l d3,-(sp)
    15d2:	486a 0180      	pea 384(a2)
    15d6:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 7+9+i*19);
    15d8:	4fef 0020      	lea 32(sp),sp
    15dc:	2e87           	move.l d7,(sp)
    15de:	2f03           	move.l d3,-(sp)
    15e0:	486a 01b0      	pea 432(a2)
    15e4:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    for(int i2=0;i2<10;i2++) {  
    15e6:	4fef 000c      	lea 12(sp),sp
    TestRow( valsupposed, valactual, mask, 7+9+i*19);
    15ea:	262d ff98      	move.l -104(a5),d3
    15ee:	4dea 03c0      	lea 960(a2),a6
    15f2:	45ea 01e0      	lea 480(a2),a2
      TestRow( valsupposed, valactual, mask, i2+i*19+9);
    15f6:	2f03           	move.l d3,-(sp)
    15f8:	2f06           	move.l d6,-(sp)
    15fa:	2f0a           	move.l a2,-(sp)
    15fc:	4e93           	jsr (a3)
      valactual += ZMLINESIZE/2;
    15fe:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    1602:	4642           	not.w d2
    1604:	5283           	addq.l #1,d3
    for(int i2=0;i2<10;i2++) {  
    1606:	4fef 000c      	lea 12(sp),sp
    160a:	bdca           	cmpa.l a2,a6
    160c:	671c           	beq.s 162a <main+0x1624>
    160e:	7c00           	moveq #0,d6
    1610:	3c02           	move.w d2,d6
      TestRow( valsupposed, valactual, mask, i2+i*19+9);
    1612:	2f03           	move.l d3,-(sp)
    1614:	2f06           	move.l d6,-(sp)
    1616:	2f0a           	move.l a2,-(sp)
    1618:	4e93           	jsr (a3)
      valactual += ZMLINESIZE/2;
    161a:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    161e:	4642           	not.w d2
    1620:	5283           	addq.l #1,d3
    for(int i2=0;i2<10;i2++) {  
    1622:	4fef 000c      	lea 12(sp),sp
    1626:	bdca           	cmpa.l a2,a6
    1628:	66e4           	bne.s 160e <main+0x1608>
    162a:	7013           	moveq #19,d0
    162c:	d1ad ff98      	add.l d0,-104(a5)
  for(int i=0;i<13;i++) {  
    1630:	b5ed ffa0      	cmpa.l -96(a5),a2
    1634:	6600 ff0c      	bne.w 1542 <main+0x153c>
    1638:	286d ffa4      	movea.l -92(a5),a4
    }
  }

  TestRow( valsupposed, valactual, 0xffff, 0+9+19*13);
    163c:	4878 0100      	pea 100 <main+0xfa>
    1640:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1646:	2f0a           	move.l a2,-(sp)
    1648:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 1+9+13*19);
    164a:	4878 0101      	pea 101 <main+0xfb>
    164e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1654:	486c 3184      	pea 12676(a4)
    1658:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 2+9+13*19);
    165a:	4878 0102      	pea 102 <main+0xfc>
    165e:	42a7           	clr.l -(sp)
    1660:	486c 31b4      	pea 12724(a4)
    1664:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 3+9+13*19);
    1666:	4fef 0024      	lea 36(sp),sp
    166a:	4878 0103      	pea 103 <main+0xfd>
    166e:	42a7           	clr.l -(sp)
    1670:	486c 31e4      	pea 12772(a4)
    1674:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 4+9+13*19);
    1676:	4878 0104      	pea 104 <main+0xfe>
    167a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1680:	486c 3214      	pea 12820(a4)
    1684:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 5+9+13*19);
    1686:	4878 0105      	pea 105 <main+0xff>
    168a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1690:	486c 3244      	pea 12868(a4)
    1694:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 6+9+13*19);
    1696:	4fef 0024      	lea 36(sp),sp
    169a:	4878 0106      	pea 106 <main+0x100>
    169e:	42a7           	clr.l -(sp)
    16a0:	2f2d ffac      	move.l -84(a5),-(sp)
    16a4:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 7+9+13*19);
    16a6:	4878 0107      	pea 107 <main+0x101>
    16aa:	42a7           	clr.l -(sp)
    16ac:	2f2d ffb0      	move.l -80(a5),-(sp)
    16b0:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2; 
  TestRow( valsupposed, valactual, 0xffff, 7+9+13*19);
    16b2:	4878 0107      	pea 107 <main+0x101>
    16b6:	2f3c 0000 ffff 	move.l #65535,-(sp)
    16bc:	2f2d ff9c      	move.l -100(a5),-(sp)
    16c0:	4e93           	jsr (a3)
    16c2:	4fef 0024      	lea 36(sp),sp
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
    16c6:	4eb9 0000 3038 	jsr 3038 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    16cc:	4878 0010      	pea 10 <main+0xa>
    16d0:	4879 0000 653c 	pea 653c <ClsSprites>
    16d6:	42a7           	clr.l -(sp)
    16d8:	2f39 0000 66d4 	move.l 66d4 <Copperlist1>,-(sp)
    16de:	2044           	movea.l d4,a0
    16e0:	4e90           	jsr (a0)
    16e2:	4fef 0010      	lea 16(sp),sp
    16e6:	4a80           	tst.l d0
    16e8:	661e           	bne.s 1708 <main+0x1702>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    16ea:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    16f0:	4eae ffc4      	jsr -60(a6)
    16f4:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    16fa:	2200           	move.l d0,d1
    16fc:	243c 0000 40a4 	move.l #16548,d2
    1702:	762c           	moveq #44,d3
    1704:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    1708:	4878 000c      	pea c <main+0x6>
    170c:	4879 0000 650c 	pea 650c <ClScreen>
    1712:	4878 0010      	pea 10 <main+0xa>
    1716:	2f39 0000 66d4 	move.l 66d4 <Copperlist1>,-(sp)
    171c:	2044           	movea.l d4,a0
    171e:	4e90           	jsr (a0)
    1720:	4fef 0010      	lea 16(sp),sp
    1724:	4a80           	tst.l d0
    1726:	661e           	bne.s 1746 <main+0x1740>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    1728:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    172e:	4eae ffc4      	jsr -60(a6)
    1732:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1738:	2200           	move.l d0,d1
    173a:	243c 0000 40da 	move.l #16602,d2
    1740:	7636           	moveq #54,d3
    1742:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    1746:	4878 0002      	pea 2 <_start+0x2>
    174a:	4879 0000 6504 	pea 6504 <ClColor>
    1750:	4878 001e      	pea 1e <main+0x18>
    1754:	2f39 0000 66d4 	move.l 66d4 <Copperlist1>,-(sp)
    175a:	2044           	movea.l d4,a0
    175c:	4e90           	jsr (a0)
    175e:	4fef 0010      	lea 16(sp),sp
    1762:	4a80           	tst.l d0
    1764:	661e           	bne.s 1784 <main+0x177e>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1766:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    176c:	4eae ffc4      	jsr -60(a6)
    1770:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1776:	2200           	move.l d0,d1
    1778:	243c 0000 3e87 	move.l #16007,d2
    177e:	7621           	moveq #33,d3
    1780:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    1784:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdccdd>
    1788:	4878 0020      	pea 20 <main+0x1a>
    178c:	2f39 0000 66d4 	move.l 66d4 <Copperlist1>,-(sp)
    1792:	2045           	movea.l d5,a0
    1794:	4e90           	jsr (a0)
    1796:	4fef 000c      	lea 12(sp),sp
    179a:	4a80           	tst.l d0
    179c:	661e           	bne.s 17bc <main+0x17b6>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    179e:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    17a4:	4eae ffc4      	jsr -60(a6)
    17a8:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    17ae:	2200           	move.l d0,d1
    17b0:	243c 0000 3ea9 	move.l #16041,d2
    17b6:	7622           	moveq #34,d3
    17b8:	4eae ffd0      	jsr -48(a6)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    17bc:	2479 0000 66c8 	movea.l 66c8 <DrawBuffer>,a2
    17c2:	4879 0000 4450 	pea 4450 <rundemo.c.d99b7c69+0x7b7>
    17c8:	2f0a           	move.l a2,-(sp)
    17ca:	4eb9 0000 1c00 	jsr 1c00 <WriteFont.constprop.7>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    17d0:	508f           	addq.l #8,sp
    17d2:	0c52 ff00      	cmpi.w #-256,(a2)
    17d6:	671e           	beq.s 17f6 <main+0x17f0>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    17d8:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    17de:	4eae ffc4      	jsr -60(a6)
    17e2:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    17e8:	2200           	move.l d0,d1
    17ea:	243c 0000 4461 	move.l #17505,d2
    17f0:	7631           	moveq #49,d3
    17f2:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    17f6:	2f3c 0000 c800 	move.l #51200,-(sp)
    17fc:	4878 0084      	pea 84 <main+0x7e>
    1800:	4eb9 0000 3176 	jsr 3176 <FreeDisplay>
  RunTests();
	Delay(50);
    1806:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    180c:	7232           	moveq #50,d1
    180e:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    1812:	247c 00f0 ff60 	movea.l #15794016,a2
    1818:	508f           	addq.l #8,sp
    181a:	4a92           	tst.l (a2)
    181c:	6718           	beq.s 1836 <main+0x1830>
    181e:	4878 0001      	pea 1 <_start+0x1>
    1822:	47f9 0000 1c4e 	lea 1c4e <warpmode.part.0>,a3
    1828:	4e93           	jsr (a3)
    182a:	588f           	addq.l #4,sp
    182c:	4a92           	tst.l (a2)
    182e:	6706           	beq.s 1836 <main+0x1830>
    1830:	42a7           	clr.l -(sp)
    1832:	4e93           	jsr (a3)
    1834:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    1836:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    183c:	23ee 0022 0000 	move.l 34(a6),669c <ActiView>
    1842:	669c 
	OwnBlitter();
    1844:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    1848:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    184e:	4eae ff1c      	jsr -228(a6)
	Disable();
    1852:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    1858:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    185c:	2679 0000 66ae 	movea.l 66ae <hw>,a3
    1862:	302b 0010      	move.w 16(a3),d0
    1866:	33c0 0000 66a0 	move.w d0,66a0 <SystemADKCON>
	SystemInts=hw->intenar;
    186c:	302b 001c      	move.w 28(a3),d0
    1870:	33c0 0000 66a4 	move.w d0,66a4 <SystemInts>
	SystemDMA=hw->dmaconr;
    1876:	302b 0002      	move.w 2(a3),d0
    187a:	33c0 0000 66a2 	move.w d0,66a2 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    1880:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    1886:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
    188c:	45f9 0000 31e8 	lea 31e8 <WaitVbl>,a2
    1892:	4e92           	jsr (a2)
	WaitVbl();
    1894:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
    1896:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    189c:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    18a2:	93c9           	suba.l a1,a1
    18a4:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    18a8:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    18ae:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    18b2:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    18b8:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    18bc:	4e92           	jsr (a2)
	WaitVbl();
    18be:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    18c0:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
    18c6:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
    18cc:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    18d2:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    18d8:	082e 0000 0129 	btst #0,297(a6)
    18de:	6700 02d2      	beq.w 1bb2 <main+0x1bac>
		vbr = (APTR)Supervisor((void*)getvbr);
    18e2:	7ec0           	moveq #-64,d7
    18e4:	de8d           	add.l a5,d7
    18e6:	cf8d           	exg d7,a5
    18e8:	4eae ffe2      	jsr -30(a6)
    18ec:	cf8d           	exg d7,a5

	VBR=GetVBR();
    18ee:	23c0 0000 66a6 	move.l d0,66a6 <VBR.lto_priv.8>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    18f4:	2079 0000 66a6 	movea.l 66a6 <VBR.lto_priv.8>,a0
    18fa:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    18fe:	23c2 0000 66aa 	move.l d2,66aa <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    1904:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
    1906:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1908:	2079 0000 66ae 	movea.l 66ae <hw>,a0
    190e:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1912:	3028 0002      	move.w 2(a0),d0
    1916:	0800 000e      	btst #14,d0
    191a:	66f6           	bne.s 1912 <main+0x190c>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    191c:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    1922:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    1928:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    192e:	2279 0000 66a6 	movea.l 66a6 <VBR.lto_priv.8>,a1
    1934:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    1938:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    193e:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    1944:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    194a:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    1950:	3039 0000 66a4 	move.w 66a4 <SystemInts>,d0
    1956:	0040 8000      	ori.w #-32768,d0
    195a:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    195e:	3039 0000 66a2 	move.w 66a2 <SystemDMA>,d0
    1964:	0040 8000      	ori.w #-32768,d0
    1968:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    196c:	3039 0000 66a0 	move.w 66a0 <SystemADKCON>,d0
    1972:	0040 8000      	ori.w #-32768,d0
    1976:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    197a:	2279 0000 669c 	movea.l 669c <ActiView>,a1
    1980:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    1984:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    198a:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    198e:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    1994:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    1998:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    199e:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    19a2:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    19a8:	4eae fe32      	jsr -462(a6)
	Enable();
    19ac:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    19b2:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    19b6:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    19bc:	2279 0000 66d8 	movea.l 66d8 <DOSBase>,a1
    19c2:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    19c6:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    19cc:	2279 0000 66b2 	movea.l 66b2 <GfxBase>,a1
    19d2:	4eae fe62      	jsr -414(a6)
}
    19d6:	7000           	moveq #0,d0
    19d8:	4ced 5cfc ff70 	movem.l -144(a5),d2-d7/a2-a4/a6
    19de:	4e5d           	unlk a5
    19e0:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    19e2:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    19e8:	4eae ffc4      	jsr -60(a6)
    19ec:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    19f2:	2200           	move.l d0,d1
    19f4:	243c 0000 40a4 	move.l #16548,d2
    19fa:	762c           	moveq #44,d3
    19fc:	4eae ffd0      	jsr -48(a6)
    1a00:	6000 e7a6      	bra.w 1a8 <main+0x1a2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1a04:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1a0a:	4eae ffc4      	jsr -60(a6)
    1a0e:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1a14:	2200           	move.l d0,d1
    1a16:	243c 0000 3e87 	move.l #16007,d2
    1a1c:	7621           	moveq #33,d3
    1a1e:	4eae ffd0      	jsr -48(a6)
    1a22:	2079 0000 66d4 	movea.l 66d4 <Copperlist1>,a0
    1a28:	6000 e8f2      	bra.w 31c <main+0x316>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    1a2c:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1a32:	4eae ffc4      	jsr -60(a6)
    1a36:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1a3c:	2200           	move.l d0,d1
    1a3e:	243c 0000 40da 	move.l #16602,d2
    1a44:	7636           	moveq #54,d3
    1a46:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    1a4a:	23fc 0004 0000 	move.l #262144,66c8 <DrawBuffer>
    1a50:	0000 66c8 
  ViewBuffer = (ULONG *)0x50000;
    1a54:	23fc 0005 0000 	move.l #327680,66bc <ViewBuffer>
    1a5a:	0000 66bc 
  SetBplPointers();
    1a5e:	45f9 0000 300c 	lea 300c <SetBplPointers>,a2
    1a64:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    1a66:	0cb9 0005 0000 	cmpi.l #327680,66c8 <DrawBuffer>
    1a6c:	0000 66c8 
    1a70:	6600 e80e      	bne.w 280 <main+0x27a>
    1a74:	6008           	bra.s 1a7e <main+0x1a78>
    1a76:	7600           	moveq #0,d3
    1a78:	3602           	move.w d2,d3
    1a7a:	6000 f4a0      	bra.w f1c <main+0xf16>
    1a7e:	0cb9 0004 0000 	cmpi.l #262144,66bc <ViewBuffer>
    1a84:	0000 66bc 
    1a88:	6700 e814      	beq.w 29e <main+0x298>
    Write( Output(), 
    1a8c:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1a92:	4eae ffc4      	jsr -60(a6)
    1a96:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1a9c:	2200           	move.l d0,d1
    1a9e:	243c 0000 3dd1 	move.l #15825,d2
    1aa4:	763b           	moveq #59,d3
    1aa6:	4eae ffd0      	jsr -48(a6)
    1aaa:	6000 e7f2      	bra.w 29e <main+0x298>
		Exit(0);
    1aae:	9dce           	suba.l a6,a6
    1ab0:	7200           	moveq #0,d1
    1ab2:	4eae ff70      	jsr -144(a6)
    1ab6:	6000 e59c      	bra.w 54 <main+0x4e>
		Exit(0);
    1aba:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1ac0:	7200           	moveq #0,d1
    1ac2:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    1ac6:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    1acc:	43f9 0000 3d96 	lea 3d96 <rundemo.c.d99b7c69+0xfd>,a1
    1ad2:	7000           	moveq #0,d0
    1ad4:	4eae fdd8      	jsr -552(a6)
    1ad8:	23c0 0000 66d8 	move.l d0,66d8 <DOSBase>
	if (!DOSBase)
    1ade:	6600 e574      	bne.w 54 <main+0x4e>
    1ae2:	60ca           	bra.s 1aae <main+0x1aa8>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    1ae4:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1aea:	4eae ffc4      	jsr -60(a6)
    1aee:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1af4:	2200           	move.l d0,d1
    1af6:	243c 0000 4360 	move.l #17248,d2
    1afc:	7635           	moveq #53,d3
    1afe:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    1b02:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    1b08:	203c 0000 3740 	move.l #14144,d0
    1b0e:	7202           	moveq #2,d1
    1b10:	4eae ff3a      	jsr -198(a6)
    1b14:	2440           	movea.l d0,a2
  if( source == 0) {
    1b16:	4a80           	tst.l d0
    1b18:	6600 f2d6      	bne.w df0 <main+0xdea>
    Write(  Output(), 
    1b1c:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1b22:	4eae ffc4      	jsr -60(a6)
    1b26:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1b2c:	2200           	move.l d0,d1
    1b2e:	243c 0000 43d7 	move.l #17367,d2
    1b34:	7639           	moveq #57,d3
    1b36:	4eae ffd0      	jsr -48(a6)
    return;
    1b3a:	6000 fb8a      	bra.w 16c6 <main+0x16c0>
    Write(  Output(), 
    1b3e:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1b44:	4eae ffc4      	jsr -60(a6)
    1b48:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1b4e:	2200           	move.l d0,d1
    1b50:	243c 0000 41da 	move.l #16858,d2
    1b56:	7636           	moveq #54,d3
    1b58:	4eae ffd0      	jsr -48(a6)
  PrepareDisplayZoom();
    1b5c:	4e93           	jsr (a3)
  UWORD *destination = (UWORD *)DrawBuffer;
    1b5e:	2079 0000 66c8 	movea.l 66c8 <DrawBuffer>,a0
  *destination= 0x0000;
    1b64:	4250           	clr.w (a0)
  *destination= 0x000f;
    1b66:	317c 000f 0030 	move.w #15,48(a0)
  *destination = 0x000f;
    1b6c:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    1b72:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    1b78:	203c 0000 c800 	move.l #51200,d0
    1b7e:	7202           	moveq #2,d1
    1b80:	4eae ff3a      	jsr -198(a6)
    1b84:	2440           	movea.l d0,a2
    1b86:	23c0 0000 6698 	move.l d0,6698 <Zoom_Source>
  if( Zoom_Source == 0) {
    1b8c:	6600 ede6      	bne.w 974 <main+0x96e>
    Write(  Output(), 
    1b90:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1b96:	4eae ffc4      	jsr -60(a6)
    1b9a:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1ba0:	2200           	move.l d0,d1
    1ba2:	243c 0000 41da 	move.l #16858,d2
    1ba8:	7636           	moveq #54,d3
    1baa:	4eae ffd0      	jsr -48(a6)
    return;
    1bae:	6000 efde      	bra.w b8e <main+0xb88>
	APTR vbr = 0;
    1bb2:	7000           	moveq #0,d0
	VBR=GetVBR();
    1bb4:	23c0 0000 66a6 	move.l d0,66a6 <VBR.lto_priv.8>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    1bba:	2079 0000 66a6 	movea.l 66a6 <VBR.lto_priv.8>,a0
    1bc0:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    1bc4:	23c2 0000 66aa 	move.l d2,66aa <SystemIrq>
	WaitVbl();
    1bca:	4e92           	jsr (a2)
	WaitVbl();
    1bcc:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1bce:	2079 0000 66ae 	movea.l 66ae <hw>,a0
    1bd4:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1bd8:	6000 fd38      	bra.w 1912 <main+0x190c>
    Write(  Output(), 
    1bdc:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1be2:	4eae ffc4      	jsr -60(a6)
    1be6:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1bec:	2200           	move.l d0,d1
    1bee:	243c 0000 4411 	move.l #17425,d2
    1bf4:	763d           	moveq #61,d3
    1bf6:	4eae ffd0      	jsr -48(a6)
    return;
    1bfa:	6000 faca      	bra.w 16c6 <main+0x16c0>
    1bfe:	4e71           	nop

00001c00 <WriteFont.constprop.7>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    1c00:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    1c04:	206f 0008      	movea.l 8(sp),a0
    1c08:	1010           	move.b (a0),d0
    1c0a:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    1c0e:	4880           	ext.w d0
    1c10:	48c0           	ext.l d0
    1c12:	e788           	lsl.l #3,d0
  fntptr += charpos;
    1c14:	4880           	ext.w d0
    1c16:	3040           	movea.w d0,a0
    1c18:	d1c8           	adda.l a0,a0
    1c1a:	d1fc 0000 6658 	adda.l #26200,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    1c20:	3290           	move.w (a0),(a1)
    1c22:	3368 0002 0050 	move.w 2(a0),80(a1)
    1c28:	3368 0004 00a0 	move.w 4(a0),160(a1)
    1c2e:	3368 0006 00f0 	move.w 6(a0),240(a1)
    1c34:	3368 0008 0140 	move.w 8(a0),320(a1)
    1c3a:	3368 000a 0190 	move.w 10(a0),400(a1)
    1c40:	3368 000c 01e0 	move.w 12(a0),480(a1)
    1c46:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    1c4c:	4e75           	rts

00001c4e <warpmode.part.0>:
void warpmode(int on) 
    1c4e:	598f           	subq.l #4,sp
    1c50:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    1c52:	4aaf 000c      	tst.l 12(sp)
    1c56:	674c           	beq.s 1ca4 <warpmode.part.0+0x56>
    1c58:	4878 0001      	pea 1 <_start+0x1>
    1c5c:	740b           	moveq #11,d2
    1c5e:	d48f           	add.l sp,d2
    1c60:	2f02           	move.l d2,-(sp)
    1c62:	42a7           	clr.l -(sp)
    1c64:	4879 0000 3ca6 	pea 3ca6 <rundemo.c.d99b7c69+0xd>
    1c6a:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdccde>
    1c6e:	4878 0052      	pea 52 <main+0x4c>
    1c72:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecc3f>
    1c78:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1c7c:	203c 0000 3c8c 	move.l #15500,d0
    1c82:	4878 0001      	pea 1 <_start+0x1>
    1c86:	2f02           	move.l d2,-(sp)
    1c88:	42a7           	clr.l -(sp)
    1c8a:	2f00           	move.l d0,-(sp)
    1c8c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdccde>
    1c90:	4878 0052      	pea 52 <main+0x4c>
    1c94:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecc3f>
	}
}
    1c9a:	4fef 0018      	lea 24(sp),sp
    1c9e:	241f           	move.l (sp)+,d2
    1ca0:	588f           	addq.l #4,sp
    1ca2:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    1ca4:	4878 0001      	pea 1 <_start+0x1>
    1ca8:	740b           	moveq #11,d2
    1caa:	d48f           	add.l sp,d2
    1cac:	2f02           	move.l d2,-(sp)
    1cae:	42a7           	clr.l -(sp)
    1cb0:	4879 0000 3cb0 	pea 3cb0 <rundemo.c.d99b7c69+0x17>
    1cb6:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdccde>
    1cba:	4878 0052      	pea 52 <main+0x4c>
    1cbe:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecc3f>
    1cc4:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1cc8:	203c 0000 3c73 	move.l #15475,d0
    1cce:	4878 0001      	pea 1 <_start+0x1>
    1cd2:	2f02           	move.l d2,-(sp)
    1cd4:	42a7           	clr.l -(sp)
    1cd6:	2f00           	move.l d0,-(sp)
    1cd8:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdccde>
    1cdc:	4878 0052      	pea 52 <main+0x4c>
    1ce0:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecc3f>
}
    1ce6:	4fef 0018      	lea 24(sp),sp
    1cea:	241f           	move.l (sp)+,d2
    1cec:	588f           	addq.l #4,sp
    1cee:	4e75           	rts

00001cf0 <KPrintF>:
{
    1cf0:	4fef ff80      	lea -128(sp),sp
    1cf4:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    1cf8:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeecc3f>
    1cfe:	6734           	beq.s 1d34 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    1d00:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    1d06:	206f 0090      	movea.l 144(sp),a0
    1d0a:	43ef 0094      	lea 148(sp),a1
    1d0e:	45f9 0000 34ac 	lea 34ac <PutChar>,a2
    1d14:	47ef 000c      	lea 12(sp),a3
    1d18:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    1d1c:	2f0b           	move.l a3,-(sp)
    1d1e:	4878 0056      	pea 56 <main+0x50>
    1d22:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecc3f>
    1d28:	508f           	addq.l #8,sp
}
    1d2a:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1d2e:	4fef 0080      	lea 128(sp),sp
    1d32:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    1d34:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    1d3a:	206f 0090      	movea.l 144(sp),a0
    1d3e:	43ef 0094      	lea 148(sp),a1
    1d42:	45f9 0000 349e 	lea 349e <KPutCharX>,a2
    1d48:	97cb           	suba.l a3,a3
    1d4a:	4eae fdf6      	jsr -522(a6)
}
    1d4e:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1d52:	4fef 0080      	lea 128(sp),sp
    1d56:	4e75           	rts

00001d58 <TestRow.constprop.6>:
  valactual += ZMLINESIZE/2; 
 
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1d58:	4fef ff94      	lea -108(sp),sp
    1d5c:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1d60:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    1d66:	3c2f 002e      	move.w 46(sp),d6
                                                             int numberofline) {    
  
  char str[ 100] = { 0 };
    1d6a:	7a34           	moveq #52,d5
    1d6c:	da8f           	add.l sp,d5
    1d6e:	4878 0064      	pea 64 <main+0x5e>
    1d72:	42a7           	clr.l -(sp)
    1d74:	2f05           	move.l d5,-(sp)
    1d76:	4eba 1548      	jsr 32c0 <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
    1d7a:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1d80:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
    1d84:	2a6f 009c      	movea.l 156(sp),a5

  for(int i=0;i<21;i++) {
    1d88:	7800           	moveq #0,d4
  testpattern += 0;
    1d8a:	49f9 0000 662c 	lea 662c <destlinezoom5>,a4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1d90:	2e3c 0000 3cbb 	move.l #15547,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    1d96:	301c           	move.w (a4)+,d0
    1d98:	bd40           	eor.w d6,d0
    1d9a:	b05d           	cmp.w (a5)+,d0
    1d9c:	6736           	beq.s 1dd4 <TestRow.constprop.6+0x7c>
      data[0] = i;
    1d9e:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1da2:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    1da8:	2047           	movea.l d7,a0
    1daa:	43ef 0030      	lea 48(sp),a1
    1dae:	45f9 0000 34ac 	lea 34ac <PutChar>,a2
    1db4:	2645           	movea.l d5,a3
    1db6:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    1dba:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1dc0:	4eae ffc4      	jsr -60(a6)
    1dc4:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1dca:	2200           	move.l d0,d1
    1dcc:	2405           	move.l d5,d2
    1dce:	7664           	moveq #100,d3
    1dd0:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    1dd4:	5284           	addq.l #1,d4
    1dd6:	b9fc 0000 6656 	cmpa.l #26198,a4
    1ddc:	66b8           	bne.s 1d96 <TestRow.constprop.6+0x3e>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1dde:	3039 0000 6656 	move.w 6656 <destlinezoom5+0x2a>,d0
    1de4:	322f 002e      	move.w 46(sp),d1
    1de8:	b340           	eor.w d1,d0
    1dea:	206f 009c      	movea.l 156(sp),a0
    1dee:	3228 002a      	move.w 42(a0),d1
    1df2:	b340           	eor.w d1,d0
    1df4:	0240 ff00      	andi.w #-256,d0
    1df8:	660a           	bne.s 1e04 <TestRow.constprop.6+0xac>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
    1dfa:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1dfe:	4fef 006c      	lea 108(sp),sp
    1e02:	4e75           	rts
    data[0] = 21;
    1e04:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    1e0a:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    1e10:	41f9 0000 3cbb 	lea 3cbb <rundemo.c.d99b7c69+0x22>,a0
    1e16:	43ef 0030      	lea 48(sp),a1
    1e1a:	45f9 0000 34ac 	lea 34ac <PutChar>,a2
    1e20:	47ef 0034      	lea 52(sp),a3
    1e24:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1e28:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1e2e:	4eae ffc4      	jsr -60(a6)
    1e32:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1e38:	2200           	move.l d0,d1
    1e3a:	240b           	move.l a3,d2
    1e3c:	7664           	moveq #100,d3
    1e3e:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1e42:	206f 009c      	movea.l 156(sp),a0
    1e46:	7000           	moveq #0,d0
    1e48:	3028 002a      	move.w 42(a0),d0
    1e4c:	2f00           	move.l d0,-(sp)
    1e4e:	3039 0000 6656 	move.w 6656 <destlinezoom5+0x2a>,d0
    1e54:	2f00           	move.l d0,-(sp)
    1e56:	4879 0000 3ceb 	pea 3ceb <rundemo.c.d99b7c69+0x52>
    1e5c:	4eba fe92      	jsr 1cf0 <KPrintF>(pc)
    1e60:	4fef 000c      	lea 12(sp),sp
}
    1e64:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1e68:	4fef 006c      	lea 108(sp),sp
    1e6c:	4e75           	rts

00001e6e <TestRow.constprop.5>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1e6e:	4fef ff94      	lea -108(sp),sp
    1e72:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1e76:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    1e7c:	3c2f 002e      	move.w 46(sp),d6
  char str[ 100] = { 0 };
    1e80:	7a34           	moveq #52,d5
    1e82:	da8f           	add.l sp,d5
    1e84:	4878 0064      	pea 64 <main+0x5e>
    1e88:	42a7           	clr.l -(sp)
    1e8a:	2f05           	move.l d5,-(sp)
    1e8c:	4eba 1432      	jsr 32c0 <memset>(pc)
  data[1] = numberofline;
    1e90:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1e96:	4fef 000c      	lea 12(sp),sp
  destination += 0;
    1e9a:	2a6f 009c      	movea.l 156(sp),a5
  for(int i=0;i<21;i++) {
    1e9e:	7800           	moveq #0,d4
  testpattern += 0;
    1ea0:	49f9 0000 6600 	lea 6600 <destlinezoom4>,a4
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1ea6:	2e3c 0000 3cbb 	move.l #15547,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    1eac:	301c           	move.w (a4)+,d0
    1eae:	bd40           	eor.w d6,d0
    1eb0:	b05d           	cmp.w (a5)+,d0
    1eb2:	6736           	beq.s 1eea <TestRow.constprop.5+0x7c>
      data[0] = i;
    1eb4:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1eb8:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    1ebe:	2047           	movea.l d7,a0
    1ec0:	43ef 0030      	lea 48(sp),a1
    1ec4:	45f9 0000 34ac 	lea 34ac <PutChar>,a2
    1eca:	2645           	movea.l d5,a3
    1ecc:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1ed0:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1ed6:	4eae ffc4      	jsr -60(a6)
    1eda:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1ee0:	2200           	move.l d0,d1
    1ee2:	2405           	move.l d5,d2
    1ee4:	7664           	moveq #100,d3
    1ee6:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    1eea:	5284           	addq.l #1,d4
    1eec:	b9fc 0000 662a 	cmpa.l #26154,a4
    1ef2:	66b8           	bne.s 1eac <TestRow.constprop.5+0x3e>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1ef4:	3039 0000 662a 	move.w 662a <destlinezoom4+0x2a>,d0
    1efa:	322f 002e      	move.w 46(sp),d1
    1efe:	b340           	eor.w d1,d0
    1f00:	206f 009c      	movea.l 156(sp),a0
    1f04:	3228 002a      	move.w 42(a0),d1
    1f08:	b340           	eor.w d1,d0
    1f0a:	0240 ff00      	andi.w #-256,d0
    1f0e:	660a           	bne.s 1f1a <TestRow.constprop.5+0xac>
}
    1f10:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1f14:	4fef 006c      	lea 108(sp),sp
    1f18:	4e75           	rts
    data[0] = 21;
    1f1a:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    1f20:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    1f26:	41f9 0000 3cbb 	lea 3cbb <rundemo.c.d99b7c69+0x22>,a0
    1f2c:	43ef 0030      	lea 48(sp),a1
    1f30:	45f9 0000 34ac 	lea 34ac <PutChar>,a2
    1f36:	47ef 0034      	lea 52(sp),a3
    1f3a:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1f3e:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1f44:	4eae ffc4      	jsr -60(a6)
    1f48:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1f4e:	2200           	move.l d0,d1
    1f50:	240b           	move.l a3,d2
    1f52:	7664           	moveq #100,d3
    1f54:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1f58:	206f 009c      	movea.l 156(sp),a0
    1f5c:	7000           	moveq #0,d0
    1f5e:	3028 002a      	move.w 42(a0),d0
    1f62:	2f00           	move.l d0,-(sp)
    1f64:	3039 0000 662a 	move.w 662a <destlinezoom4+0x2a>,d0
    1f6a:	2f00           	move.l d0,-(sp)
    1f6c:	4879 0000 3ceb 	pea 3ceb <rundemo.c.d99b7c69+0x52>
    1f72:	4eba fd7c      	jsr 1cf0 <KPrintF>(pc)
    1f76:	4fef 000c      	lea 12(sp),sp
}
    1f7a:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1f7e:	4fef 006c      	lea 108(sp),sp
    1f82:	4e75           	rts

00001f84 <TestRow.constprop.4>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1f84:	4fef ff94      	lea -108(sp),sp
    1f88:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1f8c:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    1f92:	3c2f 002e      	move.w 46(sp),d6
  char str[ 100] = { 0 };
    1f96:	7a34           	moveq #52,d5
    1f98:	da8f           	add.l sp,d5
    1f9a:	4878 0064      	pea 64 <main+0x5e>
    1f9e:	42a7           	clr.l -(sp)
    1fa0:	2f05           	move.l d5,-(sp)
    1fa2:	4eba 131c      	jsr 32c0 <memset>(pc)
  data[1] = numberofline;
    1fa6:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1fac:	4fef 000c      	lea 12(sp),sp
  destination += 0;
    1fb0:	2a6f 009c      	movea.l 156(sp),a5
  for(int i=0;i<21;i++) {
    1fb4:	7800           	moveq #0,d4
  testpattern += 0;
    1fb6:	49f9 0000 65d4 	lea 65d4 <destlinezoom3>,a4
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1fbc:	2e3c 0000 3cbb 	move.l #15547,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    1fc2:	301c           	move.w (a4)+,d0
    1fc4:	bd40           	eor.w d6,d0
    1fc6:	b05d           	cmp.w (a5)+,d0
    1fc8:	6736           	beq.s 2000 <TestRow.constprop.4+0x7c>
      data[0] = i;
    1fca:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1fce:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    1fd4:	2047           	movea.l d7,a0
    1fd6:	43ef 0030      	lea 48(sp),a1
    1fda:	45f9 0000 34ac 	lea 34ac <PutChar>,a2
    1fe0:	2645           	movea.l d5,a3
    1fe2:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1fe6:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1fec:	4eae ffc4      	jsr -60(a6)
    1ff0:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    1ff6:	2200           	move.l d0,d1
    1ff8:	2405           	move.l d5,d2
    1ffa:	7664           	moveq #100,d3
    1ffc:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    2000:	5284           	addq.l #1,d4
    2002:	b9fc 0000 65fe 	cmpa.l #26110,a4
    2008:	66b8           	bne.s 1fc2 <TestRow.constprop.4+0x3e>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    200a:	3039 0000 65fe 	move.w 65fe <destlinezoom3+0x2a>,d0
    2010:	322f 002e      	move.w 46(sp),d1
    2014:	b340           	eor.w d1,d0
    2016:	206f 009c      	movea.l 156(sp),a0
    201a:	3228 002a      	move.w 42(a0),d1
    201e:	b340           	eor.w d1,d0
    2020:	0240 ff00      	andi.w #-256,d0
    2024:	660a           	bne.s 2030 <TestRow.constprop.4+0xac>
}
    2026:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    202a:	4fef 006c      	lea 108(sp),sp
    202e:	4e75           	rts
    data[0] = 21;
    2030:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    2036:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    203c:	41f9 0000 3cbb 	lea 3cbb <rundemo.c.d99b7c69+0x22>,a0
    2042:	43ef 0030      	lea 48(sp),a1
    2046:	45f9 0000 34ac 	lea 34ac <PutChar>,a2
    204c:	47ef 0034      	lea 52(sp),a3
    2050:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    2054:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    205a:	4eae ffc4      	jsr -60(a6)
    205e:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2064:	2200           	move.l d0,d1
    2066:	240b           	move.l a3,d2
    2068:	7664           	moveq #100,d3
    206a:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    206e:	206f 009c      	movea.l 156(sp),a0
    2072:	7000           	moveq #0,d0
    2074:	3028 002a      	move.w 42(a0),d0
    2078:	2f00           	move.l d0,-(sp)
    207a:	3039 0000 65fe 	move.w 65fe <destlinezoom3+0x2a>,d0
    2080:	2f00           	move.l d0,-(sp)
    2082:	4879 0000 3ceb 	pea 3ceb <rundemo.c.d99b7c69+0x52>
    2088:	4eba fc66      	jsr 1cf0 <KPrintF>(pc)
    208c:	4fef 000c      	lea 12(sp),sp
}
    2090:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    2094:	4fef 006c      	lea 108(sp),sp
    2098:	4e75           	rts

0000209a <TestRow.constprop.3>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    209a:	4fef ff94      	lea -108(sp),sp
    209e:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    20a2:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    20a8:	3c2f 002e      	move.w 46(sp),d6
  char str[ 100] = { 0 };
    20ac:	7a34           	moveq #52,d5
    20ae:	da8f           	add.l sp,d5
    20b0:	4878 0064      	pea 64 <main+0x5e>
    20b4:	42a7           	clr.l -(sp)
    20b6:	2f05           	move.l d5,-(sp)
    20b8:	4eba 1206      	jsr 32c0 <memset>(pc)
  data[1] = numberofline;
    20bc:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    20c2:	4fef 000c      	lea 12(sp),sp
  destination += 0;
    20c6:	2a6f 009c      	movea.l 156(sp),a5
  for(int i=0;i<21;i++) {
    20ca:	7800           	moveq #0,d4
  testpattern += 0;
    20cc:	49f9 0000 65a8 	lea 65a8 <destlinezoom2>,a4
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    20d2:	2e3c 0000 3cbb 	move.l #15547,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    20d8:	301c           	move.w (a4)+,d0
    20da:	bd40           	eor.w d6,d0
    20dc:	b05d           	cmp.w (a5)+,d0
    20de:	6736           	beq.s 2116 <TestRow.constprop.3+0x7c>
      data[0] = i;
    20e0:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    20e4:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    20ea:	2047           	movea.l d7,a0
    20ec:	43ef 0030      	lea 48(sp),a1
    20f0:	45f9 0000 34ac 	lea 34ac <PutChar>,a2
    20f6:	2645           	movea.l d5,a3
    20f8:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    20fc:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2102:	4eae ffc4      	jsr -60(a6)
    2106:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    210c:	2200           	move.l d0,d1
    210e:	2405           	move.l d5,d2
    2110:	7664           	moveq #100,d3
    2112:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    2116:	5284           	addq.l #1,d4
    2118:	b9fc 0000 65d2 	cmpa.l #26066,a4
    211e:	66b8           	bne.s 20d8 <TestRow.constprop.3+0x3e>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    2120:	3039 0000 65d2 	move.w 65d2 <destlinezoom2+0x2a>,d0
    2126:	322f 002e      	move.w 46(sp),d1
    212a:	b340           	eor.w d1,d0
    212c:	206f 009c      	movea.l 156(sp),a0
    2130:	3228 002a      	move.w 42(a0),d1
    2134:	b340           	eor.w d1,d0
    2136:	0240 ff00      	andi.w #-256,d0
    213a:	660a           	bne.s 2146 <TestRow.constprop.3+0xac>
}
    213c:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    2140:	4fef 006c      	lea 108(sp),sp
    2144:	4e75           	rts
    data[0] = 21;
    2146:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    214c:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    2152:	41f9 0000 3cbb 	lea 3cbb <rundemo.c.d99b7c69+0x22>,a0
    2158:	43ef 0030      	lea 48(sp),a1
    215c:	45f9 0000 34ac 	lea 34ac <PutChar>,a2
    2162:	47ef 0034      	lea 52(sp),a3
    2166:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    216a:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2170:	4eae ffc4      	jsr -60(a6)
    2174:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    217a:	2200           	move.l d0,d1
    217c:	240b           	move.l a3,d2
    217e:	7664           	moveq #100,d3
    2180:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    2184:	206f 009c      	movea.l 156(sp),a0
    2188:	7000           	moveq #0,d0
    218a:	3028 002a      	move.w 42(a0),d0
    218e:	2f00           	move.l d0,-(sp)
    2190:	3039 0000 65d2 	move.w 65d2 <destlinezoom2+0x2a>,d0
    2196:	2f00           	move.l d0,-(sp)
    2198:	4879 0000 3ceb 	pea 3ceb <rundemo.c.d99b7c69+0x52>
    219e:	4eba fb50      	jsr 1cf0 <KPrintF>(pc)
    21a2:	4fef 000c      	lea 12(sp),sp
}
    21a6:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    21aa:	4fef 006c      	lea 108(sp),sp
    21ae:	4e75           	rts

000021b0 <TestRow.constprop.2>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    21b0:	4fef ff94      	lea -108(sp),sp
    21b4:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    21b8:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    21be:	3c2f 002e      	move.w 46(sp),d6
  char str[ 100] = { 0 };
    21c2:	7a34           	moveq #52,d5
    21c4:	da8f           	add.l sp,d5
    21c6:	4878 0064      	pea 64 <main+0x5e>
    21ca:	42a7           	clr.l -(sp)
    21cc:	2f05           	move.l d5,-(sp)
    21ce:	4eba 10f0      	jsr 32c0 <memset>(pc)
  data[1] = numberofline;
    21d2:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    21d8:	4fef 000c      	lea 12(sp),sp
  destination += 0;
    21dc:	2a6f 009c      	movea.l 156(sp),a5
  for(int i=0;i<21;i++) {
    21e0:	7800           	moveq #0,d4
  testpattern += 0;
    21e2:	49f9 0000 657c 	lea 657c <destlinezoom1>,a4
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    21e8:	2e3c 0000 3cbb 	move.l #15547,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    21ee:	301c           	move.w (a4)+,d0
    21f0:	bd40           	eor.w d6,d0
    21f2:	b05d           	cmp.w (a5)+,d0
    21f4:	6736           	beq.s 222c <TestRow.constprop.2+0x7c>
      data[0] = i;
    21f6:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    21fa:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    2200:	2047           	movea.l d7,a0
    2202:	43ef 0030      	lea 48(sp),a1
    2206:	45f9 0000 34ac 	lea 34ac <PutChar>,a2
    220c:	2645           	movea.l d5,a3
    220e:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    2212:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2218:	4eae ffc4      	jsr -60(a6)
    221c:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2222:	2200           	move.l d0,d1
    2224:	2405           	move.l d5,d2
    2226:	7664           	moveq #100,d3
    2228:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    222c:	5284           	addq.l #1,d4
    222e:	b9fc 0000 65a6 	cmpa.l #26022,a4
    2234:	66b8           	bne.s 21ee <TestRow.constprop.2+0x3e>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    2236:	3039 0000 65a6 	move.w 65a6 <destlinezoom1+0x2a>,d0
    223c:	322f 002e      	move.w 46(sp),d1
    2240:	b340           	eor.w d1,d0
    2242:	206f 009c      	movea.l 156(sp),a0
    2246:	3228 002a      	move.w 42(a0),d1
    224a:	b340           	eor.w d1,d0
    224c:	0240 ff00      	andi.w #-256,d0
    2250:	660a           	bne.s 225c <TestRow.constprop.2+0xac>
}
    2252:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    2256:	4fef 006c      	lea 108(sp),sp
    225a:	4e75           	rts
    data[0] = 21;
    225c:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    2262:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    2268:	41f9 0000 3cbb 	lea 3cbb <rundemo.c.d99b7c69+0x22>,a0
    226e:	43ef 0030      	lea 48(sp),a1
    2272:	45f9 0000 34ac 	lea 34ac <PutChar>,a2
    2278:	47ef 0034      	lea 52(sp),a3
    227c:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    2280:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2286:	4eae ffc4      	jsr -60(a6)
    228a:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2290:	2200           	move.l d0,d1
    2292:	240b           	move.l a3,d2
    2294:	7664           	moveq #100,d3
    2296:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    229a:	206f 009c      	movea.l 156(sp),a0
    229e:	7000           	moveq #0,d0
    22a0:	3028 002a      	move.w 42(a0),d0
    22a4:	2f00           	move.l d0,-(sp)
    22a6:	3039 0000 65a6 	move.w 65a6 <destlinezoom1+0x2a>,d0
    22ac:	2f00           	move.l d0,-(sp)
    22ae:	4879 0000 3ceb 	pea 3ceb <rundemo.c.d99b7c69+0x52>
    22b4:	4eba fa3a      	jsr 1cf0 <KPrintF>(pc)
    22b8:	4fef 000c      	lea 12(sp),sp
}
    22bc:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    22c0:	4fef 006c      	lea 108(sp),sp
    22c4:	4e75           	rts

000022c6 <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    22c6:	202f 0008      	move.l 8(sp),d0
    22ca:	d080           	add.l d0,d0
    22cc:	d080           	add.l d0,d0
    22ce:	206f 0004      	movea.l 4(sp),a0
    22d2:	2030 0800      	move.l (0,a0,d0.l),d0
    22d6:	b0af 000c      	cmp.l 12(sp),d0
    22da:	57c0           	seq d0
    22dc:	4880           	ext.w d0
    22de:	48c0           	ext.l d0
}
    22e0:	4480           	neg.l d0
    22e2:	4e75           	rts

000022e4 <TestCopperlistBatch>:
                                                                  long length) {
    22e4:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    22e8:	246f 0010      	movea.l 16(sp),a2
    22ec:	206f 0014      	movea.l 20(sp),a0
    22f0:	226f 0018      	movea.l 24(sp),a1
    22f4:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    22f8:	2008           	move.l a0,d0
    22fa:	d088           	add.l a0,d0
    22fc:	d080           	add.l d0,d0
    22fe:	2411           	move.l (a1),d2
    2300:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    2304:	6600 01ac      	bne.w 24b2 <TestCopperlistBatch+0x1ce>
    2308:	2008           	move.l a0,d0
    230a:	5280           	addq.l #1,d0
    230c:	d080           	add.l d0,d0
    230e:	d080           	add.l d0,d0
    2310:	2032 0800      	move.l (0,a2,d0.l),d0
    2314:	b0a9 0004      	cmp.l 4(a1),d0
    2318:	6600 0198      	bne.w 24b2 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    231c:	7002           	moveq #2,d0
    231e:	b081           	cmp.l d1,d0
    2320:	6700 0188      	beq.w 24aa <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2324:	2008           	move.l a0,d0
    2326:	5480           	addq.l #2,d0
    2328:	d080           	add.l d0,d0
    232a:	d080           	add.l d0,d0
    232c:	2032 0800      	move.l (0,a2,d0.l),d0
    2330:	b0a9 0008      	cmp.l 8(a1),d0
    2334:	6600 017c      	bne.w 24b2 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2338:	7403           	moveq #3,d2
    233a:	b481           	cmp.l d1,d2
    233c:	6700 016c      	beq.w 24aa <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2340:	2008           	move.l a0,d0
    2342:	5680           	addq.l #3,d0
    2344:	d080           	add.l d0,d0
    2346:	d080           	add.l d0,d0
    2348:	2032 0800      	move.l (0,a2,d0.l),d0
    234c:	b0a9 000c      	cmp.l 12(a1),d0
    2350:	6600 0160      	bne.w 24b2 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2354:	7004           	moveq #4,d0
    2356:	b081           	cmp.l d1,d0
    2358:	6700 0150      	beq.w 24aa <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    235c:	2008           	move.l a0,d0
    235e:	5880           	addq.l #4,d0
    2360:	d080           	add.l d0,d0
    2362:	d080           	add.l d0,d0
    2364:	2032 0800      	move.l (0,a2,d0.l),d0
    2368:	b0a9 0010      	cmp.l 16(a1),d0
    236c:	6600 0144      	bne.w 24b2 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2370:	7405           	moveq #5,d2
    2372:	b481           	cmp.l d1,d2
    2374:	6700 0134      	beq.w 24aa <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2378:	2008           	move.l a0,d0
    237a:	5a80           	addq.l #5,d0
    237c:	d080           	add.l d0,d0
    237e:	d080           	add.l d0,d0
    2380:	2032 0800      	move.l (0,a2,d0.l),d0
    2384:	b0a9 0014      	cmp.l 20(a1),d0
    2388:	6600 0128      	bne.w 24b2 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    238c:	7006           	moveq #6,d0
    238e:	b081           	cmp.l d1,d0
    2390:	6700 0118      	beq.w 24aa <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2394:	2008           	move.l a0,d0
    2396:	5c80           	addq.l #6,d0
    2398:	d080           	add.l d0,d0
    239a:	d080           	add.l d0,d0
    239c:	2032 0800      	move.l (0,a2,d0.l),d0
    23a0:	b0a9 0018      	cmp.l 24(a1),d0
    23a4:	6600 010c      	bne.w 24b2 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    23a8:	7407           	moveq #7,d2
    23aa:	b481           	cmp.l d1,d2
    23ac:	6700 00fc      	beq.w 24aa <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    23b0:	2008           	move.l a0,d0
    23b2:	5e80           	addq.l #7,d0
    23b4:	d080           	add.l d0,d0
    23b6:	d080           	add.l d0,d0
    23b8:	2032 0800      	move.l (0,a2,d0.l),d0
    23bc:	b0a9 001c      	cmp.l 28(a1),d0
    23c0:	6600 00f0      	bne.w 24b2 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    23c4:	7008           	moveq #8,d0
    23c6:	b081           	cmp.l d1,d0
    23c8:	6700 00e0      	beq.w 24aa <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    23cc:	2008           	move.l a0,d0
    23ce:	5080           	addq.l #8,d0
    23d0:	d080           	add.l d0,d0
    23d2:	d080           	add.l d0,d0
    23d4:	2032 0800      	move.l (0,a2,d0.l),d0
    23d8:	b0a9 0020      	cmp.l 32(a1),d0
    23dc:	6600 00d4      	bne.w 24b2 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    23e0:	7409           	moveq #9,d2
    23e2:	b481           	cmp.l d1,d2
    23e4:	6700 00c4      	beq.w 24aa <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    23e8:	47e8 0009      	lea 9(a0),a3
    23ec:	200b           	move.l a3,d0
    23ee:	d08b           	add.l a3,d0
    23f0:	d080           	add.l d0,d0
    23f2:	2032 0800      	move.l (0,a2,d0.l),d0
    23f6:	b0a9 0024      	cmp.l 36(a1),d0
    23fa:	6600 00b6      	bne.w 24b2 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    23fe:	700a           	moveq #10,d0
    2400:	b081           	cmp.l d1,d0
    2402:	6700 00a6      	beq.w 24aa <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2406:	47e8 000a      	lea 10(a0),a3
    240a:	200b           	move.l a3,d0
    240c:	d08b           	add.l a3,d0
    240e:	d080           	add.l d0,d0
    2410:	2032 0800      	move.l (0,a2,d0.l),d0
    2414:	b0a9 0028      	cmp.l 40(a1),d0
    2418:	6600 0098      	bne.w 24b2 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    241c:	740b           	moveq #11,d2
    241e:	b481           	cmp.l d1,d2
    2420:	6700 0088      	beq.w 24aa <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2424:	47e8 000b      	lea 11(a0),a3
    2428:	200b           	move.l a3,d0
    242a:	d08b           	add.l a3,d0
    242c:	d080           	add.l d0,d0
    242e:	2032 0800      	move.l (0,a2,d0.l),d0
    2432:	b0a9 002c      	cmp.l 44(a1),d0
    2436:	667a           	bne.s 24b2 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2438:	700c           	moveq #12,d0
    243a:	b081           	cmp.l d1,d0
    243c:	676c           	beq.s 24aa <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    243e:	47e8 000c      	lea 12(a0),a3
    2442:	200b           	move.l a3,d0
    2444:	d08b           	add.l a3,d0
    2446:	d080           	add.l d0,d0
    2448:	2032 0800      	move.l (0,a2,d0.l),d0
    244c:	b0a9 0030      	cmp.l 48(a1),d0
    2450:	6660           	bne.s 24b2 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2452:	740d           	moveq #13,d2
    2454:	b481           	cmp.l d1,d2
    2456:	6752           	beq.s 24aa <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2458:	47e8 000d      	lea 13(a0),a3
    245c:	200b           	move.l a3,d0
    245e:	d08b           	add.l a3,d0
    2460:	d080           	add.l d0,d0
    2462:	2032 0800      	move.l (0,a2,d0.l),d0
    2466:	b0a9 0034      	cmp.l 52(a1),d0
    246a:	6646           	bne.s 24b2 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    246c:	700e           	moveq #14,d0
    246e:	b081           	cmp.l d1,d0
    2470:	6738           	beq.s 24aa <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2472:	47e8 000e      	lea 14(a0),a3
    2476:	200b           	move.l a3,d0
    2478:	d08b           	add.l a3,d0
    247a:	d080           	add.l d0,d0
    247c:	2032 0800      	move.l (0,a2,d0.l),d0
    2480:	b0a9 0038      	cmp.l 56(a1),d0
    2484:	662c           	bne.s 24b2 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2486:	7410           	moveq #16,d2
    2488:	b481           	cmp.l d1,d2
    248a:	661e           	bne.s 24aa <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    248c:	41e8 000f      	lea 15(a0),a0
    2490:	d1c8           	adda.l a0,a0
    2492:	d1c8           	adda.l a0,a0
    2494:	2070 a800      	movea.l (0,a0,a2.l),a0
    2498:	b1e9 003c      	cmpa.l 60(a1),a0
    249c:	57c0           	seq d0
    249e:	4880           	ext.w d0
    24a0:	48c0           	ext.l d0
    24a2:	4480           	neg.l d0
}
    24a4:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    24a8:	4e75           	rts
  return 1;
    24aa:	7001           	moveq #1,d0
}
    24ac:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    24b0:	4e75           	rts
      return 0;
    24b2:	7000           	moveq #0,d0
}
    24b4:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    24b8:	4e75           	rts

000024ba <ClBuild>:
ULONG * ClbuildSW() {
    24ba:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    24be:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    24c4:	707b           	moveq #123,d0
    24c6:	4600           	not.b d0
    24c8:	7202           	moveq #2,d1
    24ca:	4eae ff3a      	jsr -198(a6)
    24ce:	2440           	movea.l d0,a2
  if( retval == 0) {
    24d0:	4a80           	tst.l d0
    24d2:	6700 010e      	beq.w 25e2 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    24d6:	24b9 0000 653c 	move.l 653c <ClsSprites>,(a2)
    24dc:	2579 0000 6540 	move.l 6540 <ClsSprites+0x4>,4(a2)
    24e2:	0004 
    24e4:	2579 0000 6544 	move.l 6544 <ClsSprites+0x8>,8(a2)
    24ea:	0008 
    24ec:	2579 0000 6548 	move.l 6548 <ClsSprites+0xc>,12(a2)
    24f2:	000c 
    24f4:	2579 0000 654c 	move.l 654c <ClsSprites+0x10>,16(a2)
    24fa:	0010 
    24fc:	2579 0000 6550 	move.l 6550 <ClsSprites+0x14>,20(a2)
    2502:	0014 
    2504:	2579 0000 6554 	move.l 6554 <ClsSprites+0x18>,24(a2)
    250a:	0018 
    250c:	2579 0000 6558 	move.l 6558 <ClsSprites+0x1c>,28(a2)
    2512:	001c 
    2514:	2579 0000 655c 	move.l 655c <ClsSprites+0x20>,32(a2)
    251a:	0020 
    251c:	2579 0000 6560 	move.l 6560 <ClsSprites+0x24>,36(a2)
    2522:	0024 
    2524:	2579 0000 6564 	move.l 6564 <ClsSprites+0x28>,40(a2)
    252a:	0028 
    252c:	2579 0000 6568 	move.l 6568 <ClsSprites+0x2c>,44(a2)
    2532:	002c 
    2534:	2579 0000 656c 	move.l 656c <ClsSprites+0x30>,48(a2)
    253a:	0030 
    253c:	2579 0000 6570 	move.l 6570 <ClsSprites+0x34>,52(a2)
    2542:	0034 
    2544:	2579 0000 6574 	move.l 6574 <ClsSprites+0x38>,56(a2)
    254a:	0038 
    254c:	2579 0000 6578 	move.l 6578 <ClsSprites+0x3c>,60(a2)
    2552:	003c 
    *cl++ = *clpartinstruction++;
    2554:	2579 0000 650c 	move.l 650c <ClScreen>,64(a2)
    255a:	0040 
    255c:	2579 0000 6510 	move.l 6510 <ClScreen+0x4>,68(a2)
    2562:	0044 
    2564:	2579 0000 6514 	move.l 6514 <ClScreen+0x8>,72(a2)
    256a:	0048 
    256c:	2579 0000 6518 	move.l 6518 <ClScreen+0xc>,76(a2)
    2572:	004c 
    2574:	2579 0000 651c 	move.l 651c <ClScreen+0x10>,80(a2)
    257a:	0050 
    257c:	2579 0000 6520 	move.l 6520 <ClScreen+0x14>,84(a2)
    2582:	0054 
    2584:	2579 0000 6524 	move.l 6524 <ClScreen+0x18>,88(a2)
    258a:	0058 
    258c:	2579 0000 6528 	move.l 6528 <ClScreen+0x1c>,92(a2)
    2592:	005c 
    2594:	2579 0000 652c 	move.l 652c <ClScreen+0x20>,96(a2)
    259a:	0060 
    259c:	2579 0000 6530 	move.l 6530 <ClScreen+0x24>,100(a2)
    25a2:	0064 
    25a4:	2579 0000 6534 	move.l 6534 <ClScreen+0x28>,104(a2)
    25aa:	0068 
    25ac:	2579 0000 6538 	move.l 6538 <ClScreen+0x2c>,108(a2)
    25b2:	006c 
  *cl++ = 0x00e00000;
    25b4:	257c 00e0 0000 	move.l #14680064,112(a2)
    25ba:	0070 
  *cl++ = 0x00e20000;
    25bc:	257c 00e2 0000 	move.l #14811136,116(a2)
    25c2:	0074 
    *cl++ = *clpartinstruction++;
    25c4:	2579 0000 6504 	move.l 6504 <ClColor>,120(a2)
    25ca:	0078 
    25cc:	2579 0000 6508 	move.l 6508 <ClColor+0x4>,124(a2)
    25d2:	007c 
  *cl = 0xfffffffe;
    25d4:	70fe           	moveq #-2,d0
    25d6:	2540 0080      	move.l d0,128(a2)
}
    25da:	200a           	move.l a2,d0
    25dc:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    25e0:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    25e2:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    25e8:	4eae ffc4      	jsr -60(a6)
    25ec:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    25f2:	2200           	move.l d0,d1
    25f4:	243c 0000 3d11 	move.l #15633,d2
    25fa:	7628           	moveq #40,d3
    25fc:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2600:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2606:	7201           	moveq #1,d1
    2608:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    260c:	24b9 0000 653c 	move.l 653c <ClsSprites>,(a2)
    2612:	2579 0000 6540 	move.l 6540 <ClsSprites+0x4>,4(a2)
    2618:	0004 
    261a:	2579 0000 6544 	move.l 6544 <ClsSprites+0x8>,8(a2)
    2620:	0008 
    2622:	2579 0000 6548 	move.l 6548 <ClsSprites+0xc>,12(a2)
    2628:	000c 
    262a:	2579 0000 654c 	move.l 654c <ClsSprites+0x10>,16(a2)
    2630:	0010 
    2632:	2579 0000 6550 	move.l 6550 <ClsSprites+0x14>,20(a2)
    2638:	0014 
    263a:	2579 0000 6554 	move.l 6554 <ClsSprites+0x18>,24(a2)
    2640:	0018 
    2642:	2579 0000 6558 	move.l 6558 <ClsSprites+0x1c>,28(a2)
    2648:	001c 
    264a:	2579 0000 655c 	move.l 655c <ClsSprites+0x20>,32(a2)
    2650:	0020 
    2652:	2579 0000 6560 	move.l 6560 <ClsSprites+0x24>,36(a2)
    2658:	0024 
    265a:	2579 0000 6564 	move.l 6564 <ClsSprites+0x28>,40(a2)
    2660:	0028 
    2662:	2579 0000 6568 	move.l 6568 <ClsSprites+0x2c>,44(a2)
    2668:	002c 
    266a:	2579 0000 656c 	move.l 656c <ClsSprites+0x30>,48(a2)
    2670:	0030 
    2672:	2579 0000 6570 	move.l 6570 <ClsSprites+0x34>,52(a2)
    2678:	0034 
    267a:	2579 0000 6574 	move.l 6574 <ClsSprites+0x38>,56(a2)
    2680:	0038 
    2682:	2579 0000 6578 	move.l 6578 <ClsSprites+0x3c>,60(a2)
    2688:	003c 
    *cl++ = *clpartinstruction++;
    268a:	2579 0000 650c 	move.l 650c <ClScreen>,64(a2)
    2690:	0040 
    2692:	2579 0000 6510 	move.l 6510 <ClScreen+0x4>,68(a2)
    2698:	0044 
    269a:	2579 0000 6514 	move.l 6514 <ClScreen+0x8>,72(a2)
    26a0:	0048 
    26a2:	2579 0000 6518 	move.l 6518 <ClScreen+0xc>,76(a2)
    26a8:	004c 
    26aa:	2579 0000 651c 	move.l 651c <ClScreen+0x10>,80(a2)
    26b0:	0050 
    26b2:	2579 0000 6520 	move.l 6520 <ClScreen+0x14>,84(a2)
    26b8:	0054 
    26ba:	2579 0000 6524 	move.l 6524 <ClScreen+0x18>,88(a2)
    26c0:	0058 
    26c2:	2579 0000 6528 	move.l 6528 <ClScreen+0x1c>,92(a2)
    26c8:	005c 
    26ca:	2579 0000 652c 	move.l 652c <ClScreen+0x20>,96(a2)
    26d0:	0060 
    26d2:	2579 0000 6530 	move.l 6530 <ClScreen+0x24>,100(a2)
    26d8:	0064 
    26da:	2579 0000 6534 	move.l 6534 <ClScreen+0x28>,104(a2)
    26e0:	0068 
    26e2:	2579 0000 6538 	move.l 6538 <ClScreen+0x2c>,108(a2)
    26e8:	006c 
  *cl++ = 0x00e00000;
    26ea:	257c 00e0 0000 	move.l #14680064,112(a2)
    26f0:	0070 
  *cl++ = 0x00e20000;
    26f2:	257c 00e2 0000 	move.l #14811136,116(a2)
    26f8:	0074 
    *cl++ = *clpartinstruction++;
    26fa:	2579 0000 6504 	move.l 6504 <ClColor>,120(a2)
    2700:	0078 
    2702:	2579 0000 6508 	move.l 6508 <ClColor+0x4>,124(a2)
    2708:	007c 
  *cl = 0xfffffffe;
    270a:	70fe           	moveq #-2,d0
    270c:	2540 0080      	move.l d0,128(a2)
}
    2710:	200a           	move.l a2,d0
    2712:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2716:	4e75           	rts

00002718 <Zoom_ZoomIntoPicture>:
void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr) {
    2718:	4fef ffe4      	lea -28(sp),sp
    271c:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    2720:	222f 0054      	move.l 84(sp),d1
    2724:	3241           	movea.w d1,a1
  UWORD nextzoom = 22*16 - 20 + zoomnr * 10;
    2726:	3041           	movea.w d1,a0
    2728:	d0c1           	adda.w d1,a0
    272a:	3008           	move.w a0,d0
    272c:	d048           	add.w a0,d0
    272e:	d041           	add.w d1,d0
    2730:	d040           	add.w d0,d0
    2732:	0640 014c      	addi.w #332,d0
    2736:	3f40 003e      	move.w d0,62(sp)
  while( nextzoom > 22 * 16) {
    273a:	0c40 0160      	cmpi.w #352,d0
    273e:	6300 03a6      	bls.w 2ae6 <Zoom_ZoomIntoPicture+0x3ce>
    2742:	3400           	move.w d0,d2
    2744:	70ed           	moveq #-19,d0
    2746:	9041           	sub.w d1,d0
  WORD shiftright = 9;
    2748:	7e09           	moveq #9,d7
    nextzoom -= (19 + zoomnr);
    274a:	d440           	add.w d0,d2
    shiftright--;
    274c:	5347           	subq.w #1,d7
  while( nextzoom > 22 * 16) {
    274e:	0c42 0161      	cmpi.w #353,d2
    2752:	67f6           	beq.s 274a <Zoom_ZoomIntoPicture+0x32>
    2754:	3f42 003e      	move.w d2,62(sp)
  *bp2 = 0;
    2758:	4278 0206      	clr.w 206 <main+0x200>
  WORD ZoomHorizontalStart = 15 - zoomnr * 6;
    275c:	3008           	move.w a0,d0
    275e:	d041           	add.w d1,d0
    2760:	d040           	add.w d0,d0
    2762:	740f           	moveq #15,d2
    2764:	9440           	sub.w d0,d2
    2766:	3f42 003c      	move.w d2,60(sp)
  while( ZoomHorizontalStart < 0) {
    276a:	6c00 0392      	bge.w 2afe <Zoom_ZoomIntoPicture+0x3e6>
      ZoomHorizontalStart += 1 + 15 + zoomnr;
    276e:	3001           	move.w d1,d0
    2770:	0640 0010      	addi.w #16,d0
    2774:	d16f 003c      	add.w d0,60(sp)
    2778:	203c 8000 00be 	move.l #-2147483458,d0
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    277e:	90c1           	suba.w d1,a0
    2780:	3a48           	movea.w a0,a5
    2782:	4bed 000f      	lea 15(a5),a5
    2786:	d080           	add.l d0,d0
    2788:	d0af 004c      	add.l 76(sp),d0
    278c:	2f40 0034      	move.l d0,52(sp)
    2790:	742c           	moveq #44,d2
    2792:	d4af 0050      	add.l 80(sp),d2
    2796:	2f42 0038      	move.l d2,56(sp)
  UWORD shifttoleft = 0;
    279a:	426f 0042      	clr.w 66(sp)
  UWORD startofword = 21*16;
    279e:	3f7c 0150 002e 	move.w #336,46(sp)
      nextzoom -= (19 + zoomnr);
    27a4:	74ed           	moveq #-19,d2
    27a6:	9449           	sub.w a1,d2
    27a8:	3f42 0046      	move.w d2,70(sp)
    WORD linesleft = 272;
    27ac:	3f47 002c      	move.w d7,44(sp)
    ZoomHorizontal = ZoomHorizontalStart;
    27b0:	33ef 003c 0000 	move.w 60(sp),66b6 <ZoomHorizontal>
    27b6:	66b6 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
    27b8:	2a2f 0034      	move.l 52(sp),d5
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    27bc:	246f 0038      	movea.l 56(sp),a2
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    27c0:	7000           	moveq #0,d0
    27c2:	302f 0042      	move.w 66(sp),d0
    27c6:	d080           	add.l d0,d0
    27c8:	2f40 0030      	move.l d0,48(sp)
    27cc:	3f6f 002c 0044 	move.w 44(sp),68(sp)
    27d2:	3c2f 002c      	move.w 44(sp),d6
    27d6:	700c           	moveq #12,d0
    27d8:	e16e           	lsl.w d0,d6
    27da:	342f 003e      	move.w 62(sp),d2
    27de:	b46f 002e      	cmp.w 46(sp),d2
    27e2:	6200 0172      	bhi.w 2956 <Zoom_ZoomIntoPicture+0x23e>
  hw->bltcon0 = 0x9f0 + shiftright;
    27e6:	0646 09f0      	addi.w #2544,d6
    27ea:	342f 003c      	move.w 60(sp),d2
    WORD linesleft = 272;
    27ee:	363c 0110      	move.w #272,d3
    27f2:	2805           	move.l d5,d4
    27f4:	d8af 0030      	add.l 48(sp),d4
    27f8:	266f 0030      	movea.l 48(sp),a3
        if( linesleft >= ZoomHorizontal+1) {
    27fc:	b642           	cmp.w d2,d3
    27fe:	6f00 00c4      	ble.w 28c4 <Zoom_ZoomIntoPicture+0x1ac>
          linesleft -= ZoomHorizontal;
    2802:	9642           	sub.w d2,d3
    2804:	3e03           	move.w d3,d7
  WaitBlit();
    2806:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    280c:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    2810:	2079 0000 66ae 	movea.l 66ae <hw>,a0
    2816:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    281c:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    2820:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2826:	317c ffff 0046 	move.w #-1,70(a0)
  *bp = 0;
    282c:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltamod = ZMLINESIZE - 4;
    2830:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    2836:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    283c:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
    2840:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    2844:	ed4a           	lsl.w #6,d2
    2846:	5442           	addq.w #2,d2
    2848:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    284c:	3079 0000 66b6 	movea.w 66b6 <ZoomHorizontal>,a0
    2852:	2008           	move.l a0,d0
    2854:	d088           	add.l a0,d0
    2856:	d088           	add.l a0,d0
    2858:	e988           	lsl.l #4,d0
    285a:	da80           	add.l d0,d5
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    285c:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    285e:	4a47           	tst.w d7
    2860:	6f00 00cc      	ble.w 292e <Zoom_ZoomIntoPicture+0x216>
          Zoom_CopyWord( pos4source+shifttoleft, pos4dest, shiftright, 1);
    2864:	2805           	move.l d5,d4
    2866:	d88b           	add.l a3,d4
  WaitBlit();
    2868:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    286e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    2872:	2079 0000 66ae 	movea.l 66ae <hw>,a0
    2878:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    287e:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    2882:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2888:	317c ffff 0046 	move.w #-1,70(a0)
  *bp = 0;
    288e:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltamod = ZMLINESIZE - 4;
    2892:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    2898:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    289e:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
    28a2:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    28a6:	317c 0042 0058 	move.w #66,88(a0)
          linesleft--;
    28ac:	5343           	subq.w #1,d3
          pos4dest += ZMLINESIZE/2;
    28ae:	45ea 0030      	lea 48(a2),a2
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    28b2:	33cd 0000 66b6 	move.w a5,66b6 <ZoomHorizontal>
      while(linesleft > 0) {
    28b8:	4a43           	tst.w d3
    28ba:	6778           	beq.s 2934 <Zoom_ZoomIntoPicture+0x21c>
    28bc:	340d           	move.w a5,d2
        if( linesleft >= ZoomHorizontal+1) {
    28be:	b642           	cmp.w d2,d3
    28c0:	6e00 ff40      	bgt.w 2802 <Zoom_ZoomIntoPicture+0xea>
          ZoomHorizontal = linesleft;
    28c4:	33c3 0000 66b6 	move.w d3,66b6 <ZoomHorizontal>
    28ca:	3403           	move.w d3,d2
    28cc:	4243           	clr.w d3
          linesleft = 0;
    28ce:	4247           	clr.w d7
  WaitBlit();
    28d0:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    28d6:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    28da:	2079 0000 66ae 	movea.l 66ae <hw>,a0
    28e0:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    28e6:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    28ea:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    28f0:	317c ffff 0046 	move.w #-1,70(a0)
  *bp = 0;
    28f6:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltamod = ZMLINESIZE - 4;
    28fa:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    2900:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    2906:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
    290a:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    290e:	ed4a           	lsl.w #6,d2
    2910:	5442           	addq.w #2,d2
    2912:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    2916:	3079 0000 66b6 	movea.w 66b6 <ZoomHorizontal>,a0
    291c:	2008           	move.l a0,d0
    291e:	d088           	add.l a0,d0
    2920:	d088           	add.l a0,d0
    2922:	e988           	lsl.l #4,d0
    2924:	da80           	add.l d0,d5
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    2926:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    2928:	4a47           	tst.w d7
    292a:	6e00 ff38      	bgt.w 2864 <Zoom_ZoomIntoPicture+0x14c>
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    292e:	33cd 0000 66b6 	move.w a5,66b6 <ZoomHorizontal>
    startofword -= 16;
    2934:	066f fff0 002e 	addi.w #-16,46(sp)
    293a:	55af 0034      	subq.l #2,52(sp)
    293e:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
    2942:	0c6f fff0 002e 	cmpi.w #-16,46(sp)
    2948:	6600 fe66      	bne.w 27b0 <Zoom_ZoomIntoPicture+0x98>
}
    294c:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    2950:	4fef 001c      	lea 28(sp),sp
    2954:	4e75           	rts
    2956:	3002           	move.w d2,d0
      UWORD colnr = nextzoom - startofword - 1; 
    2958:	5340           	subq.w #1,d0
    295a:	906f 002e      	sub.w 46(sp),d0
      nextzoom -= (19 + zoomnr);
    295e:	342f 0046      	move.w 70(sp),d2
    2962:	d56f 003e      	add.w d2,62(sp)
    shifta = (shift - 1) << 12;
    2966:	342f 002c      	move.w 44(sp),d2
    296a:	5342           	subq.w #1,d2
    296c:	3f42 0040      	move.w d2,64(sp)
    2970:	3202           	move.w d2,d1
    2972:	740c           	moveq #12,d2
    2974:	e569           	lsl.w d2,d1
  hw->bltcon0 = 0xde4 + shifta;
    2976:	3e3c f000      	move.w #-4096,d7
    297a:	4a6f 002c      	tst.w 44(sp)
    297e:	6702           	beq.s 2982 <Zoom_ZoomIntoPicture+0x26a>
    2980:	3e01           	move.w d1,d7
    2982:	0647 0de4      	addi.w #3556,d7
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    2986:	0280 0000 ffff 	andi.l #65535,d0
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    298c:	7210           	moveq #16,d1
    298e:	9280           	sub.l d0,d1
    2990:	7400           	moveq #0,d2
    2992:	4642           	not.w d2
    2994:	e3aa           	lsl.l d1,d2
    2996:	2642           	movea.l d2,a3
    2998:	342f 003c      	move.w 60(sp),d2
    WORD linesleft = 272;
    299c:	363c 0110      	move.w #272,d3
    29a0:	282f 0034      	move.l 52(sp),d4
    29a4:	d8af 0030      	add.l 48(sp),d4
        if( linesleft >= ZoomHorizontal+1) {
    29a8:	b443           	cmp.w d3,d2
    29aa:	6c00 00b2      	bge.w 2a5e <Zoom_ZoomIntoPicture+0x346>
          linesleft -= ZoomHorizontal;
    29ae:	9642           	sub.w d2,d3
    srca = source + 1;
    29b0:	2844           	movea.l d4,a4
  if( shift == 0) {
    29b2:	4a6f 002c      	tst.w 44(sp)
    29b6:	6602           	bne.s 29ba <Zoom_ZoomIntoPicture+0x2a2>
    srca = source + 1;
    29b8:	548c           	addq.l #2,a4
  WaitBlit();
    29ba:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    29c0:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    29c4:	2079 0000 66ae 	movea.l 66ae <hw>,a0
    29ca:	3146 0042      	move.w d6,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    29ce:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
    29d2:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    29d8:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    29de:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    29e4:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    29ea:	314b 0070      	move.w a3,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    29ee:	317c 002c 0066 	move.w #44,102(a0)
  *bp = 0;
    29f4:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltapt = srca;
    29f8:	214c 0050      	move.l a4,80(a0)
  hw->bltbpt = srcb;
    29fc:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    2a00:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    2a04:	ed4a           	lsl.w #6,d2
    2a06:	5442           	addq.w #2,d2
    2a08:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    2a0c:	3079 0000 66b6 	movea.w 66b6 <ZoomHorizontal>,a0
    2a12:	2008           	move.l a0,d0
    2a14:	d088           	add.l a0,d0
    2a16:	d088           	add.l a0,d0
    2a18:	e988           	lsl.l #4,d0
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    2a1a:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    2a1c:	4a43           	tst.w d3
    2a1e:	6e4c           	bgt.s 2a6c <Zoom_ZoomIntoPicture+0x354>
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    2a20:	33cd 0000 66b6 	move.w a5,66b6 <ZoomHorizontal>
      shiftright--;  
    2a26:	3f6f 0040 002c 	move.w 64(sp),44(sp)
      if(shiftright < 0) {
    2a2c:	6c00 ff06      	bge.w 2934 <Zoom_ZoomIntoPicture+0x21c>
        shiftright += 16;
    2a30:	342f 0044      	move.w 68(sp),d2
    2a34:	0642 000f      	addi.w #15,d2
    2a38:	3f42 002c      	move.w d2,44(sp)
        shifttoleft = 1;
    2a3c:	3f7c 0001 0042 	move.w #1,66(sp)
    startofword -= 16;
    2a42:	066f fff0 002e 	addi.w #-16,46(sp)
    2a48:	55af 0034      	subq.l #2,52(sp)
    2a4c:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
    2a50:	0c6f fff0 002e 	cmpi.w #-16,46(sp)
    2a56:	6600 fd58      	bne.w 27b0 <Zoom_ZoomIntoPicture+0x98>
    2a5a:	6000 fef0      	bra.w 294c <Zoom_ZoomIntoPicture+0x234>
          ZoomHorizontal = linesleft;
    2a5e:	33c3 0000 66b6 	move.w d3,66b6 <ZoomHorizontal>
    2a64:	3403           	move.w d3,d2
          linesleft = 0;
    2a66:	4243           	clr.w d3
    2a68:	6000 ff46      	bra.w 29b0 <Zoom_ZoomIntoPicture+0x298>
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    2a6c:	da80           	add.l d0,d5
          Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    2a6e:	282f 0030      	move.l 48(sp),d4
    2a72:	d885           	add.l d5,d4
    srca = source + 1;
    2a74:	2404           	move.l d4,d2
  if( shift == 0) {
    2a76:	4a6f 002c      	tst.w 44(sp)
    2a7a:	6602           	bne.s 2a7e <Zoom_ZoomIntoPicture+0x366>
    srca = source + 1;
    2a7c:	5482           	addq.l #2,d2
  WaitBlit();
    2a7e:	2c79 0000 66b2 	movea.l 66b2 <GfxBase>,a6
    2a84:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    2a88:	2079 0000 66ae 	movea.l 66ae <hw>,a0
    2a8e:	3146 0042      	move.w d6,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    2a92:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
    2a96:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2a9c:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    2aa2:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    2aa8:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    2aae:	314b 0070      	move.w a3,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    2ab2:	317c 002c 0066 	move.w #44,102(a0)
  *bp = 0;
    2ab8:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltapt = srca;
    2abc:	2142 0050      	move.l d2,80(a0)
  hw->bltbpt = srcb;
    2ac0:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    2ac4:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    2ac8:	317c 0042 0058 	move.w #66,88(a0)
          pos4dest += ZMLINESIZE/2;
    2ace:	45ea 0030      	lea 48(a2),a2
          linesleft--;
    2ad2:	5343           	subq.w #1,d3
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    2ad4:	33cd 0000 66b6 	move.w a5,66b6 <ZoomHorizontal>
      while( linesleft > 0)
    2ada:	4a43           	tst.w d3
    2adc:	6700 ff48      	beq.w 2a26 <Zoom_ZoomIntoPicture+0x30e>
    2ae0:	340d           	move.w a5,d2
    2ae2:	6000 fec4      	bra.w 29a8 <Zoom_ZoomIntoPicture+0x290>
  WORD shiftright = 9;
    2ae6:	7e09           	moveq #9,d7
  *bp2 = 0;
    2ae8:	4278 0206      	clr.w 206 <main+0x200>
  WORD ZoomHorizontalStart = 15 - zoomnr * 6;
    2aec:	3008           	move.w a0,d0
    2aee:	d041           	add.w d1,d0
    2af0:	d040           	add.w d0,d0
    2af2:	740f           	moveq #15,d2
    2af4:	9440           	sub.w d0,d2
    2af6:	3f42 003c      	move.w d2,60(sp)
  while( ZoomHorizontalStart < 0) {
    2afa:	6d00 fc72      	blt.w 276e <Zoom_ZoomIntoPicture+0x56>
    2afe:	203c 8000 00d6 	move.l #-2147483434,d0
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    2b04:	90c1           	suba.w d1,a0
    2b06:	3a48           	movea.w a0,a5
    2b08:	4bed 000f      	lea 15(a5),a5
    2b0c:	d080           	add.l d0,d0
    2b0e:	d0af 004c      	add.l 76(sp),d0
    2b12:	2f40 0034      	move.l d0,52(sp)
    2b16:	742c           	moveq #44,d2
    2b18:	d4af 0050      	add.l 80(sp),d2
    2b1c:	2f42 0038      	move.l d2,56(sp)
  UWORD shifttoleft = 0;
    2b20:	426f 0042      	clr.w 66(sp)
  UWORD startofword = 21*16;
    2b24:	3f7c 0150 002e 	move.w #336,46(sp)
      nextzoom -= (19 + zoomnr);
    2b2a:	74ed           	moveq #-19,d2
    2b2c:	9449           	sub.w a1,d2
    2b2e:	3f42 0046      	move.w d2,70(sp)
    WORD linesleft = 272;
    2b32:	3f47 002c      	move.w d7,44(sp)
    2b36:	6000 fc78      	bra.w 27b0 <Zoom_ZoomIntoPicture+0x98>

00002b3a <ClbuildZoom>:
ULONG * ClbuildZoom() {
    2b3a:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    2b3e:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    2b44:	203c 0000 a48c 	move.l #42124,d0
    2b4a:	7202           	moveq #2,d1
    2b4c:	4eae ff3a      	jsr -198(a6)
    2b50:	2440           	movea.l d0,a2
  if( retval == 0) {
    2b52:	4a80           	tst.l d0
    2b54:	6700 0160      	beq.w 2cb6 <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    2b58:	24b9 0000 653c 	move.l 653c <ClsSprites>,(a2)
    2b5e:	2579 0000 6540 	move.l 6540 <ClsSprites+0x4>,4(a2)
    2b64:	0004 
    2b66:	2579 0000 6544 	move.l 6544 <ClsSprites+0x8>,8(a2)
    2b6c:	0008 
    2b6e:	2579 0000 6548 	move.l 6548 <ClsSprites+0xc>,12(a2)
    2b74:	000c 
    2b76:	2579 0000 654c 	move.l 654c <ClsSprites+0x10>,16(a2)
    2b7c:	0010 
    2b7e:	2579 0000 6550 	move.l 6550 <ClsSprites+0x14>,20(a2)
    2b84:	0014 
    2b86:	2579 0000 6554 	move.l 6554 <ClsSprites+0x18>,24(a2)
    2b8c:	0018 
    2b8e:	2579 0000 6558 	move.l 6558 <ClsSprites+0x1c>,28(a2)
    2b94:	001c 
    2b96:	2579 0000 655c 	move.l 655c <ClsSprites+0x20>,32(a2)
    2b9c:	0020 
    2b9e:	2579 0000 6560 	move.l 6560 <ClsSprites+0x24>,36(a2)
    2ba4:	0024 
    2ba6:	2579 0000 6564 	move.l 6564 <ClsSprites+0x28>,40(a2)
    2bac:	0028 
    2bae:	2579 0000 6568 	move.l 6568 <ClsSprites+0x2c>,44(a2)
    2bb4:	002c 
    2bb6:	2579 0000 656c 	move.l 656c <ClsSprites+0x30>,48(a2)
    2bbc:	0030 
    2bbe:	2579 0000 6570 	move.l 6570 <ClsSprites+0x34>,52(a2)
    2bc4:	0034 
    2bc6:	2579 0000 6574 	move.l 6574 <ClsSprites+0x38>,56(a2)
    2bcc:	0038 
    2bce:	2579 0000 6578 	move.l 6578 <ClsSprites+0x3c>,60(a2)
    2bd4:	003c 
    *cl++ = *clpartinstruction++;
    2bd6:	2579 0000 64d4 	move.l 64d4 <ClScreenZoom>,64(a2)
    2bdc:	0040 
    2bde:	2579 0000 64d8 	move.l 64d8 <ClScreenZoom+0x4>,68(a2)
    2be4:	0044 
    2be6:	2579 0000 64dc 	move.l 64dc <ClScreenZoom+0x8>,72(a2)
    2bec:	0048 
    2bee:	2579 0000 64e0 	move.l 64e0 <ClScreenZoom+0xc>,76(a2)
    2bf4:	004c 
    2bf6:	2579 0000 64e4 	move.l 64e4 <ClScreenZoom+0x10>,80(a2)
    2bfc:	0050 
    2bfe:	2579 0000 64e8 	move.l 64e8 <ClScreenZoom+0x14>,84(a2)
    2c04:	0054 
    2c06:	2579 0000 64ec 	move.l 64ec <ClScreenZoom+0x18>,88(a2)
    2c0c:	0058 
    2c0e:	2579 0000 64f0 	move.l 64f0 <ClScreenZoom+0x1c>,92(a2)
    2c14:	005c 
    2c16:	2579 0000 64f4 	move.l 64f4 <ClScreenZoom+0x20>,96(a2)
    2c1c:	0060 
    2c1e:	2579 0000 64f8 	move.l 64f8 <ClScreenZoom+0x24>,100(a2)
    2c24:	0064 
    2c26:	2579 0000 64fc 	move.l 64fc <ClScreenZoom+0x28>,104(a2)
    2c2c:	0068 
    2c2e:	2579 0000 6500 	move.l 6500 <ClScreenZoom+0x2c>,108(a2)
    2c34:	006c 
  *cl++ = 0x00e00000;
    2c36:	257c 00e0 0000 	move.l #14680064,112(a2)
    2c3c:	0070 
  *cl++ = 0x00e20000;
    2c3e:	257c 00e2 0000 	move.l #14811136,116(a2)
    2c44:	0074 
  *cl++ = 0x00e40000;
    2c46:	257c 00e4 0000 	move.l #14942208,120(a2)
    2c4c:	0078 
  *cl++ = 0x00e60000;
    2c4e:	257c 00e6 0000 	move.l #15073280,124(a2)
    2c54:	007c 
    *cl++ = *clpartinstruction++;
    2c56:	2579 0000 6504 	move.l 6504 <ClColor>,128(a2)
    2c5c:	0080 
    2c5e:	2579 0000 6508 	move.l 6508 <ClColor+0x4>,132(a2)
    2c64:	0084 
    2c66:	43ea 012c      	lea 300(a2),a1
    2c6a:	220a           	move.l a2,d1
    2c6c:	0681 0000 a52c 	addi.l #42284,d1
    2c72:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    2c78:	41e9 ff60      	lea -160(a1),a0
    2c7c:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    2c80:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    2c86:	5088           	addq.l #8,a0
    2c88:	217c 0182 0f00 	move.l #25300736,-4(a0)
    2c8e:	fffc 
    for(int i2=0;i2<20;i2++) {
    2c90:	b3c8           	cmpa.l a0,a1
    2c92:	66ec           	bne.s 2c80 <ClbuildZoom+0x146>
    2c94:	43e8 00a4      	lea 164(a0),a1
    2c98:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    2c9e:	b3c1           	cmpa.l d1,a1
    2ca0:	66d6           	bne.s 2c78 <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    2ca2:	203c 0000 a488 	move.l #42120,d0
    2ca8:	72fe           	moveq #-2,d1
    2caa:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    2cae:	200a           	move.l a2,d0
    2cb0:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2cb4:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2cb6:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2cbc:	4eae ffc4      	jsr -60(a6)
    2cc0:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2cc6:	2200           	move.l d0,d1
    2cc8:	243c 0000 3d11 	move.l #15633,d2
    2cce:	7628           	moveq #40,d3
    2cd0:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2cd4:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2cda:	7201           	moveq #1,d1
    2cdc:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    2ce0:	24b9 0000 653c 	move.l 653c <ClsSprites>,(a2)
    2ce6:	2579 0000 6540 	move.l 6540 <ClsSprites+0x4>,4(a2)
    2cec:	0004 
    2cee:	2579 0000 6544 	move.l 6544 <ClsSprites+0x8>,8(a2)
    2cf4:	0008 
    2cf6:	2579 0000 6548 	move.l 6548 <ClsSprites+0xc>,12(a2)
    2cfc:	000c 
    2cfe:	2579 0000 654c 	move.l 654c <ClsSprites+0x10>,16(a2)
    2d04:	0010 
    2d06:	2579 0000 6550 	move.l 6550 <ClsSprites+0x14>,20(a2)
    2d0c:	0014 
    2d0e:	2579 0000 6554 	move.l 6554 <ClsSprites+0x18>,24(a2)
    2d14:	0018 
    2d16:	2579 0000 6558 	move.l 6558 <ClsSprites+0x1c>,28(a2)
    2d1c:	001c 
    2d1e:	2579 0000 655c 	move.l 655c <ClsSprites+0x20>,32(a2)
    2d24:	0020 
    2d26:	2579 0000 6560 	move.l 6560 <ClsSprites+0x24>,36(a2)
    2d2c:	0024 
    2d2e:	2579 0000 6564 	move.l 6564 <ClsSprites+0x28>,40(a2)
    2d34:	0028 
    2d36:	2579 0000 6568 	move.l 6568 <ClsSprites+0x2c>,44(a2)
    2d3c:	002c 
    2d3e:	2579 0000 656c 	move.l 656c <ClsSprites+0x30>,48(a2)
    2d44:	0030 
    2d46:	2579 0000 6570 	move.l 6570 <ClsSprites+0x34>,52(a2)
    2d4c:	0034 
    2d4e:	2579 0000 6574 	move.l 6574 <ClsSprites+0x38>,56(a2)
    2d54:	0038 
    2d56:	2579 0000 6578 	move.l 6578 <ClsSprites+0x3c>,60(a2)
    2d5c:	003c 
    *cl++ = *clpartinstruction++;
    2d5e:	2579 0000 64d4 	move.l 64d4 <ClScreenZoom>,64(a2)
    2d64:	0040 
    2d66:	2579 0000 64d8 	move.l 64d8 <ClScreenZoom+0x4>,68(a2)
    2d6c:	0044 
    2d6e:	2579 0000 64dc 	move.l 64dc <ClScreenZoom+0x8>,72(a2)
    2d74:	0048 
    2d76:	2579 0000 64e0 	move.l 64e0 <ClScreenZoom+0xc>,76(a2)
    2d7c:	004c 
    2d7e:	2579 0000 64e4 	move.l 64e4 <ClScreenZoom+0x10>,80(a2)
    2d84:	0050 
    2d86:	2579 0000 64e8 	move.l 64e8 <ClScreenZoom+0x14>,84(a2)
    2d8c:	0054 
    2d8e:	2579 0000 64ec 	move.l 64ec <ClScreenZoom+0x18>,88(a2)
    2d94:	0058 
    2d96:	2579 0000 64f0 	move.l 64f0 <ClScreenZoom+0x1c>,92(a2)
    2d9c:	005c 
    2d9e:	2579 0000 64f4 	move.l 64f4 <ClScreenZoom+0x20>,96(a2)
    2da4:	0060 
    2da6:	2579 0000 64f8 	move.l 64f8 <ClScreenZoom+0x24>,100(a2)
    2dac:	0064 
    2dae:	2579 0000 64fc 	move.l 64fc <ClScreenZoom+0x28>,104(a2)
    2db4:	0068 
    2db6:	2579 0000 6500 	move.l 6500 <ClScreenZoom+0x2c>,108(a2)
    2dbc:	006c 
  *cl++ = 0x00e00000;
    2dbe:	257c 00e0 0000 	move.l #14680064,112(a2)
    2dc4:	0070 
  *cl++ = 0x00e20000;
    2dc6:	257c 00e2 0000 	move.l #14811136,116(a2)
    2dcc:	0074 
  *cl++ = 0x00e40000;
    2dce:	257c 00e4 0000 	move.l #14942208,120(a2)
    2dd4:	0078 
  *cl++ = 0x00e60000;
    2dd6:	257c 00e6 0000 	move.l #15073280,124(a2)
    2ddc:	007c 
    *cl++ = *clpartinstruction++;
    2dde:	2579 0000 6504 	move.l 6504 <ClColor>,128(a2)
    2de4:	0080 
    2de6:	2579 0000 6508 	move.l 6508 <ClColor+0x4>,132(a2)
    2dec:	0084 
    2dee:	43ea 012c      	lea 300(a2),a1
    2df2:	220a           	move.l a2,d1
    2df4:	0681 0000 a52c 	addi.l #42284,d1
    2dfa:	203c 2c07 fffe 	move.l #738721790,d0
    2e00:	6000 fe76      	bra.w 2c78 <ClbuildZoom+0x13e>

00002e04 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    2e04:	2039 0000 66c4 	move.l 66c4 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    2e0a:	23f9 0000 66b8 	move.l 66b8 <ViewCopper>,66c4 <DrawCopper>
    2e10:	0000 66c4 
  ViewCopper = (ULONG *)tmp;
    2e14:	23c0 0000 66b8 	move.l d0,66b8 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    2e1a:	2079 0000 66ae 	movea.l 66ae <hw>,a0
    2e20:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    2e24:	3140 0088      	move.w d0,136(a0)
}
    2e28:	4e75           	rts

00002e2a <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    2e2a:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    2e2e:	45fa fd0a      	lea 2b3a <ClbuildZoom>(pc),a2
    2e32:	4e92           	jsr (a2)
    2e34:	23c0 0000 66d4 	move.l d0,66d4 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    2e3a:	4e92           	jsr (a2)
    2e3c:	23c0 0000 66d0 	move.l d0,66d0 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2e42:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    2e48:	203c 0001 6800 	move.l #92160,d0
    2e4e:	7202           	moveq #2,d1
    2e50:	4eae ff3a      	jsr -198(a6)
    2e54:	23c0 0000 66cc 	move.l d0,66cc <Bitplane1>
  if(Bitplane1 == 0) {
    2e5a:	6700 014e      	beq.w 2faa <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    2e5e:	23c0 0000 66c8 	move.l d0,66c8 <DrawBuffer>
  DrawCopper = Copperlist1;
    2e64:	23f9 0000 66d4 	move.l 66d4 <Copperlist1>,66c4 <DrawCopper>
    2e6a:	0000 66c4 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2e6e:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    2e74:	203c 0001 6800 	move.l #92160,d0
    2e7a:	7202           	moveq #2,d1
    2e7c:	4eae ff3a      	jsr -198(a6)
    2e80:	2400           	move.l d0,d2
    2e82:	23c0 0000 66c0 	move.l d0,66c0 <Bitplane2>
  if(Bitplane2 == 0) {
    2e88:	6778           	beq.s 2f02 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    2e8a:	23f9 0000 66d0 	move.l 66d0 <Copperlist2>,66b8 <ViewCopper>
    2e90:	0000 66b8 
  SwapCl();
    2e94:	45fa ff6e      	lea 2e04 <SwapCl>(pc),a2
    2e98:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    2e9a:	2039 0000 66c8 	move.l 66c8 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2ea0:	2079 0000 66c4 	movea.l 66c4 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2ea6:	2200           	move.l d0,d1
    2ea8:	4241           	clr.w d1
    2eaa:	4841           	swap d1
    2eac:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    2eb0:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    2eb4:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2eba:	2200           	move.l d0,d1
    2ebc:	4241           	clr.w d1
    2ebe:	4841           	swap d1
    2ec0:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2ec4:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    2ec8:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    2eca:	2079 0000 66c4 	movea.l 66c4 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2ed0:	2002           	move.l d2,d0
    2ed2:	4240           	clr.w d0
    2ed4:	4840           	swap d0
    2ed6:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    2eda:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    2ede:	2002           	move.l d2,d0
    2ee0:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2ee6:	2200           	move.l d0,d1
    2ee8:	4241           	clr.w d1
    2eea:	4841           	swap d1
    2eec:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2ef0:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    2ef4:	23c2 0000 66bc 	move.l d2,66bc <ViewBuffer>
}
    2efa:	7000           	moveq #0,d0
    2efc:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2f00:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2f02:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2f08:	4eae ffc4      	jsr -60(a6)
    2f0c:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2f12:	2200           	move.l d0,d1
    2f14:	243c 0000 3d5e 	move.l #15710,d2
    2f1a:	7626           	moveq #38,d3
    2f1c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2f20:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2f26:	7201           	moveq #1,d1
    2f28:	4eae ff70      	jsr -144(a6)
    2f2c:	2439 0000 66c0 	move.l 66c0 <Bitplane2>,d2
  ViewCopper = Copperlist2;
    2f32:	23f9 0000 66d0 	move.l 66d0 <Copperlist2>,66b8 <ViewCopper>
    2f38:	0000 66b8 
  SwapCl();
    2f3c:	45fa fec6      	lea 2e04 <SwapCl>(pc),a2
    2f40:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    2f42:	2039 0000 66c8 	move.l 66c8 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2f48:	2079 0000 66c4 	movea.l 66c4 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2f4e:	2200           	move.l d0,d1
    2f50:	4241           	clr.w d1
    2f52:	4841           	swap d1
    2f54:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    2f58:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    2f5c:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2f62:	2200           	move.l d0,d1
    2f64:	4241           	clr.w d1
    2f66:	4841           	swap d1
    2f68:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2f6c:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    2f70:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    2f72:	2079 0000 66c4 	movea.l 66c4 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2f78:	2002           	move.l d2,d0
    2f7a:	4240           	clr.w d0
    2f7c:	4840           	swap d0
    2f7e:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    2f82:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    2f86:	2002           	move.l d2,d0
    2f88:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2f8e:	2200           	move.l d0,d1
    2f90:	4241           	clr.w d1
    2f92:	4841           	swap d1
    2f94:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2f98:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    2f9c:	23c2 0000 66bc 	move.l d2,66bc <ViewBuffer>
}
    2fa2:	7000           	moveq #0,d0
    2fa4:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2fa8:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2faa:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2fb0:	4eae ffc4      	jsr -60(a6)
    2fb4:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2fba:	2200           	move.l d0,d1
    2fbc:	243c 0000 3d37 	move.l #15671,d2
    2fc2:	7626           	moveq #38,d3
    2fc4:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2fc8:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    2fce:	7201           	moveq #1,d1
    2fd0:	4eae ff70      	jsr -144(a6)
    2fd4:	2039 0000 66cc 	move.l 66cc <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    2fda:	23c0 0000 66c8 	move.l d0,66c8 <DrawBuffer>
  DrawCopper = Copperlist1;
    2fe0:	23f9 0000 66d4 	move.l 66d4 <Copperlist1>,66c4 <DrawCopper>
    2fe6:	0000 66c4 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2fea:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    2ff0:	203c 0001 6800 	move.l #92160,d0
    2ff6:	7202           	moveq #2,d1
    2ff8:	4eae ff3a      	jsr -198(a6)
    2ffc:	2400           	move.l d0,d2
    2ffe:	23c0 0000 66c0 	move.l d0,66c0 <Bitplane2>
  if(Bitplane2 == 0) {
    3004:	6600 fe84      	bne.w 2e8a <PrepareDisplayZoom+0x60>
    3008:	6000 fef8      	bra.w 2f02 <PrepareDisplayZoom+0xd8>

0000300c <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    300c:	2039 0000 66c8 	move.l 66c8 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    3012:	2079 0000 66c4 	movea.l 66c4 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    3018:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    301c:	2200           	move.l d0,d1
    301e:	4241           	clr.w d1
    3020:	4841           	swap d1
    3022:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    3026:	23f9 0000 66bc 	move.l 66bc <ViewBuffer>,66c8 <DrawBuffer>
    302c:	0000 66c8 
  ViewBuffer = (ULONG *) tmp;
    3030:	23c0 0000 66bc 	move.l d0,66bc <ViewBuffer>
}
    3036:	4e75           	rts

00003038 <PrepareDisplay>:
 int PrepareDisplaySW() {
    3038:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    303c:	45fa f47c      	lea 24ba <ClBuild>(pc),a2
    3040:	4e92           	jsr (a2)
    3042:	23c0 0000 66d4 	move.l d0,66d4 <Copperlist1>
  Copperlist2 = ClbuildSW();
    3048:	4e92           	jsr (a2)
    304a:	23c0 0000 66d0 	move.l d0,66d0 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    3050:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    3056:	203c 0000 c800 	move.l #51200,d0
    305c:	7202           	moveq #2,d1
    305e:	4eae ff3a      	jsr -198(a6)
    3062:	23c0 0000 66cc 	move.l d0,66cc <Bitplane1>
  if(Bitplane1 == 0) {
    3068:	6700 00ac      	beq.w 3116 <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    306c:	23c0 0000 66c8 	move.l d0,66c8 <DrawBuffer>
  DrawCopper = Copperlist1;
    3072:	23f9 0000 66d4 	move.l 66d4 <Copperlist1>,66c4 <DrawCopper>
    3078:	0000 66c4 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    307c:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    3082:	203c 0000 c800 	move.l #51200,d0
    3088:	7202           	moveq #2,d1
    308a:	4eae ff3a      	jsr -198(a6)
    308e:	23c0 0000 66c0 	move.l d0,66c0 <Bitplane2>
  if(Bitplane2 == 0) {
    3094:	6728           	beq.s 30be <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    3096:	23c0 0000 66bc 	move.l d0,66bc <ViewBuffer>
  ViewCopper = Copperlist2;
    309c:	23f9 0000 66d0 	move.l 66d0 <Copperlist2>,66b8 <ViewCopper>
    30a2:	0000 66b8 
  SwapCl();
    30a6:	47fa fd5c      	lea 2e04 <SwapCl>(pc),a3
    30aa:	4e93           	jsr (a3)
  SetBplPointers();
    30ac:	45fa ff5e      	lea 300c <SetBplPointers>(pc),a2
    30b0:	4e92           	jsr (a2)
  SwapCl();
    30b2:	4e93           	jsr (a3)
  SetBplPointers();
    30b4:	4e92           	jsr (a2)
}
    30b6:	7000           	moveq #0,d0
    30b8:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    30bc:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    30be:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    30c4:	4eae ffc4      	jsr -60(a6)
    30c8:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    30ce:	2200           	move.l d0,d1
    30d0:	243c 0000 3d5e 	move.l #15710,d2
    30d6:	7626           	moveq #38,d3
    30d8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    30dc:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    30e2:	7201           	moveq #1,d1
    30e4:	4eae ff70      	jsr -144(a6)
    30e8:	2039 0000 66c0 	move.l 66c0 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    30ee:	23c0 0000 66bc 	move.l d0,66bc <ViewBuffer>
  ViewCopper = Copperlist2;
    30f4:	23f9 0000 66d0 	move.l 66d0 <Copperlist2>,66b8 <ViewCopper>
    30fa:	0000 66b8 
  SwapCl();
    30fe:	47fa fd04      	lea 2e04 <SwapCl>(pc),a3
    3102:	4e93           	jsr (a3)
  SetBplPointers();
    3104:	45fa ff06      	lea 300c <SetBplPointers>(pc),a2
    3108:	4e92           	jsr (a2)
  SwapCl();
    310a:	4e93           	jsr (a3)
  SetBplPointers();
    310c:	4e92           	jsr (a2)
}
    310e:	7000           	moveq #0,d0
    3110:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    3114:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    3116:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    311c:	4eae ffc4      	jsr -60(a6)
    3120:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    3126:	2200           	move.l d0,d1
    3128:	243c 0000 3d37 	move.l #15671,d2
    312e:	7626           	moveq #38,d3
    3130:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    3134:	2c79 0000 66d8 	movea.l 66d8 <DOSBase>,a6
    313a:	7201           	moveq #1,d1
    313c:	4eae ff70      	jsr -144(a6)
    3140:	2039 0000 66cc 	move.l 66cc <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    3146:	23c0 0000 66c8 	move.l d0,66c8 <DrawBuffer>
  DrawCopper = Copperlist1;
    314c:	23f9 0000 66d4 	move.l 66d4 <Copperlist1>,66c4 <DrawCopper>
    3152:	0000 66c4 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    3156:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    315c:	203c 0000 c800 	move.l #51200,d0
    3162:	7202           	moveq #2,d1
    3164:	4eae ff3a      	jsr -198(a6)
    3168:	23c0 0000 66c0 	move.l d0,66c0 <Bitplane2>
  if(Bitplane2 == 0) {
    316e:	6600 ff26      	bne.w 3096 <PrepareDisplay+0x5e>
    3172:	6000 ff4a      	bra.w 30be <PrepareDisplay+0x86>

00003176 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    3176:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    317a:	262f 0010      	move.l 16(sp),d3
    317e:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    3182:	2279 0000 66d4 	movea.l 66d4 <Copperlist1>,a1
    3188:	b2fc 0000      	cmpa.w #0,a1
    318c:	670c           	beq.s 319a <FreeDisplay+0x24>
    318e:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    3194:	2003           	move.l d3,d0
    3196:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    319a:	2279 0000 66d0 	movea.l 66d0 <Copperlist2>,a1
    31a0:	b2fc 0000      	cmpa.w #0,a1
    31a4:	670c           	beq.s 31b2 <FreeDisplay+0x3c>
    31a6:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    31ac:	2003           	move.l d3,d0
    31ae:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    31b2:	2279 0000 66cc 	movea.l 66cc <Bitplane1>,a1
    31b8:	b2fc 0000      	cmpa.w #0,a1
    31bc:	670c           	beq.s 31ca <FreeDisplay+0x54>
    31be:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    31c4:	2002           	move.l d2,d0
    31c6:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    31ca:	2279 0000 66c0 	movea.l 66c0 <Bitplane2>,a1
    31d0:	b2fc 0000      	cmpa.w #0,a1
    31d4:	670c           	beq.s 31e2 <FreeDisplay+0x6c>
    31d6:	2c79 0000 66dc 	movea.l 66dc <SysBase>,a6
    31dc:	2002           	move.l d2,d0
    31de:	4eae ff2e      	jsr -210(a6)
}
    31e2:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    31e6:	4e75           	rts

000031e8 <WaitVbl>:
void WaitVbl() {
    31e8:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    31ea:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddbce3>,d0
    31f0:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    31f2:	2017           	move.l (sp),d0
    31f4:	0280 0001 ff00 	andi.l #130816,d0
    31fa:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    31fc:	2017           	move.l (sp),d0
    31fe:	0c80 0001 3700 	cmpi.l #79616,d0
    3204:	67e4           	beq.s 31ea <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    3206:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddbce3>,d0
    320c:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    3210:	202f 0004      	move.l 4(sp),d0
    3214:	0280 0001 ff00 	andi.l #130816,d0
    321a:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    321e:	202f 0004      	move.l 4(sp),d0
    3222:	0c80 0001 3700 	cmpi.l #79616,d0
    3228:	66dc           	bne.s 3206 <WaitVbl+0x1e>
}
    322a:	508f           	addq.l #8,sp
    322c:	4e75           	rts

0000322e <memcpy>:
{
    322e:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    3232:	202f 0014      	move.l 20(sp),d0
    3236:	226f 0018      	movea.l 24(sp),a1
    323a:	222f 001c      	move.l 28(sp),d1
	while(len--)
    323e:	2601           	move.l d1,d3
    3240:	5383           	subq.l #1,d3
    3242:	4a81           	tst.l d1
    3244:	6762           	beq.s 32a8 <memcpy+0x7a>
    3246:	2040           	movea.l d0,a0
    3248:	5888           	addq.l #4,a0
    324a:	b1c9           	cmpa.l a1,a0
    324c:	53c2           	sl.s d2
    324e:	4402           	neg.b d2
    3250:	41e9 0004      	lea 4(a1),a0
    3254:	b1c0           	cmpa.l d0,a0
    3256:	53c4           	sl.s d4
    3258:	4404           	neg.b d4
    325a:	8404           	or.b d4,d2
    325c:	7808           	moveq #8,d4
    325e:	b883           	cmp.l d3,d4
    3260:	55c4           	sc.s d4
    3262:	4404           	neg.b d4
    3264:	c404           	and.b d4,d2
    3266:	6746           	beq.s 32ae <memcpy+0x80>
    3268:	2409           	move.l a1,d2
    326a:	8480           	or.l d0,d2
    326c:	7803           	moveq #3,d4
    326e:	c484           	and.l d4,d2
    3270:	663c           	bne.s 32ae <memcpy+0x80>
    3272:	2049           	movea.l a1,a0
    3274:	2440           	movea.l d0,a2
    3276:	74fc           	moveq #-4,d2
    3278:	c481           	and.l d1,d2
    327a:	d489           	add.l a1,d2
		*d++ = *s++;
    327c:	24d8           	move.l (a0)+,(a2)+
    327e:	b488           	cmp.l a0,d2
    3280:	66fa           	bne.s 327c <memcpy+0x4e>
    3282:	74fc           	moveq #-4,d2
    3284:	c481           	and.l d1,d2
    3286:	2040           	movea.l d0,a0
    3288:	d1c2           	adda.l d2,a0
    328a:	d3c2           	adda.l d2,a1
    328c:	9682           	sub.l d2,d3
    328e:	b481           	cmp.l d1,d2
    3290:	6716           	beq.s 32a8 <memcpy+0x7a>
    3292:	1091           	move.b (a1),(a0)
	while(len--)
    3294:	4a83           	tst.l d3
    3296:	6710           	beq.s 32a8 <memcpy+0x7a>
		*d++ = *s++;
    3298:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    329e:	5383           	subq.l #1,d3
    32a0:	6706           	beq.s 32a8 <memcpy+0x7a>
		*d++ = *s++;
    32a2:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    32a8:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    32ac:	4e75           	rts
    32ae:	2040           	movea.l d0,a0
    32b0:	d289           	add.l a1,d1
		*d++ = *s++;
    32b2:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    32b4:	b289           	cmp.l a1,d1
    32b6:	67f0           	beq.s 32a8 <memcpy+0x7a>
		*d++ = *s++;
    32b8:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    32ba:	b289           	cmp.l a1,d1
    32bc:	66f4           	bne.s 32b2 <memcpy+0x84>
    32be:	60e8           	bra.s 32a8 <memcpy+0x7a>

000032c0 <memset>:
{
    32c0:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    32c4:	202f 0024      	move.l 36(sp),d0
    32c8:	2a2f 0028      	move.l 40(sp),d5
    32cc:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    32d0:	2809           	move.l a1,d4
    32d2:	5384           	subq.l #1,d4
    32d4:	b2fc 0000      	cmpa.w #0,a1
    32d8:	6f00 00b0      	ble.w 338a <memset+0xca>
    32dc:	1e05           	move.b d5,d7
    32de:	2200           	move.l d0,d1
    32e0:	4481           	neg.l d1
    32e2:	7403           	moveq #3,d2
    32e4:	c282           	and.l d2,d1
    32e6:	7c05           	moveq #5,d6
		*ptr++ = val;
    32e8:	2440           	movea.l d0,a2
    32ea:	bc84           	cmp.l d4,d6
    32ec:	646a           	bcc.s 3358 <memset+0x98>
    32ee:	4a81           	tst.l d1
    32f0:	6724           	beq.s 3316 <memset+0x56>
    32f2:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    32f4:	5384           	subq.l #1,d4
    32f6:	7401           	moveq #1,d2
    32f8:	b481           	cmp.l d1,d2
    32fa:	671a           	beq.s 3316 <memset+0x56>
		*ptr++ = val;
    32fc:	2440           	movea.l d0,a2
    32fe:	548a           	addq.l #2,a2
    3300:	2040           	movea.l d0,a0
    3302:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    3306:	5384           	subq.l #1,d4
    3308:	7403           	moveq #3,d2
    330a:	b481           	cmp.l d1,d2
    330c:	6608           	bne.s 3316 <memset+0x56>
		*ptr++ = val;
    330e:	528a           	addq.l #1,a2
    3310:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    3314:	5384           	subq.l #1,d4
    3316:	2609           	move.l a1,d3
    3318:	9681           	sub.l d1,d3
    331a:	7c00           	moveq #0,d6
    331c:	1c05           	move.b d5,d6
    331e:	2406           	move.l d6,d2
    3320:	4842           	swap d2
    3322:	4242           	clr.w d2
    3324:	2042           	movea.l d2,a0
    3326:	2406           	move.l d6,d2
    3328:	e14a           	lsl.w #8,d2
    332a:	4842           	swap d2
    332c:	4242           	clr.w d2
    332e:	e18e           	lsl.l #8,d6
    3330:	2646           	movea.l d6,a3
    3332:	2c08           	move.l a0,d6
    3334:	8486           	or.l d6,d2
    3336:	2c0b           	move.l a3,d6
    3338:	8486           	or.l d6,d2
    333a:	1407           	move.b d7,d2
    333c:	2040           	movea.l d0,a0
    333e:	d1c1           	adda.l d1,a0
    3340:	72fc           	moveq #-4,d1
    3342:	c283           	and.l d3,d1
    3344:	d288           	add.l a0,d1
		*ptr++ = val;
    3346:	20c2           	move.l d2,(a0)+
    3348:	b1c1           	cmpa.l d1,a0
    334a:	66fa           	bne.s 3346 <memset+0x86>
    334c:	72fc           	moveq #-4,d1
    334e:	c283           	and.l d3,d1
    3350:	d5c1           	adda.l d1,a2
    3352:	9881           	sub.l d1,d4
    3354:	b283           	cmp.l d3,d1
    3356:	6732           	beq.s 338a <memset+0xca>
    3358:	1485           	move.b d5,(a2)
	while(len-- > 0)
    335a:	4a84           	tst.l d4
    335c:	6f2c           	ble.s 338a <memset+0xca>
		*ptr++ = val;
    335e:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    3362:	7201           	moveq #1,d1
    3364:	b284           	cmp.l d4,d1
    3366:	6c22           	bge.s 338a <memset+0xca>
		*ptr++ = val;
    3368:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    336c:	7402           	moveq #2,d2
    336e:	b484           	cmp.l d4,d2
    3370:	6c18           	bge.s 338a <memset+0xca>
		*ptr++ = val;
    3372:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    3376:	7c03           	moveq #3,d6
    3378:	bc84           	cmp.l d4,d6
    337a:	6c0e           	bge.s 338a <memset+0xca>
		*ptr++ = val;
    337c:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    3380:	7204           	moveq #4,d1
    3382:	b284           	cmp.l d4,d1
    3384:	6c04           	bge.s 338a <memset+0xca>
		*ptr++ = val;
    3386:	1545 0005      	move.b d5,5(a2)
}
    338a:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    338e:	4e75           	rts

00003390 <strlen>:
{
    3390:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    3394:	7000           	moveq #0,d0
	while(*s++)
    3396:	4a10           	tst.b (a0)
    3398:	6708           	beq.s 33a2 <strlen+0x12>
		t++;
    339a:	5280           	addq.l #1,d0
	while(*s++)
    339c:	4a30 0800      	tst.b (0,a0,d0.l)
    33a0:	66f8           	bne.s 339a <strlen+0xa>
}
    33a2:	4e75           	rts

000033a4 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    33a4:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    33a8:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    33ac:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    33b0:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    33b4:	d041           	add.w d1,d0
	swap	d0
    33b6:	4840           	swap d0
	clrw	d0
    33b8:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    33ba:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    33be:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    33c2:	d081           	add.l d1,d0

	rts
    33c4:	4e75           	rts

000033c6 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    33c6:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    33c8:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    33cc:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    33d0:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    33d6:	6416           	bcc.s 33ee <__udivsi3+0x28>
	movel	d0, d2
    33d8:	2400           	move.l d0,d2
	clrw	d2
    33da:	4242           	clr.w d2
	swap	d2
    33dc:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    33de:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    33e0:	3002           	move.w d2,d0
	swap	d0
    33e2:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    33e4:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    33e8:	84c1           	divu.w d1,d2
	movew	d2, d0
    33ea:	3002           	move.w d2,d0
	jra	6f
    33ec:	6030           	bra.s 341e <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    33ee:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    33f0:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    33f2:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    33f4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    33fa:	64f4           	bcc.s 33f0 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    33fc:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    33fe:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    3404:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    3406:	c2c0           	mulu.w d0,d1
	swap	d2
    3408:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    340a:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    340c:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    340e:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    3410:	660a           	bne.s 341c <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    3412:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    3414:	6506           	bcs.s 341c <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    3416:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    341a:	6302           	bls.s 341e <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    341c:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    341e:	241f           	move.l (sp)+,d2
	rts
    3420:	4e75           	rts

00003422 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    3422:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    3424:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    3426:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    342a:	6a04           	bpl.s 3430 <__divsi3+0xe>
	negl	d1
    342c:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    342e:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    3430:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    3434:	6a04           	bpl.s 343a <__divsi3+0x18>
	negl	d0
    3436:	4480           	neg.l d0
	negb	d2
    3438:	4402           	neg.b d2

2:	movel	d1, sp@-
    343a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    343c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    343e:	6186           	bsr.s 33c6 <__udivsi3>
	addql	IMM (8), sp
    3440:	508f           	addq.l #8,sp

	tstb	d2
    3442:	4a02           	tst.b d2
	jpl	3f
    3444:	6a02           	bpl.s 3448 <__divsi3+0x26>
	negl	d0
    3446:	4480           	neg.l d0

3:	movel	sp@+, d2
    3448:	241f           	move.l (sp)+,d2
	rts
    344a:	4e75           	rts

0000344c <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    344c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    3450:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    3454:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    3456:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    3458:	61c8           	bsr.s 3422 <__divsi3>
	addql	IMM (8), sp
    345a:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    345c:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    3460:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    3462:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    3464:	6100 ff3e      	bsr.w 33a4 <__mulsi3>
	addql	IMM (8), sp
    3468:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    346a:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    346e:	9280           	sub.l d0,d1
	movel	d1, d0
    3470:	2001           	move.l d1,d0
	rts
    3472:	4e75           	rts

00003474 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    3474:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    3478:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    347c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    347e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    3480:	6100 ff44      	bsr.w 33c6 <__udivsi3>
	addql	IMM (8), sp
    3484:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    3486:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    348a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    348c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    348e:	6100 ff14      	bsr.w 33a4 <__mulsi3>
	addql	IMM (8), sp
    3492:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    3494:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    3498:	9280           	sub.l d0,d1
	movel	d1, d0
    349a:	2001           	move.l d1,d0
	rts
    349c:	4e75           	rts

0000349e <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    349e:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    34a0:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    34a4:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    34a8:	2c5f           	movea.l (sp)+,a6
    rts
    34aa:	4e75           	rts

000034ac <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    34ac:	16c0           	move.b d0,(a3)+
	rts
    34ae:	4e75           	rts

000034b0 <saveregs>:
	...

000034ec <font2distance>:
    34ec:	0505           	btst d2,d5
    34ee:	0505           	btst d2,d5
    34f0:	0505           	btst d2,d5
    34f2:	0505           	btst d2,d5
    34f4:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    34f6:	0505           	btst d2,d5
    34f8:	0505           	btst d2,d5
    34fa:	0005 0505      	ori.b #5,d5
    34fe:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    3500:	0505           	btst d2,d5
    3502:	0505           	btst d2,d5
    3504:	0505           	btst d2,d5
    3506:	0505           	btst d2,d5
    3508:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    350a:	0505           	btst d2,d5
    350c:	0505           	btst d2,d5
    350e:	0505           	btst d2,d5
    3510:	0505           	btst d2,d5
    3512:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    3514:	0500           	btst d2,d0
    3516:	0505           	btst d2,d5
    3518:	0505           	btst d2,d5
    351a:	0505           	btst d2,d5
    351c:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    351e:	0505           	btst d2,d5
    3520:	0505           	btst d2,d5
    3522:	0505           	btst d2,d5
    3524:	0505           	btst d2,d5
    3526:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    3528:	0505           	btst d2,d5
    352a:	0505           	btst d2,d5
    352c:	0503           	btst d2,d3
    352e:	0505           	btst d2,d5
    3530:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    3532:	0505           	btst d2,d5
    3534:	0500           	btst d2,d0
    3536:	0505           	btst d2,d5
    3538:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    353c:	0505           	btst d2,d5
    353e:	0503           	btst d2,d3
    3540:	0205 0507      	andi.b #7,d5
    3544:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    3546:	0505           	btst d2,d5
    3548:	0505           	btst d2,d5
    354a:	0505           	btst d2,d5
    354c:	0505           	btst d2,d5
    354e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3550:	0505           	btst d2,d5
    3552:	0505           	btst d2,d5
    3554:	0505           	btst d2,d5
    3556:	0505           	btst d2,d5
    3558:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    355a:	0505           	btst d2,d5
    355c:	0505           	btst d2,d5
    355e:	0505           	btst d2,d5
    3560:	0505           	btst d2,d5
    3562:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3564:	0505           	btst d2,d5
    3566:	0505           	btst d2,d5
    3568:	0505           	btst d2,d5
    356a:	0505           	btst d2,d5
    356c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    356e:	0505           	btst d2,d5
    3570:	0505           	btst d2,d5
    3572:	0505           	btst d2,d5
    3574:	0505           	btst d2,d5
    3576:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3578:	0505           	btst d2,d5
    357a:	0505           	btst d2,d5
    357c:	0505           	btst d2,d5
    357e:	0505           	btst d2,d5
    3580:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3582:	0505           	btst d2,d5
    3584:	0505           	btst d2,d5
    3586:	0505           	btst d2,d5
    3588:	0505           	btst d2,d5
    358a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    358c:	0505           	btst d2,d5
    358e:	0505           	btst d2,d5
    3590:	0505           	btst d2,d5
    3592:	0505           	btst d2,d5
    3594:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3596:	0505           	btst d2,d5
    3598:	0505           	btst d2,d5
    359a:	0505           	btst d2,d5
    359c:	0505           	btst d2,d5
    359e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    35a0:	0505           	btst d2,d5
    35a2:	0505           	btst d2,d5
    35a4:	0505           	btst d2,d5
    35a6:	0505           	btst d2,d5
    35a8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    35aa:	0505           	btst d2,d5
    35ac:	0505           	btst d2,d5
    35ae:	0505           	btst d2,d5
    35b0:	0505           	btst d2,d5
    35b2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    35b4:	0505           	btst d2,d5
    35b6:	0505           	btst d2,d5
    35b8:	0505           	btst d2,d5
    35ba:	0505           	btst d2,d5
    35bc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    35be:	0505           	btst d2,d5
    35c0:	0505           	btst d2,d5
    35c2:	0505           	btst d2,d5
    35c4:	0505           	btst d2,d5
    35c6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    35c8:	0505           	btst d2,d5
    35ca:	0505           	btst d2,d5
    35cc:	0505           	btst d2,d5
    35ce:	0505           	btst d2,d5
    35d0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    35d2:	0505           	btst d2,d5
    35d4:	0505           	btst d2,d5
    35d6:	0505           	btst d2,d5
    35d8:	0505           	btst d2,d5
    35da:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    35dc:	0505           	btst d2,d5
    35de:	0505           	btst d2,d5
    35e0:	0505           	btst d2,d5
    35e2:	0505           	btst d2,d5
    35e4:	0505           	btst d2,d5

000035e6 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    35e6:	16c0           	move.b d0,(a3)+
  RTS
    35e8:	4e75           	rts

000035ea <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    35ea:	48f9 7fff 0000 	movem.l d0-a6,34b0 <saveregs>
    35f0:	34b0 
  lea 0xdff000,a5
    35f2:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddbcdf>,a5
  move.l sp@(4),a0  //Fontlocation
    35f8:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    35fc:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    3600:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    3604:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    3606:	082d 0006 0002 	btst #6,2(a5)

0000360c <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    360c:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    3612:	66f8           	bne.s 360c <st2wblit>

00003614 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    3614:	7019           	moveq #25,d0
	sub.l d5,d5      
    3616:	9a85           	sub.l d5,d5

00003618 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    3618:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    361a:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    361c:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    3620:	9dce           	suba.l a6,a6
	move.l d2, a6
    3622:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    3624:	ddfc 0000 34ec 	adda.l #13548,a6

	LSL  	#4,d2 	    //Fetch next char
    362a:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    362c:	2842           	movea.l d2,a4


	move.l  #0,d4
    362e:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    3630:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    3632:	3814           	move.w (a4),d4
	swap	d4
    3634:	4844           	swap d4
	lsr.l	d5, d4
    3636:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    3638:	8993           	or.l d4,(a3)
	clr.l	d4
    363a:	4284           	clr.l d4
	move.w  2(a4), d4
    363c:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    3640:	4844           	swap d4
	lsr.l	d5, d4
    3642:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    3644:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    3648:	4284           	clr.l d4
	move.w  4(a4), d4
    364a:	382c 0004      	move.w 4(a4),d4
	swap	d4
    364e:	4844           	swap d4
	lsr.l	d5, d4
    3650:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    3652:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    3656:	4284           	clr.l d4
	move.w  6(a4), d4
    3658:	382c 0006      	move.w 6(a4),d4
	swap	d4
    365c:	4844           	swap d4
	lsr.l	d5, d4
    365e:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    3660:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    3664:	4284           	clr.l d4
	move.w  8(a4), d4
    3666:	382c 0008      	move.w 8(a4),d4
	swap	d4
    366a:	4844           	swap d4
	lsr.l	d5, d4
    366c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    366e:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    3672:	4284           	clr.l d4
	move.w  10(a4), d4
    3674:	382c 000a      	move.w 10(a4),d4
	swap	d4
    3678:	4844           	swap d4
	lsr.l	d5, d4
    367a:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    367c:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    3680:	4284           	clr.l d4
	move.w  12(a4), d4
    3682:	382c 000c      	move.w 12(a4),d4
	swap	d4
    3686:	4844           	swap d4
	lsr.l	d5, d4
    3688:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    368a:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    368e:	4284           	clr.l d4
	move.w  14(a4), d4
    3690:	382c 000e      	move.w 14(a4),d4
	swap	d4
    3694:	4844           	swap d4
	lsr.l	d5, d4
    3696:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    3698:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    369c:	4284           	clr.l d4

	add.b   (a6), d5
    369e:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    36a0:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    36a4:	6500 0006      	bcs.w 36ac <noadditionalchar>
	addq.w  #1, a3
    36a8:	524b           	addq.w #1,a3
	sub.w   #8,d5
    36aa:	5145           	subq.w #8,d5

000036ac <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    36ac:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    36ae:	51c8 ff68      	dbf d0,3618 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    36b2:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    36b6:	51cb ff5c      	dbf d3,3614 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    36ba:	4cfa 7fff fdf2 	movem.l 34b0 <saveregs>(pc),d0-a6

	RTS
    36c0:	4e75           	rts
