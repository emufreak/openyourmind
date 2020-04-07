
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
      10:	23ce 0000 7520 	move.l a6,7520 <SysBase>
	hw = (struct Custom*)0xdff000;
      16:	23fc 00df f000 	move.l #14675968,7510 <hw>
      1c:	0000 7510 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      20:	43f9 0000 4f35 	lea 4f35 <incbin_swfont_end+0x4d7>,a1
      26:	7000           	moveq #0,d0
      28:	4eae fdd8      	jsr -552(a6)
      2c:	23c0 0000 7514 	move.l d0,7514 <GfxBase>
	if (!GfxBase)
      32:	6700 072a      	beq.w 75e <main+0x758>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      36:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
      3c:	43f9 0000 4f46 	lea 4f46 <incbin_swfont_end+0x4e8>,a1
      42:	7000           	moveq #0,d0
      44:	4eae fdd8      	jsr -552(a6)
      48:	23c0 0000 751c 	move.l d0,751c <DOSBase>
	if (!DOSBase)
      4e:	6700 0702      	beq.w 752 <main+0x74c>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      52:	4879 0000 4f52 	pea 4f52 <incbin_swfont_end+0x4f4>
      58:	4eb9 0000 0942 	jsr 942 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      5e:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
      64:	4eae ffc4      	jsr -60(a6)
      68:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
      6e:	2200           	move.l d0,d1
      70:	243c 0000 4f6e 	move.l #20334,d2
      76:	760f           	moveq #15,d3
      78:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      7c:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
      82:	7232           	moveq #50,d1
      84:	4eae ff3a      	jsr -198(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      88:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
      8e:	4eae ffc4      	jsr -60(a6)
      92:	2079 0000 7510 	movea.l 7510 <hw>,a0
      98:	2628 0080      	move.l 128(a0),d3
      9c:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
      a2:	2200           	move.l d0,d1
      a4:	243c 0000 4f7e 	move.l #20350,d2
      aa:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      ae:	47f9 0000 0c8e 	lea c8e <ClBuild>,a3
      b4:	4e93           	jsr (a3)
      b6:	2440           	movea.l d0,a2
      b8:	23c0 0000 7502 	move.l d0,7502 <Copperlist1>
  DrawCopper = Copperlist1;
      be:	23c0 0000 74fa 	move.l d0,74fa <DrawCopper>
  Copperlist2 = ClBuild();
      c4:	4e93           	jsr (a3)
      c6:	23c0 0000 74f4 	move.l d0,74f4 <Copperlist2>
  ViewCopper = Copperlist2;
      cc:	23c0 0000 74e8 	move.l d0,74e8 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      d2:	588f           	addq.l #4,sp
      d4:	2012           	move.l (a2),d0
      d6:	b0b9 0000 715c 	cmp.l 715c <ClsSprites>,d0
      dc:	6600 0608      	bne.w 6e6 <main+0x6e0>
      e0:	202a 0004      	move.l 4(a2),d0
      e4:	b0b9 0000 7160 	cmp.l 7160 <ClsSprites+0x4>,d0
      ea:	6600 05fa      	bne.w 6e6 <main+0x6e0>
      ee:	202a 0008      	move.l 8(a2),d0
      f2:	b0b9 0000 7164 	cmp.l 7164 <ClsSprites+0x8>,d0
      f8:	6600 05ec      	bne.w 6e6 <main+0x6e0>
      fc:	202a 000c      	move.l 12(a2),d0
     100:	b0b9 0000 7168 	cmp.l 7168 <ClsSprites+0xc>,d0
     106:	6600 05de      	bne.w 6e6 <main+0x6e0>
     10a:	202a 0010      	move.l 16(a2),d0
     10e:	b0b9 0000 716c 	cmp.l 716c <ClsSprites+0x10>,d0
     114:	6600 05d0      	bne.w 6e6 <main+0x6e0>
     118:	202a 0014      	move.l 20(a2),d0
     11c:	b0b9 0000 7170 	cmp.l 7170 <ClsSprites+0x14>,d0
     122:	6600 05c2      	bne.w 6e6 <main+0x6e0>
     126:	202a 0018      	move.l 24(a2),d0
     12a:	b0b9 0000 7174 	cmp.l 7174 <ClsSprites+0x18>,d0
     130:	6600 05b4      	bne.w 6e6 <main+0x6e0>
     134:	202a 001c      	move.l 28(a2),d0
     138:	b0b9 0000 7178 	cmp.l 7178 <ClsSprites+0x1c>,d0
     13e:	6600 05a6      	bne.w 6e6 <main+0x6e0>
     142:	202a 0020      	move.l 32(a2),d0
     146:	b0b9 0000 717c 	cmp.l 717c <ClsSprites+0x20>,d0
     14c:	6600 0598      	bne.w 6e6 <main+0x6e0>
     150:	202a 0024      	move.l 36(a2),d0
     154:	b0b9 0000 7180 	cmp.l 7180 <ClsSprites+0x24>,d0
     15a:	6600 058a      	bne.w 6e6 <main+0x6e0>
     15e:	202a 0028      	move.l 40(a2),d0
     162:	b0b9 0000 7184 	cmp.l 7184 <ClsSprites+0x28>,d0
     168:	6600 057c      	bne.w 6e6 <main+0x6e0>
     16c:	202a 002c      	move.l 44(a2),d0
     170:	b0b9 0000 7188 	cmp.l 7188 <ClsSprites+0x2c>,d0
     176:	6600 056e      	bne.w 6e6 <main+0x6e0>
     17a:	202a 0030      	move.l 48(a2),d0
     17e:	b0b9 0000 718c 	cmp.l 718c <ClsSprites+0x30>,d0
     184:	6600 0560      	bne.w 6e6 <main+0x6e0>
     188:	202a 0034      	move.l 52(a2),d0
     18c:	b0b9 0000 7190 	cmp.l 7190 <ClsSprites+0x34>,d0
     192:	6600 0552      	bne.w 6e6 <main+0x6e0>
     196:	202a 0038      	move.l 56(a2),d0
     19a:	b0b9 0000 7194 	cmp.l 7194 <ClsSprites+0x38>,d0
     1a0:	6600 0544      	bne.w 6e6 <main+0x6e0>
     1a4:	246a 003c      	movea.l 60(a2),a2
     1a8:	b5f9 0000 7198 	cmpa.l 7198 <ClsSprites+0x3c>,a2
     1ae:	6600 0536      	bne.w 6e6 <main+0x6e0>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1b2:	2079 0000 7502 	movea.l 7502 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1b8:	2039 0000 712c 	move.l 712c <ClScreen>,d0
     1be:	b0a8 0040      	cmp.l 64(a0),d0
     1c2:	6600 0544      	bne.w 708 <main+0x702>
     1c6:	2039 0000 7130 	move.l 7130 <ClScreen+0x4>,d0
     1cc:	b0a8 0044      	cmp.l 68(a0),d0
     1d0:	6600 0536      	bne.w 708 <main+0x702>
     1d4:	2039 0000 7134 	move.l 7134 <ClScreen+0x8>,d0
     1da:	b0a8 0048      	cmp.l 72(a0),d0
     1de:	6600 0528      	bne.w 708 <main+0x702>
     1e2:	2028 004c      	move.l 76(a0),d0
     1e6:	b0b9 0000 7138 	cmp.l 7138 <ClScreen+0xc>,d0
     1ec:	6600 051a      	bne.w 708 <main+0x702>
     1f0:	2028 0050      	move.l 80(a0),d0
     1f4:	b0b9 0000 713c 	cmp.l 713c <ClScreen+0x10>,d0
     1fa:	6600 050c      	bne.w 708 <main+0x702>
     1fe:	2028 0054      	move.l 84(a0),d0
     202:	b0b9 0000 7140 	cmp.l 7140 <ClScreen+0x14>,d0
     208:	6600 04fe      	bne.w 708 <main+0x702>
     20c:	2028 0058      	move.l 88(a0),d0
     210:	b0b9 0000 7144 	cmp.l 7144 <ClScreen+0x18>,d0
     216:	6600 04f0      	bne.w 708 <main+0x702>
     21a:	2028 005c      	move.l 92(a0),d0
     21e:	b0b9 0000 7148 	cmp.l 7148 <ClScreen+0x1c>,d0
     224:	6600 04e2      	bne.w 708 <main+0x702>
     228:	2028 0060      	move.l 96(a0),d0
     22c:	b0b9 0000 714c 	cmp.l 714c <ClScreen+0x20>,d0
     232:	6600 04d4      	bne.w 708 <main+0x702>
     236:	2028 0064      	move.l 100(a0),d0
     23a:	b0b9 0000 7150 	cmp.l 7150 <ClScreen+0x24>,d0
     240:	6600 04c6      	bne.w 708 <main+0x702>
     244:	2028 0068      	move.l 104(a0),d0
     248:	b0b9 0000 7154 	cmp.l 7154 <ClScreen+0x28>,d0
     24e:	6600 04b8      	bne.w 708 <main+0x702>
     252:	2068 006c      	movea.l 108(a0),a0
     256:	b1f9 0000 7158 	cmpa.l 7158 <ClScreen+0x2c>,a0
     25c:	6600 04aa      	bne.w 708 <main+0x702>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     260:	23fc 0004 0000 	move.l #262144,7508 <DrawBuffer>
     266:	0000 7508 
  ViewBuffer = (ULONG *)0x50000;
     26a:	23fc 0005 0000 	move.l #327680,74fe <ViewBuffer>
     270:	0000 74fe 
  
  SetBplPointers();
     274:	4eb9 0000 1840 	jsr 1840 <SetBplPointers>
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     27a:	0cb9 0005 0000 	cmpi.l #327680,7508 <DrawBuffer>
     280:	0000 7508 
     284:	6700 0596      	beq.w 81c <main+0x816>
    Write( Output(), 
     288:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     28e:	4eae ffc4      	jsr -60(a6)
     292:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     298:	2200           	move.l d0,d1
     29a:	243c 0000 4f81 	move.l #20353,d2
     2a0:	763b           	moveq #59,d3
     2a2:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     2a6:	2079 0000 7502 	movea.l 7502 <Copperlist1>,a0
     2ac:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2b2:	0070 
     2b4:	6724           	beq.s 2da <main+0x2d4>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2b6:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     2bc:	4eae ffc4      	jsr -60(a6)
     2c0:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     2c6:	2200           	move.l d0,d1
     2c8:	243c 0000 4c7f 	move.l #19583,d2
     2ce:	763c           	moveq #60,d3
     2d0:	4eae ffd0      	jsr -48(a6)
     2d4:	2079 0000 7502 	movea.l 7502 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2da:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2e0:	0074 
     2e2:	6724           	beq.s 308 <main+0x302>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2e4:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     2ea:	4eae ffc4      	jsr -60(a6)
     2ee:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     2f4:	2200           	move.l d0,d1
     2f6:	243c 0000 4cbc 	move.l #19644,d2
     2fc:	763c           	moveq #60,d3
     2fe:	4eae ffd0      	jsr -48(a6)
     302:	2079 0000 7502 	movea.l 7502 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     308:	2028 0078      	move.l 120(a0),d0
     30c:	b0b9 0000 7124 	cmp.l 7124 <ClColor>,d0
     312:	6600 0538      	bne.w 84c <main+0x846>
     316:	2028 007c      	move.l 124(a0),d0
     31a:	b0b9 0000 7128 	cmp.l 7128 <ClColor+0x4>,d0
     320:	6600 052a      	bne.w 84c <main+0x846>
  if( instructions[pos] == value ) 
     324:	70fe           	moveq #-2,d0
     326:	b0a8 0080      	cmp.l 128(a0),d0
     32a:	671e           	beq.s 34a <main+0x344>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     32c:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     332:	4eae ffc4      	jsr -60(a6)
     336:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     33c:	2200           	move.l d0,d1
     33e:	243c 0000 4d95 	move.l #19861,d2
     344:	7622           	moveq #34,d3
     346:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     34a:	4eb9 0000 1638 	jsr 1638 <SwapCl>
  
  if( DrawCopper != Copperlist2)
     350:	2039 0000 74fa 	move.l 74fa <DrawCopper>,d0
     356:	b0b9 0000 74f4 	cmp.l 74f4 <Copperlist2>,d0
     35c:	671e           	beq.s 37c <main+0x376>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     35e:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     364:	4eae ffc4      	jsr -60(a6)
     368:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     36e:	2200           	move.l d0,d1
     370:	243c 0000 4fbd 	move.l #20413,d2
     376:	7615           	moveq #21,d3
     378:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild( );
     37c:	4e93           	jsr (a3)
     37e:	23c0 0000 7502 	move.l d0,7502 <Copperlist1>
  Copperlist2 = ClBuild( );
     384:	4e93           	jsr (a3)
     386:	23c0 0000 74f4 	move.l d0,74f4 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
     38c:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
     392:	203c 0000 c800 	move.l #51200,d0
     398:	7202           	moveq #2,d1
     39a:	4eae ff3a      	jsr -198(a6)
     39e:	23c0 0000 74f0 	move.l d0,74f0 <Bitplane1>
  if(Bitplane1 == 0) {
     3a4:	6700 0416      	beq.w 7bc <main+0x7b6>
  ViewBuffer = Bitplane1;
     3a8:	23c0 0000 74fe 	move.l d0,74fe <ViewBuffer>
  ViewCopper = Copperlist1;
     3ae:	23f9 0000 7502 	move.l 7502 <Copperlist1>,74e8 <ViewCopper>
     3b4:	0000 74e8 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     3b8:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
     3be:	203c 0000 c800 	move.l #51200,d0
     3c4:	7202           	moveq #2,d1
     3c6:	4eae ff3a      	jsr -198(a6)
     3ca:	23c0 0000 74ec 	move.l d0,74ec <Bitplane2>
  if(Bitplane2 == 0) {
     3d0:	6700 03b6      	beq.w 788 <main+0x782>
  DrawBuffer = Bitplane2;
     3d4:	23c0 0000 7508 	move.l d0,7508 <DrawBuffer>
  DrawCopper = Copperlist2;
     3da:	23f9 0000 74f4 	move.l 74f4 <Copperlist2>,74fa <DrawCopper>
     3e0:	0000 74fa 
    Write( Output(), 
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
     3e4:	2039 0000 74fe 	move.l 74fe <ViewBuffer>,d0
     3ea:	b0b9 0000 74f0 	cmp.l 74f0 <Bitplane1>,d0
     3f0:	671e           	beq.s 410 <main+0x40a>
    Write( Output(), 
     3f2:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     3f8:	4eae ffc4      	jsr -60(a6)
     3fc:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     402:	2200           	move.l d0,d1
     404:	243c 0000 4fd3 	move.l #20435,d2
     40a:	7638           	moveq #56,d3
     40c:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
     410:	2039 0000 74e8 	move.l 74e8 <ViewCopper>,d0
     416:	b0b9 0000 7502 	cmp.l 7502 <Copperlist1>,d0
     41c:	671e           	beq.s 43c <main+0x436>
    Write( Output(), 
     41e:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     424:	4eae ffc4      	jsr -60(a6)
     428:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     42e:	2200           	move.l d0,d1
     430:	243c 0000 500c 	move.l #20492,d2
     436:	763a           	moveq #58,d3
     438:	4eae ffd0      	jsr -48(a6)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  RunFrame();
     43c:	45f9 0000 186c 	lea 186c <RunFrame>,a2
     442:	4e92           	jsr (a2)
  UWORD *copword = ViewCopper;
     444:	2079 0000 74e8 	movea.l 74e8 <ViewCopper>,a0
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     44a:	7000           	moveq #0,d0
     44c:	3028 0072      	move.w 114(a0),d0
     450:	4840           	swap d0
     452:	4240           	clr.w d0
     454:	7200           	moveq #0,d1
     456:	3228 0076      	move.w 118(a0),d1
     45a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     45c:	b0b9 0000 74ec 	cmp.l 74ec <Bitplane2>,d0
     462:	671e           	beq.s 482 <main+0x47c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     464:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     46a:	4eae ffc4      	jsr -60(a6)
     46e:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     474:	2200           	move.l d0,d1
     476:	243c 0000 5047 	move.l #20551,d2
     47c:	7648           	moveq #72,d3
     47e:	4eae ffd0      	jsr -48(a6)
                                                   " after first frame.\n", 72);
  RunFrame();
     482:	4e92           	jsr (a2)

  copword = (UWORD *) ViewCopper;
     484:	2079 0000 74e8 	movea.l 74e8 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     48a:	7000           	moveq #0,d0
     48c:	3028 0072      	move.w 114(a0),d0
     490:	4840           	swap d0
     492:	4240           	clr.w d0
     494:	7200           	moveq #0,d1
     496:	3228 0076      	move.w 118(a0),d1
     49a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     49c:	b0b9 0000 74f0 	cmp.l 74f0 <Bitplane1>,d0
     4a2:	671e           	beq.s 4c2 <main+0x4bc>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     4a4:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     4aa:	4eae ffc4      	jsr -60(a6)
     4ae:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     4b4:	2200           	move.l d0,d1
     4b6:	243c 0000 5090 	move.l #20624,d2
     4bc:	7649           	moveq #73,d3
     4be:	4eae ffd0      	jsr -48(a6)
                                                  " after second frame.\n", 73);
  
  RunFrame();
     4c2:	4e92           	jsr (a2)

  copword = (UWORD *) ViewCopper;
     4c4:	2079 0000 74e8 	movea.l 74e8 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     4ca:	7000           	moveq #0,d0
     4cc:	3028 0072      	move.w 114(a0),d0
     4d0:	4840           	swap d0
     4d2:	4240           	clr.w d0
     4d4:	7200           	moveq #0,d1
     4d6:	3228 0076      	move.w 118(a0),d1
     4da:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4dc:	b0b9 0000 74ec 	cmp.l 74ec <Bitplane2>,d0
     4e2:	671e           	beq.s 502 <main+0x4fc>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4e4:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     4ea:	4eae ffc4      	jsr -60(a6)
     4ee:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     4f4:	2200           	move.l d0,d1
     4f6:	243c 0000 50da 	move.l #20698,d2
     4fc:	7648           	moveq #72,d3
     4fe:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     502:	2f3c 0000 c800 	move.l #51200,-(sp)
     508:	4878 0084      	pea 84 <main+0x7e>
     50c:	4eb9 0000 18bc 	jsr 18bc <FreeDisplay>
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    ZoomTest();
     512:	4eb9 0000 1974 	jsr 1974 <ZoomTest>

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
     53c:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
     542:	23ee 0022 0000 	move.l 34(a6),74d6 <ActiView>
     548:	74d6 
	OwnBlitter();
     54a:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     54e:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
     554:	4eae ff1c      	jsr -228(a6)
	Disable();
     558:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
     55e:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     562:	2679 0000 7510 	movea.l 7510 <hw>,a3
     568:	302b 0010      	move.w 16(a3),d0
     56c:	33c0 0000 74da 	move.w d0,74da <SystemADKCON>
	SystemInts=hw->intenar;
     572:	302b 001c      	move.w 28(a3),d0
     576:	33c0 0000 74de 	move.w d0,74de <SystemInts>
	SystemDMA=hw->dmaconr;
     57c:	302b 0002      	move.w 2(a3),d0
     580:	33c0 0000 74dc 	move.w d0,74dc <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     586:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     58c:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     592:	45f9 0000 192e 	lea 192e <WaitVbl>,a2
     598:	4e92           	jsr (a2)
	WaitVbl();
     59a:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     59c:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     5a2:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
     5a8:	93c9           	suba.l a1,a1
     5aa:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     5ae:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
     5b4:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     5b8:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
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
     5d8:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
     5de:	082e 0000 0129 	btst #0,297(a6)
     5e4:	6700 028e      	beq.w 874 <main+0x86e>
		vbr = (APTR)Supervisor((void*)getvbr);
     5e8:	7e1a           	moveq #26,d7
     5ea:	de8f           	add.l sp,d7
     5ec:	cf8d           	exg d7,a5
     5ee:	4eae ffe2      	jsr -30(a6)
     5f2:	cf8d           	exg d7,a5

	VBR=GetVBR();
     5f4:	23c0 0000 74e0 	move.l d0,74e0 <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     5fa:	2079 0000 74e0 	movea.l 74e0 <VBR.lto_priv.3>,a0
     600:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     604:	23cb 0000 74e4 	move.l a3,74e4 <SystemIrq>
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
     60e:	2079 0000 7510 	movea.l 7510 <hw>,a0
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
     634:	2279 0000 74e0 	movea.l 74e0 <VBR.lto_priv.3>,a1
     63a:	234b 006c      	move.l a3,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     63e:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
     644:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     64a:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     650:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     656:	3039 0000 74de 	move.w 74de <SystemInts>,d0
     65c:	0040 8000      	ori.w #-32768,d0
     660:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     664:	3039 0000 74dc 	move.w 74dc <SystemDMA>,d0
     66a:	0040 8000      	ori.w #-32768,d0
     66e:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     672:	3039 0000 74da 	move.w 74da <SystemADKCON>,d0
     678:	0040 8000      	ori.w #-32768,d0
     67c:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     680:	2279 0000 74d6 	movea.l 74d6 <ActiView>,a1
     686:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     68a:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
     690:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     694:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
     69a:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     69e:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
     6a4:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     6a8:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
     6ae:	4eae fe32      	jsr -462(a6)
	Enable();
     6b2:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
     6b8:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     6bc:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
     6c2:	2279 0000 751c 	movea.l 751c <DOSBase>,a1
     6c8:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     6cc:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
     6d2:	2279 0000 7514 	movea.l 7514 <GfxBase>,a1
     6d8:	4eae fe62      	jsr -414(a6)
}
     6dc:	7000           	moveq #0,d0
     6de:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
     6e2:	508f           	addq.l #8,sp
     6e4:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     6e6:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     6ec:	4eae ffc4      	jsr -60(a6)
     6f0:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     6f6:	2200           	move.l d0,d1
     6f8:	243c 0000 4c12 	move.l #19474,d2
     6fe:	762c           	moveq #44,d3
     700:	4eae ffd0      	jsr -48(a6)
     704:	6000 faac      	bra.w 1b2 <main+0x1ac>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     708:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     70e:	4eae ffc4      	jsr -60(a6)
     712:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     718:	2200           	move.l d0,d1
     71a:	243c 0000 4c48 	move.l #19528,d2
     720:	7636           	moveq #54,d3
     722:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
     726:	23fc 0004 0000 	move.l #262144,7508 <DrawBuffer>
     72c:	0000 7508 
  ViewBuffer = (ULONG *)0x50000;
     730:	23fc 0005 0000 	move.l #327680,74fe <ViewBuffer>
     736:	0000 74fe 
  SetBplPointers();
     73a:	4eb9 0000 1840 	jsr 1840 <SetBplPointers>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     740:	0cb9 0005 0000 	cmpi.l #327680,7508 <DrawBuffer>
     746:	0000 7508 
     74a:	6600 fb3c      	bne.w 288 <main+0x282>
     74e:	6000 00cc      	bra.w 81c <main+0x816>
		Exit(0);
     752:	9dce           	suba.l a6,a6
     754:	7200           	moveq #0,d1
     756:	4eae ff70      	jsr -144(a6)
     75a:	6000 f8f6      	bra.w 52 <main+0x4c>
		Exit(0);
     75e:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     764:	7200           	moveq #0,d1
     766:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     76a:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
     770:	43f9 0000 4f46 	lea 4f46 <incbin_swfont_end+0x4e8>,a1
     776:	7000           	moveq #0,d0
     778:	4eae fdd8      	jsr -552(a6)
     77c:	23c0 0000 751c 	move.l d0,751c <DOSBase>
	if (!DOSBase)
     782:	6600 f8ce      	bne.w 52 <main+0x4c>
     786:	60ca           	bra.s 752 <main+0x74c>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     788:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     78e:	4eae ffc4      	jsr -60(a6)
     792:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     798:	2200           	move.l d0,d1
     79a:	243c 0000 4b4a 	move.l #19274,d2
     7a0:	7626           	moveq #38,d3
     7a2:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7a6:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     7ac:	7201           	moveq #1,d1
     7ae:	4eae ff70      	jsr -144(a6)
     7b2:	2039 0000 74ec 	move.l 74ec <Bitplane2>,d0
     7b8:	6000 fc1a      	bra.w 3d4 <main+0x3ce>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     7bc:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     7c2:	4eae ffc4      	jsr -60(a6)
     7c6:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     7cc:	2200           	move.l d0,d1
     7ce:	243c 0000 4b23 	move.l #19235,d2
     7d4:	7626           	moveq #38,d3
     7d6:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7da:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     7e0:	7201           	moveq #1,d1
     7e2:	4eae ff70      	jsr -144(a6)
     7e6:	2039 0000 74f0 	move.l 74f0 <Bitplane1>,d0
  ViewBuffer = Bitplane1;
     7ec:	23c0 0000 74fe 	move.l d0,74fe <ViewBuffer>
  ViewCopper = Copperlist1;
     7f2:	23f9 0000 7502 	move.l 7502 <Copperlist1>,74e8 <ViewCopper>
     7f8:	0000 74e8 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     7fc:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
     802:	203c 0000 c800 	move.l #51200,d0
     808:	7202           	moveq #2,d1
     80a:	4eae ff3a      	jsr -198(a6)
     80e:	23c0 0000 74ec 	move.l d0,74ec <Bitplane2>
  if(Bitplane2 == 0) {
     814:	6600 fbbe      	bne.w 3d4 <main+0x3ce>
     818:	6000 ff6e      	bra.w 788 <main+0x782>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     81c:	0cb9 0004 0000 	cmpi.l #262144,74fe <ViewBuffer>
     822:	0000 74fe 
     826:	6700 fa7e      	beq.w 2a6 <main+0x2a0>
    Write( Output(), 
     82a:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     830:	4eae ffc4      	jsr -60(a6)
     834:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     83a:	2200           	move.l d0,d1
     83c:	243c 0000 4f81 	move.l #20353,d2
     842:	763b           	moveq #59,d3
     844:	4eae ffd0      	jsr -48(a6)
     848:	6000 fa5c      	bra.w 2a6 <main+0x2a0>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     84c:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     852:	4eae ffc4      	jsr -60(a6)
     856:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     85c:	2200           	move.l d0,d1
     85e:	243c 0000 4d73 	move.l #19827,d2
     864:	7621           	moveq #33,d3
     866:	4eae ffd0      	jsr -48(a6)
     86a:	2079 0000 7502 	movea.l 7502 <Copperlist1>,a0
     870:	6000 fab2      	bra.w 324 <main+0x31e>
	APTR vbr = 0;
     874:	7000           	moveq #0,d0
	VBR=GetVBR();
     876:	23c0 0000 74e0 	move.l d0,74e0 <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     87c:	2079 0000 74e0 	movea.l 74e0 <VBR.lto_priv.3>,a0
     882:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     886:	23cb 0000 74e4 	move.l a3,74e4 <SystemIrq>
	WaitVbl();
     88c:	4e92           	jsr (a2)
	WaitVbl();
     88e:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     890:	2079 0000 7510 	movea.l 7510 <hw>,a0
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
     8b6:	4879 0000 4a92 	pea 4a92 <incbin_swfont_end+0x34>
     8bc:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc1b4>
     8c0:	4878 0052      	pea 52 <main+0x4c>
     8c4:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec115>
     8ca:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     8ce:	203c 0000 4a78 	move.l #19064,d0
     8d4:	4878 0001      	pea 1 <_start+0x1>
     8d8:	2f02           	move.l d2,-(sp)
     8da:	42a7           	clr.l -(sp)
     8dc:	2f00           	move.l d0,-(sp)
     8de:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc1b4>
     8e2:	4878 0052      	pea 52 <main+0x4c>
     8e6:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec115>
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
     902:	4879 0000 4a9c 	pea 4a9c <incbin_swfont_end+0x3e>
     908:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc1b4>
     90c:	4878 0052      	pea 52 <main+0x4c>
     910:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec115>
     916:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     91a:	203c 0000 4a5f 	move.l #19039,d0
     920:	4878 0001      	pea 1 <_start+0x1>
     924:	2f02           	move.l d2,-(sp)
     926:	42a7           	clr.l -(sp)
     928:	2f00           	move.l d0,-(sp)
     92a:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc1b4>
     92e:	4878 0052      	pea 52 <main+0x4c>
     932:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec115>
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
     94a:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeec115>
     950:	6734           	beq.s 986 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     952:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
     958:	206f 0090      	movea.l 144(sp),a0
     95c:	43ef 0094      	lea 148(sp),a1
     960:	45f9 0000 4298 	lea 4298 <PutChar>,a2
     966:	47ef 000c      	lea 12(sp),a3
     96a:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     96e:	2f0b           	move.l a3,-(sp)
     970:	4878 0056      	pea 56 <main+0x50>
     974:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec115>
     97a:	508f           	addq.l #8,sp
}
     97c:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     980:	4fef 0080      	lea 128(sp),sp
     984:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     986:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
     98c:	206f 0090      	movea.l 144(sp),a0
     990:	43ef 0094      	lea 148(sp),a1
     994:	45f9 0000 428a 	lea 428a <KPutCharX>,a2
     99a:	97cb           	suba.l a3,a3
     99c:	4eae fdf6      	jsr -522(a6)
}
     9a0:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     9a4:	4fef 0080      	lea 128(sp),sp
     9a8:	4e75           	rts

000009aa <TestRow>:
  mask = mask ^ 0xffff;

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
     9c8:	4eba 36e0      	jsr 40aa <memset>(pc)
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
     9e0:	2e3c 0000 4aa7 	move.l #19111,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
     9e6:	301c           	move.w (a4)+,d0
     9e8:	bd40           	eor.w d6,d0
     9ea:	b05d           	cmp.w (a5)+,d0
     9ec:	6736           	beq.s a24 <TestRow+0x7a>
      data[0] = i;
     9ee:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     9f2:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
     9f8:	2047           	movea.l d7,a0
     9fa:	43ef 0030      	lea 48(sp),a1
     9fe:	45f9 0000 4298 	lea 4298 <PutChar>,a2
     a04:	2645           	movea.l d5,a3
     a06:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
     a0a:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     a10:	4eae ffc4      	jsr -60(a6)
     a14:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
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
     a5a:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
     a60:	41f9 0000 4aa7 	lea 4aa7 <incbin_swfont_end+0x49>,a0
     a66:	43ef 0030      	lea 48(sp),a1
     a6a:	45f9 0000 4298 	lea 4298 <PutChar>,a2
     a70:	47ef 0034      	lea 52(sp),a3
     a74:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
     a78:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     a7e:	4eae ffc4      	jsr -60(a6)
     a82:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
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
     aa8:	4879 0000 4ad7 	pea 4ad7 <incbin_swfont_end+0x79>
     aae:	4eba fe92      	jsr 942 <KPrintF>(pc)
     ab2:	4fef 000c      	lea 12(sp),sp
}
     ab6:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     aba:	4fef 006c      	lea 108(sp),sp
     abe:	4e75           	rts

00000ac0 <Vblankcounter>:
  Counter4Frames++;
     ac0:	52b9 0000 7518 	addq.l #1,7518 <Counter4Frames>
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
     c92:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
     c98:	707b           	moveq #123,d0
     c9a:	4600           	not.b d0
     c9c:	7202           	moveq #2,d1
     c9e:	4eae ff3a      	jsr -198(a6)
     ca2:	2440           	movea.l d0,a2
  if( retval == 0) {
     ca4:	4a80           	tst.l d0
     ca6:	6700 010e      	beq.w db6 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
     caa:	24b9 0000 715c 	move.l 715c <ClsSprites>,(a2)
     cb0:	2579 0000 7160 	move.l 7160 <ClsSprites+0x4>,4(a2)
     cb6:	0004 
     cb8:	2579 0000 7164 	move.l 7164 <ClsSprites+0x8>,8(a2)
     cbe:	0008 
     cc0:	2579 0000 7168 	move.l 7168 <ClsSprites+0xc>,12(a2)
     cc6:	000c 
     cc8:	2579 0000 716c 	move.l 716c <ClsSprites+0x10>,16(a2)
     cce:	0010 
     cd0:	2579 0000 7170 	move.l 7170 <ClsSprites+0x14>,20(a2)
     cd6:	0014 
     cd8:	2579 0000 7174 	move.l 7174 <ClsSprites+0x18>,24(a2)
     cde:	0018 
     ce0:	2579 0000 7178 	move.l 7178 <ClsSprites+0x1c>,28(a2)
     ce6:	001c 
     ce8:	2579 0000 717c 	move.l 717c <ClsSprites+0x20>,32(a2)
     cee:	0020 
     cf0:	2579 0000 7180 	move.l 7180 <ClsSprites+0x24>,36(a2)
     cf6:	0024 
     cf8:	2579 0000 7184 	move.l 7184 <ClsSprites+0x28>,40(a2)
     cfe:	0028 
     d00:	2579 0000 7188 	move.l 7188 <ClsSprites+0x2c>,44(a2)
     d06:	002c 
     d08:	2579 0000 718c 	move.l 718c <ClsSprites+0x30>,48(a2)
     d0e:	0030 
     d10:	2579 0000 7190 	move.l 7190 <ClsSprites+0x34>,52(a2)
     d16:	0034 
     d18:	2579 0000 7194 	move.l 7194 <ClsSprites+0x38>,56(a2)
     d1e:	0038 
     d20:	2579 0000 7198 	move.l 7198 <ClsSprites+0x3c>,60(a2)
     d26:	003c 
    *cl++ = *clpartinstruction++;
     d28:	2579 0000 712c 	move.l 712c <ClScreen>,64(a2)
     d2e:	0040 
     d30:	2579 0000 7130 	move.l 7130 <ClScreen+0x4>,68(a2)
     d36:	0044 
     d38:	2579 0000 7134 	move.l 7134 <ClScreen+0x8>,72(a2)
     d3e:	0048 
     d40:	2579 0000 7138 	move.l 7138 <ClScreen+0xc>,76(a2)
     d46:	004c 
     d48:	2579 0000 713c 	move.l 713c <ClScreen+0x10>,80(a2)
     d4e:	0050 
     d50:	2579 0000 7140 	move.l 7140 <ClScreen+0x14>,84(a2)
     d56:	0054 
     d58:	2579 0000 7144 	move.l 7144 <ClScreen+0x18>,88(a2)
     d5e:	0058 
     d60:	2579 0000 7148 	move.l 7148 <ClScreen+0x1c>,92(a2)
     d66:	005c 
     d68:	2579 0000 714c 	move.l 714c <ClScreen+0x20>,96(a2)
     d6e:	0060 
     d70:	2579 0000 7150 	move.l 7150 <ClScreen+0x24>,100(a2)
     d76:	0064 
     d78:	2579 0000 7154 	move.l 7154 <ClScreen+0x28>,104(a2)
     d7e:	0068 
     d80:	2579 0000 7158 	move.l 7158 <ClScreen+0x2c>,108(a2)
     d86:	006c 
  *cl++ = 0x00e00000;
     d88:	257c 00e0 0000 	move.l #14680064,112(a2)
     d8e:	0070 
  *cl++ = 0x00e20000;
     d90:	257c 00e2 0000 	move.l #14811136,116(a2)
     d96:	0074 
    *cl++ = *clpartinstruction++;
     d98:	2579 0000 7124 	move.l 7124 <ClColor>,120(a2)
     d9e:	0078 
     da0:	2579 0000 7128 	move.l 7128 <ClColor+0x4>,124(a2)
     da6:	007c 
  *cl = 0xfffffffe;
     da8:	70fe           	moveq #-2,d0
     daa:	2540 0080      	move.l d0,128(a2)
}
     dae:	200a           	move.l a2,d0
     db0:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     db4:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     db6:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     dbc:	4eae ffc4      	jsr -60(a6)
     dc0:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     dc6:	2200           	move.l d0,d1
     dc8:	243c 0000 4afd 	move.l #19197,d2
     dce:	7628           	moveq #40,d3
     dd0:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     dd4:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
     dda:	7201           	moveq #1,d1
     ddc:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     de0:	24b9 0000 715c 	move.l 715c <ClsSprites>,(a2)
     de6:	2579 0000 7160 	move.l 7160 <ClsSprites+0x4>,4(a2)
     dec:	0004 
     dee:	2579 0000 7164 	move.l 7164 <ClsSprites+0x8>,8(a2)
     df4:	0008 
     df6:	2579 0000 7168 	move.l 7168 <ClsSprites+0xc>,12(a2)
     dfc:	000c 
     dfe:	2579 0000 716c 	move.l 716c <ClsSprites+0x10>,16(a2)
     e04:	0010 
     e06:	2579 0000 7170 	move.l 7170 <ClsSprites+0x14>,20(a2)
     e0c:	0014 
     e0e:	2579 0000 7174 	move.l 7174 <ClsSprites+0x18>,24(a2)
     e14:	0018 
     e16:	2579 0000 7178 	move.l 7178 <ClsSprites+0x1c>,28(a2)
     e1c:	001c 
     e1e:	2579 0000 717c 	move.l 717c <ClsSprites+0x20>,32(a2)
     e24:	0020 
     e26:	2579 0000 7180 	move.l 7180 <ClsSprites+0x24>,36(a2)
     e2c:	0024 
     e2e:	2579 0000 7184 	move.l 7184 <ClsSprites+0x28>,40(a2)
     e34:	0028 
     e36:	2579 0000 7188 	move.l 7188 <ClsSprites+0x2c>,44(a2)
     e3c:	002c 
     e3e:	2579 0000 718c 	move.l 718c <ClsSprites+0x30>,48(a2)
     e44:	0030 
     e46:	2579 0000 7190 	move.l 7190 <ClsSprites+0x34>,52(a2)
     e4c:	0034 
     e4e:	2579 0000 7194 	move.l 7194 <ClsSprites+0x38>,56(a2)
     e54:	0038 
     e56:	2579 0000 7198 	move.l 7198 <ClsSprites+0x3c>,60(a2)
     e5c:	003c 
    *cl++ = *clpartinstruction++;
     e5e:	2579 0000 712c 	move.l 712c <ClScreen>,64(a2)
     e64:	0040 
     e66:	2579 0000 7130 	move.l 7130 <ClScreen+0x4>,68(a2)
     e6c:	0044 
     e6e:	2579 0000 7134 	move.l 7134 <ClScreen+0x8>,72(a2)
     e74:	0048 
     e76:	2579 0000 7138 	move.l 7138 <ClScreen+0xc>,76(a2)
     e7c:	004c 
     e7e:	2579 0000 713c 	move.l 713c <ClScreen+0x10>,80(a2)
     e84:	0050 
     e86:	2579 0000 7140 	move.l 7140 <ClScreen+0x14>,84(a2)
     e8c:	0054 
     e8e:	2579 0000 7144 	move.l 7144 <ClScreen+0x18>,88(a2)
     e94:	0058 
     e96:	2579 0000 7148 	move.l 7148 <ClScreen+0x1c>,92(a2)
     e9c:	005c 
     e9e:	2579 0000 714c 	move.l 714c <ClScreen+0x20>,96(a2)
     ea4:	0060 
     ea6:	2579 0000 7150 	move.l 7150 <ClScreen+0x24>,100(a2)
     eac:	0064 
     eae:	2579 0000 7154 	move.l 7154 <ClScreen+0x28>,104(a2)
     eb4:	0068 
     eb6:	2579 0000 7158 	move.l 7158 <ClScreen+0x2c>,108(a2)
     ebc:	006c 
  *cl++ = 0x00e00000;
     ebe:	257c 00e0 0000 	move.l #14680064,112(a2)
     ec4:	0070 
  *cl++ = 0x00e20000;
     ec6:	257c 00e2 0000 	move.l #14811136,116(a2)
     ecc:	0074 
    *cl++ = *clpartinstruction++;
     ece:	2579 0000 7124 	move.l 7124 <ClColor>,120(a2)
     ed4:	0078 
     ed6:	2579 0000 7128 	move.l 7128 <ClColor+0x4>,124(a2)
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
     eec:	2079 0000 7510 	movea.l 7510 <hw>,a0
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
     f0a:	262f 0058      	move.l 88(sp),d3
     f0e:	2e2f 005c      	move.l 92(sp),d7
     f12:	3403           	move.w d3,d2
  WaitBlit();
     f14:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
     f1a:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
     f1e:	2079 0000 7510 	movea.l 7510 <hw>,a0
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
     f42:	3803           	move.w d3,d4
     f44:	d843           	add.w d3,d4
     f46:	3204           	move.w d4,d1
     f48:	d244           	add.w d4,d1
     f4a:	d243           	add.w d3,d1
     f4c:	3001           	move.w d1,d0
     f4e:	d041           	add.w d1,d0
     f50:	0640 014c      	addi.w #332,d0
     f54:	3f40 003a      	move.w d0,58(sp)
  WORD shiftright = 9;
     f58:	3a7c 0009      	movea.w #9,a5
  while( nextzoom > 22 * 16) {
     f5c:	0c40 0160      	cmpi.w #352,d0
     f60:	6f12           	ble.s f74 <Zoom_ZoomIntoPicture+0x72>
    nextzoom -= (19 + zoomnr);
     f62:	0640 ffed      	addi.w #-19,d0
     f66:	9042           	sub.w d2,d0
    shiftright--;
     f68:	534d           	subq.w #1,a5
  while( nextzoom > 22 * 16) {
     f6a:	0c40 0160      	cmpi.w #352,d0
     f6e:	6ef2           	bgt.s f62 <Zoom_ZoomIntoPicture+0x60>
     f70:	3f40 003a      	move.w d0,58(sp)
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
     f74:	7012           	moveq #18,d0
     f76:	9041           	sub.w d1,d0
     f78:	3f40 0044      	move.w d0,68(sp)
  while( ZoomHorizontalStart < 0) {
     f7c:	6c00 0394      	bge.w 1312 <Zoom_ZoomIntoPicture+0x410>
     f80:	3200           	move.w d0,d1
  UWORD shifthoriz = 7;
     f82:	7007           	moveq #7,d0
      ZoomHorizontalStart += 1 + 18 + zoomnr;
     f84:	0641 0013      	addi.w #19,d1
     f88:	d242           	add.w d2,d1
      shifthoriz--;
     f8a:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
     f8c:	4a41           	tst.w d1
     f8e:	6df4           	blt.s f84 <Zoom_ZoomIntoPicture+0x82>
     f90:	3f41 0044      	move.w d1,68(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    /*UWORD size4blitsmall = ZMLINESIZE/2*ZoomHorizontal*planes;
    UWORD size4blitbig = ZMLINESIZE/2*(ZoomHorizontal+1)*planes;*/

    UWORD onestep = ZMLINESIZE/2*planes;
     f94:	3207           	move.w d7,d1
     f96:	d247           	add.w d7,d1
     f98:	d247           	add.w d7,d1
     f9a:	3c01           	move.w d1,d6
     f9c:	e74e           	lsl.w #3,d6
  hw->bltsize = height*64+2;
     f9e:	ed4f           	lsl.w #6,d7
     fa0:	3207           	move.w d7,d1
     fa2:	5441           	addq.w #2,d1
     fa4:	3f41 0030      	move.w d1,48(sp)
          linesleft--;
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
        pos4source += size4blit;
        pos4dest += size4blit + onestep;   
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     fa8:	9843           	sub.w d3,d4
     faa:	0644 0012      	addi.w #18,d4
     fae:	7200           	moveq #0,d1
     fb0:	3206           	move.w d6,d1
     fb2:	2f41 0046      	move.l d1,70(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
     fb6:	0280 0000 ffff 	andi.l #65535,d0
     fbc:	5280           	addq.l #1,d0
     fbe:	2200           	move.l d0,d1
     fc0:	d280           	add.l d0,d1
     fc2:	d081           	add.l d1,d0
     fc4:	e988           	lsl.l #4,d0
     fc6:	206f 0050      	movea.l 80(sp),a0
     fca:	41f0 08fc      	lea (-4,a0,d0.l),a0
     fce:	2f48 0032      	move.l a0,50(sp)
     fd2:	702c           	moveq #44,d0
     fd4:	d0af 0054      	add.l 84(sp),d0
     fd8:	2f40 0036      	move.l d0,54(sp)
  UWORD shifttoleft = 0;
     fdc:	426f 0042      	clr.w 66(sp)
  UWORD startofword = 21*16;
     fe0:	3f7c 0150 002c 	move.w #336,44(sp)
      nextzoom -= (19 + zoomnr);
     fe6:	72ed           	moveq #-19,d1
     fe8:	9242           	sub.w d2,d1
     fea:	3f41 004a      	move.w d1,74(sp)
    ZoomBlit_Increment4SrcA = 1;
     fee:	3f4d 002e      	move.w a5,46(sp)
    ZoomHorizontal = ZoomHorizontalStart;
     ff2:	33ef 0044 0000 	move.w 68(sp),74f8 <ZoomHorizontal>
     ff8:	74f8 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
     ffa:	242f 0032      	move.l 50(sp),d2
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
     ffe:	262f 0036      	move.l 54(sp),d3
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1002:	7000           	moveq #0,d0
    1004:	302f 0042      	move.w 66(sp),d0
    1008:	2440           	movea.l d0,a2
    100a:	2a0a           	move.l a2,d5
    100c:	da8a           	add.l a2,d5
    100e:	3f6f 002e 003c 	move.w 46(sp),60(sp)
    1014:	322f 002e      	move.w 46(sp),d1
    1018:	700c           	moveq #12,d0
    101a:	e169           	lsl.w d0,d1
    101c:	3641           	movea.w d1,a3
    101e:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    1024:	7000           	moveq #0,d0
    1026:	302f 002c      	move.w 44(sp),d0
    102a:	306f 003a      	movea.w 58(sp),a0
    102e:	b1c0           	cmpa.l d0,a0
    1030:	6e00 0124      	bgt.w 1156 <Zoom_ZoomIntoPicture+0x254>
  WaitBlit();
    1034:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    1038:	2079 0000 7510 	movea.l 7510 <hw>,a0
    103e:	47eb 09f0      	lea 2544(a3),a3
    1042:	314b 0040      	move.w a3,64(a0)
  hw->bltcon1 = 0;
    1046:	317c 0000 0042 	move.w #0,66(a0)
    104c:	3879 0000 74f8 	movea.w 74f8 <ZoomHorizontal>,a4
    WORD linesleft = 272;
    1052:	327c 0110      	movea.w #272,a1
    1056:	2002           	move.l d2,d0
    1058:	3409           	move.w a1,d2
    105a:	2a45           	movea.l d5,a5
    105c:	3a0c           	move.w a4,d5
    105e:	2c6f 0046      	movea.l 70(sp),a6
    1062:	2240           	movea.l d0,a1
        if( linesleft >= ZoomHorizontal+1) {
    1064:	3202           	move.w d2,d1
    1066:	ba42           	cmp.w d2,d5
    1068:	6c00 008a      	bge.w 10f4 <Zoom_ZoomIntoPicture+0x1f2>
          linesleft -= ZoomHorizontal;
    106c:	9445           	sub.w d5,d2
        UWORD size4blit = ZoomHorizontal*onestep; 
    106e:	3005           	move.w d5,d0
    1070:	c1c6           	muls.w d6,d0
        if( linesleft>0) {
    1072:	0280 0000 ffff 	andi.l #65535,d0
    1078:	2640           	movea.l d0,a3
    107a:	d7c0           	adda.l d0,a3
    107c:	4a42           	tst.w d2
    107e:	6f00 00c8      	ble.w 1148 <Zoom_ZoomIntoPicture+0x246>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1082:	220a           	move.l a2,d1
    1084:	d280           	add.l d0,d1
    1086:	d281           	add.l d1,d1
    1088:	d289           	add.l a1,d1
          UWORD *tmpdest = pos4dest +  size4blit;
    108a:	49f3 3800      	lea (0,a3,d3.l),a4
          *bp = 0;
    108e:	4278 0200      	clr.w 200 <main+0x1fa>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1092:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1096:	3a28 0002      	move.w 2(a0),d5
    109a:	0805 000e      	btst #14,d5
    109e:	66f6           	bne.s 1096 <Zoom_ZoomIntoPicture+0x194>
  hw->bltapt = (UWORD *) source;
    10a0:	2141 0050      	move.l d1,80(a0)
  hw->bltdpt = (UWORD *) destination;
    10a4:	214c 0054      	move.l a4,84(a0)
  hw->bltsize = height*64+2;
    10a8:	316f 0030 0058 	move.w 48(sp),88(a0)
          linesleft--;
    10ae:	5342           	subq.w #1,d2
    10b0:	3239 0000 74f8 	move.w 74f8 <ZoomHorizontal>,d1
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    10b6:	49f1 d800      	lea (0,a1,a5.l),a4
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    10ba:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    10be:	3a28 0002      	move.w 2(a0),d5
    10c2:	0805 000e      	btst #14,d5
    10c6:	66f6           	bne.s 10be <Zoom_ZoomIntoPicture+0x1bc>
  hw->bltapt = (UWORD *) source;
    10c8:	214c 0050      	move.l a4,80(a0)
  hw->bltdpt = (UWORD *) destination;
    10cc:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    10d0:	c3c7           	muls.w d7,d1
    10d2:	5441           	addq.w #2,d1
    10d4:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
    10d8:	d3cb           	adda.l a3,a1
        pos4dest += size4blit + onestep; 
    10da:	d08e           	add.l a6,d0
    10dc:	d080           	add.l d0,d0
    10de:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    10e0:	33c4 0000 74f8 	move.w d4,74f8 <ZoomHorizontal>
      while(linesleft > 0) {
    10e6:	4a42           	tst.w d2
    10e8:	6f3c           	ble.s 1126 <Zoom_ZoomIntoPicture+0x224>
    10ea:	3a04           	move.w d4,d5
        if( linesleft >= ZoomHorizontal+1) {
    10ec:	3202           	move.w d2,d1
    10ee:	ba42           	cmp.w d2,d5
    10f0:	6d00 ff7a      	blt.w 106c <Zoom_ZoomIntoPicture+0x16a>
        UWORD size4blit = ZoomHorizontal*onestep; 
    10f4:	3006           	move.w d6,d0
    10f6:	c1c2           	muls.w d2,d0
        if( linesleft>0) {
    10f8:	0280 0000 ffff 	andi.l #65535,d0
    10fe:	2640           	movea.l d0,a3
    1100:	d7c0           	adda.l d0,a3
          linesleft = 0;
    1102:	4242           	clr.w d2
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1104:	49f1 d800      	lea (0,a1,a5.l),a4
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1108:	3a28 0002      	move.w 2(a0),d5
    110c:	60b0           	bra.s 10be <Zoom_ZoomIntoPicture+0x1bc>
      }
      shiftright--;  
      if(shiftright < 0) {
    110e:	4a6f 002e      	tst.w 46(sp)
    1112:	6c12           	bge.s 1126 <Zoom_ZoomIntoPicture+0x224>
        shiftright += 16;
    1114:	322f 003c      	move.w 60(sp),d1
    1118:	0641 000f      	addi.w #15,d1
    111c:	3f41 002e      	move.w d1,46(sp)
        shifttoleft = 1;
    1120:	3f7c 0001 0042 	move.w #1,66(sp)
      }
    }
    startofword -= 16;
    1126:	066f fff0 002c 	addi.w #-16,44(sp)
    112c:	55af 0032      	subq.l #2,50(sp)
    1130:	55af 0036      	subq.l #2,54(sp)
  for(int i=0;i<22;i++) {
    1134:	0c6f fff0 002c 	cmpi.w #-16,44(sp)
    113a:	6600 feb6      	bne.w ff2 <Zoom_ZoomIntoPicture+0xf0>
  }
  //ZoomHorizontal = 10;
}
    113e:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1142:	4fef 0020      	lea 32(sp),sp
    1146:	4e75           	rts
        if( linesleft>0) {
    1148:	3205           	move.w d5,d1
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    114a:	49f1 d800      	lea (0,a1,a5.l),a4
    114e:	3a28 0002      	move.w 2(a0),d5
    1152:	6000 ff6a      	bra.w 10be <Zoom_ZoomIntoPicture+0x1bc>
  UWORD colnr = nextzoom - startofword - 1;                                                                          
    1156:	322f 003a      	move.w 58(sp),d1
    115a:	926f 002c      	sub.w 44(sp),d1
    115e:	3a41           	movea.w d1,a5
    1160:	534d           	subq.w #1,a5
  if( shiftright == 0) {
    1162:	302f 003c      	move.w 60(sp),d0
    1166:	5340           	subq.w #1,d0
    1168:	3f40 002e      	move.w d0,46(sp)
    116c:	4a6f 003c      	tst.w 60(sp)
    1170:	6600 0140      	bne.w 12b2 <Zoom_ZoomIntoPicture+0x3b0>
    ZoomBlit_Increment4SrcA = 1;
    1174:	33fc 0001 0000 	move.w #1,7506 <ZoomBlit_Increment4SrcA>
    117a:	7506 
    117c:	387c fde4      	movea.w #-540,a4
  WaitBlit(); 
    1180:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1184:	2079 0000 7510 	movea.l 7510 <hw>,a0
    118a:	314b 0042      	move.w a3,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    118e:	314c 0040      	move.w a4,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1192:	7000           	moveq #0,d0
    1194:	300d           	move.w a5,d0
    1196:	7210           	moveq #16,d1
    1198:	9280           	sub.l d0,d1
    119a:	2001           	move.l d1,d0
    119c:	7200           	moveq #0,d1
    119e:	4641           	not.w d1
    11a0:	e1a9           	lsl.l d0,d1
    11a2:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    11a6:	302f 004a      	move.w 74(sp),d0
    11aa:	d16f 003a      	add.w d0,58(sp)
      while( linesleft > 0) {
    11ae:	3879 0000 74f8 	movea.w 74f8 <ZoomHorizontal>,a4
    WORD linesleft = 272;
    11b4:	367c 0110      	movea.w #272,a3
    11b8:	2242           	movea.l d2,a1
    11ba:	2003           	move.l d3,d0
    11bc:	360b           	move.w a3,d3
    11be:	2f4a 003e      	move.l a2,62(sp)
    11c2:	2c45           	movea.l d5,a6
    11c4:	3a0c           	move.w a4,d5
    11c6:	246f 0046      	movea.l 70(sp),a2
    11ca:	2640           	movea.l d0,a3
        if( linesleft >= ZoomHorizontal+1) {
    11cc:	3403           	move.w d3,d2
    11ce:	ba43           	cmp.w d3,d5
    11d0:	6c00 00a6      	bge.w 1278 <Zoom_ZoomIntoPicture+0x376>
          linesleft -= ZoomHorizontal;
    11d4:	9645           	sub.w d5,d3
        UWORD size4blit = ZoomHorizontal*onestep;
    11d6:	3005           	move.w d5,d0
    11d8:	c1c6           	muls.w d6,d0
        if( linesleft>0) {
    11da:	0280 0000 ffff 	andi.l #65535,d0
    11e0:	2a40           	movea.l d0,a5
    11e2:	dbc0           	adda.l d0,a5
    11e4:	4a43           	tst.w d3
    11e6:	6f00 00b4      	ble.w 129c <Zoom_ZoomIntoPicture+0x39a>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    11ea:	242f 003e      	move.l 62(sp),d2
    11ee:	d480           	add.l d0,d2
    11f0:	d482           	add.l d2,d2
    11f2:	d489           	add.l a1,d2
          UWORD *tmpdest = pos4dest + size4blit;
    11f4:	2a0b           	move.l a3,d5
    11f6:	da8d           	add.l a5,d5
          *bp = 0;
    11f8:	4278 0200      	clr.w 200 <main+0x1fa>
    11fc:	3228 0002      	move.w 2(a0),d1
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1200:	3228 0002      	move.w 2(a0),d1
    1204:	0801 000e      	btst #14,d1
    1208:	66f6           	bne.s 1200 <Zoom_ZoomIntoPicture+0x2fe>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    120a:	7200           	moveq #0,d1
    120c:	3239 0000 7506 	move.w 7506 <ZoomBlit_Increment4SrcA>,d1
    1212:	d281           	add.l d1,d1
    1214:	2842           	movea.l d2,a4
    1216:	d9c1           	adda.l d1,a4
    1218:	214c 0050      	move.l a4,80(a0)
  hw->bltbpt = source;
    121c:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = destination;
    1220:	2145 0054      	move.l d5,84(a0)
  hw->bltsize = height*64+2;
    1224:	316f 0030 0058 	move.w 48(sp),88(a0)
          linesleft--;
    122a:	5343           	subq.w #1,d3
    122c:	3439 0000 74f8 	move.w 74f8 <ZoomHorizontal>,d2
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1232:	49f1 e800      	lea (0,a1,a6.l),a4
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1236:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    123a:	3a28 0002      	move.w 2(a0),d5
    123e:	0805 000e      	btst #14,d5
    1242:	66f6           	bne.s 123a <Zoom_ZoomIntoPicture+0x338>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1244:	d28c           	add.l a4,d1
    1246:	2141 0050      	move.l d1,80(a0)
  hw->bltbpt = source;
    124a:	214c 004c      	move.l a4,76(a0)
  hw->bltdpt = destination;
    124e:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
    1252:	c5c7           	muls.w d7,d2
    1254:	5442           	addq.w #2,d2
    1256:	3142 0058      	move.w d2,88(a0)
        pos4source += size4blit;
    125a:	d3cd           	adda.l a5,a1
        pos4dest += size4blit + onestep;   
    125c:	d08a           	add.l a2,d0
    125e:	d080           	add.l d0,d0
    1260:	d7c0           	adda.l d0,a3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1262:	33c4 0000 74f8 	move.w d4,74f8 <ZoomHorizontal>
      while( linesleft > 0) {
    1268:	4a43           	tst.w d3
    126a:	6f00 fea2      	ble.w 110e <Zoom_ZoomIntoPicture+0x20c>
    126e:	3a04           	move.w d4,d5
        if( linesleft >= ZoomHorizontal+1) {
    1270:	3403           	move.w d3,d2
    1272:	ba43           	cmp.w d3,d5
    1274:	6d00 ff5e      	blt.w 11d4 <Zoom_ZoomIntoPicture+0x2d2>
        UWORD size4blit = ZoomHorizontal*onestep;
    1278:	3006           	move.w d6,d0
    127a:	c1c3           	muls.w d3,d0
        if( linesleft>0) {
    127c:	0280 0000 ffff 	andi.l #65535,d0
    1282:	2a40           	movea.l d0,a5
    1284:	dbc0           	adda.l d0,a5
    1286:	7200           	moveq #0,d1
    1288:	3239 0000 7506 	move.w 7506 <ZoomBlit_Increment4SrcA>,d1
    128e:	d281           	add.l d1,d1
          linesleft = 0;
    1290:	4243           	clr.w d3
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1292:	49f1 e800      	lea (0,a1,a6.l),a4
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1296:	3a28 0002      	move.w 2(a0),d5
    129a:	609e           	bra.s 123a <Zoom_ZoomIntoPicture+0x338>
    129c:	7200           	moveq #0,d1
    129e:	3239 0000 7506 	move.w 7506 <ZoomBlit_Increment4SrcA>,d1
    12a4:	d281           	add.l d1,d1
        if( linesleft>0) {
    12a6:	3405           	move.w d5,d2
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    12a8:	49f1 e800      	lea (0,a1,a6.l),a4
    12ac:	3a28 0002      	move.w 2(a0),d5
    12b0:	6088           	bra.s 123a <Zoom_ZoomIntoPicture+0x338>
  ZoomBlit_Increment4SrcA = 0;
    12b2:	4279 0000 7506 	clr.w 7506 <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
    12b8:	720c           	moveq #12,d1
    12ba:	e368           	lsl.w d1,d0
    12bc:	3840           	movea.w d0,a4
    12be:	49ec 0de4      	lea 3556(a4),a4
  WaitBlit(); 
    12c2:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    12c6:	2079 0000 7510 	movea.l 7510 <hw>,a0
    12cc:	314b 0042      	move.w a3,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    12d0:	314c 0040      	move.w a4,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    12d4:	7000           	moveq #0,d0
    12d6:	300d           	move.w a5,d0
    12d8:	7210           	moveq #16,d1
    12da:	9280           	sub.l d0,d1
    12dc:	2001           	move.l d1,d0
    12de:	7200           	moveq #0,d1
    12e0:	4641           	not.w d1
    12e2:	e1a9           	lsl.l d0,d1
    12e4:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    12e8:	302f 004a      	move.w 74(sp),d0
    12ec:	d16f 003a      	add.w d0,58(sp)
      while( linesleft > 0) {
    12f0:	3879 0000 74f8 	movea.w 74f8 <ZoomHorizontal>,a4
    WORD linesleft = 272;
    12f6:	367c 0110      	movea.w #272,a3
    12fa:	2242           	movea.l d2,a1
    12fc:	2003           	move.l d3,d0
    12fe:	360b           	move.w a3,d3
    1300:	2f4a 003e      	move.l a2,62(sp)
    1304:	2c45           	movea.l d5,a6
    1306:	3a0c           	move.w a4,d5
    1308:	246f 0046      	movea.l 70(sp),a2
    130c:	2640           	movea.l d0,a3
    130e:	6000 febc      	bra.w 11cc <Zoom_ZoomIntoPicture+0x2ca>
  UWORD shifthoriz = 7;
    1312:	7007           	moveq #7,d0
    UWORD onestep = ZMLINESIZE/2*planes;
    1314:	3207           	move.w d7,d1
    1316:	d247           	add.w d7,d1
    1318:	d247           	add.w d7,d1
    131a:	3c01           	move.w d1,d6
    131c:	e74e           	lsl.w #3,d6
  hw->bltsize = height*64+2;
    131e:	ed4f           	lsl.w #6,d7
    1320:	3207           	move.w d7,d1
    1322:	5441           	addq.w #2,d1
    1324:	3f41 0030      	move.w d1,48(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1328:	9843           	sub.w d3,d4
    132a:	0644 0012      	addi.w #18,d4
    132e:	7200           	moveq #0,d1
    1330:	3206           	move.w d6,d1
    1332:	2f41 0046      	move.l d1,70(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
    1336:	0280 0000 ffff 	andi.l #65535,d0
    133c:	5280           	addq.l #1,d0
    133e:	2200           	move.l d0,d1
    1340:	d280           	add.l d0,d1
    1342:	d081           	add.l d1,d0
    1344:	e988           	lsl.l #4,d0
    1346:	206f 0050      	movea.l 80(sp),a0
    134a:	41f0 08fc      	lea (-4,a0,d0.l),a0
    134e:	2f48 0032      	move.l a0,50(sp)
    1352:	702c           	moveq #44,d0
    1354:	d0af 0054      	add.l 84(sp),d0
    1358:	2f40 0036      	move.l d0,54(sp)
  UWORD shifttoleft = 0;
    135c:	426f 0042      	clr.w 66(sp)
  UWORD startofword = 21*16;
    1360:	3f7c 0150 002c 	move.w #336,44(sp)
      nextzoom -= (19 + zoomnr);
    1366:	72ed           	moveq #-19,d1
    1368:	9242           	sub.w d2,d1
    136a:	3f41 004a      	move.w d1,74(sp)
    ZoomBlit_Increment4SrcA = 1;
    136e:	3f4d 002e      	move.w a5,46(sp)
    1372:	6000 fc7e      	bra.w ff2 <Zoom_ZoomIntoPicture+0xf0>

00001376 <Init_Blit>:
  hw->bltafwm = 0xffff;
    1376:	2079 0000 7510 	movea.l 7510 <hw>,a0
    137c:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1382:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1388:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    138e:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1394:	317c 002c 0066 	move.w #44,102(a0)
}
    139a:	4e75           	rts

0000139c <ClbuildZoom>:
ULONG * ClbuildZoom() {
    139c:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    13a0:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    13a6:	203c 0000 a48c 	move.l #42124,d0
    13ac:	7202           	moveq #2,d1
    13ae:	4eae ff3a      	jsr -198(a6)
    13b2:	2440           	movea.l d0,a2
  if( retval == 0) {
    13b4:	4a80           	tst.l d0
    13b6:	6700 011e      	beq.w 14d6 <ClbuildZoom+0x13a>
    *cl++ = *clpartinstruction++;
    13ba:	24b9 0000 715c 	move.l 715c <ClsSprites>,(a2)
    13c0:	2579 0000 7160 	move.l 7160 <ClsSprites+0x4>,4(a2)
    13c6:	0004 
    13c8:	2579 0000 7164 	move.l 7164 <ClsSprites+0x8>,8(a2)
    13ce:	0008 
    13d0:	2579 0000 7168 	move.l 7168 <ClsSprites+0xc>,12(a2)
    13d6:	000c 
    13d8:	2579 0000 716c 	move.l 716c <ClsSprites+0x10>,16(a2)
    13de:	0010 
    13e0:	2579 0000 7170 	move.l 7170 <ClsSprites+0x14>,20(a2)
    13e6:	0014 
    13e8:	2579 0000 7174 	move.l 7174 <ClsSprites+0x18>,24(a2)
    13ee:	0018 
    13f0:	2579 0000 7178 	move.l 7178 <ClsSprites+0x1c>,28(a2)
    13f6:	001c 
    13f8:	2579 0000 717c 	move.l 717c <ClsSprites+0x20>,32(a2)
    13fe:	0020 
    1400:	2579 0000 7180 	move.l 7180 <ClsSprites+0x24>,36(a2)
    1406:	0024 
    1408:	2579 0000 7184 	move.l 7184 <ClsSprites+0x28>,40(a2)
    140e:	0028 
    1410:	2579 0000 7188 	move.l 7188 <ClsSprites+0x2c>,44(a2)
    1416:	002c 
    1418:	2579 0000 718c 	move.l 718c <ClsSprites+0x30>,48(a2)
    141e:	0030 
    1420:	2579 0000 7190 	move.l 7190 <ClsSprites+0x34>,52(a2)
    1426:	0034 
    1428:	2579 0000 7194 	move.l 7194 <ClsSprites+0x38>,56(a2)
    142e:	0038 
    1430:	2579 0000 7198 	move.l 7198 <ClsSprites+0x3c>,60(a2)
    1436:	003c 
    *cl++ = *clpartinstruction++;
    1438:	2579 0000 712c 	move.l 712c <ClScreen>,64(a2)
    143e:	0040 
    1440:	2579 0000 7130 	move.l 7130 <ClScreen+0x4>,68(a2)
    1446:	0044 
    1448:	2579 0000 7134 	move.l 7134 <ClScreen+0x8>,72(a2)
    144e:	0048 
    1450:	2579 0000 7138 	move.l 7138 <ClScreen+0xc>,76(a2)
    1456:	004c 
    1458:	2579 0000 713c 	move.l 713c <ClScreen+0x10>,80(a2)
    145e:	0050 
    1460:	2579 0000 7140 	move.l 7140 <ClScreen+0x14>,84(a2)
    1466:	0054 
    1468:	2579 0000 7144 	move.l 7144 <ClScreen+0x18>,88(a2)
    146e:	0058 
    1470:	2579 0000 7148 	move.l 7148 <ClScreen+0x1c>,92(a2)
    1476:	005c 
    1478:	2579 0000 714c 	move.l 714c <ClScreen+0x20>,96(a2)
    147e:	0060 
    1480:	2579 0000 7150 	move.l 7150 <ClScreen+0x24>,100(a2)
    1486:	0064 
    1488:	2579 0000 7154 	move.l 7154 <ClScreen+0x28>,104(a2)
    148e:	0068 
    1490:	2579 0000 7158 	move.l 7158 <ClScreen+0x2c>,108(a2)
    1496:	006c 
  *cl++ = 0x00e00000;
    1498:	257c 00e0 0000 	move.l #14680064,112(a2)
    149e:	0070 
  *cl++ = 0x00e20000;
    14a0:	257c 00e2 0000 	move.l #14811136,116(a2)
    14a6:	0074 
  *cl++ = 0x00e40000;
    14a8:	257c 00e4 0000 	move.l #14942208,120(a2)
    14ae:	0078 
  *cl++ = 0x00e60000;
    14b0:	257c 00e6 0000 	move.l #15073280,124(a2)
    14b6:	007c 
    *cl++ = *clpartinstruction++;
    14b8:	2579 0000 7124 	move.l 7124 <ClColor>,128(a2)
    14be:	0080 
    14c0:	2579 0000 7128 	move.l 7128 <ClColor+0x4>,132(a2)
    14c6:	0084 
   *cl = 0xfffffffe;
    14c8:	70fe           	moveq #-2,d0
    14ca:	2540 0088      	move.l d0,136(a2)
}
    14ce:	200a           	move.l a2,d0
    14d0:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    14d4:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    14d6:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    14dc:	4eae ffc4      	jsr -60(a6)
    14e0:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    14e6:	2200           	move.l d0,d1
    14e8:	243c 0000 4afd 	move.l #19197,d2
    14ee:	7628           	moveq #40,d3
    14f0:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    14f4:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    14fa:	7201           	moveq #1,d1
    14fc:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1500:	24b9 0000 715c 	move.l 715c <ClsSprites>,(a2)
    1506:	2579 0000 7160 	move.l 7160 <ClsSprites+0x4>,4(a2)
    150c:	0004 
    150e:	2579 0000 7164 	move.l 7164 <ClsSprites+0x8>,8(a2)
    1514:	0008 
    1516:	2579 0000 7168 	move.l 7168 <ClsSprites+0xc>,12(a2)
    151c:	000c 
    151e:	2579 0000 716c 	move.l 716c <ClsSprites+0x10>,16(a2)
    1524:	0010 
    1526:	2579 0000 7170 	move.l 7170 <ClsSprites+0x14>,20(a2)
    152c:	0014 
    152e:	2579 0000 7174 	move.l 7174 <ClsSprites+0x18>,24(a2)
    1534:	0018 
    1536:	2579 0000 7178 	move.l 7178 <ClsSprites+0x1c>,28(a2)
    153c:	001c 
    153e:	2579 0000 717c 	move.l 717c <ClsSprites+0x20>,32(a2)
    1544:	0020 
    1546:	2579 0000 7180 	move.l 7180 <ClsSprites+0x24>,36(a2)
    154c:	0024 
    154e:	2579 0000 7184 	move.l 7184 <ClsSprites+0x28>,40(a2)
    1554:	0028 
    1556:	2579 0000 7188 	move.l 7188 <ClsSprites+0x2c>,44(a2)
    155c:	002c 
    155e:	2579 0000 718c 	move.l 718c <ClsSprites+0x30>,48(a2)
    1564:	0030 
    1566:	2579 0000 7190 	move.l 7190 <ClsSprites+0x34>,52(a2)
    156c:	0034 
    156e:	2579 0000 7194 	move.l 7194 <ClsSprites+0x38>,56(a2)
    1574:	0038 
    1576:	2579 0000 7198 	move.l 7198 <ClsSprites+0x3c>,60(a2)
    157c:	003c 
    *cl++ = *clpartinstruction++;
    157e:	2579 0000 712c 	move.l 712c <ClScreen>,64(a2)
    1584:	0040 
    1586:	2579 0000 7130 	move.l 7130 <ClScreen+0x4>,68(a2)
    158c:	0044 
    158e:	2579 0000 7134 	move.l 7134 <ClScreen+0x8>,72(a2)
    1594:	0048 
    1596:	2579 0000 7138 	move.l 7138 <ClScreen+0xc>,76(a2)
    159c:	004c 
    159e:	2579 0000 713c 	move.l 713c <ClScreen+0x10>,80(a2)
    15a4:	0050 
    15a6:	2579 0000 7140 	move.l 7140 <ClScreen+0x14>,84(a2)
    15ac:	0054 
    15ae:	2579 0000 7144 	move.l 7144 <ClScreen+0x18>,88(a2)
    15b4:	0058 
    15b6:	2579 0000 7148 	move.l 7148 <ClScreen+0x1c>,92(a2)
    15bc:	005c 
    15be:	2579 0000 714c 	move.l 714c <ClScreen+0x20>,96(a2)
    15c4:	0060 
    15c6:	2579 0000 7150 	move.l 7150 <ClScreen+0x24>,100(a2)
    15cc:	0064 
    15ce:	2579 0000 7154 	move.l 7154 <ClScreen+0x28>,104(a2)
    15d4:	0068 
    15d6:	2579 0000 7158 	move.l 7158 <ClScreen+0x2c>,108(a2)
    15dc:	006c 
  *cl++ = 0x00e00000;
    15de:	257c 00e0 0000 	move.l #14680064,112(a2)
    15e4:	0070 
  *cl++ = 0x00e20000;
    15e6:	257c 00e2 0000 	move.l #14811136,116(a2)
    15ec:	0074 
  *cl++ = 0x00e40000;
    15ee:	257c 00e4 0000 	move.l #14942208,120(a2)
    15f4:	0078 
  *cl++ = 0x00e60000;
    15f6:	257c 00e6 0000 	move.l #15073280,124(a2)
    15fc:	007c 
    *cl++ = *clpartinstruction++;
    15fe:	2579 0000 7124 	move.l 7124 <ClColor>,128(a2)
    1604:	0080 
    1606:	2579 0000 7128 	move.l 7128 <ClColor+0x4>,132(a2)
    160c:	0084 
   *cl = 0xfffffffe;
    160e:	70fe           	moveq #-2,d0
    1610:	2540 0088      	move.l d0,136(a2)
}
    1614:	200a           	move.l a2,d0
    1616:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    161a:	4e75           	rts

0000161c <Zoom_Init>:
void Zoom_Init() {
    161c:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    161e:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    1624:	7004           	moveq #4,d0
    1626:	7202           	moveq #2,d1
    1628:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
    162c:	33fc 0010 0000 	move.w #16,74f8 <ZoomHorizontal>
    1632:	74f8 
}
    1634:	2c5f           	movea.l (sp)+,a6
    1636:	4e75           	rts

00001638 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    1638:	2039 0000 74fa 	move.l 74fa <DrawCopper>,d0
  DrawCopper = ViewCopper;
    163e:	23f9 0000 74e8 	move.l 74e8 <ViewCopper>,74fa <DrawCopper>
    1644:	0000 74fa 
  ViewCopper = (ULONG *)tmp;
    1648:	23c0 0000 74e8 	move.l d0,74e8 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    164e:	2079 0000 7510 	movea.l 7510 <hw>,a0
    1654:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    1658:	3140 0088      	move.w d0,136(a0)
}
    165c:	4e75           	rts

0000165e <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    165e:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    1662:	45fa fd38      	lea 139c <ClbuildZoom>(pc),a2
    1666:	4e92           	jsr (a2)
    1668:	23c0 0000 7502 	move.l d0,7502 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    166e:	4e92           	jsr (a2)
    1670:	23c0 0000 74f4 	move.l d0,74f4 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1676:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    167c:	203c 0001 6800 	move.l #92160,d0
    1682:	7202           	moveq #2,d1
    1684:	4eae ff3a      	jsr -198(a6)
    1688:	23c0 0000 74f0 	move.l d0,74f0 <Bitplane1>
  if(Bitplane1 == 0) {
    168e:	6700 014e      	beq.w 17de <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    1692:	23c0 0000 7508 	move.l d0,7508 <DrawBuffer>
  DrawCopper = Copperlist1;
    1698:	23f9 0000 7502 	move.l 7502 <Copperlist1>,74fa <DrawCopper>
    169e:	0000 74fa 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    16a2:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    16a8:	203c 0001 6800 	move.l #92160,d0
    16ae:	7202           	moveq #2,d1
    16b0:	4eae ff3a      	jsr -198(a6)
    16b4:	2400           	move.l d0,d2
    16b6:	23c0 0000 74ec 	move.l d0,74ec <Bitplane2>
  if(Bitplane2 == 0) {
    16bc:	6778           	beq.s 1736 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    16be:	23f9 0000 74f4 	move.l 74f4 <Copperlist2>,74e8 <ViewCopper>
    16c4:	0000 74e8 
  SwapCl();
    16c8:	45fa ff6e      	lea 1638 <SwapCl>(pc),a2
    16cc:	4e92           	jsr (a2)

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
    16ce:	2039 0000 7508 	move.l 7508 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    16d4:	2079 0000 74fa 	movea.l 74fa <DrawCopper>,a0
  copword += ZMBPLPTRS+1;
  for(int i=1;i<=2;i++) {
    UWORD highword = ptr >> 16;
    16da:	2200           	move.l d0,d1
    16dc:	4241           	clr.w d1
    16de:	4841           	swap d1
    16e0:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    16e4:	3140 0076      	move.w d0,118(a0)
    *copword = highword;
    copword += 2;
    *copword = lowword;
    copword += 2;
    ptr += 40*256;
    16e8:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    16ee:	2200           	move.l d0,d1
    16f0:	4241           	clr.w d1
    16f2:	4841           	swap d1
    16f4:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    16f8:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    16fc:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    16fe:	2079 0000 74fa 	movea.l 74fa <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1704:	2002           	move.l d2,d0
    1706:	4240           	clr.w d0
    1708:	4840           	swap d0
    170a:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    170e:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    1712:	2002           	move.l d2,d0
    1714:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    171a:	2200           	move.l d0,d1
    171c:	4241           	clr.w d1
    171e:	4841           	swap d1
    1720:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1724:	3140 007e      	move.w d0,126(a0)
  }
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;
    1728:	23c2 0000 74fe 	move.l d2,74fe <ViewBuffer>
}
    172e:	7000           	moveq #0,d0
    1730:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1734:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1736:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    173c:	4eae ffc4      	jsr -60(a6)
    1740:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1746:	2200           	move.l d0,d1
    1748:	243c 0000 4b4a 	move.l #19274,d2
    174e:	7626           	moveq #38,d3
    1750:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1754:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    175a:	7201           	moveq #1,d1
    175c:	4eae ff70      	jsr -144(a6)
    1760:	2439 0000 74ec 	move.l 74ec <Bitplane2>,d2
  ViewCopper = Copperlist2;
    1766:	23f9 0000 74f4 	move.l 74f4 <Copperlist2>,74e8 <ViewCopper>
    176c:	0000 74e8 
  SwapCl();
    1770:	45fa fec6      	lea 1638 <SwapCl>(pc),a2
    1774:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    1776:	2039 0000 7508 	move.l 7508 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    177c:	2079 0000 74fa 	movea.l 74fa <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1782:	2200           	move.l d0,d1
    1784:	4241           	clr.w d1
    1786:	4841           	swap d1
    1788:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    178c:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    1790:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1796:	2200           	move.l d0,d1
    1798:	4241           	clr.w d1
    179a:	4841           	swap d1
    179c:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    17a0:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    17a4:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    17a6:	2079 0000 74fa 	movea.l 74fa <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    17ac:	2002           	move.l d2,d0
    17ae:	4240           	clr.w d0
    17b0:	4840           	swap d0
    17b2:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    17b6:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    17ba:	2002           	move.l d2,d0
    17bc:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    17c2:	2200           	move.l d0,d1
    17c4:	4241           	clr.w d1
    17c6:	4841           	swap d1
    17c8:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    17cc:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    17d0:	23c2 0000 74fe 	move.l d2,74fe <ViewBuffer>
}
    17d6:	7000           	moveq #0,d0
    17d8:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    17dc:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    17de:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    17e4:	4eae ffc4      	jsr -60(a6)
    17e8:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    17ee:	2200           	move.l d0,d1
    17f0:	243c 0000 4b23 	move.l #19235,d2
    17f6:	7626           	moveq #38,d3
    17f8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    17fc:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1802:	7201           	moveq #1,d1
    1804:	4eae ff70      	jsr -144(a6)
    1808:	2039 0000 74f0 	move.l 74f0 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    180e:	23c0 0000 7508 	move.l d0,7508 <DrawBuffer>
  DrawCopper = Copperlist1;
    1814:	23f9 0000 7502 	move.l 7502 <Copperlist1>,74fa <DrawCopper>
    181a:	0000 74fa 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    181e:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    1824:	203c 0001 6800 	move.l #92160,d0
    182a:	7202           	moveq #2,d1
    182c:	4eae ff3a      	jsr -198(a6)
    1830:	2400           	move.l d0,d2
    1832:	23c0 0000 74ec 	move.l d0,74ec <Bitplane2>
  if(Bitplane2 == 0) {
    1838:	6600 fe84      	bne.w 16be <PrepareDisplayZoom+0x60>
    183c:	6000 fef8      	bra.w 1736 <PrepareDisplayZoom+0xd8>

00001840 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1840:	2039 0000 7508 	move.l 7508 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1846:	2079 0000 74fa 	movea.l 74fa <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    184c:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1850:	2200           	move.l d0,d1
    1852:	4241           	clr.w d1
    1854:	4841           	swap d1
    1856:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    185a:	23f9 0000 74fe 	move.l 74fe <ViewBuffer>,7508 <DrawBuffer>
    1860:	0000 7508 
  ViewBuffer = (ULONG *) tmp;
    1864:	23c0 0000 74fe 	move.l d0,74fe <ViewBuffer>
}
    186a:	4e75           	rts

0000186c <RunFrame>:
	SetInterruptHandler((APTR)interruptHandler);
}



void RunFrame() {
    186c:	2f02           	move.l d2,-(sp)
  //TestZoomSpeed();
  SetBplPointers();
    186e:	4eba ffd0      	jsr 1840 <SetBplPointers>(pc)
  SwapCl();
    1872:	4eba fdc4      	jsr 1638 <SwapCl>(pc)
  //while( !MouseLeft()) {}
  Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer - 2, (UWORD *)DrawBuffer - 2, Zoom_LevelOfZoom, 1 );
    1876:	3439 0000 74d4 	move.w 74d4 <Zoom_LevelOfZoom>,d2
    187c:	4878 0001      	pea 1 <_start+0x1>
    1880:	3f02           	move.w d2,-(sp)
    1882:	4267           	clr.w -(sp)
    1884:	2039 0000 7508 	move.l 7508 <DrawBuffer>,d0
    188a:	5980           	subq.l #4,d0
    188c:	2f00           	move.l d0,-(sp)
    188e:	2039 0000 74fe 	move.l 74fe <ViewBuffer>,d0
    1894:	5980           	subq.l #4,d0
    1896:	2f00           	move.l d0,-(sp)
    1898:	4eba f668      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  if( Zoom_LevelOfZoom == 17)
    189c:	4fef 0010      	lea 16(sp),sp
    18a0:	0c42 0011      	cmpi.w #17,d2
    18a4:	670c           	beq.s 18b2 <RunFrame+0x46>
    Zoom_LevelOfZoom = 0;
  else
    Zoom_LevelOfZoom++;
    18a6:	5242           	addq.w #1,d2
    18a8:	33c2 0000 74d4 	move.w d2,74d4 <Zoom_LevelOfZoom>
  
    18ae:	241f           	move.l (sp)+,d2
    18b0:	4e75           	rts
    Zoom_LevelOfZoom = 0;
    18b2:	4279 0000 74d4 	clr.w 74d4 <Zoom_LevelOfZoom>
    18b8:	241f           	move.l (sp)+,d2
    18ba:	4e75           	rts

000018bc <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    18bc:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    18c0:	262f 0010      	move.l 16(sp),d3
    18c4:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    18c8:	2279 0000 7502 	movea.l 7502 <Copperlist1>,a1
    18ce:	b2fc 0000      	cmpa.w #0,a1
    18d2:	670c           	beq.s 18e0 <FreeDisplay+0x24>
    18d4:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    18da:	2003           	move.l d3,d0
    18dc:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    18e0:	2279 0000 74f4 	movea.l 74f4 <Copperlist2>,a1
    18e6:	b2fc 0000      	cmpa.w #0,a1
    18ea:	670c           	beq.s 18f8 <FreeDisplay+0x3c>
    18ec:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    18f2:	2003           	move.l d3,d0
    18f4:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    18f8:	2279 0000 74f0 	movea.l 74f0 <Bitplane1>,a1
    18fe:	b2fc 0000      	cmpa.w #0,a1
    1902:	670c           	beq.s 1910 <FreeDisplay+0x54>
    1904:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    190a:	2002           	move.l d2,d0
    190c:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    1910:	2279 0000 74ec 	movea.l 74ec <Bitplane2>,a1
    1916:	b2fc 0000      	cmpa.w #0,a1
    191a:	670c           	beq.s 1928 <FreeDisplay+0x6c>
    191c:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    1922:	2002           	move.l d2,d0
    1924:	4eae ff2e      	jsr -210(a6)
}
    1928:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    192c:	4e75           	rts

0000192e <WaitVbl>:
void WaitVbl() {
    192e:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    1930:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddb1b9>,d0
    1936:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    1938:	2017           	move.l (sp),d0
    193a:	0280 0001 ff00 	andi.l #130816,d0
    1940:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    1942:	2017           	move.l (sp),d0
    1944:	0c80 0001 3700 	cmpi.l #79616,d0
    194a:	67e4           	beq.s 1930 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    194c:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddb1b9>,d0
    1952:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    1956:	202f 0004      	move.l 4(sp),d0
    195a:	0280 0001 ff00 	andi.l #130816,d0
    1960:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    1964:	202f 0004      	move.l 4(sp),d0
    1968:	0c80 0001 3700 	cmpi.l #79616,d0
    196e:	66dc           	bne.s 194c <WaitVbl+0x1e>
}
    1970:	508f           	addq.l #8,sp
    1972:	4e75           	rts

00001974 <ZoomTest>:
void ZoomTest() {
    1974:	4fef ffb8      	lea -72(sp),sp
    1978:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
  hw->dmacon = 0b1000010000000000; //Blitter nasty
    197c:	2079 0000 7510 	movea.l 7510 <hw>,a0
    1982:	317c 8400 0096 	move.w #-31744,150(a0)
  Counter4Frames = 0;
    1988:	42b9 0000 7518 	clr.l 7518 <Counter4Frames>
  if (vbint = AllocMem(sizeof(struct Interrupt),    
    198e:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    1994:	7016           	moveq #22,d0
    1996:	223c 0001 0001 	move.l #65537,d1
    199c:	4eae ff3a      	jsr -198(a6)
    19a0:	2440           	movea.l d0,a2
    19a2:	4a80           	tst.l d0
    19a4:	671a           	beq.s 19c0 <ZoomTest+0x4c>
    vbint->is_Node.ln_Type = NT_INTERRUPT;       
    19a6:	357c 02c4 0008 	move.w #708,8(a2)
    vbint->is_Node.ln_Name = "VertB-Example";
    19ac:	257c 0000 4b71 	move.l #19313,10(a2)
    19b2:	000a 
    vbint->is_Data = NULL;
    19b4:	42aa 000e      	clr.l 14(a2)
    vbint->is_Code = Vblankcounter;
    19b8:	257c 0000 0ac0 	move.l #2752,18(a2)
    19be:	0012 
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    19c0:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    19c6:	203c 0001 1440 	move.l #70720,d0
    19cc:	7202           	moveq #2,d1
    19ce:	4eae ff3a      	jsr -198(a6)
    19d2:	2800           	move.l d0,d4
  if( source == 0) {
    19d4:	6700 25d6      	beq.w 3fac <ZoomTest+0x2638>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    19d8:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    19de:	203c 0001 1440 	move.l #70720,d0
    19e4:	7202           	moveq #2,d1
    19e6:	4eae ff3a      	jsr -198(a6)
    19ea:	2a00           	move.l d0,d5
  if( destination == 0) {
    19ec:	6700 2608      	beq.w 3ff6 <ZoomTest+0x2682>
    19f0:	2004           	move.l d4,d0
    19f2:	0680 0000 3300 	addi.l #13056,d0
    19f8:	2044           	movea.l d4,a0
      *tmp4source++ = 0x55555555;
    19fa:	20bc 5555 5555 	move.l #1431655765,(a0)
    1a00:	217c 5555 5555 	move.l #1431655765,4(a0)
    1a06:	0004 
    1a08:	217c 5555 5555 	move.l #1431655765,8(a0)
    1a0e:	0008 
    1a10:	217c 5555 5555 	move.l #1431655765,12(a0)
    1a16:	000c 
    1a18:	217c 5555 5555 	move.l #1431655765,16(a0)
    1a1e:	0010 
    1a20:	217c 5555 5555 	move.l #1431655765,20(a0)
    1a26:	0014 
    1a28:	217c 5555 5555 	move.l #1431655765,24(a0)
    1a2e:	0018 
    1a30:	217c 5555 5555 	move.l #1431655765,28(a0)
    1a36:	001c 
    1a38:	217c 5555 5555 	move.l #1431655765,32(a0)
    1a3e:	0020 
    1a40:	217c 5555 5555 	move.l #1431655765,36(a0)
    1a46:	0024 
    1a48:	217c 5555 5555 	move.l #1431655765,40(a0)
    1a4e:	0028 
    1a50:	217c 5555 5555 	move.l #1431655765,44(a0)
    1a56:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    1a58:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    1a5e:	0030 
    1a60:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    1a66:	0034 
    1a68:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    1a6e:	0038 
    1a70:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    1a76:	003c 
    1a78:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    1a7e:	0040 
    1a80:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    1a86:	0044 
    1a88:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    1a8e:	0048 
    1a90:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    1a96:	004c 
    1a98:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    1a9e:	0050 
    1aa0:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    1aa6:	0054 
    1aa8:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    1aae:	0058 
    1ab0:	41e8 0060      	lea 96(a0),a0
    1ab4:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    1aba:	fffc 
  for(int i=0;i<128+8;i++) {
    1abc:	b1c0           	cmpa.l d0,a0
    1abe:	6600 ff3a      	bne.w 19fa <ZoomTest+0x86>
  WaitVbl();
    1ac2:	4eba fe6a      	jsr 192e <WaitVbl>(pc)
  Init_Blit();
    1ac6:	4eba f8ae      	jsr 1376 <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1aca:	33fc 0001 0000 	move.w #1,7506 <ZoomBlit_Increment4SrcA>
    1ad0:	7506 
  WaitBlit(); 
    1ad2:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    1ad8:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1adc:	2079 0000 7510 	movea.l 7510 <hw>,a0
    1ae2:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1ae8:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1aee:	317c fff8 0070 	move.w #-8,112(a0)
  AddIntServer(INTB_VERTB, vbint);
    1af4:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    1afa:	7005           	moveq #5,d0
    1afc:	224a           	movea.l a2,a1
    1afe:	4eae ff58      	jsr -168(a6)
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    1b02:	4878 0005      	pea 5 <_start+0x5>
    1b06:	42a7           	clr.l -(sp)
    1b08:	2f05           	move.l d5,-(sp)
    1b0a:	2f04           	move.l d4,-(sp)
    1b0c:	4eba f3f4      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  RemIntServer(INTB_VERTB, vbint);
    1b10:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    1b16:	7005           	moveq #5,d0
    1b18:	224a           	movea.l a2,a1
    1b1a:	4eae ff52      	jsr -174(a6)
  if( Counter4Frames > 6)
    1b1e:	4fef 0010      	lea 16(sp),sp
    1b22:	7006           	moveq #6,d0
    1b24:	b0b9 0000 7518 	cmp.l 7518 <Counter4Frames>,d0
    1b2a:	6c1e           	bge.s 1b4a <ZoomTest+0x1d6>
    Write( Output(), "TestSpeed4Zoom: Takes too long\n", 31);
    1b2c:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1b32:	4eae ffc4      	jsr -60(a6)
    1b36:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1b3c:	2200           	move.l d0,d1
    1b3e:	243c 0000 4bf2 	move.l #19442,d2
    1b44:	761f           	moveq #31,d3
    1b46:	4eae ffd0      	jsr -48(a6)
  FreeMem( source, ( ZMLINESIZE+4)*272*5);
    1b4a:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    1b50:	2244           	movea.l d4,a1
    1b52:	203c 0001 1440 	move.l #70720,d0
    1b58:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, ( ZMLINESIZE+4)*272*5);
    1b5c:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    1b62:	2245           	movea.l d5,a1
    1b64:	203c 0001 1440 	move.l #70720,d0
    1b6a:	4eae ff2e      	jsr -210(a6)
  PrepareDisplayZoom();
    1b6e:	4bfa faee      	lea 165e <PrepareDisplayZoom>(pc),a5
    1b72:	4e95           	jsr (a5)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    1b74:	4878 0010      	pea 10 <main+0xa>
    1b78:	4879 0000 715c 	pea 715c <ClsSprites>
    1b7e:	42a7           	clr.l -(sp)
    1b80:	2f39 0000 7502 	move.l 7502 <Copperlist1>,-(sp)
    1b86:	47fa ef5e      	lea ae6 <TestCopperlistBatch>(pc),a3
    1b8a:	4e93           	jsr (a3)
    1b8c:	4fef 0010      	lea 16(sp),sp
    1b90:	4a80           	tst.l d0
    1b92:	661e           	bne.s 1bb2 <ZoomTest+0x23e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    1b94:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1b9a:	4eae ffc4      	jsr -60(a6)
    1b9e:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1ba4:	2200           	move.l d0,d1
    1ba6:	243c 0000 4c12 	move.l #19474,d2
    1bac:	762c           	moveq #44,d3
    1bae:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    1bb2:	4878 000c      	pea c <main+0x6>
    1bb6:	4879 0000 712c 	pea 712c <ClScreen>
    1bbc:	4878 0010      	pea 10 <main+0xa>
    1bc0:	2f39 0000 7502 	move.l 7502 <Copperlist1>,-(sp)
    1bc6:	4e93           	jsr (a3)
    1bc8:	4fef 0010      	lea 16(sp),sp
    1bcc:	4a80           	tst.l d0
    1bce:	661e           	bne.s 1bee <ZoomTest+0x27a>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    1bd0:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1bd6:	4eae ffc4      	jsr -60(a6)
    1bda:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1be0:	2200           	move.l d0,d1
    1be2:	243c 0000 4c48 	move.l #19528,d2
    1be8:	7636           	moveq #54,d3
    1bea:	4eae ffd0      	jsr -48(a6)
  UWORD *copword = (UWORD *) DrawCopper;
    1bee:	2079 0000 74fa 	movea.l 74fa <DrawCopper>,a0
    *copword = highword;
    1bf4:	317c 0004 0072 	move.w #4,114(a0)
    *copword = lowword;
    1bfa:	4268 0076      	clr.w 118(a0)
    *copword = highword;
    1bfe:	317c 0004 007a 	move.w #4,122(a0)
    *copword = lowword;
    1c04:	317c 2800 007e 	move.w #10240,126(a0)
  DrawBuffer = ViewBuffer;
    1c0a:	23fc 0005 0000 	move.l #327680,7508 <DrawBuffer>
    1c10:	0000 7508 
  ViewBuffer = (ULONG *) tmp;
    1c14:	23fc 0004 0000 	move.l #262144,74fe <ViewBuffer>
    1c1a:	0000 74fe 
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    1c1e:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    1c24:	4878 001c      	pea 1c <main+0x16>
    1c28:	2f39 0000 7502 	move.l 7502 <Copperlist1>,-(sp)
    1c2e:	45fa ee98      	lea ac8 <TestCopperlistPos>(pc),a2
    1c32:	4e92           	jsr (a2)
    1c34:	4fef 000c      	lea 12(sp),sp
    1c38:	4a80           	tst.l d0
    1c3a:	661e           	bne.s 1c5a <ZoomTest+0x2e6>
    Write(Output(), 
    1c3c:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1c42:	4eae ffc4      	jsr -60(a6)
    1c46:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1c4c:	2200           	move.l d0,d1
    1c4e:	243c 0000 4c7f 	move.l #19583,d2
    1c54:	763c           	moveq #60,d3
    1c56:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    1c5a:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    1c60:	4878 001d      	pea 1d <main+0x17>
    1c64:	2f39 0000 7502 	move.l 7502 <Copperlist1>,-(sp)
    1c6a:	4e92           	jsr (a2)
    1c6c:	4fef 000c      	lea 12(sp),sp
    1c70:	4a80           	tst.l d0
    1c72:	661e           	bne.s 1c92 <ZoomTest+0x31e>
    Write(Output(), 
    1c74:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1c7a:	4eae ffc4      	jsr -60(a6)
    1c7e:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1c84:	2200           	move.l d0,d1
    1c86:	243c 0000 4cbc 	move.l #19644,d2
    1c8c:	763c           	moveq #60,d3
    1c8e:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    1c92:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    1c98:	4878 001e      	pea 1e <main+0x18>
    1c9c:	2f39 0000 7502 	move.l 7502 <Copperlist1>,-(sp)
    1ca2:	4e92           	jsr (a2)
    1ca4:	4fef 000c      	lea 12(sp),sp
    1ca8:	4a80           	tst.l d0
    1caa:	661e           	bne.s 1cca <ZoomTest+0x356>
    Write(Output(), 
    1cac:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1cb2:	4eae ffc4      	jsr -60(a6)
    1cb6:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1cbc:	2200           	move.l d0,d1
    1cbe:	243c 0000 4cf9 	move.l #19705,d2
    1cc4:	763c           	moveq #60,d3
    1cc6:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
    1cca:	2f3c 00e6 2800 	move.l #15083520,-(sp)
    1cd0:	4878 001f      	pea 1f <main+0x19>
    1cd4:	2f39 0000 7502 	move.l 7502 <Copperlist1>,-(sp)
    1cda:	4e92           	jsr (a2)
    1cdc:	4fef 000c      	lea 12(sp),sp
    1ce0:	4a80           	tst.l d0
    1ce2:	661e           	bne.s 1d02 <ZoomTest+0x38e>
    Write(Output(), 
    1ce4:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1cea:	4eae ffc4      	jsr -60(a6)
    1cee:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1cf4:	2200           	move.l d0,d1
    1cf6:	243c 0000 4d36 	move.l #19766,d2
    1cfc:	763c           	moveq #60,d3
    1cfe:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
    1d02:	4878 0002      	pea 2 <_start+0x2>
    1d06:	4879 0000 7124 	pea 7124 <ClColor>
    1d0c:	4878 0020      	pea 20 <main+0x1a>
    1d10:	2f39 0000 7502 	move.l 7502 <Copperlist1>,-(sp)
    1d16:	4e93           	jsr (a3)
    1d18:	4fef 0010      	lea 16(sp),sp
    1d1c:	4a80           	tst.l d0
    1d1e:	661e           	bne.s 1d3e <ZoomTest+0x3ca>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1d20:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1d26:	4eae ffc4      	jsr -60(a6)
    1d2a:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1d30:	2200           	move.l d0,d1
    1d32:	243c 0000 4d73 	move.l #19827,d2
    1d38:	7621           	moveq #33,d3
    1d3a:	4eae ffd0      	jsr -48(a6)
  if( TestCopperlistPos( Copperlist1, 34, 0xfffffffe) == 0)
    1d3e:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdc1b3>
    1d42:	4878 0022      	pea 22 <main+0x1c>
    1d46:	2f39 0000 7502 	move.l 7502 <Copperlist1>,-(sp)
    1d4c:	4e92           	jsr (a2)
    1d4e:	4fef 000c      	lea 12(sp),sp
    1d52:	4a80           	tst.l d0
    1d54:	661e           	bne.s 1d74 <ZoomTest+0x400>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    1d56:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1d5c:	4eae ffc4      	jsr -60(a6)
    1d60:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1d66:	2200           	move.l d0,d1
    1d68:	243c 0000 4d95 	move.l #19861,d2
    1d6e:	7622           	moveq #34,d3
    1d70:	4eae ffd0      	jsr -48(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    1d74:	2f3c 0001 6800 	move.l #92160,-(sp)
    1d7a:	2f3c 0000 a48c 	move.l #42124,-(sp)
    1d80:	47fa fb3a      	lea 18bc <FreeDisplay>(pc),a3
    1d84:	4e93           	jsr (a3)
  Zoom_Init();
    1d86:	49fa f894      	lea 161c <Zoom_Init>(pc),a4
    1d8a:	4e94           	jsr (a4)
  PrepareDisplayZoom();
    1d8c:	4e95           	jsr (a5)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    1d8e:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    1d94:	203c 0000 c800 	move.l #51200,d0
    1d9a:	7202           	moveq #2,d1
    1d9c:	4eae ff3a      	jsr -198(a6)
    1da0:	2040           	movea.l d0,a0
    1da2:	23c0 0000 750c 	move.l d0,750c <Zoom_Source>
  if( Zoom_Source == 0) {
    1da8:	508f           	addq.l #8,sp
    1daa:	6700 21de      	beq.w 3f8a <ZoomTest+0x2616>
  *tstsource++ = 0x0000;
    1dae:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    1db0:	317c 0080 0002 	move.w #128,2(a0)
  *tstsource = 0x1000;
    1db6:	317c 1000 0030 	move.w #4096,48(a0)
  *tstsource = 0x8e88;
    1dbc:	317c 8e88 0032 	move.w #-29048,50(a0)
  *tstsource++ = 0x0000;
    1dc2:	4268 17d0      	clr.w 6096(a0)
  *tstsource = 0x00ff;
    1dc6:	317c 00ff 17d2 	move.w #255,6098(a0)
  WaitBlit();
    1dcc:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    1dd2:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    1dd6:	4eba f59e      	jsr 1376 <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1dda:	33fc 0001 0000 	move.w #1,7506 <ZoomBlit_Increment4SrcA>
    1de0:	7506 
  WaitBlit(); 
    1de2:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    1de8:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1dec:	2479 0000 7510 	movea.l 7510 <hw>,a2
    1df2:	357c 0000 0042 	move.w #0,66(a2)
  hw->bltcon0 = 0xde4 + shifta;
    1df8:	357c fde4 0040 	move.w #-540,64(a2)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1dfe:	357c ff00 0070 	move.w #-256,112(a2)
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    1e04:	2639 0000 7508 	move.l 7508 <DrawBuffer>,d3
    1e0a:	2439 0000 750c 	move.l 750c <Zoom_Source>,d2
  WaitBlt();
    1e10:	4eba f0da      	jsr eec <WaitBlt>(pc)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1e14:	7000           	moveq #0,d0
    1e16:	3039 0000 7506 	move.w 7506 <ZoomBlit_Increment4SrcA>,d0
    1e1c:	d080           	add.l d0,d0
    1e1e:	d082           	add.l d2,d0
    1e20:	2540 0050      	move.l d0,80(a2)
  hw->bltbpt = source;
    1e24:	2542 004c      	move.l d2,76(a2)
  hw->bltdpt = destination;
    1e28:	2543 0054      	move.l d3,84(a2)
  hw->bltsize = height*64+2;
    1e2c:	357c 2002 0058 	move.w #8194,88(a2)
  WaitBlit();
    1e32:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    1e38:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    1e3c:	2479 0000 7508 	movea.l 7508 <DrawBuffer>,a2
  if( *destination != 0x0180) {
    1e42:	0c6a 0180 0002 	cmpi.w #384,2(a2)
    1e48:	671e           	beq.s 1e68 <ZoomTest+0x4f4>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    1e4a:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1e50:	4eae ffc4      	jsr -60(a6)
    1e54:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1e5a:	2200           	move.l d0,d1
    1e5c:	243c 0000 4df0 	move.l #19952,d2
    1e62:	761c           	moveq #28,d3
    1e64:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x1d88)
    1e68:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
    1e6e:	671e           	beq.s 1e8e <ZoomTest+0x51a>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    1e70:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1e76:	4eae ffc4      	jsr -60(a6)
    1e7a:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1e80:	2200           	move.l d0,d1
    1e82:	243c 0000 4e0d 	move.l #19981,d2
    1e88:	761c           	moveq #28,d3
    1e8a:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x01ff) {
    1e8e:	2079 0000 7508 	movea.l 7508 <DrawBuffer>,a0
    1e94:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
    1e9a:	671e           	beq.s 1eba <ZoomTest+0x546>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    1e9c:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1ea2:	4eae ffc4      	jsr -60(a6)
    1ea6:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    1eac:	2200           	move.l d0,d1
    1eae:	243c 0000 4e2a 	move.l #20010,d2
    1eb4:	761a           	moveq #26,d3
    1eb6:	4eae ffd0      	jsr -48(a6)
  FreeMem( Zoom_Source, 40*256*5);
    1eba:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    1ec0:	2279 0000 750c 	movea.l 750c <Zoom_Source>,a1
    1ec6:	203c 0000 c800 	move.l #51200,d0
    1ecc:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    1ed0:	2f3c 0001 6800 	move.l #92160,-(sp)
    1ed6:	2f3c 0000 a48c 	move.l #42124,-(sp)
    1edc:	4e93           	jsr (a3)
    1ede:	508f           	addq.l #8,sp
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    1ee0:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    1ee6:	203c 0000 05a0 	move.l #1440,d0
    1eec:	7202           	moveq #2,d1
    1eee:	4eae ff3a      	jsr -198(a6)
    1ef2:	2440           	movea.l d0,a2
  if( source == 0) {
    1ef4:	4a80           	tst.l d0
    1ef6:	6700 2032      	beq.w 3f2a <ZoomTest+0x25b6>
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    1efa:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    1f00:	203c 0000 05a0 	move.l #1440,d0
    1f06:	7202           	moveq #2,d1
    1f08:	4eae ff3a      	jsr -198(a6)
    1f0c:	2640           	movea.l d0,a3
  if( destination == 0) {
    1f0e:	4a80           	tst.l d0
    1f10:	6700 2018      	beq.w 3f2a <ZoomTest+0x25b6>
    *tmp++ = 0;
    1f14:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
    1f16:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
    1f1c:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
    1f22:	426a 0006      	clr.w 6(a2)
    *tmp++ = 0;
    1f26:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
    1f2a:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
    1f30:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
    1f36:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
    1f3a:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
    1f3e:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
    1f44:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
    1f4a:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
    1f4e:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
    1f52:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
    1f58:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
    1f5e:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
    1f62:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
    1f66:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
    1f6c:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
    1f72:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
    1f76:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
    1f7a:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
    1f80:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
    1f86:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
    1f8a:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
    1f8e:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
    1f94:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
    1f9a:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
    1f9e:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
    1fa2:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
    1fa8:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
    1fae:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
    1fb2:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
    1fb6:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
    1fbc:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
    1fc2:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
    1fc6:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
    1fca:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
    1fd0:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
    1fd6:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
    1fda:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
    1fde:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
    1fe4:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
    1fea:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
    1fee:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
    1ff2:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
    1ff8:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
    1ffe:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
    2002:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
    2006:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
    200c:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
    2012:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
    2016:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
    201a:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
    2020:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
    2026:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
    202a:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
    202e:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
    2034:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
    203a:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
    203e:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
    2042:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
    2048:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
    204e:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
    2052:	4878 05a0      	pea 5a0 <main+0x59a>
    2056:	42a7           	clr.l -(sp)
    2058:	2f00           	move.l d0,-(sp)
    205a:	4eba 204e      	jsr 40aa <memset>(pc)
  WaitBlit();
    205e:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    2064:	4eae ff1c      	jsr -228(a6)
  Zoom_Init();
    2068:	4e94           	jsr (a4)
  WaitBlit();
    206a:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    2070:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    2074:	2879 0000 7510 	movea.l 7510 <hw>,a4
    207a:	397c 39f0 0040 	move.w #14832,64(a4)
  hw->bltcon1 = 0;
    2080:	397c 0000 0042 	move.w #0,66(a4)
  WaitBlt();
    2086:	4eba ee64      	jsr eec <WaitBlt>(pc)
  hw->bltapt = (UWORD *) source;
    208a:	200a           	move.l a2,d0
    208c:	5480           	addq.l #2,d0
    208e:	2940 0050      	move.l d0,80(a4)
  hw->bltdpt = (UWORD *) destination;
    2092:	294b 0054      	move.l a3,84(a4)
  hw->bltsize = height*64+2;
    2096:	397c 0402 0058 	move.w #1026,88(a4)
  WaitBlit();
    209c:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    20a2:	4eae ff1c      	jsr -228(a6)
  if( *tmp != 0x5555) 
    20a6:	4fef 000c      	lea 12(sp),sp
    20aa:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
    20b0:	671e           	beq.s 20d0 <ZoomTest+0x75c>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    20b2:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    20b8:	4eae ffc4      	jsr -60(a6)
    20bc:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    20c2:	2200           	move.l d0,d1
    20c4:	243c 0000 4e7b 	move.l #20091,d2
    20ca:	761f           	moveq #31,d3
    20cc:	4eae ffd0      	jsr -48(a6)
  if( *tmp != 0xaaaa)
    20d0:	0c6b aaaa 0032 	cmpi.w #-21846,50(a3)
    20d6:	671e           	beq.s 20f6 <ZoomTest+0x782>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    20d8:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    20de:	4eae ffc4      	jsr -60(a6)
    20e2:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    20e8:	2200           	move.l d0,d1
    20ea:	243c 0000 4e9b 	move.l #20123,d2
    20f0:	7620           	moveq #32,d3
    20f2:	4eae ffd0      	jsr -48(a6)
  FreeMem( source,ZMLINESIZE*30);
    20f6:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    20fc:	224a           	movea.l a2,a1
    20fe:	203c 0000 05a0 	move.l #1440,d0
    2104:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    2108:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    210e:	224b           	movea.l a3,a1
    2110:	203c 0000 05a0 	move.l #1440,d0
    2116:	4eae ff2e      	jsr -210(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    211a:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    2120:	203c 0000 3740 	move.l #14144,d0
    2126:	7202           	moveq #2,d1
    2128:	4eae ff3a      	jsr -198(a6)
    212c:	2840           	movea.l d0,a4
  if( source == 0) {
    212e:	4a80           	tst.l d0
    2130:	6700 1e30      	beq.w 3f62 <ZoomTest+0x25ee>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    2134:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    213a:	203c 0000 3740 	move.l #14144,d0
    2140:	7202           	moveq #2,d1
    2142:	4eae ff3a      	jsr -198(a6)
    2146:	2640           	movea.l d0,a3
  if( destination == 0) {
    2148:	4a80           	tst.l d0
    214a:	6700 1e82      	beq.w 3fce <ZoomTest+0x265a>
    214e:	200c           	move.l a4,d0
    2150:	0680 0000 3300 	addi.l #13056,d0
    2156:	204c           	movea.l a4,a0
      *tmp4source++ = 0x55555555;
    2158:	20bc 5555 5555 	move.l #1431655765,(a0)
    215e:	217c 5555 5555 	move.l #1431655765,4(a0)
    2164:	0004 
    2166:	217c 5555 5555 	move.l #1431655765,8(a0)
    216c:	0008 
    216e:	217c 5555 5555 	move.l #1431655765,12(a0)
    2174:	000c 
    2176:	217c 5555 5555 	move.l #1431655765,16(a0)
    217c:	0010 
    217e:	217c 5555 5555 	move.l #1431655765,20(a0)
    2184:	0014 
    2186:	217c 5555 5555 	move.l #1431655765,24(a0)
    218c:	0018 
    218e:	217c 5555 5555 	move.l #1431655765,28(a0)
    2194:	001c 
    2196:	217c 5555 5555 	move.l #1431655765,32(a0)
    219c:	0020 
    219e:	217c 5555 5555 	move.l #1431655765,36(a0)
    21a4:	0024 
    21a6:	217c 5555 5555 	move.l #1431655765,40(a0)
    21ac:	0028 
    21ae:	217c 5555 5555 	move.l #1431655765,44(a0)
    21b4:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    21b6:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    21bc:	0030 
    21be:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    21c4:	0034 
    21c6:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    21cc:	0038 
    21ce:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    21d4:	003c 
    21d6:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    21dc:	0040 
    21de:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    21e4:	0044 
    21e6:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    21ec:	0048 
    21ee:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    21f4:	004c 
    21f6:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    21fc:	0050 
    21fe:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    2204:	0054 
    2206:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    220c:	0058 
    220e:	41e8 0060      	lea 96(a0),a0
    2212:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    2218:	fffc 
  for(int i=0;i<128+8;i++) {
    221a:	b1c0           	cmpa.l d0,a0
    221c:	6600 ff3a      	bne.w 2158 <ZoomTest+0x7e4>
  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    2220:	4878 0001      	pea 1 <_start+0x1>
    2224:	42a7           	clr.l -(sp)
    2226:	2f0b           	move.l a3,-(sp)
    2228:	2f0c           	move.l a4,-(sp)
    222a:	4eba ecd6      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    222e:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    2234:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    2238:	41eb 0004      	lea 4(a3),a0
    223c:	2f48 0044      	move.l a0,68(sp)
  for(int i=0;i<14;i++) {
    2240:	41eb 0364      	lea 868(a3),a0
    2244:	2f48 0048      	move.l a0,72(sp)
    2248:	2a08           	move.l a0,d5
    224a:	4fef 0010      	lea 16(sp),sp
  UWORD *valactual = destination+2; 
    224e:	3c7c 0012      	movea.w #18,a6
  UWORD mask = 0xffff;
    2252:	74ff           	moveq #-1,d2
    2254:	7600           	moveq #0,d3
    2256:	4643           	not.w d3
    2258:	45fa e750      	lea 9aa <TestRow>(pc),a2
    225c:	280b           	move.l a3,d4
    225e:	2a45           	movea.l d5,a5
    2260:	4bed fca0      	lea -864(a5),a5
    2264:	47ee ffee      	lea -18(a6),a3
      TestRow( valsupposed, valactual, mask, i2+i*19);
    2268:	2f0b           	move.l a3,-(sp)
    226a:	2f03           	move.l d3,-(sp)
    226c:	2f0d           	move.l a5,-(sp)
    226e:	4879 0000 7488 	pea 7488 <destlinezoom1>
    2274:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2276:	4bed 0030      	lea 48(a5),a5
      mask = mask ^ 0xffff;
    227a:	4642           	not.w d2
    227c:	528b           	addq.l #1,a3
    for(int i2=0;i2<18;i2++) { 
    227e:	4fef 0010      	lea 16(sp),sp
    2282:	ba8d           	cmp.l a5,d5
    2284:	6600 189c      	bne.w 3b22 <ZoomTest+0x21ae>
    TestRow( valsupposed, valactual, mask, 18+i*19);
    2288:	2f0e           	move.l a6,-(sp)
    228a:	7600           	moveq #0,d3
    228c:	3602           	move.w d2,d3
    228e:	2f03           	move.l d3,-(sp)
    2290:	2f0d           	move.l a5,-(sp)
    2292:	4879 0000 7488 	pea 7488 <destlinezoom1>
    2298:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    229a:	2a0d           	move.l a5,d5
    229c:	0685 0000 0390 	addi.l #912,d5
    22a2:	4dee 0013      	lea 19(a6),a6
  for(int i=0;i<14;i++) {
    22a6:	4fef 0010      	lea 16(sp),sp
    22aa:	bcfc 011c      	cmpa.w #284,a6
    22ae:	66ae           	bne.s 225e <ZoomTest+0x8ea>
    22b0:	2644           	movea.l d4,a3
    22b2:	41eb 31e4      	lea 12772(a3),a0
    22b6:	2f48 002c      	move.l a0,44(sp)
    22ba:	2a48           	movea.l a0,a5
    22bc:	283c 0000 0109 	move.l #265,d4
    TestRow( valsupposed, valactual, mask, i2+265);
    22c2:	2f04           	move.l d4,-(sp)
    22c4:	2f03           	move.l d3,-(sp)
    22c6:	2f0d           	move.l a5,-(sp)
    22c8:	4879 0000 7488 	pea 7488 <destlinezoom1>
    22ce:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    22d0:	4bed 0030      	lea 48(a5),a5
    mask = mask ^ 0xffff;
    22d4:	4642           	not.w d2
    22d6:	5284           	addq.l #1,d4
  for(int i2=0;i2<4;i2++) { 
    22d8:	4fef 0010      	lea 16(sp),sp
    22dc:	0c84 0000 010d 	cmpi.l #269,d4
    22e2:	6726           	beq.s 230a <ZoomTest+0x996>
    22e4:	7600           	moveq #0,d3
    22e6:	3602           	move.w d2,d3
    TestRow( valsupposed, valactual, mask, i2+265);
    22e8:	2f04           	move.l d4,-(sp)
    22ea:	2f03           	move.l d3,-(sp)
    22ec:	2f0d           	move.l a5,-(sp)
    22ee:	4879 0000 7488 	pea 7488 <destlinezoom1>
    22f4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    22f6:	4bed 0030      	lea 48(a5),a5
    mask = mask ^ 0xffff;
    22fa:	4642           	not.w d2
    22fc:	5284           	addq.l #1,d4
  for(int i2=0;i2<4;i2++) { 
    22fe:	4fef 0010      	lea 16(sp),sp
    2302:	0c84 0000 010d 	cmpi.l #269,d4
    2308:	66da           	bne.s 22e4 <ZoomTest+0x970>
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    230a:	4878 0001      	pea 1 <_start+0x1>
    230e:	4878 0001      	pea 1 <_start+0x1>
    2312:	2f0c           	move.l a4,-(sp)
    2314:	2f0b           	move.l a3,-(sp)
    2316:	4eba ebea      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    231a:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    2320:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    2324:	41ec 0004      	lea 4(a4),a0
    2328:	2f48 0040      	move.l a0,64(sp)
    232c:	4fef 0010      	lea 16(sp),sp
    2330:	2a48           	movea.l a0,a5
  for(int i2=0;i2<11;i2++) { 
    2332:	7600           	moveq #0,d3
  mask = 0x0000;
    2334:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    2336:	2f03           	move.l d3,-(sp)
    2338:	3f02           	move.w d2,-(sp)
    233a:	4267           	clr.w -(sp)
    233c:	2f0d           	move.l a5,-(sp)
    233e:	4879 0000 745c 	pea 745c <destlinezoom2>
    2344:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2346:	4bed 0030      	lea 48(a5),a5
    mask = mask ^ 0xffff;
    234a:	4642           	not.w d2
  for(int i2=0;i2<11;i2++) { 
    234c:	5283           	addq.l #1,d3
    234e:	4fef 0010      	lea 16(sp),sp
    2352:	700b           	moveq #11,d0
    2354:	b083           	cmp.l d3,d0
    2356:	66de           	bne.s 2336 <ZoomTest+0x9c2>
  TestRow( valsupposed, valactual, 0xffff, 8);
    2358:	4878 0008      	pea 8 <main+0x2>
    235c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2362:	41ec 0214      	lea 532(a4),a0
    2366:	2f48 0064      	move.l a0,100(sp)
    236a:	2f08           	move.l a0,-(sp)
    236c:	4879 0000 745c 	pea 745c <destlinezoom2>
    2372:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0xffff, 9);
    2374:	4878 0009      	pea 9 <main+0x3>
    2378:	2f3c 0000 ffff 	move.l #65535,-(sp)
    237e:	486c 0244      	pea 580(a4)
    2382:	4879 0000 745c 	pea 745c <destlinezoom2>
    2388:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0x0000, 10);
    238a:	4fef 0020      	lea 32(sp),sp
    238e:	4878 000a      	pea a <main+0x4>
    2392:	42a7           	clr.l -(sp)
    2394:	486c 0274      	pea 628(a4)
    2398:	4879 0000 745c 	pea 745c <destlinezoom2>
    239e:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0x0000, 11);
    23a0:	4878 000b      	pea b <main+0x5>
    23a4:	42a7           	clr.l -(sp)
    23a6:	486c 02a4      	pea 676(a4)
    23aa:	4879 0000 745c 	pea 745c <destlinezoom2>
    23b0:	4e92           	jsr (a2)
  for(int i=0;i<12;i++) {
    23b2:	2a0c           	move.l a4,d5
    23b4:	0685 0000 05d4 	addi.l #1492,d5
    23ba:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
    23be:	2c05           	move.l d5,d6
    23c0:	3c7c 0018      	movea.w #24,a6
    23c4:	7800           	moveq #0,d4
    23c6:	3802           	move.w d2,d4
    23c8:	2e0b           	move.l a3,d7
    23ca:	2a46           	movea.l d6,a5
    23cc:	4bed fd00      	lea -768(a5),a5
    23d0:	47ee fff3      	lea -13(a6),a3
    23d4:	2604           	move.l d4,d3
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    23d6:	2f0b           	move.l a3,-(sp)
    23d8:	2f03           	move.l d3,-(sp)
    23da:	2f0d           	move.l a5,-(sp)
    23dc:	4879 0000 745c 	pea 745c <destlinezoom2>
    23e2:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    23e4:	4bed 0030      	lea 48(a5),a5
      mask = mask ^ 0xffff;
    23e8:	4642           	not.w d2
    23ea:	528b           	addq.l #1,a3
    for(int i2=0;i2<16;i2++) {  
    23ec:	4fef 0010      	lea 16(sp),sp
    23f0:	bc8d           	cmp.l a5,d6
    23f2:	6722           	beq.s 2416 <ZoomTest+0xaa2>
    23f4:	7600           	moveq #0,d3
    23f6:	3602           	move.w d2,d3
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    23f8:	2f0b           	move.l a3,-(sp)
    23fa:	2f03           	move.l d3,-(sp)
    23fc:	2f0d           	move.l a5,-(sp)
    23fe:	4879 0000 745c 	pea 745c <destlinezoom2>
    2404:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2406:	4bed 0030      	lea 48(a5),a5
      mask = mask ^ 0xffff;
    240a:	4642           	not.w d2
    240c:	528b           	addq.l #1,a3
    for(int i2=0;i2<16;i2++) {  
    240e:	4fef 0010      	lea 16(sp),sp
    2412:	bc8d           	cmp.l a5,d6
    2414:	66de           	bne.s 23f4 <ZoomTest+0xa80>
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    2416:	7800           	moveq #0,d4
    2418:	3802           	move.w d2,d4
    241a:	2f0e           	move.l a6,-(sp)
    241c:	2f04           	move.l d4,-(sp)
    241e:	2f0d           	move.l a5,-(sp)
    2420:	4879 0000 745c 	pea 745c <destlinezoom2>
    2426:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    2428:	486e 0001      	pea 1(a6)
    242c:	2f04           	move.l d4,-(sp)
    242e:	486d 0030      	pea 48(a5)
    2432:	4879 0000 745c 	pea 745c <destlinezoom2>
    2438:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    243a:	4fef 0020      	lea 32(sp),sp
    243e:	486e 0002      	pea 2(a6)
    2442:	2f03           	move.l d3,-(sp)
    2444:	486d 0060      	pea 96(a5)
    2448:	4879 0000 745c 	pea 745c <destlinezoom2>
    244e:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    2450:	486e 0003      	pea 3(a6)
    2454:	2f03           	move.l d3,-(sp)
    2456:	486d 0090      	pea 144(a5)
    245a:	4879 0000 745c 	pea 745c <destlinezoom2>
    2460:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2462:	2c0d           	move.l a5,d6
    2464:	0686 0000 03c0 	addi.l #960,d6
    246a:	4dee 0011      	lea 17(a6),a6
  for(int i=0;i<12;i++) {
    246e:	4fef 0020      	lea 32(sp),sp
    2472:	bcfc 00e4      	cmpa.w #228,a6
    2476:	6600 ff52      	bne.w 23ca <ZoomTest+0xa56>
    247a:	2647           	movea.l d7,a3
    247c:	41ec 2fd4      	lea 12244(a4),a0
    2480:	2f48 0064      	move.l a0,100(sp)
    2484:	2a48           	movea.l a0,a5
  for(int i2=0;i2<15;i2++) { 
    2486:	7600           	moveq #0,d3
    TestRow( valsupposed, valactual, mask, i2);
    2488:	2f03           	move.l d3,-(sp)
    248a:	2f04           	move.l d4,-(sp)
    248c:	2f0d           	move.l a5,-(sp)
    248e:	4879 0000 745c 	pea 745c <destlinezoom2>
    2494:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2496:	4bed 0030      	lea 48(a5),a5
    mask = mask ^ 0xffff;
    249a:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    249c:	5283           	addq.l #1,d3
    249e:	4fef 0010      	lea 16(sp),sp
    24a2:	700f           	moveq #15,d0
    24a4:	b083           	cmp.l d3,d0
    24a6:	6724           	beq.s 24cc <ZoomTest+0xb58>
    24a8:	7800           	moveq #0,d4
    24aa:	3802           	move.w d2,d4
    TestRow( valsupposed, valactual, mask, i2);
    24ac:	2f03           	move.l d3,-(sp)
    24ae:	2f04           	move.l d4,-(sp)
    24b0:	2f0d           	move.l a5,-(sp)
    24b2:	4879 0000 745c 	pea 745c <destlinezoom2>
    24b8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    24ba:	4bed 0030      	lea 48(a5),a5
    mask = mask ^ 0xffff;
    24be:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    24c0:	5283           	addq.l #1,d3
    24c2:	4fef 0010      	lea 16(sp),sp
    24c6:	700f           	moveq #15,d0
    24c8:	b083           	cmp.l d3,d0
    24ca:	66dc           	bne.s 24a8 <ZoomTest+0xb34>
  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    24cc:	4878 0001      	pea 1 <_start+0x1>
    24d0:	4878 0002      	pea 2 <_start+0x2>
    24d4:	2f0b           	move.l a3,-(sp)
    24d6:	2f0c           	move.l a4,-(sp)
    24d8:	4eba ea28      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    24dc:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    24e2:	4eae ff1c      	jsr -228(a6)
    24e6:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    24ea:	2a6f 0034      	movea.l 52(sp),a5
  for(int i2=0;i2<4;i2++) { 
    24ee:	7400           	moveq #0,d2
  mask = 0xffff;
    24f0:	76ff           	moveq #-1,d3
    TestRow( valsupposed, valactual, mask, i2);
    24f2:	2f02           	move.l d2,-(sp)
    24f4:	3f03           	move.w d3,-(sp)
    24f6:	4267           	clr.w -(sp)
    24f8:	2f0d           	move.l a5,-(sp)
    24fa:	4879 0000 7430 	pea 7430 <destlinezoom3>
    2500:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2502:	4bed 0030      	lea 48(a5),a5
    mask = mask ^ 0xffff;
    2506:	4643           	not.w d3
  for(int i2=0;i2<4;i2++) { 
    2508:	5282           	addq.l #1,d2
    250a:	4fef 0010      	lea 16(sp),sp
    250e:	7204           	moveq #4,d1
    2510:	b282           	cmp.l d2,d1
    2512:	66de           	bne.s 24f2 <ZoomTest+0xb7e>
  TestRow( valsupposed, valactual, 0xffff, 0+4);
    2514:	4878 0004      	pea 4 <_start+0x4>
    2518:	2f3c 0000 ffff 	move.l #65535,-(sp)
    251e:	486b 00c4      	pea 196(a3)
    2522:	4879 0000 7430 	pea 7430 <destlinezoom3>
    2528:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    252a:	4878 0005      	pea 5 <_start+0x5>
    252e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2534:	486b 00f4      	pea 244(a3)
    2538:	4879 0000 7430 	pea 7430 <destlinezoom3>
    253e:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    2540:	4fef 0020      	lea 32(sp),sp
    2544:	4878 0006      	pea 6 <main>
    2548:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
    254a:	41eb 0124      	lea 292(a3),a0
    254e:	2f48 005c      	move.l a0,92(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    2552:	2f08           	move.l a0,-(sp)
    2554:	4879 0000 7430 	pea 7430 <destlinezoom3>
    255a:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    255c:	4878 0007      	pea 7 <main+0x1>
    2560:	42a7           	clr.l -(sp)
    2562:	486b 0154      	pea 340(a3)
    2566:	4879 0000 7430 	pea 7430 <destlinezoom3>
    256c:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    256e:	4fef 0020      	lea 32(sp),sp
    2572:	4878 0008      	pea 8 <main+0x2>
    2576:	2f3c 0000 ffff 	move.l #65535,-(sp)
    257c:	486b 0184      	pea 388(a3)
    2580:	4879 0000 7430 	pea 7430 <destlinezoom3>
    2586:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2588:	4878 0009      	pea 9 <main+0x3>
    258c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2592:	486b 01b4      	pea 436(a3)
    2596:	4879 0000 7430 	pea 7430 <destlinezoom3>
    259c:	4e92           	jsr (a2)
  for(int i=0;i<12;i++) {
    259e:	2c0b           	move.l a3,d6
    25a0:	0686 0000 04b4 	addi.l #1204,d6
    25a6:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    25aa:	3c7c 0018      	movea.w #24,a6
    25ae:	7800           	moveq #0,d4
    25b0:	74ff           	moveq #-1,d2
    25b2:	2e0b           	move.l a3,d7
    25b4:	2a46           	movea.l d6,a5
    25b6:	4bed fd30      	lea -720(a5),a5
    25ba:	47ee fff1      	lea -15(a6),a3
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    25be:	2f0b           	move.l a3,-(sp)
    25c0:	2f04           	move.l d4,-(sp)
    25c2:	2f0d           	move.l a5,-(sp)
    25c4:	4879 0000 7430 	pea 7430 <destlinezoom3>
    25ca:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    25cc:	4bed 0030      	lea 48(a5),a5
      mask = mask ^ 0xffff;
    25d0:	528b           	addq.l #1,a3
    for(int i2=0;i2<15;i2++) {  
    25d2:	4fef 0010      	lea 16(sp),sp
    25d6:	bc8d           	cmp.l a5,d6
    25d8:	6722           	beq.s 25fc <ZoomTest+0xc88>
    25da:	7800           	moveq #0,d4
    25dc:	3802           	move.w d2,d4
    25de:	4642           	not.w d2
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    25e0:	2f0b           	move.l a3,-(sp)
    25e2:	2f04           	move.l d4,-(sp)
    25e4:	2f0d           	move.l a5,-(sp)
    25e6:	4879 0000 7430 	pea 7430 <destlinezoom3>
    25ec:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    25ee:	4bed 0030      	lea 48(a5),a5
      mask = mask ^ 0xffff;
    25f2:	528b           	addq.l #1,a3
    for(int i2=0;i2<15;i2++) {  
    25f4:	4fef 0010      	lea 16(sp),sp
    25f8:	bc8d           	cmp.l a5,d6
    25fa:	66de           	bne.s 25da <ZoomTest+0xc66>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    25fc:	7600           	moveq #0,d3
    25fe:	3602           	move.w d2,d3
    2600:	2f0e           	move.l a6,-(sp)
    2602:	2f03           	move.l d3,-(sp)
    2604:	2f0d           	move.l a5,-(sp)
    2606:	4879 0000 7430 	pea 7430 <destlinezoom3>
    260c:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    260e:	486e 0001      	pea 1(a6)
    2612:	2f03           	move.l d3,-(sp)
    2614:	486d 0030      	pea 48(a5)
    2618:	4879 0000 7430 	pea 7430 <destlinezoom3>
    261e:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    2620:	4fef 0020      	lea 32(sp),sp
    2624:	486e 0002      	pea 2(a6)
    2628:	2f04           	move.l d4,-(sp)
    262a:	486d 0060      	pea 96(a5)
    262e:	4879 0000 7430 	pea 7430 <destlinezoom3>
    2634:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    2636:	486e 0003      	pea 3(a6)
    263a:	2f04           	move.l d4,-(sp)
    263c:	486d 0090      	pea 144(a5)
    2640:	4879 0000 7430 	pea 7430 <destlinezoom3>
    2646:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2648:	4fef 0020      	lea 32(sp),sp
    264c:	486e 0004      	pea 4(a6)
    2650:	2f03           	move.l d3,-(sp)
    2652:	486d 00c0      	pea 192(a5)
    2656:	4879 0000 7430 	pea 7430 <destlinezoom3>
    265c:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    265e:	486e 0005      	pea 5(a6)
    2662:	2f03           	move.l d3,-(sp)
    2664:	486d 00f0      	pea 240(a5)
    2668:	4879 0000 7430 	pea 7430 <destlinezoom3>
    266e:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2670:	2c0d           	move.l a5,d6
    2672:	0686 0000 03f0 	addi.l #1008,d6
    2678:	4dee 0015      	lea 21(a6),a6
  for(int i=0;i<12;i++) {
    267c:	4fef 0020      	lea 32(sp),sp
    2680:	bcfc 0114      	cmpa.w #276,a6
    2684:	6600 ff2e      	bne.w 25b4 <ZoomTest+0xc40>
    2688:	2647           	movea.l d7,a3
    268a:	4beb 3124      	lea 12580(a3),a5
    268e:	263c 0000 0105 	move.l #261,d3
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    2694:	2f03           	move.l d3,-(sp)
    2696:	2f04           	move.l d4,-(sp)
    2698:	2f0d           	move.l a5,-(sp)
    269a:	4879 0000 7430 	pea 7430 <destlinezoom3>
    26a0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    26a2:	4bed 0030      	lea 48(a5),a5
    mask = mask ^ 0xffff;
    26a6:	5283           	addq.l #1,d3
  for(int i2=0;i2<8;i2++) {  
    26a8:	4fef 0010      	lea 16(sp),sp
    26ac:	0c83 0000 010d 	cmpi.l #269,d3
    26b2:	6726           	beq.s 26da <ZoomTest+0xd66>
    26b4:	7800           	moveq #0,d4
    26b6:	3802           	move.w d2,d4
    26b8:	4642           	not.w d2
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    26ba:	2f03           	move.l d3,-(sp)
    26bc:	2f04           	move.l d4,-(sp)
    26be:	2f0d           	move.l a5,-(sp)
    26c0:	4879 0000 7430 	pea 7430 <destlinezoom3>
    26c6:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    26c8:	4bed 0030      	lea 48(a5),a5
    mask = mask ^ 0xffff;
    26cc:	5283           	addq.l #1,d3
  for(int i2=0;i2<8;i2++) {  
    26ce:	4fef 0010      	lea 16(sp),sp
    26d2:	0c83 0000 010d 	cmpi.l #269,d3
    26d8:	66da           	bne.s 26b4 <ZoomTest+0xd40>
  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    26da:	4878 0001      	pea 1 <_start+0x1>
    26de:	4878 0003      	pea 3 <_start+0x3>
    26e2:	2f0c           	move.l a4,-(sp)
    26e4:	2f0b           	move.l a3,-(sp)
    26e6:	4eba e81a      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    26ea:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    26f0:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    26f4:	4878 0007      	pea 7 <main+0x1>
    26f8:	42a7           	clr.l -(sp)
    26fa:	2f2f 0048      	move.l 72(sp),-(sp)
    26fe:	4879 0000 7404 	pea 7404 <destlinezoom4>
    2704:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    2706:	41ec 0034      	lea 52(a4),a0
    270a:	2f48 0060      	move.l a0,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    270e:	4fef 0020      	lea 32(sp),sp
    2712:	4878 0008      	pea 8 <main+0x2>
    2716:	2f3c 0000 ffff 	move.l #65535,-(sp)
    271c:	2f08           	move.l a0,-(sp)
    271e:	4879 0000 7404 	pea 7404 <destlinezoom4>
    2724:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    2726:	41ec 0064      	lea 100(a4),a0
    272a:	2f48 0060      	move.l a0,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    272e:	4878 0009      	pea 9 <main+0x3>
    2732:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2738:	2f08           	move.l a0,-(sp)
    273a:	4879 0000 7404 	pea 7404 <destlinezoom4>
    2740:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    2742:	41ec 0094      	lea 148(a4),a0
    2746:	2f48 005c      	move.l a0,92(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    274a:	4fef 0020      	lea 32(sp),sp
    274e:	4878 0008      	pea 8 <main+0x2>
    2752:	42a7           	clr.l -(sp)
    2754:	2f08           	move.l a0,-(sp)
    2756:	4879 0000 7404 	pea 7404 <destlinezoom4>
    275c:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    275e:	4878 0009      	pea 9 <main+0x3>
    2762:	42a7           	clr.l -(sp)
    2764:	486c 00c4      	pea 196(a4)
    2768:	4879 0000 7404 	pea 7404 <destlinezoom4>
    276e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    2770:	41ec 00f4      	lea 244(a4),a0
    2774:	2f48 0064      	move.l a0,100(sp)
  for(int i=0;i<12;i++) {
    2778:	2c0c           	move.l a4,d6
    277a:	0686 0000 0394 	addi.l #916,d6
    2780:	4fef 0020      	lea 32(sp),sp
  valactual += ZMLINESIZE/2;
    2784:	3c7c 0018      	movea.w #24,a6
  mask = 0xffff;
    2788:	78ff           	moveq #-1,d4
    278a:	7400           	moveq #0,d2
    278c:	4642           	not.w d2
    278e:	2e0b           	move.l a3,d7
    2790:	2a46           	movea.l d6,a5
    2792:	4bed fd60      	lea -672(a5),a5
    2796:	47ee fff1      	lea -15(a6),a3
    279a:	2602           	move.l d2,d3
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    279c:	2f0b           	move.l a3,-(sp)
    279e:	2f03           	move.l d3,-(sp)
    27a0:	2f0d           	move.l a5,-(sp)
    27a2:	4879 0000 7404 	pea 7404 <destlinezoom4>
    27a8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    27aa:	4bed 0030      	lea 48(a5),a5
      mask = mask ^ 0xffff;
    27ae:	4644           	not.w d4
    27b0:	528b           	addq.l #1,a3
    for(int i2=0;i2<14;i2++) {  
    27b2:	4fef 0010      	lea 16(sp),sp
    27b6:	bc8d           	cmp.l a5,d6
    27b8:	6722           	beq.s 27dc <ZoomTest+0xe68>
    27ba:	7600           	moveq #0,d3
    27bc:	3604           	move.w d4,d3
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    27be:	2f0b           	move.l a3,-(sp)
    27c0:	2f03           	move.l d3,-(sp)
    27c2:	2f0d           	move.l a5,-(sp)
    27c4:	4879 0000 7404 	pea 7404 <destlinezoom4>
    27ca:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    27cc:	4bed 0030      	lea 48(a5),a5
      mask = mask ^ 0xffff;
    27d0:	4644           	not.w d4
    27d2:	528b           	addq.l #1,a3
    for(int i2=0;i2<14;i2++) {  
    27d4:	4fef 0010      	lea 16(sp),sp
    27d8:	bc8d           	cmp.l a5,d6
    27da:	66de           	bne.s 27ba <ZoomTest+0xe46>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    27dc:	7400           	moveq #0,d2
    27de:	3404           	move.w d4,d2
    27e0:	2f0e           	move.l a6,-(sp)
    27e2:	2f02           	move.l d2,-(sp)
    27e4:	2f0d           	move.l a5,-(sp)
    27e6:	4879 0000 7404 	pea 7404 <destlinezoom4>
    27ec:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    27ee:	486e 0001      	pea 1(a6)
    27f2:	2f02           	move.l d2,-(sp)
    27f4:	486d 0030      	pea 48(a5)
    27f8:	4879 0000 7404 	pea 7404 <destlinezoom4>
    27fe:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    2800:	4fef 0020      	lea 32(sp),sp
    2804:	486e 0002      	pea 2(a6)
    2808:	2f03           	move.l d3,-(sp)
    280a:	486d 0060      	pea 96(a5)
    280e:	4879 0000 7404 	pea 7404 <destlinezoom4>
    2814:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    2816:	486e 0003      	pea 3(a6)
    281a:	2f03           	move.l d3,-(sp)
    281c:	486d 0090      	pea 144(a5)
    2820:	4879 0000 7404 	pea 7404 <destlinezoom4>
    2826:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2828:	47ee 0004      	lea 4(a6),a3
    282c:	4fef 001c      	lea 28(sp),sp
    2830:	2e8b           	move.l a3,(sp)
    2832:	2f02           	move.l d2,-(sp)
    2834:	486d 00c0      	pea 192(a5)
    2838:	4879 0000 7404 	pea 7404 <destlinezoom4>
    283e:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2840:	2c0e           	move.l a6,d6
    2842:	5a86           	addq.l #5,d6
    2844:	2f06           	move.l d6,-(sp)
    2846:	2f02           	move.l d2,-(sp)
    2848:	486d 00f0      	pea 240(a5)
    284c:	4879 0000 7404 	pea 7404 <destlinezoom4>
    2852:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2854:	4fef 001c      	lea 28(sp),sp
    2858:	2e8b           	move.l a3,(sp)
    285a:	2f03           	move.l d3,-(sp)
    285c:	486d 0120      	pea 288(a5)
    2860:	4879 0000 7404 	pea 7404 <destlinezoom4>
    2866:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2868:	2f06           	move.l d6,-(sp)
    286a:	2f03           	move.l d3,-(sp)
    286c:	486d 0150      	pea 336(a5)
    2870:	4879 0000 7404 	pea 7404 <destlinezoom4>
    2876:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2878:	2c0d           	move.l a5,d6
    287a:	0686 0000 0420 	addi.l #1056,d6
    2880:	4dee 0015      	lea 21(a6),a6
  for(int i=0;i<12;i++) {
    2884:	4fef 0020      	lea 32(sp),sp
    2888:	bcfc 0114      	cmpa.w #276,a6
    288c:	6600 ff02      	bne.w 2790 <ZoomTest+0xe1c>
    2890:	2647           	movea.l d7,a3
  TestRow( valsupposed, valactual, mask, 269);
    2892:	4878 010d      	pea 10d <main+0x107>
    2896:	2f02           	move.l d2,-(sp)
    2898:	486c 3274      	pea 12916(a4)
    289c:	4879 0000 7404 	pea 7404 <destlinezoom4>
    28a2:	4e92           	jsr (a2)
  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    28a4:	4878 0001      	pea 1 <_start+0x1>
    28a8:	4878 0004      	pea 4 <_start+0x4>
    28ac:	2f07           	move.l d7,-(sp)
    28ae:	2f0c           	move.l a4,-(sp)
    28b0:	4eba e650      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    28b4:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    28ba:	4eae ff1c      	jsr -228(a6)
    28be:	4fef 0020      	lea 32(sp),sp
  valactual = destination+2; 
    28c2:	2c6f 0034      	movea.l 52(sp),a6
  for(int i2=0;i2<13;i2++) {  
    28c6:	9bcd           	suba.l a5,a5
  mask = 0x0000;
    28c8:	4244           	clr.w d4
    TestRow( valsupposed, valactual, mask, i2);
    28ca:	7400           	moveq #0,d2
    28cc:	3404           	move.w d4,d2
    28ce:	2f0d           	move.l a5,-(sp)
    28d0:	2f02           	move.l d2,-(sp)
    28d2:	2f0e           	move.l a6,-(sp)
    28d4:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    28da:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    28dc:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    28e0:	4644           	not.w d4
  for(int i2=0;i2<13;i2++) {  
    28e2:	528d           	addq.l #1,a5
    28e4:	4fef 0010      	lea 16(sp),sp
    28e8:	700d           	moveq #13,d0
    28ea:	b08d           	cmp.l a5,d0
    28ec:	66dc           	bne.s 28ca <ZoomTest+0xf56>
    28ee:	7600           	moveq #0,d3
    28f0:	3604           	move.w d4,d3
  TestRow( valsupposed, valactual, mask, 12);   
    28f2:	4878 000c      	pea c <main+0x6>
    28f6:	2f03           	move.l d3,-(sp)
    28f8:	486b 0274      	pea 628(a3)
    28fc:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2902:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 13);
    2904:	4878 000d      	pea d <main+0x7>
    2908:	2f03           	move.l d3,-(sp)
    290a:	486b 02a4      	pea 676(a3)
    290e:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2914:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 14);
    2916:	4fef 0020      	lea 32(sp),sp
    291a:	4878 000e      	pea e <main+0x8>
    291e:	2f02           	move.l d2,-(sp)
    2920:	486b 02d4      	pea 724(a3)
    2924:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    292a:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 15);
    292c:	4878 000f      	pea f <main+0x9>
    2930:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2932:	41eb 0304      	lea 772(a3),a0
    2936:	2f48 0064      	move.l a0,100(sp)
  TestRow( valsupposed, valactual, mask, 15);
    293a:	2f08           	move.l a0,-(sp)
    293c:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2942:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 16);
    2944:	4fef 0020      	lea 32(sp),sp
    2948:	4878 0010      	pea 10 <main+0xa>
    294c:	2f03           	move.l d3,-(sp)
    294e:	486b 0334      	pea 820(a3)
    2952:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2958:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 17);
    295a:	4878 0011      	pea 11 <main+0xb>
    295e:	2f03           	move.l d3,-(sp)
    2960:	2f2f 0050      	move.l 80(sp),-(sp)
    2964:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    296a:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 18);
    296c:	4fef 0020      	lea 32(sp),sp
    2970:	4878 0012      	pea 12 <main+0xc>
    2974:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2976:	41eb 0394      	lea 916(a3),a0
    297a:	2f48 0070      	move.l a0,112(sp)
  TestRow( valsupposed, valactual, mask, 18);
    297e:	2f08           	move.l a0,-(sp)
    2980:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2986:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 19);
    2988:	4878 0013      	pea 13 <main+0xd>
    298c:	2f02           	move.l d2,-(sp)
    298e:	486b 03c4      	pea 964(a3)
    2992:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2998:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 20);
    299a:	4fef 0020      	lea 32(sp),sp
    299e:	4878 0014      	pea 14 <main+0xe>
    29a2:	2f03           	move.l d3,-(sp)
    29a4:	486b 03f4      	pea 1012(a3)
    29a8:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    29ae:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 21);
    29b0:	4878 0015      	pea 15 <main+0xf>
    29b4:	2f03           	move.l d3,-(sp)
    29b6:	486b 0424      	pea 1060(a3)
    29ba:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    29c0:	4e92           	jsr (a2)
  for(int i=0;i<10;i++) {
    29c2:	2c0b           	move.l a3,d6
    29c4:	0686 0000 06c4 	addi.l #1732,d6
    29ca:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, mask, 21);
    29ce:	3a7c 0023      	movea.w #35,a5
    29d2:	2e0b           	move.l a3,d7
    29d4:	2c46           	movea.l d6,a6
    29d6:	4dee fd90      	lea -624(a6),a6
    29da:	47ed fff3      	lea -13(a5),a3
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    29de:	2f0b           	move.l a3,-(sp)
    29e0:	2f02           	move.l d2,-(sp)
    29e2:	2f0e           	move.l a6,-(sp)
    29e4:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    29ea:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    29ec:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    29f0:	528b           	addq.l #1,a3
    for(int i2=0;i2<13;i2++) {  
    29f2:	4fef 0010      	lea 16(sp),sp
    29f6:	bc8e           	cmp.l a6,d6
    29f8:	6722           	beq.s 2a1c <ZoomTest+0x10a8>
    29fa:	7400           	moveq #0,d2
    29fc:	3404           	move.w d4,d2
    29fe:	4644           	not.w d4
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    2a00:	2f0b           	move.l a3,-(sp)
    2a02:	2f02           	move.l d2,-(sp)
    2a04:	2f0e           	move.l a6,-(sp)
    2a06:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2a0c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2a0e:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2a12:	528b           	addq.l #1,a3
    for(int i2=0;i2<13;i2++) {  
    2a14:	4fef 0010      	lea 16(sp),sp
    2a18:	bc8e           	cmp.l a6,d6
    2a1a:	66de           	bne.s 29fa <ZoomTest+0x1086>
    TestRow( valsupposed, valactual, mask, i*21+22+13);
    2a1c:	7600           	moveq #0,d3
    2a1e:	3604           	move.w d4,d3
    2a20:	2f0d           	move.l a5,-(sp)
    2a22:	2f03           	move.l d3,-(sp)
    2a24:	2f0e           	move.l a6,-(sp)
    2a26:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2a2c:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    2a2e:	486d 0001      	pea 1(a5)
    2a32:	2f03           	move.l d3,-(sp)
    2a34:	486e 0030      	pea 48(a6)
    2a38:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2a3e:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    2a40:	4fef 0020      	lea 32(sp),sp
    2a44:	486d 0002      	pea 2(a5)
    2a48:	2f02           	move.l d2,-(sp)
    2a4a:	486e 0060      	pea 96(a6)
    2a4e:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2a54:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    2a56:	486d 0003      	pea 3(a5)
    2a5a:	2f02           	move.l d2,-(sp)
    2a5c:	486e 0090      	pea 144(a6)
    2a60:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2a66:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    2a68:	4fef 0020      	lea 32(sp),sp
    2a6c:	486d 0004      	pea 4(a5)
    2a70:	2f03           	move.l d3,-(sp)
    2a72:	486e 00c0      	pea 192(a6)
    2a76:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2a7c:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    2a7e:	486d 0005      	pea 5(a5)
    2a82:	2f03           	move.l d3,-(sp)
    2a84:	486e 00f0      	pea 240(a6)
    2a88:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2a8e:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    2a90:	4fef 0020      	lea 32(sp),sp
    2a94:	486d 0006      	pea 6(a5)
    2a98:	2f02           	move.l d2,-(sp)
    2a9a:	486e 0120      	pea 288(a6)
    2a9e:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2aa4:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    2aa6:	486d 0007      	pea 7(a5)
    2aaa:	2f02           	move.l d2,-(sp)
    2aac:	486e 0150      	pea 336(a6)
    2ab0:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2ab6:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    2ab8:	4fef 0020      	lea 32(sp),sp
    2abc:	486d 0008      	pea 8(a5)
    2ac0:	2f03           	move.l d3,-(sp)
    2ac2:	486e 0180      	pea 384(a6)
    2ac6:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2acc:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    2ace:	486d 0009      	pea 9(a5)
    2ad2:	2f03           	move.l d3,-(sp)
    2ad4:	486e 01b0      	pea 432(a6)
    2ad8:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2ade:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2ae0:	2c0e           	move.l a6,d6
    2ae2:	0686 0000 0450 	addi.l #1104,d6
    2ae8:	4bed 0015      	lea 21(a5),a5
  for(int i=0;i<10;i++) {
    2aec:	4fef 0020      	lea 32(sp),sp
    2af0:	bafc 00f5      	cmpa.w #245,a5
    2af4:	6600 fede      	bne.w 29d4 <ZoomTest+0x1060>
    2af8:	2647           	movea.l d7,a3
    2afa:	4deb 2f74      	lea 12148(a3),a6
    2afe:	7c02           	moveq #2,d6
    2b00:	4606           	not.b d6
    TestRow( valsupposed, valactual, mask, i2+253);
    2b02:	2f06           	move.l d6,-(sp)
    2b04:	2f02           	move.l d2,-(sp)
    2b06:	2f0e           	move.l a6,-(sp)
    2b08:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2b0e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2b10:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2b14:	5286           	addq.l #1,d6
  for(int i2=0;i2<13;i2++) {  
    2b16:	4fef 0010      	lea 16(sp),sp
    2b1a:	0c86 0000 010a 	cmpi.l #266,d6
    2b20:	6726           	beq.s 2b48 <ZoomTest+0x11d4>
    2b22:	7400           	moveq #0,d2
    2b24:	3404           	move.w d4,d2
    2b26:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, i2+253);
    2b28:	2f06           	move.l d6,-(sp)
    2b2a:	2f02           	move.l d2,-(sp)
    2b2c:	2f0e           	move.l a6,-(sp)
    2b2e:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2b34:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2b36:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2b3a:	5286           	addq.l #1,d6
  for(int i2=0;i2<13;i2++) {  
    2b3c:	4fef 0010      	lea 16(sp),sp
    2b40:	0c86 0000 010a 	cmpi.l #266,d6
    2b46:	66da           	bne.s 2b22 <ZoomTest+0x11ae>
    2b48:	0284 0000 ffff 	andi.l #65535,d4
  TestRow( valsupposed, valactual, mask, 266);
    2b4e:	2f06           	move.l d6,-(sp)
    2b50:	2f04           	move.l d4,-(sp)
    2b52:	2f2f 0034      	move.l 52(sp),-(sp)
    2b56:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2b5c:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 267);
    2b5e:	4878 010b      	pea 10b <main+0x105>
    2b62:	2f04           	move.l d4,-(sp)
  valactual += ZMLINESIZE/2;
    2b64:	41eb 3214      	lea 12820(a3),a0
    2b68:	2f48 0070      	move.l a0,112(sp)
  TestRow( valsupposed, valactual, mask, 267);
    2b6c:	2f08           	move.l a0,-(sp)
    2b6e:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2b74:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 268);
    2b76:	4fef 0020      	lea 32(sp),sp
    2b7a:	4878 010c      	pea 10c <main+0x106>
    2b7e:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2b80:	41eb 3244      	lea 12868(a3),a0
    2b84:	2f48 0068      	move.l a0,104(sp)
  TestRow( valsupposed, valactual, mask, 268);
    2b88:	2f08           	move.l a0,-(sp)
    2b8a:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2b90:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 269);
    2b92:	4878 010d      	pea 10d <main+0x107>
    2b96:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2b98:	41eb 3274      	lea 12916(a3),a0
    2b9c:	2f48 0050      	move.l a0,80(sp)
  TestRow( valsupposed, valactual, mask, 269);
    2ba0:	2f08           	move.l a0,-(sp)
    2ba2:	4879 0000 73d8 	pea 73d8 <destlinezoom5>
    2ba8:	4e92           	jsr (a2)
  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    2baa:	4fef 0020      	lea 32(sp),sp
    2bae:	4878 0001      	pea 1 <_start+0x1>
    2bb2:	4878 0005      	pea 5 <_start+0x5>
    2bb6:	2f0c           	move.l a4,-(sp)
    2bb8:	2f0b           	move.l a3,-(sp)
    2bba:	4eba e346      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2bbe:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    2bc4:	4eae ff1c      	jsr -228(a6)
    2bc8:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    2bcc:	2c6f 0030      	movea.l 48(sp),a6
  for(int i2=0;i2<7;i2++) {  
    2bd0:	7400           	moveq #0,d2
  mask = 0x0000;
    2bd2:	4243           	clr.w d3
    TestRow( valsupposed, valactual, mask, i2);
    2bd4:	2f02           	move.l d2,-(sp)
    2bd6:	3f03           	move.w d3,-(sp)
    2bd8:	4267           	clr.w -(sp)
    2bda:	2f0e           	move.l a6,-(sp)
    2bdc:	4879 0000 73ac 	pea 73ac <destlinezoom6>
    2be2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2be4:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2be8:	4643           	not.w d3
  for(int i2=0;i2<7;i2++) {  
    2bea:	5282           	addq.l #1,d2
    2bec:	4fef 0010      	lea 16(sp),sp
    2bf0:	7007           	moveq #7,d0
    2bf2:	b082           	cmp.l d2,d0
    2bf4:	66de           	bne.s 2bd4 <ZoomTest+0x1260>
    2bf6:	4dec 0154      	lea 340(a4),a6
    2bfa:	7407           	moveq #7,d2
    2bfc:	280b           	move.l a3,d4
    2bfe:	264e           	movea.l a6,a3
    2c00:	2c42           	movea.l d2,a6
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    2c02:	7400           	moveq #0,d2
    2c04:	3403           	move.w d3,d2
    2c06:	2f0e           	move.l a6,-(sp)
    2c08:	2f02           	move.l d2,-(sp)
    2c0a:	2f0b           	move.l a3,-(sp)
    2c0c:	4879 0000 73ac 	pea 73ac <destlinezoom6>
    2c12:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    2c14:	486e 0001      	pea 1(a6)
    2c18:	2f02           	move.l d2,-(sp)
    2c1a:	486b 0030      	pea 48(a3)
    2c1e:	4879 0000 73ac 	pea 73ac <destlinezoom6>
    2c24:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2c26:	4643           	not.w d3
    2c28:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2c2a:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<6;i++) {
    2c2e:	4fef 0020      	lea 32(sp),sp
    2c32:	7213           	moveq #19,d1
    2c34:	b28e           	cmp.l a6,d1
    2c36:	66ca           	bne.s 2c02 <ZoomTest+0x128e>
    2c38:	240e           	move.l a6,d2
    2c3a:	2c04           	move.l d4,d6
    2c3c:	2c45           	movea.l d5,a6
    2c3e:	4dee fdc0      	lea -576(a6),a6
  for(int i2=0;i2<7;i2++) {  
    2c42:	2802           	move.l d2,d4
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    2c44:	2f04           	move.l d4,-(sp)
    2c46:	3f03           	move.w d3,-(sp)
    2c48:	4267           	clr.w -(sp)
    2c4a:	2f0e           	move.l a6,-(sp)
    2c4c:	4879 0000 73ac 	pea 73ac <destlinezoom6>
    2c52:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2c54:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2c58:	4643           	not.w d3
    2c5a:	5284           	addq.l #1,d4
    for(int i2=0;i2<12;i2++) {  
    2c5c:	4fef 0010      	lea 16(sp),sp
    2c60:	ba8e           	cmp.l a6,d5
    2c62:	66e0           	bne.s 2c44 <ZoomTest+0x12d0>
    2c64:	367c 001f      	movea.w #31,a3
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    2c68:	7800           	moveq #0,d4
    2c6a:	3803           	move.w d3,d4
    2c6c:	2f0b           	move.l a3,-(sp)
    2c6e:	2f04           	move.l d4,-(sp)
    2c70:	2f0e           	move.l a6,-(sp)
    2c72:	4879 0000 73ac 	pea 73ac <destlinezoom6>
    2c78:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    2c7a:	486b 0001      	pea 1(a3)
    2c7e:	2f04           	move.l d4,-(sp)
    2c80:	486e 0030      	pea 48(a6)
    2c84:	4879 0000 73ac 	pea 73ac <destlinezoom6>
    2c8a:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    2c8c:	4643           	not.w d3
    2c8e:	47eb 0018      	lea 24(a3),a3
      valactual += ZMLINESIZE/2;
    2c92:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<6;i++) {
    2c96:	4fef 0020      	lea 32(sp),sp
    2c9a:	b6fc 00af      	cmpa.w #175,a3
    2c9e:	66c8           	bne.s 2c68 <ZoomTest+0x12f4>
    2ca0:	0685 0000 0480 	addi.l #1152,d5
    2ca6:	7018           	moveq #24,d0
    2ca8:	d480           	add.l d0,d2
  for(int i=0;i<10;i++) {
    2caa:	0c82 0000 0103 	cmpi.l #259,d2
    2cb0:	668a           	bne.s 2c3c <ZoomTest+0x12c8>
    2cb2:	2646           	movea.l d6,a3
    2cb4:	4dec 3094      	lea 12436(a4),a6
    2cb8:	283c 0000 0102 	move.l #258,d4
    TestRow( valsupposed, valactual, mask, 258+i2);
    2cbe:	2f04           	move.l d4,-(sp)
    2cc0:	3f03           	move.w d3,-(sp)
    2cc2:	4267           	clr.w -(sp)
    2cc4:	2f0e           	move.l a6,-(sp)
    2cc6:	4879 0000 73ac 	pea 73ac <destlinezoom6>
    2ccc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2cce:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2cd2:	4643           	not.w d3
    2cd4:	5284           	addq.l #1,d4
  for(int i2=0;i2<11;i2++) {  
    2cd6:	4fef 0010      	lea 16(sp),sp
    2cda:	0c84 0000 010d 	cmpi.l #269,d4
    2ce0:	66dc           	bne.s 2cbe <ZoomTest+0x134a>
  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    2ce2:	4878 0001      	pea 1 <_start+0x1>
    2ce6:	4878 0006      	pea 6 <main>
    2cea:	2f0b           	move.l a3,-(sp)
    2cec:	2f0c           	move.l a4,-(sp)
    2cee:	4eba e212      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2cf2:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    2cf8:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2cfc:	42a7           	clr.l -(sp)
    2cfe:	42a7           	clr.l -(sp)
    2d00:	2f2f 004c      	move.l 76(sp),-(sp)
    2d04:	4879 0000 7380 	pea 7380 <destlinezoom7>
    2d0a:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    2d0c:	41eb 0034      	lea 52(a3),a0
    2d10:	2f48 0068      	move.l a0,104(sp)
    2d14:	4fef 0020      	lea 32(sp),sp
    2d18:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    2d1c:	7eff           	moveq #-1,d7
    2d1e:	280b           	move.l a3,d4
    2d20:	2648           	movea.l a0,a3
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2d22:	7600           	moveq #0,d3
    2d24:	3607           	move.w d7,d3
    2d26:	2f0e           	move.l a6,-(sp)
    2d28:	2f03           	move.l d3,-(sp)
    2d2a:	2f0b           	move.l a3,-(sp)
    2d2c:	4879 0000 7380 	pea 7380 <destlinezoom7>
    2d32:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2d34:	486e 0001      	pea 1(a6)
    2d38:	2f03           	move.l d3,-(sp)
    2d3a:	486b 0030      	pea 48(a3)
    2d3e:	4879 0000 7380 	pea 7380 <destlinezoom7>
    2d44:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2d46:	4647           	not.w d7
    2d48:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2d4a:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<7;i++) {
    2d4e:	4fef 0020      	lea 32(sp),sp
    2d52:	700f           	moveq #15,d0
    2d54:	b08e           	cmp.l a6,d0
    2d56:	66ca           	bne.s 2d22 <ZoomTest+0x13ae>
    2d58:	2604           	move.l d4,d3
    2d5a:	0683 0000 04e4 	addi.l #1252,d3
    2d60:	2a0c           	move.l a4,d5
    2d62:	2c04           	move.l d4,d6
    2d64:	284e           	movea.l a6,a4
    2d66:	2c43           	movea.l d3,a6
    2d68:	4dee fdf0      	lea -528(a6),a6
  mask = mask ^ 0xffff;
    2d6c:	280c           	move.l a4,d4
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    2d6e:	2f04           	move.l d4,-(sp)
    2d70:	3f07           	move.w d7,-(sp)
    2d72:	4267           	clr.w -(sp)
    2d74:	2f0e           	move.l a6,-(sp)
    2d76:	4879 0000 7380 	pea 7380 <destlinezoom7>
    2d7c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2d7e:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2d82:	4647           	not.w d7
    2d84:	5284           	addq.l #1,d4
    for(int i2=0;i2<11;i2++) {  
    2d86:	4fef 0010      	lea 16(sp),sp
    2d8a:	b68e           	cmp.l a6,d3
    2d8c:	66e0           	bne.s 2d6e <ZoomTest+0x13fa>
    2d8e:	367c 001a      	movea.w #26,a3
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    2d92:	7800           	moveq #0,d4
    2d94:	3807           	move.w d7,d4
    2d96:	2f0b           	move.l a3,-(sp)
    2d98:	2f04           	move.l d4,-(sp)
    2d9a:	2f0e           	move.l a6,-(sp)
    2d9c:	4879 0000 7380 	pea 7380 <destlinezoom7>
    2da2:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    2da4:	2f0b           	move.l a3,-(sp)
    2da6:	2f04           	move.l d4,-(sp)
    2da8:	486e 0030      	pea 48(a6)
    2dac:	4879 0000 7380 	pea 7380 <destlinezoom7>
    2db2:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    2db4:	4647           	not.w d7
    2db6:	47eb 0019      	lea 25(a3),a3
      valactual += ZMLINESIZE/2;
    2dba:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<7;i++) {
    2dbe:	4fef 0020      	lea 32(sp),sp
    2dc2:	b6fc 00c9      	cmpa.w #201,a3
    2dc6:	66ca           	bne.s 2d92 <ZoomTest+0x141e>
    2dc8:	0683 0000 04b0 	addi.l #1200,d3
    2dce:	49ec 0019      	lea 25(a4),a4
  for(int i=0;i<10;i++) {
    2dd2:	b8fc 0109      	cmpa.w #265,a4
    2dd6:	668e           	bne.s 2d66 <ZoomTest+0x13f2>
    2dd8:	2845           	movea.l d5,a4
    2dda:	2646           	movea.l d6,a3
    2ddc:	4deb 31b4      	lea 12724(a3),a6
    2de0:	263c 0000 0100 	move.l #256,d3
    TestRow( valsupposed, valactual, mask, 256+i2);
    2de6:	2f03           	move.l d3,-(sp)
    2de8:	3f07           	move.w d7,-(sp)
    2dea:	4267           	clr.w -(sp)
    2dec:	2f0e           	move.l a6,-(sp)
    2dee:	4879 0000 7380 	pea 7380 <destlinezoom7>
    2df4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2df6:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2dfa:	4647           	not.w d7
    2dfc:	5283           	addq.l #1,d3
  for(int i2=0;i2<5;i2++) {  
    2dfe:	4fef 0010      	lea 16(sp),sp
    2e02:	0c83 0000 0105 	cmpi.l #261,d3
    2e08:	66dc           	bne.s 2de6 <ZoomTest+0x1472>
  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    2e0a:	4878 0001      	pea 1 <_start+0x1>
    2e0e:	4878 0007      	pea 7 <main+0x1>
    2e12:	2f0c           	move.l a4,-(sp)
    2e14:	2f0b           	move.l a3,-(sp)
    2e16:	4eba e0ea      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2e1a:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    2e20:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2e24:	42a7           	clr.l -(sp)
    2e26:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2e2c:	2f2f 0048      	move.l 72(sp),-(sp)
    2e30:	4879 0000 7354 	pea 7354 <destlinezoom8>
    2e36:	4e92           	jsr (a2)
    2e38:	4fef 0020      	lea 32(sp),sp
    2e3c:	2f6f 003c 002c 	move.l 60(sp),44(sp)
  valactual += ZMLINESIZE/2;
    2e42:	2a2f 0040      	move.l 64(sp),d5
  TestRow( valsupposed, valactual, mask, 0);
    2e46:	7601           	moveq #1,d3
  mask = mask ^ 0xffff;
    2e48:	4244           	clr.w d4
    2e4a:	2c43           	movea.l d3,a6
    2e4c:	2c2f 002c      	move.l 44(sp),d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2e50:	7600           	moveq #0,d3
    2e52:	3604           	move.w d4,d3
    2e54:	2f0e           	move.l a6,-(sp)
    2e56:	2f03           	move.l d3,-(sp)
    2e58:	2f05           	move.l d5,-(sp)
    2e5a:	4879 0000 7354 	pea 7354 <destlinezoom8>
    2e60:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2e62:	486e 0001      	pea 1(a6)
    2e66:	2f03           	move.l d3,-(sp)
    2e68:	2045           	movea.l d5,a0
    2e6a:	4868 0030      	pea 48(a0)
    2e6e:	4879 0000 7354 	pea 7354 <destlinezoom8>
    2e74:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2e76:	4644           	not.w d4
    2e78:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    2e7a:	4fef 0020      	lea 32(sp),sp
    2e7e:	700b           	moveq #11,d0
    2e80:	b08e           	cmp.l a6,d0
    2e82:	6740           	beq.s 2ec4 <ZoomTest+0x1550>
    2e84:	2005           	move.l d5,d0
    2e86:	0680 0000 00c0 	addi.l #192,d0
    2e8c:	2a06           	move.l d6,d5
    2e8e:	2c00           	move.l d0,d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2e90:	7600           	moveq #0,d3
    2e92:	3604           	move.w d4,d3
    2e94:	2f0e           	move.l a6,-(sp)
    2e96:	2f03           	move.l d3,-(sp)
    2e98:	2f05           	move.l d5,-(sp)
    2e9a:	4879 0000 7354 	pea 7354 <destlinezoom8>
    2ea0:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2ea2:	486e 0001      	pea 1(a6)
    2ea6:	2f03           	move.l d3,-(sp)
    2ea8:	2045           	movea.l d5,a0
    2eaa:	4868 0030      	pea 48(a0)
    2eae:	4879 0000 7354 	pea 7354 <destlinezoom8>
    2eb4:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2eb6:	4644           	not.w d4
    2eb8:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    2eba:	4fef 0020      	lea 32(sp),sp
    2ebe:	700b           	moveq #11,d0
    2ec0:	b08e           	cmp.l a6,d0
    2ec2:	66c0           	bne.s 2e84 <ZoomTest+0x1510>
    2ec4:	260e           	move.l a6,d3
    2ec6:	2f46 002c      	move.l d6,44(sp)
    2eca:	0686 0000 01e0 	addi.l #480,d6
    2ed0:	7e15           	moveq #21,d7
    2ed2:	2f4c 006c      	move.l a4,108(sp)
    2ed6:	2f4b 0070      	move.l a3,112(sp)
    2eda:	2647           	movea.l d7,a3
    2edc:	2c46           	movea.l d6,a6
    2ede:	4dee fe20      	lea -480(a6),a6
    2ee2:	49eb fff6      	lea -10(a3),a4
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    2ee6:	2f0c           	move.l a4,-(sp)
    2ee8:	3f04           	move.w d4,-(sp)
    2eea:	4267           	clr.w -(sp)
    2eec:	2f0e           	move.l a6,-(sp)
    2eee:	4879 0000 7354 	pea 7354 <destlinezoom8>
    2ef4:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2ef6:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2efa:	4644           	not.w d4
    2efc:	528c           	addq.l #1,a4
    for(int i2=0;i2<10;i2++) {  
    2efe:	4fef 0010      	lea 16(sp),sp
    2f02:	bc8e           	cmp.l a6,d6
    2f04:	66e0           	bne.s 2ee6 <ZoomTest+0x1572>
    2f06:	2a0b           	move.l a3,d5
    2f08:	2e0e           	move.l a6,d7
    2f0a:	0687 0000 0300 	addi.l #768,d7
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    2f10:	7200           	moveq #0,d1
    2f12:	3204           	move.w d4,d1
    2f14:	2841           	movea.l d1,a4
    2f16:	2f05           	move.l d5,-(sp)
    2f18:	2f0c           	move.l a4,-(sp)
    2f1a:	2f0e           	move.l a6,-(sp)
    2f1c:	4879 0000 7354 	pea 7354 <destlinezoom8>
    2f22:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    2f24:	2f05           	move.l d5,-(sp)
    2f26:	2f0c           	move.l a4,-(sp)
    2f28:	486e 0030      	pea 48(a6)
    2f2c:	4879 0000 7354 	pea 7354 <destlinezoom8>
    2f32:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2f34:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    2f38:	4644           	not.w d4
    2f3a:	5285           	addq.l #1,d5
    for(int i2=0;i2<8;i2++) {
    2f3c:	4fef 0020      	lea 32(sp),sp
    2f40:	be8e           	cmp.l a6,d7
    2f42:	66cc           	bne.s 2f10 <ZoomTest+0x159c>
    2f44:	0686 0000 04e0 	addi.l #1248,d6
    2f4a:	47eb 001a      	lea 26(a3),a3
  for(int i=0;i<9;i++) {
    2f4e:	b6fc 00ff      	cmpa.w #255,a3
    2f52:	6688           	bne.s 2edc <ZoomTest+0x1568>
    2f54:	286f 006c      	movea.l 108(sp),a4
    2f58:	266f 0070      	movea.l 112(sp),a3
    2f5c:	2c2f 002c      	move.l 44(sp),d6
    2f60:	0686 0000 2be0 	addi.l #11232,d6
    2f66:	2a0d           	move.l a5,d5
    2f68:	2c46           	movea.l d6,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    2f6a:	2f05           	move.l d5,-(sp)
    2f6c:	3f04           	move.w d4,-(sp)
    2f6e:	4267           	clr.w -(sp)
    2f70:	2f0e           	move.l a6,-(sp)
    2f72:	4879 0000 7354 	pea 7354 <destlinezoom8>
    2f78:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2f7a:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2f7e:	4644           	not.w d4
    2f80:	5285           	addq.l #1,d5
  for(int i2=0;i2<10;i2++) {  
    2f82:	4fef 0010      	lea 16(sp),sp
    2f86:	0c85 0000 00ff 	cmpi.l #255,d5
    2f8c:	66dc           	bne.s 2f6a <ZoomTest+0x15f6>
    2f8e:	2c2f 002c      	move.l 44(sp),d6
    2f92:	0686 0000 2dc0 	addi.l #11712,d6
    2f98:	2c45           	movea.l d5,a6
    2f9a:	2e0b           	move.l a3,d7
    2f9c:	2646           	movea.l d6,a3
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    2f9e:	7c00           	moveq #0,d6
    2fa0:	3c04           	move.w d4,d6
    2fa2:	2f0e           	move.l a6,-(sp)
    2fa4:	2f06           	move.l d6,-(sp)
    2fa6:	2f0b           	move.l a3,-(sp)
    2fa8:	4879 0000 7354 	pea 7354 <destlinezoom8>
    2fae:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    2fb0:	486e 0001      	pea 1(a6)
    2fb4:	2f06           	move.l d6,-(sp)
    2fb6:	486b 0030      	pea 48(a3)
    2fba:	4879 0000 7354 	pea 7354 <destlinezoom8>
    2fc0:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2fc2:	4644           	not.w d4
    2fc4:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2fc6:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<7;i++) {
    2fca:	4fef 0020      	lea 32(sp),sp
    2fce:	bcfc 010d      	cmpa.w #269,a6
    2fd2:	66ca           	bne.s 2f9e <ZoomTest+0x162a>
    2fd4:	2647           	movea.l d7,a3
  TestRow( valsupposed, valactual, mask, 269);
    2fd6:	2f0e           	move.l a6,-(sp)
    2fd8:	3f04           	move.w d4,-(sp)
    2fda:	4267           	clr.w -(sp)
    2fdc:	206f 0034      	movea.l 52(sp),a0
    2fe0:	4868 3060      	pea 12384(a0)
    2fe4:	4879 0000 7354 	pea 7354 <destlinezoom8>
    2fea:	4e92           	jsr (a2)
  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    2fec:	4878 0001      	pea 1 <_start+0x1>
    2ff0:	4878 0008      	pea 8 <main+0x2>
    2ff4:	2f0b           	move.l a3,-(sp)
    2ff6:	2f0c           	move.l a4,-(sp)
    2ff8:	4eba df08      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2ffc:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    3002:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3006:	4fef 001c      	lea 28(sp),sp
    300a:	4297           	clr.l (sp)
    300c:	42a7           	clr.l -(sp)
    300e:	2f2f 003c      	move.l 60(sp),-(sp)
    3012:	4879 0000 7328 	pea 7328 <destlinezoom9>
    3018:	4e92           	jsr (a2)
    301a:	4fef 0010      	lea 16(sp),sp
    301e:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    3022:	7cff           	moveq #-1,d6
    3024:	2e0b           	move.l a3,d7
    3026:	266f 0048      	movea.l 72(sp),a3
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    302a:	7800           	moveq #0,d4
    302c:	3806           	move.w d6,d4
    302e:	2f0e           	move.l a6,-(sp)
    3030:	2f04           	move.l d4,-(sp)
    3032:	2f0b           	move.l a3,-(sp)
    3034:	4879 0000 7328 	pea 7328 <destlinezoom9>
    303a:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    303c:	486e 0001      	pea 1(a6)
    3040:	2f04           	move.l d4,-(sp)
    3042:	486b 0030      	pea 48(a3)
    3046:	4879 0000 7328 	pea 7328 <destlinezoom9>
    304c:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    304e:	4646           	not.w d6
    3050:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3052:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<3;i++) {
    3056:	4fef 0020      	lea 32(sp),sp
    305a:	7007           	moveq #7,d0
    305c:	b08e           	cmp.l a6,d0
    305e:	66ca           	bne.s 302a <ZoomTest+0x16b6>
    3060:	282f 004c      	move.l 76(sp),d4
    3064:	307c 0014      	movea.w #20,a0
    3068:	2f4c 002c      	move.l a4,44(sp)
    306c:	2f47 0048      	move.l d7,72(sp)
    3070:	2f42 004c      	move.l d2,76(sp)
    3074:	2648           	movea.l a0,a3
    3076:	2c44           	movea.l d4,a6
    3078:	4dee fe50      	lea -432(a6),a6
    307c:	49eb fff7      	lea -9(a3),a4
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    3080:	2f0c           	move.l a4,-(sp)
    3082:	3f06           	move.w d6,-(sp)
    3084:	4267           	clr.w -(sp)
    3086:	2f0e           	move.l a6,-(sp)
    3088:	4879 0000 7328 	pea 7328 <destlinezoom9>
    308e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3090:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3094:	4646           	not.w d6
    3096:	528c           	addq.l #1,a4
    for(int i2=0;i2<9;i2++) {  
    3098:	4fef 0010      	lea 16(sp),sp
    309c:	b88e           	cmp.l a6,d4
    309e:	66e0           	bne.s 3080 <ZoomTest+0x170c>
    30a0:	2e0b           	move.l a3,d7
    30a2:	49eb 0009      	lea 9(a3),a4
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    30a6:	7400           	moveq #0,d2
    30a8:	3406           	move.w d6,d2
    30aa:	2f07           	move.l d7,-(sp)
    30ac:	2f02           	move.l d2,-(sp)
    30ae:	2f0e           	move.l a6,-(sp)
    30b0:	4879 0000 7328 	pea 7328 <destlinezoom9>
    30b6:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    30b8:	5287           	addq.l #1,d7
    30ba:	2f07           	move.l d7,-(sp)
    30bc:	2f02           	move.l d2,-(sp)
    30be:	486e 0030      	pea 48(a6)
    30c2:	4879 0000 7328 	pea 7328 <destlinezoom9>
    30c8:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    30ca:	4646           	not.w d6
      valactual += ZMLINESIZE/2;
    30cc:	4dee 0060      	lea 96(a6),a6
    for(int i2=0;i2<9;i2++) {
    30d0:	4fef 0020      	lea 32(sp),sp
    30d4:	be8c           	cmp.l a4,d7
    30d6:	66ce           	bne.s 30a6 <ZoomTest+0x1732>
    30d8:	0684 0000 0510 	addi.l #1296,d4
    30de:	47eb 001b      	lea 27(a3),a3
  for(int i=0;i<9;i++) {
    30e2:	b6fc 0107      	cmpa.w #263,a3
    30e6:	668e           	bne.s 3076 <ZoomTest+0x1702>
    30e8:	286f 002c      	movea.l 44(sp),a4
    30ec:	266f 0048      	movea.l 72(sp),a3
    30f0:	242f 004c      	move.l 76(sp),d2
    30f4:	41eb 2ee4      	lea 12004(a3),a0
    30f8:	2f48 002c      	move.l a0,44(sp)
    30fc:	2c48           	movea.l a0,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    30fe:	2f0d           	move.l a5,-(sp)
    3100:	3f06           	move.w d6,-(sp)
    3102:	4267           	clr.w -(sp)
    3104:	2f0e           	move.l a6,-(sp)
    3106:	4879 0000 7328 	pea 7328 <destlinezoom9>
    310c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    310e:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    3112:	4646           	not.w d6
    3114:	528d           	addq.l #1,a5
  for(int i2=0;i2<9;i2++) {  
    3116:	4fef 0010      	lea 16(sp),sp
    311a:	bafc 00fe      	cmpa.w #254,a5
    311e:	66de           	bne.s 30fe <ZoomTest+0x178a>
    3120:	4beb 3094      	lea 12436(a3),a5
    3124:	2c42           	movea.l d2,a6
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    3126:	7400           	moveq #0,d2
    3128:	3406           	move.w d6,d2
    312a:	2f0e           	move.l a6,-(sp)
    312c:	2f02           	move.l d2,-(sp)
    312e:	2f0d           	move.l a5,-(sp)
    3130:	4879 0000 7328 	pea 7328 <destlinezoom9>
    3136:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    3138:	486e 0001      	pea 1(a6)
    313c:	2f02           	move.l d2,-(sp)
    313e:	486d 0030      	pea 48(a5)
    3142:	4879 0000 7328 	pea 7328 <destlinezoom9>
    3148:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    314a:	4646           	not.w d6
    314c:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    314e:	4bed 0060      	lea 96(a5),a5
  for(int i=0;i<5;i++) {
    3152:	4fef 0020      	lea 32(sp),sp
    3156:	bcfc 010d      	cmpa.w #269,a6
    315a:	66ca           	bne.s 3126 <ZoomTest+0x17b2>
  TestRow( valsupposed, valactual, mask, 269);
    315c:	2f0e           	move.l a6,-(sp)
    315e:	3f06           	move.w d6,-(sp)
    3160:	4267           	clr.w -(sp)
    3162:	2f2f 0040      	move.l 64(sp),-(sp)
    3166:	4879 0000 7328 	pea 7328 <destlinezoom9>
    316c:	4e92           	jsr (a2)
  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    316e:	4878 0001      	pea 1 <_start+0x1>
    3172:	4878 0009      	pea 9 <main+0x3>
    3176:	2f0c           	move.l a4,-(sp)
    3178:	2f0b           	move.l a3,-(sp)
    317a:	4eba dd86      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    317e:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    3184:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3188:	4fef 001c      	lea 28(sp),sp
    318c:	4297           	clr.l (sp)
    318e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3194:	2f2f 0038      	move.l 56(sp),-(sp)
    3198:	4879 0000 72fc 	pea 72fc <destlinezoom10>
    319e:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 1);   
    31a0:	4878 0001      	pea 1 <_start+0x1>
    31a4:	42a7           	clr.l -(sp)
    31a6:	2f2f 0058      	move.l 88(sp),-(sp)
    31aa:	4879 0000 72fc 	pea 72fc <destlinezoom10>
    31b0:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 2);
    31b2:	4fef 0020      	lea 32(sp),sp
    31b6:	4878 0002      	pea 2 <_start+0x2>
    31ba:	42a7           	clr.l -(sp)
    31bc:	2f2f 0058      	move.l 88(sp),-(sp)
    31c0:	4879 0000 72fc 	pea 72fc <destlinezoom10>
    31c6:	4e92           	jsr (a2)
  for(int i=0;i<9;i++) {
    31c8:	242f 006c      	move.l 108(sp),d2
    31cc:	4fef 0010      	lea 16(sp),sp
  mask = mask ^ 0xffff;
    31d0:	7eff           	moveq #-1,d7
    31d2:	2c43           	movea.l d3,a6
    31d4:	2a42           	movea.l d2,a5
    31d6:	4bed fe80      	lea -384(a5),a5
    31da:	260e           	move.l a6,d3
    31dc:	5183           	subq.l #8,d3
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    31de:	2f03           	move.l d3,-(sp)
    31e0:	3f07           	move.w d7,-(sp)
    31e2:	4267           	clr.w -(sp)
    31e4:	2f0d           	move.l a5,-(sp)
    31e6:	4879 0000 72fc 	pea 72fc <destlinezoom10>
    31ec:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    31ee:	4bed 0030      	lea 48(a5),a5
      mask = mask ^ 0xffff;
    31f2:	4647           	not.w d7
    31f4:	5283           	addq.l #1,d3
    for(int i2=0;i2<8;i2++) {  
    31f6:	4fef 0010      	lea 16(sp),sp
    31fa:	b48d           	cmp.l a5,d2
    31fc:	66e0           	bne.s 31de <ZoomTest+0x186a>
    31fe:	260e           	move.l a6,d3
    3200:	2c0d           	move.l a5,d6
    3202:	0686 0000 03c0 	addi.l #960,d6
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    3208:	7800           	moveq #0,d4
    320a:	3807           	move.w d7,d4
    320c:	2f03           	move.l d3,-(sp)
    320e:	2f04           	move.l d4,-(sp)
    3210:	2f0d           	move.l a5,-(sp)
    3212:	4879 0000 72fc 	pea 72fc <destlinezoom10>
    3218:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    321a:	2f03           	move.l d3,-(sp)
    321c:	2f04           	move.l d4,-(sp)
    321e:	486d 0030      	pea 48(a5)
    3222:	4879 0000 72fc 	pea 72fc <destlinezoom10>
    3228:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    322a:	4bed 0060      	lea 96(a5),a5
      mask = mask ^ 0xffff;
    322e:	4647           	not.w d7
    3230:	5283           	addq.l #1,d3
    for(int i2=0;i2<10;i2++) {
    3232:	4fef 0020      	lea 32(sp),sp
    3236:	bc8d           	cmp.l a5,d6
    3238:	66ce           	bne.s 3208 <ZoomTest+0x1894>
    323a:	0682 0000 0540 	addi.l #1344,d2
    3240:	4dee 001c      	lea 28(a6),a6
  for(int i=0;i<9;i++) {
    3244:	bcfc 0107      	cmpa.w #263,a6
    3248:	668a           	bne.s 31d4 <ZoomTest+0x1860>
    324a:	2a6f 0064      	movea.l 100(sp),a5
    TestRow( valsupposed, valactual, mask, 255+i2);
    324e:	2f05           	move.l d5,-(sp)
    3250:	3f07           	move.w d7,-(sp)
    3252:	4267           	clr.w -(sp)
    3254:	2f0d           	move.l a5,-(sp)
    3256:	4879 0000 72fc 	pea 72fc <destlinezoom10>
    325c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    325e:	4bed 0030      	lea 48(a5),a5
    mask = mask ^ 0xffff;
    3262:	4647           	not.w d7
    3264:	5285           	addq.l #1,d5
  for(int i2=0;i2<8;i2++) {  
    3266:	4fef 0010      	lea 16(sp),sp
    326a:	0c85 0000 0107 	cmpi.l #263,d5
    3270:	66dc           	bne.s 324e <ZoomTest+0x18da>
    3272:	4dec 3154      	lea 12628(a4),a6
    3276:	3a7c 0108      	movea.w #264,a5
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    327a:	7400           	moveq #0,d2
    327c:	3407           	move.w d7,d2
    327e:	486d ffff      	pea -1(a5)
    3282:	2f02           	move.l d2,-(sp)
    3284:	2f0e           	move.l a6,-(sp)
    3286:	4879 0000 72fc 	pea 72fc <destlinezoom10>
    328c:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    328e:	2f0d           	move.l a5,-(sp)
    3290:	2f02           	move.l d2,-(sp)
    3292:	486e 0030      	pea 48(a6)
    3296:	4879 0000 72fc 	pea 72fc <destlinezoom10>
    329c:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    329e:	4647           	not.w d7
    32a0:	548d           	addq.l #2,a5
    valactual += ZMLINESIZE/2;
    32a2:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<3;i++) {
    32a6:	4fef 0020      	lea 32(sp),sp
    32aa:	bafc 010e      	cmpa.w #270,a5
    32ae:	66ca           	bne.s 327a <ZoomTest+0x1906>
  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    32b0:	4878 0001      	pea 1 <_start+0x1>
    32b4:	4878 000a      	pea a <main+0x4>
    32b8:	2f0b           	move.l a3,-(sp)
    32ba:	2f0c           	move.l a4,-(sp)
    32bc:	4eba dc44      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    32c0:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    32c6:	4eae ff1c      	jsr -228(a6)
    32ca:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    32ce:	2a6f 0034      	movea.l 52(sp),a5
  for(int i2=0;i2<6;i2++) {  
    32d2:	7600           	moveq #0,d3
  mask = 0xffff;
    32d4:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, i2);
    32d6:	2f03           	move.l d3,-(sp)
    32d8:	3f02           	move.w d2,-(sp)
    32da:	4267           	clr.w -(sp)
    32dc:	2f0d           	move.l a5,-(sp)
    32de:	4879 0000 72d0 	pea 72d0 <destlinezoom11>
    32e4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    32e6:	4bed 0030      	lea 48(a5),a5
    mask = mask ^ 0xffff;
    32ea:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) {  
    32ec:	5283           	addq.l #1,d3
    32ee:	4fef 0010      	lea 16(sp),sp
    32f2:	7006           	moveq #6,d0
    32f4:	b083           	cmp.l d3,d0
    32f6:	66de           	bne.s 32d6 <ZoomTest+0x1962>
    32f8:	2c6f 0054      	movea.l 84(sp),a6
    32fc:	3a7c 0006      	movea.w #6,a5
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    3300:	7600           	moveq #0,d3
    3302:	3602           	move.w d2,d3
    3304:	2f0d           	move.l a5,-(sp)
    3306:	2f03           	move.l d3,-(sp)
    3308:	2f0e           	move.l a6,-(sp)
    330a:	4879 0000 72d0 	pea 72d0 <destlinezoom11>
    3310:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    3312:	486d 0001      	pea 1(a5)
    3316:	2f03           	move.l d3,-(sp)
    3318:	486e 0030      	pea 48(a6)
    331c:	4879 0000 72d0 	pea 72d0 <destlinezoom11>
    3322:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3324:	4642           	not.w d2
    3326:	548d           	addq.l #2,a5
    valactual += ZMLINESIZE/2;
    3328:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<11;i2++) {
    332c:	4fef 0020      	lea 32(sp),sp
    3330:	721c           	moveq #28,d1
    3332:	b28d           	cmp.l a5,d1
    3334:	66ca           	bne.s 3300 <ZoomTest+0x198c>
    3336:	260b           	move.l a3,d3
    3338:	0683 0000 0694 	addi.l #1684,d3
    333e:	3a7c 0023      	movea.w #35,a5
    3342:	2c0b           	move.l a3,d6
    3344:	2c43           	movea.l d3,a6
    3346:	4dee feb0      	lea -336(a6),a6
    334a:	280d           	move.l a5,d4
    334c:	5f84           	subq.l #7,d4
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    334e:	2f04           	move.l d4,-(sp)
    3350:	3f02           	move.w d2,-(sp)
    3352:	4267           	clr.w -(sp)
    3354:	2f0e           	move.l a6,-(sp)
    3356:	4879 0000 72d0 	pea 72d0 <destlinezoom11>
    335c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    335e:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3362:	4642           	not.w d2
    3364:	5284           	addq.l #1,d4
    for(int i2=0;i2<7;i2++) {  
    3366:	4fef 0010      	lea 16(sp),sp
    336a:	b68e           	cmp.l a6,d3
    336c:	66e0           	bne.s 334e <ZoomTest+0x19da>
    336e:	264d           	movea.l a5,a3
    3370:	2a0e           	move.l a6,d5
    3372:	0685 0000 0420 	addi.l #1056,d5
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    3378:	7800           	moveq #0,d4
    337a:	3802           	move.w d2,d4
    337c:	2f0b           	move.l a3,-(sp)
    337e:	2f04           	move.l d4,-(sp)
    3380:	2f0e           	move.l a6,-(sp)
    3382:	4879 0000 72d0 	pea 72d0 <destlinezoom11>
    3388:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    338a:	486b ffe8      	pea -24(a3)
    338e:	2f04           	move.l d4,-(sp)
    3390:	486e 0030      	pea 48(a6)
    3394:	4879 0000 72d0 	pea 72d0 <destlinezoom11>
    339a:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    339c:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    33a0:	4642           	not.w d2
    33a2:	548b           	addq.l #2,a3
    for(int i2=0;i2<11;i2++) {
    33a4:	4fef 0020      	lea 32(sp),sp
    33a8:	ba8e           	cmp.l a6,d5
    33aa:	66cc           	bne.s 3378 <ZoomTest+0x1a04>
    33ac:	0683 0000 0570 	addi.l #1392,d3
    33b2:	4bed 001d      	lea 29(a5),a5
  for(int i=0;i<8;i++) {
    33b6:	bafc 010b      	cmpa.w #267,a5
    33ba:	6688           	bne.s 3344 <ZoomTest+0x19d0>
    33bc:	2646           	movea.l d6,a3
    33be:	4beb 30c4      	lea 12484(a3),a5
    33c2:	283c 0000 0104 	move.l #260,d4
    TestRow( valsupposed, valactual, mask, 260+i2);
    33c8:	7600           	moveq #0,d3
    33ca:	3602           	move.w d2,d3
    33cc:	2f04           	move.l d4,-(sp)
    33ce:	2f03           	move.l d3,-(sp)
    33d0:	2f0d           	move.l a5,-(sp)
    33d2:	4879 0000 72d0 	pea 72d0 <destlinezoom11>
    33d8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    33da:	4bed 0030      	lea 48(a5),a5
    mask = mask ^ 0xffff;
    33de:	4642           	not.w d2
    33e0:	5284           	addq.l #1,d4
  for(int i2=0;i2<7;i2++) {  
    33e2:	4fef 0010      	lea 16(sp),sp
    33e6:	0c84 0000 010b 	cmpi.l #267,d4
    33ec:	66da           	bne.s 33c8 <ZoomTest+0x1a54>
    33ee:	0282 0000 ffff 	andi.l #65535,d2
  TestRow( valsupposed, valactual, mask, 267);   
    33f4:	2f04           	move.l d4,-(sp)
    33f6:	2f02           	move.l d2,-(sp)
    33f8:	2f2f 0060      	move.l 96(sp),-(sp)
    33fc:	4879 0000 72d0 	pea 72d0 <destlinezoom11>
    3402:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 268);
    3404:	4878 010c      	pea 10c <main+0x106>
    3408:	2f02           	move.l d2,-(sp)
    340a:	2f2f 0078      	move.l 120(sp),-(sp)
    340e:	4879 0000 72d0 	pea 72d0 <destlinezoom11>
    3414:	4e92           	jsr (a2)
  TestRow( valsupposed, valactual, mask, 269);
    3416:	4fef 0020      	lea 32(sp),sp
    341a:	4878 010d      	pea 10d <main+0x107>
    341e:	2f03           	move.l d3,-(sp)
    3420:	2f2f 0040      	move.l 64(sp),-(sp)
    3424:	4879 0000 72d0 	pea 72d0 <destlinezoom11>
    342a:	4e92           	jsr (a2)
  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    342c:	4878 0001      	pea 1 <_start+0x1>
    3430:	4878 000b      	pea b <main+0x5>
    3434:	2f0c           	move.l a4,-(sp)
    3436:	2f0b           	move.l a3,-(sp)
    3438:	4eba dac8      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    343c:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    3442:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3446:	4fef 001c      	lea 28(sp),sp
    344a:	4297           	clr.l (sp)
    344c:	42a7           	clr.l -(sp)
    344e:	2f2f 0038      	move.l 56(sp),-(sp)
    3452:	4879 0000 72a4 	pea 72a4 <destlinezoom12>
    3458:	4e92           	jsr (a2)
    345a:	4fef 0010      	lea 16(sp),sp
    345e:	262f 003c      	move.l 60(sp),d3
  valactual += ZMLINESIZE/2;
    3462:	2c6f 0040      	movea.l 64(sp),a6
  TestRow( valsupposed, valactual, mask, 0);
    3466:	3a7c 0001      	movea.w #1,a5
  mask = mask ^ 0xffff;
    346a:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    346c:	7800           	moveq #0,d4
    346e:	3802           	move.w d2,d4
    3470:	2f0d           	move.l a5,-(sp)
    3472:	2f04           	move.l d4,-(sp)
    3474:	2f0e           	move.l a6,-(sp)
    3476:	4879 0000 72a4 	pea 72a4 <destlinezoom12>
    347c:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    347e:	486d 0001      	pea 1(a5)
    3482:	2f04           	move.l d4,-(sp)
    3484:	486e 0030      	pea 48(a6)
    3488:	4879 0000 72a4 	pea 72a4 <destlinezoom12>
    348e:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3490:	4642           	not.w d2
    3492:	548d           	addq.l #2,a5
  for(int i2=0;i2<12;i2++) {
    3494:	4fef 0020      	lea 32(sp),sp
    3498:	7019           	moveq #25,d0
    349a:	b08d           	cmp.l a5,d0
    349c:	673e           	beq.s 34dc <ZoomTest+0x1b68>
    349e:	200e           	move.l a6,d0
    34a0:	0680 0000 00c0 	addi.l #192,d0
    34a6:	2c43           	movea.l d3,a6
    34a8:	2600           	move.l d0,d3
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    34aa:	7800           	moveq #0,d4
    34ac:	3802           	move.w d2,d4
    34ae:	2f0d           	move.l a5,-(sp)
    34b0:	2f04           	move.l d4,-(sp)
    34b2:	2f0e           	move.l a6,-(sp)
    34b4:	4879 0000 72a4 	pea 72a4 <destlinezoom12>
    34ba:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    34bc:	486d 0001      	pea 1(a5)
    34c0:	2f04           	move.l d4,-(sp)
    34c2:	486e 0030      	pea 48(a6)
    34c6:	4879 0000 72a4 	pea 72a4 <destlinezoom12>
    34cc:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    34ce:	4642           	not.w d2
    34d0:	548d           	addq.l #2,a5
  for(int i2=0;i2<12;i2++) {
    34d2:	4fef 0020      	lea 32(sp),sp
    34d6:	7019           	moveq #25,d0
    34d8:	b08d           	cmp.l a5,d0
    34da:	66c2           	bne.s 349e <ZoomTest+0x1b2a>
    34dc:	2803           	move.l d3,d4
    34de:	0684 0000 0120 	addi.l #288,d4
    34e4:	3a7c 001f      	movea.w #31,a5
    34e8:	2c0b           	move.l a3,d6
    34ea:	2c44           	movea.l d4,a6
    34ec:	4dee fee0      	lea -288(a6),a6
    34f0:	2a0d           	move.l a5,d5
    34f2:	5d85           	subq.l #6,d5
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    34f4:	2f05           	move.l d5,-(sp)
    34f6:	3f02           	move.w d2,-(sp)
    34f8:	4267           	clr.w -(sp)
    34fa:	2f0e           	move.l a6,-(sp)
    34fc:	4879 0000 72a4 	pea 72a4 <destlinezoom12>
    3502:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3504:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3508:	4642           	not.w d2
    350a:	5285           	addq.l #1,d5
    for(int i2=0;i2<6;i2++) {  
    350c:	4fef 0010      	lea 16(sp),sp
    3510:	b88e           	cmp.l a6,d4
    3512:	66e0           	bne.s 34f4 <ZoomTest+0x1b80>
    3514:	264d           	movea.l a5,a3
    3516:	2e0e           	move.l a6,d7
    3518:	0687 0000 0480 	addi.l #1152,d7
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    351e:	7a00           	moveq #0,d5
    3520:	3a02           	move.w d2,d5
    3522:	2f0b           	move.l a3,-(sp)
    3524:	2f05           	move.l d5,-(sp)
    3526:	2f0e           	move.l a6,-(sp)
    3528:	4879 0000 72a4 	pea 72a4 <destlinezoom12>
    352e:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    3530:	486b 0001      	pea 1(a3)
    3534:	2f05           	move.l d5,-(sp)
    3536:	486e 0030      	pea 48(a6)
    353a:	4879 0000 72a4 	pea 72a4 <destlinezoom12>
    3540:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3542:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3546:	4642           	not.w d2
    3548:	548b           	addq.l #2,a3
    for(int i2=0;i2<12;i2++) {
    354a:	4fef 0020      	lea 32(sp),sp
    354e:	be8e           	cmp.l a6,d7
    3550:	66cc           	bne.s 351e <ZoomTest+0x1baa>
    3552:	0684 0000 05a0 	addi.l #1440,d4
    3558:	4bed 001e      	lea 30(a5),a5
  for(int i=0;i<8;i++) {
    355c:	bafc 010f      	cmpa.w #271,a5
    3560:	6688           	bne.s 34ea <ZoomTest+0x1b76>
    3562:	2646           	movea.l d6,a3
    3564:	2a43           	movea.l d3,a5
    3566:	4bed 2d00      	lea 11520(a5),a5
    356a:	263c 0000 0104 	move.l #260,d3
    TestRow( valsupposed, valactual, mask, 260+i2);
    3570:	2f03           	move.l d3,-(sp)
    3572:	3f02           	move.w d2,-(sp)
    3574:	4267           	clr.w -(sp)
    3576:	2f0d           	move.l a5,-(sp)
    3578:	4879 0000 72a4 	pea 72a4 <destlinezoom12>
    357e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    3580:	4bed 0030      	lea 48(a5),a5
    mask = mask ^ 0xffff;
    3584:	4642           	not.w d2
    3586:	5283           	addq.l #1,d3
  for(int i2=0;i2<5;i2++) {  
    3588:	4fef 0010      	lea 16(sp),sp
    358c:	0c83 0000 0109 	cmpi.l #265,d3
    3592:	66dc           	bne.s 3570 <ZoomTest+0x1bfc>
  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    3594:	4878 0001      	pea 1 <_start+0x1>
    3598:	4878 000c      	pea c <main+0x6>
    359c:	2f0b           	move.l a3,-(sp)
    359e:	2f0c           	move.l a4,-(sp)
    35a0:	4eba d960      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    35a4:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    35aa:	4eae ff1c      	jsr -228(a6)
    35ae:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    35b2:	2c6f 0034      	movea.l 52(sp),a6
  WaitBlit();
    35b6:	3a7c 0001      	movea.w #1,a5
  mask = 0xffff;
    35ba:	7cff           	moveq #-1,d6
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    35bc:	7400           	moveq #0,d2
    35be:	3406           	move.w d6,d2
    35c0:	486d ffff      	pea -1(a5)
    35c4:	2f02           	move.l d2,-(sp)
    35c6:	2f0e           	move.l a6,-(sp)
    35c8:	4879 0000 7278 	pea 7278 <destlinezoom13>
    35ce:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    35d0:	2f0d           	move.l a5,-(sp)
    35d2:	2f02           	move.l d2,-(sp)
    35d4:	486e 0030      	pea 48(a6)
    35d8:	4879 0000 7278 	pea 7278 <destlinezoom13>
    35de:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    35e0:	4646           	not.w d6
    35e2:	548d           	addq.l #2,a5
    valactual += ZMLINESIZE/2;
    35e4:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<11;i2++) {
    35e8:	4fef 0020      	lea 32(sp),sp
    35ec:	7217           	moveq #23,d1
    35ee:	b28d           	cmp.l a5,d1
    35f0:	66ca           	bne.s 35bc <ZoomTest+0x1c48>
    35f2:	240b           	move.l a3,d2
    35f4:	0682 0000 0514 	addi.l #1300,d2
    35fa:	781b           	moveq #27,d4
    35fc:	2a0b           	move.l a3,d5
    35fe:	2644           	movea.l d4,a3
    3600:	280c           	move.l a4,d4
    3602:	2c42           	movea.l d2,a6
    3604:	4dee ff10      	lea -240(a6),a6
    3608:	260b           	move.l a3,d3
    360a:	5b83           	subq.l #5,d3
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    360c:	2f03           	move.l d3,-(sp)
    360e:	3f06           	move.w d6,-(sp)
    3610:	4267           	clr.w -(sp)
    3612:	2f0e           	move.l a6,-(sp)
    3614:	4879 0000 7278 	pea 7278 <destlinezoom13>
    361a:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    361c:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3620:	4646           	not.w d6
    3622:	5283           	addq.l #1,d3
    for(int i2=0;i2<5;i2++) {  
    3624:	4fef 0010      	lea 16(sp),sp
    3628:	b48e           	cmp.l a6,d2
    362a:	66e0           	bne.s 360c <ZoomTest+0x1c98>
    362c:	284b           	movea.l a3,a4
    362e:	2e0e           	move.l a6,d7
    3630:	0687 0000 04e0 	addi.l #1248,d7
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    3636:	7600           	moveq #0,d3
    3638:	3606           	move.w d6,d3
    363a:	2f0c           	move.l a4,-(sp)
    363c:	2f03           	move.l d3,-(sp)
    363e:	2f0e           	move.l a6,-(sp)
    3640:	4879 0000 7278 	pea 7278 <destlinezoom13>
    3646:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    3648:	486c 0001      	pea 1(a4)
    364c:	2f03           	move.l d3,-(sp)
    364e:	486e 0030      	pea 48(a6)
    3652:	4879 0000 7278 	pea 7278 <destlinezoom13>
    3658:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    365a:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    365e:	4646           	not.w d6
    3660:	548c           	addq.l #2,a4
    for(int i2=0;i2<13;i2++) {
    3662:	4fef 0020      	lea 32(sp),sp
    3666:	be8e           	cmp.l a6,d7
    3668:	66cc           	bne.s 3636 <ZoomTest+0x1cc2>
    366a:	0682 0000 05d0 	addi.l #1488,d2
    3670:	47eb 001f      	lea 31(a3),a3
  for(int i=0;i<8;i++) {
    3674:	b6fc 0113      	cmpa.w #275,a3
    3678:	6688           	bne.s 3602 <ZoomTest+0x1c8e>
    367a:	2844           	movea.l d4,a4
  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    367c:	4878 0001      	pea 1 <_start+0x1>
    3680:	4878 000d      	pea d <main+0x7>
    3684:	2f04           	move.l d4,-(sp)
    3686:	2f05           	move.l d5,-(sp)
    3688:	4eba d878      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    368c:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    3692:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    3696:	42a7           	clr.l -(sp)
    3698:	2f3c 0000 ffff 	move.l #65535,-(sp)
    369e:	2f2f 0048      	move.l 72(sp),-(sp)
    36a2:	4879 0000 724c 	pea 724c <destlinezoom14>
    36a8:	4e92           	jsr (a2)
    36aa:	4fef 0020      	lea 32(sp),sp
    36ae:	262f 003c      	move.l 60(sp),d3
  valactual += ZMLINESIZE/2; 
    36b2:	2c6f 0040      	movea.l 64(sp),a6
  TestRow( valsupposed, valactual, mask, 0);   
    36b6:	7401           	moveq #1,d2
  mask = mask ^ 0xffff; 
    36b8:	4247           	clr.w d7
    36ba:	2805           	move.l d5,d4
    36bc:	264e           	movea.l a6,a3
    36be:	2c42           	movea.l d2,a6
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    36c0:	7400           	moveq #0,d2
    36c2:	3407           	move.w d7,d2
    36c4:	2f0e           	move.l a6,-(sp)
    36c6:	2f02           	move.l d2,-(sp)
    36c8:	2f0b           	move.l a3,-(sp)
    36ca:	4879 0000 724c 	pea 724c <destlinezoom14>
    36d0:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    36d2:	486e 0001      	pea 1(a6)
    36d6:	2f02           	move.l d2,-(sp)
    36d8:	486b 0030      	pea 48(a3)
    36dc:	4879 0000 724c 	pea 724c <destlinezoom14>
    36e2:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    36e4:	4647           	not.w d7
    36e6:	548e           	addq.l #2,a6
  for(int i2=0;i2<9;i2++) {
    36e8:	4fef 0020      	lea 32(sp),sp
    36ec:	7013           	moveq #19,d0
    36ee:	b08e           	cmp.l a6,d0
    36f0:	673e           	beq.s 3730 <ZoomTest+0x1dbc>
    36f2:	200b           	move.l a3,d0
    36f4:	0680 0000 00c0 	addi.l #192,d0
    36fa:	2643           	movea.l d3,a3
    36fc:	2600           	move.l d0,d3
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    36fe:	7400           	moveq #0,d2
    3700:	3407           	move.w d7,d2
    3702:	2f0e           	move.l a6,-(sp)
    3704:	2f02           	move.l d2,-(sp)
    3706:	2f0b           	move.l a3,-(sp)
    3708:	4879 0000 724c 	pea 724c <destlinezoom14>
    370e:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3710:	486e 0001      	pea 1(a6)
    3714:	2f02           	move.l d2,-(sp)
    3716:	486b 0030      	pea 48(a3)
    371a:	4879 0000 724c 	pea 724c <destlinezoom14>
    3720:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3722:	4647           	not.w d7
    3724:	548e           	addq.l #2,a6
  for(int i2=0;i2<9;i2++) {
    3726:	4fef 0020      	lea 32(sp),sp
    372a:	7013           	moveq #19,d0
    372c:	b08e           	cmp.l a6,d0
    372e:	66c2           	bne.s 36f2 <ZoomTest+0x1d7e>
    3730:	2644           	movea.l d4,a3
    3732:	240e           	move.l a6,d2
    3734:	2803           	move.l d3,d4
    3736:	0684 0000 00c0 	addi.l #192,d4
    373c:	2c0b           	move.l a3,d6
    373e:	2c44           	movea.l d4,a6
    3740:	4dee ff40      	lea -192(a6),a6
    3744:	2a0d           	move.l a5,d5
    3746:	5985           	subq.l #4,d5
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    3748:	2f05           	move.l d5,-(sp)
    374a:	3f07           	move.w d7,-(sp)
    374c:	4267           	clr.w -(sp)
    374e:	2f0e           	move.l a6,-(sp)
    3750:	4879 0000 724c 	pea 724c <destlinezoom14>
    3756:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3758:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    375c:	4647           	not.w d7
    375e:	5285           	addq.l #1,d5
    for(int i2=0;i2<4;i2++) {  
    3760:	4fef 0010      	lea 16(sp),sp
    3764:	b88e           	cmp.l a6,d4
    3766:	66e0           	bne.s 3748 <ZoomTest+0x1dd4>
    3768:	264d           	movea.l a5,a3
    376a:	41ee 0540      	lea 1344(a6),a0
    376e:	2f48 0038      	move.l a0,56(sp)
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    3772:	7a00           	moveq #0,d5
    3774:	3a07           	move.w d7,d5
    3776:	2f0b           	move.l a3,-(sp)
    3778:	2f05           	move.l d5,-(sp)
    377a:	2f0e           	move.l a6,-(sp)
    377c:	4879 0000 724c 	pea 724c <destlinezoom14>
    3782:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    3784:	486b 0001      	pea 1(a3)
    3788:	2f05           	move.l d5,-(sp)
    378a:	486e 0030      	pea 48(a6)
    378e:	4879 0000 724c 	pea 724c <destlinezoom14>
    3794:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3796:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    379a:	4647           	not.w d7
    379c:	548b           	addq.l #2,a3
    for(int i2=0;i2<14;i2++) {
    379e:	4fef 0020      	lea 32(sp),sp
    37a2:	bdef 0038      	cmpa.l 56(sp),a6
    37a6:	66ca           	bne.s 3772 <ZoomTest+0x1dfe>
    37a8:	0684 0000 0600 	addi.l #1536,d4
    37ae:	4bed 0020      	lea 32(a5),a5
  for(int i=0;i<7;i++) {
    37b2:	bafc 00f7      	cmpa.w #247,a5
    37b6:	6686           	bne.s 373e <ZoomTest+0x1dca>
    37b8:	2646           	movea.l d6,a3
    37ba:	2c43           	movea.l d3,a6
    37bc:	4dee 2a00      	lea 10752(a6),a6
    37c0:	3a7c 00f3      	movea.w #243,a5
    TestRow( valsupposed, valactual, mask, 243+i2);
    37c4:	2f0d           	move.l a5,-(sp)
    37c6:	3f07           	move.w d7,-(sp)
    37c8:	4267           	clr.w -(sp)
    37ca:	2f0e           	move.l a6,-(sp)
    37cc:	4879 0000 724c 	pea 724c <destlinezoom14>
    37d2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    37d4:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    37d8:	4647           	not.w d7
    37da:	528d           	addq.l #1,a5
  for(int i2=0;i2<4;i2++) {  
    37dc:	4fef 0010      	lea 16(sp),sp
    37e0:	bafc 00f7      	cmpa.w #247,a5
    37e4:	66de           	bne.s 37c4 <ZoomTest+0x1e50>
    37e6:	0683 0000 2ac0 	addi.l #10944,d3
    37ec:	2c4d           	movea.l a5,a6
    37ee:	280b           	move.l a3,d4
    37f0:	2643           	movea.l d3,a3
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    37f2:	7600           	moveq #0,d3
    37f4:	3607           	move.w d7,d3
    37f6:	2f0e           	move.l a6,-(sp)
    37f8:	2f03           	move.l d3,-(sp)
    37fa:	2f0b           	move.l a3,-(sp)
    37fc:	4879 0000 724c 	pea 724c <destlinezoom14>
    3802:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    3804:	486e 0001      	pea 1(a6)
    3808:	2f03           	move.l d3,-(sp)
    380a:	486b 0030      	pea 48(a3)
    380e:	4879 0000 724c 	pea 724c <destlinezoom14>
    3814:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3816:	4647           	not.w d7
    3818:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    381a:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<12;i2++) {
    381e:	4fef 0020      	lea 32(sp),sp
    3822:	bcfc 010f      	cmpa.w #271,a6
    3826:	66ca           	bne.s 37f2 <ZoomTest+0x1e7e>
  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    3828:	4878 0001      	pea 1 <_start+0x1>
    382c:	4878 000e      	pea e <main+0x8>
    3830:	2f04           	move.l d4,-(sp)
    3832:	2f0c           	move.l a4,-(sp)
    3834:	4eba d6cc      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3838:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    383e:	4eae ff1c      	jsr -228(a6)
    3842:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    3846:	262f 0034      	move.l 52(sp),d3
  WaitBlit();
    384a:	3c7c 0001      	movea.w #1,a6
  mask = 0x0000;
    384e:	4246           	clr.w d6
    3850:	2643           	movea.l d3,a3
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3852:	7600           	moveq #0,d3
    3854:	3606           	move.w d6,d3
    3856:	486e ffff      	pea -1(a6)
    385a:	2f03           	move.l d3,-(sp)
    385c:	2f0b           	move.l a3,-(sp)
    385e:	4879 0000 7220 	pea 7220 <destlinezoom15>
    3864:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3866:	2f0e           	move.l a6,-(sp)
    3868:	2f03           	move.l d3,-(sp)
    386a:	486b 0030      	pea 48(a3)
    386e:	4879 0000 7220 	pea 7220 <destlinezoom15>
    3874:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3876:	4646           	not.w d6
    3878:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    387a:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    387e:	4fef 0020      	lea 32(sp),sp
    3882:	7011           	moveq #17,d0
    3884:	b08e           	cmp.l a6,d0
    3886:	66ca           	bne.s 3852 <ZoomTest+0x1ede>
    3888:	262f 0068      	move.l 104(sp),d3
    388c:	2a04           	move.l d4,d5
    388e:	2642           	movea.l d2,a3
    3890:	2c43           	movea.l d3,a6
    3892:	4dee ff70      	lea -144(a6),a6
    3896:	240b           	move.l a3,d2
    3898:	5782           	subq.l #3,d2
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    389a:	2f02           	move.l d2,-(sp)
    389c:	3f06           	move.w d6,-(sp)
    389e:	4267           	clr.w -(sp)
    38a0:	2f0e           	move.l a6,-(sp)
    38a2:	4879 0000 7220 	pea 7220 <destlinezoom15>
    38a8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    38aa:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    38ae:	4646           	not.w d6
    38b0:	5282           	addq.l #1,d2
    for(int i2=0;i2<3;i2++) {  
    38b2:	4fef 0010      	lea 16(sp),sp
    38b6:	b68e           	cmp.l a6,d3
    38b8:	66e0           	bne.s 389a <ZoomTest+0x1f26>
    38ba:	240b           	move.l a3,d2
    38bc:	2e0e           	move.l a6,d7
    38be:	0687 0000 05a0 	addi.l #1440,d7
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    38c4:	7800           	moveq #0,d4
    38c6:	3806           	move.w d6,d4
    38c8:	2f02           	move.l d2,-(sp)
    38ca:	2f04           	move.l d4,-(sp)
    38cc:	2f0e           	move.l a6,-(sp)
    38ce:	4879 0000 7220 	pea 7220 <destlinezoom15>
    38d4:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    38d6:	2f02           	move.l d2,-(sp)
    38d8:	2f04           	move.l d4,-(sp)
    38da:	486e 0030      	pea 48(a6)
    38de:	4879 0000 7220 	pea 7220 <destlinezoom15>
    38e4:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    38e6:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    38ea:	4646           	not.w d6
    38ec:	5482           	addq.l #2,d2
    for(int i2=0;i2<15;i2++) {
    38ee:	4fef 0020      	lea 32(sp),sp
    38f2:	be8e           	cmp.l a6,d7
    38f4:	66ce           	bne.s 38c4 <ZoomTest+0x1f50>
    38f6:	0683 0000 0630 	addi.l #1584,d3
    38fc:	47eb 0021      	lea 33(a3),a3
  for(int i=0;i<7;i++) {
    3900:	b6fc 00fa      	cmpa.w #250,a3
    3904:	668a           	bne.s 3890 <ZoomTest+0x1f1c>
    3906:	2645           	movea.l d5,a3
    3908:	4deb 2e54      	lea 11860(a3),a6
    TestRow( valsupposed, valactual, mask, 247+i2);
    390c:	2f0d           	move.l a5,-(sp)
    390e:	3f06           	move.w d6,-(sp)
    3910:	4267           	clr.w -(sp)
    3912:	2f0e           	move.l a6,-(sp)
    3914:	4879 0000 7220 	pea 7220 <destlinezoom15>
    391a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    391c:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    3920:	4646           	not.w d6
    3922:	528d           	addq.l #1,a5
  for(int i2=0;i2<3;i2++) {  
    3924:	4fef 0010      	lea 16(sp),sp
    3928:	bafc 00fa      	cmpa.w #250,a5
    392c:	66de           	bne.s 390c <ZoomTest+0x1f98>
    392e:	2c6f 002c      	movea.l 44(sp),a6
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    3932:	7400           	moveq #0,d2
    3934:	3406           	move.w d6,d2
    3936:	2f0d           	move.l a5,-(sp)
    3938:	2f02           	move.l d2,-(sp)
    393a:	2f0e           	move.l a6,-(sp)
    393c:	4879 0000 7220 	pea 7220 <destlinezoom15>
    3942:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    3944:	486d 0001      	pea 1(a5)
    3948:	2f02           	move.l d2,-(sp)
    394a:	486e 0030      	pea 48(a6)
    394e:	4879 0000 7220 	pea 7220 <destlinezoom15>
    3954:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3956:	4646           	not.w d6
    3958:	548d           	addq.l #2,a5
    valactual += ZMLINESIZE/2;
    395a:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<10;i2++) {
    395e:	4fef 0020      	lea 32(sp),sp
    3962:	bafc 010e      	cmpa.w #270,a5
    3966:	66ca           	bne.s 3932 <ZoomTest+0x1fbe>
  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    3968:	4878 0001      	pea 1 <_start+0x1>
    396c:	4878 000f      	pea f <main+0x9>
    3970:	2f0c           	move.l a4,-(sp)
    3972:	2f0b           	move.l a3,-(sp)
    3974:	4eba d58c      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3978:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    397e:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    3982:	42a7           	clr.l -(sp)
    3984:	42a7           	clr.l -(sp)
    3986:	2f2f 0048      	move.l 72(sp),-(sp)
    398a:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3990:	4e92           	jsr (a2)
    3992:	4fef 0020      	lea 32(sp),sp
    3996:	2a6f 0044      	movea.l 68(sp),a5
    399a:	2c2f 003c      	move.l 60(sp),d6
  valactual += ZMLINESIZE/2;
    399e:	262f 0040      	move.l 64(sp),d3
  TestRow( valsupposed, valactual, mask, 0);   
    39a2:	9dce           	suba.l a6,a6
  mask = mask ^ 0xffff;
    39a4:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    39a6:	7800           	moveq #0,d4
    39a8:	3802           	move.w d2,d4
    39aa:	2f0e           	move.l a6,-(sp)
    39ac:	2f04           	move.l d4,-(sp)
    39ae:	2f03           	move.l d3,-(sp)
    39b0:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    39b6:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    39b8:	486e 0001      	pea 1(a6)
    39bc:	2f04           	move.l d4,-(sp)
    39be:	2043           	movea.l d3,a0
    39c0:	4868 0030      	pea 48(a0)
    39c4:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    39ca:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    39cc:	4642           	not.w d2
    39ce:	2803           	move.l d3,d4
    39d0:	0684 0000 0120 	addi.l #288,d4
    39d6:	548e           	addq.l #2,a6
    39d8:	2606           	move.l d6,d3
  for(int i2=0;i2<6;i2++) {
    39da:	4fef 0020      	lea 32(sp),sp
    39de:	700c           	moveq #12,d0
    39e0:	b08e           	cmp.l a6,d0
    39e2:	6742           	beq.s 3a26 <ZoomTest+0x20b2>
    39e4:	2c0d           	move.l a5,d6
    39e6:	2a44           	movea.l d4,a5
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    39e8:	7800           	moveq #0,d4
    39ea:	3802           	move.w d2,d4
    39ec:	2f0e           	move.l a6,-(sp)
    39ee:	2f04           	move.l d4,-(sp)
    39f0:	2f03           	move.l d3,-(sp)
    39f2:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    39f8:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    39fa:	486e 0001      	pea 1(a6)
    39fe:	2f04           	move.l d4,-(sp)
    3a00:	2043           	movea.l d3,a0
    3a02:	4868 0030      	pea 48(a0)
    3a06:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3a0c:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3a0e:	4642           	not.w d2
    3a10:	2803           	move.l d3,d4
    3a12:	0684 0000 0120 	addi.l #288,d4
    3a18:	548e           	addq.l #2,a6
    3a1a:	2606           	move.l d6,d3
  for(int i2=0;i2<6;i2++) {
    3a1c:	4fef 0020      	lea 32(sp),sp
    3a20:	700c           	moveq #12,d0
    3a22:	b08e           	cmp.l a6,d0
    3a24:	66be           	bne.s 39e4 <ZoomTest+0x2070>
    3a26:	3c7c 000d      	movea.w #13,a6
    3a2a:	2a0b           	move.l a3,d5
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3a2c:	2f0e           	move.l a6,-(sp)
    3a2e:	7600           	moveq #0,d3
    3a30:	3602           	move.w d2,d3
    3a32:	2f03           	move.l d3,-(sp)
    3a34:	2f06           	move.l d6,-(sp)
    3a36:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3a3c:	4e92           	jsr (a2)
    3a3e:	486e 0001      	pea 1(a6)
      mask = mask ^ 0xffff;
    3a42:	3e02           	move.w d2,d7
    3a44:	4647           	not.w d7
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3a46:	3f07           	move.w d7,-(sp)
    3a48:	4267           	clr.w -(sp)
    3a4a:	2046           	movea.l d6,a0
    3a4c:	4868 0030      	pea 48(a0)
    3a50:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3a56:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    3a58:	47ee 0003      	lea 3(a6),a3
    3a5c:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3a60:	2c04           	move.l d4,d6
    3a62:	7823           	moveq #35,d4
    3a64:	d88e           	add.l a6,d4
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    3a66:	2f0b           	move.l a3,-(sp)
    3a68:	2f03           	move.l d3,-(sp)
    3a6a:	2f0d           	move.l a5,-(sp)
    3a6c:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3a72:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    3a74:	486b 0001      	pea 1(a3)
    3a78:	2f03           	move.l d3,-(sp)
    3a7a:	486d 0030      	pea 48(a5)
    3a7e:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3a84:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    3a86:	3407           	move.w d7,d2
    3a88:	41ed 00c0      	lea 192(a5),a0
    3a8c:	548b           	addq.l #2,a3
    for(int i2=0;i2<16;i2++) {
    3a8e:	4fef 0020      	lea 32(sp),sp
    3a92:	b7c4           	cmpa.l d4,a3
    3a94:	673a           	beq.s 3ad0 <ZoomTest+0x215c>
    3a96:	2a46           	movea.l d6,a5
    3a98:	2c08           	move.l a0,d6
    3a9a:	7600           	moveq #0,d3
    3a9c:	3607           	move.w d7,d3
    3a9e:	4647           	not.w d7
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    3aa0:	2f0b           	move.l a3,-(sp)
    3aa2:	2f03           	move.l d3,-(sp)
    3aa4:	2f0d           	move.l a5,-(sp)
    3aa6:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3aac:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    3aae:	486b 0001      	pea 1(a3)
    3ab2:	2f03           	move.l d3,-(sp)
    3ab4:	486d 0030      	pea 48(a5)
    3ab8:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3abe:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    3ac0:	3407           	move.w d7,d2
    3ac2:	41ed 00c0      	lea 192(a5),a0
    3ac6:	548b           	addq.l #2,a3
    for(int i2=0;i2<16;i2++) {
    3ac8:	4fef 0020      	lea 32(sp),sp
    3acc:	b7c4           	cmpa.l d4,a3
    3ace:	66c6           	bne.s 3a96 <ZoomTest+0x2122>
    3ad0:	4dee 0022      	lea 34(a6),a6
  for(int i=0;i<7;i++) {
    3ad4:	bcfc 00fb      	cmpa.w #251,a6
    3ad8:	6750           	beq.s 3b2a <ZoomTest+0x21b6>
    3ada:	280d           	move.l a5,d4
    3adc:	0684 0000 0120 	addi.l #288,d4
    3ae2:	2a48           	movea.l a0,a5
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3ae4:	2f0e           	move.l a6,-(sp)
    3ae6:	7600           	moveq #0,d3
    3ae8:	3602           	move.w d2,d3
    3aea:	2f03           	move.l d3,-(sp)
    3aec:	2f06           	move.l d6,-(sp)
    3aee:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3af4:	4e92           	jsr (a2)
    3af6:	486e 0001      	pea 1(a6)
      mask = mask ^ 0xffff;
    3afa:	3e02           	move.w d2,d7
    3afc:	4647           	not.w d7
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3afe:	3f07           	move.w d7,-(sp)
    3b00:	4267           	clr.w -(sp)
    3b02:	2046           	movea.l d6,a0
    3b04:	4868 0030      	pea 48(a0)
    3b08:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3b0e:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    3b10:	47ee 0003      	lea 3(a6),a3
    3b14:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3b18:	2c04           	move.l d4,d6
    3b1a:	7823           	moveq #35,d4
    3b1c:	d88e           	add.l a6,d4
    3b1e:	6000 ff46      	bra.w 3a66 <ZoomTest+0x20f2>
    3b22:	7600           	moveq #0,d3
    3b24:	3602           	move.w d2,d3
    3b26:	6000 e740      	bra.w 2268 <ZoomTest+0x8f4>
    3b2a:	2645           	movea.l d5,a3
    3b2c:	2a08           	move.l a0,d5
    TestRow( valsupposed, valactual, mask, 251+i2);
    3b2e:	2f0e           	move.l a6,-(sp)
    3b30:	7800           	moveq #0,d4
    3b32:	3807           	move.w d7,d4
    3b34:	2f04           	move.l d4,-(sp)
    3b36:	2f06           	move.l d6,-(sp)
    3b38:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3b3e:	4e92           	jsr (a2)
    3b40:	4878 00fc      	pea fc <main+0xf6>
    3b44:	2f03           	move.l d3,-(sp)
    3b46:	486d 0090      	pea 144(a5)
    3b4a:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3b50:	4e92           	jsr (a2)
    3b52:	4fef 0020      	lea 32(sp),sp
    3b56:	3a7c 00fd      	movea.w #253,a5
    3b5a:	2c45           	movea.l d5,a6
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    3b5c:	2f0d           	move.l a5,-(sp)
    3b5e:	2f04           	move.l d4,-(sp)
    3b60:	2f0e           	move.l a6,-(sp)
    3b62:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3b68:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3b6a:	486d 0001      	pea 1(a5)
    3b6e:	2f04           	move.l d4,-(sp)
    3b70:	486e 0030      	pea 48(a6)
    3b74:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3b7a:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3b7c:	4642           	not.w d2
    3b7e:	548d           	addq.l #2,a5
    valactual += ZMLINESIZE/2;
    3b80:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<8;i2++) {
    3b84:	4fef 0020      	lea 32(sp),sp
    3b88:	bafc 010d      	cmpa.w #269,a5
    3b8c:	6736           	beq.s 3bc4 <ZoomTest+0x2250>
    3b8e:	7800           	moveq #0,d4
    3b90:	3802           	move.w d2,d4
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    3b92:	2f0d           	move.l a5,-(sp)
    3b94:	2f04           	move.l d4,-(sp)
    3b96:	2f0e           	move.l a6,-(sp)
    3b98:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3b9e:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3ba0:	486d 0001      	pea 1(a5)
    3ba4:	2f04           	move.l d4,-(sp)
    3ba6:	486e 0030      	pea 48(a6)
    3baa:	4879 0000 71f4 	pea 71f4 <destlinezoom16>
    3bb0:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3bb2:	4642           	not.w d2
    3bb4:	548d           	addq.l #2,a5
    valactual += ZMLINESIZE/2;
    3bb6:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<8;i2++) {
    3bba:	4fef 0020      	lea 32(sp),sp
    3bbe:	bafc 010d      	cmpa.w #269,a5
    3bc2:	66ca           	bne.s 3b8e <ZoomTest+0x221a>
  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    3bc4:	4878 0001      	pea 1 <_start+0x1>
    3bc8:	4878 0010      	pea 10 <main+0xa>
    3bcc:	2f0b           	move.l a3,-(sp)
    3bce:	2f0c           	move.l a4,-(sp)
    3bd0:	4eba d330      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3bd4:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    3bda:	4eae ff1c      	jsr -228(a6)
    3bde:	4fef 0010      	lea 16(sp),sp
    3be2:	3a7c 0001      	movea.w #1,a5
  mask = 0xffff;
    3be6:	7eff           	moveq #-1,d7
    3be8:	2c6f 0034      	movea.l 52(sp),a6
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3bec:	7400           	moveq #0,d2
    3bee:	3407           	move.w d7,d2
    3bf0:	486d ffff      	pea -1(a5)
    3bf4:	2f02           	move.l d2,-(sp)
    3bf6:	2f0e           	move.l a6,-(sp)
    3bf8:	4879 0000 71c8 	pea 71c8 <destlinezoom17>
    3bfe:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3c00:	2f0d           	move.l a5,-(sp)
    3c02:	2f02           	move.l d2,-(sp)
    3c04:	486e 0030      	pea 48(a6)
    3c08:	4879 0000 71c8 	pea 71c8 <destlinezoom17>
    3c0e:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3c10:	4647           	not.w d7
    3c12:	548d           	addq.l #2,a5
    valactual += ZMLINESIZE/2;
    3c14:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<5;i2++) {
    3c18:	4fef 0020      	lea 32(sp),sp
    3c1c:	700b           	moveq #11,d0
    3c1e:	b08d           	cmp.l a5,d0
    3c20:	66ca           	bne.s 3bec <ZoomTest+0x2278>
    3c22:	2a0b           	move.l a3,d5
    3c24:	0685 0000 01e4 	addi.l #484,d5
    3c2a:	3c7c 000a      	movea.w #10,a6
    3c2e:	2c0b           	move.l a3,d6
    3c30:	2005           	move.l d5,d0
    3c32:	2a0c           	move.l a4,d5
    3c34:	2f4d 0034      	move.l a5,52(sp)
    3c38:	2840           	movea.l d0,a4
      TestRow( valsupposed, valactual, mask, 10+i*35);
    3c3a:	2f0e           	move.l a6,-(sp)
    3c3c:	3f07           	move.w d7,-(sp)
    3c3e:	4267           	clr.w -(sp)
    3c40:	2f0c           	move.l a4,-(sp)
    3c42:	4879 0000 71c8 	pea 71c8 <destlinezoom17>
    3c48:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3c4a:	47ec 0030      	lea 48(a4),a3
      mask = mask ^ 0xffff;
    3c4e:	3807           	move.w d7,d4
    3c50:	4644           	not.w d4
    for(int i2=0;i2<17;i2++) {
    3c52:	4bee 0001      	lea 1(a6),a5
    3c56:	4fef 0010      	lea 16(sp),sp
    3c5a:	49ec 0690      	lea 1680(a4),a4
    3c5e:	260c           	move.l a4,d3
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3c60:	7400           	moveq #0,d2
    3c62:	3404           	move.w d4,d2
    3c64:	2f0d           	move.l a5,-(sp)
    3c66:	2f02           	move.l d2,-(sp)
    3c68:	2f0b           	move.l a3,-(sp)
    3c6a:	4879 0000 71c8 	pea 71c8 <destlinezoom17>
    3c70:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3c72:	486d 0001      	pea 1(a5)
    3c76:	2f02           	move.l d2,-(sp)
    3c78:	486b 0030      	pea 48(a3)
    3c7c:	4879 0000 71c8 	pea 71c8 <destlinezoom17>
    3c82:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    3c84:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    3c88:	4644           	not.w d4
    3c8a:	3e04           	move.w d4,d7
    3c8c:	548d           	addq.l #2,a5
    for(int i2=0;i2<17;i2++) {
    3c8e:	4fef 0020      	lea 32(sp),sp
    3c92:	b7c3           	cmpa.l d3,a3
    3c94:	66ca           	bne.s 3c60 <ZoomTest+0x22ec>
    3c96:	4dee 0023      	lea 35(a6),a6
  for(int i=0;i<7;i++) {
    3c9a:	bcfc 00ff      	cmpa.w #255,a6
    3c9e:	669a           	bne.s 3c3a <ZoomTest+0x22c6>
    3ca0:	2845           	movea.l d5,a4
    3ca2:	2646           	movea.l d6,a3
    3ca4:	2a6f 0034      	movea.l 52(sp),a5
  TestRow( valsupposed, valactual, mask, 255);
    3ca8:	2f0e           	move.l a6,-(sp)
    3caa:	3f04           	move.w d4,-(sp)
    3cac:	4267           	clr.w -(sp)
    3cae:	486b 2fd4      	pea 12244(a3)
    3cb2:	4879 0000 71c8 	pea 71c8 <destlinezoom17>
    3cb8:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    3cba:	2606           	move.l d6,d3
    3cbc:	0683 0000 3004 	addi.l #12292,d3
    3cc2:	4fef 0010      	lea 16(sp),sp
    3cc6:	3c7c 0100      	movea.w #256,a6
    3cca:	2003           	move.l d3,d0
    3ccc:	2606           	move.l d6,d3
    3cce:	2640           	movea.l d0,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3cd0:	2f0e           	move.l a6,-(sp)
    3cd2:	2f02           	move.l d2,-(sp)
    3cd4:	2f0b           	move.l a3,-(sp)
    3cd6:	4879 0000 71c8 	pea 71c8 <destlinezoom17>
    3cdc:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3cde:	486e 0001      	pea 1(a6)
    3ce2:	2f02           	move.l d2,-(sp)
    3ce4:	486b 0030      	pea 48(a3)
    3ce8:	4879 0000 71c8 	pea 71c8 <destlinezoom17>
    3cee:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3cf0:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3cf2:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<7;i2++) {
    3cf6:	4fef 0020      	lea 32(sp),sp
    3cfa:	bcfc 010e      	cmpa.w #270,a6
    3cfe:	6736           	beq.s 3d36 <ZoomTest+0x23c2>
    3d00:	7400           	moveq #0,d2
    3d02:	3404           	move.w d4,d2
    3d04:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3d06:	2f0e           	move.l a6,-(sp)
    3d08:	2f02           	move.l d2,-(sp)
    3d0a:	2f0b           	move.l a3,-(sp)
    3d0c:	4879 0000 71c8 	pea 71c8 <destlinezoom17>
    3d12:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3d14:	486e 0001      	pea 1(a6)
    3d18:	2f02           	move.l d2,-(sp)
    3d1a:	486b 0030      	pea 48(a3)
    3d1e:	4879 0000 71c8 	pea 71c8 <destlinezoom17>
    3d24:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3d26:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3d28:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<7;i2++) {
    3d2c:	4fef 0020      	lea 32(sp),sp
    3d30:	bcfc 010e      	cmpa.w #270,a6
    3d34:	66ca           	bne.s 3d00 <ZoomTest+0x238c>
  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    3d36:	4878 0001      	pea 1 <_start+0x1>
    3d3a:	4878 0011      	pea 11 <main+0xb>
    3d3e:	2f0c           	move.l a4,-(sp)
    3d40:	2f03           	move.l d3,-(sp)
    3d42:	4eba d1be      	jsr f02 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3d46:	2c79 0000 7514 	movea.l 7514 <GfxBase>,a6
    3d4c:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3d50:	42a7           	clr.l -(sp)
    3d52:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3d58:	2f2f 0048      	move.l 72(sp),-(sp)
    3d5c:	4879 0000 719c 	pea 719c <destlinezoom18>
    3d62:	4e92           	jsr (a2)
    3d64:	4fef 0020      	lea 32(sp),sp
    3d68:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff;
    3d6c:	4242           	clr.w d2
    3d6e:	286f 0040      	movea.l 64(sp),a4
    3d72:	282f 003c      	move.l 60(sp),d4
    3d76:	2a2f 0044      	move.l 68(sp),d5
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3d7a:	7600           	moveq #0,d3
    3d7c:	3602           	move.w d2,d3
    3d7e:	2f0b           	move.l a3,-(sp)
    3d80:	2f03           	move.l d3,-(sp)
    3d82:	2f0c           	move.l a4,-(sp)
    3d84:	4879 0000 719c 	pea 719c <destlinezoom18>
    3d8a:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3d8c:	486b 0001      	pea 1(a3)
    3d90:	2f03           	move.l d3,-(sp)
    3d92:	486c 0030      	pea 48(a4)
    3d96:	4879 0000 719c 	pea 719c <destlinezoom18>
    3d9c:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3d9e:	4642           	not.w d2
    3da0:	200c           	move.l a4,d0
    3da2:	0680 0000 0120 	addi.l #288,d0
    3da8:	548b           	addq.l #2,a3
    3daa:	2844           	movea.l d4,a4
  for(int i2=0;i2<4;i2++) {
    3dac:	4fef 0020      	lea 32(sp),sp
    3db0:	7209           	moveq #9,d1
    3db2:	b28b           	cmp.l a3,d1
    3db4:	6740           	beq.s 3df6 <ZoomTest+0x2482>
    3db6:	2805           	move.l d5,d4
    3db8:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3dba:	7600           	moveq #0,d3
    3dbc:	3602           	move.w d2,d3
    3dbe:	2f0b           	move.l a3,-(sp)
    3dc0:	2f03           	move.l d3,-(sp)
    3dc2:	2f0c           	move.l a4,-(sp)
    3dc4:	4879 0000 719c 	pea 719c <destlinezoom18>
    3dca:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3dcc:	486b 0001      	pea 1(a3)
    3dd0:	2f03           	move.l d3,-(sp)
    3dd2:	486c 0030      	pea 48(a4)
    3dd6:	4879 0000 719c 	pea 719c <destlinezoom18>
    3ddc:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3dde:	4642           	not.w d2
    3de0:	200c           	move.l a4,d0
    3de2:	0680 0000 0120 	addi.l #288,d0
    3de8:	548b           	addq.l #2,a3
    3dea:	2844           	movea.l d4,a4
  for(int i2=0;i2<4;i2++) {
    3dec:	4fef 0020      	lea 32(sp),sp
    3df0:	7209           	moveq #9,d1
    3df2:	b28b           	cmp.l a3,d1
    3df4:	66c0           	bne.s 3db6 <ZoomTest+0x2442>
    3df6:	2f44 003c      	move.l d4,60(sp)
    3dfa:	2f45 0044      	move.l d5,68(sp)
    3dfe:	2644           	movea.l d4,a3
    3e00:	2805           	move.l d5,d4
    3e02:	284d           	movea.l a5,a4
    3e04:	2600           	move.l d0,d3
    3e06:	4ded 0024      	lea 36(a5),a6
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3e0a:	7a00           	moveq #0,d5
    3e0c:	3a02           	move.w d2,d5
    3e0e:	2f0c           	move.l a4,-(sp)
    3e10:	2f05           	move.l d5,-(sp)
    3e12:	2f0b           	move.l a3,-(sp)
    3e14:	4879 0000 719c 	pea 719c <destlinezoom18>
    3e1a:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3e1c:	486c 0001      	pea 1(a4)
    3e20:	2f05           	move.l d5,-(sp)
    3e22:	486b 0030      	pea 48(a3)
    3e26:	4879 0000 719c 	pea 719c <destlinezoom18>
    3e2c:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    3e2e:	4642           	not.w d2
    3e30:	548c           	addq.l #2,a4
    for(int i2=0;i2<18;i2++) {
    3e32:	4fef 0020      	lea 32(sp),sp
    3e36:	bdcc           	cmpa.l a4,a6
    3e38:	673e           	beq.s 3e78 <ZoomTest+0x2504>
    3e3a:	200b           	move.l a3,d0
    3e3c:	0680 0000 0120 	addi.l #288,d0
    3e42:	2644           	movea.l d4,a3
    3e44:	2803           	move.l d3,d4
    3e46:	2600           	move.l d0,d3
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3e48:	7a00           	moveq #0,d5
    3e4a:	3a02           	move.w d2,d5
    3e4c:	2f0c           	move.l a4,-(sp)
    3e4e:	2f05           	move.l d5,-(sp)
    3e50:	2f0b           	move.l a3,-(sp)
    3e52:	4879 0000 719c 	pea 719c <destlinezoom18>
    3e58:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3e5a:	486c 0001      	pea 1(a4)
    3e5e:	2f05           	move.l d5,-(sp)
    3e60:	486b 0030      	pea 48(a3)
    3e64:	4879 0000 719c 	pea 719c <destlinezoom18>
    3e6a:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    3e6c:	4642           	not.w d2
    3e6e:	548c           	addq.l #2,a4
    for(int i2=0;i2<18;i2++) {
    3e70:	4fef 0020      	lea 32(sp),sp
    3e74:	bdcc           	cmpa.l a4,a6
    3e76:	66c2           	bne.s 3e3a <ZoomTest+0x24c6>
    3e78:	4bed 0023      	lea 35(a5),a5
  for(int i=0;i<7;i++) {  
    3e7c:	bafc 0100      	cmpa.w #256,a5
    3e80:	6718           	beq.s 3e9a <ZoomTest+0x2526>
    3e82:	200b           	move.l a3,d0
    3e84:	0680 0000 0120 	addi.l #288,d0
    3e8a:	2644           	movea.l d4,a3
    3e8c:	2803           	move.l d3,d4
  for(int i2=0;i2<4;i2++) {
    3e8e:	284d           	movea.l a5,a4
    3e90:	2600           	move.l d0,d3
    3e92:	4ded 0024      	lea 36(a5),a6
    3e96:	6000 ff72      	bra.w 3e0a <ZoomTest+0x2496>
    3e9a:	2644           	movea.l d4,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3e9c:	7800           	moveq #0,d4
    3e9e:	3802           	move.w d2,d4
    3ea0:	2f0d           	move.l a5,-(sp)
    3ea2:	2f04           	move.l d4,-(sp)
    3ea4:	2f0b           	move.l a3,-(sp)
    3ea6:	4879 0000 719c 	pea 719c <destlinezoom18>
    3eac:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3eae:	486d 0001      	pea 1(a5)
    3eb2:	2f04           	move.l d4,-(sp)
    3eb4:	486b 0030      	pea 48(a3)
    3eb8:	4879 0000 719c 	pea 719c <destlinezoom18>
    3ebe:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3ec0:	4642           	not.w d2
    3ec2:	548d           	addq.l #2,a5
  for(int i2=0;i2<4;i2++) {
    3ec4:	4fef 0020      	lea 32(sp),sp
    3ec8:	bafc 0108      	cmpa.w #264,a5
    3ecc:	673e           	beq.s 3f0c <ZoomTest+0x2598>
    3ece:	200b           	move.l a3,d0
    3ed0:	0680 0000 00c0 	addi.l #192,d0
    3ed6:	2643           	movea.l d3,a3
    3ed8:	2600           	move.l d0,d3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3eda:	7800           	moveq #0,d4
    3edc:	3802           	move.w d2,d4
    3ede:	2f0d           	move.l a5,-(sp)
    3ee0:	2f04           	move.l d4,-(sp)
    3ee2:	2f0b           	move.l a3,-(sp)
    3ee4:	4879 0000 719c 	pea 719c <destlinezoom18>
    3eea:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3eec:	486d 0001      	pea 1(a5)
    3ef0:	2f04           	move.l d4,-(sp)
    3ef2:	486b 0030      	pea 48(a3)
    3ef6:	4879 0000 719c 	pea 719c <destlinezoom18>
    3efc:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    3efe:	4642           	not.w d2
    3f00:	548d           	addq.l #2,a5
  for(int i2=0;i2<4;i2++) {
    3f02:	4fef 0020      	lea 32(sp),sp
    3f06:	bafc 0108      	cmpa.w #264,a5
    3f0a:	66c2           	bne.s 3ece <ZoomTest+0x255a>
  TestRow( valsupposed, valactual, mask, 0);
    3f0c:	42a7           	clr.l -(sp)
    3f0e:	3f02           	move.w d2,-(sp)
    3f10:	4267           	clr.w -(sp)
    3f12:	2f03           	move.l d3,-(sp)
    3f14:	4879 0000 719c 	pea 719c <destlinezoom18>
    3f1a:	4e92           	jsr (a2)
    3f1c:	4fef 0010      	lea 16(sp),sp
}
    3f20:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    3f24:	4fef 0048      	lea 72(sp),sp
    3f28:	4e75           	rts
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3f2a:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    3f30:	4eae ffc4      	jsr -60(a6)
    3f34:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    3f3a:	2200           	move.l d0,d1
    3f3c:	243c 0000 4e45 	move.l #20037,d2
    3f42:	7635           	moveq #53,d3
    3f44:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3f48:	2c79 0000 7520 	movea.l 7520 <SysBase>,a6
    3f4e:	203c 0000 3740 	move.l #14144,d0
    3f54:	7202           	moveq #2,d1
    3f56:	4eae ff3a      	jsr -198(a6)
    3f5a:	2840           	movea.l d0,a4
  if( source == 0) {
    3f5c:	4a80           	tst.l d0
    3f5e:	6600 e1d4      	bne.w 2134 <ZoomTest+0x7c0>
    Write(  Output(), 
    3f62:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    3f68:	4eae ffc4      	jsr -60(a6)
    3f6c:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    3f72:	2200           	move.l d0,d1
    3f74:	243c 0000 4ebc 	move.l #20156,d2
    3f7a:	7639           	moveq #57,d3
    3f7c:	4eae ffd0      	jsr -48(a6)
}
    3f80:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    3f84:	4fef 0048      	lea 72(sp),sp
    3f88:	4e75           	rts
    Write(  Output(), 
    3f8a:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    3f90:	4eae ffc4      	jsr -60(a6)
    3f94:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    3f9a:	2200           	move.l d0,d1
    3f9c:	243c 0000 4db8 	move.l #19896,d2
    3fa2:	7636           	moveq #54,d3
    3fa4:	4eae ffd0      	jsr -48(a6)
    return;
    3fa8:	6000 df36      	bra.w 1ee0 <ZoomTest+0x56c>
    Write(  Output(), 
    3fac:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    3fb2:	4eae ffc4      	jsr -60(a6)
    3fb6:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    3fbc:	2200           	move.l d0,d1
    3fbe:	243c 0000 4b7f 	move.l #19327,d2
    3fc4:	7639           	moveq #57,d3
    3fc6:	4eae ffd0      	jsr -48(a6)
    return;
    3fca:	6000 dba2      	bra.w 1b6e <ZoomTest+0x1fa>
    Write(  Output(), 
    3fce:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    3fd4:	4eae ffc4      	jsr -60(a6)
    3fd8:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    3fde:	2200           	move.l d0,d1
    3fe0:	243c 0000 4ef6 	move.l #20214,d2
    3fe6:	763d           	moveq #61,d3
    3fe8:	4eae ffd0      	jsr -48(a6)
}
    3fec:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    3ff0:	4fef 0048      	lea 72(sp),sp
    3ff4:	4e75           	rts
    Write(  Output(), 
    3ff6:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    3ffc:	4eae ffc4      	jsr -60(a6)
    4000:	2c79 0000 751c 	movea.l 751c <DOSBase>,a6
    4006:	2200           	move.l d0,d1
    4008:	243c 0000 4bb6 	move.l #19382,d2
    400e:	763d           	moveq #61,d3
    4010:	4eae ffd0      	jsr -48(a6)
    return;
    4014:	6000 db58      	bra.w 1b6e <ZoomTest+0x1fa>

00004018 <memcpy>:
{
    4018:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    401c:	202f 0014      	move.l 20(sp),d0
    4020:	226f 0018      	movea.l 24(sp),a1
    4024:	222f 001c      	move.l 28(sp),d1
	while(len--)
    4028:	2601           	move.l d1,d3
    402a:	5383           	subq.l #1,d3
    402c:	4a81           	tst.l d1
    402e:	6762           	beq.s 4092 <memcpy+0x7a>
    4030:	2040           	movea.l d0,a0
    4032:	5888           	addq.l #4,a0
    4034:	b1c9           	cmpa.l a1,a0
    4036:	53c2           	sl.s d2
    4038:	4402           	neg.b d2
    403a:	41e9 0004      	lea 4(a1),a0
    403e:	b1c0           	cmpa.l d0,a0
    4040:	53c4           	sl.s d4
    4042:	4404           	neg.b d4
    4044:	8404           	or.b d4,d2
    4046:	7808           	moveq #8,d4
    4048:	b883           	cmp.l d3,d4
    404a:	55c4           	sc.s d4
    404c:	4404           	neg.b d4
    404e:	c404           	and.b d4,d2
    4050:	6746           	beq.s 4098 <memcpy+0x80>
    4052:	2409           	move.l a1,d2
    4054:	8480           	or.l d0,d2
    4056:	7803           	moveq #3,d4
    4058:	c484           	and.l d4,d2
    405a:	663c           	bne.s 4098 <memcpy+0x80>
    405c:	2049           	movea.l a1,a0
    405e:	2440           	movea.l d0,a2
    4060:	74fc           	moveq #-4,d2
    4062:	c481           	and.l d1,d2
    4064:	d489           	add.l a1,d2
		*d++ = *s++;
    4066:	24d8           	move.l (a0)+,(a2)+
    4068:	b488           	cmp.l a0,d2
    406a:	66fa           	bne.s 4066 <memcpy+0x4e>
    406c:	74fc           	moveq #-4,d2
    406e:	c481           	and.l d1,d2
    4070:	2040           	movea.l d0,a0
    4072:	d1c2           	adda.l d2,a0
    4074:	d3c2           	adda.l d2,a1
    4076:	9682           	sub.l d2,d3
    4078:	b481           	cmp.l d1,d2
    407a:	6716           	beq.s 4092 <memcpy+0x7a>
    407c:	1091           	move.b (a1),(a0)
	while(len--)
    407e:	4a83           	tst.l d3
    4080:	6710           	beq.s 4092 <memcpy+0x7a>
		*d++ = *s++;
    4082:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    4088:	5383           	subq.l #1,d3
    408a:	6706           	beq.s 4092 <memcpy+0x7a>
		*d++ = *s++;
    408c:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    4092:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    4096:	4e75           	rts
    4098:	2040           	movea.l d0,a0
    409a:	d289           	add.l a1,d1
		*d++ = *s++;
    409c:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    409e:	b289           	cmp.l a1,d1
    40a0:	67f0           	beq.s 4092 <memcpy+0x7a>
		*d++ = *s++;
    40a2:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    40a4:	b289           	cmp.l a1,d1
    40a6:	66f4           	bne.s 409c <memcpy+0x84>
    40a8:	60e8           	bra.s 4092 <memcpy+0x7a>

000040aa <memset>:
{
    40aa:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    40ae:	202f 0024      	move.l 36(sp),d0
    40b2:	2a2f 0028      	move.l 40(sp),d5
    40b6:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    40ba:	2809           	move.l a1,d4
    40bc:	5384           	subq.l #1,d4
    40be:	b2fc 0000      	cmpa.w #0,a1
    40c2:	6f00 00b0      	ble.w 4174 <memset+0xca>
    40c6:	1e05           	move.b d5,d7
    40c8:	2200           	move.l d0,d1
    40ca:	4481           	neg.l d1
    40cc:	7403           	moveq #3,d2
    40ce:	c282           	and.l d2,d1
    40d0:	7c05           	moveq #5,d6
		*ptr++ = val;
    40d2:	2440           	movea.l d0,a2
    40d4:	bc84           	cmp.l d4,d6
    40d6:	646a           	bcc.s 4142 <memset+0x98>
    40d8:	4a81           	tst.l d1
    40da:	6724           	beq.s 4100 <memset+0x56>
    40dc:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    40de:	5384           	subq.l #1,d4
    40e0:	7401           	moveq #1,d2
    40e2:	b481           	cmp.l d1,d2
    40e4:	671a           	beq.s 4100 <memset+0x56>
		*ptr++ = val;
    40e6:	2440           	movea.l d0,a2
    40e8:	548a           	addq.l #2,a2
    40ea:	2040           	movea.l d0,a0
    40ec:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    40f0:	5384           	subq.l #1,d4
    40f2:	7403           	moveq #3,d2
    40f4:	b481           	cmp.l d1,d2
    40f6:	6608           	bne.s 4100 <memset+0x56>
		*ptr++ = val;
    40f8:	528a           	addq.l #1,a2
    40fa:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    40fe:	5384           	subq.l #1,d4
    4100:	2609           	move.l a1,d3
    4102:	9681           	sub.l d1,d3
    4104:	7c00           	moveq #0,d6
    4106:	1c05           	move.b d5,d6
    4108:	2406           	move.l d6,d2
    410a:	4842           	swap d2
    410c:	4242           	clr.w d2
    410e:	2042           	movea.l d2,a0
    4110:	2406           	move.l d6,d2
    4112:	e14a           	lsl.w #8,d2
    4114:	4842           	swap d2
    4116:	4242           	clr.w d2
    4118:	e18e           	lsl.l #8,d6
    411a:	2646           	movea.l d6,a3
    411c:	2c08           	move.l a0,d6
    411e:	8486           	or.l d6,d2
    4120:	2c0b           	move.l a3,d6
    4122:	8486           	or.l d6,d2
    4124:	1407           	move.b d7,d2
    4126:	2040           	movea.l d0,a0
    4128:	d1c1           	adda.l d1,a0
    412a:	72fc           	moveq #-4,d1
    412c:	c283           	and.l d3,d1
    412e:	d288           	add.l a0,d1
		*ptr++ = val;
    4130:	20c2           	move.l d2,(a0)+
    4132:	b1c1           	cmpa.l d1,a0
    4134:	66fa           	bne.s 4130 <memset+0x86>
    4136:	72fc           	moveq #-4,d1
    4138:	c283           	and.l d3,d1
    413a:	d5c1           	adda.l d1,a2
    413c:	9881           	sub.l d1,d4
    413e:	b283           	cmp.l d3,d1
    4140:	6732           	beq.s 4174 <memset+0xca>
    4142:	1485           	move.b d5,(a2)
	while(len-- > 0)
    4144:	4a84           	tst.l d4
    4146:	6f2c           	ble.s 4174 <memset+0xca>
		*ptr++ = val;
    4148:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    414c:	7201           	moveq #1,d1
    414e:	b284           	cmp.l d4,d1
    4150:	6c22           	bge.s 4174 <memset+0xca>
		*ptr++ = val;
    4152:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    4156:	7402           	moveq #2,d2
    4158:	b484           	cmp.l d4,d2
    415a:	6c18           	bge.s 4174 <memset+0xca>
		*ptr++ = val;
    415c:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    4160:	7c03           	moveq #3,d6
    4162:	bc84           	cmp.l d4,d6
    4164:	6c0e           	bge.s 4174 <memset+0xca>
		*ptr++ = val;
    4166:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    416a:	7204           	moveq #4,d1
    416c:	b284           	cmp.l d4,d1
    416e:	6c04           	bge.s 4174 <memset+0xca>
		*ptr++ = val;
    4170:	1545 0005      	move.b d5,5(a2)
}
    4174:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    4178:	4e75           	rts

0000417a <strlen>:
{
    417a:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    417e:	7000           	moveq #0,d0
	while(*s++)
    4180:	4a10           	tst.b (a0)
    4182:	6708           	beq.s 418c <strlen+0x12>
		t++;
    4184:	5280           	addq.l #1,d0
	while(*s++)
    4186:	4a30 0800      	tst.b (0,a0,d0.l)
    418a:	66f8           	bne.s 4184 <strlen+0xa>
}
    418c:	4e75           	rts
    418e:	4e71           	nop

00004190 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    4190:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    4194:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    4198:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    419c:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    41a0:	d041           	add.w d1,d0
	swap	d0
    41a2:	4840           	swap d0
	clrw	d0
    41a4:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    41a6:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    41aa:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    41ae:	d081           	add.l d1,d0

	rts
    41b0:	4e75           	rts

000041b2 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    41b2:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    41b4:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    41b8:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    41bc:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    41c2:	6416           	bcc.s 41da <__udivsi3+0x28>
	movel	d0, d2
    41c4:	2400           	move.l d0,d2
	clrw	d2
    41c6:	4242           	clr.w d2
	swap	d2
    41c8:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    41ca:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    41cc:	3002           	move.w d2,d0
	swap	d0
    41ce:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    41d0:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    41d4:	84c1           	divu.w d1,d2
	movew	d2, d0
    41d6:	3002           	move.w d2,d0
	jra	6f
    41d8:	6030           	bra.s 420a <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    41da:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    41dc:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    41de:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    41e0:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    41e6:	64f4           	bcc.s 41dc <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    41e8:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    41ea:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    41f0:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    41f2:	c2c0           	mulu.w d0,d1
	swap	d2
    41f4:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    41f6:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    41f8:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    41fa:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    41fc:	660a           	bne.s 4208 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    41fe:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    4200:	6506           	bcs.s 4208 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    4202:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    4206:	6302           	bls.s 420a <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    4208:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    420a:	241f           	move.l (sp)+,d2
	rts
    420c:	4e75           	rts

0000420e <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    420e:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    4210:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    4212:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    4216:	6a04           	bpl.s 421c <__divsi3+0xe>
	negl	d1
    4218:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    421a:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    421c:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    4220:	6a04           	bpl.s 4226 <__divsi3+0x18>
	negl	d0
    4222:	4480           	neg.l d0
	negb	d2
    4224:	4402           	neg.b d2

2:	movel	d1, sp@-
    4226:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4228:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    422a:	6186           	bsr.s 41b2 <__udivsi3>
	addql	IMM (8), sp
    422c:	508f           	addq.l #8,sp

	tstb	d2
    422e:	4a02           	tst.b d2
	jpl	3f
    4230:	6a02           	bpl.s 4234 <__divsi3+0x26>
	negl	d0
    4232:	4480           	neg.l d0

3:	movel	sp@+, d2
    4234:	241f           	move.l (sp)+,d2
	rts
    4236:	4e75           	rts

00004238 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    4238:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    423c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    4240:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4242:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    4244:	61c8           	bsr.s 420e <__divsi3>
	addql	IMM (8), sp
    4246:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    4248:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    424c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    424e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    4250:	6100 ff3e      	bsr.w 4190 <__mulsi3>
	addql	IMM (8), sp
    4254:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    4256:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    425a:	9280           	sub.l d0,d1
	movel	d1, d0
    425c:	2001           	move.l d1,d0
	rts
    425e:	4e75           	rts

00004260 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    4260:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    4264:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    4268:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    426a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    426c:	6100 ff44      	bsr.w 41b2 <__udivsi3>
	addql	IMM (8), sp
    4270:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    4272:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    4276:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4278:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    427a:	6100 ff14      	bsr.w 4190 <__mulsi3>
	addql	IMM (8), sp
    427e:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    4280:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    4284:	9280           	sub.l d0,d1
	movel	d1, d0
    4286:	2001           	move.l d1,d0
	rts
    4288:	4e75           	rts

0000428a <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    428a:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    428c:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    4290:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    4294:	2c5f           	movea.l (sp)+,a6
    rts
    4296:	4e75           	rts

00004298 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    4298:	16c0           	move.b d0,(a3)+
	rts
    429a:	4e75           	rts

0000429c <saveregs>:
	...

000042d8 <font2distance>:
    42d8:	0505           	btst d2,d5
    42da:	0505           	btst d2,d5
    42dc:	0505           	btst d2,d5
    42de:	0505           	btst d2,d5
    42e0:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    42e2:	0505           	btst d2,d5
    42e4:	0505           	btst d2,d5
    42e6:	0005 0505      	ori.b #5,d5
    42ea:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    42ec:	0505           	btst d2,d5
    42ee:	0505           	btst d2,d5
    42f0:	0505           	btst d2,d5
    42f2:	0505           	btst d2,d5
    42f4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    42f6:	0505           	btst d2,d5
    42f8:	0505           	btst d2,d5
    42fa:	0505           	btst d2,d5
    42fc:	0505           	btst d2,d5
    42fe:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    4300:	0500           	btst d2,d0
    4302:	0505           	btst d2,d5
    4304:	0505           	btst d2,d5
    4306:	0505           	btst d2,d5
    4308:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    430a:	0505           	btst d2,d5
    430c:	0505           	btst d2,d5
    430e:	0505           	btst d2,d5
    4310:	0505           	btst d2,d5
    4312:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    4314:	0505           	btst d2,d5
    4316:	0505           	btst d2,d5
    4318:	0503           	btst d2,d3
    431a:	0505           	btst d2,d5
    431c:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    431e:	0505           	btst d2,d5
    4320:	0500           	btst d2,d0
    4322:	0505           	btst d2,d5
    4324:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    4328:	0505           	btst d2,d5
    432a:	0503           	btst d2,d3
    432c:	0205 0507      	andi.b #7,d5
    4330:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    4332:	0505           	btst d2,d5
    4334:	0505           	btst d2,d5
    4336:	0505           	btst d2,d5
    4338:	0505           	btst d2,d5
    433a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    433c:	0505           	btst d2,d5
    433e:	0505           	btst d2,d5
    4340:	0505           	btst d2,d5
    4342:	0505           	btst d2,d5
    4344:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4346:	0505           	btst d2,d5
    4348:	0505           	btst d2,d5
    434a:	0505           	btst d2,d5
    434c:	0505           	btst d2,d5
    434e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4350:	0505           	btst d2,d5
    4352:	0505           	btst d2,d5
    4354:	0505           	btst d2,d5
    4356:	0505           	btst d2,d5
    4358:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    435a:	0505           	btst d2,d5
    435c:	0505           	btst d2,d5
    435e:	0505           	btst d2,d5
    4360:	0505           	btst d2,d5
    4362:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4364:	0505           	btst d2,d5
    4366:	0505           	btst d2,d5
    4368:	0505           	btst d2,d5
    436a:	0505           	btst d2,d5
    436c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    436e:	0505           	btst d2,d5
    4370:	0505           	btst d2,d5
    4372:	0505           	btst d2,d5
    4374:	0505           	btst d2,d5
    4376:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4378:	0505           	btst d2,d5
    437a:	0505           	btst d2,d5
    437c:	0505           	btst d2,d5
    437e:	0505           	btst d2,d5
    4380:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4382:	0505           	btst d2,d5
    4384:	0505           	btst d2,d5
    4386:	0505           	btst d2,d5
    4388:	0505           	btst d2,d5
    438a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    438c:	0505           	btst d2,d5
    438e:	0505           	btst d2,d5
    4390:	0505           	btst d2,d5
    4392:	0505           	btst d2,d5
    4394:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4396:	0505           	btst d2,d5
    4398:	0505           	btst d2,d5
    439a:	0505           	btst d2,d5
    439c:	0505           	btst d2,d5
    439e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43a0:	0505           	btst d2,d5
    43a2:	0505           	btst d2,d5
    43a4:	0505           	btst d2,d5
    43a6:	0505           	btst d2,d5
    43a8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43aa:	0505           	btst d2,d5
    43ac:	0505           	btst d2,d5
    43ae:	0505           	btst d2,d5
    43b0:	0505           	btst d2,d5
    43b2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43b4:	0505           	btst d2,d5
    43b6:	0505           	btst d2,d5
    43b8:	0505           	btst d2,d5
    43ba:	0505           	btst d2,d5
    43bc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43be:	0505           	btst d2,d5
    43c0:	0505           	btst d2,d5
    43c2:	0505           	btst d2,d5
    43c4:	0505           	btst d2,d5
    43c6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43c8:	0505           	btst d2,d5
    43ca:	0505           	btst d2,d5
    43cc:	0505           	btst d2,d5
    43ce:	0505           	btst d2,d5
    43d0:	0505           	btst d2,d5

000043d2 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    43d2:	16c0           	move.b d0,(a3)+
  RTS
    43d4:	4e75           	rts

000043d6 <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    43d6:	48f9 7fff 0000 	movem.l d0-a6,429c <saveregs>
    43dc:	429c 
  lea 0xdff000,a5
    43de:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddb1b5>,a5
  move.l sp@(4),a0  //Fontlocation
    43e4:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    43e8:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    43ec:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    43f0:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    43f2:	082d 0006 0002 	btst #6,2(a5)

000043f8 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    43f8:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    43fe:	66f8           	bne.s 43f8 <st2wblit>

00004400 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    4400:	7019           	moveq #25,d0
	sub.l d5,d5      
    4402:	9a85           	sub.l d5,d5

00004404 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    4404:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    4406:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    4408:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    440c:	9dce           	suba.l a6,a6
	move.l d2, a6
    440e:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    4410:	ddfc 0000 42d8 	adda.l #17112,a6

	LSL  	#4,d2 	    //Fetch next char
    4416:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    4418:	2842           	movea.l d2,a4


	move.l  #0,d4
    441a:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    441c:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    441e:	3814           	move.w (a4),d4
	swap	d4
    4420:	4844           	swap d4
	lsr.l	d5, d4
    4422:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    4424:	8993           	or.l d4,(a3)
	clr.l	d4
    4426:	4284           	clr.l d4
	move.w  2(a4), d4
    4428:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    442c:	4844           	swap d4
	lsr.l	d5, d4
    442e:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    4430:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    4434:	4284           	clr.l d4
	move.w  4(a4), d4
    4436:	382c 0004      	move.w 4(a4),d4
	swap	d4
    443a:	4844           	swap d4
	lsr.l	d5, d4
    443c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    443e:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    4442:	4284           	clr.l d4
	move.w  6(a4), d4
    4444:	382c 0006      	move.w 6(a4),d4
	swap	d4
    4448:	4844           	swap d4
	lsr.l	d5, d4
    444a:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    444c:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    4450:	4284           	clr.l d4
	move.w  8(a4), d4
    4452:	382c 0008      	move.w 8(a4),d4
	swap	d4
    4456:	4844           	swap d4
	lsr.l	d5, d4
    4458:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    445a:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    445e:	4284           	clr.l d4
	move.w  10(a4), d4
    4460:	382c 000a      	move.w 10(a4),d4
	swap	d4
    4464:	4844           	swap d4
	lsr.l	d5, d4
    4466:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    4468:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    446c:	4284           	clr.l d4
	move.w  12(a4), d4
    446e:	382c 000c      	move.w 12(a4),d4
	swap	d4
    4472:	4844           	swap d4
	lsr.l	d5, d4
    4474:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    4476:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    447a:	4284           	clr.l d4
	move.w  14(a4), d4
    447c:	382c 000e      	move.w 14(a4),d4
	swap	d4
    4480:	4844           	swap d4
	lsr.l	d5, d4
    4482:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    4484:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    4488:	4284           	clr.l d4

	add.b   (a6), d5
    448a:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    448c:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    4490:	6500 0006      	bcs.w 4498 <noadditionalchar>
	addq.w  #1, a3
    4494:	524b           	addq.w #1,a3
	sub.w   #8,d5
    4496:	5145           	subq.w #8,d5

00004498 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    4498:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    449a:	51c8 ff68      	dbf d0,4404 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    449e:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    44a2:	51cb ff5c      	dbf d3,4400 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    44a6:	4cfa 7fff fdf2 	movem.l 429c <saveregs>(pc),d0-a6

	RTS
    44ac:	4e75           	rts
