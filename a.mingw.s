
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
       6:	4e55 ffb4      	link.w a5,#-76
       a:	48e7 3f3a      	movem.l d2-d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 61c8 	move.l a6,61c8 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,619a <hw>
      1e:	0000 619a 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 38f5 	lea 38f5 <incbin_swfont_end+0x113>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 619e 	move.l d0,619e <GfxBase>
	if (!GfxBase)
      34:	6700 145c      	beq.w 1492 <main+0x148c>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
      3e:	43f9 0000 3906 	lea 3906 <incbin_swfont_end+0x124>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 61c4 	move.l d0,61c4 <DOSBase>
	if (!DOSBase)
      50:	6700 1434      	beq.w 1486 <main+0x1480>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 3912 	pea 3912 <incbin_swfont_end+0x130>
      5a:	4eb9 0000 16c8 	jsr 16c8 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 392e 	move.l #14638,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 619a 	movea.l 619a <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 393e 	move.l #14654,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 20fc 	lea 20fc <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 61c0 	move.l d0,61c0 <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 61b0 	move.l d0,61b0 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 61bc 	move.l d0,61bc <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 61a4 	move.l d0,61a4 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 60ac 	cmp.l 60ac <ClsSprites>,d0
      d2:	6600 12f0      	bne.w 13c4 <main+0x13be>
      d6:	206a 0004      	movea.l 4(a2),a0
      da:	b1f9 0000 60b0 	cmpa.l 60b0 <ClsSprites+0x4>,a0
      e0:	6600 12e2      	bne.w 13c4 <main+0x13be>
      e4:	202a 0008      	move.l 8(a2),d0
      e8:	b0b9 0000 60b4 	cmp.l 60b4 <ClsSprites+0x8>,d0
      ee:	6600 12d4      	bne.w 13c4 <main+0x13be>
      f2:	206a 000c      	movea.l 12(a2),a0
      f6:	b1f9 0000 60b8 	cmpa.l 60b8 <ClsSprites+0xc>,a0
      fc:	6600 12c6      	bne.w 13c4 <main+0x13be>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 60bc 	cmp.l 60bc <ClsSprites+0x10>,d0
     10a:	6600 12b8      	bne.w 13c4 <main+0x13be>
     10e:	206a 0014      	movea.l 20(a2),a0
     112:	b1f9 0000 60c0 	cmpa.l 60c0 <ClsSprites+0x14>,a0
     118:	6600 12aa      	bne.w 13c4 <main+0x13be>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 60c4 	cmp.l 60c4 <ClsSprites+0x18>,d0
     126:	6600 129c      	bne.w 13c4 <main+0x13be>
     12a:	206a 001c      	movea.l 28(a2),a0
     12e:	b1f9 0000 60c8 	cmpa.l 60c8 <ClsSprites+0x1c>,a0
     134:	6600 128e      	bne.w 13c4 <main+0x13be>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 60cc 	cmp.l 60cc <ClsSprites+0x20>,d0
     142:	6600 1280      	bne.w 13c4 <main+0x13be>
     146:	206a 0024      	movea.l 36(a2),a0
     14a:	b1f9 0000 60d0 	cmpa.l 60d0 <ClsSprites+0x24>,a0
     150:	6600 1272      	bne.w 13c4 <main+0x13be>
     154:	202a 0028      	move.l 40(a2),d0
     158:	b0b9 0000 60d4 	cmp.l 60d4 <ClsSprites+0x28>,d0
     15e:	6600 1264      	bne.w 13c4 <main+0x13be>
     162:	206a 002c      	movea.l 44(a2),a0
     166:	b1f9 0000 60d8 	cmpa.l 60d8 <ClsSprites+0x2c>,a0
     16c:	6600 1256      	bne.w 13c4 <main+0x13be>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 60dc 	cmp.l 60dc <ClsSprites+0x30>,d0
     17a:	6600 1248      	bne.w 13c4 <main+0x13be>
     17e:	206a 0034      	movea.l 52(a2),a0
     182:	b1f9 0000 60e0 	cmpa.l 60e0 <ClsSprites+0x34>,a0
     188:	6600 123a      	bne.w 13c4 <main+0x13be>
     18c:	202a 0038      	move.l 56(a2),d0
     190:	b0b9 0000 60e4 	cmp.l 60e4 <ClsSprites+0x38>,d0
     196:	6600 122c      	bne.w 13c4 <main+0x13be>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 60e8 	cmpa.l 60e8 <ClsSprites+0x3c>,a2
     1a4:	6600 121e      	bne.w 13c4 <main+0x13be>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 61c0 	movea.l 61c0 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 607c 	move.l 607c <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 1254      	bne.w 140e <main+0x1408>
     1bc:	2039 0000 6080 	move.l 6080 <ClScreen+0x4>,d0
     1c2:	b0a8 0044      	cmp.l 68(a0),d0
     1c6:	6600 1246      	bne.w 140e <main+0x1408>
     1ca:	2028 0048      	move.l 72(a0),d0
     1ce:	b0b9 0000 6084 	cmp.l 6084 <ClScreen+0x8>,d0
     1d4:	6600 1238      	bne.w 140e <main+0x1408>
     1d8:	2028 004c      	move.l 76(a0),d0
     1dc:	b0b9 0000 6088 	cmp.l 6088 <ClScreen+0xc>,d0
     1e2:	6600 122a      	bne.w 140e <main+0x1408>
     1e6:	2028 0050      	move.l 80(a0),d0
     1ea:	b0b9 0000 608c 	cmp.l 608c <ClScreen+0x10>,d0
     1f0:	6600 121c      	bne.w 140e <main+0x1408>
     1f4:	2039 0000 6090 	move.l 6090 <ClScreen+0x14>,d0
     1fa:	b0a8 0054      	cmp.l 84(a0),d0
     1fe:	6600 120e      	bne.w 140e <main+0x1408>
     202:	2039 0000 6094 	move.l 6094 <ClScreen+0x18>,d0
     208:	b0a8 0058      	cmp.l 88(a0),d0
     20c:	6600 1200      	bne.w 140e <main+0x1408>
     210:	2028 005c      	move.l 92(a0),d0
     214:	b0b9 0000 6098 	cmp.l 6098 <ClScreen+0x1c>,d0
     21a:	6600 11f2      	bne.w 140e <main+0x1408>
     21e:	2039 0000 609c 	move.l 609c <ClScreen+0x20>,d0
     224:	b0a8 0060      	cmp.l 96(a0),d0
     228:	6600 11e4      	bne.w 140e <main+0x1408>
     22c:	2028 0064      	move.l 100(a0),d0
     230:	b0b9 0000 60a0 	cmp.l 60a0 <ClScreen+0x24>,d0
     236:	6600 11d6      	bne.w 140e <main+0x1408>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 60a4 	cmp.l 60a4 <ClScreen+0x28>,d0
     244:	6600 11c8      	bne.w 140e <main+0x1408>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 60a8 	cmpa.l 60a8 <ClScreen+0x2c>,a0
     252:	6600 11ba      	bne.w 140e <main+0x1408>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     256:	23fc 0004 0000 	move.l #262144,61b4 <DrawBuffer>
     25c:	0000 61b4 
  ViewBuffer = (ULONG *)0x50000;
     260:	23fc 0005 0000 	move.l #327680,61a8 <ViewBuffer>
     266:	0000 61a8 
  SetBplPointers();
     26a:	45f9 0000 2b7a 	lea 2b7a <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,61b4 <DrawBuffer>
     278:	0000 61b4 
     27c:	6700 11d8      	beq.w 1456 <main+0x1450>
    Write( Output(), 
     280:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 3941 	move.l #14657,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     29e:	2079 0000 61c0 	movea.l 61c0 <Copperlist1>,a0
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 397d 	move.l #14717,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 61c0 	movea.l 61c0 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 39ba 	move.l #14778,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 61c0 	movea.l 61c0 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2028 0078      	move.l 120(a0),d0
     304:	b0b9 0000 6074 	cmp.l 6074 <ClColor>,d0
     30a:	6600 10da      	bne.w 13e6 <main+0x13e0>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 6078 	cmp.l 6078 <ClColor+0x4>,d0
     318:	6600 10cc      	bne.w 13e6 <main+0x13e0>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 3a19 	move.l #14873,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 2972 	lea 2972 <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2079 0000 61b0 	movea.l 61b0 <DrawCopper>,a0
     350:	b1f9 0000 61bc 	cmpa.l 61bc <Copperlist2>,a0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 3a3c 	move.l #14908,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 2ba6 	lea 2ba6 <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 61b4 	move.l 61b4 <DrawBuffer>,d0
     384:	b0b9 0000 61b8 	cmp.l 61b8 <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 3a52 	move.l #14930,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2079 0000 61b0 	movea.l 61b0 <DrawCopper>,a0
     3b0:	b1f9 0000 61c0 	cmpa.l 61c0 <Copperlist1>,a0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 3a8a 	move.l #14986,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2039 0000 61a8 	move.l 61a8 <ViewBuffer>,d0
     3de:	b0b9 0000 61ac 	cmp.l 61ac <Bitplane2>,d0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 3ac4 	move.l #15044,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2079 0000 61a4 	movea.l 61a4 <ViewCopper>,a0
     40a:	b1f9 0000 61bc 	cmpa.l 61bc <Copperlist2>,a0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 3afd 	move.l #15101,d2
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
     434:	2079 0000 61a4 	movea.l 61a4 <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     44c:	b0b9 0000 61ac 	cmp.l 61ac <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 3b38 	move.l #15160,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     476:	2079 0000 61a4 	movea.l 61a4 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     48e:	b0b9 0000 61b8 	cmp.l 61b8 <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 3b81 	move.l #15233,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4b8:	2079 0000 61a4 	movea.l 61a4 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4d0:	b0b9 0000 61ac 	cmp.l 61ac <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 3bcb 	move.l #15307,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	4eb9 0000 2ce4 	jsr 2ce4 <FreeDisplay>
  TestZoom4Picture();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     506:	283c 0000 2998 	move.l #10648,d4
     50c:	2044           	movea.l d4,a0
     50e:	4e90           	jsr (a0)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     510:	4878 0010      	pea 10 <main+0xa>
     514:	4879 0000 60ac 	pea 60ac <ClsSprites>
     51a:	42a7           	clr.l -(sp)
     51c:	2f39 0000 61c0 	move.l 61c0 <Copperlist1>,-(sp)
     522:	47f9 0000 1f26 	lea 1f26 <TestCopperlistBatch>,a3
     528:	4e93           	jsr (a3)
     52a:	4fef 0018      	lea 24(sp),sp
     52e:	4a80           	tst.l d0
     530:	661e           	bne.s 550 <main+0x54a>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     532:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     538:	4eae ffc4      	jsr -60(a6)
     53c:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     542:	2200           	move.l d0,d1
     544:	243c 0000 3c14 	move.l #15380,d2
     54a:	762c           	moveq #44,d3
     54c:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     550:	4878 000c      	pea c <main+0x6>
     554:	4879 0000 6044 	pea 6044 <ClScreenZoom>
     55a:	4878 0010      	pea 10 <main+0xa>
     55e:	2f39 0000 61c0 	move.l 61c0 <Copperlist1>,-(sp)
     564:	4e93           	jsr (a3)
     566:	4fef 0010      	lea 16(sp),sp
     56a:	4a80           	tst.l d0
     56c:	661e           	bne.s 58c <main+0x586>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     56e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     574:	4eae ffc4      	jsr -60(a6)
     578:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     57e:	2200           	move.l d0,d1
     580:	243c 0000 3c4a 	move.l #15434,d2
     586:	7636           	moveq #54,d3
     588:	4eae ffd0      	jsr -48(a6)
  //ZoomHorizontal = 10;
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     58c:	2079 0000 61b0 	movea.l 61b0 <DrawCopper>,a0
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
     5a8:	23fc 0005 0000 	move.l #327680,61b4 <DrawBuffer>
     5ae:	0000 61b4 
  ViewBuffer = (ULONG *) tmp;
     5b2:	23fc 0004 0000 	move.l #262144,61a8 <ViewBuffer>
     5b8:	0000 61a8 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5bc:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c2:	4878 001c      	pea 1c <main+0x16>
     5c6:	2f39 0000 61c0 	move.l 61c0 <Copperlist1>,-(sp)
     5cc:	49f9 0000 1f08 	lea 1f08 <TestCopperlistPos>,a4
     5d2:	4e94           	jsr (a4)
     5d4:	4fef 000c      	lea 12(sp),sp
     5d8:	4a80           	tst.l d0
     5da:	661e           	bne.s 5fa <main+0x5f4>
    Write(Output(), 
     5dc:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     5e2:	4eae ffc4      	jsr -60(a6)
     5e6:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     5ec:	2200           	move.l d0,d1
     5ee:	243c 0000 397d 	move.l #14717,d2
     5f4:	763c           	moveq #60,d3
     5f6:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     5fa:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     600:	4878 001d      	pea 1d <main+0x17>
     604:	2f39 0000 61c0 	move.l 61c0 <Copperlist1>,-(sp)
     60a:	4e94           	jsr (a4)
     60c:	4fef 000c      	lea 12(sp),sp
     610:	4a80           	tst.l d0
     612:	661e           	bne.s 632 <main+0x62c>
    Write(Output(), 
     614:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     61a:	4eae ffc4      	jsr -60(a6)
     61e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     624:	2200           	move.l d0,d1
     626:	243c 0000 39ba 	move.l #14778,d2
     62c:	763c           	moveq #60,d3
     62e:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     632:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     638:	4878 001e      	pea 1e <main+0x18>
     63c:	2f39 0000 61c0 	move.l 61c0 <Copperlist1>,-(sp)
     642:	4e94           	jsr (a4)
     644:	4fef 000c      	lea 12(sp),sp
     648:	4a80           	tst.l d0
     64a:	661e           	bne.s 66a <main+0x664>
    Write(Output(), 
     64c:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     652:	4eae ffc4      	jsr -60(a6)
     656:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     65c:	2200           	move.l d0,d1
     65e:	243c 0000 3c81 	move.l #15489,d2
     664:	763c           	moveq #60,d3
     666:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     66a:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     670:	4878 001f      	pea 1f <main+0x19>
     674:	2f39 0000 61c0 	move.l 61c0 <Copperlist1>,-(sp)
     67a:	4e94           	jsr (a4)
     67c:	4fef 000c      	lea 12(sp),sp
     680:	4a80           	tst.l d0
     682:	661e           	bne.s 6a2 <main+0x69c>
    Write(Output(), 
     684:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     68a:	4eae ffc4      	jsr -60(a6)
     68e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     694:	2200           	move.l d0,d1
     696:	243c 0000 3cbe 	move.l #15550,d2
     69c:	763c           	moveq #60,d3
     69e:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6a2:	4878 0002      	pea 2 <_start+0x2>
     6a6:	4879 0000 6074 	pea 6074 <ClColor>
     6ac:	4878 0020      	pea 20 <main+0x1a>
     6b0:	2f39 0000 61c0 	move.l 61c0 <Copperlist1>,-(sp)
     6b6:	4e93           	jsr (a3)
     6b8:	4fef 0010      	lea 16(sp),sp
     6bc:	4a80           	tst.l d0
     6be:	661e           	bne.s 6de <main+0x6d8>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6c0:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     6c6:	4eae ffc4      	jsr -60(a6)
     6ca:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     6d0:	2200           	move.l d0,d1
     6d2:	243c 0000 39f7 	move.l #14839,d2
     6d8:	7621           	moveq #33,d3
     6da:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6de:	7ec0           	moveq #-64,d7
     6e0:	de8d           	add.l a5,d7
     6e2:	4878 0040      	pea 40 <main+0x3a>
     6e6:	4879 0000 4004 	pea 4004 <rundemo.c.d99b7c69+0x36b>
     6ec:	2f07           	move.l d7,-(sp)
     6ee:	4eb9 0000 2d9c 	jsr 2d9c <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     6f4:	4878 0010      	pea 10 <main+0xa>
     6f8:	2f07           	move.l d7,-(sp)
     6fa:	4878 0022      	pea 22 <main+0x1c>
     6fe:	2f39 0000 61c0 	move.l 61c0 <Copperlist1>,-(sp)
     704:	4e93           	jsr (a3)
     706:	4fef 001c      	lea 28(sp),sp
     70a:	4a80           	tst.l d0
     70c:	661e           	bne.s 72c <main+0x726>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     70e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     714:	4eae ffc4      	jsr -60(a6)
     718:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     71e:	2200           	move.l d0,d1
     720:	243c 0000 3cfb 	move.l #15611,d2
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
     750:	2f39 0000 61c0 	move.l 61c0 <Copperlist1>,-(sp)
     756:	4e93           	jsr (a3)
     758:	4fef 0010      	lea 16(sp),sp
     75c:	4a80           	tst.l d0
     75e:	661e           	bne.s 77e <main+0x778>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     760:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     766:	4eae ffc4      	jsr -60(a6)
     76a:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     770:	2200           	move.l d0,d1
     772:	243c 0000 3d1d 	move.l #15645,d2
     778:	762c           	moveq #44,d3
     77a:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     77e:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdcf02>
     782:	4878 2922      	pea 2922 <ClbuildZoom+0x27a>
     786:	2f39 0000 61c0 	move.l 61c0 <Copperlist1>,-(sp)
     78c:	4e94           	jsr (a4)
     78e:	4fef 000c      	lea 12(sp),sp
     792:	4a80           	tst.l d0
     794:	661e           	bne.s 7b4 <main+0x7ae>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     796:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     79c:	4eae ffc4      	jsr -60(a6)
     7a0:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     7a6:	2200           	move.l d0,d1
     7a8:	243c 0000 3a19 	move.l #14873,d2
     7ae:	7622           	moveq #34,d3
     7b0:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7b4:	2f3c 0001 6800 	move.l #92160,-(sp)
     7ba:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7c0:	4eb9 0000 2ce4 	jsr 2ce4 <FreeDisplay>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7c6:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
     7cc:	7004           	moveq #4,d0
     7ce:	7202           	moveq #2,d1
     7d0:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
     7d4:	33fc 0010 0000 	move.w #16,61a2 <ZoomHorizontal>
     7da:	61a2 

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     7dc:	2044           	movea.l d4,a0
     7de:	4e90           	jsr (a0)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7e0:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
     7e6:	203c 0000 c800 	move.l #51200,d0
     7ec:	7202           	moveq #2,d1
     7ee:	4eae ff3a      	jsr -198(a6)
     7f2:	2440           	movea.l d0,a2
     7f4:	23c0 0000 6184 	move.l d0,6184 <Zoom_Source>
  if( Zoom_Source == 0) {
     7fa:	508f           	addq.l #8,sp
     7fc:	6700 0d18      	beq.w 1516 <main+0x1510>
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
     81e:	2439 0000 61b4 	move.l 61b4 <DrawBuffer>,d2
    srca = source + 1;
     824:	2600           	move.l d0,d3
     826:	5483           	addq.l #2,d3
  WaitBlit();
     828:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
     82e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     832:	2079 0000 619a 	movea.l 619a <hw>,a0
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
     87a:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
     880:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     884:	2479 0000 61b4 	movea.l 61b4 <DrawBuffer>,a2
  if( *destination != 0x0180) {
     88a:	0c6a 0180 0002 	cmpi.w #384,2(a2)
     890:	671e           	beq.s 8b0 <main+0x8aa>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
     892:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     898:	4eae ffc4      	jsr -60(a6)
     89c:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     8a2:	2200           	move.l d0,d1
     8a4:	243c 0000 3d82 	move.l #15746,d2
     8aa:	761c           	moveq #28,d3
     8ac:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8b0:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
     8b6:	671e           	beq.s 8d6 <main+0x8d0>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
     8b8:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     8be:	4eae ffc4      	jsr -60(a6)
     8c2:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     8c8:	2200           	move.l d0,d1
     8ca:	243c 0000 3d9f 	move.l #15775,d2
     8d0:	761c           	moveq #28,d3
     8d2:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     8d6:	2079 0000 61b4 	movea.l 61b4 <DrawBuffer>,a0
     8dc:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
     8e2:	671e           	beq.s 902 <main+0x8fc>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
     8e4:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     8ea:	4eae ffc4      	jsr -60(a6)
     8ee:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     8f4:	2200           	move.l d0,d1
     8f6:	243c 0000 3dbc 	move.l #15804,d2
     8fc:	761a           	moveq #26,d3
     8fe:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     902:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
     908:	2279 0000 6184 	movea.l 6184 <Zoom_Source>,a1
     90e:	203c 0000 c800 	move.l #51200,d0
     914:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     918:	2f3c 0001 6800 	move.l #92160,-(sp)
     91e:	2f3c 0000 a48c 	move.l #42124,-(sp)
     924:	4eb9 0000 2ce4 	jsr 2ce4 <FreeDisplay>
     92a:	508f           	addq.l #8,sp
}

void TestCopyColumnOfZoom() {

  PrepareDisplayZoom();
     92c:	2044           	movea.l d4,a0
     92e:	4e90           	jsr (a0)

  UWORD *destination = (UWORD *)DrawBuffer;
     930:	2079 0000 61b4 	movea.l 61b4 <DrawBuffer>,a0
  *destination= 0x0000;
     936:	4250           	clr.w (a0)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     938:	317c 000f 0030 	move.w #15,48(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     93e:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     944:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
     94a:	203c 0000 c800 	move.l #51200,d0
     950:	7202           	moveq #2,d1
     952:	4eae ff3a      	jsr -198(a6)
     956:	2440           	movea.l d0,a2
     958:	23c0 0000 6184 	move.l d0,6184 <Zoom_Source>
  if( Zoom_Source == 0) {
     95e:	6700 0c0a      	beq.w 156a <main+0x1564>
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
     972:	2439 0000 61b4 	move.l 61b4 <DrawBuffer>,d2
  WaitBlit();
     978:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
     97e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     982:	2079 0000 619a 	movea.l 619a <hw>,a0
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
     9ca:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
     9d0:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     9d4:	2479 0000 61b4 	movea.l 61b4 <DrawBuffer>,a2
  if( *destination != 0x4000)
     9da:	0c52 4000      	cmpi.w #16384,(a2)
     9de:	671e           	beq.s 9fe <main+0x9f8>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     9e0:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     9e6:	4eae ffc4      	jsr -60(a6)
     9ea:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     9f0:	2200           	move.l d0,d1
     9f2:	243c 0000 3dd7 	move.l #15831,d2
     9f8:	7629           	moveq #41,d3
     9fa:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x400f)
     9fe:	0c6a 400f 0030 	cmpi.w #16399,48(a2)
     a04:	671e           	beq.s a24 <main+0xa1e>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     a06:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     a0c:	4eae ffc4      	jsr -60(a6)
     a10:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     a16:	2200           	move.l d0,d1
     a18:	243c 0000 3e01 	move.l #15873,d2
     a1e:	762a           	moveq #42,d3
     a20:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     a24:	2479 0000 61b4 	movea.l 61b4 <DrawBuffer>,a2
     a2a:	0c6a 400f 47d0 	cmpi.w #16399,18384(a2)
     a30:	6724           	beq.s a56 <main+0xa50>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     a32:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     a38:	4eae ffc4      	jsr -60(a6)
     a3c:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     a42:	2200           	move.l d0,d1
     a44:	243c 0000 3e2c 	move.l #15916,d2
     a4a:	7628           	moveq #40,d3
     a4c:	4eae ffd0      	jsr -48(a6)
     a50:	2479 0000 61b4 	movea.l 61b4 <DrawBuffer>,a2

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
     a64:	2439 0000 6184 	move.l 6184 <Zoom_Source>,d2
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
     a7c:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
     a82:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     a86:	2079 0000 619a 	movea.l 619a <hw>,a0
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
     ace:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
     ad4:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     ad8:	2479 0000 61b4 	movea.l 61b4 <DrawBuffer>,a2
  if( *destination != 0x8000)
     ade:	0c52 8000      	cmpi.w #-32768,(a2)
     ae2:	671e           	beq.s b02 <main+0xafc>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     ae4:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     aea:	4eae ffc4      	jsr -60(a6)
     aee:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     af4:	2200           	move.l d0,d1
     af6:	243c 0000 3e55 	move.l #15957,d2
     afc:	7628           	moveq #40,d3
     afe:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x800f)
     b02:	0c6a 800f 0030 	cmpi.w #-32753,48(a2)
     b08:	671e           	beq.s b28 <main+0xb22>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     b0a:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     b10:	4eae ffc4      	jsr -60(a6)
     b14:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     b1a:	2200           	move.l d0,d1
     b1c:	243c 0000 3e7e 	move.l #15998,d2
     b22:	7629           	moveq #41,d3
     b24:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     b28:	2079 0000 61b4 	movea.l 61b4 <DrawBuffer>,a0
     b2e:	0c68 800f 47d0 	cmpi.w #-32753,18384(a0)
     b34:	671e           	beq.s b54 <main+0xb4e>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     b36:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     b3c:	4eae ffc4      	jsr -60(a6)
     b40:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     b46:	2200           	move.l d0,d1
     b48:	243c 0000 3ea8 	move.l #16040,d2
     b4e:	7627           	moveq #39,d3
     b50:	4eae ffd0      	jsr -48(a6)

  FreeMem( Zoom_Source, 40*256*5);
     b54:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
     b5a:	2279 0000 6184 	movea.l 6184 <Zoom_Source>,a1
     b60:	203c 0000 c800 	move.l #51200,d0
     b66:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     b6a:	2f3c 0001 6800 	move.l #92160,-(sp)
     b70:	2f3c 0000 a48c 	move.l #42124,-(sp)
     b76:	4eb9 0000 2ce4 	jsr 2ce4 <FreeDisplay>
     b7c:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     b7e:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
     b84:	203c 0000 05a0 	move.l #1440,d0
     b8a:	7202           	moveq #2,d1
     b8c:	4eae ff3a      	jsr -198(a6)
     b90:	2440           	movea.l d0,a2
  if( source == 0) {
     b92:	4a80           	tst.l d0
     b94:	6700 0926      	beq.w 14bc <main+0x14b6>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     b98:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
     b9e:	203c 0000 05a0 	move.l #1440,d0
     ba4:	7202           	moveq #2,d1
     ba6:	4eae ff3a      	jsr -198(a6)
     baa:	2800           	move.l d0,d4
  if( destination == 0) {
     bac:	6700 090e      	beq.w 14bc <main+0x14b6>
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
     cf6:	4eb9 0000 2e2e 	jsr 2e2e <memset>
  WaitBlit();
     cfc:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
     d02:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     d06:	2079 0000 619a 	movea.l 619a <hw>,a0
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
     d42:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
     d48:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     d4c:	4fef 000c      	lea 12(sp),sp
     d50:	2044           	movea.l d4,a0
     d52:	0c68 5555 0002 	cmpi.w #21845,2(a0)
     d58:	671e           	beq.s d78 <main+0xd72>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     d5a:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     d60:	4eae ffc4      	jsr -60(a6)
     d64:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     d6a:	2200           	move.l d0,d1
     d6c:	243c 0000 3f06 	move.l #16134,d2
     d72:	761f           	moveq #31,d3
     d74:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     d78:	2044           	movea.l d4,a0
     d7a:	0c68 aaaa 0032 	cmpi.w #-21846,50(a0)
     d80:	671e           	beq.s da0 <main+0xd9a>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     d82:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     d88:	4eae ffc4      	jsr -60(a6)
     d8c:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
     d92:	2200           	move.l d0,d1
     d94:	243c 0000 3f26 	move.l #16166,d2
     d9a:	7620           	moveq #32,d3
     d9c:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     da0:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
     da6:	224a           	movea.l a2,a1
     da8:	203c 0000 05a0 	move.l #1440,d0
     dae:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     db2:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
     db8:	2244           	movea.l d4,a1
     dba:	203c 0000 05a0 	move.l #1440,d0
     dc0:	4eae ff2e      	jsr -210(a6)
5    5    5    2    a    a    a    a    9    5    5    5    5    4    a    a
abcd efgh ijkl 1234 5678 9abc defg hijk l123 4567 89ab cdef ghij kl12 3456 789a
1010 1010 1010 0101 0101 0101 0101 0101 0010 1010 1010 1010 1010 1001 0101 0101
a    a    a    5    5    5    5    5    2    a    a    a    a    9    5    5*/ 
void TestZoom4Picture() {
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dc4:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
     dca:	203c 0000 3740 	move.l #14144,d0
     dd0:	7202           	moveq #2,d1
     dd2:	4eae ff3a      	jsr -198(a6)
     dd6:	2440           	movea.l d0,a2
  if( source == 0) {
     dd8:	4a80           	tst.l d0
     dda:	6700 0718      	beq.w 14f4 <main+0x14ee>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dde:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
     de4:	203c 0000 3740 	move.l #14144,d0
     dea:	7202           	moveq #2,d1
     dec:	4eae ff3a      	jsr -198(a6)
     df0:	2800           	move.l d0,d4
  if( destination == 0) {
     df2:	6700 07c2      	beq.w 15b6 <main+0x15b0>
     df6:	200a           	move.l a2,d0
     df8:	0680 0000 3300 	addi.l #13056,d0
     dfe:	204a           	movea.l a2,a0
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
     eca:	2f04           	move.l d4,-(sp)
     ecc:	2f0a           	move.l a2,-(sp)
     ece:	4eb9 0000 235a 	jsr 235a <Zoom_ZoomIntoPicture>
  WaitBlit();
     ed4:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
     eda:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
  UWORD *valsupposed = destlinezoom1;
  for(int i=0;i<16;i++) {
     ede:	2a04           	move.l d4,d5
     ee0:	0685 0000 0304 	addi.l #772,d5
     ee6:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
     eea:	7410           	moveq #16,d2
     eec:	2c3c 0000 1b1c 	move.l #6940,d6
     ef2:	2c45           	movea.l d5,a6
     ef4:	4dee fd00      	lea -768(a6),a6
     ef8:	76f0           	moveq #-16,d3
     efa:	d682           	add.l d2,d3
    for(int i2=0;i2<16;i2+=2) {
      TestRow( valsupposed, valactual, 0x0000, i2+i*17);
     efc:	2f03           	move.l d3,-(sp)
     efe:	42a7           	clr.l -(sp)
     f00:	2f0e           	move.l a6,-(sp)
     f02:	2046           	movea.l d6,a0
     f04:	4e90           	jsr (a0)
      valactual += ZMLINESIZE/2;
     
      TestRow( valsupposed, valactual, 0xffff, i2+1+i*17);
     f06:	2043           	movea.l d3,a0
     f08:	4868 0001      	pea 1(a0)
     f0c:	2f3c 0000 ffff 	move.l #65535,-(sp)
     f12:	486e 0030      	pea 48(a6)
     f16:	2046           	movea.l d6,a0
     f18:	4e90           	jsr (a0)
      valactual += ZMLINESIZE/2;
     f1a:	4dee 0060      	lea 96(a6),a6
     f1e:	5483           	addq.l #2,d3
    for(int i2=0;i2<16;i2+=2) {
     f20:	4fef 0018      	lea 24(sp),sp
     f24:	ba8e           	cmp.l a6,d5
     f26:	66d4           	bne.s efc <main+0xef6>
    }
    TestRow( valsupposed, valactual, 0x0000, 16+i*17);
     f28:	2f02           	move.l d2,-(sp)
     f2a:	42a7           	clr.l -(sp)
     f2c:	2f0e           	move.l a6,-(sp)
     f2e:	2046           	movea.l d6,a0
     f30:	4e90           	jsr (a0)
    valactual += ZMLINESIZE/2;
     f32:	2a0e           	move.l a6,d5
     f34:	0685 0000 0330 	addi.l #816,d5
     f3a:	7011           	moveq #17,d0
     f3c:	d480           	add.l d0,d2
  for(int i=0;i<16;i++) {
     f3e:	4fef 000c      	lea 12(sp),sp
     f42:	0c82 0000 0120 	cmpi.l #288,d2
     f48:	66a8           	bne.s ef2 <main+0xeec>
  UWORD *tmp = source;
  source = destination;
  destination = tmp;
          //return;
  UWORD *bp = (UWORD *)0x202;
  *bp = 0;
     f4a:	4278 0202      	clr.w 202 <main+0x1fc>
  Zoom_ZoomIntoPicture( source, destination, 1);
     f4e:	4878 0001      	pea 1 <_start+0x1>
     f52:	2f0a           	move.l a2,-(sp)
     f54:	2f04           	move.l d4,-(sp)
     f56:	4eb9 0000 235a 	jsr 235a <Zoom_ZoomIntoPicture>
  WaitBlit();
     f5c:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
     f62:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
     f66:	260a           	move.l a2,d3
     f68:	5883           	addq.l #4,d3
     f6a:	4fef 000c      	lea 12(sp),sp
  valsupposed = destlinezoom2;
  for(int i=0;i<8;i+=2) {   
     f6e:	7400           	moveq #0,d2
     f70:	4df9 0000 1730 	lea 1730 <TestRow.constprop.3>,a6
    TestRow( valsupposed, valactual, 0x0000, i);
     f76:	2f02           	move.l d2,-(sp)
     f78:	42a7           	clr.l -(sp)
     f7a:	2f03           	move.l d3,-(sp)
     f7c:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
     
    TestRow( valsupposed, valactual, 0xffff, i+1);
     f7e:	2042           	movea.l d2,a0
     f80:	4868 0001      	pea 1(a0)
     f84:	2f3c 0000 ffff 	move.l #65535,-(sp)
     f8a:	2043           	movea.l d3,a0
     f8c:	4868 0030      	pea 48(a0)
     f90:	4e96           	jsr (a6)
  for(int i=0;i<8;i+=2) {   
     f92:	5482           	addq.l #2,d2
    valactual += ZMLINESIZE/2;
     f94:	7060           	moveq #96,d0
     f96:	d680           	add.l d0,d3
  for(int i=0;i<8;i+=2) {   
     f98:	4fef 0018      	lea 24(sp),sp
     f9c:	7008           	moveq #8,d0
     f9e:	b082           	cmp.l d2,d0
     fa0:	66d4           	bne.s f76 <main+0xf70>
  }
  TestRow( valsupposed, valactual, 0x0000, 8);
     fa2:	4878 0008      	pea 8 <main+0x2>
     fa6:	42a7           	clr.l -(sp)
     fa8:	486a 0184      	pea 388(a2)
     fac:	4e96           	jsr (a6)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 9);
     fae:	4878 0009      	pea 9 <main+0x3>
     fb2:	42a7           	clr.l -(sp)
     fb4:	486a 01b4      	pea 436(a2)
     fb8:	4e96           	jsr (a6)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 10);
     fba:	4878 000a      	pea a <main+0x4>
     fbe:	2f3c 0000 ffff 	move.l #65535,-(sp)
     fc4:	486a 01e4      	pea 484(a2)
     fc8:	4e96           	jsr (a6)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 11);
     fca:	4fef 0024      	lea 36(sp),sp
     fce:	4878 000b      	pea b <main+0x5>
     fd2:	2f3c 0000 ffff 	move.l #65535,-(sp)
     fd8:	486a 0214      	pea 532(a2)
     fdc:	4e96           	jsr (a6)
  valactual += ZMLINESIZE/2;

  for(int i=0;i<14;i++) {
     fde:	260a           	move.l a2,d3
     fe0:	0683 0000 04e4 	addi.l #1252,d3
     fe6:	4fef 000c      	lea 12(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 11);
     fea:	741a           	moveq #26,d2
     fec:	2803           	move.l d3,d4
     fee:	0684 ffff fd60 	addi.l #-672,d4
     ff4:	7af2           	moveq #-14,d5
     ff6:	da82           	add.l d2,d5
    for(int i2=0;i2<14;i2+=2) {
      TestRow( valsupposed, valactual, 0x0000, i2+i*18+12);
     ff8:	2f05           	move.l d5,-(sp)
     ffa:	42a7           	clr.l -(sp)
     ffc:	2f04           	move.l d4,-(sp)
     ffe:	4e96           	jsr (a6)
      valactual += ZMLINESIZE/2;
     
      TestRow( valsupposed, valactual, 0xffff, i2+1+i*18+12);
    1000:	2045           	movea.l d5,a0
    1002:	4868 0001      	pea 1(a0)
    1006:	2f3c 0000 ffff 	move.l #65535,-(sp)
    100c:	2044           	movea.l d4,a0
    100e:	4868 0030      	pea 48(a0)
    1012:	4e96           	jsr (a6)
      valactual += ZMLINESIZE/2;
    1014:	7060           	moveq #96,d0
    1016:	d880           	add.l d0,d4
    1018:	5485           	addq.l #2,d5
    for(int i2=0;i2<14;i2+=2) {
    101a:	4fef 0018      	lea 24(sp),sp
    101e:	b883           	cmp.l d3,d4
    1020:	66d6           	bne.s ff8 <main+0xff2>
    }
    TestRow( valsupposed, valactual, 0x0000, 14+12+i*18);
    1022:	2f02           	move.l d2,-(sp)
    1024:	42a7           	clr.l -(sp)
    1026:	2f03           	move.l d3,-(sp)
    1028:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0x0000, 15+12+i*18);
    102a:	2042           	movea.l d2,a0
    102c:	4868 0001      	pea 1(a0)
    1030:	42a7           	clr.l -(sp)
    1032:	2043           	movea.l d3,a0
    1034:	4868 0030      	pea 48(a0)
    1038:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0xffff, 16+12+i*18);
    103a:	2042           	movea.l d2,a0
    103c:	4868 0002      	pea 2(a0)
    1040:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1046:	2043           	movea.l d3,a0
    1048:	4868 0060      	pea 96(a0)
    104c:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0xffff, 17+12+i*18);
    104e:	4fef 0024      	lea 36(sp),sp
    1052:	2042           	movea.l d2,a0
    1054:	4868 0003      	pea 3(a0)
    1058:	2f3c 0000 ffff 	move.l #65535,-(sp)
    105e:	2043           	movea.l d3,a0
    1060:	4868 0090      	pea 144(a0)
    1064:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    1066:	0683 0000 0360 	addi.l #864,d3
    106c:	7012           	moveq #18,d0
    106e:	d480           	add.l d0,d2
  for(int i=0;i<14;i++) {
    1070:	4fef 000c      	lea 12(sp),sp
    1074:	0c82 0000 0116 	cmpi.l #278,d2
    107a:	6600 ff70      	bne.w fec <main+0xfe6>
    107e:	45ea 3184      	lea 12676(a2),a2
    1082:	243c 0000 0108 	move.l #264,d2
  }
  for(int i=0;i<8;i+=2) {
    TestRow( valsupposed, valactual, 0x0000, 264+i);
    1088:	2f02           	move.l d2,-(sp)
    108a:	42a7           	clr.l -(sp)
    108c:	2f0a           	move.l a2,-(sp)
    108e:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
     
    TestRow( valsupposed, valactual, 0xffff, 265+i);
    1090:	2042           	movea.l d2,a0
    1092:	4868 0001      	pea 1(a0)
    1096:	2f3c 0000 ffff 	move.l #65535,-(sp)
    109c:	486a 0030      	pea 48(a2)
    10a0:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    10a2:	5482           	addq.l #2,d2
    10a4:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<8;i+=2) {
    10a8:	4fef 0018      	lea 24(sp),sp
    10ac:	0c82 0000 0110 	cmpi.l #272,d2
    10b2:	66d4           	bne.s 1088 <main+0x1082>
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
    10b4:	4eb9 0000 2ba6 	jsr 2ba6 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    10ba:	4878 0010      	pea 10 <main+0xa>
    10be:	4879 0000 60ac 	pea 60ac <ClsSprites>
    10c4:	42a7           	clr.l -(sp)
    10c6:	2f39 0000 61c0 	move.l 61c0 <Copperlist1>,-(sp)
    10cc:	4e93           	jsr (a3)
    10ce:	4fef 0010      	lea 16(sp),sp
    10d2:	4a80           	tst.l d0
    10d4:	661e           	bne.s 10f4 <main+0x10ee>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    10d6:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    10dc:	4eae ffc4      	jsr -60(a6)
    10e0:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    10e6:	2200           	move.l d0,d1
    10e8:	243c 0000 3c14 	move.l #15380,d2
    10ee:	762c           	moveq #44,d3
    10f0:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    10f4:	4878 000c      	pea c <main+0x6>
    10f8:	4879 0000 607c 	pea 607c <ClScreen>
    10fe:	4878 0010      	pea 10 <main+0xa>
    1102:	2f39 0000 61c0 	move.l 61c0 <Copperlist1>,-(sp)
    1108:	4e93           	jsr (a3)
    110a:	4fef 0010      	lea 16(sp),sp
    110e:	4a80           	tst.l d0
    1110:	661e           	bne.s 1130 <main+0x112a>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    1112:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1118:	4eae ffc4      	jsr -60(a6)
    111c:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1122:	2200           	move.l d0,d1
    1124:	243c 0000 3c4a 	move.l #15434,d2
    112a:	7636           	moveq #54,d3
    112c:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    1130:	4878 0002      	pea 2 <_start+0x2>
    1134:	4879 0000 6074 	pea 6074 <ClColor>
    113a:	4878 001e      	pea 1e <main+0x18>
    113e:	2f39 0000 61c0 	move.l 61c0 <Copperlist1>,-(sp)
    1144:	4e93           	jsr (a3)
    1146:	4fef 0010      	lea 16(sp),sp
    114a:	4a80           	tst.l d0
    114c:	661e           	bne.s 116c <main+0x1166>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    114e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1154:	4eae ffc4      	jsr -60(a6)
    1158:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    115e:	2200           	move.l d0,d1
    1160:	243c 0000 39f7 	move.l #14839,d2
    1166:	7621           	moveq #33,d3
    1168:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    116c:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdcf02>
    1170:	4878 0020      	pea 20 <main+0x1a>
    1174:	2f39 0000 61c0 	move.l 61c0 <Copperlist1>,-(sp)
    117a:	4e94           	jsr (a4)
    117c:	4fef 000c      	lea 12(sp),sp
    1180:	4a80           	tst.l d0
    1182:	661e           	bne.s 11a2 <main+0x119c>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    1184:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    118a:	4eae ffc4      	jsr -60(a6)
    118e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1194:	2200           	move.l d0,d1
    1196:	243c 0000 3a19 	move.l #14873,d2
    119c:	7622           	moveq #34,d3
    119e:	4eae ffd0      	jsr -48(a6)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    11a2:	2479 0000 61b4 	movea.l 61b4 <DrawBuffer>,a2
    11a8:	4879 0000 3fc0 	pea 3fc0 <rundemo.c.d99b7c69+0x327>
    11ae:	2f0a           	move.l a2,-(sp)
    11b0:	4eb9 0000 15d8 	jsr 15d8 <WriteFont.constprop.4>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    11b6:	508f           	addq.l #8,sp
    11b8:	0c52 ff00      	cmpi.w #-256,(a2)
    11bc:	671e           	beq.s 11dc <main+0x11d6>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    11be:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    11c4:	4eae ffc4      	jsr -60(a6)
    11c8:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    11ce:	2200           	move.l d0,d1
    11d0:	243c 0000 3fd1 	move.l #16337,d2
    11d6:	7631           	moveq #49,d3
    11d8:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    11dc:	2f3c 0000 c800 	move.l #51200,-(sp)
    11e2:	4878 0084      	pea 84 <main+0x7e>
    11e6:	4eb9 0000 2ce4 	jsr 2ce4 <FreeDisplay>
  RunTests();
	Delay(50);
    11ec:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    11f2:	7232           	moveq #50,d1
    11f4:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    11f8:	247c 00f0 ff60 	movea.l #15794016,a2
    11fe:	508f           	addq.l #8,sp
    1200:	4a92           	tst.l (a2)
    1202:	6718           	beq.s 121c <main+0x1216>
    1204:	4878 0001      	pea 1 <_start+0x1>
    1208:	47f9 0000 1626 	lea 1626 <warpmode.part.0>,a3
    120e:	4e93           	jsr (a3)
    1210:	588f           	addq.l #4,sp
    1212:	4a92           	tst.l (a2)
    1214:	6706           	beq.s 121c <main+0x1216>
    1216:	42a7           	clr.l -(sp)
    1218:	4e93           	jsr (a3)
    121a:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    121c:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
    1222:	23ee 0022 0000 	move.l 34(a6),6188 <ActiView>
    1228:	6188 
	OwnBlitter();
    122a:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    122e:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
    1234:	4eae ff1c      	jsr -228(a6)
	Disable();
    1238:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    123e:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    1242:	2679 0000 619a 	movea.l 619a <hw>,a3
    1248:	302b 0010      	move.w 16(a3),d0
    124c:	33c0 0000 618c 	move.w d0,618c <SystemADKCON>
	SystemInts=hw->intenar;
    1252:	302b 001c      	move.w 28(a3),d0
    1256:	33c0 0000 6190 	move.w d0,6190 <SystemInts>
	SystemDMA=hw->dmaconr;
    125c:	302b 0002      	move.w 2(a3),d0
    1260:	33c0 0000 618e 	move.w d0,618e <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    1266:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    126c:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
    1272:	45f9 0000 2d56 	lea 2d56 <WaitVbl>,a2
    1278:	4e92           	jsr (a2)
	WaitVbl();
    127a:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
    127c:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    1282:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
    1288:	93c9           	suba.l a1,a1
    128a:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    128e:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
    1294:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    1298:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
    129e:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    12a2:	4e92           	jsr (a2)
	WaitVbl();
    12a4:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    12a6:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
    12ac:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
    12b2:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    12b8:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    12be:	082e 0000 0129 	btst #0,297(a6)
    12c4:	6700 02c6      	beq.w 158c <main+0x1586>
		vbr = (APTR)Supervisor((void*)getvbr);
    12c8:	cf8d           	exg d7,a5
    12ca:	4eae ffe2      	jsr -30(a6)
    12ce:	cf8d           	exg d7,a5

	VBR=GetVBR();
    12d0:	23c0 0000 6192 	move.l d0,6192 <VBR.lto_priv.5>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    12d6:	2079 0000 6192 	movea.l 6192 <VBR.lto_priv.5>,a0
    12dc:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    12e0:	23c2 0000 6196 	move.l d2,6196 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    12e6:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
    12e8:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    12ea:	2079 0000 619a 	movea.l 619a <hw>,a0
    12f0:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    12f4:	3028 0002      	move.w 2(a0),d0
    12f8:	0800 000e      	btst #14,d0
    12fc:	66f6           	bne.s 12f4 <main+0x12ee>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    12fe:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    1304:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    130a:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    1310:	2279 0000 6192 	movea.l 6192 <VBR.lto_priv.5>,a1
    1316:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    131a:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
    1320:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    1326:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    132c:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    1332:	3039 0000 6190 	move.w 6190 <SystemInts>,d0
    1338:	0040 8000      	ori.w #-32768,d0
    133c:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    1340:	3039 0000 618e 	move.w 618e <SystemDMA>,d0
    1346:	0040 8000      	ori.w #-32768,d0
    134a:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    134e:	3039 0000 618c 	move.w 618c <SystemADKCON>,d0
    1354:	0040 8000      	ori.w #-32768,d0
    1358:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    135c:	2279 0000 6188 	movea.l 6188 <ActiView>,a1
    1362:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    1366:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
    136c:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    1370:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
    1376:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    137a:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
    1380:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    1384:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
    138a:	4eae fe32      	jsr -462(a6)
	Enable();
    138e:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1394:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    1398:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    139e:	2279 0000 61c4 	movea.l 61c4 <DOSBase>,a1
    13a4:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    13a8:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    13ae:	2279 0000 619e 	movea.l 619e <GfxBase>,a1
    13b4:	4eae fe62      	jsr -414(a6)
}
    13b8:	7000           	moveq #0,d0
    13ba:	4ced 5cfc ff8c 	movem.l -116(a5),d2-d7/a2-a4/a6
    13c0:	4e5d           	unlk a5
    13c2:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    13c4:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    13ca:	4eae ffc4      	jsr -60(a6)
    13ce:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    13d4:	2200           	move.l d0,d1
    13d6:	243c 0000 3c14 	move.l #15380,d2
    13dc:	762c           	moveq #44,d3
    13de:	4eae ffd0      	jsr -48(a6)
    13e2:	6000 edc4      	bra.w 1a8 <main+0x1a2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    13e6:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    13ec:	4eae ffc4      	jsr -60(a6)
    13f0:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    13f6:	2200           	move.l d0,d1
    13f8:	243c 0000 39f7 	move.l #14839,d2
    13fe:	7621           	moveq #33,d3
    1400:	4eae ffd0      	jsr -48(a6)
    1404:	2079 0000 61c0 	movea.l 61c0 <Copperlist1>,a0
    140a:	6000 ef10      	bra.w 31c <main+0x316>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    140e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1414:	4eae ffc4      	jsr -60(a6)
    1418:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    141e:	2200           	move.l d0,d1
    1420:	243c 0000 3c4a 	move.l #15434,d2
    1426:	7636           	moveq #54,d3
    1428:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    142c:	23fc 0004 0000 	move.l #262144,61b4 <DrawBuffer>
    1432:	0000 61b4 
  ViewBuffer = (ULONG *)0x50000;
    1436:	23fc 0005 0000 	move.l #327680,61a8 <ViewBuffer>
    143c:	0000 61a8 
  SetBplPointers();
    1440:	45f9 0000 2b7a 	lea 2b7a <SetBplPointers>,a2
    1446:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    1448:	0cb9 0005 0000 	cmpi.l #327680,61b4 <DrawBuffer>
    144e:	0000 61b4 
    1452:	6600 ee2c      	bne.w 280 <main+0x27a>
    1456:	0cb9 0004 0000 	cmpi.l #262144,61a8 <ViewBuffer>
    145c:	0000 61a8 
    1460:	6700 ee3c      	beq.w 29e <main+0x298>
    Write( Output(), 
    1464:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    146a:	4eae ffc4      	jsr -60(a6)
    146e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1474:	2200           	move.l d0,d1
    1476:	243c 0000 3941 	move.l #14657,d2
    147c:	763b           	moveq #59,d3
    147e:	4eae ffd0      	jsr -48(a6)
    1482:	6000 ee1a      	bra.w 29e <main+0x298>
		Exit(0);
    1486:	9dce           	suba.l a6,a6
    1488:	7200           	moveq #0,d1
    148a:	4eae ff70      	jsr -144(a6)
    148e:	6000 ebc4      	bra.w 54 <main+0x4e>
		Exit(0);
    1492:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1498:	7200           	moveq #0,d1
    149a:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    149e:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    14a4:	43f9 0000 3906 	lea 3906 <incbin_swfont_end+0x124>,a1
    14aa:	7000           	moveq #0,d0
    14ac:	4eae fdd8      	jsr -552(a6)
    14b0:	23c0 0000 61c4 	move.l d0,61c4 <DOSBase>
	if (!DOSBase)
    14b6:	6600 eb9c      	bne.w 54 <main+0x4e>
    14ba:	60ca           	bra.s 1486 <main+0x1480>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    14bc:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    14c2:	4eae ffc4      	jsr -60(a6)
    14c6:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    14cc:	2200           	move.l d0,d1
    14ce:	243c 0000 3ed0 	move.l #16080,d2
    14d4:	7635           	moveq #53,d3
    14d6:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    14da:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    14e0:	203c 0000 3740 	move.l #14144,d0
    14e6:	7202           	moveq #2,d1
    14e8:	4eae ff3a      	jsr -198(a6)
    14ec:	2440           	movea.l d0,a2
  if( source == 0) {
    14ee:	4a80           	tst.l d0
    14f0:	6600 f8ec      	bne.w dde <main+0xdd8>
    Write(  Output(), 
    14f4:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    14fa:	4eae ffc4      	jsr -60(a6)
    14fe:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1504:	2200           	move.l d0,d1
    1506:	243c 0000 3f47 	move.l #16199,d2
    150c:	7639           	moveq #57,d3
    150e:	4eae ffd0      	jsr -48(a6)
    return;
    1512:	6000 fba0      	bra.w 10b4 <main+0x10ae>
    Write(  Output(), 
    1516:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    151c:	4eae ffc4      	jsr -60(a6)
    1520:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1526:	2200           	move.l d0,d1
    1528:	243c 0000 3d4a 	move.l #15690,d2
    152e:	7636           	moveq #54,d3
    1530:	4eae ffd0      	jsr -48(a6)
  PrepareDisplayZoom();
    1534:	2044           	movea.l d4,a0
    1536:	4e90           	jsr (a0)
  UWORD *destination = (UWORD *)DrawBuffer;
    1538:	2079 0000 61b4 	movea.l 61b4 <DrawBuffer>,a0
  *destination= 0x0000;
    153e:	4250           	clr.w (a0)
  *destination= 0x000f;
    1540:	317c 000f 0030 	move.w #15,48(a0)
  *destination = 0x000f;
    1546:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    154c:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1552:	203c 0000 c800 	move.l #51200,d0
    1558:	7202           	moveq #2,d1
    155a:	4eae ff3a      	jsr -198(a6)
    155e:	2440           	movea.l d0,a2
    1560:	23c0 0000 6184 	move.l d0,6184 <Zoom_Source>
  if( Zoom_Source == 0) {
    1566:	6600 f3fa      	bne.w 962 <main+0x95c>
    Write(  Output(), 
    156a:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1570:	4eae ffc4      	jsr -60(a6)
    1574:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    157a:	2200           	move.l d0,d1
    157c:	243c 0000 3d4a 	move.l #15690,d2
    1582:	7636           	moveq #54,d3
    1584:	4eae ffd0      	jsr -48(a6)
    return;
    1588:	6000 f5f4      	bra.w b7e <main+0xb78>
	APTR vbr = 0;
    158c:	7000           	moveq #0,d0
	VBR=GetVBR();
    158e:	23c0 0000 6192 	move.l d0,6192 <VBR.lto_priv.5>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    1594:	2079 0000 6192 	movea.l 6192 <VBR.lto_priv.5>,a0
    159a:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    159e:	23c2 0000 6196 	move.l d2,6196 <SystemIrq>
	WaitVbl();
    15a4:	4e92           	jsr (a2)
	WaitVbl();
    15a6:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    15a8:	2079 0000 619a 	movea.l 619a <hw>,a0
    15ae:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    15b2:	6000 fd40      	bra.w 12f4 <main+0x12ee>
    Write(  Output(), 
    15b6:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    15bc:	4eae ffc4      	jsr -60(a6)
    15c0:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    15c6:	2200           	move.l d0,d1
    15c8:	243c 0000 3f81 	move.l #16257,d2
    15ce:	763d           	moveq #61,d3
    15d0:	4eae ffd0      	jsr -48(a6)
    return;
    15d4:	6000 fade      	bra.w 10b4 <main+0x10ae>

000015d8 <WriteFont.constprop.4>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    15d8:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    15dc:	206f 0008      	movea.l 8(sp),a0
    15e0:	1010           	move.b (a0),d0
    15e2:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    15e6:	4880           	ext.w d0
    15e8:	48c0           	ext.l d0
    15ea:	e788           	lsl.l #3,d0
  fntptr += charpos;
    15ec:	4880           	ext.w d0
    15ee:	3040           	movea.w d0,a0
    15f0:	d1c8           	adda.l a0,a0
    15f2:	d1fc 0000 6144 	adda.l #24900,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    15f8:	3290           	move.w (a0),(a1)
    15fa:	3368 0002 0050 	move.w 2(a0),80(a1)
    1600:	3368 0004 00a0 	move.w 4(a0),160(a1)
    1606:	3368 0006 00f0 	move.w 6(a0),240(a1)
    160c:	3368 0008 0140 	move.w 8(a0),320(a1)
    1612:	3368 000a 0190 	move.w 10(a0),400(a1)
    1618:	3368 000c 01e0 	move.w 12(a0),480(a1)
    161e:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    1624:	4e75           	rts

00001626 <warpmode.part.0>:
void warpmode(int on) 
    1626:	598f           	subq.l #4,sp
    1628:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    162a:	4aaf 000c      	tst.l 12(sp)
    162e:	674c           	beq.s 167c <warpmode.part.0+0x56>
    1630:	4878 0001      	pea 1 <_start+0x1>
    1634:	740b           	moveq #11,d2
    1636:	d48f           	add.l sp,d2
    1638:	2f02           	move.l d2,-(sp)
    163a:	42a7           	clr.l -(sp)
    163c:	4879 0000 3816 	pea 3816 <incbin_swfont_end+0x34>
    1642:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdcf03>
    1646:	4878 0052      	pea 52 <main+0x4c>
    164a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeece64>
    1650:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1654:	203c 0000 37fc 	move.l #14332,d0
    165a:	4878 0001      	pea 1 <_start+0x1>
    165e:	2f02           	move.l d2,-(sp)
    1660:	42a7           	clr.l -(sp)
    1662:	2f00           	move.l d0,-(sp)
    1664:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdcf03>
    1668:	4878 0052      	pea 52 <main+0x4c>
    166c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeece64>
	}
}
    1672:	4fef 0018      	lea 24(sp),sp
    1676:	241f           	move.l (sp)+,d2
    1678:	588f           	addq.l #4,sp
    167a:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    167c:	4878 0001      	pea 1 <_start+0x1>
    1680:	740b           	moveq #11,d2
    1682:	d48f           	add.l sp,d2
    1684:	2f02           	move.l d2,-(sp)
    1686:	42a7           	clr.l -(sp)
    1688:	4879 0000 3820 	pea 3820 <incbin_swfont_end+0x3e>
    168e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdcf03>
    1692:	4878 0052      	pea 52 <main+0x4c>
    1696:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeece64>
    169c:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    16a0:	203c 0000 37e3 	move.l #14307,d0
    16a6:	4878 0001      	pea 1 <_start+0x1>
    16aa:	2f02           	move.l d2,-(sp)
    16ac:	42a7           	clr.l -(sp)
    16ae:	2f00           	move.l d0,-(sp)
    16b0:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdcf03>
    16b4:	4878 0052      	pea 52 <main+0x4c>
    16b8:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeece64>
}
    16be:	4fef 0018      	lea 24(sp),sp
    16c2:	241f           	move.l (sp)+,d2
    16c4:	588f           	addq.l #4,sp
    16c6:	4e75           	rts

000016c8 <KPrintF>:
{
    16c8:	4fef ff80      	lea -128(sp),sp
    16cc:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    16d0:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeece64>
    16d6:	6734           	beq.s 170c <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    16d8:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    16de:	206f 0090      	movea.l 144(sp),a0
    16e2:	43ef 0094      	lea 148(sp),a1
    16e6:	45f9 0000 301c 	lea 301c <PutChar>,a2
    16ec:	47ef 000c      	lea 12(sp),a3
    16f0:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    16f4:	2f0b           	move.l a3,-(sp)
    16f6:	4878 0056      	pea 56 <main+0x50>
    16fa:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeece64>
    1700:	508f           	addq.l #8,sp
}
    1702:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1706:	4fef 0080      	lea 128(sp),sp
    170a:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    170c:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1712:	206f 0090      	movea.l 144(sp),a0
    1716:	43ef 0094      	lea 148(sp),a1
    171a:	45f9 0000 300e 	lea 300e <KPutCharX>,a2
    1720:	97cb           	suba.l a3,a3
    1722:	4eae fdf6      	jsr -522(a6)
}
    1726:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    172a:	4fef 0080      	lea 128(sp),sp
    172e:	4e75           	rts

00001730 <TestRow.constprop.3>:
  }
 
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1730:	4fef ff98      	lea -104(sp),sp
    1734:	48e7 383a      	movem.l d2-d4/a2-a4/a6,-(sp)
    1738:	286f 0088      	movea.l 136(sp),a4
    173c:	282f 008c      	move.l 140(sp),d4
                                                             int numberofline) {    
  char str[ 100] = { 0 };
    1740:	47ef 0020      	lea 32(sp),a3
    1744:	4878 0064      	pea 64 <main+0x5e>
    1748:	42a7           	clr.l -(sp)
    174a:	2f0b           	move.l a3,-(sp)
    174c:	4eba 16e0      	jsr 2e2e <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
    1750:	3f6f 009e 002a 	move.w 158(sp),42(sp)

  testpattern += 10;
  destination += 10;

  for(int i=0;i<11;i++) {
    if( (*testpattern++ ^ xormask) != *destination++) {
    1756:	3039 0000 612c 	move.w 612c <destlinezoom2+0x14>,d0
    175c:	b940           	eor.w d4,d0
    175e:	4fef 000c      	lea 12(sp),sp
    1762:	b06c 0014      	cmp.w 20(a4),d0
    1766:	6738           	beq.s 17a0 <TestRow.constprop.3+0x70>
      data[0] = i;
    1768:	426f 001c      	clr.w 28(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    176c:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1772:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1778:	43ef 001c      	lea 28(sp),a1
    177c:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1782:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    1786:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    178c:	4eae ffc4      	jsr -60(a6)
    1790:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1796:	2200           	move.l d0,d1
    1798:	240b           	move.l a3,d2
    179a:	7664           	moveq #100,d3
    179c:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    17a0:	3039 0000 612e 	move.w 612e <destlinezoom2+0x16>,d0
    17a6:	b940           	eor.w d4,d0
    17a8:	b06c 0016      	cmp.w 22(a4),d0
    17ac:	673e           	beq.s 17ec <TestRow.constprop.3+0xbc>
      data[0] = i;
    17ae:	3f7c 0001 001c 	move.w #1,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    17b4:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    17ba:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    17c0:	43ef 001c      	lea 28(sp),a1
    17c4:	45f9 0000 301c 	lea 301c <PutChar>,a2
    17ca:	47ef 0020      	lea 32(sp),a3
    17ce:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    17d2:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    17d8:	4eae ffc4      	jsr -60(a6)
    17dc:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    17e2:	2200           	move.l d0,d1
    17e4:	240b           	move.l a3,d2
    17e6:	7664           	moveq #100,d3
    17e8:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    17ec:	3039 0000 6130 	move.w 6130 <destlinezoom2+0x18>,d0
    17f2:	b940           	eor.w d4,d0
    17f4:	b06c 0018      	cmp.w 24(a4),d0
    17f8:	673e           	beq.s 1838 <TestRow.constprop.3+0x108>
      data[0] = i;
    17fa:	3f7c 0002 001c 	move.w #2,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1800:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1806:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    180c:	43ef 001c      	lea 28(sp),a1
    1810:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1816:	47ef 0020      	lea 32(sp),a3
    181a:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    181e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1824:	4eae ffc4      	jsr -60(a6)
    1828:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    182e:	2200           	move.l d0,d1
    1830:	240b           	move.l a3,d2
    1832:	7664           	moveq #100,d3
    1834:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1838:	3039 0000 6132 	move.w 6132 <destlinezoom2+0x1a>,d0
    183e:	b940           	eor.w d4,d0
    1840:	b06c 001a      	cmp.w 26(a4),d0
    1844:	673e           	beq.s 1884 <TestRow.constprop.3+0x154>
      data[0] = i;
    1846:	3f7c 0003 001c 	move.w #3,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    184c:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1852:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1858:	43ef 001c      	lea 28(sp),a1
    185c:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1862:	47ef 0020      	lea 32(sp),a3
    1866:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    186a:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1870:	4eae ffc4      	jsr -60(a6)
    1874:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    187a:	2200           	move.l d0,d1
    187c:	240b           	move.l a3,d2
    187e:	7664           	moveq #100,d3
    1880:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1884:	3039 0000 6134 	move.w 6134 <destlinezoom2+0x1c>,d0
    188a:	b940           	eor.w d4,d0
    188c:	b06c 001c      	cmp.w 28(a4),d0
    1890:	673e           	beq.s 18d0 <TestRow.constprop.3+0x1a0>
      data[0] = i;
    1892:	3f7c 0004 001c 	move.w #4,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1898:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    189e:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    18a4:	43ef 001c      	lea 28(sp),a1
    18a8:	45f9 0000 301c 	lea 301c <PutChar>,a2
    18ae:	47ef 0020      	lea 32(sp),a3
    18b2:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    18b6:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    18bc:	4eae ffc4      	jsr -60(a6)
    18c0:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    18c6:	2200           	move.l d0,d1
    18c8:	240b           	move.l a3,d2
    18ca:	7664           	moveq #100,d3
    18cc:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    18d0:	3039 0000 6136 	move.w 6136 <destlinezoom2+0x1e>,d0
    18d6:	b940           	eor.w d4,d0
    18d8:	b06c 001e      	cmp.w 30(a4),d0
    18dc:	673e           	beq.s 191c <TestRow.constprop.3+0x1ec>
      data[0] = i;
    18de:	3f7c 0005 001c 	move.w #5,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    18e4:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    18ea:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    18f0:	43ef 001c      	lea 28(sp),a1
    18f4:	45f9 0000 301c 	lea 301c <PutChar>,a2
    18fa:	47ef 0020      	lea 32(sp),a3
    18fe:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1902:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1908:	4eae ffc4      	jsr -60(a6)
    190c:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1912:	2200           	move.l d0,d1
    1914:	240b           	move.l a3,d2
    1916:	7664           	moveq #100,d3
    1918:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    191c:	3039 0000 6138 	move.w 6138 <destlinezoom2+0x20>,d0
    1922:	b940           	eor.w d4,d0
    1924:	b06c 0020      	cmp.w 32(a4),d0
    1928:	673e           	beq.s 1968 <TestRow.constprop.3+0x238>
      data[0] = i;
    192a:	3f7c 0006 001c 	move.w #6,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1930:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1936:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    193c:	43ef 001c      	lea 28(sp),a1
    1940:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1946:	47ef 0020      	lea 32(sp),a3
    194a:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    194e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1954:	4eae ffc4      	jsr -60(a6)
    1958:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    195e:	2200           	move.l d0,d1
    1960:	240b           	move.l a3,d2
    1962:	7664           	moveq #100,d3
    1964:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1968:	3039 0000 613a 	move.w 613a <destlinezoom2+0x22>,d0
    196e:	b940           	eor.w d4,d0
    1970:	b06c 0022      	cmp.w 34(a4),d0
    1974:	673e           	beq.s 19b4 <TestRow.constprop.3+0x284>
      data[0] = i;
    1976:	3f7c 0007 001c 	move.w #7,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    197c:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1982:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1988:	43ef 001c      	lea 28(sp),a1
    198c:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1992:	47ef 0020      	lea 32(sp),a3
    1996:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    199a:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    19a0:	4eae ffc4      	jsr -60(a6)
    19a4:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    19aa:	2200           	move.l d0,d1
    19ac:	240b           	move.l a3,d2
    19ae:	7664           	moveq #100,d3
    19b0:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    19b4:	3039 0000 613c 	move.w 613c <destlinezoom2+0x24>,d0
    19ba:	b940           	eor.w d4,d0
    19bc:	b06c 0024      	cmp.w 36(a4),d0
    19c0:	673e           	beq.s 1a00 <TestRow.constprop.3+0x2d0>
      data[0] = i;
    19c2:	3f7c 0008 001c 	move.w #8,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    19c8:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    19ce:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    19d4:	43ef 001c      	lea 28(sp),a1
    19d8:	45f9 0000 301c 	lea 301c <PutChar>,a2
    19de:	47ef 0020      	lea 32(sp),a3
    19e2:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    19e6:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    19ec:	4eae ffc4      	jsr -60(a6)
    19f0:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    19f6:	2200           	move.l d0,d1
    19f8:	240b           	move.l a3,d2
    19fa:	7664           	moveq #100,d3
    19fc:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1a00:	3039 0000 613e 	move.w 613e <destlinezoom2+0x26>,d0
    1a06:	b940           	eor.w d4,d0
    1a08:	b06c 0026      	cmp.w 38(a4),d0
    1a0c:	673e           	beq.s 1a4c <TestRow.constprop.3+0x31c>
      data[0] = i;
    1a0e:	3f7c 0009 001c 	move.w #9,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1a14:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1a1a:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1a20:	43ef 001c      	lea 28(sp),a1
    1a24:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1a2a:	47ef 0020      	lea 32(sp),a3
    1a2e:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1a32:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1a38:	4eae ffc4      	jsr -60(a6)
    1a3c:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1a42:	2200           	move.l d0,d1
    1a44:	240b           	move.l a3,d2
    1a46:	7664           	moveq #100,d3
    1a48:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1a4c:	3039 0000 6140 	move.w 6140 <destlinezoom2+0x28>,d0
    1a52:	b940           	eor.w d4,d0
    1a54:	b06c 0028      	cmp.w 40(a4),d0
    1a58:	673e           	beq.s 1a98 <TestRow.constprop.3+0x368>
      data[0] = i;
    1a5a:	3f7c 000a 001c 	move.w #10,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1a60:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1a66:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1a6c:	43ef 001c      	lea 28(sp),a1
    1a70:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1a76:	47ef 0020      	lea 32(sp),a3
    1a7a:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1a7e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1a84:	4eae ffc4      	jsr -60(a6)
    1a88:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1a8e:	2200           	move.l d0,d1
    1a90:	240b           	move.l a3,d2
    1a92:	7664           	moveq #100,d3
    1a94:	4eae ffd0      	jsr -48(a6)
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1a98:	3039 0000 6142 	move.w 6142 <destlinezoom2+0x2a>,d0
    1a9e:	b144           	eor.w d0,d4
    1aa0:	302c 002a      	move.w 42(a4),d0
    1aa4:	b144           	eor.w d0,d4
    1aa6:	0244 ff00      	andi.w #-256,d4
    1aaa:	660a           	bne.s 1ab6 <TestRow.constprop.3+0x386>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
    1aac:	4cdf 5c1c      	movem.l (sp)+,d2-d4/a2-a4/a6
    1ab0:	4fef 0068      	lea 104(sp),sp
    1ab4:	4e75           	rts
    data[0] = 22;
    1ab6:	3f7c 0016 001c 	move.w #22,28(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    1abc:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1ac2:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1ac8:	43ef 001c      	lea 28(sp),a1
    1acc:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1ad2:	47ef 0020      	lea 32(sp),a3
    1ad6:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1ada:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1ae0:	4eae ffc4      	jsr -60(a6)
    1ae4:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1aea:	2200           	move.l d0,d1
    1aec:	240b           	move.l a3,d2
    1aee:	7664           	moveq #100,d3
    1af0:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1af4:	7000           	moveq #0,d0
    1af6:	302c 002a      	move.w 42(a4),d0
    1afa:	2f00           	move.l d0,-(sp)
    1afc:	3039 0000 6142 	move.w 6142 <destlinezoom2+0x2a>,d0
    1b02:	2f00           	move.l d0,-(sp)
    1b04:	4879 0000 385b 	pea 385b <incbin_swfont_end+0x79>
    1b0a:	4eba fbbc      	jsr 16c8 <KPrintF>(pc)
    1b0e:	4fef 000c      	lea 12(sp),sp
}
    1b12:	4cdf 5c1c      	movem.l (sp)+,d2-d4/a2-a4/a6
    1b16:	4fef 0068      	lea 104(sp),sp
    1b1a:	4e75           	rts

00001b1c <TestRow.constprop.2>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1b1c:	4fef ff98      	lea -104(sp),sp
    1b20:	48e7 383a      	movem.l d2-d4/a2-a4/a6,-(sp)
    1b24:	286f 0088      	movea.l 136(sp),a4
    1b28:	282f 008c      	move.l 140(sp),d4
  char str[ 100] = { 0 };
    1b2c:	47ef 0020      	lea 32(sp),a3
    1b30:	4878 0064      	pea 64 <main+0x5e>
    1b34:	42a7           	clr.l -(sp)
    1b36:	2f0b           	move.l a3,-(sp)
    1b38:	4eba 12f4      	jsr 2e2e <memset>(pc)
  data[1] = numberofline;
    1b3c:	3f6f 009e 002a 	move.w 158(sp),42(sp)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1b42:	3039 0000 6100 	move.w 6100 <destlinezoom1+0x14>,d0
    1b48:	b940           	eor.w d4,d0
    1b4a:	4fef 000c      	lea 12(sp),sp
    1b4e:	b06c 0014      	cmp.w 20(a4),d0
    1b52:	6738           	beq.s 1b8c <TestRow.constprop.2+0x70>
      data[0] = i;
    1b54:	426f 001c      	clr.w 28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1b58:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1b5e:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1b64:	43ef 001c      	lea 28(sp),a1
    1b68:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1b6e:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1b72:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1b78:	4eae ffc4      	jsr -60(a6)
    1b7c:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1b82:	2200           	move.l d0,d1
    1b84:	240b           	move.l a3,d2
    1b86:	7664           	moveq #100,d3
    1b88:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1b8c:	3039 0000 6102 	move.w 6102 <destlinezoom1+0x16>,d0
    1b92:	b940           	eor.w d4,d0
    1b94:	b06c 0016      	cmp.w 22(a4),d0
    1b98:	673e           	beq.s 1bd8 <TestRow.constprop.2+0xbc>
      data[0] = i;
    1b9a:	3f7c 0001 001c 	move.w #1,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1ba0:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1ba6:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1bac:	43ef 001c      	lea 28(sp),a1
    1bb0:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1bb6:	47ef 0020      	lea 32(sp),a3
    1bba:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1bbe:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1bc4:	4eae ffc4      	jsr -60(a6)
    1bc8:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1bce:	2200           	move.l d0,d1
    1bd0:	240b           	move.l a3,d2
    1bd2:	7664           	moveq #100,d3
    1bd4:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1bd8:	3039 0000 6104 	move.w 6104 <destlinezoom1+0x18>,d0
    1bde:	b940           	eor.w d4,d0
    1be0:	b06c 0018      	cmp.w 24(a4),d0
    1be4:	673e           	beq.s 1c24 <TestRow.constprop.2+0x108>
      data[0] = i;
    1be6:	3f7c 0002 001c 	move.w #2,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1bec:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1bf2:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1bf8:	43ef 001c      	lea 28(sp),a1
    1bfc:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1c02:	47ef 0020      	lea 32(sp),a3
    1c06:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1c0a:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1c10:	4eae ffc4      	jsr -60(a6)
    1c14:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1c1a:	2200           	move.l d0,d1
    1c1c:	240b           	move.l a3,d2
    1c1e:	7664           	moveq #100,d3
    1c20:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1c24:	3039 0000 6106 	move.w 6106 <destlinezoom1+0x1a>,d0
    1c2a:	b940           	eor.w d4,d0
    1c2c:	b06c 001a      	cmp.w 26(a4),d0
    1c30:	673e           	beq.s 1c70 <TestRow.constprop.2+0x154>
      data[0] = i;
    1c32:	3f7c 0003 001c 	move.w #3,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1c38:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1c3e:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1c44:	43ef 001c      	lea 28(sp),a1
    1c48:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1c4e:	47ef 0020      	lea 32(sp),a3
    1c52:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1c56:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1c5c:	4eae ffc4      	jsr -60(a6)
    1c60:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1c66:	2200           	move.l d0,d1
    1c68:	240b           	move.l a3,d2
    1c6a:	7664           	moveq #100,d3
    1c6c:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1c70:	3039 0000 6108 	move.w 6108 <destlinezoom1+0x1c>,d0
    1c76:	b940           	eor.w d4,d0
    1c78:	b06c 001c      	cmp.w 28(a4),d0
    1c7c:	673e           	beq.s 1cbc <TestRow.constprop.2+0x1a0>
      data[0] = i;
    1c7e:	3f7c 0004 001c 	move.w #4,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1c84:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1c8a:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1c90:	43ef 001c      	lea 28(sp),a1
    1c94:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1c9a:	47ef 0020      	lea 32(sp),a3
    1c9e:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1ca2:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1ca8:	4eae ffc4      	jsr -60(a6)
    1cac:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1cb2:	2200           	move.l d0,d1
    1cb4:	240b           	move.l a3,d2
    1cb6:	7664           	moveq #100,d3
    1cb8:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1cbc:	3039 0000 610a 	move.w 610a <destlinezoom1+0x1e>,d0
    1cc2:	b940           	eor.w d4,d0
    1cc4:	b06c 001e      	cmp.w 30(a4),d0
    1cc8:	673e           	beq.s 1d08 <TestRow.constprop.2+0x1ec>
      data[0] = i;
    1cca:	3f7c 0005 001c 	move.w #5,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1cd0:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1cd6:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1cdc:	43ef 001c      	lea 28(sp),a1
    1ce0:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1ce6:	47ef 0020      	lea 32(sp),a3
    1cea:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1cee:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1cf4:	4eae ffc4      	jsr -60(a6)
    1cf8:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1cfe:	2200           	move.l d0,d1
    1d00:	240b           	move.l a3,d2
    1d02:	7664           	moveq #100,d3
    1d04:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1d08:	3039 0000 610c 	move.w 610c <destlinezoom1+0x20>,d0
    1d0e:	b940           	eor.w d4,d0
    1d10:	b06c 0020      	cmp.w 32(a4),d0
    1d14:	673e           	beq.s 1d54 <TestRow.constprop.2+0x238>
      data[0] = i;
    1d16:	3f7c 0006 001c 	move.w #6,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1d1c:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1d22:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1d28:	43ef 001c      	lea 28(sp),a1
    1d2c:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1d32:	47ef 0020      	lea 32(sp),a3
    1d36:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1d3a:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1d40:	4eae ffc4      	jsr -60(a6)
    1d44:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1d4a:	2200           	move.l d0,d1
    1d4c:	240b           	move.l a3,d2
    1d4e:	7664           	moveq #100,d3
    1d50:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1d54:	3039 0000 610e 	move.w 610e <destlinezoom1+0x22>,d0
    1d5a:	b940           	eor.w d4,d0
    1d5c:	b06c 0022      	cmp.w 34(a4),d0
    1d60:	673e           	beq.s 1da0 <TestRow.constprop.2+0x284>
      data[0] = i;
    1d62:	3f7c 0007 001c 	move.w #7,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1d68:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1d6e:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1d74:	43ef 001c      	lea 28(sp),a1
    1d78:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1d7e:	47ef 0020      	lea 32(sp),a3
    1d82:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1d86:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1d8c:	4eae ffc4      	jsr -60(a6)
    1d90:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1d96:	2200           	move.l d0,d1
    1d98:	240b           	move.l a3,d2
    1d9a:	7664           	moveq #100,d3
    1d9c:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1da0:	3039 0000 6110 	move.w 6110 <destlinezoom1+0x24>,d0
    1da6:	b940           	eor.w d4,d0
    1da8:	b06c 0024      	cmp.w 36(a4),d0
    1dac:	673e           	beq.s 1dec <TestRow.constprop.2+0x2d0>
      data[0] = i;
    1dae:	3f7c 0008 001c 	move.w #8,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1db4:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1dba:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1dc0:	43ef 001c      	lea 28(sp),a1
    1dc4:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1dca:	47ef 0020      	lea 32(sp),a3
    1dce:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1dd2:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1dd8:	4eae ffc4      	jsr -60(a6)
    1ddc:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1de2:	2200           	move.l d0,d1
    1de4:	240b           	move.l a3,d2
    1de6:	7664           	moveq #100,d3
    1de8:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1dec:	3039 0000 6112 	move.w 6112 <destlinezoom1+0x26>,d0
    1df2:	b940           	eor.w d4,d0
    1df4:	b06c 0026      	cmp.w 38(a4),d0
    1df8:	673e           	beq.s 1e38 <TestRow.constprop.2+0x31c>
      data[0] = i;
    1dfa:	3f7c 0009 001c 	move.w #9,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1e00:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1e06:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1e0c:	43ef 001c      	lea 28(sp),a1
    1e10:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1e16:	47ef 0020      	lea 32(sp),a3
    1e1a:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1e1e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1e24:	4eae ffc4      	jsr -60(a6)
    1e28:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1e2e:	2200           	move.l d0,d1
    1e30:	240b           	move.l a3,d2
    1e32:	7664           	moveq #100,d3
    1e34:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1e38:	3039 0000 6114 	move.w 6114 <destlinezoom1+0x28>,d0
    1e3e:	b940           	eor.w d4,d0
    1e40:	b06c 0028      	cmp.w 40(a4),d0
    1e44:	673e           	beq.s 1e84 <TestRow.constprop.2+0x368>
      data[0] = i;
    1e46:	3f7c 000a 001c 	move.w #10,28(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1e4c:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1e52:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1e58:	43ef 001c      	lea 28(sp),a1
    1e5c:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1e62:	47ef 0020      	lea 32(sp),a3
    1e66:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1e6a:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1e70:	4eae ffc4      	jsr -60(a6)
    1e74:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1e7a:	2200           	move.l d0,d1
    1e7c:	240b           	move.l a3,d2
    1e7e:	7664           	moveq #100,d3
    1e80:	4eae ffd0      	jsr -48(a6)
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1e84:	3039 0000 6116 	move.w 6116 <destlinezoom1+0x2a>,d0
    1e8a:	b144           	eor.w d0,d4
    1e8c:	302c 002a      	move.w 42(a4),d0
    1e90:	b144           	eor.w d0,d4
    1e92:	0244 ff00      	andi.w #-256,d4
    1e96:	660a           	bne.s 1ea2 <TestRow.constprop.2+0x386>
}
    1e98:	4cdf 5c1c      	movem.l (sp)+,d2-d4/a2-a4/a6
    1e9c:	4fef 0068      	lea 104(sp),sp
    1ea0:	4e75           	rts
    data[0] = 22;
    1ea2:	3f7c 0016 001c 	move.w #22,28(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    1ea8:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    1eae:	41f9 0000 382b 	lea 382b <incbin_swfont_end+0x49>,a0
    1eb4:	43ef 001c      	lea 28(sp),a1
    1eb8:	45f9 0000 301c 	lea 301c <PutChar>,a2
    1ebe:	47ef 0020      	lea 32(sp),a3
    1ec2:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1ec6:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1ecc:	4eae ffc4      	jsr -60(a6)
    1ed0:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    1ed6:	2200           	move.l d0,d1
    1ed8:	240b           	move.l a3,d2
    1eda:	7664           	moveq #100,d3
    1edc:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1ee0:	7000           	moveq #0,d0
    1ee2:	302c 002a      	move.w 42(a4),d0
    1ee6:	2f00           	move.l d0,-(sp)
    1ee8:	3039 0000 6116 	move.w 6116 <destlinezoom1+0x2a>,d0
    1eee:	2f00           	move.l d0,-(sp)
    1ef0:	4879 0000 385b 	pea 385b <incbin_swfont_end+0x79>
    1ef6:	4eba f7d0      	jsr 16c8 <KPrintF>(pc)
    1efa:	4fef 000c      	lea 12(sp),sp
}
    1efe:	4cdf 5c1c      	movem.l (sp)+,d2-d4/a2-a4/a6
    1f02:	4fef 0068      	lea 104(sp),sp
    1f06:	4e75           	rts

00001f08 <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    1f08:	202f 0008      	move.l 8(sp),d0
    1f0c:	d080           	add.l d0,d0
    1f0e:	d080           	add.l d0,d0
    1f10:	206f 0004      	movea.l 4(sp),a0
    1f14:	2030 0800      	move.l (0,a0,d0.l),d0
    1f18:	b0af 000c      	cmp.l 12(sp),d0
    1f1c:	57c0           	seq d0
    1f1e:	4880           	ext.w d0
    1f20:	48c0           	ext.l d0
}
    1f22:	4480           	neg.l d0
    1f24:	4e75           	rts

00001f26 <TestCopperlistBatch>:
                                                                  long length) {
    1f26:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    1f2a:	246f 0010      	movea.l 16(sp),a2
    1f2e:	206f 0014      	movea.l 20(sp),a0
    1f32:	226f 0018      	movea.l 24(sp),a1
    1f36:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    1f3a:	2008           	move.l a0,d0
    1f3c:	d088           	add.l a0,d0
    1f3e:	d080           	add.l d0,d0
    1f40:	2411           	move.l (a1),d2
    1f42:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    1f46:	6600 01ac      	bne.w 20f4 <TestCopperlistBatch+0x1ce>
    1f4a:	2008           	move.l a0,d0
    1f4c:	5280           	addq.l #1,d0
    1f4e:	d080           	add.l d0,d0
    1f50:	d080           	add.l d0,d0
    1f52:	2032 0800      	move.l (0,a2,d0.l),d0
    1f56:	b0a9 0004      	cmp.l 4(a1),d0
    1f5a:	6600 0198      	bne.w 20f4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1f5e:	7002           	moveq #2,d0
    1f60:	b081           	cmp.l d1,d0
    1f62:	6700 0188      	beq.w 20ec <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1f66:	2008           	move.l a0,d0
    1f68:	5480           	addq.l #2,d0
    1f6a:	d080           	add.l d0,d0
    1f6c:	d080           	add.l d0,d0
    1f6e:	2032 0800      	move.l (0,a2,d0.l),d0
    1f72:	b0a9 0008      	cmp.l 8(a1),d0
    1f76:	6600 017c      	bne.w 20f4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1f7a:	7403           	moveq #3,d2
    1f7c:	b481           	cmp.l d1,d2
    1f7e:	6700 016c      	beq.w 20ec <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1f82:	2008           	move.l a0,d0
    1f84:	5680           	addq.l #3,d0
    1f86:	d080           	add.l d0,d0
    1f88:	d080           	add.l d0,d0
    1f8a:	2032 0800      	move.l (0,a2,d0.l),d0
    1f8e:	b0a9 000c      	cmp.l 12(a1),d0
    1f92:	6600 0160      	bne.w 20f4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1f96:	7004           	moveq #4,d0
    1f98:	b081           	cmp.l d1,d0
    1f9a:	6700 0150      	beq.w 20ec <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1f9e:	2008           	move.l a0,d0
    1fa0:	5880           	addq.l #4,d0
    1fa2:	d080           	add.l d0,d0
    1fa4:	d080           	add.l d0,d0
    1fa6:	2032 0800      	move.l (0,a2,d0.l),d0
    1faa:	b0a9 0010      	cmp.l 16(a1),d0
    1fae:	6600 0144      	bne.w 20f4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1fb2:	7405           	moveq #5,d2
    1fb4:	b481           	cmp.l d1,d2
    1fb6:	6700 0134      	beq.w 20ec <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1fba:	2008           	move.l a0,d0
    1fbc:	5a80           	addq.l #5,d0
    1fbe:	d080           	add.l d0,d0
    1fc0:	d080           	add.l d0,d0
    1fc2:	2032 0800      	move.l (0,a2,d0.l),d0
    1fc6:	b0a9 0014      	cmp.l 20(a1),d0
    1fca:	6600 0128      	bne.w 20f4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1fce:	7006           	moveq #6,d0
    1fd0:	b081           	cmp.l d1,d0
    1fd2:	6700 0118      	beq.w 20ec <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1fd6:	2008           	move.l a0,d0
    1fd8:	5c80           	addq.l #6,d0
    1fda:	d080           	add.l d0,d0
    1fdc:	d080           	add.l d0,d0
    1fde:	2032 0800      	move.l (0,a2,d0.l),d0
    1fe2:	b0a9 0018      	cmp.l 24(a1),d0
    1fe6:	6600 010c      	bne.w 20f4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1fea:	7407           	moveq #7,d2
    1fec:	b481           	cmp.l d1,d2
    1fee:	6700 00fc      	beq.w 20ec <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1ff2:	2008           	move.l a0,d0
    1ff4:	5e80           	addq.l #7,d0
    1ff6:	d080           	add.l d0,d0
    1ff8:	d080           	add.l d0,d0
    1ffa:	2032 0800      	move.l (0,a2,d0.l),d0
    1ffe:	b0a9 001c      	cmp.l 28(a1),d0
    2002:	6600 00f0      	bne.w 20f4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2006:	7008           	moveq #8,d0
    2008:	b081           	cmp.l d1,d0
    200a:	6700 00e0      	beq.w 20ec <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    200e:	2008           	move.l a0,d0
    2010:	5080           	addq.l #8,d0
    2012:	d080           	add.l d0,d0
    2014:	d080           	add.l d0,d0
    2016:	2032 0800      	move.l (0,a2,d0.l),d0
    201a:	b0a9 0020      	cmp.l 32(a1),d0
    201e:	6600 00d4      	bne.w 20f4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2022:	7409           	moveq #9,d2
    2024:	b481           	cmp.l d1,d2
    2026:	6700 00c4      	beq.w 20ec <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    202a:	47e8 0009      	lea 9(a0),a3
    202e:	200b           	move.l a3,d0
    2030:	d08b           	add.l a3,d0
    2032:	d080           	add.l d0,d0
    2034:	2032 0800      	move.l (0,a2,d0.l),d0
    2038:	b0a9 0024      	cmp.l 36(a1),d0
    203c:	6600 00b6      	bne.w 20f4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2040:	700a           	moveq #10,d0
    2042:	b081           	cmp.l d1,d0
    2044:	6700 00a6      	beq.w 20ec <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2048:	47e8 000a      	lea 10(a0),a3
    204c:	200b           	move.l a3,d0
    204e:	d08b           	add.l a3,d0
    2050:	d080           	add.l d0,d0
    2052:	2032 0800      	move.l (0,a2,d0.l),d0
    2056:	b0a9 0028      	cmp.l 40(a1),d0
    205a:	6600 0098      	bne.w 20f4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    205e:	740b           	moveq #11,d2
    2060:	b481           	cmp.l d1,d2
    2062:	6700 0088      	beq.w 20ec <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2066:	47e8 000b      	lea 11(a0),a3
    206a:	200b           	move.l a3,d0
    206c:	d08b           	add.l a3,d0
    206e:	d080           	add.l d0,d0
    2070:	2032 0800      	move.l (0,a2,d0.l),d0
    2074:	b0a9 002c      	cmp.l 44(a1),d0
    2078:	667a           	bne.s 20f4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    207a:	700c           	moveq #12,d0
    207c:	b081           	cmp.l d1,d0
    207e:	676c           	beq.s 20ec <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2080:	47e8 000c      	lea 12(a0),a3
    2084:	200b           	move.l a3,d0
    2086:	d08b           	add.l a3,d0
    2088:	d080           	add.l d0,d0
    208a:	2032 0800      	move.l (0,a2,d0.l),d0
    208e:	b0a9 0030      	cmp.l 48(a1),d0
    2092:	6660           	bne.s 20f4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2094:	740d           	moveq #13,d2
    2096:	b481           	cmp.l d1,d2
    2098:	6752           	beq.s 20ec <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    209a:	47e8 000d      	lea 13(a0),a3
    209e:	200b           	move.l a3,d0
    20a0:	d08b           	add.l a3,d0
    20a2:	d080           	add.l d0,d0
    20a4:	2032 0800      	move.l (0,a2,d0.l),d0
    20a8:	b0a9 0034      	cmp.l 52(a1),d0
    20ac:	6646           	bne.s 20f4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    20ae:	700e           	moveq #14,d0
    20b0:	b081           	cmp.l d1,d0
    20b2:	6738           	beq.s 20ec <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    20b4:	47e8 000e      	lea 14(a0),a3
    20b8:	200b           	move.l a3,d0
    20ba:	d08b           	add.l a3,d0
    20bc:	d080           	add.l d0,d0
    20be:	2032 0800      	move.l (0,a2,d0.l),d0
    20c2:	b0a9 0038      	cmp.l 56(a1),d0
    20c6:	662c           	bne.s 20f4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    20c8:	7410           	moveq #16,d2
    20ca:	b481           	cmp.l d1,d2
    20cc:	661e           	bne.s 20ec <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    20ce:	41e8 000f      	lea 15(a0),a0
    20d2:	d1c8           	adda.l a0,a0
    20d4:	d1c8           	adda.l a0,a0
    20d6:	2070 a800      	movea.l (0,a0,a2.l),a0
    20da:	b1e9 003c      	cmpa.l 60(a1),a0
    20de:	57c0           	seq d0
    20e0:	4880           	ext.w d0
    20e2:	48c0           	ext.l d0
    20e4:	4480           	neg.l d0
}
    20e6:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    20ea:	4e75           	rts
  return 1;
    20ec:	7001           	moveq #1,d0
}
    20ee:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    20f2:	4e75           	rts
      return 0;
    20f4:	7000           	moveq #0,d0
}
    20f6:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    20fa:	4e75           	rts

000020fc <ClBuild>:
ULONG * ClbuildSW() {
    20fc:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    2100:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    2106:	707b           	moveq #123,d0
    2108:	4600           	not.b d0
    210a:	7202           	moveq #2,d1
    210c:	4eae ff3a      	jsr -198(a6)
    2110:	2440           	movea.l d0,a2
  if( retval == 0) {
    2112:	4a80           	tst.l d0
    2114:	6700 010e      	beq.w 2224 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    2118:	24b9 0000 60ac 	move.l 60ac <ClsSprites>,(a2)
    211e:	2579 0000 60b0 	move.l 60b0 <ClsSprites+0x4>,4(a2)
    2124:	0004 
    2126:	2579 0000 60b4 	move.l 60b4 <ClsSprites+0x8>,8(a2)
    212c:	0008 
    212e:	2579 0000 60b8 	move.l 60b8 <ClsSprites+0xc>,12(a2)
    2134:	000c 
    2136:	2579 0000 60bc 	move.l 60bc <ClsSprites+0x10>,16(a2)
    213c:	0010 
    213e:	2579 0000 60c0 	move.l 60c0 <ClsSprites+0x14>,20(a2)
    2144:	0014 
    2146:	2579 0000 60c4 	move.l 60c4 <ClsSprites+0x18>,24(a2)
    214c:	0018 
    214e:	2579 0000 60c8 	move.l 60c8 <ClsSprites+0x1c>,28(a2)
    2154:	001c 
    2156:	2579 0000 60cc 	move.l 60cc <ClsSprites+0x20>,32(a2)
    215c:	0020 
    215e:	2579 0000 60d0 	move.l 60d0 <ClsSprites+0x24>,36(a2)
    2164:	0024 
    2166:	2579 0000 60d4 	move.l 60d4 <ClsSprites+0x28>,40(a2)
    216c:	0028 
    216e:	2579 0000 60d8 	move.l 60d8 <ClsSprites+0x2c>,44(a2)
    2174:	002c 
    2176:	2579 0000 60dc 	move.l 60dc <ClsSprites+0x30>,48(a2)
    217c:	0030 
    217e:	2579 0000 60e0 	move.l 60e0 <ClsSprites+0x34>,52(a2)
    2184:	0034 
    2186:	2579 0000 60e4 	move.l 60e4 <ClsSprites+0x38>,56(a2)
    218c:	0038 
    218e:	2579 0000 60e8 	move.l 60e8 <ClsSprites+0x3c>,60(a2)
    2194:	003c 
    *cl++ = *clpartinstruction++;
    2196:	2579 0000 607c 	move.l 607c <ClScreen>,64(a2)
    219c:	0040 
    219e:	2579 0000 6080 	move.l 6080 <ClScreen+0x4>,68(a2)
    21a4:	0044 
    21a6:	2579 0000 6084 	move.l 6084 <ClScreen+0x8>,72(a2)
    21ac:	0048 
    21ae:	2579 0000 6088 	move.l 6088 <ClScreen+0xc>,76(a2)
    21b4:	004c 
    21b6:	2579 0000 608c 	move.l 608c <ClScreen+0x10>,80(a2)
    21bc:	0050 
    21be:	2579 0000 6090 	move.l 6090 <ClScreen+0x14>,84(a2)
    21c4:	0054 
    21c6:	2579 0000 6094 	move.l 6094 <ClScreen+0x18>,88(a2)
    21cc:	0058 
    21ce:	2579 0000 6098 	move.l 6098 <ClScreen+0x1c>,92(a2)
    21d4:	005c 
    21d6:	2579 0000 609c 	move.l 609c <ClScreen+0x20>,96(a2)
    21dc:	0060 
    21de:	2579 0000 60a0 	move.l 60a0 <ClScreen+0x24>,100(a2)
    21e4:	0064 
    21e6:	2579 0000 60a4 	move.l 60a4 <ClScreen+0x28>,104(a2)
    21ec:	0068 
    21ee:	2579 0000 60a8 	move.l 60a8 <ClScreen+0x2c>,108(a2)
    21f4:	006c 
  *cl++ = 0x00e00000;
    21f6:	257c 00e0 0000 	move.l #14680064,112(a2)
    21fc:	0070 
  *cl++ = 0x00e20000;
    21fe:	257c 00e2 0000 	move.l #14811136,116(a2)
    2204:	0074 
    *cl++ = *clpartinstruction++;
    2206:	2579 0000 6074 	move.l 6074 <ClColor>,120(a2)
    220c:	0078 
    220e:	2579 0000 6078 	move.l 6078 <ClColor+0x4>,124(a2)
    2214:	007c 
  *cl = 0xfffffffe;
    2216:	70fe           	moveq #-2,d0
    2218:	2540 0080      	move.l d0,128(a2)
}
    221c:	200a           	move.l a2,d0
    221e:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2222:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2224:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    222a:	4eae ffc4      	jsr -60(a6)
    222e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2234:	2200           	move.l d0,d1
    2236:	243c 0000 3881 	move.l #14465,d2
    223c:	7628           	moveq #40,d3
    223e:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2242:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2248:	7201           	moveq #1,d1
    224a:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    224e:	24b9 0000 60ac 	move.l 60ac <ClsSprites>,(a2)
    2254:	2579 0000 60b0 	move.l 60b0 <ClsSprites+0x4>,4(a2)
    225a:	0004 
    225c:	2579 0000 60b4 	move.l 60b4 <ClsSprites+0x8>,8(a2)
    2262:	0008 
    2264:	2579 0000 60b8 	move.l 60b8 <ClsSprites+0xc>,12(a2)
    226a:	000c 
    226c:	2579 0000 60bc 	move.l 60bc <ClsSprites+0x10>,16(a2)
    2272:	0010 
    2274:	2579 0000 60c0 	move.l 60c0 <ClsSprites+0x14>,20(a2)
    227a:	0014 
    227c:	2579 0000 60c4 	move.l 60c4 <ClsSprites+0x18>,24(a2)
    2282:	0018 
    2284:	2579 0000 60c8 	move.l 60c8 <ClsSprites+0x1c>,28(a2)
    228a:	001c 
    228c:	2579 0000 60cc 	move.l 60cc <ClsSprites+0x20>,32(a2)
    2292:	0020 
    2294:	2579 0000 60d0 	move.l 60d0 <ClsSprites+0x24>,36(a2)
    229a:	0024 
    229c:	2579 0000 60d4 	move.l 60d4 <ClsSprites+0x28>,40(a2)
    22a2:	0028 
    22a4:	2579 0000 60d8 	move.l 60d8 <ClsSprites+0x2c>,44(a2)
    22aa:	002c 
    22ac:	2579 0000 60dc 	move.l 60dc <ClsSprites+0x30>,48(a2)
    22b2:	0030 
    22b4:	2579 0000 60e0 	move.l 60e0 <ClsSprites+0x34>,52(a2)
    22ba:	0034 
    22bc:	2579 0000 60e4 	move.l 60e4 <ClsSprites+0x38>,56(a2)
    22c2:	0038 
    22c4:	2579 0000 60e8 	move.l 60e8 <ClsSprites+0x3c>,60(a2)
    22ca:	003c 
    *cl++ = *clpartinstruction++;
    22cc:	2579 0000 607c 	move.l 607c <ClScreen>,64(a2)
    22d2:	0040 
    22d4:	2579 0000 6080 	move.l 6080 <ClScreen+0x4>,68(a2)
    22da:	0044 
    22dc:	2579 0000 6084 	move.l 6084 <ClScreen+0x8>,72(a2)
    22e2:	0048 
    22e4:	2579 0000 6088 	move.l 6088 <ClScreen+0xc>,76(a2)
    22ea:	004c 
    22ec:	2579 0000 608c 	move.l 608c <ClScreen+0x10>,80(a2)
    22f2:	0050 
    22f4:	2579 0000 6090 	move.l 6090 <ClScreen+0x14>,84(a2)
    22fa:	0054 
    22fc:	2579 0000 6094 	move.l 6094 <ClScreen+0x18>,88(a2)
    2302:	0058 
    2304:	2579 0000 6098 	move.l 6098 <ClScreen+0x1c>,92(a2)
    230a:	005c 
    230c:	2579 0000 609c 	move.l 609c <ClScreen+0x20>,96(a2)
    2312:	0060 
    2314:	2579 0000 60a0 	move.l 60a0 <ClScreen+0x24>,100(a2)
    231a:	0064 
    231c:	2579 0000 60a4 	move.l 60a4 <ClScreen+0x28>,104(a2)
    2322:	0068 
    2324:	2579 0000 60a8 	move.l 60a8 <ClScreen+0x2c>,108(a2)
    232a:	006c 
  *cl++ = 0x00e00000;
    232c:	257c 00e0 0000 	move.l #14680064,112(a2)
    2332:	0070 
  *cl++ = 0x00e20000;
    2334:	257c 00e2 0000 	move.l #14811136,116(a2)
    233a:	0074 
    *cl++ = *clpartinstruction++;
    233c:	2579 0000 6074 	move.l 6074 <ClColor>,120(a2)
    2342:	0078 
    2344:	2579 0000 6078 	move.l 6078 <ClColor+0x4>,124(a2)
    234a:	007c 
  *cl = 0xfffffffe;
    234c:	70fe           	moveq #-2,d0
    234e:	2540 0080      	move.l d0,128(a2)
}
    2352:	200a           	move.l a2,d0
    2354:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2358:	4e75           	rts

0000235a <Zoom_ZoomIntoPicture>:
void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr) {
    235a:	4fef ffec      	lea -20(sp),sp
    235e:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    2362:	202f 004c      	move.l 76(sp),d0
  UWORD nextzoom = 352-28 + (zoomnr << 3);
    2366:	3200           	move.w d0,d1
    2368:	e749           	lsl.w #3,d1
    236a:	0641 0144      	addi.w #324,d1
    236e:	3f41 0038      	move.w d1,56(sp)
    ZoomHorizontal = 16 - zoomnr * 6;
    2372:	3200           	move.w d0,d1
    2374:	d240           	add.w d0,d1
    2376:	3041           	movea.w d1,a0
    2378:	d0c0           	adda.w d0,a0
    237a:	d0c8           	adda.w a0,a0
    237c:	7410           	moveq #16,d2
    237e:	9448           	sub.w a0,d2
    2380:	3f42 003a      	move.w d2,58(sp)
        ZoomHorizontal = 16 - zoomnr + (zoomnr << 1);
    2384:	9240           	sub.w d0,d1
    2386:	3a41           	movea.w d1,a5
    2388:	4bed 0010      	lea 16(a5),a5
    238c:	262f 0044      	move.l 68(sp),d3
    2390:	0683 0000 01ac 	addi.l #428,d3
    2396:	2f43 0034      	move.l d3,52(sp)
    239a:	742c           	moveq #44,d2
    239c:	d4af 0048      	add.l 72(sp),d2
    23a0:	2f42 0030      	move.l d2,48(sp)
  UWORD startofword = 336;
    23a4:	3f7c 0150 002e 	move.w #336,46(sp)
  UWORD shiftright = 7;
    23aa:	3f7c 0007 002c 	move.w #7,44(sp)
      nextzoom -= (21 + zoomnr);
    23b0:	76eb           	moveq #-21,d3
    23b2:	9640           	sub.w d0,d3
    23b4:	3f43 003e      	move.w d3,62(sp)
    *bp = 0;
    23b8:	4278 0200      	clr.w 200 <main+0x1fa>
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*8-2-i;
    23bc:	242f 0034      	move.l 52(sp),d2
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    23c0:	246f 0030      	movea.l 48(sp),a2
    ZoomHorizontal = 16 - zoomnr * 6;
    23c4:	33ef 003a 0000 	move.w 58(sp),61a2 <ZoomHorizontal>
    23ca:	61a2 
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    23cc:	3a2f 002c      	move.w 44(sp),d5
    23d0:	700c           	moveq #12,d0
    23d2:	e16d           	lsl.w d0,d5
    23d4:	362f 0038      	move.w 56(sp),d3
    23d8:	b66f 002e      	cmp.w 46(sp),d3
    23dc:	6200 015e      	bhi.w 253c <Zoom_ZoomIntoPicture+0x1e2>
  hw->bltcon0 = 0x9f0 + shiftright;
    23e0:	0645 09f0      	addi.w #2544,d5
    23e4:	362f 003a      	move.w 58(sp),d3
    23e8:	7c10           	moveq #16,d6
    UWORD linesleft = 272;
    23ea:	383c 0110      	move.w #272,d4
        if( linesleft >= ZoomHorizontal+1) {
    23ee:	b843           	cmp.w d3,d4
    23f0:	6300 00b8      	bls.w 24aa <Zoom_ZoomIntoPicture+0x150>
          linesleft -= ZoomHorizontal;
    23f4:	9843           	sub.w d3,d4
  WaitBlit();
    23f6:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
    23fc:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    2400:	2079 0000 619a 	movea.l 619a <hw>,a0
    2406:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    240c:	3145 0040      	move.w d5,64(a0)
  hw->bltafwm = 0xffff;
    2410:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2416:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    241c:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    2422:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    2428:	2142 0050      	move.l d2,80(a0)
  hw->bltdpt = (UWORD *) destination;
    242c:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    2430:	ed4b           	lsl.w #6,d3
    2432:	5443           	addq.w #2,d3
    2434:	3143 0058      	move.w d3,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    2438:	7200           	moveq #0,d1
    243a:	3239 0000 61a2 	move.w 61a2 <ZoomHorizontal>,d1
    2440:	2001           	move.l d1,d0
    2442:	d081           	add.l d1,d0
    2444:	d081           	add.l d1,d0
    2446:	e988           	lsl.l #4,d0
    2448:	d480           	add.l d0,d2
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    244a:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    244c:	4a44           	tst.w d4
    244e:	6700 00c0      	beq.w 2510 <Zoom_ZoomIntoPicture+0x1b6>
  WaitBlit();
    2452:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
    2458:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    245c:	2079 0000 619a 	movea.l 619a <hw>,a0
    2462:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    2468:	3145 0040      	move.w d5,64(a0)
  hw->bltafwm = 0xffff;
    246c:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2472:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    2478:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    247e:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    2484:	2142 0050      	move.l d2,80(a0)
  hw->bltdpt = (UWORD *) destination;
    2488:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    248c:	317c 0042 0058 	move.w #66,88(a0)
          linesleft--;
    2492:	5344           	subq.w #1,d4
          pos4dest += ZMLINESIZE/2;
    2494:	45ea 0030      	lea 48(a2),a2
        ZoomHorizontal = 16 - zoomnr + (zoomnr << 1);
    2498:	33cd 0000 61a2 	move.w a5,61a2 <ZoomHorizontal>
    249e:	5386           	subq.l #1,d6
      for(int i=0;i<16;i++) {
    24a0:	6778           	beq.s 251a <Zoom_ZoomIntoPicture+0x1c0>
  UWORD shiftright = 7;
    24a2:	360d           	move.w a5,d3
        if( linesleft >= ZoomHorizontal+1) {
    24a4:	b843           	cmp.w d3,d4
    24a6:	6200 ff4c      	bhi.w 23f4 <Zoom_ZoomIntoPicture+0x9a>
          ZoomHorizontal = linesleft;
    24aa:	33c4 0000 61a2 	move.w d4,61a2 <ZoomHorizontal>
    24b0:	3604           	move.w d4,d3
          linesleft = 0;
    24b2:	4244           	clr.w d4
  WaitBlit();
    24b4:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
    24ba:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    24be:	2079 0000 619a 	movea.l 619a <hw>,a0
    24c4:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    24ca:	3145 0040      	move.w d5,64(a0)
  hw->bltafwm = 0xffff;
    24ce:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    24d4:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    24da:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    24e0:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    24e6:	2142 0050      	move.l d2,80(a0)
  hw->bltdpt = (UWORD *) destination;
    24ea:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    24ee:	ed4b           	lsl.w #6,d3
    24f0:	5443           	addq.w #2,d3
    24f2:	3143 0058      	move.w d3,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    24f6:	7200           	moveq #0,d1
    24f8:	3239 0000 61a2 	move.w 61a2 <ZoomHorizontal>,d1
    24fe:	2001           	move.l d1,d0
    2500:	d081           	add.l d1,d0
    2502:	d081           	add.l d1,d0
    2504:	e988           	lsl.l #4,d0
    2506:	d480           	add.l d0,d2
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    2508:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    250a:	4a44           	tst.w d4
    250c:	6600 ff44      	bne.w 2452 <Zoom_ZoomIntoPicture+0xf8>
        ZoomHorizontal = 16 - zoomnr + (zoomnr << 1);
    2510:	33cd 0000 61a2 	move.w a5,61a2 <ZoomHorizontal>
    2516:	5386           	subq.l #1,d6
      for(int i=0;i<16;i++) {
    2518:	6688           	bne.s 24a2 <Zoom_ZoomIntoPicture+0x148>
    startofword -= 16;
    251a:	066f fff0 002e 	addi.w #-16,46(sp)
    2520:	55af 0034      	subq.l #2,52(sp)
    2524:	55af 0030      	subq.l #2,48(sp)
  for(int i=0;i<22;i++) {
    2528:	0c6f fff0 002e 	cmpi.w #-16,46(sp)
    252e:	6600 fe88      	bne.w 23b8 <Zoom_ZoomIntoPicture+0x5e>
}
    2532:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    2536:	4fef 0014      	lea 20(sp),sp
    253a:	4e75           	rts
    253c:	3003           	move.w d3,d0
      UWORD colnr = nextzoom - startofword - 1; 
    253e:	5340           	subq.w #1,d0
    2540:	906f 002e      	sub.w 46(sp),d0
      nextzoom -= (21 + zoomnr);
    2544:	362f 003e      	move.w 62(sp),d3
    2548:	d76f 0038      	add.w d3,56(sp)
    shifta = (shift - 1) << 12;
    254c:	362f 002c      	move.w 44(sp),d3
    2550:	5343           	subq.w #1,d3
    2552:	3f43 003c      	move.w d3,60(sp)
    2556:	3203           	move.w d3,d1
    2558:	760c           	moveq #12,d3
    255a:	e769           	lsl.w d3,d1
  hw->bltcon0 = 0xde4 + shifta;
    255c:	387c f000      	movea.w #-4096,a4
    2560:	4a6f 002c      	tst.w 44(sp)
    2564:	6702           	beq.s 2568 <Zoom_ZoomIntoPicture+0x20e>
    2566:	3841           	movea.w d1,a4
    2568:	49ec 0de4      	lea 3556(a4),a4
        Zoom_ZoomBlit( pos4source, pos4dest, shiftright, colnr, ZoomHorizontal);
    256c:	0280 0000 ffff 	andi.l #65535,d0
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    2572:	7210           	moveq #16,d1
    2574:	9280           	sub.l d0,d1
    2576:	7600           	moveq #0,d3
    2578:	4643           	not.w d3
    257a:	e3ab           	lsl.l d1,d3
    257c:	2643           	movea.l d3,a3
    257e:	362f 003a      	move.w 58(sp),d3
    2582:	7c10           	moveq #16,d6
    UWORD linesleft = 272;
    2584:	383c 0110      	move.w #272,d4
        if( linesleft >= ZoomHorizontal+1) {
    2588:	b843           	cmp.w d3,d4
    258a:	6300 0086      	bls.w 2612 <Zoom_ZoomIntoPicture+0x2b8>
          linesleft -= ZoomHorizontal;
    258e:	9843           	sub.w d3,d4
    srca = source + 1;
    2590:	2e02           	move.l d2,d7
  if( shift == 0) {
    2592:	4a6f 002c      	tst.w 44(sp)
    2596:	6602           	bne.s 259a <Zoom_ZoomIntoPicture+0x240>
    srca = source + 1;
    2598:	5487           	addq.l #2,d7
  WaitBlit();
    259a:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
    25a0:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    25a4:	2079 0000 619a 	movea.l 619a <hw>,a0
    25aa:	3145 0042      	move.w d5,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    25ae:	314c 0040      	move.w a4,64(a0)
  hw->bltafwm = 0xffff;
    25b2:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    25b8:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    25be:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    25c4:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    25ca:	314b 0070      	move.w a3,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    25ce:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
    25d4:	2147 0050      	move.l d7,80(a0)
  hw->bltbpt = srcb;
    25d8:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = destination;
    25dc:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    25e0:	ed4b           	lsl.w #6,d3
    25e2:	5443           	addq.w #2,d3
    25e4:	3143 0058      	move.w d3,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    25e8:	7200           	moveq #0,d1
    25ea:	3239 0000 61a2 	move.w 61a2 <ZoomHorizontal>,d1
    25f0:	2001           	move.l d1,d0
    25f2:	d081           	add.l d1,d0
    25f4:	d081           	add.l d1,d0
    25f6:	e988           	lsl.l #4,d0
    25f8:	d480           	add.l d0,d2
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    25fa:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    25fc:	4a44           	tst.w d4
    25fe:	6620           	bne.s 2620 <Zoom_ZoomIntoPicture+0x2c6>
        ZoomHorizontal = 16 - zoomnr + (zoomnr << 1);
    2600:	33cd 0000 61a2 	move.w a5,61a2 <ZoomHorizontal>
    2606:	5386           	subq.l #1,d6
      for(int i=0;i<16;i++) {
    2608:	677c           	beq.s 2686 <Zoom_ZoomIntoPicture+0x32c>
    260a:	360d           	move.w a5,d3
        if( linesleft >= ZoomHorizontal+1) {
    260c:	b843           	cmp.w d3,d4
    260e:	6200 ff7e      	bhi.w 258e <Zoom_ZoomIntoPicture+0x234>
          ZoomHorizontal = linesleft;
    2612:	33c4 0000 61a2 	move.w d4,61a2 <ZoomHorizontal>
    2618:	3604           	move.w d4,d3
          linesleft = 0;
    261a:	4244           	clr.w d4
    261c:	6000 ff72      	bra.w 2590 <Zoom_ZoomIntoPicture+0x236>
    srca = source + 1;
    2620:	2602           	move.l d2,d3
  if( shift == 0) {
    2622:	4a6f 002c      	tst.w 44(sp)
    2626:	6602           	bne.s 262a <Zoom_ZoomIntoPicture+0x2d0>
    srca = source + 1;
    2628:	5483           	addq.l #2,d3
  WaitBlit();
    262a:	2c79 0000 619e 	movea.l 619e <GfxBase>,a6
    2630:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    2634:	2079 0000 619a 	movea.l 619a <hw>,a0
    263a:	3145 0042      	move.w d5,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    263e:	314c 0040      	move.w a4,64(a0)
  hw->bltafwm = 0xffff;
    2642:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2648:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    264e:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    2654:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    265a:	314b 0070      	move.w a3,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    265e:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
    2664:	2143 0050      	move.l d3,80(a0)
  hw->bltbpt = srcb;
    2668:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = destination;
    266c:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    2670:	317c 0042 0058 	move.w #66,88(a0)
          pos4dest += ZMLINESIZE/2;
    2676:	45ea 0030      	lea 48(a2),a2
          linesleft--;
    267a:	5344           	subq.w #1,d4
        ZoomHorizontal = 16 - zoomnr + (zoomnr << 1);
    267c:	33cd 0000 61a2 	move.w a5,61a2 <ZoomHorizontal>
    2682:	5386           	subq.l #1,d6
      for(int i=0;i<16;i++) {
    2684:	6684           	bne.s 260a <Zoom_ZoomIntoPicture+0x2b0>
    shifta = (shift - 1) << 12;
    2686:	3f6f 003c 002c 	move.w 60(sp),44(sp)
    startofword -= 16;
    268c:	066f fff0 002e 	addi.w #-16,46(sp)
    2692:	55af 0034      	subq.l #2,52(sp)
    2696:	55af 0030      	subq.l #2,48(sp)
  for(int i=0;i<22;i++) {
    269a:	0c6f fff0 002e 	cmpi.w #-16,46(sp)
    26a0:	6600 fd16      	bne.w 23b8 <Zoom_ZoomIntoPicture+0x5e>
    26a4:	6000 fe8c      	bra.w 2532 <Zoom_ZoomIntoPicture+0x1d8>

000026a8 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    26a8:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    26ac:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    26b2:	203c 0000 a48c 	move.l #42124,d0
    26b8:	7202           	moveq #2,d1
    26ba:	4eae ff3a      	jsr -198(a6)
    26be:	2440           	movea.l d0,a2
  if( retval == 0) {
    26c0:	4a80           	tst.l d0
    26c2:	6700 0160      	beq.w 2824 <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    26c6:	24b9 0000 60ac 	move.l 60ac <ClsSprites>,(a2)
    26cc:	2579 0000 60b0 	move.l 60b0 <ClsSprites+0x4>,4(a2)
    26d2:	0004 
    26d4:	2579 0000 60b4 	move.l 60b4 <ClsSprites+0x8>,8(a2)
    26da:	0008 
    26dc:	2579 0000 60b8 	move.l 60b8 <ClsSprites+0xc>,12(a2)
    26e2:	000c 
    26e4:	2579 0000 60bc 	move.l 60bc <ClsSprites+0x10>,16(a2)
    26ea:	0010 
    26ec:	2579 0000 60c0 	move.l 60c0 <ClsSprites+0x14>,20(a2)
    26f2:	0014 
    26f4:	2579 0000 60c4 	move.l 60c4 <ClsSprites+0x18>,24(a2)
    26fa:	0018 
    26fc:	2579 0000 60c8 	move.l 60c8 <ClsSprites+0x1c>,28(a2)
    2702:	001c 
    2704:	2579 0000 60cc 	move.l 60cc <ClsSprites+0x20>,32(a2)
    270a:	0020 
    270c:	2579 0000 60d0 	move.l 60d0 <ClsSprites+0x24>,36(a2)
    2712:	0024 
    2714:	2579 0000 60d4 	move.l 60d4 <ClsSprites+0x28>,40(a2)
    271a:	0028 
    271c:	2579 0000 60d8 	move.l 60d8 <ClsSprites+0x2c>,44(a2)
    2722:	002c 
    2724:	2579 0000 60dc 	move.l 60dc <ClsSprites+0x30>,48(a2)
    272a:	0030 
    272c:	2579 0000 60e0 	move.l 60e0 <ClsSprites+0x34>,52(a2)
    2732:	0034 
    2734:	2579 0000 60e4 	move.l 60e4 <ClsSprites+0x38>,56(a2)
    273a:	0038 
    273c:	2579 0000 60e8 	move.l 60e8 <ClsSprites+0x3c>,60(a2)
    2742:	003c 
    *cl++ = *clpartinstruction++;
    2744:	2579 0000 6044 	move.l 6044 <ClScreenZoom>,64(a2)
    274a:	0040 
    274c:	2579 0000 6048 	move.l 6048 <ClScreenZoom+0x4>,68(a2)
    2752:	0044 
    2754:	2579 0000 604c 	move.l 604c <ClScreenZoom+0x8>,72(a2)
    275a:	0048 
    275c:	2579 0000 6050 	move.l 6050 <ClScreenZoom+0xc>,76(a2)
    2762:	004c 
    2764:	2579 0000 6054 	move.l 6054 <ClScreenZoom+0x10>,80(a2)
    276a:	0050 
    276c:	2579 0000 6058 	move.l 6058 <ClScreenZoom+0x14>,84(a2)
    2772:	0054 
    2774:	2579 0000 605c 	move.l 605c <ClScreenZoom+0x18>,88(a2)
    277a:	0058 
    277c:	2579 0000 6060 	move.l 6060 <ClScreenZoom+0x1c>,92(a2)
    2782:	005c 
    2784:	2579 0000 6064 	move.l 6064 <ClScreenZoom+0x20>,96(a2)
    278a:	0060 
    278c:	2579 0000 6068 	move.l 6068 <ClScreenZoom+0x24>,100(a2)
    2792:	0064 
    2794:	2579 0000 606c 	move.l 606c <ClScreenZoom+0x28>,104(a2)
    279a:	0068 
    279c:	2579 0000 6070 	move.l 6070 <ClScreenZoom+0x2c>,108(a2)
    27a2:	006c 
  *cl++ = 0x00e00000;
    27a4:	257c 00e0 0000 	move.l #14680064,112(a2)
    27aa:	0070 
  *cl++ = 0x00e20000;
    27ac:	257c 00e2 0000 	move.l #14811136,116(a2)
    27b2:	0074 
  *cl++ = 0x00e40000;
    27b4:	257c 00e4 0000 	move.l #14942208,120(a2)
    27ba:	0078 
  *cl++ = 0x00e60000;
    27bc:	257c 00e6 0000 	move.l #15073280,124(a2)
    27c2:	007c 
    *cl++ = *clpartinstruction++;
    27c4:	2579 0000 6074 	move.l 6074 <ClColor>,128(a2)
    27ca:	0080 
    27cc:	2579 0000 6078 	move.l 6078 <ClColor+0x4>,132(a2)
    27d2:	0084 
    27d4:	43ea 012c      	lea 300(a2),a1
    27d8:	220a           	move.l a2,d1
    27da:	0681 0000 a52c 	addi.l #42284,d1
    27e0:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    27e6:	41e9 ff60      	lea -160(a1),a0
    27ea:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    27ee:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    27f4:	5088           	addq.l #8,a0
    27f6:	217c 0182 0f00 	move.l #25300736,-4(a0)
    27fc:	fffc 
    for(int i2=0;i2<20;i2++) {
    27fe:	b3c8           	cmpa.l a0,a1
    2800:	66ec           	bne.s 27ee <ClbuildZoom+0x146>
    2802:	43e8 00a4      	lea 164(a0),a1
    2806:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    280c:	b3c1           	cmpa.l d1,a1
    280e:	66d6           	bne.s 27e6 <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    2810:	203c 0000 a488 	move.l #42120,d0
    2816:	72fe           	moveq #-2,d1
    2818:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    281c:	200a           	move.l a2,d0
    281e:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2822:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2824:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    282a:	4eae ffc4      	jsr -60(a6)
    282e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2834:	2200           	move.l d0,d1
    2836:	243c 0000 3881 	move.l #14465,d2
    283c:	7628           	moveq #40,d3
    283e:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2842:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2848:	7201           	moveq #1,d1
    284a:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    284e:	24b9 0000 60ac 	move.l 60ac <ClsSprites>,(a2)
    2854:	2579 0000 60b0 	move.l 60b0 <ClsSprites+0x4>,4(a2)
    285a:	0004 
    285c:	2579 0000 60b4 	move.l 60b4 <ClsSprites+0x8>,8(a2)
    2862:	0008 
    2864:	2579 0000 60b8 	move.l 60b8 <ClsSprites+0xc>,12(a2)
    286a:	000c 
    286c:	2579 0000 60bc 	move.l 60bc <ClsSprites+0x10>,16(a2)
    2872:	0010 
    2874:	2579 0000 60c0 	move.l 60c0 <ClsSprites+0x14>,20(a2)
    287a:	0014 
    287c:	2579 0000 60c4 	move.l 60c4 <ClsSprites+0x18>,24(a2)
    2882:	0018 
    2884:	2579 0000 60c8 	move.l 60c8 <ClsSprites+0x1c>,28(a2)
    288a:	001c 
    288c:	2579 0000 60cc 	move.l 60cc <ClsSprites+0x20>,32(a2)
    2892:	0020 
    2894:	2579 0000 60d0 	move.l 60d0 <ClsSprites+0x24>,36(a2)
    289a:	0024 
    289c:	2579 0000 60d4 	move.l 60d4 <ClsSprites+0x28>,40(a2)
    28a2:	0028 
    28a4:	2579 0000 60d8 	move.l 60d8 <ClsSprites+0x2c>,44(a2)
    28aa:	002c 
    28ac:	2579 0000 60dc 	move.l 60dc <ClsSprites+0x30>,48(a2)
    28b2:	0030 
    28b4:	2579 0000 60e0 	move.l 60e0 <ClsSprites+0x34>,52(a2)
    28ba:	0034 
    28bc:	2579 0000 60e4 	move.l 60e4 <ClsSprites+0x38>,56(a2)
    28c2:	0038 
    28c4:	2579 0000 60e8 	move.l 60e8 <ClsSprites+0x3c>,60(a2)
    28ca:	003c 
    *cl++ = *clpartinstruction++;
    28cc:	2579 0000 6044 	move.l 6044 <ClScreenZoom>,64(a2)
    28d2:	0040 
    28d4:	2579 0000 6048 	move.l 6048 <ClScreenZoom+0x4>,68(a2)
    28da:	0044 
    28dc:	2579 0000 604c 	move.l 604c <ClScreenZoom+0x8>,72(a2)
    28e2:	0048 
    28e4:	2579 0000 6050 	move.l 6050 <ClScreenZoom+0xc>,76(a2)
    28ea:	004c 
    28ec:	2579 0000 6054 	move.l 6054 <ClScreenZoom+0x10>,80(a2)
    28f2:	0050 
    28f4:	2579 0000 6058 	move.l 6058 <ClScreenZoom+0x14>,84(a2)
    28fa:	0054 
    28fc:	2579 0000 605c 	move.l 605c <ClScreenZoom+0x18>,88(a2)
    2902:	0058 
    2904:	2579 0000 6060 	move.l 6060 <ClScreenZoom+0x1c>,92(a2)
    290a:	005c 
    290c:	2579 0000 6064 	move.l 6064 <ClScreenZoom+0x20>,96(a2)
    2912:	0060 
    2914:	2579 0000 6068 	move.l 6068 <ClScreenZoom+0x24>,100(a2)
    291a:	0064 
    291c:	2579 0000 606c 	move.l 606c <ClScreenZoom+0x28>,104(a2)
    2922:	0068 
    2924:	2579 0000 6070 	move.l 6070 <ClScreenZoom+0x2c>,108(a2)
    292a:	006c 
  *cl++ = 0x00e00000;
    292c:	257c 00e0 0000 	move.l #14680064,112(a2)
    2932:	0070 
  *cl++ = 0x00e20000;
    2934:	257c 00e2 0000 	move.l #14811136,116(a2)
    293a:	0074 
  *cl++ = 0x00e40000;
    293c:	257c 00e4 0000 	move.l #14942208,120(a2)
    2942:	0078 
  *cl++ = 0x00e60000;
    2944:	257c 00e6 0000 	move.l #15073280,124(a2)
    294a:	007c 
    *cl++ = *clpartinstruction++;
    294c:	2579 0000 6074 	move.l 6074 <ClColor>,128(a2)
    2952:	0080 
    2954:	2579 0000 6078 	move.l 6078 <ClColor+0x4>,132(a2)
    295a:	0084 
    295c:	43ea 012c      	lea 300(a2),a1
    2960:	220a           	move.l a2,d1
    2962:	0681 0000 a52c 	addi.l #42284,d1
    2968:	203c 2c07 fffe 	move.l #738721790,d0
    296e:	6000 fe76      	bra.w 27e6 <ClbuildZoom+0x13e>

00002972 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    2972:	2039 0000 61b0 	move.l 61b0 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    2978:	23f9 0000 61a4 	move.l 61a4 <ViewCopper>,61b0 <DrawCopper>
    297e:	0000 61b0 
  ViewCopper = (ULONG *)tmp;
    2982:	23c0 0000 61a4 	move.l d0,61a4 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    2988:	2079 0000 619a 	movea.l 619a <hw>,a0
    298e:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    2992:	3140 0088      	move.w d0,136(a0)
}
    2996:	4e75           	rts

00002998 <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    2998:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    299c:	45fa fd0a      	lea 26a8 <ClbuildZoom>(pc),a2
    29a0:	4e92           	jsr (a2)
    29a2:	23c0 0000 61c0 	move.l d0,61c0 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    29a8:	4e92           	jsr (a2)
    29aa:	23c0 0000 61bc 	move.l d0,61bc <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    29b0:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    29b6:	203c 0001 6800 	move.l #92160,d0
    29bc:	7202           	moveq #2,d1
    29be:	4eae ff3a      	jsr -198(a6)
    29c2:	23c0 0000 61b8 	move.l d0,61b8 <Bitplane1>
  if(Bitplane1 == 0) {
    29c8:	6700 014e      	beq.w 2b18 <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    29cc:	23c0 0000 61b4 	move.l d0,61b4 <DrawBuffer>
  DrawCopper = Copperlist1;
    29d2:	23f9 0000 61c0 	move.l 61c0 <Copperlist1>,61b0 <DrawCopper>
    29d8:	0000 61b0 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    29dc:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    29e2:	203c 0001 6800 	move.l #92160,d0
    29e8:	7202           	moveq #2,d1
    29ea:	4eae ff3a      	jsr -198(a6)
    29ee:	2400           	move.l d0,d2
    29f0:	23c0 0000 61ac 	move.l d0,61ac <Bitplane2>
  if(Bitplane2 == 0) {
    29f6:	6778           	beq.s 2a70 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    29f8:	23f9 0000 61bc 	move.l 61bc <Copperlist2>,61a4 <ViewCopper>
    29fe:	0000 61a4 
  SwapCl();
    2a02:	45fa ff6e      	lea 2972 <SwapCl>(pc),a2
    2a06:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    2a08:	2039 0000 61b4 	move.l 61b4 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2a0e:	2079 0000 61b0 	movea.l 61b0 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2a14:	2200           	move.l d0,d1
    2a16:	4241           	clr.w d1
    2a18:	4841           	swap d1
    2a1a:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    2a1e:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    2a22:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2a28:	2200           	move.l d0,d1
    2a2a:	4241           	clr.w d1
    2a2c:	4841           	swap d1
    2a2e:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2a32:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    2a36:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    2a38:	2079 0000 61b0 	movea.l 61b0 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2a3e:	2002           	move.l d2,d0
    2a40:	4240           	clr.w d0
    2a42:	4840           	swap d0
    2a44:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    2a48:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    2a4c:	2002           	move.l d2,d0
    2a4e:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2a54:	2200           	move.l d0,d1
    2a56:	4241           	clr.w d1
    2a58:	4841           	swap d1
    2a5a:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2a5e:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    2a62:	23c2 0000 61a8 	move.l d2,61a8 <ViewBuffer>
}
    2a68:	7000           	moveq #0,d0
    2a6a:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2a6e:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2a70:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2a76:	4eae ffc4      	jsr -60(a6)
    2a7a:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2a80:	2200           	move.l d0,d1
    2a82:	243c 0000 38ce 	move.l #14542,d2
    2a88:	7626           	moveq #38,d3
    2a8a:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2a8e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2a94:	7201           	moveq #1,d1
    2a96:	4eae ff70      	jsr -144(a6)
    2a9a:	2439 0000 61ac 	move.l 61ac <Bitplane2>,d2
  ViewCopper = Copperlist2;
    2aa0:	23f9 0000 61bc 	move.l 61bc <Copperlist2>,61a4 <ViewCopper>
    2aa6:	0000 61a4 
  SwapCl();
    2aaa:	45fa fec6      	lea 2972 <SwapCl>(pc),a2
    2aae:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    2ab0:	2039 0000 61b4 	move.l 61b4 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2ab6:	2079 0000 61b0 	movea.l 61b0 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2abc:	2200           	move.l d0,d1
    2abe:	4241           	clr.w d1
    2ac0:	4841           	swap d1
    2ac2:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    2ac6:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    2aca:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2ad0:	2200           	move.l d0,d1
    2ad2:	4241           	clr.w d1
    2ad4:	4841           	swap d1
    2ad6:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2ada:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    2ade:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    2ae0:	2079 0000 61b0 	movea.l 61b0 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2ae6:	2002           	move.l d2,d0
    2ae8:	4240           	clr.w d0
    2aea:	4840           	swap d0
    2aec:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    2af0:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    2af4:	2002           	move.l d2,d0
    2af6:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2afc:	2200           	move.l d0,d1
    2afe:	4241           	clr.w d1
    2b00:	4841           	swap d1
    2b02:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2b06:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    2b0a:	23c2 0000 61a8 	move.l d2,61a8 <ViewBuffer>
}
    2b10:	7000           	moveq #0,d0
    2b12:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2b16:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2b18:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2b1e:	4eae ffc4      	jsr -60(a6)
    2b22:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2b28:	2200           	move.l d0,d1
    2b2a:	243c 0000 38a7 	move.l #14503,d2
    2b30:	7626           	moveq #38,d3
    2b32:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2b36:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2b3c:	7201           	moveq #1,d1
    2b3e:	4eae ff70      	jsr -144(a6)
    2b42:	2039 0000 61b8 	move.l 61b8 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    2b48:	23c0 0000 61b4 	move.l d0,61b4 <DrawBuffer>
  DrawCopper = Copperlist1;
    2b4e:	23f9 0000 61c0 	move.l 61c0 <Copperlist1>,61b0 <DrawCopper>
    2b54:	0000 61b0 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2b58:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    2b5e:	203c 0001 6800 	move.l #92160,d0
    2b64:	7202           	moveq #2,d1
    2b66:	4eae ff3a      	jsr -198(a6)
    2b6a:	2400           	move.l d0,d2
    2b6c:	23c0 0000 61ac 	move.l d0,61ac <Bitplane2>
  if(Bitplane2 == 0) {
    2b72:	6600 fe84      	bne.w 29f8 <PrepareDisplayZoom+0x60>
    2b76:	6000 fef8      	bra.w 2a70 <PrepareDisplayZoom+0xd8>

00002b7a <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2b7a:	2039 0000 61b4 	move.l 61b4 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2b80:	2079 0000 61b0 	movea.l 61b0 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    2b86:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2b8a:	2200           	move.l d0,d1
    2b8c:	4241           	clr.w d1
    2b8e:	4841           	swap d1
    2b90:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    2b94:	23f9 0000 61a8 	move.l 61a8 <ViewBuffer>,61b4 <DrawBuffer>
    2b9a:	0000 61b4 
  ViewBuffer = (ULONG *) tmp;
    2b9e:	23c0 0000 61a8 	move.l d0,61a8 <ViewBuffer>
}
    2ba4:	4e75           	rts

00002ba6 <PrepareDisplay>:
 int PrepareDisplaySW() {
    2ba6:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    2baa:	45fa f550      	lea 20fc <ClBuild>(pc),a2
    2bae:	4e92           	jsr (a2)
    2bb0:	23c0 0000 61c0 	move.l d0,61c0 <Copperlist1>
  Copperlist2 = ClbuildSW();
    2bb6:	4e92           	jsr (a2)
    2bb8:	23c0 0000 61bc 	move.l d0,61bc <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2bbe:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    2bc4:	203c 0000 c800 	move.l #51200,d0
    2bca:	7202           	moveq #2,d1
    2bcc:	4eae ff3a      	jsr -198(a6)
    2bd0:	23c0 0000 61b8 	move.l d0,61b8 <Bitplane1>
  if(Bitplane1 == 0) {
    2bd6:	6700 00ac      	beq.w 2c84 <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    2bda:	23c0 0000 61b4 	move.l d0,61b4 <DrawBuffer>
  DrawCopper = Copperlist1;
    2be0:	23f9 0000 61c0 	move.l 61c0 <Copperlist1>,61b0 <DrawCopper>
    2be6:	0000 61b0 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2bea:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    2bf0:	203c 0000 c800 	move.l #51200,d0
    2bf6:	7202           	moveq #2,d1
    2bf8:	4eae ff3a      	jsr -198(a6)
    2bfc:	23c0 0000 61ac 	move.l d0,61ac <Bitplane2>
  if(Bitplane2 == 0) {
    2c02:	6728           	beq.s 2c2c <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    2c04:	23c0 0000 61a8 	move.l d0,61a8 <ViewBuffer>
  ViewCopper = Copperlist2;
    2c0a:	23f9 0000 61bc 	move.l 61bc <Copperlist2>,61a4 <ViewCopper>
    2c10:	0000 61a4 
  SwapCl();
    2c14:	47fa fd5c      	lea 2972 <SwapCl>(pc),a3
    2c18:	4e93           	jsr (a3)
  SetBplPointers();
    2c1a:	45fa ff5e      	lea 2b7a <SetBplPointers>(pc),a2
    2c1e:	4e92           	jsr (a2)
  SwapCl();
    2c20:	4e93           	jsr (a3)
  SetBplPointers();
    2c22:	4e92           	jsr (a2)
}
    2c24:	7000           	moveq #0,d0
    2c26:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    2c2a:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2c2c:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2c32:	4eae ffc4      	jsr -60(a6)
    2c36:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2c3c:	2200           	move.l d0,d1
    2c3e:	243c 0000 38ce 	move.l #14542,d2
    2c44:	7626           	moveq #38,d3
    2c46:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2c4a:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2c50:	7201           	moveq #1,d1
    2c52:	4eae ff70      	jsr -144(a6)
    2c56:	2039 0000 61ac 	move.l 61ac <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    2c5c:	23c0 0000 61a8 	move.l d0,61a8 <ViewBuffer>
  ViewCopper = Copperlist2;
    2c62:	23f9 0000 61bc 	move.l 61bc <Copperlist2>,61a4 <ViewCopper>
    2c68:	0000 61a4 
  SwapCl();
    2c6c:	47fa fd04      	lea 2972 <SwapCl>(pc),a3
    2c70:	4e93           	jsr (a3)
  SetBplPointers();
    2c72:	45fa ff06      	lea 2b7a <SetBplPointers>(pc),a2
    2c76:	4e92           	jsr (a2)
  SwapCl();
    2c78:	4e93           	jsr (a3)
  SetBplPointers();
    2c7a:	4e92           	jsr (a2)
}
    2c7c:	7000           	moveq #0,d0
    2c7e:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    2c82:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2c84:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2c8a:	4eae ffc4      	jsr -60(a6)
    2c8e:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2c94:	2200           	move.l d0,d1
    2c96:	243c 0000 38a7 	move.l #14503,d2
    2c9c:	7626           	moveq #38,d3
    2c9e:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2ca2:	2c79 0000 61c4 	movea.l 61c4 <DOSBase>,a6
    2ca8:	7201           	moveq #1,d1
    2caa:	4eae ff70      	jsr -144(a6)
    2cae:	2039 0000 61b8 	move.l 61b8 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    2cb4:	23c0 0000 61b4 	move.l d0,61b4 <DrawBuffer>
  DrawCopper = Copperlist1;
    2cba:	23f9 0000 61c0 	move.l 61c0 <Copperlist1>,61b0 <DrawCopper>
    2cc0:	0000 61b0 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2cc4:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    2cca:	203c 0000 c800 	move.l #51200,d0
    2cd0:	7202           	moveq #2,d1
    2cd2:	4eae ff3a      	jsr -198(a6)
    2cd6:	23c0 0000 61ac 	move.l d0,61ac <Bitplane2>
  if(Bitplane2 == 0) {
    2cdc:	6600 ff26      	bne.w 2c04 <PrepareDisplay+0x5e>
    2ce0:	6000 ff4a      	bra.w 2c2c <PrepareDisplay+0x86>

00002ce4 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    2ce4:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    2ce8:	262f 0010      	move.l 16(sp),d3
    2cec:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    2cf0:	2279 0000 61c0 	movea.l 61c0 <Copperlist1>,a1
    2cf6:	b2fc 0000      	cmpa.w #0,a1
    2cfa:	670c           	beq.s 2d08 <FreeDisplay+0x24>
    2cfc:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    2d02:	2003           	move.l d3,d0
    2d04:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    2d08:	2279 0000 61bc 	movea.l 61bc <Copperlist2>,a1
    2d0e:	b2fc 0000      	cmpa.w #0,a1
    2d12:	670c           	beq.s 2d20 <FreeDisplay+0x3c>
    2d14:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    2d1a:	2003           	move.l d3,d0
    2d1c:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    2d20:	2279 0000 61b8 	movea.l 61b8 <Bitplane1>,a1
    2d26:	b2fc 0000      	cmpa.w #0,a1
    2d2a:	670c           	beq.s 2d38 <FreeDisplay+0x54>
    2d2c:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    2d32:	2002           	move.l d2,d0
    2d34:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    2d38:	2279 0000 61ac 	movea.l 61ac <Bitplane2>,a1
    2d3e:	b2fc 0000      	cmpa.w #0,a1
    2d42:	670c           	beq.s 2d50 <FreeDisplay+0x6c>
    2d44:	2c79 0000 61c8 	movea.l 61c8 <SysBase>,a6
    2d4a:	2002           	move.l d2,d0
    2d4c:	4eae ff2e      	jsr -210(a6)
}
    2d50:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2d54:	4e75           	rts

00002d56 <WaitVbl>:
void WaitVbl() {
    2d56:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    2d58:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddbf08>,d0
    2d5e:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    2d60:	2017           	move.l (sp),d0
    2d62:	0280 0001 ff00 	andi.l #130816,d0
    2d68:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    2d6a:	2017           	move.l (sp),d0
    2d6c:	0c80 0001 3700 	cmpi.l #79616,d0
    2d72:	67e4           	beq.s 2d58 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    2d74:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddbf08>,d0
    2d7a:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    2d7e:	202f 0004      	move.l 4(sp),d0
    2d82:	0280 0001 ff00 	andi.l #130816,d0
    2d88:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    2d8c:	202f 0004      	move.l 4(sp),d0
    2d90:	0c80 0001 3700 	cmpi.l #79616,d0
    2d96:	66dc           	bne.s 2d74 <WaitVbl+0x1e>
}
    2d98:	508f           	addq.l #8,sp
    2d9a:	4e75           	rts

00002d9c <memcpy>:
{
    2d9c:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    2da0:	202f 0014      	move.l 20(sp),d0
    2da4:	226f 0018      	movea.l 24(sp),a1
    2da8:	222f 001c      	move.l 28(sp),d1
	while(len--)
    2dac:	2601           	move.l d1,d3
    2dae:	5383           	subq.l #1,d3
    2db0:	4a81           	tst.l d1
    2db2:	6762           	beq.s 2e16 <memcpy+0x7a>
    2db4:	2040           	movea.l d0,a0
    2db6:	5888           	addq.l #4,a0
    2db8:	b1c9           	cmpa.l a1,a0
    2dba:	53c2           	sl.s d2
    2dbc:	4402           	neg.b d2
    2dbe:	41e9 0004      	lea 4(a1),a0
    2dc2:	b1c0           	cmpa.l d0,a0
    2dc4:	53c4           	sl.s d4
    2dc6:	4404           	neg.b d4
    2dc8:	8404           	or.b d4,d2
    2dca:	7808           	moveq #8,d4
    2dcc:	b883           	cmp.l d3,d4
    2dce:	55c4           	sc.s d4
    2dd0:	4404           	neg.b d4
    2dd2:	c404           	and.b d4,d2
    2dd4:	6746           	beq.s 2e1c <memcpy+0x80>
    2dd6:	2409           	move.l a1,d2
    2dd8:	8480           	or.l d0,d2
    2dda:	7803           	moveq #3,d4
    2ddc:	c484           	and.l d4,d2
    2dde:	663c           	bne.s 2e1c <memcpy+0x80>
    2de0:	2049           	movea.l a1,a0
    2de2:	2440           	movea.l d0,a2
    2de4:	74fc           	moveq #-4,d2
    2de6:	c481           	and.l d1,d2
    2de8:	d489           	add.l a1,d2
		*d++ = *s++;
    2dea:	24d8           	move.l (a0)+,(a2)+
    2dec:	b488           	cmp.l a0,d2
    2dee:	66fa           	bne.s 2dea <memcpy+0x4e>
    2df0:	74fc           	moveq #-4,d2
    2df2:	c481           	and.l d1,d2
    2df4:	2040           	movea.l d0,a0
    2df6:	d1c2           	adda.l d2,a0
    2df8:	d3c2           	adda.l d2,a1
    2dfa:	9682           	sub.l d2,d3
    2dfc:	b481           	cmp.l d1,d2
    2dfe:	6716           	beq.s 2e16 <memcpy+0x7a>
    2e00:	1091           	move.b (a1),(a0)
	while(len--)
    2e02:	4a83           	tst.l d3
    2e04:	6710           	beq.s 2e16 <memcpy+0x7a>
		*d++ = *s++;
    2e06:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    2e0c:	5383           	subq.l #1,d3
    2e0e:	6706           	beq.s 2e16 <memcpy+0x7a>
		*d++ = *s++;
    2e10:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    2e16:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    2e1a:	4e75           	rts
    2e1c:	2040           	movea.l d0,a0
    2e1e:	d289           	add.l a1,d1
		*d++ = *s++;
    2e20:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    2e22:	b289           	cmp.l a1,d1
    2e24:	67f0           	beq.s 2e16 <memcpy+0x7a>
		*d++ = *s++;
    2e26:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    2e28:	b289           	cmp.l a1,d1
    2e2a:	66f4           	bne.s 2e20 <memcpy+0x84>
    2e2c:	60e8           	bra.s 2e16 <memcpy+0x7a>

00002e2e <memset>:
{
    2e2e:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    2e32:	202f 0024      	move.l 36(sp),d0
    2e36:	2a2f 0028      	move.l 40(sp),d5
    2e3a:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    2e3e:	2809           	move.l a1,d4
    2e40:	5384           	subq.l #1,d4
    2e42:	b2fc 0000      	cmpa.w #0,a1
    2e46:	6f00 00b0      	ble.w 2ef8 <memset+0xca>
    2e4a:	1e05           	move.b d5,d7
    2e4c:	2200           	move.l d0,d1
    2e4e:	4481           	neg.l d1
    2e50:	7403           	moveq #3,d2
    2e52:	c282           	and.l d2,d1
    2e54:	7c05           	moveq #5,d6
		*ptr++ = val;
    2e56:	2440           	movea.l d0,a2
    2e58:	bc84           	cmp.l d4,d6
    2e5a:	646a           	bcc.s 2ec6 <memset+0x98>
    2e5c:	4a81           	tst.l d1
    2e5e:	6724           	beq.s 2e84 <memset+0x56>
    2e60:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    2e62:	5384           	subq.l #1,d4
    2e64:	7401           	moveq #1,d2
    2e66:	b481           	cmp.l d1,d2
    2e68:	671a           	beq.s 2e84 <memset+0x56>
		*ptr++ = val;
    2e6a:	2440           	movea.l d0,a2
    2e6c:	548a           	addq.l #2,a2
    2e6e:	2040           	movea.l d0,a0
    2e70:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    2e74:	5384           	subq.l #1,d4
    2e76:	7403           	moveq #3,d2
    2e78:	b481           	cmp.l d1,d2
    2e7a:	6608           	bne.s 2e84 <memset+0x56>
		*ptr++ = val;
    2e7c:	528a           	addq.l #1,a2
    2e7e:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    2e82:	5384           	subq.l #1,d4
    2e84:	2609           	move.l a1,d3
    2e86:	9681           	sub.l d1,d3
    2e88:	7c00           	moveq #0,d6
    2e8a:	1c05           	move.b d5,d6
    2e8c:	2406           	move.l d6,d2
    2e8e:	4842           	swap d2
    2e90:	4242           	clr.w d2
    2e92:	2042           	movea.l d2,a0
    2e94:	2406           	move.l d6,d2
    2e96:	e14a           	lsl.w #8,d2
    2e98:	4842           	swap d2
    2e9a:	4242           	clr.w d2
    2e9c:	e18e           	lsl.l #8,d6
    2e9e:	2646           	movea.l d6,a3
    2ea0:	2c08           	move.l a0,d6
    2ea2:	8486           	or.l d6,d2
    2ea4:	2c0b           	move.l a3,d6
    2ea6:	8486           	or.l d6,d2
    2ea8:	1407           	move.b d7,d2
    2eaa:	2040           	movea.l d0,a0
    2eac:	d1c1           	adda.l d1,a0
    2eae:	72fc           	moveq #-4,d1
    2eb0:	c283           	and.l d3,d1
    2eb2:	d288           	add.l a0,d1
		*ptr++ = val;
    2eb4:	20c2           	move.l d2,(a0)+
    2eb6:	b1c1           	cmpa.l d1,a0
    2eb8:	66fa           	bne.s 2eb4 <memset+0x86>
    2eba:	72fc           	moveq #-4,d1
    2ebc:	c283           	and.l d3,d1
    2ebe:	d5c1           	adda.l d1,a2
    2ec0:	9881           	sub.l d1,d4
    2ec2:	b283           	cmp.l d3,d1
    2ec4:	6732           	beq.s 2ef8 <memset+0xca>
    2ec6:	1485           	move.b d5,(a2)
	while(len-- > 0)
    2ec8:	4a84           	tst.l d4
    2eca:	6f2c           	ble.s 2ef8 <memset+0xca>
		*ptr++ = val;
    2ecc:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    2ed0:	7201           	moveq #1,d1
    2ed2:	b284           	cmp.l d4,d1
    2ed4:	6c22           	bge.s 2ef8 <memset+0xca>
		*ptr++ = val;
    2ed6:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    2eda:	7402           	moveq #2,d2
    2edc:	b484           	cmp.l d4,d2
    2ede:	6c18           	bge.s 2ef8 <memset+0xca>
		*ptr++ = val;
    2ee0:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    2ee4:	7c03           	moveq #3,d6
    2ee6:	bc84           	cmp.l d4,d6
    2ee8:	6c0e           	bge.s 2ef8 <memset+0xca>
		*ptr++ = val;
    2eea:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    2eee:	7204           	moveq #4,d1
    2ef0:	b284           	cmp.l d4,d1
    2ef2:	6c04           	bge.s 2ef8 <memset+0xca>
		*ptr++ = val;
    2ef4:	1545 0005      	move.b d5,5(a2)
}
    2ef8:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    2efc:	4e75           	rts

00002efe <strlen>:
{
    2efe:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    2f02:	7000           	moveq #0,d0
	while(*s++)
    2f04:	4a10           	tst.b (a0)
    2f06:	6708           	beq.s 2f10 <strlen+0x12>
		t++;
    2f08:	5280           	addq.l #1,d0
	while(*s++)
    2f0a:	4a30 0800      	tst.b (0,a0,d0.l)
    2f0e:	66f8           	bne.s 2f08 <strlen+0xa>
}
    2f10:	4e75           	rts
    2f12:	4e71           	nop

00002f14 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    2f14:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    2f18:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    2f1c:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    2f20:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    2f24:	d041           	add.w d1,d0
	swap	d0
    2f26:	4840           	swap d0
	clrw	d0
    2f28:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    2f2a:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    2f2e:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    2f32:	d081           	add.l d1,d0

	rts
    2f34:	4e75           	rts

00002f36 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    2f36:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    2f38:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    2f3c:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    2f40:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    2f46:	6416           	bcc.s 2f5e <__udivsi3+0x28>
	movel	d0, d2
    2f48:	2400           	move.l d0,d2
	clrw	d2
    2f4a:	4242           	clr.w d2
	swap	d2
    2f4c:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    2f4e:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    2f50:	3002           	move.w d2,d0
	swap	d0
    2f52:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    2f54:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    2f58:	84c1           	divu.w d1,d2
	movew	d2, d0
    2f5a:	3002           	move.w d2,d0
	jra	6f
    2f5c:	6030           	bra.s 2f8e <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    2f5e:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    2f60:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    2f62:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    2f64:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    2f6a:	64f4           	bcc.s 2f60 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    2f6c:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    2f6e:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    2f74:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    2f76:	c2c0           	mulu.w d0,d1
	swap	d2
    2f78:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    2f7a:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    2f7c:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    2f7e:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    2f80:	660a           	bne.s 2f8c <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    2f82:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    2f84:	6506           	bcs.s 2f8c <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    2f86:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    2f8a:	6302           	bls.s 2f8e <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    2f8c:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    2f8e:	241f           	move.l (sp)+,d2
	rts
    2f90:	4e75           	rts

00002f92 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    2f92:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    2f94:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    2f96:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    2f9a:	6a04           	bpl.s 2fa0 <__divsi3+0xe>
	negl	d1
    2f9c:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    2f9e:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    2fa0:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    2fa4:	6a04           	bpl.s 2faa <__divsi3+0x18>
	negl	d0
    2fa6:	4480           	neg.l d0
	negb	d2
    2fa8:	4402           	neg.b d2

2:	movel	d1, sp@-
    2faa:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2fac:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    2fae:	6186           	bsr.s 2f36 <__udivsi3>
	addql	IMM (8), sp
    2fb0:	508f           	addq.l #8,sp

	tstb	d2
    2fb2:	4a02           	tst.b d2
	jpl	3f
    2fb4:	6a02           	bpl.s 2fb8 <__divsi3+0x26>
	negl	d0
    2fb6:	4480           	neg.l d0

3:	movel	sp@+, d2
    2fb8:	241f           	move.l (sp)+,d2
	rts
    2fba:	4e75           	rts

00002fbc <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    2fbc:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    2fc0:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    2fc4:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2fc6:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    2fc8:	61c8           	bsr.s 2f92 <__divsi3>
	addql	IMM (8), sp
    2fca:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    2fcc:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    2fd0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2fd2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    2fd4:	6100 ff3e      	bsr.w 2f14 <__mulsi3>
	addql	IMM (8), sp
    2fd8:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    2fda:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    2fde:	9280           	sub.l d0,d1
	movel	d1, d0
    2fe0:	2001           	move.l d1,d0
	rts
    2fe2:	4e75           	rts

00002fe4 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    2fe4:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    2fe8:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    2fec:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2fee:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    2ff0:	6100 ff44      	bsr.w 2f36 <__udivsi3>
	addql	IMM (8), sp
    2ff4:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    2ff6:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    2ffa:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2ffc:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    2ffe:	6100 ff14      	bsr.w 2f14 <__mulsi3>
	addql	IMM (8), sp
    3002:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    3004:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    3008:	9280           	sub.l d0,d1
	movel	d1, d0
    300a:	2001           	move.l d1,d0
	rts
    300c:	4e75           	rts

0000300e <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    300e:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    3010:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    3014:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    3018:	2c5f           	movea.l (sp)+,a6
    rts
    301a:	4e75           	rts

0000301c <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    301c:	16c0           	move.b d0,(a3)+
	rts
    301e:	4e75           	rts

00003020 <saveregs>:
	...

0000305c <font2distance>:
    305c:	0505           	btst d2,d5
    305e:	0505           	btst d2,d5
    3060:	0505           	btst d2,d5
    3062:	0505           	btst d2,d5
    3064:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    3066:	0505           	btst d2,d5
    3068:	0505           	btst d2,d5
    306a:	0005 0505      	ori.b #5,d5
    306e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    3070:	0505           	btst d2,d5
    3072:	0505           	btst d2,d5
    3074:	0505           	btst d2,d5
    3076:	0505           	btst d2,d5
    3078:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    307a:	0505           	btst d2,d5
    307c:	0505           	btst d2,d5
    307e:	0505           	btst d2,d5
    3080:	0505           	btst d2,d5
    3082:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    3084:	0500           	btst d2,d0
    3086:	0505           	btst d2,d5
    3088:	0505           	btst d2,d5
    308a:	0505           	btst d2,d5
    308c:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    308e:	0505           	btst d2,d5
    3090:	0505           	btst d2,d5
    3092:	0505           	btst d2,d5
    3094:	0505           	btst d2,d5
    3096:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    3098:	0505           	btst d2,d5
    309a:	0505           	btst d2,d5
    309c:	0503           	btst d2,d3
    309e:	0505           	btst d2,d5
    30a0:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    30a2:	0505           	btst d2,d5
    30a4:	0500           	btst d2,d0
    30a6:	0505           	btst d2,d5
    30a8:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    30ac:	0505           	btst d2,d5
    30ae:	0503           	btst d2,d3
    30b0:	0205 0507      	andi.b #7,d5
    30b4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    30b6:	0505           	btst d2,d5
    30b8:	0505           	btst d2,d5
    30ba:	0505           	btst d2,d5
    30bc:	0505           	btst d2,d5
    30be:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    30c0:	0505           	btst d2,d5
    30c2:	0505           	btst d2,d5
    30c4:	0505           	btst d2,d5
    30c6:	0505           	btst d2,d5
    30c8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    30ca:	0505           	btst d2,d5
    30cc:	0505           	btst d2,d5
    30ce:	0505           	btst d2,d5
    30d0:	0505           	btst d2,d5
    30d2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    30d4:	0505           	btst d2,d5
    30d6:	0505           	btst d2,d5
    30d8:	0505           	btst d2,d5
    30da:	0505           	btst d2,d5
    30dc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    30de:	0505           	btst d2,d5
    30e0:	0505           	btst d2,d5
    30e2:	0505           	btst d2,d5
    30e4:	0505           	btst d2,d5
    30e6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    30e8:	0505           	btst d2,d5
    30ea:	0505           	btst d2,d5
    30ec:	0505           	btst d2,d5
    30ee:	0505           	btst d2,d5
    30f0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    30f2:	0505           	btst d2,d5
    30f4:	0505           	btst d2,d5
    30f6:	0505           	btst d2,d5
    30f8:	0505           	btst d2,d5
    30fa:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    30fc:	0505           	btst d2,d5
    30fe:	0505           	btst d2,d5
    3100:	0505           	btst d2,d5
    3102:	0505           	btst d2,d5
    3104:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3106:	0505           	btst d2,d5
    3108:	0505           	btst d2,d5
    310a:	0505           	btst d2,d5
    310c:	0505           	btst d2,d5
    310e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3110:	0505           	btst d2,d5
    3112:	0505           	btst d2,d5
    3114:	0505           	btst d2,d5
    3116:	0505           	btst d2,d5
    3118:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    311a:	0505           	btst d2,d5
    311c:	0505           	btst d2,d5
    311e:	0505           	btst d2,d5
    3120:	0505           	btst d2,d5
    3122:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3124:	0505           	btst d2,d5
    3126:	0505           	btst d2,d5
    3128:	0505           	btst d2,d5
    312a:	0505           	btst d2,d5
    312c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    312e:	0505           	btst d2,d5
    3130:	0505           	btst d2,d5
    3132:	0505           	btst d2,d5
    3134:	0505           	btst d2,d5
    3136:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3138:	0505           	btst d2,d5
    313a:	0505           	btst d2,d5
    313c:	0505           	btst d2,d5
    313e:	0505           	btst d2,d5
    3140:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3142:	0505           	btst d2,d5
    3144:	0505           	btst d2,d5
    3146:	0505           	btst d2,d5
    3148:	0505           	btst d2,d5
    314a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    314c:	0505           	btst d2,d5
    314e:	0505           	btst d2,d5
    3150:	0505           	btst d2,d5
    3152:	0505           	btst d2,d5
    3154:	0505           	btst d2,d5

00003156 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    3156:	16c0           	move.b d0,(a3)+
  RTS
    3158:	4e75           	rts

0000315a <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    315a:	48f9 7fff 0000 	movem.l d0-a6,3020 <saveregs>
    3160:	3020 
  lea 0xdff000,a5
    3162:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddbf04>,a5
  move.l sp@(4),a0  //Fontlocation
    3168:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    316c:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    3170:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    3174:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    3176:	082d 0006 0002 	btst #6,2(a5)

0000317c <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    317c:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    3182:	66f8           	bne.s 317c <st2wblit>

00003184 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    3184:	7019           	moveq #25,d0
	sub.l d5,d5      
    3186:	9a85           	sub.l d5,d5

00003188 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    3188:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    318a:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    318c:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    3190:	9dce           	suba.l a6,a6
	move.l d2, a6
    3192:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    3194:	ddfc 0000 305c 	adda.l #12380,a6

	LSL  	#4,d2 	    //Fetch next char
    319a:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    319c:	2842           	movea.l d2,a4


	move.l  #0,d4
    319e:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    31a0:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    31a2:	3814           	move.w (a4),d4
	swap	d4
    31a4:	4844           	swap d4
	lsr.l	d5, d4
    31a6:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    31a8:	8993           	or.l d4,(a3)
	clr.l	d4
    31aa:	4284           	clr.l d4
	move.w  2(a4), d4
    31ac:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    31b0:	4844           	swap d4
	lsr.l	d5, d4
    31b2:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    31b4:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    31b8:	4284           	clr.l d4
	move.w  4(a4), d4
    31ba:	382c 0004      	move.w 4(a4),d4
	swap	d4
    31be:	4844           	swap d4
	lsr.l	d5, d4
    31c0:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    31c2:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    31c6:	4284           	clr.l d4
	move.w  6(a4), d4
    31c8:	382c 0006      	move.w 6(a4),d4
	swap	d4
    31cc:	4844           	swap d4
	lsr.l	d5, d4
    31ce:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    31d0:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    31d4:	4284           	clr.l d4
	move.w  8(a4), d4
    31d6:	382c 0008      	move.w 8(a4),d4
	swap	d4
    31da:	4844           	swap d4
	lsr.l	d5, d4
    31dc:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    31de:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    31e2:	4284           	clr.l d4
	move.w  10(a4), d4
    31e4:	382c 000a      	move.w 10(a4),d4
	swap	d4
    31e8:	4844           	swap d4
	lsr.l	d5, d4
    31ea:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    31ec:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    31f0:	4284           	clr.l d4
	move.w  12(a4), d4
    31f2:	382c 000c      	move.w 12(a4),d4
	swap	d4
    31f6:	4844           	swap d4
	lsr.l	d5, d4
    31f8:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    31fa:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    31fe:	4284           	clr.l d4
	move.w  14(a4), d4
    3200:	382c 000e      	move.w 14(a4),d4
	swap	d4
    3204:	4844           	swap d4
	lsr.l	d5, d4
    3206:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    3208:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    320c:	4284           	clr.l d4

	add.b   (a6), d5
    320e:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    3210:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    3214:	6500 0006      	bcs.w 321c <noadditionalchar>
	addq.w  #1, a3
    3218:	524b           	addq.w #1,a3
	sub.w   #8,d5
    321a:	5145           	subq.w #8,d5

0000321c <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    321c:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    321e:	51c8 ff68      	dbf d0,3188 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    3222:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    3226:	51cb ff5c      	dbf d3,3184 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    322a:	4cfa 7fff fdf2 	movem.l 3020 <saveregs>(pc),d0-a6

	RTS
    3230:	4e75           	rts
