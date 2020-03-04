
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
       6:	4e55 ffb0      	link.w a5,#-80
       a:	48e7 3f3a      	movem.l d2-d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 5ea8 	move.l a6,5ea8 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,5e7a <hw>
      1e:	0000 5e7a 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 35a9 	lea 35a9 <incbin_swfont_end+0x113>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 5e7e 	move.l d0,5e7e <GfxBase>
	if (!GfxBase)
      34:	6700 1574      	beq.w 15aa <main+0x15a4>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
      3e:	43f9 0000 35ba 	lea 35ba <incbin_swfont_end+0x124>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 5ea4 	move.l d0,5ea4 <DOSBase>
	if (!DOSBase)
      50:	6700 154c      	beq.w 159e <main+0x1598>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 35c6 	pea 35c6 <incbin_swfont_end+0x130>
      5a:	4eb9 0000 17e0 	jsr 17e0 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 35e2 	move.l #13794,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 5e7a 	movea.l 5e7a <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 35f2 	move.l #13810,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 1d7e 	lea 1d7e <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 5ea0 	move.l d0,5ea0 <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 5e90 	move.l d0,5e90 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 5e9c 	move.l d0,5e9c <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 5e84 	move.l d0,5e84 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 5d60 	cmp.l 5d60 <ClsSprites>,d0
      d2:	6600 1408      	bne.w 14dc <main+0x14d6>
      d6:	206a 0004      	movea.l 4(a2),a0
      da:	b1f9 0000 5d64 	cmpa.l 5d64 <ClsSprites+0x4>,a0
      e0:	6600 13fa      	bne.w 14dc <main+0x14d6>
      e4:	202a 0008      	move.l 8(a2),d0
      e8:	b0b9 0000 5d68 	cmp.l 5d68 <ClsSprites+0x8>,d0
      ee:	6600 13ec      	bne.w 14dc <main+0x14d6>
      f2:	206a 000c      	movea.l 12(a2),a0
      f6:	b1f9 0000 5d6c 	cmpa.l 5d6c <ClsSprites+0xc>,a0
      fc:	6600 13de      	bne.w 14dc <main+0x14d6>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 5d70 	cmp.l 5d70 <ClsSprites+0x10>,d0
     10a:	6600 13d0      	bne.w 14dc <main+0x14d6>
     10e:	206a 0014      	movea.l 20(a2),a0
     112:	b1f9 0000 5d74 	cmpa.l 5d74 <ClsSprites+0x14>,a0
     118:	6600 13c2      	bne.w 14dc <main+0x14d6>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 5d78 	cmp.l 5d78 <ClsSprites+0x18>,d0
     126:	6600 13b4      	bne.w 14dc <main+0x14d6>
     12a:	206a 001c      	movea.l 28(a2),a0
     12e:	b1f9 0000 5d7c 	cmpa.l 5d7c <ClsSprites+0x1c>,a0
     134:	6600 13a6      	bne.w 14dc <main+0x14d6>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 5d80 	cmp.l 5d80 <ClsSprites+0x20>,d0
     142:	6600 1398      	bne.w 14dc <main+0x14d6>
     146:	206a 0024      	movea.l 36(a2),a0
     14a:	b1f9 0000 5d84 	cmpa.l 5d84 <ClsSprites+0x24>,a0
     150:	6600 138a      	bne.w 14dc <main+0x14d6>
     154:	202a 0028      	move.l 40(a2),d0
     158:	b0b9 0000 5d88 	cmp.l 5d88 <ClsSprites+0x28>,d0
     15e:	6600 137c      	bne.w 14dc <main+0x14d6>
     162:	206a 002c      	movea.l 44(a2),a0
     166:	b1f9 0000 5d8c 	cmpa.l 5d8c <ClsSprites+0x2c>,a0
     16c:	6600 136e      	bne.w 14dc <main+0x14d6>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 5d90 	cmp.l 5d90 <ClsSprites+0x30>,d0
     17a:	6600 1360      	bne.w 14dc <main+0x14d6>
     17e:	206a 0034      	movea.l 52(a2),a0
     182:	b1f9 0000 5d94 	cmpa.l 5d94 <ClsSprites+0x34>,a0
     188:	6600 1352      	bne.w 14dc <main+0x14d6>
     18c:	202a 0038      	move.l 56(a2),d0
     190:	b0b9 0000 5d98 	cmp.l 5d98 <ClsSprites+0x38>,d0
     196:	6600 1344      	bne.w 14dc <main+0x14d6>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 5d9c 	cmpa.l 5d9c <ClsSprites+0x3c>,a2
     1a4:	6600 1336      	bne.w 14dc <main+0x14d6>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 5ea0 	movea.l 5ea0 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 5d30 	move.l 5d30 <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 136c      	bne.w 1526 <main+0x1520>
     1bc:	2039 0000 5d34 	move.l 5d34 <ClScreen+0x4>,d0
     1c2:	b0a8 0044      	cmp.l 68(a0),d0
     1c6:	6600 135e      	bne.w 1526 <main+0x1520>
     1ca:	2028 0048      	move.l 72(a0),d0
     1ce:	b0b9 0000 5d38 	cmp.l 5d38 <ClScreen+0x8>,d0
     1d4:	6600 1350      	bne.w 1526 <main+0x1520>
     1d8:	2039 0000 5d3c 	move.l 5d3c <ClScreen+0xc>,d0
     1de:	b0a8 004c      	cmp.l 76(a0),d0
     1e2:	6600 1342      	bne.w 1526 <main+0x1520>
     1e6:	2039 0000 5d40 	move.l 5d40 <ClScreen+0x10>,d0
     1ec:	b0a8 0050      	cmp.l 80(a0),d0
     1f0:	6600 1334      	bne.w 1526 <main+0x1520>
     1f4:	2028 0054      	move.l 84(a0),d0
     1f8:	b0b9 0000 5d44 	cmp.l 5d44 <ClScreen+0x14>,d0
     1fe:	6600 1326      	bne.w 1526 <main+0x1520>
     202:	2039 0000 5d48 	move.l 5d48 <ClScreen+0x18>,d0
     208:	b0a8 0058      	cmp.l 88(a0),d0
     20c:	6600 1318      	bne.w 1526 <main+0x1520>
     210:	2039 0000 5d4c 	move.l 5d4c <ClScreen+0x1c>,d0
     216:	b0a8 005c      	cmp.l 92(a0),d0
     21a:	6600 130a      	bne.w 1526 <main+0x1520>
     21e:	2039 0000 5d50 	move.l 5d50 <ClScreen+0x20>,d0
     224:	b0a8 0060      	cmp.l 96(a0),d0
     228:	6600 12fc      	bne.w 1526 <main+0x1520>
     22c:	2028 0064      	move.l 100(a0),d0
     230:	b0b9 0000 5d54 	cmp.l 5d54 <ClScreen+0x24>,d0
     236:	6600 12ee      	bne.w 1526 <main+0x1520>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 5d58 	cmp.l 5d58 <ClScreen+0x28>,d0
     244:	6600 12e0      	bne.w 1526 <main+0x1520>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 5d5c 	cmpa.l 5d5c <ClScreen+0x2c>,a0
     252:	6600 12d2      	bne.w 1526 <main+0x1520>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     256:	23fc 0004 0000 	move.l #262144,5e94 <DrawBuffer>
     25c:	0000 5e94 
  ViewBuffer = (ULONG *)0x50000;
     260:	23fc 0005 0000 	move.l #327680,5e88 <ViewBuffer>
     266:	0000 5e88 
  SetBplPointers();
     26a:	45f9 0000 2830 	lea 2830 <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,5e94 <DrawBuffer>
     278:	0000 5e94 
     27c:	6700 12f0      	beq.w 156e <main+0x1568>
    Write( Output(), 
     280:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 35f5 	move.l #13813,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     29e:	2079 0000 5ea0 	movea.l 5ea0 <Copperlist1>,a0
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 3631 	move.l #13873,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 5ea0 	movea.l 5ea0 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 366e 	move.l #13934,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 5ea0 	movea.l 5ea0 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2028 0078      	move.l 120(a0),d0
     304:	b0b9 0000 5d28 	cmp.l 5d28 <ClColor>,d0
     30a:	6600 11f2      	bne.w 14fe <main+0x14f8>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 5d2c 	cmp.l 5d2c <ClColor+0x4>,d0
     318:	6600 11e4      	bne.w 14fe <main+0x14f8>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 36cd 	move.l #14029,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 2628 	lea 2628 <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2079 0000 5e90 	movea.l 5e90 <DrawCopper>,a0
     350:	b1f9 0000 5e9c 	cmpa.l 5e9c <Copperlist2>,a0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 36f0 	move.l #14064,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 285c 	lea 285c <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 5e94 	move.l 5e94 <DrawBuffer>,d0
     384:	b0b9 0000 5e98 	cmp.l 5e98 <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 3706 	move.l #14086,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2079 0000 5e90 	movea.l 5e90 <DrawCopper>,a0
     3b0:	b1f9 0000 5ea0 	cmpa.l 5ea0 <Copperlist1>,a0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 373e 	move.l #14142,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2039 0000 5e88 	move.l 5e88 <ViewBuffer>,d0
     3de:	b0b9 0000 5e8c 	cmp.l 5e8c <Bitplane2>,d0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 3778 	move.l #14200,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2079 0000 5e84 	movea.l 5e84 <ViewCopper>,a0
     40a:	b1f9 0000 5e9c 	cmpa.l 5e9c <Copperlist2>,a0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 37b1 	move.l #14257,d2
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
     434:	2079 0000 5e84 	movea.l 5e84 <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     44c:	b0b9 0000 5e8c 	cmp.l 5e8c <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 37ec 	move.l #14316,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     476:	2079 0000 5e84 	movea.l 5e84 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     48e:	b0b9 0000 5e98 	cmp.l 5e98 <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 3835 	move.l #14389,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4b8:	2079 0000 5e84 	movea.l 5e84 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4d0:	b0b9 0000 5e8c 	cmp.l 5e8c <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 387f 	move.l #14463,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	4eb9 0000 299a 	jsr 299a <FreeDisplay>
  TestZoom4Picture();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     506:	283c 0000 264e 	move.l #9806,d4
     50c:	2044           	movea.l d4,a0
     50e:	4e90           	jsr (a0)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     510:	4878 0010      	pea 10 <main+0xa>
     514:	4879 0000 5d60 	pea 5d60 <ClsSprites>
     51a:	42a7           	clr.l -(sp)
     51c:	2f39 0000 5ea0 	move.l 5ea0 <Copperlist1>,-(sp)
     522:	47f9 0000 1ba8 	lea 1ba8 <TestCopperlistBatch>,a3
     528:	4e93           	jsr (a3)
     52a:	4fef 0018      	lea 24(sp),sp
     52e:	4a80           	tst.l d0
     530:	661e           	bne.s 550 <main+0x54a>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     532:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     538:	4eae ffc4      	jsr -60(a6)
     53c:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     542:	2200           	move.l d0,d1
     544:	243c 0000 38c8 	move.l #14536,d2
     54a:	762c           	moveq #44,d3
     54c:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     550:	4878 000c      	pea c <main+0x6>
     554:	4879 0000 5cf8 	pea 5cf8 <ClScreenZoom>
     55a:	4878 0010      	pea 10 <main+0xa>
     55e:	2f39 0000 5ea0 	move.l 5ea0 <Copperlist1>,-(sp)
     564:	4e93           	jsr (a3)
     566:	4fef 0010      	lea 16(sp),sp
     56a:	4a80           	tst.l d0
     56c:	661e           	bne.s 58c <main+0x586>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     56e:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     574:	4eae ffc4      	jsr -60(a6)
     578:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     57e:	2200           	move.l d0,d1
     580:	243c 0000 38fe 	move.l #14590,d2
     586:	7636           	moveq #54,d3
     588:	4eae ffd0      	jsr -48(a6)
  //ZoomHorizontal = 10;
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     58c:	2079 0000 5e90 	movea.l 5e90 <DrawCopper>,a0
  copword += ZMBPLPTRS+1;
  for(int i=1;i<=2;i++) {
    UWORD highword = ptr >> 16;
    UWORD lowword = ptr & 0xffff;
    *copword = highword;
     592:	317c 0004 0072 	move.w #4,114(a0)
    copword += 2;
    *copword = lowword;
     598:	4268 0076      	clr.w 118(a0)
    *copword = highword;
     59c:	317c 0004 007a 	move.w #4,122(a0)
    *copword = lowword;
     5a2:	317c 2800 007e 	move.w #10240,126(a0)
    copword += 2;
    ptr += 40*256;
  }
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
     5a8:	23fc 0005 0000 	move.l #327680,5e94 <DrawBuffer>
     5ae:	0000 5e94 
  ViewBuffer = (ULONG *) tmp;
     5b2:	23fc 0004 0000 	move.l #262144,5e88 <ViewBuffer>
     5b8:	0000 5e88 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5bc:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c2:	4878 001c      	pea 1c <main+0x16>
     5c6:	2f39 0000 5ea0 	move.l 5ea0 <Copperlist1>,-(sp)
     5cc:	49f9 0000 1b8a 	lea 1b8a <TestCopperlistPos>,a4
     5d2:	4e94           	jsr (a4)
     5d4:	4fef 000c      	lea 12(sp),sp
     5d8:	4a80           	tst.l d0
     5da:	661e           	bne.s 5fa <main+0x5f4>
    Write(Output(), 
     5dc:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     5e2:	4eae ffc4      	jsr -60(a6)
     5e6:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     5ec:	2200           	move.l d0,d1
     5ee:	243c 0000 3631 	move.l #13873,d2
     5f4:	763c           	moveq #60,d3
     5f6:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     5fa:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     600:	4878 001d      	pea 1d <main+0x17>
     604:	2f39 0000 5ea0 	move.l 5ea0 <Copperlist1>,-(sp)
     60a:	4e94           	jsr (a4)
     60c:	4fef 000c      	lea 12(sp),sp
     610:	4a80           	tst.l d0
     612:	661e           	bne.s 632 <main+0x62c>
    Write(Output(), 
     614:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     61a:	4eae ffc4      	jsr -60(a6)
     61e:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     624:	2200           	move.l d0,d1
     626:	243c 0000 366e 	move.l #13934,d2
     62c:	763c           	moveq #60,d3
     62e:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     632:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     638:	4878 001e      	pea 1e <main+0x18>
     63c:	2f39 0000 5ea0 	move.l 5ea0 <Copperlist1>,-(sp)
     642:	4e94           	jsr (a4)
     644:	4fef 000c      	lea 12(sp),sp
     648:	4a80           	tst.l d0
     64a:	661e           	bne.s 66a <main+0x664>
    Write(Output(), 
     64c:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     652:	4eae ffc4      	jsr -60(a6)
     656:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     65c:	2200           	move.l d0,d1
     65e:	243c 0000 3935 	move.l #14645,d2
     664:	763c           	moveq #60,d3
     666:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     66a:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     670:	4878 001f      	pea 1f <main+0x19>
     674:	2f39 0000 5ea0 	move.l 5ea0 <Copperlist1>,-(sp)
     67a:	4e94           	jsr (a4)
     67c:	4fef 000c      	lea 12(sp),sp
     680:	4a80           	tst.l d0
     682:	661e           	bne.s 6a2 <main+0x69c>
    Write(Output(), 
     684:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     68a:	4eae ffc4      	jsr -60(a6)
     68e:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     694:	2200           	move.l d0,d1
     696:	243c 0000 3972 	move.l #14706,d2
     69c:	763c           	moveq #60,d3
     69e:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6a2:	4878 0002      	pea 2 <_start+0x2>
     6a6:	4879 0000 5d28 	pea 5d28 <ClColor>
     6ac:	4878 0020      	pea 20 <main+0x1a>
     6b0:	2f39 0000 5ea0 	move.l 5ea0 <Copperlist1>,-(sp)
     6b6:	4e93           	jsr (a3)
     6b8:	4fef 0010      	lea 16(sp),sp
     6bc:	4a80           	tst.l d0
     6be:	661e           	bne.s 6de <main+0x6d8>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6c0:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     6c6:	4eae ffc4      	jsr -60(a6)
     6ca:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     6d0:	2200           	move.l d0,d1
     6d2:	243c 0000 36ab 	move.l #13995,d2
     6d8:	7621           	moveq #33,d3
     6da:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6de:	7ec0           	moveq #-64,d7
     6e0:	de8d           	add.l a5,d7
     6e2:	4878 0040      	pea 40 <main+0x3a>
     6e6:	4879 0000 3cb8 	pea 3cb8 <rundemo.c.d99b7c69+0x1f>
     6ec:	2f07           	move.l d7,-(sp)
     6ee:	4eb9 0000 2a52 	jsr 2a52 <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     6f4:	4878 0010      	pea 10 <main+0xa>
     6f8:	2f07           	move.l d7,-(sp)
     6fa:	4878 0022      	pea 22 <main+0x1c>
     6fe:	2f39 0000 5ea0 	move.l 5ea0 <Copperlist1>,-(sp)
     704:	4e93           	jsr (a3)
     706:	4fef 001c      	lea 28(sp),sp
     70a:	4a80           	tst.l d0
     70c:	661e           	bne.s 72c <main+0x726>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     70e:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     714:	4eae ffc4      	jsr -60(a6)
     718:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     71e:	2200           	move.l d0,d1
     720:	243c 0000 39af 	move.l #14767,d2
     726:	7621           	moveq #33,d3
     728:	4eae ffd0      	jsr -48(a6)

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     72c:	2b7c 2d07 fffe 	move.l #755499006,-76(a5)
     732:	ffb4 
     734:	2b7c 0182 00f0 	move.l #25297136,-72(a5)
     73a:	ffb8 
     73c:	2b7c 0182 0f00 	move.l #25300736,-68(a5)
     742:	ffbc 

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
     744:	4878 0003      	pea 3 <_start+0x3>
     748:	486d ffb4      	pea -76(a5)
     74c:	4878 004b      	pea 4b <main+0x45>
     750:	2f39 0000 5ea0 	move.l 5ea0 <Copperlist1>,-(sp)
     756:	4e93           	jsr (a3)
     758:	4fef 0010      	lea 16(sp),sp
     75c:	4a80           	tst.l d0
     75e:	661e           	bne.s 77e <main+0x778>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     760:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     766:	4eae ffc4      	jsr -60(a6)
     76a:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     770:	2200           	move.l d0,d1
     772:	243c 0000 39d1 	move.l #14801,d2
     778:	762c           	moveq #44,d3
     77a:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     77e:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdce28>
     782:	4878 2922      	pea 2922 <PrepareDisplay+0xc6>
     786:	2f39 0000 5ea0 	move.l 5ea0 <Copperlist1>,-(sp)
     78c:	4e94           	jsr (a4)
     78e:	4fef 000c      	lea 12(sp),sp
     792:	4a80           	tst.l d0
     794:	661e           	bne.s 7b4 <main+0x7ae>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     796:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     79c:	4eae ffc4      	jsr -60(a6)
     7a0:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     7a6:	2200           	move.l d0,d1
     7a8:	243c 0000 36cd 	move.l #14029,d2
     7ae:	7622           	moveq #34,d3
     7b0:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7b4:	2f3c 0001 6800 	move.l #92160,-(sp)
     7ba:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7c0:	4eb9 0000 299a 	jsr 299a <FreeDisplay>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7c6:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
     7cc:	7004           	moveq #4,d0
     7ce:	7202           	moveq #2,d1
     7d0:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
     7d4:	33fc 0010 0000 	move.w #16,5e82 <ZoomHorizontal>
     7da:	5e82 

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     7dc:	2044           	movea.l d4,a0
     7de:	4e90           	jsr (a0)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7e0:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
     7e6:	203c 0000 c800 	move.l #51200,d0
     7ec:	7202           	moveq #2,d1
     7ee:	4eae ff3a      	jsr -198(a6)
     7f2:	2440           	movea.l d0,a2
     7f4:	23c0 0000 5e64 	move.l d0,5e64 <Zoom_Source>
  if( Zoom_Source == 0) {
     7fa:	508f           	addq.l #8,sp
     7fc:	6700 0e2e      	beq.w 162c <main+0x1626>
    return;
  }

  
  UWORD *tstsource = Zoom_Source;
  *tstsource++ = 0x0000;
     800:	4252           	clr.w (a2)
  *tstsource = 0x0080;
     802:	357c 0080 0002 	move.w #128,2(a2)
  tstsource += ZMLINESIZE/2-1;
  *tstsource = 0x1000;
     808:	357c 1000 0030 	move.w #4096,48(a2)
  tstsource++;
  *tstsource = 0x8e88;
     80e:	357c 8e88 0032 	move.w #-29048,50(a2)
  tstsource += ZMLINESIZE/2-1;

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
  *tstsource++ = 0x0000;
     814:	426a 17d0      	clr.w 6096(a2)
  *tstsource = 0x00ff;
     818:	357c 00ff 17d2 	move.w #255,6098(a2)

  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 0, 8, 128);
     81e:	2439 0000 5e94 	move.l 5e94 <DrawBuffer>,d2
    srca = source + 1;
     824:	2600           	move.l d0,d3
     826:	5483           	addq.l #2,d3
  WaitBlit();
     828:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
     82e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     832:	2079 0000 5e7a 	movea.l 5e7a <hw>,a0
     838:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     83e:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltafwm = 0xffff;
     844:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     84a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     850:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     856:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     85c:	317c ff00 0070 	move.w #-256,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     862:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
     868:	2143 0050      	move.l d3,80(a0)
  hw->bltbpt = srcb;
     86c:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = destination;
     870:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = height*64+2;
     874:	317c 2002 0058 	move.w #8194,88(a0)
  WaitBlit();
     87a:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
     880:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     884:	2479 0000 5e94 	movea.l 5e94 <DrawBuffer>,a2
  if( *destination != 0x0180) {
     88a:	0c6a 0180 0002 	cmpi.w #384,2(a2)
     890:	671e           	beq.s 8b0 <main+0x8aa>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
     892:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     898:	4eae ffc4      	jsr -60(a6)
     89c:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     8a2:	2200           	move.l d0,d1
     8a4:	243c 0000 3a36 	move.l #14902,d2
     8aa:	761c           	moveq #28,d3
     8ac:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8b0:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
     8b6:	671e           	beq.s 8d6 <main+0x8d0>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
     8b8:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     8be:	4eae ffc4      	jsr -60(a6)
     8c2:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     8c8:	2200           	move.l d0,d1
     8ca:	243c 0000 3a53 	move.l #14931,d2
     8d0:	761c           	moveq #28,d3
     8d2:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     8d6:	2079 0000 5e94 	movea.l 5e94 <DrawBuffer>,a0
     8dc:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
     8e2:	671e           	beq.s 902 <main+0x8fc>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
     8e4:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     8ea:	4eae ffc4      	jsr -60(a6)
     8ee:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     8f4:	2200           	move.l d0,d1
     8f6:	243c 0000 3a70 	move.l #14960,d2
     8fc:	761a           	moveq #26,d3
     8fe:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     902:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
     908:	2279 0000 5e64 	movea.l 5e64 <Zoom_Source>,a1
     90e:	203c 0000 c800 	move.l #51200,d0
     914:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     918:	2f3c 0001 6800 	move.l #92160,-(sp)
     91e:	2f3c 0000 a48c 	move.l #42124,-(sp)
     924:	4eb9 0000 299a 	jsr 299a <FreeDisplay>
     92a:	508f           	addq.l #8,sp
}

void TestCopyColumnOfZoom() {

  PrepareDisplayZoom();
     92c:	2044           	movea.l d4,a0
     92e:	4e90           	jsr (a0)

  UWORD *destination = (UWORD *)DrawBuffer;
     930:	2079 0000 5e94 	movea.l 5e94 <DrawBuffer>,a0
  *destination= 0x0000;
     936:	4250           	clr.w (a0)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     938:	317c 000f 0030 	move.w #15,48(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     93e:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     944:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
     94a:	203c 0000 c800 	move.l #51200,d0
     950:	7202           	moveq #2,d1
     952:	4eae ff3a      	jsr -198(a6)
     956:	2440           	movea.l d0,a2
     958:	23c0 0000 5e64 	move.l d0,5e64 <Zoom_Source>
  if( Zoom_Source == 0) {
     95e:	6700 0d20      	beq.w 1680 <main+0x167a>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }

  UWORD *tstsource = Zoom_Source;
  *tstsource = 0xffff;
     962:	34bc ffff      	move.w #-1,(a2)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     966:	357c ffff 0030 	move.w #-1,48(a2)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0xc000;
     96c:	357c c000 47d0 	move.w #-16384,18384(a2)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 1, 1);
     972:	2439 0000 5e94 	move.l 5e94 <DrawBuffer>,d2
  WaitBlit();
     978:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
     97e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     982:	2079 0000 5e7a 	movea.l 5e7a <hw>,a0
     988:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     98e:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     994:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     99a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     9a0:	317c 002e 0064 	move.w #46,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     9a6:	317c 002e 0062 	move.w #46,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     9ac:	317c 002e 0066 	move.w #46,102(a0)
  hw->bltcdat = bltmask;
     9b2:	317c 4000 0070 	move.w #16384,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     9b8:	214a 0050      	move.l a2,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     9bc:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     9c0:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     9c4:	317c 6001 0058 	move.w #24577,88(a0)
  
  WaitBlit();
     9ca:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
     9d0:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     9d4:	2479 0000 5e94 	movea.l 5e94 <DrawBuffer>,a2
  if( *destination != 0x4000)
     9da:	0c52 4000      	cmpi.w #16384,(a2)
     9de:	671e           	beq.s 9fe <main+0x9f8>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     9e0:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     9e6:	4eae ffc4      	jsr -60(a6)
     9ea:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     9f0:	2200           	move.l d0,d1
     9f2:	243c 0000 3a8b 	move.l #14987,d2
     9f8:	7629           	moveq #41,d3
     9fa:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x400f)
     9fe:	0c6a 400f 0030 	cmpi.w #16399,48(a2)
     a04:	671e           	beq.s a24 <main+0xa1e>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     a06:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     a0c:	4eae ffc4      	jsr -60(a6)
     a10:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     a16:	2200           	move.l d0,d1
     a18:	243c 0000 3ab5 	move.l #15029,d2
     a1e:	762a           	moveq #42,d3
     a20:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     a24:	2479 0000 5e94 	movea.l 5e94 <DrawBuffer>,a2
     a2a:	0c6a 400f 47d0 	cmpi.w #16399,18384(a2)
     a30:	6724           	beq.s a56 <main+0xa50>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     a32:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     a38:	4eae ffc4      	jsr -60(a6)
     a3c:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     a42:	2200           	move.l d0,d1
     a44:	243c 0000 3ae0 	move.l #15072,d2
     a4a:	7628           	moveq #40,d3
     a4c:	4eae ffd0      	jsr -48(a6)
     a50:	2479 0000 5e94 	movea.l 5e94 <DrawBuffer>,a2

  destination = (UWORD *)DrawBuffer;
  *destination= 0x0000;
     a56:	4252           	clr.w (a2)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     a58:	357c 000f 0030 	move.w #15,48(a2)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     a5e:	357c 000f 47d0 	move.w #15,18384(a2)

  tstsource = Zoom_Source;
     a64:	2439 0000 5e64 	move.l 5e64 <Zoom_Source>,d2
  *tstsource = 0xffff;
     a6a:	2042           	movea.l d2,a0
     a6c:	30bc ffff      	move.w #-1,(a0)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     a70:	317c ffff 0030 	move.w #-1,48(a0)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0x8000;
     a76:	317c 8000 47d0 	move.w #-32768,18384(a0)
  WaitBlit();
     a7c:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
     a82:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     a86:	2079 0000 5e7a 	movea.l 5e7a <hw>,a0
     a8c:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     a92:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     a98:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     a9e:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     aa4:	317c 002e 0064 	move.w #46,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     aaa:	317c 002e 0062 	move.w #46,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     ab0:	317c 002e 0066 	move.w #46,102(a0)
  hw->bltcdat = bltmask;
     ab6:	317c 8000 0070 	move.w #-32768,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     abc:	2142 0050      	move.l d2,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     ac0:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     ac4:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     ac8:	317c 6001 0058 	move.w #24577,88(a0)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 0, 0);
  
  WaitBlit();
     ace:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
     ad4:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     ad8:	2479 0000 5e94 	movea.l 5e94 <DrawBuffer>,a2
  if( *destination != 0x8000)
     ade:	0c52 8000      	cmpi.w #-32768,(a2)
     ae2:	671e           	beq.s b02 <main+0xafc>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     ae4:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     aea:	4eae ffc4      	jsr -60(a6)
     aee:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     af4:	2200           	move.l d0,d1
     af6:	243c 0000 3b09 	move.l #15113,d2
     afc:	7628           	moveq #40,d3
     afe:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x800f)
     b02:	0c6a 800f 0030 	cmpi.w #-32753,48(a2)
     b08:	671e           	beq.s b28 <main+0xb22>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     b0a:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     b10:	4eae ffc4      	jsr -60(a6)
     b14:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     b1a:	2200           	move.l d0,d1
     b1c:	243c 0000 3b32 	move.l #15154,d2
     b22:	7629           	moveq #41,d3
     b24:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     b28:	2079 0000 5e94 	movea.l 5e94 <DrawBuffer>,a0
     b2e:	0c68 800f 47d0 	cmpi.w #-32753,18384(a0)
     b34:	671e           	beq.s b54 <main+0xb4e>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     b36:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     b3c:	4eae ffc4      	jsr -60(a6)
     b40:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     b46:	2200           	move.l d0,d1
     b48:	243c 0000 3b5c 	move.l #15196,d2
     b4e:	7627           	moveq #39,d3
     b50:	4eae ffd0      	jsr -48(a6)

  FreeMem( Zoom_Source, 40*256*5);
     b54:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
     b5a:	2279 0000 5e64 	movea.l 5e64 <Zoom_Source>,a1
     b60:	203c 0000 c800 	move.l #51200,d0
     b66:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     b6a:	2f3c 0001 6800 	move.l #92160,-(sp)
     b70:	2f3c 0000 a48c 	move.l #42124,-(sp)
     b76:	4eb9 0000 299a 	jsr 299a <FreeDisplay>
     b7c:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     b7e:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
     b84:	203c 0000 05a0 	move.l #1440,d0
     b8a:	7202           	moveq #2,d1
     b8c:	4eae ff3a      	jsr -198(a6)
     b90:	2440           	movea.l d0,a2
  if( source == 0) {
     b92:	4a80           	tst.l d0
     b94:	6700 0a3e      	beq.w 15d4 <main+0x15ce>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     b98:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
     b9e:	203c 0000 05a0 	move.l #1440,d0
     ba4:	7202           	moveq #2,d1
     ba6:	4eae ff3a      	jsr -198(a6)
     baa:	2800           	move.l d0,d4
  if( destination == 0) {
     bac:	6700 0a26      	beq.w 15d4 <main+0x15ce>
    return;
  }
  
  UWORD *tmp = source;
  for( int i=0; i<8;i++) {
    *tmp++ = 0;
     bb0:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
     bb2:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
     bb8:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
     bbe:	426a 0006      	clr.w 6(a2)
    tmp += ZMLINESIZE/2-3;
    *tmp++ = 0;
     bc2:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
     bc6:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
     bcc:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
     bd2:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
     bd6:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
     bda:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
     be0:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
     be6:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
     bea:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
     bee:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
     bf4:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
     bfa:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
     bfe:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
     c02:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
     c08:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
     c0e:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
     c12:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
     c16:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
     c1c:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
     c22:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
     c26:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
     c2a:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
     c30:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
     c36:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
     c3a:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
     c3e:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
     c44:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
     c4a:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
     c4e:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
     c52:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
     c58:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
     c5e:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
     c62:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
     c66:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
     c6c:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
     c72:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
     c76:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
     c7a:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
     c80:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
     c86:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
     c8a:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
     c8e:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
     c94:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
     c9a:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
     c9e:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
     ca2:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
     ca8:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
     cae:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
     cb2:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
     cb6:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
     cbc:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
     cc2:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
     cc6:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
     cca:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
     cd0:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
     cd6:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
     cda:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
     cde:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
     ce4:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
     cea:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
     cee:	4878 05a0      	pea 5a0 <main+0x59a>
     cf2:	42a7           	clr.l -(sp)
     cf4:	2f00           	move.l d0,-(sp)
     cf6:	4eb9 0000 2ae4 	jsr 2ae4 <memset>
  WaitBlit();
     cfc:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
     d02:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     d06:	2079 0000 5e7a 	movea.l 5e7a <hw>,a0
     d0c:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     d12:	317c 39f0 0040 	move.w #14832,64(a0)
  hw->bltafwm = 0xffff;
     d18:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     d1e:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     d24:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     d2a:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
     d30:	200a           	move.l a2,d0
     d32:	5480           	addq.l #2,d0
     d34:	2140 0050      	move.l d0,80(a0)
  hw->bltdpt = (UWORD *) destination;
     d38:	2144 0054      	move.l d4,84(a0)
  hw->bltsize = height*64+2;
     d3c:	317c 0402 0058 	move.w #1026,88(a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    *tmp++ = 0;
  }

  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 3, 16);
  WaitBlit();
     d42:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
     d48:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     d4c:	4fef 000c      	lea 12(sp),sp
     d50:	2044           	movea.l d4,a0
     d52:	0c68 5555 0002 	cmpi.w #21845,2(a0)
     d58:	671e           	beq.s d78 <main+0xd72>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     d5a:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     d60:	4eae ffc4      	jsr -60(a6)
     d64:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     d6a:	2200           	move.l d0,d1
     d6c:	243c 0000 3bba 	move.l #15290,d2
     d72:	761f           	moveq #31,d3
     d74:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     d78:	2044           	movea.l d4,a0
     d7a:	0c68 aaaa 0032 	cmpi.w #-21846,50(a0)
     d80:	671e           	beq.s da0 <main+0xd9a>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     d82:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     d88:	4eae ffc4      	jsr -60(a6)
     d8c:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
     d92:	2200           	move.l d0,d1
     d94:	243c 0000 3bda 	move.l #15322,d2
     d9a:	7620           	moveq #32,d3
     d9c:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     da0:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
     da6:	224a           	movea.l a2,a1
     da8:	203c 0000 05a0 	move.l #1440,d0
     dae:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     db2:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
     db8:	2244           	movea.l d4,a1
     dba:	203c 0000 05a0 	move.l #1440,d0
     dc0:	4eae ff2e      	jsr -210(a6)
5    5    5    2    a    a    a    a    9    5    5    5    5    4    a    a
abcd efgh ijkl 1234 5678 9abc defg hijk l123 4567 89ab cdef ghij kl12 3456 789a
1010 1010 1010 0101 0101 0101 0101 0101 0010 1010 1010 1010 1010 1001 0101 0101
a    a    a    5    5    5    5    5    2    a    a    a    a    9    5    5*/ 
void TestZoom4Picture() {
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dc4:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
     dca:	203c 0000 3740 	move.l #14144,d0
     dd0:	7202           	moveq #2,d1
     dd2:	4eae ff3a      	jsr -198(a6)
     dd6:	2400           	move.l d0,d2
  if( source == 0) {
     dd8:	6700 0830      	beq.w 160a <main+0x1604>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     ddc:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
     de2:	203c 0000 3740 	move.l #14144,d0
     de8:	7202           	moveq #2,d1
     dea:	4eae ff3a      	jsr -198(a6)
     dee:	2440           	movea.l d0,a2
  if( destination == 0) {
     df0:	4a80           	tst.l d0
     df2:	6700 08d8      	beq.w 16cc <main+0x16c6>
     df6:	2002           	move.l d2,d0
     df8:	0680 0000 3300 	addi.l #13056,d0
     dfe:	2042           	movea.l d2,a0
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
     e00:	20bc 5555 5555 	move.l #1431655765,(a0)
     e06:	217c 5555 5555 	move.l #1431655765,4(a0)
     e0c:	0004 
     e0e:	217c 5555 5555 	move.l #1431655765,8(a0)
     e14:	0008 
     e16:	217c 5555 5555 	move.l #1431655765,12(a0)
     e1c:	000c 
     e1e:	217c 5555 5555 	move.l #1431655765,16(a0)
     e24:	0010 
     e26:	217c 5555 5555 	move.l #1431655765,20(a0)
     e2c:	0014 
     e2e:	217c 5555 5555 	move.l #1431655765,24(a0)
     e34:	0018 
     e36:	217c 5555 5555 	move.l #1431655765,28(a0)
     e3c:	001c 
     e3e:	217c 5555 5555 	move.l #1431655765,32(a0)
     e44:	0020 
     e46:	217c 5555 5555 	move.l #1431655765,36(a0)
     e4c:	0024 
     e4e:	217c 5555 5555 	move.l #1431655765,40(a0)
     e54:	0028 
     e56:	217c 5555 5555 	move.l #1431655765,44(a0)
     e5c:	002c 
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
     e5e:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     e64:	0030 
     e66:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     e6c:	0034 
     e6e:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     e74:	0038 
     e76:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     e7c:	003c 
     e7e:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     e84:	0040 
     e86:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     e8c:	0044 
     e8e:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     e94:	0048 
     e96:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     e9c:	004c 
     e9e:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     ea4:	0050 
     ea6:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
     eac:	0054 
     eae:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
     eb4:	0058 
     eb6:	41e8 0060      	lea 96(a0),a0
     eba:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     ec0:	fffc 
  for(int i=0;i<128+8;i++) {
     ec2:	b1c0           	cmpa.l d0,a0
     ec4:	6600 ff3a      	bne.w e00 <main+0xdfa>
  }
  
  Zoom_ZoomIntoPicture( source, destination, 0);
     ec8:	42a7           	clr.l -(sp)
     eca:	2f0a           	move.l a2,-(sp)
     ecc:	2f02           	move.l d2,-(sp)
     ece:	4eb9 0000 1fdc 	jsr 1fdc <Zoom_ZoomIntoPicture>
  WaitBlit();
     ed4:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
     eda:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
     ede:	41ea 0004      	lea 4(a2),a0
     ee2:	2b48 ffb0      	move.l a0,-80(a5)
  UWORD *valsupposed = destlinezoom1;
  for(int i=0;i<16;i++) {
     ee6:	2a0a           	move.l a2,d5
     ee8:	0685 0000 0304 	addi.l #772,d5
     eee:	4fef 000c      	lea 12(sp),sp
  UWORD *valactual = destination+2; 
     ef2:	7610           	moveq #16,d3
     ef4:	2c3c 0000 1a74 	move.l #6772,d6
     efa:	2c45           	movea.l d5,a6
     efc:	4dee fd00      	lea -768(a6),a6
     f00:	78f0           	moveq #-16,d4
     f02:	d883           	add.l d3,d4
    for(int i2=0;i2<16;i2+=2) {
      TestRow( valsupposed, valactual, 0x0000, i2+i*17);
     f04:	2f04           	move.l d4,-(sp)
     f06:	42a7           	clr.l -(sp)
     f08:	2f0e           	move.l a6,-(sp)
     f0a:	2046           	movea.l d6,a0
     f0c:	4e90           	jsr (a0)
      valactual += ZMLINESIZE/2;
     
      TestRow( valsupposed, valactual, 0xffff, i2+1+i*17);
     f0e:	2044           	movea.l d4,a0
     f10:	4868 0001      	pea 1(a0)
     f14:	2f3c 0000 ffff 	move.l #65535,-(sp)
     f1a:	486e 0030      	pea 48(a6)
     f1e:	2046           	movea.l d6,a0
     f20:	4e90           	jsr (a0)
      valactual += ZMLINESIZE/2;
     f22:	4dee 0060      	lea 96(a6),a6
     f26:	5484           	addq.l #2,d4
    for(int i2=0;i2<16;i2+=2) {
     f28:	4fef 0018      	lea 24(sp),sp
     f2c:	ba8e           	cmp.l a6,d5
     f2e:	66d4           	bne.s f04 <main+0xefe>
    }
    TestRow( valsupposed, valactual, 0x0000, 16+i*17);
     f30:	2f03           	move.l d3,-(sp)
     f32:	42a7           	clr.l -(sp)
     f34:	2f0e           	move.l a6,-(sp)
     f36:	2046           	movea.l d6,a0
     f38:	4e90           	jsr (a0)
    valactual += ZMLINESIZE/2;
     f3a:	2a0e           	move.l a6,d5
     f3c:	0685 0000 0330 	addi.l #816,d5
     f42:	7011           	moveq #17,d0
     f44:	d680           	add.l d0,d3
  for(int i=0;i<16;i++) {
     f46:	4fef 000c      	lea 12(sp),sp
     f4a:	0c83 0000 0120 	cmpi.l #288,d3
     f50:	66a8           	bne.s efa <main+0xef4>
  UWORD *tmp = source;
  source = destination;
  destination = tmp;
          //return;
  UWORD *bp = (UWORD *)0x202;
  *bp = 0;
     f52:	4278 0202      	clr.w 202 <main+0x1fc>
  Zoom_ZoomIntoPicture( source, destination, 1);
     f56:	4878 0001      	pea 1 <_start+0x1>
     f5a:	2f02           	move.l d2,-(sp)
     f5c:	2f0a           	move.l a2,-(sp)
     f5e:	4eb9 0000 1fdc 	jsr 1fdc <Zoom_ZoomIntoPicture>
  WaitBlit();
     f64:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
     f6a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
     f6e:	2c02           	move.l d2,d6
     f70:	5886           	addq.l #4,d6
     f72:	4fef 000c      	lea 12(sp),sp
  valsupposed = destlinezoom2;
  for(int i=0;i<8;i+=2) {   
     f76:	7600           	moveq #0,d3
     f78:	4df9 0000 195e 	lea 195e <TestRow.constprop.3>,a6
    TestRow( valsupposed, valactual, 0x0000, i);
     f7e:	2f03           	move.l d3,-(sp)
     f80:	42a7           	clr.l -(sp)
     f82:	2f06           	move.l d6,-(sp)
     f84:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
     
    TestRow( valsupposed, valactual, 0xffff, i+1);
     f86:	2043           	movea.l d3,a0
     f88:	4868 0001      	pea 1(a0)
     f8c:	2f3c 0000 ffff 	move.l #65535,-(sp)
     f92:	2046           	movea.l d6,a0
     f94:	4868 0030      	pea 48(a0)
     f98:	4e96           	jsr (a6)
  for(int i=0;i<8;i+=2) {   
     f9a:	5483           	addq.l #2,d3
    valactual += ZMLINESIZE/2;
     f9c:	7060           	moveq #96,d0
     f9e:	dc80           	add.l d0,d6
  for(int i=0;i<8;i+=2) {   
     fa0:	4fef 0018      	lea 24(sp),sp
     fa4:	7008           	moveq #8,d0
     fa6:	b083           	cmp.l d3,d0
     fa8:	66d4           	bne.s f7e <main+0xf78>
  }
  TestRow( valsupposed, valactual, 0x0000, 8);
     faa:	4878 0008      	pea 8 <main+0x2>
     fae:	42a7           	clr.l -(sp)
     fb0:	2042           	movea.l d2,a0
     fb2:	4868 0184      	pea 388(a0)
     fb6:	4e96           	jsr (a6)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 9);
     fb8:	4878 0009      	pea 9 <main+0x3>
     fbc:	42a7           	clr.l -(sp)
     fbe:	2042           	movea.l d2,a0
     fc0:	4868 01b4      	pea 436(a0)
     fc4:	4e96           	jsr (a6)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 10);
     fc6:	4878 000a      	pea a <main+0x4>
     fca:	2f3c 0000 ffff 	move.l #65535,-(sp)
     fd0:	2042           	movea.l d2,a0
     fd2:	4868 01e4      	pea 484(a0)
     fd6:	4e96           	jsr (a6)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 11);
     fd8:	4fef 0024      	lea 36(sp),sp
     fdc:	4878 000b      	pea b <main+0x5>
     fe0:	2f3c 0000 ffff 	move.l #65535,-(sp)
     fe6:	2042           	movea.l d2,a0
     fe8:	4868 0214      	pea 532(a0)
     fec:	4e96           	jsr (a6)
  valactual += ZMLINESIZE/2;

  for(int i=0;i<14;i++) {
     fee:	2c02           	move.l d2,d6
     ff0:	0686 0000 04e4 	addi.l #1252,d6
     ff6:	4fef 000c      	lea 12(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 11);
     ffa:	761a           	moveq #26,d3
     ffc:	2806           	move.l d6,d4
     ffe:	0684 ffff fd60 	addi.l #-672,d4
    1004:	7af2           	moveq #-14,d5
    1006:	da83           	add.l d3,d5
    for(int i2=0;i2<14;i2+=2) {
      TestRow( valsupposed, valactual, 0x0000, i2+i*18+12);
    1008:	2f05           	move.l d5,-(sp)
    100a:	42a7           	clr.l -(sp)
    100c:	2f04           	move.l d4,-(sp)
    100e:	4e96           	jsr (a6)
      valactual += ZMLINESIZE/2;
     
      TestRow( valsupposed, valactual, 0xffff, i2+1+i*18+12);
    1010:	2045           	movea.l d5,a0
    1012:	4868 0001      	pea 1(a0)
    1016:	2f3c 0000 ffff 	move.l #65535,-(sp)
    101c:	2044           	movea.l d4,a0
    101e:	4868 0030      	pea 48(a0)
    1022:	4e96           	jsr (a6)
      valactual += ZMLINESIZE/2;
    1024:	7060           	moveq #96,d0
    1026:	d880           	add.l d0,d4
    1028:	5485           	addq.l #2,d5
    for(int i2=0;i2<14;i2+=2) {
    102a:	4fef 0018      	lea 24(sp),sp
    102e:	b886           	cmp.l d6,d4
    1030:	66d6           	bne.s 1008 <main+0x1002>
    }
    TestRow( valsupposed, valactual, 0x0000, 14+12+i*18);
    1032:	2f03           	move.l d3,-(sp)
    1034:	42a7           	clr.l -(sp)
    1036:	2f06           	move.l d6,-(sp)
    1038:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0x0000, 15+12+i*18);
    103a:	2043           	movea.l d3,a0
    103c:	4868 0001      	pea 1(a0)
    1040:	42a7           	clr.l -(sp)
    1042:	2046           	movea.l d6,a0
    1044:	4868 0030      	pea 48(a0)
    1048:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0xffff, 16+12+i*18);
    104a:	2043           	movea.l d3,a0
    104c:	4868 0002      	pea 2(a0)
    1050:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1056:	2046           	movea.l d6,a0
    1058:	4868 0060      	pea 96(a0)
    105c:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0xffff, 17+12+i*18);
    105e:	4fef 0024      	lea 36(sp),sp
    1062:	2043           	movea.l d3,a0
    1064:	4868 0003      	pea 3(a0)
    1068:	2f3c 0000 ffff 	move.l #65535,-(sp)
    106e:	2046           	movea.l d6,a0
    1070:	4868 0090      	pea 144(a0)
    1074:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    1076:	0686 0000 0360 	addi.l #864,d6
    107c:	7012           	moveq #18,d0
    107e:	d680           	add.l d0,d3
  for(int i=0;i<14;i++) {
    1080:	4fef 000c      	lea 12(sp),sp
    1084:	0c83 0000 0116 	cmpi.l #278,d3
    108a:	6600 ff70      	bne.w ffc <main+0xff6>
    108e:	2c02           	move.l d2,d6
    1090:	0686 0000 3184 	addi.l #12676,d6
    1096:	263c 0000 0108 	move.l #264,d3
  }
  for(int i=0;i<8;i+=2) {
    TestRow( valsupposed, valactual, 0x0000, 264+i);
    109c:	2f03           	move.l d3,-(sp)
    109e:	42a7           	clr.l -(sp)
    10a0:	2f06           	move.l d6,-(sp)
    10a2:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
     
    TestRow( valsupposed, valactual, 0xffff, 265+i);
    10a4:	2043           	movea.l d3,a0
    10a6:	4868 0001      	pea 1(a0)
    10aa:	2f3c 0000 ffff 	move.l #65535,-(sp)
    10b0:	2046           	movea.l d6,a0
    10b2:	4868 0030      	pea 48(a0)
    10b6:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    10b8:	5483           	addq.l #2,d3
    10ba:	7060           	moveq #96,d0
    10bc:	dc80           	add.l d0,d6
  for(int i=0;i<8;i+=2) {
    10be:	4fef 0018      	lea 24(sp),sp
    10c2:	0c83 0000 0110 	cmpi.l #272,d3
    10c8:	66d2           	bne.s 109c <main+0x1096>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 2);
    10ca:	4878 0002      	pea 2 <_start+0x2>
    10ce:	2f0a           	move.l a2,-(sp)
    10d0:	2f02           	move.l d2,-(sp)
    10d2:	4eb9 0000 1fdc 	jsr 1fdc <Zoom_ZoomIntoPicture>
  WaitBlit();
    10d8:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    10de:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom3;
  
  TestRow( valsupposed, valactual, 0x0000, 0);
    10e2:	42a7           	clr.l -(sp)
    10e4:	42a7           	clr.l -(sp)
    10e6:	2f2d ffb0      	move.l -80(a5),-(sp)
    10ea:	4df9 0000 1848 	lea 1848 <TestRow.constprop.4>,a6
    10f0:	4e96           	jsr (a6)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 1);
    10f2:	4878 0001      	pea 1 <_start+0x1>
    10f6:	42a7           	clr.l -(sp)
    10f8:	486a 0034      	pea 52(a2)
    10fc:	4e96           	jsr (a6)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 2);
    10fe:	4fef 0024      	lea 36(sp),sp
    1102:	4878 0002      	pea 2 <_start+0x2>
    1106:	2f3c 0000 ffff 	move.l #65535,-(sp)
    110c:	486a 0064      	pea 100(a2)
    1110:	4e96           	jsr (a6)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 3);
    1112:	4878 0003      	pea 3 <_start+0x3>
    1116:	2f3c 0000 ffff 	move.l #65535,-(sp)
    111c:	486a 0094      	pea 148(a2)
    1120:	4e96           	jsr (a6)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 4);
    1122:	4878 0004      	pea 4 <_start+0x4>
    1126:	42a7           	clr.l -(sp)
    1128:	486a 00c4      	pea 196(a2)
    112c:	4e96           	jsr (a6)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 5);
    112e:	4fef 0024      	lea 36(sp),sp
    1132:	4878 0005      	pea 5 <_start+0x5>
    1136:	42a7           	clr.l -(sp)
    1138:	486a 00f4      	pea 244(a2)
    113c:	4e96           	jsr (a6)
  valactual += ZMLINESIZE/2;

  for(int i=0;i<14;i++) {
    113e:	45ea 0394      	lea 916(a2),a2
    1142:	4fef 000c      	lea 12(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 5);
    1146:	7413           	moveq #19,d2
    1148:	260a           	move.l a2,d3
    114a:	0683 ffff fd90 	addi.l #-624,d3
    1150:	7af3           	moveq #-13,d5
    1152:	da82           	add.l d2,d5
    UWORD mask = 0xffff;
    1154:	78ff           	moveq #-1,d4
    for(int i2=0;i2<13;i2++) {
      TestRow( valsupposed, valactual, mask, i2+6+i*19);
    1156:	2f05           	move.l d5,-(sp)
    1158:	3f04           	move.w d4,-(sp)
    115a:	4267           	clr.w -(sp)
    115c:	2f03           	move.l d3,-(sp)
    115e:	4e96           	jsr (a6)
      valactual += ZMLINESIZE/2;
    1160:	7030           	moveq #48,d0
    1162:	d680           	add.l d0,d3
      mask = mask ^ 0xffff;
    1164:	4644           	not.w d4
    1166:	5285           	addq.l #1,d5
    for(int i2=0;i2<13;i2++) {
    1168:	4fef 000c      	lea 12(sp),sp
    116c:	b5c3           	cmpa.l d3,a2
    116e:	66e6           	bne.s 1156 <main+0x1150>
    }
    TestRow( valsupposed, valactual, 0x0000, 19+i*19);
    1170:	2f02           	move.l d2,-(sp)
    1172:	42a7           	clr.l -(sp)
    1174:	2f0a           	move.l a2,-(sp)
    1176:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0x0000, 19+i*19);
    1178:	2f02           	move.l d2,-(sp)
    117a:	42a7           	clr.l -(sp)
    117c:	486a 0030      	pea 48(a2)
    1180:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0xffff, 19+i*19);
    1182:	2f02           	move.l d2,-(sp)
    1184:	2f3c 0000 ffff 	move.l #65535,-(sp)
    118a:	486a 0060      	pea 96(a2)
    118e:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0xffff, 19+i*19);
    1190:	4fef 0020      	lea 32(sp),sp
    1194:	2e82           	move.l d2,(sp)
    1196:	2f3c 0000 ffff 	move.l #65535,-(sp)
    119c:	486a 0090      	pea 144(a2)
    11a0:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0x0000, 19+i*19);
    11a2:	2f02           	move.l d2,-(sp)
    11a4:	42a7           	clr.l -(sp)
    11a6:	486a 00c0      	pea 192(a2)
    11aa:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0x0000, 19+i*19);
    11ac:	2f02           	move.l d2,-(sp)
    11ae:	42a7           	clr.l -(sp)
    11b0:	486a 00f0      	pea 240(a2)
    11b4:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    11b6:	45ea 0390      	lea 912(a2),a2
    11ba:	7013           	moveq #19,d0
    11bc:	d480           	add.l d0,d2
  for(int i=0;i<14;i++) {
    11be:	4fef 0024      	lea 36(sp),sp
    11c2:	0c82 0000 011d 	cmpi.l #285,d2
    11c8:	6600 ff7e      	bne.w 1148 <main+0x1142>
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
    11cc:	4eb9 0000 285c 	jsr 285c <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    11d2:	4878 0010      	pea 10 <main+0xa>
    11d6:	4879 0000 5d60 	pea 5d60 <ClsSprites>
    11dc:	42a7           	clr.l -(sp)
    11de:	2f39 0000 5ea0 	move.l 5ea0 <Copperlist1>,-(sp)
    11e4:	4e93           	jsr (a3)
    11e6:	4fef 0010      	lea 16(sp),sp
    11ea:	4a80           	tst.l d0
    11ec:	661e           	bne.s 120c <main+0x1206>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    11ee:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    11f4:	4eae ffc4      	jsr -60(a6)
    11f8:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    11fe:	2200           	move.l d0,d1
    1200:	243c 0000 38c8 	move.l #14536,d2
    1206:	762c           	moveq #44,d3
    1208:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    120c:	4878 000c      	pea c <main+0x6>
    1210:	4879 0000 5d30 	pea 5d30 <ClScreen>
    1216:	4878 0010      	pea 10 <main+0xa>
    121a:	2f39 0000 5ea0 	move.l 5ea0 <Copperlist1>,-(sp)
    1220:	4e93           	jsr (a3)
    1222:	4fef 0010      	lea 16(sp),sp
    1226:	4a80           	tst.l d0
    1228:	661e           	bne.s 1248 <main+0x1242>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    122a:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1230:	4eae ffc4      	jsr -60(a6)
    1234:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    123a:	2200           	move.l d0,d1
    123c:	243c 0000 38fe 	move.l #14590,d2
    1242:	7636           	moveq #54,d3
    1244:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    1248:	4878 0002      	pea 2 <_start+0x2>
    124c:	4879 0000 5d28 	pea 5d28 <ClColor>
    1252:	4878 001e      	pea 1e <main+0x18>
    1256:	2f39 0000 5ea0 	move.l 5ea0 <Copperlist1>,-(sp)
    125c:	4e93           	jsr (a3)
    125e:	4fef 0010      	lea 16(sp),sp
    1262:	4a80           	tst.l d0
    1264:	661e           	bne.s 1284 <main+0x127e>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1266:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    126c:	4eae ffc4      	jsr -60(a6)
    1270:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1276:	2200           	move.l d0,d1
    1278:	243c 0000 36ab 	move.l #13995,d2
    127e:	7621           	moveq #33,d3
    1280:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    1284:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdce28>
    1288:	4878 0020      	pea 20 <main+0x1a>
    128c:	2f39 0000 5ea0 	move.l 5ea0 <Copperlist1>,-(sp)
    1292:	4e94           	jsr (a4)
    1294:	4fef 000c      	lea 12(sp),sp
    1298:	4a80           	tst.l d0
    129a:	661e           	bne.s 12ba <main+0x12b4>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    129c:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    12a2:	4eae ffc4      	jsr -60(a6)
    12a6:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    12ac:	2200           	move.l d0,d1
    12ae:	243c 0000 36cd 	move.l #14029,d2
    12b4:	7622           	moveq #34,d3
    12b6:	4eae ffd0      	jsr -48(a6)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    12ba:	2479 0000 5e94 	movea.l 5e94 <DrawBuffer>,a2
    12c0:	4879 0000 3c74 	pea 3c74 <incbin_swfont_end+0x7de>
    12c6:	2f0a           	move.l a2,-(sp)
    12c8:	4eb9 0000 16f0 	jsr 16f0 <WriteFont.constprop.5>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    12ce:	508f           	addq.l #8,sp
    12d0:	0c52 ff00      	cmpi.w #-256,(a2)
    12d4:	671e           	beq.s 12f4 <main+0x12ee>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    12d6:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    12dc:	4eae ffc4      	jsr -60(a6)
    12e0:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    12e6:	2200           	move.l d0,d1
    12e8:	243c 0000 3c85 	move.l #15493,d2
    12ee:	7631           	moveq #49,d3
    12f0:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    12f4:	2f3c 0000 c800 	move.l #51200,-(sp)
    12fa:	4878 0084      	pea 84 <main+0x7e>
    12fe:	4eb9 0000 299a 	jsr 299a <FreeDisplay>
  RunTests();
	Delay(50);
    1304:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    130a:	7232           	moveq #50,d1
    130c:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    1310:	247c 00f0 ff60 	movea.l #15794016,a2
    1316:	508f           	addq.l #8,sp
    1318:	4a92           	tst.l (a2)
    131a:	6718           	beq.s 1334 <main+0x132e>
    131c:	4878 0001      	pea 1 <_start+0x1>
    1320:	47f9 0000 173e 	lea 173e <warpmode.part.0>,a3
    1326:	4e93           	jsr (a3)
    1328:	588f           	addq.l #4,sp
    132a:	4a92           	tst.l (a2)
    132c:	6706           	beq.s 1334 <main+0x132e>
    132e:	42a7           	clr.l -(sp)
    1330:	4e93           	jsr (a3)
    1332:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    1334:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    133a:	23ee 0022 0000 	move.l 34(a6),5e68 <ActiView>
    1340:	5e68 
	OwnBlitter();
    1342:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    1346:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    134c:	4eae ff1c      	jsr -228(a6)
	Disable();
    1350:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    1356:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    135a:	2679 0000 5e7a 	movea.l 5e7a <hw>,a3
    1360:	302b 0010      	move.w 16(a3),d0
    1364:	33c0 0000 5e6c 	move.w d0,5e6c <SystemADKCON>
	SystemInts=hw->intenar;
    136a:	302b 001c      	move.w 28(a3),d0
    136e:	33c0 0000 5e70 	move.w d0,5e70 <SystemInts>
	SystemDMA=hw->dmaconr;
    1374:	302b 0002      	move.w 2(a3),d0
    1378:	33c0 0000 5e6e 	move.w d0,5e6e <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    137e:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    1384:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
    138a:	45f9 0000 2a0c 	lea 2a0c <WaitVbl>,a2
    1390:	4e92           	jsr (a2)
	WaitVbl();
    1392:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
    1394:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    139a:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    13a0:	93c9           	suba.l a1,a1
    13a2:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    13a6:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    13ac:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    13b0:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    13b6:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    13ba:	4e92           	jsr (a2)
	WaitVbl();
    13bc:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    13be:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
    13c4:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
    13ca:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    13d0:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    13d6:	082e 0000 0129 	btst #0,297(a6)
    13dc:	6700 02c4      	beq.w 16a2 <main+0x169c>
		vbr = (APTR)Supervisor((void*)getvbr);
    13e0:	cf8d           	exg d7,a5
    13e2:	4eae ffe2      	jsr -30(a6)
    13e6:	cf8d           	exg d7,a5

	VBR=GetVBR();
    13e8:	23c0 0000 5e72 	move.l d0,5e72 <VBR.lto_priv.6>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    13ee:	2079 0000 5e72 	movea.l 5e72 <VBR.lto_priv.6>,a0
    13f4:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    13f8:	23c2 0000 5e76 	move.l d2,5e76 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    13fe:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
    1400:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1402:	2079 0000 5e7a 	movea.l 5e7a <hw>,a0
    1408:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    140c:	3028 0002      	move.w 2(a0),d0
    1410:	0800 000e      	btst #14,d0
    1414:	66f6           	bne.s 140c <main+0x1406>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    1416:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    141c:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    1422:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    1428:	2279 0000 5e72 	movea.l 5e72 <VBR.lto_priv.6>,a1
    142e:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    1432:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    1438:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    143e:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    1444:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    144a:	3039 0000 5e70 	move.w 5e70 <SystemInts>,d0
    1450:	0040 8000      	ori.w #-32768,d0
    1454:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    1458:	3039 0000 5e6e 	move.w 5e6e <SystemDMA>,d0
    145e:	0040 8000      	ori.w #-32768,d0
    1462:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    1466:	3039 0000 5e6c 	move.w 5e6c <SystemADKCON>,d0
    146c:	0040 8000      	ori.w #-32768,d0
    1470:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    1474:	2279 0000 5e68 	movea.l 5e68 <ActiView>,a1
    147a:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    147e:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    1484:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    1488:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    148e:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    1492:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    1498:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    149c:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    14a2:	4eae fe32      	jsr -462(a6)
	Enable();
    14a6:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    14ac:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    14b0:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    14b6:	2279 0000 5ea4 	movea.l 5ea4 <DOSBase>,a1
    14bc:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    14c0:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    14c6:	2279 0000 5e7e 	movea.l 5e7e <GfxBase>,a1
    14cc:	4eae fe62      	jsr -414(a6)
}
    14d0:	7000           	moveq #0,d0
    14d2:	4ced 5cfc ff88 	movem.l -120(a5),d2-d7/a2-a4/a6
    14d8:	4e5d           	unlk a5
    14da:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    14dc:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    14e2:	4eae ffc4      	jsr -60(a6)
    14e6:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    14ec:	2200           	move.l d0,d1
    14ee:	243c 0000 38c8 	move.l #14536,d2
    14f4:	762c           	moveq #44,d3
    14f6:	4eae ffd0      	jsr -48(a6)
    14fa:	6000 ecac      	bra.w 1a8 <main+0x1a2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    14fe:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1504:	4eae ffc4      	jsr -60(a6)
    1508:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    150e:	2200           	move.l d0,d1
    1510:	243c 0000 36ab 	move.l #13995,d2
    1516:	7621           	moveq #33,d3
    1518:	4eae ffd0      	jsr -48(a6)
    151c:	2079 0000 5ea0 	movea.l 5ea0 <Copperlist1>,a0
    1522:	6000 edf8      	bra.w 31c <main+0x316>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    1526:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    152c:	4eae ffc4      	jsr -60(a6)
    1530:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1536:	2200           	move.l d0,d1
    1538:	243c 0000 38fe 	move.l #14590,d2
    153e:	7636           	moveq #54,d3
    1540:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    1544:	23fc 0004 0000 	move.l #262144,5e94 <DrawBuffer>
    154a:	0000 5e94 
  ViewBuffer = (ULONG *)0x50000;
    154e:	23fc 0005 0000 	move.l #327680,5e88 <ViewBuffer>
    1554:	0000 5e88 
  SetBplPointers();
    1558:	45f9 0000 2830 	lea 2830 <SetBplPointers>,a2
    155e:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    1560:	0cb9 0005 0000 	cmpi.l #327680,5e94 <DrawBuffer>
    1566:	0000 5e94 
    156a:	6600 ed14      	bne.w 280 <main+0x27a>
    156e:	0cb9 0004 0000 	cmpi.l #262144,5e88 <ViewBuffer>
    1574:	0000 5e88 
    1578:	6700 ed24      	beq.w 29e <main+0x298>
    Write( Output(), 
    157c:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1582:	4eae ffc4      	jsr -60(a6)
    1586:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    158c:	2200           	move.l d0,d1
    158e:	243c 0000 35f5 	move.l #13813,d2
    1594:	763b           	moveq #59,d3
    1596:	4eae ffd0      	jsr -48(a6)
    159a:	6000 ed02      	bra.w 29e <main+0x298>
		Exit(0);
    159e:	9dce           	suba.l a6,a6
    15a0:	7200           	moveq #0,d1
    15a2:	4eae ff70      	jsr -144(a6)
    15a6:	6000 eaac      	bra.w 54 <main+0x4e>
		Exit(0);
    15aa:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    15b0:	7200           	moveq #0,d1
    15b2:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    15b6:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    15bc:	43f9 0000 35ba 	lea 35ba <incbin_swfont_end+0x124>,a1
    15c2:	7000           	moveq #0,d0
    15c4:	4eae fdd8      	jsr -552(a6)
    15c8:	23c0 0000 5ea4 	move.l d0,5ea4 <DOSBase>
	if (!DOSBase)
    15ce:	6600 ea84      	bne.w 54 <main+0x4e>
    15d2:	60ca           	bra.s 159e <main+0x1598>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    15d4:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    15da:	4eae ffc4      	jsr -60(a6)
    15de:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    15e4:	2200           	move.l d0,d1
    15e6:	243c 0000 3b84 	move.l #15236,d2
    15ec:	7635           	moveq #53,d3
    15ee:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    15f2:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    15f8:	203c 0000 3740 	move.l #14144,d0
    15fe:	7202           	moveq #2,d1
    1600:	4eae ff3a      	jsr -198(a6)
    1604:	2400           	move.l d0,d2
  if( source == 0) {
    1606:	6600 f7d4      	bne.w ddc <main+0xdd6>
    Write(  Output(), 
    160a:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1610:	4eae ffc4      	jsr -60(a6)
    1614:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    161a:	2200           	move.l d0,d1
    161c:	243c 0000 3bfb 	move.l #15355,d2
    1622:	7639           	moveq #57,d3
    1624:	4eae ffd0      	jsr -48(a6)
    return;
    1628:	6000 fba2      	bra.w 11cc <main+0x11c6>
    Write(  Output(), 
    162c:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1632:	4eae ffc4      	jsr -60(a6)
    1636:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    163c:	2200           	move.l d0,d1
    163e:	243c 0000 39fe 	move.l #14846,d2
    1644:	7636           	moveq #54,d3
    1646:	4eae ffd0      	jsr -48(a6)
  PrepareDisplayZoom();
    164a:	2044           	movea.l d4,a0
    164c:	4e90           	jsr (a0)
  UWORD *destination = (UWORD *)DrawBuffer;
    164e:	2079 0000 5e94 	movea.l 5e94 <DrawBuffer>,a0
  *destination= 0x0000;
    1654:	4250           	clr.w (a0)
  *destination= 0x000f;
    1656:	317c 000f 0030 	move.w #15,48(a0)
  *destination = 0x000f;
    165c:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    1662:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    1668:	203c 0000 c800 	move.l #51200,d0
    166e:	7202           	moveq #2,d1
    1670:	4eae ff3a      	jsr -198(a6)
    1674:	2440           	movea.l d0,a2
    1676:	23c0 0000 5e64 	move.l d0,5e64 <Zoom_Source>
  if( Zoom_Source == 0) {
    167c:	6600 f2e4      	bne.w 962 <main+0x95c>
    Write(  Output(), 
    1680:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1686:	4eae ffc4      	jsr -60(a6)
    168a:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1690:	2200           	move.l d0,d1
    1692:	243c 0000 39fe 	move.l #14846,d2
    1698:	7636           	moveq #54,d3
    169a:	4eae ffd0      	jsr -48(a6)
    return;
    169e:	6000 f4de      	bra.w b7e <main+0xb78>
	APTR vbr = 0;
    16a2:	7000           	moveq #0,d0
	VBR=GetVBR();
    16a4:	23c0 0000 5e72 	move.l d0,5e72 <VBR.lto_priv.6>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    16aa:	2079 0000 5e72 	movea.l 5e72 <VBR.lto_priv.6>,a0
    16b0:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    16b4:	23c2 0000 5e76 	move.l d2,5e76 <SystemIrq>
	WaitVbl();
    16ba:	4e92           	jsr (a2)
	WaitVbl();
    16bc:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    16be:	2079 0000 5e7a 	movea.l 5e7a <hw>,a0
    16c4:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    16c8:	6000 fd42      	bra.w 140c <main+0x1406>
    Write(  Output(), 
    16cc:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    16d2:	4eae ffc4      	jsr -60(a6)
    16d6:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    16dc:	2200           	move.l d0,d1
    16de:	243c 0000 3c35 	move.l #15413,d2
    16e4:	763d           	moveq #61,d3
    16e6:	4eae ffd0      	jsr -48(a6)
    return;
    16ea:	6000 fae0      	bra.w 11cc <main+0x11c6>
    16ee:	4e71           	nop

000016f0 <WriteFont.constprop.5>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    16f0:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    16f4:	206f 0008      	movea.l 8(sp),a0
    16f8:	1010           	move.b (a0),d0
    16fa:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    16fe:	4880           	ext.w d0
    1700:	48c0           	ext.l d0
    1702:	e788           	lsl.l #3,d0
  fntptr += charpos;
    1704:	4880           	ext.w d0
    1706:	3040           	movea.w d0,a0
    1708:	d1c8           	adda.l a0,a0
    170a:	d1fc 0000 5e24 	adda.l #24100,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    1710:	3290           	move.w (a0),(a1)
    1712:	3368 0002 0050 	move.w 2(a0),80(a1)
    1718:	3368 0004 00a0 	move.w 4(a0),160(a1)
    171e:	3368 0006 00f0 	move.w 6(a0),240(a1)
    1724:	3368 0008 0140 	move.w 8(a0),320(a1)
    172a:	3368 000a 0190 	move.w 10(a0),400(a1)
    1730:	3368 000c 01e0 	move.w 12(a0),480(a1)
    1736:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    173c:	4e75           	rts

0000173e <warpmode.part.0>:
void warpmode(int on) 
    173e:	598f           	subq.l #4,sp
    1740:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    1742:	4aaf 000c      	tst.l 12(sp)
    1746:	674c           	beq.s 1794 <warpmode.part.0+0x56>
    1748:	4878 0001      	pea 1 <_start+0x1>
    174c:	740b           	moveq #11,d2
    174e:	d48f           	add.l sp,d2
    1750:	2f02           	move.l d2,-(sp)
    1752:	42a7           	clr.l -(sp)
    1754:	4879 0000 34ca 	pea 34ca <incbin_swfont_end+0x34>
    175a:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdce29>
    175e:	4878 0052      	pea 52 <main+0x4c>
    1762:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecd8a>
    1768:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    176c:	203c 0000 34b0 	move.l #13488,d0
    1772:	4878 0001      	pea 1 <_start+0x1>
    1776:	2f02           	move.l d2,-(sp)
    1778:	42a7           	clr.l -(sp)
    177a:	2f00           	move.l d0,-(sp)
    177c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdce29>
    1780:	4878 0052      	pea 52 <main+0x4c>
    1784:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecd8a>
	}
}
    178a:	4fef 0018      	lea 24(sp),sp
    178e:	241f           	move.l (sp)+,d2
    1790:	588f           	addq.l #4,sp
    1792:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    1794:	4878 0001      	pea 1 <_start+0x1>
    1798:	740b           	moveq #11,d2
    179a:	d48f           	add.l sp,d2
    179c:	2f02           	move.l d2,-(sp)
    179e:	42a7           	clr.l -(sp)
    17a0:	4879 0000 34d4 	pea 34d4 <incbin_swfont_end+0x3e>
    17a6:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdce29>
    17aa:	4878 0052      	pea 52 <main+0x4c>
    17ae:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecd8a>
    17b4:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    17b8:	203c 0000 3497 	move.l #13463,d0
    17be:	4878 0001      	pea 1 <_start+0x1>
    17c2:	2f02           	move.l d2,-(sp)
    17c4:	42a7           	clr.l -(sp)
    17c6:	2f00           	move.l d0,-(sp)
    17c8:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdce29>
    17cc:	4878 0052      	pea 52 <main+0x4c>
    17d0:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecd8a>
}
    17d6:	4fef 0018      	lea 24(sp),sp
    17da:	241f           	move.l (sp)+,d2
    17dc:	588f           	addq.l #4,sp
    17de:	4e75           	rts

000017e0 <KPrintF>:
{
    17e0:	4fef ff80      	lea -128(sp),sp
    17e4:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    17e8:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeecd8a>
    17ee:	6734           	beq.s 1824 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    17f0:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    17f6:	206f 0090      	movea.l 144(sp),a0
    17fa:	43ef 0094      	lea 148(sp),a1
    17fe:	45f9 0000 2cd0 	lea 2cd0 <PutChar>,a2
    1804:	47ef 000c      	lea 12(sp),a3
    1808:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    180c:	2f0b           	move.l a3,-(sp)
    180e:	4878 0056      	pea 56 <main+0x50>
    1812:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecd8a>
    1818:	508f           	addq.l #8,sp
}
    181a:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    181e:	4fef 0080      	lea 128(sp),sp
    1822:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    1824:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    182a:	206f 0090      	movea.l 144(sp),a0
    182e:	43ef 0094      	lea 148(sp),a1
    1832:	45f9 0000 2cc2 	lea 2cc2 <KPutCharX>,a2
    1838:	97cb           	suba.l a3,a3
    183a:	4eae fdf6      	jsr -522(a6)
}
    183e:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1842:	4fef 0080      	lea 128(sp),sp
    1846:	4e75           	rts

00001848 <TestRow.constprop.4>:
  }
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1848:	4fef ff94      	lea -108(sp),sp
    184c:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1850:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    1856:	3c2f 002e      	move.w 46(sp),d6
                                                             int numberofline) {    
  char str[ 100] = { 0 };
    185a:	7a34           	moveq #52,d5
    185c:	da8f           	add.l sp,d5
    185e:	4878 0064      	pea 64 <main+0x5e>
    1862:	42a7           	clr.l -(sp)
    1864:	2f05           	move.l d5,-(sp)
    1866:	4eba 127c      	jsr 2ae4 <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
    186a:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1870:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
    1874:	2a6f 009c      	movea.l 156(sp),a5

  for(int i=0;i<21;i++) {
    1878:	7800           	moveq #0,d4
  testpattern += 0;
    187a:	49f9 0000 5df8 	lea 5df8 <destlinezoom3>,a4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1880:	2e3c 0000 34df 	move.l #13535,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    1886:	301c           	move.w (a4)+,d0
    1888:	bd40           	eor.w d6,d0
    188a:	b05d           	cmp.w (a5)+,d0
    188c:	6736           	beq.s 18c4 <TestRow.constprop.4+0x7c>
      data[0] = i;
    188e:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1892:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    1898:	2047           	movea.l d7,a0
    189a:	43ef 0030      	lea 48(sp),a1
    189e:	45f9 0000 2cd0 	lea 2cd0 <PutChar>,a2
    18a4:	2645           	movea.l d5,a3
    18a6:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    18aa:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    18b0:	4eae ffc4      	jsr -60(a6)
    18b4:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    18ba:	2200           	move.l d0,d1
    18bc:	2405           	move.l d5,d2
    18be:	7664           	moveq #100,d3
    18c0:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    18c4:	5284           	addq.l #1,d4
    18c6:	b9fc 0000 5e22 	cmpa.l #24098,a4
    18cc:	66b8           	bne.s 1886 <TestRow.constprop.4+0x3e>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    18ce:	3039 0000 5e22 	move.w 5e22 <destlinezoom3+0x2a>,d0
    18d4:	322f 002e      	move.w 46(sp),d1
    18d8:	b340           	eor.w d1,d0
    18da:	206f 009c      	movea.l 156(sp),a0
    18de:	3228 002a      	move.w 42(a0),d1
    18e2:	b340           	eor.w d1,d0
    18e4:	0240 ff00      	andi.w #-256,d0
    18e8:	660a           	bne.s 18f4 <TestRow.constprop.4+0xac>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
    18ea:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    18ee:	4fef 006c      	lea 108(sp),sp
    18f2:	4e75           	rts
    data[0] = 22;
    18f4:	3f7c 0016 0030 	move.w #22,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    18fa:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    1900:	41f9 0000 34df 	lea 34df <incbin_swfont_end+0x49>,a0
    1906:	43ef 0030      	lea 48(sp),a1
    190a:	45f9 0000 2cd0 	lea 2cd0 <PutChar>,a2
    1910:	47ef 0034      	lea 52(sp),a3
    1914:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1918:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    191e:	4eae ffc4      	jsr -60(a6)
    1922:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1928:	2200           	move.l d0,d1
    192a:	240b           	move.l a3,d2
    192c:	7664           	moveq #100,d3
    192e:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1932:	206f 009c      	movea.l 156(sp),a0
    1936:	7000           	moveq #0,d0
    1938:	3028 002a      	move.w 42(a0),d0
    193c:	2f00           	move.l d0,-(sp)
    193e:	3039 0000 5e22 	move.w 5e22 <destlinezoom3+0x2a>,d0
    1944:	2f00           	move.l d0,-(sp)
    1946:	4879 0000 350f 	pea 350f <incbin_swfont_end+0x79>
    194c:	4eba fe92      	jsr 17e0 <KPrintF>(pc)
    1950:	4fef 000c      	lea 12(sp),sp
}
    1954:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1958:	4fef 006c      	lea 108(sp),sp
    195c:	4e75           	rts

0000195e <TestRow.constprop.3>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    195e:	4fef ff94      	lea -108(sp),sp
    1962:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1966:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    196c:	3c2f 002e      	move.w 46(sp),d6
  char str[ 100] = { 0 };
    1970:	7a34           	moveq #52,d5
    1972:	da8f           	add.l sp,d5
    1974:	4878 0064      	pea 64 <main+0x5e>
    1978:	42a7           	clr.l -(sp)
    197a:	2f05           	move.l d5,-(sp)
    197c:	4eba 1166      	jsr 2ae4 <memset>(pc)
  data[1] = numberofline;
    1980:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1986:	4fef 000c      	lea 12(sp),sp
  destination += 0;
    198a:	2a6f 009c      	movea.l 156(sp),a5
  for(int i=0;i<21;i++) {
    198e:	7800           	moveq #0,d4
  testpattern += 0;
    1990:	49f9 0000 5dcc 	lea 5dcc <destlinezoom2>,a4
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1996:	2e3c 0000 34df 	move.l #13535,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    199c:	301c           	move.w (a4)+,d0
    199e:	bd40           	eor.w d6,d0
    19a0:	b05d           	cmp.w (a5)+,d0
    19a2:	6736           	beq.s 19da <TestRow.constprop.3+0x7c>
      data[0] = i;
    19a4:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    19a8:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    19ae:	2047           	movea.l d7,a0
    19b0:	43ef 0030      	lea 48(sp),a1
    19b4:	45f9 0000 2cd0 	lea 2cd0 <PutChar>,a2
    19ba:	2645           	movea.l d5,a3
    19bc:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    19c0:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    19c6:	4eae ffc4      	jsr -60(a6)
    19ca:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    19d0:	2200           	move.l d0,d1
    19d2:	2405           	move.l d5,d2
    19d4:	7664           	moveq #100,d3
    19d6:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    19da:	5284           	addq.l #1,d4
    19dc:	b9fc 0000 5df6 	cmpa.l #24054,a4
    19e2:	66b8           	bne.s 199c <TestRow.constprop.3+0x3e>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    19e4:	3039 0000 5df6 	move.w 5df6 <destlinezoom2+0x2a>,d0
    19ea:	322f 002e      	move.w 46(sp),d1
    19ee:	b340           	eor.w d1,d0
    19f0:	206f 009c      	movea.l 156(sp),a0
    19f4:	3228 002a      	move.w 42(a0),d1
    19f8:	b340           	eor.w d1,d0
    19fa:	0240 ff00      	andi.w #-256,d0
    19fe:	660a           	bne.s 1a0a <TestRow.constprop.3+0xac>
}
    1a00:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1a04:	4fef 006c      	lea 108(sp),sp
    1a08:	4e75           	rts
    data[0] = 22;
    1a0a:	3f7c 0016 0030 	move.w #22,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    1a10:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    1a16:	41f9 0000 34df 	lea 34df <incbin_swfont_end+0x49>,a0
    1a1c:	43ef 0030      	lea 48(sp),a1
    1a20:	45f9 0000 2cd0 	lea 2cd0 <PutChar>,a2
    1a26:	47ef 0034      	lea 52(sp),a3
    1a2a:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1a2e:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1a34:	4eae ffc4      	jsr -60(a6)
    1a38:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1a3e:	2200           	move.l d0,d1
    1a40:	240b           	move.l a3,d2
    1a42:	7664           	moveq #100,d3
    1a44:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1a48:	206f 009c      	movea.l 156(sp),a0
    1a4c:	7000           	moveq #0,d0
    1a4e:	3028 002a      	move.w 42(a0),d0
    1a52:	2f00           	move.l d0,-(sp)
    1a54:	3039 0000 5df6 	move.w 5df6 <destlinezoom2+0x2a>,d0
    1a5a:	2f00           	move.l d0,-(sp)
    1a5c:	4879 0000 350f 	pea 350f <incbin_swfont_end+0x79>
    1a62:	4eba fd7c      	jsr 17e0 <KPrintF>(pc)
    1a66:	4fef 000c      	lea 12(sp),sp
}
    1a6a:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1a6e:	4fef 006c      	lea 108(sp),sp
    1a72:	4e75           	rts

00001a74 <TestRow.constprop.2>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1a74:	4fef ff94      	lea -108(sp),sp
    1a78:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1a7c:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    1a82:	3c2f 002e      	move.w 46(sp),d6
  char str[ 100] = { 0 };
    1a86:	7a34           	moveq #52,d5
    1a88:	da8f           	add.l sp,d5
    1a8a:	4878 0064      	pea 64 <main+0x5e>
    1a8e:	42a7           	clr.l -(sp)
    1a90:	2f05           	move.l d5,-(sp)
    1a92:	4eba 1050      	jsr 2ae4 <memset>(pc)
  data[1] = numberofline;
    1a96:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1a9c:	4fef 000c      	lea 12(sp),sp
  destination += 0;
    1aa0:	2a6f 009c      	movea.l 156(sp),a5
  for(int i=0;i<21;i++) {
    1aa4:	7800           	moveq #0,d4
  testpattern += 0;
    1aa6:	49f9 0000 5da0 	lea 5da0 <destlinezoom1>,a4
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1aac:	2e3c 0000 34df 	move.l #13535,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    1ab2:	301c           	move.w (a4)+,d0
    1ab4:	bd40           	eor.w d6,d0
    1ab6:	b05d           	cmp.w (a5)+,d0
    1ab8:	6736           	beq.s 1af0 <TestRow.constprop.2+0x7c>
      data[0] = i;
    1aba:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1abe:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    1ac4:	2047           	movea.l d7,a0
    1ac6:	43ef 0030      	lea 48(sp),a1
    1aca:	45f9 0000 2cd0 	lea 2cd0 <PutChar>,a2
    1ad0:	2645           	movea.l d5,a3
    1ad2:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1ad6:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1adc:	4eae ffc4      	jsr -60(a6)
    1ae0:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1ae6:	2200           	move.l d0,d1
    1ae8:	2405           	move.l d5,d2
    1aea:	7664           	moveq #100,d3
    1aec:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    1af0:	5284           	addq.l #1,d4
    1af2:	b9fc 0000 5dca 	cmpa.l #24010,a4
    1af8:	66b8           	bne.s 1ab2 <TestRow.constprop.2+0x3e>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1afa:	3039 0000 5dca 	move.w 5dca <destlinezoom1+0x2a>,d0
    1b00:	322f 002e      	move.w 46(sp),d1
    1b04:	b340           	eor.w d1,d0
    1b06:	206f 009c      	movea.l 156(sp),a0
    1b0a:	3228 002a      	move.w 42(a0),d1
    1b0e:	b340           	eor.w d1,d0
    1b10:	0240 ff00      	andi.w #-256,d0
    1b14:	660a           	bne.s 1b20 <TestRow.constprop.2+0xac>
}
    1b16:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1b1a:	4fef 006c      	lea 108(sp),sp
    1b1e:	4e75           	rts
    data[0] = 22;
    1b20:	3f7c 0016 0030 	move.w #22,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    1b26:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    1b2c:	41f9 0000 34df 	lea 34df <incbin_swfont_end+0x49>,a0
    1b32:	43ef 0030      	lea 48(sp),a1
    1b36:	45f9 0000 2cd0 	lea 2cd0 <PutChar>,a2
    1b3c:	47ef 0034      	lea 52(sp),a3
    1b40:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1b44:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1b4a:	4eae ffc4      	jsr -60(a6)
    1b4e:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1b54:	2200           	move.l d0,d1
    1b56:	240b           	move.l a3,d2
    1b58:	7664           	moveq #100,d3
    1b5a:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1b5e:	206f 009c      	movea.l 156(sp),a0
    1b62:	7000           	moveq #0,d0
    1b64:	3028 002a      	move.w 42(a0),d0
    1b68:	2f00           	move.l d0,-(sp)
    1b6a:	3039 0000 5dca 	move.w 5dca <destlinezoom1+0x2a>,d0
    1b70:	2f00           	move.l d0,-(sp)
    1b72:	4879 0000 350f 	pea 350f <incbin_swfont_end+0x79>
    1b78:	4eba fc66      	jsr 17e0 <KPrintF>(pc)
    1b7c:	4fef 000c      	lea 12(sp),sp
}
    1b80:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1b84:	4fef 006c      	lea 108(sp),sp
    1b88:	4e75           	rts

00001b8a <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    1b8a:	202f 0008      	move.l 8(sp),d0
    1b8e:	d080           	add.l d0,d0
    1b90:	d080           	add.l d0,d0
    1b92:	206f 0004      	movea.l 4(sp),a0
    1b96:	2030 0800      	move.l (0,a0,d0.l),d0
    1b9a:	b0af 000c      	cmp.l 12(sp),d0
    1b9e:	57c0           	seq d0
    1ba0:	4880           	ext.w d0
    1ba2:	48c0           	ext.l d0
}
    1ba4:	4480           	neg.l d0
    1ba6:	4e75           	rts

00001ba8 <TestCopperlistBatch>:
                                                                  long length) {
    1ba8:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    1bac:	246f 0010      	movea.l 16(sp),a2
    1bb0:	206f 0014      	movea.l 20(sp),a0
    1bb4:	226f 0018      	movea.l 24(sp),a1
    1bb8:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    1bbc:	2008           	move.l a0,d0
    1bbe:	d088           	add.l a0,d0
    1bc0:	d080           	add.l d0,d0
    1bc2:	2411           	move.l (a1),d2
    1bc4:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    1bc8:	6600 01ac      	bne.w 1d76 <TestCopperlistBatch+0x1ce>
    1bcc:	2008           	move.l a0,d0
    1bce:	5280           	addq.l #1,d0
    1bd0:	d080           	add.l d0,d0
    1bd2:	d080           	add.l d0,d0
    1bd4:	2032 0800      	move.l (0,a2,d0.l),d0
    1bd8:	b0a9 0004      	cmp.l 4(a1),d0
    1bdc:	6600 0198      	bne.w 1d76 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1be0:	7002           	moveq #2,d0
    1be2:	b081           	cmp.l d1,d0
    1be4:	6700 0188      	beq.w 1d6e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1be8:	2008           	move.l a0,d0
    1bea:	5480           	addq.l #2,d0
    1bec:	d080           	add.l d0,d0
    1bee:	d080           	add.l d0,d0
    1bf0:	2032 0800      	move.l (0,a2,d0.l),d0
    1bf4:	b0a9 0008      	cmp.l 8(a1),d0
    1bf8:	6600 017c      	bne.w 1d76 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1bfc:	7403           	moveq #3,d2
    1bfe:	b481           	cmp.l d1,d2
    1c00:	6700 016c      	beq.w 1d6e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1c04:	2008           	move.l a0,d0
    1c06:	5680           	addq.l #3,d0
    1c08:	d080           	add.l d0,d0
    1c0a:	d080           	add.l d0,d0
    1c0c:	2032 0800      	move.l (0,a2,d0.l),d0
    1c10:	b0a9 000c      	cmp.l 12(a1),d0
    1c14:	6600 0160      	bne.w 1d76 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1c18:	7004           	moveq #4,d0
    1c1a:	b081           	cmp.l d1,d0
    1c1c:	6700 0150      	beq.w 1d6e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1c20:	2008           	move.l a0,d0
    1c22:	5880           	addq.l #4,d0
    1c24:	d080           	add.l d0,d0
    1c26:	d080           	add.l d0,d0
    1c28:	2032 0800      	move.l (0,a2,d0.l),d0
    1c2c:	b0a9 0010      	cmp.l 16(a1),d0
    1c30:	6600 0144      	bne.w 1d76 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1c34:	7405           	moveq #5,d2
    1c36:	b481           	cmp.l d1,d2
    1c38:	6700 0134      	beq.w 1d6e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1c3c:	2008           	move.l a0,d0
    1c3e:	5a80           	addq.l #5,d0
    1c40:	d080           	add.l d0,d0
    1c42:	d080           	add.l d0,d0
    1c44:	2032 0800      	move.l (0,a2,d0.l),d0
    1c48:	b0a9 0014      	cmp.l 20(a1),d0
    1c4c:	6600 0128      	bne.w 1d76 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1c50:	7006           	moveq #6,d0
    1c52:	b081           	cmp.l d1,d0
    1c54:	6700 0118      	beq.w 1d6e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1c58:	2008           	move.l a0,d0
    1c5a:	5c80           	addq.l #6,d0
    1c5c:	d080           	add.l d0,d0
    1c5e:	d080           	add.l d0,d0
    1c60:	2032 0800      	move.l (0,a2,d0.l),d0
    1c64:	b0a9 0018      	cmp.l 24(a1),d0
    1c68:	6600 010c      	bne.w 1d76 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1c6c:	7407           	moveq #7,d2
    1c6e:	b481           	cmp.l d1,d2
    1c70:	6700 00fc      	beq.w 1d6e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1c74:	2008           	move.l a0,d0
    1c76:	5e80           	addq.l #7,d0
    1c78:	d080           	add.l d0,d0
    1c7a:	d080           	add.l d0,d0
    1c7c:	2032 0800      	move.l (0,a2,d0.l),d0
    1c80:	b0a9 001c      	cmp.l 28(a1),d0
    1c84:	6600 00f0      	bne.w 1d76 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1c88:	7008           	moveq #8,d0
    1c8a:	b081           	cmp.l d1,d0
    1c8c:	6700 00e0      	beq.w 1d6e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1c90:	2008           	move.l a0,d0
    1c92:	5080           	addq.l #8,d0
    1c94:	d080           	add.l d0,d0
    1c96:	d080           	add.l d0,d0
    1c98:	2032 0800      	move.l (0,a2,d0.l),d0
    1c9c:	b0a9 0020      	cmp.l 32(a1),d0
    1ca0:	6600 00d4      	bne.w 1d76 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1ca4:	7409           	moveq #9,d2
    1ca6:	b481           	cmp.l d1,d2
    1ca8:	6700 00c4      	beq.w 1d6e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1cac:	47e8 0009      	lea 9(a0),a3
    1cb0:	200b           	move.l a3,d0
    1cb2:	d08b           	add.l a3,d0
    1cb4:	d080           	add.l d0,d0
    1cb6:	2032 0800      	move.l (0,a2,d0.l),d0
    1cba:	b0a9 0024      	cmp.l 36(a1),d0
    1cbe:	6600 00b6      	bne.w 1d76 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1cc2:	700a           	moveq #10,d0
    1cc4:	b081           	cmp.l d1,d0
    1cc6:	6700 00a6      	beq.w 1d6e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1cca:	47e8 000a      	lea 10(a0),a3
    1cce:	200b           	move.l a3,d0
    1cd0:	d08b           	add.l a3,d0
    1cd2:	d080           	add.l d0,d0
    1cd4:	2032 0800      	move.l (0,a2,d0.l),d0
    1cd8:	b0a9 0028      	cmp.l 40(a1),d0
    1cdc:	6600 0098      	bne.w 1d76 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1ce0:	740b           	moveq #11,d2
    1ce2:	b481           	cmp.l d1,d2
    1ce4:	6700 0088      	beq.w 1d6e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1ce8:	47e8 000b      	lea 11(a0),a3
    1cec:	200b           	move.l a3,d0
    1cee:	d08b           	add.l a3,d0
    1cf0:	d080           	add.l d0,d0
    1cf2:	2032 0800      	move.l (0,a2,d0.l),d0
    1cf6:	b0a9 002c      	cmp.l 44(a1),d0
    1cfa:	667a           	bne.s 1d76 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1cfc:	700c           	moveq #12,d0
    1cfe:	b081           	cmp.l d1,d0
    1d00:	676c           	beq.s 1d6e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1d02:	47e8 000c      	lea 12(a0),a3
    1d06:	200b           	move.l a3,d0
    1d08:	d08b           	add.l a3,d0
    1d0a:	d080           	add.l d0,d0
    1d0c:	2032 0800      	move.l (0,a2,d0.l),d0
    1d10:	b0a9 0030      	cmp.l 48(a1),d0
    1d14:	6660           	bne.s 1d76 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1d16:	740d           	moveq #13,d2
    1d18:	b481           	cmp.l d1,d2
    1d1a:	6752           	beq.s 1d6e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1d1c:	47e8 000d      	lea 13(a0),a3
    1d20:	200b           	move.l a3,d0
    1d22:	d08b           	add.l a3,d0
    1d24:	d080           	add.l d0,d0
    1d26:	2032 0800      	move.l (0,a2,d0.l),d0
    1d2a:	b0a9 0034      	cmp.l 52(a1),d0
    1d2e:	6646           	bne.s 1d76 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1d30:	700e           	moveq #14,d0
    1d32:	b081           	cmp.l d1,d0
    1d34:	6738           	beq.s 1d6e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1d36:	47e8 000e      	lea 14(a0),a3
    1d3a:	200b           	move.l a3,d0
    1d3c:	d08b           	add.l a3,d0
    1d3e:	d080           	add.l d0,d0
    1d40:	2032 0800      	move.l (0,a2,d0.l),d0
    1d44:	b0a9 0038      	cmp.l 56(a1),d0
    1d48:	662c           	bne.s 1d76 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1d4a:	7410           	moveq #16,d2
    1d4c:	b481           	cmp.l d1,d2
    1d4e:	661e           	bne.s 1d6e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1d50:	41e8 000f      	lea 15(a0),a0
    1d54:	d1c8           	adda.l a0,a0
    1d56:	d1c8           	adda.l a0,a0
    1d58:	2070 a800      	movea.l (0,a0,a2.l),a0
    1d5c:	b1e9 003c      	cmpa.l 60(a1),a0
    1d60:	57c0           	seq d0
    1d62:	4880           	ext.w d0
    1d64:	48c0           	ext.l d0
    1d66:	4480           	neg.l d0
}
    1d68:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1d6c:	4e75           	rts
  return 1;
    1d6e:	7001           	moveq #1,d0
}
    1d70:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1d74:	4e75           	rts
      return 0;
    1d76:	7000           	moveq #0,d0
}
    1d78:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1d7c:	4e75           	rts

00001d7e <ClBuild>:
ULONG * ClbuildSW() {
    1d7e:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    1d82:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    1d88:	707b           	moveq #123,d0
    1d8a:	4600           	not.b d0
    1d8c:	7202           	moveq #2,d1
    1d8e:	4eae ff3a      	jsr -198(a6)
    1d92:	2440           	movea.l d0,a2
  if( retval == 0) {
    1d94:	4a80           	tst.l d0
    1d96:	6700 010e      	beq.w 1ea6 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    1d9a:	24b9 0000 5d60 	move.l 5d60 <ClsSprites>,(a2)
    1da0:	2579 0000 5d64 	move.l 5d64 <ClsSprites+0x4>,4(a2)
    1da6:	0004 
    1da8:	2579 0000 5d68 	move.l 5d68 <ClsSprites+0x8>,8(a2)
    1dae:	0008 
    1db0:	2579 0000 5d6c 	move.l 5d6c <ClsSprites+0xc>,12(a2)
    1db6:	000c 
    1db8:	2579 0000 5d70 	move.l 5d70 <ClsSprites+0x10>,16(a2)
    1dbe:	0010 
    1dc0:	2579 0000 5d74 	move.l 5d74 <ClsSprites+0x14>,20(a2)
    1dc6:	0014 
    1dc8:	2579 0000 5d78 	move.l 5d78 <ClsSprites+0x18>,24(a2)
    1dce:	0018 
    1dd0:	2579 0000 5d7c 	move.l 5d7c <ClsSprites+0x1c>,28(a2)
    1dd6:	001c 
    1dd8:	2579 0000 5d80 	move.l 5d80 <ClsSprites+0x20>,32(a2)
    1dde:	0020 
    1de0:	2579 0000 5d84 	move.l 5d84 <ClsSprites+0x24>,36(a2)
    1de6:	0024 
    1de8:	2579 0000 5d88 	move.l 5d88 <ClsSprites+0x28>,40(a2)
    1dee:	0028 
    1df0:	2579 0000 5d8c 	move.l 5d8c <ClsSprites+0x2c>,44(a2)
    1df6:	002c 
    1df8:	2579 0000 5d90 	move.l 5d90 <ClsSprites+0x30>,48(a2)
    1dfe:	0030 
    1e00:	2579 0000 5d94 	move.l 5d94 <ClsSprites+0x34>,52(a2)
    1e06:	0034 
    1e08:	2579 0000 5d98 	move.l 5d98 <ClsSprites+0x38>,56(a2)
    1e0e:	0038 
    1e10:	2579 0000 5d9c 	move.l 5d9c <ClsSprites+0x3c>,60(a2)
    1e16:	003c 
    *cl++ = *clpartinstruction++;
    1e18:	2579 0000 5d30 	move.l 5d30 <ClScreen>,64(a2)
    1e1e:	0040 
    1e20:	2579 0000 5d34 	move.l 5d34 <ClScreen+0x4>,68(a2)
    1e26:	0044 
    1e28:	2579 0000 5d38 	move.l 5d38 <ClScreen+0x8>,72(a2)
    1e2e:	0048 
    1e30:	2579 0000 5d3c 	move.l 5d3c <ClScreen+0xc>,76(a2)
    1e36:	004c 
    1e38:	2579 0000 5d40 	move.l 5d40 <ClScreen+0x10>,80(a2)
    1e3e:	0050 
    1e40:	2579 0000 5d44 	move.l 5d44 <ClScreen+0x14>,84(a2)
    1e46:	0054 
    1e48:	2579 0000 5d48 	move.l 5d48 <ClScreen+0x18>,88(a2)
    1e4e:	0058 
    1e50:	2579 0000 5d4c 	move.l 5d4c <ClScreen+0x1c>,92(a2)
    1e56:	005c 
    1e58:	2579 0000 5d50 	move.l 5d50 <ClScreen+0x20>,96(a2)
    1e5e:	0060 
    1e60:	2579 0000 5d54 	move.l 5d54 <ClScreen+0x24>,100(a2)
    1e66:	0064 
    1e68:	2579 0000 5d58 	move.l 5d58 <ClScreen+0x28>,104(a2)
    1e6e:	0068 
    1e70:	2579 0000 5d5c 	move.l 5d5c <ClScreen+0x2c>,108(a2)
    1e76:	006c 
  *cl++ = 0x00e00000;
    1e78:	257c 00e0 0000 	move.l #14680064,112(a2)
    1e7e:	0070 
  *cl++ = 0x00e20000;
    1e80:	257c 00e2 0000 	move.l #14811136,116(a2)
    1e86:	0074 
    *cl++ = *clpartinstruction++;
    1e88:	2579 0000 5d28 	move.l 5d28 <ClColor>,120(a2)
    1e8e:	0078 
    1e90:	2579 0000 5d2c 	move.l 5d2c <ClColor+0x4>,124(a2)
    1e96:	007c 
  *cl = 0xfffffffe;
    1e98:	70fe           	moveq #-2,d0
    1e9a:	2540 0080      	move.l d0,128(a2)
}
    1e9e:	200a           	move.l a2,d0
    1ea0:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1ea4:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1ea6:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1eac:	4eae ffc4      	jsr -60(a6)
    1eb0:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1eb6:	2200           	move.l d0,d1
    1eb8:	243c 0000 3535 	move.l #13621,d2
    1ebe:	7628           	moveq #40,d3
    1ec0:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1ec4:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    1eca:	7201           	moveq #1,d1
    1ecc:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1ed0:	24b9 0000 5d60 	move.l 5d60 <ClsSprites>,(a2)
    1ed6:	2579 0000 5d64 	move.l 5d64 <ClsSprites+0x4>,4(a2)
    1edc:	0004 
    1ede:	2579 0000 5d68 	move.l 5d68 <ClsSprites+0x8>,8(a2)
    1ee4:	0008 
    1ee6:	2579 0000 5d6c 	move.l 5d6c <ClsSprites+0xc>,12(a2)
    1eec:	000c 
    1eee:	2579 0000 5d70 	move.l 5d70 <ClsSprites+0x10>,16(a2)
    1ef4:	0010 
    1ef6:	2579 0000 5d74 	move.l 5d74 <ClsSprites+0x14>,20(a2)
    1efc:	0014 
    1efe:	2579 0000 5d78 	move.l 5d78 <ClsSprites+0x18>,24(a2)
    1f04:	0018 
    1f06:	2579 0000 5d7c 	move.l 5d7c <ClsSprites+0x1c>,28(a2)
    1f0c:	001c 
    1f0e:	2579 0000 5d80 	move.l 5d80 <ClsSprites+0x20>,32(a2)
    1f14:	0020 
    1f16:	2579 0000 5d84 	move.l 5d84 <ClsSprites+0x24>,36(a2)
    1f1c:	0024 
    1f1e:	2579 0000 5d88 	move.l 5d88 <ClsSprites+0x28>,40(a2)
    1f24:	0028 
    1f26:	2579 0000 5d8c 	move.l 5d8c <ClsSprites+0x2c>,44(a2)
    1f2c:	002c 
    1f2e:	2579 0000 5d90 	move.l 5d90 <ClsSprites+0x30>,48(a2)
    1f34:	0030 
    1f36:	2579 0000 5d94 	move.l 5d94 <ClsSprites+0x34>,52(a2)
    1f3c:	0034 
    1f3e:	2579 0000 5d98 	move.l 5d98 <ClsSprites+0x38>,56(a2)
    1f44:	0038 
    1f46:	2579 0000 5d9c 	move.l 5d9c <ClsSprites+0x3c>,60(a2)
    1f4c:	003c 
    *cl++ = *clpartinstruction++;
    1f4e:	2579 0000 5d30 	move.l 5d30 <ClScreen>,64(a2)
    1f54:	0040 
    1f56:	2579 0000 5d34 	move.l 5d34 <ClScreen+0x4>,68(a2)
    1f5c:	0044 
    1f5e:	2579 0000 5d38 	move.l 5d38 <ClScreen+0x8>,72(a2)
    1f64:	0048 
    1f66:	2579 0000 5d3c 	move.l 5d3c <ClScreen+0xc>,76(a2)
    1f6c:	004c 
    1f6e:	2579 0000 5d40 	move.l 5d40 <ClScreen+0x10>,80(a2)
    1f74:	0050 
    1f76:	2579 0000 5d44 	move.l 5d44 <ClScreen+0x14>,84(a2)
    1f7c:	0054 
    1f7e:	2579 0000 5d48 	move.l 5d48 <ClScreen+0x18>,88(a2)
    1f84:	0058 
    1f86:	2579 0000 5d4c 	move.l 5d4c <ClScreen+0x1c>,92(a2)
    1f8c:	005c 
    1f8e:	2579 0000 5d50 	move.l 5d50 <ClScreen+0x20>,96(a2)
    1f94:	0060 
    1f96:	2579 0000 5d54 	move.l 5d54 <ClScreen+0x24>,100(a2)
    1f9c:	0064 
    1f9e:	2579 0000 5d58 	move.l 5d58 <ClScreen+0x28>,104(a2)
    1fa4:	0068 
    1fa6:	2579 0000 5d5c 	move.l 5d5c <ClScreen+0x2c>,108(a2)
    1fac:	006c 
  *cl++ = 0x00e00000;
    1fae:	257c 00e0 0000 	move.l #14680064,112(a2)
    1fb4:	0070 
  *cl++ = 0x00e20000;
    1fb6:	257c 00e2 0000 	move.l #14811136,116(a2)
    1fbc:	0074 
    *cl++ = *clpartinstruction++;
    1fbe:	2579 0000 5d28 	move.l 5d28 <ClColor>,120(a2)
    1fc4:	0078 
    1fc6:	2579 0000 5d2c 	move.l 5d2c <ClColor+0x4>,124(a2)
    1fcc:	007c 
  *cl = 0xfffffffe;
    1fce:	70fe           	moveq #-2,d0
    1fd0:	2540 0080      	move.l d0,128(a2)
}
    1fd4:	200a           	move.l a2,d0
    1fd6:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1fda:	4e75           	rts

00001fdc <Zoom_ZoomIntoPicture>:
void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr) {
    1fdc:	4fef ffe0      	lea -32(sp),sp
    1fe0:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1fe4:	202f 0058      	move.l 88(sp),d0
  UWORD nextzoom = 352-28 + (zoomnr << 3);
    1fe8:	3200           	move.w d0,d1
    1fea:	e749           	lsl.w #3,d1
    1fec:	0641 0144      	addi.w #324,d1
    1ff0:	3f41 0040      	move.w d1,64(sp)
    ZoomHorizontal = 16 - zoomnr * 6;
    1ff4:	3200           	move.w d0,d1
    1ff6:	d240           	add.w d0,d1
    1ff8:	3041           	movea.w d1,a0
    1ffa:	d0c0           	adda.w d0,a0
    1ffc:	d0c8           	adda.w a0,a0
    1ffe:	7410           	moveq #16,d2
    2000:	9448           	sub.w a0,d2
    2002:	3f42 0042      	move.w d2,66(sp)
        ZoomHorizontal = 16 - zoomnr + (zoomnr << 1);
    2006:	9240           	sub.w d0,d1
    2008:	3a41           	movea.w d1,a5
    200a:	4bed 0010      	lea 16(a5),a5
    200e:	242f 0050      	move.l 80(sp),d2
    2012:	0682 0000 01ac 	addi.l #428,d2
    2018:	2f42 0038      	move.l d2,56(sp)
    201c:	742c           	moveq #44,d2
    201e:	d4af 0054      	add.l 84(sp),d2
    2022:	2f42 003c      	move.l d2,60(sp)
  UWORD shifttoleft = 0;
    2026:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 336;
    202a:	3f7c 0150 0036 	move.w #336,54(sp)
  WORD shiftright = 7;
    2030:	3f7c 0007 002e 	move.w #7,46(sp)
      nextzoom -= (21 + zoomnr);
    2036:	74eb           	moveq #-21,d2
    2038:	9440           	sub.w d0,d2
    203a:	3f42 004a      	move.w d2,74(sp)
    *bp = 0;
    203e:	4278 0200      	clr.w 200 <main+0x1fa>
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*8-2-i;
    2042:	262f 0038      	move.l 56(sp),d3
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    2046:	246f 003c      	movea.l 60(sp),a2
    ZoomHorizontal = 16 - zoomnr * 6;
    204a:	33ef 0042 0000 	move.w 66(sp),5e82 <ZoomHorizontal>
    2050:	5e82 
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    2052:	7000           	moveq #0,d0
    2054:	302f 0046      	move.w 70(sp),d0
    2058:	2640           	movea.l d0,a3
    205a:	d7c0           	adda.l d0,a3
    205c:	3f6f 002e 0048 	move.w 46(sp),72(sp)
    2062:	342f 002e      	move.w 46(sp),d2
    2066:	700c           	moveq #12,d0
    2068:	e16a           	lsl.w d0,d2
    206a:	3f42 0030      	move.w d2,48(sp)
    206e:	342f 0040      	move.w 64(sp),d2
    2072:	b46f 0036      	cmp.w 54(sp),d2
    2076:	6200 018e      	bhi.w 2206 <Zoom_ZoomIntoPicture+0x22a>
  hw->bltcon0 = 0x9f0 + shiftright;
    207a:	3e2f 0030      	move.w 48(sp),d7
    207e:	0647 09f0      	addi.w #2544,d7
    2082:	342f 0042      	move.w 66(sp),d2
    2086:	7a10           	moveq #16,d5
    UWORD linesleft = 272;
    2088:	383c 0110      	move.w #272,d4
    208c:	2c03           	move.l d3,d6
    208e:	dc8b           	add.l a3,d6
        if( linesleft >= ZoomHorizontal+1) {
    2090:	b842           	cmp.w d2,d4
    2092:	6300 00be      	bls.w 2152 <Zoom_ZoomIntoPicture+0x176>
          linesleft -= ZoomHorizontal;
    2096:	9842           	sub.w d2,d4
  WaitBlit();
    2098:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    209e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    20a2:	2079 0000 5e7a 	movea.l 5e7a <hw>,a0
    20a8:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    20ae:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
    20b2:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    20b8:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    20be:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    20c4:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    20ca:	2146 0050      	move.l d6,80(a0)
  hw->bltdpt = (UWORD *) destination;
    20ce:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    20d2:	ed4a           	lsl.w #6,d2
    20d4:	5442           	addq.w #2,d2
    20d6:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    20da:	7200           	moveq #0,d1
    20dc:	3239 0000 5e82 	move.w 5e82 <ZoomHorizontal>,d1
    20e2:	2001           	move.l d1,d0
    20e4:	d081           	add.l d1,d0
    20e6:	d081           	add.l d1,d0
    20e8:	e988           	lsl.l #4,d0
    20ea:	d680           	add.l d0,d3
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    20ec:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    20ee:	4a44           	tst.w d4
    20f0:	6700 00c6      	beq.w 21b8 <Zoom_ZoomIntoPicture+0x1dc>
          Zoom_CopyWord( pos4source+shifttoleft, pos4dest, shiftright, 1);
    20f4:	2c03           	move.l d3,d6
    20f6:	dc8b           	add.l a3,d6
  WaitBlit();
    20f8:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    20fe:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    2102:	2079 0000 5e7a 	movea.l 5e7a <hw>,a0
    2108:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    210e:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
    2112:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2118:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    211e:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    2124:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    212a:	2146 0050      	move.l d6,80(a0)
  hw->bltdpt = (UWORD *) destination;
    212e:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    2132:	317c 0042 0058 	move.w #66,88(a0)
          linesleft--;
    2138:	5344           	subq.w #1,d4
          pos4dest += ZMLINESIZE/2;
    213a:	45ea 0030      	lea 48(a2),a2
        ZoomHorizontal = 16 - zoomnr + (zoomnr << 1);
    213e:	33cd 0000 5e82 	move.w a5,5e82 <ZoomHorizontal>
    2144:	5385           	subq.l #1,d5
      for(int i=0;i<16;i++) {
    2146:	6700 009c      	beq.w 21e4 <Zoom_ZoomIntoPicture+0x208>
  WORD shiftright = 7;
    214a:	340d           	move.w a5,d2
        if( linesleft >= ZoomHorizontal+1) {
    214c:	b842           	cmp.w d2,d4
    214e:	6200 ff46      	bhi.w 2096 <Zoom_ZoomIntoPicture+0xba>
          ZoomHorizontal = linesleft;
    2152:	33c4 0000 5e82 	move.w d4,5e82 <ZoomHorizontal>
    2158:	3404           	move.w d4,d2
          linesleft = 0;
    215a:	4244           	clr.w d4
  WaitBlit();
    215c:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    2162:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    2166:	2079 0000 5e7a 	movea.l 5e7a <hw>,a0
    216c:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    2172:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
    2176:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    217c:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    2182:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    2188:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    218e:	2146 0050      	move.l d6,80(a0)
  hw->bltdpt = (UWORD *) destination;
    2192:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    2196:	ed4a           	lsl.w #6,d2
    2198:	5442           	addq.w #2,d2
    219a:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    219e:	7200           	moveq #0,d1
    21a0:	3239 0000 5e82 	move.w 5e82 <ZoomHorizontal>,d1
    21a6:	2001           	move.l d1,d0
    21a8:	d081           	add.l d1,d0
    21aa:	d081           	add.l d1,d0
    21ac:	e988           	lsl.l #4,d0
    21ae:	d680           	add.l d0,d3
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    21b0:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    21b2:	4a44           	tst.w d4
    21b4:	6600 ff3e      	bne.w 20f4 <Zoom_ZoomIntoPicture+0x118>
        ZoomHorizontal = 16 - zoomnr + (zoomnr << 1);
    21b8:	33cd 0000 5e82 	move.w a5,5e82 <ZoomHorizontal>
    21be:	5385           	subq.l #1,d5
      for(int i=0;i<16;i++) {
    21c0:	6722           	beq.s 21e4 <Zoom_ZoomIntoPicture+0x208>
    21c2:	2c03           	move.l d3,d6
    21c4:	dc8b           	add.l a3,d6
  WORD shiftright = 7;
    21c6:	340d           	move.w a5,d2
    21c8:	6082           	bra.s 214c <Zoom_ZoomIntoPicture+0x170>
      shiftright--;  
    21ca:	3f6f 0044 002e 	move.w 68(sp),46(sp)
      if(shiftright < 0) {
    21d0:	6c12           	bge.s 21e4 <Zoom_ZoomIntoPicture+0x208>
        shiftright += 16;
    21d2:	342f 0048      	move.w 72(sp),d2
    21d6:	0642 000f      	addi.w #15,d2
    21da:	3f42 002e      	move.w d2,46(sp)
        shifttoleft = 1;
    21de:	3f7c 0001 0046 	move.w #1,70(sp)
    startofword -= 16;
    21e4:	066f fff0 0036 	addi.w #-16,54(sp)
    21ea:	55af 0038      	subq.l #2,56(sp)
    21ee:	55af 003c      	subq.l #2,60(sp)
  for(int i=0;i<22;i++) {
    21f2:	0c6f fff0 0036 	cmpi.w #-16,54(sp)
    21f8:	6600 fe44      	bne.w 203e <Zoom_ZoomIntoPicture+0x62>
}
    21fc:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    2200:	4fef 0020      	lea 32(sp),sp
    2204:	4e75           	rts
    2206:	3002           	move.w d2,d0
      UWORD colnr = nextzoom - startofword - 1; 
    2208:	5340           	subq.w #1,d0
    220a:	906f 0036      	sub.w 54(sp),d0
      nextzoom -= (21 + zoomnr);
    220e:	342f 004a      	move.w 74(sp),d2
    2212:	d56f 0040      	add.w d2,64(sp)
    shifta = (shift - 1) << 12;
    2216:	342f 002e      	move.w 46(sp),d2
    221a:	5342           	subq.w #1,d2
    221c:	3f42 0044      	move.w d2,68(sp)
    2220:	3202           	move.w d2,d1
    2222:	740c           	moveq #12,d2
    2224:	e569           	lsl.w d2,d1
  hw->bltcon0 = 0xde4 + shifta;
    2226:	387c f000      	movea.w #-4096,a4
    222a:	4a6f 002e      	tst.w 46(sp)
    222e:	6702           	beq.s 2232 <Zoom_ZoomIntoPicture+0x256>
    2230:	3841           	movea.w d1,a4
    2232:	49ec 0de4      	lea 3556(a4),a4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    2236:	0280 0000 ffff 	andi.l #65535,d0
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    223c:	7210           	moveq #16,d1
    223e:	9280           	sub.l d0,d1
    2240:	7400           	moveq #0,d2
    2242:	4642           	not.w d2
    2244:	e3aa           	lsl.l d1,d2
    2246:	3f42 0034      	move.w d2,52(sp)
    224a:	342f 0042      	move.w 66(sp),d2
    224e:	7a10           	moveq #16,d5
    UWORD linesleft = 272;
    2250:	383c 0110      	move.w #272,d4
        if( linesleft >= ZoomHorizontal+1) {
    2254:	b842           	cmp.w d2,d4
    2256:	6300 0090      	bls.w 22e8 <Zoom_ZoomIntoPicture+0x30c>
          linesleft -= ZoomHorizontal;
    225a:	9842           	sub.w d2,d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    225c:	2c03           	move.l d3,d6
    225e:	dc8b           	add.l a3,d6
    srca = source + 1;
    2260:	2e06           	move.l d6,d7
  if( shift == 0) {
    2262:	4a6f 002e      	tst.w 46(sp)
    2266:	6602           	bne.s 226a <Zoom_ZoomIntoPicture+0x28e>
    srca = source + 1;
    2268:	5487           	addq.l #2,d7
  WaitBlit();
    226a:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    2270:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    2274:	2079 0000 5e7a 	movea.l 5e7a <hw>,a0
    227a:	316f 0030 0042 	move.w 48(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    2280:	314c 0040      	move.w a4,64(a0)
  hw->bltafwm = 0xffff;
    2284:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    228a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    2290:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    2296:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    229c:	316f 0034 0070 	move.w 52(sp),112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    22a2:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
    22a8:	2147 0050      	move.l d7,80(a0)
  hw->bltbpt = srcb;
    22ac:	2146 004c      	move.l d6,76(a0)
  hw->bltdpt = destination;
    22b0:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    22b4:	ed4a           	lsl.w #6,d2
    22b6:	5442           	addq.w #2,d2
    22b8:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    22bc:	7200           	moveq #0,d1
    22be:	3239 0000 5e82 	move.w 5e82 <ZoomHorizontal>,d1
    22c4:	2001           	move.l d1,d0
    22c6:	d081           	add.l d1,d0
    22c8:	d081           	add.l d1,d0
    22ca:	e988           	lsl.l #4,d0
    22cc:	d680           	add.l d0,d3
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    22ce:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    22d0:	4a44           	tst.w d4
    22d2:	6622           	bne.s 22f6 <Zoom_ZoomIntoPicture+0x31a>
        ZoomHorizontal = 16 - zoomnr + (zoomnr << 1);
    22d4:	33cd 0000 5e82 	move.w a5,5e82 <ZoomHorizontal>
    22da:	5385           	subq.l #1,d5
      for(int i=0;i<16;i++) {
    22dc:	6700 feec      	beq.w 21ca <Zoom_ZoomIntoPicture+0x1ee>
    22e0:	340d           	move.w a5,d2
        if( linesleft >= ZoomHorizontal+1) {
    22e2:	b842           	cmp.w d2,d4
    22e4:	6200 ff74      	bhi.w 225a <Zoom_ZoomIntoPicture+0x27e>
          ZoomHorizontal = linesleft;
    22e8:	33c4 0000 5e82 	move.w d4,5e82 <ZoomHorizontal>
    22ee:	3404           	move.w d4,d2
          linesleft = 0;
    22f0:	4244           	clr.w d4
    22f2:	6000 ff68      	bra.w 225c <Zoom_ZoomIntoPicture+0x280>
          Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    22f6:	2403           	move.l d3,d2
    22f8:	d48b           	add.l a3,d2
    srca = source + 1;
    22fa:	2c02           	move.l d2,d6
  if( shift == 0) {
    22fc:	4a6f 002e      	tst.w 46(sp)
    2300:	6602           	bne.s 2304 <Zoom_ZoomIntoPicture+0x328>
    srca = source + 1;
    2302:	5486           	addq.l #2,d6
  WaitBlit();
    2304:	2c79 0000 5e7e 	movea.l 5e7e <GfxBase>,a6
    230a:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    230e:	2079 0000 5e7a 	movea.l 5e7a <hw>,a0
    2314:	316f 0030 0042 	move.w 48(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    231a:	314c 0040      	move.w a4,64(a0)
  hw->bltafwm = 0xffff;
    231e:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2324:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    232a:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    2330:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    2336:	316f 0034 0070 	move.w 52(sp),112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    233c:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
    2342:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = srcb;
    2346:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = destination;
    234a:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    234e:	317c 0042 0058 	move.w #66,88(a0)
          pos4dest += ZMLINESIZE/2;
    2354:	45ea 0030      	lea 48(a2),a2
          linesleft--;
    2358:	5344           	subq.w #1,d4
    235a:	6000 ff78      	bra.w 22d4 <Zoom_ZoomIntoPicture+0x2f8>

0000235e <ClbuildZoom>:
ULONG * ClbuildZoom() {
    235e:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    2362:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    2368:	203c 0000 a48c 	move.l #42124,d0
    236e:	7202           	moveq #2,d1
    2370:	4eae ff3a      	jsr -198(a6)
    2374:	2440           	movea.l d0,a2
  if( retval == 0) {
    2376:	4a80           	tst.l d0
    2378:	6700 0160      	beq.w 24da <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    237c:	24b9 0000 5d60 	move.l 5d60 <ClsSprites>,(a2)
    2382:	2579 0000 5d64 	move.l 5d64 <ClsSprites+0x4>,4(a2)
    2388:	0004 
    238a:	2579 0000 5d68 	move.l 5d68 <ClsSprites+0x8>,8(a2)
    2390:	0008 
    2392:	2579 0000 5d6c 	move.l 5d6c <ClsSprites+0xc>,12(a2)
    2398:	000c 
    239a:	2579 0000 5d70 	move.l 5d70 <ClsSprites+0x10>,16(a2)
    23a0:	0010 
    23a2:	2579 0000 5d74 	move.l 5d74 <ClsSprites+0x14>,20(a2)
    23a8:	0014 
    23aa:	2579 0000 5d78 	move.l 5d78 <ClsSprites+0x18>,24(a2)
    23b0:	0018 
    23b2:	2579 0000 5d7c 	move.l 5d7c <ClsSprites+0x1c>,28(a2)
    23b8:	001c 
    23ba:	2579 0000 5d80 	move.l 5d80 <ClsSprites+0x20>,32(a2)
    23c0:	0020 
    23c2:	2579 0000 5d84 	move.l 5d84 <ClsSprites+0x24>,36(a2)
    23c8:	0024 
    23ca:	2579 0000 5d88 	move.l 5d88 <ClsSprites+0x28>,40(a2)
    23d0:	0028 
    23d2:	2579 0000 5d8c 	move.l 5d8c <ClsSprites+0x2c>,44(a2)
    23d8:	002c 
    23da:	2579 0000 5d90 	move.l 5d90 <ClsSprites+0x30>,48(a2)
    23e0:	0030 
    23e2:	2579 0000 5d94 	move.l 5d94 <ClsSprites+0x34>,52(a2)
    23e8:	0034 
    23ea:	2579 0000 5d98 	move.l 5d98 <ClsSprites+0x38>,56(a2)
    23f0:	0038 
    23f2:	2579 0000 5d9c 	move.l 5d9c <ClsSprites+0x3c>,60(a2)
    23f8:	003c 
    *cl++ = *clpartinstruction++;
    23fa:	2579 0000 5cf8 	move.l 5cf8 <ClScreenZoom>,64(a2)
    2400:	0040 
    2402:	2579 0000 5cfc 	move.l 5cfc <ClScreenZoom+0x4>,68(a2)
    2408:	0044 
    240a:	2579 0000 5d00 	move.l 5d00 <ClScreenZoom+0x8>,72(a2)
    2410:	0048 
    2412:	2579 0000 5d04 	move.l 5d04 <ClScreenZoom+0xc>,76(a2)
    2418:	004c 
    241a:	2579 0000 5d08 	move.l 5d08 <ClScreenZoom+0x10>,80(a2)
    2420:	0050 
    2422:	2579 0000 5d0c 	move.l 5d0c <ClScreenZoom+0x14>,84(a2)
    2428:	0054 
    242a:	2579 0000 5d10 	move.l 5d10 <ClScreenZoom+0x18>,88(a2)
    2430:	0058 
    2432:	2579 0000 5d14 	move.l 5d14 <ClScreenZoom+0x1c>,92(a2)
    2438:	005c 
    243a:	2579 0000 5d18 	move.l 5d18 <ClScreenZoom+0x20>,96(a2)
    2440:	0060 
    2442:	2579 0000 5d1c 	move.l 5d1c <ClScreenZoom+0x24>,100(a2)
    2448:	0064 
    244a:	2579 0000 5d20 	move.l 5d20 <ClScreenZoom+0x28>,104(a2)
    2450:	0068 
    2452:	2579 0000 5d24 	move.l 5d24 <ClScreenZoom+0x2c>,108(a2)
    2458:	006c 
  *cl++ = 0x00e00000;
    245a:	257c 00e0 0000 	move.l #14680064,112(a2)
    2460:	0070 
  *cl++ = 0x00e20000;
    2462:	257c 00e2 0000 	move.l #14811136,116(a2)
    2468:	0074 
  *cl++ = 0x00e40000;
    246a:	257c 00e4 0000 	move.l #14942208,120(a2)
    2470:	0078 
  *cl++ = 0x00e60000;
    2472:	257c 00e6 0000 	move.l #15073280,124(a2)
    2478:	007c 
    *cl++ = *clpartinstruction++;
    247a:	2579 0000 5d28 	move.l 5d28 <ClColor>,128(a2)
    2480:	0080 
    2482:	2579 0000 5d2c 	move.l 5d2c <ClColor+0x4>,132(a2)
    2488:	0084 
    248a:	43ea 012c      	lea 300(a2),a1
    248e:	220a           	move.l a2,d1
    2490:	0681 0000 a52c 	addi.l #42284,d1
    2496:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    249c:	41e9 ff60      	lea -160(a1),a0
    24a0:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    24a4:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    24aa:	5088           	addq.l #8,a0
    24ac:	217c 0182 0f00 	move.l #25300736,-4(a0)
    24b2:	fffc 
    for(int i2=0;i2<20;i2++) {
    24b4:	b3c8           	cmpa.l a0,a1
    24b6:	66ec           	bne.s 24a4 <ClbuildZoom+0x146>
    24b8:	43e8 00a4      	lea 164(a0),a1
    24bc:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    24c2:	b3c1           	cmpa.l d1,a1
    24c4:	66d6           	bne.s 249c <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    24c6:	203c 0000 a488 	move.l #42120,d0
    24cc:	72fe           	moveq #-2,d1
    24ce:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    24d2:	200a           	move.l a2,d0
    24d4:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    24d8:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    24da:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    24e0:	4eae ffc4      	jsr -60(a6)
    24e4:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    24ea:	2200           	move.l d0,d1
    24ec:	243c 0000 3535 	move.l #13621,d2
    24f2:	7628           	moveq #40,d3
    24f4:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    24f8:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    24fe:	7201           	moveq #1,d1
    2500:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    2504:	24b9 0000 5d60 	move.l 5d60 <ClsSprites>,(a2)
    250a:	2579 0000 5d64 	move.l 5d64 <ClsSprites+0x4>,4(a2)
    2510:	0004 
    2512:	2579 0000 5d68 	move.l 5d68 <ClsSprites+0x8>,8(a2)
    2518:	0008 
    251a:	2579 0000 5d6c 	move.l 5d6c <ClsSprites+0xc>,12(a2)
    2520:	000c 
    2522:	2579 0000 5d70 	move.l 5d70 <ClsSprites+0x10>,16(a2)
    2528:	0010 
    252a:	2579 0000 5d74 	move.l 5d74 <ClsSprites+0x14>,20(a2)
    2530:	0014 
    2532:	2579 0000 5d78 	move.l 5d78 <ClsSprites+0x18>,24(a2)
    2538:	0018 
    253a:	2579 0000 5d7c 	move.l 5d7c <ClsSprites+0x1c>,28(a2)
    2540:	001c 
    2542:	2579 0000 5d80 	move.l 5d80 <ClsSprites+0x20>,32(a2)
    2548:	0020 
    254a:	2579 0000 5d84 	move.l 5d84 <ClsSprites+0x24>,36(a2)
    2550:	0024 
    2552:	2579 0000 5d88 	move.l 5d88 <ClsSprites+0x28>,40(a2)
    2558:	0028 
    255a:	2579 0000 5d8c 	move.l 5d8c <ClsSprites+0x2c>,44(a2)
    2560:	002c 
    2562:	2579 0000 5d90 	move.l 5d90 <ClsSprites+0x30>,48(a2)
    2568:	0030 
    256a:	2579 0000 5d94 	move.l 5d94 <ClsSprites+0x34>,52(a2)
    2570:	0034 
    2572:	2579 0000 5d98 	move.l 5d98 <ClsSprites+0x38>,56(a2)
    2578:	0038 
    257a:	2579 0000 5d9c 	move.l 5d9c <ClsSprites+0x3c>,60(a2)
    2580:	003c 
    *cl++ = *clpartinstruction++;
    2582:	2579 0000 5cf8 	move.l 5cf8 <ClScreenZoom>,64(a2)
    2588:	0040 
    258a:	2579 0000 5cfc 	move.l 5cfc <ClScreenZoom+0x4>,68(a2)
    2590:	0044 
    2592:	2579 0000 5d00 	move.l 5d00 <ClScreenZoom+0x8>,72(a2)
    2598:	0048 
    259a:	2579 0000 5d04 	move.l 5d04 <ClScreenZoom+0xc>,76(a2)
    25a0:	004c 
    25a2:	2579 0000 5d08 	move.l 5d08 <ClScreenZoom+0x10>,80(a2)
    25a8:	0050 
    25aa:	2579 0000 5d0c 	move.l 5d0c <ClScreenZoom+0x14>,84(a2)
    25b0:	0054 
    25b2:	2579 0000 5d10 	move.l 5d10 <ClScreenZoom+0x18>,88(a2)
    25b8:	0058 
    25ba:	2579 0000 5d14 	move.l 5d14 <ClScreenZoom+0x1c>,92(a2)
    25c0:	005c 
    25c2:	2579 0000 5d18 	move.l 5d18 <ClScreenZoom+0x20>,96(a2)
    25c8:	0060 
    25ca:	2579 0000 5d1c 	move.l 5d1c <ClScreenZoom+0x24>,100(a2)
    25d0:	0064 
    25d2:	2579 0000 5d20 	move.l 5d20 <ClScreenZoom+0x28>,104(a2)
    25d8:	0068 
    25da:	2579 0000 5d24 	move.l 5d24 <ClScreenZoom+0x2c>,108(a2)
    25e0:	006c 
  *cl++ = 0x00e00000;
    25e2:	257c 00e0 0000 	move.l #14680064,112(a2)
    25e8:	0070 
  *cl++ = 0x00e20000;
    25ea:	257c 00e2 0000 	move.l #14811136,116(a2)
    25f0:	0074 
  *cl++ = 0x00e40000;
    25f2:	257c 00e4 0000 	move.l #14942208,120(a2)
    25f8:	0078 
  *cl++ = 0x00e60000;
    25fa:	257c 00e6 0000 	move.l #15073280,124(a2)
    2600:	007c 
    *cl++ = *clpartinstruction++;
    2602:	2579 0000 5d28 	move.l 5d28 <ClColor>,128(a2)
    2608:	0080 
    260a:	2579 0000 5d2c 	move.l 5d2c <ClColor+0x4>,132(a2)
    2610:	0084 
    2612:	43ea 012c      	lea 300(a2),a1
    2616:	220a           	move.l a2,d1
    2618:	0681 0000 a52c 	addi.l #42284,d1
    261e:	203c 2c07 fffe 	move.l #738721790,d0
    2624:	6000 fe76      	bra.w 249c <ClbuildZoom+0x13e>

00002628 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    2628:	2039 0000 5e90 	move.l 5e90 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    262e:	23f9 0000 5e84 	move.l 5e84 <ViewCopper>,5e90 <DrawCopper>
    2634:	0000 5e90 
  ViewCopper = (ULONG *)tmp;
    2638:	23c0 0000 5e84 	move.l d0,5e84 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    263e:	2079 0000 5e7a 	movea.l 5e7a <hw>,a0
    2644:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    2648:	3140 0088      	move.w d0,136(a0)
}
    264c:	4e75           	rts

0000264e <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    264e:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    2652:	45fa fd0a      	lea 235e <ClbuildZoom>(pc),a2
    2656:	4e92           	jsr (a2)
    2658:	23c0 0000 5ea0 	move.l d0,5ea0 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    265e:	4e92           	jsr (a2)
    2660:	23c0 0000 5e9c 	move.l d0,5e9c <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2666:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    266c:	203c 0001 6800 	move.l #92160,d0
    2672:	7202           	moveq #2,d1
    2674:	4eae ff3a      	jsr -198(a6)
    2678:	23c0 0000 5e98 	move.l d0,5e98 <Bitplane1>
  if(Bitplane1 == 0) {
    267e:	6700 014e      	beq.w 27ce <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    2682:	23c0 0000 5e94 	move.l d0,5e94 <DrawBuffer>
  DrawCopper = Copperlist1;
    2688:	23f9 0000 5ea0 	move.l 5ea0 <Copperlist1>,5e90 <DrawCopper>
    268e:	0000 5e90 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2692:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    2698:	203c 0001 6800 	move.l #92160,d0
    269e:	7202           	moveq #2,d1
    26a0:	4eae ff3a      	jsr -198(a6)
    26a4:	2400           	move.l d0,d2
    26a6:	23c0 0000 5e8c 	move.l d0,5e8c <Bitplane2>
  if(Bitplane2 == 0) {
    26ac:	6778           	beq.s 2726 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    26ae:	23f9 0000 5e9c 	move.l 5e9c <Copperlist2>,5e84 <ViewCopper>
    26b4:	0000 5e84 
  SwapCl();
    26b8:	45fa ff6e      	lea 2628 <SwapCl>(pc),a2
    26bc:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    26be:	2039 0000 5e94 	move.l 5e94 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    26c4:	2079 0000 5e90 	movea.l 5e90 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    26ca:	2200           	move.l d0,d1
    26cc:	4241           	clr.w d1
    26ce:	4841           	swap d1
    26d0:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    26d4:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    26d8:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    26de:	2200           	move.l d0,d1
    26e0:	4241           	clr.w d1
    26e2:	4841           	swap d1
    26e4:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    26e8:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    26ec:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    26ee:	2079 0000 5e90 	movea.l 5e90 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    26f4:	2002           	move.l d2,d0
    26f6:	4240           	clr.w d0
    26f8:	4840           	swap d0
    26fa:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    26fe:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    2702:	2002           	move.l d2,d0
    2704:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    270a:	2200           	move.l d0,d1
    270c:	4241           	clr.w d1
    270e:	4841           	swap d1
    2710:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2714:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    2718:	23c2 0000 5e88 	move.l d2,5e88 <ViewBuffer>
}
    271e:	7000           	moveq #0,d0
    2720:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2724:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2726:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    272c:	4eae ffc4      	jsr -60(a6)
    2730:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    2736:	2200           	move.l d0,d1
    2738:	243c 0000 3582 	move.l #13698,d2
    273e:	7626           	moveq #38,d3
    2740:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2744:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    274a:	7201           	moveq #1,d1
    274c:	4eae ff70      	jsr -144(a6)
    2750:	2439 0000 5e8c 	move.l 5e8c <Bitplane2>,d2
  ViewCopper = Copperlist2;
    2756:	23f9 0000 5e9c 	move.l 5e9c <Copperlist2>,5e84 <ViewCopper>
    275c:	0000 5e84 
  SwapCl();
    2760:	45fa fec6      	lea 2628 <SwapCl>(pc),a2
    2764:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    2766:	2039 0000 5e94 	move.l 5e94 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    276c:	2079 0000 5e90 	movea.l 5e90 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2772:	2200           	move.l d0,d1
    2774:	4241           	clr.w d1
    2776:	4841           	swap d1
    2778:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    277c:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    2780:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2786:	2200           	move.l d0,d1
    2788:	4241           	clr.w d1
    278a:	4841           	swap d1
    278c:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2790:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    2794:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    2796:	2079 0000 5e90 	movea.l 5e90 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    279c:	2002           	move.l d2,d0
    279e:	4240           	clr.w d0
    27a0:	4840           	swap d0
    27a2:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    27a6:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    27aa:	2002           	move.l d2,d0
    27ac:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    27b2:	2200           	move.l d0,d1
    27b4:	4241           	clr.w d1
    27b6:	4841           	swap d1
    27b8:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    27bc:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    27c0:	23c2 0000 5e88 	move.l d2,5e88 <ViewBuffer>
}
    27c6:	7000           	moveq #0,d0
    27c8:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    27cc:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    27ce:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    27d4:	4eae ffc4      	jsr -60(a6)
    27d8:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    27de:	2200           	move.l d0,d1
    27e0:	243c 0000 355b 	move.l #13659,d2
    27e6:	7626           	moveq #38,d3
    27e8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    27ec:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    27f2:	7201           	moveq #1,d1
    27f4:	4eae ff70      	jsr -144(a6)
    27f8:	2039 0000 5e98 	move.l 5e98 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    27fe:	23c0 0000 5e94 	move.l d0,5e94 <DrawBuffer>
  DrawCopper = Copperlist1;
    2804:	23f9 0000 5ea0 	move.l 5ea0 <Copperlist1>,5e90 <DrawCopper>
    280a:	0000 5e90 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    280e:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    2814:	203c 0001 6800 	move.l #92160,d0
    281a:	7202           	moveq #2,d1
    281c:	4eae ff3a      	jsr -198(a6)
    2820:	2400           	move.l d0,d2
    2822:	23c0 0000 5e8c 	move.l d0,5e8c <Bitplane2>
  if(Bitplane2 == 0) {
    2828:	6600 fe84      	bne.w 26ae <PrepareDisplayZoom+0x60>
    282c:	6000 fef8      	bra.w 2726 <PrepareDisplayZoom+0xd8>

00002830 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2830:	2039 0000 5e94 	move.l 5e94 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2836:	2079 0000 5e90 	movea.l 5e90 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    283c:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2840:	2200           	move.l d0,d1
    2842:	4241           	clr.w d1
    2844:	4841           	swap d1
    2846:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    284a:	23f9 0000 5e88 	move.l 5e88 <ViewBuffer>,5e94 <DrawBuffer>
    2850:	0000 5e94 
  ViewBuffer = (ULONG *) tmp;
    2854:	23c0 0000 5e88 	move.l d0,5e88 <ViewBuffer>
}
    285a:	4e75           	rts

0000285c <PrepareDisplay>:
 int PrepareDisplaySW() {
    285c:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    2860:	45fa f51c      	lea 1d7e <ClBuild>(pc),a2
    2864:	4e92           	jsr (a2)
    2866:	23c0 0000 5ea0 	move.l d0,5ea0 <Copperlist1>
  Copperlist2 = ClbuildSW();
    286c:	4e92           	jsr (a2)
    286e:	23c0 0000 5e9c 	move.l d0,5e9c <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2874:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    287a:	203c 0000 c800 	move.l #51200,d0
    2880:	7202           	moveq #2,d1
    2882:	4eae ff3a      	jsr -198(a6)
    2886:	23c0 0000 5e98 	move.l d0,5e98 <Bitplane1>
  if(Bitplane1 == 0) {
    288c:	6700 00ac      	beq.w 293a <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    2890:	23c0 0000 5e94 	move.l d0,5e94 <DrawBuffer>
  DrawCopper = Copperlist1;
    2896:	23f9 0000 5ea0 	move.l 5ea0 <Copperlist1>,5e90 <DrawCopper>
    289c:	0000 5e90 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    28a0:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    28a6:	203c 0000 c800 	move.l #51200,d0
    28ac:	7202           	moveq #2,d1
    28ae:	4eae ff3a      	jsr -198(a6)
    28b2:	23c0 0000 5e8c 	move.l d0,5e8c <Bitplane2>
  if(Bitplane2 == 0) {
    28b8:	6728           	beq.s 28e2 <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    28ba:	23c0 0000 5e88 	move.l d0,5e88 <ViewBuffer>
  ViewCopper = Copperlist2;
    28c0:	23f9 0000 5e9c 	move.l 5e9c <Copperlist2>,5e84 <ViewCopper>
    28c6:	0000 5e84 
  SwapCl();
    28ca:	47fa fd5c      	lea 2628 <SwapCl>(pc),a3
    28ce:	4e93           	jsr (a3)
  SetBplPointers();
    28d0:	45fa ff5e      	lea 2830 <SetBplPointers>(pc),a2
    28d4:	4e92           	jsr (a2)
  SwapCl();
    28d6:	4e93           	jsr (a3)
  SetBplPointers();
    28d8:	4e92           	jsr (a2)
}
    28da:	7000           	moveq #0,d0
    28dc:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    28e0:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    28e2:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    28e8:	4eae ffc4      	jsr -60(a6)
    28ec:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    28f2:	2200           	move.l d0,d1
    28f4:	243c 0000 3582 	move.l #13698,d2
    28fa:	7626           	moveq #38,d3
    28fc:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2900:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    2906:	7201           	moveq #1,d1
    2908:	4eae ff70      	jsr -144(a6)
    290c:	2039 0000 5e8c 	move.l 5e8c <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    2912:	23c0 0000 5e88 	move.l d0,5e88 <ViewBuffer>
  ViewCopper = Copperlist2;
    2918:	23f9 0000 5e9c 	move.l 5e9c <Copperlist2>,5e84 <ViewCopper>
    291e:	0000 5e84 
  SwapCl();
    2922:	47fa fd04      	lea 2628 <SwapCl>(pc),a3
    2926:	4e93           	jsr (a3)
  SetBplPointers();
    2928:	45fa ff06      	lea 2830 <SetBplPointers>(pc),a2
    292c:	4e92           	jsr (a2)
  SwapCl();
    292e:	4e93           	jsr (a3)
  SetBplPointers();
    2930:	4e92           	jsr (a2)
}
    2932:	7000           	moveq #0,d0
    2934:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    2938:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    293a:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    2940:	4eae ffc4      	jsr -60(a6)
    2944:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    294a:	2200           	move.l d0,d1
    294c:	243c 0000 355b 	move.l #13659,d2
    2952:	7626           	moveq #38,d3
    2954:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2958:	2c79 0000 5ea4 	movea.l 5ea4 <DOSBase>,a6
    295e:	7201           	moveq #1,d1
    2960:	4eae ff70      	jsr -144(a6)
    2964:	2039 0000 5e98 	move.l 5e98 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    296a:	23c0 0000 5e94 	move.l d0,5e94 <DrawBuffer>
  DrawCopper = Copperlist1;
    2970:	23f9 0000 5ea0 	move.l 5ea0 <Copperlist1>,5e90 <DrawCopper>
    2976:	0000 5e90 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    297a:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    2980:	203c 0000 c800 	move.l #51200,d0
    2986:	7202           	moveq #2,d1
    2988:	4eae ff3a      	jsr -198(a6)
    298c:	23c0 0000 5e8c 	move.l d0,5e8c <Bitplane2>
  if(Bitplane2 == 0) {
    2992:	6600 ff26      	bne.w 28ba <PrepareDisplay+0x5e>
    2996:	6000 ff4a      	bra.w 28e2 <PrepareDisplay+0x86>

0000299a <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    299a:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    299e:	262f 0010      	move.l 16(sp),d3
    29a2:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    29a6:	2279 0000 5ea0 	movea.l 5ea0 <Copperlist1>,a1
    29ac:	b2fc 0000      	cmpa.w #0,a1
    29b0:	670c           	beq.s 29be <FreeDisplay+0x24>
    29b2:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    29b8:	2003           	move.l d3,d0
    29ba:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    29be:	2279 0000 5e9c 	movea.l 5e9c <Copperlist2>,a1
    29c4:	b2fc 0000      	cmpa.w #0,a1
    29c8:	670c           	beq.s 29d6 <FreeDisplay+0x3c>
    29ca:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    29d0:	2003           	move.l d3,d0
    29d2:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    29d6:	2279 0000 5e98 	movea.l 5e98 <Bitplane1>,a1
    29dc:	b2fc 0000      	cmpa.w #0,a1
    29e0:	670c           	beq.s 29ee <FreeDisplay+0x54>
    29e2:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    29e8:	2002           	move.l d2,d0
    29ea:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    29ee:	2279 0000 5e8c 	movea.l 5e8c <Bitplane2>,a1
    29f4:	b2fc 0000      	cmpa.w #0,a1
    29f8:	670c           	beq.s 2a06 <FreeDisplay+0x6c>
    29fa:	2c79 0000 5ea8 	movea.l 5ea8 <SysBase>,a6
    2a00:	2002           	move.l d2,d0
    2a02:	4eae ff2e      	jsr -210(a6)
}
    2a06:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2a0a:	4e75           	rts

00002a0c <WaitVbl>:
void WaitVbl() {
    2a0c:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    2a0e:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddbe2e>,d0
    2a14:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    2a16:	2017           	move.l (sp),d0
    2a18:	0280 0001 ff00 	andi.l #130816,d0
    2a1e:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    2a20:	2017           	move.l (sp),d0
    2a22:	0c80 0001 3700 	cmpi.l #79616,d0
    2a28:	67e4           	beq.s 2a0e <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    2a2a:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddbe2e>,d0
    2a30:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    2a34:	202f 0004      	move.l 4(sp),d0
    2a38:	0280 0001 ff00 	andi.l #130816,d0
    2a3e:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    2a42:	202f 0004      	move.l 4(sp),d0
    2a46:	0c80 0001 3700 	cmpi.l #79616,d0
    2a4c:	66dc           	bne.s 2a2a <WaitVbl+0x1e>
}
    2a4e:	508f           	addq.l #8,sp
    2a50:	4e75           	rts

00002a52 <memcpy>:
{
    2a52:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    2a56:	202f 0014      	move.l 20(sp),d0
    2a5a:	226f 0018      	movea.l 24(sp),a1
    2a5e:	222f 001c      	move.l 28(sp),d1
	while(len--)
    2a62:	2601           	move.l d1,d3
    2a64:	5383           	subq.l #1,d3
    2a66:	4a81           	tst.l d1
    2a68:	6762           	beq.s 2acc <memcpy+0x7a>
    2a6a:	2040           	movea.l d0,a0
    2a6c:	5888           	addq.l #4,a0
    2a6e:	b1c9           	cmpa.l a1,a0
    2a70:	53c2           	sl.s d2
    2a72:	4402           	neg.b d2
    2a74:	41e9 0004      	lea 4(a1),a0
    2a78:	b1c0           	cmpa.l d0,a0
    2a7a:	53c4           	sl.s d4
    2a7c:	4404           	neg.b d4
    2a7e:	8404           	or.b d4,d2
    2a80:	7808           	moveq #8,d4
    2a82:	b883           	cmp.l d3,d4
    2a84:	55c4           	sc.s d4
    2a86:	4404           	neg.b d4
    2a88:	c404           	and.b d4,d2
    2a8a:	6746           	beq.s 2ad2 <memcpy+0x80>
    2a8c:	2409           	move.l a1,d2
    2a8e:	8480           	or.l d0,d2
    2a90:	7803           	moveq #3,d4
    2a92:	c484           	and.l d4,d2
    2a94:	663c           	bne.s 2ad2 <memcpy+0x80>
    2a96:	2049           	movea.l a1,a0
    2a98:	2440           	movea.l d0,a2
    2a9a:	74fc           	moveq #-4,d2
    2a9c:	c481           	and.l d1,d2
    2a9e:	d489           	add.l a1,d2
		*d++ = *s++;
    2aa0:	24d8           	move.l (a0)+,(a2)+
    2aa2:	b488           	cmp.l a0,d2
    2aa4:	66fa           	bne.s 2aa0 <memcpy+0x4e>
    2aa6:	74fc           	moveq #-4,d2
    2aa8:	c481           	and.l d1,d2
    2aaa:	2040           	movea.l d0,a0
    2aac:	d1c2           	adda.l d2,a0
    2aae:	d3c2           	adda.l d2,a1
    2ab0:	9682           	sub.l d2,d3
    2ab2:	b481           	cmp.l d1,d2
    2ab4:	6716           	beq.s 2acc <memcpy+0x7a>
    2ab6:	1091           	move.b (a1),(a0)
	while(len--)
    2ab8:	4a83           	tst.l d3
    2aba:	6710           	beq.s 2acc <memcpy+0x7a>
		*d++ = *s++;
    2abc:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    2ac2:	5383           	subq.l #1,d3
    2ac4:	6706           	beq.s 2acc <memcpy+0x7a>
		*d++ = *s++;
    2ac6:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    2acc:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    2ad0:	4e75           	rts
    2ad2:	2040           	movea.l d0,a0
    2ad4:	d289           	add.l a1,d1
		*d++ = *s++;
    2ad6:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    2ad8:	b289           	cmp.l a1,d1
    2ada:	67f0           	beq.s 2acc <memcpy+0x7a>
		*d++ = *s++;
    2adc:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    2ade:	b289           	cmp.l a1,d1
    2ae0:	66f4           	bne.s 2ad6 <memcpy+0x84>
    2ae2:	60e8           	bra.s 2acc <memcpy+0x7a>

00002ae4 <memset>:
{
    2ae4:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    2ae8:	202f 0024      	move.l 36(sp),d0
    2aec:	2a2f 0028      	move.l 40(sp),d5
    2af0:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    2af4:	2809           	move.l a1,d4
    2af6:	5384           	subq.l #1,d4
    2af8:	b2fc 0000      	cmpa.w #0,a1
    2afc:	6f00 00b0      	ble.w 2bae <memset+0xca>
    2b00:	1e05           	move.b d5,d7
    2b02:	2200           	move.l d0,d1
    2b04:	4481           	neg.l d1
    2b06:	7403           	moveq #3,d2
    2b08:	c282           	and.l d2,d1
    2b0a:	7c05           	moveq #5,d6
		*ptr++ = val;
    2b0c:	2440           	movea.l d0,a2
    2b0e:	bc84           	cmp.l d4,d6
    2b10:	646a           	bcc.s 2b7c <memset+0x98>
    2b12:	4a81           	tst.l d1
    2b14:	6724           	beq.s 2b3a <memset+0x56>
    2b16:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    2b18:	5384           	subq.l #1,d4
    2b1a:	7401           	moveq #1,d2
    2b1c:	b481           	cmp.l d1,d2
    2b1e:	671a           	beq.s 2b3a <memset+0x56>
		*ptr++ = val;
    2b20:	2440           	movea.l d0,a2
    2b22:	548a           	addq.l #2,a2
    2b24:	2040           	movea.l d0,a0
    2b26:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    2b2a:	5384           	subq.l #1,d4
    2b2c:	7403           	moveq #3,d2
    2b2e:	b481           	cmp.l d1,d2
    2b30:	6608           	bne.s 2b3a <memset+0x56>
		*ptr++ = val;
    2b32:	528a           	addq.l #1,a2
    2b34:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    2b38:	5384           	subq.l #1,d4
    2b3a:	2609           	move.l a1,d3
    2b3c:	9681           	sub.l d1,d3
    2b3e:	7c00           	moveq #0,d6
    2b40:	1c05           	move.b d5,d6
    2b42:	2406           	move.l d6,d2
    2b44:	4842           	swap d2
    2b46:	4242           	clr.w d2
    2b48:	2042           	movea.l d2,a0
    2b4a:	2406           	move.l d6,d2
    2b4c:	e14a           	lsl.w #8,d2
    2b4e:	4842           	swap d2
    2b50:	4242           	clr.w d2
    2b52:	e18e           	lsl.l #8,d6
    2b54:	2646           	movea.l d6,a3
    2b56:	2c08           	move.l a0,d6
    2b58:	8486           	or.l d6,d2
    2b5a:	2c0b           	move.l a3,d6
    2b5c:	8486           	or.l d6,d2
    2b5e:	1407           	move.b d7,d2
    2b60:	2040           	movea.l d0,a0
    2b62:	d1c1           	adda.l d1,a0
    2b64:	72fc           	moveq #-4,d1
    2b66:	c283           	and.l d3,d1
    2b68:	d288           	add.l a0,d1
		*ptr++ = val;
    2b6a:	20c2           	move.l d2,(a0)+
    2b6c:	b1c1           	cmpa.l d1,a0
    2b6e:	66fa           	bne.s 2b6a <memset+0x86>
    2b70:	72fc           	moveq #-4,d1
    2b72:	c283           	and.l d3,d1
    2b74:	d5c1           	adda.l d1,a2
    2b76:	9881           	sub.l d1,d4
    2b78:	b283           	cmp.l d3,d1
    2b7a:	6732           	beq.s 2bae <memset+0xca>
    2b7c:	1485           	move.b d5,(a2)
	while(len-- > 0)
    2b7e:	4a84           	tst.l d4
    2b80:	6f2c           	ble.s 2bae <memset+0xca>
		*ptr++ = val;
    2b82:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    2b86:	7201           	moveq #1,d1
    2b88:	b284           	cmp.l d4,d1
    2b8a:	6c22           	bge.s 2bae <memset+0xca>
		*ptr++ = val;
    2b8c:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    2b90:	7402           	moveq #2,d2
    2b92:	b484           	cmp.l d4,d2
    2b94:	6c18           	bge.s 2bae <memset+0xca>
		*ptr++ = val;
    2b96:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    2b9a:	7c03           	moveq #3,d6
    2b9c:	bc84           	cmp.l d4,d6
    2b9e:	6c0e           	bge.s 2bae <memset+0xca>
		*ptr++ = val;
    2ba0:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    2ba4:	7204           	moveq #4,d1
    2ba6:	b284           	cmp.l d4,d1
    2ba8:	6c04           	bge.s 2bae <memset+0xca>
		*ptr++ = val;
    2baa:	1545 0005      	move.b d5,5(a2)
}
    2bae:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    2bb2:	4e75           	rts

00002bb4 <strlen>:
{
    2bb4:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    2bb8:	7000           	moveq #0,d0
	while(*s++)
    2bba:	4a10           	tst.b (a0)
    2bbc:	6708           	beq.s 2bc6 <strlen+0x12>
		t++;
    2bbe:	5280           	addq.l #1,d0
	while(*s++)
    2bc0:	4a30 0800      	tst.b (0,a0,d0.l)
    2bc4:	66f8           	bne.s 2bbe <strlen+0xa>
}
    2bc6:	4e75           	rts

00002bc8 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    2bc8:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    2bcc:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    2bd0:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    2bd4:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    2bd8:	d041           	add.w d1,d0
	swap	d0
    2bda:	4840           	swap d0
	clrw	d0
    2bdc:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    2bde:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    2be2:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    2be6:	d081           	add.l d1,d0

	rts
    2be8:	4e75           	rts

00002bea <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    2bea:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    2bec:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    2bf0:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    2bf4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    2bfa:	6416           	bcc.s 2c12 <__udivsi3+0x28>
	movel	d0, d2
    2bfc:	2400           	move.l d0,d2
	clrw	d2
    2bfe:	4242           	clr.w d2
	swap	d2
    2c00:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    2c02:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    2c04:	3002           	move.w d2,d0
	swap	d0
    2c06:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    2c08:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    2c0c:	84c1           	divu.w d1,d2
	movew	d2, d0
    2c0e:	3002           	move.w d2,d0
	jra	6f
    2c10:	6030           	bra.s 2c42 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    2c12:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    2c14:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    2c16:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    2c18:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    2c1e:	64f4           	bcc.s 2c14 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    2c20:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    2c22:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    2c28:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    2c2a:	c2c0           	mulu.w d0,d1
	swap	d2
    2c2c:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    2c2e:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    2c30:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    2c32:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    2c34:	660a           	bne.s 2c40 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    2c36:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    2c38:	6506           	bcs.s 2c40 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    2c3a:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    2c3e:	6302           	bls.s 2c42 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    2c40:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    2c42:	241f           	move.l (sp)+,d2
	rts
    2c44:	4e75           	rts

00002c46 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    2c46:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    2c48:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    2c4a:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    2c4e:	6a04           	bpl.s 2c54 <__divsi3+0xe>
	negl	d1
    2c50:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    2c52:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    2c54:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    2c58:	6a04           	bpl.s 2c5e <__divsi3+0x18>
	negl	d0
    2c5a:	4480           	neg.l d0
	negb	d2
    2c5c:	4402           	neg.b d2

2:	movel	d1, sp@-
    2c5e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2c60:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    2c62:	6186           	bsr.s 2bea <__udivsi3>
	addql	IMM (8), sp
    2c64:	508f           	addq.l #8,sp

	tstb	d2
    2c66:	4a02           	tst.b d2
	jpl	3f
    2c68:	6a02           	bpl.s 2c6c <__divsi3+0x26>
	negl	d0
    2c6a:	4480           	neg.l d0

3:	movel	sp@+, d2
    2c6c:	241f           	move.l (sp)+,d2
	rts
    2c6e:	4e75           	rts

00002c70 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    2c70:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    2c74:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    2c78:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2c7a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    2c7c:	61c8           	bsr.s 2c46 <__divsi3>
	addql	IMM (8), sp
    2c7e:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    2c80:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    2c84:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2c86:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    2c88:	6100 ff3e      	bsr.w 2bc8 <__mulsi3>
	addql	IMM (8), sp
    2c8c:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    2c8e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    2c92:	9280           	sub.l d0,d1
	movel	d1, d0
    2c94:	2001           	move.l d1,d0
	rts
    2c96:	4e75           	rts

00002c98 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    2c98:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    2c9c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    2ca0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2ca2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    2ca4:	6100 ff44      	bsr.w 2bea <__udivsi3>
	addql	IMM (8), sp
    2ca8:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    2caa:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    2cae:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2cb0:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    2cb2:	6100 ff14      	bsr.w 2bc8 <__mulsi3>
	addql	IMM (8), sp
    2cb6:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    2cb8:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    2cbc:	9280           	sub.l d0,d1
	movel	d1, d0
    2cbe:	2001           	move.l d1,d0
	rts
    2cc0:	4e75           	rts

00002cc2 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    2cc2:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    2cc4:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    2cc8:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    2ccc:	2c5f           	movea.l (sp)+,a6
    rts
    2cce:	4e75           	rts

00002cd0 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    2cd0:	16c0           	move.b d0,(a3)+
	rts
    2cd2:	4e75           	rts

00002cd4 <saveregs>:
	...

00002d10 <font2distance>:
    2d10:	0505           	btst d2,d5
    2d12:	0505           	btst d2,d5
    2d14:	0505           	btst d2,d5
    2d16:	0505           	btst d2,d5
    2d18:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    2d1a:	0505           	btst d2,d5
    2d1c:	0505           	btst d2,d5
    2d1e:	0005 0505      	ori.b #5,d5
    2d22:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    2d24:	0505           	btst d2,d5
    2d26:	0505           	btst d2,d5
    2d28:	0505           	btst d2,d5
    2d2a:	0505           	btst d2,d5
    2d2c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    2d2e:	0505           	btst d2,d5
    2d30:	0505           	btst d2,d5
    2d32:	0505           	btst d2,d5
    2d34:	0505           	btst d2,d5
    2d36:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    2d38:	0500           	btst d2,d0
    2d3a:	0505           	btst d2,d5
    2d3c:	0505           	btst d2,d5
    2d3e:	0505           	btst d2,d5
    2d40:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    2d42:	0505           	btst d2,d5
    2d44:	0505           	btst d2,d5
    2d46:	0505           	btst d2,d5
    2d48:	0505           	btst d2,d5
    2d4a:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    2d4c:	0505           	btst d2,d5
    2d4e:	0505           	btst d2,d5
    2d50:	0503           	btst d2,d3
    2d52:	0505           	btst d2,d5
    2d54:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    2d56:	0505           	btst d2,d5
    2d58:	0500           	btst d2,d0
    2d5a:	0505           	btst d2,d5
    2d5c:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    2d60:	0505           	btst d2,d5
    2d62:	0503           	btst d2,d3
    2d64:	0205 0507      	andi.b #7,d5
    2d68:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    2d6a:	0505           	btst d2,d5
    2d6c:	0505           	btst d2,d5
    2d6e:	0505           	btst d2,d5
    2d70:	0505           	btst d2,d5
    2d72:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2d74:	0505           	btst d2,d5
    2d76:	0505           	btst d2,d5
    2d78:	0505           	btst d2,d5
    2d7a:	0505           	btst d2,d5
    2d7c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2d7e:	0505           	btst d2,d5
    2d80:	0505           	btst d2,d5
    2d82:	0505           	btst d2,d5
    2d84:	0505           	btst d2,d5
    2d86:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2d88:	0505           	btst d2,d5
    2d8a:	0505           	btst d2,d5
    2d8c:	0505           	btst d2,d5
    2d8e:	0505           	btst d2,d5
    2d90:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2d92:	0505           	btst d2,d5
    2d94:	0505           	btst d2,d5
    2d96:	0505           	btst d2,d5
    2d98:	0505           	btst d2,d5
    2d9a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2d9c:	0505           	btst d2,d5
    2d9e:	0505           	btst d2,d5
    2da0:	0505           	btst d2,d5
    2da2:	0505           	btst d2,d5
    2da4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2da6:	0505           	btst d2,d5
    2da8:	0505           	btst d2,d5
    2daa:	0505           	btst d2,d5
    2dac:	0505           	btst d2,d5
    2dae:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2db0:	0505           	btst d2,d5
    2db2:	0505           	btst d2,d5
    2db4:	0505           	btst d2,d5
    2db6:	0505           	btst d2,d5
    2db8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2dba:	0505           	btst d2,d5
    2dbc:	0505           	btst d2,d5
    2dbe:	0505           	btst d2,d5
    2dc0:	0505           	btst d2,d5
    2dc2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2dc4:	0505           	btst d2,d5
    2dc6:	0505           	btst d2,d5
    2dc8:	0505           	btst d2,d5
    2dca:	0505           	btst d2,d5
    2dcc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2dce:	0505           	btst d2,d5
    2dd0:	0505           	btst d2,d5
    2dd2:	0505           	btst d2,d5
    2dd4:	0505           	btst d2,d5
    2dd6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2dd8:	0505           	btst d2,d5
    2dda:	0505           	btst d2,d5
    2ddc:	0505           	btst d2,d5
    2dde:	0505           	btst d2,d5
    2de0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2de2:	0505           	btst d2,d5
    2de4:	0505           	btst d2,d5
    2de6:	0505           	btst d2,d5
    2de8:	0505           	btst d2,d5
    2dea:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2dec:	0505           	btst d2,d5
    2dee:	0505           	btst d2,d5
    2df0:	0505           	btst d2,d5
    2df2:	0505           	btst d2,d5
    2df4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2df6:	0505           	btst d2,d5
    2df8:	0505           	btst d2,d5
    2dfa:	0505           	btst d2,d5
    2dfc:	0505           	btst d2,d5
    2dfe:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2e00:	0505           	btst d2,d5
    2e02:	0505           	btst d2,d5
    2e04:	0505           	btst d2,d5
    2e06:	0505           	btst d2,d5
    2e08:	0505           	btst d2,d5

00002e0a <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    2e0a:	16c0           	move.b d0,(a3)+
  RTS
    2e0c:	4e75           	rts

00002e0e <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    2e0e:	48f9 7fff 0000 	movem.l d0-a6,2cd4 <saveregs>
    2e14:	2cd4 
  lea 0xdff000,a5
    2e16:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddbe2a>,a5
  move.l sp@(4),a0  //Fontlocation
    2e1c:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    2e20:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    2e24:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    2e28:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    2e2a:	082d 0006 0002 	btst #6,2(a5)

00002e30 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    2e30:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    2e36:	66f8           	bne.s 2e30 <st2wblit>

00002e38 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    2e38:	7019           	moveq #25,d0
	sub.l d5,d5      
    2e3a:	9a85           	sub.l d5,d5

00002e3c <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    2e3c:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    2e3e:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    2e40:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    2e44:	9dce           	suba.l a6,a6
	move.l d2, a6
    2e46:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    2e48:	ddfc 0000 2d10 	adda.l #11536,a6

	LSL  	#4,d2 	    //Fetch next char
    2e4e:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    2e50:	2842           	movea.l d2,a4


	move.l  #0,d4
    2e52:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    2e54:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    2e56:	3814           	move.w (a4),d4
	swap	d4
    2e58:	4844           	swap d4
	lsr.l	d5, d4
    2e5a:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    2e5c:	8993           	or.l d4,(a3)
	clr.l	d4
    2e5e:	4284           	clr.l d4
	move.w  2(a4), d4
    2e60:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    2e64:	4844           	swap d4
	lsr.l	d5, d4
    2e66:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    2e68:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    2e6c:	4284           	clr.l d4
	move.w  4(a4), d4
    2e6e:	382c 0004      	move.w 4(a4),d4
	swap	d4
    2e72:	4844           	swap d4
	lsr.l	d5, d4
    2e74:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    2e76:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    2e7a:	4284           	clr.l d4
	move.w  6(a4), d4
    2e7c:	382c 0006      	move.w 6(a4),d4
	swap	d4
    2e80:	4844           	swap d4
	lsr.l	d5, d4
    2e82:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    2e84:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    2e88:	4284           	clr.l d4
	move.w  8(a4), d4
    2e8a:	382c 0008      	move.w 8(a4),d4
	swap	d4
    2e8e:	4844           	swap d4
	lsr.l	d5, d4
    2e90:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    2e92:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    2e96:	4284           	clr.l d4
	move.w  10(a4), d4
    2e98:	382c 000a      	move.w 10(a4),d4
	swap	d4
    2e9c:	4844           	swap d4
	lsr.l	d5, d4
    2e9e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    2ea0:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    2ea4:	4284           	clr.l d4
	move.w  12(a4), d4
    2ea6:	382c 000c      	move.w 12(a4),d4
	swap	d4
    2eaa:	4844           	swap d4
	lsr.l	d5, d4
    2eac:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    2eae:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    2eb2:	4284           	clr.l d4
	move.w  14(a4), d4
    2eb4:	382c 000e      	move.w 14(a4),d4
	swap	d4
    2eb8:	4844           	swap d4
	lsr.l	d5, d4
    2eba:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    2ebc:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    2ec0:	4284           	clr.l d4

	add.b   (a6), d5
    2ec2:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    2ec4:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    2ec8:	6500 0006      	bcs.w 2ed0 <noadditionalchar>
	addq.w  #1, a3
    2ecc:	524b           	addq.w #1,a3
	sub.w   #8,d5
    2ece:	5145           	subq.w #8,d5

00002ed0 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    2ed0:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    2ed2:	51c8 ff68      	dbf d0,2e3c <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    2ed6:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    2eda:	51cb ff5c      	dbf d3,2e38 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    2ede:	4cfa 7fff fdf2 	movem.l 2cd4 <saveregs>(pc),d0-a6

	RTS
    2ee4:	4e75           	rts
