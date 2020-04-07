
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
      10:	23ce 0000 77f8 	move.l a6,77f8 <SysBase>
	hw = (struct Custom*)0xdff000;
      16:	23fc 00df f000 	move.l #14675968,77e8 <hw>
      1c:	0000 77e8 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      20:	43f9 0000 520d 	lea 520d <incbin_swfont_end+0x4d7>,a1
      26:	7000           	moveq #0,d0
      28:	4eae fdd8      	jsr -552(a6)
      2c:	23c0 0000 77ec 	move.l d0,77ec <GfxBase>
	if (!GfxBase)
      32:	6700 072a      	beq.w 75e <main+0x758>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      36:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
      3c:	43f9 0000 521e 	lea 521e <incbin_swfont_end+0x4e8>,a1
      42:	7000           	moveq #0,d0
      44:	4eae fdd8      	jsr -552(a6)
      48:	23c0 0000 77f4 	move.l d0,77f4 <DOSBase>
	if (!DOSBase)
      4e:	6700 0702      	beq.w 752 <main+0x74c>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      52:	4879 0000 522a 	pea 522a <incbin_swfont_end+0x4f4>
      58:	4eb9 0000 0942 	jsr 942 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      5e:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
      64:	4eae ffc4      	jsr -60(a6)
      68:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
      6e:	2200           	move.l d0,d1
      70:	243c 0000 5246 	move.l #21062,d2
      76:	760f           	moveq #15,d3
      78:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      7c:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
      82:	7232           	moveq #50,d1
      84:	4eae ff3a      	jsr -198(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      88:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
      8e:	4eae ffc4      	jsr -60(a6)
      92:	2079 0000 77e8 	movea.l 77e8 <hw>,a0
      98:	2628 0080      	move.l 128(a0),d3
      9c:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
      a2:	2200           	move.l d0,d1
      a4:	243c 0000 5256 	move.l #21078,d2
      aa:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      ae:	47f9 0000 0c8e 	lea c8e <ClBuild>,a3
      b4:	4e93           	jsr (a3)
      b6:	2440           	movea.l d0,a2
      b8:	23c0 0000 77da 	move.l d0,77da <Copperlist1>
  DrawCopper = Copperlist1;
      be:	23c0 0000 77d2 	move.l d0,77d2 <DrawCopper>
  Copperlist2 = ClBuild();
      c4:	4e93           	jsr (a3)
      c6:	23c0 0000 77cc 	move.l d0,77cc <Copperlist2>
  ViewCopper = Copperlist2;
      cc:	23c0 0000 77c0 	move.l d0,77c0 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      d2:	588f           	addq.l #4,sp
      d4:	2012           	move.l (a2),d0
      d6:	b0b9 0000 7434 	cmp.l 7434 <ClsSprites>,d0
      dc:	6600 0608      	bne.w 6e6 <main+0x6e0>
      e0:	202a 0004      	move.l 4(a2),d0
      e4:	b0b9 0000 7438 	cmp.l 7438 <ClsSprites+0x4>,d0
      ea:	6600 05fa      	bne.w 6e6 <main+0x6e0>
      ee:	202a 0008      	move.l 8(a2),d0
      f2:	b0b9 0000 743c 	cmp.l 743c <ClsSprites+0x8>,d0
      f8:	6600 05ec      	bne.w 6e6 <main+0x6e0>
      fc:	202a 000c      	move.l 12(a2),d0
     100:	b0b9 0000 7440 	cmp.l 7440 <ClsSprites+0xc>,d0
     106:	6600 05de      	bne.w 6e6 <main+0x6e0>
     10a:	202a 0010      	move.l 16(a2),d0
     10e:	b0b9 0000 7444 	cmp.l 7444 <ClsSprites+0x10>,d0
     114:	6600 05d0      	bne.w 6e6 <main+0x6e0>
     118:	202a 0014      	move.l 20(a2),d0
     11c:	b0b9 0000 7448 	cmp.l 7448 <ClsSprites+0x14>,d0
     122:	6600 05c2      	bne.w 6e6 <main+0x6e0>
     126:	202a 0018      	move.l 24(a2),d0
     12a:	b0b9 0000 744c 	cmp.l 744c <ClsSprites+0x18>,d0
     130:	6600 05b4      	bne.w 6e6 <main+0x6e0>
     134:	202a 001c      	move.l 28(a2),d0
     138:	b0b9 0000 7450 	cmp.l 7450 <ClsSprites+0x1c>,d0
     13e:	6600 05a6      	bne.w 6e6 <main+0x6e0>
     142:	202a 0020      	move.l 32(a2),d0
     146:	b0b9 0000 7454 	cmp.l 7454 <ClsSprites+0x20>,d0
     14c:	6600 0598      	bne.w 6e6 <main+0x6e0>
     150:	202a 0024      	move.l 36(a2),d0
     154:	b0b9 0000 7458 	cmp.l 7458 <ClsSprites+0x24>,d0
     15a:	6600 058a      	bne.w 6e6 <main+0x6e0>
     15e:	202a 0028      	move.l 40(a2),d0
     162:	b0b9 0000 745c 	cmp.l 745c <ClsSprites+0x28>,d0
     168:	6600 057c      	bne.w 6e6 <main+0x6e0>
     16c:	202a 002c      	move.l 44(a2),d0
     170:	b0b9 0000 7460 	cmp.l 7460 <ClsSprites+0x2c>,d0
     176:	6600 056e      	bne.w 6e6 <main+0x6e0>
     17a:	202a 0030      	move.l 48(a2),d0
     17e:	b0b9 0000 7464 	cmp.l 7464 <ClsSprites+0x30>,d0
     184:	6600 0560      	bne.w 6e6 <main+0x6e0>
     188:	202a 0034      	move.l 52(a2),d0
     18c:	b0b9 0000 7468 	cmp.l 7468 <ClsSprites+0x34>,d0
     192:	6600 0552      	bne.w 6e6 <main+0x6e0>
     196:	202a 0038      	move.l 56(a2),d0
     19a:	b0b9 0000 746c 	cmp.l 746c <ClsSprites+0x38>,d0
     1a0:	6600 0544      	bne.w 6e6 <main+0x6e0>
     1a4:	246a 003c      	movea.l 60(a2),a2
     1a8:	b5f9 0000 7470 	cmpa.l 7470 <ClsSprites+0x3c>,a2
     1ae:	6600 0536      	bne.w 6e6 <main+0x6e0>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1b2:	2079 0000 77da 	movea.l 77da <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1b8:	2039 0000 7404 	move.l 7404 <ClScreen>,d0
     1be:	b0a8 0040      	cmp.l 64(a0),d0
     1c2:	6600 0544      	bne.w 708 <main+0x702>
     1c6:	2039 0000 7408 	move.l 7408 <ClScreen+0x4>,d0
     1cc:	b0a8 0044      	cmp.l 68(a0),d0
     1d0:	6600 0536      	bne.w 708 <main+0x702>
     1d4:	2039 0000 740c 	move.l 740c <ClScreen+0x8>,d0
     1da:	b0a8 0048      	cmp.l 72(a0),d0
     1de:	6600 0528      	bne.w 708 <main+0x702>
     1e2:	2028 004c      	move.l 76(a0),d0
     1e6:	b0b9 0000 7410 	cmp.l 7410 <ClScreen+0xc>,d0
     1ec:	6600 051a      	bne.w 708 <main+0x702>
     1f0:	2028 0050      	move.l 80(a0),d0
     1f4:	b0b9 0000 7414 	cmp.l 7414 <ClScreen+0x10>,d0
     1fa:	6600 050c      	bne.w 708 <main+0x702>
     1fe:	2028 0054      	move.l 84(a0),d0
     202:	b0b9 0000 7418 	cmp.l 7418 <ClScreen+0x14>,d0
     208:	6600 04fe      	bne.w 708 <main+0x702>
     20c:	2028 0058      	move.l 88(a0),d0
     210:	b0b9 0000 741c 	cmp.l 741c <ClScreen+0x18>,d0
     216:	6600 04f0      	bne.w 708 <main+0x702>
     21a:	2028 005c      	move.l 92(a0),d0
     21e:	b0b9 0000 7420 	cmp.l 7420 <ClScreen+0x1c>,d0
     224:	6600 04e2      	bne.w 708 <main+0x702>
     228:	2028 0060      	move.l 96(a0),d0
     22c:	b0b9 0000 7424 	cmp.l 7424 <ClScreen+0x20>,d0
     232:	6600 04d4      	bne.w 708 <main+0x702>
     236:	2028 0064      	move.l 100(a0),d0
     23a:	b0b9 0000 7428 	cmp.l 7428 <ClScreen+0x24>,d0
     240:	6600 04c6      	bne.w 708 <main+0x702>
     244:	2028 0068      	move.l 104(a0),d0
     248:	b0b9 0000 742c 	cmp.l 742c <ClScreen+0x28>,d0
     24e:	6600 04b8      	bne.w 708 <main+0x702>
     252:	2068 006c      	movea.l 108(a0),a0
     256:	b1f9 0000 7430 	cmpa.l 7430 <ClScreen+0x2c>,a0
     25c:	6600 04aa      	bne.w 708 <main+0x702>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     260:	23fc 0004 0000 	move.l #262144,77e0 <DrawBuffer>
     266:	0000 77e0 
  ViewBuffer = (ULONG *)0x50000;
     26a:	23fc 0005 0000 	move.l #327680,77d6 <ViewBuffer>
     270:	0000 77d6 
  
  SetBplPointers();
     274:	4eb9 0000 17f8 	jsr 17f8 <SetBplPointers>
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     27a:	0cb9 0005 0000 	cmpi.l #327680,77e0 <DrawBuffer>
     280:	0000 77e0 
     284:	6700 0596      	beq.w 81c <main+0x816>
    Write( Output(), 
     288:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     28e:	4eae ffc4      	jsr -60(a6)
     292:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     298:	2200           	move.l d0,d1
     29a:	243c 0000 5259 	move.l #21081,d2
     2a0:	763b           	moveq #59,d3
     2a2:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     2a6:	2079 0000 77da 	movea.l 77da <Copperlist1>,a0
     2ac:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2b2:	0070 
     2b4:	6724           	beq.s 2da <main+0x2d4>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2b6:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     2bc:	4eae ffc4      	jsr -60(a6)
     2c0:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     2c6:	2200           	move.l d0,d1
     2c8:	243c 0000 4f57 	move.l #20311,d2
     2ce:	763c           	moveq #60,d3
     2d0:	4eae ffd0      	jsr -48(a6)
     2d4:	2079 0000 77da 	movea.l 77da <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2da:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2e0:	0074 
     2e2:	6724           	beq.s 308 <main+0x302>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2e4:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     2ea:	4eae ffc4      	jsr -60(a6)
     2ee:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     2f4:	2200           	move.l d0,d1
     2f6:	243c 0000 4f94 	move.l #20372,d2
     2fc:	763c           	moveq #60,d3
     2fe:	4eae ffd0      	jsr -48(a6)
     302:	2079 0000 77da 	movea.l 77da <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     308:	2028 0078      	move.l 120(a0),d0
     30c:	b0b9 0000 73fc 	cmp.l 73fc <ClColor>,d0
     312:	6600 0538      	bne.w 84c <main+0x846>
     316:	2028 007c      	move.l 124(a0),d0
     31a:	b0b9 0000 7400 	cmp.l 7400 <ClColor+0x4>,d0
     320:	6600 052a      	bne.w 84c <main+0x846>
  if( instructions[pos] == value ) 
     324:	70fe           	moveq #-2,d0
     326:	b0a8 0080      	cmp.l 128(a0),d0
     32a:	671e           	beq.s 34a <main+0x344>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     32c:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     332:	4eae ffc4      	jsr -60(a6)
     336:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     33c:	2200           	move.l d0,d1
     33e:	243c 0000 506d 	move.l #20589,d2
     344:	7622           	moveq #34,d3
     346:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     34a:	4eb9 0000 15f0 	jsr 15f0 <SwapCl>
  
  if( DrawCopper != Copperlist2)
     350:	2039 0000 77d2 	move.l 77d2 <DrawCopper>,d0
     356:	b0b9 0000 77cc 	cmp.l 77cc <Copperlist2>,d0
     35c:	671e           	beq.s 37c <main+0x376>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     35e:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     364:	4eae ffc4      	jsr -60(a6)
     368:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     36e:	2200           	move.l d0,d1
     370:	243c 0000 5295 	move.l #21141,d2
     376:	7615           	moveq #21,d3
     378:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild( );
     37c:	4e93           	jsr (a3)
     37e:	23c0 0000 77da 	move.l d0,77da <Copperlist1>
  Copperlist2 = ClBuild( );
     384:	4e93           	jsr (a3)
     386:	23c0 0000 77cc 	move.l d0,77cc <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
     38c:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
     392:	203c 0000 c800 	move.l #51200,d0
     398:	7202           	moveq #2,d1
     39a:	4eae ff3a      	jsr -198(a6)
     39e:	23c0 0000 77c8 	move.l d0,77c8 <Bitplane1>
  if(Bitplane1 == 0) {
     3a4:	6700 0416      	beq.w 7bc <main+0x7b6>
  ViewBuffer = Bitplane1;
     3a8:	23c0 0000 77d6 	move.l d0,77d6 <ViewBuffer>
  ViewCopper = Copperlist1;
     3ae:	23f9 0000 77da 	move.l 77da <Copperlist1>,77c0 <ViewCopper>
     3b4:	0000 77c0 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     3b8:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
     3be:	203c 0000 c800 	move.l #51200,d0
     3c4:	7202           	moveq #2,d1
     3c6:	4eae ff3a      	jsr -198(a6)
     3ca:	23c0 0000 77c4 	move.l d0,77c4 <Bitplane2>
  if(Bitplane2 == 0) {
     3d0:	6700 03b6      	beq.w 788 <main+0x782>
  DrawBuffer = Bitplane2;
     3d4:	23c0 0000 77e0 	move.l d0,77e0 <DrawBuffer>
  DrawCopper = Copperlist2;
     3da:	23f9 0000 77cc 	move.l 77cc <Copperlist2>,77d2 <DrawCopper>
     3e0:	0000 77d2 
    Write( Output(), 
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
     3e4:	2039 0000 77d6 	move.l 77d6 <ViewBuffer>,d0
     3ea:	b0b9 0000 77c8 	cmp.l 77c8 <Bitplane1>,d0
     3f0:	671e           	beq.s 410 <main+0x40a>
    Write( Output(), 
     3f2:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     3f8:	4eae ffc4      	jsr -60(a6)
     3fc:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     402:	2200           	move.l d0,d1
     404:	243c 0000 52ab 	move.l #21163,d2
     40a:	7638           	moveq #56,d3
     40c:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
     410:	2039 0000 77c0 	move.l 77c0 <ViewCopper>,d0
     416:	b0b9 0000 77da 	cmp.l 77da <Copperlist1>,d0
     41c:	671e           	beq.s 43c <main+0x436>
    Write( Output(), 
     41e:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     424:	4eae ffc4      	jsr -60(a6)
     428:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     42e:	2200           	move.l d0,d1
     430:	243c 0000 52e4 	move.l #21220,d2
     436:	763a           	moveq #58,d3
     438:	4eae ffd0      	jsr -48(a6)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  RunFrame();
     43c:	45f9 0000 1824 	lea 1824 <RunFrame>,a2
     442:	4e92           	jsr (a2)
  UWORD *copword = ViewCopper;
     444:	2079 0000 77c0 	movea.l 77c0 <ViewCopper>,a0
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     44a:	7000           	moveq #0,d0
     44c:	3028 0072      	move.w 114(a0),d0
     450:	4840           	swap d0
     452:	4240           	clr.w d0
     454:	7200           	moveq #0,d1
     456:	3228 0076      	move.w 118(a0),d1
     45a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     45c:	b0b9 0000 77c4 	cmp.l 77c4 <Bitplane2>,d0
     462:	671e           	beq.s 482 <main+0x47c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     464:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     46a:	4eae ffc4      	jsr -60(a6)
     46e:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     474:	2200           	move.l d0,d1
     476:	243c 0000 531f 	move.l #21279,d2
     47c:	7648           	moveq #72,d3
     47e:	4eae ffd0      	jsr -48(a6)
                                                   " after first frame.\n", 72);
  RunFrame();
     482:	4e92           	jsr (a2)

  copword = (UWORD *) ViewCopper;
     484:	2079 0000 77c0 	movea.l 77c0 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     48a:	7000           	moveq #0,d0
     48c:	3028 0072      	move.w 114(a0),d0
     490:	4840           	swap d0
     492:	4240           	clr.w d0
     494:	7200           	moveq #0,d1
     496:	3228 0076      	move.w 118(a0),d1
     49a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     49c:	b0b9 0000 77c8 	cmp.l 77c8 <Bitplane1>,d0
     4a2:	671e           	beq.s 4c2 <main+0x4bc>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     4a4:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     4aa:	4eae ffc4      	jsr -60(a6)
     4ae:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     4b4:	2200           	move.l d0,d1
     4b6:	243c 0000 5368 	move.l #21352,d2
     4bc:	7649           	moveq #73,d3
     4be:	4eae ffd0      	jsr -48(a6)
                                                  " after second frame.\n", 73);
  
  RunFrame();
     4c2:	4e92           	jsr (a2)

  copword = (UWORD *) ViewCopper;
     4c4:	2079 0000 77c0 	movea.l 77c0 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     4ca:	7000           	moveq #0,d0
     4cc:	3028 0072      	move.w 114(a0),d0
     4d0:	4840           	swap d0
     4d2:	4240           	clr.w d0
     4d4:	7200           	moveq #0,d1
     4d6:	3228 0076      	move.w 118(a0),d1
     4da:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4dc:	b0b9 0000 77c4 	cmp.l 77c4 <Bitplane2>,d0
     4e2:	671e           	beq.s 502 <main+0x4fc>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4e4:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     4ea:	4eae ffc4      	jsr -60(a6)
     4ee:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     4f4:	2200           	move.l d0,d1
     4f6:	243c 0000 53b2 	move.l #21426,d2
     4fc:	7648           	moveq #72,d3
     4fe:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     502:	2f3c 0000 c800 	move.l #51200,-(sp)
     508:	4878 0084      	pea 84 <main+0x7e>
     50c:	4eb9 0000 1874 	jsr 1874 <FreeDisplay>
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    ZoomTest();
     512:	4eb9 0000 192c 	jsr 192c <ZoomTest>

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
     518:	247c 00f0 ff60 	movea.l #15794016,a2
     51e:	508f           	addq.l #8,sp
     520:	4a92           	tst.l (a2)
     522:	6718           	beq.s 53c <main+0x536>
     524:	4878 0001      	pea 1 <_start+0x1>
     528:	47f9 0000 08a0 	lea 8a0 <warpmode.part.0>,a3
     52e:	4e93           	jsr (a3)
     530:	588f           	addq.l #4,sp
     532:	4a92           	tst.l (a2)
     534:	6706           	beq.s 53c <main+0x536>
     536:	42a7           	clr.l -(sp)
     538:	4e93           	jsr (a3)
     53a:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
     53c:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
     542:	23ee 0022 0000 	move.l 34(a6),77ae <ActiView>
     548:	77ae 
	OwnBlitter();
     54a:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     54e:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
     554:	4eae ff1c      	jsr -228(a6)
	Disable();
     558:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
     55e:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     562:	2679 0000 77e8 	movea.l 77e8 <hw>,a3
     568:	302b 0010      	move.w 16(a3),d0
     56c:	33c0 0000 77b2 	move.w d0,77b2 <SystemADKCON>
	SystemInts=hw->intenar;
     572:	302b 001c      	move.w 28(a3),d0
     576:	33c0 0000 77b6 	move.w d0,77b6 <SystemInts>
	SystemDMA=hw->dmaconr;
     57c:	302b 0002      	move.w 2(a3),d0
     580:	33c0 0000 77b4 	move.w d0,77b4 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     586:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     58c:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     592:	45f9 0000 18e6 	lea 18e6 <WaitVbl>,a2
     598:	4e92           	jsr (a2)
	WaitVbl();
     59a:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     59c:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     5a2:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
     5a8:	93c9           	suba.l a1,a1
     5aa:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     5ae:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
     5b4:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     5b8:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
     5be:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     5c2:	4e92           	jsr (a2)
	WaitVbl();
     5c4:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     5c6:	3f7c 4e7a 001a 	move.w #20090,26(sp)
     5cc:	3f7c 0801 001c 	move.w #2049,28(sp)
     5d2:	3f7c 4e73 001e 	move.w #20083,30(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     5d8:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
     5de:	082e 0000 0129 	btst #0,297(a6)
     5e4:	6700 028e      	beq.w 874 <main+0x86e>
		vbr = (APTR)Supervisor((void*)getvbr);
     5e8:	7e1a           	moveq #26,d7
     5ea:	de8f           	add.l sp,d7
     5ec:	cf8d           	exg d7,a5
     5ee:	4eae ffe2      	jsr -30(a6)
     5f2:	cf8d           	exg d7,a5

	VBR=GetVBR();
     5f4:	23c0 0000 77b8 	move.l d0,77b8 <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     5fa:	2079 0000 77b8 	movea.l 77b8 <VBR.lto_priv.3>,a0
     600:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     604:	23cb 0000 77bc 	move.l a3,77bc <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
     60a:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
     60c:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     60e:	2079 0000 77e8 	movea.l 77e8 <hw>,a0
     614:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     618:	3028 0002      	move.w 2(a0),d0
     61c:	0800 000e      	btst #14,d0
     620:	66f6           	bne.s 618 <main+0x612>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
     622:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     628:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
     62e:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     634:	2279 0000 77b8 	movea.l 77b8 <VBR.lto_priv.3>,a1
     63a:	234b 006c      	move.l a3,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     63e:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
     644:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     64a:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     650:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     656:	3039 0000 77b6 	move.w 77b6 <SystemInts>,d0
     65c:	0040 8000      	ori.w #-32768,d0
     660:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     664:	3039 0000 77b4 	move.w 77b4 <SystemDMA>,d0
     66a:	0040 8000      	ori.w #-32768,d0
     66e:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     672:	3039 0000 77b2 	move.w 77b2 <SystemADKCON>,d0
     678:	0040 8000      	ori.w #-32768,d0
     67c:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     680:	2279 0000 77ae 	movea.l 77ae <ActiView>,a1
     686:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     68a:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
     690:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     694:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
     69a:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     69e:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
     6a4:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     6a8:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
     6ae:	4eae fe32      	jsr -462(a6)
	Enable();
     6b2:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
     6b8:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     6bc:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
     6c2:	2279 0000 77f4 	movea.l 77f4 <DOSBase>,a1
     6c8:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     6cc:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
     6d2:	2279 0000 77ec 	movea.l 77ec <GfxBase>,a1
     6d8:	4eae fe62      	jsr -414(a6)
}
     6dc:	7000           	moveq #0,d0
     6de:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
     6e2:	508f           	addq.l #8,sp
     6e4:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     6e6:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     6ec:	4eae ffc4      	jsr -60(a6)
     6f0:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     6f6:	2200           	move.l d0,d1
     6f8:	243c 0000 4eea 	move.l #20202,d2
     6fe:	762c           	moveq #44,d3
     700:	4eae ffd0      	jsr -48(a6)
     704:	6000 faac      	bra.w 1b2 <main+0x1ac>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     708:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     70e:	4eae ffc4      	jsr -60(a6)
     712:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     718:	2200           	move.l d0,d1
     71a:	243c 0000 4f20 	move.l #20256,d2
     720:	7636           	moveq #54,d3
     722:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
     726:	23fc 0004 0000 	move.l #262144,77e0 <DrawBuffer>
     72c:	0000 77e0 
  ViewBuffer = (ULONG *)0x50000;
     730:	23fc 0005 0000 	move.l #327680,77d6 <ViewBuffer>
     736:	0000 77d6 
  SetBplPointers();
     73a:	4eb9 0000 17f8 	jsr 17f8 <SetBplPointers>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     740:	0cb9 0005 0000 	cmpi.l #327680,77e0 <DrawBuffer>
     746:	0000 77e0 
     74a:	6600 fb3c      	bne.w 288 <main+0x282>
     74e:	6000 00cc      	bra.w 81c <main+0x816>
		Exit(0);
     752:	9dce           	suba.l a6,a6
     754:	7200           	moveq #0,d1
     756:	4eae ff70      	jsr -144(a6)
     75a:	6000 f8f6      	bra.w 52 <main+0x4c>
		Exit(0);
     75e:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     764:	7200           	moveq #0,d1
     766:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     76a:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
     770:	43f9 0000 521e 	lea 521e <incbin_swfont_end+0x4e8>,a1
     776:	7000           	moveq #0,d0
     778:	4eae fdd8      	jsr -552(a6)
     77c:	23c0 0000 77f4 	move.l d0,77f4 <DOSBase>
	if (!DOSBase)
     782:	6600 f8ce      	bne.w 52 <main+0x4c>
     786:	60ca           	bra.s 752 <main+0x74c>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     788:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     78e:	4eae ffc4      	jsr -60(a6)
     792:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     798:	2200           	move.l d0,d1
     79a:	243c 0000 4e22 	move.l #20002,d2
     7a0:	7626           	moveq #38,d3
     7a2:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7a6:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     7ac:	7201           	moveq #1,d1
     7ae:	4eae ff70      	jsr -144(a6)
     7b2:	2039 0000 77c4 	move.l 77c4 <Bitplane2>,d0
     7b8:	6000 fc1a      	bra.w 3d4 <main+0x3ce>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     7bc:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     7c2:	4eae ffc4      	jsr -60(a6)
     7c6:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     7cc:	2200           	move.l d0,d1
     7ce:	243c 0000 4dfb 	move.l #19963,d2
     7d4:	7626           	moveq #38,d3
     7d6:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7da:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     7e0:	7201           	moveq #1,d1
     7e2:	4eae ff70      	jsr -144(a6)
     7e6:	2039 0000 77c8 	move.l 77c8 <Bitplane1>,d0
  ViewBuffer = Bitplane1;
     7ec:	23c0 0000 77d6 	move.l d0,77d6 <ViewBuffer>
  ViewCopper = Copperlist1;
     7f2:	23f9 0000 77da 	move.l 77da <Copperlist1>,77c0 <ViewCopper>
     7f8:	0000 77c0 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     7fc:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
     802:	203c 0000 c800 	move.l #51200,d0
     808:	7202           	moveq #2,d1
     80a:	4eae ff3a      	jsr -198(a6)
     80e:	23c0 0000 77c4 	move.l d0,77c4 <Bitplane2>
  if(Bitplane2 == 0) {
     814:	6600 fbbe      	bne.w 3d4 <main+0x3ce>
     818:	6000 ff6e      	bra.w 788 <main+0x782>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     81c:	0cb9 0004 0000 	cmpi.l #262144,77d6 <ViewBuffer>
     822:	0000 77d6 
     826:	6700 fa7e      	beq.w 2a6 <main+0x2a0>
    Write( Output(), 
     82a:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     830:	4eae ffc4      	jsr -60(a6)
     834:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     83a:	2200           	move.l d0,d1
     83c:	243c 0000 5259 	move.l #21081,d2
     842:	763b           	moveq #59,d3
     844:	4eae ffd0      	jsr -48(a6)
     848:	6000 fa5c      	bra.w 2a6 <main+0x2a0>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     84c:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     852:	4eae ffc4      	jsr -60(a6)
     856:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     85c:	2200           	move.l d0,d1
     85e:	243c 0000 504b 	move.l #20555,d2
     864:	7621           	moveq #33,d3
     866:	4eae ffd0      	jsr -48(a6)
     86a:	2079 0000 77da 	movea.l 77da <Copperlist1>,a0
     870:	6000 fab2      	bra.w 324 <main+0x31e>
	APTR vbr = 0;
     874:	7000           	moveq #0,d0
	VBR=GetVBR();
     876:	23c0 0000 77b8 	move.l d0,77b8 <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     87c:	2079 0000 77b8 	movea.l 77b8 <VBR.lto_priv.3>,a0
     882:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     886:	23cb 0000 77bc 	move.l a3,77bc <SystemIrq>
	WaitVbl();
     88c:	4e92           	jsr (a2)
	WaitVbl();
     88e:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     890:	2079 0000 77e8 	movea.l 77e8 <hw>,a0
     896:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     89a:	6000 fd7c      	bra.w 618 <main+0x612>
     89e:	4e71           	nop

000008a0 <warpmode.part.0>:
void warpmode(int on) 
     8a0:	598f           	subq.l #4,sp
     8a2:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     8a4:	4aaf 000c      	tst.l 12(sp)
     8a8:	674c           	beq.s 8f6 <warpmode.part.0+0x56>
     8aa:	4878 0001      	pea 1 <_start+0x1>
     8ae:	740b           	moveq #11,d2
     8b0:	d48f           	add.l sp,d2
     8b2:	2f02           	move.l d2,-(sp)
     8b4:	42a7           	clr.l -(sp)
     8b6:	4879 0000 4d6a 	pea 4d6a <incbin_swfont_end+0x34>
     8bc:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdbbad>
     8c0:	4878 0052      	pea 52 <main+0x4c>
     8c4:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeebb0e>
     8ca:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     8ce:	203c 0000 4d50 	move.l #19792,d0
     8d4:	4878 0001      	pea 1 <_start+0x1>
     8d8:	2f02           	move.l d2,-(sp)
     8da:	42a7           	clr.l -(sp)
     8dc:	2f00           	move.l d0,-(sp)
     8de:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdbbad>
     8e2:	4878 0052      	pea 52 <main+0x4c>
     8e6:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeebb0e>
	}
}
     8ec:	4fef 0018      	lea 24(sp),sp
     8f0:	241f           	move.l (sp)+,d2
     8f2:	588f           	addq.l #4,sp
     8f4:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     8f6:	4878 0001      	pea 1 <_start+0x1>
     8fa:	740b           	moveq #11,d2
     8fc:	d48f           	add.l sp,d2
     8fe:	2f02           	move.l d2,-(sp)
     900:	42a7           	clr.l -(sp)
     902:	4879 0000 4d74 	pea 4d74 <incbin_swfont_end+0x3e>
     908:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdbbad>
     90c:	4878 0052      	pea 52 <main+0x4c>
     910:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeebb0e>
     916:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     91a:	203c 0000 4d37 	move.l #19767,d0
     920:	4878 0001      	pea 1 <_start+0x1>
     924:	2f02           	move.l d2,-(sp)
     926:	42a7           	clr.l -(sp)
     928:	2f00           	move.l d0,-(sp)
     92a:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdbbad>
     92e:	4878 0052      	pea 52 <main+0x4c>
     932:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeebb0e>
}
     938:	4fef 0018      	lea 24(sp),sp
     93c:	241f           	move.l (sp)+,d2
     93e:	588f           	addq.l #4,sp
     940:	4e75           	rts

00000942 <KPrintF>:
{
     942:	4fef ff80      	lea -128(sp),sp
     946:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
     94a:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeebb0e>
     950:	6734           	beq.s 986 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     952:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
     958:	206f 0090      	movea.l 144(sp),a0
     95c:	43ef 0094      	lea 148(sp),a1
     960:	45f9 0000 4570 	lea 4570 <PutChar>,a2
     966:	47ef 000c      	lea 12(sp),a3
     96a:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     96e:	2f0b           	move.l a3,-(sp)
     970:	4878 0056      	pea 56 <main+0x50>
     974:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeebb0e>
     97a:	508f           	addq.l #8,sp
}
     97c:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     980:	4fef 0080      	lea 128(sp),sp
     984:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     986:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
     98c:	206f 0090      	movea.l 144(sp),a0
     990:	43ef 0094      	lea 148(sp),a1
     994:	45f9 0000 4562 	lea 4562 <KPutCharX>,a2
     99a:	97cb           	suba.l a3,a3
     99c:	4eae fdf6      	jsr -522(a6)
}
     9a0:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     9a4:	4fef 0080      	lea 128(sp),sp
     9a8:	4e75           	rts

000009aa <TestRow>:
  FreeMem( source, (ZMLINESIZE+4)*272);
  FreeMem( destination, (ZMLINESIZE+4)*272);
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
     9aa:	4fef ff94      	lea -108(sp),sp
     9ae:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
     9b2:	2f6f 00a4 002c 	move.l 164(sp),44(sp)
     9b8:	3c2f 002e      	move.w 46(sp),d6
  
  char str[ 100] = { 0 };
     9bc:	7a34           	moveq #52,d5
     9be:	da8f           	add.l sp,d5
     9c0:	4878 0064      	pea 64 <main+0x5e>
     9c4:	42a7           	clr.l -(sp)
     9c6:	2f05           	move.l d5,-(sp)
     9c8:	4eba 39ba      	jsr 4384 <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
     9cc:	3f6f 00b6 003e 	move.w 182(sp),62(sp)
     9d2:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
     9d6:	2a6f 00a0      	movea.l 160(sp),a5
  testpattern += 0;
     9da:	286f 009c      	movea.l 156(sp),a4

  for(int i=0;i<21;i++) {
     9de:	7800           	moveq #0,d4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     9e0:	2e3c 0000 4d7f 	move.l #19839,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
     9e6:	301c           	move.w (a4)+,d0
     9e8:	bd40           	eor.w d6,d0
     9ea:	b05d           	cmp.w (a5)+,d0
     9ec:	6736           	beq.s a24 <TestRow+0x7a>
      data[0] = i;
     9ee:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     9f2:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
     9f8:	2047           	movea.l d7,a0
     9fa:	43ef 0030      	lea 48(sp),a1
     9fe:	45f9 0000 4570 	lea 4570 <PutChar>,a2
     a04:	2645           	movea.l d5,a3
     a06:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
     a0a:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     a10:	4eae ffc4      	jsr -60(a6)
     a14:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     a1a:	2200           	move.l d0,d1
     a1c:	2405           	move.l d5,d2
     a1e:	7664           	moveq #100,d3
     a20:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
     a24:	5284           	addq.l #1,d4
     a26:	7015           	moveq #21,d0
     a28:	b084           	cmp.l d4,d0
     a2a:	66ba           	bne.s 9e6 <TestRow+0x3c>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
     a2c:	206f 00a0      	movea.l 160(sp),a0
     a30:	3028 002a      	move.w 42(a0),d0
     a34:	322f 002e      	move.w 46(sp),d1
     a38:	b340           	eor.w d1,d0
     a3a:	206f 009c      	movea.l 156(sp),a0
     a3e:	3228 002a      	move.w 42(a0),d1
     a42:	b340           	eor.w d1,d0
     a44:	0240 ff00      	andi.w #-256,d0
     a48:	660a           	bne.s a54 <TestRow+0xaa>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
     a4a:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     a4e:	4fef 006c      	lea 108(sp),sp
     a52:	4e75           	rts
    data[0] = 21;
     a54:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
     a5a:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
     a60:	41f9 0000 4d7f 	lea 4d7f <incbin_swfont_end+0x49>,a0
     a66:	43ef 0030      	lea 48(sp),a1
     a6a:	45f9 0000 4570 	lea 4570 <PutChar>,a2
     a70:	47ef 0034      	lea 52(sp),a3
     a74:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
     a78:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     a7e:	4eae ffc4      	jsr -60(a6)
     a82:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     a88:	2200           	move.l d0,d1
     a8a:	240b           	move.l a3,d2
     a8c:	7664           	moveq #100,d3
     a8e:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
     a92:	206f 00a0      	movea.l 160(sp),a0
     a96:	7000           	moveq #0,d0
     a98:	3028 002a      	move.w 42(a0),d0
     a9c:	2f00           	move.l d0,-(sp)
     a9e:	206f 00a0      	movea.l 160(sp),a0
     aa2:	3028 002a      	move.w 42(a0),d0
     aa6:	2f00           	move.l d0,-(sp)
     aa8:	4879 0000 4daf 	pea 4daf <incbin_swfont_end+0x79>
     aae:	4eba fe92      	jsr 942 <KPrintF>(pc)
     ab2:	4fef 000c      	lea 12(sp),sp
}
     ab6:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     aba:	4fef 006c      	lea 108(sp),sp
     abe:	4e75           	rts

00000ac0 <Vblankcounter>:
  Counter4Frames++;
     ac0:	52b9 0000 77f0 	addq.l #1,77f0 <Counter4Frames>
}
     ac6:	4e75           	rts

00000ac8 <TestCopperlistPos>:
  if( instructions[pos] == value ) 
     ac8:	202f 0008      	move.l 8(sp),d0
     acc:	d080           	add.l d0,d0
     ace:	d080           	add.l d0,d0
     ad0:	206f 0004      	movea.l 4(sp),a0
     ad4:	2030 0800      	move.l (0,a0,d0.l),d0
     ad8:	b0af 000c      	cmp.l 12(sp),d0
     adc:	57c0           	seq d0
     ade:	4880           	ext.w d0
     ae0:	48c0           	ext.l d0
}
     ae2:	4480           	neg.l d0
     ae4:	4e75           	rts

00000ae6 <TestCopperlistBatch>:
                                                                  long length) {
     ae6:	48e7 2030      	movem.l d2/a2-a3,-(sp)
     aea:	246f 0010      	movea.l 16(sp),a2
     aee:	206f 0014      	movea.l 20(sp),a0
     af2:	226f 0018      	movea.l 24(sp),a1
     af6:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
     afa:	2008           	move.l a0,d0
     afc:	d088           	add.l a0,d0
     afe:	d080           	add.l d0,d0
     b00:	2411           	move.l (a1),d2
     b02:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
     b06:	6600 017e      	bne.w c86 <TestCopperlistBatch+0x1a0>
     b0a:	2008           	move.l a0,d0
     b0c:	5280           	addq.l #1,d0
     b0e:	d080           	add.l d0,d0
     b10:	d080           	add.l d0,d0
     b12:	2032 0800      	move.l (0,a2,d0.l),d0
     b16:	b0a9 0004      	cmp.l 4(a1),d0
     b1a:	6600 016a      	bne.w c86 <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     b1e:	7002           	moveq #2,d0
     b20:	b081           	cmp.l d1,d0
     b22:	6700 015a      	beq.w c7e <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     b26:	2008           	move.l a0,d0
     b28:	5480           	addq.l #2,d0
     b2a:	d080           	add.l d0,d0
     b2c:	d080           	add.l d0,d0
     b2e:	2032 0800      	move.l (0,a2,d0.l),d0
     b32:	b0a9 0008      	cmp.l 8(a1),d0
     b36:	6600 014e      	bne.w c86 <TestCopperlistBatch+0x1a0>
     b3a:	2008           	move.l a0,d0
     b3c:	5680           	addq.l #3,d0
     b3e:	d080           	add.l d0,d0
     b40:	d080           	add.l d0,d0
     b42:	2032 0800      	move.l (0,a2,d0.l),d0
     b46:	b0a9 000c      	cmp.l 12(a1),d0
     b4a:	6600 013a      	bne.w c86 <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     b4e:	7404           	moveq #4,d2
     b50:	b481           	cmp.l d1,d2
     b52:	6700 012a      	beq.w c7e <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     b56:	2008           	move.l a0,d0
     b58:	5880           	addq.l #4,d0
     b5a:	d080           	add.l d0,d0
     b5c:	d080           	add.l d0,d0
     b5e:	2032 0800      	move.l (0,a2,d0.l),d0
     b62:	b0a9 0010      	cmp.l 16(a1),d0
     b66:	6600 011e      	bne.w c86 <TestCopperlistBatch+0x1a0>
     b6a:	2008           	move.l a0,d0
     b6c:	5a80           	addq.l #5,d0
     b6e:	d080           	add.l d0,d0
     b70:	d080           	add.l d0,d0
     b72:	2032 0800      	move.l (0,a2,d0.l),d0
     b76:	b0a9 0014      	cmp.l 20(a1),d0
     b7a:	6600 010a      	bne.w c86 <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     b7e:	7006           	moveq #6,d0
     b80:	b081           	cmp.l d1,d0
     b82:	6700 00fa      	beq.w c7e <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     b86:	2008           	move.l a0,d0
     b88:	5c80           	addq.l #6,d0
     b8a:	d080           	add.l d0,d0
     b8c:	d080           	add.l d0,d0
     b8e:	2032 0800      	move.l (0,a2,d0.l),d0
     b92:	b0a9 0018      	cmp.l 24(a1),d0
     b96:	6600 00ee      	bne.w c86 <TestCopperlistBatch+0x1a0>
     b9a:	2008           	move.l a0,d0
     b9c:	5e80           	addq.l #7,d0
     b9e:	d080           	add.l d0,d0
     ba0:	d080           	add.l d0,d0
     ba2:	2032 0800      	move.l (0,a2,d0.l),d0
     ba6:	b0a9 001c      	cmp.l 28(a1),d0
     baa:	6600 00da      	bne.w c86 <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     bae:	7408           	moveq #8,d2
     bb0:	b481           	cmp.l d1,d2
     bb2:	6700 00ca      	beq.w c7e <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     bb6:	2008           	move.l a0,d0
     bb8:	5080           	addq.l #8,d0
     bba:	d080           	add.l d0,d0
     bbc:	d080           	add.l d0,d0
     bbe:	2032 0800      	move.l (0,a2,d0.l),d0
     bc2:	b0a9 0020      	cmp.l 32(a1),d0
     bc6:	6600 00be      	bne.w c86 <TestCopperlistBatch+0x1a0>
     bca:	47e8 0009      	lea 9(a0),a3
     bce:	200b           	move.l a3,d0
     bd0:	d08b           	add.l a3,d0
     bd2:	d080           	add.l d0,d0
     bd4:	2032 0800      	move.l (0,a2,d0.l),d0
     bd8:	b0a9 0024      	cmp.l 36(a1),d0
     bdc:	6600 00a8      	bne.w c86 <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     be0:	700a           	moveq #10,d0
     be2:	b081           	cmp.l d1,d0
     be4:	6700 0098      	beq.w c7e <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     be8:	47e8 000a      	lea 10(a0),a3
     bec:	200b           	move.l a3,d0
     bee:	d08b           	add.l a3,d0
     bf0:	d080           	add.l d0,d0
     bf2:	2032 0800      	move.l (0,a2,d0.l),d0
     bf6:	b0a9 0028      	cmp.l 40(a1),d0
     bfa:	6600 008a      	bne.w c86 <TestCopperlistBatch+0x1a0>
     bfe:	47e8 000b      	lea 11(a0),a3
     c02:	200b           	move.l a3,d0
     c04:	d08b           	add.l a3,d0
     c06:	d080           	add.l d0,d0
     c08:	2032 0800      	move.l (0,a2,d0.l),d0
     c0c:	b0a9 002c      	cmp.l 44(a1),d0
     c10:	6674           	bne.s c86 <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     c12:	740c           	moveq #12,d2
     c14:	b481           	cmp.l d1,d2
     c16:	6766           	beq.s c7e <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     c18:	47e8 000c      	lea 12(a0),a3
     c1c:	200b           	move.l a3,d0
     c1e:	d08b           	add.l a3,d0
     c20:	d080           	add.l d0,d0
     c22:	2032 0800      	move.l (0,a2,d0.l),d0
     c26:	b0a9 0030      	cmp.l 48(a1),d0
     c2a:	665a           	bne.s c86 <TestCopperlistBatch+0x1a0>
     c2c:	47e8 000d      	lea 13(a0),a3
     c30:	200b           	move.l a3,d0
     c32:	d08b           	add.l a3,d0
     c34:	d080           	add.l d0,d0
     c36:	2032 0800      	move.l (0,a2,d0.l),d0
     c3a:	b0a9 0034      	cmp.l 52(a1),d0
     c3e:	6646           	bne.s c86 <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     c40:	700e           	moveq #14,d0
     c42:	b081           	cmp.l d1,d0
     c44:	6738           	beq.s c7e <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     c46:	47e8 000e      	lea 14(a0),a3
     c4a:	200b           	move.l a3,d0
     c4c:	d08b           	add.l a3,d0
     c4e:	d080           	add.l d0,d0
     c50:	2032 0800      	move.l (0,a2,d0.l),d0
     c54:	b0a9 0038      	cmp.l 56(a1),d0
     c58:	662c           	bne.s c86 <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     c5a:	7410           	moveq #16,d2
     c5c:	b481           	cmp.l d1,d2
     c5e:	661e           	bne.s c7e <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     c60:	41e8 000f      	lea 15(a0),a0
     c64:	d1c8           	adda.l a0,a0
     c66:	d1c8           	adda.l a0,a0
     c68:	2070 a800      	movea.l (0,a0,a2.l),a0
     c6c:	b1e9 003c      	cmpa.l 60(a1),a0
     c70:	57c0           	seq d0
     c72:	4880           	ext.w d0
     c74:	48c0           	ext.l d0
     c76:	4480           	neg.l d0
}
     c78:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     c7c:	4e75           	rts
  return 1;
     c7e:	7001           	moveq #1,d0
}
     c80:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     c84:	4e75           	rts
      return 0;
     c86:	7000           	moveq #0,d0
}
     c88:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     c8c:	4e75           	rts

00000c8e <ClBuild>:
ULONG * ClBuild() {
     c8e:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
     c92:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
     c98:	707b           	moveq #123,d0
     c9a:	4600           	not.b d0
     c9c:	7202           	moveq #2,d1
     c9e:	4eae ff3a      	jsr -198(a6)
     ca2:	2440           	movea.l d0,a2
  if( retval == 0) {
     ca4:	4a80           	tst.l d0
     ca6:	6700 010e      	beq.w db6 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
     caa:	24b9 0000 7434 	move.l 7434 <ClsSprites>,(a2)
     cb0:	2579 0000 7438 	move.l 7438 <ClsSprites+0x4>,4(a2)
     cb6:	0004 
     cb8:	2579 0000 743c 	move.l 743c <ClsSprites+0x8>,8(a2)
     cbe:	0008 
     cc0:	2579 0000 7440 	move.l 7440 <ClsSprites+0xc>,12(a2)
     cc6:	000c 
     cc8:	2579 0000 7444 	move.l 7444 <ClsSprites+0x10>,16(a2)
     cce:	0010 
     cd0:	2579 0000 7448 	move.l 7448 <ClsSprites+0x14>,20(a2)
     cd6:	0014 
     cd8:	2579 0000 744c 	move.l 744c <ClsSprites+0x18>,24(a2)
     cde:	0018 
     ce0:	2579 0000 7450 	move.l 7450 <ClsSprites+0x1c>,28(a2)
     ce6:	001c 
     ce8:	2579 0000 7454 	move.l 7454 <ClsSprites+0x20>,32(a2)
     cee:	0020 
     cf0:	2579 0000 7458 	move.l 7458 <ClsSprites+0x24>,36(a2)
     cf6:	0024 
     cf8:	2579 0000 745c 	move.l 745c <ClsSprites+0x28>,40(a2)
     cfe:	0028 
     d00:	2579 0000 7460 	move.l 7460 <ClsSprites+0x2c>,44(a2)
     d06:	002c 
     d08:	2579 0000 7464 	move.l 7464 <ClsSprites+0x30>,48(a2)
     d0e:	0030 
     d10:	2579 0000 7468 	move.l 7468 <ClsSprites+0x34>,52(a2)
     d16:	0034 
     d18:	2579 0000 746c 	move.l 746c <ClsSprites+0x38>,56(a2)
     d1e:	0038 
     d20:	2579 0000 7470 	move.l 7470 <ClsSprites+0x3c>,60(a2)
     d26:	003c 
    *cl++ = *clpartinstruction++;
     d28:	2579 0000 7404 	move.l 7404 <ClScreen>,64(a2)
     d2e:	0040 
     d30:	2579 0000 7408 	move.l 7408 <ClScreen+0x4>,68(a2)
     d36:	0044 
     d38:	2579 0000 740c 	move.l 740c <ClScreen+0x8>,72(a2)
     d3e:	0048 
     d40:	2579 0000 7410 	move.l 7410 <ClScreen+0xc>,76(a2)
     d46:	004c 
     d48:	2579 0000 7414 	move.l 7414 <ClScreen+0x10>,80(a2)
     d4e:	0050 
     d50:	2579 0000 7418 	move.l 7418 <ClScreen+0x14>,84(a2)
     d56:	0054 
     d58:	2579 0000 741c 	move.l 741c <ClScreen+0x18>,88(a2)
     d5e:	0058 
     d60:	2579 0000 7420 	move.l 7420 <ClScreen+0x1c>,92(a2)
     d66:	005c 
     d68:	2579 0000 7424 	move.l 7424 <ClScreen+0x20>,96(a2)
     d6e:	0060 
     d70:	2579 0000 7428 	move.l 7428 <ClScreen+0x24>,100(a2)
     d76:	0064 
     d78:	2579 0000 742c 	move.l 742c <ClScreen+0x28>,104(a2)
     d7e:	0068 
     d80:	2579 0000 7430 	move.l 7430 <ClScreen+0x2c>,108(a2)
     d86:	006c 
  *cl++ = 0x00e00000;
     d88:	257c 00e0 0000 	move.l #14680064,112(a2)
     d8e:	0070 
  *cl++ = 0x00e20000;
     d90:	257c 00e2 0000 	move.l #14811136,116(a2)
     d96:	0074 
    *cl++ = *clpartinstruction++;
     d98:	2579 0000 73fc 	move.l 73fc <ClColor>,120(a2)
     d9e:	0078 
     da0:	2579 0000 7400 	move.l 7400 <ClColor+0x4>,124(a2)
     da6:	007c 
  *cl = 0xfffffffe;
     da8:	70fe           	moveq #-2,d0
     daa:	2540 0080      	move.l d0,128(a2)
}
     dae:	200a           	move.l a2,d0
     db0:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     db4:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     db6:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     dbc:	4eae ffc4      	jsr -60(a6)
     dc0:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     dc6:	2200           	move.l d0,d1
     dc8:	243c 0000 4dd5 	move.l #19925,d2
     dce:	7628           	moveq #40,d3
     dd0:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     dd4:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
     dda:	7201           	moveq #1,d1
     ddc:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     de0:	24b9 0000 7434 	move.l 7434 <ClsSprites>,(a2)
     de6:	2579 0000 7438 	move.l 7438 <ClsSprites+0x4>,4(a2)
     dec:	0004 
     dee:	2579 0000 743c 	move.l 743c <ClsSprites+0x8>,8(a2)
     df4:	0008 
     df6:	2579 0000 7440 	move.l 7440 <ClsSprites+0xc>,12(a2)
     dfc:	000c 
     dfe:	2579 0000 7444 	move.l 7444 <ClsSprites+0x10>,16(a2)
     e04:	0010 
     e06:	2579 0000 7448 	move.l 7448 <ClsSprites+0x14>,20(a2)
     e0c:	0014 
     e0e:	2579 0000 744c 	move.l 744c <ClsSprites+0x18>,24(a2)
     e14:	0018 
     e16:	2579 0000 7450 	move.l 7450 <ClsSprites+0x1c>,28(a2)
     e1c:	001c 
     e1e:	2579 0000 7454 	move.l 7454 <ClsSprites+0x20>,32(a2)
     e24:	0020 
     e26:	2579 0000 7458 	move.l 7458 <ClsSprites+0x24>,36(a2)
     e2c:	0024 
     e2e:	2579 0000 745c 	move.l 745c <ClsSprites+0x28>,40(a2)
     e34:	0028 
     e36:	2579 0000 7460 	move.l 7460 <ClsSprites+0x2c>,44(a2)
     e3c:	002c 
     e3e:	2579 0000 7464 	move.l 7464 <ClsSprites+0x30>,48(a2)
     e44:	0030 
     e46:	2579 0000 7468 	move.l 7468 <ClsSprites+0x34>,52(a2)
     e4c:	0034 
     e4e:	2579 0000 746c 	move.l 746c <ClsSprites+0x38>,56(a2)
     e54:	0038 
     e56:	2579 0000 7470 	move.l 7470 <ClsSprites+0x3c>,60(a2)
     e5c:	003c 
    *cl++ = *clpartinstruction++;
     e5e:	2579 0000 7404 	move.l 7404 <ClScreen>,64(a2)
     e64:	0040 
     e66:	2579 0000 7408 	move.l 7408 <ClScreen+0x4>,68(a2)
     e6c:	0044 
     e6e:	2579 0000 740c 	move.l 740c <ClScreen+0x8>,72(a2)
     e74:	0048 
     e76:	2579 0000 7410 	move.l 7410 <ClScreen+0xc>,76(a2)
     e7c:	004c 
     e7e:	2579 0000 7414 	move.l 7414 <ClScreen+0x10>,80(a2)
     e84:	0050 
     e86:	2579 0000 7418 	move.l 7418 <ClScreen+0x14>,84(a2)
     e8c:	0054 
     e8e:	2579 0000 741c 	move.l 741c <ClScreen+0x18>,88(a2)
     e94:	0058 
     e96:	2579 0000 7420 	move.l 7420 <ClScreen+0x1c>,92(a2)
     e9c:	005c 
     e9e:	2579 0000 7424 	move.l 7424 <ClScreen+0x20>,96(a2)
     ea4:	0060 
     ea6:	2579 0000 7428 	move.l 7428 <ClScreen+0x24>,100(a2)
     eac:	0064 
     eae:	2579 0000 742c 	move.l 742c <ClScreen+0x28>,104(a2)
     eb4:	0068 
     eb6:	2579 0000 7430 	move.l 7430 <ClScreen+0x2c>,108(a2)
     ebc:	006c 
  *cl++ = 0x00e00000;
     ebe:	257c 00e0 0000 	move.l #14680064,112(a2)
     ec4:	0070 
  *cl++ = 0x00e20000;
     ec6:	257c 00e2 0000 	move.l #14811136,116(a2)
     ecc:	0074 
    *cl++ = *clpartinstruction++;
     ece:	2579 0000 73fc 	move.l 73fc <ClColor>,120(a2)
     ed4:	0078 
     ed6:	2579 0000 7400 	move.l 7400 <ClColor+0x4>,124(a2)
     edc:	007c 
  *cl = 0xfffffffe;
     ede:	70fe           	moveq #-2,d0
     ee0:	2540 0080      	move.l d0,128(a2)
}
     ee4:	200a           	move.l a2,d0
     ee6:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     eea:	4e75           	rts

00000eec <WaitBlt>:
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     eec:	2079 0000 77e8 	movea.l 77e8 <hw>,a0
     ef2:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     ef6:	3028 0002      	move.w 2(a0),d0
     efa:	0800 000e      	btst #14,d0
     efe:	66f6           	bne.s ef6 <WaitBlt+0xa>
}
     f00:	4e75           	rts

00000f02 <Zoom_ZoomIntoPicture>:
  hw->bltcon0 = 0x9f0 + shiftright;
  hw->bltcon1 = 0;
}

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
     f02:	4fef ffe0      	lea -32(sp),sp
     f06:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
     f0a:	282f 0058      	move.l 88(sp),d4
     f0e:	262f 005c      	move.l 92(sp),d3
     f12:	3404           	move.w d4,d2
  WaitBlit();
     f14:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
     f1a:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
     f1e:	2079 0000 77e8 	movea.l 77e8 <hw>,a0
     f24:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     f2a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     f30:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     f36:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     f3c:	317c 002c 0066 	move.w #44,102(a0)
  Init_Blit();
  WORD shiftright = 9;
  UWORD shifthoriz = 7;
  UWORD startofword = 21*16;
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
     f42:	3044           	movea.w d4,a0
     f44:	d0c4           	adda.w d4,a0
     f46:	3208           	move.w a0,d1
     f48:	d248           	add.w a0,d1
     f4a:	d244           	add.w d4,d1
     f4c:	3001           	move.w d1,d0
     f4e:	d041           	add.w d1,d0
     f50:	0640 014c      	addi.w #332,d0
     f54:	3f40 0040      	move.w d0,64(sp)
  WORD shiftright = 9;
     f58:	3f7c 0009 0032 	move.w #9,50(sp)
  while( nextzoom > 22 * 16) {
     f5e:	0c40 0160      	cmpi.w #352,d0
     f62:	6f1a           	ble.s f7e <Zoom_ZoomIntoPicture+0x7c>
  WORD shiftright = 9;
     f64:	327c 0009      	movea.w #9,a1
    nextzoom -= (19 + zoomnr);
     f68:	0640 ffed      	addi.w #-19,d0
     f6c:	9042           	sub.w d2,d0
    shiftright--;
     f6e:	5349           	subq.w #1,a1
  while( nextzoom > 22 * 16) {
     f70:	0c40 0160      	cmpi.w #352,d0
     f74:	6ef2           	bgt.s f68 <Zoom_ZoomIntoPicture+0x66>
     f76:	3f49 0032      	move.w a1,50(sp)
     f7a:	3f40 0040      	move.w d0,64(sp)
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
     f7e:	7012           	moveq #18,d0
     f80:	9041           	sub.w d1,d0
     f82:	3f40 0048      	move.w d0,72(sp)
  while( ZoomHorizontalStart < 0) {
     f86:	6c00 0346      	bge.w 12ce <Zoom_ZoomIntoPicture+0x3cc>
     f8a:	3200           	move.w d0,d1
  UWORD shifthoriz = 7;
     f8c:	7007           	moveq #7,d0
      ZoomHorizontalStart += 1 + 18 + zoomnr;
     f8e:	0641 0013      	addi.w #19,d1
     f92:	d242           	add.w d2,d1
      shifthoriz--;
     f94:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
     f96:	4a41           	tst.w d1
     f98:	6df4           	blt.s f8e <Zoom_ZoomIntoPicture+0x8c>
     f9a:	3f41 0048      	move.w d1,72(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    /*UWORD size4blitsmall = ZMLINESIZE/2*ZoomHorizontal*planes;
    UWORD size4blitbig = ZMLINESIZE/2*(ZoomHorizontal+1)*planes;*/

    UWORD onestep = ZMLINESIZE/2*planes;
     f9e:	3203           	move.w d3,d1
     fa0:	d243           	add.w d3,d1
     fa2:	d243           	add.w d3,d1
     fa4:	e749           	lsl.w #3,d1
     fa6:	3f41 0034      	move.w d1,52(sp)
  hw->bltsize = height*64+2;
     faa:	3e03           	move.w d3,d7
     fac:	ed4f           	lsl.w #6,d7
     fae:	3207           	move.w d7,d1
     fb0:	5441           	addq.w #2,d1
     fb2:	3f41 0036      	move.w d1,54(sp)
          linesleft--;
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
        pos4source += size4blit;
        pos4dest += size4blit + onestep;   
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     fb6:	90c4           	suba.w d4,a0
     fb8:	3a48           	movea.w a0,a5
     fba:	4bed 0012      	lea 18(a5),a5
     fbe:	7200           	moveq #0,d1
     fc0:	322f 0034      	move.w 52(sp),d1
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
     fc4:	c6c0           	mulu.w d0,d3
     fc6:	2003           	move.l d3,d0
     fc8:	d083           	add.l d3,d0
     fca:	d083           	add.l d3,d0
     fcc:	e988           	lsl.l #4,d0
     fce:	206f 0050      	movea.l 80(sp),a0
     fd2:	41f0 082c      	lea (44,a0,d0.l),a0
     fd6:	2f48 003c      	move.l a0,60(sp)
     fda:	702c           	moveq #44,d0
     fdc:	d0af 0054      	add.l 84(sp),d0
     fe0:	2f40 0038      	move.l d0,56(sp)
  UWORD shifttoleft = 0;
     fe4:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
     fe8:	3f7c 0150 0030 	move.w #336,48(sp)
      nextzoom -= (19 + zoomnr);
     fee:	70ed           	moveq #-19,d0
     ff0:	9042           	sub.w d2,d0
     ff2:	3f40 004a      	move.w d0,74(sp)
    ZoomBlit_Increment4SrcA = 1;
     ff6:	2841           	movea.l d1,a4
    ZoomHorizontal = ZoomHorizontalStart;
     ff8:	33ef 0048 0000 	move.w 72(sp),77d0 <ZoomHorizontal>
     ffe:	77d0 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1000:	242f 003c      	move.l 60(sp),d2
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1004:	262f 0038      	move.l 56(sp),d3
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1008:	7c00           	moveq #0,d6
    100a:	3c2f 0046      	move.w 70(sp),d6
    100e:	2a06           	move.l d6,d5
    1010:	da86           	add.l d6,d5
    1012:	3f6f 0032 002c 	move.w 50(sp),44(sp)
    1018:	382f 0032      	move.w 50(sp),d4
    101c:	720c           	moveq #12,d1
    101e:	e36c           	lsl.w d1,d4
    1020:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    1026:	7000           	moveq #0,d0
    1028:	302f 0030      	move.w 48(sp),d0
    102c:	306f 0040      	movea.w 64(sp),a0
    1030:	b1c0           	cmpa.l d0,a0
    1032:	6e00 00e8      	bgt.w 111c <Zoom_ZoomIntoPicture+0x21a>
  WaitBlit();
    1036:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    103a:	2079 0000 77e8 	movea.l 77e8 <hw>,a0
    1040:	0644 09f0      	addi.w #2544,d4
    1044:	3144 0040      	move.w d4,64(a0)
  hw->bltcon1 = 0;
    1048:	317c 0000 0042 	move.w #0,66(a0)
    104e:	3239 0000 77d0 	move.w 77d0 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    1054:	383c 0110      	move.w #272,d4
    1058:	2f46 002c      	move.l d6,44(sp)
    105c:	2645           	movea.l d5,a3
    105e:	3c2f 0034      	move.w 52(sp),d6
        if( linesleft >= ZoomHorizontal+1) {
    1062:	b841           	cmp.w d1,d4
    1064:	6f00 009a      	ble.w 1100 <Zoom_ZoomIntoPicture+0x1fe>
          linesleft -= ZoomHorizontal;
    1068:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep; 
    106a:	3001           	move.w d1,d0
    106c:	c1c6           	muls.w d6,d0
        if( linesleft>0) {
    106e:	0280 0000 ffff 	andi.l #65535,d0
    1074:	2440           	movea.l d0,a2
    1076:	d5c0           	adda.l d0,a2
    1078:	4a44           	tst.w d4
    107a:	6f2c           	ble.s 10a8 <Zoom_ZoomIntoPicture+0x1a6>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    107c:	226f 002c      	movea.l 44(sp),a1
    1080:	d3c0           	adda.l d0,a1
    1082:	d3c9           	adda.l a1,a1
    1084:	d3c2           	adda.l d2,a1
          UWORD *tmpdest = pos4dest +  size4blit;
    1086:	4df2 3800      	lea (0,a2,d3.l),a6
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    108a:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    108e:	3a28 0002      	move.w 2(a0),d5
    1092:	0805 000e      	btst #14,d5
    1096:	66f6           	bne.s 108e <Zoom_ZoomIntoPicture+0x18c>
  hw->bltapt = (UWORD *) source;
    1098:	2149 0050      	move.l a1,80(a0)
  hw->bltdpt = (UWORD *) destination;
    109c:	214e 0054      	move.l a6,84(a0)
  hw->bltsize = height*64+2;
    10a0:	316f 0036 0058 	move.w 54(sp),88(a0)
          linesleft--;
    10a6:	5344           	subq.w #1,d4
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    10a8:	43f3 2800      	lea (0,a3,d2.l),a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    10ac:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    10b0:	3a28 0002      	move.w 2(a0),d5
    10b4:	0805 000e      	btst #14,d5
    10b8:	66f6           	bne.s 10b0 <Zoom_ZoomIntoPicture+0x1ae>
  hw->bltapt = (UWORD *) source;
    10ba:	2149 0050      	move.l a1,80(a0)
  hw->bltdpt = (UWORD *) destination;
    10be:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    10c2:	c3c7           	muls.w d7,d1
    10c4:	5441           	addq.w #2,d1
    10c6:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
    10ca:	d48a           	add.l a2,d2
        pos4dest += size4blit + onestep; 
    10cc:	d08c           	add.l a4,d0
    10ce:	d080           	add.l d0,d0
    10d0:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    10d2:	320d           	move.w a5,d1
      while(linesleft > 0) {
    10d4:	4a44           	tst.w d4
    10d6:	6e8a           	bgt.s 1062 <Zoom_ZoomIntoPicture+0x160>
    10d8:	33cd 0000 77d0 	move.w a5,77d0 <ZoomHorizontal>
      if(shiftright < 0) {
        shiftright += 16;
        shifttoleft = 1;
      }
    }
    startofword -= 16;
    10de:	066f fff0 0030 	addi.w #-16,48(sp)
    10e4:	55af 003c      	subq.l #2,60(sp)
    10e8:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
    10ec:	0c6f fff0 0030 	cmpi.w #-16,48(sp)
    10f2:	6600 ff04      	bne.w ff8 <Zoom_ZoomIntoPicture+0xf6>
  }
  //ZoomHorizontal = 10;
}
    10f6:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    10fa:	4fef 0020      	lea 32(sp),sp
    10fe:	4e75           	rts
        UWORD size4blit = ZoomHorizontal*onestep; 
    1100:	3006           	move.w d6,d0
    1102:	c1c4           	muls.w d4,d0
        if( linesleft>0) {
    1104:	0280 0000 ffff 	andi.l #65535,d0
    110a:	2440           	movea.l d0,a2
    110c:	d5c0           	adda.l d0,a2
        UWORD size4blit = ZoomHorizontal*onestep; 
    110e:	3204           	move.w d4,d1
          linesleft = 0;
    1110:	4244           	clr.w d4
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1112:	43f3 2800      	lea (0,a3,d2.l),a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1116:	3a28 0002      	move.w 2(a0),d5
    111a:	6094           	bra.s 10b0 <Zoom_ZoomIntoPicture+0x1ae>
  UWORD colnr = nextzoom - startofword - 1;                                                                          
    111c:	366f 0040      	movea.w 64(sp),a3
    1120:	96ef 0030      	suba.w 48(sp),a3
    1124:	534b           	subq.w #1,a3
  if( shiftright == 0) {
    1126:	302f 002c      	move.w 44(sp),d0
    112a:	5340           	subq.w #1,d0
    112c:	3f40 0032      	move.w d0,50(sp)
    1130:	4a6f 002c      	tst.w 44(sp)
    1134:	6600 013c      	bne.w 1272 <Zoom_ZoomIntoPicture+0x370>
    ZoomBlit_Increment4SrcA = 1;
    1138:	33fc 0001 0000 	move.w #1,77de <ZoomBlit_Increment4SrcA>
    113e:	77de 
    1140:	347c fde4      	movea.w #-540,a2
  WaitBlit(); 
    1144:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1148:	2079 0000 77e8 	movea.l 77e8 <hw>,a0
    114e:	3144 0042      	move.w d4,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1152:	314a 0040      	move.w a2,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1156:	7000           	moveq #0,d0
    1158:	300b           	move.w a3,d0
    115a:	7210           	moveq #16,d1
    115c:	9280           	sub.l d0,d1
    115e:	2001           	move.l d1,d0
    1160:	7200           	moveq #0,d1
    1162:	4641           	not.w d1
    1164:	e1a9           	lsl.l d0,d1
    1166:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    116a:	302f 004a      	move.w 74(sp),d0
    116e:	d16f 0040      	add.w d0,64(sp)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1172:	7000           	moveq #0,d0
    1174:	3039 0000 77de 	move.w 77de <ZoomBlit_Increment4SrcA>,d0
    117a:	2c40           	movea.l d0,a6
    117c:	ddc0           	adda.l d0,a6
    117e:	3239 0000 77d0 	move.w 77d0 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    1184:	383c 0110      	move.w #272,d4
    1188:	2f46 0042      	move.l d6,66(sp)
        if( linesleft >= ZoomHorizontal+1) {
    118c:	b841           	cmp.w d1,d4
    118e:	6f00 00c2      	ble.w 1252 <Zoom_ZoomIntoPicture+0x350>
          linesleft -= ZoomHorizontal;
    1192:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep;
    1194:	302f 0034      	move.w 52(sp),d0
    1198:	c1c1           	muls.w d1,d0
        if( linesleft>0) {
    119a:	0280 0000 ffff 	andi.l #65535,d0
    11a0:	2440           	movea.l d0,a2
    11a2:	d5c0           	adda.l d0,a2
    11a4:	4a44           	tst.w d4
    11a6:	6f34           	ble.s 11dc <Zoom_ZoomIntoPicture+0x2da>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    11a8:	226f 0042      	movea.l 66(sp),a1
    11ac:	d3c0           	adda.l d0,a1
    11ae:	d3c9           	adda.l a1,a1
    11b0:	d3c2           	adda.l d2,a1
          UWORD *tmpdest = pos4dest + size4blit;
    11b2:	47f2 3800      	lea (0,a2,d3.l),a3
    11b6:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    11ba:	3c28 0002      	move.w 2(a0),d6
    11be:	0806 000e      	btst #14,d6
    11c2:	66f6           	bne.s 11ba <Zoom_ZoomIntoPicture+0x2b8>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    11c4:	2c09           	move.l a1,d6
    11c6:	dc8e           	add.l a6,d6
    11c8:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
    11cc:	2149 004c      	move.l a1,76(a0)
  hw->bltdpt = destination;
    11d0:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
    11d4:	316f 0036 0058 	move.w 54(sp),88(a0)
          linesleft--;
    11da:	5344           	subq.w #1,d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    11dc:	2242           	movea.l d2,a1
    11de:	d3c5           	adda.l d5,a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    11e0:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    11e4:	3c28 0002      	move.w 2(a0),d6
    11e8:	0806 000e      	btst #14,d6
    11ec:	66f6           	bne.s 11e4 <Zoom_ZoomIntoPicture+0x2e2>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    11ee:	2c09           	move.l a1,d6
    11f0:	dc8e           	add.l a6,d6
    11f2:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
    11f6:	2149 004c      	move.l a1,76(a0)
  hw->bltdpt = destination;
    11fa:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    11fe:	c3c7           	muls.w d7,d1
    1200:	5441           	addq.w #2,d1
    1202:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
    1206:	d48a           	add.l a2,d2
        pos4dest += size4blit + onestep;   
    1208:	d08c           	add.l a4,d0
    120a:	d080           	add.l d0,d0
    120c:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    120e:	320d           	move.w a5,d1
      while( linesleft > 0) {
    1210:	4a44           	tst.w d4
    1212:	6e00 ff78      	bgt.w 118c <Zoom_ZoomIntoPicture+0x28a>
    1216:	33cd 0000 77d0 	move.w a5,77d0 <ZoomHorizontal>
      if(shiftright < 0) {
    121c:	4a6f 0032      	tst.w 50(sp)
    1220:	6c00 febc      	bge.w 10de <Zoom_ZoomIntoPicture+0x1dc>
        shiftright += 16;
    1224:	322f 002c      	move.w 44(sp),d1
    1228:	0641 000f      	addi.w #15,d1
    122c:	3f41 0032      	move.w d1,50(sp)
        shifttoleft = 1;
    1230:	3f7c 0001 0046 	move.w #1,70(sp)
    startofword -= 16;
    1236:	066f fff0 0030 	addi.w #-16,48(sp)
    123c:	55af 003c      	subq.l #2,60(sp)
    1240:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
    1244:	0c6f fff0 0030 	cmpi.w #-16,48(sp)
    124a:	6600 fdac      	bne.w ff8 <Zoom_ZoomIntoPicture+0xf6>
    124e:	6000 fea6      	bra.w 10f6 <Zoom_ZoomIntoPicture+0x1f4>
        UWORD size4blit = ZoomHorizontal*onestep;
    1252:	302f 0034      	move.w 52(sp),d0
    1256:	c1c4           	muls.w d4,d0
        if( linesleft>0) {
    1258:	0280 0000 ffff 	andi.l #65535,d0
    125e:	2440           	movea.l d0,a2
    1260:	d5c0           	adda.l d0,a2
        UWORD size4blit = ZoomHorizontal*onestep;
    1262:	3204           	move.w d4,d1
          linesleft = 0;
    1264:	4244           	clr.w d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1266:	2242           	movea.l d2,a1
    1268:	d3c5           	adda.l d5,a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    126a:	3c28 0002      	move.w 2(a0),d6
    126e:	6000 ff74      	bra.w 11e4 <Zoom_ZoomIntoPicture+0x2e2>
  ZoomBlit_Increment4SrcA = 0;
    1272:	4279 0000 77de 	clr.w 77de <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
    1278:	720c           	moveq #12,d1
    127a:	e368           	lsl.w d1,d0
    127c:	3440           	movea.w d0,a2
    127e:	45ea 0de4      	lea 3556(a2),a2
  WaitBlit(); 
    1282:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1286:	2079 0000 77e8 	movea.l 77e8 <hw>,a0
    128c:	3144 0042      	move.w d4,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1290:	314a 0040      	move.w a2,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1294:	7000           	moveq #0,d0
    1296:	300b           	move.w a3,d0
    1298:	7210           	moveq #16,d1
    129a:	9280           	sub.l d0,d1
    129c:	2001           	move.l d1,d0
    129e:	7200           	moveq #0,d1
    12a0:	4641           	not.w d1
    12a2:	e1a9           	lsl.l d0,d1
    12a4:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    12a8:	302f 004a      	move.w 74(sp),d0
    12ac:	d16f 0040      	add.w d0,64(sp)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    12b0:	7000           	moveq #0,d0
    12b2:	3039 0000 77de 	move.w 77de <ZoomBlit_Increment4SrcA>,d0
    12b8:	2c40           	movea.l d0,a6
    12ba:	ddc0           	adda.l d0,a6
    12bc:	3239 0000 77d0 	move.w 77d0 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    12c2:	383c 0110      	move.w #272,d4
    12c6:	2f46 0042      	move.l d6,66(sp)
    12ca:	6000 fec0      	bra.w 118c <Zoom_ZoomIntoPicture+0x28a>
  UWORD shifthoriz = 7;
    12ce:	7007           	moveq #7,d0
    UWORD onestep = ZMLINESIZE/2*planes;
    12d0:	3203           	move.w d3,d1
    12d2:	d243           	add.w d3,d1
    12d4:	d243           	add.w d3,d1
    12d6:	e749           	lsl.w #3,d1
    12d8:	3f41 0034      	move.w d1,52(sp)
  hw->bltsize = height*64+2;
    12dc:	3e03           	move.w d3,d7
    12de:	ed4f           	lsl.w #6,d7
    12e0:	3207           	move.w d7,d1
    12e2:	5441           	addq.w #2,d1
    12e4:	3f41 0036      	move.w d1,54(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    12e8:	90c4           	suba.w d4,a0
    12ea:	3a48           	movea.w a0,a5
    12ec:	4bed 0012      	lea 18(a5),a5
    12f0:	7200           	moveq #0,d1
    12f2:	322f 0034      	move.w 52(sp),d1
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    12f6:	c6c0           	mulu.w d0,d3
    12f8:	2003           	move.l d3,d0
    12fa:	d083           	add.l d3,d0
    12fc:	d083           	add.l d3,d0
    12fe:	e988           	lsl.l #4,d0
    1300:	206f 0050      	movea.l 80(sp),a0
    1304:	41f0 082c      	lea (44,a0,d0.l),a0
    1308:	2f48 003c      	move.l a0,60(sp)
    130c:	702c           	moveq #44,d0
    130e:	d0af 0054      	add.l 84(sp),d0
    1312:	2f40 0038      	move.l d0,56(sp)
  UWORD shifttoleft = 0;
    1316:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
    131a:	3f7c 0150 0030 	move.w #336,48(sp)
      nextzoom -= (19 + zoomnr);
    1320:	70ed           	moveq #-19,d0
    1322:	9042           	sub.w d2,d0
    1324:	3f40 004a      	move.w d0,74(sp)
    ZoomBlit_Increment4SrcA = 1;
    1328:	2841           	movea.l d1,a4
    132a:	6000 fccc      	bra.w ff8 <Zoom_ZoomIntoPicture+0xf6>

0000132e <Init_Blit>:
  hw->bltafwm = 0xffff;
    132e:	2079 0000 77e8 	movea.l 77e8 <hw>,a0
    1334:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    133a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1340:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1346:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    134c:	317c 002c 0066 	move.w #44,102(a0)
}
    1352:	4e75           	rts

00001354 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    1354:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1358:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    135e:	203c 0000 a48c 	move.l #42124,d0
    1364:	7202           	moveq #2,d1
    1366:	4eae ff3a      	jsr -198(a6)
    136a:	2440           	movea.l d0,a2
  if( retval == 0) {
    136c:	4a80           	tst.l d0
    136e:	6700 011e      	beq.w 148e <ClbuildZoom+0x13a>
    *cl++ = *clpartinstruction++;
    1372:	24b9 0000 7434 	move.l 7434 <ClsSprites>,(a2)
    1378:	2579 0000 7438 	move.l 7438 <ClsSprites+0x4>,4(a2)
    137e:	0004 
    1380:	2579 0000 743c 	move.l 743c <ClsSprites+0x8>,8(a2)
    1386:	0008 
    1388:	2579 0000 7440 	move.l 7440 <ClsSprites+0xc>,12(a2)
    138e:	000c 
    1390:	2579 0000 7444 	move.l 7444 <ClsSprites+0x10>,16(a2)
    1396:	0010 
    1398:	2579 0000 7448 	move.l 7448 <ClsSprites+0x14>,20(a2)
    139e:	0014 
    13a0:	2579 0000 744c 	move.l 744c <ClsSprites+0x18>,24(a2)
    13a6:	0018 
    13a8:	2579 0000 7450 	move.l 7450 <ClsSprites+0x1c>,28(a2)
    13ae:	001c 
    13b0:	2579 0000 7454 	move.l 7454 <ClsSprites+0x20>,32(a2)
    13b6:	0020 
    13b8:	2579 0000 7458 	move.l 7458 <ClsSprites+0x24>,36(a2)
    13be:	0024 
    13c0:	2579 0000 745c 	move.l 745c <ClsSprites+0x28>,40(a2)
    13c6:	0028 
    13c8:	2579 0000 7460 	move.l 7460 <ClsSprites+0x2c>,44(a2)
    13ce:	002c 
    13d0:	2579 0000 7464 	move.l 7464 <ClsSprites+0x30>,48(a2)
    13d6:	0030 
    13d8:	2579 0000 7468 	move.l 7468 <ClsSprites+0x34>,52(a2)
    13de:	0034 
    13e0:	2579 0000 746c 	move.l 746c <ClsSprites+0x38>,56(a2)
    13e6:	0038 
    13e8:	2579 0000 7470 	move.l 7470 <ClsSprites+0x3c>,60(a2)
    13ee:	003c 
    *cl++ = *clpartinstruction++;
    13f0:	2579 0000 7404 	move.l 7404 <ClScreen>,64(a2)
    13f6:	0040 
    13f8:	2579 0000 7408 	move.l 7408 <ClScreen+0x4>,68(a2)
    13fe:	0044 
    1400:	2579 0000 740c 	move.l 740c <ClScreen+0x8>,72(a2)
    1406:	0048 
    1408:	2579 0000 7410 	move.l 7410 <ClScreen+0xc>,76(a2)
    140e:	004c 
    1410:	2579 0000 7414 	move.l 7414 <ClScreen+0x10>,80(a2)
    1416:	0050 
    1418:	2579 0000 7418 	move.l 7418 <ClScreen+0x14>,84(a2)
    141e:	0054 
    1420:	2579 0000 741c 	move.l 741c <ClScreen+0x18>,88(a2)
    1426:	0058 
    1428:	2579 0000 7420 	move.l 7420 <ClScreen+0x1c>,92(a2)
    142e:	005c 
    1430:	2579 0000 7424 	move.l 7424 <ClScreen+0x20>,96(a2)
    1436:	0060 
    1438:	2579 0000 7428 	move.l 7428 <ClScreen+0x24>,100(a2)
    143e:	0064 
    1440:	2579 0000 742c 	move.l 742c <ClScreen+0x28>,104(a2)
    1446:	0068 
    1448:	2579 0000 7430 	move.l 7430 <ClScreen+0x2c>,108(a2)
    144e:	006c 
  *cl++ = 0x00e00000;
    1450:	257c 00e0 0000 	move.l #14680064,112(a2)
    1456:	0070 
  *cl++ = 0x00e20000;
    1458:	257c 00e2 0000 	move.l #14811136,116(a2)
    145e:	0074 
  *cl++ = 0x00e40000;
    1460:	257c 00e4 0000 	move.l #14942208,120(a2)
    1466:	0078 
  *cl++ = 0x00e60000;
    1468:	257c 00e6 0000 	move.l #15073280,124(a2)
    146e:	007c 
    *cl++ = *clpartinstruction++;
    1470:	2579 0000 73fc 	move.l 73fc <ClColor>,128(a2)
    1476:	0080 
    1478:	2579 0000 7400 	move.l 7400 <ClColor+0x4>,132(a2)
    147e:	0084 
   *cl = 0xfffffffe;
    1480:	70fe           	moveq #-2,d0
    1482:	2540 0088      	move.l d0,136(a2)
}
    1486:	200a           	move.l a2,d0
    1488:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    148c:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    148e:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1494:	4eae ffc4      	jsr -60(a6)
    1498:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    149e:	2200           	move.l d0,d1
    14a0:	243c 0000 4dd5 	move.l #19925,d2
    14a6:	7628           	moveq #40,d3
    14a8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    14ac:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    14b2:	7201           	moveq #1,d1
    14b4:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    14b8:	24b9 0000 7434 	move.l 7434 <ClsSprites>,(a2)
    14be:	2579 0000 7438 	move.l 7438 <ClsSprites+0x4>,4(a2)
    14c4:	0004 
    14c6:	2579 0000 743c 	move.l 743c <ClsSprites+0x8>,8(a2)
    14cc:	0008 
    14ce:	2579 0000 7440 	move.l 7440 <ClsSprites+0xc>,12(a2)
    14d4:	000c 
    14d6:	2579 0000 7444 	move.l 7444 <ClsSprites+0x10>,16(a2)
    14dc:	0010 
    14de:	2579 0000 7448 	move.l 7448 <ClsSprites+0x14>,20(a2)
    14e4:	0014 
    14e6:	2579 0000 744c 	move.l 744c <ClsSprites+0x18>,24(a2)
    14ec:	0018 
    14ee:	2579 0000 7450 	move.l 7450 <ClsSprites+0x1c>,28(a2)
    14f4:	001c 
    14f6:	2579 0000 7454 	move.l 7454 <ClsSprites+0x20>,32(a2)
    14fc:	0020 
    14fe:	2579 0000 7458 	move.l 7458 <ClsSprites+0x24>,36(a2)
    1504:	0024 
    1506:	2579 0000 745c 	move.l 745c <ClsSprites+0x28>,40(a2)
    150c:	0028 
    150e:	2579 0000 7460 	move.l 7460 <ClsSprites+0x2c>,44(a2)
    1514:	002c 
    1516:	2579 0000 7464 	move.l 7464 <ClsSprites+0x30>,48(a2)
    151c:	0030 
    151e:	2579 0000 7468 	move.l 7468 <ClsSprites+0x34>,52(a2)
    1524:	0034 
    1526:	2579 0000 746c 	move.l 746c <ClsSprites+0x38>,56(a2)
    152c:	0038 
    152e:	2579 0000 7470 	move.l 7470 <ClsSprites+0x3c>,60(a2)
    1534:	003c 
    *cl++ = *clpartinstruction++;
    1536:	2579 0000 7404 	move.l 7404 <ClScreen>,64(a2)
    153c:	0040 
    153e:	2579 0000 7408 	move.l 7408 <ClScreen+0x4>,68(a2)
    1544:	0044 
    1546:	2579 0000 740c 	move.l 740c <ClScreen+0x8>,72(a2)
    154c:	0048 
    154e:	2579 0000 7410 	move.l 7410 <ClScreen+0xc>,76(a2)
    1554:	004c 
    1556:	2579 0000 7414 	move.l 7414 <ClScreen+0x10>,80(a2)
    155c:	0050 
    155e:	2579 0000 7418 	move.l 7418 <ClScreen+0x14>,84(a2)
    1564:	0054 
    1566:	2579 0000 741c 	move.l 741c <ClScreen+0x18>,88(a2)
    156c:	0058 
    156e:	2579 0000 7420 	move.l 7420 <ClScreen+0x1c>,92(a2)
    1574:	005c 
    1576:	2579 0000 7424 	move.l 7424 <ClScreen+0x20>,96(a2)
    157c:	0060 
    157e:	2579 0000 7428 	move.l 7428 <ClScreen+0x24>,100(a2)
    1584:	0064 
    1586:	2579 0000 742c 	move.l 742c <ClScreen+0x28>,104(a2)
    158c:	0068 
    158e:	2579 0000 7430 	move.l 7430 <ClScreen+0x2c>,108(a2)
    1594:	006c 
  *cl++ = 0x00e00000;
    1596:	257c 00e0 0000 	move.l #14680064,112(a2)
    159c:	0070 
  *cl++ = 0x00e20000;
    159e:	257c 00e2 0000 	move.l #14811136,116(a2)
    15a4:	0074 
  *cl++ = 0x00e40000;
    15a6:	257c 00e4 0000 	move.l #14942208,120(a2)
    15ac:	0078 
  *cl++ = 0x00e60000;
    15ae:	257c 00e6 0000 	move.l #15073280,124(a2)
    15b4:	007c 
    *cl++ = *clpartinstruction++;
    15b6:	2579 0000 73fc 	move.l 73fc <ClColor>,128(a2)
    15bc:	0080 
    15be:	2579 0000 7400 	move.l 7400 <ClColor+0x4>,132(a2)
    15c4:	0084 
   *cl = 0xfffffffe;
    15c6:	70fe           	moveq #-2,d0
    15c8:	2540 0088      	move.l d0,136(a2)
}
    15cc:	200a           	move.l a2,d0
    15ce:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    15d2:	4e75           	rts

000015d4 <Zoom_Init>:
void Zoom_Init() {
    15d4:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    15d6:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    15dc:	7004           	moveq #4,d0
    15de:	7202           	moveq #2,d1
    15e0:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
    15e4:	33fc 0010 0000 	move.w #16,77d0 <ZoomHorizontal>
    15ea:	77d0 
}
    15ec:	2c5f           	movea.l (sp)+,a6
    15ee:	4e75           	rts

000015f0 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    15f0:	2039 0000 77d2 	move.l 77d2 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    15f6:	23f9 0000 77c0 	move.l 77c0 <ViewCopper>,77d2 <DrawCopper>
    15fc:	0000 77d2 
  ViewCopper = (ULONG *)tmp;
    1600:	23c0 0000 77c0 	move.l d0,77c0 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    1606:	2079 0000 77e8 	movea.l 77e8 <hw>,a0
    160c:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    1610:	3140 0088      	move.w d0,136(a0)
}
    1614:	4e75           	rts

00001616 <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    1616:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    161a:	45fa fd38      	lea 1354 <ClbuildZoom>(pc),a2
    161e:	4e92           	jsr (a2)
    1620:	23c0 0000 77da 	move.l d0,77da <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1626:	4e92           	jsr (a2)
    1628:	23c0 0000 77cc 	move.l d0,77cc <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    162e:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    1634:	203c 0001 6800 	move.l #92160,d0
    163a:	7202           	moveq #2,d1
    163c:	4eae ff3a      	jsr -198(a6)
    1640:	23c0 0000 77c8 	move.l d0,77c8 <Bitplane1>
  if(Bitplane1 == 0) {
    1646:	6700 014e      	beq.w 1796 <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    164a:	23c0 0000 77e0 	move.l d0,77e0 <DrawBuffer>
  DrawCopper = Copperlist1;
    1650:	23f9 0000 77da 	move.l 77da <Copperlist1>,77d2 <DrawCopper>
    1656:	0000 77d2 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    165a:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    1660:	203c 0001 6800 	move.l #92160,d0
    1666:	7202           	moveq #2,d1
    1668:	4eae ff3a      	jsr -198(a6)
    166c:	2400           	move.l d0,d2
    166e:	23c0 0000 77c4 	move.l d0,77c4 <Bitplane2>
  if(Bitplane2 == 0) {
    1674:	6778           	beq.s 16ee <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    1676:	23f9 0000 77cc 	move.l 77cc <Copperlist2>,77c0 <ViewCopper>
    167c:	0000 77c0 
  SwapCl();
    1680:	45fa ff6e      	lea 15f0 <SwapCl>(pc),a2
    1684:	4e92           	jsr (a2)

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
    1686:	2039 0000 77e0 	move.l 77e0 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    168c:	2079 0000 77d2 	movea.l 77d2 <DrawCopper>,a0
  copword += ZMBPLPTRS+1;
  for(int i=1;i<=2;i++) {
    UWORD highword = ptr >> 16;
    1692:	2200           	move.l d0,d1
    1694:	4241           	clr.w d1
    1696:	4841           	swap d1
    1698:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    169c:	3140 0076      	move.w d0,118(a0)
    *copword = highword;
    copword += 2;
    *copword = lowword;
    copword += 2;
    ptr += 40*256;
    16a0:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    16a6:	2200           	move.l d0,d1
    16a8:	4241           	clr.w d1
    16aa:	4841           	swap d1
    16ac:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    16b0:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    16b4:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    16b6:	2079 0000 77d2 	movea.l 77d2 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    16bc:	2002           	move.l d2,d0
    16be:	4240           	clr.w d0
    16c0:	4840           	swap d0
    16c2:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    16c6:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    16ca:	2002           	move.l d2,d0
    16cc:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    16d2:	2200           	move.l d0,d1
    16d4:	4241           	clr.w d1
    16d6:	4841           	swap d1
    16d8:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    16dc:	3140 007e      	move.w d0,126(a0)
  }
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;
    16e0:	23c2 0000 77d6 	move.l d2,77d6 <ViewBuffer>
}
    16e6:	7000           	moveq #0,d0
    16e8:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    16ec:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    16ee:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    16f4:	4eae ffc4      	jsr -60(a6)
    16f8:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    16fe:	2200           	move.l d0,d1
    1700:	243c 0000 4e22 	move.l #20002,d2
    1706:	7626           	moveq #38,d3
    1708:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    170c:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1712:	7201           	moveq #1,d1
    1714:	4eae ff70      	jsr -144(a6)
    1718:	2439 0000 77c4 	move.l 77c4 <Bitplane2>,d2
  ViewCopper = Copperlist2;
    171e:	23f9 0000 77cc 	move.l 77cc <Copperlist2>,77c0 <ViewCopper>
    1724:	0000 77c0 
  SwapCl();
    1728:	45fa fec6      	lea 15f0 <SwapCl>(pc),a2
    172c:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    172e:	2039 0000 77e0 	move.l 77e0 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1734:	2079 0000 77d2 	movea.l 77d2 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    173a:	2200           	move.l d0,d1
    173c:	4241           	clr.w d1
    173e:	4841           	swap d1
    1740:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    1744:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    1748:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    174e:	2200           	move.l d0,d1
    1750:	4241           	clr.w d1
    1752:	4841           	swap d1
    1754:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1758:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    175c:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    175e:	2079 0000 77d2 	movea.l 77d2 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1764:	2002           	move.l d2,d0
    1766:	4240           	clr.w d0
    1768:	4840           	swap d0
    176a:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    176e:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    1772:	2002           	move.l d2,d0
    1774:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    177a:	2200           	move.l d0,d1
    177c:	4241           	clr.w d1
    177e:	4841           	swap d1
    1780:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1784:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    1788:	23c2 0000 77d6 	move.l d2,77d6 <ViewBuffer>
}
    178e:	7000           	moveq #0,d0
    1790:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1794:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1796:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    179c:	4eae ffc4      	jsr -60(a6)
    17a0:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    17a6:	2200           	move.l d0,d1
    17a8:	243c 0000 4dfb 	move.l #19963,d2
    17ae:	7626           	moveq #38,d3
    17b0:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    17b4:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    17ba:	7201           	moveq #1,d1
    17bc:	4eae ff70      	jsr -144(a6)
    17c0:	2039 0000 77c8 	move.l 77c8 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    17c6:	23c0 0000 77e0 	move.l d0,77e0 <DrawBuffer>
  DrawCopper = Copperlist1;
    17cc:	23f9 0000 77da 	move.l 77da <Copperlist1>,77d2 <DrawCopper>
    17d2:	0000 77d2 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    17d6:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    17dc:	203c 0001 6800 	move.l #92160,d0
    17e2:	7202           	moveq #2,d1
    17e4:	4eae ff3a      	jsr -198(a6)
    17e8:	2400           	move.l d0,d2
    17ea:	23c0 0000 77c4 	move.l d0,77c4 <Bitplane2>
  if(Bitplane2 == 0) {
    17f0:	6600 fe84      	bne.w 1676 <PrepareDisplayZoom+0x60>
    17f4:	6000 fef8      	bra.w 16ee <PrepareDisplayZoom+0xd8>

000017f8 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    17f8:	2039 0000 77e0 	move.l 77e0 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    17fe:	2079 0000 77d2 	movea.l 77d2 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    1804:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1808:	2200           	move.l d0,d1
    180a:	4241           	clr.w d1
    180c:	4841           	swap d1
    180e:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    1812:	23f9 0000 77d6 	move.l 77d6 <ViewBuffer>,77e0 <DrawBuffer>
    1818:	0000 77e0 
  ViewBuffer = (ULONG *) tmp;
    181c:	23c0 0000 77d6 	move.l d0,77d6 <ViewBuffer>
}
    1822:	4e75           	rts

00001824 <RunFrame>:
	SetInterruptHandler((APTR)interruptHandler);
}



void RunFrame() {
    1824:	2f02           	move.l d2,-(sp)
  //TestZoomSpeed();
  SetBplPointers();
    1826:	4eba ffd0      	jsr 17f8 <SetBplPointers>(pc)
  SwapCl();
    182a:	4eba fdc4      	jsr 15f0 <SwapCl>(pc)
  //while( !MouseLeft()) {}
  Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer - 2, (UWORD *)DrawBuffer - 2, Zoom_LevelOfZoom, 1 );
    182e:	3439 0000 77ac 	move.w 77ac <Zoom_LevelOfZoom>,d2
    1834:	4878 0001      	pea 1 <_start+0x1>
    1838:	3f02           	move.w d2,-(sp)
    183a:	4267           	clr.w -(sp)
    183c:	2039 0000 77e0 	move.l 77e0 <DrawBuffer>,d0
    1842:	5980           	subq.l #4,d0
    1844:	2f00           	move.l d0,-(sp)
    1846:	2039 0000 77d6 	move.l 77d6 <ViewBuffer>,d0
    184c:	5980           	subq.l #4,d0
    184e:	2f00           	move.l d0,-(sp)
    1850:	4eba f6b0      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  if( Zoom_LevelOfZoom == 17)
    1854:	4fef 0010      	lea 16(sp),sp
    1858:	0c42 0011      	cmpi.w #17,d2
    185c:	670c           	beq.s 186a <RunFrame+0x46>
    Zoom_LevelOfZoom = 0;
  else
    Zoom_LevelOfZoom++;
    185e:	5242           	addq.w #1,d2
    1860:	33c2 0000 77ac 	move.w d2,77ac <Zoom_LevelOfZoom>
  
    1866:	241f           	move.l (sp)+,d2
    1868:	4e75           	rts
    Zoom_LevelOfZoom = 0;
    186a:	4279 0000 77ac 	clr.w 77ac <Zoom_LevelOfZoom>
    1870:	241f           	move.l (sp)+,d2
    1872:	4e75           	rts

00001874 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    1874:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    1878:	262f 0010      	move.l 16(sp),d3
    187c:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    1880:	2279 0000 77da 	movea.l 77da <Copperlist1>,a1
    1886:	b2fc 0000      	cmpa.w #0,a1
    188a:	670c           	beq.s 1898 <FreeDisplay+0x24>
    188c:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    1892:	2003           	move.l d3,d0
    1894:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    1898:	2279 0000 77cc 	movea.l 77cc <Copperlist2>,a1
    189e:	b2fc 0000      	cmpa.w #0,a1
    18a2:	670c           	beq.s 18b0 <FreeDisplay+0x3c>
    18a4:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    18aa:	2003           	move.l d3,d0
    18ac:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    18b0:	2279 0000 77c8 	movea.l 77c8 <Bitplane1>,a1
    18b6:	b2fc 0000      	cmpa.w #0,a1
    18ba:	670c           	beq.s 18c8 <FreeDisplay+0x54>
    18bc:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    18c2:	2002           	move.l d2,d0
    18c4:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    18c8:	2279 0000 77c4 	movea.l 77c4 <Bitplane2>,a1
    18ce:	b2fc 0000      	cmpa.w #0,a1
    18d2:	670c           	beq.s 18e0 <FreeDisplay+0x6c>
    18d4:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    18da:	2002           	move.l d2,d0
    18dc:	4eae ff2e      	jsr -210(a6)
}
    18e0:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    18e4:	4e75           	rts

000018e6 <WaitVbl>:
void WaitVbl() {
    18e6:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    18e8:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddabb2>,d0
    18ee:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    18f0:	2017           	move.l (sp),d0
    18f2:	0280 0001 ff00 	andi.l #130816,d0
    18f8:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    18fa:	2017           	move.l (sp),d0
    18fc:	0c80 0001 3700 	cmpi.l #79616,d0
    1902:	67e4           	beq.s 18e8 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    1904:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddabb2>,d0
    190a:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    190e:	202f 0004      	move.l 4(sp),d0
    1912:	0280 0001 ff00 	andi.l #130816,d0
    1918:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    191c:	202f 0004      	move.l 4(sp),d0
    1920:	0c80 0001 3700 	cmpi.l #79616,d0
    1926:	66dc           	bne.s 1904 <WaitVbl+0x1e>
}
    1928:	508f           	addq.l #8,sp
    192a:	4e75           	rts

0000192c <ZoomTest>:
void ZoomTest() {
    192c:	4fef ff50      	lea -176(sp),sp
    1930:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
  hw->dmacon = 0b1000010000000000; //Blitter nasty
    1934:	2079 0000 77e8 	movea.l 77e8 <hw>,a0
    193a:	317c 8400 0096 	move.w #-31744,150(a0)
  Counter4Frames = 0;
    1940:	42b9 0000 77f0 	clr.l 77f0 <Counter4Frames>
  if ((vbint = AllocMem(sizeof(struct Interrupt),    
    1946:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    194c:	7016           	moveq #22,d0
    194e:	223c 0001 0001 	move.l #65537,d1
    1954:	4eae ff3a      	jsr -198(a6)
    1958:	2440           	movea.l d0,a2
    195a:	4a80           	tst.l d0
    195c:	671a           	beq.s 1978 <ZoomTest+0x4c>
    vbint->is_Node.ln_Type = NT_INTERRUPT;       
    195e:	357c 02c4 0008 	move.w #708,8(a2)
    vbint->is_Node.ln_Name = "VertB-Example";
    1964:	257c 0000 4e49 	move.l #20041,10(a2)
    196a:	000a 
    vbint->is_Data = NULL;
    196c:	42aa 000e      	clr.l 14(a2)
    vbint->is_Code = Vblankcounter;
    1970:	257c 0000 0ac0 	move.l #2752,18(a2)
    1976:	0012 
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    1978:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    197e:	203c 0001 1440 	move.l #70720,d0
    1984:	7202           	moveq #2,d1
    1986:	4eae ff3a      	jsr -198(a6)
    198a:	2800           	move.l d0,d4
  if( source == 0) {
    198c:	6700 28d6      	beq.w 4264 <ZoomTest+0x2938>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    1990:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    1996:	203c 0001 1440 	move.l #70720,d0
    199c:	7202           	moveq #2,d1
    199e:	4eae ff3a      	jsr -198(a6)
    19a2:	2a00           	move.l d0,d5
  if( destination == 0) {
    19a4:	6700 2908      	beq.w 42ae <ZoomTest+0x2982>
    19a8:	2004           	move.l d4,d0
    19aa:	0680 0000 3300 	addi.l #13056,d0
    19b0:	2044           	movea.l d4,a0
      *tmp4source++ = 0x55555555;
    19b2:	20bc 5555 5555 	move.l #1431655765,(a0)
    19b8:	217c 5555 5555 	move.l #1431655765,4(a0)
    19be:	0004 
    19c0:	217c 5555 5555 	move.l #1431655765,8(a0)
    19c6:	0008 
    19c8:	217c 5555 5555 	move.l #1431655765,12(a0)
    19ce:	000c 
    19d0:	217c 5555 5555 	move.l #1431655765,16(a0)
    19d6:	0010 
    19d8:	217c 5555 5555 	move.l #1431655765,20(a0)
    19de:	0014 
    19e0:	217c 5555 5555 	move.l #1431655765,24(a0)
    19e6:	0018 
    19e8:	217c 5555 5555 	move.l #1431655765,28(a0)
    19ee:	001c 
    19f0:	217c 5555 5555 	move.l #1431655765,32(a0)
    19f6:	0020 
    19f8:	217c 5555 5555 	move.l #1431655765,36(a0)
    19fe:	0024 
    1a00:	217c 5555 5555 	move.l #1431655765,40(a0)
    1a06:	0028 
    1a08:	217c 5555 5555 	move.l #1431655765,44(a0)
    1a0e:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    1a10:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    1a16:	0030 
    1a18:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    1a1e:	0034 
    1a20:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    1a26:	0038 
    1a28:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    1a2e:	003c 
    1a30:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    1a36:	0040 
    1a38:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    1a3e:	0044 
    1a40:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    1a46:	0048 
    1a48:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    1a4e:	004c 
    1a50:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    1a56:	0050 
    1a58:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    1a5e:	0054 
    1a60:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    1a66:	0058 
    1a68:	41e8 0060      	lea 96(a0),a0
    1a6c:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    1a72:	fffc 
  for(int i=0;i<128+8;i++) {
    1a74:	b1c0           	cmpa.l d0,a0
    1a76:	6600 ff3a      	bne.w 19b2 <ZoomTest+0x86>
  WaitVbl();
    1a7a:	4eba fe6a      	jsr 18e6 <WaitVbl>(pc)
  Init_Blit();
    1a7e:	4eba f8ae      	jsr 132e <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1a82:	33fc 0001 0000 	move.w #1,77de <ZoomBlit_Increment4SrcA>
    1a88:	77de 
  WaitBlit(); 
    1a8a:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    1a90:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1a94:	2079 0000 77e8 	movea.l 77e8 <hw>,a0
    1a9a:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1aa0:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1aa6:	317c fff8 0070 	move.w #-8,112(a0)
  AddIntServer(INTB_VERTB, vbint);
    1aac:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    1ab2:	7005           	moveq #5,d0
    1ab4:	224a           	movea.l a2,a1
    1ab6:	4eae ff58      	jsr -168(a6)
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    1aba:	4878 0005      	pea 5 <_start+0x5>
    1abe:	42a7           	clr.l -(sp)
    1ac0:	2f05           	move.l d5,-(sp)
    1ac2:	2f04           	move.l d4,-(sp)
    1ac4:	4eba f43c      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  RemIntServer(INTB_VERTB, vbint);
    1ac8:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    1ace:	7005           	moveq #5,d0
    1ad0:	224a           	movea.l a2,a1
    1ad2:	4eae ff52      	jsr -174(a6)
  if( Counter4Frames > 6)
    1ad6:	4fef 0010      	lea 16(sp),sp
    1ada:	7006           	moveq #6,d0
    1adc:	b0b9 0000 77f0 	cmp.l 77f0 <Counter4Frames>,d0
    1ae2:	6c1e           	bge.s 1b02 <ZoomTest+0x1d6>
    Write( Output(), "TestSpeed4Zoom: Takes too long\n", 31);
    1ae4:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1aea:	4eae ffc4      	jsr -60(a6)
    1aee:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1af4:	2200           	move.l d0,d1
    1af6:	243c 0000 4eca 	move.l #20170,d2
    1afc:	761f           	moveq #31,d3
    1afe:	4eae ffd0      	jsr -48(a6)
  FreeMem( source, ( ZMLINESIZE+4)*272*5);
    1b02:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    1b08:	2244           	movea.l d4,a1
    1b0a:	203c 0001 1440 	move.l #70720,d0
    1b10:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, ( ZMLINESIZE+4)*272*5);
    1b14:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    1b1a:	2245           	movea.l d5,a1
    1b1c:	203c 0001 1440 	move.l #70720,d0
    1b22:	4eae ff2e      	jsr -210(a6)
  PrepareDisplayZoom();
    1b26:	4bfa faee      	lea 1616 <PrepareDisplayZoom>(pc),a5
    1b2a:	4e95           	jsr (a5)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    1b2c:	4878 0010      	pea 10 <main+0xa>
    1b30:	4879 0000 7434 	pea 7434 <ClsSprites>
    1b36:	42a7           	clr.l -(sp)
    1b38:	2f39 0000 77da 	move.l 77da <Copperlist1>,-(sp)
    1b3e:	47fa efa6      	lea ae6 <TestCopperlistBatch>(pc),a3
    1b42:	4e93           	jsr (a3)
    1b44:	4fef 0010      	lea 16(sp),sp
    1b48:	4a80           	tst.l d0
    1b4a:	661e           	bne.s 1b6a <ZoomTest+0x23e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    1b4c:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1b52:	4eae ffc4      	jsr -60(a6)
    1b56:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1b5c:	2200           	move.l d0,d1
    1b5e:	243c 0000 4eea 	move.l #20202,d2
    1b64:	762c           	moveq #44,d3
    1b66:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    1b6a:	4878 000c      	pea c <main+0x6>
    1b6e:	4879 0000 7404 	pea 7404 <ClScreen>
    1b74:	4878 0010      	pea 10 <main+0xa>
    1b78:	2f39 0000 77da 	move.l 77da <Copperlist1>,-(sp)
    1b7e:	4e93           	jsr (a3)
    1b80:	4fef 0010      	lea 16(sp),sp
    1b84:	4a80           	tst.l d0
    1b86:	661e           	bne.s 1ba6 <ZoomTest+0x27a>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    1b88:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1b8e:	4eae ffc4      	jsr -60(a6)
    1b92:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1b98:	2200           	move.l d0,d1
    1b9a:	243c 0000 4f20 	move.l #20256,d2
    1ba0:	7636           	moveq #54,d3
    1ba2:	4eae ffd0      	jsr -48(a6)
  UWORD *copword = (UWORD *) DrawCopper;
    1ba6:	2079 0000 77d2 	movea.l 77d2 <DrawCopper>,a0
    *copword = highword;
    1bac:	317c 0004 0072 	move.w #4,114(a0)
    *copword = lowword;
    1bb2:	4268 0076      	clr.w 118(a0)
    *copword = highword;
    1bb6:	317c 0004 007a 	move.w #4,122(a0)
    *copword = lowword;
    1bbc:	317c 2800 007e 	move.w #10240,126(a0)
  DrawBuffer = ViewBuffer;
    1bc2:	23fc 0005 0000 	move.l #327680,77e0 <DrawBuffer>
    1bc8:	0000 77e0 
  ViewBuffer = (ULONG *) tmp;
    1bcc:	23fc 0004 0000 	move.l #262144,77d6 <ViewBuffer>
    1bd2:	0000 77d6 
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    1bd6:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    1bdc:	4878 001c      	pea 1c <main+0x16>
    1be0:	2f39 0000 77da 	move.l 77da <Copperlist1>,-(sp)
    1be6:	45fa eee0      	lea ac8 <TestCopperlistPos>(pc),a2
    1bea:	4e92           	jsr (a2)
    1bec:	4fef 000c      	lea 12(sp),sp
    1bf0:	4a80           	tst.l d0
    1bf2:	661e           	bne.s 1c12 <ZoomTest+0x2e6>
    Write(Output(), 
    1bf4:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1bfa:	4eae ffc4      	jsr -60(a6)
    1bfe:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1c04:	2200           	move.l d0,d1
    1c06:	243c 0000 4f57 	move.l #20311,d2
    1c0c:	763c           	moveq #60,d3
    1c0e:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    1c12:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    1c18:	4878 001d      	pea 1d <main+0x17>
    1c1c:	2f39 0000 77da 	move.l 77da <Copperlist1>,-(sp)
    1c22:	4e92           	jsr (a2)
    1c24:	4fef 000c      	lea 12(sp),sp
    1c28:	4a80           	tst.l d0
    1c2a:	661e           	bne.s 1c4a <ZoomTest+0x31e>
    Write(Output(), 
    1c2c:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1c32:	4eae ffc4      	jsr -60(a6)
    1c36:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1c3c:	2200           	move.l d0,d1
    1c3e:	243c 0000 4f94 	move.l #20372,d2
    1c44:	763c           	moveq #60,d3
    1c46:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    1c4a:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    1c50:	4878 001e      	pea 1e <main+0x18>
    1c54:	2f39 0000 77da 	move.l 77da <Copperlist1>,-(sp)
    1c5a:	4e92           	jsr (a2)
    1c5c:	4fef 000c      	lea 12(sp),sp
    1c60:	4a80           	tst.l d0
    1c62:	661e           	bne.s 1c82 <ZoomTest+0x356>
    Write(Output(), 
    1c64:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1c6a:	4eae ffc4      	jsr -60(a6)
    1c6e:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1c74:	2200           	move.l d0,d1
    1c76:	243c 0000 4fd1 	move.l #20433,d2
    1c7c:	763c           	moveq #60,d3
    1c7e:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
    1c82:	2f3c 00e6 2800 	move.l #15083520,-(sp)
    1c88:	4878 001f      	pea 1f <main+0x19>
    1c8c:	2f39 0000 77da 	move.l 77da <Copperlist1>,-(sp)
    1c92:	4e92           	jsr (a2)
    1c94:	4fef 000c      	lea 12(sp),sp
    1c98:	4a80           	tst.l d0
    1c9a:	661e           	bne.s 1cba <ZoomTest+0x38e>
    Write(Output(), 
    1c9c:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1ca2:	4eae ffc4      	jsr -60(a6)
    1ca6:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1cac:	2200           	move.l d0,d1
    1cae:	243c 0000 500e 	move.l #20494,d2
    1cb4:	763c           	moveq #60,d3
    1cb6:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
    1cba:	4878 0002      	pea 2 <_start+0x2>
    1cbe:	4879 0000 73fc 	pea 73fc <ClColor>
    1cc4:	4878 0020      	pea 20 <main+0x1a>
    1cc8:	2f39 0000 77da 	move.l 77da <Copperlist1>,-(sp)
    1cce:	4e93           	jsr (a3)
    1cd0:	4fef 0010      	lea 16(sp),sp
    1cd4:	4a80           	tst.l d0
    1cd6:	661e           	bne.s 1cf6 <ZoomTest+0x3ca>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1cd8:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1cde:	4eae ffc4      	jsr -60(a6)
    1ce2:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1ce8:	2200           	move.l d0,d1
    1cea:	243c 0000 504b 	move.l #20555,d2
    1cf0:	7621           	moveq #33,d3
    1cf2:	4eae ffd0      	jsr -48(a6)
  if( TestCopperlistPos( Copperlist1, 34, 0xfffffffe) == 0)
    1cf6:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdbbac>
    1cfa:	4878 0022      	pea 22 <main+0x1c>
    1cfe:	2f39 0000 77da 	move.l 77da <Copperlist1>,-(sp)
    1d04:	4e92           	jsr (a2)
    1d06:	4fef 000c      	lea 12(sp),sp
    1d0a:	4a80           	tst.l d0
    1d0c:	661e           	bne.s 1d2c <ZoomTest+0x400>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    1d0e:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1d14:	4eae ffc4      	jsr -60(a6)
    1d18:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1d1e:	2200           	move.l d0,d1
    1d20:	243c 0000 506d 	move.l #20589,d2
    1d26:	7622           	moveq #34,d3
    1d28:	4eae ffd0      	jsr -48(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    1d2c:	2f3c 0001 6800 	move.l #92160,-(sp)
    1d32:	2f3c 0000 a48c 	move.l #42124,-(sp)
    1d38:	47fa fb3a      	lea 1874 <FreeDisplay>(pc),a3
    1d3c:	4e93           	jsr (a3)
  Zoom_Init();
    1d3e:	49fa f894      	lea 15d4 <Zoom_Init>(pc),a4
    1d42:	4e94           	jsr (a4)
  PrepareDisplayZoom();
    1d44:	4e95           	jsr (a5)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    1d46:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    1d4c:	203c 0000 c800 	move.l #51200,d0
    1d52:	7202           	moveq #2,d1
    1d54:	4eae ff3a      	jsr -198(a6)
    1d58:	2040           	movea.l d0,a0
    1d5a:	23c0 0000 77e4 	move.l d0,77e4 <Zoom_Source>
  if( Zoom_Source == 0) {
    1d60:	508f           	addq.l #8,sp
    1d62:	6700 24de      	beq.w 4242 <ZoomTest+0x2916>
  *tstsource++ = 0x0000;
    1d66:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    1d68:	317c 0080 0002 	move.w #128,2(a0)
  *tstsource = 0x1000;
    1d6e:	317c 1000 0030 	move.w #4096,48(a0)
  *tstsource = 0x8e88;
    1d74:	317c 8e88 0032 	move.w #-29048,50(a0)
  *tstsource++ = 0x0000;
    1d7a:	4268 17d0      	clr.w 6096(a0)
  *tstsource = 0x00ff;
    1d7e:	317c 00ff 17d2 	move.w #255,6098(a0)
  WaitBlit();
    1d84:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    1d8a:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    1d8e:	4eba f59e      	jsr 132e <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1d92:	33fc 0001 0000 	move.w #1,77de <ZoomBlit_Increment4SrcA>
    1d98:	77de 
  WaitBlit(); 
    1d9a:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    1da0:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1da4:	2479 0000 77e8 	movea.l 77e8 <hw>,a2
    1daa:	357c 0000 0042 	move.w #0,66(a2)
  hw->bltcon0 = 0xde4 + shifta;
    1db0:	357c fde4 0040 	move.w #-540,64(a2)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1db6:	357c ff00 0070 	move.w #-256,112(a2)
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    1dbc:	2639 0000 77e0 	move.l 77e0 <DrawBuffer>,d3
    1dc2:	2439 0000 77e4 	move.l 77e4 <Zoom_Source>,d2
  WaitBlt();
    1dc8:	4eba f122      	jsr eec <WaitBlt>(pc)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1dcc:	7000           	moveq #0,d0
    1dce:	3039 0000 77de 	move.w 77de <ZoomBlit_Increment4SrcA>,d0
    1dd4:	d080           	add.l d0,d0
    1dd6:	d082           	add.l d2,d0
    1dd8:	2540 0050      	move.l d0,80(a2)
  hw->bltbpt = source;
    1ddc:	2542 004c      	move.l d2,76(a2)
  hw->bltdpt = destination;
    1de0:	2543 0054      	move.l d3,84(a2)
  hw->bltsize = height*64+2;
    1de4:	357c 2002 0058 	move.w #8194,88(a2)
  WaitBlit();
    1dea:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    1df0:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    1df4:	2479 0000 77e0 	movea.l 77e0 <DrawBuffer>,a2
  if( *destination != 0x0180) {
    1dfa:	0c6a 0180 0002 	cmpi.w #384,2(a2)
    1e00:	671e           	beq.s 1e20 <ZoomTest+0x4f4>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    1e02:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1e08:	4eae ffc4      	jsr -60(a6)
    1e0c:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1e12:	2200           	move.l d0,d1
    1e14:	243c 0000 50c8 	move.l #20680,d2
    1e1a:	761c           	moveq #28,d3
    1e1c:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x1d88)
    1e20:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
    1e26:	671e           	beq.s 1e46 <ZoomTest+0x51a>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    1e28:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1e2e:	4eae ffc4      	jsr -60(a6)
    1e32:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1e38:	2200           	move.l d0,d1
    1e3a:	243c 0000 50e5 	move.l #20709,d2
    1e40:	761c           	moveq #28,d3
    1e42:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x01ff) {
    1e46:	2079 0000 77e0 	movea.l 77e0 <DrawBuffer>,a0
    1e4c:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
    1e52:	671e           	beq.s 1e72 <ZoomTest+0x546>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    1e54:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1e5a:	4eae ffc4      	jsr -60(a6)
    1e5e:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    1e64:	2200           	move.l d0,d1
    1e66:	243c 0000 5102 	move.l #20738,d2
    1e6c:	761a           	moveq #26,d3
    1e6e:	4eae ffd0      	jsr -48(a6)
  FreeMem( Zoom_Source, 40*256*5);
    1e72:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    1e78:	2279 0000 77e4 	movea.l 77e4 <Zoom_Source>,a1
    1e7e:	203c 0000 c800 	move.l #51200,d0
    1e84:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    1e88:	2f3c 0001 6800 	move.l #92160,-(sp)
    1e8e:	2f3c 0000 a48c 	move.l #42124,-(sp)
    1e94:	4e93           	jsr (a3)
    1e96:	508f           	addq.l #8,sp
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    1e98:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    1e9e:	203c 0000 05a0 	move.l #1440,d0
    1ea4:	7202           	moveq #2,d1
    1ea6:	4eae ff3a      	jsr -198(a6)
    1eaa:	2440           	movea.l d0,a2
  if( source == 0) {
    1eac:	4a80           	tst.l d0
    1eae:	6700 22fc      	beq.w 41ac <ZoomTest+0x2880>
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    1eb2:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    1eb8:	203c 0000 05a0 	move.l #1440,d0
    1ebe:	7202           	moveq #2,d1
    1ec0:	4eae ff3a      	jsr -198(a6)
    1ec4:	2640           	movea.l d0,a3
  if( destination == 0) {
    1ec6:	4a80           	tst.l d0
    1ec8:	6700 22e2      	beq.w 41ac <ZoomTest+0x2880>
    *tmp++ = 0;
    1ecc:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
    1ece:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
    1ed4:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
    1eda:	426a 0006      	clr.w 6(a2)
    *tmp++ = 0;
    1ede:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
    1ee2:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
    1ee8:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
    1eee:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
    1ef2:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
    1ef6:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
    1efc:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
    1f02:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
    1f06:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
    1f0a:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
    1f10:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
    1f16:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
    1f1a:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
    1f1e:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
    1f24:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
    1f2a:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
    1f2e:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
    1f32:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
    1f38:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
    1f3e:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
    1f42:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
    1f46:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
    1f4c:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
    1f52:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
    1f56:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
    1f5a:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
    1f60:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
    1f66:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
    1f6a:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
    1f6e:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
    1f74:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
    1f7a:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
    1f7e:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
    1f82:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
    1f88:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
    1f8e:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
    1f92:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
    1f96:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
    1f9c:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
    1fa2:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
    1fa6:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
    1faa:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
    1fb0:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
    1fb6:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
    1fba:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
    1fbe:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
    1fc4:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
    1fca:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
    1fce:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
    1fd2:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
    1fd8:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
    1fde:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
    1fe2:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
    1fe6:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
    1fec:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
    1ff2:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
    1ff6:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
    1ffa:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
    2000:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
    2006:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
    200a:	4878 05a0      	pea 5a0 <main+0x59a>
    200e:	42a7           	clr.l -(sp)
    2010:	2f00           	move.l d0,-(sp)
    2012:	4eba 2370      	jsr 4384 <memset>(pc)
  WaitBlit();
    2016:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    201c:	4eae ff1c      	jsr -228(a6)
  Zoom_Init();
    2020:	4e94           	jsr (a4)
  WaitBlit();
    2022:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    2028:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    202c:	2879 0000 77e8 	movea.l 77e8 <hw>,a4
    2032:	397c 39f0 0040 	move.w #14832,64(a4)
  hw->bltcon1 = 0;
    2038:	397c 0000 0042 	move.w #0,66(a4)
  WaitBlt();
    203e:	4eba eeac      	jsr eec <WaitBlt>(pc)
  hw->bltapt = (UWORD *) source;
    2042:	200a           	move.l a2,d0
    2044:	5480           	addq.l #2,d0
    2046:	2940 0050      	move.l d0,80(a4)
  hw->bltdpt = (UWORD *) destination;
    204a:	294b 0054      	move.l a3,84(a4)
  hw->bltsize = height*64+2;
    204e:	397c 0402 0058 	move.w #1026,88(a4)
  WaitBlit();
    2054:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    205a:	4eae ff1c      	jsr -228(a6)
  if( *tmp != 0x5555) 
    205e:	4fef 000c      	lea 12(sp),sp
    2062:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
    2068:	671e           	beq.s 2088 <ZoomTest+0x75c>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    206a:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    2070:	4eae ffc4      	jsr -60(a6)
    2074:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    207a:	2200           	move.l d0,d1
    207c:	243c 0000 5153 	move.l #20819,d2
    2082:	761f           	moveq #31,d3
    2084:	4eae ffd0      	jsr -48(a6)
  if( *tmp != 0xaaaa)
    2088:	0c6b aaaa 0032 	cmpi.w #-21846,50(a3)
    208e:	671e           	beq.s 20ae <ZoomTest+0x782>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    2090:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    2096:	4eae ffc4      	jsr -60(a6)
    209a:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    20a0:	2200           	move.l d0,d1
    20a2:	243c 0000 5173 	move.l #20851,d2
    20a8:	7620           	moveq #32,d3
    20aa:	4eae ffd0      	jsr -48(a6)
  FreeMem( source,ZMLINESIZE*30);
    20ae:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    20b4:	224a           	movea.l a2,a1
    20b6:	203c 0000 05a0 	move.l #1440,d0
    20bc:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    20c0:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    20c6:	224b           	movea.l a3,a1
    20c8:	203c 0000 05a0 	move.l #1440,d0
    20ce:	4eae ff2e      	jsr -210(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    20d2:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    20d8:	203c 0000 3740 	move.l #14144,d0
    20de:	7202           	moveq #2,d1
    20e0:	4eae ff3a      	jsr -198(a6)
    20e4:	2600           	move.l d0,d3
  if( source == 0) {
    20e6:	6700 20fa      	beq.w 41e2 <ZoomTest+0x28b6>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    20ea:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    20f0:	203c 0000 3740 	move.l #14144,d0
    20f6:	7202           	moveq #2,d1
    20f8:	4eae ff3a      	jsr -198(a6)
    20fc:	2840           	movea.l d0,a4
  if( destination == 0) {
    20fe:	4a80           	tst.l d0
    2100:	6700 21ce      	beq.w 42d0 <ZoomTest+0x29a4>
    2104:	2003           	move.l d3,d0
    2106:	0680 0000 3300 	addi.l #13056,d0
    210c:	2043           	movea.l d3,a0
      *tmp4source++ = 0x55555555;
    210e:	20bc 5555 5555 	move.l #1431655765,(a0)
    2114:	217c 5555 5555 	move.l #1431655765,4(a0)
    211a:	0004 
    211c:	217c 5555 5555 	move.l #1431655765,8(a0)
    2122:	0008 
    2124:	217c 5555 5555 	move.l #1431655765,12(a0)
    212a:	000c 
    212c:	217c 5555 5555 	move.l #1431655765,16(a0)
    2132:	0010 
    2134:	217c 5555 5555 	move.l #1431655765,20(a0)
    213a:	0014 
    213c:	217c 5555 5555 	move.l #1431655765,24(a0)
    2142:	0018 
    2144:	217c 5555 5555 	move.l #1431655765,28(a0)
    214a:	001c 
    214c:	217c 5555 5555 	move.l #1431655765,32(a0)
    2152:	0020 
    2154:	217c 5555 5555 	move.l #1431655765,36(a0)
    215a:	0024 
    215c:	217c 5555 5555 	move.l #1431655765,40(a0)
    2162:	0028 
    2164:	217c 5555 5555 	move.l #1431655765,44(a0)
    216a:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    216c:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    2172:	0030 
    2174:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    217a:	0034 
    217c:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    2182:	0038 
    2184:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    218a:	003c 
    218c:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    2192:	0040 
    2194:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    219a:	0044 
    219c:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    21a2:	0048 
    21a4:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    21aa:	004c 
    21ac:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    21b2:	0050 
    21b4:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    21ba:	0054 
    21bc:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    21c2:	0058 
    21c4:	41e8 0060      	lea 96(a0),a0
    21c8:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    21ce:	fffc 
  for(int i=0;i<128+8;i++) {
    21d0:	b1c0           	cmpa.l d0,a0
    21d2:	6600 ff3a      	bne.w 210e <ZoomTest+0x7e2>
  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    21d6:	4878 0001      	pea 1 <_start+0x1>
    21da:	42a7           	clr.l -(sp)
    21dc:	2f0c           	move.l a4,-(sp)
    21de:	2f03           	move.l d3,-(sp)
    21e0:	4eba ed20      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    21e4:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    21ea:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    21ee:	41ec 0004      	lea 4(a4),a0
    21f2:	2f48 0044      	move.l a0,68(sp)
  for(int i=0;i<14;i++) {
    21f6:	41ec 0364      	lea 868(a4),a0
    21fa:	2f48 004c      	move.l a0,76(sp)
    21fe:	2a08           	move.l a0,d5
    2200:	4fef 0010      	lea 16(sp),sp
  UWORD *valactual = destination+2; 
    2204:	367c 0012      	movea.w #18,a3
  UWORD mask = 0xffff;
    2208:	74ff           	moveq #-1,d2
    220a:	7800           	moveq #0,d4
    220c:	4644           	not.w d4
    220e:	4bfa e79a      	lea 9aa <TestRow>(pc),a5
    2212:	2445           	movea.l d5,a2
    2214:	45ea fca0      	lea -864(a2),a2
    2218:	4deb ffee      	lea -18(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*19);
    221c:	2f0e           	move.l a6,-(sp)
    221e:	2f04           	move.l d4,-(sp)
    2220:	2f0a           	move.l a2,-(sp)
    2222:	4879 0000 7760 	pea 7760 <destlinezoom1>
    2228:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    222a:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    222e:	4642           	not.w d2
    2230:	528e           	addq.l #1,a6
    for(int i2=0;i2<18;i2++) { 
    2232:	4fef 0010      	lea 16(sp),sp
    2236:	ba8a           	cmp.l a2,d5
    2238:	6600 1888      	bne.w 3ac2 <ZoomTest+0x2196>
    TestRow( valsupposed, valactual, mask, 18+i*19);
    223c:	2f0b           	move.l a3,-(sp)
    223e:	7800           	moveq #0,d4
    2240:	3802           	move.w d2,d4
    2242:	2f04           	move.l d4,-(sp)
    2244:	2f0a           	move.l a2,-(sp)
    2246:	4879 0000 7760 	pea 7760 <destlinezoom1>
    224c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    224e:	2a0a           	move.l a2,d5
    2250:	0685 0000 0390 	addi.l #912,d5
    2256:	47eb 0013      	lea 19(a3),a3
  for(int i=0;i<14;i++) {
    225a:	4fef 0010      	lea 16(sp),sp
    225e:	b6fc 011c      	cmpa.w #284,a3
    2262:	66ae           	bne.s 2212 <ZoomTest+0x8e6>
    2264:	41ec 31e4      	lea 12772(a4),a0
    2268:	2f48 0030      	move.l a0,48(sp)
    226c:	2448           	movea.l a0,a2
    226e:	2a3c 0000 0109 	move.l #265,d5
    TestRow( valsupposed, valactual, mask, i2+265);
    2274:	2f05           	move.l d5,-(sp)
    2276:	2f04           	move.l d4,-(sp)
    2278:	2f0a           	move.l a2,-(sp)
    227a:	4879 0000 7760 	pea 7760 <destlinezoom1>
    2280:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2282:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2286:	4642           	not.w d2
    2288:	5285           	addq.l #1,d5
  for(int i2=0;i2<4;i2++) { 
    228a:	4fef 0010      	lea 16(sp),sp
    228e:	0c85 0000 010d 	cmpi.l #269,d5
    2294:	6726           	beq.s 22bc <ZoomTest+0x990>
    2296:	7800           	moveq #0,d4
    2298:	3802           	move.w d2,d4
    TestRow( valsupposed, valactual, mask, i2+265);
    229a:	2f05           	move.l d5,-(sp)
    229c:	2f04           	move.l d4,-(sp)
    229e:	2f0a           	move.l a2,-(sp)
    22a0:	4879 0000 7760 	pea 7760 <destlinezoom1>
    22a6:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    22a8:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    22ac:	4642           	not.w d2
    22ae:	5285           	addq.l #1,d5
  for(int i2=0;i2<4;i2++) { 
    22b0:	4fef 0010      	lea 16(sp),sp
    22b4:	0c85 0000 010d 	cmpi.l #269,d5
    22ba:	66da           	bne.s 2296 <ZoomTest+0x96a>
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    22bc:	4878 0001      	pea 1 <_start+0x1>
    22c0:	4878 0001      	pea 1 <_start+0x1>
    22c4:	2f03           	move.l d3,-(sp)
    22c6:	2f0c           	move.l a4,-(sp)
    22c8:	4eba ec38      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    22cc:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    22d2:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    22d6:	2003           	move.l d3,d0
    22d8:	5880           	addq.l #4,d0
    22da:	2f40 003c      	move.l d0,60(sp)
    22de:	4fef 0010      	lea 16(sp),sp
    22e2:	2440           	movea.l d0,a2
  for(int i2=0;i2<11;i2++) { 
    22e4:	7800           	moveq #0,d4
  mask = 0x0000;
    22e6:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    22e8:	2f04           	move.l d4,-(sp)
    22ea:	3f02           	move.w d2,-(sp)
    22ec:	4267           	clr.w -(sp)
    22ee:	2f0a           	move.l a2,-(sp)
    22f0:	4879 0000 7734 	pea 7734 <destlinezoom2>
    22f6:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    22f8:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    22fc:	4642           	not.w d2
  for(int i2=0;i2<11;i2++) { 
    22fe:	5284           	addq.l #1,d4
    2300:	4fef 0010      	lea 16(sp),sp
    2304:	720b           	moveq #11,d1
    2306:	b284           	cmp.l d4,d1
    2308:	66de           	bne.s 22e8 <ZoomTest+0x9bc>
  TestRow( valsupposed, valactual, 0xffff, 8);
    230a:	4878 0008      	pea 8 <main+0x2>
    230e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2314:	2003           	move.l d3,d0
    2316:	0680 0000 0214 	addi.l #532,d0
    231c:	2f40 006c      	move.l d0,108(sp)
    2320:	2f00           	move.l d0,-(sp)
    2322:	4879 0000 7734 	pea 7734 <destlinezoom2>
    2328:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 9);
    232a:	4878 0009      	pea 9 <main+0x3>
    232e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2334:	2043           	movea.l d3,a0
    2336:	4868 0244      	pea 580(a0)
    233a:	4879 0000 7734 	pea 7734 <destlinezoom2>
    2340:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 10);
    2342:	4fef 0020      	lea 32(sp),sp
    2346:	4878 000a      	pea a <main+0x4>
    234a:	42a7           	clr.l -(sp)
    234c:	2043           	movea.l d3,a0
    234e:	4868 0274      	pea 628(a0)
    2352:	4879 0000 7734 	pea 7734 <destlinezoom2>
    2358:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 11);
    235a:	4878 000b      	pea b <main+0x5>
    235e:	42a7           	clr.l -(sp)
    2360:	2043           	movea.l d3,a0
    2362:	4868 02a4      	pea 676(a0)
    2366:	4879 0000 7734 	pea 7734 <destlinezoom2>
    236c:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    236e:	2c03           	move.l d3,d6
    2370:	0686 0000 05d4 	addi.l #1492,d6
    2376:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
    237a:	2e06           	move.l d6,d7
    237c:	367c 0018      	movea.w #24,a3
    2380:	7a00           	moveq #0,d5
    2382:	3a02           	move.w d2,d5
    2384:	2447           	movea.l d7,a2
    2386:	45ea fd00      	lea -768(a2),a2
    238a:	4deb fff3      	lea -13(a3),a6
    238e:	2805           	move.l d5,d4
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    2390:	2f0e           	move.l a6,-(sp)
    2392:	2f04           	move.l d4,-(sp)
    2394:	2f0a           	move.l a2,-(sp)
    2396:	4879 0000 7734 	pea 7734 <destlinezoom2>
    239c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    239e:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    23a2:	4642           	not.w d2
    23a4:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    23a6:	4fef 0010      	lea 16(sp),sp
    23aa:	be8a           	cmp.l a2,d7
    23ac:	6722           	beq.s 23d0 <ZoomTest+0xaa4>
    23ae:	7800           	moveq #0,d4
    23b0:	3802           	move.w d2,d4
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    23b2:	2f0e           	move.l a6,-(sp)
    23b4:	2f04           	move.l d4,-(sp)
    23b6:	2f0a           	move.l a2,-(sp)
    23b8:	4879 0000 7734 	pea 7734 <destlinezoom2>
    23be:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    23c0:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    23c4:	4642           	not.w d2
    23c6:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    23c8:	4fef 0010      	lea 16(sp),sp
    23cc:	be8a           	cmp.l a2,d7
    23ce:	66de           	bne.s 23ae <ZoomTest+0xa82>
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    23d0:	7a00           	moveq #0,d5
    23d2:	3a02           	move.w d2,d5
    23d4:	2f0b           	move.l a3,-(sp)
    23d6:	2f05           	move.l d5,-(sp)
    23d8:	2f0a           	move.l a2,-(sp)
    23da:	4879 0000 7734 	pea 7734 <destlinezoom2>
    23e0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    23e2:	486b 0001      	pea 1(a3)
    23e6:	2f05           	move.l d5,-(sp)
    23e8:	486a 0030      	pea 48(a2)
    23ec:	4879 0000 7734 	pea 7734 <destlinezoom2>
    23f2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    23f4:	4fef 0020      	lea 32(sp),sp
    23f8:	486b 0002      	pea 2(a3)
    23fc:	2f04           	move.l d4,-(sp)
    23fe:	486a 0060      	pea 96(a2)
    2402:	4879 0000 7734 	pea 7734 <destlinezoom2>
    2408:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    240a:	486b 0003      	pea 3(a3)
    240e:	2f04           	move.l d4,-(sp)
    2410:	486a 0090      	pea 144(a2)
    2414:	4879 0000 7734 	pea 7734 <destlinezoom2>
    241a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    241c:	2e0a           	move.l a2,d7
    241e:	0687 0000 03c0 	addi.l #960,d7
    2424:	47eb 0011      	lea 17(a3),a3
  for(int i=0;i<12;i++) {
    2428:	4fef 0020      	lea 32(sp),sp
    242c:	b6fc 00e4      	cmpa.w #228,a3
    2430:	6600 ff52      	bne.w 2384 <ZoomTest+0xa58>
    2434:	2003           	move.l d3,d0
    2436:	0680 0000 2fd4 	addi.l #12244,d0
    243c:	2f40 0068      	move.l d0,104(sp)
    2440:	2440           	movea.l d0,a2
  for(int i2=0;i2<15;i2++) { 
    2442:	7800           	moveq #0,d4
    TestRow( valsupposed, valactual, mask, i2);
    2444:	2f04           	move.l d4,-(sp)
    2446:	2f05           	move.l d5,-(sp)
    2448:	2f0a           	move.l a2,-(sp)
    244a:	4879 0000 7734 	pea 7734 <destlinezoom2>
    2450:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2452:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2456:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    2458:	5284           	addq.l #1,d4
    245a:	4fef 0010      	lea 16(sp),sp
    245e:	720f           	moveq #15,d1
    2460:	b284           	cmp.l d4,d1
    2462:	6724           	beq.s 2488 <ZoomTest+0xb5c>
    2464:	7a00           	moveq #0,d5
    2466:	3a02           	move.w d2,d5
    TestRow( valsupposed, valactual, mask, i2);
    2468:	2f04           	move.l d4,-(sp)
    246a:	2f05           	move.l d5,-(sp)
    246c:	2f0a           	move.l a2,-(sp)
    246e:	4879 0000 7734 	pea 7734 <destlinezoom2>
    2474:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2476:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    247a:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    247c:	5284           	addq.l #1,d4
    247e:	4fef 0010      	lea 16(sp),sp
    2482:	720f           	moveq #15,d1
    2484:	b284           	cmp.l d4,d1
    2486:	66dc           	bne.s 2464 <ZoomTest+0xb38>
  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    2488:	4878 0001      	pea 1 <_start+0x1>
    248c:	4878 0002      	pea 2 <_start+0x2>
    2490:	2f0c           	move.l a4,-(sp)
    2492:	2f03           	move.l d3,-(sp)
    2494:	4eba ea6c      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2498:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    249e:	4eae ff1c      	jsr -228(a6)
    24a2:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    24a6:	246f 0034      	movea.l 52(sp),a2
  for(int i2=0;i2<4;i2++) { 
    24aa:	7400           	moveq #0,d2
  mask = 0xffff;
    24ac:	78ff           	moveq #-1,d4
    TestRow( valsupposed, valactual, mask, i2);
    24ae:	2f02           	move.l d2,-(sp)
    24b0:	3f04           	move.w d4,-(sp)
    24b2:	4267           	clr.w -(sp)
    24b4:	2f0a           	move.l a2,-(sp)
    24b6:	4879 0000 7708 	pea 7708 <destlinezoom3>
    24bc:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    24be:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    24c2:	4644           	not.w d4
  for(int i2=0;i2<4;i2++) { 
    24c4:	5282           	addq.l #1,d2
    24c6:	4fef 0010      	lea 16(sp),sp
    24ca:	7004           	moveq #4,d0
    24cc:	b082           	cmp.l d2,d0
    24ce:	66de           	bne.s 24ae <ZoomTest+0xb82>
  TestRow( valsupposed, valactual, 0xffff, 0+4);
    24d0:	4878 0004      	pea 4 <_start+0x4>
    24d4:	2f3c 0000 ffff 	move.l #65535,-(sp)
    24da:	486c 00c4      	pea 196(a4)
    24de:	4879 0000 7708 	pea 7708 <destlinezoom3>
    24e4:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    24e6:	4878 0005      	pea 5 <_start+0x5>
    24ea:	2f3c 0000 ffff 	move.l #65535,-(sp)
    24f0:	486c 00f4      	pea 244(a4)
    24f4:	4879 0000 7708 	pea 7708 <destlinezoom3>
    24fa:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    24fc:	4fef 0020      	lea 32(sp),sp
    2500:	4878 0006      	pea 6 <main>
    2504:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
    2506:	41ec 0124      	lea 292(a4),a0
    250a:	2f48 0060      	move.l a0,96(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    250e:	2f08           	move.l a0,-(sp)
    2510:	4879 0000 7708 	pea 7708 <destlinezoom3>
    2516:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    2518:	4878 0007      	pea 7 <main+0x1>
    251c:	42a7           	clr.l -(sp)
    251e:	486c 0154      	pea 340(a4)
    2522:	4879 0000 7708 	pea 7708 <destlinezoom3>
    2528:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    252a:	4fef 0020      	lea 32(sp),sp
    252e:	4878 0008      	pea 8 <main+0x2>
    2532:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2538:	486c 0184      	pea 388(a4)
    253c:	4879 0000 7708 	pea 7708 <destlinezoom3>
    2542:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2544:	4878 0009      	pea 9 <main+0x3>
    2548:	2f3c 0000 ffff 	move.l #65535,-(sp)
    254e:	486c 01b4      	pea 436(a4)
    2552:	4879 0000 7708 	pea 7708 <destlinezoom3>
    2558:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    255a:	280c           	move.l a4,d4
    255c:	0684 0000 04b4 	addi.l #1204,d4
    2562:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2566:	367c 0018      	movea.w #24,a3
    256a:	7a00           	moveq #0,d5
    256c:	74ff           	moveq #-1,d2
    256e:	2444           	movea.l d4,a2
    2570:	45ea fd30      	lea -720(a2),a2
    2574:	4deb fff1      	lea -15(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2578:	2f0e           	move.l a6,-(sp)
    257a:	2f05           	move.l d5,-(sp)
    257c:	2f0a           	move.l a2,-(sp)
    257e:	4879 0000 7708 	pea 7708 <destlinezoom3>
    2584:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2586:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    258a:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    258c:	4fef 0010      	lea 16(sp),sp
    2590:	b88a           	cmp.l a2,d4
    2592:	6722           	beq.s 25b6 <ZoomTest+0xc8a>
    2594:	7a00           	moveq #0,d5
    2596:	3a02           	move.w d2,d5
    2598:	4642           	not.w d2
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    259a:	2f0e           	move.l a6,-(sp)
    259c:	2f05           	move.l d5,-(sp)
    259e:	2f0a           	move.l a2,-(sp)
    25a0:	4879 0000 7708 	pea 7708 <destlinezoom3>
    25a6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    25a8:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    25ac:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    25ae:	4fef 0010      	lea 16(sp),sp
    25b2:	b88a           	cmp.l a2,d4
    25b4:	66de           	bne.s 2594 <ZoomTest+0xc68>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    25b6:	7800           	moveq #0,d4
    25b8:	3802           	move.w d2,d4
    25ba:	2f0b           	move.l a3,-(sp)
    25bc:	2f04           	move.l d4,-(sp)
    25be:	2f0a           	move.l a2,-(sp)
    25c0:	4879 0000 7708 	pea 7708 <destlinezoom3>
    25c6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    25c8:	486b 0001      	pea 1(a3)
    25cc:	2f04           	move.l d4,-(sp)
    25ce:	486a 0030      	pea 48(a2)
    25d2:	4879 0000 7708 	pea 7708 <destlinezoom3>
    25d8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    25da:	4fef 0020      	lea 32(sp),sp
    25de:	486b 0002      	pea 2(a3)
    25e2:	2f05           	move.l d5,-(sp)
    25e4:	486a 0060      	pea 96(a2)
    25e8:	4879 0000 7708 	pea 7708 <destlinezoom3>
    25ee:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    25f0:	486b 0003      	pea 3(a3)
    25f4:	2f05           	move.l d5,-(sp)
    25f6:	486a 0090      	pea 144(a2)
    25fa:	4879 0000 7708 	pea 7708 <destlinezoom3>
    2600:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2602:	4fef 0020      	lea 32(sp),sp
    2606:	486b 0004      	pea 4(a3)
    260a:	2f04           	move.l d4,-(sp)
    260c:	486a 00c0      	pea 192(a2)
    2610:	4879 0000 7708 	pea 7708 <destlinezoom3>
    2616:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2618:	486b 0005      	pea 5(a3)
    261c:	2f04           	move.l d4,-(sp)
    261e:	486a 00f0      	pea 240(a2)
    2622:	4879 0000 7708 	pea 7708 <destlinezoom3>
    2628:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    262a:	280a           	move.l a2,d4
    262c:	0684 0000 03f0 	addi.l #1008,d4
    2632:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    2636:	4fef 0020      	lea 32(sp),sp
    263a:	b6fc 0114      	cmpa.w #276,a3
    263e:	6600 ff2e      	bne.w 256e <ZoomTest+0xc42>
    2642:	45ec 3124      	lea 12580(a4),a2
    2646:	283c 0000 0105 	move.l #261,d4
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    264c:	2f04           	move.l d4,-(sp)
    264e:	2f05           	move.l d5,-(sp)
    2650:	2f0a           	move.l a2,-(sp)
    2652:	4879 0000 7708 	pea 7708 <destlinezoom3>
    2658:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    265a:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    265e:	5284           	addq.l #1,d4
  for(int i2=0;i2<8;i2++) {  
    2660:	4fef 0010      	lea 16(sp),sp
    2664:	0c84 0000 010d 	cmpi.l #269,d4
    266a:	6726           	beq.s 2692 <ZoomTest+0xd66>
    266c:	7a00           	moveq #0,d5
    266e:	3a02           	move.w d2,d5
    2670:	4642           	not.w d2
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    2672:	2f04           	move.l d4,-(sp)
    2674:	2f05           	move.l d5,-(sp)
    2676:	2f0a           	move.l a2,-(sp)
    2678:	4879 0000 7708 	pea 7708 <destlinezoom3>
    267e:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2680:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2684:	5284           	addq.l #1,d4
  for(int i2=0;i2<8;i2++) {  
    2686:	4fef 0010      	lea 16(sp),sp
    268a:	0c84 0000 010d 	cmpi.l #269,d4
    2690:	66da           	bne.s 266c <ZoomTest+0xd40>
  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    2692:	4878 0001      	pea 1 <_start+0x1>
    2696:	4878 0003      	pea 3 <_start+0x3>
    269a:	2f03           	move.l d3,-(sp)
    269c:	2f0c           	move.l a4,-(sp)
    269e:	4eba e862      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    26a2:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    26a8:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    26ac:	4878 0007      	pea 7 <main+0x1>
    26b0:	42a7           	clr.l -(sp)
    26b2:	2f2f 0044      	move.l 68(sp),-(sp)
    26b6:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    26bc:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    26be:	7034           	moveq #52,d0
    26c0:	d083           	add.l d3,d0
    26c2:	2f40 0060      	move.l d0,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    26c6:	4fef 0020      	lea 32(sp),sp
    26ca:	4878 0008      	pea 8 <main+0x2>
    26ce:	2f3c 0000 ffff 	move.l #65535,-(sp)
    26d4:	2f00           	move.l d0,-(sp)
    26d6:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    26dc:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    26de:	7264           	moveq #100,d1
    26e0:	d283           	add.l d3,d1
    26e2:	2f41 0060      	move.l d1,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    26e6:	4878 0009      	pea 9 <main+0x3>
    26ea:	2f3c 0000 ffff 	move.l #65535,-(sp)
    26f0:	2f01           	move.l d1,-(sp)
    26f2:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    26f8:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    26fa:	2003           	move.l d3,d0
    26fc:	0680 0000 0094 	addi.l #148,d0
    2702:	2f40 0058      	move.l d0,88(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    2706:	4fef 0020      	lea 32(sp),sp
    270a:	4878 0008      	pea 8 <main+0x2>
    270e:	42a7           	clr.l -(sp)
    2710:	2f00           	move.l d0,-(sp)
    2712:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    2718:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    271a:	4878 0009      	pea 9 <main+0x3>
    271e:	42a7           	clr.l -(sp)
    2720:	2043           	movea.l d3,a0
    2722:	4868 00c4      	pea 196(a0)
    2726:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    272c:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    272e:	2003           	move.l d3,d0
    2730:	0680 0000 00f4 	addi.l #244,d0
    2736:	2f40 0064      	move.l d0,100(sp)
  for(int i=0;i<12;i++) {
    273a:	2e03           	move.l d3,d7
    273c:	0687 0000 0394 	addi.l #916,d7
    2742:	4fef 0020      	lea 32(sp),sp
  valactual += ZMLINESIZE/2;
    2746:	367c 0018      	movea.w #24,a3
  mask = 0xffff;
    274a:	7aff           	moveq #-1,d5
    274c:	7400           	moveq #0,d2
    274e:	4642           	not.w d2
    2750:	2447           	movea.l d7,a2
    2752:	45ea fd60      	lea -672(a2),a2
    2756:	4deb fff1      	lea -15(a3),a6
    275a:	2802           	move.l d2,d4
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    275c:	2f0e           	move.l a6,-(sp)
    275e:	2f04           	move.l d4,-(sp)
    2760:	2f0a           	move.l a2,-(sp)
    2762:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    2768:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    276a:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    276e:	4645           	not.w d5
    2770:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    2772:	4fef 0010      	lea 16(sp),sp
    2776:	be8a           	cmp.l a2,d7
    2778:	6722           	beq.s 279c <ZoomTest+0xe70>
    277a:	7800           	moveq #0,d4
    277c:	3805           	move.w d5,d4
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    277e:	2f0e           	move.l a6,-(sp)
    2780:	2f04           	move.l d4,-(sp)
    2782:	2f0a           	move.l a2,-(sp)
    2784:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    278a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    278c:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2790:	4645           	not.w d5
    2792:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    2794:	4fef 0010      	lea 16(sp),sp
    2798:	be8a           	cmp.l a2,d7
    279a:	66de           	bne.s 277a <ZoomTest+0xe4e>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    279c:	7400           	moveq #0,d2
    279e:	3405           	move.w d5,d2
    27a0:	2f0b           	move.l a3,-(sp)
    27a2:	2f02           	move.l d2,-(sp)
    27a4:	2f0a           	move.l a2,-(sp)
    27a6:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    27ac:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    27ae:	486b 0001      	pea 1(a3)
    27b2:	2f02           	move.l d2,-(sp)
    27b4:	486a 0030      	pea 48(a2)
    27b8:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    27be:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    27c0:	4fef 0020      	lea 32(sp),sp
    27c4:	486b 0002      	pea 2(a3)
    27c8:	2f04           	move.l d4,-(sp)
    27ca:	486a 0060      	pea 96(a2)
    27ce:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    27d4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    27d6:	486b 0003      	pea 3(a3)
    27da:	2f04           	move.l d4,-(sp)
    27dc:	486a 0090      	pea 144(a2)
    27e0:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    27e6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    27e8:	4deb 0004      	lea 4(a3),a6
    27ec:	4fef 001c      	lea 28(sp),sp
    27f0:	2e8e           	move.l a6,(sp)
    27f2:	2f02           	move.l d2,-(sp)
    27f4:	486a 00c0      	pea 192(a2)
    27f8:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    27fe:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2800:	2e0b           	move.l a3,d7
    2802:	5a87           	addq.l #5,d7
    2804:	2f07           	move.l d7,-(sp)
    2806:	2f02           	move.l d2,-(sp)
    2808:	486a 00f0      	pea 240(a2)
    280c:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    2812:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2814:	4fef 001c      	lea 28(sp),sp
    2818:	2e8e           	move.l a6,(sp)
    281a:	2f04           	move.l d4,-(sp)
    281c:	486a 0120      	pea 288(a2)
    2820:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    2826:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2828:	2f07           	move.l d7,-(sp)
    282a:	2f04           	move.l d4,-(sp)
    282c:	486a 0150      	pea 336(a2)
    2830:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    2836:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2838:	2e0a           	move.l a2,d7
    283a:	0687 0000 0420 	addi.l #1056,d7
    2840:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    2844:	4fef 0020      	lea 32(sp),sp
    2848:	b6fc 0114      	cmpa.w #276,a3
    284c:	6600 ff02      	bne.w 2750 <ZoomTest+0xe24>
  TestRow( valsupposed, valactual, mask, 269);
    2850:	4878 010d      	pea 10d <main+0x107>
    2854:	2f02           	move.l d2,-(sp)
    2856:	2043           	movea.l d3,a0
    2858:	4868 3274      	pea 12916(a0)
    285c:	4879 0000 76dc 	pea 76dc <destlinezoom4>
    2862:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    2864:	4878 0001      	pea 1 <_start+0x1>
    2868:	4878 0004      	pea 4 <_start+0x4>
    286c:	2f0c           	move.l a4,-(sp)
    286e:	2f03           	move.l d3,-(sp)
    2870:	4eba e690      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2874:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    287a:	4eae ff1c      	jsr -228(a6)
    287e:	4fef 0020      	lea 32(sp),sp
  valactual = destination+2; 
    2882:	266f 0034      	movea.l 52(sp),a3
  for(int i2=0;i2<13;i2++) {  
    2886:	95ca           	suba.l a2,a2
  mask = 0x0000;
    2888:	4245           	clr.w d5
    TestRow( valsupposed, valactual, mask, i2);
    288a:	7400           	moveq #0,d2
    288c:	3405           	move.w d5,d2
    288e:	2f0a           	move.l a2,-(sp)
    2890:	2f02           	move.l d2,-(sp)
    2892:	2f0b           	move.l a3,-(sp)
    2894:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    289a:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    289c:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    28a0:	4645           	not.w d5
  for(int i2=0;i2<13;i2++) {  
    28a2:	528a           	addq.l #1,a2
    28a4:	4fef 0010      	lea 16(sp),sp
    28a8:	700d           	moveq #13,d0
    28aa:	b08a           	cmp.l a2,d0
    28ac:	66dc           	bne.s 288a <ZoomTest+0xf5e>
    28ae:	7800           	moveq #0,d4
    28b0:	3805           	move.w d5,d4
  TestRow( valsupposed, valactual, mask, 12);   
    28b2:	4878 000c      	pea c <main+0x6>
    28b6:	2f04           	move.l d4,-(sp)
    28b8:	486c 0274      	pea 628(a4)
    28bc:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    28c2:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 13);
    28c4:	4878 000d      	pea d <main+0x7>
    28c8:	2f04           	move.l d4,-(sp)
    28ca:	486c 02a4      	pea 676(a4)
    28ce:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    28d4:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 14);
    28d6:	4fef 0020      	lea 32(sp),sp
    28da:	4878 000e      	pea e <main+0x8>
    28de:	2f02           	move.l d2,-(sp)
    28e0:	486c 02d4      	pea 724(a4)
    28e4:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    28ea:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 15);
    28ec:	4878 000f      	pea f <main+0x9>
    28f0:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    28f2:	41ec 0304      	lea 772(a4),a0
    28f6:	2f48 0064      	move.l a0,100(sp)
  TestRow( valsupposed, valactual, mask, 15);
    28fa:	2f08           	move.l a0,-(sp)
    28fc:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2902:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 16);
    2904:	4fef 0020      	lea 32(sp),sp
    2908:	4878 0010      	pea 10 <main+0xa>
    290c:	2f04           	move.l d4,-(sp)
    290e:	486c 0334      	pea 820(a4)
    2912:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2918:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 17);
    291a:	4878 0011      	pea 11 <main+0xb>
    291e:	2f04           	move.l d4,-(sp)
    2920:	2f2f 0054      	move.l 84(sp),-(sp)
    2924:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    292a:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 18);
    292c:	4fef 0020      	lea 32(sp),sp
    2930:	4878 0012      	pea 12 <main+0xc>
    2934:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2936:	41ec 0394      	lea 916(a4),a0
    293a:	2f48 005c      	move.l a0,92(sp)
  TestRow( valsupposed, valactual, mask, 18);
    293e:	2f08           	move.l a0,-(sp)
    2940:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2946:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 19);
    2948:	4878 0013      	pea 13 <main+0xd>
    294c:	2f02           	move.l d2,-(sp)
    294e:	486c 03c4      	pea 964(a4)
    2952:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2958:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 20);
    295a:	4fef 0020      	lea 32(sp),sp
    295e:	4878 0014      	pea 14 <main+0xe>
    2962:	2f04           	move.l d4,-(sp)
    2964:	486c 03f4      	pea 1012(a4)
    2968:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    296e:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 21);
    2970:	4878 0015      	pea 15 <main+0xf>
    2974:	2f04           	move.l d4,-(sp)
    2976:	486c 0424      	pea 1060(a4)
    297a:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2980:	4e95           	jsr (a5)
  for(int i=0;i<10;i++) {
    2982:	280c           	move.l a4,d4
    2984:	0684 0000 06c4 	addi.l #1732,d4
    298a:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, mask, 21);
    298e:	347c 0023      	movea.w #35,a2
    2992:	2644           	movea.l d4,a3
    2994:	47eb fd90      	lea -624(a3),a3
    2998:	4dea fff3      	lea -13(a2),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    299c:	2f0e           	move.l a6,-(sp)
    299e:	2f02           	move.l d2,-(sp)
    29a0:	2f0b           	move.l a3,-(sp)
    29a2:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    29a8:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    29aa:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    29ae:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    29b0:	4fef 0010      	lea 16(sp),sp
    29b4:	b88b           	cmp.l a3,d4
    29b6:	6722           	beq.s 29da <ZoomTest+0x10ae>
    29b8:	7400           	moveq #0,d2
    29ba:	3405           	move.w d5,d2
    29bc:	4645           	not.w d5
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    29be:	2f0e           	move.l a6,-(sp)
    29c0:	2f02           	move.l d2,-(sp)
    29c2:	2f0b           	move.l a3,-(sp)
    29c4:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    29ca:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    29cc:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    29d0:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    29d2:	4fef 0010      	lea 16(sp),sp
    29d6:	b88b           	cmp.l a3,d4
    29d8:	66de           	bne.s 29b8 <ZoomTest+0x108c>
    TestRow( valsupposed, valactual, mask, i*21+22+13);
    29da:	7800           	moveq #0,d4
    29dc:	3805           	move.w d5,d4
    29de:	2f0a           	move.l a2,-(sp)
    29e0:	2f04           	move.l d4,-(sp)
    29e2:	2f0b           	move.l a3,-(sp)
    29e4:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    29ea:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    29ec:	486a 0001      	pea 1(a2)
    29f0:	2f04           	move.l d4,-(sp)
    29f2:	486b 0030      	pea 48(a3)
    29f6:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    29fc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    29fe:	4fef 0020      	lea 32(sp),sp
    2a02:	486a 0002      	pea 2(a2)
    2a06:	2f02           	move.l d2,-(sp)
    2a08:	486b 0060      	pea 96(a3)
    2a0c:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2a12:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    2a14:	486a 0003      	pea 3(a2)
    2a18:	2f02           	move.l d2,-(sp)
    2a1a:	486b 0090      	pea 144(a3)
    2a1e:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2a24:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    2a26:	4fef 0020      	lea 32(sp),sp
    2a2a:	486a 0004      	pea 4(a2)
    2a2e:	2f04           	move.l d4,-(sp)
    2a30:	486b 00c0      	pea 192(a3)
    2a34:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2a3a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    2a3c:	486a 0005      	pea 5(a2)
    2a40:	2f04           	move.l d4,-(sp)
    2a42:	486b 00f0      	pea 240(a3)
    2a46:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2a4c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    2a4e:	4fef 0020      	lea 32(sp),sp
    2a52:	486a 0006      	pea 6(a2)
    2a56:	2f02           	move.l d2,-(sp)
    2a58:	486b 0120      	pea 288(a3)
    2a5c:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2a62:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    2a64:	486a 0007      	pea 7(a2)
    2a68:	2f02           	move.l d2,-(sp)
    2a6a:	486b 0150      	pea 336(a3)
    2a6e:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2a74:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    2a76:	4fef 0020      	lea 32(sp),sp
    2a7a:	486a 0008      	pea 8(a2)
    2a7e:	2f04           	move.l d4,-(sp)
    2a80:	486b 0180      	pea 384(a3)
    2a84:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2a8a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    2a8c:	486a 0009      	pea 9(a2)
    2a90:	2f04           	move.l d4,-(sp)
    2a92:	486b 01b0      	pea 432(a3)
    2a96:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2a9c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2a9e:	280b           	move.l a3,d4
    2aa0:	0684 0000 0450 	addi.l #1104,d4
    2aa6:	45ea 0015      	lea 21(a2),a2
  for(int i=0;i<10;i++) {
    2aaa:	4fef 0020      	lea 32(sp),sp
    2aae:	b4fc 00f5      	cmpa.w #245,a2
    2ab2:	6600 fede      	bne.w 2992 <ZoomTest+0x1066>
    2ab6:	47ec 2f74      	lea 12148(a4),a3
    2aba:	7e02           	moveq #2,d7
    2abc:	4607           	not.b d7
    TestRow( valsupposed, valactual, mask, i2+253);
    2abe:	2f07           	move.l d7,-(sp)
    2ac0:	2f02           	move.l d2,-(sp)
    2ac2:	2f0b           	move.l a3,-(sp)
    2ac4:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2aca:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2acc:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2ad0:	5287           	addq.l #1,d7
  for(int i2=0;i2<13;i2++) {  
    2ad2:	4fef 0010      	lea 16(sp),sp
    2ad6:	0c87 0000 010a 	cmpi.l #266,d7
    2adc:	6726           	beq.s 2b04 <ZoomTest+0x11d8>
    2ade:	7400           	moveq #0,d2
    2ae0:	3405           	move.w d5,d2
    2ae2:	4645           	not.w d5
    TestRow( valsupposed, valactual, mask, i2+253);
    2ae4:	2f07           	move.l d7,-(sp)
    2ae6:	2f02           	move.l d2,-(sp)
    2ae8:	2f0b           	move.l a3,-(sp)
    2aea:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2af0:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2af2:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2af6:	5287           	addq.l #1,d7
  for(int i2=0;i2<13;i2++) {  
    2af8:	4fef 0010      	lea 16(sp),sp
    2afc:	0c87 0000 010a 	cmpi.l #266,d7
    2b02:	66da           	bne.s 2ade <ZoomTest+0x11b2>
    2b04:	0285 0000 ffff 	andi.l #65535,d5
  TestRow( valsupposed, valactual, mask, 266);
    2b0a:	2f07           	move.l d7,-(sp)
    2b0c:	2f05           	move.l d5,-(sp)
    2b0e:	2f2f 0038      	move.l 56(sp),-(sp)
    2b12:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2b18:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 267);
    2b1a:	4878 010b      	pea 10b <main+0x105>
    2b1e:	2f05           	move.l d5,-(sp)
  valactual += ZMLINESIZE/2;
    2b20:	41ec 3214      	lea 12820(a4),a0
    2b24:	2f48 0074      	move.l a0,116(sp)
  TestRow( valsupposed, valactual, mask, 267);
    2b28:	2f08           	move.l a0,-(sp)
    2b2a:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2b30:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    2b32:	4fef 0020      	lea 32(sp),sp
    2b36:	4878 010c      	pea 10c <main+0x106>
    2b3a:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2b3c:	41ec 3244      	lea 12868(a4),a0
    2b40:	2f48 0068      	move.l a0,104(sp)
  TestRow( valsupposed, valactual, mask, 268);
    2b44:	2f08           	move.l a0,-(sp)
    2b46:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2b4c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    2b4e:	4878 010d      	pea 10d <main+0x107>
    2b52:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2b54:	41ec 3274      	lea 12916(a4),a0
    2b58:	2f48 0054      	move.l a0,84(sp)
  TestRow( valsupposed, valactual, mask, 269);
    2b5c:	2f08           	move.l a0,-(sp)
    2b5e:	4879 0000 76b0 	pea 76b0 <destlinezoom5>
    2b64:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    2b66:	4fef 0020      	lea 32(sp),sp
    2b6a:	4878 0001      	pea 1 <_start+0x1>
    2b6e:	4878 0005      	pea 5 <_start+0x5>
    2b72:	2f03           	move.l d3,-(sp)
    2b74:	2f0c           	move.l a4,-(sp)
    2b76:	4eba e38a      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2b7a:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    2b80:	4eae ff1c      	jsr -228(a6)
    2b84:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    2b88:	266f 002c      	movea.l 44(sp),a3
  for(int i2=0;i2<7;i2++) {  
    2b8c:	7800           	moveq #0,d4
  mask = 0x0000;
    2b8e:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    2b90:	2f04           	move.l d4,-(sp)
    2b92:	3f02           	move.w d2,-(sp)
    2b94:	4267           	clr.w -(sp)
    2b96:	2f0b           	move.l a3,-(sp)
    2b98:	4879 0000 7684 	pea 7684 <destlinezoom6>
    2b9e:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2ba0:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2ba4:	4642           	not.w d2
  for(int i2=0;i2<7;i2++) {  
    2ba6:	5284           	addq.l #1,d4
    2ba8:	4fef 0010      	lea 16(sp),sp
    2bac:	7007           	moveq #7,d0
    2bae:	b084           	cmp.l d4,d0
    2bb0:	66de           	bne.s 2b90 <ZoomTest+0x1264>
    2bb2:	2c43           	movea.l d3,a6
    2bb4:	4dee 0154      	lea 340(a6),a6
    2bb8:	367c 0007      	movea.w #7,a3
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    2bbc:	7800           	moveq #0,d4
    2bbe:	3802           	move.w d2,d4
    2bc0:	2f0b           	move.l a3,-(sp)
    2bc2:	2f04           	move.l d4,-(sp)
    2bc4:	2f0e           	move.l a6,-(sp)
    2bc6:	4879 0000 7684 	pea 7684 <destlinezoom6>
    2bcc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    2bce:	486b 0001      	pea 1(a3)
    2bd2:	2f04           	move.l d4,-(sp)
    2bd4:	486e 0030      	pea 48(a6)
    2bd8:	4879 0000 7684 	pea 7684 <destlinezoom6>
    2bde:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2be0:	4642           	not.w d2
    2be2:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    2be4:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<6;i++) {
    2be8:	4fef 0020      	lea 32(sp),sp
    2bec:	7213           	moveq #19,d1
    2bee:	b28b           	cmp.l a3,d1
    2bf0:	66ca           	bne.s 2bbc <ZoomTest+0x1290>
    2bf2:	2a0a           	move.l a2,d5
    2bf4:	2c46           	movea.l d6,a6
    2bf6:	4dee fdc0      	lea -576(a6),a6
  for(int i2=0;i2<7;i2++) {  
    2bfa:	280b           	move.l a3,d4
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    2bfc:	2f04           	move.l d4,-(sp)
    2bfe:	3f02           	move.w d2,-(sp)
    2c00:	4267           	clr.w -(sp)
    2c02:	2f0e           	move.l a6,-(sp)
    2c04:	4879 0000 7684 	pea 7684 <destlinezoom6>
    2c0a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2c0c:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2c10:	4642           	not.w d2
    2c12:	5284           	addq.l #1,d4
    for(int i2=0;i2<12;i2++) {  
    2c14:	4fef 0010      	lea 16(sp),sp
    2c18:	bc8e           	cmp.l a6,d6
    2c1a:	66e0           	bne.s 2bfc <ZoomTest+0x12d0>
    2c1c:	347c 001f      	movea.w #31,a2
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    2c20:	7800           	moveq #0,d4
    2c22:	3802           	move.w d2,d4
    2c24:	2f0a           	move.l a2,-(sp)
    2c26:	2f04           	move.l d4,-(sp)
    2c28:	2f0e           	move.l a6,-(sp)
    2c2a:	4879 0000 7684 	pea 7684 <destlinezoom6>
    2c30:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    2c32:	486a 0001      	pea 1(a2)
    2c36:	2f04           	move.l d4,-(sp)
    2c38:	486e 0030      	pea 48(a6)
    2c3c:	4879 0000 7684 	pea 7684 <destlinezoom6>
    2c42:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2c44:	4642           	not.w d2
    2c46:	45ea 0018      	lea 24(a2),a2
      valactual += ZMLINESIZE/2;
    2c4a:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<6;i++) {
    2c4e:	4fef 0020      	lea 32(sp),sp
    2c52:	b4fc 00af      	cmpa.w #175,a2
    2c56:	66c8           	bne.s 2c20 <ZoomTest+0x12f4>
    2c58:	0686 0000 0480 	addi.l #1152,d6
    2c5e:	47eb 0018      	lea 24(a3),a3
  for(int i=0;i<10;i++) {
    2c62:	b6fc 0103      	cmpa.w #259,a3
    2c66:	668c           	bne.s 2bf4 <ZoomTest+0x12c8>
    2c68:	2445           	movea.l d5,a2
    2c6a:	2c43           	movea.l d3,a6
    2c6c:	4dee 3094      	lea 12436(a6),a6
    2c70:	283c 0000 0102 	move.l #258,d4
    TestRow( valsupposed, valactual, mask, 258+i2);
    2c76:	2f04           	move.l d4,-(sp)
    2c78:	3f02           	move.w d2,-(sp)
    2c7a:	4267           	clr.w -(sp)
    2c7c:	2f0e           	move.l a6,-(sp)
    2c7e:	4879 0000 7684 	pea 7684 <destlinezoom6>
    2c84:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2c86:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2c8a:	4642           	not.w d2
    2c8c:	5284           	addq.l #1,d4
  for(int i2=0;i2<11;i2++) {  
    2c8e:	4fef 0010      	lea 16(sp),sp
    2c92:	0c84 0000 010d 	cmpi.l #269,d4
    2c98:	66dc           	bne.s 2c76 <ZoomTest+0x134a>
  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    2c9a:	4878 0001      	pea 1 <_start+0x1>
    2c9e:	4878 0006      	pea 6 <main>
    2ca2:	2f0c           	move.l a4,-(sp)
    2ca4:	2f03           	move.l d3,-(sp)
    2ca6:	4eba e25a      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2caa:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    2cb0:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2cb4:	42a7           	clr.l -(sp)
    2cb6:	42a7           	clr.l -(sp)
    2cb8:	2f2f 004c      	move.l 76(sp),-(sp)
    2cbc:	4879 0000 7658 	pea 7658 <destlinezoom7>
    2cc2:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    2cc4:	41ec 0034      	lea 52(a4),a0
    2cc8:	2f48 0068      	move.l a0,104(sp)
    2ccc:	4fef 0020      	lea 32(sp),sp
    2cd0:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    2cd4:	7eff           	moveq #-1,d7
    2cd6:	280a           	move.l a2,d4
    2cd8:	2448           	movea.l a0,a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2cda:	7400           	moveq #0,d2
    2cdc:	3407           	move.w d7,d2
    2cde:	2f0e           	move.l a6,-(sp)
    2ce0:	2f02           	move.l d2,-(sp)
    2ce2:	2f0a           	move.l a2,-(sp)
    2ce4:	4879 0000 7658 	pea 7658 <destlinezoom7>
    2cea:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2cec:	486e 0001      	pea 1(a6)
    2cf0:	2f02           	move.l d2,-(sp)
    2cf2:	486a 0030      	pea 48(a2)
    2cf6:	4879 0000 7658 	pea 7658 <destlinezoom7>
    2cfc:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2cfe:	4647           	not.w d7
    2d00:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2d02:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<7;i++) {
    2d06:	4fef 0020      	lea 32(sp),sp
    2d0a:	700f           	moveq #15,d0
    2d0c:	b08e           	cmp.l a6,d0
    2d0e:	66ca           	bne.s 2cda <ZoomTest+0x13ae>
    2d10:	240c           	move.l a4,d2
    2d12:	0682 0000 04e4 	addi.l #1252,d2
    2d18:	2a04           	move.l d4,d5
    2d1a:	2c0b           	move.l a3,d6
    2d1c:	264e           	movea.l a6,a3
    2d1e:	2c42           	movea.l d2,a6
    2d20:	4dee fdf0      	lea -528(a6),a6
  mask = mask ^ 0xffff;
    2d24:	280b           	move.l a3,d4
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    2d26:	2f04           	move.l d4,-(sp)
    2d28:	3f07           	move.w d7,-(sp)
    2d2a:	4267           	clr.w -(sp)
    2d2c:	2f0e           	move.l a6,-(sp)
    2d2e:	4879 0000 7658 	pea 7658 <destlinezoom7>
    2d34:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2d36:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2d3a:	4647           	not.w d7
    2d3c:	5284           	addq.l #1,d4
    for(int i2=0;i2<11;i2++) {  
    2d3e:	4fef 0010      	lea 16(sp),sp
    2d42:	b48e           	cmp.l a6,d2
    2d44:	66e0           	bne.s 2d26 <ZoomTest+0x13fa>
    2d46:	347c 001a      	movea.w #26,a2
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    2d4a:	7800           	moveq #0,d4
    2d4c:	3807           	move.w d7,d4
    2d4e:	2f0a           	move.l a2,-(sp)
    2d50:	2f04           	move.l d4,-(sp)
    2d52:	2f0e           	move.l a6,-(sp)
    2d54:	4879 0000 7658 	pea 7658 <destlinezoom7>
    2d5a:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    2d5c:	2f0a           	move.l a2,-(sp)
    2d5e:	2f04           	move.l d4,-(sp)
    2d60:	486e 0030      	pea 48(a6)
    2d64:	4879 0000 7658 	pea 7658 <destlinezoom7>
    2d6a:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2d6c:	4647           	not.w d7
    2d6e:	45ea 0019      	lea 25(a2),a2
      valactual += ZMLINESIZE/2;
    2d72:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<7;i++) {
    2d76:	4fef 0020      	lea 32(sp),sp
    2d7a:	b4fc 00c9      	cmpa.w #201,a2
    2d7e:	66ca           	bne.s 2d4a <ZoomTest+0x141e>
    2d80:	0682 0000 04b0 	addi.l #1200,d2
    2d86:	47eb 0019      	lea 25(a3),a3
  for(int i=0;i<10;i++) {
    2d8a:	b6fc 0109      	cmpa.w #265,a3
    2d8e:	668e           	bne.s 2d1e <ZoomTest+0x13f2>
    2d90:	2445           	movea.l d5,a2
    2d92:	2646           	movea.l d6,a3
    2d94:	4dec 31b4      	lea 12724(a4),a6
    2d98:	243c 0000 0100 	move.l #256,d2
    TestRow( valsupposed, valactual, mask, 256+i2);
    2d9e:	2f02           	move.l d2,-(sp)
    2da0:	3f07           	move.w d7,-(sp)
    2da2:	4267           	clr.w -(sp)
    2da4:	2f0e           	move.l a6,-(sp)
    2da6:	4879 0000 7658 	pea 7658 <destlinezoom7>
    2dac:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2dae:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2db2:	4647           	not.w d7
    2db4:	5282           	addq.l #1,d2
  for(int i2=0;i2<5;i2++) {  
    2db6:	4fef 0010      	lea 16(sp),sp
    2dba:	0c82 0000 0105 	cmpi.l #261,d2
    2dc0:	66dc           	bne.s 2d9e <ZoomTest+0x1472>
  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    2dc2:	4878 0001      	pea 1 <_start+0x1>
    2dc6:	4878 0007      	pea 7 <main+0x1>
    2dca:	2f03           	move.l d3,-(sp)
    2dcc:	2f0c           	move.l a4,-(sp)
    2dce:	4eba e132      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2dd2:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    2dd8:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2ddc:	42a7           	clr.l -(sp)
    2dde:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2de4:	2f2f 0044      	move.l 68(sp),-(sp)
    2de8:	4879 0000 762c 	pea 762c <destlinezoom8>
    2dee:	4e95           	jsr (a5)
    2df0:	4fef 0020      	lea 32(sp),sp
    2df4:	2f6f 0038 0030 	move.l 56(sp),48(sp)
  valactual += ZMLINESIZE/2;
    2dfa:	242f 0040      	move.l 64(sp),d2
  TestRow( valsupposed, valactual, mask, 0);
    2dfe:	7801           	moveq #1,d4
  mask = mask ^ 0xffff;
    2e00:	4245           	clr.w d5
    2e02:	2c2f 0030      	move.l 48(sp),d6
    2e06:	2c44           	movea.l d4,a6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2e08:	7800           	moveq #0,d4
    2e0a:	3805           	move.w d5,d4
    2e0c:	2f0e           	move.l a6,-(sp)
    2e0e:	2f04           	move.l d4,-(sp)
    2e10:	2f02           	move.l d2,-(sp)
    2e12:	4879 0000 762c 	pea 762c <destlinezoom8>
    2e18:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2e1a:	486e 0001      	pea 1(a6)
    2e1e:	2f04           	move.l d4,-(sp)
    2e20:	2042           	movea.l d2,a0
    2e22:	4868 0030      	pea 48(a0)
    2e26:	4879 0000 762c 	pea 762c <destlinezoom8>
    2e2c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2e2e:	4645           	not.w d5
    2e30:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    2e32:	4fef 0020      	lea 32(sp),sp
    2e36:	700b           	moveq #11,d0
    2e38:	b08e           	cmp.l a6,d0
    2e3a:	6740           	beq.s 2e7c <ZoomTest+0x1550>
    2e3c:	2002           	move.l d2,d0
    2e3e:	0680 0000 00c0 	addi.l #192,d0
    2e44:	2406           	move.l d6,d2
    2e46:	2c00           	move.l d0,d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2e48:	7800           	moveq #0,d4
    2e4a:	3805           	move.w d5,d4
    2e4c:	2f0e           	move.l a6,-(sp)
    2e4e:	2f04           	move.l d4,-(sp)
    2e50:	2f02           	move.l d2,-(sp)
    2e52:	4879 0000 762c 	pea 762c <destlinezoom8>
    2e58:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2e5a:	486e 0001      	pea 1(a6)
    2e5e:	2f04           	move.l d4,-(sp)
    2e60:	2042           	movea.l d2,a0
    2e62:	4868 0030      	pea 48(a0)
    2e66:	4879 0000 762c 	pea 762c <destlinezoom8>
    2e6c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2e6e:	4645           	not.w d5
    2e70:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    2e72:	4fef 0020      	lea 32(sp),sp
    2e76:	700b           	moveq #11,d0
    2e78:	b08e           	cmp.l a6,d0
    2e7a:	66c0           	bne.s 2e3c <ZoomTest+0x1510>
    2e7c:	2f46 0030      	move.l d6,48(sp)
    2e80:	280e           	move.l a6,d4
    2e82:	2e06           	move.l d6,d7
    2e84:	0687 0000 01e0 	addi.l #480,d7
    2e8a:	327c 0015      	movea.w #21,a1
    2e8e:	2f4a 006c      	move.l a2,108(sp)
    2e92:	2449           	movea.l a1,a2
    2e94:	2f4b 0070      	move.l a3,112(sp)
    2e98:	2c47           	movea.l d7,a6
    2e9a:	4dee fe20      	lea -480(a6),a6
    2e9e:	47ea fff6      	lea -10(a2),a3
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    2ea2:	2f0b           	move.l a3,-(sp)
    2ea4:	3f05           	move.w d5,-(sp)
    2ea6:	4267           	clr.w -(sp)
    2ea8:	2f0e           	move.l a6,-(sp)
    2eaa:	4879 0000 762c 	pea 762c <destlinezoom8>
    2eb0:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2eb2:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2eb6:	4645           	not.w d5
    2eb8:	528b           	addq.l #1,a3
    for(int i2=0;i2<10;i2++) {  
    2eba:	4fef 0010      	lea 16(sp),sp
    2ebe:	be8e           	cmp.l a6,d7
    2ec0:	66e0           	bne.s 2ea2 <ZoomTest+0x1576>
    2ec2:	240a           	move.l a2,d2
    2ec4:	2c0e           	move.l a6,d6
    2ec6:	0686 0000 0300 	addi.l #768,d6
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    2ecc:	7200           	moveq #0,d1
    2ece:	3205           	move.w d5,d1
    2ed0:	2641           	movea.l d1,a3
    2ed2:	2f02           	move.l d2,-(sp)
    2ed4:	2f0b           	move.l a3,-(sp)
    2ed6:	2f0e           	move.l a6,-(sp)
    2ed8:	4879 0000 762c 	pea 762c <destlinezoom8>
    2ede:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    2ee0:	2f02           	move.l d2,-(sp)
    2ee2:	2f0b           	move.l a3,-(sp)
    2ee4:	486e 0030      	pea 48(a6)
    2ee8:	4879 0000 762c 	pea 762c <destlinezoom8>
    2eee:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2ef0:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    2ef4:	4645           	not.w d5
    2ef6:	5282           	addq.l #1,d2
    for(int i2=0;i2<8;i2++) {
    2ef8:	4fef 0020      	lea 32(sp),sp
    2efc:	bc8e           	cmp.l a6,d6
    2efe:	66cc           	bne.s 2ecc <ZoomTest+0x15a0>
    2f00:	0687 0000 04e0 	addi.l #1248,d7
    2f06:	45ea 001a      	lea 26(a2),a2
  for(int i=0;i<9;i++) {
    2f0a:	b4fc 00ff      	cmpa.w #255,a2
    2f0e:	6688           	bne.s 2e98 <ZoomTest+0x156c>
    2f10:	246f 006c      	movea.l 108(sp),a2
    2f14:	266f 0070      	movea.l 112(sp),a3
    2f18:	2c2f 0030      	move.l 48(sp),d6
    2f1c:	0686 0000 2be0 	addi.l #11232,d6
    2f22:	240a           	move.l a2,d2
    2f24:	2c46           	movea.l d6,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    2f26:	2f02           	move.l d2,-(sp)
    2f28:	3f05           	move.w d5,-(sp)
    2f2a:	4267           	clr.w -(sp)
    2f2c:	2f0e           	move.l a6,-(sp)
    2f2e:	4879 0000 762c 	pea 762c <destlinezoom8>
    2f34:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2f36:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2f3a:	4645           	not.w d5
    2f3c:	5282           	addq.l #1,d2
  for(int i2=0;i2<10;i2++) {  
    2f3e:	4fef 0010      	lea 16(sp),sp
    2f42:	0c82 0000 00ff 	cmpi.l #255,d2
    2f48:	66dc           	bne.s 2f26 <ZoomTest+0x15fa>
    2f4a:	2c2f 0030      	move.l 48(sp),d6
    2f4e:	0686 0000 2dc0 	addi.l #11712,d6
    2f54:	2c42           	movea.l d2,a6
    2f56:	2e0a           	move.l a2,d7
    2f58:	2446           	movea.l d6,a2
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    2f5a:	7c00           	moveq #0,d6
    2f5c:	3c05           	move.w d5,d6
    2f5e:	2f0e           	move.l a6,-(sp)
    2f60:	2f06           	move.l d6,-(sp)
    2f62:	2f0a           	move.l a2,-(sp)
    2f64:	4879 0000 762c 	pea 762c <destlinezoom8>
    2f6a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    2f6c:	486e 0001      	pea 1(a6)
    2f70:	2f06           	move.l d6,-(sp)
    2f72:	486a 0030      	pea 48(a2)
    2f76:	4879 0000 762c 	pea 762c <destlinezoom8>
    2f7c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2f7e:	4645           	not.w d5
    2f80:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2f82:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<7;i++) {
    2f86:	4fef 0020      	lea 32(sp),sp
    2f8a:	bcfc 010d      	cmpa.w #269,a6
    2f8e:	66ca           	bne.s 2f5a <ZoomTest+0x162e>
    2f90:	2447           	movea.l d7,a2
  TestRow( valsupposed, valactual, mask, 269);
    2f92:	2f0e           	move.l a6,-(sp)
    2f94:	3f05           	move.w d5,-(sp)
    2f96:	4267           	clr.w -(sp)
    2f98:	206f 0038      	movea.l 56(sp),a0
    2f9c:	4868 3060      	pea 12384(a0)
    2fa0:	4879 0000 762c 	pea 762c <destlinezoom8>
    2fa6:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    2fa8:	4878 0001      	pea 1 <_start+0x1>
    2fac:	4878 0008      	pea 8 <main+0x2>
    2fb0:	2f0c           	move.l a4,-(sp)
    2fb2:	2f03           	move.l d3,-(sp)
    2fb4:	4eba df4c      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2fb8:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    2fbe:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2fc2:	4fef 001c      	lea 28(sp),sp
    2fc6:	4297           	clr.l (sp)
    2fc8:	42a7           	clr.l -(sp)
    2fca:	2f2f 003c      	move.l 60(sp),-(sp)
    2fce:	4879 0000 7600 	pea 7600 <destlinezoom9>
    2fd4:	4e95           	jsr (a5)
    2fd6:	4fef 0010      	lea 16(sp),sp
    2fda:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    2fde:	7cff           	moveq #-1,d6
    2fe0:	2e0a           	move.l a2,d7
    2fe2:	246f 0048      	movea.l 72(sp),a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2fe6:	7a00           	moveq #0,d5
    2fe8:	3a06           	move.w d6,d5
    2fea:	2f0e           	move.l a6,-(sp)
    2fec:	2f05           	move.l d5,-(sp)
    2fee:	2f0a           	move.l a2,-(sp)
    2ff0:	4879 0000 7600 	pea 7600 <destlinezoom9>
    2ff6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2ff8:	486e 0001      	pea 1(a6)
    2ffc:	2f05           	move.l d5,-(sp)
    2ffe:	486a 0030      	pea 48(a2)
    3002:	4879 0000 7600 	pea 7600 <destlinezoom9>
    3008:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    300a:	4646           	not.w d6
    300c:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    300e:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<3;i++) {
    3012:	4fef 0020      	lea 32(sp),sp
    3016:	7007           	moveq #7,d0
    3018:	b08e           	cmp.l a6,d0
    301a:	66ca           	bne.s 2fe6 <ZoomTest+0x16ba>
    301c:	2a2f 004c      	move.l 76(sp),d5
    3020:	307c 0014      	movea.w #20,a0
    3024:	2f47 0030      	move.l d7,48(sp)
    3028:	2f4b 0048      	move.l a3,72(sp)
    302c:	2f42 004c      	move.l d2,76(sp)
    3030:	2448           	movea.l a0,a2
    3032:	2c45           	movea.l d5,a6
    3034:	4dee fe50      	lea -432(a6),a6
    3038:	47ea fff7      	lea -9(a2),a3
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    303c:	2f0b           	move.l a3,-(sp)
    303e:	3f06           	move.w d6,-(sp)
    3040:	4267           	clr.w -(sp)
    3042:	2f0e           	move.l a6,-(sp)
    3044:	4879 0000 7600 	pea 7600 <destlinezoom9>
    304a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    304c:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3050:	4646           	not.w d6
    3052:	528b           	addq.l #1,a3
    for(int i2=0;i2<9;i2++) {  
    3054:	4fef 0010      	lea 16(sp),sp
    3058:	ba8e           	cmp.l a6,d5
    305a:	66e0           	bne.s 303c <ZoomTest+0x1710>
    305c:	2e0a           	move.l a2,d7
    305e:	47ea 0009      	lea 9(a2),a3
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    3062:	7400           	moveq #0,d2
    3064:	3406           	move.w d6,d2
    3066:	2f07           	move.l d7,-(sp)
    3068:	2f02           	move.l d2,-(sp)
    306a:	2f0e           	move.l a6,-(sp)
    306c:	4879 0000 7600 	pea 7600 <destlinezoom9>
    3072:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    3074:	5287           	addq.l #1,d7
    3076:	2f07           	move.l d7,-(sp)
    3078:	2f02           	move.l d2,-(sp)
    307a:	486e 0030      	pea 48(a6)
    307e:	4879 0000 7600 	pea 7600 <destlinezoom9>
    3084:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3086:	4646           	not.w d6
      valactual += ZMLINESIZE/2;
    3088:	4dee 0060      	lea 96(a6),a6
    for(int i2=0;i2<9;i2++) {
    308c:	4fef 0020      	lea 32(sp),sp
    3090:	be8b           	cmp.l a3,d7
    3092:	66ce           	bne.s 3062 <ZoomTest+0x1736>
    3094:	0685 0000 0510 	addi.l #1296,d5
    309a:	45ea 001b      	lea 27(a2),a2
  for(int i=0;i<9;i++) {
    309e:	b4fc 0107      	cmpa.w #263,a2
    30a2:	668e           	bne.s 3032 <ZoomTest+0x1706>
    30a4:	246f 0030      	movea.l 48(sp),a2
    30a8:	266f 0048      	movea.l 72(sp),a3
    30ac:	242f 004c      	move.l 76(sp),d2
    30b0:	41ec 2ee4      	lea 12004(a4),a0
    30b4:	2f48 0030      	move.l a0,48(sp)
    30b8:	2c48           	movea.l a0,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    30ba:	2f0a           	move.l a2,-(sp)
    30bc:	3f06           	move.w d6,-(sp)
    30be:	4267           	clr.w -(sp)
    30c0:	2f0e           	move.l a6,-(sp)
    30c2:	4879 0000 7600 	pea 7600 <destlinezoom9>
    30c8:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    30ca:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    30ce:	4646           	not.w d6
    30d0:	528a           	addq.l #1,a2
  for(int i2=0;i2<9;i2++) {  
    30d2:	4fef 0010      	lea 16(sp),sp
    30d6:	b4fc 00fe      	cmpa.w #254,a2
    30da:	66de           	bne.s 30ba <ZoomTest+0x178e>
    30dc:	45ec 3094      	lea 12436(a4),a2
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    30e0:	7a00           	moveq #0,d5
    30e2:	3a06           	move.w d6,d5
    30e4:	2f0b           	move.l a3,-(sp)
    30e6:	2f05           	move.l d5,-(sp)
    30e8:	2f0a           	move.l a2,-(sp)
    30ea:	4879 0000 7600 	pea 7600 <destlinezoom9>
    30f0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    30f2:	486b 0001      	pea 1(a3)
    30f6:	2f05           	move.l d5,-(sp)
    30f8:	486a 0030      	pea 48(a2)
    30fc:	4879 0000 7600 	pea 7600 <destlinezoom9>
    3102:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3104:	4646           	not.w d6
    3106:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3108:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<5;i++) {
    310c:	4fef 0020      	lea 32(sp),sp
    3110:	b6fc 010d      	cmpa.w #269,a3
    3114:	66ca           	bne.s 30e0 <ZoomTest+0x17b4>
  TestRow( valsupposed, valactual, mask, 269);
    3116:	2f0b           	move.l a3,-(sp)
    3118:	3f06           	move.w d6,-(sp)
    311a:	4267           	clr.w -(sp)
    311c:	2f2f 0044      	move.l 68(sp),-(sp)
    3120:	4879 0000 7600 	pea 7600 <destlinezoom9>
    3126:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    3128:	4878 0001      	pea 1 <_start+0x1>
    312c:	4878 0009      	pea 9 <main+0x3>
    3130:	2f03           	move.l d3,-(sp)
    3132:	2f0c           	move.l a4,-(sp)
    3134:	4eba ddcc      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3138:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    313e:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3142:	4fef 001c      	lea 28(sp),sp
    3146:	4297           	clr.l (sp)
    3148:	2f3c 0000 ffff 	move.l #65535,-(sp)
    314e:	2f2f 0034      	move.l 52(sp),-(sp)
    3152:	4879 0000 75d4 	pea 75d4 <destlinezoom10>
    3158:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 1);   
    315a:	4878 0001      	pea 1 <_start+0x1>
    315e:	42a7           	clr.l -(sp)
    3160:	2f2f 0058      	move.l 88(sp),-(sp)
    3164:	4879 0000 75d4 	pea 75d4 <destlinezoom10>
    316a:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 2);
    316c:	4fef 0020      	lea 32(sp),sp
    3170:	4878 0002      	pea 2 <_start+0x2>
    3174:	42a7           	clr.l -(sp)
    3176:	2f2f 0058      	move.l 88(sp),-(sp)
    317a:	4879 0000 75d4 	pea 75d4 <destlinezoom10>
    3180:	4e95           	jsr (a5)
  for(int i=0;i<9;i++) {
    3182:	2a2f 0074      	move.l 116(sp),d5
    3186:	4fef 0010      	lea 16(sp),sp
  mask = mask ^ 0xffff;
    318a:	7eff           	moveq #-1,d7
    318c:	2644           	movea.l d4,a3
    318e:	2445           	movea.l d5,a2
    3190:	45ea fe80      	lea -384(a2),a2
    3194:	280b           	move.l a3,d4
    3196:	5184           	subq.l #8,d4
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    3198:	2f04           	move.l d4,-(sp)
    319a:	3f07           	move.w d7,-(sp)
    319c:	4267           	clr.w -(sp)
    319e:	2f0a           	move.l a2,-(sp)
    31a0:	4879 0000 75d4 	pea 75d4 <destlinezoom10>
    31a6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    31a8:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    31ac:	4647           	not.w d7
    31ae:	5284           	addq.l #1,d4
    for(int i2=0;i2<8;i2++) {  
    31b0:	4fef 0010      	lea 16(sp),sp
    31b4:	ba8a           	cmp.l a2,d5
    31b6:	66e0           	bne.s 3198 <ZoomTest+0x186c>
    31b8:	280b           	move.l a3,d4
    31ba:	4dea 03c0      	lea 960(a2),a6
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    31be:	7c00           	moveq #0,d6
    31c0:	3c07           	move.w d7,d6
    31c2:	2f04           	move.l d4,-(sp)
    31c4:	2f06           	move.l d6,-(sp)
    31c6:	2f0a           	move.l a2,-(sp)
    31c8:	4879 0000 75d4 	pea 75d4 <destlinezoom10>
    31ce:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    31d0:	2f04           	move.l d4,-(sp)
    31d2:	2f06           	move.l d6,-(sp)
    31d4:	486a 0030      	pea 48(a2)
    31d8:	4879 0000 75d4 	pea 75d4 <destlinezoom10>
    31de:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    31e0:	45ea 0060      	lea 96(a2),a2
      mask = mask ^ 0xffff;
    31e4:	4647           	not.w d7
    31e6:	5284           	addq.l #1,d4
    for(int i2=0;i2<10;i2++) {
    31e8:	4fef 0020      	lea 32(sp),sp
    31ec:	bdca           	cmpa.l a2,a6
    31ee:	66ce           	bne.s 31be <ZoomTest+0x1892>
    31f0:	0685 0000 0540 	addi.l #1344,d5
    31f6:	47eb 001c      	lea 28(a3),a3
  for(int i=0;i<9;i++) {
    31fa:	b6fc 0107      	cmpa.w #263,a3
    31fe:	668e           	bne.s 318e <ZoomTest+0x1862>
    3200:	246f 0068      	movea.l 104(sp),a2
    TestRow( valsupposed, valactual, mask, 255+i2);
    3204:	2f02           	move.l d2,-(sp)
    3206:	3f07           	move.w d7,-(sp)
    3208:	4267           	clr.w -(sp)
    320a:	2f0a           	move.l a2,-(sp)
    320c:	4879 0000 75d4 	pea 75d4 <destlinezoom10>
    3212:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3214:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3218:	4647           	not.w d7
    321a:	5282           	addq.l #1,d2
  for(int i2=0;i2<8;i2++) {  
    321c:	4fef 0010      	lea 16(sp),sp
    3220:	0c82 0000 0107 	cmpi.l #263,d2
    3226:	66dc           	bne.s 3204 <ZoomTest+0x18d8>
    3228:	2c43           	movea.l d3,a6
    322a:	4dee 3154      	lea 12628(a6),a6
    322e:	347c 0108      	movea.w #264,a2
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    3232:	7400           	moveq #0,d2
    3234:	3407           	move.w d7,d2
    3236:	486a ffff      	pea -1(a2)
    323a:	2f02           	move.l d2,-(sp)
    323c:	2f0e           	move.l a6,-(sp)
    323e:	4879 0000 75d4 	pea 75d4 <destlinezoom10>
    3244:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    3246:	2f0a           	move.l a2,-(sp)
    3248:	2f02           	move.l d2,-(sp)
    324a:	486e 0030      	pea 48(a6)
    324e:	4879 0000 75d4 	pea 75d4 <destlinezoom10>
    3254:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3256:	4647           	not.w d7
    3258:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    325a:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<3;i++) {
    325e:	4fef 0020      	lea 32(sp),sp
    3262:	b4fc 010e      	cmpa.w #270,a2
    3266:	66ca           	bne.s 3232 <ZoomTest+0x1906>
  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    3268:	4878 0001      	pea 1 <_start+0x1>
    326c:	4878 000a      	pea a <main+0x4>
    3270:	2f0c           	move.l a4,-(sp)
    3272:	2f03           	move.l d3,-(sp)
    3274:	4eba dc8c      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3278:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    327e:	4eae ff1c      	jsr -228(a6)
    3282:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    3286:	246f 0034      	movea.l 52(sp),a2
  for(int i2=0;i2<6;i2++) {  
    328a:	7800           	moveq #0,d4
  mask = 0xffff;
    328c:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, i2);
    328e:	2f04           	move.l d4,-(sp)
    3290:	3f02           	move.w d2,-(sp)
    3292:	4267           	clr.w -(sp)
    3294:	2f0a           	move.l a2,-(sp)
    3296:	4879 0000 75a8 	pea 75a8 <destlinezoom11>
    329c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    329e:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    32a2:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) {  
    32a4:	5284           	addq.l #1,d4
    32a6:	4fef 0010      	lea 16(sp),sp
    32aa:	7006           	moveq #6,d0
    32ac:	b084           	cmp.l d4,d0
    32ae:	66de           	bne.s 328e <ZoomTest+0x1962>
    32b0:	266f 0058      	movea.l 88(sp),a3
    32b4:	347c 0006      	movea.w #6,a2
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    32b8:	7800           	moveq #0,d4
    32ba:	3802           	move.w d2,d4
    32bc:	2f0a           	move.l a2,-(sp)
    32be:	2f04           	move.l d4,-(sp)
    32c0:	2f0b           	move.l a3,-(sp)
    32c2:	4879 0000 75a8 	pea 75a8 <destlinezoom11>
    32c8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    32ca:	486a 0001      	pea 1(a2)
    32ce:	2f04           	move.l d4,-(sp)
    32d0:	486b 0030      	pea 48(a3)
    32d4:	4879 0000 75a8 	pea 75a8 <destlinezoom11>
    32da:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    32dc:	4642           	not.w d2
    32de:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    32e0:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    32e4:	4fef 0020      	lea 32(sp),sp
    32e8:	721c           	moveq #28,d1
    32ea:	b28a           	cmp.l a2,d1
    32ec:	66ca           	bne.s 32b8 <ZoomTest+0x198c>
    32ee:	280c           	move.l a4,d4
    32f0:	0684 0000 0694 	addi.l #1684,d4
    32f6:	347c 0023      	movea.w #35,a2
    32fa:	2644           	movea.l d4,a3
    32fc:	47eb feb0      	lea -336(a3),a3
    3300:	2a0a           	move.l a2,d5
    3302:	5f85           	subq.l #7,d5
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    3304:	2f05           	move.l d5,-(sp)
    3306:	3f02           	move.w d2,-(sp)
    3308:	4267           	clr.w -(sp)
    330a:	2f0b           	move.l a3,-(sp)
    330c:	4879 0000 75a8 	pea 75a8 <destlinezoom11>
    3312:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3314:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    3318:	4642           	not.w d2
    331a:	5285           	addq.l #1,d5
    for(int i2=0;i2<7;i2++) {  
    331c:	4fef 0010      	lea 16(sp),sp
    3320:	b88b           	cmp.l a3,d4
    3322:	66e0           	bne.s 3304 <ZoomTest+0x19d8>
    3324:	2c4a           	movea.l a2,a6
    3326:	2c0b           	move.l a3,d6
    3328:	0686 0000 0420 	addi.l #1056,d6
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    332e:	7a00           	moveq #0,d5
    3330:	3a02           	move.w d2,d5
    3332:	2f0e           	move.l a6,-(sp)
    3334:	2f05           	move.l d5,-(sp)
    3336:	2f0b           	move.l a3,-(sp)
    3338:	4879 0000 75a8 	pea 75a8 <destlinezoom11>
    333e:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    3340:	486e ffe8      	pea -24(a6)
    3344:	2f05           	move.l d5,-(sp)
    3346:	486b 0030      	pea 48(a3)
    334a:	4879 0000 75a8 	pea 75a8 <destlinezoom11>
    3350:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3352:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    3356:	4642           	not.w d2
    3358:	548e           	addq.l #2,a6
    for(int i2=0;i2<11;i2++) {
    335a:	4fef 0020      	lea 32(sp),sp
    335e:	bc8b           	cmp.l a3,d6
    3360:	66cc           	bne.s 332e <ZoomTest+0x1a02>
    3362:	0684 0000 0570 	addi.l #1392,d4
    3368:	45ea 001d      	lea 29(a2),a2
  for(int i=0;i<8;i++) {
    336c:	b4fc 010b      	cmpa.w #267,a2
    3370:	6688           	bne.s 32fa <ZoomTest+0x19ce>
    3372:	45ec 30c4      	lea 12484(a4),a2
    3376:	2a3c 0000 0104 	move.l #260,d5
    TestRow( valsupposed, valactual, mask, 260+i2);
    337c:	7800           	moveq #0,d4
    337e:	3802           	move.w d2,d4
    3380:	2f05           	move.l d5,-(sp)
    3382:	2f04           	move.l d4,-(sp)
    3384:	2f0a           	move.l a2,-(sp)
    3386:	4879 0000 75a8 	pea 75a8 <destlinezoom11>
    338c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    338e:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3392:	4642           	not.w d2
    3394:	5285           	addq.l #1,d5
  for(int i2=0;i2<7;i2++) {  
    3396:	4fef 0010      	lea 16(sp),sp
    339a:	0c85 0000 010b 	cmpi.l #267,d5
    33a0:	66da           	bne.s 337c <ZoomTest+0x1a50>
    33a2:	0282 0000 ffff 	andi.l #65535,d2
  TestRow( valsupposed, valactual, mask, 267);   
    33a8:	2f05           	move.l d5,-(sp)
    33aa:	2f02           	move.l d2,-(sp)
    33ac:	2f2f 0064      	move.l 100(sp),-(sp)
    33b0:	4879 0000 75a8 	pea 75a8 <destlinezoom11>
    33b6:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    33b8:	4878 010c      	pea 10c <main+0x106>
    33bc:	2f02           	move.l d2,-(sp)
    33be:	2f2f 0078      	move.l 120(sp),-(sp)
    33c2:	4879 0000 75a8 	pea 75a8 <destlinezoom11>
    33c8:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    33ca:	4fef 0020      	lea 32(sp),sp
    33ce:	4878 010d      	pea 10d <main+0x107>
    33d2:	2f04           	move.l d4,-(sp)
    33d4:	2f2f 0044      	move.l 68(sp),-(sp)
    33d8:	4879 0000 75a8 	pea 75a8 <destlinezoom11>
    33de:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    33e0:	4878 0001      	pea 1 <_start+0x1>
    33e4:	4878 000b      	pea b <main+0x5>
    33e8:	2f03           	move.l d3,-(sp)
    33ea:	2f0c           	move.l a4,-(sp)
    33ec:	4eba db14      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    33f0:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    33f6:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    33fa:	4fef 001c      	lea 28(sp),sp
    33fe:	4297           	clr.l (sp)
    3400:	42a7           	clr.l -(sp)
    3402:	2f2f 0034      	move.l 52(sp),-(sp)
    3406:	4879 0000 757c 	pea 757c <destlinezoom12>
    340c:	4e95           	jsr (a5)
    340e:	4fef 0010      	lea 16(sp),sp
    3412:	282f 0038      	move.l 56(sp),d4
  valactual += ZMLINESIZE/2;
    3416:	266f 0040      	movea.l 64(sp),a3
  TestRow( valsupposed, valactual, mask, 0);
    341a:	347c 0001      	movea.w #1,a2
  mask = mask ^ 0xffff;
    341e:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3420:	7a00           	moveq #0,d5
    3422:	3a02           	move.w d2,d5
    3424:	2f0a           	move.l a2,-(sp)
    3426:	2f05           	move.l d5,-(sp)
    3428:	2f0b           	move.l a3,-(sp)
    342a:	4879 0000 757c 	pea 757c <destlinezoom12>
    3430:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3432:	486a 0001      	pea 1(a2)
    3436:	2f05           	move.l d5,-(sp)
    3438:	486b 0030      	pea 48(a3)
    343c:	4879 0000 757c 	pea 757c <destlinezoom12>
    3442:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3444:	4642           	not.w d2
    3446:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    3448:	4fef 0020      	lea 32(sp),sp
    344c:	7019           	moveq #25,d0
    344e:	b08a           	cmp.l a2,d0
    3450:	673e           	beq.s 3490 <ZoomTest+0x1b64>
    3452:	200b           	move.l a3,d0
    3454:	0680 0000 00c0 	addi.l #192,d0
    345a:	2644           	movea.l d4,a3
    345c:	2800           	move.l d0,d4
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    345e:	7a00           	moveq #0,d5
    3460:	3a02           	move.w d2,d5
    3462:	2f0a           	move.l a2,-(sp)
    3464:	2f05           	move.l d5,-(sp)
    3466:	2f0b           	move.l a3,-(sp)
    3468:	4879 0000 757c 	pea 757c <destlinezoom12>
    346e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3470:	486a 0001      	pea 1(a2)
    3474:	2f05           	move.l d5,-(sp)
    3476:	486b 0030      	pea 48(a3)
    347a:	4879 0000 757c 	pea 757c <destlinezoom12>
    3480:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3482:	4642           	not.w d2
    3484:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    3486:	4fef 0020      	lea 32(sp),sp
    348a:	7019           	moveq #25,d0
    348c:	b08a           	cmp.l a2,d0
    348e:	66c2           	bne.s 3452 <ZoomTest+0x1b26>
    3490:	2a04           	move.l d4,d5
    3492:	0685 0000 0120 	addi.l #288,d5
    3498:	347c 001f      	movea.w #31,a2
    349c:	2645           	movea.l d5,a3
    349e:	47eb fee0      	lea -288(a3),a3
    34a2:	2c0a           	move.l a2,d6
    34a4:	5d86           	subq.l #6,d6
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    34a6:	2f06           	move.l d6,-(sp)
    34a8:	3f02           	move.w d2,-(sp)
    34aa:	4267           	clr.w -(sp)
    34ac:	2f0b           	move.l a3,-(sp)
    34ae:	4879 0000 757c 	pea 757c <destlinezoom12>
    34b4:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    34b6:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    34ba:	4642           	not.w d2
    34bc:	5286           	addq.l #1,d6
    for(int i2=0;i2<6;i2++) {  
    34be:	4fef 0010      	lea 16(sp),sp
    34c2:	ba8b           	cmp.l a3,d5
    34c4:	66e0           	bne.s 34a6 <ZoomTest+0x1b7a>
    34c6:	2c4a           	movea.l a2,a6
    34c8:	2e0b           	move.l a3,d7
    34ca:	0687 0000 0480 	addi.l #1152,d7
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    34d0:	7c00           	moveq #0,d6
    34d2:	3c02           	move.w d2,d6
    34d4:	2f0e           	move.l a6,-(sp)
    34d6:	2f06           	move.l d6,-(sp)
    34d8:	2f0b           	move.l a3,-(sp)
    34da:	4879 0000 757c 	pea 757c <destlinezoom12>
    34e0:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    34e2:	486e 0001      	pea 1(a6)
    34e6:	2f06           	move.l d6,-(sp)
    34e8:	486b 0030      	pea 48(a3)
    34ec:	4879 0000 757c 	pea 757c <destlinezoom12>
    34f2:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    34f4:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    34f8:	4642           	not.w d2
    34fa:	548e           	addq.l #2,a6
    for(int i2=0;i2<12;i2++) {
    34fc:	4fef 0020      	lea 32(sp),sp
    3500:	be8b           	cmp.l a3,d7
    3502:	66cc           	bne.s 34d0 <ZoomTest+0x1ba4>
    3504:	0685 0000 05a0 	addi.l #1440,d5
    350a:	45ea 001e      	lea 30(a2),a2
  for(int i=0;i<8;i++) {
    350e:	b4fc 010f      	cmpa.w #271,a2
    3512:	6688           	bne.s 349c <ZoomTest+0x1b70>
    3514:	2444           	movea.l d4,a2
    3516:	45ea 2d00      	lea 11520(a2),a2
    351a:	283c 0000 0104 	move.l #260,d4
    TestRow( valsupposed, valactual, mask, 260+i2);
    3520:	2f04           	move.l d4,-(sp)
    3522:	3f02           	move.w d2,-(sp)
    3524:	4267           	clr.w -(sp)
    3526:	2f0a           	move.l a2,-(sp)
    3528:	4879 0000 757c 	pea 757c <destlinezoom12>
    352e:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3530:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3534:	4642           	not.w d2
    3536:	5284           	addq.l #1,d4
  for(int i2=0;i2<5;i2++) {  
    3538:	4fef 0010      	lea 16(sp),sp
    353c:	0c84 0000 0109 	cmpi.l #265,d4
    3542:	66dc           	bne.s 3520 <ZoomTest+0x1bf4>
  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    3544:	4878 0001      	pea 1 <_start+0x1>
    3548:	4878 000c      	pea c <main+0x6>
    354c:	2f0c           	move.l a4,-(sp)
    354e:	2f03           	move.l d3,-(sp)
    3550:	4eba d9b0      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3554:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    355a:	4eae ff1c      	jsr -228(a6)
    355e:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    3562:	266f 0034      	movea.l 52(sp),a3
  WaitBlit();
    3566:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    356a:	7cff           	moveq #-1,d6
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    356c:	7400           	moveq #0,d2
    356e:	3406           	move.w d6,d2
    3570:	486a ffff      	pea -1(a2)
    3574:	2f02           	move.l d2,-(sp)
    3576:	2f0b           	move.l a3,-(sp)
    3578:	4879 0000 7550 	pea 7550 <destlinezoom13>
    357e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3580:	2f0a           	move.l a2,-(sp)
    3582:	2f02           	move.l d2,-(sp)
    3584:	486b 0030      	pea 48(a3)
    3588:	4879 0000 7550 	pea 7550 <destlinezoom13>
    358e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3590:	4646           	not.w d6
    3592:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3594:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    3598:	4fef 0020      	lea 32(sp),sp
    359c:	7217           	moveq #23,d1
    359e:	b28a           	cmp.l a2,d1
    35a0:	66ca           	bne.s 356c <ZoomTest+0x1c40>
    35a2:	240c           	move.l a4,d2
    35a4:	0682 0000 0514 	addi.l #1300,d2
    35aa:	3c7c 001b      	movea.w #27,a6
    35ae:	2a0a           	move.l a2,d5
    35b0:	2642           	movea.l d2,a3
    35b2:	47eb ff10      	lea -240(a3),a3
    35b6:	280e           	move.l a6,d4
    35b8:	5b84           	subq.l #5,d4
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    35ba:	2f04           	move.l d4,-(sp)
    35bc:	3f06           	move.w d6,-(sp)
    35be:	4267           	clr.w -(sp)
    35c0:	2f0b           	move.l a3,-(sp)
    35c2:	4879 0000 7550 	pea 7550 <destlinezoom13>
    35c8:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    35ca:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    35ce:	4646           	not.w d6
    35d0:	5284           	addq.l #1,d4
    for(int i2=0;i2<5;i2++) {  
    35d2:	4fef 0010      	lea 16(sp),sp
    35d6:	b48b           	cmp.l a3,d2
    35d8:	66e0           	bne.s 35ba <ZoomTest+0x1c8e>
    35da:	244e           	movea.l a6,a2
    35dc:	2e0b           	move.l a3,d7
    35de:	0687 0000 04e0 	addi.l #1248,d7
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    35e4:	7800           	moveq #0,d4
    35e6:	3806           	move.w d6,d4
    35e8:	2f0a           	move.l a2,-(sp)
    35ea:	2f04           	move.l d4,-(sp)
    35ec:	2f0b           	move.l a3,-(sp)
    35ee:	4879 0000 7550 	pea 7550 <destlinezoom13>
    35f4:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    35f6:	486a 0001      	pea 1(a2)
    35fa:	2f04           	move.l d4,-(sp)
    35fc:	486b 0030      	pea 48(a3)
    3600:	4879 0000 7550 	pea 7550 <destlinezoom13>
    3606:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3608:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    360c:	4646           	not.w d6
    360e:	548a           	addq.l #2,a2
    for(int i2=0;i2<13;i2++) {
    3610:	4fef 0020      	lea 32(sp),sp
    3614:	be8b           	cmp.l a3,d7
    3616:	66cc           	bne.s 35e4 <ZoomTest+0x1cb8>
    3618:	0682 0000 05d0 	addi.l #1488,d2
    361e:	4dee 001f      	lea 31(a6),a6
  for(int i=0;i<8;i++) {
    3622:	bcfc 0113      	cmpa.w #275,a6
    3626:	6688           	bne.s 35b0 <ZoomTest+0x1c84>
    3628:	2445           	movea.l d5,a2
  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    362a:	4878 0001      	pea 1 <_start+0x1>
    362e:	4878 000d      	pea d <main+0x7>
    3632:	2f03           	move.l d3,-(sp)
    3634:	2f0c           	move.l a4,-(sp)
    3636:	4eba d8ca      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    363a:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    3640:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    3644:	42a7           	clr.l -(sp)
    3646:	2f3c 0000 ffff 	move.l #65535,-(sp)
    364c:	2f2f 0044      	move.l 68(sp),-(sp)
    3650:	4879 0000 7524 	pea 7524 <destlinezoom14>
    3656:	4e95           	jsr (a5)
    3658:	4fef 0020      	lea 32(sp),sp
    365c:	242f 0038      	move.l 56(sp),d2
  valactual += ZMLINESIZE/2; 
    3660:	2c6f 0040      	movea.l 64(sp),a6
  TestRow( valsupposed, valactual, mask, 0);   
    3664:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff; 
    3668:	4247           	clr.w d7
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    366a:	7800           	moveq #0,d4
    366c:	3807           	move.w d7,d4
    366e:	2f0b           	move.l a3,-(sp)
    3670:	2f04           	move.l d4,-(sp)
    3672:	2f0e           	move.l a6,-(sp)
    3674:	4879 0000 7524 	pea 7524 <destlinezoom14>
    367a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    367c:	486b 0001      	pea 1(a3)
    3680:	2f04           	move.l d4,-(sp)
    3682:	486e 0030      	pea 48(a6)
    3686:	4879 0000 7524 	pea 7524 <destlinezoom14>
    368c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    368e:	4647           	not.w d7
    3690:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    3692:	4fef 0020      	lea 32(sp),sp
    3696:	7013           	moveq #19,d0
    3698:	b08b           	cmp.l a3,d0
    369a:	673e           	beq.s 36da <ZoomTest+0x1dae>
    369c:	200e           	move.l a6,d0
    369e:	0680 0000 00c0 	addi.l #192,d0
    36a4:	2c42           	movea.l d2,a6
    36a6:	2400           	move.l d0,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    36a8:	7800           	moveq #0,d4
    36aa:	3807           	move.w d7,d4
    36ac:	2f0b           	move.l a3,-(sp)
    36ae:	2f04           	move.l d4,-(sp)
    36b0:	2f0e           	move.l a6,-(sp)
    36b2:	4879 0000 7524 	pea 7524 <destlinezoom14>
    36b8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    36ba:	486b 0001      	pea 1(a3)
    36be:	2f04           	move.l d4,-(sp)
    36c0:	486e 0030      	pea 48(a6)
    36c4:	4879 0000 7524 	pea 7524 <destlinezoom14>
    36ca:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    36cc:	4647           	not.w d7
    36ce:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    36d0:	4fef 0020      	lea 32(sp),sp
    36d4:	7013           	moveq #19,d0
    36d6:	b08b           	cmp.l a3,d0
    36d8:	66c2           	bne.s 369c <ZoomTest+0x1d70>
    36da:	2802           	move.l d2,d4
    36dc:	0684 0000 00c0 	addi.l #192,d4
    36e2:	2c0b           	move.l a3,d6
    36e4:	2c44           	movea.l d4,a6
    36e6:	4dee ff40      	lea -192(a6),a6
    36ea:	2a0a           	move.l a2,d5
    36ec:	5985           	subq.l #4,d5
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    36ee:	2f05           	move.l d5,-(sp)
    36f0:	3f07           	move.w d7,-(sp)
    36f2:	4267           	clr.w -(sp)
    36f4:	2f0e           	move.l a6,-(sp)
    36f6:	4879 0000 7524 	pea 7524 <destlinezoom14>
    36fc:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    36fe:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3702:	4647           	not.w d7
    3704:	5285           	addq.l #1,d5
    for(int i2=0;i2<4;i2++) {  
    3706:	4fef 0010      	lea 16(sp),sp
    370a:	b88e           	cmp.l a6,d4
    370c:	66e0           	bne.s 36ee <ZoomTest+0x1dc2>
    370e:	264a           	movea.l a2,a3
    3710:	41ee 0540      	lea 1344(a6),a0
    3714:	2f48 003c      	move.l a0,60(sp)
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    3718:	7a00           	moveq #0,d5
    371a:	3a07           	move.w d7,d5
    371c:	2f0b           	move.l a3,-(sp)
    371e:	2f05           	move.l d5,-(sp)
    3720:	2f0e           	move.l a6,-(sp)
    3722:	4879 0000 7524 	pea 7524 <destlinezoom14>
    3728:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    372a:	486b 0001      	pea 1(a3)
    372e:	2f05           	move.l d5,-(sp)
    3730:	486e 0030      	pea 48(a6)
    3734:	4879 0000 7524 	pea 7524 <destlinezoom14>
    373a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    373c:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3740:	4647           	not.w d7
    3742:	548b           	addq.l #2,a3
    for(int i2=0;i2<14;i2++) {
    3744:	4fef 0020      	lea 32(sp),sp
    3748:	bdef 003c      	cmpa.l 60(sp),a6
    374c:	66ca           	bne.s 3718 <ZoomTest+0x1dec>
    374e:	0684 0000 0600 	addi.l #1536,d4
    3754:	45ea 0020      	lea 32(a2),a2
  for(int i=0;i<7;i++) {
    3758:	b4fc 00f7      	cmpa.w #247,a2
    375c:	6686           	bne.s 36e4 <ZoomTest+0x1db8>
    375e:	2646           	movea.l d6,a3
    3760:	2c42           	movea.l d2,a6
    3762:	4dee 2a00      	lea 10752(a6),a6
    3766:	347c 00f3      	movea.w #243,a2
    TestRow( valsupposed, valactual, mask, 243+i2);
    376a:	2f0a           	move.l a2,-(sp)
    376c:	3f07           	move.w d7,-(sp)
    376e:	4267           	clr.w -(sp)
    3770:	2f0e           	move.l a6,-(sp)
    3772:	4879 0000 7524 	pea 7524 <destlinezoom14>
    3778:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    377a:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    377e:	4647           	not.w d7
    3780:	528a           	addq.l #1,a2
  for(int i2=0;i2<4;i2++) {  
    3782:	4fef 0010      	lea 16(sp),sp
    3786:	b4fc 00f7      	cmpa.w #247,a2
    378a:	66de           	bne.s 376a <ZoomTest+0x1e3e>
    378c:	0682 0000 2ac0 	addi.l #10944,d2
    3792:	2c4a           	movea.l a2,a6
    3794:	280a           	move.l a2,d4
    3796:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    3798:	7400           	moveq #0,d2
    379a:	3407           	move.w d7,d2
    379c:	2f0e           	move.l a6,-(sp)
    379e:	2f02           	move.l d2,-(sp)
    37a0:	2f0a           	move.l a2,-(sp)
    37a2:	4879 0000 7524 	pea 7524 <destlinezoom14>
    37a8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    37aa:	486e 0001      	pea 1(a6)
    37ae:	2f02           	move.l d2,-(sp)
    37b0:	486a 0030      	pea 48(a2)
    37b4:	4879 0000 7524 	pea 7524 <destlinezoom14>
    37ba:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    37bc:	4647           	not.w d7
    37be:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    37c0:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<12;i2++) {
    37c4:	4fef 0020      	lea 32(sp),sp
    37c8:	bcfc 010f      	cmpa.w #271,a6
    37cc:	66ca           	bne.s 3798 <ZoomTest+0x1e6c>
  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    37ce:	4878 0001      	pea 1 <_start+0x1>
    37d2:	4878 000e      	pea e <main+0x8>
    37d6:	2f0c           	move.l a4,-(sp)
    37d8:	2f03           	move.l d3,-(sp)
    37da:	4eba d726      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    37de:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    37e4:	4eae ff1c      	jsr -228(a6)
    37e8:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    37ec:	242f 0034      	move.l 52(sp),d2
  WaitBlit();
    37f0:	3c7c 0001      	movea.w #1,a6
  mask = 0x0000;
    37f4:	4246           	clr.w d6
    37f6:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    37f8:	7400           	moveq #0,d2
    37fa:	3406           	move.w d6,d2
    37fc:	486e ffff      	pea -1(a6)
    3800:	2f02           	move.l d2,-(sp)
    3802:	2f0a           	move.l a2,-(sp)
    3804:	4879 0000 74f8 	pea 74f8 <destlinezoom15>
    380a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    380c:	2f0e           	move.l a6,-(sp)
    380e:	2f02           	move.l d2,-(sp)
    3810:	486a 0030      	pea 48(a2)
    3814:	4879 0000 74f8 	pea 74f8 <destlinezoom15>
    381a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    381c:	4646           	not.w d6
    381e:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3820:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<8;i2++) {
    3824:	4fef 0020      	lea 32(sp),sp
    3828:	7011           	moveq #17,d0
    382a:	b08e           	cmp.l a6,d0
    382c:	66ca           	bne.s 37f8 <ZoomTest+0x1ecc>
    382e:	2444           	movea.l d4,a2
    3830:	242f 0054      	move.l 84(sp),d2
    3834:	2c42           	movea.l d2,a6
    3836:	4dee ff70      	lea -144(a6),a6
    383a:	280b           	move.l a3,d4
    383c:	5784           	subq.l #3,d4
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    383e:	2f04           	move.l d4,-(sp)
    3840:	3f06           	move.w d6,-(sp)
    3842:	4267           	clr.w -(sp)
    3844:	2f0e           	move.l a6,-(sp)
    3846:	4879 0000 74f8 	pea 74f8 <destlinezoom15>
    384c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    384e:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3852:	4646           	not.w d6
    3854:	5284           	addq.l #1,d4
    for(int i2=0;i2<3;i2++) {  
    3856:	4fef 0010      	lea 16(sp),sp
    385a:	b48e           	cmp.l a6,d2
    385c:	66e0           	bne.s 383e <ZoomTest+0x1f12>
    385e:	280b           	move.l a3,d4
    3860:	2e0e           	move.l a6,d7
    3862:	0687 0000 05a0 	addi.l #1440,d7
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    3868:	7a00           	moveq #0,d5
    386a:	3a06           	move.w d6,d5
    386c:	2f04           	move.l d4,-(sp)
    386e:	2f05           	move.l d5,-(sp)
    3870:	2f0e           	move.l a6,-(sp)
    3872:	4879 0000 74f8 	pea 74f8 <destlinezoom15>
    3878:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    387a:	2f04           	move.l d4,-(sp)
    387c:	2f05           	move.l d5,-(sp)
    387e:	486e 0030      	pea 48(a6)
    3882:	4879 0000 74f8 	pea 74f8 <destlinezoom15>
    3888:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    388a:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    388e:	4646           	not.w d6
    3890:	5484           	addq.l #2,d4
    for(int i2=0;i2<15;i2++) {
    3892:	4fef 0020      	lea 32(sp),sp
    3896:	be8e           	cmp.l a6,d7
    3898:	66ce           	bne.s 3868 <ZoomTest+0x1f3c>
    389a:	0682 0000 0630 	addi.l #1584,d2
    38a0:	47eb 0021      	lea 33(a3),a3
  for(int i=0;i<7;i++) {
    38a4:	b6fc 00fa      	cmpa.w #250,a3
    38a8:	668a           	bne.s 3834 <ZoomTest+0x1f08>
    38aa:	47ec 2e54      	lea 11860(a4),a3
    TestRow( valsupposed, valactual, mask, 247+i2);
    38ae:	2f0a           	move.l a2,-(sp)
    38b0:	3f06           	move.w d6,-(sp)
    38b2:	4267           	clr.w -(sp)
    38b4:	2f0b           	move.l a3,-(sp)
    38b6:	4879 0000 74f8 	pea 74f8 <destlinezoom15>
    38bc:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    38be:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    38c2:	4646           	not.w d6
    38c4:	528a           	addq.l #1,a2
  for(int i2=0;i2<3;i2++) {  
    38c6:	4fef 0010      	lea 16(sp),sp
    38ca:	b4fc 00fa      	cmpa.w #250,a2
    38ce:	66de           	bne.s 38ae <ZoomTest+0x1f82>
    38d0:	266f 0030      	movea.l 48(sp),a3
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    38d4:	7400           	moveq #0,d2
    38d6:	3406           	move.w d6,d2
    38d8:	2f0a           	move.l a2,-(sp)
    38da:	2f02           	move.l d2,-(sp)
    38dc:	2f0b           	move.l a3,-(sp)
    38de:	4879 0000 74f8 	pea 74f8 <destlinezoom15>
    38e4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    38e6:	486a 0001      	pea 1(a2)
    38ea:	2f02           	move.l d2,-(sp)
    38ec:	486b 0030      	pea 48(a3)
    38f0:	4879 0000 74f8 	pea 74f8 <destlinezoom15>
    38f6:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    38f8:	4646           	not.w d6
    38fa:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    38fc:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<10;i2++) {
    3900:	4fef 0020      	lea 32(sp),sp
    3904:	b4fc 010e      	cmpa.w #270,a2
    3908:	66ca           	bne.s 38d4 <ZoomTest+0x1fa8>
  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    390a:	4878 0001      	pea 1 <_start+0x1>
    390e:	4878 000f      	pea f <main+0x9>
    3912:	2f03           	move.l d3,-(sp)
    3914:	2f0c           	move.l a4,-(sp)
    3916:	4eba d5ea      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    391a:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    3920:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    3924:	42a7           	clr.l -(sp)
    3926:	42a7           	clr.l -(sp)
    3928:	2f2f 0044      	move.l 68(sp),-(sp)
    392c:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    3932:	4e95           	jsr (a5)
    3934:	4fef 0020      	lea 32(sp),sp
    3938:	246f 0044      	movea.l 68(sp),a2
    393c:	2c6f 0038      	movea.l 56(sp),a6
  valactual += ZMLINESIZE/2;
    3940:	282f 0040      	move.l 64(sp),d4
  TestRow( valsupposed, valactual, mask, 0);   
    3944:	97cb           	suba.l a3,a3
  mask = mask ^ 0xffff;
    3946:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3948:	7a00           	moveq #0,d5
    394a:	3a02           	move.w d2,d5
    394c:	2f0b           	move.l a3,-(sp)
    394e:	2f05           	move.l d5,-(sp)
    3950:	2f04           	move.l d4,-(sp)
    3952:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    3958:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    395a:	486b 0001      	pea 1(a3)
    395e:	2f05           	move.l d5,-(sp)
    3960:	2044           	movea.l d4,a0
    3962:	4868 0030      	pea 48(a0)
    3966:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    396c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    396e:	4642           	not.w d2
    3970:	2004           	move.l d4,d0
    3972:	0680 0000 0120 	addi.l #288,d0
    3978:	548b           	addq.l #2,a3
    397a:	280e           	move.l a6,d4
  for(int i2=0;i2<6;i2++) {
    397c:	4fef 0020      	lea 32(sp),sp
    3980:	720c           	moveq #12,d1
    3982:	b28b           	cmp.l a3,d1
    3984:	6742           	beq.s 39c8 <ZoomTest+0x209c>
    3986:	2c4a           	movea.l a2,a6
    3988:	2440           	movea.l d0,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    398a:	7a00           	moveq #0,d5
    398c:	3a02           	move.w d2,d5
    398e:	2f0b           	move.l a3,-(sp)
    3990:	2f05           	move.l d5,-(sp)
    3992:	2f04           	move.l d4,-(sp)
    3994:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    399a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    399c:	486b 0001      	pea 1(a3)
    39a0:	2f05           	move.l d5,-(sp)
    39a2:	2044           	movea.l d4,a0
    39a4:	4868 0030      	pea 48(a0)
    39a8:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    39ae:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    39b0:	4642           	not.w d2
    39b2:	2004           	move.l d4,d0
    39b4:	0680 0000 0120 	addi.l #288,d0
    39ba:	548b           	addq.l #2,a3
    39bc:	280e           	move.l a6,d4
  for(int i2=0;i2<6;i2++) {
    39be:	4fef 0020      	lea 32(sp),sp
    39c2:	720c           	moveq #12,d1
    39c4:	b28b           	cmp.l a3,d1
    39c6:	66be           	bne.s 3986 <ZoomTest+0x205a>
    39c8:	367c 000d      	movea.w #13,a3
    39cc:	2a0c           	move.l a4,d5
    39ce:	2e00           	move.l d0,d7
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    39d0:	2f0b           	move.l a3,-(sp)
    39d2:	7800           	moveq #0,d4
    39d4:	3802           	move.w d2,d4
    39d6:	2f04           	move.l d4,-(sp)
    39d8:	2f0e           	move.l a6,-(sp)
    39da:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    39e0:	4e95           	jsr (a5)
    39e2:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    39e6:	3c02           	move.w d2,d6
    39e8:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    39ea:	3f06           	move.w d6,-(sp)
    39ec:	4267           	clr.w -(sp)
    39ee:	486e 0030      	pea 48(a6)
    39f2:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    39f8:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    39fa:	49eb 0003      	lea 3(a3),a4
    39fe:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3a02:	2c47           	movea.l d7,a6
    3a04:	7e23           	moveq #35,d7
    3a06:	de8b           	add.l a3,d7
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    3a08:	2f0c           	move.l a4,-(sp)
    3a0a:	2f04           	move.l d4,-(sp)
    3a0c:	2f0a           	move.l a2,-(sp)
    3a0e:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    3a14:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    3a16:	486c 0001      	pea 1(a4)
    3a1a:	2f04           	move.l d4,-(sp)
    3a1c:	486a 0030      	pea 48(a2)
    3a20:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    3a26:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3a28:	3406           	move.w d6,d2
    3a2a:	41ea 00c0      	lea 192(a2),a0
    3a2e:	548c           	addq.l #2,a4
    for(int i2=0;i2<16;i2++) {
    3a30:	4fef 0020      	lea 32(sp),sp
    3a34:	b9c7           	cmpa.l d7,a4
    3a36:	673a           	beq.s 3a72 <ZoomTest+0x2146>
    3a38:	244e           	movea.l a6,a2
    3a3a:	2c48           	movea.l a0,a6
    3a3c:	7800           	moveq #0,d4
    3a3e:	3806           	move.w d6,d4
    3a40:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    3a42:	2f0c           	move.l a4,-(sp)
    3a44:	2f04           	move.l d4,-(sp)
    3a46:	2f0a           	move.l a2,-(sp)
    3a48:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    3a4e:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    3a50:	486c 0001      	pea 1(a4)
    3a54:	2f04           	move.l d4,-(sp)
    3a56:	486a 0030      	pea 48(a2)
    3a5a:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    3a60:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3a62:	3406           	move.w d6,d2
    3a64:	41ea 00c0      	lea 192(a2),a0
    3a68:	548c           	addq.l #2,a4
    for(int i2=0;i2<16;i2++) {
    3a6a:	4fef 0020      	lea 32(sp),sp
    3a6e:	b9c7           	cmpa.l d7,a4
    3a70:	66c6           	bne.s 3a38 <ZoomTest+0x210c>
    3a72:	47eb 0022      	lea 34(a3),a3
  for(int i=0;i<7;i++) {
    3a76:	b6fc 00fb      	cmpa.w #251,a3
    3a7a:	674e           	beq.s 3aca <ZoomTest+0x219e>
    3a7c:	2e0a           	move.l a2,d7
    3a7e:	0687 0000 0120 	addi.l #288,d7
    3a84:	2448           	movea.l a0,a2
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3a86:	2f0b           	move.l a3,-(sp)
    3a88:	7800           	moveq #0,d4
    3a8a:	3802           	move.w d2,d4
    3a8c:	2f04           	move.l d4,-(sp)
    3a8e:	2f0e           	move.l a6,-(sp)
    3a90:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    3a96:	4e95           	jsr (a5)
    3a98:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    3a9c:	3c02           	move.w d2,d6
    3a9e:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3aa0:	3f06           	move.w d6,-(sp)
    3aa2:	4267           	clr.w -(sp)
    3aa4:	486e 0030      	pea 48(a6)
    3aa8:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    3aae:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3ab0:	49eb 0003      	lea 3(a3),a4
    3ab4:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3ab8:	2c47           	movea.l d7,a6
    3aba:	7e23           	moveq #35,d7
    3abc:	de8b           	add.l a3,d7
    3abe:	6000 ff48      	bra.w 3a08 <ZoomTest+0x20dc>
    3ac2:	7800           	moveq #0,d4
    3ac4:	3802           	move.w d2,d4
    3ac6:	6000 e754      	bra.w 221c <ZoomTest+0x8f0>
    3aca:	2845           	movea.l d5,a4
    3acc:	2a08           	move.l a0,d5
    TestRow( valsupposed, valactual, mask, 251+i2);
    3ace:	2f0b           	move.l a3,-(sp)
    3ad0:	7c00           	moveq #0,d6
    3ad2:	3c02           	move.w d2,d6
    3ad4:	2f06           	move.l d6,-(sp)
    3ad6:	2f0e           	move.l a6,-(sp)
    3ad8:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    3ade:	4e95           	jsr (a5)
    3ae0:	4878 00fc      	pea fc <main+0xf6>
    3ae4:	2f04           	move.l d4,-(sp)
    3ae6:	486a 0090      	pea 144(a2)
    3aea:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    3af0:	4e95           	jsr (a5)
    3af2:	4fef 0020      	lea 32(sp),sp
    3af6:	347c 00fd      	movea.w #253,a2
    3afa:	2645           	movea.l d5,a3
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    3afc:	2f0a           	move.l a2,-(sp)
    3afe:	2f06           	move.l d6,-(sp)
    3b00:	2f0b           	move.l a3,-(sp)
    3b02:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    3b08:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3b0a:	486a 0001      	pea 1(a2)
    3b0e:	2f06           	move.l d6,-(sp)
    3b10:	486b 0030      	pea 48(a3)
    3b14:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    3b1a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3b1c:	4642           	not.w d2
    3b1e:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3b20:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    3b24:	4fef 0020      	lea 32(sp),sp
    3b28:	b4fc 010d      	cmpa.w #269,a2
    3b2c:	6736           	beq.s 3b64 <ZoomTest+0x2238>
    3b2e:	7c00           	moveq #0,d6
    3b30:	3c02           	move.w d2,d6
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    3b32:	2f0a           	move.l a2,-(sp)
    3b34:	2f06           	move.l d6,-(sp)
    3b36:	2f0b           	move.l a3,-(sp)
    3b38:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    3b3e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3b40:	486a 0001      	pea 1(a2)
    3b44:	2f06           	move.l d6,-(sp)
    3b46:	486b 0030      	pea 48(a3)
    3b4a:	4879 0000 74cc 	pea 74cc <destlinezoom16>
    3b50:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3b52:	4642           	not.w d2
    3b54:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3b56:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    3b5a:	4fef 0020      	lea 32(sp),sp
    3b5e:	b4fc 010d      	cmpa.w #269,a2
    3b62:	66ca           	bne.s 3b2e <ZoomTest+0x2202>
  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    3b64:	4878 0001      	pea 1 <_start+0x1>
    3b68:	4878 0010      	pea 10 <main+0xa>
    3b6c:	2f0c           	move.l a4,-(sp)
    3b6e:	2f03           	move.l d3,-(sp)
    3b70:	4eba d390      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3b74:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    3b7a:	4eae ff1c      	jsr -228(a6)
    3b7e:	4fef 0010      	lea 16(sp),sp
    3b82:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    3b86:	7eff           	moveq #-1,d7
    3b88:	266f 0034      	movea.l 52(sp),a3
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3b8c:	7400           	moveq #0,d2
    3b8e:	3407           	move.w d7,d2
    3b90:	486a ffff      	pea -1(a2)
    3b94:	2f02           	move.l d2,-(sp)
    3b96:	2f0b           	move.l a3,-(sp)
    3b98:	4879 0000 74a0 	pea 74a0 <destlinezoom17>
    3b9e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3ba0:	2f0a           	move.l a2,-(sp)
    3ba2:	2f02           	move.l d2,-(sp)
    3ba4:	486b 0030      	pea 48(a3)
    3ba8:	4879 0000 74a0 	pea 74a0 <destlinezoom17>
    3bae:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3bb0:	4647           	not.w d7
    3bb2:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3bb4:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<5;i2++) {
    3bb8:	4fef 0020      	lea 32(sp),sp
    3bbc:	700b           	moveq #11,d0
    3bbe:	b08a           	cmp.l a2,d0
    3bc0:	66ca           	bne.s 3b8c <ZoomTest+0x2260>
    3bc2:	2a0c           	move.l a4,d5
    3bc4:	0685 0000 01e4 	addi.l #484,d5
    3bca:	367c 000a      	movea.w #10,a3
    3bce:	2f4c 0034      	move.l a4,52(sp)
    3bd2:	2c0a           	move.l a2,d6
    3bd4:	2445           	movea.l d5,a2
      TestRow( valsupposed, valactual, mask, 10+i*35);
    3bd6:	2f0b           	move.l a3,-(sp)
    3bd8:	3f07           	move.w d7,-(sp)
    3bda:	4267           	clr.w -(sp)
    3bdc:	2f0a           	move.l a2,-(sp)
    3bde:	4879 0000 74a0 	pea 74a0 <destlinezoom17>
    3be4:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3be6:	4dea 0030      	lea 48(a2),a6
      mask = mask ^ 0xffff;
    3bea:	3807           	move.w d7,d4
    3bec:	4644           	not.w d4
    for(int i2=0;i2<17;i2++) {
    3bee:	49eb 0001      	lea 1(a3),a4
    3bf2:	4fef 0010      	lea 16(sp),sp
    3bf6:	45ea 0690      	lea 1680(a2),a2
    3bfa:	2a0a           	move.l a2,d5
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3bfc:	7400           	moveq #0,d2
    3bfe:	3404           	move.w d4,d2
    3c00:	2f0c           	move.l a4,-(sp)
    3c02:	2f02           	move.l d2,-(sp)
    3c04:	2f0e           	move.l a6,-(sp)
    3c06:	4879 0000 74a0 	pea 74a0 <destlinezoom17>
    3c0c:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3c0e:	486c 0001      	pea 1(a4)
    3c12:	2f02           	move.l d2,-(sp)
    3c14:	486e 0030      	pea 48(a6)
    3c18:	4879 0000 74a0 	pea 74a0 <destlinezoom17>
    3c1e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3c20:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3c24:	4644           	not.w d4
    3c26:	3e04           	move.w d4,d7
    3c28:	548c           	addq.l #2,a4
    for(int i2=0;i2<17;i2++) {
    3c2a:	4fef 0020      	lea 32(sp),sp
    3c2e:	bdc5           	cmpa.l d5,a6
    3c30:	66ca           	bne.s 3bfc <ZoomTest+0x22d0>
    3c32:	47eb 0023      	lea 35(a3),a3
  for(int i=0;i<7;i++) {
    3c36:	b6fc 00ff      	cmpa.w #255,a3
    3c3a:	669a           	bne.s 3bd6 <ZoomTest+0x22aa>
    3c3c:	286f 0034      	movea.l 52(sp),a4
    3c40:	2446           	movea.l d6,a2
  TestRow( valsupposed, valactual, mask, 255);
    3c42:	2f0b           	move.l a3,-(sp)
    3c44:	3f04           	move.w d4,-(sp)
    3c46:	4267           	clr.w -(sp)
    3c48:	486c 2fd4      	pea 12244(a4)
    3c4c:	4879 0000 74a0 	pea 74a0 <destlinezoom17>
    3c52:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    3c54:	4dec 3004      	lea 12292(a4),a6
    3c58:	4fef 0010      	lea 16(sp),sp
    3c5c:	367c 0100      	movea.w #256,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3c60:	2f0b           	move.l a3,-(sp)
    3c62:	2f02           	move.l d2,-(sp)
    3c64:	2f0e           	move.l a6,-(sp)
    3c66:	4879 0000 74a0 	pea 74a0 <destlinezoom17>
    3c6c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3c6e:	486b 0001      	pea 1(a3)
    3c72:	2f02           	move.l d2,-(sp)
    3c74:	486e 0030      	pea 48(a6)
    3c78:	4879 0000 74a0 	pea 74a0 <destlinezoom17>
    3c7e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3c80:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3c82:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    3c86:	4fef 0020      	lea 32(sp),sp
    3c8a:	b6fc 010e      	cmpa.w #270,a3
    3c8e:	6736           	beq.s 3cc6 <ZoomTest+0x239a>
    3c90:	7400           	moveq #0,d2
    3c92:	3404           	move.w d4,d2
    3c94:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3c96:	2f0b           	move.l a3,-(sp)
    3c98:	2f02           	move.l d2,-(sp)
    3c9a:	2f0e           	move.l a6,-(sp)
    3c9c:	4879 0000 74a0 	pea 74a0 <destlinezoom17>
    3ca2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3ca4:	486b 0001      	pea 1(a3)
    3ca8:	2f02           	move.l d2,-(sp)
    3caa:	486e 0030      	pea 48(a6)
    3cae:	4879 0000 74a0 	pea 74a0 <destlinezoom17>
    3cb4:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3cb6:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3cb8:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    3cbc:	4fef 0020      	lea 32(sp),sp
    3cc0:	b6fc 010e      	cmpa.w #270,a3
    3cc4:	66ca           	bne.s 3c90 <ZoomTest+0x2364>
  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    3cc6:	4878 0001      	pea 1 <_start+0x1>
    3cca:	4878 0011      	pea 11 <main+0xb>
    3cce:	2f03           	move.l d3,-(sp)
    3cd0:	2f0c           	move.l a4,-(sp)
    3cd2:	4eba d22e      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3cd6:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    3cdc:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3ce0:	42a7           	clr.l -(sp)
    3ce2:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3ce8:	2f2f 0044      	move.l 68(sp),-(sp)
    3cec:	4879 0000 7474 	pea 7474 <destlinezoom18>
    3cf2:	4e95           	jsr (a5)
    3cf4:	4fef 0020      	lea 32(sp),sp
    3cf8:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff;
    3cfc:	4242           	clr.w d2
    3cfe:	2c6f 0040      	movea.l 64(sp),a6
    3d02:	2a2f 0044      	move.l 68(sp),d5
    3d06:	2c2f 0038      	move.l 56(sp),d6
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3d0a:	7800           	moveq #0,d4
    3d0c:	3802           	move.w d2,d4
    3d0e:	2f0b           	move.l a3,-(sp)
    3d10:	2f04           	move.l d4,-(sp)
    3d12:	2f0e           	move.l a6,-(sp)
    3d14:	4879 0000 7474 	pea 7474 <destlinezoom18>
    3d1a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3d1c:	486b 0001      	pea 1(a3)
    3d20:	2f04           	move.l d4,-(sp)
    3d22:	486e 0030      	pea 48(a6)
    3d26:	4879 0000 7474 	pea 7474 <destlinezoom18>
    3d2c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3d2e:	4642           	not.w d2
    3d30:	200e           	move.l a6,d0
    3d32:	0680 0000 0120 	addi.l #288,d0
    3d38:	548b           	addq.l #2,a3
    3d3a:	2c46           	movea.l d6,a6
  for(int i2=0;i2<4;i2++) {
    3d3c:	4fef 0020      	lea 32(sp),sp
    3d40:	7209           	moveq #9,d1
    3d42:	b28b           	cmp.l a3,d1
    3d44:	6740           	beq.s 3d86 <ZoomTest+0x245a>
    3d46:	2c05           	move.l d5,d6
    3d48:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3d4a:	7800           	moveq #0,d4
    3d4c:	3802           	move.w d2,d4
    3d4e:	2f0b           	move.l a3,-(sp)
    3d50:	2f04           	move.l d4,-(sp)
    3d52:	2f0e           	move.l a6,-(sp)
    3d54:	4879 0000 7474 	pea 7474 <destlinezoom18>
    3d5a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3d5c:	486b 0001      	pea 1(a3)
    3d60:	2f04           	move.l d4,-(sp)
    3d62:	486e 0030      	pea 48(a6)
    3d66:	4879 0000 7474 	pea 7474 <destlinezoom18>
    3d6c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3d6e:	4642           	not.w d2
    3d70:	200e           	move.l a6,d0
    3d72:	0680 0000 0120 	addi.l #288,d0
    3d78:	548b           	addq.l #2,a3
    3d7a:	2c46           	movea.l d6,a6
  for(int i2=0;i2<4;i2++) {
    3d7c:	4fef 0020      	lea 32(sp),sp
    3d80:	7209           	moveq #9,d1
    3d82:	b28b           	cmp.l a3,d1
    3d84:	66c0           	bne.s 3d46 <ZoomTest+0x241a>
    3d86:	2f45 0044      	move.l d5,68(sp)
    3d8a:	2f46 0038      	move.l d6,56(sp)
    3d8e:	2805           	move.l d5,d4
    3d90:	2646           	movea.l d6,a3
    3d92:	2c4a           	movea.l a2,a6
    3d94:	2a00           	move.l d0,d5
    3d96:	7e24           	moveq #36,d7
    3d98:	de8a           	add.l a2,d7
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3d9a:	7c00           	moveq #0,d6
    3d9c:	3c02           	move.w d2,d6
    3d9e:	2f0e           	move.l a6,-(sp)
    3da0:	2f06           	move.l d6,-(sp)
    3da2:	2f0b           	move.l a3,-(sp)
    3da4:	4879 0000 7474 	pea 7474 <destlinezoom18>
    3daa:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3dac:	486e 0001      	pea 1(a6)
    3db0:	2f06           	move.l d6,-(sp)
    3db2:	486b 0030      	pea 48(a3)
    3db6:	4879 0000 7474 	pea 7474 <destlinezoom18>
    3dbc:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3dbe:	4642           	not.w d2
    3dc0:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    3dc2:	4fef 0020      	lea 32(sp),sp
    3dc6:	bdc7           	cmpa.l d7,a6
    3dc8:	673e           	beq.s 3e08 <ZoomTest+0x24dc>
    3dca:	200b           	move.l a3,d0
    3dcc:	0680 0000 0120 	addi.l #288,d0
    3dd2:	2644           	movea.l d4,a3
    3dd4:	2805           	move.l d5,d4
    3dd6:	2a00           	move.l d0,d5
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3dd8:	7c00           	moveq #0,d6
    3dda:	3c02           	move.w d2,d6
    3ddc:	2f0e           	move.l a6,-(sp)
    3dde:	2f06           	move.l d6,-(sp)
    3de0:	2f0b           	move.l a3,-(sp)
    3de2:	4879 0000 7474 	pea 7474 <destlinezoom18>
    3de8:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3dea:	486e 0001      	pea 1(a6)
    3dee:	2f06           	move.l d6,-(sp)
    3df0:	486b 0030      	pea 48(a3)
    3df4:	4879 0000 7474 	pea 7474 <destlinezoom18>
    3dfa:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3dfc:	4642           	not.w d2
    3dfe:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    3e00:	4fef 0020      	lea 32(sp),sp
    3e04:	bdc7           	cmpa.l d7,a6
    3e06:	66c2           	bne.s 3dca <ZoomTest+0x249e>
    3e08:	45ea 0023      	lea 35(a2),a2
  for(int i=0;i<7;i++) {  
    3e0c:	b4fc 0100      	cmpa.w #256,a2
    3e10:	6718           	beq.s 3e2a <ZoomTest+0x24fe>
    3e12:	200b           	move.l a3,d0
    3e14:	0680 0000 0120 	addi.l #288,d0
    3e1a:	2644           	movea.l d4,a3
    3e1c:	2805           	move.l d5,d4
  for(int i2=0;i2<4;i2++) {
    3e1e:	2c4a           	movea.l a2,a6
    3e20:	2a00           	move.l d0,d5
    3e22:	7e24           	moveq #36,d7
    3e24:	de8a           	add.l a2,d7
    3e26:	6000 ff72      	bra.w 3d9a <ZoomTest+0x246e>
    3e2a:	2644           	movea.l d4,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3e2c:	7800           	moveq #0,d4
    3e2e:	3802           	move.w d2,d4
    3e30:	2f0a           	move.l a2,-(sp)
    3e32:	2f04           	move.l d4,-(sp)
    3e34:	2f0b           	move.l a3,-(sp)
    3e36:	4879 0000 7474 	pea 7474 <destlinezoom18>
    3e3c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3e3e:	486a 0001      	pea 1(a2)
    3e42:	2f04           	move.l d4,-(sp)
    3e44:	486b 0030      	pea 48(a3)
    3e48:	4879 0000 7474 	pea 7474 <destlinezoom18>
    3e4e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3e50:	4642           	not.w d2
    3e52:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    3e54:	4fef 0020      	lea 32(sp),sp
    3e58:	b4fc 0108      	cmpa.w #264,a2
    3e5c:	673e           	beq.s 3e9c <ZoomTest+0x2570>
    3e5e:	200b           	move.l a3,d0
    3e60:	0680 0000 00c0 	addi.l #192,d0
    3e66:	2645           	movea.l d5,a3
    3e68:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3e6a:	7800           	moveq #0,d4
    3e6c:	3802           	move.w d2,d4
    3e6e:	2f0a           	move.l a2,-(sp)
    3e70:	2f04           	move.l d4,-(sp)
    3e72:	2f0b           	move.l a3,-(sp)
    3e74:	4879 0000 7474 	pea 7474 <destlinezoom18>
    3e7a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3e7c:	486a 0001      	pea 1(a2)
    3e80:	2f04           	move.l d4,-(sp)
    3e82:	486b 0030      	pea 48(a3)
    3e86:	4879 0000 7474 	pea 7474 <destlinezoom18>
    3e8c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3e8e:	4642           	not.w d2
    3e90:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    3e92:	4fef 0020      	lea 32(sp),sp
    3e96:	b4fc 0108      	cmpa.w #264,a2
    3e9a:	66c2           	bne.s 3e5e <ZoomTest+0x2532>
  TestRow( valsupposed, valactual, mask, 0);
    3e9c:	42a7           	clr.l -(sp)
    3e9e:	3f02           	move.w d2,-(sp)
    3ea0:	4267           	clr.w -(sp)
    3ea2:	2f05           	move.l d5,-(sp)
    3ea4:	4879 0000 7474 	pea 7474 <destlinezoom18>
    3eaa:	4e95           	jsr (a5)
  FreeMem( source, (ZMLINESIZE+4)*272);
    3eac:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    3eb2:	224c           	movea.l a4,a1
    3eb4:	203c 0000 3740 	move.l #14144,d0
    3eba:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    3ebe:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    3ec4:	2243           	movea.l d3,a1
    3ec6:	203c 0000 3740 	move.l #14144,d0
    3ecc:	4eae ff2e      	jsr -210(a6)
    3ed0:	4fef 0010      	lea 16(sp),sp
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3ed4:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    3eda:	203c 0001 1440 	move.l #70720,d0
    3ee0:	7202           	moveq #2,d1
    3ee2:	4eae ff3a      	jsr -198(a6)
    3ee6:	2f40 0034      	move.l d0,52(sp)
  if( source == 0) {
    3eea:	6700 032e      	beq.w 421a <ZoomTest+0x28ee>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3eee:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    3ef4:	203c 0001 1440 	move.l #70720,d0
    3efa:	7202           	moveq #2,d1
    3efc:	4eae ff3a      	jsr -198(a6)
    3f00:	2f40 0038      	move.l d0,56(sp)
  if( destination == 0) {
    3f04:	6700 0380      	beq.w 4286 <ZoomTest+0x295a>
    3f08:	242f 0034      	move.l 52(sp),d2
    3f0c:	0682 0000 ff00 	addi.l #65280,d2
    3f12:	246f 0034      	movea.l 52(sp),a2
    3f16:	4878 00f0      	pea f0 <main+0xea>
    3f1a:	4878 0055      	pea 55 <main+0x4f>
    3f1e:	2f0a           	move.l a2,-(sp)
    3f20:	4eba 0462      	jsr 4384 <memset>(pc)
    3f24:	4878 00f0      	pea f0 <main+0xea>
    3f28:	4878 00aa      	pea aa <main+0xa4>
    3f2c:	486a 00f0      	pea 240(a2)
    3f30:	4eba 0452      	jsr 4384 <memset>(pc)
    3f34:	45ea 01e0      	lea 480(a2),a2
  for(int i=0;i<128+8;i++) {
    3f38:	4fef 0018      	lea 24(sp),sp
    3f3c:	b48a           	cmp.l a2,d2
    3f3e:	66d6           	bne.s 3f16 <ZoomTest+0x25ea>
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3f40:	4878 0005      	pea 5 <_start+0x5>
    3f44:	42a7           	clr.l -(sp)
    3f46:	2f2f 0040      	move.l 64(sp),-(sp)
    3f4a:	2f2f 0040      	move.l 64(sp),-(sp)
    3f4e:	4eba cfb2      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3f52:	2c79 0000 77ec 	movea.l 77ec <GfxBase>,a6
    3f58:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<14;i++) {
    3f5c:	202f 0048      	move.l 72(sp),d0
    3f60:	0680 0000 11d4 	addi.l #4564,d0
    3f66:	2f40 003c      	move.l d0,60(sp)
    3f6a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3f6e:	7c12           	moveq #18,d6
  UWORD mask = 0xffff;
    3f70:	7eff           	moveq #-1,d7
    3f72:	4bfa ca36      	lea 9aa <TestRow>(pc),a5
    3f76:	41ef 0078      	lea 120(sp),a0
    3f7a:	2f48 0048      	move.l a0,72(sp)
    3f7e:	2f4d 0030      	move.l a5,48(sp)
    3f82:	2a46           	movea.l d6,a5
    3f84:	282f 002c      	move.l 44(sp),d4
    3f88:	0684 ffff ef4a 	addi.l #-4278,d4
    3f8e:	3c0d           	move.w a5,d6
    3f90:	0646 ffee      	addi.w #-18,d6
    3f94:	307c 002a      	movea.w #42,a0
    3f98:	d1ef 002c      	adda.l 44(sp),a0
    3f9c:	2f48 0044      	move.l a0,68(sp)
    3fa0:	2f4d 003c      	move.l a5,60(sp)
    3fa4:	2844           	movea.l d4,a4
    3fa6:	49ec ff10      	lea -240(a4),a4
    3faa:	41ec ffd6      	lea -42(a4),a0
    3fae:	2f48 0040      	move.l a0,64(sp)
  char str[ 100] = { 0 };
    3fb2:	4878 0064      	pea 64 <main+0x5e>
    3fb6:	42a7           	clr.l -(sp)
    3fb8:	486f 0080      	pea 128(sp)
    3fbc:	4eba 03c6      	jsr 4384 <memset>(pc)
  data[1] = numberofline;
    3fc0:	3f46 0082      	move.w d6,130(sp)
    3fc4:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    3fc8:	7a00           	moveq #0,d5
  testpattern += 0;
    3fca:	4bf9 0000 7760 	lea 7760 <destlinezoom1>,a5
    if( (*testpattern++ ^ xormask) != *destination++) {
    3fd0:	301d           	move.w (a5)+,d0
    3fd2:	bf40           	eor.w d7,d0
    3fd4:	206f 0040      	movea.l 64(sp),a0
    3fd8:	54af 0040      	addq.l #2,64(sp)
    3fdc:	b058           	cmp.w (a0)+,d0
    3fde:	673c           	beq.s 401c <ZoomTest+0x26f0>
      data[0] = i;
    3fe0:	3f45 0074      	move.w d5,116(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    3fe4:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    3fea:	41f9 0000 4d7f 	lea 4d7f <incbin_swfont_end+0x49>,a0
    3ff0:	43ef 0074      	lea 116(sp),a1
    3ff4:	45f9 0000 4570 	lea 4570 <PutChar>,a2
    3ffa:	47ef 0078      	lea 120(sp),a3
    3ffe:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    4002:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    4008:	4eae ffc4      	jsr -60(a6)
    400c:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    4012:	2200           	move.l d0,d1
    4014:	240b           	move.l a3,d2
    4016:	7664           	moveq #100,d3
    4018:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    401c:	5285           	addq.l #1,d5
    401e:	bbfc 0000 778a 	cmpa.l #30602,a5
    4024:	66aa           	bne.s 3fd0 <ZoomTest+0x26a4>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    4026:	3039 0000 778a 	move.w 778a <destlinezoom1+0x2a>,d0
    402c:	bf40           	eor.w d7,d0
    402e:	3214           	move.w (a4),d1
    4030:	b340           	eor.w d1,d0
    4032:	0240 ff00      	andi.w #-256,d0
    4036:	6600 00b4      	bne.w 40ec <ZoomTest+0x27c0>
        valactual += ZMLINESIZE/2;
    403a:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    403e:	b88c           	cmp.l a4,d4
    4040:	6600 ff68      	bne.w 3faa <ZoomTest+0x267e>
      mask = mask ^ 0xffff;
    4044:	4647           	not.w d7
    4046:	0684 0000 00f0 	addi.l #240,d4
    404c:	5246           	addq.w #1,d6
    for(int i2=0;i2<18;i2++) { 
    404e:	b8af 0044      	cmp.l 68(sp),d4
    4052:	6600 ff50      	bne.w 3fa4 <ZoomTest+0x2678>
    4056:	2a6f 003c      	movea.l 60(sp),a5
    405a:	246f 002c      	movea.l 44(sp),a2
    405e:	45ea ff10      	lea -240(a2),a2
    4062:	7600           	moveq #0,d3
    4064:	3607           	move.w d7,d3
      TestRow( valsupposed, valactual, mask, 18+i*19);
    4066:	2f0d           	move.l a5,-(sp)
    4068:	2f03           	move.l d3,-(sp)
    406a:	2f0a           	move.l a2,-(sp)
    406c:	4879 0000 7760 	pea 7760 <destlinezoom1>
    4072:	206f 0040      	movea.l 64(sp),a0
    4076:	4e90           	jsr (a0)
      valactual += ZMLINESIZE/2;
    4078:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    407c:	4fef 0010      	lea 16(sp),sp
    4080:	b5ef 002c      	cmpa.l 44(sp),a2
    4084:	66e0           	bne.s 4066 <ZoomTest+0x273a>
    4086:	45ea 11d0      	lea 4560(a2),a2
    408a:	2f4a 002c      	move.l a2,44(sp)
    408e:	4bed 0013      	lea 19(a5),a5
  for(int i=0;i<14;i++) {
    4092:	bafc 011c      	cmpa.w #284,a5
    4096:	6600 feec      	bne.w 3f84 <ZoomTest+0x2658>
    409a:	2a6f 0030      	movea.l 48(sp),a5
    409e:	246f 0038      	movea.l 56(sp),a2
    40a2:	d5fc 0000 f964 	adda.l #63844,a2
    40a8:	243c 0000 0109 	move.l #265,d2
    40ae:	280a           	move.l a2,d4
    40b0:	0684 0000 00f0 	addi.l #240,d4
      TestRow( valsupposed, valactual, mask, i2+265);
    40b6:	2f02           	move.l d2,-(sp)
    40b8:	2f03           	move.l d3,-(sp)
    40ba:	2f0a           	move.l a2,-(sp)
    40bc:	4879 0000 7760 	pea 7760 <destlinezoom1>
    40c2:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    40c4:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    40c8:	4fef 0010      	lea 16(sp),sp
    40cc:	b88a           	cmp.l a2,d4
    40ce:	66e6           	bne.s 40b6 <ZoomTest+0x278a>
    mask = mask ^ 0xffff;
    40d0:	4647           	not.w d7
    40d2:	5282           	addq.l #1,d2
  for(int i2=0;i2<4;i2++) { 
    40d4:	0c82 0000 010d 	cmpi.l #269,d2
    40da:	6700 009e      	beq.w 417a <ZoomTest+0x284e>
    40de:	7600           	moveq #0,d3
    40e0:	3607           	move.w d7,d3
    40e2:	280a           	move.l a2,d4
    40e4:	0684 0000 00f0 	addi.l #240,d4
    40ea:	60ca           	bra.s 40b6 <ZoomTest+0x278a>
    data[0] = 21;
    40ec:	3f7c 0015 0074 	move.w #21,116(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    40f2:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    40f8:	41f9 0000 4d7f 	lea 4d7f <incbin_swfont_end+0x49>,a0
    40fe:	43ef 0074      	lea 116(sp),a1
    4102:	45f9 0000 4570 	lea 4570 <PutChar>,a2
    4108:	47ef 0078      	lea 120(sp),a3
    410c:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    4110:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    4116:	4eae ffc4      	jsr -60(a6)
    411a:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    4120:	2200           	move.l d0,d1
    4122:	240b           	move.l a3,d2
    4124:	7664           	moveq #100,d3
    4126:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    412a:	7000           	moveq #0,d0
    412c:	3014           	move.w (a4),d0
    412e:	2f00           	move.l d0,-(sp)
    4130:	3039 0000 778a 	move.w 778a <destlinezoom1+0x2a>,d0
    4136:	2f00           	move.l d0,-(sp)
    4138:	4879 0000 4daf 	pea 4daf <incbin_swfont_end+0x79>
    413e:	4eba c802      	jsr 942 <KPrintF>(pc)
        valactual += ZMLINESIZE/2;
    4142:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    4146:	4fef 000c      	lea 12(sp),sp
    414a:	b88c           	cmp.l a4,d4
    414c:	6700 fef6      	beq.w 4044 <ZoomTest+0x2718>
    4150:	41ec ffd6      	lea -42(a4),a0
    4154:	2f48 0040      	move.l a0,64(sp)
  char str[ 100] = { 0 };
    4158:	4878 0064      	pea 64 <main+0x5e>
    415c:	42a7           	clr.l -(sp)
    415e:	486f 0080      	pea 128(sp)
    4162:	4eba 0220      	jsr 4384 <memset>(pc)
  data[1] = numberofline;
    4166:	3f46 0082      	move.w d6,130(sp)
    416a:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    416e:	7a00           	moveq #0,d5
  testpattern += 0;
    4170:	4bf9 0000 7760 	lea 7760 <destlinezoom1>,a5
    4176:	6000 fe58      	bra.w 3fd0 <ZoomTest+0x26a4>
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    417a:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    4180:	226f 0034      	movea.l 52(sp),a1
    4184:	203c 0001 1440 	move.l #70720,d0
    418a:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    418e:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    4194:	226f 0038      	movea.l 56(sp),a1
    4198:	203c 0001 1440 	move.l #70720,d0
    419e:	4eae ff2e      	jsr -210(a6)
}
    41a2:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    41a6:	4fef 00b0      	lea 176(sp),sp
    41aa:	4e75           	rts
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    41ac:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    41b2:	4eae ffc4      	jsr -60(a6)
    41b6:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    41bc:	2200           	move.l d0,d1
    41be:	243c 0000 511d 	move.l #20765,d2
    41c4:	7635           	moveq #53,d3
    41c6:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    41ca:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    41d0:	203c 0000 3740 	move.l #14144,d0
    41d6:	7202           	moveq #2,d1
    41d8:	4eae ff3a      	jsr -198(a6)
    41dc:	2600           	move.l d0,d3
  if( source == 0) {
    41de:	6600 df0a      	bne.w 20ea <ZoomTest+0x7be>
    Write(  Output(), 
    41e2:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    41e8:	4eae ffc4      	jsr -60(a6)
    41ec:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    41f2:	2200           	move.l d0,d1
    41f4:	243c 0000 5194 	move.l #20884,d2
    41fa:	7639           	moveq #57,d3
    41fc:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    4200:	2c79 0000 77f8 	movea.l 77f8 <SysBase>,a6
    4206:	203c 0001 1440 	move.l #70720,d0
    420c:	7202           	moveq #2,d1
    420e:	4eae ff3a      	jsr -198(a6)
    4212:	2f40 0034      	move.l d0,52(sp)
  if( source == 0) {
    4216:	6600 fcd6      	bne.w 3eee <ZoomTest+0x25c2>
    Write(  Output(), 
    421a:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    4220:	4eae ffc4      	jsr -60(a6)
    4224:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    422a:	2200           	move.l d0,d1
    422c:	243c 0000 5194 	move.l #20884,d2
    4232:	7639           	moveq #57,d3
    4234:	4eae ffd0      	jsr -48(a6)
}
    4238:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    423c:	4fef 00b0      	lea 176(sp),sp
    4240:	4e75           	rts
    Write(  Output(), 
    4242:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    4248:	4eae ffc4      	jsr -60(a6)
    424c:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    4252:	2200           	move.l d0,d1
    4254:	243c 0000 5090 	move.l #20624,d2
    425a:	7636           	moveq #54,d3
    425c:	4eae ffd0      	jsr -48(a6)
    return;
    4260:	6000 dc36      	bra.w 1e98 <ZoomTest+0x56c>
    Write(  Output(), 
    4264:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    426a:	4eae ffc4      	jsr -60(a6)
    426e:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    4274:	2200           	move.l d0,d1
    4276:	243c 0000 4e57 	move.l #20055,d2
    427c:	7639           	moveq #57,d3
    427e:	4eae ffd0      	jsr -48(a6)
    return;
    4282:	6000 d8a2      	bra.w 1b26 <ZoomTest+0x1fa>
    Write(  Output(), 
    4286:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    428c:	4eae ffc4      	jsr -60(a6)
    4290:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    4296:	2200           	move.l d0,d1
    4298:	243c 0000 51ce 	move.l #20942,d2
    429e:	763d           	moveq #61,d3
    42a0:	4eae ffd0      	jsr -48(a6)
}
    42a4:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    42a8:	4fef 00b0      	lea 176(sp),sp
    42ac:	4e75           	rts
    Write(  Output(), 
    42ae:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    42b4:	4eae ffc4      	jsr -60(a6)
    42b8:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    42be:	2200           	move.l d0,d1
    42c0:	243c 0000 4e8e 	move.l #20110,d2
    42c6:	763d           	moveq #61,d3
    42c8:	4eae ffd0      	jsr -48(a6)
    return;
    42cc:	6000 d858      	bra.w 1b26 <ZoomTest+0x1fa>
    Write(  Output(), 
    42d0:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    42d6:	4eae ffc4      	jsr -60(a6)
    42da:	2c79 0000 77f4 	movea.l 77f4 <DOSBase>,a6
    42e0:	2200           	move.l d0,d1
    42e2:	243c 0000 51ce 	move.l #20942,d2
    42e8:	763d           	moveq #61,d3
    42ea:	4eae ffd0      	jsr -48(a6)
    return;
    42ee:	6000 fbe4      	bra.w 3ed4 <ZoomTest+0x25a8>

000042f2 <memcpy>:
{
    42f2:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    42f6:	202f 0014      	move.l 20(sp),d0
    42fa:	226f 0018      	movea.l 24(sp),a1
    42fe:	222f 001c      	move.l 28(sp),d1
	while(len--)
    4302:	2601           	move.l d1,d3
    4304:	5383           	subq.l #1,d3
    4306:	4a81           	tst.l d1
    4308:	6762           	beq.s 436c <memcpy+0x7a>
    430a:	2040           	movea.l d0,a0
    430c:	5888           	addq.l #4,a0
    430e:	b1c9           	cmpa.l a1,a0
    4310:	53c2           	sl.s d2
    4312:	4402           	neg.b d2
    4314:	41e9 0004      	lea 4(a1),a0
    4318:	b1c0           	cmpa.l d0,a0
    431a:	53c4           	sl.s d4
    431c:	4404           	neg.b d4
    431e:	8404           	or.b d4,d2
    4320:	7808           	moveq #8,d4
    4322:	b883           	cmp.l d3,d4
    4324:	55c4           	sc.s d4
    4326:	4404           	neg.b d4
    4328:	c404           	and.b d4,d2
    432a:	6746           	beq.s 4372 <memcpy+0x80>
    432c:	2409           	move.l a1,d2
    432e:	8480           	or.l d0,d2
    4330:	7803           	moveq #3,d4
    4332:	c484           	and.l d4,d2
    4334:	663c           	bne.s 4372 <memcpy+0x80>
    4336:	2049           	movea.l a1,a0
    4338:	2440           	movea.l d0,a2
    433a:	74fc           	moveq #-4,d2
    433c:	c481           	and.l d1,d2
    433e:	d489           	add.l a1,d2
		*d++ = *s++;
    4340:	24d8           	move.l (a0)+,(a2)+
    4342:	b488           	cmp.l a0,d2
    4344:	66fa           	bne.s 4340 <memcpy+0x4e>
    4346:	74fc           	moveq #-4,d2
    4348:	c481           	and.l d1,d2
    434a:	2040           	movea.l d0,a0
    434c:	d1c2           	adda.l d2,a0
    434e:	d3c2           	adda.l d2,a1
    4350:	9682           	sub.l d2,d3
    4352:	b481           	cmp.l d1,d2
    4354:	6716           	beq.s 436c <memcpy+0x7a>
    4356:	1091           	move.b (a1),(a0)
	while(len--)
    4358:	4a83           	tst.l d3
    435a:	6710           	beq.s 436c <memcpy+0x7a>
		*d++ = *s++;
    435c:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    4362:	5383           	subq.l #1,d3
    4364:	6706           	beq.s 436c <memcpy+0x7a>
		*d++ = *s++;
    4366:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    436c:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    4370:	4e75           	rts
    4372:	2040           	movea.l d0,a0
    4374:	d289           	add.l a1,d1
		*d++ = *s++;
    4376:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    4378:	b289           	cmp.l a1,d1
    437a:	67f0           	beq.s 436c <memcpy+0x7a>
		*d++ = *s++;
    437c:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    437e:	b289           	cmp.l a1,d1
    4380:	66f4           	bne.s 4376 <memcpy+0x84>
    4382:	60e8           	bra.s 436c <memcpy+0x7a>

00004384 <memset>:
{
    4384:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    4388:	202f 0024      	move.l 36(sp),d0
    438c:	2a2f 0028      	move.l 40(sp),d5
    4390:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    4394:	2809           	move.l a1,d4
    4396:	5384           	subq.l #1,d4
    4398:	b2fc 0000      	cmpa.w #0,a1
    439c:	6f00 00b0      	ble.w 444e <memset+0xca>
    43a0:	1e05           	move.b d5,d7
    43a2:	2200           	move.l d0,d1
    43a4:	4481           	neg.l d1
    43a6:	7403           	moveq #3,d2
    43a8:	c282           	and.l d2,d1
    43aa:	7c05           	moveq #5,d6
		*ptr++ = val;
    43ac:	2440           	movea.l d0,a2
    43ae:	bc84           	cmp.l d4,d6
    43b0:	646a           	bcc.s 441c <memset+0x98>
    43b2:	4a81           	tst.l d1
    43b4:	6724           	beq.s 43da <memset+0x56>
    43b6:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    43b8:	5384           	subq.l #1,d4
    43ba:	7401           	moveq #1,d2
    43bc:	b481           	cmp.l d1,d2
    43be:	671a           	beq.s 43da <memset+0x56>
		*ptr++ = val;
    43c0:	2440           	movea.l d0,a2
    43c2:	548a           	addq.l #2,a2
    43c4:	2040           	movea.l d0,a0
    43c6:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    43ca:	5384           	subq.l #1,d4
    43cc:	7403           	moveq #3,d2
    43ce:	b481           	cmp.l d1,d2
    43d0:	6608           	bne.s 43da <memset+0x56>
		*ptr++ = val;
    43d2:	528a           	addq.l #1,a2
    43d4:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    43d8:	5384           	subq.l #1,d4
    43da:	2609           	move.l a1,d3
    43dc:	9681           	sub.l d1,d3
    43de:	7c00           	moveq #0,d6
    43e0:	1c05           	move.b d5,d6
    43e2:	2406           	move.l d6,d2
    43e4:	4842           	swap d2
    43e6:	4242           	clr.w d2
    43e8:	2042           	movea.l d2,a0
    43ea:	2406           	move.l d6,d2
    43ec:	e14a           	lsl.w #8,d2
    43ee:	4842           	swap d2
    43f0:	4242           	clr.w d2
    43f2:	e18e           	lsl.l #8,d6
    43f4:	2646           	movea.l d6,a3
    43f6:	2c08           	move.l a0,d6
    43f8:	8486           	or.l d6,d2
    43fa:	2c0b           	move.l a3,d6
    43fc:	8486           	or.l d6,d2
    43fe:	1407           	move.b d7,d2
    4400:	2040           	movea.l d0,a0
    4402:	d1c1           	adda.l d1,a0
    4404:	72fc           	moveq #-4,d1
    4406:	c283           	and.l d3,d1
    4408:	d288           	add.l a0,d1
		*ptr++ = val;
    440a:	20c2           	move.l d2,(a0)+
    440c:	b1c1           	cmpa.l d1,a0
    440e:	66fa           	bne.s 440a <memset+0x86>
    4410:	72fc           	moveq #-4,d1
    4412:	c283           	and.l d3,d1
    4414:	d5c1           	adda.l d1,a2
    4416:	9881           	sub.l d1,d4
    4418:	b283           	cmp.l d3,d1
    441a:	6732           	beq.s 444e <memset+0xca>
    441c:	1485           	move.b d5,(a2)
	while(len-- > 0)
    441e:	4a84           	tst.l d4
    4420:	6f2c           	ble.s 444e <memset+0xca>
		*ptr++ = val;
    4422:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    4426:	7201           	moveq #1,d1
    4428:	b284           	cmp.l d4,d1
    442a:	6c22           	bge.s 444e <memset+0xca>
		*ptr++ = val;
    442c:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    4430:	7402           	moveq #2,d2
    4432:	b484           	cmp.l d4,d2
    4434:	6c18           	bge.s 444e <memset+0xca>
		*ptr++ = val;
    4436:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    443a:	7c03           	moveq #3,d6
    443c:	bc84           	cmp.l d4,d6
    443e:	6c0e           	bge.s 444e <memset+0xca>
		*ptr++ = val;
    4440:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    4444:	7204           	moveq #4,d1
    4446:	b284           	cmp.l d4,d1
    4448:	6c04           	bge.s 444e <memset+0xca>
		*ptr++ = val;
    444a:	1545 0005      	move.b d5,5(a2)
}
    444e:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    4452:	4e75           	rts

00004454 <strlen>:
{
    4454:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    4458:	7000           	moveq #0,d0
	while(*s++)
    445a:	4a10           	tst.b (a0)
    445c:	6708           	beq.s 4466 <strlen+0x12>
		t++;
    445e:	5280           	addq.l #1,d0
	while(*s++)
    4460:	4a30 0800      	tst.b (0,a0,d0.l)
    4464:	66f8           	bne.s 445e <strlen+0xa>
}
    4466:	4e75           	rts

00004468 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    4468:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    446c:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    4470:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    4474:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    4478:	d041           	add.w d1,d0
	swap	d0
    447a:	4840           	swap d0
	clrw	d0
    447c:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    447e:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    4482:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    4486:	d081           	add.l d1,d0

	rts
    4488:	4e75           	rts

0000448a <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    448a:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    448c:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    4490:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    4494:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    449a:	6416           	bcc.s 44b2 <__udivsi3+0x28>
	movel	d0, d2
    449c:	2400           	move.l d0,d2
	clrw	d2
    449e:	4242           	clr.w d2
	swap	d2
    44a0:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    44a2:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    44a4:	3002           	move.w d2,d0
	swap	d0
    44a6:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    44a8:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    44ac:	84c1           	divu.w d1,d2
	movew	d2, d0
    44ae:	3002           	move.w d2,d0
	jra	6f
    44b0:	6030           	bra.s 44e2 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    44b2:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    44b4:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    44b6:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    44b8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    44be:	64f4           	bcc.s 44b4 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    44c0:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    44c2:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    44c8:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    44ca:	c2c0           	mulu.w d0,d1
	swap	d2
    44cc:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    44ce:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    44d0:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    44d2:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    44d4:	660a           	bne.s 44e0 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    44d6:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    44d8:	6506           	bcs.s 44e0 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    44da:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    44de:	6302           	bls.s 44e2 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    44e0:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    44e2:	241f           	move.l (sp)+,d2
	rts
    44e4:	4e75           	rts

000044e6 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    44e6:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    44e8:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    44ea:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    44ee:	6a04           	bpl.s 44f4 <__divsi3+0xe>
	negl	d1
    44f0:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    44f2:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    44f4:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    44f8:	6a04           	bpl.s 44fe <__divsi3+0x18>
	negl	d0
    44fa:	4480           	neg.l d0
	negb	d2
    44fc:	4402           	neg.b d2

2:	movel	d1, sp@-
    44fe:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4500:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    4502:	6186           	bsr.s 448a <__udivsi3>
	addql	IMM (8), sp
    4504:	508f           	addq.l #8,sp

	tstb	d2
    4506:	4a02           	tst.b d2
	jpl	3f
    4508:	6a02           	bpl.s 450c <__divsi3+0x26>
	negl	d0
    450a:	4480           	neg.l d0

3:	movel	sp@+, d2
    450c:	241f           	move.l (sp)+,d2
	rts
    450e:	4e75           	rts

00004510 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    4510:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    4514:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    4518:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    451a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    451c:	61c8           	bsr.s 44e6 <__divsi3>
	addql	IMM (8), sp
    451e:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    4520:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    4524:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4526:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    4528:	6100 ff3e      	bsr.w 4468 <__mulsi3>
	addql	IMM (8), sp
    452c:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    452e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    4532:	9280           	sub.l d0,d1
	movel	d1, d0
    4534:	2001           	move.l d1,d0
	rts
    4536:	4e75           	rts

00004538 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    4538:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    453c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    4540:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4542:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    4544:	6100 ff44      	bsr.w 448a <__udivsi3>
	addql	IMM (8), sp
    4548:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    454a:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    454e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4550:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    4552:	6100 ff14      	bsr.w 4468 <__mulsi3>
	addql	IMM (8), sp
    4556:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    4558:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    455c:	9280           	sub.l d0,d1
	movel	d1, d0
    455e:	2001           	move.l d1,d0
	rts
    4560:	4e75           	rts

00004562 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    4562:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    4564:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    4568:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    456c:	2c5f           	movea.l (sp)+,a6
    rts
    456e:	4e75           	rts

00004570 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    4570:	16c0           	move.b d0,(a3)+
	rts
    4572:	4e75           	rts

00004574 <saveregs>:
	...

000045b0 <font2distance>:
    45b0:	0505           	btst d2,d5
    45b2:	0505           	btst d2,d5
    45b4:	0505           	btst d2,d5
    45b6:	0505           	btst d2,d5
    45b8:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    45ba:	0505           	btst d2,d5
    45bc:	0505           	btst d2,d5
    45be:	0005 0505      	ori.b #5,d5
    45c2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    45c4:	0505           	btst d2,d5
    45c6:	0505           	btst d2,d5
    45c8:	0505           	btst d2,d5
    45ca:	0505           	btst d2,d5
    45cc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    45ce:	0505           	btst d2,d5
    45d0:	0505           	btst d2,d5
    45d2:	0505           	btst d2,d5
    45d4:	0505           	btst d2,d5
    45d6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    45d8:	0500           	btst d2,d0
    45da:	0505           	btst d2,d5
    45dc:	0505           	btst d2,d5
    45de:	0505           	btst d2,d5
    45e0:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    45e2:	0505           	btst d2,d5
    45e4:	0505           	btst d2,d5
    45e6:	0505           	btst d2,d5
    45e8:	0505           	btst d2,d5
    45ea:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    45ec:	0505           	btst d2,d5
    45ee:	0505           	btst d2,d5
    45f0:	0503           	btst d2,d3
    45f2:	0505           	btst d2,d5
    45f4:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    45f6:	0505           	btst d2,d5
    45f8:	0500           	btst d2,d0
    45fa:	0505           	btst d2,d5
    45fc:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    4600:	0505           	btst d2,d5
    4602:	0503           	btst d2,d3
    4604:	0205 0507      	andi.b #7,d5
    4608:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    460a:	0505           	btst d2,d5
    460c:	0505           	btst d2,d5
    460e:	0505           	btst d2,d5
    4610:	0505           	btst d2,d5
    4612:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4614:	0505           	btst d2,d5
    4616:	0505           	btst d2,d5
    4618:	0505           	btst d2,d5
    461a:	0505           	btst d2,d5
    461c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    461e:	0505           	btst d2,d5
    4620:	0505           	btst d2,d5
    4622:	0505           	btst d2,d5
    4624:	0505           	btst d2,d5
    4626:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4628:	0505           	btst d2,d5
    462a:	0505           	btst d2,d5
    462c:	0505           	btst d2,d5
    462e:	0505           	btst d2,d5
    4630:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4632:	0505           	btst d2,d5
    4634:	0505           	btst d2,d5
    4636:	0505           	btst d2,d5
    4638:	0505           	btst d2,d5
    463a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    463c:	0505           	btst d2,d5
    463e:	0505           	btst d2,d5
    4640:	0505           	btst d2,d5
    4642:	0505           	btst d2,d5
    4644:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4646:	0505           	btst d2,d5
    4648:	0505           	btst d2,d5
    464a:	0505           	btst d2,d5
    464c:	0505           	btst d2,d5
    464e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4650:	0505           	btst d2,d5
    4652:	0505           	btst d2,d5
    4654:	0505           	btst d2,d5
    4656:	0505           	btst d2,d5
    4658:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    465a:	0505           	btst d2,d5
    465c:	0505           	btst d2,d5
    465e:	0505           	btst d2,d5
    4660:	0505           	btst d2,d5
    4662:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4664:	0505           	btst d2,d5
    4666:	0505           	btst d2,d5
    4668:	0505           	btst d2,d5
    466a:	0505           	btst d2,d5
    466c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    466e:	0505           	btst d2,d5
    4670:	0505           	btst d2,d5
    4672:	0505           	btst d2,d5
    4674:	0505           	btst d2,d5
    4676:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4678:	0505           	btst d2,d5
    467a:	0505           	btst d2,d5
    467c:	0505           	btst d2,d5
    467e:	0505           	btst d2,d5
    4680:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4682:	0505           	btst d2,d5
    4684:	0505           	btst d2,d5
    4686:	0505           	btst d2,d5
    4688:	0505           	btst d2,d5
    468a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    468c:	0505           	btst d2,d5
    468e:	0505           	btst d2,d5
    4690:	0505           	btst d2,d5
    4692:	0505           	btst d2,d5
    4694:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4696:	0505           	btst d2,d5
    4698:	0505           	btst d2,d5
    469a:	0505           	btst d2,d5
    469c:	0505           	btst d2,d5
    469e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    46a0:	0505           	btst d2,d5
    46a2:	0505           	btst d2,d5
    46a4:	0505           	btst d2,d5
    46a6:	0505           	btst d2,d5
    46a8:	0505           	btst d2,d5

000046aa <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    46aa:	16c0           	move.b d0,(a3)+
  RTS
    46ac:	4e75           	rts

000046ae <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    46ae:	48f9 7fff 0000 	movem.l d0-a6,4574 <saveregs>
    46b4:	4574 
  lea 0xdff000,a5
    46b6:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddabae>,a5
  move.l sp@(4),a0  //Fontlocation
    46bc:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    46c0:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    46c4:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    46c8:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    46ca:	082d 0006 0002 	btst #6,2(a5)

000046d0 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    46d0:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    46d6:	66f8           	bne.s 46d0 <st2wblit>

000046d8 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    46d8:	7019           	moveq #25,d0
	sub.l d5,d5      
    46da:	9a85           	sub.l d5,d5

000046dc <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    46dc:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    46de:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    46e0:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    46e4:	9dce           	suba.l a6,a6
	move.l d2, a6
    46e6:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    46e8:	ddfc 0000 45b0 	adda.l #17840,a6

	LSL  	#4,d2 	    //Fetch next char
    46ee:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    46f0:	2842           	movea.l d2,a4


	move.l  #0,d4
    46f2:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    46f4:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    46f6:	3814           	move.w (a4),d4
	swap	d4
    46f8:	4844           	swap d4
	lsr.l	d5, d4
    46fa:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    46fc:	8993           	or.l d4,(a3)
	clr.l	d4
    46fe:	4284           	clr.l d4
	move.w  2(a4), d4
    4700:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    4704:	4844           	swap d4
	lsr.l	d5, d4
    4706:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    4708:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    470c:	4284           	clr.l d4
	move.w  4(a4), d4
    470e:	382c 0004      	move.w 4(a4),d4
	swap	d4
    4712:	4844           	swap d4
	lsr.l	d5, d4
    4714:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    4716:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    471a:	4284           	clr.l d4
	move.w  6(a4), d4
    471c:	382c 0006      	move.w 6(a4),d4
	swap	d4
    4720:	4844           	swap d4
	lsr.l	d5, d4
    4722:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    4724:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    4728:	4284           	clr.l d4
	move.w  8(a4), d4
    472a:	382c 0008      	move.w 8(a4),d4
	swap	d4
    472e:	4844           	swap d4
	lsr.l	d5, d4
    4730:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    4732:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    4736:	4284           	clr.l d4
	move.w  10(a4), d4
    4738:	382c 000a      	move.w 10(a4),d4
	swap	d4
    473c:	4844           	swap d4
	lsr.l	d5, d4
    473e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    4740:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    4744:	4284           	clr.l d4
	move.w  12(a4), d4
    4746:	382c 000c      	move.w 12(a4),d4
	swap	d4
    474a:	4844           	swap d4
	lsr.l	d5, d4
    474c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    474e:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    4752:	4284           	clr.l d4
	move.w  14(a4), d4
    4754:	382c 000e      	move.w 14(a4),d4
	swap	d4
    4758:	4844           	swap d4
	lsr.l	d5, d4
    475a:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    475c:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    4760:	4284           	clr.l d4

	add.b   (a6), d5
    4762:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    4764:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    4768:	6500 0006      	bcs.w 4770 <noadditionalchar>
	addq.w  #1, a3
    476c:	524b           	addq.w #1,a3
	sub.w   #8,d5
    476e:	5145           	subq.w #8,d5

00004770 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    4770:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    4772:	51c8 ff68      	dbf d0,46dc <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    4776:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    477a:	51cb ff5c      	dbf d3,46d8 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    477e:	4cfa 7fff fdf2 	movem.l 4574 <saveregs>(pc),d0-a6

	RTS
    4784:	4e75           	rts
