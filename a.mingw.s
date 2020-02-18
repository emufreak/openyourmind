
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
       6:	4e55 ff84      	link.w a5,#-124
       a:	48e7 3f3a      	movem.l d2-d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 5a0a 	move.l a6,5a0a <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,59e2 <hw>
      1e:	0000 59e2 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 3164 	lea 3164 <incbin_swfont_end+0xe6>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 59de 	move.l d0,59de <GfxBase>
	if (!GfxBase)
      34:	6700 141c      	beq.w 1452 <main+0x144c>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
      3e:	43f9 0000 3175 	lea 3175 <incbin_swfont_end+0xf7>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 5a06 	move.l d0,5a06 <DOSBase>
	if (!DOSBase)
      50:	6700 13f4      	beq.w 1446 <main+0x1440>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 3181 	pea 3181 <incbin_swfont_end+0x103>
      5a:	4eb9 0000 1a8c 	jsr 1a8c <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 319d 	move.l #12701,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 31ad 	move.l #12717,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 1ce8 	lea 1ce8 <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 5a02 	move.l d0,5a02 <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 59f2 	move.l d0,59f2 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 59fe 	move.l d0,59fe <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 59e6 	move.l d0,59e6 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 591c 	cmp.l 591c <ClsSprites>,d0
      d2:	6600 141c      	bne.w 14f0 <main+0x14ea>
      d6:	222a 0004      	move.l 4(a2),d1
      da:	b2b9 0000 5920 	cmp.l 5920 <ClsSprites+0x4>,d1
      e0:	6600 140e      	bne.w 14f0 <main+0x14ea>
      e4:	2c2a 0008      	move.l 8(a2),d6
      e8:	bcb9 0000 5924 	cmp.l 5924 <ClsSprites+0x8>,d6
      ee:	6600 1400      	bne.w 14f0 <main+0x14ea>
      f2:	206a 000c      	movea.l 12(a2),a0
      f6:	b1f9 0000 5928 	cmpa.l 5928 <ClsSprites+0xc>,a0
      fc:	6600 13f2      	bne.w 14f0 <main+0x14ea>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 592c 	cmp.l 592c <ClsSprites+0x10>,d0
     10a:	6600 13e4      	bne.w 14f0 <main+0x14ea>
     10e:	222a 0014      	move.l 20(a2),d1
     112:	b2b9 0000 5930 	cmp.l 5930 <ClsSprites+0x14>,d1
     118:	6600 13d6      	bne.w 14f0 <main+0x14ea>
     11c:	2c2a 0018      	move.l 24(a2),d6
     120:	bcb9 0000 5934 	cmp.l 5934 <ClsSprites+0x18>,d6
     126:	6600 13c8      	bne.w 14f0 <main+0x14ea>
     12a:	206a 001c      	movea.l 28(a2),a0
     12e:	b1f9 0000 5938 	cmpa.l 5938 <ClsSprites+0x1c>,a0
     134:	6600 13ba      	bne.w 14f0 <main+0x14ea>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 593c 	cmp.l 593c <ClsSprites+0x20>,d0
     142:	6600 13ac      	bne.w 14f0 <main+0x14ea>
     146:	222a 0024      	move.l 36(a2),d1
     14a:	b2b9 0000 5940 	cmp.l 5940 <ClsSprites+0x24>,d1
     150:	6600 139e      	bne.w 14f0 <main+0x14ea>
     154:	2c2a 0028      	move.l 40(a2),d6
     158:	bcb9 0000 5944 	cmp.l 5944 <ClsSprites+0x28>,d6
     15e:	6600 1390      	bne.w 14f0 <main+0x14ea>
     162:	206a 002c      	movea.l 44(a2),a0
     166:	b1f9 0000 5948 	cmpa.l 5948 <ClsSprites+0x2c>,a0
     16c:	6600 1382      	bne.w 14f0 <main+0x14ea>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 594c 	cmp.l 594c <ClsSprites+0x30>,d0
     17a:	6600 1374      	bne.w 14f0 <main+0x14ea>
     17e:	222a 0034      	move.l 52(a2),d1
     182:	b2b9 0000 5950 	cmp.l 5950 <ClsSprites+0x34>,d1
     188:	6600 1366      	bne.w 14f0 <main+0x14ea>
     18c:	2c2a 0038      	move.l 56(a2),d6
     190:	bcb9 0000 5954 	cmp.l 5954 <ClsSprites+0x38>,d6
     196:	6600 1358      	bne.w 14f0 <main+0x14ea>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 5958 	cmpa.l 5958 <ClsSprites+0x3c>,a2
     1a4:	6600 134a      	bne.w 14f0 <main+0x14ea>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 5a02 	movea.l 5a02 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2028 0040      	move.l 64(a0),d0
     1b2:	b0b9 0000 58ec 	cmp.l 58ec <ClScreen>,d0
     1b8:	6600 12ea      	bne.w 14a4 <main+0x149e>
     1bc:	2228 0044      	move.l 68(a0),d1
     1c0:	b2b9 0000 58f0 	cmp.l 58f0 <ClScreen+0x4>,d1
     1c6:	6600 12dc      	bne.w 14a4 <main+0x149e>
     1ca:	2c39 0000 58f4 	move.l 58f4 <ClScreen+0x8>,d6
     1d0:	bca8 0048      	cmp.l 72(a0),d6
     1d4:	6600 12ce      	bne.w 14a4 <main+0x149e>
     1d8:	2028 004c      	move.l 76(a0),d0
     1dc:	b0b9 0000 58f8 	cmp.l 58f8 <ClScreen+0xc>,d0
     1e2:	6600 12c0      	bne.w 14a4 <main+0x149e>
     1e6:	2239 0000 58fc 	move.l 58fc <ClScreen+0x10>,d1
     1ec:	b2a8 0050      	cmp.l 80(a0),d1
     1f0:	6600 12b2      	bne.w 14a4 <main+0x149e>
     1f4:	2c39 0000 5900 	move.l 5900 <ClScreen+0x14>,d6
     1fa:	bca8 0054      	cmp.l 84(a0),d6
     1fe:	6600 12a4      	bne.w 14a4 <main+0x149e>
     202:	2028 0058      	move.l 88(a0),d0
     206:	b0b9 0000 5904 	cmp.l 5904 <ClScreen+0x18>,d0
     20c:	6600 1296      	bne.w 14a4 <main+0x149e>
     210:	2239 0000 5908 	move.l 5908 <ClScreen+0x1c>,d1
     216:	b2a8 005c      	cmp.l 92(a0),d1
     21a:	6600 1288      	bne.w 14a4 <main+0x149e>
     21e:	2c28 0060      	move.l 96(a0),d6
     222:	bcb9 0000 590c 	cmp.l 590c <ClScreen+0x20>,d6
     228:	6600 127a      	bne.w 14a4 <main+0x149e>
     22c:	2028 0064      	move.l 100(a0),d0
     230:	b0b9 0000 5910 	cmp.l 5910 <ClScreen+0x24>,d0
     236:	6600 126c      	bne.w 14a4 <main+0x149e>
     23a:	2228 0068      	move.l 104(a0),d1
     23e:	b2b9 0000 5914 	cmp.l 5914 <ClScreen+0x28>,d1
     244:	6600 125e      	bne.w 14a4 <main+0x149e>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 5918 	cmpa.l 5918 <ClScreen+0x2c>,a0
     252:	6600 1250      	bne.w 14a4 <main+0x149e>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     256:	23fc 0004 0000 	move.l #262144,59f6 <DrawBuffer>
     25c:	0000 59f6 
  ViewBuffer = (ULONG *)0x50000;
     260:	23fc 0005 0000 	move.l #327680,59ea <ViewBuffer>
     266:	0000 59ea 
  SetBplPointers();
     26a:	45f9 0000 2418 	lea 2418 <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,59f6 <DrawBuffer>
     278:	0000 59f6 
     27c:	6700 1198      	beq.w 1416 <main+0x1410>
    Write( Output(), 
     280:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 31b0 	move.l #12720,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     29e:	2079 0000 5a02 	movea.l 5a02 <Copperlist1>,a0
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 31ec 	move.l #12780,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 5a02 	movea.l 5a02 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 3229 	move.l #12841,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 5a02 	movea.l 5a02 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2c28 0078      	move.l 120(a0),d6
     304:	bcb9 0000 58e4 	cmp.l 58e4 <ClColor>,d6
     30a:	6600 1170      	bne.w 147c <main+0x1476>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 58e8 	cmp.l 58e8 <ClColor+0x4>,d0
     318:	6600 1162      	bne.w 147c <main+0x1476>
  if( instructions[pos] == value ) 
     31c:	72fe           	moveq #-2,d1
     31e:	b2a8 0080      	cmp.l 128(a0),d1
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 3288 	move.l #12936,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 2210 	lea 2210 <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2c39 0000 59f2 	move.l 59f2 <DrawCopper>,d6
     350:	bcb9 0000 59fe 	cmp.l 59fe <Copperlist2>,d6
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 32ab 	move.l #12971,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 2444 	lea 2444 <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2079 0000 59f6 	movea.l 59f6 <DrawBuffer>,a0
     384:	b1f9 0000 59fa 	cmpa.l 59fa <Bitplane1>,a0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 32c1 	move.l #12993,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2039 0000 59f2 	move.l 59f2 <DrawCopper>,d0
     3b0:	b0b9 0000 5a02 	cmp.l 5a02 <Copperlist1>,d0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 32f9 	move.l #13049,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2239 0000 59ea 	move.l 59ea <ViewBuffer>,d1
     3de:	b2b9 0000 59ee 	cmp.l 59ee <Bitplane2>,d1
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 3333 	move.l #13107,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2c39 0000 59e6 	move.l 59e6 <ViewCopper>,d6
     40a:	bcb9 0000 59fe 	cmp.l 59fe <Copperlist2>,d6
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 336c 	move.l #13164,d2
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
     434:	2079 0000 59e6 	movea.l 59e6 <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     44c:	b0b9 0000 59ee 	cmp.l 59ee <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 33a7 	move.l #13223,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     476:	2079 0000 59e6 	movea.l 59e6 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     48e:	b0b9 0000 59fa 	cmp.l 59fa <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 33f0 	move.l #13296,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4b8:	2079 0000 59e6 	movea.l 59e6 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4d0:	b0b9 0000 59ee 	cmp.l 59ee <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 343a 	move.l #13370,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	4eb9 0000 2582 	jsr 2582 <FreeDisplay>
  TestZoom4Picture();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     506:	47f9 0000 2236 	lea 2236 <PrepareDisplayZoom>,a3
     50c:	4e93           	jsr (a3)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     50e:	4878 0010      	pea 10 <main+0xa>
     512:	4879 0000 591c 	pea 591c <ClsSprites>
     518:	42a7           	clr.l -(sp)
     51a:	2f39 0000 5a02 	move.l 5a02 <Copperlist1>,-(sp)
     520:	4eb9 0000 1b12 	jsr 1b12 <TestCopperlistBatch>
     526:	4fef 0018      	lea 24(sp),sp
     52a:	4a80           	tst.l d0
     52c:	661e           	bne.s 54c <main+0x546>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     52e:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     534:	4eae ffc4      	jsr -60(a6)
     538:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     53e:	2200           	move.l d0,d1
     540:	243c 0000 3483 	move.l #13443,d2
     546:	762c           	moveq #44,d3
     548:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     54c:	4878 000c      	pea c <main+0x6>
     550:	4879 0000 58b4 	pea 58b4 <ClScreenZoom>
     556:	4878 0010      	pea 10 <main+0xa>
     55a:	2f39 0000 5a02 	move.l 5a02 <Copperlist1>,-(sp)
     560:	4eb9 0000 1b12 	jsr 1b12 <TestCopperlistBatch>
     566:	4fef 0010      	lea 16(sp),sp
     56a:	4a80           	tst.l d0
     56c:	661e           	bne.s 58c <main+0x586>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     56e:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     574:	4eae ffc4      	jsr -60(a6)
     578:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     57e:	2200           	move.l d0,d1
     580:	243c 0000 34b9 	move.l #13497,d2
     586:	7636           	moveq #54,d3
     588:	4eae ffd0      	jsr -48(a6)
  }
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     58c:	2079 0000 59f2 	movea.l 59f2 <DrawCopper>,a0
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
     5a8:	23fc 0005 0000 	move.l #327680,59f6 <DrawBuffer>
     5ae:	0000 59f6 
  ViewBuffer = (ULONG *) tmp;
     5b2:	23fc 0004 0000 	move.l #262144,59ea <ViewBuffer>
     5b8:	0000 59ea 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5bc:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c2:	4878 001c      	pea 1c <main+0x16>
     5c6:	2f39 0000 5a02 	move.l 5a02 <Copperlist1>,-(sp)
     5cc:	4eb9 0000 1af4 	jsr 1af4 <TestCopperlistPos>
     5d2:	4fef 000c      	lea 12(sp),sp
     5d6:	4a80           	tst.l d0
     5d8:	661e           	bne.s 5f8 <main+0x5f2>
    Write(Output(), 
     5da:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     5e0:	4eae ffc4      	jsr -60(a6)
     5e4:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     5ea:	2200           	move.l d0,d1
     5ec:	243c 0000 31ec 	move.l #12780,d2
     5f2:	763c           	moveq #60,d3
     5f4:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     5f8:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     5fe:	4878 001d      	pea 1d <main+0x17>
     602:	2f39 0000 5a02 	move.l 5a02 <Copperlist1>,-(sp)
     608:	4eb9 0000 1af4 	jsr 1af4 <TestCopperlistPos>
     60e:	4fef 000c      	lea 12(sp),sp
     612:	4a80           	tst.l d0
     614:	661e           	bne.s 634 <main+0x62e>
    Write(Output(), 
     616:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     61c:	4eae ffc4      	jsr -60(a6)
     620:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     626:	2200           	move.l d0,d1
     628:	243c 0000 3229 	move.l #12841,d2
     62e:	763c           	moveq #60,d3
     630:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     634:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     63a:	4878 001e      	pea 1e <main+0x18>
     63e:	2f39 0000 5a02 	move.l 5a02 <Copperlist1>,-(sp)
     644:	4eb9 0000 1af4 	jsr 1af4 <TestCopperlistPos>
     64a:	4fef 000c      	lea 12(sp),sp
     64e:	4a80           	tst.l d0
     650:	661e           	bne.s 670 <main+0x66a>
    Write(Output(), 
     652:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     658:	4eae ffc4      	jsr -60(a6)
     65c:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     662:	2200           	move.l d0,d1
     664:	243c 0000 34f0 	move.l #13552,d2
     66a:	763c           	moveq #60,d3
     66c:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     670:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     676:	4878 001f      	pea 1f <main+0x19>
     67a:	2f39 0000 5a02 	move.l 5a02 <Copperlist1>,-(sp)
     680:	4eb9 0000 1af4 	jsr 1af4 <TestCopperlistPos>
     686:	4fef 000c      	lea 12(sp),sp
     68a:	4a80           	tst.l d0
     68c:	661e           	bne.s 6ac <main+0x6a6>
    Write(Output(), 
     68e:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     694:	4eae ffc4      	jsr -60(a6)
     698:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     69e:	2200           	move.l d0,d1
     6a0:	243c 0000 352d 	move.l #13613,d2
     6a6:	763c           	moveq #60,d3
     6a8:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6ac:	4878 0002      	pea 2 <_start+0x2>
     6b0:	4879 0000 58e4 	pea 58e4 <ClColor>
     6b6:	4878 0020      	pea 20 <main+0x1a>
     6ba:	2f39 0000 5a02 	move.l 5a02 <Copperlist1>,-(sp)
     6c0:	4eb9 0000 1b12 	jsr 1b12 <TestCopperlistBatch>
     6c6:	4fef 0010      	lea 16(sp),sp
     6ca:	4a80           	tst.l d0
     6cc:	661e           	bne.s 6ec <main+0x6e6>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6ce:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     6d4:	4eae ffc4      	jsr -60(a6)
     6d8:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     6de:	2200           	move.l d0,d1
     6e0:	243c 0000 3266 	move.l #12902,d2
     6e6:	7621           	moveq #33,d3
     6e8:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6ec:	4878 0040      	pea 40 <main+0x3a>
     6f0:	4879 0000 3872 	pea 3872 <incbin_swfont_end+0x7f4>
     6f6:	486d ff9c      	pea -100(a5)
     6fa:	4eb9 0000 263a 	jsr 263a <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     700:	4878 0010      	pea 10 <main+0xa>
     704:	486d ff9c      	pea -100(a5)
     708:	4878 0022      	pea 22 <main+0x1c>
     70c:	2f39 0000 5a02 	move.l 5a02 <Copperlist1>,-(sp)
     712:	4eb9 0000 1b12 	jsr 1b12 <TestCopperlistBatch>
     718:	4fef 001c      	lea 28(sp),sp
     71c:	4a80           	tst.l d0
     71e:	661e           	bne.s 73e <main+0x738>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     720:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     726:	4eae ffc4      	jsr -60(a6)
     72a:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     730:	2200           	move.l d0,d1
     732:	243c 0000 356a 	move.l #13674,d2
     738:	7621           	moveq #33,d3
     73a:	4eae ffd0      	jsr -48(a6)

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     73e:	2b7c 2d07 fffe 	move.l #755499006,-112(a5)
     744:	ff90 
     746:	2b7c 0182 00f0 	move.l #25297136,-108(a5)
     74c:	ff94 
     74e:	2b7c 0182 0f00 	move.l #25300736,-104(a5)
     754:	ff98 

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
     756:	4878 0003      	pea 3 <_start+0x3>
     75a:	486d ff90      	pea -112(a5)
     75e:	4878 004b      	pea 4b <main+0x45>
     762:	2f39 0000 5a02 	move.l 5a02 <Copperlist1>,-(sp)
     768:	4eb9 0000 1b12 	jsr 1b12 <TestCopperlistBatch>
     76e:	4fef 0010      	lea 16(sp),sp
     772:	4a80           	tst.l d0
     774:	661e           	bne.s 794 <main+0x78e>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     776:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     77c:	4eae ffc4      	jsr -60(a6)
     780:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     786:	2200           	move.l d0,d1
     788:	243c 0000 358c 	move.l #13708,d2
     78e:	762c           	moveq #44,d3
     790:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     794:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdd027>
     798:	4878 2922      	pea 2922 <font2distance+0x2a>
     79c:	2f39 0000 5a02 	move.l 5a02 <Copperlist1>,-(sp)
     7a2:	4eb9 0000 1af4 	jsr 1af4 <TestCopperlistPos>
     7a8:	4fef 000c      	lea 12(sp),sp
     7ac:	4a80           	tst.l d0
     7ae:	661e           	bne.s 7ce <main+0x7c8>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     7b0:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     7b6:	4eae ffc4      	jsr -60(a6)
     7ba:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     7c0:	2200           	move.l d0,d1
     7c2:	243c 0000 3288 	move.l #12936,d2
     7c8:	7622           	moveq #34,d3
     7ca:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7ce:	2f3c 0001 6800 	move.l #92160,-(sp)
     7d4:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7da:	4eb9 0000 2582 	jsr 2582 <FreeDisplay>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7e0:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
     7e6:	7004           	moveq #4,d0
     7e8:	7202           	moveq #2,d1
     7ea:	4eae ff3a      	jsr -198(a6)

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     7ee:	4e93           	jsr (a3)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7f0:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
     7f6:	203c 0000 c800 	move.l #51200,d0
     7fc:	7202           	moveq #2,d1
     7fe:	4eae ff3a      	jsr -198(a6)
     802:	2440           	movea.l d0,a2
     804:	23c0 0000 59c8 	move.l d0,59c8 <Zoom_Source>
  if( Zoom_Source == 0) {
     80a:	508f           	addq.l #8,sp
     80c:	6700 1048      	beq.w 1856 <main+0x1850>
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
     82e:	2439 0000 59f6 	move.l 59f6 <DrawBuffer>,d2
    srca = source + 1;
     834:	2600           	move.l d0,d3
     836:	5483           	addq.l #2,d3
  WaitBlit();
     838:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
     83e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     842:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
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
  hw->bltapt = srca;
     878:	2143 0050      	move.l d3,80(a0)
  hw->bltbpt = srcb;
     87c:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = destination;
     880:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = height*64+2;
     884:	317c 2002 0058 	move.w #8194,88(a0)
  WaitBlit();
     88a:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
     890:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     894:	2479 0000 59f6 	movea.l 59f6 <DrawBuffer>,a2
  if( *destination != 0x0180) {
     89a:	0c6a 0180 0002 	cmpi.w #384,2(a2)
     8a0:	671e           	beq.s 8c0 <main+0x8ba>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
     8a2:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     8a8:	4eae ffc4      	jsr -60(a6)
     8ac:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     8b2:	2200           	move.l d0,d1
     8b4:	243c 0000 35f1 	move.l #13809,d2
     8ba:	761c           	moveq #28,d3
     8bc:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8c0:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
     8c6:	671e           	beq.s 8e6 <main+0x8e0>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
     8c8:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     8ce:	4eae ffc4      	jsr -60(a6)
     8d2:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     8d8:	2200           	move.l d0,d1
     8da:	243c 0000 360e 	move.l #13838,d2
     8e0:	761c           	moveq #28,d3
     8e2:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     8e6:	2079 0000 59f6 	movea.l 59f6 <DrawBuffer>,a0
     8ec:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
     8f2:	671e           	beq.s 912 <main+0x90c>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
     8f4:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     8fa:	4eae ffc4      	jsr -60(a6)
     8fe:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     904:	2200           	move.l d0,d1
     906:	243c 0000 362b 	move.l #13867,d2
     90c:	761a           	moveq #26,d3
     90e:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     912:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
     918:	2279 0000 59c8 	movea.l 59c8 <Zoom_Source>,a1
     91e:	203c 0000 c800 	move.l #51200,d0
     924:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     928:	2f3c 0001 6800 	move.l #92160,-(sp)
     92e:	2f3c 0000 a48c 	move.l #42124,-(sp)
     934:	4eb9 0000 2582 	jsr 2582 <FreeDisplay>
     93a:	508f           	addq.l #8,sp
}

void TestCopyColumnOfZoom() {

  PrepareDisplayZoom();
     93c:	4e93           	jsr (a3)

  UWORD *destination = (UWORD *)DrawBuffer;
     93e:	2079 0000 59f6 	movea.l 59f6 <DrawBuffer>,a0
  *destination= 0x0000;
     944:	4250           	clr.w (a0)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     946:	317c 000f 0030 	move.w #15,48(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     94c:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     952:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
     958:	203c 0000 c800 	move.l #51200,d0
     95e:	7202           	moveq #2,d1
     960:	4eae ff3a      	jsr -198(a6)
     964:	2440           	movea.l d0,a2
     966:	23c0 0000 59c8 	move.l d0,59c8 <Zoom_Source>
  if( Zoom_Source == 0) {
     96c:	6700 0ec6      	beq.w 1834 <main+0x182e>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }

  UWORD *tstsource = Zoom_Source;
  *tstsource = 0xffff;
     970:	34bc ffff      	move.w #-1,(a2)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     974:	357c ffff 0030 	move.w #-1,48(a2)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0xc000;
     97a:	357c c000 47d0 	move.w #-16384,18384(a2)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 1, 1);
     980:	2439 0000 59f6 	move.l 59f6 <DrawBuffer>,d2
  WaitBlit();
     986:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
     98c:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     990:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
     996:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     99c:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     9a2:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     9a8:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     9ae:	317c 002e 0064 	move.w #46,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     9b4:	317c 002e 0062 	move.w #46,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     9ba:	317c 002e 0066 	move.w #46,102(a0)
  hw->bltcdat = bltmask;
     9c0:	317c 4000 0070 	move.w #16384,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     9c6:	214a 0050      	move.l a2,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     9ca:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     9ce:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     9d2:	317c 6001 0058 	move.w #24577,88(a0)
  
  WaitBlit();
     9d8:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
     9de:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     9e2:	2479 0000 59f6 	movea.l 59f6 <DrawBuffer>,a2
  if( *destination != 0x4000)
     9e8:	0c52 4000      	cmpi.w #16384,(a2)
     9ec:	671e           	beq.s a0c <main+0xa06>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     9ee:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     9f4:	4eae ffc4      	jsr -60(a6)
     9f8:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     9fe:	2200           	move.l d0,d1
     a00:	243c 0000 3646 	move.l #13894,d2
     a06:	7629           	moveq #41,d3
     a08:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x400f)
     a0c:	0c6a 400f 0030 	cmpi.w #16399,48(a2)
     a12:	671e           	beq.s a32 <main+0xa2c>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     a14:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     a1a:	4eae ffc4      	jsr -60(a6)
     a1e:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     a24:	2200           	move.l d0,d1
     a26:	243c 0000 3670 	move.l #13936,d2
     a2c:	762a           	moveq #42,d3
     a2e:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     a32:	2479 0000 59f6 	movea.l 59f6 <DrawBuffer>,a2
     a38:	0c6a 400f 47d0 	cmpi.w #16399,18384(a2)
     a3e:	6724           	beq.s a64 <main+0xa5e>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     a40:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     a46:	4eae ffc4      	jsr -60(a6)
     a4a:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     a50:	2200           	move.l d0,d1
     a52:	243c 0000 369b 	move.l #13979,d2
     a58:	7628           	moveq #40,d3
     a5a:	4eae ffd0      	jsr -48(a6)
     a5e:	2479 0000 59f6 	movea.l 59f6 <DrawBuffer>,a2

  destination = (UWORD *)DrawBuffer;
  *destination= 0x0000;
     a64:	4252           	clr.w (a2)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     a66:	357c 000f 0030 	move.w #15,48(a2)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     a6c:	357c 000f 47d0 	move.w #15,18384(a2)

  tstsource = Zoom_Source;
     a72:	2679 0000 59c8 	movea.l 59c8 <Zoom_Source>,a3
  *tstsource = 0xffff;
     a78:	36bc ffff      	move.w #-1,(a3)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     a7c:	377c ffff 0030 	move.w #-1,48(a3)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0x8000;
     a82:	377c 8000 47d0 	move.w #-32768,18384(a3)
  WaitBlit();
     a88:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
     a8e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     a92:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
     a98:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     a9e:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     aa4:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     aaa:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     ab0:	317c 002e 0064 	move.w #46,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     ab6:	317c 002e 0062 	move.w #46,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     abc:	317c 002e 0066 	move.w #46,102(a0)
  hw->bltcdat = bltmask;
     ac2:	317c 8000 0070 	move.w #-32768,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     ac8:	214b 0050      	move.l a3,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     acc:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     ad0:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     ad4:	317c 6001 0058 	move.w #24577,88(a0)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 0, 0);
  
  WaitBlit();
     ada:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
     ae0:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     ae4:	2479 0000 59f6 	movea.l 59f6 <DrawBuffer>,a2
  if( *destination != 0x8000)
     aea:	0c52 8000      	cmpi.w #-32768,(a2)
     aee:	671e           	beq.s b0e <main+0xb08>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     af0:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     af6:	4eae ffc4      	jsr -60(a6)
     afa:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     b00:	2200           	move.l d0,d1
     b02:	243c 0000 36c4 	move.l #14020,d2
     b08:	7628           	moveq #40,d3
     b0a:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x800f)
     b0e:	0c6a 800f 0030 	cmpi.w #-32753,48(a2)
     b14:	671e           	beq.s b34 <main+0xb2e>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     b16:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     b1c:	4eae ffc4      	jsr -60(a6)
     b20:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     b26:	2200           	move.l d0,d1
     b28:	243c 0000 36ed 	move.l #14061,d2
     b2e:	7629           	moveq #41,d3
     b30:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     b34:	2079 0000 59f6 	movea.l 59f6 <DrawBuffer>,a0
     b3a:	0c68 800f 47d0 	cmpi.w #-32753,18384(a0)
     b40:	671e           	beq.s b60 <main+0xb5a>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     b42:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     b48:	4eae ffc4      	jsr -60(a6)
     b4c:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     b52:	2200           	move.l d0,d1
     b54:	243c 0000 3717 	move.l #14103,d2
     b5a:	7627           	moveq #39,d3
     b5c:	4eae ffd0      	jsr -48(a6)

  FreeMem( Zoom_Source, 40*256*5);
     b60:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
     b66:	2279 0000 59c8 	movea.l 59c8 <Zoom_Source>,a1
     b6c:	203c 0000 c800 	move.l #51200,d0
     b72:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     b76:	2f3c 0001 6800 	move.l #92160,-(sp)
     b7c:	2f3c 0000 a48c 	move.l #42124,-(sp)
     b82:	4eb9 0000 2582 	jsr 2582 <FreeDisplay>
     b88:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     b8a:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
     b90:	203c 0000 05a0 	move.l #1440,d0
     b96:	7202           	moveq #2,d1
     b98:	4eae ff3a      	jsr -198(a6)
     b9c:	2440           	movea.l d0,a2
  if( source == 0) {
     b9e:	4a80           	tst.l d0
     ba0:	6700 0c3a      	beq.w 17dc <main+0x17d6>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     ba4:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
     baa:	203c 0000 05a0 	move.l #1440,d0
     bb0:	7202           	moveq #2,d1
     bb2:	4eae ff3a      	jsr -198(a6)
     bb6:	2640           	movea.l d0,a3
  if( destination == 0) {
     bb8:	4a80           	tst.l d0
     bba:	6700 0c20      	beq.w 17dc <main+0x17d6>
    return;
  }
  
  UWORD *tmp = source;
  for( int i=0; i<8;i++) {
    *tmp++ = 0;
     bbe:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
     bc0:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
     bc6:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
     bcc:	426a 0006      	clr.w 6(a2)
    tmp += ZMLINESIZE/2-3;
    *tmp++ = 0;
     bd0:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
     bd4:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
     bda:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
     be0:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
     be4:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
     be8:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
     bee:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
     bf4:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
     bf8:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
     bfc:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
     c02:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
     c08:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
     c0c:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
     c10:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
     c16:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
     c1c:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
     c20:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
     c24:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
     c2a:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
     c30:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
     c34:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
     c38:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
     c3e:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
     c44:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
     c48:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
     c4c:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
     c52:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
     c58:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
     c5c:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
     c60:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
     c66:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
     c6c:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
     c70:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
     c74:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
     c7a:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
     c80:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
     c84:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
     c88:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
     c8e:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
     c94:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
     c98:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
     c9c:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
     ca2:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
     ca8:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
     cac:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
     cb0:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
     cb6:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
     cbc:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
     cc0:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
     cc4:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
     cca:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
     cd0:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
     cd4:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
     cd8:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
     cde:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
     ce4:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
     ce8:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
     cec:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
     cf2:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
     cf8:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
     cfc:	4878 05a0      	pea 5a0 <main+0x59a>
     d00:	42a7           	clr.l -(sp)
     d02:	2f00           	move.l d0,-(sp)
     d04:	4eb9 0000 26cc 	jsr 26cc <memset>
  WaitBlit();
     d0a:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
     d10:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     d14:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
     d1a:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     d20:	317c 39f0 0040 	move.w #14832,64(a0)
  hw->bltafwm = 0xffff;
     d26:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     d2c:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     d32:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     d38:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
     d3e:	200a           	move.l a2,d0
     d40:	5480           	addq.l #2,d0
     d42:	2140 0050      	move.l d0,80(a0)
  hw->bltdpt = (UWORD *) destination;
     d46:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
     d4a:	317c 0402 0058 	move.w #1026,88(a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    *tmp++ = 0;
  }

  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 3, 16);
  WaitBlit();
     d50:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
     d56:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     d5a:	4fef 000c      	lea 12(sp),sp
     d5e:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
     d64:	671e           	beq.s d84 <main+0xd7e>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     d66:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     d6c:	4eae ffc4      	jsr -60(a6)
     d70:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     d76:	2200           	move.l d0,d1
     d78:	243c 0000 3775 	move.l #14197,d2
     d7e:	761f           	moveq #31,d3
     d80:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     d84:	0c6b aaaa 0032 	cmpi.w #-21846,50(a3)
     d8a:	671e           	beq.s daa <main+0xda4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     d8c:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     d92:	4eae ffc4      	jsr -60(a6)
     d96:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
     d9c:	2200           	move.l d0,d1
     d9e:	243c 0000 3795 	move.l #14229,d2
     da4:	7620           	moveq #32,d3
     da6:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     daa:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
     db0:	224a           	movea.l a2,a1
     db2:	203c 0000 05a0 	move.l #1440,d0
     db8:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     dbc:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
     dc2:	224b           	movea.l a3,a1
     dc4:	203c 0000 05a0 	move.l #1440,d0
     dca:	4eae ff2e      	jsr -210(a6)
5    5    5    2    a    a    a    a    9    5    5    5    5    4    a    a
abcd efgh ijkl 1234 5678 9abc defg hijk l123 4567 89ab cdef ghij kl12 3456 789a
1010 1010 1010 0101 0101 0101 0101 0101 0010 1010 1010 1010 1010 1001 0101 0101
a    a    a    5    5    5    5    5    2    a    a    a    a    9    5    5*/ 
void TestZoom4Picture() {
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dce:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
     dd4:	203c 0000 3740 	move.l #14144,d0
     dda:	7202           	moveq #2,d1
     ddc:	4eae ff3a      	jsr -198(a6)
     de0:	2400           	move.l d0,d2
  if( source == 0) {
     de2:	6700 0a2e      	beq.w 1812 <main+0x180c>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     de6:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
     dec:	203c 0000 3740 	move.l #14144,d0
     df2:	7202           	moveq #2,d1
     df4:	4eae ff3a      	jsr -198(a6)
     df8:	2b40 ff8c      	move.l d0,-116(a5)
  if( destination == 0) {
     dfc:	6700 0aa4      	beq.w 18a2 <main+0x189c>
     e00:	2002           	move.l d2,d0
     e02:	0680 0000 3300 	addi.l #13056,d0
     e08:	2042           	movea.l d2,a0
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
     e0a:	20bc 5555 5555 	move.l #1431655765,(a0)
     e10:	217c 5555 5555 	move.l #1431655765,4(a0)
     e16:	0004 
     e18:	217c 5555 5555 	move.l #1431655765,8(a0)
     e1e:	0008 
     e20:	217c 5555 5555 	move.l #1431655765,12(a0)
     e26:	000c 
     e28:	217c 5555 5555 	move.l #1431655765,16(a0)
     e2e:	0010 
     e30:	217c 5555 5555 	move.l #1431655765,20(a0)
     e36:	0014 
     e38:	217c 5555 5555 	move.l #1431655765,24(a0)
     e3e:	0018 
     e40:	217c 5555 5555 	move.l #1431655765,28(a0)
     e46:	001c 
     e48:	217c 5555 5555 	move.l #1431655765,32(a0)
     e4e:	0020 
     e50:	217c 5555 5555 	move.l #1431655765,36(a0)
     e56:	0024 
     e58:	217c 5555 5555 	move.l #1431655765,40(a0)
     e5e:	0028 
     e60:	217c 5555 5555 	move.l #1431655765,44(a0)
     e66:	002c 
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
     e68:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     e6e:	0030 
     e70:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     e76:	0034 
     e78:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     e7e:	0038 
     e80:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     e86:	003c 
     e88:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     e8e:	0040 
     e90:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     e96:	0044 
     e98:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     e9e:	0048 
     ea0:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     ea6:	004c 
     ea8:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     eae:	0050 
     eb0:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
     eb6:	0054 
     eb8:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
     ebe:	0058 
     ec0:	41e8 0060      	lea 96(a0),a0
     ec4:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     eca:	fffc 
  for(int i=0;i<128+8;i++) {
     ecc:	b1c0           	cmpa.l d0,a0
     ece:	6600 ff3a      	bne.w e0a <main+0xe04>
     ed2:	0682 0000 01ac 	addi.l #428,d2
     ed8:	2b42 ff84      	move.l d2,-124(a5)
     edc:	266d ff8c      	movea.l -116(a5),a3
     ee0:	47eb 332c      	lea 13100(a3),a3
  UWORD shiftright = 7;
     ee4:	7607           	moveq #7,d3
  UWORD nextzoom = 352-28;
     ee6:	347c 0144      	movea.w #324,a2
  UWORD startofword = 336;
     eea:	343c 0150      	move.w #336,d2
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*8-2-i;
     eee:	282d ff84      	move.l -124(a5),d4
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
     ef2:	2a0b           	move.l a3,d5
     ef4:	0685 ffff cd00 	addi.l #-13056,d5
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
     efa:	3e03           	move.w d3,d7
     efc:	700c           	moveq #12,d0
     efe:	e16f           	lsl.w d0,d7
     f00:	b44a           	cmp.w a2,d2
     f02:	6500 0656      	bcs.w 155a <main+0x1554>
  hw->bltcon0 = 0x9f0 + shiftright;
     f06:	0647 09f0      	addi.w #2544,d7
  WaitBlit();
     f0a:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
     f10:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     f14:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
     f1a:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     f20:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
     f24:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     f2a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     f30:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     f36:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
     f3c:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
     f40:	2145 0054      	move.l d5,84(a0)
  hw->bltsize = height*64+2;
     f44:	317c 0402 0058 	move.w #1026,88(a0)
        pos4source += ZMLINESIZE/2*16;
     f4a:	0684 0000 0300 	addi.l #768,d4
        pos4dest += ZMLINESIZE/2*16;
     f50:	2c05           	move.l d5,d6
     f52:	0686 0000 0300 	addi.l #768,d6
  WaitBlit();
     f58:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
     f5e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     f62:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
     f68:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     f6e:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
     f72:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     f78:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     f7e:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     f84:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
     f8a:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
     f8e:	2146 0054      	move.l d6,84(a0)
  hw->bltsize = height*64+2;
     f92:	317c 0042 0058 	move.w #66,88(a0)
        pos4dest += ZMLINESIZE/2;
     f98:	0685 0000 0330 	addi.l #816,d5
      for(int i=0;i<16;i++) {
     f9e:	b7c5           	cmpa.l d5,a3
     fa0:	6600 ff68      	bne.w f0a <main+0xf04>
    startofword -= 16;
     fa4:	0642 fff0      	addi.w #-16,d2
     fa8:	55ad ff84      	subq.l #2,-124(a5)
     fac:	558b           	subq.l #2,a3
  for(int i=0;i<22;i++) {
     fae:	0c42 fff0      	cmpi.w #-16,d2
     fb2:	6600 ff3a      	bne.w eee <main+0xee8>
  }
  
  Zoom_ZoomIntoPicture( source, destination);
  WaitBlit();
     fb6:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
     fbc:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
  UWORD *valsupposed = destline;
  for(int i=0;i<16;i++) {
     fc0:	2a2d ff8c      	move.l -116(a5),d5
     fc4:	0685 0000 0304 	addi.l #772,d5
  WaitBlit();
     fca:	7e10           	moveq #16,d7
     fcc:	2c05           	move.l d5,d6
     fce:	2846           	movea.l d6,a4
     fd0:	49ec fd00      	lea -768(a4),a4
     fd4:	78f0           	moveq #-16,d4
     fd6:	d887           	add.l d7,d4
    for(int i2=0;i2<16;i2+=2) {
      TestRow( valsupposed, valactual, 0x0000, i2+i*17);
     fd8:	2f04           	move.l d4,-(sp)
     fda:	2f0c           	move.l a4,-(sp)
     fdc:	4eb9 0000 1912 	jsr 1912 <TestRow.constprop.4>
      valactual += ZMLINESIZE/2;
     fe2:	41ec 0030      	lea 48(a4),a0
     fe6:	2b48 ff88      	move.l a0,-120(a5)
  }
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
  char str[ 100] = { 0 };
     fea:	4878 0064      	pea 64 <main+0x5e>
     fee:	42a7           	clr.l -(sp)
     ff0:	486d ff9c      	pea -100(a5)
     ff4:	4eb9 0000 26cc 	jsr 26cc <memset>
  UWORD data[2];
  data[1] = numberofline;
     ffa:	3004           	move.w d4,d0
     ffc:	5240           	addq.w #1,d0
     ffe:	3b40 ff92      	move.w d0,-110(a5)
    1002:	4fef 0014      	lea 20(sp),sp

  for(int i=0;i<21;i++) {
    1006:	42ad ff84      	clr.l -124(a5)
  data[1] = numberofline;
    100a:	2a3c 0000 595c 	move.l #22876,d5
    if( (*testpattern++ ^ xormask) != *destination++) {
    1010:	2045           	movea.l d5,a0
    1012:	3018           	move.w (a0)+,d0
    1014:	4640           	not.w d0
    1016:	2a08           	move.l a0,d5
    1018:	206d ff88      	movea.l -120(a5),a0
    101c:	54ad ff88      	addq.l #2,-120(a5)
    1020:	b058           	cmp.w (a0)+,d0
    1022:	673e           	beq.s 1062 <main+0x105c>
      data[0] = i;
    1024:	3b6d ff86 ff90 	move.w -122(a5),-112(a5)
      RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    102a:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    1030:	41f9 0000 307f 	lea 307f <incbin_swfont_end+0x1>,a0
    1036:	43ed ff90      	lea -112(a5),a1
    103a:	45f9 0000 28b8 	lea 28b8 <PutChar>,a2
    1040:	47ed ff9c      	lea -100(a5),a3
    1044:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1048:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    104e:	4eae ffc4      	jsr -60(a6)
    1052:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1058:	2200           	move.l d0,d1
    105a:	240b           	move.l a3,d2
    105c:	7664           	moveq #100,d3
    105e:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    1062:	52ad ff84      	addq.l #1,-124(a5)
    1066:	0c85 0000 5986 	cmpi.l #22918,d5
    106c:	66a2           	bne.s 1010 <main+0x100a>
    }
  }
  if( ( (*testpattern++ ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    106e:	3039 0000 5986 	move.w 5986 <destline+0x2a>,d0
    1074:	322c 005a      	move.w 90(a4),d1
    1078:	b340           	eor.w d1,d0
    107a:	4640           	not.w d0
    107c:	0240 ff00      	andi.w #-256,d0
    1080:	6700 0490      	beq.w 1512 <main+0x150c>
    data[0] = ZMLINESIZE/2;
    1084:	3b7c 0018 ff90 	move.w #24,-112(a5)
    RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    108a:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    1090:	41f9 0000 307f 	lea 307f <incbin_swfont_end+0x1>,a0
    1096:	43ed ff90      	lea -112(a5),a1
    109a:	45f9 0000 28b8 	lea 28b8 <PutChar>,a2
    10a0:	47ed ff9c      	lea -100(a5),a3
    10a4:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    10a8:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    10ae:	4eae ffc4      	jsr -60(a6)
    10b2:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    10b8:	2200           	move.l d0,d1
    10ba:	240b           	move.l a3,d2
    10bc:	7664           	moveq #100,d3
    10be:	4eae ffd0      	jsr -48(a6)
      valactual += ZMLINESIZE/2;
    10c2:	49ec 0060      	lea 96(a4),a4
    10c6:	5484           	addq.l #2,d4
    for(int i2=0;i2<16;i2+=2) {
    10c8:	bc8c           	cmp.l a4,d6
    10ca:	6600 ff0c      	bne.w fd8 <main+0xfd2>
    *bp = 0;
    10ce:	4278 0200      	clr.w 200 <main+0x1fa>
    TestRow( valsupposed, valactual, 0x0000, 16+i*17);
    10d2:	2f07           	move.l d7,-(sp)
    10d4:	2f06           	move.l d6,-(sp)
    10d6:	4eb9 0000 1912 	jsr 1912 <TestRow.constprop.4>
    valactual += ZMLINESIZE/2;
    10dc:	0686 0000 0330 	addi.l #816,d6
    10e2:	7011           	moveq #17,d0
    10e4:	de80           	add.l d0,d7
  for(int i=0;i<16;i++) {
    10e6:	508f           	addq.l #8,sp
    10e8:	0c87 0000 0120 	cmpi.l #288,d7
    10ee:	6600 fede      	bne.w fce <main+0xfc8>
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
    10f2:	4eb9 0000 2444 	jsr 2444 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    10f8:	4878 0010      	pea 10 <main+0xa>
    10fc:	4879 0000 591c 	pea 591c <ClsSprites>
    1102:	42a7           	clr.l -(sp)
    1104:	2f39 0000 5a02 	move.l 5a02 <Copperlist1>,-(sp)
    110a:	4eb9 0000 1b12 	jsr 1b12 <TestCopperlistBatch>
    1110:	4fef 0010      	lea 16(sp),sp
    1114:	4a80           	tst.l d0
    1116:	661e           	bne.s 1136 <main+0x1130>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    1118:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    111e:	4eae ffc4      	jsr -60(a6)
    1122:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1128:	2200           	move.l d0,d1
    112a:	243c 0000 3483 	move.l #13443,d2
    1130:	762c           	moveq #44,d3
    1132:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    1136:	4878 000c      	pea c <main+0x6>
    113a:	4879 0000 58ec 	pea 58ec <ClScreen>
    1140:	4878 0010      	pea 10 <main+0xa>
    1144:	2f39 0000 5a02 	move.l 5a02 <Copperlist1>,-(sp)
    114a:	4eb9 0000 1b12 	jsr 1b12 <TestCopperlistBatch>
    1150:	4fef 0010      	lea 16(sp),sp
    1154:	4a80           	tst.l d0
    1156:	661e           	bne.s 1176 <main+0x1170>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    1158:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    115e:	4eae ffc4      	jsr -60(a6)
    1162:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1168:	2200           	move.l d0,d1
    116a:	243c 0000 34b9 	move.l #13497,d2
    1170:	7636           	moveq #54,d3
    1172:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    1176:	4878 0002      	pea 2 <_start+0x2>
    117a:	4879 0000 58e4 	pea 58e4 <ClColor>
    1180:	4878 001e      	pea 1e <main+0x18>
    1184:	2f39 0000 5a02 	move.l 5a02 <Copperlist1>,-(sp)
    118a:	4eb9 0000 1b12 	jsr 1b12 <TestCopperlistBatch>
    1190:	4fef 0010      	lea 16(sp),sp
    1194:	4a80           	tst.l d0
    1196:	661e           	bne.s 11b6 <main+0x11b0>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1198:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    119e:	4eae ffc4      	jsr -60(a6)
    11a2:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    11a8:	2200           	move.l d0,d1
    11aa:	243c 0000 3266 	move.l #12902,d2
    11b0:	7621           	moveq #33,d3
    11b2:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    11b6:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdd027>
    11ba:	4878 0020      	pea 20 <main+0x1a>
    11be:	2f39 0000 5a02 	move.l 5a02 <Copperlist1>,-(sp)
    11c4:	4eb9 0000 1af4 	jsr 1af4 <TestCopperlistPos>
    11ca:	4fef 000c      	lea 12(sp),sp
    11ce:	4a80           	tst.l d0
    11d0:	661e           	bne.s 11f0 <main+0x11ea>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    11d2:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    11d8:	4eae ffc4      	jsr -60(a6)
    11dc:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    11e2:	2200           	move.l d0,d1
    11e4:	243c 0000 3288 	move.l #12936,d2
    11ea:	7622           	moveq #34,d3
    11ec:	4eae ffd0      	jsr -48(a6)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    11f0:	2479 0000 59f6 	movea.l 59f6 <DrawBuffer>,a2
    11f6:	4879 0000 382f 	pea 382f <incbin_swfont_end+0x7b1>
    11fc:	2f0a           	move.l a2,-(sp)
    11fe:	4eb9 0000 18c4 	jsr 18c4 <WriteFont.constprop.6>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    1204:	508f           	addq.l #8,sp
    1206:	0c52 ff00      	cmpi.w #-256,(a2)
    120a:	671e           	beq.s 122a <main+0x1224>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    120c:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1212:	4eae ffc4      	jsr -60(a6)
    1216:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    121c:	2200           	move.l d0,d1
    121e:	243c 0000 3840 	move.l #14400,d2
    1224:	7631           	moveq #49,d3
    1226:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    122a:	2f3c 0000 c800 	move.l #51200,-(sp)
    1230:	4878 0084      	pea 84 <main+0x7e>
    1234:	4eb9 0000 2582 	jsr 2582 <FreeDisplay>
  RunTests();
	Delay(50);
    123a:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1240:	7232           	moveq #50,d1
    1242:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    1246:	247c 00f0 ff60 	movea.l #15794016,a2
    124c:	508f           	addq.l #8,sp
    124e:	4a92           	tst.l (a2)
    1250:	6718           	beq.s 126a <main+0x1264>
    1252:	4878 0001      	pea 1 <_start+0x1>
    1256:	47f9 0000 19ea 	lea 19ea <warpmode.part.0>,a3
    125c:	4e93           	jsr (a3)
    125e:	588f           	addq.l #4,sp
    1260:	4a92           	tst.l (a2)
    1262:	6706           	beq.s 126a <main+0x1264>
    1264:	42a7           	clr.l -(sp)
    1266:	4e93           	jsr (a3)
    1268:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    126a:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    1270:	23ee 0022 0000 	move.l 34(a6),59cc <ActiView>
    1276:	59cc 
	OwnBlitter();
    1278:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    127c:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    1282:	4eae ff1c      	jsr -228(a6)
	Disable();
    1286:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    128c:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    1290:	2679 0000 59e2 	movea.l 59e2 <hw>,a3
    1296:	302b 0010      	move.w 16(a3),d0
    129a:	33c0 0000 59d0 	move.w d0,59d0 <SystemADKCON>
	SystemInts=hw->intenar;
    12a0:	302b 001c      	move.w 28(a3),d0
    12a4:	33c0 0000 59d4 	move.w d0,59d4 <SystemInts>
	SystemDMA=hw->dmaconr;
    12aa:	302b 0002      	move.w 2(a3),d0
    12ae:	33c0 0000 59d2 	move.w d0,59d2 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    12b4:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    12ba:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
    12c0:	45f9 0000 25f4 	lea 25f4 <WaitVbl>,a2
    12c6:	4e92           	jsr (a2)
	WaitVbl();
    12c8:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
    12ca:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    12d0:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    12d6:	93c9           	suba.l a1,a1
    12d8:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    12dc:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    12e2:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    12e6:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    12ec:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    12f0:	4e92           	jsr (a2)
	WaitVbl();
    12f2:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    12f4:	3b7c 4e7a ff9c 	move.w #20090,-100(a5)
    12fa:	3b7c 0801 ff9e 	move.w #2049,-98(a5)
    1300:	3b7c 4e73 ffa0 	move.w #20083,-96(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    1306:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    130c:	082e 0000 0129 	btst #0,297(a6)
    1312:	6700 0564      	beq.w 1878 <main+0x1872>
		vbr = (APTR)Supervisor((void*)getvbr);
    1316:	7e9c           	moveq #-100,d7
    1318:	de8d           	add.l a5,d7
    131a:	cf8d           	exg d7,a5
    131c:	4eae ffe2      	jsr -30(a6)
    1320:	cf8d           	exg d7,a5

	VBR=GetVBR();
    1322:	23c0 0000 59d6 	move.l d0,59d6 <VBR.lto_priv.7>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    1328:	2079 0000 59d6 	movea.l 59d6 <VBR.lto_priv.7>,a0
    132e:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    1332:	23c2 0000 59da 	move.l d2,59da <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    1338:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
    133a:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    133c:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
    1342:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1346:	3028 0002      	move.w 2(a0),d0
    134a:	0800 000e      	btst #14,d0
    134e:	66f6           	bne.s 1346 <main+0x1340>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    1350:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    1356:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    135c:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    1362:	2279 0000 59d6 	movea.l 59d6 <VBR.lto_priv.7>,a1
    1368:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    136c:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    1372:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    1378:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    137e:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    1384:	3039 0000 59d4 	move.w 59d4 <SystemInts>,d0
    138a:	0040 8000      	ori.w #-32768,d0
    138e:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    1392:	3039 0000 59d2 	move.w 59d2 <SystemDMA>,d0
    1398:	0040 8000      	ori.w #-32768,d0
    139c:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    13a0:	3039 0000 59d0 	move.w 59d0 <SystemADKCON>,d0
    13a6:	0040 8000      	ori.w #-32768,d0
    13aa:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    13ae:	2279 0000 59cc 	movea.l 59cc <ActiView>,a1
    13b4:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    13b8:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    13be:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    13c2:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    13c8:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    13cc:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    13d2:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    13d6:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    13dc:	4eae fe32      	jsr -462(a6)
	Enable();
    13e0:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    13e6:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    13ea:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    13f0:	2279 0000 5a06 	movea.l 5a06 <DOSBase>,a1
    13f6:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    13fa:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    1400:	2279 0000 59de 	movea.l 59de <GfxBase>,a1
    1406:	4eae fe62      	jsr -414(a6)
}
    140a:	7000           	moveq #0,d0
    140c:	4ced 5cfc ff5c 	movem.l -164(a5),d2-d7/a2-a4/a6
    1412:	4e5d           	unlk a5
    1414:	4e75           	rts
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    1416:	0cb9 0004 0000 	cmpi.l #262144,59ea <ViewBuffer>
    141c:	0000 59ea 
    1420:	6700 ee7c      	beq.w 29e <main+0x298>
    Write( Output(), 
    1424:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    142a:	4eae ffc4      	jsr -60(a6)
    142e:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1434:	2200           	move.l d0,d1
    1436:	243c 0000 31b0 	move.l #12720,d2
    143c:	763b           	moveq #59,d3
    143e:	4eae ffd0      	jsr -48(a6)
    1442:	6000 ee5a      	bra.w 29e <main+0x298>
		Exit(0);
    1446:	9dce           	suba.l a6,a6
    1448:	7200           	moveq #0,d1
    144a:	4eae ff70      	jsr -144(a6)
    144e:	6000 ec04      	bra.w 54 <main+0x4e>
		Exit(0);
    1452:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1458:	7200           	moveq #0,d1
    145a:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    145e:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    1464:	43f9 0000 3175 	lea 3175 <incbin_swfont_end+0xf7>,a1
    146a:	7000           	moveq #0,d0
    146c:	4eae fdd8      	jsr -552(a6)
    1470:	23c0 0000 5a06 	move.l d0,5a06 <DOSBase>
	if (!DOSBase)
    1476:	6600 ebdc      	bne.w 54 <main+0x4e>
    147a:	60ca           	bra.s 1446 <main+0x1440>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    147c:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1482:	4eae ffc4      	jsr -60(a6)
    1486:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    148c:	2200           	move.l d0,d1
    148e:	243c 0000 3266 	move.l #12902,d2
    1494:	7621           	moveq #33,d3
    1496:	4eae ffd0      	jsr -48(a6)
    149a:	2079 0000 5a02 	movea.l 5a02 <Copperlist1>,a0
    14a0:	6000 ee7a      	bra.w 31c <main+0x316>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    14a4:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    14aa:	4eae ffc4      	jsr -60(a6)
    14ae:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    14b4:	2200           	move.l d0,d1
    14b6:	243c 0000 34b9 	move.l #13497,d2
    14bc:	7636           	moveq #54,d3
    14be:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    14c2:	23fc 0004 0000 	move.l #262144,59f6 <DrawBuffer>
    14c8:	0000 59f6 
  ViewBuffer = (ULONG *)0x50000;
    14cc:	23fc 0005 0000 	move.l #327680,59ea <ViewBuffer>
    14d2:	0000 59ea 
  SetBplPointers();
    14d6:	45f9 0000 2418 	lea 2418 <SetBplPointers>,a2
    14dc:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    14de:	0cb9 0005 0000 	cmpi.l #327680,59f6 <DrawBuffer>
    14e4:	0000 59f6 
    14e8:	6600 ed96      	bne.w 280 <main+0x27a>
    14ec:	6000 ff28      	bra.w 1416 <main+0x1410>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    14f0:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    14f6:	4eae ffc4      	jsr -60(a6)
    14fa:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1500:	2200           	move.l d0,d1
    1502:	243c 0000 3483 	move.l #13443,d2
    1508:	762c           	moveq #44,d3
    150a:	4eae ffd0      	jsr -48(a6)
    150e:	6000 ec98      	bra.w 1a8 <main+0x1a2>
      valactual += ZMLINESIZE/2;
    1512:	49ec 0060      	lea 96(a4),a4
    1516:	5484           	addq.l #2,d4
    for(int i2=0;i2<16;i2+=2) {
    1518:	bc8c           	cmp.l a4,d6
    151a:	6700 fbb2      	beq.w 10ce <main+0x10c8>
      TestRow( valsupposed, valactual, 0x0000, i2+i*17);
    151e:	2f04           	move.l d4,-(sp)
    1520:	2f0c           	move.l a4,-(sp)
    1522:	4eb9 0000 1912 	jsr 1912 <TestRow.constprop.4>
      valactual += ZMLINESIZE/2;
    1528:	41ec 0030      	lea 48(a4),a0
    152c:	2b48 ff88      	move.l a0,-120(a5)
  char str[ 100] = { 0 };
    1530:	4878 0064      	pea 64 <main+0x5e>
    1534:	42a7           	clr.l -(sp)
    1536:	486d ff9c      	pea -100(a5)
    153a:	4eb9 0000 26cc 	jsr 26cc <memset>
  data[1] = numberofline;
    1540:	3004           	move.w d4,d0
    1542:	5240           	addq.w #1,d0
    1544:	3b40 ff92      	move.w d0,-110(a5)
    1548:	4fef 0014      	lea 20(sp),sp
  for(int i=0;i<21;i++) {
    154c:	42ad ff84      	clr.l -124(a5)
  data[1] = numberofline;
    1550:	2a3c 0000 595c 	move.l #22876,d5
    1556:	6000 fab8      	bra.w 1010 <main+0x100a>
      UWORD colnr = nextzoom - startofword - 1; 
    155a:	300a           	move.w a2,d0
    155c:	5340           	subq.w #1,d0
    155e:	9042           	sub.w d2,d0
      nextzoom -= 21;
    1560:	45ea ffeb      	lea -21(a2),a2
    shifta = (shift - 1) << 12;
    1564:	3c03           	move.w d3,d6
    1566:	5346           	subq.w #1,d6
    1568:	3b46 ff88      	move.w d6,-120(a5)
    156c:	3206           	move.w d6,d1
    156e:	7c0c           	moveq #12,d6
    1570:	ed69           	lsl.w d6,d1
  hw->bltcon0 = 0xde4 + shifta;
    1572:	3c3c f000      	move.w #-4096,d6
    1576:	4a43           	tst.w d3
    1578:	6702           	beq.s 157c <main+0x1576>
    157a:	3c01           	move.w d1,d6
    157c:	0646 0de4      	addi.w #3556,d6
        Zoom_ZoomBlit( pos4source, pos4dest, shiftright, colnr, 16);
    1580:	0280 0000 ffff 	andi.l #65535,d0
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1586:	7210           	moveq #16,d1
    1588:	9280           	sub.l d0,d1
    158a:	2001           	move.l d1,d0
    158c:	7200           	moveq #0,d1
    158e:	4641           	not.w d1
    1590:	e1a9           	lsl.l d0,d1
    1592:	2841           	movea.l d1,a4
    1594:	4a43           	tst.w d3
    1596:	6600 00dc      	bne.w 1674 <main+0x166e>
    159a:	262d ff84      	move.l -124(a5),d3
    159e:	5483           	addq.l #2,d3
  WaitBlit();
    15a0:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    15a6:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    15aa:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
    15b0:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    15b6:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    15ba:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    15c0:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    15c6:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    15cc:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    15d2:	314c 0070      	move.w a4,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    15d6:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
    15dc:	2143 0050      	move.l d3,80(a0)
  hw->bltbpt = srcb;
    15e0:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    15e4:	2145 0054      	move.l d5,84(a0)
  hw->bltsize = height*64+2;
    15e8:	317c 0402 0058 	move.w #1026,88(a0)
        pos4source += ZMLINESIZE/2*16;
    15ee:	0684 0000 0300 	addi.l #768,d4
        pos4dest += ZMLINESIZE/2*16;
    15f4:	2e05           	move.l d5,d7
    15f6:	0687 0000 0300 	addi.l #768,d7
        Zoom_ZoomBlit( pos4source, pos4dest, shiftright, colnr, 1);
    15fc:	2604           	move.l d4,d3
    15fe:	5483           	addq.l #2,d3
  WaitBlit();
    1600:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    1606:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    160a:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
    1610:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1616:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    161a:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1620:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1626:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    162c:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1632:	314c 0070      	move.w a4,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1636:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
    163c:	2143 0050      	move.l d3,80(a0)
  hw->bltbpt = srcb;
    1640:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    1644:	2147 0054      	move.l d7,84(a0)
  hw->bltsize = height*64+2;
    1648:	317c 0042 0058 	move.w #66,88(a0)
        pos4dest += ZMLINESIZE/2;
    164e:	0685 0000 0330 	addi.l #816,d5
      for(int i=0;i<16;i++) {
    1654:	b7c5           	cmpa.l d5,a3
    1656:	6600 ff48      	bne.w 15a0 <main+0x159a>
    shifta = (shift - 1) << 12;
    165a:	362d ff88      	move.w -120(a5),d3
    startofword -= 16;
    165e:	0642 fff0      	addi.w #-16,d2
    1662:	55ad ff84      	subq.l #2,-124(a5)
    1666:	558b           	subq.l #2,a3
  for(int i=0;i<22;i++) {
    1668:	0c42 fff0      	cmpi.w #-16,d2
    166c:	6600 f880      	bne.w eee <main+0xee8>
    1670:	6000 f944      	bra.w fb6 <main+0xfb0>
  WaitBlit();
    1674:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    167a:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    167e:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
    1684:	3147 0042      	move.w d7,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1688:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    168c:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1692:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1698:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    169e:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    16a4:	314c 0070      	move.w a4,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    16a8:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
    16ae:	2144 0050      	move.l d4,80(a0)
  hw->bltbpt = srcb;
    16b2:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    16b6:	2145 0054      	move.l d5,84(a0)
  hw->bltsize = height*64+2;
    16ba:	317c 0402 0058 	move.w #1026,88(a0)
        pos4source += ZMLINESIZE/2*16;
    16c0:	0684 0000 0300 	addi.l #768,d4
        pos4dest += ZMLINESIZE/2*16;
    16c6:	2605           	move.l d5,d3
    16c8:	0683 0000 0300 	addi.l #768,d3
  WaitBlit();
    16ce:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    16d4:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    16d8:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
    16de:	3147 0042      	move.w d7,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    16e2:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    16e6:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    16ec:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    16f2:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    16f8:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    16fe:	314c 0070      	move.w a4,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1702:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
    1708:	2144 0050      	move.l d4,80(a0)
  hw->bltbpt = srcb;
    170c:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    1710:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    1714:	317c 0042 0058 	move.w #66,88(a0)
        pos4dest += ZMLINESIZE/2;
    171a:	0685 0000 0330 	addi.l #816,d5
      for(int i=0;i<16;i++) {
    1720:	b7c5           	cmpa.l d5,a3
    1722:	6700 ff36      	beq.w 165a <main+0x1654>
  WaitBlit();
    1726:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    172c:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1730:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
    1736:	3147 0042      	move.w d7,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    173a:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    173e:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1744:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    174a:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1750:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1756:	314c 0070      	move.w a4,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    175a:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
    1760:	2144 0050      	move.l d4,80(a0)
  hw->bltbpt = srcb;
    1764:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    1768:	2145 0054      	move.l d5,84(a0)
  hw->bltsize = height*64+2;
    176c:	317c 0402 0058 	move.w #1026,88(a0)
        pos4source += ZMLINESIZE/2*16;
    1772:	0684 0000 0300 	addi.l #768,d4
        pos4dest += ZMLINESIZE/2*16;
    1778:	2605           	move.l d5,d3
    177a:	0683 0000 0300 	addi.l #768,d3
  WaitBlit();
    1780:	2c79 0000 59de 	movea.l 59de <GfxBase>,a6
    1786:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    178a:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
    1790:	3147 0042      	move.w d7,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1794:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    1798:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    179e:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    17a4:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    17aa:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    17b0:	314c 0070      	move.w a4,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    17b4:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
    17ba:	2144 0050      	move.l d4,80(a0)
  hw->bltbpt = srcb;
    17be:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    17c2:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    17c6:	317c 0042 0058 	move.w #66,88(a0)
        pos4dest += ZMLINESIZE/2;
    17cc:	0685 0000 0330 	addi.l #816,d5
      for(int i=0;i<16;i++) {
    17d2:	b7c5           	cmpa.l d5,a3
    17d4:	6600 fe9e      	bne.w 1674 <main+0x166e>
    17d8:	6000 fe80      	bra.w 165a <main+0x1654>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    17dc:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    17e2:	4eae ffc4      	jsr -60(a6)
    17e6:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    17ec:	2200           	move.l d0,d1
    17ee:	243c 0000 373f 	move.l #14143,d2
    17f4:	7635           	moveq #53,d3
    17f6:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    17fa:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    1800:	203c 0000 3740 	move.l #14144,d0
    1806:	7202           	moveq #2,d1
    1808:	4eae ff3a      	jsr -198(a6)
    180c:	2400           	move.l d0,d2
  if( source == 0) {
    180e:	6600 f5d6      	bne.w de6 <main+0xde0>
    Write(  Output(), 
    1812:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1818:	4eae ffc4      	jsr -60(a6)
    181c:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1822:	2200           	move.l d0,d1
    1824:	243c 0000 37b6 	move.l #14262,d2
    182a:	7639           	moveq #57,d3
    182c:	4eae ffd0      	jsr -48(a6)
    return;
    1830:	6000 f8c0      	bra.w 10f2 <main+0x10ec>
    Write(  Output(), 
    1834:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    183a:	4eae ffc4      	jsr -60(a6)
    183e:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1844:	2200           	move.l d0,d1
    1846:	243c 0000 35b9 	move.l #13753,d2
    184c:	7636           	moveq #54,d3
    184e:	4eae ffd0      	jsr -48(a6)
    return;
    1852:	6000 f336      	bra.w b8a <main+0xb84>
    Write(  Output(), 
    1856:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    185c:	4eae ffc4      	jsr -60(a6)
    1860:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1866:	2200           	move.l d0,d1
    1868:	243c 0000 35b9 	move.l #13753,d2
    186e:	7636           	moveq #54,d3
    1870:	4eae ffd0      	jsr -48(a6)
    return;
    1874:	6000 f0c6      	bra.w 93c <main+0x936>
	APTR vbr = 0;
    1878:	7000           	moveq #0,d0
	VBR=GetVBR();
    187a:	23c0 0000 59d6 	move.l d0,59d6 <VBR.lto_priv.7>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    1880:	2079 0000 59d6 	movea.l 59d6 <VBR.lto_priv.7>,a0
    1886:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    188a:	23c2 0000 59da 	move.l d2,59da <SystemIrq>
	WaitVbl();
    1890:	4e92           	jsr (a2)
	WaitVbl();
    1892:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1894:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
    189a:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    189e:	6000 faa6      	bra.w 1346 <main+0x1340>
    Write(  Output(), 
    18a2:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    18a8:	4eae ffc4      	jsr -60(a6)
    18ac:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    18b2:	2200           	move.l d0,d1
    18b4:	243c 0000 37f0 	move.l #14320,d2
    18ba:	763d           	moveq #61,d3
    18bc:	4eae ffd0      	jsr -48(a6)
    return;
    18c0:	6000 f830      	bra.w 10f2 <main+0x10ec>

000018c4 <WriteFont.constprop.6>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    18c4:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    18c8:	206f 0008      	movea.l 8(sp),a0
    18cc:	1010           	move.b (a0),d0
    18ce:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    18d2:	4880           	ext.w d0
    18d4:	48c0           	ext.l d0
    18d6:	e788           	lsl.l #3,d0
  fntptr += charpos;
    18d8:	4880           	ext.w d0
    18da:	3040           	movea.w d0,a0
    18dc:	d1c8           	adda.l a0,a0
    18de:	d1fc 0000 5988 	adda.l #22920,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    18e4:	3290           	move.w (a0),(a1)
    18e6:	3368 0002 0050 	move.w 2(a0),80(a1)
    18ec:	3368 0004 00a0 	move.w 4(a0),160(a1)
    18f2:	3368 0006 00f0 	move.w 6(a0),240(a1)
    18f8:	3368 0008 0140 	move.w 8(a0),320(a1)
    18fe:	3368 000a 0190 	move.w 10(a0),400(a1)
    1904:	3368 000c 01e0 	move.w 12(a0),480(a1)
    190a:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    1910:	4e75           	rts

00001912 <TestRow.constprop.4>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1912:	4fef ff98      	lea -104(sp),sp
    1916:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
  char str[ 100] = { 0 };
    191a:	7a30           	moveq #48,d5
    191c:	da8f           	add.l sp,d5
    191e:	4878 0064      	pea 64 <main+0x5e>
    1922:	42a7           	clr.l -(sp)
    1924:	2f05           	move.l d5,-(sp)
    1926:	4eba 0da4      	jsr 26cc <memset>(pc)
  data[1] = numberofline;
    192a:	3f6f 00aa 003a 	move.w 170(sp),58(sp)
    1930:	4fef 000c      	lea 12(sp),sp
    1934:	2a6f 0098      	movea.l 152(sp),a5
  for(int i=0;i<21;i++) {
    1938:	7800           	moveq #0,d4
  data[1] = numberofline;
    193a:	49f9 0000 595c 	lea 595c <destline>,a4
      RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    1940:	2e3c 0000 307f 	move.l #12415,d7
    1946:	2c3c 0000 28b8 	move.l #10424,d6
    if( (*testpattern++ ^ xormask) != *destination++) {
    194c:	b94d           	cmpm.w (a5)+,(a4)+
    194e:	6732           	beq.s 1982 <TestRow.constprop.4+0x70>
      data[0] = i;
    1950:	3f44 002c      	move.w d4,44(sp)
      RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    1954:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    195a:	2047           	movea.l d7,a0
    195c:	43ef 002c      	lea 44(sp),a1
    1960:	2446           	movea.l d6,a2
    1962:	2645           	movea.l d5,a3
    1964:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1968:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    196e:	4eae ffc4      	jsr -60(a6)
    1972:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1978:	2200           	move.l d0,d1
    197a:	2405           	move.l d5,d2
    197c:	7664           	moveq #100,d3
    197e:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    1982:	5284           	addq.l #1,d4
    1984:	b9fc 0000 5986 	cmpa.l #22918,a4
    198a:	66c0           	bne.s 194c <TestRow.constprop.4+0x3a>
  if( ( (*testpattern++ ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    198c:	3039 0000 5986 	move.w 5986 <destline+0x2a>,d0
    1992:	206f 0098      	movea.l 152(sp),a0
    1996:	3228 002a      	move.w 42(a0),d1
    199a:	b340           	eor.w d1,d0
    199c:	0240 ff00      	andi.w #-256,d0
    19a0:	673e           	beq.s 19e0 <TestRow.constprop.4+0xce>
    data[0] = ZMLINESIZE/2;
    19a2:	3f7c 0018 002c 	move.w #24,44(sp)
    RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    19a8:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    19ae:	41f9 0000 307f 	lea 307f <incbin_swfont_end+0x1>,a0
    19b4:	43ef 002c      	lea 44(sp),a1
    19b8:	45f9 0000 28b8 	lea 28b8 <PutChar>,a2
    19be:	47ef 0030      	lea 48(sp),a3
    19c2:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    19c6:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    19cc:	4eae ffc4      	jsr -60(a6)
    19d0:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    19d6:	2200           	move.l d0,d1
    19d8:	240b           	move.l a3,d2
    19da:	7664           	moveq #100,d3
    19dc:	4eae ffd0      	jsr -48(a6)
  }
}
    19e0:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    19e4:	4fef 0068      	lea 104(sp),sp
    19e8:	4e75           	rts

000019ea <warpmode.part.0>:
void warpmode(int on) 
    19ea:	598f           	subq.l #4,sp
    19ec:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    19ee:	4aaf 000c      	tst.l 12(sp)
    19f2:	674c           	beq.s 1a40 <warpmode.part.0+0x56>
    19f4:	4878 0001      	pea 1 <_start+0x1>
    19f8:	740b           	moveq #11,d2
    19fa:	d48f           	add.l sp,d2
    19fc:	2f02           	move.l d2,-(sp)
    19fe:	42a7           	clr.l -(sp)
    1a00:	4879 0000 30db 	pea 30db <incbin_swfont_end+0x5d>
    1a06:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd028>
    1a0a:	4878 0052      	pea 52 <main+0x4c>
    1a0e:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
    1a14:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1a18:	203c 0000 30c1 	move.l #12481,d0
    1a1e:	4878 0001      	pea 1 <_start+0x1>
    1a22:	2f02           	move.l d2,-(sp)
    1a24:	42a7           	clr.l -(sp)
    1a26:	2f00           	move.l d0,-(sp)
    1a28:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd028>
    1a2c:	4878 0052      	pea 52 <main+0x4c>
    1a30:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
	}
}
    1a36:	4fef 0018      	lea 24(sp),sp
    1a3a:	241f           	move.l (sp)+,d2
    1a3c:	588f           	addq.l #4,sp
    1a3e:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    1a40:	4878 0001      	pea 1 <_start+0x1>
    1a44:	740b           	moveq #11,d2
    1a46:	d48f           	add.l sp,d2
    1a48:	2f02           	move.l d2,-(sp)
    1a4a:	42a7           	clr.l -(sp)
    1a4c:	4879 0000 30e5 	pea 30e5 <incbin_swfont_end+0x67>
    1a52:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd028>
    1a56:	4878 0052      	pea 52 <main+0x4c>
    1a5a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
    1a60:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1a64:	203c 0000 30a8 	move.l #12456,d0
    1a6a:	4878 0001      	pea 1 <_start+0x1>
    1a6e:	2f02           	move.l d2,-(sp)
    1a70:	42a7           	clr.l -(sp)
    1a72:	2f00           	move.l d0,-(sp)
    1a74:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd028>
    1a78:	4878 0052      	pea 52 <main+0x4c>
    1a7c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
}
    1a82:	4fef 0018      	lea 24(sp),sp
    1a86:	241f           	move.l (sp)+,d2
    1a88:	588f           	addq.l #4,sp
    1a8a:	4e75           	rts

00001a8c <KPrintF>:
{
    1a8c:	4fef ff80      	lea -128(sp),sp
    1a90:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    1a94:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
    1a9a:	6734           	beq.s 1ad0 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    1a9c:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    1aa2:	206f 0090      	movea.l 144(sp),a0
    1aa6:	43ef 0094      	lea 148(sp),a1
    1aaa:	45f9 0000 28b8 	lea 28b8 <PutChar>,a2
    1ab0:	47ef 000c      	lea 12(sp),a3
    1ab4:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    1ab8:	2f0b           	move.l a3,-(sp)
    1aba:	4878 0056      	pea 56 <main+0x50>
    1abe:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
    1ac4:	508f           	addq.l #8,sp
}
    1ac6:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1aca:	4fef 0080      	lea 128(sp),sp
    1ace:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    1ad0:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    1ad6:	206f 0090      	movea.l 144(sp),a0
    1ada:	43ef 0094      	lea 148(sp),a1
    1ade:	45f9 0000 28aa 	lea 28aa <KPutCharX>,a2
    1ae4:	97cb           	suba.l a3,a3
    1ae6:	4eae fdf6      	jsr -522(a6)
}
    1aea:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1aee:	4fef 0080      	lea 128(sp),sp
    1af2:	4e75           	rts

00001af4 <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    1af4:	202f 0008      	move.l 8(sp),d0
    1af8:	d080           	add.l d0,d0
    1afa:	d080           	add.l d0,d0
    1afc:	206f 0004      	movea.l 4(sp),a0
    1b00:	2030 0800      	move.l (0,a0,d0.l),d0
    1b04:	b0af 000c      	cmp.l 12(sp),d0
    1b08:	57c0           	seq d0
    1b0a:	4880           	ext.w d0
    1b0c:	48c0           	ext.l d0
}
    1b0e:	4480           	neg.l d0
    1b10:	4e75           	rts

00001b12 <TestCopperlistBatch>:
                                                                  long length) {
    1b12:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    1b16:	246f 0010      	movea.l 16(sp),a2
    1b1a:	206f 0014      	movea.l 20(sp),a0
    1b1e:	226f 0018      	movea.l 24(sp),a1
    1b22:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    1b26:	2008           	move.l a0,d0
    1b28:	d088           	add.l a0,d0
    1b2a:	d080           	add.l d0,d0
    1b2c:	2411           	move.l (a1),d2
    1b2e:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    1b32:	6600 01ac      	bne.w 1ce0 <TestCopperlistBatch+0x1ce>
    1b36:	2008           	move.l a0,d0
    1b38:	5280           	addq.l #1,d0
    1b3a:	d080           	add.l d0,d0
    1b3c:	d080           	add.l d0,d0
    1b3e:	2032 0800      	move.l (0,a2,d0.l),d0
    1b42:	b0a9 0004      	cmp.l 4(a1),d0
    1b46:	6600 0198      	bne.w 1ce0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b4a:	7002           	moveq #2,d0
    1b4c:	b081           	cmp.l d1,d0
    1b4e:	6700 0188      	beq.w 1cd8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b52:	2008           	move.l a0,d0
    1b54:	5480           	addq.l #2,d0
    1b56:	d080           	add.l d0,d0
    1b58:	d080           	add.l d0,d0
    1b5a:	2032 0800      	move.l (0,a2,d0.l),d0
    1b5e:	b0a9 0008      	cmp.l 8(a1),d0
    1b62:	6600 017c      	bne.w 1ce0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b66:	7403           	moveq #3,d2
    1b68:	b481           	cmp.l d1,d2
    1b6a:	6700 016c      	beq.w 1cd8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b6e:	2008           	move.l a0,d0
    1b70:	5680           	addq.l #3,d0
    1b72:	d080           	add.l d0,d0
    1b74:	d080           	add.l d0,d0
    1b76:	2032 0800      	move.l (0,a2,d0.l),d0
    1b7a:	b0a9 000c      	cmp.l 12(a1),d0
    1b7e:	6600 0160      	bne.w 1ce0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b82:	7004           	moveq #4,d0
    1b84:	b081           	cmp.l d1,d0
    1b86:	6700 0150      	beq.w 1cd8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b8a:	2008           	move.l a0,d0
    1b8c:	5880           	addq.l #4,d0
    1b8e:	d080           	add.l d0,d0
    1b90:	d080           	add.l d0,d0
    1b92:	2032 0800      	move.l (0,a2,d0.l),d0
    1b96:	b0a9 0010      	cmp.l 16(a1),d0
    1b9a:	6600 0144      	bne.w 1ce0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b9e:	7405           	moveq #5,d2
    1ba0:	b481           	cmp.l d1,d2
    1ba2:	6700 0134      	beq.w 1cd8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1ba6:	2008           	move.l a0,d0
    1ba8:	5a80           	addq.l #5,d0
    1baa:	d080           	add.l d0,d0
    1bac:	d080           	add.l d0,d0
    1bae:	2032 0800      	move.l (0,a2,d0.l),d0
    1bb2:	b0a9 0014      	cmp.l 20(a1),d0
    1bb6:	6600 0128      	bne.w 1ce0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1bba:	7006           	moveq #6,d0
    1bbc:	b081           	cmp.l d1,d0
    1bbe:	6700 0118      	beq.w 1cd8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1bc2:	2008           	move.l a0,d0
    1bc4:	5c80           	addq.l #6,d0
    1bc6:	d080           	add.l d0,d0
    1bc8:	d080           	add.l d0,d0
    1bca:	2032 0800      	move.l (0,a2,d0.l),d0
    1bce:	b0a9 0018      	cmp.l 24(a1),d0
    1bd2:	6600 010c      	bne.w 1ce0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1bd6:	7407           	moveq #7,d2
    1bd8:	b481           	cmp.l d1,d2
    1bda:	6700 00fc      	beq.w 1cd8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1bde:	2008           	move.l a0,d0
    1be0:	5e80           	addq.l #7,d0
    1be2:	d080           	add.l d0,d0
    1be4:	d080           	add.l d0,d0
    1be6:	2032 0800      	move.l (0,a2,d0.l),d0
    1bea:	b0a9 001c      	cmp.l 28(a1),d0
    1bee:	6600 00f0      	bne.w 1ce0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1bf2:	7008           	moveq #8,d0
    1bf4:	b081           	cmp.l d1,d0
    1bf6:	6700 00e0      	beq.w 1cd8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1bfa:	2008           	move.l a0,d0
    1bfc:	5080           	addq.l #8,d0
    1bfe:	d080           	add.l d0,d0
    1c00:	d080           	add.l d0,d0
    1c02:	2032 0800      	move.l (0,a2,d0.l),d0
    1c06:	b0a9 0020      	cmp.l 32(a1),d0
    1c0a:	6600 00d4      	bne.w 1ce0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1c0e:	7409           	moveq #9,d2
    1c10:	b481           	cmp.l d1,d2
    1c12:	6700 00c4      	beq.w 1cd8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1c16:	47e8 0009      	lea 9(a0),a3
    1c1a:	200b           	move.l a3,d0
    1c1c:	d08b           	add.l a3,d0
    1c1e:	d080           	add.l d0,d0
    1c20:	2032 0800      	move.l (0,a2,d0.l),d0
    1c24:	b0a9 0024      	cmp.l 36(a1),d0
    1c28:	6600 00b6      	bne.w 1ce0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1c2c:	700a           	moveq #10,d0
    1c2e:	b081           	cmp.l d1,d0
    1c30:	6700 00a6      	beq.w 1cd8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1c34:	47e8 000a      	lea 10(a0),a3
    1c38:	200b           	move.l a3,d0
    1c3a:	d08b           	add.l a3,d0
    1c3c:	d080           	add.l d0,d0
    1c3e:	2032 0800      	move.l (0,a2,d0.l),d0
    1c42:	b0a9 0028      	cmp.l 40(a1),d0
    1c46:	6600 0098      	bne.w 1ce0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1c4a:	740b           	moveq #11,d2
    1c4c:	b481           	cmp.l d1,d2
    1c4e:	6700 0088      	beq.w 1cd8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1c52:	47e8 000b      	lea 11(a0),a3
    1c56:	200b           	move.l a3,d0
    1c58:	d08b           	add.l a3,d0
    1c5a:	d080           	add.l d0,d0
    1c5c:	2032 0800      	move.l (0,a2,d0.l),d0
    1c60:	b0a9 002c      	cmp.l 44(a1),d0
    1c64:	667a           	bne.s 1ce0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1c66:	700c           	moveq #12,d0
    1c68:	b081           	cmp.l d1,d0
    1c6a:	676c           	beq.s 1cd8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1c6c:	47e8 000c      	lea 12(a0),a3
    1c70:	200b           	move.l a3,d0
    1c72:	d08b           	add.l a3,d0
    1c74:	d080           	add.l d0,d0
    1c76:	2032 0800      	move.l (0,a2,d0.l),d0
    1c7a:	b0a9 0030      	cmp.l 48(a1),d0
    1c7e:	6660           	bne.s 1ce0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1c80:	740d           	moveq #13,d2
    1c82:	b481           	cmp.l d1,d2
    1c84:	6752           	beq.s 1cd8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1c86:	47e8 000d      	lea 13(a0),a3
    1c8a:	200b           	move.l a3,d0
    1c8c:	d08b           	add.l a3,d0
    1c8e:	d080           	add.l d0,d0
    1c90:	2032 0800      	move.l (0,a2,d0.l),d0
    1c94:	b0a9 0034      	cmp.l 52(a1),d0
    1c98:	6646           	bne.s 1ce0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1c9a:	700e           	moveq #14,d0
    1c9c:	b081           	cmp.l d1,d0
    1c9e:	6738           	beq.s 1cd8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1ca0:	47e8 000e      	lea 14(a0),a3
    1ca4:	200b           	move.l a3,d0
    1ca6:	d08b           	add.l a3,d0
    1ca8:	d080           	add.l d0,d0
    1caa:	2032 0800      	move.l (0,a2,d0.l),d0
    1cae:	b0a9 0038      	cmp.l 56(a1),d0
    1cb2:	662c           	bne.s 1ce0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1cb4:	7410           	moveq #16,d2
    1cb6:	b481           	cmp.l d1,d2
    1cb8:	661e           	bne.s 1cd8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1cba:	41e8 000f      	lea 15(a0),a0
    1cbe:	d1c8           	adda.l a0,a0
    1cc0:	d1c8           	adda.l a0,a0
    1cc2:	2070 a800      	movea.l (0,a0,a2.l),a0
    1cc6:	b1e9 003c      	cmpa.l 60(a1),a0
    1cca:	57c0           	seq d0
    1ccc:	4880           	ext.w d0
    1cce:	48c0           	ext.l d0
    1cd0:	4480           	neg.l d0
}
    1cd2:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1cd6:	4e75           	rts
  return 1;
    1cd8:	7001           	moveq #1,d0
}
    1cda:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1cde:	4e75           	rts
      return 0;
    1ce0:	7000           	moveq #0,d0
}
    1ce2:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1ce6:	4e75           	rts

00001ce8 <ClBuild>:
ULONG * ClbuildSW() {
    1ce8:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    1cec:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    1cf2:	707b           	moveq #123,d0
    1cf4:	4600           	not.b d0
    1cf6:	7202           	moveq #2,d1
    1cf8:	4eae ff3a      	jsr -198(a6)
    1cfc:	2440           	movea.l d0,a2
  if( retval == 0) {
    1cfe:	4a80           	tst.l d0
    1d00:	6700 010e      	beq.w 1e10 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    1d04:	24b9 0000 591c 	move.l 591c <ClsSprites>,(a2)
    1d0a:	2579 0000 5920 	move.l 5920 <ClsSprites+0x4>,4(a2)
    1d10:	0004 
    1d12:	2579 0000 5924 	move.l 5924 <ClsSprites+0x8>,8(a2)
    1d18:	0008 
    1d1a:	2579 0000 5928 	move.l 5928 <ClsSprites+0xc>,12(a2)
    1d20:	000c 
    1d22:	2579 0000 592c 	move.l 592c <ClsSprites+0x10>,16(a2)
    1d28:	0010 
    1d2a:	2579 0000 5930 	move.l 5930 <ClsSprites+0x14>,20(a2)
    1d30:	0014 
    1d32:	2579 0000 5934 	move.l 5934 <ClsSprites+0x18>,24(a2)
    1d38:	0018 
    1d3a:	2579 0000 5938 	move.l 5938 <ClsSprites+0x1c>,28(a2)
    1d40:	001c 
    1d42:	2579 0000 593c 	move.l 593c <ClsSprites+0x20>,32(a2)
    1d48:	0020 
    1d4a:	2579 0000 5940 	move.l 5940 <ClsSprites+0x24>,36(a2)
    1d50:	0024 
    1d52:	2579 0000 5944 	move.l 5944 <ClsSprites+0x28>,40(a2)
    1d58:	0028 
    1d5a:	2579 0000 5948 	move.l 5948 <ClsSprites+0x2c>,44(a2)
    1d60:	002c 
    1d62:	2579 0000 594c 	move.l 594c <ClsSprites+0x30>,48(a2)
    1d68:	0030 
    1d6a:	2579 0000 5950 	move.l 5950 <ClsSprites+0x34>,52(a2)
    1d70:	0034 
    1d72:	2579 0000 5954 	move.l 5954 <ClsSprites+0x38>,56(a2)
    1d78:	0038 
    1d7a:	2579 0000 5958 	move.l 5958 <ClsSprites+0x3c>,60(a2)
    1d80:	003c 
    *cl++ = *clpartinstruction++;
    1d82:	2579 0000 58ec 	move.l 58ec <ClScreen>,64(a2)
    1d88:	0040 
    1d8a:	2579 0000 58f0 	move.l 58f0 <ClScreen+0x4>,68(a2)
    1d90:	0044 
    1d92:	2579 0000 58f4 	move.l 58f4 <ClScreen+0x8>,72(a2)
    1d98:	0048 
    1d9a:	2579 0000 58f8 	move.l 58f8 <ClScreen+0xc>,76(a2)
    1da0:	004c 
    1da2:	2579 0000 58fc 	move.l 58fc <ClScreen+0x10>,80(a2)
    1da8:	0050 
    1daa:	2579 0000 5900 	move.l 5900 <ClScreen+0x14>,84(a2)
    1db0:	0054 
    1db2:	2579 0000 5904 	move.l 5904 <ClScreen+0x18>,88(a2)
    1db8:	0058 
    1dba:	2579 0000 5908 	move.l 5908 <ClScreen+0x1c>,92(a2)
    1dc0:	005c 
    1dc2:	2579 0000 590c 	move.l 590c <ClScreen+0x20>,96(a2)
    1dc8:	0060 
    1dca:	2579 0000 5910 	move.l 5910 <ClScreen+0x24>,100(a2)
    1dd0:	0064 
    1dd2:	2579 0000 5914 	move.l 5914 <ClScreen+0x28>,104(a2)
    1dd8:	0068 
    1dda:	2579 0000 5918 	move.l 5918 <ClScreen+0x2c>,108(a2)
    1de0:	006c 
  *cl++ = 0x00e00000;
    1de2:	257c 00e0 0000 	move.l #14680064,112(a2)
    1de8:	0070 
  *cl++ = 0x00e20000;
    1dea:	257c 00e2 0000 	move.l #14811136,116(a2)
    1df0:	0074 
    *cl++ = *clpartinstruction++;
    1df2:	2579 0000 58e4 	move.l 58e4 <ClColor>,120(a2)
    1df8:	0078 
    1dfa:	2579 0000 58e8 	move.l 58e8 <ClColor+0x4>,124(a2)
    1e00:	007c 
  *cl = 0xfffffffe;
    1e02:	70fe           	moveq #-2,d0
    1e04:	2540 0080      	move.l d0,128(a2)
}
    1e08:	200a           	move.l a2,d0
    1e0a:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1e0e:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1e10:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1e16:	4eae ffc4      	jsr -60(a6)
    1e1a:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1e20:	2200           	move.l d0,d1
    1e22:	243c 0000 30f0 	move.l #12528,d2
    1e28:	7628           	moveq #40,d3
    1e2a:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1e2e:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    1e34:	7201           	moveq #1,d1
    1e36:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1e3a:	24b9 0000 591c 	move.l 591c <ClsSprites>,(a2)
    1e40:	2579 0000 5920 	move.l 5920 <ClsSprites+0x4>,4(a2)
    1e46:	0004 
    1e48:	2579 0000 5924 	move.l 5924 <ClsSprites+0x8>,8(a2)
    1e4e:	0008 
    1e50:	2579 0000 5928 	move.l 5928 <ClsSprites+0xc>,12(a2)
    1e56:	000c 
    1e58:	2579 0000 592c 	move.l 592c <ClsSprites+0x10>,16(a2)
    1e5e:	0010 
    1e60:	2579 0000 5930 	move.l 5930 <ClsSprites+0x14>,20(a2)
    1e66:	0014 
    1e68:	2579 0000 5934 	move.l 5934 <ClsSprites+0x18>,24(a2)
    1e6e:	0018 
    1e70:	2579 0000 5938 	move.l 5938 <ClsSprites+0x1c>,28(a2)
    1e76:	001c 
    1e78:	2579 0000 593c 	move.l 593c <ClsSprites+0x20>,32(a2)
    1e7e:	0020 
    1e80:	2579 0000 5940 	move.l 5940 <ClsSprites+0x24>,36(a2)
    1e86:	0024 
    1e88:	2579 0000 5944 	move.l 5944 <ClsSprites+0x28>,40(a2)
    1e8e:	0028 
    1e90:	2579 0000 5948 	move.l 5948 <ClsSprites+0x2c>,44(a2)
    1e96:	002c 
    1e98:	2579 0000 594c 	move.l 594c <ClsSprites+0x30>,48(a2)
    1e9e:	0030 
    1ea0:	2579 0000 5950 	move.l 5950 <ClsSprites+0x34>,52(a2)
    1ea6:	0034 
    1ea8:	2579 0000 5954 	move.l 5954 <ClsSprites+0x38>,56(a2)
    1eae:	0038 
    1eb0:	2579 0000 5958 	move.l 5958 <ClsSprites+0x3c>,60(a2)
    1eb6:	003c 
    *cl++ = *clpartinstruction++;
    1eb8:	2579 0000 58ec 	move.l 58ec <ClScreen>,64(a2)
    1ebe:	0040 
    1ec0:	2579 0000 58f0 	move.l 58f0 <ClScreen+0x4>,68(a2)
    1ec6:	0044 
    1ec8:	2579 0000 58f4 	move.l 58f4 <ClScreen+0x8>,72(a2)
    1ece:	0048 
    1ed0:	2579 0000 58f8 	move.l 58f8 <ClScreen+0xc>,76(a2)
    1ed6:	004c 
    1ed8:	2579 0000 58fc 	move.l 58fc <ClScreen+0x10>,80(a2)
    1ede:	0050 
    1ee0:	2579 0000 5900 	move.l 5900 <ClScreen+0x14>,84(a2)
    1ee6:	0054 
    1ee8:	2579 0000 5904 	move.l 5904 <ClScreen+0x18>,88(a2)
    1eee:	0058 
    1ef0:	2579 0000 5908 	move.l 5908 <ClScreen+0x1c>,92(a2)
    1ef6:	005c 
    1ef8:	2579 0000 590c 	move.l 590c <ClScreen+0x20>,96(a2)
    1efe:	0060 
    1f00:	2579 0000 5910 	move.l 5910 <ClScreen+0x24>,100(a2)
    1f06:	0064 
    1f08:	2579 0000 5914 	move.l 5914 <ClScreen+0x28>,104(a2)
    1f0e:	0068 
    1f10:	2579 0000 5918 	move.l 5918 <ClScreen+0x2c>,108(a2)
    1f16:	006c 
  *cl++ = 0x00e00000;
    1f18:	257c 00e0 0000 	move.l #14680064,112(a2)
    1f1e:	0070 
  *cl++ = 0x00e20000;
    1f20:	257c 00e2 0000 	move.l #14811136,116(a2)
    1f26:	0074 
    *cl++ = *clpartinstruction++;
    1f28:	2579 0000 58e4 	move.l 58e4 <ClColor>,120(a2)
    1f2e:	0078 
    1f30:	2579 0000 58e8 	move.l 58e8 <ClColor+0x4>,124(a2)
    1f36:	007c 
  *cl = 0xfffffffe;
    1f38:	70fe           	moveq #-2,d0
    1f3a:	2540 0080      	move.l d0,128(a2)
}
    1f3e:	200a           	move.l a2,d0
    1f40:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1f44:	4e75           	rts

00001f46 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    1f46:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1f4a:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    1f50:	203c 0000 a48c 	move.l #42124,d0
    1f56:	7202           	moveq #2,d1
    1f58:	4eae ff3a      	jsr -198(a6)
    1f5c:	2440           	movea.l d0,a2
  if( retval == 0) {
    1f5e:	4a80           	tst.l d0
    1f60:	6700 0160      	beq.w 20c2 <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    1f64:	24b9 0000 591c 	move.l 591c <ClsSprites>,(a2)
    1f6a:	2579 0000 5920 	move.l 5920 <ClsSprites+0x4>,4(a2)
    1f70:	0004 
    1f72:	2579 0000 5924 	move.l 5924 <ClsSprites+0x8>,8(a2)
    1f78:	0008 
    1f7a:	2579 0000 5928 	move.l 5928 <ClsSprites+0xc>,12(a2)
    1f80:	000c 
    1f82:	2579 0000 592c 	move.l 592c <ClsSprites+0x10>,16(a2)
    1f88:	0010 
    1f8a:	2579 0000 5930 	move.l 5930 <ClsSprites+0x14>,20(a2)
    1f90:	0014 
    1f92:	2579 0000 5934 	move.l 5934 <ClsSprites+0x18>,24(a2)
    1f98:	0018 
    1f9a:	2579 0000 5938 	move.l 5938 <ClsSprites+0x1c>,28(a2)
    1fa0:	001c 
    1fa2:	2579 0000 593c 	move.l 593c <ClsSprites+0x20>,32(a2)
    1fa8:	0020 
    1faa:	2579 0000 5940 	move.l 5940 <ClsSprites+0x24>,36(a2)
    1fb0:	0024 
    1fb2:	2579 0000 5944 	move.l 5944 <ClsSprites+0x28>,40(a2)
    1fb8:	0028 
    1fba:	2579 0000 5948 	move.l 5948 <ClsSprites+0x2c>,44(a2)
    1fc0:	002c 
    1fc2:	2579 0000 594c 	move.l 594c <ClsSprites+0x30>,48(a2)
    1fc8:	0030 
    1fca:	2579 0000 5950 	move.l 5950 <ClsSprites+0x34>,52(a2)
    1fd0:	0034 
    1fd2:	2579 0000 5954 	move.l 5954 <ClsSprites+0x38>,56(a2)
    1fd8:	0038 
    1fda:	2579 0000 5958 	move.l 5958 <ClsSprites+0x3c>,60(a2)
    1fe0:	003c 
    *cl++ = *clpartinstruction++;
    1fe2:	2579 0000 58b4 	move.l 58b4 <ClScreenZoom>,64(a2)
    1fe8:	0040 
    1fea:	2579 0000 58b8 	move.l 58b8 <ClScreenZoom+0x4>,68(a2)
    1ff0:	0044 
    1ff2:	2579 0000 58bc 	move.l 58bc <ClScreenZoom+0x8>,72(a2)
    1ff8:	0048 
    1ffa:	2579 0000 58c0 	move.l 58c0 <ClScreenZoom+0xc>,76(a2)
    2000:	004c 
    2002:	2579 0000 58c4 	move.l 58c4 <ClScreenZoom+0x10>,80(a2)
    2008:	0050 
    200a:	2579 0000 58c8 	move.l 58c8 <ClScreenZoom+0x14>,84(a2)
    2010:	0054 
    2012:	2579 0000 58cc 	move.l 58cc <ClScreenZoom+0x18>,88(a2)
    2018:	0058 
    201a:	2579 0000 58d0 	move.l 58d0 <ClScreenZoom+0x1c>,92(a2)
    2020:	005c 
    2022:	2579 0000 58d4 	move.l 58d4 <ClScreenZoom+0x20>,96(a2)
    2028:	0060 
    202a:	2579 0000 58d8 	move.l 58d8 <ClScreenZoom+0x24>,100(a2)
    2030:	0064 
    2032:	2579 0000 58dc 	move.l 58dc <ClScreenZoom+0x28>,104(a2)
    2038:	0068 
    203a:	2579 0000 58e0 	move.l 58e0 <ClScreenZoom+0x2c>,108(a2)
    2040:	006c 
  *cl++ = 0x00e00000;
    2042:	257c 00e0 0000 	move.l #14680064,112(a2)
    2048:	0070 
  *cl++ = 0x00e20000;
    204a:	257c 00e2 0000 	move.l #14811136,116(a2)
    2050:	0074 
  *cl++ = 0x00e40000;
    2052:	257c 00e4 0000 	move.l #14942208,120(a2)
    2058:	0078 
  *cl++ = 0x00e60000;
    205a:	257c 00e6 0000 	move.l #15073280,124(a2)
    2060:	007c 
    *cl++ = *clpartinstruction++;
    2062:	2579 0000 58e4 	move.l 58e4 <ClColor>,128(a2)
    2068:	0080 
    206a:	2579 0000 58e8 	move.l 58e8 <ClColor+0x4>,132(a2)
    2070:	0084 
    2072:	43ea 012c      	lea 300(a2),a1
    2076:	220a           	move.l a2,d1
    2078:	0681 0000 a52c 	addi.l #42284,d1
    207e:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    2084:	41e9 ff60      	lea -160(a1),a0
    2088:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    208c:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    2092:	5088           	addq.l #8,a0
    2094:	217c 0182 0f00 	move.l #25300736,-4(a0)
    209a:	fffc 
    for(int i2=0;i2<20;i2++) {
    209c:	b3c8           	cmpa.l a0,a1
    209e:	66ec           	bne.s 208c <ClbuildZoom+0x146>
    20a0:	43e8 00a4      	lea 164(a0),a1
    20a4:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    20aa:	b3c1           	cmpa.l d1,a1
    20ac:	66d6           	bne.s 2084 <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    20ae:	203c 0000 a488 	move.l #42120,d0
    20b4:	72fe           	moveq #-2,d1
    20b6:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    20ba:	200a           	move.l a2,d0
    20bc:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    20c0:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    20c2:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    20c8:	4eae ffc4      	jsr -60(a6)
    20cc:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    20d2:	2200           	move.l d0,d1
    20d4:	243c 0000 30f0 	move.l #12528,d2
    20da:	7628           	moveq #40,d3
    20dc:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    20e0:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    20e6:	7201           	moveq #1,d1
    20e8:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    20ec:	24b9 0000 591c 	move.l 591c <ClsSprites>,(a2)
    20f2:	2579 0000 5920 	move.l 5920 <ClsSprites+0x4>,4(a2)
    20f8:	0004 
    20fa:	2579 0000 5924 	move.l 5924 <ClsSprites+0x8>,8(a2)
    2100:	0008 
    2102:	2579 0000 5928 	move.l 5928 <ClsSprites+0xc>,12(a2)
    2108:	000c 
    210a:	2579 0000 592c 	move.l 592c <ClsSprites+0x10>,16(a2)
    2110:	0010 
    2112:	2579 0000 5930 	move.l 5930 <ClsSprites+0x14>,20(a2)
    2118:	0014 
    211a:	2579 0000 5934 	move.l 5934 <ClsSprites+0x18>,24(a2)
    2120:	0018 
    2122:	2579 0000 5938 	move.l 5938 <ClsSprites+0x1c>,28(a2)
    2128:	001c 
    212a:	2579 0000 593c 	move.l 593c <ClsSprites+0x20>,32(a2)
    2130:	0020 
    2132:	2579 0000 5940 	move.l 5940 <ClsSprites+0x24>,36(a2)
    2138:	0024 
    213a:	2579 0000 5944 	move.l 5944 <ClsSprites+0x28>,40(a2)
    2140:	0028 
    2142:	2579 0000 5948 	move.l 5948 <ClsSprites+0x2c>,44(a2)
    2148:	002c 
    214a:	2579 0000 594c 	move.l 594c <ClsSprites+0x30>,48(a2)
    2150:	0030 
    2152:	2579 0000 5950 	move.l 5950 <ClsSprites+0x34>,52(a2)
    2158:	0034 
    215a:	2579 0000 5954 	move.l 5954 <ClsSprites+0x38>,56(a2)
    2160:	0038 
    2162:	2579 0000 5958 	move.l 5958 <ClsSprites+0x3c>,60(a2)
    2168:	003c 
    *cl++ = *clpartinstruction++;
    216a:	2579 0000 58b4 	move.l 58b4 <ClScreenZoom>,64(a2)
    2170:	0040 
    2172:	2579 0000 58b8 	move.l 58b8 <ClScreenZoom+0x4>,68(a2)
    2178:	0044 
    217a:	2579 0000 58bc 	move.l 58bc <ClScreenZoom+0x8>,72(a2)
    2180:	0048 
    2182:	2579 0000 58c0 	move.l 58c0 <ClScreenZoom+0xc>,76(a2)
    2188:	004c 
    218a:	2579 0000 58c4 	move.l 58c4 <ClScreenZoom+0x10>,80(a2)
    2190:	0050 
    2192:	2579 0000 58c8 	move.l 58c8 <ClScreenZoom+0x14>,84(a2)
    2198:	0054 
    219a:	2579 0000 58cc 	move.l 58cc <ClScreenZoom+0x18>,88(a2)
    21a0:	0058 
    21a2:	2579 0000 58d0 	move.l 58d0 <ClScreenZoom+0x1c>,92(a2)
    21a8:	005c 
    21aa:	2579 0000 58d4 	move.l 58d4 <ClScreenZoom+0x20>,96(a2)
    21b0:	0060 
    21b2:	2579 0000 58d8 	move.l 58d8 <ClScreenZoom+0x24>,100(a2)
    21b8:	0064 
    21ba:	2579 0000 58dc 	move.l 58dc <ClScreenZoom+0x28>,104(a2)
    21c0:	0068 
    21c2:	2579 0000 58e0 	move.l 58e0 <ClScreenZoom+0x2c>,108(a2)
    21c8:	006c 
  *cl++ = 0x00e00000;
    21ca:	257c 00e0 0000 	move.l #14680064,112(a2)
    21d0:	0070 
  *cl++ = 0x00e20000;
    21d2:	257c 00e2 0000 	move.l #14811136,116(a2)
    21d8:	0074 
  *cl++ = 0x00e40000;
    21da:	257c 00e4 0000 	move.l #14942208,120(a2)
    21e0:	0078 
  *cl++ = 0x00e60000;
    21e2:	257c 00e6 0000 	move.l #15073280,124(a2)
    21e8:	007c 
    *cl++ = *clpartinstruction++;
    21ea:	2579 0000 58e4 	move.l 58e4 <ClColor>,128(a2)
    21f0:	0080 
    21f2:	2579 0000 58e8 	move.l 58e8 <ClColor+0x4>,132(a2)
    21f8:	0084 
    21fa:	43ea 012c      	lea 300(a2),a1
    21fe:	220a           	move.l a2,d1
    2200:	0681 0000 a52c 	addi.l #42284,d1
    2206:	203c 2c07 fffe 	move.l #738721790,d0
    220c:	6000 fe76      	bra.w 2084 <ClbuildZoom+0x13e>

00002210 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    2210:	2039 0000 59f2 	move.l 59f2 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    2216:	23f9 0000 59e6 	move.l 59e6 <ViewCopper>,59f2 <DrawCopper>
    221c:	0000 59f2 
  ViewCopper = (ULONG *)tmp;
    2220:	23c0 0000 59e6 	move.l d0,59e6 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    2226:	2079 0000 59e2 	movea.l 59e2 <hw>,a0
    222c:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    2230:	3140 0088      	move.w d0,136(a0)
}
    2234:	4e75           	rts

00002236 <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    2236:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    223a:	45fa fd0a      	lea 1f46 <ClbuildZoom>(pc),a2
    223e:	4e92           	jsr (a2)
    2240:	23c0 0000 5a02 	move.l d0,5a02 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    2246:	4e92           	jsr (a2)
    2248:	23c0 0000 59fe 	move.l d0,59fe <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    224e:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    2254:	203c 0001 6800 	move.l #92160,d0
    225a:	7202           	moveq #2,d1
    225c:	4eae ff3a      	jsr -198(a6)
    2260:	23c0 0000 59fa 	move.l d0,59fa <Bitplane1>
  if(Bitplane1 == 0) {
    2266:	6700 014e      	beq.w 23b6 <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    226a:	23c0 0000 59f6 	move.l d0,59f6 <DrawBuffer>
  DrawCopper = Copperlist1;
    2270:	23f9 0000 5a02 	move.l 5a02 <Copperlist1>,59f2 <DrawCopper>
    2276:	0000 59f2 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    227a:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    2280:	203c 0001 6800 	move.l #92160,d0
    2286:	7202           	moveq #2,d1
    2288:	4eae ff3a      	jsr -198(a6)
    228c:	2400           	move.l d0,d2
    228e:	23c0 0000 59ee 	move.l d0,59ee <Bitplane2>
  if(Bitplane2 == 0) {
    2294:	6778           	beq.s 230e <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    2296:	23f9 0000 59fe 	move.l 59fe <Copperlist2>,59e6 <ViewCopper>
    229c:	0000 59e6 
  SwapCl();
    22a0:	45fa ff6e      	lea 2210 <SwapCl>(pc),a2
    22a4:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    22a6:	2039 0000 59f6 	move.l 59f6 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    22ac:	2079 0000 59f2 	movea.l 59f2 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    22b2:	2200           	move.l d0,d1
    22b4:	4241           	clr.w d1
    22b6:	4841           	swap d1
    22b8:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    22bc:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    22c0:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    22c6:	2200           	move.l d0,d1
    22c8:	4241           	clr.w d1
    22ca:	4841           	swap d1
    22cc:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    22d0:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    22d4:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    22d6:	2079 0000 59f2 	movea.l 59f2 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    22dc:	2002           	move.l d2,d0
    22de:	4240           	clr.w d0
    22e0:	4840           	swap d0
    22e2:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    22e6:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    22ea:	2002           	move.l d2,d0
    22ec:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    22f2:	2200           	move.l d0,d1
    22f4:	4241           	clr.w d1
    22f6:	4841           	swap d1
    22f8:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    22fc:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    2300:	23c2 0000 59ea 	move.l d2,59ea <ViewBuffer>
}
    2306:	7000           	moveq #0,d0
    2308:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    230c:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    230e:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    2314:	4eae ffc4      	jsr -60(a6)
    2318:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    231e:	2200           	move.l d0,d1
    2320:	243c 0000 313d 	move.l #12605,d2
    2326:	7626           	moveq #38,d3
    2328:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    232c:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    2332:	7201           	moveq #1,d1
    2334:	4eae ff70      	jsr -144(a6)
    2338:	2439 0000 59ee 	move.l 59ee <Bitplane2>,d2
  ViewCopper = Copperlist2;
    233e:	23f9 0000 59fe 	move.l 59fe <Copperlist2>,59e6 <ViewCopper>
    2344:	0000 59e6 
  SwapCl();
    2348:	45fa fec6      	lea 2210 <SwapCl>(pc),a2
    234c:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    234e:	2039 0000 59f6 	move.l 59f6 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2354:	2079 0000 59f2 	movea.l 59f2 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    235a:	2200           	move.l d0,d1
    235c:	4241           	clr.w d1
    235e:	4841           	swap d1
    2360:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    2364:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    2368:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    236e:	2200           	move.l d0,d1
    2370:	4241           	clr.w d1
    2372:	4841           	swap d1
    2374:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2378:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    237c:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    237e:	2079 0000 59f2 	movea.l 59f2 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2384:	2002           	move.l d2,d0
    2386:	4240           	clr.w d0
    2388:	4840           	swap d0
    238a:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    238e:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    2392:	2002           	move.l d2,d0
    2394:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    239a:	2200           	move.l d0,d1
    239c:	4241           	clr.w d1
    239e:	4841           	swap d1
    23a0:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    23a4:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    23a8:	23c2 0000 59ea 	move.l d2,59ea <ViewBuffer>
}
    23ae:	7000           	moveq #0,d0
    23b0:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    23b4:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    23b6:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    23bc:	4eae ffc4      	jsr -60(a6)
    23c0:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    23c6:	2200           	move.l d0,d1
    23c8:	243c 0000 3116 	move.l #12566,d2
    23ce:	7626           	moveq #38,d3
    23d0:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    23d4:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    23da:	7201           	moveq #1,d1
    23dc:	4eae ff70      	jsr -144(a6)
    23e0:	2039 0000 59fa 	move.l 59fa <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    23e6:	23c0 0000 59f6 	move.l d0,59f6 <DrawBuffer>
  DrawCopper = Copperlist1;
    23ec:	23f9 0000 5a02 	move.l 5a02 <Copperlist1>,59f2 <DrawCopper>
    23f2:	0000 59f2 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    23f6:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    23fc:	203c 0001 6800 	move.l #92160,d0
    2402:	7202           	moveq #2,d1
    2404:	4eae ff3a      	jsr -198(a6)
    2408:	2400           	move.l d0,d2
    240a:	23c0 0000 59ee 	move.l d0,59ee <Bitplane2>
  if(Bitplane2 == 0) {
    2410:	6600 fe84      	bne.w 2296 <PrepareDisplayZoom+0x60>
    2414:	6000 fef8      	bra.w 230e <PrepareDisplayZoom+0xd8>

00002418 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2418:	2039 0000 59f6 	move.l 59f6 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    241e:	2079 0000 59f2 	movea.l 59f2 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    2424:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2428:	2200           	move.l d0,d1
    242a:	4241           	clr.w d1
    242c:	4841           	swap d1
    242e:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    2432:	23f9 0000 59ea 	move.l 59ea <ViewBuffer>,59f6 <DrawBuffer>
    2438:	0000 59f6 
  ViewBuffer = (ULONG *) tmp;
    243c:	23c0 0000 59ea 	move.l d0,59ea <ViewBuffer>
}
    2442:	4e75           	rts

00002444 <PrepareDisplay>:
 int PrepareDisplaySW() {
    2444:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    2448:	45fa f89e      	lea 1ce8 <ClBuild>(pc),a2
    244c:	4e92           	jsr (a2)
    244e:	23c0 0000 5a02 	move.l d0,5a02 <Copperlist1>
  Copperlist2 = ClbuildSW();
    2454:	4e92           	jsr (a2)
    2456:	23c0 0000 59fe 	move.l d0,59fe <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    245c:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    2462:	203c 0000 c800 	move.l #51200,d0
    2468:	7202           	moveq #2,d1
    246a:	4eae ff3a      	jsr -198(a6)
    246e:	23c0 0000 59fa 	move.l d0,59fa <Bitplane1>
  if(Bitplane1 == 0) {
    2474:	6700 00ac      	beq.w 2522 <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    2478:	23c0 0000 59f6 	move.l d0,59f6 <DrawBuffer>
  DrawCopper = Copperlist1;
    247e:	23f9 0000 5a02 	move.l 5a02 <Copperlist1>,59f2 <DrawCopper>
    2484:	0000 59f2 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2488:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    248e:	203c 0000 c800 	move.l #51200,d0
    2494:	7202           	moveq #2,d1
    2496:	4eae ff3a      	jsr -198(a6)
    249a:	23c0 0000 59ee 	move.l d0,59ee <Bitplane2>
  if(Bitplane2 == 0) {
    24a0:	6728           	beq.s 24ca <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    24a2:	23c0 0000 59ea 	move.l d0,59ea <ViewBuffer>
  ViewCopper = Copperlist2;
    24a8:	23f9 0000 59fe 	move.l 59fe <Copperlist2>,59e6 <ViewCopper>
    24ae:	0000 59e6 
  SwapCl();
    24b2:	47fa fd5c      	lea 2210 <SwapCl>(pc),a3
    24b6:	4e93           	jsr (a3)
  SetBplPointers();
    24b8:	45fa ff5e      	lea 2418 <SetBplPointers>(pc),a2
    24bc:	4e92           	jsr (a2)
  SwapCl();
    24be:	4e93           	jsr (a3)
  SetBplPointers();
    24c0:	4e92           	jsr (a2)
}
    24c2:	7000           	moveq #0,d0
    24c4:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    24c8:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    24ca:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    24d0:	4eae ffc4      	jsr -60(a6)
    24d4:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    24da:	2200           	move.l d0,d1
    24dc:	243c 0000 313d 	move.l #12605,d2
    24e2:	7626           	moveq #38,d3
    24e4:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    24e8:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    24ee:	7201           	moveq #1,d1
    24f0:	4eae ff70      	jsr -144(a6)
    24f4:	2039 0000 59ee 	move.l 59ee <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    24fa:	23c0 0000 59ea 	move.l d0,59ea <ViewBuffer>
  ViewCopper = Copperlist2;
    2500:	23f9 0000 59fe 	move.l 59fe <Copperlist2>,59e6 <ViewCopper>
    2506:	0000 59e6 
  SwapCl();
    250a:	47fa fd04      	lea 2210 <SwapCl>(pc),a3
    250e:	4e93           	jsr (a3)
  SetBplPointers();
    2510:	45fa ff06      	lea 2418 <SetBplPointers>(pc),a2
    2514:	4e92           	jsr (a2)
  SwapCl();
    2516:	4e93           	jsr (a3)
  SetBplPointers();
    2518:	4e92           	jsr (a2)
}
    251a:	7000           	moveq #0,d0
    251c:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    2520:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2522:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    2528:	4eae ffc4      	jsr -60(a6)
    252c:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    2532:	2200           	move.l d0,d1
    2534:	243c 0000 3116 	move.l #12566,d2
    253a:	7626           	moveq #38,d3
    253c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2540:	2c79 0000 5a06 	movea.l 5a06 <DOSBase>,a6
    2546:	7201           	moveq #1,d1
    2548:	4eae ff70      	jsr -144(a6)
    254c:	2039 0000 59fa 	move.l 59fa <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    2552:	23c0 0000 59f6 	move.l d0,59f6 <DrawBuffer>
  DrawCopper = Copperlist1;
    2558:	23f9 0000 5a02 	move.l 5a02 <Copperlist1>,59f2 <DrawCopper>
    255e:	0000 59f2 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2562:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    2568:	203c 0000 c800 	move.l #51200,d0
    256e:	7202           	moveq #2,d1
    2570:	4eae ff3a      	jsr -198(a6)
    2574:	23c0 0000 59ee 	move.l d0,59ee <Bitplane2>
  if(Bitplane2 == 0) {
    257a:	6600 ff26      	bne.w 24a2 <PrepareDisplay+0x5e>
    257e:	6000 ff4a      	bra.w 24ca <PrepareDisplay+0x86>

00002582 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    2582:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    2586:	262f 0010      	move.l 16(sp),d3
    258a:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    258e:	2279 0000 5a02 	movea.l 5a02 <Copperlist1>,a1
    2594:	b2fc 0000      	cmpa.w #0,a1
    2598:	670c           	beq.s 25a6 <FreeDisplay+0x24>
    259a:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    25a0:	2003           	move.l d3,d0
    25a2:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    25a6:	2279 0000 59fe 	movea.l 59fe <Copperlist2>,a1
    25ac:	b2fc 0000      	cmpa.w #0,a1
    25b0:	670c           	beq.s 25be <FreeDisplay+0x3c>
    25b2:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    25b8:	2003           	move.l d3,d0
    25ba:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    25be:	2279 0000 59fa 	movea.l 59fa <Bitplane1>,a1
    25c4:	b2fc 0000      	cmpa.w #0,a1
    25c8:	670c           	beq.s 25d6 <FreeDisplay+0x54>
    25ca:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    25d0:	2002           	move.l d2,d0
    25d2:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    25d6:	2279 0000 59ee 	movea.l 59ee <Bitplane2>,a1
    25dc:	b2fc 0000      	cmpa.w #0,a1
    25e0:	670c           	beq.s 25ee <FreeDisplay+0x6c>
    25e2:	2c79 0000 5a0a 	movea.l 5a0a <SysBase>,a6
    25e8:	2002           	move.l d2,d0
    25ea:	4eae ff2e      	jsr -210(a6)
}
    25ee:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    25f2:	4e75           	rts

000025f4 <WaitVbl>:
void WaitVbl() {
    25f4:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    25f6:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddc02d>,d0
    25fc:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    25fe:	2017           	move.l (sp),d0
    2600:	0280 0001 ff00 	andi.l #130816,d0
    2606:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    2608:	2017           	move.l (sp),d0
    260a:	0c80 0001 3700 	cmpi.l #79616,d0
    2610:	67e4           	beq.s 25f6 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    2612:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddc02d>,d0
    2618:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    261c:	202f 0004      	move.l 4(sp),d0
    2620:	0280 0001 ff00 	andi.l #130816,d0
    2626:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    262a:	202f 0004      	move.l 4(sp),d0
    262e:	0c80 0001 3700 	cmpi.l #79616,d0
    2634:	66dc           	bne.s 2612 <WaitVbl+0x1e>
}
    2636:	508f           	addq.l #8,sp
    2638:	4e75           	rts

0000263a <memcpy>:
{
    263a:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    263e:	202f 0014      	move.l 20(sp),d0
    2642:	226f 0018      	movea.l 24(sp),a1
    2646:	222f 001c      	move.l 28(sp),d1
	while(len--)
    264a:	2601           	move.l d1,d3
    264c:	5383           	subq.l #1,d3
    264e:	4a81           	tst.l d1
    2650:	6762           	beq.s 26b4 <memcpy+0x7a>
    2652:	2040           	movea.l d0,a0
    2654:	5888           	addq.l #4,a0
    2656:	b1c9           	cmpa.l a1,a0
    2658:	53c2           	sl.s d2
    265a:	4402           	neg.b d2
    265c:	41e9 0004      	lea 4(a1),a0
    2660:	b1c0           	cmpa.l d0,a0
    2662:	53c4           	sl.s d4
    2664:	4404           	neg.b d4
    2666:	8404           	or.b d4,d2
    2668:	7808           	moveq #8,d4
    266a:	b883           	cmp.l d3,d4
    266c:	55c4           	sc.s d4
    266e:	4404           	neg.b d4
    2670:	c404           	and.b d4,d2
    2672:	6746           	beq.s 26ba <memcpy+0x80>
    2674:	2409           	move.l a1,d2
    2676:	8480           	or.l d0,d2
    2678:	7803           	moveq #3,d4
    267a:	c484           	and.l d4,d2
    267c:	663c           	bne.s 26ba <memcpy+0x80>
    267e:	2049           	movea.l a1,a0
    2680:	2440           	movea.l d0,a2
    2682:	74fc           	moveq #-4,d2
    2684:	c481           	and.l d1,d2
    2686:	d489           	add.l a1,d2
		*d++ = *s++;
    2688:	24d8           	move.l (a0)+,(a2)+
    268a:	b488           	cmp.l a0,d2
    268c:	66fa           	bne.s 2688 <memcpy+0x4e>
    268e:	74fc           	moveq #-4,d2
    2690:	c481           	and.l d1,d2
    2692:	2040           	movea.l d0,a0
    2694:	d1c2           	adda.l d2,a0
    2696:	d3c2           	adda.l d2,a1
    2698:	9682           	sub.l d2,d3
    269a:	b481           	cmp.l d1,d2
    269c:	6716           	beq.s 26b4 <memcpy+0x7a>
    269e:	1091           	move.b (a1),(a0)
	while(len--)
    26a0:	4a83           	tst.l d3
    26a2:	6710           	beq.s 26b4 <memcpy+0x7a>
		*d++ = *s++;
    26a4:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    26aa:	5383           	subq.l #1,d3
    26ac:	6706           	beq.s 26b4 <memcpy+0x7a>
		*d++ = *s++;
    26ae:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    26b4:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    26b8:	4e75           	rts
    26ba:	2040           	movea.l d0,a0
    26bc:	d289           	add.l a1,d1
		*d++ = *s++;
    26be:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    26c0:	b289           	cmp.l a1,d1
    26c2:	67f0           	beq.s 26b4 <memcpy+0x7a>
		*d++ = *s++;
    26c4:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    26c6:	b289           	cmp.l a1,d1
    26c8:	66f4           	bne.s 26be <memcpy+0x84>
    26ca:	60e8           	bra.s 26b4 <memcpy+0x7a>

000026cc <memset>:
{
    26cc:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    26d0:	202f 0024      	move.l 36(sp),d0
    26d4:	2a2f 0028      	move.l 40(sp),d5
    26d8:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    26dc:	2809           	move.l a1,d4
    26de:	5384           	subq.l #1,d4
    26e0:	b2fc 0000      	cmpa.w #0,a1
    26e4:	6f00 00b0      	ble.w 2796 <memset+0xca>
    26e8:	1e05           	move.b d5,d7
    26ea:	2200           	move.l d0,d1
    26ec:	4481           	neg.l d1
    26ee:	7403           	moveq #3,d2
    26f0:	c282           	and.l d2,d1
    26f2:	7c05           	moveq #5,d6
		*ptr++ = val;
    26f4:	2440           	movea.l d0,a2
    26f6:	bc84           	cmp.l d4,d6
    26f8:	646a           	bcc.s 2764 <memset+0x98>
    26fa:	4a81           	tst.l d1
    26fc:	6724           	beq.s 2722 <memset+0x56>
    26fe:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    2700:	5384           	subq.l #1,d4
    2702:	7401           	moveq #1,d2
    2704:	b481           	cmp.l d1,d2
    2706:	671a           	beq.s 2722 <memset+0x56>
		*ptr++ = val;
    2708:	2440           	movea.l d0,a2
    270a:	548a           	addq.l #2,a2
    270c:	2040           	movea.l d0,a0
    270e:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    2712:	5384           	subq.l #1,d4
    2714:	7403           	moveq #3,d2
    2716:	b481           	cmp.l d1,d2
    2718:	6608           	bne.s 2722 <memset+0x56>
		*ptr++ = val;
    271a:	528a           	addq.l #1,a2
    271c:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    2720:	5384           	subq.l #1,d4
    2722:	2609           	move.l a1,d3
    2724:	9681           	sub.l d1,d3
    2726:	7c00           	moveq #0,d6
    2728:	1c05           	move.b d5,d6
    272a:	2406           	move.l d6,d2
    272c:	4842           	swap d2
    272e:	4242           	clr.w d2
    2730:	2042           	movea.l d2,a0
    2732:	2406           	move.l d6,d2
    2734:	e14a           	lsl.w #8,d2
    2736:	4842           	swap d2
    2738:	4242           	clr.w d2
    273a:	e18e           	lsl.l #8,d6
    273c:	2646           	movea.l d6,a3
    273e:	2c08           	move.l a0,d6
    2740:	8486           	or.l d6,d2
    2742:	2c0b           	move.l a3,d6
    2744:	8486           	or.l d6,d2
    2746:	1407           	move.b d7,d2
    2748:	2040           	movea.l d0,a0
    274a:	d1c1           	adda.l d1,a0
    274c:	72fc           	moveq #-4,d1
    274e:	c283           	and.l d3,d1
    2750:	d288           	add.l a0,d1
		*ptr++ = val;
    2752:	20c2           	move.l d2,(a0)+
    2754:	b1c1           	cmpa.l d1,a0
    2756:	66fa           	bne.s 2752 <memset+0x86>
    2758:	72fc           	moveq #-4,d1
    275a:	c283           	and.l d3,d1
    275c:	d5c1           	adda.l d1,a2
    275e:	9881           	sub.l d1,d4
    2760:	b283           	cmp.l d3,d1
    2762:	6732           	beq.s 2796 <memset+0xca>
    2764:	1485           	move.b d5,(a2)
	while(len-- > 0)
    2766:	4a84           	tst.l d4
    2768:	6f2c           	ble.s 2796 <memset+0xca>
		*ptr++ = val;
    276a:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    276e:	7201           	moveq #1,d1
    2770:	b284           	cmp.l d4,d1
    2772:	6c22           	bge.s 2796 <memset+0xca>
		*ptr++ = val;
    2774:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    2778:	7402           	moveq #2,d2
    277a:	b484           	cmp.l d4,d2
    277c:	6c18           	bge.s 2796 <memset+0xca>
		*ptr++ = val;
    277e:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    2782:	7c03           	moveq #3,d6
    2784:	bc84           	cmp.l d4,d6
    2786:	6c0e           	bge.s 2796 <memset+0xca>
		*ptr++ = val;
    2788:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    278c:	7204           	moveq #4,d1
    278e:	b284           	cmp.l d4,d1
    2790:	6c04           	bge.s 2796 <memset+0xca>
		*ptr++ = val;
    2792:	1545 0005      	move.b d5,5(a2)
}
    2796:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    279a:	4e75           	rts

0000279c <strlen>:
{
    279c:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    27a0:	7000           	moveq #0,d0
	while(*s++)
    27a2:	4a10           	tst.b (a0)
    27a4:	6708           	beq.s 27ae <strlen+0x12>
		t++;
    27a6:	5280           	addq.l #1,d0
	while(*s++)
    27a8:	4a30 0800      	tst.b (0,a0,d0.l)
    27ac:	66f8           	bne.s 27a6 <strlen+0xa>
}
    27ae:	4e75           	rts

000027b0 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    27b0:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    27b4:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    27b8:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    27bc:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    27c0:	d041           	add.w d1,d0
	swap	d0
    27c2:	4840           	swap d0
	clrw	d0
    27c4:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    27c6:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    27ca:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    27ce:	d081           	add.l d1,d0

	rts
    27d0:	4e75           	rts

000027d2 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    27d2:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    27d4:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    27d8:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    27dc:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    27e2:	6416           	bcc.s 27fa <__udivsi3+0x28>
	movel	d0, d2
    27e4:	2400           	move.l d0,d2
	clrw	d2
    27e6:	4242           	clr.w d2
	swap	d2
    27e8:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    27ea:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    27ec:	3002           	move.w d2,d0
	swap	d0
    27ee:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    27f0:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    27f4:	84c1           	divu.w d1,d2
	movew	d2, d0
    27f6:	3002           	move.w d2,d0
	jra	6f
    27f8:	6030           	bra.s 282a <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    27fa:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    27fc:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    27fe:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    2800:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    2806:	64f4           	bcc.s 27fc <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    2808:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    280a:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    2810:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    2812:	c2c0           	mulu.w d0,d1
	swap	d2
    2814:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    2816:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    2818:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    281a:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    281c:	660a           	bne.s 2828 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    281e:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    2820:	6506           	bcs.s 2828 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    2822:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    2826:	6302           	bls.s 282a <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    2828:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    282a:	241f           	move.l (sp)+,d2
	rts
    282c:	4e75           	rts

0000282e <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    282e:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    2830:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    2832:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    2836:	6a04           	bpl.s 283c <__divsi3+0xe>
	negl	d1
    2838:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    283a:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    283c:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    2840:	6a04           	bpl.s 2846 <__divsi3+0x18>
	negl	d0
    2842:	4480           	neg.l d0
	negb	d2
    2844:	4402           	neg.b d2

2:	movel	d1, sp@-
    2846:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2848:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    284a:	6186           	bsr.s 27d2 <__udivsi3>
	addql	IMM (8), sp
    284c:	508f           	addq.l #8,sp

	tstb	d2
    284e:	4a02           	tst.b d2
	jpl	3f
    2850:	6a02           	bpl.s 2854 <__divsi3+0x26>
	negl	d0
    2852:	4480           	neg.l d0

3:	movel	sp@+, d2
    2854:	241f           	move.l (sp)+,d2
	rts
    2856:	4e75           	rts

00002858 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    2858:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    285c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    2860:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2862:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    2864:	61c8           	bsr.s 282e <__divsi3>
	addql	IMM (8), sp
    2866:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    2868:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    286c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    286e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    2870:	6100 ff3e      	bsr.w 27b0 <__mulsi3>
	addql	IMM (8), sp
    2874:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    2876:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    287a:	9280           	sub.l d0,d1
	movel	d1, d0
    287c:	2001           	move.l d1,d0
	rts
    287e:	4e75           	rts

00002880 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    2880:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    2884:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    2888:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    288a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    288c:	6100 ff44      	bsr.w 27d2 <__udivsi3>
	addql	IMM (8), sp
    2890:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    2892:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    2896:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2898:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    289a:	6100 ff14      	bsr.w 27b0 <__mulsi3>
	addql	IMM (8), sp
    289e:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    28a0:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    28a4:	9280           	sub.l d0,d1
	movel	d1, d0
    28a6:	2001           	move.l d1,d0
	rts
    28a8:	4e75           	rts

000028aa <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    28aa:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    28ac:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    28b0:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    28b4:	2c5f           	movea.l (sp)+,a6
    rts
    28b6:	4e75           	rts

000028b8 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    28b8:	16c0           	move.b d0,(a3)+
	rts
    28ba:	4e75           	rts

000028bc <saveregs>:
	...

000028f8 <font2distance>:
    28f8:	0505           	btst d2,d5
    28fa:	0505           	btst d2,d5
    28fc:	0505           	btst d2,d5
    28fe:	0505           	btst d2,d5
    2900:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    2902:	0505           	btst d2,d5
    2904:	0505           	btst d2,d5
    2906:	0005 0505      	ori.b #5,d5
    290a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    290c:	0505           	btst d2,d5
    290e:	0505           	btst d2,d5
    2910:	0505           	btst d2,d5
    2912:	0505           	btst d2,d5
    2914:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    2916:	0505           	btst d2,d5
    2918:	0505           	btst d2,d5
    291a:	0505           	btst d2,d5
    291c:	0505           	btst d2,d5
    291e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    2920:	0500           	btst d2,d0
    2922:	0505           	btst d2,d5
    2924:	0505           	btst d2,d5
    2926:	0505           	btst d2,d5
    2928:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    292a:	0505           	btst d2,d5
    292c:	0505           	btst d2,d5
    292e:	0505           	btst d2,d5
    2930:	0505           	btst d2,d5
    2932:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    2934:	0505           	btst d2,d5
    2936:	0505           	btst d2,d5
    2938:	0503           	btst d2,d3
    293a:	0505           	btst d2,d5
    293c:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    293e:	0505           	btst d2,d5
    2940:	0500           	btst d2,d0
    2942:	0505           	btst d2,d5
    2944:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    2948:	0505           	btst d2,d5
    294a:	0503           	btst d2,d3
    294c:	0205 0507      	andi.b #7,d5
    2950:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    2952:	0505           	btst d2,d5
    2954:	0505           	btst d2,d5
    2956:	0505           	btst d2,d5
    2958:	0505           	btst d2,d5
    295a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    295c:	0505           	btst d2,d5
    295e:	0505           	btst d2,d5
    2960:	0505           	btst d2,d5
    2962:	0505           	btst d2,d5
    2964:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2966:	0505           	btst d2,d5
    2968:	0505           	btst d2,d5
    296a:	0505           	btst d2,d5
    296c:	0505           	btst d2,d5
    296e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2970:	0505           	btst d2,d5
    2972:	0505           	btst d2,d5
    2974:	0505           	btst d2,d5
    2976:	0505           	btst d2,d5
    2978:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    297a:	0505           	btst d2,d5
    297c:	0505           	btst d2,d5
    297e:	0505           	btst d2,d5
    2980:	0505           	btst d2,d5
    2982:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2984:	0505           	btst d2,d5
    2986:	0505           	btst d2,d5
    2988:	0505           	btst d2,d5
    298a:	0505           	btst d2,d5
    298c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    298e:	0505           	btst d2,d5
    2990:	0505           	btst d2,d5
    2992:	0505           	btst d2,d5
    2994:	0505           	btst d2,d5
    2996:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2998:	0505           	btst d2,d5
    299a:	0505           	btst d2,d5
    299c:	0505           	btst d2,d5
    299e:	0505           	btst d2,d5
    29a0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    29a2:	0505           	btst d2,d5
    29a4:	0505           	btst d2,d5
    29a6:	0505           	btst d2,d5
    29a8:	0505           	btst d2,d5
    29aa:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    29ac:	0505           	btst d2,d5
    29ae:	0505           	btst d2,d5
    29b0:	0505           	btst d2,d5
    29b2:	0505           	btst d2,d5
    29b4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    29b6:	0505           	btst d2,d5
    29b8:	0505           	btst d2,d5
    29ba:	0505           	btst d2,d5
    29bc:	0505           	btst d2,d5
    29be:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    29c0:	0505           	btst d2,d5
    29c2:	0505           	btst d2,d5
    29c4:	0505           	btst d2,d5
    29c6:	0505           	btst d2,d5
    29c8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    29ca:	0505           	btst d2,d5
    29cc:	0505           	btst d2,d5
    29ce:	0505           	btst d2,d5
    29d0:	0505           	btst d2,d5
    29d2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    29d4:	0505           	btst d2,d5
    29d6:	0505           	btst d2,d5
    29d8:	0505           	btst d2,d5
    29da:	0505           	btst d2,d5
    29dc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    29de:	0505           	btst d2,d5
    29e0:	0505           	btst d2,d5
    29e2:	0505           	btst d2,d5
    29e4:	0505           	btst d2,d5
    29e6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    29e8:	0505           	btst d2,d5
    29ea:	0505           	btst d2,d5
    29ec:	0505           	btst d2,d5
    29ee:	0505           	btst d2,d5
    29f0:	0505           	btst d2,d5

000029f2 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    29f2:	16c0           	move.b d0,(a3)+
  RTS
    29f4:	4e75           	rts

000029f6 <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    29f6:	48f9 7fff 0000 	movem.l d0-a6,28bc <saveregs>
    29fc:	28bc 
  lea 0xdff000,a5
    29fe:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddc029>,a5
  move.l sp@(4),a0  //Fontlocation
    2a04:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    2a08:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    2a0c:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    2a10:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    2a12:	082d 0006 0002 	btst #6,2(a5)

00002a18 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    2a18:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    2a1e:	66f8           	bne.s 2a18 <st2wblit>

00002a20 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    2a20:	7019           	moveq #25,d0
	sub.l d5,d5      
    2a22:	9a85           	sub.l d5,d5

00002a24 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    2a24:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    2a26:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    2a28:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    2a2c:	9dce           	suba.l a6,a6
	move.l d2, a6
    2a2e:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    2a30:	ddfc 0000 28f8 	adda.l #10488,a6

	LSL  	#4,d2 	    //Fetch next char
    2a36:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    2a38:	2842           	movea.l d2,a4


	move.l  #0,d4
    2a3a:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    2a3c:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    2a3e:	3814           	move.w (a4),d4
	swap	d4
    2a40:	4844           	swap d4
	lsr.l	d5, d4
    2a42:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    2a44:	8993           	or.l d4,(a3)
	clr.l	d4
    2a46:	4284           	clr.l d4
	move.w  2(a4), d4
    2a48:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    2a4c:	4844           	swap d4
	lsr.l	d5, d4
    2a4e:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    2a50:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    2a54:	4284           	clr.l d4
	move.w  4(a4), d4
    2a56:	382c 0004      	move.w 4(a4),d4
	swap	d4
    2a5a:	4844           	swap d4
	lsr.l	d5, d4
    2a5c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    2a5e:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    2a62:	4284           	clr.l d4
	move.w  6(a4), d4
    2a64:	382c 0006      	move.w 6(a4),d4
	swap	d4
    2a68:	4844           	swap d4
	lsr.l	d5, d4
    2a6a:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    2a6c:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    2a70:	4284           	clr.l d4
	move.w  8(a4), d4
    2a72:	382c 0008      	move.w 8(a4),d4
	swap	d4
    2a76:	4844           	swap d4
	lsr.l	d5, d4
    2a78:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    2a7a:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    2a7e:	4284           	clr.l d4
	move.w  10(a4), d4
    2a80:	382c 000a      	move.w 10(a4),d4
	swap	d4
    2a84:	4844           	swap d4
	lsr.l	d5, d4
    2a86:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    2a88:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    2a8c:	4284           	clr.l d4
	move.w  12(a4), d4
    2a8e:	382c 000c      	move.w 12(a4),d4
	swap	d4
    2a92:	4844           	swap d4
	lsr.l	d5, d4
    2a94:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    2a96:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    2a9a:	4284           	clr.l d4
	move.w  14(a4), d4
    2a9c:	382c 000e      	move.w 14(a4),d4
	swap	d4
    2aa0:	4844           	swap d4
	lsr.l	d5, d4
    2aa2:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    2aa4:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    2aa8:	4284           	clr.l d4

	add.b   (a6), d5
    2aaa:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    2aac:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    2ab0:	6500 0006      	bcs.w 2ab8 <noadditionalchar>
	addq.w  #1, a3
    2ab4:	524b           	addq.w #1,a3
	sub.w   #8,d5
    2ab6:	5145           	subq.w #8,d5

00002ab8 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    2ab8:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    2aba:	51c8 ff68      	dbf d0,2a24 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    2abe:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    2ac2:	51cb ff5c      	dbf d3,2a20 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    2ac6:	4cfa 7fff fdf2 	movem.l 28bc <saveregs>(pc),d0-a6

	RTS
    2acc:	4e75           	rts
