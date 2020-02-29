
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
      12:	23ce 0000 5c50 	move.l a6,5c50 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,5c22 <hw>
      1e:	0000 5c22 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 337d 	lea 337d <incbin_swfont_end+0x113>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 5c26 	move.l d0,5c26 <GfxBase>
	if (!GfxBase)
      34:	6700 145c      	beq.w 1492 <main+0x148c>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
      3e:	43f9 0000 338e 	lea 338e <incbin_swfont_end+0x124>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 5c4c 	move.l d0,5c4c <DOSBase>
	if (!DOSBase)
      50:	6700 1434      	beq.w 1486 <main+0x1480>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 339a 	pea 339a <incbin_swfont_end+0x130>
      5a:	4eb9 0000 16c8 	jsr 16c8 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 33b6 	move.l #13238,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 5c22 	movea.l 5c22 <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 33c6 	move.l #13254,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 1b50 	lea 1b50 <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 5c48 	move.l d0,5c48 <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 5c38 	move.l d0,5c38 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 5c44 	move.l d0,5c44 <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 5c2c 	move.l d0,5c2c <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 5b34 	cmp.l 5b34 <ClsSprites>,d0
      d2:	6600 12f0      	bne.w 13c4 <main+0x13be>
      d6:	206a 0004      	movea.l 4(a2),a0
      da:	b1f9 0000 5b38 	cmpa.l 5b38 <ClsSprites+0x4>,a0
      e0:	6600 12e2      	bne.w 13c4 <main+0x13be>
      e4:	202a 0008      	move.l 8(a2),d0
      e8:	b0b9 0000 5b3c 	cmp.l 5b3c <ClsSprites+0x8>,d0
      ee:	6600 12d4      	bne.w 13c4 <main+0x13be>
      f2:	206a 000c      	movea.l 12(a2),a0
      f6:	b1f9 0000 5b40 	cmpa.l 5b40 <ClsSprites+0xc>,a0
      fc:	6600 12c6      	bne.w 13c4 <main+0x13be>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 5b44 	cmp.l 5b44 <ClsSprites+0x10>,d0
     10a:	6600 12b8      	bne.w 13c4 <main+0x13be>
     10e:	206a 0014      	movea.l 20(a2),a0
     112:	b1f9 0000 5b48 	cmpa.l 5b48 <ClsSprites+0x14>,a0
     118:	6600 12aa      	bne.w 13c4 <main+0x13be>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 5b4c 	cmp.l 5b4c <ClsSprites+0x18>,d0
     126:	6600 129c      	bne.w 13c4 <main+0x13be>
     12a:	206a 001c      	movea.l 28(a2),a0
     12e:	b1f9 0000 5b50 	cmpa.l 5b50 <ClsSprites+0x1c>,a0
     134:	6600 128e      	bne.w 13c4 <main+0x13be>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 5b54 	cmp.l 5b54 <ClsSprites+0x20>,d0
     142:	6600 1280      	bne.w 13c4 <main+0x13be>
     146:	206a 0024      	movea.l 36(a2),a0
     14a:	b1f9 0000 5b58 	cmpa.l 5b58 <ClsSprites+0x24>,a0
     150:	6600 1272      	bne.w 13c4 <main+0x13be>
     154:	202a 0028      	move.l 40(a2),d0
     158:	b0b9 0000 5b5c 	cmp.l 5b5c <ClsSprites+0x28>,d0
     15e:	6600 1264      	bne.w 13c4 <main+0x13be>
     162:	206a 002c      	movea.l 44(a2),a0
     166:	b1f9 0000 5b60 	cmpa.l 5b60 <ClsSprites+0x2c>,a0
     16c:	6600 1256      	bne.w 13c4 <main+0x13be>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 5b64 	cmp.l 5b64 <ClsSprites+0x30>,d0
     17a:	6600 1248      	bne.w 13c4 <main+0x13be>
     17e:	206a 0034      	movea.l 52(a2),a0
     182:	b1f9 0000 5b68 	cmpa.l 5b68 <ClsSprites+0x34>,a0
     188:	6600 123a      	bne.w 13c4 <main+0x13be>
     18c:	202a 0038      	move.l 56(a2),d0
     190:	b0b9 0000 5b6c 	cmp.l 5b6c <ClsSprites+0x38>,d0
     196:	6600 122c      	bne.w 13c4 <main+0x13be>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 5b70 	cmpa.l 5b70 <ClsSprites+0x3c>,a2
     1a4:	6600 121e      	bne.w 13c4 <main+0x13be>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 5c48 	movea.l 5c48 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 5b04 	move.l 5b04 <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 1254      	bne.w 140e <main+0x1408>
     1bc:	2039 0000 5b08 	move.l 5b08 <ClScreen+0x4>,d0
     1c2:	b0a8 0044      	cmp.l 68(a0),d0
     1c6:	6600 1246      	bne.w 140e <main+0x1408>
     1ca:	2028 0048      	move.l 72(a0),d0
     1ce:	b0b9 0000 5b0c 	cmp.l 5b0c <ClScreen+0x8>,d0
     1d4:	6600 1238      	bne.w 140e <main+0x1408>
     1d8:	2028 004c      	move.l 76(a0),d0
     1dc:	b0b9 0000 5b10 	cmp.l 5b10 <ClScreen+0xc>,d0
     1e2:	6600 122a      	bne.w 140e <main+0x1408>
     1e6:	2028 0050      	move.l 80(a0),d0
     1ea:	b0b9 0000 5b14 	cmp.l 5b14 <ClScreen+0x10>,d0
     1f0:	6600 121c      	bne.w 140e <main+0x1408>
     1f4:	2039 0000 5b18 	move.l 5b18 <ClScreen+0x14>,d0
     1fa:	b0a8 0054      	cmp.l 84(a0),d0
     1fe:	6600 120e      	bne.w 140e <main+0x1408>
     202:	2039 0000 5b1c 	move.l 5b1c <ClScreen+0x18>,d0
     208:	b0a8 0058      	cmp.l 88(a0),d0
     20c:	6600 1200      	bne.w 140e <main+0x1408>
     210:	2028 005c      	move.l 92(a0),d0
     214:	b0b9 0000 5b20 	cmp.l 5b20 <ClScreen+0x1c>,d0
     21a:	6600 11f2      	bne.w 140e <main+0x1408>
     21e:	2039 0000 5b24 	move.l 5b24 <ClScreen+0x20>,d0
     224:	b0a8 0060      	cmp.l 96(a0),d0
     228:	6600 11e4      	bne.w 140e <main+0x1408>
     22c:	2028 0064      	move.l 100(a0),d0
     230:	b0b9 0000 5b28 	cmp.l 5b28 <ClScreen+0x24>,d0
     236:	6600 11d6      	bne.w 140e <main+0x1408>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 5b2c 	cmp.l 5b2c <ClScreen+0x28>,d0
     244:	6600 11c8      	bne.w 140e <main+0x1408>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 5b30 	cmpa.l 5b30 <ClScreen+0x2c>,a0
     252:	6600 11ba      	bne.w 140e <main+0x1408>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     256:	23fc 0004 0000 	move.l #262144,5c3c <DrawBuffer>
     25c:	0000 5c3c 
  ViewBuffer = (ULONG *)0x50000;
     260:	23fc 0005 0000 	move.l #327680,5c30 <ViewBuffer>
     266:	0000 5c30 
  SetBplPointers();
     26a:	45f9 0000 2602 	lea 2602 <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,5c3c <DrawBuffer>
     278:	0000 5c3c 
     27c:	6700 11d8      	beq.w 1456 <main+0x1450>
    Write( Output(), 
     280:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 33c9 	move.l #13257,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     29e:	2079 0000 5c48 	movea.l 5c48 <Copperlist1>,a0
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 3405 	move.l #13317,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 5c48 	movea.l 5c48 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 3442 	move.l #13378,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 5c48 	movea.l 5c48 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2028 0078      	move.l 120(a0),d0
     304:	b0b9 0000 5afc 	cmp.l 5afc <ClColor>,d0
     30a:	6600 10da      	bne.w 13e6 <main+0x13e0>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 5b00 	cmp.l 5b00 <ClColor+0x4>,d0
     318:	6600 10cc      	bne.w 13e6 <main+0x13e0>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 34a1 	move.l #13473,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 23fa 	lea 23fa <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2079 0000 5c38 	movea.l 5c38 <DrawCopper>,a0
     350:	b1f9 0000 5c44 	cmpa.l 5c44 <Copperlist2>,a0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 34c4 	move.l #13508,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 262e 	lea 262e <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 5c3c 	move.l 5c3c <DrawBuffer>,d0
     384:	b0b9 0000 5c40 	cmp.l 5c40 <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 34da 	move.l #13530,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2079 0000 5c38 	movea.l 5c38 <DrawCopper>,a0
     3b0:	b1f9 0000 5c48 	cmpa.l 5c48 <Copperlist1>,a0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 3512 	move.l #13586,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2039 0000 5c30 	move.l 5c30 <ViewBuffer>,d0
     3de:	b0b9 0000 5c34 	cmp.l 5c34 <Bitplane2>,d0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 354c 	move.l #13644,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2079 0000 5c2c 	movea.l 5c2c <ViewCopper>,a0
     40a:	b1f9 0000 5c44 	cmpa.l 5c44 <Copperlist2>,a0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 3585 	move.l #13701,d2
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
     434:	2079 0000 5c2c 	movea.l 5c2c <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     44c:	b0b9 0000 5c34 	cmp.l 5c34 <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 35c0 	move.l #13760,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     476:	2079 0000 5c2c 	movea.l 5c2c <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     48e:	b0b9 0000 5c40 	cmp.l 5c40 <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 3609 	move.l #13833,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4b8:	2079 0000 5c2c 	movea.l 5c2c <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4d0:	b0b9 0000 5c34 	cmp.l 5c34 <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 3653 	move.l #13907,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	4eb9 0000 276c 	jsr 276c <FreeDisplay>
  TestZoom4Picture();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     506:	283c 0000 2420 	move.l #9248,d4
     50c:	2044           	movea.l d4,a0
     50e:	4e90           	jsr (a0)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     510:	4878 0010      	pea 10 <main+0xa>
     514:	4879 0000 5b34 	pea 5b34 <ClsSprites>
     51a:	42a7           	clr.l -(sp)
     51c:	2f39 0000 5c48 	move.l 5c48 <Copperlist1>,-(sp)
     522:	47f9 0000 197a 	lea 197a <TestCopperlistBatch>,a3
     528:	4e93           	jsr (a3)
     52a:	4fef 0018      	lea 24(sp),sp
     52e:	4a80           	tst.l d0
     530:	661e           	bne.s 550 <main+0x54a>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     532:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     538:	4eae ffc4      	jsr -60(a6)
     53c:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     542:	2200           	move.l d0,d1
     544:	243c 0000 369c 	move.l #13980,d2
     54a:	762c           	moveq #44,d3
     54c:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     550:	4878 000c      	pea c <main+0x6>
     554:	4879 0000 5acc 	pea 5acc <ClScreenZoom>
     55a:	4878 0010      	pea 10 <main+0xa>
     55e:	2f39 0000 5c48 	move.l 5c48 <Copperlist1>,-(sp)
     564:	4e93           	jsr (a3)
     566:	4fef 0010      	lea 16(sp),sp
     56a:	4a80           	tst.l d0
     56c:	661e           	bne.s 58c <main+0x586>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     56e:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     574:	4eae ffc4      	jsr -60(a6)
     578:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     57e:	2200           	move.l d0,d1
     580:	243c 0000 36d2 	move.l #14034,d2
     586:	7636           	moveq #54,d3
     588:	4eae ffd0      	jsr -48(a6)
  //ZoomHorizontal = 10;
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     58c:	2079 0000 5c38 	movea.l 5c38 <DrawCopper>,a0
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
     5a8:	23fc 0005 0000 	move.l #327680,5c3c <DrawBuffer>
     5ae:	0000 5c3c 
  ViewBuffer = (ULONG *) tmp;
     5b2:	23fc 0004 0000 	move.l #262144,5c30 <ViewBuffer>
     5b8:	0000 5c30 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5bc:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c2:	4878 001c      	pea 1c <main+0x16>
     5c6:	2f39 0000 5c48 	move.l 5c48 <Copperlist1>,-(sp)
     5cc:	49f9 0000 195c 	lea 195c <TestCopperlistPos>,a4
     5d2:	4e94           	jsr (a4)
     5d4:	4fef 000c      	lea 12(sp),sp
     5d8:	4a80           	tst.l d0
     5da:	661e           	bne.s 5fa <main+0x5f4>
    Write(Output(), 
     5dc:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     5e2:	4eae ffc4      	jsr -60(a6)
     5e6:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     5ec:	2200           	move.l d0,d1
     5ee:	243c 0000 3405 	move.l #13317,d2
     5f4:	763c           	moveq #60,d3
     5f6:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     5fa:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     600:	4878 001d      	pea 1d <main+0x17>
     604:	2f39 0000 5c48 	move.l 5c48 <Copperlist1>,-(sp)
     60a:	4e94           	jsr (a4)
     60c:	4fef 000c      	lea 12(sp),sp
     610:	4a80           	tst.l d0
     612:	661e           	bne.s 632 <main+0x62c>
    Write(Output(), 
     614:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     61a:	4eae ffc4      	jsr -60(a6)
     61e:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     624:	2200           	move.l d0,d1
     626:	243c 0000 3442 	move.l #13378,d2
     62c:	763c           	moveq #60,d3
     62e:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     632:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     638:	4878 001e      	pea 1e <main+0x18>
     63c:	2f39 0000 5c48 	move.l 5c48 <Copperlist1>,-(sp)
     642:	4e94           	jsr (a4)
     644:	4fef 000c      	lea 12(sp),sp
     648:	4a80           	tst.l d0
     64a:	661e           	bne.s 66a <main+0x664>
    Write(Output(), 
     64c:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     652:	4eae ffc4      	jsr -60(a6)
     656:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     65c:	2200           	move.l d0,d1
     65e:	243c 0000 3709 	move.l #14089,d2
     664:	763c           	moveq #60,d3
     666:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     66a:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     670:	4878 001f      	pea 1f <main+0x19>
     674:	2f39 0000 5c48 	move.l 5c48 <Copperlist1>,-(sp)
     67a:	4e94           	jsr (a4)
     67c:	4fef 000c      	lea 12(sp),sp
     680:	4a80           	tst.l d0
     682:	661e           	bne.s 6a2 <main+0x69c>
    Write(Output(), 
     684:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     68a:	4eae ffc4      	jsr -60(a6)
     68e:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     694:	2200           	move.l d0,d1
     696:	243c 0000 3746 	move.l #14150,d2
     69c:	763c           	moveq #60,d3
     69e:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6a2:	4878 0002      	pea 2 <_start+0x2>
     6a6:	4879 0000 5afc 	pea 5afc <ClColor>
     6ac:	4878 0020      	pea 20 <main+0x1a>
     6b0:	2f39 0000 5c48 	move.l 5c48 <Copperlist1>,-(sp)
     6b6:	4e93           	jsr (a3)
     6b8:	4fef 0010      	lea 16(sp),sp
     6bc:	4a80           	tst.l d0
     6be:	661e           	bne.s 6de <main+0x6d8>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6c0:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     6c6:	4eae ffc4      	jsr -60(a6)
     6ca:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     6d0:	2200           	move.l d0,d1
     6d2:	243c 0000 347f 	move.l #13439,d2
     6d8:	7621           	moveq #33,d3
     6da:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6de:	7ec0           	moveq #-64,d7
     6e0:	de8d           	add.l a5,d7
     6e2:	4878 0040      	pea 40 <main+0x3a>
     6e6:	4879 0000 3a8c 	pea 3a8c <incbin_swfont_end+0x822>
     6ec:	2f07           	move.l d7,-(sp)
     6ee:	4eb9 0000 2824 	jsr 2824 <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     6f4:	4878 0010      	pea 10 <main+0xa>
     6f8:	2f07           	move.l d7,-(sp)
     6fa:	4878 0022      	pea 22 <main+0x1c>
     6fe:	2f39 0000 5c48 	move.l 5c48 <Copperlist1>,-(sp)
     704:	4e93           	jsr (a3)
     706:	4fef 001c      	lea 28(sp),sp
     70a:	4a80           	tst.l d0
     70c:	661e           	bne.s 72c <main+0x726>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     70e:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     714:	4eae ffc4      	jsr -60(a6)
     718:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     71e:	2200           	move.l d0,d1
     720:	243c 0000 3783 	move.l #14211,d2
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
     750:	2f39 0000 5c48 	move.l 5c48 <Copperlist1>,-(sp)
     756:	4e93           	jsr (a3)
     758:	4fef 0010      	lea 16(sp),sp
     75c:	4a80           	tst.l d0
     75e:	661e           	bne.s 77e <main+0x778>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     760:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     766:	4eae ffc4      	jsr -60(a6)
     76a:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     770:	2200           	move.l d0,d1
     772:	243c 0000 37a5 	move.l #14245,d2
     778:	762c           	moveq #44,d3
     77a:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     77e:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdceed>
     782:	4878 2922      	pea 2922 <memset+0x6c>
     786:	2f39 0000 5c48 	move.l 5c48 <Copperlist1>,-(sp)
     78c:	4e94           	jsr (a4)
     78e:	4fef 000c      	lea 12(sp),sp
     792:	4a80           	tst.l d0
     794:	661e           	bne.s 7b4 <main+0x7ae>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     796:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     79c:	4eae ffc4      	jsr -60(a6)
     7a0:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     7a6:	2200           	move.l d0,d1
     7a8:	243c 0000 34a1 	move.l #13473,d2
     7ae:	7622           	moveq #34,d3
     7b0:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7b4:	2f3c 0001 6800 	move.l #92160,-(sp)
     7ba:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7c0:	4eb9 0000 276c 	jsr 276c <FreeDisplay>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7c6:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
     7cc:	7004           	moveq #4,d0
     7ce:	7202           	moveq #2,d1
     7d0:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
     7d4:	33fc 0010 0000 	move.w #16,5c2a <ZoomHorizontal>
     7da:	5c2a 

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     7dc:	2044           	movea.l d4,a0
     7de:	4e90           	jsr (a0)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7e0:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
     7e6:	203c 0000 c800 	move.l #51200,d0
     7ec:	7202           	moveq #2,d1
     7ee:	4eae ff3a      	jsr -198(a6)
     7f2:	2440           	movea.l d0,a2
     7f4:	23c0 0000 5c0c 	move.l d0,5c0c <Zoom_Source>
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
     81e:	2439 0000 5c3c 	move.l 5c3c <DrawBuffer>,d2
    srca = source + 1;
     824:	2600           	move.l d0,d3
     826:	5483           	addq.l #2,d3
  WaitBlit();
     828:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
     82e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     832:	2079 0000 5c22 	movea.l 5c22 <hw>,a0
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
     87a:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
     880:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     884:	2479 0000 5c3c 	movea.l 5c3c <DrawBuffer>,a2
  if( *destination != 0x0180) {
     88a:	0c6a 0180 0002 	cmpi.w #384,2(a2)
     890:	671e           	beq.s 8b0 <main+0x8aa>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
     892:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     898:	4eae ffc4      	jsr -60(a6)
     89c:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     8a2:	2200           	move.l d0,d1
     8a4:	243c 0000 380a 	move.l #14346,d2
     8aa:	761c           	moveq #28,d3
     8ac:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8b0:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
     8b6:	671e           	beq.s 8d6 <main+0x8d0>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
     8b8:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     8be:	4eae ffc4      	jsr -60(a6)
     8c2:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     8c8:	2200           	move.l d0,d1
     8ca:	243c 0000 3827 	move.l #14375,d2
     8d0:	761c           	moveq #28,d3
     8d2:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     8d6:	2079 0000 5c3c 	movea.l 5c3c <DrawBuffer>,a0
     8dc:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
     8e2:	671e           	beq.s 902 <main+0x8fc>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
     8e4:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     8ea:	4eae ffc4      	jsr -60(a6)
     8ee:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     8f4:	2200           	move.l d0,d1
     8f6:	243c 0000 3844 	move.l #14404,d2
     8fc:	761a           	moveq #26,d3
     8fe:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     902:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
     908:	2279 0000 5c0c 	movea.l 5c0c <Zoom_Source>,a1
     90e:	203c 0000 c800 	move.l #51200,d0
     914:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     918:	2f3c 0001 6800 	move.l #92160,-(sp)
     91e:	2f3c 0000 a48c 	move.l #42124,-(sp)
     924:	4eb9 0000 276c 	jsr 276c <FreeDisplay>
     92a:	508f           	addq.l #8,sp
}

void TestCopyColumnOfZoom() {

  PrepareDisplayZoom();
     92c:	2044           	movea.l d4,a0
     92e:	4e90           	jsr (a0)

  UWORD *destination = (UWORD *)DrawBuffer;
     930:	2079 0000 5c3c 	movea.l 5c3c <DrawBuffer>,a0
  *destination= 0x0000;
     936:	4250           	clr.w (a0)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     938:	317c 000f 0030 	move.w #15,48(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     93e:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     944:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
     94a:	203c 0000 c800 	move.l #51200,d0
     950:	7202           	moveq #2,d1
     952:	4eae ff3a      	jsr -198(a6)
     956:	2440           	movea.l d0,a2
     958:	23c0 0000 5c0c 	move.l d0,5c0c <Zoom_Source>
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
     972:	2439 0000 5c3c 	move.l 5c3c <DrawBuffer>,d2
  WaitBlit();
     978:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
     97e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     982:	2079 0000 5c22 	movea.l 5c22 <hw>,a0
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
     9ca:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
     9d0:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     9d4:	2479 0000 5c3c 	movea.l 5c3c <DrawBuffer>,a2
  if( *destination != 0x4000)
     9da:	0c52 4000      	cmpi.w #16384,(a2)
     9de:	671e           	beq.s 9fe <main+0x9f8>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     9e0:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     9e6:	4eae ffc4      	jsr -60(a6)
     9ea:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     9f0:	2200           	move.l d0,d1
     9f2:	243c 0000 385f 	move.l #14431,d2
     9f8:	7629           	moveq #41,d3
     9fa:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x400f)
     9fe:	0c6a 400f 0030 	cmpi.w #16399,48(a2)
     a04:	671e           	beq.s a24 <main+0xa1e>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     a06:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     a0c:	4eae ffc4      	jsr -60(a6)
     a10:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     a16:	2200           	move.l d0,d1
     a18:	243c 0000 3889 	move.l #14473,d2
     a1e:	762a           	moveq #42,d3
     a20:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     a24:	2479 0000 5c3c 	movea.l 5c3c <DrawBuffer>,a2
     a2a:	0c6a 400f 47d0 	cmpi.w #16399,18384(a2)
     a30:	6724           	beq.s a56 <main+0xa50>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     a32:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     a38:	4eae ffc4      	jsr -60(a6)
     a3c:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     a42:	2200           	move.l d0,d1
     a44:	243c 0000 38b4 	move.l #14516,d2
     a4a:	7628           	moveq #40,d3
     a4c:	4eae ffd0      	jsr -48(a6)
     a50:	2479 0000 5c3c 	movea.l 5c3c <DrawBuffer>,a2

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
     a64:	2439 0000 5c0c 	move.l 5c0c <Zoom_Source>,d2
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
     a7c:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
     a82:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     a86:	2079 0000 5c22 	movea.l 5c22 <hw>,a0
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
     ace:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
     ad4:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     ad8:	2479 0000 5c3c 	movea.l 5c3c <DrawBuffer>,a2
  if( *destination != 0x8000)
     ade:	0c52 8000      	cmpi.w #-32768,(a2)
     ae2:	671e           	beq.s b02 <main+0xafc>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     ae4:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     aea:	4eae ffc4      	jsr -60(a6)
     aee:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     af4:	2200           	move.l d0,d1
     af6:	243c 0000 38dd 	move.l #14557,d2
     afc:	7628           	moveq #40,d3
     afe:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x800f)
     b02:	0c6a 800f 0030 	cmpi.w #-32753,48(a2)
     b08:	671e           	beq.s b28 <main+0xb22>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     b0a:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     b10:	4eae ffc4      	jsr -60(a6)
     b14:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     b1a:	2200           	move.l d0,d1
     b1c:	243c 0000 3906 	move.l #14598,d2
     b22:	7629           	moveq #41,d3
     b24:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     b28:	2079 0000 5c3c 	movea.l 5c3c <DrawBuffer>,a0
     b2e:	0c68 800f 47d0 	cmpi.w #-32753,18384(a0)
     b34:	671e           	beq.s b54 <main+0xb4e>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     b36:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     b3c:	4eae ffc4      	jsr -60(a6)
     b40:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     b46:	2200           	move.l d0,d1
     b48:	243c 0000 3930 	move.l #14640,d2
     b4e:	7627           	moveq #39,d3
     b50:	4eae ffd0      	jsr -48(a6)

  FreeMem( Zoom_Source, 40*256*5);
     b54:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
     b5a:	2279 0000 5c0c 	movea.l 5c0c <Zoom_Source>,a1
     b60:	203c 0000 c800 	move.l #51200,d0
     b66:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     b6a:	2f3c 0001 6800 	move.l #92160,-(sp)
     b70:	2f3c 0000 a48c 	move.l #42124,-(sp)
     b76:	4eb9 0000 276c 	jsr 276c <FreeDisplay>
     b7c:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     b7e:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
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
     b98:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
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
     cf6:	4eb9 0000 28b6 	jsr 28b6 <memset>
  WaitBlit();
     cfc:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
     d02:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     d06:	2079 0000 5c22 	movea.l 5c22 <hw>,a0
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
     d42:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
     d48:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     d4c:	4fef 000c      	lea 12(sp),sp
     d50:	2044           	movea.l d4,a0
     d52:	0c68 5555 0002 	cmpi.w #21845,2(a0)
     d58:	671e           	beq.s d78 <main+0xd72>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     d5a:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     d60:	4eae ffc4      	jsr -60(a6)
     d64:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     d6a:	2200           	move.l d0,d1
     d6c:	243c 0000 398e 	move.l #14734,d2
     d72:	761f           	moveq #31,d3
     d74:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     d78:	2044           	movea.l d4,a0
     d7a:	0c68 aaaa 0032 	cmpi.w #-21846,50(a0)
     d80:	671e           	beq.s da0 <main+0xd9a>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     d82:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     d88:	4eae ffc4      	jsr -60(a6)
     d8c:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
     d92:	2200           	move.l d0,d1
     d94:	243c 0000 39ae 	move.l #14766,d2
     d9a:	7620           	moveq #32,d3
     d9c:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     da0:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
     da6:	224a           	movea.l a2,a1
     da8:	203c 0000 05a0 	move.l #1440,d0
     dae:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     db2:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
     db8:	2244           	movea.l d4,a1
     dba:	203c 0000 05a0 	move.l #1440,d0
     dc0:	4eae ff2e      	jsr -210(a6)
5    5    5    2    a    a    a    a    9    5    5    5    5    4    a    a
abcd efgh ijkl 1234 5678 9abc defg hijk l123 4567 89ab cdef ghij kl12 3456 789a
1010 1010 1010 0101 0101 0101 0101 0101 0010 1010 1010 1010 1010 1001 0101 0101
a    a    a    5    5    5    5    5    2    a    a    a    a    9    5    5*/ 
void TestZoom4Picture() {
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dc4:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
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
     dde:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
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
     ece:	4eb9 0000 1dae 	jsr 1dae <Zoom_ZoomIntoPicture>
  WaitBlit();
     ed4:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
     eda:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
  UWORD *valsupposed = destlinezoom1;
  for(int i=0;i<16;i++) {
     ede:	2a04           	move.l d4,d5
     ee0:	0685 0000 0304 	addi.l #772,d5
     ee6:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
     eea:	7410           	moveq #16,d2
     eec:	2c3c 0000 1846 	move.l #6214,d6
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
     f56:	4eb9 0000 1dae 	jsr 1dae <Zoom_ZoomIntoPicture>
  WaitBlit();
     f5c:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
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
    10b4:	4eb9 0000 262e 	jsr 262e <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    10ba:	4878 0010      	pea 10 <main+0xa>
    10be:	4879 0000 5b34 	pea 5b34 <ClsSprites>
    10c4:	42a7           	clr.l -(sp)
    10c6:	2f39 0000 5c48 	move.l 5c48 <Copperlist1>,-(sp)
    10cc:	4e93           	jsr (a3)
    10ce:	4fef 0010      	lea 16(sp),sp
    10d2:	4a80           	tst.l d0
    10d4:	661e           	bne.s 10f4 <main+0x10ee>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    10d6:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    10dc:	4eae ffc4      	jsr -60(a6)
    10e0:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    10e6:	2200           	move.l d0,d1
    10e8:	243c 0000 369c 	move.l #13980,d2
    10ee:	762c           	moveq #44,d3
    10f0:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    10f4:	4878 000c      	pea c <main+0x6>
    10f8:	4879 0000 5b04 	pea 5b04 <ClScreen>
    10fe:	4878 0010      	pea 10 <main+0xa>
    1102:	2f39 0000 5c48 	move.l 5c48 <Copperlist1>,-(sp)
    1108:	4e93           	jsr (a3)
    110a:	4fef 0010      	lea 16(sp),sp
    110e:	4a80           	tst.l d0
    1110:	661e           	bne.s 1130 <main+0x112a>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    1112:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1118:	4eae ffc4      	jsr -60(a6)
    111c:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1122:	2200           	move.l d0,d1
    1124:	243c 0000 36d2 	move.l #14034,d2
    112a:	7636           	moveq #54,d3
    112c:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    1130:	4878 0002      	pea 2 <_start+0x2>
    1134:	4879 0000 5afc 	pea 5afc <ClColor>
    113a:	4878 001e      	pea 1e <main+0x18>
    113e:	2f39 0000 5c48 	move.l 5c48 <Copperlist1>,-(sp)
    1144:	4e93           	jsr (a3)
    1146:	4fef 0010      	lea 16(sp),sp
    114a:	4a80           	tst.l d0
    114c:	661e           	bne.s 116c <main+0x1166>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    114e:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1154:	4eae ffc4      	jsr -60(a6)
    1158:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    115e:	2200           	move.l d0,d1
    1160:	243c 0000 347f 	move.l #13439,d2
    1166:	7621           	moveq #33,d3
    1168:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    116c:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdceed>
    1170:	4878 0020      	pea 20 <main+0x1a>
    1174:	2f39 0000 5c48 	move.l 5c48 <Copperlist1>,-(sp)
    117a:	4e94           	jsr (a4)
    117c:	4fef 000c      	lea 12(sp),sp
    1180:	4a80           	tst.l d0
    1182:	661e           	bne.s 11a2 <main+0x119c>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    1184:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    118a:	4eae ffc4      	jsr -60(a6)
    118e:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1194:	2200           	move.l d0,d1
    1196:	243c 0000 34a1 	move.l #13473,d2
    119c:	7622           	moveq #34,d3
    119e:	4eae ffd0      	jsr -48(a6)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    11a2:	2479 0000 5c3c 	movea.l 5c3c <DrawBuffer>,a2
    11a8:	4879 0000 3a48 	pea 3a48 <incbin_swfont_end+0x7de>
    11ae:	2f0a           	move.l a2,-(sp)
    11b0:	4eb9 0000 15d8 	jsr 15d8 <WriteFont.constprop.4>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    11b6:	508f           	addq.l #8,sp
    11b8:	0c52 ff00      	cmpi.w #-256,(a2)
    11bc:	671e           	beq.s 11dc <main+0x11d6>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    11be:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    11c4:	4eae ffc4      	jsr -60(a6)
    11c8:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    11ce:	2200           	move.l d0,d1
    11d0:	243c 0000 3a59 	move.l #14937,d2
    11d6:	7631           	moveq #49,d3
    11d8:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    11dc:	2f3c 0000 c800 	move.l #51200,-(sp)
    11e2:	4878 0084      	pea 84 <main+0x7e>
    11e6:	4eb9 0000 276c 	jsr 276c <FreeDisplay>
  RunTests();
	Delay(50);
    11ec:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
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
    121c:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
    1222:	23ee 0022 0000 	move.l 34(a6),5c10 <ActiView>
    1228:	5c10 
	OwnBlitter();
    122a:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    122e:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
    1234:	4eae ff1c      	jsr -228(a6)
	Disable();
    1238:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    123e:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    1242:	2679 0000 5c22 	movea.l 5c22 <hw>,a3
    1248:	302b 0010      	move.w 16(a3),d0
    124c:	33c0 0000 5c14 	move.w d0,5c14 <SystemADKCON>
	SystemInts=hw->intenar;
    1252:	302b 001c      	move.w 28(a3),d0
    1256:	33c0 0000 5c18 	move.w d0,5c18 <SystemInts>
	SystemDMA=hw->dmaconr;
    125c:	302b 0002      	move.w 2(a3),d0
    1260:	33c0 0000 5c16 	move.w d0,5c16 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    1266:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    126c:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
    1272:	45f9 0000 27de 	lea 27de <WaitVbl>,a2
    1278:	4e92           	jsr (a2)
	WaitVbl();
    127a:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
    127c:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    1282:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
    1288:	93c9           	suba.l a1,a1
    128a:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    128e:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
    1294:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    1298:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
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
    12b8:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    12be:	082e 0000 0129 	btst #0,297(a6)
    12c4:	6700 02c6      	beq.w 158c <main+0x1586>
		vbr = (APTR)Supervisor((void*)getvbr);
    12c8:	cf8d           	exg d7,a5
    12ca:	4eae ffe2      	jsr -30(a6)
    12ce:	cf8d           	exg d7,a5

	VBR=GetVBR();
    12d0:	23c0 0000 5c1a 	move.l d0,5c1a <VBR.lto_priv.5>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    12d6:	2079 0000 5c1a 	movea.l 5c1a <VBR.lto_priv.5>,a0
    12dc:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    12e0:	23c2 0000 5c1e 	move.l d2,5c1e <SystemIrq>
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
    12ea:	2079 0000 5c22 	movea.l 5c22 <hw>,a0
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
    1310:	2279 0000 5c1a 	movea.l 5c1a <VBR.lto_priv.5>,a1
    1316:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    131a:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
    1320:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    1326:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    132c:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    1332:	3039 0000 5c18 	move.w 5c18 <SystemInts>,d0
    1338:	0040 8000      	ori.w #-32768,d0
    133c:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    1340:	3039 0000 5c16 	move.w 5c16 <SystemDMA>,d0
    1346:	0040 8000      	ori.w #-32768,d0
    134a:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    134e:	3039 0000 5c14 	move.w 5c14 <SystemADKCON>,d0
    1354:	0040 8000      	ori.w #-32768,d0
    1358:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    135c:	2279 0000 5c10 	movea.l 5c10 <ActiView>,a1
    1362:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    1366:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
    136c:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    1370:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
    1376:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    137a:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
    1380:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    1384:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
    138a:	4eae fe32      	jsr -462(a6)
	Enable();
    138e:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    1394:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    1398:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    139e:	2279 0000 5c4c 	movea.l 5c4c <DOSBase>,a1
    13a4:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    13a8:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    13ae:	2279 0000 5c26 	movea.l 5c26 <GfxBase>,a1
    13b4:	4eae fe62      	jsr -414(a6)
}
    13b8:	7000           	moveq #0,d0
    13ba:	4ced 5cfc ff8c 	movem.l -116(a5),d2-d7/a2-a4/a6
    13c0:	4e5d           	unlk a5
    13c2:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    13c4:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    13ca:	4eae ffc4      	jsr -60(a6)
    13ce:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    13d4:	2200           	move.l d0,d1
    13d6:	243c 0000 369c 	move.l #13980,d2
    13dc:	762c           	moveq #44,d3
    13de:	4eae ffd0      	jsr -48(a6)
    13e2:	6000 edc4      	bra.w 1a8 <main+0x1a2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    13e6:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    13ec:	4eae ffc4      	jsr -60(a6)
    13f0:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    13f6:	2200           	move.l d0,d1
    13f8:	243c 0000 347f 	move.l #13439,d2
    13fe:	7621           	moveq #33,d3
    1400:	4eae ffd0      	jsr -48(a6)
    1404:	2079 0000 5c48 	movea.l 5c48 <Copperlist1>,a0
    140a:	6000 ef10      	bra.w 31c <main+0x316>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    140e:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1414:	4eae ffc4      	jsr -60(a6)
    1418:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    141e:	2200           	move.l d0,d1
    1420:	243c 0000 36d2 	move.l #14034,d2
    1426:	7636           	moveq #54,d3
    1428:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    142c:	23fc 0004 0000 	move.l #262144,5c3c <DrawBuffer>
    1432:	0000 5c3c 
  ViewBuffer = (ULONG *)0x50000;
    1436:	23fc 0005 0000 	move.l #327680,5c30 <ViewBuffer>
    143c:	0000 5c30 
  SetBplPointers();
    1440:	45f9 0000 2602 	lea 2602 <SetBplPointers>,a2
    1446:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    1448:	0cb9 0005 0000 	cmpi.l #327680,5c3c <DrawBuffer>
    144e:	0000 5c3c 
    1452:	6600 ee2c      	bne.w 280 <main+0x27a>
    1456:	0cb9 0004 0000 	cmpi.l #262144,5c30 <ViewBuffer>
    145c:	0000 5c30 
    1460:	6700 ee3c      	beq.w 29e <main+0x298>
    Write( Output(), 
    1464:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    146a:	4eae ffc4      	jsr -60(a6)
    146e:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1474:	2200           	move.l d0,d1
    1476:	243c 0000 33c9 	move.l #13257,d2
    147c:	763b           	moveq #59,d3
    147e:	4eae ffd0      	jsr -48(a6)
    1482:	6000 ee1a      	bra.w 29e <main+0x298>
		Exit(0);
    1486:	9dce           	suba.l a6,a6
    1488:	7200           	moveq #0,d1
    148a:	4eae ff70      	jsr -144(a6)
    148e:	6000 ebc4      	bra.w 54 <main+0x4e>
		Exit(0);
    1492:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1498:	7200           	moveq #0,d1
    149a:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    149e:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    14a4:	43f9 0000 338e 	lea 338e <incbin_swfont_end+0x124>,a1
    14aa:	7000           	moveq #0,d0
    14ac:	4eae fdd8      	jsr -552(a6)
    14b0:	23c0 0000 5c4c 	move.l d0,5c4c <DOSBase>
	if (!DOSBase)
    14b6:	6600 eb9c      	bne.w 54 <main+0x4e>
    14ba:	60ca           	bra.s 1486 <main+0x1480>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    14bc:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    14c2:	4eae ffc4      	jsr -60(a6)
    14c6:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    14cc:	2200           	move.l d0,d1
    14ce:	243c 0000 3958 	move.l #14680,d2
    14d4:	7635           	moveq #53,d3
    14d6:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    14da:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    14e0:	203c 0000 3740 	move.l #14144,d0
    14e6:	7202           	moveq #2,d1
    14e8:	4eae ff3a      	jsr -198(a6)
    14ec:	2440           	movea.l d0,a2
  if( source == 0) {
    14ee:	4a80           	tst.l d0
    14f0:	6600 f8ec      	bne.w dde <main+0xdd8>
    Write(  Output(), 
    14f4:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    14fa:	4eae ffc4      	jsr -60(a6)
    14fe:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1504:	2200           	move.l d0,d1
    1506:	243c 0000 39cf 	move.l #14799,d2
    150c:	7639           	moveq #57,d3
    150e:	4eae ffd0      	jsr -48(a6)
    return;
    1512:	6000 fba0      	bra.w 10b4 <main+0x10ae>
    Write(  Output(), 
    1516:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    151c:	4eae ffc4      	jsr -60(a6)
    1520:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1526:	2200           	move.l d0,d1
    1528:	243c 0000 37d2 	move.l #14290,d2
    152e:	7636           	moveq #54,d3
    1530:	4eae ffd0      	jsr -48(a6)
  PrepareDisplayZoom();
    1534:	2044           	movea.l d4,a0
    1536:	4e90           	jsr (a0)
  UWORD *destination = (UWORD *)DrawBuffer;
    1538:	2079 0000 5c3c 	movea.l 5c3c <DrawBuffer>,a0
  *destination= 0x0000;
    153e:	4250           	clr.w (a0)
  *destination= 0x000f;
    1540:	317c 000f 0030 	move.w #15,48(a0)
  *destination = 0x000f;
    1546:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    154c:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    1552:	203c 0000 c800 	move.l #51200,d0
    1558:	7202           	moveq #2,d1
    155a:	4eae ff3a      	jsr -198(a6)
    155e:	2440           	movea.l d0,a2
    1560:	23c0 0000 5c0c 	move.l d0,5c0c <Zoom_Source>
  if( Zoom_Source == 0) {
    1566:	6600 f3fa      	bne.w 962 <main+0x95c>
    Write(  Output(), 
    156a:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1570:	4eae ffc4      	jsr -60(a6)
    1574:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    157a:	2200           	move.l d0,d1
    157c:	243c 0000 37d2 	move.l #14290,d2
    1582:	7636           	moveq #54,d3
    1584:	4eae ffd0      	jsr -48(a6)
    return;
    1588:	6000 f5f4      	bra.w b7e <main+0xb78>
	APTR vbr = 0;
    158c:	7000           	moveq #0,d0
	VBR=GetVBR();
    158e:	23c0 0000 5c1a 	move.l d0,5c1a <VBR.lto_priv.5>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    1594:	2079 0000 5c1a 	movea.l 5c1a <VBR.lto_priv.5>,a0
    159a:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    159e:	23c2 0000 5c1e 	move.l d2,5c1e <SystemIrq>
	WaitVbl();
    15a4:	4e92           	jsr (a2)
	WaitVbl();
    15a6:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    15a8:	2079 0000 5c22 	movea.l 5c22 <hw>,a0
    15ae:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    15b2:	6000 fd40      	bra.w 12f4 <main+0x12ee>
    Write(  Output(), 
    15b6:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    15bc:	4eae ffc4      	jsr -60(a6)
    15c0:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    15c6:	2200           	move.l d0,d1
    15c8:	243c 0000 3a09 	move.l #14857,d2
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
    15f2:	d1fc 0000 5bcc 	adda.l #23500,a0
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
    163c:	4879 0000 329e 	pea 329e <incbin_swfont_end+0x34>
    1642:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdceee>
    1646:	4878 0052      	pea 52 <main+0x4c>
    164a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeece4f>
    1650:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1654:	203c 0000 3284 	move.l #12932,d0
    165a:	4878 0001      	pea 1 <_start+0x1>
    165e:	2f02           	move.l d2,-(sp)
    1660:	42a7           	clr.l -(sp)
    1662:	2f00           	move.l d0,-(sp)
    1664:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdceee>
    1668:	4878 0052      	pea 52 <main+0x4c>
    166c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeece4f>
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
    1688:	4879 0000 32a8 	pea 32a8 <incbin_swfont_end+0x3e>
    168e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdceee>
    1692:	4878 0052      	pea 52 <main+0x4c>
    1696:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeece4f>
    169c:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    16a0:	203c 0000 326b 	move.l #12907,d0
    16a6:	4878 0001      	pea 1 <_start+0x1>
    16aa:	2f02           	move.l d2,-(sp)
    16ac:	42a7           	clr.l -(sp)
    16ae:	2f00           	move.l d0,-(sp)
    16b0:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdceee>
    16b4:	4878 0052      	pea 52 <main+0x4c>
    16b8:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeece4f>
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
    16d0:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeece4f>
    16d6:	6734           	beq.s 170c <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    16d8:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    16de:	206f 0090      	movea.l 144(sp),a0
    16e2:	43ef 0094      	lea 148(sp),a1
    16e6:	45f9 0000 2aa4 	lea 2aa4 <PutChar>,a2
    16ec:	47ef 000c      	lea 12(sp),a3
    16f0:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    16f4:	2f0b           	move.l a3,-(sp)
    16f6:	4878 0056      	pea 56 <main+0x50>
    16fa:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeece4f>
    1700:	508f           	addq.l #8,sp
}
    1702:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1706:	4fef 0080      	lea 128(sp),sp
    170a:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    170c:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    1712:	206f 0090      	movea.l 144(sp),a0
    1716:	43ef 0094      	lea 148(sp),a1
    171a:	45f9 0000 2a96 	lea 2a96 <KPutCharX>,a2
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
    1730:	4fef ff94      	lea -108(sp),sp
    1734:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1738:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    173e:	3c2f 002e      	move.w 46(sp),d6
                                                             int numberofline) {    
  char str[ 100] = { 0 };
    1742:	7a34           	moveq #52,d5
    1744:	da8f           	add.l sp,d5
    1746:	4878 0064      	pea 64 <main+0x5e>
    174a:	42a7           	clr.l -(sp)
    174c:	2f05           	move.l d5,-(sp)
    174e:	4eba 1166      	jsr 28b6 <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
    1752:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1758:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
    175c:	2a6f 009c      	movea.l 156(sp),a5

  for(int i=0;i<21;i++) {
    1760:	7800           	moveq #0,d4
  testpattern += 0;
    1762:	49f9 0000 5ba0 	lea 5ba0 <destlinezoom2>,a4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1768:	2e3c 0000 32b3 	move.l #12979,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    176e:	301c           	move.w (a4)+,d0
    1770:	bd40           	eor.w d6,d0
    1772:	b05d           	cmp.w (a5)+,d0
    1774:	6736           	beq.s 17ac <TestRow.constprop.3+0x7c>
      data[0] = i;
    1776:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    177a:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    1780:	2047           	movea.l d7,a0
    1782:	43ef 0030      	lea 48(sp),a1
    1786:	45f9 0000 2aa4 	lea 2aa4 <PutChar>,a2
    178c:	2645           	movea.l d5,a3
    178e:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    1792:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1798:	4eae ffc4      	jsr -60(a6)
    179c:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    17a2:	2200           	move.l d0,d1
    17a4:	2405           	move.l d5,d2
    17a6:	7664           	moveq #100,d3
    17a8:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    17ac:	5284           	addq.l #1,d4
    17ae:	b9fc 0000 5bca 	cmpa.l #23498,a4
    17b4:	66b8           	bne.s 176e <TestRow.constprop.3+0x3e>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    17b6:	3039 0000 5bca 	move.w 5bca <destlinezoom2+0x2a>,d0
    17bc:	322f 002e      	move.w 46(sp),d1
    17c0:	b340           	eor.w d1,d0
    17c2:	206f 009c      	movea.l 156(sp),a0
    17c6:	3228 002a      	move.w 42(a0),d1
    17ca:	b340           	eor.w d1,d0
    17cc:	0240 ff00      	andi.w #-256,d0
    17d0:	660a           	bne.s 17dc <TestRow.constprop.3+0xac>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
    17d2:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    17d6:	4fef 006c      	lea 108(sp),sp
    17da:	4e75           	rts
    data[0] = 22;
    17dc:	3f7c 0016 0030 	move.w #22,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    17e2:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    17e8:	41f9 0000 32b3 	lea 32b3 <incbin_swfont_end+0x49>,a0
    17ee:	43ef 0030      	lea 48(sp),a1
    17f2:	45f9 0000 2aa4 	lea 2aa4 <PutChar>,a2
    17f8:	47ef 0034      	lea 52(sp),a3
    17fc:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1800:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1806:	4eae ffc4      	jsr -60(a6)
    180a:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1810:	2200           	move.l d0,d1
    1812:	240b           	move.l a3,d2
    1814:	7664           	moveq #100,d3
    1816:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    181a:	206f 009c      	movea.l 156(sp),a0
    181e:	7000           	moveq #0,d0
    1820:	3028 002a      	move.w 42(a0),d0
    1824:	2f00           	move.l d0,-(sp)
    1826:	3039 0000 5bca 	move.w 5bca <destlinezoom2+0x2a>,d0
    182c:	2f00           	move.l d0,-(sp)
    182e:	4879 0000 32e3 	pea 32e3 <incbin_swfont_end+0x79>
    1834:	4eba fe92      	jsr 16c8 <KPrintF>(pc)
    1838:	4fef 000c      	lea 12(sp),sp
}
    183c:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1840:	4fef 006c      	lea 108(sp),sp
    1844:	4e75           	rts

00001846 <TestRow.constprop.2>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1846:	4fef ff94      	lea -108(sp),sp
    184a:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    184e:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    1854:	3c2f 002e      	move.w 46(sp),d6
  char str[ 100] = { 0 };
    1858:	7a34           	moveq #52,d5
    185a:	da8f           	add.l sp,d5
    185c:	4878 0064      	pea 64 <main+0x5e>
    1860:	42a7           	clr.l -(sp)
    1862:	2f05           	move.l d5,-(sp)
    1864:	4eba 1050      	jsr 28b6 <memset>(pc)
  data[1] = numberofline;
    1868:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    186e:	4fef 000c      	lea 12(sp),sp
  destination += 0;
    1872:	2a6f 009c      	movea.l 156(sp),a5
  for(int i=0;i<21;i++) {
    1876:	7800           	moveq #0,d4
  testpattern += 0;
    1878:	49f9 0000 5b74 	lea 5b74 <destlinezoom1>,a4
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    187e:	2e3c 0000 32b3 	move.l #12979,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    1884:	301c           	move.w (a4)+,d0
    1886:	bd40           	eor.w d6,d0
    1888:	b05d           	cmp.w (a5)+,d0
    188a:	6736           	beq.s 18c2 <TestRow.constprop.2+0x7c>
      data[0] = i;
    188c:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1890:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    1896:	2047           	movea.l d7,a0
    1898:	43ef 0030      	lea 48(sp),a1
    189c:	45f9 0000 2aa4 	lea 2aa4 <PutChar>,a2
    18a2:	2645           	movea.l d5,a3
    18a4:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    18a8:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    18ae:	4eae ffc4      	jsr -60(a6)
    18b2:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    18b8:	2200           	move.l d0,d1
    18ba:	2405           	move.l d5,d2
    18bc:	7664           	moveq #100,d3
    18be:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    18c2:	5284           	addq.l #1,d4
    18c4:	b9fc 0000 5b9e 	cmpa.l #23454,a4
    18ca:	66b8           	bne.s 1884 <TestRow.constprop.2+0x3e>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    18cc:	3039 0000 5b9e 	move.w 5b9e <destlinezoom1+0x2a>,d0
    18d2:	322f 002e      	move.w 46(sp),d1
    18d6:	b340           	eor.w d1,d0
    18d8:	206f 009c      	movea.l 156(sp),a0
    18dc:	3228 002a      	move.w 42(a0),d1
    18e0:	b340           	eor.w d1,d0
    18e2:	0240 ff00      	andi.w #-256,d0
    18e6:	660a           	bne.s 18f2 <TestRow.constprop.2+0xac>
}
    18e8:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    18ec:	4fef 006c      	lea 108(sp),sp
    18f0:	4e75           	rts
    data[0] = 22;
    18f2:	3f7c 0016 0030 	move.w #22,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    18f8:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    18fe:	41f9 0000 32b3 	lea 32b3 <incbin_swfont_end+0x49>,a0
    1904:	43ef 0030      	lea 48(sp),a1
    1908:	45f9 0000 2aa4 	lea 2aa4 <PutChar>,a2
    190e:	47ef 0034      	lea 52(sp),a3
    1912:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1916:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    191c:	4eae ffc4      	jsr -60(a6)
    1920:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1926:	2200           	move.l d0,d1
    1928:	240b           	move.l a3,d2
    192a:	7664           	moveq #100,d3
    192c:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1930:	206f 009c      	movea.l 156(sp),a0
    1934:	7000           	moveq #0,d0
    1936:	3028 002a      	move.w 42(a0),d0
    193a:	2f00           	move.l d0,-(sp)
    193c:	3039 0000 5b9e 	move.w 5b9e <destlinezoom1+0x2a>,d0
    1942:	2f00           	move.l d0,-(sp)
    1944:	4879 0000 32e3 	pea 32e3 <incbin_swfont_end+0x79>
    194a:	4eba fd7c      	jsr 16c8 <KPrintF>(pc)
    194e:	4fef 000c      	lea 12(sp),sp
}
    1952:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1956:	4fef 006c      	lea 108(sp),sp
    195a:	4e75           	rts

0000195c <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    195c:	202f 0008      	move.l 8(sp),d0
    1960:	d080           	add.l d0,d0
    1962:	d080           	add.l d0,d0
    1964:	206f 0004      	movea.l 4(sp),a0
    1968:	2030 0800      	move.l (0,a0,d0.l),d0
    196c:	b0af 000c      	cmp.l 12(sp),d0
    1970:	57c0           	seq d0
    1972:	4880           	ext.w d0
    1974:	48c0           	ext.l d0
}
    1976:	4480           	neg.l d0
    1978:	4e75           	rts

0000197a <TestCopperlistBatch>:
                                                                  long length) {
    197a:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    197e:	246f 0010      	movea.l 16(sp),a2
    1982:	206f 0014      	movea.l 20(sp),a0
    1986:	226f 0018      	movea.l 24(sp),a1
    198a:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    198e:	2008           	move.l a0,d0
    1990:	d088           	add.l a0,d0
    1992:	d080           	add.l d0,d0
    1994:	2411           	move.l (a1),d2
    1996:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    199a:	6600 01ac      	bne.w 1b48 <TestCopperlistBatch+0x1ce>
    199e:	2008           	move.l a0,d0
    19a0:	5280           	addq.l #1,d0
    19a2:	d080           	add.l d0,d0
    19a4:	d080           	add.l d0,d0
    19a6:	2032 0800      	move.l (0,a2,d0.l),d0
    19aa:	b0a9 0004      	cmp.l 4(a1),d0
    19ae:	6600 0198      	bne.w 1b48 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    19b2:	7002           	moveq #2,d0
    19b4:	b081           	cmp.l d1,d0
    19b6:	6700 0188      	beq.w 1b40 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    19ba:	2008           	move.l a0,d0
    19bc:	5480           	addq.l #2,d0
    19be:	d080           	add.l d0,d0
    19c0:	d080           	add.l d0,d0
    19c2:	2032 0800      	move.l (0,a2,d0.l),d0
    19c6:	b0a9 0008      	cmp.l 8(a1),d0
    19ca:	6600 017c      	bne.w 1b48 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    19ce:	7403           	moveq #3,d2
    19d0:	b481           	cmp.l d1,d2
    19d2:	6700 016c      	beq.w 1b40 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    19d6:	2008           	move.l a0,d0
    19d8:	5680           	addq.l #3,d0
    19da:	d080           	add.l d0,d0
    19dc:	d080           	add.l d0,d0
    19de:	2032 0800      	move.l (0,a2,d0.l),d0
    19e2:	b0a9 000c      	cmp.l 12(a1),d0
    19e6:	6600 0160      	bne.w 1b48 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    19ea:	7004           	moveq #4,d0
    19ec:	b081           	cmp.l d1,d0
    19ee:	6700 0150      	beq.w 1b40 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    19f2:	2008           	move.l a0,d0
    19f4:	5880           	addq.l #4,d0
    19f6:	d080           	add.l d0,d0
    19f8:	d080           	add.l d0,d0
    19fa:	2032 0800      	move.l (0,a2,d0.l),d0
    19fe:	b0a9 0010      	cmp.l 16(a1),d0
    1a02:	6600 0144      	bne.w 1b48 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1a06:	7405           	moveq #5,d2
    1a08:	b481           	cmp.l d1,d2
    1a0a:	6700 0134      	beq.w 1b40 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1a0e:	2008           	move.l a0,d0
    1a10:	5a80           	addq.l #5,d0
    1a12:	d080           	add.l d0,d0
    1a14:	d080           	add.l d0,d0
    1a16:	2032 0800      	move.l (0,a2,d0.l),d0
    1a1a:	b0a9 0014      	cmp.l 20(a1),d0
    1a1e:	6600 0128      	bne.w 1b48 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1a22:	7006           	moveq #6,d0
    1a24:	b081           	cmp.l d1,d0
    1a26:	6700 0118      	beq.w 1b40 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1a2a:	2008           	move.l a0,d0
    1a2c:	5c80           	addq.l #6,d0
    1a2e:	d080           	add.l d0,d0
    1a30:	d080           	add.l d0,d0
    1a32:	2032 0800      	move.l (0,a2,d0.l),d0
    1a36:	b0a9 0018      	cmp.l 24(a1),d0
    1a3a:	6600 010c      	bne.w 1b48 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1a3e:	7407           	moveq #7,d2
    1a40:	b481           	cmp.l d1,d2
    1a42:	6700 00fc      	beq.w 1b40 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1a46:	2008           	move.l a0,d0
    1a48:	5e80           	addq.l #7,d0
    1a4a:	d080           	add.l d0,d0
    1a4c:	d080           	add.l d0,d0
    1a4e:	2032 0800      	move.l (0,a2,d0.l),d0
    1a52:	b0a9 001c      	cmp.l 28(a1),d0
    1a56:	6600 00f0      	bne.w 1b48 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1a5a:	7008           	moveq #8,d0
    1a5c:	b081           	cmp.l d1,d0
    1a5e:	6700 00e0      	beq.w 1b40 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1a62:	2008           	move.l a0,d0
    1a64:	5080           	addq.l #8,d0
    1a66:	d080           	add.l d0,d0
    1a68:	d080           	add.l d0,d0
    1a6a:	2032 0800      	move.l (0,a2,d0.l),d0
    1a6e:	b0a9 0020      	cmp.l 32(a1),d0
    1a72:	6600 00d4      	bne.w 1b48 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1a76:	7409           	moveq #9,d2
    1a78:	b481           	cmp.l d1,d2
    1a7a:	6700 00c4      	beq.w 1b40 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1a7e:	47e8 0009      	lea 9(a0),a3
    1a82:	200b           	move.l a3,d0
    1a84:	d08b           	add.l a3,d0
    1a86:	d080           	add.l d0,d0
    1a88:	2032 0800      	move.l (0,a2,d0.l),d0
    1a8c:	b0a9 0024      	cmp.l 36(a1),d0
    1a90:	6600 00b6      	bne.w 1b48 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1a94:	700a           	moveq #10,d0
    1a96:	b081           	cmp.l d1,d0
    1a98:	6700 00a6      	beq.w 1b40 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1a9c:	47e8 000a      	lea 10(a0),a3
    1aa0:	200b           	move.l a3,d0
    1aa2:	d08b           	add.l a3,d0
    1aa4:	d080           	add.l d0,d0
    1aa6:	2032 0800      	move.l (0,a2,d0.l),d0
    1aaa:	b0a9 0028      	cmp.l 40(a1),d0
    1aae:	6600 0098      	bne.w 1b48 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1ab2:	740b           	moveq #11,d2
    1ab4:	b481           	cmp.l d1,d2
    1ab6:	6700 0088      	beq.w 1b40 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1aba:	47e8 000b      	lea 11(a0),a3
    1abe:	200b           	move.l a3,d0
    1ac0:	d08b           	add.l a3,d0
    1ac2:	d080           	add.l d0,d0
    1ac4:	2032 0800      	move.l (0,a2,d0.l),d0
    1ac8:	b0a9 002c      	cmp.l 44(a1),d0
    1acc:	667a           	bne.s 1b48 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1ace:	700c           	moveq #12,d0
    1ad0:	b081           	cmp.l d1,d0
    1ad2:	676c           	beq.s 1b40 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1ad4:	47e8 000c      	lea 12(a0),a3
    1ad8:	200b           	move.l a3,d0
    1ada:	d08b           	add.l a3,d0
    1adc:	d080           	add.l d0,d0
    1ade:	2032 0800      	move.l (0,a2,d0.l),d0
    1ae2:	b0a9 0030      	cmp.l 48(a1),d0
    1ae6:	6660           	bne.s 1b48 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1ae8:	740d           	moveq #13,d2
    1aea:	b481           	cmp.l d1,d2
    1aec:	6752           	beq.s 1b40 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1aee:	47e8 000d      	lea 13(a0),a3
    1af2:	200b           	move.l a3,d0
    1af4:	d08b           	add.l a3,d0
    1af6:	d080           	add.l d0,d0
    1af8:	2032 0800      	move.l (0,a2,d0.l),d0
    1afc:	b0a9 0034      	cmp.l 52(a1),d0
    1b00:	6646           	bne.s 1b48 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b02:	700e           	moveq #14,d0
    1b04:	b081           	cmp.l d1,d0
    1b06:	6738           	beq.s 1b40 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b08:	47e8 000e      	lea 14(a0),a3
    1b0c:	200b           	move.l a3,d0
    1b0e:	d08b           	add.l a3,d0
    1b10:	d080           	add.l d0,d0
    1b12:	2032 0800      	move.l (0,a2,d0.l),d0
    1b16:	b0a9 0038      	cmp.l 56(a1),d0
    1b1a:	662c           	bne.s 1b48 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b1c:	7410           	moveq #16,d2
    1b1e:	b481           	cmp.l d1,d2
    1b20:	661e           	bne.s 1b40 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b22:	41e8 000f      	lea 15(a0),a0
    1b26:	d1c8           	adda.l a0,a0
    1b28:	d1c8           	adda.l a0,a0
    1b2a:	2070 a800      	movea.l (0,a0,a2.l),a0
    1b2e:	b1e9 003c      	cmpa.l 60(a1),a0
    1b32:	57c0           	seq d0
    1b34:	4880           	ext.w d0
    1b36:	48c0           	ext.l d0
    1b38:	4480           	neg.l d0
}
    1b3a:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1b3e:	4e75           	rts
  return 1;
    1b40:	7001           	moveq #1,d0
}
    1b42:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1b46:	4e75           	rts
      return 0;
    1b48:	7000           	moveq #0,d0
}
    1b4a:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1b4e:	4e75           	rts

00001b50 <ClBuild>:
ULONG * ClbuildSW() {
    1b50:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    1b54:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    1b5a:	707b           	moveq #123,d0
    1b5c:	4600           	not.b d0
    1b5e:	7202           	moveq #2,d1
    1b60:	4eae ff3a      	jsr -198(a6)
    1b64:	2440           	movea.l d0,a2
  if( retval == 0) {
    1b66:	4a80           	tst.l d0
    1b68:	6700 010e      	beq.w 1c78 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    1b6c:	24b9 0000 5b34 	move.l 5b34 <ClsSprites>,(a2)
    1b72:	2579 0000 5b38 	move.l 5b38 <ClsSprites+0x4>,4(a2)
    1b78:	0004 
    1b7a:	2579 0000 5b3c 	move.l 5b3c <ClsSprites+0x8>,8(a2)
    1b80:	0008 
    1b82:	2579 0000 5b40 	move.l 5b40 <ClsSprites+0xc>,12(a2)
    1b88:	000c 
    1b8a:	2579 0000 5b44 	move.l 5b44 <ClsSprites+0x10>,16(a2)
    1b90:	0010 
    1b92:	2579 0000 5b48 	move.l 5b48 <ClsSprites+0x14>,20(a2)
    1b98:	0014 
    1b9a:	2579 0000 5b4c 	move.l 5b4c <ClsSprites+0x18>,24(a2)
    1ba0:	0018 
    1ba2:	2579 0000 5b50 	move.l 5b50 <ClsSprites+0x1c>,28(a2)
    1ba8:	001c 
    1baa:	2579 0000 5b54 	move.l 5b54 <ClsSprites+0x20>,32(a2)
    1bb0:	0020 
    1bb2:	2579 0000 5b58 	move.l 5b58 <ClsSprites+0x24>,36(a2)
    1bb8:	0024 
    1bba:	2579 0000 5b5c 	move.l 5b5c <ClsSprites+0x28>,40(a2)
    1bc0:	0028 
    1bc2:	2579 0000 5b60 	move.l 5b60 <ClsSprites+0x2c>,44(a2)
    1bc8:	002c 
    1bca:	2579 0000 5b64 	move.l 5b64 <ClsSprites+0x30>,48(a2)
    1bd0:	0030 
    1bd2:	2579 0000 5b68 	move.l 5b68 <ClsSprites+0x34>,52(a2)
    1bd8:	0034 
    1bda:	2579 0000 5b6c 	move.l 5b6c <ClsSprites+0x38>,56(a2)
    1be0:	0038 
    1be2:	2579 0000 5b70 	move.l 5b70 <ClsSprites+0x3c>,60(a2)
    1be8:	003c 
    *cl++ = *clpartinstruction++;
    1bea:	2579 0000 5b04 	move.l 5b04 <ClScreen>,64(a2)
    1bf0:	0040 
    1bf2:	2579 0000 5b08 	move.l 5b08 <ClScreen+0x4>,68(a2)
    1bf8:	0044 
    1bfa:	2579 0000 5b0c 	move.l 5b0c <ClScreen+0x8>,72(a2)
    1c00:	0048 
    1c02:	2579 0000 5b10 	move.l 5b10 <ClScreen+0xc>,76(a2)
    1c08:	004c 
    1c0a:	2579 0000 5b14 	move.l 5b14 <ClScreen+0x10>,80(a2)
    1c10:	0050 
    1c12:	2579 0000 5b18 	move.l 5b18 <ClScreen+0x14>,84(a2)
    1c18:	0054 
    1c1a:	2579 0000 5b1c 	move.l 5b1c <ClScreen+0x18>,88(a2)
    1c20:	0058 
    1c22:	2579 0000 5b20 	move.l 5b20 <ClScreen+0x1c>,92(a2)
    1c28:	005c 
    1c2a:	2579 0000 5b24 	move.l 5b24 <ClScreen+0x20>,96(a2)
    1c30:	0060 
    1c32:	2579 0000 5b28 	move.l 5b28 <ClScreen+0x24>,100(a2)
    1c38:	0064 
    1c3a:	2579 0000 5b2c 	move.l 5b2c <ClScreen+0x28>,104(a2)
    1c40:	0068 
    1c42:	2579 0000 5b30 	move.l 5b30 <ClScreen+0x2c>,108(a2)
    1c48:	006c 
  *cl++ = 0x00e00000;
    1c4a:	257c 00e0 0000 	move.l #14680064,112(a2)
    1c50:	0070 
  *cl++ = 0x00e20000;
    1c52:	257c 00e2 0000 	move.l #14811136,116(a2)
    1c58:	0074 
    *cl++ = *clpartinstruction++;
    1c5a:	2579 0000 5afc 	move.l 5afc <ClColor>,120(a2)
    1c60:	0078 
    1c62:	2579 0000 5b00 	move.l 5b00 <ClColor+0x4>,124(a2)
    1c68:	007c 
  *cl = 0xfffffffe;
    1c6a:	70fe           	moveq #-2,d0
    1c6c:	2540 0080      	move.l d0,128(a2)
}
    1c70:	200a           	move.l a2,d0
    1c72:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1c76:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1c78:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1c7e:	4eae ffc4      	jsr -60(a6)
    1c82:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1c88:	2200           	move.l d0,d1
    1c8a:	243c 0000 3309 	move.l #13065,d2
    1c90:	7628           	moveq #40,d3
    1c92:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1c96:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    1c9c:	7201           	moveq #1,d1
    1c9e:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1ca2:	24b9 0000 5b34 	move.l 5b34 <ClsSprites>,(a2)
    1ca8:	2579 0000 5b38 	move.l 5b38 <ClsSprites+0x4>,4(a2)
    1cae:	0004 
    1cb0:	2579 0000 5b3c 	move.l 5b3c <ClsSprites+0x8>,8(a2)
    1cb6:	0008 
    1cb8:	2579 0000 5b40 	move.l 5b40 <ClsSprites+0xc>,12(a2)
    1cbe:	000c 
    1cc0:	2579 0000 5b44 	move.l 5b44 <ClsSprites+0x10>,16(a2)
    1cc6:	0010 
    1cc8:	2579 0000 5b48 	move.l 5b48 <ClsSprites+0x14>,20(a2)
    1cce:	0014 
    1cd0:	2579 0000 5b4c 	move.l 5b4c <ClsSprites+0x18>,24(a2)
    1cd6:	0018 
    1cd8:	2579 0000 5b50 	move.l 5b50 <ClsSprites+0x1c>,28(a2)
    1cde:	001c 
    1ce0:	2579 0000 5b54 	move.l 5b54 <ClsSprites+0x20>,32(a2)
    1ce6:	0020 
    1ce8:	2579 0000 5b58 	move.l 5b58 <ClsSprites+0x24>,36(a2)
    1cee:	0024 
    1cf0:	2579 0000 5b5c 	move.l 5b5c <ClsSprites+0x28>,40(a2)
    1cf6:	0028 
    1cf8:	2579 0000 5b60 	move.l 5b60 <ClsSprites+0x2c>,44(a2)
    1cfe:	002c 
    1d00:	2579 0000 5b64 	move.l 5b64 <ClsSprites+0x30>,48(a2)
    1d06:	0030 
    1d08:	2579 0000 5b68 	move.l 5b68 <ClsSprites+0x34>,52(a2)
    1d0e:	0034 
    1d10:	2579 0000 5b6c 	move.l 5b6c <ClsSprites+0x38>,56(a2)
    1d16:	0038 
    1d18:	2579 0000 5b70 	move.l 5b70 <ClsSprites+0x3c>,60(a2)
    1d1e:	003c 
    *cl++ = *clpartinstruction++;
    1d20:	2579 0000 5b04 	move.l 5b04 <ClScreen>,64(a2)
    1d26:	0040 
    1d28:	2579 0000 5b08 	move.l 5b08 <ClScreen+0x4>,68(a2)
    1d2e:	0044 
    1d30:	2579 0000 5b0c 	move.l 5b0c <ClScreen+0x8>,72(a2)
    1d36:	0048 
    1d38:	2579 0000 5b10 	move.l 5b10 <ClScreen+0xc>,76(a2)
    1d3e:	004c 
    1d40:	2579 0000 5b14 	move.l 5b14 <ClScreen+0x10>,80(a2)
    1d46:	0050 
    1d48:	2579 0000 5b18 	move.l 5b18 <ClScreen+0x14>,84(a2)
    1d4e:	0054 
    1d50:	2579 0000 5b1c 	move.l 5b1c <ClScreen+0x18>,88(a2)
    1d56:	0058 
    1d58:	2579 0000 5b20 	move.l 5b20 <ClScreen+0x1c>,92(a2)
    1d5e:	005c 
    1d60:	2579 0000 5b24 	move.l 5b24 <ClScreen+0x20>,96(a2)
    1d66:	0060 
    1d68:	2579 0000 5b28 	move.l 5b28 <ClScreen+0x24>,100(a2)
    1d6e:	0064 
    1d70:	2579 0000 5b2c 	move.l 5b2c <ClScreen+0x28>,104(a2)
    1d76:	0068 
    1d78:	2579 0000 5b30 	move.l 5b30 <ClScreen+0x2c>,108(a2)
    1d7e:	006c 
  *cl++ = 0x00e00000;
    1d80:	257c 00e0 0000 	move.l #14680064,112(a2)
    1d86:	0070 
  *cl++ = 0x00e20000;
    1d88:	257c 00e2 0000 	move.l #14811136,116(a2)
    1d8e:	0074 
    *cl++ = *clpartinstruction++;
    1d90:	2579 0000 5afc 	move.l 5afc <ClColor>,120(a2)
    1d96:	0078 
    1d98:	2579 0000 5b00 	move.l 5b00 <ClColor+0x4>,124(a2)
    1d9e:	007c 
  *cl = 0xfffffffe;
    1da0:	70fe           	moveq #-2,d0
    1da2:	2540 0080      	move.l d0,128(a2)
}
    1da6:	200a           	move.l a2,d0
    1da8:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1dac:	4e75           	rts

00001dae <Zoom_ZoomIntoPicture>:
void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr) {
    1dae:	4fef ffe0      	lea -32(sp),sp
    1db2:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1db6:	202f 0058      	move.l 88(sp),d0
  UWORD nextzoom = 352-28 + (zoomnr << 3);
    1dba:	3200           	move.w d0,d1
    1dbc:	e749           	lsl.w #3,d1
    1dbe:	0641 0144      	addi.w #324,d1
    1dc2:	3f41 0040      	move.w d1,64(sp)
    ZoomHorizontal = 16 - zoomnr * 6;
    1dc6:	3200           	move.w d0,d1
    1dc8:	d240           	add.w d0,d1
    1dca:	3041           	movea.w d1,a0
    1dcc:	d0c0           	adda.w d0,a0
    1dce:	d0c8           	adda.w a0,a0
    1dd0:	7410           	moveq #16,d2
    1dd2:	9448           	sub.w a0,d2
    1dd4:	3f42 0042      	move.w d2,66(sp)
        ZoomHorizontal = 16 - zoomnr + (zoomnr << 1);
    1dd8:	9240           	sub.w d0,d1
    1dda:	3a41           	movea.w d1,a5
    1ddc:	4bed 0010      	lea 16(a5),a5
    1de0:	242f 0050      	move.l 80(sp),d2
    1de4:	0682 0000 01ac 	addi.l #428,d2
    1dea:	2f42 0038      	move.l d2,56(sp)
    1dee:	742c           	moveq #44,d2
    1df0:	d4af 0054      	add.l 84(sp),d2
    1df4:	2f42 003c      	move.l d2,60(sp)
  UWORD shifttoleft = 0;
    1df8:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 336;
    1dfc:	3f7c 0150 0036 	move.w #336,54(sp)
  WORD shiftright = 7;
    1e02:	3f7c 0007 002e 	move.w #7,46(sp)
      nextzoom -= (21 + zoomnr);
    1e08:	74eb           	moveq #-21,d2
    1e0a:	9440           	sub.w d0,d2
    1e0c:	3f42 004a      	move.w d2,74(sp)
    *bp = 0;
    1e10:	4278 0200      	clr.w 200 <main+0x1fa>
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*8-2-i;
    1e14:	262f 0038      	move.l 56(sp),d3
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1e18:	246f 003c      	movea.l 60(sp),a2
    ZoomHorizontal = 16 - zoomnr * 6;
    1e1c:	33ef 0042 0000 	move.w 66(sp),5c2a <ZoomHorizontal>
    1e22:	5c2a 
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1e24:	7000           	moveq #0,d0
    1e26:	302f 0046      	move.w 70(sp),d0
    1e2a:	2640           	movea.l d0,a3
    1e2c:	d7c0           	adda.l d0,a3
    1e2e:	3f6f 002e 0048 	move.w 46(sp),72(sp)
    1e34:	342f 002e      	move.w 46(sp),d2
    1e38:	700c           	moveq #12,d0
    1e3a:	e16a           	lsl.w d0,d2
    1e3c:	3f42 0030      	move.w d2,48(sp)
    1e40:	342f 0040      	move.w 64(sp),d2
    1e44:	b46f 0036      	cmp.w 54(sp),d2
    1e48:	6200 018e      	bhi.w 1fd8 <Zoom_ZoomIntoPicture+0x22a>
  hw->bltcon0 = 0x9f0 + shiftright;
    1e4c:	3e2f 0030      	move.w 48(sp),d7
    1e50:	0647 09f0      	addi.w #2544,d7
    1e54:	342f 0042      	move.w 66(sp),d2
    1e58:	7a10           	moveq #16,d5
    UWORD linesleft = 272;
    1e5a:	383c 0110      	move.w #272,d4
    1e5e:	2c03           	move.l d3,d6
    1e60:	dc8b           	add.l a3,d6
        if( linesleft >= ZoomHorizontal+1) {
    1e62:	b842           	cmp.w d2,d4
    1e64:	6300 00be      	bls.w 1f24 <Zoom_ZoomIntoPicture+0x176>
          linesleft -= ZoomHorizontal;
    1e68:	9842           	sub.w d2,d4
  WaitBlit();
    1e6a:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
    1e70:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    1e74:	2079 0000 5c22 	movea.l 5c22 <hw>,a0
    1e7a:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    1e80:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
    1e84:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1e8a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1e90:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1e96:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    1e9c:	2146 0050      	move.l d6,80(a0)
  hw->bltdpt = (UWORD *) destination;
    1ea0:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    1ea4:	ed4a           	lsl.w #6,d2
    1ea6:	5442           	addq.w #2,d2
    1ea8:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    1eac:	7200           	moveq #0,d1
    1eae:	3239 0000 5c2a 	move.w 5c2a <ZoomHorizontal>,d1
    1eb4:	2001           	move.l d1,d0
    1eb6:	d081           	add.l d1,d0
    1eb8:	d081           	add.l d1,d0
    1eba:	e988           	lsl.l #4,d0
    1ebc:	d680           	add.l d0,d3
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    1ebe:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    1ec0:	4a44           	tst.w d4
    1ec2:	6700 00c6      	beq.w 1f8a <Zoom_ZoomIntoPicture+0x1dc>
          Zoom_CopyWord( pos4source+shifttoleft, pos4dest, shiftright, 1);
    1ec6:	2c03           	move.l d3,d6
    1ec8:	dc8b           	add.l a3,d6
  WaitBlit();
    1eca:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
    1ed0:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    1ed4:	2079 0000 5c22 	movea.l 5c22 <hw>,a0
    1eda:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    1ee0:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
    1ee4:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1eea:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1ef0:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1ef6:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    1efc:	2146 0050      	move.l d6,80(a0)
  hw->bltdpt = (UWORD *) destination;
    1f00:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    1f04:	317c 0042 0058 	move.w #66,88(a0)
          linesleft--;
    1f0a:	5344           	subq.w #1,d4
          pos4dest += ZMLINESIZE/2;
    1f0c:	45ea 0030      	lea 48(a2),a2
        ZoomHorizontal = 16 - zoomnr + (zoomnr << 1);
    1f10:	33cd 0000 5c2a 	move.w a5,5c2a <ZoomHorizontal>
    1f16:	5385           	subq.l #1,d5
      for(int i=0;i<16;i++) {
    1f18:	6700 009c      	beq.w 1fb6 <Zoom_ZoomIntoPicture+0x208>
  WORD shiftright = 7;
    1f1c:	340d           	move.w a5,d2
        if( linesleft >= ZoomHorizontal+1) {
    1f1e:	b842           	cmp.w d2,d4
    1f20:	6200 ff46      	bhi.w 1e68 <Zoom_ZoomIntoPicture+0xba>
          ZoomHorizontal = linesleft;
    1f24:	33c4 0000 5c2a 	move.w d4,5c2a <ZoomHorizontal>
    1f2a:	3404           	move.w d4,d2
          linesleft = 0;
    1f2c:	4244           	clr.w d4
  WaitBlit();
    1f2e:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
    1f34:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    1f38:	2079 0000 5c22 	movea.l 5c22 <hw>,a0
    1f3e:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    1f44:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
    1f48:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1f4e:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1f54:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1f5a:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    1f60:	2146 0050      	move.l d6,80(a0)
  hw->bltdpt = (UWORD *) destination;
    1f64:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    1f68:	ed4a           	lsl.w #6,d2
    1f6a:	5442           	addq.w #2,d2
    1f6c:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    1f70:	7200           	moveq #0,d1
    1f72:	3239 0000 5c2a 	move.w 5c2a <ZoomHorizontal>,d1
    1f78:	2001           	move.l d1,d0
    1f7a:	d081           	add.l d1,d0
    1f7c:	d081           	add.l d1,d0
    1f7e:	e988           	lsl.l #4,d0
    1f80:	d680           	add.l d0,d3
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    1f82:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    1f84:	4a44           	tst.w d4
    1f86:	6600 ff3e      	bne.w 1ec6 <Zoom_ZoomIntoPicture+0x118>
        ZoomHorizontal = 16 - zoomnr + (zoomnr << 1);
    1f8a:	33cd 0000 5c2a 	move.w a5,5c2a <ZoomHorizontal>
    1f90:	5385           	subq.l #1,d5
      for(int i=0;i<16;i++) {
    1f92:	6722           	beq.s 1fb6 <Zoom_ZoomIntoPicture+0x208>
    1f94:	2c03           	move.l d3,d6
    1f96:	dc8b           	add.l a3,d6
  WORD shiftright = 7;
    1f98:	340d           	move.w a5,d2
    1f9a:	6082           	bra.s 1f1e <Zoom_ZoomIntoPicture+0x170>
      shiftright--;  
    1f9c:	3f6f 0044 002e 	move.w 68(sp),46(sp)
      if(shiftright < 0) {
    1fa2:	6c12           	bge.s 1fb6 <Zoom_ZoomIntoPicture+0x208>
        shiftright += 16;
    1fa4:	342f 0048      	move.w 72(sp),d2
    1fa8:	0642 000f      	addi.w #15,d2
    1fac:	3f42 002e      	move.w d2,46(sp)
        shifttoleft = 1;
    1fb0:	3f7c 0001 0046 	move.w #1,70(sp)
    startofword -= 16;
    1fb6:	066f fff0 0036 	addi.w #-16,54(sp)
    1fbc:	55af 0038      	subq.l #2,56(sp)
    1fc0:	55af 003c      	subq.l #2,60(sp)
  for(int i=0;i<22;i++) {
    1fc4:	0c6f fff0 0036 	cmpi.w #-16,54(sp)
    1fca:	6600 fe44      	bne.w 1e10 <Zoom_ZoomIntoPicture+0x62>
}
    1fce:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1fd2:	4fef 0020      	lea 32(sp),sp
    1fd6:	4e75           	rts
    1fd8:	3002           	move.w d2,d0
      UWORD colnr = nextzoom - startofword - 1; 
    1fda:	5340           	subq.w #1,d0
    1fdc:	906f 0036      	sub.w 54(sp),d0
      nextzoom -= (21 + zoomnr);
    1fe0:	342f 004a      	move.w 74(sp),d2
    1fe4:	d56f 0040      	add.w d2,64(sp)
    shifta = (shift - 1) << 12;
    1fe8:	342f 002e      	move.w 46(sp),d2
    1fec:	5342           	subq.w #1,d2
    1fee:	3f42 0044      	move.w d2,68(sp)
    1ff2:	3202           	move.w d2,d1
    1ff4:	740c           	moveq #12,d2
    1ff6:	e569           	lsl.w d2,d1
  hw->bltcon0 = 0xde4 + shifta;
    1ff8:	387c f000      	movea.w #-4096,a4
    1ffc:	4a6f 002e      	tst.w 46(sp)
    2000:	6702           	beq.s 2004 <Zoom_ZoomIntoPicture+0x256>
    2002:	3841           	movea.w d1,a4
    2004:	49ec 0de4      	lea 3556(a4),a4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    2008:	0280 0000 ffff 	andi.l #65535,d0
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    200e:	7210           	moveq #16,d1
    2010:	9280           	sub.l d0,d1
    2012:	7400           	moveq #0,d2
    2014:	4642           	not.w d2
    2016:	e3aa           	lsl.l d1,d2
    2018:	3f42 0034      	move.w d2,52(sp)
    201c:	342f 0042      	move.w 66(sp),d2
    2020:	7a10           	moveq #16,d5
    UWORD linesleft = 272;
    2022:	383c 0110      	move.w #272,d4
        if( linesleft >= ZoomHorizontal+1) {
    2026:	b842           	cmp.w d2,d4
    2028:	6300 0090      	bls.w 20ba <Zoom_ZoomIntoPicture+0x30c>
          linesleft -= ZoomHorizontal;
    202c:	9842           	sub.w d2,d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    202e:	2c03           	move.l d3,d6
    2030:	dc8b           	add.l a3,d6
    srca = source + 1;
    2032:	2e06           	move.l d6,d7
  if( shift == 0) {
    2034:	4a6f 002e      	tst.w 46(sp)
    2038:	6602           	bne.s 203c <Zoom_ZoomIntoPicture+0x28e>
    srca = source + 1;
    203a:	5487           	addq.l #2,d7
  WaitBlit();
    203c:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
    2042:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    2046:	2079 0000 5c22 	movea.l 5c22 <hw>,a0
    204c:	316f 0030 0042 	move.w 48(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    2052:	314c 0040      	move.w a4,64(a0)
  hw->bltafwm = 0xffff;
    2056:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    205c:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    2062:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    2068:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    206e:	316f 0034 0070 	move.w 52(sp),112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    2074:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
    207a:	2147 0050      	move.l d7,80(a0)
  hw->bltbpt = srcb;
    207e:	2146 004c      	move.l d6,76(a0)
  hw->bltdpt = destination;
    2082:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    2086:	ed4a           	lsl.w #6,d2
    2088:	5442           	addq.w #2,d2
    208a:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    208e:	7200           	moveq #0,d1
    2090:	3239 0000 5c2a 	move.w 5c2a <ZoomHorizontal>,d1
    2096:	2001           	move.l d1,d0
    2098:	d081           	add.l d1,d0
    209a:	d081           	add.l d1,d0
    209c:	e988           	lsl.l #4,d0
    209e:	d680           	add.l d0,d3
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    20a0:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    20a2:	4a44           	tst.w d4
    20a4:	6622           	bne.s 20c8 <Zoom_ZoomIntoPicture+0x31a>
        ZoomHorizontal = 16 - zoomnr + (zoomnr << 1);
    20a6:	33cd 0000 5c2a 	move.w a5,5c2a <ZoomHorizontal>
    20ac:	5385           	subq.l #1,d5
      for(int i=0;i<16;i++) {
    20ae:	6700 feec      	beq.w 1f9c <Zoom_ZoomIntoPicture+0x1ee>
    20b2:	340d           	move.w a5,d2
        if( linesleft >= ZoomHorizontal+1) {
    20b4:	b842           	cmp.w d2,d4
    20b6:	6200 ff74      	bhi.w 202c <Zoom_ZoomIntoPicture+0x27e>
          ZoomHorizontal = linesleft;
    20ba:	33c4 0000 5c2a 	move.w d4,5c2a <ZoomHorizontal>
    20c0:	3404           	move.w d4,d2
          linesleft = 0;
    20c2:	4244           	clr.w d4
    20c4:	6000 ff68      	bra.w 202e <Zoom_ZoomIntoPicture+0x280>
          Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    20c8:	2403           	move.l d3,d2
    20ca:	d48b           	add.l a3,d2
    srca = source + 1;
    20cc:	2c02           	move.l d2,d6
  if( shift == 0) {
    20ce:	4a6f 002e      	tst.w 46(sp)
    20d2:	6602           	bne.s 20d6 <Zoom_ZoomIntoPicture+0x328>
    srca = source + 1;
    20d4:	5486           	addq.l #2,d6
  WaitBlit();
    20d6:	2c79 0000 5c26 	movea.l 5c26 <GfxBase>,a6
    20dc:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    20e0:	2079 0000 5c22 	movea.l 5c22 <hw>,a0
    20e6:	316f 0030 0042 	move.w 48(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    20ec:	314c 0040      	move.w a4,64(a0)
  hw->bltafwm = 0xffff;
    20f0:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    20f6:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    20fc:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    2102:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    2108:	316f 0034 0070 	move.w 52(sp),112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    210e:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
    2114:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = srcb;
    2118:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = destination;
    211c:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    2120:	317c 0042 0058 	move.w #66,88(a0)
          pos4dest += ZMLINESIZE/2;
    2126:	45ea 0030      	lea 48(a2),a2
          linesleft--;
    212a:	5344           	subq.w #1,d4
    212c:	6000 ff78      	bra.w 20a6 <Zoom_ZoomIntoPicture+0x2f8>

00002130 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    2130:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    2134:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    213a:	203c 0000 a48c 	move.l #42124,d0
    2140:	7202           	moveq #2,d1
    2142:	4eae ff3a      	jsr -198(a6)
    2146:	2440           	movea.l d0,a2
  if( retval == 0) {
    2148:	4a80           	tst.l d0
    214a:	6700 0160      	beq.w 22ac <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    214e:	24b9 0000 5b34 	move.l 5b34 <ClsSprites>,(a2)
    2154:	2579 0000 5b38 	move.l 5b38 <ClsSprites+0x4>,4(a2)
    215a:	0004 
    215c:	2579 0000 5b3c 	move.l 5b3c <ClsSprites+0x8>,8(a2)
    2162:	0008 
    2164:	2579 0000 5b40 	move.l 5b40 <ClsSprites+0xc>,12(a2)
    216a:	000c 
    216c:	2579 0000 5b44 	move.l 5b44 <ClsSprites+0x10>,16(a2)
    2172:	0010 
    2174:	2579 0000 5b48 	move.l 5b48 <ClsSprites+0x14>,20(a2)
    217a:	0014 
    217c:	2579 0000 5b4c 	move.l 5b4c <ClsSprites+0x18>,24(a2)
    2182:	0018 
    2184:	2579 0000 5b50 	move.l 5b50 <ClsSprites+0x1c>,28(a2)
    218a:	001c 
    218c:	2579 0000 5b54 	move.l 5b54 <ClsSprites+0x20>,32(a2)
    2192:	0020 
    2194:	2579 0000 5b58 	move.l 5b58 <ClsSprites+0x24>,36(a2)
    219a:	0024 
    219c:	2579 0000 5b5c 	move.l 5b5c <ClsSprites+0x28>,40(a2)
    21a2:	0028 
    21a4:	2579 0000 5b60 	move.l 5b60 <ClsSprites+0x2c>,44(a2)
    21aa:	002c 
    21ac:	2579 0000 5b64 	move.l 5b64 <ClsSprites+0x30>,48(a2)
    21b2:	0030 
    21b4:	2579 0000 5b68 	move.l 5b68 <ClsSprites+0x34>,52(a2)
    21ba:	0034 
    21bc:	2579 0000 5b6c 	move.l 5b6c <ClsSprites+0x38>,56(a2)
    21c2:	0038 
    21c4:	2579 0000 5b70 	move.l 5b70 <ClsSprites+0x3c>,60(a2)
    21ca:	003c 
    *cl++ = *clpartinstruction++;
    21cc:	2579 0000 5acc 	move.l 5acc <ClScreenZoom>,64(a2)
    21d2:	0040 
    21d4:	2579 0000 5ad0 	move.l 5ad0 <ClScreenZoom+0x4>,68(a2)
    21da:	0044 
    21dc:	2579 0000 5ad4 	move.l 5ad4 <ClScreenZoom+0x8>,72(a2)
    21e2:	0048 
    21e4:	2579 0000 5ad8 	move.l 5ad8 <ClScreenZoom+0xc>,76(a2)
    21ea:	004c 
    21ec:	2579 0000 5adc 	move.l 5adc <ClScreenZoom+0x10>,80(a2)
    21f2:	0050 
    21f4:	2579 0000 5ae0 	move.l 5ae0 <ClScreenZoom+0x14>,84(a2)
    21fa:	0054 
    21fc:	2579 0000 5ae4 	move.l 5ae4 <ClScreenZoom+0x18>,88(a2)
    2202:	0058 
    2204:	2579 0000 5ae8 	move.l 5ae8 <ClScreenZoom+0x1c>,92(a2)
    220a:	005c 
    220c:	2579 0000 5aec 	move.l 5aec <ClScreenZoom+0x20>,96(a2)
    2212:	0060 
    2214:	2579 0000 5af0 	move.l 5af0 <ClScreenZoom+0x24>,100(a2)
    221a:	0064 
    221c:	2579 0000 5af4 	move.l 5af4 <ClScreenZoom+0x28>,104(a2)
    2222:	0068 
    2224:	2579 0000 5af8 	move.l 5af8 <ClScreenZoom+0x2c>,108(a2)
    222a:	006c 
  *cl++ = 0x00e00000;
    222c:	257c 00e0 0000 	move.l #14680064,112(a2)
    2232:	0070 
  *cl++ = 0x00e20000;
    2234:	257c 00e2 0000 	move.l #14811136,116(a2)
    223a:	0074 
  *cl++ = 0x00e40000;
    223c:	257c 00e4 0000 	move.l #14942208,120(a2)
    2242:	0078 
  *cl++ = 0x00e60000;
    2244:	257c 00e6 0000 	move.l #15073280,124(a2)
    224a:	007c 
    *cl++ = *clpartinstruction++;
    224c:	2579 0000 5afc 	move.l 5afc <ClColor>,128(a2)
    2252:	0080 
    2254:	2579 0000 5b00 	move.l 5b00 <ClColor+0x4>,132(a2)
    225a:	0084 
    225c:	43ea 012c      	lea 300(a2),a1
    2260:	220a           	move.l a2,d1
    2262:	0681 0000 a52c 	addi.l #42284,d1
    2268:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    226e:	41e9 ff60      	lea -160(a1),a0
    2272:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    2276:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    227c:	5088           	addq.l #8,a0
    227e:	217c 0182 0f00 	move.l #25300736,-4(a0)
    2284:	fffc 
    for(int i2=0;i2<20;i2++) {
    2286:	b3c8           	cmpa.l a0,a1
    2288:	66ec           	bne.s 2276 <ClbuildZoom+0x146>
    228a:	43e8 00a4      	lea 164(a0),a1
    228e:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    2294:	b3c1           	cmpa.l d1,a1
    2296:	66d6           	bne.s 226e <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    2298:	203c 0000 a488 	move.l #42120,d0
    229e:	72fe           	moveq #-2,d1
    22a0:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    22a4:	200a           	move.l a2,d0
    22a6:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    22aa:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    22ac:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    22b2:	4eae ffc4      	jsr -60(a6)
    22b6:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    22bc:	2200           	move.l d0,d1
    22be:	243c 0000 3309 	move.l #13065,d2
    22c4:	7628           	moveq #40,d3
    22c6:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    22ca:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    22d0:	7201           	moveq #1,d1
    22d2:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    22d6:	24b9 0000 5b34 	move.l 5b34 <ClsSprites>,(a2)
    22dc:	2579 0000 5b38 	move.l 5b38 <ClsSprites+0x4>,4(a2)
    22e2:	0004 
    22e4:	2579 0000 5b3c 	move.l 5b3c <ClsSprites+0x8>,8(a2)
    22ea:	0008 
    22ec:	2579 0000 5b40 	move.l 5b40 <ClsSprites+0xc>,12(a2)
    22f2:	000c 
    22f4:	2579 0000 5b44 	move.l 5b44 <ClsSprites+0x10>,16(a2)
    22fa:	0010 
    22fc:	2579 0000 5b48 	move.l 5b48 <ClsSprites+0x14>,20(a2)
    2302:	0014 
    2304:	2579 0000 5b4c 	move.l 5b4c <ClsSprites+0x18>,24(a2)
    230a:	0018 
    230c:	2579 0000 5b50 	move.l 5b50 <ClsSprites+0x1c>,28(a2)
    2312:	001c 
    2314:	2579 0000 5b54 	move.l 5b54 <ClsSprites+0x20>,32(a2)
    231a:	0020 
    231c:	2579 0000 5b58 	move.l 5b58 <ClsSprites+0x24>,36(a2)
    2322:	0024 
    2324:	2579 0000 5b5c 	move.l 5b5c <ClsSprites+0x28>,40(a2)
    232a:	0028 
    232c:	2579 0000 5b60 	move.l 5b60 <ClsSprites+0x2c>,44(a2)
    2332:	002c 
    2334:	2579 0000 5b64 	move.l 5b64 <ClsSprites+0x30>,48(a2)
    233a:	0030 
    233c:	2579 0000 5b68 	move.l 5b68 <ClsSprites+0x34>,52(a2)
    2342:	0034 
    2344:	2579 0000 5b6c 	move.l 5b6c <ClsSprites+0x38>,56(a2)
    234a:	0038 
    234c:	2579 0000 5b70 	move.l 5b70 <ClsSprites+0x3c>,60(a2)
    2352:	003c 
    *cl++ = *clpartinstruction++;
    2354:	2579 0000 5acc 	move.l 5acc <ClScreenZoom>,64(a2)
    235a:	0040 
    235c:	2579 0000 5ad0 	move.l 5ad0 <ClScreenZoom+0x4>,68(a2)
    2362:	0044 
    2364:	2579 0000 5ad4 	move.l 5ad4 <ClScreenZoom+0x8>,72(a2)
    236a:	0048 
    236c:	2579 0000 5ad8 	move.l 5ad8 <ClScreenZoom+0xc>,76(a2)
    2372:	004c 
    2374:	2579 0000 5adc 	move.l 5adc <ClScreenZoom+0x10>,80(a2)
    237a:	0050 
    237c:	2579 0000 5ae0 	move.l 5ae0 <ClScreenZoom+0x14>,84(a2)
    2382:	0054 
    2384:	2579 0000 5ae4 	move.l 5ae4 <ClScreenZoom+0x18>,88(a2)
    238a:	0058 
    238c:	2579 0000 5ae8 	move.l 5ae8 <ClScreenZoom+0x1c>,92(a2)
    2392:	005c 
    2394:	2579 0000 5aec 	move.l 5aec <ClScreenZoom+0x20>,96(a2)
    239a:	0060 
    239c:	2579 0000 5af0 	move.l 5af0 <ClScreenZoom+0x24>,100(a2)
    23a2:	0064 
    23a4:	2579 0000 5af4 	move.l 5af4 <ClScreenZoom+0x28>,104(a2)
    23aa:	0068 
    23ac:	2579 0000 5af8 	move.l 5af8 <ClScreenZoom+0x2c>,108(a2)
    23b2:	006c 
  *cl++ = 0x00e00000;
    23b4:	257c 00e0 0000 	move.l #14680064,112(a2)
    23ba:	0070 
  *cl++ = 0x00e20000;
    23bc:	257c 00e2 0000 	move.l #14811136,116(a2)
    23c2:	0074 
  *cl++ = 0x00e40000;
    23c4:	257c 00e4 0000 	move.l #14942208,120(a2)
    23ca:	0078 
  *cl++ = 0x00e60000;
    23cc:	257c 00e6 0000 	move.l #15073280,124(a2)
    23d2:	007c 
    *cl++ = *clpartinstruction++;
    23d4:	2579 0000 5afc 	move.l 5afc <ClColor>,128(a2)
    23da:	0080 
    23dc:	2579 0000 5b00 	move.l 5b00 <ClColor+0x4>,132(a2)
    23e2:	0084 
    23e4:	43ea 012c      	lea 300(a2),a1
    23e8:	220a           	move.l a2,d1
    23ea:	0681 0000 a52c 	addi.l #42284,d1
    23f0:	203c 2c07 fffe 	move.l #738721790,d0
    23f6:	6000 fe76      	bra.w 226e <ClbuildZoom+0x13e>

000023fa <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    23fa:	2039 0000 5c38 	move.l 5c38 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    2400:	23f9 0000 5c2c 	move.l 5c2c <ViewCopper>,5c38 <DrawCopper>
    2406:	0000 5c38 
  ViewCopper = (ULONG *)tmp;
    240a:	23c0 0000 5c2c 	move.l d0,5c2c <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    2410:	2079 0000 5c22 	movea.l 5c22 <hw>,a0
    2416:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    241a:	3140 0088      	move.w d0,136(a0)
}
    241e:	4e75           	rts

00002420 <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    2420:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    2424:	45fa fd0a      	lea 2130 <ClbuildZoom>(pc),a2
    2428:	4e92           	jsr (a2)
    242a:	23c0 0000 5c48 	move.l d0,5c48 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    2430:	4e92           	jsr (a2)
    2432:	23c0 0000 5c44 	move.l d0,5c44 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2438:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    243e:	203c 0001 6800 	move.l #92160,d0
    2444:	7202           	moveq #2,d1
    2446:	4eae ff3a      	jsr -198(a6)
    244a:	23c0 0000 5c40 	move.l d0,5c40 <Bitplane1>
  if(Bitplane1 == 0) {
    2450:	6700 014e      	beq.w 25a0 <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    2454:	23c0 0000 5c3c 	move.l d0,5c3c <DrawBuffer>
  DrawCopper = Copperlist1;
    245a:	23f9 0000 5c48 	move.l 5c48 <Copperlist1>,5c38 <DrawCopper>
    2460:	0000 5c38 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2464:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    246a:	203c 0001 6800 	move.l #92160,d0
    2470:	7202           	moveq #2,d1
    2472:	4eae ff3a      	jsr -198(a6)
    2476:	2400           	move.l d0,d2
    2478:	23c0 0000 5c34 	move.l d0,5c34 <Bitplane2>
  if(Bitplane2 == 0) {
    247e:	6778           	beq.s 24f8 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    2480:	23f9 0000 5c44 	move.l 5c44 <Copperlist2>,5c2c <ViewCopper>
    2486:	0000 5c2c 
  SwapCl();
    248a:	45fa ff6e      	lea 23fa <SwapCl>(pc),a2
    248e:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    2490:	2039 0000 5c3c 	move.l 5c3c <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2496:	2079 0000 5c38 	movea.l 5c38 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    249c:	2200           	move.l d0,d1
    249e:	4241           	clr.w d1
    24a0:	4841           	swap d1
    24a2:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    24a6:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    24aa:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    24b0:	2200           	move.l d0,d1
    24b2:	4241           	clr.w d1
    24b4:	4841           	swap d1
    24b6:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    24ba:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    24be:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    24c0:	2079 0000 5c38 	movea.l 5c38 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    24c6:	2002           	move.l d2,d0
    24c8:	4240           	clr.w d0
    24ca:	4840           	swap d0
    24cc:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    24d0:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    24d4:	2002           	move.l d2,d0
    24d6:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    24dc:	2200           	move.l d0,d1
    24de:	4241           	clr.w d1
    24e0:	4841           	swap d1
    24e2:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    24e6:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    24ea:	23c2 0000 5c30 	move.l d2,5c30 <ViewBuffer>
}
    24f0:	7000           	moveq #0,d0
    24f2:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    24f6:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    24f8:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    24fe:	4eae ffc4      	jsr -60(a6)
    2502:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    2508:	2200           	move.l d0,d1
    250a:	243c 0000 3356 	move.l #13142,d2
    2510:	7626           	moveq #38,d3
    2512:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2516:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    251c:	7201           	moveq #1,d1
    251e:	4eae ff70      	jsr -144(a6)
    2522:	2439 0000 5c34 	move.l 5c34 <Bitplane2>,d2
  ViewCopper = Copperlist2;
    2528:	23f9 0000 5c44 	move.l 5c44 <Copperlist2>,5c2c <ViewCopper>
    252e:	0000 5c2c 
  SwapCl();
    2532:	45fa fec6      	lea 23fa <SwapCl>(pc),a2
    2536:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    2538:	2039 0000 5c3c 	move.l 5c3c <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    253e:	2079 0000 5c38 	movea.l 5c38 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2544:	2200           	move.l d0,d1
    2546:	4241           	clr.w d1
    2548:	4841           	swap d1
    254a:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    254e:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    2552:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2558:	2200           	move.l d0,d1
    255a:	4241           	clr.w d1
    255c:	4841           	swap d1
    255e:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2562:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    2566:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    2568:	2079 0000 5c38 	movea.l 5c38 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    256e:	2002           	move.l d2,d0
    2570:	4240           	clr.w d0
    2572:	4840           	swap d0
    2574:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    2578:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    257c:	2002           	move.l d2,d0
    257e:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2584:	2200           	move.l d0,d1
    2586:	4241           	clr.w d1
    2588:	4841           	swap d1
    258a:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    258e:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    2592:	23c2 0000 5c30 	move.l d2,5c30 <ViewBuffer>
}
    2598:	7000           	moveq #0,d0
    259a:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    259e:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    25a0:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    25a6:	4eae ffc4      	jsr -60(a6)
    25aa:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    25b0:	2200           	move.l d0,d1
    25b2:	243c 0000 332f 	move.l #13103,d2
    25b8:	7626           	moveq #38,d3
    25ba:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    25be:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    25c4:	7201           	moveq #1,d1
    25c6:	4eae ff70      	jsr -144(a6)
    25ca:	2039 0000 5c40 	move.l 5c40 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    25d0:	23c0 0000 5c3c 	move.l d0,5c3c <DrawBuffer>
  DrawCopper = Copperlist1;
    25d6:	23f9 0000 5c48 	move.l 5c48 <Copperlist1>,5c38 <DrawCopper>
    25dc:	0000 5c38 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    25e0:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    25e6:	203c 0001 6800 	move.l #92160,d0
    25ec:	7202           	moveq #2,d1
    25ee:	4eae ff3a      	jsr -198(a6)
    25f2:	2400           	move.l d0,d2
    25f4:	23c0 0000 5c34 	move.l d0,5c34 <Bitplane2>
  if(Bitplane2 == 0) {
    25fa:	6600 fe84      	bne.w 2480 <PrepareDisplayZoom+0x60>
    25fe:	6000 fef8      	bra.w 24f8 <PrepareDisplayZoom+0xd8>

00002602 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2602:	2039 0000 5c3c 	move.l 5c3c <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2608:	2079 0000 5c38 	movea.l 5c38 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    260e:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2612:	2200           	move.l d0,d1
    2614:	4241           	clr.w d1
    2616:	4841           	swap d1
    2618:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    261c:	23f9 0000 5c30 	move.l 5c30 <ViewBuffer>,5c3c <DrawBuffer>
    2622:	0000 5c3c 
  ViewBuffer = (ULONG *) tmp;
    2626:	23c0 0000 5c30 	move.l d0,5c30 <ViewBuffer>
}
    262c:	4e75           	rts

0000262e <PrepareDisplay>:
 int PrepareDisplaySW() {
    262e:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    2632:	45fa f51c      	lea 1b50 <ClBuild>(pc),a2
    2636:	4e92           	jsr (a2)
    2638:	23c0 0000 5c48 	move.l d0,5c48 <Copperlist1>
  Copperlist2 = ClbuildSW();
    263e:	4e92           	jsr (a2)
    2640:	23c0 0000 5c44 	move.l d0,5c44 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2646:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    264c:	203c 0000 c800 	move.l #51200,d0
    2652:	7202           	moveq #2,d1
    2654:	4eae ff3a      	jsr -198(a6)
    2658:	23c0 0000 5c40 	move.l d0,5c40 <Bitplane1>
  if(Bitplane1 == 0) {
    265e:	6700 00ac      	beq.w 270c <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    2662:	23c0 0000 5c3c 	move.l d0,5c3c <DrawBuffer>
  DrawCopper = Copperlist1;
    2668:	23f9 0000 5c48 	move.l 5c48 <Copperlist1>,5c38 <DrawCopper>
    266e:	0000 5c38 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2672:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    2678:	203c 0000 c800 	move.l #51200,d0
    267e:	7202           	moveq #2,d1
    2680:	4eae ff3a      	jsr -198(a6)
    2684:	23c0 0000 5c34 	move.l d0,5c34 <Bitplane2>
  if(Bitplane2 == 0) {
    268a:	6728           	beq.s 26b4 <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    268c:	23c0 0000 5c30 	move.l d0,5c30 <ViewBuffer>
  ViewCopper = Copperlist2;
    2692:	23f9 0000 5c44 	move.l 5c44 <Copperlist2>,5c2c <ViewCopper>
    2698:	0000 5c2c 
  SwapCl();
    269c:	47fa fd5c      	lea 23fa <SwapCl>(pc),a3
    26a0:	4e93           	jsr (a3)
  SetBplPointers();
    26a2:	45fa ff5e      	lea 2602 <SetBplPointers>(pc),a2
    26a6:	4e92           	jsr (a2)
  SwapCl();
    26a8:	4e93           	jsr (a3)
  SetBplPointers();
    26aa:	4e92           	jsr (a2)
}
    26ac:	7000           	moveq #0,d0
    26ae:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    26b2:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    26b4:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    26ba:	4eae ffc4      	jsr -60(a6)
    26be:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    26c4:	2200           	move.l d0,d1
    26c6:	243c 0000 3356 	move.l #13142,d2
    26cc:	7626           	moveq #38,d3
    26ce:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    26d2:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    26d8:	7201           	moveq #1,d1
    26da:	4eae ff70      	jsr -144(a6)
    26de:	2039 0000 5c34 	move.l 5c34 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    26e4:	23c0 0000 5c30 	move.l d0,5c30 <ViewBuffer>
  ViewCopper = Copperlist2;
    26ea:	23f9 0000 5c44 	move.l 5c44 <Copperlist2>,5c2c <ViewCopper>
    26f0:	0000 5c2c 
  SwapCl();
    26f4:	47fa fd04      	lea 23fa <SwapCl>(pc),a3
    26f8:	4e93           	jsr (a3)
  SetBplPointers();
    26fa:	45fa ff06      	lea 2602 <SetBplPointers>(pc),a2
    26fe:	4e92           	jsr (a2)
  SwapCl();
    2700:	4e93           	jsr (a3)
  SetBplPointers();
    2702:	4e92           	jsr (a2)
}
    2704:	7000           	moveq #0,d0
    2706:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    270a:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    270c:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    2712:	4eae ffc4      	jsr -60(a6)
    2716:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    271c:	2200           	move.l d0,d1
    271e:	243c 0000 332f 	move.l #13103,d2
    2724:	7626           	moveq #38,d3
    2726:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    272a:	2c79 0000 5c4c 	movea.l 5c4c <DOSBase>,a6
    2730:	7201           	moveq #1,d1
    2732:	4eae ff70      	jsr -144(a6)
    2736:	2039 0000 5c40 	move.l 5c40 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    273c:	23c0 0000 5c3c 	move.l d0,5c3c <DrawBuffer>
  DrawCopper = Copperlist1;
    2742:	23f9 0000 5c48 	move.l 5c48 <Copperlist1>,5c38 <DrawCopper>
    2748:	0000 5c38 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    274c:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    2752:	203c 0000 c800 	move.l #51200,d0
    2758:	7202           	moveq #2,d1
    275a:	4eae ff3a      	jsr -198(a6)
    275e:	23c0 0000 5c34 	move.l d0,5c34 <Bitplane2>
  if(Bitplane2 == 0) {
    2764:	6600 ff26      	bne.w 268c <PrepareDisplay+0x5e>
    2768:	6000 ff4a      	bra.w 26b4 <PrepareDisplay+0x86>

0000276c <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    276c:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    2770:	262f 0010      	move.l 16(sp),d3
    2774:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    2778:	2279 0000 5c48 	movea.l 5c48 <Copperlist1>,a1
    277e:	b2fc 0000      	cmpa.w #0,a1
    2782:	670c           	beq.s 2790 <FreeDisplay+0x24>
    2784:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    278a:	2003           	move.l d3,d0
    278c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    2790:	2279 0000 5c44 	movea.l 5c44 <Copperlist2>,a1
    2796:	b2fc 0000      	cmpa.w #0,a1
    279a:	670c           	beq.s 27a8 <FreeDisplay+0x3c>
    279c:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    27a2:	2003           	move.l d3,d0
    27a4:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    27a8:	2279 0000 5c40 	movea.l 5c40 <Bitplane1>,a1
    27ae:	b2fc 0000      	cmpa.w #0,a1
    27b2:	670c           	beq.s 27c0 <FreeDisplay+0x54>
    27b4:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    27ba:	2002           	move.l d2,d0
    27bc:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    27c0:	2279 0000 5c34 	movea.l 5c34 <Bitplane2>,a1
    27c6:	b2fc 0000      	cmpa.w #0,a1
    27ca:	670c           	beq.s 27d8 <FreeDisplay+0x6c>
    27cc:	2c79 0000 5c50 	movea.l 5c50 <SysBase>,a6
    27d2:	2002           	move.l d2,d0
    27d4:	4eae ff2e      	jsr -210(a6)
}
    27d8:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    27dc:	4e75           	rts

000027de <WaitVbl>:
void WaitVbl() {
    27de:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    27e0:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddbef3>,d0
    27e6:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    27e8:	2017           	move.l (sp),d0
    27ea:	0280 0001 ff00 	andi.l #130816,d0
    27f0:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    27f2:	2017           	move.l (sp),d0
    27f4:	0c80 0001 3700 	cmpi.l #79616,d0
    27fa:	67e4           	beq.s 27e0 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    27fc:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddbef3>,d0
    2802:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    2806:	202f 0004      	move.l 4(sp),d0
    280a:	0280 0001 ff00 	andi.l #130816,d0
    2810:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    2814:	202f 0004      	move.l 4(sp),d0
    2818:	0c80 0001 3700 	cmpi.l #79616,d0
    281e:	66dc           	bne.s 27fc <WaitVbl+0x1e>
}
    2820:	508f           	addq.l #8,sp
    2822:	4e75           	rts

00002824 <memcpy>:
{
    2824:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    2828:	202f 0014      	move.l 20(sp),d0
    282c:	226f 0018      	movea.l 24(sp),a1
    2830:	222f 001c      	move.l 28(sp),d1
	while(len--)
    2834:	2601           	move.l d1,d3
    2836:	5383           	subq.l #1,d3
    2838:	4a81           	tst.l d1
    283a:	6762           	beq.s 289e <memcpy+0x7a>
    283c:	2040           	movea.l d0,a0
    283e:	5888           	addq.l #4,a0
    2840:	b1c9           	cmpa.l a1,a0
    2842:	53c2           	sl.s d2
    2844:	4402           	neg.b d2
    2846:	41e9 0004      	lea 4(a1),a0
    284a:	b1c0           	cmpa.l d0,a0
    284c:	53c4           	sl.s d4
    284e:	4404           	neg.b d4
    2850:	8404           	or.b d4,d2
    2852:	7808           	moveq #8,d4
    2854:	b883           	cmp.l d3,d4
    2856:	55c4           	sc.s d4
    2858:	4404           	neg.b d4
    285a:	c404           	and.b d4,d2
    285c:	6746           	beq.s 28a4 <memcpy+0x80>
    285e:	2409           	move.l a1,d2
    2860:	8480           	or.l d0,d2
    2862:	7803           	moveq #3,d4
    2864:	c484           	and.l d4,d2
    2866:	663c           	bne.s 28a4 <memcpy+0x80>
    2868:	2049           	movea.l a1,a0
    286a:	2440           	movea.l d0,a2
    286c:	74fc           	moveq #-4,d2
    286e:	c481           	and.l d1,d2
    2870:	d489           	add.l a1,d2
		*d++ = *s++;
    2872:	24d8           	move.l (a0)+,(a2)+
    2874:	b488           	cmp.l a0,d2
    2876:	66fa           	bne.s 2872 <memcpy+0x4e>
    2878:	74fc           	moveq #-4,d2
    287a:	c481           	and.l d1,d2
    287c:	2040           	movea.l d0,a0
    287e:	d1c2           	adda.l d2,a0
    2880:	d3c2           	adda.l d2,a1
    2882:	9682           	sub.l d2,d3
    2884:	b481           	cmp.l d1,d2
    2886:	6716           	beq.s 289e <memcpy+0x7a>
    2888:	1091           	move.b (a1),(a0)
	while(len--)
    288a:	4a83           	tst.l d3
    288c:	6710           	beq.s 289e <memcpy+0x7a>
		*d++ = *s++;
    288e:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    2894:	5383           	subq.l #1,d3
    2896:	6706           	beq.s 289e <memcpy+0x7a>
		*d++ = *s++;
    2898:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    289e:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    28a2:	4e75           	rts
    28a4:	2040           	movea.l d0,a0
    28a6:	d289           	add.l a1,d1
		*d++ = *s++;
    28a8:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    28aa:	b289           	cmp.l a1,d1
    28ac:	67f0           	beq.s 289e <memcpy+0x7a>
		*d++ = *s++;
    28ae:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    28b0:	b289           	cmp.l a1,d1
    28b2:	66f4           	bne.s 28a8 <memcpy+0x84>
    28b4:	60e8           	bra.s 289e <memcpy+0x7a>

000028b6 <memset>:
{
    28b6:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    28ba:	202f 0024      	move.l 36(sp),d0
    28be:	2a2f 0028      	move.l 40(sp),d5
    28c2:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    28c6:	2809           	move.l a1,d4
    28c8:	5384           	subq.l #1,d4
    28ca:	b2fc 0000      	cmpa.w #0,a1
    28ce:	6f00 00b0      	ble.w 2980 <memset+0xca>
    28d2:	1e05           	move.b d5,d7
    28d4:	2200           	move.l d0,d1
    28d6:	4481           	neg.l d1
    28d8:	7403           	moveq #3,d2
    28da:	c282           	and.l d2,d1
    28dc:	7c05           	moveq #5,d6
		*ptr++ = val;
    28de:	2440           	movea.l d0,a2
    28e0:	bc84           	cmp.l d4,d6
    28e2:	646a           	bcc.s 294e <memset+0x98>
    28e4:	4a81           	tst.l d1
    28e6:	6724           	beq.s 290c <memset+0x56>
    28e8:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    28ea:	5384           	subq.l #1,d4
    28ec:	7401           	moveq #1,d2
    28ee:	b481           	cmp.l d1,d2
    28f0:	671a           	beq.s 290c <memset+0x56>
		*ptr++ = val;
    28f2:	2440           	movea.l d0,a2
    28f4:	548a           	addq.l #2,a2
    28f6:	2040           	movea.l d0,a0
    28f8:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    28fc:	5384           	subq.l #1,d4
    28fe:	7403           	moveq #3,d2
    2900:	b481           	cmp.l d1,d2
    2902:	6608           	bne.s 290c <memset+0x56>
		*ptr++ = val;
    2904:	528a           	addq.l #1,a2
    2906:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    290a:	5384           	subq.l #1,d4
    290c:	2609           	move.l a1,d3
    290e:	9681           	sub.l d1,d3
    2910:	7c00           	moveq #0,d6
    2912:	1c05           	move.b d5,d6
    2914:	2406           	move.l d6,d2
    2916:	4842           	swap d2
    2918:	4242           	clr.w d2
    291a:	2042           	movea.l d2,a0
    291c:	2406           	move.l d6,d2
    291e:	e14a           	lsl.w #8,d2
    2920:	4842           	swap d2
    2922:	4242           	clr.w d2
    2924:	e18e           	lsl.l #8,d6
    2926:	2646           	movea.l d6,a3
    2928:	2c08           	move.l a0,d6
    292a:	8486           	or.l d6,d2
    292c:	2c0b           	move.l a3,d6
    292e:	8486           	or.l d6,d2
    2930:	1407           	move.b d7,d2
    2932:	2040           	movea.l d0,a0
    2934:	d1c1           	adda.l d1,a0
    2936:	72fc           	moveq #-4,d1
    2938:	c283           	and.l d3,d1
    293a:	d288           	add.l a0,d1
		*ptr++ = val;
    293c:	20c2           	move.l d2,(a0)+
    293e:	b1c1           	cmpa.l d1,a0
    2940:	66fa           	bne.s 293c <memset+0x86>
    2942:	72fc           	moveq #-4,d1
    2944:	c283           	and.l d3,d1
    2946:	d5c1           	adda.l d1,a2
    2948:	9881           	sub.l d1,d4
    294a:	b283           	cmp.l d3,d1
    294c:	6732           	beq.s 2980 <memset+0xca>
    294e:	1485           	move.b d5,(a2)
	while(len-- > 0)
    2950:	4a84           	tst.l d4
    2952:	6f2c           	ble.s 2980 <memset+0xca>
		*ptr++ = val;
    2954:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    2958:	7201           	moveq #1,d1
    295a:	b284           	cmp.l d4,d1
    295c:	6c22           	bge.s 2980 <memset+0xca>
		*ptr++ = val;
    295e:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    2962:	7402           	moveq #2,d2
    2964:	b484           	cmp.l d4,d2
    2966:	6c18           	bge.s 2980 <memset+0xca>
		*ptr++ = val;
    2968:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    296c:	7c03           	moveq #3,d6
    296e:	bc84           	cmp.l d4,d6
    2970:	6c0e           	bge.s 2980 <memset+0xca>
		*ptr++ = val;
    2972:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    2976:	7204           	moveq #4,d1
    2978:	b284           	cmp.l d4,d1
    297a:	6c04           	bge.s 2980 <memset+0xca>
		*ptr++ = val;
    297c:	1545 0005      	move.b d5,5(a2)
}
    2980:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    2984:	4e75           	rts

00002986 <strlen>:
{
    2986:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    298a:	7000           	moveq #0,d0
	while(*s++)
    298c:	4a10           	tst.b (a0)
    298e:	6708           	beq.s 2998 <strlen+0x12>
		t++;
    2990:	5280           	addq.l #1,d0
	while(*s++)
    2992:	4a30 0800      	tst.b (0,a0,d0.l)
    2996:	66f8           	bne.s 2990 <strlen+0xa>
}
    2998:	4e75           	rts
    299a:	4e71           	nop

0000299c <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    299c:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    29a0:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    29a4:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    29a8:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    29ac:	d041           	add.w d1,d0
	swap	d0
    29ae:	4840           	swap d0
	clrw	d0
    29b0:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    29b2:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    29b6:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    29ba:	d081           	add.l d1,d0

	rts
    29bc:	4e75           	rts

000029be <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    29be:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    29c0:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    29c4:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    29c8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    29ce:	6416           	bcc.s 29e6 <__udivsi3+0x28>
	movel	d0, d2
    29d0:	2400           	move.l d0,d2
	clrw	d2
    29d2:	4242           	clr.w d2
	swap	d2
    29d4:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    29d6:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    29d8:	3002           	move.w d2,d0
	swap	d0
    29da:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    29dc:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    29e0:	84c1           	divu.w d1,d2
	movew	d2, d0
    29e2:	3002           	move.w d2,d0
	jra	6f
    29e4:	6030           	bra.s 2a16 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    29e6:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    29e8:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    29ea:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    29ec:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    29f2:	64f4           	bcc.s 29e8 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    29f4:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    29f6:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    29fc:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    29fe:	c2c0           	mulu.w d0,d1
	swap	d2
    2a00:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    2a02:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    2a04:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    2a06:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    2a08:	660a           	bne.s 2a14 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    2a0a:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    2a0c:	6506           	bcs.s 2a14 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    2a0e:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    2a12:	6302           	bls.s 2a16 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    2a14:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    2a16:	241f           	move.l (sp)+,d2
	rts
    2a18:	4e75           	rts

00002a1a <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    2a1a:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    2a1c:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    2a1e:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    2a22:	6a04           	bpl.s 2a28 <__divsi3+0xe>
	negl	d1
    2a24:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    2a26:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    2a28:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    2a2c:	6a04           	bpl.s 2a32 <__divsi3+0x18>
	negl	d0
    2a2e:	4480           	neg.l d0
	negb	d2
    2a30:	4402           	neg.b d2

2:	movel	d1, sp@-
    2a32:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2a34:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    2a36:	6186           	bsr.s 29be <__udivsi3>
	addql	IMM (8), sp
    2a38:	508f           	addq.l #8,sp

	tstb	d2
    2a3a:	4a02           	tst.b d2
	jpl	3f
    2a3c:	6a02           	bpl.s 2a40 <__divsi3+0x26>
	negl	d0
    2a3e:	4480           	neg.l d0

3:	movel	sp@+, d2
    2a40:	241f           	move.l (sp)+,d2
	rts
    2a42:	4e75           	rts

00002a44 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    2a44:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    2a48:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    2a4c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2a4e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    2a50:	61c8           	bsr.s 2a1a <__divsi3>
	addql	IMM (8), sp
    2a52:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    2a54:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    2a58:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2a5a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    2a5c:	6100 ff3e      	bsr.w 299c <__mulsi3>
	addql	IMM (8), sp
    2a60:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    2a62:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    2a66:	9280           	sub.l d0,d1
	movel	d1, d0
    2a68:	2001           	move.l d1,d0
	rts
    2a6a:	4e75           	rts

00002a6c <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    2a6c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    2a70:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    2a74:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2a76:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    2a78:	6100 ff44      	bsr.w 29be <__udivsi3>
	addql	IMM (8), sp
    2a7c:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    2a7e:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    2a82:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2a84:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    2a86:	6100 ff14      	bsr.w 299c <__mulsi3>
	addql	IMM (8), sp
    2a8a:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    2a8c:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    2a90:	9280           	sub.l d0,d1
	movel	d1, d0
    2a92:	2001           	move.l d1,d0
	rts
    2a94:	4e75           	rts

00002a96 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    2a96:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    2a98:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    2a9c:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    2aa0:	2c5f           	movea.l (sp)+,a6
    rts
    2aa2:	4e75           	rts

00002aa4 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    2aa4:	16c0           	move.b d0,(a3)+
	rts
    2aa6:	4e75           	rts

00002aa8 <saveregs>:
	...

00002ae4 <font2distance>:
    2ae4:	0505           	btst d2,d5
    2ae6:	0505           	btst d2,d5
    2ae8:	0505           	btst d2,d5
    2aea:	0505           	btst d2,d5
    2aec:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    2aee:	0505           	btst d2,d5
    2af0:	0505           	btst d2,d5
    2af2:	0005 0505      	ori.b #5,d5
    2af6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    2af8:	0505           	btst d2,d5
    2afa:	0505           	btst d2,d5
    2afc:	0505           	btst d2,d5
    2afe:	0505           	btst d2,d5
    2b00:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    2b02:	0505           	btst d2,d5
    2b04:	0505           	btst d2,d5
    2b06:	0505           	btst d2,d5
    2b08:	0505           	btst d2,d5
    2b0a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    2b0c:	0500           	btst d2,d0
    2b0e:	0505           	btst d2,d5
    2b10:	0505           	btst d2,d5
    2b12:	0505           	btst d2,d5
    2b14:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    2b16:	0505           	btst d2,d5
    2b18:	0505           	btst d2,d5
    2b1a:	0505           	btst d2,d5
    2b1c:	0505           	btst d2,d5
    2b1e:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    2b20:	0505           	btst d2,d5
    2b22:	0505           	btst d2,d5
    2b24:	0503           	btst d2,d3
    2b26:	0505           	btst d2,d5
    2b28:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    2b2a:	0505           	btst d2,d5
    2b2c:	0500           	btst d2,d0
    2b2e:	0505           	btst d2,d5
    2b30:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    2b34:	0505           	btst d2,d5
    2b36:	0503           	btst d2,d3
    2b38:	0205 0507      	andi.b #7,d5
    2b3c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    2b3e:	0505           	btst d2,d5
    2b40:	0505           	btst d2,d5
    2b42:	0505           	btst d2,d5
    2b44:	0505           	btst d2,d5
    2b46:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b48:	0505           	btst d2,d5
    2b4a:	0505           	btst d2,d5
    2b4c:	0505           	btst d2,d5
    2b4e:	0505           	btst d2,d5
    2b50:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b52:	0505           	btst d2,d5
    2b54:	0505           	btst d2,d5
    2b56:	0505           	btst d2,d5
    2b58:	0505           	btst d2,d5
    2b5a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b5c:	0505           	btst d2,d5
    2b5e:	0505           	btst d2,d5
    2b60:	0505           	btst d2,d5
    2b62:	0505           	btst d2,d5
    2b64:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b66:	0505           	btst d2,d5
    2b68:	0505           	btst d2,d5
    2b6a:	0505           	btst d2,d5
    2b6c:	0505           	btst d2,d5
    2b6e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b70:	0505           	btst d2,d5
    2b72:	0505           	btst d2,d5
    2b74:	0505           	btst d2,d5
    2b76:	0505           	btst d2,d5
    2b78:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b7a:	0505           	btst d2,d5
    2b7c:	0505           	btst d2,d5
    2b7e:	0505           	btst d2,d5
    2b80:	0505           	btst d2,d5
    2b82:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b84:	0505           	btst d2,d5
    2b86:	0505           	btst d2,d5
    2b88:	0505           	btst d2,d5
    2b8a:	0505           	btst d2,d5
    2b8c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b8e:	0505           	btst d2,d5
    2b90:	0505           	btst d2,d5
    2b92:	0505           	btst d2,d5
    2b94:	0505           	btst d2,d5
    2b96:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b98:	0505           	btst d2,d5
    2b9a:	0505           	btst d2,d5
    2b9c:	0505           	btst d2,d5
    2b9e:	0505           	btst d2,d5
    2ba0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2ba2:	0505           	btst d2,d5
    2ba4:	0505           	btst d2,d5
    2ba6:	0505           	btst d2,d5
    2ba8:	0505           	btst d2,d5
    2baa:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2bac:	0505           	btst d2,d5
    2bae:	0505           	btst d2,d5
    2bb0:	0505           	btst d2,d5
    2bb2:	0505           	btst d2,d5
    2bb4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2bb6:	0505           	btst d2,d5
    2bb8:	0505           	btst d2,d5
    2bba:	0505           	btst d2,d5
    2bbc:	0505           	btst d2,d5
    2bbe:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2bc0:	0505           	btst d2,d5
    2bc2:	0505           	btst d2,d5
    2bc4:	0505           	btst d2,d5
    2bc6:	0505           	btst d2,d5
    2bc8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2bca:	0505           	btst d2,d5
    2bcc:	0505           	btst d2,d5
    2bce:	0505           	btst d2,d5
    2bd0:	0505           	btst d2,d5
    2bd2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2bd4:	0505           	btst d2,d5
    2bd6:	0505           	btst d2,d5
    2bd8:	0505           	btst d2,d5
    2bda:	0505           	btst d2,d5
    2bdc:	0505           	btst d2,d5

00002bde <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    2bde:	16c0           	move.b d0,(a3)+
  RTS
    2be0:	4e75           	rts

00002be2 <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    2be2:	48f9 7fff 0000 	movem.l d0-a6,2aa8 <saveregs>
    2be8:	2aa8 
  lea 0xdff000,a5
    2bea:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddbeef>,a5
  move.l sp@(4),a0  //Fontlocation
    2bf0:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    2bf4:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    2bf8:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    2bfc:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    2bfe:	082d 0006 0002 	btst #6,2(a5)

00002c04 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    2c04:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    2c0a:	66f8           	bne.s 2c04 <st2wblit>

00002c0c <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    2c0c:	7019           	moveq #25,d0
	sub.l d5,d5      
    2c0e:	9a85           	sub.l d5,d5

00002c10 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    2c10:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    2c12:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    2c14:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    2c18:	9dce           	suba.l a6,a6
	move.l d2, a6
    2c1a:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    2c1c:	ddfc 0000 2ae4 	adda.l #10980,a6

	LSL  	#4,d2 	    //Fetch next char
    2c22:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    2c24:	2842           	movea.l d2,a4


	move.l  #0,d4
    2c26:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    2c28:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    2c2a:	3814           	move.w (a4),d4
	swap	d4
    2c2c:	4844           	swap d4
	lsr.l	d5, d4
    2c2e:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    2c30:	8993           	or.l d4,(a3)
	clr.l	d4
    2c32:	4284           	clr.l d4
	move.w  2(a4), d4
    2c34:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    2c38:	4844           	swap d4
	lsr.l	d5, d4
    2c3a:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    2c3c:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    2c40:	4284           	clr.l d4
	move.w  4(a4), d4
    2c42:	382c 0004      	move.w 4(a4),d4
	swap	d4
    2c46:	4844           	swap d4
	lsr.l	d5, d4
    2c48:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    2c4a:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    2c4e:	4284           	clr.l d4
	move.w  6(a4), d4
    2c50:	382c 0006      	move.w 6(a4),d4
	swap	d4
    2c54:	4844           	swap d4
	lsr.l	d5, d4
    2c56:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    2c58:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    2c5c:	4284           	clr.l d4
	move.w  8(a4), d4
    2c5e:	382c 0008      	move.w 8(a4),d4
	swap	d4
    2c62:	4844           	swap d4
	lsr.l	d5, d4
    2c64:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    2c66:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    2c6a:	4284           	clr.l d4
	move.w  10(a4), d4
    2c6c:	382c 000a      	move.w 10(a4),d4
	swap	d4
    2c70:	4844           	swap d4
	lsr.l	d5, d4
    2c72:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    2c74:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    2c78:	4284           	clr.l d4
	move.w  12(a4), d4
    2c7a:	382c 000c      	move.w 12(a4),d4
	swap	d4
    2c7e:	4844           	swap d4
	lsr.l	d5, d4
    2c80:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    2c82:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    2c86:	4284           	clr.l d4
	move.w  14(a4), d4
    2c88:	382c 000e      	move.w 14(a4),d4
	swap	d4
    2c8c:	4844           	swap d4
	lsr.l	d5, d4
    2c8e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    2c90:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    2c94:	4284           	clr.l d4

	add.b   (a6), d5
    2c96:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    2c98:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    2c9c:	6500 0006      	bcs.w 2ca4 <noadditionalchar>
	addq.w  #1, a3
    2ca0:	524b           	addq.w #1,a3
	sub.w   #8,d5
    2ca2:	5145           	subq.w #8,d5

00002ca4 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    2ca4:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    2ca6:	51c8 ff68      	dbf d0,2c10 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    2caa:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    2cae:	51cb ff5c      	dbf d3,2c0c <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    2cb2:	4cfa 7fff fdf2 	movem.l 2aa8 <saveregs>(pc),d0-a6

	RTS
    2cb8:	4e75           	rts
