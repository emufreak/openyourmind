
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
      12:	23ce 0000 63a0 	move.l a6,63a0 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,6372 <hw>
      1e:	0000 6372 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 3a75 	lea 3a75 <incbin_swfont_end+0x113>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 6376 	move.l d0,6376 <GfxBase>
	if (!GfxBase)
      34:	6700 185e      	beq.w 1894 <main+0x188e>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
      3e:	43f9 0000 3a86 	lea 3a86 <incbin_swfont_end+0x124>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 639c 	move.l d0,639c <DOSBase>
	if (!DOSBase)
      50:	6700 1836      	beq.w 1888 <main+0x1882>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 3a92 	pea 3a92 <incbin_swfont_end+0x130>
      5a:	4eb9 0000 1ac8 	jsr 1ac8 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 3aae 	move.l #15022,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 6372 	movea.l 6372 <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 3abe 	move.l #15038,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 217c 	lea 217c <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 6398 	move.l d0,6398 <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 6388 	move.l d0,6388 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 6394 	move.l d0,6394 <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 637c 	move.l d0,637c <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 622c 	cmp.l 622c <ClsSprites>,d0
      d2:	6600 16e8      	bne.w 17bc <main+0x17b6>
      d6:	206a 0004      	movea.l 4(a2),a0
      da:	b1f9 0000 6230 	cmpa.l 6230 <ClsSprites+0x4>,a0
      e0:	6600 16da      	bne.w 17bc <main+0x17b6>
      e4:	202a 0008      	move.l 8(a2),d0
      e8:	b0b9 0000 6234 	cmp.l 6234 <ClsSprites+0x8>,d0
      ee:	6600 16cc      	bne.w 17bc <main+0x17b6>
      f2:	206a 000c      	movea.l 12(a2),a0
      f6:	b1f9 0000 6238 	cmpa.l 6238 <ClsSprites+0xc>,a0
      fc:	6600 16be      	bne.w 17bc <main+0x17b6>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 623c 	cmp.l 623c <ClsSprites+0x10>,d0
     10a:	6600 16b0      	bne.w 17bc <main+0x17b6>
     10e:	206a 0014      	movea.l 20(a2),a0
     112:	b1f9 0000 6240 	cmpa.l 6240 <ClsSprites+0x14>,a0
     118:	6600 16a2      	bne.w 17bc <main+0x17b6>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 6244 	cmp.l 6244 <ClsSprites+0x18>,d0
     126:	6600 1694      	bne.w 17bc <main+0x17b6>
     12a:	206a 001c      	movea.l 28(a2),a0
     12e:	b1f9 0000 6248 	cmpa.l 6248 <ClsSprites+0x1c>,a0
     134:	6600 1686      	bne.w 17bc <main+0x17b6>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 624c 	cmp.l 624c <ClsSprites+0x20>,d0
     142:	6600 1678      	bne.w 17bc <main+0x17b6>
     146:	206a 0024      	movea.l 36(a2),a0
     14a:	b1f9 0000 6250 	cmpa.l 6250 <ClsSprites+0x24>,a0
     150:	6600 166a      	bne.w 17bc <main+0x17b6>
     154:	202a 0028      	move.l 40(a2),d0
     158:	b0b9 0000 6254 	cmp.l 6254 <ClsSprites+0x28>,d0
     15e:	6600 165c      	bne.w 17bc <main+0x17b6>
     162:	206a 002c      	movea.l 44(a2),a0
     166:	b1f9 0000 6258 	cmpa.l 6258 <ClsSprites+0x2c>,a0
     16c:	6600 164e      	bne.w 17bc <main+0x17b6>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 625c 	cmp.l 625c <ClsSprites+0x30>,d0
     17a:	6600 1640      	bne.w 17bc <main+0x17b6>
     17e:	206a 0034      	movea.l 52(a2),a0
     182:	b1f9 0000 6260 	cmpa.l 6260 <ClsSprites+0x34>,a0
     188:	6600 1632      	bne.w 17bc <main+0x17b6>
     18c:	202a 0038      	move.l 56(a2),d0
     190:	b0b9 0000 6264 	cmp.l 6264 <ClsSprites+0x38>,d0
     196:	6600 1624      	bne.w 17bc <main+0x17b6>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 6268 	cmpa.l 6268 <ClsSprites+0x3c>,a2
     1a4:	6600 1616      	bne.w 17bc <main+0x17b6>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 6398 	movea.l 6398 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 61fc 	move.l 61fc <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 164c      	bne.w 1806 <main+0x1800>
     1bc:	2028 0044      	move.l 68(a0),d0
     1c0:	b0b9 0000 6200 	cmp.l 6200 <ClScreen+0x4>,d0
     1c6:	6600 163e      	bne.w 1806 <main+0x1800>
     1ca:	2039 0000 6204 	move.l 6204 <ClScreen+0x8>,d0
     1d0:	b0a8 0048      	cmp.l 72(a0),d0
     1d4:	6600 1630      	bne.w 1806 <main+0x1800>
     1d8:	2039 0000 6208 	move.l 6208 <ClScreen+0xc>,d0
     1de:	b0a8 004c      	cmp.l 76(a0),d0
     1e2:	6600 1622      	bne.w 1806 <main+0x1800>
     1e6:	2028 0050      	move.l 80(a0),d0
     1ea:	b0b9 0000 620c 	cmp.l 620c <ClScreen+0x10>,d0
     1f0:	6600 1614      	bne.w 1806 <main+0x1800>
     1f4:	2028 0054      	move.l 84(a0),d0
     1f8:	b0b9 0000 6210 	cmp.l 6210 <ClScreen+0x14>,d0
     1fe:	6600 1606      	bne.w 1806 <main+0x1800>
     202:	2028 0058      	move.l 88(a0),d0
     206:	b0b9 0000 6214 	cmp.l 6214 <ClScreen+0x18>,d0
     20c:	6600 15f8      	bne.w 1806 <main+0x1800>
     210:	2039 0000 6218 	move.l 6218 <ClScreen+0x1c>,d0
     216:	b0a8 005c      	cmp.l 92(a0),d0
     21a:	6600 15ea      	bne.w 1806 <main+0x1800>
     21e:	2028 0060      	move.l 96(a0),d0
     222:	b0b9 0000 621c 	cmp.l 621c <ClScreen+0x20>,d0
     228:	6600 15dc      	bne.w 1806 <main+0x1800>
     22c:	2028 0064      	move.l 100(a0),d0
     230:	b0b9 0000 6220 	cmp.l 6220 <ClScreen+0x24>,d0
     236:	6600 15ce      	bne.w 1806 <main+0x1800>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 6224 	cmp.l 6224 <ClScreen+0x28>,d0
     244:	6600 15c0      	bne.w 1806 <main+0x1800>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 6228 	cmpa.l 6228 <ClScreen+0x2c>,a0
     252:	6600 15b2      	bne.w 1806 <main+0x1800>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     256:	23fc 0004 0000 	move.l #262144,638c <DrawBuffer>
     25c:	0000 638c 
  ViewBuffer = (ULONG *)0x50000;
     260:	23fc 0005 0000 	move.l #327680,6380 <ViewBuffer>
     266:	0000 6380 
  SetBplPointers();
     26a:	45f9 0000 2cfc 	lea 2cfc <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,638c <DrawBuffer>
     278:	0000 638c 
     27c:	6700 15da      	beq.w 1858 <main+0x1852>
    Write( Output(), 
     280:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 3ac1 	move.l #15041,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     29e:	2079 0000 6398 	movea.l 6398 <Copperlist1>,a0
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 3afd 	move.l #15101,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 6398 	movea.l 6398 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 3b3a 	move.l #15162,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 6398 	movea.l 6398 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2028 0078      	move.l 120(a0),d0
     304:	b0b9 0000 61f4 	cmp.l 61f4 <ClColor>,d0
     30a:	6600 14d2      	bne.w 17de <main+0x17d8>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 61f8 	cmp.l 61f8 <ClColor+0x4>,d0
     318:	6600 14c4      	bne.w 17de <main+0x17d8>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 3b99 	move.l #15257,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 2af4 	lea 2af4 <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2079 0000 6388 	movea.l 6388 <DrawCopper>,a0
     350:	b1f9 0000 6394 	cmpa.l 6394 <Copperlist2>,a0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 3bbc 	move.l #15292,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 2d28 	lea 2d28 <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 638c 	move.l 638c <DrawBuffer>,d0
     384:	b0b9 0000 6390 	cmp.l 6390 <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 3bd2 	move.l #15314,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2079 0000 6388 	movea.l 6388 <DrawCopper>,a0
     3b0:	b1f9 0000 6398 	cmpa.l 6398 <Copperlist1>,a0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 3c0a 	move.l #15370,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2039 0000 6380 	move.l 6380 <ViewBuffer>,d0
     3de:	b0b9 0000 6384 	cmp.l 6384 <Bitplane2>,d0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 3c44 	move.l #15428,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2079 0000 637c 	movea.l 637c <ViewCopper>,a0
     40a:	b1f9 0000 6394 	cmpa.l 6394 <Copperlist2>,a0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 3c7d 	move.l #15485,d2
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
     434:	2079 0000 637c 	movea.l 637c <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     44c:	b0b9 0000 6384 	cmp.l 6384 <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 3cb8 	move.l #15544,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     476:	2079 0000 637c 	movea.l 637c <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     48e:	b0b9 0000 6390 	cmp.l 6390 <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 3d01 	move.l #15617,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4b8:	2079 0000 637c 	movea.l 637c <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4d0:	b0b9 0000 6384 	cmp.l 6384 <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 3d4b 	move.l #15691,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	2c3c 0000 2e66 	move.l #11878,d6
     506:	2046           	movea.l d6,a0
     508:	4e90           	jsr (a0)
  TestZoom4Picture();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     50a:	47f9 0000 2b1a 	lea 2b1a <PrepareDisplayZoom>,a3
     510:	4e93           	jsr (a3)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     512:	4878 0010      	pea 10 <main+0xa>
     516:	4879 0000 622c 	pea 622c <ClsSprites>
     51c:	42a7           	clr.l -(sp)
     51e:	2f39 0000 6398 	move.l 6398 <Copperlist1>,-(sp)
     524:	283c 0000 1fa6 	move.l #8102,d4
     52a:	2044           	movea.l d4,a0
     52c:	4e90           	jsr (a0)
     52e:	4fef 0018      	lea 24(sp),sp
     532:	4a80           	tst.l d0
     534:	661e           	bne.s 554 <main+0x54e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     536:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     53c:	4eae ffc4      	jsr -60(a6)
     540:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     546:	2200           	move.l d0,d1
     548:	243c 0000 3d94 	move.l #15764,d2
     54e:	762c           	moveq #44,d3
     550:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     554:	4878 000c      	pea c <main+0x6>
     558:	4879 0000 61c4 	pea 61c4 <ClScreenZoom>
     55e:	4878 0010      	pea 10 <main+0xa>
     562:	2f39 0000 6398 	move.l 6398 <Copperlist1>,-(sp)
     568:	2044           	movea.l d4,a0
     56a:	4e90           	jsr (a0)
     56c:	4fef 0010      	lea 16(sp),sp
     570:	4a80           	tst.l d0
     572:	661e           	bne.s 592 <main+0x58c>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     574:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     57a:	4eae ffc4      	jsr -60(a6)
     57e:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     584:	2200           	move.l d0,d1
     586:	243c 0000 3dca 	move.l #15818,d2
     58c:	7636           	moveq #54,d3
     58e:	4eae ffd0      	jsr -48(a6)
  //ZoomHorizontal = 10;
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     592:	2079 0000 6388 	movea.l 6388 <DrawCopper>,a0
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
     5ae:	23fc 0005 0000 	move.l #327680,638c <DrawBuffer>
     5b4:	0000 638c 
  ViewBuffer = (ULONG *) tmp;
     5b8:	23fc 0004 0000 	move.l #262144,6380 <ViewBuffer>
     5be:	0000 6380 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5c2:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c8:	4878 001c      	pea 1c <main+0x16>
     5cc:	2f39 0000 6398 	move.l 6398 <Copperlist1>,-(sp)
     5d2:	2a3c 0000 1f88 	move.l #8072,d5
     5d8:	2045           	movea.l d5,a0
     5da:	4e90           	jsr (a0)
     5dc:	4fef 000c      	lea 12(sp),sp
     5e0:	4a80           	tst.l d0
     5e2:	661e           	bne.s 602 <main+0x5fc>
    Write(Output(), 
     5e4:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     5ea:	4eae ffc4      	jsr -60(a6)
     5ee:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     5f4:	2200           	move.l d0,d1
     5f6:	243c 0000 3afd 	move.l #15101,d2
     5fc:	763c           	moveq #60,d3
     5fe:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     602:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     608:	4878 001d      	pea 1d <main+0x17>
     60c:	2f39 0000 6398 	move.l 6398 <Copperlist1>,-(sp)
     612:	2045           	movea.l d5,a0
     614:	4e90           	jsr (a0)
     616:	4fef 000c      	lea 12(sp),sp
     61a:	4a80           	tst.l d0
     61c:	661e           	bne.s 63c <main+0x636>
    Write(Output(), 
     61e:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     624:	4eae ffc4      	jsr -60(a6)
     628:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     62e:	2200           	move.l d0,d1
     630:	243c 0000 3b3a 	move.l #15162,d2
     636:	763c           	moveq #60,d3
     638:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     63c:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     642:	4878 001e      	pea 1e <main+0x18>
     646:	2f39 0000 6398 	move.l 6398 <Copperlist1>,-(sp)
     64c:	2045           	movea.l d5,a0
     64e:	4e90           	jsr (a0)
     650:	4fef 000c      	lea 12(sp),sp
     654:	4a80           	tst.l d0
     656:	661e           	bne.s 676 <main+0x670>
    Write(Output(), 
     658:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     65e:	4eae ffc4      	jsr -60(a6)
     662:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     668:	2200           	move.l d0,d1
     66a:	243c 0000 3e01 	move.l #15873,d2
     670:	763c           	moveq #60,d3
     672:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     676:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     67c:	4878 001f      	pea 1f <main+0x19>
     680:	2f39 0000 6398 	move.l 6398 <Copperlist1>,-(sp)
     686:	2045           	movea.l d5,a0
     688:	4e90           	jsr (a0)
     68a:	4fef 000c      	lea 12(sp),sp
     68e:	4a80           	tst.l d0
     690:	661e           	bne.s 6b0 <main+0x6aa>
    Write(Output(), 
     692:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     698:	4eae ffc4      	jsr -60(a6)
     69c:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     6a2:	2200           	move.l d0,d1
     6a4:	243c 0000 3e3e 	move.l #15934,d2
     6aa:	763c           	moveq #60,d3
     6ac:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6b0:	4878 0002      	pea 2 <_start+0x2>
     6b4:	4879 0000 61f4 	pea 61f4 <ClColor>
     6ba:	4878 0020      	pea 20 <main+0x1a>
     6be:	2f39 0000 6398 	move.l 6398 <Copperlist1>,-(sp)
     6c4:	2044           	movea.l d4,a0
     6c6:	4e90           	jsr (a0)
     6c8:	4fef 0010      	lea 16(sp),sp
     6cc:	4a80           	tst.l d0
     6ce:	661e           	bne.s 6ee <main+0x6e8>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6d0:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     6d6:	4eae ffc4      	jsr -60(a6)
     6da:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     6e0:	2200           	move.l d0,d1
     6e2:	243c 0000 3b77 	move.l #15223,d2
     6e8:	7621           	moveq #33,d3
     6ea:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6ee:	4878 0040      	pea 40 <main+0x3a>
     6f2:	4879 0000 4184 	pea 4184 <rundemo.c.d99b7c69+0x4eb>
     6f8:	486d ffc0      	pea -64(a5)
     6fc:	4eb9 0000 2f1e 	jsr 2f1e <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     702:	4878 0010      	pea 10 <main+0xa>
     706:	486d ffc0      	pea -64(a5)
     70a:	4878 0022      	pea 22 <main+0x1c>
     70e:	2f39 0000 6398 	move.l 6398 <Copperlist1>,-(sp)
     714:	2044           	movea.l d4,a0
     716:	4e90           	jsr (a0)
     718:	4fef 001c      	lea 28(sp),sp
     71c:	4a80           	tst.l d0
     71e:	661e           	bne.s 73e <main+0x738>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     720:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     726:	4eae ffc4      	jsr -60(a6)
     72a:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     730:	2200           	move.l d0,d1
     732:	243c 0000 3e7b 	move.l #15995,d2
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
     762:	2f39 0000 6398 	move.l 6398 <Copperlist1>,-(sp)
     768:	2044           	movea.l d4,a0
     76a:	4e90           	jsr (a0)
     76c:	4fef 0010      	lea 16(sp),sp
     770:	4a80           	tst.l d0
     772:	661e           	bne.s 792 <main+0x78c>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     774:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     77a:	4eae ffc4      	jsr -60(a6)
     77e:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     784:	2200           	move.l d0,d1
     786:	243c 0000 3e9d 	move.l #16029,d2
     78c:	762c           	moveq #44,d3
     78e:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     792:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdcd7e>
     796:	4878 2922      	pea 2922 <ClbuildZoom+0xf8>
     79a:	2f39 0000 6398 	move.l 6398 <Copperlist1>,-(sp)
     7a0:	2045           	movea.l d5,a0
     7a2:	4e90           	jsr (a0)
     7a4:	4fef 000c      	lea 12(sp),sp
     7a8:	4a80           	tst.l d0
     7aa:	661e           	bne.s 7ca <main+0x7c4>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     7ac:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     7b2:	4eae ffc4      	jsr -60(a6)
     7b6:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     7bc:	2200           	move.l d0,d1
     7be:	243c 0000 3b99 	move.l #15257,d2
     7c4:	7622           	moveq #34,d3
     7c6:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7ca:	2f3c 0001 6800 	move.l #92160,-(sp)
     7d0:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7d6:	2046           	movea.l d6,a0
     7d8:	4e90           	jsr (a0)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7da:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
     7e0:	7004           	moveq #4,d0
     7e2:	7202           	moveq #2,d1
     7e4:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
     7e8:	33fc 0010 0000 	move.w #16,637a <ZoomHorizontal>
     7ee:	637a 

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     7f0:	4e93           	jsr (a3)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7f2:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
     7f8:	203c 0000 c800 	move.l #51200,d0
     7fe:	7202           	moveq #2,d1
     800:	4eae ff3a      	jsr -198(a6)
     804:	2440           	movea.l d0,a2
     806:	23c0 0000 635c 	move.l d0,635c <Zoom_Source>
  if( Zoom_Source == 0) {
     80c:	508f           	addq.l #8,sp
     80e:	6700 1108      	beq.w 1918 <main+0x1912>
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
     830:	2439 0000 638c 	move.l 638c <DrawBuffer>,d2
    srca = source + 1;
     836:	2600           	move.l d0,d3
     838:	5483           	addq.l #2,d3
  WaitBlit();
     83a:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
     840:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     844:	2079 0000 6372 	movea.l 6372 <hw>,a0
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
     890:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
     896:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     89a:	2479 0000 638c 	movea.l 638c <DrawBuffer>,a2
  if( *destination != 0x0180) {
     8a0:	0c6a 0180 0002 	cmpi.w #384,2(a2)
     8a6:	671e           	beq.s 8c6 <main+0x8c0>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
     8a8:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     8ae:	4eae ffc4      	jsr -60(a6)
     8b2:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     8b8:	2200           	move.l d0,d1
     8ba:	243c 0000 3f02 	move.l #16130,d2
     8c0:	761c           	moveq #28,d3
     8c2:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8c6:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
     8cc:	671e           	beq.s 8ec <main+0x8e6>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
     8ce:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     8d4:	4eae ffc4      	jsr -60(a6)
     8d8:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     8de:	2200           	move.l d0,d1
     8e0:	243c 0000 3f1f 	move.l #16159,d2
     8e6:	761c           	moveq #28,d3
     8e8:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     8ec:	2079 0000 638c 	movea.l 638c <DrawBuffer>,a0
     8f2:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
     8f8:	671e           	beq.s 918 <main+0x912>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
     8fa:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     900:	4eae ffc4      	jsr -60(a6)
     904:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     90a:	2200           	move.l d0,d1
     90c:	243c 0000 3f3c 	move.l #16188,d2
     912:	761a           	moveq #26,d3
     914:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     918:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
     91e:	2279 0000 635c 	movea.l 635c <Zoom_Source>,a1
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
     942:	2079 0000 638c 	movea.l 638c <DrawBuffer>,a0
  *destination= 0x0000;
     948:	4250           	clr.w (a0)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     94a:	317c 000f 0030 	move.w #15,48(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     950:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     956:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
     95c:	203c 0000 c800 	move.l #51200,d0
     962:	7202           	moveq #2,d1
     964:	4eae ff3a      	jsr -198(a6)
     968:	2440           	movea.l d0,a2
     96a:	23c0 0000 635c 	move.l d0,635c <Zoom_Source>
  if( Zoom_Source == 0) {
     970:	6700 0ff8      	beq.w 196a <main+0x1964>
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
     984:	2439 0000 638c 	move.l 638c <DrawBuffer>,d2
  WaitBlit();
     98a:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
     990:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     994:	2079 0000 6372 	movea.l 6372 <hw>,a0
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
     9dc:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
     9e2:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     9e6:	2479 0000 638c 	movea.l 638c <DrawBuffer>,a2
  if( *destination != 0x4000)
     9ec:	0c52 4000      	cmpi.w #16384,(a2)
     9f0:	671e           	beq.s a10 <main+0xa0a>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     9f2:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     9f8:	4eae ffc4      	jsr -60(a6)
     9fc:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     a02:	2200           	move.l d0,d1
     a04:	243c 0000 3f57 	move.l #16215,d2
     a0a:	7629           	moveq #41,d3
     a0c:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x400f)
     a10:	0c6a 400f 0030 	cmpi.w #16399,48(a2)
     a16:	671e           	beq.s a36 <main+0xa30>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     a18:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     a1e:	4eae ffc4      	jsr -60(a6)
     a22:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     a28:	2200           	move.l d0,d1
     a2a:	243c 0000 3f81 	move.l #16257,d2
     a30:	762a           	moveq #42,d3
     a32:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     a36:	2479 0000 638c 	movea.l 638c <DrawBuffer>,a2
     a3c:	0c6a 400f 47d0 	cmpi.w #16399,18384(a2)
     a42:	6724           	beq.s a68 <main+0xa62>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     a44:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     a4a:	4eae ffc4      	jsr -60(a6)
     a4e:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     a54:	2200           	move.l d0,d1
     a56:	243c 0000 3fac 	move.l #16300,d2
     a5c:	7628           	moveq #40,d3
     a5e:	4eae ffd0      	jsr -48(a6)
     a62:	2479 0000 638c 	movea.l 638c <DrawBuffer>,a2

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
     a76:	2679 0000 635c 	movea.l 635c <Zoom_Source>,a3
  *tstsource = 0xffff;
     a7c:	36bc ffff      	move.w #-1,(a3)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     a80:	377c ffff 0030 	move.w #-1,48(a3)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0x8000;
     a86:	377c 8000 47d0 	move.w #-32768,18384(a3)
  WaitBlit();
     a8c:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
     a92:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     a96:	2079 0000 6372 	movea.l 6372 <hw>,a0
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
     ade:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
     ae4:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     ae8:	2479 0000 638c 	movea.l 638c <DrawBuffer>,a2
  if( *destination != 0x8000)
     aee:	0c52 8000      	cmpi.w #-32768,(a2)
     af2:	671e           	beq.s b12 <main+0xb0c>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     af4:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     afa:	4eae ffc4      	jsr -60(a6)
     afe:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     b04:	2200           	move.l d0,d1
     b06:	243c 0000 3fd5 	move.l #16341,d2
     b0c:	7628           	moveq #40,d3
     b0e:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x800f)
     b12:	0c6a 800f 0030 	cmpi.w #-32753,48(a2)
     b18:	671e           	beq.s b38 <main+0xb32>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     b1a:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     b20:	4eae ffc4      	jsr -60(a6)
     b24:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     b2a:	2200           	move.l d0,d1
     b2c:	243c 0000 3ffe 	move.l #16382,d2
     b32:	7629           	moveq #41,d3
     b34:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     b38:	2079 0000 638c 	movea.l 638c <DrawBuffer>,a0
     b3e:	0c68 800f 47d0 	cmpi.w #-32753,18384(a0)
     b44:	671e           	beq.s b64 <main+0xb5e>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     b46:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     b4c:	4eae ffc4      	jsr -60(a6)
     b50:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     b56:	2200           	move.l d0,d1
     b58:	243c 0000 4028 	move.l #16424,d2
     b5e:	7627           	moveq #39,d3
     b60:	4eae ffd0      	jsr -48(a6)

  FreeMem( Zoom_Source, 40*256*5);
     b64:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
     b6a:	2279 0000 635c 	movea.l 635c <Zoom_Source>,a1
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
     b8c:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
     b92:	203c 0000 05a0 	move.l #1440,d0
     b98:	7202           	moveq #2,d1
     b9a:	4eae ff3a      	jsr -198(a6)
     b9e:	2440           	movea.l d0,a2
  if( source == 0) {
     ba0:	4a80           	tst.l d0
     ba2:	6700 0d1a      	beq.w 18be <main+0x18b8>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     ba6:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
     bac:	203c 0000 05a0 	move.l #1440,d0
     bb2:	7202           	moveq #2,d1
     bb4:	4eae ff3a      	jsr -198(a6)
     bb8:	2640           	movea.l d0,a3
  if( destination == 0) {
     bba:	4a80           	tst.l d0
     bbc:	6700 0d00      	beq.w 18be <main+0x18b8>
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
     d06:	4eb9 0000 2fb0 	jsr 2fb0 <memset>
  WaitBlit();
     d0c:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
     d12:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     d16:	2079 0000 6372 	movea.l 6372 <hw>,a0
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
     d56:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
     d5c:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     d60:	4fef 000c      	lea 12(sp),sp
     d64:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
     d6a:	671e           	beq.s d8a <main+0xd84>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     d6c:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     d72:	4eae ffc4      	jsr -60(a6)
     d76:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     d7c:	2200           	move.l d0,d1
     d7e:	243c 0000 4086 	move.l #16518,d2
     d84:	761f           	moveq #31,d3
     d86:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     d8a:	0c6b aaaa 0032 	cmpi.w #-21846,50(a3)
     d90:	671e           	beq.s db0 <main+0xdaa>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     d92:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     d98:	4eae ffc4      	jsr -60(a6)
     d9c:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
     da2:	2200           	move.l d0,d1
     da4:	243c 0000 40a6 	move.l #16550,d2
     daa:	7620           	moveq #32,d3
     dac:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     db0:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
     db6:	224a           	movea.l a2,a1
     db8:	203c 0000 05a0 	move.l #1440,d0
     dbe:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     dc2:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
     dc8:	224b           	movea.l a3,a1
     dca:	203c 0000 05a0 	move.l #1440,d0
     dd0:	4eae ff2e      	jsr -210(a6)
   0100 1100 1101 0101 0101 0101 0011 0011 0101 0101 0101
   4    c    d    5    5    5    3    3    5    5    5
*/

void TestZoom4Picture() {
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dd4:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
     dda:	203c 0000 3740 	move.l #14144,d0
     de0:	7202           	moveq #2,d1
     de2:	4eae ff3a      	jsr -198(a6)
     de6:	2440           	movea.l d0,a2
  if( source == 0) {
     de8:	4a80           	tst.l d0
     dea:	6700 0b0a      	beq.w 18f6 <main+0x18f0>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dee:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
     df4:	203c 0000 3740 	move.l #14144,d0
     dfa:	7202           	moveq #2,d1
     dfc:	4eae ff3a      	jsr -198(a6)
     e00:	2b40 ffb0      	move.l d0,-80(a5)
  if( destination == 0) {
     e04:	6700 0bb0      	beq.w 19b6 <main+0x19b0>
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
     ee2:	4eb9 0000 23da 	jsr 23da <Zoom_ZoomIntoPicture>
  WaitBlit();
     ee8:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
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
     f12:	49f9 0000 1e72 	lea 1e72 <TestRow.constprop.2>,a4
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
     f3e:	6600 0910      	bne.w 1850 <main+0x184a>
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
     f72:	4eb9 0000 23da 	jsr 23da <Zoom_ZoomIntoPicture>
  WaitBlit();
     f78:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
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
     f94:	47f9 0000 1d5c 	lea 1d5c <TestRow.constprop.3>,a3
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
  valactual += ZMLINESIZE/2;
     fdc:	41ea 01b4      	lea 436(a2),a0
     fe0:	2b48 ffac      	move.l a0,-84(a5)
  TestRow( valsupposed, valactual, 0x0000, 10);
     fe4:	2f08           	move.l a0,-(sp)
     fe6:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 11);
     fe8:	4fef 0024      	lea 36(sp),sp
     fec:	4878 000b      	pea b <main+0x5>
     ff0:	42a7           	clr.l -(sp)
     ff2:	486a 01e4      	pea 484(a2)
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
    10f0:	4eb9 0000 23da 	jsr 23da <Zoom_ZoomIntoPicture>
  WaitBlit();
    10f6:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    10fc:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom3;
  mask = 0x0000;
  
  TestRow( valsupposed, valactual, 0xffff, 0);
    1100:	42a7           	clr.l -(sp)
    1102:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1108:	2f2d ffa4      	move.l -92(a5),-(sp)
    110c:	47f9 0000 1c46 	lea 1c46 <TestRow.constprop.4>,a3
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
    12b8:	4eb9 0000 23da 	jsr 23da <Zoom_ZoomIntoPicture>
  WaitBlit();
    12be:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    12c4:	4eae ff1c      	jsr -228(a6)
    12c8:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
  valsupposed = destlinezoom4;
  mask = 0xffff;
  
  for(int i2=0;i2<9;i2++) {  
    12cc:	7400           	moveq #0,d2
  mask = 0xffff;
    12ce:	7eff           	moveq #-1,d7
    12d0:	47f9 0000 1b30 	lea 1b30 <TestRow.constprop.5>,a3
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
  for(int i2=0;i2<9;i2++) {  
    12ea:	5282           	addq.l #1,d2
    12ec:	4fef 000c      	lea 12(sp),sp
    12f0:	7009           	moveq #9,d0
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
  for(int i=0;i<2;i++) {  
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
  for(int i=0;i<2;i++) {  
    13ee:	702f           	moveq #47,d0
    13f0:	b0ad ffa4      	cmp.l -92(a5),d0
    13f4:	6600 ff14      	bne.w 130a <main+0x1304>
    13f8:	360e           	move.w a6,d3
    13fa:	246d ffa0      	movea.l -96(a5),a2
    }
  }

  TestRow( valsupposed, valactual, 0x0000, 0+9+19*13);
    13fe:	4878 0100      	pea 100 <main+0xfa>
    1402:	42a7           	clr.l -(sp)
    1404:	486a 08d4      	pea 2260(a2)
    1408:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 1+9+13*19);
    140a:	4878 0101      	pea 101 <main+0xfb>
    140e:	42a7           	clr.l -(sp)
    1410:	486a 0904      	pea 2308(a2)
    1414:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 2+9+13*19);
    1416:	4878 0102      	pea 102 <main+0xfc>
    141a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1420:	486a 0934      	pea 2356(a2)
    1424:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 3+9+13*19);
    1426:	4fef 0024      	lea 36(sp),sp
    142a:	4878 0103      	pea 103 <main+0xfd>
    142e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1434:	486a 0964      	pea 2404(a2)
    1438:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 4+9+13*19);
    143a:	4878 0104      	pea 104 <main+0xfe>
    143e:	42a7           	clr.l -(sp)
    1440:	486a 0994      	pea 2452(a2)
    1444:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 5+9+13*19);
    1446:	4878 0105      	pea 105 <main+0xff>
    144a:	42a7           	clr.l -(sp)
    144c:	486a 09c4      	pea 2500(a2)
    1450:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 6+9+13*19);
    1452:	4fef 0024      	lea 36(sp),sp
    1456:	4878 0106      	pea 106 <main+0x100>
    145a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1460:	486a 09f4      	pea 2548(a2)
    1464:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 7+9+13*19);
    1466:	4878 0107      	pea 107 <main+0x101>
    146a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1470:	486a 0a24      	pea 2596(a2)
    1474:	4e93           	jsr (a3)
  valactual += ZMLINESIZE/2; 
    1476:	45ea 0a54      	lea 2644(a2),a2
    147a:	4fef 0018      	lea 24(sp),sp
    147e:	243c 0000 0108 	move.l #264,d2

  for(int i2=0;i2<8;i2++) {  
    TestRow( valsupposed, valactual, mask, i2+8+9+13*19);
    1484:	2f02           	move.l d2,-(sp)
    1486:	3f03           	move.w d3,-(sp)
    1488:	4267           	clr.w -(sp)
    148a:	2f0a           	move.l a2,-(sp)
    148c:	4e93           	jsr (a3)
    valactual += ZMLINESIZE/2;
    148e:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    1492:	4643           	not.w d3
    1494:	5282           	addq.l #1,d2
  for(int i2=0;i2<8;i2++) {  
    1496:	4fef 000c      	lea 12(sp),sp
    149a:	0c82 0000 0110 	cmpi.l #272,d2
    14a0:	66e2           	bne.s 1484 <main+0x147e>
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
    14a2:	4eb9 0000 2d28 	jsr 2d28 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    14a8:	4878 0010      	pea 10 <main+0xa>
    14ac:	4879 0000 622c 	pea 622c <ClsSprites>
    14b2:	42a7           	clr.l -(sp)
    14b4:	2f39 0000 6398 	move.l 6398 <Copperlist1>,-(sp)
    14ba:	2044           	movea.l d4,a0
    14bc:	4e90           	jsr (a0)
    14be:	4fef 0010      	lea 16(sp),sp
    14c2:	4a80           	tst.l d0
    14c4:	661e           	bne.s 14e4 <main+0x14de>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    14c6:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    14cc:	4eae ffc4      	jsr -60(a6)
    14d0:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    14d6:	2200           	move.l d0,d1
    14d8:	243c 0000 3d94 	move.l #15764,d2
    14de:	762c           	moveq #44,d3
    14e0:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    14e4:	4878 000c      	pea c <main+0x6>
    14e8:	4879 0000 61fc 	pea 61fc <ClScreen>
    14ee:	4878 0010      	pea 10 <main+0xa>
    14f2:	2f39 0000 6398 	move.l 6398 <Copperlist1>,-(sp)
    14f8:	2044           	movea.l d4,a0
    14fa:	4e90           	jsr (a0)
    14fc:	4fef 0010      	lea 16(sp),sp
    1500:	4a80           	tst.l d0
    1502:	661e           	bne.s 1522 <main+0x151c>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    1504:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    150a:	4eae ffc4      	jsr -60(a6)
    150e:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1514:	2200           	move.l d0,d1
    1516:	243c 0000 3dca 	move.l #15818,d2
    151c:	7636           	moveq #54,d3
    151e:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    1522:	4878 0002      	pea 2 <_start+0x2>
    1526:	4879 0000 61f4 	pea 61f4 <ClColor>
    152c:	4878 001e      	pea 1e <main+0x18>
    1530:	2f39 0000 6398 	move.l 6398 <Copperlist1>,-(sp)
    1536:	2044           	movea.l d4,a0
    1538:	4e90           	jsr (a0)
    153a:	4fef 0010      	lea 16(sp),sp
    153e:	4a80           	tst.l d0
    1540:	661e           	bne.s 1560 <main+0x155a>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1542:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1548:	4eae ffc4      	jsr -60(a6)
    154c:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1552:	2200           	move.l d0,d1
    1554:	243c 0000 3b77 	move.l #15223,d2
    155a:	7621           	moveq #33,d3
    155c:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    1560:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdcd7e>
    1564:	4878 0020      	pea 20 <main+0x1a>
    1568:	2f39 0000 6398 	move.l 6398 <Copperlist1>,-(sp)
    156e:	2045           	movea.l d5,a0
    1570:	4e90           	jsr (a0)
    1572:	4fef 000c      	lea 12(sp),sp
    1576:	4a80           	tst.l d0
    1578:	661e           	bne.s 1598 <main+0x1592>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    157a:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1580:	4eae ffc4      	jsr -60(a6)
    1584:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    158a:	2200           	move.l d0,d1
    158c:	243c 0000 3b99 	move.l #15257,d2
    1592:	7622           	moveq #34,d3
    1594:	4eae ffd0      	jsr -48(a6)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    1598:	2479 0000 638c 	movea.l 638c <DrawBuffer>,a2
    159e:	4879 0000 4140 	pea 4140 <rundemo.c.d99b7c69+0x4a7>
    15a4:	2f0a           	move.l a2,-(sp)
    15a6:	4eb9 0000 19d8 	jsr 19d8 <WriteFont.constprop.6>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    15ac:	508f           	addq.l #8,sp
    15ae:	0c52 ff00      	cmpi.w #-256,(a2)
    15b2:	671e           	beq.s 15d2 <main+0x15cc>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    15b4:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    15ba:	4eae ffc4      	jsr -60(a6)
    15be:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    15c4:	2200           	move.l d0,d1
    15c6:	243c 0000 4151 	move.l #16721,d2
    15cc:	7631           	moveq #49,d3
    15ce:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    15d2:	2f3c 0000 c800 	move.l #51200,-(sp)
    15d8:	4878 0084      	pea 84 <main+0x7e>
    15dc:	2046           	movea.l d6,a0
    15de:	4e90           	jsr (a0)
  RunTests();
	Delay(50);
    15e0:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    15e6:	7232           	moveq #50,d1
    15e8:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    15ec:	247c 00f0 ff60 	movea.l #15794016,a2
    15f2:	508f           	addq.l #8,sp
    15f4:	4a92           	tst.l (a2)
    15f6:	6718           	beq.s 1610 <main+0x160a>
    15f8:	4878 0001      	pea 1 <_start+0x1>
    15fc:	47f9 0000 1a26 	lea 1a26 <warpmode.part.0>,a3
    1602:	4e93           	jsr (a3)
    1604:	588f           	addq.l #4,sp
    1606:	4a92           	tst.l (a2)
    1608:	6706           	beq.s 1610 <main+0x160a>
    160a:	42a7           	clr.l -(sp)
    160c:	4e93           	jsr (a3)
    160e:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    1610:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    1616:	23ee 0022 0000 	move.l 34(a6),6360 <ActiView>
    161c:	6360 
	OwnBlitter();
    161e:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    1622:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    1628:	4eae ff1c      	jsr -228(a6)
	Disable();
    162c:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    1632:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    1636:	2679 0000 6372 	movea.l 6372 <hw>,a3
    163c:	302b 0010      	move.w 16(a3),d0
    1640:	33c0 0000 6364 	move.w d0,6364 <SystemADKCON>
	SystemInts=hw->intenar;
    1646:	302b 001c      	move.w 28(a3),d0
    164a:	33c0 0000 6368 	move.w d0,6368 <SystemInts>
	SystemDMA=hw->dmaconr;
    1650:	302b 0002      	move.w 2(a3),d0
    1654:	33c0 0000 6366 	move.w d0,6366 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    165a:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    1660:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
    1666:	45f9 0000 2ed8 	lea 2ed8 <WaitVbl>,a2
    166c:	4e92           	jsr (a2)
	WaitVbl();
    166e:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
    1670:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    1676:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    167c:	93c9           	suba.l a1,a1
    167e:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    1682:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    1688:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    168c:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    1692:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    1696:	4e92           	jsr (a2)
	WaitVbl();
    1698:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    169a:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
    16a0:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
    16a6:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    16ac:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    16b2:	082e 0000 0129 	btst #0,297(a6)
    16b8:	6700 02d2      	beq.w 198c <main+0x1986>
		vbr = (APTR)Supervisor((void*)getvbr);
    16bc:	7ec0           	moveq #-64,d7
    16be:	de8d           	add.l a5,d7
    16c0:	cf8d           	exg d7,a5
    16c2:	4eae ffe2      	jsr -30(a6)
    16c6:	cf8d           	exg d7,a5

	VBR=GetVBR();
    16c8:	23c0 0000 636a 	move.l d0,636a <VBR.lto_priv.7>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    16ce:	2079 0000 636a 	movea.l 636a <VBR.lto_priv.7>,a0
    16d4:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    16d8:	23c2 0000 636e 	move.l d2,636e <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    16de:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
    16e0:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    16e2:	2079 0000 6372 	movea.l 6372 <hw>,a0
    16e8:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    16ec:	3028 0002      	move.w 2(a0),d0
    16f0:	0800 000e      	btst #14,d0
    16f4:	66f6           	bne.s 16ec <main+0x16e6>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    16f6:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    16fc:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    1702:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    1708:	2279 0000 636a 	movea.l 636a <VBR.lto_priv.7>,a1
    170e:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    1712:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    1718:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    171e:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    1724:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    172a:	3039 0000 6368 	move.w 6368 <SystemInts>,d0
    1730:	0040 8000      	ori.w #-32768,d0
    1734:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    1738:	3039 0000 6366 	move.w 6366 <SystemDMA>,d0
    173e:	0040 8000      	ori.w #-32768,d0
    1742:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    1746:	3039 0000 6364 	move.w 6364 <SystemADKCON>,d0
    174c:	0040 8000      	ori.w #-32768,d0
    1750:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    1754:	2279 0000 6360 	movea.l 6360 <ActiView>,a1
    175a:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    175e:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    1764:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    1768:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    176e:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    1772:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    1778:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    177c:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    1782:	4eae fe32      	jsr -462(a6)
	Enable();
    1786:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    178c:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    1790:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    1796:	2279 0000 639c 	movea.l 639c <DOSBase>,a1
    179c:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    17a0:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    17a6:	2279 0000 6376 	movea.l 6376 <GfxBase>,a1
    17ac:	4eae fe62      	jsr -414(a6)
}
    17b0:	7000           	moveq #0,d0
    17b2:	4ced 5cfc ff74 	movem.l -140(a5),d2-d7/a2-a4/a6
    17b8:	4e5d           	unlk a5
    17ba:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    17bc:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    17c2:	4eae ffc4      	jsr -60(a6)
    17c6:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    17cc:	2200           	move.l d0,d1
    17ce:	243c 0000 3d94 	move.l #15764,d2
    17d4:	762c           	moveq #44,d3
    17d6:	4eae ffd0      	jsr -48(a6)
    17da:	6000 e9cc      	bra.w 1a8 <main+0x1a2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    17de:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    17e4:	4eae ffc4      	jsr -60(a6)
    17e8:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    17ee:	2200           	move.l d0,d1
    17f0:	243c 0000 3b77 	move.l #15223,d2
    17f6:	7621           	moveq #33,d3
    17f8:	4eae ffd0      	jsr -48(a6)
    17fc:	2079 0000 6398 	movea.l 6398 <Copperlist1>,a0
    1802:	6000 eb18      	bra.w 31c <main+0x316>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    1806:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    180c:	4eae ffc4      	jsr -60(a6)
    1810:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1816:	2200           	move.l d0,d1
    1818:	243c 0000 3dca 	move.l #15818,d2
    181e:	7636           	moveq #54,d3
    1820:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    1824:	23fc 0004 0000 	move.l #262144,638c <DrawBuffer>
    182a:	0000 638c 
  ViewBuffer = (ULONG *)0x50000;
    182e:	23fc 0005 0000 	move.l #327680,6380 <ViewBuffer>
    1834:	0000 6380 
  SetBplPointers();
    1838:	45f9 0000 2cfc 	lea 2cfc <SetBplPointers>,a2
    183e:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    1840:	0cb9 0005 0000 	cmpi.l #327680,638c <DrawBuffer>
    1846:	0000 638c 
    184a:	6600 ea34      	bne.w 280 <main+0x27a>
    184e:	6008           	bra.s 1858 <main+0x1852>
    1850:	7600           	moveq #0,d3
    1852:	3602           	move.w d2,d3
    1854:	6000 f6d2      	bra.w f28 <main+0xf22>
    1858:	0cb9 0004 0000 	cmpi.l #262144,6380 <ViewBuffer>
    185e:	0000 6380 
    1862:	6700 ea3a      	beq.w 29e <main+0x298>
    Write( Output(), 
    1866:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    186c:	4eae ffc4      	jsr -60(a6)
    1870:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1876:	2200           	move.l d0,d1
    1878:	243c 0000 3ac1 	move.l #15041,d2
    187e:	763b           	moveq #59,d3
    1880:	4eae ffd0      	jsr -48(a6)
    1884:	6000 ea18      	bra.w 29e <main+0x298>
		Exit(0);
    1888:	9dce           	suba.l a6,a6
    188a:	7200           	moveq #0,d1
    188c:	4eae ff70      	jsr -144(a6)
    1890:	6000 e7c2      	bra.w 54 <main+0x4e>
		Exit(0);
    1894:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    189a:	7200           	moveq #0,d1
    189c:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    18a0:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    18a6:	43f9 0000 3a86 	lea 3a86 <incbin_swfont_end+0x124>,a1
    18ac:	7000           	moveq #0,d0
    18ae:	4eae fdd8      	jsr -552(a6)
    18b2:	23c0 0000 639c 	move.l d0,639c <DOSBase>
	if (!DOSBase)
    18b8:	6600 e79a      	bne.w 54 <main+0x4e>
    18bc:	60ca           	bra.s 1888 <main+0x1882>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    18be:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    18c4:	4eae ffc4      	jsr -60(a6)
    18c8:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    18ce:	2200           	move.l d0,d1
    18d0:	243c 0000 4050 	move.l #16464,d2
    18d6:	7635           	moveq #53,d3
    18d8:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    18dc:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    18e2:	203c 0000 3740 	move.l #14144,d0
    18e8:	7202           	moveq #2,d1
    18ea:	4eae ff3a      	jsr -198(a6)
    18ee:	2440           	movea.l d0,a2
  if( source == 0) {
    18f0:	4a80           	tst.l d0
    18f2:	6600 f4fa      	bne.w dee <main+0xde8>
    Write(  Output(), 
    18f6:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    18fc:	4eae ffc4      	jsr -60(a6)
    1900:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1906:	2200           	move.l d0,d1
    1908:	243c 0000 40c7 	move.l #16583,d2
    190e:	7639           	moveq #57,d3
    1910:	4eae ffd0      	jsr -48(a6)
    return;
    1914:	6000 fb8c      	bra.w 14a2 <main+0x149c>
    Write(  Output(), 
    1918:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    191e:	4eae ffc4      	jsr -60(a6)
    1922:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1928:	2200           	move.l d0,d1
    192a:	243c 0000 3eca 	move.l #16074,d2
    1930:	7636           	moveq #54,d3
    1932:	4eae ffd0      	jsr -48(a6)
  PrepareDisplayZoom();
    1936:	4e93           	jsr (a3)
  UWORD *destination = (UWORD *)DrawBuffer;
    1938:	2079 0000 638c 	movea.l 638c <DrawBuffer>,a0
  *destination= 0x0000;
    193e:	4250           	clr.w (a0)
  *destination= 0x000f;
    1940:	317c 000f 0030 	move.w #15,48(a0)
  *destination = 0x000f;
    1946:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    194c:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    1952:	203c 0000 c800 	move.l #51200,d0
    1958:	7202           	moveq #2,d1
    195a:	4eae ff3a      	jsr -198(a6)
    195e:	2440           	movea.l d0,a2
    1960:	23c0 0000 635c 	move.l d0,635c <Zoom_Source>
  if( Zoom_Source == 0) {
    1966:	6600 f00c      	bne.w 974 <main+0x96e>
    Write(  Output(), 
    196a:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1970:	4eae ffc4      	jsr -60(a6)
    1974:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    197a:	2200           	move.l d0,d1
    197c:	243c 0000 3eca 	move.l #16074,d2
    1982:	7636           	moveq #54,d3
    1984:	4eae ffd0      	jsr -48(a6)
    return;
    1988:	6000 f202      	bra.w b8c <main+0xb86>
	APTR vbr = 0;
    198c:	7000           	moveq #0,d0
	VBR=GetVBR();
    198e:	23c0 0000 636a 	move.l d0,636a <VBR.lto_priv.7>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    1994:	2079 0000 636a 	movea.l 636a <VBR.lto_priv.7>,a0
    199a:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    199e:	23c2 0000 636e 	move.l d2,636e <SystemIrq>
	WaitVbl();
    19a4:	4e92           	jsr (a2)
	WaitVbl();
    19a6:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    19a8:	2079 0000 6372 	movea.l 6372 <hw>,a0
    19ae:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    19b2:	6000 fd38      	bra.w 16ec <main+0x16e6>
    Write(  Output(), 
    19b6:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    19bc:	4eae ffc4      	jsr -60(a6)
    19c0:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    19c6:	2200           	move.l d0,d1
    19c8:	243c 0000 4101 	move.l #16641,d2
    19ce:	763d           	moveq #61,d3
    19d0:	4eae ffd0      	jsr -48(a6)
    return;
    19d4:	6000 facc      	bra.w 14a2 <main+0x149c>

000019d8 <WriteFont.constprop.6>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    19d8:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    19dc:	206f 0008      	movea.l 8(sp),a0
    19e0:	1010           	move.b (a0),d0
    19e2:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    19e6:	4880           	ext.w d0
    19e8:	48c0           	ext.l d0
    19ea:	e788           	lsl.l #3,d0
  fntptr += charpos;
    19ec:	4880           	ext.w d0
    19ee:	3040           	movea.w d0,a0
    19f0:	d1c8           	adda.l a0,a0
    19f2:	d1fc 0000 631c 	adda.l #25372,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    19f8:	3290           	move.w (a0),(a1)
    19fa:	3368 0002 0050 	move.w 2(a0),80(a1)
    1a00:	3368 0004 00a0 	move.w 4(a0),160(a1)
    1a06:	3368 0006 00f0 	move.w 6(a0),240(a1)
    1a0c:	3368 0008 0140 	move.w 8(a0),320(a1)
    1a12:	3368 000a 0190 	move.w 10(a0),400(a1)
    1a18:	3368 000c 01e0 	move.w 12(a0),480(a1)
    1a1e:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    1a24:	4e75           	rts

00001a26 <warpmode.part.0>:
void warpmode(int on) 
    1a26:	598f           	subq.l #4,sp
    1a28:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    1a2a:	4aaf 000c      	tst.l 12(sp)
    1a2e:	674c           	beq.s 1a7c <warpmode.part.0+0x56>
    1a30:	4878 0001      	pea 1 <_start+0x1>
    1a34:	740b           	moveq #11,d2
    1a36:	d48f           	add.l sp,d2
    1a38:	2f02           	move.l d2,-(sp)
    1a3a:	42a7           	clr.l -(sp)
    1a3c:	4879 0000 3996 	pea 3996 <incbin_swfont_end+0x34>
    1a42:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdcd7f>
    1a46:	4878 0052      	pea 52 <main+0x4c>
    1a4a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecce0>
    1a50:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1a54:	203c 0000 397c 	move.l #14716,d0
    1a5a:	4878 0001      	pea 1 <_start+0x1>
    1a5e:	2f02           	move.l d2,-(sp)
    1a60:	42a7           	clr.l -(sp)
    1a62:	2f00           	move.l d0,-(sp)
    1a64:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdcd7f>
    1a68:	4878 0052      	pea 52 <main+0x4c>
    1a6c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecce0>
	}
}
    1a72:	4fef 0018      	lea 24(sp),sp
    1a76:	241f           	move.l (sp)+,d2
    1a78:	588f           	addq.l #4,sp
    1a7a:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    1a7c:	4878 0001      	pea 1 <_start+0x1>
    1a80:	740b           	moveq #11,d2
    1a82:	d48f           	add.l sp,d2
    1a84:	2f02           	move.l d2,-(sp)
    1a86:	42a7           	clr.l -(sp)
    1a88:	4879 0000 39a0 	pea 39a0 <incbin_swfont_end+0x3e>
    1a8e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdcd7f>
    1a92:	4878 0052      	pea 52 <main+0x4c>
    1a96:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecce0>
    1a9c:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1aa0:	203c 0000 3963 	move.l #14691,d0
    1aa6:	4878 0001      	pea 1 <_start+0x1>
    1aaa:	2f02           	move.l d2,-(sp)
    1aac:	42a7           	clr.l -(sp)
    1aae:	2f00           	move.l d0,-(sp)
    1ab0:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdcd7f>
    1ab4:	4878 0052      	pea 52 <main+0x4c>
    1ab8:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecce0>
}
    1abe:	4fef 0018      	lea 24(sp),sp
    1ac2:	241f           	move.l (sp)+,d2
    1ac4:	588f           	addq.l #4,sp
    1ac6:	4e75           	rts

00001ac8 <KPrintF>:
{
    1ac8:	4fef ff80      	lea -128(sp),sp
    1acc:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    1ad0:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeecce0>
    1ad6:	6734           	beq.s 1b0c <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    1ad8:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    1ade:	206f 0090      	movea.l 144(sp),a0
    1ae2:	43ef 0094      	lea 148(sp),a1
    1ae6:	45f9 0000 319c 	lea 319c <PutChar>,a2
    1aec:	47ef 000c      	lea 12(sp),a3
    1af0:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    1af4:	2f0b           	move.l a3,-(sp)
    1af6:	4878 0056      	pea 56 <main+0x50>
    1afa:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecce0>
    1b00:	508f           	addq.l #8,sp
}
    1b02:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1b06:	4fef 0080      	lea 128(sp),sp
    1b0a:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    1b0c:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    1b12:	206f 0090      	movea.l 144(sp),a0
    1b16:	43ef 0094      	lea 148(sp),a1
    1b1a:	45f9 0000 318e 	lea 318e <KPutCharX>,a2
    1b20:	97cb           	suba.l a3,a3
    1b22:	4eae fdf6      	jsr -522(a6)
}
    1b26:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1b2a:	4fef 0080      	lea 128(sp),sp
    1b2e:	4e75           	rts

00001b30 <TestRow.constprop.5>:
  
  return;
 
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1b30:	4fef ff94      	lea -108(sp),sp
    1b34:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1b38:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    1b3e:	3c2f 002e      	move.w 46(sp),d6
                                                             int numberofline) {    
  
  char str[ 100] = { 0 };
    1b42:	7a34           	moveq #52,d5
    1b44:	da8f           	add.l sp,d5
    1b46:	4878 0064      	pea 64 <main+0x5e>
    1b4a:	42a7           	clr.l -(sp)
    1b4c:	2f05           	move.l d5,-(sp)
    1b4e:	4eba 1460      	jsr 2fb0 <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
    1b52:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1b58:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
    1b5c:	2a6f 009c      	movea.l 156(sp),a5

  for(int i=0;i<21;i++) {
    1b60:	7800           	moveq #0,d4
  testpattern += 0;
    1b62:	49f9 0000 62f0 	lea 62f0 <destlinezoom4>,a4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1b68:	2e3c 0000 39ab 	move.l #14763,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    1b6e:	301c           	move.w (a4)+,d0
    1b70:	bd40           	eor.w d6,d0
    1b72:	b05d           	cmp.w (a5)+,d0
    1b74:	6736           	beq.s 1bac <TestRow.constprop.5+0x7c>
      data[0] = i;
    1b76:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1b7a:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    1b80:	2047           	movea.l d7,a0
    1b82:	43ef 0030      	lea 48(sp),a1
    1b86:	45f9 0000 319c 	lea 319c <PutChar>,a2
    1b8c:	2645           	movea.l d5,a3
    1b8e:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    1b92:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1b98:	4eae ffc4      	jsr -60(a6)
    1b9c:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1ba2:	2200           	move.l d0,d1
    1ba4:	2405           	move.l d5,d2
    1ba6:	7664           	moveq #100,d3
    1ba8:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    1bac:	5284           	addq.l #1,d4
    1bae:	b9fc 0000 631a 	cmpa.l #25370,a4
    1bb4:	66b8           	bne.s 1b6e <TestRow.constprop.5+0x3e>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1bb6:	3039 0000 631a 	move.w 631a <destlinezoom4+0x2a>,d0
    1bbc:	322f 002e      	move.w 46(sp),d1
    1bc0:	b340           	eor.w d1,d0
    1bc2:	206f 009c      	movea.l 156(sp),a0
    1bc6:	3228 002a      	move.w 42(a0),d1
    1bca:	b340           	eor.w d1,d0
    1bcc:	0240 ff00      	andi.w #-256,d0
    1bd0:	660a           	bne.s 1bdc <TestRow.constprop.5+0xac>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
    1bd2:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1bd6:	4fef 006c      	lea 108(sp),sp
    1bda:	4e75           	rts
    data[0] = 21;
    1bdc:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    1be2:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    1be8:	41f9 0000 39ab 	lea 39ab <incbin_swfont_end+0x49>,a0
    1bee:	43ef 0030      	lea 48(sp),a1
    1bf2:	45f9 0000 319c 	lea 319c <PutChar>,a2
    1bf8:	47ef 0034      	lea 52(sp),a3
    1bfc:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1c00:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1c06:	4eae ffc4      	jsr -60(a6)
    1c0a:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1c10:	2200           	move.l d0,d1
    1c12:	240b           	move.l a3,d2
    1c14:	7664           	moveq #100,d3
    1c16:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1c1a:	206f 009c      	movea.l 156(sp),a0
    1c1e:	7000           	moveq #0,d0
    1c20:	3028 002a      	move.w 42(a0),d0
    1c24:	2f00           	move.l d0,-(sp)
    1c26:	3039 0000 631a 	move.w 631a <destlinezoom4+0x2a>,d0
    1c2c:	2f00           	move.l d0,-(sp)
    1c2e:	4879 0000 39db 	pea 39db <incbin_swfont_end+0x79>
    1c34:	4eba fe92      	jsr 1ac8 <KPrintF>(pc)
    1c38:	4fef 000c      	lea 12(sp),sp
}
    1c3c:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1c40:	4fef 006c      	lea 108(sp),sp
    1c44:	4e75           	rts

00001c46 <TestRow.constprop.4>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1c46:	4fef ff94      	lea -108(sp),sp
    1c4a:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1c4e:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    1c54:	3c2f 002e      	move.w 46(sp),d6
  char str[ 100] = { 0 };
    1c58:	7a34           	moveq #52,d5
    1c5a:	da8f           	add.l sp,d5
    1c5c:	4878 0064      	pea 64 <main+0x5e>
    1c60:	42a7           	clr.l -(sp)
    1c62:	2f05           	move.l d5,-(sp)
    1c64:	4eba 134a      	jsr 2fb0 <memset>(pc)
  data[1] = numberofline;
    1c68:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1c6e:	4fef 000c      	lea 12(sp),sp
  destination += 0;
    1c72:	2a6f 009c      	movea.l 156(sp),a5
  for(int i=0;i<21;i++) {
    1c76:	7800           	moveq #0,d4
  testpattern += 0;
    1c78:	49f9 0000 62c4 	lea 62c4 <destlinezoom3>,a4
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1c7e:	2e3c 0000 39ab 	move.l #14763,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    1c84:	301c           	move.w (a4)+,d0
    1c86:	bd40           	eor.w d6,d0
    1c88:	b05d           	cmp.w (a5)+,d0
    1c8a:	6736           	beq.s 1cc2 <TestRow.constprop.4+0x7c>
      data[0] = i;
    1c8c:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1c90:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    1c96:	2047           	movea.l d7,a0
    1c98:	43ef 0030      	lea 48(sp),a1
    1c9c:	45f9 0000 319c 	lea 319c <PutChar>,a2
    1ca2:	2645           	movea.l d5,a3
    1ca4:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1ca8:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1cae:	4eae ffc4      	jsr -60(a6)
    1cb2:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1cb8:	2200           	move.l d0,d1
    1cba:	2405           	move.l d5,d2
    1cbc:	7664           	moveq #100,d3
    1cbe:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    1cc2:	5284           	addq.l #1,d4
    1cc4:	b9fc 0000 62ee 	cmpa.l #25326,a4
    1cca:	66b8           	bne.s 1c84 <TestRow.constprop.4+0x3e>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1ccc:	3039 0000 62ee 	move.w 62ee <destlinezoom3+0x2a>,d0
    1cd2:	322f 002e      	move.w 46(sp),d1
    1cd6:	b340           	eor.w d1,d0
    1cd8:	206f 009c      	movea.l 156(sp),a0
    1cdc:	3228 002a      	move.w 42(a0),d1
    1ce0:	b340           	eor.w d1,d0
    1ce2:	0240 ff00      	andi.w #-256,d0
    1ce6:	660a           	bne.s 1cf2 <TestRow.constprop.4+0xac>
}
    1ce8:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1cec:	4fef 006c      	lea 108(sp),sp
    1cf0:	4e75           	rts
    data[0] = 21;
    1cf2:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    1cf8:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    1cfe:	41f9 0000 39ab 	lea 39ab <incbin_swfont_end+0x49>,a0
    1d04:	43ef 0030      	lea 48(sp),a1
    1d08:	45f9 0000 319c 	lea 319c <PutChar>,a2
    1d0e:	47ef 0034      	lea 52(sp),a3
    1d12:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1d16:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1d1c:	4eae ffc4      	jsr -60(a6)
    1d20:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1d26:	2200           	move.l d0,d1
    1d28:	240b           	move.l a3,d2
    1d2a:	7664           	moveq #100,d3
    1d2c:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1d30:	206f 009c      	movea.l 156(sp),a0
    1d34:	7000           	moveq #0,d0
    1d36:	3028 002a      	move.w 42(a0),d0
    1d3a:	2f00           	move.l d0,-(sp)
    1d3c:	3039 0000 62ee 	move.w 62ee <destlinezoom3+0x2a>,d0
    1d42:	2f00           	move.l d0,-(sp)
    1d44:	4879 0000 39db 	pea 39db <incbin_swfont_end+0x79>
    1d4a:	4eba fd7c      	jsr 1ac8 <KPrintF>(pc)
    1d4e:	4fef 000c      	lea 12(sp),sp
}
    1d52:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1d56:	4fef 006c      	lea 108(sp),sp
    1d5a:	4e75           	rts

00001d5c <TestRow.constprop.3>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1d5c:	4fef ff94      	lea -108(sp),sp
    1d60:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1d64:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    1d6a:	3c2f 002e      	move.w 46(sp),d6
  char str[ 100] = { 0 };
    1d6e:	7a34           	moveq #52,d5
    1d70:	da8f           	add.l sp,d5
    1d72:	4878 0064      	pea 64 <main+0x5e>
    1d76:	42a7           	clr.l -(sp)
    1d78:	2f05           	move.l d5,-(sp)
    1d7a:	4eba 1234      	jsr 2fb0 <memset>(pc)
  data[1] = numberofline;
    1d7e:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1d84:	4fef 000c      	lea 12(sp),sp
  destination += 0;
    1d88:	2a6f 009c      	movea.l 156(sp),a5
  for(int i=0;i<21;i++) {
    1d8c:	7800           	moveq #0,d4
  testpattern += 0;
    1d8e:	49f9 0000 6298 	lea 6298 <destlinezoom2>,a4
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1d94:	2e3c 0000 39ab 	move.l #14763,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    1d9a:	301c           	move.w (a4)+,d0
    1d9c:	bd40           	eor.w d6,d0
    1d9e:	b05d           	cmp.w (a5)+,d0
    1da0:	6736           	beq.s 1dd8 <TestRow.constprop.3+0x7c>
      data[0] = i;
    1da2:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1da6:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    1dac:	2047           	movea.l d7,a0
    1dae:	43ef 0030      	lea 48(sp),a1
    1db2:	45f9 0000 319c 	lea 319c <PutChar>,a2
    1db8:	2645           	movea.l d5,a3
    1dba:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1dbe:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1dc4:	4eae ffc4      	jsr -60(a6)
    1dc8:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1dce:	2200           	move.l d0,d1
    1dd0:	2405           	move.l d5,d2
    1dd2:	7664           	moveq #100,d3
    1dd4:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    1dd8:	5284           	addq.l #1,d4
    1dda:	b9fc 0000 62c2 	cmpa.l #25282,a4
    1de0:	66b8           	bne.s 1d9a <TestRow.constprop.3+0x3e>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1de2:	3039 0000 62c2 	move.w 62c2 <destlinezoom2+0x2a>,d0
    1de8:	322f 002e      	move.w 46(sp),d1
    1dec:	b340           	eor.w d1,d0
    1dee:	206f 009c      	movea.l 156(sp),a0
    1df2:	3228 002a      	move.w 42(a0),d1
    1df6:	b340           	eor.w d1,d0
    1df8:	0240 ff00      	andi.w #-256,d0
    1dfc:	660a           	bne.s 1e08 <TestRow.constprop.3+0xac>
}
    1dfe:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1e02:	4fef 006c      	lea 108(sp),sp
    1e06:	4e75           	rts
    data[0] = 21;
    1e08:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    1e0e:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    1e14:	41f9 0000 39ab 	lea 39ab <incbin_swfont_end+0x49>,a0
    1e1a:	43ef 0030      	lea 48(sp),a1
    1e1e:	45f9 0000 319c 	lea 319c <PutChar>,a2
    1e24:	47ef 0034      	lea 52(sp),a3
    1e28:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1e2c:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1e32:	4eae ffc4      	jsr -60(a6)
    1e36:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1e3c:	2200           	move.l d0,d1
    1e3e:	240b           	move.l a3,d2
    1e40:	7664           	moveq #100,d3
    1e42:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1e46:	206f 009c      	movea.l 156(sp),a0
    1e4a:	7000           	moveq #0,d0
    1e4c:	3028 002a      	move.w 42(a0),d0
    1e50:	2f00           	move.l d0,-(sp)
    1e52:	3039 0000 62c2 	move.w 62c2 <destlinezoom2+0x2a>,d0
    1e58:	2f00           	move.l d0,-(sp)
    1e5a:	4879 0000 39db 	pea 39db <incbin_swfont_end+0x79>
    1e60:	4eba fc66      	jsr 1ac8 <KPrintF>(pc)
    1e64:	4fef 000c      	lea 12(sp),sp
}
    1e68:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1e6c:	4fef 006c      	lea 108(sp),sp
    1e70:	4e75           	rts

00001e72 <TestRow.constprop.2>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1e72:	4fef ff94      	lea -108(sp),sp
    1e76:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1e7a:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    1e80:	3c2f 002e      	move.w 46(sp),d6
  char str[ 100] = { 0 };
    1e84:	7a34           	moveq #52,d5
    1e86:	da8f           	add.l sp,d5
    1e88:	4878 0064      	pea 64 <main+0x5e>
    1e8c:	42a7           	clr.l -(sp)
    1e8e:	2f05           	move.l d5,-(sp)
    1e90:	4eba 111e      	jsr 2fb0 <memset>(pc)
  data[1] = numberofline;
    1e94:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1e9a:	4fef 000c      	lea 12(sp),sp
  destination += 0;
    1e9e:	2a6f 009c      	movea.l 156(sp),a5
  for(int i=0;i<21;i++) {
    1ea2:	7800           	moveq #0,d4
  testpattern += 0;
    1ea4:	49f9 0000 626c 	lea 626c <destlinezoom1>,a4
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1eaa:	2e3c 0000 39ab 	move.l #14763,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    1eb0:	301c           	move.w (a4)+,d0
    1eb2:	bd40           	eor.w d6,d0
    1eb4:	b05d           	cmp.w (a5)+,d0
    1eb6:	6736           	beq.s 1eee <TestRow.constprop.2+0x7c>
      data[0] = i;
    1eb8:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1ebc:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    1ec2:	2047           	movea.l d7,a0
    1ec4:	43ef 0030      	lea 48(sp),a1
    1ec8:	45f9 0000 319c 	lea 319c <PutChar>,a2
    1ece:	2645           	movea.l d5,a3
    1ed0:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1ed4:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1eda:	4eae ffc4      	jsr -60(a6)
    1ede:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1ee4:	2200           	move.l d0,d1
    1ee6:	2405           	move.l d5,d2
    1ee8:	7664           	moveq #100,d3
    1eea:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    1eee:	5284           	addq.l #1,d4
    1ef0:	b9fc 0000 6296 	cmpa.l #25238,a4
    1ef6:	66b8           	bne.s 1eb0 <TestRow.constprop.2+0x3e>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1ef8:	3039 0000 6296 	move.w 6296 <destlinezoom1+0x2a>,d0
    1efe:	322f 002e      	move.w 46(sp),d1
    1f02:	b340           	eor.w d1,d0
    1f04:	206f 009c      	movea.l 156(sp),a0
    1f08:	3228 002a      	move.w 42(a0),d1
    1f0c:	b340           	eor.w d1,d0
    1f0e:	0240 ff00      	andi.w #-256,d0
    1f12:	660a           	bne.s 1f1e <TestRow.constprop.2+0xac>
}
    1f14:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1f18:	4fef 006c      	lea 108(sp),sp
    1f1c:	4e75           	rts
    data[0] = 21;
    1f1e:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    1f24:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    1f2a:	41f9 0000 39ab 	lea 39ab <incbin_swfont_end+0x49>,a0
    1f30:	43ef 0030      	lea 48(sp),a1
    1f34:	45f9 0000 319c 	lea 319c <PutChar>,a2
    1f3a:	47ef 0034      	lea 52(sp),a3
    1f3e:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1f42:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1f48:	4eae ffc4      	jsr -60(a6)
    1f4c:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    1f52:	2200           	move.l d0,d1
    1f54:	240b           	move.l a3,d2
    1f56:	7664           	moveq #100,d3
    1f58:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1f5c:	206f 009c      	movea.l 156(sp),a0
    1f60:	7000           	moveq #0,d0
    1f62:	3028 002a      	move.w 42(a0),d0
    1f66:	2f00           	move.l d0,-(sp)
    1f68:	3039 0000 6296 	move.w 6296 <destlinezoom1+0x2a>,d0
    1f6e:	2f00           	move.l d0,-(sp)
    1f70:	4879 0000 39db 	pea 39db <incbin_swfont_end+0x79>
    1f76:	4eba fb50      	jsr 1ac8 <KPrintF>(pc)
    1f7a:	4fef 000c      	lea 12(sp),sp
}
    1f7e:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1f82:	4fef 006c      	lea 108(sp),sp
    1f86:	4e75           	rts

00001f88 <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    1f88:	202f 0008      	move.l 8(sp),d0
    1f8c:	d080           	add.l d0,d0
    1f8e:	d080           	add.l d0,d0
    1f90:	206f 0004      	movea.l 4(sp),a0
    1f94:	2030 0800      	move.l (0,a0,d0.l),d0
    1f98:	b0af 000c      	cmp.l 12(sp),d0
    1f9c:	57c0           	seq d0
    1f9e:	4880           	ext.w d0
    1fa0:	48c0           	ext.l d0
}
    1fa2:	4480           	neg.l d0
    1fa4:	4e75           	rts

00001fa6 <TestCopperlistBatch>:
                                                                  long length) {
    1fa6:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    1faa:	246f 0010      	movea.l 16(sp),a2
    1fae:	206f 0014      	movea.l 20(sp),a0
    1fb2:	226f 0018      	movea.l 24(sp),a1
    1fb6:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    1fba:	2008           	move.l a0,d0
    1fbc:	d088           	add.l a0,d0
    1fbe:	d080           	add.l d0,d0
    1fc0:	2411           	move.l (a1),d2
    1fc2:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    1fc6:	6600 01ac      	bne.w 2174 <TestCopperlistBatch+0x1ce>
    1fca:	2008           	move.l a0,d0
    1fcc:	5280           	addq.l #1,d0
    1fce:	d080           	add.l d0,d0
    1fd0:	d080           	add.l d0,d0
    1fd2:	2032 0800      	move.l (0,a2,d0.l),d0
    1fd6:	b0a9 0004      	cmp.l 4(a1),d0
    1fda:	6600 0198      	bne.w 2174 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1fde:	7002           	moveq #2,d0
    1fe0:	b081           	cmp.l d1,d0
    1fe2:	6700 0188      	beq.w 216c <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1fe6:	2008           	move.l a0,d0
    1fe8:	5480           	addq.l #2,d0
    1fea:	d080           	add.l d0,d0
    1fec:	d080           	add.l d0,d0
    1fee:	2032 0800      	move.l (0,a2,d0.l),d0
    1ff2:	b0a9 0008      	cmp.l 8(a1),d0
    1ff6:	6600 017c      	bne.w 2174 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1ffa:	7403           	moveq #3,d2
    1ffc:	b481           	cmp.l d1,d2
    1ffe:	6700 016c      	beq.w 216c <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2002:	2008           	move.l a0,d0
    2004:	5680           	addq.l #3,d0
    2006:	d080           	add.l d0,d0
    2008:	d080           	add.l d0,d0
    200a:	2032 0800      	move.l (0,a2,d0.l),d0
    200e:	b0a9 000c      	cmp.l 12(a1),d0
    2012:	6600 0160      	bne.w 2174 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2016:	7004           	moveq #4,d0
    2018:	b081           	cmp.l d1,d0
    201a:	6700 0150      	beq.w 216c <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    201e:	2008           	move.l a0,d0
    2020:	5880           	addq.l #4,d0
    2022:	d080           	add.l d0,d0
    2024:	d080           	add.l d0,d0
    2026:	2032 0800      	move.l (0,a2,d0.l),d0
    202a:	b0a9 0010      	cmp.l 16(a1),d0
    202e:	6600 0144      	bne.w 2174 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2032:	7405           	moveq #5,d2
    2034:	b481           	cmp.l d1,d2
    2036:	6700 0134      	beq.w 216c <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    203a:	2008           	move.l a0,d0
    203c:	5a80           	addq.l #5,d0
    203e:	d080           	add.l d0,d0
    2040:	d080           	add.l d0,d0
    2042:	2032 0800      	move.l (0,a2,d0.l),d0
    2046:	b0a9 0014      	cmp.l 20(a1),d0
    204a:	6600 0128      	bne.w 2174 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    204e:	7006           	moveq #6,d0
    2050:	b081           	cmp.l d1,d0
    2052:	6700 0118      	beq.w 216c <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2056:	2008           	move.l a0,d0
    2058:	5c80           	addq.l #6,d0
    205a:	d080           	add.l d0,d0
    205c:	d080           	add.l d0,d0
    205e:	2032 0800      	move.l (0,a2,d0.l),d0
    2062:	b0a9 0018      	cmp.l 24(a1),d0
    2066:	6600 010c      	bne.w 2174 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    206a:	7407           	moveq #7,d2
    206c:	b481           	cmp.l d1,d2
    206e:	6700 00fc      	beq.w 216c <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2072:	2008           	move.l a0,d0
    2074:	5e80           	addq.l #7,d0
    2076:	d080           	add.l d0,d0
    2078:	d080           	add.l d0,d0
    207a:	2032 0800      	move.l (0,a2,d0.l),d0
    207e:	b0a9 001c      	cmp.l 28(a1),d0
    2082:	6600 00f0      	bne.w 2174 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2086:	7008           	moveq #8,d0
    2088:	b081           	cmp.l d1,d0
    208a:	6700 00e0      	beq.w 216c <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    208e:	2008           	move.l a0,d0
    2090:	5080           	addq.l #8,d0
    2092:	d080           	add.l d0,d0
    2094:	d080           	add.l d0,d0
    2096:	2032 0800      	move.l (0,a2,d0.l),d0
    209a:	b0a9 0020      	cmp.l 32(a1),d0
    209e:	6600 00d4      	bne.w 2174 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    20a2:	7409           	moveq #9,d2
    20a4:	b481           	cmp.l d1,d2
    20a6:	6700 00c4      	beq.w 216c <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    20aa:	47e8 0009      	lea 9(a0),a3
    20ae:	200b           	move.l a3,d0
    20b0:	d08b           	add.l a3,d0
    20b2:	d080           	add.l d0,d0
    20b4:	2032 0800      	move.l (0,a2,d0.l),d0
    20b8:	b0a9 0024      	cmp.l 36(a1),d0
    20bc:	6600 00b6      	bne.w 2174 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    20c0:	700a           	moveq #10,d0
    20c2:	b081           	cmp.l d1,d0
    20c4:	6700 00a6      	beq.w 216c <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    20c8:	47e8 000a      	lea 10(a0),a3
    20cc:	200b           	move.l a3,d0
    20ce:	d08b           	add.l a3,d0
    20d0:	d080           	add.l d0,d0
    20d2:	2032 0800      	move.l (0,a2,d0.l),d0
    20d6:	b0a9 0028      	cmp.l 40(a1),d0
    20da:	6600 0098      	bne.w 2174 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    20de:	740b           	moveq #11,d2
    20e0:	b481           	cmp.l d1,d2
    20e2:	6700 0088      	beq.w 216c <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    20e6:	47e8 000b      	lea 11(a0),a3
    20ea:	200b           	move.l a3,d0
    20ec:	d08b           	add.l a3,d0
    20ee:	d080           	add.l d0,d0
    20f0:	2032 0800      	move.l (0,a2,d0.l),d0
    20f4:	b0a9 002c      	cmp.l 44(a1),d0
    20f8:	667a           	bne.s 2174 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    20fa:	700c           	moveq #12,d0
    20fc:	b081           	cmp.l d1,d0
    20fe:	676c           	beq.s 216c <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2100:	47e8 000c      	lea 12(a0),a3
    2104:	200b           	move.l a3,d0
    2106:	d08b           	add.l a3,d0
    2108:	d080           	add.l d0,d0
    210a:	2032 0800      	move.l (0,a2,d0.l),d0
    210e:	b0a9 0030      	cmp.l 48(a1),d0
    2112:	6660           	bne.s 2174 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2114:	740d           	moveq #13,d2
    2116:	b481           	cmp.l d1,d2
    2118:	6752           	beq.s 216c <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    211a:	47e8 000d      	lea 13(a0),a3
    211e:	200b           	move.l a3,d0
    2120:	d08b           	add.l a3,d0
    2122:	d080           	add.l d0,d0
    2124:	2032 0800      	move.l (0,a2,d0.l),d0
    2128:	b0a9 0034      	cmp.l 52(a1),d0
    212c:	6646           	bne.s 2174 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    212e:	700e           	moveq #14,d0
    2130:	b081           	cmp.l d1,d0
    2132:	6738           	beq.s 216c <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2134:	47e8 000e      	lea 14(a0),a3
    2138:	200b           	move.l a3,d0
    213a:	d08b           	add.l a3,d0
    213c:	d080           	add.l d0,d0
    213e:	2032 0800      	move.l (0,a2,d0.l),d0
    2142:	b0a9 0038      	cmp.l 56(a1),d0
    2146:	662c           	bne.s 2174 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2148:	7410           	moveq #16,d2
    214a:	b481           	cmp.l d1,d2
    214c:	661e           	bne.s 216c <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    214e:	41e8 000f      	lea 15(a0),a0
    2152:	d1c8           	adda.l a0,a0
    2154:	d1c8           	adda.l a0,a0
    2156:	2070 a800      	movea.l (0,a0,a2.l),a0
    215a:	b1e9 003c      	cmpa.l 60(a1),a0
    215e:	57c0           	seq d0
    2160:	4880           	ext.w d0
    2162:	48c0           	ext.l d0
    2164:	4480           	neg.l d0
}
    2166:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    216a:	4e75           	rts
  return 1;
    216c:	7001           	moveq #1,d0
}
    216e:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    2172:	4e75           	rts
      return 0;
    2174:	7000           	moveq #0,d0
}
    2176:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    217a:	4e75           	rts

0000217c <ClBuild>:
ULONG * ClbuildSW() {
    217c:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    2180:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    2186:	707b           	moveq #123,d0
    2188:	4600           	not.b d0
    218a:	7202           	moveq #2,d1
    218c:	4eae ff3a      	jsr -198(a6)
    2190:	2440           	movea.l d0,a2
  if( retval == 0) {
    2192:	4a80           	tst.l d0
    2194:	6700 010e      	beq.w 22a4 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    2198:	24b9 0000 622c 	move.l 622c <ClsSprites>,(a2)
    219e:	2579 0000 6230 	move.l 6230 <ClsSprites+0x4>,4(a2)
    21a4:	0004 
    21a6:	2579 0000 6234 	move.l 6234 <ClsSprites+0x8>,8(a2)
    21ac:	0008 
    21ae:	2579 0000 6238 	move.l 6238 <ClsSprites+0xc>,12(a2)
    21b4:	000c 
    21b6:	2579 0000 623c 	move.l 623c <ClsSprites+0x10>,16(a2)
    21bc:	0010 
    21be:	2579 0000 6240 	move.l 6240 <ClsSprites+0x14>,20(a2)
    21c4:	0014 
    21c6:	2579 0000 6244 	move.l 6244 <ClsSprites+0x18>,24(a2)
    21cc:	0018 
    21ce:	2579 0000 6248 	move.l 6248 <ClsSprites+0x1c>,28(a2)
    21d4:	001c 
    21d6:	2579 0000 624c 	move.l 624c <ClsSprites+0x20>,32(a2)
    21dc:	0020 
    21de:	2579 0000 6250 	move.l 6250 <ClsSprites+0x24>,36(a2)
    21e4:	0024 
    21e6:	2579 0000 6254 	move.l 6254 <ClsSprites+0x28>,40(a2)
    21ec:	0028 
    21ee:	2579 0000 6258 	move.l 6258 <ClsSprites+0x2c>,44(a2)
    21f4:	002c 
    21f6:	2579 0000 625c 	move.l 625c <ClsSprites+0x30>,48(a2)
    21fc:	0030 
    21fe:	2579 0000 6260 	move.l 6260 <ClsSprites+0x34>,52(a2)
    2204:	0034 
    2206:	2579 0000 6264 	move.l 6264 <ClsSprites+0x38>,56(a2)
    220c:	0038 
    220e:	2579 0000 6268 	move.l 6268 <ClsSprites+0x3c>,60(a2)
    2214:	003c 
    *cl++ = *clpartinstruction++;
    2216:	2579 0000 61fc 	move.l 61fc <ClScreen>,64(a2)
    221c:	0040 
    221e:	2579 0000 6200 	move.l 6200 <ClScreen+0x4>,68(a2)
    2224:	0044 
    2226:	2579 0000 6204 	move.l 6204 <ClScreen+0x8>,72(a2)
    222c:	0048 
    222e:	2579 0000 6208 	move.l 6208 <ClScreen+0xc>,76(a2)
    2234:	004c 
    2236:	2579 0000 620c 	move.l 620c <ClScreen+0x10>,80(a2)
    223c:	0050 
    223e:	2579 0000 6210 	move.l 6210 <ClScreen+0x14>,84(a2)
    2244:	0054 
    2246:	2579 0000 6214 	move.l 6214 <ClScreen+0x18>,88(a2)
    224c:	0058 
    224e:	2579 0000 6218 	move.l 6218 <ClScreen+0x1c>,92(a2)
    2254:	005c 
    2256:	2579 0000 621c 	move.l 621c <ClScreen+0x20>,96(a2)
    225c:	0060 
    225e:	2579 0000 6220 	move.l 6220 <ClScreen+0x24>,100(a2)
    2264:	0064 
    2266:	2579 0000 6224 	move.l 6224 <ClScreen+0x28>,104(a2)
    226c:	0068 
    226e:	2579 0000 6228 	move.l 6228 <ClScreen+0x2c>,108(a2)
    2274:	006c 
  *cl++ = 0x00e00000;
    2276:	257c 00e0 0000 	move.l #14680064,112(a2)
    227c:	0070 
  *cl++ = 0x00e20000;
    227e:	257c 00e2 0000 	move.l #14811136,116(a2)
    2284:	0074 
    *cl++ = *clpartinstruction++;
    2286:	2579 0000 61f4 	move.l 61f4 <ClColor>,120(a2)
    228c:	0078 
    228e:	2579 0000 61f8 	move.l 61f8 <ClColor+0x4>,124(a2)
    2294:	007c 
  *cl = 0xfffffffe;
    2296:	70fe           	moveq #-2,d0
    2298:	2540 0080      	move.l d0,128(a2)
}
    229c:	200a           	move.l a2,d0
    229e:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    22a2:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    22a4:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    22aa:	4eae ffc4      	jsr -60(a6)
    22ae:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    22b4:	2200           	move.l d0,d1
    22b6:	243c 0000 3a01 	move.l #14849,d2
    22bc:	7628           	moveq #40,d3
    22be:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    22c2:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    22c8:	7201           	moveq #1,d1
    22ca:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    22ce:	24b9 0000 622c 	move.l 622c <ClsSprites>,(a2)
    22d4:	2579 0000 6230 	move.l 6230 <ClsSprites+0x4>,4(a2)
    22da:	0004 
    22dc:	2579 0000 6234 	move.l 6234 <ClsSprites+0x8>,8(a2)
    22e2:	0008 
    22e4:	2579 0000 6238 	move.l 6238 <ClsSprites+0xc>,12(a2)
    22ea:	000c 
    22ec:	2579 0000 623c 	move.l 623c <ClsSprites+0x10>,16(a2)
    22f2:	0010 
    22f4:	2579 0000 6240 	move.l 6240 <ClsSprites+0x14>,20(a2)
    22fa:	0014 
    22fc:	2579 0000 6244 	move.l 6244 <ClsSprites+0x18>,24(a2)
    2302:	0018 
    2304:	2579 0000 6248 	move.l 6248 <ClsSprites+0x1c>,28(a2)
    230a:	001c 
    230c:	2579 0000 624c 	move.l 624c <ClsSprites+0x20>,32(a2)
    2312:	0020 
    2314:	2579 0000 6250 	move.l 6250 <ClsSprites+0x24>,36(a2)
    231a:	0024 
    231c:	2579 0000 6254 	move.l 6254 <ClsSprites+0x28>,40(a2)
    2322:	0028 
    2324:	2579 0000 6258 	move.l 6258 <ClsSprites+0x2c>,44(a2)
    232a:	002c 
    232c:	2579 0000 625c 	move.l 625c <ClsSprites+0x30>,48(a2)
    2332:	0030 
    2334:	2579 0000 6260 	move.l 6260 <ClsSprites+0x34>,52(a2)
    233a:	0034 
    233c:	2579 0000 6264 	move.l 6264 <ClsSprites+0x38>,56(a2)
    2342:	0038 
    2344:	2579 0000 6268 	move.l 6268 <ClsSprites+0x3c>,60(a2)
    234a:	003c 
    *cl++ = *clpartinstruction++;
    234c:	2579 0000 61fc 	move.l 61fc <ClScreen>,64(a2)
    2352:	0040 
    2354:	2579 0000 6200 	move.l 6200 <ClScreen+0x4>,68(a2)
    235a:	0044 
    235c:	2579 0000 6204 	move.l 6204 <ClScreen+0x8>,72(a2)
    2362:	0048 
    2364:	2579 0000 6208 	move.l 6208 <ClScreen+0xc>,76(a2)
    236a:	004c 
    236c:	2579 0000 620c 	move.l 620c <ClScreen+0x10>,80(a2)
    2372:	0050 
    2374:	2579 0000 6210 	move.l 6210 <ClScreen+0x14>,84(a2)
    237a:	0054 
    237c:	2579 0000 6214 	move.l 6214 <ClScreen+0x18>,88(a2)
    2382:	0058 
    2384:	2579 0000 6218 	move.l 6218 <ClScreen+0x1c>,92(a2)
    238a:	005c 
    238c:	2579 0000 621c 	move.l 621c <ClScreen+0x20>,96(a2)
    2392:	0060 
    2394:	2579 0000 6220 	move.l 6220 <ClScreen+0x24>,100(a2)
    239a:	0064 
    239c:	2579 0000 6224 	move.l 6224 <ClScreen+0x28>,104(a2)
    23a2:	0068 
    23a4:	2579 0000 6228 	move.l 6228 <ClScreen+0x2c>,108(a2)
    23aa:	006c 
  *cl++ = 0x00e00000;
    23ac:	257c 00e0 0000 	move.l #14680064,112(a2)
    23b2:	0070 
  *cl++ = 0x00e20000;
    23b4:	257c 00e2 0000 	move.l #14811136,116(a2)
    23ba:	0074 
    *cl++ = *clpartinstruction++;
    23bc:	2579 0000 61f4 	move.l 61f4 <ClColor>,120(a2)
    23c2:	0078 
    23c4:	2579 0000 61f8 	move.l 61f8 <ClColor+0x4>,124(a2)
    23ca:	007c 
  *cl = 0xfffffffe;
    23cc:	70fe           	moveq #-2,d0
    23ce:	2540 0080      	move.l d0,128(a2)
}
    23d2:	200a           	move.l a2,d0
    23d4:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    23d8:	4e75           	rts

000023da <Zoom_ZoomIntoPicture>:
void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr) {
    23da:	4fef ffdc      	lea -36(sp),sp
    23de:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    23e2:	222f 005c      	move.l 92(sp),d1
    23e6:	3241           	movea.w d1,a1
  UWORD nextzoom = 22*16 - 20 + zoomnr * 10;
    23e8:	3041           	movea.w d1,a0
    23ea:	d0c1           	adda.w d1,a0
    23ec:	3008           	move.w a0,d0
    23ee:	d048           	add.w a0,d0
    23f0:	d041           	add.w d1,d0
    23f2:	d040           	add.w d0,d0
    23f4:	0640 014c      	addi.w #332,d0
    23f8:	3f40 0038      	move.w d0,56(sp)
  while( nextzoom > 22 * 16) {
    23fc:	0c40 0160      	cmpi.w #352,d0
    2400:	6300 0422      	bls.w 2824 <Zoom_ZoomIntoPicture+0x44a>
    nextzoom -= (19 + zoomnr);
    2404:	70ed           	moveq #-19,d0
    2406:	9041           	sub.w d1,d0
    2408:	d16f 0038      	add.w d0,56(sp)
    shiftright--;
    240c:	7e08           	moveq #8,d7
  *bp2 = 0;
    240e:	4278 0206      	clr.w 206 <main+0x200>
    ZoomHorizontal = 15 - zoomnr * 6;
    2412:	3008           	move.w a0,d0
    2414:	d041           	add.w d1,d0
    2416:	d040           	add.w d0,d0
    2418:	740f           	moveq #15,d2
    241a:	9440           	sub.w d0,d2
    241c:	3f42 0044      	move.w d2,68(sp)
      ZoomHorizontal += (15 - zoomnr + (zoomnr << 1));
    2420:	90c1           	suba.w d1,a0
    2422:	3a48           	movea.w a0,a5
    2424:	4bed 000f      	lea 15(a5),a5
    2428:	d44d           	add.w a5,d2
    242a:	3f42 004c      	move.w d2,76(sp)
    242e:	242f 0054      	move.l 84(sp),d2
    2432:	0682 0000 01ac 	addi.l #428,d2
    2438:	2f42 0034      	move.l d2,52(sp)
    243c:	742c           	moveq #44,d2
    243e:	d4af 0058      	add.l 88(sp),d2
    2442:	2f42 003e      	move.l d2,62(sp)
    2446:	4a6f 0044      	tst.w 68(sp)
    244a:	6d00 03b4      	blt.w 2800 <Zoom_ZoomIntoPicture+0x426>
    244e:	3f6f 0044 004a 	move.w 68(sp),74(sp)
  for(int i=0;i<22;i++) {
    2454:	42af 003a      	clr.l 58(sp)
  UWORD shifttoleft = 0;
    2458:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
    245c:	3f7c 0150 002e 	move.w #336,46(sp)
      nextzoom -= (19 + zoomnr);
    2462:	74ed           	moveq #-19,d2
    2464:	9449           	sub.w a1,d2
    2466:	3f42 004e      	move.w d2,78(sp)
    246a:	3f47 002c      	move.w d7,44(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*8-2-i;
    246e:	2a2f 0034      	move.l 52(sp),d5
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    2472:	246f 003e      	movea.l 62(sp),a2
    while( ZoomHorizontal < 0) {
    2476:	4a6f 0044      	tst.w 68(sp)
    247a:	6c00 01b2      	bge.w 262e <Zoom_ZoomIntoPicture+0x254>
      ZoomHorizontal += (15 - zoomnr + (zoomnr << 1));
    247e:	33ef 004c 0000 	move.w 76(sp),637a <ZoomHorizontal>
    2484:	637a 
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    2486:	7000           	moveq #0,d0
    2488:	302f 0046      	move.w 70(sp),d0
    248c:	d080           	add.l d0,d0
    248e:	2f40 0030      	move.l d0,48(sp)
    2492:	3f6f 002c 0048 	move.w 44(sp),72(sp)
    2498:	3c2f 002c      	move.w 44(sp),d6
    249c:	720c           	moveq #12,d1
    249e:	e36e           	lsl.w d1,d6
    24a0:	342f 002e      	move.w 46(sp),d2
    24a4:	b46f 0038      	cmp.w 56(sp),d2
    24a8:	6500 01b2      	bcs.w 265c <Zoom_ZoomIntoPicture+0x282>
  hw->bltcon0 = 0x9f0 + shiftright;
    24ac:	0646 09f0      	addi.w #2544,d6
    24b0:	342f 004a      	move.w 74(sp),d2
    WORD linesleft = 272;
    24b4:	363c 0110      	move.w #272,d3
    24b8:	282f 0034      	move.l 52(sp),d4
    24bc:	d880           	add.l d0,d4
    24be:	2640           	movea.l d0,a3
        if( linesleft >= ZoomHorizontal+1) {
    24c0:	b642           	cmp.w d2,d3
    24c2:	6f00 00c4      	ble.w 2588 <Zoom_ZoomIntoPicture+0x1ae>
          linesleft -= ZoomHorizontal;
    24c6:	9642           	sub.w d2,d3
    24c8:	3e03           	move.w d3,d7
  WaitBlit();
    24ca:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    24d0:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    24d4:	2079 0000 6372 	movea.l 6372 <hw>,a0
    24da:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    24e0:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    24e4:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    24ea:	317c ffff 0046 	move.w #-1,70(a0)
  *bp = 0;
    24f0:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltamod = ZMLINESIZE - 4;
    24f4:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    24fa:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    2500:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
    2504:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    2508:	ed4a           	lsl.w #6,d2
    250a:	5442           	addq.w #2,d2
    250c:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    2510:	3079 0000 637a 	movea.w 637a <ZoomHorizontal>,a0
    2516:	2008           	move.l a0,d0
    2518:	d088           	add.l a0,d0
    251a:	d088           	add.l a0,d0
    251c:	e988           	lsl.l #4,d0
    251e:	da80           	add.l d0,d5
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    2520:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    2522:	4a47           	tst.w d7
    2524:	6f00 00cc      	ble.w 25f2 <Zoom_ZoomIntoPicture+0x218>
          Zoom_CopyWord( pos4source+shifttoleft, pos4dest, shiftright, 1);
    2528:	2805           	move.l d5,d4
    252a:	d88b           	add.l a3,d4
  WaitBlit();
    252c:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    2532:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    2536:	2079 0000 6372 	movea.l 6372 <hw>,a0
    253c:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    2542:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    2546:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    254c:	317c ffff 0046 	move.w #-1,70(a0)
  *bp = 0;
    2552:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltamod = ZMLINESIZE - 4;
    2556:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    255c:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    2562:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
    2566:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    256a:	317c 0042 0058 	move.w #66,88(a0)
          linesleft--;
    2570:	5343           	subq.w #1,d3
          pos4dest += ZMLINESIZE/2;
    2572:	45ea 0030      	lea 48(a2),a2
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    2576:	33cd 0000 637a 	move.w a5,637a <ZoomHorizontal>
      while(linesleft > 0) {
    257c:	4a43           	tst.w d3
    257e:	6778           	beq.s 25f8 <Zoom_ZoomIntoPicture+0x21e>
    2580:	340d           	move.w a5,d2
        if( linesleft >= ZoomHorizontal+1) {
    2582:	b642           	cmp.w d2,d3
    2584:	6e00 ff40      	bgt.w 24c6 <Zoom_ZoomIntoPicture+0xec>
          ZoomHorizontal = linesleft;
    2588:	33c3 0000 637a 	move.w d3,637a <ZoomHorizontal>
    258e:	3403           	move.w d3,d2
    2590:	4243           	clr.w d3
          linesleft = 0;
    2592:	4247           	clr.w d7
  WaitBlit();
    2594:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    259a:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    259e:	2079 0000 6372 	movea.l 6372 <hw>,a0
    25a4:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    25aa:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    25ae:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    25b4:	317c ffff 0046 	move.w #-1,70(a0)
  *bp = 0;
    25ba:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltamod = ZMLINESIZE - 4;
    25be:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    25c4:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    25ca:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
    25ce:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    25d2:	ed4a           	lsl.w #6,d2
    25d4:	5442           	addq.w #2,d2
    25d6:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    25da:	3079 0000 637a 	movea.w 637a <ZoomHorizontal>,a0
    25e0:	2008           	move.l a0,d0
    25e2:	d088           	add.l a0,d0
    25e4:	d088           	add.l a0,d0
    25e6:	e988           	lsl.l #4,d0
    25e8:	da80           	add.l d0,d5
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    25ea:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    25ec:	4a47           	tst.w d7
    25ee:	6e00 ff38      	bgt.w 2528 <Zoom_ZoomIntoPicture+0x14e>
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    25f2:	33cd 0000 637a 	move.w a5,637a <ZoomHorizontal>
    startofword -= 16;
    25f8:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    25fe:	52af 003a      	addq.l #1,58(sp)
    2602:	0c6f fff0 002e 	cmpi.w #-16,46(sp)
    2608:	6700 0154      	beq.w 275e <Zoom_ZoomIntoPicture+0x384>
    if( i == 16) {
    260c:	7010           	moveq #16,d0
    260e:	b0af 003a      	cmp.l 58(sp),d0
    2612:	6700 0154      	beq.w 2768 <Zoom_ZoomIntoPicture+0x38e>
    2616:	55af 0034      	subq.l #2,52(sp)
    261a:	55af 003e      	subq.l #2,62(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*8-2-i;
    261e:	2a2f 0034      	move.l 52(sp),d5
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    2622:	246f 003e      	movea.l 62(sp),a2
    while( ZoomHorizontal < 0) {
    2626:	4a6f 0044      	tst.w 68(sp)
    262a:	6d00 fe52      	blt.w 247e <Zoom_ZoomIntoPicture+0xa4>
    ZoomHorizontal = 15 - zoomnr * 6;
    262e:	33ef 0044 0000 	move.w 68(sp),637a <ZoomHorizontal>
    2634:	637a 
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    2636:	7000           	moveq #0,d0
    2638:	302f 0046      	move.w 70(sp),d0
    263c:	d080           	add.l d0,d0
    263e:	2f40 0030      	move.l d0,48(sp)
    2642:	3f6f 002c 0048 	move.w 44(sp),72(sp)
    2648:	3c2f 002c      	move.w 44(sp),d6
    264c:	720c           	moveq #12,d1
    264e:	e36e           	lsl.w d1,d6
    2650:	342f 002e      	move.w 46(sp),d2
    2654:	b46f 0038      	cmp.w 56(sp),d2
    2658:	6400 fe52      	bcc.w 24ac <Zoom_ZoomIntoPicture+0xd2>
      UWORD colnr = nextzoom - startofword - 1; 
    265c:	302f 0038      	move.w 56(sp),d0
    2660:	5340           	subq.w #1,d0
    2662:	906f 002e      	sub.w 46(sp),d0
      nextzoom -= (19 + zoomnr);
    2666:	342f 004e      	move.w 78(sp),d2
    266a:	d56f 0038      	add.w d2,56(sp)
    shifta = (shift - 1) << 12;
    266e:	342f 002c      	move.w 44(sp),d2
    2672:	5342           	subq.w #1,d2
    2674:	3f42 0042      	move.w d2,66(sp)
    2678:	3202           	move.w d2,d1
    267a:	740c           	moveq #12,d2
    267c:	e569           	lsl.w d2,d1
  hw->bltcon0 = 0xde4 + shifta;
    267e:	3e3c f000      	move.w #-4096,d7
    2682:	4a6f 002c      	tst.w 44(sp)
    2686:	6702           	beq.s 268a <Zoom_ZoomIntoPicture+0x2b0>
    2688:	3e01           	move.w d1,d7
    268a:	0647 0de4      	addi.w #3556,d7
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    268e:	0280 0000 ffff 	andi.l #65535,d0
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    2694:	7210           	moveq #16,d1
    2696:	9280           	sub.l d0,d1
    2698:	7400           	moveq #0,d2
    269a:	4642           	not.w d2
    269c:	e3aa           	lsl.l d1,d2
    269e:	2642           	movea.l d2,a3
    26a0:	342f 004a      	move.w 74(sp),d2
    WORD linesleft = 272;
    26a4:	363c 0110      	move.w #272,d3
    26a8:	282f 0034      	move.l 52(sp),d4
    26ac:	d8af 0030      	add.l 48(sp),d4
        if( linesleft >= ZoomHorizontal+1) {
    26b0:	b642           	cmp.w d2,d3
    26b2:	6f00 00c4      	ble.w 2778 <Zoom_ZoomIntoPicture+0x39e>
          linesleft -= ZoomHorizontal;
    26b6:	9642           	sub.w d2,d3
    srca = source + 1;
    26b8:	2844           	movea.l d4,a4
  if( shift == 0) {
    26ba:	4a6f 002c      	tst.w 44(sp)
    26be:	6602           	bne.s 26c2 <Zoom_ZoomIntoPicture+0x2e8>
    srca = source + 1;
    26c0:	548c           	addq.l #2,a4
  WaitBlit();
    26c2:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    26c8:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    26cc:	2079 0000 6372 	movea.l 6372 <hw>,a0
    26d2:	3146 0042      	move.w d6,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    26d6:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
    26da:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    26e0:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    26e6:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    26ec:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    26f2:	314b 0070      	move.w a3,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    26f6:	317c 002c 0066 	move.w #44,102(a0)
  *bp = 0;
    26fc:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltapt = srca;
    2700:	214c 0050      	move.l a4,80(a0)
  hw->bltbpt = srcb;
    2704:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    2708:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    270c:	ed4a           	lsl.w #6,d2
    270e:	5442           	addq.w #2,d2
    2710:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    2714:	3079 0000 637a 	movea.w 637a <ZoomHorizontal>,a0
    271a:	2008           	move.l a0,d0
    271c:	d088           	add.l a0,d0
    271e:	d088           	add.l a0,d0
    2720:	e988           	lsl.l #4,d0
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    2722:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    2724:	4a43           	tst.w d3
    2726:	6e5e           	bgt.s 2786 <Zoom_ZoomIntoPicture+0x3ac>
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    2728:	33cd 0000 637a 	move.w a5,637a <ZoomHorizontal>
      shiftright--;  
    272e:	3f6f 0042 002c 	move.w 66(sp),44(sp)
      if(shiftright < 0) {
    2734:	6c00 fec2      	bge.w 25f8 <Zoom_ZoomIntoPicture+0x21e>
        shiftright += 16;
    2738:	342f 0048      	move.w 72(sp),d2
    273c:	0642 000f      	addi.w #15,d2
    2740:	3f42 002c      	move.w d2,44(sp)
        shifttoleft = 1;
    2744:	3f7c 0001 0046 	move.w #1,70(sp)
    startofword -= 16;
    274a:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    2750:	52af 003a      	addq.l #1,58(sp)
    2754:	0c6f fff0 002e 	cmpi.w #-16,46(sp)
    275a:	6600 feb0      	bne.w 260c <Zoom_ZoomIntoPicture+0x232>
}
    275e:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    2762:	4fef 0024      	lea 36(sp),sp
    2766:	4e75           	rts
      *bp = 0;
    2768:	4278 0204      	clr.w 204 <main+0x1fe>
    276c:	55af 0034      	subq.l #2,52(sp)
    2770:	55af 003e      	subq.l #2,62(sp)
    2774:	6000 fea8      	bra.w 261e <Zoom_ZoomIntoPicture+0x244>
          ZoomHorizontal = linesleft;
    2778:	33c3 0000 637a 	move.w d3,637a <ZoomHorizontal>
    277e:	3403           	move.w d3,d2
          linesleft = 0;
    2780:	4243           	clr.w d3
    2782:	6000 ff34      	bra.w 26b8 <Zoom_ZoomIntoPicture+0x2de>
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    2786:	da80           	add.l d0,d5
          Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    2788:	282f 0030      	move.l 48(sp),d4
    278c:	d885           	add.l d5,d4
    srca = source + 1;
    278e:	2404           	move.l d4,d2
  if( shift == 0) {
    2790:	4a6f 002c      	tst.w 44(sp)
    2794:	6602           	bne.s 2798 <Zoom_ZoomIntoPicture+0x3be>
    srca = source + 1;
    2796:	5482           	addq.l #2,d2
  WaitBlit();
    2798:	2c79 0000 6376 	movea.l 6376 <GfxBase>,a6
    279e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    27a2:	2079 0000 6372 	movea.l 6372 <hw>,a0
    27a8:	3146 0042      	move.w d6,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    27ac:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
    27b0:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    27b6:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    27bc:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    27c2:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    27c8:	314b 0070      	move.w a3,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    27cc:	317c 002c 0066 	move.w #44,102(a0)
  *bp = 0;
    27d2:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltapt = srca;
    27d6:	2142 0050      	move.l d2,80(a0)
  hw->bltbpt = srcb;
    27da:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    27de:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    27e2:	317c 0042 0058 	move.w #66,88(a0)
          pos4dest += ZMLINESIZE/2;
    27e8:	45ea 0030      	lea 48(a2),a2
          linesleft--;
    27ec:	5343           	subq.w #1,d3
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    27ee:	33cd 0000 637a 	move.w a5,637a <ZoomHorizontal>
      while( linesleft > 0)
    27f4:	4a43           	tst.w d3
    27f6:	6700 ff36      	beq.w 272e <Zoom_ZoomIntoPicture+0x354>
    27fa:	340d           	move.w a5,d2
    27fc:	6000 feb2      	bra.w 26b0 <Zoom_ZoomIntoPicture+0x2d6>
    2800:	3f6f 004c 004a 	move.w 76(sp),74(sp)
  for(int i=0;i<22;i++) {
    2806:	42af 003a      	clr.l 58(sp)
  UWORD shifttoleft = 0;
    280a:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
    280e:	3f7c 0150 002e 	move.w #336,46(sp)
      nextzoom -= (19 + zoomnr);
    2814:	74ed           	moveq #-19,d2
    2816:	9449           	sub.w a1,d2
    2818:	3f42 004e      	move.w d2,78(sp)
    281c:	3f47 002c      	move.w d7,44(sp)
    2820:	6000 fc4c      	bra.w 246e <Zoom_ZoomIntoPicture+0x94>
  WORD shiftright = 9;
    2824:	7e09           	moveq #9,d7
    2826:	6000 fbe6      	bra.w 240e <Zoom_ZoomIntoPicture+0x34>

0000282a <ClbuildZoom>:
ULONG * ClbuildZoom() {
    282a:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    282e:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    2834:	203c 0000 a48c 	move.l #42124,d0
    283a:	7202           	moveq #2,d1
    283c:	4eae ff3a      	jsr -198(a6)
    2840:	2440           	movea.l d0,a2
  if( retval == 0) {
    2842:	4a80           	tst.l d0
    2844:	6700 0160      	beq.w 29a6 <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    2848:	24b9 0000 622c 	move.l 622c <ClsSprites>,(a2)
    284e:	2579 0000 6230 	move.l 6230 <ClsSprites+0x4>,4(a2)
    2854:	0004 
    2856:	2579 0000 6234 	move.l 6234 <ClsSprites+0x8>,8(a2)
    285c:	0008 
    285e:	2579 0000 6238 	move.l 6238 <ClsSprites+0xc>,12(a2)
    2864:	000c 
    2866:	2579 0000 623c 	move.l 623c <ClsSprites+0x10>,16(a2)
    286c:	0010 
    286e:	2579 0000 6240 	move.l 6240 <ClsSprites+0x14>,20(a2)
    2874:	0014 
    2876:	2579 0000 6244 	move.l 6244 <ClsSprites+0x18>,24(a2)
    287c:	0018 
    287e:	2579 0000 6248 	move.l 6248 <ClsSprites+0x1c>,28(a2)
    2884:	001c 
    2886:	2579 0000 624c 	move.l 624c <ClsSprites+0x20>,32(a2)
    288c:	0020 
    288e:	2579 0000 6250 	move.l 6250 <ClsSprites+0x24>,36(a2)
    2894:	0024 
    2896:	2579 0000 6254 	move.l 6254 <ClsSprites+0x28>,40(a2)
    289c:	0028 
    289e:	2579 0000 6258 	move.l 6258 <ClsSprites+0x2c>,44(a2)
    28a4:	002c 
    28a6:	2579 0000 625c 	move.l 625c <ClsSprites+0x30>,48(a2)
    28ac:	0030 
    28ae:	2579 0000 6260 	move.l 6260 <ClsSprites+0x34>,52(a2)
    28b4:	0034 
    28b6:	2579 0000 6264 	move.l 6264 <ClsSprites+0x38>,56(a2)
    28bc:	0038 
    28be:	2579 0000 6268 	move.l 6268 <ClsSprites+0x3c>,60(a2)
    28c4:	003c 
    *cl++ = *clpartinstruction++;
    28c6:	2579 0000 61c4 	move.l 61c4 <ClScreenZoom>,64(a2)
    28cc:	0040 
    28ce:	2579 0000 61c8 	move.l 61c8 <ClScreenZoom+0x4>,68(a2)
    28d4:	0044 
    28d6:	2579 0000 61cc 	move.l 61cc <ClScreenZoom+0x8>,72(a2)
    28dc:	0048 
    28de:	2579 0000 61d0 	move.l 61d0 <ClScreenZoom+0xc>,76(a2)
    28e4:	004c 
    28e6:	2579 0000 61d4 	move.l 61d4 <ClScreenZoom+0x10>,80(a2)
    28ec:	0050 
    28ee:	2579 0000 61d8 	move.l 61d8 <ClScreenZoom+0x14>,84(a2)
    28f4:	0054 
    28f6:	2579 0000 61dc 	move.l 61dc <ClScreenZoom+0x18>,88(a2)
    28fc:	0058 
    28fe:	2579 0000 61e0 	move.l 61e0 <ClScreenZoom+0x1c>,92(a2)
    2904:	005c 
    2906:	2579 0000 61e4 	move.l 61e4 <ClScreenZoom+0x20>,96(a2)
    290c:	0060 
    290e:	2579 0000 61e8 	move.l 61e8 <ClScreenZoom+0x24>,100(a2)
    2914:	0064 
    2916:	2579 0000 61ec 	move.l 61ec <ClScreenZoom+0x28>,104(a2)
    291c:	0068 
    291e:	2579 0000 61f0 	move.l 61f0 <ClScreenZoom+0x2c>,108(a2)
    2924:	006c 
  *cl++ = 0x00e00000;
    2926:	257c 00e0 0000 	move.l #14680064,112(a2)
    292c:	0070 
  *cl++ = 0x00e20000;
    292e:	257c 00e2 0000 	move.l #14811136,116(a2)
    2934:	0074 
  *cl++ = 0x00e40000;
    2936:	257c 00e4 0000 	move.l #14942208,120(a2)
    293c:	0078 
  *cl++ = 0x00e60000;
    293e:	257c 00e6 0000 	move.l #15073280,124(a2)
    2944:	007c 
    *cl++ = *clpartinstruction++;
    2946:	2579 0000 61f4 	move.l 61f4 <ClColor>,128(a2)
    294c:	0080 
    294e:	2579 0000 61f8 	move.l 61f8 <ClColor+0x4>,132(a2)
    2954:	0084 
    2956:	43ea 012c      	lea 300(a2),a1
    295a:	220a           	move.l a2,d1
    295c:	0681 0000 a52c 	addi.l #42284,d1
    2962:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    2968:	41e9 ff60      	lea -160(a1),a0
    296c:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    2970:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    2976:	5088           	addq.l #8,a0
    2978:	217c 0182 0f00 	move.l #25300736,-4(a0)
    297e:	fffc 
    for(int i2=0;i2<20;i2++) {
    2980:	b3c8           	cmpa.l a0,a1
    2982:	66ec           	bne.s 2970 <ClbuildZoom+0x146>
    2984:	43e8 00a4      	lea 164(a0),a1
    2988:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    298e:	b3c1           	cmpa.l d1,a1
    2990:	66d6           	bne.s 2968 <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    2992:	203c 0000 a488 	move.l #42120,d0
    2998:	72fe           	moveq #-2,d1
    299a:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    299e:	200a           	move.l a2,d0
    29a0:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    29a4:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    29a6:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    29ac:	4eae ffc4      	jsr -60(a6)
    29b0:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    29b6:	2200           	move.l d0,d1
    29b8:	243c 0000 3a01 	move.l #14849,d2
    29be:	7628           	moveq #40,d3
    29c0:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    29c4:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    29ca:	7201           	moveq #1,d1
    29cc:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    29d0:	24b9 0000 622c 	move.l 622c <ClsSprites>,(a2)
    29d6:	2579 0000 6230 	move.l 6230 <ClsSprites+0x4>,4(a2)
    29dc:	0004 
    29de:	2579 0000 6234 	move.l 6234 <ClsSprites+0x8>,8(a2)
    29e4:	0008 
    29e6:	2579 0000 6238 	move.l 6238 <ClsSprites+0xc>,12(a2)
    29ec:	000c 
    29ee:	2579 0000 623c 	move.l 623c <ClsSprites+0x10>,16(a2)
    29f4:	0010 
    29f6:	2579 0000 6240 	move.l 6240 <ClsSprites+0x14>,20(a2)
    29fc:	0014 
    29fe:	2579 0000 6244 	move.l 6244 <ClsSprites+0x18>,24(a2)
    2a04:	0018 
    2a06:	2579 0000 6248 	move.l 6248 <ClsSprites+0x1c>,28(a2)
    2a0c:	001c 
    2a0e:	2579 0000 624c 	move.l 624c <ClsSprites+0x20>,32(a2)
    2a14:	0020 
    2a16:	2579 0000 6250 	move.l 6250 <ClsSprites+0x24>,36(a2)
    2a1c:	0024 
    2a1e:	2579 0000 6254 	move.l 6254 <ClsSprites+0x28>,40(a2)
    2a24:	0028 
    2a26:	2579 0000 6258 	move.l 6258 <ClsSprites+0x2c>,44(a2)
    2a2c:	002c 
    2a2e:	2579 0000 625c 	move.l 625c <ClsSprites+0x30>,48(a2)
    2a34:	0030 
    2a36:	2579 0000 6260 	move.l 6260 <ClsSprites+0x34>,52(a2)
    2a3c:	0034 
    2a3e:	2579 0000 6264 	move.l 6264 <ClsSprites+0x38>,56(a2)
    2a44:	0038 
    2a46:	2579 0000 6268 	move.l 6268 <ClsSprites+0x3c>,60(a2)
    2a4c:	003c 
    *cl++ = *clpartinstruction++;
    2a4e:	2579 0000 61c4 	move.l 61c4 <ClScreenZoom>,64(a2)
    2a54:	0040 
    2a56:	2579 0000 61c8 	move.l 61c8 <ClScreenZoom+0x4>,68(a2)
    2a5c:	0044 
    2a5e:	2579 0000 61cc 	move.l 61cc <ClScreenZoom+0x8>,72(a2)
    2a64:	0048 
    2a66:	2579 0000 61d0 	move.l 61d0 <ClScreenZoom+0xc>,76(a2)
    2a6c:	004c 
    2a6e:	2579 0000 61d4 	move.l 61d4 <ClScreenZoom+0x10>,80(a2)
    2a74:	0050 
    2a76:	2579 0000 61d8 	move.l 61d8 <ClScreenZoom+0x14>,84(a2)
    2a7c:	0054 
    2a7e:	2579 0000 61dc 	move.l 61dc <ClScreenZoom+0x18>,88(a2)
    2a84:	0058 
    2a86:	2579 0000 61e0 	move.l 61e0 <ClScreenZoom+0x1c>,92(a2)
    2a8c:	005c 
    2a8e:	2579 0000 61e4 	move.l 61e4 <ClScreenZoom+0x20>,96(a2)
    2a94:	0060 
    2a96:	2579 0000 61e8 	move.l 61e8 <ClScreenZoom+0x24>,100(a2)
    2a9c:	0064 
    2a9e:	2579 0000 61ec 	move.l 61ec <ClScreenZoom+0x28>,104(a2)
    2aa4:	0068 
    2aa6:	2579 0000 61f0 	move.l 61f0 <ClScreenZoom+0x2c>,108(a2)
    2aac:	006c 
  *cl++ = 0x00e00000;
    2aae:	257c 00e0 0000 	move.l #14680064,112(a2)
    2ab4:	0070 
  *cl++ = 0x00e20000;
    2ab6:	257c 00e2 0000 	move.l #14811136,116(a2)
    2abc:	0074 
  *cl++ = 0x00e40000;
    2abe:	257c 00e4 0000 	move.l #14942208,120(a2)
    2ac4:	0078 
  *cl++ = 0x00e60000;
    2ac6:	257c 00e6 0000 	move.l #15073280,124(a2)
    2acc:	007c 
    *cl++ = *clpartinstruction++;
    2ace:	2579 0000 61f4 	move.l 61f4 <ClColor>,128(a2)
    2ad4:	0080 
    2ad6:	2579 0000 61f8 	move.l 61f8 <ClColor+0x4>,132(a2)
    2adc:	0084 
    2ade:	43ea 012c      	lea 300(a2),a1
    2ae2:	220a           	move.l a2,d1
    2ae4:	0681 0000 a52c 	addi.l #42284,d1
    2aea:	203c 2c07 fffe 	move.l #738721790,d0
    2af0:	6000 fe76      	bra.w 2968 <ClbuildZoom+0x13e>

00002af4 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    2af4:	2039 0000 6388 	move.l 6388 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    2afa:	23f9 0000 637c 	move.l 637c <ViewCopper>,6388 <DrawCopper>
    2b00:	0000 6388 
  ViewCopper = (ULONG *)tmp;
    2b04:	23c0 0000 637c 	move.l d0,637c <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    2b0a:	2079 0000 6372 	movea.l 6372 <hw>,a0
    2b10:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    2b14:	3140 0088      	move.w d0,136(a0)
}
    2b18:	4e75           	rts

00002b1a <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    2b1a:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    2b1e:	45fa fd0a      	lea 282a <ClbuildZoom>(pc),a2
    2b22:	4e92           	jsr (a2)
    2b24:	23c0 0000 6398 	move.l d0,6398 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    2b2a:	4e92           	jsr (a2)
    2b2c:	23c0 0000 6394 	move.l d0,6394 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2b32:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    2b38:	203c 0001 6800 	move.l #92160,d0
    2b3e:	7202           	moveq #2,d1
    2b40:	4eae ff3a      	jsr -198(a6)
    2b44:	23c0 0000 6390 	move.l d0,6390 <Bitplane1>
  if(Bitplane1 == 0) {
    2b4a:	6700 014e      	beq.w 2c9a <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    2b4e:	23c0 0000 638c 	move.l d0,638c <DrawBuffer>
  DrawCopper = Copperlist1;
    2b54:	23f9 0000 6398 	move.l 6398 <Copperlist1>,6388 <DrawCopper>
    2b5a:	0000 6388 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2b5e:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    2b64:	203c 0001 6800 	move.l #92160,d0
    2b6a:	7202           	moveq #2,d1
    2b6c:	4eae ff3a      	jsr -198(a6)
    2b70:	2400           	move.l d0,d2
    2b72:	23c0 0000 6384 	move.l d0,6384 <Bitplane2>
  if(Bitplane2 == 0) {
    2b78:	6778           	beq.s 2bf2 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    2b7a:	23f9 0000 6394 	move.l 6394 <Copperlist2>,637c <ViewCopper>
    2b80:	0000 637c 
  SwapCl();
    2b84:	45fa ff6e      	lea 2af4 <SwapCl>(pc),a2
    2b88:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    2b8a:	2039 0000 638c 	move.l 638c <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2b90:	2079 0000 6388 	movea.l 6388 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2b96:	2200           	move.l d0,d1
    2b98:	4241           	clr.w d1
    2b9a:	4841           	swap d1
    2b9c:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    2ba0:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    2ba4:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2baa:	2200           	move.l d0,d1
    2bac:	4241           	clr.w d1
    2bae:	4841           	swap d1
    2bb0:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2bb4:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    2bb8:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    2bba:	2079 0000 6388 	movea.l 6388 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2bc0:	2002           	move.l d2,d0
    2bc2:	4240           	clr.w d0
    2bc4:	4840           	swap d0
    2bc6:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    2bca:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    2bce:	2002           	move.l d2,d0
    2bd0:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2bd6:	2200           	move.l d0,d1
    2bd8:	4241           	clr.w d1
    2bda:	4841           	swap d1
    2bdc:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2be0:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    2be4:	23c2 0000 6380 	move.l d2,6380 <ViewBuffer>
}
    2bea:	7000           	moveq #0,d0
    2bec:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2bf0:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2bf2:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    2bf8:	4eae ffc4      	jsr -60(a6)
    2bfc:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    2c02:	2200           	move.l d0,d1
    2c04:	243c 0000 3a4e 	move.l #14926,d2
    2c0a:	7626           	moveq #38,d3
    2c0c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2c10:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    2c16:	7201           	moveq #1,d1
    2c18:	4eae ff70      	jsr -144(a6)
    2c1c:	2439 0000 6384 	move.l 6384 <Bitplane2>,d2
  ViewCopper = Copperlist2;
    2c22:	23f9 0000 6394 	move.l 6394 <Copperlist2>,637c <ViewCopper>
    2c28:	0000 637c 
  SwapCl();
    2c2c:	45fa fec6      	lea 2af4 <SwapCl>(pc),a2
    2c30:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    2c32:	2039 0000 638c 	move.l 638c <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2c38:	2079 0000 6388 	movea.l 6388 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2c3e:	2200           	move.l d0,d1
    2c40:	4241           	clr.w d1
    2c42:	4841           	swap d1
    2c44:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    2c48:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    2c4c:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2c52:	2200           	move.l d0,d1
    2c54:	4241           	clr.w d1
    2c56:	4841           	swap d1
    2c58:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2c5c:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    2c60:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    2c62:	2079 0000 6388 	movea.l 6388 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2c68:	2002           	move.l d2,d0
    2c6a:	4240           	clr.w d0
    2c6c:	4840           	swap d0
    2c6e:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    2c72:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    2c76:	2002           	move.l d2,d0
    2c78:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2c7e:	2200           	move.l d0,d1
    2c80:	4241           	clr.w d1
    2c82:	4841           	swap d1
    2c84:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2c88:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    2c8c:	23c2 0000 6380 	move.l d2,6380 <ViewBuffer>
}
    2c92:	7000           	moveq #0,d0
    2c94:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2c98:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2c9a:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    2ca0:	4eae ffc4      	jsr -60(a6)
    2ca4:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    2caa:	2200           	move.l d0,d1
    2cac:	243c 0000 3a27 	move.l #14887,d2
    2cb2:	7626           	moveq #38,d3
    2cb4:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2cb8:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    2cbe:	7201           	moveq #1,d1
    2cc0:	4eae ff70      	jsr -144(a6)
    2cc4:	2039 0000 6390 	move.l 6390 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    2cca:	23c0 0000 638c 	move.l d0,638c <DrawBuffer>
  DrawCopper = Copperlist1;
    2cd0:	23f9 0000 6398 	move.l 6398 <Copperlist1>,6388 <DrawCopper>
    2cd6:	0000 6388 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2cda:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    2ce0:	203c 0001 6800 	move.l #92160,d0
    2ce6:	7202           	moveq #2,d1
    2ce8:	4eae ff3a      	jsr -198(a6)
    2cec:	2400           	move.l d0,d2
    2cee:	23c0 0000 6384 	move.l d0,6384 <Bitplane2>
  if(Bitplane2 == 0) {
    2cf4:	6600 fe84      	bne.w 2b7a <PrepareDisplayZoom+0x60>
    2cf8:	6000 fef8      	bra.w 2bf2 <PrepareDisplayZoom+0xd8>

00002cfc <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2cfc:	2039 0000 638c 	move.l 638c <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2d02:	2079 0000 6388 	movea.l 6388 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    2d08:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2d0c:	2200           	move.l d0,d1
    2d0e:	4241           	clr.w d1
    2d10:	4841           	swap d1
    2d12:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    2d16:	23f9 0000 6380 	move.l 6380 <ViewBuffer>,638c <DrawBuffer>
    2d1c:	0000 638c 
  ViewBuffer = (ULONG *) tmp;
    2d20:	23c0 0000 6380 	move.l d0,6380 <ViewBuffer>
}
    2d26:	4e75           	rts

00002d28 <PrepareDisplay>:
 int PrepareDisplaySW() {
    2d28:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    2d2c:	45fa f44e      	lea 217c <ClBuild>(pc),a2
    2d30:	4e92           	jsr (a2)
    2d32:	23c0 0000 6398 	move.l d0,6398 <Copperlist1>
  Copperlist2 = ClbuildSW();
    2d38:	4e92           	jsr (a2)
    2d3a:	23c0 0000 6394 	move.l d0,6394 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2d40:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    2d46:	203c 0000 c800 	move.l #51200,d0
    2d4c:	7202           	moveq #2,d1
    2d4e:	4eae ff3a      	jsr -198(a6)
    2d52:	23c0 0000 6390 	move.l d0,6390 <Bitplane1>
  if(Bitplane1 == 0) {
    2d58:	6700 00ac      	beq.w 2e06 <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    2d5c:	23c0 0000 638c 	move.l d0,638c <DrawBuffer>
  DrawCopper = Copperlist1;
    2d62:	23f9 0000 6398 	move.l 6398 <Copperlist1>,6388 <DrawCopper>
    2d68:	0000 6388 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2d6c:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    2d72:	203c 0000 c800 	move.l #51200,d0
    2d78:	7202           	moveq #2,d1
    2d7a:	4eae ff3a      	jsr -198(a6)
    2d7e:	23c0 0000 6384 	move.l d0,6384 <Bitplane2>
  if(Bitplane2 == 0) {
    2d84:	6728           	beq.s 2dae <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    2d86:	23c0 0000 6380 	move.l d0,6380 <ViewBuffer>
  ViewCopper = Copperlist2;
    2d8c:	23f9 0000 6394 	move.l 6394 <Copperlist2>,637c <ViewCopper>
    2d92:	0000 637c 
  SwapCl();
    2d96:	47fa fd5c      	lea 2af4 <SwapCl>(pc),a3
    2d9a:	4e93           	jsr (a3)
  SetBplPointers();
    2d9c:	45fa ff5e      	lea 2cfc <SetBplPointers>(pc),a2
    2da0:	4e92           	jsr (a2)
  SwapCl();
    2da2:	4e93           	jsr (a3)
  SetBplPointers();
    2da4:	4e92           	jsr (a2)
}
    2da6:	7000           	moveq #0,d0
    2da8:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    2dac:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2dae:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    2db4:	4eae ffc4      	jsr -60(a6)
    2db8:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    2dbe:	2200           	move.l d0,d1
    2dc0:	243c 0000 3a4e 	move.l #14926,d2
    2dc6:	7626           	moveq #38,d3
    2dc8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2dcc:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    2dd2:	7201           	moveq #1,d1
    2dd4:	4eae ff70      	jsr -144(a6)
    2dd8:	2039 0000 6384 	move.l 6384 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    2dde:	23c0 0000 6380 	move.l d0,6380 <ViewBuffer>
  ViewCopper = Copperlist2;
    2de4:	23f9 0000 6394 	move.l 6394 <Copperlist2>,637c <ViewCopper>
    2dea:	0000 637c 
  SwapCl();
    2dee:	47fa fd04      	lea 2af4 <SwapCl>(pc),a3
    2df2:	4e93           	jsr (a3)
  SetBplPointers();
    2df4:	45fa ff06      	lea 2cfc <SetBplPointers>(pc),a2
    2df8:	4e92           	jsr (a2)
  SwapCl();
    2dfa:	4e93           	jsr (a3)
  SetBplPointers();
    2dfc:	4e92           	jsr (a2)
}
    2dfe:	7000           	moveq #0,d0
    2e00:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    2e04:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2e06:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    2e0c:	4eae ffc4      	jsr -60(a6)
    2e10:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    2e16:	2200           	move.l d0,d1
    2e18:	243c 0000 3a27 	move.l #14887,d2
    2e1e:	7626           	moveq #38,d3
    2e20:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2e24:	2c79 0000 639c 	movea.l 639c <DOSBase>,a6
    2e2a:	7201           	moveq #1,d1
    2e2c:	4eae ff70      	jsr -144(a6)
    2e30:	2039 0000 6390 	move.l 6390 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    2e36:	23c0 0000 638c 	move.l d0,638c <DrawBuffer>
  DrawCopper = Copperlist1;
    2e3c:	23f9 0000 6398 	move.l 6398 <Copperlist1>,6388 <DrawCopper>
    2e42:	0000 6388 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2e46:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    2e4c:	203c 0000 c800 	move.l #51200,d0
    2e52:	7202           	moveq #2,d1
    2e54:	4eae ff3a      	jsr -198(a6)
    2e58:	23c0 0000 6384 	move.l d0,6384 <Bitplane2>
  if(Bitplane2 == 0) {
    2e5e:	6600 ff26      	bne.w 2d86 <PrepareDisplay+0x5e>
    2e62:	6000 ff4a      	bra.w 2dae <PrepareDisplay+0x86>

00002e66 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    2e66:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    2e6a:	262f 0010      	move.l 16(sp),d3
    2e6e:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    2e72:	2279 0000 6398 	movea.l 6398 <Copperlist1>,a1
    2e78:	b2fc 0000      	cmpa.w #0,a1
    2e7c:	670c           	beq.s 2e8a <FreeDisplay+0x24>
    2e7e:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    2e84:	2003           	move.l d3,d0
    2e86:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    2e8a:	2279 0000 6394 	movea.l 6394 <Copperlist2>,a1
    2e90:	b2fc 0000      	cmpa.w #0,a1
    2e94:	670c           	beq.s 2ea2 <FreeDisplay+0x3c>
    2e96:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    2e9c:	2003           	move.l d3,d0
    2e9e:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    2ea2:	2279 0000 6390 	movea.l 6390 <Bitplane1>,a1
    2ea8:	b2fc 0000      	cmpa.w #0,a1
    2eac:	670c           	beq.s 2eba <FreeDisplay+0x54>
    2eae:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    2eb4:	2002           	move.l d2,d0
    2eb6:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    2eba:	2279 0000 6384 	movea.l 6384 <Bitplane2>,a1
    2ec0:	b2fc 0000      	cmpa.w #0,a1
    2ec4:	670c           	beq.s 2ed2 <FreeDisplay+0x6c>
    2ec6:	2c79 0000 63a0 	movea.l 63a0 <SysBase>,a6
    2ecc:	2002           	move.l d2,d0
    2ece:	4eae ff2e      	jsr -210(a6)
}
    2ed2:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2ed6:	4e75           	rts

00002ed8 <WaitVbl>:
void WaitVbl() {
    2ed8:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    2eda:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddbd84>,d0
    2ee0:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    2ee2:	2017           	move.l (sp),d0
    2ee4:	0280 0001 ff00 	andi.l #130816,d0
    2eea:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    2eec:	2017           	move.l (sp),d0
    2eee:	0c80 0001 3700 	cmpi.l #79616,d0
    2ef4:	67e4           	beq.s 2eda <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    2ef6:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddbd84>,d0
    2efc:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    2f00:	202f 0004      	move.l 4(sp),d0
    2f04:	0280 0001 ff00 	andi.l #130816,d0
    2f0a:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    2f0e:	202f 0004      	move.l 4(sp),d0
    2f12:	0c80 0001 3700 	cmpi.l #79616,d0
    2f18:	66dc           	bne.s 2ef6 <WaitVbl+0x1e>
}
    2f1a:	508f           	addq.l #8,sp
    2f1c:	4e75           	rts

00002f1e <memcpy>:
{
    2f1e:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    2f22:	202f 0014      	move.l 20(sp),d0
    2f26:	226f 0018      	movea.l 24(sp),a1
    2f2a:	222f 001c      	move.l 28(sp),d1
	while(len--)
    2f2e:	2601           	move.l d1,d3
    2f30:	5383           	subq.l #1,d3
    2f32:	4a81           	tst.l d1
    2f34:	6762           	beq.s 2f98 <memcpy+0x7a>
    2f36:	2040           	movea.l d0,a0
    2f38:	5888           	addq.l #4,a0
    2f3a:	b1c9           	cmpa.l a1,a0
    2f3c:	53c2           	sl.s d2
    2f3e:	4402           	neg.b d2
    2f40:	41e9 0004      	lea 4(a1),a0
    2f44:	b1c0           	cmpa.l d0,a0
    2f46:	53c4           	sl.s d4
    2f48:	4404           	neg.b d4
    2f4a:	8404           	or.b d4,d2
    2f4c:	7808           	moveq #8,d4
    2f4e:	b883           	cmp.l d3,d4
    2f50:	55c4           	sc.s d4
    2f52:	4404           	neg.b d4
    2f54:	c404           	and.b d4,d2
    2f56:	6746           	beq.s 2f9e <memcpy+0x80>
    2f58:	2409           	move.l a1,d2
    2f5a:	8480           	or.l d0,d2
    2f5c:	7803           	moveq #3,d4
    2f5e:	c484           	and.l d4,d2
    2f60:	663c           	bne.s 2f9e <memcpy+0x80>
    2f62:	2049           	movea.l a1,a0
    2f64:	2440           	movea.l d0,a2
    2f66:	74fc           	moveq #-4,d2
    2f68:	c481           	and.l d1,d2
    2f6a:	d489           	add.l a1,d2
		*d++ = *s++;
    2f6c:	24d8           	move.l (a0)+,(a2)+
    2f6e:	b488           	cmp.l a0,d2
    2f70:	66fa           	bne.s 2f6c <memcpy+0x4e>
    2f72:	74fc           	moveq #-4,d2
    2f74:	c481           	and.l d1,d2
    2f76:	2040           	movea.l d0,a0
    2f78:	d1c2           	adda.l d2,a0
    2f7a:	d3c2           	adda.l d2,a1
    2f7c:	9682           	sub.l d2,d3
    2f7e:	b481           	cmp.l d1,d2
    2f80:	6716           	beq.s 2f98 <memcpy+0x7a>
    2f82:	1091           	move.b (a1),(a0)
	while(len--)
    2f84:	4a83           	tst.l d3
    2f86:	6710           	beq.s 2f98 <memcpy+0x7a>
		*d++ = *s++;
    2f88:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    2f8e:	5383           	subq.l #1,d3
    2f90:	6706           	beq.s 2f98 <memcpy+0x7a>
		*d++ = *s++;
    2f92:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    2f98:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    2f9c:	4e75           	rts
    2f9e:	2040           	movea.l d0,a0
    2fa0:	d289           	add.l a1,d1
		*d++ = *s++;
    2fa2:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    2fa4:	b289           	cmp.l a1,d1
    2fa6:	67f0           	beq.s 2f98 <memcpy+0x7a>
		*d++ = *s++;
    2fa8:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    2faa:	b289           	cmp.l a1,d1
    2fac:	66f4           	bne.s 2fa2 <memcpy+0x84>
    2fae:	60e8           	bra.s 2f98 <memcpy+0x7a>

00002fb0 <memset>:
{
    2fb0:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    2fb4:	202f 0024      	move.l 36(sp),d0
    2fb8:	2a2f 0028      	move.l 40(sp),d5
    2fbc:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    2fc0:	2809           	move.l a1,d4
    2fc2:	5384           	subq.l #1,d4
    2fc4:	b2fc 0000      	cmpa.w #0,a1
    2fc8:	6f00 00b0      	ble.w 307a <memset+0xca>
    2fcc:	1e05           	move.b d5,d7
    2fce:	2200           	move.l d0,d1
    2fd0:	4481           	neg.l d1
    2fd2:	7403           	moveq #3,d2
    2fd4:	c282           	and.l d2,d1
    2fd6:	7c05           	moveq #5,d6
		*ptr++ = val;
    2fd8:	2440           	movea.l d0,a2
    2fda:	bc84           	cmp.l d4,d6
    2fdc:	646a           	bcc.s 3048 <memset+0x98>
    2fde:	4a81           	tst.l d1
    2fe0:	6724           	beq.s 3006 <memset+0x56>
    2fe2:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    2fe4:	5384           	subq.l #1,d4
    2fe6:	7401           	moveq #1,d2
    2fe8:	b481           	cmp.l d1,d2
    2fea:	671a           	beq.s 3006 <memset+0x56>
		*ptr++ = val;
    2fec:	2440           	movea.l d0,a2
    2fee:	548a           	addq.l #2,a2
    2ff0:	2040           	movea.l d0,a0
    2ff2:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    2ff6:	5384           	subq.l #1,d4
    2ff8:	7403           	moveq #3,d2
    2ffa:	b481           	cmp.l d1,d2
    2ffc:	6608           	bne.s 3006 <memset+0x56>
		*ptr++ = val;
    2ffe:	528a           	addq.l #1,a2
    3000:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    3004:	5384           	subq.l #1,d4
    3006:	2609           	move.l a1,d3
    3008:	9681           	sub.l d1,d3
    300a:	7c00           	moveq #0,d6
    300c:	1c05           	move.b d5,d6
    300e:	2406           	move.l d6,d2
    3010:	4842           	swap d2
    3012:	4242           	clr.w d2
    3014:	2042           	movea.l d2,a0
    3016:	2406           	move.l d6,d2
    3018:	e14a           	lsl.w #8,d2
    301a:	4842           	swap d2
    301c:	4242           	clr.w d2
    301e:	e18e           	lsl.l #8,d6
    3020:	2646           	movea.l d6,a3
    3022:	2c08           	move.l a0,d6
    3024:	8486           	or.l d6,d2
    3026:	2c0b           	move.l a3,d6
    3028:	8486           	or.l d6,d2
    302a:	1407           	move.b d7,d2
    302c:	2040           	movea.l d0,a0
    302e:	d1c1           	adda.l d1,a0
    3030:	72fc           	moveq #-4,d1
    3032:	c283           	and.l d3,d1
    3034:	d288           	add.l a0,d1
		*ptr++ = val;
    3036:	20c2           	move.l d2,(a0)+
    3038:	b1c1           	cmpa.l d1,a0
    303a:	66fa           	bne.s 3036 <memset+0x86>
    303c:	72fc           	moveq #-4,d1
    303e:	c283           	and.l d3,d1
    3040:	d5c1           	adda.l d1,a2
    3042:	9881           	sub.l d1,d4
    3044:	b283           	cmp.l d3,d1
    3046:	6732           	beq.s 307a <memset+0xca>
    3048:	1485           	move.b d5,(a2)
	while(len-- > 0)
    304a:	4a84           	tst.l d4
    304c:	6f2c           	ble.s 307a <memset+0xca>
		*ptr++ = val;
    304e:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    3052:	7201           	moveq #1,d1
    3054:	b284           	cmp.l d4,d1
    3056:	6c22           	bge.s 307a <memset+0xca>
		*ptr++ = val;
    3058:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    305c:	7402           	moveq #2,d2
    305e:	b484           	cmp.l d4,d2
    3060:	6c18           	bge.s 307a <memset+0xca>
		*ptr++ = val;
    3062:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    3066:	7c03           	moveq #3,d6
    3068:	bc84           	cmp.l d4,d6
    306a:	6c0e           	bge.s 307a <memset+0xca>
		*ptr++ = val;
    306c:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    3070:	7204           	moveq #4,d1
    3072:	b284           	cmp.l d4,d1
    3074:	6c04           	bge.s 307a <memset+0xca>
		*ptr++ = val;
    3076:	1545 0005      	move.b d5,5(a2)
}
    307a:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    307e:	4e75           	rts

00003080 <strlen>:
{
    3080:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    3084:	7000           	moveq #0,d0
	while(*s++)
    3086:	4a10           	tst.b (a0)
    3088:	6708           	beq.s 3092 <strlen+0x12>
		t++;
    308a:	5280           	addq.l #1,d0
	while(*s++)
    308c:	4a30 0800      	tst.b (0,a0,d0.l)
    3090:	66f8           	bne.s 308a <strlen+0xa>
}
    3092:	4e75           	rts

00003094 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    3094:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    3098:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    309c:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    30a0:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    30a4:	d041           	add.w d1,d0
	swap	d0
    30a6:	4840           	swap d0
	clrw	d0
    30a8:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    30aa:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    30ae:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    30b2:	d081           	add.l d1,d0

	rts
    30b4:	4e75           	rts

000030b6 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    30b6:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    30b8:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    30bc:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    30c0:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    30c6:	6416           	bcc.s 30de <__udivsi3+0x28>
	movel	d0, d2
    30c8:	2400           	move.l d0,d2
	clrw	d2
    30ca:	4242           	clr.w d2
	swap	d2
    30cc:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    30ce:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    30d0:	3002           	move.w d2,d0
	swap	d0
    30d2:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    30d4:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    30d8:	84c1           	divu.w d1,d2
	movew	d2, d0
    30da:	3002           	move.w d2,d0
	jra	6f
    30dc:	6030           	bra.s 310e <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    30de:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    30e0:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    30e2:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    30e4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    30ea:	64f4           	bcc.s 30e0 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    30ec:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    30ee:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    30f4:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    30f6:	c2c0           	mulu.w d0,d1
	swap	d2
    30f8:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    30fa:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    30fc:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    30fe:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    3100:	660a           	bne.s 310c <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    3102:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    3104:	6506           	bcs.s 310c <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    3106:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    310a:	6302           	bls.s 310e <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    310c:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    310e:	241f           	move.l (sp)+,d2
	rts
    3110:	4e75           	rts

00003112 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    3112:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    3114:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    3116:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    311a:	6a04           	bpl.s 3120 <__divsi3+0xe>
	negl	d1
    311c:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    311e:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    3120:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    3124:	6a04           	bpl.s 312a <__divsi3+0x18>
	negl	d0
    3126:	4480           	neg.l d0
	negb	d2
    3128:	4402           	neg.b d2

2:	movel	d1, sp@-
    312a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    312c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    312e:	6186           	bsr.s 30b6 <__udivsi3>
	addql	IMM (8), sp
    3130:	508f           	addq.l #8,sp

	tstb	d2
    3132:	4a02           	tst.b d2
	jpl	3f
    3134:	6a02           	bpl.s 3138 <__divsi3+0x26>
	negl	d0
    3136:	4480           	neg.l d0

3:	movel	sp@+, d2
    3138:	241f           	move.l (sp)+,d2
	rts
    313a:	4e75           	rts

0000313c <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    313c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    3140:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    3144:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    3146:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    3148:	61c8           	bsr.s 3112 <__divsi3>
	addql	IMM (8), sp
    314a:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    314c:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    3150:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    3152:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    3154:	6100 ff3e      	bsr.w 3094 <__mulsi3>
	addql	IMM (8), sp
    3158:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    315a:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    315e:	9280           	sub.l d0,d1
	movel	d1, d0
    3160:	2001           	move.l d1,d0
	rts
    3162:	4e75           	rts

00003164 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    3164:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    3168:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    316c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    316e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    3170:	6100 ff44      	bsr.w 30b6 <__udivsi3>
	addql	IMM (8), sp
    3174:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    3176:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    317a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    317c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    317e:	6100 ff14      	bsr.w 3094 <__mulsi3>
	addql	IMM (8), sp
    3182:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    3184:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    3188:	9280           	sub.l d0,d1
	movel	d1, d0
    318a:	2001           	move.l d1,d0
	rts
    318c:	4e75           	rts

0000318e <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    318e:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    3190:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    3194:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    3198:	2c5f           	movea.l (sp)+,a6
    rts
    319a:	4e75           	rts

0000319c <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    319c:	16c0           	move.b d0,(a3)+
	rts
    319e:	4e75           	rts

000031a0 <saveregs>:
	...

000031dc <font2distance>:
    31dc:	0505           	btst d2,d5
    31de:	0505           	btst d2,d5
    31e0:	0505           	btst d2,d5
    31e2:	0505           	btst d2,d5
    31e4:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    31e6:	0505           	btst d2,d5
    31e8:	0505           	btst d2,d5
    31ea:	0005 0505      	ori.b #5,d5
    31ee:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    31f0:	0505           	btst d2,d5
    31f2:	0505           	btst d2,d5
    31f4:	0505           	btst d2,d5
    31f6:	0505           	btst d2,d5
    31f8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    31fa:	0505           	btst d2,d5
    31fc:	0505           	btst d2,d5
    31fe:	0505           	btst d2,d5
    3200:	0505           	btst d2,d5
    3202:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    3204:	0500           	btst d2,d0
    3206:	0505           	btst d2,d5
    3208:	0505           	btst d2,d5
    320a:	0505           	btst d2,d5
    320c:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    320e:	0505           	btst d2,d5
    3210:	0505           	btst d2,d5
    3212:	0505           	btst d2,d5
    3214:	0505           	btst d2,d5
    3216:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    3218:	0505           	btst d2,d5
    321a:	0505           	btst d2,d5
    321c:	0503           	btst d2,d3
    321e:	0505           	btst d2,d5
    3220:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    3222:	0505           	btst d2,d5
    3224:	0500           	btst d2,d0
    3226:	0505           	btst d2,d5
    3228:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    322c:	0505           	btst d2,d5
    322e:	0503           	btst d2,d3
    3230:	0205 0507      	andi.b #7,d5
    3234:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    3236:	0505           	btst d2,d5
    3238:	0505           	btst d2,d5
    323a:	0505           	btst d2,d5
    323c:	0505           	btst d2,d5
    323e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3240:	0505           	btst d2,d5
    3242:	0505           	btst d2,d5
    3244:	0505           	btst d2,d5
    3246:	0505           	btst d2,d5
    3248:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    324a:	0505           	btst d2,d5
    324c:	0505           	btst d2,d5
    324e:	0505           	btst d2,d5
    3250:	0505           	btst d2,d5
    3252:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3254:	0505           	btst d2,d5
    3256:	0505           	btst d2,d5
    3258:	0505           	btst d2,d5
    325a:	0505           	btst d2,d5
    325c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    325e:	0505           	btst d2,d5
    3260:	0505           	btst d2,d5
    3262:	0505           	btst d2,d5
    3264:	0505           	btst d2,d5
    3266:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3268:	0505           	btst d2,d5
    326a:	0505           	btst d2,d5
    326c:	0505           	btst d2,d5
    326e:	0505           	btst d2,d5
    3270:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3272:	0505           	btst d2,d5
    3274:	0505           	btst d2,d5
    3276:	0505           	btst d2,d5
    3278:	0505           	btst d2,d5
    327a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    327c:	0505           	btst d2,d5
    327e:	0505           	btst d2,d5
    3280:	0505           	btst d2,d5
    3282:	0505           	btst d2,d5
    3284:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3286:	0505           	btst d2,d5
    3288:	0505           	btst d2,d5
    328a:	0505           	btst d2,d5
    328c:	0505           	btst d2,d5
    328e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3290:	0505           	btst d2,d5
    3292:	0505           	btst d2,d5
    3294:	0505           	btst d2,d5
    3296:	0505           	btst d2,d5
    3298:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    329a:	0505           	btst d2,d5
    329c:	0505           	btst d2,d5
    329e:	0505           	btst d2,d5
    32a0:	0505           	btst d2,d5
    32a2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    32a4:	0505           	btst d2,d5
    32a6:	0505           	btst d2,d5
    32a8:	0505           	btst d2,d5
    32aa:	0505           	btst d2,d5
    32ac:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    32ae:	0505           	btst d2,d5
    32b0:	0505           	btst d2,d5
    32b2:	0505           	btst d2,d5
    32b4:	0505           	btst d2,d5
    32b6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    32b8:	0505           	btst d2,d5
    32ba:	0505           	btst d2,d5
    32bc:	0505           	btst d2,d5
    32be:	0505           	btst d2,d5
    32c0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    32c2:	0505           	btst d2,d5
    32c4:	0505           	btst d2,d5
    32c6:	0505           	btst d2,d5
    32c8:	0505           	btst d2,d5
    32ca:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    32cc:	0505           	btst d2,d5
    32ce:	0505           	btst d2,d5
    32d0:	0505           	btst d2,d5
    32d2:	0505           	btst d2,d5
    32d4:	0505           	btst d2,d5

000032d6 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    32d6:	16c0           	move.b d0,(a3)+
  RTS
    32d8:	4e75           	rts

000032da <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    32da:	48f9 7fff 0000 	movem.l d0-a6,31a0 <saveregs>
    32e0:	31a0 
  lea 0xdff000,a5
    32e2:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddbd80>,a5
  move.l sp@(4),a0  //Fontlocation
    32e8:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    32ec:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    32f0:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    32f4:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    32f6:	082d 0006 0002 	btst #6,2(a5)

000032fc <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    32fc:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    3302:	66f8           	bne.s 32fc <st2wblit>

00003304 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    3304:	7019           	moveq #25,d0
	sub.l d5,d5      
    3306:	9a85           	sub.l d5,d5

00003308 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    3308:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    330a:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    330c:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    3310:	9dce           	suba.l a6,a6
	move.l d2, a6
    3312:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    3314:	ddfc 0000 31dc 	adda.l #12764,a6

	LSL  	#4,d2 	    //Fetch next char
    331a:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    331c:	2842           	movea.l d2,a4


	move.l  #0,d4
    331e:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    3320:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    3322:	3814           	move.w (a4),d4
	swap	d4
    3324:	4844           	swap d4
	lsr.l	d5, d4
    3326:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    3328:	8993           	or.l d4,(a3)
	clr.l	d4
    332a:	4284           	clr.l d4
	move.w  2(a4), d4
    332c:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    3330:	4844           	swap d4
	lsr.l	d5, d4
    3332:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    3334:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    3338:	4284           	clr.l d4
	move.w  4(a4), d4
    333a:	382c 0004      	move.w 4(a4),d4
	swap	d4
    333e:	4844           	swap d4
	lsr.l	d5, d4
    3340:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    3342:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    3346:	4284           	clr.l d4
	move.w  6(a4), d4
    3348:	382c 0006      	move.w 6(a4),d4
	swap	d4
    334c:	4844           	swap d4
	lsr.l	d5, d4
    334e:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    3350:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    3354:	4284           	clr.l d4
	move.w  8(a4), d4
    3356:	382c 0008      	move.w 8(a4),d4
	swap	d4
    335a:	4844           	swap d4
	lsr.l	d5, d4
    335c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    335e:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    3362:	4284           	clr.l d4
	move.w  10(a4), d4
    3364:	382c 000a      	move.w 10(a4),d4
	swap	d4
    3368:	4844           	swap d4
	lsr.l	d5, d4
    336a:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    336c:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    3370:	4284           	clr.l d4
	move.w  12(a4), d4
    3372:	382c 000c      	move.w 12(a4),d4
	swap	d4
    3376:	4844           	swap d4
	lsr.l	d5, d4
    3378:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    337a:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    337e:	4284           	clr.l d4
	move.w  14(a4), d4
    3380:	382c 000e      	move.w 14(a4),d4
	swap	d4
    3384:	4844           	swap d4
	lsr.l	d5, d4
    3386:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    3388:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    338c:	4284           	clr.l d4

	add.b   (a6), d5
    338e:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    3390:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    3394:	6500 0006      	bcs.w 339c <noadditionalchar>
	addq.w  #1, a3
    3398:	524b           	addq.w #1,a3
	sub.w   #8,d5
    339a:	5145           	subq.w #8,d5

0000339c <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    339c:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    339e:	51c8 ff68      	dbf d0,3308 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    33a2:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    33a6:	51cb ff5c      	dbf d3,3304 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    33aa:	4cfa 7fff fdf2 	movem.l 31a0 <saveregs>(pc),d0-a6

	RTS
    33b0:	4e75           	rts
