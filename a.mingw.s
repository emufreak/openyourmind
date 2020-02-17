
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
      12:	23ce 0000 5b66 	move.l a6,5b66 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,5b3e <hw>
      1e:	0000 5b3e 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 32c0 	lea 32c0 <incbin_swfont_end+0xe6>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 5b3a 	move.l d0,5b3a <GfxBase>
	if (!GfxBase)
      34:	6700 17d4      	beq.w 180a <main+0x1804>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
      3e:	43f9 0000 32d1 	lea 32d1 <incbin_swfont_end+0xf7>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 5b62 	move.l d0,5b62 <DOSBase>
	if (!DOSBase)
      50:	6700 17ac      	beq.w 17fe <main+0x17f8>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 32dd 	pea 32dd <incbin_swfont_end+0x103>
      5a:	4eb9 0000 1be6 	jsr 1be6 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 32f9 	move.l #13049,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 3309 	move.l #13065,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 1e42 	lea 1e42 <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 5b5e 	move.l d0,5b5e <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 5b4e 	move.l d0,5b4e <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 5b5a 	move.l d0,5b5a <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 5b42 	move.l d0,5b42 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2039 0000 5a78 	move.l 5a78 <ClsSprites>,d0
      d0:	b092           	cmp.l (a2),d0
      d2:	6600 1386      	bne.w 145a <main+0x1454>
      d6:	222a 0004      	move.l 4(a2),d1
      da:	b2b9 0000 5a7c 	cmp.l 5a7c <ClsSprites+0x4>,d1
      e0:	6600 1378      	bne.w 145a <main+0x1454>
      e4:	2a2a 0008      	move.l 8(a2),d5
      e8:	bab9 0000 5a80 	cmp.l 5a80 <ClsSprites+0x8>,d5
      ee:	6600 136a      	bne.w 145a <main+0x1454>
      f2:	206a 000c      	movea.l 12(a2),a0
      f6:	b1f9 0000 5a84 	cmpa.l 5a84 <ClsSprites+0xc>,a0
      fc:	6600 135c      	bne.w 145a <main+0x1454>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 5a88 	cmp.l 5a88 <ClsSprites+0x10>,d0
     10a:	6600 134e      	bne.w 145a <main+0x1454>
     10e:	222a 0014      	move.l 20(a2),d1
     112:	b2b9 0000 5a8c 	cmp.l 5a8c <ClsSprites+0x14>,d1
     118:	6600 1340      	bne.w 145a <main+0x1454>
     11c:	2a2a 0018      	move.l 24(a2),d5
     120:	bab9 0000 5a90 	cmp.l 5a90 <ClsSprites+0x18>,d5
     126:	6600 1332      	bne.w 145a <main+0x1454>
     12a:	206a 001c      	movea.l 28(a2),a0
     12e:	b1f9 0000 5a94 	cmpa.l 5a94 <ClsSprites+0x1c>,a0
     134:	6600 1324      	bne.w 145a <main+0x1454>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 5a98 	cmp.l 5a98 <ClsSprites+0x20>,d0
     142:	6600 1316      	bne.w 145a <main+0x1454>
     146:	222a 0024      	move.l 36(a2),d1
     14a:	b2b9 0000 5a9c 	cmp.l 5a9c <ClsSprites+0x24>,d1
     150:	6600 1308      	bne.w 145a <main+0x1454>
     154:	2a2a 0028      	move.l 40(a2),d5
     158:	bab9 0000 5aa0 	cmp.l 5aa0 <ClsSprites+0x28>,d5
     15e:	6600 12fa      	bne.w 145a <main+0x1454>
     162:	206a 002c      	movea.l 44(a2),a0
     166:	b1f9 0000 5aa4 	cmpa.l 5aa4 <ClsSprites+0x2c>,a0
     16c:	6600 12ec      	bne.w 145a <main+0x1454>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 5aa8 	cmp.l 5aa8 <ClsSprites+0x30>,d0
     17a:	6600 12de      	bne.w 145a <main+0x1454>
     17e:	222a 0034      	move.l 52(a2),d1
     182:	b2b9 0000 5aac 	cmp.l 5aac <ClsSprites+0x34>,d1
     188:	6600 12d0      	bne.w 145a <main+0x1454>
     18c:	2a2a 0038      	move.l 56(a2),d5
     190:	bab9 0000 5ab0 	cmp.l 5ab0 <ClsSprites+0x38>,d5
     196:	6600 12c2      	bne.w 145a <main+0x1454>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 5ab4 	cmpa.l 5ab4 <ClsSprites+0x3c>,a2
     1a4:	6600 12b4      	bne.w 145a <main+0x1454>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 5b5e 	movea.l 5b5e <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 5a48 	move.l 5a48 <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 130c      	bne.w 14c6 <main+0x14c0>
     1bc:	2228 0044      	move.l 68(a0),d1
     1c0:	b2b9 0000 5a4c 	cmp.l 5a4c <ClScreen+0x4>,d1
     1c6:	6600 12fe      	bne.w 14c6 <main+0x14c0>
     1ca:	2a39 0000 5a50 	move.l 5a50 <ClScreen+0x8>,d5
     1d0:	baa8 0048      	cmp.l 72(a0),d5
     1d4:	6600 12f0      	bne.w 14c6 <main+0x14c0>
     1d8:	2028 004c      	move.l 76(a0),d0
     1dc:	b0b9 0000 5a54 	cmp.l 5a54 <ClScreen+0xc>,d0
     1e2:	6600 12e2      	bne.w 14c6 <main+0x14c0>
     1e6:	2228 0050      	move.l 80(a0),d1
     1ea:	b2b9 0000 5a58 	cmp.l 5a58 <ClScreen+0x10>,d1
     1f0:	6600 12d4      	bne.w 14c6 <main+0x14c0>
     1f4:	2a28 0054      	move.l 84(a0),d5
     1f8:	bab9 0000 5a5c 	cmp.l 5a5c <ClScreen+0x14>,d5
     1fe:	6600 12c6      	bne.w 14c6 <main+0x14c0>
     202:	2028 0058      	move.l 88(a0),d0
     206:	b0b9 0000 5a60 	cmp.l 5a60 <ClScreen+0x18>,d0
     20c:	6600 12b8      	bne.w 14c6 <main+0x14c0>
     210:	2228 005c      	move.l 92(a0),d1
     214:	b2b9 0000 5a64 	cmp.l 5a64 <ClScreen+0x1c>,d1
     21a:	6600 12aa      	bne.w 14c6 <main+0x14c0>
     21e:	2a39 0000 5a68 	move.l 5a68 <ClScreen+0x20>,d5
     224:	baa8 0060      	cmp.l 96(a0),d5
     228:	6600 129c      	bne.w 14c6 <main+0x14c0>
     22c:	2039 0000 5a6c 	move.l 5a6c <ClScreen+0x24>,d0
     232:	b0a8 0064      	cmp.l 100(a0),d0
     236:	6600 128e      	bne.w 14c6 <main+0x14c0>
     23a:	2239 0000 5a70 	move.l 5a70 <ClScreen+0x28>,d1
     240:	b2a8 0068      	cmp.l 104(a0),d1
     244:	6600 1280      	bne.w 14c6 <main+0x14c0>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 5a74 	cmpa.l 5a74 <ClScreen+0x2c>,a0
     252:	6600 1272      	bne.w 14c6 <main+0x14c0>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     256:	23fc 0004 0000 	move.l #262144,5b52 <DrawBuffer>
     25c:	0000 5b52 
  ViewBuffer = (ULONG *)0x50000;
     260:	23fc 0005 0000 	move.l #327680,5b46 <ViewBuffer>
     266:	0000 5b46 
  SetBplPointers();
     26a:	45f9 0000 2572 	lea 2572 <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,5b52 <DrawBuffer>
     278:	0000 5b52 
     27c:	6700 1550      	beq.w 17ce <main+0x17c8>
    Write( Output(), 
     280:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 330c 	move.l #13068,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     29e:	2079 0000 5b5e 	movea.l 5b5e <Copperlist1>,a0
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 3348 	move.l #13128,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 5b5e 	movea.l 5b5e <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 3385 	move.l #13189,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 5b5e 	movea.l 5b5e <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2a28 0078      	move.l 120(a0),d5
     304:	bab9 0000 5a40 	cmp.l 5a40 <ClColor>,d5
     30a:	6600 1192      	bne.w 149e <main+0x1498>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 5a44 	cmp.l 5a44 <ClColor+0x4>,d0
     318:	6600 1184      	bne.w 149e <main+0x1498>
  if( instructions[pos] == value ) 
     31c:	72fe           	moveq #-2,d1
     31e:	b2a8 0080      	cmp.l 128(a0),d1
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 33e4 	move.l #13284,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 236a 	lea 236a <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2a39 0000 5b4e 	move.l 5b4e <DrawCopper>,d5
     350:	bab9 0000 5b5a 	cmp.l 5b5a <Copperlist2>,d5
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 3407 	move.l #13319,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 259e 	lea 259e <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2079 0000 5b52 	movea.l 5b52 <DrawBuffer>,a0
     384:	b1f9 0000 5b56 	cmpa.l 5b56 <Bitplane1>,a0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 341d 	move.l #13341,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2039 0000 5b4e 	move.l 5b4e <DrawCopper>,d0
     3b0:	b0b9 0000 5b5e 	cmp.l 5b5e <Copperlist1>,d0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 3455 	move.l #13397,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2239 0000 5b46 	move.l 5b46 <ViewBuffer>,d1
     3de:	b2b9 0000 5b4a 	cmp.l 5b4a <Bitplane2>,d1
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 348f 	move.l #13455,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2a39 0000 5b42 	move.l 5b42 <ViewCopper>,d5
     40a:	bab9 0000 5b5a 	cmp.l 5b5a <Copperlist2>,d5
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 34c8 	move.l #13512,d2
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
     434:	2079 0000 5b42 	movea.l 5b42 <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     44c:	b0b9 0000 5b4a 	cmp.l 5b4a <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 3503 	move.l #13571,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     476:	2079 0000 5b42 	movea.l 5b42 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     48e:	b0b9 0000 5b56 	cmp.l 5b56 <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 354c 	move.l #13644,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4b8:	2079 0000 5b42 	movea.l 5b42 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4d0:	b0b9 0000 5b4a 	cmp.l 5b4a <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 3596 	move.l #13718,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	4eb9 0000 26dc 	jsr 26dc <FreeDisplay>
  TestZoom4Picture();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     506:	47f9 0000 2390 	lea 2390 <PrepareDisplayZoom>,a3
     50c:	4e93           	jsr (a3)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     50e:	4878 0010      	pea 10 <main+0xa>
     512:	4879 0000 5a78 	pea 5a78 <ClsSprites>
     518:	42a7           	clr.l -(sp)
     51a:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
     520:	4eb9 0000 1c6c 	jsr 1c6c <TestCopperlistBatch>
     526:	4fef 0018      	lea 24(sp),sp
     52a:	4a80           	tst.l d0
     52c:	661e           	bne.s 54c <main+0x546>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     52e:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     534:	4eae ffc4      	jsr -60(a6)
     538:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     53e:	2200           	move.l d0,d1
     540:	243c 0000 35df 	move.l #13791,d2
     546:	762c           	moveq #44,d3
     548:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     54c:	4878 000c      	pea c <main+0x6>
     550:	4879 0000 5a10 	pea 5a10 <ClScreenZoom>
     556:	4878 0010      	pea 10 <main+0xa>
     55a:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
     560:	4eb9 0000 1c6c 	jsr 1c6c <TestCopperlistBatch>
     566:	4fef 0010      	lea 16(sp),sp
     56a:	4a80           	tst.l d0
     56c:	661e           	bne.s 58c <main+0x586>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     56e:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     574:	4eae ffc4      	jsr -60(a6)
     578:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     57e:	2200           	move.l d0,d1
     580:	243c 0000 3615 	move.l #13845,d2
     586:	7636           	moveq #54,d3
     588:	4eae ffd0      	jsr -48(a6)
  }
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     58c:	2079 0000 5b4e 	movea.l 5b4e <DrawCopper>,a0
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
     5a8:	23fc 0005 0000 	move.l #327680,5b52 <DrawBuffer>
     5ae:	0000 5b52 
  ViewBuffer = (ULONG *) tmp;
     5b2:	23fc 0004 0000 	move.l #262144,5b46 <ViewBuffer>
     5b8:	0000 5b46 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5bc:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c2:	4878 001c      	pea 1c <main+0x16>
     5c6:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
     5cc:	4eb9 0000 1c4e 	jsr 1c4e <TestCopperlistPos>
     5d2:	4fef 000c      	lea 12(sp),sp
     5d6:	4a80           	tst.l d0
     5d8:	661e           	bne.s 5f8 <main+0x5f2>
    Write(Output(), 
     5da:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     5e0:	4eae ffc4      	jsr -60(a6)
     5e4:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     5ea:	2200           	move.l d0,d1
     5ec:	243c 0000 3348 	move.l #13128,d2
     5f2:	763c           	moveq #60,d3
     5f4:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     5f8:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     5fe:	4878 001d      	pea 1d <main+0x17>
     602:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
     608:	4eb9 0000 1c4e 	jsr 1c4e <TestCopperlistPos>
     60e:	4fef 000c      	lea 12(sp),sp
     612:	4a80           	tst.l d0
     614:	661e           	bne.s 634 <main+0x62e>
    Write(Output(), 
     616:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     61c:	4eae ffc4      	jsr -60(a6)
     620:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     626:	2200           	move.l d0,d1
     628:	243c 0000 3385 	move.l #13189,d2
     62e:	763c           	moveq #60,d3
     630:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     634:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     63a:	4878 001e      	pea 1e <main+0x18>
     63e:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
     644:	4eb9 0000 1c4e 	jsr 1c4e <TestCopperlistPos>
     64a:	4fef 000c      	lea 12(sp),sp
     64e:	4a80           	tst.l d0
     650:	661e           	bne.s 670 <main+0x66a>
    Write(Output(), 
     652:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     658:	4eae ffc4      	jsr -60(a6)
     65c:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     662:	2200           	move.l d0,d1
     664:	243c 0000 364c 	move.l #13900,d2
     66a:	763c           	moveq #60,d3
     66c:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     670:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     676:	4878 001f      	pea 1f <main+0x19>
     67a:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
     680:	4eb9 0000 1c4e 	jsr 1c4e <TestCopperlistPos>
     686:	4fef 000c      	lea 12(sp),sp
     68a:	4a80           	tst.l d0
     68c:	661e           	bne.s 6ac <main+0x6a6>
    Write(Output(), 
     68e:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     694:	4eae ffc4      	jsr -60(a6)
     698:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     69e:	2200           	move.l d0,d1
     6a0:	243c 0000 3689 	move.l #13961,d2
     6a6:	763c           	moveq #60,d3
     6a8:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6ac:	4878 0002      	pea 2 <_start+0x2>
     6b0:	4879 0000 5a40 	pea 5a40 <ClColor>
     6b6:	4878 0020      	pea 20 <main+0x1a>
     6ba:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
     6c0:	4eb9 0000 1c6c 	jsr 1c6c <TestCopperlistBatch>
     6c6:	4fef 0010      	lea 16(sp),sp
     6ca:	4a80           	tst.l d0
     6cc:	661e           	bne.s 6ec <main+0x6e6>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6ce:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     6d4:	4eae ffc4      	jsr -60(a6)
     6d8:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     6de:	2200           	move.l d0,d1
     6e0:	243c 0000 33c2 	move.l #13250,d2
     6e6:	7621           	moveq #33,d3
     6e8:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6ec:	4878 0040      	pea 40 <main+0x3a>
     6f0:	4879 0000 39ce 	pea 39ce <incbin_swfont_end+0x7f4>
     6f6:	486d ff9c      	pea -100(a5)
     6fa:	4eb9 0000 2794 	jsr 2794 <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     700:	4878 0010      	pea 10 <main+0xa>
     704:	486d ff9c      	pea -100(a5)
     708:	4878 0022      	pea 22 <main+0x1c>
     70c:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
     712:	4eb9 0000 1c6c 	jsr 1c6c <TestCopperlistBatch>
     718:	4fef 001c      	lea 28(sp),sp
     71c:	4a80           	tst.l d0
     71e:	661e           	bne.s 73e <main+0x738>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     720:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     726:	4eae ffc4      	jsr -60(a6)
     72a:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     730:	2200           	move.l d0,d1
     732:	243c 0000 36c6 	move.l #14022,d2
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
     762:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
     768:	4eb9 0000 1c6c 	jsr 1c6c <TestCopperlistBatch>
     76e:	4fef 0010      	lea 16(sp),sp
     772:	4a80           	tst.l d0
     774:	661e           	bne.s 794 <main+0x78e>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     776:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     77c:	4eae ffc4      	jsr -60(a6)
     780:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     786:	2200           	move.l d0,d1
     788:	243c 0000 36e8 	move.l #14056,d2
     78e:	762c           	moveq #44,d3
     790:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     794:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdd027>
     798:	4878 2922      	pea 2922 <__mulsi3+0x16>
     79c:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
     7a2:	4eb9 0000 1c4e 	jsr 1c4e <TestCopperlistPos>
     7a8:	4fef 000c      	lea 12(sp),sp
     7ac:	4a80           	tst.l d0
     7ae:	661e           	bne.s 7ce <main+0x7c8>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     7b0:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     7b6:	4eae ffc4      	jsr -60(a6)
     7ba:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     7c0:	2200           	move.l d0,d1
     7c2:	243c 0000 33e4 	move.l #13284,d2
     7c8:	7622           	moveq #34,d3
     7ca:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7ce:	2f3c 0001 4a00 	move.l #84480,-(sp)
     7d4:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7da:	4eb9 0000 26dc 	jsr 26dc <FreeDisplay>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7e0:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
     7e6:	7004           	moveq #4,d0
     7e8:	7202           	moveq #2,d1
     7ea:	4eae ff3a      	jsr -198(a6)

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     7ee:	4e93           	jsr (a3)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7f0:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
     7f6:	203c 0000 c800 	move.l #51200,d0
     7fc:	7202           	moveq #2,d1
     7fe:	4eae ff3a      	jsr -198(a6)
     802:	2440           	movea.l d0,a2
     804:	23c0 0000 5b24 	move.l d0,5b24 <Zoom_Source>
  if( Zoom_Source == 0) {
     80a:	508f           	addq.l #8,sp
     80c:	6700 10a8      	beq.w 18b6 <main+0x18b0>
    return;
  }

  
  UWORD *tstsource = Zoom_Source;
  *tstsource++ = 0x0000;
     810:	4252           	clr.w (a2)
  *tstsource = 0x0080;
     812:	357c 0080 0002 	move.w #128,2(a2)
  tstsource += ZMLINESIZE/2-1;
  *tstsource = 0x1000;
     818:	357c 1000 002c 	move.w #4096,44(a2)
  tstsource++;
  *tstsource = 0x8e88;
     81e:	357c 8e88 002e 	move.w #-29048,46(a2)
  tstsource += ZMLINESIZE/2-1;

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
  *tstsource++ = 0x0000;
     824:	426a 15d4      	clr.w 5588(a2)
  *tstsource = 0x00ff;
     828:	357c 00ff 15d6 	move.w #255,5590(a2)

  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 0, 8, 128);
     82e:	2439 0000 5b52 	move.l 5b52 <DrawBuffer>,d2
    srca = source + 1;
     834:	2600           	move.l d0,d3
     836:	5483           	addq.l #2,d3
  WaitBlit();
     838:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
     83e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     842:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
     848:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     84e:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltafwm = 0xffff;
     854:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     85a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     860:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     866:	317c 0028 0062 	move.w #40,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     86c:	317c ff00 0070 	move.w #-256,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     872:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = srca;
     878:	2143 0050      	move.l d3,80(a0)
  hw->bltbpt = srcb;
     87c:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = destination;
     880:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = height*64+2;
     884:	317c 2002 0058 	move.w #8194,88(a0)
  WaitBlit();
     88a:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
     890:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     894:	2479 0000 5b52 	movea.l 5b52 <DrawBuffer>,a2
  if( *destination != 0x0180) {
     89a:	0c6a 0180 0002 	cmpi.w #384,2(a2)
     8a0:	671e           	beq.s 8c0 <main+0x8ba>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
     8a2:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     8a8:	4eae ffc4      	jsr -60(a6)
     8ac:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     8b2:	2200           	move.l d0,d1
     8b4:	243c 0000 374d 	move.l #14157,d2
     8ba:	761c           	moveq #28,d3
     8bc:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8c0:	0c6a 1d88 002e 	cmpi.w #7560,46(a2)
     8c6:	671e           	beq.s 8e6 <main+0x8e0>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
     8c8:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     8ce:	4eae ffc4      	jsr -60(a6)
     8d2:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     8d8:	2200           	move.l d0,d1
     8da:	243c 0000 376a 	move.l #14186,d2
     8e0:	761c           	moveq #28,d3
     8e2:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     8e6:	2079 0000 5b52 	movea.l 5b52 <DrawBuffer>,a0
     8ec:	0c68 01ff 15d6 	cmpi.w #511,5590(a0)
     8f2:	671e           	beq.s 912 <main+0x90c>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
     8f4:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     8fa:	4eae ffc4      	jsr -60(a6)
     8fe:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     904:	2200           	move.l d0,d1
     906:	243c 0000 3787 	move.l #14215,d2
     90c:	761a           	moveq #26,d3
     90e:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     912:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
     918:	2279 0000 5b24 	movea.l 5b24 <Zoom_Source>,a1
     91e:	203c 0000 c800 	move.l #51200,d0
     924:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     928:	2f3c 0001 4a00 	move.l #84480,-(sp)
     92e:	2f3c 0000 a48c 	move.l #42124,-(sp)
     934:	4eb9 0000 26dc 	jsr 26dc <FreeDisplay>
     93a:	508f           	addq.l #8,sp
}

void TestCopyColumnOfZoom() {

  PrepareDisplayZoom();
     93c:	4e93           	jsr (a3)

  UWORD *destination = (UWORD *)DrawBuffer;
     93e:	2079 0000 5b52 	movea.l 5b52 <DrawBuffer>,a0
  *destination= 0x0000;
     944:	4250           	clr.w (a0)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     946:	317c 000f 002c 	move.w #15,44(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     94c:	317c 000f 41d4 	move.w #15,16852(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     952:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
     958:	203c 0000 c800 	move.l #51200,d0
     95e:	7202           	moveq #2,d1
     960:	4eae ff3a      	jsr -198(a6)
     964:	2440           	movea.l d0,a2
     966:	23c0 0000 5b24 	move.l d0,5b24 <Zoom_Source>
  if( Zoom_Source == 0) {
     96c:	6700 0f9a      	beq.w 1908 <main+0x1902>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }

  UWORD *tstsource = Zoom_Source;
  *tstsource = 0xffff;
     970:	34bc ffff      	move.w #-1,(a2)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     974:	357c ffff 002c 	move.w #-1,44(a2)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0xc000;
     97a:	357c c000 41d4 	move.w #-16384,16852(a2)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 1, 1);
     980:	2439 0000 5b52 	move.l 5b52 <DrawBuffer>,d2
  WaitBlit();
     986:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
     98c:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     990:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
     996:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     99c:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     9a2:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     9a8:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     9ae:	317c 002a 0064 	move.w #42,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     9b4:	317c 002a 0062 	move.w #42,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     9ba:	317c 002a 0066 	move.w #42,102(a0)
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
     9d8:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
     9de:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     9e2:	2479 0000 5b52 	movea.l 5b52 <DrawBuffer>,a2
  if( *destination != 0x4000)
     9e8:	0c52 4000      	cmpi.w #16384,(a2)
     9ec:	671e           	beq.s a0c <main+0xa06>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     9ee:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     9f4:	4eae ffc4      	jsr -60(a6)
     9f8:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     9fe:	2200           	move.l d0,d1
     a00:	243c 0000 37a2 	move.l #14242,d2
     a06:	7629           	moveq #41,d3
     a08:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x400f)
     a0c:	0c6a 400f 002c 	cmpi.w #16399,44(a2)
     a12:	671e           	beq.s a32 <main+0xa2c>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     a14:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     a1a:	4eae ffc4      	jsr -60(a6)
     a1e:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     a24:	2200           	move.l d0,d1
     a26:	243c 0000 37cc 	move.l #14284,d2
     a2c:	762a           	moveq #42,d3
     a2e:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     a32:	2479 0000 5b52 	movea.l 5b52 <DrawBuffer>,a2
     a38:	0c6a 400f 41d4 	cmpi.w #16399,16852(a2)
     a3e:	6724           	beq.s a64 <main+0xa5e>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     a40:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     a46:	4eae ffc4      	jsr -60(a6)
     a4a:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     a50:	2200           	move.l d0,d1
     a52:	243c 0000 37f7 	move.l #14327,d2
     a58:	7628           	moveq #40,d3
     a5a:	4eae ffd0      	jsr -48(a6)
     a5e:	2479 0000 5b52 	movea.l 5b52 <DrawBuffer>,a2

  destination = (UWORD *)DrawBuffer;
  *destination= 0x0000;
     a64:	4252           	clr.w (a2)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     a66:	357c 000f 002c 	move.w #15,44(a2)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     a6c:	357c 000f 41d4 	move.w #15,16852(a2)

  tstsource = Zoom_Source;
     a72:	2679 0000 5b24 	movea.l 5b24 <Zoom_Source>,a3
  *tstsource = 0xffff;
     a78:	36bc ffff      	move.w #-1,(a3)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     a7c:	377c ffff 002c 	move.w #-1,44(a3)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0x8000;
     a82:	377c 8000 41d4 	move.w #-32768,16852(a3)
  WaitBlit();
     a88:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
     a8e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     a92:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
     a98:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     a9e:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     aa4:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     aaa:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     ab0:	317c 002a 0064 	move.w #42,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     ab6:	317c 002a 0062 	move.w #42,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     abc:	317c 002a 0066 	move.w #42,102(a0)
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
     ada:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
     ae0:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     ae4:	2479 0000 5b52 	movea.l 5b52 <DrawBuffer>,a2
  if( *destination != 0x8000)
     aea:	0c52 8000      	cmpi.w #-32768,(a2)
     aee:	671e           	beq.s b0e <main+0xb08>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     af0:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     af6:	4eae ffc4      	jsr -60(a6)
     afa:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     b00:	2200           	move.l d0,d1
     b02:	243c 0000 3820 	move.l #14368,d2
     b08:	7628           	moveq #40,d3
     b0a:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x800f)
     b0e:	0c6a 800f 002c 	cmpi.w #-32753,44(a2)
     b14:	671e           	beq.s b34 <main+0xb2e>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     b16:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     b1c:	4eae ffc4      	jsr -60(a6)
     b20:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     b26:	2200           	move.l d0,d1
     b28:	243c 0000 3849 	move.l #14409,d2
     b2e:	7629           	moveq #41,d3
     b30:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     b34:	2079 0000 5b52 	movea.l 5b52 <DrawBuffer>,a0
     b3a:	0c68 800f 41d4 	cmpi.w #-32753,16852(a0)
     b40:	671e           	beq.s b60 <main+0xb5a>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     b42:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     b48:	4eae ffc4      	jsr -60(a6)
     b4c:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     b52:	2200           	move.l d0,d1
     b54:	243c 0000 3873 	move.l #14451,d2
     b5a:	7627           	moveq #39,d3
     b5c:	4eae ffd0      	jsr -48(a6)

  FreeMem( Zoom_Source, 40*256*5);
     b60:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
     b66:	2279 0000 5b24 	movea.l 5b24 <Zoom_Source>,a1
     b6c:	203c 0000 c800 	move.l #51200,d0
     b72:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     b76:	2f3c 0001 4a00 	move.l #84480,-(sp)
     b7c:	2f3c 0000 a48c 	move.l #42124,-(sp)
     b82:	4eb9 0000 26dc 	jsr 26dc <FreeDisplay>
     b88:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     b8a:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
     b90:	203c 0000 0528 	move.l #1320,d0
     b96:	7202           	moveq #2,d1
     b98:	4eae ff3a      	jsr -198(a6)
     b9c:	2440           	movea.l d0,a2
  if( source == 0) {
     b9e:	4a80           	tst.l d0
     ba0:	6700 0c92      	beq.w 1834 <main+0x182e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     ba4:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
     baa:	203c 0000 0528 	move.l #1320,d0
     bb0:	7202           	moveq #2,d1
     bb2:	4eae ff3a      	jsr -198(a6)
     bb6:	2640           	movea.l d0,a3
  if( destination == 0) {
     bb8:	4a80           	tst.l d0
     bba:	6700 0c78      	beq.w 1834 <main+0x182e>
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
     bd0:	426a 002c      	clr.w 44(a2)
    *tmp++ = 0x5555;
     bd4:	357c 5555 002e 	move.w #21845,46(a2)
    *tmp++ = 0x5555;
     bda:	357c 5555 0030 	move.w #21845,48(a2)
    *tmp = 0;
     be0:	426a 0032      	clr.w 50(a2)
    *tmp++ = 0;
     be4:	426a 0058      	clr.w 88(a2)
    *tmp++ = 0xaaaa;
     be8:	357c aaaa 005a 	move.w #-21846,90(a2)
    *tmp++ = 0xaaaa;
     bee:	357c aaaa 005c 	move.w #-21846,92(a2)
    *tmp = 0;
     bf4:	426a 005e      	clr.w 94(a2)
    *tmp++ = 0;
     bf8:	426a 0084      	clr.w 132(a2)
    *tmp++ = 0x5555;
     bfc:	357c 5555 0086 	move.w #21845,134(a2)
    *tmp++ = 0x5555;
     c02:	357c 5555 0088 	move.w #21845,136(a2)
    *tmp = 0;
     c08:	426a 008a      	clr.w 138(a2)
    *tmp++ = 0;
     c0c:	426a 00b0      	clr.w 176(a2)
    *tmp++ = 0xaaaa;
     c10:	357c aaaa 00b2 	move.w #-21846,178(a2)
    *tmp++ = 0xaaaa;
     c16:	357c aaaa 00b4 	move.w #-21846,180(a2)
    *tmp = 0;
     c1c:	426a 00b6      	clr.w 182(a2)
    *tmp++ = 0;
     c20:	426a 00dc      	clr.w 220(a2)
    *tmp++ = 0x5555;
     c24:	357c 5555 00de 	move.w #21845,222(a2)
    *tmp++ = 0x5555;
     c2a:	357c 5555 00e0 	move.w #21845,224(a2)
    *tmp = 0;
     c30:	426a 00e2      	clr.w 226(a2)
    *tmp++ = 0;
     c34:	426a 0108      	clr.w 264(a2)
    *tmp++ = 0xaaaa;
     c38:	357c aaaa 010a 	move.w #-21846,266(a2)
    *tmp++ = 0xaaaa;
     c3e:	357c aaaa 010c 	move.w #-21846,268(a2)
    *tmp = 0;
     c44:	426a 010e      	clr.w 270(a2)
    *tmp++ = 0;
     c48:	426a 0134      	clr.w 308(a2)
    *tmp++ = 0x5555;
     c4c:	357c 5555 0136 	move.w #21845,310(a2)
    *tmp++ = 0x5555;
     c52:	357c 5555 0138 	move.w #21845,312(a2)
    *tmp = 0;
     c58:	426a 013a      	clr.w 314(a2)
    *tmp++ = 0;
     c5c:	426a 0160      	clr.w 352(a2)
    *tmp++ = 0xaaaa;
     c60:	357c aaaa 0162 	move.w #-21846,354(a2)
    *tmp++ = 0xaaaa;
     c66:	357c aaaa 0164 	move.w #-21846,356(a2)
    *tmp = 0;
     c6c:	426a 0166      	clr.w 358(a2)
    *tmp++ = 0;
     c70:	426a 018c      	clr.w 396(a2)
    *tmp++ = 0x5555;
     c74:	357c 5555 018e 	move.w #21845,398(a2)
    *tmp++ = 0x5555;
     c7a:	357c 5555 0190 	move.w #21845,400(a2)
    *tmp = 0;
     c80:	426a 0192      	clr.w 402(a2)
    *tmp++ = 0;
     c84:	426a 01b8      	clr.w 440(a2)
    *tmp++ = 0xaaaa;
     c88:	357c aaaa 01ba 	move.w #-21846,442(a2)
    *tmp++ = 0xaaaa;
     c8e:	357c aaaa 01bc 	move.w #-21846,444(a2)
    *tmp = 0;
     c94:	426a 01be      	clr.w 446(a2)
    *tmp++ = 0;
     c98:	426a 01e4      	clr.w 484(a2)
    *tmp++ = 0x5555;
     c9c:	357c 5555 01e6 	move.w #21845,486(a2)
    *tmp++ = 0x5555;
     ca2:	357c 5555 01e8 	move.w #21845,488(a2)
    *tmp = 0;
     ca8:	426a 01ea      	clr.w 490(a2)
    *tmp++ = 0;
     cac:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0xaaaa;
     cb0:	357c aaaa 0212 	move.w #-21846,530(a2)
    *tmp++ = 0xaaaa;
     cb6:	357c aaaa 0214 	move.w #-21846,532(a2)
    *tmp = 0;
     cbc:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
     cc0:	426a 023c      	clr.w 572(a2)
    *tmp++ = 0x5555;
     cc4:	357c 5555 023e 	move.w #21845,574(a2)
    *tmp++ = 0x5555;
     cca:	357c 5555 0240 	move.w #21845,576(a2)
    *tmp = 0;
     cd0:	426a 0242      	clr.w 578(a2)
    *tmp++ = 0;
     cd4:	426a 0268      	clr.w 616(a2)
    *tmp++ = 0xaaaa;
     cd8:	357c aaaa 026a 	move.w #-21846,618(a2)
    *tmp++ = 0xaaaa;
     cde:	357c aaaa 026c 	move.w #-21846,620(a2)
    *tmp = 0;
     ce4:	426a 026e      	clr.w 622(a2)
    *tmp++ = 0;
     ce8:	426a 0294      	clr.w 660(a2)
    *tmp++ = 0x5555;
     cec:	357c 5555 0296 	move.w #21845,662(a2)
    *tmp++ = 0x5555;
     cf2:	357c 5555 0298 	move.w #21845,664(a2)
    *tmp = 0;
     cf8:	426a 029a      	clr.w 666(a2)
    tmp += ZMLINESIZE/2-3;
     cfc:	4878 0528      	pea 528 <main+0x522>
     d00:	42a7           	clr.l -(sp)
     d02:	2f00           	move.l d0,-(sp)
     d04:	4eb9 0000 2826 	jsr 2826 <memset>
  WaitBlit();
     d0a:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
     d10:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     d14:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
     d1a:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     d20:	317c 39f0 0040 	move.w #14832,64(a0)
  hw->bltafwm = 0xffff;
     d26:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     d2c:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     d32:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     d38:	317c 0028 0066 	move.w #40,102(a0)
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
     d50:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
     d56:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     d5a:	4fef 000c      	lea 12(sp),sp
     d5e:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
     d64:	671e           	beq.s d84 <main+0xd7e>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     d66:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     d6c:	4eae ffc4      	jsr -60(a6)
     d70:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     d76:	2200           	move.l d0,d1
     d78:	243c 0000 38d1 	move.l #14545,d2
     d7e:	761f           	moveq #31,d3
     d80:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     d84:	0c6b aaaa 002e 	cmpi.w #-21846,46(a3)
     d8a:	671e           	beq.s daa <main+0xda4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     d8c:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     d92:	4eae ffc4      	jsr -60(a6)
     d96:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
     d9c:	2200           	move.l d0,d1
     d9e:	243c 0000 38f1 	move.l #14577,d2
     da4:	7620           	moveq #32,d3
     da6:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     daa:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
     db0:	224a           	movea.l a2,a1
     db2:	203c 0000 0528 	move.l #1320,d0
     db8:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     dbc:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
     dc2:	224b           	movea.l a3,a1
     dc4:	203c 0000 0528 	move.l #1320,d0
     dca:	4eae ff2e      	jsr -210(a6)
5    5    5    2    a    a    a    a    9    5    5    5    5    4    a    a
abcd efgh ijkl 1234 5678 9abc defg hijk l123 4567 89ab cdef ghij kl12 3456 789a
1010 1010 1010 0101 0101 0101 0101 0101 0010 1010 1010 1010 1010 1001 0101 0101
a    a    a    5    5    5    5    5    2    a    a    a    a    9    5    5*/ 
void TestZoom4Picture() {
  UWORD *source =AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dce:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
     dd4:	203c 0000 3300 	move.l #13056,d0
     dda:	7202           	moveq #2,d1
     ddc:	4eae ff3a      	jsr -198(a6)
     de0:	2840           	movea.l d0,a4
  if( source == 0) {
     de2:	4a80           	tst.l d0
     de4:	6700 0a86      	beq.w 186c <main+0x1866>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     de8:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
     dee:	203c 0000 3300 	move.l #13056,d0
     df4:	7202           	moveq #2,d1
     df6:	4eae ff3a      	jsr -198(a6)
     dfa:	2b40 ff8c      	move.l d0,-116(a5)
  if( destination == 0) {
     dfe:	6700 0b54      	beq.w 1954 <main+0x194e>
     e02:	200c           	move.l a4,d0
     e04:	0680 0000 2ec0 	addi.l #11968,d0
     e0a:	204c           	movea.l a4,a0
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
     e0c:	20bc 5555 5555 	move.l #1431655765,(a0)
     e12:	217c 5555 5555 	move.l #1431655765,4(a0)
     e18:	0004 
     e1a:	217c 5555 5555 	move.l #1431655765,8(a0)
     e20:	0008 
     e22:	217c 5555 5555 	move.l #1431655765,12(a0)
     e28:	000c 
     e2a:	217c 5555 5555 	move.l #1431655765,16(a0)
     e30:	0010 
     e32:	217c 5555 5555 	move.l #1431655765,20(a0)
     e38:	0014 
     e3a:	217c 5555 5555 	move.l #1431655765,24(a0)
     e40:	0018 
     e42:	217c 5555 5555 	move.l #1431655765,28(a0)
     e48:	001c 
     e4a:	217c 5555 5555 	move.l #1431655765,32(a0)
     e50:	0020 
     e52:	217c 5555 5555 	move.l #1431655765,36(a0)
     e58:	0024 
     e5a:	217c 5555 5555 	move.l #1431655765,40(a0)
     e60:	0028 
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
     e62:	217c aaaa aaaa 	move.l #-1431655766,44(a0)
     e68:	002c 
     e6a:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     e70:	0030 
     e72:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     e78:	0034 
     e7a:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     e80:	0038 
     e82:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     e88:	003c 
     e8a:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     e90:	0040 
     e92:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     e98:	0044 
     e9a:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     ea0:	0048 
     ea2:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     ea8:	004c 
     eaa:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     eb0:	0050 
     eb2:	41e8 0058      	lea 88(a0),a0
     eb6:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     ebc:	fffc 
  for(int i=0;i<128+8;i++) {
     ebe:	b088           	cmp.l a0,d0
     ec0:	6600 ff4a      	bne.w e0c <main+0xe06>
     ec4:	49ec 0188      	lea 392(a4),a4
     ec8:	266d ff8c      	movea.l -116(a5),a3
     ecc:	47eb 2ee8      	lea 12008(a3),a3
  UWORD shiftright = 7;
     ed0:	7407           	moveq #7,d2
  UWORD nextzoom = 352-28;
     ed2:	347c 0144      	movea.w #324,a2
  UWORD startofword = 336;
     ed6:	3b7c 0150 ff8a 	move.w #336,-118(a5)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     edc:	3e3c 0150      	move.w #336,d7
     ee0:	2b4c ff86      	move.l a4,-122(a5)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*8-2-i;
     ee4:	282d ff86      	move.l -122(a5),d4
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
     ee8:	260b           	move.l a3,d3
     eea:	0683 ffff d140 	addi.l #-11968,d3
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
     ef0:	3c02           	move.w d2,d6
     ef2:	700c           	moveq #12,d0
     ef4:	e16e           	lsl.w d0,d6
     ef6:	be4a           	cmp.w a2,d7
     ef8:	6500 0652      	bcs.w 154c <main+0x1546>
  hw->bltcon0 = 0x9f0 + shiftright;
     efc:	0646 09f0      	addi.w #2544,d6
  WaitBlit();
     f00:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
     f06:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     f0a:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
     f10:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     f16:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
     f1a:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     f20:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     f26:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     f2c:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = (UWORD *) source;
     f32:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
     f36:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
     f3a:	317c 0402 0058 	move.w #1026,88(a0)
        pos4source += ZMLINESIZE/2*16;
     f40:	0684 0000 02c0 	addi.l #704,d4
        pos4dest += ZMLINESIZE/2*16;
     f46:	2a03           	move.l d3,d5
     f48:	0685 0000 02c0 	addi.l #704,d5
  WaitBlit();
     f4e:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
     f54:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     f58:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
     f5e:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     f64:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
     f68:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     f6e:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     f74:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     f7a:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = (UWORD *) source;
     f80:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
     f84:	2145 0054      	move.l d5,84(a0)
  hw->bltsize = height*64+2;
     f88:	317c 0042 0058 	move.w #66,88(a0)
        pos4dest += ZMLINESIZE/2;
     f8e:	0683 0000 02ec 	addi.l #748,d3
      for(int i=0;i<16;i++) {
     f94:	b7c3           	cmpa.l d3,a3
     f96:	6600 ff68      	bne.w f00 <main+0xefa>
    startofword -= 16;
     f9a:	0647 fff0      	addi.w #-16,d7
     f9e:	55ad ff86      	subq.l #2,-122(a5)
     fa2:	558b           	subq.l #2,a3
  for(int i=0;i<4;i++) {
     fa4:	0c47 0110      	cmpi.w #272,d7
     fa8:	6600 ff3a      	bne.w ee4 <main+0xede>
  }
  
  Zoom_ZoomIntoPicture( source, destination);
  WaitBlit();
     fac:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
     fb2:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+ZMLINESIZE/2-4; 
  UWORD *valsupposed = destline+ZMLINESIZE/2-4;
  for(int i=0;i<16;i++) {
     fb6:	282d ff8c      	move.l -116(a5),d4
     fba:	0684 0000 02e4 	addi.l #740,d4
  WaitBlit();
     fc0:	307c 0010      	movea.w #16,a0
     fc4:	2b48 ff8c      	move.l a0,-116(a5)
  data[1] = numberofline;

  for(int i=0;i<3;i++) {
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
     fc8:	2e3c 0000 31db 	move.l #12763,d7
     fce:	2c3c 0000 2a14 	move.l #10772,d6
     fd4:	2844           	movea.l d4,a4
     fd6:	49ec fd40      	lea -704(a4),a4
     fda:	7af0           	moveq #-16,d5
     fdc:	daad ff8c      	add.l -116(a5),d5
      TestRow( valsupposed, valactual, 0x0000, i2+i*17);
     fe0:	2f05           	move.l d5,-(sp)
     fe2:	2f0c           	move.l a4,-(sp)
     fe4:	4eb9 0000 19ee 	jsr 19ee <TestRow.constprop.4>
  char str[ 100] = { 0 };
     fea:	4878 0064      	pea 64 <main+0x5e>
     fee:	42a7           	clr.l -(sp)
     ff0:	486d ff9c      	pea -100(a5)
     ff4:	4eb9 0000 2826 	jsr 2826 <memset>
  data[1] = numberofline;
     ffa:	3005           	move.w d5,d0
     ffc:	5240           	addq.w #1,d0
     ffe:	3b40 ff92      	move.w d0,-110(a5)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1002:	3039 0000 5adc 	move.w 5adc <destline+0x24>,d0
    1008:	4640           	not.w d0
    100a:	4fef 0014      	lea 20(sp),sp
    100e:	b06c 002c      	cmp.w 44(a4),d0
    1012:	6734           	beq.s 1048 <main+0x1042>
      data[0] = i;
    1014:	426d ff90      	clr.w -112(a5)
      RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    1018:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    101e:	2047           	movea.l d7,a0
    1020:	43ed ff90      	lea -112(a5),a1
    1024:	2446           	movea.l d6,a2
    1026:	47ed ff9c      	lea -100(a5),a3
    102a:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    102e:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1034:	4eae ffc4      	jsr -60(a6)
    1038:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    103e:	2200           	move.l d0,d1
    1040:	240b           	move.l a3,d2
    1042:	7664           	moveq #100,d3
    1044:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1048:	3039 0000 5ade 	move.w 5ade <destline+0x26>,d0
    104e:	4640           	not.w d0
    1050:	b06c 002e      	cmp.w 46(a4),d0
    1054:	6736           	beq.s 108c <main+0x1086>
      data[0] = i;
    1056:	3b7c 0001 ff90 	move.w #1,-112(a5)
      RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    105c:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    1062:	2047           	movea.l d7,a0
    1064:	43ed ff90      	lea -112(a5),a1
    1068:	2446           	movea.l d6,a2
    106a:	47ed ff9c      	lea -100(a5),a3
    106e:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1072:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1078:	4eae ffc4      	jsr -60(a6)
    107c:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1082:	2200           	move.l d0,d1
    1084:	240b           	move.l a3,d2
    1086:	7664           	moveq #100,d3
    1088:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    108c:	3039 0000 5ae0 	move.w 5ae0 <destline+0x28>,d0
    1092:	4640           	not.w d0
    1094:	b06c 0030      	cmp.w 48(a4),d0
    1098:	6736           	beq.s 10d0 <main+0x10ca>
      data[0] = i;
    109a:	3b7c 0002 ff90 	move.w #2,-112(a5)
      RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    10a0:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    10a6:	2047           	movea.l d7,a0
    10a8:	43ed ff90      	lea -112(a5),a1
    10ac:	2446           	movea.l d6,a2
    10ae:	47ed ff9c      	lea -100(a5),a3
    10b2:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    10b6:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    10bc:	4eae ffc4      	jsr -60(a6)
    10c0:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    10c6:	2200           	move.l d0,d1
    10c8:	240b           	move.l a3,d2
    10ca:	7664           	moveq #100,d3
    10cc:	4eae ffd0      	jsr -48(a6)
    }
  }
  if( ( (*testpattern++ ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    10d0:	3039 0000 5ae2 	move.w 5ae2 <destline+0x2a>,d0
    10d6:	322c 0032      	move.w 50(a4),d1
    10da:	b340           	eor.w d1,d0
    10dc:	4640           	not.w d0
    10de:	0240 ff00      	andi.w #-256,d0
    10e2:	6700 042e      	beq.w 1512 <main+0x150c>
    data[0] = ZMLINESIZE/2;
    10e6:	3b7c 0016 ff90 	move.w #22,-112(a5)
    RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    10ec:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    10f2:	2047           	movea.l d7,a0
    10f4:	43ed ff90      	lea -112(a5),a1
    10f8:	2446           	movea.l d6,a2
    10fa:	47ed ff9c      	lea -100(a5),a3
    10fe:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1102:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1108:	4eae ffc4      	jsr -60(a6)
    110c:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1112:	2200           	move.l d0,d1
    1114:	240b           	move.l a3,d2
    1116:	7664           	moveq #100,d3
    1118:	4eae ffd0      	jsr -48(a6)
      valactual += ZMLINESIZE/2;
    111c:	49ec 0058      	lea 88(a4),a4
    1120:	5485           	addq.l #2,d5
    for(int i2=0;i2<16;i2+=2) {
    1122:	b88c           	cmp.l a4,d4
    1124:	6600 feba      	bne.w fe0 <main+0xfda>
    *bp = 0;
    1128:	4278 0200      	clr.w 200 <main+0x1fa>
    TestRow( valsupposed, valactual, 0x0000, 16+i*17);
    112c:	2f2d ff8c      	move.l -116(a5),-(sp)
    1130:	2f04           	move.l d4,-(sp)
    1132:	4eb9 0000 19ee 	jsr 19ee <TestRow.constprop.4>
    valactual += ZMLINESIZE/2;
    1138:	0684 0000 02ec 	addi.l #748,d4
    113e:	7a11           	moveq #17,d5
    1140:	dbad ff8c      	add.l d5,-116(a5)
  for(int i=0;i<16;i++) {
    1144:	508f           	addq.l #8,sp
    1146:	0cad 0000 0120 	cmpi.l #288,-116(a5)
    114c:	ff8c 
    114e:	6600 fe84      	bne.w fd4 <main+0xfce>
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
    1152:	4eb9 0000 259e 	jsr 259e <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    1158:	4878 0010      	pea 10 <main+0xa>
    115c:	4879 0000 5a78 	pea 5a78 <ClsSprites>
    1162:	42a7           	clr.l -(sp)
    1164:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
    116a:	4eb9 0000 1c6c 	jsr 1c6c <TestCopperlistBatch>
    1170:	4fef 0010      	lea 16(sp),sp
    1174:	4a80           	tst.l d0
    1176:	661e           	bne.s 1196 <main+0x1190>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    1178:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    117e:	4eae ffc4      	jsr -60(a6)
    1182:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1188:	2200           	move.l d0,d1
    118a:	243c 0000 35df 	move.l #13791,d2
    1190:	762c           	moveq #44,d3
    1192:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    1196:	4878 000c      	pea c <main+0x6>
    119a:	4879 0000 5a48 	pea 5a48 <ClScreen>
    11a0:	4878 0010      	pea 10 <main+0xa>
    11a4:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
    11aa:	4eb9 0000 1c6c 	jsr 1c6c <TestCopperlistBatch>
    11b0:	4fef 0010      	lea 16(sp),sp
    11b4:	4a80           	tst.l d0
    11b6:	661e           	bne.s 11d6 <main+0x11d0>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    11b8:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    11be:	4eae ffc4      	jsr -60(a6)
    11c2:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    11c8:	2200           	move.l d0,d1
    11ca:	243c 0000 3615 	move.l #13845,d2
    11d0:	7636           	moveq #54,d3
    11d2:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    11d6:	4878 0002      	pea 2 <_start+0x2>
    11da:	4879 0000 5a40 	pea 5a40 <ClColor>
    11e0:	4878 001e      	pea 1e <main+0x18>
    11e4:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
    11ea:	4eb9 0000 1c6c 	jsr 1c6c <TestCopperlistBatch>
    11f0:	4fef 0010      	lea 16(sp),sp
    11f4:	4a80           	tst.l d0
    11f6:	661e           	bne.s 1216 <main+0x1210>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    11f8:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    11fe:	4eae ffc4      	jsr -60(a6)
    1202:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1208:	2200           	move.l d0,d1
    120a:	243c 0000 33c2 	move.l #13250,d2
    1210:	7621           	moveq #33,d3
    1212:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    1216:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdd027>
    121a:	4878 0020      	pea 20 <main+0x1a>
    121e:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
    1224:	4eb9 0000 1c4e 	jsr 1c4e <TestCopperlistPos>
    122a:	4fef 000c      	lea 12(sp),sp
    122e:	4a80           	tst.l d0
    1230:	6700 024a      	beq.w 147c <main+0x1476>
    Write( Output(), "Copperlist End not correctly set.\n", 34);

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    1234:	2479 0000 5b52 	movea.l 5b52 <DrawBuffer>,a2
    123a:	4879 0000 398b 	pea 398b <incbin_swfont_end+0x7b1>
    1240:	2f0a           	move.l a2,-(sp)
    1242:	4eb9 0000 19a0 	jsr 19a0 <WriteFont.constprop.6>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    1248:	508f           	addq.l #8,sp
    124a:	0c52 ff00      	cmpi.w #-256,(a2)
    124e:	671e           	beq.s 126e <main+0x1268>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    1250:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1256:	4eae ffc4      	jsr -60(a6)
    125a:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1260:	2200           	move.l d0,d1
    1262:	243c 0000 399c 	move.l #14748,d2
    1268:	7631           	moveq #49,d3
    126a:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    126e:	2f3c 0000 c800 	move.l #51200,-(sp)
    1274:	4878 0084      	pea 84 <main+0x7e>
    1278:	4eb9 0000 26dc 	jsr 26dc <FreeDisplay>
  RunTests();
	Delay(50);
    127e:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1284:	7232           	moveq #50,d1
    1286:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    128a:	247c 00f0 ff60 	movea.l #15794016,a2
    1290:	508f           	addq.l #8,sp
    1292:	4a92           	tst.l (a2)
    1294:	6718           	beq.s 12ae <main+0x12a8>
    1296:	4878 0001      	pea 1 <_start+0x1>
    129a:	47f9 0000 1b44 	lea 1b44 <warpmode.part.0>,a3
    12a0:	4e93           	jsr (a3)
    12a2:	588f           	addq.l #4,sp
    12a4:	4a92           	tst.l (a2)
    12a6:	6706           	beq.s 12ae <main+0x12a8>
    12a8:	42a7           	clr.l -(sp)
    12aa:	4e93           	jsr (a3)
    12ac:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    12ae:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    12b4:	23ee 0022 0000 	move.l 34(a6),5b28 <ActiView>
    12ba:	5b28 
	OwnBlitter();
    12bc:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    12c0:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    12c6:	4eae ff1c      	jsr -228(a6)
	Disable();
    12ca:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    12d0:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    12d4:	2679 0000 5b3e 	movea.l 5b3e <hw>,a3
    12da:	302b 0010      	move.w 16(a3),d0
    12de:	33c0 0000 5b2c 	move.w d0,5b2c <SystemADKCON>
	SystemInts=hw->intenar;
    12e4:	302b 001c      	move.w 28(a3),d0
    12e8:	33c0 0000 5b30 	move.w d0,5b30 <SystemInts>
	SystemDMA=hw->dmaconr;
    12ee:	302b 0002      	move.w 2(a3),d0
    12f2:	33c0 0000 5b2e 	move.w d0,5b2e <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    12f8:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    12fe:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
    1304:	45f9 0000 274e 	lea 274e <WaitVbl>,a2
    130a:	4e92           	jsr (a2)
	WaitVbl();
    130c:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
    130e:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    1314:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    131a:	93c9           	suba.l a1,a1
    131c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    1320:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    1326:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    132a:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    1330:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    1334:	4e92           	jsr (a2)
	WaitVbl();
    1336:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    1338:	3b7c 4e7a ff9c 	move.w #20090,-100(a5)
    133e:	3b7c 0801 ff9e 	move.w #2049,-98(a5)
    1344:	3b7c 4e73 ffa0 	move.w #20083,-96(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    134a:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    1350:	082e 0000 0129 	btst #0,297(a6)
    1356:	6700 05d2      	beq.w 192a <main+0x1924>
		vbr = (APTR)Supervisor((void*)getvbr);
    135a:	7e9c           	moveq #-100,d7
    135c:	de8d           	add.l a5,d7
    135e:	cf8d           	exg d7,a5
    1360:	4eae ffe2      	jsr -30(a6)
    1364:	cf8d           	exg d7,a5

	VBR=GetVBR();
    1366:	23c0 0000 5b32 	move.l d0,5b32 <VBR.lto_priv.7>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    136c:	2079 0000 5b32 	movea.l 5b32 <VBR.lto_priv.7>,a0
    1372:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    1376:	23c2 0000 5b36 	move.l d2,5b36 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    137c:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
    137e:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1380:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
    1386:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    138a:	3028 0002      	move.w 2(a0),d0
    138e:	0800 000e      	btst #14,d0
    1392:	66f6           	bne.s 138a <main+0x1384>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    1394:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    139a:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    13a0:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    13a6:	2279 0000 5b32 	movea.l 5b32 <VBR.lto_priv.7>,a1
    13ac:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    13b0:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    13b6:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    13bc:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    13c2:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    13c8:	3039 0000 5b30 	move.w 5b30 <SystemInts>,d0
    13ce:	0040 8000      	ori.w #-32768,d0
    13d2:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    13d6:	3039 0000 5b2e 	move.w 5b2e <SystemDMA>,d0
    13dc:	0040 8000      	ori.w #-32768,d0
    13e0:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    13e4:	3039 0000 5b2c 	move.w 5b2c <SystemADKCON>,d0
    13ea:	0040 8000      	ori.w #-32768,d0
    13ee:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    13f2:	2279 0000 5b28 	movea.l 5b28 <ActiView>,a1
    13f8:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    13fc:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    1402:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    1406:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    140c:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    1410:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    1416:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    141a:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    1420:	4eae fe32      	jsr -462(a6)
	Enable();
    1424:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    142a:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    142e:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    1434:	2279 0000 5b62 	movea.l 5b62 <DOSBase>,a1
    143a:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    143e:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    1444:	2279 0000 5b3a 	movea.l 5b3a <GfxBase>,a1
    144a:	4eae fe62      	jsr -414(a6)
}
    144e:	7000           	moveq #0,d0
    1450:	4ced 5cfc ff5c 	movem.l -164(a5),d2-d7/a2-a4/a6
    1456:	4e5d           	unlk a5
    1458:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    145a:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1460:	4eae ffc4      	jsr -60(a6)
    1464:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    146a:	2200           	move.l d0,d1
    146c:	243c 0000 35df 	move.l #13791,d2
    1472:	762c           	moveq #44,d3
    1474:	4eae ffd0      	jsr -48(a6)
    1478:	6000 ed2e      	bra.w 1a8 <main+0x1a2>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    147c:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1482:	4eae ffc4      	jsr -60(a6)
    1486:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    148c:	2200           	move.l d0,d1
    148e:	243c 0000 33e4 	move.l #13284,d2
    1494:	7622           	moveq #34,d3
    1496:	4eae ffd0      	jsr -48(a6)
    149a:	6000 fd98      	bra.w 1234 <main+0x122e>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    149e:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    14a4:	4eae ffc4      	jsr -60(a6)
    14a8:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    14ae:	2200           	move.l d0,d1
    14b0:	243c 0000 33c2 	move.l #13250,d2
    14b6:	7621           	moveq #33,d3
    14b8:	4eae ffd0      	jsr -48(a6)
    14bc:	2079 0000 5b5e 	movea.l 5b5e <Copperlist1>,a0
    14c2:	6000 ee58      	bra.w 31c <main+0x316>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    14c6:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    14cc:	4eae ffc4      	jsr -60(a6)
    14d0:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    14d6:	2200           	move.l d0,d1
    14d8:	243c 0000 3615 	move.l #13845,d2
    14de:	7636           	moveq #54,d3
    14e0:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    14e4:	23fc 0004 0000 	move.l #262144,5b52 <DrawBuffer>
    14ea:	0000 5b52 
  ViewBuffer = (ULONG *)0x50000;
    14ee:	23fc 0005 0000 	move.l #327680,5b46 <ViewBuffer>
    14f4:	0000 5b46 
  SetBplPointers();
    14f8:	45f9 0000 2572 	lea 2572 <SetBplPointers>,a2
    14fe:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    1500:	0cb9 0005 0000 	cmpi.l #327680,5b52 <DrawBuffer>
    1506:	0000 5b52 
    150a:	6600 ed74      	bne.w 280 <main+0x27a>
    150e:	6000 02be      	bra.w 17ce <main+0x17c8>
      valactual += ZMLINESIZE/2;
    1512:	49ec 0058      	lea 88(a4),a4
    1516:	5485           	addq.l #2,d5
    for(int i2=0;i2<16;i2+=2) {
    1518:	b88c           	cmp.l a4,d4
    151a:	6600 fac4      	bne.w fe0 <main+0xfda>
    *bp = 0;
    151e:	4278 0200      	clr.w 200 <main+0x1fa>
    TestRow( valsupposed, valactual, 0x0000, 16+i*17);
    1522:	2f2d ff8c      	move.l -116(a5),-(sp)
    1526:	2f04           	move.l d4,-(sp)
    1528:	4eb9 0000 19ee 	jsr 19ee <TestRow.constprop.4>
    valactual += ZMLINESIZE/2;
    152e:	0684 0000 02ec 	addi.l #748,d4
    1534:	7a11           	moveq #17,d5
    1536:	dbad ff8c      	add.l d5,-116(a5)
  for(int i=0;i<16;i++) {
    153a:	508f           	addq.l #8,sp
    153c:	0cad 0000 0120 	cmpi.l #288,-116(a5)
    1542:	ff8c 
    1544:	6600 fa8e      	bne.w fd4 <main+0xfce>
    1548:	6000 fc08      	bra.w 1152 <main+0x114c>
      UWORD colnr = nextzoom - startofword - 1; 
    154c:	300a           	move.w a2,d0
    154e:	5340           	subq.w #1,d0
    1550:	9047           	sub.w d7,d0
      nextzoom -= 21;
    1552:	45ea ffeb      	lea -21(a2),a2
    shifta = (shift - 1) << 12;
    1556:	3a02           	move.w d2,d5
    1558:	5345           	subq.w #1,d5
    155a:	3b45 ff8a      	move.w d5,-118(a5)
    155e:	3205           	move.w d5,d1
    1560:	7a0c           	moveq #12,d5
    1562:	eb69           	lsl.w d5,d1
  hw->bltcon0 = 0xde4 + shifta;
    1564:	3a3c f000      	move.w #-4096,d5
    1568:	4a42           	tst.w d2
    156a:	6702           	beq.s 156e <main+0x1568>
    156c:	3a01           	move.w d1,d5
    156e:	0645 0de4      	addi.w #3556,d5
        Zoom_ZoomBlit( pos4source, pos4dest, shiftright, colnr, 16);
    1572:	0280 0000 ffff 	andi.l #65535,d0
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1578:	7210           	moveq #16,d1
    157a:	9280           	sub.l d0,d1
    157c:	2001           	move.l d1,d0
    157e:	7200           	moveq #0,d1
    1580:	4641           	not.w d1
    1582:	e1a9           	lsl.l d0,d1
    1584:	2841           	movea.l d1,a4
    1586:	4a42           	tst.w d2
    1588:	6600 00dc      	bne.w 1666 <main+0x1660>
    158c:	242d ff86      	move.l -122(a5),d2
    1590:	5482           	addq.l #2,d2
  WaitBlit();
    1592:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    1598:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    159c:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
    15a2:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    15a8:	3145 0040      	move.w d5,64(a0)
  hw->bltafwm = 0xffff;
    15ac:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    15b2:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    15b8:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    15be:	317c 0028 0062 	move.w #40,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    15c4:	314c 0070      	move.w a4,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    15c8:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = srca;
    15ce:	2142 0050      	move.l d2,80(a0)
  hw->bltbpt = srcb;
    15d2:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    15d6:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    15da:	317c 0402 0058 	move.w #1026,88(a0)
        pos4source += ZMLINESIZE/2*16;
    15e0:	0684 0000 02c0 	addi.l #704,d4
        pos4dest += ZMLINESIZE/2*16;
    15e6:	2c03           	move.l d3,d6
    15e8:	0686 0000 02c0 	addi.l #704,d6
        Zoom_ZoomBlit( pos4source, pos4dest, shiftright, colnr, 1);
    15ee:	2404           	move.l d4,d2
    15f0:	5482           	addq.l #2,d2
  WaitBlit();
    15f2:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    15f8:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    15fc:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
    1602:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1608:	3145 0040      	move.w d5,64(a0)
  hw->bltafwm = 0xffff;
    160c:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1612:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1618:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    161e:	317c 0028 0062 	move.w #40,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1624:	314c 0070      	move.w a4,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1628:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = srca;
    162e:	2142 0050      	move.l d2,80(a0)
  hw->bltbpt = srcb;
    1632:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    1636:	2146 0054      	move.l d6,84(a0)
  hw->bltsize = height*64+2;
    163a:	317c 0042 0058 	move.w #66,88(a0)
        pos4dest += ZMLINESIZE/2;
    1640:	0683 0000 02ec 	addi.l #748,d3
      for(int i=0;i<16;i++) {
    1646:	b7c3           	cmpa.l d3,a3
    1648:	6600 ff48      	bne.w 1592 <main+0x158c>
    shifta = (shift - 1) << 12;
    164c:	342d ff8a      	move.w -118(a5),d2
    startofword -= 16;
    1650:	0647 fff0      	addi.w #-16,d7
    1654:	55ad ff86      	subq.l #2,-122(a5)
    1658:	558b           	subq.l #2,a3
  for(int i=0;i<4;i++) {
    165a:	0c47 0110      	cmpi.w #272,d7
    165e:	6600 f884      	bne.w ee4 <main+0xede>
    1662:	6000 f948      	bra.w fac <main+0xfa6>
  WaitBlit();
    1666:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    166c:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1670:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
    1676:	3146 0042      	move.w d6,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    167a:	3145 0040      	move.w d5,64(a0)
  hw->bltafwm = 0xffff;
    167e:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1684:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    168a:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1690:	317c 0028 0062 	move.w #40,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1696:	314c 0070      	move.w a4,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    169a:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = srca;
    16a0:	2144 0050      	move.l d4,80(a0)
  hw->bltbpt = srcb;
    16a4:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    16a8:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    16ac:	317c 0402 0058 	move.w #1026,88(a0)
        pos4source += ZMLINESIZE/2*16;
    16b2:	0684 0000 02c0 	addi.l #704,d4
        pos4dest += ZMLINESIZE/2*16;
    16b8:	2403           	move.l d3,d2
    16ba:	0682 0000 02c0 	addi.l #704,d2
  WaitBlit();
    16c0:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    16c6:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    16ca:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
    16d0:	3146 0042      	move.w d6,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    16d4:	3145 0040      	move.w d5,64(a0)
  hw->bltafwm = 0xffff;
    16d8:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    16de:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    16e4:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    16ea:	317c 0028 0062 	move.w #40,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    16f0:	314c 0070      	move.w a4,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    16f4:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = srca;
    16fa:	2144 0050      	move.l d4,80(a0)
  hw->bltbpt = srcb;
    16fe:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    1702:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = height*64+2;
    1706:	317c 0042 0058 	move.w #66,88(a0)
        pos4dest += ZMLINESIZE/2;
    170c:	0683 0000 02ec 	addi.l #748,d3
      for(int i=0;i<16;i++) {
    1712:	b7c3           	cmpa.l d3,a3
    1714:	6700 ff36      	beq.w 164c <main+0x1646>
  WaitBlit();
    1718:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    171e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1722:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
    1728:	3146 0042      	move.w d6,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    172c:	3145 0040      	move.w d5,64(a0)
  hw->bltafwm = 0xffff;
    1730:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1736:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    173c:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1742:	317c 0028 0062 	move.w #40,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1748:	314c 0070      	move.w a4,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    174c:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = srca;
    1752:	2144 0050      	move.l d4,80(a0)
  hw->bltbpt = srcb;
    1756:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    175a:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    175e:	317c 0402 0058 	move.w #1026,88(a0)
        pos4source += ZMLINESIZE/2*16;
    1764:	0684 0000 02c0 	addi.l #704,d4
        pos4dest += ZMLINESIZE/2*16;
    176a:	2403           	move.l d3,d2
    176c:	0682 0000 02c0 	addi.l #704,d2
  WaitBlit();
    1772:	2c79 0000 5b3a 	movea.l 5b3a <GfxBase>,a6
    1778:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    177c:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
    1782:	3146 0042      	move.w d6,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1786:	3145 0040      	move.w d5,64(a0)
  hw->bltafwm = 0xffff;
    178a:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1790:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1796:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    179c:	317c 0028 0062 	move.w #40,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    17a2:	314c 0070      	move.w a4,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    17a6:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = srca;
    17ac:	2144 0050      	move.l d4,80(a0)
  hw->bltbpt = srcb;
    17b0:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    17b4:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = height*64+2;
    17b8:	317c 0042 0058 	move.w #66,88(a0)
        pos4dest += ZMLINESIZE/2;
    17be:	0683 0000 02ec 	addi.l #748,d3
      for(int i=0;i<16;i++) {
    17c4:	b7c3           	cmpa.l d3,a3
    17c6:	6600 fe9e      	bne.w 1666 <main+0x1660>
    17ca:	6000 fe80      	bra.w 164c <main+0x1646>
    17ce:	0cb9 0004 0000 	cmpi.l #262144,5b46 <ViewBuffer>
    17d4:	0000 5b46 
    17d8:	6700 eac4      	beq.w 29e <main+0x298>
    Write( Output(), 
    17dc:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    17e2:	4eae ffc4      	jsr -60(a6)
    17e6:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    17ec:	2200           	move.l d0,d1
    17ee:	243c 0000 330c 	move.l #13068,d2
    17f4:	763b           	moveq #59,d3
    17f6:	4eae ffd0      	jsr -48(a6)
    17fa:	6000 eaa2      	bra.w 29e <main+0x298>
		Exit(0);
    17fe:	9dce           	suba.l a6,a6
    1800:	7200           	moveq #0,d1
    1802:	4eae ff70      	jsr -144(a6)
    1806:	6000 e84c      	bra.w 54 <main+0x4e>
		Exit(0);
    180a:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1810:	7200           	moveq #0,d1
    1812:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    1816:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    181c:	43f9 0000 32d1 	lea 32d1 <incbin_swfont_end+0xf7>,a1
    1822:	7000           	moveq #0,d0
    1824:	4eae fdd8      	jsr -552(a6)
    1828:	23c0 0000 5b62 	move.l d0,5b62 <DOSBase>
	if (!DOSBase)
    182e:	6600 e824      	bne.w 54 <main+0x4e>
    1832:	60ca           	bra.s 17fe <main+0x17f8>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    1834:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    183a:	4eae ffc4      	jsr -60(a6)
    183e:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1844:	2200           	move.l d0,d1
    1846:	243c 0000 389b 	move.l #14491,d2
    184c:	7635           	moveq #53,d3
    184e:	4eae ffd0      	jsr -48(a6)
  UWORD *source =AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    1852:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    1858:	203c 0000 3300 	move.l #13056,d0
    185e:	7202           	moveq #2,d1
    1860:	4eae ff3a      	jsr -198(a6)
    1864:	2840           	movea.l d0,a4
  if( source == 0) {
    1866:	4a80           	tst.l d0
    1868:	6600 f57e      	bne.w de8 <main+0xde2>
    Write(  Output(), 
    186c:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1872:	4eae ffc4      	jsr -60(a6)
    1876:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    187c:	2200           	move.l d0,d1
    187e:	243c 0000 3912 	move.l #14610,d2
    1884:	7639           	moveq #57,d3
    1886:	4eae ffd0      	jsr -48(a6)
  PrepareDisplaySW();
    188a:	4eb9 0000 259e 	jsr 259e <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    1890:	4878 0010      	pea 10 <main+0xa>
    1894:	4879 0000 5a78 	pea 5a78 <ClsSprites>
    189a:	42a7           	clr.l -(sp)
    189c:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
    18a2:	4eb9 0000 1c6c 	jsr 1c6c <TestCopperlistBatch>
    18a8:	4fef 0010      	lea 16(sp),sp
    18ac:	4a80           	tst.l d0
    18ae:	6600 f8e6      	bne.w 1196 <main+0x1190>
    18b2:	6000 f8c4      	bra.w 1178 <main+0x1172>
    Write(  Output(), 
    18b6:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    18bc:	4eae ffc4      	jsr -60(a6)
    18c0:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    18c6:	2200           	move.l d0,d1
    18c8:	243c 0000 3715 	move.l #14101,d2
    18ce:	7636           	moveq #54,d3
    18d0:	4eae ffd0      	jsr -48(a6)
  PrepareDisplayZoom();
    18d4:	4e93           	jsr (a3)
  UWORD *destination = (UWORD *)DrawBuffer;
    18d6:	2079 0000 5b52 	movea.l 5b52 <DrawBuffer>,a0
  *destination= 0x0000;
    18dc:	4250           	clr.w (a0)
  *destination= 0x000f;
    18de:	317c 000f 002c 	move.w #15,44(a0)
  *destination = 0x000f;
    18e4:	317c 000f 41d4 	move.w #15,16852(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    18ea:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    18f0:	203c 0000 c800 	move.l #51200,d0
    18f6:	7202           	moveq #2,d1
    18f8:	4eae ff3a      	jsr -198(a6)
    18fc:	2440           	movea.l d0,a2
    18fe:	23c0 0000 5b24 	move.l d0,5b24 <Zoom_Source>
  if( Zoom_Source == 0) {
    1904:	6600 f06a      	bne.w 970 <main+0x96a>
    Write(  Output(), 
    1908:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    190e:	4eae ffc4      	jsr -60(a6)
    1912:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1918:	2200           	move.l d0,d1
    191a:	243c 0000 3715 	move.l #14101,d2
    1920:	7636           	moveq #54,d3
    1922:	4eae ffd0      	jsr -48(a6)
    return;
    1926:	6000 f262      	bra.w b8a <main+0xb84>
	APTR vbr = 0;
    192a:	7000           	moveq #0,d0
	VBR=GetVBR();
    192c:	23c0 0000 5b32 	move.l d0,5b32 <VBR.lto_priv.7>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    1932:	2079 0000 5b32 	movea.l 5b32 <VBR.lto_priv.7>,a0
    1938:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    193c:	23c2 0000 5b36 	move.l d2,5b36 <SystemIrq>
	WaitVbl();
    1942:	4e92           	jsr (a2)
	WaitVbl();
    1944:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1946:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
    194c:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1950:	6000 fa38      	bra.w 138a <main+0x1384>
    Write(  Output(), 
    1954:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    195a:	4eae ffc4      	jsr -60(a6)
    195e:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1964:	2200           	move.l d0,d1
    1966:	243c 0000 394c 	move.l #14668,d2
    196c:	763d           	moveq #61,d3
    196e:	4eae ffd0      	jsr -48(a6)
  PrepareDisplaySW();
    1972:	4eb9 0000 259e 	jsr 259e <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    1978:	4878 0010      	pea 10 <main+0xa>
    197c:	4879 0000 5a78 	pea 5a78 <ClsSprites>
    1982:	42a7           	clr.l -(sp)
    1984:	2f39 0000 5b5e 	move.l 5b5e <Copperlist1>,-(sp)
    198a:	4eb9 0000 1c6c 	jsr 1c6c <TestCopperlistBatch>
    1990:	4fef 0010      	lea 16(sp),sp
    1994:	4a80           	tst.l d0
    1996:	6600 f7fe      	bne.w 1196 <main+0x1190>
    199a:	6000 f7dc      	bra.w 1178 <main+0x1172>
    199e:	4e71           	nop

000019a0 <WriteFont.constprop.6>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    19a0:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    19a4:	206f 0008      	movea.l 8(sp),a0
    19a8:	1010           	move.b (a0),d0
    19aa:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    19ae:	4880           	ext.w d0
    19b0:	48c0           	ext.l d0
    19b2:	e788           	lsl.l #3,d0
  fntptr += charpos;
    19b4:	4880           	ext.w d0
    19b6:	3040           	movea.w d0,a0
    19b8:	d1c8           	adda.l a0,a0
    19ba:	d1fc 0000 5ae4 	adda.l #23268,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    19c0:	3290           	move.w (a0),(a1)
    19c2:	3368 0002 0050 	move.w 2(a0),80(a1)
    19c8:	3368 0004 00a0 	move.w 4(a0),160(a1)
    19ce:	3368 0006 00f0 	move.w 6(a0),240(a1)
    19d4:	3368 0008 0140 	move.w 8(a0),320(a1)
    19da:	3368 000a 0190 	move.w 10(a0),400(a1)
    19e0:	3368 000c 01e0 	move.w 12(a0),480(a1)
    19e6:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    19ec:	4e75           	rts

000019ee <TestRow.constprop.4>:
void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    19ee:	4fef ff98      	lea -104(sp),sp
    19f2:	48e7 303a      	movem.l d2-d3/a2-a4/a6,-(sp)
    19f6:	286f 0084      	movea.l 132(sp),a4
  char str[ 100] = { 0 };
    19fa:	47ef 001c      	lea 28(sp),a3
    19fe:	4878 0064      	pea 64 <main+0x5e>
    1a02:	42a7           	clr.l -(sp)
    1a04:	2f0b           	move.l a3,-(sp)
    1a06:	4eba 0e1e      	jsr 2826 <memset>(pc)
  data[1] = numberofline;
    1a0a:	3f6f 0096 0026 	move.w 150(sp),38(sp)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1a10:	4fef 000c      	lea 12(sp),sp
    1a14:	3014           	move.w (a4),d0
    1a16:	b079 0000 5adc 	cmp.w 5adc <destline+0x24>,d0
    1a1c:	6738           	beq.s 1a56 <TestRow.constprop.4+0x68>
      data[0] = i;
    1a1e:	426f 0018      	clr.w 24(sp)
      RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    1a22:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    1a28:	41f9 0000 31db 	lea 31db <incbin_swfont_end+0x1>,a0
    1a2e:	43ef 0018      	lea 24(sp),a1
    1a32:	45f9 0000 2a14 	lea 2a14 <PutChar>,a2
    1a38:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1a3c:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1a42:	4eae ffc4      	jsr -60(a6)
    1a46:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1a4c:	2200           	move.l d0,d1
    1a4e:	240b           	move.l a3,d2
    1a50:	7664           	moveq #100,d3
    1a52:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1a56:	322c 0002      	move.w 2(a4),d1
    1a5a:	b279 0000 5ade 	cmp.w 5ade <destline+0x26>,d1
    1a60:	673e           	beq.s 1aa0 <TestRow.constprop.4+0xb2>
      data[0] = i;
    1a62:	3f7c 0001 0018 	move.w #1,24(sp)
      RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    1a68:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    1a6e:	41f9 0000 31db 	lea 31db <incbin_swfont_end+0x1>,a0
    1a74:	43ef 0018      	lea 24(sp),a1
    1a78:	45f9 0000 2a14 	lea 2a14 <PutChar>,a2
    1a7e:	47ef 001c      	lea 28(sp),a3
    1a82:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1a86:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1a8c:	4eae ffc4      	jsr -60(a6)
    1a90:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1a96:	2200           	move.l d0,d1
    1a98:	240b           	move.l a3,d2
    1a9a:	7664           	moveq #100,d3
    1a9c:	4eae ffd0      	jsr -48(a6)
    if( (*testpattern++ ^ xormask) != *destination++) {
    1aa0:	302c 0004      	move.w 4(a4),d0
    1aa4:	b079 0000 5ae0 	cmp.w 5ae0 <destline+0x28>,d0
    1aaa:	673e           	beq.s 1aea <TestRow.constprop.4+0xfc>
      data[0] = i;
    1aac:	3f7c 0002 0018 	move.w #2,24(sp)
      RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    1ab2:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    1ab8:	41f9 0000 31db 	lea 31db <incbin_swfont_end+0x1>,a0
    1abe:	43ef 0018      	lea 24(sp),a1
    1ac2:	45f9 0000 2a14 	lea 2a14 <PutChar>,a2
    1ac8:	47ef 001c      	lea 28(sp),a3
    1acc:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    1ad0:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1ad6:	4eae ffc4      	jsr -60(a6)
    1ada:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1ae0:	2200           	move.l d0,d1
    1ae2:	240b           	move.l a3,d2
    1ae4:	7664           	moveq #100,d3
    1ae6:	4eae ffd0      	jsr -48(a6)
  if( ( (*testpattern++ ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1aea:	3039 0000 5ae2 	move.w 5ae2 <destline+0x2a>,d0
    1af0:	322c 0006      	move.w 6(a4),d1
    1af4:	b340           	eor.w d1,d0
    1af6:	0240 ff00      	andi.w #-256,d0
    1afa:	673e           	beq.s 1b3a <TestRow.constprop.4+0x14c>
    data[0] = ZMLINESIZE/2;
    1afc:	3f7c 0016 0018 	move.w #22,24(sp)
    RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
    1b02:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    1b08:	41f9 0000 31db 	lea 31db <incbin_swfont_end+0x1>,a0
    1b0e:	43ef 0018      	lea 24(sp),a1
    1b12:	45f9 0000 2a14 	lea 2a14 <PutChar>,a2
    1b18:	47ef 001c      	lea 28(sp),a3
    1b1c:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1b20:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1b26:	4eae ffc4      	jsr -60(a6)
    1b2a:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1b30:	2200           	move.l d0,d1
    1b32:	240b           	move.l a3,d2
    1b34:	7664           	moveq #100,d3
    1b36:	4eae ffd0      	jsr -48(a6)
  }
}
    1b3a:	4cdf 5c0c      	movem.l (sp)+,d2-d3/a2-a4/a6
    1b3e:	4fef 0068      	lea 104(sp),sp
    1b42:	4e75           	rts

00001b44 <warpmode.part.0>:
void warpmode(int on) 
    1b44:	598f           	subq.l #4,sp
    1b46:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    1b48:	4aaf 000c      	tst.l 12(sp)
    1b4c:	674c           	beq.s 1b9a <warpmode.part.0+0x56>
    1b4e:	4878 0001      	pea 1 <_start+0x1>
    1b52:	740b           	moveq #11,d2
    1b54:	d48f           	add.l sp,d2
    1b56:	2f02           	move.l d2,-(sp)
    1b58:	42a7           	clr.l -(sp)
    1b5a:	4879 0000 3237 	pea 3237 <incbin_swfont_end+0x5d>
    1b60:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd028>
    1b64:	4878 0052      	pea 52 <main+0x4c>
    1b68:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
    1b6e:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1b72:	203c 0000 321d 	move.l #12829,d0
    1b78:	4878 0001      	pea 1 <_start+0x1>
    1b7c:	2f02           	move.l d2,-(sp)
    1b7e:	42a7           	clr.l -(sp)
    1b80:	2f00           	move.l d0,-(sp)
    1b82:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd028>
    1b86:	4878 0052      	pea 52 <main+0x4c>
    1b8a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
	}
}
    1b90:	4fef 0018      	lea 24(sp),sp
    1b94:	241f           	move.l (sp)+,d2
    1b96:	588f           	addq.l #4,sp
    1b98:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    1b9a:	4878 0001      	pea 1 <_start+0x1>
    1b9e:	740b           	moveq #11,d2
    1ba0:	d48f           	add.l sp,d2
    1ba2:	2f02           	move.l d2,-(sp)
    1ba4:	42a7           	clr.l -(sp)
    1ba6:	4879 0000 3241 	pea 3241 <incbin_swfont_end+0x67>
    1bac:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd028>
    1bb0:	4878 0052      	pea 52 <main+0x4c>
    1bb4:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
    1bba:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1bbe:	203c 0000 3204 	move.l #12804,d0
    1bc4:	4878 0001      	pea 1 <_start+0x1>
    1bc8:	2f02           	move.l d2,-(sp)
    1bca:	42a7           	clr.l -(sp)
    1bcc:	2f00           	move.l d0,-(sp)
    1bce:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd028>
    1bd2:	4878 0052      	pea 52 <main+0x4c>
    1bd6:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
}
    1bdc:	4fef 0018      	lea 24(sp),sp
    1be0:	241f           	move.l (sp)+,d2
    1be2:	588f           	addq.l #4,sp
    1be4:	4e75           	rts

00001be6 <KPrintF>:
{
    1be6:	4fef ff80      	lea -128(sp),sp
    1bea:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    1bee:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
    1bf4:	6734           	beq.s 1c2a <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    1bf6:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    1bfc:	206f 0090      	movea.l 144(sp),a0
    1c00:	43ef 0094      	lea 148(sp),a1
    1c04:	45f9 0000 2a14 	lea 2a14 <PutChar>,a2
    1c0a:	47ef 000c      	lea 12(sp),a3
    1c0e:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    1c12:	2f0b           	move.l a3,-(sp)
    1c14:	4878 0056      	pea 56 <main+0x50>
    1c18:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecf89>
    1c1e:	508f           	addq.l #8,sp
}
    1c20:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1c24:	4fef 0080      	lea 128(sp),sp
    1c28:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    1c2a:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    1c30:	206f 0090      	movea.l 144(sp),a0
    1c34:	43ef 0094      	lea 148(sp),a1
    1c38:	45f9 0000 2a06 	lea 2a06 <KPutCharX>,a2
    1c3e:	97cb           	suba.l a3,a3
    1c40:	4eae fdf6      	jsr -522(a6)
}
    1c44:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1c48:	4fef 0080      	lea 128(sp),sp
    1c4c:	4e75           	rts

00001c4e <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    1c4e:	202f 0008      	move.l 8(sp),d0
    1c52:	d080           	add.l d0,d0
    1c54:	d080           	add.l d0,d0
    1c56:	206f 0004      	movea.l 4(sp),a0
    1c5a:	2030 0800      	move.l (0,a0,d0.l),d0
    1c5e:	b0af 000c      	cmp.l 12(sp),d0
    1c62:	57c0           	seq d0
    1c64:	4880           	ext.w d0
    1c66:	48c0           	ext.l d0
}
    1c68:	4480           	neg.l d0
    1c6a:	4e75           	rts

00001c6c <TestCopperlistBatch>:
                                                                  long length) {
    1c6c:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    1c70:	246f 0010      	movea.l 16(sp),a2
    1c74:	206f 0014      	movea.l 20(sp),a0
    1c78:	226f 0018      	movea.l 24(sp),a1
    1c7c:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    1c80:	2008           	move.l a0,d0
    1c82:	d088           	add.l a0,d0
    1c84:	d080           	add.l d0,d0
    1c86:	2411           	move.l (a1),d2
    1c88:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    1c8c:	6600 01ac      	bne.w 1e3a <TestCopperlistBatch+0x1ce>
    1c90:	2008           	move.l a0,d0
    1c92:	5280           	addq.l #1,d0
    1c94:	d080           	add.l d0,d0
    1c96:	d080           	add.l d0,d0
    1c98:	2032 0800      	move.l (0,a2,d0.l),d0
    1c9c:	b0a9 0004      	cmp.l 4(a1),d0
    1ca0:	6600 0198      	bne.w 1e3a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1ca4:	7002           	moveq #2,d0
    1ca6:	b081           	cmp.l d1,d0
    1ca8:	6700 0188      	beq.w 1e32 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1cac:	2008           	move.l a0,d0
    1cae:	5480           	addq.l #2,d0
    1cb0:	d080           	add.l d0,d0
    1cb2:	d080           	add.l d0,d0
    1cb4:	2032 0800      	move.l (0,a2,d0.l),d0
    1cb8:	b0a9 0008      	cmp.l 8(a1),d0
    1cbc:	6600 017c      	bne.w 1e3a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1cc0:	7403           	moveq #3,d2
    1cc2:	b481           	cmp.l d1,d2
    1cc4:	6700 016c      	beq.w 1e32 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1cc8:	2008           	move.l a0,d0
    1cca:	5680           	addq.l #3,d0
    1ccc:	d080           	add.l d0,d0
    1cce:	d080           	add.l d0,d0
    1cd0:	2032 0800      	move.l (0,a2,d0.l),d0
    1cd4:	b0a9 000c      	cmp.l 12(a1),d0
    1cd8:	6600 0160      	bne.w 1e3a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1cdc:	7004           	moveq #4,d0
    1cde:	b081           	cmp.l d1,d0
    1ce0:	6700 0150      	beq.w 1e32 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1ce4:	2008           	move.l a0,d0
    1ce6:	5880           	addq.l #4,d0
    1ce8:	d080           	add.l d0,d0
    1cea:	d080           	add.l d0,d0
    1cec:	2032 0800      	move.l (0,a2,d0.l),d0
    1cf0:	b0a9 0010      	cmp.l 16(a1),d0
    1cf4:	6600 0144      	bne.w 1e3a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1cf8:	7405           	moveq #5,d2
    1cfa:	b481           	cmp.l d1,d2
    1cfc:	6700 0134      	beq.w 1e32 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1d00:	2008           	move.l a0,d0
    1d02:	5a80           	addq.l #5,d0
    1d04:	d080           	add.l d0,d0
    1d06:	d080           	add.l d0,d0
    1d08:	2032 0800      	move.l (0,a2,d0.l),d0
    1d0c:	b0a9 0014      	cmp.l 20(a1),d0
    1d10:	6600 0128      	bne.w 1e3a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1d14:	7006           	moveq #6,d0
    1d16:	b081           	cmp.l d1,d0
    1d18:	6700 0118      	beq.w 1e32 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1d1c:	2008           	move.l a0,d0
    1d1e:	5c80           	addq.l #6,d0
    1d20:	d080           	add.l d0,d0
    1d22:	d080           	add.l d0,d0
    1d24:	2032 0800      	move.l (0,a2,d0.l),d0
    1d28:	b0a9 0018      	cmp.l 24(a1),d0
    1d2c:	6600 010c      	bne.w 1e3a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1d30:	7407           	moveq #7,d2
    1d32:	b481           	cmp.l d1,d2
    1d34:	6700 00fc      	beq.w 1e32 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1d38:	2008           	move.l a0,d0
    1d3a:	5e80           	addq.l #7,d0
    1d3c:	d080           	add.l d0,d0
    1d3e:	d080           	add.l d0,d0
    1d40:	2032 0800      	move.l (0,a2,d0.l),d0
    1d44:	b0a9 001c      	cmp.l 28(a1),d0
    1d48:	6600 00f0      	bne.w 1e3a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1d4c:	7008           	moveq #8,d0
    1d4e:	b081           	cmp.l d1,d0
    1d50:	6700 00e0      	beq.w 1e32 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1d54:	2008           	move.l a0,d0
    1d56:	5080           	addq.l #8,d0
    1d58:	d080           	add.l d0,d0
    1d5a:	d080           	add.l d0,d0
    1d5c:	2032 0800      	move.l (0,a2,d0.l),d0
    1d60:	b0a9 0020      	cmp.l 32(a1),d0
    1d64:	6600 00d4      	bne.w 1e3a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1d68:	7409           	moveq #9,d2
    1d6a:	b481           	cmp.l d1,d2
    1d6c:	6700 00c4      	beq.w 1e32 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1d70:	47e8 0009      	lea 9(a0),a3
    1d74:	200b           	move.l a3,d0
    1d76:	d08b           	add.l a3,d0
    1d78:	d080           	add.l d0,d0
    1d7a:	2032 0800      	move.l (0,a2,d0.l),d0
    1d7e:	b0a9 0024      	cmp.l 36(a1),d0
    1d82:	6600 00b6      	bne.w 1e3a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1d86:	700a           	moveq #10,d0
    1d88:	b081           	cmp.l d1,d0
    1d8a:	6700 00a6      	beq.w 1e32 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1d8e:	47e8 000a      	lea 10(a0),a3
    1d92:	200b           	move.l a3,d0
    1d94:	d08b           	add.l a3,d0
    1d96:	d080           	add.l d0,d0
    1d98:	2032 0800      	move.l (0,a2,d0.l),d0
    1d9c:	b0a9 0028      	cmp.l 40(a1),d0
    1da0:	6600 0098      	bne.w 1e3a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1da4:	740b           	moveq #11,d2
    1da6:	b481           	cmp.l d1,d2
    1da8:	6700 0088      	beq.w 1e32 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1dac:	47e8 000b      	lea 11(a0),a3
    1db0:	200b           	move.l a3,d0
    1db2:	d08b           	add.l a3,d0
    1db4:	d080           	add.l d0,d0
    1db6:	2032 0800      	move.l (0,a2,d0.l),d0
    1dba:	b0a9 002c      	cmp.l 44(a1),d0
    1dbe:	667a           	bne.s 1e3a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1dc0:	700c           	moveq #12,d0
    1dc2:	b081           	cmp.l d1,d0
    1dc4:	676c           	beq.s 1e32 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1dc6:	47e8 000c      	lea 12(a0),a3
    1dca:	200b           	move.l a3,d0
    1dcc:	d08b           	add.l a3,d0
    1dce:	d080           	add.l d0,d0
    1dd0:	2032 0800      	move.l (0,a2,d0.l),d0
    1dd4:	b0a9 0030      	cmp.l 48(a1),d0
    1dd8:	6660           	bne.s 1e3a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1dda:	740d           	moveq #13,d2
    1ddc:	b481           	cmp.l d1,d2
    1dde:	6752           	beq.s 1e32 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1de0:	47e8 000d      	lea 13(a0),a3
    1de4:	200b           	move.l a3,d0
    1de6:	d08b           	add.l a3,d0
    1de8:	d080           	add.l d0,d0
    1dea:	2032 0800      	move.l (0,a2,d0.l),d0
    1dee:	b0a9 0034      	cmp.l 52(a1),d0
    1df2:	6646           	bne.s 1e3a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1df4:	700e           	moveq #14,d0
    1df6:	b081           	cmp.l d1,d0
    1df8:	6738           	beq.s 1e32 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1dfa:	47e8 000e      	lea 14(a0),a3
    1dfe:	200b           	move.l a3,d0
    1e00:	d08b           	add.l a3,d0
    1e02:	d080           	add.l d0,d0
    1e04:	2032 0800      	move.l (0,a2,d0.l),d0
    1e08:	b0a9 0038      	cmp.l 56(a1),d0
    1e0c:	662c           	bne.s 1e3a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1e0e:	7410           	moveq #16,d2
    1e10:	b481           	cmp.l d1,d2
    1e12:	661e           	bne.s 1e32 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1e14:	41e8 000f      	lea 15(a0),a0
    1e18:	d1c8           	adda.l a0,a0
    1e1a:	d1c8           	adda.l a0,a0
    1e1c:	2070 a800      	movea.l (0,a0,a2.l),a0
    1e20:	b1e9 003c      	cmpa.l 60(a1),a0
    1e24:	57c0           	seq d0
    1e26:	4880           	ext.w d0
    1e28:	48c0           	ext.l d0
    1e2a:	4480           	neg.l d0
}
    1e2c:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1e30:	4e75           	rts
  return 1;
    1e32:	7001           	moveq #1,d0
}
    1e34:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1e38:	4e75           	rts
      return 0;
    1e3a:	7000           	moveq #0,d0
}
    1e3c:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1e40:	4e75           	rts

00001e42 <ClBuild>:
ULONG * ClbuildSW() {
    1e42:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    1e46:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    1e4c:	707b           	moveq #123,d0
    1e4e:	4600           	not.b d0
    1e50:	7202           	moveq #2,d1
    1e52:	4eae ff3a      	jsr -198(a6)
    1e56:	2440           	movea.l d0,a2
  if( retval == 0) {
    1e58:	4a80           	tst.l d0
    1e5a:	6700 010e      	beq.w 1f6a <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    1e5e:	24b9 0000 5a78 	move.l 5a78 <ClsSprites>,(a2)
    1e64:	2579 0000 5a7c 	move.l 5a7c <ClsSprites+0x4>,4(a2)
    1e6a:	0004 
    1e6c:	2579 0000 5a80 	move.l 5a80 <ClsSprites+0x8>,8(a2)
    1e72:	0008 
    1e74:	2579 0000 5a84 	move.l 5a84 <ClsSprites+0xc>,12(a2)
    1e7a:	000c 
    1e7c:	2579 0000 5a88 	move.l 5a88 <ClsSprites+0x10>,16(a2)
    1e82:	0010 
    1e84:	2579 0000 5a8c 	move.l 5a8c <ClsSprites+0x14>,20(a2)
    1e8a:	0014 
    1e8c:	2579 0000 5a90 	move.l 5a90 <ClsSprites+0x18>,24(a2)
    1e92:	0018 
    1e94:	2579 0000 5a94 	move.l 5a94 <ClsSprites+0x1c>,28(a2)
    1e9a:	001c 
    1e9c:	2579 0000 5a98 	move.l 5a98 <ClsSprites+0x20>,32(a2)
    1ea2:	0020 
    1ea4:	2579 0000 5a9c 	move.l 5a9c <ClsSprites+0x24>,36(a2)
    1eaa:	0024 
    1eac:	2579 0000 5aa0 	move.l 5aa0 <ClsSprites+0x28>,40(a2)
    1eb2:	0028 
    1eb4:	2579 0000 5aa4 	move.l 5aa4 <ClsSprites+0x2c>,44(a2)
    1eba:	002c 
    1ebc:	2579 0000 5aa8 	move.l 5aa8 <ClsSprites+0x30>,48(a2)
    1ec2:	0030 
    1ec4:	2579 0000 5aac 	move.l 5aac <ClsSprites+0x34>,52(a2)
    1eca:	0034 
    1ecc:	2579 0000 5ab0 	move.l 5ab0 <ClsSprites+0x38>,56(a2)
    1ed2:	0038 
    1ed4:	2579 0000 5ab4 	move.l 5ab4 <ClsSprites+0x3c>,60(a2)
    1eda:	003c 
    *cl++ = *clpartinstruction++;
    1edc:	2579 0000 5a48 	move.l 5a48 <ClScreen>,64(a2)
    1ee2:	0040 
    1ee4:	2579 0000 5a4c 	move.l 5a4c <ClScreen+0x4>,68(a2)
    1eea:	0044 
    1eec:	2579 0000 5a50 	move.l 5a50 <ClScreen+0x8>,72(a2)
    1ef2:	0048 
    1ef4:	2579 0000 5a54 	move.l 5a54 <ClScreen+0xc>,76(a2)
    1efa:	004c 
    1efc:	2579 0000 5a58 	move.l 5a58 <ClScreen+0x10>,80(a2)
    1f02:	0050 
    1f04:	2579 0000 5a5c 	move.l 5a5c <ClScreen+0x14>,84(a2)
    1f0a:	0054 
    1f0c:	2579 0000 5a60 	move.l 5a60 <ClScreen+0x18>,88(a2)
    1f12:	0058 
    1f14:	2579 0000 5a64 	move.l 5a64 <ClScreen+0x1c>,92(a2)
    1f1a:	005c 
    1f1c:	2579 0000 5a68 	move.l 5a68 <ClScreen+0x20>,96(a2)
    1f22:	0060 
    1f24:	2579 0000 5a6c 	move.l 5a6c <ClScreen+0x24>,100(a2)
    1f2a:	0064 
    1f2c:	2579 0000 5a70 	move.l 5a70 <ClScreen+0x28>,104(a2)
    1f32:	0068 
    1f34:	2579 0000 5a74 	move.l 5a74 <ClScreen+0x2c>,108(a2)
    1f3a:	006c 
  *cl++ = 0x00e00000;
    1f3c:	257c 00e0 0000 	move.l #14680064,112(a2)
    1f42:	0070 
  *cl++ = 0x00e20000;
    1f44:	257c 00e2 0000 	move.l #14811136,116(a2)
    1f4a:	0074 
    *cl++ = *clpartinstruction++;
    1f4c:	2579 0000 5a40 	move.l 5a40 <ClColor>,120(a2)
    1f52:	0078 
    1f54:	2579 0000 5a44 	move.l 5a44 <ClColor+0x4>,124(a2)
    1f5a:	007c 
  *cl = 0xfffffffe;
    1f5c:	70fe           	moveq #-2,d0
    1f5e:	2540 0080      	move.l d0,128(a2)
}
    1f62:	200a           	move.l a2,d0
    1f64:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1f68:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1f6a:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1f70:	4eae ffc4      	jsr -60(a6)
    1f74:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1f7a:	2200           	move.l d0,d1
    1f7c:	243c 0000 324c 	move.l #12876,d2
    1f82:	7628           	moveq #40,d3
    1f84:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1f88:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    1f8e:	7201           	moveq #1,d1
    1f90:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1f94:	24b9 0000 5a78 	move.l 5a78 <ClsSprites>,(a2)
    1f9a:	2579 0000 5a7c 	move.l 5a7c <ClsSprites+0x4>,4(a2)
    1fa0:	0004 
    1fa2:	2579 0000 5a80 	move.l 5a80 <ClsSprites+0x8>,8(a2)
    1fa8:	0008 
    1faa:	2579 0000 5a84 	move.l 5a84 <ClsSprites+0xc>,12(a2)
    1fb0:	000c 
    1fb2:	2579 0000 5a88 	move.l 5a88 <ClsSprites+0x10>,16(a2)
    1fb8:	0010 
    1fba:	2579 0000 5a8c 	move.l 5a8c <ClsSprites+0x14>,20(a2)
    1fc0:	0014 
    1fc2:	2579 0000 5a90 	move.l 5a90 <ClsSprites+0x18>,24(a2)
    1fc8:	0018 
    1fca:	2579 0000 5a94 	move.l 5a94 <ClsSprites+0x1c>,28(a2)
    1fd0:	001c 
    1fd2:	2579 0000 5a98 	move.l 5a98 <ClsSprites+0x20>,32(a2)
    1fd8:	0020 
    1fda:	2579 0000 5a9c 	move.l 5a9c <ClsSprites+0x24>,36(a2)
    1fe0:	0024 
    1fe2:	2579 0000 5aa0 	move.l 5aa0 <ClsSprites+0x28>,40(a2)
    1fe8:	0028 
    1fea:	2579 0000 5aa4 	move.l 5aa4 <ClsSprites+0x2c>,44(a2)
    1ff0:	002c 
    1ff2:	2579 0000 5aa8 	move.l 5aa8 <ClsSprites+0x30>,48(a2)
    1ff8:	0030 
    1ffa:	2579 0000 5aac 	move.l 5aac <ClsSprites+0x34>,52(a2)
    2000:	0034 
    2002:	2579 0000 5ab0 	move.l 5ab0 <ClsSprites+0x38>,56(a2)
    2008:	0038 
    200a:	2579 0000 5ab4 	move.l 5ab4 <ClsSprites+0x3c>,60(a2)
    2010:	003c 
    *cl++ = *clpartinstruction++;
    2012:	2579 0000 5a48 	move.l 5a48 <ClScreen>,64(a2)
    2018:	0040 
    201a:	2579 0000 5a4c 	move.l 5a4c <ClScreen+0x4>,68(a2)
    2020:	0044 
    2022:	2579 0000 5a50 	move.l 5a50 <ClScreen+0x8>,72(a2)
    2028:	0048 
    202a:	2579 0000 5a54 	move.l 5a54 <ClScreen+0xc>,76(a2)
    2030:	004c 
    2032:	2579 0000 5a58 	move.l 5a58 <ClScreen+0x10>,80(a2)
    2038:	0050 
    203a:	2579 0000 5a5c 	move.l 5a5c <ClScreen+0x14>,84(a2)
    2040:	0054 
    2042:	2579 0000 5a60 	move.l 5a60 <ClScreen+0x18>,88(a2)
    2048:	0058 
    204a:	2579 0000 5a64 	move.l 5a64 <ClScreen+0x1c>,92(a2)
    2050:	005c 
    2052:	2579 0000 5a68 	move.l 5a68 <ClScreen+0x20>,96(a2)
    2058:	0060 
    205a:	2579 0000 5a6c 	move.l 5a6c <ClScreen+0x24>,100(a2)
    2060:	0064 
    2062:	2579 0000 5a70 	move.l 5a70 <ClScreen+0x28>,104(a2)
    2068:	0068 
    206a:	2579 0000 5a74 	move.l 5a74 <ClScreen+0x2c>,108(a2)
    2070:	006c 
  *cl++ = 0x00e00000;
    2072:	257c 00e0 0000 	move.l #14680064,112(a2)
    2078:	0070 
  *cl++ = 0x00e20000;
    207a:	257c 00e2 0000 	move.l #14811136,116(a2)
    2080:	0074 
    *cl++ = *clpartinstruction++;
    2082:	2579 0000 5a40 	move.l 5a40 <ClColor>,120(a2)
    2088:	0078 
    208a:	2579 0000 5a44 	move.l 5a44 <ClColor+0x4>,124(a2)
    2090:	007c 
  *cl = 0xfffffffe;
    2092:	70fe           	moveq #-2,d0
    2094:	2540 0080      	move.l d0,128(a2)
}
    2098:	200a           	move.l a2,d0
    209a:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    209e:	4e75           	rts

000020a0 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    20a0:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    20a4:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    20aa:	203c 0000 a48c 	move.l #42124,d0
    20b0:	7202           	moveq #2,d1
    20b2:	4eae ff3a      	jsr -198(a6)
    20b6:	2440           	movea.l d0,a2
  if( retval == 0) {
    20b8:	4a80           	tst.l d0
    20ba:	6700 0160      	beq.w 221c <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    20be:	24b9 0000 5a78 	move.l 5a78 <ClsSprites>,(a2)
    20c4:	2579 0000 5a7c 	move.l 5a7c <ClsSprites+0x4>,4(a2)
    20ca:	0004 
    20cc:	2579 0000 5a80 	move.l 5a80 <ClsSprites+0x8>,8(a2)
    20d2:	0008 
    20d4:	2579 0000 5a84 	move.l 5a84 <ClsSprites+0xc>,12(a2)
    20da:	000c 
    20dc:	2579 0000 5a88 	move.l 5a88 <ClsSprites+0x10>,16(a2)
    20e2:	0010 
    20e4:	2579 0000 5a8c 	move.l 5a8c <ClsSprites+0x14>,20(a2)
    20ea:	0014 
    20ec:	2579 0000 5a90 	move.l 5a90 <ClsSprites+0x18>,24(a2)
    20f2:	0018 
    20f4:	2579 0000 5a94 	move.l 5a94 <ClsSprites+0x1c>,28(a2)
    20fa:	001c 
    20fc:	2579 0000 5a98 	move.l 5a98 <ClsSprites+0x20>,32(a2)
    2102:	0020 
    2104:	2579 0000 5a9c 	move.l 5a9c <ClsSprites+0x24>,36(a2)
    210a:	0024 
    210c:	2579 0000 5aa0 	move.l 5aa0 <ClsSprites+0x28>,40(a2)
    2112:	0028 
    2114:	2579 0000 5aa4 	move.l 5aa4 <ClsSprites+0x2c>,44(a2)
    211a:	002c 
    211c:	2579 0000 5aa8 	move.l 5aa8 <ClsSprites+0x30>,48(a2)
    2122:	0030 
    2124:	2579 0000 5aac 	move.l 5aac <ClsSprites+0x34>,52(a2)
    212a:	0034 
    212c:	2579 0000 5ab0 	move.l 5ab0 <ClsSprites+0x38>,56(a2)
    2132:	0038 
    2134:	2579 0000 5ab4 	move.l 5ab4 <ClsSprites+0x3c>,60(a2)
    213a:	003c 
    *cl++ = *clpartinstruction++;
    213c:	2579 0000 5a10 	move.l 5a10 <ClScreenZoom>,64(a2)
    2142:	0040 
    2144:	2579 0000 5a14 	move.l 5a14 <ClScreenZoom+0x4>,68(a2)
    214a:	0044 
    214c:	2579 0000 5a18 	move.l 5a18 <ClScreenZoom+0x8>,72(a2)
    2152:	0048 
    2154:	2579 0000 5a1c 	move.l 5a1c <ClScreenZoom+0xc>,76(a2)
    215a:	004c 
    215c:	2579 0000 5a20 	move.l 5a20 <ClScreenZoom+0x10>,80(a2)
    2162:	0050 
    2164:	2579 0000 5a24 	move.l 5a24 <ClScreenZoom+0x14>,84(a2)
    216a:	0054 
    216c:	2579 0000 5a28 	move.l 5a28 <ClScreenZoom+0x18>,88(a2)
    2172:	0058 
    2174:	2579 0000 5a2c 	move.l 5a2c <ClScreenZoom+0x1c>,92(a2)
    217a:	005c 
    217c:	2579 0000 5a30 	move.l 5a30 <ClScreenZoom+0x20>,96(a2)
    2182:	0060 
    2184:	2579 0000 5a34 	move.l 5a34 <ClScreenZoom+0x24>,100(a2)
    218a:	0064 
    218c:	2579 0000 5a38 	move.l 5a38 <ClScreenZoom+0x28>,104(a2)
    2192:	0068 
    2194:	2579 0000 5a3c 	move.l 5a3c <ClScreenZoom+0x2c>,108(a2)
    219a:	006c 
  *cl++ = 0x00e00000;
    219c:	257c 00e0 0000 	move.l #14680064,112(a2)
    21a2:	0070 
  *cl++ = 0x00e20000;
    21a4:	257c 00e2 0000 	move.l #14811136,116(a2)
    21aa:	0074 
  *cl++ = 0x00e40000;
    21ac:	257c 00e4 0000 	move.l #14942208,120(a2)
    21b2:	0078 
  *cl++ = 0x00e60000;
    21b4:	257c 00e6 0000 	move.l #15073280,124(a2)
    21ba:	007c 
    *cl++ = *clpartinstruction++;
    21bc:	2579 0000 5a40 	move.l 5a40 <ClColor>,128(a2)
    21c2:	0080 
    21c4:	2579 0000 5a44 	move.l 5a44 <ClColor+0x4>,132(a2)
    21ca:	0084 
    21cc:	43ea 012c      	lea 300(a2),a1
    21d0:	220a           	move.l a2,d1
    21d2:	0681 0000 a52c 	addi.l #42284,d1
    21d8:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    21de:	41e9 ff60      	lea -160(a1),a0
    21e2:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    21e6:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    21ec:	5088           	addq.l #8,a0
    21ee:	217c 0182 0f00 	move.l #25300736,-4(a0)
    21f4:	fffc 
    for(int i2=0;i2<20;i2++) {
    21f6:	b3c8           	cmpa.l a0,a1
    21f8:	66ec           	bne.s 21e6 <ClbuildZoom+0x146>
    21fa:	43e8 00a4      	lea 164(a0),a1
    21fe:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    2204:	b3c1           	cmpa.l d1,a1
    2206:	66d6           	bne.s 21de <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    2208:	203c 0000 a488 	move.l #42120,d0
    220e:	72fe           	moveq #-2,d1
    2210:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    2214:	200a           	move.l a2,d0
    2216:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    221a:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    221c:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    2222:	4eae ffc4      	jsr -60(a6)
    2226:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    222c:	2200           	move.l d0,d1
    222e:	243c 0000 324c 	move.l #12876,d2
    2234:	7628           	moveq #40,d3
    2236:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    223a:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    2240:	7201           	moveq #1,d1
    2242:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    2246:	24b9 0000 5a78 	move.l 5a78 <ClsSprites>,(a2)
    224c:	2579 0000 5a7c 	move.l 5a7c <ClsSprites+0x4>,4(a2)
    2252:	0004 
    2254:	2579 0000 5a80 	move.l 5a80 <ClsSprites+0x8>,8(a2)
    225a:	0008 
    225c:	2579 0000 5a84 	move.l 5a84 <ClsSprites+0xc>,12(a2)
    2262:	000c 
    2264:	2579 0000 5a88 	move.l 5a88 <ClsSprites+0x10>,16(a2)
    226a:	0010 
    226c:	2579 0000 5a8c 	move.l 5a8c <ClsSprites+0x14>,20(a2)
    2272:	0014 
    2274:	2579 0000 5a90 	move.l 5a90 <ClsSprites+0x18>,24(a2)
    227a:	0018 
    227c:	2579 0000 5a94 	move.l 5a94 <ClsSprites+0x1c>,28(a2)
    2282:	001c 
    2284:	2579 0000 5a98 	move.l 5a98 <ClsSprites+0x20>,32(a2)
    228a:	0020 
    228c:	2579 0000 5a9c 	move.l 5a9c <ClsSprites+0x24>,36(a2)
    2292:	0024 
    2294:	2579 0000 5aa0 	move.l 5aa0 <ClsSprites+0x28>,40(a2)
    229a:	0028 
    229c:	2579 0000 5aa4 	move.l 5aa4 <ClsSprites+0x2c>,44(a2)
    22a2:	002c 
    22a4:	2579 0000 5aa8 	move.l 5aa8 <ClsSprites+0x30>,48(a2)
    22aa:	0030 
    22ac:	2579 0000 5aac 	move.l 5aac <ClsSprites+0x34>,52(a2)
    22b2:	0034 
    22b4:	2579 0000 5ab0 	move.l 5ab0 <ClsSprites+0x38>,56(a2)
    22ba:	0038 
    22bc:	2579 0000 5ab4 	move.l 5ab4 <ClsSprites+0x3c>,60(a2)
    22c2:	003c 
    *cl++ = *clpartinstruction++;
    22c4:	2579 0000 5a10 	move.l 5a10 <ClScreenZoom>,64(a2)
    22ca:	0040 
    22cc:	2579 0000 5a14 	move.l 5a14 <ClScreenZoom+0x4>,68(a2)
    22d2:	0044 
    22d4:	2579 0000 5a18 	move.l 5a18 <ClScreenZoom+0x8>,72(a2)
    22da:	0048 
    22dc:	2579 0000 5a1c 	move.l 5a1c <ClScreenZoom+0xc>,76(a2)
    22e2:	004c 
    22e4:	2579 0000 5a20 	move.l 5a20 <ClScreenZoom+0x10>,80(a2)
    22ea:	0050 
    22ec:	2579 0000 5a24 	move.l 5a24 <ClScreenZoom+0x14>,84(a2)
    22f2:	0054 
    22f4:	2579 0000 5a28 	move.l 5a28 <ClScreenZoom+0x18>,88(a2)
    22fa:	0058 
    22fc:	2579 0000 5a2c 	move.l 5a2c <ClScreenZoom+0x1c>,92(a2)
    2302:	005c 
    2304:	2579 0000 5a30 	move.l 5a30 <ClScreenZoom+0x20>,96(a2)
    230a:	0060 
    230c:	2579 0000 5a34 	move.l 5a34 <ClScreenZoom+0x24>,100(a2)
    2312:	0064 
    2314:	2579 0000 5a38 	move.l 5a38 <ClScreenZoom+0x28>,104(a2)
    231a:	0068 
    231c:	2579 0000 5a3c 	move.l 5a3c <ClScreenZoom+0x2c>,108(a2)
    2322:	006c 
  *cl++ = 0x00e00000;
    2324:	257c 00e0 0000 	move.l #14680064,112(a2)
    232a:	0070 
  *cl++ = 0x00e20000;
    232c:	257c 00e2 0000 	move.l #14811136,116(a2)
    2332:	0074 
  *cl++ = 0x00e40000;
    2334:	257c 00e4 0000 	move.l #14942208,120(a2)
    233a:	0078 
  *cl++ = 0x00e60000;
    233c:	257c 00e6 0000 	move.l #15073280,124(a2)
    2342:	007c 
    *cl++ = *clpartinstruction++;
    2344:	2579 0000 5a40 	move.l 5a40 <ClColor>,128(a2)
    234a:	0080 
    234c:	2579 0000 5a44 	move.l 5a44 <ClColor+0x4>,132(a2)
    2352:	0084 
    2354:	43ea 012c      	lea 300(a2),a1
    2358:	220a           	move.l a2,d1
    235a:	0681 0000 a52c 	addi.l #42284,d1
    2360:	203c 2c07 fffe 	move.l #738721790,d0
    2366:	6000 fe76      	bra.w 21de <ClbuildZoom+0x13e>

0000236a <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    236a:	2039 0000 5b4e 	move.l 5b4e <DrawCopper>,d0
  DrawCopper = ViewCopper;
    2370:	23f9 0000 5b42 	move.l 5b42 <ViewCopper>,5b4e <DrawCopper>
    2376:	0000 5b4e 
  ViewCopper = (ULONG *)tmp;
    237a:	23c0 0000 5b42 	move.l d0,5b42 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    2380:	2079 0000 5b3e 	movea.l 5b3e <hw>,a0
    2386:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    238a:	3140 0088      	move.w d0,136(a0)
}
    238e:	4e75           	rts

00002390 <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    2390:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    2394:	45fa fd0a      	lea 20a0 <ClbuildZoom>(pc),a2
    2398:	4e92           	jsr (a2)
    239a:	23c0 0000 5b5e 	move.l d0,5b5e <Copperlist1>
  Copperlist2 = ClbuildZoom();
    23a0:	4e92           	jsr (a2)
    23a2:	23c0 0000 5b5a 	move.l d0,5b5a <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    23a8:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    23ae:	203c 0001 4a00 	move.l #84480,d0
    23b4:	7202           	moveq #2,d1
    23b6:	4eae ff3a      	jsr -198(a6)
    23ba:	23c0 0000 5b56 	move.l d0,5b56 <Bitplane1>
  if(Bitplane1 == 0) {
    23c0:	6700 014e      	beq.w 2510 <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    23c4:	23c0 0000 5b52 	move.l d0,5b52 <DrawBuffer>
  DrawCopper = Copperlist1;
    23ca:	23f9 0000 5b5e 	move.l 5b5e <Copperlist1>,5b4e <DrawCopper>
    23d0:	0000 5b4e 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    23d4:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    23da:	203c 0001 4a00 	move.l #84480,d0
    23e0:	7202           	moveq #2,d1
    23e2:	4eae ff3a      	jsr -198(a6)
    23e6:	2400           	move.l d0,d2
    23e8:	23c0 0000 5b4a 	move.l d0,5b4a <Bitplane2>
  if(Bitplane2 == 0) {
    23ee:	6778           	beq.s 2468 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    23f0:	23f9 0000 5b5a 	move.l 5b5a <Copperlist2>,5b42 <ViewCopper>
    23f6:	0000 5b42 
  SwapCl();
    23fa:	45fa ff6e      	lea 236a <SwapCl>(pc),a2
    23fe:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    2400:	2039 0000 5b52 	move.l 5b52 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2406:	2079 0000 5b4e 	movea.l 5b4e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    240c:	2200           	move.l d0,d1
    240e:	4241           	clr.w d1
    2410:	4841           	swap d1
    2412:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    2416:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    241a:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2420:	2200           	move.l d0,d1
    2422:	4241           	clr.w d1
    2424:	4841           	swap d1
    2426:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    242a:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    242e:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    2430:	2079 0000 5b4e 	movea.l 5b4e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2436:	2002           	move.l d2,d0
    2438:	4240           	clr.w d0
    243a:	4840           	swap d0
    243c:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    2440:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    2444:	2002           	move.l d2,d0
    2446:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    244c:	2200           	move.l d0,d1
    244e:	4241           	clr.w d1
    2450:	4841           	swap d1
    2452:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2456:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    245a:	23c2 0000 5b46 	move.l d2,5b46 <ViewBuffer>
}
    2460:	7000           	moveq #0,d0
    2462:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2466:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2468:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    246e:	4eae ffc4      	jsr -60(a6)
    2472:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    2478:	2200           	move.l d0,d1
    247a:	243c 0000 3299 	move.l #12953,d2
    2480:	7626           	moveq #38,d3
    2482:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2486:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    248c:	7201           	moveq #1,d1
    248e:	4eae ff70      	jsr -144(a6)
    2492:	2439 0000 5b4a 	move.l 5b4a <Bitplane2>,d2
  ViewCopper = Copperlist2;
    2498:	23f9 0000 5b5a 	move.l 5b5a <Copperlist2>,5b42 <ViewCopper>
    249e:	0000 5b42 
  SwapCl();
    24a2:	45fa fec6      	lea 236a <SwapCl>(pc),a2
    24a6:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    24a8:	2039 0000 5b52 	move.l 5b52 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    24ae:	2079 0000 5b4e 	movea.l 5b4e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    24b4:	2200           	move.l d0,d1
    24b6:	4241           	clr.w d1
    24b8:	4841           	swap d1
    24ba:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    24be:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    24c2:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    24c8:	2200           	move.l d0,d1
    24ca:	4241           	clr.w d1
    24cc:	4841           	swap d1
    24ce:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    24d2:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    24d6:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    24d8:	2079 0000 5b4e 	movea.l 5b4e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    24de:	2002           	move.l d2,d0
    24e0:	4240           	clr.w d0
    24e2:	4840           	swap d0
    24e4:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    24e8:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    24ec:	2002           	move.l d2,d0
    24ee:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    24f4:	2200           	move.l d0,d1
    24f6:	4241           	clr.w d1
    24f8:	4841           	swap d1
    24fa:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    24fe:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    2502:	23c2 0000 5b46 	move.l d2,5b46 <ViewBuffer>
}
    2508:	7000           	moveq #0,d0
    250a:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    250e:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2510:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    2516:	4eae ffc4      	jsr -60(a6)
    251a:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    2520:	2200           	move.l d0,d1
    2522:	243c 0000 3272 	move.l #12914,d2
    2528:	7626           	moveq #38,d3
    252a:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    252e:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    2534:	7201           	moveq #1,d1
    2536:	4eae ff70      	jsr -144(a6)
    253a:	2039 0000 5b56 	move.l 5b56 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    2540:	23c0 0000 5b52 	move.l d0,5b52 <DrawBuffer>
  DrawCopper = Copperlist1;
    2546:	23f9 0000 5b5e 	move.l 5b5e <Copperlist1>,5b4e <DrawCopper>
    254c:	0000 5b4e 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2550:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    2556:	203c 0001 4a00 	move.l #84480,d0
    255c:	7202           	moveq #2,d1
    255e:	4eae ff3a      	jsr -198(a6)
    2562:	2400           	move.l d0,d2
    2564:	23c0 0000 5b4a 	move.l d0,5b4a <Bitplane2>
  if(Bitplane2 == 0) {
    256a:	6600 fe84      	bne.w 23f0 <PrepareDisplayZoom+0x60>
    256e:	6000 fef8      	bra.w 2468 <PrepareDisplayZoom+0xd8>

00002572 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2572:	2039 0000 5b52 	move.l 5b52 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2578:	2079 0000 5b4e 	movea.l 5b4e <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    257e:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2582:	2200           	move.l d0,d1
    2584:	4241           	clr.w d1
    2586:	4841           	swap d1
    2588:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    258c:	23f9 0000 5b46 	move.l 5b46 <ViewBuffer>,5b52 <DrawBuffer>
    2592:	0000 5b52 
  ViewBuffer = (ULONG *) tmp;
    2596:	23c0 0000 5b46 	move.l d0,5b46 <ViewBuffer>
}
    259c:	4e75           	rts

0000259e <PrepareDisplay>:
 int PrepareDisplaySW() {
    259e:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    25a2:	45fa f89e      	lea 1e42 <ClBuild>(pc),a2
    25a6:	4e92           	jsr (a2)
    25a8:	23c0 0000 5b5e 	move.l d0,5b5e <Copperlist1>
  Copperlist2 = ClbuildSW();
    25ae:	4e92           	jsr (a2)
    25b0:	23c0 0000 5b5a 	move.l d0,5b5a <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    25b6:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    25bc:	203c 0000 c800 	move.l #51200,d0
    25c2:	7202           	moveq #2,d1
    25c4:	4eae ff3a      	jsr -198(a6)
    25c8:	23c0 0000 5b56 	move.l d0,5b56 <Bitplane1>
  if(Bitplane1 == 0) {
    25ce:	6700 00ac      	beq.w 267c <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    25d2:	23c0 0000 5b52 	move.l d0,5b52 <DrawBuffer>
  DrawCopper = Copperlist1;
    25d8:	23f9 0000 5b5e 	move.l 5b5e <Copperlist1>,5b4e <DrawCopper>
    25de:	0000 5b4e 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    25e2:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    25e8:	203c 0000 c800 	move.l #51200,d0
    25ee:	7202           	moveq #2,d1
    25f0:	4eae ff3a      	jsr -198(a6)
    25f4:	23c0 0000 5b4a 	move.l d0,5b4a <Bitplane2>
  if(Bitplane2 == 0) {
    25fa:	6728           	beq.s 2624 <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    25fc:	23c0 0000 5b46 	move.l d0,5b46 <ViewBuffer>
  ViewCopper = Copperlist2;
    2602:	23f9 0000 5b5a 	move.l 5b5a <Copperlist2>,5b42 <ViewCopper>
    2608:	0000 5b42 
  SwapCl();
    260c:	47fa fd5c      	lea 236a <SwapCl>(pc),a3
    2610:	4e93           	jsr (a3)
  SetBplPointers();
    2612:	45fa ff5e      	lea 2572 <SetBplPointers>(pc),a2
    2616:	4e92           	jsr (a2)
  SwapCl();
    2618:	4e93           	jsr (a3)
  SetBplPointers();
    261a:	4e92           	jsr (a2)
}
    261c:	7000           	moveq #0,d0
    261e:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    2622:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2624:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    262a:	4eae ffc4      	jsr -60(a6)
    262e:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    2634:	2200           	move.l d0,d1
    2636:	243c 0000 3299 	move.l #12953,d2
    263c:	7626           	moveq #38,d3
    263e:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2642:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    2648:	7201           	moveq #1,d1
    264a:	4eae ff70      	jsr -144(a6)
    264e:	2039 0000 5b4a 	move.l 5b4a <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    2654:	23c0 0000 5b46 	move.l d0,5b46 <ViewBuffer>
  ViewCopper = Copperlist2;
    265a:	23f9 0000 5b5a 	move.l 5b5a <Copperlist2>,5b42 <ViewCopper>
    2660:	0000 5b42 
  SwapCl();
    2664:	47fa fd04      	lea 236a <SwapCl>(pc),a3
    2668:	4e93           	jsr (a3)
  SetBplPointers();
    266a:	45fa ff06      	lea 2572 <SetBplPointers>(pc),a2
    266e:	4e92           	jsr (a2)
  SwapCl();
    2670:	4e93           	jsr (a3)
  SetBplPointers();
    2672:	4e92           	jsr (a2)
}
    2674:	7000           	moveq #0,d0
    2676:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    267a:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    267c:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    2682:	4eae ffc4      	jsr -60(a6)
    2686:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    268c:	2200           	move.l d0,d1
    268e:	243c 0000 3272 	move.l #12914,d2
    2694:	7626           	moveq #38,d3
    2696:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    269a:	2c79 0000 5b62 	movea.l 5b62 <DOSBase>,a6
    26a0:	7201           	moveq #1,d1
    26a2:	4eae ff70      	jsr -144(a6)
    26a6:	2039 0000 5b56 	move.l 5b56 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    26ac:	23c0 0000 5b52 	move.l d0,5b52 <DrawBuffer>
  DrawCopper = Copperlist1;
    26b2:	23f9 0000 5b5e 	move.l 5b5e <Copperlist1>,5b4e <DrawCopper>
    26b8:	0000 5b4e 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    26bc:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    26c2:	203c 0000 c800 	move.l #51200,d0
    26c8:	7202           	moveq #2,d1
    26ca:	4eae ff3a      	jsr -198(a6)
    26ce:	23c0 0000 5b4a 	move.l d0,5b4a <Bitplane2>
  if(Bitplane2 == 0) {
    26d4:	6600 ff26      	bne.w 25fc <PrepareDisplay+0x5e>
    26d8:	6000 ff4a      	bra.w 2624 <PrepareDisplay+0x86>

000026dc <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    26dc:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    26e0:	262f 0010      	move.l 16(sp),d3
    26e4:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    26e8:	2279 0000 5b5e 	movea.l 5b5e <Copperlist1>,a1
    26ee:	b2fc 0000      	cmpa.w #0,a1
    26f2:	670c           	beq.s 2700 <FreeDisplay+0x24>
    26f4:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    26fa:	2003           	move.l d3,d0
    26fc:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    2700:	2279 0000 5b5a 	movea.l 5b5a <Copperlist2>,a1
    2706:	b2fc 0000      	cmpa.w #0,a1
    270a:	670c           	beq.s 2718 <FreeDisplay+0x3c>
    270c:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    2712:	2003           	move.l d3,d0
    2714:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    2718:	2279 0000 5b56 	movea.l 5b56 <Bitplane1>,a1
    271e:	b2fc 0000      	cmpa.w #0,a1
    2722:	670c           	beq.s 2730 <FreeDisplay+0x54>
    2724:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    272a:	2002           	move.l d2,d0
    272c:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    2730:	2279 0000 5b4a 	movea.l 5b4a <Bitplane2>,a1
    2736:	b2fc 0000      	cmpa.w #0,a1
    273a:	670c           	beq.s 2748 <FreeDisplay+0x6c>
    273c:	2c79 0000 5b66 	movea.l 5b66 <SysBase>,a6
    2742:	2002           	move.l d2,d0
    2744:	4eae ff2e      	jsr -210(a6)
}
    2748:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    274c:	4e75           	rts

0000274e <WaitVbl>:
void WaitVbl() {
    274e:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    2750:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddc02d>,d0
    2756:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    2758:	2017           	move.l (sp),d0
    275a:	0280 0001 ff00 	andi.l #130816,d0
    2760:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    2762:	2017           	move.l (sp),d0
    2764:	0c80 0001 3700 	cmpi.l #79616,d0
    276a:	67e4           	beq.s 2750 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    276c:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddc02d>,d0
    2772:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    2776:	202f 0004      	move.l 4(sp),d0
    277a:	0280 0001 ff00 	andi.l #130816,d0
    2780:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    2784:	202f 0004      	move.l 4(sp),d0
    2788:	0c80 0001 3700 	cmpi.l #79616,d0
    278e:	66dc           	bne.s 276c <WaitVbl+0x1e>
}
    2790:	508f           	addq.l #8,sp
    2792:	4e75           	rts

00002794 <memcpy>:
{
    2794:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    2798:	202f 0014      	move.l 20(sp),d0
    279c:	226f 0018      	movea.l 24(sp),a1
    27a0:	222f 001c      	move.l 28(sp),d1
	while(len--)
    27a4:	2601           	move.l d1,d3
    27a6:	5383           	subq.l #1,d3
    27a8:	4a81           	tst.l d1
    27aa:	6762           	beq.s 280e <memcpy+0x7a>
    27ac:	2040           	movea.l d0,a0
    27ae:	5888           	addq.l #4,a0
    27b0:	b1c9           	cmpa.l a1,a0
    27b2:	53c2           	sl.s d2
    27b4:	4402           	neg.b d2
    27b6:	41e9 0004      	lea 4(a1),a0
    27ba:	b1c0           	cmpa.l d0,a0
    27bc:	53c4           	sl.s d4
    27be:	4404           	neg.b d4
    27c0:	8404           	or.b d4,d2
    27c2:	7808           	moveq #8,d4
    27c4:	b883           	cmp.l d3,d4
    27c6:	55c4           	sc.s d4
    27c8:	4404           	neg.b d4
    27ca:	c404           	and.b d4,d2
    27cc:	6746           	beq.s 2814 <memcpy+0x80>
    27ce:	2409           	move.l a1,d2
    27d0:	8480           	or.l d0,d2
    27d2:	7803           	moveq #3,d4
    27d4:	c484           	and.l d4,d2
    27d6:	663c           	bne.s 2814 <memcpy+0x80>
    27d8:	2049           	movea.l a1,a0
    27da:	2440           	movea.l d0,a2
    27dc:	74fc           	moveq #-4,d2
    27de:	c481           	and.l d1,d2
    27e0:	d489           	add.l a1,d2
		*d++ = *s++;
    27e2:	24d8           	move.l (a0)+,(a2)+
    27e4:	b488           	cmp.l a0,d2
    27e6:	66fa           	bne.s 27e2 <memcpy+0x4e>
    27e8:	74fc           	moveq #-4,d2
    27ea:	c481           	and.l d1,d2
    27ec:	2040           	movea.l d0,a0
    27ee:	d1c2           	adda.l d2,a0
    27f0:	d3c2           	adda.l d2,a1
    27f2:	9682           	sub.l d2,d3
    27f4:	b481           	cmp.l d1,d2
    27f6:	6716           	beq.s 280e <memcpy+0x7a>
    27f8:	1091           	move.b (a1),(a0)
	while(len--)
    27fa:	4a83           	tst.l d3
    27fc:	6710           	beq.s 280e <memcpy+0x7a>
		*d++ = *s++;
    27fe:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    2804:	5383           	subq.l #1,d3
    2806:	6706           	beq.s 280e <memcpy+0x7a>
		*d++ = *s++;
    2808:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    280e:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    2812:	4e75           	rts
    2814:	2040           	movea.l d0,a0
    2816:	d289           	add.l a1,d1
		*d++ = *s++;
    2818:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    281a:	b289           	cmp.l a1,d1
    281c:	67f0           	beq.s 280e <memcpy+0x7a>
		*d++ = *s++;
    281e:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    2820:	b289           	cmp.l a1,d1
    2822:	66f4           	bne.s 2818 <memcpy+0x84>
    2824:	60e8           	bra.s 280e <memcpy+0x7a>

00002826 <memset>:
{
    2826:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    282a:	202f 0024      	move.l 36(sp),d0
    282e:	2a2f 0028      	move.l 40(sp),d5
    2832:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    2836:	2809           	move.l a1,d4
    2838:	5384           	subq.l #1,d4
    283a:	b2fc 0000      	cmpa.w #0,a1
    283e:	6f00 00b0      	ble.w 28f0 <memset+0xca>
    2842:	1e05           	move.b d5,d7
    2844:	2200           	move.l d0,d1
    2846:	4481           	neg.l d1
    2848:	7403           	moveq #3,d2
    284a:	c282           	and.l d2,d1
    284c:	7c05           	moveq #5,d6
		*ptr++ = val;
    284e:	2440           	movea.l d0,a2
    2850:	bc84           	cmp.l d4,d6
    2852:	646a           	bcc.s 28be <memset+0x98>
    2854:	4a81           	tst.l d1
    2856:	6724           	beq.s 287c <memset+0x56>
    2858:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    285a:	5384           	subq.l #1,d4
    285c:	7401           	moveq #1,d2
    285e:	b481           	cmp.l d1,d2
    2860:	671a           	beq.s 287c <memset+0x56>
		*ptr++ = val;
    2862:	2440           	movea.l d0,a2
    2864:	548a           	addq.l #2,a2
    2866:	2040           	movea.l d0,a0
    2868:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    286c:	5384           	subq.l #1,d4
    286e:	7403           	moveq #3,d2
    2870:	b481           	cmp.l d1,d2
    2872:	6608           	bne.s 287c <memset+0x56>
		*ptr++ = val;
    2874:	528a           	addq.l #1,a2
    2876:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    287a:	5384           	subq.l #1,d4
    287c:	2609           	move.l a1,d3
    287e:	9681           	sub.l d1,d3
    2880:	7c00           	moveq #0,d6
    2882:	1c05           	move.b d5,d6
    2884:	2406           	move.l d6,d2
    2886:	4842           	swap d2
    2888:	4242           	clr.w d2
    288a:	2042           	movea.l d2,a0
    288c:	2406           	move.l d6,d2
    288e:	e14a           	lsl.w #8,d2
    2890:	4842           	swap d2
    2892:	4242           	clr.w d2
    2894:	e18e           	lsl.l #8,d6
    2896:	2646           	movea.l d6,a3
    2898:	2c08           	move.l a0,d6
    289a:	8486           	or.l d6,d2
    289c:	2c0b           	move.l a3,d6
    289e:	8486           	or.l d6,d2
    28a0:	1407           	move.b d7,d2
    28a2:	2040           	movea.l d0,a0
    28a4:	d1c1           	adda.l d1,a0
    28a6:	72fc           	moveq #-4,d1
    28a8:	c283           	and.l d3,d1
    28aa:	d288           	add.l a0,d1
		*ptr++ = val;
    28ac:	20c2           	move.l d2,(a0)+
    28ae:	b1c1           	cmpa.l d1,a0
    28b0:	66fa           	bne.s 28ac <memset+0x86>
    28b2:	72fc           	moveq #-4,d1
    28b4:	c283           	and.l d3,d1
    28b6:	d5c1           	adda.l d1,a2
    28b8:	9881           	sub.l d1,d4
    28ba:	b283           	cmp.l d3,d1
    28bc:	6732           	beq.s 28f0 <memset+0xca>
    28be:	1485           	move.b d5,(a2)
	while(len-- > 0)
    28c0:	4a84           	tst.l d4
    28c2:	6f2c           	ble.s 28f0 <memset+0xca>
		*ptr++ = val;
    28c4:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    28c8:	7201           	moveq #1,d1
    28ca:	b284           	cmp.l d4,d1
    28cc:	6c22           	bge.s 28f0 <memset+0xca>
		*ptr++ = val;
    28ce:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    28d2:	7402           	moveq #2,d2
    28d4:	b484           	cmp.l d4,d2
    28d6:	6c18           	bge.s 28f0 <memset+0xca>
		*ptr++ = val;
    28d8:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    28dc:	7c03           	moveq #3,d6
    28de:	bc84           	cmp.l d4,d6
    28e0:	6c0e           	bge.s 28f0 <memset+0xca>
		*ptr++ = val;
    28e2:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    28e6:	7204           	moveq #4,d1
    28e8:	b284           	cmp.l d4,d1
    28ea:	6c04           	bge.s 28f0 <memset+0xca>
		*ptr++ = val;
    28ec:	1545 0005      	move.b d5,5(a2)
}
    28f0:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    28f4:	4e75           	rts

000028f6 <strlen>:
{
    28f6:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    28fa:	7000           	moveq #0,d0
	while(*s++)
    28fc:	4a10           	tst.b (a0)
    28fe:	6708           	beq.s 2908 <strlen+0x12>
		t++;
    2900:	5280           	addq.l #1,d0
	while(*s++)
    2902:	4a30 0800      	tst.b (0,a0,d0.l)
    2906:	66f8           	bne.s 2900 <strlen+0xa>
}
    2908:	4e75           	rts
    290a:	4e71           	nop

0000290c <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    290c:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    2910:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    2914:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    2918:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    291c:	d041           	add.w d1,d0
	swap	d0
    291e:	4840           	swap d0
	clrw	d0
    2920:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    2922:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    2926:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    292a:	d081           	add.l d1,d0

	rts
    292c:	4e75           	rts

0000292e <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    292e:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    2930:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    2934:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    2938:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    293e:	6416           	bcc.s 2956 <__udivsi3+0x28>
	movel	d0, d2
    2940:	2400           	move.l d0,d2
	clrw	d2
    2942:	4242           	clr.w d2
	swap	d2
    2944:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    2946:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    2948:	3002           	move.w d2,d0
	swap	d0
    294a:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    294c:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    2950:	84c1           	divu.w d1,d2
	movew	d2, d0
    2952:	3002           	move.w d2,d0
	jra	6f
    2954:	6030           	bra.s 2986 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    2956:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    2958:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    295a:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    295c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    2962:	64f4           	bcc.s 2958 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    2964:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    2966:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    296c:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    296e:	c2c0           	mulu.w d0,d1
	swap	d2
    2970:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    2972:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    2974:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    2976:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    2978:	660a           	bne.s 2984 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    297a:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    297c:	6506           	bcs.s 2984 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    297e:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    2982:	6302           	bls.s 2986 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    2984:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    2986:	241f           	move.l (sp)+,d2
	rts
    2988:	4e75           	rts

0000298a <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    298a:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    298c:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    298e:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    2992:	6a04           	bpl.s 2998 <__divsi3+0xe>
	negl	d1
    2994:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    2996:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    2998:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    299c:	6a04           	bpl.s 29a2 <__divsi3+0x18>
	negl	d0
    299e:	4480           	neg.l d0
	negb	d2
    29a0:	4402           	neg.b d2

2:	movel	d1, sp@-
    29a2:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    29a4:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    29a6:	6186           	bsr.s 292e <__udivsi3>
	addql	IMM (8), sp
    29a8:	508f           	addq.l #8,sp

	tstb	d2
    29aa:	4a02           	tst.b d2
	jpl	3f
    29ac:	6a02           	bpl.s 29b0 <__divsi3+0x26>
	negl	d0
    29ae:	4480           	neg.l d0

3:	movel	sp@+, d2
    29b0:	241f           	move.l (sp)+,d2
	rts
    29b2:	4e75           	rts

000029b4 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    29b4:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    29b8:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    29bc:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    29be:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    29c0:	61c8           	bsr.s 298a <__divsi3>
	addql	IMM (8), sp
    29c2:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    29c4:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    29c8:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    29ca:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    29cc:	6100 ff3e      	bsr.w 290c <__mulsi3>
	addql	IMM (8), sp
    29d0:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    29d2:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    29d6:	9280           	sub.l d0,d1
	movel	d1, d0
    29d8:	2001           	move.l d1,d0
	rts
    29da:	4e75           	rts

000029dc <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    29dc:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    29e0:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    29e4:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    29e6:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    29e8:	6100 ff44      	bsr.w 292e <__udivsi3>
	addql	IMM (8), sp
    29ec:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    29ee:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    29f2:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    29f4:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    29f6:	6100 ff14      	bsr.w 290c <__mulsi3>
	addql	IMM (8), sp
    29fa:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    29fc:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    2a00:	9280           	sub.l d0,d1
	movel	d1, d0
    2a02:	2001           	move.l d1,d0
	rts
    2a04:	4e75           	rts

00002a06 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    2a06:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    2a08:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    2a0c:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    2a10:	2c5f           	movea.l (sp)+,a6
    rts
    2a12:	4e75           	rts

00002a14 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    2a14:	16c0           	move.b d0,(a3)+
	rts
    2a16:	4e75           	rts

00002a18 <saveregs>:
	...

00002a54 <font2distance>:
    2a54:	0505           	btst d2,d5
    2a56:	0505           	btst d2,d5
    2a58:	0505           	btst d2,d5
    2a5a:	0505           	btst d2,d5
    2a5c:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    2a5e:	0505           	btst d2,d5
    2a60:	0505           	btst d2,d5
    2a62:	0005 0505      	ori.b #5,d5
    2a66:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    2a68:	0505           	btst d2,d5
    2a6a:	0505           	btst d2,d5
    2a6c:	0505           	btst d2,d5
    2a6e:	0505           	btst d2,d5
    2a70:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    2a72:	0505           	btst d2,d5
    2a74:	0505           	btst d2,d5
    2a76:	0505           	btst d2,d5
    2a78:	0505           	btst d2,d5
    2a7a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    2a7c:	0500           	btst d2,d0
    2a7e:	0505           	btst d2,d5
    2a80:	0505           	btst d2,d5
    2a82:	0505           	btst d2,d5
    2a84:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    2a86:	0505           	btst d2,d5
    2a88:	0505           	btst d2,d5
    2a8a:	0505           	btst d2,d5
    2a8c:	0505           	btst d2,d5
    2a8e:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    2a90:	0505           	btst d2,d5
    2a92:	0505           	btst d2,d5
    2a94:	0503           	btst d2,d3
    2a96:	0505           	btst d2,d5
    2a98:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    2a9a:	0505           	btst d2,d5
    2a9c:	0500           	btst d2,d0
    2a9e:	0505           	btst d2,d5
    2aa0:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    2aa4:	0505           	btst d2,d5
    2aa6:	0503           	btst d2,d3
    2aa8:	0205 0507      	andi.b #7,d5
    2aac:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    2aae:	0505           	btst d2,d5
    2ab0:	0505           	btst d2,d5
    2ab2:	0505           	btst d2,d5
    2ab4:	0505           	btst d2,d5
    2ab6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2ab8:	0505           	btst d2,d5
    2aba:	0505           	btst d2,d5
    2abc:	0505           	btst d2,d5
    2abe:	0505           	btst d2,d5
    2ac0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2ac2:	0505           	btst d2,d5
    2ac4:	0505           	btst d2,d5
    2ac6:	0505           	btst d2,d5
    2ac8:	0505           	btst d2,d5
    2aca:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2acc:	0505           	btst d2,d5
    2ace:	0505           	btst d2,d5
    2ad0:	0505           	btst d2,d5
    2ad2:	0505           	btst d2,d5
    2ad4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2ad6:	0505           	btst d2,d5
    2ad8:	0505           	btst d2,d5
    2ada:	0505           	btst d2,d5
    2adc:	0505           	btst d2,d5
    2ade:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2ae0:	0505           	btst d2,d5
    2ae2:	0505           	btst d2,d5
    2ae4:	0505           	btst d2,d5
    2ae6:	0505           	btst d2,d5
    2ae8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2aea:	0505           	btst d2,d5
    2aec:	0505           	btst d2,d5
    2aee:	0505           	btst d2,d5
    2af0:	0505           	btst d2,d5
    2af2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2af4:	0505           	btst d2,d5
    2af6:	0505           	btst d2,d5
    2af8:	0505           	btst d2,d5
    2afa:	0505           	btst d2,d5
    2afc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2afe:	0505           	btst d2,d5
    2b00:	0505           	btst d2,d5
    2b02:	0505           	btst d2,d5
    2b04:	0505           	btst d2,d5
    2b06:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b08:	0505           	btst d2,d5
    2b0a:	0505           	btst d2,d5
    2b0c:	0505           	btst d2,d5
    2b0e:	0505           	btst d2,d5
    2b10:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b12:	0505           	btst d2,d5
    2b14:	0505           	btst d2,d5
    2b16:	0505           	btst d2,d5
    2b18:	0505           	btst d2,d5
    2b1a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b1c:	0505           	btst d2,d5
    2b1e:	0505           	btst d2,d5
    2b20:	0505           	btst d2,d5
    2b22:	0505           	btst d2,d5
    2b24:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b26:	0505           	btst d2,d5
    2b28:	0505           	btst d2,d5
    2b2a:	0505           	btst d2,d5
    2b2c:	0505           	btst d2,d5
    2b2e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b30:	0505           	btst d2,d5
    2b32:	0505           	btst d2,d5
    2b34:	0505           	btst d2,d5
    2b36:	0505           	btst d2,d5
    2b38:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b3a:	0505           	btst d2,d5
    2b3c:	0505           	btst d2,d5
    2b3e:	0505           	btst d2,d5
    2b40:	0505           	btst d2,d5
    2b42:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2b44:	0505           	btst d2,d5
    2b46:	0505           	btst d2,d5
    2b48:	0505           	btst d2,d5
    2b4a:	0505           	btst d2,d5
    2b4c:	0505           	btst d2,d5

00002b4e <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    2b4e:	16c0           	move.b d0,(a3)+
  RTS
    2b50:	4e75           	rts

00002b52 <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    2b52:	48f9 7fff 0000 	movem.l d0-a6,2a18 <saveregs>
    2b58:	2a18 
  lea 0xdff000,a5
    2b5a:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddc029>,a5
  move.l sp@(4),a0  //Fontlocation
    2b60:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    2b64:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    2b68:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    2b6c:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    2b6e:	082d 0006 0002 	btst #6,2(a5)

00002b74 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    2b74:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    2b7a:	66f8           	bne.s 2b74 <st2wblit>

00002b7c <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    2b7c:	7019           	moveq #25,d0
	sub.l d5,d5      
    2b7e:	9a85           	sub.l d5,d5

00002b80 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    2b80:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    2b82:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    2b84:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    2b88:	9dce           	suba.l a6,a6
	move.l d2, a6
    2b8a:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    2b8c:	ddfc 0000 2a54 	adda.l #10836,a6

	LSL  	#4,d2 	    //Fetch next char
    2b92:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    2b94:	2842           	movea.l d2,a4


	move.l  #0,d4
    2b96:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    2b98:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    2b9a:	3814           	move.w (a4),d4
	swap	d4
    2b9c:	4844           	swap d4
	lsr.l	d5, d4
    2b9e:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    2ba0:	8993           	or.l d4,(a3)
	clr.l	d4
    2ba2:	4284           	clr.l d4
	move.w  2(a4), d4
    2ba4:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    2ba8:	4844           	swap d4
	lsr.l	d5, d4
    2baa:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    2bac:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    2bb0:	4284           	clr.l d4
	move.w  4(a4), d4
    2bb2:	382c 0004      	move.w 4(a4),d4
	swap	d4
    2bb6:	4844           	swap d4
	lsr.l	d5, d4
    2bb8:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    2bba:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    2bbe:	4284           	clr.l d4
	move.w  6(a4), d4
    2bc0:	382c 0006      	move.w 6(a4),d4
	swap	d4
    2bc4:	4844           	swap d4
	lsr.l	d5, d4
    2bc6:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    2bc8:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    2bcc:	4284           	clr.l d4
	move.w  8(a4), d4
    2bce:	382c 0008      	move.w 8(a4),d4
	swap	d4
    2bd2:	4844           	swap d4
	lsr.l	d5, d4
    2bd4:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    2bd6:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    2bda:	4284           	clr.l d4
	move.w  10(a4), d4
    2bdc:	382c 000a      	move.w 10(a4),d4
	swap	d4
    2be0:	4844           	swap d4
	lsr.l	d5, d4
    2be2:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    2be4:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    2be8:	4284           	clr.l d4
	move.w  12(a4), d4
    2bea:	382c 000c      	move.w 12(a4),d4
	swap	d4
    2bee:	4844           	swap d4
	lsr.l	d5, d4
    2bf0:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    2bf2:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    2bf6:	4284           	clr.l d4
	move.w  14(a4), d4
    2bf8:	382c 000e      	move.w 14(a4),d4
	swap	d4
    2bfc:	4844           	swap d4
	lsr.l	d5, d4
    2bfe:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    2c00:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    2c04:	4284           	clr.l d4

	add.b   (a6), d5
    2c06:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    2c08:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    2c0c:	6500 0006      	bcs.w 2c14 <noadditionalchar>
	addq.w  #1, a3
    2c10:	524b           	addq.w #1,a3
	sub.w   #8,d5
    2c12:	5145           	subq.w #8,d5

00002c14 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    2c14:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    2c16:	51c8 ff68      	dbf d0,2b80 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    2c1a:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    2c1e:	51cb ff5c      	dbf d3,2b7c <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    2c22:	4cfa 7fff fdf2 	movem.l 2a18 <saveregs>(pc),d0-a6

	RTS
    2c28:	4e75           	rts
