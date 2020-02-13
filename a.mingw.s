
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
       6:	4e55 ff8c      	link.w a5,#-116
       a:	48e7 3f3a      	movem.l d2-d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 5612 	move.l a6,5612 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,55ea <hw>
      1e:	0000 55ea 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 2d37 	lea 2d37 <incbin_swfont_end+0xbd>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 55e6 	move.l d0,55e6 <GfxBase>
	if (!GfxBase)
      34:	6700 13b8      	beq.w 13ee <main+0x13e8>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
      3e:	43f9 0000 2d48 	lea 2d48 <incbin_swfont_end+0xce>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 5602 	move.l d0,5602 <DOSBase>
	if (!DOSBase)
      50:	6700 1390      	beq.w 13e2 <main+0x13dc>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 2d54 	pea 2d54 <incbin_swfont_end+0xda>
      5a:	4eb9 0000 1688 	jsr 1688 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 2d70 	move.l #11632,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 55ea 	movea.l 55ea <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 2d80 	move.l #11648,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 18e4 	lea 18e4 <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 560e 	move.l d0,560e <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 55fa 	move.l d0,55fa <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 560a 	move.l d0,560a <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 55ee 	move.l d0,55ee <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 5550 	cmp.l 5550 <ClsSprites>,d0
      d2:	6600 13b8      	bne.w 148c <main+0x1486>
      d6:	206a 0004      	movea.l 4(a2),a0
      da:	b1f9 0000 5554 	cmpa.l 5554 <ClsSprites+0x4>,a0
      e0:	6600 13aa      	bne.w 148c <main+0x1486>
      e4:	202a 0008      	move.l 8(a2),d0
      e8:	b0b9 0000 5558 	cmp.l 5558 <ClsSprites+0x8>,d0
      ee:	6600 139c      	bne.w 148c <main+0x1486>
      f2:	206a 000c      	movea.l 12(a2),a0
      f6:	b1f9 0000 555c 	cmpa.l 555c <ClsSprites+0xc>,a0
      fc:	6600 138e      	bne.w 148c <main+0x1486>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 5560 	cmp.l 5560 <ClsSprites+0x10>,d0
     10a:	6600 1380      	bne.w 148c <main+0x1486>
     10e:	206a 0014      	movea.l 20(a2),a0
     112:	b1f9 0000 5564 	cmpa.l 5564 <ClsSprites+0x14>,a0
     118:	6600 1372      	bne.w 148c <main+0x1486>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 5568 	cmp.l 5568 <ClsSprites+0x18>,d0
     126:	6600 1364      	bne.w 148c <main+0x1486>
     12a:	206a 001c      	movea.l 28(a2),a0
     12e:	b1f9 0000 556c 	cmpa.l 556c <ClsSprites+0x1c>,a0
     134:	6600 1356      	bne.w 148c <main+0x1486>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 5570 	cmp.l 5570 <ClsSprites+0x20>,d0
     142:	6600 1348      	bne.w 148c <main+0x1486>
     146:	206a 0024      	movea.l 36(a2),a0
     14a:	b1f9 0000 5574 	cmpa.l 5574 <ClsSprites+0x24>,a0
     150:	6600 133a      	bne.w 148c <main+0x1486>
     154:	202a 0028      	move.l 40(a2),d0
     158:	b0b9 0000 5578 	cmp.l 5578 <ClsSprites+0x28>,d0
     15e:	6600 132c      	bne.w 148c <main+0x1486>
     162:	206a 002c      	movea.l 44(a2),a0
     166:	b1f9 0000 557c 	cmpa.l 557c <ClsSprites+0x2c>,a0
     16c:	6600 131e      	bne.w 148c <main+0x1486>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 5580 	cmp.l 5580 <ClsSprites+0x30>,d0
     17a:	6600 1310      	bne.w 148c <main+0x1486>
     17e:	206a 0034      	movea.l 52(a2),a0
     182:	b1f9 0000 5584 	cmpa.l 5584 <ClsSprites+0x34>,a0
     188:	6600 1302      	bne.w 148c <main+0x1486>
     18c:	202a 0038      	move.l 56(a2),d0
     190:	b0b9 0000 5588 	cmp.l 5588 <ClsSprites+0x38>,d0
     196:	6600 12f4      	bne.w 148c <main+0x1486>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 558c 	cmpa.l 558c <ClsSprites+0x3c>,a2
     1a4:	6600 12e6      	bne.w 148c <main+0x1486>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 560e 	movea.l 560e <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 5520 	move.l 5520 <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 1286      	bne.w 1440 <main+0x143a>
     1bc:	2039 0000 5524 	move.l 5524 <ClScreen+0x4>,d0
     1c2:	b0a8 0044      	cmp.l 68(a0),d0
     1c6:	6600 1278      	bne.w 1440 <main+0x143a>
     1ca:	2039 0000 5528 	move.l 5528 <ClScreen+0x8>,d0
     1d0:	b0a8 0048      	cmp.l 72(a0),d0
     1d4:	6600 126a      	bne.w 1440 <main+0x143a>
     1d8:	2028 004c      	move.l 76(a0),d0
     1dc:	b0b9 0000 552c 	cmp.l 552c <ClScreen+0xc>,d0
     1e2:	6600 125c      	bne.w 1440 <main+0x143a>
     1e6:	2039 0000 5530 	move.l 5530 <ClScreen+0x10>,d0
     1ec:	b0a8 0050      	cmp.l 80(a0),d0
     1f0:	6600 124e      	bne.w 1440 <main+0x143a>
     1f4:	2028 0054      	move.l 84(a0),d0
     1f8:	b0b9 0000 5534 	cmp.l 5534 <ClScreen+0x14>,d0
     1fe:	6600 1240      	bne.w 1440 <main+0x143a>
     202:	2028 0058      	move.l 88(a0),d0
     206:	b0b9 0000 5538 	cmp.l 5538 <ClScreen+0x18>,d0
     20c:	6600 1232      	bne.w 1440 <main+0x143a>
     210:	2039 0000 553c 	move.l 553c <ClScreen+0x1c>,d0
     216:	b0a8 005c      	cmp.l 92(a0),d0
     21a:	6600 1224      	bne.w 1440 <main+0x143a>
     21e:	2039 0000 5540 	move.l 5540 <ClScreen+0x20>,d0
     224:	b0a8 0060      	cmp.l 96(a0),d0
     228:	6600 1216      	bne.w 1440 <main+0x143a>
     22c:	2039 0000 5544 	move.l 5544 <ClScreen+0x24>,d0
     232:	b0a8 0064      	cmp.l 100(a0),d0
     236:	6600 1208      	bne.w 1440 <main+0x143a>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 5548 	cmp.l 5548 <ClScreen+0x28>,d0
     244:	6600 11fa      	bne.w 1440 <main+0x143a>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 554c 	cmpa.l 554c <ClScreen+0x2c>,a0
     252:	6600 11ec      	bne.w 1440 <main+0x143a>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     256:	23fc 0004 0000 	move.l #262144,55fe <DrawBuffer>
     25c:	0000 55fe 
  ViewBuffer = (ULONG *)0x50000;
     260:	23fc 0005 0000 	move.l #327680,55f2 <ViewBuffer>
     266:	0000 55f2 
  SetBplPointers();
     26a:	45f9 0000 2014 	lea 2014 <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,55fe <DrawBuffer>
     278:	0000 55fe 
     27c:	6700 1134      	beq.w 13b2 <main+0x13ac>
    Write( Output(), 
     280:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 2d83 	move.l #11651,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     29e:	2079 0000 560e 	movea.l 560e <Copperlist1>,a0
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 2dbf 	move.l #11711,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 560e 	movea.l 560e <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 2dfc 	move.l #11772,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 560e 	movea.l 560e <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2028 0078      	move.l 120(a0),d0
     304:	b0b9 0000 5518 	cmp.l 5518 <ClColor>,d0
     30a:	6600 110c      	bne.w 1418 <main+0x1412>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 551c 	cmp.l 551c <ClColor+0x4>,d0
     318:	6600 10fe      	bne.w 1418 <main+0x1412>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 2e5b 	move.l #11867,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	49f9 0000 1e0c 	lea 1e0c <SwapCl>,a4
     348:	4e94           	jsr (a4)
  if( DrawCopper != Copperlist2)
     34a:	2079 0000 55fa 	movea.l 55fa <DrawCopper>,a0
     350:	b1f9 0000 560a 	cmpa.l 560a <Copperlist2>,a0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 2e7e 	move.l #11902,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	47f9 0000 2040 	lea 2040 <PrepareDisplay>,a3
     37c:	4e93           	jsr (a3)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 55fe 	move.l 55fe <DrawBuffer>,d0
     384:	b0b9 0000 5606 	cmp.l 5606 <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 2e94 	move.l #11924,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2079 0000 55fa 	movea.l 55fa <DrawCopper>,a0
     3b0:	b1f9 0000 560e 	cmpa.l 560e <Copperlist1>,a0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 2ecc 	move.l #11980,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e93           	jsr (a3)

  if( ViewBuffer != Bitplane2) 
     3d8:	2039 0000 55f2 	move.l 55f2 <ViewBuffer>,d0
     3de:	b0b9 0000 55f6 	cmp.l 55f6 <Bitplane2>,d0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 2f06 	move.l #12038,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2079 0000 55ee 	movea.l 55ee <ViewCopper>,a0
     40a:	b1f9 0000 560a 	cmpa.l 560a <Copperlist2>,a0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 2f3f 	move.l #12095,d2
     42a:	763a           	moveq #58,d3
     42c:	4eae ffd0      	jsr -48(a6)
	}
	SetInterruptHandler((APTR)interruptHandler);
}

void RunFrame() {
  SwapCl();
     430:	4e94           	jsr (a4)
  SetBplPointers();
     432:	4e92           	jsr (a2)
             "PrepareDisplay: ViewCopper should be set to Copperlist 2.\n", 58);

  RunFrame();
  UWORD *copword = ViewCopper;
     434:	2079 0000 55ee 	movea.l 55ee <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     44c:	b0b9 0000 55f6 	cmp.l 55f6 <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 2f7a 	move.l #12154,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e94           	jsr (a4)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     476:	2079 0000 55ee 	movea.l 55ee <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     48e:	b0b9 0000 5606 	cmp.l 5606 <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 2fc3 	move.l #12227,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e94           	jsr (a4)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4b8:	2079 0000 55ee 	movea.l 55ee <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4d0:	b0b9 0000 55f6 	cmp.l 55f6 <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 300d 	move.l #12301,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	4eb9 0000 217e 	jsr 217e <FreeDisplay>
  TestZoom4Picture();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     506:	47f9 0000 1e32 	lea 1e32 <PrepareDisplayZoom>,a3
     50c:	4e93           	jsr (a3)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     50e:	4878 0010      	pea 10 <main+0xa>
     512:	4879 0000 5550 	pea 5550 <ClsSprites>
     518:	42a7           	clr.l -(sp)
     51a:	2f39 0000 560e 	move.l 560e <Copperlist1>,-(sp)
     520:	49f9 0000 170e 	lea 170e <TestCopperlistBatch>,a4
     526:	4e94           	jsr (a4)
     528:	4fef 0018      	lea 24(sp),sp
     52c:	4a80           	tst.l d0
     52e:	661e           	bne.s 54e <main+0x548>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     530:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     536:	4eae ffc4      	jsr -60(a6)
     53a:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     540:	2200           	move.l d0,d1
     542:	243c 0000 3056 	move.l #12374,d2
     548:	762c           	moveq #44,d3
     54a:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     54e:	4878 000c      	pea c <main+0x6>
     552:	4879 0000 54e8 	pea 54e8 <ClScreenZoom>
     558:	4878 0010      	pea 10 <main+0xa>
     55c:	2f39 0000 560e 	move.l 560e <Copperlist1>,-(sp)
     562:	4e94           	jsr (a4)
     564:	4fef 0010      	lea 16(sp),sp
     568:	4a80           	tst.l d0
     56a:	661e           	bne.s 58a <main+0x584>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     56c:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     572:	4eae ffc4      	jsr -60(a6)
     576:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     57c:	2200           	move.l d0,d1
     57e:	243c 0000 308c 	move.l #12428,d2
     584:	7636           	moveq #54,d3
     586:	4eae ffd0      	jsr -48(a6)
  Zoom_CopyWord( pos4source, pos4dest, shiftright, 1);
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     58a:	2079 0000 55fa 	movea.l 55fa <DrawCopper>,a0
  copword += ZMBPLPTRS+1;
  for(int i=1;i<=2;i++) {
    UWORD highword = ptr >> 16;
    UWORD lowword = ptr & 0xffff;
    *copword = highword;
     590:	317c 0004 0072 	move.w #4,114(a0)
    copword += 2;
    *copword = lowword;
     596:	4268 0076      	clr.w 118(a0)
    *copword = highword;
     59a:	317c 0004 007a 	move.w #4,122(a0)
    *copword = lowword;
     5a0:	317c 2800 007e 	move.w #10240,126(a0)
    copword += 2;
    ptr += 40*256;
  }
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
     5a6:	23fc 0005 0000 	move.l #327680,55fe <DrawBuffer>
     5ac:	0000 55fe 
  ViewBuffer = (ULONG *) tmp;
     5b0:	23fc 0004 0000 	move.l #262144,55f2 <ViewBuffer>
     5b6:	0000 55f2 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5ba:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c0:	4878 001c      	pea 1c <main+0x16>
     5c4:	2f39 0000 560e 	move.l 560e <Copperlist1>,-(sp)
     5ca:	4eb9 0000 16f0 	jsr 16f0 <TestCopperlistPos>
     5d0:	4fef 000c      	lea 12(sp),sp
     5d4:	4a80           	tst.l d0
     5d6:	661e           	bne.s 5f6 <main+0x5f0>
    Write(Output(), 
     5d8:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     5de:	4eae ffc4      	jsr -60(a6)
     5e2:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     5e8:	2200           	move.l d0,d1
     5ea:	243c 0000 2dbf 	move.l #11711,d2
     5f0:	763c           	moveq #60,d3
     5f2:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     5f6:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     5fc:	4878 001d      	pea 1d <main+0x17>
     600:	2f39 0000 560e 	move.l 560e <Copperlist1>,-(sp)
     606:	4eb9 0000 16f0 	jsr 16f0 <TestCopperlistPos>
     60c:	4fef 000c      	lea 12(sp),sp
     610:	4a80           	tst.l d0
     612:	661e           	bne.s 632 <main+0x62c>
    Write(Output(), 
     614:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     61a:	4eae ffc4      	jsr -60(a6)
     61e:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     624:	2200           	move.l d0,d1
     626:	243c 0000 2dfc 	move.l #11772,d2
     62c:	763c           	moveq #60,d3
     62e:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     632:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     638:	4878 001e      	pea 1e <main+0x18>
     63c:	2f39 0000 560e 	move.l 560e <Copperlist1>,-(sp)
     642:	4eb9 0000 16f0 	jsr 16f0 <TestCopperlistPos>
     648:	4fef 000c      	lea 12(sp),sp
     64c:	4a80           	tst.l d0
     64e:	661e           	bne.s 66e <main+0x668>
    Write(Output(), 
     650:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     656:	4eae ffc4      	jsr -60(a6)
     65a:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     660:	2200           	move.l d0,d1
     662:	243c 0000 30c3 	move.l #12483,d2
     668:	763c           	moveq #60,d3
     66a:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     66e:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     674:	4878 001f      	pea 1f <main+0x19>
     678:	2f39 0000 560e 	move.l 560e <Copperlist1>,-(sp)
     67e:	4eb9 0000 16f0 	jsr 16f0 <TestCopperlistPos>
     684:	4fef 000c      	lea 12(sp),sp
     688:	4a80           	tst.l d0
     68a:	661e           	bne.s 6aa <main+0x6a4>
    Write(Output(), 
     68c:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     692:	4eae ffc4      	jsr -60(a6)
     696:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     69c:	2200           	move.l d0,d1
     69e:	243c 0000 3100 	move.l #12544,d2
     6a4:	763c           	moveq #60,d3
     6a6:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6aa:	4878 0002      	pea 2 <_start+0x2>
     6ae:	4879 0000 5518 	pea 5518 <ClColor>
     6b4:	4878 0020      	pea 20 <main+0x1a>
     6b8:	2f39 0000 560e 	move.l 560e <Copperlist1>,-(sp)
     6be:	4e94           	jsr (a4)
     6c0:	4fef 0010      	lea 16(sp),sp
     6c4:	4a80           	tst.l d0
     6c6:	661e           	bne.s 6e6 <main+0x6e0>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6c8:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     6ce:	4eae ffc4      	jsr -60(a6)
     6d2:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     6d8:	2200           	move.l d0,d1
     6da:	243c 0000 2e39 	move.l #11833,d2
     6e0:	7621           	moveq #33,d3
     6e2:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6e6:	7e9c           	moveq #-100,d7
     6e8:	de8d           	add.l a5,d7
     6ea:	4878 0040      	pea 40 <main+0x3a>
     6ee:	4879 0000 347a 	pea 347a <incbin_swfont_end+0x800>
     6f4:	2f07           	move.l d7,-(sp)
     6f6:	4eb9 0000 2236 	jsr 2236 <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     6fc:	4878 0010      	pea 10 <main+0xa>
     700:	2f07           	move.l d7,-(sp)
     702:	4878 0022      	pea 22 <main+0x1c>
     706:	2f39 0000 560e 	move.l 560e <Copperlist1>,-(sp)
     70c:	4e94           	jsr (a4)
     70e:	4fef 001c      	lea 28(sp),sp
     712:	4a80           	tst.l d0
     714:	661e           	bne.s 734 <main+0x72e>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     716:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     71c:	4eae ffc4      	jsr -60(a6)
     720:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     726:	2200           	move.l d0,d1
     728:	243c 0000 313d 	move.l #12605,d2
     72e:	7621           	moveq #33,d3
     730:	4eae ffd0      	jsr -48(a6)

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     734:	2b7c 2d07 fffe 	move.l #755499006,-112(a5)
     73a:	ff90 
     73c:	2b7c 0182 00f0 	move.l #25297136,-108(a5)
     742:	ff94 
     744:	2b7c 0182 0f00 	move.l #25300736,-104(a5)
     74a:	ff98 

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
     74c:	4878 0003      	pea 3 <_start+0x3>
     750:	486d ff90      	pea -112(a5)
     754:	4878 004b      	pea 4b <main+0x45>
     758:	2f39 0000 560e 	move.l 560e <Copperlist1>,-(sp)
     75e:	4e94           	jsr (a4)
     760:	4fef 0010      	lea 16(sp),sp
     764:	4a80           	tst.l d0
     766:	661e           	bne.s 786 <main+0x780>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     768:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     76e:	4eae ffc4      	jsr -60(a6)
     772:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     778:	2200           	move.l d0,d1
     77a:	243c 0000 315f 	move.l #12639,d2
     780:	762c           	moveq #44,d3
     782:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     786:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdd238>
     78a:	4878 2922      	pea 2922 <incbin_swfont_start+0x258>
     78e:	2f39 0000 560e 	move.l 560e <Copperlist1>,-(sp)
     794:	4eb9 0000 16f0 	jsr 16f0 <TestCopperlistPos>
     79a:	4fef 000c      	lea 12(sp),sp
     79e:	4a80           	tst.l d0
     7a0:	661e           	bne.s 7c0 <main+0x7ba>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     7a2:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     7a8:	4eae ffc4      	jsr -60(a6)
     7ac:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     7b2:	2200           	move.l d0,d1
     7b4:	243c 0000 2e5b 	move.l #11867,d2
     7ba:	7622           	moveq #34,d3
     7bc:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7c0:	2f3c 0001 4a00 	move.l #84480,-(sp)
     7c6:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7cc:	4eb9 0000 217e 	jsr 217e <FreeDisplay>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7d2:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
     7d8:	7004           	moveq #4,d0
     7da:	7202           	moveq #2,d1
     7dc:	4eae ff3a      	jsr -198(a6)

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     7e0:	4e93           	jsr (a3)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7e2:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
     7e8:	203c 0000 c800 	move.l #51200,d0
     7ee:	7202           	moveq #2,d1
     7f0:	4eae ff3a      	jsr -198(a6)
     7f4:	2440           	movea.l d0,a2
     7f6:	23c0 0000 55d0 	move.l d0,55d0 <Zoom_Source>
  if( Zoom_Source == 0) {
     7fc:	508f           	addq.l #8,sp
     7fe:	6700 0d28      	beq.w 1528 <main+0x1522>
    return;
  }

  
  UWORD *tstsource = Zoom_Source;
  *tstsource++ = 0x0000;
     802:	2040           	movea.l d0,a0
     804:	4258           	clr.w (a0)+
     806:	2408           	move.l a0,d2
  *tstsource = 0x0080;
     808:	357c 0080 0002 	move.w #128,2(a2)
  tstsource += ZMLINESIZE/2-1;
  *tstsource = 0x1000;
     80e:	357c 1000 002c 	move.w #4096,44(a2)
  tstsource++;
  *tstsource = 0x8e88;
     814:	357c 8e88 002e 	move.w #-29048,46(a2)
  tstsource += ZMLINESIZE/2-1;

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
  *tstsource++ = 0x0000;
     81a:	426a 15d4      	clr.w 5588(a2)
  *tstsource = 0x00ff;
     81e:	357c 00ff 15d6 	move.w #255,5590(a2)

  Zoom_ZoomBlitLeft( Zoom_Source+1, (UWORD *)DrawBuffer, 8, 128);
     824:	2639 0000 55fe 	move.l 55fe <DrawBuffer>,d3
  WaitBlit();
     82a:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
     830:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     834:	2079 0000 55ea 	movea.l 55ea <hw>,a0
     83a:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     840:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltafwm = 0xffff;
     846:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     84c:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     852:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     858:	317c 0028 0062 	move.w #40,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     85e:	317c ff00 0070 	move.w #-256,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     864:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = srca;
     86a:	2142 0050      	move.l d2,80(a0)
  hw->bltbpt = srcb;
     86e:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = destination;
     872:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
     876:	317c 2002 0058 	move.w #8194,88(a0)
  WaitBlit();
     87c:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
     882:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     886:	2479 0000 55fe 	movea.l 55fe <DrawBuffer>,a2
  if( *destination != 0x0180) {
     88c:	0c6a 0180 0002 	cmpi.w #384,2(a2)
     892:	671e           	beq.s 8b2 <main+0x8ac>
    Write(  Output(), "Zoomblitleft - First row wrong.\n",32);
     894:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     89a:	4eae ffc4      	jsr -60(a6)
     89e:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     8a4:	2200           	move.l d0,d1
     8a6:	243c 0000 31c4 	move.l #12740,d2
     8ac:	7620           	moveq #32,d3
     8ae:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8b2:	0c6a 1d88 002e 	cmpi.w #7560,46(a2)
     8b8:	671e           	beq.s 8d8 <main+0x8d2>
    Write(  Output(), "Zoomblitleft: Second row wrong.\n",32);
     8ba:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     8c0:	4eae ffc4      	jsr -60(a6)
     8c4:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     8ca:	2200           	move.l d0,d1
     8cc:	243c 0000 31e5 	move.l #12773,d2
     8d2:	7620           	moveq #32,d3
     8d4:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     8d8:	2079 0000 55fe 	movea.l 55fe <DrawBuffer>,a0
     8de:	0c68 01ff 15d6 	cmpi.w #511,5590(a0)
     8e4:	671e           	beq.s 904 <main+0x8fe>
    Write(  Output(), "Zoomblitleft: Last row wrong.\n",40);
     8e6:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     8ec:	4eae ffc4      	jsr -60(a6)
     8f0:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     8f6:	2200           	move.l d0,d1
     8f8:	243c 0000 3206 	move.l #12806,d2
     8fe:	7628           	moveq #40,d3
     900:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     904:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
     90a:	2279 0000 55d0 	movea.l 55d0 <Zoom_Source>,a1
     910:	203c 0000 c800 	move.l #51200,d0
     916:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     91a:	2f3c 0001 4a00 	move.l #84480,-(sp)
     920:	2f3c 0000 a48c 	move.l #42124,-(sp)
     926:	4eb9 0000 217e 	jsr 217e <FreeDisplay>
     92c:	508f           	addq.l #8,sp
}

void TestCopyColumnOfZoom() {

  PrepareDisplayZoom();
     92e:	4e93           	jsr (a3)

  UWORD *destination = (UWORD *)DrawBuffer;
     930:	2079 0000 55fe 	movea.l 55fe <DrawBuffer>,a0
  *destination= 0x0000;
     936:	4250           	clr.w (a0)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     938:	317c 000f 002c 	move.w #15,44(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     93e:	317c 000f 41d4 	move.w #15,16852(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     944:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
     94a:	203c 0000 c800 	move.l #51200,d0
     950:	7202           	moveq #2,d1
     952:	4eae ff3a      	jsr -198(a6)
     956:	2440           	movea.l d0,a2
     958:	23c0 0000 55d0 	move.l d0,55d0 <Zoom_Source>
  if( Zoom_Source == 0) {
     95e:	6700 0ba6      	beq.w 1506 <main+0x1500>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }

  UWORD *tstsource = Zoom_Source;
  *tstsource = 0xffff;
     962:	34bc ffff      	move.w #-1,(a2)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     966:	357c ffff 002c 	move.w #-1,44(a2)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0xc000;
     96c:	357c c000 41d4 	move.w #-16384,16852(a2)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 1, 1);
     972:	2439 0000 55fe 	move.l 55fe <DrawBuffer>,d2
  WaitBlit();
     978:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
     97e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     982:	2079 0000 55ea 	movea.l 55ea <hw>,a0
     988:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     98e:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     994:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     99a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     9a0:	317c 002a 0064 	move.w #42,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     9a6:	317c 002a 0062 	move.w #42,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     9ac:	317c 002a 0066 	move.w #42,102(a0)
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
     9ca:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
     9d0:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     9d4:	2479 0000 55fe 	movea.l 55fe <DrawBuffer>,a2
  if( *destination != 0x4000)
     9da:	0c52 4000      	cmpi.w #16384,(a2)
     9de:	671e           	beq.s 9fe <main+0x9f8>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     9e0:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     9e6:	4eae ffc4      	jsr -60(a6)
     9ea:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     9f0:	2200           	move.l d0,d1
     9f2:	243c 0000 3225 	move.l #12837,d2
     9f8:	7629           	moveq #41,d3
     9fa:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x400f)
     9fe:	0c6a 400f 002c 	cmpi.w #16399,44(a2)
     a04:	671e           	beq.s a24 <main+0xa1e>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     a06:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     a0c:	4eae ffc4      	jsr -60(a6)
     a10:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     a16:	2200           	move.l d0,d1
     a18:	243c 0000 324f 	move.l #12879,d2
     a1e:	762a           	moveq #42,d3
     a20:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     a24:	2479 0000 55fe 	movea.l 55fe <DrawBuffer>,a2
     a2a:	0c6a 400f 41d4 	cmpi.w #16399,16852(a2)
     a30:	6724           	beq.s a56 <main+0xa50>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     a32:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     a38:	4eae ffc4      	jsr -60(a6)
     a3c:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     a42:	2200           	move.l d0,d1
     a44:	243c 0000 327a 	move.l #12922,d2
     a4a:	7628           	moveq #40,d3
     a4c:	4eae ffd0      	jsr -48(a6)
     a50:	2479 0000 55fe 	movea.l 55fe <DrawBuffer>,a2

  destination = (UWORD *)DrawBuffer;
  *destination= 0x0000;
     a56:	4252           	clr.w (a2)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     a58:	357c 000f 002c 	move.w #15,44(a2)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     a5e:	357c 000f 41d4 	move.w #15,16852(a2)

  tstsource = Zoom_Source;
     a64:	2679 0000 55d0 	movea.l 55d0 <Zoom_Source>,a3
  *tstsource = 0xffff;
     a6a:	36bc ffff      	move.w #-1,(a3)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     a6e:	377c ffff 002c 	move.w #-1,44(a3)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0x8000;
     a74:	377c 8000 41d4 	move.w #-32768,16852(a3)
  WaitBlit();
     a7a:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
     a80:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     a84:	2079 0000 55ea 	movea.l 55ea <hw>,a0
     a8a:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     a90:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     a96:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     a9c:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     aa2:	317c 002a 0064 	move.w #42,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     aa8:	317c 002a 0062 	move.w #42,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     aae:	317c 002a 0066 	move.w #42,102(a0)
  hw->bltcdat = bltmask;
     ab4:	317c 8000 0070 	move.w #-32768,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     aba:	214b 0050      	move.l a3,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     abe:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     ac2:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     ac6:	317c 6001 0058 	move.w #24577,88(a0)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 0, 0);
  
  WaitBlit();
     acc:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
     ad2:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     ad6:	2479 0000 55fe 	movea.l 55fe <DrawBuffer>,a2
  if( *destination != 0x8000)
     adc:	0c52 8000      	cmpi.w #-32768,(a2)
     ae0:	671e           	beq.s b00 <main+0xafa>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     ae2:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     ae8:	4eae ffc4      	jsr -60(a6)
     aec:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     af2:	2200           	move.l d0,d1
     af4:	243c 0000 32a3 	move.l #12963,d2
     afa:	7628           	moveq #40,d3
     afc:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x800f)
     b00:	0c6a 800f 002c 	cmpi.w #-32753,44(a2)
     b06:	671e           	beq.s b26 <main+0xb20>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     b08:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     b0e:	4eae ffc4      	jsr -60(a6)
     b12:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     b18:	2200           	move.l d0,d1
     b1a:	243c 0000 32cc 	move.l #13004,d2
     b20:	7629           	moveq #41,d3
     b22:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     b26:	2079 0000 55fe 	movea.l 55fe <DrawBuffer>,a0
     b2c:	0c68 800f 41d4 	cmpi.w #-32753,16852(a0)
     b32:	671e           	beq.s b52 <main+0xb4c>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     b34:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     b3a:	4eae ffc4      	jsr -60(a6)
     b3e:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     b44:	2200           	move.l d0,d1
     b46:	243c 0000 32f6 	move.l #13046,d2
     b4c:	7627           	moveq #39,d3
     b4e:	4eae ffd0      	jsr -48(a6)

  FreeMem( Zoom_Source, 40*256*5);
     b52:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
     b58:	2279 0000 55d0 	movea.l 55d0 <Zoom_Source>,a1
     b5e:	203c 0000 c800 	move.l #51200,d0
     b64:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     b68:	2f3c 0001 4a00 	move.l #84480,-(sp)
     b6e:	2f3c 0000 a48c 	move.l #42124,-(sp)
     b74:	4eb9 0000 217e 	jsr 217e <FreeDisplay>
     b7a:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     b7c:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
     b82:	203c 0000 0528 	move.l #1320,d0
     b88:	7202           	moveq #2,d1
     b8a:	4eae ff3a      	jsr -198(a6)
     b8e:	2440           	movea.l d0,a2
  if( source == 0) {
     b90:	4a80           	tst.l d0
     b92:	6700 091a      	beq.w 14ae <main+0x14a8>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     b96:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
     b9c:	203c 0000 0528 	move.l #1320,d0
     ba2:	7202           	moveq #2,d1
     ba4:	4eae ff3a      	jsr -198(a6)
     ba8:	2640           	movea.l d0,a3
  if( destination == 0) {
     baa:	4a80           	tst.l d0
     bac:	6700 0900      	beq.w 14ae <main+0x14a8>
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
     bc2:	426a 002c      	clr.w 44(a2)
    *tmp++ = 0x5555;
     bc6:	357c 5555 002e 	move.w #21845,46(a2)
    *tmp++ = 0x5555;
     bcc:	357c 5555 0030 	move.w #21845,48(a2)
    *tmp = 0;
     bd2:	426a 0032      	clr.w 50(a2)
    *tmp++ = 0;
     bd6:	426a 0058      	clr.w 88(a2)
    *tmp++ = 0xaaaa;
     bda:	357c aaaa 005a 	move.w #-21846,90(a2)
    *tmp++ = 0xaaaa;
     be0:	357c aaaa 005c 	move.w #-21846,92(a2)
    *tmp = 0;
     be6:	426a 005e      	clr.w 94(a2)
    *tmp++ = 0;
     bea:	426a 0084      	clr.w 132(a2)
    *tmp++ = 0x5555;
     bee:	357c 5555 0086 	move.w #21845,134(a2)
    *tmp++ = 0x5555;
     bf4:	357c 5555 0088 	move.w #21845,136(a2)
    *tmp = 0;
     bfa:	426a 008a      	clr.w 138(a2)
    *tmp++ = 0;
     bfe:	426a 00b0      	clr.w 176(a2)
    *tmp++ = 0xaaaa;
     c02:	357c aaaa 00b2 	move.w #-21846,178(a2)
    *tmp++ = 0xaaaa;
     c08:	357c aaaa 00b4 	move.w #-21846,180(a2)
    *tmp = 0;
     c0e:	426a 00b6      	clr.w 182(a2)
    *tmp++ = 0;
     c12:	426a 00dc      	clr.w 220(a2)
    *tmp++ = 0x5555;
     c16:	357c 5555 00de 	move.w #21845,222(a2)
    *tmp++ = 0x5555;
     c1c:	357c 5555 00e0 	move.w #21845,224(a2)
    *tmp = 0;
     c22:	426a 00e2      	clr.w 226(a2)
    *tmp++ = 0;
     c26:	426a 0108      	clr.w 264(a2)
    *tmp++ = 0xaaaa;
     c2a:	357c aaaa 010a 	move.w #-21846,266(a2)
    *tmp++ = 0xaaaa;
     c30:	357c aaaa 010c 	move.w #-21846,268(a2)
    *tmp = 0;
     c36:	426a 010e      	clr.w 270(a2)
    *tmp++ = 0;
     c3a:	426a 0134      	clr.w 308(a2)
    *tmp++ = 0x5555;
     c3e:	357c 5555 0136 	move.w #21845,310(a2)
    *tmp++ = 0x5555;
     c44:	357c 5555 0138 	move.w #21845,312(a2)
    *tmp = 0;
     c4a:	426a 013a      	clr.w 314(a2)
    *tmp++ = 0;
     c4e:	426a 0160      	clr.w 352(a2)
    *tmp++ = 0xaaaa;
     c52:	357c aaaa 0162 	move.w #-21846,354(a2)
    *tmp++ = 0xaaaa;
     c58:	357c aaaa 0164 	move.w #-21846,356(a2)
    *tmp = 0;
     c5e:	426a 0166      	clr.w 358(a2)
    *tmp++ = 0;
     c62:	426a 018c      	clr.w 396(a2)
    *tmp++ = 0x5555;
     c66:	357c 5555 018e 	move.w #21845,398(a2)
    *tmp++ = 0x5555;
     c6c:	357c 5555 0190 	move.w #21845,400(a2)
    *tmp = 0;
     c72:	426a 0192      	clr.w 402(a2)
    *tmp++ = 0;
     c76:	426a 01b8      	clr.w 440(a2)
    *tmp++ = 0xaaaa;
     c7a:	357c aaaa 01ba 	move.w #-21846,442(a2)
    *tmp++ = 0xaaaa;
     c80:	357c aaaa 01bc 	move.w #-21846,444(a2)
    *tmp = 0;
     c86:	426a 01be      	clr.w 446(a2)
    *tmp++ = 0;
     c8a:	426a 01e4      	clr.w 484(a2)
    *tmp++ = 0x5555;
     c8e:	357c 5555 01e6 	move.w #21845,486(a2)
    *tmp++ = 0x5555;
     c94:	357c 5555 01e8 	move.w #21845,488(a2)
    *tmp = 0;
     c9a:	426a 01ea      	clr.w 490(a2)
    *tmp++ = 0;
     c9e:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0xaaaa;
     ca2:	357c aaaa 0212 	move.w #-21846,530(a2)
    *tmp++ = 0xaaaa;
     ca8:	357c aaaa 0214 	move.w #-21846,532(a2)
    *tmp = 0;
     cae:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
     cb2:	426a 023c      	clr.w 572(a2)
    *tmp++ = 0x5555;
     cb6:	357c 5555 023e 	move.w #21845,574(a2)
    *tmp++ = 0x5555;
     cbc:	357c 5555 0240 	move.w #21845,576(a2)
    *tmp = 0;
     cc2:	426a 0242      	clr.w 578(a2)
    *tmp++ = 0;
     cc6:	426a 0268      	clr.w 616(a2)
    *tmp++ = 0xaaaa;
     cca:	357c aaaa 026a 	move.w #-21846,618(a2)
    *tmp++ = 0xaaaa;
     cd0:	357c aaaa 026c 	move.w #-21846,620(a2)
    *tmp = 0;
     cd6:	426a 026e      	clr.w 622(a2)
    *tmp++ = 0;
     cda:	426a 0294      	clr.w 660(a2)
    *tmp++ = 0x5555;
     cde:	357c 5555 0296 	move.w #21845,662(a2)
    *tmp++ = 0x5555;
     ce4:	357c 5555 0298 	move.w #21845,664(a2)
    *tmp = 0;
     cea:	426a 029a      	clr.w 666(a2)
    tmp += ZMLINESIZE/2-3;
     cee:	4878 0528      	pea 528 <main+0x522>
     cf2:	42a7           	clr.l -(sp)
     cf4:	2f00           	move.l d0,-(sp)
     cf6:	4eb9 0000 22c8 	jsr 22c8 <memset>
  WaitBlit();
     cfc:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
     d02:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     d06:	2079 0000 55ea 	movea.l 55ea <hw>,a0
     d0c:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     d12:	317c 39f0 0040 	move.w #14832,64(a0)
  hw->bltafwm = 0xffff;
     d18:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     d1e:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     d24:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     d2a:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = (UWORD *) source;
     d30:	200a           	move.l a2,d0
     d32:	5480           	addq.l #2,d0
     d34:	2140 0050      	move.l d0,80(a0)
  hw->bltdpt = (UWORD *) destination;
     d38:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
     d3c:	317c 0402 0058 	move.w #1026,88(a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    *tmp++ = 0;
  }

  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 3, 16);
  WaitBlit();
     d42:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
     d48:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     d4c:	4fef 000c      	lea 12(sp),sp
     d50:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
     d56:	671e           	beq.s d76 <main+0xd70>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     d58:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     d5e:	4eae ffc4      	jsr -60(a6)
     d62:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     d68:	2200           	move.l d0,d1
     d6a:	243c 0000 3354 	move.l #13140,d2
     d70:	761f           	moveq #31,d3
     d72:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     d76:	0c6b aaaa 002e 	cmpi.w #-21846,46(a3)
     d7c:	671e           	beq.s d9c <main+0xd96>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     d7e:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     d84:	4eae ffc4      	jsr -60(a6)
     d88:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     d8e:	2200           	move.l d0,d1
     d90:	243c 0000 3374 	move.l #13172,d2
     d96:	7620           	moveq #32,d3
     d98:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     d9c:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
     da2:	224a           	movea.l a2,a1
     da4:	203c 0000 0528 	move.l #1320,d0
     daa:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     dae:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
     db4:	224b           	movea.l a3,a1
     db6:	203c 0000 0528 	move.l #1320,d0
     dbc:	4eae ff2e      	jsr -210(a6)
5    5    5    2    a    a    a    a    9    5    5    5    5    8    a    a
abcd efgh ijkl 1234 5678 9abc defg hijk l123 4567 89ab cdef ghij kl12 3456 789a
1010 1010 1010 0101 0101 0101 0101 0101 0010 1010 1010 1010 1010 1001 0101 0101
a    a    a    5    5    5    5    5    2    a    a    a    a    9    5    5*/ 
void TestZoom4Picture() {
  UWORD *source =AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dc0:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
     dc6:	203c 0000 3300 	move.l #13056,d0
     dcc:	7202           	moveq #2,d1
     dce:	4eae ff3a      	jsr -198(a6)
     dd2:	2400           	move.l d0,d2
  if( source == 0) {
     dd4:	6700 070e      	beq.w 14e4 <main+0x14de>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dd8:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
     dde:	203c 0000 3300 	move.l #13056,d0
     de4:	7202           	moveq #2,d1
     de6:	4eae ff3a      	jsr -198(a6)
     dea:	2c00           	move.l d0,d6
  if( destination == 0) {
     dec:	6700 0786      	beq.w 1574 <main+0x156e>
     df0:	2002           	move.l d2,d0
     df2:	0680 0000 2ec0 	addi.l #11968,d0
     df8:	2042           	movea.l d2,a0
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
     dfa:	20bc 5555 5555 	move.l #1431655765,(a0)
     e00:	217c 5555 5555 	move.l #1431655765,4(a0)
     e06:	0004 
     e08:	217c 5555 5555 	move.l #1431655765,8(a0)
     e0e:	0008 
     e10:	217c 5555 5555 	move.l #1431655765,12(a0)
     e16:	000c 
     e18:	217c 5555 5555 	move.l #1431655765,16(a0)
     e1e:	0010 
     e20:	217c 5555 5555 	move.l #1431655765,20(a0)
     e26:	0014 
     e28:	217c 5555 5555 	move.l #1431655765,24(a0)
     e2e:	0018 
     e30:	217c 5555 5555 	move.l #1431655765,28(a0)
     e36:	001c 
     e38:	217c 5555 5555 	move.l #1431655765,32(a0)
     e3e:	0020 
     e40:	217c 5555 5555 	move.l #1431655765,36(a0)
     e46:	0024 
     e48:	217c 5555 5555 	move.l #1431655765,40(a0)
     e4e:	0028 
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
     e50:	217c aaaa aaaa 	move.l #-1431655766,44(a0)
     e56:	002c 
     e58:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     e5e:	0030 
     e60:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     e66:	0034 
     e68:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     e6e:	0038 
     e70:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     e76:	003c 
     e78:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     e7e:	0040 
     e80:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     e86:	0044 
     e88:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     e8e:	0048 
     e90:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     e96:	004c 
     e98:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     e9e:	0050 
     ea0:	41e8 0058      	lea 88(a0),a0
     ea4:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     eaa:	fffc 
  for(int i=0;i<128+8;i++) {
     eac:	b088           	cmp.l a0,d0
     eae:	6600 ff4a      	bne.w dfa <main+0xdf4>
  UWORD *pos4source = source+ZMLINESIZE/2-2+ZMLINESIZE/2*8;
     eb2:	2602           	move.l d2,d3
     eb4:	0683 0000 0188 	addi.l #392,d3
  WaitBlit();
     eba:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
     ec0:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     ec4:	2079 0000 55ea 	movea.l 55ea <hw>,a0
     eca:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     ed0:	317c 79f0 0040 	move.w #31216,64(a0)
  hw->bltafwm = 0xffff;
     ed6:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     edc:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     ee2:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     ee8:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = (UWORD *) source;
     eee:	2143 0050      	move.l d3,80(a0)
  hw->bltdpt = (UWORD *) destination;
     ef2:	7028           	moveq #40,d0
     ef4:	d086           	add.l d6,d0
     ef6:	2140 0054      	move.l d0,84(a0)
  hw->bltsize = height*64+2;
     efa:	317c 0402 0058 	move.w #1026,88(a0)
  pos4source += ZMLINESIZE/2*16;
     f00:	0682 0000 0448 	addi.l #1096,d2
  WaitBlit();
     f06:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
     f0c:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     f10:	2079 0000 55ea 	movea.l 55ea <hw>,a0
     f16:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     f1c:	317c 79f0 0040 	move.w #31216,64(a0)
  hw->bltafwm = 0xffff;
     f22:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     f28:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     f2e:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     f34:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = (UWORD *) source;
     f3a:	2142 0050      	move.l d2,80(a0)
  hw->bltdpt = (UWORD *) destination;
     f3e:	2006           	move.l d6,d0
     f40:	0680 0000 02e8 	addi.l #744,d0
     f46:	2140 0054      	move.l d0,84(a0)
  hw->bltsize = height*64+2;
     f4a:	317c 0042 0058 	move.w #66,88(a0)
  }
  
  Zoom_ZoomIntoPicture( source, destination);
  WaitBlit();
     f50:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
     f56:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+ZMLINESIZE/2-1; 
     f5a:	7a2a           	moveq #42,d5
     f5c:	da86           	add.l d6,d5
  UWORD *valsupposed = destline+ZMLINESIZE/2-1;
  for(int i=0;i<1;i++) {
     f5e:	3439 0000 54e6 	move.w 54e6 <destline+0x2a>,d2
    for(int i2=0;i2<16;i2+=2) {
     f64:	7800           	moveq #0,d4
  }
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
  char str[ 100] = { 0 };
     f66:	4878 0064      	pea 64 <main+0x5e>
     f6a:	42a7           	clr.l -(sp)
     f6c:	2f07           	move.l d7,-(sp)
     f6e:	4eb9 0000 22c8 	jsr 22c8 <memset>
     f74:	3b44 ff8e      	move.w d4,-114(a5)
  UWORD data[2];
  data[0] = numberofline;
     f78:	3b44 ff90      	move.w d4,-112(a5)

  if( ( (*testpattern++ ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
     f7c:	2045           	movea.l d5,a0
     f7e:	3010           	move.w (a0),d0
     f80:	b142           	eor.w d0,d2
     f82:	0242 ff00      	andi.w #-256,d2
     f86:	4fef 000c      	lea 12(sp),sp
     f8a:	6736           	beq.s fc2 <main+0xfbc>
    RawDoFmt( "TestZoom4Picture: Word 0 Row %d wrong.\n", data, PutChar, str);
     f8c:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
     f92:	41f9 0000 340e 	lea 340e <incbin_swfont_end+0x794>,a0
     f98:	43ed ff90      	lea -112(a5),a1
     f9c:	45f9 0000 24b4 	lea 24b4 <PutChar>,a2
     fa2:	2647           	movea.l d7,a3
     fa4:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
     fa8:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     fae:	4eae ffc4      	jsr -60(a6)
     fb2:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
     fb8:	2200           	move.l d0,d1
     fba:	2407           	move.l d7,d2
     fbc:	7664           	moveq #100,d3
     fbe:	4eae ffd0      	jsr -48(a6)
      *bp = 0;
     fc2:	4278 0200      	clr.w 200 <main+0x1fa>
  char str[ 100] = { 0 };
     fc6:	4878 0064      	pea 64 <main+0x5e>
     fca:	42a7           	clr.l -(sp)
     fcc:	2f07           	move.l d7,-(sp)
     fce:	4eb9 0000 22c8 	jsr 22c8 <memset>
  data[0] = numberofline;
     fd4:	302d ff8e      	move.w -114(a5),d0
     fd8:	5240           	addq.w #1,d0
     fda:	3b40 ff90      	move.w d0,-112(a5)
  if( ( (*testpattern++ ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
     fde:	3439 0000 54e6 	move.w 54e6 <destline+0x2a>,d2
     fe4:	2045           	movea.l d5,a0
     fe6:	3028 002c      	move.w 44(a0),d0
     fea:	b540           	eor.w d2,d0
     fec:	4640           	not.w d0
     fee:	0240 ff00      	andi.w #-256,d0
     ff2:	4fef 000c      	lea 12(sp),sp
     ff6:	673c           	beq.s 1034 <main+0x102e>
    RawDoFmt( "TestZoom4Picture: Word 0 Row %d wrong.\n", data, PutChar, str);
     ff8:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
     ffe:	41f9 0000 340e 	lea 340e <incbin_swfont_end+0x794>,a0
    1004:	43ed ff90      	lea -112(a5),a1
    1008:	45f9 0000 24b4 	lea 24b4 <PutChar>,a2
    100e:	2647           	movea.l d7,a3
    1010:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1014:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    101a:	4eae ffc4      	jsr -60(a6)
    101e:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1024:	2200           	move.l d0,d1
    1026:	2407           	move.l d7,d2
    1028:	7664           	moveq #100,d3
    102a:	4eae ffd0      	jsr -48(a6)
    102e:	3439 0000 54e6 	move.w 54e6 <destline+0x2a>,d2
      valactual += ZMLINESIZE/2;
    1034:	7058           	moveq #88,d0
    1036:	da80           	add.l d0,d5
    for(int i2=0;i2<16;i2+=2) {
    1038:	5484           	addq.l #2,d4
    103a:	7010           	moveq #16,d0
    103c:	b084           	cmp.l d4,d0
    103e:	6600 ff26      	bne.w f66 <main+0xf60>
  char str[ 100] = { 0 };
    1042:	4878 0064      	pea 64 <main+0x5e>
    1046:	42a7           	clr.l -(sp)
    1048:	2f07           	move.l d7,-(sp)
    104a:	4eb9 0000 22c8 	jsr 22c8 <memset>
  data[0] = numberofline;
    1050:	3b7c 0010 ff90 	move.w #16,-112(a5)
  if( ( (*testpattern++ ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1056:	2046           	movea.l d6,a0
    1058:	3c28 02ea      	move.w 746(a0),d6
    105c:	bd42           	eor.w d6,d2
    105e:	0242 ff00      	andi.w #-256,d2
    1062:	4fef 000c      	lea 12(sp),sp
    1066:	6736           	beq.s 109e <main+0x1098>
    RawDoFmt( "TestZoom4Picture: Word 0 Row %d wrong.\n", data, PutChar, str);
    1068:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    106e:	41f9 0000 340e 	lea 340e <incbin_swfont_end+0x794>,a0
    1074:	43ed ff90      	lea -112(a5),a1
    1078:	45f9 0000 24b4 	lea 24b4 <PutChar>,a2
    107e:	2647           	movea.l d7,a3
    1080:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1084:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    108a:	4eae ffc4      	jsr -60(a6)
    108e:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1094:	2200           	move.l d0,d1
    1096:	2407           	move.l d7,d2
    1098:	7664           	moveq #100,d3
    109a:	4eae ffd0      	jsr -48(a6)
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
    109e:	4eb9 0000 2040 	jsr 2040 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    10a4:	4878 0010      	pea 10 <main+0xa>
    10a8:	4879 0000 5550 	pea 5550 <ClsSprites>
    10ae:	42a7           	clr.l -(sp)
    10b0:	2f39 0000 560e 	move.l 560e <Copperlist1>,-(sp)
    10b6:	4e94           	jsr (a4)
    10b8:	4fef 0010      	lea 16(sp),sp
    10bc:	4a80           	tst.l d0
    10be:	661e           	bne.s 10de <main+0x10d8>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    10c0:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    10c6:	4eae ffc4      	jsr -60(a6)
    10ca:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    10d0:	2200           	move.l d0,d1
    10d2:	243c 0000 3056 	move.l #12374,d2
    10d8:	762c           	moveq #44,d3
    10da:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    10de:	4878 000c      	pea c <main+0x6>
    10e2:	4879 0000 5520 	pea 5520 <ClScreen>
    10e8:	4878 0010      	pea 10 <main+0xa>
    10ec:	2f39 0000 560e 	move.l 560e <Copperlist1>,-(sp)
    10f2:	4e94           	jsr (a4)
    10f4:	4fef 0010      	lea 16(sp),sp
    10f8:	4a80           	tst.l d0
    10fa:	661e           	bne.s 111a <main+0x1114>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    10fc:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1102:	4eae ffc4      	jsr -60(a6)
    1106:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    110c:	2200           	move.l d0,d1
    110e:	243c 0000 308c 	move.l #12428,d2
    1114:	7636           	moveq #54,d3
    1116:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    111a:	4878 0002      	pea 2 <_start+0x2>
    111e:	4879 0000 5518 	pea 5518 <ClColor>
    1124:	4878 001e      	pea 1e <main+0x18>
    1128:	2f39 0000 560e 	move.l 560e <Copperlist1>,-(sp)
    112e:	4e94           	jsr (a4)
    1130:	4fef 0010      	lea 16(sp),sp
    1134:	4a80           	tst.l d0
    1136:	661e           	bne.s 1156 <main+0x1150>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1138:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    113e:	4eae ffc4      	jsr -60(a6)
    1142:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1148:	2200           	move.l d0,d1
    114a:	243c 0000 2e39 	move.l #11833,d2
    1150:	7621           	moveq #33,d3
    1152:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    1156:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdd238>
    115a:	4878 0020      	pea 20 <main+0x1a>
    115e:	2f39 0000 560e 	move.l 560e <Copperlist1>,-(sp)
    1164:	4eb9 0000 16f0 	jsr 16f0 <TestCopperlistPos>
    116a:	4fef 000c      	lea 12(sp),sp
    116e:	4a80           	tst.l d0
    1170:	661e           	bne.s 1190 <main+0x118a>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    1172:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1178:	4eae ffc4      	jsr -60(a6)
    117c:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1182:	2200           	move.l d0,d1
    1184:	243c 0000 2e5b 	move.l #11867,d2
    118a:	7622           	moveq #34,d3
    118c:	4eae ffd0      	jsr -48(a6)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    1190:	2479 0000 55fe 	movea.l 55fe <DrawBuffer>,a2
    1196:	4879 0000 3436 	pea 3436 <incbin_swfont_end+0x7bc>
    119c:	2f0a           	move.l a2,-(sp)
    119e:	4eb9 0000 1598 	jsr 1598 <WriteFont.constprop.3>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    11a4:	508f           	addq.l #8,sp
    11a6:	0c52 ff00      	cmpi.w #-256,(a2)
    11aa:	671e           	beq.s 11ca <main+0x11c4>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    11ac:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    11b2:	4eae ffc4      	jsr -60(a6)
    11b6:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    11bc:	2200           	move.l d0,d1
    11be:	243c 0000 3447 	move.l #13383,d2
    11c4:	7631           	moveq #49,d3
    11c6:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    11ca:	2f3c 0000 c800 	move.l #51200,-(sp)
    11d0:	4878 0084      	pea 84 <main+0x7e>
    11d4:	4eb9 0000 217e 	jsr 217e <FreeDisplay>
  RunTests();
	Delay(50);
    11da:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    11e0:	7232           	moveq #50,d1
    11e2:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    11e6:	247c 00f0 ff60 	movea.l #15794016,a2
    11ec:	508f           	addq.l #8,sp
    11ee:	4a92           	tst.l (a2)
    11f0:	6718           	beq.s 120a <main+0x1204>
    11f2:	4878 0001      	pea 1 <_start+0x1>
    11f6:	47f9 0000 15e6 	lea 15e6 <warpmode.part.0>,a3
    11fc:	4e93           	jsr (a3)
    11fe:	588f           	addq.l #4,sp
    1200:	4a92           	tst.l (a2)
    1202:	6706           	beq.s 120a <main+0x1204>
    1204:	42a7           	clr.l -(sp)
    1206:	4e93           	jsr (a3)
    1208:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    120a:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
    1210:	23ee 0022 0000 	move.l 34(a6),55d4 <ActiView>
    1216:	55d4 
	OwnBlitter();
    1218:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    121c:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
    1222:	4eae ff1c      	jsr -228(a6)
	Disable();
    1226:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    122c:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    1230:	2879 0000 55ea 	movea.l 55ea <hw>,a4
    1236:	302c 0010      	move.w 16(a4),d0
    123a:	33c0 0000 55d8 	move.w d0,55d8 <SystemADKCON>
	SystemInts=hw->intenar;
    1240:	302c 001c      	move.w 28(a4),d0
    1244:	33c0 0000 55dc 	move.w d0,55dc <SystemInts>
	SystemDMA=hw->dmaconr;
    124a:	302c 0002      	move.w 2(a4),d0
    124e:	33c0 0000 55da 	move.w d0,55da <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    1254:	397c 7fff 009a 	move.w #32767,154(a4)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    125a:	397c 7fff 009c 	move.w #32767,156(a4)
	
	WaitVbl();
    1260:	45f9 0000 21f0 	lea 21f0 <WaitVbl>,a2
    1266:	4e92           	jsr (a2)
	WaitVbl();
    1268:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
    126a:	397c 7fff 0096 	move.w #32767,150(a4)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    1270:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
    1276:	93c9           	suba.l a1,a1
    1278:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    127c:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
    1282:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    1286:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
    128c:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    1290:	4e92           	jsr (a2)
	WaitVbl();
    1292:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    1294:	3b7c 4e7a ff9c 	move.w #20090,-100(a5)
    129a:	3b7c 0801 ff9e 	move.w #2049,-98(a5)
    12a0:	3b7c 4e73 ffa0 	move.w #20083,-96(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    12a6:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    12ac:	082e 0000 0129 	btst #0,297(a6)
    12b2:	6700 0296      	beq.w 154a <main+0x1544>
		vbr = (APTR)Supervisor((void*)getvbr);
    12b6:	cf8d           	exg d7,a5
    12b8:	4eae ffe2      	jsr -30(a6)
    12bc:	cf8d           	exg d7,a5

	VBR=GetVBR();
    12be:	23c0 0000 55de 	move.l d0,55de <VBR.lto_priv.4>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    12c4:	2079 0000 55de 	movea.l 55de <VBR.lto_priv.4>,a0
    12ca:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    12ce:	23c2 0000 55e2 	move.l d2,55e2 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    12d4:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
    12d6:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    12d8:	2079 0000 55ea 	movea.l 55ea <hw>,a0
    12de:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    12e2:	3028 0002      	move.w 2(a0),d0
    12e6:	0800 000e      	btst #14,d0
    12ea:	66f6           	bne.s 12e2 <main+0x12dc>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    12ec:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    12f2:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    12f8:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    12fe:	2279 0000 55de 	movea.l 55de <VBR.lto_priv.4>,a1
    1304:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    1308:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
    130e:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    1314:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    131a:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    1320:	3039 0000 55dc 	move.w 55dc <SystemInts>,d0
    1326:	0040 8000      	ori.w #-32768,d0
    132a:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    132e:	3039 0000 55da 	move.w 55da <SystemDMA>,d0
    1334:	0040 8000      	ori.w #-32768,d0
    1338:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    133c:	3039 0000 55d8 	move.w 55d8 <SystemADKCON>,d0
    1342:	0040 8000      	ori.w #-32768,d0
    1346:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    134a:	2279 0000 55d4 	movea.l 55d4 <ActiView>,a1
    1350:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    1354:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
    135a:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    135e:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
    1364:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    1368:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
    136e:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    1372:	2c79 0000 55e6 	movea.l 55e6 <GfxBase>,a6
    1378:	4eae fe32      	jsr -462(a6)
	Enable();
    137c:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    1382:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    1386:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    138c:	2279 0000 5602 	movea.l 5602 <DOSBase>,a1
    1392:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    1396:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    139c:	2279 0000 55e6 	movea.l 55e6 <GfxBase>,a1
    13a2:	4eae fe62      	jsr -414(a6)
}
    13a6:	7000           	moveq #0,d0
    13a8:	4ced 5cfc ff64 	movem.l -156(a5),d2-d7/a2-a4/a6
    13ae:	4e5d           	unlk a5
    13b0:	4e75           	rts
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    13b2:	0cb9 0004 0000 	cmpi.l #262144,55f2 <ViewBuffer>
    13b8:	0000 55f2 
    13bc:	6700 eee0      	beq.w 29e <main+0x298>
    Write( Output(), 
    13c0:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    13c6:	4eae ffc4      	jsr -60(a6)
    13ca:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    13d0:	2200           	move.l d0,d1
    13d2:	243c 0000 2d83 	move.l #11651,d2
    13d8:	763b           	moveq #59,d3
    13da:	4eae ffd0      	jsr -48(a6)
    13de:	6000 eebe      	bra.w 29e <main+0x298>
		Exit(0);
    13e2:	9dce           	suba.l a6,a6
    13e4:	7200           	moveq #0,d1
    13e6:	4eae ff70      	jsr -144(a6)
    13ea:	6000 ec68      	bra.w 54 <main+0x4e>
		Exit(0);
    13ee:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    13f4:	7200           	moveq #0,d1
    13f6:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    13fa:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    1400:	43f9 0000 2d48 	lea 2d48 <incbin_swfont_end+0xce>,a1
    1406:	7000           	moveq #0,d0
    1408:	4eae fdd8      	jsr -552(a6)
    140c:	23c0 0000 5602 	move.l d0,5602 <DOSBase>
	if (!DOSBase)
    1412:	6600 ec40      	bne.w 54 <main+0x4e>
    1416:	60ca           	bra.s 13e2 <main+0x13dc>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1418:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    141e:	4eae ffc4      	jsr -60(a6)
    1422:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1428:	2200           	move.l d0,d1
    142a:	243c 0000 2e39 	move.l #11833,d2
    1430:	7621           	moveq #33,d3
    1432:	4eae ffd0      	jsr -48(a6)
    1436:	2079 0000 560e 	movea.l 560e <Copperlist1>,a0
    143c:	6000 eede      	bra.w 31c <main+0x316>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    1440:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1446:	4eae ffc4      	jsr -60(a6)
    144a:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1450:	2200           	move.l d0,d1
    1452:	243c 0000 308c 	move.l #12428,d2
    1458:	7636           	moveq #54,d3
    145a:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    145e:	23fc 0004 0000 	move.l #262144,55fe <DrawBuffer>
    1464:	0000 55fe 
  ViewBuffer = (ULONG *)0x50000;
    1468:	23fc 0005 0000 	move.l #327680,55f2 <ViewBuffer>
    146e:	0000 55f2 
  SetBplPointers();
    1472:	45f9 0000 2014 	lea 2014 <SetBplPointers>,a2
    1478:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    147a:	0cb9 0005 0000 	cmpi.l #327680,55fe <DrawBuffer>
    1480:	0000 55fe 
    1484:	6600 edfa      	bne.w 280 <main+0x27a>
    1488:	6000 ff28      	bra.w 13b2 <main+0x13ac>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    148c:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1492:	4eae ffc4      	jsr -60(a6)
    1496:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    149c:	2200           	move.l d0,d1
    149e:	243c 0000 3056 	move.l #12374,d2
    14a4:	762c           	moveq #44,d3
    14a6:	4eae ffd0      	jsr -48(a6)
    14aa:	6000 ecfc      	bra.w 1a8 <main+0x1a2>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    14ae:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    14b4:	4eae ffc4      	jsr -60(a6)
    14b8:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    14be:	2200           	move.l d0,d1
    14c0:	243c 0000 331e 	move.l #13086,d2
    14c6:	7635           	moveq #53,d3
    14c8:	4eae ffd0      	jsr -48(a6)
  UWORD *source =AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    14cc:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    14d2:	203c 0000 3300 	move.l #13056,d0
    14d8:	7202           	moveq #2,d1
    14da:	4eae ff3a      	jsr -198(a6)
    14de:	2400           	move.l d0,d2
  if( source == 0) {
    14e0:	6600 f8f6      	bne.w dd8 <main+0xdd2>
    Write(  Output(), 
    14e4:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    14ea:	4eae ffc4      	jsr -60(a6)
    14ee:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    14f4:	2200           	move.l d0,d1
    14f6:	243c 0000 3395 	move.l #13205,d2
    14fc:	7639           	moveq #57,d3
    14fe:	4eae ffd0      	jsr -48(a6)
    return;
    1502:	6000 fb9a      	bra.w 109e <main+0x1098>
    Write(  Output(), 
    1506:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    150c:	4eae ffc4      	jsr -60(a6)
    1510:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1516:	2200           	move.l d0,d1
    1518:	243c 0000 318c 	move.l #12684,d2
    151e:	7636           	moveq #54,d3
    1520:	4eae ffd0      	jsr -48(a6)
    return;
    1524:	6000 f656      	bra.w b7c <main+0xb76>
    Write(  Output(), 
    1528:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    152e:	4eae ffc4      	jsr -60(a6)
    1532:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1538:	2200           	move.l d0,d1
    153a:	243c 0000 318c 	move.l #12684,d2
    1540:	7636           	moveq #54,d3
    1542:	4eae ffd0      	jsr -48(a6)
    return;
    1546:	6000 f3e6      	bra.w 92e <main+0x928>
	APTR vbr = 0;
    154a:	7000           	moveq #0,d0
	VBR=GetVBR();
    154c:	23c0 0000 55de 	move.l d0,55de <VBR.lto_priv.4>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    1552:	2079 0000 55de 	movea.l 55de <VBR.lto_priv.4>,a0
    1558:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    155c:	23c2 0000 55e2 	move.l d2,55e2 <SystemIrq>
	WaitVbl();
    1562:	4e92           	jsr (a2)
	WaitVbl();
    1564:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1566:	2079 0000 55ea 	movea.l 55ea <hw>,a0
    156c:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1570:	6000 fd70      	bra.w 12e2 <main+0x12dc>
    Write(  Output(), 
    1574:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    157a:	4eae ffc4      	jsr -60(a6)
    157e:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1584:	2200           	move.l d0,d1
    1586:	243c 0000 33cf 	move.l #13263,d2
    158c:	763d           	moveq #61,d3
    158e:	4eae ffd0      	jsr -48(a6)
    return;
    1592:	6000 fb0a      	bra.w 109e <main+0x1098>
    1596:	4e71           	nop

00001598 <WriteFont.constprop.3>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    1598:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    159c:	206f 0008      	movea.l 8(sp),a0
    15a0:	1010           	move.b (a0),d0
    15a2:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    15a6:	4880           	ext.w d0
    15a8:	48c0           	ext.l d0
    15aa:	e788           	lsl.l #3,d0
  fntptr += charpos;
    15ac:	4880           	ext.w d0
    15ae:	3040           	movea.w d0,a0
    15b0:	d1c8           	adda.l a0,a0
    15b2:	d1fc 0000 5590 	adda.l #21904,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    15b8:	3290           	move.w (a0),(a1)
    15ba:	3368 0002 0050 	move.w 2(a0),80(a1)
    15c0:	3368 0004 00a0 	move.w 4(a0),160(a1)
    15c6:	3368 0006 00f0 	move.w 6(a0),240(a1)
    15cc:	3368 0008 0140 	move.w 8(a0),320(a1)
    15d2:	3368 000a 0190 	move.w 10(a0),400(a1)
    15d8:	3368 000c 01e0 	move.w 12(a0),480(a1)
    15de:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    15e4:	4e75           	rts

000015e6 <warpmode.part.0>:
void warpmode(int on) 
    15e6:	598f           	subq.l #4,sp
    15e8:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    15ea:	4aaf 000c      	tst.l 12(sp)
    15ee:	674c           	beq.s 163c <warpmode.part.0+0x56>
    15f0:	4878 0001      	pea 1 <_start+0x1>
    15f4:	740b           	moveq #11,d2
    15f6:	d48f           	add.l sp,d2
    15f8:	2f02           	move.l d2,-(sp)
    15fa:	42a7           	clr.l -(sp)
    15fc:	4879 0000 2cae 	pea 2cae <incbin_swfont_end+0x34>
    1602:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd239>
    1606:	4878 0052      	pea 52 <main+0x4c>
    160a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeed19a>
    1610:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1614:	203c 0000 2c94 	move.l #11412,d0
    161a:	4878 0001      	pea 1 <_start+0x1>
    161e:	2f02           	move.l d2,-(sp)
    1620:	42a7           	clr.l -(sp)
    1622:	2f00           	move.l d0,-(sp)
    1624:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd239>
    1628:	4878 0052      	pea 52 <main+0x4c>
    162c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeed19a>
	}
}
    1632:	4fef 0018      	lea 24(sp),sp
    1636:	241f           	move.l (sp)+,d2
    1638:	588f           	addq.l #4,sp
    163a:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    163c:	4878 0001      	pea 1 <_start+0x1>
    1640:	740b           	moveq #11,d2
    1642:	d48f           	add.l sp,d2
    1644:	2f02           	move.l d2,-(sp)
    1646:	42a7           	clr.l -(sp)
    1648:	4879 0000 2cb8 	pea 2cb8 <incbin_swfont_end+0x3e>
    164e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd239>
    1652:	4878 0052      	pea 52 <main+0x4c>
    1656:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeed19a>
    165c:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1660:	203c 0000 2c7b 	move.l #11387,d0
    1666:	4878 0001      	pea 1 <_start+0x1>
    166a:	2f02           	move.l d2,-(sp)
    166c:	42a7           	clr.l -(sp)
    166e:	2f00           	move.l d0,-(sp)
    1670:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd239>
    1674:	4878 0052      	pea 52 <main+0x4c>
    1678:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeed19a>
}
    167e:	4fef 0018      	lea 24(sp),sp
    1682:	241f           	move.l (sp)+,d2
    1684:	588f           	addq.l #4,sp
    1686:	4e75           	rts

00001688 <KPrintF>:
{
    1688:	4fef ff80      	lea -128(sp),sp
    168c:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    1690:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeed19a>
    1696:	6734           	beq.s 16cc <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    1698:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    169e:	206f 0090      	movea.l 144(sp),a0
    16a2:	43ef 0094      	lea 148(sp),a1
    16a6:	45f9 0000 24b4 	lea 24b4 <PutChar>,a2
    16ac:	47ef 000c      	lea 12(sp),a3
    16b0:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    16b4:	2f0b           	move.l a3,-(sp)
    16b6:	4878 0056      	pea 56 <main+0x50>
    16ba:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeed19a>
    16c0:	508f           	addq.l #8,sp
}
    16c2:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    16c6:	4fef 0080      	lea 128(sp),sp
    16ca:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    16cc:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    16d2:	206f 0090      	movea.l 144(sp),a0
    16d6:	43ef 0094      	lea 148(sp),a1
    16da:	45f9 0000 24a6 	lea 24a6 <KPutCharX>,a2
    16e0:	97cb           	suba.l a3,a3
    16e2:	4eae fdf6      	jsr -522(a6)
}
    16e6:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    16ea:	4fef 0080      	lea 128(sp),sp
    16ee:	4e75           	rts

000016f0 <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    16f0:	202f 0008      	move.l 8(sp),d0
    16f4:	d080           	add.l d0,d0
    16f6:	d080           	add.l d0,d0
    16f8:	206f 0004      	movea.l 4(sp),a0
    16fc:	2030 0800      	move.l (0,a0,d0.l),d0
    1700:	b0af 000c      	cmp.l 12(sp),d0
    1704:	57c0           	seq d0
    1706:	4880           	ext.w d0
    1708:	48c0           	ext.l d0
}
    170a:	4480           	neg.l d0
    170c:	4e75           	rts

0000170e <TestCopperlistBatch>:
                                                                  long length) {
    170e:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    1712:	246f 0010      	movea.l 16(sp),a2
    1716:	206f 0014      	movea.l 20(sp),a0
    171a:	226f 0018      	movea.l 24(sp),a1
    171e:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    1722:	2008           	move.l a0,d0
    1724:	d088           	add.l a0,d0
    1726:	d080           	add.l d0,d0
    1728:	2411           	move.l (a1),d2
    172a:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    172e:	6600 01ac      	bne.w 18dc <TestCopperlistBatch+0x1ce>
    1732:	2008           	move.l a0,d0
    1734:	5280           	addq.l #1,d0
    1736:	d080           	add.l d0,d0
    1738:	d080           	add.l d0,d0
    173a:	2032 0800      	move.l (0,a2,d0.l),d0
    173e:	b0a9 0004      	cmp.l 4(a1),d0
    1742:	6600 0198      	bne.w 18dc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1746:	7002           	moveq #2,d0
    1748:	b081           	cmp.l d1,d0
    174a:	6700 0188      	beq.w 18d4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    174e:	2008           	move.l a0,d0
    1750:	5480           	addq.l #2,d0
    1752:	d080           	add.l d0,d0
    1754:	d080           	add.l d0,d0
    1756:	2032 0800      	move.l (0,a2,d0.l),d0
    175a:	b0a9 0008      	cmp.l 8(a1),d0
    175e:	6600 017c      	bne.w 18dc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1762:	7403           	moveq #3,d2
    1764:	b481           	cmp.l d1,d2
    1766:	6700 016c      	beq.w 18d4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    176a:	2008           	move.l a0,d0
    176c:	5680           	addq.l #3,d0
    176e:	d080           	add.l d0,d0
    1770:	d080           	add.l d0,d0
    1772:	2032 0800      	move.l (0,a2,d0.l),d0
    1776:	b0a9 000c      	cmp.l 12(a1),d0
    177a:	6600 0160      	bne.w 18dc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    177e:	7004           	moveq #4,d0
    1780:	b081           	cmp.l d1,d0
    1782:	6700 0150      	beq.w 18d4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1786:	2008           	move.l a0,d0
    1788:	5880           	addq.l #4,d0
    178a:	d080           	add.l d0,d0
    178c:	d080           	add.l d0,d0
    178e:	2032 0800      	move.l (0,a2,d0.l),d0
    1792:	b0a9 0010      	cmp.l 16(a1),d0
    1796:	6600 0144      	bne.w 18dc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    179a:	7405           	moveq #5,d2
    179c:	b481           	cmp.l d1,d2
    179e:	6700 0134      	beq.w 18d4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    17a2:	2008           	move.l a0,d0
    17a4:	5a80           	addq.l #5,d0
    17a6:	d080           	add.l d0,d0
    17a8:	d080           	add.l d0,d0
    17aa:	2032 0800      	move.l (0,a2,d0.l),d0
    17ae:	b0a9 0014      	cmp.l 20(a1),d0
    17b2:	6600 0128      	bne.w 18dc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    17b6:	7006           	moveq #6,d0
    17b8:	b081           	cmp.l d1,d0
    17ba:	6700 0118      	beq.w 18d4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    17be:	2008           	move.l a0,d0
    17c0:	5c80           	addq.l #6,d0
    17c2:	d080           	add.l d0,d0
    17c4:	d080           	add.l d0,d0
    17c6:	2032 0800      	move.l (0,a2,d0.l),d0
    17ca:	b0a9 0018      	cmp.l 24(a1),d0
    17ce:	6600 010c      	bne.w 18dc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    17d2:	7407           	moveq #7,d2
    17d4:	b481           	cmp.l d1,d2
    17d6:	6700 00fc      	beq.w 18d4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    17da:	2008           	move.l a0,d0
    17dc:	5e80           	addq.l #7,d0
    17de:	d080           	add.l d0,d0
    17e0:	d080           	add.l d0,d0
    17e2:	2032 0800      	move.l (0,a2,d0.l),d0
    17e6:	b0a9 001c      	cmp.l 28(a1),d0
    17ea:	6600 00f0      	bne.w 18dc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    17ee:	7008           	moveq #8,d0
    17f0:	b081           	cmp.l d1,d0
    17f2:	6700 00e0      	beq.w 18d4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    17f6:	2008           	move.l a0,d0
    17f8:	5080           	addq.l #8,d0
    17fa:	d080           	add.l d0,d0
    17fc:	d080           	add.l d0,d0
    17fe:	2032 0800      	move.l (0,a2,d0.l),d0
    1802:	b0a9 0020      	cmp.l 32(a1),d0
    1806:	6600 00d4      	bne.w 18dc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    180a:	7409           	moveq #9,d2
    180c:	b481           	cmp.l d1,d2
    180e:	6700 00c4      	beq.w 18d4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1812:	47e8 0009      	lea 9(a0),a3
    1816:	200b           	move.l a3,d0
    1818:	d08b           	add.l a3,d0
    181a:	d080           	add.l d0,d0
    181c:	2032 0800      	move.l (0,a2,d0.l),d0
    1820:	b0a9 0024      	cmp.l 36(a1),d0
    1824:	6600 00b6      	bne.w 18dc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1828:	700a           	moveq #10,d0
    182a:	b081           	cmp.l d1,d0
    182c:	6700 00a6      	beq.w 18d4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1830:	47e8 000a      	lea 10(a0),a3
    1834:	200b           	move.l a3,d0
    1836:	d08b           	add.l a3,d0
    1838:	d080           	add.l d0,d0
    183a:	2032 0800      	move.l (0,a2,d0.l),d0
    183e:	b0a9 0028      	cmp.l 40(a1),d0
    1842:	6600 0098      	bne.w 18dc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1846:	740b           	moveq #11,d2
    1848:	b481           	cmp.l d1,d2
    184a:	6700 0088      	beq.w 18d4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    184e:	47e8 000b      	lea 11(a0),a3
    1852:	200b           	move.l a3,d0
    1854:	d08b           	add.l a3,d0
    1856:	d080           	add.l d0,d0
    1858:	2032 0800      	move.l (0,a2,d0.l),d0
    185c:	b0a9 002c      	cmp.l 44(a1),d0
    1860:	667a           	bne.s 18dc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1862:	700c           	moveq #12,d0
    1864:	b081           	cmp.l d1,d0
    1866:	676c           	beq.s 18d4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1868:	47e8 000c      	lea 12(a0),a3
    186c:	200b           	move.l a3,d0
    186e:	d08b           	add.l a3,d0
    1870:	d080           	add.l d0,d0
    1872:	2032 0800      	move.l (0,a2,d0.l),d0
    1876:	b0a9 0030      	cmp.l 48(a1),d0
    187a:	6660           	bne.s 18dc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    187c:	740d           	moveq #13,d2
    187e:	b481           	cmp.l d1,d2
    1880:	6752           	beq.s 18d4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1882:	47e8 000d      	lea 13(a0),a3
    1886:	200b           	move.l a3,d0
    1888:	d08b           	add.l a3,d0
    188a:	d080           	add.l d0,d0
    188c:	2032 0800      	move.l (0,a2,d0.l),d0
    1890:	b0a9 0034      	cmp.l 52(a1),d0
    1894:	6646           	bne.s 18dc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1896:	700e           	moveq #14,d0
    1898:	b081           	cmp.l d1,d0
    189a:	6738           	beq.s 18d4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    189c:	47e8 000e      	lea 14(a0),a3
    18a0:	200b           	move.l a3,d0
    18a2:	d08b           	add.l a3,d0
    18a4:	d080           	add.l d0,d0
    18a6:	2032 0800      	move.l (0,a2,d0.l),d0
    18aa:	b0a9 0038      	cmp.l 56(a1),d0
    18ae:	662c           	bne.s 18dc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    18b0:	7410           	moveq #16,d2
    18b2:	b481           	cmp.l d1,d2
    18b4:	661e           	bne.s 18d4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    18b6:	41e8 000f      	lea 15(a0),a0
    18ba:	d1c8           	adda.l a0,a0
    18bc:	d1c8           	adda.l a0,a0
    18be:	2070 a800      	movea.l (0,a0,a2.l),a0
    18c2:	b1e9 003c      	cmpa.l 60(a1),a0
    18c6:	57c0           	seq d0
    18c8:	4880           	ext.w d0
    18ca:	48c0           	ext.l d0
    18cc:	4480           	neg.l d0
}
    18ce:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    18d2:	4e75           	rts
  return 1;
    18d4:	7001           	moveq #1,d0
}
    18d6:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    18da:	4e75           	rts
      return 0;
    18dc:	7000           	moveq #0,d0
}
    18de:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    18e2:	4e75           	rts

000018e4 <ClBuild>:
ULONG * ClbuildSW() {
    18e4:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    18e8:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    18ee:	707b           	moveq #123,d0
    18f0:	4600           	not.b d0
    18f2:	7202           	moveq #2,d1
    18f4:	4eae ff3a      	jsr -198(a6)
    18f8:	2440           	movea.l d0,a2
  if( retval == 0) {
    18fa:	4a80           	tst.l d0
    18fc:	6700 010e      	beq.w 1a0c <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    1900:	24b9 0000 5550 	move.l 5550 <ClsSprites>,(a2)
    1906:	2579 0000 5554 	move.l 5554 <ClsSprites+0x4>,4(a2)
    190c:	0004 
    190e:	2579 0000 5558 	move.l 5558 <ClsSprites+0x8>,8(a2)
    1914:	0008 
    1916:	2579 0000 555c 	move.l 555c <ClsSprites+0xc>,12(a2)
    191c:	000c 
    191e:	2579 0000 5560 	move.l 5560 <ClsSprites+0x10>,16(a2)
    1924:	0010 
    1926:	2579 0000 5564 	move.l 5564 <ClsSprites+0x14>,20(a2)
    192c:	0014 
    192e:	2579 0000 5568 	move.l 5568 <ClsSprites+0x18>,24(a2)
    1934:	0018 
    1936:	2579 0000 556c 	move.l 556c <ClsSprites+0x1c>,28(a2)
    193c:	001c 
    193e:	2579 0000 5570 	move.l 5570 <ClsSprites+0x20>,32(a2)
    1944:	0020 
    1946:	2579 0000 5574 	move.l 5574 <ClsSprites+0x24>,36(a2)
    194c:	0024 
    194e:	2579 0000 5578 	move.l 5578 <ClsSprites+0x28>,40(a2)
    1954:	0028 
    1956:	2579 0000 557c 	move.l 557c <ClsSprites+0x2c>,44(a2)
    195c:	002c 
    195e:	2579 0000 5580 	move.l 5580 <ClsSprites+0x30>,48(a2)
    1964:	0030 
    1966:	2579 0000 5584 	move.l 5584 <ClsSprites+0x34>,52(a2)
    196c:	0034 
    196e:	2579 0000 5588 	move.l 5588 <ClsSprites+0x38>,56(a2)
    1974:	0038 
    1976:	2579 0000 558c 	move.l 558c <ClsSprites+0x3c>,60(a2)
    197c:	003c 
    *cl++ = *clpartinstruction++;
    197e:	2579 0000 5520 	move.l 5520 <ClScreen>,64(a2)
    1984:	0040 
    1986:	2579 0000 5524 	move.l 5524 <ClScreen+0x4>,68(a2)
    198c:	0044 
    198e:	2579 0000 5528 	move.l 5528 <ClScreen+0x8>,72(a2)
    1994:	0048 
    1996:	2579 0000 552c 	move.l 552c <ClScreen+0xc>,76(a2)
    199c:	004c 
    199e:	2579 0000 5530 	move.l 5530 <ClScreen+0x10>,80(a2)
    19a4:	0050 
    19a6:	2579 0000 5534 	move.l 5534 <ClScreen+0x14>,84(a2)
    19ac:	0054 
    19ae:	2579 0000 5538 	move.l 5538 <ClScreen+0x18>,88(a2)
    19b4:	0058 
    19b6:	2579 0000 553c 	move.l 553c <ClScreen+0x1c>,92(a2)
    19bc:	005c 
    19be:	2579 0000 5540 	move.l 5540 <ClScreen+0x20>,96(a2)
    19c4:	0060 
    19c6:	2579 0000 5544 	move.l 5544 <ClScreen+0x24>,100(a2)
    19cc:	0064 
    19ce:	2579 0000 5548 	move.l 5548 <ClScreen+0x28>,104(a2)
    19d4:	0068 
    19d6:	2579 0000 554c 	move.l 554c <ClScreen+0x2c>,108(a2)
    19dc:	006c 
  *cl++ = 0x00e00000;
    19de:	257c 00e0 0000 	move.l #14680064,112(a2)
    19e4:	0070 
  *cl++ = 0x00e20000;
    19e6:	257c 00e2 0000 	move.l #14811136,116(a2)
    19ec:	0074 
    *cl++ = *clpartinstruction++;
    19ee:	2579 0000 5518 	move.l 5518 <ClColor>,120(a2)
    19f4:	0078 
    19f6:	2579 0000 551c 	move.l 551c <ClColor+0x4>,124(a2)
    19fc:	007c 
  *cl = 0xfffffffe;
    19fe:	70fe           	moveq #-2,d0
    1a00:	2540 0080      	move.l d0,128(a2)
}
    1a04:	200a           	move.l a2,d0
    1a06:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1a0a:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1a0c:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1a12:	4eae ffc4      	jsr -60(a6)
    1a16:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1a1c:	2200           	move.l d0,d1
    1a1e:	243c 0000 2cc3 	move.l #11459,d2
    1a24:	7628           	moveq #40,d3
    1a26:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1a2a:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1a30:	7201           	moveq #1,d1
    1a32:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1a36:	24b9 0000 5550 	move.l 5550 <ClsSprites>,(a2)
    1a3c:	2579 0000 5554 	move.l 5554 <ClsSprites+0x4>,4(a2)
    1a42:	0004 
    1a44:	2579 0000 5558 	move.l 5558 <ClsSprites+0x8>,8(a2)
    1a4a:	0008 
    1a4c:	2579 0000 555c 	move.l 555c <ClsSprites+0xc>,12(a2)
    1a52:	000c 
    1a54:	2579 0000 5560 	move.l 5560 <ClsSprites+0x10>,16(a2)
    1a5a:	0010 
    1a5c:	2579 0000 5564 	move.l 5564 <ClsSprites+0x14>,20(a2)
    1a62:	0014 
    1a64:	2579 0000 5568 	move.l 5568 <ClsSprites+0x18>,24(a2)
    1a6a:	0018 
    1a6c:	2579 0000 556c 	move.l 556c <ClsSprites+0x1c>,28(a2)
    1a72:	001c 
    1a74:	2579 0000 5570 	move.l 5570 <ClsSprites+0x20>,32(a2)
    1a7a:	0020 
    1a7c:	2579 0000 5574 	move.l 5574 <ClsSprites+0x24>,36(a2)
    1a82:	0024 
    1a84:	2579 0000 5578 	move.l 5578 <ClsSprites+0x28>,40(a2)
    1a8a:	0028 
    1a8c:	2579 0000 557c 	move.l 557c <ClsSprites+0x2c>,44(a2)
    1a92:	002c 
    1a94:	2579 0000 5580 	move.l 5580 <ClsSprites+0x30>,48(a2)
    1a9a:	0030 
    1a9c:	2579 0000 5584 	move.l 5584 <ClsSprites+0x34>,52(a2)
    1aa2:	0034 
    1aa4:	2579 0000 5588 	move.l 5588 <ClsSprites+0x38>,56(a2)
    1aaa:	0038 
    1aac:	2579 0000 558c 	move.l 558c <ClsSprites+0x3c>,60(a2)
    1ab2:	003c 
    *cl++ = *clpartinstruction++;
    1ab4:	2579 0000 5520 	move.l 5520 <ClScreen>,64(a2)
    1aba:	0040 
    1abc:	2579 0000 5524 	move.l 5524 <ClScreen+0x4>,68(a2)
    1ac2:	0044 
    1ac4:	2579 0000 5528 	move.l 5528 <ClScreen+0x8>,72(a2)
    1aca:	0048 
    1acc:	2579 0000 552c 	move.l 552c <ClScreen+0xc>,76(a2)
    1ad2:	004c 
    1ad4:	2579 0000 5530 	move.l 5530 <ClScreen+0x10>,80(a2)
    1ada:	0050 
    1adc:	2579 0000 5534 	move.l 5534 <ClScreen+0x14>,84(a2)
    1ae2:	0054 
    1ae4:	2579 0000 5538 	move.l 5538 <ClScreen+0x18>,88(a2)
    1aea:	0058 
    1aec:	2579 0000 553c 	move.l 553c <ClScreen+0x1c>,92(a2)
    1af2:	005c 
    1af4:	2579 0000 5540 	move.l 5540 <ClScreen+0x20>,96(a2)
    1afa:	0060 
    1afc:	2579 0000 5544 	move.l 5544 <ClScreen+0x24>,100(a2)
    1b02:	0064 
    1b04:	2579 0000 5548 	move.l 5548 <ClScreen+0x28>,104(a2)
    1b0a:	0068 
    1b0c:	2579 0000 554c 	move.l 554c <ClScreen+0x2c>,108(a2)
    1b12:	006c 
  *cl++ = 0x00e00000;
    1b14:	257c 00e0 0000 	move.l #14680064,112(a2)
    1b1a:	0070 
  *cl++ = 0x00e20000;
    1b1c:	257c 00e2 0000 	move.l #14811136,116(a2)
    1b22:	0074 
    *cl++ = *clpartinstruction++;
    1b24:	2579 0000 5518 	move.l 5518 <ClColor>,120(a2)
    1b2a:	0078 
    1b2c:	2579 0000 551c 	move.l 551c <ClColor+0x4>,124(a2)
    1b32:	007c 
  *cl = 0xfffffffe;
    1b34:	70fe           	moveq #-2,d0
    1b36:	2540 0080      	move.l d0,128(a2)
}
    1b3a:	200a           	move.l a2,d0
    1b3c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1b40:	4e75           	rts

00001b42 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    1b42:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1b46:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    1b4c:	203c 0000 a48c 	move.l #42124,d0
    1b52:	7202           	moveq #2,d1
    1b54:	4eae ff3a      	jsr -198(a6)
    1b58:	2440           	movea.l d0,a2
  if( retval == 0) {
    1b5a:	4a80           	tst.l d0
    1b5c:	6700 0160      	beq.w 1cbe <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    1b60:	24b9 0000 5550 	move.l 5550 <ClsSprites>,(a2)
    1b66:	2579 0000 5554 	move.l 5554 <ClsSprites+0x4>,4(a2)
    1b6c:	0004 
    1b6e:	2579 0000 5558 	move.l 5558 <ClsSprites+0x8>,8(a2)
    1b74:	0008 
    1b76:	2579 0000 555c 	move.l 555c <ClsSprites+0xc>,12(a2)
    1b7c:	000c 
    1b7e:	2579 0000 5560 	move.l 5560 <ClsSprites+0x10>,16(a2)
    1b84:	0010 
    1b86:	2579 0000 5564 	move.l 5564 <ClsSprites+0x14>,20(a2)
    1b8c:	0014 
    1b8e:	2579 0000 5568 	move.l 5568 <ClsSprites+0x18>,24(a2)
    1b94:	0018 
    1b96:	2579 0000 556c 	move.l 556c <ClsSprites+0x1c>,28(a2)
    1b9c:	001c 
    1b9e:	2579 0000 5570 	move.l 5570 <ClsSprites+0x20>,32(a2)
    1ba4:	0020 
    1ba6:	2579 0000 5574 	move.l 5574 <ClsSprites+0x24>,36(a2)
    1bac:	0024 
    1bae:	2579 0000 5578 	move.l 5578 <ClsSprites+0x28>,40(a2)
    1bb4:	0028 
    1bb6:	2579 0000 557c 	move.l 557c <ClsSprites+0x2c>,44(a2)
    1bbc:	002c 
    1bbe:	2579 0000 5580 	move.l 5580 <ClsSprites+0x30>,48(a2)
    1bc4:	0030 
    1bc6:	2579 0000 5584 	move.l 5584 <ClsSprites+0x34>,52(a2)
    1bcc:	0034 
    1bce:	2579 0000 5588 	move.l 5588 <ClsSprites+0x38>,56(a2)
    1bd4:	0038 
    1bd6:	2579 0000 558c 	move.l 558c <ClsSprites+0x3c>,60(a2)
    1bdc:	003c 
    *cl++ = *clpartinstruction++;
    1bde:	2579 0000 54e8 	move.l 54e8 <ClScreenZoom>,64(a2)
    1be4:	0040 
    1be6:	2579 0000 54ec 	move.l 54ec <ClScreenZoom+0x4>,68(a2)
    1bec:	0044 
    1bee:	2579 0000 54f0 	move.l 54f0 <ClScreenZoom+0x8>,72(a2)
    1bf4:	0048 
    1bf6:	2579 0000 54f4 	move.l 54f4 <ClScreenZoom+0xc>,76(a2)
    1bfc:	004c 
    1bfe:	2579 0000 54f8 	move.l 54f8 <ClScreenZoom+0x10>,80(a2)
    1c04:	0050 
    1c06:	2579 0000 54fc 	move.l 54fc <ClScreenZoom+0x14>,84(a2)
    1c0c:	0054 
    1c0e:	2579 0000 5500 	move.l 5500 <ClScreenZoom+0x18>,88(a2)
    1c14:	0058 
    1c16:	2579 0000 5504 	move.l 5504 <ClScreenZoom+0x1c>,92(a2)
    1c1c:	005c 
    1c1e:	2579 0000 5508 	move.l 5508 <ClScreenZoom+0x20>,96(a2)
    1c24:	0060 
    1c26:	2579 0000 550c 	move.l 550c <ClScreenZoom+0x24>,100(a2)
    1c2c:	0064 
    1c2e:	2579 0000 5510 	move.l 5510 <ClScreenZoom+0x28>,104(a2)
    1c34:	0068 
    1c36:	2579 0000 5514 	move.l 5514 <ClScreenZoom+0x2c>,108(a2)
    1c3c:	006c 
  *cl++ = 0x00e00000;
    1c3e:	257c 00e0 0000 	move.l #14680064,112(a2)
    1c44:	0070 
  *cl++ = 0x00e20000;
    1c46:	257c 00e2 0000 	move.l #14811136,116(a2)
    1c4c:	0074 
  *cl++ = 0x00e40000;
    1c4e:	257c 00e4 0000 	move.l #14942208,120(a2)
    1c54:	0078 
  *cl++ = 0x00e60000;
    1c56:	257c 00e6 0000 	move.l #15073280,124(a2)
    1c5c:	007c 
    *cl++ = *clpartinstruction++;
    1c5e:	2579 0000 5518 	move.l 5518 <ClColor>,128(a2)
    1c64:	0080 
    1c66:	2579 0000 551c 	move.l 551c <ClColor+0x4>,132(a2)
    1c6c:	0084 
    1c6e:	43ea 012c      	lea 300(a2),a1
    1c72:	220a           	move.l a2,d1
    1c74:	0681 0000 a52c 	addi.l #42284,d1
    1c7a:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    1c80:	41e9 ff60      	lea -160(a1),a0
    1c84:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    1c88:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    1c8e:	5088           	addq.l #8,a0
    1c90:	217c 0182 0f00 	move.l #25300736,-4(a0)
    1c96:	fffc 
    for(int i2=0;i2<20;i2++) {
    1c98:	b3c8           	cmpa.l a0,a1
    1c9a:	66ec           	bne.s 1c88 <ClbuildZoom+0x146>
    1c9c:	43e8 00a4      	lea 164(a0),a1
    1ca0:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    1ca6:	b3c1           	cmpa.l d1,a1
    1ca8:	66d6           	bne.s 1c80 <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    1caa:	203c 0000 a488 	move.l #42120,d0
    1cb0:	72fe           	moveq #-2,d1
    1cb2:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    1cb6:	200a           	move.l a2,d0
    1cb8:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1cbc:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1cbe:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1cc4:	4eae ffc4      	jsr -60(a6)
    1cc8:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1cce:	2200           	move.l d0,d1
    1cd0:	243c 0000 2cc3 	move.l #11459,d2
    1cd6:	7628           	moveq #40,d3
    1cd8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1cdc:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1ce2:	7201           	moveq #1,d1
    1ce4:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1ce8:	24b9 0000 5550 	move.l 5550 <ClsSprites>,(a2)
    1cee:	2579 0000 5554 	move.l 5554 <ClsSprites+0x4>,4(a2)
    1cf4:	0004 
    1cf6:	2579 0000 5558 	move.l 5558 <ClsSprites+0x8>,8(a2)
    1cfc:	0008 
    1cfe:	2579 0000 555c 	move.l 555c <ClsSprites+0xc>,12(a2)
    1d04:	000c 
    1d06:	2579 0000 5560 	move.l 5560 <ClsSprites+0x10>,16(a2)
    1d0c:	0010 
    1d0e:	2579 0000 5564 	move.l 5564 <ClsSprites+0x14>,20(a2)
    1d14:	0014 
    1d16:	2579 0000 5568 	move.l 5568 <ClsSprites+0x18>,24(a2)
    1d1c:	0018 
    1d1e:	2579 0000 556c 	move.l 556c <ClsSprites+0x1c>,28(a2)
    1d24:	001c 
    1d26:	2579 0000 5570 	move.l 5570 <ClsSprites+0x20>,32(a2)
    1d2c:	0020 
    1d2e:	2579 0000 5574 	move.l 5574 <ClsSprites+0x24>,36(a2)
    1d34:	0024 
    1d36:	2579 0000 5578 	move.l 5578 <ClsSprites+0x28>,40(a2)
    1d3c:	0028 
    1d3e:	2579 0000 557c 	move.l 557c <ClsSprites+0x2c>,44(a2)
    1d44:	002c 
    1d46:	2579 0000 5580 	move.l 5580 <ClsSprites+0x30>,48(a2)
    1d4c:	0030 
    1d4e:	2579 0000 5584 	move.l 5584 <ClsSprites+0x34>,52(a2)
    1d54:	0034 
    1d56:	2579 0000 5588 	move.l 5588 <ClsSprites+0x38>,56(a2)
    1d5c:	0038 
    1d5e:	2579 0000 558c 	move.l 558c <ClsSprites+0x3c>,60(a2)
    1d64:	003c 
    *cl++ = *clpartinstruction++;
    1d66:	2579 0000 54e8 	move.l 54e8 <ClScreenZoom>,64(a2)
    1d6c:	0040 
    1d6e:	2579 0000 54ec 	move.l 54ec <ClScreenZoom+0x4>,68(a2)
    1d74:	0044 
    1d76:	2579 0000 54f0 	move.l 54f0 <ClScreenZoom+0x8>,72(a2)
    1d7c:	0048 
    1d7e:	2579 0000 54f4 	move.l 54f4 <ClScreenZoom+0xc>,76(a2)
    1d84:	004c 
    1d86:	2579 0000 54f8 	move.l 54f8 <ClScreenZoom+0x10>,80(a2)
    1d8c:	0050 
    1d8e:	2579 0000 54fc 	move.l 54fc <ClScreenZoom+0x14>,84(a2)
    1d94:	0054 
    1d96:	2579 0000 5500 	move.l 5500 <ClScreenZoom+0x18>,88(a2)
    1d9c:	0058 
    1d9e:	2579 0000 5504 	move.l 5504 <ClScreenZoom+0x1c>,92(a2)
    1da4:	005c 
    1da6:	2579 0000 5508 	move.l 5508 <ClScreenZoom+0x20>,96(a2)
    1dac:	0060 
    1dae:	2579 0000 550c 	move.l 550c <ClScreenZoom+0x24>,100(a2)
    1db4:	0064 
    1db6:	2579 0000 5510 	move.l 5510 <ClScreenZoom+0x28>,104(a2)
    1dbc:	0068 
    1dbe:	2579 0000 5514 	move.l 5514 <ClScreenZoom+0x2c>,108(a2)
    1dc4:	006c 
  *cl++ = 0x00e00000;
    1dc6:	257c 00e0 0000 	move.l #14680064,112(a2)
    1dcc:	0070 
  *cl++ = 0x00e20000;
    1dce:	257c 00e2 0000 	move.l #14811136,116(a2)
    1dd4:	0074 
  *cl++ = 0x00e40000;
    1dd6:	257c 00e4 0000 	move.l #14942208,120(a2)
    1ddc:	0078 
  *cl++ = 0x00e60000;
    1dde:	257c 00e6 0000 	move.l #15073280,124(a2)
    1de4:	007c 
    *cl++ = *clpartinstruction++;
    1de6:	2579 0000 5518 	move.l 5518 <ClColor>,128(a2)
    1dec:	0080 
    1dee:	2579 0000 551c 	move.l 551c <ClColor+0x4>,132(a2)
    1df4:	0084 
    1df6:	43ea 012c      	lea 300(a2),a1
    1dfa:	220a           	move.l a2,d1
    1dfc:	0681 0000 a52c 	addi.l #42284,d1
    1e02:	203c 2c07 fffe 	move.l #738721790,d0
    1e08:	6000 fe76      	bra.w 1c80 <ClbuildZoom+0x13e>

00001e0c <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    1e0c:	2039 0000 55fa 	move.l 55fa <DrawCopper>,d0
  DrawCopper = ViewCopper;
    1e12:	23f9 0000 55ee 	move.l 55ee <ViewCopper>,55fa <DrawCopper>
    1e18:	0000 55fa 
  ViewCopper = (ULONG *)tmp;
    1e1c:	23c0 0000 55ee 	move.l d0,55ee <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    1e22:	2079 0000 55ea 	movea.l 55ea <hw>,a0
    1e28:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    1e2c:	3140 0088      	move.w d0,136(a0)
}
    1e30:	4e75           	rts

00001e32 <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    1e32:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    1e36:	45fa fd0a      	lea 1b42 <ClbuildZoom>(pc),a2
    1e3a:	4e92           	jsr (a2)
    1e3c:	23c0 0000 560e 	move.l d0,560e <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1e42:	4e92           	jsr (a2)
    1e44:	23c0 0000 560a 	move.l d0,560a <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1e4a:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    1e50:	203c 0001 4a00 	move.l #84480,d0
    1e56:	7202           	moveq #2,d1
    1e58:	4eae ff3a      	jsr -198(a6)
    1e5c:	23c0 0000 5606 	move.l d0,5606 <Bitplane1>
  if(Bitplane1 == 0) {
    1e62:	6700 014e      	beq.w 1fb2 <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    1e66:	23c0 0000 55fe 	move.l d0,55fe <DrawBuffer>
  DrawCopper = Copperlist1;
    1e6c:	23f9 0000 560e 	move.l 560e <Copperlist1>,55fa <DrawCopper>
    1e72:	0000 55fa 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1e76:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    1e7c:	203c 0001 4a00 	move.l #84480,d0
    1e82:	7202           	moveq #2,d1
    1e84:	4eae ff3a      	jsr -198(a6)
    1e88:	2400           	move.l d0,d2
    1e8a:	23c0 0000 55f6 	move.l d0,55f6 <Bitplane2>
  if(Bitplane2 == 0) {
    1e90:	6778           	beq.s 1f0a <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    1e92:	23f9 0000 560a 	move.l 560a <Copperlist2>,55ee <ViewCopper>
    1e98:	0000 55ee 
  SwapCl();
    1e9c:	45fa ff6e      	lea 1e0c <SwapCl>(pc),a2
    1ea0:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    1ea2:	2039 0000 55fe 	move.l 55fe <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1ea8:	2079 0000 55fa 	movea.l 55fa <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1eae:	2200           	move.l d0,d1
    1eb0:	4241           	clr.w d1
    1eb2:	4841           	swap d1
    1eb4:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    1eb8:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    1ebc:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1ec2:	2200           	move.l d0,d1
    1ec4:	4241           	clr.w d1
    1ec6:	4841           	swap d1
    1ec8:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1ecc:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    1ed0:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    1ed2:	2079 0000 55fa 	movea.l 55fa <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1ed8:	2002           	move.l d2,d0
    1eda:	4240           	clr.w d0
    1edc:	4840           	swap d0
    1ede:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    1ee2:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    1ee6:	2002           	move.l d2,d0
    1ee8:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1eee:	2200           	move.l d0,d1
    1ef0:	4241           	clr.w d1
    1ef2:	4841           	swap d1
    1ef4:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1ef8:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    1efc:	23c2 0000 55f2 	move.l d2,55f2 <ViewBuffer>
}
    1f02:	7000           	moveq #0,d0
    1f04:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1f08:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1f0a:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1f10:	4eae ffc4      	jsr -60(a6)
    1f14:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1f1a:	2200           	move.l d0,d1
    1f1c:	243c 0000 2d10 	move.l #11536,d2
    1f22:	7626           	moveq #38,d3
    1f24:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1f28:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1f2e:	7201           	moveq #1,d1
    1f30:	4eae ff70      	jsr -144(a6)
    1f34:	2439 0000 55f6 	move.l 55f6 <Bitplane2>,d2
  ViewCopper = Copperlist2;
    1f3a:	23f9 0000 560a 	move.l 560a <Copperlist2>,55ee <ViewCopper>
    1f40:	0000 55ee 
  SwapCl();
    1f44:	45fa fec6      	lea 1e0c <SwapCl>(pc),a2
    1f48:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    1f4a:	2039 0000 55fe 	move.l 55fe <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1f50:	2079 0000 55fa 	movea.l 55fa <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1f56:	2200           	move.l d0,d1
    1f58:	4241           	clr.w d1
    1f5a:	4841           	swap d1
    1f5c:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    1f60:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    1f64:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1f6a:	2200           	move.l d0,d1
    1f6c:	4241           	clr.w d1
    1f6e:	4841           	swap d1
    1f70:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1f74:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    1f78:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    1f7a:	2079 0000 55fa 	movea.l 55fa <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1f80:	2002           	move.l d2,d0
    1f82:	4240           	clr.w d0
    1f84:	4840           	swap d0
    1f86:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    1f8a:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    1f8e:	2002           	move.l d2,d0
    1f90:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1f96:	2200           	move.l d0,d1
    1f98:	4241           	clr.w d1
    1f9a:	4841           	swap d1
    1f9c:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1fa0:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    1fa4:	23c2 0000 55f2 	move.l d2,55f2 <ViewBuffer>
}
    1faa:	7000           	moveq #0,d0
    1fac:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1fb0:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1fb2:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1fb8:	4eae ffc4      	jsr -60(a6)
    1fbc:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1fc2:	2200           	move.l d0,d1
    1fc4:	243c 0000 2ce9 	move.l #11497,d2
    1fca:	7626           	moveq #38,d3
    1fcc:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1fd0:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    1fd6:	7201           	moveq #1,d1
    1fd8:	4eae ff70      	jsr -144(a6)
    1fdc:	2039 0000 5606 	move.l 5606 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    1fe2:	23c0 0000 55fe 	move.l d0,55fe <DrawBuffer>
  DrawCopper = Copperlist1;
    1fe8:	23f9 0000 560e 	move.l 560e <Copperlist1>,55fa <DrawCopper>
    1fee:	0000 55fa 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1ff2:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    1ff8:	203c 0001 4a00 	move.l #84480,d0
    1ffe:	7202           	moveq #2,d1
    2000:	4eae ff3a      	jsr -198(a6)
    2004:	2400           	move.l d0,d2
    2006:	23c0 0000 55f6 	move.l d0,55f6 <Bitplane2>
  if(Bitplane2 == 0) {
    200c:	6600 fe84      	bne.w 1e92 <PrepareDisplayZoom+0x60>
    2010:	6000 fef8      	bra.w 1f0a <PrepareDisplayZoom+0xd8>

00002014 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2014:	2039 0000 55fe 	move.l 55fe <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    201a:	2079 0000 55fa 	movea.l 55fa <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    2020:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2024:	2200           	move.l d0,d1
    2026:	4241           	clr.w d1
    2028:	4841           	swap d1
    202a:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    202e:	23f9 0000 55f2 	move.l 55f2 <ViewBuffer>,55fe <DrawBuffer>
    2034:	0000 55fe 
  ViewBuffer = (ULONG *) tmp;
    2038:	23c0 0000 55f2 	move.l d0,55f2 <ViewBuffer>
}
    203e:	4e75           	rts

00002040 <PrepareDisplay>:
 int PrepareDisplaySW() {
    2040:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    2044:	45fa f89e      	lea 18e4 <ClBuild>(pc),a2
    2048:	4e92           	jsr (a2)
    204a:	23c0 0000 560e 	move.l d0,560e <Copperlist1>
  Copperlist2 = ClbuildSW();
    2050:	4e92           	jsr (a2)
    2052:	23c0 0000 560a 	move.l d0,560a <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2058:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    205e:	203c 0000 c800 	move.l #51200,d0
    2064:	7202           	moveq #2,d1
    2066:	4eae ff3a      	jsr -198(a6)
    206a:	23c0 0000 5606 	move.l d0,5606 <Bitplane1>
  if(Bitplane1 == 0) {
    2070:	6700 00ac      	beq.w 211e <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    2074:	23c0 0000 55fe 	move.l d0,55fe <DrawBuffer>
  DrawCopper = Copperlist1;
    207a:	23f9 0000 560e 	move.l 560e <Copperlist1>,55fa <DrawCopper>
    2080:	0000 55fa 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2084:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    208a:	203c 0000 c800 	move.l #51200,d0
    2090:	7202           	moveq #2,d1
    2092:	4eae ff3a      	jsr -198(a6)
    2096:	23c0 0000 55f6 	move.l d0,55f6 <Bitplane2>
  if(Bitplane2 == 0) {
    209c:	6728           	beq.s 20c6 <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    209e:	23c0 0000 55f2 	move.l d0,55f2 <ViewBuffer>
  ViewCopper = Copperlist2;
    20a4:	23f9 0000 560a 	move.l 560a <Copperlist2>,55ee <ViewCopper>
    20aa:	0000 55ee 
  SwapCl();
    20ae:	47fa fd5c      	lea 1e0c <SwapCl>(pc),a3
    20b2:	4e93           	jsr (a3)
  SetBplPointers();
    20b4:	45fa ff5e      	lea 2014 <SetBplPointers>(pc),a2
    20b8:	4e92           	jsr (a2)
  SwapCl();
    20ba:	4e93           	jsr (a3)
  SetBplPointers();
    20bc:	4e92           	jsr (a2)
}
    20be:	7000           	moveq #0,d0
    20c0:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    20c4:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    20c6:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    20cc:	4eae ffc4      	jsr -60(a6)
    20d0:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    20d6:	2200           	move.l d0,d1
    20d8:	243c 0000 2d10 	move.l #11536,d2
    20de:	7626           	moveq #38,d3
    20e0:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    20e4:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    20ea:	7201           	moveq #1,d1
    20ec:	4eae ff70      	jsr -144(a6)
    20f0:	2039 0000 55f6 	move.l 55f6 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    20f6:	23c0 0000 55f2 	move.l d0,55f2 <ViewBuffer>
  ViewCopper = Copperlist2;
    20fc:	23f9 0000 560a 	move.l 560a <Copperlist2>,55ee <ViewCopper>
    2102:	0000 55ee 
  SwapCl();
    2106:	47fa fd04      	lea 1e0c <SwapCl>(pc),a3
    210a:	4e93           	jsr (a3)
  SetBplPointers();
    210c:	45fa ff06      	lea 2014 <SetBplPointers>(pc),a2
    2110:	4e92           	jsr (a2)
  SwapCl();
    2112:	4e93           	jsr (a3)
  SetBplPointers();
    2114:	4e92           	jsr (a2)
}
    2116:	7000           	moveq #0,d0
    2118:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    211c:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    211e:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    2124:	4eae ffc4      	jsr -60(a6)
    2128:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    212e:	2200           	move.l d0,d1
    2130:	243c 0000 2ce9 	move.l #11497,d2
    2136:	7626           	moveq #38,d3
    2138:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    213c:	2c79 0000 5602 	movea.l 5602 <DOSBase>,a6
    2142:	7201           	moveq #1,d1
    2144:	4eae ff70      	jsr -144(a6)
    2148:	2039 0000 5606 	move.l 5606 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    214e:	23c0 0000 55fe 	move.l d0,55fe <DrawBuffer>
  DrawCopper = Copperlist1;
    2154:	23f9 0000 560e 	move.l 560e <Copperlist1>,55fa <DrawCopper>
    215a:	0000 55fa 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    215e:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    2164:	203c 0000 c800 	move.l #51200,d0
    216a:	7202           	moveq #2,d1
    216c:	4eae ff3a      	jsr -198(a6)
    2170:	23c0 0000 55f6 	move.l d0,55f6 <Bitplane2>
  if(Bitplane2 == 0) {
    2176:	6600 ff26      	bne.w 209e <PrepareDisplay+0x5e>
    217a:	6000 ff4a      	bra.w 20c6 <PrepareDisplay+0x86>

0000217e <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    217e:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    2182:	262f 0010      	move.l 16(sp),d3
    2186:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    218a:	2279 0000 560e 	movea.l 560e <Copperlist1>,a1
    2190:	b2fc 0000      	cmpa.w #0,a1
    2194:	670c           	beq.s 21a2 <FreeDisplay+0x24>
    2196:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    219c:	2003           	move.l d3,d0
    219e:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    21a2:	2279 0000 560a 	movea.l 560a <Copperlist2>,a1
    21a8:	b2fc 0000      	cmpa.w #0,a1
    21ac:	670c           	beq.s 21ba <FreeDisplay+0x3c>
    21ae:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    21b4:	2003           	move.l d3,d0
    21b6:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    21ba:	2279 0000 5606 	movea.l 5606 <Bitplane1>,a1
    21c0:	b2fc 0000      	cmpa.w #0,a1
    21c4:	670c           	beq.s 21d2 <FreeDisplay+0x54>
    21c6:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    21cc:	2002           	move.l d2,d0
    21ce:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    21d2:	2279 0000 55f6 	movea.l 55f6 <Bitplane2>,a1
    21d8:	b2fc 0000      	cmpa.w #0,a1
    21dc:	670c           	beq.s 21ea <FreeDisplay+0x6c>
    21de:	2c79 0000 5612 	movea.l 5612 <SysBase>,a6
    21e4:	2002           	move.l d2,d0
    21e6:	4eae ff2e      	jsr -210(a6)
}
    21ea:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    21ee:	4e75           	rts

000021f0 <WaitVbl>:
void WaitVbl() {
    21f0:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    21f2:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddc23e>,d0
    21f8:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    21fa:	2017           	move.l (sp),d0
    21fc:	0280 0001 ff00 	andi.l #130816,d0
    2202:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    2204:	2017           	move.l (sp),d0
    2206:	0c80 0001 3700 	cmpi.l #79616,d0
    220c:	67e4           	beq.s 21f2 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    220e:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddc23e>,d0
    2214:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    2218:	202f 0004      	move.l 4(sp),d0
    221c:	0280 0001 ff00 	andi.l #130816,d0
    2222:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    2226:	202f 0004      	move.l 4(sp),d0
    222a:	0c80 0001 3700 	cmpi.l #79616,d0
    2230:	66dc           	bne.s 220e <WaitVbl+0x1e>
}
    2232:	508f           	addq.l #8,sp
    2234:	4e75           	rts

00002236 <memcpy>:
{
    2236:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    223a:	202f 0014      	move.l 20(sp),d0
    223e:	226f 0018      	movea.l 24(sp),a1
    2242:	222f 001c      	move.l 28(sp),d1
	while(len--)
    2246:	2601           	move.l d1,d3
    2248:	5383           	subq.l #1,d3
    224a:	4a81           	tst.l d1
    224c:	6762           	beq.s 22b0 <memcpy+0x7a>
    224e:	2040           	movea.l d0,a0
    2250:	5888           	addq.l #4,a0
    2252:	b1c9           	cmpa.l a1,a0
    2254:	53c2           	sl.s d2
    2256:	4402           	neg.b d2
    2258:	41e9 0004      	lea 4(a1),a0
    225c:	b1c0           	cmpa.l d0,a0
    225e:	53c4           	sl.s d4
    2260:	4404           	neg.b d4
    2262:	8404           	or.b d4,d2
    2264:	7808           	moveq #8,d4
    2266:	b883           	cmp.l d3,d4
    2268:	55c4           	sc.s d4
    226a:	4404           	neg.b d4
    226c:	c404           	and.b d4,d2
    226e:	6746           	beq.s 22b6 <memcpy+0x80>
    2270:	2409           	move.l a1,d2
    2272:	8480           	or.l d0,d2
    2274:	7803           	moveq #3,d4
    2276:	c484           	and.l d4,d2
    2278:	663c           	bne.s 22b6 <memcpy+0x80>
    227a:	2049           	movea.l a1,a0
    227c:	2440           	movea.l d0,a2
    227e:	74fc           	moveq #-4,d2
    2280:	c481           	and.l d1,d2
    2282:	d489           	add.l a1,d2
		*d++ = *s++;
    2284:	24d8           	move.l (a0)+,(a2)+
    2286:	b488           	cmp.l a0,d2
    2288:	66fa           	bne.s 2284 <memcpy+0x4e>
    228a:	74fc           	moveq #-4,d2
    228c:	c481           	and.l d1,d2
    228e:	2040           	movea.l d0,a0
    2290:	d1c2           	adda.l d2,a0
    2292:	d3c2           	adda.l d2,a1
    2294:	9682           	sub.l d2,d3
    2296:	b481           	cmp.l d1,d2
    2298:	6716           	beq.s 22b0 <memcpy+0x7a>
    229a:	1091           	move.b (a1),(a0)
	while(len--)
    229c:	4a83           	tst.l d3
    229e:	6710           	beq.s 22b0 <memcpy+0x7a>
		*d++ = *s++;
    22a0:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    22a6:	5383           	subq.l #1,d3
    22a8:	6706           	beq.s 22b0 <memcpy+0x7a>
		*d++ = *s++;
    22aa:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    22b0:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    22b4:	4e75           	rts
    22b6:	2040           	movea.l d0,a0
    22b8:	d289           	add.l a1,d1
		*d++ = *s++;
    22ba:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    22bc:	b289           	cmp.l a1,d1
    22be:	67f0           	beq.s 22b0 <memcpy+0x7a>
		*d++ = *s++;
    22c0:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    22c2:	b289           	cmp.l a1,d1
    22c4:	66f4           	bne.s 22ba <memcpy+0x84>
    22c6:	60e8           	bra.s 22b0 <memcpy+0x7a>

000022c8 <memset>:
{
    22c8:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    22cc:	202f 0024      	move.l 36(sp),d0
    22d0:	2a2f 0028      	move.l 40(sp),d5
    22d4:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    22d8:	2809           	move.l a1,d4
    22da:	5384           	subq.l #1,d4
    22dc:	b2fc 0000      	cmpa.w #0,a1
    22e0:	6f00 00b0      	ble.w 2392 <memset+0xca>
    22e4:	1e05           	move.b d5,d7
    22e6:	2200           	move.l d0,d1
    22e8:	4481           	neg.l d1
    22ea:	7403           	moveq #3,d2
    22ec:	c282           	and.l d2,d1
    22ee:	7c05           	moveq #5,d6
		*ptr++ = val;
    22f0:	2440           	movea.l d0,a2
    22f2:	bc84           	cmp.l d4,d6
    22f4:	646a           	bcc.s 2360 <memset+0x98>
    22f6:	4a81           	tst.l d1
    22f8:	6724           	beq.s 231e <memset+0x56>
    22fa:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    22fc:	5384           	subq.l #1,d4
    22fe:	7401           	moveq #1,d2
    2300:	b481           	cmp.l d1,d2
    2302:	671a           	beq.s 231e <memset+0x56>
		*ptr++ = val;
    2304:	2440           	movea.l d0,a2
    2306:	548a           	addq.l #2,a2
    2308:	2040           	movea.l d0,a0
    230a:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    230e:	5384           	subq.l #1,d4
    2310:	7403           	moveq #3,d2
    2312:	b481           	cmp.l d1,d2
    2314:	6608           	bne.s 231e <memset+0x56>
		*ptr++ = val;
    2316:	528a           	addq.l #1,a2
    2318:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    231c:	5384           	subq.l #1,d4
    231e:	2609           	move.l a1,d3
    2320:	9681           	sub.l d1,d3
    2322:	7c00           	moveq #0,d6
    2324:	1c05           	move.b d5,d6
    2326:	2406           	move.l d6,d2
    2328:	4842           	swap d2
    232a:	4242           	clr.w d2
    232c:	2042           	movea.l d2,a0
    232e:	2406           	move.l d6,d2
    2330:	e14a           	lsl.w #8,d2
    2332:	4842           	swap d2
    2334:	4242           	clr.w d2
    2336:	e18e           	lsl.l #8,d6
    2338:	2646           	movea.l d6,a3
    233a:	2c08           	move.l a0,d6
    233c:	8486           	or.l d6,d2
    233e:	2c0b           	move.l a3,d6
    2340:	8486           	or.l d6,d2
    2342:	1407           	move.b d7,d2
    2344:	2040           	movea.l d0,a0
    2346:	d1c1           	adda.l d1,a0
    2348:	72fc           	moveq #-4,d1
    234a:	c283           	and.l d3,d1
    234c:	d288           	add.l a0,d1
		*ptr++ = val;
    234e:	20c2           	move.l d2,(a0)+
    2350:	b1c1           	cmpa.l d1,a0
    2352:	66fa           	bne.s 234e <memset+0x86>
    2354:	72fc           	moveq #-4,d1
    2356:	c283           	and.l d3,d1
    2358:	d5c1           	adda.l d1,a2
    235a:	9881           	sub.l d1,d4
    235c:	b283           	cmp.l d3,d1
    235e:	6732           	beq.s 2392 <memset+0xca>
    2360:	1485           	move.b d5,(a2)
	while(len-- > 0)
    2362:	4a84           	tst.l d4
    2364:	6f2c           	ble.s 2392 <memset+0xca>
		*ptr++ = val;
    2366:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    236a:	7201           	moveq #1,d1
    236c:	b284           	cmp.l d4,d1
    236e:	6c22           	bge.s 2392 <memset+0xca>
		*ptr++ = val;
    2370:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    2374:	7402           	moveq #2,d2
    2376:	b484           	cmp.l d4,d2
    2378:	6c18           	bge.s 2392 <memset+0xca>
		*ptr++ = val;
    237a:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    237e:	7c03           	moveq #3,d6
    2380:	bc84           	cmp.l d4,d6
    2382:	6c0e           	bge.s 2392 <memset+0xca>
		*ptr++ = val;
    2384:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    2388:	7204           	moveq #4,d1
    238a:	b284           	cmp.l d4,d1
    238c:	6c04           	bge.s 2392 <memset+0xca>
		*ptr++ = val;
    238e:	1545 0005      	move.b d5,5(a2)
}
    2392:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    2396:	4e75           	rts

00002398 <strlen>:
{
    2398:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    239c:	7000           	moveq #0,d0
	while(*s++)
    239e:	4a10           	tst.b (a0)
    23a0:	6708           	beq.s 23aa <strlen+0x12>
		t++;
    23a2:	5280           	addq.l #1,d0
	while(*s++)
    23a4:	4a30 0800      	tst.b (0,a0,d0.l)
    23a8:	66f8           	bne.s 23a2 <strlen+0xa>
}
    23aa:	4e75           	rts

000023ac <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    23ac:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    23b0:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    23b4:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    23b8:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    23bc:	d041           	add.w d1,d0
	swap	d0
    23be:	4840           	swap d0
	clrw	d0
    23c0:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    23c2:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    23c6:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    23ca:	d081           	add.l d1,d0

	rts
    23cc:	4e75           	rts

000023ce <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    23ce:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    23d0:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    23d4:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    23d8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    23de:	6416           	bcc.s 23f6 <__udivsi3+0x28>
	movel	d0, d2
    23e0:	2400           	move.l d0,d2
	clrw	d2
    23e2:	4242           	clr.w d2
	swap	d2
    23e4:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    23e6:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    23e8:	3002           	move.w d2,d0
	swap	d0
    23ea:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    23ec:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    23f0:	84c1           	divu.w d1,d2
	movew	d2, d0
    23f2:	3002           	move.w d2,d0
	jra	6f
    23f4:	6030           	bra.s 2426 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    23f6:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    23f8:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    23fa:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    23fc:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    2402:	64f4           	bcc.s 23f8 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    2404:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    2406:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    240c:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    240e:	c2c0           	mulu.w d0,d1
	swap	d2
    2410:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    2412:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    2414:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    2416:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    2418:	660a           	bne.s 2424 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    241a:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    241c:	6506           	bcs.s 2424 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    241e:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    2422:	6302           	bls.s 2426 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    2424:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    2426:	241f           	move.l (sp)+,d2
	rts
    2428:	4e75           	rts

0000242a <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    242a:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    242c:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    242e:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    2432:	6a04           	bpl.s 2438 <__divsi3+0xe>
	negl	d1
    2434:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    2436:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    2438:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    243c:	6a04           	bpl.s 2442 <__divsi3+0x18>
	negl	d0
    243e:	4480           	neg.l d0
	negb	d2
    2440:	4402           	neg.b d2

2:	movel	d1, sp@-
    2442:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2444:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    2446:	6186           	bsr.s 23ce <__udivsi3>
	addql	IMM (8), sp
    2448:	508f           	addq.l #8,sp

	tstb	d2
    244a:	4a02           	tst.b d2
	jpl	3f
    244c:	6a02           	bpl.s 2450 <__divsi3+0x26>
	negl	d0
    244e:	4480           	neg.l d0

3:	movel	sp@+, d2
    2450:	241f           	move.l (sp)+,d2
	rts
    2452:	4e75           	rts

00002454 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    2454:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    2458:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    245c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    245e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    2460:	61c8           	bsr.s 242a <__divsi3>
	addql	IMM (8), sp
    2462:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    2464:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    2468:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    246a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    246c:	6100 ff3e      	bsr.w 23ac <__mulsi3>
	addql	IMM (8), sp
    2470:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    2472:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    2476:	9280           	sub.l d0,d1
	movel	d1, d0
    2478:	2001           	move.l d1,d0
	rts
    247a:	4e75           	rts

0000247c <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    247c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    2480:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    2484:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2486:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    2488:	6100 ff44      	bsr.w 23ce <__udivsi3>
	addql	IMM (8), sp
    248c:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    248e:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    2492:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2494:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    2496:	6100 ff14      	bsr.w 23ac <__mulsi3>
	addql	IMM (8), sp
    249a:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    249c:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    24a0:	9280           	sub.l d0,d1
	movel	d1, d0
    24a2:	2001           	move.l d1,d0
	rts
    24a4:	4e75           	rts

000024a6 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    24a6:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    24a8:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    24ac:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    24b0:	2c5f           	movea.l (sp)+,a6
    rts
    24b2:	4e75           	rts

000024b4 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    24b4:	16c0           	move.b d0,(a3)+
	rts
    24b6:	4e75           	rts

000024b8 <saveregs>:
	...

000024f4 <font2distance>:
    24f4:	0505           	btst d2,d5
    24f6:	0505           	btst d2,d5
    24f8:	0505           	btst d2,d5
    24fa:	0505           	btst d2,d5
    24fc:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    24fe:	0505           	btst d2,d5
    2500:	0505           	btst d2,d5
    2502:	0005 0505      	ori.b #5,d5
    2506:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    2508:	0505           	btst d2,d5
    250a:	0505           	btst d2,d5
    250c:	0505           	btst d2,d5
    250e:	0505           	btst d2,d5
    2510:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    2512:	0505           	btst d2,d5
    2514:	0505           	btst d2,d5
    2516:	0505           	btst d2,d5
    2518:	0505           	btst d2,d5
    251a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    251c:	0500           	btst d2,d0
    251e:	0505           	btst d2,d5
    2520:	0505           	btst d2,d5
    2522:	0505           	btst d2,d5
    2524:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    2526:	0505           	btst d2,d5
    2528:	0505           	btst d2,d5
    252a:	0505           	btst d2,d5
    252c:	0505           	btst d2,d5
    252e:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    2530:	0505           	btst d2,d5
    2532:	0505           	btst d2,d5
    2534:	0503           	btst d2,d3
    2536:	0505           	btst d2,d5
    2538:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    253a:	0505           	btst d2,d5
    253c:	0500           	btst d2,d0
    253e:	0505           	btst d2,d5
    2540:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    2544:	0505           	btst d2,d5
    2546:	0503           	btst d2,d3
    2548:	0205 0507      	andi.b #7,d5
    254c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    254e:	0505           	btst d2,d5
    2550:	0505           	btst d2,d5
    2552:	0505           	btst d2,d5
    2554:	0505           	btst d2,d5
    2556:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2558:	0505           	btst d2,d5
    255a:	0505           	btst d2,d5
    255c:	0505           	btst d2,d5
    255e:	0505           	btst d2,d5
    2560:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2562:	0505           	btst d2,d5
    2564:	0505           	btst d2,d5
    2566:	0505           	btst d2,d5
    2568:	0505           	btst d2,d5
    256a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    256c:	0505           	btst d2,d5
    256e:	0505           	btst d2,d5
    2570:	0505           	btst d2,d5
    2572:	0505           	btst d2,d5
    2574:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2576:	0505           	btst d2,d5
    2578:	0505           	btst d2,d5
    257a:	0505           	btst d2,d5
    257c:	0505           	btst d2,d5
    257e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2580:	0505           	btst d2,d5
    2582:	0505           	btst d2,d5
    2584:	0505           	btst d2,d5
    2586:	0505           	btst d2,d5
    2588:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    258a:	0505           	btst d2,d5
    258c:	0505           	btst d2,d5
    258e:	0505           	btst d2,d5
    2590:	0505           	btst d2,d5
    2592:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2594:	0505           	btst d2,d5
    2596:	0505           	btst d2,d5
    2598:	0505           	btst d2,d5
    259a:	0505           	btst d2,d5
    259c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    259e:	0505           	btst d2,d5
    25a0:	0505           	btst d2,d5
    25a2:	0505           	btst d2,d5
    25a4:	0505           	btst d2,d5
    25a6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25a8:	0505           	btst d2,d5
    25aa:	0505           	btst d2,d5
    25ac:	0505           	btst d2,d5
    25ae:	0505           	btst d2,d5
    25b0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25b2:	0505           	btst d2,d5
    25b4:	0505           	btst d2,d5
    25b6:	0505           	btst d2,d5
    25b8:	0505           	btst d2,d5
    25ba:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25bc:	0505           	btst d2,d5
    25be:	0505           	btst d2,d5
    25c0:	0505           	btst d2,d5
    25c2:	0505           	btst d2,d5
    25c4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25c6:	0505           	btst d2,d5
    25c8:	0505           	btst d2,d5
    25ca:	0505           	btst d2,d5
    25cc:	0505           	btst d2,d5
    25ce:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25d0:	0505           	btst d2,d5
    25d2:	0505           	btst d2,d5
    25d4:	0505           	btst d2,d5
    25d6:	0505           	btst d2,d5
    25d8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25da:	0505           	btst d2,d5
    25dc:	0505           	btst d2,d5
    25de:	0505           	btst d2,d5
    25e0:	0505           	btst d2,d5
    25e2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25e4:	0505           	btst d2,d5
    25e6:	0505           	btst d2,d5
    25e8:	0505           	btst d2,d5
    25ea:	0505           	btst d2,d5
    25ec:	0505           	btst d2,d5

000025ee <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    25ee:	16c0           	move.b d0,(a3)+
  RTS
    25f0:	4e75           	rts

000025f2 <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    25f2:	48f9 7fff 0000 	movem.l d0-a6,24b8 <saveregs>
    25f8:	24b8 
  lea 0xdff000,a5
    25fa:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddc23a>,a5
  move.l sp@(4),a0  //Fontlocation
    2600:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    2604:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    2608:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    260c:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    260e:	082d 0006 0002 	btst #6,2(a5)

00002614 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    2614:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    261a:	66f8           	bne.s 2614 <st2wblit>

0000261c <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    261c:	7019           	moveq #25,d0
	sub.l d5,d5      
    261e:	9a85           	sub.l d5,d5

00002620 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    2620:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    2622:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    2624:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    2628:	9dce           	suba.l a6,a6
	move.l d2, a6
    262a:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    262c:	ddfc 0000 24f4 	adda.l #9460,a6

	LSL  	#4,d2 	    //Fetch next char
    2632:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    2634:	2842           	movea.l d2,a4


	move.l  #0,d4
    2636:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    2638:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    263a:	3814           	move.w (a4),d4
	swap	d4
    263c:	4844           	swap d4
	lsr.l	d5, d4
    263e:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    2640:	8993           	or.l d4,(a3)
	clr.l	d4
    2642:	4284           	clr.l d4
	move.w  2(a4), d4
    2644:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    2648:	4844           	swap d4
	lsr.l	d5, d4
    264a:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    264c:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    2650:	4284           	clr.l d4
	move.w  4(a4), d4
    2652:	382c 0004      	move.w 4(a4),d4
	swap	d4
    2656:	4844           	swap d4
	lsr.l	d5, d4
    2658:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    265a:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    265e:	4284           	clr.l d4
	move.w  6(a4), d4
    2660:	382c 0006      	move.w 6(a4),d4
	swap	d4
    2664:	4844           	swap d4
	lsr.l	d5, d4
    2666:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    2668:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    266c:	4284           	clr.l d4
	move.w  8(a4), d4
    266e:	382c 0008      	move.w 8(a4),d4
	swap	d4
    2672:	4844           	swap d4
	lsr.l	d5, d4
    2674:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    2676:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    267a:	4284           	clr.l d4
	move.w  10(a4), d4
    267c:	382c 000a      	move.w 10(a4),d4
	swap	d4
    2680:	4844           	swap d4
	lsr.l	d5, d4
    2682:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    2684:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    2688:	4284           	clr.l d4
	move.w  12(a4), d4
    268a:	382c 000c      	move.w 12(a4),d4
	swap	d4
    268e:	4844           	swap d4
	lsr.l	d5, d4
    2690:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    2692:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    2696:	4284           	clr.l d4
	move.w  14(a4), d4
    2698:	382c 000e      	move.w 14(a4),d4
	swap	d4
    269c:	4844           	swap d4
	lsr.l	d5, d4
    269e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    26a0:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    26a4:	4284           	clr.l d4

	add.b   (a6), d5
    26a6:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    26a8:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    26ac:	6500 0006      	bcs.w 26b4 <noadditionalchar>
	addq.w  #1, a3
    26b0:	524b           	addq.w #1,a3
	sub.w   #8,d5
    26b2:	5145           	subq.w #8,d5

000026b4 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    26b4:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    26b6:	51c8 ff68      	dbf d0,2620 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    26ba:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    26be:	51cb ff5c      	dbf d3,261c <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    26c2:	4cfa 7fff fdf2 	movem.l 24b8 <saveregs>(pc),d0-a6

	RTS
    26c8:	4e75           	rts
