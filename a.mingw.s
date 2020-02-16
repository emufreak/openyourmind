
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
       6:	4e55 ff88      	link.w a5,#-120
       a:	48e7 3f3a      	movem.l d2-d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 5912 	move.l a6,5912 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,58ea <hw>
      1e:	0000 58ea 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 306c 	lea 306c <incbin_swfont_end+0xe6>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 58e6 	move.l d0,58e6 <GfxBase>
	if (!GfxBase)
      34:	6700 1620      	beq.w 1656 <main+0x1650>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
      3e:	43f9 0000 307d 	lea 307d <incbin_swfont_end+0xf7>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 590e 	move.l d0,590e <DOSBase>
	if (!DOSBase)
      50:	6700 15f8      	beq.w 164a <main+0x1644>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 3089 	pea 3089 <incbin_swfont_end+0x103>
      5a:	4eb9 0000 1992 	jsr 1992 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 30a5 	move.l #12453,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 58ea 	movea.l 58ea <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 30b5 	move.l #12469,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 1bee 	lea 1bee <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 590a 	move.l d0,590a <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 58fa 	move.l d0,58fa <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 5906 	move.l d0,5906 <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 58ee 	move.l d0,58ee <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 5824 	cmp.l 5824 <ClsSprites>,d0
      d2:	6600 131c      	bne.w 13f0 <main+0x13ea>
      d6:	222a 0004      	move.l 4(a2),d1
      da:	b2b9 0000 5828 	cmp.l 5828 <ClsSprites+0x4>,d1
      e0:	6600 130e      	bne.w 13f0 <main+0x13ea>
      e4:	206a 0008      	movea.l 8(a2),a0
      e8:	b1f9 0000 582c 	cmpa.l 582c <ClsSprites+0x8>,a0
      ee:	6600 1300      	bne.w 13f0 <main+0x13ea>
      f2:	202a 000c      	move.l 12(a2),d0
      f6:	b0b9 0000 5830 	cmp.l 5830 <ClsSprites+0xc>,d0
      fc:	6600 12f2      	bne.w 13f0 <main+0x13ea>
     100:	222a 0010      	move.l 16(a2),d1
     104:	b2b9 0000 5834 	cmp.l 5834 <ClsSprites+0x10>,d1
     10a:	6600 12e4      	bne.w 13f0 <main+0x13ea>
     10e:	206a 0014      	movea.l 20(a2),a0
     112:	b1f9 0000 5838 	cmpa.l 5838 <ClsSprites+0x14>,a0
     118:	6600 12d6      	bne.w 13f0 <main+0x13ea>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 583c 	cmp.l 583c <ClsSprites+0x18>,d0
     126:	6600 12c8      	bne.w 13f0 <main+0x13ea>
     12a:	222a 001c      	move.l 28(a2),d1
     12e:	b2b9 0000 5840 	cmp.l 5840 <ClsSprites+0x1c>,d1
     134:	6600 12ba      	bne.w 13f0 <main+0x13ea>
     138:	206a 0020      	movea.l 32(a2),a0
     13c:	b1f9 0000 5844 	cmpa.l 5844 <ClsSprites+0x20>,a0
     142:	6600 12ac      	bne.w 13f0 <main+0x13ea>
     146:	202a 0024      	move.l 36(a2),d0
     14a:	b0b9 0000 5848 	cmp.l 5848 <ClsSprites+0x24>,d0
     150:	6600 129e      	bne.w 13f0 <main+0x13ea>
     154:	222a 0028      	move.l 40(a2),d1
     158:	b2b9 0000 584c 	cmp.l 584c <ClsSprites+0x28>,d1
     15e:	6600 1290      	bne.w 13f0 <main+0x13ea>
     162:	206a 002c      	movea.l 44(a2),a0
     166:	b1f9 0000 5850 	cmpa.l 5850 <ClsSprites+0x2c>,a0
     16c:	6600 1282      	bne.w 13f0 <main+0x13ea>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 5854 	cmp.l 5854 <ClsSprites+0x30>,d0
     17a:	6600 1274      	bne.w 13f0 <main+0x13ea>
     17e:	222a 0034      	move.l 52(a2),d1
     182:	b2b9 0000 5858 	cmp.l 5858 <ClsSprites+0x34>,d1
     188:	6600 1266      	bne.w 13f0 <main+0x13ea>
     18c:	206a 0038      	movea.l 56(a2),a0
     190:	b1f9 0000 585c 	cmpa.l 585c <ClsSprites+0x38>,a0
     196:	6600 1258      	bne.w 13f0 <main+0x13ea>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 5860 	cmpa.l 5860 <ClsSprites+0x3c>,a2
     1a4:	6600 124a      	bne.w 13f0 <main+0x13ea>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 590a 	movea.l 590a <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 57f4 	move.l 57f4 <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 13de      	bne.w 1598 <main+0x1592>
     1bc:	2228 0044      	move.l 68(a0),d1
     1c0:	b2b9 0000 57f8 	cmp.l 57f8 <ClScreen+0x4>,d1
     1c6:	6600 13d0      	bne.w 1598 <main+0x1592>
     1ca:	2028 0048      	move.l 72(a0),d0
     1ce:	b0b9 0000 57fc 	cmp.l 57fc <ClScreen+0x8>,d0
     1d4:	6600 13c2      	bne.w 1598 <main+0x1592>
     1d8:	2228 004c      	move.l 76(a0),d1
     1dc:	b2b9 0000 5800 	cmp.l 5800 <ClScreen+0xc>,d1
     1e2:	6600 13b4      	bne.w 1598 <main+0x1592>
     1e6:	2028 0050      	move.l 80(a0),d0
     1ea:	b0b9 0000 5804 	cmp.l 5804 <ClScreen+0x10>,d0
     1f0:	6600 13a6      	bne.w 1598 <main+0x1592>
     1f4:	2228 0054      	move.l 84(a0),d1
     1f8:	b2b9 0000 5808 	cmp.l 5808 <ClScreen+0x14>,d1
     1fe:	6600 1398      	bne.w 1598 <main+0x1592>
     202:	2039 0000 580c 	move.l 580c <ClScreen+0x18>,d0
     208:	b0a8 0058      	cmp.l 88(a0),d0
     20c:	6600 138a      	bne.w 1598 <main+0x1592>
     210:	2239 0000 5810 	move.l 5810 <ClScreen+0x1c>,d1
     216:	b2a8 005c      	cmp.l 92(a0),d1
     21a:	6600 137c      	bne.w 1598 <main+0x1592>
     21e:	2039 0000 5814 	move.l 5814 <ClScreen+0x20>,d0
     224:	b0a8 0060      	cmp.l 96(a0),d0
     228:	6600 136e      	bne.w 1598 <main+0x1592>
     22c:	2239 0000 5818 	move.l 5818 <ClScreen+0x24>,d1
     232:	b2a8 0064      	cmp.l 100(a0),d1
     236:	6600 1360      	bne.w 1598 <main+0x1592>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 581c 	cmp.l 581c <ClScreen+0x28>,d0
     244:	6600 1352      	bne.w 1598 <main+0x1592>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 5820 	cmpa.l 5820 <ClScreen+0x2c>,a0
     252:	6600 1344      	bne.w 1598 <main+0x1592>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     256:	23fc 0004 0000 	move.l #262144,58fe <DrawBuffer>
     25c:	0000 58fe 
  ViewBuffer = (ULONG *)0x50000;
     260:	23fc 0005 0000 	move.l #327680,58f2 <ViewBuffer>
     266:	0000 58f2 
  SetBplPointers();
     26a:	45f9 0000 231e 	lea 231e <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,58fe <DrawBuffer>
     278:	0000 58fe 
     27c:	6700 139c      	beq.w 161a <main+0x1614>
    Write( Output(), 
     280:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 30b8 	move.l #12472,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     29e:	2079 0000 590a 	movea.l 590a <Copperlist1>,a0
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 30f4 	move.l #12532,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 590a 	movea.l 590a <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 3131 	move.l #12593,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 590a 	movea.l 590a <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2228 0078      	move.l 120(a0),d1
     304:	b2b9 0000 57ec 	cmp.l 57ec <ClColor>,d1
     30a:	6600 1264      	bne.w 1570 <main+0x156a>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 57f0 	cmp.l 57f0 <ClColor+0x4>,d0
     318:	6600 1256      	bne.w 1570 <main+0x156a>
  if( instructions[pos] == value ) 
     31c:	72fe           	moveq #-2,d1
     31e:	b2a8 0080      	cmp.l 128(a0),d1
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 3190 	move.l #12688,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 2116 	lea 2116 <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2079 0000 58fa 	movea.l 58fa <DrawCopper>,a0
     350:	b1f9 0000 5906 	cmpa.l 5906 <Copperlist2>,a0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 31b3 	move.l #12723,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 234a 	lea 234a <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 58fe 	move.l 58fe <DrawBuffer>,d0
     384:	b0b9 0000 5902 	cmp.l 5902 <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 31c9 	move.l #12745,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2239 0000 58fa 	move.l 58fa <DrawCopper>,d1
     3b0:	b2b9 0000 590a 	cmp.l 590a <Copperlist1>,d1
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 3201 	move.l #12801,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2079 0000 58f2 	movea.l 58f2 <ViewBuffer>,a0
     3de:	b1f9 0000 58f6 	cmpa.l 58f6 <Bitplane2>,a0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 323b 	move.l #12859,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2039 0000 58ee 	move.l 58ee <ViewCopper>,d0
     40a:	b0b9 0000 5906 	cmp.l 5906 <Copperlist2>,d0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 3274 	move.l #12916,d2
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
     434:	2079 0000 58ee 	movea.l 58ee <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     44c:	b0b9 0000 58f6 	cmp.l 58f6 <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 32af 	move.l #12975,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     476:	2079 0000 58ee 	movea.l 58ee <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     48e:	b0b9 0000 5902 	cmp.l 5902 <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 32f8 	move.l #13048,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4b8:	2079 0000 58ee 	movea.l 58ee <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4d0:	b0b9 0000 58f6 	cmp.l 58f6 <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 3342 	move.l #13122,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	4eb9 0000 2488 	jsr 2488 <FreeDisplay>
  TestZoom4Picture();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     506:	47f9 0000 213c 	lea 213c <PrepareDisplayZoom>,a3
     50c:	4e93           	jsr (a3)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     50e:	4878 0010      	pea 10 <main+0xa>
     512:	4879 0000 5824 	pea 5824 <ClsSprites>
     518:	42a7           	clr.l -(sp)
     51a:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
     520:	49f9 0000 1a18 	lea 1a18 <TestCopperlistBatch>,a4
     526:	4e94           	jsr (a4)
     528:	4fef 0018      	lea 24(sp),sp
     52c:	4a80           	tst.l d0
     52e:	661e           	bne.s 54e <main+0x548>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     530:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     536:	4eae ffc4      	jsr -60(a6)
     53a:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     540:	2200           	move.l d0,d1
     542:	243c 0000 338b 	move.l #13195,d2
     548:	762c           	moveq #44,d3
     54a:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     54e:	4878 000c      	pea c <main+0x6>
     552:	4879 0000 57bc 	pea 57bc <ClScreenZoom>
     558:	4878 0010      	pea 10 <main+0xa>
     55c:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
     562:	4e94           	jsr (a4)
     564:	4fef 0010      	lea 16(sp),sp
     568:	4a80           	tst.l d0
     56a:	661e           	bne.s 58a <main+0x584>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     56c:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     572:	4eae ffc4      	jsr -60(a6)
     576:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     57c:	2200           	move.l d0,d1
     57e:	243c 0000 33c1 	move.l #13249,d2
     584:	7636           	moveq #54,d3
     586:	4eae ffd0      	jsr -48(a6)
  }
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     58a:	2079 0000 58fa 	movea.l 58fa <DrawCopper>,a0
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
     5a6:	23fc 0005 0000 	move.l #327680,58fe <DrawBuffer>
     5ac:	0000 58fe 
  ViewBuffer = (ULONG *) tmp;
     5b0:	23fc 0004 0000 	move.l #262144,58f2 <ViewBuffer>
     5b6:	0000 58f2 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5ba:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c0:	4878 001c      	pea 1c <main+0x16>
     5c4:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
     5ca:	4eb9 0000 19fa 	jsr 19fa <TestCopperlistPos>
     5d0:	4fef 000c      	lea 12(sp),sp
     5d4:	4a80           	tst.l d0
     5d6:	661e           	bne.s 5f6 <main+0x5f0>
    Write(Output(), 
     5d8:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     5de:	4eae ffc4      	jsr -60(a6)
     5e2:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     5e8:	2200           	move.l d0,d1
     5ea:	243c 0000 30f4 	move.l #12532,d2
     5f0:	763c           	moveq #60,d3
     5f2:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     5f6:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     5fc:	4878 001d      	pea 1d <main+0x17>
     600:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
     606:	4eb9 0000 19fa 	jsr 19fa <TestCopperlistPos>
     60c:	4fef 000c      	lea 12(sp),sp
     610:	4a80           	tst.l d0
     612:	661e           	bne.s 632 <main+0x62c>
    Write(Output(), 
     614:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     61a:	4eae ffc4      	jsr -60(a6)
     61e:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     624:	2200           	move.l d0,d1
     626:	243c 0000 3131 	move.l #12593,d2
     62c:	763c           	moveq #60,d3
     62e:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     632:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     638:	4878 001e      	pea 1e <main+0x18>
     63c:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
     642:	4eb9 0000 19fa 	jsr 19fa <TestCopperlistPos>
     648:	4fef 000c      	lea 12(sp),sp
     64c:	4a80           	tst.l d0
     64e:	661e           	bne.s 66e <main+0x668>
    Write(Output(), 
     650:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     656:	4eae ffc4      	jsr -60(a6)
     65a:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     660:	2200           	move.l d0,d1
     662:	243c 0000 33f8 	move.l #13304,d2
     668:	763c           	moveq #60,d3
     66a:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     66e:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     674:	4878 001f      	pea 1f <main+0x19>
     678:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
     67e:	4eb9 0000 19fa 	jsr 19fa <TestCopperlistPos>
     684:	4fef 000c      	lea 12(sp),sp
     688:	4a80           	tst.l d0
     68a:	661e           	bne.s 6aa <main+0x6a4>
    Write(Output(), 
     68c:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     692:	4eae ffc4      	jsr -60(a6)
     696:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     69c:	2200           	move.l d0,d1
     69e:	243c 0000 3435 	move.l #13365,d2
     6a4:	763c           	moveq #60,d3
     6a6:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6aa:	4878 0002      	pea 2 <_start+0x2>
     6ae:	4879 0000 57ec 	pea 57ec <ClColor>
     6b4:	4878 0020      	pea 20 <main+0x1a>
     6b8:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
     6be:	4e94           	jsr (a4)
     6c0:	4fef 0010      	lea 16(sp),sp
     6c4:	4a80           	tst.l d0
     6c6:	661e           	bne.s 6e6 <main+0x6e0>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6c8:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     6ce:	4eae ffc4      	jsr -60(a6)
     6d2:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     6d8:	2200           	move.l d0,d1
     6da:	243c 0000 316e 	move.l #12654,d2
     6e0:	7621           	moveq #33,d3
     6e2:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6e6:	7e9c           	moveq #-100,d7
     6e8:	de8d           	add.l a5,d7
     6ea:	4878 0040      	pea 40 <main+0x3a>
     6ee:	4879 0000 377a 	pea 377a <incbin_swfont_end+0x7f4>
     6f4:	2f07           	move.l d7,-(sp)
     6f6:	4eb9 0000 2540 	jsr 2540 <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     6fc:	4878 0010      	pea 10 <main+0xa>
     700:	2f07           	move.l d7,-(sp)
     702:	4878 0022      	pea 22 <main+0x1c>
     706:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
     70c:	4e94           	jsr (a4)
     70e:	4fef 001c      	lea 28(sp),sp
     712:	4a80           	tst.l d0
     714:	661e           	bne.s 734 <main+0x72e>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     716:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     71c:	4eae ffc4      	jsr -60(a6)
     720:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     726:	2200           	move.l d0,d1
     728:	243c 0000 3472 	move.l #13426,d2
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
     758:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
     75e:	4e94           	jsr (a4)
     760:	4fef 0010      	lea 16(sp),sp
     764:	4a80           	tst.l d0
     766:	661e           	bne.s 786 <main+0x780>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     768:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     76e:	4eae ffc4      	jsr -60(a6)
     772:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     778:	2200           	move.l d0,d1
     77a:	243c 0000 3494 	move.l #13460,d2
     780:	762c           	moveq #44,d3
     782:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     786:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdd027>
     78a:	4878 2922      	pea 2922 <st2wblit+0x2>
     78e:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
     794:	4eb9 0000 19fa 	jsr 19fa <TestCopperlistPos>
     79a:	4fef 000c      	lea 12(sp),sp
     79e:	4a80           	tst.l d0
     7a0:	661e           	bne.s 7c0 <main+0x7ba>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     7a2:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     7a8:	4eae ffc4      	jsr -60(a6)
     7ac:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     7b2:	2200           	move.l d0,d1
     7b4:	243c 0000 3190 	move.l #12688,d2
     7ba:	7622           	moveq #34,d3
     7bc:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7c0:	2f3c 0001 4a00 	move.l #84480,-(sp)
     7c6:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7cc:	4eb9 0000 2488 	jsr 2488 <FreeDisplay>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7d2:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
     7d8:	7004           	moveq #4,d0
     7da:	7202           	moveq #2,d1
     7dc:	4eae ff3a      	jsr -198(a6)

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     7e0:	4e93           	jsr (a3)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7e2:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
     7e8:	203c 0000 c800 	move.l #51200,d0
     7ee:	7202           	moveq #2,d1
     7f0:	4eae ff3a      	jsr -198(a6)
     7f4:	2440           	movea.l d0,a2
     7f6:	23c0 0000 58d0 	move.l d0,58d0 <Zoom_Source>
  if( Zoom_Source == 0) {
     7fc:	508f           	addq.l #8,sp
     7fe:	6700 0efc      	beq.w 16fc <main+0x16f6>
    return;
  }

  
  UWORD *tstsource = Zoom_Source;
  *tstsource++ = 0x0000;
     802:	4252           	clr.w (a2)
  *tstsource = 0x0080;
     804:	357c 0080 0002 	move.w #128,2(a2)
  tstsource += ZMLINESIZE/2-1;
  *tstsource = 0x1000;
     80a:	357c 1000 002c 	move.w #4096,44(a2)
  tstsource++;
  *tstsource = 0x8e88;
     810:	357c 8e88 002e 	move.w #-29048,46(a2)
  tstsource += ZMLINESIZE/2-1;

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
  *tstsource++ = 0x0000;
     816:	426a 15d4      	clr.w 5588(a2)
  *tstsource = 0x00ff;
     81a:	357c 00ff 15d6 	move.w #255,5590(a2)

  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 0, 8, 128);
     820:	2439 0000 58fe 	move.l 58fe <DrawBuffer>,d2
    srca = source + 1;
     826:	2600           	move.l d0,d3
     828:	5483           	addq.l #2,d3
  WaitBlit();
     82a:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
     830:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     834:	2079 0000 58ea 	movea.l 58ea <hw>,a0
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
     86a:	2143 0050      	move.l d3,80(a0)
  hw->bltbpt = srcb;
     86e:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = destination;
     872:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = height*64+2;
     876:	317c 2002 0058 	move.w #8194,88(a0)
  WaitBlit();
     87c:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
     882:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     886:	2479 0000 58fe 	movea.l 58fe <DrawBuffer>,a2
  if( *destination != 0x0180) {
     88c:	0c6a 0180 0002 	cmpi.w #384,2(a2)
     892:	671e           	beq.s 8b2 <main+0x8ac>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
     894:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     89a:	4eae ffc4      	jsr -60(a6)
     89e:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     8a4:	2200           	move.l d0,d1
     8a6:	243c 0000 34f9 	move.l #13561,d2
     8ac:	761c           	moveq #28,d3
     8ae:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8b2:	0c6a 1d88 002e 	cmpi.w #7560,46(a2)
     8b8:	671e           	beq.s 8d8 <main+0x8d2>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
     8ba:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     8c0:	4eae ffc4      	jsr -60(a6)
     8c4:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     8ca:	2200           	move.l d0,d1
     8cc:	243c 0000 3516 	move.l #13590,d2
     8d2:	761c           	moveq #28,d3
     8d4:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     8d8:	2079 0000 58fe 	movea.l 58fe <DrawBuffer>,a0
     8de:	0c68 01ff 15d6 	cmpi.w #511,5590(a0)
     8e4:	671e           	beq.s 904 <main+0x8fe>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
     8e6:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     8ec:	4eae ffc4      	jsr -60(a6)
     8f0:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     8f6:	2200           	move.l d0,d1
     8f8:	243c 0000 3533 	move.l #13619,d2
     8fe:	761a           	moveq #26,d3
     900:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     904:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
     90a:	2279 0000 58d0 	movea.l 58d0 <Zoom_Source>,a1
     910:	203c 0000 c800 	move.l #51200,d0
     916:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     91a:	2f3c 0001 4a00 	move.l #84480,-(sp)
     920:	2f3c 0000 a48c 	move.l #42124,-(sp)
     926:	4eb9 0000 2488 	jsr 2488 <FreeDisplay>
     92c:	508f           	addq.l #8,sp
}

void TestCopyColumnOfZoom() {

  PrepareDisplayZoom();
     92e:	4e93           	jsr (a3)

  UWORD *destination = (UWORD *)DrawBuffer;
     930:	2079 0000 58fe 	movea.l 58fe <DrawBuffer>,a0
  *destination= 0x0000;
     936:	4250           	clr.w (a0)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     938:	317c 000f 002c 	move.w #15,44(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     93e:	317c 000f 41d4 	move.w #15,16852(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     944:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
     94a:	203c 0000 c800 	move.l #51200,d0
     950:	7202           	moveq #2,d1
     952:	4eae ff3a      	jsr -198(a6)
     956:	2440           	movea.l d0,a2
     958:	23c0 0000 58d0 	move.l d0,58d0 <Zoom_Source>
  if( Zoom_Source == 0) {
     95e:	6700 0dee      	beq.w 174e <main+0x1748>
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
     972:	2439 0000 58fe 	move.l 58fe <DrawBuffer>,d2
  WaitBlit();
     978:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
     97e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     982:	2079 0000 58ea 	movea.l 58ea <hw>,a0
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
     9ca:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
     9d0:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     9d4:	2479 0000 58fe 	movea.l 58fe <DrawBuffer>,a2
  if( *destination != 0x4000)
     9da:	0c52 4000      	cmpi.w #16384,(a2)
     9de:	671e           	beq.s 9fe <main+0x9f8>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     9e0:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     9e6:	4eae ffc4      	jsr -60(a6)
     9ea:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     9f0:	2200           	move.l d0,d1
     9f2:	243c 0000 354e 	move.l #13646,d2
     9f8:	7629           	moveq #41,d3
     9fa:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x400f)
     9fe:	0c6a 400f 002c 	cmpi.w #16399,44(a2)
     a04:	671e           	beq.s a24 <main+0xa1e>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     a06:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     a0c:	4eae ffc4      	jsr -60(a6)
     a10:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     a16:	2200           	move.l d0,d1
     a18:	243c 0000 3578 	move.l #13688,d2
     a1e:	762a           	moveq #42,d3
     a20:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     a24:	2479 0000 58fe 	movea.l 58fe <DrawBuffer>,a2
     a2a:	0c6a 400f 41d4 	cmpi.w #16399,16852(a2)
     a30:	6724           	beq.s a56 <main+0xa50>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     a32:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     a38:	4eae ffc4      	jsr -60(a6)
     a3c:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     a42:	2200           	move.l d0,d1
     a44:	243c 0000 35a3 	move.l #13731,d2
     a4a:	7628           	moveq #40,d3
     a4c:	4eae ffd0      	jsr -48(a6)
     a50:	2479 0000 58fe 	movea.l 58fe <DrawBuffer>,a2

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
     a64:	2679 0000 58d0 	movea.l 58d0 <Zoom_Source>,a3
  *tstsource = 0xffff;
     a6a:	36bc ffff      	move.w #-1,(a3)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     a6e:	377c ffff 002c 	move.w #-1,44(a3)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0x8000;
     a74:	377c 8000 41d4 	move.w #-32768,16852(a3)
  WaitBlit();
     a7a:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
     a80:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     a84:	2079 0000 58ea 	movea.l 58ea <hw>,a0
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
     acc:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
     ad2:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     ad6:	2479 0000 58fe 	movea.l 58fe <DrawBuffer>,a2
  if( *destination != 0x8000)
     adc:	0c52 8000      	cmpi.w #-32768,(a2)
     ae0:	671e           	beq.s b00 <main+0xafa>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     ae2:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     ae8:	4eae ffc4      	jsr -60(a6)
     aec:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     af2:	2200           	move.l d0,d1
     af4:	243c 0000 35cc 	move.l #13772,d2
     afa:	7628           	moveq #40,d3
     afc:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x800f)
     b00:	0c6a 800f 002c 	cmpi.w #-32753,44(a2)
     b06:	671e           	beq.s b26 <main+0xb20>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     b08:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     b0e:	4eae ffc4      	jsr -60(a6)
     b12:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     b18:	2200           	move.l d0,d1
     b1a:	243c 0000 35f5 	move.l #13813,d2
     b20:	7629           	moveq #41,d3
     b22:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     b26:	2079 0000 58fe 	movea.l 58fe <DrawBuffer>,a0
     b2c:	0c68 800f 41d4 	cmpi.w #-32753,16852(a0)
     b32:	671e           	beq.s b52 <main+0xb4c>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     b34:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     b3a:	4eae ffc4      	jsr -60(a6)
     b3e:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     b44:	2200           	move.l d0,d1
     b46:	243c 0000 361f 	move.l #13855,d2
     b4c:	7627           	moveq #39,d3
     b4e:	4eae ffd0      	jsr -48(a6)

  FreeMem( Zoom_Source, 40*256*5);
     b52:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
     b58:	2279 0000 58d0 	movea.l 58d0 <Zoom_Source>,a1
     b5e:	203c 0000 c800 	move.l #51200,d0
     b64:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     b68:	2f3c 0001 4a00 	move.l #84480,-(sp)
     b6e:	2f3c 0000 a48c 	move.l #42124,-(sp)
     b74:	4eb9 0000 2488 	jsr 2488 <FreeDisplay>
     b7a:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     b7c:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
     b82:	203c 0000 0528 	move.l #1320,d0
     b88:	7202           	moveq #2,d1
     b8a:	4eae ff3a      	jsr -198(a6)
     b8e:	2440           	movea.l d0,a2
  if( source == 0) {
     b90:	4a80           	tst.l d0
     b92:	6700 0aec      	beq.w 1680 <main+0x167a>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     b96:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
     b9c:	203c 0000 0528 	move.l #1320,d0
     ba2:	7202           	moveq #2,d1
     ba4:	4eae ff3a      	jsr -198(a6)
     ba8:	2640           	movea.l d0,a3
  if( destination == 0) {
     baa:	4a80           	tst.l d0
     bac:	6700 0ad2      	beq.w 1680 <main+0x167a>
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
     cf6:	4eb9 0000 25d2 	jsr 25d2 <memset>
  WaitBlit();
     cfc:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
     d02:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     d06:	2079 0000 58ea 	movea.l 58ea <hw>,a0
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
     d42:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
     d48:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     d4c:	4fef 000c      	lea 12(sp),sp
     d50:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
     d56:	671e           	beq.s d76 <main+0xd70>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     d58:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     d5e:	4eae ffc4      	jsr -60(a6)
     d62:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     d68:	2200           	move.l d0,d1
     d6a:	243c 0000 367d 	move.l #13949,d2
     d70:	761f           	moveq #31,d3
     d72:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     d76:	0c6b aaaa 002e 	cmpi.w #-21846,46(a3)
     d7c:	671e           	beq.s d9c <main+0xd96>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     d7e:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     d84:	4eae ffc4      	jsr -60(a6)
     d88:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
     d8e:	2200           	move.l d0,d1
     d90:	243c 0000 369d 	move.l #13981,d2
     d96:	7620           	moveq #32,d3
     d98:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     d9c:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
     da2:	224a           	movea.l a2,a1
     da4:	203c 0000 0528 	move.l #1320,d0
     daa:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     dae:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
     db4:	224b           	movea.l a3,a1
     db6:	203c 0000 0528 	move.l #1320,d0
     dbc:	4eae ff2e      	jsr -210(a6)
5    5    5    2    a    a    a    a    9    5    5    5    5    4    a    a
abcd efgh ijkl 1234 5678 9abc defg hijk l123 4567 89ab cdef ghij kl12 3456 789a
1010 1010 1010 0101 0101 0101 0101 0101 0010 1010 1010 1010 1010 1001 0101 0101
a    a    a    5    5    5    5    5    2    a    a    a    a    9    5    5*/ 
void TestZoom4Picture() {
  UWORD *source =AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dc0:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
     dc6:	203c 0000 3300 	move.l #13056,d0
     dcc:	7202           	moveq #2,d1
     dce:	4eae ff3a      	jsr -198(a6)
     dd2:	2600           	move.l d0,d3
  if( source == 0) {
     dd4:	6700 08e0      	beq.w 16b6 <main+0x16b0>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dd8:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
     dde:	203c 0000 3300 	move.l #13056,d0
     de4:	7202           	moveq #2,d1
     de6:	4eae ff3a      	jsr -198(a6)
     dea:	2640           	movea.l d0,a3
  if( destination == 0) {
     dec:	4a80           	tst.l d0
     dee:	6700 09aa      	beq.w 179a <main+0x1794>
     df2:	2003           	move.l d3,d0
     df4:	0680 0000 2ec0 	addi.l #11968,d0
     dfa:	2043           	movea.l d3,a0
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
     dfc:	20bc 5555 5555 	move.l #1431655765,(a0)
     e02:	217c 5555 5555 	move.l #1431655765,4(a0)
     e08:	0004 
     e0a:	217c 5555 5555 	move.l #1431655765,8(a0)
     e10:	0008 
     e12:	217c 5555 5555 	move.l #1431655765,12(a0)
     e18:	000c 
     e1a:	217c 5555 5555 	move.l #1431655765,16(a0)
     e20:	0010 
     e22:	217c 5555 5555 	move.l #1431655765,20(a0)
     e28:	0014 
     e2a:	217c 5555 5555 	move.l #1431655765,24(a0)
     e30:	0018 
     e32:	217c 5555 5555 	move.l #1431655765,28(a0)
     e38:	001c 
     e3a:	217c 5555 5555 	move.l #1431655765,32(a0)
     e40:	0020 
     e42:	217c 5555 5555 	move.l #1431655765,36(a0)
     e48:	0024 
     e4a:	217c 5555 5555 	move.l #1431655765,40(a0)
     e50:	0028 
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
     e52:	217c aaaa aaaa 	move.l #-1431655766,44(a0)
     e58:	002c 
     e5a:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     e60:	0030 
     e62:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     e68:	0034 
     e6a:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     e70:	0038 
     e72:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     e78:	003c 
     e7a:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     e80:	0040 
     e82:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     e88:	0044 
     e8a:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     e90:	0048 
     e92:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     e98:	004c 
     e9a:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     ea0:	0050 
     ea2:	41e8 0058      	lea 88(a0),a0
     ea6:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     eac:	fffc 
  for(int i=0;i<128+8;i++) {
     eae:	b088           	cmp.l a0,d0
     eb0:	6600 ff4a      	bne.w dfc <main+0xdf6>
     eb4:	45eb 0028      	lea 40(a3),a2
     eb8:	0683 0000 2d88 	addi.l #11656,d3
  UWORD nextzoom = 352-28;
     ebe:	3c3c 0144      	move.w #324,d6
  UWORD startofword = 336;
     ec2:	3a3c 0150      	move.w #336,d5
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     ec6:	2b4b ff8c      	move.l a3,-116(a5)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*8-2-i;
     eca:	2403           	move.l d3,d2
     ecc:	0682 ffff d400 	addi.l #-11264,d2
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
     ed2:	280a           	move.l a2,d4
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
     ed4:	ba46           	cmp.w d6,d5
     ed6:	6400 053a      	bcc.w 1412 <main+0x140c>
      UWORD colnr = nextzoom - startofword - 1; 
     eda:	3006           	move.w d6,d0
     edc:	5340           	subq.w #1,d0
     ede:	9045           	sub.w d5,d0
      nextzoom -= 20;
     ee0:	0646 ffec      	addi.w #-20,d6
        Zoom_ZoomBlit( pos4source, pos4dest, shiftright, colnr, 16);
     ee4:	0280 0000 ffff 	andi.l #65535,d0
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     eea:	7210           	moveq #16,d1
     eec:	9280           	sub.l d0,d1
     eee:	2001           	move.l d1,d0
     ef0:	7200           	moveq #0,d1
     ef2:	4641           	not.w d1
     ef4:	e1a9           	lsl.l d0,d1
     ef6:	2641           	movea.l d1,a3
     ef8:	2b6d ff8c ff88 	move.l -116(a5),-120(a5)
  WaitBlit();
     efe:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
     f04:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     f08:	2079 0000 58ea 	movea.l 58ea <hw>,a0
     f0e:	317c 7000 0042 	move.w #28672,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     f14:	317c 6de4 0040 	move.w #28132,64(a0)
  hw->bltafwm = 0xffff;
     f1a:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     f20:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     f26:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     f2c:	317c 0028 0062 	move.w #40,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     f32:	314b 0070      	move.w a3,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     f36:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = srca;
     f3c:	2142 0050      	move.l d2,80(a0)
  hw->bltbpt = srcb;
     f40:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = destination;
     f44:	2144 0054      	move.l d4,84(a0)
  hw->bltsize = height*64+2;
     f48:	317c 0402 0058 	move.w #1026,88(a0)
        pos4source += ZMLINESIZE/2*16;
     f4e:	0682 0000 02c0 	addi.l #704,d2
        pos4dest += ZMLINESIZE/2*16;
     f54:	2004           	move.l d4,d0
     f56:	0680 0000 02c0 	addi.l #704,d0
     f5c:	2b40 ff8c      	move.l d0,-116(a5)
  WaitBlit();
     f60:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
     f66:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     f6a:	2079 0000 58ea 	movea.l 58ea <hw>,a0
     f70:	317c 7000 0042 	move.w #28672,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     f76:	317c 6de4 0040 	move.w #28132,64(a0)
  hw->bltafwm = 0xffff;
     f7c:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     f82:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     f88:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     f8e:	317c 0028 0062 	move.w #40,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     f94:	314b 0070      	move.w a3,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     f98:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = srca;
     f9e:	2142 0050      	move.l d2,80(a0)
  hw->bltbpt = srcb;
     fa2:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = destination;
     fa6:	216d ff8c 0054 	move.l -116(a5),84(a0)
  hw->bltsize = height*64+2;
     fac:	317c 0042 0058 	move.w #66,88(a0)
        pos4dest += ZMLINESIZE/2;
     fb2:	0684 0000 02ec 	addi.l #748,d4
      for(int i=0;i<16;i++) {
     fb8:	b682           	cmp.l d2,d3
     fba:	6600 ff42      	bne.w efe <main+0xef8>
     fbe:	2b6d ff88 ff8c 	move.l -120(a5),-116(a5)
    startofword -= 16;
     fc4:	0645 fff0      	addi.w #-16,d5
     fc8:	558a           	subq.l #2,a2
     fca:	5583           	subq.l #2,d3
  for(int i=0;i<2;i++) {
     fcc:	0c45 0130      	cmpi.w #304,d5
     fd0:	6600 fef8      	bne.w eca <main+0xec4>
     fd4:	266d ff8c      	movea.l -116(a5),a3
  }
  
  Zoom_ZoomIntoPicture( source, destination);
  WaitBlit();
     fd8:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
     fde:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+ZMLINESIZE/2-2; 
  UWORD *valsupposed = destline+ZMLINESIZE/2-2;
  for(int i=0;i<16;i++) {
     fe2:	2c0b           	move.l a3,d6
     fe4:	0686 0000 02e8 	addi.l #744,d6
  WaitBlit();
     fea:	7a10           	moveq #16,d5
     fec:	2046           	movea.l d6,a0
     fee:	41e8 fd40      	lea -704(a0),a0
     ff2:	2b48 ff8c      	move.l a0,-116(a5)
     ff6:	78f0           	moveq #-16,d4
     ff8:	d885           	add.l d5,d4
    for(int i2=0;i2<16;i2+=2) {
      TestRow( valsupposed, valactual, 0x0000, i2+i*17);
     ffa:	2f04           	move.l d4,-(sp)
     ffc:	2f2d ff8c      	move.l -116(a5),-(sp)
    1000:	4eb9 0000 182e 	jsr 182e <TestRow.constprop.3>
  }
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
  char str[ 100] = { 0 };
    1006:	4878 0064      	pea 64 <main+0x5e>
    100a:	42a7           	clr.l -(sp)
    100c:	2f07           	move.l d7,-(sp)
    100e:	4eb9 0000 25d2 	jsr 25d2 <memset>
  UWORD data[2];
  data[1] = numberofline;
    1014:	3204           	move.w d4,d1
    1016:	5241           	addq.w #1,d1
    1018:	3b41 ff92      	move.w d1,-110(a5)

  for(int i=0;i<1;i++) {
    if( (*testpattern++ ^ xormask) != *destination++) {
    101c:	3039 0000 588c 	move.w 588c <destline+0x28>,d0
    1022:	4640           	not.w d0
    1024:	4fef 0014      	lea 20(sp),sp
    1028:	206d ff8c      	movea.l -116(a5),a0
    102c:	b068 002c      	cmp.w 44(a0),d0
    1030:	673a           	beq.s 106c <main+0x1066>
      data[0] = i;
    1032:	426d ff90      	clr.w -112(a5)
      RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    1036:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    103c:	41f9 0000 2f87 	lea 2f87 <incbin_swfont_end+0x1>,a0
    1042:	43ed ff90      	lea -112(a5),a1
    1046:	45f9 0000 27c0 	lea 27c0 <PutChar>,a2
    104c:	2647           	movea.l d7,a3
    104e:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1052:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1058:	4eae ffc4      	jsr -60(a6)
    105c:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1062:	2200           	move.l d0,d1
    1064:	2407           	move.l d7,d2
    1066:	7664           	moveq #100,d3
    1068:	4eae ffd0      	jsr -48(a6)
    }
  }
  if( ( (*testpattern++ ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    106c:	3039 0000 588e 	move.w 588e <destline+0x2a>,d0
    1072:	206d ff8c      	movea.l -116(a5),a0
    1076:	3228 002e      	move.w 46(a0),d1
    107a:	b340           	eor.w d1,d0
    107c:	4640           	not.w d0
    107e:	0240 ff00      	andi.w #-256,d0
    1082:	6700 055e      	beq.w 15e2 <main+0x15dc>
    data[0] = ZMLINESIZE/2;
    1086:	3b7c 0016 ff90 	move.w #22,-112(a5)
    RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    108c:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    1092:	41f9 0000 2f87 	lea 2f87 <incbin_swfont_end+0x1>,a0
    1098:	43ed ff90      	lea -112(a5),a1
    109c:	45f9 0000 27c0 	lea 27c0 <PutChar>,a2
    10a2:	47ed ff9c      	lea -100(a5),a3
    10a6:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    10aa:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    10b0:	4eae ffc4      	jsr -60(a6)
    10b4:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    10ba:	2200           	move.l d0,d1
    10bc:	240b           	move.l a3,d2
    10be:	7664           	moveq #100,d3
    10c0:	4eae ffd0      	jsr -48(a6)
      valactual += ZMLINESIZE/2;
    10c4:	7058           	moveq #88,d0
    10c6:	d1ad ff8c      	add.l d0,-116(a5)
    10ca:	5484           	addq.l #2,d4
    for(int i2=0;i2<16;i2+=2) {
    10cc:	bcad ff8c      	cmp.l -116(a5),d6
    10d0:	6600 ff28      	bne.w ffa <main+0xff4>
    *bp = 0;
    10d4:	4278 0200      	clr.w 200 <main+0x1fa>
    TestRow( valsupposed, valactual, 0x0000, 16+i*17);
    10d8:	2f05           	move.l d5,-(sp)
    10da:	2f06           	move.l d6,-(sp)
    10dc:	4eb9 0000 182e 	jsr 182e <TestRow.constprop.3>
    valactual += ZMLINESIZE/2;
    10e2:	0686 0000 02ec 	addi.l #748,d6
    10e8:	7011           	moveq #17,d0
    10ea:	da80           	add.l d0,d5
  for(int i=0;i<16;i++) {
    10ec:	508f           	addq.l #8,sp
    10ee:	0c85 0000 0120 	cmpi.l #288,d5
    10f4:	6600 fef6      	bne.w fec <main+0xfe6>
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
    10f8:	4eb9 0000 234a 	jsr 234a <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    10fe:	4878 0010      	pea 10 <main+0xa>
    1102:	4879 0000 5824 	pea 5824 <ClsSprites>
    1108:	42a7           	clr.l -(sp)
    110a:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
    1110:	4e94           	jsr (a4)
    1112:	4fef 0010      	lea 16(sp),sp
    1116:	4a80           	tst.l d0
    1118:	661e           	bne.s 1138 <main+0x1132>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    111a:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1120:	4eae ffc4      	jsr -60(a6)
    1124:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    112a:	2200           	move.l d0,d1
    112c:	243c 0000 338b 	move.l #13195,d2
    1132:	762c           	moveq #44,d3
    1134:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    1138:	4878 000c      	pea c <main+0x6>
    113c:	4879 0000 57f4 	pea 57f4 <ClScreen>
    1142:	4878 0010      	pea 10 <main+0xa>
    1146:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
    114c:	4e94           	jsr (a4)
    114e:	4fef 0010      	lea 16(sp),sp
    1152:	4a80           	tst.l d0
    1154:	661e           	bne.s 1174 <main+0x116e>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    1156:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    115c:	4eae ffc4      	jsr -60(a6)
    1160:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1166:	2200           	move.l d0,d1
    1168:	243c 0000 33c1 	move.l #13249,d2
    116e:	7636           	moveq #54,d3
    1170:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    1174:	4878 0002      	pea 2 <_start+0x2>
    1178:	4879 0000 57ec 	pea 57ec <ClColor>
    117e:	4878 001e      	pea 1e <main+0x18>
    1182:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
    1188:	4e94           	jsr (a4)
    118a:	4fef 0010      	lea 16(sp),sp
    118e:	4a80           	tst.l d0
    1190:	661e           	bne.s 11b0 <main+0x11aa>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1192:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1198:	4eae ffc4      	jsr -60(a6)
    119c:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    11a2:	2200           	move.l d0,d1
    11a4:	243c 0000 316e 	move.l #12654,d2
    11aa:	7621           	moveq #33,d3
    11ac:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    11b0:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdd027>
    11b4:	4878 0020      	pea 20 <main+0x1a>
    11b8:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
    11be:	4eb9 0000 19fa 	jsr 19fa <TestCopperlistPos>
    11c4:	4fef 000c      	lea 12(sp),sp
    11c8:	4a80           	tst.l d0
    11ca:	6700 0382      	beq.w 154e <main+0x1548>
    Write( Output(), "Copperlist End not correctly set.\n", 34);

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    11ce:	2479 0000 58fe 	movea.l 58fe <DrawBuffer>,a2
    11d4:	4879 0000 3737 	pea 3737 <incbin_swfont_end+0x7b1>
    11da:	2f0a           	move.l a2,-(sp)
    11dc:	4eb9 0000 17e0 	jsr 17e0 <WriteFont.constprop.5>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    11e2:	508f           	addq.l #8,sp
    11e4:	0c52 ff00      	cmpi.w #-256,(a2)
    11e8:	671e           	beq.s 1208 <main+0x1202>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    11ea:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    11f0:	4eae ffc4      	jsr -60(a6)
    11f4:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    11fa:	2200           	move.l d0,d1
    11fc:	243c 0000 3748 	move.l #14152,d2
    1202:	7631           	moveq #49,d3
    1204:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    1208:	2f3c 0000 c800 	move.l #51200,-(sp)
    120e:	4878 0084      	pea 84 <main+0x7e>
    1212:	4eb9 0000 2488 	jsr 2488 <FreeDisplay>
  RunTests();
	Delay(50);
    1218:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    121e:	7232           	moveq #50,d1
    1220:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    1224:	247c 00f0 ff60 	movea.l #15794016,a2
    122a:	508f           	addq.l #8,sp
    122c:	4a92           	tst.l (a2)
    122e:	6718           	beq.s 1248 <main+0x1242>
    1230:	4878 0001      	pea 1 <_start+0x1>
    1234:	47f9 0000 18f0 	lea 18f0 <warpmode.part.0>,a3
    123a:	4e93           	jsr (a3)
    123c:	588f           	addq.l #4,sp
    123e:	4a92           	tst.l (a2)
    1240:	6706           	beq.s 1248 <main+0x1242>
    1242:	42a7           	clr.l -(sp)
    1244:	4e93           	jsr (a3)
    1246:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    1248:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
    124e:	23ee 0022 0000 	move.l 34(a6),58d4 <ActiView>
    1254:	58d4 
	OwnBlitter();
    1256:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    125a:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
    1260:	4eae ff1c      	jsr -228(a6)
	Disable();
    1264:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    126a:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    126e:	2679 0000 58ea 	movea.l 58ea <hw>,a3
    1274:	302b 0010      	move.w 16(a3),d0
    1278:	33c0 0000 58d8 	move.w d0,58d8 <SystemADKCON>
	SystemInts=hw->intenar;
    127e:	302b 001c      	move.w 28(a3),d0
    1282:	33c0 0000 58dc 	move.w d0,58dc <SystemInts>
	SystemDMA=hw->dmaconr;
    1288:	302b 0002      	move.w 2(a3),d0
    128c:	33c0 0000 58da 	move.w d0,58da <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    1292:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    1298:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
    129e:	45f9 0000 24fa 	lea 24fa <WaitVbl>,a2
    12a4:	4e92           	jsr (a2)
	WaitVbl();
    12a6:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
    12a8:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    12ae:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
    12b4:	93c9           	suba.l a1,a1
    12b6:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    12ba:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
    12c0:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    12c4:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
    12ca:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    12ce:	4e92           	jsr (a2)
	WaitVbl();
    12d0:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    12d2:	3b7c 4e7a ff9c 	move.w #20090,-100(a5)
    12d8:	3b7c 0801 ff9e 	move.w #2049,-98(a5)
    12de:	3b7c 4e73 ffa0 	move.w #20083,-96(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    12e4:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    12ea:	082e 0000 0129 	btst #0,297(a6)
    12f0:	6700 047e      	beq.w 1770 <main+0x176a>
		vbr = (APTR)Supervisor((void*)getvbr);
    12f4:	cf8d           	exg d7,a5
    12f6:	4eae ffe2      	jsr -30(a6)
    12fa:	cf8d           	exg d7,a5

	VBR=GetVBR();
    12fc:	23c0 0000 58de 	move.l d0,58de <VBR.lto_priv.6>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    1302:	2079 0000 58de 	movea.l 58de <VBR.lto_priv.6>,a0
    1308:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    130c:	23c2 0000 58e2 	move.l d2,58e2 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    1312:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
    1314:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1316:	2079 0000 58ea 	movea.l 58ea <hw>,a0
    131c:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1320:	3028 0002      	move.w 2(a0),d0
    1324:	0800 000e      	btst #14,d0
    1328:	66f6           	bne.s 1320 <main+0x131a>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    132a:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    1330:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    1336:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    133c:	2279 0000 58de 	movea.l 58de <VBR.lto_priv.6>,a1
    1342:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    1346:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
    134c:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    1352:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    1358:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    135e:	3039 0000 58dc 	move.w 58dc <SystemInts>,d0
    1364:	0040 8000      	ori.w #-32768,d0
    1368:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    136c:	3039 0000 58da 	move.w 58da <SystemDMA>,d0
    1372:	0040 8000      	ori.w #-32768,d0
    1376:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    137a:	3039 0000 58d8 	move.w 58d8 <SystemADKCON>,d0
    1380:	0040 8000      	ori.w #-32768,d0
    1384:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    1388:	2279 0000 58d4 	movea.l 58d4 <ActiView>,a1
    138e:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    1392:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
    1398:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    139c:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
    13a2:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    13a6:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
    13ac:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    13b0:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
    13b6:	4eae fe32      	jsr -462(a6)
	Enable();
    13ba:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    13c0:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    13c4:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    13ca:	2279 0000 590e 	movea.l 590e <DOSBase>,a1
    13d0:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    13d4:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    13da:	2279 0000 58e6 	movea.l 58e6 <GfxBase>,a1
    13e0:	4eae fe62      	jsr -414(a6)
}
    13e4:	7000           	moveq #0,d0
    13e6:	4ced 5cfc ff60 	movem.l -160(a5),d2-d7/a2-a4/a6
    13ec:	4e5d           	unlk a5
    13ee:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    13f0:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    13f6:	4eae ffc4      	jsr -60(a6)
    13fa:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1400:	2200           	move.l d0,d1
    1402:	243c 0000 338b 	move.l #13195,d2
    1408:	762c           	moveq #44,d3
    140a:	4eae ffd0      	jsr -48(a6)
    140e:	6000 ed98      	bra.w 1a8 <main+0x1a2>
  WaitBlit();
    1412:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
    1418:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    141c:	2079 0000 58ea 	movea.l 58ea <hw>,a0
    1422:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    1428:	317c 79f0 0040 	move.w #31216,64(a0)
  hw->bltafwm = 0xffff;
    142e:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1434:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    143a:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1440:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = (UWORD *) source;
    1446:	2142 0050      	move.l d2,80(a0)
  hw->bltdpt = (UWORD *) destination;
    144a:	2144 0054      	move.l d4,84(a0)
  hw->bltsize = height*64+2;
    144e:	317c 0402 0058 	move.w #1026,88(a0)
        pos4source += ZMLINESIZE/2*16;
    1454:	0682 0000 02c0 	addi.l #704,d2
        pos4dest += ZMLINESIZE/2*16;
    145a:	2644           	movea.l d4,a3
    145c:	47eb 02c0      	lea 704(a3),a3
  WaitBlit();
    1460:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
    1466:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    146a:	2079 0000 58ea 	movea.l 58ea <hw>,a0
    1470:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    1476:	317c 79f0 0040 	move.w #31216,64(a0)
  hw->bltafwm = 0xffff;
    147c:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1482:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1488:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    148e:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = (UWORD *) source;
    1494:	2142 0050      	move.l d2,80(a0)
  hw->bltdpt = (UWORD *) destination;
    1498:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
    149c:	317c 0042 0058 	move.w #66,88(a0)
        pos4dest += ZMLINESIZE/2;
    14a2:	0684 0000 02ec 	addi.l #748,d4
      for(int i=0;i<16;i++) {
    14a8:	b682           	cmp.l d2,d3
    14aa:	6700 fb18      	beq.w fc4 <main+0xfbe>
  WaitBlit();
    14ae:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
    14b4:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    14b8:	2079 0000 58ea 	movea.l 58ea <hw>,a0
    14be:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    14c4:	317c 79f0 0040 	move.w #31216,64(a0)
  hw->bltafwm = 0xffff;
    14ca:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    14d0:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    14d6:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    14dc:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = (UWORD *) source;
    14e2:	2142 0050      	move.l d2,80(a0)
  hw->bltdpt = (UWORD *) destination;
    14e6:	2144 0054      	move.l d4,84(a0)
  hw->bltsize = height*64+2;
    14ea:	317c 0402 0058 	move.w #1026,88(a0)
        pos4source += ZMLINESIZE/2*16;
    14f0:	0682 0000 02c0 	addi.l #704,d2
        pos4dest += ZMLINESIZE/2*16;
    14f6:	2644           	movea.l d4,a3
    14f8:	47eb 02c0      	lea 704(a3),a3
  WaitBlit();
    14fc:	2c79 0000 58e6 	movea.l 58e6 <GfxBase>,a6
    1502:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    1506:	2079 0000 58ea 	movea.l 58ea <hw>,a0
    150c:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    1512:	317c 79f0 0040 	move.w #31216,64(a0)
  hw->bltafwm = 0xffff;
    1518:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    151e:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1524:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    152a:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = (UWORD *) source;
    1530:	2142 0050      	move.l d2,80(a0)
  hw->bltdpt = (UWORD *) destination;
    1534:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
    1538:	317c 0042 0058 	move.w #66,88(a0)
        pos4dest += ZMLINESIZE/2;
    153e:	0684 0000 02ec 	addi.l #748,d4
      for(int i=0;i<16;i++) {
    1544:	b682           	cmp.l d2,d3
    1546:	6600 feca      	bne.w 1412 <main+0x140c>
    154a:	6000 fa78      	bra.w fc4 <main+0xfbe>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    154e:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1554:	4eae ffc4      	jsr -60(a6)
    1558:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    155e:	2200           	move.l d0,d1
    1560:	243c 0000 3190 	move.l #12688,d2
    1566:	7622           	moveq #34,d3
    1568:	4eae ffd0      	jsr -48(a6)
    156c:	6000 fc60      	bra.w 11ce <main+0x11c8>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1570:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1576:	4eae ffc4      	jsr -60(a6)
    157a:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1580:	2200           	move.l d0,d1
    1582:	243c 0000 316e 	move.l #12654,d2
    1588:	7621           	moveq #33,d3
    158a:	4eae ffd0      	jsr -48(a6)
    158e:	2079 0000 590a 	movea.l 590a <Copperlist1>,a0
    1594:	6000 ed86      	bra.w 31c <main+0x316>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    1598:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    159e:	4eae ffc4      	jsr -60(a6)
    15a2:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    15a8:	2200           	move.l d0,d1
    15aa:	243c 0000 33c1 	move.l #13249,d2
    15b0:	7636           	moveq #54,d3
    15b2:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    15b6:	23fc 0004 0000 	move.l #262144,58fe <DrawBuffer>
    15bc:	0000 58fe 
  ViewBuffer = (ULONG *)0x50000;
    15c0:	23fc 0005 0000 	move.l #327680,58f2 <ViewBuffer>
    15c6:	0000 58f2 
  SetBplPointers();
    15ca:	45f9 0000 231e 	lea 231e <SetBplPointers>,a2
    15d0:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    15d2:	0cb9 0005 0000 	cmpi.l #327680,58fe <DrawBuffer>
    15d8:	0000 58fe 
    15dc:	6600 eca2      	bne.w 280 <main+0x27a>
    15e0:	6038           	bra.s 161a <main+0x1614>
      valactual += ZMLINESIZE/2;
    15e2:	7258           	moveq #88,d1
    15e4:	d3ad ff8c      	add.l d1,-116(a5)
    15e8:	5484           	addq.l #2,d4
    for(int i2=0;i2<16;i2+=2) {
    15ea:	bcad ff8c      	cmp.l -116(a5),d6
    15ee:	6600 fa0a      	bne.w ffa <main+0xff4>
    *bp = 0;
    15f2:	4278 0200      	clr.w 200 <main+0x1fa>
    TestRow( valsupposed, valactual, 0x0000, 16+i*17);
    15f6:	2f05           	move.l d5,-(sp)
    15f8:	2f06           	move.l d6,-(sp)
    15fa:	4eb9 0000 182e 	jsr 182e <TestRow.constprop.3>
    valactual += ZMLINESIZE/2;
    1600:	0686 0000 02ec 	addi.l #748,d6
    1606:	7011           	moveq #17,d0
    1608:	da80           	add.l d0,d5
  for(int i=0;i<16;i++) {
    160a:	508f           	addq.l #8,sp
    160c:	0c85 0000 0120 	cmpi.l #288,d5
    1612:	6600 f9d8      	bne.w fec <main+0xfe6>
    1616:	6000 fae0      	bra.w 10f8 <main+0x10f2>
    161a:	0cb9 0004 0000 	cmpi.l #262144,58f2 <ViewBuffer>
    1620:	0000 58f2 
    1624:	6700 ec78      	beq.w 29e <main+0x298>
    Write( Output(), 
    1628:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    162e:	4eae ffc4      	jsr -60(a6)
    1632:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1638:	2200           	move.l d0,d1
    163a:	243c 0000 30b8 	move.l #12472,d2
    1640:	763b           	moveq #59,d3
    1642:	4eae ffd0      	jsr -48(a6)
    1646:	6000 ec56      	bra.w 29e <main+0x298>
		Exit(0);
    164a:	9dce           	suba.l a6,a6
    164c:	7200           	moveq #0,d1
    164e:	4eae ff70      	jsr -144(a6)
    1652:	6000 ea00      	bra.w 54 <main+0x4e>
		Exit(0);
    1656:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    165c:	7200           	moveq #0,d1
    165e:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    1662:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    1668:	43f9 0000 307d 	lea 307d <incbin_swfont_end+0xf7>,a1
    166e:	7000           	moveq #0,d0
    1670:	4eae fdd8      	jsr -552(a6)
    1674:	23c0 0000 590e 	move.l d0,590e <DOSBase>
	if (!DOSBase)
    167a:	6600 e9d8      	bne.w 54 <main+0x4e>
    167e:	60ca           	bra.s 164a <main+0x1644>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    1680:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1686:	4eae ffc4      	jsr -60(a6)
    168a:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1690:	2200           	move.l d0,d1
    1692:	243c 0000 3647 	move.l #13895,d2
    1698:	7635           	moveq #53,d3
    169a:	4eae ffd0      	jsr -48(a6)
  UWORD *source =AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    169e:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    16a4:	203c 0000 3300 	move.l #13056,d0
    16aa:	7202           	moveq #2,d1
    16ac:	4eae ff3a      	jsr -198(a6)
    16b0:	2600           	move.l d0,d3
  if( source == 0) {
    16b2:	6600 f724      	bne.w dd8 <main+0xdd2>
    Write(  Output(), 
    16b6:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    16bc:	4eae ffc4      	jsr -60(a6)
    16c0:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    16c6:	2200           	move.l d0,d1
    16c8:	243c 0000 36be 	move.l #14014,d2
    16ce:	7639           	moveq #57,d3
    16d0:	4eae ffd0      	jsr -48(a6)
  PrepareDisplaySW();
    16d4:	4eb9 0000 234a 	jsr 234a <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    16da:	4878 0010      	pea 10 <main+0xa>
    16de:	4879 0000 5824 	pea 5824 <ClsSprites>
    16e4:	42a7           	clr.l -(sp)
    16e6:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
    16ec:	4e94           	jsr (a4)
    16ee:	4fef 0010      	lea 16(sp),sp
    16f2:	4a80           	tst.l d0
    16f4:	6600 fa42      	bne.w 1138 <main+0x1132>
    16f8:	6000 fa20      	bra.w 111a <main+0x1114>
    Write(  Output(), 
    16fc:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1702:	4eae ffc4      	jsr -60(a6)
    1706:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    170c:	2200           	move.l d0,d1
    170e:	243c 0000 34c1 	move.l #13505,d2
    1714:	7636           	moveq #54,d3
    1716:	4eae ffd0      	jsr -48(a6)
  PrepareDisplayZoom();
    171a:	4e93           	jsr (a3)
  UWORD *destination = (UWORD *)DrawBuffer;
    171c:	2079 0000 58fe 	movea.l 58fe <DrawBuffer>,a0
  *destination= 0x0000;
    1722:	4250           	clr.w (a0)
  *destination= 0x000f;
    1724:	317c 000f 002c 	move.w #15,44(a0)
  *destination = 0x000f;
    172a:	317c 000f 41d4 	move.w #15,16852(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    1730:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    1736:	203c 0000 c800 	move.l #51200,d0
    173c:	7202           	moveq #2,d1
    173e:	4eae ff3a      	jsr -198(a6)
    1742:	2440           	movea.l d0,a2
    1744:	23c0 0000 58d0 	move.l d0,58d0 <Zoom_Source>
  if( Zoom_Source == 0) {
    174a:	6600 f216      	bne.w 962 <main+0x95c>
    Write(  Output(), 
    174e:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1754:	4eae ffc4      	jsr -60(a6)
    1758:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    175e:	2200           	move.l d0,d1
    1760:	243c 0000 34c1 	move.l #13505,d2
    1766:	7636           	moveq #54,d3
    1768:	4eae ffd0      	jsr -48(a6)
    return;
    176c:	6000 f40e      	bra.w b7c <main+0xb76>
	APTR vbr = 0;
    1770:	7000           	moveq #0,d0
	VBR=GetVBR();
    1772:	23c0 0000 58de 	move.l d0,58de <VBR.lto_priv.6>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    1778:	2079 0000 58de 	movea.l 58de <VBR.lto_priv.6>,a0
    177e:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    1782:	23c2 0000 58e2 	move.l d2,58e2 <SystemIrq>
	WaitVbl();
    1788:	4e92           	jsr (a2)
	WaitVbl();
    178a:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    178c:	2079 0000 58ea 	movea.l 58ea <hw>,a0
    1792:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1796:	6000 fb88      	bra.w 1320 <main+0x131a>
    Write(  Output(), 
    179a:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    17a0:	4eae ffc4      	jsr -60(a6)
    17a4:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    17aa:	2200           	move.l d0,d1
    17ac:	243c 0000 36f8 	move.l #14072,d2
    17b2:	763d           	moveq #61,d3
    17b4:	4eae ffd0      	jsr -48(a6)
  PrepareDisplaySW();
    17b8:	4eb9 0000 234a 	jsr 234a <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    17be:	4878 0010      	pea 10 <main+0xa>
    17c2:	4879 0000 5824 	pea 5824 <ClsSprites>
    17c8:	42a7           	clr.l -(sp)
    17ca:	2f39 0000 590a 	move.l 590a <Copperlist1>,-(sp)
    17d0:	4e94           	jsr (a4)
    17d2:	4fef 0010      	lea 16(sp),sp
    17d6:	4a80           	tst.l d0
    17d8:	6600 f95e      	bne.w 1138 <main+0x1132>
    17dc:	6000 f93c      	bra.w 111a <main+0x1114>

000017e0 <WriteFont.constprop.5>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    17e0:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    17e4:	206f 0008      	movea.l 8(sp),a0
    17e8:	1010           	move.b (a0),d0
    17ea:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    17ee:	4880           	ext.w d0
    17f0:	48c0           	ext.l d0
    17f2:	e788           	lsl.l #3,d0
  fntptr += charpos;
    17f4:	4880           	ext.w d0
    17f6:	3040           	movea.w d0,a0
    17f8:	d1c8           	adda.l a0,a0
    17fa:	d1fc 0000 5890 	adda.l #22672,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    1800:	3290           	move.w (a0),(a1)
    1802:	3368 0002 0050 	move.w 2(a0),80(a1)
    1808:	3368 0004 00a0 	move.w 4(a0),160(a1)
    180e:	3368 0006 00f0 	move.w 6(a0),240(a1)
    1814:	3368 0008 0140 	move.w 8(a0),320(a1)
    181a:	3368 000a 0190 	move.w 10(a0),400(a1)
    1820:	3368 000c 01e0 	move.w 12(a0),480(a1)
    1826:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    182c:	4e75           	rts

0000182e <TestRow.constprop.3>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    182e:	4fef ff98      	lea -104(sp),sp
    1832:	48e7 303a      	movem.l d2-d3/a2-a4/a6,-(sp)
    1836:	286f 0084      	movea.l 132(sp),a4
  char str[ 100] = { 0 };
    183a:	47ef 001c      	lea 28(sp),a3
    183e:	4878 0064      	pea 64 <main+0x5e>
    1842:	42a7           	clr.l -(sp)
    1844:	2f0b           	move.l a3,-(sp)
    1846:	4eba 0d8a      	jsr 25d2 <memset>(pc)
  data[1] = numberofline;
    184a:	3f6f 0096 0026 	move.w 150(sp),38(sp)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1850:	4fef 000c      	lea 12(sp),sp
    1854:	3014           	move.w (a4),d0
    1856:	b079 0000 588c 	cmp.w 588c <destline+0x28>,d0
    185c:	6738           	beq.s 1896 <TestRow.constprop.3+0x68>
      data[0] = i;
    185e:	426f 0018      	clr.w 24(sp)
      RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    1862:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    1868:	41f9 0000 2f87 	lea 2f87 <incbin_swfont_end+0x1>,a0
    186e:	43ef 0018      	lea 24(sp),a1
    1872:	45f9 0000 27c0 	lea 27c0 <PutChar>,a2
    1878:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    187c:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1882:	4eae ffc4      	jsr -60(a6)
    1886:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    188c:	2200           	move.l d0,d1
    188e:	240b           	move.l a3,d2
    1890:	7664           	moveq #100,d3
    1892:	4eae ffd0      	jsr -48(a6)
  if( ( (*testpattern++ ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1896:	3039 0000 588e 	move.w 588e <destline+0x2a>,d0
    189c:	322c 0002      	move.w 2(a4),d1
    18a0:	b340           	eor.w d1,d0
    18a2:	0240 ff00      	andi.w #-256,d0
    18a6:	673e           	beq.s 18e6 <TestRow.constprop.3+0xb8>
    data[0] = ZMLINESIZE/2;
    18a8:	3f7c 0016 0018 	move.w #22,24(sp)
    RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    18ae:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    18b4:	41f9 0000 2f87 	lea 2f87 <incbin_swfont_end+0x1>,a0
    18ba:	43ef 0018      	lea 24(sp),a1
    18be:	45f9 0000 27c0 	lea 27c0 <PutChar>,a2
    18c4:	47ef 001c      	lea 28(sp),a3
    18c8:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    18cc:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    18d2:	4eae ffc4      	jsr -60(a6)
    18d6:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    18dc:	2200           	move.l d0,d1
    18de:	240b           	move.l a3,d2
    18e0:	7664           	moveq #100,d3
    18e2:	4eae ffd0      	jsr -48(a6)
  }
}
    18e6:	4cdf 5c0c      	movem.l (sp)+,d2-d3/a2-a4/a6
    18ea:	4fef 0068      	lea 104(sp),sp
    18ee:	4e75           	rts

000018f0 <warpmode.part.0>:
void warpmode(int on) 
    18f0:	598f           	subq.l #4,sp
    18f2:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    18f4:	4aaf 000c      	tst.l 12(sp)
    18f8:	674c           	beq.s 1946 <warpmode.part.0+0x56>
    18fa:	4878 0001      	pea 1 <_start+0x1>
    18fe:	740b           	moveq #11,d2
    1900:	d48f           	add.l sp,d2
    1902:	2f02           	move.l d2,-(sp)
    1904:	42a7           	clr.l -(sp)
    1906:	4879 0000 2fe3 	pea 2fe3 <incbin_swfont_end+0x5d>
    190c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd028>
    1910:	4878 0052      	pea 52 <main+0x4c>
    1914:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
    191a:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    191e:	203c 0000 2fc9 	move.l #12233,d0
    1924:	4878 0001      	pea 1 <_start+0x1>
    1928:	2f02           	move.l d2,-(sp)
    192a:	42a7           	clr.l -(sp)
    192c:	2f00           	move.l d0,-(sp)
    192e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd028>
    1932:	4878 0052      	pea 52 <main+0x4c>
    1936:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
	}
}
    193c:	4fef 0018      	lea 24(sp),sp
    1940:	241f           	move.l (sp)+,d2
    1942:	588f           	addq.l #4,sp
    1944:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    1946:	4878 0001      	pea 1 <_start+0x1>
    194a:	740b           	moveq #11,d2
    194c:	d48f           	add.l sp,d2
    194e:	2f02           	move.l d2,-(sp)
    1950:	42a7           	clr.l -(sp)
    1952:	4879 0000 2fed 	pea 2fed <incbin_swfont_end+0x67>
    1958:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd028>
    195c:	4878 0052      	pea 52 <main+0x4c>
    1960:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
    1966:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    196a:	203c 0000 2fb0 	move.l #12208,d0
    1970:	4878 0001      	pea 1 <_start+0x1>
    1974:	2f02           	move.l d2,-(sp)
    1976:	42a7           	clr.l -(sp)
    1978:	2f00           	move.l d0,-(sp)
    197a:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd028>
    197e:	4878 0052      	pea 52 <main+0x4c>
    1982:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
}
    1988:	4fef 0018      	lea 24(sp),sp
    198c:	241f           	move.l (sp)+,d2
    198e:	588f           	addq.l #4,sp
    1990:	4e75           	rts

00001992 <KPrintF>:
{
    1992:	4fef ff80      	lea -128(sp),sp
    1996:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    199a:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
    19a0:	6734           	beq.s 19d6 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    19a2:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    19a8:	206f 0090      	movea.l 144(sp),a0
    19ac:	43ef 0094      	lea 148(sp),a1
    19b0:	45f9 0000 27c0 	lea 27c0 <PutChar>,a2
    19b6:	47ef 000c      	lea 12(sp),a3
    19ba:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    19be:	2f0b           	move.l a3,-(sp)
    19c0:	4878 0056      	pea 56 <main+0x50>
    19c4:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
    19ca:	508f           	addq.l #8,sp
}
    19cc:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    19d0:	4fef 0080      	lea 128(sp),sp
    19d4:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    19d6:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    19dc:	206f 0090      	movea.l 144(sp),a0
    19e0:	43ef 0094      	lea 148(sp),a1
    19e4:	45f9 0000 27b2 	lea 27b2 <KPutCharX>,a2
    19ea:	97cb           	suba.l a3,a3
    19ec:	4eae fdf6      	jsr -522(a6)
}
    19f0:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    19f4:	4fef 0080      	lea 128(sp),sp
    19f8:	4e75           	rts

000019fa <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    19fa:	202f 0008      	move.l 8(sp),d0
    19fe:	d080           	add.l d0,d0
    1a00:	d080           	add.l d0,d0
    1a02:	206f 0004      	movea.l 4(sp),a0
    1a06:	2030 0800      	move.l (0,a0,d0.l),d0
    1a0a:	b0af 000c      	cmp.l 12(sp),d0
    1a0e:	57c0           	seq d0
    1a10:	4880           	ext.w d0
    1a12:	48c0           	ext.l d0
}
    1a14:	4480           	neg.l d0
    1a16:	4e75           	rts

00001a18 <TestCopperlistBatch>:
                                                                  long length) {
    1a18:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    1a1c:	246f 0010      	movea.l 16(sp),a2
    1a20:	206f 0014      	movea.l 20(sp),a0
    1a24:	226f 0018      	movea.l 24(sp),a1
    1a28:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    1a2c:	2008           	move.l a0,d0
    1a2e:	d088           	add.l a0,d0
    1a30:	d080           	add.l d0,d0
    1a32:	2411           	move.l (a1),d2
    1a34:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    1a38:	6600 01ac      	bne.w 1be6 <TestCopperlistBatch+0x1ce>
    1a3c:	2008           	move.l a0,d0
    1a3e:	5280           	addq.l #1,d0
    1a40:	d080           	add.l d0,d0
    1a42:	d080           	add.l d0,d0
    1a44:	2032 0800      	move.l (0,a2,d0.l),d0
    1a48:	b0a9 0004      	cmp.l 4(a1),d0
    1a4c:	6600 0198      	bne.w 1be6 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1a50:	7002           	moveq #2,d0
    1a52:	b081           	cmp.l d1,d0
    1a54:	6700 0188      	beq.w 1bde <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1a58:	2008           	move.l a0,d0
    1a5a:	5480           	addq.l #2,d0
    1a5c:	d080           	add.l d0,d0
    1a5e:	d080           	add.l d0,d0
    1a60:	2032 0800      	move.l (0,a2,d0.l),d0
    1a64:	b0a9 0008      	cmp.l 8(a1),d0
    1a68:	6600 017c      	bne.w 1be6 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1a6c:	7403           	moveq #3,d2
    1a6e:	b481           	cmp.l d1,d2
    1a70:	6700 016c      	beq.w 1bde <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1a74:	2008           	move.l a0,d0
    1a76:	5680           	addq.l #3,d0
    1a78:	d080           	add.l d0,d0
    1a7a:	d080           	add.l d0,d0
    1a7c:	2032 0800      	move.l (0,a2,d0.l),d0
    1a80:	b0a9 000c      	cmp.l 12(a1),d0
    1a84:	6600 0160      	bne.w 1be6 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1a88:	7004           	moveq #4,d0
    1a8a:	b081           	cmp.l d1,d0
    1a8c:	6700 0150      	beq.w 1bde <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1a90:	2008           	move.l a0,d0
    1a92:	5880           	addq.l #4,d0
    1a94:	d080           	add.l d0,d0
    1a96:	d080           	add.l d0,d0
    1a98:	2032 0800      	move.l (0,a2,d0.l),d0
    1a9c:	b0a9 0010      	cmp.l 16(a1),d0
    1aa0:	6600 0144      	bne.w 1be6 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1aa4:	7405           	moveq #5,d2
    1aa6:	b481           	cmp.l d1,d2
    1aa8:	6700 0134      	beq.w 1bde <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1aac:	2008           	move.l a0,d0
    1aae:	5a80           	addq.l #5,d0
    1ab0:	d080           	add.l d0,d0
    1ab2:	d080           	add.l d0,d0
    1ab4:	2032 0800      	move.l (0,a2,d0.l),d0
    1ab8:	b0a9 0014      	cmp.l 20(a1),d0
    1abc:	6600 0128      	bne.w 1be6 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1ac0:	7006           	moveq #6,d0
    1ac2:	b081           	cmp.l d1,d0
    1ac4:	6700 0118      	beq.w 1bde <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1ac8:	2008           	move.l a0,d0
    1aca:	5c80           	addq.l #6,d0
    1acc:	d080           	add.l d0,d0
    1ace:	d080           	add.l d0,d0
    1ad0:	2032 0800      	move.l (0,a2,d0.l),d0
    1ad4:	b0a9 0018      	cmp.l 24(a1),d0
    1ad8:	6600 010c      	bne.w 1be6 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1adc:	7407           	moveq #7,d2
    1ade:	b481           	cmp.l d1,d2
    1ae0:	6700 00fc      	beq.w 1bde <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1ae4:	2008           	move.l a0,d0
    1ae6:	5e80           	addq.l #7,d0
    1ae8:	d080           	add.l d0,d0
    1aea:	d080           	add.l d0,d0
    1aec:	2032 0800      	move.l (0,a2,d0.l),d0
    1af0:	b0a9 001c      	cmp.l 28(a1),d0
    1af4:	6600 00f0      	bne.w 1be6 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1af8:	7008           	moveq #8,d0
    1afa:	b081           	cmp.l d1,d0
    1afc:	6700 00e0      	beq.w 1bde <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b00:	2008           	move.l a0,d0
    1b02:	5080           	addq.l #8,d0
    1b04:	d080           	add.l d0,d0
    1b06:	d080           	add.l d0,d0
    1b08:	2032 0800      	move.l (0,a2,d0.l),d0
    1b0c:	b0a9 0020      	cmp.l 32(a1),d0
    1b10:	6600 00d4      	bne.w 1be6 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b14:	7409           	moveq #9,d2
    1b16:	b481           	cmp.l d1,d2
    1b18:	6700 00c4      	beq.w 1bde <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b1c:	47e8 0009      	lea 9(a0),a3
    1b20:	200b           	move.l a3,d0
    1b22:	d08b           	add.l a3,d0
    1b24:	d080           	add.l d0,d0
    1b26:	2032 0800      	move.l (0,a2,d0.l),d0
    1b2a:	b0a9 0024      	cmp.l 36(a1),d0
    1b2e:	6600 00b6      	bne.w 1be6 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b32:	700a           	moveq #10,d0
    1b34:	b081           	cmp.l d1,d0
    1b36:	6700 00a6      	beq.w 1bde <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b3a:	47e8 000a      	lea 10(a0),a3
    1b3e:	200b           	move.l a3,d0
    1b40:	d08b           	add.l a3,d0
    1b42:	d080           	add.l d0,d0
    1b44:	2032 0800      	move.l (0,a2,d0.l),d0
    1b48:	b0a9 0028      	cmp.l 40(a1),d0
    1b4c:	6600 0098      	bne.w 1be6 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b50:	740b           	moveq #11,d2
    1b52:	b481           	cmp.l d1,d2
    1b54:	6700 0088      	beq.w 1bde <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b58:	47e8 000b      	lea 11(a0),a3
    1b5c:	200b           	move.l a3,d0
    1b5e:	d08b           	add.l a3,d0
    1b60:	d080           	add.l d0,d0
    1b62:	2032 0800      	move.l (0,a2,d0.l),d0
    1b66:	b0a9 002c      	cmp.l 44(a1),d0
    1b6a:	667a           	bne.s 1be6 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b6c:	700c           	moveq #12,d0
    1b6e:	b081           	cmp.l d1,d0
    1b70:	676c           	beq.s 1bde <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b72:	47e8 000c      	lea 12(a0),a3
    1b76:	200b           	move.l a3,d0
    1b78:	d08b           	add.l a3,d0
    1b7a:	d080           	add.l d0,d0
    1b7c:	2032 0800      	move.l (0,a2,d0.l),d0
    1b80:	b0a9 0030      	cmp.l 48(a1),d0
    1b84:	6660           	bne.s 1be6 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b86:	740d           	moveq #13,d2
    1b88:	b481           	cmp.l d1,d2
    1b8a:	6752           	beq.s 1bde <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b8c:	47e8 000d      	lea 13(a0),a3
    1b90:	200b           	move.l a3,d0
    1b92:	d08b           	add.l a3,d0
    1b94:	d080           	add.l d0,d0
    1b96:	2032 0800      	move.l (0,a2,d0.l),d0
    1b9a:	b0a9 0034      	cmp.l 52(a1),d0
    1b9e:	6646           	bne.s 1be6 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1ba0:	700e           	moveq #14,d0
    1ba2:	b081           	cmp.l d1,d0
    1ba4:	6738           	beq.s 1bde <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1ba6:	47e8 000e      	lea 14(a0),a3
    1baa:	200b           	move.l a3,d0
    1bac:	d08b           	add.l a3,d0
    1bae:	d080           	add.l d0,d0
    1bb0:	2032 0800      	move.l (0,a2,d0.l),d0
    1bb4:	b0a9 0038      	cmp.l 56(a1),d0
    1bb8:	662c           	bne.s 1be6 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1bba:	7410           	moveq #16,d2
    1bbc:	b481           	cmp.l d1,d2
    1bbe:	661e           	bne.s 1bde <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1bc0:	41e8 000f      	lea 15(a0),a0
    1bc4:	d1c8           	adda.l a0,a0
    1bc6:	d1c8           	adda.l a0,a0
    1bc8:	2070 a800      	movea.l (0,a0,a2.l),a0
    1bcc:	b1e9 003c      	cmpa.l 60(a1),a0
    1bd0:	57c0           	seq d0
    1bd2:	4880           	ext.w d0
    1bd4:	48c0           	ext.l d0
    1bd6:	4480           	neg.l d0
}
    1bd8:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1bdc:	4e75           	rts
  return 1;
    1bde:	7001           	moveq #1,d0
}
    1be0:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1be4:	4e75           	rts
      return 0;
    1be6:	7000           	moveq #0,d0
}
    1be8:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1bec:	4e75           	rts

00001bee <ClBuild>:
ULONG * ClbuildSW() {
    1bee:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    1bf2:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    1bf8:	707b           	moveq #123,d0
    1bfa:	4600           	not.b d0
    1bfc:	7202           	moveq #2,d1
    1bfe:	4eae ff3a      	jsr -198(a6)
    1c02:	2440           	movea.l d0,a2
  if( retval == 0) {
    1c04:	4a80           	tst.l d0
    1c06:	6700 010e      	beq.w 1d16 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    1c0a:	24b9 0000 5824 	move.l 5824 <ClsSprites>,(a2)
    1c10:	2579 0000 5828 	move.l 5828 <ClsSprites+0x4>,4(a2)
    1c16:	0004 
    1c18:	2579 0000 582c 	move.l 582c <ClsSprites+0x8>,8(a2)
    1c1e:	0008 
    1c20:	2579 0000 5830 	move.l 5830 <ClsSprites+0xc>,12(a2)
    1c26:	000c 
    1c28:	2579 0000 5834 	move.l 5834 <ClsSprites+0x10>,16(a2)
    1c2e:	0010 
    1c30:	2579 0000 5838 	move.l 5838 <ClsSprites+0x14>,20(a2)
    1c36:	0014 
    1c38:	2579 0000 583c 	move.l 583c <ClsSprites+0x18>,24(a2)
    1c3e:	0018 
    1c40:	2579 0000 5840 	move.l 5840 <ClsSprites+0x1c>,28(a2)
    1c46:	001c 
    1c48:	2579 0000 5844 	move.l 5844 <ClsSprites+0x20>,32(a2)
    1c4e:	0020 
    1c50:	2579 0000 5848 	move.l 5848 <ClsSprites+0x24>,36(a2)
    1c56:	0024 
    1c58:	2579 0000 584c 	move.l 584c <ClsSprites+0x28>,40(a2)
    1c5e:	0028 
    1c60:	2579 0000 5850 	move.l 5850 <ClsSprites+0x2c>,44(a2)
    1c66:	002c 
    1c68:	2579 0000 5854 	move.l 5854 <ClsSprites+0x30>,48(a2)
    1c6e:	0030 
    1c70:	2579 0000 5858 	move.l 5858 <ClsSprites+0x34>,52(a2)
    1c76:	0034 
    1c78:	2579 0000 585c 	move.l 585c <ClsSprites+0x38>,56(a2)
    1c7e:	0038 
    1c80:	2579 0000 5860 	move.l 5860 <ClsSprites+0x3c>,60(a2)
    1c86:	003c 
    *cl++ = *clpartinstruction++;
    1c88:	2579 0000 57f4 	move.l 57f4 <ClScreen>,64(a2)
    1c8e:	0040 
    1c90:	2579 0000 57f8 	move.l 57f8 <ClScreen+0x4>,68(a2)
    1c96:	0044 
    1c98:	2579 0000 57fc 	move.l 57fc <ClScreen+0x8>,72(a2)
    1c9e:	0048 
    1ca0:	2579 0000 5800 	move.l 5800 <ClScreen+0xc>,76(a2)
    1ca6:	004c 
    1ca8:	2579 0000 5804 	move.l 5804 <ClScreen+0x10>,80(a2)
    1cae:	0050 
    1cb0:	2579 0000 5808 	move.l 5808 <ClScreen+0x14>,84(a2)
    1cb6:	0054 
    1cb8:	2579 0000 580c 	move.l 580c <ClScreen+0x18>,88(a2)
    1cbe:	0058 
    1cc0:	2579 0000 5810 	move.l 5810 <ClScreen+0x1c>,92(a2)
    1cc6:	005c 
    1cc8:	2579 0000 5814 	move.l 5814 <ClScreen+0x20>,96(a2)
    1cce:	0060 
    1cd0:	2579 0000 5818 	move.l 5818 <ClScreen+0x24>,100(a2)
    1cd6:	0064 
    1cd8:	2579 0000 581c 	move.l 581c <ClScreen+0x28>,104(a2)
    1cde:	0068 
    1ce0:	2579 0000 5820 	move.l 5820 <ClScreen+0x2c>,108(a2)
    1ce6:	006c 
  *cl++ = 0x00e00000;
    1ce8:	257c 00e0 0000 	move.l #14680064,112(a2)
    1cee:	0070 
  *cl++ = 0x00e20000;
    1cf0:	257c 00e2 0000 	move.l #14811136,116(a2)
    1cf6:	0074 
    *cl++ = *clpartinstruction++;
    1cf8:	2579 0000 57ec 	move.l 57ec <ClColor>,120(a2)
    1cfe:	0078 
    1d00:	2579 0000 57f0 	move.l 57f0 <ClColor+0x4>,124(a2)
    1d06:	007c 
  *cl = 0xfffffffe;
    1d08:	70fe           	moveq #-2,d0
    1d0a:	2540 0080      	move.l d0,128(a2)
}
    1d0e:	200a           	move.l a2,d0
    1d10:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1d14:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1d16:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1d1c:	4eae ffc4      	jsr -60(a6)
    1d20:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1d26:	2200           	move.l d0,d1
    1d28:	243c 0000 2ff8 	move.l #12280,d2
    1d2e:	7628           	moveq #40,d3
    1d30:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1d34:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1d3a:	7201           	moveq #1,d1
    1d3c:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1d40:	24b9 0000 5824 	move.l 5824 <ClsSprites>,(a2)
    1d46:	2579 0000 5828 	move.l 5828 <ClsSprites+0x4>,4(a2)
    1d4c:	0004 
    1d4e:	2579 0000 582c 	move.l 582c <ClsSprites+0x8>,8(a2)
    1d54:	0008 
    1d56:	2579 0000 5830 	move.l 5830 <ClsSprites+0xc>,12(a2)
    1d5c:	000c 
    1d5e:	2579 0000 5834 	move.l 5834 <ClsSprites+0x10>,16(a2)
    1d64:	0010 
    1d66:	2579 0000 5838 	move.l 5838 <ClsSprites+0x14>,20(a2)
    1d6c:	0014 
    1d6e:	2579 0000 583c 	move.l 583c <ClsSprites+0x18>,24(a2)
    1d74:	0018 
    1d76:	2579 0000 5840 	move.l 5840 <ClsSprites+0x1c>,28(a2)
    1d7c:	001c 
    1d7e:	2579 0000 5844 	move.l 5844 <ClsSprites+0x20>,32(a2)
    1d84:	0020 
    1d86:	2579 0000 5848 	move.l 5848 <ClsSprites+0x24>,36(a2)
    1d8c:	0024 
    1d8e:	2579 0000 584c 	move.l 584c <ClsSprites+0x28>,40(a2)
    1d94:	0028 
    1d96:	2579 0000 5850 	move.l 5850 <ClsSprites+0x2c>,44(a2)
    1d9c:	002c 
    1d9e:	2579 0000 5854 	move.l 5854 <ClsSprites+0x30>,48(a2)
    1da4:	0030 
    1da6:	2579 0000 5858 	move.l 5858 <ClsSprites+0x34>,52(a2)
    1dac:	0034 
    1dae:	2579 0000 585c 	move.l 585c <ClsSprites+0x38>,56(a2)
    1db4:	0038 
    1db6:	2579 0000 5860 	move.l 5860 <ClsSprites+0x3c>,60(a2)
    1dbc:	003c 
    *cl++ = *clpartinstruction++;
    1dbe:	2579 0000 57f4 	move.l 57f4 <ClScreen>,64(a2)
    1dc4:	0040 
    1dc6:	2579 0000 57f8 	move.l 57f8 <ClScreen+0x4>,68(a2)
    1dcc:	0044 
    1dce:	2579 0000 57fc 	move.l 57fc <ClScreen+0x8>,72(a2)
    1dd4:	0048 
    1dd6:	2579 0000 5800 	move.l 5800 <ClScreen+0xc>,76(a2)
    1ddc:	004c 
    1dde:	2579 0000 5804 	move.l 5804 <ClScreen+0x10>,80(a2)
    1de4:	0050 
    1de6:	2579 0000 5808 	move.l 5808 <ClScreen+0x14>,84(a2)
    1dec:	0054 
    1dee:	2579 0000 580c 	move.l 580c <ClScreen+0x18>,88(a2)
    1df4:	0058 
    1df6:	2579 0000 5810 	move.l 5810 <ClScreen+0x1c>,92(a2)
    1dfc:	005c 
    1dfe:	2579 0000 5814 	move.l 5814 <ClScreen+0x20>,96(a2)
    1e04:	0060 
    1e06:	2579 0000 5818 	move.l 5818 <ClScreen+0x24>,100(a2)
    1e0c:	0064 
    1e0e:	2579 0000 581c 	move.l 581c <ClScreen+0x28>,104(a2)
    1e14:	0068 
    1e16:	2579 0000 5820 	move.l 5820 <ClScreen+0x2c>,108(a2)
    1e1c:	006c 
  *cl++ = 0x00e00000;
    1e1e:	257c 00e0 0000 	move.l #14680064,112(a2)
    1e24:	0070 
  *cl++ = 0x00e20000;
    1e26:	257c 00e2 0000 	move.l #14811136,116(a2)
    1e2c:	0074 
    *cl++ = *clpartinstruction++;
    1e2e:	2579 0000 57ec 	move.l 57ec <ClColor>,120(a2)
    1e34:	0078 
    1e36:	2579 0000 57f0 	move.l 57f0 <ClColor+0x4>,124(a2)
    1e3c:	007c 
  *cl = 0xfffffffe;
    1e3e:	70fe           	moveq #-2,d0
    1e40:	2540 0080      	move.l d0,128(a2)
}
    1e44:	200a           	move.l a2,d0
    1e46:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1e4a:	4e75           	rts

00001e4c <ClbuildZoom>:
ULONG * ClbuildZoom() {
    1e4c:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1e50:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    1e56:	203c 0000 a48c 	move.l #42124,d0
    1e5c:	7202           	moveq #2,d1
    1e5e:	4eae ff3a      	jsr -198(a6)
    1e62:	2440           	movea.l d0,a2
  if( retval == 0) {
    1e64:	4a80           	tst.l d0
    1e66:	6700 0160      	beq.w 1fc8 <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    1e6a:	24b9 0000 5824 	move.l 5824 <ClsSprites>,(a2)
    1e70:	2579 0000 5828 	move.l 5828 <ClsSprites+0x4>,4(a2)
    1e76:	0004 
    1e78:	2579 0000 582c 	move.l 582c <ClsSprites+0x8>,8(a2)
    1e7e:	0008 
    1e80:	2579 0000 5830 	move.l 5830 <ClsSprites+0xc>,12(a2)
    1e86:	000c 
    1e88:	2579 0000 5834 	move.l 5834 <ClsSprites+0x10>,16(a2)
    1e8e:	0010 
    1e90:	2579 0000 5838 	move.l 5838 <ClsSprites+0x14>,20(a2)
    1e96:	0014 
    1e98:	2579 0000 583c 	move.l 583c <ClsSprites+0x18>,24(a2)
    1e9e:	0018 
    1ea0:	2579 0000 5840 	move.l 5840 <ClsSprites+0x1c>,28(a2)
    1ea6:	001c 
    1ea8:	2579 0000 5844 	move.l 5844 <ClsSprites+0x20>,32(a2)
    1eae:	0020 
    1eb0:	2579 0000 5848 	move.l 5848 <ClsSprites+0x24>,36(a2)
    1eb6:	0024 
    1eb8:	2579 0000 584c 	move.l 584c <ClsSprites+0x28>,40(a2)
    1ebe:	0028 
    1ec0:	2579 0000 5850 	move.l 5850 <ClsSprites+0x2c>,44(a2)
    1ec6:	002c 
    1ec8:	2579 0000 5854 	move.l 5854 <ClsSprites+0x30>,48(a2)
    1ece:	0030 
    1ed0:	2579 0000 5858 	move.l 5858 <ClsSprites+0x34>,52(a2)
    1ed6:	0034 
    1ed8:	2579 0000 585c 	move.l 585c <ClsSprites+0x38>,56(a2)
    1ede:	0038 
    1ee0:	2579 0000 5860 	move.l 5860 <ClsSprites+0x3c>,60(a2)
    1ee6:	003c 
    *cl++ = *clpartinstruction++;
    1ee8:	2579 0000 57bc 	move.l 57bc <ClScreenZoom>,64(a2)
    1eee:	0040 
    1ef0:	2579 0000 57c0 	move.l 57c0 <ClScreenZoom+0x4>,68(a2)
    1ef6:	0044 
    1ef8:	2579 0000 57c4 	move.l 57c4 <ClScreenZoom+0x8>,72(a2)
    1efe:	0048 
    1f00:	2579 0000 57c8 	move.l 57c8 <ClScreenZoom+0xc>,76(a2)
    1f06:	004c 
    1f08:	2579 0000 57cc 	move.l 57cc <ClScreenZoom+0x10>,80(a2)
    1f0e:	0050 
    1f10:	2579 0000 57d0 	move.l 57d0 <ClScreenZoom+0x14>,84(a2)
    1f16:	0054 
    1f18:	2579 0000 57d4 	move.l 57d4 <ClScreenZoom+0x18>,88(a2)
    1f1e:	0058 
    1f20:	2579 0000 57d8 	move.l 57d8 <ClScreenZoom+0x1c>,92(a2)
    1f26:	005c 
    1f28:	2579 0000 57dc 	move.l 57dc <ClScreenZoom+0x20>,96(a2)
    1f2e:	0060 
    1f30:	2579 0000 57e0 	move.l 57e0 <ClScreenZoom+0x24>,100(a2)
    1f36:	0064 
    1f38:	2579 0000 57e4 	move.l 57e4 <ClScreenZoom+0x28>,104(a2)
    1f3e:	0068 
    1f40:	2579 0000 57e8 	move.l 57e8 <ClScreenZoom+0x2c>,108(a2)
    1f46:	006c 
  *cl++ = 0x00e00000;
    1f48:	257c 00e0 0000 	move.l #14680064,112(a2)
    1f4e:	0070 
  *cl++ = 0x00e20000;
    1f50:	257c 00e2 0000 	move.l #14811136,116(a2)
    1f56:	0074 
  *cl++ = 0x00e40000;
    1f58:	257c 00e4 0000 	move.l #14942208,120(a2)
    1f5e:	0078 
  *cl++ = 0x00e60000;
    1f60:	257c 00e6 0000 	move.l #15073280,124(a2)
    1f66:	007c 
    *cl++ = *clpartinstruction++;
    1f68:	2579 0000 57ec 	move.l 57ec <ClColor>,128(a2)
    1f6e:	0080 
    1f70:	2579 0000 57f0 	move.l 57f0 <ClColor+0x4>,132(a2)
    1f76:	0084 
    1f78:	43ea 012c      	lea 300(a2),a1
    1f7c:	220a           	move.l a2,d1
    1f7e:	0681 0000 a52c 	addi.l #42284,d1
    1f84:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    1f8a:	41e9 ff60      	lea -160(a1),a0
    1f8e:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    1f92:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    1f98:	5088           	addq.l #8,a0
    1f9a:	217c 0182 0f00 	move.l #25300736,-4(a0)
    1fa0:	fffc 
    for(int i2=0;i2<20;i2++) {
    1fa2:	b3c8           	cmpa.l a0,a1
    1fa4:	66ec           	bne.s 1f92 <ClbuildZoom+0x146>
    1fa6:	43e8 00a4      	lea 164(a0),a1
    1faa:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    1fb0:	b3c1           	cmpa.l d1,a1
    1fb2:	66d6           	bne.s 1f8a <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    1fb4:	203c 0000 a488 	move.l #42120,d0
    1fba:	72fe           	moveq #-2,d1
    1fbc:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    1fc0:	200a           	move.l a2,d0
    1fc2:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1fc6:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1fc8:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1fce:	4eae ffc4      	jsr -60(a6)
    1fd2:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1fd8:	2200           	move.l d0,d1
    1fda:	243c 0000 2ff8 	move.l #12280,d2
    1fe0:	7628           	moveq #40,d3
    1fe2:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1fe6:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    1fec:	7201           	moveq #1,d1
    1fee:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1ff2:	24b9 0000 5824 	move.l 5824 <ClsSprites>,(a2)
    1ff8:	2579 0000 5828 	move.l 5828 <ClsSprites+0x4>,4(a2)
    1ffe:	0004 
    2000:	2579 0000 582c 	move.l 582c <ClsSprites+0x8>,8(a2)
    2006:	0008 
    2008:	2579 0000 5830 	move.l 5830 <ClsSprites+0xc>,12(a2)
    200e:	000c 
    2010:	2579 0000 5834 	move.l 5834 <ClsSprites+0x10>,16(a2)
    2016:	0010 
    2018:	2579 0000 5838 	move.l 5838 <ClsSprites+0x14>,20(a2)
    201e:	0014 
    2020:	2579 0000 583c 	move.l 583c <ClsSprites+0x18>,24(a2)
    2026:	0018 
    2028:	2579 0000 5840 	move.l 5840 <ClsSprites+0x1c>,28(a2)
    202e:	001c 
    2030:	2579 0000 5844 	move.l 5844 <ClsSprites+0x20>,32(a2)
    2036:	0020 
    2038:	2579 0000 5848 	move.l 5848 <ClsSprites+0x24>,36(a2)
    203e:	0024 
    2040:	2579 0000 584c 	move.l 584c <ClsSprites+0x28>,40(a2)
    2046:	0028 
    2048:	2579 0000 5850 	move.l 5850 <ClsSprites+0x2c>,44(a2)
    204e:	002c 
    2050:	2579 0000 5854 	move.l 5854 <ClsSprites+0x30>,48(a2)
    2056:	0030 
    2058:	2579 0000 5858 	move.l 5858 <ClsSprites+0x34>,52(a2)
    205e:	0034 
    2060:	2579 0000 585c 	move.l 585c <ClsSprites+0x38>,56(a2)
    2066:	0038 
    2068:	2579 0000 5860 	move.l 5860 <ClsSprites+0x3c>,60(a2)
    206e:	003c 
    *cl++ = *clpartinstruction++;
    2070:	2579 0000 57bc 	move.l 57bc <ClScreenZoom>,64(a2)
    2076:	0040 
    2078:	2579 0000 57c0 	move.l 57c0 <ClScreenZoom+0x4>,68(a2)
    207e:	0044 
    2080:	2579 0000 57c4 	move.l 57c4 <ClScreenZoom+0x8>,72(a2)
    2086:	0048 
    2088:	2579 0000 57c8 	move.l 57c8 <ClScreenZoom+0xc>,76(a2)
    208e:	004c 
    2090:	2579 0000 57cc 	move.l 57cc <ClScreenZoom+0x10>,80(a2)
    2096:	0050 
    2098:	2579 0000 57d0 	move.l 57d0 <ClScreenZoom+0x14>,84(a2)
    209e:	0054 
    20a0:	2579 0000 57d4 	move.l 57d4 <ClScreenZoom+0x18>,88(a2)
    20a6:	0058 
    20a8:	2579 0000 57d8 	move.l 57d8 <ClScreenZoom+0x1c>,92(a2)
    20ae:	005c 
    20b0:	2579 0000 57dc 	move.l 57dc <ClScreenZoom+0x20>,96(a2)
    20b6:	0060 
    20b8:	2579 0000 57e0 	move.l 57e0 <ClScreenZoom+0x24>,100(a2)
    20be:	0064 
    20c0:	2579 0000 57e4 	move.l 57e4 <ClScreenZoom+0x28>,104(a2)
    20c6:	0068 
    20c8:	2579 0000 57e8 	move.l 57e8 <ClScreenZoom+0x2c>,108(a2)
    20ce:	006c 
  *cl++ = 0x00e00000;
    20d0:	257c 00e0 0000 	move.l #14680064,112(a2)
    20d6:	0070 
  *cl++ = 0x00e20000;
    20d8:	257c 00e2 0000 	move.l #14811136,116(a2)
    20de:	0074 
  *cl++ = 0x00e40000;
    20e0:	257c 00e4 0000 	move.l #14942208,120(a2)
    20e6:	0078 
  *cl++ = 0x00e60000;
    20e8:	257c 00e6 0000 	move.l #15073280,124(a2)
    20ee:	007c 
    *cl++ = *clpartinstruction++;
    20f0:	2579 0000 57ec 	move.l 57ec <ClColor>,128(a2)
    20f6:	0080 
    20f8:	2579 0000 57f0 	move.l 57f0 <ClColor+0x4>,132(a2)
    20fe:	0084 
    2100:	43ea 012c      	lea 300(a2),a1
    2104:	220a           	move.l a2,d1
    2106:	0681 0000 a52c 	addi.l #42284,d1
    210c:	203c 2c07 fffe 	move.l #738721790,d0
    2112:	6000 fe76      	bra.w 1f8a <ClbuildZoom+0x13e>

00002116 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    2116:	2039 0000 58fa 	move.l 58fa <DrawCopper>,d0
  DrawCopper = ViewCopper;
    211c:	23f9 0000 58ee 	move.l 58ee <ViewCopper>,58fa <DrawCopper>
    2122:	0000 58fa 
  ViewCopper = (ULONG *)tmp;
    2126:	23c0 0000 58ee 	move.l d0,58ee <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    212c:	2079 0000 58ea 	movea.l 58ea <hw>,a0
    2132:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    2136:	3140 0088      	move.w d0,136(a0)
}
    213a:	4e75           	rts

0000213c <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    213c:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    2140:	45fa fd0a      	lea 1e4c <ClbuildZoom>(pc),a2
    2144:	4e92           	jsr (a2)
    2146:	23c0 0000 590a 	move.l d0,590a <Copperlist1>
  Copperlist2 = ClbuildZoom();
    214c:	4e92           	jsr (a2)
    214e:	23c0 0000 5906 	move.l d0,5906 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2154:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    215a:	203c 0001 4a00 	move.l #84480,d0
    2160:	7202           	moveq #2,d1
    2162:	4eae ff3a      	jsr -198(a6)
    2166:	23c0 0000 5902 	move.l d0,5902 <Bitplane1>
  if(Bitplane1 == 0) {
    216c:	6700 014e      	beq.w 22bc <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    2170:	23c0 0000 58fe 	move.l d0,58fe <DrawBuffer>
  DrawCopper = Copperlist1;
    2176:	23f9 0000 590a 	move.l 590a <Copperlist1>,58fa <DrawCopper>
    217c:	0000 58fa 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2180:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    2186:	203c 0001 4a00 	move.l #84480,d0
    218c:	7202           	moveq #2,d1
    218e:	4eae ff3a      	jsr -198(a6)
    2192:	2400           	move.l d0,d2
    2194:	23c0 0000 58f6 	move.l d0,58f6 <Bitplane2>
  if(Bitplane2 == 0) {
    219a:	6778           	beq.s 2214 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    219c:	23f9 0000 5906 	move.l 5906 <Copperlist2>,58ee <ViewCopper>
    21a2:	0000 58ee 
  SwapCl();
    21a6:	45fa ff6e      	lea 2116 <SwapCl>(pc),a2
    21aa:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    21ac:	2039 0000 58fe 	move.l 58fe <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    21b2:	2079 0000 58fa 	movea.l 58fa <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    21b8:	2200           	move.l d0,d1
    21ba:	4241           	clr.w d1
    21bc:	4841           	swap d1
    21be:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    21c2:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    21c6:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    21cc:	2200           	move.l d0,d1
    21ce:	4241           	clr.w d1
    21d0:	4841           	swap d1
    21d2:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    21d6:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    21da:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    21dc:	2079 0000 58fa 	movea.l 58fa <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    21e2:	2002           	move.l d2,d0
    21e4:	4240           	clr.w d0
    21e6:	4840           	swap d0
    21e8:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    21ec:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    21f0:	2002           	move.l d2,d0
    21f2:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    21f8:	2200           	move.l d0,d1
    21fa:	4241           	clr.w d1
    21fc:	4841           	swap d1
    21fe:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2202:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    2206:	23c2 0000 58f2 	move.l d2,58f2 <ViewBuffer>
}
    220c:	7000           	moveq #0,d0
    220e:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2212:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2214:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    221a:	4eae ffc4      	jsr -60(a6)
    221e:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    2224:	2200           	move.l d0,d1
    2226:	243c 0000 3045 	move.l #12357,d2
    222c:	7626           	moveq #38,d3
    222e:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2232:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    2238:	7201           	moveq #1,d1
    223a:	4eae ff70      	jsr -144(a6)
    223e:	2439 0000 58f6 	move.l 58f6 <Bitplane2>,d2
  ViewCopper = Copperlist2;
    2244:	23f9 0000 5906 	move.l 5906 <Copperlist2>,58ee <ViewCopper>
    224a:	0000 58ee 
  SwapCl();
    224e:	45fa fec6      	lea 2116 <SwapCl>(pc),a2
    2252:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    2254:	2039 0000 58fe 	move.l 58fe <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    225a:	2079 0000 58fa 	movea.l 58fa <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2260:	2200           	move.l d0,d1
    2262:	4241           	clr.w d1
    2264:	4841           	swap d1
    2266:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    226a:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    226e:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2274:	2200           	move.l d0,d1
    2276:	4241           	clr.w d1
    2278:	4841           	swap d1
    227a:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    227e:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    2282:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    2284:	2079 0000 58fa 	movea.l 58fa <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    228a:	2002           	move.l d2,d0
    228c:	4240           	clr.w d0
    228e:	4840           	swap d0
    2290:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    2294:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    2298:	2002           	move.l d2,d0
    229a:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    22a0:	2200           	move.l d0,d1
    22a2:	4241           	clr.w d1
    22a4:	4841           	swap d1
    22a6:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    22aa:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    22ae:	23c2 0000 58f2 	move.l d2,58f2 <ViewBuffer>
}
    22b4:	7000           	moveq #0,d0
    22b6:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    22ba:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    22bc:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    22c2:	4eae ffc4      	jsr -60(a6)
    22c6:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    22cc:	2200           	move.l d0,d1
    22ce:	243c 0000 301e 	move.l #12318,d2
    22d4:	7626           	moveq #38,d3
    22d6:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    22da:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    22e0:	7201           	moveq #1,d1
    22e2:	4eae ff70      	jsr -144(a6)
    22e6:	2039 0000 5902 	move.l 5902 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    22ec:	23c0 0000 58fe 	move.l d0,58fe <DrawBuffer>
  DrawCopper = Copperlist1;
    22f2:	23f9 0000 590a 	move.l 590a <Copperlist1>,58fa <DrawCopper>
    22f8:	0000 58fa 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    22fc:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    2302:	203c 0001 4a00 	move.l #84480,d0
    2308:	7202           	moveq #2,d1
    230a:	4eae ff3a      	jsr -198(a6)
    230e:	2400           	move.l d0,d2
    2310:	23c0 0000 58f6 	move.l d0,58f6 <Bitplane2>
  if(Bitplane2 == 0) {
    2316:	6600 fe84      	bne.w 219c <PrepareDisplayZoom+0x60>
    231a:	6000 fef8      	bra.w 2214 <PrepareDisplayZoom+0xd8>

0000231e <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    231e:	2039 0000 58fe 	move.l 58fe <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2324:	2079 0000 58fa 	movea.l 58fa <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    232a:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    232e:	2200           	move.l d0,d1
    2330:	4241           	clr.w d1
    2332:	4841           	swap d1
    2334:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    2338:	23f9 0000 58f2 	move.l 58f2 <ViewBuffer>,58fe <DrawBuffer>
    233e:	0000 58fe 
  ViewBuffer = (ULONG *) tmp;
    2342:	23c0 0000 58f2 	move.l d0,58f2 <ViewBuffer>
}
    2348:	4e75           	rts

0000234a <PrepareDisplay>:
 int PrepareDisplaySW() {
    234a:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    234e:	45fa f89e      	lea 1bee <ClBuild>(pc),a2
    2352:	4e92           	jsr (a2)
    2354:	23c0 0000 590a 	move.l d0,590a <Copperlist1>
  Copperlist2 = ClbuildSW();
    235a:	4e92           	jsr (a2)
    235c:	23c0 0000 5906 	move.l d0,5906 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2362:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    2368:	203c 0000 c800 	move.l #51200,d0
    236e:	7202           	moveq #2,d1
    2370:	4eae ff3a      	jsr -198(a6)
    2374:	23c0 0000 5902 	move.l d0,5902 <Bitplane1>
  if(Bitplane1 == 0) {
    237a:	6700 00ac      	beq.w 2428 <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    237e:	23c0 0000 58fe 	move.l d0,58fe <DrawBuffer>
  DrawCopper = Copperlist1;
    2384:	23f9 0000 590a 	move.l 590a <Copperlist1>,58fa <DrawCopper>
    238a:	0000 58fa 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    238e:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    2394:	203c 0000 c800 	move.l #51200,d0
    239a:	7202           	moveq #2,d1
    239c:	4eae ff3a      	jsr -198(a6)
    23a0:	23c0 0000 58f6 	move.l d0,58f6 <Bitplane2>
  if(Bitplane2 == 0) {
    23a6:	6728           	beq.s 23d0 <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    23a8:	23c0 0000 58f2 	move.l d0,58f2 <ViewBuffer>
  ViewCopper = Copperlist2;
    23ae:	23f9 0000 5906 	move.l 5906 <Copperlist2>,58ee <ViewCopper>
    23b4:	0000 58ee 
  SwapCl();
    23b8:	47fa fd5c      	lea 2116 <SwapCl>(pc),a3
    23bc:	4e93           	jsr (a3)
  SetBplPointers();
    23be:	45fa ff5e      	lea 231e <SetBplPointers>(pc),a2
    23c2:	4e92           	jsr (a2)
  SwapCl();
    23c4:	4e93           	jsr (a3)
  SetBplPointers();
    23c6:	4e92           	jsr (a2)
}
    23c8:	7000           	moveq #0,d0
    23ca:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    23ce:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    23d0:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    23d6:	4eae ffc4      	jsr -60(a6)
    23da:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    23e0:	2200           	move.l d0,d1
    23e2:	243c 0000 3045 	move.l #12357,d2
    23e8:	7626           	moveq #38,d3
    23ea:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    23ee:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    23f4:	7201           	moveq #1,d1
    23f6:	4eae ff70      	jsr -144(a6)
    23fa:	2039 0000 58f6 	move.l 58f6 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    2400:	23c0 0000 58f2 	move.l d0,58f2 <ViewBuffer>
  ViewCopper = Copperlist2;
    2406:	23f9 0000 5906 	move.l 5906 <Copperlist2>,58ee <ViewCopper>
    240c:	0000 58ee 
  SwapCl();
    2410:	47fa fd04      	lea 2116 <SwapCl>(pc),a3
    2414:	4e93           	jsr (a3)
  SetBplPointers();
    2416:	45fa ff06      	lea 231e <SetBplPointers>(pc),a2
    241a:	4e92           	jsr (a2)
  SwapCl();
    241c:	4e93           	jsr (a3)
  SetBplPointers();
    241e:	4e92           	jsr (a2)
}
    2420:	7000           	moveq #0,d0
    2422:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    2426:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2428:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    242e:	4eae ffc4      	jsr -60(a6)
    2432:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    2438:	2200           	move.l d0,d1
    243a:	243c 0000 301e 	move.l #12318,d2
    2440:	7626           	moveq #38,d3
    2442:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2446:	2c79 0000 590e 	movea.l 590e <DOSBase>,a6
    244c:	7201           	moveq #1,d1
    244e:	4eae ff70      	jsr -144(a6)
    2452:	2039 0000 5902 	move.l 5902 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    2458:	23c0 0000 58fe 	move.l d0,58fe <DrawBuffer>
  DrawCopper = Copperlist1;
    245e:	23f9 0000 590a 	move.l 590a <Copperlist1>,58fa <DrawCopper>
    2464:	0000 58fa 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2468:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    246e:	203c 0000 c800 	move.l #51200,d0
    2474:	7202           	moveq #2,d1
    2476:	4eae ff3a      	jsr -198(a6)
    247a:	23c0 0000 58f6 	move.l d0,58f6 <Bitplane2>
  if(Bitplane2 == 0) {
    2480:	6600 ff26      	bne.w 23a8 <PrepareDisplay+0x5e>
    2484:	6000 ff4a      	bra.w 23d0 <PrepareDisplay+0x86>

00002488 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    2488:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    248c:	262f 0010      	move.l 16(sp),d3
    2490:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    2494:	2279 0000 590a 	movea.l 590a <Copperlist1>,a1
    249a:	b2fc 0000      	cmpa.w #0,a1
    249e:	670c           	beq.s 24ac <FreeDisplay+0x24>
    24a0:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    24a6:	2003           	move.l d3,d0
    24a8:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    24ac:	2279 0000 5906 	movea.l 5906 <Copperlist2>,a1
    24b2:	b2fc 0000      	cmpa.w #0,a1
    24b6:	670c           	beq.s 24c4 <FreeDisplay+0x3c>
    24b8:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    24be:	2003           	move.l d3,d0
    24c0:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    24c4:	2279 0000 5902 	movea.l 5902 <Bitplane1>,a1
    24ca:	b2fc 0000      	cmpa.w #0,a1
    24ce:	670c           	beq.s 24dc <FreeDisplay+0x54>
    24d0:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    24d6:	2002           	move.l d2,d0
    24d8:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    24dc:	2279 0000 58f6 	movea.l 58f6 <Bitplane2>,a1
    24e2:	b2fc 0000      	cmpa.w #0,a1
    24e6:	670c           	beq.s 24f4 <FreeDisplay+0x6c>
    24e8:	2c79 0000 5912 	movea.l 5912 <SysBase>,a6
    24ee:	2002           	move.l d2,d0
    24f0:	4eae ff2e      	jsr -210(a6)
}
    24f4:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    24f8:	4e75           	rts

000024fa <WaitVbl>:
void WaitVbl() {
    24fa:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    24fc:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddc02d>,d0
    2502:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    2504:	2017           	move.l (sp),d0
    2506:	0280 0001 ff00 	andi.l #130816,d0
    250c:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    250e:	2017           	move.l (sp),d0
    2510:	0c80 0001 3700 	cmpi.l #79616,d0
    2516:	67e4           	beq.s 24fc <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    2518:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddc02d>,d0
    251e:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    2522:	202f 0004      	move.l 4(sp),d0
    2526:	0280 0001 ff00 	andi.l #130816,d0
    252c:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    2530:	202f 0004      	move.l 4(sp),d0
    2534:	0c80 0001 3700 	cmpi.l #79616,d0
    253a:	66dc           	bne.s 2518 <WaitVbl+0x1e>
}
    253c:	508f           	addq.l #8,sp
    253e:	4e75           	rts

00002540 <memcpy>:
{
    2540:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    2544:	202f 0014      	move.l 20(sp),d0
    2548:	226f 0018      	movea.l 24(sp),a1
    254c:	222f 001c      	move.l 28(sp),d1
	while(len--)
    2550:	2601           	move.l d1,d3
    2552:	5383           	subq.l #1,d3
    2554:	4a81           	tst.l d1
    2556:	6762           	beq.s 25ba <memcpy+0x7a>
    2558:	2040           	movea.l d0,a0
    255a:	5888           	addq.l #4,a0
    255c:	b1c9           	cmpa.l a1,a0
    255e:	53c2           	sl.s d2
    2560:	4402           	neg.b d2
    2562:	41e9 0004      	lea 4(a1),a0
    2566:	b1c0           	cmpa.l d0,a0
    2568:	53c4           	sl.s d4
    256a:	4404           	neg.b d4
    256c:	8404           	or.b d4,d2
    256e:	7808           	moveq #8,d4
    2570:	b883           	cmp.l d3,d4
    2572:	55c4           	sc.s d4
    2574:	4404           	neg.b d4
    2576:	c404           	and.b d4,d2
    2578:	6746           	beq.s 25c0 <memcpy+0x80>
    257a:	2409           	move.l a1,d2
    257c:	8480           	or.l d0,d2
    257e:	7803           	moveq #3,d4
    2580:	c484           	and.l d4,d2
    2582:	663c           	bne.s 25c0 <memcpy+0x80>
    2584:	2049           	movea.l a1,a0
    2586:	2440           	movea.l d0,a2
    2588:	74fc           	moveq #-4,d2
    258a:	c481           	and.l d1,d2
    258c:	d489           	add.l a1,d2
		*d++ = *s++;
    258e:	24d8           	move.l (a0)+,(a2)+
    2590:	b488           	cmp.l a0,d2
    2592:	66fa           	bne.s 258e <memcpy+0x4e>
    2594:	74fc           	moveq #-4,d2
    2596:	c481           	and.l d1,d2
    2598:	2040           	movea.l d0,a0
    259a:	d1c2           	adda.l d2,a0
    259c:	d3c2           	adda.l d2,a1
    259e:	9682           	sub.l d2,d3
    25a0:	b481           	cmp.l d1,d2
    25a2:	6716           	beq.s 25ba <memcpy+0x7a>
    25a4:	1091           	move.b (a1),(a0)
	while(len--)
    25a6:	4a83           	tst.l d3
    25a8:	6710           	beq.s 25ba <memcpy+0x7a>
		*d++ = *s++;
    25aa:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    25b0:	5383           	subq.l #1,d3
    25b2:	6706           	beq.s 25ba <memcpy+0x7a>
		*d++ = *s++;
    25b4:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    25ba:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    25be:	4e75           	rts
    25c0:	2040           	movea.l d0,a0
    25c2:	d289           	add.l a1,d1
		*d++ = *s++;
    25c4:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    25c6:	b289           	cmp.l a1,d1
    25c8:	67f0           	beq.s 25ba <memcpy+0x7a>
		*d++ = *s++;
    25ca:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    25cc:	b289           	cmp.l a1,d1
    25ce:	66f4           	bne.s 25c4 <memcpy+0x84>
    25d0:	60e8           	bra.s 25ba <memcpy+0x7a>

000025d2 <memset>:
{
    25d2:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    25d6:	202f 0024      	move.l 36(sp),d0
    25da:	2a2f 0028      	move.l 40(sp),d5
    25de:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    25e2:	2809           	move.l a1,d4
    25e4:	5384           	subq.l #1,d4
    25e6:	b2fc 0000      	cmpa.w #0,a1
    25ea:	6f00 00b0      	ble.w 269c <memset+0xca>
    25ee:	1e05           	move.b d5,d7
    25f0:	2200           	move.l d0,d1
    25f2:	4481           	neg.l d1
    25f4:	7403           	moveq #3,d2
    25f6:	c282           	and.l d2,d1
    25f8:	7c05           	moveq #5,d6
		*ptr++ = val;
    25fa:	2440           	movea.l d0,a2
    25fc:	bc84           	cmp.l d4,d6
    25fe:	646a           	bcc.s 266a <memset+0x98>
    2600:	4a81           	tst.l d1
    2602:	6724           	beq.s 2628 <memset+0x56>
    2604:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    2606:	5384           	subq.l #1,d4
    2608:	7401           	moveq #1,d2
    260a:	b481           	cmp.l d1,d2
    260c:	671a           	beq.s 2628 <memset+0x56>
		*ptr++ = val;
    260e:	2440           	movea.l d0,a2
    2610:	548a           	addq.l #2,a2
    2612:	2040           	movea.l d0,a0
    2614:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    2618:	5384           	subq.l #1,d4
    261a:	7403           	moveq #3,d2
    261c:	b481           	cmp.l d1,d2
    261e:	6608           	bne.s 2628 <memset+0x56>
		*ptr++ = val;
    2620:	528a           	addq.l #1,a2
    2622:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    2626:	5384           	subq.l #1,d4
    2628:	2609           	move.l a1,d3
    262a:	9681           	sub.l d1,d3
    262c:	7c00           	moveq #0,d6
    262e:	1c05           	move.b d5,d6
    2630:	2406           	move.l d6,d2
    2632:	4842           	swap d2
    2634:	4242           	clr.w d2
    2636:	2042           	movea.l d2,a0
    2638:	2406           	move.l d6,d2
    263a:	e14a           	lsl.w #8,d2
    263c:	4842           	swap d2
    263e:	4242           	clr.w d2
    2640:	e18e           	lsl.l #8,d6
    2642:	2646           	movea.l d6,a3
    2644:	2c08           	move.l a0,d6
    2646:	8486           	or.l d6,d2
    2648:	2c0b           	move.l a3,d6
    264a:	8486           	or.l d6,d2
    264c:	1407           	move.b d7,d2
    264e:	2040           	movea.l d0,a0
    2650:	d1c1           	adda.l d1,a0
    2652:	72fc           	moveq #-4,d1
    2654:	c283           	and.l d3,d1
    2656:	d288           	add.l a0,d1
		*ptr++ = val;
    2658:	20c2           	move.l d2,(a0)+
    265a:	b1c1           	cmpa.l d1,a0
    265c:	66fa           	bne.s 2658 <memset+0x86>
    265e:	72fc           	moveq #-4,d1
    2660:	c283           	and.l d3,d1
    2662:	d5c1           	adda.l d1,a2
    2664:	9881           	sub.l d1,d4
    2666:	b283           	cmp.l d3,d1
    2668:	6732           	beq.s 269c <memset+0xca>
    266a:	1485           	move.b d5,(a2)
	while(len-- > 0)
    266c:	4a84           	tst.l d4
    266e:	6f2c           	ble.s 269c <memset+0xca>
		*ptr++ = val;
    2670:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    2674:	7201           	moveq #1,d1
    2676:	b284           	cmp.l d4,d1
    2678:	6c22           	bge.s 269c <memset+0xca>
		*ptr++ = val;
    267a:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    267e:	7402           	moveq #2,d2
    2680:	b484           	cmp.l d4,d2
    2682:	6c18           	bge.s 269c <memset+0xca>
		*ptr++ = val;
    2684:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    2688:	7c03           	moveq #3,d6
    268a:	bc84           	cmp.l d4,d6
    268c:	6c0e           	bge.s 269c <memset+0xca>
		*ptr++ = val;
    268e:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    2692:	7204           	moveq #4,d1
    2694:	b284           	cmp.l d4,d1
    2696:	6c04           	bge.s 269c <memset+0xca>
		*ptr++ = val;
    2698:	1545 0005      	move.b d5,5(a2)
}
    269c:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    26a0:	4e75           	rts

000026a2 <strlen>:
{
    26a2:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    26a6:	7000           	moveq #0,d0
	while(*s++)
    26a8:	4a10           	tst.b (a0)
    26aa:	6708           	beq.s 26b4 <strlen+0x12>
		t++;
    26ac:	5280           	addq.l #1,d0
	while(*s++)
    26ae:	4a30 0800      	tst.b (0,a0,d0.l)
    26b2:	66f8           	bne.s 26ac <strlen+0xa>
}
    26b4:	4e75           	rts
    26b6:	4e71           	nop

000026b8 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    26b8:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    26bc:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    26c0:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    26c4:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    26c8:	d041           	add.w d1,d0
	swap	d0
    26ca:	4840           	swap d0
	clrw	d0
    26cc:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    26ce:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    26d2:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    26d6:	d081           	add.l d1,d0

	rts
    26d8:	4e75           	rts

000026da <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    26da:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    26dc:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    26e0:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    26e4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    26ea:	6416           	bcc.s 2702 <__udivsi3+0x28>
	movel	d0, d2
    26ec:	2400           	move.l d0,d2
	clrw	d2
    26ee:	4242           	clr.w d2
	swap	d2
    26f0:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    26f2:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    26f4:	3002           	move.w d2,d0
	swap	d0
    26f6:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    26f8:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    26fc:	84c1           	divu.w d1,d2
	movew	d2, d0
    26fe:	3002           	move.w d2,d0
	jra	6f
    2700:	6030           	bra.s 2732 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    2702:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    2704:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    2706:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    2708:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    270e:	64f4           	bcc.s 2704 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    2710:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    2712:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    2718:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    271a:	c2c0           	mulu.w d0,d1
	swap	d2
    271c:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    271e:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    2720:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    2722:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    2724:	660a           	bne.s 2730 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    2726:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    2728:	6506           	bcs.s 2730 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    272a:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    272e:	6302           	bls.s 2732 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    2730:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    2732:	241f           	move.l (sp)+,d2
	rts
    2734:	4e75           	rts

00002736 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    2736:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    2738:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    273a:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    273e:	6a04           	bpl.s 2744 <__divsi3+0xe>
	negl	d1
    2740:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    2742:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    2744:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    2748:	6a04           	bpl.s 274e <__divsi3+0x18>
	negl	d0
    274a:	4480           	neg.l d0
	negb	d2
    274c:	4402           	neg.b d2

2:	movel	d1, sp@-
    274e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2750:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    2752:	6186           	bsr.s 26da <__udivsi3>
	addql	IMM (8), sp
    2754:	508f           	addq.l #8,sp

	tstb	d2
    2756:	4a02           	tst.b d2
	jpl	3f
    2758:	6a02           	bpl.s 275c <__divsi3+0x26>
	negl	d0
    275a:	4480           	neg.l d0

3:	movel	sp@+, d2
    275c:	241f           	move.l (sp)+,d2
	rts
    275e:	4e75           	rts

00002760 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    2760:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    2764:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    2768:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    276a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    276c:	61c8           	bsr.s 2736 <__divsi3>
	addql	IMM (8), sp
    276e:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    2770:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    2774:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2776:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    2778:	6100 ff3e      	bsr.w 26b8 <__mulsi3>
	addql	IMM (8), sp
    277c:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    277e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    2782:	9280           	sub.l d0,d1
	movel	d1, d0
    2784:	2001           	move.l d1,d0
	rts
    2786:	4e75           	rts

00002788 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    2788:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    278c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    2790:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2792:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    2794:	6100 ff44      	bsr.w 26da <__udivsi3>
	addql	IMM (8), sp
    2798:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    279a:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    279e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    27a0:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    27a2:	6100 ff14      	bsr.w 26b8 <__mulsi3>
	addql	IMM (8), sp
    27a6:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    27a8:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    27ac:	9280           	sub.l d0,d1
	movel	d1, d0
    27ae:	2001           	move.l d1,d0
	rts
    27b0:	4e75           	rts

000027b2 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    27b2:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    27b4:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    27b8:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    27bc:	2c5f           	movea.l (sp)+,a6
    rts
    27be:	4e75           	rts

000027c0 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    27c0:	16c0           	move.b d0,(a3)+
	rts
    27c2:	4e75           	rts

000027c4 <saveregs>:
	...

00002800 <font2distance>:
    2800:	0505           	btst d2,d5
    2802:	0505           	btst d2,d5
    2804:	0505           	btst d2,d5
    2806:	0505           	btst d2,d5
    2808:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    280a:	0505           	btst d2,d5
    280c:	0505           	btst d2,d5
    280e:	0005 0505      	ori.b #5,d5
    2812:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    2814:	0505           	btst d2,d5
    2816:	0505           	btst d2,d5
    2818:	0505           	btst d2,d5
    281a:	0505           	btst d2,d5
    281c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    281e:	0505           	btst d2,d5
    2820:	0505           	btst d2,d5
    2822:	0505           	btst d2,d5
    2824:	0505           	btst d2,d5
    2826:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    2828:	0500           	btst d2,d0
    282a:	0505           	btst d2,d5
    282c:	0505           	btst d2,d5
    282e:	0505           	btst d2,d5
    2830:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    2832:	0505           	btst d2,d5
    2834:	0505           	btst d2,d5
    2836:	0505           	btst d2,d5
    2838:	0505           	btst d2,d5
    283a:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    283c:	0505           	btst d2,d5
    283e:	0505           	btst d2,d5
    2840:	0503           	btst d2,d3
    2842:	0505           	btst d2,d5
    2844:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    2846:	0505           	btst d2,d5
    2848:	0500           	btst d2,d0
    284a:	0505           	btst d2,d5
    284c:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    2850:	0505           	btst d2,d5
    2852:	0503           	btst d2,d3
    2854:	0205 0507      	andi.b #7,d5
    2858:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    285a:	0505           	btst d2,d5
    285c:	0505           	btst d2,d5
    285e:	0505           	btst d2,d5
    2860:	0505           	btst d2,d5
    2862:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2864:	0505           	btst d2,d5
    2866:	0505           	btst d2,d5
    2868:	0505           	btst d2,d5
    286a:	0505           	btst d2,d5
    286c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    286e:	0505           	btst d2,d5
    2870:	0505           	btst d2,d5
    2872:	0505           	btst d2,d5
    2874:	0505           	btst d2,d5
    2876:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2878:	0505           	btst d2,d5
    287a:	0505           	btst d2,d5
    287c:	0505           	btst d2,d5
    287e:	0505           	btst d2,d5
    2880:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2882:	0505           	btst d2,d5
    2884:	0505           	btst d2,d5
    2886:	0505           	btst d2,d5
    2888:	0505           	btst d2,d5
    288a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    288c:	0505           	btst d2,d5
    288e:	0505           	btst d2,d5
    2890:	0505           	btst d2,d5
    2892:	0505           	btst d2,d5
    2894:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2896:	0505           	btst d2,d5
    2898:	0505           	btst d2,d5
    289a:	0505           	btst d2,d5
    289c:	0505           	btst d2,d5
    289e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28a0:	0505           	btst d2,d5
    28a2:	0505           	btst d2,d5
    28a4:	0505           	btst d2,d5
    28a6:	0505           	btst d2,d5
    28a8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28aa:	0505           	btst d2,d5
    28ac:	0505           	btst d2,d5
    28ae:	0505           	btst d2,d5
    28b0:	0505           	btst d2,d5
    28b2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28b4:	0505           	btst d2,d5
    28b6:	0505           	btst d2,d5
    28b8:	0505           	btst d2,d5
    28ba:	0505           	btst d2,d5
    28bc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28be:	0505           	btst d2,d5
    28c0:	0505           	btst d2,d5
    28c2:	0505           	btst d2,d5
    28c4:	0505           	btst d2,d5
    28c6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28c8:	0505           	btst d2,d5
    28ca:	0505           	btst d2,d5
    28cc:	0505           	btst d2,d5
    28ce:	0505           	btst d2,d5
    28d0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28d2:	0505           	btst d2,d5
    28d4:	0505           	btst d2,d5
    28d6:	0505           	btst d2,d5
    28d8:	0505           	btst d2,d5
    28da:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28dc:	0505           	btst d2,d5
    28de:	0505           	btst d2,d5
    28e0:	0505           	btst d2,d5
    28e2:	0505           	btst d2,d5
    28e4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28e6:	0505           	btst d2,d5
    28e8:	0505           	btst d2,d5
    28ea:	0505           	btst d2,d5
    28ec:	0505           	btst d2,d5
    28ee:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28f0:	0505           	btst d2,d5
    28f2:	0505           	btst d2,d5
    28f4:	0505           	btst d2,d5
    28f6:	0505           	btst d2,d5
    28f8:	0505           	btst d2,d5

000028fa <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    28fa:	16c0           	move.b d0,(a3)+
  RTS
    28fc:	4e75           	rts

000028fe <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    28fe:	48f9 7fff 0000 	movem.l d0-a6,27c4 <saveregs>
    2904:	27c4 
  lea 0xdff000,a5
    2906:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddc029>,a5
  move.l sp@(4),a0  //Fontlocation
    290c:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    2910:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    2914:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    2918:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    291a:	082d 0006 0002 	btst #6,2(a5)

00002920 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    2920:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    2926:	66f8           	bne.s 2920 <st2wblit>

00002928 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    2928:	7019           	moveq #25,d0
	sub.l d5,d5      
    292a:	9a85           	sub.l d5,d5

0000292c <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    292c:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    292e:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    2930:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    2934:	9dce           	suba.l a6,a6
	move.l d2, a6
    2936:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    2938:	ddfc 0000 2800 	adda.l #10240,a6

	LSL  	#4,d2 	    //Fetch next char
    293e:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    2940:	2842           	movea.l d2,a4


	move.l  #0,d4
    2942:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    2944:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    2946:	3814           	move.w (a4),d4
	swap	d4
    2948:	4844           	swap d4
	lsr.l	d5, d4
    294a:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    294c:	8993           	or.l d4,(a3)
	clr.l	d4
    294e:	4284           	clr.l d4
	move.w  2(a4), d4
    2950:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    2954:	4844           	swap d4
	lsr.l	d5, d4
    2956:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    2958:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    295c:	4284           	clr.l d4
	move.w  4(a4), d4
    295e:	382c 0004      	move.w 4(a4),d4
	swap	d4
    2962:	4844           	swap d4
	lsr.l	d5, d4
    2964:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    2966:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    296a:	4284           	clr.l d4
	move.w  6(a4), d4
    296c:	382c 0006      	move.w 6(a4),d4
	swap	d4
    2970:	4844           	swap d4
	lsr.l	d5, d4
    2972:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    2974:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    2978:	4284           	clr.l d4
	move.w  8(a4), d4
    297a:	382c 0008      	move.w 8(a4),d4
	swap	d4
    297e:	4844           	swap d4
	lsr.l	d5, d4
    2980:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    2982:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    2986:	4284           	clr.l d4
	move.w  10(a4), d4
    2988:	382c 000a      	move.w 10(a4),d4
	swap	d4
    298c:	4844           	swap d4
	lsr.l	d5, d4
    298e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    2990:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    2994:	4284           	clr.l d4
	move.w  12(a4), d4
    2996:	382c 000c      	move.w 12(a4),d4
	swap	d4
    299a:	4844           	swap d4
	lsr.l	d5, d4
    299c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    299e:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    29a2:	4284           	clr.l d4
	move.w  14(a4), d4
    29a4:	382c 000e      	move.w 14(a4),d4
	swap	d4
    29a8:	4844           	swap d4
	lsr.l	d5, d4
    29aa:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    29ac:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    29b0:	4284           	clr.l d4

	add.b   (a6), d5
    29b2:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    29b4:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    29b8:	6500 0006      	bcs.w 29c0 <noadditionalchar>
	addq.w  #1, a3
    29bc:	524b           	addq.w #1,a3
	sub.w   #8,d5
    29be:	5145           	subq.w #8,d5

000029c0 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    29c0:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    29c2:	51c8 ff68      	dbf d0,292c <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    29c6:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    29ca:	51cb ff5c      	dbf d3,2928 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    29ce:	4cfa 7fff fdf2 	movem.l 27c4 <saveregs>(pc),d0-a6

	RTS
    29d4:	4e75           	rts
