
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
       8:	48e7 313a      	movem.l d2-d3/d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       c:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      10:	23ce 0000 79f2 	move.l a6,79f2 <SysBase>
	hw = (struct Custom*)0xdff000;
      16:	23fc 00df f000 	move.l #14675968,79e2 <hw>
      1c:	0000 79e2 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      20:	43f9 0000 5368 	lea 5368 <incbin_swfont_end+0x566>,a1
      26:	7000           	moveq #0,d0
      28:	4eae fdd8      	jsr -552(a6)
      2c:	23c0 0000 79e6 	move.l d0,79e6 <GfxBase>
	if (!GfxBase)
      32:	6700 0758      	beq.w 78c <main+0x786>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      36:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
      3c:	43f9 0000 5379 	lea 5379 <incbin_swfont_end+0x577>,a1
      42:	7000           	moveq #0,d0
      44:	4eae fdd8      	jsr -552(a6)
      48:	23c0 0000 79ee 	move.l d0,79ee <DOSBase>
	if (!DOSBase)
      4e:	6700 0700      	beq.w 750 <main+0x74a>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      52:	4879 0000 5385 	pea 5385 <incbin_swfont_end+0x583>
      58:	4eb9 0000 08aa 	jsr 8aa <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      5e:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
      64:	4eae ffc4      	jsr -60(a6)
      68:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
      6e:	2200           	move.l d0,d1
      70:	243c 0000 53a1 	move.l #21409,d2
      76:	760f           	moveq #15,d3
      78:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      7c:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
      82:	7232           	moveq #50,d1
      84:	4eae ff3a      	jsr -198(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      88:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
      8e:	4eae ffc4      	jsr -60(a6)
      92:	2079 0000 79e2 	movea.l 79e2 <hw>,a0
      98:	2628 0080      	move.l 128(a0),d3
      9c:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
      a2:	2200           	move.l d0,d1
      a4:	243c 0000 53b1 	move.l #21425,d2
      aa:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      ae:	47f9 0000 0c24 	lea c24 <ClBuild>,a3
      b4:	4e93           	jsr (a3)
      b6:	2440           	movea.l d0,a2
      b8:	23c0 0000 79d4 	move.l d0,79d4 <Copperlist1>
  DrawCopper = Copperlist1;
      be:	23c0 0000 79cc 	move.l d0,79cc <DrawCopper>
  Copperlist2 = ClBuild();
      c4:	4e93           	jsr (a3)
      c6:	23c0 0000 79c8 	move.l d0,79c8 <Copperlist2>
  ViewCopper = Copperlist2;
      cc:	23c0 0000 79bc 	move.l d0,79bc <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      d2:	588f           	addq.l #4,sp
      d4:	2012           	move.l (a2),d0
      d6:	b0b9 0000 7630 	cmp.l 7630 <ClsSprites>,d0
      dc:	6600 0606      	bne.w 6e4 <main+0x6de>
      e0:	202a 0004      	move.l 4(a2),d0
      e4:	b0b9 0000 7634 	cmp.l 7634 <ClsSprites+0x4>,d0
      ea:	6600 05f8      	bne.w 6e4 <main+0x6de>
      ee:	202a 0008      	move.l 8(a2),d0
      f2:	b0b9 0000 7638 	cmp.l 7638 <ClsSprites+0x8>,d0
      f8:	6600 05ea      	bne.w 6e4 <main+0x6de>
      fc:	202a 000c      	move.l 12(a2),d0
     100:	b0b9 0000 763c 	cmp.l 763c <ClsSprites+0xc>,d0
     106:	6600 05dc      	bne.w 6e4 <main+0x6de>
     10a:	202a 0010      	move.l 16(a2),d0
     10e:	b0b9 0000 7640 	cmp.l 7640 <ClsSprites+0x10>,d0
     114:	6600 05ce      	bne.w 6e4 <main+0x6de>
     118:	202a 0014      	move.l 20(a2),d0
     11c:	b0b9 0000 7644 	cmp.l 7644 <ClsSprites+0x14>,d0
     122:	6600 05c0      	bne.w 6e4 <main+0x6de>
     126:	202a 0018      	move.l 24(a2),d0
     12a:	b0b9 0000 7648 	cmp.l 7648 <ClsSprites+0x18>,d0
     130:	6600 05b2      	bne.w 6e4 <main+0x6de>
     134:	202a 001c      	move.l 28(a2),d0
     138:	b0b9 0000 764c 	cmp.l 764c <ClsSprites+0x1c>,d0
     13e:	6600 05a4      	bne.w 6e4 <main+0x6de>
     142:	202a 0020      	move.l 32(a2),d0
     146:	b0b9 0000 7650 	cmp.l 7650 <ClsSprites+0x20>,d0
     14c:	6600 0596      	bne.w 6e4 <main+0x6de>
     150:	202a 0024      	move.l 36(a2),d0
     154:	b0b9 0000 7654 	cmp.l 7654 <ClsSprites+0x24>,d0
     15a:	6600 0588      	bne.w 6e4 <main+0x6de>
     15e:	202a 0028      	move.l 40(a2),d0
     162:	b0b9 0000 7658 	cmp.l 7658 <ClsSprites+0x28>,d0
     168:	6600 057a      	bne.w 6e4 <main+0x6de>
     16c:	202a 002c      	move.l 44(a2),d0
     170:	b0b9 0000 765c 	cmp.l 765c <ClsSprites+0x2c>,d0
     176:	6600 056c      	bne.w 6e4 <main+0x6de>
     17a:	202a 0030      	move.l 48(a2),d0
     17e:	b0b9 0000 7660 	cmp.l 7660 <ClsSprites+0x30>,d0
     184:	6600 055e      	bne.w 6e4 <main+0x6de>
     188:	202a 0034      	move.l 52(a2),d0
     18c:	b0b9 0000 7664 	cmp.l 7664 <ClsSprites+0x34>,d0
     192:	6600 0550      	bne.w 6e4 <main+0x6de>
     196:	202a 0038      	move.l 56(a2),d0
     19a:	b0b9 0000 7668 	cmp.l 7668 <ClsSprites+0x38>,d0
     1a0:	6600 0542      	bne.w 6e4 <main+0x6de>
     1a4:	246a 003c      	movea.l 60(a2),a2
     1a8:	b5f9 0000 766c 	cmpa.l 766c <ClsSprites+0x3c>,a2
     1ae:	6600 0534      	bne.w 6e4 <main+0x6de>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1b2:	2079 0000 79d4 	movea.l 79d4 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1b8:	2039 0000 75c8 	move.l 75c8 <ClScreen>,d0
     1be:	b0a8 0040      	cmp.l 64(a0),d0
     1c2:	6600 0542      	bne.w 706 <main+0x700>
     1c6:	2039 0000 75cc 	move.l 75cc <ClScreen+0x4>,d0
     1cc:	b0a8 0044      	cmp.l 68(a0),d0
     1d0:	6600 0534      	bne.w 706 <main+0x700>
     1d4:	2039 0000 75d0 	move.l 75d0 <ClScreen+0x8>,d0
     1da:	b0a8 0048      	cmp.l 72(a0),d0
     1de:	6600 0526      	bne.w 706 <main+0x700>
     1e2:	2028 004c      	move.l 76(a0),d0
     1e6:	b0b9 0000 75d4 	cmp.l 75d4 <ClScreen+0xc>,d0
     1ec:	6600 0518      	bne.w 706 <main+0x700>
     1f0:	2028 0050      	move.l 80(a0),d0
     1f4:	b0b9 0000 75d8 	cmp.l 75d8 <ClScreen+0x10>,d0
     1fa:	6600 050a      	bne.w 706 <main+0x700>
     1fe:	2028 0054      	move.l 84(a0),d0
     202:	b0b9 0000 75dc 	cmp.l 75dc <ClScreen+0x14>,d0
     208:	6600 04fc      	bne.w 706 <main+0x700>
     20c:	2028 0058      	move.l 88(a0),d0
     210:	b0b9 0000 75e0 	cmp.l 75e0 <ClScreen+0x18>,d0
     216:	6600 04ee      	bne.w 706 <main+0x700>
     21a:	2028 005c      	move.l 92(a0),d0
     21e:	b0b9 0000 75e4 	cmp.l 75e4 <ClScreen+0x1c>,d0
     224:	6600 04e0      	bne.w 706 <main+0x700>
     228:	2028 0060      	move.l 96(a0),d0
     22c:	b0b9 0000 75e8 	cmp.l 75e8 <ClScreen+0x20>,d0
     232:	6600 04d2      	bne.w 706 <main+0x700>
     236:	2028 0064      	move.l 100(a0),d0
     23a:	b0b9 0000 75ec 	cmp.l 75ec <ClScreen+0x24>,d0
     240:	6600 04c4      	bne.w 706 <main+0x700>
     244:	2028 0068      	move.l 104(a0),d0
     248:	b0b9 0000 75f0 	cmp.l 75f0 <ClScreen+0x28>,d0
     24e:	6600 04b6      	bne.w 706 <main+0x700>
     252:	2068 006c      	movea.l 108(a0),a0
     256:	b1f9 0000 75f4 	cmpa.l 75f4 <ClScreen+0x2c>,a0
     25c:	6600 04a8      	bne.w 706 <main+0x700>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     260:	23fc 0004 0000 	move.l #262144,79da <DrawBuffer>
     266:	0000 79da 
  ViewBuffer = (ULONG *)0x50000;
     26a:	23fc 0005 0000 	move.l #327680,79d0 <ViewBuffer>
     270:	0000 79d0 
  SetBplPointers();
     274:	45f9 0000 1820 	lea 1820 <SetBplPointers>,a2
     27a:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     27c:	0cb9 0005 0000 	cmpi.l #327680,79da <DrawBuffer>
     282:	0000 79da 
     286:	6700 04d4      	beq.w 75c <main+0x756>
    Write( Output(), 
     28a:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     290:	4eae ffc4      	jsr -60(a6)
     294:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     29a:	2200           	move.l d0,d1
     29c:	243c 0000 53b4 	move.l #21428,d2
     2a2:	763b           	moveq #59,d3
     2a4:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     2a8:	2079 0000 79d4 	movea.l 79d4 <Copperlist1>,a0
     2ae:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2b4:	0070 
     2b6:	6724           	beq.s 2dc <main+0x2d6>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2b8:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     2be:	4eae ffc4      	jsr -60(a6)
     2c2:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     2c8:	2200           	move.l d0,d1
     2ca:	243c 0000 5023 	move.l #20515,d2
     2d0:	763c           	moveq #60,d3
     2d2:	4eae ffd0      	jsr -48(a6)
     2d6:	2079 0000 79d4 	movea.l 79d4 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2dc:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2e2:	0074 
     2e4:	6724           	beq.s 30a <main+0x304>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2e6:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     2ec:	4eae ffc4      	jsr -60(a6)
     2f0:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     2f6:	2200           	move.l d0,d1
     2f8:	243c 0000 5060 	move.l #20576,d2
     2fe:	763c           	moveq #60,d3
     300:	4eae ffd0      	jsr -48(a6)
     304:	2079 0000 79d4 	movea.l 79d4 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     30a:	2028 0078      	move.l 120(a0),d0
     30e:	b0b9 0000 75f8 	cmp.l 75f8 <ClColor>,d0
     314:	6600 04a0      	bne.w 7b6 <main+0x7b0>
     318:	2028 007c      	move.l 124(a0),d0
     31c:	b0b9 0000 75fc 	cmp.l 75fc <ClColor+0x4>,d0
     322:	6600 0492      	bne.w 7b6 <main+0x7b0>
  if( instructions[pos] == value ) 
     326:	70fe           	moveq #-2,d0
     328:	b0a8 0080      	cmp.l 128(a0),d0
     32c:	671e           	beq.s 34c <main+0x346>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     32e:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     334:	4eae ffc4      	jsr -60(a6)
     338:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     33e:	2200           	move.l d0,d1
     340:	243c 0000 5188 	move.l #20872,d2
     346:	7622           	moveq #34,d3
     348:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     34c:	47f9 0000 1618 	lea 1618 <SwapCl>,a3
     352:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     354:	2039 0000 79cc 	move.l 79cc <DrawCopper>,d0
     35a:	b0b9 0000 79c8 	cmp.l 79c8 <Copperlist2>,d0
     360:	671e           	beq.s 380 <main+0x37a>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     362:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     368:	4eae ffc4      	jsr -60(a6)
     36c:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     372:	2200           	move.l d0,d1
     374:	243c 0000 53f0 	move.l #21488,d2
     37a:	7615           	moveq #21,d3
     37c:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     380:	49f9 0000 184c 	lea 184c <PrepareDisplay>,a4
     386:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     388:	2039 0000 79da 	move.l 79da <DrawBuffer>,d0
     38e:	b0b9 0000 79c4 	cmp.l 79c4 <Bitplane1>,d0
     394:	671e           	beq.s 3b4 <main+0x3ae>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     396:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     39c:	4eae ffc4      	jsr -60(a6)
     3a0:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     3a6:	2200           	move.l d0,d1
     3a8:	243c 0000 5406 	move.l #21510,d2
     3ae:	7637           	moveq #55,d3
     3b0:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3b4:	2039 0000 79cc 	move.l 79cc <DrawCopper>,d0
     3ba:	b0b9 0000 79d4 	cmp.l 79d4 <Copperlist1>,d0
     3c0:	671e           	beq.s 3e0 <main+0x3da>
    Write( Output(), 
     3c2:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     3c8:	4eae ffc4      	jsr -60(a6)
     3cc:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     3d2:	2200           	move.l d0,d1
     3d4:	243c 0000 543e 	move.l #21566,d2
     3da:	7639           	moveq #57,d3
     3dc:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3e0:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3e2:	2039 0000 79d0 	move.l 79d0 <ViewBuffer>,d0
     3e8:	b0b9 0000 79c0 	cmp.l 79c0 <Bitplane2>,d0
     3ee:	671e           	beq.s 40e <main+0x408>
    Write( Output(), 
     3f0:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     3f6:	4eae ffc4      	jsr -60(a6)
     3fa:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     400:	2200           	move.l d0,d1
     402:	243c 0000 5478 	move.l #21624,d2
     408:	7638           	moveq #56,d3
     40a:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     40e:	2039 0000 79bc 	move.l 79bc <ViewCopper>,d0
     414:	b0b9 0000 79c8 	cmp.l 79c8 <Copperlist2>,d0
     41a:	671e           	beq.s 43a <main+0x434>
    Write( Output(), 
     41c:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     422:	4eae ffc4      	jsr -60(a6)
     426:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     42c:	2200           	move.l d0,d1
     42e:	243c 0000 54b1 	move.l #21681,d2
     434:	763a           	moveq #58,d3
     436:	4eae ffd0      	jsr -48(a6)
	SetInterruptHandler((APTR)interruptHandler);
}

void RunFrame() {
  //TestZoomSpeed();
  SwapCl();
     43a:	4e93           	jsr (a3)
  SetBplPointers();
     43c:	4e92           	jsr (a2)
             "PrepareDisplay: ViewCopper should be set to Copperlist 2.\n", 58);

  RunFrame();
  UWORD *copword = ViewCopper;
     43e:	2079 0000 79bc 	movea.l 79bc <ViewCopper>,a0
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     444:	7000           	moveq #0,d0
     446:	3028 0072      	move.w 114(a0),d0
     44a:	4840           	swap d0
     44c:	4240           	clr.w d0
     44e:	7200           	moveq #0,d1
     450:	3228 0076      	move.w 118(a0),d1
     454:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     456:	b0b9 0000 79c0 	cmp.l 79c0 <Bitplane2>,d0
     45c:	671e           	beq.s 47c <main+0x476>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     45e:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     464:	4eae ffc4      	jsr -60(a6)
     468:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     46e:	2200           	move.l d0,d1
     470:	243c 0000 54ec 	move.l #21740,d2
     476:	7648           	moveq #72,d3
     478:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     47c:	4e93           	jsr (a3)
  SetBplPointers();
     47e:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     480:	2079 0000 79bc 	movea.l 79bc <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     486:	7000           	moveq #0,d0
     488:	3028 0072      	move.w 114(a0),d0
     48c:	4840           	swap d0
     48e:	4240           	clr.w d0
     490:	7200           	moveq #0,d1
     492:	3228 0076      	move.w 118(a0),d1
     496:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     498:	b0b9 0000 79c4 	cmp.l 79c4 <Bitplane1>,d0
     49e:	671e           	beq.s 4be <main+0x4b8>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     4a0:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     4a6:	4eae ffc4      	jsr -60(a6)
     4aa:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     4b0:	2200           	move.l d0,d1
     4b2:	243c 0000 5535 	move.l #21813,d2
     4b8:	7649           	moveq #73,d3
     4ba:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4be:	4e93           	jsr (a3)
  SetBplPointers();
     4c0:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4c2:	2079 0000 79bc 	movea.l 79bc <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     4c8:	7000           	moveq #0,d0
     4ca:	3028 0072      	move.w 114(a0),d0
     4ce:	4840           	swap d0
     4d0:	4240           	clr.w d0
     4d2:	7200           	moveq #0,d1
     4d4:	3228 0076      	move.w 118(a0),d1
     4d8:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4da:	b0b9 0000 79c0 	cmp.l 79c0 <Bitplane2>,d0
     4e0:	671e           	beq.s 500 <main+0x4fa>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4e2:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     4e8:	4eae ffc4      	jsr -60(a6)
     4ec:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     4f2:	2200           	move.l d0,d1
     4f4:	243c 0000 557f 	move.l #21887,d2
     4fa:	7648           	moveq #72,d3
     4fc:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     500:	2f3c 0000 c800 	move.l #51200,-(sp)
     506:	4878 0084      	pea 84 <main+0x7e>
     50a:	4eb9 0000 198a 	jsr 198a <FreeDisplay>
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    ZoomTest();
     510:	4eb9 0000 1a42 	jsr 1a42 <ZoomTest>

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
     516:	247c 00f0 ff60 	movea.l #15794016,a2
     51c:	508f           	addq.l #8,sp
     51e:	4a92           	tst.l (a2)
     520:	6718           	beq.s 53a <main+0x534>
     522:	4878 0001      	pea 1 <_start+0x1>
     526:	47f9 0000 0808 	lea 808 <warpmode.part.0>,a3
     52c:	4e93           	jsr (a3)
     52e:	588f           	addq.l #4,sp
     530:	4a92           	tst.l (a2)
     532:	6706           	beq.s 53a <main+0x534>
     534:	42a7           	clr.l -(sp)
     536:	4e93           	jsr (a3)
     538:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
     53a:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
     540:	23ee 0022 0000 	move.l 34(a6),79a8 <ActiView>
     546:	79a8 
	OwnBlitter();
     548:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     54c:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
     552:	4eae ff1c      	jsr -228(a6)
	Disable();
     556:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
     55c:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     560:	2679 0000 79e2 	movea.l 79e2 <hw>,a3
     566:	302b 0010      	move.w 16(a3),d0
     56a:	33c0 0000 79ac 	move.w d0,79ac <SystemADKCON>
	SystemInts=hw->intenar;
     570:	302b 001c      	move.w 28(a3),d0
     574:	33c0 0000 79b0 	move.w d0,79b0 <SystemInts>
	SystemDMA=hw->dmaconr;
     57a:	302b 0002      	move.w 2(a3),d0
     57e:	33c0 0000 79ae 	move.w d0,79ae <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     584:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     58a:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     590:	45f9 0000 19fc 	lea 19fc <WaitVbl>,a2
     596:	4e92           	jsr (a2)
	WaitVbl();
     598:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     59a:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     5a0:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
     5a6:	93c9           	suba.l a1,a1
     5a8:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     5ac:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
     5b2:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     5b6:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
     5bc:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     5c0:	4e92           	jsr (a2)
	WaitVbl();
     5c2:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     5c4:	3f7c 4e7a 001e 	move.w #20090,30(sp)
     5ca:	3f7c 0801 0020 	move.w #2049,32(sp)
     5d0:	3f7c 4e73 0022 	move.w #20083,34(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     5d6:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
     5dc:	082e 0000 0129 	btst #0,297(a6)
     5e2:	6700 01fa      	beq.w 7de <main+0x7d8>
		vbr = (APTR)Supervisor((void*)getvbr);
     5e6:	7e1e           	moveq #30,d7
     5e8:	de8f           	add.l sp,d7
     5ea:	cf8d           	exg d7,a5
     5ec:	4eae ffe2      	jsr -30(a6)
     5f0:	cf8d           	exg d7,a5

	VBR=GetVBR();
     5f2:	23c0 0000 79b2 	move.l d0,79b2 <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     5f8:	2079 0000 79b2 	movea.l 79b2 <VBR.lto_priv.3>,a0
     5fe:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     602:	23cb 0000 79b6 	move.l a3,79b6 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
     608:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
     60a:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     60c:	2079 0000 79e2 	movea.l 79e2 <hw>,a0
     612:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     616:	3028 0002      	move.w 2(a0),d0
     61a:	0800 000e      	btst #14,d0
     61e:	66f6           	bne.s 616 <main+0x610>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
     620:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     626:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
     62c:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     632:	2279 0000 79b2 	movea.l 79b2 <VBR.lto_priv.3>,a1
     638:	234b 006c      	move.l a3,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     63c:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
     642:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     648:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     64e:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     654:	3039 0000 79b0 	move.w 79b0 <SystemInts>,d0
     65a:	0040 8000      	ori.w #-32768,d0
     65e:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     662:	3039 0000 79ae 	move.w 79ae <SystemDMA>,d0
     668:	0040 8000      	ori.w #-32768,d0
     66c:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     670:	3039 0000 79ac 	move.w 79ac <SystemADKCON>,d0
     676:	0040 8000      	ori.w #-32768,d0
     67a:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     67e:	2279 0000 79a8 	movea.l 79a8 <ActiView>,a1
     684:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     688:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
     68e:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     692:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
     698:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     69c:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
     6a2:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     6a6:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
     6ac:	4eae fe32      	jsr -462(a6)
	Enable();
     6b0:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
     6b6:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     6ba:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
     6c0:	2279 0000 79ee 	movea.l 79ee <DOSBase>,a1
     6c6:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     6ca:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
     6d0:	2279 0000 79e6 	movea.l 79e6 <GfxBase>,a1
     6d6:	4eae fe62      	jsr -414(a6)
}
     6da:	7000           	moveq #0,d0
     6dc:	4cdf 5c8c      	movem.l (sp)+,d2-d3/d7/a2-a4/a6
     6e0:	508f           	addq.l #8,sp
     6e2:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     6e4:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     6ea:	4eae ffc4      	jsr -60(a6)
     6ee:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     6f4:	2200           	move.l d0,d1
     6f6:	243c 0000 4fb6 	move.l #20406,d2
     6fc:	762c           	moveq #44,d3
     6fe:	4eae ffd0      	jsr -48(a6)
     702:	6000 faae      	bra.w 1b2 <main+0x1ac>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     706:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     70c:	4eae ffc4      	jsr -60(a6)
     710:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     716:	2200           	move.l d0,d1
     718:	243c 0000 4fec 	move.l #20460,d2
     71e:	7636           	moveq #54,d3
     720:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
     724:	23fc 0004 0000 	move.l #262144,79da <DrawBuffer>
     72a:	0000 79da 
  ViewBuffer = (ULONG *)0x50000;
     72e:	23fc 0005 0000 	move.l #327680,79d0 <ViewBuffer>
     734:	0000 79d0 
  SetBplPointers();
     738:	45f9 0000 1820 	lea 1820 <SetBplPointers>,a2
     73e:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     740:	0cb9 0005 0000 	cmpi.l #327680,79da <DrawBuffer>
     746:	0000 79da 
     74a:	6600 fb3e      	bne.w 28a <main+0x284>
     74e:	600c           	bra.s 75c <main+0x756>
		Exit(0);
     750:	9dce           	suba.l a6,a6
     752:	7200           	moveq #0,d1
     754:	4eae ff70      	jsr -144(a6)
     758:	6000 f8f8      	bra.w 52 <main+0x4c>
     75c:	0cb9 0004 0000 	cmpi.l #262144,79d0 <ViewBuffer>
     762:	0000 79d0 
     766:	6700 fb40      	beq.w 2a8 <main+0x2a2>
    Write( Output(), 
     76a:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     770:	4eae ffc4      	jsr -60(a6)
     774:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     77a:	2200           	move.l d0,d1
     77c:	243c 0000 53b4 	move.l #21428,d2
     782:	763b           	moveq #59,d3
     784:	4eae ffd0      	jsr -48(a6)
     788:	6000 fb1e      	bra.w 2a8 <main+0x2a2>
		Exit(0);
     78c:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     792:	7200           	moveq #0,d1
     794:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     798:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
     79e:	43f9 0000 5379 	lea 5379 <incbin_swfont_end+0x577>,a1
     7a4:	7000           	moveq #0,d0
     7a6:	4eae fdd8      	jsr -552(a6)
     7aa:	23c0 0000 79ee 	move.l d0,79ee <DOSBase>
	if (!DOSBase)
     7b0:	6600 f8a0      	bne.w 52 <main+0x4c>
     7b4:	609a           	bra.s 750 <main+0x74a>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     7b6:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     7bc:	4eae ffc4      	jsr -60(a6)
     7c0:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     7c6:	2200           	move.l d0,d1
     7c8:	243c 0000 5117 	move.l #20759,d2
     7ce:	7621           	moveq #33,d3
     7d0:	4eae ffd0      	jsr -48(a6)
     7d4:	2079 0000 79d4 	movea.l 79d4 <Copperlist1>,a0
     7da:	6000 fb4a      	bra.w 326 <main+0x320>
	APTR vbr = 0;
     7de:	7000           	moveq #0,d0
	VBR=GetVBR();
     7e0:	23c0 0000 79b2 	move.l d0,79b2 <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     7e6:	2079 0000 79b2 	movea.l 79b2 <VBR.lto_priv.3>,a0
     7ec:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     7f0:	23cb 0000 79b6 	move.l a3,79b6 <SystemIrq>
	WaitVbl();
     7f6:	4e92           	jsr (a2)
	WaitVbl();
     7f8:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     7fa:	2079 0000 79e2 	movea.l 79e2 <hw>,a0
     800:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     804:	6000 fe10      	bra.w 616 <main+0x610>

00000808 <warpmode.part.0>:
void warpmode(int on) 
     808:	598f           	subq.l #4,sp
     80a:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     80c:	4aaf 000c      	tst.l 12(sp)
     810:	674c           	beq.s 85e <warpmode.part.0+0x56>
     812:	4878 0001      	pea 1 <_start+0x1>
     816:	740b           	moveq #11,d2
     818:	d48f           	add.l sp,d2
     81a:	2f02           	move.l d2,-(sp)
     81c:	42a7           	clr.l -(sp)
     81e:	4879 0000 4e36 	pea 4e36 <incbin_swfont_end+0x34>
     824:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc519>
     828:	4878 0052      	pea 52 <main+0x4c>
     82c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec47a>
     832:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     836:	203c 0000 4e1c 	move.l #19996,d0
     83c:	4878 0001      	pea 1 <_start+0x1>
     840:	2f02           	move.l d2,-(sp)
     842:	42a7           	clr.l -(sp)
     844:	2f00           	move.l d0,-(sp)
     846:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc519>
     84a:	4878 0052      	pea 52 <main+0x4c>
     84e:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec47a>
	}
}
     854:	4fef 0018      	lea 24(sp),sp
     858:	241f           	move.l (sp)+,d2
     85a:	588f           	addq.l #4,sp
     85c:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     85e:	4878 0001      	pea 1 <_start+0x1>
     862:	740b           	moveq #11,d2
     864:	d48f           	add.l sp,d2
     866:	2f02           	move.l d2,-(sp)
     868:	42a7           	clr.l -(sp)
     86a:	4879 0000 4e40 	pea 4e40 <incbin_swfont_end+0x3e>
     870:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc519>
     874:	4878 0052      	pea 52 <main+0x4c>
     878:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec47a>
     87e:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     882:	203c 0000 4e03 	move.l #19971,d0
     888:	4878 0001      	pea 1 <_start+0x1>
     88c:	2f02           	move.l d2,-(sp)
     88e:	42a7           	clr.l -(sp)
     890:	2f00           	move.l d0,-(sp)
     892:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc519>
     896:	4878 0052      	pea 52 <main+0x4c>
     89a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec47a>
}
     8a0:	4fef 0018      	lea 24(sp),sp
     8a4:	241f           	move.l (sp)+,d2
     8a6:	588f           	addq.l #4,sp
     8a8:	4e75           	rts

000008aa <KPrintF>:
{
     8aa:	4fef ff80      	lea -128(sp),sp
     8ae:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
     8b2:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeec47a>
     8b8:	6734           	beq.s 8ee <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     8ba:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
     8c0:	206f 0090      	movea.l 144(sp),a0
     8c4:	43ef 0094      	lea 148(sp),a1
     8c8:	45f9 0000 463c 	lea 463c <PutChar>,a2
     8ce:	47ef 000c      	lea 12(sp),a3
     8d2:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     8d6:	2f0b           	move.l a3,-(sp)
     8d8:	4878 0056      	pea 56 <main+0x50>
     8dc:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec47a>
     8e2:	508f           	addq.l #8,sp
}
     8e4:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     8e8:	4fef 0080      	lea 128(sp),sp
     8ec:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     8ee:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
     8f4:	206f 0090      	movea.l 144(sp),a0
     8f8:	43ef 0094      	lea 148(sp),a1
     8fc:	45f9 0000 462e 	lea 462e <KPutCharX>,a2
     902:	97cb           	suba.l a3,a3
     904:	4eae fdf6      	jsr -522(a6)
}
     908:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     90c:	4fef 0080      	lea 128(sp),sp
     910:	4e75           	rts

00000912 <TestRow>:
  mask = mask ^ 0xffff;

}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
     912:	4fef ff94      	lea -108(sp),sp
     916:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
     91a:	2f6f 00a4 002c 	move.l 164(sp),44(sp)
     920:	3c2f 002e      	move.w 46(sp),d6
  
  char str[ 100] = { 0 };
     924:	7a34           	moveq #52,d5
     926:	da8f           	add.l sp,d5
     928:	4878 0064      	pea 64 <main+0x5e>
     92c:	42a7           	clr.l -(sp)
     92e:	2f05           	move.l d5,-(sp)
     930:	4eba 3b1e      	jsr 4450 <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
     934:	3f6f 00b6 003e 	move.w 182(sp),62(sp)
     93a:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
     93e:	2a6f 00a0      	movea.l 160(sp),a5
  testpattern += 0;
     942:	286f 009c      	movea.l 156(sp),a4

  for(int i=0;i<21;i++) {
     946:	7800           	moveq #0,d4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     948:	2e3c 0000 4e4b 	move.l #20043,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
     94e:	301c           	move.w (a4)+,d0
     950:	bd40           	eor.w d6,d0
     952:	b05d           	cmp.w (a5)+,d0
     954:	6736           	beq.s 98c <TestRow+0x7a>
      data[0] = i;
     956:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     95a:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
     960:	2047           	movea.l d7,a0
     962:	43ef 0030      	lea 48(sp),a1
     966:	45f9 0000 463c 	lea 463c <PutChar>,a2
     96c:	2645           	movea.l d5,a3
     96e:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
     972:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     978:	4eae ffc4      	jsr -60(a6)
     97c:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     982:	2200           	move.l d0,d1
     984:	2405           	move.l d5,d2
     986:	7664           	moveq #100,d3
     988:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
     98c:	5284           	addq.l #1,d4
     98e:	7015           	moveq #21,d0
     990:	b084           	cmp.l d4,d0
     992:	66ba           	bne.s 94e <TestRow+0x3c>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
     994:	206f 00a0      	movea.l 160(sp),a0
     998:	3028 002a      	move.w 42(a0),d0
     99c:	322f 002e      	move.w 46(sp),d1
     9a0:	b340           	eor.w d1,d0
     9a2:	206f 009c      	movea.l 156(sp),a0
     9a6:	3228 002a      	move.w 42(a0),d1
     9aa:	b340           	eor.w d1,d0
     9ac:	0240 ff00      	andi.w #-256,d0
     9b0:	660a           	bne.s 9bc <TestRow+0xaa>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
     9b2:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     9b6:	4fef 006c      	lea 108(sp),sp
     9ba:	4e75           	rts
    data[0] = 21;
     9bc:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
     9c2:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
     9c8:	41f9 0000 4e4b 	lea 4e4b <incbin_swfont_end+0x49>,a0
     9ce:	43ef 0030      	lea 48(sp),a1
     9d2:	45f9 0000 463c 	lea 463c <PutChar>,a2
     9d8:	47ef 0034      	lea 52(sp),a3
     9dc:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
     9e0:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     9e6:	4eae ffc4      	jsr -60(a6)
     9ea:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     9f0:	2200           	move.l d0,d1
     9f2:	240b           	move.l a3,d2
     9f4:	7664           	moveq #100,d3
     9f6:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
     9fa:	206f 00a0      	movea.l 160(sp),a0
     9fe:	7000           	moveq #0,d0
     a00:	3028 002a      	move.w 42(a0),d0
     a04:	2f00           	move.l d0,-(sp)
     a06:	206f 00a0      	movea.l 160(sp),a0
     a0a:	3028 002a      	move.w 42(a0),d0
     a0e:	2f00           	move.l d0,-(sp)
     a10:	4879 0000 4e7b 	pea 4e7b <incbin_swfont_end+0x79>
     a16:	4eba fe92      	jsr 8aa <KPrintF>(pc)
     a1a:	4fef 000c      	lea 12(sp),sp
}
     a1e:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     a22:	4fef 006c      	lea 108(sp),sp
     a26:	4e75           	rts

00000a28 <Vblankcounter>:
  Counter4Frames++;
     a28:	52b9 0000 79ea 	addq.l #1,79ea <Counter4Frames>
}
     a2e:	4e75           	rts

00000a30 <TestCopperlistPos>:
  if( instructions[pos] == value ) 
     a30:	202f 0008      	move.l 8(sp),d0
     a34:	d080           	add.l d0,d0
     a36:	d080           	add.l d0,d0
     a38:	206f 0004      	movea.l 4(sp),a0
     a3c:	2030 0800      	move.l (0,a0,d0.l),d0
     a40:	b0af 000c      	cmp.l 12(sp),d0
     a44:	57c0           	seq d0
     a46:	4880           	ext.w d0
     a48:	48c0           	ext.l d0
}
     a4a:	4480           	neg.l d0
     a4c:	4e75           	rts

00000a4e <TestCopperlistBatch>:
                                                                  long length) {
     a4e:	48e7 2030      	movem.l d2/a2-a3,-(sp)
     a52:	246f 0010      	movea.l 16(sp),a2
     a56:	206f 0014      	movea.l 20(sp),a0
     a5a:	226f 0018      	movea.l 24(sp),a1
     a5e:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
     a62:	2008           	move.l a0,d0
     a64:	d088           	add.l a0,d0
     a66:	d080           	add.l d0,d0
     a68:	2411           	move.l (a1),d2
     a6a:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
     a6e:	6600 01ac      	bne.w c1c <TestCopperlistBatch+0x1ce>
     a72:	2008           	move.l a0,d0
     a74:	5280           	addq.l #1,d0
     a76:	d080           	add.l d0,d0
     a78:	d080           	add.l d0,d0
     a7a:	2032 0800      	move.l (0,a2,d0.l),d0
     a7e:	b0a9 0004      	cmp.l 4(a1),d0
     a82:	6600 0198      	bne.w c1c <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     a86:	7002           	moveq #2,d0
     a88:	b081           	cmp.l d1,d0
     a8a:	6700 0188      	beq.w c14 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     a8e:	2008           	move.l a0,d0
     a90:	5480           	addq.l #2,d0
     a92:	d080           	add.l d0,d0
     a94:	d080           	add.l d0,d0
     a96:	2032 0800      	move.l (0,a2,d0.l),d0
     a9a:	b0a9 0008      	cmp.l 8(a1),d0
     a9e:	6600 017c      	bne.w c1c <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     aa2:	7403           	moveq #3,d2
     aa4:	b481           	cmp.l d1,d2
     aa6:	6700 016c      	beq.w c14 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     aaa:	2008           	move.l a0,d0
     aac:	5680           	addq.l #3,d0
     aae:	d080           	add.l d0,d0
     ab0:	d080           	add.l d0,d0
     ab2:	2032 0800      	move.l (0,a2,d0.l),d0
     ab6:	b0a9 000c      	cmp.l 12(a1),d0
     aba:	6600 0160      	bne.w c1c <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     abe:	7004           	moveq #4,d0
     ac0:	b081           	cmp.l d1,d0
     ac2:	6700 0150      	beq.w c14 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     ac6:	2008           	move.l a0,d0
     ac8:	5880           	addq.l #4,d0
     aca:	d080           	add.l d0,d0
     acc:	d080           	add.l d0,d0
     ace:	2032 0800      	move.l (0,a2,d0.l),d0
     ad2:	b0a9 0010      	cmp.l 16(a1),d0
     ad6:	6600 0144      	bne.w c1c <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     ada:	7405           	moveq #5,d2
     adc:	b481           	cmp.l d1,d2
     ade:	6700 0134      	beq.w c14 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     ae2:	2008           	move.l a0,d0
     ae4:	5a80           	addq.l #5,d0
     ae6:	d080           	add.l d0,d0
     ae8:	d080           	add.l d0,d0
     aea:	2032 0800      	move.l (0,a2,d0.l),d0
     aee:	b0a9 0014      	cmp.l 20(a1),d0
     af2:	6600 0128      	bne.w c1c <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     af6:	7006           	moveq #6,d0
     af8:	b081           	cmp.l d1,d0
     afa:	6700 0118      	beq.w c14 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     afe:	2008           	move.l a0,d0
     b00:	5c80           	addq.l #6,d0
     b02:	d080           	add.l d0,d0
     b04:	d080           	add.l d0,d0
     b06:	2032 0800      	move.l (0,a2,d0.l),d0
     b0a:	b0a9 0018      	cmp.l 24(a1),d0
     b0e:	6600 010c      	bne.w c1c <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     b12:	7407           	moveq #7,d2
     b14:	b481           	cmp.l d1,d2
     b16:	6700 00fc      	beq.w c14 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     b1a:	2008           	move.l a0,d0
     b1c:	5e80           	addq.l #7,d0
     b1e:	d080           	add.l d0,d0
     b20:	d080           	add.l d0,d0
     b22:	2032 0800      	move.l (0,a2,d0.l),d0
     b26:	b0a9 001c      	cmp.l 28(a1),d0
     b2a:	6600 00f0      	bne.w c1c <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     b2e:	7008           	moveq #8,d0
     b30:	b081           	cmp.l d1,d0
     b32:	6700 00e0      	beq.w c14 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     b36:	2008           	move.l a0,d0
     b38:	5080           	addq.l #8,d0
     b3a:	d080           	add.l d0,d0
     b3c:	d080           	add.l d0,d0
     b3e:	2032 0800      	move.l (0,a2,d0.l),d0
     b42:	b0a9 0020      	cmp.l 32(a1),d0
     b46:	6600 00d4      	bne.w c1c <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     b4a:	7409           	moveq #9,d2
     b4c:	b481           	cmp.l d1,d2
     b4e:	6700 00c4      	beq.w c14 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     b52:	47e8 0009      	lea 9(a0),a3
     b56:	200b           	move.l a3,d0
     b58:	d08b           	add.l a3,d0
     b5a:	d080           	add.l d0,d0
     b5c:	2032 0800      	move.l (0,a2,d0.l),d0
     b60:	b0a9 0024      	cmp.l 36(a1),d0
     b64:	6600 00b6      	bne.w c1c <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     b68:	700a           	moveq #10,d0
     b6a:	b081           	cmp.l d1,d0
     b6c:	6700 00a6      	beq.w c14 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     b70:	47e8 000a      	lea 10(a0),a3
     b74:	200b           	move.l a3,d0
     b76:	d08b           	add.l a3,d0
     b78:	d080           	add.l d0,d0
     b7a:	2032 0800      	move.l (0,a2,d0.l),d0
     b7e:	b0a9 0028      	cmp.l 40(a1),d0
     b82:	6600 0098      	bne.w c1c <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     b86:	740b           	moveq #11,d2
     b88:	b481           	cmp.l d1,d2
     b8a:	6700 0088      	beq.w c14 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     b8e:	47e8 000b      	lea 11(a0),a3
     b92:	200b           	move.l a3,d0
     b94:	d08b           	add.l a3,d0
     b96:	d080           	add.l d0,d0
     b98:	2032 0800      	move.l (0,a2,d0.l),d0
     b9c:	b0a9 002c      	cmp.l 44(a1),d0
     ba0:	667a           	bne.s c1c <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     ba2:	700c           	moveq #12,d0
     ba4:	b081           	cmp.l d1,d0
     ba6:	676c           	beq.s c14 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     ba8:	47e8 000c      	lea 12(a0),a3
     bac:	200b           	move.l a3,d0
     bae:	d08b           	add.l a3,d0
     bb0:	d080           	add.l d0,d0
     bb2:	2032 0800      	move.l (0,a2,d0.l),d0
     bb6:	b0a9 0030      	cmp.l 48(a1),d0
     bba:	6660           	bne.s c1c <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     bbc:	740d           	moveq #13,d2
     bbe:	b481           	cmp.l d1,d2
     bc0:	6752           	beq.s c14 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     bc2:	47e8 000d      	lea 13(a0),a3
     bc6:	200b           	move.l a3,d0
     bc8:	d08b           	add.l a3,d0
     bca:	d080           	add.l d0,d0
     bcc:	2032 0800      	move.l (0,a2,d0.l),d0
     bd0:	b0a9 0034      	cmp.l 52(a1),d0
     bd4:	6646           	bne.s c1c <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     bd6:	700e           	moveq #14,d0
     bd8:	b081           	cmp.l d1,d0
     bda:	6738           	beq.s c14 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     bdc:	47e8 000e      	lea 14(a0),a3
     be0:	200b           	move.l a3,d0
     be2:	d08b           	add.l a3,d0
     be4:	d080           	add.l d0,d0
     be6:	2032 0800      	move.l (0,a2,d0.l),d0
     bea:	b0a9 0038      	cmp.l 56(a1),d0
     bee:	662c           	bne.s c1c <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     bf0:	7410           	moveq #16,d2
     bf2:	b481           	cmp.l d1,d2
     bf4:	661e           	bne.s c14 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     bf6:	41e8 000f      	lea 15(a0),a0
     bfa:	d1c8           	adda.l a0,a0
     bfc:	d1c8           	adda.l a0,a0
     bfe:	2070 a800      	movea.l (0,a0,a2.l),a0
     c02:	b1e9 003c      	cmpa.l 60(a1),a0
     c06:	57c0           	seq d0
     c08:	4880           	ext.w d0
     c0a:	48c0           	ext.l d0
     c0c:	4480           	neg.l d0
}
     c0e:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     c12:	4e75           	rts
  return 1;
     c14:	7001           	moveq #1,d0
}
     c16:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     c1a:	4e75           	rts
      return 0;
     c1c:	7000           	moveq #0,d0
}
     c1e:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     c22:	4e75           	rts

00000c24 <ClBuild>:
ULONG * ClBuild() {
     c24:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
     c28:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
     c2e:	707b           	moveq #123,d0
     c30:	4600           	not.b d0
     c32:	7202           	moveq #2,d1
     c34:	4eae ff3a      	jsr -198(a6)
     c38:	2440           	movea.l d0,a2
  if( retval == 0) {
     c3a:	4a80           	tst.l d0
     c3c:	6700 010e      	beq.w d4c <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
     c40:	24b9 0000 7630 	move.l 7630 <ClsSprites>,(a2)
     c46:	2579 0000 7634 	move.l 7634 <ClsSprites+0x4>,4(a2)
     c4c:	0004 
     c4e:	2579 0000 7638 	move.l 7638 <ClsSprites+0x8>,8(a2)
     c54:	0008 
     c56:	2579 0000 763c 	move.l 763c <ClsSprites+0xc>,12(a2)
     c5c:	000c 
     c5e:	2579 0000 7640 	move.l 7640 <ClsSprites+0x10>,16(a2)
     c64:	0010 
     c66:	2579 0000 7644 	move.l 7644 <ClsSprites+0x14>,20(a2)
     c6c:	0014 
     c6e:	2579 0000 7648 	move.l 7648 <ClsSprites+0x18>,24(a2)
     c74:	0018 
     c76:	2579 0000 764c 	move.l 764c <ClsSprites+0x1c>,28(a2)
     c7c:	001c 
     c7e:	2579 0000 7650 	move.l 7650 <ClsSprites+0x20>,32(a2)
     c84:	0020 
     c86:	2579 0000 7654 	move.l 7654 <ClsSprites+0x24>,36(a2)
     c8c:	0024 
     c8e:	2579 0000 7658 	move.l 7658 <ClsSprites+0x28>,40(a2)
     c94:	0028 
     c96:	2579 0000 765c 	move.l 765c <ClsSprites+0x2c>,44(a2)
     c9c:	002c 
     c9e:	2579 0000 7660 	move.l 7660 <ClsSprites+0x30>,48(a2)
     ca4:	0030 
     ca6:	2579 0000 7664 	move.l 7664 <ClsSprites+0x34>,52(a2)
     cac:	0034 
     cae:	2579 0000 7668 	move.l 7668 <ClsSprites+0x38>,56(a2)
     cb4:	0038 
     cb6:	2579 0000 766c 	move.l 766c <ClsSprites+0x3c>,60(a2)
     cbc:	003c 
    *cl++ = *clpartinstruction++;
     cbe:	2579 0000 75c8 	move.l 75c8 <ClScreen>,64(a2)
     cc4:	0040 
     cc6:	2579 0000 75cc 	move.l 75cc <ClScreen+0x4>,68(a2)
     ccc:	0044 
     cce:	2579 0000 75d0 	move.l 75d0 <ClScreen+0x8>,72(a2)
     cd4:	0048 
     cd6:	2579 0000 75d4 	move.l 75d4 <ClScreen+0xc>,76(a2)
     cdc:	004c 
     cde:	2579 0000 75d8 	move.l 75d8 <ClScreen+0x10>,80(a2)
     ce4:	0050 
     ce6:	2579 0000 75dc 	move.l 75dc <ClScreen+0x14>,84(a2)
     cec:	0054 
     cee:	2579 0000 75e0 	move.l 75e0 <ClScreen+0x18>,88(a2)
     cf4:	0058 
     cf6:	2579 0000 75e4 	move.l 75e4 <ClScreen+0x1c>,92(a2)
     cfc:	005c 
     cfe:	2579 0000 75e8 	move.l 75e8 <ClScreen+0x20>,96(a2)
     d04:	0060 
     d06:	2579 0000 75ec 	move.l 75ec <ClScreen+0x24>,100(a2)
     d0c:	0064 
     d0e:	2579 0000 75f0 	move.l 75f0 <ClScreen+0x28>,104(a2)
     d14:	0068 
     d16:	2579 0000 75f4 	move.l 75f4 <ClScreen+0x2c>,108(a2)
     d1c:	006c 
  *cl++ = 0x00e00000;
     d1e:	257c 00e0 0000 	move.l #14680064,112(a2)
     d24:	0070 
  *cl++ = 0x00e20000;
     d26:	257c 00e2 0000 	move.l #14811136,116(a2)
     d2c:	0074 
    *cl++ = *clpartinstruction++;
     d2e:	2579 0000 75f8 	move.l 75f8 <ClColor>,120(a2)
     d34:	0078 
     d36:	2579 0000 75fc 	move.l 75fc <ClColor+0x4>,124(a2)
     d3c:	007c 
  *cl = 0xfffffffe;
     d3e:	70fe           	moveq #-2,d0
     d40:	2540 0080      	move.l d0,128(a2)
}
     d44:	200a           	move.l a2,d0
     d46:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     d4a:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     d4c:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     d52:	4eae ffc4      	jsr -60(a6)
     d56:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     d5c:	2200           	move.l d0,d1
     d5e:	243c 0000 4ea1 	move.l #20129,d2
     d64:	7628           	moveq #40,d3
     d66:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     d6a:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
     d70:	7201           	moveq #1,d1
     d72:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     d76:	24b9 0000 7630 	move.l 7630 <ClsSprites>,(a2)
     d7c:	2579 0000 7634 	move.l 7634 <ClsSprites+0x4>,4(a2)
     d82:	0004 
     d84:	2579 0000 7638 	move.l 7638 <ClsSprites+0x8>,8(a2)
     d8a:	0008 
     d8c:	2579 0000 763c 	move.l 763c <ClsSprites+0xc>,12(a2)
     d92:	000c 
     d94:	2579 0000 7640 	move.l 7640 <ClsSprites+0x10>,16(a2)
     d9a:	0010 
     d9c:	2579 0000 7644 	move.l 7644 <ClsSprites+0x14>,20(a2)
     da2:	0014 
     da4:	2579 0000 7648 	move.l 7648 <ClsSprites+0x18>,24(a2)
     daa:	0018 
     dac:	2579 0000 764c 	move.l 764c <ClsSprites+0x1c>,28(a2)
     db2:	001c 
     db4:	2579 0000 7650 	move.l 7650 <ClsSprites+0x20>,32(a2)
     dba:	0020 
     dbc:	2579 0000 7654 	move.l 7654 <ClsSprites+0x24>,36(a2)
     dc2:	0024 
     dc4:	2579 0000 7658 	move.l 7658 <ClsSprites+0x28>,40(a2)
     dca:	0028 
     dcc:	2579 0000 765c 	move.l 765c <ClsSprites+0x2c>,44(a2)
     dd2:	002c 
     dd4:	2579 0000 7660 	move.l 7660 <ClsSprites+0x30>,48(a2)
     dda:	0030 
     ddc:	2579 0000 7664 	move.l 7664 <ClsSprites+0x34>,52(a2)
     de2:	0034 
     de4:	2579 0000 7668 	move.l 7668 <ClsSprites+0x38>,56(a2)
     dea:	0038 
     dec:	2579 0000 766c 	move.l 766c <ClsSprites+0x3c>,60(a2)
     df2:	003c 
    *cl++ = *clpartinstruction++;
     df4:	2579 0000 75c8 	move.l 75c8 <ClScreen>,64(a2)
     dfa:	0040 
     dfc:	2579 0000 75cc 	move.l 75cc <ClScreen+0x4>,68(a2)
     e02:	0044 
     e04:	2579 0000 75d0 	move.l 75d0 <ClScreen+0x8>,72(a2)
     e0a:	0048 
     e0c:	2579 0000 75d4 	move.l 75d4 <ClScreen+0xc>,76(a2)
     e12:	004c 
     e14:	2579 0000 75d8 	move.l 75d8 <ClScreen+0x10>,80(a2)
     e1a:	0050 
     e1c:	2579 0000 75dc 	move.l 75dc <ClScreen+0x14>,84(a2)
     e22:	0054 
     e24:	2579 0000 75e0 	move.l 75e0 <ClScreen+0x18>,88(a2)
     e2a:	0058 
     e2c:	2579 0000 75e4 	move.l 75e4 <ClScreen+0x1c>,92(a2)
     e32:	005c 
     e34:	2579 0000 75e8 	move.l 75e8 <ClScreen+0x20>,96(a2)
     e3a:	0060 
     e3c:	2579 0000 75ec 	move.l 75ec <ClScreen+0x24>,100(a2)
     e42:	0064 
     e44:	2579 0000 75f0 	move.l 75f0 <ClScreen+0x28>,104(a2)
     e4a:	0068 
     e4c:	2579 0000 75f4 	move.l 75f4 <ClScreen+0x2c>,108(a2)
     e52:	006c 
  *cl++ = 0x00e00000;
     e54:	257c 00e0 0000 	move.l #14680064,112(a2)
     e5a:	0070 
  *cl++ = 0x00e20000;
     e5c:	257c 00e2 0000 	move.l #14811136,116(a2)
     e62:	0074 
    *cl++ = *clpartinstruction++;
     e64:	2579 0000 75f8 	move.l 75f8 <ClColor>,120(a2)
     e6a:	0078 
     e6c:	2579 0000 75fc 	move.l 75fc <ClColor+0x4>,124(a2)
     e72:	007c 
  *cl = 0xfffffffe;
     e74:	70fe           	moveq #-2,d0
     e76:	2540 0080      	move.l d0,128(a2)
}
     e7a:	200a           	move.l a2,d0
     e7c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     e80:	4e75           	rts

00000e82 <WaitBlt>:
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     e82:	2079 0000 79e2 	movea.l 79e2 <hw>,a0
     e88:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     e8c:	3028 0002      	move.w 2(a0),d0
     e90:	0800 000e      	btst #14,d0
     e94:	66f6           	bne.s e8c <WaitBlt+0xa>
}
     e96:	4e75           	rts

00000e98 <Zoom_ZoomIntoPicture>:
  hw->bltcon0 = 0x9f0 + shiftright;
  hw->bltcon1 = 0;
}

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
     e98:	4fef ffe0      	lea -32(sp),sp
     e9c:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
     ea0:	262f 0058      	move.l 88(sp),d3
     ea4:	2e2f 005c      	move.l 92(sp),d7
     ea8:	3403           	move.w d3,d2
  WaitBlit();
     eaa:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
     eb0:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
     eb4:	2079 0000 79e2 	movea.l 79e2 <hw>,a0
     eba:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     ec0:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     ec6:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     ecc:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     ed2:	317c 002c 0066 	move.w #44,102(a0)
  Init_Blit();
  WORD shiftright = 9;
  UWORD shifthoriz = 7;
  UWORD startofword = 21*16;
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
     ed8:	3803           	move.w d3,d4
     eda:	d843           	add.w d3,d4
     edc:	3204           	move.w d4,d1
     ede:	d244           	add.w d4,d1
     ee0:	d243           	add.w d3,d1
     ee2:	3001           	move.w d1,d0
     ee4:	d041           	add.w d1,d0
     ee6:	0640 014c      	addi.w #332,d0
     eea:	3f40 003a      	move.w d0,58(sp)
  WORD shiftright = 9;
     eee:	3a7c 0009      	movea.w #9,a5
  while( nextzoom > 22 * 16) {
     ef2:	0c40 0160      	cmpi.w #352,d0
     ef6:	6312           	bls.s f0a <Zoom_ZoomIntoPicture+0x72>
    nextzoom -= (19 + zoomnr);
     ef8:	0640 ffed      	addi.w #-19,d0
     efc:	9042           	sub.w d2,d0
    shiftright--;
     efe:	534d           	subq.w #1,a5
  while( nextzoom > 22 * 16) {
     f00:	0c40 0160      	cmpi.w #352,d0
     f04:	62f2           	bhi.s ef8 <Zoom_ZoomIntoPicture+0x60>
     f06:	3f40 003a      	move.w d0,58(sp)
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
     f0a:	7012           	moveq #18,d0
     f0c:	9041           	sub.w d1,d0
     f0e:	3f40 0044      	move.w d0,68(sp)
  while( ZoomHorizontalStart < 0) {
     f12:	6c00 0394      	bge.w 12a8 <Zoom_ZoomIntoPicture+0x410>
     f16:	3200           	move.w d0,d1
  UWORD shifthoriz = 7;
     f18:	7007           	moveq #7,d0
      ZoomHorizontalStart += 1 + 18 + zoomnr;
     f1a:	0641 0013      	addi.w #19,d1
     f1e:	d242           	add.w d2,d1
      shifthoriz--;
     f20:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
     f22:	4a41           	tst.w d1
     f24:	6df4           	blt.s f1a <Zoom_ZoomIntoPicture+0x82>
     f26:	3f41 0044      	move.w d1,68(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    /*UWORD size4blitsmall = ZMLINESIZE/2*ZoomHorizontal*planes;
    UWORD size4blitbig = ZMLINESIZE/2*(ZoomHorizontal+1)*planes;*/

    UWORD onestep = ZMLINESIZE/2*planes;
     f2a:	3207           	move.w d7,d1
     f2c:	d247           	add.w d7,d1
     f2e:	d247           	add.w d7,d1
     f30:	3c01           	move.w d1,d6
     f32:	e74e           	lsl.w #3,d6
  hw->bltsize = height*64+2;
     f34:	ed4f           	lsl.w #6,d7
     f36:	3207           	move.w d7,d1
     f38:	5441           	addq.w #2,d1
     f3a:	3f41 0030      	move.w d1,48(sp)
          linesleft--;
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
        pos4source += size4blit;
        pos4dest += size4blit + onestep;   
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     f3e:	9843           	sub.w d3,d4
     f40:	0644 0012      	addi.w #18,d4
     f44:	7200           	moveq #0,d1
     f46:	3206           	move.w d6,d1
     f48:	2f41 0046      	move.l d1,70(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
     f4c:	0280 0000 ffff 	andi.l #65535,d0
     f52:	5280           	addq.l #1,d0
     f54:	2200           	move.l d0,d1
     f56:	d280           	add.l d0,d1
     f58:	d081           	add.l d1,d0
     f5a:	e988           	lsl.l #4,d0
     f5c:	206f 0050      	movea.l 80(sp),a0
     f60:	41f0 08fc      	lea (-4,a0,d0.l),a0
     f64:	2f48 0032      	move.l a0,50(sp)
     f68:	702c           	moveq #44,d0
     f6a:	d0af 0054      	add.l 84(sp),d0
     f6e:	2f40 0036      	move.l d0,54(sp)
  UWORD shifttoleft = 0;
     f72:	426f 0042      	clr.w 66(sp)
  UWORD startofword = 21*16;
     f76:	3f7c 0150 002c 	move.w #336,44(sp)
      nextzoom -= (19 + zoomnr);
     f7c:	72ed           	moveq #-19,d1
     f7e:	9242           	sub.w d2,d1
     f80:	3f41 004a      	move.w d1,74(sp)
    ZoomBlit_Increment4SrcA = 1;
     f84:	3f4d 002e      	move.w a5,46(sp)
    ZoomHorizontal = ZoomHorizontalStart;
     f88:	33ef 0044 0000 	move.w 68(sp),79ba <ZoomHorizontal>
     f8e:	79ba 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
     f90:	242f 0032      	move.l 50(sp),d2
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
     f94:	262f 0036      	move.l 54(sp),d3
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
     f98:	7000           	moveq #0,d0
     f9a:	302f 0042      	move.w 66(sp),d0
     f9e:	2440           	movea.l d0,a2
     fa0:	2a0a           	move.l a2,d5
     fa2:	da8a           	add.l a2,d5
     fa4:	3f6f 002e 003c 	move.w 46(sp),60(sp)
     faa:	322f 002e      	move.w 46(sp),d1
     fae:	700c           	moveq #12,d0
     fb0:	e169           	lsl.w d0,d1
     fb2:	3641           	movea.w d1,a3
     fb4:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
     fba:	7000           	moveq #0,d0
     fbc:	302f 002c      	move.w 44(sp),d0
     fc0:	306f 003a      	movea.w 58(sp),a0
     fc4:	b1c0           	cmpa.l d0,a0
     fc6:	6e00 0124      	bgt.w 10ec <Zoom_ZoomIntoPicture+0x254>
  WaitBlit();
     fca:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
     fce:	2079 0000 79e2 	movea.l 79e2 <hw>,a0
     fd4:	47eb 09f0      	lea 2544(a3),a3
     fd8:	314b 0040      	move.w a3,64(a0)
  hw->bltcon1 = 0;
     fdc:	317c 0000 0042 	move.w #0,66(a0)
     fe2:	3879 0000 79ba 	movea.w 79ba <ZoomHorizontal>,a4
    WORD linesleft = 272;
     fe8:	327c 0110      	movea.w #272,a1
     fec:	2002           	move.l d2,d0
     fee:	3409           	move.w a1,d2
     ff0:	2a45           	movea.l d5,a5
     ff2:	3a0c           	move.w a4,d5
     ff4:	2c6f 0046      	movea.l 70(sp),a6
     ff8:	2240           	movea.l d0,a1
        if( linesleft >= ZoomHorizontal+1) {
     ffa:	3202           	move.w d2,d1
     ffc:	ba42           	cmp.w d2,d5
     ffe:	6c00 008a      	bge.w 108a <Zoom_ZoomIntoPicture+0x1f2>
          linesleft -= ZoomHorizontal;
    1002:	9445           	sub.w d5,d2
        UWORD size4blit = ZoomHorizontal*onestep; 
    1004:	3005           	move.w d5,d0
    1006:	c1c6           	muls.w d6,d0
        if( linesleft>0) {
    1008:	0280 0000 ffff 	andi.l #65535,d0
    100e:	2640           	movea.l d0,a3
    1010:	d7c0           	adda.l d0,a3
    1012:	4a42           	tst.w d2
    1014:	6f00 00c8      	ble.w 10de <Zoom_ZoomIntoPicture+0x246>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1018:	220a           	move.l a2,d1
    101a:	d280           	add.l d0,d1
    101c:	d281           	add.l d1,d1
    101e:	d289           	add.l a1,d1
          UWORD *tmpdest = pos4dest +  size4blit;
    1020:	49f3 3800      	lea (0,a3,d3.l),a4
          *bp = 0;
    1024:	4278 0200      	clr.w 200 <main+0x1fa>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1028:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    102c:	3a28 0002      	move.w 2(a0),d5
    1030:	0805 000e      	btst #14,d5
    1034:	66f6           	bne.s 102c <Zoom_ZoomIntoPicture+0x194>
  hw->bltapt = (UWORD *) source;
    1036:	2141 0050      	move.l d1,80(a0)
  hw->bltdpt = (UWORD *) destination;
    103a:	214c 0054      	move.l a4,84(a0)
  hw->bltsize = height*64+2;
    103e:	316f 0030 0058 	move.w 48(sp),88(a0)
          linesleft--;
    1044:	5342           	subq.w #1,d2
    1046:	3239 0000 79ba 	move.w 79ba <ZoomHorizontal>,d1
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    104c:	49f1 d800      	lea (0,a1,a5.l),a4
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1050:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1054:	3a28 0002      	move.w 2(a0),d5
    1058:	0805 000e      	btst #14,d5
    105c:	66f6           	bne.s 1054 <Zoom_ZoomIntoPicture+0x1bc>
  hw->bltapt = (UWORD *) source;
    105e:	214c 0050      	move.l a4,80(a0)
  hw->bltdpt = (UWORD *) destination;
    1062:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    1066:	c3c7           	muls.w d7,d1
    1068:	5441           	addq.w #2,d1
    106a:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
    106e:	d3cb           	adda.l a3,a1
        pos4dest += size4blit + onestep; 
    1070:	d08e           	add.l a6,d0
    1072:	d080           	add.l d0,d0
    1074:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1076:	33c4 0000 79ba 	move.w d4,79ba <ZoomHorizontal>
      while(linesleft > 0) {
    107c:	4a42           	tst.w d2
    107e:	6f3c           	ble.s 10bc <Zoom_ZoomIntoPicture+0x224>
    1080:	3a04           	move.w d4,d5
        if( linesleft >= ZoomHorizontal+1) {
    1082:	3202           	move.w d2,d1
    1084:	ba42           	cmp.w d2,d5
    1086:	6d00 ff7a      	blt.w 1002 <Zoom_ZoomIntoPicture+0x16a>
        UWORD size4blit = ZoomHorizontal*onestep; 
    108a:	3006           	move.w d6,d0
    108c:	c1c2           	muls.w d2,d0
        if( linesleft>0) {
    108e:	0280 0000 ffff 	andi.l #65535,d0
    1094:	2640           	movea.l d0,a3
    1096:	d7c0           	adda.l d0,a3
          linesleft = 0;
    1098:	4242           	clr.w d2
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    109a:	49f1 d800      	lea (0,a1,a5.l),a4
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    109e:	3a28 0002      	move.w 2(a0),d5
    10a2:	60b0           	bra.s 1054 <Zoom_ZoomIntoPicture+0x1bc>
      }
      shiftright--;  
      if(shiftright < 0) {
    10a4:	4a6f 002e      	tst.w 46(sp)
    10a8:	6c12           	bge.s 10bc <Zoom_ZoomIntoPicture+0x224>
        shiftright += 16;
    10aa:	322f 003c      	move.w 60(sp),d1
    10ae:	0641 000f      	addi.w #15,d1
    10b2:	3f41 002e      	move.w d1,46(sp)
        shifttoleft = 1;
    10b6:	3f7c 0001 0042 	move.w #1,66(sp)
      }
    }
    startofword -= 16;
    10bc:	066f fff0 002c 	addi.w #-16,44(sp)
    10c2:	55af 0032      	subq.l #2,50(sp)
    10c6:	55af 0036      	subq.l #2,54(sp)
  for(int i=0;i<22;i++) {
    10ca:	0c6f fff0 002c 	cmpi.w #-16,44(sp)
    10d0:	6600 feb6      	bne.w f88 <Zoom_ZoomIntoPicture+0xf0>
  }
  //ZoomHorizontal = 10;
}
    10d4:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    10d8:	4fef 0020      	lea 32(sp),sp
    10dc:	4e75           	rts
        if( linesleft>0) {
    10de:	3205           	move.w d5,d1
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    10e0:	49f1 d800      	lea (0,a1,a5.l),a4
    10e4:	3a28 0002      	move.w 2(a0),d5
    10e8:	6000 ff6a      	bra.w 1054 <Zoom_ZoomIntoPicture+0x1bc>
  UWORD colnr = nextzoom - startofword - 1;                                                                          
    10ec:	322f 003a      	move.w 58(sp),d1
    10f0:	926f 002c      	sub.w 44(sp),d1
    10f4:	3a41           	movea.w d1,a5
    10f6:	534d           	subq.w #1,a5
  if( shiftright == 0) {
    10f8:	302f 003c      	move.w 60(sp),d0
    10fc:	5340           	subq.w #1,d0
    10fe:	3f40 002e      	move.w d0,46(sp)
    1102:	4a6f 003c      	tst.w 60(sp)
    1106:	6600 0140      	bne.w 1248 <Zoom_ZoomIntoPicture+0x3b0>
    ZoomBlit_Increment4SrcA = 1;
    110a:	33fc 0001 0000 	move.w #1,79d8 <ZoomBlit_Increment4SrcA>
    1110:	79d8 
    1112:	387c fde4      	movea.w #-540,a4
  WaitBlit(); 
    1116:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    111a:	2079 0000 79e2 	movea.l 79e2 <hw>,a0
    1120:	314b 0042      	move.w a3,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1124:	314c 0040      	move.w a4,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1128:	7000           	moveq #0,d0
    112a:	300d           	move.w a5,d0
    112c:	7210           	moveq #16,d1
    112e:	9280           	sub.l d0,d1
    1130:	2001           	move.l d1,d0
    1132:	7200           	moveq #0,d1
    1134:	4641           	not.w d1
    1136:	e1a9           	lsl.l d0,d1
    1138:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    113c:	302f 004a      	move.w 74(sp),d0
    1140:	d16f 003a      	add.w d0,58(sp)
      while( linesleft > 0) {
    1144:	3879 0000 79ba 	movea.w 79ba <ZoomHorizontal>,a4
    WORD linesleft = 272;
    114a:	367c 0110      	movea.w #272,a3
    114e:	2242           	movea.l d2,a1
    1150:	2003           	move.l d3,d0
    1152:	360b           	move.w a3,d3
    1154:	2f4a 003e      	move.l a2,62(sp)
    1158:	2c45           	movea.l d5,a6
    115a:	3a0c           	move.w a4,d5
    115c:	246f 0046      	movea.l 70(sp),a2
    1160:	2640           	movea.l d0,a3
        if( linesleft >= ZoomHorizontal+1) {
    1162:	3403           	move.w d3,d2
    1164:	ba43           	cmp.w d3,d5
    1166:	6c00 00a6      	bge.w 120e <Zoom_ZoomIntoPicture+0x376>
          linesleft -= ZoomHorizontal;
    116a:	9645           	sub.w d5,d3
        UWORD size4blit = ZoomHorizontal*onestep;
    116c:	3005           	move.w d5,d0
    116e:	c1c6           	muls.w d6,d0
        if( linesleft>0) {
    1170:	0280 0000 ffff 	andi.l #65535,d0
    1176:	2a40           	movea.l d0,a5
    1178:	dbc0           	adda.l d0,a5
    117a:	4a43           	tst.w d3
    117c:	6f00 00b4      	ble.w 1232 <Zoom_ZoomIntoPicture+0x39a>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1180:	242f 003e      	move.l 62(sp),d2
    1184:	d480           	add.l d0,d2
    1186:	d482           	add.l d2,d2
    1188:	d489           	add.l a1,d2
          UWORD *tmpdest = pos4dest + size4blit;
    118a:	2a0b           	move.l a3,d5
    118c:	da8d           	add.l a5,d5
          *bp = 0;
    118e:	4278 0200      	clr.w 200 <main+0x1fa>
    1192:	3228 0002      	move.w 2(a0),d1
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1196:	3228 0002      	move.w 2(a0),d1
    119a:	0801 000e      	btst #14,d1
    119e:	66f6           	bne.s 1196 <Zoom_ZoomIntoPicture+0x2fe>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    11a0:	7200           	moveq #0,d1
    11a2:	3239 0000 79d8 	move.w 79d8 <ZoomBlit_Increment4SrcA>,d1
    11a8:	d281           	add.l d1,d1
    11aa:	2842           	movea.l d2,a4
    11ac:	d9c1           	adda.l d1,a4
    11ae:	214c 0050      	move.l a4,80(a0)
  hw->bltbpt = source;
    11b2:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = destination;
    11b6:	2145 0054      	move.l d5,84(a0)
  hw->bltsize = height*64+2;
    11ba:	316f 0030 0058 	move.w 48(sp),88(a0)
          linesleft--;
    11c0:	5343           	subq.w #1,d3
    11c2:	3439 0000 79ba 	move.w 79ba <ZoomHorizontal>,d2
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    11c8:	49f1 e800      	lea (0,a1,a6.l),a4
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    11cc:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    11d0:	3a28 0002      	move.w 2(a0),d5
    11d4:	0805 000e      	btst #14,d5
    11d8:	66f6           	bne.s 11d0 <Zoom_ZoomIntoPicture+0x338>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    11da:	d28c           	add.l a4,d1
    11dc:	2141 0050      	move.l d1,80(a0)
  hw->bltbpt = source;
    11e0:	214c 004c      	move.l a4,76(a0)
  hw->bltdpt = destination;
    11e4:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
    11e8:	c5c7           	muls.w d7,d2
    11ea:	5442           	addq.w #2,d2
    11ec:	3142 0058      	move.w d2,88(a0)
        pos4source += size4blit;
    11f0:	d3cd           	adda.l a5,a1
        pos4dest += size4blit + onestep;   
    11f2:	d08a           	add.l a2,d0
    11f4:	d080           	add.l d0,d0
    11f6:	d7c0           	adda.l d0,a3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    11f8:	33c4 0000 79ba 	move.w d4,79ba <ZoomHorizontal>
      while( linesleft > 0) {
    11fe:	4a43           	tst.w d3
    1200:	6f00 fea2      	ble.w 10a4 <Zoom_ZoomIntoPicture+0x20c>
    1204:	3a04           	move.w d4,d5
        if( linesleft >= ZoomHorizontal+1) {
    1206:	3403           	move.w d3,d2
    1208:	ba43           	cmp.w d3,d5
    120a:	6d00 ff5e      	blt.w 116a <Zoom_ZoomIntoPicture+0x2d2>
        UWORD size4blit = ZoomHorizontal*onestep;
    120e:	3006           	move.w d6,d0
    1210:	c1c3           	muls.w d3,d0
        if( linesleft>0) {
    1212:	0280 0000 ffff 	andi.l #65535,d0
    1218:	2a40           	movea.l d0,a5
    121a:	dbc0           	adda.l d0,a5
    121c:	7200           	moveq #0,d1
    121e:	3239 0000 79d8 	move.w 79d8 <ZoomBlit_Increment4SrcA>,d1
    1224:	d281           	add.l d1,d1
          linesleft = 0;
    1226:	4243           	clr.w d3
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1228:	49f1 e800      	lea (0,a1,a6.l),a4
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    122c:	3a28 0002      	move.w 2(a0),d5
    1230:	609e           	bra.s 11d0 <Zoom_ZoomIntoPicture+0x338>
    1232:	7200           	moveq #0,d1
    1234:	3239 0000 79d8 	move.w 79d8 <ZoomBlit_Increment4SrcA>,d1
    123a:	d281           	add.l d1,d1
        if( linesleft>0) {
    123c:	3405           	move.w d5,d2
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    123e:	49f1 e800      	lea (0,a1,a6.l),a4
    1242:	3a28 0002      	move.w 2(a0),d5
    1246:	6088           	bra.s 11d0 <Zoom_ZoomIntoPicture+0x338>
  ZoomBlit_Increment4SrcA = 0;
    1248:	4279 0000 79d8 	clr.w 79d8 <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
    124e:	720c           	moveq #12,d1
    1250:	e368           	lsl.w d1,d0
    1252:	3840           	movea.w d0,a4
    1254:	49ec 0de4      	lea 3556(a4),a4
  WaitBlit(); 
    1258:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    125c:	2079 0000 79e2 	movea.l 79e2 <hw>,a0
    1262:	314b 0042      	move.w a3,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1266:	314c 0040      	move.w a4,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    126a:	7000           	moveq #0,d0
    126c:	300d           	move.w a5,d0
    126e:	7210           	moveq #16,d1
    1270:	9280           	sub.l d0,d1
    1272:	2001           	move.l d1,d0
    1274:	7200           	moveq #0,d1
    1276:	4641           	not.w d1
    1278:	e1a9           	lsl.l d0,d1
    127a:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    127e:	302f 004a      	move.w 74(sp),d0
    1282:	d16f 003a      	add.w d0,58(sp)
      while( linesleft > 0) {
    1286:	3879 0000 79ba 	movea.w 79ba <ZoomHorizontal>,a4
    WORD linesleft = 272;
    128c:	367c 0110      	movea.w #272,a3
    1290:	2242           	movea.l d2,a1
    1292:	2003           	move.l d3,d0
    1294:	360b           	move.w a3,d3
    1296:	2f4a 003e      	move.l a2,62(sp)
    129a:	2c45           	movea.l d5,a6
    129c:	3a0c           	move.w a4,d5
    129e:	246f 0046      	movea.l 70(sp),a2
    12a2:	2640           	movea.l d0,a3
    12a4:	6000 febc      	bra.w 1162 <Zoom_ZoomIntoPicture+0x2ca>
  UWORD shifthoriz = 7;
    12a8:	7007           	moveq #7,d0
    UWORD onestep = ZMLINESIZE/2*planes;
    12aa:	3207           	move.w d7,d1
    12ac:	d247           	add.w d7,d1
    12ae:	d247           	add.w d7,d1
    12b0:	3c01           	move.w d1,d6
    12b2:	e74e           	lsl.w #3,d6
  hw->bltsize = height*64+2;
    12b4:	ed4f           	lsl.w #6,d7
    12b6:	3207           	move.w d7,d1
    12b8:	5441           	addq.w #2,d1
    12ba:	3f41 0030      	move.w d1,48(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    12be:	9843           	sub.w d3,d4
    12c0:	0644 0012      	addi.w #18,d4
    12c4:	7200           	moveq #0,d1
    12c6:	3206           	move.w d6,d1
    12c8:	2f41 0046      	move.l d1,70(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
    12cc:	0280 0000 ffff 	andi.l #65535,d0
    12d2:	5280           	addq.l #1,d0
    12d4:	2200           	move.l d0,d1
    12d6:	d280           	add.l d0,d1
    12d8:	d081           	add.l d1,d0
    12da:	e988           	lsl.l #4,d0
    12dc:	206f 0050      	movea.l 80(sp),a0
    12e0:	41f0 08fc      	lea (-4,a0,d0.l),a0
    12e4:	2f48 0032      	move.l a0,50(sp)
    12e8:	702c           	moveq #44,d0
    12ea:	d0af 0054      	add.l 84(sp),d0
    12ee:	2f40 0036      	move.l d0,54(sp)
  UWORD shifttoleft = 0;
    12f2:	426f 0042      	clr.w 66(sp)
  UWORD startofword = 21*16;
    12f6:	3f7c 0150 002c 	move.w #336,44(sp)
      nextzoom -= (19 + zoomnr);
    12fc:	72ed           	moveq #-19,d1
    12fe:	9242           	sub.w d2,d1
    1300:	3f41 004a      	move.w d1,74(sp)
    ZoomBlit_Increment4SrcA = 1;
    1304:	3f4d 002e      	move.w a5,46(sp)
    1308:	6000 fc7e      	bra.w f88 <Zoom_ZoomIntoPicture+0xf0>

0000130c <Init_Blit>:
  hw->bltafwm = 0xffff;
    130c:	2079 0000 79e2 	movea.l 79e2 <hw>,a0
    1312:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1318:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    131e:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1324:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    132a:	317c 002c 0066 	move.w #44,102(a0)
}
    1330:	4e75           	rts

00001332 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    1332:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1336:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    133c:	203c 0000 a48c 	move.l #42124,d0
    1342:	7202           	moveq #2,d1
    1344:	4eae ff3a      	jsr -198(a6)
    1348:	2440           	movea.l d0,a2
  if( retval == 0) {
    134a:	4a80           	tst.l d0
    134c:	6700 0160      	beq.w 14ae <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    1350:	24b9 0000 7630 	move.l 7630 <ClsSprites>,(a2)
    1356:	2579 0000 7634 	move.l 7634 <ClsSprites+0x4>,4(a2)
    135c:	0004 
    135e:	2579 0000 7638 	move.l 7638 <ClsSprites+0x8>,8(a2)
    1364:	0008 
    1366:	2579 0000 763c 	move.l 763c <ClsSprites+0xc>,12(a2)
    136c:	000c 
    136e:	2579 0000 7640 	move.l 7640 <ClsSprites+0x10>,16(a2)
    1374:	0010 
    1376:	2579 0000 7644 	move.l 7644 <ClsSprites+0x14>,20(a2)
    137c:	0014 
    137e:	2579 0000 7648 	move.l 7648 <ClsSprites+0x18>,24(a2)
    1384:	0018 
    1386:	2579 0000 764c 	move.l 764c <ClsSprites+0x1c>,28(a2)
    138c:	001c 
    138e:	2579 0000 7650 	move.l 7650 <ClsSprites+0x20>,32(a2)
    1394:	0020 
    1396:	2579 0000 7654 	move.l 7654 <ClsSprites+0x24>,36(a2)
    139c:	0024 
    139e:	2579 0000 7658 	move.l 7658 <ClsSprites+0x28>,40(a2)
    13a4:	0028 
    13a6:	2579 0000 765c 	move.l 765c <ClsSprites+0x2c>,44(a2)
    13ac:	002c 
    13ae:	2579 0000 7660 	move.l 7660 <ClsSprites+0x30>,48(a2)
    13b4:	0030 
    13b6:	2579 0000 7664 	move.l 7664 <ClsSprites+0x34>,52(a2)
    13bc:	0034 
    13be:	2579 0000 7668 	move.l 7668 <ClsSprites+0x38>,56(a2)
    13c4:	0038 
    13c6:	2579 0000 766c 	move.l 766c <ClsSprites+0x3c>,60(a2)
    13cc:	003c 
    *cl++ = *clpartinstruction++;
    13ce:	2579 0000 7600 	move.l 7600 <ClScreenZoom>,64(a2)
    13d4:	0040 
    13d6:	2579 0000 7604 	move.l 7604 <ClScreenZoom+0x4>,68(a2)
    13dc:	0044 
    13de:	2579 0000 7608 	move.l 7608 <ClScreenZoom+0x8>,72(a2)
    13e4:	0048 
    13e6:	2579 0000 760c 	move.l 760c <ClScreenZoom+0xc>,76(a2)
    13ec:	004c 
    13ee:	2579 0000 7610 	move.l 7610 <ClScreenZoom+0x10>,80(a2)
    13f4:	0050 
    13f6:	2579 0000 7614 	move.l 7614 <ClScreenZoom+0x14>,84(a2)
    13fc:	0054 
    13fe:	2579 0000 7618 	move.l 7618 <ClScreenZoom+0x18>,88(a2)
    1404:	0058 
    1406:	2579 0000 761c 	move.l 761c <ClScreenZoom+0x1c>,92(a2)
    140c:	005c 
    140e:	2579 0000 7620 	move.l 7620 <ClScreenZoom+0x20>,96(a2)
    1414:	0060 
    1416:	2579 0000 7624 	move.l 7624 <ClScreenZoom+0x24>,100(a2)
    141c:	0064 
    141e:	2579 0000 7628 	move.l 7628 <ClScreenZoom+0x28>,104(a2)
    1424:	0068 
    1426:	2579 0000 762c 	move.l 762c <ClScreenZoom+0x2c>,108(a2)
    142c:	006c 
  *cl++ = 0x00e00000;
    142e:	257c 00e0 0000 	move.l #14680064,112(a2)
    1434:	0070 
  *cl++ = 0x00e20000;
    1436:	257c 00e2 0000 	move.l #14811136,116(a2)
    143c:	0074 
  *cl++ = 0x00e40000;
    143e:	257c 00e4 0000 	move.l #14942208,120(a2)
    1444:	0078 
  *cl++ = 0x00e60000;
    1446:	257c 00e6 0000 	move.l #15073280,124(a2)
    144c:	007c 
    *cl++ = *clpartinstruction++;
    144e:	2579 0000 75f8 	move.l 75f8 <ClColor>,128(a2)
    1454:	0080 
    1456:	2579 0000 75fc 	move.l 75fc <ClColor+0x4>,132(a2)
    145c:	0084 
    145e:	43ea 012c      	lea 300(a2),a1
    1462:	220a           	move.l a2,d1
    1464:	0681 0000 a52c 	addi.l #42284,d1
    146a:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    1470:	41e9 ff60      	lea -160(a1),a0
    1474:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    1478:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    147e:	5088           	addq.l #8,a0
    1480:	217c 0182 0f00 	move.l #25300736,-4(a0)
    1486:	fffc 
    for(int i2=0;i2<20;i2++) {
    1488:	b3c8           	cmpa.l a0,a1
    148a:	66ec           	bne.s 1478 <ClbuildZoom+0x146>
    148c:	43e8 00a4      	lea 164(a0),a1
    1490:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    1496:	b3c1           	cmpa.l d1,a1
    1498:	66d6           	bne.s 1470 <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    149a:	203c 0000 a488 	move.l #42120,d0
    14a0:	72fe           	moveq #-2,d1
    14a2:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    14a6:	200a           	move.l a2,d0
    14a8:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    14ac:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    14ae:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    14b4:	4eae ffc4      	jsr -60(a6)
    14b8:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    14be:	2200           	move.l d0,d1
    14c0:	243c 0000 4ea1 	move.l #20129,d2
    14c6:	7628           	moveq #40,d3
    14c8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    14cc:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    14d2:	7201           	moveq #1,d1
    14d4:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    14d8:	24b9 0000 7630 	move.l 7630 <ClsSprites>,(a2)
    14de:	2579 0000 7634 	move.l 7634 <ClsSprites+0x4>,4(a2)
    14e4:	0004 
    14e6:	2579 0000 7638 	move.l 7638 <ClsSprites+0x8>,8(a2)
    14ec:	0008 
    14ee:	2579 0000 763c 	move.l 763c <ClsSprites+0xc>,12(a2)
    14f4:	000c 
    14f6:	2579 0000 7640 	move.l 7640 <ClsSprites+0x10>,16(a2)
    14fc:	0010 
    14fe:	2579 0000 7644 	move.l 7644 <ClsSprites+0x14>,20(a2)
    1504:	0014 
    1506:	2579 0000 7648 	move.l 7648 <ClsSprites+0x18>,24(a2)
    150c:	0018 
    150e:	2579 0000 764c 	move.l 764c <ClsSprites+0x1c>,28(a2)
    1514:	001c 
    1516:	2579 0000 7650 	move.l 7650 <ClsSprites+0x20>,32(a2)
    151c:	0020 
    151e:	2579 0000 7654 	move.l 7654 <ClsSprites+0x24>,36(a2)
    1524:	0024 
    1526:	2579 0000 7658 	move.l 7658 <ClsSprites+0x28>,40(a2)
    152c:	0028 
    152e:	2579 0000 765c 	move.l 765c <ClsSprites+0x2c>,44(a2)
    1534:	002c 
    1536:	2579 0000 7660 	move.l 7660 <ClsSprites+0x30>,48(a2)
    153c:	0030 
    153e:	2579 0000 7664 	move.l 7664 <ClsSprites+0x34>,52(a2)
    1544:	0034 
    1546:	2579 0000 7668 	move.l 7668 <ClsSprites+0x38>,56(a2)
    154c:	0038 
    154e:	2579 0000 766c 	move.l 766c <ClsSprites+0x3c>,60(a2)
    1554:	003c 
    *cl++ = *clpartinstruction++;
    1556:	2579 0000 7600 	move.l 7600 <ClScreenZoom>,64(a2)
    155c:	0040 
    155e:	2579 0000 7604 	move.l 7604 <ClScreenZoom+0x4>,68(a2)
    1564:	0044 
    1566:	2579 0000 7608 	move.l 7608 <ClScreenZoom+0x8>,72(a2)
    156c:	0048 
    156e:	2579 0000 760c 	move.l 760c <ClScreenZoom+0xc>,76(a2)
    1574:	004c 
    1576:	2579 0000 7610 	move.l 7610 <ClScreenZoom+0x10>,80(a2)
    157c:	0050 
    157e:	2579 0000 7614 	move.l 7614 <ClScreenZoom+0x14>,84(a2)
    1584:	0054 
    1586:	2579 0000 7618 	move.l 7618 <ClScreenZoom+0x18>,88(a2)
    158c:	0058 
    158e:	2579 0000 761c 	move.l 761c <ClScreenZoom+0x1c>,92(a2)
    1594:	005c 
    1596:	2579 0000 7620 	move.l 7620 <ClScreenZoom+0x20>,96(a2)
    159c:	0060 
    159e:	2579 0000 7624 	move.l 7624 <ClScreenZoom+0x24>,100(a2)
    15a4:	0064 
    15a6:	2579 0000 7628 	move.l 7628 <ClScreenZoom+0x28>,104(a2)
    15ac:	0068 
    15ae:	2579 0000 762c 	move.l 762c <ClScreenZoom+0x2c>,108(a2)
    15b4:	006c 
  *cl++ = 0x00e00000;
    15b6:	257c 00e0 0000 	move.l #14680064,112(a2)
    15bc:	0070 
  *cl++ = 0x00e20000;
    15be:	257c 00e2 0000 	move.l #14811136,116(a2)
    15c4:	0074 
  *cl++ = 0x00e40000;
    15c6:	257c 00e4 0000 	move.l #14942208,120(a2)
    15cc:	0078 
  *cl++ = 0x00e60000;
    15ce:	257c 00e6 0000 	move.l #15073280,124(a2)
    15d4:	007c 
    *cl++ = *clpartinstruction++;
    15d6:	2579 0000 75f8 	move.l 75f8 <ClColor>,128(a2)
    15dc:	0080 
    15de:	2579 0000 75fc 	move.l 75fc <ClColor+0x4>,132(a2)
    15e4:	0084 
    15e6:	43ea 012c      	lea 300(a2),a1
    15ea:	220a           	move.l a2,d1
    15ec:	0681 0000 a52c 	addi.l #42284,d1
    15f2:	203c 2c07 fffe 	move.l #738721790,d0
    15f8:	6000 fe76      	bra.w 1470 <ClbuildZoom+0x13e>

000015fc <Zoom_Init>:
void Zoom_Init() {
    15fc:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    15fe:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    1604:	7004           	moveq #4,d0
    1606:	7202           	moveq #2,d1
    1608:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
    160c:	33fc 0010 0000 	move.w #16,79ba <ZoomHorizontal>
    1612:	79ba 
}
    1614:	2c5f           	movea.l (sp)+,a6
    1616:	4e75           	rts

00001618 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    1618:	2039 0000 79cc 	move.l 79cc <DrawCopper>,d0
  DrawCopper = ViewCopper;
    161e:	23f9 0000 79bc 	move.l 79bc <ViewCopper>,79cc <DrawCopper>
    1624:	0000 79cc 
  ViewCopper = (ULONG *)tmp;
    1628:	23c0 0000 79bc 	move.l d0,79bc <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    162e:	2079 0000 79e2 	movea.l 79e2 <hw>,a0
    1634:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    1638:	3140 0088      	move.w d0,136(a0)
}
    163c:	4e75           	rts

0000163e <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    163e:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    1642:	45fa fcee      	lea 1332 <ClbuildZoom>(pc),a2
    1646:	4e92           	jsr (a2)
    1648:	23c0 0000 79d4 	move.l d0,79d4 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    164e:	4e92           	jsr (a2)
    1650:	23c0 0000 79c8 	move.l d0,79c8 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1656:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    165c:	203c 0001 6800 	move.l #92160,d0
    1662:	7202           	moveq #2,d1
    1664:	4eae ff3a      	jsr -198(a6)
    1668:	23c0 0000 79c4 	move.l d0,79c4 <Bitplane1>
  if(Bitplane1 == 0) {
    166e:	6700 014e      	beq.w 17be <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    1672:	23c0 0000 79da 	move.l d0,79da <DrawBuffer>
  DrawCopper = Copperlist1;
    1678:	23f9 0000 79d4 	move.l 79d4 <Copperlist1>,79cc <DrawCopper>
    167e:	0000 79cc 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1682:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    1688:	203c 0001 6800 	move.l #92160,d0
    168e:	7202           	moveq #2,d1
    1690:	4eae ff3a      	jsr -198(a6)
    1694:	2400           	move.l d0,d2
    1696:	23c0 0000 79c0 	move.l d0,79c0 <Bitplane2>
  if(Bitplane2 == 0) {
    169c:	6778           	beq.s 1716 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    169e:	23f9 0000 79c8 	move.l 79c8 <Copperlist2>,79bc <ViewCopper>
    16a4:	0000 79bc 
  SwapCl();
    16a8:	45fa ff6e      	lea 1618 <SwapCl>(pc),a2
    16ac:	4e92           	jsr (a2)

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
    16ae:	2039 0000 79da 	move.l 79da <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    16b4:	2079 0000 79cc 	movea.l 79cc <DrawCopper>,a0
  copword += ZMBPLPTRS+1;
  for(int i=1;i<=2;i++) {
    UWORD highword = ptr >> 16;
    16ba:	2200           	move.l d0,d1
    16bc:	4241           	clr.w d1
    16be:	4841           	swap d1
    16c0:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    16c4:	3140 0076      	move.w d0,118(a0)
    *copword = highword;
    copword += 2;
    *copword = lowword;
    copword += 2;
    ptr += 40*256;
    16c8:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    16ce:	2200           	move.l d0,d1
    16d0:	4241           	clr.w d1
    16d2:	4841           	swap d1
    16d4:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    16d8:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    16dc:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    16de:	2079 0000 79cc 	movea.l 79cc <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    16e4:	2002           	move.l d2,d0
    16e6:	4240           	clr.w d0
    16e8:	4840           	swap d0
    16ea:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    16ee:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    16f2:	2002           	move.l d2,d0
    16f4:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    16fa:	2200           	move.l d0,d1
    16fc:	4241           	clr.w d1
    16fe:	4841           	swap d1
    1700:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1704:	3140 007e      	move.w d0,126(a0)
  }
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;
    1708:	23c2 0000 79d0 	move.l d2,79d0 <ViewBuffer>
}
    170e:	7000           	moveq #0,d0
    1710:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1714:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1716:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    171c:	4eae ffc4      	jsr -60(a6)
    1720:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1726:	2200           	move.l d0,d1
    1728:	243c 0000 4eee 	move.l #20206,d2
    172e:	7626           	moveq #38,d3
    1730:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1734:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    173a:	7201           	moveq #1,d1
    173c:	4eae ff70      	jsr -144(a6)
    1740:	2439 0000 79c0 	move.l 79c0 <Bitplane2>,d2
  ViewCopper = Copperlist2;
    1746:	23f9 0000 79c8 	move.l 79c8 <Copperlist2>,79bc <ViewCopper>
    174c:	0000 79bc 
  SwapCl();
    1750:	45fa fec6      	lea 1618 <SwapCl>(pc),a2
    1754:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    1756:	2039 0000 79da 	move.l 79da <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    175c:	2079 0000 79cc 	movea.l 79cc <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1762:	2200           	move.l d0,d1
    1764:	4241           	clr.w d1
    1766:	4841           	swap d1
    1768:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    176c:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    1770:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1776:	2200           	move.l d0,d1
    1778:	4241           	clr.w d1
    177a:	4841           	swap d1
    177c:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1780:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    1784:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    1786:	2079 0000 79cc 	movea.l 79cc <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    178c:	2002           	move.l d2,d0
    178e:	4240           	clr.w d0
    1790:	4840           	swap d0
    1792:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    1796:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    179a:	2002           	move.l d2,d0
    179c:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    17a2:	2200           	move.l d0,d1
    17a4:	4241           	clr.w d1
    17a6:	4841           	swap d1
    17a8:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    17ac:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    17b0:	23c2 0000 79d0 	move.l d2,79d0 <ViewBuffer>
}
    17b6:	7000           	moveq #0,d0
    17b8:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    17bc:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    17be:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    17c4:	4eae ffc4      	jsr -60(a6)
    17c8:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    17ce:	2200           	move.l d0,d1
    17d0:	243c 0000 4ec7 	move.l #20167,d2
    17d6:	7626           	moveq #38,d3
    17d8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    17dc:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    17e2:	7201           	moveq #1,d1
    17e4:	4eae ff70      	jsr -144(a6)
    17e8:	2039 0000 79c4 	move.l 79c4 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    17ee:	23c0 0000 79da 	move.l d0,79da <DrawBuffer>
  DrawCopper = Copperlist1;
    17f4:	23f9 0000 79d4 	move.l 79d4 <Copperlist1>,79cc <DrawCopper>
    17fa:	0000 79cc 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    17fe:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    1804:	203c 0001 6800 	move.l #92160,d0
    180a:	7202           	moveq #2,d1
    180c:	4eae ff3a      	jsr -198(a6)
    1810:	2400           	move.l d0,d2
    1812:	23c0 0000 79c0 	move.l d0,79c0 <Bitplane2>
  if(Bitplane2 == 0) {
    1818:	6600 fe84      	bne.w 169e <PrepareDisplayZoom+0x60>
    181c:	6000 fef8      	bra.w 1716 <PrepareDisplayZoom+0xd8>

00001820 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1820:	2039 0000 79da 	move.l 79da <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1826:	2079 0000 79cc 	movea.l 79cc <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    182c:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1830:	2200           	move.l d0,d1
    1832:	4241           	clr.w d1
    1834:	4841           	swap d1
    1836:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    183a:	23f9 0000 79d0 	move.l 79d0 <ViewBuffer>,79da <DrawBuffer>
    1840:	0000 79da 
  ViewBuffer = (ULONG *) tmp;
    1844:	23c0 0000 79d0 	move.l d0,79d0 <ViewBuffer>
}
    184a:	4e75           	rts

0000184c <PrepareDisplay>:
int PrepareDisplay() {
    184c:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClBuild( );
    1850:	45fa f3d2      	lea c24 <ClBuild>(pc),a2
    1854:	4e92           	jsr (a2)
    1856:	23c0 0000 79d4 	move.l d0,79d4 <Copperlist1>
  Copperlist2 = ClBuild( );
    185c:	4e92           	jsr (a2)
    185e:	23c0 0000 79c8 	move.l d0,79c8 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    1864:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    186a:	203c 0000 c800 	move.l #51200,d0
    1870:	7202           	moveq #2,d1
    1872:	4eae ff3a      	jsr -198(a6)
    1876:	23c0 0000 79c4 	move.l d0,79c4 <Bitplane1>
  if(Bitplane1 == 0) {
    187c:	6700 00ac      	beq.w 192a <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    1880:	23c0 0000 79da 	move.l d0,79da <DrawBuffer>
  DrawCopper = Copperlist1;
    1886:	23f9 0000 79d4 	move.l 79d4 <Copperlist1>,79cc <DrawCopper>
    188c:	0000 79cc 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    1890:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    1896:	203c 0000 c800 	move.l #51200,d0
    189c:	7202           	moveq #2,d1
    189e:	4eae ff3a      	jsr -198(a6)
    18a2:	23c0 0000 79c0 	move.l d0,79c0 <Bitplane2>
  if(Bitplane2 == 0) {
    18a8:	6728           	beq.s 18d2 <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    18aa:	23c0 0000 79d0 	move.l d0,79d0 <ViewBuffer>
  ViewCopper = Copperlist2;
    18b0:	23f9 0000 79c8 	move.l 79c8 <Copperlist2>,79bc <ViewCopper>
    18b6:	0000 79bc 
  SwapCl();
    18ba:	47fa fd5c      	lea 1618 <SwapCl>(pc),a3
    18be:	4e93           	jsr (a3)
  SetBplPointers();
    18c0:	45fa ff5e      	lea 1820 <SetBplPointers>(pc),a2
    18c4:	4e92           	jsr (a2)
  SwapCl();
    18c6:	4e93           	jsr (a3)
  SetBplPointers();
    18c8:	4e92           	jsr (a2)
}
    18ca:	7000           	moveq #0,d0
    18cc:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    18d0:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    18d2:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    18d8:	4eae ffc4      	jsr -60(a6)
    18dc:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    18e2:	2200           	move.l d0,d1
    18e4:	243c 0000 4eee 	move.l #20206,d2
    18ea:	7626           	moveq #38,d3
    18ec:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    18f0:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    18f6:	7201           	moveq #1,d1
    18f8:	4eae ff70      	jsr -144(a6)
    18fc:	2039 0000 79c0 	move.l 79c0 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    1902:	23c0 0000 79d0 	move.l d0,79d0 <ViewBuffer>
  ViewCopper = Copperlist2;
    1908:	23f9 0000 79c8 	move.l 79c8 <Copperlist2>,79bc <ViewCopper>
    190e:	0000 79bc 
  SwapCl();
    1912:	47fa fd04      	lea 1618 <SwapCl>(pc),a3
    1916:	4e93           	jsr (a3)
  SetBplPointers();
    1918:	45fa ff06      	lea 1820 <SetBplPointers>(pc),a2
    191c:	4e92           	jsr (a2)
  SwapCl();
    191e:	4e93           	jsr (a3)
  SetBplPointers();
    1920:	4e92           	jsr (a2)
}
    1922:	7000           	moveq #0,d0
    1924:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    1928:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    192a:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1930:	4eae ffc4      	jsr -60(a6)
    1934:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    193a:	2200           	move.l d0,d1
    193c:	243c 0000 4ec7 	move.l #20167,d2
    1942:	7626           	moveq #38,d3
    1944:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1948:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    194e:	7201           	moveq #1,d1
    1950:	4eae ff70      	jsr -144(a6)
    1954:	2039 0000 79c4 	move.l 79c4 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    195a:	23c0 0000 79da 	move.l d0,79da <DrawBuffer>
  DrawCopper = Copperlist1;
    1960:	23f9 0000 79d4 	move.l 79d4 <Copperlist1>,79cc <DrawCopper>
    1966:	0000 79cc 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    196a:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    1970:	203c 0000 c800 	move.l #51200,d0
    1976:	7202           	moveq #2,d1
    1978:	4eae ff3a      	jsr -198(a6)
    197c:	23c0 0000 79c0 	move.l d0,79c0 <Bitplane2>
  if(Bitplane2 == 0) {
    1982:	6600 ff26      	bne.w 18aa <PrepareDisplay+0x5e>
    1986:	6000 ff4a      	bra.w 18d2 <PrepareDisplay+0x86>

0000198a <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    198a:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    198e:	262f 0010      	move.l 16(sp),d3
    1992:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    1996:	2279 0000 79d4 	movea.l 79d4 <Copperlist1>,a1
    199c:	b2fc 0000      	cmpa.w #0,a1
    19a0:	670c           	beq.s 19ae <FreeDisplay+0x24>
    19a2:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    19a8:	2003           	move.l d3,d0
    19aa:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    19ae:	2279 0000 79c8 	movea.l 79c8 <Copperlist2>,a1
    19b4:	b2fc 0000      	cmpa.w #0,a1
    19b8:	670c           	beq.s 19c6 <FreeDisplay+0x3c>
    19ba:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    19c0:	2003           	move.l d3,d0
    19c2:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    19c6:	2279 0000 79c4 	movea.l 79c4 <Bitplane1>,a1
    19cc:	b2fc 0000      	cmpa.w #0,a1
    19d0:	670c           	beq.s 19de <FreeDisplay+0x54>
    19d2:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    19d8:	2002           	move.l d2,d0
    19da:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    19de:	2279 0000 79c0 	movea.l 79c0 <Bitplane2>,a1
    19e4:	b2fc 0000      	cmpa.w #0,a1
    19e8:	670c           	beq.s 19f6 <FreeDisplay+0x6c>
    19ea:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    19f0:	2002           	move.l d2,d0
    19f2:	4eae ff2e      	jsr -210(a6)
}
    19f6:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    19fa:	4e75           	rts

000019fc <WaitVbl>:
void WaitVbl() {
    19fc:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    19fe:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddb51e>,d0
    1a04:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    1a06:	2017           	move.l (sp),d0
    1a08:	0280 0001 ff00 	andi.l #130816,d0
    1a0e:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    1a10:	2017           	move.l (sp),d0
    1a12:	0c80 0001 3700 	cmpi.l #79616,d0
    1a18:	67e4           	beq.s 19fe <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    1a1a:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddb51e>,d0
    1a20:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    1a24:	202f 0004      	move.l 4(sp),d0
    1a28:	0280 0001 ff00 	andi.l #130816,d0
    1a2e:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    1a32:	202f 0004      	move.l 4(sp),d0
    1a36:	0c80 0001 3700 	cmpi.l #79616,d0
    1a3c:	66dc           	bne.s 1a1a <WaitVbl+0x1e>
}
    1a3e:	508f           	addq.l #8,sp
    1a40:	4e75           	rts

00001a42 <ZoomTest>:
void ZoomTest() {
    1a42:	4e55 ff68      	link.w a5,#-152
    1a46:	48e7 3f3a      	movem.l d2-d7/a2-a4/a6,-(sp)
  Counter4Frames = 0;
    1a4a:	42b9 0000 79ea 	clr.l 79ea <Counter4Frames>
  if (vbint = AllocMem(sizeof(struct Interrupt),    
    1a50:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    1a56:	7016           	moveq #22,d0
    1a58:	223c 0001 0001 	move.l #65537,d1
    1a5e:	4eae ff3a      	jsr -198(a6)
    1a62:	2440           	movea.l d0,a2
    1a64:	4a80           	tst.l d0
    1a66:	671a           	beq.s 1a82 <ZoomTest+0x40>
    vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1a68:	357c 02c4 0008 	move.w #708,8(a2)
    vbint->is_Node.ln_Name = "VertB-Example";
    1a6e:	257c 0000 4f15 	move.l #20245,10(a2)
    1a74:	000a 
    vbint->is_Data = NULL;
    1a76:	42aa 000e      	clr.l 14(a2)
    vbint->is_Code = Vblankcounter;
    1a7a:	257c 0000 0a28 	move.l #2600,18(a2)
    1a80:	0012 
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    1a82:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    1a88:	203c 0001 1440 	move.l #70720,d0
    1a8e:	7202           	moveq #2,d1
    1a90:	4eae ff3a      	jsr -198(a6)
    1a94:	2800           	move.l d0,d4
  if( source == 0) {
    1a96:	6700 28ba      	beq.w 4352 <ZoomTest+0x2910>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    1a9a:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    1aa0:	203c 0001 1440 	move.l #70720,d0
    1aa6:	7202           	moveq #2,d1
    1aa8:	4eae ff3a      	jsr -198(a6)
    1aac:	2a00           	move.l d0,d5
  if( destination == 0) {
    1aae:	6700 28ec      	beq.w 439c <ZoomTest+0x295a>
    1ab2:	2004           	move.l d4,d0
    1ab4:	0680 0000 3300 	addi.l #13056,d0
    1aba:	2044           	movea.l d4,a0
      *tmp4source++ = 0x55555555;
    1abc:	20bc 5555 5555 	move.l #1431655765,(a0)
    1ac2:	217c 5555 5555 	move.l #1431655765,4(a0)
    1ac8:	0004 
    1aca:	217c 5555 5555 	move.l #1431655765,8(a0)
    1ad0:	0008 
    1ad2:	217c 5555 5555 	move.l #1431655765,12(a0)
    1ad8:	000c 
    1ada:	217c 5555 5555 	move.l #1431655765,16(a0)
    1ae0:	0010 
    1ae2:	217c 5555 5555 	move.l #1431655765,20(a0)
    1ae8:	0014 
    1aea:	217c 5555 5555 	move.l #1431655765,24(a0)
    1af0:	0018 
    1af2:	217c 5555 5555 	move.l #1431655765,28(a0)
    1af8:	001c 
    1afa:	217c 5555 5555 	move.l #1431655765,32(a0)
    1b00:	0020 
    1b02:	217c 5555 5555 	move.l #1431655765,36(a0)
    1b08:	0024 
    1b0a:	217c 5555 5555 	move.l #1431655765,40(a0)
    1b10:	0028 
    1b12:	217c 5555 5555 	move.l #1431655765,44(a0)
    1b18:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    1b1a:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    1b20:	0030 
    1b22:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    1b28:	0034 
    1b2a:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    1b30:	0038 
    1b32:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    1b38:	003c 
    1b3a:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    1b40:	0040 
    1b42:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    1b48:	0044 
    1b4a:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    1b50:	0048 
    1b52:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    1b58:	004c 
    1b5a:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    1b60:	0050 
    1b62:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    1b68:	0054 
    1b6a:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    1b70:	0058 
    1b72:	41e8 0060      	lea 96(a0),a0
    1b76:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    1b7c:	fffc 
  for(int i=0;i<128+8;i++) {
    1b7e:	b1c0           	cmpa.l d0,a0
    1b80:	6600 ff3a      	bne.w 1abc <ZoomTest+0x7a>
  WaitVbl();
    1b84:	4eba fe76      	jsr 19fc <WaitVbl>(pc)
  Init_Blit();
    1b88:	4eba f782      	jsr 130c <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1b8c:	33fc 0001 0000 	move.w #1,79d8 <ZoomBlit_Increment4SrcA>
    1b92:	79d8 
  WaitBlit(); 
    1b94:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    1b9a:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1b9e:	2079 0000 79e2 	movea.l 79e2 <hw>,a0
    1ba4:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1baa:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1bb0:	317c fff8 0070 	move.w #-8,112(a0)
  AddIntServer(INTB_VERTB, vbint);
    1bb6:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    1bbc:	7005           	moveq #5,d0
    1bbe:	224a           	movea.l a2,a1
    1bc0:	4eae ff58      	jsr -168(a6)
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    1bc4:	4878 0005      	pea 5 <_start+0x5>
    1bc8:	42a7           	clr.l -(sp)
    1bca:	2f05           	move.l d5,-(sp)
    1bcc:	2f04           	move.l d4,-(sp)
    1bce:	4eba f2c8      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  RemIntServer(INTB_VERTB, vbint);
    1bd2:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    1bd8:	7005           	moveq #5,d0
    1bda:	224a           	movea.l a2,a1
    1bdc:	4eae ff52      	jsr -174(a6)
  if( Counter4Frames > 5)
    1be0:	4fef 0010      	lea 16(sp),sp
    1be4:	7005           	moveq #5,d0
    1be6:	b0b9 0000 79ea 	cmp.l 79ea <Counter4Frames>,d0
    1bec:	6c1e           	bge.s 1c0c <ZoomTest+0x1ca>
    Write( Output(), "TestSpeed4Zoom: Takes too long\n", 31);
    1bee:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1bf4:	4eae ffc4      	jsr -60(a6)
    1bf8:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1bfe:	2200           	move.l d0,d1
    1c00:	243c 0000 4f96 	move.l #20374,d2
    1c06:	761f           	moveq #31,d3
    1c08:	4eae ffd0      	jsr -48(a6)
  FreeMem( source, ( ZMLINESIZE+4)*272*5);
    1c0c:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    1c12:	2244           	movea.l d4,a1
    1c14:	203c 0001 1440 	move.l #70720,d0
    1c1a:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, ( ZMLINESIZE+4)*272*5);
    1c1e:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    1c24:	2245           	movea.l d5,a1
    1c26:	203c 0001 1440 	move.l #70720,d0
    1c2c:	4eae ff2e      	jsr -210(a6)
  PrepareDisplayZoom();
    1c30:	4eba fa0c      	jsr 163e <PrepareDisplayZoom>(pc)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    1c34:	4878 0010      	pea 10 <main+0xa>
    1c38:	4879 0000 7630 	pea 7630 <ClsSprites>
    1c3e:	42a7           	clr.l -(sp)
    1c40:	2f39 0000 79d4 	move.l 79d4 <Copperlist1>,-(sp)
    1c46:	47fa ee06      	lea a4e <TestCopperlistBatch>(pc),a3
    1c4a:	4e93           	jsr (a3)
    1c4c:	4fef 0010      	lea 16(sp),sp
    1c50:	4a80           	tst.l d0
    1c52:	661e           	bne.s 1c72 <ZoomTest+0x230>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    1c54:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1c5a:	4eae ffc4      	jsr -60(a6)
    1c5e:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1c64:	2200           	move.l d0,d1
    1c66:	243c 0000 4fb6 	move.l #20406,d2
    1c6c:	762c           	moveq #44,d3
    1c6e:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
    1c72:	4878 000c      	pea c <main+0x6>
    1c76:	4879 0000 7600 	pea 7600 <ClScreenZoom>
    1c7c:	4878 0010      	pea 10 <main+0xa>
    1c80:	2f39 0000 79d4 	move.l 79d4 <Copperlist1>,-(sp)
    1c86:	4e93           	jsr (a3)
    1c88:	4fef 0010      	lea 16(sp),sp
    1c8c:	4a80           	tst.l d0
    1c8e:	661e           	bne.s 1cae <ZoomTest+0x26c>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    1c90:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1c96:	4eae ffc4      	jsr -60(a6)
    1c9a:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1ca0:	2200           	move.l d0,d1
    1ca2:	243c 0000 4fec 	move.l #20460,d2
    1ca8:	7636           	moveq #54,d3
    1caa:	4eae ffd0      	jsr -48(a6)
  UWORD *copword = (UWORD *) DrawCopper;
    1cae:	2079 0000 79cc 	movea.l 79cc <DrawCopper>,a0
    *copword = highword;
    1cb4:	317c 0004 0072 	move.w #4,114(a0)
    *copword = lowword;
    1cba:	4268 0076      	clr.w 118(a0)
    *copword = highword;
    1cbe:	317c 0004 007a 	move.w #4,122(a0)
    *copword = lowword;
    1cc4:	317c 2800 007e 	move.w #10240,126(a0)
  DrawBuffer = ViewBuffer;
    1cca:	23fc 0005 0000 	move.l #327680,79da <DrawBuffer>
    1cd0:	0000 79da 
  ViewBuffer = (ULONG *) tmp;
    1cd4:	23fc 0004 0000 	move.l #262144,79d0 <ViewBuffer>
    1cda:	0000 79d0 
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    1cde:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    1ce4:	4878 001c      	pea 1c <main+0x16>
    1ce8:	2f39 0000 79d4 	move.l 79d4 <Copperlist1>,-(sp)
    1cee:	45fa ed40      	lea a30 <TestCopperlistPos>(pc),a2
    1cf2:	4e92           	jsr (a2)
    1cf4:	4fef 000c      	lea 12(sp),sp
    1cf8:	4a80           	tst.l d0
    1cfa:	661e           	bne.s 1d1a <ZoomTest+0x2d8>
    Write(Output(), 
    1cfc:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1d02:	4eae ffc4      	jsr -60(a6)
    1d06:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1d0c:	2200           	move.l d0,d1
    1d0e:	243c 0000 5023 	move.l #20515,d2
    1d14:	763c           	moveq #60,d3
    1d16:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    1d1a:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    1d20:	4878 001d      	pea 1d <main+0x17>
    1d24:	2f39 0000 79d4 	move.l 79d4 <Copperlist1>,-(sp)
    1d2a:	4e92           	jsr (a2)
    1d2c:	4fef 000c      	lea 12(sp),sp
    1d30:	4a80           	tst.l d0
    1d32:	661e           	bne.s 1d52 <ZoomTest+0x310>
    Write(Output(), 
    1d34:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1d3a:	4eae ffc4      	jsr -60(a6)
    1d3e:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1d44:	2200           	move.l d0,d1
    1d46:	243c 0000 5060 	move.l #20576,d2
    1d4c:	763c           	moveq #60,d3
    1d4e:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    1d52:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    1d58:	4878 001e      	pea 1e <main+0x18>
    1d5c:	2f39 0000 79d4 	move.l 79d4 <Copperlist1>,-(sp)
    1d62:	4e92           	jsr (a2)
    1d64:	4fef 000c      	lea 12(sp),sp
    1d68:	4a80           	tst.l d0
    1d6a:	661e           	bne.s 1d8a <ZoomTest+0x348>
    Write(Output(), 
    1d6c:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1d72:	4eae ffc4      	jsr -60(a6)
    1d76:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1d7c:	2200           	move.l d0,d1
    1d7e:	243c 0000 509d 	move.l #20637,d2
    1d84:	763c           	moveq #60,d3
    1d86:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
    1d8a:	2f3c 00e6 2800 	move.l #15083520,-(sp)
    1d90:	4878 001f      	pea 1f <main+0x19>
    1d94:	2f39 0000 79d4 	move.l 79d4 <Copperlist1>,-(sp)
    1d9a:	4e92           	jsr (a2)
    1d9c:	4fef 000c      	lea 12(sp),sp
    1da0:	4a80           	tst.l d0
    1da2:	661e           	bne.s 1dc2 <ZoomTest+0x380>
    Write(Output(), 
    1da4:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1daa:	4eae ffc4      	jsr -60(a6)
    1dae:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1db4:	2200           	move.l d0,d1
    1db6:	243c 0000 50da 	move.l #20698,d2
    1dbc:	763c           	moveq #60,d3
    1dbe:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
    1dc2:	4878 0002      	pea 2 <_start+0x2>
    1dc6:	4879 0000 75f8 	pea 75f8 <ClColor>
    1dcc:	4878 0020      	pea 20 <main+0x1a>
    1dd0:	2f39 0000 79d4 	move.l 79d4 <Copperlist1>,-(sp)
    1dd6:	4e93           	jsr (a3)
    1dd8:	4fef 0010      	lea 16(sp),sp
    1ddc:	4a80           	tst.l d0
    1dde:	661e           	bne.s 1dfe <ZoomTest+0x3bc>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1de0:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1de6:	4eae ffc4      	jsr -60(a6)
    1dea:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1df0:	2200           	move.l d0,d1
    1df2:	243c 0000 5117 	move.l #20759,d2
    1df8:	7621           	moveq #33,d3
    1dfa:	4eae ffd0      	jsr -48(a6)
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
    1dfe:	49ed ffc0      	lea -64(a5),a4
    1e02:	4878 0040      	pea 40 <main+0x3a>
    1e06:	4879 0000 5328 	pea 5328 <incbin_swfont_end+0x526>
    1e0c:	2f0c           	move.l a4,-(sp)
    1e0e:	4eba 25ae      	jsr 43be <memcpy>(pc)
  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
    1e12:	4878 0010      	pea 10 <main+0xa>
    1e16:	2f0c           	move.l a4,-(sp)
    1e18:	4878 0022      	pea 22 <main+0x1c>
    1e1c:	2f39 0000 79d4 	move.l 79d4 <Copperlist1>,-(sp)
    1e22:	4e93           	jsr (a3)
    1e24:	4fef 001c      	lea 28(sp),sp
    1e28:	4a80           	tst.l d0
    1e2a:	661e           	bne.s 1e4a <ZoomTest+0x408>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
    1e2c:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1e32:	4eae ffc4      	jsr -60(a6)
    1e36:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1e3c:	2200           	move.l d0,d1
    1e3e:	243c 0000 5139 	move.l #20793,d2
    1e44:	7621           	moveq #33,d3
    1e46:	4eae ffd0      	jsr -48(a6)
  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
    1e4a:	2b7c 2d07 fffe 	move.l #755499006,-76(a5)
    1e50:	ffb4 
    1e52:	2b7c 0182 00f0 	move.l #25297136,-72(a5)
    1e58:	ffb8 
    1e5a:	2b7c 0182 0f00 	move.l #25300736,-68(a5)
    1e60:	ffbc 
  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
    1e62:	4878 0003      	pea 3 <_start+0x3>
    1e66:	486d ffb4      	pea -76(a5)
    1e6a:	4878 004b      	pea 4b <main+0x45>
    1e6e:	2f39 0000 79d4 	move.l 79d4 <Copperlist1>,-(sp)
    1e74:	4e93           	jsr (a3)
    1e76:	4fef 0010      	lea 16(sp),sp
    1e7a:	4a80           	tst.l d0
    1e7c:	661e           	bne.s 1e9c <ZoomTest+0x45a>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
    1e7e:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1e84:	4eae ffc4      	jsr -60(a6)
    1e88:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1e8e:	2200           	move.l d0,d1
    1e90:	243c 0000 515b 	move.l #20827,d2
    1e96:	762c           	moveq #44,d3
    1e98:	4eae ffd0      	jsr -48(a6)
  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
    1e9c:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdc518>
    1ea0:	4878 2922      	pea 2922 <ZoomTest+0xee0>
    1ea4:	2f39 0000 79d4 	move.l 79d4 <Copperlist1>,-(sp)
    1eaa:	4e92           	jsr (a2)
    1eac:	4fef 000c      	lea 12(sp),sp
    1eb0:	4a80           	tst.l d0
    1eb2:	661e           	bne.s 1ed2 <ZoomTest+0x490>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    1eb4:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1eba:	4eae ffc4      	jsr -60(a6)
    1ebe:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1ec4:	2200           	move.l d0,d1
    1ec6:	243c 0000 5188 	move.l #20872,d2
    1ecc:	7622           	moveq #34,d3
    1ece:	4eae ffd0      	jsr -48(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    1ed2:	2f3c 0001 6800 	move.l #92160,-(sp)
    1ed8:	2f3c 0000 a48c 	move.l #42124,-(sp)
    1ede:	47fa faaa      	lea 198a <FreeDisplay>(pc),a3
    1ee2:	4e93           	jsr (a3)
  Zoom_Init();
    1ee4:	49fa f716      	lea 15fc <Zoom_Init>(pc),a4
    1ee8:	4e94           	jsr (a4)
  PrepareDisplayZoom();
    1eea:	4eba f752      	jsr 163e <PrepareDisplayZoom>(pc)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    1eee:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    1ef4:	203c 0000 c800 	move.l #51200,d0
    1efa:	7202           	moveq #2,d1
    1efc:	4eae ff3a      	jsr -198(a6)
    1f00:	2040           	movea.l d0,a0
    1f02:	23c0 0000 79de 	move.l d0,79de <Zoom_Source>
  if( Zoom_Source == 0) {
    1f08:	508f           	addq.l #8,sp
    1f0a:	6700 2424      	beq.w 4330 <ZoomTest+0x28ee>
  *tstsource++ = 0x0000;
    1f0e:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    1f10:	317c 0080 0002 	move.w #128,2(a0)
  *tstsource = 0x1000;
    1f16:	317c 1000 0030 	move.w #4096,48(a0)
  *tstsource = 0x8e88;
    1f1c:	317c 8e88 0032 	move.w #-29048,50(a0)
  *tstsource++ = 0x0000;
    1f22:	4268 17d0      	clr.w 6096(a0)
  *tstsource = 0x00ff;
    1f26:	317c 00ff 17d2 	move.w #255,6098(a0)
  WaitBlit();
    1f2c:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    1f32:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    1f36:	4eba f3d4      	jsr 130c <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1f3a:	33fc 0001 0000 	move.w #1,79d8 <ZoomBlit_Increment4SrcA>
    1f40:	79d8 
  WaitBlit(); 
    1f42:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    1f48:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1f4c:	2479 0000 79e2 	movea.l 79e2 <hw>,a2
    1f52:	357c 0000 0042 	move.w #0,66(a2)
  hw->bltcon0 = 0xde4 + shifta;
    1f58:	357c fde4 0040 	move.w #-540,64(a2)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1f5e:	357c ff00 0070 	move.w #-256,112(a2)
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    1f64:	2639 0000 79da 	move.l 79da <DrawBuffer>,d3
    1f6a:	2439 0000 79de 	move.l 79de <Zoom_Source>,d2
  WaitBlt();
    1f70:	4eba ef10      	jsr e82 <WaitBlt>(pc)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1f74:	7000           	moveq #0,d0
    1f76:	3039 0000 79d8 	move.w 79d8 <ZoomBlit_Increment4SrcA>,d0
    1f7c:	d080           	add.l d0,d0
    1f7e:	d082           	add.l d2,d0
    1f80:	2540 0050      	move.l d0,80(a2)
  hw->bltbpt = source;
    1f84:	2542 004c      	move.l d2,76(a2)
  hw->bltdpt = destination;
    1f88:	2543 0054      	move.l d3,84(a2)
  hw->bltsize = height*64+2;
    1f8c:	357c 2002 0058 	move.w #8194,88(a2)
  WaitBlit();
    1f92:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    1f98:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    1f9c:	2479 0000 79da 	movea.l 79da <DrawBuffer>,a2
  if( *destination != 0x0180) {
    1fa2:	0c6a 0180 0002 	cmpi.w #384,2(a2)
    1fa8:	671e           	beq.s 1fc8 <ZoomTest+0x586>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    1faa:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1fb0:	4eae ffc4      	jsr -60(a6)
    1fb4:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1fba:	2200           	move.l d0,d1
    1fbc:	243c 0000 51e3 	move.l #20963,d2
    1fc2:	761c           	moveq #28,d3
    1fc4:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x1d88)
    1fc8:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
    1fce:	671e           	beq.s 1fee <ZoomTest+0x5ac>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    1fd0:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1fd6:	4eae ffc4      	jsr -60(a6)
    1fda:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    1fe0:	2200           	move.l d0,d1
    1fe2:	243c 0000 5200 	move.l #20992,d2
    1fe8:	761c           	moveq #28,d3
    1fea:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x01ff) {
    1fee:	2079 0000 79da 	movea.l 79da <DrawBuffer>,a0
    1ff4:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
    1ffa:	671e           	beq.s 201a <ZoomTest+0x5d8>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    1ffc:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    2002:	4eae ffc4      	jsr -60(a6)
    2006:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    200c:	2200           	move.l d0,d1
    200e:	243c 0000 521d 	move.l #21021,d2
    2014:	761a           	moveq #26,d3
    2016:	4eae ffd0      	jsr -48(a6)
  FreeMem( Zoom_Source, 40*256*5);
    201a:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    2020:	2279 0000 79de 	movea.l 79de <Zoom_Source>,a1
    2026:	203c 0000 c800 	move.l #51200,d0
    202c:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    2030:	2f3c 0001 6800 	move.l #92160,-(sp)
    2036:	2f3c 0000 a48c 	move.l #42124,-(sp)
    203c:	4e93           	jsr (a3)
    203e:	508f           	addq.l #8,sp
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    2040:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    2046:	203c 0000 05a0 	move.l #1440,d0
    204c:	7202           	moveq #2,d1
    204e:	4eae ff3a      	jsr -198(a6)
    2052:	2440           	movea.l d0,a2
  if( source == 0) {
    2054:	4a80           	tst.l d0
    2056:	6700 2278      	beq.w 42d0 <ZoomTest+0x288e>
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    205a:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    2060:	203c 0000 05a0 	move.l #1440,d0
    2066:	7202           	moveq #2,d1
    2068:	4eae ff3a      	jsr -198(a6)
    206c:	2640           	movea.l d0,a3
  if( destination == 0) {
    206e:	4a80           	tst.l d0
    2070:	6700 225e      	beq.w 42d0 <ZoomTest+0x288e>
    *tmp++ = 0;
    2074:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
    2076:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
    207c:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
    2082:	426a 0006      	clr.w 6(a2)
    *tmp++ = 0;
    2086:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
    208a:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
    2090:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
    2096:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
    209a:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
    209e:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
    20a4:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
    20aa:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
    20ae:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
    20b2:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
    20b8:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
    20be:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
    20c2:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
    20c6:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
    20cc:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
    20d2:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
    20d6:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
    20da:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
    20e0:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
    20e6:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
    20ea:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
    20ee:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
    20f4:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
    20fa:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
    20fe:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
    2102:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
    2108:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
    210e:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
    2112:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
    2116:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
    211c:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
    2122:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
    2126:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
    212a:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
    2130:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
    2136:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
    213a:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
    213e:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
    2144:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
    214a:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
    214e:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
    2152:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
    2158:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
    215e:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
    2162:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
    2166:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
    216c:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
    2172:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
    2176:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
    217a:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
    2180:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
    2186:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
    218a:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
    218e:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
    2194:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
    219a:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
    219e:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
    21a2:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
    21a8:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
    21ae:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
    21b2:	4878 05a0      	pea 5a0 <main+0x59a>
    21b6:	42a7           	clr.l -(sp)
    21b8:	2f00           	move.l d0,-(sp)
    21ba:	4eba 2294      	jsr 4450 <memset>(pc)
  WaitBlit();
    21be:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    21c4:	4eae ff1c      	jsr -228(a6)
  Zoom_Init();
    21c8:	4e94           	jsr (a4)
  WaitBlit();
    21ca:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    21d0:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    21d4:	2879 0000 79e2 	movea.l 79e2 <hw>,a4
    21da:	397c 39f0 0040 	move.w #14832,64(a4)
  hw->bltcon1 = 0;
    21e0:	397c 0000 0042 	move.w #0,66(a4)
  WaitBlt();
    21e6:	4eba ec9a      	jsr e82 <WaitBlt>(pc)
  hw->bltapt = (UWORD *) source;
    21ea:	200a           	move.l a2,d0
    21ec:	5480           	addq.l #2,d0
    21ee:	2940 0050      	move.l d0,80(a4)
  hw->bltdpt = (UWORD *) destination;
    21f2:	294b 0054      	move.l a3,84(a4)
  hw->bltsize = height*64+2;
    21f6:	397c 0402 0058 	move.w #1026,88(a4)
  WaitBlit();
    21fc:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    2202:	4eae ff1c      	jsr -228(a6)
  if( *tmp != 0x5555) 
    2206:	4fef 000c      	lea 12(sp),sp
    220a:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
    2210:	671e           	beq.s 2230 <ZoomTest+0x7ee>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    2212:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    2218:	4eae ffc4      	jsr -60(a6)
    221c:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    2222:	2200           	move.l d0,d1
    2224:	243c 0000 526e 	move.l #21102,d2
    222a:	761f           	moveq #31,d3
    222c:	4eae ffd0      	jsr -48(a6)
  if( *tmp != 0xaaaa)
    2230:	0c6b aaaa 0032 	cmpi.w #-21846,50(a3)
    2236:	671e           	beq.s 2256 <ZoomTest+0x814>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    2238:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    223e:	4eae ffc4      	jsr -60(a6)
    2242:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    2248:	2200           	move.l d0,d1
    224a:	243c 0000 528e 	move.l #21134,d2
    2250:	7620           	moveq #32,d3
    2252:	4eae ffd0      	jsr -48(a6)
  FreeMem( source,ZMLINESIZE*30);
    2256:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    225c:	224a           	movea.l a2,a1
    225e:	203c 0000 05a0 	move.l #1440,d0
    2264:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    2268:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    226e:	224b           	movea.l a3,a1
    2270:	203c 0000 05a0 	move.l #1440,d0
    2276:	4eae ff2e      	jsr -210(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    227a:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    2280:	203c 0000 3740 	move.l #14144,d0
    2286:	7202           	moveq #2,d1
    2288:	4eae ff3a      	jsr -198(a6)
    228c:	2840           	movea.l d0,a4
  if( source == 0) {
    228e:	4a80           	tst.l d0
    2290:	6700 2076      	beq.w 4308 <ZoomTest+0x28c6>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    2294:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    229a:	203c 0000 3740 	move.l #14144,d0
    22a0:	7202           	moveq #2,d1
    22a2:	4eae ff3a      	jsr -198(a6)
    22a6:	2640           	movea.l d0,a3
  if( destination == 0) {
    22a8:	4a80           	tst.l d0
    22aa:	6700 20c8      	beq.w 4374 <ZoomTest+0x2932>
    22ae:	200c           	move.l a4,d0
    22b0:	0680 0000 3300 	addi.l #13056,d0
    22b6:	204c           	movea.l a4,a0
      *tmp4source++ = 0x55555555;
    22b8:	20bc 5555 5555 	move.l #1431655765,(a0)
    22be:	217c 5555 5555 	move.l #1431655765,4(a0)
    22c4:	0004 
    22c6:	217c 5555 5555 	move.l #1431655765,8(a0)
    22cc:	0008 
    22ce:	217c 5555 5555 	move.l #1431655765,12(a0)
    22d4:	000c 
    22d6:	217c 5555 5555 	move.l #1431655765,16(a0)
    22dc:	0010 
    22de:	217c 5555 5555 	move.l #1431655765,20(a0)
    22e4:	0014 
    22e6:	217c 5555 5555 	move.l #1431655765,24(a0)
    22ec:	0018 
    22ee:	217c 5555 5555 	move.l #1431655765,28(a0)
    22f4:	001c 
    22f6:	217c 5555 5555 	move.l #1431655765,32(a0)
    22fc:	0020 
    22fe:	217c 5555 5555 	move.l #1431655765,36(a0)
    2304:	0024 
    2306:	217c 5555 5555 	move.l #1431655765,40(a0)
    230c:	0028 
    230e:	217c 5555 5555 	move.l #1431655765,44(a0)
    2314:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    2316:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    231c:	0030 
    231e:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    2324:	0034 
    2326:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    232c:	0038 
    232e:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    2334:	003c 
    2336:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    233c:	0040 
    233e:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    2344:	0044 
    2346:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    234c:	0048 
    234e:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    2354:	004c 
    2356:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    235c:	0050 
    235e:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    2364:	0054 
    2366:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    236c:	0058 
    236e:	41e8 0060      	lea 96(a0),a0
    2372:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    2378:	fffc 
  for(int i=0;i<128+8;i++) {
    237a:	b1c0           	cmpa.l d0,a0
    237c:	6600 ff3a      	bne.w 22b8 <ZoomTest+0x876>
  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    2380:	4878 0001      	pea 1 <_start+0x1>
    2384:	42a7           	clr.l -(sp)
    2386:	2f0b           	move.l a3,-(sp)
    2388:	2f0c           	move.l a4,-(sp)
    238a:	4eba eb0c      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    238e:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    2394:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    2398:	41eb 0004      	lea 4(a3),a0
    239c:	2b48 ff74      	move.l a0,-140(a5)
  for(int i=0;i<14;i++) {
    23a0:	41eb 0364      	lea 868(a3),a0
    23a4:	2b48 ff6c      	move.l a0,-148(a5)
    23a8:	2a08           	move.l a0,d5
    23aa:	4fef 0010      	lea 16(sp),sp
  UWORD *valactual = destination+2; 
    23ae:	3c7c 0012      	movea.w #18,a6
  UWORD mask = 0xffff;
    23b2:	74ff           	moveq #-1,d2
    23b4:	7600           	moveq #0,d3
    23b6:	4643           	not.w d3
    23b8:	45fa e558      	lea 912 <TestRow>(pc),a2
    23bc:	280b           	move.l a3,d4
    23be:	2045           	movea.l d5,a0
    23c0:	41e8 fca0      	lea -864(a0),a0
    23c4:	2b48 ff70      	move.l a0,-144(a5)
    23c8:	47ee ffee      	lea -18(a6),a3
      TestRow( valsupposed, valactual, mask, i2+i*19);
    23cc:	2f0b           	move.l a3,-(sp)
    23ce:	2f03           	move.l d3,-(sp)
    23d0:	2f2d ff70      	move.l -144(a5),-(sp)
    23d4:	4879 0000 795c 	pea 795c <destlinezoom1>
    23da:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    23dc:	7030           	moveq #48,d0
    23de:	d1ad ff70      	add.l d0,-144(a5)
      mask = mask ^ 0xffff;
    23e2:	4642           	not.w d2
    23e4:	528b           	addq.l #1,a3
    for(int i2=0;i2<18;i2++) { 
    23e6:	4fef 0010      	lea 16(sp),sp
    23ea:	baad ff70      	cmp.l -144(a5),d5
    23ee:	6600 1a7c      	bne.w 3e6c <ZoomTest+0x242a>
    TestRow( valsupposed, valactual, mask, 18+i*19);
    23f2:	2f0e           	move.l a6,-(sp)
    23f4:	7600           	moveq #0,d3
    23f6:	3602           	move.w d2,d3
    23f8:	2f03           	move.l d3,-(sp)
    23fa:	2f2d ff70      	move.l -144(a5),-(sp)
    23fe:	4879 0000 795c 	pea 795c <destlinezoom1>
    2404:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2406:	2a2d ff70      	move.l -144(a5),d5
    240a:	0685 0000 0390 	addi.l #912,d5
    2410:	4dee 0013      	lea 19(a6),a6
  for(int i=0;i<14;i++) {
    2414:	4fef 0010      	lea 16(sp),sp
    2418:	bcfc 011c      	cmpa.w #284,a6
    241c:	66a0           	bne.s 23be <ZoomTest+0x97c>
    241e:	2644           	movea.l d4,a3
    2420:	41eb 31e4      	lea 12772(a3),a0
    2424:	2b48 ff78      	move.l a0,-136(a5)
    2428:	2b48 ff70      	move.l a0,-144(a5)
    242c:	283c 0000 0109 	move.l #265,d4
    TestRow( valsupposed, valactual, mask, i2+265);
    2432:	2f04           	move.l d4,-(sp)
    2434:	2f03           	move.l d3,-(sp)
    2436:	2f2d ff70      	move.l -144(a5),-(sp)
    243a:	4879 0000 795c 	pea 795c <destlinezoom1>
    2440:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2442:	7030           	moveq #48,d0
    2444:	d1ad ff70      	add.l d0,-144(a5)
    mask = mask ^ 0xffff;
    2448:	4642           	not.w d2
    244a:	5284           	addq.l #1,d4
  for(int i2=0;i2<4;i2++) { 
    244c:	4fef 0010      	lea 16(sp),sp
    2450:	0c84 0000 010d 	cmpi.l #269,d4
    2456:	672a           	beq.s 2482 <ZoomTest+0xa40>
    2458:	7600           	moveq #0,d3
    245a:	3602           	move.w d2,d3
    TestRow( valsupposed, valactual, mask, i2+265);
    245c:	2f04           	move.l d4,-(sp)
    245e:	2f03           	move.l d3,-(sp)
    2460:	2f2d ff70      	move.l -144(a5),-(sp)
    2464:	4879 0000 795c 	pea 795c <destlinezoom1>
    246a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    246c:	7030           	moveq #48,d0
    246e:	d1ad ff70      	add.l d0,-144(a5)
    mask = mask ^ 0xffff;
    2472:	4642           	not.w d2
    2474:	5284           	addq.l #1,d4
  for(int i2=0;i2<4;i2++) { 
    2476:	4fef 0010      	lea 16(sp),sp
    247a:	0c84 0000 010d 	cmpi.l #269,d4
    2480:	66d6           	bne.s 2458 <ZoomTest+0xa16>
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    2482:	4878 0001      	pea 1 <_start+0x1>
    2486:	4878 0001      	pea 1 <_start+0x1>
    248a:	2f0c           	move.l a4,-(sp)
    248c:	2f0b           	move.l a3,-(sp)
    248e:	4eba ea08      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2492:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    2498:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    249c:	41ec 0004      	lea 4(a4),a0
    24a0:	2b48 ff70      	move.l a0,-144(a5)
    24a4:	4fef 0010      	lea 16(sp),sp
    24a8:	2b48 ff7c      	move.l a0,-132(a5)
  for(int i2=0;i2<11;i2++) { 
    24ac:	7600           	moveq #0,d3
  mask = 0x0000;
    24ae:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    24b0:	2f03           	move.l d3,-(sp)
    24b2:	3f02           	move.w d2,-(sp)
    24b4:	4267           	clr.w -(sp)
    24b6:	2f2d ff7c      	move.l -132(a5),-(sp)
    24ba:	4879 0000 7930 	pea 7930 <destlinezoom2>
    24c0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    24c2:	7030           	moveq #48,d0
    24c4:	d1ad ff7c      	add.l d0,-132(a5)
    mask = mask ^ 0xffff;
    24c8:	4642           	not.w d2
  for(int i2=0;i2<11;i2++) { 
    24ca:	5283           	addq.l #1,d3
    24cc:	4fef 0010      	lea 16(sp),sp
    24d0:	720b           	moveq #11,d1
    24d2:	b283           	cmp.l d3,d1
    24d4:	66da           	bne.s 24b0 <ZoomTest+0xa6e>
  TestRow( valsupposed, valactual, 0xffff, 8);
    24d6:	4878 0008      	pea 8 <main+0x2>
    24da:	2f3c 0000 ffff 	move.l #65535,-(sp)
    24e0:	41ec 0214      	lea 532(a4),a0
    24e4:	2b48 ff98      	move.l a0,-104(a5)
    24e8:	2f08           	move.l a0,-(sp)
    24ea:	4879 0000 7930 	pea 7930 <destlinezoom2>
    24f0:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0xffff, 9);
    24f2:	4878 0009      	pea 9 <main+0x3>
    24f6:	2f3c 0000 ffff 	move.l #65535,-(sp)
    24fc:	486c 0244      	pea 580(a4)
    2500:	4879 0000 7930 	pea 7930 <destlinezoom2>
    2506:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0x0000, 10);
    2508:	4fef 0020      	lea 32(sp),sp
    250c:	4878 000a      	pea a <main+0x4>
    2510:	42a7           	clr.l -(sp)
    2512:	486c 0274      	pea 628(a4)
    2516:	4879 0000 7930 	pea 7930 <destlinezoom2>
    251c:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0x0000, 11);
    251e:	4878 000b      	pea b <main+0x5>
    2522:	42a7           	clr.l -(sp)
    2524:	486c 02a4      	pea 676(a4)
    2528:	4879 0000 7930 	pea 7930 <destlinezoom2>
    252e:	4e92           	jsr (a2)
  for(int i=0;i<12;i++) {
    2530:	2a0c           	move.l a4,d5
    2532:	0685 0000 05d4 	addi.l #1492,d5
    2538:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
    253c:	2c05           	move.l d5,d6
    253e:	3c7c 0018      	movea.w #24,a6
    2542:	7800           	moveq #0,d4
    2544:	3802           	move.w d2,d4
    2546:	2e0b           	move.l a3,d7
    2548:	2046           	movea.l d6,a0
    254a:	41e8 fd00      	lea -768(a0),a0
    254e:	2b48 ff7c      	move.l a0,-132(a5)
    2552:	47ee fff3      	lea -13(a6),a3
    2556:	2604           	move.l d4,d3
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    2558:	2f0b           	move.l a3,-(sp)
    255a:	2f03           	move.l d3,-(sp)
    255c:	2f2d ff7c      	move.l -132(a5),-(sp)
    2560:	4879 0000 7930 	pea 7930 <destlinezoom2>
    2566:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2568:	7030           	moveq #48,d0
    256a:	d1ad ff7c      	add.l d0,-132(a5)
      mask = mask ^ 0xffff;
    256e:	4642           	not.w d2
    2570:	528b           	addq.l #1,a3
    for(int i2=0;i2<16;i2++) {  
    2572:	4fef 0010      	lea 16(sp),sp
    2576:	bcad ff7c      	cmp.l -132(a5),d6
    257a:	6728           	beq.s 25a4 <ZoomTest+0xb62>
    257c:	7600           	moveq #0,d3
    257e:	3602           	move.w d2,d3
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    2580:	2f0b           	move.l a3,-(sp)
    2582:	2f03           	move.l d3,-(sp)
    2584:	2f2d ff7c      	move.l -132(a5),-(sp)
    2588:	4879 0000 7930 	pea 7930 <destlinezoom2>
    258e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2590:	7030           	moveq #48,d0
    2592:	d1ad ff7c      	add.l d0,-132(a5)
      mask = mask ^ 0xffff;
    2596:	4642           	not.w d2
    2598:	528b           	addq.l #1,a3
    for(int i2=0;i2<16;i2++) {  
    259a:	4fef 0010      	lea 16(sp),sp
    259e:	bcad ff7c      	cmp.l -132(a5),d6
    25a2:	66d8           	bne.s 257c <ZoomTest+0xb3a>
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    25a4:	7800           	moveq #0,d4
    25a6:	3802           	move.w d2,d4
    25a8:	2f0e           	move.l a6,-(sp)
    25aa:	2f04           	move.l d4,-(sp)
    25ac:	2f2d ff7c      	move.l -132(a5),-(sp)
    25b0:	4879 0000 7930 	pea 7930 <destlinezoom2>
    25b6:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    25b8:	486e 0001      	pea 1(a6)
    25bc:	2f04           	move.l d4,-(sp)
    25be:	206d ff7c      	movea.l -132(a5),a0
    25c2:	4868 0030      	pea 48(a0)
    25c6:	4879 0000 7930 	pea 7930 <destlinezoom2>
    25cc:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    25ce:	4fef 0020      	lea 32(sp),sp
    25d2:	486e 0002      	pea 2(a6)
    25d6:	2f03           	move.l d3,-(sp)
    25d8:	206d ff7c      	movea.l -132(a5),a0
    25dc:	4868 0060      	pea 96(a0)
    25e0:	4879 0000 7930 	pea 7930 <destlinezoom2>
    25e6:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    25e8:	486e 0003      	pea 3(a6)
    25ec:	2f03           	move.l d3,-(sp)
    25ee:	206d ff7c      	movea.l -132(a5),a0
    25f2:	4868 0090      	pea 144(a0)
    25f6:	4879 0000 7930 	pea 7930 <destlinezoom2>
    25fc:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    25fe:	2c2d ff7c      	move.l -132(a5),d6
    2602:	0686 0000 03c0 	addi.l #960,d6
    2608:	4dee 0011      	lea 17(a6),a6
  for(int i=0;i<12;i++) {
    260c:	4fef 0020      	lea 32(sp),sp
    2610:	bcfc 00e4      	cmpa.w #228,a6
    2614:	6600 ff32      	bne.w 2548 <ZoomTest+0xb06>
    2618:	2647           	movea.l d7,a3
    261a:	41ec 2fd4      	lea 12244(a4),a0
    261e:	2b48 ff9c      	move.l a0,-100(a5)
    2622:	2b48 ff7c      	move.l a0,-132(a5)
  for(int i2=0;i2<15;i2++) { 
    2626:	7600           	moveq #0,d3
    TestRow( valsupposed, valactual, mask, i2);
    2628:	2f03           	move.l d3,-(sp)
    262a:	2f04           	move.l d4,-(sp)
    262c:	2f2d ff7c      	move.l -132(a5),-(sp)
    2630:	4879 0000 7930 	pea 7930 <destlinezoom2>
    2636:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2638:	7030           	moveq #48,d0
    263a:	d1ad ff7c      	add.l d0,-132(a5)
    mask = mask ^ 0xffff;
    263e:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    2640:	5283           	addq.l #1,d3
    2642:	4fef 0010      	lea 16(sp),sp
    2646:	720f           	moveq #15,d1
    2648:	b283           	cmp.l d3,d1
    264a:	6728           	beq.s 2674 <ZoomTest+0xc32>
    264c:	7800           	moveq #0,d4
    264e:	3802           	move.w d2,d4
    TestRow( valsupposed, valactual, mask, i2);
    2650:	2f03           	move.l d3,-(sp)
    2652:	2f04           	move.l d4,-(sp)
    2654:	2f2d ff7c      	move.l -132(a5),-(sp)
    2658:	4879 0000 7930 	pea 7930 <destlinezoom2>
    265e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2660:	7030           	moveq #48,d0
    2662:	d1ad ff7c      	add.l d0,-132(a5)
    mask = mask ^ 0xffff;
    2666:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    2668:	5283           	addq.l #1,d3
    266a:	4fef 0010      	lea 16(sp),sp
    266e:	720f           	moveq #15,d1
    2670:	b283           	cmp.l d3,d1
    2672:	66d8           	bne.s 264c <ZoomTest+0xc0a>
  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    2674:	4878 0001      	pea 1 <_start+0x1>
    2678:	4878 0002      	pea 2 <_start+0x2>
    267c:	2f0b           	move.l a3,-(sp)
    267e:	2f0c           	move.l a4,-(sp)
    2680:	4eba e816      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2684:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    268a:	4eae ff1c      	jsr -228(a6)
    268e:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    2692:	2b6d ff74 ff7c 	move.l -140(a5),-132(a5)
  for(int i2=0;i2<4;i2++) { 
    2698:	7400           	moveq #0,d2
  mask = 0xffff;
    269a:	76ff           	moveq #-1,d3
    TestRow( valsupposed, valactual, mask, i2);
    269c:	2f02           	move.l d2,-(sp)
    269e:	3f03           	move.w d3,-(sp)
    26a0:	4267           	clr.w -(sp)
    26a2:	2f2d ff7c      	move.l -132(a5),-(sp)
    26a6:	4879 0000 7904 	pea 7904 <destlinezoom3>
    26ac:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    26ae:	7030           	moveq #48,d0
    26b0:	d1ad ff7c      	add.l d0,-132(a5)
    mask = mask ^ 0xffff;
    26b4:	4643           	not.w d3
  for(int i2=0;i2<4;i2++) { 
    26b6:	5282           	addq.l #1,d2
    26b8:	4fef 0010      	lea 16(sp),sp
    26bc:	7204           	moveq #4,d1
    26be:	b282           	cmp.l d2,d1
    26c0:	66da           	bne.s 269c <ZoomTest+0xc5a>
  TestRow( valsupposed, valactual, 0xffff, 0+4);
    26c2:	4878 0004      	pea 4 <_start+0x4>
    26c6:	2f3c 0000 ffff 	move.l #65535,-(sp)
    26cc:	486b 00c4      	pea 196(a3)
    26d0:	4879 0000 7904 	pea 7904 <destlinezoom3>
    26d6:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    26d8:	4878 0005      	pea 5 <_start+0x5>
    26dc:	2f3c 0000 ffff 	move.l #65535,-(sp)
    26e2:	486b 00f4      	pea 244(a3)
    26e6:	4879 0000 7904 	pea 7904 <destlinezoom3>
    26ec:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    26ee:	4fef 0020      	lea 32(sp),sp
    26f2:	4878 0006      	pea 6 <main>
    26f6:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
    26f8:	41eb 0124      	lea 292(a3),a0
    26fc:	2b48 ffa4      	move.l a0,-92(a5)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    2700:	2f08           	move.l a0,-(sp)
    2702:	4879 0000 7904 	pea 7904 <destlinezoom3>
    2708:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    270a:	4878 0007      	pea 7 <main+0x1>
    270e:	42a7           	clr.l -(sp)
    2710:	486b 0154      	pea 340(a3)
    2714:	4879 0000 7904 	pea 7904 <destlinezoom3>
    271a:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    271c:	4fef 0020      	lea 32(sp),sp
    2720:	4878 0008      	pea 8 <main+0x2>
    2724:	2f3c 0000 ffff 	move.l #65535,-(sp)
    272a:	486b 0184      	pea 388(a3)
    272e:	4879 0000 7904 	pea 7904 <destlinezoom3>
    2734:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2736:	4878 0009      	pea 9 <main+0x3>
    273a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2740:	486b 01b4      	pea 436(a3)
    2744:	4879 0000 7904 	pea 7904 <destlinezoom3>
    274a:	4e92           	jsr (a2)
  for(int i=0;i<12;i++) {
    274c:	2c0b           	move.l a3,d6
    274e:	0686 0000 04b4 	addi.l #1204,d6
    2754:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2758:	3c7c 0018      	movea.w #24,a6
    275c:	7800           	moveq #0,d4
    275e:	74ff           	moveq #-1,d2
    2760:	2e0b           	move.l a3,d7
    2762:	2046           	movea.l d6,a0
    2764:	41e8 fd30      	lea -720(a0),a0
    2768:	2b48 ff7c      	move.l a0,-132(a5)
    276c:	47ee fff1      	lea -15(a6),a3
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2770:	2f0b           	move.l a3,-(sp)
    2772:	2f04           	move.l d4,-(sp)
    2774:	2f2d ff7c      	move.l -132(a5),-(sp)
    2778:	4879 0000 7904 	pea 7904 <destlinezoom3>
    277e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2780:	7030           	moveq #48,d0
    2782:	d1ad ff7c      	add.l d0,-132(a5)
      mask = mask ^ 0xffff;
    2786:	528b           	addq.l #1,a3
    for(int i2=0;i2<15;i2++) {  
    2788:	4fef 0010      	lea 16(sp),sp
    278c:	bcad ff7c      	cmp.l -132(a5),d6
    2790:	6728           	beq.s 27ba <ZoomTest+0xd78>
    2792:	7800           	moveq #0,d4
    2794:	3802           	move.w d2,d4
    2796:	4642           	not.w d2
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2798:	2f0b           	move.l a3,-(sp)
    279a:	2f04           	move.l d4,-(sp)
    279c:	2f2d ff7c      	move.l -132(a5),-(sp)
    27a0:	4879 0000 7904 	pea 7904 <destlinezoom3>
    27a6:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    27a8:	7030           	moveq #48,d0
    27aa:	d1ad ff7c      	add.l d0,-132(a5)
      mask = mask ^ 0xffff;
    27ae:	528b           	addq.l #1,a3
    for(int i2=0;i2<15;i2++) {  
    27b0:	4fef 0010      	lea 16(sp),sp
    27b4:	bcad ff7c      	cmp.l -132(a5),d6
    27b8:	66d8           	bne.s 2792 <ZoomTest+0xd50>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    27ba:	7600           	moveq #0,d3
    27bc:	3602           	move.w d2,d3
    27be:	2f0e           	move.l a6,-(sp)
    27c0:	2f03           	move.l d3,-(sp)
    27c2:	2f2d ff7c      	move.l -132(a5),-(sp)
    27c6:	4879 0000 7904 	pea 7904 <destlinezoom3>
    27cc:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    27ce:	486e 0001      	pea 1(a6)
    27d2:	2f03           	move.l d3,-(sp)
    27d4:	206d ff7c      	movea.l -132(a5),a0
    27d8:	4868 0030      	pea 48(a0)
    27dc:	4879 0000 7904 	pea 7904 <destlinezoom3>
    27e2:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    27e4:	4fef 0020      	lea 32(sp),sp
    27e8:	486e 0002      	pea 2(a6)
    27ec:	2f04           	move.l d4,-(sp)
    27ee:	206d ff7c      	movea.l -132(a5),a0
    27f2:	4868 0060      	pea 96(a0)
    27f6:	4879 0000 7904 	pea 7904 <destlinezoom3>
    27fc:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    27fe:	486e 0003      	pea 3(a6)
    2802:	2f04           	move.l d4,-(sp)
    2804:	206d ff7c      	movea.l -132(a5),a0
    2808:	4868 0090      	pea 144(a0)
    280c:	4879 0000 7904 	pea 7904 <destlinezoom3>
    2812:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2814:	4fef 0020      	lea 32(sp),sp
    2818:	486e 0004      	pea 4(a6)
    281c:	2f03           	move.l d3,-(sp)
    281e:	206d ff7c      	movea.l -132(a5),a0
    2822:	4868 00c0      	pea 192(a0)
    2826:	4879 0000 7904 	pea 7904 <destlinezoom3>
    282c:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    282e:	486e 0005      	pea 5(a6)
    2832:	2f03           	move.l d3,-(sp)
    2834:	206d ff7c      	movea.l -132(a5),a0
    2838:	4868 00f0      	pea 240(a0)
    283c:	4879 0000 7904 	pea 7904 <destlinezoom3>
    2842:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2844:	2c2d ff7c      	move.l -132(a5),d6
    2848:	0686 0000 03f0 	addi.l #1008,d6
    284e:	4dee 0015      	lea 21(a6),a6
  for(int i=0;i<12;i++) {
    2852:	4fef 0020      	lea 32(sp),sp
    2856:	bcfc 0114      	cmpa.w #276,a6
    285a:	6600 ff06      	bne.w 2762 <ZoomTest+0xd20>
    285e:	2647           	movea.l d7,a3
    2860:	41eb 3124      	lea 12580(a3),a0
    2864:	2b48 ff7c      	move.l a0,-132(a5)
    2868:	263c 0000 0105 	move.l #261,d3
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    286e:	2f03           	move.l d3,-(sp)
    2870:	2f04           	move.l d4,-(sp)
    2872:	2f2d ff7c      	move.l -132(a5),-(sp)
    2876:	4879 0000 7904 	pea 7904 <destlinezoom3>
    287c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    287e:	7030           	moveq #48,d0
    2880:	d1ad ff7c      	add.l d0,-132(a5)
    mask = mask ^ 0xffff;
    2884:	5283           	addq.l #1,d3
  for(int i2=0;i2<8;i2++) {  
    2886:	4fef 0010      	lea 16(sp),sp
    288a:	0c83 0000 010d 	cmpi.l #269,d3
    2890:	672a           	beq.s 28bc <ZoomTest+0xe7a>
    2892:	7800           	moveq #0,d4
    2894:	3802           	move.w d2,d4
    2896:	4642           	not.w d2
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    2898:	2f03           	move.l d3,-(sp)
    289a:	2f04           	move.l d4,-(sp)
    289c:	2f2d ff7c      	move.l -132(a5),-(sp)
    28a0:	4879 0000 7904 	pea 7904 <destlinezoom3>
    28a6:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    28a8:	7030           	moveq #48,d0
    28aa:	d1ad ff7c      	add.l d0,-132(a5)
    mask = mask ^ 0xffff;
    28ae:	5283           	addq.l #1,d3
  for(int i2=0;i2<8;i2++) {  
    28b0:	4fef 0010      	lea 16(sp),sp
    28b4:	0c83 0000 010d 	cmpi.l #269,d3
    28ba:	66d6           	bne.s 2892 <ZoomTest+0xe50>
  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    28bc:	4878 0001      	pea 1 <_start+0x1>
    28c0:	4878 0003      	pea 3 <_start+0x3>
    28c4:	2f0c           	move.l a4,-(sp)
    28c6:	2f0b           	move.l a3,-(sp)
    28c8:	4eba e5ce      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    28cc:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    28d2:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    28d6:	4878 0007      	pea 7 <main+0x1>
    28da:	42a7           	clr.l -(sp)
    28dc:	2f2d ff70      	move.l -144(a5),-(sp)
    28e0:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    28e6:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    28e8:	41ec 0034      	lea 52(a4),a0
    28ec:	2b48 ff80      	move.l a0,-128(a5)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    28f0:	4fef 0020      	lea 32(sp),sp
    28f4:	4878 0008      	pea 8 <main+0x2>
    28f8:	2f3c 0000 ffff 	move.l #65535,-(sp)
    28fe:	2f08           	move.l a0,-(sp)
    2900:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    2906:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    2908:	41ec 0064      	lea 100(a4),a0
    290c:	2b48 ff90      	move.l a0,-112(a5)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2910:	4878 0009      	pea 9 <main+0x3>
    2914:	2f3c 0000 ffff 	move.l #65535,-(sp)
    291a:	2f08           	move.l a0,-(sp)
    291c:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    2922:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    2924:	41ec 0094      	lea 148(a4),a0
    2928:	2b48 ff7c      	move.l a0,-132(a5)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    292c:	4fef 0020      	lea 32(sp),sp
    2930:	4878 0008      	pea 8 <main+0x2>
    2934:	42a7           	clr.l -(sp)
    2936:	2f08           	move.l a0,-(sp)
    2938:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    293e:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    2940:	4878 0009      	pea 9 <main+0x3>
    2944:	42a7           	clr.l -(sp)
    2946:	486c 00c4      	pea 196(a4)
    294a:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    2950:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    2952:	41ec 00f4      	lea 244(a4),a0
    2956:	2b48 ff84      	move.l a0,-124(a5)
  for(int i=0;i<12;i++) {
    295a:	2c0c           	move.l a4,d6
    295c:	0686 0000 0394 	addi.l #916,d6
    2962:	4fef 0020      	lea 32(sp),sp
  valactual += ZMLINESIZE/2;
    2966:	3c7c 0018      	movea.w #24,a6
  mask = 0xffff;
    296a:	78ff           	moveq #-1,d4
    296c:	7400           	moveq #0,d2
    296e:	4642           	not.w d2
    2970:	2e0b           	move.l a3,d7
    2972:	2046           	movea.l d6,a0
    2974:	41e8 fd60      	lea -672(a0),a0
    2978:	2b48 ff88      	move.l a0,-120(a5)
    297c:	47ee fff1      	lea -15(a6),a3
    2980:	2602           	move.l d2,d3
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2982:	2f0b           	move.l a3,-(sp)
    2984:	2f03           	move.l d3,-(sp)
    2986:	2f2d ff88      	move.l -120(a5),-(sp)
    298a:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    2990:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2992:	7030           	moveq #48,d0
    2994:	d1ad ff88      	add.l d0,-120(a5)
      mask = mask ^ 0xffff;
    2998:	4644           	not.w d4
    299a:	528b           	addq.l #1,a3
    for(int i2=0;i2<14;i2++) {  
    299c:	4fef 0010      	lea 16(sp),sp
    29a0:	bcad ff88      	cmp.l -120(a5),d6
    29a4:	6728           	beq.s 29ce <ZoomTest+0xf8c>
    29a6:	7600           	moveq #0,d3
    29a8:	3604           	move.w d4,d3
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    29aa:	2f0b           	move.l a3,-(sp)
    29ac:	2f03           	move.l d3,-(sp)
    29ae:	2f2d ff88      	move.l -120(a5),-(sp)
    29b2:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    29b8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    29ba:	7030           	moveq #48,d0
    29bc:	d1ad ff88      	add.l d0,-120(a5)
      mask = mask ^ 0xffff;
    29c0:	4644           	not.w d4
    29c2:	528b           	addq.l #1,a3
    for(int i2=0;i2<14;i2++) {  
    29c4:	4fef 0010      	lea 16(sp),sp
    29c8:	bcad ff88      	cmp.l -120(a5),d6
    29cc:	66d8           	bne.s 29a6 <ZoomTest+0xf64>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    29ce:	7400           	moveq #0,d2
    29d0:	3404           	move.w d4,d2
    29d2:	2f0e           	move.l a6,-(sp)
    29d4:	2f02           	move.l d2,-(sp)
    29d6:	2f2d ff88      	move.l -120(a5),-(sp)
    29da:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    29e0:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    29e2:	486e 0001      	pea 1(a6)
    29e6:	2f02           	move.l d2,-(sp)
    29e8:	206d ff88      	movea.l -120(a5),a0
    29ec:	4868 0030      	pea 48(a0)
    29f0:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    29f6:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    29f8:	4fef 0020      	lea 32(sp),sp
    29fc:	486e 0002      	pea 2(a6)
    2a00:	2f03           	move.l d3,-(sp)
    2a02:	206d ff88      	movea.l -120(a5),a0
    2a06:	4868 0060      	pea 96(a0)
    2a0a:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    2a10:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    2a12:	486e 0003      	pea 3(a6)
    2a16:	2f03           	move.l d3,-(sp)
    2a18:	206d ff88      	movea.l -120(a5),a0
    2a1c:	4868 0090      	pea 144(a0)
    2a20:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    2a26:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2a28:	47ee 0004      	lea 4(a6),a3
    2a2c:	4fef 001c      	lea 28(sp),sp
    2a30:	2e8b           	move.l a3,(sp)
    2a32:	2f02           	move.l d2,-(sp)
    2a34:	206d ff88      	movea.l -120(a5),a0
    2a38:	4868 00c0      	pea 192(a0)
    2a3c:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    2a42:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2a44:	2c0e           	move.l a6,d6
    2a46:	5a86           	addq.l #5,d6
    2a48:	2f06           	move.l d6,-(sp)
    2a4a:	2f02           	move.l d2,-(sp)
    2a4c:	206d ff88      	movea.l -120(a5),a0
    2a50:	4868 00f0      	pea 240(a0)
    2a54:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    2a5a:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2a5c:	4fef 001c      	lea 28(sp),sp
    2a60:	2e8b           	move.l a3,(sp)
    2a62:	2f03           	move.l d3,-(sp)
    2a64:	206d ff88      	movea.l -120(a5),a0
    2a68:	4868 0120      	pea 288(a0)
    2a6c:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    2a72:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2a74:	2f06           	move.l d6,-(sp)
    2a76:	2f03           	move.l d3,-(sp)
    2a78:	206d ff88      	movea.l -120(a5),a0
    2a7c:	4868 0150      	pea 336(a0)
    2a80:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    2a86:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2a88:	2c2d ff88      	move.l -120(a5),d6
    2a8c:	0686 0000 0420 	addi.l #1056,d6
    2a92:	4dee 0015      	lea 21(a6),a6
  for(int i=0;i<12;i++) {
    2a96:	4fef 0020      	lea 32(sp),sp
    2a9a:	bcfc 0114      	cmpa.w #276,a6
    2a9e:	6600 fed2      	bne.w 2972 <ZoomTest+0xf30>
    2aa2:	2647           	movea.l d7,a3
  TestRow( valsupposed, valactual, mask, 269);
    2aa4:	4878 010d      	pea 10d <main+0x107>
    2aa8:	2f02           	move.l d2,-(sp)
    2aaa:	486c 3274      	pea 12916(a4)
    2aae:	4879 0000 78d8 	pea 78d8 <destlinezoom4>
    2ab4:	4e92           	jsr (a2)
  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    2ab6:	4878 0001      	pea 1 <_start+0x1>
    2aba:	4878 0004      	pea 4 <_start+0x4>
    2abe:	2f07           	move.l d7,-(sp)
    2ac0:	2f0c           	move.l a4,-(sp)
    2ac2:	4eba e3d4      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2ac6:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    2acc:	4eae ff1c      	jsr -228(a6)
    2ad0:	4fef 0020      	lea 32(sp),sp
  valactual = destination+2; 
    2ad4:	2c6d ff74      	movea.l -140(a5),a6
  for(int i2=0;i2<13;i2++) {  
    2ad8:	42ad ff88      	clr.l -120(a5)
  mask = 0x0000;
    2adc:	4244           	clr.w d4
    TestRow( valsupposed, valactual, mask, i2);
    2ade:	7400           	moveq #0,d2
    2ae0:	3404           	move.w d4,d2
    2ae2:	2f2d ff88      	move.l -120(a5),-(sp)
    2ae6:	2f02           	move.l d2,-(sp)
    2ae8:	2f0e           	move.l a6,-(sp)
    2aea:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2af0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2af2:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2af6:	4644           	not.w d4
  for(int i2=0;i2<13;i2++) {  
    2af8:	52ad ff88      	addq.l #1,-120(a5)
    2afc:	4fef 0010      	lea 16(sp),sp
    2b00:	700d           	moveq #13,d0
    2b02:	b0ad ff88      	cmp.l -120(a5),d0
    2b06:	66d6           	bne.s 2ade <ZoomTest+0x109c>
    2b08:	7600           	moveq #0,d3
    2b0a:	3604           	move.w d4,d3
  TestRow( valsupposed, valactual, mask, 12);   
    2b0c:	4878 000c      	pea c <main+0x6>
    2b10:	2f03           	move.l d3,-(sp)
    2b12:	486b 0274      	pea 628(a3)
    2b16:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2b1c:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 13);
    2b1e:	4878 000d      	pea d <main+0x7>
    2b22:	2f03           	move.l d3,-(sp)
    2b24:	486b 02a4      	pea 676(a3)
    2b28:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2b2e:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 14);
    2b30:	4fef 0020      	lea 32(sp),sp
    2b34:	4878 000e      	pea e <main+0x8>
    2b38:	2f02           	move.l d2,-(sp)
    2b3a:	486b 02d4      	pea 724(a3)
    2b3e:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2b44:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 15);
    2b46:	4878 000f      	pea f <main+0x9>
    2b4a:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2b4c:	41eb 0304      	lea 772(a3),a0
    2b50:	2b48 ff8c      	move.l a0,-116(a5)
  TestRow( valsupposed, valactual, mask, 15);
    2b54:	2f08           	move.l a0,-(sp)
    2b56:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2b5c:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 16);
    2b5e:	4fef 0020      	lea 32(sp),sp
    2b62:	4878 0010      	pea 10 <main+0xa>
    2b66:	2f03           	move.l d3,-(sp)
    2b68:	486b 0334      	pea 820(a3)
    2b6c:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2b72:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 17);
    2b74:	4878 0011      	pea 11 <main+0xb>
    2b78:	2f03           	move.l d3,-(sp)
    2b7a:	2f2d ff6c      	move.l -148(a5),-(sp)
    2b7e:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2b84:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 18);
    2b86:	4fef 0020      	lea 32(sp),sp
    2b8a:	4878 0012      	pea 12 <main+0xc>
    2b8e:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2b90:	41eb 0394      	lea 916(a3),a0
    2b94:	2b48 ffa0      	move.l a0,-96(a5)
  TestRow( valsupposed, valactual, mask, 18);
    2b98:	2f08           	move.l a0,-(sp)
    2b9a:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2ba0:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 19);
    2ba2:	4878 0013      	pea 13 <main+0xd>
    2ba6:	2f02           	move.l d2,-(sp)
    2ba8:	486b 03c4      	pea 964(a3)
    2bac:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2bb2:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 20);
    2bb4:	4fef 0020      	lea 32(sp),sp
    2bb8:	4878 0014      	pea 14 <main+0xe>
    2bbc:	2f03           	move.l d3,-(sp)
    2bbe:	486b 03f4      	pea 1012(a3)
    2bc2:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2bc8:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 21);
    2bca:	4878 0015      	pea 15 <main+0xf>
    2bce:	2f03           	move.l d3,-(sp)
    2bd0:	486b 0424      	pea 1060(a3)
    2bd4:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2bda:	4e92           	jsr (a2)
  for(int i=0;i<10;i++) {
    2bdc:	2c0b           	move.l a3,d6
    2bde:	0686 0000 06c4 	addi.l #1732,d6
    2be4:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, mask, 21);
    2be8:	307c 0023      	movea.w #35,a0
    2bec:	2b48 ff68      	move.l a0,-152(a5)
    2bf0:	2e0b           	move.l a3,d7
    2bf2:	2c46           	movea.l d6,a6
    2bf4:	4dee fd90      	lea -624(a6),a6
    2bf8:	367c fff3      	movea.w #-13,a3
    2bfc:	d7ed ff68      	adda.l -152(a5),a3
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    2c00:	2f0b           	move.l a3,-(sp)
    2c02:	2f02           	move.l d2,-(sp)
    2c04:	2f0e           	move.l a6,-(sp)
    2c06:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2c0c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2c0e:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2c12:	528b           	addq.l #1,a3
    for(int i2=0;i2<13;i2++) {  
    2c14:	4fef 0010      	lea 16(sp),sp
    2c18:	bc8e           	cmp.l a6,d6
    2c1a:	6722           	beq.s 2c3e <ZoomTest+0x11fc>
    2c1c:	7400           	moveq #0,d2
    2c1e:	3404           	move.w d4,d2
    2c20:	4644           	not.w d4
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    2c22:	2f0b           	move.l a3,-(sp)
    2c24:	2f02           	move.l d2,-(sp)
    2c26:	2f0e           	move.l a6,-(sp)
    2c28:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2c2e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2c30:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2c34:	528b           	addq.l #1,a3
    for(int i2=0;i2<13;i2++) {  
    2c36:	4fef 0010      	lea 16(sp),sp
    2c3a:	bc8e           	cmp.l a6,d6
    2c3c:	66de           	bne.s 2c1c <ZoomTest+0x11da>
    TestRow( valsupposed, valactual, mask, i*21+22+13);
    2c3e:	7600           	moveq #0,d3
    2c40:	3604           	move.w d4,d3
    2c42:	2f2d ff68      	move.l -152(a5),-(sp)
    2c46:	2f03           	move.l d3,-(sp)
    2c48:	2f0e           	move.l a6,-(sp)
    2c4a:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2c50:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    2c52:	206d ff68      	movea.l -152(a5),a0
    2c56:	4868 0001      	pea 1(a0)
    2c5a:	2f03           	move.l d3,-(sp)
    2c5c:	486e 0030      	pea 48(a6)
    2c60:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2c66:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    2c68:	4fef 0020      	lea 32(sp),sp
    2c6c:	206d ff68      	movea.l -152(a5),a0
    2c70:	4868 0002      	pea 2(a0)
    2c74:	2f02           	move.l d2,-(sp)
    2c76:	486e 0060      	pea 96(a6)
    2c7a:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2c80:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    2c82:	206d ff68      	movea.l -152(a5),a0
    2c86:	4868 0003      	pea 3(a0)
    2c8a:	2f02           	move.l d2,-(sp)
    2c8c:	486e 0090      	pea 144(a6)
    2c90:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2c96:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    2c98:	4fef 0020      	lea 32(sp),sp
    2c9c:	206d ff68      	movea.l -152(a5),a0
    2ca0:	4868 0004      	pea 4(a0)
    2ca4:	2f03           	move.l d3,-(sp)
    2ca6:	486e 00c0      	pea 192(a6)
    2caa:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2cb0:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    2cb2:	206d ff68      	movea.l -152(a5),a0
    2cb6:	4868 0005      	pea 5(a0)
    2cba:	2f03           	move.l d3,-(sp)
    2cbc:	486e 00f0      	pea 240(a6)
    2cc0:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2cc6:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    2cc8:	4fef 0020      	lea 32(sp),sp
    2ccc:	206d ff68      	movea.l -152(a5),a0
    2cd0:	4868 0006      	pea 6(a0)
    2cd4:	2f02           	move.l d2,-(sp)
    2cd6:	486e 0120      	pea 288(a6)
    2cda:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2ce0:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    2ce2:	206d ff68      	movea.l -152(a5),a0
    2ce6:	4868 0007      	pea 7(a0)
    2cea:	2f02           	move.l d2,-(sp)
    2cec:	486e 0150      	pea 336(a6)
    2cf0:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2cf6:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    2cf8:	4fef 0020      	lea 32(sp),sp
    2cfc:	206d ff68      	movea.l -152(a5),a0
    2d00:	4868 0008      	pea 8(a0)
    2d04:	2f03           	move.l d3,-(sp)
    2d06:	486e 0180      	pea 384(a6)
    2d0a:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2d10:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    2d12:	206d ff68      	movea.l -152(a5),a0
    2d16:	4868 0009      	pea 9(a0)
    2d1a:	2f03           	move.l d3,-(sp)
    2d1c:	486e 01b0      	pea 432(a6)
    2d20:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2d26:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2d28:	2c0e           	move.l a6,d6
    2d2a:	0686 0000 0450 	addi.l #1104,d6
    2d30:	7015           	moveq #21,d0
    2d32:	d1ad ff68      	add.l d0,-152(a5)
  for(int i=0;i<10;i++) {
    2d36:	4fef 0020      	lea 32(sp),sp
    2d3a:	0cad 0000 00f5 	cmpi.l #245,-152(a5)
    2d40:	ff68 
    2d42:	6600 feae      	bne.w 2bf2 <ZoomTest+0x11b0>
    2d46:	2647           	movea.l d7,a3
    2d48:	4deb 2f74      	lea 12148(a3),a6
    2d4c:	7c02           	moveq #2,d6
    2d4e:	4606           	not.b d6
    TestRow( valsupposed, valactual, mask, i2+253);
    2d50:	2f06           	move.l d6,-(sp)
    2d52:	2f02           	move.l d2,-(sp)
    2d54:	2f0e           	move.l a6,-(sp)
    2d56:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2d5c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2d5e:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2d62:	5286           	addq.l #1,d6
  for(int i2=0;i2<13;i2++) {  
    2d64:	4fef 0010      	lea 16(sp),sp
    2d68:	0c86 0000 010a 	cmpi.l #266,d6
    2d6e:	6726           	beq.s 2d96 <ZoomTest+0x1354>
    2d70:	7400           	moveq #0,d2
    2d72:	3404           	move.w d4,d2
    2d74:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, i2+253);
    2d76:	2f06           	move.l d6,-(sp)
    2d78:	2f02           	move.l d2,-(sp)
    2d7a:	2f0e           	move.l a6,-(sp)
    2d7c:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2d82:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2d84:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2d88:	5286           	addq.l #1,d6
  for(int i2=0;i2<13;i2++) {  
    2d8a:	4fef 0010      	lea 16(sp),sp
    2d8e:	0c86 0000 010a 	cmpi.l #266,d6
    2d94:	66da           	bne.s 2d70 <ZoomTest+0x132e>
    2d96:	0284 0000 ffff 	andi.l #65535,d4
  TestRow( valsupposed, valactual, mask, 266);
    2d9c:	2f06           	move.l d6,-(sp)
    2d9e:	2f04           	move.l d4,-(sp)
    2da0:	2f2d ff78      	move.l -136(a5),-(sp)
    2da4:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2daa:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 267);
    2dac:	4878 010b      	pea 10b <main+0x105>
    2db0:	2f04           	move.l d4,-(sp)
  valactual += ZMLINESIZE/2;
    2db2:	41eb 3214      	lea 12820(a3),a0
    2db6:	2b48 ffa8      	move.l a0,-88(a5)
  TestRow( valsupposed, valactual, mask, 267);
    2dba:	2f08           	move.l a0,-(sp)
    2dbc:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2dc2:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 268);
    2dc4:	4fef 0020      	lea 32(sp),sp
    2dc8:	4878 010c      	pea 10c <main+0x106>
    2dcc:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2dce:	41eb 3244      	lea 12868(a3),a0
    2dd2:	2b48 ff94      	move.l a0,-108(a5)
  TestRow( valsupposed, valactual, mask, 268);
    2dd6:	2f08           	move.l a0,-(sp)
    2dd8:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2dde:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 269);
    2de0:	4878 010d      	pea 10d <main+0x107>
    2de4:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2de6:	41eb 3274      	lea 12916(a3),a0
    2dea:	2b48 ff78      	move.l a0,-136(a5)
  TestRow( valsupposed, valactual, mask, 269);
    2dee:	2f08           	move.l a0,-(sp)
    2df0:	4879 0000 78ac 	pea 78ac <destlinezoom5>
    2df6:	4e92           	jsr (a2)
  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    2df8:	4fef 0020      	lea 32(sp),sp
    2dfc:	4878 0001      	pea 1 <_start+0x1>
    2e00:	4878 0005      	pea 5 <_start+0x5>
    2e04:	2f0c           	move.l a4,-(sp)
    2e06:	2f0b           	move.l a3,-(sp)
    2e08:	4eba e08e      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2e0c:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    2e12:	4eae ff1c      	jsr -228(a6)
    2e16:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    2e1a:	2c6d ff70      	movea.l -144(a5),a6
  for(int i2=0;i2<7;i2++) {  
    2e1e:	7400           	moveq #0,d2
  mask = 0x0000;
    2e20:	4243           	clr.w d3
    TestRow( valsupposed, valactual, mask, i2);
    2e22:	2f02           	move.l d2,-(sp)
    2e24:	3f03           	move.w d3,-(sp)
    2e26:	4267           	clr.w -(sp)
    2e28:	2f0e           	move.l a6,-(sp)
    2e2a:	4879 0000 7880 	pea 7880 <destlinezoom6>
    2e30:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2e32:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2e36:	4643           	not.w d3
  for(int i2=0;i2<7;i2++) {  
    2e38:	5282           	addq.l #1,d2
    2e3a:	4fef 0010      	lea 16(sp),sp
    2e3e:	7007           	moveq #7,d0
    2e40:	b082           	cmp.l d2,d0
    2e42:	66de           	bne.s 2e22 <ZoomTest+0x13e0>
    2e44:	4dec 0154      	lea 340(a4),a6
    2e48:	7407           	moveq #7,d2
    2e4a:	280b           	move.l a3,d4
    2e4c:	264e           	movea.l a6,a3
    2e4e:	2c42           	movea.l d2,a6
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    2e50:	7400           	moveq #0,d2
    2e52:	3403           	move.w d3,d2
    2e54:	2f0e           	move.l a6,-(sp)
    2e56:	2f02           	move.l d2,-(sp)
    2e58:	2f0b           	move.l a3,-(sp)
    2e5a:	4879 0000 7880 	pea 7880 <destlinezoom6>
    2e60:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    2e62:	486e 0001      	pea 1(a6)
    2e66:	2f02           	move.l d2,-(sp)
    2e68:	486b 0030      	pea 48(a3)
    2e6c:	4879 0000 7880 	pea 7880 <destlinezoom6>
    2e72:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2e74:	4643           	not.w d3
    2e76:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2e78:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<6;i++) {
    2e7c:	4fef 0020      	lea 32(sp),sp
    2e80:	7213           	moveq #19,d1
    2e82:	b28e           	cmp.l a6,d1
    2e84:	66ca           	bne.s 2e50 <ZoomTest+0x140e>
    2e86:	240e           	move.l a6,d2
    2e88:	2c04           	move.l d4,d6
    2e8a:	2c45           	movea.l d5,a6
    2e8c:	4dee fdc0      	lea -576(a6),a6
  for(int i2=0;i2<7;i2++) {  
    2e90:	2802           	move.l d2,d4
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    2e92:	2f04           	move.l d4,-(sp)
    2e94:	3f03           	move.w d3,-(sp)
    2e96:	4267           	clr.w -(sp)
    2e98:	2f0e           	move.l a6,-(sp)
    2e9a:	4879 0000 7880 	pea 7880 <destlinezoom6>
    2ea0:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2ea2:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2ea6:	4643           	not.w d3
    2ea8:	5284           	addq.l #1,d4
    for(int i2=0;i2<12;i2++) {  
    2eaa:	4fef 0010      	lea 16(sp),sp
    2eae:	ba8e           	cmp.l a6,d5
    2eb0:	66e0           	bne.s 2e92 <ZoomTest+0x1450>
    2eb2:	367c 001f      	movea.w #31,a3
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    2eb6:	7800           	moveq #0,d4
    2eb8:	3803           	move.w d3,d4
    2eba:	2f0b           	move.l a3,-(sp)
    2ebc:	2f04           	move.l d4,-(sp)
    2ebe:	2f0e           	move.l a6,-(sp)
    2ec0:	4879 0000 7880 	pea 7880 <destlinezoom6>
    2ec6:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    2ec8:	486b 0001      	pea 1(a3)
    2ecc:	2f04           	move.l d4,-(sp)
    2ece:	486e 0030      	pea 48(a6)
    2ed2:	4879 0000 7880 	pea 7880 <destlinezoom6>
    2ed8:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    2eda:	4643           	not.w d3
    2edc:	47eb 0018      	lea 24(a3),a3
      valactual += ZMLINESIZE/2;
    2ee0:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<6;i++) {
    2ee4:	4fef 0020      	lea 32(sp),sp
    2ee8:	b6fc 00af      	cmpa.w #175,a3
    2eec:	66c8           	bne.s 2eb6 <ZoomTest+0x1474>
    2eee:	0685 0000 0480 	addi.l #1152,d5
    2ef4:	7018           	moveq #24,d0
    2ef6:	d480           	add.l d0,d2
  for(int i=0;i<10;i++) {
    2ef8:	0c82 0000 0103 	cmpi.l #259,d2
    2efe:	668a           	bne.s 2e8a <ZoomTest+0x1448>
    2f00:	2646           	movea.l d6,a3
    2f02:	4dec 3094      	lea 12436(a4),a6
    2f06:	283c 0000 0102 	move.l #258,d4
    TestRow( valsupposed, valactual, mask, 258+i2);
    2f0c:	2f04           	move.l d4,-(sp)
    2f0e:	3f03           	move.w d3,-(sp)
    2f10:	4267           	clr.w -(sp)
    2f12:	2f0e           	move.l a6,-(sp)
    2f14:	4879 0000 7880 	pea 7880 <destlinezoom6>
    2f1a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2f1c:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2f20:	4643           	not.w d3
    2f22:	5284           	addq.l #1,d4
  for(int i2=0;i2<11;i2++) {  
    2f24:	4fef 0010      	lea 16(sp),sp
    2f28:	0c84 0000 010d 	cmpi.l #269,d4
    2f2e:	66dc           	bne.s 2f0c <ZoomTest+0x14ca>
  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    2f30:	4878 0001      	pea 1 <_start+0x1>
    2f34:	4878 0006      	pea 6 <main>
    2f38:	2f0b           	move.l a3,-(sp)
    2f3a:	2f0c           	move.l a4,-(sp)
    2f3c:	4eba df5a      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2f40:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    2f46:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2f4a:	42a7           	clr.l -(sp)
    2f4c:	42a7           	clr.l -(sp)
    2f4e:	2f2d ff74      	move.l -140(a5),-(sp)
    2f52:	4879 0000 7854 	pea 7854 <destlinezoom7>
    2f58:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    2f5a:	41eb 0034      	lea 52(a3),a0
    2f5e:	2b48 ff88      	move.l a0,-120(a5)
    2f62:	4fef 0020      	lea 32(sp),sp
    2f66:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    2f6a:	7eff           	moveq #-1,d7
    2f6c:	280b           	move.l a3,d4
    2f6e:	2648           	movea.l a0,a3
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2f70:	7600           	moveq #0,d3
    2f72:	3607           	move.w d7,d3
    2f74:	2f0e           	move.l a6,-(sp)
    2f76:	2f03           	move.l d3,-(sp)
    2f78:	2f0b           	move.l a3,-(sp)
    2f7a:	4879 0000 7854 	pea 7854 <destlinezoom7>
    2f80:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2f82:	486e 0001      	pea 1(a6)
    2f86:	2f03           	move.l d3,-(sp)
    2f88:	486b 0030      	pea 48(a3)
    2f8c:	4879 0000 7854 	pea 7854 <destlinezoom7>
    2f92:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2f94:	4647           	not.w d7
    2f96:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2f98:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<7;i++) {
    2f9c:	4fef 0020      	lea 32(sp),sp
    2fa0:	700f           	moveq #15,d0
    2fa2:	b08e           	cmp.l a6,d0
    2fa4:	66ca           	bne.s 2f70 <ZoomTest+0x152e>
    2fa6:	2604           	move.l d4,d3
    2fa8:	0683 0000 04e4 	addi.l #1252,d3
    2fae:	2a0c           	move.l a4,d5
    2fb0:	2c04           	move.l d4,d6
    2fb2:	284e           	movea.l a6,a4
    2fb4:	2c43           	movea.l d3,a6
    2fb6:	4dee fdf0      	lea -528(a6),a6
  mask = mask ^ 0xffff;
    2fba:	280c           	move.l a4,d4
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    2fbc:	2f04           	move.l d4,-(sp)
    2fbe:	3f07           	move.w d7,-(sp)
    2fc0:	4267           	clr.w -(sp)
    2fc2:	2f0e           	move.l a6,-(sp)
    2fc4:	4879 0000 7854 	pea 7854 <destlinezoom7>
    2fca:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2fcc:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2fd0:	4647           	not.w d7
    2fd2:	5284           	addq.l #1,d4
    for(int i2=0;i2<11;i2++) {  
    2fd4:	4fef 0010      	lea 16(sp),sp
    2fd8:	b68e           	cmp.l a6,d3
    2fda:	66e0           	bne.s 2fbc <ZoomTest+0x157a>
    2fdc:	367c 001a      	movea.w #26,a3
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    2fe0:	7800           	moveq #0,d4
    2fe2:	3807           	move.w d7,d4
    2fe4:	2f0b           	move.l a3,-(sp)
    2fe6:	2f04           	move.l d4,-(sp)
    2fe8:	2f0e           	move.l a6,-(sp)
    2fea:	4879 0000 7854 	pea 7854 <destlinezoom7>
    2ff0:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    2ff2:	2f0b           	move.l a3,-(sp)
    2ff4:	2f04           	move.l d4,-(sp)
    2ff6:	486e 0030      	pea 48(a6)
    2ffa:	4879 0000 7854 	pea 7854 <destlinezoom7>
    3000:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    3002:	4647           	not.w d7
    3004:	47eb 0019      	lea 25(a3),a3
      valactual += ZMLINESIZE/2;
    3008:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<7;i++) {
    300c:	4fef 0020      	lea 32(sp),sp
    3010:	b6fc 00c9      	cmpa.w #201,a3
    3014:	66ca           	bne.s 2fe0 <ZoomTest+0x159e>
    3016:	0683 0000 04b0 	addi.l #1200,d3
    301c:	49ec 0019      	lea 25(a4),a4
  for(int i=0;i<10;i++) {
    3020:	b8fc 0109      	cmpa.w #265,a4
    3024:	668e           	bne.s 2fb4 <ZoomTest+0x1572>
    3026:	2845           	movea.l d5,a4
    3028:	2646           	movea.l d6,a3
    302a:	4deb 31b4      	lea 12724(a3),a6
    302e:	263c 0000 0100 	move.l #256,d3
    TestRow( valsupposed, valactual, mask, 256+i2);
    3034:	2f03           	move.l d3,-(sp)
    3036:	3f07           	move.w d7,-(sp)
    3038:	4267           	clr.w -(sp)
    303a:	2f0e           	move.l a6,-(sp)
    303c:	4879 0000 7854 	pea 7854 <destlinezoom7>
    3042:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    3044:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    3048:	4647           	not.w d7
    304a:	5283           	addq.l #1,d3
  for(int i2=0;i2<5;i2++) {  
    304c:	4fef 0010      	lea 16(sp),sp
    3050:	0c83 0000 0105 	cmpi.l #261,d3
    3056:	66dc           	bne.s 3034 <ZoomTest+0x15f2>
  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    3058:	4878 0001      	pea 1 <_start+0x1>
    305c:	4878 0007      	pea 7 <main+0x1>
    3060:	2f0c           	move.l a4,-(sp)
    3062:	2f0b           	move.l a3,-(sp)
    3064:	4eba de32      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3068:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    306e:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3072:	42a7           	clr.l -(sp)
    3074:	2f3c 0000 ffff 	move.l #65535,-(sp)
    307a:	2f2d ff70      	move.l -144(a5),-(sp)
    307e:	4879 0000 7828 	pea 7828 <destlinezoom8>
    3084:	4e92           	jsr (a2)
    3086:	4fef 0020      	lea 32(sp),sp
    308a:	2b6d ff7c ff6c 	move.l -132(a5),-148(a5)
  valactual += ZMLINESIZE/2;
    3090:	2a2d ff80      	move.l -128(a5),d5
  TestRow( valsupposed, valactual, mask, 0);
    3094:	7601           	moveq #1,d3
  mask = mask ^ 0xffff;
    3096:	4244           	clr.w d4
    3098:	2c43           	movea.l d3,a6
    309a:	2c2d ff6c      	move.l -148(a5),d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    309e:	7600           	moveq #0,d3
    30a0:	3604           	move.w d4,d3
    30a2:	2f0e           	move.l a6,-(sp)
    30a4:	2f03           	move.l d3,-(sp)
    30a6:	2f05           	move.l d5,-(sp)
    30a8:	4879 0000 7828 	pea 7828 <destlinezoom8>
    30ae:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    30b0:	486e 0001      	pea 1(a6)
    30b4:	2f03           	move.l d3,-(sp)
    30b6:	2045           	movea.l d5,a0
    30b8:	4868 0030      	pea 48(a0)
    30bc:	4879 0000 7828 	pea 7828 <destlinezoom8>
    30c2:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    30c4:	4644           	not.w d4
    30c6:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    30c8:	4fef 0020      	lea 32(sp),sp
    30cc:	700b           	moveq #11,d0
    30ce:	b08e           	cmp.l a6,d0
    30d0:	6740           	beq.s 3112 <ZoomTest+0x16d0>
    30d2:	2005           	move.l d5,d0
    30d4:	0680 0000 00c0 	addi.l #192,d0
    30da:	2a06           	move.l d6,d5
    30dc:	2c00           	move.l d0,d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    30de:	7600           	moveq #0,d3
    30e0:	3604           	move.w d4,d3
    30e2:	2f0e           	move.l a6,-(sp)
    30e4:	2f03           	move.l d3,-(sp)
    30e6:	2f05           	move.l d5,-(sp)
    30e8:	4879 0000 7828 	pea 7828 <destlinezoom8>
    30ee:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    30f0:	486e 0001      	pea 1(a6)
    30f4:	2f03           	move.l d3,-(sp)
    30f6:	2045           	movea.l d5,a0
    30f8:	4868 0030      	pea 48(a0)
    30fc:	4879 0000 7828 	pea 7828 <destlinezoom8>
    3102:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3104:	4644           	not.w d4
    3106:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    3108:	4fef 0020      	lea 32(sp),sp
    310c:	700b           	moveq #11,d0
    310e:	b08e           	cmp.l a6,d0
    3110:	66c0           	bne.s 30d2 <ZoomTest+0x1690>
    3112:	260e           	move.l a6,d3
    3114:	2b46 ff6c      	move.l d6,-148(a5)
    3118:	0686 0000 01e0 	addi.l #480,d6
    311e:	7e15           	moveq #21,d7
    3120:	2b4c ffac      	move.l a4,-84(a5)
    3124:	2b4b ffb0      	move.l a3,-80(a5)
    3128:	2647           	movea.l d7,a3
    312a:	2c46           	movea.l d6,a6
    312c:	4dee fe20      	lea -480(a6),a6
    3130:	49eb fff6      	lea -10(a3),a4
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    3134:	2f0c           	move.l a4,-(sp)
    3136:	3f04           	move.w d4,-(sp)
    3138:	4267           	clr.w -(sp)
    313a:	2f0e           	move.l a6,-(sp)
    313c:	4879 0000 7828 	pea 7828 <destlinezoom8>
    3142:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3144:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3148:	4644           	not.w d4
    314a:	528c           	addq.l #1,a4
    for(int i2=0;i2<10;i2++) {  
    314c:	4fef 0010      	lea 16(sp),sp
    3150:	bc8e           	cmp.l a6,d6
    3152:	66e0           	bne.s 3134 <ZoomTest+0x16f2>
    3154:	2a0b           	move.l a3,d5
    3156:	2e0e           	move.l a6,d7
    3158:	0687 0000 0300 	addi.l #768,d7
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    315e:	7200           	moveq #0,d1
    3160:	3204           	move.w d4,d1
    3162:	2841           	movea.l d1,a4
    3164:	2f05           	move.l d5,-(sp)
    3166:	2f0c           	move.l a4,-(sp)
    3168:	2f0e           	move.l a6,-(sp)
    316a:	4879 0000 7828 	pea 7828 <destlinezoom8>
    3170:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    3172:	2f05           	move.l d5,-(sp)
    3174:	2f0c           	move.l a4,-(sp)
    3176:	486e 0030      	pea 48(a6)
    317a:	4879 0000 7828 	pea 7828 <destlinezoom8>
    3180:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3182:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3186:	4644           	not.w d4
    3188:	5285           	addq.l #1,d5
    for(int i2=0;i2<8;i2++) {
    318a:	4fef 0020      	lea 32(sp),sp
    318e:	be8e           	cmp.l a6,d7
    3190:	66cc           	bne.s 315e <ZoomTest+0x171c>
    3192:	0686 0000 04e0 	addi.l #1248,d6
    3198:	47eb 001a      	lea 26(a3),a3
  for(int i=0;i<9;i++) {
    319c:	b6fc 00ff      	cmpa.w #255,a3
    31a0:	6688           	bne.s 312a <ZoomTest+0x16e8>
    31a2:	286d ffac      	movea.l -84(a5),a4
    31a6:	266d ffb0      	movea.l -80(a5),a3
    31aa:	2c2d ff6c      	move.l -148(a5),d6
    31ae:	0686 0000 2be0 	addi.l #11232,d6
    31b4:	2a2d ff68      	move.l -152(a5),d5
    31b8:	2c46           	movea.l d6,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    31ba:	2f05           	move.l d5,-(sp)
    31bc:	3f04           	move.w d4,-(sp)
    31be:	4267           	clr.w -(sp)
    31c0:	2f0e           	move.l a6,-(sp)
    31c2:	4879 0000 7828 	pea 7828 <destlinezoom8>
    31c8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    31ca:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    31ce:	4644           	not.w d4
    31d0:	5285           	addq.l #1,d5
  for(int i2=0;i2<10;i2++) {  
    31d2:	4fef 0010      	lea 16(sp),sp
    31d6:	0c85 0000 00ff 	cmpi.l #255,d5
    31dc:	66dc           	bne.s 31ba <ZoomTest+0x1778>
    31de:	2c2d ff6c      	move.l -148(a5),d6
    31e2:	0686 0000 2dc0 	addi.l #11712,d6
    31e8:	2c45           	movea.l d5,a6
    31ea:	2e0b           	move.l a3,d7
    31ec:	2646           	movea.l d6,a3
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    31ee:	7c00           	moveq #0,d6
    31f0:	3c04           	move.w d4,d6
    31f2:	2f0e           	move.l a6,-(sp)
    31f4:	2f06           	move.l d6,-(sp)
    31f6:	2f0b           	move.l a3,-(sp)
    31f8:	4879 0000 7828 	pea 7828 <destlinezoom8>
    31fe:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    3200:	486e 0001      	pea 1(a6)
    3204:	2f06           	move.l d6,-(sp)
    3206:	486b 0030      	pea 48(a3)
    320a:	4879 0000 7828 	pea 7828 <destlinezoom8>
    3210:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3212:	4644           	not.w d4
    3214:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3216:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<7;i++) {
    321a:	4fef 0020      	lea 32(sp),sp
    321e:	bcfc 010d      	cmpa.w #269,a6
    3222:	66ca           	bne.s 31ee <ZoomTest+0x17ac>
    3224:	2647           	movea.l d7,a3
  TestRow( valsupposed, valactual, mask, 269);
    3226:	2f0e           	move.l a6,-(sp)
    3228:	3f04           	move.w d4,-(sp)
    322a:	4267           	clr.w -(sp)
    322c:	206d ff6c      	movea.l -148(a5),a0
    3230:	4868 3060      	pea 12384(a0)
    3234:	4879 0000 7828 	pea 7828 <destlinezoom8>
    323a:	4e92           	jsr (a2)
  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    323c:	4878 0001      	pea 1 <_start+0x1>
    3240:	4878 0008      	pea 8 <main+0x2>
    3244:	2f0b           	move.l a3,-(sp)
    3246:	2f0c           	move.l a4,-(sp)
    3248:	4eba dc4e      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    324c:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    3252:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3256:	4fef 001c      	lea 28(sp),sp
    325a:	4297           	clr.l (sp)
    325c:	42a7           	clr.l -(sp)
    325e:	2f2d ff74      	move.l -140(a5),-(sp)
    3262:	4879 0000 77fc 	pea 77fc <destlinezoom9>
    3268:	4e92           	jsr (a2)
    326a:	4fef 0010      	lea 16(sp),sp
    326e:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    3272:	7cff           	moveq #-1,d6
    3274:	2e0b           	move.l a3,d7
    3276:	266d ff88      	movea.l -120(a5),a3
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    327a:	7800           	moveq #0,d4
    327c:	3806           	move.w d6,d4
    327e:	2f0e           	move.l a6,-(sp)
    3280:	2f04           	move.l d4,-(sp)
    3282:	2f0b           	move.l a3,-(sp)
    3284:	4879 0000 77fc 	pea 77fc <destlinezoom9>
    328a:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    328c:	486e 0001      	pea 1(a6)
    3290:	2f04           	move.l d4,-(sp)
    3292:	486b 0030      	pea 48(a3)
    3296:	4879 0000 77fc 	pea 77fc <destlinezoom9>
    329c:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    329e:	4646           	not.w d6
    32a0:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    32a2:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<3;i++) {
    32a6:	4fef 0020      	lea 32(sp),sp
    32aa:	7007           	moveq #7,d0
    32ac:	b08e           	cmp.l a6,d0
    32ae:	66ca           	bne.s 327a <ZoomTest+0x1838>
    32b0:	282d ff8c      	move.l -116(a5),d4
    32b4:	307c 0014      	movea.w #20,a0
    32b8:	2b4c ff6c      	move.l a4,-148(a5)
    32bc:	2b47 ff88      	move.l d7,-120(a5)
    32c0:	2b42 ff8c      	move.l d2,-116(a5)
    32c4:	2648           	movea.l a0,a3
    32c6:	2c44           	movea.l d4,a6
    32c8:	4dee fe50      	lea -432(a6),a6
    32cc:	49eb fff7      	lea -9(a3),a4
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    32d0:	2f0c           	move.l a4,-(sp)
    32d2:	3f06           	move.w d6,-(sp)
    32d4:	4267           	clr.w -(sp)
    32d6:	2f0e           	move.l a6,-(sp)
    32d8:	4879 0000 77fc 	pea 77fc <destlinezoom9>
    32de:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    32e0:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    32e4:	4646           	not.w d6
    32e6:	528c           	addq.l #1,a4
    for(int i2=0;i2<9;i2++) {  
    32e8:	4fef 0010      	lea 16(sp),sp
    32ec:	b88e           	cmp.l a6,d4
    32ee:	66e0           	bne.s 32d0 <ZoomTest+0x188e>
    32f0:	2e0b           	move.l a3,d7
    32f2:	49eb 0009      	lea 9(a3),a4
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    32f6:	7400           	moveq #0,d2
    32f8:	3406           	move.w d6,d2
    32fa:	2f07           	move.l d7,-(sp)
    32fc:	2f02           	move.l d2,-(sp)
    32fe:	2f0e           	move.l a6,-(sp)
    3300:	4879 0000 77fc 	pea 77fc <destlinezoom9>
    3306:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    3308:	5287           	addq.l #1,d7
    330a:	2f07           	move.l d7,-(sp)
    330c:	2f02           	move.l d2,-(sp)
    330e:	486e 0030      	pea 48(a6)
    3312:	4879 0000 77fc 	pea 77fc <destlinezoom9>
    3318:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    331a:	4646           	not.w d6
      valactual += ZMLINESIZE/2;
    331c:	4dee 0060      	lea 96(a6),a6
    for(int i2=0;i2<9;i2++) {
    3320:	4fef 0020      	lea 32(sp),sp
    3324:	be8c           	cmp.l a4,d7
    3326:	66ce           	bne.s 32f6 <ZoomTest+0x18b4>
    3328:	0684 0000 0510 	addi.l #1296,d4
    332e:	47eb 001b      	lea 27(a3),a3
  for(int i=0;i<9;i++) {
    3332:	b6fc 0107      	cmpa.w #263,a3
    3336:	668e           	bne.s 32c6 <ZoomTest+0x1884>
    3338:	286d ff6c      	movea.l -148(a5),a4
    333c:	266d ff88      	movea.l -120(a5),a3
    3340:	242d ff8c      	move.l -116(a5),d2
    3344:	41eb 2ee4      	lea 12004(a3),a0
    3348:	2b48 ff6c      	move.l a0,-148(a5)
    334c:	2c48           	movea.l a0,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    334e:	2f2d ff68      	move.l -152(a5),-(sp)
    3352:	3f06           	move.w d6,-(sp)
    3354:	4267           	clr.w -(sp)
    3356:	2f0e           	move.l a6,-(sp)
    3358:	4879 0000 77fc 	pea 77fc <destlinezoom9>
    335e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    3360:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    3364:	4646           	not.w d6
    3366:	52ad ff68      	addq.l #1,-152(a5)
  for(int i2=0;i2<9;i2++) {  
    336a:	4fef 0010      	lea 16(sp),sp
    336e:	0cad 0000 00fe 	cmpi.l #254,-152(a5)
    3374:	ff68 
    3376:	66d6           	bne.s 334e <ZoomTest+0x190c>
    3378:	41eb 3094      	lea 12436(a3),a0
    337c:	2b48 ff88      	move.l a0,-120(a5)
    3380:	2c42           	movea.l d2,a6
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    3382:	7400           	moveq #0,d2
    3384:	3406           	move.w d6,d2
    3386:	2f0e           	move.l a6,-(sp)
    3388:	2f02           	move.l d2,-(sp)
    338a:	2f2d ff88      	move.l -120(a5),-(sp)
    338e:	4879 0000 77fc 	pea 77fc <destlinezoom9>
    3394:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    3396:	486e 0001      	pea 1(a6)
    339a:	2f02           	move.l d2,-(sp)
    339c:	206d ff88      	movea.l -120(a5),a0
    33a0:	4868 0030      	pea 48(a0)
    33a4:	4879 0000 77fc 	pea 77fc <destlinezoom9>
    33aa:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    33ac:	4646           	not.w d6
    33ae:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    33b0:	7060           	moveq #96,d0
    33b2:	d1ad ff88      	add.l d0,-120(a5)
  for(int i=0;i<5;i++) {
    33b6:	4fef 0020      	lea 32(sp),sp
    33ba:	bcfc 010d      	cmpa.w #269,a6
    33be:	66c2           	bne.s 3382 <ZoomTest+0x1940>
  TestRow( valsupposed, valactual, mask, 269);
    33c0:	2f0e           	move.l a6,-(sp)
    33c2:	3f06           	move.w d6,-(sp)
    33c4:	4267           	clr.w -(sp)
    33c6:	2f2d ff78      	move.l -136(a5),-(sp)
    33ca:	4879 0000 77fc 	pea 77fc <destlinezoom9>
    33d0:	4e92           	jsr (a2)
  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    33d2:	4878 0001      	pea 1 <_start+0x1>
    33d6:	4878 0009      	pea 9 <main+0x3>
    33da:	2f0c           	move.l a4,-(sp)
    33dc:	2f0b           	move.l a3,-(sp)
    33de:	4eba dab8      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    33e2:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    33e8:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    33ec:	4fef 001c      	lea 28(sp),sp
    33f0:	4297           	clr.l (sp)
    33f2:	2f3c 0000 ffff 	move.l #65535,-(sp)
    33f8:	2f2d ff70      	move.l -144(a5),-(sp)
    33fc:	4879 0000 77d0 	pea 77d0 <destlinezoom10>
    3402:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 1);   
    3404:	4878 0001      	pea 1 <_start+0x1>
    3408:	42a7           	clr.l -(sp)
    340a:	2f2d ff80      	move.l -128(a5),-(sp)
    340e:	4879 0000 77d0 	pea 77d0 <destlinezoom10>
    3414:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 2);
    3416:	4fef 0020      	lea 32(sp),sp
    341a:	4878 0002      	pea 2 <_start+0x2>
    341e:	42a7           	clr.l -(sp)
    3420:	2f2d ff90      	move.l -112(a5),-(sp)
    3424:	4879 0000 77d0 	pea 77d0 <destlinezoom10>
    342a:	4e92           	jsr (a2)
  for(int i=0;i<9;i++) {
    342c:	242d ff98      	move.l -104(a5),d2
    3430:	4fef 0010      	lea 16(sp),sp
  mask = mask ^ 0xffff;
    3434:	7eff           	moveq #-1,d7
    3436:	2c43           	movea.l d3,a6
    3438:	2042           	movea.l d2,a0
    343a:	41e8 fe80      	lea -384(a0),a0
    343e:	2b48 ff88      	move.l a0,-120(a5)
    3442:	260e           	move.l a6,d3
    3444:	5183           	subq.l #8,d3
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    3446:	2f03           	move.l d3,-(sp)
    3448:	3f07           	move.w d7,-(sp)
    344a:	4267           	clr.w -(sp)
    344c:	2f2d ff88      	move.l -120(a5),-(sp)
    3450:	4879 0000 77d0 	pea 77d0 <destlinezoom10>
    3456:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3458:	7230           	moveq #48,d1
    345a:	d3ad ff88      	add.l d1,-120(a5)
      mask = mask ^ 0xffff;
    345e:	4647           	not.w d7
    3460:	5283           	addq.l #1,d3
    for(int i2=0;i2<8;i2++) {  
    3462:	4fef 0010      	lea 16(sp),sp
    3466:	b4ad ff88      	cmp.l -120(a5),d2
    346a:	66da           	bne.s 3446 <ZoomTest+0x1a04>
    346c:	260e           	move.l a6,d3
    346e:	2c2d ff88      	move.l -120(a5),d6
    3472:	0686 0000 03c0 	addi.l #960,d6
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    3478:	7800           	moveq #0,d4
    347a:	3807           	move.w d7,d4
    347c:	2f03           	move.l d3,-(sp)
    347e:	2f04           	move.l d4,-(sp)
    3480:	2f2d ff88      	move.l -120(a5),-(sp)
    3484:	4879 0000 77d0 	pea 77d0 <destlinezoom10>
    348a:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    348c:	2f03           	move.l d3,-(sp)
    348e:	2f04           	move.l d4,-(sp)
    3490:	206d ff88      	movea.l -120(a5),a0
    3494:	4868 0030      	pea 48(a0)
    3498:	4879 0000 77d0 	pea 77d0 <destlinezoom10>
    349e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    34a0:	7060           	moveq #96,d0
    34a2:	d1ad ff88      	add.l d0,-120(a5)
      mask = mask ^ 0xffff;
    34a6:	4647           	not.w d7
    34a8:	5283           	addq.l #1,d3
    for(int i2=0;i2<10;i2++) {
    34aa:	4fef 0020      	lea 32(sp),sp
    34ae:	bcad ff88      	cmp.l -120(a5),d6
    34b2:	66c4           	bne.s 3478 <ZoomTest+0x1a36>
    34b4:	0682 0000 0540 	addi.l #1344,d2
    34ba:	4dee 001c      	lea 28(a6),a6
  for(int i=0;i<9;i++) {
    34be:	bcfc 0107      	cmpa.w #263,a6
    34c2:	6600 ff74      	bne.w 3438 <ZoomTest+0x19f6>
    TestRow( valsupposed, valactual, mask, 255+i2);
    34c6:	2f05           	move.l d5,-(sp)
    34c8:	3f07           	move.w d7,-(sp)
    34ca:	4267           	clr.w -(sp)
    34cc:	2f2d ff9c      	move.l -100(a5),-(sp)
    34d0:	4879 0000 77d0 	pea 77d0 <destlinezoom10>
    34d6:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    34d8:	7030           	moveq #48,d0
    34da:	d1ad ff9c      	add.l d0,-100(a5)
    mask = mask ^ 0xffff;
    34de:	4647           	not.w d7
    34e0:	5285           	addq.l #1,d5
  for(int i2=0;i2<8;i2++) {  
    34e2:	4fef 0010      	lea 16(sp),sp
    34e6:	0c85 0000 0107 	cmpi.l #263,d5
    34ec:	66d8           	bne.s 34c6 <ZoomTest+0x1a84>
    34ee:	4dec 3154      	lea 12628(a4),a6
    34f2:	2b7c 0000 0108 	move.l #264,-120(a5)
    34f8:	ff88 
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    34fa:	7400           	moveq #0,d2
    34fc:	3407           	move.w d7,d2
    34fe:	206d ff88      	movea.l -120(a5),a0
    3502:	4868 ffff      	pea -1(a0)
    3506:	2f02           	move.l d2,-(sp)
    3508:	2f0e           	move.l a6,-(sp)
    350a:	4879 0000 77d0 	pea 77d0 <destlinezoom10>
    3510:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    3512:	2f2d ff88      	move.l -120(a5),-(sp)
    3516:	2f02           	move.l d2,-(sp)
    3518:	486e 0030      	pea 48(a6)
    351c:	4879 0000 77d0 	pea 77d0 <destlinezoom10>
    3522:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3524:	4647           	not.w d7
    3526:	54ad ff88      	addq.l #2,-120(a5)
    valactual += ZMLINESIZE/2;
    352a:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<3;i++) {
    352e:	4fef 0020      	lea 32(sp),sp
    3532:	0cad 0000 010e 	cmpi.l #270,-120(a5)
    3538:	ff88 
    353a:	66be           	bne.s 34fa <ZoomTest+0x1ab8>
  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    353c:	4878 0001      	pea 1 <_start+0x1>
    3540:	4878 000a      	pea a <main+0x4>
    3544:	2f0b           	move.l a3,-(sp)
    3546:	2f0c           	move.l a4,-(sp)
    3548:	4eba d94e      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    354c:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    3552:	4eae ff1c      	jsr -228(a6)
    3556:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    355a:	2b6d ff74 ff88 	move.l -140(a5),-120(a5)
  for(int i2=0;i2<6;i2++) {  
    3560:	7600           	moveq #0,d3
  mask = 0xffff;
    3562:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, i2);
    3564:	2f03           	move.l d3,-(sp)
    3566:	3f02           	move.w d2,-(sp)
    3568:	4267           	clr.w -(sp)
    356a:	2f2d ff88      	move.l -120(a5),-(sp)
    356e:	4879 0000 77a4 	pea 77a4 <destlinezoom11>
    3574:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    3576:	7030           	moveq #48,d0
    3578:	d1ad ff88      	add.l d0,-120(a5)
    mask = mask ^ 0xffff;
    357c:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) {  
    357e:	5283           	addq.l #1,d3
    3580:	4fef 0010      	lea 16(sp),sp
    3584:	7206           	moveq #6,d1
    3586:	b283           	cmp.l d3,d1
    3588:	66da           	bne.s 3564 <ZoomTest+0x1b22>
    358a:	2c6d ffa4      	movea.l -92(a5),a6
    358e:	307c 0006      	movea.w #6,a0
    3592:	2b48 ff88      	move.l a0,-120(a5)
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    3596:	7600           	moveq #0,d3
    3598:	3602           	move.w d2,d3
    359a:	2f2d ff88      	move.l -120(a5),-(sp)
    359e:	2f03           	move.l d3,-(sp)
    35a0:	2f0e           	move.l a6,-(sp)
    35a2:	4879 0000 77a4 	pea 77a4 <destlinezoom11>
    35a8:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    35aa:	206d ff88      	movea.l -120(a5),a0
    35ae:	4868 0001      	pea 1(a0)
    35b2:	2f03           	move.l d3,-(sp)
    35b4:	486e 0030      	pea 48(a6)
    35b8:	4879 0000 77a4 	pea 77a4 <destlinezoom11>
    35be:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    35c0:	4642           	not.w d2
    35c2:	54ad ff88      	addq.l #2,-120(a5)
    valactual += ZMLINESIZE/2;
    35c6:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<11;i2++) {
    35ca:	4fef 0020      	lea 32(sp),sp
    35ce:	701c           	moveq #28,d0
    35d0:	b0ad ff88      	cmp.l -120(a5),d0
    35d4:	66c0           	bne.s 3596 <ZoomTest+0x1b54>
    35d6:	260b           	move.l a3,d3
    35d8:	0683 0000 0694 	addi.l #1684,d3
    35de:	307c 0023      	movea.w #35,a0
    35e2:	2b48 ff88      	move.l a0,-120(a5)
    35e6:	2c0b           	move.l a3,d6
    35e8:	2c43           	movea.l d3,a6
    35ea:	4dee feb0      	lea -336(a6),a6
    35ee:	282d ff88      	move.l -120(a5),d4
    35f2:	5f84           	subq.l #7,d4
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    35f4:	2f04           	move.l d4,-(sp)
    35f6:	3f02           	move.w d2,-(sp)
    35f8:	4267           	clr.w -(sp)
    35fa:	2f0e           	move.l a6,-(sp)
    35fc:	4879 0000 77a4 	pea 77a4 <destlinezoom11>
    3602:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3604:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3608:	4642           	not.w d2
    360a:	5284           	addq.l #1,d4
    for(int i2=0;i2<7;i2++) {  
    360c:	4fef 0010      	lea 16(sp),sp
    3610:	b68e           	cmp.l a6,d3
    3612:	66e0           	bne.s 35f4 <ZoomTest+0x1bb2>
    3614:	266d ff88      	movea.l -120(a5),a3
    3618:	2a0e           	move.l a6,d5
    361a:	0685 0000 0420 	addi.l #1056,d5
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    3620:	7800           	moveq #0,d4
    3622:	3802           	move.w d2,d4
    3624:	2f0b           	move.l a3,-(sp)
    3626:	2f04           	move.l d4,-(sp)
    3628:	2f0e           	move.l a6,-(sp)
    362a:	4879 0000 77a4 	pea 77a4 <destlinezoom11>
    3630:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    3632:	486b ffe8      	pea -24(a3)
    3636:	2f04           	move.l d4,-(sp)
    3638:	486e 0030      	pea 48(a6)
    363c:	4879 0000 77a4 	pea 77a4 <destlinezoom11>
    3642:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3644:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3648:	4642           	not.w d2
    364a:	548b           	addq.l #2,a3
    for(int i2=0;i2<11;i2++) {
    364c:	4fef 0020      	lea 32(sp),sp
    3650:	ba8e           	cmp.l a6,d5
    3652:	66cc           	bne.s 3620 <ZoomTest+0x1bde>
    3654:	0683 0000 0570 	addi.l #1392,d3
    365a:	701d           	moveq #29,d0
    365c:	d1ad ff88      	add.l d0,-120(a5)
  for(int i=0;i<8;i++) {
    3660:	0cad 0000 010b 	cmpi.l #267,-120(a5)
    3666:	ff88 
    3668:	6600 ff7e      	bne.w 35e8 <ZoomTest+0x1ba6>
    366c:	2646           	movea.l d6,a3
    366e:	41eb 30c4      	lea 12484(a3),a0
    3672:	2b48 ff88      	move.l a0,-120(a5)
    3676:	283c 0000 0104 	move.l #260,d4
    TestRow( valsupposed, valactual, mask, 260+i2);
    367c:	7600           	moveq #0,d3
    367e:	3602           	move.w d2,d3
    3680:	2f04           	move.l d4,-(sp)
    3682:	2f03           	move.l d3,-(sp)
    3684:	2f2d ff88      	move.l -120(a5),-(sp)
    3688:	4879 0000 77a4 	pea 77a4 <destlinezoom11>
    368e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    3690:	7030           	moveq #48,d0
    3692:	d1ad ff88      	add.l d0,-120(a5)
    mask = mask ^ 0xffff;
    3696:	4642           	not.w d2
    3698:	5284           	addq.l #1,d4
  for(int i2=0;i2<7;i2++) {  
    369a:	4fef 0010      	lea 16(sp),sp
    369e:	0c84 0000 010b 	cmpi.l #267,d4
    36a4:	66d6           	bne.s 367c <ZoomTest+0x1c3a>
    36a6:	0282 0000 ffff 	andi.l #65535,d2
  TestRow( valsupposed, valactual, mask, 267);   
    36ac:	2f04           	move.l d4,-(sp)
    36ae:	2f02           	move.l d2,-(sp)
    36b0:	2f2d ffa8      	move.l -88(a5),-(sp)
    36b4:	4879 0000 77a4 	pea 77a4 <destlinezoom11>
    36ba:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 268);
    36bc:	4878 010c      	pea 10c <main+0x106>
    36c0:	2f02           	move.l d2,-(sp)
    36c2:	2f2d ff94      	move.l -108(a5),-(sp)
    36c6:	4879 0000 77a4 	pea 77a4 <destlinezoom11>
    36cc:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 269);
    36ce:	4fef 0020      	lea 32(sp),sp
    36d2:	4878 010d      	pea 10d <main+0x107>
    36d6:	2f03           	move.l d3,-(sp)
    36d8:	2f2d ff78      	move.l -136(a5),-(sp)
    36dc:	4879 0000 77a4 	pea 77a4 <destlinezoom11>
    36e2:	4e92           	jsr (a2)
  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    36e4:	4878 0001      	pea 1 <_start+0x1>
    36e8:	4878 000b      	pea b <main+0x5>
    36ec:	2f0c           	move.l a4,-(sp)
    36ee:	2f0b           	move.l a3,-(sp)
    36f0:	4eba d7a6      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    36f4:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    36fa:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    36fe:	4fef 001c      	lea 28(sp),sp
    3702:	4297           	clr.l (sp)
    3704:	42a7           	clr.l -(sp)
    3706:	2f2d ff70      	move.l -144(a5),-(sp)
    370a:	4879 0000 7778 	pea 7778 <destlinezoom12>
    3710:	4e92           	jsr (a2)
    3712:	4fef 0010      	lea 16(sp),sp
    3716:	262d ff7c      	move.l -132(a5),d3
  valactual += ZMLINESIZE/2;
    371a:	2c6d ff80      	movea.l -128(a5),a6
  TestRow( valsupposed, valactual, mask, 0);
    371e:	307c 0001      	movea.w #1,a0
    3722:	2b48 ff78      	move.l a0,-136(a5)
  mask = mask ^ 0xffff;
    3726:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3728:	7800           	moveq #0,d4
    372a:	3802           	move.w d2,d4
    372c:	2f2d ff78      	move.l -136(a5),-(sp)
    3730:	2f04           	move.l d4,-(sp)
    3732:	2f0e           	move.l a6,-(sp)
    3734:	4879 0000 7778 	pea 7778 <destlinezoom12>
    373a:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    373c:	206d ff78      	movea.l -136(a5),a0
    3740:	4868 0001      	pea 1(a0)
    3744:	2f04           	move.l d4,-(sp)
    3746:	486e 0030      	pea 48(a6)
    374a:	4879 0000 7778 	pea 7778 <destlinezoom12>
    3750:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3752:	4642           	not.w d2
    3754:	54ad ff78      	addq.l #2,-136(a5)
  for(int i2=0;i2<12;i2++) {
    3758:	4fef 0020      	lea 32(sp),sp
    375c:	7019           	moveq #25,d0
    375e:	b0ad ff78      	cmp.l -136(a5),d0
    3762:	6748           	beq.s 37ac <ZoomTest+0x1d6a>
    3764:	200e           	move.l a6,d0
    3766:	0680 0000 00c0 	addi.l #192,d0
    376c:	2c43           	movea.l d3,a6
    376e:	2600           	move.l d0,d3
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3770:	7800           	moveq #0,d4
    3772:	3802           	move.w d2,d4
    3774:	2f2d ff78      	move.l -136(a5),-(sp)
    3778:	2f04           	move.l d4,-(sp)
    377a:	2f0e           	move.l a6,-(sp)
    377c:	4879 0000 7778 	pea 7778 <destlinezoom12>
    3782:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3784:	206d ff78      	movea.l -136(a5),a0
    3788:	4868 0001      	pea 1(a0)
    378c:	2f04           	move.l d4,-(sp)
    378e:	486e 0030      	pea 48(a6)
    3792:	4879 0000 7778 	pea 7778 <destlinezoom12>
    3798:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    379a:	4642           	not.w d2
    379c:	54ad ff78      	addq.l #2,-136(a5)
  for(int i2=0;i2<12;i2++) {
    37a0:	4fef 0020      	lea 32(sp),sp
    37a4:	7019           	moveq #25,d0
    37a6:	b0ad ff78      	cmp.l -136(a5),d0
    37aa:	66b8           	bne.s 3764 <ZoomTest+0x1d22>
    37ac:	2803           	move.l d3,d4
    37ae:	0684 0000 0120 	addi.l #288,d4
    37b4:	307c 001f      	movea.w #31,a0
    37b8:	2b48 ff78      	move.l a0,-136(a5)
    37bc:	2c0b           	move.l a3,d6
    37be:	2c44           	movea.l d4,a6
    37c0:	4dee fee0      	lea -288(a6),a6
    37c4:	2a2d ff78      	move.l -136(a5),d5
    37c8:	5d85           	subq.l #6,d5
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    37ca:	2f05           	move.l d5,-(sp)
    37cc:	3f02           	move.w d2,-(sp)
    37ce:	4267           	clr.w -(sp)
    37d0:	2f0e           	move.l a6,-(sp)
    37d2:	4879 0000 7778 	pea 7778 <destlinezoom12>
    37d8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    37da:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    37de:	4642           	not.w d2
    37e0:	5285           	addq.l #1,d5
    for(int i2=0;i2<6;i2++) {  
    37e2:	4fef 0010      	lea 16(sp),sp
    37e6:	b88e           	cmp.l a6,d4
    37e8:	66e0           	bne.s 37ca <ZoomTest+0x1d88>
    37ea:	266d ff78      	movea.l -136(a5),a3
    37ee:	2e0e           	move.l a6,d7
    37f0:	0687 0000 0480 	addi.l #1152,d7
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    37f6:	7a00           	moveq #0,d5
    37f8:	3a02           	move.w d2,d5
    37fa:	2f0b           	move.l a3,-(sp)
    37fc:	2f05           	move.l d5,-(sp)
    37fe:	2f0e           	move.l a6,-(sp)
    3800:	4879 0000 7778 	pea 7778 <destlinezoom12>
    3806:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    3808:	486b 0001      	pea 1(a3)
    380c:	2f05           	move.l d5,-(sp)
    380e:	486e 0030      	pea 48(a6)
    3812:	4879 0000 7778 	pea 7778 <destlinezoom12>
    3818:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    381a:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    381e:	4642           	not.w d2
    3820:	548b           	addq.l #2,a3
    for(int i2=0;i2<12;i2++) {
    3822:	4fef 0020      	lea 32(sp),sp
    3826:	be8e           	cmp.l a6,d7
    3828:	66cc           	bne.s 37f6 <ZoomTest+0x1db4>
    382a:	0684 0000 05a0 	addi.l #1440,d4
    3830:	701e           	moveq #30,d0
    3832:	d1ad ff78      	add.l d0,-136(a5)
  for(int i=0;i<8;i++) {
    3836:	0cad 0000 010f 	cmpi.l #271,-136(a5)
    383c:	ff78 
    383e:	6600 ff7e      	bne.w 37be <ZoomTest+0x1d7c>
    3842:	2646           	movea.l d6,a3
    3844:	0683 0000 2d00 	addi.l #11520,d3
    384a:	2b43 ff78      	move.l d3,-136(a5)
    384e:	263c 0000 0104 	move.l #260,d3
    TestRow( valsupposed, valactual, mask, 260+i2);
    3854:	2f03           	move.l d3,-(sp)
    3856:	3f02           	move.w d2,-(sp)
    3858:	4267           	clr.w -(sp)
    385a:	2f2d ff78      	move.l -136(a5),-(sp)
    385e:	4879 0000 7778 	pea 7778 <destlinezoom12>
    3864:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    3866:	7230           	moveq #48,d1
    3868:	d3ad ff78      	add.l d1,-136(a5)
    mask = mask ^ 0xffff;
    386c:	4642           	not.w d2
    386e:	5283           	addq.l #1,d3
  for(int i2=0;i2<5;i2++) {  
    3870:	4fef 0010      	lea 16(sp),sp
    3874:	0c83 0000 0109 	cmpi.l #265,d3
    387a:	66d8           	bne.s 3854 <ZoomTest+0x1e12>
  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    387c:	4878 0001      	pea 1 <_start+0x1>
    3880:	4878 000c      	pea c <main+0x6>
    3884:	2f0b           	move.l a3,-(sp)
    3886:	2f0c           	move.l a4,-(sp)
    3888:	4eba d60e      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    388c:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    3892:	4eae ff1c      	jsr -228(a6)
    3896:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    389a:	2c6d ff74      	movea.l -140(a5),a6
  WaitBlit();
    389e:	307c 0001      	movea.w #1,a0
    38a2:	2b48 ff78      	move.l a0,-136(a5)
  mask = 0xffff;
    38a6:	7cff           	moveq #-1,d6
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    38a8:	7400           	moveq #0,d2
    38aa:	3406           	move.w d6,d2
    38ac:	206d ff78      	movea.l -136(a5),a0
    38b0:	4868 ffff      	pea -1(a0)
    38b4:	2f02           	move.l d2,-(sp)
    38b6:	2f0e           	move.l a6,-(sp)
    38b8:	4879 0000 774c 	pea 774c <destlinezoom13>
    38be:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    38c0:	2f2d ff78      	move.l -136(a5),-(sp)
    38c4:	2f02           	move.l d2,-(sp)
    38c6:	486e 0030      	pea 48(a6)
    38ca:	4879 0000 774c 	pea 774c <destlinezoom13>
    38d0:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    38d2:	4646           	not.w d6
    38d4:	54ad ff78      	addq.l #2,-136(a5)
    valactual += ZMLINESIZE/2;
    38d8:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<11;i2++) {
    38dc:	4fef 0020      	lea 32(sp),sp
    38e0:	7017           	moveq #23,d0
    38e2:	b0ad ff78      	cmp.l -136(a5),d0
    38e6:	66c0           	bne.s 38a8 <ZoomTest+0x1e66>
    38e8:	240b           	move.l a3,d2
    38ea:	0682 0000 0514 	addi.l #1300,d2
    38f0:	781b           	moveq #27,d4
    38f2:	2a0b           	move.l a3,d5
    38f4:	2644           	movea.l d4,a3
    38f6:	280c           	move.l a4,d4
    38f8:	2c42           	movea.l d2,a6
    38fa:	4dee ff10      	lea -240(a6),a6
    38fe:	260b           	move.l a3,d3
    3900:	5b83           	subq.l #5,d3
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    3902:	2f03           	move.l d3,-(sp)
    3904:	3f06           	move.w d6,-(sp)
    3906:	4267           	clr.w -(sp)
    3908:	2f0e           	move.l a6,-(sp)
    390a:	4879 0000 774c 	pea 774c <destlinezoom13>
    3910:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3912:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3916:	4646           	not.w d6
    3918:	5283           	addq.l #1,d3
    for(int i2=0;i2<5;i2++) {  
    391a:	4fef 0010      	lea 16(sp),sp
    391e:	b48e           	cmp.l a6,d2
    3920:	66e0           	bne.s 3902 <ZoomTest+0x1ec0>
    3922:	284b           	movea.l a3,a4
    3924:	2e0e           	move.l a6,d7
    3926:	0687 0000 04e0 	addi.l #1248,d7
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    392c:	7600           	moveq #0,d3
    392e:	3606           	move.w d6,d3
    3930:	2f0c           	move.l a4,-(sp)
    3932:	2f03           	move.l d3,-(sp)
    3934:	2f0e           	move.l a6,-(sp)
    3936:	4879 0000 774c 	pea 774c <destlinezoom13>
    393c:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    393e:	486c 0001      	pea 1(a4)
    3942:	2f03           	move.l d3,-(sp)
    3944:	486e 0030      	pea 48(a6)
    3948:	4879 0000 774c 	pea 774c <destlinezoom13>
    394e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3950:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3954:	4646           	not.w d6
    3956:	548c           	addq.l #2,a4
    for(int i2=0;i2<13;i2++) {
    3958:	4fef 0020      	lea 32(sp),sp
    395c:	be8e           	cmp.l a6,d7
    395e:	66cc           	bne.s 392c <ZoomTest+0x1eea>
    3960:	0682 0000 05d0 	addi.l #1488,d2
    3966:	47eb 001f      	lea 31(a3),a3
  for(int i=0;i<8;i++) {
    396a:	b6fc 0113      	cmpa.w #275,a3
    396e:	6688           	bne.s 38f8 <ZoomTest+0x1eb6>
    3970:	2844           	movea.l d4,a4
  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    3972:	4878 0001      	pea 1 <_start+0x1>
    3976:	4878 000d      	pea d <main+0x7>
    397a:	2f04           	move.l d4,-(sp)
    397c:	2f05           	move.l d5,-(sp)
    397e:	4eba d518      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3982:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    3988:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    398c:	42a7           	clr.l -(sp)
    398e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3994:	2f2d ff70      	move.l -144(a5),-(sp)
    3998:	4879 0000 7720 	pea 7720 <destlinezoom14>
    399e:	4e92           	jsr (a2)
    39a0:	4fef 0020      	lea 32(sp),sp
    39a4:	262d ff7c      	move.l -132(a5),d3
  valactual += ZMLINESIZE/2; 
    39a8:	2c6d ff80      	movea.l -128(a5),a6
  TestRow( valsupposed, valactual, mask, 0);   
    39ac:	7401           	moveq #1,d2
  mask = mask ^ 0xffff; 
    39ae:	4247           	clr.w d7
    39b0:	2805           	move.l d5,d4
    39b2:	264e           	movea.l a6,a3
    39b4:	2c42           	movea.l d2,a6
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    39b6:	7400           	moveq #0,d2
    39b8:	3407           	move.w d7,d2
    39ba:	2f0e           	move.l a6,-(sp)
    39bc:	2f02           	move.l d2,-(sp)
    39be:	2f0b           	move.l a3,-(sp)
    39c0:	4879 0000 7720 	pea 7720 <destlinezoom14>
    39c6:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    39c8:	486e 0001      	pea 1(a6)
    39cc:	2f02           	move.l d2,-(sp)
    39ce:	486b 0030      	pea 48(a3)
    39d2:	4879 0000 7720 	pea 7720 <destlinezoom14>
    39d8:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    39da:	4647           	not.w d7
    39dc:	548e           	addq.l #2,a6
  for(int i2=0;i2<9;i2++) {
    39de:	4fef 0020      	lea 32(sp),sp
    39e2:	7213           	moveq #19,d1
    39e4:	b28e           	cmp.l a6,d1
    39e6:	673e           	beq.s 3a26 <ZoomTest+0x1fe4>
    39e8:	200b           	move.l a3,d0
    39ea:	0680 0000 00c0 	addi.l #192,d0
    39f0:	2643           	movea.l d3,a3
    39f2:	2600           	move.l d0,d3
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    39f4:	7400           	moveq #0,d2
    39f6:	3407           	move.w d7,d2
    39f8:	2f0e           	move.l a6,-(sp)
    39fa:	2f02           	move.l d2,-(sp)
    39fc:	2f0b           	move.l a3,-(sp)
    39fe:	4879 0000 7720 	pea 7720 <destlinezoom14>
    3a04:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3a06:	486e 0001      	pea 1(a6)
    3a0a:	2f02           	move.l d2,-(sp)
    3a0c:	486b 0030      	pea 48(a3)
    3a10:	4879 0000 7720 	pea 7720 <destlinezoom14>
    3a16:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3a18:	4647           	not.w d7
    3a1a:	548e           	addq.l #2,a6
  for(int i2=0;i2<9;i2++) {
    3a1c:	4fef 0020      	lea 32(sp),sp
    3a20:	7213           	moveq #19,d1
    3a22:	b28e           	cmp.l a6,d1
    3a24:	66c2           	bne.s 39e8 <ZoomTest+0x1fa6>
    3a26:	2644           	movea.l d4,a3
    3a28:	240e           	move.l a6,d2
    3a2a:	2803           	move.l d3,d4
    3a2c:	0684 0000 00c0 	addi.l #192,d4
    3a32:	2c0b           	move.l a3,d6
    3a34:	2b6d ff78 ff88 	move.l -136(a5),-120(a5)
    3a3a:	2c44           	movea.l d4,a6
    3a3c:	4dee ff40      	lea -192(a6),a6
    3a40:	2a2d ff88      	move.l -120(a5),d5
    3a44:	5985           	subq.l #4,d5
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    3a46:	2f05           	move.l d5,-(sp)
    3a48:	3f07           	move.w d7,-(sp)
    3a4a:	4267           	clr.w -(sp)
    3a4c:	2f0e           	move.l a6,-(sp)
    3a4e:	4879 0000 7720 	pea 7720 <destlinezoom14>
    3a54:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3a56:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3a5a:	4647           	not.w d7
    3a5c:	5285           	addq.l #1,d5
    for(int i2=0;i2<4;i2++) {  
    3a5e:	4fef 0010      	lea 16(sp),sp
    3a62:	b88e           	cmp.l a6,d4
    3a64:	66e0           	bne.s 3a46 <ZoomTest+0x2004>
    3a66:	266d ff88      	movea.l -120(a5),a3
    3a6a:	41ee 0540      	lea 1344(a6),a0
    3a6e:	2b48 ff78      	move.l a0,-136(a5)
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    3a72:	7a00           	moveq #0,d5
    3a74:	3a07           	move.w d7,d5
    3a76:	2f0b           	move.l a3,-(sp)
    3a78:	2f05           	move.l d5,-(sp)
    3a7a:	2f0e           	move.l a6,-(sp)
    3a7c:	4879 0000 7720 	pea 7720 <destlinezoom14>
    3a82:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    3a84:	486b 0001      	pea 1(a3)
    3a88:	2f05           	move.l d5,-(sp)
    3a8a:	486e 0030      	pea 48(a6)
    3a8e:	4879 0000 7720 	pea 7720 <destlinezoom14>
    3a94:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3a96:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3a9a:	4647           	not.w d7
    3a9c:	548b           	addq.l #2,a3
    for(int i2=0;i2<14;i2++) {
    3a9e:	4fef 0020      	lea 32(sp),sp
    3aa2:	bded ff78      	cmpa.l -136(a5),a6
    3aa6:	66ca           	bne.s 3a72 <ZoomTest+0x2030>
    3aa8:	0684 0000 0600 	addi.l #1536,d4
    3aae:	7020           	moveq #32,d0
    3ab0:	d1ad ff88      	add.l d0,-120(a5)
  for(int i=0;i<7;i++) {
    3ab4:	0cad 0000 00f7 	cmpi.l #247,-120(a5)
    3aba:	ff88 
    3abc:	6600 ff7c      	bne.w 3a3a <ZoomTest+0x1ff8>
    3ac0:	2646           	movea.l d6,a3
    3ac2:	2c43           	movea.l d3,a6
    3ac4:	4dee 2a00      	lea 10752(a6),a6
    3ac8:	2b7c 0000 00f3 	move.l #243,-136(a5)
    3ace:	ff78 
    TestRow( valsupposed, valactual, mask, 243+i2);
    3ad0:	2f2d ff78      	move.l -136(a5),-(sp)
    3ad4:	3f07           	move.w d7,-(sp)
    3ad6:	4267           	clr.w -(sp)
    3ad8:	2f0e           	move.l a6,-(sp)
    3ada:	4879 0000 7720 	pea 7720 <destlinezoom14>
    3ae0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    3ae2:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    3ae6:	4647           	not.w d7
    3ae8:	52ad ff78      	addq.l #1,-136(a5)
  for(int i2=0;i2<4;i2++) {  
    3aec:	4fef 0010      	lea 16(sp),sp
    3af0:	0cad 0000 00f7 	cmpi.l #247,-136(a5)
    3af6:	ff78 
    3af8:	66d6           	bne.s 3ad0 <ZoomTest+0x208e>
    3afa:	0683 0000 2ac0 	addi.l #10944,d3
    3b00:	2c6d ff78      	movea.l -136(a5),a6
    3b04:	280b           	move.l a3,d4
    3b06:	2643           	movea.l d3,a3
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    3b08:	7600           	moveq #0,d3
    3b0a:	3607           	move.w d7,d3
    3b0c:	2f0e           	move.l a6,-(sp)
    3b0e:	2f03           	move.l d3,-(sp)
    3b10:	2f0b           	move.l a3,-(sp)
    3b12:	4879 0000 7720 	pea 7720 <destlinezoom14>
    3b18:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    3b1a:	486e 0001      	pea 1(a6)
    3b1e:	2f03           	move.l d3,-(sp)
    3b20:	486b 0030      	pea 48(a3)
    3b24:	4879 0000 7720 	pea 7720 <destlinezoom14>
    3b2a:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3b2c:	4647           	not.w d7
    3b2e:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3b30:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<12;i2++) {
    3b34:	4fef 0020      	lea 32(sp),sp
    3b38:	bcfc 010f      	cmpa.w #271,a6
    3b3c:	66ca           	bne.s 3b08 <ZoomTest+0x20c6>
  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    3b3e:	4878 0001      	pea 1 <_start+0x1>
    3b42:	4878 000e      	pea e <main+0x8>
    3b46:	2f04           	move.l d4,-(sp)
    3b48:	2f0c           	move.l a4,-(sp)
    3b4a:	4eba d34c      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3b4e:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    3b54:	4eae ff1c      	jsr -228(a6)
    3b58:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    3b5c:	262d ff74      	move.l -140(a5),d3
  WaitBlit();
    3b60:	3c7c 0001      	movea.w #1,a6
  mask = 0x0000;
    3b64:	4246           	clr.w d6
    3b66:	2643           	movea.l d3,a3
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3b68:	7600           	moveq #0,d3
    3b6a:	3606           	move.w d6,d3
    3b6c:	486e ffff      	pea -1(a6)
    3b70:	2f03           	move.l d3,-(sp)
    3b72:	2f0b           	move.l a3,-(sp)
    3b74:	4879 0000 76f4 	pea 76f4 <destlinezoom15>
    3b7a:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3b7c:	2f0e           	move.l a6,-(sp)
    3b7e:	2f03           	move.l d3,-(sp)
    3b80:	486b 0030      	pea 48(a3)
    3b84:	4879 0000 76f4 	pea 76f4 <destlinezoom15>
    3b8a:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3b8c:	4646           	not.w d6
    3b8e:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3b90:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    3b94:	4fef 0020      	lea 32(sp),sp
    3b98:	7211           	moveq #17,d1
    3b9a:	b28e           	cmp.l a6,d1
    3b9c:	66ca           	bne.s 3b68 <ZoomTest+0x2126>
    3b9e:	262d ffa0      	move.l -96(a5),d3
    3ba2:	2a04           	move.l d4,d5
    3ba4:	2642           	movea.l d2,a3
    3ba6:	2c43           	movea.l d3,a6
    3ba8:	4dee ff70      	lea -144(a6),a6
    3bac:	240b           	move.l a3,d2
    3bae:	5782           	subq.l #3,d2
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    3bb0:	2f02           	move.l d2,-(sp)
    3bb2:	3f06           	move.w d6,-(sp)
    3bb4:	4267           	clr.w -(sp)
    3bb6:	2f0e           	move.l a6,-(sp)
    3bb8:	4879 0000 76f4 	pea 76f4 <destlinezoom15>
    3bbe:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3bc0:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3bc4:	4646           	not.w d6
    3bc6:	5282           	addq.l #1,d2
    for(int i2=0;i2<3;i2++) {  
    3bc8:	4fef 0010      	lea 16(sp),sp
    3bcc:	b68e           	cmp.l a6,d3
    3bce:	66e0           	bne.s 3bb0 <ZoomTest+0x216e>
    3bd0:	240b           	move.l a3,d2
    3bd2:	2e0e           	move.l a6,d7
    3bd4:	0687 0000 05a0 	addi.l #1440,d7
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    3bda:	7800           	moveq #0,d4
    3bdc:	3806           	move.w d6,d4
    3bde:	2f02           	move.l d2,-(sp)
    3be0:	2f04           	move.l d4,-(sp)
    3be2:	2f0e           	move.l a6,-(sp)
    3be4:	4879 0000 76f4 	pea 76f4 <destlinezoom15>
    3bea:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    3bec:	2f02           	move.l d2,-(sp)
    3bee:	2f04           	move.l d4,-(sp)
    3bf0:	486e 0030      	pea 48(a6)
    3bf4:	4879 0000 76f4 	pea 76f4 <destlinezoom15>
    3bfa:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3bfc:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3c00:	4646           	not.w d6
    3c02:	5482           	addq.l #2,d2
    for(int i2=0;i2<15;i2++) {
    3c04:	4fef 0020      	lea 32(sp),sp
    3c08:	be8e           	cmp.l a6,d7
    3c0a:	66ce           	bne.s 3bda <ZoomTest+0x2198>
    3c0c:	0683 0000 0630 	addi.l #1584,d3
    3c12:	47eb 0021      	lea 33(a3),a3
  for(int i=0;i<7;i++) {
    3c16:	b6fc 00fa      	cmpa.w #250,a3
    3c1a:	668a           	bne.s 3ba6 <ZoomTest+0x2164>
    3c1c:	2645           	movea.l d5,a3
    3c1e:	4deb 2e54      	lea 11860(a3),a6
    TestRow( valsupposed, valactual, mask, 247+i2);
    3c22:	2f2d ff78      	move.l -136(a5),-(sp)
    3c26:	3f06           	move.w d6,-(sp)
    3c28:	4267           	clr.w -(sp)
    3c2a:	2f0e           	move.l a6,-(sp)
    3c2c:	4879 0000 76f4 	pea 76f4 <destlinezoom15>
    3c32:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    3c34:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    3c38:	4646           	not.w d6
    3c3a:	52ad ff78      	addq.l #1,-136(a5)
  for(int i2=0;i2<3;i2++) {  
    3c3e:	4fef 0010      	lea 16(sp),sp
    3c42:	0cad 0000 00fa 	cmpi.l #250,-136(a5)
    3c48:	ff78 
    3c4a:	66d6           	bne.s 3c22 <ZoomTest+0x21e0>
    3c4c:	2c6d ff6c      	movea.l -148(a5),a6
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    3c50:	7400           	moveq #0,d2
    3c52:	3406           	move.w d6,d2
    3c54:	2f2d ff78      	move.l -136(a5),-(sp)
    3c58:	2f02           	move.l d2,-(sp)
    3c5a:	2f0e           	move.l a6,-(sp)
    3c5c:	4879 0000 76f4 	pea 76f4 <destlinezoom15>
    3c62:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    3c64:	206d ff78      	movea.l -136(a5),a0
    3c68:	4868 0001      	pea 1(a0)
    3c6c:	2f02           	move.l d2,-(sp)
    3c6e:	486e 0030      	pea 48(a6)
    3c72:	4879 0000 76f4 	pea 76f4 <destlinezoom15>
    3c78:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3c7a:	4646           	not.w d6
    3c7c:	54ad ff78      	addq.l #2,-136(a5)
    valactual += ZMLINESIZE/2;
    3c80:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<10;i2++) {
    3c84:	4fef 0020      	lea 32(sp),sp
    3c88:	0cad 0000 010e 	cmpi.l #270,-136(a5)
    3c8e:	ff78 
    3c90:	66be           	bne.s 3c50 <ZoomTest+0x220e>
  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    3c92:	4878 0001      	pea 1 <_start+0x1>
    3c96:	4878 000f      	pea f <main+0x9>
    3c9a:	2f0c           	move.l a4,-(sp)
    3c9c:	2f0b           	move.l a3,-(sp)
    3c9e:	4eba d1f8      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3ca2:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    3ca8:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    3cac:	42a7           	clr.l -(sp)
    3cae:	42a7           	clr.l -(sp)
    3cb0:	2f2d ff70      	move.l -144(a5),-(sp)
    3cb4:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3cba:	4e92           	jsr (a2)
    3cbc:	4fef 0020      	lea 32(sp),sp
    3cc0:	2b6d ff84 ff6c 	move.l -124(a5),-148(a5)
    3cc6:	2c2d ff7c      	move.l -132(a5),d6
  valactual += ZMLINESIZE/2;
    3cca:	262d ff80      	move.l -128(a5),d3
  TestRow( valsupposed, valactual, mask, 0);   
    3cce:	9dce           	suba.l a6,a6
  mask = mask ^ 0xffff;
    3cd0:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3cd2:	7800           	moveq #0,d4
    3cd4:	3802           	move.w d2,d4
    3cd6:	2f0e           	move.l a6,-(sp)
    3cd8:	2f04           	move.l d4,-(sp)
    3cda:	2f03           	move.l d3,-(sp)
    3cdc:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3ce2:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3ce4:	486e 0001      	pea 1(a6)
    3ce8:	2f04           	move.l d4,-(sp)
    3cea:	2043           	movea.l d3,a0
    3cec:	4868 0030      	pea 48(a0)
    3cf0:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3cf6:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3cf8:	4642           	not.w d2
    3cfa:	2803           	move.l d3,d4
    3cfc:	0684 0000 0120 	addi.l #288,d4
    3d02:	548e           	addq.l #2,a6
    3d04:	2606           	move.l d6,d3
  for(int i2=0;i2<6;i2++) {
    3d06:	4fef 0020      	lea 32(sp),sp
    3d0a:	700c           	moveq #12,d0
    3d0c:	b08e           	cmp.l a6,d0
    3d0e:	6746           	beq.s 3d56 <ZoomTest+0x2314>
    3d10:	2c2d ff6c      	move.l -148(a5),d6
    3d14:	2b44 ff6c      	move.l d4,-148(a5)
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3d18:	7800           	moveq #0,d4
    3d1a:	3802           	move.w d2,d4
    3d1c:	2f0e           	move.l a6,-(sp)
    3d1e:	2f04           	move.l d4,-(sp)
    3d20:	2f03           	move.l d3,-(sp)
    3d22:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3d28:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3d2a:	486e 0001      	pea 1(a6)
    3d2e:	2f04           	move.l d4,-(sp)
    3d30:	2043           	movea.l d3,a0
    3d32:	4868 0030      	pea 48(a0)
    3d36:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3d3c:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3d3e:	4642           	not.w d2
    3d40:	2803           	move.l d3,d4
    3d42:	0684 0000 0120 	addi.l #288,d4
    3d48:	548e           	addq.l #2,a6
    3d4a:	2606           	move.l d6,d3
  for(int i2=0;i2<6;i2++) {
    3d4c:	4fef 0020      	lea 32(sp),sp
    3d50:	700c           	moveq #12,d0
    3d52:	b08e           	cmp.l a6,d0
    3d54:	66ba           	bne.s 3d10 <ZoomTest+0x22ce>
    3d56:	3c7c 000d      	movea.w #13,a6
    3d5a:	2a0b           	move.l a3,d5
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3d5c:	2f0e           	move.l a6,-(sp)
    3d5e:	7600           	moveq #0,d3
    3d60:	3602           	move.w d2,d3
    3d62:	2f03           	move.l d3,-(sp)
    3d64:	2f06           	move.l d6,-(sp)
    3d66:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3d6c:	4e92           	jsr (a2)
    3d6e:	486e 0001      	pea 1(a6)
      mask = mask ^ 0xffff;
    3d72:	3e02           	move.w d2,d7
    3d74:	4647           	not.w d7
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3d76:	3f07           	move.w d7,-(sp)
    3d78:	4267           	clr.w -(sp)
    3d7a:	2046           	movea.l d6,a0
    3d7c:	4868 0030      	pea 48(a0)
    3d80:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3d86:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    3d88:	47ee 0003      	lea 3(a6),a3
    3d8c:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3d90:	2c04           	move.l d4,d6
    3d92:	7823           	moveq #35,d4
    3d94:	d88e           	add.l a6,d4
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    3d96:	2f0b           	move.l a3,-(sp)
    3d98:	2f03           	move.l d3,-(sp)
    3d9a:	2f2d ff6c      	move.l -148(a5),-(sp)
    3d9e:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3da4:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    3da6:	486b 0001      	pea 1(a3)
    3daa:	2f03           	move.l d3,-(sp)
    3dac:	206d ff6c      	movea.l -148(a5),a0
    3db0:	4868 0030      	pea 48(a0)
    3db4:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3dba:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    3dbc:	3407           	move.w d7,d2
    3dbe:	206d ff6c      	movea.l -148(a5),a0
    3dc2:	41e8 00c0      	lea 192(a0),a0
    3dc6:	548b           	addq.l #2,a3
    for(int i2=0;i2<16;i2++) {
    3dc8:	4fef 0020      	lea 32(sp),sp
    3dcc:	b7c4           	cmpa.l d4,a3
    3dce:	6746           	beq.s 3e16 <ZoomTest+0x23d4>
    3dd0:	2b46 ff6c      	move.l d6,-148(a5)
    3dd4:	2c08           	move.l a0,d6
    3dd6:	7600           	moveq #0,d3
    3dd8:	3607           	move.w d7,d3
    3dda:	4647           	not.w d7
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    3ddc:	2f0b           	move.l a3,-(sp)
    3dde:	2f03           	move.l d3,-(sp)
    3de0:	2f2d ff6c      	move.l -148(a5),-(sp)
    3de4:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3dea:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    3dec:	486b 0001      	pea 1(a3)
    3df0:	2f03           	move.l d3,-(sp)
    3df2:	206d ff6c      	movea.l -148(a5),a0
    3df6:	4868 0030      	pea 48(a0)
    3dfa:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3e00:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    3e02:	3407           	move.w d7,d2
    3e04:	206d ff6c      	movea.l -148(a5),a0
    3e08:	41e8 00c0      	lea 192(a0),a0
    3e0c:	548b           	addq.l #2,a3
    for(int i2=0;i2<16;i2++) {
    3e0e:	4fef 0020      	lea 32(sp),sp
    3e12:	b7c4           	cmpa.l d4,a3
    3e14:	66ba           	bne.s 3dd0 <ZoomTest+0x238e>
    3e16:	4dee 0022      	lea 34(a6),a6
  for(int i=0;i<7;i++) {
    3e1a:	bcfc 00fb      	cmpa.w #251,a6
    3e1e:	6754           	beq.s 3e74 <ZoomTest+0x2432>
    3e20:	282d ff6c      	move.l -148(a5),d4
    3e24:	0684 0000 0120 	addi.l #288,d4
    3e2a:	2b48 ff6c      	move.l a0,-148(a5)
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3e2e:	2f0e           	move.l a6,-(sp)
    3e30:	7600           	moveq #0,d3
    3e32:	3602           	move.w d2,d3
    3e34:	2f03           	move.l d3,-(sp)
    3e36:	2f06           	move.l d6,-(sp)
    3e38:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3e3e:	4e92           	jsr (a2)
    3e40:	486e 0001      	pea 1(a6)
      mask = mask ^ 0xffff;
    3e44:	3e02           	move.w d2,d7
    3e46:	4647           	not.w d7
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3e48:	3f07           	move.w d7,-(sp)
    3e4a:	4267           	clr.w -(sp)
    3e4c:	2046           	movea.l d6,a0
    3e4e:	4868 0030      	pea 48(a0)
    3e52:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3e58:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    3e5a:	47ee 0003      	lea 3(a6),a3
    3e5e:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3e62:	2c04           	move.l d4,d6
    3e64:	7823           	moveq #35,d4
    3e66:	d88e           	add.l a6,d4
    3e68:	6000 ff2c      	bra.w 3d96 <ZoomTest+0x2354>
    3e6c:	7600           	moveq #0,d3
    3e6e:	3602           	move.w d2,d3
    3e70:	6000 e55a      	bra.w 23cc <ZoomTest+0x98a>
    3e74:	2645           	movea.l d5,a3
    3e76:	2a08           	move.l a0,d5
    TestRow( valsupposed, valactual, mask, 251+i2);
    3e78:	2f0e           	move.l a6,-(sp)
    3e7a:	7800           	moveq #0,d4
    3e7c:	3807           	move.w d7,d4
    3e7e:	2f04           	move.l d4,-(sp)
    3e80:	2f06           	move.l d6,-(sp)
    3e82:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3e88:	4e92           	jsr (a2)
    3e8a:	4878 00fc      	pea fc <main+0xf6>
    3e8e:	2f03           	move.l d3,-(sp)
    3e90:	206d ff6c      	movea.l -148(a5),a0
    3e94:	4868 0090      	pea 144(a0)
    3e98:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3e9e:	4e92           	jsr (a2)
    3ea0:	4fef 0020      	lea 32(sp),sp
    3ea4:	2b7c 0000 00fd 	move.l #253,-148(a5)
    3eaa:	ff6c 
    3eac:	2c45           	movea.l d5,a6
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    3eae:	2f2d ff6c      	move.l -148(a5),-(sp)
    3eb2:	2f04           	move.l d4,-(sp)
    3eb4:	2f0e           	move.l a6,-(sp)
    3eb6:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3ebc:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3ebe:	206d ff6c      	movea.l -148(a5),a0
    3ec2:	4868 0001      	pea 1(a0)
    3ec6:	2f04           	move.l d4,-(sp)
    3ec8:	486e 0030      	pea 48(a6)
    3ecc:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3ed2:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3ed4:	4642           	not.w d2
    3ed6:	54ad ff6c      	addq.l #2,-148(a5)
    valactual += ZMLINESIZE/2;
    3eda:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<8;i2++) {
    3ede:	4fef 0020      	lea 32(sp),sp
    3ee2:	0cad 0000 010d 	cmpi.l #269,-148(a5)
    3ee8:	ff6c 
    3eea:	6742           	beq.s 3f2e <ZoomTest+0x24ec>
    3eec:	7800           	moveq #0,d4
    3eee:	3802           	move.w d2,d4
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    3ef0:	2f2d ff6c      	move.l -148(a5),-(sp)
    3ef4:	2f04           	move.l d4,-(sp)
    3ef6:	2f0e           	move.l a6,-(sp)
    3ef8:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3efe:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3f00:	206d ff6c      	movea.l -148(a5),a0
    3f04:	4868 0001      	pea 1(a0)
    3f08:	2f04           	move.l d4,-(sp)
    3f0a:	486e 0030      	pea 48(a6)
    3f0e:	4879 0000 76c8 	pea 76c8 <destlinezoom16>
    3f14:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3f16:	4642           	not.w d2
    3f18:	54ad ff6c      	addq.l #2,-148(a5)
    valactual += ZMLINESIZE/2;
    3f1c:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<8;i2++) {
    3f20:	4fef 0020      	lea 32(sp),sp
    3f24:	0cad 0000 010d 	cmpi.l #269,-148(a5)
    3f2a:	ff6c 
    3f2c:	66be           	bne.s 3eec <ZoomTest+0x24aa>
  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    3f2e:	4878 0001      	pea 1 <_start+0x1>
    3f32:	4878 0010      	pea 10 <main+0xa>
    3f36:	2f0b           	move.l a3,-(sp)
    3f38:	2f0c           	move.l a4,-(sp)
    3f3a:	4eba cf5c      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3f3e:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    3f44:	4eae ff1c      	jsr -228(a6)
    3f48:	4fef 0010      	lea 16(sp),sp
    3f4c:	307c 0001      	movea.w #1,a0
    3f50:	2b48 ff6c      	move.l a0,-148(a5)
  mask = 0xffff;
    3f54:	7eff           	moveq #-1,d7
    3f56:	2c6d ff74      	movea.l -140(a5),a6
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3f5a:	7400           	moveq #0,d2
    3f5c:	3407           	move.w d7,d2
    3f5e:	206d ff6c      	movea.l -148(a5),a0
    3f62:	4868 ffff      	pea -1(a0)
    3f66:	2f02           	move.l d2,-(sp)
    3f68:	2f0e           	move.l a6,-(sp)
    3f6a:	4879 0000 769c 	pea 769c <destlinezoom17>
    3f70:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3f72:	2f2d ff6c      	move.l -148(a5),-(sp)
    3f76:	2f02           	move.l d2,-(sp)
    3f78:	486e 0030      	pea 48(a6)
    3f7c:	4879 0000 769c 	pea 769c <destlinezoom17>
    3f82:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3f84:	4647           	not.w d7
    3f86:	54ad ff6c      	addq.l #2,-148(a5)
    valactual += ZMLINESIZE/2;
    3f8a:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<5;i2++) {
    3f8e:	4fef 0020      	lea 32(sp),sp
    3f92:	700b           	moveq #11,d0
    3f94:	b0ad ff6c      	cmp.l -148(a5),d0
    3f98:	66c0           	bne.s 3f5a <ZoomTest+0x2518>
    3f9a:	2a0b           	move.l a3,d5
    3f9c:	0685 0000 01e4 	addi.l #484,d5
    3fa2:	3c7c 000a      	movea.w #10,a6
    3fa6:	2c0b           	move.l a3,d6
    3fa8:	2005           	move.l d5,d0
    3faa:	2a0c           	move.l a4,d5
    3fac:	2b6d ff6c ff74 	move.l -148(a5),-140(a5)
    3fb2:	2840           	movea.l d0,a4
      TestRow( valsupposed, valactual, mask, 10+i*35);
    3fb4:	2f0e           	move.l a6,-(sp)
    3fb6:	3f07           	move.w d7,-(sp)
    3fb8:	4267           	clr.w -(sp)
    3fba:	2f0c           	move.l a4,-(sp)
    3fbc:	4879 0000 769c 	pea 769c <destlinezoom17>
    3fc2:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3fc4:	47ec 0030      	lea 48(a4),a3
      mask = mask ^ 0xffff;
    3fc8:	3807           	move.w d7,d4
    3fca:	4644           	not.w d4
    for(int i2=0;i2<17;i2++) {
    3fcc:	41ee 0001      	lea 1(a6),a0
    3fd0:	2b48 ff6c      	move.l a0,-148(a5)
    3fd4:	4fef 0010      	lea 16(sp),sp
    3fd8:	49ec 0690      	lea 1680(a4),a4
    3fdc:	260c           	move.l a4,d3
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3fde:	7400           	moveq #0,d2
    3fe0:	3404           	move.w d4,d2
    3fe2:	2f2d ff6c      	move.l -148(a5),-(sp)
    3fe6:	2f02           	move.l d2,-(sp)
    3fe8:	2f0b           	move.l a3,-(sp)
    3fea:	4879 0000 769c 	pea 769c <destlinezoom17>
    3ff0:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3ff2:	206d ff6c      	movea.l -148(a5),a0
    3ff6:	4868 0001      	pea 1(a0)
    3ffa:	2f02           	move.l d2,-(sp)
    3ffc:	486b 0030      	pea 48(a3)
    4000:	4879 0000 769c 	pea 769c <destlinezoom17>
    4006:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    4008:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    400c:	4644           	not.w d4
    400e:	3e04           	move.w d4,d7
    4010:	54ad ff6c      	addq.l #2,-148(a5)
    for(int i2=0;i2<17;i2++) {
    4014:	4fef 0020      	lea 32(sp),sp
    4018:	b7c3           	cmpa.l d3,a3
    401a:	66c2           	bne.s 3fde <ZoomTest+0x259c>
    401c:	4dee 0023      	lea 35(a6),a6
  for(int i=0;i<7;i++) {
    4020:	bcfc 00ff      	cmpa.w #255,a6
    4024:	668e           	bne.s 3fb4 <ZoomTest+0x2572>
    4026:	2845           	movea.l d5,a4
    4028:	2646           	movea.l d6,a3
    402a:	2b6d ff74 ff6c 	move.l -140(a5),-148(a5)
  TestRow( valsupposed, valactual, mask, 255);
    4030:	2f0e           	move.l a6,-(sp)
    4032:	3f04           	move.w d4,-(sp)
    4034:	4267           	clr.w -(sp)
    4036:	486b 2fd4      	pea 12244(a3)
    403a:	4879 0000 769c 	pea 769c <destlinezoom17>
    4040:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    4042:	2606           	move.l d6,d3
    4044:	0683 0000 3004 	addi.l #12292,d3
    404a:	4fef 0010      	lea 16(sp),sp
    404e:	3c7c 0100      	movea.w #256,a6
    4052:	2003           	move.l d3,d0
    4054:	2606           	move.l d6,d3
    4056:	2640           	movea.l d0,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    4058:	2f0e           	move.l a6,-(sp)
    405a:	2f02           	move.l d2,-(sp)
    405c:	2f0b           	move.l a3,-(sp)
    405e:	4879 0000 769c 	pea 769c <destlinezoom17>
    4064:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    4066:	486e 0001      	pea 1(a6)
    406a:	2f02           	move.l d2,-(sp)
    406c:	486b 0030      	pea 48(a3)
    4070:	4879 0000 769c 	pea 769c <destlinezoom17>
    4076:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    4078:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    407a:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<7;i2++) {
    407e:	4fef 0020      	lea 32(sp),sp
    4082:	bcfc 010e      	cmpa.w #270,a6
    4086:	6736           	beq.s 40be <ZoomTest+0x267c>
    4088:	7400           	moveq #0,d2
    408a:	3404           	move.w d4,d2
    408c:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    408e:	2f0e           	move.l a6,-(sp)
    4090:	2f02           	move.l d2,-(sp)
    4092:	2f0b           	move.l a3,-(sp)
    4094:	4879 0000 769c 	pea 769c <destlinezoom17>
    409a:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    409c:	486e 0001      	pea 1(a6)
    40a0:	2f02           	move.l d2,-(sp)
    40a2:	486b 0030      	pea 48(a3)
    40a6:	4879 0000 769c 	pea 769c <destlinezoom17>
    40ac:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    40ae:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    40b0:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<7;i2++) {
    40b4:	4fef 0020      	lea 32(sp),sp
    40b8:	bcfc 010e      	cmpa.w #270,a6
    40bc:	66ca           	bne.s 4088 <ZoomTest+0x2646>
  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    40be:	4878 0001      	pea 1 <_start+0x1>
    40c2:	4878 0011      	pea 11 <main+0xb>
    40c6:	2f0c           	move.l a4,-(sp)
    40c8:	2f03           	move.l d3,-(sp)
    40ca:	4eba cdcc      	jsr e98 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    40ce:	2c79 0000 79e6 	movea.l 79e6 <GfxBase>,a6
    40d4:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    40d8:	42a7           	clr.l -(sp)
    40da:	2f3c 0000 ffff 	move.l #65535,-(sp)
    40e0:	2f2d ff70      	move.l -144(a5),-(sp)
    40e4:	4879 0000 7670 	pea 7670 <destlinezoom18>
    40ea:	4e92           	jsr (a2)
    40ec:	4fef 0020      	lea 32(sp),sp
    40f0:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff;
    40f4:	4242           	clr.w d2
    40f6:	286d ff80      	movea.l -128(a5),a4
    40fa:	282d ff7c      	move.l -132(a5),d4
    40fe:	2a2d ff84      	move.l -124(a5),d5
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    4102:	7600           	moveq #0,d3
    4104:	3602           	move.w d2,d3
    4106:	2f0b           	move.l a3,-(sp)
    4108:	2f03           	move.l d3,-(sp)
    410a:	2f0c           	move.l a4,-(sp)
    410c:	4879 0000 7670 	pea 7670 <destlinezoom18>
    4112:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    4114:	486b 0001      	pea 1(a3)
    4118:	2f03           	move.l d3,-(sp)
    411a:	486c 0030      	pea 48(a4)
    411e:	4879 0000 7670 	pea 7670 <destlinezoom18>
    4124:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    4126:	4642           	not.w d2
    4128:	200c           	move.l a4,d0
    412a:	0680 0000 0120 	addi.l #288,d0
    4130:	548b           	addq.l #2,a3
    4132:	2844           	movea.l d4,a4
  for(int i2=0;i2<4;i2++) {
    4134:	4fef 0020      	lea 32(sp),sp
    4138:	7209           	moveq #9,d1
    413a:	b28b           	cmp.l a3,d1
    413c:	6740           	beq.s 417e <ZoomTest+0x273c>
    413e:	2805           	move.l d5,d4
    4140:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    4142:	7600           	moveq #0,d3
    4144:	3602           	move.w d2,d3
    4146:	2f0b           	move.l a3,-(sp)
    4148:	2f03           	move.l d3,-(sp)
    414a:	2f0c           	move.l a4,-(sp)
    414c:	4879 0000 7670 	pea 7670 <destlinezoom18>
    4152:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    4154:	486b 0001      	pea 1(a3)
    4158:	2f03           	move.l d3,-(sp)
    415a:	486c 0030      	pea 48(a4)
    415e:	4879 0000 7670 	pea 7670 <destlinezoom18>
    4164:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    4166:	4642           	not.w d2
    4168:	200c           	move.l a4,d0
    416a:	0680 0000 0120 	addi.l #288,d0
    4170:	548b           	addq.l #2,a3
    4172:	2844           	movea.l d4,a4
  for(int i2=0;i2<4;i2++) {
    4174:	4fef 0020      	lea 32(sp),sp
    4178:	7209           	moveq #9,d1
    417a:	b28b           	cmp.l a3,d1
    417c:	66c0           	bne.s 413e <ZoomTest+0x26fc>
    417e:	2644           	movea.l d4,a3
    4180:	2805           	move.l d5,d4
    4182:	286d ff6c      	movea.l -148(a5),a4
    4186:	2600           	move.l d0,d3
    4188:	3c7c 0024      	movea.w #36,a6
    418c:	ddcc           	adda.l a4,a6
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    418e:	7a00           	moveq #0,d5
    4190:	3a02           	move.w d2,d5
    4192:	2f0c           	move.l a4,-(sp)
    4194:	2f05           	move.l d5,-(sp)
    4196:	2f0b           	move.l a3,-(sp)
    4198:	4879 0000 7670 	pea 7670 <destlinezoom18>
    419e:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    41a0:	486c 0001      	pea 1(a4)
    41a4:	2f05           	move.l d5,-(sp)
    41a6:	486b 0030      	pea 48(a3)
    41aa:	4879 0000 7670 	pea 7670 <destlinezoom18>
    41b0:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    41b2:	4642           	not.w d2
    41b4:	548c           	addq.l #2,a4
    for(int i2=0;i2<18;i2++) {
    41b6:	4fef 0020      	lea 32(sp),sp
    41ba:	bdcc           	cmpa.l a4,a6
    41bc:	673e           	beq.s 41fc <ZoomTest+0x27ba>
    41be:	200b           	move.l a3,d0
    41c0:	0680 0000 0120 	addi.l #288,d0
    41c6:	2644           	movea.l d4,a3
    41c8:	2803           	move.l d3,d4
    41ca:	2600           	move.l d0,d3
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    41cc:	7a00           	moveq #0,d5
    41ce:	3a02           	move.w d2,d5
    41d0:	2f0c           	move.l a4,-(sp)
    41d2:	2f05           	move.l d5,-(sp)
    41d4:	2f0b           	move.l a3,-(sp)
    41d6:	4879 0000 7670 	pea 7670 <destlinezoom18>
    41dc:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    41de:	486c 0001      	pea 1(a4)
    41e2:	2f05           	move.l d5,-(sp)
    41e4:	486b 0030      	pea 48(a3)
    41e8:	4879 0000 7670 	pea 7670 <destlinezoom18>
    41ee:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    41f0:	4642           	not.w d2
    41f2:	548c           	addq.l #2,a4
    for(int i2=0;i2<18;i2++) {
    41f4:	4fef 0020      	lea 32(sp),sp
    41f8:	bdcc           	cmpa.l a4,a6
    41fa:	66c2           	bne.s 41be <ZoomTest+0x277c>
    41fc:	7023           	moveq #35,d0
    41fe:	d1ad ff6c      	add.l d0,-148(a5)
  for(int i=0;i<7;i++) {  
    4202:	0cad 0000 0100 	cmpi.l #256,-148(a5)
    4208:	ff6c 
    420a:	671c           	beq.s 4228 <ZoomTest+0x27e6>
    420c:	200b           	move.l a3,d0
    420e:	0680 0000 0120 	addi.l #288,d0
    4214:	2644           	movea.l d4,a3
    4216:	2803           	move.l d3,d4
  for(int i2=0;i2<4;i2++) {
    4218:	286d ff6c      	movea.l -148(a5),a4
    421c:	2600           	move.l d0,d3
    421e:	3c7c 0024      	movea.w #36,a6
    4222:	ddcc           	adda.l a4,a6
    4224:	6000 ff68      	bra.w 418e <ZoomTest+0x274c>
    4228:	2644           	movea.l d4,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    422a:	7800           	moveq #0,d4
    422c:	3802           	move.w d2,d4
    422e:	2f2d ff6c      	move.l -148(a5),-(sp)
    4232:	2f04           	move.l d4,-(sp)
    4234:	2f0b           	move.l a3,-(sp)
    4236:	4879 0000 7670 	pea 7670 <destlinezoom18>
    423c:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    423e:	206d ff6c      	movea.l -148(a5),a0
    4242:	4868 0001      	pea 1(a0)
    4246:	2f04           	move.l d4,-(sp)
    4248:	486b 0030      	pea 48(a3)
    424c:	4879 0000 7670 	pea 7670 <destlinezoom18>
    4252:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    4254:	4642           	not.w d2
    4256:	54ad ff6c      	addq.l #2,-148(a5)
  for(int i2=0;i2<4;i2++) {
    425a:	4fef 0020      	lea 32(sp),sp
    425e:	0cad 0000 0108 	cmpi.l #264,-148(a5)
    4264:	ff6c 
    4266:	674a           	beq.s 42b2 <ZoomTest+0x2870>
    4268:	200b           	move.l a3,d0
    426a:	0680 0000 00c0 	addi.l #192,d0
    4270:	2643           	movea.l d3,a3
    4272:	2600           	move.l d0,d3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    4274:	7800           	moveq #0,d4
    4276:	3802           	move.w d2,d4
    4278:	2f2d ff6c      	move.l -148(a5),-(sp)
    427c:	2f04           	move.l d4,-(sp)
    427e:	2f0b           	move.l a3,-(sp)
    4280:	4879 0000 7670 	pea 7670 <destlinezoom18>
    4286:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    4288:	206d ff6c      	movea.l -148(a5),a0
    428c:	4868 0001      	pea 1(a0)
    4290:	2f04           	move.l d4,-(sp)
    4292:	486b 0030      	pea 48(a3)
    4296:	4879 0000 7670 	pea 7670 <destlinezoom18>
    429c:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    429e:	4642           	not.w d2
    42a0:	54ad ff6c      	addq.l #2,-148(a5)
  for(int i2=0;i2<4;i2++) {
    42a4:	4fef 0020      	lea 32(sp),sp
    42a8:	0cad 0000 0108 	cmpi.l #264,-148(a5)
    42ae:	ff6c 
    42b0:	66b6           	bne.s 4268 <ZoomTest+0x2826>
  TestRow( valsupposed, valactual, mask, 0);
    42b2:	42a7           	clr.l -(sp)
    42b4:	3f02           	move.w d2,-(sp)
    42b6:	4267           	clr.w -(sp)
    42b8:	2f03           	move.l d3,-(sp)
    42ba:	4879 0000 7670 	pea 7670 <destlinezoom18>
    42c0:	4e92           	jsr (a2)
    42c2:	4fef 0010      	lea 16(sp),sp
}
    42c6:	4ced 5cfc ff40 	movem.l -192(a5),d2-d7/a2-a4/a6
    42cc:	4e5d           	unlk a5
    42ce:	4e75           	rts
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    42d0:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    42d6:	4eae ffc4      	jsr -60(a6)
    42da:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    42e0:	2200           	move.l d0,d1
    42e2:	243c 0000 5238 	move.l #21048,d2
    42e8:	7635           	moveq #53,d3
    42ea:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    42ee:	2c79 0000 79f2 	movea.l 79f2 <SysBase>,a6
    42f4:	203c 0000 3740 	move.l #14144,d0
    42fa:	7202           	moveq #2,d1
    42fc:	4eae ff3a      	jsr -198(a6)
    4300:	2840           	movea.l d0,a4
  if( source == 0) {
    4302:	4a80           	tst.l d0
    4304:	6600 df8e      	bne.w 2294 <ZoomTest+0x852>
    Write(  Output(), 
    4308:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    430e:	4eae ffc4      	jsr -60(a6)
    4312:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    4318:	2200           	move.l d0,d1
    431a:	243c 0000 52af 	move.l #21167,d2
    4320:	7639           	moveq #57,d3
    4322:	4eae ffd0      	jsr -48(a6)
}
    4326:	4ced 5cfc ff40 	movem.l -192(a5),d2-d7/a2-a4/a6
    432c:	4e5d           	unlk a5
    432e:	4e75           	rts
    Write(  Output(), 
    4330:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    4336:	4eae ffc4      	jsr -60(a6)
    433a:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    4340:	2200           	move.l d0,d1
    4342:	243c 0000 51ab 	move.l #20907,d2
    4348:	7636           	moveq #54,d3
    434a:	4eae ffd0      	jsr -48(a6)
    return;
    434e:	6000 dcf0      	bra.w 2040 <ZoomTest+0x5fe>
    Write(  Output(), 
    4352:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    4358:	4eae ffc4      	jsr -60(a6)
    435c:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    4362:	2200           	move.l d0,d1
    4364:	243c 0000 4f23 	move.l #20259,d2
    436a:	7639           	moveq #57,d3
    436c:	4eae ffd0      	jsr -48(a6)
    return;
    4370:	6000 d8be      	bra.w 1c30 <ZoomTest+0x1ee>
    Write(  Output(), 
    4374:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    437a:	4eae ffc4      	jsr -60(a6)
    437e:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    4384:	2200           	move.l d0,d1
    4386:	243c 0000 52e9 	move.l #21225,d2
    438c:	763d           	moveq #61,d3
    438e:	4eae ffd0      	jsr -48(a6)
}
    4392:	4ced 5cfc ff40 	movem.l -192(a5),d2-d7/a2-a4/a6
    4398:	4e5d           	unlk a5
    439a:	4e75           	rts
    Write(  Output(), 
    439c:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    43a2:	4eae ffc4      	jsr -60(a6)
    43a6:	2c79 0000 79ee 	movea.l 79ee <DOSBase>,a6
    43ac:	2200           	move.l d0,d1
    43ae:	243c 0000 4f5a 	move.l #20314,d2
    43b4:	763d           	moveq #61,d3
    43b6:	4eae ffd0      	jsr -48(a6)
    return;
    43ba:	6000 d874      	bra.w 1c30 <ZoomTest+0x1ee>

000043be <memcpy>:
{
    43be:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    43c2:	202f 0014      	move.l 20(sp),d0
    43c6:	226f 0018      	movea.l 24(sp),a1
    43ca:	222f 001c      	move.l 28(sp),d1
	while(len--)
    43ce:	2601           	move.l d1,d3
    43d0:	5383           	subq.l #1,d3
    43d2:	4a81           	tst.l d1
    43d4:	6762           	beq.s 4438 <memcpy+0x7a>
    43d6:	2040           	movea.l d0,a0
    43d8:	5888           	addq.l #4,a0
    43da:	b1c9           	cmpa.l a1,a0
    43dc:	53c2           	sl.s d2
    43de:	4402           	neg.b d2
    43e0:	41e9 0004      	lea 4(a1),a0
    43e4:	b1c0           	cmpa.l d0,a0
    43e6:	53c4           	sl.s d4
    43e8:	4404           	neg.b d4
    43ea:	8404           	or.b d4,d2
    43ec:	7808           	moveq #8,d4
    43ee:	b883           	cmp.l d3,d4
    43f0:	55c4           	sc.s d4
    43f2:	4404           	neg.b d4
    43f4:	c404           	and.b d4,d2
    43f6:	6746           	beq.s 443e <memcpy+0x80>
    43f8:	2409           	move.l a1,d2
    43fa:	8480           	or.l d0,d2
    43fc:	7803           	moveq #3,d4
    43fe:	c484           	and.l d4,d2
    4400:	663c           	bne.s 443e <memcpy+0x80>
    4402:	2049           	movea.l a1,a0
    4404:	2440           	movea.l d0,a2
    4406:	74fc           	moveq #-4,d2
    4408:	c481           	and.l d1,d2
    440a:	d489           	add.l a1,d2
		*d++ = *s++;
    440c:	24d8           	move.l (a0)+,(a2)+
    440e:	b488           	cmp.l a0,d2
    4410:	66fa           	bne.s 440c <memcpy+0x4e>
    4412:	74fc           	moveq #-4,d2
    4414:	c481           	and.l d1,d2
    4416:	2040           	movea.l d0,a0
    4418:	d1c2           	adda.l d2,a0
    441a:	d3c2           	adda.l d2,a1
    441c:	9682           	sub.l d2,d3
    441e:	b481           	cmp.l d1,d2
    4420:	6716           	beq.s 4438 <memcpy+0x7a>
    4422:	1091           	move.b (a1),(a0)
	while(len--)
    4424:	4a83           	tst.l d3
    4426:	6710           	beq.s 4438 <memcpy+0x7a>
		*d++ = *s++;
    4428:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    442e:	5383           	subq.l #1,d3
    4430:	6706           	beq.s 4438 <memcpy+0x7a>
		*d++ = *s++;
    4432:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    4438:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    443c:	4e75           	rts
    443e:	2040           	movea.l d0,a0
    4440:	d289           	add.l a1,d1
		*d++ = *s++;
    4442:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    4444:	b289           	cmp.l a1,d1
    4446:	67f0           	beq.s 4438 <memcpy+0x7a>
		*d++ = *s++;
    4448:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    444a:	b289           	cmp.l a1,d1
    444c:	66f4           	bne.s 4442 <memcpy+0x84>
    444e:	60e8           	bra.s 4438 <memcpy+0x7a>

00004450 <memset>:
{
    4450:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    4454:	202f 0024      	move.l 36(sp),d0
    4458:	2a2f 0028      	move.l 40(sp),d5
    445c:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    4460:	2809           	move.l a1,d4
    4462:	5384           	subq.l #1,d4
    4464:	b2fc 0000      	cmpa.w #0,a1
    4468:	6f00 00b0      	ble.w 451a <memset+0xca>
    446c:	1e05           	move.b d5,d7
    446e:	2200           	move.l d0,d1
    4470:	4481           	neg.l d1
    4472:	7403           	moveq #3,d2
    4474:	c282           	and.l d2,d1
    4476:	7c05           	moveq #5,d6
		*ptr++ = val;
    4478:	2440           	movea.l d0,a2
    447a:	bc84           	cmp.l d4,d6
    447c:	646a           	bcc.s 44e8 <memset+0x98>
    447e:	4a81           	tst.l d1
    4480:	6724           	beq.s 44a6 <memset+0x56>
    4482:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    4484:	5384           	subq.l #1,d4
    4486:	7401           	moveq #1,d2
    4488:	b481           	cmp.l d1,d2
    448a:	671a           	beq.s 44a6 <memset+0x56>
		*ptr++ = val;
    448c:	2440           	movea.l d0,a2
    448e:	548a           	addq.l #2,a2
    4490:	2040           	movea.l d0,a0
    4492:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    4496:	5384           	subq.l #1,d4
    4498:	7403           	moveq #3,d2
    449a:	b481           	cmp.l d1,d2
    449c:	6608           	bne.s 44a6 <memset+0x56>
		*ptr++ = val;
    449e:	528a           	addq.l #1,a2
    44a0:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    44a4:	5384           	subq.l #1,d4
    44a6:	2609           	move.l a1,d3
    44a8:	9681           	sub.l d1,d3
    44aa:	7c00           	moveq #0,d6
    44ac:	1c05           	move.b d5,d6
    44ae:	2406           	move.l d6,d2
    44b0:	4842           	swap d2
    44b2:	4242           	clr.w d2
    44b4:	2042           	movea.l d2,a0
    44b6:	2406           	move.l d6,d2
    44b8:	e14a           	lsl.w #8,d2
    44ba:	4842           	swap d2
    44bc:	4242           	clr.w d2
    44be:	e18e           	lsl.l #8,d6
    44c0:	2646           	movea.l d6,a3
    44c2:	2c08           	move.l a0,d6
    44c4:	8486           	or.l d6,d2
    44c6:	2c0b           	move.l a3,d6
    44c8:	8486           	or.l d6,d2
    44ca:	1407           	move.b d7,d2
    44cc:	2040           	movea.l d0,a0
    44ce:	d1c1           	adda.l d1,a0
    44d0:	72fc           	moveq #-4,d1
    44d2:	c283           	and.l d3,d1
    44d4:	d288           	add.l a0,d1
		*ptr++ = val;
    44d6:	20c2           	move.l d2,(a0)+
    44d8:	b1c1           	cmpa.l d1,a0
    44da:	66fa           	bne.s 44d6 <memset+0x86>
    44dc:	72fc           	moveq #-4,d1
    44de:	c283           	and.l d3,d1
    44e0:	d5c1           	adda.l d1,a2
    44e2:	9881           	sub.l d1,d4
    44e4:	b283           	cmp.l d3,d1
    44e6:	6732           	beq.s 451a <memset+0xca>
    44e8:	1485           	move.b d5,(a2)
	while(len-- > 0)
    44ea:	4a84           	tst.l d4
    44ec:	6f2c           	ble.s 451a <memset+0xca>
		*ptr++ = val;
    44ee:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    44f2:	7201           	moveq #1,d1
    44f4:	b284           	cmp.l d4,d1
    44f6:	6c22           	bge.s 451a <memset+0xca>
		*ptr++ = val;
    44f8:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    44fc:	7402           	moveq #2,d2
    44fe:	b484           	cmp.l d4,d2
    4500:	6c18           	bge.s 451a <memset+0xca>
		*ptr++ = val;
    4502:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    4506:	7c03           	moveq #3,d6
    4508:	bc84           	cmp.l d4,d6
    450a:	6c0e           	bge.s 451a <memset+0xca>
		*ptr++ = val;
    450c:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    4510:	7204           	moveq #4,d1
    4512:	b284           	cmp.l d4,d1
    4514:	6c04           	bge.s 451a <memset+0xca>
		*ptr++ = val;
    4516:	1545 0005      	move.b d5,5(a2)
}
    451a:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    451e:	4e75           	rts

00004520 <strlen>:
{
    4520:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    4524:	7000           	moveq #0,d0
	while(*s++)
    4526:	4a10           	tst.b (a0)
    4528:	6708           	beq.s 4532 <strlen+0x12>
		t++;
    452a:	5280           	addq.l #1,d0
	while(*s++)
    452c:	4a30 0800      	tst.b (0,a0,d0.l)
    4530:	66f8           	bne.s 452a <strlen+0xa>
}
    4532:	4e75           	rts

00004534 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    4534:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    4538:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    453c:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    4540:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    4544:	d041           	add.w d1,d0
	swap	d0
    4546:	4840           	swap d0
	clrw	d0
    4548:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    454a:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    454e:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    4552:	d081           	add.l d1,d0

	rts
    4554:	4e75           	rts

00004556 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    4556:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    4558:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    455c:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    4560:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    4566:	6416           	bcc.s 457e <__udivsi3+0x28>
	movel	d0, d2
    4568:	2400           	move.l d0,d2
	clrw	d2
    456a:	4242           	clr.w d2
	swap	d2
    456c:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    456e:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    4570:	3002           	move.w d2,d0
	swap	d0
    4572:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    4574:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    4578:	84c1           	divu.w d1,d2
	movew	d2, d0
    457a:	3002           	move.w d2,d0
	jra	6f
    457c:	6030           	bra.s 45ae <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    457e:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    4580:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    4582:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    4584:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    458a:	64f4           	bcc.s 4580 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    458c:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    458e:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    4594:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    4596:	c2c0           	mulu.w d0,d1
	swap	d2
    4598:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    459a:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    459c:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    459e:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    45a0:	660a           	bne.s 45ac <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    45a2:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    45a4:	6506           	bcs.s 45ac <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    45a6:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    45aa:	6302           	bls.s 45ae <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    45ac:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    45ae:	241f           	move.l (sp)+,d2
	rts
    45b0:	4e75           	rts

000045b2 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    45b2:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    45b4:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    45b6:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    45ba:	6a04           	bpl.s 45c0 <__divsi3+0xe>
	negl	d1
    45bc:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    45be:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    45c0:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    45c4:	6a04           	bpl.s 45ca <__divsi3+0x18>
	negl	d0
    45c6:	4480           	neg.l d0
	negb	d2
    45c8:	4402           	neg.b d2

2:	movel	d1, sp@-
    45ca:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    45cc:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    45ce:	6186           	bsr.s 4556 <__udivsi3>
	addql	IMM (8), sp
    45d0:	508f           	addq.l #8,sp

	tstb	d2
    45d2:	4a02           	tst.b d2
	jpl	3f
    45d4:	6a02           	bpl.s 45d8 <__divsi3+0x26>
	negl	d0
    45d6:	4480           	neg.l d0

3:	movel	sp@+, d2
    45d8:	241f           	move.l (sp)+,d2
	rts
    45da:	4e75           	rts

000045dc <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    45dc:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    45e0:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    45e4:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    45e6:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    45e8:	61c8           	bsr.s 45b2 <__divsi3>
	addql	IMM (8), sp
    45ea:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    45ec:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    45f0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    45f2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    45f4:	6100 ff3e      	bsr.w 4534 <__mulsi3>
	addql	IMM (8), sp
    45f8:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    45fa:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    45fe:	9280           	sub.l d0,d1
	movel	d1, d0
    4600:	2001           	move.l d1,d0
	rts
    4602:	4e75           	rts

00004604 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    4604:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    4608:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    460c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    460e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    4610:	6100 ff44      	bsr.w 4556 <__udivsi3>
	addql	IMM (8), sp
    4614:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    4616:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    461a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    461c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    461e:	6100 ff14      	bsr.w 4534 <__mulsi3>
	addql	IMM (8), sp
    4622:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    4624:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    4628:	9280           	sub.l d0,d1
	movel	d1, d0
    462a:	2001           	move.l d1,d0
	rts
    462c:	4e75           	rts

0000462e <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    462e:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    4630:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    4634:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    4638:	2c5f           	movea.l (sp)+,a6
    rts
    463a:	4e75           	rts

0000463c <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    463c:	16c0           	move.b d0,(a3)+
	rts
    463e:	4e75           	rts

00004640 <saveregs>:
	...

0000467c <font2distance>:
    467c:	0505           	btst d2,d5
    467e:	0505           	btst d2,d5
    4680:	0505           	btst d2,d5
    4682:	0505           	btst d2,d5
    4684:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    4686:	0505           	btst d2,d5
    4688:	0505           	btst d2,d5
    468a:	0005 0505      	ori.b #5,d5
    468e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    4690:	0505           	btst d2,d5
    4692:	0505           	btst d2,d5
    4694:	0505           	btst d2,d5
    4696:	0505           	btst d2,d5
    4698:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    469a:	0505           	btst d2,d5
    469c:	0505           	btst d2,d5
    469e:	0505           	btst d2,d5
    46a0:	0505           	btst d2,d5
    46a2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    46a4:	0500           	btst d2,d0
    46a6:	0505           	btst d2,d5
    46a8:	0505           	btst d2,d5
    46aa:	0505           	btst d2,d5
    46ac:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    46ae:	0505           	btst d2,d5
    46b0:	0505           	btst d2,d5
    46b2:	0505           	btst d2,d5
    46b4:	0505           	btst d2,d5
    46b6:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    46b8:	0505           	btst d2,d5
    46ba:	0505           	btst d2,d5
    46bc:	0503           	btst d2,d3
    46be:	0505           	btst d2,d5
    46c0:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    46c2:	0505           	btst d2,d5
    46c4:	0500           	btst d2,d0
    46c6:	0505           	btst d2,d5
    46c8:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    46cc:	0505           	btst d2,d5
    46ce:	0503           	btst d2,d3
    46d0:	0205 0507      	andi.b #7,d5
    46d4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    46d6:	0505           	btst d2,d5
    46d8:	0505           	btst d2,d5
    46da:	0505           	btst d2,d5
    46dc:	0505           	btst d2,d5
    46de:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    46e0:	0505           	btst d2,d5
    46e2:	0505           	btst d2,d5
    46e4:	0505           	btst d2,d5
    46e6:	0505           	btst d2,d5
    46e8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    46ea:	0505           	btst d2,d5
    46ec:	0505           	btst d2,d5
    46ee:	0505           	btst d2,d5
    46f0:	0505           	btst d2,d5
    46f2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    46f4:	0505           	btst d2,d5
    46f6:	0505           	btst d2,d5
    46f8:	0505           	btst d2,d5
    46fa:	0505           	btst d2,d5
    46fc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    46fe:	0505           	btst d2,d5
    4700:	0505           	btst d2,d5
    4702:	0505           	btst d2,d5
    4704:	0505           	btst d2,d5
    4706:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4708:	0505           	btst d2,d5
    470a:	0505           	btst d2,d5
    470c:	0505           	btst d2,d5
    470e:	0505           	btst d2,d5
    4710:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4712:	0505           	btst d2,d5
    4714:	0505           	btst d2,d5
    4716:	0505           	btst d2,d5
    4718:	0505           	btst d2,d5
    471a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    471c:	0505           	btst d2,d5
    471e:	0505           	btst d2,d5
    4720:	0505           	btst d2,d5
    4722:	0505           	btst d2,d5
    4724:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4726:	0505           	btst d2,d5
    4728:	0505           	btst d2,d5
    472a:	0505           	btst d2,d5
    472c:	0505           	btst d2,d5
    472e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4730:	0505           	btst d2,d5
    4732:	0505           	btst d2,d5
    4734:	0505           	btst d2,d5
    4736:	0505           	btst d2,d5
    4738:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    473a:	0505           	btst d2,d5
    473c:	0505           	btst d2,d5
    473e:	0505           	btst d2,d5
    4740:	0505           	btst d2,d5
    4742:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4744:	0505           	btst d2,d5
    4746:	0505           	btst d2,d5
    4748:	0505           	btst d2,d5
    474a:	0505           	btst d2,d5
    474c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    474e:	0505           	btst d2,d5
    4750:	0505           	btst d2,d5
    4752:	0505           	btst d2,d5
    4754:	0505           	btst d2,d5
    4756:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4758:	0505           	btst d2,d5
    475a:	0505           	btst d2,d5
    475c:	0505           	btst d2,d5
    475e:	0505           	btst d2,d5
    4760:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4762:	0505           	btst d2,d5
    4764:	0505           	btst d2,d5
    4766:	0505           	btst d2,d5
    4768:	0505           	btst d2,d5
    476a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    476c:	0505           	btst d2,d5
    476e:	0505           	btst d2,d5
    4770:	0505           	btst d2,d5
    4772:	0505           	btst d2,d5
    4774:	0505           	btst d2,d5

00004776 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    4776:	16c0           	move.b d0,(a3)+
  RTS
    4778:	4e75           	rts

0000477a <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    477a:	48f9 7fff 0000 	movem.l d0-a6,4640 <saveregs>
    4780:	4640 
  lea 0xdff000,a5
    4782:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddb51a>,a5
  move.l sp@(4),a0  //Fontlocation
    4788:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    478c:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    4790:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    4794:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    4796:	082d 0006 0002 	btst #6,2(a5)

0000479c <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    479c:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    47a2:	66f8           	bne.s 479c <st2wblit>

000047a4 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    47a4:	7019           	moveq #25,d0
	sub.l d5,d5      
    47a6:	9a85           	sub.l d5,d5

000047a8 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    47a8:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    47aa:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    47ac:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    47b0:	9dce           	suba.l a6,a6
	move.l d2, a6
    47b2:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    47b4:	ddfc 0000 467c 	adda.l #18044,a6

	LSL  	#4,d2 	    //Fetch next char
    47ba:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    47bc:	2842           	movea.l d2,a4


	move.l  #0,d4
    47be:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    47c0:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    47c2:	3814           	move.w (a4),d4
	swap	d4
    47c4:	4844           	swap d4
	lsr.l	d5, d4
    47c6:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    47c8:	8993           	or.l d4,(a3)
	clr.l	d4
    47ca:	4284           	clr.l d4
	move.w  2(a4), d4
    47cc:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    47d0:	4844           	swap d4
	lsr.l	d5, d4
    47d2:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    47d4:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    47d8:	4284           	clr.l d4
	move.w  4(a4), d4
    47da:	382c 0004      	move.w 4(a4),d4
	swap	d4
    47de:	4844           	swap d4
	lsr.l	d5, d4
    47e0:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    47e2:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    47e6:	4284           	clr.l d4
	move.w  6(a4), d4
    47e8:	382c 0006      	move.w 6(a4),d4
	swap	d4
    47ec:	4844           	swap d4
	lsr.l	d5, d4
    47ee:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    47f0:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    47f4:	4284           	clr.l d4
	move.w  8(a4), d4
    47f6:	382c 0008      	move.w 8(a4),d4
	swap	d4
    47fa:	4844           	swap d4
	lsr.l	d5, d4
    47fc:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    47fe:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    4802:	4284           	clr.l d4
	move.w  10(a4), d4
    4804:	382c 000a      	move.w 10(a4),d4
	swap	d4
    4808:	4844           	swap d4
	lsr.l	d5, d4
    480a:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    480c:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    4810:	4284           	clr.l d4
	move.w  12(a4), d4
    4812:	382c 000c      	move.w 12(a4),d4
	swap	d4
    4816:	4844           	swap d4
	lsr.l	d5, d4
    4818:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    481a:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    481e:	4284           	clr.l d4
	move.w  14(a4), d4
    4820:	382c 000e      	move.w 14(a4),d4
	swap	d4
    4824:	4844           	swap d4
	lsr.l	d5, d4
    4826:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    4828:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    482c:	4284           	clr.l d4

	add.b   (a6), d5
    482e:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    4830:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    4834:	6500 0006      	bcs.w 483c <noadditionalchar>
	addq.w  #1, a3
    4838:	524b           	addq.w #1,a3
	sub.w   #8,d5
    483a:	5145           	subq.w #8,d5

0000483c <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    483c:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    483e:	51c8 ff68      	dbf d0,47a8 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    4842:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    4846:	51cb ff5c      	dbf d3,47a4 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    484a:	4cfa 7fff fdf2 	movem.l 4640 <saveregs>(pc),d0-a6

	RTS
    4850:	4e75           	rts
